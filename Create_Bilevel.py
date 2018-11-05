# -*- coding: utf-8 -*-
"""
Created on Fri Nov  2 16:22:00 2018

@author: omalleyc
"""


import GasData_Load, ElecData_Load
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

def Add_Vars(BLmodel,COMP):
    # Add variables
    for var in COMP.model.getVars():
        name=var.VarName
        UB=var.UB
        LB=var.LB
        BLmodel.model.addVar(lb=LB, ub=UB, name=name)
    BLmodel.model.update()
    
 


def Add_Constrs(BLmodel,COMP):
    for con in COMP.model.getConstrs():
        name = con.ConstrName
        rhs  = con.RHS
        sense=con.Sense
        conrow=COMP.model.getRow(con)
        lhs=0.0
        for var_i in range(conrow.size()):
            var_old=conrow.getVar(var_i)
            Coeff=conrow.getCoeff(var_i)
            var_new=BLmodel.model.getVarByName(var_old.VarName)
            lhs=lhs+var_new*Coeff                  
        BLmodel.model.addConstr(lhs, sense, rhs, name)
        BLmodel.model.update()
    for SOS_i in COMP.model.getSOSs():
        soscon=COMP.model.getSOS(SOS_i)
        var1_old = soscon[1][0]
        var2_old = soscon[1][1]
        
        var1_new = BLmodel.model.getVarByName(var1_old.VarName)
        var2_new = BLmodel.model.getVarByName(var2_old.VarName)
        BLmodel.model.addSOS(gb.GRB.SOS_TYPE1,[var1_new,var2_new])
        BLmodel.model.update()



def Add_Obj(BLmodel,COMP):
    Current_obj=BLmodel.model.getObjective()
    
    obj=COMP.model.getObjective()
    for i in range(obj.size()):
        var_old=obj.getVar(i)
        coeff=obj.getCoeff(i)
        var_new=BLmodel.model.getVarByName(var_old.VarName)
        Current_obj=Current_obj+coeff*var_new
    BLmodel.model.setObjective(Current_obj,gb.GRB.MINIMIZE)
    BLmodel.model.update()
 

def Compare(BLmodel,COMP):
    df=pd.DataFrame([[var.VarName, 
                      var.x,
                      BLmodel.model.getVarByName(var.VarName).x,
                      var.x- BLmodel.model.getVarByName(var.VarName).x] for var in COMP.model.getVars()],columns=['name','orig','new','error'])
    print('Largest Error is {0}'.format(df.error.abs().max()))    
    return df     

class Bilevel_Model():
    '''
    Real-time electricity system dispatch
    '''
    
    def __init__(self,f2d):
        '''
        '''        
        self.edata = expando()
        self.gdata = expando()
        self.variables = expando()
        self.variables.primal={}
        self.constraints = {}
        self.results = expando()

        self._load_ElecData()
        self._load_GasData(f2d)
        
        self._build_model()
        
        
    def _load_GasData(self,f2d):
        GasData_Load._load_gas_network(self,f2d)              
        GasData_Load._load_wells_data(self)
        GasData_Load._load_gasload(self)
        GasData_Load._load_gas_storage(self)

        
        GasData_Load._load_SCinfo(self)
        
    def _load_ElecData(self):     
        ElecData_Load._load_network(self)  
        ElecData_Load._load_generator_data(self)
        ElecData_Load._load_wind_data(self)         
        ElecData_Load._load_initial_data(self)
        
        ElecData_Load._combine_wind_gprt_scenarios(self)
        
        ElecData_Load._load_SCinfo(self)
        
    def _build_model(self):
        self.model = gb.Model()



#--- Load Existing Models ( and resolve)
folder='LPModels/'

#--- Comp models
mSEDA_COMP=expando()
mGDA_COMP=expando()
mGRT_COMP=expando()

mSEDA_COMP.model = gb.read(folder+'mSEDA_COMP.lp')
mGDA_COMP.model = gb.read(folder+'mGDA_COMP.lp')
mGRT_COMP.model = gb.read(folder+'mGRT_COMP.lp')

mSEDA_COMP.model.optimize()
mGDA_COMP.model.optimize()
mGRT_COMP.model.optimize()
#--- Original Models
mSEDA=expando()
mGDA=expando()
mGRT=expando()

mSEDA.model = gb.read(folder+'mSEDA.lp')
mGDA.model = gb.read(folder+'mGDA.lp')
mGRT.model = gb.read(folder+'mGRT.lp')

mSEDA.model.optimize()
mGDA.model.optimize()
mGRT.model.optimize()


#--- Recreate COMP models Independent
model_SEDA=expando()
model_SEDA.model=gb.Model()
Add_Vars(model_SEDA,mSEDA_COMP)
Add_Constrs(model_SEDA,mSEDA_COMP)
Add_Obj(model_SEDA,mSEDA_COMP)
model_SEDA.model.optimize()

model_GDA=expando()
model_GDA.model=gb.Model()
Add_Vars(model_GDA,mGDA_COMP)
Add_Constrs(model_GDA,mGDA_COMP)
Add_Obj(model_GDA,mGDA_COMP)
model_GDA.model.optimize()

model_GRT=expando()
model_GRT.model=gb.Model()
Add_Vars(model_GRT,mGRT_COMP)
Add_Constrs(model_GRT,mGRT_COMP)
Add_Obj(model_GRT,mGRT_COMP)
model_GRT.model.optimize()


