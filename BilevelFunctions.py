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
import sys
import defaults
import time
import modelObjects


def Find_NC_Profit(BLmodel):
    print('Finding the Cost with no contracts')
        # Find the no contract profit by setting all the contract sizes to 0 and 
    print('Get Contracts and set size to 0')
    All_SCdata,SCP=Get_SCdata(BLmodel)

    All_SCdata.PcMin=0.0
    All_SCdata.PcMax=0.0
    
    # Also set the contract activation time to 0 (unnecessary)  
    for i in SCP.keys():
        SCP[i] = 0.0     
    
    # Select the first contract and use that to 
    # change the contract sizes in the model
    contract=All_SCdata.index.get_level_values(0)[0]
    SCdata = All_SCdata.iloc[All_SCdata.index.get_level_values(0) == contract]
    
    print('Changing Contract size to 0')     
    
    Change_ContractParameters(BLmodel,SCdata,SCP)
    
    
    print('Removing the mSEDA cost constraint')
    #   Remove the Cost limit becuase this run is to find the limit 
    # and model was built with arbitrary limit
    con=BLmodel.model.getConstrByName('CostLimit')
    BLmodel.model.remove(con)
    
# Could also add constraints to force contract price to 0
# Or to give an upper limit to cost  BUT REMEMBER TO REMOVE AT END
    
#    ContractPrice=BLmodel.model.getVarByName('ContractPrice(ng102)')
#    BLmodel.model.addConstr(ContractPrice==0.0,name='Contract_zero')
#    BLmodel.model.setObjective(ContractPrice,gb.GRB.MINIMIZE)

# Gurobi Settings    
    BLmodel.model.update()
    BLmodel.model.reset()

    BLmodel.model.params.AggFill = 10
    BLmodel.model.params.Presolve = 2
    BLmodel.model.setParam('ImproveStartTime',10)
    BLmodel.model.setParam( 'MIPFocus',3 )
    BLmodel.model.setParam( 'OutputFlag',True )
    
    BLmodel.model.optimize()
    
    # Use solution to create gas prices for running models sequentially
#    Create_GasPrices(BLmodel)
    Replace_GasPrices(BLmodel)
    
    
    print('Optimization Finished')
    
    BLmodel.model.resetParams()
    
    
    mSEDACost = BLmodel.model.getVarByName('mSEDACost')
    
    BLmodel.NC_mSEDACost=mSEDACost.x
   
    NC_Profit = BLmodel.model.ObjVal
    
    print('\nProfit without Contracts is {0}'.format(NC_Profit))
    print('mSEDA Cost without Contracts is {0}\n'.format(mSEDACost.x))
    

#--- Reset to the original
    
    print('Reseting Model to original contract')    
# Replace any deleted constraints and delete any added constraints
    BLmodel.model.addConstr(mSEDACost<=1.0* BLmodel.NC_mSEDACost,name='CostLimit')
    BLmodel.model.update()
 
#    

    print('Resetting the model to the first contract')
    
    All_SCdata,SCP=Get_SCdata(BLmodel)       
    contract=All_SCdata.index.get_level_values(0)[0]
    SCdata = All_SCdata.iloc[All_SCdata.index.get_level_values(0) == contract]         
    Change_ContractParameters(BLmodel,SCdata,SCP)


    print('\nNew Contract Profit found and included in model \n\n')
    BLmodel.model.update()
    BLmodel.model.reset()
    BLmodel.model.resetParams()

# Stochastic Day-ahead Electricity dispatch
class expando(object):
    pass


def Get_SCdata(BLmodel):
    All_SCdata = pd.read_csv(defaults.SCdata)
    All_SCdata.lambdaC=All_SCdata.lambdaC.astype(float)
    Sc2Gen = list()
    for sc in All_SCdata.GasNode:
        Sc2Gen.append( BLmodel.edata.Map_Gn2Eg[sc])
            
    All_SCdata['GFPP']=pd.DataFrame(Sc2Gen)         
    All_SCdata.set_index(['SC_ID','GFPP'], inplace=True) 
    contract=All_SCdata.index.get_level_values(0)[0]    
    SCdata = All_SCdata.iloc[All_SCdata.index.get_level_values(0) == contract]
            
    SCP = defaultdict(list)
          
    for sc in SCdata.index:
        for t in BLmodel.edata.time:
            tt = defaults.Horizon.index(t)+1
            SCP[sc,t] = 1.0 if (tt >= SCdata.ts[sc] and tt<= SCdata.te[sc]) else 0.0
    
    return All_SCdata,SCP

def Get_LHS_Constraint(con_row):
    new_con=0.0
    for i in range(con_row.size()):
        new_con=new_con+con_row.getVar(i)*con_row.getCoeff(i)
    return new_con

def Change_ContractParameters(BLmodel,SCdata,SCP):
    # For each contract, change the size of the contract in the mSEDA model
    # The following constraints need to be changed:
    # 1. Max DA PgenSC and SOS def
    # 2. Min DA PgenSC and SOS def
    # 3. Max RT RUp and SOS def
    # 4. Max RT RDn and SOS def
    # 5. Non contracted generator limit and SOS def
    # 6. Gas Balance for k1 and k2 cases
    #
    # The contract terms do not appear in the stationarity conditions
    # However they do appear in the dual objective, which is used in two places
    # 1. The overall objective function of the bilevel model
    # 2. The Constraint that limits the cost of the mSEDA model
    
    
    # Get Contract Name
    sc = SCdata.index.get_level_values(0).tolist()[0]
    
    # Start by changing the primal constraints
    # And for the inequalities, their associated SOS constraints
    
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


# Change the gas balance at da for the k1 and k2 cases. In the bilevel mode
# The Pgen and PgenSC are already included as variables
    for gas_node in BLmodel.edata.Map_Gn2Eg:
        for t in BLmodel.edata.time:
            for k in  BLmodel.gdata.sclim:
                
                con_name='gas_balance_da({0},{1},{2})'.format(gas_node,k,t)
                con=BLmodel.model.getConstrByName(con_name)
                con_row=BLmodel.model.getRow(con)
                new_con=Get_LHS_Constraint(con_row)
                

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

