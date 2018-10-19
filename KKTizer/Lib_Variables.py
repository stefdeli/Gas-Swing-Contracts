# -*- coding: utf-8 -*-
"""
Created on Fri Sep 30 19:57:45 2016

@author: stde
"""
import gurobipy as gb

#==============================================================================
# General Functions
#==============================================================================
def build_SOS1_Dual_vars(self, setlist, VarName):
    from itertools import product
    m = self.model    
    
    mu ={}; SOS1 = {}
    for ix in list(product(*setlist)) if len(setlist)>1 else list(*setlist):
        mun = 'mu_' + VarName 
        mu[ix] = m.addVar(lb = 0, name =  (mun +'Min({0})'.format(','.join(ix))) if len(setlist)>1 else mun + 'Min({0})'.format(ix) )
        nSOS1 ='SOS1_'+ VarName
        SOS1[ix] = m.addVar(lb= 0, name =  (nSOS1 + 'Min({0})'.format(','.join(ix))) if len(setlist)>1 else nSOS1 + 'Min({0})'.format(ix) )
        
    return (mu, SOS1)

                    
def build_dummy_objective_var(self):    
    m = self.model    
    self.variables.z = {}
    self.variables.z =  m.addVar(lb=0, name='z')
    
    m.update()

#==============================================================================
# Reserve capacity market variables     
#==============================================================================

def build_variables_RC(self):  

    m = self.model
    generators = self.data.generators
    areas = self.data.nodedf['country'].unique().tolist()
    self.data.areas = areas        

    # Upward reserve capacity
    self.variables.RCup = {}
    for i in generators:
        for a in areas:
            self.variables.RCup[i,a] = m.addVar(lb=0.0, name='RCup({0},{1})'.format(i,a))
            
    # Downward reserve capacity
    self.variables.RCdn = {}
    for i in generators:
        for a in areas:
            self.variables.RCdn[i,a] = m.addVar(lb=0.0, name='RCdn({0},{1})'.format(i,a))                
    m.update()

def build_SOS1_dual_variables_RC(self):
    # If running complementarity model or MPEC etc.
    # Build SOS1 variables + Dual variables

    m = self.model
    areas = self.data.areas
    generators = self.data.generators
    tielines = self.data.tielines.keys()
    
    # SOS1 + Dual variables lower bounds, i.e., x>0,
    self.variables.SOS1_RCupMin = {}; self.variables.mu_RCupMin = {} 
    self.variables.SOS1_RCdnMin = {}; self.variables.mu_RCdnMin = {}  
    
    self.variables.mu_RCupMin, self.variables.SOS1_RCupMin = build_SOS1_Dual_vars(self, (generators, areas), 'RCup')
    self.variables.mu_RCdnMin, self.variables.SOS1_RCdnMin = build_SOS1_Dual_vars(self, (generators, areas), 'RCdn')
    
 
    # Inequality constraints - Define both SOS1 and Dual variables       
    self.variables.SOS1_RCupmax = {}; self.variables.mu_RCupmax = {}    
    self.variables.SOS1_RCdnmax = {}; self.variables.mu_RCdnmax = {}
    
    for gen in generators:
        self.variables.SOS1_RCupmax[gen] = m.addVar(lb=0, name='SOS1_RCupmax({0})'.format(gen))
        self.variables.mu_RCupmax[gen] = m.addVar(lb=0, name='mu_RCupmax({0})'.format(gen))
        self.variables.SOS1_RCdnmax[gen] = m.addVar(lb=0, name='SOS1_RCdnmax({0})'.format(gen))
        self.variables.mu_RCdnmax[gen] = m.addVar(lb=0, name='mu_RCdnmax({0})'.format(gen))

    self.variables.SOS1_RRup = {}; self.variables.mu_RRup = {}    
    self.variables.SOS1_RRdn = {}; self.variables.mu_RRdn = {}

    for area in areas:
        self.variables.SOS1_RRup[area] = m.addVar(lb=0, name='SOS1_RRup({0})'.format(area))
        self.variables.mu_RRup[area] = m.addVar(lb=0, name='mu_RRup({0})'.format(area))
        self.variables.SOS1_RRdn[area] = m.addVar(lb=0, name='SOS1_RRdn({0})'.format(area))
        self.variables.mu_RRdn[area] = m.addVar(lb=0, name='mu_RRdn({0})'.format(area))
  
    # SOS1 and dual variables XB reserve exchange constraint 
    # Same tie-line [tlink] for: Sending (S) and Receiving (R) ends
    self.variables.SOS1_RupExR = {}; self.variables.mu_RupExR = {}    
    self.variables.SOS1_RupExS = {}; self.variables.mu_RupExS = {} 
    
    self.variables.SOS1_RdnExR = {}; self.variables.mu_RdnExR = {}    
    self.variables.SOS1_RdnExS = {}; self.variables.mu_RdnExS = {} 
    
    for tlink in tielines:
        self.variables.SOS1_RupExR[tlink] = m.addVar(lb=0, name='SOS1_RupExR({0})'.format(tlink))
        self.variables.mu_RupExR[tlink] = m.addVar(lb=0, name='mu_RupExR({0})'.format(tlink))
        self.variables.SOS1_RupExS[tlink] = m.addVar(lb=0, name='SOS1_RupExS({0})'.format(tlink))
        self.variables.mu_RupExS[tlink] = m.addVar(lb=0, name='mu_RupExS({0})'.format(tlink))
        
        self.variables.SOS1_RdnExR[tlink] = m.addVar(lb=0, name='SOS1_RdnExR({0})'.format(tlink))
        self.variables.mu_RdnExR[tlink] = m.addVar(lb=0, name='mu_RdnExR({0})'.format(tlink))
        self.variables.SOS1_RdnExS[tlink] = m.addVar(lb=0, name='SOS1_RdnExS({0})'.format(tlink))
        self.variables.mu_RdnExS[tlink] = m.addVar(lb=0, name='mu_RdnExS({0})'.format(tlink))

    m.update()
    
    
