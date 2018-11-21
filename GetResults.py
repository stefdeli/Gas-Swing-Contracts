# -*- coding: utf-8 -*-
"""
Created on Fri Dec  8 13:42:43 2017
@author: delikars
"""

import pandas as pd
import numpy as np
import defaults

    
def _results_StochD(self):
         
     generators = self.edata.generators
     gfpp = self.edata.gfpp   
     windfarms = self.edata.windfarms 
     swingcontracts = self.edata.swingcontracts
     time = self.edata.time
     
     # Day-ahead variables
     
     if self.comp==False:
         self.results.usc = pd.DataFrame(
                 [self.variables.usc[sc].x for sc in swingcontracts], index=swingcontracts)
     
     
     self.results.Pgen = pd.DataFrame(
        [[self.variables.Pgen[i,t].x for i in generators] for t in time], index=time, columns=generators)
        
     self.results.WindDA = pd.DataFrame(
        [[self.variables.WindDA[j,t].x for j in windfarms] for t in time], index=time, columns=windfarms)
     

     self.results.PgenSC = pd.DataFrame(
        [[self.variables.PgenSC[g,t].x for g in gfpp] for t in time], index=time, columns=gfpp)
     
     self.results.RCup = pd.DataFrame(
        [[self.variables.RCup[g,t].x for g in generators] for t in time], index=time, columns=generators)
     
     self.results.RCdn = pd.DataFrame(
        [[self.variables.RCdn[g,t].x for g in generators] for t in time], index=time, columns=generators)
    
     self.results.RCupSC = pd.DataFrame(
        [[self.variables.RCupSC[g,t].x for g in gfpp] for t in time], index=time, columns=gfpp)
     
     self.results.RCdnSC = pd.DataFrame(
        [[self.variables.RCdnSC[g,t].x for g in gfpp] for t in time], index=time, columns=gfpp)
     
     # Real-time variables 
     
     scenarios = self.edata.scenarios
     
     iterables = [time, scenarios]
     index = pd.MultiIndex.from_product(iterables, names=['Time', 'Scenarios'])
     
     self.results.RUp = pd.DataFrame(
        [[self.variables.RUp[g,s,t].x for g in generators] for t in time for s in scenarios ], index=index, columns = generators)
     
     self.results.RDn = pd.DataFrame(
        [[self.variables.RDn[g,s,t].x for g in generators] for t in time for s in scenarios ], index=index, columns = generators)     
      
     self.results.RUpSC = pd.DataFrame(
        [[self.variables.RUpSC[g,s,t].x for g in gfpp] for t in time for s in scenarios ], index=index, columns = gfpp)      
     
     self.results.RDnSC = pd.DataFrame(
        [[self.variables.RDnSC[g,s,t].x for g in gfpp] for t in time for s in scenarios ], index=index, columns = gfpp) 
     
     self.results.Lshed = pd.DataFrame(
        [[self.variables.Lshed[s,t].x for s in scenarios] for t in time], index=time, columns=scenarios)
     
     self.results.Wspill = pd.DataFrame(
        [[self.variables.Wspill[j,s,t].x for j in windfarms] for t in time for s in scenarios], index=index, columns=windfarms)
     
     
def _results_gasDA(self, f2d):
     
    r = self.results
    var = self.variables
    time = self.gdata.time
    sclim = self.gdata.sclim
    m     = self.model
     
    
    iterables = [self.gdata.time, self.gdata.sclim]
    index = pd.MultiIndex.from_product(iterables, names=['Time', 'Sclim'])
    
    r.gprod = pd.DataFrame([[var.gprod[gw,k,t].x for gw in self.gdata.wells] for t in time for k in sclim], index=index, columns=self.gdata.wells)
    r.gflow_sr = pd.DataFrame([[var.gflow_sr[pl,k,t].x for pl in self.gdata.pplineorder] for t in time for k in sclim], index=index, columns=self.gdata.pplineorder)
    
    if defaults.GasNetwork=='WeymouthApprox':
        r.pr = pd.DataFrame([[var.pr[ng,k,t].x for ng in self.gdata.gnodeorder] for t in time for k in sclim], index=index, columns=self.gdata.gnodeorder)
        r.lpack = pd.DataFrame([[var.lpack[pl,k,t].x for pl in self.gdata.pplineorder] for t in time for k in sclim], index=index, columns=self.gdata.pplineorder)
    
    
    r.qin_sr = pd.DataFrame([[var.qin_sr[pl,k,t].x for pl in self.gdata.pplineorder] for t in time for k in sclim], index=index, columns=self.gdata.pplineorder)    
    r.qout_sr = pd.DataFrame([[var.qout_sr[pl,k,t].x for pl in self.gdata.pplineorder] for t in time for k in sclim], index=index, columns=self.gdata.pplineorder)    
    
