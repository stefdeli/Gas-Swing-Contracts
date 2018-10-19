# -*- coding: utf-8 -*-
"""
Created on Sat Oct 01 13:37:04 2016

Library of Objective Functions

@author: stde
"""
import gurobipy as gb


# Objective Function - Reserve Capacity Market        
def build_objective_ReserveCapacity(self):      
    
    generators = self.data.generators
    gendata = self.data.generatorinfo
    areas = self.data.nodedf['country'].unique().tolist()    
    m = self.model        
   
    m.setObjective(
        gb.quicksum(gendata.UpCapCost[i]*self.variables.RCup[i,a] for a in areas for i in generators ) +
        gb.quicksum(gendata.DnCapCost[i]*self.variables.RCdn[i,a] for a in areas for i in generators ),
        gb.GRB.MINIMIZE)
        
 # Objective Function - Day Ahead Market        
def build_objective_DayAheadMarket(self):        
    import defaults
    
    generators = self.data.generators
    gendata = self.data.generatorinfo   
    nodes = self.data.nodes
    m = self.model
           
    m.setObjective(
        gb.quicksum(gendata.lincost[i]*self.variables.Pgen[i] for i in generators)+
        # DA Cost (load shedding)
        #gb.quicksum(defaults.VOLL * self.variables.LshedDA[n] for n in nodes),
        gb.GRB.MINIMIZE)
        
# Dummy objective function if solving optimization problem as CP 
def build_objective_dummy_complementarity(self): 
    m = self.model
    
    m.setObjective(self.variables.z, gb.GRB.MINIMIZE)
    

# Objective Function - Real-Time Market
def build_objective_RealTimeMarket(self, scenarios):
    import defaults
    var = self.variables
    generators = self.data.generators
    gendata = self.data.generatorinfo 
    nodes = self.data.nodes          
    m = self.model 
    
    scenarioprob={}    
    scenarioprob = self.data.scenprob 
    #scenarioprob = {s: 1.0/len(scenarios) for s in scenarios}
    
    
    # !NB Re-dispatch cost = Day-ahead energy cost (No premium)
    m.setObjective(
        gb.quicksum(scenarioprob[s] * (
        gb.quicksum(gendata.lincost[i]*(var.RUp[i,s]-var.RDn[i,s]) for i in generators) +
        gb.quicksum(defaults.VOLL * var.Lshed[n,s] for n in nodes)) for s in scenarios),
        gb.GRB.MINIMIZE)

# Objective Function - Sotchastic Dispatch (with reserves)        
def build_objective_StochDispatch(self, scenarios):
    import defaults
    var = self.variables
    generators = self.data.generators
    gendata = self.data.generatorinfo 
    nodes = self.data.nodes  
    areas = self.data.areas        
    m = self.model 
    
    scenarioprob={}    
    scenarioprob = {s: 1.0/len(scenarios) for s in scenarios}
    #scenarioprob = self.data.scenprob['Probability'].to_dict()
    
    # !NB Re-dispatch cost = Day-ahead energy cost (No premium)
    m.setObjective(
    # Reserve capacity cost    
    gb.quicksum(gendata.UpCapCost[i]*var.RCup[i,a] + gendata.DnCapCost[i]*var.RCdn[i,a] for i in generators for a in areas) +     
    # Day-ahead energy cost     
    gb.quicksum(gendata.lincost[i]*var.Pgen[i] for i in generators) +      
    # Real-time redispatch cost                 
    gb.quicksum(scenarioprob[s] * (                                                                                                
    gb.quicksum(gendata.lincost[i]*(var.RUp[i,s]-var.RDn[i,s]) for i in generators) +
    gb.quicksum(defaults.VOLL * var.Lshed[n,s] for n in nodes)) for s in scenarios),
    gb.GRB.MINIMIZE)
    
