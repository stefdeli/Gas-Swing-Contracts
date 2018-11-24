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
#mEDA_COMP.optimize()

mSEDA = modelObjects.StochElecDA(bilevel=True)
dispatchElecDA=mSEDA.optimize()

mSEDA_COMP = modelObjects.StochElecDA(comp=True,bilevel=True)
#mSEDA_COMP.optimize()

f2d = False

mGDA = modelObjects.GasDA(dispatchElecDA,f2d)
dispatchGasDA=mGDA.optimize()

mGDA_COMP = modelObjects.GasDA(dispatchElecDA,f2d,comp=True)
#mGDA_COMP.optimize()

mERT = modelObjects.ElecRT(dispatchElecDA,bilevel=True)
dispatchElecRT=mERT.optimize()
   
mERT_COMP = modelObjects.ElecRT(dispatchElecDA,comp=True,bilevel=True)
#mERT_COMP.optimize()

mGRT = modelObjects.GasRT(dispatchGasDA,dispatchElecRT,f2d)
mGRT.optimize()

mGRT_COMP = modelObjects.GasRT(dispatchGasDA,dispatchElecRT,f2d,comp=True)
#mGRT_COMP.optimize() 
#



#--- Bilevel Model (All subproblems together)
       
f2d=False         
BLmodel= modelObjects.Bilevel_Model(f2d)

BilevelFunctions.DA_RT_Model(BLmodel,mSEDA_COMP,mGDA_COMP,mGRT_COMP)
#BilevelFunctions.DA_Model(BLmodel,mEDA_COMP,mGDA_COMP)

contractprices=list(np.linspace(4,10,num=1,endpoint=False))
for i in contractprices:

    Contract_name ='ContractPrice(ng102)'
    var=BLmodel.model.getVarByName(Contract_name)
    var.LB=i
    var.UB=i
    
    BLmodel.model.Params.timelimit = 50.0
    BLmodel.model.Params.MIPFocus = 3
    BLmodel.model.setParam( 'OutputFlag', False)
    BLmodel.model.optimize() 
    
    BilevelFunctions.CompareBLmodelObjective(BLmodel)
    BilevelFunctions.Compare_SEDA_DUAL_OBJ(BLmodel)   


# Reset the Contract limits
Contract_name = 'ContractPrice(ng102)'
var = BLmodel.model.getVarByName(Contract_name)
var.LB = 0
var.UB = 2000
#BLmodel.model.reset()
#BLmodel.model.update()


df_var,df_con=BilevelFunctions.get_Var_Con(BLmodel)
#print(df[df.Name.str.startswith(('Pgen','WindDA','lambda_gas_balance','gprod'))])
#df[df.Name.str.contains(('lambda_gas_balance'))]
#df_var.Initial.sort_values()
#con = next(iter(mSEDA_COMP.model.getConstrs()))

#--- Loop over different contracts and determine the price

#BLmodel = BilevelFunctions.Loop_Contracts_Price(BLmodel)






