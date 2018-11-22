# -*- coding: utf-8 -*-
"""
Created on Thu Dec  7 17:13:27 2017

@author: delikars
"""

from collections import defaultdict
import numpy as np
import itertools
import gurobipy as gb
import defaults

class expando(object):
    pass





def OuterApprox_Discretization(self):
        # Pressure discretization at every gas node
    gnodes = self.gdata.gnodes
    gndata = self.gdata.gnodedf
    prd = defaultdict(list)
    for gn in gnodes:            
        prd[gn] = np.linspace(gndata['PresMin'][gn], gndata['PresMax'][gn], self.gdata.Nfxpp).tolist()

    self.gdata.prd = prd
    
    # Create Parameter for Positive and negative part of outer approximation equation
    Kpos = defaultdict(lambda: defaultdict(list) )    
    
    for pl in self.gdata.pplinepassive:
        ns, nr = pl # Pipeline between nodes ns and nr
                   
        for vs, vr in list(itertools.product(range(self.gdata.Nfxpp), repeat = 2)):                                  
            if prd[ns][vs] > prd[nr][vr]:
                pres_s = prd[ns][vs]
                pres_r = prd[nr][vr]
                K =     self.gdata.pplineK[pl]             
                Kpos[pl][vs, vr] = K/np.sqrt(np.square(pres_s) - np.square(pres_r))
#            elif prd[ns][vs] == prd[nr][vr]:
#                pres_s = prd[ns][vs]+1e-3
#                pres_r = prd[nr][vr]
#                K =     self.gdata.pplineK[pl]             
#                Kpos[pl][vs, vr] =1#3 K/np.sqrt(np.square(pres_s) - np.square(pres_r))
            
    self.gdata.Kpos = Kpos
   
    # if bi-directional flow model flow limits from Receiving to Sending end
    if self.gdata.flow2dir == True: 
        
        Kneg = defaultdict(lambda: defaultdict(list) )      
    
        for pl in self.gdata.pplinepassive:
            ns, nr = pl
                       
            for vs, vr in list(itertools.product(range(self.gdata.Nfxpp), repeat = 2)):                                  
                if prd[ns][vs] < prd[nr][vr]:
                   Kneg[pl][vs, vr] = self.gdata.pplineK[pl]/np.sqrt(np.square(prd[nr][vr]) - np.square(prd[ns][vs])) 
    
        self.gdata.Kneg = Kneg


def add_constraint(self,lhs,sign_str,rhs,name):
    
    ALL_ON_LHS=False
    ALL_ON_RHS=False
    # Only one will be executed

    if sign_str=='>=':
        self.constraints[name]= expando()
        cc=self.constraints[name]
        cc.lhs=lhs
        cc.rhs=rhs
        if ALL_ON_LHS:                    
            cc.expr=self.model.addConstr( -cc.lhs+cc.rhs<=0.0,name=name)
        elif ALL_ON_RHS:                    
            cc.expr=self.model.addConstr(0.0<=cc.lhs-cc.rhs,name=name)
        else:
            cc.expr=self.model.addConstr(cc.lhs>=cc.rhs,name=name)
            
    elif sign_str=='<=':
        self.constraints[name]= expando()
        cc=self.constraints[name]
        cc.lhs=lhs
        cc.rhs=rhs                    

        if ALL_ON_LHS:
            cc.expr=self.model.addConstr(-cc.rhs+cc.lhs<=0.0,name=name)
        elif ALL_ON_RHS:
            cc.expr=self.model.addConstr(0.0<=cc.rhs-cc.lhs,name=name)
        else:
            cc.expr=self.model.addConstr(cc.lhs<=cc.rhs,name=name)
            
    elif sign_str=='==':
        
        if defaults.REMOVE_EQUALITY:
            # gEQ
            self.constraints[name+'_geq']= expando()
            cc=self.constraints[name+'_geq']
            cc.lhs=lhs
            cc.rhs=rhs 
            if ALL_ON_LHS:
                cc.expr=self.model.addConstr(-cc.lhs+cc.rhs<=0.0,name=name+'_geq')
            elif ALL_ON_RHS:                    
                cc.expr=self.model.addConstr(0.0<=cc.lhs-cc.rhs,name=name+'_geq')
            else:
                cc.expr=self.model.addConstr(cc.lhs>=cc.rhs,name=name+'_geq')
            
            self.constraints[name+'_leq']= expando()
            cc=self.constraints[name+'_leq']
            cc.lhs=lhs
            cc.rhs=rhs
            if ALL_ON_LHS:
                cc.expr=self.model.addConstr(-cc.rhs+cc.lhs<=0.0,name=name+'_leq')
            elif ALL_ON_RHS:                    
                cc.expr=self.model.addConstr(0.0<=cc.rhs-cc.lhs,name=name+'_leq')
            else:
                cc.expr=self.model.addConstr(cc.lhs<=cc.rhs,name=name+'_leq')
        else:
            self.constraints[name]= expando()
            cc=self.constraints[name]
            cc.lhs=lhs
            cc.rhs=rhs                    
            if ALL_ON_LHS:
                cc.expr=self.model.addConstr(cc.lhs-cc.rhs==0.0,name=name)
            elif ALL_ON_RHS:                    
                cc.expr=self.model.addConstr(0.0==cc.lhs-cc.rhs,name=name)
            else:
                cc.expr=self.model.addConstr(cc.lhs==cc.rhs,name=name)


        
    


#==============================================================================
# Gas system constraints 
# NB! Gas storage constraints included as limits in variable definitions
#==============================================================================

#==============================================================================
# Day-ahead market
#==============================================================================