#    r.gsin = pd.DataFrame([[var.gsin[gs,k,t].x for gs in self.gdata.gstorage] for t in time for k in sclim],  index=index, columns=self.gdata.gstorage)
#    r.gsout = pd.DataFrame([[var.gsout[gs,k,t].x for gs in self.gdata.gstorage] for t in time for k in sclim],  index=index, columns=self.gdata.gstorage)
#    r.gstore = pd.DataFrame([[var.gstore[gs,k,t].x for gs in self.gdata.gstorage] for t in time for k in sclim],  index=index, columns=self.gdata.gstorage)
    
    if f2d == True:
        r.gflow_rs = pd.DataFrame([[var.gflow_rs[pl,k,t].x for pl in self.gdata.pplineorder] for t in time for k in sclim], index=index, columns=self.gdata.pplineorder)
        r.qin_rs = pd.DataFrame([[var.qin_rs[pl,k,t].x for pl in self.gdata.pplineorder] for t in time for k in sclim], index=index, columns=self.gdata.pplineorder)
        r.qout_rs = pd.DataFrame([[var.qout_rs[pl,k,t].x for pl in self.gdata.pplineorder] for t in time for k in sclim], index=index, columns=self.gdata.pplineorder)
        
#    r.costGas = np.dot(r.gprod,np.array(self.gdata.wellsinfo.Cost)).sum()
    if self.comp==False:
        con_name='gas_balance_da({0},{1},{2})'        
        r.lambda_Flow_Bal =pd.DataFrame([[ m.getConstrByName(con_name.format(ng,k,t)).Pi for ng in self.gdata.gnodeorder] for t in time for k in sclim], index=index, columns=self.gdata.gnodeorder)
        
def _results_elecRT(self):
     
     generators = self.edata.generators
     gfpp = self.edata.gfpp   
     windfarms = self.edata.windfarms      
     time = self.edata.time
         
     scenarios = self.edata.windscen_index # Only wind power scenarios
     
     iterables = [time, scenarios]
     index = pd.MultiIndex.from_product(iterables, names=['Time', 'Scenarios'])
     
     self.results.RUp = pd.DataFrame(
        [[self.variables.RUp[g,s,t].x for g in generators] for t in time for s in scenarios ], index=index, columns = generators)
     
     self.results.RDn = pd.DataFrame(
        [[self.variables.RDn[g,s,t].x for g in generators] for t in time for s in scenarios ], index=index, columns = generators)     
      
     self.results.RUpSC = pd.DataFrame(
        [[self.variables.RUpSC[g,s,t].x for g in gfpp] for t in time for s in scenarios ], index=index, columns = gfpp)      
     
     self.results.RDnSC = pd.DataFrame(
        [[self.variables.RDnSC[g,s,t].x for g in gfpp] for t in time for s in scenarios ], index=index, columns = gfpp) 
     
     self.results.Lshed = pd.DataFrame(
        [[self.variables.Lshed[s,t].x for s in scenarios] for t in time], index=time, columns=scenarios)
     
     self.results.Wspill = pd.DataFrame(
        [[self.variables.Wspill[j,s,t].x for j in windfarms] for t in time for s in scenarios], index=index, columns=windfarms)
        
