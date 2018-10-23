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
from collections import defaultdict

#Test Test

# Stochastic Day-ahead Electricity dispatch
class expando(object):
    pass


# Create Object 
class StochElecDA():
    '''
    Stochastic electricity system day-ahead scheduling
    '''
    
    def __init__(self,comp=False):
        '''
        '''        
        self.edata = expando()
        self.variables = expando()
        self.variables.primal = {}
        self.constraints = expando()
        self.results = expando()

        self._load_ElecData()
        if comp==False:
            self._build_model()
        elif comp==True:
            self._build_CP_model()
        
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
        LibObjFunct._build_objective_StochElecDA(self)
       
        self.model.update()
        # Add the KKT Conditions (Stationarity and complementarity)
        KKTizer._complementarity_model(self)
        
        LibVars._build_dummy_objective_var(self)
        LibObjFunct._build_objective_dummy_complementarity(self)
        
        self.model.Params.MIPFocus=1
        self.model.Params.timelimit = 20.0
        self.model.update()

mSEDA = StochElecDA(comp=False)
mSEDA.model.write('mSEDA.lp')
mSEDA.optimize()
mSEDA.get_results()



wscen = mSEDA.edata.windscen
scenwind = {s: mSEDA.edata.scen_wgp[s][1] for s in mSEDA.edata.scen_wgp.keys()}
wcap = mSEDA.edata.windinfo['capacity']
windfarms = mSEDA.edata.windfarms

Elec=mSEDA.edata.sysload


w='w1'
Scen_Dict={}
for scen_ix in range(6):
    scen_int='ss'+str(scen_ix)
    W= sum(wscen[w][scenwind[scen_int]]*wcap[w] for w in windfarms)
    Temp=pd.concat([
             mSEDA.results.Pgen['g1'].rename('Pgen'),
             mSEDA.results.PgenSC['g1'].rename('PgenSC'),
             Elec.rename('Load'),
             mSEDA.results.WindDA['w1'].rename('WindDA'),
             mSEDA.results.RUp['g1'].xs(   scen_int,level=1).rename('Rup'),             
             mSEDA.results.RDn['g1'].xs(   scen_int,level=1).rename('RDn'),    
             mSEDA.results.RUpSC['g1'].xs(   scen_int,level=1).rename('RupSC'),             
             mSEDA.results.RDnSC['g1'].xs(   scen_int,level=1).rename('RDnSC'),
             mSEDA.results.Wspill['w1'].xs(scen_int,level=1).rename('Wspill'),  
             mSEDA.results.Lshed[           scen_int ].rename('LoadShed'),
             W.rename('Wind Actual')
             ],axis=1)
    
#    WindCap=mSEDA.edata.windinfo.capacity.values
#    NetChange_s1= WindCap*mSEDA.edata.windscen['w1']['s1']- mSEDA.results.WindDA['w1']
#    NetChange_s2= WindCap*mSEDA.edata.windscen['w1']['s2']- mSEDA.results.WindDA['w1']
#    
#    NetChange_Pgen=Temp.Rup_ss0-Temp.RDn_ss0
#    Temp=pd.concat([Temp,
#                NetChange_s1.rename('Wind_s1'),
#                   NetChange_s2.rename('Wind_s2'),
#                   NetChange_Pgen.rename('redispacth')],
#                   axis=1)
    
    Scen_Dict[scen_ix]=Temp.transpose()


mCOMP = StochElecDA(comp=True)
mCOMP.model.write('mCOMP.lp')
#mCOMP.optimize()
#mCOMP.get_results()
#Temp=pd.concat([mCOMP.results.Pgen,mSEDA.results.Pgen],axis=1)
#print(Temp)






