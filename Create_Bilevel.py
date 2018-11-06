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

# Add contract pricce for every gas node with generator
gas_nodes = list(BLmodel.edata.Map_Eg2Gn.values())
# result may be list of lists, so flatted
flat_list = [item for sublist in gas_nodes for item in sublist]

GasGenNodes=set(flat_list)
for node in GasGenNodes:
    name='ContractPrice({0})'.format(node)
    BLmodel.model.addVar(lb=0.0,name=name)
    BLmodel.model.update()
    

Add_Constrs(BLmodel,mSEDA_COMP)
Add_Constrs(BLmodel,mGDA_COMP)
Add_Constrs(BLmodel,mGRT_COMP)

Add_Obj(BLmodel,mSEDA_COMP)
Add_Obj(BLmodel,mGDA_COMP)
Add_Obj(BLmodel,mGRT_COMP)

   

# Use nodal gas price for generator gas price  (DA)
for gen in BLmodel.edata.gfpp:
    gas_node=BLmodel.edata.Map_Eg2Gn[gen][0]
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
        
# Use contract price for generator gas price  (DA)
for gen in BLmodel.edata.gfpp:
    gas_node=BLmodel.edata.Map_Eg2Gn[gen][0] # Only one
    HR = BLmodel.edata.generatorinfo.HR[gen]
    con_name='dLag/PgenSC({0},{1})'
    var_name='ContractPrice({0})'
    for t in BLmodel.edata.time:
        con=BLmodel.model.getConstrByName(con_name.format(gen,t))
      
        
        con_row=BLmodel.model.getRow(con)
        new_con=0.0
        for i in range(con_row.size()):
            new_con=new_con+con_row.getVar(i)*con_row.getCoeff(i)
        
        
        NewPrice=BLmodel.model.getVarByName(var_name.format(gas_node))
        
        new_con=new_con+HR*NewPrice
        
        # Remove
        BLmodel.model.remove(con)
        BLmodel.model.addConstr(new_con==0,name=con_name.format(gen,t))
        BLmodel.model.update()

# Use nodal gas price for generator UP REGULATION gas price  (RT)
for gen in BLmodel.edata.gfpp:
    gas_node=BLmodel.edata.Map_Eg2Gn[gen][0]
    HR = BLmodel.edata.generatorinfo.HR[gen]
    for t in BLmodel.edata.time:
        for scenario in BLmodel.edata.scen_wgp:
            print('\n\n Change the scenarios for mSEDA and GRT!!\n\n')
            con_name='dLag/RUp({0},{1},{2})'.format(gen,scenario,t)
            var_name='lambda_gas_balance_rt({0},{1},{2})'.format(gas_node,BLmodel.edata.scen_wgp[scenario][1],t)
            con=BLmodel.model.getConstrByName(con_name)
            con_row=BLmodel.model.getRow(con)
            new_con=0.0
            for i in range(con_row.size()):
                new_con=new_con+con_row.getVar(i)*con_row.getCoeff(i)
                
            NewPrice=BLmodel.model.getVarByName(var_name)
            new_con=new_con+ HR * NewPrice*defaults.RESERVES_UP_PREMIUM * BLmodel.edata.scen_wgp[scenario][2]
            BLmodel.model.remove(con)
            BLmodel.model.addConstr(new_con==0,name=con_name.format(gen,t))
            BLmodel.model.update()

# Use nodal gas price for generator UP REGULATION gas price  (RT)
for gen in BLmodel.edata.gfpp:
    gas_node=BLmodel.edata.Map_Eg2Gn[gen][0]
    HR = BLmodel.edata.generatorinfo.HR[gen]
    for t in BLmodel.edata.time:
        for scenario in BLmodel.edata.scen_wgp:
            print('\n\n Change the scenarios for mSEDA and GRT!!\n\n')
            con_name='dLag/RDn({0},{1},{2})'.format(gen,scenario,t)
            var_name='lambda_gas_balance_rt({0},{1},{2})'.format(gas_node,BLmodel.edata.scen_wgp[scenario][1],t)
            con=BLmodel.model.getConstrByName(con_name)
            con_row=BLmodel.model.getRow(con)
            new_con=0.0
            for i in range(con_row.size()):
                new_con=new_con+con_row.getVar(i)*con_row.getCoeff(i)
                
            NewPrice=BLmodel.model.getVarByName(var_name)
            new_con=new_con - HR * NewPrice*defaults.RESERVES_DN_PREMIUM * BLmodel.edata.scen_wgp[scenario][2]
            BLmodel.model.remove(con)
            BLmodel.model.addConstr(new_con==0,name=con_name.format(gen,t))
            BLmodel.model.update()        

