# -*- codgenng: utf-8 -*-
"""
Created on Thu Dec  7 19:45:15 2017

@author: delikars
"""

import gurobipy as gb
import defaults
import pandas as pd

    
def _build_objective_StochElecDA(self):  
    
    var = self.variables
    #generators = self.edata.generators    
    gfpp = self.edata.gfpp
    nongfpp = self.edata.nongfpp
    gendata = self.edata.generatorinfo
    HR=self.edata.generatorinfo.HR
    gaspriceda = self.edata.GasPriceDA
    gaspriceRT = self.edata.GasPriceRT
    
    SCdata = self.edata.SCdata
    swingcontr = self.edata.swingcontracts
    time = self.edata.time
    
    Map_Eg2Gn=self.edata.Map_Eg2Gn
    
    scenarios = self.edata.scenarios
    
    m = self.model 
    
    scenarioprob={}    
    scenarioprob = {s: self.edata.scen_wgp[s][2] for s in self.edata.scen_wgp.keys()}    
    scengprt = {s: self.edata.scen_wgp[s][0] for s in self.edata.scen_wgp.keys()}
    #scenarioprob = self.data.scenprob['Probability'].to_dict()
    
    P_up=defaults.RESERVES_UP_PREMIUM
    P_dn=defaults.RESERVES_DN_PREMIUM
    
    # !NB Re-dispatch cost = Day-ahead energy cost (No premium)
    m.setObjective(    
    # Day-ahead energy cost
    # Non Gas Generators      
    gb.quicksum(gendata.lincost[gen]*var.Pgen[gen,t] for gen in nongfpp for t in time) +   
    # Gas Generators = Nodal Gas Price  * HR * Power Output
    gb.quicksum( gaspriceda[t][Map_Eg2Gn[gen]] *HR[gen]*var.Pgen[gen,t] for gen in gfpp for t in time) +      
    # Gas Generators with Contracts 
    gb.quicksum(SCdata.lambdaC[sc,gen]*HR[gen]*var.PgenSC[gen,t] for gen in gfpp for sc in swingcontr for t in time) +      
    # Real-time redispatch cost
    # Probability                
    gb.quicksum(scenarioprob[s] * (                                                                                                
    # Non Gas Generators
    gb.quicksum(gendata.lincost[gen]*(P_up*var.RUp[gen,s,t]-P_dn*var.RDn[gen,s,t]) for gen in nongfpp for t in time) +
    # Gas Generators 
    gb.quicksum(gaspriceRT[t][Map_Eg2Gn[gen]][scengprt[s]]*HR[gen]*(P_up*var.RUp[gen,s,t]-P_dn*var.RDn[gen,s,t]) for gen in gfpp for t in time) +
    # Gas Generators with Contracts
    gb.quicksum(SCdata.lambdaC[sc,gen]*HR[gen]*(P_up*var.RUpSC[gen,s,t]-P_dn*var.RDnSC[gen,s,t]) for gen in gfpp for sc in swingcontr for t in time) +
    # Load Shedding Penalty
    gb.quicksum(defaults.VOLL * var.Lshed[s,t] for t in time)) for s in scenarios),
    gb.GRB.MINIMIZE)
    
    
def _build_objective_gasDA(self):
    
    m = self.model
    var = self.variables
    
    time = self.gdata.time    
    wdata = self.gdata.wellsinfo
    wells = self.gdata.wells
    pipes = self.gdata.pplineorder
    
    k_obj = ['k0'] # Optimize for 'central case' k0
    
    m.setObjective(gb.quicksum(wdata.Cost[gw]*var.gprod[gw,k,t] for gw in wells for k in k_obj for t in time)+
                   gb.quicksum( self.gdata.EPS*(var.pr[pl[0],k,t]-var.pr[pl[1],k,t]) for t in time for k in k_obj for pl in pipes),                                      
                   gb.GRB.MINIMIZE) 
    
    # NB! Gas storage costs NOT included in the objective function
    #    gstorage = self.gdata.gstorage
    #    gsdata = self.gdata.gstorageinfo
    # gb.quicksum(gsdata.Cost[gs]*(var.gsin[gs,k,t]+var.gsout[gs,k,t]) for gs in gstorage for t in time), 
    
    
def _build_objective_ElecRT(self):  
    
    var = self.variables    
    gfpp = self.edata.gfpp
    nongfpp = self.edata.nongfpp
    gendata = self.edata.generatorinfo
    
    gaspriceRT = self.edata.GasPriceRT
    
    HR=self.edata.generatorinfo.HR
    SCdata = self.edata.SCdata
    swingcontr = self.edata.swingcontracts
    time = self.edata.time
        
    Map_Eg2Gn=self.edata.Map_Eg2Gn
    
    scenarios = self.edata.windscen_index # Only wind power scenarios
    scenarioprob=self.edata.windscenprob   
    
    m = self.model 
    
    
    
    # !NB Re-dispatch cost = Day-ahead energy cost (No premium)
    m.setObjective(              
    # Real-time redispatch cost                 
    gb.quicksum(scenarioprob[s] * (  
    # Non Gas Generators                                                                                              
    gb.quicksum(gendata.lincost[gen]*(var.RUp[gen,s,t]-var.RDn[gen,s,t]) for gen in nongfpp for t in time) +
    # Gas Generators (No Contract)
    gb.quicksum(gaspriceRT[t][Map_Eg2Gn[gen]]['spm']*HR[gen]*(defaults.RESERVES_UP_PREMIUM*var.RUp[gen,s,t]-defaults.RESERVES_DN_PREMIUM*var.RDn[gen,s,t]) for gen in gfpp for t in time) +
    # Gas Generators with Contracts
    gb.quicksum(SCdata.lambdaC[sc,gen]*HR[gen]*(defaults.RESERVES_UP_PREMIUM*var.RUpSC[gen,s,t]-defaults.RESERVES_DN_PREMIUM*var.RDnSC[gen,s,t]) for gen in gfpp for sc in swingcontr for t in time) +
    # Load Shedding Penalty
    gb.quicksum(defaults.VOLL * var.Lshed[s,t] for t in time)) for s in scenarios),
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
    
    print('\n\n Objective function altered to remove degeneracy\n\n')
            
    Cost=pd.DataFrame(index=time,columns=wells)
    for w in wells:
        for t in time:
            Cost[w][t]=wdata.Cost[w]+int(t[1:])
    

    m.setObjective(gb.quicksum(scenarioprob[s] * (
                   gb.quicksum(Cost[w][t]*(defaults.RESERVES_UP_PREMIUM*var.gprodUp[gw,s,t] - defaults.RESERVES_DN_PREMIUM*var.gprodDn[gw,s,t] ) for gw in wells for t in time) 
                   +gb.quicksum(defaults.VOLL * var.gshed[gn,s,t] for gn in gnodes for t in time) 
                   +gb.quicksum( self.gdata.EPS*(var.pr_rt[pl[0],s,t]-var.pr_rt[pl[1],s,t]) for t in time for pl in pipes)
                   ) for s in scenarios),    
                   gb.GRB.MINIMIZE) 
    
    # NB! Gas storage costs NOT included in the objective function
    
# Dummy objective function if solving optimization problem as CP 
def _build_objective_dummy_complementarity(self): 
    m = self.model
    
    m.setObjective(self.variables.z+1.0, gb.GRB.MINIMIZE)