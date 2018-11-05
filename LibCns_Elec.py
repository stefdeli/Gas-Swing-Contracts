# -*- coding: utf-8 -*-
"""
Created on Thu Dec  7 17:21:15 2017

@author: delikars
"""

from collections import defaultdict
import numpy as np
import itertools
import gurobipy as gb
import defaults


class expando(object):
    pass


def add_constraint(self,lhs,sign_str,rhs,name):
    
    ALL_ON_LHS=False
    ALL_ON_RHS=False
    # Only one will be executed

    if sign_str=='>=':
        self.constraints[name]= expando()
        cc=self.constraints[name]
        cc.lhs=lhs
        cc.rhs=rhs
        if ALL_ON_LHS:                    
            cc.expr=self.model.addConstr( -cc.lhs+cc.rhs<=0.0,name=name)
        elif ALL_ON_RHS:                    
            cc.expr=self.model.addConstr(0.0<=cc.lhs-cc.rhs,name=name)
        else:
            cc.expr=self.model.addConstr(cc.lhs>=cc.rhs,name=name)
            
    elif sign_str=='<=':
        self.constraints[name]= expando()
        cc=self.constraints[name]
        cc.lhs=lhs
        cc.rhs=rhs                    

        if ALL_ON_LHS:
            cc.expr=self.model.addConstr(-cc.rhs+cc.lhs<=0.0,name=name)
        elif ALL_ON_RHS:
            cc.expr=self.model.addConstr(0.0<=cc.rhs-cc.lhs,name=name)
        else:
            cc.expr=self.model.addConstr(cc.lhs<=cc.rhs,name=name)
            
    elif sign_str=='==':
        
        if defaults.REMOVE_EQUALITY:
            # gEQ
            self.constraints[name+'_geq']= expando()
            cc=self.constraints[name+'_geq']
            cc.lhs=lhs
            cc.rhs=rhs 
            if ALL_ON_LHS:
                cc.expr=self.model.addConstr(-cc.lhs+cc.rhs<=0.0,name=name+'_geq')
            elif ALL_ON_RHS:                    
                cc.expr=self.model.addConstr(0.0<=cc.lhs-cc.rhs,name=name+'_geq')
            else:
                cc.expr=self.model.addConstr(cc.lhs>=cc.rhs,name=name+'_geq')
            
            self.constraints[name+'_leq']= expando()
            cc=self.constraints[name+'_leq']
            cc.lhs=lhs
            cc.rhs=rhs
            if ALL_ON_LHS:
                cc.expr=self.model.addConstr(-cc.rhs+cc.lhs<=0.0,name=name+'_leq')
            elif ALL_ON_RHS:                    
                cc.expr=self.model.addConstr(0.0<=cc.rhs-cc.lhs,name=name+'_leq')
            else:
                cc.expr=self.model.addConstr(cc.lhs<=cc.rhs,name=name+'_leq')
        else:
            self.constraints[name]= expando()
            cc=self.constraints[name]
            cc.lhs=lhs
            cc.rhs=rhs                    
            if ALL_ON_LHS:
                cc.expr=self.model.addConstr(cc.lhs-cc.rhs==0.0,name=name)
            elif ALL_ON_RHS:                    
                cc.expr=self.model.addConstr(0.0==cc.lhs-cc.rhs,name=name)
            else:
                cc.expr=self.model.addConstr(cc.lhs==cc.rhs,name=name)
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
        name='PowerBalance_DA({0})'.format(t)
        lhs =      gb.quicksum(var.WindDA[wf,t] for wf in windfarms) \
                +  gb.quicksum(var.Pgen[gen,t] for gen in generators)\
                + gb.quicksum(var.PgenSC[gen,t] for gen in gfpp)
        rhs =  + self.edata.sysload[t]
        add_constraint(self,lhs,'==',rhs,name)

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
            cc.lhs=-var.Pgen[gen,t]-var.PgenSC[gen,t]+var.RCdn[gen,t]+var.RCdnSC[gen,t]
            cc.rhs=np.float64(0.0)
            cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)

                   
        for gen in nongfpp:
            name='Pmin_DA({0},{1})'.format(gen,t)
            self.constraints[name]= expando()
            cc=self.constraints[name]   
            cc.lhs=-var.Pgen[gen,t]+var.RCup[gen,t]
            cc.rhs=np.float64(0.0)
            cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)
  
    
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
    """
     If building the complementarity model (bilevel) to determine the contract price
     then get rid of the binary variable as there will only be ONE contract that
     is active by default.
    """
    if self.comp==True:
        swingcontracts = [self.edata.swingcontracts[0]]
        usc={sc : np.float64(1.0) for sc in swingcontracts}
    else:
        usc=var.usc
        swingcontracts = self.edata.swingcontracts
        
    
    
    # Single contract activation per generator & time-step  
        
    for t in time:
        for gen in gfpp:
            if self.comp==False: # Not a comp model, so add binary requirement
                name = 'SW_Active({0}{1})'.format(gen,t)
                self.constraints[name]= expando()
                cc=self.constraints[name]
                cc.lhs  = gb.quicksum(usc[sc] * self.edata.SCP[(sc,gen),t] for sc in swingcontracts)
                cc.rhs = np.float64(1.0)
                cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)

    
    for t in time:
        for i in gfpp:
            
            name = 'PgenSCmax({0},{1})'.format(i,t)
            self.constraints[name]= expando()
            cc=self.constraints[name]
            if self.comp==True: # u is fixed and Move all parameters to rhs
                cc.lhs = var.PgenSC[i,t]
                cc.rhs = sum(usc[sc] * self.edata.SCP[(sc,i),t] * SCdata.PcMax[sc,i] for sc in swingcontracts)
            elif self.comp==False: # u is variable 
                cc.lhs = var.PgenSC[i,t] -  gb.quicksum(usc[sc] * self.edata.SCP[(sc,i),t] * SCdata.PcMax[sc,i] for sc in swingcontracts)
                cc.rhs = np.float64(0.0)
            cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)
            
            
            name = 'PgenSCmin({0},{1})'.format(i,t)
            self.constraints[name]= expando()
            cc=self.constraints[name]
            
            if self.comp==True: # u is fixed and Move all parameters to rhs
                cc.lhs= - var.PgenSC[i,t]
                cc.rhs= - sum(usc[sc] * self.edata.SCP[(sc,i),t] * SCdata.PcMin[sc,i] for sc in swingcontracts)
            elif self.comp==False: # u is variable
                cc.lhs= - var.PgenSC[i,t] +gb.quicksum(usc[sc] * self.edata.SCP[(sc,i),t] * SCdata.PcMin[sc,i] for sc in swingcontracts)
                cc.rhs=np.float64(0.0)
            cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)
            

            
            name = 'RCupSCmax({0},{1})'.format(i,t)
            self.constraints[name]= expando()
            cc=self.constraints[name]
            if self.comp==True: # u is fixed and Move all parameters to rhs
                cc.lhs=  var.RCupSC[i,t] + var.PgenSC[i,t]
                cc.rhs=  sum(usc[sc] * self.edata.SCP[(sc,i),t] * SCdata.PcMax[sc,i]  for sc in swingcontracts)
            elif self.comp==False: # u is variable
                cc.lhs= var.RCupSC[i,t] + var.PgenSC[i,t] -gb.quicksum(usc[sc] * self.edata.SCP[(sc,i),t] * SCdata.PcMax[sc,i]  for sc in swingcontracts)
                cc.rhs= np.float64(0.0)
            cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)
            
            
            name = 'RCdnSCmin({0},{1})'.format(i,t)
            self.constraints[name]= expando()
            cc=self.constraints[name]
            if self.comp==True: # u is fixed and Move all parameters to rhs
                cc.lhs =   var.RCdnSC[i,t]-var.PgenSC[i,t]
                cc.rhs = - sum(usc[sc] * self.edata.SCP[(sc,i),t] *  SCdata.PcMin[sc,i] for sc in swingcontracts)
            elif self.comp==False: # u is variable
                cc.lhs = var.RCdnSC[i,t]-var.PgenSC[i,t] +gb.quicksum(usc[sc] * self.edata.SCP[(sc,i),t] *  SCdata.PcMin[sc,i] for sc in swingcontracts)
                cc.rhs = np.float64(0.0)
            cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)
            
