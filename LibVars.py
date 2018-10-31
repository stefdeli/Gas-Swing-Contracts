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
        primal =self.variables.primal
        
        var=self.variables
        sclim = self.gdata.sclim # Swing contract limits
    
        # Nodal Pressures
        var.pr = {}
        for gn in gnodes:
            for t in time:
                for k in sclim:
                    name='pres({0},{1},{2})'.format(gn,k,t)
                    Temp= m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name=name)
                    var.pr[gn,k,t] = Temp
                    primal[name]         = Temp
                
        # Gas Flow
        var.gflow_sr = {} # Gas flow from sending to receiving end                  
        for pl in pplines:
            for t in time:
                for k in sclim:
                    name='gflow_sr({0},{1},{2})'.format(pl,k,t).replace(" ","")
                    Temp =m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name=name) 
                    var.gflow_sr[pl,k,t] = Temp
                    primal[name]         = Temp
        
                  
        if self.gdata.flow2dir == True:
            var.gflow_rs = {} # Gas flow from receiving to sending end    
            var.u = {}        # Binary variables for the outer approximation of gas flow limits              
            for pl in pplines:
                for t in time:
                    for k in sclim:
                        name='gflow_sr({0},{1},{2})'.format(pl,k,t).replace(" ","")
                        Temp=m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name=name)
                        var.gflow_sr[pl,k,t] = Temp
                        primal[name]         = Temp
                        if self.comp  == False:   
                            name='u({0}{1}{2})'.format(pl,k,t).replace(" ","")
                            Temp =m.addVar(vtype=gb.GRB.BINARY, name=name)
                            var.u[pl,k,t] = Temp
                            primal[name]  = Temp
                            
        # Linepack
        var.lpack = {}
        var.qin_sr = {}         
        var.qout_sr = {}
        
        for pl in pplines:
            for t in time:
                for k in sclim:
                    
                    name='lpack({0},{1},{2})'.format(pl,k,t).replace(" ","")
                    Temp= m.addVar(lb=0.0, name=name )
                    var.lpack[pl,k,t] = Temp
                    primal[name]=Temp
                    
                    name='qin_sr({0},{1},{2})'.format(pl,k,t).replace(" ","")
                    Temp= m.addVar(lb=0.0, name=name)  
                    var.qin_sr[pl,k,t] = Temp
                    primal[name]=Temp
                    
                    
                    name='qout_sr({0},{1},{2})'.format(pl,k,t).replace(" ","") 
                    Temp=m.addVar(lb=0.0, name=name)
                    var.qout_sr[pl,k,t] = Temp
                    primal[name]=Temp

        
        if self.gdata.flow2dir == True:
            var.qin_rs = {}
            var.qout_rs = {}
            
            for pl in pplines:
                for t in time:
                    for k in sclim:
                        name='qin_rs({0},{1})'.format(pl,k,t).replace(" ","")
                        Temp=m.addVar(lb=0.0,name=name ) 
                        var.qin_rs[pl,k,t] = Temp
                        primal[name]=Temp
                        
                        name='qout_rs({0},{1})'.format(pl,k,t).replace(" ","")
                        Temp=m.addVar(lb=0.0, name=name)
                        var.qout_rs[pl,k,t] = Temp
                        primal[name]=Temp
        
        # Gas production (wells)
        gwells = self.gdata.wellsinfo.index.tolist()
        
        var.gprod = {}
        for gw in gwells:
            for t in time:
                for k in sclim:
                    
                    name='gprod({0},{1},{2})'.format(gw,k,t)
                    Temp= m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name=name)
                    var.gprod[gw,k,t] =Temp
                    primal[name]=Temp
                    
        # Gas storage               
        var.gsin = {}; var.gsout = {}
        var.gstore = {}
        
        for gs in self.gdata.gstorage:
            for t in time:
                for k in sclim:
                    
                    name='gsin({0},{1},{2})'.format(gs,t,k)
                    Temp=m.addVar(lb=0.0, ub=gb.GRB.INFINITY,name=name)
                    var.gsin[gs,k,t] = Temp
                    primal[name]=Temp
                    
                    name='gsout({0},{1},{2})'.format(gs,t,k)
                    Temp= m.addVar(lb=0.0, ub=gb.GRB.INFINITY,name=name)
                    var.gsout[gs,k,t] =Temp
                    primal[name]=Temp                    
                    
                    name='gstore({0},{1},{2})'.format(gs,t,k)
                    Temp=m.addVar(lb=0.0,  ub=gb.GRB.INFINITY,name=name)
                    var.gstore[gs,k,t] = Temp
                    primal[name]=Temp
        m.update()
        

 
