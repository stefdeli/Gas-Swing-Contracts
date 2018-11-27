# -*- coding: utf-8 -*-
"""
Created on Thu Nov 22 12:48:51 2018

@author: omalleyc
"""

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



def Find_NC_Profit(BLmodel):
    print('Finding the Profit with no contracts')
        # Find the no contract profit by setting all the contract sizes to 0 and 
    All_SCdata = pd.read_csv(defaults.SCdata)
    All_SCdata.lambdaC=All_SCdata.lambdaC.astype(float)
    Sc2Gen = list()
    for sc in All_SCdata.GasNode:
        Sc2Gen.append( BLmodel.edata.Map_Gn2Eg[sc])
            
    All_SCdata['GFPP']=pd.DataFrame(Sc2Gen)         
    All_SCdata.set_index(['SC_ID','GFPP'], inplace=True) 
    contract=All_SCdata.index.get_level_values(0)[0]
    Generators=All_SCdata.index.get_level_values(1).tolist()
    for g in Generators:
        All_SCdata.at[(contract,g),'PcMin']=0.0
        All_SCdata.at[(contract,g),'PcMax']=0.0
        
    SCdata = All_SCdata.iloc[All_SCdata.index.get_level_values(0) == contract]
            
    SCP = defaultdict(list)
          
    for sc in SCdata.index:
        for t in BLmodel.edata.time:
            tt = BLmodel.edata.time.index(t)+1
            SCP[sc,t] = 0.0      
    #        SCP[sc,t] = 1.0 if (tt >= SCdata.ts[sc] and tt<= SCdata.te[sc]) else 0.0
             
    Change_ContractParameters(BLmodel,SCdata,SCP)
    
    con=BLmodel.model.getConstrByName('ProfitLimit')
    BLmodel.model.remove(con)
    
    BLmodel.model.update()
    BLmodel.model.setParam( 'OutputFlag',False )
    BLmodel.model.optimize()
    NC_Profit = BLmodel.model.ObjVal
    
    Profit = BLmodel.model.getVarByName('Profit')
    print('\n Profit without Contracts is {0}'.format(Profit))
    BLmodel.model.addConstr(Profit<=NC_Profit,name='ProfitLimit')
    BLmodel.model.update()

#--- Reset to the original
    print('Resetting the model to the first contract')
    All_SCdata = pd.read_csv(defaults.SCdata)
    All_SCdata.lambdaC=All_SCdata.lambdaC.astype(float)
    Sc2Gen = list()
    for sc in All_SCdata.GasNode:
        Sc2Gen.append( BLmodel.edata.Map_Gn2Eg[sc])
            
    All_SCdata['GFPP']=pd.DataFrame(Sc2Gen)         
    All_SCdata.set_index(['SC_ID','GFPP'], inplace=True) 
    contract=All_SCdata.index.get_level_values(0)[0]
    Generators=All_SCdata.index.get_level_values(1).tolist()
        
    SCdata = All_SCdata.iloc[All_SCdata.index.get_level_values(0) == contract]
            
    SCP = defaultdict(list)
          
    for sc in SCdata.index:
        for t in BLmodel.edata.time:
            tt = BLmodel.edata.time.index(t)+1
            SCP[sc,t] = 1.0 if (tt >= SCdata.ts[sc] and tt<= SCdata.te[sc]) else 0.0
             
    Change_ContractParameters(BLmodel,SCdata,SCP)





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
                     
            
            con_name= 'Pmax_DA_GFPP({0},{1})'.format(gen,t)
            con = BLmodel.model.getConstrByName(con_name)
            con_row=BLmodel.model.getRow(con)
            new_con=Get_LHS_Constraint(con_row)
            rhs= BLmodel.edata.generatorinfo.capacity[gen]-SCP[(sc,gen),t] * SCdata.PcMax[sc,gen]
            BLmodel.model.remove(con)
            BLmodel.model.addConstr(new_con<=rhs,name=con_name)
     
            # Add SOS1
            conSOS= BLmodel.model.getConstrByName('SOS1_'+con_name)
            con_row=BLmodel.model.getRow(conSOS)
            new_con=Get_LHS_Constraint(con_row)
            rhs= BLmodel.edata.generatorinfo.capacity[gen]-SCP[(sc,gen),t] * SCdata.PcMax[sc,gen]
            BLmodel.model.remove(conSOS)
            BLmodel.model.addConstr(new_con==rhs,name='SOS1_'+con_name)

            
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
                
                
                GasLoad=BLmodel.gdata.gasload[gas_node][t]
                rhs=GasLoad
                for gen in BLmodel.gdata.Map_Gn2Eg[gas_node]:
                    # Only the first contract is being analyzed
                    SC_Active=SCP[(sc,gen),t]
                    HR=BLmodel.edata.generatorinfo.HR[gen]
                    Pcmax=SCdata.PcMax[sc,gen]
                    Pcmin=SCdata.PcMin[sc,gen]
                    
                    if k =='k0':
                        rhs=rhs
                    elif k =='k1':
                        rhs=rhs + HR*(SC_Active*(Pcmax))
                    elif k =='k2':
                        rhs=rhs + HR*(SC_Active*(Pcmin))   
                
                BLmodel.model.remove(con)
                BLmodel.model.addConstr(new_con==rhs,name=con_name)

# Change duals in objective function exprssion
    Profit_Obj=BLmodel.model.getConstrByName('Profit_def')
    Profit_row=BLmodel.model.getRow(Profit_Obj)
    
    LookUpIndex={Profit_row.getVar(i).VarName:Profit_row.getCoeff(i) for i in range(Profit_row.size())}
    
    for t in BLmodel.edata.time:
        for g in BLmodel.edata.gfpp:
            Pcmax=SCdata.PcMax[sc,gen]*SCP[(sc,g),t] 
            Pcmin=SCdata.PcMin[sc,gen]*SCP[(sc,g),t]
            Pmax=BLmodel.edata.generatorinfo.capacity[g]
            
            name = 'PgenSCmax({0},{1})'.format(g,t)
            LookUpIndex['mu_'+name]=Pcmax
            
      
            name = 'PgenSCmin({0},{1})'.format(g,t)
            LookUpIndex['mu_'+name]=-Pcmin
            
            name = 'RCdnSCmin({0},{1})'.format(g,t)   
            LookUpIndex['mu_'+name]=-Pcmin
            
            name = 'RCupSCmax({0},{1})'.format(g,t)
            LookUpIndex['mu_'+name]=Pcmax
                      
            name= 'Pmax_DA_GFPP({0},{1})'.format(g,t)
            LookUpIndex['mu_'+name]=Pmax-Pcmax
            
    new_con=0.0
    for name, coeff in LookUpIndex.items():
        var=BLmodel.model.getVarByName(name)
        new_con+=coeff*var
        
    BLmodel.model.remove(Profit_Obj)
    BLmodel.model.addConstr(new_con==0.0,name='Profit_def')

       
