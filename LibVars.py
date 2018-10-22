# -*- coding: utf-8 -*-
"""
Created on Thu Dec  7 16:58:17 2017

@author: delikars
"""

import gurobipy as gb

#==============================================================================
# Gas system variables
#==============================================================================

#==============================================================================        
 # Day-ahead market variables       
#==============================================================================

def _build_variables_gasDA(self):  
        m = self.model        
        
        gnodes = self.gdata.gnodes
        pplines = self.gdata.pplineorder
        time = self.gdata.gasload.index.tolist()
        
        sclim = self.gdata.sclim # Swing contract limits
    
        # Nodal Pressures
        self.variables.pr = {}
        for gn in gnodes:
            for t in time:
                for k in sclim:
                    self.variables.pr[gn,k,t] = m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name='pres({0},{1},{2})'.format(gn,k,t))
                
        # Gas Flow
        self.variables.gflow_sr = {} # Gas flow from sending to receiving end                  
        for pl in pplines:
            for t in time:
                for k in sclim:
                    self.variables.gflow_sr[pl,k,t] = m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name='gflow_sr({0},{1},{2})'.format(pl,k,t))                
                    
                
                  
        if self.gdata.flow2dir == True:
            self.variables.gflow_rs = {} # Gas flow from receiving to sending end    
            self.variables.u = {}        # Binary variables for the outer approximation of gas flow limits              
            for pl in pplines:
                for t in time:
                    for k in sclim:
                        self.variables.gflow_sr[pl,k,t] = m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name='gflow_sr({0},{1},{2})'.format(pl,k,t))     
                        self.variables.u[pl,k,t] = m.addVar(vtype=gb.GRB.BINARY, name='u({0}{1}{2})'.format(pl,k,t))
                
        # Linepack
        self.variables.lpack = {}
        self.variables.qin_sr = {}         
        self.variables.qout_sr = {}
        
        for pl in pplines:
            for t in time:
                for k in sclim:
                    self.variables.lpack[pl,k,t] = m.addVar(lb=0.0, name='lpack({0},{1},{2})'.format(pl,k,t))
                    self.variables.qin_sr[pl,k,t] = m.addVar(lb=0.0, name='qin_sr({0},{1},{2})'.format(pl,k,t) )        
                    self.variables.qout_sr[pl,k,t] = m.addVar(lb=0.0, name='qout_sr({0},{1},{2})'.format(pl,k,t) )

        
        if self.gdata.flow2dir == True:
            self.variables.qin_rs = {}
            self.variables.qout_rs = {}
            
            for pl in pplines:
                for t in time:
                    for k in sclim:
                        self.variables.qin_rs[pl,k,t] = m.addVar(lb=0.0, name='qin_rs({0},{1})'.format(pl,k,t) )                
                        self.variables.qout_rs[pl,k,t] = m.addVar(lb=0.0, name='qout_rs({0},{1})'.format(pl,k,t) )
        
        # Gas production (wells)
        gwells = self.gdata.wellsinfo.index.tolist()
        
        self.variables.gprod = {}
        for gw in gwells:
            for t in time:
                for k in sclim:
                    self.variables.gprod[gw,k,t] = m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name='gprod({0},{1},{2})'.format(gw,k,t))
                
        # Gas storage               
        self.variables.gsin = {}; self.variables.gsout = {}
        self.variables.gstore = {}
        
        for gs in self.gdata.gstorage:
            for t in time:
                for k in sclim:
                    self.variables.gsin[gs,k,t] = m.addVar(lb=0.0, ub=self.gdata.gstorageinfo['MaxInFlow'][gs],name='gsin({0},{1},{2})'.format(gs,t,k))
                    self.variables.gsout[gs,k,t] = m.addVar(lb=0.0, ub=self.gdata.gstorageinfo['MaxOutFlow'][gs],name='gsout({0},{1},{2})'.format(gs,t,k))
                    self.variables.gstore[gs,k,t] = m.addVar(lb=self.gdata.gstorageinfo['MinStore'][gs], 
                                                             ub=self.gdata.gstorageinfo['MaxStore'][gs],name='gstore({0},{1},{2})'.format(gs,t,k))

        m.update()
        

 
