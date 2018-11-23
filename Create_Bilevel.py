
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



class expando(object):
    pass


#-- All models
mEDA = modelObjects.ElecDA(bilevel=True)
dispatchElecDA=mEDA.optimize()

mEDA_COMP = modelObjects.ElecDA(comp=True,bilevel=True)
mEDA_COMP.optimize()

mSEDA = modelObjects.StochElecDA(bilevel=True)
dispatchElecDA=mSEDA.optimize()

mSEDA_COMP = modelObjects.StochElecDA(comp=True,bilevel=True)
mSEDA_COMP.optimize()

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

#--- Load LP modles
#--- Load Existing Models ( and resolve)
folder=defaults.folder+'/LPModels/'
#--- Comp models
mEDA_COMP=expando()
mGDA_COMP=expando()

mEDA_COMP.model = gb.read(folder+'mEDA_COMP.lp')
mGDA_COMP.model = gb.read(folder+'mGDA_COMP.lp')


#--- Bilevel Model (All subproblems together)
       
f2d=False         
BLmodel= modelObjects.Bilevel_Model(f2d)

BilevelFunctions.DA_RT_Model(BLmodel,mSEDA_COMP,mGDA_COMP,mGRT_COMP)
#BilevelFunctions.DA_Model(BLmodel,mEDA_COMP,mGDA_COMP)



contractprices=list(np.linspace(2,10,num=20,endpoint=True))
for i in contractprices:

    Contract_name ='ContractPrice(ng102)'
    var=BLmodel.model.getVarByName(Contract_name)
    var.LB=i
    var.UB=i
    
    BLmodel.model.Params.timelimit = 50.0
    BLmodel.model.Params.MIPFocus = 3
    BLmodel.model.setParam( 'OutputFlag', False)
    BLmodel.model.optimize() 
    
    CostDA = 0.0
    for t in BLmodel.edata.time:
        for gw in BLmodel.gdata.wells:
            var_name = 'gprod({0},{1},{2})'.format(gw,'k0',t)
            var=BLmodel.model.getVarByName(var_name)
            CostDA= CostDA + BLmodel.gdata.wellsinfo.Cost[gw]*var.x
            
        for gn in BLmodel.gdata.gnodes:
            for k in ['k0','k1','k2']:
                var_name = 'gshed_da({0},{1},{2})'.format(gn,k,t)
                var=BLmodel.model.getVarByName(var_name)
                CostDA= CostDA + defaults.VOLL*var.x
                
        for gn in BLmodel.gdata.gnodes:
            for k in ['k0','k1','k2']:
                var_name = 'gshed_da({0},{1},{2})'.format(gn,k,t)
                var=BLmodel.model.getVarByName(var_name)
                CostDA= CostDA + defaults.VOLL*var.x

    CostRT = 0.0
    for t in BLmodel.edata.time:
        for gw in BLmodel.gdata.wells:
            for s in BLmodel.edata.scenarios:
                var_name_up = 'gprodUp({0},{1},{2})'.format(gw,s,t)
                var_name_dn = 'gprodDn({0},{1},{2})'.format(gw,s,t)
                
                var_up=BLmodel.model.getVarByName(var_name_up)
                var_dn=BLmodel.model.getVarByName(var_name_dn)
                Prob=BLmodel.edata.scen_wgp[s][2]
                CostRT= CostRT + Prob*BLmodel.gdata.wellsinfo.Cost[gw]*(var_up.x-var_dn.x)
            

                
                
    IncomeDA    = 0.0
    IncomeSCDA  = 0.0
    for t in BLmodel.edata.time:
        for gen in BLmodel.edata.gfpp:
            var_name = 'Pgen({0},{1})'.format(gen,t)
            Lambda_name ='lambda_gas_balance_da({0},{1},{2})'.format(BLmodel.edata.generatorinfo.origin_gas[gen],'k0',t)
            var=BLmodel.model.getVarByName(var_name)
            price=BLmodel.model.getVarByName(Lambda_name)
            IncomeDA = IncomeDA  + 8*price.x*var.x
            
            var_name = 'PgenSC({0},{1})'.format(gen,t)
            Contract_name ='ContractPrice({0})'.format(BLmodel.edata.generatorinfo.origin_gas[gen])
            var=BLmodel.model.getVarByName(var_name)
            contract=BLmodel.model.getVarByName(Contract_name)
            IncomeSCDa = IncomeSCDA  + 8*contract.x*var.x

                
    IncomeRT    = 0.0
    IncomeSCRT  = 0.0
    for t in BLmodel.edata.time:
        for gen in BLmodel.edata.gfpp:
            for s in BLmodel.edata.scenarios:
                
                Prob=BLmodel.edata.scen_wgp[s][2]
                
                var_name_up = 'RUp({0},{1},{2})'.format(gen,s,t)
                var_name_dn = 'RDn({0},{1},{2})'.format(gen,s,t)
                
                var_up=BLmodel.model.getVarByName(var_name_up)
                var_dn=BLmodel.model.getVarByName(var_name_dn)
                
                Lambda_name ='lambda_gas_balance_rt({0},{1},{2})'.format(BLmodel.edata.generatorinfo.origin_gas[gen],s,t)
                price=BLmodel.model.getVarByName(Lambda_name)   
                
                IncomeRT = IncomeRT  + Prob*8*price.x*(var_up.x-var_dn.x)
                
            
                var_name_up = 'RUpSC({0},{1},{2})'.format(gen,s,t)
                var_name_dn = 'RDnSC({0},{1},{2})'.format(gen,s,t)
                
                var_up=BLmodel.model.getVarByName(var_name_up)
                var_dn=BLmodel.model.getVarByName(var_name_dn)
            
                Contract_name ='ContractPrice({0})'.format(BLmodel.edata.generatorinfo.origin_gas[gen])
                contract=BLmodel.model.getVarByName(Contract_name)
                IncomeSCRT = IncomeSCRT  + Prob*8*contract.x*(var_up.x-var_dn.x)
       
    
    
    Profit = CostDA+CostRT-IncomeDA-IncomeSCDA-IncomeRT-IncomeSCRT
    
#    print('Contract:{3:.2f} \t Profit={4:.2f} \tCost={0:.2f} \t Income={1:.2f} \t IncomeSC={2:.2f}'.format(Cost,Income,IncomeSC,contract.x,-Profit))
#    print('Contract:{2:.2f} \tDual:{0:.2f} \t Calc:{1:.2f} \t Error:{3:.2e}'.format(BLmodel.model.ObjVal,Profit,contract.x,BLmodel.model.ObjVal-Profit))
    print('Contract:{1:.2f} \tDual:{0:.2f} \t Calc{2:.2f}'.format(BLmodel.model.ObjVal,contract.x,Profit))
          
R=BilevelFunctions.GetDispatch(BLmodel)



#Contract_name ='ContractPrice(ng102)'
#var=BLmodel.model.getVarByName(Contract_name)
#var.LB=0
#var.UB=2000
#BLmodel.model.reset()
##BLmodel.model.update()
#
#  
df=pd.DataFrame([[var.VarName,var.x,var.Start] for var in BLmodel.model.getVars() ],columns=['Name','Value','Initial'])
df[df.Name.str.contains(('gprod'))]

##print(df[df.Name.str.startswith(('Pgen','WindDA','lambda_gas_balance','gprod'))])
#
#
#BLmodel = BilevelFunctions.Loop_Contracts_Price(BLmodel)
#
#
#df=pd.DataFrame([[var.VarName,var.x,var.Start] for var in BLmodel.model.getVars() ],columns=['Name','Value','Initial'])
#df.Initial.sort_values()
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