# Part 2: Change the dual objective where it appears
# 1. In the overall objective function
# 2. in the mSEDA cost constraint
# Change duals in objective function exprssion
    con=BLmodel.model.getConstrByName('mSEDACost_def')
    
    
    
    for t in BLmodel.edata.time:
        for g in BLmodel.edata.gfpp:
            Pcmax=SCdata.PcMax[sc,g]*SCP[(sc,g),t] 
            Pcmin=SCdata.PcMin[sc,g]*SCP[(sc,g),t]
            Pmax=BLmodel.edata.generatorinfo.capacity[g]
            
            name = 'PgenSCmax({0},{1})'.format(g,t)
            var=BLmodel.model.getVarByName('mu_'+name)
#            BLmodel.model.setAttr('Obj',[var],[-Pcmax])           
            BLmodel.model.chgCoeff(con, var, Pcmax)

                        
            name = 'PgenSCmin({0},{1})'.format(g,t)
            var=BLmodel.model.getVarByName('mu_'+name)
#            BLmodel.model.setAttr('Obj',[var],[Pcmin])
            BLmodel.model.chgCoeff(con, var, -Pcmin)

            

            
            name = 'RCdnSCmin({0},{1})'.format(g,t)   
            var=BLmodel.model.getVarByName('mu_'+name)
#            BLmodel.model.setAttr('Obj',[var],[Pcmin])
            BLmodel.model.chgCoeff(con, var, -Pcmin)
            
            
            name = 'RCupSCmax({0},{1})'.format(g,t)
            var=BLmodel.model.getVarByName('mu_'+name)
#            BLmodel.model.setAttr('Obj',[var],[-Pcmax])           
            BLmodel.model.chgCoeff(con, var, Pcmax)
            

            name= 'Pmax_DA_GFPP({0},{1})'.format(g,t)
            var=BLmodel.model.getVarByName('mu_'+name)
#            BLmodel.model.setAttr('Obj',[var],[Pcmax-Pmax])
            BLmodel.model.chgCoeff(con, var, -Pcmax+Pmax)
            
            

            
#            col=BLmodel.model.getCol(var)
#            col.remove(con)
#            col.addTerms(Pcmax,con)

       
#            name = 'RCupSCmax({0},{1})'.format(g,t)
#            var=BLmodel.model.getVarByName('mu_'+name)
#            BLmodel.model.setAttr('Obj',[var],[Pcmax])
            

   
    BLmodel.model.update()


def ADD_mGRT_Linking_Constraints(BLmodel):

# 1. Link the Gas DA well production to the Gas real time up/down regulation
# regulation is an inequality constraint so also change the SOS constraints 
#    
# 2. Link the DA flows to the rt gas balance equation  

#--    1.
    count=1
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
                sys.stdout.write('\r'+"Linking mGRT constraints: " +str(count) )
                count=count+1
                
                conSOS=BLmodel.model.getConstrByName(con_name_up_SOS)
                con_rowSOS=BLmodel.model.getRow(conSOS)
                new_conSOS=0.0
                for i in range(con_rowSOS.size()):
                    new_conSOS=new_conSOS+con_rowSOS.getVar(i)*con_rowSOS.getCoeff(i)
                new_conSOS=new_conSOS+var
                BLmodel.model.remove(conSOS)
                BLmodel.model.addConstr(new_conSOS==Gwell_max,name=con_name_up_SOS)
                sys.stdout.write('\r'+"Linking mGRT constraints: " +str(count) )
                count=count+1     
                
                
                # lower Limit
                con=BLmodel.model.getConstrByName(con_name_dn)
                con_row=BLmodel.model.getRow(con)
                new_con=0.0
                for i in range(con_row.size()):
                    new_con=new_con+con_row.getVar(i)*con_row.getCoeff(i)
                BLmodel.model.remove(con)
                BLmodel.model.addConstr(new_con<=var,name=con_name_dn)
                sys.stdout.write('\r'+"Linking mGRT constraints: " +str(count) )
                count=count+1
                
                conSOS=BLmodel.model.getConstrByName(con_name_dn_SOS)
                con_rowSOS=BLmodel.model.getRow(conSOS)
                new_conSOS=0.0
                for i in range(con_rowSOS.size()):
                    new_conSOS=new_conSOS+con_rowSOS.getVar(i)*con_rowSOS.getCoeff(i)
                new_conSOS=new_conSOS-var
                BLmodel.model.remove(conSOS)
                BLmodel.model.addConstr(new_conSOS==0.0,name=con_name_dn_SOS)
                sys.stdout.write('\r'+"Linking mGRT constraints: " +str(count) )
                count=count+1
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
                sys.stdout.write('\r'+"Linking mGRT constraints: " +str(count) )
                count=count+1
    
    BLmodel.model.update()
    print('\n')
                


def ADD_mGDA_Linking_Constraints(BLmodel):
    print('Linking mGDA constraints')
    
    
    for gas_node in BLmodel.edata.Map_Gn2Eg:
        for t in BLmodel.edata.time:
            for k in  BLmodel.gdata.sclim:
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
    for var in COMP.model.getVars():
        name=var.VarName
        BLmodel.model.getVarByName(name).Start=0.0

    
    if COMP.model.status==2:
        for var in COMP.model.getVars():
            name=var.VarName
            value=var.x
            BLmodel.model.getVarByName(name).Start=value
#            

#    
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
    
    
#--- LINK PROBLEMS AND INTRODUCE NEW VARIABLE
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
    
    
    start_time = time.time()
    ADD_mSEDA_DA_Linking_Constraints(BLmodel)
    print("This took "+ str(time.time() - start_time)+ " to run")
    
    start_time = time.time()
    ADD_mSEDA_RT_Linking_Constraints(BLmodel)
    print("This took "+ str(time.time() - start_time)+ " to run")
    
    start_time = time.time()
    ADD_mGDA_Linking_Constraints(BLmodel)
    print("This took "+ str(time.time() - start_time)+ " to run")
    
    start_time = time.time()
    ADD_mGRT_Linking_Constraints(BLmodel)       
    print("This took "+ str(time.time() - start_time)+ " to run")
    
    