def _build_constraints_gasDA_WeymouthApprox(self):
    #--- Get Parameters

        
    m = self.model
    
    var = self.variables
    gnodes = self.gdata.gnodes
    pplines = self.gdata.pplineorder
    time = self.gdata.time
    gndata = self.gdata.gnodedf
    gstorage = self.gdata.gstorage     
    gwells = self.gdata.wellsinfo.index.tolist()
    bigM = self.gdata.bigM 
    
    sclim = self.gdata.sclim # Swing contract limits
    



        
    for gn in gnodes:
        for t in time:
            for k in sclim:
                name='gshed_da_max({0},{1},{2})'.format(gn,k,t)
                lhs = var.gas_shed[gn,k,t]
                rhs = self.gdata.gasload[gn][t]
                add_constraint(self,lhs,'<=',rhs,name)  


    
    if self.gdata.GasSlack=='FixInput':
        gn=self.gdata.gnodeorder[0]
        for t in time:
            for k in sclim:
                name="PresSlackMax({0},{1},{2})".format(gn,k,t)
                lhs=var.pr[gn,k,t]
                rhs=self.gdata.gnodedf['PresMax'][gn]                
                add_constraint(self,lhs,'==',rhs,name)
                
                     
    elif self.gdata.GasSlack=='FixOutput':
        gn=self.gdata.gnodeorder[-1] # Do it for last node
        for t in time:
            for k in sclim:
                name="PresSlackMin({0},{1},{2})".format(gn,k,t)
                self.constraints[name]= expando()
                cc=self.constraints[name]
                cc.lhs=var.pr[gn,k,t]
                cc.rhs=self.gdata.gnodedf['PresMax'][gn]
                cc.expr = m.addConstr(cc.lhs==cc.rhs,name=name)
                
        
    elif self.gdata.GasSlack == 'ConstantOutput':
        gn=self.gdata.gnodeorder[0]
        for tpr, t in zip(time, time[1:]):
            name="Constant_Slack({},{},{})".format(gn,t,tpr)
            self.constraints[name]= expando()
            cc=self.constraints[name]
            cc.lhs= var.pr[gn,'k0',t]-var.pr[gn,'k0',tpr]
            cc.rhs=np.float64(0.0)
            cc.expr=m.addConstr(cc.lhs==cc.rhs,name=name)
    
    #--- Define Pressure Limits 

    # Gas pressure limits

    
    for gn in gnodes:
        for t in time: 
            for k in sclim:
                name="PresMax({0},{1},{2})".format(gn,k,t)
                self.constraints[name]= expando()
                cc=self.constraints[name]
                cc.lhs=var.pr[gn,k,t]
                cc.rhs=self.gdata.gnodedf['PresMax'][gn]
                cc.expr=m.addConstr(cc.lhs<=cc.rhs,name=name)
                
                name="PresMin({0},{1},{2})".format(gn,k,t)
                self.constraints[name]= expando()
                cc=self.constraints[name]
                cc.lhs=var.pr[gn,k,t]
                cc.rhs=self.gdata.gnodedf['PresMin'][gn]
                cc.expr=m.addConstr(cc.lhs>=cc.rhs,name=name)
                
                                   
          
    # --- Outer Approximation of Weymouth
    # Create Points for Outer Approximation
    OuterApprox_Discretization(self)
    
    # Gas flow outer approximation
    

    if self.gdata.flow2dir == True:
        u = var.u       # if bi-directional flow u={0,1} 
    elif self.gdata.flow2dir == False:
        u = dict.fromkeys(self.variables.gflow_sr, 1.0) # if bi-directional flow u={1} i.e. from send to receive 
    
    Kpos=self.gdata.Kpos
    prd=self.gdata.prd
    for pl in self.gdata.pplineorder:
        ns, nr = pl
        for t in time:                
            for k in sclim:
                name = "gflow_sr_log({0},{1},{2})".format(pl,k,t).replace(" ","")
                self.constraints[name]= expando()
                cc=self.constraints[name]
                cc.lhs=var.gflow_sr[pl,k,t]-u[pl,k,t]*bigM
                cc.rhs=np.float64(0.0)
                cc.expr=m.addConstr(cc.lhs<=cc.rhs,name=name)
                
                for vs, vr in Kpos[pl].keys():
                    name = "gflow_sr_lim({0},{1},{2},{3},{4})".format(pl,k,t,vs,vr).replace(" ","")
                    self.constraints[name]= expando()
                    cc=self.constraints[name]
                    cc.lhs=var.gflow_sr[pl,k,t]
                    cc.rhs=Kpos[pl][vs,vr] * prd[ns][vs] * var.pr[ns,k,t] - \
                            Kpos[pl][vs,vr] * prd[nr][vr] * var.pr[nr,k,t] \
                            +  bigM * (1.0 - u[pl,k,t])
                    cc.expr=m.addConstr(cc.lhs<=cc.rhs,name=name)
                    

    # if bi-directional flow model flow limits from Receiving to Sending end
    # if bi-directional flow add constraints from Receiving to Sending end    
    if self.gdata.flow2dir == True:

        Kneg=self.gdata.Kneg
        prd=self.gdata.prd
        for pl in self.gdata.pplineorder:
            ns, nr = pl
            for t in time:                                    
                for k in sclim:
                   
                    name = "gflow_rs_log({0},{1},{2})".format(pl,k,t).replace(" ","")
                    self.constraints[name]= expando()
                    cc=self.constraints[name]
                    cc.lhs=var.gflow_rs[pl,k,t]
                    cc.rhs=(1.0-u[pl,k,t])*bigM
                    cc.expr=m.addConstr(cc.lhs<=cc.rhs,name=name)
         
                    for vs, vr in self.gdata.Kneg[pl].keys():
                        name = "gflow_rs_lim({0},{1},{2},{3},{4})".format(pl,k,t,vs,vr).replace(" ","")
                        self.constraints[name]= expando()
                        cc=self.constraints[name]
                        cc.lhs=var.gflow_rs[pl,k,t]
                        cc.rhs= Kneg[pl][vs,vr] * prd[nr][vr] * var.pr[nr,k,t] - \
                            Kneg[pl][vs,vr] * prd[ns][vs] * var.pr[ns,k,t] +\
                            bigM * u[pl,k,t]
                        cc.expr=m.addConstr(cc.lhs<=cc.rhs,name=name)
                        

                

    #--- Gas well maximum production
    for gw in gwells:
        for k in sclim:
            for t in time:
                name="gprod_max({0},{1},{2})".format(gw,k,t)
                self.constraints[name]= expando()
                cc=self.constraints[name]
                cc.lhs=var.gprod[gw,k,t]
                cc.rhs=self.gdata.wellsinfo['MaxProd'][gw]
                cc.expr=m.addConstr(cc.lhs<=cc.rhs,name=name)
                
                
    #--- Compressors
    # Compressors - Limit the outlet pressure of compressor to be less than 
    #               full compression (max)  and above the inlet pressure (min)    
    # Compressors

    #new comment
    for pl in self.gdata.pplineactive:
        ns, nr = pl
        for t in time:
            for k in sclim:
                name = 'compr_max({0},{1},{2})'.format(pl,k,t).replace(" ","")
                self.constraints[name]= expando()
                cc=self.constraints[name]
                cc.lhs=var.pr[nr,k,t]
                cc.rhs=self.gdata.pplinecr[pl] * var.pr[ns,k,t]
                cc.expr=m.addConstr(cc.lhs<=cc.rhs,name=name)
     
                name = 'compr_min({0},{1},{2})'.format(pl,k,t).replace(" ","")
                self.constraints[name]= expando()
                cc=self.constraints[name]
                cc.lhs=var.pr[ns,k,t]
                cc.rhs=var.pr[nr,k,t]
                cc.expr=m.addConstr(cc.lhs<=cc.rhs,name=name)
                
    

    #--- Line Pack Def  
    # Line-pack constraints

    for pl in pplines:
        ns, nr = pl
        
        for t in time: 
            for k in sclim: 
                
                name='gflow_sr_io({0},{1},{2})'.format(pl,k,t).replace(" ","")
                lhs= var.gflow_sr[pl,k,t]
                rhs=(var.qin_sr[pl,k,t] + var.qout_sr[pl,k,t]) * 0.5
                add_constraint(self,-lhs,'==',-rhs,name=name)
                   
            # Separate for debugging purposes
    for pl in pplines:
        ns, nr = pl
        for k in sclim: 
            for t in time:
                name= 'lpack_def({0},{1},{2})'.format(pl,k,t).replace(" ","")
                lhs= var.lpack[pl,k,t]
                rhs= self.gdata.pplinels[pl]*0.5*(var.pr[ns,k,t]+var.pr[nr,k,t])
                add_constraint(self,-lhs,'==',-rhs,name=name)
                     
        


    '''
    NB! gflow_rs_io = {} # Gas flow (R to S) only if bi-directional flow. 
    This needs to be included in the line-pack definition constraint
    '''
        
    if self.gdata.flow2dir == True:
         # Gas flow (R to S) 'decomposition' to IN/OUT
        
        for pl in pplines:
            ns, nr = pl
            
            for t in time:  
                for k in sclim:
                    name='gflow_rs_io({0},{1},{2})'.format(pl,k,t).replace(" ","")
                    self.constraints[name]= expando()
                    cc=self.constraints[name]
                    cc.lhs=var.gflow_rs[pl,k,t]
                    cc.rhs=(var.qin_rs[pl,k,t] + var.qout_rs[pl,k,t]) * 0.5
                    cc.expr=m.addConstr(cc.lhs==cc.rhs,name=name)
                            
                            
            for tpr, t in zip(time, time[1:]):     
                k = 'k0' # Line-pack storage defined for 'central case' k0
                
                name='line_store({0},{1},{2})'.format(pl,k,t).replace(" ","")

                lhs= var.lpack[pl,k,t]
                rhs=var.lpack[pl,k,tpr] + var.qin_sr[pl,k,t] - var.qout_sr[pl,k,t] \
                                            + var.qin_rs[pl,k,t] - var.qout_rs[pl,k,t] 
                add_constraint(self,-lhs,'==',-rhs,name=name)
            
            
            t = time[0]
            k= 'k0' # Line-pack storage defined for 'central case' k0
            
            
            name='line_store({0},{1},{2})'.format(pl,k,t).replace(" ","")
            lhs= var.lpack[pl,k,t]
            rhs= self.gdata.pplinelsini[pl] + var.qin_sr[pl,k,t] - var.qout_sr[pl,k,t] \
                                                   + var.qin_rs[pl,k,t] - var.qout_rs[pl,k,t] 
            add_constraint(self,-lhs,'==',-rhs,name=name)
          
            
  
    elif self.gdata.flow2dir == False:
        
        kappa = 'k0' # Line-pack storage defined for 'central case' k0
            
        for pl in pplines:
            ns, nr = pl
            for k in sclim: # For every Scenario
                
                # For all time steps (except for t=0) 
                
                for tpr, t in zip(time, time[1:]):
                    
                    name='line_store({0},{1},{2})'.format(pl,k,t).replace(" ","")
                    lhs=var.lpack[pl,k,t]
                    rhs=var.lpack[pl,kappa,tpr] + var.qin_sr[pl,k,t] - var.qout_sr[pl,k,t]
                    add_constraint(self,-lhs,'==',-rhs,name=name)
                    
                
                # Time =0   Either Steady State or Transient 
                t = time[0]
                # If pipelines have linepack storage then add initial value
                if self.gdata.pplinels[pl] >0 :
                    
                    name='line_store({0},{1},{2})'.format(pl,k,t).replace(" ","")
                    lhs= var.lpack[pl,k,t]
                    rhs= self.gdata.pplinelsini[pl] + var.qin_sr[pl,k,t] - var.qout_sr[pl,k,t]
                    add_constraint(self,-lhs,'==',-rhs,name=name)

                
                # Otherwise system is in steady state and there is no initial linepack
                else:
                    
                    name='line_store({0},{1},{2})'.format(pl,k,t).replace(" ","")
                    lhs= var.lpack[pl,k,t]
                    rhs= var.qin_sr[pl,k,t] - var.qout_sr[pl,k,t]
                    add_constraint(self,-lhs,'==',-rhs,name=name)
                    
                    
               
        
    #--- Linepack End of Day
    # At end of optimization the total linepack should be within Line-pack end of optimization (only for case k0) 
    # Only need this constraint if linepack parameters are defined
    
    
    if sum(self.gdata.pplinels.values()) >0:
       
        k = 'k0'

        
        name='lpack_end'
        self.constraints[name]= expando()
        cc=self.constraints[name]                
        cc.lhs=gb.quicksum(var.lpack[pl, k, time[-1]] for pl in pplines)
        cc.rhs=gb.quicksum(self.gdata.pplinelsini[pl] for pl in pplines)
        cc.expr=m.addConstr(cc.lhs>=cc.rhs,name=name)
        
       
      
