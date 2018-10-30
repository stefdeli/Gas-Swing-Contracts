# -*- coding: utf-8 -*-
"""
Created on Fri Dec  8 13:42:43 2017
@author: delikars
"""

import pandas as pd
import numpy as np

    
def _results_StochD(self):
         
     generators = self.edata.generators
     gfpp = self.edata.gfpp   
     windfarms = self.edata.windfarms 
     swingcontracts = self.edata.swingcontracts
     time = self.edata.time
     
     # Day-ahead variables
     
     self.results.Pgen = pd.DataFrame(
        [[self.variables.Pgen[i,t].x for i in generators] for t in time], index=time, columns=generators)
        
     self.results.WindDA = pd.DataFrame(
        [[self.variables.WindDA[j,t].x for j in windfarms] for t in time], index=time, columns=windfarms)
     
     self.results.usc = pd.DataFrame(
        [self.variables.usc[sc].x for sc in swingcontracts], index=swingcontracts)
     
     self.results.PgenSC = pd.DataFrame(
        [[self.variables.PgenSC[g,t].x for g in gfpp] for t in time], index=time, columns=gfpp)
     
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
     
     iterables = [time, scenarios]
     index = pd.MultiIndex.from_product(iterables, names=['Time', 'Scenarios'])
     
     self.results.RUp = pd.DataFrame(
        [[self.variables.RUp[g,s,t].x for g in generators] for t in time for s in scenarios ], index=index, columns = generators)
     
     self.results.RDn = pd.DataFrame(
        [[self.variables.RDn[g,s,t].x for g in generators] for t in time for s in scenarios ], index=index, columns = generators)     
      
     self.results.RUpSC = pd.DataFrame(
        [[self.variables.RUpSC[g,s,t].x for g in gfpp] for t in time for s in scenarios ], index=index, columns = gfpp)      
     
     self.results.RDnSC = pd.DataFrame(
        [[self.variables.RDnSC[g,s,t].x for g in gfpp] for t in time for s in scenarios ], index=index, columns = gfpp) 
     
     self.results.Lshed = pd.DataFrame(
        [[self.variables.Lshed[s,t].x for s in scenarios] for t in time], index=time, columns=scenarios)
     
     self.results.Wspill = pd.DataFrame(
        [[self.variables.Wspill[j,s,t].x for j in windfarms] for t in time for s in scenarios], index=index, columns=windfarms)
     
     
def _results_gasDA(self, f2d):
     
    r = self.results
    var = self.variables
    time = self.gdata.time
    sclim = self.gdata.sclim
     
    
    iterables = [self.gdata.time, self.gdata.sclim]
    index = pd.MultiIndex.from_product(iterables, names=['Time', 'Sclim'])
    
    r.lpack = pd.DataFrame([[var.lpack[pl,k,t].x for pl in self.gdata.pplineorder] for t in time for k in sclim], index=index, columns=self.gdata.pplineorder)
    r.gprod = pd.DataFrame([[var.gprod[gw,k,t].x for gw in self.gdata.wells] for t in time for k in sclim], index=index, columns=self.gdata.wells)
    r.gflow_sr = pd.DataFrame([[var.gflow_sr[pl,k,t].x for pl in self.gdata.pplineorder] for t in time for k in sclim], index=index, columns=self.gdata.pplineorder)
    
    r.pr = pd.DataFrame([[var.pr[ng,k,t].x for ng in self.gdata.gnodeorder] for t in time for k in sclim], index=index, columns=self.gdata.gnodeorder)
    
    
    r.qin_sr = pd.DataFrame([[var.qin_sr[pl,k,t].x for pl in self.gdata.pplineorder] for t in time for k in sclim], index=index, columns=self.gdata.pplineorder)    
    r.qout_sr = pd.DataFrame([[var.qout_sr[pl,k,t].x for pl in self.gdata.pplineorder] for t in time for k in sclim], index=index, columns=self.gdata.pplineorder)    
    
    r.gsin = pd.DataFrame([[var.gsin[gs,k,t].x for gs in self.gdata.gstorage] for t in time for k in sclim],  index=index, columns=self.gdata.gstorage)
    r.gsout = pd.DataFrame([[var.gsout[gs,k,t].x for gs in self.gdata.gstorage] for t in time for k in sclim],  index=index, columns=self.gdata.gstorage)
    r.gstore = pd.DataFrame([[var.gstore[gs,k,t].x for gs in self.gdata.gstorage] for t in time for k in sclim],  index=index, columns=self.gdata.gstorage)
    
    if f2d == True:
        r.gflow_rs = pd.DataFrame([[var.gflow_rs[pl,k,t].x for pl in self.gdata.pplineorder] for t in time for k in sclim], index=index, columns=self.gdata.pplineorder)
        r.qin_rs = pd.DataFrame([[var.qin_rs[pl,k,t].x for pl in self.gdata.pplineorder] for t in time for k in sclim], index=index, columns=self.gdata.pplineorder)
        r.qout_rs = pd.DataFrame([[var.qout_rs[pl,k,t].x for pl in self.gdata.pplineorder] for t in time for k in sclim], index=index, columns=self.gdata.pplineorder)
        