#----------------------------------------------------------------------------#
#----------------------------------------------------------------------------#    
    print('Change KKT systems of GDA and GRT for quadratic cost')
    for t in BLmodel.edata.time:
        for gw in BLmodel.gdata.wells:
            P_UP=defaults.RESERVES_UP_PREMIUM_GASWELL
            P_DN=defaults.RESERVES_DN_PREMIUM_GASWELL
            
            LinCost=BLmodel.gdata.wellsinfo.LinCost[gw]
            QuadCost=BLmodel.gdata.wellsinfo.QuadCost[gw]

            name='dLag/gprod({1},k0,{0})'.format(t,gw)
            
            con=BLmodel.model.getConstrByName(name)
            con_row=BLmodel.model.getRow(con)
            new_con=Get_LHS_Constraint(con_row)
            var=BLmodel.model.getVarByName('gprod({1},k0,{0})'.format(t,gw))
            
            new_con += 2*QuadCost*var+LinCost
            
            BLmodel.model.remove(con)
            BLmodel.model.addConstr(new_con==0,name=name)
            
    
            for s in BLmodel.edata.scenarios:
                Prob=BLmodel.edata.scen_wgp[s][2]
                nameUp='gprodUp({2},{1},{0})'.format(t,s,gw)
                nameDn='gprodDn({2},{1},{0})'.format(t,s,gw)
                
                varUp=BLmodel.model.getVarByName(nameUp)
                varDn=BLmodel.model.getVarByName(nameDn)
                
                name='dLag/'+nameUp
                con=BLmodel.model.getConstrByName(name)
                con_row=BLmodel.model.getRow(con)
                new_con=Get_LHS_Constraint(con_row)
                
#                
                if defaults.GASCOSTMODEL==1:
                    new_con+=Prob*( 2*QuadCost*(var+varUp-varDn)+LinCost)
                else:
                    new_con+=P_UP*Prob*( 2*QuadCost*(var+varUp)+LinCost)
                    
                
                BLmodel.model.remove(con)
                BLmodel.model.addConstr(new_con==0,name=name)
        
                name='dLag/'+nameDn
                con=BLmodel.model.getConstrByName(name)
                con_row=BLmodel.model.getRow(con)
                new_con=Get_LHS_Constraint(con_row)
                
                if defaults.GASCOSTMODEL==1 :
                    new_con-=Prob*( 2*QuadCost*(var+varUp-varDn)+LinCost)
                else:
                    new_con+=P_DN*Prob*( 2*QuadCost*(var-varDn)+LinCost)
                    
                
                BLmodel.model.remove(con)
                BLmodel.model.addConstr(new_con==0,name=name)
    




    print('Create Bilevel Model Objectives and Dual Objective')
    
    # Objective is to maximize the profit = Income-Cost
    
    # Cost is wells and load shedding for DA and RT
    
    print('Pt1. Cost: Construct Quadratic Objective for mGDA and mGRT')    
    
    Obj_mGDA=0.0

#   Day Ahead
    for t in BLmodel.edata.time:
        for k in  BLmodel.gdata.sclim:
            for gn in BLmodel.gdata.gnodes:
                var=BLmodel.model.getVarByName('gshed_da({2},{1},{0})'.format(t,k,gn))
                Obj_mGDA+=defaults.VOLL*var
        
        for gw in BLmodel.gdata.wells:
            LinCost=BLmodel.gdata.wellsinfo.LinCost[gw]
            QuadCost=BLmodel.gdata.wellsinfo.QuadCost[gw]
            
            var=BLmodel.model.getVarByName('gprod({1},k0,{0})'.format(t,gw))
            Obj_mGDA+=QuadCost*var*var+LinCost*var

#   Real time
    Obj_mGRT=0.0        

    for t in BLmodel.edata.time:        
        for s in BLmodel.edata.scenarios:
            Prob=BLmodel.edata.scen_wgp[s][2]
            for gn in BLmodel.gdata.gnodes:
                var=BLmodel.model.getVarByName('gshed({2},{1},{0})'.format(t,s,gn))
                Obj_mGRT += Prob*defaults.VOLL * var
        
            for gw in BLmodel.gdata.wells:
                
                P_UP=defaults.RESERVES_UP_PREMIUM_GASWELL
                P_DN=defaults.RESERVES_DN_PREMIUM_GASWELL
                
                LinCost=BLmodel.gdata.wellsinfo.LinCost[gw]
                QuadCost=BLmodel.gdata.wellsinfo.QuadCost[gw]
                
                var=BLmodel.model.getVarByName('gprod({1},k0,{0})'.format(t,gw))
                varUp=BLmodel.model.getVarByName('gprodUp({2},{1},{0})'.format(t,s,gw))        
                varDn=BLmodel.model.getVarByName('gprodDn({2},{1},{0})'.format(t,s,gw))
                
                # Cup =a(g+r)^2 +b(g+r) - (a(g)^2 +b(g))
                # Cup =a(g+r)^2 +b(r) - a(g)^2
                
                # Cdn =a(g-r)^2 +b(g-r) - (a(g)^2 +b(g))
                # Cdn =a(g-r)^2 -b(r) - a(g)^2
                

                if defaults.GASCOSTMODEL==1 :
                    Cost = QuadCost*(var+varUp-varDn)*(var+varUp-varDn) +LinCost*(var+varUp-varDn)\
                       -QuadCost*(var)*(var) - LinCost*(var)
                    Obj_mGRT+=Prob*(Cost)
                else:
                    CostUp = QuadCost*(var+varUp)*(var+varUp) +LinCost*varUp - QuadCost*var*var
                    
#                    Rdn = BLmodel.model.addVar(lb=0.0,name='Rdn({2},{1},{0})'.format(t,s,gw))
#                    BLmodel.model.addConstr(Rdn==var-varDn)
#                    CostDn = QuadCost*(Rdn)*(Rdn) +LinCost*varDn
                    
#                    CostDn = QuadCost*(varDn)*(varDn) -2*QuadCost*varDn*var -LinCost*varDn 
                    
                    CostDn = QuadCost*(var-varDn)*(var-varDn) -LinCost*varDn - QuadCost*var*var
                                        
                    Obj_mGRT+=Prob*(P_UP*CostUp + P_DN*CostDn)                 
                
    Cost   = Obj_mGDA  + Obj_mGRT    
    
    
     
    
    Dualobj_mSEDA=Get_Dual_Obj(BLmodel,mSEDA_COMP)
    
#    Dualobj_mGDA =Get_Dual_Obj(BLmodel,mGDA_COMP)
#    Dualobj_mGRT=Get_Dual_Obj(BLmodel,mGRT_COMP)
    
    #--- Non gas Generators Objective
    gendata = BLmodel.edata.generatorinfo
    scenarios = BLmodel.edata.scenarios
    scenarioprob = {s: BLmodel.edata.scen_wgp[s][2] for s in BLmodel.edata.scen_wgp.keys()}    
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
            Demand= BLmodel.gdata.gasload[gn][t]
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


    mSEDACost = BLmodel.model.addVar(name='mSEDACost')
    BLmodel.model.addConstr(mSEDACost==Dualobj_mSEDA,name='mSEDACost_def')     
    BLmodel.model.addConstr(mSEDACost<=BLmodel.mSEDACost_NoContract,name='CostLimit') 

    Income = Non_gen_Income + (mSEDACost-Non_Gas_gencost)
    
 
    BLmodel.model.setObjective(Income-Cost ,gb.GRB.MAXIMIZE)

    print ('Add mSEDA Cost Constraint')




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

        
    
