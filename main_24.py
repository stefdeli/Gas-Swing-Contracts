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

Timesteps=['t1'] # Just build model for one time step to get generator
BLmodel=BilevelFunctions.BuildBilevel(Timesteps=Timesteps)


All_SCdata = pd.read_csv(defaults.SCdata_NoPrice_IN)

all_contracts=All_SCdata.SC_ID.unique()

All_SCdata.lambdaC=All_SCdata.lambdaC.astype(float)
Sc2Gen = list()
for sc in All_SCdata.GasNode:        
    Sc2Gen.append( BLmodel.edata.Map_Gn2Eg[sc])
    
        
All_SCdata['GFPP']=pd.DataFrame(Sc2Gen)         
All_SCdata.set_index(['SC_ID','GFPP'], inplace=True) 

ts_old=-1
te_old=-1
BUILD_MODEL=True

for contract in all_contracts:
    
    print ('\n\n########################################################')
    print ('Processing Contract {0}'.format(contract))
    print ('########################################################')
    
    ts=All_SCdata.ts[contract].mean()
    te=All_SCdata.te[contract].mean()
    
    if ts==ts_old and te==te_old:
        BUILD_MODEL=False
    else:
        BUILD_MODEL=True
            
    if BUILD_MODEL:
        print('Building Model Again')
        Timesteps=['t'+str(i) for i in range(int(ts),int(te+1))]
            
        BLmodel=BilevelFunctions.BuildBilevel(Timesteps=Timesteps)
    
        #--- Find No Contract Cost
        BilevelFunctions.Find_NC_Profit(BLmodel)
        BLmodel.model.write(defaults.folder+'/LPModels/BLmodel.lp')
    
    te_old=te
    ts_old=ts
    
        


        


    
    SCdata = All_SCdata.iloc[All_SCdata.index.get_level_values(0) == contract]
        
    SCP = defaultdict(list)
       
    for sc in SCdata.index:
        for t in BLmodel.edata.time:
            tt = defaults.Horizon.index(t)+1            
            SCP[sc,t] = 1.0 if (tt >= SCdata.ts[sc] and tt<= SCdata.te[sc]) else 0.0
     
        
        
    BilevelFunctions.Change_ContractParameters(BLmodel,SCdata,SCP)
    folder=defaults.folder+'/LPModels/'
    BLmodel.model.write(folder+'BLmodel_'+contract+'.lp')

#        BLmodel.model.reset()
#        BLmodel.model.resetParams()
    BLmodel.model.Params.BranchDir = -1
    BLmodel.model.Params.DegenMoves=10
    BLmodel.model.params.AggFill = 10
    BLmodel.model.params.Presolve = 2
    BLmodel.model.Params.NodeMethod=1
    BLmodel.model.Params.timelimit = 100.0
    BLmodel.model.setParam('ImproveStartGap',1)
    BLmodel.model.Params.MIPFocus = 3
    BLmodel.model.setParam( 'OutputFlag',True)

    BLmodel.model.optimize() 
        

       
    gas_nodes = list(BLmodel.edata.Map_Eg2Gn.values())
    # result may be list of lists, so flatted
    flat_list = [item for sublist in gas_nodes for item in sublist]
    GasGenNodes=set(flat_list)
        
    
    Result = {}#defaultdict(dict)    
    if BLmodel.model.status==2:
            
#            Compare_SEDA_DUAL_OBJ(BLmodel)
#            Compare_GDA_DUAL_OBJ(BLmodel)
#            Compare_GRT_DUAL_OBJ(BLmodel)
#            Compare_BLmodelObjective(BLmodel)
#            CheckDualObjectives(BLmodel)
        for node in GasGenNodes:
            name='ContractPrice({0})'.format(node)
            var=BLmodel.model.getVarByName(name)
            Result[node]=np.float(var.x)
            
        for g in SCdata.index.get_level_values(1).tolist():
            GasNode=All_SCdata['GasNode'][(contract,g)]
            
            All_SCdata.at[(contract,g),'lambdaC']=Result[GasNode]
            All_SCdata.at[(contract,g),'time']=BLmodel.model.Runtime
            All_SCdata.at[(contract,g),'MIPGap']=BLmodel.model.MIPGap
            All_SCdata.at[(contract,g),'GasProfit']=BLmodel.model.ObjVal
            All_SCdata.at[(contract,g),'mSEDACost']=BLmodel.model.getVarByName('mSEDACost').x
            
    else:
        print('Contract {0}  failed'.format(contract))
        for node in GasGenNodes:
            Result[node]=np.nan
            
        for g in SCdata.index.get_level_values(1).tolist():
            GasNode=All_SCdata['GasNode'][(contract,g)]
            
            All_SCdata.at[(contract,g),'lambdaC']=np.nan
            All_SCdata.at[(contract,g),'time']=np.nan
            try:
                All_SCdata.at[(contract,g),'MIPGap']=BLmodel.model.MIPGap
            except:
                All_SCdata.at[(contract,g),'MIPGap']=np.nan    
            
        
    
All_SCdata.reset_index(level=1, inplace=True)
All_SCdata=All_SCdata.drop(['GFPP'],axis=1)    
All_SCdata.to_csv(defaults.SCdata_NoPrice_OUT)    

print(All_SCdata[['lambdaC','PcMin','PcMax','MIPGap','GasProfit','mSEDACost']])   
    



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





