#            
#            name = 'RCupSCminLimiter({0},{1})'.format(i,t)
#            self.constraints[name]= expando()
#            cc=self.constraints[name]
#            cc.lhs =   var.RCupSC[i,t]
#            cc.rhs = np.float64(0.0)
#            cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)
#            
#            name = 'RCdnSCminLimiter({0},{1})'.format(i,t)
#            self.constraints[name]= expando()
#            cc=self.constraints[name]
#            cc.lhs =   var.RCdnSC[i,t]
#            cc.rhs = np.float64(0.0)
#            cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)
#            
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

            
            lhs =    gb.quicksum(var.RUp[g,s,t] - var.RDn[g,s,t] for g in generators)  \
                      + gb.quicksum(var.RUpSC[g,s,t] - var.RDnSC[g,s,t] for g in gfpp)   \
                      - gb.quicksum(WindDA[w,t] for w in windfarms) \
                      - gb.quicksum(var.Wspill[w,s,t] for w in windfarms)  \
                      + var.Lshed[s,t]
            rhs =  - sum(wscen[w][scenwind[s]][t]*wcap[w] for w in windfarms)
            add_constraint(self,-lhs,'==',-rhs,name)
  
    
    #--- Up and down regulation no-SC
  
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
                if mtype=='Stoch': # Then RCup is variable and needs to be on LHS
                    cc.lhs=var.RUp[i,s,t]-RCup[i, t]
                    cc.rhs=np.float64(0.0)
                elif mtype == 'RealTime':
                    cc.lhs = var.RUp[i,s,t]
                    cc.rhs = RCup[i, t]
                
                cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)
                
                
                name = 'RegDown_max_RT({0},{1},{2})'.format(i,s,t)
                self.constraints[name]= expando()
                cc=self.constraints[name]
                
                if mtype=='Stoch': # Then RCup is variable and needs to be on LHS
                    cc.lhs=var.RDn[i,s,t]-RCdn[i,t]
                    cc.rhs=np.float64(0.0)
                elif mtype == 'RealTime':
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
                if mtype=='Stoch': # Then RCup is variable and needs to be on LHS
                    cc.lhs=var.RUpSC[i,s,t]-RCupSC[i, t]
                    cc.rhs=np.float64(0.0)
                elif mtype == 'RealTime':
                    cc.lhs=var.RUpSC[i,s,t]
                    cc.rhs=RCupSC[i, t]
                cc.expr = m.addConstr(cc.lhs <= cc.rhs,name=name)
                
                name = 'RegDnSC_max_RT({0},{1},{2})'.format(i,s,t)
                self.constraints[name]= expando()
                cc=self.constraints[name]
                if mtype=='Stoch': # Then RCup is variable and needs to be on LHS
                    cc.lhs=var.RDnSC[i,s,t]-RCdnSC[i, t]
                    cc.rhs=np.float64(0.0)
                elif mtype == 'RealTime':
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
                name = 'Max_wind_spill_RT({0},{1},{2})'.format(j,s,t) 
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
            