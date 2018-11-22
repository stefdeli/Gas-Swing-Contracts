
from collections import defaultdict
import GasData_Load, ElecData_Load
import LibVars
import LibCns_Elec, LibCns_Gas
import LibObjFunct 
import KKTizer
import GetResults
import gurobipy as gb
import pandas as pd
import numpy as np
import itertools
import pickle
import re
import defaults
import BilevelFunctions
import modelObjects



# Stochastic Day-ahead Electricity dispatch
class expando(object):
    pass






mSEDA = modelObjects.StochElecDA(bilevel=True)
dispatchElecDA=mSEDA.optimize()

mSEDA_COMP = modelObjects.StochElecDA(comp=True,bilevel=True)
mSEDA_COMP.optimize()

# flow2dir = True : Bi-directional flow on gas pipelines
# flow2dir = False: Uni-directional flow on gas pipelines (from sending to receiving node)

f2d = False

mGDA = modelObjects.GasDA(dispatchElecDA,f2d)
dispatchGasDA=mGDA.optimize()

mGDA_COMP = modelObjects.GasDA(dispatchElecDA,f2d,comp=True)
mGDA_COMP.optimize()

mERT = modelObjects.ElecRT(dispatchElecDA,bilevel=True)
dispatchElecRT=mERT.optimize()
   
mERT_COMP = modelObjects.ElecRT(dispatchElecDA,comp=True,bilevel=True)
mERT_COMP.optimize()

mGRT = modelObjects.GasRT(dispatchGasDA,dispatchElecRT,f2d)
mGRT.optimize()

mGRT_COMP = modelObjects.GasRT(dispatchGasDA,dispatchElecRT,f2d,comp=True)
mGRT_COMP.optimize() 
#

##--- Load Existing Models ( and resolve)
folder=defaults.folder+'/LPModels/'
#
##--- Comp models
#mSEDA_COMP=expando()
#mGDA_COMP=expando()
#mGRT_COMP=expando()
#
#mSEDA_COMP.model = gb.read(folder+'mSEDA_COMP.lp')
#mGDA_COMP.model = gb.read(folder+'mGDA_COMP.lp')
#mGRT_COMP.model = gb.read(folder+'mGRT_COMP.lp')


#--- Bilevel Model (All subproblems together)
       
f2d=False         
BLmodel=BilevelFunctions.Bilevel_Model(f2d)

print('Adding Variables')
BilevelFunctions.Add_Vars(BLmodel,mSEDA_COMP)
BilevelFunctions.Add_Vars(BLmodel,mGDA_COMP)
BilevelFunctions.Add_Vars(BLmodel,mGRT_COMP)     

print('Adding Constraints')
BilevelFunctions.Add_Constrs(BLmodel,mSEDA_COMP)
BilevelFunctions.Add_Constrs(BLmodel,mGDA_COMP)
BilevelFunctions.Add_Constrs(BLmodel,mGRT_COMP)

print('Adding Objective')

BilevelFunctions.Add_Obj(BLmodel,mSEDA_COMP)
BilevelFunctions.Add_Obj(BLmodel,mGDA_COMP)
BilevelFunctions.Add_Obj(BLmodel,mGRT_COMP)

#BLmodel.model.optimize() 
#BLmodel.model.reset()

# LINK PROBLEMS AND INTRODUCE NEW VARIABLE

# Add contract pricce for every gas node with generator
gas_nodes = list(BLmodel.edata.Map_Eg2Gn.values())
# result may be list of lists, so flatted
flat_list = [item for sublist in gas_nodes for item in sublist]

GasGenNodes=set(flat_list)
for node in GasGenNodes:
    name='ContractPrice({0})'.format(node)
    BLmodel.model.addVar(lb=0.0,name=name)
    BLmodel.model.update()
   
BilevelFunctions.ADD_mSEDA_DA_Linking_Constraints(BLmodel)
BilevelFunctions.ADD_mSEDA_RT_Linking_Constraints(BLmodel)
BilevelFunctions.ADD_mGDA_Linking_Constraints(BLmodel)
BilevelFunctions.ADD_mGRT_Linking_Constraints(BLmodel)       

          


