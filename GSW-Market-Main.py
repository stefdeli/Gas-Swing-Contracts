# -*- coding: utf-8 -*-
"""
Created on Mon Sep 24 15:49:31 2018

Market clearing with Gas Swing contracts

@author: delikars
E"""

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

#Test Test

##--- To save data using pickle
## Save a dictionary into a pickle file.
#import pickle
## Objec to save
#favorite_color = { "lion": "yellow", "kitty": "red" }
## Save
#pickle.dump( favorite_color, open( "save.p", "wb" ) )
## Load
#favorite_color = pickle.load( open( "save.p", "rb" ) )
#

# Stochastic Day-ahead Electricity dispatch
class expando(object):
    pass


# Create Object 
class StochElecDA():
    '''
    Stochastic electricity system day-ahead scheduling
    '''
    
    def __init__(self,comp=False):
        '''
        '''        
        self.edata = expando()
        self.variables = expando()
        self.variables.primal = {}
        self.constraints = {}
        self.results = expando()

        self._load_ElecData()
        if comp==False:
            self._build_model()
        elif comp==True:
            self._build_CP_model()
        
    def optimize(self):
        self.model.optimize()
    
    def _load_ElecData(self):     
        ElecData_Load._load_network(self)  
        ElecData_Load._load_generator_data(self)
        ElecData_Load._load_wind_data(self)         
        ElecData_Load._load_initial_data(self)
        ElecData_Load._combine_wind_gprt_scenarios(self)
        ElecData_Load._load_SCinfo(self)
        
        
    def get_results(self):           
        GetResults._results_StochD(self)
        
    def _build_model(self):
        self.model = gb.Model()        
        #self.constraints={} # to store all constraints
        self.comp = False # Is it a complimentarity model
        
        mtype = 'Stoch'      # 'Market type' = {Stoch, RealTime}
        dispatchElecDA = None
        
        LibVars._build_variables_elecDA(self)        
        LibVars._build_variables_elecRT(self,mtype)    
        
        LibCns_Elec._build_constraints_elecDA(self)
        LibCns_Elec._build_constraints_elecRT(self, mtype, dispatchElecDA)
       
        LibObjFunct._build_objective_StochElecDA(self)
        self.model.update()
        
    def _build_CP_model(self):
        self.model = gb.Model()        
        #self.constraints={} # to store all constraints
        self.comp = True # Is it a complimentarity model
        mtype = 'Stoch'      # 'Market type' = {Stoch, RealTime}
        dispatchElecDA = None
        
        LibVars._build_variables_elecDA(self)        
        LibVars._build_variables_elecRT(self,mtype)        

        
        LibCns_Elec._build_constraints_elecDA(self)
        LibCns_Elec._build_constraints_elecRT(self, mtype, dispatchElecDA)
        LibObjFunct._build_objective_StochElecDA(self)
       
        self.model.update()
        # Add the KKT Conditions (Stationarity and complementarity)
        KKTizer._complementarity_model(self)
        
        LibVars._build_dummy_objective_var(self)
        LibObjFunct._build_objective_dummy_complementarity(self)
        
        self.model.Params.MIPFocus=1
        self.model.Params.timelimit = 20.0
        self.model.update()

mSEDA = StochElecDA()
mSEDA.model.write('LPModels/mSEDA.lp')
mSEDA.optimize()
mSEDA.get_results()

print ('########################################################')
print ('Stochastic electricity dispatch - Solved')
print ('########################################################')

dispatchElecDA = expando()
dispatchElecDA.Pgen = mSEDA.results.Pgen
dispatchElecDA.PgenSC = mSEDA.results.PgenSC
dispatchElecDA.WindDA = mSEDA.results.WindDA
dispatchElecDA.usc = mSEDA.results.usc

dispatchElecDA.RCup = mSEDA.results.RCup
dispatchElecDA.RCdn = mSEDA.results.RCdn
dispatchElecDA.RCupSC = mSEDA.results.RCupSC
dispatchElecDA.RCdnSC = mSEDA.results.RCdnSC

pickle.dump( dispatchElecDA, open( "dispatchElecDA.p", "wb" ) )



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

    

# flow2dir = True : Bi-directional flow on gas pipelines
# flow2dir = False: Uni-directional flow on gas pipelines (from sending to receiving node)

f2d = False

