# -*- coding: utf-8 -*-
"""
Created on Mon Oct 22 14:23:14 2018

@author: omalleyc
"""

          
from collections import defaultdict
import pandas as pd
import gurobipy as gb

        
 # Class which can have attributes set
class expando(object):
    pass 

def _complementarity_model(self):
    
    m = self.model    
    
    # Retrieve model Primal variables, names, upper and lower bounds
    PrimalVars = m.getVars()
    PrVarNames = []
    PrVarLB = []; PrVarUB = []
    for PVar in PrimalVars:
        PrVarNames.append(PVar.VarName)
        if PVar.UB < 1e80:      # GRB.INF = 1e100
            PrVarUB.append(PVar.VarName)
        if PVar.LB > -1e80:
            PrVarLB.append(PVar.VarName)
                
    
    # Retrieve model Primal constraints
    PrimalConstrs = m.getConstrs()

    # Retrieve objective function coefficients (order according 'Primal_vars')
    obj_coeffs = dict(zip(PrVarNames, m.getAttr('Obj', PrimalVars)))
    
    # Retrieve coefficients matrix 
    # Constraint index = row index
    # Variables index = column index
    A = pd.DataFrame(get_matrix_coo(m, PrimalVars, PrimalConstrs), 
                       columns=['row_idx', 'col_idx', 'coeff', 'sense', 
                                'ConstrName', 'VarName'])
                                
    # Coefficients Equality constraints                   
    A_Eq = A[A['sense']=='='].set_index(['ConstrName', 'VarName']).coeff.to_dict() 
    # Coefficients Inequality constraints
    A_ineqLE = A[A['sense']=='<'].set_index(['ConstrName', 'VarName']).coeff.to_dict() 
    A_ineqGE = A[A['sense']=='>'].set_index(['ConstrName', 'VarName']).coeff.to_dict()     
    
    
    # Add dual variables 
    self.duals = expando()   
    
    self.duals.lambdas = defaultdict(list); self.duals.lambdas_idx = []
    self.duals.mus = defaultdict(list); self.duals.mus_idx = []
    self.duals.SOS1 = defaultdict(list)
    
    self.comp = expando()
    self.comp.primal = defaultdict(); self.comp.SOS1 = defaultdict()
    
    PrConstrNames = self.constraints.keys() #Primal Constraints Names
    
    # Dual variables & complementarity constraints - Explicit primal constraints
    print('Starting Explicit Primal Constraints')
    for PrC in PrConstrNames:                
        PrimalConstr = self.constraints[PrC]
        pc_grb = self.constraints[PrC].expr
        #print(pc_grb)

    
        if pc_grb.sense == '=':
            self.duals.lambdas[PrC] = m.addVar(lb=-gb.GRB.INFINITY, ub=gb.GRB.INFINITY, 
                                               name = 'lambda_' + pc_grb.ConstrName)     
            self.duals.lambdas_idx.append(pc_grb.ConstrName)   
           # m.update()                                    
        else:                
            self.duals.mus[PrC] = m.addVar(lb = 0, name = 'mu_' + pc_grb.ConstrName)
            self.duals.SOS1[PrC] = m.addVar(lb =0, name = 'SOS1_'+ pc_grb.ConstrName)
            self.duals.mus_idx.append(pc_grb.ConstrName)
            #m.update()
            # Build complementarity constraints
            self.comp.primal[PrC], self.comp.SOS1[PrC] =  build_complementarity_LB(self, PrimalConstr, self.duals.mus[PrC], self.duals.SOS1[PrC])
    
    
    #--- Dual variables & complementarity constraints - Upper bounds (if not INF)
    print('Starting Upper Bounds')
    self.duals.musUB = defaultdict(list); self.duals.SOS1UB = defaultdict(list)
    self.comp.primalUB = defaultdict(); self.comp.SOS1UB = defaultdict()
    prVar = self.variables.primal
    for PrV in PrVarUB:        
        self.duals.musUB[PrV] = m.addVar(lb = 0, name = 'muUB_'+ PrV)
        self.duals.SOS1UB[PrV] = m.addVar(lb =0, name = 'SOS1_UB_'+ PrV)
       # m.update() 
        self.comp.primalUB[PrV] = m.addConstr(
                                self.duals.SOS1UB[PrV] == prVar[PrV].UB - prVar[PrV],
                                name = 'SOS1_UB_'+PrV)
        self.comp.SOS1UB[PrV] = m.addSOS(gb.GRB.SOS_TYPE1,
                                       [self.duals.musUB[PrV],self.duals.SOS1UB[PrV]])
                                       
    #--- Dual variables & complementarity constraints - Lower bounds (if not -INF) 
    print('Starting Lower Bounds')
    self.duals.musLB = defaultdict(list); self.duals.SOS1LB = defaultdict(list)
    self.comp.primalLB = defaultdict(); self.comp.SOS1LB = defaultdict()
    for PrV in PrVarLB:        
        self.duals.musLB[PrV] = m.addVar(lb = 0, name = 'muLB_'+ PrV)
        self.duals.SOS1LB[PrV] = m.addVar(lb =0, name = 'SOS1_LB_'+ PrV)
        #m.update() 
        self.comp.primalLB[PrV] = m.addConstr(
                                self.duals.SOS1LB[PrV] == prVar[PrV] - prVar[PrV].LB,
                                name = 'SOS1_LB_'+PrV)
        self.comp.SOS1LB[PrV] = m.addSOS(gb.GRB.SOS_TYPE1,
                                       [self.duals.musLB[PrV],self.duals.SOS1LB[PrV]])

       
    #--- Stationarity constraints
    print('Starting Stationarity Constraints')
    self.cStat = defaultdict()
    
    for var in PrVarNames:     
        self.cStat[var] = m.addConstr(    
              obj_coeffs[var] +
              gb.quicksum(coeff(A_Eq, constr, var)*self.duals.lambdas[constr] for constr in self.duals.lambdas_idx)+ 
              gb.quicksum(coeff(A_ineqLE, constr, var)*self.duals.mus[constr] for constr in self.duals.mus_idx) -
              gb.quicksum(coeff(A_ineqGE, constr, var)*self.duals.mus[constr] for constr in self.duals.mus_idx) +
              (self.duals.musUB[var] if var in PrVarUB else 0) - (self.duals.musLB[var] if var in PrVarLB else 0), 
              gb.GRB.EQUAL, 0,  name = 'dLag/' + var)
    print('Finished Stationarity Constraints')   
    m.update()    
 