#==============================================================================
# Upper level variables - Bilevel optimization
#==============================================================================

# (These are only upper level decision variables - Enter as parameters in the 
#  lower level RC market-clearing -No KKTs etc.-)
    
def build_UL_variables(self):
    
    m = self.model
    areas = self.data.areas    
    
    # Area reserves requirement
    self.variables.RR_Up_area = {}     # Upward reserves req
    self.variables.RR_Dn_area = {}     # Downward reserves req
    for area in areas:
        self.variables.RR_Up_area[area] = m.addVar(lb=0.0, name='RR_Up_area({0})'.format(area))
        self.variables.RR_Dn_area[area] = m.addVar(lb=0.0, name='RR_Dn_area({0})'.format(area))
        
    # Cross-border transmission capacity allocation (Energy vs. Reserves)
    XBlines = self.data.InterZonalTC
    
    self.variables.TCforRes = {}        # Trasnmission Cap allocated for Reserve Exchange
    for XBline in XBlines:
        self.variables.TCforRes[XBline] = m.addVar(lb=0.0, ub=1.0, name='TCforRes({0})'.format(XBline))
        
    m.update()

#==============================================================================
# Day-ahead market variables
#==============================================================================

def build_variables_DA(self):      

    m = self.model
    var = self.variables
    generators = self.data.generators
    windfarms = self.data.windfarms 
    nodes = self.data.nodes      
                     
   # Dispatchable generators
    var.Pgen = {}
    for i in generators:
        var.Pgen[i] = m.addVar(lb=0.0, name = 'Pgen({0})'.format(i))
              
   # Non-Dispatchable generators (Wind)
    var.WindDA = {}
    for j in windfarms:
        var.WindDA[j] = m.addVar(lb=0.0, name = 'WindDA({0})'.format(j))
                        
   # Nodal phase angles  (Day-ahead)
    var.nodeangleDA = {}
    for n in nodes:
        var.nodeangleDA[n] = m.addVar(lb=-gb.GRB.INFINITY, ub=gb.GRB.INFINITY, name='nodeangleDA({0})'.format(n))

    m.update()
    # Slack bus setting Day-ahead
    for n in self.data.slackbuses:
        var.nodeangleDA[n].ub = 0
        var.nodeangleDA[n].lb = 0

    # AC line flow Day-ahead                
    var.lineflow_AC_DA = {}
    for l in self.data.AC_lines: 
        var.lineflow_AC_DA[l] = m.addVar(lb=-gb.GRB.INFINITY, ub=gb.GRB.INFINITY, name='lineflow_AC_DA({0})'.format(l))
          

    # HVDC line flow Day-ahead        
    var.lineflow_HVDC_DA = {}
    for l in self.data.HVDC_lines: 
        var.lineflow_HVDC_DA[l] = m.addVar(lb=-gb.GRB.INFINITY, ub=gb.GRB.INFINITY, name='lineflow_HVDC_DA({0})'.format(l))
        
    # Load shedding in DA stage (to improve feasibility in Benders' Master problem)