#    #--- Gas Storage
#    
#    
#    for gs in self.gdata.gstorage:
#        for t in time:
#            for k in sclim:
#                
#                name='gsinMax({0},{1},{2})'.format(gs,t,k)
#                lhs=var.gsin[gs,k,t]
#                rhs=self.gdata.gstorageinfo['MaxInFlow'][gs]
#                add_constraint(self,lhs,'<=',rhs,name)
#                
#                name='gsoutMax({0},{1},{2})'.format(gs,t,k)
#                lhs=var.gsout[gs,k,t]
#                rhs=self.gdata.gstorageinfo['MaxOutFlow'][gs]
#                add_constraint(self,lhs,'<=',rhs,name)
#                
#                
#                name='gstore_max({0},{1},{2})'.format(gs,t,k)
#                lhs=var.gstore[gs,k,t]
#                rhs=self.gdata.gstorageinfo['MaxStore'][gs]
#                add_constraint(self,lhs,'<=',rhs,name)
#                
#                name='gstore_min({0},{1},{2})'.format(gs,t,k)
#                lhs=var.gstore[gs,k,t]
#                rhs=self.gdata.gstorageinfo['MinStore'][gs]
#                add_constraint(self,lhs,'>=',rhs,name)
#                
#    
#
#    for gs in gstorage:
#        for k in sclim:
#            for tpr, t in zip(time, time[1:]):
#                name='gstor_def({0},{1},{2})'.format(gs,k,t)
#                self.constraints[name]= expando()
#                cc=self.constraints[name]                
#                cc.lhs=var.gstore[gs,k,t]
#                cc.rhs=var.gstore[gs,k,tpr]+var.gsin[gs,k,t]-var.gsout[gs,k,t]
#                cc.expr=m.addConstr(cc.lhs==cc.rhs,name=name)
#                
#                
#            t = time[0]
#            
#            
#            name='gstor_def({0},{1},{2})'.format(gs,k,t)
#            self.constraints[name]= expando()
#            cc=self.constraints[name]                
#            cc.lhs=var.gstore[gs,k,t]
#            cc.rhs=self.gdata.gstorageinfo['IniStore'][gs]+var.gsin[gs,k,t]-var.gsout[gs,k,t]
#            cc.expr=m.addConstr(cc.lhs==cc.rhs,name=name)
#            
#        k = 'k0' # Gas storage content defined for 'central case' k0        
#        
#        name='gs_end({0},{1})'.format(gs,k)
#        self.constraints[name]= expando()
#        cc=self.constraints[name]                
#        cc.lhs=var.gstore[gs, k, time[-1]]
#        cc.rhs=self.gdata.gstorageinfo['IniStore'][gs]
#        cc.expr=m.addConstr(cc.lhs>=cc.rhs,name=name)
#            
    

    #--- Nodal Gas Balance 

    
    ###########################################################################    
    # Swing constracts can be defined per Gas Node - Here defined per GFPP
    # ... we need the GFPP node mapping and efficiencies 
    ###########################################################################    
    
    
    Pgen = self.gdata.Pgen 
    PgenSC = self.gdata.PgenSC 
    RSC = self.gdata.RSC 
    HR =  self.gdata.generatorinfo.HR
        
    # if bi-directional flow add in gas balance flow from Receiving to Sending end    
    if self.gdata.flow2dir == True:
        
        for k in sclim:
            for gn in gnodes:
                for t in time:
                    name='gas_balance_da({0},{1},{2})'.format(gn,k,t)              
                    lhs=gb.quicksum(var.gprod[gw,k,t] for gw in self.gdata.Map_Gn2Gp[gn]) +\
                            gb.quicksum(var.qout_sr[pl,k,t] - var.qin_rs[pl,k,t] for pl in self.gdata.nodetoinpplines[gn]) +\
                            gb.quicksum(var.qout_rs[pl,k,t] - var.qin_sr[pl,k,t] for pl in self.gdata.nodetooutpplines[gn])+\
                            gb.quicksum(var.gsout[gs,k,t] - var.gsin[gs,k,t] for gs in self.gdata.Map_Gn2Gs[gn]) +var.gas_shed[gn,k,t]
                            
                    rhs=self.gdata.gasload[gn][t]+  gb.quicksum((Pgen[gen][t]+ \
                                         PgenSC[gen][t]+RSC[gen,k,t])*self.gdata.generatorinfo.HR[gen] for gen in self.gdata.gfpp if gen in self.gdata.Map_Gn2Eg[gn] )
                    add_constraint(self,lhs,'==',rhs,name=name)
                    
   
     
        
        
    elif self.gdata.flow2dir == False:
        
        for t in time:
            for gn in gnodes:
                for k in sclim:
                    name='gas_balance_da({0},{1},{2})'.format(gn,k,t)               
                    lhs=   gb.quicksum(var.gprod[gw,k,t] for gw in self.gdata.Map_Gn2Gp[gn]) \
                            + gb.quicksum(var.qout_sr[pl,k,t] for pl in self.gdata.nodetoinpplines[gn])\
                            - gb.quicksum(var.qin_sr[pl,k,t] for pl in self.gdata.nodetooutpplines[gn]) \
                            + gb.quicksum(var.gsout[gs,k,t] - var.gsin[gs,k,t] for gs in self.gdata.Map_Gn2Gs[gn])\
                            + var.gas_shed[gn,k,t]
                    rhs= self.gdata.gasload[gn][t] + gb.quicksum((Pgen[gen][t]+ \
                                         PgenSC[gen][t]+RSC[gen,k,t])*HR[gen] for gen in self.gdata.gfpp if gen in self.gdata.Map_Gn2Eg[gn] )
                    add_constraint(self,lhs,'==',rhs,name=name)      

    m.update()
    
