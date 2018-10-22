# -*- coding: utf-8 -*-
"""
Created on Mon Oct 22 11:30:08 2018

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
import KKTizer
import LibObjFunct 
import GetResults
import gurobipy as gb
import pandas as pd
import numpy as np
import itertools
#Test Test

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
        self.variables.primal = {}
        self.constraints = expando()
        self.results = expando()

        self._load_ElecData()
        self._build_model()
        #self._build_CP_model()
        
    def optimize(self):
        self.model.optimize()
    
    def _load_ElecData(self):     
        ElecData_Load._load_network(self)  
        ElecData_Load._load_generator_data(self)
        ElecData_Load._load_wind_data(self)         
        ElecData_Load._load_initial_data(self)
        ElecData_Load._combine_wind_gprt_scenarios(self)
        ElecData_Load._load_SCinfo(self)
        
        
    def get_results(self):           
        GetResults._results_StochD(self)
        
    def _build_model(self):
        self.model = gb.Model()        
        self.constraints={} # to store all constraints
        self.comp = False # Is it a complimentarity model
        
        mtype = 'Stoch'      # 'Market type' = {Stoch, RealTime}
        dispatchElecDA = None
        
        LibVars._build_variables_elecDA(self)        
        LibVars._build_variables_elecRT(self,mtype)    
        LibVars._build_dummy_objective_var(self)
        
        LibCns_Elec._build_constraints_elecDA(self)
        LibCns_Elec._build_constraints_elecRT(self, mtype, dispatchElecDA)
       
        LibObjFunct._build_objective_StochElecDA(self)
        self.model.update()
        
    def _build_CP_model(self):
        self.model = gb.Model()        
        self.constraints={} # to store all constraints
        self.comp = True # Is it a complimentarity model
        mtype = 'Stoch'      # 'Market type' = {Stoch, RealTime}
        dispatchElecDA = None
        
        LibVars._build_variables_elecDA(self)        
        LibVars._build_variables_elecRT(self,mtype)        

        
        LibCns_Elec._build_constraints_elecDA(self)
        LibCns_Elec._build_constraints_elecRT(self, mtype, dispatchElecDA)
        
        self.model.update()
        
        # Add the KKT Conditions (Stationarity and complementarity)
        KKTizer._complementarity_model(self)
        
        LibVars._build_dummy_objective_var(self)
        LibObjFunct._build_objective_dummy_complementarity(self)
        

        self.model.update()

mSEDA = StochElecDA()

mSEDA.optimize()
mSEDA.get_results()
#
