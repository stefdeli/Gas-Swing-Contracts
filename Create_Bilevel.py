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

def Add_Vars(model,COMP):
    # Add variables
    for var in COMP.model.getVars():
        name=var.VarName
        UB=var.UB
        LB=var.LB
        model.addVar(lb=LB, ub=UB, name=name)
    model.update()
    
 


def Add_Constrs(model,COMP):
    for con in COMP.model.getConstrs():
        name = con.ConstrName
        rhs  = con.RHS
        sense=con.Sense
        conrow=COMP.model.getRow(con)
        lhs=0.0
        for var_i in range(conrow.size()):
            var_old=conrow.getVar(var_i)
            Coeff=conrow.getCoeff(var_i)
            var_new=model.getVarByName(var_old.VarName)
            lhs=lhs+var_new*Coeff                  
        model.addConstr(lhs, sense, rhs, name)
        model.update()
    for SOS_i in COMP.model.getSOSs():
        soscon=COMP.model.getSOS(SOS_i)
        var1_old = soscon[1][0]
        var2_old = soscon[1][1]
        
        var1_new = model.getVarByName(var1_old.VarName)
        var2_new = model.getVarByName(var2_old.VarName)
        model.addSOS(gb.GRB.SOS_TYPE1,[var1_new,var2_new])
        model.update()



def Add_Obj(model,COMP):
    Current_obj=model.getObjective()
    
    obj=COMP.model.getObjective()
    for i in range(obj.size()):
        var_old=obj.getVar(i)
        coeff=obj.getCoeff(i)
        var_new=model.getVarByName(var_old.VarName)
        Current_obj=Current_obj+coeff*var_new
    model.setObjective(Current_obj,gb.GRB.MINIMIZE)
    model.update()
 
# Compare Results
def Compare(model,COMP):
    df=pd.DataFrame()
    for var in COMP.model.getVars():
        orig=var.x
        new=model.getVarByName(var.VarName).x
        df=df.append(pd.DataFrame([[orig, new]],columns=['orig','new'],index=[var.VarName]))
    print('Largest Error is {0}'.format((df.orig-df.new).abs().max()))
    return df    



#--- Load Existing Models ( and resolve)
folder='LPModels/'

mSEDA_COMP=expando()
mGDA_COMP=expando()
mGRT_COMP=expando()

mSEDA_COMP.model = gb.read(folder+'mSEDA_COMP.lp')
mGDA_COMP.model = gb.read(folder+'mSEDA_COMP.lp')
mGRT_COMP.model = gb.read(folder+'mGRT_COMP.lp')

mSEDA_COMP.model.optimize()
mGDA_COMP.model.optimize()
mGRT_COMP.model.optimize()



#--- Independent
model_SEDA=gb.Model()
Add_Vars(model_SEDA,mSEDA_COMP)
Add_Constrs(model_SEDA,mSEDA_COMP)
Add_Obj(model_SEDA,mSEDA_COMP)
model_SEDA.optimize()

model_GDA=gb.Model()
Add_Vars(model_GDA,mGDA_COMP)
Add_Constrs(model_GDA,mGDA_COMP)
Add_Obj(model_GDA,mGDA_COMP)
model_GDA.optimize()

model_GRT=gb.Model()
Add_Vars(model_GRT,mGRT_COMP)
Add_Constrs(model_GRT,mGRT_COMP)
Add_Obj(model_GRT,mGRT_COMP)
model_GRT.optimize()


df_mSEDA=Compare(model_SEDA,mSEDA_COMP) 
df_mGDA=Compare(model_GDA,mGDA_COMP) 
df_mGRT=Compare(model_GRT,mGRT_COMP) 

#--- All together

model=gb.Model()

Add_Vars(model,mSEDA_COMP)
Add_Vars(model,mGDA_COMP)
Add_Vars(model,mGRT_COMP)   

Add_Constrs(model,mSEDA_COMP)
Add_Constrs(model,mGDA_COMP)
Add_Constrs(model,mGRT_COMP)

Add_Obj(model,mSEDA_COMP)
Add_Obj(model,mGDA_COMP)
Add_Obj(model,mGRT_COMP)

   
model.optimize()

    

    
df_mSEDA=Compare(model,mSEDA_COMP) 
df_mGRT=Compare(model,mGRT_COMP)
df_mGDA=Compare(model,mGDA_COMP)
    
## CHECK FOR DUAL DEGENERACY




