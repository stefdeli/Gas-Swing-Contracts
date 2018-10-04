# -*- coding: utf-8 -*-
"""
Created on Fri Sep 28 18:18:11 2018

@author: omalleyc
"""

import pandas as pd
import numpy as np
FolderElec='./ElecData'
FolderGas='./GasData'

## --------------------- Generators ---------------------------------------- ##
Gen=pd.read_csv('InputCSV\Table1.csv')
Gen=Gen.merge(pd.read_csv('InputCSV\Table2.csv'), on=['No'],how='outer')
Gen=Gen.merge(pd.read_csv('InputCSV\Table3.csv'), on=['No'],how='outer')


# Convert Numbered components to names to avoid confusion later
Gen.index=['Gen'+str(x) for x in range(1,len(Gen)+1)]
Gen.Node=['Bus'+str(x) for x in Gen.Node.tolist()]
Gen['Gas Node'] =[x if np.isnan(x) else 'Node'+str(int(x)) for x in Gen['Gas Node'].tolist() ]


# Summarize the Block data into single unit data
Cap = ['Block 1 (MW)','Block 2 (MW)','Block 3 (MW)','Block 4 (MW)']
MC  = ['Block 1\r($/MWh)','Block 2\r($/MWh)','Block 3\r($/MWh)','Block 4\r($/MWh)']
Eff =['Block 1 (%)','Block 2 (%)','Block 3 (%)','Block 4 (%)']

Gen=Gen.assign(MaxCapacity=Gen[Cap].sum(axis=1))
Gen=Gen.assign(MarginalCost=Gen[MC].mean(axis=1))
Gen=Gen.assign(Efficiency=Gen[Eff].mean(axis=1))
## Drop Replaced/Unneccesary Data
Gen.Efficiency=Gen.Efficiency/100.0
All_2_Drop=Cap+MC+Eff+['No','Ownership']
Gen.drop(labels=All_2_Drop,axis=1,inplace=True)
Gen.loc[Gen.Type=='coal','Type']='nongas'


Gen.index.name='ID'

Gen.rename(index=str, columns={"Node"        : "origin_elec", 
                               "Gas Node"    : "origin_gas",
                               "Type"        : "primaryfuel",
                               "MaxCapacity" : "capacity",
                               "MarginalCost": "lincost",
                               "Efficiency"  : "HR"}, inplace=True)
Gen['name']=Gen.index
Gen['country']='Wakanda'
Gen['upreg']=0
Gen['downreg']=0
Gen['UpCapCost']=0
Gen['DnCapCost']=0

cols=['name',
      'country',
      'origin_elec',
      'origin_gas',
      'primaryfuel',
      'capacity',
      'lincost',
      'upreg',
      'downreg',
      'UpCapCost',
      'DnCapCost',
      'HR']

Gen=Gen[cols]

Gen.to_csv(FolderElec+'generators.csv')



## --------------------- Branches ---------------------------------------- ##   
Branch=pd.read_csv('InputCSV\Table4.csv')
No_Buses=Branch[['From','To']].max().max()
Branch.index=['Branch'+str(x) for x in range(1,len(Branch)+1)]
Branch.From=['Bus'+str(x) for x in Branch.From.tolist()]
Branch.To=['Bus'+str(x) for x in Branch.To.tolist()]
Branch.drop(labels=['No.'],axis=1,inplace=True)

Branch.rename(index=str, columns={"From"        : "fromNode", 
                                  "To"          : "toNode",
                                  "B (b.u.)"    : "Y",
                                  "Capacity"    : "limit", }, inplace=True)
Branch['type']='AC'

Branch.to_csv(FolderElec+'lines.csv',index=False)
    
 ## --------------------- Buses ---------------------------------------- ##

LoadShare=pd.read_csv('InputCSV\Table5.csv')
LoadShare.Node=['Bus'+str(x) for x in LoadShare.Node.tolist()]
LoadShare.drop(labels=['No'],axis=1,inplace=True)
LoadShare=LoadShare.set_index('Node').reindex(['Bus'+str(x) for x in range(1,No_Buses+1)],fill_value=0)

Load=pd.Series(data=[0.7, 3, 4])
Load.index=['t'+str(x) for x in range(1,len(Load)+1)]

for b in LoadShare.index.tolist():
    Load.name=b
    Bus_Elec[b]=LoadShare.loc[b,'Portion']*Load

Bus_Elec=Bus_Elec.transpose()

Bus_Elec.index.name='ID'
Bus_Elec.to_csv(FolderElec+'Bus_Elec.csv')

Bus=pd.DataFrame(index=LoadShare.index)
Bus.index.name='ID'
Bus['name']=Bus.index
Bus['country']='Wakanda'
Bus['voltage']=220
Bus['latitude']='-'
Bus['longitude']='-'
Bus.to_csv(FolderElec+'buses.csv')


# -------------------------Gas Supply Points------------------------------ ##
GasSupply=pd.read_csv('InputCSV\Table7.csv')
GasSupply.index=['Supply'+str(x) for x in range(1,len(GasSupply)+1)]
GasSupply.drop(labels=['No'],axis=1,inplace=True)
GasSupply.Node=['Node'+str(x) for x in GasSupply.Node.tolist()]

# -------------------------Gas Pipes------------------------------ ##
GasPipe=pd.read_csv('InputCSV\Table8.csv')
No_Nodes=GasPipe[['From','To']].max().max()
GasPipe.index=['Pipe'+str(x) for x in range(1,len(GasPipe)+1)]
GasPipe.drop(labels=['No'],axis=1,inplace=True)
GasPipe.From = ['Node'+str(x) for x in GasPipe.From.tolist()]
GasPipe.To   = ['Node'+str(x) for x in GasPipe.To.tolist()]


# -------------------------Gas Compressor------------------------------ ##
GasComp=pd.read_csv('InputCSV\Table9.csv')
GasComp.index=['Compressor'+str(x) for x in range(1,len(GasComp)+1)]
GasComp.drop(labels=['No.'],axis=1,inplace=True)
GasComp.From = ['Node'+str(x) for x in GasComp.From.tolist()]
GasComp.To   = ['Node'+str(x) for x in GasComp.To.tolist()]

# -------------------------Gas Node------------------------------ ##
GasNode=pd.DataFrame(index=['Node'+str(x) for x in range(1,No_Nodes+1)])
GasNodeTemp=pd.read_csv('InputCSV\Table10.csv')
GasNodeTemp.index=['Node'+str(x) for x in GasNodeTemp.Node.tolist()]
GasNodeTemp.drop(labels=['No','Node'],axis=1,inplace=True)

GasNode=GasNode.join(GasNodeTemp)
GasNode.fillna(value=0)


GasLoad=pd.Series(data=[0.7, 3, 4])
GasLoad.index=['t'+str(x) for x in range(1,len(Load)+1)]
GasLoad.index.name='Time'
Node_Gas=pd.DataFrame()
for g in GasNode.index.tolist():
    GasLoad.name=g
    Node_Gas[g]=GasNode.loc[g,'Portion']*GasLoad

Node_Gas.to_csv(FolderGas+'/GasLoad.csv')

################################ OUTPUT  #####################################
#Bus.rename(index=str, columns={"": "a", "B": "c"})