# Use contract for generator UP REGULATION gas price  (RT)
for gen in BLmodel.edata.gfpp:
    gas_node=BLmodel.edata.Map_Eg2Gn[gen][0]
    HR = BLmodel.edata.generatorinfo.HR[gen]
    for t in BLmodel.edata.time:
        for scenario in BLmodel.edata.scen_wgp:
            print('\n\n Change the scenarios for mSEDA and GRT!!\n\n')
            con_name='dLag/RUpSC({0},{1},{2})'.format(gen,scenario,t)
            var_name='ContractPrice({0})'.format(gas_node)
            con=BLmodel.model.getConstrByName(con_name)
            con_row=BLmodel.model.getRow(con)
            new_con=0.0
            for i in range(con_row.size()):
                new_con=new_con+con_row.getVar(i)*con_row.getCoeff(i)
                
            NewPrice=BLmodel.model.getVarByName(var_name)
            new_con=new_con+ HR * NewPrice*defaults.RESERVES_UP_PREMIUM * BLmodel.edata.scen_wgp[scenario][2]
            BLmodel.model.remove(con)
            BLmodel.model.addConstr(new_con==0,name=con_name.format(gen,t))
            BLmodel.model.update()

# Use nodal gas price for generator UP REGULATION gas price  (RT)
for gen in BLmodel.edata.gfpp:
    gas_node=BLmodel.edata.Map_Eg2Gn[gen][0]
    HR = BLmodel.edata.generatorinfo.HR[gen]
    for t in BLmodel.edata.time:
        for scenario in BLmodel.edata.scen_wgp:
            print('\n\n Change the scenarios for mSEDA and GRT!!\n\n')
            con_name='dLag/RDnSC({0},{1},{2})'.format(gen,scenario,t)
            var_name='ContractPrice({0})'.format(gas_node)
            con=BLmodel.model.getConstrByName(con_name)
            con_row=BLmodel.model.getRow(con)
            new_con=0.0
            for i in range(con_row.size()):
                new_con=new_con+con_row.getVar(i)*con_row.getCoeff(i)
                
            NewPrice=BLmodel.model.getVarByName(var_name)
            new_con=new_con - HR * NewPrice*defaults.RESERVES_DN_PREMIUM * BLmodel.edata.scen_wgp[scenario][2]
            BLmodel.model.remove(con)
            BLmodel.model.addConstr(new_con==0,name=con_name.format(gen,t))
            BLmodel.model.update()   



sclim = list('k{0}'.format(k) for k in range(3))
for gas_node in BLmodel.edata.Map_Gn2Eg:
    for t in BLmodel.edata.time:
        for k in sclim:
            con_name='gas_balance_da({0},{1},{2})'.format(gas_node,k,t)
            con=BLmodel.model.getConstrByName(con_name)
            con_row=BLmodel.model.getRow(con)
            new_con=0.0
            for i in range(con_row.size()):
                new_con=new_con+con_row.getVar(i)*con_row.getCoeff(i)
            
            for gen in BLmodel.gdata.Map_Gn2Eg[gas_node]:
                var_Pgen=BLmodel.model.getVarByName('Pgen({0},{1})'.format(gen,t))
                var_PgenSC=BLmodel.model.getVarByName('PgenSC({0},{1})'.format(gen,t))
                # Only the first contract is being analyzed
                SC_Active=BLmodel.gdata.SCP[('sc1',gen),t]
                HR=BLmodel.edata.generatorinfo.HR[gen]
                Pcmax=BLmodel.edata.SCdata.PcMax['sc1'][gen]
                Pcmin=BLmodel.edata.SCdata.PcMin['sc1'][gen]
                
                if k =='k0':
                    new_con=new_con - HR*(var_Pgen+var_PgenSC)
                elif k =='k1':
                    new_con=new_con - HR*(var_Pgen+var_PgenSC+SC_Active*(Pcmax-var_PgenSC))                
                elif k =='k2':
                    new_con=new_con - HR*(var_Pgen+var_PgenSC+SC_Active*(Pcmin-var_PgenSC))
                
                
                
            GasLoad=BLmodel.gdata.gasload[gas_node][t]
            BLmodel.model.remove(con)
            BLmodel.model.addConstr(new_con==GasLoad,name=con_name)
            BLmodel.model.update()   

            
        
        