#            name = 'RCupSCmax({0},{1})'.format(g,t)
#            var=BLmodel.model.getVarByName('mu_'+name)
#            BLmodel.model.setAttr('Obj',[var],[Pcmax])
            

   
    BLmodel.model.update()


def ADD_mGRT_Linking_Constraints(BLmodel):
    print('Linking mGRT constraints')
# 1. Link the Gas DA well production to the Gas real time up/down regulation
# regulation is an inequality constraint so also change the SOS constraints 
#    
# 2. Link the DA flows to the rt gas balance equation  

#--    1.
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
                
#--    2.                
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
    print('Linking mGDA constraints')
    
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
    print('Linking mSEDA DA constraints')
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
    print('Linking mSEDA RT constraints')
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
                
                scen_prob =BLmodel.edata.scen_wgp[scenario][2]
                
                new_con=new_con+ HR * NewPrice*defaults.RESERVES_UP_PREMIUM_GAS 
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
                
                scen_prob =BLmodel.edata.scen_wgp[scenario][2]
                
                new_con=new_con - HR * NewPrice*defaults.RESERVES_DN_PREMIUM_GAS
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
                scen_prob =BLmodel.edata.scen_wgp[scenario][2]
                
                new_con=new_con+ HR * NewPrice*defaults.RESERVES_UP_PREMIUM_GAS_SC * scen_prob
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
                scen_prob =BLmodel.edata.scen_wgp[scenario][2]
                new_con=new_con - HR * NewPrice*defaults.RESERVES_DN_PREMIUM_GAS_SC * scen_prob
                BLmodel.model.remove(con)
                BLmodel.model.addConstr(new_con==0,name=con_name.format(gen,t))
                BLmodel.model.update()   



def Add_Vars(BLmodel,COMP):
    # Add variables
    for var in COMP.model.getVars():
        name=var.VarName
        UB=var.UB
        LB=var.LB
        
        BLmodel.model.addVar(lb=LB, ub=UB, name=name)
    
    BLmodel.model.update()
    
    if COMP.model.status==2:
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


def Get_Dual_Obj2(BLmodel,COMP):
    # Get the dual objective from COMP and write it for BLmodel
    Res=expando()
    NewObj=0.0
    
    Obj_lam=0.0
    Obj_mu_lt=0.0
    Obj_mu_gt=0.0
    
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
        
        con_name=con.ConstrName
        con_BL=BLmodel.model.getConstrByName(con_name)
        
        sense=con.Sense
        RHS=con_BL.RHS
        
        if sense=='=':
            dual=BLmodel.model.getVarByName('lambda_'+conname)
        else:
            dual=BLmodel.model.getVarByName('mu_'+conname)
    
        if sense=='=':
            Obj_lam = Obj_lam+dual*RHS
            NewObj  = NewObj + dual*RHS
        elif sense=='<':
            Obj_mu_lt = Obj_mu_lt - dual*RHS
            NewObj    = NewObj - dual*RHS
        else:
            Obj_mu_gt = Obj_mu_gt + dual*RHS
            NewObj    = NewObj + dual*RHS
#    print(NewObj.getValue())
    Res.NewObj=NewObj
    Res.Obj_lam=Obj_lam
    Res.Obj_mu_lt=Obj_mu_lt
    Res.Obj_mu_gt=Obj_mu_gt
    return Res

def Get_Dual_Obj(BLmodel,COMP):
    # Get the dual objective from COMP and write it for BLmodel
    NewObj=0.0
    
    Obj_lam=0.0
    Obj_mu_lt=0.0
    Obj_mu_gt=0.0
    
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
        
        con_name=con.ConstrName
        con_BL=BLmodel.model.getConstrByName(con_name)
        
        sense=con.Sense
        RHS=con_BL.RHS
        
        if sense=='=':
            dual=BLmodel.model.getVarByName('lambda_'+conname)
        else:
            dual=BLmodel.model.getVarByName('mu_'+conname)
    
        if sense=='=':
            Obj_lam = Obj_lam+dual*RHS
            NewObj  = NewObj + dual*RHS
        elif sense=='<':
            Obj_mu_lt = Obj_mu_lt - dual*RHS
            NewObj    = NewObj - dual*RHS
        else:
            Obj_mu_gt = Obj_mu_gt + dual*RHS
            NewObj    = NewObj + dual*RHS
#    print(NewObj.getValue())
    return NewObj

def Compare(BLmodel,COMP):
        
    df=pd.DataFrame([[var.VarName, 
                      var.x,
                      BLmodel.model.getVarByName(var.VarName).x,
                      var.x- BLmodel.model.getVarByName(var.VarName).x] for var in COMP.model.getVars()],columns=['name','orig','new','error'])
    print('Largest Error is {0}'.format(df.error.abs().max()))    
    return df     


        
        
        
        
def GetDispatch(BLmodel):
    df=pd.DataFrame([[var.VarName,var.x] for var in BLmodel.model.getVars() ],columns=['Name','Value'])
    Gprod1=df[df.Name.str.contains('ntract')]
    Gprod2=df[df.Name.str.contains('gprod\(gw2')]
    Gshed=df[df.Name.str.contains('gshed')]  
    
    # Elec
    Pgen=df[df.Name.str.match('Pgen\(.*')].Value.rename('Pgen').reset_index(drop=True)
    PgenSC=df[df.Name.str.match('PgenSC.*')].Value.rename('PgenSC').reset_index(drop=True)
    Wind=df[df.Name.str.match('WindDA.*')].Value.rename('WindDA').reset_index(drop=True)
    
    
    ElecDA=pd.concat([Pgen,PgenSC,Wind],axis=1)
    
    Wind_s1=BLmodel.edata.windscen['w1']['s1'][BLmodel.edata.time].rename('wind_s1').reset_index(drop=True)*30
#    Wind_s2=BLmodel.edata.windscen['w1']['s2'][BLmodel.edata.time].rename('wind_s2').reset_index(drop=True)*30
    
    Wind_s1_error= (Wind_s1 - Wind).rename('WindError_s1')
#    Wind_s2_error= (Wind_s2 - Wind).rename('WindError_s2')
    
    RUp_s1=df[df.Name.str.match('RUp\(.*,s1,.*')].Value.rename('RUp-s1').reset_index(drop=True)
#    RUp_s2=df[df.Name.str.match('RUp\(.*,s2,.*')].Value.rename('RUp-s2').reset_index(drop=True)
    RDn_s1=df[df.Name.str.match('RDn\(.*,s1,.*')].Value.rename('RDn-s1').reset_index(drop=True)
#    RDn_s2=df[df.Name.str.match('RDn\(.*,s2,.*')].Value.rename('RDn-s2').reset_index(drop=True)
    RUpSC_s1=df[df.Name.str.match('RUpSC\(.*,s1,.*')].Value.rename('RUpSC-s1').reset_index(drop=True)
#    RUpSC_s2=df[df.Name.str.match('RUpSC\(.*,s2,.*')].Value.rename('RUpSC-s2').reset_index(drop=True)
    RDnSC_s1=df[df.Name.str.match('RDnSC\(.*,s1,.*')].Value.rename('RDnSC-s1').reset_index(drop=True)