df_mSEDA_only=Compare(model_SEDA,mSEDA_COMP) 
df_mGDA_only=Compare(model_GDA,mGDA_COMP) 
df_mGRT_only=Compare(model_GRT,mGRT_COMP) 

#--- Bilevel Model (All subproblems together)



        
f2d=False         
BLmodel=Bilevel_Model(f2d)


# Add variables

Add_Vars(BLmodel,mSEDA_COMP)
Add_Vars(BLmodel,mGDA_COMP)
Add_Vars(BLmodel,mGRT_COMP)   

Add_Constrs(BLmodel,mSEDA_COMP)
Add_Constrs(BLmodel,mGDA_COMP)
Add_Constrs(BLmodel,mGRT_COMP)

Add_Obj(BLmodel,mSEDA_COMP)
Add_Obj(BLmodel,mGDA_COMP)
Add_Obj(BLmodel,mGRT_COMP)

   

BLmodel.model.optimize()

# Use nodal gas price for generator gas price
for gen in BLmodel.edata.gfpp:
    gas_node=BLmodel.edata.Map_Eg2Gn[gen]
    HR = BLmodel.edata.generatorinfo.HR[gen]
    con_name='dLag/Pgen({0},{1})'
    var_name='lambda_gas_balance_da({0},k0,{1})'
    for t in BLmodel.edata.time:
        con=BLmodel.model.getConstrByName(con_name.format(gen,t))
      
        
        con_row=BLmodel.model.getRow(con)
        new_con=0.0
        for i in range(con_row.size()):
            new_con=new_con+con_row.getVar(i)*con_row.getCoeff(i)
        
        
        NewPrice=BLmodel.model.getVarByName(var_name.format(gas_node,t))
        
        new_con=new_con+HR*NewPrice
        
        # Remove
        BLmodel.model.remove(con)
        BLmodel.model.addConstr(new_con==0,name=con_name.format(gen,t))
        BLmodel.model.update()
        
    




df=pd.DataFrame([[var.VarName,var.x] for var in model_GDA.model.getVars() ],columns=['Name','Value'])
Q1=df[df.Name.str.contains('gas_balance_da',regex=True)]
Q1[Q1.Name.str.contains('k0')]

df=pd.DataFrame([con.ConstrName for con in BLmodel.model.getConstrs() ],columns=['A'])
df[df.A.str.contains('dLag/Pgen')]









BLmodel.model.optimize()
    












df_mSEDA=Compare(BLmodel,mSEDA_COMP) 
df_mGRT=Compare(BLmodel,mGRT_COMP)
df_mGDA=Compare(BLmodel,mGDA_COMP)
    
## CHECK FOR DUAL DEGENERACY Between solution of original 

df=pd.DataFrame()
for var in mGRT.model.getVars():
    name=var.VarName
    value_orig=var.x
    value_new=BLmodel.getVarByName(name).x
    
    error=value_orig-value_new
     
    df=df.append(pd.DataFrame([[value_orig, value_new, error]],columns=['orig','new','error'],index=[var.VarName]))
    
    
df=pd.DataFrame()
for con in mGRT.model.getConstrs():
    name=con.ConstrName
    RHS=con.RHS
    sense=con.Sense
    dual_orig=con.Pi
    if sense=='=':
        dual_new=-BLmodel.getVarByName('lambda_'+name).x
    elif sense=='>':
        dual_new=-BLmodel.getVarByName('mu_'+name).x
    elif sense=='<':       
        dual_new=-BLmodel.getVarByName('mu_'+name).x
    
    dual_obj_orig=dual_orig*RHS
    dual_obj_new=dual_new*RHS
    error=dual_orig-dual_new
     
    df=df.append(pd.DataFrame([[dual_orig, dual_new, error,sense,dual_obj_orig,dual_obj_new]],columns=['orig','new','error','sense','Obj_1','Obj_2'],index=[var.VarName]))
    

# Rewrite Constraints with links











for t in range(1,24):
    var=BLmodel.model.getVarByName('lambda_gas_balance_da(ng102,k0,t{0})'.format(t)).x
    con=mGDA.model.getConstrByName('gas_balance_da(ng102,k0,t{0})'.format(t)).Pi
    
    print(var)
    print(con)


# Original Problem
    
gen='g1'
    
m=mSEDA.model.fixed()
m.optimize()


Primal_Pgen = m.getVarByName('Pgen(g1,t1)')
Primal_lambda_bal=m.getConstrByName('PowerBalance_DA(t1)').Pi
Primal_Pmax_DA_GFPP_mu=m.getConstrByName('Pmax_DA_GFPP(g1,t1)').Pi
Primal_Pmin_DA_GFPP_mu=m.getConstrByName('Pmin_DA_GFPP(g1,t1)').Pi

Cost= 8 * 10 #(HR x gas price) = 80

# Comp Problem

m=mSEDA_COMP.model
m.optimize()
COMP_lambda_bal = m.getVarByName('lambda_PowerBalance_DA(t1)').x
COMP_Pmax_DA_GFPP_mu=m.getVarByName('mu_Pmax_DA_GFPP(g1,t1)').x
COMP_Pmin_DA_GFPP_mu=m.getVarByName('mu_Pmin_DA_GFPP(g1,t1)').x
Cost= 8 * 10 #(HR x gas price) = 80







