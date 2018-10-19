# -*- coding: utf-8 -*-
"""
Created on Thu Dec  7 17:21:15 2017

@author: delikars
"""

from collections import defaultdict
import numpy as np
import itertools
import gurobipy as gb

#==============================================================================
# Electricity system constraints 
#==============================================================================

def _build_constraints_elecDA(self):
    
    m = self.model
    generators = self.edata.generators
    gfpp = self.edata.gfpp    
    nongfpp = self.edata.nongfpp
    swingcontracts = self.edata.swingcontracts
    windfarms = self.edata.windfarms
    
    PowerBalDA = {}
    var = self.variables
    time = self.edata.time

    # Power balance
    for t in time:
        PowerBalDA[t] = m.addConstr(
        gb.quicksum(var.WindDA[wf,t] for wf in windfarms) +
        gb.quicksum(var.Pgen[gen,t] for gen in generators)+
        gb.quicksum(var.PgenSC[gen,t] for gen in gfpp), 
        gb.GRB.EQUAL,
        self.edata.sysload[t],
        name = 'Power_Balance_DA({0})'.format(t))
        
    # Maximum Capacity limits    
    PmaxDA = {}
    gendata = self.edata.generatorinfo    
    
    for gen in gfpp:        
        for t in time:                       
            PmaxDA[gen,t] = m.addConstr(var.Pgen[gen,t]+var.PgenSC[gen,t]+var.RCup[gen,t]+var.RCupSC[gen,t], 
            gb.GRB.LESS_EQUAL, 
            gendata.capacity[gen], name = 'Pmax_DA_GFPP({0},{1})'.format(gen,t)) 
                   
    for gen in nongfpp:        
        for t in time:                       
            PmaxDA[gen,t] = m.addConstr(var.Pgen[gen,t]+var.RCup[gen,t], 
            gb.GRB.LESS_EQUAL, 
            gendata.capacity[gen], name = 'Pmax_DA({0},{1})'.format(gen,t)) 
            
    # Minimum Capacity limits    
    PminDA = {}
    
    for gen in gfpp:        
        for t in time:                       
            PminDA[gen,t] = m.addConstr(var.Pgen[gen,t]+var.PgenSC[gen,t]-var.RCdn[gen,t]-var.RCdnSC[gen,t], 
            gb.GRB.GREATER_EQUAL, 
            0.0, name = 'Pmin_DA_GFPP({0},{1})'.format(gen,t)) 
                   
    for gen in nongfpp:        
        for t in time:                       
            PminDA[gen,t] = m.addConstr(var.Pgen[gen,t]-var.RCup[gen,t], 
            gb.GRB.GREATER_EQUAL, 
            0.0, name = 'Pmin_DA({0},{1})'.format(gen,t)) 
    
    
    # Wind power schedule            
    WindmaxDA = {}
    windfarms = self.edata.windfarms
    
    for wf in windfarms:
        for t in time:
            WindmaxDA[wf,t] = self.model.addConstr(
            var.WindDA[wf,t],
            gb.GRB.LESS_EQUAL,
            self.edata.exp_wind[wf][t],
            name = 'Wind_Max_DA({0},{1})'.format(wf,t))
            
            
    ## Swing constract constraints
    
    # Single contract activation per generator & time-step
    SCact = {}
    for t in time:
        for gen in gfpp:
            SCact[t] = self.model.addConstr(
                gb.quicksum(var.usc[sc] * self.edata.SCP[(sc,gen),t] for sc in swingcontracts),
                gb.GRB.LESS_EQUAL,
                1.0,
                name = 'SW_Active({0}{1})'.format(gen,t))
    

                
        
    # Swing contract capacity limits
    SCPmin = {}
    SCPmax = {}
    
    SCRupMax = {}
    SCRdnMax = {}
    
    SCdata = self.edata.SCdata
    
    for t in time:
        for i in gfpp:
            SCPmin[i,t] = self.model.addConstr( 
                    gb.quicksum(var.usc[sc] * self.edata.SCP[(sc,i),t] * SCdata.PcMin[sc,i] for sc in swingcontracts),
                    gb.GRB.LESS_EQUAL,
                    var.PgenSC[i,t],
                    name = 'PgenSCmin({0},{1})'.format(i,t) )
            
            SCPmax[i,t] = self.model.addConstr( 
                    var.PgenSC[i,t],
                    gb.GRB.LESS_EQUAL,
                    gb.quicksum(var.usc[sc] * self.edata.SCP[(sc,i),t] * SCdata.PcMax[sc,i] for sc in swingcontracts),
                    name = 'PgenSCmax({0},{1})'.format(i,t) )
            
            SCRupMax[i,t] = self.model.addConstr( 
                    var.RCupSC[i,t],
                    gb.GRB.LESS_EQUAL,
                    gb.quicksum(var.usc[sc] * self.edata.SCP[(sc,i),t] * SCdata.PcMax[sc,i]  for sc in swingcontracts)
                    -var.PgenSC[i,t],
                    name = 'RCupSCmax({0},{1})'.format(i,t) )
            
            SCRdnMax[i,t] = self.model.addConstr( 
                    var.RCdnSC[i,t],
                    gb.GRB.LESS_EQUAL,
                    var.PgenSC[i,t]
                    -gb.quicksum(var.usc[sc] * self.edata.SCP[(sc,i),t] *  SCdata.PcMin[sc,i] for sc in swingcontracts),
                    name = 'RCupSCmin({0},{1})'.format(i,t) )
            
            
            