#    r.costGas = np.dot(r.gprod,np.array(self.gdata.wellsinfo.Cost)).sum()
     
     
def _results_gasRT(self, f2d):
     
    r = self.results
    var = self.variables
    time = self.gdata.time
    scenarios = self.gdata.scenarios
    m = self.model
     
    
    iterables = [self.gdata.time, scenarios]
    index = pd.MultiIndex.from_product(iterables, names=['Time', 'Scenarios'])
    
    r.gprodUp = pd.DataFrame([[var.gprodUp[gw,s,t].x for gw in self.gdata.wells] for t in time for s in scenarios], index=index, columns=self.gdata.wells)
    r.gprodDn = pd.DataFrame([[var.gprodDn[gw,s,t].x for gw in self.gdata.wells] for t in time for s in scenarios], index=index, columns=self.gdata.wells)        

    r.gshed_rt = pd.DataFrame([[var.gshed_rt[ng,k,t].x for ng in self.gdata.gnodeorder] for t in time for k in scenarios], index=index, columns=self.gdata.gnodeorder)
    

    if defaults.GasNetwork=='WeymouthApprox':
        r.lpack_rt = pd.DataFrame([[var.lpack_rt[pl,s,t].x for pl in self.gdata.pplineorder] for t in time for s in scenarios], index=index, columns=self.gdata.pplineorder)
        r.pr_rt = pd.DataFrame([[var.pr_rt[ng,k,t].x for ng in self.gdata.gnodeorder] for t in time for k in scenarios], index=index, columns=self.gdata.gnodeorder)
    
    r.gflow_sr_rt = pd.DataFrame([[var.gflow_sr_rt[pl,k,t].x for pl in self.gdata.pplineorder] for t in time for k in scenarios], index=index, columns=self.gdata.pplineorder)
    r.qin_sr_rt = pd.DataFrame([[var.qin_sr_rt[pl,k,t].x for pl in self.gdata.pplineorder] for t in time for k in scenarios], index=index, columns=self.gdata.pplineorder)    
    r.qout_sr_rt = pd.DataFrame([[var.qout_sr_rt[pl,k,t].x for pl in self.gdata.pplineorder] for t in time for k in scenarios], index=index, columns=self.gdata.pplineorder)  

    if self.comp==False:
        con_name='gas_balance_rt({0},{1},{2})'        
        r.lambda_Flow_Bal =pd.DataFrame([[ m.getConstrByName(con_name.format(ng,k,t)).Pi for ng in self.gdata.gnodeorder] for t in time for k in scenarios], index=index, columns=self.gdata.gnodeorder)
            
    
def _results_duals(self):
    
    dual_var={}
    for i in self.variables.primal.keys():
        if self.variables.primal[i]=='C': # If continous variable
            dual_var[i]=self.variables.primal[i].rc
        
    dual_con={}
    for i in self.constraints.keys():
        dual_con[i]=self.constraints[i].expr.Pi
        
    self.results.dual_var=dual_var
    self.results.dual_con=dual_con
    
def Get_Nodal_Balance_GRT(mGRT,dispatchGasDA,dispatchElecRT):
    
    
    RUp_gfpp = dispatchElecRT.RUpSC.add(dispatchElecRT.RUp.loc[:, mGRT.gdata.gfpp]) 
    RDn_gfpp = dispatchElecRT.RDnSC.add(dispatchElecRT.RDn.loc[:, mGRT.gdata.gfpp]) 
    HR=mGRT.gdata.generatorinfo.HR
    
    Rgfpp = RUp_gfpp - RDn_gfpp
    for g in  mGRT.gdata.gfpp:
        Rgfpp[g]=HR[g]*Rgfpp[g]
    
    # Day-ahead gas flows
    qin_sr = dispatchGasDA.qin_sr
    qout_sr = dispatchGasDA.qout_sr
    
    
    
    Nodal_Balance={}
    for ng in mGRT.gdata.gnodes:
        Scens={}
        for s in mGRT.gdata.scenarios:
            Gwells= mGRT.results.gprodUp-mGRT.results.gprodDn
            Gwells = Gwells[ mGRT.gdata.Map_Gn2Gp[ng]].xs(s,level=1).sum(axis=1).rename('Gprod')
           
            Gen =Rgfpp[mGRT.gdata.Map_Gn2Eg[ng]].xs(s,level=1).sum(axis=1).rename('Gen')
            
            Var_flow_away=mGRT.results.qin_sr_rt[mGRT.gdata.nodetooutpplines[ng]].xs(s,level=1).sum(axis=1)
            Par_flow_away=qin_sr[mGRT.gdata.nodetooutpplines[ng]].xs('k0',level=1).sum(axis=1)
            NetFlowAway=(Par_flow_away-Var_flow_away).rename('netflowaway')
            
            Var_flow_to=mGRT.results.qout_sr_rt[mGRT.gdata.nodetoinpplines[ng]].xs(s,level=1).sum(axis=1)
            Par_flow_to=qout_sr[mGRT.gdata.nodetoinpplines[ng]].xs('k0',level=1).sum(axis=1)
            NetFlowTo=(Par_flow_to-Var_flow_to).rename('netflowto')
            
            Lshed=mGRT.results.gshed[ng].xs(s,level=1).rename('shed')
            
            Temp=pd.concat([Gwells,-NetFlowTo,NetFlowAway,-Gen,Lshed],axis=1)
            Scens[s]=Temp
        Nodal_Balance[ng]=Scens
        
    return Nodal_Balance



        

        
