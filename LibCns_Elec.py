# -*- coding: utf-8 -*-
"""
Created on Thu Dec  7 17:21:15 2017

@author: delikars
"""

from collections import defaultdict
import numpy as np
import itertools
import gurobipy as gb


class expando(object):
    pass

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
    gendata = self.edata.generatorinfo
    var = self.variables
    time = self.edata.time
    windfarms = self.edata.windfarms
    SCdata = self.edata.SCdata

    

    #--- Power balance
    for t in time:
        name='PowerBalance({0})'.format(t)
        self.constraints[name]= expando()
        cc=self.constraints[name]
        cc.lhs = gb.quicksum(var.WindDA[wf,t] for wf in windfarms) + gb.quicksum(var.Pgen[gen,t] for gen in generators)+  gb.quicksum(var.PgenSC[gen,t] for gen in gfpp)
        cc.rhs = self.edata.sysload[t]
        cc.expr = m.addConstr(cc.lhs == cc.rhs,name=name)

    #--- Maximum Capacity limits
    for t in time:
        for gen in gfpp:        
            name= 'Pmax_DA_GFPP({0},{1})'.format(gen,t)
            self.constraints[name]= expando()
            cc=self.constraints[name]
            cc.lhs = var.Pgen[gen,t]+var.PgenSC[gen,t]+var.RCup[gen,t]+var.RCupSC[gen,t]
            cc.rhs = gendata.capacity[gen]              
            cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)
                   
        for gen in nongfpp:        
            name= 'Pmax_DA_GFPP({0},{1})'.format(gen,t)
            self.constraints[name]= expando()
            cc=self.constraints[name]       
            cc.lhs = var.Pgen[gen,t]+var.RCup[gen,t]
            cc.rhs = gendata.capacity[gen]       
            cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)
            
    #--- Minimum Capacity limits    
    for t in time:
        for gen in gfpp:
            name='Pmin_DA_GFPP({0},{1})'.format(gen,t)
            self.constraints[name]= expando()
            cc=self.constraints[name]   
            cc.lhs=var.Pgen[gen,t]+var.PgenSC[gen,t]-var.RCdn[gen,t]-var.RCdnSC[gen,t]
            cc.rhs=0.0
            cc.expr = m.addConstr(cc.lhs >= cc.rhs,name=name)

                   
        for gen in nongfpp:
            name='Pmin_DA({0},{1})'.format(gen,t)
            self.constraints[name]= expando()
            cc=self.constraints[name]   
            cc.lhs=var.Pgen[gen,t]-var.RCup[gen,t]
            cc.rhs=0.0
            cc.expr = m.addConstr(cc.lhs >= cc.rhs,name=name)
  
    
    #--- Wind power schedule            
    for t in time:
        for wf in windfarms:
            name = 'Wind_Max_DA({0},{1})'.format(wf,t)
            self.constraints[name]= expando()
            cc=self.constraints[name]
            cc.lhs = var.WindDA[wf,t]
            cc.rhs= self.edata.exp_wind[wf][t]
            cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)
            
    #--- Swing constract constraints
    
    # Single contract activation per generator & time-step
    for t in time:
        for gen in gfpp:
            name = 'SW_Active({0}{1})'.format(gen,t)
            self.constraints[name]= expando()
            cc=self.constraints[name]
            cc.lhs  = gb.quicksum(var.usc[sc] * self.edata.SCP[(sc,gen),t] for sc in swingcontracts)
            cc.rhs = 1.0
            cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)

    
    for t in time:
        for i in gfpp:
            name = 'PgenSCmin({0},{1})'.format(i,t)
            self.constraints[name]= expando()
            cc=self.constraints[name]
            cc.lhs=gb.quicksum(var.usc[sc] * self.edata.SCP[(sc,i),t] * SCdata.PcMin[sc,i] for sc in swingcontracts)
            cc.rhs=var.PgenSC[i,t]
            cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)
            
            name = 'PgenSCmax({0},{1})'.format(i,t)
            self.constraints[name]= expando()
            cc=self.constraints[name]
            cc.lhs= var.PgenSC[i,t]
            cc.rhs=gb.quicksum(var.usc[sc] * self.edata.SCP[(sc,i),t] * SCdata.PcMax[sc,i] for sc in swingcontracts)
            cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)
            
            name = 'RCupSCmax({0},{1})'.format(i,t)
            self.constraints[name]= expando()
            cc=self.constraints[name]
            cc.lhs= var.RCupSC[i,t]
            cc.rhs=gb.quicksum(var.usc[sc] * self.edata.SCP[(sc,i),t] * SCdata.PcMax[sc,i]  for sc in swingcontracts) -var.PgenSC[i,t]
            cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)
            
            name = 'RCupSCmin({0},{1})'.format(i,t)
            self.constraints[name]= expando()
            cc=self.constraints[name]
            cc.lhs = var.RCdnSC[i,t]
            cc.rhs = var.PgenSC[i,t]-gb.quicksum(var.usc[sc] * self.edata.SCP[(sc,i),t] *  SCdata.PcMin[sc,i] for sc in swingcontracts)
            cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)
            

            
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
    m=self.model
    
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
        
    
    #--- Real-time Power balance     
    if mtype == 'Stoch':
        WindDA = var.WindDA
    elif mtype == 'RealTime':
        WindDA = read_fixed_vars(dispatchElecDA.WindDA)         
        
        
    for s in scenarios:                
        for t in time:
            name = 'Power_Balance_RT({0},{1})'.format(s,t)
            self.constraints[name]= expando()
            cc=self.constraints[name]
            cc.lhs = gb.quicksum(var.RUp[g,s,t] - var.RDn[g,s,t] for g in generators) +            gb.quicksum(var.RUpSC[g,s,t] - var.RDnSC[g,s,t] for g in gfpp) +                        gb.quicksum(wscen[w][scenwind[s]][t]*wcap[w] - WindDA[w,t]- var.Wspill[w,s,t] for w in windfarms) +       var.Lshed[s,t]
            cc.rhs = 0.0
            cc.expr = m.addConstr(cc.lhs == cc.rhs,name=name)
  
    
    #--- Up and down regulation no-SC
    RUp_max = {}    
    if mtype == 'Stoch':
        RCup = var.RCup
        RCdn = var.RCdn
    elif mtype == 'RealTime':
        RCup = read_fixed_vars(dispatchElecDA.RCup)
        RCdn = read_fixed_vars(dispatchElecDA.RCdn)  
                 
    for s in scenarios:
        for t in time:
            for i in generators:
                name = 'RegUp_max_RT({0},{1},{2})'.format(i,s,t)
                self.constraints[name]= expando()
                cc=self.constraints[name]
                cc.lhs=var.RUp[i,s,t]
                cc.rhs=RCup[i, t]
                cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)
                
                name = 'RegDown_max_RT({0},{1},{2})'.format(i,s,t)
                self.constraints[name]= expando()
                cc=self.constraints[name]
                cc.lhs=var.RDn[i,s,t]
                cc.rhs=RCdn[i, t]
                cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)
                
                
    #--- Up and down regulation with SC
    if mtype == 'Stoch':
        RCupSC = var.RCupSC
        RCdnSC = var.RCdnSC
    elif mtype == 'RealTime':
        RCupSC = read_fixed_vars(dispatchElecDA.RCupSC)
        RCdnSC = read_fixed_vars(dispatchElecDA.RCdnSC)
    
        
    for s in scenarios:
        for t in time:
            for i in gfpp:
                
                name = 'RegUpSC_max_RT({0},{1},{2})'.format(i,s,t)
                self.constraints[name]= expando()
                cc=self.constraints[name]
                cc.lhs=var.RUpSC[i,s,t]
                cc.rhs=RCupSC[i, t]
                cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)
                
                name = 'RegDnSC_max_RT({0},{1},{2})'.format(i,s,t)
                self.constraints[name]= expando()
                cc=self.constraints[name]
                cc.lhs=var.RDnSC[i,s,t]
                cc.rhs=RCdnSC[i, t]
                cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)


    #--- Load sheading     
    for s in scenarios:
        for t in time:
            name = 'Max_load_shed_RT({0},{1})'.format(s,t)
            self.constraints[name]= expando()
            cc=self.constraints[name]
            cc.lhs=var.Lshed[s,t]
            cc.rhs=self.edata.sysload[t]
            cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)
            
    
    # Wind spillage
    for s in scenarios:  
        for t in time:
            for j in windfarms:
                name = 'Max_wind_spill_RT({0},{1})'.format(j,s,t) 
                self.constraints[name]= expando()
                cc=self.constraints[name]
                cc.lhs=var.Wspill[j,s,t]
                cc.rhs=wscen[j][scenwind[s]][t]*wcap[j]
                cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)

            
    
    
def read_fixed_vars(var):
    
    a = [var.index.tolist(), var.columns.tolist()]
    fvar  = defaultdict(float)
    for t, ii in itertools.product(*a):
        fvar[ii,t]=(var[ii][t]) 
        
    return fvar    
            