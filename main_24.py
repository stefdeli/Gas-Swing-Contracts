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
import New_Loop



class expando(object):
    pass



# - Get Prices
    
#for t in range(1,12):
#    Timesteps=['t'+str(t)]
#    BLmodel=BilevelFunctions.BuildBilevel(Timesteps=Timesteps)
#    BilevelFunctions.Find_NC_Profit(BLmodel)

BLmodel=New_Loop.New_LoopContracts() 
            
        



Timesteps=defaults.Horizon

BilevelFunctions.SetContracts(Type='normal')
Result=BilevelFunctions.SequentialClearing(Timesteps=Timesteps)


BilevelFunctions.SetContracts(Type='zero')
Result0=BilevelFunctions.SequentialClearing(Timesteps=Timesteps)


print('\n')
print('mSEDA  - Bilevel NoContract\t{0:.2f}'.format(BLmodel.NC_mSEDACost))
print('\n')
try :
    chosen=Result.mSEDA.results.usc[Result.mSEDA.results.usc[0]==1]
    for c in chosen.index:
        print('mSEDA chose contract {0}'.format( c))
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
        
    #    print('{3},{4} =Rup:{0:.2f} RDn:{1:.2f} Cost:{2:.2f}'.format(RUP,RDN,D['Cost'].sum(),s,t))
#        print('Rnet:{0:.2f}'.format(RUP-RDN))
        
        if (RUP==0.0) or(RDN==0.0) :
            ActualCost=ActualCost+D['Cost'].sum()
#            print(D['Cost'].sum())
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
                Required_Dn=RDN-RUP
                for i in range(len(StackUp)):
                    Q=StackDn.iloc[0]['Q']
                    P=StackDn.iloc[0]['P']
                    if Required_Dn<Q:
                        ActualCost=ActualCost-P*(Required_Dn)
                        break
                    else:
                        ActualCost=ActualCost-P*Q
                        Required_Dn=Required_Dn-Q   
                        
print('Actual Cost: {0}'.format(ActualCost))

print('ArbitrageCost: {0}'.format(ArbitrageCost))

print('mSEDA_Cost : {0}'.format(Result0.ElecCost_RT))
























