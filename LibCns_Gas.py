# -*- coding: utf-8 -*-
"""
Created on Thu Dec  7 17:13:27 2017

@author: delikars
"""

from collections import defaultdict
import numpy as np
import itertools
import gurobipy as gb
import defaults


#==============================================================================
# Gas system constraints 
# NB! Gas storage constraints included as limits in variable definitions
#==============================================================================

#==============================================================================
# Day-ahead market
#==============================================================================

def _build_constraints_gasDA(self):
    #--- Get Parameters

        
    m = self.model
    
    var = self.variables
    gnodes = self.gdata.gnodes
    pplines = self.gdata.pplineorder
    time = self.gdata.gasload.index.tolist()
    gndata = self.gdata.gnodedf
    gstorage = self.gdata.gstorage     
    gwells = self.gdata.wellsinfo.index.tolist()
    bigM = self.gdata.bigM 
    
    sclim = self.gdata.sclim # Swing contract limits
    
    
    #--- Define Pressure Limits 
    self.constraints.slack_pressure={}
    
    if self.gdata.GasSlack=='FixInput':
        gn=self.gdata.gnodeorder[0]
        for t in time:
            for k in sclim:
                self.constraints.slack_pressure[gn,k,t] = m.addConstr(var.pr[gn,k,t],
                                                      gb.GRB.EQUAL, self.gdata.gnodedf['PresMax'][gn],
                                                      name="PresMax({0},{1},{2})".format(gn,k,t))
                     
    elif self.gdata.GasSlack=='FixOutput':
        gn=self.gdata.gnodeorder[-1] # Do it for last node
        for t in time:
            for k in sclim:
                self.constraints.slack_pressure[gn,k,t] = m.addConstr(var.pr[gn,k,t],
                                                      gb.GRB.EQUAL, self.gdata.gnodedf['PresMin'][gn],
                                                      name="PresMax({0},{1},{2})".format(gn,k,t))
                
        
    elif self.gdata.GasSlack == 'ConstantOutput':
        gn=self.gdata.gnodeorder[0]
        for tpr, t in zip(time, time[1:]):
            self.constraints.slack_pressure[tpr,t]=m.addConstr(
                    var.pr[gn,'k0',t],
                    gb.GRB.EQUAL,
                    var.pr[gn,'k0',tpr],
                    name="Constant_Slack({},{},{})".format(gn,t,tpr))


    # Gas pressure limits
    self.constraints.pr_min = {}
    self.constraints.pr_max = {}

    
    for gn in gnodes:
        for t in time: 
            for k in sclim:
                self.constraints.pr_max[gn,k,t] = m.addConstr(var.pr[gn,k,t],
                                                      gb.GRB.LESS_EQUAL, self.gdata.gnodedf['PresMax'][gn],
                                                      name="PresMax({0},{1},{2})".format(gn,k,t))
                
                self.constraints.pr_min[gn,k,t] = m.addConstr(var.pr[gn,k,t],
                                                      gb.GRB.GREATER_EQUAL, self.gdata.gnodedf['PresMin'][gn],
                                                      name="PresMin({0},{1},{2})".format(gn,k,t))
                    
          
    # --- Outer Approximation of Weymouth
    # Create Points for Outer Approximation 
    # Pressure discretization at every gas node

    prd = defaultdict(list)
    for gn in gnodes:            
        prd[gn] = np.linspace(gndata['PresMin'][gn], gndata['PresMax'][gn], self.gdata.Nfxpp).tolist()

    self.gdata.prd = prd
    
    # Create Parameter for Positive and negative part of outer approximation equation
    Kpos = defaultdict(lambda: defaultdict(list) )    
    
    for pl in self.gdata.pplinepassive:
        ns, nr = pl # Pipeline between nodes ns and nr
                   
        for vs, vr in list(itertools.product(range(self.gdata.Nfxpp), repeat = 2)):                                  
            if prd[ns][vs] > prd[nr][vr]:
                pres_s = prd[ns][vs]
                pres_r = prd[nr][vr]
                K =     self.gdata.pplineK[pl]             
                Kpos[pl][vs, vr] = K/np.sqrt(np.square(pres_s) - np.square(pres_r)) 
            
    self.gdata.Kpos = Kpos
   
    # if bi-directional flow model flow limits from Receiving to Sending end
    if self.gdata.flow2dir == True: 
        
        Kneg = defaultdict(lambda: defaultdict(list) )      
    
        for pl in self.gdata.pplinepassive:
            ns, nr = pl
                       
            for vs, vr in list(itertools.product(range(self.gdata.Nfxpp), repeat = 2)):                                  
                if prd[ns][vs] < prd[nr][vr]:
                   Kneg[pl][vs, vr] = self.gdata.pplineK[pl]/np.sqrt(np.square(prd[nr][vr]) - np.square(prd[ns][vs])) 
    
        self.gdata.Kneg = Kneg
       
    # Gas flow outer approximation
    
    gflow_sr_lim = {}   # Gas flow limit sending to receiving     
    gflow_sr_log = {}   # Logical constraint - Ensure only flow_sr OR flow_rs greater than zero
    
    if self.gdata.flow2dir == True:
        u = var.u       # if bi-directional flow u={0,1} 
    elif self.gdata.flow2dir == False:
        u = dict.fromkeys(self.variables.gflow_sr, 1.0) # if bi-directional flow u={1} i.e. from send to receive 
    
    
    for pl in self.gdata.pplineorder:
        ns, nr = pl
        for t in time:                
            for k in sclim:
                gflow_sr_log[pl,k,t] = m.addConstr(
                            var.gflow_sr[pl,k,t],
                            gb.GRB.LESS_EQUAL, u[pl,k,t]*bigM,
                            name = "gflow_sr_log({0}{1},{2})".format(pl,k,t))
    
                for vs, vr in Kpos[pl].keys():
                    gflow_sr_lim[pl,vs,vr,k,t] = m.addConstr(
                        var.gflow_sr[pl,k,t],
                        gb.GRB.LESS_EQUAL,
                        Kpos[pl][vs,vr] * prd[ns][vs] * var.pr[ns,k,t] - 
                        Kpos[pl][vs,vr] * prd[nr][vr] * var.pr[nr,k,t] 
                        +  bigM * (1.0 - u[pl,k,t])
                        ,
                        name="gflow_sr_lim({0}{1},{2})".format(pl,k,t))
    
    self.constraints.gflow_sr_log = gflow_sr_log                
    self.constraints.gflow_sr_lim = gflow_sr_lim    

    # if bi-directional flow model flow limits from Receiving to Sending end
    # if bi-directional flow add constraints from Receiving to Sending end    
    if self.gdata.flow2dir == True:
        gflow_rs_lim = {}   # Gas flow limit receiving to sending 
        gflow_rs_log = {}   # Logical constraint - Ensure only flow_sr OR flow_rs greater than zero
        
        
        for pl in self.gdata.pplineorder:
            ns, nr = pl
            for t in time:                                    
                for k in sclim:
                    gflow_rs_log[pl,k,t] = m.addConstr(
                                var.gflow_rs[pl,k,t],
                                gb.GRB.LESS_EQUAL, (1.0-u[pl,k,t])*bigM,
                                name = "gflow_rs_log({0}{1}{2})".format(pl,k,t))
                                    
                    for vs, vr in Kneg[pl].keys():
                        gflow_rs_lim[pl,vs,vr,k,t] = m.addConstr(
                            var.gflow_rs[pl,k,t],
                            gb.GRB.LESS_EQUAL,
                            Kneg[pl][vs,vr] * prd[nr][vr] * var.pr[nr,k,t] - 
                            Kneg[pl][vs,vr] * prd[ns][vs] * var.pr[ns,k,t] +
                            bigM * u[pl,k,t],
                            name="gflow_rs_lim({0}{1}{2})".format(pl,k,t) ) 
                
        self.constraints.gflow_rs_log = gflow_rs_log
        self.constraints.gflow_rs_lim = gflow_rs_lim
     
    #--- Gas well maximum production
    gprod_max = {}
    for gw in gwells:
        for k in sclim:
            for t in time:
                gprod_max[gw,t] = m.addConstr(
                        var.gprod[gw,k,t],
                        gb.GRB.LESS_EQUAL,self.gdata.wellsinfo['MaxProd'][gw],
                        name="gprod_max({0}{1}{2})".format(gw,k,t))
        
    #--- Compressors
    # Compressors - Limit the outlet pressure of compressor to be less than 
    #               full compression (max)  and above the inlet pressure (min)    
    # Compressors
    compr_max = {}      # Compression rate definition - Active pipelines
    compr_min = {}
    #new comment
    for pl in self.gdata.pplineactive:
        ns, nr = pl
        for t in time:
            for k in sclim:
                compr_max[pl,t] = m.addConstr(
                        var.pr[nr,k,t],
                        gb.GRB.LESS_EQUAL,
                        self.gdata.pplinecr[pl] * var.pr[ns,k,t],
                        name = 'compr_max({0}{1}{2})'.format(pl,k,t) )
                compr_min[pl,t] = m.addConstr(
                        var.pr[ns,k,t],
                        gb.GRB.LESS_EQUAL,
                        var.pr[nr,k,t],
                        name= 'compr_min({0},{1}{2})'.format(pl,k,t))
    
    self.constraints.compr_max = compr_max
    self.constraints.compr_min = compr_min
    
    
    #--- Line Pack Def  
    # Line-pack constraints
    gflow_sr_io = {} # Gas flow (S to R) 'decomposition' to IN/OUT
    lpack_def = {}   # Line-pack definition
    lpack_end = {}   # Line-pack level (!NB System-wide. Not per pipelne) @ end of optimization horizon
    line_store = {}  # Pipeline gas storage    
    
    for pl in pplines:
        ns, nr = pl
        
        for t in time: 
            for k in sclim:               
                gflow_sr_io[pl,k,t] = m.addConstr(
                        var.gflow_sr[pl,k,t],
                        gb.GRB.EQUAL,
                        (var.qin_sr[pl,k,t] + var.qout_sr[pl,k,t]) * 0.5,
                        name='gflow_sr_io({0}{1}{2})'.format(pl,k,t))        
            # Separate for debugging purposes
    for pl in pplines:
        ns, nr = pl
        for k in sclim: 
            for t in time:           
                lpack_def[pl,k,t] = m.addConstr(
                        var.lpack[pl,k,t],
                        gb.GRB.EQUAL,
                        self.gdata.pplinels[pl]*0.5*(var.pr[ns,k,t]+var.pr[nr,k,t]),
                        name = 'lpack_def({0},{1},{2})'.format(pl,k,t))       
        

    self.constraints.gflow_sr_io = gflow_sr_io    
    self.constraints.lpack_def = lpack_def
    
    '''
    NB! gflow_rs_io = {} # Gas flow (R to S) only if bi-directional flow. 
    This needs to be included in the line-pack definition constraint
    '''
        
    if self.gdata.flow2dir == True:
        gflow_rs_io = {} # Gas flow (R to S) 'decomposition' to IN/OUT
        
        for pl in pplines:
            ns, nr = pl
            
            for t in time:  
                for k in sclim:
                    gflow_rs_io[pl,k,t] = m.addConstr(
                            var.gflow_rs[pl,k,t],
                            gb.GRB.EQUAL,
                            (var.qin_rs[pl,k,t] + var.qout_rs[pl,k,t]) * 0.5,
                            name='gflow_rs_io({0}{1}{2})'.format(pl,k,t))             
                            
            for tpr, t in zip(time, time[1:]):     
                k = 'k0' # Line-pack storage defined for 'central case' k0
                line_store[pl,k,t] = m.addConstr(
                        var.lpack[pl,k,t],
                        gb.GRB.EQUAL,
                        var.lpack[pl,k,tpr] + var.qin_sr[pl,k,t] - var.qout_sr[pl,k,t] 
                                            + var.qin_rs[pl,k,t] - var.qout_rs[pl,k,t] ,
                        name='line_store({0},{1},{2})'.format(pl,k,t))
            
            t = time[0]
            k= 'k0' # Line-pack storage defined for 'central case' k0
            line_store[pl,k,t] = m.addConstr(
                        var.lpack[pl,k,t],
                        gb.GRB.EQUAL,
                        self.gdata.pplinelsini[pl] + var.qin_sr[pl,k,t] - var.qout_sr[pl,k,t]
                                                   + var.qin_rs[pl,k,t] - var.qout_rs[pl,k,t],
                        name='line_store({0},{1},{2})'.format(pl,k,t))
            
        self.constraints.gflow_rs_io = gflow_rs_io
        self.constraints.line_store = line_store
            
    elif self.gdata.flow2dir == False:
        
        kappa = 'k0' # Line-pack storage defined for 'central case' k0
            
        for pl in pplines:
            ns, nr = pl
            for k in sclim: # For every Scenario
                
                # For all time steps (except for t=0) 
                
                for tpr, t in zip(time, time[1:]):                
                    line_store[pl,k,t] = m.addConstr(
                            var.lpack[pl,k,t],
                            gb.GRB.EQUAL,
                            var.lpack[pl,kappa,tpr] + var.qin_sr[pl,k,t] - var.qout_sr[pl,k,t],
                            name='line_store({0},{1},{2})'.format(pl,k,t))
                
                # Time =0   Either Steady State or Transient 
                t = time[0]
                # If pipelines have linepack storage then add initial value
                if self.gdata.pplinels[pl] >0 :
                    
    
                    line_store[pl,k,t] = m.addConstr(
                                var.lpack[pl,k,t],
                                gb.GRB.EQUAL,
                                self.gdata.pplinelsini[pl] + var.qin_sr[pl,k,t] - var.qout_sr[pl,k,t],
                                name='line_store({0},{1},{2})'.format(pl,k,t))
                
                # Otherwise system is in steady state and there is no initial linepack
                else:
                    line_store[pl,k,t] = m.addConstr(
                                var.lpack[pl,k,t],
                                gb.GRB.EQUAL,
                                var.qin_sr[pl,k,t] - var.qout_sr[pl,k,t],
                                name='line_store({0},{1},{2})'.format(pl,k,t))
                

        
    
        self.constraints.line_store = line_store
                
                
    #--- Linepack End of Day
    # At end of optimization the total linepack should be within Line-pack end of optimization (only for case k0) 
    # Only need this constraint if linepack parameters are defined
    
    
    if sum(self.gdata.pplinels.values()) >0:
       
        k = 'k0'
        
        lpack_end  = m.addConstr(
                gb.quicksum(var.lpack[pl, k, time[-1]] for pl in pplines),
                gb.GRB.GREATER_EQUAL,
                gb.quicksum(self.gdata.pplinelsini[pl] for pl in pplines),
                name='lpack_end')
        
        self.constraints.lpack_end = lpack_end
    
    
    #--- Gas Storage
    
    gstor_def = {}  # Gas storage level definition
    gstor_end = {}  # Gas storage level @ end of scheduling horizon
    for gs in gstorage:
        for k in sclim:
            for tpr, t in zip(time, time[1:]):
                gstor_def[gs,k,t] = m.addConstr(
                        var.gstore[gs,k,t],
                        gb.GRB.EQUAL,
                        var.gstore[gs,k,tpr]+var.gsin[gs,k,t]-var.gsout[gs,k,t],
                        name='gstor_def({0},{1},{2})'.format(gs,k,t))
        
            t = time[0]
            gstor_def[gs,k,t] = m.addConstr(
                    var.gstore[gs,k,t],
                    gb.GRB.EQUAL,
                    self.gdata.gstorageinfo['IniStore'][gs]+var.gsin[gs,k,t]-var.gsout[gs,k,t],
                    name='gstor_def({0},{1},{2})'.format(gs,k,t))
            
            k = 'k0' # Gas storage content defined for 'central case' k0        
            gstor_end[gs] = m.addConstr(
                        var.gstore[gs, k, time[-1]],
                        gb.GRB.GREATER_EQUAL,
                        self.gdata.gstorageinfo['IniStore'][gs],
                        name='lpack_end({0}{1})'.format(gs,k))
    
    self.constraints.gstor_def = gstor_def
    self.constraints.gstor_end = gstor_end
                
     
    #--- Nodal Gas Balance 
    gas_balance = {}
    
    
    ###########################################################################    
    # Swing constracts can be defined per Gas Node - Here defined per GFPP
    # ... we need the GFPP node mapping and efficiencies 
    ###########################################################################    
    
    
    Pgen = self.gdata.Pgen 
    PgenSC = self.gdata.PgenSC 
    RSC = self.gdata.RSC 
    HR =  self.gdata.generatorinfo.HR
        
    # if bi-directional flow add in gas balance flow from Receiving to Sending end    
    if self.gdata.flow2dir == True:
        
        for k in sclim:
            for gn in gnodes:
                for t in time:                
                    gas_balance[gn,k,t] = m.addConstr(
                            gb.quicksum(var.gprod[gw,k,t] for gw in self.gdata.Map_Gn2Gp[gn]) +
                            gb.quicksum(var.qout_sr[pl,k,t] - var.qin_rs[pl,k,t] for pl in self.gdata.nodetoinpplines[gn]) +
                            gb.quicksum(var.qout_rs[pl,k,t] - var.qin_sr[pl,k,t] for pl in self.gdata.nodetooutpplines[gn])+
                            gb.quicksum(var.gsout[gs,k,t] - var.gsin[gs,k,t] for gs in self.gdata.Map_Gn2Gs[gn]),
                            gb.GRB.EQUAL,
                            self.gdata.gasload[gn][t]+
                            gb.quicksum((Pgen[gen][t]+PgenSC[gen][t]+RSC[gen,k,t])*self.gdata.generatorinfo.HR[gen] for gen in self.gdata.gfpp if gen in self.gdata.Map_Gn2Eg[gn] ),
                            name='gas_balance({0},{1},{2})'.format(gn,k,t))
     
        
        
    elif self.gdata.flow2dir == False:
        
        for t in time:
            for gn in gnodes:
                for k in sclim:
                    gas_balance[gn,k,t] = m.addConstr(
                            gb.quicksum(var.gprod[gw,k,t] for gw in self.gdata.Map_Gn2Gp[gn]) +
                            gb.quicksum(var.qout_sr[pl,k,t] for pl in self.gdata.nodetoinpplines[gn]) -
                            gb.quicksum(var.qin_sr[pl,k,t] for pl in self.gdata.nodetooutpplines[gn]) +
                            gb.quicksum(var.gsout[gs,k,t] - var.gsin[gs,k,t] for gs in self.gdata.Map_Gn2Gs[gn]),
                            gb.GRB.EQUAL,
                            self.gdata.gasload[gn][t]+
                            gb.quicksum((Pgen[gen][t]+PgenSC[gen][t]+RSC[gen,k,t])*HR[gen] for gen in self.gdata.gfpp if gen in self.gdata.Map_Gn2Eg[gn] ),
                            name='gas_balance({0},{1},{2})'.format(gn,k,t))


    self.constraints.gas_balance = gas_balance     
        
        
    m.update()
    
    