#BLmodel.model.Params.timelimit = 25.0
#BLmodel.model.optimize() 
#BLmodel.model.reset()



#BLmodel.model.Params.DegenMoves=-1
#BLmodel.model.Params.Heuristics=0.05
#BLmodel.model.Params.timelimit = 25.0
#BLmodel.model.Params.MIPFocus=1
#BLmodel.model.Params.StartNodeLimit=1e6
#BLmodel.model.Params.Cuts=1
#BLmodel.model.Params.Presolve=-1
#BLmodel.model.Params.NodeMethod=2
#BLmodel.model.Params.MIPGap=0.5
#BLmodel.model.optimize() 
#BLmodel.model.reset()


Dualobj_mSEDA=BilevelFunctions.Get_Dual_Obj(BLmodel,mSEDA_COMP)
Dualobj_mGDA =BilevelFunctions.Get_Dual_Obj(BLmodel,mGDA_COMP)
Dualobj_mGRT=BilevelFunctions.Get_Dual_Obj(BLmodel,mGRT_COMP)

Obj_mSEDA=BilevelFunctions.Get_Obj(BLmodel,mSEDA_COMP)
Obj_mGDA =BilevelFunctions.Get_Obj(BLmodel,mGDA_COMP)
Obj_mGRT=BilevelFunctions.Get_Obj(BLmodel,mGRT_COMP)


#--- Non gas Generators Objective
gendata = BLmodel.edata.generatorinfo
scenarios = BLmodel.edata.scenarios
scenarioprob={}    
scenarioprob = {s: BLmodel.edata.scen_wgp[s][2] for s in BLmodel.edata.scen_wgp.keys()}    
scengprt = {s: BLmodel.edata.scen_wgp[s][0] for s in BLmodel.edata.scen_wgp.keys()}
P_up=defaults.RESERVES_UP_PREMIUM
P_dn=defaults.RESERVES_DN_PREMIUM
Non_Gas_gencost=0.0
for t in BLmodel.edata.time:
    for s in scenarios:
        var_name='Lshed({0},{1})'.format(s,t)
        Lshed= BLmodel.model.getVarByName(var_name)
        Non_Gas_gencost=Non_Gas_gencost+ scenarioprob[s]*defaults.VOLL * Lshed
        
    for gen in BLmodel.edata.nongfpp:
        var_name='Pgen({0},{1})'.format(gen,t)
        Pgen = BLmodel.model.getVarByName(var_name)
        Non_Gas_gencost=Non_Gas_gencost+gendata.lincost[gen]*Pgen
        
        for s in scenarios:
            RUp_name='RUp({0},{1},{2})'.format(gen,s,t)
            RDn_name='RDn({0},{1},{2})'.format(gen,s,t)
            
            RUp = BLmodel.model.getVarByName(RUp_name)
            RDn = BLmodel.model.getVarByName(RDn_name)
            Temp=scenarioprob[s]*gendata.lincost[gen]*(P_up*RUp-P_dn*RDn)
            Non_Gas_gencost=Non_Gas_gencost+Temp

Non_gen_Income=0.0
for t in BLmodel.edata.time:
    for gn in BLmodel.gdata.gnodes:
        name = 'lambda_gas_balance_da({0},k0,{1})'.format(gn,t)
        GasPrice = BLmodel.model.getVarByName(name)
        Demand= BLmodel.gdata.gasload['ng101']['t1']
        Non_gen_Income=Non_gen_Income+Demand*GasPrice
        

 # Min. Costs - Income
 # Costs = DA Gas Production
 #       + RT Gas Production
 #
 #Income = Non Gen_Income (From normal gas load)
 #       + Gen_Income
 #
 # mSEDA_Obj = Gen_Income + Non_Gas_gencost
 # mSEDA_Obj = mSEDA_DualObj
 # Gen_Income = mSEDA_DualObj - Non_Gas_gencost
 