def _build_constraints_gasDA_FlowBased(self):
    #--- Get Parameters

        
    m = self.model
    
    var = self.variables
    gnodes = self.gdata.gnodes
    pplines = self.gdata.pplineorder
    time = self.gdata.time
    gndata = self.gdata.gnodedf
    gstorage = self.gdata.gstorage     
    gwells = self.gdata.wellsinfo.index.tolist()
    bigM = self.gdata.bigM 
    
    sclim = self.gdata.sclim # Swing contract limits

    for gn in gnodes:
        for t in time:
            for k in sclim:
                name='gshed_da_max({0},{1},{2})'.format(gn,k,t)
                lhs = var.gas_shed[gn,k,t]
                rhs = self.gdata.gasload[gn][t]
                add_constraint(self,lhs,'<=',rhs,name) 
    #--- Nodal Gas Balance 

    
    ###########################################################################    
    # Swing constracts can be defined per Gas Node - Here defined per GFPP
    # ... we need the GFPP node mapping and efficiencies 
    ###########################################################################    
    
    
    Pgen = self.gdata.Pgen 
    PgenSC = self.gdata.PgenSC 
    RSC = self.gdata.RSC 
    HR =  self.gdata.generatorinfo.HR
        
    # if bi-directional flow add in gas balance flow from Receiving to Sending end    
    if self.gdata.flow2dir == True:
        
        for k in sclim:
            for gn in gnodes:
                for t in time:
                    name='gas_balance_da({0},{1},{2})'.format(gn,k,t)              
                    lhs=gb.quicksum(var.gprod[gw,k,t] for gw in self.gdata.Map_Gn2Gp[gn]) +\
                            gb.quicksum(var.qout_sr[pl,k,t] - var.qin_rs[pl,k,t] for pl in self.gdata.nodetoinpplines[gn]) +\
                            gb.quicksum(var.qout_rs[pl,k,t] - var.qin_sr[pl,k,t] for pl in self.gdata.nodetooutpplines[gn])+\
                            gb.quicksum(var.gsout[gs,k,t] - var.gsin[gs,k,t] for gs in self.gdata.Map_Gn2Gs[gn])\
                            +var.gas_shed[gn,k,t]
                    rhs=self.gdata.gasload[gn][t]+  gb.quicksum((Pgen[gen][t]+ \
                                         PgenSC[gen][t]+RSC[gen,k,t])*self.gdata.generatorinfo.HR[gen] for gen in self.gdata.gfpp if gen in self.gdata.Map_Gn2Eg[gn] )
                    add_constraint(self,lhs,'==',rhs,name=name)
                    
   
     
        
        
    elif self.gdata.flow2dir == False:
        
        for t in time:
            for gn in gnodes:
                for k in sclim:
                    name='gas_balance_da({0},{1},{2})'.format(gn,k,t)               
                    lhs=   gb.quicksum(var.gprod[gw,k,t] for gw in self.gdata.Map_Gn2Gp[gn]) \
                            + gb.quicksum(var.qout_sr[pl,k,t] for pl in self.gdata.nodetoinpplines[gn])\
                            - gb.quicksum(var.qin_sr[pl,k,t] for pl in self.gdata.nodetooutpplines[gn]) \
                            +var.gas_shed[gn,k,t]
                          
                    rhs= self.gdata.gasload[gn][t] + gb.quicksum((Pgen[gen][t]+ \
                                         PgenSC[gen][t]+RSC[gen,k,t])*HR[gen] for gen in self.gdata.gfpp if gen in self.gdata.Map_Gn2Eg[gn] )
                    add_constraint(self,lhs,'==',rhs,name=name)  
#                    name='gas_balance_da({0},{1},{2})'.format(gn,k,t)               
#                    lhs=   gb.quicksum(var.gprod[gw,k,t] for gw in self.gdata.Map_Gn2Gp[gn]) \
#                            + gb.quicksum(var.qout_sr[pl,k,t] for pl in self.gdata.nodetoinpplines[gn])\
#                            - gb.quicksum(var.qin_sr[pl,k,t] for pl in self.gdata.nodetooutpplines[gn]) \
#                            + gb.quicksum(var.gsout[gs,k,t] - var.gsin[gs,k,t] for gs in self.gdata.Map_Gn2Gs[gn])
#                    rhs= self.gdata.gasload[gn][t] + gb.quicksum((Pgen[gen][t]+ \
#                                         PgenSC[gen][t]+RSC[gen,k,t])*HR[gen] for gen in self.gdata.gfpp if gen in self.gdata.Map_Gn2Eg[gn] )
#                    add_constraint(self,lhs,'==',rhs,name=name)    
                    
    #--- Gas well maximum production
    for gw in gwells:
        for k in sclim:
            for t in time:
                name="gprod_max({0},{1},{2})".format(gw,k,t)
                self.constraints[name]= expando()
                cc=self.constraints[name]
                cc.lhs=var.gprod[gw,k,t]
                cc.rhs=self.gdata.wellsinfo['MaxProd'][gw]
                cc.expr=m.addConstr(cc.lhs<=cc.rhs,name=name)
                
                
                
    #--- Flows
    
    for pl in pplines:
        ns, nr = pl
        
        for t in time: 
            for k in sclim: 
                
                name='gflow_sr_io({0},{1},{2})'.format(pl,k,t).replace(" ","")
                lhs= var.gflow_sr[pl,k,t]
                rhs=(var.qin_sr[pl,k,t] + var.qout_sr[pl,k,t]) * 0.5
                add_constraint(self,lhs,'==',rhs,name=name)
                
                name='gflow_sr_limit({0},{1},{2})'.format(pl,k,t).replace(" ","")
                lhs=var.gflow_sr[pl,k,t]
                rhs=self.gdata.pplinelimit[pl]
                add_constraint(self,lhs,'<=',rhs,name)  
                
                name='Flow_Bal({0},{1},{2})'.format(pl,k,t).replace(" ","")
                lhs= 0.0
                rhs= var.qin_sr[pl,k,t] - var.qout_sr[pl,k,t]
                add_constraint(self,lhs,'==',rhs,name=name)
                
      
    #--- Gas Storage
    
    