#    RDnSC_s2=df[df.Name.str.match('RDnSC\(.*,s2,.*')].Value.rename('RDnSC-s2').reset_index(drop=True)
    
    NetR_s1=(RUp_s1+RUpSC_s1 - RDn_s1 -RDnSC_s1).rename('NetR-s1')
#    NetR_s2=(RUp_s2+RUpSC_s2 - RDn_s2 -RDnSC_s2).rename('NetR-s2')
    
    ElecRT_s1=pd.concat([Wind_s1_error,NetR_s1,RUp_s1,RDn_s1,RUpSC_s1,RDnSC_s1],axis=1)
#    ElecRT_s2=pd.concat([Wind_s2_error,NetR_s2,RUp_s2,RDn_s2,RUpSC_s2,RDnSC_s2],axis=1)
    
    #Gas - k0
    G1_k0=df[df.Name.str.match('gprod\(gw1,k0.*')].Value.rename('gw1_k0').reset_index(drop=True)
    G2_k0=df[df.Name.str.match('gprod\(gw2,k0.*')].Value.rename('gw2_k0').reset_index(drop=True)
    G3_k0=df[df.Name.str.match('gprod\(gw3,k0.*')].Value.rename('gw3_k0').reset_index(drop=True)
    
    Demand = (Pgen+PgenSC).rename('Demand')*8
    GasDA=pd.concat([G1_k0,G2_k0,G3_k0,-Demand],axis=1)
    
    l_DA_101=df[df.Name.str.match('lambda_gas_balance_da\(ng101,k0.*')].Value.rename('da_n101').reset_index(drop=True)
    l_DA_102=df[df.Name.str.match('lambda_gas_balance_da\(ng102,k0.*')].Value.rename('da_n102').reset_index(drop=True)
    l_RT_101_s1=df[df.Name.str.match('lambda_gas_balance_rt\(ng101,s1.*')].Value.rename('rt_n101_s1').reset_index(drop=True)
    l_RT_102_s1=df[df.Name.str.match('lambda_gas_balance_rt\(ng102,s1.*')].Value.rename('rt_n102_s1').reset_index(drop=True)
#    l_RT_101_s2=df[df.Name.str.match('lambda_gas_balance_rt\(ng101,s2.*')].Value.rename('rt_n101_s2').reset_index(drop=True)
#    l_RT_102_s2=df[df.Name.str.match('lambda_gas_balance_rt\(ng102,s2.*')].Value.rename('rt_n102_s2').reset_index(drop=True)
    
#    LMP_gas=pd.concat([l_DA_101,l_DA_102,l_RT_101_s1,l_RT_102_s1,l_RT_101_s2,l_RT_102_s2],axis=1)
    LMP_gas=pd.concat([l_DA_101,l_DA_102,l_RT_101_s1,l_RT_102_s1],axis=1)
    
    
    
    G1_s1_up=df[df.Name.str.match('gprodUp\(gw1,s1.*')].Value.rename('gw1Up_s1').reset_index(drop=True)
    G2_s1_up=df[df.Name.str.match('gprodUp\(gw2,s1.*')].Value.rename('gw2Up_s1').reset_index(drop=True)
    G3_s1_up=df[df.Name.str.match('gprodUp\(gw3,s1.*')].Value.rename('gw3Up_s1').reset_index(drop=True)
    G1_s1_dn=df[df.Name.str.match('gprodDn\(gw1,s1.*')].Value.rename('gw1Dn_s1').reset_index(drop=True)
    G2_s1_dn=df[df.Name.str.match('gprodDn\(gw2,s1.*')].Value.rename('gw2Dn_s1').reset_index(drop=True)
    G3_s1_dn=df[df.Name.str.match('gprodDn\(gw3,s1.*')].Value.rename('gw3Dn_s1').reset_index(drop=True)
    GasRT_s1=pd.concat([NetR_s1*8,G1_s1_up,G1_s1_dn,G2_s1_up,G2_s1_dn,G3_s1_up,G3_s1_dn],axis=1)
    
#    G1_s2_up=df[df.Name.str.match('gprodUp\(gw1,s2.*')].Value.rename('gw1Up_s2').reset_index(drop=True)
#    G2_s2_up=df[df.Name.str.match('gprodUp\(gw2,s2.*')].Value.rename('gw2Up_s2').reset_index(drop=True)
#    G3_s2_up=df[df.Name.str.match('gprodUp\(gw3,s2.*')].Value.rename('gw3Up_s2').reset_index(drop=True)
#    G1_s2_dn=df[df.Name.str.match('gprodDn\(gw1,s2.*')].Value.rename('gw1Dn_s2').reset_index(drop=True)
#    G2_s2_dn=df[df.Name.str.match('gprodDn\(gw2,s2.*')].Value.rename('gw2Dn_s2').reset_index(drop=True)
#    G3_s2_dn=df[df.Name.str.match('gprodDn\(gw3,s2.*')].Value.rename('gw3Dn_s2').reset_index(drop=True)
#    GasRT_s2=pd.concat([NetR_s2*8,G1_s2_up,G1_s2_dn,G2_s2_up,G2_s2_dn,G3_s2_up,G3_s2_dn],axis=1)
#    
    
    RDn=df[df.Name.str.contains('RDn\(')]
    
    
    RUpSC=df[df.Name.str.contains('RUpSC\(')]
    RDnSC=df[df.Name.str.contains('RDnSC\(')]   
        
    Lambda_elec=df[df.Name.str.contains('lambda_PowerBalance')]
    Lambda_gas=df[df.Name.str.contains('lambda_gas_balance')]
    
    Results=expando()
    Results.ElecDA=ElecDA
    Results.GasDA=GasDA
    Results.LMP_gas=LMP_gas
    Results.Elec_RT_s1=ElecRT_s1
#    Results.Elec_RT_s2=ElecRT_s2
    Results.Gas_RT_s1=GasRT_s1
#    Results.Gas_RT_s2=GasRT_s2
    return Results