class GasDA():
    '''
    Day-ahead gas system scheduling
    '''
    def __init__(self, dispatchElecDA, f2d,comp=False):
        '''
        '''
        self.gdata = expando()
        self.edata = expando()
        self.variables = expando()
        self.variables.primal={}
        self.constraints = expando()
        self.results = expando()
        
        self._setElecDAschedule(dispatchElecDA)
        self._load_data(dispatchElecDA,f2d)
        
        if comp==False:
            self._build_model()
        elif comp==True:
            self._build_CP_model()
            
    def optimize(self):
        self.model.optimize()
        
    def _setElecDAschedule(self, dispatchElecDA):
        self.gdata.Pgen = dispatchElecDA.Pgen
        self.gdata.PgenSC = dispatchElecDA.PgenSC
        
    def get_results(self,f2d):
        GetResults._results_gasDA(self,f2d)        

    def _load_data(self,dispatchElecDA,f2d):
        GasData_Load._load_gas_network(self,f2d)              
        GasData_Load._load_wells_data(self)
        GasData_Load._load_gasload(self)
        GasData_Load._load_gas_storage(self)
        
        GasData_Load._load_SCinfo(self)          
        GasData_Load._ActiveSCinfo(self,dispatchElecDA)  
       
        #self.gdata.time=['t1']
        
    def _build_model(self):
        self.model = gb.Model()
        self.constraints={} # to store all constraints
        self.comp= False
        
        
        LibVars._build_variables_gasDA(self)    
        LibCns_Gas._build_constraints_gasDA(self)
       
        LibObjFunct._build_objective_gasDA(self)
        
        self.model.update()

    def _build_CP_model(self):
        self.model = gb.Model()        
        self.constraints={} # to store all constraints
        self.comp = True # Is it a complimentarity model

        
        LibVars._build_variables_gasDA(self)    
        LibCns_Gas._build_constraints_gasDA(self)
       
        LibObjFunct._build_objective_gasDA(self)
       
        self.model.update()
        # Add the KKT Conditions (Stationarity and complementarity)
        KKTizer._complementarity_model(self)
        
        LibVars._build_dummy_objective_var(self)
        LibObjFunct._build_objective_dummy_complementarity(self)
        
        self.model.Params.MIPFocus=1
        self.model.Params.timelimit = 20.0
        
        self.model.update()


mGDA = GasDA(dispatchElecDA,f2d)
mGDA.optimize()
mGDA.get_results(f2d)
dispatchGasDA = expando()
dispatchGasDA.gprod   = mGDA.results.gprod
dispatchGasDA.qin_sr  = mGDA.results.qin_sr
dispatchGasDA.qout_sr = mGDA.results.qout_sr
dispatchGasDA.gsin    = mGDA.results.gsin
dispatchGasDA.gsout   = mGDA.results.gsout



Pipelines={}
Flow_Errors=pd.DataFrame()
SP=pd.DataFrame()
RP=pd.DataFrame()
scen_ix='k0'

for pl in mGDA.gdata.pplineorder:
    Lpack      = mGDA.results.lpack[pl].xs(scen_ix,level=1).rename('Lpack')
    L_ini=mGDA.gdata.pplinelsini[pl]
    dLpack     = Lpack.diff().rename('dLpack')
    dLpack['t1'] = Lpack['t1']-L_ini
    qin_sr     = mGDA.results.qin_sr[pl].xs(scen_ix,level=1).rename('qin_sr')
    qout_sr    = mGDA.results.qout_sr[pl].xs(scen_ix,level=1).rename('qout_sr')
    Flow       = mGDA.results.gflow_sr[pl].xs(scen_ix,level=1).rename('Flow')
    Sp         = mGDA.results.pr[pl[0]].xs(scen_ix,level=1).rename('Send Pressure')
    Rp         = mGDA.results.pr[pl[1]].xs(scen_ix,level=1).rename('Receive Pressure')
    ActualFlow = (mGDA.gdata.pplineK[pl]*np.sqrt(Sp**2-Rp**2)).rename('Actual Flow')
    Error      = np.abs(ActualFlow-Flow).rename('Error')
    dP         = Sp-Rp.rename('PressureLoss')
    Lpack_inj  = (qin_sr-qout_sr).rename('Lpackinj')
    Temp=pd.concat([Lpack_inj,dLpack,Lpack,qin_sr,qout_sr,Flow,Sp,Rp,dP,Flow,ActualFlow,Error
                ],axis=1)   
    Pipelines[pl]=Temp
    
    Flow_Errors.loc[:,'Temp']=Error.values
    Flow_Errors=Flow_Errors.rename(index=str, columns={'Temp': pl})
    
    SP.loc[:,'Temp']=Sp.values
    SP=SP.rename(index=str, columns={'Temp': pl})
    
    RP.loc[:,'Temp']=Rp.values
    RP=RP.rename(index=str, columns={'Temp': pl})