Obj =  Obj_mGDA +Obj_mGRT -Non_gen_Income - (Dualobj_mSEDA-Non_Gas_gencost)
Obj=  -Non_gen_Income - (Dualobj_mSEDA-Non_Gas_gencost)
  
BLmodel.model.setObjective(Obj  ,gb.GRB.MINIMIZE)

print('Bilevel Model is built')
BLmodel.model.write(folder+'BLmodel.lp')

BLmodel.model.Params.timelimit = 50.0

BLmodel.model.Params.MIPFocus = 1
BLmodel.model.optimize() 

  
df=pd.DataFrame([[var.VarName,var.x] for var in BLmodel.model.getVars() ],columns=['Name','Value'])
Gprod1=df[df.Name.str.contains('ntract')]
Gprod2=df[df.Name.str.contains('gprod\(gw2')]
Gshed=df[df.Name.str.contains('gshed')]  

# Elec
Pgen=df[df.Name.str.match('Pgen\(.*')].Value.rename('Pgen').reset_index(drop=True)
PgenSC=df[df.Name.str.match('PgenSC.*')].Value.rename('PgenSC').reset_index(drop=True)
Wind=df[df.Name.str.match('WindDA.*')].Value.rename('WindDA').reset_index(drop=True)


ElecDA=pd.concat([Pgen,PgenSC,Wind],axis=1)

Wind_s1=BLmodel.edata.windscen['w1']['s1'][BLmodel.edata.time].rename('wind_s1').reset_index(drop=True)*30
Wind_s2=BLmodel.edata.windscen['w1']['s2'][BLmodel.edata.time].rename('wind_s2').reset_index(drop=True)*30

Wind_s1_error= (Wind_s1 - Wind).rename('WindError_s1')
Wind_s2_error= (Wind_s2 - Wind).rename('WindError_s2')

RUp_s1=df[df.Name.str.match('RUp\(.*,s1,.*')].Value.rename('RUp-s1').reset_index(drop=True)
RUp_s2=df[df.Name.str.match('RUp\(.*,s2,.*')].Value.rename('RUp-s2').reset_index(drop=True)
RDn_s1=df[df.Name.str.match('RDn\(.*,s1,.*')].Value.rename('RDn-s1').reset_index(drop=True)
RDn_s2=df[df.Name.str.match('RDn\(.*,s2,.*')].Value.rename('RDn-s2').reset_index(drop=True)
RUpSC_s1=df[df.Name.str.match('RUpSC\(.*,s1,.*')].Value.rename('RUpSC-s1').reset_index(drop=True)
RUpSC_s2=df[df.Name.str.match('RUpSC\(.*,s2,.*')].Value.rename('RUpSC-s2').reset_index(drop=True)
RDnSC_s1=df[df.Name.str.match('RDnSC\(.*,s1,.*')].Value.rename('RDnSC-s1').reset_index(drop=True)
RDnSC_s2=df[df.Name.str.match('RDnSC\(.*,s2,.*')].Value.rename('RDnSC-s2').reset_index(drop=True)

NetR_s1=(RUp_s1+RUpSC_s1 - RDn_s1 -RDnSC_s1).rename('NetR-s1')
NetR_s2=(RUp_s2+RUpSC_s2 - RDn_s2 -RDnSC_s2).rename('NetR-s2')

ElecRT_s1=pd.concat([Wind_s1_error,NetR_s1,RUp_s1,RDn_s1,RUpSC_s1,RDnSC_s1],axis=1)
ElecRT_s2=pd.concat([Wind_s2_error,NetR_s2,RUp_s2,RDn_s2,RUpSC_s2,RDnSC_s2],axis=1)

#Gas - k0
G1_k0=df[df.Name.str.match('gprod\(gw1,k0.*')].Value.rename('gw1_k0').reset_index(drop=True)
G2_k0=df[df.Name.str.match('gprod\(gw2,k0.*')].Value.rename('gw2_k0').reset_index(drop=True)
G3_k0=df[df.Name.str.match('gprod\(gw3,k0.*')].Value.rename('gw3_k0').reset_index(drop=True)

