# -*- coding: utf-8 -*-
"""
Created on Wed Dec  6 17:03:08 2017

@author: delikars
"""

import pandas as pd
import gurobipy as gb
import defaults
from collections import defaultdict
from itertools import chain, product

def _load_network(self):
    self.edata.nodedf = pd.read_csv(defaults.nodefile).set_index('ID')
    self.edata.linedf = pd.read_csv(defaults.linefile).set_index(['fromNode', 'toNode'])
    # # Node and edge ordering
    self.edata.nodeorder = self.edata.nodedf.index.tolist()
    self.edata.lineorder = [tuple(x) for x in self.edata.linedf.index]
    # # Line limits
    self.edata.linelimit = self.edata.linedf.limit.to_dict()
    
    def zero_to_inf(x):
        if x > 0.0001:
            return x
        else:
            return gb.GRB.INFINITY
    
    self.edata.linelimit = {k: zero_to_inf(v) for k, v in self.edata.linelimit.items()}
    self.edata.lineadmittance = self.edata.linedf.Y.to_dict()
    
    self.edata.areas = self.edata.nodedf['country'].unique().tolist()  

    nodes = self.edata.nodedf['name'].unique().tolist()
    self.edata.nodes = nodes      
    
    # Mapping - Node to Area        
    self.edata.Map_N2A = {node: self.edata.nodedf['country'][node] for node in self.edata.nodedf.index}
    
    # Mapping - Area (key) to Nodes (value)
    self.edata.Map_A2Ns  = defaultdict(list)
    for node in self.edata.nodedf['country'].keys():
        self.edata.Map_A2Ns[self.edata.Map_N2A[node]].append(node) 
  

    self.edata.nodetooutlines = defaultdict(list)
    self.edata.nodetoinlines = defaultdict(list)   

    for l in self.edata.lineorder:
        self.edata.nodetooutlines[l[0]].append(l)
        self.edata.nodetoinlines[l[1]].append(l)
        
    self.edata.slackbuses = [self.edata.nodeorder[0]]

    # Find AC lines
    self.edata.AC_lines = [tuple(x) for x in self.edata.linedf.index if self.edata.linedf['type'][x] == 'AC']
    # Find HVDC lines
    self.edata.HVDC_lines = [tuple(x) for x in self.edata.linedf.index if self.edata.linedf['type'][x] == 'HVDC']

def _load_generator_data(self):
    self.edata.generatorinfo = pd.read_csv(defaults.generatorfile).set_index(['ID'])
    self.edata.generators = self.edata.generatorinfo.index.tolist()
    
    # Mapping - Electricity node (Key) to Electricity generator (Value)      
    self.edata.Map_En2Eg = defaultdict(list)
    # Mapping - Electricity generator (Key) to Electricity nodes (Value)       
    self.edata.Map_Eg2En = defaultdict(list)      
    
    # Find GFPPs
    self.edata.gfpp = [x for x in self.edata.generatorinfo.index if self.edata.generatorinfo['primaryfuel'][x] == 'gas']
    # Find Non-GFPPs
    self.edata.nongfpp = [x for x in self.edata.generatorinfo.index if self.edata.generatorinfo['primaryfuel'][x] != 'gas']
    
    # Gas price forecast (expected) - Day-ahead stage
    self.edata.GasPriceDA = pd.read_csv(defaults.GasPriceDA_file, index_col=0)
    
    # Gas price forecast scenarios - Real-time stage
    
    self.edata.GasPriceRT = pd.read_csv(defaults.GasPriceScenRT_file, index_col=0)
    self.edata.GasPriceRT_prob = pd.read_csv(defaults.GasPriceScenRTprob_file, index_col=0)
    # Gas price scenarios index
    self.edata.gprtscen = self.edata.GasPriceRT.scenario[self.edata.GasPriceRT.index[0]].values.tolist()
    
    # Change GaPriceRT index
    self.edata.GasPriceRT.set_index(['name', 'scenario'], inplace=True)
    
    origodict = self.edata.generatorinfo['origin_elec']
    for gen, n in origodict.iteritems():
        self.edata.Map_Eg2En[gen].append(n)
        self.edata.Map_En2Eg[n].append(gen)
        
    # Mapping - Gas node (Key) to Electricity generator (Value)      
    self.edata.Map_Gn2Eg = defaultdict(list)
    # Mapping - Electricity generator (Key) to Gas nodes (Value)       
    self.edata.Map_Eg2Gn = defaultdict(list) 
        
    origodict = self.edata.generatorinfo['origin_gas']
    for gen, gn in origodict.iteritems():                
        self.edata.Map_Gn2Eg[gn].append(gen)
        self.edata.Map_Eg2Gn[gen].append(gn)
   
         
