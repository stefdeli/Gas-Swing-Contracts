#folder='Data/IntegratedMarketStochastic'
folder='Data/SimpleNetwork_ImperialUnits'
#folder='Data/SimpleNetwork_ImperialUnits_snapshot'



filepath_gas = folder+'/GasData'
filepath_elec = folder+'/ElecData'

# Comment
bigM = 1e5

## Gas System Data
gnodefile = filepath_gas + '/GasNodes.csv'
pipelinefile = filepath_gas + '/GasNetwork.csv'
wellsfile = filepath_gas + '/GasWells.csv'
gload_file = filepath_gas + '/GasLoad.csv'
gstoragefile = filepath_gas + '/GasStorage.csv'

# Number of fixed pressure points used for Weymooth outer approximation
Nfxpoints = 10

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

VOLL = 10000 # Value of Lost Load

EPS = 1e-0 # Pressure difference weight in gas objective
GasSlack = 'None'# 'None', 'FixInput', 'FixOutput', 'ConstantOutput'


# The final line pack deviatons that is allowed, i.e. +/- 10% of the initial
FINAL_LP_DEV=0.1 # 0.1 = 10%

# Premium for deployment of reserves 
RESERVES_UP_PREMIUM = 1.1
RESERVES_DN_PREMIUM = 0.95

# Remove equality constraints and replace lhs==rhs with lhs<=rhs and lhs>=rhs
REMOVE_EQUALITY=False

GUROBI_OUTPUT=False