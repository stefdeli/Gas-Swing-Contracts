# -*- coding: utf-8 -*-
"""
Created on Wed Dec  5 22:50:43 2018

@author: omalleyc
"""

import pandas as pd
from itertools import product
import defaults
import numpy as np


if defaults.folder=='Data/LargeNetwork_ImperialUnitsActual':
    
    sc_file=pd.read_csv(defaults.SCdata_NoPrice_IN)
    
    Times={'tr1':(1,4),
           'tr2':(5,8),
           'tr3':(9,12),
           'tr4':(13,16),
           'tr5':(17,20),
           'tr6':(21,24),
           }

    
    Gen1_Range={'g1_r1':(0,10),
                'g1_r2':(0,20),
                'g1_r3':(10,10),
                'g1_r4':(10,20),
                'g1_r5':(20,20),
                }
    Gen2_Range={'g2_r1':(0,10),
                'g2_r2':(0,20),
                'g2_r3':(0,25),
                'g2_r4':(10,10),
                'g2_r5':(10,20),
                'g2_r6':(10,25),}
    
    names  = list('sc{0}'.format(x+1) for x in range(len(Times.keys())*len(Gen1_Range.keys())*len(Gen2_Range.keys())))
            
    
    Contracts={b: list(a)  for a, b in zip(product(Times, Gen1_Range,Gen2_Range), names) }

    New_sc=pd.DataFrame(columns=sc_file.columns)
    for sc in Contracts.keys():
        print(sc)
        ts,te =Times[Contracts[sc][0]]
        G1_min,G1_max=Gen1_Range[Contracts[sc][1]]
        G2_min,G2_max=Gen2_Range[Contracts[sc][2]]
        
        data=[[sc,'ng101','ne101',ts,te,G1_min,G1_max,-999,-999,0,-999,np.nan,np.nan,np.nan,np.nan]]
        columns=['SC_ID', 'GasNode', 'ElecNode', 'ts', 'te', 'PcMin', 'PcMax', 'RcD',
       'RcU', 'lambdaC', 'AlphaC', 'time', 'MIPGap', 'GasProfit', 'mSEDACost']
        Temp=pd.DataFrame(data=data,columns=columns)
        
        New_sc= pd.concat([New_sc, Temp])
        
        data=[[sc,'ng102','ne101',ts,te,G2_min,G2_max,-999,-999,0,-999,np.nan,np.nan,np.nan,np.nan]]
        columns=['SC_ID', 'GasNode', 'ElecNode', 'ts', 'te', 'PcMin', 'PcMax', 'RcD',
       'RcU', 'lambdaC', 'AlphaC', 'time', 'MIPGap', 'GasProfit', 'mSEDACost']
        Temp=pd.DataFrame(data=data,columns=columns)
        
        New_sc= pd.concat([New_sc, Temp])
    New_sc.to_csv(defaults.SCdata_NoPrice_IN,index=False)
        