Demand = (Pgen+PgenSC).rename('Demand')*8
GasDA=pd.concat([G1_k0,G2_k0,G3_k0,-Demand],axis=1)

l_DA_101=df[df.Name.str.match('lambda_gas_balance_da\(ng101,k0.*')].Value.rename('da_n101').reset_index(drop=True)
l_DA_102=df[df.Name.str.match('lambda_gas_balance_da\(ng102,k0.*')].Value.rename('da_n102').reset_index(drop=True)
l_RT_101_s1=df[df.Name.str.match('lambda_gas_balance_rt\(ng101,s1.*')].Value.rename('rt_n101_s1').reset_index(drop=True)
l_RT_102_s1=df[df.Name.str.match('lambda_gas_balance_rt\(ng102,s1.*')].Value.rename('rt_n102_s1').reset_index(drop=True)
l_RT_101_s2=df[df.Name.str.match('lambda_gas_balance_rt\(ng101,s2.*')].Value.rename('rt_n101_s2').reset_index(drop=True)
l_RT_102_s2=df[df.Name.str.match('lambda_gas_balance_rt\(ng102,s2.*')].Value.rename('rt_n102_s2').reset_index(drop=True)

LMP_gas=pd.concat([l_DA_101,l_DA_102,l_RT_101_s1,l_RT_102_s1,l_RT_101_s2,l_RT_102_s2],axis=1)



G1_s1_up=df[df.Name.str.match('gprodUp\(gw1,s1.*')].Value.rename('gw1Up_s1').reset_index(drop=True)
G2_s1_up=df[df.Name.str.match('gprodUp\(gw2,s1.*')].Value.rename('gw2Up_s1').reset_index(drop=True)
G3_s1_up=df[df.Name.str.match('gprodUp\(gw3,s1.*')].Value.rename('gw3Up_s1').reset_index(drop=True)
G1_s1_dn=df[df.Name.str.match('gprodDn\(gw1,s1.*')].Value.rename('gw1Dn_s1').reset_index(drop=True)
G2_s1_dn=df[df.Name.str.match('gprodDn\(gw2,s1.*')].Value.rename('gw2Dn_s1').reset_index(drop=True)
G3_s1_dn=df[df.Name.str.match('gprodDn\(gw3,s1.*')].Value.rename('gw3Dn_s1').reset_index(drop=True)
GasRT_s1=pd.concat([NetR_s1*8,G1_s1_up,G1_s1_dn,G2_s1_up,G2_s1_dn,G3_s1_up,G3_s1_dn],axis=1)

G1_s2_up=df[df.Name.str.match('gprodUp\(gw1,s2.*')].Value.rename('gw1Up_s2').reset_index(drop=True)
G2_s2_up=df[df.Name.str.match('gprodUp\(gw2,s2.*')].Value.rename('gw2Up_s2').reset_index(drop=True)
G3_s2_up=df[df.Name.str.match('gprodUp\(gw3,s2.*')].Value.rename('gw3Up_s2').reset_index(drop=True)
G1_s2_dn=df[df.Name.str.match('gprodDn\(gw1,s2.*')].Value.rename('gw1Dn_s2').reset_index(drop=True)
G2_s2_dn=df[df.Name.str.match('gprodDn\(gw2,s2.*')].Value.rename('gw2Dn_s2').reset_index(drop=True)
G3_s2_dn=df[df.Name.str.match('gprodDn\(gw3,s2.*')].Value.rename('gw3Dn_s2').reset_index(drop=True)
GasRT_s2=pd.concat([NetR_s2*8,G1_s2_up,G1_s2_dn,G2_s2_up,G2_s2_dn,G3_s2_up,G3_s2_dn],axis=1)





RDn=df[df.Name.str.contains('RDn\(')]