#--- LINK PROBLEMS AND INTRODUCE NEW VARIABLE
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
    
    
    start_time = time.time()
    ADD_mSEDA_DA_Linking_Constraints(BLmodel)
    print("This took "+ str(time.time() - start_time)+ " to run")
    
    start_time = time.time()
    ADD_mGDA_Linking_Constraints(BLmodel)
    print("This took "+ str(time.time() - start_time)+ " to run")
    

#----------------------------------------------------------------------------#
#----------------------------------------------------------------------------#    
    print('Change KKT systems of GDA and GRT for quadratic cost')
    for t in BLmodel.edata.time:
        for gw in BLmodel.gdata.wells:
            P_UP=defaults.RESERVES_UP_PREMIUM_GASWELL
            P_DN=defaults.RESERVES_DN_PREMIUM_GASWELL
            
            LinCost=BLmodel.gdata.wellsinfo.LinCost[gw]
            QuadCost=BLmodel.gdata.wellsinfo.QuadCost[gw]

            name='dLag/gprod({1},k0,{0})'.format(t,gw)
            
            con=BLmodel.model.getConstrByName(name)
            con_row=BLmodel.model.getRow(con)
            new_con=Get_LHS_Constraint(con_row)
            var=BLmodel.model.getVarByName('gprod({1},k0,{0})'.format(t,gw))
            
            new_con += 2*QuadCost*var+LinCost
            
            BLmodel.model.remove(con)
            BLmodel.model.addConstr(new_con==0,name=name)
            



    print('Create Bilevel Model Objectives and Dual Objective')
    
    # Objective is to maximize the profit = Income-Cost
    
    # Cost is wells and load shedding for DA and RT
    
    print('Pt1. Cost: Construct Quadratic Objective for mGDA and mGRT')    
    
    Obj_mGDA=0.0

#   Day Ahead
    for t in BLmodel.edata.time:
        for k in  BLmodel.gdata.sclim:
            for gn in BLmodel.gdata.gnodes:
                var=BLmodel.model.getVarByName('gshed_da({2},{1},{0})'.format(t,k,gn))
                Obj_mGDA+=defaults.VOLL*var
        
        for gw in BLmodel.gdata.wells:
            LinCost=BLmodel.gdata.wellsinfo.LinCost[gw]
            QuadCost=BLmodel.gdata.wellsinfo.QuadCost[gw]
            
            var=BLmodel.model.getVarByName('gprod({1},k0,{0})'.format(t,gw))
            Obj_mGDA+=QuadCost*var*var+LinCost*var
             
                
    Cost   = Obj_mGDA   
    
    
     
    
    Dualobj_mEDA=Get_Dual_Obj(BLmodel,mEDA_COMP)
    
#    Dualobj_mGDA =Get_Dual_Obj(BLmodel,mGDA_COMP)
#    Dualobj_mGRT=Get_Dual_Obj(BLmodel,mGRT_COMP)
    
    #--- Non gas Generators Objective
    gendata = BLmodel.edata.generatorinfo
    scenarios = BLmodel.edata.scenarios
    scenarioprob = {s: BLmodel.edata.scen_wgp[s][2] for s in BLmodel.edata.scen_wgp.keys()}    
    P_up=defaults.RESERVES_UP_PREMIUM_NONGAS
    P_dn=defaults.RESERVES_DN_PREMIUM_NONGAS
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
            Demand= BLmodel.gdata.gasload[gn][t]
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

    
    mSEDACost = BLmodel.model.addVar(name='mSEDACost')
    BLmodel.model.addConstr(mSEDACost==Dualobj_mEDA,name='mSEDACost_def')     
    BLmodel.model.addConstr(mSEDACost<=BLmodel.mSEDACost_NoContract,name='CostLimit') 

    Income = Non_gen_Income + (mSEDACost-Non_Gas_gencost)
    
 
    BLmodel.model.setObjective(Income-Cost ,gb.GRB.MAXIMIZE)

    print ('Add mSEDA Cost Constraint')

    print('Bilevel Model is built')
    folder=defaults.folder+'/LPModels/'
    BLmodel.model.write(folder+'BLmodel.lp')
    
def Loop_Contracts_Price(BLmodel):
    

    All_SCdata = pd.read_csv(defaults.SCdata_NoPrice_IN)
    All_SCdata.lambdaC=All_SCdata.lambdaC.astype(float)
    Sc2Gen = list()
    for sc in All_SCdata.GasNode:        
        Sc2Gen.append( BLmodel.edata.Map_Gn2Eg[sc])
        
            
    All_SCdata['GFPP']=pd.DataFrame(Sc2Gen)         
    All_SCdata.set_index(['SC_ID','GFPP'], inplace=True) 
        
    all_contracts=All_SCdata.index.get_level_values(0).tolist()
    all_contracts_r=list(reversed(all_contracts))
#    all_contracts=['sc5']
#    all_contracts_r=[]
    for contract in all_contracts:
        print ('\n\n########################################################')
        print ('Processing Contract {0}'.format(contract))
        print ('########################################################')
        SCdata = All_SCdata.iloc[All_SCdata.index.get_level_values(0) == contract]
        
        SCP = defaultdict(list)
       
        for sc in SCdata.index:
            for t in BLmodel.edata.time:
                tt = defaults.Horizon.index(t)+1            
                SCP[sc,t] = 1.0 if (tt >= SCdata.ts[sc] and tt<= SCdata.te[sc]) else 0.0
         
        
        
        Change_ContractParameters(BLmodel,SCdata,SCP)
        folder=defaults.folder+'/LPModels/'
        BLmodel.model.write(folder+'BLmodel_'+contract+'.lp')

#        BLmodel.model.reset()
#        BLmodel.model.resetParams()
        BLmodel.model.Params.BranchDir = -1
        BLmodel.model.Params.DegenMoves=10
        BLmodel.model.params.AggFill = 10
        BLmodel.model.params.Presolve = 2
        BLmodel.model.Params.NodeMethod=1
        BLmodel.model.Params.timelimit = 100.0
        BLmodel.model.setParam('ImproveStartGap',1)
        BLmodel.model.Params.MIPFocus = 3
        BLmodel.model.setParam( 'OutputFlag',True)
    
        BLmodel.model.optimize() 
        

       
        gas_nodes = list(BLmodel.edata.Map_Eg2Gn.values())
        # result may be list of lists, so flatted
        flat_list = [item for sublist in gas_nodes for item in sublist]
        GasGenNodes=set(flat_list)
            
        
        Result = {}#defaultdict(dict)    
        if BLmodel.model.status==2:
                
