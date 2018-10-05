# -*- coding: utf-8 -*-
"""
Created on Wed Oct 18 16:30:24 2017

@author: delikars
"""

import pandas as pd
import defaults
from collections import defaultdict


#==============================================================================
#  Data Loading  
#==============================================================================
def _load_gas_network(self,f2d):
            
    self.gdata.gnodedf = pd.read_csv(defaults.gnodefile).set_index('ID')
    self.gdata.gnodes = self.gdata.gnodedf.index.unique().tolist()
    
    self.gdata.pplinedf = pd.read_csv(defaults.pipelinefile).set_index(['fromNode', 'toNode'])
    # Node and edge ordering
    self.gdata.gnodeorder = self.gdata.gnodedf.index.tolist()
    self.gdata.pplineorder = [tuple(x) for x in self.gdata.pplinedf.index]
    pplines = self.gdata.pplineorder
    # Pipeline capacity limits
    self.gdata.pplinelimit = self.gdata.pplinedf.capacity.to_dict()
    # Pipeline type (1: non-active, 2: active i.e. with compressors)
    self.gdata.pplinetype = self.gdata.pplinedf.type.to_dict()
    self.gdata.pplineactive  = [tuple(pl) for pl in pplines if self.gdata.pplinetype[pl] == 2]
    self.gdata.pplinepassive = [tuple(pl) for pl in pplines if self.gdata.pplinetype[pl] == 1]
    # Compression ratio
    self.gdata.pplinecr = self.gdata.pplinedf.cr.to_dict()
    # Pipeline K constant - Natural gas
    self.gdata.pplineK = self.gdata.pplinedf.K.to_dict()
    # Pipeline K constant - Linepack
    self.gdata.pplinels = self.gdata.pplinedf.Klp.to_dict()
    # Initial linepack
    self.gdata.pplinelsini = self.gdata.pplinedf.lsini.to_dict()
    # Pipeline bi-directional (1) /once-through (2) flow
    self.gdata.pplinebiflow = [tuple(pl) for pl in pplines if self.gdata.pplinedf.biflow.to_dict()[pl] == 1]
    self.gdata.pplineotflow = [tuple(pl) for pl in pplines if self.gdata.pplinedf.biflow.to_dict()[pl] == 2]       
    
    self.gdata.nodetooutpplines = defaultdict(list)
    self.gdata.nodetoinpplines = defaultdict(list)   

    for pl in self.gdata.pplineorder:
        self.gdata.nodetooutpplines[pl[0]].append(pl)
        self.gdata.nodetoinpplines[pl[1]].append(pl)

     # flow2dir = True : Bi-directional flow on gas pipelines
     # flow2dir = False: Uni-directional flow on gas pipelines (from sending to receiving node)
    self.gdata.flow2dir = f2d           

    
    # Reference node gas network    
    self.gdata.refgnode = [self.gdata.gnodeorder[0]]
    
    # Fixed pressure points used for Weymouth outer approximation
    self.gdata.Nfxpp = defaults.Nfxpoints
    self.gdata.vpoints = ['v' + str(v) for v in range(defaults.Nfxpoints)]
    self.gdata.bigM = defaults.bigM


def _load_scenarios(self,dispatchElecRT):
    
    self.gdata.scenprob  = dispatchElecRT.windscenprob
    self.gdata.scenarios = dispatchElecRT.windscenarios

def _load_wells_data(self):
    self.gdata.wellsinfo = pd.read_csv(defaults.wellsfile).set_index('GasWell')
    self.gdata.wells = self.gdata.wellsinfo.index.tolist()
    
    # Define Mappings
    # Mapping A2B: A = keys, B = Values    
    self.gdata.Map_Gp2Gn = defaultdict(list)    # Mapping - Gas Producers (wells) to Gas Nodes  
    self.gdata.Map_Gn2Gp = defaultdict(list)    # Mapping - Gas Nodes to Gas Nodes Producers (wells)

    for gw, n in self.gdata.wellsinfo['Node'].iteritems():
        self.gdata.Map_Gp2Gn[gw].append(n)     
        self.gdata.Map_Gn2Gp[n].append(gw)     
    
def _load_gasload(self):
    gasload = pd.read_csv(defaults.gload_file).set_index('Time')    
    self.gdata.gasload = gasload.fillna(0) # Fill empty entries with zeros - No gas load
    
    self.gdata.time = gasload.index.tolist()
    
