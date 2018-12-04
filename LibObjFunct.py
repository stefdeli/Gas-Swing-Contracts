# -*- codgenng: utf-8 -*-
"""
Created on Thu Dec  7 19:45:15 2017

@author: delikars
"""

import gurobipy as gb
import defaults
import pandas as pd


def _build_objective_ElecDA(self):  
    m = self.model     
    m.setObjective(  ElecDA_obj(self),   gb.GRB.MINIMIZE)

def _build_objective_StochElecDA(self): 
    m = self.model     
    m.setObjective(  ElecDA_obj(self) + ElecRT_obj(self),   gb.GRB.MINIMIZE)


def _build_objective_StochElecDA_seq(self): 
    m = self.model     
    m.setObjective(  ElecDA_obj_seq(self) + ElecRT_obj_seq(self),   gb.GRB.MINIMIZE)

def _build_objective_ElecRT_seq(self):    
    m = self.model     
    m.setObjective(  ElecRT_obj_seq(self),   gb.GRB.MINIMIZE)

def _build_objective_ElecRT(self):    
    m = self.model     
    m.setObjective(  ElecRT_obj(self),   gb.GRB.MINIMIZE)

def ElecDA_obj(self):
    var = self.variables
    #generators = self.edata.generators    
    gfpp = self.edata.gfpp
    nongfpp = self.edata.nongfpp
    gendata = self.edata.generatorinfo
    HR=self.edata.generatorinfo.HR
    gaspriceda = self.edata.GasPriceDA
    
    SCdata = self.edata.SCdata
    swingcontr = self.edata.swingcontracts
    time = self.edata.time
    
    Map_Eg2Gn=self.edata.Map_Eg2Gn
       
    # !NB Re-dispatch cost = Day-ahead energy cost (No premium)
     
    # Day-ahead energy cost
    # Non Gas Generators      
    # Gas Generators = Nodal Gas Price  * HR * Power Output
    # Gas Generators with Contracts 
    ElecDA=gb.quicksum( gendata.lincost[gen]*var.Pgen[gen,t] for gen in nongfpp for t in time) \
    +gb.quicksum( gaspriceda[t][Map_Eg2Gn[gen][0]]*HR[gen]*var.Pgen[gen,t] for gen in gfpp for t in time)\
    +gb.quicksum(SCdata.lambdaC[sc,gen]*HR[gen]*var.PgenSC[gen,t] for gen in gfpp for sc in swingcontr for t in time)      
    
    return ElecDA
    
def ElecRT_obj(self):
    
    var = self.variables
    #generators = self.edata.generators    
    gfpp = self.edata.gfpp
    nongfpp = self.edata.nongfpp
    gendata = self.edata.generatorinfo
    HR=self.edata.generatorinfo.HR
    gaspriceRT = self.edata.GasPriceRT
    
    SCdata = self.edata.SCdata
    swingcontr = self.edata.swingcontracts
    time = self.edata.time
    
    Map_Eg2Gn=self.edata.Map_Eg2Gn    
    scenarios = self.edata.scenarios
   
    scenarioprob={}    
    scenarioprob = {s: self.edata.scen_wgp[s][2] for s in self.edata.scen_wgp.keys()}    
    scengprt = {s: self.edata.scen_wgp[s][0] for s in self.edata.scen_wgp.keys()}
    #scenarioprob = self.data.scenprob['Probability'].to_dict()
    
    # Premium for deployment of reserves NON-GAS generators
    P_UP_NONGAS=defaults.RESERVES_UP_PREMIUM_NONGAS 
    P_DN_NONGAS=defaults.RESERVES_DN_PREMIUM_NONGAS     
    
    # Premium for deployment of reserves NON-GAS generators
    P_UP_GAS=defaults.RESERVES_UP_PREMIUM_GAS 
    P_DN_GAS=defaults.RESERVES_DN_PREMIUM_GAS 

    # Premium for deployment of reserves NON-GAS generators
    P_UP_GAS_SC=defaults.RESERVES_UP_PREMIUM_GAS_SC
    P_DN_GAS_SC=defaults.RESERVES_DN_PREMIUM_GAS_SC 
    

    
    # Real-time redispatch cost
    # Probability  
    ElecRT= gb.quicksum(scenarioprob[s] * (                                                                                                
    # Non Gas Generators
    gb.quicksum(gendata.lincost[gen]*(P_UP_NONGAS*var.RUp[gen,s,t]-P_DN_NONGAS*var.RDn[gen,s,t]) for gen in nongfpp for t in time) +
    # Gas Generators 
    gb.quicksum(gaspriceRT[t][Map_Eg2Gn[gen][0]][scengprt[s]]*HR[gen]*(P_UP_GAS*var.RUp[gen,s,t]-P_DN_GAS*var.RDn[gen,s,t]) for gen in gfpp for t in time) +
    # Gas Generators with Contracts
    gb.quicksum(SCdata.lambdaC[sc,gen]*HR[gen]*(P_UP_GAS_SC*var.RUpSC[gen,s,t]-P_DN_GAS_SC*var.RDnSC[gen,s,t]) for gen in gfpp for sc in swingcontr for t in time) +
    # Load Shedding Penalty
    gb.quicksum(defaults.VOLL * var.Lshed[s,t] for t in time)) for s in scenarios)
    
    return ElecRT