## Node 1
#self=mGDA
#Pgen = self.gdata.Pgen 
#PgenSC = self.gdata.PgenSC 
#RSC = self.gdata.RSC
#HR=self.gdata.generatorinfo.HR['g1']
#gn='ng102'
#
## Node 1
#mGDA_n1=pd.concat([mGDA.results.gprod['gw1'].xs('k0',level=1).rename('Prod'),
#                mGDA.results.qin_sr[('ng101', 'ng102')].xs('k0',level=1).rename('Pipe_in')
#                ],axis=1) 
## Node 2
#mGDA_n2=pd.concat([(Pgen['g1']*HR+self.gdata.gasload[gn]).rename('Load'),
#                mGDA.results.qout_sr[('ng101', 'ng102')].xs('k0',level=1).rename('Pipe_out')
#                ],axis=1) 
#
#
#
#
#
#
#gn='ng102'
#
#Temp=pd.concat([mGRT.results.gprodUp['gw1'].xs('s1',level=1).rename('ProdUp'),
#                mGRT.results.gprodDn['gw1'].xs('s1',level=1).rename('ProdDn'),
#                (mGRT.results.qin_sr_rt[('ng101', 'ng102')].xs('s1',level=1)-
#                 mGDA.results.qin_sr[('ng101', 'ng102')].xs('k0',level=1)).rename('avgflow'),
#                mGRT.results.qout_sr_rt[('ng101', 'ng102')].xs('s1',level=1).rename('avgflow')
#                ],axis=1) 
## Node 2
#Temp=pd.concat([(Pgen['g1']*HR+self.gdata.gasload[gn]).rename('Load'),
#                mGDA.results.qout_sr[('ng101', 'ng102')].xs('k0',level=1).rename('avgflow')
#                ],axis=1) 




#
## Results for Comparison
#p=mGRT.gdata.pplineorder[0]
#S1_Redispatch=(mERT.results.RUp['g1'].xs('s1',level=1)-             
#             mERT.results.RDn['g1'].xs('s1',level=1)).rename('Redispatch_MW')
#
#RT_Gas_S1=pd.concat([ S1_Redispatch,
#                     (S1_Redispatch*mERT.edata.generatorinfo.loc['g1'].HR).rename('Redispatch'),
#             ( mGRT.results.gprodUp['gw1'].xs('s1',level=1)-             
#              mGRT.results.gprodDn['gw1'].xs('s1',level=1)).rename('GprodTot'),
#             mGRT.results.gprodUp['gw1'].xs('s1',level=1).rename('Rup'),             
#             mGRT.results.gprodDn['gw1'].xs('s1',level=1).rename('RDn'),
#            mGRT.results.lpack_rt[pl].xs('s1',level=1).rename('Lpack'),
#             ],axis=1)
#             
#S2_Redispatch=(mERT.results.RUp['g1'].xs('s2',level=1)-             
#             mERT.results.RDn['g1'].xs('s2',level=1)).rename('Redispatch_MW')
#             
#RT_Gas_S2=pd.concat([ S2_Redispatch,
#                     (S2_Redispatch*mERT.edata.generatorinfo.loc['g1'].HR).rename('Redispatch'),
#             ( mGRT.results.gprodUp['gw1'].xs('s2',level=1)-             
#              mGRT.results.gprodDn['gw1'].xs('s2',level=1)).rename('GprodTot'),
#             mGRT.results.gprodUp['gw1'].xs('s2',level=1).rename('Rup'),             
#             mGRT.results.gprodDn['gw1'].xs('s2',level=1).rename('RDn'),
#            mGRT.results.lpack_rt[pl].xs('s2',level=1).rename('Lpack'),
#             ],axis=1)
#             
#RT_Gas_S2[['GprodTot','Redispatch']].plot()