#            Compare_SEDA_DUAL_OBJ(BLmodel)
#            Compare_GDA_DUAL_OBJ(BLmodel)
#            Compare_GRT_DUAL_OBJ(BLmodel)
#            Compare_BLmodelObjective(BLmodel)
#            CheckDualObjectives(BLmodel)
            for node in GasGenNodes:
                name='ContractPrice({0})'.format(node)
                var=BLmodel.model.getVarByName(name)
                Result[node]=np.float(var.x)
                
            for g in SCdata.index.get_level_values(1).tolist():
                GasNode=All_SCdata['GasNode'][(contract,g)]
                
                All_SCdata.at[(contract,g),'lambdaC']=Result[GasNode]
                All_SCdata.at[(contract,g),'time']=BLmodel.model.Runtime
                All_SCdata.at[(contract,g),'MIPGap']=BLmodel.model.MIPGap
                All_SCdata.at[(contract,g),'GasProfit']=BLmodel.model.ObjVal
                All_SCdata.at[(contract,g),'mSEDACost']=BLmodel.model.getVarByName('mSEDACost').x
                
        else:
            print('Contract {0}  failed'.format(contract))
            for node in GasGenNodes:
                Result[node]=np.nan
                
            for g in SCdata.index.get_level_values(1).tolist():
                GasNode=All_SCdata['GasNode'][(contract,g)]
                
                All_SCdata.at[(contract,g),'lambdaC']=np.nan
                All_SCdata.at[(contract,g),'time']=np.nan
                try:
                    All_SCdata.at[(contract,g),'MIPGap']=BLmodel.model.MIPGap
                except:
                    All_SCdata.at[(contract,g),'MIPGap']=np.nan    
            
        
    
    All_SCdata.reset_index(level=1, inplace=True)
    All_SCdata=All_SCdata.drop(['GFPP'],axis=1)    
    All_SCdata.to_csv(defaults.SCdata_NoPrice_OUT)    

    print(All_SCdata[['lambdaC','PcMin','PcMax','MIPGap','GasProfit','mSEDACost']])   
    
    return BLmodel


def Compare_BLmodelObjective(BLmodel):
    CostDA = 0.0
    for t in BLmodel.edata.time:
        for gw in BLmodel.gdata.wells:
            var_name = 'gprod({0},{1},{2})'.format(gw,'k0',t)
            var=BLmodel.model.getVarByName(var_name)
            CostDA= CostDA + BLmodel.gdata.wellsinfo.LinCost[gw]*var.x
            
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
    Profit=Income-Cost
    
    Profit_Model= BLmodel.model.ObjVal
    Error=Profit-Profit_Model
#    print('Contract:{3:.2f} \t Profit={4:.2f} \tCost={0:.2f} \t Income={1:.2f} \t IncomeSC={2:.2f}'.format(Cost,Income,IncomeSC,contract.x,-Profit))
#    print('Contract:{2:.2f} \tDual:{0:.2f} \t Calc:{1:.2f} \t Error:{3:.2e}'.format(BLmodel.model.ObjVal,Profit,contract.x,BLmodel.model.ObjVal-Profit))
#    print('Contract={0:.2f} \tIncomeDA={1:.2f} \tIncomeSCDA={2:.2f} \tIncomeRT={3:.2f} \tIncomeSCRT{4:.2f}'.format(contract.x,IncomeDA,IncomeSCDA,IncomeRT,IncomeSCRT))
#   
    df_var,df_con=get_Var_Con(BLmodel)
    ContractedDA=df_var[df_var.Name.str.startswith('PgenSC')].Value.sum()
    
    ContractedUp=df_var[df_var.Name.str.startswith('RUpSC(g1,s1')].Value.sum()
    ContractedDn=df_var[df_var.Name.str.startswith('RDnSC(g1,s1')].Value.sum()
    
    print('\n Contract Price={1:.2f} \tModel Obj={0:.2f} \t Calc Obj={2:.2f} \t Error={3:.2f}'.format(
            Profit_Model,contract.x,Profit,Error))


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
        df_var=pd.DataFrame([[var.VarName,var.x,] 
                    for var in modelObject.model.getVars()],
                    columns=['Name','Value'])

    else:
        df_var=pd.DataFrame([[var.VarName,var.Start] 
                    for var in modelObject.model.getVars()],
                    columns=['Name','Initial'])
        
    try:
        df_con=pd.DataFrame([[con.ConstrName,con.RHS, modelObject.model.getRow(con),con.sense,con.Pi]
                 for con in modelObject.model.getConstrs() ],
            columns=['Name','RHS','LHS','sense','Dual'])
    except:
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
    
  
    mSEDA_Dual_Cost = Dualobj_mSEDA.getValue()
    
    Error= mSEDA_Calc_Cost-mSEDA_Dual_Cost   

    print('SEDA  \tCost_Calc={0:.2f} \t Cost_Dual={1:.2f} \t Error={2:.2f}'.format( mSEDA_Calc_Cost, mSEDA_Dual_Cost,Error))  



def Compare_GDA_DUAL_OBJ(BLmodel):
    CostDA_Gas = 0.0
    for t in BLmodel.edata.time:
        for gw in BLmodel.gdata.wells:
            
            var_name='gprod({0},k0,{1})'.format(gw,t)
            gprod = BLmodel.model.getVarByName(var_name)
            cost=BLmodel.gdata.wellsinfo.LinCost[gw]
            CostDA_Gas +=  cost*gprod.x
      
        for gn in BLmodel.gdata.gnodes:
            for sc in ['k0','k1','k2']:
                var_name='gshed_da({0},{1},{2})'.format(gn,sc,t)
                gshed = BLmodel.model.getVarByName(var_name)
                CostDA_Gas += defaults.VOLL*gshed.x

    mGDA_Calc_Cost = CostDA_Gas
        
    Dualobj_mGDA=Get_Dual_Obj(BLmodel,BLmodel.mGDA_COMP)


