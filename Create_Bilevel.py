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

#BilevelFunctions.DA_Model(BLmodel,mEDA_COMP,mGDA_COMP)

BilevelFunctions.Find_NC_Profit(BLmodel)

BLmodel.model.setParam( 'OutputFlag',False )
BLmodel.model.optimize()

df_var,df_con=BilevelFunctions.get_Var_Con(BLmodel)





#Contract_name = 'ContractPrice(ng102)'
#var = BLmodel.model.getVarByName(Contract_name)
#var.LB = 0
#var.UB = 2000



df_var,df_con=BilevelFunctions.get_Var_Con(BLmodel)

Contract_name = 'ContractPrice(ng102)'
var = BLmodel.model.getVarByName(Contract_name)

print(var.x)

#contractprices=list(np.linspace(0,10,num=20,endpoint=False))
#contractprices=[1, 2, 4, 9]
##contractprices=[3.99, 4, 4.01]
#for i in contractprices:
#
#    Contract_name ='ContractPrice(ng102)'
#    var=BLmodel.model.getVarByName(Contract_name)
#    var.LB=i
#    var.UB=i
#    var.Start=i
#    
#    BLmodel.model.Params.timelimit = 50.0
#    BLmodel.model.Params.MIPFocus = 2
##    BLmodel.model.Params.DegenMoves=3
##    BLmodel.model.Params.Disconnected=2
##    BLmodel.model.Params.Heuristics = 0.9
#    BLmodel.model.setParam( 'OutputFlag', False)
#    BLmodel.model.optimize() 
#
#
#    
#    if BLmodel.model.status==2:
#        t='t3'
##        BilevelFunctions.CompareBLmodelObjective_DA(BLmodel)
##        BilevelFunctions.Compare_SEDA_DUAL_OBJ_DA(BLmodel)
##        BilevelFunctions.PrintInfo(BLmodel)
##        BilevelFunctions.PrintDispatchatTime(t,BLmodel)
#    
#        print('\n')
#    else:
#        print('Contract Price {0} Failed!'.format(i))
#
#
## Reset the Contract limits
#Contract_name = 'ContractPrice(ng102)'
#var = BLmodel.model.getVarByName(Contract_name)
#var.LB = 0
#var.UB = 3000
#var.Start=0
#BLmodel.model.reset()
#BLmodel.model.update()


#df_var,df_con=BilevelFunctions.get_Var_Con(BLmodel)
#print(df[df.Name.str.startswith(('Pgen','WindDA','lambda_gas_balance','gprod'))])
#df[df.Name.str.contains(('lambda_gas_balance'))]
#df_var.Initial.sort_values()
#con = next(iter(mSEDA_COMP.model.getConstrs()))

#--- Loop over different contracts and determine the price
#
BLmodel = BilevelFunctions.Loop_Contracts_Price(BLmodel)
#df_var,df_con=BilevelFunctions.get_Var_Con(BLmodel)
#