def ElecDA_obj_seq(self):
    var = self.variables
    #generators = self.edata.generators    
    gfpp = self.edata.gfpp
    nongfpp = self.edata.nongfpp
    gendata = self.edata.generatorinfo
    HR=self.edata.generatorinfo.HR
    gaspriceda = self.edata.GasPriceDA
    
    SCdata = self.edata.SCdata
    swingcontr = self.edata.swingcontracts
    time = self.edata.time
    
    Map_Eg2Gn=self.edata.Map_Eg2Gn
       
    # !NB Re-dispatch cost = Day-ahead energy cost (No premium)
     
    # Day-ahead energy cost
    # Non Gas Generators      
    # Gas Generators = Nodal Gas Price  * HR * Power Output
    # Gas Generators with Contracts 
    ElecDA=gb.quicksum( gendata.lincost[gen]*var.Pgen[gen,t] for gen in nongfpp for t in time) \
    +gb.quicksum( gaspriceda[t][Map_Eg2Gn[gen][0]]*HR[gen]*var.Pgen[gen,t] for gen in gfpp for t in time)\
    +gb.quicksum(SCdata.lambdaC[sc,gen]*HR[gen]*var.PgenSC[gen,sc,t] for gen in gfpp for sc in swingcontr for t in time)      
    
    return ElecDA
    
def ElecRT_obj_seq(self):
    
    var = self.variables
    #generators = self.edata.generators    
    gfpp = self.edata.gfpp
    nongfpp = self.edata.nongfpp
    gendata = self.edata.generatorinfo
    HR=self.edata.generatorinfo.HR
    gaspriceRT = self.edata.GasPriceRT
    
    SCdata = self.edata.SCdata
    swingcontr = self.edata.swingcontracts
    time = self.edata.time
    
    Map_Eg2Gn=self.edata.Map_Eg2Gn    
    scenarios = self.edata.scenarios
   
    scenarioprob={}    
    scenarioprob = {s: self.edata.scen_wgp[s][2] for s in self.edata.scen_wgp.keys()}    
    scengprt = {s: self.edata.scen_wgp[s][0] for s in self.edata.scen_wgp.keys()}
    #scenarioprob = self.data.scenprob['Probability'].to_dict()
    
    # Premium for deployment of reserves NON-GAS generators
    P_UP_NONGAS=defaults.RESERVES_UP_PREMIUM_NONGAS 
    P_DN_NONGAS=defaults.RESERVES_DN_PREMIUM_NONGAS     
    
    # Premium for deployment of reserves NON-GAS generators
    P_UP_GAS=defaults.RESERVES_UP_PREMIUM_GAS 
    P_DN_GAS=defaults.RESERVES_DN_PREMIUM_GAS 

    # Premium for deployment of reserves NON-GAS generators
    P_UP_GAS_SC=defaults.RESERVES_UP_PREMIUM_GAS_SC
    P_DN_GAS_SC=defaults.RESERVES_DN_PREMIUM_GAS_SC 
    

    
    # Real-time redispatch cost
    # Probability  
    ElecRT= gb.quicksum(scenarioprob[s] * (                                                                                                
    # Non Gas Generators
    gb.quicksum(gendata.lincost[gen]*(P_UP_NONGAS*var.RUp[gen,s,t]-P_DN_NONGAS*var.RDn[gen,s,t]) for gen in nongfpp for t in time) +
    # Gas Generators 
    gb.quicksum(gaspriceRT[t][Map_Eg2Gn[gen][0]][scengprt[s]]*HR[gen]*(P_UP_GAS*var.RUp[gen,s,t]-P_DN_GAS*var.RDn[gen,s,t]) for gen in gfpp for t in time) +
    # Gas Generators with Contracts
    gb.quicksum(SCdata.lambdaC[sc,gen]*HR[gen]*(P_UP_GAS_SC*var.RUpSC[gen,s,sc,t]-P_DN_GAS_SC*var.RDnSC[gen,s,sc,t]) for gen in gfpp for sc in swingcontr for t in time) +
    # Load Shedding Penalty
    gb.quicksum(defaults.VOLL * var.Lshed[s,t] for t in time)) for s in scenarios)
    
    return ElecRT

    