# Build complementarity constraints  0<=x .perp. g(x) >=0
def build_complementarity_LB(self, PrimalConstr, mu, SOS1):
    m = self.model    
    pc_grb = PrimalConstr.expr
    cSOS1 = m.addSOS(gb.GRB.SOS_TYPE1,[mu , SOS1])
    if pc_grb.sense == '<':
        cPrimal = m.addConstr(SOS1 == PrimalConstr.rhs - PrimalConstr.lhs,                       
                              name = 'SOS1_'+PrimalConstr.expr.ConstrName)
    elif pc_grb.sense == '>':
        cPrimal = m.addConstr(SOS1 == PrimalConstr.lhs - PrimalConstr.rhs,                       
                              name = 'SOS1_'+PrimalConstr.expr.ConstrName)
                                  
   # m.update()                   
    return (cSOS1, cPrimal)

def coeff(A, row, col):
    try:
        c = A[row, col]
        cc = c
    except KeyError:
        cc = 0
    return cc


def get_expr_cos(expr, var_indices):
    for i in range(expr.size()):
        dvar = expr.getVar(i)
        yield expr.getCoeff(i), var_indices[dvar], dvar
         
def get_matrix_coo(m, dvars, constrs):    
    #Map variables objects to Gurobi Python indices 
    var_indices = {v: i for i, v in enumerate(dvars)} 
    
    for row_idx, constr in enumerate(constrs):
        for const_coeff, col_idx, var in get_expr_cos(m.getRow(constr), var_indices):                         
            yield row_idx, col_idx, const_coeff, constr.sense, constr.ConstrName, var.VarName
           