# Gas well production
for gw in BLmodel.gdata.wells:
    for s in BLmodel.edata.windscen_index:
        for t in BLmodel.edata.time:
            con_name_up = 'gprodUp_max({0},{1},{2})'.format(gw,s,t)
            con_name_up_SOS = 'SOS1_gprodUp_max({0},{1},{2})'.format(gw,s,t)
            con_name_dn = 'gprodDn_max({0},{1},{2})'.format(gw,s,t)
            con_name_dn_SOS = 'SOS1_gprodDn_max({0},{1},{2})'.format(gw,s,t)
            var_name     = 'gprod({0},k0,{2})'.format(gw,s,t)
            var = BLmodel.model.getVarByName(var_name)
            Gwell_max    = BLmodel.gdata.wellsinfo.MaxProd[gw]
            
            # Upper Limit
            con=BLmodel.model.getConstrByName(con_name_up)
            con_row=BLmodel.model.getRow(con)
            new_con=0.0
            for i in range(con_row.size()):
                new_con=new_con+con_row.getVar(i)*con_row.getCoeff(i)
            BLmodel.model.remove(con)
            BLmodel.model.addConstr(new_con<=Gwell_max-var,name=con_name_up)
            BLmodel.model.update()  
            
            conSOS=BLmodel.model.getConstrByName(con_name_up_SOS)
            con_rowSOS=BLmodel.model.getRow(conSOS)
            new_conSOS=0.0
            for i in range(con_rowSOS.size()):
                new_conSOS=new_conSOS+con_rowSOS.getVar(i)*con_rowSOS.getCoeff(i)
            new_conSOS=new_conSOS+var
            BLmodel.model.remove(conSOS)
            BLmodel.model.addConstr(new_conSOS==Gwell_max,name=con_name_up_SOS)
            BLmodel.model.update()  
            
            
            
            # lower Limit
            con=BLmodel.model.getConstrByName(con_name_dn)
            con_row=BLmodel.model.getRow(con)
            new_con=0.0
            for i in range(con_row.size()):
                new_con=new_con+con_row.getVar(i)*con_row.getCoeff(i)
            BLmodel.model.remove(con)
            BLmodel.model.addConstr(new_con<=var,name=con_name_dn)
            BLmodel.model.update()  
            
            conSOS=BLmodel.model.getConstrByName(con_name_dn_SOS)
            con_rowSOS=BLmodel.model.getRow(conSOS)
            new_conSOS=0.0
            for i in range(con_rowSOS.size()):
                new_conSOS=new_conSOS+con_rowSOS.getVar(i)*con_rowSOS.getCoeff(i)
            new_conSOS=new_conSOS-var
            BLmodel.model.remove(conSOS)
            BLmodel.model.addConstr(new_conSOS==0.0,name=con_name_dn_SOS)
            BLmodel.model.update()  
            
            
for gn in BLmodel.gdata.gnodes:
    for s in BLmodel.edata.windscen_index:
        for t in BLmodel.edata.time:
            con_name='gas_balance_rt({0},{1},{2})'.format(gn,s,t)
            con = BLmodel.model.getConstrByName(con_name)
            con_row=BLmodel.model.getRow(con)
            new_con=0.0
            for i in range(con_row.size()):
                var=con_row.getVar(i)
                coeff=con_row.getCoeff(i)
                new_con=new_con+var*coeff
                               
                if var.VarName[0:4]=='qout':    
                # Find  qout da
                    qout_name=var.VarName
                    qout_name=qout_name.replace('_rt','')
                    qout_name=qout_name.replace(','+s+',',',k0,')
                    qout_var=BLmodel.model.getVarByName(qout_name)
                    new_con=new_con-qout_var
                if var.VarName[0:3]=='qin':    
                # Find  qout da
                    qin_name=var.VarName
                    qin_name=qin_name.replace('_rt','')
                    qin_name=qin_name.replace(','+s+',',',k0,')
                    qin_var=BLmodel.model.getVarByName(qin_name)
                    new_con=new_con+qin_var
                    
            if gen in BLmodel.gdata.Map_Gn2Eg[gn]:
                for gen in BLmodel.edata.Map_Gn2Eg[gn]:
                    HR = BLmodel.edata.generatorinfo.HR[gen]
                    my_dict={'s1':'ss0','s2':'ss1'}
                    ss=my_dict[s]
                    var_RUp   = BLmodel.model.getVarByName('RUp({0},{1},{2})'.format(gen,ss,t))
                    var_RUpSC = BLmodel.model.getVarByName('RUpSC({0},{1},{2})'.format(gen,ss,t))
                    var_RDn   = BLmodel.model.getVarByName('RDn({0},{1},{2})'.format(gen,ss,t))
                    var_RDnSC = BLmodel.model.getVarByName('RDnSC({0},{1},{2})'.format(gen,ss,t))
                
                new_con=new_con-HR*(var_RUp+var_RUpSC-var_RDn-var_RDnSC)
                
            BLmodel.model.remove(con)
            BLmodel.model.addConstr(new_con==0.0,name=con_name)
            BLmodel.model.update() 
            
            

# change objective
#name='ContractPrice({0})'.format('ng102')
#var=BLmodel.model.getVarByName(name)
#BLmodel.model.setObjective(var,gb.GRB.MINIMIZE)        
# #
 