def _build_objective_gasDA(self):
    
    m = self.model
    var = self.variables
    
    time = self.gdata.time    
    wdata = self.gdata.wellsinfo
    wells = self.gdata.wells
    pipes = self.gdata.pplineorder
    gsdata = self.gdata.gstorageinfo
    gstorage = self.gdata.gstorage
    gnodes = self.gdata.gnodes
    
    k_obj = ['k0'] # Optimize for 'central case' k0
    k_all=  self.gdata.sclim
            
    Cost=pd.DataFrame(index=time,columns=wells)
    #print('\n\n Objective function altered to remove degeneracy\n\n')
    for w in wells:
        for t in time:
            Cost[w][t]=wdata.LinCost[w]
            
    if defaults.GasNetwork=='WeymouthApprox':
        Pressure_Degeneracy=gb.quicksum( self.gdata.EPS*(var.pr[pl[0],k,t]-var.pr[pl[1],k,t]) for t in time for k in k_obj for pl in pipes)
    else:
        Pressure_Degeneracy=0.0
        
    if False:
        Storage=gb.quicksum(gsdata.Cost[gs]*(var.gsin[gs,k,t]+var.gsout[gs,k,t]) for gs in gstorage for k in k_obj for t in time)
    else:
        Storage=0.0
        
    Cost= gb.quicksum(Cost[gw][t]*var.gprod[gw,k,t] for gw in wells for k in k_obj for t in time)
        
    LostLoad= gb.quicksum(defaults.VOLL*var.gas_shed[gn,k,t] for gn in gnodes for t in time for k in k_all)
        
        
    
    m.setObjective(Cost+   Pressure_Degeneracy +  LostLoad +  Storage,                                      
                   gb.GRB.MINIMIZE) 



    

    
    
def _build_objective_gasRT(self):
    
    m = self.model
    var = self.variables
    
    time = self.gdata.time
    
    scenarios = self.gdata.scenarios
    
    # To be PROPERLY defined, assume equi-likely for now
    scenarioprob=self.gdata.scenprob   # To be defined...
    
    wdata = self.gdata.wellsinfo
    wells = self.gdata.wells
    gnodes = self.gdata.gnodes
    pipes = self.gdata.pplineorder
    
            
    Cost=pd.DataFrame(index=time,columns=wells)
    for w in wells:
        for t in time:
            Cost[w][t]=wdata.LinCost[w]
            
    if defaults.GasNetwork=='WeymouthApprox':
        Pressure_Degeneracy=gb.quicksum( self.gdata.EPS*(var.pr_rt[pl[0],s,t] -var.pr_rt[pl[1],s,t]) for t in time for pl in pipes for s in scenarios)    
    else:
        Pressure_Degeneracy=0.0 
        
    P_UP=defaults.RESERVES_UP_PREMIUM_GASWELL
    P_DN=defaults.RESERVES_DN_PREMIUM_GASWELL
    
    m.setObjective(gb.quicksum(scenarioprob[s] * (
                   gb.quicksum(Cost[gw][t]*(P_UP*var.gprodUp[gw,s,t] - P_DN*var.gprodDn[gw,s,t] ) for gw in wells for t in time) 
                   +gb.quicksum(defaults.VOLL * var.gshed_rt[gn,s,t] for gn in gnodes for t in time)) for s in scenarios) 
                   +Pressure_Degeneracy,
                   gb.GRB.MINIMIZE) 
    
    # NB! Gas storage costs NOT included in the objective function
    
# Dummy objective function if solving optimization problem as CP 
def _build_objective_dummy_complementarity(self): 
    m = self.model
    
    m.setObjective(self.variables.z+1.0, gb.GRB.MINIMIZE)