def _build_variables_gasRT(self,mtype,dispatchElecRT):  
    """
    NB! Variables for flow from receiving to sending are not modelled
    """
    m = self.model        
    
    gnodes = self.gdata.gnodes
    pplines = self.gdata.pplineorder
    time = self.gdata.gasload.index.tolist()
    gwells = self.gdata.wellsinfo.index.tolist()
    
    """
    Real time gas only required to handle the possible outcomes of the RT wind scenarios
    """
    scenarios = self.gdata.scenarios
        
    
    
    self.variables.pr_rt = {}            # Nodal pressure : Real-time
    
    self.variables.gflow_sr_rt = {}     # Gas flow from sending to receiving end : Real-time   
    
    self.variables.lpack_rt = {}        # Linepack : Real-time
    self.variables.qin_sr_rt = {}       # Flow IN pipeline (s,r) : Real-time  
    self.variables.qout_sr_rt = {}      # Flow OUT pipeline (s,r) : Real-time
    
    self.variables.gprodUp = {}         # Gas Production Up Regulation
    self.variables.gprodDn = {}         # Gas Production Down Regulation
    
    self.variables.gshed = {}           # Gas shedding : Real-time
    
    self.variables.gsin_rt = {};        # Gas IN storage : Real-time
    self.variables.gsout_rt = {}        # Gas OUT storage : Real-time
    self.variables.gstore_rt = {}       # Gas stored in storage : Real-time
    
    for s in scenarios:
        for t in time:
        
            for gn in gnodes:
                self.variables.pr_rt[gn,s,t] = m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name='pres_rt({0},{1},{2})'.format(gn,s,t))
                self.variables.gshed[gn,s,t] = m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name='gshed({0},{1},{2})'.format(gn,s,t))
                
            for pl in pplines:
                self.variables.gflow_sr_rt[pl,s,t] = m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name='gflow_sr_rt({0},{1},{2})'.format(pl,s,t))    
                
                self.variables.lpack_rt[pl,s,t] = m.addVar(lb=0.0, ub=gb.GRB.INFINITY,name='lpack_rt({0},{1},{2})'.format(pl,s,t))
                self.variables.qin_sr_rt[pl,s,t] = m.addVar(lb=0.0,ub=gb.GRB.INFINITY, name='qin_sr_rt({0},{1},{2})'.format(pl,s,t) )        
                self.variables.qout_sr_rt[pl,s,t] = m.addVar(lb=0.0,ub=gb.GRB.INFINITY, name='qout_sr_rt({0},{1},{2})'.format(pl,s,t) )

            for gw in gwells:
                self.variables.gprodUp[gw,s,t] = m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name='gprodUp({0},{1},{2})'.format(gw,s,t))
                self.variables.gprodDn[gw,s,t] = m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name='gprodDn({0},{1},{2})'.format(gw,s,t))
                
            for gs in self.gdata.gstorage:
                self.variables.gsin_rt[gs,s,t] = m.addVar(lb=0.0, ub=self.gdata.gstorageinfo['MaxInFlow'][gs], name='gsin_rt({0},{1},{2})'.format(gs,s,t))
                self.variables.gsout_rt[gs,s,t] = m.addVar(lb=0.0, ub=self.gdata.gstorageinfo['MaxOutFlow'][gs], name='gsout_rt({0},{1},{2})'.format(gs,s,t))
                self.variables.gstore_rt[gs,s,t] = m.addVar(lb=self.gdata.gstorageinfo['MinStore'][gs], ub=self.gdata.gstorageinfo['MaxStore'][gs], name='gstore_rt({0},{1},{2})'.format(gs,s,t))

    m.update()
         
        

#==============================================================================
# Electricity system variables
#==============================================================================

#==============================================================================        
 # Day-ahead market variables       
#==============================================================================
        