#    for gs in self.gdata.gstorage:
#        for k in sclim:
#            for t in time:
#           
#                name='gsinMax({0},{1},{2})'.format(gs,t,k)
#                lhs=var.gsin[gs,k,t]
#                rhs=self.gdata.gstorageinfo['MaxInFlow'][gs]
#                add_constraint(self,lhs,'<=',rhs,name)
#                
#                name='gsoutMax({0},{1},{2})'.format(gs,t,k)
#                lhs=var.gsout[gs,k,t]
#                rhs=self.gdata.gstorageinfo['MaxOutFlow'][gs]
#                add_constraint(self,lhs,'<=',rhs,name)
#                
#                
#                name='gstore_max({0},{1},{2})'.format(gs,t,k)
#                lhs=var.gstore[gs,k,t]
#                rhs=self.gdata.gstorageinfo['MaxStore'][gs]
#                add_constraint(self,lhs,'<=',rhs,name)
#                
#                name='gstore_min({0},{1},{2})'.format(gs,t,k)
#                lhs=var.gstore[gs,k,t]
#                rhs=self.gdata.gstorageinfo['MinStore'][gs]
#                add_constraint(self,lhs,'>=',rhs,name)
#            
#            for tpr, t in zip(time, time[1:]):
#                name='gstor_def({0},{1},{2})'.format(gs,k,t)
#                self.constraints[name]= expando()
#                cc=self.constraints[name]                
#                cc.lhs=var.gstore[gs,k,t]
#                cc.rhs=var.gstore[gs,k,tpr]+var.gsin[gs,k,t]-var.gsout[gs,k,t]
#                cc.expr=m.addConstr(cc.lhs==cc.rhs,name=name)
#                
#            t = time[0]
#                        
#            name='gstor_def({0},{1},{2})'.format(gs,k,t)
#            self.constraints[name]= expando()
#            cc=self.constraints[name]                
#            cc.lhs=var.gstore[gs,k,t]
#            cc.rhs=self.gdata.gstorageinfo['IniStore'][gs]+var.gsin[gs,k,t]-var.gsout[gs,k,t]
#            cc.expr=m.addConstr(cc.lhs==cc.rhs,name=name)
#
#        
#        k = 'k0' # Gas storage content defined for 'central case' k0        
#        
#        name='gs_end({0},{1})'.format(gs,k)
#        self.constraints[name]= expando()
#        cc=self.constraints[name]                
#        cc.lhs=var.gstore[gs, k, time[-1]]
#        cc.rhs=self.gdata.gstorageinfo['IniStore'][gs]
#        cc.expr=m.addConstr(cc.lhs>=cc.rhs,name=name)

    m.update()
        
def _build_constraints_gasRT_WeymouthApprox(self,dispatchGasDA,dispatchElecRT):
    
    m = self.model
    
    var = self.variables
    gnodes = self.gdata.gnodes
    pplines = self.gdata.pplineorder
    time = self.gdata.time
    gndata = self.gdata.gnodedf
    gstorage = self.gdata.gstorage     
    gwells = self.gdata.wellsinfo.index.tolist()
    bigM = self.gdata.bigM 
    
    scenarios = self.gdata.scenarios
    
    gprod = dispatchGasDA.gprod
    qin_sr = dispatchGasDA.qin_sr
    qout_sr = dispatchGasDA.qout_sr
    
    
    
    
    if self.gdata.GasSlack=='FixInput':
        gn=self.gdata.gnodeorder[0]
        for t in time:
            for s in scenarios:
                name="PresSlackMax({0},{1},{2})".format(gn,s,t)
                lhs=var.pr_rt[gn,s,t]
                rhs=self.gdata.gnodedf['PresMax'][gn]
                add_constraint(self,lhs,'==',rhs,name)
                
                     
    elif self.gdata.GasSlack=='FixOutput':
        gn=self.gdata.gnodeorder[-1] # Do it for last node
        for t in time:
            for s in scenarios:
                name="PresSlackMin({0},{1},{2})".format(gn,s,t)
                lhs=var.pr_rt[gn,s,t]
                rhs=self.gdata.gnodedf['PresMax'][gn]
                add_constraint(self,lhs,'==',rhs,name)
                
        
    elif self.gdata.GasSlack == 'ConstantOutput':
        gn=self.gdata.gnodeorder[0]
        for tpr, t in zip(time, time[1:]):
            for s in scenarios:
                name="Constant_Slack({},{},{})".format(gn,t,tpr)
                lhs= var.pr_rt[gn,s,t]-var.pr_rt[gn,s,tpr]
                rhs=np.float64(0.0)
                add_constraint(self,lhs,'==',rhs,name)
    
    
    #--- Gas pressure limits

    
    for gn in gnodes:
        for t in time: 
            for s in scenarios:
                
                name="PresMax({0},{1},{2})".format(gn,s,t)               
                lhs=var.pr_rt[gn,s,t]
                rhs=self.gdata.gnodedf['PresMax'][gn]
                add_constraint(self,lhs,'<=',rhs,name)
                        
                
                name="PresMin({0},{1},{2})".format(gn,s,t)            
                lhs=var.pr_rt[gn,s,t]
                rhs=self.gdata.gnodedf['PresMin'][gn]
                add_constraint(self,lhs,'>=',rhs,name)

#    for t in time: 
#        for s in scenarios:
#            name='Send_geq_Receive_rt{0}{1}'.format(t,s)
#            lhs=var.pr_rt['ng101',s,t]
#            rhs=var.pr_rt['ng102',s,t]
#            add_constraint(self,lhs,'>=',rhs,name)
#            


    #--- Outer Approximation


    # Gas flow outer approximation
    
    OuterApprox_Discretization(self)
    
    

    if self.gdata.flow2dir == True:
        u = var.u       # if bi-directional flow u={0,1} 
    elif self.gdata.flow2dir == False:
        u = dict.fromkeys(self.variables.gflow_sr_rt, 1.0) # if bi-directional flow u={1} i.e. from send to receive 
    
    Kpos=self.gdata.Kpos
    prd=self.gdata.prd
    for pl in self.gdata.pplineorder:
        ns, nr = pl
        for t in time:                
            for s in scenarios:
