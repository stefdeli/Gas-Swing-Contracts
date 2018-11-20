# -*- coding: utf-8 -*-
"""
Created on Tue Nov 20 23:15:26 2018

@author: omalleyc
"""


from collections import defaultdict
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

class expando(object):
    pass


def Add_Vars(BLmodel,COMP):
    # Add variables
    for var in COMP.model.getVars():
        name=var.VarName
        UB=var.UB
        LB=var.LB
        value=var.x
        BLmodel.model.addVar(lb=LB, ub=UB, name=name)
    
    BLmodel.model.update()
    
    for var in COMP.model.getVars():
        name=var.VarName
        value=var.x
        BLmodel.model.getVarByName(name).Start=value
    
    
 


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
 

def Get_Obj(BLmodel,COMP):
    # Get the objective from COMP and write it for BLmodel
    NewObj=0.0
    
    obj=COMP.model.getObjective()
    for i in range(obj.size()):
        var_old=obj.getVar(i)
        coeff=obj.getCoeff(i)           
        var_new=BLmodel.model.getVarByName(var_old.VarName)
        NewObj=NewObj+coeff*var_new
    return NewObj


def Get_Dual_Obj(BLmodel,COMP):
    # Get the dual objective from COMP and write it for BLmodel
    NewObj=0.0
    
    for con in COMP.model.getConstrs():

        conname=con.ConstrName
        if conname[0:2]=='mu':
            continue
        elif conname[0:6]=='lambda':
            continue
        elif conname[0:4]=='SOS1':
            continue
        elif conname[0:4]=='dLag':
            continue
        
        sense=con.Sense
        RHS=con.RHS
        
        if sense=='=':
            dual=BLmodel.model.getVarByName('lambda_'+conname)
        else:
            dual=BLmodel.model.getVarByName('mu_'+conname)
    
        if sense=='=':
            NewObj=NewObj+dual*RHS
        elif sense=='<':
            NewObj=NewObj-dual*RHS
        else:
            NewObj=NewObj+dual*RHS

    return NewObj

def Compare(BLmodel,COMP):
        
    df=pd.DataFrame([[var.VarName, 
                      var.x,
                      BLmodel.model.getVarByName(var.VarName).x,
                      var.x- BLmodel.model.getVarByName(var.VarName).x] for var in COMP.model.getVars()],columns=['name','orig','new','error'])
    print('Largest Error is {0}'.format(df.error.abs().max()))    
    return df     


#--- Load Existing Models ( and resolve)
folder=defaults.folder+'/LPModels/'

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


#--- Recreate COMP models Independently

#--- mSEDA
model_SEDA=expando()
model_SEDA.model=gb.Model()
Add_Vars(model_SEDA,mSEDA_COMP)
Add_Constrs(model_SEDA,mSEDA_COMP)
Add_Obj(model_SEDA,mSEDA_COMP)
model_SEDA.model.update()
model_SEDA.model.optimize()

#--- mGDA

model_GDA=expando()
model_GDA.model=gb.Model()
Add_Vars(model_GDA,mGDA_COMP)
Add_Constrs(model_GDA,mGDA_COMP)
Add_Obj(model_GDA,mGDA_COMP)
model_GDA.model.update()
model_GDA.model.optimize()

#--- mGRT

model_GRT=expando()
model_GRT.model=gb.Model()
Add_Vars(model_GRT,mGRT_COMP)
Add_Constrs(model_GRT,mGRT_COMP)
Add_Obj(model_GRT,mGRT_COMP)
model_GRT.model.update()
model_GRT.model.optimize()



df_mSEDA_only=Compare(model_SEDA,mSEDA_COMP) 
df_mGDA_only=Compare(model_GDA,mGDA_COMP) 
df_mGRT_only=Compare(model_GRT,mGRT_COMP) 



model_SEDA.model.reset()
Obj=Get_Obj(model_SEDA,mSEDA_COMP)
Dualobj=Get_Dual_Obj(model_SEDA,model_SEDA)
model_SEDA.model.setObjective(Obj,gb.GRB.MINIMIZE)
model_SEDA.model.update()
model_SEDA.model.optimize()
model_SEDA.model.reset()
model_SEDA.model.setObjective(Dualobj,gb.GRB.MAXIMIZE)
model_SEDA.model.update()
model_SEDA.model.optimize()
model_SEDA.model.reset()

model_GDA.model.reset()
Obj=Get_Obj(model_GDA,mGDA_COMP)
Dualobj=Get_Dual_Obj(model_GDA,model_GDA)
model_GDA.model.setObjective(Obj,gb.GRB.MINIMIZE)
model_GDA.model.update()
model_GDA.model.optimize()
model_GDA.model.reset()
model_GDA.model.setObjective(Dualobj,gb.GRB.MAXIMIZE)
model_GDA.model.update()
model_GDA.model.optimize()
model_GDA.model.reset()

model_GRT.model.reset()
Obj=Get_Obj(model_GRT,mGRT_COMP)
Dualobj=Get_Dual_Obj(model_GRT,model_GRT)
model_GRT.model.setObjective(Obj,gb.GRB.MINIMIZE)
model_GRT.model.update()
model_GRT.model.optimize()
model_GRT.model.reset()
model_GRT.model.setObjective(Dualobj,gb.GRB.MAXIMIZE)
model_GRT.model.update()
model_GRT.model.optimize()
model_GRT.model.reset()