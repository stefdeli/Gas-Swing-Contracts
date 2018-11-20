# -*- coding: utf-8 -*-
"""
Created on Tue Nov 20 13:27:39 2018

@author: omalleyc
"""

# -*- coding: utf-8 -*-
"""
Created on Mon Sep 24 15:49:31 2018

Market clearing with Gas Swing contracts

@author: delikars
E"""

import GasData_Load, ElecData_Load
import modelObjects
import LibVars
import LibCns_Elec, LibCns_Gas
import LibObjFunct 
import KKTizer
import GetResults
import gurobipy as gb
import pandas as pd
import numpy as np
import itertools
import pickle
import re
import defaults



# Stochastic Day-ahead Electricity dispatch
class expando(object):
    pass




mSEDA = modelObjects.StochElecDA(bilevel=True)
dispatchElecDA=mSEDA.optimize()

mSEDA_COMP = modelObjects.StochElecDA(comp=True,bilevel=True)
mSEDA_COMP.optimize()

# flow2dir = True : Bi-directional flow on gas pipelines
# flow2dir = False: Uni-directional flow on gas pipelines (from sending to receiving node)

f2d = False

mGDA = modelObjects.GasDA(dispatchElecDA,f2d)
dispatchGasDA=mGDA.optimize()

mGDA_COMP = modelObjects.GasDA(dispatchElecDA,f2d,comp=True)
mGDA_COMP.optimize()


mERT = modelObjects.ElecRT(dispatchElecDA,bilevel=True)
dispatchElecRT=mERT.optimize()

   
mERT_COMP = modelObjects.ElecRT(dispatchElecDA,comp=True,bilevel=True)
mERT_COMP.optimize()



mGRT = modelObjects.GasRT(dispatchGasDA,dispatchElecRT,f2d)
mGRT.optimize()

mGRT_COMP = modelObjects.GasRT(dispatchGasDA,dispatchElecRT,f2d,comp=True)
mGRT_COMP.optimize() 






# Compare Variables Results
def Compare_models(mPrimal,mComp):
    
    Var_Compare=pd.DataFrame()
    
    for var_name in mPrimal.variables.primal.keys():
        
        var_primal=mPrimal.variables.primal[var_name]
        
        PrimalValue =var_primal.x
        PrimalLB    =var_primal.LB
        PrimalUB    =var_primal.UB
        PrimalDual  =var_primal.rc
        
        if var_name in set(mComp.variables.primal.keys()):
            COMPValue = mComp.variables.primal[var_name].x
            COMPLB    = mComp.duals.musLB[var_name].x # All values should have lower limit
            if type(mComp.duals.musUB[var_name])==gb.Var: #
                # There shouldnt be any upper bounds on variables
                # All upper bounds should be explicit constraints
                print('Upperbound for {0}'.format(var_name))
                
                COMPUB    = mComp.duals.musUB[var_name].x
                COMPDUAL = COMPLB-COMPUB
            else: 
                COMPUB = np.nan
                COMPDUAL=COMPLB
        else:
            COMPValue=COMPLB=COMPUB=COMPDUAL=np.nan
            
        Var_Compare=Var_Compare.append(pd.DataFrame([[PrimalValue,COMPValue,PrimalDual,COMPDUAL,COMPLB,COMPUB,PrimalUB,PrimalLB]],
                                                    columns=['PrimalValue','COMPValue','PrimalDual','COMPDual','COMPLB','COMPUB','UB','LB'],index=[var_name]))
    
    Con_Compare=pd.DataFrame()
    for con_name in mPrimal.constraints.keys():
        
        con_primal=mPrimal.constraints[con_name]
        
        PrimalDual=con_primal.expr.Pi
        Sense=con_primal.expr.Sense
        
        
        if con_name in set(mComp.constraints.keys()):
            if Sense=='=':
                COMP_Dual= -1.0* mComp.duals.lambdas[con_name].x
            elif Sense=='<':
                
                COMP_Dual= -1.0* mComp.duals.mus[con_name].x
            elif Sense=='>':
                COMP_Dual= mComp.duals.mus[con_name].x
        else:
            COMP_Dual=np.nan
        
        Con_Compare=Con_Compare.append(pd.DataFrame([[PrimalDual,COMP_Dual,Sense]],columns=['Primal','Comp','Sense'],index=[con_name]))
        
    # Print some results
    Diff_Value=(Var_Compare.PrimalValue-Var_Compare.COMPValue)
    Diff_Dual_Var =(Var_Compare.PrimalDual-Var_Compare.COMPDual)   
    Diff_Dual_Con =(Con_Compare.Primal-Con_Compare.Comp)   

    
    print('Max Error in Variable Values is {0}'.format(Diff_Value.abs().max()))
    print('Max Error in Variable Dual Values is {0}'.format(Diff_Dual_Var.abs().max()))
    print('Max Error in Constraint Dual Values is {0}'.format(Diff_Dual_Con.abs().max()))
        
    
    return Var_Compare,Con_Compare