def DA_RT_Model(BLmodel,mSEDA_COMP,mGDA_COMP,mGRT_COMP):
    
    
    BLmodel.mSEDA_COMP=mSEDA_COMP
    BLmodel.mGDA_COMP=mGDA_COMP
    BLmodel.mGRT_COMP=mGRT_COMP
    
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
    
    
    # LINK PROBLEMS AND INTRODUCE NEW VARIABLE
    print('Linking Problems')
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
    
    
    print('Get Original Objectives and Dual Objective')
    Dualobj_mSEDA=Get_Dual_Obj(BLmodel,mSEDA_COMP)
    Dualobj_mGDA =Get_Dual_Obj(BLmodel,mGDA_COMP)
    Dualobj_mGRT=Get_Dual_Obj(BLmodel,mGRT_COMP)
    
    Obj_mSEDA=Get_Obj(BLmodel,mSEDA_COMP)
    Obj_mGDA =Get_Obj(BLmodel,mGDA_COMP)
    Obj_mGRT=Get_Obj(BLmodel,mGRT_COMP)
    
    BLmodel.Dualobj_mSEDA=Dualobj_mSEDA
    
    
    
    print('Construct Objective')
    #--- Non gas Generators Objective
    gendata = BLmodel.edata.generatorinfo
    scenarios = BLmodel.edata.scenarios
    scenarioprob={}    
    scenarioprob = {s: BLmodel.edata.scen_wgp[s][2] for s in BLmodel.edata.scen_wgp.keys()}    
    scengprt = {s: BLmodel.edata.scen_wgp[s][0] for s in BLmodel.edata.scen_wgp.keys()}
    P_up=defaults.RESERVES_UP_PREMIUM_NONGAS
    P_dn=defaults.RESERVES_DN_PREMIUM_NONGAS
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
    

    Income = Non_gen_Income + (Dualobj_mSEDA-Non_Gas_gencost)

    Cost   = Obj_mGDA  + Obj_mGRT

    Profit = BLmodel.model.addVar(name='Profit')

    BLmodel.model.addConstr(Profit==Income-Cost,name='Profit_def') 
    
    BLmodel.model.addConstr(Profit<=BLmodel.Profit_NoContract,name='ProfitLimit') 

    BLmodel.model.setObjective(Profit ,gb.GRB.MAXIMIZE)



    print('Bilevel Model is built')
    folder=defaults.folder+'/LPModels/'
    BLmodel.model.write(folder+'BLmodel.lp')
    
    
def DA_Model(BLmodel,mEDA_COMP,mGDA_COMP):
    
    BLmodel.mEDA_COMP=mEDA_COMP
    BLmodel.mGDA_COMP=mGDA_COMP
    
    print('Adding Variables')
    Add_Vars(BLmodel,mEDA_COMP)
    Add_Vars(BLmodel,mGDA_COMP)
 
    
    print('Adding Constraints')
    Add_Constrs(BLmodel,mEDA_COMP)
    Add_Constrs(BLmodel,mGDA_COMP)

    
    print('Adding Objective')
    
    Add_Obj(BLmodel,mEDA_COMP)
    Add_Obj(BLmodel,mGDA_COMP)

    
    
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
    ADD_mGDA_Linking_Constraints(BLmodel)
     
    
    Dualobj_mEDA=Get_Dual_Obj(BLmodel,BLmodel.mEDA_COMP)
    Dualobj_mGDA =Get_Dual_Obj(BLmodel,mGDA_COMP)

    
    Obj_mEDA=Get_Obj(BLmodel,mEDA_COMP)
    Obj_mGDA =Get_Obj(BLmodel,mGDA_COMP)


    
    #--- Non gas Generators Objective
    gendata = BLmodel.edata.generatorinfo

    Non_Gas_gencost=0.0
    for t in BLmodel.edata.time: 
        for gen in BLmodel.edata.nongfpp:
            var_name='Pgen({0},{1})'.format(gen,t)
            Pgen = BLmodel.model.getVarByName(var_name)
            Non_Gas_gencost=Non_Gas_gencost+gendata.lincost[gen]*Pgen
            
        
    
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
    Income = Non_gen_Income + (Dualobj_mEDA-Non_Gas_gencost)

    Cost   = Obj_mGDA  

    Profit = BLmodel.model.addVar(name='Profit')

    BLmodel.model.addConstr(Profit==Income-Cost,name='Profit_def') 
    
    BLmodel.model.addConstr(Profit<=BLmodel.Profit_NoContract,name='ProfitLimit') 

    BLmodel.model.setObjective(Profit ,gb.GRB.MAXIMIZE)
    
    print('Bilevel Model is built')
    folder=defaults.folder+'/LPModels/'
    BLmodel.model.write(folder+'BLmodel.lp')
    
    BLmodel.model.update()
    
def Loop_Contracts_Price(BLmodel):
    
    
    BLmodel.model.resetParams()
    BLmodel.model.Params.timelimit = 100.0
    #BLmodel.model.Params.MIPGapAbs=0.05
    BLmodel.model.Params.MIPFocus = 1
    BLmodel.model.setParam( 'OutputFlag',False)

    
    All_SCdata = pd.read_csv(defaults.SCdata_NoPrice)
    All_SCdata.lambdaC=All_SCdata.lambdaC.astype(float)
    Sc2Gen = list()
    for sc in All_SCdata.GasNode:        
        Sc2Gen.append( BLmodel.edata.Map_Gn2Eg[sc])
        
            
    All_SCdata['GFPP']=pd.DataFrame(Sc2Gen)         
    All_SCdata.set_index(['SC_ID','GFPP'], inplace=True) 
        
    all_contracts=All_SCdata.index.get_level_values(0).tolist()
    all_contracts_r=list(reversed(all_contracts))
#    all_contracts=['sc7']
#    all_contracts_r=[]
    for contract in all_contracts:
        print ('\n\n########################################################')
        print ('Processing Contract {0}'.format(contract))
        print ('########################################################')
        SCdata = All_SCdata.iloc[All_SCdata.index.get_level_values(0) == contract]
        
        SCP = defaultdict(list)
       
        for sc in SCdata.index:
            for t in BLmodel.edata.time:
                tt = BLmodel.edata.time.index(t)+1            
                SCP[sc,t] = 1.0 if (tt >= SCdata.ts[sc] and tt<= SCdata.te[sc]) else 0.0
         
        
        
        Change_ContractParameters(BLmodel,SCdata,SCP)
        folder=defaults.folder+'/LPModels/'
        BLmodel.model.write(folder+'BLmodel_'+contract+'.lp')

        #BLmodel.model.reset()
        #BLmodel.model.resetParams()
    
        BLmodel.model.optimize() 
        
        Compare_SEDA_DUAL_OBJ(BLmodel)
        Compare_GDA_DUAL_OBJ(BLmodel)
        Compare_GRT_DUAL_OBJ(BLmodel)
       
        gas_nodes = list(BLmodel.edata.Map_Eg2Gn.values())
        # result may be list of lists, so flatted
        flat_list = [item for sublist in gas_nodes for item in sublist]
        GasGenNodes=set(flat_list)
            
        
        Result = {}#defaultdict(dict)    
        if BLmodel.model.status==2:
#            CheckDualObjectives(BLmodel)
            for node in GasGenNodes:
                name='ContractPrice({0})'.format(node)
                var=BLmodel.model.getVarByName(name)
                Result[node]=np.float(var.x)
        else:
            print('Contract {0}  failed'.format(contract))
            for node in GasGenNodes:
                Result[node]=np.nan
                
        if BLmodel.model.status==2:   
            for g in SCdata.index.get_level_values(1).tolist():
                GasNode=All_SCdata['GasNode'][(contract,g)]
                
                All_SCdata.at[(contract,g),'lambdaC']=Result[GasNode]
                All_SCdata.at[(contract,g),'time']=BLmodel.model.Runtime
                All_SCdata.at[(contract,g),'MIPGap']=BLmodel.model.MIPGap
                All_SCdata.at[(contract,g),'Obj']=BLmodel.model.ObjVal
        else:
            for g in SCdata.index.get_level_values(1).tolist():
                GasNode=All_SCdata['GasNode'][(contract,g)]
                
                All_SCdata.at[(contract,g),'lambdaC']=np.nan
                All_SCdata.at[(contract,g),'time']=np.nan
                All_SCdata.at[(contract,g),'MIPGap']=np.nan        
            
        
    
    All_SCdata.reset_index(level=1, inplace=True)
    All_SCdata=All_SCdata.drop(['GFPP'],axis=1)    
    All_SCdata.to_csv(defaults.SCdata_NoPrice.replace('.csv','')+'_Complete.csv')    

    print(All_SCdata[['lambdaC','PcMin','PcMax','MIPGap','Obj']])   
    
    return BLmodel