def _load_gas_storage(self):
    self.gdata.gstorageinfo = pd.read_csv(defaults.gstoragefile).set_index('GasStorage')
    self.gdata.gstorage = self.gdata.gstorageinfo.index.tolist()
        
    # Mapping A2B: A = keys, B = Values    
    self.gdata.Map_Gs2Gn = defaultdict(list)    # Mapping - Gas Storage to Gas Nodes  
    self.gdata.Map_Gn2Gs = defaultdict(list)    # Mapping - Gas Nodes to Gas Nodes Storage
    
    for gs, n in self.gdata.gstorageinfo['Node'].iteritems():
        self.gdata.Map_Gs2Gn[gs].append(n)     
        self.gdata.Map_Gn2Gs[n].append(gs)  
        

def _load_SCinfo(self):
    
    self.gdata.SCdata = pd.read_csv(defaults.SCdata)
    self.gdata.swingcontracts = defaultdict(list)
    self.gdata.swingcontracts = self.gdata.SCdata.SC_ID.unique().tolist()
    
    
    ###########################################################################
    
    # Swing constracts can be defined per Gas Node - Here defined per GFPP
    
    self.gdata.generatorinfo = pd.read_csv(defaults.generatorfile).set_index(['ID'])
    self.gdata.generators = self.gdata.generatorinfo.index.tolist()
    
    # Find GFPPs
    self.gdata.gfpp = [x for x in self.gdata.generatorinfo.index if self.gdata.generatorinfo['primaryfuel'][x] == 'gas']
    
    # Mapping - Gas node (Key) to Electricity generator (Value)      
    self.gdata.Map_Gn2Eg = defaultdict(list)
    origodict = self.gdata.generatorinfo['origin_gas']
    for gen, gn in origodict.iteritems():        
        self.gdata.Map_Gn2Eg[gn].append(gen)
        
    ###########################################################################
        
    
    # Map SC to GFPPs
    Sc2Gen = list()
    for sc in self.gdata.SCdata.GasNode:        
        Sc2Gen.append( self.gdata.Map_Gn2Eg[sc])
    
        
    self.gdata.SCdata['GFPP']=pd.DataFrame(Sc2Gen)         
    self.gdata.SCdata.set_index(['SC_ID','GFPP'], inplace=True) 
                 
    # Swing contracts activation profile (SCP)
    self.gdata.SCP = defaultdict(list)
    
   
    for sc in self.gdata.SCdata.index:
        for t in self.gdata.time:
            tt = self.gdata.time.index(t)+1            
            self.gdata.SCP[sc,t] = 1.0 if (tt>= self.gdata.SCdata.ts[sc] and tt<= self.gdata.SCdata.te[sc]) else 0.0

        
def _ActiveSCinfo(self,dispatchElecDA):
    
    '''
    k0 : no gas reserve activation from swing contract
    k1 : swing contract activation to max capacity
    k2 : swing contract activation to min capacity
    '''
    
    self.gdata.sclim = list('k{0}'.format(k) for k in range(3))
    
    swingcontracts = self.gdata.swingcontracts 
    
    self.gdata.RSC = defaultdict(list)
    
   
    for gen in self.gdata.SCdata.index.levels[1]:
        for k in self.gdata.sclim:
            for t in self.gdata.time:       
                
                if k =='k0':
                    self.gdata.RSC[gen,k,t] = 0.0
                elif k =='k1':
                    self.gdata.RSC[gen,k,t] = float(sum(dispatchElecDA.usc.loc[sc]*self.gdata.SCP[(sc,gen),t]*(self.gdata.SCdata.PcMax[sc,gen]-dispatchElecDA.PgenSC[gen][t]) for sc in swingcontracts)) 
                elif k == 'k2':
                    self.gdata.RSC[gen,k,t] = float(sum(dispatchElecDA.usc.loc[sc]*self.gdata.SCP[(sc,gen),t]*(self.gdata.SCdata.PcMin[sc,gen]-dispatchElecDA.PgenSC[gen][t]) for sc in swingcontracts))
                
                
                

# Swing contracts loaded per Gas Node (not per GFPP)                
                
#def _load_SCinfo(self):
#    
#    self.gdata.SCdata = pd.read_csv(defaults.SCdata)
#    self.gdata.swingcontracts = defaultdict(list)
#    self.gdata.swingcontracts = self.gdata.SCdata.SC_ID.unique().tolist()
#    
#    self.gdata.SCdata.set_index(['SC_ID','GasNode'], inplace=True) 
#                 
#    # Swing contracts activation profile (SCP)
#    self.gdata.SCP = defaultdict(list)
#    
#   
#    for sc in self.gdata.SCdata.index:
#        for t in self.gdata.time:
#            tt = self.gdata.time.index(t)+1            
#            self.gdata.SCP[sc,t] = 1.0 if (tt>= self.gdata.SCdata.ts[sc] and tt<= self.gdata.SCdata.te[sc]) else 0.0
                    
#def _windsceninfo(self, dispatchElecRT):
#    