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


BLmodel=BilevelFunctions.BuildBilevel()



#--- Find No Contract Cost
BilevelFunctions.Find_NC_Profit(BLmodel)
BLmodel.model.write(defaults.folder+'/LPModels/BLmodel.lp')

#--- Solve with current contract
BLmodel.model.Params.Timelimit=50.0
BLmodel.model.Params.MIPFocus=3
BLmodel.model.optimize()
df_var,df_con=BilevelFunctions.get_Var_Con(BLmodel)
print(df_var[df_var.Name.str.contains('ContractPrice')])


BilevelFunctions.Loop_Contracts_Price(BLmodel)

BilevelFunctions.SetContracts(Type='normal')
Result=BilevelFunctions.SequentialClearing()


BilevelFunctions.SetContracts(Type='zero')
Result0=BilevelFunctions.SequentialClearing()


print('\n')
print('mSEDA  - Bilevel NoContract\t{0:.2f}'.format(BLmodel.NC_mSEDACost))
print('\n')
try :
    print('mSEDA chose contract {0}'.format( Result.mSEDA.results.usc[Result.mSEDA.results.usc[0]==1].index[0]))
except:
    print('No Contract Chosen')
        

print('\n')
print('mSEDA Expected - NoContract \t{0:.2f}'.format(Result0.mSEDA.model.ObjVal))
print('mSEDA Expected - Contract   \t{0:.2f}'.format(Result.mSEDA.model.ObjVal))

print('\n')
print('mSEDA Actual - NoContract \t{0:.2f}'.format(Result0.ElecCost))
print('mSEDA Actual - Contract   \t{0:.2f}'.format(Result.ElecCost))

print('\n')
print('Gas Cost  - NoContract  \t{0:.2f}'.format(Result0.GasCost))
print('Gas Cost  - Contract    \t{0:.2f}'.format(Result.GasCost))

print('\n')
print('Gas Profit - NoContract  \t{0:.2f}'.format(Result0.GasProfit))
print('Gas Profit - Contract    \t{0:.2f}'.format(Result.GasProfit))