#    var.LshedDA = {}
#    for node in nodes:
#        var.LshedDA[node] =  m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name='LshedDA({0})'.format(node)) 
         
    m.update()
        
       
def build_SOS1_dual_variables_DA(self):
    # If running complementarity model or MPEC etc.
    # Build SOS1 variables + Dual variables

    m = self.model
    generators = self.data.generators
    windfarms = self.data.windfarms
    AC_lines = self.data.AC_lines
    HVDC_lines = self.data.HVDC_lines
    nodes = self.data.nodes
    
    # SOS1 + Dual variables lower bounds, i.e., x>0
    
    #self.variables.mu_PgenMin, self.variables.SOS1_PgenMin = build_SOS1_Dual_vars(self, [generators], 'Pgen')
    self.variables.mu_WindDAMin, self.variables.SOS1_WindDAMin = build_SOS1_Dual_vars(self, [windfarms], 'WindDA')
    #self.variables.mu_LshedDAMin, self.variables.SOS1_LshedDAMin = build_SOS1_Dual_vars(self, [nodes], 'LshedDA')
   
    # Inequality constraints - Define both SOS1 and Dual variables       
    self.variables.SOS1_PmaxDA = {}; self.variables.mu_PmaxDA = {}
    self.variables.SOS1_PminDA = {}; self.variables.mu_PminDA = {}
    
    self.variables.SOS1_WindmaxDA = {}; self.variables.mu_WindmaxDA = {}
    
    self.variables.SOS1_flow_lim_upper_AC_DA = {}; self.variables.mu_flow_lim_upper_AC_DA = {}        
    self.variables.SOS1_flow_lim_lower_AC_DA = {}; self.variables.mu_flow_lim_lower_AC_DA = {}        
    self.variables.SOS1_flow_lim_upper_HVDC_DA = {}; self.variables.mu_flow_lim_upper_HVDC_DA = {}
    self.variables.SOS1_flow_lim_lower_HVDC_DA = {}; self.variables.mu_flow_lim_lower_HVDC_DA = {}

    #self.variables.SOS1_LshedDAMax = {}; self.variables.mu_LshedDAMax = {}

    # Equality constraints - Define only dual variables
    self.variables.lambda_PowerBalDA = {}
    self.variables.lambda_flow_to_angleDA = {}
    self.variables.lambda_slack_bus_DA = {}
    
    for i in generators:
        self.variables.SOS1_PmaxDA[i] = m.addVar(lb=0, name='SOS1_PmaxDA({0})'.format(i))
        self.variables.mu_PmaxDA[i] = m.addVar(lb=0, name='mu_PmaxDA({0})'.format(i))
        self.variables.SOS1_PminDA[i] = m.addVar(lb=0, name='SOS1_PminDA({0})'.format(i))
        self.variables.mu_PminDA[i] = m.addVar(lb=0, name='mu_PminDA({0})'.format(i))
        
    for j in windfarms:
        self.variables.SOS1_WindmaxDA[j] = m.addVar(lb=0, name='SOS1_WindmaxDA({0})'.format(j))
        self.variables.mu_WindmaxDA[j] = m.addVar(lb=0, name='mu_WindmaxDA({0})'.format(j))
        
    for l in AC_lines:
        self.variables.SOS1_flow_lim_upper_AC_DA[l] = m.addVar(lb=0, name='SOS1_flow_lim_upper_AC_DA{0}'.format(l))
        self.variables.mu_flow_lim_upper_AC_DA[l] = m.addVar(lb=0, name='mu_flow_lim_upper_AC_DA{0}'.format(l))        
        self.variables.SOS1_flow_lim_lower_AC_DA[l] = m.addVar(lb=0, name='SOS1_flow_lim_lower_AC_DA{0}'.format(l))
        self.variables.mu_flow_lim_lower_AC_DA[l] = m.addVar(lb=0, name='mu_flow_lim_lower_AC_DA{0}'.format(l))
        
        self.variables.lambda_flow_to_angleDA[l] = m.addVar(lb=-gb.GRB.INFINITY, ub=gb.GRB.INFINITY, name='lambda_flow_to_angleDA{0}'.format(l))
        
    for l in HVDC_lines:
        self.variables.SOS1_flow_lim_upper_HVDC_DA[l] = m.addVar(lb=0, name='SOS1_flow_lim_upper_HVDC_DA{0}'.format(l))
        self.variables.mu_flow_lim_upper_HVDC_DA[l] = m.addVar(lb=0, name='mu_flow_lim_upper_HVDC_DA{0}'.format(l))
        self.variables.SOS1_flow_lim_lower_HVDC_DA[l] = m.addVar(lb=0, name='SOS1_flow_lim_lower_HVDC_DA{0}'.format(l))
        self.variables.mu_flow_lim_lower_HVDC_DA[l] = m.addVar(lb=0, name='mu_flow_lim_lower_HVDC_DA{0}'.format(l))
        
    for n in nodes:
        self.variables.lambda_PowerBalDA[n] = m.addVar(lb=-gb.GRB.INFINITY, ub=gb.GRB.INFINITY, 
                                                        name = 'lambda_PowerBalDA({0})'.format(n))   