RUpSC=df[df.Name.str.contains('RUpSC\(')]
RDnSC=df[df.Name.str.contains('RDnSC\(')]   
    
Lambda_elec=df[df.Name.str.contains('lambda_PowerBalance')]
Lambda_gas=df[df.Name.str.contains('lambda_gas_balance')]


#--- Change the Contract Parameters

BLmodel.model.resetParams()
BLmodel.model.Params.timelimit = 100.0
#BLmodel.model.Params.MIPGapAbs=0.05
BLmodel.model.Params.MIPFocus = 1
BLmodel.model.setParam( 'OutputFlag',True )
       
All_SCdata = pd.read_csv(defaults.SCdata_NoPrice)
All_SCdata.lambdaC=All_SCdata.lambdaC.astype(float)
Sc2Gen = list()
for sc in All_SCdata.GasNode:        
    Sc2Gen.append( BLmodel.edata.Map_Gn2Eg[sc])
    
        
All_SCdata['GFPP']=pd.DataFrame(Sc2Gen)         
All_SCdata.set_index(['SC_ID','GFPP'], inplace=True) 
    
all_contracts=All_SCdata.index.get_level_values(0).tolist()
all_contracts_r=list(reversed(all_contracts))
#all_contracts=['sc4','sc5']
#all_contracts_r=[]
for contract in all_contracts_r:
    print ('\n\n########################################################')
    print ('Processing Contract {0}'.format(contract))
    print ('########################################################')
    SCdata = All_SCdata.iloc[All_SCdata.index.get_level_values(0) == contract]
    
    SCP = defaultdict(list)
   
    for sc in SCdata.index:
        for t in BLmodel.edata.time:
            tt = BLmodel.edata.time.index(t)+1            
            SCP[sc,t] = 1.0 if (tt >= SCdata.ts[sc] and tt<= SCdata.te[sc]) else 0.0
       
    BilevelFunctions.Change_ContractParameters(BLmodel,SCdata,SCP)
    
    #BLmodel.model.reset()
    #BLmodel.model.resetParams()

    
    BLmodel.model.optimize() 
    
    Result = {}#defaultdict(dict)    
    if BLmodel.model.status==2:

        GasGenNodes=set(flat_list)
        for node in GasGenNodes:
            name='ContractPrice({0})'.format(node)
            var=BLmodel.model.getVarByName(name)
            Result[node]=np.float(var.x)
    else:
        print('Contract {0}  failed'.format(contract))
        for node in GasGenNodes:
            Result[node]=np.nan
            
        
    for g in SCdata.index.get_level_values(1).tolist():
        GasNode=All_SCdata['GasNode'][(contract,g)]
        
        All_SCdata.at[(contract,g),'lambdaC']=Result[GasNode]
        All_SCdata.at[(contract,g),'time']=BLmodel.model.Runtime
        All_SCdata.at[(contract,g),'MIPGap']=BLmodel.model.MIPGap


All_SCdata.reset_index(level=1, inplace=True)
All_SCdata=All_SCdata.drop(['GFPP'],axis=1)    
All_SCdata.to_csv(defaults.SCdata_NoPrice.replace('.csv','')+'_Complete.csv')    

print(All_SCdata.lambdaC)   
#df=pd.DataFrame([[var.VarName,var.x] for var in model_GDA.model.getVars() ],columns=['Name','Value'])
#Q1=df[df.Name.str.contains('Rup',regex=True)]
#Q1[Q1.Name.str.contains('k0')]
#
#
#df=pd.DataFrame([[var.VarName,var.x] for var in model_GRT.model.getVars() ],columns=['Name','Value'])
#df[df.Name.str.contains('lambda_gas_balan',regex=True)]
#
#df=pd.DataFrame([[con.ConstrName,con] for con in model_GRT.model.getConstrs() ],columns=['Name','Value'])
#Q1=df[df.Name.str.contains('gprodUp_max',regex=True)]
#
#df=pd.DataFrame([[var.VarName,var.x] for var in model_GDA.model.getVars() ],columns=['Name','Value'])
#df[df.Name.str.contains('lambda_gas_balance_da\(ng102,k0',regex=True)]

