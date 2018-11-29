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

mSEDA = modelObjects.StochElecDA(bilevel=True)
dispatchElecDA=mSEDA.optimize()

f2d = False

mGDA = modelObjects.GasDA(dispatchElecDA,f2d)
dispatchGasDA=mGDA.optimize()

mERT = modelObjects.ElecRT(dispatchElecDA,bilevel=True)
dispatchElecRT=mERT.optimize()
   
mGRT = modelObjects.GasRT(dispatchGasDA,dispatchElecRT,f2d)
mGRT.optimize()


mEDA_COMP = modelObjects.ElecDA(comp=True,bilevel=True)
mSEDA_COMP = modelObjects.StochElecDA(comp=True,bilevel=True)
mGDA_COMP = modelObjects.GasDA(dispatchElecDA,f2d,comp=True)
mERT_COMP = modelObjects.ElecRT(dispatchElecDA,comp=True,bilevel=True)
mGRT_COMP = modelObjects.GasRT(dispatchGasDA,dispatchElecRT,f2d,comp=True)


mEDA_COMP.optimize()
mSEDA_COMP.optimize()
mGDA_COMP.optimize()
mERT_COMP.optimize()
mGRT_COMP.optimize() 
#



#--- Bilevel Model (All subproblems together)
       
f2d=False         
Profit_NoContract=708
BLmodel= modelObjects.Bilevel_Model(f2d,Profit_NoContract)

BilevelFunctions.DA_RT_Model(BLmodel,mSEDA_COMP,mGDA_COMP,mGRT_COMP)


print('Finding the Profit with no contracts')
    # Find the no contract profit by setting all the contract sizes to 0 and 
All_SCdata = pd.read_csv(defaults.SCdata)
All_SCdata.lambdaC=All_SCdata.lambdaC.astype(float)
Sc2Gen = list()
for sc in All_SCdata.GasNode:
    Sc2Gen.append( BLmodel.edata.Map_Gn2Eg[sc])
        
All_SCdata['GFPP']=pd.DataFrame(Sc2Gen)         
All_SCdata.set_index(['SC_ID','GFPP'], inplace=True) 
contract=All_SCdata.index.get_level_values(0)[0]
Generators=All_SCdata.index.get_level_values(1).tolist()
for g in Generators:
    All_SCdata.at[(contract,g),'PcMin']=0.0
    All_SCdata.at[(contract,g),'PcMax']=0.0
    
SCdata = All_SCdata.iloc[All_SCdata.index.get_level_values(0) == contract]
        
SCP = defaultdict(list)
      
for sc in SCdata.index:
    for t in BLmodel.edata.time:
        tt = BLmodel.edata.time.index(t)+1
        SCP[sc,t] = 0.0      
#        SCP[sc,t] = 1.0 if (tt >= SCdata.ts[sc] and tt<= SCdata.te[sc]) else 0.0
         
BilevelFunctions.Change_ContractParameters(BLmodel,SCdata,SCP)


#   Get Variables
Profit = BLmodel.model.getVarByName('Profit')
ContractPrice=BLmodel.model.getVarByName('ContractPrice(ng101)')

#   Remove the profit limit becuase this run is to find the limit and model was built with arbitrary limit
con=BLmodel.model.getConstrByName('ProfitLimit')



Contract_Zero=BLmodel.model.addConstr(ContractPrice==0.0,name='Contract_zero')

for t in BLmodel.edata.time:
    name='dLag/gprod(gw1,k0,{0})'.format(t)
    con=BLmodel.model.getConstrByName(name)
    con_row=BLmodel.model.getRow(con)
    new_con=BilevelFunctions.Get_LHS_Constraint(con_row)
    var=BLmodel.model.getVarByName('gprod(gw1,k0,{0})'.format(t))
    new_con+=2*BLmodel.gdata.wellsinfo.Cost['gw1']*var
    BLmodel.model.remove(con)
    BLmodel.model.addConstr(new_con==0,name=name)
    

    for s in BLmodel.edata.scenarios:
        
        varUp=BLmodel.model.getVarByName('gprodUp(gw1,{1},{0})'.format(t,s))
        varDn=BLmodel.model.getVarByName('gprodDn(gw1,{1},{0})'.format(t,s))
        
        name='dLag/gprodUp(gw1,{1},{0})'.format(t,s)
        con=BLmodel.model.getConstrByName(name)
        con_row=BLmodel.model.getRow(con)
        new_con=BilevelFunctions.Get_LHS_Constraint(con_row)
        P_UP=defaults.RESERVES_UP_PREMIUM_GASWELL
        Prob=BLmodel.edata.scen_wgp[s][2]
        Cost=BLmodel.gdata.wellsinfo.Cost['gw1']
        new_con+=2*P_UP*Prob*Cost*(var+varUp-varDn)
        BLmodel.model.remove(con)
        BLmodel.model.addConstr(new_con==0,name=name)

        name='dLag/gprodDn(gw1,{1},{0})'.format(t,s)
        con=BLmodel.model.getConstrByName(name)
        con_row=BLmodel.model.getRow(con)
        new_con=BilevelFunctions.Get_LHS_Constraint(con_row)
        P_DN=defaults.RESERVES_DN_PREMIUM_GASWELL
        Prob=BLmodel.edata.scen_wgp[s][2]
        Cost=BLmodel.gdata.wellsinfo.Cost['gw1']
        new_con-=2*P_DN*Prob*Cost*(var+varUp-varDn)
        BLmodel.model.remove(con)
        BLmodel.model.addConstr(new_con==0,name=name)
        
#        new_con+=1e-6*(varUp+varDn)

BLmodel.model.write(defaults.folder+'/LPModels/BLmodel.lp')
BLmodel.model.update()
BLmodel.model.reset()

#BLmodel.model.Params.timelimit = 200.0
#BLmodel.model.Params.Method = 2
#BLmodel.model.Params.BranchDir = -1
#BLmodel.model.Params.DegenMoves=10
#BLmodel.model.params.AggFill = 10
#BLmodel.model.params.Presolve = 2
#BLmodel.model.setParam('PreSOS1BigM',1e10)
#BLmodel.model.setParam('ImproveStartTime',50)
#BLmodel.model.setParam( 'MIPFocus',3 )
BLmodel.model.setParam( 'OutputFlag',True )
#BLmodel.model.save('model.mst')

BLmodel.model.optimize()

df_var,df_con=BilevelFunctions.get_Var_Con(BLmodel)