#        # Load-shedding Day-ahead
#        self.variables.SOS1_LshedDAMax[n] = m.addVar(lb=0, name='SOS1_LshedDAMax({0})'.format(n))
#        self.variables.mu_LshedDAMax[n] = m.addVar(lb=0, name='mu_LshedDAMax({0})'.format(n))        
        
    for n in self.data.slackbuses:
        self.variables.lambda_slack_bus_DA[n] = m.addVar(lb=-gb.GRB.INFINITY, ub=gb.GRB.INFINITY, 
                                                        name = 'lambda_slack_bus_DA({0})'.format(n))
        
    m.update()
#==============================================================================
# Real-time market variables
#==============================================================================

def build_variables_RT(self, scenarios, StochD, ERCoopt, dDA):
 # dDA = Day-ahead dispatch
       
    m = self.model        
    generators = self.data.generators
    gendata = self.data.generatorinfo
    windfarms = self.data.windfarms 
    nodes = self.data.nodes
    areas = self.data.areas
    

    self.variables.RUp = {}         # Up Regulation
    self.variables.RDn = {}         # Down Regulation        
    self.variables.Wspill = {}      # Wind spillage        
    self.variables.Lshed = {}       # Load shedding
    self.variables.nodeangleRT = {} # Voltage angles
  
 
    # If sequential market-clearing: FIX wind DA value to day-ahead dispatch (dDA)
    # If stochastic market-clearing: Var wind DA built by DA class              
    if StochD is False:        
        WindDA_schedule = dDA.wind
        self.variables.WindDA = {}
        for j in windfarms:
            self.variables.WindDA[j] = m.addVar(lb=WindDA_schedule.loc[j], ub=WindDA_schedule.loc[j], 
                                                name='WindDA({0})'.format(j))     
            
    # If reserve capacity market: FIX RC up/down to RC procurement (ERCoopt: False)
    # If stochastic market-clearing: Vars RCup/RCdn built by DA class     
    if StochD is False:        
        self.variables.RCup = {}
        self.variables.RCdn = {}
        if ERCoopt is False:
            for i in generators:
                for a in areas:
                     self.variables.RCup[i, a] = m.addVar(lb = dDA.RCup_proc[a][i], ub = dDA.RCup_proc[a][i], name='RCup({0},{1})'.format(i, a))
                     self.variables.RCdn[i, a] = m.addVar(lb = dDA.RCdn_proc[a][i], ub = dDA.RCdn_proc[a][i], name='RCdn({0},{1})'.format(i, a))
        elif ERCoopt is True:
            for i in generators:
                for a in areas:
 #                    self.variables.RCup[i, a] = m.addVar(lb=0.0, ub=gb.GRB.INFINITY)   #Co-optimization
 #                    self.variables.RCdn[i, a] = m.addVar(lb=0.0, ub=gb.GRB.INFINITY)    #Co-optimization
                     self.variables.RCup[i, a] = m.addVar(lb=0.0, ub=gendata.upreg[i],   name='RCup({0},{1})'.format(i, a)) #Co-optimization
                     self.variables.RCdn[i, a] = m.addVar(lb=0.0, ub=gendata.downreg[i], name='RCup({0},{1})'.format(i, a)) #Co-optimization 
   
    
    for s in scenarios:                        
        for i in generators:                           
            self.variables.RUp[i,s] = m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name='RUp({0},{1})'.format(i,s))
            self.variables.RDn[i,s] = m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name='RDn({0},{1})'.format(i,s))                                
            
        for j in windfarms:
            self.variables.Wspill[j,s] = m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name='Wspill({0},{1})'.format(j,s))
        
        for n in nodes:
            self.variables.Lshed[n,s] =  m.addVar(lb=0.0, ub=gb.GRB.INFINITY, name='Lshed({0},{1})'.format(n,s))
            self.variables.nodeangleRT[n,s] = m.addVar(lb=-gb.GRB.INFINITY, ub=gb.GRB.INFINITY, name='nodeangleRT({0},{1})'.format(n,s))
            
    # AC line flow Day-ahead 
    # If sequential market-clearing: FIX AC line flow value to day-ahead schedule    
    if StochD is False:  
        self.variables.lineflow_AC_DA = {}
        for l in self.data.AC_lines:
            self.variables.lineflow_AC_DA[l] = m.addVar(lb=dDA.lineflow_AC_DA['AC_flow'][l], ub=dDA.lineflow_AC_DA['AC_flow'][l], name='lineflow_AC_DA({0})'.format(l))
            
    # AC line flow Real-time
    lineflow_AC_RT = {}
    # HVDC line flow Day-ahead        
    lineflow_HVDC_RT = {}
    for s in scenarios:
        for l in self.data.AC_lines: 
            lineflow_AC_RT[l,s] = m.addVar(lb=-gb.GRB.INFINITY, ub=gb.GRB.INFINITY, name='lineflow_AC_RT({0})'.format(l,s))
        self.variables.lineflow_AC_RT = lineflow_AC_RT
        for l in self.data.HVDC_lines: 
            lineflow_HVDC_RT[l,s] = m.addVar(lb=-gb.GRB.INFINITY, ub=gb.GRB.INFINITY, name='lineflow_HVDC_RT({0})'.format(l,s))
        self.variables.lineflow_HVDC_RT = lineflow_HVDC_RT
     
    m.update()   
        
    # Slack bus setting Real-time
    for n in self.data.slackbuses:
        for s in scenarios:
            self.variables.nodeangleRT[n,s].ub = 0
            self.variables.nodeangleRT[n,s].lb = 0   
    
    # Fix DA load-sheading schedule                                  
    #LshedDA_schedule = dDA.lshedDA
    self.variables.LshedDA = {}
    for node in nodes:        
        self.variables.LshedDA[node] =  m.addVar(lb=0.0, 
                                                 ub=0.0, 
                                                 name='LshedDA({0})'.format(node))  
#=LshedDA_schedule.loc[node]        
            
    m.update()