#
#mGDA = GasDA(dispatchElecDA,f2d)
#
#
#list1=[1e-3,1e3,0]
#list2=['FixInput', 'FixOutput', 'ConstantOutput','None']
#Results=[]
#AllResults={}
#Combinations=list(itertools.product(list1,list2)) # Find combinations
#
#for i,val in enumerate(Combinations):
#    mGDA.gdata.EPS=Combinations[i][0]
#    mGDA.gdata.GasSlack=Combinations[i][1]
#    #   Rebuild model with new parameter
#    mGDA._build_model()
#        
#    mGDA.optimize()
#    mGDA.get_results(f2d)
#
#    Pipelines={}
#    Flow_Errors=pd.DataFrame()
#    SP=pd.DataFrame()
#    RP=pd.DataFrame()
#    scen_ix='k0'
#    
#    for pl in mGDA.gdata.pplineorder:
#        Lpack      = mGDA.results.lpack[pl].xs(scen_ix,level=1).rename('Lpack')
#        L_ini= mGDA.gdata.pplinelsini[pl]
#        Lpack_before =Lpack.shift(periods=1)
#        Lpack_before.loc['t1']=L_ini
#        dLpack     = Lpack.diff().rename('dLpack')
#        dLpack['t1'] = Lpack['t1']-L_ini
#        qin_sr     = mGDA.results.qin_sr[pl].xs(scen_ix,level=1).rename('qin_sr')
#        qout_sr    = mGDA.results.qout_sr[pl].xs(scen_ix,level=1).rename('qout_sr')
#        Flow       = mGDA.results.gflow_sr[pl].xs(scen_ix,level=1).rename('Flow')
#        Sp         = mGDA.results.pr[pl[0]].xs(scen_ix,level=1).rename('Send Pressure')
#        Rp         = mGDA.results.pr[pl[1]].xs(scen_ix,level=1).rename('Receive Pressure')
#        ActualFlow = (mGDA.gdata.pplineK[pl]*np.sqrt(Sp**2-Rp**2)).rename('Actual Flow')
#        Error      = np.abs(ActualFlow-Flow).rename('Error')
#        dP         = (Sp-Rp).rename('PressureLoss')
#        Lpack_inj  = (qin_sr-qout_sr).rename('Lpackinj')
#        Temp=pd.concat([Lpack_inj,dLpack,Lpack,Lpack_before,qin_sr,qout_sr,Flow,Sp,Rp,dP,Flow,ActualFlow,Error
#                    ],axis=1)   
#        Pipelines[pl]=Temp
#        
#        Flow_Errors.loc[:,'Temp']=Error.values
#        Flow_Errors=Flow_Errors.rename(index=str, columns={'Temp': pl})
#        
#        SP.loc[:,'Temp']=Sp.values
#        SP=SP.rename(index=str, columns={'Temp': pl})
#        
#        RP.loc[:,'Temp']=Rp.values
#        RP=RP.rename(index=str, columns={'Temp': pl})
#    Results.append([mGDA.gdata.EPS,mGDA.gdata.GasSlack,Flow_Errors.values.max()])
#    AllResults[Combinations[i]]=Temp
#
#
#

