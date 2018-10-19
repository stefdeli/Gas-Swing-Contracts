# -*- coding: utf-8 -*-
"""
Created on Thu Sep 29 23:01:23 2016

@author: stde
"""

#==============================================================================
#  Data Loading  
#==============================================================================

import pandas as pd
import gurobipy as gb
import defaults
from collections import defaultdict
from itertools import chain

def _load_network(self):
    self.data.nodedf = pd.read_csv(defaults.nodefile).set_index('ID')
    self.data.linedf = pd.read_csv(defaults.linefile).set_index(['fromNode', 'toNode'])
    # # Node and edge ordering
    self.data.nodeorder = self.data.nodedf.index.tolist()
    self.data.lineorder = [tuple(x) for x in self.data.linedf.index]
    # # Line limits
    self.data.linelimit = self.data.linedf.limit.to_dict()
    
    def zero_to_inf(x):
        if x > 0.0001:
            return x
        else:
            return gb.GRB.INFINITY
    
    self.data.linelimit = {k: zero_to_inf(v) for k, v in self.data.linelimit.items()}
    self.data.lineadmittance = self.data.linedf.Y.to_dict()
    
    self.data.areas = self.data.nodedf['country'].unique().tolist()  

    nodes = self.data.nodedf['name'].unique().tolist()
    self.data.nodes = nodes      
    
    # Mapping - Node to Area        
    self.data.Map_N2A = {node: self.data.nodedf['country'][node] for node in self.data.nodedf.index}
    
    # Mapping - Area (key) to Nodes (value)
    self.data.Map_A2Ns  = defaultdict(list)
    for node in self.data.nodedf['country'].keys():
        self.data.Map_A2Ns[self.data.Map_N2A[node]].append(node) 
  

    self.data.nodetooutlines = defaultdict(list)
    self.data.nodetoinlines = defaultdict(list)   

    for l in self.data.lineorder:
        self.data.nodetooutlines[l[0]].append(l)
        self.data.nodetoinlines[l[1]].append(l)
        
    self.data.slackbuses = [self.data.nodeorder[0]]

# Find interconnected areas      
def _AreaLinks(self, tcr):
    self.data.arealink = defaultdict(list)
    self.data.tielines = defaultdict(list)
    for l in self.data.lineorder:
        n1, n2 = l
        if self.data.Map_N2A[n1] != self.data.Map_N2A[n2]:
            # Interconnected areas                
            self.data.arealink[self.data.Map_N2A[n1], self.data.Map_N2A[n2]].append(l)    

    outdict = defaultdict(list)
    for k, v in  self.data.arealink.items():
        outdict[k].extend(v)    
        outdict[k[::-1]].extend(v)
    
    # Tie-lines
    self.data.tielines = {} 
    visited = set()
    for k,v in outdict.items():    
        if k not in visited:        
            self.data.tielines[k] = v        
            visited.add(k)        
            visited.add(k[::-1])
            
    # Inter-zonal transmission capacity
    self.data.InterZonalTC = {e: sum(self.data.linelimit[l] for l in ls) for e, ls in self.data.tielines.items()}        
    
    # Transmission capacity (%) allocated to reserve exchange - Line l
    #self.data.TCforRes = defaultdict(lambda: 0.15)
    self.data.TCforRes =  {1 : tcr}
    
    # Area reserve requirements
    self.data.RR_Up_area = {'Z1': 220, 'Z2': 96, 'Z3': 74}
    self.data.RR_Dn_area = {'Z1': 162, 'Z2': 230, 'Z3': 147}
    
#    self.data.RR_Up_area = {'Z1': 5, 'Z2': 5, 'Z3': 74}
#    self.data.RR_Dn_area = {'Z1': 5, 'Z2': 5, 'Z3': 147}
    
    # Find AC lines
    self.data.AC_lines = [tuple(x) for x in self.data.linedf.index if self.data.linedf['type'][x] == 'AC']
    # Find HVDC lines
    self.data.HVDC_lines = [tuple(x) for x in self.data.linedf.index if self.data.linedf['type'][x] == 'HVDC']

    
def _load_generator_data(self):
    self.data.generatorinfo = pd.read_csv(defaults.generatorfile, index_col=0)
    self.data.generators = self.data.generatorinfo.index.tolist()
    
    # Mapping - Node (Key) to Generator (Value)      
    self.data.Map_N2Gs = defaultdict(list)
    # Mapping - Generator (Key) to Nodes (Value)       
    self.data.Map_G2Ns = defaultdict(list)      
    
    origodict = self.data.generatorinfo['origin']
    for gen, n in origodict.items():
        self.data.Map_G2Ns[gen].append(n)
        self.data.Map_N2Gs[n].append(gen)
        
    #print self.data.Map_N2Gs     
    
    self.data.Map_A2Gs = defaultdict(list)
    for a in self.data.areas:        
        l = map(lambda x: self.data.Map_N2Gs.get(x, []), self.data.Map_A2Ns[a])
        self.data.Map_A2Gs[a] = list(chain(*l))
        
    self.data.Map_G2A = defaultdict(list)
    for a, gs in self.data.Map_A2Gs.items():
        for g in gs:
            self.data.Map_G2A[g].append(a)
            
def _load_wind_data(self):
    self.data.windinfo = pd.read_csv(defaults.windfarms_file, index_col = 0)        
    self.data.windfarms = self.data.windinfo.index.tolist()    
    
    # Mapping - Node (Key) to Wind Farm (Value) 
    self.data.Map_N2Ws = defaultdict(list)
    # Mapping - Wind Farm (Key) to Nodes (Value)
    self.data.Map_W2Ns = defaultdict(list)
    
    origodict = self.data.windinfo['origin']
    for w, n in origodict.items():
        self.data.Map_W2Ns[w].append(n)
        self.data.Map_N2Ws[n].append(w)
        
    #print self.data.Map_N2Ws
    
#    self.data.Map_N2Ws = defaultdict(list)
#    for n, ws in self.data.Map_W2Ns.items():
#        for w in ws:
#            self.data.Map_N2Ws[w].append(n)
    
def _load_intial_data(self):
    self.data.load = pd.read_csv(defaults.load_file).set_index('Node')
    self.data.windscen = pd.read_csv(defaults.WindScen_file).set_index('Wind Farm')
    self.data.scenarios = self.data.windscen.columns.tolist()
    
    # For equiprobable scenarios
    self.data.scenprob = {s: 1.0/len(self.data.scenarios) for s in self.data.scenarios}
    # Expected wind power production    
    self.data.exp_wind = self.data.windscen.mean(axis=1)*self.data.windinfo.capacity
    
#    # For different probability per scenario    
#    self.data.scenprob = pd.read_csv(defaults.WindScenProb_file).set_index('Scenario')     
#    # Expected wind power production    
#    self.data.exp_wind = self.data.windscen.multiply(self.data.scenprob['Probability'].T).multiply(self.data.windinfo.capacity,axis='index').sum(axis=1)
    
    
        
