# -*- coding: utf-8 -*-
"""
Created on Tue Nov 20 12:36:13 2018

@author: omalleyc
"""


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



# Stochastic Day-ahead Electricity dispatch
class expando(object):
    pass


# Create Object 
class StochElecDA():
    '''
    Stochastic electricity system day-ahead scheduling
    '''
    
    def __init__(self,comp=False,bilevel=False):
        '''
        comp - building a complementarity model?
        bilevel - building a bilevel model?
        '''        
        self.edata = expando()
        self.variables = expando()
        self.variables.primal = {}
        self.constraints = {}
        self.results = expando()

        
        self._load_ElecData(bilevel)
        self.comp=comp
        
        if comp==False:
            self._build_model()
            self.model.write(defaults.folder+'/LPModels/mSEDA.lp')
        elif comp==True:
            self._build_CP_model()
            self.model.write(defaults.folder+'/LPModels/mSEDA_COMP.lp')
        
    def optimize(self):
        self.model.setParam( 'OutputFlag', defaults.GUROBI_OUTPUT )
        self.model.optimize()
        dispatchElecDA = expando()

                
        if self.model.Status==2:
            if self.comp==False:
                
                print ('########################################################')
                print ('Stochastic electricity dispatch - Solved')
                print ('########################################################')
                
                self.get_results()
                
                dispatchElecDA.Pgen = self.results.Pgen
                dispatchElecDA.PgenSC = self.results.PgenSC
                dispatchElecDA.WindDA = self.results.WindDA
                dispatchElecDA.usc = self.results.usc
                dispatchElecDA.RCup = self.results.RCup
                dispatchElecDA.RCdn = self.results.RCdn
                dispatchElecDA.RCupSC = self.results.RCupSC    
                dispatchElecDA.RCdnSC = self.results.RCdnSC
        
            else:
                
                print ('########################################################')
                print ('COMPLEMENTARITY Stochastic electricity dispatch - Solved')
                print ('########################################################')
                self.get_results()
                
    
        else:
            
            self.model.computeIIS()
            
            if self.comp==False:
                self.model.write(defaults.folder+'/LPModels/mSEDA.ilp')
            else:
                self.model.write(defaults.folder+'/LPModels/mSEDA_COMP.ilp')
        
        return dispatchElecDA
        
    
    def _load_ElecData(self,bilevel):     
        ElecData_Load._load_network(self)  
        ElecData_Load._load_generator_data(self)
        ElecData_Load._load_wind_data(self)         
        ElecData_Load._load_initial_data(self)
        ElecData_Load._load_SCinfo(self)
        
        
        ElecData_Load._combine_wind_gprt_scenarios(self,bilevel)
        
        if defaults.ChangeTime==True:
            self.edata.time=defaults.Time
        
    def get_results(self):           
        GetResults._results_StochD(self)
        
    def get_duals(self):
        GetResults._results_duals(self)
        
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
        
    def _build_CP_model(self):
        self.model = gb.Model()        
        
        mtype = 'Stoch'      # 'Market type' = {Stoch, RealTime}
        dispatchElecDA = None
        
        LibVars._build_variables_elecDA(self)        
        LibVars._build_variables_elecRT(self,mtype)        

        
        LibCns_Elec._build_constraints_elecDA(self)
        LibCns_Elec._build_constraints_elecRT(self, mtype, dispatchElecDA)
        LibObjFunct._build_objective_StochElecDA(self)
       
        self.model.update()
        # Add the KKT Conditions (Stationarity and complementarity)
        KKTizer._complementarity_model(self)
        
        #LibVars._build_dummy_objective_var(self)
        #LibObjFunct._build_objective_dummy_complementarity(self)
        
        #self.model.Params.MIPFocus=1
        #self.model.Params.timelimit = 20.0
        self.model.update()



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
        
        self.comp=comp
        self.f2d=f2d
        
        if comp==False:
            self._build_model()
            self.model.write(defaults.folder+'/LPModels/mGDA.lp')
        elif comp==True:
            self._build_CP_model()
            self.model.write(defaults.folder+'/LPModels/mGDA_COMP.lp')
        
    def optimize(self):
        self.model.setParam( 'OutputFlag', defaults.GUROBI_OUTPUT )
        self.model.optimize()
        dispatchGasDA = expando()
        
        if self.model.Status==2:
            if self.comp==False:
                
                print ('########################################################')
                print ('Gas dispatch day-ahead - Solved')
                print ('########################################################')
                
                self.get_results(self.f2d)
                self.get_duals()
                
                    
                dispatchGasDA.gprod   = self.results.gprod
                dispatchGasDA.qin_sr  = self.results.qin_sr
                dispatchGasDA.qout_sr = self.results.qout_sr
                dispatchGasDA.gsin    = self.results.gsin
                dispatchGasDA.gsout   = self.results.gsout
                dispatchGasDA.LMP     = self.results.lambda_Flow_Bal.xs('k0',level=1)
            else:
                
                print ('########################################################')
                print ('Gas dispatch day-ahead COMPLEMENTARITY- Solved')
                print ('########################################################')
                self.get_results(self.f2d)
                
    
        else:
            
            self.model.computeIIS()
            
            if self.comp==False:
                self.model.write(defaults.folder+'/LPModels/mGDA.ilp')
            else:
                self.model.write(defaults.folder+'/LPModels/mGDA_COMP.ilp')
   
        return dispatchGasDA
    
    
    def _setElecDAschedule(self, dispatchElecDA):
        self.gdata.Pgen = dispatchElecDA.Pgen
        self.gdata.PgenSC = dispatchElecDA.PgenSC
        
    def get_results(self,f2d):
        GetResults._results_gasDA(self,f2d)   
    
    def get_duals(self):
        GetResults._results_duals(self)

    def _load_data(self,dispatchElecDA,f2d):
        GasData_Load._load_gas_network(self,f2d)              
        GasData_Load._load_wells_data(self)
        GasData_Load._load_gasload(self)
        GasData_Load._load_gas_storage(self)
        
        if defaults.ChangeTime==True:
            self.gdata.time=defaults.Time
        
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
        
