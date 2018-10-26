# -*- coding: utf-8 -*-
"""
Created on Fri Oct 26 14:53:30 2018

@author: omalleyc
"""

# -*- coding: utf-8 -*-
"""
Created on Mon Sep 24 15:49:31 2018

Market clearing with Gas Swing contracts

@author: delikars
E"""

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
#Test Test

# Stochastic Day-ahead Electricity dispatch
class expando(object):
    pass

# Use loaded data
dispatchElecDA = pickle.load( open( "dispatchElecDA.p", "rb" ) )

f2d = False

class GasDA():
    '''
    Day-ahead gas system scheduling
    '''
    def __init__(self, dispatchElecDA, f2d,comp=False):
        '''
        '''
        self.gdata = expando()
        self.edata = expando()
        self.variables = expando()
        self.variables.primal={}
        self.constraints = expando()
        self.results = expando()
        
        self._setElecDAschedule(dispatchElecDA)
        self._load_data(dispatchElecDA,f2d)
        
        if comp==False:
            self._build_model()
        elif comp==True:
            self._build_CP_model()
            
    def optimize(self):
        self.model.optimize()
        
    def _setElecDAschedule(self, dispatchElecDA):
        self.gdata.Pgen = dispatchElecDA.Pgen
        self.gdata.PgenSC = dispatchElecDA.PgenSC
        
    def get_results(self,f2d):
        GetResults._results_gasDA(self,f2d)        

    def _load_data(self,dispatchElecDA,f2d):
        GasData_Load._load_gas_network(self,f2d)              
        GasData_Load._load_wells_data(self)
        GasData_Load._load_gasload(self)
        GasData_Load._load_gas_storage(self)
        
        GasData_Load._load_SCinfo(self)          
        GasData_Load._ActiveSCinfo(self,dispatchElecDA)  
       
        #self.gdata.time=['t1']
        
    def _build_model(self):
        self.model = gb.Model()
        self.constraints={} # to store all constraints
        self.comp= False
        
        
        LibVars._build_variables_gasDA(self)    
        LibCns_Gas._build_constraints_gasDA(self)
       
        LibObjFunct._build_objective_gasDA(self)
        
        self.model.update()

    def _build_CP_model(self):
        self.model = gb.Model()        
        self.constraints={} # to store all constraints
        self.comp = True # Is it a complimentarity model

        
        LibVars._build_variables_gasDA(self)    
        LibCns_Gas._build_constraints_gasDA(self)
       
        LibObjFunct._build_objective_gasDA(self)
       
        self.model.update()
        # Add the KKT Conditions (Stationarity and complementarity)
        KKTizer._complementarity_model(self)
        
        LibVars._build_dummy_objective_var(self)
        LibObjFunct._build_objective_dummy_complementarity(self)
        
        self.model.Params.MIPFocus=1
        self.model.Params.timelimit = 1000.0
        
        self.model.update()
        

mGDA = GasDA(dispatchElecDA,f2d)
mGDA.optimize()
mGDA.get_results(f2d)
pickle.dump( mGDA.results, open( "mGDA.p", "wb" ) )



mCOMP =GasDA(dispatchElecDA,f2d,comp=True)
mCOMP.model.write('LPModels/mCOMP.lp')

#mCOMP.model.computeIIS()
#mCOMP.model.write("LPModels/mCOMP.ilp")

#mCOMP.optimize()
#mCOMP.get_results(f2d)

#Temp=pd.concat([mCOMP.results.Pgen,mSEDA.results.Pgen],axis=1)
#print(Temp)



dispatchGasDA = expando()
dispatchGasDA.gprod   = mGDA.results.gprod
dispatchGasDA.qin_sr  = mGDA.results.qin_sr
dispatchGasDA.qout_sr = mGDA.results.qout_sr
dispatchGasDA.gsin    = mGDA.results.gsin
dispatchGasDA.gsout   = mGDA.results.gsout



Pipelines={}
Flow_Errors=pd.DataFrame()
SP=pd.DataFrame()
RP=pd.DataFrame()
scen_ix='k0'

for pl in mGDA.gdata.pplineorder:
    Lpack      = mGDA.results.lpack[pl].xs(scen_ix,level=1).rename('Lpack')
    L_ini=mGDA.gdata.pplinelsini[pl]
    dLpack     = Lpack.diff().rename('dLpack')
    dLpack['t1'] = Lpack['t1']-L_ini
    qin_sr     = mGDA.results.qin_sr[pl].xs(scen_ix,level=1).rename('qin_sr')
    qout_sr    = mGDA.results.qout_sr[pl].xs(scen_ix,level=1).rename('qout_sr')
    Flow       = mGDA.results.gflow_sr[pl].xs(scen_ix,level=1).rename('Flow')
    Sp         = mGDA.results.pr[pl[0]].xs(scen_ix,level=1).rename('Send Pressure')
    Rp         = mGDA.results.pr[pl[1]].xs(scen_ix,level=1).rename('Receive Pressure')
    ActualFlow = (mGDA.gdata.pplineK[pl]*np.sqrt(Sp**2-Rp**2)).rename('Actual Flow')
    Error      = np.abs(ActualFlow-Flow).rename('Error')
    dP         = Sp-Rp.rename('PressureLoss')
    Lpack_inj  = (qin_sr-qout_sr).rename('Lpackinj')
    Temp=pd.concat([Lpack_inj,dLpack,Lpack,qin_sr,qout_sr,Flow,Sp,Rp,dP,Flow,ActualFlow,Error
                ],axis=1)   
    Pipelines[pl]=Temp
    
    Flow_Errors.loc[:,'Temp']=Error.values
    Flow_Errors=Flow_Errors.rename(index=str, columns={'Temp': pl})
    
    SP.loc[:,'Temp']=Sp.values
    SP=SP.rename(index=str, columns={'Temp': pl})
    
    RP.loc[:,'Temp']=Rp.values
    RP=RP.rename(index=str, columns={'Temp': pl})