def _build_variables_elecDA(self):  
        m = self.model
        var = self.variables
        primal=self.variables.primal
        generators = self.edata.generators
        gfpp = self.edata.gfpp        
        swingcontracts = self.edata.swingcontracts
        windfarms = self.edata.windfarms        
        time = self.edata.time
                         
        # Swing Contract status
        var.usc = {}
        
        for sc in swingcontracts:
            name='u({0})'.format(sc)
            Temp = m.addVar(vtype=gb.GRB.BINARY, name=name)
            var.usc[sc]  = Temp
            primal[name] = Temp
        
        # Dispatchable generators (Non-contracted Gas & Non-Gas)
        var.Pgen = {}
        for gen in generators:
            for t in time:
                name = 'Pgen({0},{1})'.format(gen,t)
                Temp = m.addVar(lb=0.0, name = name)
                var.Pgen[gen,t] = Temp
                primal[name]    = Temp
                
        # GFPPs with swing contract 
        var.PgenSC = {}
        for gen in gfpp:
            for t in time:
                name = 'PgenSC({0},{1})'.format(gen,t)
                Temp= m.addVar(lb=0.0, name = name)
                var.PgenSC[gen,t] =Temp
                primal[name] = Temp
                
        # Upward reserve capacity (Non-contracted Gas & Non-Gas)
        var.RCup = {}
        for gen in generators:
            for t in time:
                name='RCup({0},{1})'.format(gen,t)
                Temp= m.addVar(lb=0.0, name=name)
                var.RCup[gen,t] =Temp
                primal[name]= Temp
            
        # Downward reserve capacity (Non-contracted Gas & Non-Gas)
        var.RCdn = {}
        for gen in generators:   
            for t in time:
                name='RCdn({0},{1})'.format(gen,t)
                Temp= m.addVar(lb=0.0, name=name)
                var.RCdn[gen, t] = Temp
                primal[name]= Temp
                
        # Upward reserve capacity - GFPPs with swing contract 
        var.RCupSC = {}
        for gen in gfpp:
            for t in time:
                name='RCupSC({0},{1})'.format(gen,t)
                Temp = m.addVar(lb=0.0,name=name)
                var.RCupSC[gen,t]= Temp
                primal[name]= Temp
        # Downward reserve capacity - GFPPs with swing contract 
        var.RCdnSC = {}
        for gen in gfpp:   
            for t in time:
                name='RCdnSC({0},{1})'.format(gen,t)
                Temp = m.addVar(lb=0.0, name=name)
                var.RCdnSC[gen,t]= Temp
                primal[name]= Temp
                
       # Non-Dispatchable generators (Wind)
        var.WindDA = {}
        for wf in windfarms:
            for t in time:
                name = 'WindDA({0},{1})'.format(wf,t)
                Temp = m.addVar(lb=0.0, name=name)
                var.WindDA[wf,t]=Temp
                primal[name]= Temp
        
        
        m.update()
        
#==============================================================================
# Real-time market variables
#==============================================================================
        
def _build_variables_elecRT(self,mtype):

       
    m = self.model        
    generators = self.edata.generators
    gfpp = self.edata.gfpp
    windfarms = self.edata.windfarms   
    time = self.edata.time 
    
    primal=self.variables.primal
    var=self.variables
     
    
    """
    If stochastic dispatch: scenario set comprises i) gas price and ii) wind power scenarios
    If real-time dispatch: scenario set comprises only wind power scenarios
    """
    
    if mtype == 'Stoch':
        scenarios = self.edata.scenarios # Gas price & wind scenarios        
    elif mtype == 'RealTime':
        scenarios = self.edata.windscen_index # Only wind power scenarios
    

    var.RUp = {}         # Up Regulation
    var.RDn = {}         # Down Regulation

    var.RUpSC = {}       # Up Regulation - GFPPs with swing contract 
    var.RDnSC = {}       # Down Regulation - GFPPs with swing contract 
        
    var.Wspill = {}      # Wind spillage        
    var.Lshed = {}       # Load shedding    
  
    
    for s in scenarios:
        for t in time:
            for i in generators:
                name='RUp({0},{1},{2})'.format(i,s,t)                          
                Temp = m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name=name)
                var.RUp[i,s,t]= Temp
                primal[name]=Temp
                
                name='RDn({0},{1},{2})'.format(i,s,t)
                Temp=m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name=name)  
                var.RDn[i,s,t] = Temp
                primal[name]=Temp
                
            for i in gfpp:
                name='RUpSC({0},{1},{2})'.format(i,s,t)
                Temp = m.addVar(lb=0.0, ub=gb.GRB.INFINITY,name=name )
                var.RUpSC[i,s,t]= Temp
                primal[name]=Temp
                
                name='RDnSC({0},{1},{2})'.format(i,s,t)
                Temp = m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name=name)                                
                var.RDnSC[i,s,t]=Temp
                primal[name]=Temp
                
            for j in windfarms:
                name='Wspill({0},{1},{2})'.format(j,s,t)
                Temp = m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name=name)
                var.Wspill[j,s,t]=Temp
                primal[name]=Temp
            
            
            name='Lshed({0},{1})'.format(s,t)
            Temp =  m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name=name)
            var.Lshed[s,t]=Temp
            primal[name]=Temp
        
            
def _build_dummy_objective_var(self):    
    m = self.model    
    self.variables.z = {}
    self.variables.z =  m.addVar(lb=0, name='z')
        