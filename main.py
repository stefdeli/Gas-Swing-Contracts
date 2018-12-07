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



Timesteps=['t1']
BLmodel=BilevelFunctions.BuildBilevel(Timesteps=Timesteps)



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
Result=BilevelFunctions.SequentialClearing(Timesteps=Timesteps)


BilevelFunctions.SetContracts(Type='zero')
Result0=BilevelFunctions.SequentialClearing(Timesteps=Timesteps)


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



ActualCost=0.0
ArbitrageCost=0.0
for t in Result.mSEDA.edata.time:
    for s in Result.mSEDA.edata.scenarios:

        D= Result.All_Dispatches[s,t]
        ArbitrageCost=ArbitrageCost+D['Cost'].sum()
        
        RUP=D['RUp'].sum()+D['RUpSC'].sum()
        RDN=D['RDn'].sum()+D['RDnSC'].sum()
        
        
        temp=list(D.index)
        index=temp+[i+'_SC' for i in temp]
        StackUp=pd.DataFrame(columns=['Q','P'],index=index)
        StackDn=pd.DataFrame(columns=['Q','P'],index=index)
        for g in D.index:
            P=D.loc[g]['RUpPrice']
            Q=D.loc[g]['RUp']
            StackUp.loc[g]['Q']=Q
            StackUp.loc[g]['P']=P
            
            P=D.loc[g]['RUpSCPrice']
            Q=D.loc[g]['RUpSC']
            StackUp.loc[g+'_SC']['Q']=Q
            StackUp.loc[g+'_SC']['P']=P
            
            P=D.loc[g]['RDnPrice']
            Q=D.loc[g]['RDn']
            StackDn.loc[g]['Q']=Q
            StackDn.loc[g]['P']=P
            
            P=D.loc[g]['RDnSCPrice']
            Q=D.loc[g]['RDnSC']
            StackDn.loc[g+'_SC']['Q']=Q
            StackDn.loc[g+'_SC']['P']=P
            
        StackUp=StackUp.sort_values('P')
        StackDn=StackDn.sort_values('P')
        
        if (RUP==0.0) or(RDN==0.0) :
            ActualCost=ActualCost+D['Cost'].sum()
        else:
        #    
            # First determine which regulation is actuall needed
        
            if RUP>RDN:
                Required_Up=RUP-RDN
                for i in range(len(StackUp)):
                    Q=StackUp.iloc[0]['Q']
                    P=StackUp.iloc[0]['P']
                    if Required_Up<Q:
                        ActualCost=ActualCost+P*(Required_Up)
                        break
                    else:
                        ActualCost=ActualCost+P*Q
                        Required_Up=Required_Up-Q
            elif RUP<RDN:
                Required_Up=RUP-RDN
                for i in range(len(StackUp)):
                    Q=StackUp.iloc[0]['Q']
                    P=StackUp.iloc[0]['P']
                    if Required_Up<Q:
                        ActualCost=ActualCost-P*(Required_Up)
                        break
                    else:
                        ActualCost=ActualCost-P*Q
                        Required_Up=Required_Up-Q   
                        
print('Actual Cost: {0}'.format(ActualCost))

print('ArbitrageCost: {0}'.format(ArbitrageCost))