#==============================================================================
# Real-time market
#==============================================================================
 
def _build_constraints_gasRT(self,dispatchGasDA,dispatchElecRT):
    
    m = self.model
    
    var = self.variables
    gnodes = self.gdata.gnodes
    pplines = self.gdata.pplineorder
    time = self.gdata.gasload.index.tolist()
    gndata = self.gdata.gnodedf
    gstorage = self.gdata.gstorage     
    gwells = self.gdata.wellsinfo.index.tolist()
    bigM = self.gdata.bigM 
    
    scenarios = self.gdata.scenarios
    
    gprod = dispatchGasDA.gprod
    qin_sr = dispatchGasDA.qin_sr
    qout_sr = dispatchGasDA.qout_sr
    
    
    #--- Gas pressure limits
    self.constraints.pr_min = {}
    self.constraints.pr_max = {}
    
    for gn in gnodes:
        for t in time: 
            for s in scenarios:
                self.constraints.pr_max_rt = m.addConstr(var.pr_rt[gn,s,t],
                                                      gb.GRB.LESS_EQUAL, self.gdata.gnodedf['PresMax'][gn],
                                                      name="PresMax({0},{1},{2})".format(gn,s,t))
                
                self.constraints.pr_min_rt = m.addConstr(var.pr_rt[gn,s,t],
                                                      gb.GRB.GREATER_EQUAL, self.gdata.gnodedf['PresMin'][gn],
                                                      name="PresMin({0},{1},{2})".format(gn,s,t))
    #--- Outer Approximation
    # Pressure discretization at every gas node
    prd = defaultdict(list)
    for gn in gnodes:            
        prd[gn] = np.linspace(gndata['PresMin'][gn], gndata['PresMax'][gn], self.gdata.Nfxpp).tolist()

    self.gdata.prd = prd
    
    Kpos = defaultdict(lambda: defaultdict(list) )    
    
    for pl in self.gdata.pplinepassive:
        ns, nr = pl
                   
        for vs, vr in list(itertools.product(range(self.gdata.Nfxpp), repeat = 2)):                                  
            if prd[ns][vs] > prd[nr][vr]:                    
                Kpos[pl][vs, vr] = self.gdata.pplineK[pl]/np.sqrt(np.square(prd[ns][vs]) - np.square(prd[nr][vr])) 
            
    self.gdata.Kpos = Kpos
    
    # if bi-directional flow model flow limits from Receiving to Sending end    
    if self.gdata.flow2dir == True:
        
        Kneg = defaultdict(lambda: defaultdict(list) )      
    
        for pl in self.gdata.pplinepassive:
            ns, nr = pl
                       
            for vs, vr in list(itertools.product(range(self.gdata.Nfxpp), repeat = 2)):                                  
                if prd[ns][vs] < prd[nr][vr]:
                   Kneg[pl][vs, vr] = self.gdata.pplineK[pl]/np.sqrt(np.square(prd[nr][vr]) - np.square(prd[ns][vs])) 
    
        self.gdata.Kneg = Kneg
        
    # Gas flow outer approximation
    
    gflow_sr_rt_lim = {}   # Gas flow limit sending to receiving     
    gflow_sr_rt_log = {}   # Logical constraint - Ensure only flow_sr OR flow_rs greater than zero
    
    if self.gdata.flow2dir == True:
        u = var.u       # if bi-directional flow u={0,1} 
    elif self.gdata.flow2dir == False:
        u = dict.fromkeys(self.variables.gflow_sr_rt, 1.0) # if bi-directional flow u={1} i.e. from send to receive 
    
    
    for pl in self.gdata.pplineorder:
        ns, nr = pl
        for t in time:                
            for s in scenarios:
                gflow_sr_rt_log[pl,s,t] = m.addConstr(
                            var.gflow_sr_rt[pl,s,t],
                            gb.GRB.LESS_EQUAL, u[pl,s,t]*bigM,
                            name = "gflow_sr_rt_log({0}{1},{2})".format(pl,s,t))
    
                for vs, vr in Kpos[pl].keys():
                    gflow_sr_rt_lim[pl,vs,vr,s,t] = m.addConstr(
                        var.gflow_sr_rt[pl,s,t],
                        gb.GRB.LESS_EQUAL,
                        Kpos[pl][vs,vr] * prd[ns][vs] * var.pr_rt[ns,s,t] - 
                        Kpos[pl][vs,vr] * prd[nr][vr] * var.pr_rt[nr,s,t] +
                        bigM * (1.0 - u[pl,s,t]),
                        name="gflow_sr_rt_lim({0}{1}{2})".format(pl,s,t))

    self.constraints.gflow_sr_rt_log = gflow_sr_rt_log                    
    self.constraints.gflow_sr_lim = gflow_sr_rt_lim    
    
    # if bi-directional flow add constraints from Receiving to Sending end    
    if self.gdata.flow2dir == True:
        gflow_rs_rt_lim = {}   # Gas flow limit receiving to sending 
        gflow_rs_rt_log = {}   # Logical constraint - Ensure only flow_sr OR flow_rs greater than zero
        
        
        for pl in self.gdata.pplineorder:
            ns, nr = pl
            for t in time:                                    
                for s in scenarios:
                    gflow_rs_rt_log[pl,s,t] = m.addConstr(
                                var.gflow_rs_rt[pl,s,t],
                                gb.GRB.LESS_EQUAL, (1.0-u[pl,s,t])*bigM,
                                name = "gflow_rs_rt_log({0}{1}{2})".format(pl,s,t))
                                    
                    for vs, vr in Kneg[pl].keys():
                        gflow_rs_rt_lim[pl,vs,vr,s,t] = m.addConstr(
                            var.gflow_rs_rt[pl,s,t],
                            gb.GRB.LESS_EQUAL,
                            Kneg[pl][vs,vr] * prd[nr][vr] * var.pr_rt[nr,s,t] - 
                            Kneg[pl][vs,vr] * prd[ns][vs] * var.pr_rt[ns,s,t] +
                            bigM * u[pl,s,t],
                            name="gflow_rs_lim({0}{1}{2})".format(pl,s,t) ) 
                
        
        self.constraints.gflow_rs_rt_log = gflow_rs_rt_log
        self.constraints.gflow_rs_rt_lim = gflow_rs_rt_lim
           
    # Gas well maximum production
    gprodUp_max = {}
    gprodDn_max = {}
    for gw in gwells:
        for s in scenarios:
            for t in time:
                gprodUp_max[gw,t] = m.addConstr(
                        var.gprodUp[gw,s,t],
                        gb.GRB.LESS_EQUAL,
                        self.gdata.wellsinfo['MaxProd'][gw]-gprod[gw][t]['k0'],
                        name="gprodUp_max({0}{1}{2})".format(gw,s,t))
                
                gprodDn_max[gw,t] = m.addConstr(
                        var.gprodUp[gw,s,t],
                        gb.GRB.LESS_EQUAL,
                        gprod[gw][t]['k0'],
                        name="gprodDn_max({0}{1}{2})".format(gw,s,t))
        
    
    
    # Compressors - Limit the outlet pressure of compressor to be less than 
    #               full compression (max)  and above the inlet pressure (min) 
    
    compr_rt_max = {}      # Compression rate definition - Active pipelines
    compr_rt_min = {} 
    for pl in self.gdata.pplineactive:
        ns, nr = pl
        for t in time:
            for s in scenarios:
                compr_rt_max[pl,s] = m.addConstr(
                        var.pr_rt[nr,s,t],
                        gb.GRB.LESS_EQUAL,
                        self.gdata.pplinecr[pl] * var.pr_rt[ns,s,t],
                        name = 'compr_rt_max({0}{1}{2})'.format(pl,s,t) )
                compr_rt_min[pl,s] = m.addConstr(
                        var.pr_rt[ns,s,t],
                        gb.GRB.LESS_EQUAL,
                        var.pr_rt[nr,s,t],
                        name = 'compr_rt_min({0}{1}{2})'.format(pl,s,t) )
    
    self.constraints.compr_rt_max = compr_rt_max   
    self.constraints.compr_rt_min = compr_rt_min

        
    # Line-pack constraints
    gflow_sr_io_rt = {} # Gas flow (S to R) 'decomposition' to IN/OUT : Real-time
    lpack_def_rt = {}   # Line-pack definition : Real-time
    lpack_end_rt = {}   # Line-pack level (!NB System-wide. Not per pipelne) @ end of optimization horizon : Real-time
    line_store_rt = {}  # Pipeline gas storage : Real-time   
    
    for pl in pplines:
        ns, nr = pl
        
        for t in time: 
            for s in scenarios:               
                gflow_sr_io_rt[pl,s,t] = m.addConstr(
                        var.gflow_sr_rt[pl,s,t],
                        gb.GRB.EQUAL,
                        (var.qin_sr_rt[pl,s,t] + var.qout_sr_rt[pl,s,t]) * 0.5,
                        name='gflow_sr_io_rt({0}{1}{2})'.format(pl,s,t))        
            
            
                lpack_def_rt[pl,s,t] = m.addConstr(
                        var.lpack_rt[pl,s,t],
                        gb.GRB.EQUAL,
                        self.gdata.pplinels[pl]*0.5*(var.pr_rt[ns,s,t]+var.pr_rt[nr,s,t]),
                        name = 'lpack_def_rt({0},{1},{2})'.format(pl,s,t))       
        

    self.constraints.gflow_sr_io_rt = gflow_sr_io_rt
    self.constraints.lpack_def_rt = lpack_def_rt
    
    '''
    NB! gflow_rs_io = {} # Gas flow (R to S) only if bi-directional flow. 
    This needs to be included in the line-pack definition constraint
    '''
    
    for pl in pplines:
            ns, nr = pl
        
            for s in scenarios:
        
                for tpr, t in zip(time, time[1:]):                
                    line_store_rt[pl,s,t] = m.addConstr(
                            var.lpack_rt[pl,s,t],
                            gb.GRB.EQUAL,
                            var.lpack_rt[pl,s,tpr] + var.qin_sr_rt[pl,s,t] - var.qout_sr_rt[pl,s,t],
                            name='line_store_rt({0},{1},{2})'.format(pl,s,t))
            
                t = time[0]
                
                line_store_rt[pl,s,t] = m.addConstr(
                            var.lpack_rt[pl,s,t],
                            gb.GRB.EQUAL,
                            self.gdata.pplinelsini[pl] + var.qin_sr_rt[pl,s,t] - var.qout_sr_rt[pl,s,t],
                            name='line_store_rt({0},{1},{2})'.format(pl,s,t))
    
    
                lpack_end_rt[s]  = m.addConstr(
                        gb.quicksum(var.lpack_rt[pl, s, time[-1]] for pl in pplines),
                        gb.GRB.GREATER_EQUAL,
                        gb.quicksum(self.gdata.pplinelsini[pl] for pl in pplines),
                        name='lpack_end_rt({0})'.format(s))
    
    self.constraints.line_store_rt = line_store_rt
    self.constraints.lpack_end_rt = lpack_end_rt
    
    # Gas Storage
    
    gstor_def_rt = {}  # Gas storage level definition
    gstor_end_rt_max = {}  # Gas storage level @ end of scheduling horizon
    gstor_end_rt_min = {}  # Gas storage level @ end of scheduling horizon
    for gs in gstorage:
        for s in scenarios:
            for tpr, t in zip(time, time[1:]):
                gstor_def_rt[gs,s,t] = m.addConstr(
                        var.gstore_rt[gs,s,t],
                        gb.GRB.EQUAL,
                        var.gstore_rt[gs,s,tpr]+var.gsin_rt[gs,s,t]-var.gsout_rt[gs,s,t],
                        name='gstor_def_rt({0},{1},{2})'.format(gs,s,t))
        
            t = time[0]
            gstor_def_rt[gs,s,t] = m.addConstr(
                    var.gstore_rt[gs,s,t],
                    gb.GRB.EQUAL,
                    self.gdata.gstorageinfo['IniStore'][gs]+var.gsin_rt[gs,s,t]-var.gsout_rt[gs,s,t],
                    name='gstor_def_rt({0},{1},{2})'.format(gs,s,t))
            
            # At end of time the linepack should be +/- 10% percent of the initial value
            # Actual deviations stored in defaults.FINAL_LP_DEV
                    
            gstor_end_rt_max[gs] = m.addConstr(
                        var.gstore_rt[gs, s, time[-1]],
                        gb.GRB.LESS_EQUAL,
                        (1.0+defaults.FINAL_LP_DEV)*
                        self.gdata.gstorageinfo['IniStore'][gs],
                        name='lpack_end_max({0}{1})'.format(gs,s))
            
            gstor_end_rt_min[gs] = m.addConstr(
                        var.gstore_rt[gs, s, time[-1]],
                        gb.GRB.GREATER_EQUAL,
                        (1.0-defaults.FINAL_LP_DEV)*
                        self.gdata.gstorageinfo['IniStore'][gs],
                        name='lpack_end_max({0}{1})'.format(gs,s))
    
    self.constraints.gstor_def_rt = gstor_def_rt
    self.constraints.gstor_end_rt_max = gstor_end_rt_max
    self.constraints.gstor_end_rt_min = gstor_end_rt_min
    
    
    
    # Gas shedding
    gas_shed_rt = {}
    for s in scenarios:
        for gn in gnodes:
            for t in time:
                gas_shed_rt[gn,s,t] = m.addConstr(
                        var.gshed[gn,s,t],
                        gb.GRB.LESS_EQUAL,
                        self.gdata.gasload[gn][t],
                        name = 'gas_shed_rt({0},{1},{2})'.format(gn,s,t))
                
    
    
     # Nodal Gas Balance : Real-time
    
    # Here modeled only for 'uni-directional' gas flow (from S to R)    
    gas_balance_rt = {}
        
    ###########################################################################    
    # Swing constracts can be defined per Gas Node - Here defined per GFPP
    # ... we need the GFPP node mapping and efficiencies 
    ###########################################################################    
    
   
    # Up/down reserve deployment by GFPP     
    RUp_gfpp = dispatchElecRT.RUpSC.add(dispatchElecRT.RUp.loc[:, self.gdata.gfpp]) 
    RDn_gfpp = dispatchElecRT.RDnSC.add(dispatchElecRT.RDn.loc[:, self.gdata.gfpp]) 
    
    Rgfpp = RUp_gfpp - RDn_gfpp
    
    # Day-ahead gas flows
    qin_sr = dispatchGasDA.qin_sr
    qout_sr = dispatchGasDA.qout_sr
    
    HR=self.gdata.generatorinfo.HR
    
    # Day-ahead gas storage schedule
    gsin = dispatchGasDA.gsin
    gsout = dispatchGasDA.gsout
    
        
    for s in scenarios:
        for gn in gnodes:
            for t in time:                
                gas_balance_rt[gn,s,t] = m.addConstr(
                        # Change in Production
                        gb.quicksum((var.gprodUp[gw,s,t] - var.gprodDn[gw,s,t]) for gw in self.gdata.Map_Gn2Gp[gn]) 
                        # Change in flow into pipelines
                        + gb.quicksum((qout_sr[pl][t]['k0'] - var.qout_sr_rt[pl,s,t]) for pl in self.gdata.nodetoinpplines[gn]) 
                        # Change in flow out of pipes
                        + gb.quicksum(( qin_sr[pl][t]['k0']  - var.qin_sr_rt[pl,s,t] )   for pl in self.gdata.nodetooutpplines[gn]) 
                        # Change in gas storage
                        + gb.quicksum((var.gsout_rt[gs,s,t] - gsout[gs][t]['k0'] + gsin[gs][t]['k0'] - var.gsin_rt[gs,s,t]) for gs in self.gdata.Map_Gn2Gs[gn]) 
                        # Change in Power Consumption
                        - gb.quicksum(Rgfpp[gen][t,s]*HR[gen] for gen in self.gdata.gfpp if gen in self.gdata.Map_Gn2Eg[gn]) 
                        # Load SHedding
                        + var.gshed[gn,s,t],
                        gb.GRB.EQUAL, 0.0,
                        name='gas_balance({0},{1},{2})'.format(gn,s,t))


    self.constraints.gas_balance_rt = gas_balance_rt     
        
        
    m.update()
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    