# Objective Function - Bilevel problem
def build_objective_Bilevel(self, scenarios):
    import defaults
    var = self.variables
    generators = self.data.generators
    gendata = self.data.generatorinfo 
    nodes = self.data.nodes  
    areas = self.data.areas        
    m = self.model 
    
    scenarioprob={}        
    scenarioprob = self.data.scenprob
    
    m.setObjective(    
    # RC cost
    gb.quicksum(gendata.UpCapCost[i]*var.RCup[i,a] for a in areas for i in generators ) +
    gb.quicksum(gendata.DnCapCost[i]*var.RCdn[i,a] for a in areas for i in generators ) +
    # DA Cost (generation)
    gb.quicksum(gendata.lincost[i]*var.Pgen[i] for i in generators) +
    # DA Cost (load shedding)
    #gb.quicksum(defaults.VOLL * var.LshedDA[n] for n in nodes) +           
    # Expected RT cost
    gb.quicksum(scenarioprob[s] * (                                                                                                
    gb.quicksum(gendata.lincost[i]*(var.RUp[i,s]-var.RDn[i,s]) for i in generators) +
    gb.quicksum(defaults.VOLL * var.Lshed[n,s] for n in nodes)) for s in scenarios),
    gb.GRB.MINIMIZE)
    
#Objective Function - Bilevel - Master problem Benders
def build_objective_Bilevel_Benders_Master(self, scenarios, multicut):  
    import defaults 
    var = self.variables
    generators = self.data.generators
    gendata = self.data.generatorinfo     
    areas = self.data.areas      
    nodes = self.data.nodes
    m = self.model
    
    scenarioprob={}        
    scenarioprob = self.data.scenprob
    
    if multicut is False:   # Single-cut Benders
        m.setObjective(
        # RC cost
        gb.quicksum(gendata.UpCapCost[i]*var.RCup[i,a] for a in areas for i in generators ) +
        gb.quicksum(gendata.DnCapCost[i]*var.RCdn[i,a] for a in areas for i in generators ) +
        # DA Cost (generation)
        gb.quicksum(gendata.lincost[i]*var.Pgen[i] for i in generators) +
        # DA Cost (load shedding)
        #gb.quicksum(defaults.VOLL * var.LshedDA[n] for n in nodes) +
        # RT cost described through cuts        
        var.alpha,
        gb.GRB.MINIMIZE)
    else:                   # Multi-cut Benders
        m.setObjective(
        # RC cost
        gb.quicksum(gendata.UpCapCost[i]*var.RCup[i,a] for a in areas for i in generators ) +
        gb.quicksum(gendata.DnCapCost[i]*var.RCdn[i,a] for a in areas for i in generators ) +
        # DA Cost (generation)
        gb.quicksum(gendata.lincost[i]*var.Pgen[i] for i in generators) +
        # DA Cost (load shedding)
        #gb.quicksum(defaults.VOLL * var.LshedDA[n] for n in nodes) +
        # RT cost described through cuts        
        gb.quicksum(scenarioprob[s] * var.alpha[s] for s in scenarios),
        gb.GRB.MINIMIZE)
        
    
# Objective Function - Bilevel - Subproblem Benders    
# !NB same as 'build_objective_RealTimeMarket' without scenario probabilities
# Scenario probabilities are taken into account in the Master (_add_cut function)    
    
def build_objective_Bilevel_Benders_Subprobelm(self, scenarios):
    import defaults
    var = self.variables
    generators = self.data.generators
    gendata = self.data.generatorinfo 
    nodes = self.data.nodes          
    m = self.model 
        
    # !NB Re-dispatch cost = Day-ahead energy cost (No premium)
    m.setObjective(
        gb.quicksum( (
        gb.quicksum(gendata.lincost[i]*(var.RUp[i,s]-var.RDn[i,s]) for i in generators) +
        gb.quicksum(defaults.VOLL * var.Lshed[n,s] for n in nodes)) for s in scenarios),
        gb.GRB.MINIMIZE)

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    