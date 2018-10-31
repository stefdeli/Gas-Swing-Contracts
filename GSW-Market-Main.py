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
    
    def __init__(self,comp=False):
        '''
        '''        
        self.edata = expando()
        self.variables = expando()
        self.variables.primal = {}
        self.constraints = {}
        self.results = expando()

        self._load_ElecData()
        if comp==False:
            self._build_model()
        elif comp==True:
            self._build_CP_model()
        
    def optimize(self):
        self.model.setParam( 'OutputFlag', defaults.GUROBI_OUTPUT )
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
        
    def get_duals(self):
        GetResults._results_duals(self)
        
    def _build_model(self):
        self.model = gb.Model()        
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
        
        #LibVars._build_dummy_objective_var(self)
        #LibObjFunct._build_objective_dummy_complementarity(self)
        
        #self.model.Params.MIPFocus=1
        #self.model.Params.timelimit = 20.0
        self.model.update()


mSEDA = StochElecDA()
mSEDA.optimize()
mSEDA.model.write('LPModels/mSEDA.lp')

if mSEDA.model.Status==2:
    print ('########################################################')
    print ('Stochastic electricity dispatch - Solved')
    print ('########################################################')
    mSEDA.get_results()
 #   mSEDA.get_duals()
    

    dispatchElecDA = expando()
    dispatchElecDA.Pgen = mSEDA.results.Pgen
    dispatchElecDA.PgenSC = mSEDA.results.PgenSC
    dispatchElecDA.WindDA = mSEDA.results.WindDA
    dispatchElecDA.usc = mSEDA.results.usc
    dispatchElecDA.RCup = mSEDA.results.RCup
    dispatchElecDA.RCdn = mSEDA.results.RCdn
    dispatchElecDA.RCupSC = mSEDA.results.RCupSC    
    dispatchElecDA.RCdnSC = mSEDA.results.RCdnSC

    
else:
    mSEDA.model.computeIIS()
    mSEDA.model.write('LPModels/mSEDA.ilp')
    

mSEDA_COMP = StochElecDA(comp=True)
mSEDA_COMP.optimize()
mSEDA_COMP.model.write('LPModels/mSEDA_COMP.lp')

if mSEDA_COMP.model.Status==2:
    print ('########################################################')
    print ('Stochastic electricity dispatch COMPLEMENTARITY - Solved')
    print ('########################################################')
    mSEDA_COMP.get_results()
    
    
else:
    mSEDA_COMP.model.computeIIS()
    mSEDA_COMP.model.write('LPModels/mSEDA.ilp')


# flow2dir = True : Bi-directional flow on gas pipelines
# flow2dir = False: Uni-directional flow on gas pipelines (from sending to receiving node)

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
        self.model.setParam( 'OutputFlag', defaults.GUROBI_OUTPUT )
        self.model.optimize()
        
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


mGDA = GasDA(dispatchElecDA,f2d)
mGDA.optimize()
mGDA.model.write('LPModels/mGDA.lp')

if mGDA.model.Status==2:
    print ('########################################################')
    print ('Gas dispatch day-ahead - Solved')
    print ('########################################################')
    mGDA.get_results(f2d)
    mGDA.get_duals()
    

    dispatchGasDA = expando()
    dispatchGasDA.gprod   = mGDA.results.gprod
    dispatchGasDA.qin_sr  = mGDA.results.qin_sr
    dispatchGasDA.qout_sr = mGDA.results.qout_sr
    dispatchGasDA.gsin    = mGDA.results.gsin
    dispatchGasDA.gsout   = mGDA.results.gsout
    
        
else:
    mGDA.model.computeIIS()
    mGDA.model.write('LPModels/mGDA.ilp')

mGDA_COMP = GasDA(dispatchElecDA,f2d,comp=True)
mGDA_COMP.optimize()
mGDA_COMP.model.write('LPModels/mGDA_COMP.lp')

if mGDA_COMP.model.Status==2:
    print ('########################################################')
    print ('Gas dispatch day-ahead COMPLEMENTARITY- Solved')
    print ('########################################################')
    mGDA_COMP.get_results(f2d)
