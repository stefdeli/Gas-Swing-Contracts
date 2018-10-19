# -*- coding: utf-8 -*-
"""
Created on Mon Dec 12 19:47:40 2016

@author: stde
"""


#import numpy as np
#import matplotlib.pyplot as plt
import gurobipy as gb
import Lib_ObjFnct
import Lib_Variables
import Data_Load
#import Build_constraints

class expando(object):
    pass

class GurobiPY():
    def __init__(self, comp = False, BL = False):
                
        self.data = expando()
        self.variables = expando() 
        self.constraints = {}
        self.results = expando()
        self._load_data()
        
        self._build_model_RC(comp, BL)  
        
        self._build_CP()
        Lib_Variables.build_dummy_objective_var(self)
        Lib_ObjFnct.build_objective_dummy_complementarity(self)

    def optimize(self):
        self.model.optimize()
        
    def _load_data(self):
        Data_Load._load_network(self)     
        Data_Load._AreaLinks(self,0.0)
        Data_Load._load_generator_data(self)
        Data_Load._load_wind_data(self)
        Data_Load._load_intial_data(self)

    def _build_model_RC(self, comp, BL):
        self.model = gb.Model()
        m = self.model
        generators = self.data.generators
        gendata = self.data.generatorinfo
        areas = self.data.nodedf['country'].unique().tolist()
        self.data.areas = areas                
        
        
        self.variables.primal = {}
    
        for i in generators:
            for a in areas:
                # Upward reserve capacity
                self.variables.primal['RCup({0},{1})'.format(i,a)] = m.addVar(lb=0.0, name='RCup({0},{1})'.format(i,a))                
                # Downward reserve capacity
                self.variables.primal['RCdn({0},{1})'.format(i,a)] = m.addVar(lb=0.0, name='RCdn({0},{1})'.format(i,a))
                
        m.update()
        
        var = self.variables.primal
        
        for i in generators:
            self.constraints['RCupMax({0})'.format(i)] = expando()
            self.constraints['RCupMax({0})'.format(i)].lhs = gb.quicksum(var['RCup({0},{1})'.format(i,a)] for a in areas)
            self.constraints['RCupMax({0})'.format(i)].rhs = gendata.upreg[i] 
            self.constraints['RCupMax({0})'.format(i)].expr = m.addConstr(self.constraints['RCupMax({0})'.format(i)].lhs <= self.constraints['RCupMax({0})'.format(i)].rhs, name = 'RCupMax({0})'.format(i))
            
            self.constraints['RCdnMax({0})'.format(i)] = expando()
            self.constraints['RCdnMax({0})'.format(i)].lhs = gb.quicksum(var['RCdn({0},{1})'.format(i,a)] for a in areas)
            self.constraints['RCdnMax({0})'.format(i)].rhs = gendata.downreg[i] 
            self.constraints['RCdnMax({0})'.format(i)].expr = m.addConstr(self.constraints['RCdnMax({0})'.format(i)].lhs <= self.constraints['RCdnMax({0})'.format(i)].rhs, name = 'RCdnMax({0})'.format(i))

        for a in areas:
            self.constraints['RReqUpArea({0})'.format(a)] = expando()
            cc = self.constraints['RReqUpArea({0})'.format(a)]            
            cc.lhs = gb.quicksum(var['RCup({0},{1})'.format(i,a)] for i in self.data.generators)
            cc.rhs = self.data.RR_Up_area[a]
            cc.expr = m.addConstr(cc.lhs >= cc.rhs, name = 'RReqUpArea({0})'.format(a))
            
            self.constraints['RReqDnArea({0})'.format(a)] = expando()
            cc = self.constraints['RReqDnArea({0})'.format(a)]            
            cc.lhs = gb.quicksum(var['RCdn({0},{1})'.format(i,a)] for i in self.data.generators)
            cc.rhs = self.data.RR_Dn_area[a]
            cc.expr = m.addConstr(cc.lhs >= cc.rhs, name = 'RReqDnArea({0})'.format(a))
            
        for alink in self.data.tielines.keys():
            sArea, rArea = alink          
           
            self.constraints['RUpExchLimR({0})'.format(alink)] = expando()
            cc = self.constraints['RUpExchLimR({0})'.format(alink)]              
            cc.lhs = gb.quicksum(var['RCup({0},{1})'.format(i,rArea)] for i in self.data.Map_A2Gs[sArea])
            cc.rhs = self.data.TCforRes[1] * self.data.InterZonalTC[(sArea, rArea)]
            cc.expr = m.addConstr(cc.lhs <= cc.rhs, name = 'RUpExchLimR({0})'.format(alink))
            
            self.constraints['RUpExchLimS({0})'.format(alink)] = expando()
            cc = self.constraints['RUpExchLimS({0})'.format(alink)]              
            cc.lhs = gb.quicksum(var['RCup({0},{1})'.format(i,sArea)] for i in self.data.Map_A2Gs[sArea])
            cc.rhs = self.data.TCforRes[1] * self.data.InterZonalTC[(sArea, rArea)]
            cc.expr = m.addConstr(cc.lhs <= cc.rhs, name = 'RUpExchLimS({0})'.format(alink))
            
            self.constraints['RDnExchLimR({0})'.format(alink)] = expando()
            cc = self.constraints['RDnExchLimR({0})'.format(alink)]              
            cc.lhs = gb.quicksum(var['RCdn({0},{1})'.format(i,rArea)] for i in self.data.Map_A2Gs[sArea])
            cc.rhs = self.data.TCforRes[1] * self.data.InterZonalTC[(sArea, rArea)]
            cc.expr = m.addConstr(cc.lhs <= cc.rhs, name = 'RDnExchLimR({0})'.format(alink))
            
            self.constraints['RDnExchLimS({0})'.format(alink)] = expando()
            cc = self.constraints['RDnExchLimS({0})'.format(alink)]              
            cc.lhs = gb.quicksum(var['RCdn({0},{1})'.format(i,sArea)] for i in self.data.Map_A2Gs[rArea])
            cc.rhs = self.data.TCforRes[1] * self.data.InterZonalTC[(sArea, rArea)]
            cc.expr = m.addConstr(cc.lhs <= cc.rhs, name = 'RDnExchLimS({0})'.format(alink))

        m.setObjective(
        gb.quicksum(gendata.UpCapCost[i]*var['RCup({0},{1})'.format(i,a)] for a in areas for i in generators ) +
        gb.quicksum(gendata.DnCapCost[i]*var['RCdn({0},{1})'.format(i,a)] for a in areas for i in generators ),
        gb.GRB.MINIMIZE)
            
        self.model.update()
            
    def _build_CP(self):
        from LP_stationarity_conditions import complementarity_model
        
        self.A_Eq = complementarity_model(self)

m = GurobiPY() 
m.optimize()     

#print 'Found objective value: {}'.format(m.ObjVal)
#print 'At PA: {0:.03f}, RA={1:.03f}, PB={2:.03f}, RB={3:.03f}'.format(PA.x, RA.x, PB.x, RB.x) 
        