#                name = "gflow_sr_rt_logical_BIG_M({0},{1},{2})".format(pl,s,t).replace(" ","")
#                lhs=var.gflow_sr_rt[pl,s,t]-u[pl,s,t]*bigM
#                rhs=np.float64(0.0)
#                add_constraint(self,lhs,'<=',rhs,name)
                
                for vs, vr in Kpos[pl].keys():
                    name = "gflow_sr_rt_lim_approx_weymouth({0},{1},{2},{3},{4})".format(pl,s,t,vs,vr).replace(" ","")

                    lhs=var.gflow_sr_rt[pl,s,t]
                    rhs=Kpos[pl][vs,vr] * prd[ns][vs] * var.pr_rt[ns,s,t] - \
                        Kpos[pl][vs,vr] * prd[nr][vr] * var.pr_rt[nr,s,t] 
                            #+  bigM * (1.0 - u[pl,s,t])
                    add_constraint(self,lhs,'<=',rhs,name)
                    

    # if bi-directional flow model flow limits from Receiving to Sending end
    # if bi-directional flow add constraints from Receiving to Sending end    
    if self.gdata.flow2dir == True:

        Kneg=self.gdata.Kneg
        prd=self.gdata.prd
        for pl in self.gdata.pplineorder:
            ns, nr = pl
            for t in time:                                    
                for s in scenarios:
                   
                    name = "gflow_rs_rt_logical_BIG_M({0},{1},{2})".format(pl,s,t).replace(" ","")
                    lhs=var.gflow_rs[pl,s,t]
                    rhs=(1.0-u[pl,s,t])*bigM
                    add_constraint(self,lhs,'<=',rhs,name)
         
                    for vs, vr in self.gdata.Kneg[pl].keys():
                        name = "gflow_rs_rt_lim_approx_weymouth({0},{1},{2},{3},{4})".format(pl,s,t,vs,vr).replace(" ","")
                        lhs=var.gflow_rs_rt[pl,s,t]
                        rhs= Kneg[pl][vs,vr] * prd[nr][vr] * var.pr_rt[nr,s,t] - \
                            Kneg[pl][vs,vr] * prd[ns][vs] * var.pr_rt[ns,s,t] +\
                            bigM * u[pl,s,t]
                        add_constraint(self,lhs,'<=',rhs,name)    
                                                                
        
 
    # Gas well maximum production

    for gw in gwells:
        for s in scenarios:
            for t in time:
                
                name="gprodUp_max({0},{1},{2})".format(gw,s,t)           
                lhs= var.gprodUp[gw,s,t]
                rhs=self.gdata.wellsinfo['MaxProd'][gw]-gprod[gw][t]['k0']
                add_constraint(self,lhs,'<=',rhs,name)
                    
                name="gprodDn_max({0},{1},{2})".format(gw,s,t)
                lhs= var.gprodDn[gw,s,t]
                rhs=gprod[gw][t]['k0']
                add_constraint(self,lhs,'<=',rhs,name)
    
    
    # Compressors - Limit the outlet pressure of compressor to be less than 
    #               full compression (max)  and above the inlet pressure (min) 
    
        # Compression rate definition - Active pipelines

    for pl in self.gdata.pplineactive:
        ns, nr = pl
        for t in time:
            for s in scenarios:
                
                name = 'compr_rt_max({0},{1},{2})'.format(pl,s,t).replace(" ","")             
                lhs= var.pr_rt[nr,s,t] -self.gdata.pplinecr[pl] * var.pr_rt[ns,s,t]
                rhs= np.float64(0.0)
                add_constraint(self,lhs,'<=',rhs,name)
                
                name = 'compr_rt_min({0},{1},{2})'.format(pl,s,t).replace(" ","")             
                lhs=var.pr_rt[ns,s,t] -var.pr_rt[nr,s,t]
                rhs= np.float64(0.0)
                add_constraint(self,lhs,'<=',rhs,name)
                       
    # Line-pack constraints

    for pl in pplines:
        ns, nr = pl
        for t in time: 
            for s in scenarios: 
                
                name='gflow_sr_io_rt({0},{1},{2})'.format(pl,s,t).replace(" ","")
                lhs=var.gflow_sr_rt[pl,s,t]-(var.qin_sr_rt[pl,s,t] + var.qout_sr_rt[pl,s,t]) * 0.5
                rhs=np.float64(0.0)
                add_constraint(self,-lhs,'==',-rhs,name)
                
            
                name = 'lpack_def_rt({0},{1},{2})'.format(pl,s,t).replace(" ","")
                lhs=var.lpack_rt[pl,s,t]-self.gdata.pplinels[pl]*0.5*(var.pr_rt[ns,s,t]+var.pr_rt[nr,s,t])
                rhs= np.float64(0.0)
                add_constraint(self,-lhs,'==',-rhs,name)
                       

    '''
    NB! gflow_rs_io = {} # Gas flow (R to S) only if bi-directional flow. 
    This needs to be included in the line-pack definition constraint
    '''
    
    for pl in pplines:
            ns, nr = pl
        
            for s in scenarios:        
                for tpr, t in zip(time, time[1:]):
                    name='line_store_rt({0},{1},{2})'.format(pl,s,t).replace(" ","")
                    lhs=var.lpack_rt[pl,s,t] -var.lpack_rt[pl,s,tpr] - var.qin_sr_rt[pl,s,t] + var.qout_sr_rt[pl,s,t]
                    rhs= np.float64(0.0)
                    add_constraint(self,-lhs,'==',-rhs,name)
            
                t = time[0]
            
                name='line_store_rt({0},{1},{2})'.format(pl,s,t).replace(" ","")
                lhs=var.lpack_rt[pl,s,t]  - var.qin_sr_rt[pl,s,t] + var.qout_sr_rt[pl,s,t]
                rhs=  self.gdata.pplinelsini[pl] 
                add_constraint(self,-lhs,'==',-rhs,name)
                
#                for t in time:
#                    name='ss{0},{1},{2}'.format(pl,s,t)
#                    lhs=- var.qin_sr_rt[pl,s,t] + var.qout_sr_rt[pl,s,t]
#                    rhs=np.float64(0.0)
#                    add_constraint(self,lhs,'==',rhs,name)
                   
    for s in scenarios:
        name='lpack_end_max({0})'.format(s)               
        lhs=gb.quicksum(var.lpack_rt[pl, s, time[-1]] for pl in pplines)
        rhs=  (1.0+defaults.FINAL_LP_DEV)*gb.quicksum(self.gdata.pplinelsini[pl] for pl in pplines)
        add_constraint(self,lhs,'<=',rhs,name)
        
        name='lpack_end_min({0})'.format(s)               
        lhs=gb.quicksum(var.lpack_rt[pl, s, time[-1]] for pl in pplines)
        rhs=  (1.0-defaults.FINAL_LP_DEV)*gb.quicksum(self.gdata.pplinelsini[pl] for pl in pplines)
        add_constraint(self,rhs,'<=',lhs,name)
                    
    #                                        
    # Gas Storage