#    print(Res.NewObj)   
#    print('\n\n')
#    print(w.getValue())
##    print(w.getValue())
#    print('\n\n')
#    print(x.getValue())
##    print(x.getValue())
#    print('\n\n')
#    print(y.getValue())
##    print(y.getValue())
#    print('\n\n')
#    print(z)
#    print(z.getValue())
    df_var,df_con=get_Var_Con(BLmodel)

    Temp=df_var[df_var.Value.abs()>=1e-5][['Name','Value']]
#    print(Temp[Temp.Name.str.contains('gprod')]   )
#    print(Temp[Temp.Name.str.startswith(('gprod','mu_gprod(','lambda_gas_balance_da','mu_gshed_da_max','mu_gprod_max'))]   )
    mGDA_Dual_Cost = Dualobj_mGDA.getValue()
    
    Error= mGDA_Calc_Cost-mGDA_Dual_Cost   

    print('GDA \tCost_Calc={0:.2f} \t Cost_Dual={1:.2f} \t Error={2:.2f} Power should be constant'.format( 
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

    print('GRT \tCost_Calc={0:.2f} \t Cost_Dual={1:.2f} \t Error={2:.2f} Power should be constant'.format( 
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
    
def Create_GasPrices(BLmodel):
        # Create DA Gas Prices
    DA_Gas=pd.DataFrame(index=BLmodel.edata.time,columns=BLmodel.gdata.gnodes)
    for t in BLmodel.edata.time:
        for ng in BLmodel.gdata.gnodes:
            var=BLmodel.model.getVarByName('lambda_gas_balance_da({0},k0,{1})'.format(ng,t))
            DA_Gas.loc[t,ng]=var.x
    # Repeat Last time for 24 hours
    Row=DA_Gas.loc[t]
    for t_pad in range(int(t[1:]),25):
        name='t'+str(t_pad)
        Row=Row.rename(name)
        DA_Gas.loc[name]=Row
        
    DA_Gas=DA_Gas.transpose()
    DA_Gas.index.name='name'
    DA_Gas=DA_Gas.reset_index()
    DA_Gas=DA_Gas.set_index('name',drop=False)
    DA_Gas.index.name='ID'
    DA_Gas=DA_Gas.reset_index()
    DA_Gas=DA_Gas.set_index(['ID','name'],drop=True)
    DA_Gas.to_csv(defaults.GasPriceDA_file)
    
    #
    ## Create RT Gas Prices
    RT_Gas=pd.DataFrame(index=BLmodel.edata.time,columns=BLmodel.gdata.gnodes)
    for t in BLmodel.edata.time:
        for ng in BLmodel.gdata.gnodes:
            Temp=BLmodel.model.getVarByName('lambda_gas_balance_da({0},k0,{1})'.format(ng,t))
            RT_Gas.loc[t,ng]=Temp.x

#            Temp=0.0
#            for s in BLmodel.edata.scenarios:
#                var=BLmodel.model.getVarByName('lambda_gas_balance_rt({0},{2},{1})'.format(ng,t,s))
#                Temp+=var.x/BLmodel.edata.scen_wgp[s][2] # Divide by probability..
#            Temp=Temp/len(BLmodel.edata.scenarios) # Find Average    
#            RT_Gas.loc[t,ng]=Temp
            
    # Repeat Last time for 24 hours
    Row=RT_Gas.loc[t]
    for t_pad in range(int(t[1:]),25):
        name='t'+str(t_pad)
        Row=Row.rename(name)
        RT_Gas.loc[name]=Row

    RT_Gas=RT_Gas.transpose()
    RT_Gas.index.name='name'
    RT_Gas=RT_Gas.reset_index()
    RT_Gas=RT_Gas.set_index('name',drop=False)
    RT_Gas.index.name='ID'
    RT_Gas=RT_Gas.reset_index()
    RT_Gas=RT_Gas.set_index(['ID','name'],drop=True)
    #
    
    RT_Gas.insert(0, 'scenario', 'spm')
    RT_Gas=RT_Gas.reset_index()
    RT_Gas=RT_Gas.set_index(['ID','name','scenario'],drop=True)
    
    
    for ng in BLmodel.gdata.gnodes:
        # Get each node and introduce variations on price scenario
        Row= RT_Gas.loc[(ng,ng,'spm')]
        RowHigh=defaults.GASRT_HIGH*Row
        RowHigh=RowHigh.rename((ng,ng,'sph'))
        RT_Gas=RT_Gas.append(RowHigh)
        
        RowLow=defaults.GASRT_LOW*Row
        RowLow=RowLow.rename((ng,ng,'spl'))
        RT_Gas=RT_Gas.append(RowLow)
        
        #RT_Gas.to_csv('test.csv')
    RT_Gas.to_csv(defaults.GasPriceScenRT_file)
        

def Replace_GasPrices(BLmodel):
        # Create DA Gas Prices
    DA_Gas=pd.read_csv(defaults.GasPriceDA_file,index_col=['ID','name'])
    for t in BLmodel.edata.time:
        for ng in BLmodel.gdata.gnodes:
            var=BLmodel.model.getVarByName('lambda_gas_balance_da({0},k0,{1})'.format(ng,t))
            DA_Gas.loc[(ng,ng),t]=var.x
    DA_Gas.to_csv(defaults.GasPriceDA_file)

    ## Create RT Gas Prices
    RT_Gas=pd.read_csv(defaults.GasPriceScenRT_file,index_col=['ID','name','scenario'])
    
    for t in BLmodel.edata.time:
        for ng in BLmodel.gdata.gnodes:
            Temp=BLmodel.model.getVarByName('lambda_gas_balance_da({0},k0,{1})'.format(ng,t))
            RT_Gas.loc[(ng,ng,'spm'),t]=Temp.x
            RT_Gas.loc[(ng,ng,'sph'),t]=defaults.GASRT_HIGH*Temp.x
            RT_Gas.loc[(ng,ng,'spl'),t]=defaults.GASRT_LOW*Temp.x

    RT_Gas.to_csv(defaults.GasPriceScenRT_file)
        
        
def SequentialClearing(Timesteps=[]):
    
    mSEDA = modelObjects.StochElecDA_seq(comp=False,bilevel=False,Timesteps=Timesteps)
    dispatchElecDA=mSEDA.optimize()
    
    f2d = False
    
    mGDA = modelObjects.GasDA(dispatchElecDA,f2d,comp=False,Timesteps=Timesteps)
    

    Obj_mGDA=0.0

#   Day Ahead
    for t in mGDA.gdata.time:
        for k in  mGDA.gdata.sclim:
            for gn in mGDA.gdata.gnodes:
                var=mGDA.model.getVarByName('gshed_da({2},{1},{0})'.format(t,k,gn))
                Obj_mGDA+=defaults.VOLL*var
        
        for gw in mGDA.gdata.wells:
            LinCost=mGDA.gdata.wellsinfo.LinCost[gw]
            QuadCost=mGDA.gdata.wellsinfo.QuadCost[gw]
            
            var=mGDA.model.getVarByName('gprod({1},k0,{0})'.format(t,gw))
            Obj_mGDA+=QuadCost*var*var+LinCost*var
    mGDA.model.setObjective(Obj_mGDA)                
    
    dispatchGasDA=mGDA.optimize()
    
    mERT = modelObjects.ElecRT_seq(dispatchElecDA,bilevel=False,comp=False,Timesteps=Timesteps)
    dispatchElecRT=mERT.optimize()
       
    mGRT = modelObjects.GasRT(dispatchGasDA,dispatchElecRT,f2d,comp=False,Timesteps=Timesteps)
    
    
    Obj_mGRT=0.0        

    for t in mGRT.gdata.time:        
        for s in mERT.edata.scenarios:
            Prob=mERT.edata.scen_wgp[s][2]
            for gn in mGRT.gdata.gnodes:
                var=mGRT.model.getVarByName('gshed({2},{1},{0})'.format(t,s,gn))
                Obj_mGRT += Prob*defaults.VOLL * var
        
            for gw in mGRT.gdata.wells:
                
                P_UP=defaults.RESERVES_UP_PREMIUM_GASWELL
                P_DN=defaults.RESERVES_DN_PREMIUM_GASWELL
                
                LinCost=mGRT.gdata.wellsinfo.LinCost[gw]
                QuadCost=mGRT.gdata.wellsinfo.QuadCost[gw]
                
                var=mGDA.model.getVarByName('gprod({1},k0,{0})'.format(t,gw)).x
                varUp=mGRT.model.getVarByName('gprodUp({2},{1},{0})'.format(t,s,gw))        
                varDn=mGRT.model.getVarByName('gprodDn({2},{1},{0})'.format(t,s,gw))
                
                # Cup =a(g+r)^2 +b(g+r) - (a(g)^2 +b(g))
                # Cup =a(g+r)^2 +b(r) - a(g)^2
                
                # Cdn =a(g-r)^2 +b(g-r) - (a(g)^2 +b(g))
                # Cdn =a(g-r)^2 -b(r) - a(g)^2
                

                if defaults.GASCOSTMODEL==1 :
                    Cost = QuadCost*(var+varUp-varDn)*(var+varUp-varDn) +LinCost*(var+varUp-varDn)\
                       -QuadCost*(var)*(var) - LinCost*(var)
                    Obj_mGRT+=Prob*(Cost)
                else:
                    CostUp = QuadCost*(var+varUp)*(var+varUp) +LinCost*varUp - QuadCost*var*var
                    
#                    Rdn = BLmodel.model.addVar(lb=0.0,name='Rdn({2},{1},{0})'.format(t,s,gw))
#                    BLmodel.model.addConstr(Rdn==var-varDn)
#                    CostDn = QuadCost*(Rdn)*(Rdn) +LinCost*varDn
                    
#                    CostDn = QuadCost*(varDn)*(varDn) -2*QuadCost*varDn*var -LinCost*varDn 
                    
                    CostDn = QuadCost*(var-varDn)*(var-varDn) -LinCost*varDn - QuadCost*var*var
                                        
                    Obj_mGRT+=Prob*(P_UP*CostUp + P_DN*CostDn) 
    
    mGRT.model.setObjective(Obj_mGRT)
    
    
    mGRT.optimize()
    
    Result=expando()
    Result.mSEDA=mSEDA
    Result.mGDA=mGDA
    Result.mERT=mERT
    Result.mGRT=mGRT
    
    
    GasPayment=0.0
    CostDA_Elec = 0.0
    for t in mSEDA.edata.time:
        for gen in mSEDA.edata.nongfpp:
            var_name='Pgen({0},{1})'.format(gen,t)
            Pgen = mSEDA.model.getVarByName(var_name)
            cost=mSEDA.edata.generatorinfo.lincost[gen]
            CostDA_Elec +=  cost*Pgen.x
#            print('P/Q for {0} is \t {1:0.1f}/{2:0.1f}'.format(var_name,cost,Pgen.x))
            
        for gen in mSEDA.edata.gfpp:
            HR=mSEDA.edata.generatorinfo.HR[gen]
            var_name='Pgen({0},{1})'.format(gen,t)
            Pgen = mSEDA.model.getVarByName(var_name)
            gasnode=mSEDA.edata.generatorinfo.origin_gas[gen]
            var=mSEDA.model.getVarByName(var_name)
            
            con_name ='gas_balance_da({0},{1},{2})'.format(gasnode,'k0',t)
            
            price=mGDA.model.getConstrByName(con_name)
            
#            print('P/Q for {0} is \t {1:0.2f}/{2:0.1f}'.format(var_name,price.Pi,var.x))
            CostDA_Elec = CostDA_Elec + HR*price.Pi*var.x
            GasPayment  = GasPayment +HR*price.Pi*var.x
            
            for sc in mSEDA.edata.swingcontracts:
                var_name = 'PgenSC({0},{2},{1})'.format(gen,t,sc)
                
                contract=mSEDA.edata.SCdata.lambdaC[(sc,gen)]
                
                var=mSEDA.model.getVarByName(var_name)
#                print('P/Q for {0} is \t {1:0.1f}/{2:0.1f}'.format(var_name,contract,var.x))
                CostDA_Elec = CostDA_Elec + HR*contract*var.x
                GasPayment  = GasPayment + HR*contract*var.x
        
    
    CostRT_Elec = 0.0
    for t in  mSEDA.edata.time:
        for s in  mSEDA.edata.scenarios:
            Prob= mSEDA.edata.scen_wgp[s][2]
            for gen in  mSEDA.edata.gfpp:
                HR= mSEDA.edata.generatorinfo.HR[gen]  
                
                var_name_up = 'RUp({0},{1},{2})'.format(gen,s,t)
                var_name_dn = 'RDn({0},{1},{2})'.format(gen,s,t)
                
                var_up= mSEDA.model.getVarByName(var_name_up)
                var_dn= mSEDA.model.getVarByName(var_name_dn)
                
                s_gas=mSEDA.edata.scen_wgp[s][1]
                gas_node=mSEDA.edata.generatorinfo.origin_gas[gen]
                gas_prob=mSEDA.edata.windscenprob[s_gas]
                con_name ='gas_balance_rt({0},{1},{2})'.format(gas_node ,s_gas,t)
                price= mGRT.model.getConstrByName(con_name)
#                print(8*price.x*(var_up-var_dn))
                P_UP=defaults.RESERVES_UP_PREMIUM_GAS
                P_DN=defaults.RESERVES_DN_PREMIUM_GAS
                
#                print('P/Q for {0} is \t {1:0.1f}/{2:0.1f}'.format(var_name_up,(price.Pi/gas_prob),(P_UP*var_up.x-P_DN*var_dn.x)))
                CostRT_Elec = CostRT_Elec + HR*Prob*(price.Pi/gas_prob)*(P_UP*var_up.x-P_DN*var_dn.x)
                GasPayment  = GasPayment + HR*Prob*(price.Pi/gas_prob)*(P_UP*var_up.x-P_DN*var_dn.x)
                # Contract
                for sc in mSEDA.edata.swingcontracts:
                    var_name_up = 'RUpSC({0},{1},{3},{2})'.format(gen,s,t,sc)
                    var_name_dn = 'RDnSC({0},{1},{3},{2})'.format(gen,s,t,sc)
                    
                    var_up= mSEDA.model.getVarByName(var_name_up)
                    var_dn= mSEDA.model.getVarByName(var_name_dn)
                    contract=mSEDA.edata.SCdata.lambdaC[(sc,gen)]
                    
    #                print(Prob*8*contract.x*(var_up-var_dn))
                    P_UP=defaults.RESERVES_UP_PREMIUM_GAS_SC
                    P_DN=defaults.RESERVES_DN_PREMIUM_GAS_SC
                    
#                    print('P/Q for {0} is \t {1:0.1f}/{2:0.1f}'.format(var_name_up,contract,(P_UP*var_up.x-P_DN*var_dn.x)))
                    CostRT_Elec = CostRT_Elec + Prob*HR*contract*(P_UP*var_up.x-P_DN*var_dn.x)
                    GasPayment  = GasPayment + Prob*HR*contract*(P_UP*var_up.x-P_DN*var_dn.x)
                    
            for gen in  mSEDA.edata.nongfpp:
                var_name_up = 'RUp({0},{1},{2})'.format(gen,s,t)
                var_name_dn = 'RDn({0},{1},{2})'.format(gen,s,t)
                
                var_up= mSEDA.model.getVarByName(var_name_up)
                var_dn= mSEDA.model.getVarByName(var_name_dn)
#                print(Prob* mSEDA.edata.generatorinfo.lincost[gen]*(var_up-var_dn))
                P_UP=defaults.RESERVES_UP_PREMIUM_NONGAS
                P_DN=defaults.RESERVES_DN_PREMIUM_NONGAS
                cost= mSEDA.edata.generatorinfo.lincost[gen]
                CostRT_Elec +=  Prob*cost*(P_UP*var_up.x-P_DN*var_dn.x)

    Result.ElecCost= CostDA_Elec+ CostRT_Elec        
    Result.GasCost = mGDA.model.ObjVal+mGRT.model.ObjVal
    Result.GasProfit = GasPayment-Result.GasCost
    Result.GasPayment=GasPayment
    
    return Result    

def SetContracts(Type='normal'):
    # Type can be 'normal' or 'zero'
    # Copy New Contracts to actual contracts for sequential market clearings
    
    New_contracts=pd.read_csv(defaults.SCdata_NoPrice_OUT,index_col='SC_ID')
    
    # Remove not working contracts

    New_contracts = New_contracts[np.isfinite(New_contracts['lambdaC'])]
    
    Max_Profit=New_contracts.GasProfit.max()
    
#    New_contracts = New_contracts[abs(New_contracts.GasProfit-Max_Profit) <1e-3]
    
    New_contracts = New_contracts[New_contracts.GasProfit >0]
    
    # Remove extra info
    New_contracts=New_contracts.drop(['MIPGap','GasProfit','mSEDACost','time'],axis=1)
    
    
    if Type=='zero':
        New_contracts['lambdaC']=1e3
        New_contracts['PcMin']=0
        New_contracts['PcMax']=0
        
    New_contracts.to_csv(defaults.SCdata)  

def BuildBilevel(Timesteps=[]):
    
    
    
    mEDA = modelObjects.ElecDA(bilevel=True,Timesteps=Timesteps)
    dispatchElecDA=mEDA.optimize()
    
    mSEDA = modelObjects.StochElecDA(bilevel=True,Timesteps=Timesteps)
    dispatchElecDA=mSEDA.optimize()
    
    f2d = False
    
    mGDA = modelObjects.GasDA(dispatchElecDA,f2d,Timesteps=Timesteps)
    dispatchGasDA=mGDA.optimize()
    
    mERT = modelObjects.ElecRT(dispatchElecDA,bilevel=True,Timesteps=Timesteps)
    dispatchElecRT=mERT.optimize()
       
    mGRT = modelObjects.GasRT(dispatchGasDA,dispatchElecRT,f2d,Timesteps=Timesteps)
    mGRT.optimize()
    
    
    mEDA_COMP = modelObjects.ElecDA(comp=True,bilevel=True,Timesteps=Timesteps)
    mSEDA_COMP = modelObjects.StochElecDA(comp=True,bilevel=True,Timesteps=Timesteps)
    mGDA_COMP = modelObjects.GasDA(dispatchElecDA,f2d,comp=True,Timesteps=Timesteps)
    mERT_COMP = modelObjects.ElecRT(dispatchElecDA,comp=True,bilevel=True,Timesteps=Timesteps)
    mGRT_COMP = modelObjects.GasRT(dispatchGasDA,dispatchElecRT,f2d,comp=True,Timesteps=Timesteps)
    
 
    
    mEDA_COMP.optimize()
    mSEDA_COMP.optimize()
    mGDA_COMP.optimize()
    mERT_COMP.optimize()
    mGRT_COMP.optimize() 

           
    f2d=False         
    mSEDACost_NoContract=1e6
    BLmodel= modelObjects.Bilevel_Model(f2d,mSEDACost_NoContract,Timesteps=Timesteps)
    
    DA_RT_Model(BLmodel,mSEDA_COMP,mGDA_COMP,mGRT_COMP)
#    DA_Model(BLmodel,mEDA_COMP,mGDA_COMP)
    return BLmodel