def Compare_BLmodelObjective(BLmodel):
    CostDA = 0.0
    for t in BLmodel.edata.time:
        for gw in BLmodel.gdata.wells:
            var_name = 'gprod({0},{1},{2})'.format(gw,'k0',t)
            var=BLmodel.model.getVarByName(var_name)
            CostDA= CostDA + BLmodel.gdata.wellsinfo.Cost[gw]*var.x
            
        for gn in BLmodel.gdata.gnodes:
            for k in ['k0','k1','k2']:
                var_name = 'gshed_da({0},{1},{2})'.format(gn,k,t)
                var=BLmodel.model.getVarByName(var_name)
                CostDA= CostDA + defaults.VOLL*var.x
                
        for gn in BLmodel.gdata.gnodes:
            for k in ['k0','k1','k2']:
                var_name = 'gshed_da({0},{1},{2})'.format(gn,k,t)
                var=BLmodel.model.getVarByName(var_name)
                CostDA= CostDA + defaults.VOLL*var.x

    CostRT = 0.0
    for t in BLmodel.edata.time:
        for gw in BLmodel.gdata.wells:
            for s in BLmodel.edata.scenarios:
                var_name_up = 'gprodUp({0},{1},{2})'.format(gw,s,t)
                var_name_dn = 'gprodDn({0},{1},{2})'.format(gw,s,t)
                
                var_up=BLmodel.model.getVarByName(var_name_up)
                var_dn=BLmodel.model.getVarByName(var_name_dn)
                Prob=BLmodel.edata.scen_wgp[s][2]
                P_UP=defaults.RESERVES_UP_PREMIUM_GASWELL
                P_DN=defaults.RESERVES_DN_PREMIUM_GASWELL
                CostRT= CostRT + Prob*BLmodel.gdata.wellsinfo.Cost[gw]*(P_UP*var_up.x-P_DN*var_dn.x)
            

                
                
    IncomeDA    = 0.0
    IncomeSCDA  = 0.0
    for t in BLmodel.edata.time:
        for gen in BLmodel.edata.gfpp:
            var_name = 'Pgen({0},{1})'.format(gen,t)
            Lambda_name ='lambda_gas_balance_da({0},{1},{2})'.format(BLmodel.edata.generatorinfo.origin_gas[gen],'k0',t)
            var=BLmodel.model.getVarByName(var_name)
            price=BLmodel.model.getVarByName(Lambda_name)
            IncomeDA = IncomeDA  + 8*price.x*var.x
            
            var_name = 'PgenSC({0},{1})'.format(gen,t)
            Contract_name ='ContractPrice({0})'.format(BLmodel.edata.generatorinfo.origin_gas[gen])
            var=BLmodel.model.getVarByName(var_name)
            contract=BLmodel.model.getVarByName(Contract_name)
            IncomeSCDA = IncomeSCDA  + 8*contract.x*var.x

                
    IncomeRT    = 0.0
    IncomeSCRT  = 0.0
    for t in BLmodel.edata.time:
        for s in BLmodel.edata.scenarios:
            for gen in BLmodel.edata.gfpp:
                
                Prob=BLmodel.edata.scen_wgp[s][2]
                
                var_name_up = 'RUp({0},{1},{2})'.format(gen,s,t)
                var_name_dn = 'RDn({0},{1},{2})'.format(gen,s,t)
                
                var_up=BLmodel.model.getVarByName(var_name_up)
                var_dn=BLmodel.model.getVarByName(var_name_dn)
            
                
                Lambda_name ='lambda_gas_balance_rt({0},{1},{2})'.format(BLmodel.edata.generatorinfo.origin_gas[gen],s,t)
                price=BLmodel.model.getVarByName(Lambda_name)   
                
                P_UP=defaults.RESERVES_UP_PREMIUM_GAS
                P_DN=defaults.RESERVES_DN_PREMIUM_GAS                
                IncomeRT = IncomeRT  + 8*price.x*(P_UP*var_up.x-P_DN*var_dn.x)
                
            
                var_name_upSC = 'RUpSC({0},{1},{2})'.format(gen,s,t)
                var_name_dnSC = 'RDnSC({0},{1},{2})'.format(gen,s,t)
                
                var_upSC=BLmodel.model.getVarByName(var_name_upSC)
                var_dnSC=BLmodel.model.getVarByName(var_name_dnSC)
            
                Contract_name ='ContractPrice({0})'.format(BLmodel.edata.generatorinfo.origin_gas[gen])
                contract=BLmodel.model.getVarByName(Contract_name)
                
                P_UP=defaults.RESERVES_UP_PREMIUM_GAS_SC
                P_DN=defaults.RESERVES_DN_PREMIUM_GAS_SC
                IncomeSCRT = IncomeSCRT  + Prob*8*contract.x*(P_UP*var_upSC.x-P_DN*var_dnSC.x)
            

    Cost= CostDA+CostRT
    Income=IncomeDA+IncomeSCDA+IncomeRT+IncomeSCRT
    Profit=Cost-Income
#    print('Contract:{3:.2f} \t Profit={4:.2f} \tCost={0:.2f} \t Income={1:.2f} \t IncomeSC={2:.2f}'.format(Cost,Income,IncomeSC,contract.x,-Profit))
#    print('Contract:{2:.2f} \tDual:{0:.2f} \t Calc:{1:.2f} \t Error:{3:.2e}'.format(BLmodel.model.ObjVal,Profit,contract.x,BLmodel.model.ObjVal-Profit))
#    print('Contract={0:.2f} \tIncomeDA={1:.2f} \tIncomeSCDA={2:.2f} \tIncomeRT={3:.2f} \tIncomeSCRT{4:.2f}'.format(contract.x,IncomeDA,IncomeSCDA,IncomeRT,IncomeSCRT))
#   
    df_var,df_con=get_Var_Con(BLmodel)
    ContractedDA=df_var[df_var.Name.str.startswith('PgenSC')].Value.sum()
    
    ContractedUp=df_var[df_var.Name.str.startswith('RUpSC(g1,s1')].Value.sum()
    ContractedDn=df_var[df_var.Name.str.startswith('RDnSC(g1,s1')].Value.sum()
    
    print('mSEDA Contract:{1:.2f} \tDual:{0:.2f} \t Calc{2:.2f} \t DA_PgenSC={3:.2f} \t DA_RUpSC={4:.2f} \t RDnSC={5:.2f}'.format(
            BLmodel.model.ObjVal,contract.x,Profit,ContractedDA,ContractedUp,ContractedDn))