#    for gs in self.gdata.gstorage:
#        for t in time:
#            for s in scenarios:
#                
#                name='gsinMax_rt({0},{1},{2})'.format(gs,t,s)
#                lhs=var.gsin_rt[gs,s,t]
#                rhs=self.gdata.gstorageinfo['MaxInFlow'][gs]
#                add_constraint(self,lhs,'<=',rhs,name)
#                
#                name='gsoutMax_rt({0},{1},{2})'.format(gs,t,s)
#                lhs=var.gsout_rt[gs,s,t]
#                rhs=self.gdata.gstorageinfo['MaxOutFlow'][gs]
#                add_constraint(self,lhs,'<=',rhs,name)
#                
#                
#                name='gstore_max_rt({0},{1},{2})'.format(gs,t,s)
#                lhs=var.gstore_rt[gs,s,t]
#                rhs=self.gdata.gstorageinfo['MaxStore'][gs]
#                add_constraint(self,lhs,'<=',rhs,name)
#                
#                name='gstore_min_rt({0},{1},{2})'.format(gs,t,s)
#                lhs=var.gstore_rt[gs,s,t]
#                rhs=self.gdata.gstorageinfo['MinStore'][gs]
#                add_constraint(self,lhs,'>=',rhs,name)
#    
#    for gs in gstorage:
#        for s in scenarios:
#            for tpr, t in zip(time, time[1:]):
#                
#                name='gstor_def_rt({0},{1},{2})'.format(gs,s,t)
#                lhs=var.gstore_rt[gs,s,t]
#                rhs= var.gstore_rt[gs,s,tpr]+var.gsin_rt[gs,s,t]-var.gsout_rt[gs,s,t]
#                add_constraint(self,-lhs,'==',-rhs,name)
#        
#        
#            t = time[0]
#        
#            name='gstor_def_rt({0},{1},{2})'.format(gs,s,t)
#            lhs=var.gstore_rt[gs,s,t]
#            rhs= self.gdata.gstorageinfo['IniStore'][gs]+var.gsin_rt[gs,s,t]-var.gsout_rt[gs,s,t]
#            add_constraint(self,-lhs,'==',-rhs,name)
#            
#
#            # At end of time the linepack should be +/- 10% percent of the initial value
#            # Actual deviations stored in defaults.FINAL_LP_DEV
#
#            name='gstor_end({0},{1})'.format(gs,s)
#            lhs=var.gstore_rt[gs, s, time[-1]]
#            rhs= self.gdata.gstorageinfo['IniStore'][gs]
#            add_constraint(self,lhs,'>=',rhs,name)
                     
                                    
    
    
    # Gas shedding
    for s in scenarios:
        for gn in gnodes:
            for t in time:
                name = 'gas_shed_rt({0},{1},{2})'.format(gn,s,t)
                lhs= var.gshed_rt[gn,s,t]
                rhs= self.gdata.gasload[gn][t]
                add_constraint(self,lhs,'<=',rhs,name)
               
    
     # Nodal Gas Balance : Real-time
    
    # Here modeled only for 'uni-directional' gas flow (from S to R)    
        
    ###########################################################################    
    # Swing constracts can be defined per Gas Node - Here defined per GFPP
    # ... we need the GFPP node mapping and efficiencies 
    ###########################################################################    
    
   
    # Up/down reserve deployment by GFPP     
    RUp_gfpp = dispatchElecRT.RUpSC.add(dispatchElecRT.RUp.loc[:, self.gdata.gfpp]) 
    RDn_gfpp = dispatchElecRT.RDnSC.add(dispatchElecRT.RDn.loc[:, self.gdata.gfpp]) 
    
    Rgfpp = RUp_gfpp - RDn_gfpp
    
    # Day-ahead gas flows
    qin_sr = dispatchGasDA.qin_sr
    qout_sr = dispatchGasDA.qout_sr
    
    HR=self.gdata.generatorinfo.HR
    
    # Day-ahead gas storage schedule
    gsin = dispatchGasDA.gsin
    gsout = dispatchGasDA.gsout
    
        
    for s in scenarios:
        for gn in gnodes:
            for t in time:
                
                name='gas_balance_rt({0},{1},{2})'.format(gn,s,t)
                
                lhs=      gb.quicksum(( var.gprodUp[gw,s,t]  - var.gprodDn[gw,s,t]) for gw in self.gdata.Map_Gn2Gp[gn])  \
                        - gb.quicksum(( qout_sr[pl][t]['k0'] - var.qout_sr_rt[pl,s,t]) for pl in self.gdata.nodetoinpplines[gn]) \
                        + gb.quicksum(( qin_sr[pl][t]['k0']  - var.qin_sr_rt[pl,s,t] )   for pl in self.gdata.nodetooutpplines[gn]) \
                        + gb.quicksum(( var.gsout_rt[gs,s,t] - gsout[gs][t]['k0'] + gsin[gs][t]['k0'] - var.gsin_rt[gs,s,t]) for gs in self.gdata.Map_Gn2Gs[gn]) \
                        - gb.quicksum(Rgfpp[gen][t,s]*(HR[gen]) for gen in self.gdata.gfpp if gen in self.gdata.Map_Gn2Eg[gn]) \
                        + var.gshed_rt[gn,s,t] # Load SHedding

                        
                rhs = np.float64(0.0)  
                add_constraint(self,lhs,'==',rhs,name)

 
    m.update()
    
def _build_constraints_gasRT_FlowBased(self,dispatchGasDA,dispatchElecRT):
    
    m = self.model
    
    var = self.variables
    gnodes = self.gdata.gnodes
    pplines = self.gdata.pplineorder
    time = self.gdata.time
    gndata = self.gdata.gnodedf
    gstorage = self.gdata.gstorage     
    gwells = self.gdata.wellsinfo.index.tolist()
    bigM = self.gdata.bigM 
    
    scenarios = self.gdata.scenarios
    
    gprod = dispatchGasDA.gprod
    qin_sr = dispatchGasDA.qin_sr
    qout_sr = dispatchGasDA.qout_sr
    
    
     # Nodal Gas Balance : Real-time
    
    # Here modeled only for 'uni-directional' gas flow (from S to R)    
        
    ###########################################################################    
    # Swing constracts can be defined per Gas Node - Here defined per GFPP
    # ... we need the GFPP node mapping and efficiencies 
    ###########################################################################    
    
   
    # Up/down reserve deployment by GFPP     
    RUp_gfpp = dispatchElecRT.RUpSC.add(dispatchElecRT.RUp.loc[:, self.gdata.gfpp]) 
    RDn_gfpp = dispatchElecRT.RDnSC.add(dispatchElecRT.RDn.loc[:, self.gdata.gfpp]) 
    
    Rgfpp = RUp_gfpp - RDn_gfpp
    
    # Day-ahead gas flows
    qin_sr = dispatchGasDA.qin_sr
    qout_sr = dispatchGasDA.qout_sr
    
    HR=self.gdata.generatorinfo.HR
    
    # Day-ahead gas storage schedule
#    gsin = dispatchGasDA.gsin
#    gsout = dispatchGasDA.gsout
    
        
    for s in scenarios:
        for gn in gnodes:
            for t in time:
                
                name='gas_balance_rt({0},{1},{2})'.format(gn,s,t)

                lhs=      gb.quicksum(( var.gprodUp[gw,s,t]  - var.gprodDn[gw,s,t]) for gw in self.gdata.Map_Gn2Gp[gn])  \
                        - gb.quicksum(( qout_sr[pl][t]['k0'] - var.qout_sr_rt[pl,s,t]) for pl in self.gdata.nodetoinpplines[gn]) \
                        + gb.quicksum(( qin_sr[pl][t]['k0']  - var.qin_sr_rt[pl,s,t] )   for pl in self.gdata.nodetooutpplines[gn]) \
                        - gb.quicksum(Rgfpp[gen][t,s]*(HR[gen]) for gen in self.gdata.gfpp if gen in self.gdata.Map_Gn2Eg[gn]) \
                        + var.gshed_rt[gn,s,t] # Load SHedding
                        
