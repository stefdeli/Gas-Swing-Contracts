# -*- coding: utf-8 -*-
"""
Created on Mon Sep 24 15:49:31 2018

Market clearing with Gas Swing contracts

@author: delikars
"""

import GasData_Load, ElecData_Load
import LibVars
import LibCns_Elec, LibCns_Gas
import LibObjFunct
import GetResults
import gurobipy as gb



# Stochastic Day-ahead Electricity dispatch
class expando(object):
    pass


# Create Object 
class StochElecDA():
    '''
    Stochastic electricity system day-ahead scheduling
    '''
    
    def __init__(self):
        '''
        '''        
        self.edata = expando()
        self.variables = expando()
        self.constraints = expando()
        self.results = expando()

        self._load_ElecData()
        self._build_model()
        
    def optimize(self):
        self.model.optimize()
    
    def _load_ElecData(self):     
        ElecData_Load._load_network(self)  
        ElecData_Load._load_generator_data(self)
        ElecData_Load._load_wind_data(self)         
        ElecData_Load._load_intial_data(self)
        ElecData_Load._combine_wind_gprt_scenarios(self)
        ElecData_Load._load_SCinfo(self)
        
        
    def get_results(self):           
        GetResults._results_StochD(self)
        
    def _build_model(self):
        self.model = gb.Model()        
        mtype = 'Stoch'      # 'Market type' = {Stoch, RealTime}
        dispatchElecDA = None
        
        LibVars._build_variables_elecDA(self)        
        LibVars._build_variables_elecRT(self,mtype)        
        
        LibCns_Elec._build_constraints_elecDA(self)
        LibCns_Elec._build_constraints_elecRT(self, mtype, dispatchElecDA)
       
        LibObjFunct._build_objective_StochElecDA(self)
        self.model.update()

mSEDA = StochElecDA()

mSEDA.optimize()
mSEDA.get_results()

print ('########################################################')
print ('Stochastic electricity dispatch - Solved')
print ('########################################################')

dispatchElecDA = expando()
dispatchElecDA.Pgen = mSEDA.results.Pgen
dispatchElecDA.PgenSC = mSEDA.results.PgenSC
dispatchElecDA.WindDA = mSEDA.results.WindDA
dispatchElecDA.usc = mSEDA.results.usc

dispatchElecDA.RCup = mSEDA.results.RCup
dispatchElecDA.RCdn = mSEDA.results.RCdn
dispatchElecDA.RCupSC = mSEDA.results.RCupSC
dispatchElecDA.RCdnSC = mSEDA.results.RCdnSC

# flow2dir = True : Bi-directional flow on gas pipelines
# flow2dir = False: Uni-directional flow on gas pipelines (from sending to receiving node)
f2d = False

class GasDA():
    '''
    Day-ahead gas system scheduling
    '''
    def __init__(self, dispatchElecDA, f2d):
        '''
        '''
        self.gdata = expando()
        self.edata = expando()
        self.variables = expando()
        self.constraints = expando()
        self.results = expando()

        self._setElecDAschedule(dispatchElecDA)
        self._load_data(dispatchElecDA,f2d)
        self._build_model()
        
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
       
        
    def _build_model(self):
        self.model = gb.Model()
        LibVars._build_variables_gasDA(self)    
        LibCns_Gas._build_constraints_gasDA(self)
       
        LibObjFunct._build_objective_gasDA(self)
        
        self.model.update()

mGDA = GasDA(dispatchElecDA,f2d)
mGDA.model.params.MIPGap = 0.0
mGDA.model.params.IntFeasTol = 1e-9

mGDA.optimize()
mGDA.get_results(f2d)


dispatchGasDA = expando()
dispatchGasDA.gprod = mGDA.results.gprod
dispatchGasDA.qin_sr = mGDA.results.qin_sr
dispatchGasDA.qout_sr = mGDA.results.qout_sr
dispatchGasDA.gsin = mGDA.results.gsin
dispatchGasDA.gsout = mGDA.results.gsout