###############################################################################             


print('Check ERT')
Var_Compare,Con_Compare = Compare_models(mERT,mERT_COMP)
print('Check GRT')
Var_Compare,Con_Compare = Compare_models(mGRT,mGRT_COMP)
print('Check GDA')
Var_Compare,Con_Compare = Compare_models(mGDA,mGDA_COMP)


Diff_Value=(Var_Compare.PrimalValue-Var_Compare.COMPValue)
Diff_Dual_Var =(Var_Compare.PrimalDual-Var_Compare.COMPDual)
Problems_Var=Var_Compare[Diff_Dual_Var.abs()>1e-3]


Diff_Dual_Con =(Con_Compare.Primal-Con_Compare.Comp)   
Problems_Con=Con_Compare[Diff_Dual_Con.abs()>1e-3]  



def Check_Dual_Objective(mPrimal,mComp):
    Obj=0.0
    Obj_e=0.0
    Obj_l=0.0
    Obj_g=0.0
    PrimalConstraints=mPrimal.constraints.keys()
    for con_name in PrimalConstraints:
        c=mPrimal.constraints[con_name].expr
        conSense=c.Sense
        conRHS  =c.RHS
        # Get dual from COMP problem
        
        if conSense=='=':
            COMP_Dual= +1.0* mComp.duals.lambdas[con_name].x
            Obj_e=Obj_e+COMP_Dual*conRHS
        elif conSense=='<':
            COMP_Dual= -1.0* mComp.duals.mus[con_name].x
            Obj_l=Obj_l+COMP_Dual*conRHS
        elif conSense=='>':
            COMP_Dual= mComp.duals.mus[con_name].x
            Obj_g=Obj_g+COMP_Dual*conRHS
        
        
        Obj=Obj+COMP_Dual*conRHS

    print('Equality Constraint Contribution={0}'.format(Obj_e))
    print('"Less than" Constraint Contribution={0}'.format(Obj_l))
    print('"Greater than" Constraint Contribution={0}'.format(Obj_g))
    
    primalObj=mPrimal.model.ObjVal
    Error =primalObj-Obj
    print('Primal - Comp = Error')
    print('{0}-{1}={2}'.format(primalObj,Obj,Error))


print('\n\nCheck GDA\n')
Check_Dual_Objective(mGDA,mGDA_COMP)
print('\n\nCheck GRT\n')
Check_Dual_Objective(mGRT,mGRT_COMP)
print('\n\nCheck ERT\n')
Check_Dual_Objective(mERT,mERT_COMP)





##############################################################################
##############################################################################
mSEDA.fixedmodel=mSEDA.model.fixed()
mSEDA.fixedmodel.optimize()


Var_Compare=pd.DataFrame()

for var_name in mSEDA.variables.primal.keys():
    if mSEDA.model.getVarByName(var_name).VType=='B':
        continue
    
        
    var_primal=mSEDA.fixedmodel.getVarByName(var_name)
    
    PrimalValue =var_primal.x
    PrimalLB    =var_primal.LB
    PrimalUB    =var_primal.UB
    PrimalDual  =var_primal.rc
    
    
    if var_name in set(mSEDA_COMP.variables.primal.keys()):
        
        COMPValue = mSEDA_COMP.model.getVarByName(var_name).x
        COMPLB    = mSEDA_COMP.model.getVarByName('muLB_'+var_name).x
        
        try:
            COMPUB    = mSEDA_COMP.model.getVarByName('muUB_'+var_name).x
            print('Upperbound for {0}'.format(var_name))
            COMPDUAL = COMPLB-COMPUB
        except:        
            COMPUB =[]
            COMPDUAL=COMPLB
            
    else:
        COMPValue=COMPLB=COMPUB=COMPDUAL=np.nan
        
    Var_Compare=Var_Compare.append(pd.DataFrame([[PrimalValue,COMPValue,PrimalDual,COMPDUAL,COMPLB,COMPUB,PrimalUB,PrimalLB]],
                                                columns=['PrimalValue','COMPValue','PrimalDual','COMPDual','COMPLB','COMPUB','UB','LB'],index=[var_name]))