def Compare_BLmodelObjective_DA(BLmodel):
    CostDA = 0.0
    for t in BLmodel.edata.time:
        for gw in BLmodel.gdata.wells:
            var_name = 'gprod({0},{1},{2})'.format(gw,'k0',t)
            var=BLmodel.model.getVarByName(var_name)
            CostDA= CostDA + BLmodel.gdata.wellsinfo.Cost[gw]*var.x
            
        for gn in BLmodel.gdata.gnodes:
            for k in ['k0','k1','k2']:
                var_name = 'gshed_da({0},{1},{2})'.format(gn,k,t)
                var=BLmodel.model.getVarByName(var_name)
                CostDA= CostDA + defaults.VOLL*var.x
                
        for gn in BLmodel.gdata.gnodes:
            for k in ['k0','k1','k2']:
                var_name = 'gshed_da({0},{1},{2})'.format(gn,k,t)
                var=BLmodel.model.getVarByName(var_name)
                CostDA= CostDA + defaults.VOLL*var.x


            

                
                
    IncomeDA    = 0.0
    IncomeSCDA  = 0.0
    for t in BLmodel.edata.time:
        for gen in BLmodel.edata.gfpp:
            var_name = 'Pgen({0},{1})'.format(gen,t)
            Lambda_name ='lambda_gas_balance_da({0},{1},{2})'.format(BLmodel.edata.generatorinfo.origin_gas[gen],'k0',t)
            var=BLmodel.model.getVarByName(var_name)
            price=BLmodel.model.getVarByName(Lambda_name)
            IncomeDA = IncomeDA  + 8*price.x*var.x
            
            var_name = 'PgenSC({0},{1})'.format(gen,t)
            Contract_name ='ContractPrice({0})'.format(BLmodel.edata.generatorinfo.origin_gas[gen])
            var=BLmodel.model.getVarByName(var_name)
            contract=BLmodel.model.getVarByName(Contract_name)
            IncomeSCDA = IncomeSCDA  + 8*contract.x*var.x

  
            

    Cost= CostDA
    Income=IncomeDA+IncomeSCDA
    Profit=Cost-Income
#    print('Contract:{3:.2f} \t Profit={4:.2f} \tCost={0:.2f} \t Income={1:.2f} \t IncomeSC={2:.2f}'.format(Cost,Income,IncomeSC,contract.x,-Profit))
#    print('Contract:{2:.2f} \tDual:{0:.2f} \t Calc:{1:.2f} \t Error:{3:.2e}'.format(BLmodel.model.ObjVal,Profit,contract.x,BLmodel.model.ObjVal-Profit))
#    print('Contract={0:.2f} \tIncomeDA={1:.2f} \tIncomeSCDA={2:.2f} \tIncomeRT={3:.2f} \tIncomeSCRT{4:.2f}'.format(contract.x,IncomeDA,IncomeSCDA,IncomeRT,IncomeSCRT))
#   
    df_var,df_con=get_Var_Con(BLmodel)
    ContractedDA=df_var[df_var.Name.str.startswith('PgenSC')].Value.sum()
    
    print('Contract:{1:.2f} \tDual:{0:.2f} \t Calc{2:.2f} \t DA_PgenSC={3:.2f}'.format(
            BLmodel.model.ObjVal,contract.x,Profit,ContractedDA,))



def PrintInfo(BLmodel):
    
    Contract_name ='ContractPrice({0})'.format('ng102')
    contract=BLmodel.model.getVarByName(Contract_name)
    df_var,df_con=get_Var_Con(BLmodel)
    ContractedDA=df_var[df_var.Name.str.startswith('PgenSC')].Value.sum()
    
    ContractedUp=df_var[df_var.Name.str.startswith('RUpSC(g1,s1')].Value.sum()
    ContractedDn=df_var[df_var.Name.str.startswith('RDnSC(g1,s1')].Value.sum()
    
    DA=df_var[df_var.Name.str.startswith('Pgen(g1')].Value.sum()
    Up=df_var[df_var.Name.str.startswith('RUp(g1,s1')].Value.sum()
    Dn=df_var[df_var.Name.str.startswith('RDn(g1,s1')].Value.sum()
    
    
    Profit=BLmodel.model.ObjVal
    
   
    
    print('Contract:{0:.2f} \tObj:{1:.2f} \
          \t DA_PgenSC={2:.2f} DA_Pgen={3:.2f} \
          \t Net_RSC={4:.2f} \t Net R={5:.2f} \
          '.format(
            contract.x,Profit,
            ContractedDA,DA,
            ContractedUp-ContractedDn,
            Up-Dn))

def get_Var_Con(modelObject):
    if modelObject.model.status==2:
        df_var=pd.DataFrame([[var.VarName,var.x,var.Start] 
                    for var in modelObject.model.getVars()],
                    columns=['Name','Value','Initial'])
    else:
        df_var=pd.DataFrame([[var.VarName,var.Start] 
                    for var in modelObject.model.getVars()],
                    columns=['Name','Initial'])
            
    df_con=pd.DataFrame([[con.ConstrName,con.RHS, modelObject.model.getRow(con),con.sense]
                 for con in modelObject.model.getConstrs() ],
            columns=['Name','RHS','LHS','sense'])
    return df_var,df_con

def Compare_SEDA_DUAL_OBJ(BLmodel):
    CostDA_Elec = 0.0
    for t in BLmodel.edata.time:
        for gen in BLmodel.edata.nongfpp:
            var_name='Pgen({0},{1})'.format(gen,t)
            Pgen = BLmodel.model.getVarByName(var_name)
            cost=BLmodel.edata.generatorinfo.lincost[gen]
            CostDA_Elec +=  cost*Pgen.x
            
        for gen in BLmodel.edata.gfpp:
            HR=BLmodel.edata.generatorinfo.HR[gen]
            var_name='Pgen({0},{1})'.format(gen,t)
            Pgen = BLmodel.model.getVarByName(var_name)
            gasnode=BLmodel.edata.generatorinfo.origin_gas[gen]
            Lambda_name ='lambda_gas_balance_da({0},{1},{2})'.format(gasnode,'k0',t)
            var=BLmodel.model.getVarByName(var_name)
            price=BLmodel.model.getVarByName(Lambda_name)
            
            CostDA_Elec = CostDA_Elec + HR*price.x*var.x
            
            var_name = 'PgenSC({0},{1})'.format(gen,t)
            Contract_name ='ContractPrice({0})'.format(BLmodel.edata.generatorinfo.origin_gas[gen])
            var=BLmodel.model.getVarByName(var_name)
            contract=BLmodel.model.getVarByName(Contract_name)

            CostDA_Elec = CostDA_Elec + HR*contract.x*var.x
        
    
    CostRT_Elec = 0.0
    for t in BLmodel.edata.time:
        for s in BLmodel.edata.scenarios:
            Prob=BLmodel.edata.scen_wgp[s][2]
            for gen in BLmodel.edata.gfpp:
                HR=BLmodel.edata.generatorinfo.HR[gen]  
                
                var_name_up = 'RUp({0},{1},{2})'.format(gen,s,t)
                var_name_dn = 'RDn({0},{1},{2})'.format(gen,s,t)
                
                var_up=BLmodel.model.getVarByName(var_name_up)
                var_dn=BLmodel.model.getVarByName(var_name_dn)
                
                Lambda_name ='lambda_gas_balance_rt({0},{1},{2})'.format(BLmodel.edata.generatorinfo.origin_gas[gen],s,t)
                price=BLmodel.model.getVarByName(Lambda_name)   