#    r.costGas = np.dot(r.gprod,np.array(self.gdata.wellsinfo.Cost)).sum()
        
        
def _results_elecRT(self):
     
     generators = self.edata.generators
     gfpp = self.edata.gfpp   
     windfarms = self.edata.windfarms      
     time = self.edata.time
         
     scenarios = self.edata.windscen_index # Only wind power scenarios
     
     iterables = [time, scenarios]
     index = pd.MultiIndex.from_product(iterables, names=['Time', 'Scenarios'])
     
     self.results.RUp = pd.DataFrame(
        [[self.variables.RUp[g,s,t].x for g in generators] for t in time for s in scenarios ], index=index, columns = generators)
     
     self.results.RDn = pd.DataFrame(
        [[self.variables.RDn[g,s,t].x for g in generators] for t in time for s in scenarios ], index=index, columns = generators)     
      
     self.results.RUpSC = pd.DataFrame(
        [[self.variables.RUpSC[g,s,t].x for g in gfpp] for t in time for s in scenarios ], index=index, columns = gfpp)      
     
     self.results.RDnSC = pd.DataFrame(
        [[self.variables.RDnSC[g,s,t].x for g in gfpp] for t in time for s in scenarios ], index=index, columns = gfpp) 
     
     self.results.Lshed = pd.DataFrame(
        [[self.variables.Lshed[s,t].x for s in scenarios] for t in time], index=time, columns=scenarios)
     
     self.results.Wspill = pd.DataFrame(
        [[self.variables.Wspill[j,s,t].x for j in windfarms] for t in time for s in scenarios], index=index, columns=windfarms)
        
#    r.costGas = np.dot(r.gprod,np.array(self.gdata.wellsinfo.Cost)).sum()
     
     
def _results_gasRT(self, f2d):
     
    r = self.results
    var = self.variables
    time = self.gdata.time
    scenarios = self.gdata.scenarios
     
    
    iterables = [self.gdata.time, scenarios]
    index = pd.MultiIndex.from_product(iterables, names=['Time', 'Scenarios'])
    
    r.lpack_rt = pd.DataFrame([[var.lpack_rt[pl,s,t].x for pl in self.gdata.pplineorder] for t in time for s in scenarios], index=index, columns=self.gdata.pplineorder)
    r.gprodUp = pd.DataFrame([[var.gprodUp[gw,s,t].x for gw in self.gdata.wells] for t in time for s in scenarios], index=index, columns=self.gdata.wells)
    r.gprodDn = pd.DataFrame([[var.gprodDn[gw,s,t].x for gw in self.gdata.wells] for t in time for s in scenarios], index=index, columns=self.gdata.wells)    
    r.gshed = pd.DataFrame([[var.gshed[gn,s,t].x for gn in self.gdata.gnodes] for t in time for s in scenarios], index=index, columns=self.gdata.gnodes)
    
    r.pr_rt = pd.DataFrame([[var.pr_rt[ng,k,t].x for ng in self.gdata.gnodeorder] for t in time for k in scenarios], index=index, columns=self.gdata.gnodeorder)
    
    r.gflow_sr_rt = pd.DataFrame([[var.gflow_sr_rt[pl,k,t].x for pl in self.gdata.pplineorder] for t in time for k in scenarios], index=index, columns=self.gdata.pplineorder)
    r.qin_sr_rt = pd.DataFrame([[var.qin_sr_rt[pl,k,t].x for pl in self.gdata.pplineorder] for t in time for k in scenarios], index=index, columns=self.gdata.pplineorder)    
    r.qout_sr_rt = pd.DataFrame([[var.qout_sr_rt[pl,k,t].x for pl in self.gdata.pplineorder] for t in time for k in scenarios], index=index, columns=self.gdata.pplineorder)  