#Flow_Errors.plot()
#print(Pipelines[mGDA.gdata.pplineorder[0]]['Send Pressure'])
    
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




print ('########################################################')
print ('Gas dispatch day-ahead - Solved')
print ('########################################################')




class ElecRT():
    '''
    Real-time electricity system dispatch
    '''
    
    def __init__(self,dispatchElecDA,comp=False):
        '''
        '''        
        self.edata = expando()
        self.variables = expando()
        self.variables.primal={}
        self.constraints = {}
        self.results = expando()

        self._load_ElecData()
        if comp==False:
            self._build_model(dispatchElecDA)
        elif comp==True:
            self._build_CP_model(dispatchElecDA)
            
        
    def optimize(self):
        self.model.optimize()
    
    def _load_ElecData(self):     
        ElecData_Load._load_network(self)  
        ElecData_Load._load_generator_data(self)
        ElecData_Load._load_wind_data(self)         
        ElecData_Load._load_initial_data(self)
        
        ElecData_Load._combine_wind_gprt_scenarios(self)
        
        ElecData_Load._load_SCinfo(self)
        
        
    def get_results(self):       
        GetResults._results_elecRT(self)
        
    def _build_model(self, dispatchElecDA):
        self.model = gb.Model()        
        self.comp = False
        mtype = 'RealTime'      # 'Market type' = {Stoch, RealTime}
        
        
        LibVars._build_variables_elecRT(self,mtype)        
        LibCns_Elec._build_constraints_elecRT(self,mtype,dispatchElecDA)       
        LibObjFunct._build_objective_ElecRT(self)
        
        self.model.update()

    def _build_CP_model(self, dispatchElecDA):
        self.model = gb.Model()        
        self.comp = True
        mtype = 'RealTime'      # 'Market type' = {Stoch, RealTime}
        
        
        LibVars._build_variables_elecRT(self,mtype)        
        LibCns_Elec._build_constraints_elecRT(self,mtype,dispatchElecDA)       
        LibObjFunct._build_objective_ElecRT(self)
        
        self.model.update()
        
        KKTizer._complementarity_model(self)
        
        LibVars._build_dummy_objective_var(self)
        LibObjFunct._build_objective_dummy_complementarity(self)
        
        self.model.Params.MIPFocus=1
        self.model.Params.timelimit = 10.0
        self.model.update()
        

mERT = ElecRT(dispatchElecDA)

mERT.optimize()
print ('########################################################')
print ('Electricity Real-time dispatch - Solved')
print ('########################################################')


mERT.get_results()


dispatchElecRT = expando()
dispatchElecRT.RUp = mERT.results.RUp
dispatchElecRT.RDn = mERT.results.RDn
dispatchElecRT.RUpSC = mERT.results.RUpSC
dispatchElecRT.RDnSC = mERT.results.RDnSC
dispatchElecRT.Lshed = mERT.results.Lshed
dispatchElecRT.Wspill = mERT.results.Wspill

dispatchElecRT.windscenprob=mERT.edata.windscenprob
dispatchElecRT.windscenarios=mERT.edata.windscen_index



mERT_COMP= ElecRT(dispatchElecDA,comp=True)
mERT_COMP.optimize()

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


class GasRT():
    '''
    Real-time gas system dispatch
    '''
    
    def __init__(self, dispatchGasDA,dispatchElecRT,f2d,comp=False):
        '''
        '''
        self.gdata = expando()
        self.edata = expando()
        self.variables = expando()
        self.variables.primal={}
        self.constraints = {}
        self.results = expando()

        self._load_data(f2d,dispatchElecRT)
        
        if comp==False:
            self._build_model(dispatchGasDA,dispatchElecRT)
        elif comp==True:
            self._build_CP_model(dispatchGasDA,dispatchElecRT)

    def optimize(self):
        self.model.optimize()
        
    def get_results(self,f2d):
        GetResults._results_gasRT(self,f2d)
        
    def get_duals(self,f2d):
        GetResults._results_duals(self,f2d)

    def _load_data(self,f2d,dispatchElecRT):
        GasData_Load._load_gas_network(self,f2d)              
        GasData_Load._load_wells_data(self)
        GasData_Load._load_gasload(self)
        GasData_Load._load_gas_storage(self)
        GasData_Load._load_scenarios(self,dispatchElecRT)
        
        GasData_Load._load_SCinfo(self)          