def _build_variables_gasRT(self,mtype,dispatchElecRT):  
    """
    NB! Variables for flow from receiving to sending are not modelled
    """
    m = self.model        
    
    gnodes = self.gdata.gnodes
    pplines = self.gdata.pplineorder
    time = self.gdata.time
    gwells = self.gdata.wellsinfo.index.tolist()
    
    primal=self.variables.primal
    
    """
    Real time gas only required to handle the possible outcomes of the RT wind scenarios
    """
    scenarios = self.gdata.scenarios
        
    var=self.variables
    
    var.pr_rt = {}            # Nodal pressure : Real-time
    
    var.gflow_sr_rt = {}     # Gas flow from sending to receiving end : Real-time   
    
    var.lpack_rt = {}        # Linepack : Real-time
    var.qin_sr_rt = {}       # Flow IN pipeline (s,r) : Real-time  
    var.qout_sr_rt = {}      # Flow OUT pipeline (s,r) : Real-time
    
    var.gprodUp = {}         # Gas Production Up Regulation
    var.gprodDn = {}         # Gas Production Down Regulation
    
    var.gshed = {}           # Gas shedding : Real-time
    
    var.gsin_rt = {};        # Gas IN storage : Real-time
    var.gsout_rt = {}        # Gas OUT storage : Real-time
    var.gstore_rt = {}       # Gas stored in storage : Real-time
    
    for s in scenarios:
        for t in time:
        
            for gn in gnodes:
                name='pres_rt({0},{1},{2})'.format(gn,s,t)
                Temp= m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name=name)
                var.pr_rt[gn,s,t] = Temp
                primal[name]=Temp
                
                name='gshed({0},{1},{2})'.format(gn,s,t)
                Temp= m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name=name)
                var.gshed[gn,s,t] =Temp
                primal[name]=Temp
                
                
            for pl in pplines:
                
                name='gflow_sr_rt({0},{1},{2})'.format(pl,s,t).replace(" ","")
                Temp= m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name=name)    
                var.gflow_sr_rt[pl,s,t] =Temp 
                primal[name]=Temp
                
                name='lpack_rt({0},{1},{2})'.format(pl,s,t).replace(" ","")
                Temp= m.addVar(lb=0.0, ub=gb.GRB.INFINITY,name=name)
                var.lpack_rt[pl,s,t] =Temp 
                primal[name]=Temp
                
                name='qin_sr_rt({0},{1},{2})'.format(pl,s,t).replace(" ","")
                Temp= m.addVar(lb=0.0,ub=gb.GRB.INFINITY,  name=name)        
                var.qin_sr_rt[pl,s,t] =Temp 
                primal[name]=Temp
                
                name='qout_sr_rt({0},{1},{2})'.format(pl,s,t).replace(" ","")
                Temp= m.addVar(lb=0.0,ub=gb.GRB.INFINITY, name=name )
                var.qout_sr_rt[pl,s,t] =Temp 
                primal[name]=Temp

            for gw in gwells:
                
                name='gprodUp({0},{1},{2})'.format(gw,s,t)
                Temp= m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name=name)
                var.gprodUp[gw,s,t] =Temp 
                primal[name]=Temp
                
                
                name='gprodDn({0},{1},{2})'.format(gw,s,t)
                Temp= m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name=name)
                var.gprodDn[gw,s,t] =Temp 
                primal[name]=Temp
                
            for gs in self.gdata.gstorage:
                name='gsin_rt({0},{1},{2})'.format(gs,s,t)
                Temp= m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name=name)
                var.gsin_rt[gs,s,t] =Temp 
                primal[name]=Temp
                
                name='gsout_rt({0},{1},{2})'.format(gs,s,t)
                Temp= m.addVar(lb=0.0, ub=gb.GRB.INFINITY,name=name )
                var.gsout_rt[gs,s,t] =Temp 
                primal[name]=Temp
                
                name='gstore_rt({0},{1},{2})'.format(gs,s,t)
                Temp= m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name=name)
                var.gstore_rt[gs,s,t] =Temp
                primal[name]=Temp
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
        
        
        if self.comp  == False:      
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
        