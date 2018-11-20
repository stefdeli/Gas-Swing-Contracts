# -*- coding: utf-8 -*-
"""
Created on Mon Sep 24 15:49:31 2018

Market clearing with Gas Swing contracts

@author: delikars
E"""

import GasData_Load, ElecData_Load
import modelObjects
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




mSEDA = modelObjects.StochElecDA(bilevel=True)
dispatchElecDA=mSEDA.optimize()

mSEDA_COMP = modelObjects.StochElecDA(comp=True,bilevel=True)
mSEDA_COMP.optimize()

# flow2dir = True : Bi-directional flow on gas pipelines
# flow2dir = False: Uni-directional flow on gas pipelines (from sending to receiving node)

f2d = False

mGDA = modelObjects.GasDA(dispatchElecDA,f2d)
dispatchGasDA=mGDA.optimize()

mGDA_COMP = modelObjects.GasDA(dispatchElecDA,f2d,comp=True)
mGDA_COMP.optimize()

mERT = modelObjects.ElecRT(dispatchElecDA,bilevel=True)
dispatchElecRT=mERT.optimize()
   
mERT_COMP = modelObjects.ElecRT(dispatchElecDA,comp=True,bilevel=True)
mERT_COMP.optimize()

mGRT = modelObjects.GasRT(dispatchGasDA,dispatchElecRT,f2d)
mGRT.optimize()

mGRT_COMP = modelObjects.GasRT(dispatchGasDA,dispatchElecRT,f2d,comp=True)
mGRT_COMP.optimize() 





Res=[]
for i in range(40):

    SCdata=pd.read_csv(defaults.SCdata)
    SCdata.lambdaC=i
    SCdata.to_csv(defaults.SCdata)
    
    mSEDA = modelObjects.StochElecDA(bilevel=False)
    dispatchElecDA=mSEDA.optimize()
    
    f2d = False
    
    mGDA = modelObjects.GasDA(dispatchElecDA,f2d)
    dispatchGasDA=mGDA.optimize()
    
    mERT = modelObjects.ElecRT(dispatchElecDA,bilevel=True)
    dispatchElecRT=mERT.optimize()
    
    mGRT = modelObjects.GasRT(dispatchGasDA,dispatchElecRT,f2d)
    dispatchGasRT=mGRT.optimize()
    
    PSC=dispatchElecDA.PgenSC['g1'].sum()
    Cost = mGDA.model.ObjVal
    
    #Income = 
    
    Res.append(mGDA.model.ObjVal+mGRT.model.ObjVal)