#        GasData_Load._ActiveSCinfo(self,dispatchElecDA)  
       
#        self.gdata.time=['t1','t2']
#        self.gdata.scenarios=['s1','s2']
        
    def _build_model(self,dispatchGasDA,dispatchElecRT):
        self.model = gb.Model()
        self.comp=False
        mtype = 'RealTime' 
        
        LibVars._build_variables_gasRT(self,mtype,dispatchElecRT)    
        LibCns_Gas._build_constraints_gasRT(self,dispatchGasDA,dispatchElecRT)
       
        LibObjFunct._build_objective_gasRT(self)
        
        self.model.update()
        
    def _build_CP_model(self,dispatchGasDA,dispatchElecRT):
        self.model = gb.Model()
        self.comp=True
        mtype = 'RealTime' 
        
        LibVars._build_variables_gasRT(self,mtype,dispatchElecRT)    
        LibCns_Gas._build_constraints_gasRT(self,dispatchGasDA,dispatchElecRT)
       
        LibObjFunct._build_objective_gasRT(self)
        
        self.model.update()
        
        KKTizer._complementarity_model(self)
        
        LibVars._build_dummy_objective_var(self)
        LibObjFunct._build_objective_dummy_complementarity(self)
        
        self.model.Params.MIPFocus=1
        self.model.Params.timelimit = 10.0
        #self.model.Params.PreSOS1BigM=1e3
        self.model.update()


#for t in mERT.edata.time:
#    s1_res=dispatchElecRT.RDn['g1'][t,'s1']
#    s2_res=dispatchElecRT.RDn['g1'][t,'s2']
#    
#    dispatchElecRT.RDn['g1'][t,'s1']=s1_res
#    dispatchElecRT.RDn['g1'][t,'s2']=s1_res
#    
#
pickle.dump( dispatchGasDA, open( "dispatchGasDA.p", "wb" ) )
pickle.dump( dispatchElecRT, open( "dispatchElecRT.p", "wb" ) )

mGRT = GasRT(dispatchGasDA,dispatchElecRT,f2d)
mGRT.optimize()

if mGRT.model.Status==2:
    print ('########################################################')
    print ('Gas Real-time dispatch - Solved')
    print ('########################################################')
    mGRT.get_results(f2d)
    #mGRT.get_duals(f2d)
    mGRT.model.write('LPModels/mGRT.lp')

    dispatchGasRT = expando()
    dispatchGasRT.gprodUp = mGRT.results.gprodUp
    dispatchGasRT.gprodDn = mGRT.results.gprodDn
    dispatchGasRT.gshed = mGRT.results.gshed
else:
    mGRT.model.computeIIS()
    mGRT.model.write('LPModels/mGRT.ilp')
    

mGRT_COMP = GasRT(dispatchGasDA,dispatchElecRT,f2d,comp=True)
#mGRT_COMP.optimize() 
mGRT_COMP.model.write('LPModels/mGRT_COMP.lp')
       

if mGRT_COMP.model.Status==2:
    print ('########################################################')
    print ('Gas COMP Real-time dispatch - Solved')
    print ('########################################################')
    mGRT_COMP.get_results(f2d)
       


#Var_Duals=pd.Series(mGRT.results.duals_var)
#re.sub(r'\(.*\)', '', 'stuff(remove(me))')
#Allduals=set([re.sub(r'\(.*\)', '', x) for x in Var_Duals.index])


#Con_Duals=pd.Series(mGRT.results.duals_con)






RUp_gfpp = dispatchElecRT.RUpSC.add(dispatchElecRT.RUp.loc[:, mGDA.gdata.gfpp]) 
RDn_gfpp = dispatchElecRT.RDnSC.add(dispatchElecRT.RDn.loc[:, mGDA.gdata.gfpp]) 
HR=mGDA.gdata.generatorinfo.HR

Rgfpp = RUp_gfpp - RDn_gfpp
for g in  mGDA.gdata.gfpp:
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
   
   
   