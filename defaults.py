#folder='Data/IntegratedMarketStochastic'
folder='Data/SimpleNetwork_ImperialUnitsActual'
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
WindScenProb_file = filepath_elec + '/WindScenProb.csv'
windfarms_file = filepath_elec + '/windfarms.csv'

eload_file = filepath_elec + '/elec_load.csv'

SCdata = filepath_elec + '/SCinfo.csv'
# Contracts that need the price to be decided
SCdata_NoPrice_IN = filepath_elec + '/SCinfo_NoPrice_IN.csv'
SCdata_NoPrice_OUT = filepath_elec + '/SCinfo_NoPrice_OUT.csv'


GasPriceDA_file = filepath_elec + '/GasPriceDA.csv'
GasPriceScenRT_file = filepath_elec + '/GasPriceScenRT.csv'
GasPriceScenRTprob_file = filepath_elec + '/GasPriceScenRT_prob.csv'

VOLL = 1000 # Value of Lost Load

EPS = 0e-1 # Pressure difference weight in gas objective
GasSlack = 'None'# 'None', 'FixInput', 'FixOutput', 'ConstantOutput'

# The final line pack deviatons that is allowed, i.e. +/- 10% of the initial
FINAL_LP_DEV=0.1 # 0.1 = 10%

# Premium for deployment of reserves NON-GAS generators
RESERVES_UP_PREMIUM_NONGAS = 1.0#1.05
RESERVES_DN_PREMIUM_NONGAS = 1.0 #0.95

# Premium for deployment of reserves GAS generators
RESERVES_UP_PREMIUM_GAS = 1.02 #1.05
RESERVES_DN_PREMIUM_GAS = 0.97 #0.95

# Premium for deployment of reserves contracted GAS generators
RESERVES_UP_PREMIUM_GAS_SC = 1.0#1.05
RESERVES_DN_PREMIUM_GAS_SC = 1.0 #0.95

# Premium for up/down deployment of gas wells
RESERVES_UP_PREMIUM_GASWELL = 1.0#1.05
RESERVES_DN_PREMIUM_GASWELL = 1.0#0.95

# Remove equality constraints and replace lhs==rhs with lhs<=rhs and lhs>=rhs
REMOVE_EQUALITY=False

# show the Gurobi output:True of False
GUROBI_OUTPUT=False

# HOw should the gas network be modelled: FlowBased or WeymouthApprox
GasNetwork='FlowBased'
#GasNetwork='WeymouthApprox'
ChangeTime=True
Time=['t'+str(i+1) for i in range(1)]

# Epsilon to keep contract price down
EPS_CONTRACT=1e-3

# How to model the gas price
# Option 1: a(g+rup-rdn)**2 + b*(g+rup-rdn)
# Option 2: a(g+rup)**2 + b*(g+rup) + a(g-rdn)**2 + b*(g-rdn) 
GASCOSTMODEL=1

# Choose what to limit for contract valuation
# Option 1: 'mSEDACost'
# Option 2: 'Profit' Gas System Profit
LIMIT='mSEDACost'

# Choose how many wind scenarios to include in model
NO_WIND_SCEN=2

# HOw much the low and high real time prices should be relative to the medium
GASRT_LOW=0.8
GASRT_HIGH=1.2
