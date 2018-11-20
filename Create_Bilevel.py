# -*- coding: utf-8 -*-
"""
Created on Fri Nov  2 16:22:00 2018

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



# Stochastic Day-ahead Electricity dispatch
class expando(object):
    pass


def Get_LHS_Constraint(con_row):
    new_con=0.0
    for i in range(con_row.size()):
        new_con=new_con+con_row.getVar(i)*con_row.getCoeff(i)
    return new_con

def Change_ContractParameters(BLmodel,SCdata,SCP):
    # only one contract at a time
    sc = SCdata.index.get_level_values(0).tolist()[0]
    
    for gen in SCdata.loc[sc].index.tolist():
        for t in BLmodel.edata.time:
            con_name =  'PgenSCmax({0},{1})'.format(gen,t)
            con = BLmodel.model.getConstrByName(con_name)
            con_row=BLmodel.model.getRow(con)
            new_con=Get_LHS_Constraint(con_row)
            rhs= SCP[(sc,gen),t] * SCdata.PcMax[sc,gen]
            BLmodel.model.remove(con)
            BLmodel.model.addConstr(new_con<=rhs,name=con_name)

            
            # Add SOS1
            conSOS= BLmodel.model.getConstrByName('SOS1_'+con_name)
            con_row=BLmodel.model.getRow(conSOS)
            new_con=Get_LHS_Constraint(con_row)
            rhs= SCP[(sc,gen),t] * SCdata.PcMax[sc,gen]
            BLmodel.model.remove(conSOS)
            BLmodel.model.addConstr(new_con==rhs,name='SOS1_'+con_name)
                   
            con_name =  'PgenSCmin({0},{1})'.format(gen,t)
            con = BLmodel.model.getConstrByName(con_name)
            con_row=BLmodel.model.getRow(con)
            new_con=Get_LHS_Constraint(con_row)
            rhs=  - SCP[(sc,gen),t] * SCdata.PcMin[sc,gen]
            BLmodel.model.remove(con)
            BLmodel.model.addConstr(new_con<=rhs,name=con_name)
    
            # Add SOS1
            conSOS= BLmodel.model.getConstrByName('SOS1_'+con_name)
            con_row=BLmodel.model.getRow(conSOS)
            new_con=Get_LHS_Constraint(con_row)
            rhs= - SCP[(sc,gen),t] * SCdata.PcMin[sc,gen]
            BLmodel.model.remove(conSOS)
            BLmodel.model.addConstr(new_con==rhs,name='SOS1_'+con_name)
    
    
            con_name =  'RCupSCmax({0},{1})'.format(gen,t)
            con = BLmodel.model.getConstrByName(con_name)
            con_row=BLmodel.model.getRow(con)
            new_con=Get_LHS_Constraint(con_row)
            rhs=   SCP[(sc,gen),t] * SCdata.PcMax[sc,gen]
            BLmodel.model.remove(con)
            BLmodel.model.addConstr(new_con<=rhs,name=con_name)
    
            # Add SOS1
            conSOS= BLmodel.model.getConstrByName('SOS1_'+con_name)
            con_row=BLmodel.model.getRow(conSOS)
            new_con=Get_LHS_Constraint(con_row)
            rhs= SCP[(sc,gen),t] * SCdata.PcMax[sc,gen]
            BLmodel.model.remove(conSOS)
            BLmodel.model.addConstr(new_con==rhs,name='SOS1_'+con_name)
    
          
            con_name = 'RCdnSCmin({0},{1})'.format(gen,t)
            con = BLmodel.model.getConstrByName(con_name)
            con_row=BLmodel.model.getRow(con)
            new_con=Get_LHS_Constraint(con_row)
            rhs=  - SCP[(sc,gen),t] * SCdata.PcMin[sc,gen]
            BLmodel.model.remove(con)
            BLmodel.model.addConstr(new_con<=rhs,name=con_name)
    
            conSOS= BLmodel.model.getConstrByName('SOS1_'+con_name)
            con_row=BLmodel.model.getRow(conSOS)
            new_con=Get_LHS_Constraint(con_row)
            rhs=  - SCP[(sc,gen),t] * SCdata.PcMin[sc,gen]
            BLmodel.model.remove(conSOS)
            BLmodel.model.addConstr(new_con==rhs,name='SOS1_'+con_name)
  
    BLmodel.model.update()


def ADD_mGRT_Linking_Constraints(BLmodel):      
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
                        
                if gn in BLmodel.gdata.Map_Gn2Eg.keys():
                    for gen in BLmodel.edata.Map_Gn2Eg[gn]:
                        HR = BLmodel.edata.generatorinfo.HR[gen]
                        var_RUp   = BLmodel.model.getVarByName('RUp({0},{1},{2})'.format(gen,s,t))
                        var_RUpSC = BLmodel.model.getVarByName('RUpSC({0},{1},{2})'.format(gen,s,t))
                        var_RDn   = BLmodel.model.getVarByName('RDn({0},{1},{2})'.format(gen,s,t))
                        var_RDnSC = BLmodel.model.getVarByName('RDnSC({0},{1},{2})'.format(gen,s,t))
                    
                    new_con=new_con-HR*(var_RUp+var_RUpSC-var_RDn-var_RDnSC)
                    
                BLmodel.model.remove(con)
                BLmodel.model.addConstr(new_con==0.0,name=con_name)
                BLmodel.model.update() 
                


def ADD_mGDA_Linking_Constraints(BLmodel):
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
    
                

def ADD_mSEDA_DA_Linking_Constraints(BLmodel):
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

def ADD_mSEDA_RT_Linking_Constraints(BLmodel):
    # Use nodal gas price for generator gas price  (DA)    
    # Use nodal gas price for generator UP REGULATION gas price  (RT)
    for gen in BLmodel.edata.gfpp:
        gas_node=BLmodel.edata.Map_Eg2Gn[gen][0]
        HR = BLmodel.edata.generatorinfo.HR[gen]
        for t in BLmodel.edata.time:
            for scenario in BLmodel.edata.scen_wgp:
                
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
        
        ElecData_Load._combine_wind_gprt_scenarios(self,bilevel=True)
        
        ElecData_Load._load_SCinfo(self)
        
    def _build_model(self):
        self.model = gb.Model()



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





#--- Bilevel Model (All subproblems together)
       
f2d=False         
BLmodel=Bilevel_Model(f2d)

print('Adding Variables')
Add_Vars(BLmodel,mSEDA_COMP)
Add_Vars(BLmodel,mGDA_COMP)
Add_Vars(BLmodel,mGRT_COMP)     

print('Adding Constraints')
Add_Constrs(BLmodel,mSEDA_COMP)
Add_Constrs(BLmodel,mGDA_COMP)
Add_Constrs(BLmodel,mGRT_COMP)

print('Adding Objective')

Add_Obj(BLmodel,mSEDA_COMP)
Add_Obj(BLmodel,mGDA_COMP)
Add_Obj(BLmodel,mGRT_COMP)

BLmodel.model.optimize() 
BLmodel.model.reset()

# LINK PROBLEMS AND INTRODUCE NEW VARIABLE

# Add contract pricce for every gas node with generator
gas_nodes = list(BLmodel.edata.Map_Eg2Gn.values())
# result may be list of lists, so flatted
flat_list = [item for sublist in gas_nodes for item in sublist]

GasGenNodes=set(flat_list)
for node in GasGenNodes:
    name='ContractPrice({0})'.format(node)
    BLmodel.model.addVar(lb=0.0,name=name)
    BLmodel.model.update()
   
ADD_mSEDA_DA_Linking_Constraints(BLmodel)
ADD_mSEDA_RT_Linking_Constraints(BLmodel)
ADD_mGDA_Linking_Constraints(BLmodel)
ADD_mGRT_Linking_Constraints(BLmodel)       

print('Bilevel Model is built')
BLmodel.model.write('BLmodel.lp')            


BLmodel.model.Params.timelimit = 25.0
BLmodel.model.optimize() 
BLmodel.model.reset()



#BLmodel.model.Params.DegenMoves=-1
#BLmodel.model.Params.Heuristics=0.05
#BLmodel.model.Params.timelimit = 25.0
#BLmodel.model.Params.MIPFocus=1
#BLmodel.model.Params.StartNodeLimit=1e6
#BLmodel.model.Params.Cuts=1
#BLmodel.model.Params.Presolve=-1
#BLmodel.model.Params.NodeMethod=2
#BLmodel.model.Params.MIPGap=0.5
#BLmodel.model.optimize() 
#BLmodel.model.reset()


Dualobj_mSEDA=Get_Dual_Obj(BLmodel,mSEDA_COMP)
Dualobj_mGDA =Get_Dual_Obj(BLmodel,mGDA_COMP)
Dualobj_mGRT=Get_Dual_Obj(BLmodel,mGRT_COMP)

Obj_mSEDA=Get_Obj(BLmodel,mSEDA_COMP)
Obj_mGDA =Get_Obj(BLmodel,mGDA_COMP)
Obj_mGRT=Get_Obj(BLmodel,mGRT_COMP)


#--- Non gas Generators Objective
gendata = BLmodel.edata.generatorinfo
scenarios = BLmodel.edata.scenarios
scenarioprob={}    
scenarioprob = {s: BLmodel.edata.scen_wgp[s][2] for s in BLmodel.edata.scen_wgp.keys()}    
scengprt = {s: BLmodel.edata.scen_wgp[s][0] for s in BLmodel.edata.scen_wgp.keys()}
P_up=defaults.RESERVES_UP_PREMIUM
P_dn=defaults.RESERVES_DN_PREMIUM
Non_Gas_gencost=0.0
for t in BLmodel.edata.time:
    for s in scenarios:
        var_name='Lshed({0},{1})'.format(s,t)
        Lshed= BLmodel.model.getVarByName(var_name)
        Non_Gas_gencost=Non_Gas_gencost+ scenarioprob[s]*defaults.VOLL * Lshed
        
    for gen in BLmodel.edata.nongfpp:
        var_name='Pgen({0},{1})'.format(gen,t)
        Pgen = BLmodel.model.getVarByName(var_name)
        Non_Gas_gencost=Non_Gas_gencost+gendata.lincost[gen]*Pgen
        
        for s in scenarios:
            RUp_name='RUp({0},{1},{2})'.format(gen,s,t)
            RDn_name='RDn({0},{1},{2})'.format(gen,s,t)
            
            RUp = BLmodel.model.getVarByName(RUp_name)
            RDn = BLmodel.model.getVarByName(RDn_name)
            Temp=scenarioprob[s]*gendata.lincost[gen]*(P_up*RUp-P_dn*RDn)
            Non_Gas_gencost=Non_Gas_gencost+Temp

Non_gen_Income=0.0
for t in BLmodel.edata.time:
    for gn in BLmodel.gdata.gnodes:
        name = 'lambda_gas_balance_da({0},k0,{1})'.format(gn,t)
        GasPrice = BLmodel.model.getVarByName(name)
        Demand= BLmodel.gdata.gasload['ng101']['t1']
        Non_gen_Income=Non_gen_Income+Demand*GasPrice
        

 # Min. Costs - Income
 # Costs = DA Gas Production
 #       + RT Gas Production
 #
 #Income = Non Gen_Income (From normal gas load)
 #       + Gen_Income
 #
 # mSEDA_Obj = Gen_Income + Non_Gas_gencost
 # mSEDA_Obj = mSEDA_DualObj
 # Gen_Income = mSEDA_DualObj - Non_Gas_gencost
 
Obj =  Obj_mGDA +Obj_mGRT -Non_gen_Income - (Dualobj_mSEDA-Non_Gas_gencost)

BLmodel.model.setObjective(Obj  ,gb.GRB.MINIMIZE)
BLmodel.model.Params.timelimit = 50.0
BLmodel.model.Params.MIPGap=0.5
BLmodel.model.Params.MIPFocus = 3
BLmodel.model.optimize() 


ContractPrice=BLmodel.model.getVarByName('ContractPrice(ng102)')


#--- Change the Contract Parameters


# 
       
All_SCdata = pd.read_csv(defaults.SCdata_NoPrice)

Sc2Gen = list()
for sc in All_SCdata.GasNode:        
    Sc2Gen.append( BLmodel.edata.Map_Gn2Eg[sc])
    
        
All_SCdata['GFPP']=pd.DataFrame(Sc2Gen)         
All_SCdata.set_index(['SC_ID','GFPP'], inplace=True) 
    

for contract in All_SCdata.index.get_level_values(0).tolist():
    SCdata = All_SCdata.iloc[All_SCdata.index.get_level_values(0) == contract]
    
    SCP = defaultdict(list)
   
    for sc in SCdata.index:
        for t in BLmodel.edata.time:
            tt = BLmodel.edata.time.index(t)+1            
            SCP[sc,t] = 1.0 if (tt >= SCdata.ts[sc] and tt<= SCdata.te[sc]) else 0.0
       
    Change_ContractParameters(BLmodel,SCdata,SCP)
    
    BLmodel.model.resetParams()
    BLmodel.model.Params.timelimit = 100.0
    BLmodel.model.Params.MIPGapAbs=0.5
    BLmodel.model.Params.MIPFocus = 3
    BLmodel.model.optimize() 
    
    Result = {}#defaultdict(dict)    
    if BLmodel.model.status==2:

        GasGenNodes=set(flat_list)
        for node in GasGenNodes:
            name='ContractPrice({0})'.format(node)
            var=BLmodel.model.getVarByName(name)
            Result[node]=var.x
    else:
        print('Contract {0}  failed'.format(contract))
        for node in GasGenNodes:
            Result[node]=np.nan
            
        
    for g in SCdata.index.get_level_values(1).tolist():
        GasNode=All_SCdata.loc[(contract,g)]['GasNode']
        All_SCdata.lambdaC[(contract,g)]=Result[GasNode]
        All_SCdata.time[(contract,g)]=BLmodel.model.Runtime
        All_SCdata.MIPGap[(contract,g)]=BLmodel.model.MIPGap

All_SCdata=All_SCdata.drop(['GFPP'],axis=1)    
All_SCdata.to_csv(defaults.SCdata_NoPrice.replace('.csv','')+'_Complete.csv')    
        
    


#df=pd.DataFrame([[var.VarName,var.x] for var in model_GDA.model.getVars() ],columns=['Name','Value'])
#Q1=df[df.Name.str.contains('Rup',regex=True)]
#Q1[Q1.Name.str.contains('k0')]
#
#
#df=pd.DataFrame([[var.VarName,var.x] for var in model_GRT.model.getVars() ],columns=['Name','Value'])
#df[df.Name.str.contains('lambda_gas_balan',regex=True)]
#
#df=pd.DataFrame([[con.ConstrName,con] for con in model_GRT.model.getConstrs() ],columns=['Name','Value'])
#Q1=df[df.Name.str.contains('gprodUp_max',regex=True)]
#
#df=pd.DataFrame([[var.VarName,var.x] for var in model_GDA.model.getVars() ],columns=['Name','Value'])
#df[df.Name.str.contains('lambda_gas_balance_da\(ng102,k0',regex=True)]

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