else:
    mGDA_COMP.model.computeIIS()
    mGDA_COMP.model.write('LPModels/mGDA.ilp')




class ElecRT():
    '''
    Real-time electricity system dispatch
    '''
    
    def __init__(self,dispatchElecDA,comp=False):
        '''
        '''        
        self.edata = expando()
        self.variables = expando()
        self.variables.primal={}
        self.constraints = {}
        self.results = expando()

        self._load_ElecData()
        if comp==False:
            self._build_model(dispatchElecDA)
        elif comp==True:
            self._build_CP_model(dispatchElecDA)
            
        
    def optimize(self):
        self.model.setParam( 'OutputFlag', defaults.GUROBI_OUTPUT )
        self.model.optimize()
    
    def _load_ElecData(self):     
        ElecData_Load._load_network(self)  
        ElecData_Load._load_generator_data(self)
        ElecData_Load._load_wind_data(self)         
        ElecData_Load._load_initial_data(self)
        
        ElecData_Load._combine_wind_gprt_scenarios(self)
        
        ElecData_Load._load_SCinfo(self)
        
        
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
        

mERT = ElecRT(dispatchElecDA)
mERT.optimize()
mERT.model.write('LPModels/mERT.lp')

if mERT.model.Status==2:
    print ('########################################################')
    print ('Electricity Real-time dispatch - Solved')
    print ('########################################################')

    mERT.get_results()
    mERT.get_duals()

    dispatchElecRT = expando()
    dispatchElecRT.RUp = mERT.results.RUp
    dispatchElecRT.RDn = mERT.results.RDn
    dispatchElecRT.RUpSC = mERT.results.RUpSC
    dispatchElecRT.RDnSC = mERT.results.RDnSC
    dispatchElecRT.Lshed = mERT.results.Lshed
    dispatchElecRT.Wspill = mERT.results.Wspill
    dispatchElecRT.windscenprob=mERT.edata.windscenprob
    dispatchElecRT.windscenarios=mERT.edata.windscen_index
    
        
else:
    mERT.model.computeIIS()
    mERT.model.write('LPModels/mERT.ilp')
    
    
mERT_COMP = ElecRT(dispatchElecDA,comp=True)
mERT_COMP.optimize()
mERT_COMP.model.write('LPModels/mERT_COMP.lp')

if mERT_COMP.model.Status==2:
    print ('########################################################')
    print ('Electricity Real-time dispatch - Solved')
    print ('########################################################')

    mERT_COMP.get_results()
        
else:
    mERT_COMP.model.computeIIS()
    mERT_COMP.model.write('LPModels/mERT_COMP.ilp')

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
        
        if comp==False:
            self._build_model(dispatchGasDA,dispatchElecRT)
        elif comp==True:
            self._build_CP_model(dispatchGasDA,dispatchElecRT)

    def optimize(self):
        self.model.setParam( 'OutputFlag', defaults.GUROBI_OUTPUT )
        self.model.optimize()
        
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



mGRT = GasRT(dispatchGasDA,dispatchElecRT,f2d)
mGRT.optimize()
mGRT.model.write('LPModels/mGRT.lp')

if mGRT.model.Status==2:
    print ('########################################################')
    print ('Gas Real-time dispatch - Solved')
    print ('########################################################')
    mGRT.get_results(f2d)
    mGRT.get_duals()
    

    dispatchGasRT = expando()
    dispatchGasRT.gprodUp = mGRT.results.gprodUp
    dispatchGasRT.gprodDn = mGRT.results.gprodDn
    dispatchGasRT.gshed = mGRT.results.gshed
else:
    mGRT.model.computeIIS()
    mGRT.model.write('LPModels/mGRT.ilp')
    

mGRT_COMP = GasRT(dispatchGasDA,dispatchElecRT,f2d,comp=True)
mGRT_COMP.optimize() 
mGRT_COMP.model.write('LPModels/mGRT_COMP.lp')
       

if mGRT_COMP.model.Status==2:
    print ('########################################################')
    print ('Gas COMP Real-time dispatch - Solved')
    print ('########################################################')
    mGRT_COMP.get_results(f2d)
