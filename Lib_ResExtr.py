# -*- coding: utf-8 -*-
"""
Created on Sat Oct 01 13:46:41 2016

Optimization Results Extraction

@author: stde
"""

import pandas as pd

def build_results_RC(self):
    
    self.results.RCup = pd.DataFrame(
         [[self.variables.RCup[i,a].x for a in self.data.areas] for i in self.data.generators],
         index=self.data.generators, columns=self.data.areas)
         
    self.results.RCdn = pd.DataFrame(
         [[self.variables.RCdn[i,a].x for a in self.data.areas] for i in self.data.generators],
         index=self.data.generators, columns=self.data.areas) 
         
def build_results_DA(self):
    
    generators = self.data.generators
    windfarms = self.data.windfarms 
    AC_lines = self.data.AC_lines
    HVDC_lines =  self.data.HVDC_lines
    nodes = self.data.nodes
    
    self.results.Pgen = pd.DataFrame(
        [self.variables.Pgen[i].x for i in generators], index=generators)
        
    self.results.WindDA = pd.DataFrame(
        [self.variables.WindDA[j].x for j in windfarms], index=windfarms)
    
#    self.results.LshedDA = pd.DataFrame(
#        [self.variables.LshedDA[node].x for node in nodes], index=nodes)
        
    self.results.lineflow_AC_DA = pd.DataFrame(
        [[self.variables.lineflow_AC_DA[l].x] for l in AC_lines], index=AC_lines, columns=['AC_flow'])
        
    self.results.lineflow_HVDC_DA = pd.DataFrame(
        [[self.variables.lineflow_HVDC_DA[l].x] for l in HVDC_lines], index=HVDC_lines, columns=['HVDC_flow'])
        
def build_results_RT(self, scenID):
    generators = self.data.generators
    windfarms = self.data.windfarms 
    nodes = self.data.nodes
    AC_lines = self.data.AC_lines
    HVDC_lines =  self.data.HVDC_lines
    
    if scenID[0] is 'All':
        scenID = self.data.scenarios
    
    self.results.RUp =  pd.DataFrame(
        [[self.variables.RUp[i,s].x for s in scenID]for i in generators], 
        index=generators, columns=scenID) 
    
    self.results.RDn =  pd.DataFrame(
        [[self.variables.RDn[i,s].x for s in scenID]for i in generators], 
        index=generators, columns=scenID)
        
    self.results.Wspill =  pd.DataFrame(
        [[self.variables.Wspill[j,s].x for s in scenID]for j in windfarms], 
        index=windfarms, columns=scenID)
        
    self.results.Lshed =  pd.DataFrame(
        [[self.variables.Lshed[n,s].x for s in scenID]for n in nodes], 
        index=nodes, columns=scenID)
        
#    self.results.lineflow_HVDC_RT =  pd.DataFrame(
#        [[self.variables.lineflow_HVDC_RT[l,s].x for s in scenID]for l in HVDC_lines], 
#        index = AC_lines, columns=scenID)
        
    self.results.lineflow_AC_RT =  pd.DataFrame(
        [[self.variables.lineflow_AC_RT[l,s].x for s in scenID]for l in AC_lines], 
        index = AC_lines, columns=scenID)
        
    
def buld_results_StochD(self):
         
     generators = self.edata.generators
     gfpp = self.edata.gfpp   
     windfarms = self.edata.windfarms 
     swingcontracts = self.edata.swingcontracts
     time = self.edata.time
     
     # Day-ahead variables
     
     self.results.Pgen = pd.DataFrame(
        [[self.variables.Pgen[i,t].x for i in generators] for t in time], index=time, columns=generators)
     
     self.results.PgenSC = pd.DataFrame(
        [[self.variables.Pgen[i,t].x for i in gfpp] for t in time], index=time, columns=gfpp)
     
     self.results.usc = pd.DataFrame(
        [self.variables.usc[sc].x for sc in swingcontracts], index=swingcontracts)
        
     self.results.WindDA = pd.DataFrame(
        [[self.variables.WindDA[j,t].x for j in windfarms] for t in time], index=time, columns=windfarms)
     
     self.results.usc = pd.DataFrame(
        [self.variables.usc[sc].x for sc in swingcontracts], index=swingcontracts)
          
     self.results.RCup = pd.DataFrame(
        [[self.variables.RCup[g,t].x for g in generators] for t in time], index=time, columns=generators)
     
     self.results.RCdn = pd.DataFrame(
        [[self.variables.RCdn[g,t].x for g in generators] for t in time], index=time, columns=generators)
    
     self.results.RCupSC = pd.DataFrame(
        [[self.variables.RCupSC[g,t].x for g in gfpp] for t in time], index=time, columns=gfpp)
     
     self.results.RCdnSC = pd.DataFrame(
        [[self.variables.RCdnSC[g,t].x for g in gfpp] for t in time], index=time, columns=gfpp)
     
     # Real-time variables 
     
     scenarios = self.edata.scenarios
     
     iterables = [self.edata.time, self.edata.scenarios]
     index = pd.MultiIndex.from_product(iterables, names=['Time', 'Scenarios'])
     
     self.results.RUp = pd.DataFrame(
        [[self.variables.RUp[g,s,t].x for g in generators] for t in time for s in scenarios ], index=index, columns = generators)
     
     self.results.RDn = pd.DataFrame(
        [[self.variables.RDn[g,s,t].x for g in generators] for t in time for s in scenarios ], index=index, columns = generators)     
      
     self.results.RUpSC = pd.DataFrame(
        [[self.variables.RUpSC[g,s,t].x for g in gfpp] for t in time for s in scenarios ], index=index, columns = generators)      
     
     self.results.RDnSC = pd.DataFrame(
        [[self.variables.RDnSC[g,s,t].x for g in gfpp] for t in time for s in scenarios ], index=index, columns = generators) 
     
     self.results.Lshed = pd.DataFrame(
        [[self.variables.Lshed[s,t].x for s in scenarios] for t in time], index=time, columns=scenarios)
     
     
     