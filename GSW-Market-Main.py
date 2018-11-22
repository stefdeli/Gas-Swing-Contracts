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
import matplotlib.pyplot as plt



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

dispatchElecDA.Pgen.at['t1','g1']=33.6
dispatchElecDA.Pgen.at['t2','g1']=33.6
dispatchElecDA.Pgen.at['t3','g1']=36.93
dispatchElecDA.Pgen.at['t4','g1']=37.79

dispatchElecDA.PgenSC.at['t1','g1']=10.0
dispatchElecDA.PgenSC.at['t2','g1']=10.0
dispatchElecDA.PgenSC.at['t3','g1']=10.0
dispatchElecDA.PgenSC.at['t4','g1']=10.0

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
#

#