else:
    mGRT_COMP.model.computeIIS()
    mGRT_COMP.model.write('LPModels/mGRT_COMP.ilp')
       

# Compare Variables Results
def Compare_models(mPrimal,mComp):
    
    Var_Compare=pd.DataFrame()
    
    for var_name in mPrimal.variables.primal.keys():
        
        var_primal=mPrimal.variables.primal[var_name]
        
        PrimalValue =var_primal.x
        PrimalLB    =var_primal.LB
        PrimalUB    =var_primal.UB
        PrimalDual  =var_primal.rc
            
        COMPValue = mComp.variables.primal[var_name].x
        COMPLB    = mComp.duals.musLB[var_name].x # All values should have lower limit
        if type(mComp.duals.musUB[var_name])==gb.Var: # Gubobi inf = 1e100
            
            COMPUB    = mComp.duals.musUB[var_name].x
            COMPDUAL = COMPLB-COMPUB
        else: 
            COMPUB = []
            COMPDUAL=COMPLB
            
        Var_Compare=Var_Compare.append(pd.DataFrame([[PrimalValue,COMPValue,PrimalDual,COMPDUAL,COMPLB,COMPUB,PrimalUB,PrimalLB]],
                                                    columns=['PrimalValue','COMPValue','PrimalDual','COMPDual','COMPLB','COMPUB','UB','LB'],index=[var_name]))
    
    Con_Compare=pd.DataFrame()
    for con_name in mPrimal.constraints.keys():
        
        con_primal=mPrimal.constraints[con_name]
        
        PrimalDual=con_primal.expr.Pi
        Sense=con_primal.expr.Sense
        
        if Sense=='=':
            COMP_Dual= -1.0* mComp.duals.lambdas[con_name].x
        elif Sense=='<':
            
            COMP_Dual= -1.0* mComp.duals.mus[con_name].x
        elif Sense=='>':
            
            COMP_Dual= mComp.duals.mus[con_name].x
        
        Con_Compare=Con_Compare.append(pd.DataFrame([[PrimalDual,COMP_Dual,Sense]],columns=['Primal','Comp','Sense'],index=[con_name]))
    return Var_Compare,Con_Compare
###############################################################################             
   
Var_Compare,Con_Compare = Compare_models(mSEDA,mSEDA_COMP)


Diff_Value=(Var_Compare.PrimalValue-Var_Compare.COMPValue)
Diff_Dual_Var =(Var_Compare.PrimalDual-Var_Compare.COMPDual)
Problems_Var=Var_Compare[Diff_Dual_Var.abs()>1e-3]


Diff_Dual_Con =(Con_Compare.Primal-Con_Compare.Comp)   
Problems_Con=Con_Compare[Diff_Dual_Con.abs()>1e-3]      

print('Max Error in Variable Values is {0}'.format(Diff_Value.abs().max()))
print('Max Error in Variable Dual Values is {0}'.format(Diff_Dual_Var.abs().max()))
print('Max Error in Constraint Dual Values is {0}'.format(Diff_Dual_Con.abs().max()))



##Problems=Problems.drop(columns=['PrimalValue','COMPValue'])
#    # Check for duals due to constraints
#    con_UB=[]
#    con_LB=[]
#    con_EQ=[]
#    
#    for c in PrimalConstraints:
#        conSense=c.Sense
#        conDual = c.Pi
#        conRHS  =c.RHS
#        conRow=mGRT.model.getRow(c)
#        no_var_in_constraint=conRow.size()
#        vars_in_constraint=[]
#        coeff_of_vars=[]
#        for j in range(conRow.size()):
#            vars_in_constraint.append(conRow.getVar(j))
#            coeff_of_vars.append(conRow.getCoeff(j))
#            
#        # Check if variable is only one in constraint
#        if var in set(vars_in_constraint):
#            if no_var_in_constraint==1:
#                # Need to consider coefficient but assume always 1.0 for now...
#                if c.Sense == '<':
#                    con_UB.append(conDual)
#                elif c.Sense == '>':
#                    con_LB.append(conDual)
#                else:
#                    con_EQ.append(conDual)
            

            
        
        
        
    
            