def _load_wind_data(self):
    self.edata.windinfo = pd.read_csv(defaults.windfarms_file, index_col = 0)        
    self.edata.windfarms = self.edata.windinfo.index.tolist()    
    
    # Mapping - Node (Key) to Wind Farm (Value) 
    self.edata.Map_En2W = defaultdict(list)
    # Mapping - Wind Farm (Key) to Nodes (Value)
    self.edata.Map_W2En = defaultdict(list)
    
    origodict = self.edata.windinfo['origin']
    for w, n in origodict.iteritems():
        self.edata.Map_W2En[w].append(n)
        self.edata.Map_En2W[n].append(w)
        
    self.edata.Map_A2Ws = defaultdict(list)
    for a in self.edata.areas:        
        l = map(lambda x: self.edata.Map_En2W.get(x, []), self.edata.Map_A2Ns[a])
        self.edata.Map_A2Ws[a] = list(chain(*l))
        
    self.edata.Map_W2As = defaultdict(list)
    for area, windfarms in self.edata.Map_A2Ws.items():
        for wf in windfarms:
            self.edata.Map_W2As[wf].append(area)
            
def _load_intial_data(self):
    # Demand edata - nodal values
    self.edata.load = pd.read_csv(defaults.eload_file).set_index('Node')
    
    # Demand edata - system value
    self.edata.sysload = self.edata.load.sum(0)
    
    # Wind power scenarios
    #self.edata.windscen = pd.read_csv(defaults.WindScen_file).set_index('Wind Farm')
    self.edata.windscen =  load_wind_scenarios(self)       
    self.edata.windscen_index = self.edata.windscen[self.edata.windfarms[0]].columns.tolist()
    self.edata.time = self.edata.windscen[self.edata.windfarms[0]].index.tolist()
    
    # For equiprobable scenarios
    self.edata.windscenprob = {s: 1.0/len(self.edata.windscen_index) for s in self.edata.windscen_index}
    
    # Expected wind power production        
    self.edata.exp_wind = {wf: self.edata.windscen[wf].mean(axis=1)*self.edata.windinfo.capacity[wf] for wf in self.edata.windfarms}
    
#    # For different probability per scenario    
#    self.edata.windscenprob = pd.read_csv(defaults.WindScenProb_file).set_index('Scenario')     
#    # Expected wind power production    
#    self.edata.exp_wind = self.edata.windscen.multiply(self.edata.windscenprob['Probability'].T).multiply(self.edata.windinfo.capacity,axis='index').sum(axis=1)
    
def load_wind_scenarios(self):
    
    #Nscen = 1   # Number of scenarios to load
    Nzones = 2  # Number of wind power locations
    #TimeID = Time # Time ID
    
    twindscen = {}
    for zone in range(1,Nzones+1): # 15 zones
        # File Wind scenarios zone  
        fwst = defaults.WindScen_file + '/scen_wf{0}.csv'.format(zone)
        wst = pd.read_csv(fwst).set_index('TimeID')
        windfarm = 'w{0}'.format(zone)
        twindscen[windfarm] = wst
        
   
#    idx = []   
#    for nscen in range (1, Nscen+1):
#       idx.append('s{0}'.format(nscen))       
#    windscen['Index'] = idx
#        
#    twindscen = windscen.set_index('Index').transpose()
    
    return twindscen

def _combine_wind_gprt_scenarios(self):
    
    gpprob = self.edata.GasPriceRT_prob.probability.to_dict()
    wsprob = self.edata.windscenprob
    
    wgp_scen  = list('ss{0}'.format(x) for x in range(len(gpprob.keys())*len(wsprob.keys())))
    
    
    # Combination of wind power & gas price scenarios
    self.edata.scen_wgp = {b: list(a) + [gpprob[a[0]]*wsprob[a[1]]] for a, b in zip(product(gpprob, wsprob), wgp_scen) }
    
    self.edata.scenarios = self.edata.scen_wgp.keys()

def _load_SCinfo(self):
    
    self.edata.SCdata = pd.read_csv(defaults.SCdata)
    self.edata.swingcontracts = defaultdict(list)
    self.edata.swingcontracts = self.edata.SCdata.SC_ID.unique().tolist()
    
    # Map SC to GFPPs
    Sc2Gen = list()
    for sc in self.edata.SCdata.GasNode:        
        Sc2Gen.append( self.edata.Map_Gn2Eg[sc])
    
        
    self.edata.SCdata['GFPP']=pd.DataFrame(Sc2Gen)         
    self.edata.SCdata.set_index(['SC_ID','GFPP'], inplace=True) 
                 
    # Swing contracts activation profile (SCP)
    self.edata.SCP = defaultdict(list)
    
   
    for sc in self.edata.SCdata.index:
        for t in self.edata.time:
            tt = self.edata.time.index(t)+1            
            self.edata.SCP[sc,t] = 1.0 if (tt>= self.edata.SCdata.ts[sc] and tt<= self.edata.SCdata.te[sc]) else 0.0
            







