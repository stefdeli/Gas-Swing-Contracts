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
mSEDACost_NoContract=708
BLmodel= modelObjects.Bilevel_Model(f2d,mSEDACost_NoContract)

BilevelFunctions.DA_RT_Model(BLmodel,mSEDA_COMP,mGDA_COMP,mGRT_COMP)




BilevelFunctions.Find_NC_Profit(BLmodel)




BLmodel.model.write(defaults.folder+'/LPModels/BLmodel.lp')


BLmodel.model.Params.timelimit = 10.0
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
print(df_var[df_var.Name.str.contains('ContractPrice')])