Obj=0.0
Obj_e=0.0
Obj_l=0.0
Obj_g=0.0

PrimalConstraints=mSEDA.constraints.keys()

PrimalConstraints=mSEDA.fixedmodel.getConstrs()

for c in PrimalConstraints:
    conSense=c.Sense
    conRHS  =c.RHS
    con_name=c.getAttr('ConstrName')
    # Get dual from COMP problem
    try:
        if conSense=='=':
            COMP_Dual= +1.0* mSEDA_COMP.model.getVarByName('lambda_'+con_name).x
            Obj_e=Obj_e+COMP_Dual*conRHS
        elif conSense=='<':
            COMP_Dual= -1.0* mSEDA_COMP.model.getVarByName('mu_'+con_name).x
            Obj_l=Obj_l+COMP_Dual*conRHS
        elif conSense=='>':
            COMP_Dual= mSEDA_COMP.model.getVarByName('mu_'+con_name).x
            Obj_g=Obj_g+COMP_Dual*conRHS
    except:
        COMP_Dual=0.0
        
    Obj=Obj+COMP_Dual*conRHS  

Error=mSEDA.model.ObjVal-Obj   


Gas_DA_Prices=pd.DataFrame([[con.ConstrName, con.Pi ] for con in mGDA.model.getConstrs() ],columns=['Name','Value'])

Gas_DA_Prices=Gas_DA_Prices[Gas_DA_Prices.Name.str.contains('gas_balance_da')]

Gas_DA_Prices=Gas_DA_Prices[Gas_DA_Prices.Name.str.contains('k0')]
 

Gas_DA_Prices.Name=Gas_DA_Prices.Name.str.replace('gas_balance_da\(','')
Gas_DA_Prices.Name=Gas_DA_Prices.Name.str.replace('\)','')
Gas_DA_Prices.Name=Gas_DA_Prices.Name.str.replace('k0,','')
       
Gas_DA_Prices['ID'],Gas_DA_Prices['Time']=Gas_DA_Prices['Name'].str.split(',').str

Gas_DA_Prices=Gas_DA_Prices.drop(['Name'],axis=1)

time_dict={t : int(t[1:]) for t in set(Gas_DA_Prices.Time.tolist())}
time_dict_reverse={v : k for k,v in time_dict.items()}

Gas_DA_Prices.Time=Gas_DA_Prices.Time.replace(time_dict)
        
Gas_DA_Prices=Gas_DA_Prices.pivot(index='Time',columns='ID')   
            
Gas_DA_Prices.index=Gas_DA_Prices.index.map(time_dict_reverse)

Gas_DA_Prices.columns=Gas_DA_Prices.columns.droplevel()




#def get_matrix_coo(m, dvars, constrs):    
#    #Map variables objects to Gurobi Python indices 
#    var_indices = {v: i for i, v in enumerate(dvars)} 
#    
#    for row_idx, constr in enumerate(constrs):
#        for const_coeff, col_idx, var in get_expr_cos(m.getRow(constr), var_indices):                         
#            yield row_idx, col_idx, const_coeff, constr.sense, constr.ConstrName, var.VarName
#
#
#m = self.model    
#
## Retrieve model Primal variables, names, upper and lower bounds
#PrimalVars = m.getVars()
#PrVarNames = []
#PrVarLB = []; PrVarUB = []
#for PVar in PrimalVars:
#    PrVarNames.append(PVar.VarName)
#    if PVar.UB < 1e80:      # GRB.INF = 1e100
#        PrVarUB.append(PVar.VarName)
#    if PVar.LB > -1e80:
#        PrVarLB.append(PVar.VarName)
#            
#
## Retrieve model Primal constraints
#PrimalConstrs = m.getConstrs()
#
## Retrieve objective function coefficients (order according 'Primal_vars')
#obj_coeffs = dict(zip(PrVarNames, m.getAttr('Obj', PrimalVars)))
#
## Retrieve coefficients matrix 
## Constraint index = row index
## Variables index = column index
#A = pd.DataFrame(get_matrix_coo(m, PrimalVars, PrimalConstrs), 
#                   columns=['row_idx', 'col_idx', 'coeff', 'sense', 
#                            'ConstrName', 'VarName'])
#                            
## Coefficients Equality constraints                   
#A_Eq = A[A['sense']=='='].set_index(['ConstrName', 'VarName']).coeff.to_dict() 
#
# 
#
#