BLmodel.model.Params.DegenMoves=-1
BLmodel.model.Params.Heuristics=0.05
BLmodel.model.Params.timelimit = 100.0
BLmodel.model.Params.MIPFocus=1
BLmodel.model.optimize() 
BLmodel.model.reset()


#df=pd.DataFrame([[var.VarName,var.x] for var in model_GDA.model.getVars() ],columns=['Name','Value'])
#Q1=df[df.Name.str.contains('Rup',regex=True)]
#Q1[Q1.Name.str.contains('k0')]
#
#
#df=pd.DataFrame([[var.VarName,var.x] for var in model_GRT.model.getVars() ],columns=['Name','Value'])
#Q1=df[df.Name.str.contains('lambda_gas_balan',regex=True)]
#
#df=pd.DataFrame([[con.ConstrName,con] for con in model_GRT.model.getConstrs() ],columns=['Name','Value'])
#Q1=df[df.Name.str.contains('gprodUp_max',regex=True)]
#
#
#
#df=pd.DataFrame([con.ConstrName for con in BLmodel.model.getConstrs() ],columns=['Name'])
#df[df.Name.str.contains('gas_balance_da')]
#
#df=pd.DataFrame([var.VarName for var in BLmodel.model.getVars() ],columns=['Name'])
#df[df.Name.str.contains('RUpSC')]


#
#
#
#
#
#
#df_mSEDA=Compare(BLmodel,mSEDA_COMP) 
#df_mGRT=Compare(BLmodel,mGRT_COMP)
#df_mGDA=Compare(BLmodel,mGDA_COMP)
#    
### CHECK FOR DUAL DEGENERACY Between solution of original 
#
#df=pd.DataFrame()
#for var in mGRT.model.getVars():
#    name=var.VarName
#    value_orig=var.x
#    value_new=BLmodel.getVarByName(name).x
#    
#    error=value_orig-value_new
#     
#    df=df.append(pd.DataFrame([[value_orig, value_new, error]],columns=['orig','new','error'],index=[var.VarName]))
#    
#    
#df=pd.DataFrame()
#for con in mGRT.model.getConstrs():
#    name=con.ConstrName
#    RHS=con.RHS
#    sense=con.Sense
#    dual_orig=con.Pi
#    if sense=='=':
#        dual_new=-BLmodel.getVarByName('lambda_'+name).x
#    elif sense=='>':
#        dual_new=-BLmodel.getVarByName('mu_'+name).x
#    elif sense=='<':       
#        dual_new=-BLmodel.getVarByName('mu_'+name).x
#    
#    dual_obj_orig=dual_orig*RHS
#    dual_obj_new=dual_new*RHS
#    error=dual_orig-dual_new
#     
#    df=df.append(pd.DataFrame([[dual_orig, dual_new, error,sense,dual_obj_orig,dual_obj_new]],columns=['orig','new','error','sense','Obj_1','Obj_2'],index=[var.VarName]))
#    
#
## Rewrite Constraints with links
#
#
#




#
#
#
#
#for t in range(1,24):
#    var=mGDA_COMP.model.getVarByName('lambda_gas_balance_da(ng102,k0,t{0})'.format(t)).x
#    con=mGDA.model.getConstrByName('gas_balance_da(ng102,k0,t{0})'.format(t)).Pi
#    
#    print(var)
#    print(con)
#    
#for t in range(1,24):
#    var=mGRT_COMP.model.getVarByName('lambda_gas_balance_rt(ng102,s1,t{0})'.format(t)).x
#    con=mGRT.model.getConstrByName('gas_balance_rt(ng102,s1,t{0})'.format(t)).Pi
#    
#    print(var)
#    print(con)
#
## Original Problem
#    
#gen='g1'
#    
#m=mSEDA.model.fixed()
#m.optimize()
#
#
#Primal_Pgen = m.getVarByName('Pgen(g1,t1)')
#Primal_lambda_bal=m.getConstrByName('PowerBalance_DA(t1)').Pi
#Primal_Pmax_DA_GFPP_mu=m.getConstrByName('Pmax_DA_GFPP(g1,t1)').Pi
#Primal_Pmin_DA_GFPP_mu=m.getConstrByName('Pmin_DA_GFPP(g1,t1)').Pi
#
#Cost= 8 * 10 #(HR x gas price) = 80
#
## Comp Problem
#
#m=mSEDA_COMP.model
#m.optimize()
#COMP_lambda_bal = m.getVarByName('lambda_PowerBalance_DA(t1)').x
#COMP_Pmax_DA_GFPP_mu=m.getVarByName('mu_Pmax_DA_GFPP(g1,t1)').x
#COMP_Pmin_DA_GFPP_mu=m.getVarByName('mu_Pmin_DA_GFPP(g1,t1)').x
#Cost= 8 * 10 #(HR x gas price) = 80
#






