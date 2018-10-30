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

class expando(object):
    pass

f2d=False


dispatchGasDA=pickle.load( open( "dispatchGasDA.p", "rb" ) )
dispatchElecRT=pickle.load( open( "dispatchElecRT.p", "rb" ) )

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



## Switch results
#for t in mERT.edata.time:
#    s1_res=dispatchElecRT.RDn['g1'][t,'s1']
#    s2_res=dispatchElecRT.RDn['g1'][t,'s2']
#    
#    dispatchElecRT.RDn['g1'][t,'s1']=s1_res
#    dispatchElecRT.RDn['g1'][t,'s2']=s1_res

###############################################################################
#                           PRIMAL        
#        
###############################################################################

mGRT = GasRT(dispatchGasDA,dispatchElecRT,f2d)
mGRT.optimize()

if mGRT.model.Status==2:
    print ('########################################################')
    print ('Gas Real-time dispatch - Solved')
    print ('########################################################')
    mGRT.get_results(f2d)
    mGRT.get_duals(f2d)
    mGRT.model.write('LPModels/mGRT.lp')

    dispatchGasRT = expando()
    dispatchGasRT.gprodUp = mGRT.results.gprodUp
    dispatchGasRT.gprodDn = mGRT.results.gprodDn
    dispatchGasRT.gshed = mGRT.results.gshed
else:
    mGRT.model.computeIIS()
    mGRT.model.write('LPModels/mGRT.ilp')
    
###############################################################################
#                           COMP       
#        
###############################################################################
mGRT_COMP = GasRT(dispatchGasDA,dispatchElecRT,f2d,comp=True)
mGRT_COMP.optimize() 
mGRT_COMP.model.write('LPModels/mGRT_COMP.lp')
       

if mGRT_COMP.model.Status==2:
    print ('########################################################')
    print ('Gas COMP Real-time dispatch - Solved')
    print ('########################################################')
    mGRT_COMP.get_results(f2d)
   


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
        
        Temp=pd.concat([Gwells,-NetFlowTo,NetFlowAway,-Gen,Lshed,Var_flow_away.rename('RT_out'),Var_flow_to.rename('RT_IN'),Par_flow_away.rename('DA_out'),Par_flow_to.rename('DA_IN')],axis=1)
        Scens[s]=Temp.transpose()
    Nodal_Balance[ng]=Scens
    
    
    
#Var_Duals=pd.Series(mGRT.results.duals_var)
#re.sub(r'\(.*\)', '', 'stuff(remove(me))')
#Allduals=set([re.sub(r'\(.*\)', '', x) for x in Var_Duals.index])


#Con_Duals=pd.Series(mGRT.results.duals_con)