print ('########################################################')
print ('Gas dispatch day-ahead - Solved')
print ('########################################################')




class ElecRT():
    '''
    Real-time electricity system dispatch
    '''
    
    def __init__(self,dispatchElecDA):
        '''
        '''        
        self.edata = expando()
        self.variables = expando()
        self.constraints = expando()
        self.results = expando()

        self._load_ElecData()
        self._build_model(dispatchElecDA)
        
    def optimize(self):
        self.model.optimize()
    
    def _load_ElecData(self):     
        ElecData_Load._load_network(self)  
        ElecData_Load._load_generator_data(self)
        ElecData_Load._load_wind_data(self)         
        ElecData_Load._load_intial_data(self)
        
        ElecData_Load._combine_wind_gprt_scenarios(self)
        
        ElecData_Load._load_SCinfo(self)
        
        
    def get_results(self):       
        GetResults._results_elecRT(self)
        
    def _build_model(self, dispatchElecDA):
        self.model = gb.Model()        
        
        mtype = 'RealTime'      # 'Market type' = {Stoch, RealTime}
        
        LibVars._build_variables_elecRT(self,mtype)        
        LibCns_Elec._build_constraints_elecRT(self,mtype,dispatchElecDA)       
        LibObjFunct._build_objective_ElecRT(self)
        self.model.update()

mERT = ElecRT(dispatchElecDA)

print ('########################################################')
print ('Electricity Real-time dispatch - Solved')
print ('########################################################')


mERT.optimize()
mERT.get_results()

dispatchElecRT = expando()
dispatchElecRT.RUp = mERT.results.RUp
dispatchElecRT.RDn = mERT.results.RDn
dispatchElecRT.RUpSC = mERT.results.RUpSC
dispatchElecRT.RDnSC = mERT.results.RDnSC
dispatchElecRT.Lshed = mERT.results.Lshed
dispatchElecRT.Wspill = mERT.results.Wspill

dispatchElecRT.windscenprob=mERT.edata.windscenprob
dispatchElecRT.windscenarios=mERT.edata.windscen_index




class GasRT():
    '''
    Real-time gas system dispatch
    '''
    
    def __init__(self, dispatchGasDA,dispatchElecRT,f2d):
        '''
        '''
        self.gdata = expando()
        self.edata = expando()
        self.variables = expando()
        self.constraints = expando()
        self.results = expando()

        self._load_data(f2d,dispatchElecRT)
        
        self._build_model(dispatchGasDA,dispatchElecRT)
        
    def optimize(self):
        self.model.optimize()
        
    def get_results(self,f2d):
        GetResults._results_gasRT(self,f2d)        

    def _load_data(self,f2d,dispatchElecRT):
        GasData_Load._load_gas_network(self,f2d)              
        GasData_Load._load_wells_data(self)
        GasData_Load._load_gasload(self)
        GasData_Load._load_gas_storage(self)
        GasData_Load._load_scenarios(self,dispatchElecRT)
        
        GasData_Load._load_SCinfo(self)          
#        GasData_Load._ActiveSCinfo(self,dispatchElecDA)  
       
        
    def _build_model(self,dispatchGasDA,dispatchElecRT):
        self.model = gb.Model()
        
        mtype = 'RealTime' 
        
        LibVars._build_variables_gasRT(self,mtype,dispatchElecRT)    
        LibCns_Gas._build_constraints_gasRT(self,dispatchGasDA,dispatchElecRT)
       
        LibObjFunct._build_objective_gasRT(self)
        
        self.model.update()

mGRT = GasRT(dispatchGasDA,dispatchElecRT,f2d)

print ('########################################################')
print ('Gas Real-time dispatch - Solved')
print ('########################################################')


mGRT.optimize()
mGRT.model.computeIIS()
mGRT.model.write("mGRT.ilp")
mGRT.get_results(f2d)

dispatchGasRT = expando()
dispatchGasRT.gprodUp = mGRT.results.gprodUp
dispatchGasRT.gprodDn = mGRT.results.gprodDn
dispatchGasRT.gshed = mGRT.results.gshed