#
#df=pd.DataFrame([con.ConstrName for con in BLmodel.model.getConstrs() ],columns=['Name'])
#df[df.Name.str.contains('gas_balance_da')]
#
#df=pd.DataFrame([var.VarName for var in BLmodel.model.getVars() ],columns=['Name'])
#df[df.Name.str.contains('RUpSC')]


#
#
#
#
#
#
#df_mSEDA=Compare(BLmodel,mSEDA_COMP) 
#df_mGRT=Compare(BLmodel,mGRT_COMP)
#df_mGDA=Compare(BLmodel,mGDA_COMP)
#    
### CHECK FOR DUAL DEGENERACY Between solution of original 
#
#df=pd.DataFrame()
#for var in mGRT.model.getVars():
#    name=var.VarName
#    value_orig=var.x
#    value_new=BLmodel.getVarByName(name).x
#    
#    error=value_orig-value_new
#     
#    df=df.append(pd.DataFrame([[value_orig, value_new, error]],columns=['orig','new','error'],index=[var.VarName]))
#    
#    
#df=pd.DataFrame()
#for con in mGRT.model.getConstrs():
#    name=con.ConstrName
#    RHS=con.RHS
#    sense=con.Sense
#    dual_orig=con.Pi
#    if sense=='=':
#        dual_new=-BLmodel.getVarByName('lambda_'+name).x
#    elif sense=='>':
#        dual_new=-BLmodel.getVarByName('mu_'+name).x
#    elif sense=='<':       
#        dual_new=-BLmodel.getVarByName('mu_'+name).x
#    
#    dual_obj_orig=dual_orig*RHS
#    dual_obj_new=dual_new*RHS
#    error=dual_orig-dual_new
#     
#    df=df.append(pd.DataFrame([[dual_orig, dual_new, error,sense,dual_obj_orig,dual_obj_new]],columns=['orig','new','error','sense','Obj_1','Obj_2'],index=[var.VarName]))
#    
#
## Rewrite Constraints with links
#
#
#




#
#
#
#
#for t in range(1,24):
#    var=mGDA_COMP.model.getVarByName('lambda_gas_balance_da(ng102,k0,t{0})'.format(t)).x
#    con=mGDA.model.getConstrByName('gas_balance_da(ng102,k0,t{0})'.format(t)).Pi
#    
#    print(var)
#    print(con)
#    
#for t in range(1,24):
#    var=mGRT_COMP.model.getVarByName('lambda_gas_balance_rt(ng102,s1,t{0})'.format(t)).x
#    con=mGRT.model.getConstrByName('gas_balance_rt(ng102,s1,t{0})'.format(t)).Pi
#    
#    print(var)
#    print(con)
#
## Original Problem
#    
#gen='g1'
#    
#m=mSEDA.model.fixed()
#m.optimize()
#
#
#Primal_Pgen = m.getVarByName('Pgen(g1,t1)')
#Primal_lambda_bal=m.getConstrByName('PowerBalance_DA(t1)').Pi
#Primal_Pmax_DA_GFPP_mu=m.getConstrByName('Pmax_DA_GFPP(g1,t1)').Pi
#Primal_Pmin_DA_GFPP_mu=m.getConstrByName('Pmin_DA_GFPP(g1,t1)').Pi
#
#Cost= 8 * 10 #(HR x gas price) = 80
#
## Comp Problem
#
#m=mSEDA_COMP.model
#m.optimize()
#COMP_lambda_bal = m.getVarByName('lambda_PowerBalance_DA(t1)').x
#COMP_Pmax_DA_GFPP_mu=m.getVarByName('mu_Pmax_DA_GFPP(g1,t1)').x
#COMP_Pmin_DA_GFPP_mu=m.getVarByName('mu_Pmin_DA_GFPP(g1,t1)').x
#Cost= 8 * 10 #(HR x gas price) = 80
#