#                print(8*price.x*(var_up-var_dn))
                P_UP=defaults.RESERVES_UP_PREMIUM_GAS
                P_DN=defaults.RESERVES_DN_PREMIUM_GAS
                CostRT_Elec = CostRT_Elec + HR*price.x*(P_UP*var_up.x-P_DN*var_dn.x)
                
                # Contract
                var_name_up = 'RUpSC({0},{1},{2})'.format(gen,s,t)
                var_name_dn = 'RDnSC({0},{1},{2})'.format(gen,s,t)
                
                var_up=BLmodel.model.getVarByName(var_name_up)
                var_dn=BLmodel.model.getVarByName(var_name_dn)
            
                Contract_name ='ContractPrice({0})'.format(BLmodel.edata.generatorinfo.origin_gas[gen])
                contract=BLmodel.model.getVarByName(Contract_name)
                
#                print(Prob*8*contract.x*(var_up-var_dn))
                P_UP=defaults.RESERVES_UP_PREMIUM_GAS_SC
                P_DN=defaults.RESERVES_DN_PREMIUM_GAS_SC
                CostRT_Elec = CostRT_Elec + Prob*HR*contract.x*(P_UP*var_up.x-P_DN*var_dn.x)
                
            for gen in BLmodel.edata.nongfpp:
                var_name_up = 'RUp({0},{1},{2})'.format(gen,s,t)
                var_name_dn = 'RDn({0},{1},{2})'.format(gen,s,t)
                
                var_up=BLmodel.model.getVarByName(var_name_up)
                var_dn=BLmodel.model.getVarByName(var_name_dn)
#                print(Prob*BLmodel.edata.generatorinfo.lincost[gen]*(var_up-var_dn))
                P_UP=defaults.RESERVES_UP_PREMIUM_NONGAS
                P_DN=defaults.RESERVES_DN_PREMIUM_NONGAS
                cost=BLmodel.edata.generatorinfo.lincost[gen]
                CostRT_Elec +=  Prob*cost*(P_UP*var_up.x-P_DN*var_dn.x)
  

    mSEDA_Calc_Cost = CostDA_Elec+CostRT_Elec
        
    Dualobj_mSEDA=Get_Dual_Obj(BLmodel,BLmodel.mSEDA_COMP)
    
    print(Dualobj_mSEDA.getValue())
    
    mSEDA_Dual_Cost = Dualobj_mSEDA.getValue()
    
    Error= mSEDA_Calc_Cost-mSEDA_Dual_Cost   

    print('SEDA Contract:{3:.2f} \tCost_Calc={0:.2f} \t Cost_Dual={1:.2f} \t Error={2:.2f}'.format( mSEDA_Calc_Cost, mSEDA_Dual_Cost,Error,contract.x))  



def Compare_GDA_DUAL_OBJ(BLmodel):
    CostDA_Gas = 0.0
    for t in BLmodel.edata.time:
        for gw in BLmodel.gdata.wells:
            
            var_name='gprod({0},k0,{1})'.format(gw,t)
            gprod = BLmodel.model.getVarByName(var_name)
            cost=BLmodel.gdata.wellsinfo.Cost[gw]
            CostDA_Gas +=  cost*gprod.x
      
        for gn in BLmodel.gdata.gnodes:
            for sc in ['k0','k1','k2']:
                var_name='gshed_da({0},{1},{2})'.format(gn,sc,t)
                gshed = BLmodel.model.getVarByName(var_name)
                CostDA_Gas += defaults.VOLL*gshed.x

    mGDA_Calc_Cost = CostDA_Gas
        
    Dualobj_mGDA=Get_Dual_Obj(BLmodel,BLmodel.mGDA_COMP)

    Res=Get_Dual_Obj2(BLmodel,BLmodel.mGDA_COMP)

    w=Res.NewObj
    x=Res.Obj_lam
    y=Res.Obj_mu_lt
    z=Res.Obj_mu_gt
    
    print('\n\n')
    print(w.getValue())
#    print(w.getValue())
    print('\n\n')
    print(x.getValue())
#    print(x.getValue())
    print('\n\n')
    print(y.getValue())
#    print(y.getValue())
    print('\n\n')
    print(z)
#    print(z.getValue())
        
    mGDA_Dual_Cost = Dualobj_mGDA.getValue()
    
    Error= mGDA_Calc_Cost-mGDA_Dual_Cost   

    print('GDA \tCost_Calc={0:.2f} \t Cost_Dual={1:.2f} \t Error={2:.2f}'.format( 
            mGDA_Calc_Cost, mGDA_Dual_Cost,Error))

def Compare_GRT_DUAL_OBJ(BLmodel):
    CostRT_Gas = 0.0
    for t in BLmodel.edata.time:
         for sc in BLmodel.edata.scen_wgp.keys():
             for gw in BLmodel.gdata.wells:
                 
                 Prob=BLmodel.edata.scen_wgp[sc][2]
                 
                 var_nameUp='gprodUp({0},{1},{2})'.format(gw,sc,t)
                 var_nameDn='gprodDn({0},{1},{2})'.format(gw,sc,t)
                 
                 P_UP=defaults.RESERVES_UP_PREMIUM_GASWELL
                 P_DN=defaults.RESERVES_DN_PREMIUM_GASWELL

                 gprodUp = BLmodel.model.getVarByName(var_nameUp)
                 gprodDn = BLmodel.model.getVarByName(var_nameDn)
                
                                
                 cost=BLmodel.gdata.wellsinfo.Cost[gw]
                 CostRT_Gas += Prob* cost*(P_UP*gprodUp.x-P_DN*gprodDn.x)
          
             for gn in BLmodel.gdata.gnodes:
                 var_name='gshed({0},{1},{2})'.format(gn,sc,t)
                 gshed = BLmodel.model.getVarByName(var_name)
                 CostRT_Gas += Prob*defaults.VOLL*gshed.x

    mGRT_Calc_Cost = CostRT_Gas
        
    Dualobj_mGRT=Get_Dual_Obj(BLmodel,BLmodel.mGRT_COMP)
    
    mGRT_Dual_Cost = Dualobj_mGRT.getValue()
    
    Error= mGRT_Calc_Cost-mGRT_Dual_Cost   

    print('GRT \tCost_Calc={0:.2f} \t Cost_Dual={1:.2f} \t Error={2:.2f}'.format( 
            mGRT_Calc_Cost, mGRT_Dual_Cost,Error))