#max_val=0
#min_val=0
#for i in mGRT.constraints.keys():
#    if mGRT.constraints[i].expr.sense=='=':
#        temp=mGRT.constraints[i].expr.Pi
#        print(i +' : '+str(temp))
#        max_val=max(temp,max_val)
#        min_val=min(temp,min_val)
#
#
#    
#for i in mGRT_COMP.duals.lambdas:
#    
#    print(mGRT_COMP.duals.lambdas[i])   
#   
   
   
## Extract Data for Comparison
#
#WindCap=mSEDA.edata.windinfo.capacity.values
#DA_Wind=mSEDA.results.WindDA['w1']
#S1_Wind = WindCap*mSEDA.edata.windscen['w1']['s1']
#S2_Wind = WindCap*mSEDA.edata.windscen['w1']['s2']
#S1_Err=DA_Wind-S1_Wind
#S2_Err=DA_Wind-S2_Wind
#
#RT_Gen1_S1=pd.concat([S1_Err.rename('WindErr'),                    
#             (mERT.results.RUp['g1'].xs('s1',level=1)-             
#             mERT.results.RDn['g1'].xs('s1',level=1)).rename('RTot'),
#             mERT.results.RUp['g1'].xs('s1',level=1).rename('Rup'),             
#             mERT.results.RDn['g1'].xs('s1',level=1).rename('RDn'),
#             ],axis=1)
#             
#RT_Gen1_S2=pd.concat([S2_Err.rename('WindErr'),                    
#             (mERT.results.RUp['g1'].xs('s2',level=1)-             
#             mERT.results.RDn['g1'].xs('s2',level=1)).rename('RTot'),
#             mERT.results.RUp['g1'].xs('s2',level=1).rename('Rup'),             
#             mERT.results.RDn['g1'].xs('s2',level=1).rename('RDn'),
#             ],axis=1)
    
#
#
#Pipelines={}
#Flow_Errors=pd.DataFrame()
#SP=pd.DataFrame()
#RP=pd.DataFrame()
#scen_ix='k0'
#
#for pl in mGDA.gdata.pplineorder:
#    Lpack      = mGDA.results.lpack[pl].xs(scen_ix,level=1).rename('Lpack')
#    L_ini=mGDA.gdata.pplinelsini[pl]
#    dLpack     = Lpack.diff().rename('dLpack')
#    dLpack['t1'] = Lpack['t1']-L_ini
#    qin_sr     = mGDA.results.qin_sr[pl].xs(scen_ix,level=1).rename('qin_sr')
#    qout_sr    = mGDA.results.qout_sr[pl].xs(scen_ix,level=1).rename('qout_sr')
#    Flow       = mGDA.results.gflow_sr[pl].xs(scen_ix,level=1).rename('Flow')
#    Sp         = mGDA.results.pr[pl[0]].xs(scen_ix,level=1).rename('Send Pressure')
#    Rp         = mGDA.results.pr[pl[1]].xs(scen_ix,level=1).rename('Receive Pressure')
#    ActualFlow = (mGDA.gdata.pplineK[pl]*np.sqrt(Sp**2-Rp**2)).rename('Actual Flow')
#    Error      = np.abs(ActualFlow-Flow).rename('Error')
#    dP         = (Sp-Rp).rename('PressureLoss')
#    Lpack_inj  = (qin_sr-qout_sr).rename('Lpackinj')
#    Temp=pd.concat([Lpack_inj,dLpack,Lpack,qin_sr,qout_sr,Flow,Sp,Rp,dP,Flow,ActualFlow,Error
#                ],axis=1)   
#    Pipelines[pl]=Temp
#    
#    Flow_Errors.loc[:,'Temp']=Error.values
#    Flow_Errors=Flow_Errors.rename(index=str, columns={'Temp': pl})
#    
#    SP.loc[:,'Temp']=Sp.values
#    SP=SP.rename(index=str, columns={'Temp': pl})
#    
#    RP.loc[:,'Temp']=Rp.values
#    RP=RP.rename(index=str, columns={'Temp': pl})
#
#
#p=mGDA.gdata.pplineorder[0]
#
#
#Flow_Errors.plot()
#print(Pipelines[mGDA.gdata.pplineorder[0]]['Send Pressure'])
#    
## Look at the effects of discretizatoin on the error
#Error_df=pd.DataFrame()
#for Nx in [20]:
#    print('Testing Nx= {0}'.format(Nx))
#    mGDA = GasDA(dispatchElecDA,f2d)
#    mGDA.gdata.Nfxpp=Nx
#    # Rebuild model with new parameter
#    mGDA._build_model()
#    
##mGDA.model.params.MIPGap = 0.0
##mGDA.model.params.IntFeasTol = 1e-9
#
##mGDA.model.computeIIS()
##mGDA.model.write("mGDA.ilp")
#    mGDA.model.write("mGDA.lp")  
#    mGDA.optimize()
#    mGDA.get_results(f2d)
#
#    # Extract Data for Comparison
#    Scen_Dict={}
#    pl = mGDA.gdata.pplineorder[0]
#    for scen_ix in mGDA.gdata.sclim:
#        Lpack      = mGDA.results.lpack[pl].xs(scen_ix,level=1).rename('Lpack')
#        Prod       = mGDA.results.gprod['gw1'].xs(scen_ix,level=1).rename('Production')
#        qin_sr     = mGDA.results.qin_sr[pl].xs(scen_ix,level=1).rename('qin_sr')
#        qout_sr    = mGDA.results.qout_sr[pl].xs(scen_ix,level=1).rename('qout_sr')
#        Flow       = mGDA.results.gflow_sr[pl].xs(scen_ix,level=1).rename('Flow')
#        Sp         = mGDA.results.pr[pl[0]].xs(scen_ix,level=1).rename('Send Pressure')
#        Rp         = mGDA.results.pr[pl[1]].xs(scen_ix,level=1).rename('Receive Pressure')
#        ActualFlow = (mGDA.gdata.pplineK[pl]*np.sqrt(Sp**2-Rp**2)).rename('Actual Flow')
#        Error      = np.abs(ActualFlow-Flow).rename('Error')
#        Temp=pd.concat([Lpack,Prod,qin_sr,qout_sr,Flow,Sp,Rp,ActualFlow,Error
#                ],axis=1)   
#        Scen_Dict[scen_ix]=Temp
#    Error_df=Error_df.join((Scen_Dict['k0']['Error']).rename('Error_'+str(Nx)),how='right')
#Scen_Dict['k0'].loc['t1']
#