#                lhs=      gb.quicksum(( var.gprodUp[gw,s,t]  - var.gprodDn[gw,s,t]) for gw in self.gdata.Map_Gn2Gp[gn])  \
#                        - gb.quicksum(( qout_sr[pl][t]['k0'] - var.qout_sr_rt[pl,s,t]) for pl in self.gdata.nodetoinpplines[gn]) \
#                        + gb.quicksum(( qin_sr[pl][t]['k0']  - var.qin_sr_rt[pl,s,t] )   for pl in self.gdata.nodetooutpplines[gn]) \
#                        + gb.quicksum(( var.gsout_rt[gs,s,t] - gsout[gs][t]['k0'] + gsin[gs][t]['k0'] - var.gsin_rt[gs,s,t]) for gs in self.gdata.Map_Gn2Gs[gn]) \
#                        - gb.quicksum(Rgfpp[gen][t,s]*(HR[gen]) for gen in self.gdata.gfpp if gen in self.gdata.Map_Gn2Eg[gn]) \
#                        + var.gshed_rt[gn,s,t] # Load SHedding

                        
                rhs = np.float64(0.0)  
                add_constraint(self,lhs,'==',rhs,name)    
    
    for pl in pplines:
        ns, nr = pl
        for t in time: 
            for s in scenarios: 
                
                name='gflow_sr_io_rt({0},{1},{2})'.format(pl,s,t).replace(" ","")
                lhs=var.gflow_sr_rt[pl,s,t]-(var.qin_sr_rt[pl,s,t] + var.qout_sr_rt[pl,s,t]) * 0.5
                rhs=np.float64(0.0)
                add_constraint(self,-lhs,'==',-rhs,name)  
                
                name='gflow_sr_limit_rt({0},{1},{2})'.format(pl,s,t).replace(" ","")
                lhs=var.gflow_sr_rt[pl,s,t]
                rhs=self.gdata.pplinelimit[pl]
                add_constraint(self,lhs,'<=',rhs,name)  
 
    # Gas well maximum production

    for gw in gwells:
        for s in scenarios:
            for t in time:
                
                name="gprodUp_max({0},{1},{2})".format(gw,s,t)           
                lhs= var.gprodUp[gw,s,t]
                rhs=self.gdata.wellsinfo['MaxProd'][gw]-gprod[gw][t]['k0']
                add_constraint(self,lhs,'<=',rhs,name)
                    
                name="gprodDn_max({0},{1},{2})".format(gw,s,t)
                lhs= var.gprodDn[gw,s,t]
                rhs=gprod[gw][t]['k0']
                add_constraint(self,lhs,'<=',rhs,name)
    

                       

    '''
    NB! gflow_rs_io = {} # Gas flow (R to S) only if bi-directional flow. 
    This needs to be included in the line-pack definition constraint
    '''
    
    for pl in pplines:
            ns, nr = pl
        
            for s in scenarios:        
                for t in time:
                    name='line_store_rt({0},{1},{2})'.format(pl,s,t).replace(" ","")
                    lhs = - var.qin_sr_rt[pl,s,t] + var.qout_sr_rt[pl,s,t]
                    rhs= np.float64(0.0)
                    add_constraint(self,lhs,'==',rhs,name)
                      
                   
    #                                        
    # Gas Storage
#    for gs in self.gdata.gstorage:
#        for t in time:
#            for s in scenarios:
#                
#                name='gsinMax_rt({0},{1},{2})'.format(gs,t,s)
#                lhs=var.gsin_rt[gs,s,t]
#                rhs=self.gdata.gstorageinfo['MaxInFlow'][gs]
#                add_constraint(self,lhs,'<=',rhs,name)
#                
#                name='gsoutMax_rt({0},{1},{2})'.format(gs,t,s)
#                lhs=var.gsout_rt[gs,s,t]
#                rhs=self.gdata.gstorageinfo['MaxOutFlow'][gs]
#                add_constraint(self,lhs,'<=',rhs,name)
#                
#                
#                name='gstore_max_rt({0},{1},{2})'.format(gs,t,s)
#                lhs=var.gstore_rt[gs,s,t]
#                rhs=self.gdata.gstorageinfo['MaxStore'][gs]
#                add_constraint(self,lhs,'<=',rhs,name)
#                
#                name='gstore_min_rt({0},{1},{2})'.format(gs,t,s)
#                lhs=var.gstore_rt[gs,s,t]
#                rhs=self.gdata.gstorageinfo['MinStore'][gs]
#                add_constraint(self,lhs,'>=',rhs,name)
#    
#    for gs in gstorage:
#        for s in scenarios:
#            for tpr, t in zip(time, time[1:]):
#                
#                name='gstor_def_rt({0},{1},{2})'.format(gs,s,t)
#                lhs=var.gstore_rt[gs,s,t]
#                rhs= var.gstore_rt[gs,s,tpr]+var.gsin_rt[gs,s,t]-var.gsout_rt[gs,s,t]
#                add_constraint(self,-lhs,'==',-rhs,name)
#        
#        
#            t = time[0]
#        
#            name='gstor_def_rt({0},{1},{2})'.format(gs,s,t)
#            lhs=var.gstore_rt[gs,s,t]
#            rhs= self.gdata.gstorageinfo['IniStore'][gs]+var.gsin_rt[gs,s,t]-var.gsout_rt[gs,s,t]
#            add_constraint(self,-lhs,'==',-rhs,name)
#            
#
#            # At end of time the linepack should be +/- 10% percent of the initial value
#            # Actual deviations stored in defaults.FINAL_LP_DEV
#
#            name='gstor_end({0},{1})'.format(gs,s)
#            lhs=var.gstore_rt[gs, s, time[-1]]
#            rhs= self.gdata.gstorageinfo['IniStore'][gs]
#            add_constraint(self,lhs,'>=',rhs,name)
                     
                                    
    
    
    # Gas shedding
    for s in scenarios:
        for gn in gnodes:
            for t in time:
                name = 'gas_shed_rt({0},{1},{2})'.format(gn,s,t)
                lhs= var.gshed_rt[gn,s,t]
                rhs= self.gdata.gasload[gn][t]
                add_constraint(self,lhs,'<=',rhs,name)
               
    


 
    m.update()

def _build_constraints_gasDA(self):
    #--- Get Parameters
    if defaults.GasNetwork=='FlowBased':
        _build_constraints_gasDA_FlowBased(self)
    elif defaults.GasNetwork=='WeymouthApprox':
        _build_constraints_gasDA_WeymouthApprox(self)
    else:
        print('Choose how to model the gas network')


#==============================================================================
# Real-time market
#==============================================================================
 
def _build_constraints_gasRT(self,dispatchGasDA,dispatchElecRT):
    if defaults.GasNetwork=='FlowBased':
        _build_constraints_gasRT_FlowBased(self,dispatchGasDA,dispatchElecRT)
    
    elif defaults.GasNetwork=='WeymouthApprox':
        _build_constraints_gasRT_WeymouthApprox(self,dispatchGasDA,dispatchElecRT)
    else:
        print('Choose how to model the gas network')
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    