#==============================================================================
# Real-time market constraints
#==============================================================================

def _build_constraints_elecRT(self,mtype,dispatchElecDA):
    
    scenarios = self.edata.scenarios
          
    time = self.edata.time
    var = self.variables
    
    wscen = self.edata.windscen
    scenwind = {s: self.edata.scen_wgp[s][1] for s in self.edata.scen_wgp.keys()}
    
    wcap = self.edata.windinfo['capacity']
    generators = self.edata.generators
    gfpp = self.edata.gfpp
    windfarms = self.edata.windfarms
    
    
    """
    If stochastic dispatch: scenario set comprises i) gas price and ii) wind power scenarios
    If real-time dispatch: scenario set comprises only wind power scenarios
    """
    
    if mtype == 'Stoch':
        scenarios = self.edata.scenarios # Gas price & wind scenarios
        scenwind = {s: self.edata.scen_wgp[s][1] for s in self.edata.scen_wgp.keys()}
    elif mtype == 'RealTime':
        scenarios = self.edata.windscen_index # Only wind power scenarios
        scenwind = {s: s for s in self.edata.windscen_index} # Dummy dictionary from windscen to windscen
        
    
    # Real-time power balance
    PowerBalRT = {}        
    if mtype == 'Stoch':
        WindDA = var.WindDA
    elif mtype == 'RealTime':
        WindDA = read_fixed_vars(dispatchElecDA.WindDA)         
        
        
    for s in scenarios:                
        for t in time:        
            PowerBalRT[s,t] = self.model.addConstr(
            gb.quicksum(var.RUp[g,s,t] - var.RDn[g,s,t] for g in generators) +
            gb.quicksum(var.RUpSC[g,s,t] - var.RDnSC[g,s,t] for g in gfpp) +            
            gb.quicksum(wscen[w][scenwind[s]][t]*wcap[w] - WindDA[w,t]- var.Wspill[w,s,t] for w in windfarms) +
            var.Lshed[s,t],
            gb.GRB.EQUAL,  
            0.0,
            name = 'Power_Balance_RT({0},{1})'.format(s,t))
  
    
    # Up regulation no-SC
    RUp_max = {}    
    if mtype == 'Stoch':
        RCup = var.RCup
    elif mtype == 'RealTime':
        RCup = read_fixed_vars(dispatchElecDA.RCup)
                 
    for s in scenarios:
        for t in time:
            for i in generators:
                RUp_max[i,s,t] = self.model.addConstr(
                var.RUp[i,s,t],
                gb.GRB.LESS_EQUAL,             
                RCup[i, t],
                name = 'RegUp_max_RT({0},{1},{2})'.format(i,s,t))
                
    # Down regulation no-SC
    RDn_max = {}  
    if mtype == 'Stoch':
        RCdn = var.RCdn
    elif mtype == 'RealTime':
        RCdn = read_fixed_vars(dispatchElecDA.RCdn)       
        
        
    for s in scenarios:
        for t in time:
            for i in generators:        
                RDn_max[i,s,t] = self.model.addConstr(
                var.RDn[i,s,t],
                gb.GRB.LESS_EQUAL,                        
                RCdn[i, t],
                name = 'RegDown_max_RT({0},{1},{2})'.format(i,s,t))   
                
    # Up regulation with SC
    RUpSC_max = {}    
    if mtype == 'Stoch':
        RCupSC = var.RCupSC
    elif mtype == 'RealTime':
        RCupSC = read_fixed_vars(dispatchElecDA.RCupSC)
        
    for s in scenarios:
        for t in time:
            for i in gfpp:
                RUpSC_max[i,s,t] = self.model.addConstr(
                var.RUpSC[i,s,t],
                gb.GRB.LESS_EQUAL,             
                RCupSC[i, t],
                name = 'RegUpSC_max_RT({0},{1},{2})'.format(i,s,t))
                
    # Dwon regulation with SC
    RDnSC_max = {}
    if mtype == 'Stoch':
        RCdnSC = var.RCdnSC
    elif mtype == 'RealTime':
        RCdnSC = read_fixed_vars(dispatchElecDA.RCdnSC)
    
    for s in scenarios:
        for t in time:
            for i in gfpp:
                RDnSC_max[i,s,t] = self.model.addConstr(
                var.RDnSC[i,s,t],
                gb.GRB.LESS_EQUAL,             
                RCdnSC[i, t],
                name = 'RegUpSC_max_RT({0},{1},{2})'.format(i,s,t))
    

    # Load sheading
        
    LshedMax = {}
     
    for s in scenarios:
        for t in time:        
            LshedMax[s,t] = self.model.addConstr(
            var.Lshed[s,t],
            gb.GRB.LESS_EQUAL, self.edata.sysload[t],
            name = 'Max_load_shed_RT({0},{1})'.format(s,t) )
    
    
    # Wind spillage
    
    WspillMax = {} 
      
    for s in scenarios:  
        for t in time:
            for j in windfarms:
                WspillMax[j,s,t] = self.model.addConstr(
                var.Wspill[j,s,t], 
                gb.GRB.LESS_EQUAL,
                wscen[j][scenwind[s]][t]*wcap[j],
                name = 'Max_wind_spill_RT({0},{1})'.format(j,s,t) )
            
    
    
def read_fixed_vars(var):
    
    a = [var.index.tolist(), var.columns.tolist()]
    fvar  = defaultdict(float)
    for t, ii in itertools.product(*a):
        fvar[ii,t]=(var[ii][t]) 
        
    return fvar    
            