#        LibVars._build_dummy_objective_var(self)
#        LibObjFunct._build_objective_dummy_complementarity(self)
        
#        self.model.Params.MIPFocus=1
#        self.model.Params.timelimit = 20.0
        
        self.model.update()



class ElecRT():
    '''
    Real-time electricity system dispatch
    '''
    
    def __init__(self,dispatchElecDA,comp=False,bilevel=False):
        '''
        '''        
        self.edata = expando()
        self.variables = expando()
        self.variables.primal={}
        self.constraints = {}
        self.results = expando()

        self._load_ElecData(bilevel)
 
        self.comp=comp

        if comp==False:
            self._build_model(dispatchElecDA)
            self.model.write(defaults.folder+'/LPModels/mERT.lp')
        elif comp==True:
            self._build_CP_model(dispatchElecDA)
            self.model.write(defaults.folder+'/LPModels/mERT_COMP.lp')
        
    def optimize(self):
        self.model.setParam( 'OutputFlag', defaults.GUROBI_OUTPUT )
        self.model.optimize()
        dispatchElecRT = expando()
        
        if self.model.Status==2:
            if self.comp==False:
                
                print ('########################################################')
                print ('Electricity Real-time dispatch - Solved')
                print ('########################################################')
                
                self.get_results()
                

                dispatchElecRT.RUp = self.results.RUp
                dispatchElecRT.RDn = self.results.RDn
                dispatchElecRT.RUpSC = self.results.RUpSC
                dispatchElecRT.RDnSC = self.results.RDnSC
                dispatchElecRT.Lshed = self.results.Lshed
                dispatchElecRT.Wspill = self.results.Wspill
                dispatchElecRT.windscenprob=self.edata.windscenprob
                dispatchElecRT.windscenarios=self.edata.windscen_index
                

            else:
                
                print ('########################################################')
                print ('Electricity Real-time dispatch COMPLEMENTARITY - Solved')
                print ('########################################################')
                self.get_results()
                
    
        else:
            
            self.model.computeIIS()
            
            if self.comp==False:
                self.model.write(defaults.folder+'/LPModels/mERT.ilp')
            else:
                self.model.write(defaults.folder+'/LPModels/mERT_COMP.ilp')
        return dispatchElecRT
   
    def _load_ElecData(self,bilevel):     
        ElecData_Load._load_network(self)  
        ElecData_Load._load_generator_data(self)
        ElecData_Load._load_wind_data(self)         
        ElecData_Load._load_initial_data(self)
        
        ElecData_Load._combine_wind_gprt_scenarios(self,bilevel)
        
        ElecData_Load._load_SCinfo(self)
        
        if defaults.ChangeTime==True:
            self.edata.time=defaults.Time
        
        
    def get_results(self):       
        GetResults._results_elecRT(self)
    
    def get_duals(self):
        GetResults._results_duals(self)
        
    def _build_model(self, dispatchElecDA):
        self.model = gb.Model()        
        self.comp = False
        mtype = 'RealTime'      # 'Market type' = {Stoch, RealTime}
        
        
        LibVars._build_variables_elecRT(self,mtype)        
        LibCns_Elec._build_constraints_elecRT(self,mtype,dispatchElecDA)       
        LibObjFunct._build_objective_ElecRT(self)
        
        self.model.update()

    def _build_CP_model(self, dispatchElecDA):
        self.model = gb.Model()        
        self.comp = True
        mtype = 'RealTime'      # 'Market type' = {Stoch, RealTime}
        
        
        LibVars._build_variables_elecRT(self,mtype)        
        LibCns_Elec._build_constraints_elecRT(self,mtype,dispatchElecDA)       
        LibObjFunct._build_objective_ElecRT(self)
        
        self.model.update()
        
        KKTizer._complementarity_model(self)
        