# Extract Data for Comparison
#DA_Gen1=pd.concat([dispatchElecDA.Pgen['g1'].rename('Pgen'),
#             mSEDA.results.WindDA['w1'].rename('Wind'),
#             mSEDA.edata.load.sum().rename('Load'),
#             dispatchElecDA.RCdn['g1'].rename('RCdn'),
#             dispatchElecDA.RCup['g1'].rename('RCup'),
#             ],axis=1)
#    
#Scen_Dict={}
#for scen_ix in range(6):
#    scen_int='ss'+str(scen_ix)
#    Temp=pd.concat([dispatchElecDA.Pgen['g1'].rename('Pgen'),
#             mSEDA.results.RUp['g1'].xs(   scen_int,level=1).rename('Rup_ss0'),             
#             mSEDA.results.RDn['g1'].xs(   scen_int,level=1).rename('RDn_ss0'),             
#             mSEDA.results.Wspill['w1'].xs(scen_int,level=1).rename('Wspill'),  
#             mSEDA.results.Lshed[           scen_int ].rename('LoadShed')   
#             ],axis=1)
#    WindCap=mSEDA.edata.windinfo.capacity.values
#    NetChange_s1= WindCap*mSEDA.edata.windscen['w1']['s1']- mSEDA.results.WindDA['w1']
#    NetChange_s2= WindCap*mSEDA.edata.windscen['w1']['s2']- mSEDA.results.WindDA['w1']
#    
#    NetChange_Pgen=Temp.Rup_ss0-Temp.RDn_ss0
#    Temp=pd.concat([Temp,
#                NetChange_s1.rename('Wind_s1'),
#                   NetChange_s2.rename('Wind_s2'),
#                   NetChange_Pgen.rename('redispacth')],
#                   axis=1)
#    
#    Scen_Dict[scen_ix]=Temp