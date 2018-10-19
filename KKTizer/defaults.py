#filepath = 'Data-RT96-UW/3_Areas_AggregatedUnits'
#filepath = 'Data-RT96-UW/3_Areas'
filepath = 'Data-RT96-UW/2_Areas_AggregatedUnits'
#filepath = 'Data-RT96-UW/2_Areas'
#filepath = 'Data-2bus'

nodefile = filepath + '/buses.csv'
linefile = filepath + '/lines_allAC.csv'
generatorfile = filepath + '/generators.csv'

#wind_scenario_file = 'Data-14bus/wind_scenarios.csv'
WindScen_file = filepath + '/WindScen.csv'
WindScenProb_file = filepath + '/WindScenProb.csv'
windfarms_file = filepath + '/windfarms.csv'

#load_file = 'Data-14bus/load.csv'
load_file = filepath + '/load_1period.csv'

VOLL = 1000
