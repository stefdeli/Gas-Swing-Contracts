filepath_gas = 'Data/SimpleNetwork/GasData'
filepath_elec = 'Data/SimpleNetwork/ElecData'


bigM = 1e4

## Gas System Data
gnodefile = filepath_gas + '/GasNodes.csv'
pipelinefile = filepath_gas + '/GasNetwork.csv'
wellsfile = filepath_gas + '/GasWells.csv'
gload_file = filepath_gas + '/GasLoad.csv'
gstoragefile = filepath_gas + '/GasStorage.csv'

# Number of fixed pressure points used for Weymooth outer approximation
Nfxpoints = 4 

## Electricity System Data

nodefile = filepath_elec + '/buses.csv'
linefile = filepath_elec + '/lines.csv'
generatorfile = filepath_elec + '/generators.csv'

WindScen_file = filepath_elec + '/WindScenarios'
#WindScenProb_file = filepath + '/WindScenProb.csv'
windfarms_file = filepath_elec + '/windfarms.csv'

eload_file = filepath_elec + '/elec_load.csv'

SCdata = filepath_elec + '/SCinfo.csv'

GasPriceDA_file = filepath_elec + '/GasPriceDA.csv'
GasPriceScenRT_file = filepath_elec + '/GasPriceScenRT.csv'
GasPriceScenRTprob_file = filepath_elec + '/GasPriceScenRT_prob.csv'

VOLL = 1000 # Value of Lost Load

# The final line pack deviatons that is allowed, i.e. +/- 10% of the initial
FINAL_LP_DEV=0.1 # 0.1 = 10%