def Compare_SEDA_DUAL_OBJ_DA(BLmodel):
    CostDA_Elec = 0.0
    for t in BLmodel.edata.time:
        for gen in BLmodel.edata.nongfpp:
            var_name='Pgen({0},{1})'.format(gen,t)
            Pgen = BLmodel.model.getVarByName(var_name)
            CostDA_Elec += BLmodel.edata.generatorinfo.lincost[gen]*Pgen.x
            
        for gen in BLmodel.edata.gfpp:
            var_name='Pgen({0},{1})'.format(gen,t)
            Pgen = BLmodel.model.getVarByName(var_name)
            
            Lambda_name ='lambda_gas_balance_da({0},{1},{2})'.format(BLmodel.edata.generatorinfo.origin_gas[gen],'k0',t)
            var=BLmodel.model.getVarByName(var_name)
            price=BLmodel.model.getVarByName(Lambda_name)
            
            CostDA_Elec +=  8*price.x*var.x
            
            var_name = 'PgenSC({0},{1})'.format(gen,t)
            Contract_name ='ContractPrice({0})'.format(BLmodel.edata.generatorinfo.origin_gas[gen])
            var=BLmodel.model.getVarByName(var_name)
            contract=BLmodel.model.getVarByName(Contract_name)

            CostDA_Elec = CostDA_Elec + 8*contract.x*var.x
        

    
    mSEDA_Calc_Cost = CostDA_Elec
    
    Dualobj_mEDA=Get_Dual_Obj(BLmodel,BLmodel.mEDA_COMP)
    
    mSEDA_Dual_Cost = Dualobj_mEDA.getValue()
    
    Error= mSEDA_Calc_Cost-mSEDA_Dual_Cost
    
    print('SEDA Contract:{3:.2f} \tEDA Cost_Calc={0:.2f} \t EDA Cost_Dual={1:.2f} \t Error={2:.2f}'.format( mSEDA_Calc_Cost, mSEDA_Dual_Cost,Error,contract.x))  
    
   

def  PrintDispatchatTime(t,BLmodel):
    HR=8.0
    Contract_name = 'ContractPrice(ng102)'
    print('\n\nContract Price = {0:.2f}\t Size = {1:.2f}\n\n'.format(BLmodel.model.getVarByName(Contract_name).x,BLmodel.edata.SCdata.PcMax[('sc1','g1')]))
    print('DA ')
    print('Pgen \t= {0:.2f}'.format(BLmodel.model.getVarByName('Pgen(g1,{0})'.format(t)).x))
    print('PgenSC \t= {0:.2f}'.format(BLmodel.model.getVarByName('PgenSC(g1,{0})'.format(t)).x))
    print('WindDA \t= {0:.2f}'.format(BLmodel.model.getVarByName('WindDA(w1,{0})'.format(t)).x))
    print('Gas LMP \t= {0:.2f}'.format(BLmodel.model.getVarByName('lambda_gas_balance_da(ng101,k0,{0})'.format(t)).x))
    print('Gprod_w1\t= {0:.2f} / {1}'.format(BLmodel.model.getVarByName('gprod(gw1,k0,{0})'.format(t)).x/HR,BLmodel.gdata.wellsinfo.MaxProd['gw1']/HR))
    print('Gprod_w2\t= {0:.2f} / {1}'.format(BLmodel.model.getVarByName('gprod(gw2,k0,{0})'.format(t)).x/HR,BLmodel.gdata.wellsinfo.MaxProd['gw2']/HR))
    print('Gprod_w3\t= {0:.2f} / {1}'.format(BLmodel.model.getVarByName('gprod(gw3,k0,{0})'.format(t)).x/HR,BLmodel.gdata.wellsinfo.MaxProd['gw3']/HR))
    print('\nRT - s1 Prob={0}'.format(BLmodel.edata.windscenprob['s1']))
    print('R_Net  \t= {0:.2f}'.format(BLmodel.model.getVarByName('RUp(g1,s1,{0})'.format(t)).x-BLmodel.model.getVarByName('RDn(g1,s1,{0})'.format(t)).x))
    print('RSC_Net\t= {0:.2f}'.format(BLmodel.model.getVarByName('RUpSC(g1,s1,{0})'.format(t)).x-BLmodel.model.getVarByName('RDnSC(g1,s1,{0})'.format(t)).x))
    print('Gas LMP \t= {0:.4f}'.format(BLmodel.model.getVarByName('lambda_gas_balance_rt(ng101,s1,{0})'.format(t)).x))
    print('Net_Gprod_w1\t= {0:.2f}'.format(BLmodel.model.getVarByName('gprodUp(gw1,s1,{0})'.format(t)).x/HR-BLmodel.model.getVarByName('gprodDn(gw1,s1,{0})'.format(t)).x/HR))
    print('Net_Gprod_w2\t= {0:.2f}'.format(BLmodel.model.getVarByName('gprodUp(gw2,s1,{0})'.format(t)).x/HR-BLmodel.model.getVarByName('gprodDn(gw2,s1,{0})'.format(t)).x/HR))
    print('Net_Gprod_w3\t= {0:.2f}'.format(BLmodel.model.getVarByName('gprodUp(gw3,s1,{0})'.format(t)).x/HR-BLmodel.model.getVarByName('gprodDn(gw3,s1,{0})'.format(t)).x/HR))
    print('\nRT - s2 Prob={0}'.format(BLmodel.edata.windscenprob['s2']))
    print('R_Net  \t= {0:.2f}'.format(BLmodel.model.getVarByName('RUp(g1,s2,{0})'.format(t)).x-BLmodel.model.getVarByName('RDn(g1,s2,{0})'.format(t)).x))
    print('RSC_Net\t= {0:.2f}'.format(BLmodel.model.getVarByName('RUpSC(g1,s2,{0})'.format(t)).x-BLmodel.model.getVarByName('RDnSC(g1,s2,{0})'.format(t)).x))
    print('Gas LMP \t= {0:.4f}'.format(BLmodel.model.getVarByName('lambda_gas_balance_rt(ng101,s2,{0})'.format(t)).x))
    print('Net_Gprod_w1\t= {0:.2f}'.format(BLmodel.model.getVarByName('gprodUp(gw1,s2,{0})'.format(t)).x/HR-BLmodel.model.getVarByName('gprodDn(gw1,s2,{0})'.format(t)).x/HR))
    print('Net_Gprod_w2\t= {0:.2f}'.format(BLmodel.model.getVarByName('gprodUp(gw2,s2,{0})'.format(t)).x/HR-BLmodel.model.getVarByName('gprodDn(gw2,s2,{0})'.format(t)).x/HR))
    print('Net_Gprod_w3\t= {0:.2f}'.format(BLmodel.model.getVarByName('gprodUp(gw3,s2,{0})'.format(t)).x/HR-BLmodel.model.getVarByName('gprodDn(gw3,s2,{0})'.format(t)).x/HR))

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
     