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
mSEDACost_NoContract=120
BLmodel= modelObjects.Bilevel_Model(f2d,mSEDACost_NoContract)

BilevelFunctions.DA_RT_Model(BLmodel,mSEDA_COMP,mGDA_COMP,mGRT_COMP)
#BilevelFunctions.DA_Model(BLmodel,mEDA_COMP,mGDA_COMP)


#--- Find No Contract Cost
BilevelFunctions.Find_NC_Profit(BLmodel)
BLmodel.model.write(defaults.folder+'/LPModels/BLmodel.lp')

#--- Solve with current contract

BLmodel.model.optimize()
df_var,df_con=BilevelFunctions.get_Var_Con(BLmodel)
print(df_var[df_var.Name.str.contains('ContractPrice')])

BilevelFunctions.Loop_Contracts_Price(BLmodel)

# Copy New Contracts to actual contracts for sequential market clearings

New_contracts=pd.read_csv(defaults.SCdata_NoPrice_OUT,index_col='SC_ID')

# Remove extra info
New_contracts=New_contracts.drop(['MIPGap','GasProfit','mSEDACost','time'],axis=1)
# Remove not working contracts
New_contracts = New_contracts[np.isfinite(New_contracts['lambdaC'])]

New_contracts.to_csv(defaults.SCdata)  