#        LibVars._build_dummy_objective_var(self)
#        LibObjFunct._build_objective_dummy_complementarity(self)
        
#        self.model.Params.MIPFocus=1
#        self.model.Params.timelimit = 10.0
#        self.model.update()
    

class GasRT():
    '''
    Real-time gas system dispatch
    '''
    
    def __init__(self, dispatchGasDA,dispatchElecRT,f2d,comp=False):
        '''
        '''
        self.gdata = expando()
        self.edata = expando()
        self.variables = expando()
        self.variables.primal={}
        self.constraints = {}
        self.results = expando()

        self._load_data(f2d,dispatchElecRT)
        
        self.comp=comp
        self.f2d=f2d
        
        if comp==False:
            self._build_model(dispatchGasDA,dispatchElecRT)
            self.model.write(defaults.folder+'/LPModels/mGRT.lp')
        elif comp==True:
            self._build_CP_model(dispatchGasDA,dispatchElecRT)
            self.model.write(defaults.folder+'/LPModels/mGRT_COMP.lp')


    def optimize(self):
        self.model.setParam( 'OutputFlag', defaults.GUROBI_OUTPUT )
        self.model.optimize()
        dispatchGasRT = expando()
        
        if self.model.Status==2:
            if self.comp==False:
                
                print ('########################################################')
                print ('Gas dispatch real-time - Solved')
                print ('########################################################')
                self.get_results(self.f2d)
                self.get_duals()
                
                    
                dispatchGasRT.gprodUp = self.results.gprodUp
                dispatchGasRT.gprodDn = self.results.gprodDn
                dispatchGasRT.LMP     = self.results.lambda_Flow_Bal
                

            else:
                
                print ('########################################################')
                print ('Gas dispatch real-time COMPLEMENTARITY- Solved')
                print ('########################################################')
                self.get_results(self.f2d)
                    
        else:
            
            self.model.computeIIS()
            
            if self.comp==False:
                self.model.write(defaults.folder+'/LPModels/mGRT.ilp')
            else:
                self.model.write(defaults.folder+'/LPModels/mGRT_COMP.ilp')
                
        return dispatchGasRT   
        
    def get_results(self,f2d):
        GetResults._results_gasRT(self,f2d)
        
    def get_duals(self):
        GetResults._results_duals(self)

    def _load_data(self,f2d,dispatchElecRT):
        GasData_Load._load_gas_network(self,f2d)              
        GasData_Load._load_wells_data(self)
        GasData_Load._load_gasload(self)
        GasData_Load._load_gas_storage(self)
        GasData_Load._load_scenarios(self,dispatchElecRT)
        
        GasData_Load._load_SCinfo(self)   
        
        if defaults.ChangeTime==True:
            self.gdata.time=defaults.Time

      
    def _build_model(self,dispatchGasDA,dispatchElecRT):
        self.model = gb.Model()
        self.comp=False
        mtype = 'RealTime' 
        
        LibVars._build_variables_gasRT(self,mtype,dispatchElecRT)    
        LibCns_Gas._build_constraints_gasRT(self,dispatchGasDA,dispatchElecRT)
       
        LibObjFunct._build_objective_gasRT(self)
        
        self.model.update()
        
    def _build_CP_model(self,dispatchGasDA,dispatchElecRT):
        self.model = gb.Model()
        self.comp=True
        mtype = 'RealTime' 
        
        LibVars._build_variables_gasRT(self,mtype,dispatchElecRT)    
        LibCns_Gas._build_constraints_gasRT(self,dispatchGasDA,dispatchElecRT)
       
        LibObjFunct._build_objective_gasRT(self)
        
        self.model.update()
        
        KKTizer._complementarity_model(self)
        
#        LibVars._build_dummy_objective_var(self)
#        LibObjFunct._build_objective_dummy_complementarity(self)
        
#        self.model.Params.MIPFocus=1
#        self.model.Params.timelimit = 100.0
        #self.model.Params.PreSOS1BigM=1e3
        self.model.update()



