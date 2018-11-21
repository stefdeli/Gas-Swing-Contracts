\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  10000 gshed_da(ng101,k0,t1) + 10000 gshed_da(ng101,k1,t1)
   + 10000 gshed_da(ng101,k2,t1) + 10000 gshed_da(ng101,k0,t2)
   + 10000 gshed_da(ng101,k1,t2) + 10000 gshed_da(ng101,k2,t2)
   + 10000 gshed_da(ng101,k0,t3) + 10000 gshed_da(ng101,k1,t3)
   + 10000 gshed_da(ng101,k2,t3) + 10000 gshed_da(ng101,k0,t4)
   + 10000 gshed_da(ng101,k1,t4) + 10000 gshed_da(ng101,k2,t4)
   + 10000 gshed_da(ng102,k0,t1) + 10000 gshed_da(ng102,k1,t1)
   + 10000 gshed_da(ng102,k2,t1) + 10000 gshed_da(ng102,k0,t2)
   + 10000 gshed_da(ng102,k1,t2) + 10000 gshed_da(ng102,k2,t2)
   + 10000 gshed_da(ng102,k0,t3) + 10000 gshed_da(ng102,k1,t3)
   + 10000 gshed_da(ng102,k2,t3) + 10000 gshed_da(ng102,k0,t4)
   + 10000 gshed_da(ng102,k1,t4) + 10000 gshed_da(ng102,k2,t4)
   + 2 gprod(gw1,k0,t1) + 2 gprod(gw1,k0,t2) + 2 gprod(gw1,k0,t3)
   + 2 gprod(gw1,k0,t4) + 3 gprod(gw2,k0,t1) + 3 gprod(gw2,k0,t2)
   + 3 gprod(gw2,k0,t3) + 3 gprod(gw2,k0,t4) + 4 gprod(gw3,k0,t1)
   + 4 gprod(gw3,k0,t2) + 4 gprod(gw3,k0,t3) + 4 gprod(gw3,k0,t4)
   + 2.1 gsin(gs1,t1,k0) + 2.1 gsout(gs1,t1,k0) + 2.1 gsin(gs1,t2,k0)
   + 2.1 gsout(gs1,t2,k0) + 2.1 gsin(gs1,t3,k0) + 2.1 gsout(gs1,t3,k0)
   + 2.1 gsin(gs1,t4,k0) + 2.1 gsout(gs1,t4,k0)
Subject To
 gshed_da_max(ng101,k0,t1): gshed_da(ng101,k0,t1) <= 0
 gshed_da_max(ng101,k1,t1): gshed_da(ng101,k1,t1) <= 0
 gshed_da_max(ng101,k2,t1): gshed_da(ng101,k2,t1) <= 0
 gshed_da_max(ng101,k0,t2): gshed_da(ng101,k0,t2) <= 0
 gshed_da_max(ng101,k1,t2): gshed_da(ng101,k1,t2) <= 0
 gshed_da_max(ng101,k2,t2): gshed_da(ng101,k2,t2) <= 0
 gshed_da_max(ng101,k0,t3): gshed_da(ng101,k0,t3) <= 0
 gshed_da_max(ng101,k1,t3): gshed_da(ng101,k1,t3) <= 0
 gshed_da_max(ng101,k2,t3): gshed_da(ng101,k2,t3) <= 0
 gshed_da_max(ng101,k0,t4): gshed_da(ng101,k0,t4) <= 0
 gshed_da_max(ng101,k1,t4): gshed_da(ng101,k1,t4) <= 0
 gshed_da_max(ng101,k2,t4): gshed_da(ng101,k2,t4) <= 0
 gshed_da_max(ng102,k0,t1): gshed_da(ng102,k0,t1) <= 0
 gshed_da_max(ng102,k1,t1): gshed_da(ng102,k1,t1) <= 0
 gshed_da_max(ng102,k2,t1): gshed_da(ng102,k2,t1) <= 0
 gshed_da_max(ng102,k0,t2): gshed_da(ng102,k0,t2) <= 0
 gshed_da_max(ng102,k1,t2): gshed_da(ng102,k1,t2) <= 0
 gshed_da_max(ng102,k2,t2): gshed_da(ng102,k2,t2) <= 0
 gshed_da_max(ng102,k0,t3): gshed_da(ng102,k0,t3) <= 0
 gshed_da_max(ng102,k1,t3): gshed_da(ng102,k1,t3) <= 0
 gshed_da_max(ng102,k2,t3): gshed_da(ng102,k2,t3) <= 0
 gshed_da_max(ng102,k0,t4): gshed_da(ng102,k0,t4) <= 0
 gshed_da_max(ng102,k1,t4): gshed_da(ng102,k1,t4) <= 0
 gshed_da_max(ng102,k2,t4): gshed_da(ng102,k2,t4) <= 0
 gas_balance_da(ng101,k0,t1): - qin_sr(('ng101','ng102'),k0,t1)
   + gprod(gw1,k0,t1) + gprod(gw2,k0,t1) + gprod(gw3,k0,t1) = 0
 gas_balance_da(ng101,k1,t1): - qin_sr(('ng101','ng102'),k1,t1)
   + gprod(gw1,k1,t1) + gprod(gw2,k1,t1) + gprod(gw3,k1,t1) = 0
 gas_balance_da(ng101,k2,t1): - qin_sr(('ng101','ng102'),k2,t1)
   + gprod(gw1,k2,t1) + gprod(gw2,k2,t1) + gprod(gw3,k2,t1) = 0
 gas_balance_da(ng102,k0,t1): qout_sr(('ng101','ng102'),k0,t1)
   - gsin(gs1,t1,k0) + gsout(gs1,t1,k0) = 400
 gas_balance_da(ng102,k1,t1): qout_sr(('ng101','ng102'),k1,t1)
   - gsin(gs1,t1,k1) + gsout(gs1,t1,k1) = 400
 gas_balance_da(ng102,k2,t1): qout_sr(('ng101','ng102'),k2,t1)
   - gsin(gs1,t1,k2) + gsout(gs1,t1,k2) = 320
 gas_balance_da(ng101,k0,t2): - qin_sr(('ng101','ng102'),k0,t2)
   + gprod(gw1,k0,t2) + gprod(gw2,k0,t2) + gprod(gw3,k0,t2) = 0
 gas_balance_da(ng101,k1,t2): - qin_sr(('ng101','ng102'),k1,t2)
   + gprod(gw1,k1,t2) + gprod(gw2,k1,t2) + gprod(gw3,k1,t2) = 0
 gas_balance_da(ng101,k2,t2): - qin_sr(('ng101','ng102'),k2,t2)
   + gprod(gw1,k2,t2) + gprod(gw2,k2,t2) + gprod(gw3,k2,t2) = 0
 gas_balance_da(ng102,k0,t2): qout_sr(('ng101','ng102'),k0,t2)
   - gsin(gs1,t2,k0) + gsout(gs1,t2,k0) = 410.35276184
 gas_balance_da(ng102,k1,t2): qout_sr(('ng101','ng102'),k1,t2)
   - gsin(gs1,t2,k1) + gsout(gs1,t2,k1) = 410.35276184
 gas_balance_da(ng102,k2,t2): qout_sr(('ng101','ng102'),k2,t2)
   - gsin(gs1,t2,k2) + gsout(gs1,t2,k2) = 330.35276184
 gas_balance_da(ng101,k0,t3): - qin_sr(('ng101','ng102'),k0,t3)
   + gprod(gw1,k0,t3) + gprod(gw2,k0,t3) + gprod(gw3,k0,t3) = 0
 gas_balance_da(ng101,k1,t3): - qin_sr(('ng101','ng102'),k1,t3)
   + gprod(gw1,k1,t3) + gprod(gw2,k1,t3) + gprod(gw3,k1,t3) = 0
 gas_balance_da(ng101,k2,t3): - qin_sr(('ng101','ng102'),k2,t3)
   + gprod(gw1,k2,t3) + gprod(gw2,k2,t3) + gprod(gw3,k2,t3) = 0
 gas_balance_da(ng102,k0,t3): qout_sr(('ng101','ng102'),k0,t3)
   - gsin(gs1,t3,k0) + gsout(gs1,t3,k0) = 420
 gas_balance_da(ng102,k1,t3): qout_sr(('ng101','ng102'),k1,t3)
   - gsin(gs1,t3,k1) + gsout(gs1,t3,k1) = 420
 gas_balance_da(ng102,k2,t3): qout_sr(('ng101','ng102'),k2,t3)
   - gsin(gs1,t3,k2) + gsout(gs1,t3,k2) = 340
 gas_balance_da(ng101,k0,t4): - qin_sr(('ng101','ng102'),k0,t4)
   + gprod(gw1,k0,t4) + gprod(gw2,k0,t4) + gprod(gw3,k0,t4) = 0
 gas_balance_da(ng101,k1,t4): - qin_sr(('ng101','ng102'),k1,t4)
   + gprod(gw1,k1,t4) + gprod(gw2,k1,t4) + gprod(gw3,k1,t4) = 0
 gas_balance_da(ng101,k2,t4): - qin_sr(('ng101','ng102'),k2,t4)
   + gprod(gw1,k2,t4) + gprod(gw2,k2,t4) + gprod(gw3,k2,t4) = 0
 gas_balance_da(ng102,k0,t4): qout_sr(('ng101','ng102'),k0,t4)
   - gsin(gs1,t4,k0) + gsout(gs1,t4,k0) = 428.28427128
 gas_balance_da(ng102,k1,t4): qout_sr(('ng101','ng102'),k1,t4)
   - gsin(gs1,t4,k1) + gsout(gs1,t4,k1) = 428.28427128
 gas_balance_da(ng102,k2,t4): qout_sr(('ng101','ng102'),k2,t4)
   - gsin(gs1,t4,k2) + gsout(gs1,t4,k2) = 348.28427128
 gprod_max(gw1,k0,t1): gprod(gw1,k0,t1) <= 100
 gprod_max(gw1,k0,t2): gprod(gw1,k0,t2) <= 100
 gprod_max(gw1,k0,t3): gprod(gw1,k0,t3) <= 100
 gprod_max(gw1,k0,t4): gprod(gw1,k0,t4) <= 100
 gprod_max(gw1,k1,t1): gprod(gw1,k1,t1) <= 100
 gprod_max(gw1,k1,t2): gprod(gw1,k1,t2) <= 100
 gprod_max(gw1,k1,t3): gprod(gw1,k1,t3) <= 100
 gprod_max(gw1,k1,t4): gprod(gw1,k1,t4) <= 100
 gprod_max(gw1,k2,t1): gprod(gw1,k2,t1) <= 100
 gprod_max(gw1,k2,t2): gprod(gw1,k2,t2) <= 100
 gprod_max(gw1,k2,t3): gprod(gw1,k2,t3) <= 100
 gprod_max(gw1,k2,t4): gprod(gw1,k2,t4) <= 100
 gprod_max(gw2,k0,t1): gprod(gw2,k0,t1) <= 250
 gprod_max(gw2,k0,t2): gprod(gw2,k0,t2) <= 250
 gprod_max(gw2,k0,t3): gprod(gw2,k0,t3) <= 250
 gprod_max(gw2,k0,t4): gprod(gw2,k0,t4) <= 250
 gprod_max(gw2,k1,t1): gprod(gw2,k1,t1) <= 250
 gprod_max(gw2,k1,t2): gprod(gw2,k1,t2) <= 250
 gprod_max(gw2,k1,t3): gprod(gw2,k1,t3) <= 250
 gprod_max(gw2,k1,t4): gprod(gw2,k1,t4) <= 250
 gprod_max(gw2,k2,t1): gprod(gw2,k2,t1) <= 250
 gprod_max(gw2,k2,t2): gprod(gw2,k2,t2) <= 250
 gprod_max(gw2,k2,t3): gprod(gw2,k2,t3) <= 250
 gprod_max(gw2,k2,t4): gprod(gw2,k2,t4) <= 250
 gprod_max(gw3,k0,t1): gprod(gw3,k0,t1) <= 500
 gprod_max(gw3,k0,t2): gprod(gw3,k0,t2) <= 500
 gprod_max(gw3,k0,t3): gprod(gw3,k0,t3) <= 500
 gprod_max(gw3,k0,t4): gprod(gw3,k0,t4) <= 500
 gprod_max(gw3,k1,t1): gprod(gw3,k1,t1) <= 500
 gprod_max(gw3,k1,t2): gprod(gw3,k1,t2) <= 500
 gprod_max(gw3,k1,t3): gprod(gw3,k1,t3) <= 500
 gprod_max(gw3,k1,t4): gprod(gw3,k1,t4) <= 500
 gprod_max(gw3,k2,t1): gprod(gw3,k2,t1) <= 500
 gprod_max(gw3,k2,t2): gprod(gw3,k2,t2) <= 500
 gprod_max(gw3,k2,t3): gprod(gw3,k2,t3) <= 500
 gprod_max(gw3,k2,t4): gprod(gw3,k2,t4) <= 500
 gflow_sr_io(('ng101','ng102'),k0,t1): gflow_sr(('ng101','ng102'),k0,t1)
   - 0.5 qin_sr(('ng101','ng102'),k0,t1)
   - 0.5 qout_sr(('ng101','ng102'),k0,t1) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t1): gflow_sr(('ng101','ng102'),k0,t1)
   <= 4000
 Flow_Bal(('ng101','ng102'),k0,t1): qin_sr(('ng101','ng102'),k0,t1)
   - qout_sr(('ng101','ng102'),k0,t1) = 0
 gflow_sr_io(('ng101','ng102'),k1,t1): gflow_sr(('ng101','ng102'),k1,t1)
   - 0.5 qin_sr(('ng101','ng102'),k1,t1)
   - 0.5 qout_sr(('ng101','ng102'),k1,t1) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t1): gflow_sr(('ng101','ng102'),k1,t1)
   <= 4000
 Flow_Bal(('ng101','ng102'),k1,t1): qin_sr(('ng101','ng102'),k1,t1)
   - qout_sr(('ng101','ng102'),k1,t1) = 0
 gflow_sr_io(('ng101','ng102'),k2,t1): gflow_sr(('ng101','ng102'),k2,t1)
   - 0.5 qin_sr(('ng101','ng102'),k2,t1)
   - 0.5 qout_sr(('ng101','ng102'),k2,t1) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t1): gflow_sr(('ng101','ng102'),k2,t1)
   <= 4000
 Flow_Bal(('ng101','ng102'),k2,t1): qin_sr(('ng101','ng102'),k2,t1)
   - qout_sr(('ng101','ng102'),k2,t1) = 0
 gflow_sr_io(('ng101','ng102'),k0,t2): gflow_sr(('ng101','ng102'),k0,t2)
   - 0.5 qin_sr(('ng101','ng102'),k0,t2)
   - 0.5 qout_sr(('ng101','ng102'),k0,t2) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t2): gflow_sr(('ng101','ng102'),k0,t2)
   <= 4000
 Flow_Bal(('ng101','ng102'),k0,t2): qin_sr(('ng101','ng102'),k0,t2)
   - qout_sr(('ng101','ng102'),k0,t2) = 0
 gflow_sr_io(('ng101','ng102'),k1,t2): gflow_sr(('ng101','ng102'),k1,t2)
   - 0.5 qin_sr(('ng101','ng102'),k1,t2)
   - 0.5 qout_sr(('ng101','ng102'),k1,t2) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t2): gflow_sr(('ng101','ng102'),k1,t2)
   <= 4000
 Flow_Bal(('ng101','ng102'),k1,t2): qin_sr(('ng101','ng102'),k1,t2)
   - qout_sr(('ng101','ng102'),k1,t2) = 0
 gflow_sr_io(('ng101','ng102'),k2,t2): gflow_sr(('ng101','ng102'),k2,t2)
   - 0.5 qin_sr(('ng101','ng102'),k2,t2)
   - 0.5 qout_sr(('ng101','ng102'),k2,t2) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t2): gflow_sr(('ng101','ng102'),k2,t2)
   <= 4000
 Flow_Bal(('ng101','ng102'),k2,t2): qin_sr(('ng101','ng102'),k2,t2)
   - qout_sr(('ng101','ng102'),k2,t2) = 0
 gflow_sr_io(('ng101','ng102'),k0,t3): gflow_sr(('ng101','ng102'),k0,t3)
   - 0.5 qin_sr(('ng101','ng102'),k0,t3)
   - 0.5 qout_sr(('ng101','ng102'),k0,t3) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t3): gflow_sr(('ng101','ng102'),k0,t3)
   <= 4000
 Flow_Bal(('ng101','ng102'),k0,t3): qin_sr(('ng101','ng102'),k0,t3)
   - qout_sr(('ng101','ng102'),k0,t3) = 0
 gflow_sr_io(('ng101','ng102'),k1,t3): gflow_sr(('ng101','ng102'),k1,t3)
   - 0.5 qin_sr(('ng101','ng102'),k1,t3)
   - 0.5 qout_sr(('ng101','ng102'),k1,t3) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t3): gflow_sr(('ng101','ng102'),k1,t3)
   <= 4000
 Flow_Bal(('ng101','ng102'),k1,t3): qin_sr(('ng101','ng102'),k1,t3)
   - qout_sr(('ng101','ng102'),k1,t3) = 0
 gflow_sr_io(('ng101','ng102'),k2,t3): gflow_sr(('ng101','ng102'),k2,t3)
   - 0.5 qin_sr(('ng101','ng102'),k2,t3)
   - 0.5 qout_sr(('ng101','ng102'),k2,t3) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t3): gflow_sr(('ng101','ng102'),k2,t3)
   <= 4000
 Flow_Bal(('ng101','ng102'),k2,t3): qin_sr(('ng101','ng102'),k2,t3)
   - qout_sr(('ng101','ng102'),k2,t3) = 0
 gflow_sr_io(('ng101','ng102'),k0,t4): gflow_sr(('ng101','ng102'),k0,t4)
   - 0.5 qin_sr(('ng101','ng102'),k0,t4)
   - 0.5 qout_sr(('ng101','ng102'),k0,t4) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t4): gflow_sr(('ng101','ng102'),k0,t4)
   <= 4000
 Flow_Bal(('ng101','ng102'),k0,t4): qin_sr(('ng101','ng102'),k0,t4)
   - qout_sr(('ng101','ng102'),k0,t4) = 0
 gflow_sr_io(('ng101','ng102'),k1,t4): gflow_sr(('ng101','ng102'),k1,t4)
   - 0.5 qin_sr(('ng101','ng102'),k1,t4)
   - 0.5 qout_sr(('ng101','ng102'),k1,t4) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t4): gflow_sr(('ng101','ng102'),k1,t4)
   <= 4000
 Flow_Bal(('ng101','ng102'),k1,t4): qin_sr(('ng101','ng102'),k1,t4)
   - qout_sr(('ng101','ng102'),k1,t4) = 0
 gflow_sr_io(('ng101','ng102'),k2,t4): gflow_sr(('ng101','ng102'),k2,t4)
   - 0.5 qin_sr(('ng101','ng102'),k2,t4)
   - 0.5 qout_sr(('ng101','ng102'),k2,t4) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t4): gflow_sr(('ng101','ng102'),k2,t4)
   <= 4000
 Flow_Bal(('ng101','ng102'),k2,t4): qin_sr(('ng101','ng102'),k2,t4)
   - qout_sr(('ng101','ng102'),k2,t4) = 0
 gsinMax(gs1,t1,k0): gsin(gs1,t1,k0) <= 0
 gsoutMax(gs1,t1,k0): gsout(gs1,t1,k0) <= 0
 gstore_max(gs1,t1,k0): gstore(gs1,t1,k0) <= 0
 gstore_min(gs1,t1,k0): gstore(gs1,t1,k0) >= 0
 gsinMax(gs1,t2,k0): gsin(gs1,t2,k0) <= 0
 gsoutMax(gs1,t2,k0): gsout(gs1,t2,k0) <= 0
 gstore_max(gs1,t2,k0): gstore(gs1,t2,k0) <= 0
 gstore_min(gs1,t2,k0): gstore(gs1,t2,k0) >= 0
 gsinMax(gs1,t3,k0): gsin(gs1,t3,k0) <= 0
 gsoutMax(gs1,t3,k0): gsout(gs1,t3,k0) <= 0
 gstore_max(gs1,t3,k0): gstore(gs1,t3,k0) <= 0
 gstore_min(gs1,t3,k0): gstore(gs1,t3,k0) >= 0
 gsinMax(gs1,t4,k0): gsin(gs1,t4,k0) <= 0
 gsoutMax(gs1,t4,k0): gsout(gs1,t4,k0) <= 0
 gstore_max(gs1,t4,k0): gstore(gs1,t4,k0) <= 0
 gstore_min(gs1,t4,k0): gstore(gs1,t4,k0) >= 0
 gstor_def(gs1,k0,t2): - gstore(gs1,t1,k0) - gsin(gs1,t2,k0)
   + gsout(gs1,t2,k0) + gstore(gs1,t2,k0) = 0
 gstor_def(gs1,k0,t3): - gstore(gs1,t2,k0) - gsin(gs1,t3,k0)
   + gsout(gs1,t3,k0) + gstore(gs1,t3,k0) = 0
 gstor_def(gs1,k0,t4): - gstore(gs1,t3,k0) - gsin(gs1,t4,k0)
   + gsout(gs1,t4,k0) + gstore(gs1,t4,k0) = 0
 gstor_def(gs1,k0,t1): - gsin(gs1,t1,k0) + gsout(gs1,t1,k0)
   + gstore(gs1,t1,k0) = 0
 gsinMax(gs1,t1,k1): gsin(gs1,t1,k1) <= 0
 gsoutMax(gs1,t1,k1): gsout(gs1,t1,k1) <= 0
 gstore_max(gs1,t1,k1): gstore(gs1,t1,k1) <= 0
 gstore_min(gs1,t1,k1): gstore(gs1,t1,k1) >= 0
 gsinMax(gs1,t2,k1): gsin(gs1,t2,k1) <= 0
 gsoutMax(gs1,t2,k1): gsout(gs1,t2,k1) <= 0
 gstore_max(gs1,t2,k1): gstore(gs1,t2,k1) <= 0
 gstore_min(gs1,t2,k1): gstore(gs1,t2,k1) >= 0
 gsinMax(gs1,t3,k1): gsin(gs1,t3,k1) <= 0
 gsoutMax(gs1,t3,k1): gsout(gs1,t3,k1) <= 0
 gstore_max(gs1,t3,k1): gstore(gs1,t3,k1) <= 0
 gstore_min(gs1,t3,k1): gstore(gs1,t3,k1) >= 0
 gsinMax(gs1,t4,k1): gsin(gs1,t4,k1) <= 0
 gsoutMax(gs1,t4,k1): gsout(gs1,t4,k1) <= 0
 gstore_max(gs1,t4,k1): gstore(gs1,t4,k1) <= 0
 gstore_min(gs1,t4,k1): gstore(gs1,t4,k1) >= 0
 gstor_def(gs1,k1,t2): - gstore(gs1,t1,k1) - gsin(gs1,t2,k1)
   + gsout(gs1,t2,k1) + gstore(gs1,t2,k1) = 0
 gstor_def(gs1,k1,t3): - gstore(gs1,t2,k1) - gsin(gs1,t3,k1)
   + gsout(gs1,t3,k1) + gstore(gs1,t3,k1) = 0
 gstor_def(gs1,k1,t4): - gstore(gs1,t3,k1) - gsin(gs1,t4,k1)
   + gsout(gs1,t4,k1) + gstore(gs1,t4,k1) = 0
 gstor_def(gs1,k1,t1): - gsin(gs1,t1,k1) + gsout(gs1,t1,k1)
   + gstore(gs1,t1,k1) = 0
 gsinMax(gs1,t1,k2): gsin(gs1,t1,k2) <= 0
 gsoutMax(gs1,t1,k2): gsout(gs1,t1,k2) <= 0
 gstore_max(gs1,t1,k2): gstore(gs1,t1,k2) <= 0
 gstore_min(gs1,t1,k2): gstore(gs1,t1,k2) >= 0
 gsinMax(gs1,t2,k2): gsin(gs1,t2,k2) <= 0
 gsoutMax(gs1,t2,k2): gsout(gs1,t2,k2) <= 0
 gstore_max(gs1,t2,k2): gstore(gs1,t2,k2) <= 0
 gstore_min(gs1,t2,k2): gstore(gs1,t2,k2) >= 0
 gsinMax(gs1,t3,k2): gsin(gs1,t3,k2) <= 0
 gsoutMax(gs1,t3,k2): gsout(gs1,t3,k2) <= 0
 gstore_max(gs1,t3,k2): gstore(gs1,t3,k2) <= 0
 gstore_min(gs1,t3,k2): gstore(gs1,t3,k2) >= 0
 gsinMax(gs1,t4,k2): gsin(gs1,t4,k2) <= 0
 gsoutMax(gs1,t4,k2): gsout(gs1,t4,k2) <= 0
 gstore_max(gs1,t4,k2): gstore(gs1,t4,k2) <= 0
 gstore_min(gs1,t4,k2): gstore(gs1,t4,k2) >= 0
 gstor_def(gs1,k2,t2): - gstore(gs1,t1,k2) - gsin(gs1,t2,k2)
   + gsout(gs1,t2,k2) + gstore(gs1,t2,k2) = 0
 gstor_def(gs1,k2,t3): - gstore(gs1,t2,k2) - gsin(gs1,t3,k2)
   + gsout(gs1,t3,k2) + gstore(gs1,t3,k2) = 0
 gstor_def(gs1,k2,t4): - gstore(gs1,t3,k2) - gsin(gs1,t4,k2)
   + gsout(gs1,t4,k2) + gstore(gs1,t4,k2) = 0
 gstor_def(gs1,k2,t1): - gsin(gs1,t1,k2) + gsout(gs1,t1,k2)
   + gstore(gs1,t1,k2) = 0
 gs_end(gs1,k0): gstore(gs1,t4,k0) >= 0
 SOS1_gshed_da_max(ng101,k0,t1): gshed_da(ng101,k0,t1)
   + SOS1_gshed_da_max(ng101,k0,t1) = 0
 SOS1_gshed_da_max(ng101,k1,t1): gshed_da(ng101,k1,t1)
   + SOS1_gshed_da_max(ng101,k1,t1) = 0
 SOS1_gshed_da_max(ng101,k2,t1): gshed_da(ng101,k2,t1)
   + SOS1_gshed_da_max(ng101,k2,t1) = 0
 SOS1_gshed_da_max(ng101,k0,t2): gshed_da(ng101,k0,t2)
   + SOS1_gshed_da_max(ng101,k0,t2) = 0
 SOS1_gshed_da_max(ng101,k1,t2): gshed_da(ng101,k1,t2)
   + SOS1_gshed_da_max(ng101,k1,t2) = 0
 SOS1_gshed_da_max(ng101,k2,t2): gshed_da(ng101,k2,t2)
   + SOS1_gshed_da_max(ng101,k2,t2) = 0
 SOS1_gshed_da_max(ng101,k0,t3): gshed_da(ng101,k0,t3)
   + SOS1_gshed_da_max(ng101,k0,t3) = 0
 SOS1_gshed_da_max(ng101,k1,t3): gshed_da(ng101,k1,t3)
   + SOS1_gshed_da_max(ng101,k1,t3) = 0
 SOS1_gshed_da_max(ng101,k2,t3): gshed_da(ng101,k2,t3)
   + SOS1_gshed_da_max(ng101,k2,t3) = 0
 SOS1_gshed_da_max(ng101,k0,t4): gshed_da(ng101,k0,t4)
   + SOS1_gshed_da_max(ng101,k0,t4) = 0
 SOS1_gshed_da_max(ng101,k1,t4): gshed_da(ng101,k1,t4)
   + SOS1_gshed_da_max(ng101,k1,t4) = 0
 SOS1_gshed_da_max(ng101,k2,t4): gshed_da(ng101,k2,t4)
   + SOS1_gshed_da_max(ng101,k2,t4) = 0
 SOS1_gshed_da_max(ng102,k0,t1): gshed_da(ng102,k0,t1)
   + SOS1_gshed_da_max(ng102,k0,t1) = 0
 SOS1_gshed_da_max(ng102,k1,t1): gshed_da(ng102,k1,t1)
   + SOS1_gshed_da_max(ng102,k1,t1) = 0
 SOS1_gshed_da_max(ng102,k2,t1): gshed_da(ng102,k2,t1)
   + SOS1_gshed_da_max(ng102,k2,t1) = 0
 SOS1_gshed_da_max(ng102,k0,t2): gshed_da(ng102,k0,t2)
   + SOS1_gshed_da_max(ng102,k0,t2) = 0
 SOS1_gshed_da_max(ng102,k1,t2): gshed_da(ng102,k1,t2)
   + SOS1_gshed_da_max(ng102,k1,t2) = 0
 SOS1_gshed_da_max(ng102,k2,t2): gshed_da(ng102,k2,t2)
   + SOS1_gshed_da_max(ng102,k2,t2) = 0
 SOS1_gshed_da_max(ng102,k0,t3): gshed_da(ng102,k0,t3)
   + SOS1_gshed_da_max(ng102,k0,t3) = 0
 SOS1_gshed_da_max(ng102,k1,t3): gshed_da(ng102,k1,t3)
   + SOS1_gshed_da_max(ng102,k1,t3) = 0
 SOS1_gshed_da_max(ng102,k2,t3): gshed_da(ng102,k2,t3)
   + SOS1_gshed_da_max(ng102,k2,t3) = 0
 SOS1_gshed_da_max(ng102,k0,t4): gshed_da(ng102,k0,t4)
   + SOS1_gshed_da_max(ng102,k0,t4) = 0
 SOS1_gshed_da_max(ng102,k1,t4): gshed_da(ng102,k1,t4)
   + SOS1_gshed_da_max(ng102,k1,t4) = 0
 SOS1_gshed_da_max(ng102,k2,t4): gshed_da(ng102,k2,t4)
   + SOS1_gshed_da_max(ng102,k2,t4) = 0
 SOS1_gprod_max(gw1,k0,t1): gprod(gw1,k0,t1) + SOS1_gprod_max(gw1,k0,t1)
   = 100
 SOS1_gprod_max(gw1,k0,t2): gprod(gw1,k0,t2) + SOS1_gprod_max(gw1,k0,t2)
   = 100
 SOS1_gprod_max(gw1,k0,t3): gprod(gw1,k0,t3) + SOS1_gprod_max(gw1,k0,t3)
   = 100
 SOS1_gprod_max(gw1,k0,t4): gprod(gw1,k0,t4) + SOS1_gprod_max(gw1,k0,t4)
   = 100
 SOS1_gprod_max(gw1,k1,t1): gprod(gw1,k1,t1) + SOS1_gprod_max(gw1,k1,t1)
   = 100
 SOS1_gprod_max(gw1,k1,t2): gprod(gw1,k1,t2) + SOS1_gprod_max(gw1,k1,t2)
   = 100
 SOS1_gprod_max(gw1,k1,t3): gprod(gw1,k1,t3) + SOS1_gprod_max(gw1,k1,t3)
   = 100
 SOS1_gprod_max(gw1,k1,t4): gprod(gw1,k1,t4) + SOS1_gprod_max(gw1,k1,t4)
   = 100
 SOS1_gprod_max(gw1,k2,t1): gprod(gw1,k2,t1) + SOS1_gprod_max(gw1,k2,t1)
   = 100
 SOS1_gprod_max(gw1,k2,t2): gprod(gw1,k2,t2) + SOS1_gprod_max(gw1,k2,t2)
   = 100
 SOS1_gprod_max(gw1,k2,t3): gprod(gw1,k2,t3) + SOS1_gprod_max(gw1,k2,t3)
   = 100
 SOS1_gprod_max(gw1,k2,t4): gprod(gw1,k2,t4) + SOS1_gprod_max(gw1,k2,t4)
   = 100
 SOS1_gprod_max(gw2,k0,t1): gprod(gw2,k0,t1) + SOS1_gprod_max(gw2,k0,t1)
   = 250
 SOS1_gprod_max(gw2,k0,t2): gprod(gw2,k0,t2) + SOS1_gprod_max(gw2,k0,t2)
   = 250
 SOS1_gprod_max(gw2,k0,t3): gprod(gw2,k0,t3) + SOS1_gprod_max(gw2,k0,t3)
   = 250
 SOS1_gprod_max(gw2,k0,t4): gprod(gw2,k0,t4) + SOS1_gprod_max(gw2,k0,t4)
   = 250
 SOS1_gprod_max(gw2,k1,t1): gprod(gw2,k1,t1) + SOS1_gprod_max(gw2,k1,t1)
   = 250
 SOS1_gprod_max(gw2,k1,t2): gprod(gw2,k1,t2) + SOS1_gprod_max(gw2,k1,t2)
   = 250
 SOS1_gprod_max(gw2,k1,t3): gprod(gw2,k1,t3) + SOS1_gprod_max(gw2,k1,t3)
   = 250
 SOS1_gprod_max(gw2,k1,t4): gprod(gw2,k1,t4) + SOS1_gprod_max(gw2,k1,t4)
   = 250
 SOS1_gprod_max(gw2,k2,t1): gprod(gw2,k2,t1) + SOS1_gprod_max(gw2,k2,t1)
   = 250
 SOS1_gprod_max(gw2,k2,t2): gprod(gw2,k2,t2) + SOS1_gprod_max(gw2,k2,t2)
   = 250
 SOS1_gprod_max(gw2,k2,t3): gprod(gw2,k2,t3) + SOS1_gprod_max(gw2,k2,t3)
   = 250
 SOS1_gprod_max(gw2,k2,t4): gprod(gw2,k2,t4) + SOS1_gprod_max(gw2,k2,t4)
   = 250
 SOS1_gprod_max(gw3,k0,t1): gprod(gw3,k0,t1) + SOS1_gprod_max(gw3,k0,t1)
   = 500
 SOS1_gprod_max(gw3,k0,t2): gprod(gw3,k0,t2) + SOS1_gprod_max(gw3,k0,t2)
   = 500
 SOS1_gprod_max(gw3,k0,t3): gprod(gw3,k0,t3) + SOS1_gprod_max(gw3,k0,t3)
   = 500
 SOS1_gprod_max(gw3,k0,t4): gprod(gw3,k0,t4) + SOS1_gprod_max(gw3,k0,t4)
   = 500
 SOS1_gprod_max(gw3,k1,t1): gprod(gw3,k1,t1) + SOS1_gprod_max(gw3,k1,t1)
   = 500
 SOS1_gprod_max(gw3,k1,t2): gprod(gw3,k1,t2) + SOS1_gprod_max(gw3,k1,t2)
   = 500
 SOS1_gprod_max(gw3,k1,t3): gprod(gw3,k1,t3) + SOS1_gprod_max(gw3,k1,t3)
   = 500
 SOS1_gprod_max(gw3,k1,t4): gprod(gw3,k1,t4) + SOS1_gprod_max(gw3,k1,t4)
   = 500
 SOS1_gprod_max(gw3,k2,t1): gprod(gw3,k2,t1) + SOS1_gprod_max(gw3,k2,t1)
   = 500
 SOS1_gprod_max(gw3,k2,t2): gprod(gw3,k2,t2) + SOS1_gprod_max(gw3,k2,t2)
   = 500
 SOS1_gprod_max(gw3,k2,t3): gprod(gw3,k2,t3) + SOS1_gprod_max(gw3,k2,t3)
   = 500
 SOS1_gprod_max(gw3,k2,t4): gprod(gw3,k2,t4) + SOS1_gprod_max(gw3,k2,t4)
   = 500
 SOS1_gflow_sr_limit(('ng101','ng102'),k0,t1):
   gflow_sr(('ng101','ng102'),k0,t1)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k0,t1) = 4000
 SOS1_gflow_sr_limit(('ng101','ng102'),k1,t1):
   gflow_sr(('ng101','ng102'),k1,t1)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k1,t1) = 4000
 SOS1_gflow_sr_limit(('ng101','ng102'),k2,t1):
   gflow_sr(('ng101','ng102'),k2,t1)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k2,t1) = 4000
 SOS1_gflow_sr_limit(('ng101','ng102'),k0,t2):
   gflow_sr(('ng101','ng102'),k0,t2)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k0,t2) = 4000
 SOS1_gflow_sr_limit(('ng101','ng102'),k1,t2):
   gflow_sr(('ng101','ng102'),k1,t2)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k1,t2) = 4000
 SOS1_gflow_sr_limit(('ng101','ng102'),k2,t2):
   gflow_sr(('ng101','ng102'),k2,t2)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k2,t2) = 4000
 SOS1_gflow_sr_limit(('ng101','ng102'),k0,t3):
   gflow_sr(('ng101','ng102'),k0,t3)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k0,t3) = 4000
 SOS1_gflow_sr_limit(('ng101','ng102'),k1,t3):
   gflow_sr(('ng101','ng102'),k1,t3)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k1,t3) = 4000
 SOS1_gflow_sr_limit(('ng101','ng102'),k2,t3):
   gflow_sr(('ng101','ng102'),k2,t3)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k2,t3) = 4000
 SOS1_gflow_sr_limit(('ng101','ng102'),k0,t4):
   gflow_sr(('ng101','ng102'),k0,t4)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k0,t4) = 4000
 SOS1_gflow_sr_limit(('ng101','ng102'),k1,t4):
   gflow_sr(('ng101','ng102'),k1,t4)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k1,t4) = 4000
 SOS1_gflow_sr_limit(('ng101','ng102'),k2,t4):
   gflow_sr(('ng101','ng102'),k2,t4)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k2,t4) = 4000
 SOS1_gsinMax(gs1,t1,k0): gsin(gs1,t1,k0) + SOS1_gsinMax(gs1,t1,k0) = 0
 SOS1_gsoutMax(gs1,t1,k0): gsout(gs1,t1,k0) + SOS1_gsoutMax(gs1,t1,k0) = 0
 SOS1_gstore_max(gs1,t1,k0): gstore(gs1,t1,k0) + SOS1_gstore_max(gs1,t1,k0)
   = 0
 SOS1_gstore_min(gs1,t1,k0): - gstore(gs1,t1,k0)
   + SOS1_gstore_min(gs1,t1,k0) = 0
 SOS1_gsinMax(gs1,t2,k0): gsin(gs1,t2,k0) + SOS1_gsinMax(gs1,t2,k0) = 0
 SOS1_gsoutMax(gs1,t2,k0): gsout(gs1,t2,k0) + SOS1_gsoutMax(gs1,t2,k0) = 0
 SOS1_gstore_max(gs1,t2,k0): gstore(gs1,t2,k0) + SOS1_gstore_max(gs1,t2,k0)
   = 0
 SOS1_gstore_min(gs1,t2,k0): - gstore(gs1,t2,k0)
   + SOS1_gstore_min(gs1,t2,k0) = 0
 SOS1_gsinMax(gs1,t3,k0): gsin(gs1,t3,k0) + SOS1_gsinMax(gs1,t3,k0) = 0
 SOS1_gsoutMax(gs1,t3,k0): gsout(gs1,t3,k0) + SOS1_gsoutMax(gs1,t3,k0) = 0
 SOS1_gstore_max(gs1,t3,k0): gstore(gs1,t3,k0) + SOS1_gstore_max(gs1,t3,k0)
   = 0
 SOS1_gstore_min(gs1,t3,k0): - gstore(gs1,t3,k0)
   + SOS1_gstore_min(gs1,t3,k0) = 0
 SOS1_gsinMax(gs1,t4,k0): gsin(gs1,t4,k0) + SOS1_gsinMax(gs1,t4,k0) = 0
 SOS1_gsoutMax(gs1,t4,k0): gsout(gs1,t4,k0) + SOS1_gsoutMax(gs1,t4,k0) = 0
 SOS1_gstore_max(gs1,t4,k0): gstore(gs1,t4,k0) + SOS1_gstore_max(gs1,t4,k0)
   = 0
 SOS1_gstore_min(gs1,t4,k0): - gstore(gs1,t4,k0)
   + SOS1_gstore_min(gs1,t4,k0) = 0
 SOS1_gsinMax(gs1,t1,k1): gsin(gs1,t1,k1) + SOS1_gsinMax(gs1,t1,k1) = 0
 SOS1_gsoutMax(gs1,t1,k1): gsout(gs1,t1,k1) + SOS1_gsoutMax(gs1,t1,k1) = 0
 SOS1_gstore_max(gs1,t1,k1): gstore(gs1,t1,k1) + SOS1_gstore_max(gs1,t1,k1)
   = 0
 SOS1_gstore_min(gs1,t1,k1): - gstore(gs1,t1,k1)
   + SOS1_gstore_min(gs1,t1,k1) = 0
 SOS1_gsinMax(gs1,t2,k1): gsin(gs1,t2,k1) + SOS1_gsinMax(gs1,t2,k1) = 0
 SOS1_gsoutMax(gs1,t2,k1): gsout(gs1,t2,k1) + SOS1_gsoutMax(gs1,t2,k1) = 0
 SOS1_gstore_max(gs1,t2,k1): gstore(gs1,t2,k1) + SOS1_gstore_max(gs1,t2,k1)
   = 0
 SOS1_gstore_min(gs1,t2,k1): - gstore(gs1,t2,k1)
   + SOS1_gstore_min(gs1,t2,k1) = 0
 SOS1_gsinMax(gs1,t3,k1): gsin(gs1,t3,k1) + SOS1_gsinMax(gs1,t3,k1) = 0
 SOS1_gsoutMax(gs1,t3,k1): gsout(gs1,t3,k1) + SOS1_gsoutMax(gs1,t3,k1) = 0
 SOS1_gstore_max(gs1,t3,k1): gstore(gs1,t3,k1) + SOS1_gstore_max(gs1,t3,k1)
   = 0
 SOS1_gstore_min(gs1,t3,k1): - gstore(gs1,t3,k1)
   + SOS1_gstore_min(gs1,t3,k1) = 0
 SOS1_gsinMax(gs1,t4,k1): gsin(gs1,t4,k1) + SOS1_gsinMax(gs1,t4,k1) = 0
 SOS1_gsoutMax(gs1,t4,k1): gsout(gs1,t4,k1) + SOS1_gsoutMax(gs1,t4,k1) = 0
 SOS1_gstore_max(gs1,t4,k1): gstore(gs1,t4,k1) + SOS1_gstore_max(gs1,t4,k1)
   = 0
 SOS1_gstore_min(gs1,t4,k1): - gstore(gs1,t4,k1)
   + SOS1_gstore_min(gs1,t4,k1) = 0
 SOS1_gsinMax(gs1,t1,k2): gsin(gs1,t1,k2) + SOS1_gsinMax(gs1,t1,k2) = 0
 SOS1_gsoutMax(gs1,t1,k2): gsout(gs1,t1,k2) + SOS1_gsoutMax(gs1,t1,k2) = 0
 SOS1_gstore_max(gs1,t1,k2): gstore(gs1,t1,k2) + SOS1_gstore_max(gs1,t1,k2)
   = 0
 SOS1_gstore_min(gs1,t1,k2): - gstore(gs1,t1,k2)
   + SOS1_gstore_min(gs1,t1,k2) = 0
 SOS1_gsinMax(gs1,t2,k2): gsin(gs1,t2,k2) + SOS1_gsinMax(gs1,t2,k2) = 0
 SOS1_gsoutMax(gs1,t2,k2): gsout(gs1,t2,k2) + SOS1_gsoutMax(gs1,t2,k2) = 0
 SOS1_gstore_max(gs1,t2,k2): gstore(gs1,t2,k2) + SOS1_gstore_max(gs1,t2,k2)
   = 0
 SOS1_gstore_min(gs1,t2,k2): - gstore(gs1,t2,k2)
   + SOS1_gstore_min(gs1,t2,k2) = 0
 SOS1_gsinMax(gs1,t3,k2): gsin(gs1,t3,k2) + SOS1_gsinMax(gs1,t3,k2) = 0
 SOS1_gsoutMax(gs1,t3,k2): gsout(gs1,t3,k2) + SOS1_gsoutMax(gs1,t3,k2) = 0
 SOS1_gstore_max(gs1,t3,k2): gstore(gs1,t3,k2) + SOS1_gstore_max(gs1,t3,k2)
   = 0
 SOS1_gstore_min(gs1,t3,k2): - gstore(gs1,t3,k2)
   + SOS1_gstore_min(gs1,t3,k2) = 0
 SOS1_gsinMax(gs1,t4,k2): gsin(gs1,t4,k2) + SOS1_gsinMax(gs1,t4,k2) = 0
 SOS1_gsoutMax(gs1,t4,k2): gsout(gs1,t4,k2) + SOS1_gsoutMax(gs1,t4,k2) = 0
 SOS1_gstore_max(gs1,t4,k2): gstore(gs1,t4,k2) + SOS1_gstore_max(gs1,t4,k2)
   = 0
 SOS1_gstore_min(gs1,t4,k2): - gstore(gs1,t4,k2)
   + SOS1_gstore_min(gs1,t4,k2) = 0
 SOS1_gs_end(gs1,k0): - gstore(gs1,t4,k0) + SOS1_gs_end(gs1,k0) = 0
 SOS1_LB_gshed_da(ng101,k0,t1): - gshed_da(ng101,k0,t1)
   + SOS1_LB_gshed_da(ng101,k0,t1) = 0
 SOS1_LB_gshed_da(ng101,k1,t1): - gshed_da(ng101,k1,t1)
   + SOS1_LB_gshed_da(ng101,k1,t1) = 0
 SOS1_LB_gshed_da(ng101,k2,t1): - gshed_da(ng101,k2,t1)
   + SOS1_LB_gshed_da(ng101,k2,t1) = 0
 SOS1_LB_gshed_da(ng101,k0,t2): - gshed_da(ng101,k0,t2)
   + SOS1_LB_gshed_da(ng101,k0,t2) = 0
 SOS1_LB_gshed_da(ng101,k1,t2): - gshed_da(ng101,k1,t2)
   + SOS1_LB_gshed_da(ng101,k1,t2) = 0
 SOS1_LB_gshed_da(ng101,k2,t2): - gshed_da(ng101,k2,t2)
   + SOS1_LB_gshed_da(ng101,k2,t2) = 0
 SOS1_LB_gshed_da(ng101,k0,t3): - gshed_da(ng101,k0,t3)
   + SOS1_LB_gshed_da(ng101,k0,t3) = 0
 SOS1_LB_gshed_da(ng101,k1,t3): - gshed_da(ng101,k1,t3)
   + SOS1_LB_gshed_da(ng101,k1,t3) = 0
 SOS1_LB_gshed_da(ng101,k2,t3): - gshed_da(ng101,k2,t3)
   + SOS1_LB_gshed_da(ng101,k2,t3) = 0
 SOS1_LB_gshed_da(ng101,k0,t4): - gshed_da(ng101,k0,t4)
   + SOS1_LB_gshed_da(ng101,k0,t4) = 0
 SOS1_LB_gshed_da(ng101,k1,t4): - gshed_da(ng101,k1,t4)
   + SOS1_LB_gshed_da(ng101,k1,t4) = 0
 SOS1_LB_gshed_da(ng101,k2,t4): - gshed_da(ng101,k2,t4)
   + SOS1_LB_gshed_da(ng101,k2,t4) = 0
 SOS1_LB_gshed_da(ng101,k0,t5): - gshed_da(ng101,k0,t5)
   + SOS1_LB_gshed_da(ng101,k0,t5) = 0
 SOS1_LB_gshed_da(ng101,k1,t5): - gshed_da(ng101,k1,t5)
   + SOS1_LB_gshed_da(ng101,k1,t5) = 0
 SOS1_LB_gshed_da(ng101,k2,t5): - gshed_da(ng101,k2,t5)
   + SOS1_LB_gshed_da(ng101,k2,t5) = 0
 SOS1_LB_gshed_da(ng101,k0,t6): - gshed_da(ng101,k0,t6)
   + SOS1_LB_gshed_da(ng101,k0,t6) = 0
 SOS1_LB_gshed_da(ng101,k1,t6): - gshed_da(ng101,k1,t6)
   + SOS1_LB_gshed_da(ng101,k1,t6) = 0
 SOS1_LB_gshed_da(ng101,k2,t6): - gshed_da(ng101,k2,t6)
   + SOS1_LB_gshed_da(ng101,k2,t6) = 0
 SOS1_LB_gshed_da(ng101,k0,t7): - gshed_da(ng101,k0,t7)
   + SOS1_LB_gshed_da(ng101,k0,t7) = 0
 SOS1_LB_gshed_da(ng101,k1,t7): - gshed_da(ng101,k1,t7)
   + SOS1_LB_gshed_da(ng101,k1,t7) = 0
 SOS1_LB_gshed_da(ng101,k2,t7): - gshed_da(ng101,k2,t7)
   + SOS1_LB_gshed_da(ng101,k2,t7) = 0
 SOS1_LB_gshed_da(ng101,k0,t8): - gshed_da(ng101,k0,t8)
   + SOS1_LB_gshed_da(ng101,k0,t8) = 0
 SOS1_LB_gshed_da(ng101,k1,t8): - gshed_da(ng101,k1,t8)
   + SOS1_LB_gshed_da(ng101,k1,t8) = 0
 SOS1_LB_gshed_da(ng101,k2,t8): - gshed_da(ng101,k2,t8)
   + SOS1_LB_gshed_da(ng101,k2,t8) = 0
 SOS1_LB_gshed_da(ng101,k0,t9): - gshed_da(ng101,k0,t9)
   + SOS1_LB_gshed_da(ng101,k0,t9) = 0
 SOS1_LB_gshed_da(ng101,k1,t9): - gshed_da(ng101,k1,t9)
   + SOS1_LB_gshed_da(ng101,k1,t9) = 0
 SOS1_LB_gshed_da(ng101,k2,t9): - gshed_da(ng101,k2,t9)
   + SOS1_LB_gshed_da(ng101,k2,t9) = 0
 SOS1_LB_gshed_da(ng101,k0,t10): - gshed_da(ng101,k0,t10)
   + SOS1_LB_gshed_da(ng101,k0,t10) = 0
 SOS1_LB_gshed_da(ng101,k1,t10): - gshed_da(ng101,k1,t10)
   + SOS1_LB_gshed_da(ng101,k1,t10) = 0
 SOS1_LB_gshed_da(ng101,k2,t10): - gshed_da(ng101,k2,t10)
   + SOS1_LB_gshed_da(ng101,k2,t10) = 0
 SOS1_LB_gshed_da(ng101,k0,t11): - gshed_da(ng101,k0,t11)
   + SOS1_LB_gshed_da(ng101,k0,t11) = 0
 SOS1_LB_gshed_da(ng101,k1,t11): - gshed_da(ng101,k1,t11)
   + SOS1_LB_gshed_da(ng101,k1,t11) = 0
 SOS1_LB_gshed_da(ng101,k2,t11): - gshed_da(ng101,k2,t11)
   + SOS1_LB_gshed_da(ng101,k2,t11) = 0
 SOS1_LB_gshed_da(ng101,k0,t12): - gshed_da(ng101,k0,t12)
   + SOS1_LB_gshed_da(ng101,k0,t12) = 0
 SOS1_LB_gshed_da(ng101,k1,t12): - gshed_da(ng101,k1,t12)
   + SOS1_LB_gshed_da(ng101,k1,t12) = 0
 SOS1_LB_gshed_da(ng101,k2,t12): - gshed_da(ng101,k2,t12)
   + SOS1_LB_gshed_da(ng101,k2,t12) = 0
 SOS1_LB_gshed_da(ng101,k0,t13): - gshed_da(ng101,k0,t13)
   + SOS1_LB_gshed_da(ng101,k0,t13) = 0
 SOS1_LB_gshed_da(ng101,k1,t13): - gshed_da(ng101,k1,t13)
   + SOS1_LB_gshed_da(ng101,k1,t13) = 0
 SOS1_LB_gshed_da(ng101,k2,t13): - gshed_da(ng101,k2,t13)
   + SOS1_LB_gshed_da(ng101,k2,t13) = 0
 SOS1_LB_gshed_da(ng101,k0,t14): - gshed_da(ng101,k0,t14)
   + SOS1_LB_gshed_da(ng101,k0,t14) = 0
 SOS1_LB_gshed_da(ng101,k1,t14): - gshed_da(ng101,k1,t14)
   + SOS1_LB_gshed_da(ng101,k1,t14) = 0
 SOS1_LB_gshed_da(ng101,k2,t14): - gshed_da(ng101,k2,t14)
   + SOS1_LB_gshed_da(ng101,k2,t14) = 0
 SOS1_LB_gshed_da(ng101,k0,t15): - gshed_da(ng101,k0,t15)
   + SOS1_LB_gshed_da(ng101,k0,t15) = 0
 SOS1_LB_gshed_da(ng101,k1,t15): - gshed_da(ng101,k1,t15)
   + SOS1_LB_gshed_da(ng101,k1,t15) = 0
 SOS1_LB_gshed_da(ng101,k2,t15): - gshed_da(ng101,k2,t15)
   + SOS1_LB_gshed_da(ng101,k2,t15) = 0
 SOS1_LB_gshed_da(ng101,k0,t16): - gshed_da(ng101,k0,t16)
   + SOS1_LB_gshed_da(ng101,k0,t16) = 0
 SOS1_LB_gshed_da(ng101,k1,t16): - gshed_da(ng101,k1,t16)
   + SOS1_LB_gshed_da(ng101,k1,t16) = 0
 SOS1_LB_gshed_da(ng101,k2,t16): - gshed_da(ng101,k2,t16)
   + SOS1_LB_gshed_da(ng101,k2,t16) = 0
 SOS1_LB_gshed_da(ng101,k0,t17): - gshed_da(ng101,k0,t17)
   + SOS1_LB_gshed_da(ng101,k0,t17) = 0
 SOS1_LB_gshed_da(ng101,k1,t17): - gshed_da(ng101,k1,t17)
   + SOS1_LB_gshed_da(ng101,k1,t17) = 0
 SOS1_LB_gshed_da(ng101,k2,t17): - gshed_da(ng101,k2,t17)
   + SOS1_LB_gshed_da(ng101,k2,t17) = 0
 SOS1_LB_gshed_da(ng101,k0,t18): - gshed_da(ng101,k0,t18)
   + SOS1_LB_gshed_da(ng101,k0,t18) = 0
 SOS1_LB_gshed_da(ng101,k1,t18): - gshed_da(ng101,k1,t18)
   + SOS1_LB_gshed_da(ng101,k1,t18) = 0
 SOS1_LB_gshed_da(ng101,k2,t18): - gshed_da(ng101,k2,t18)
   + SOS1_LB_gshed_da(ng101,k2,t18) = 0
 SOS1_LB_gshed_da(ng101,k0,t19): - gshed_da(ng101,k0,t19)
   + SOS1_LB_gshed_da(ng101,k0,t19) = 0
 SOS1_LB_gshed_da(ng101,k1,t19): - gshed_da(ng101,k1,t19)
   + SOS1_LB_gshed_da(ng101,k1,t19) = 0
 SOS1_LB_gshed_da(ng101,k2,t19): - gshed_da(ng101,k2,t19)
   + SOS1_LB_gshed_da(ng101,k2,t19) = 0
 SOS1_LB_gshed_da(ng101,k0,t20): - gshed_da(ng101,k0,t20)
   + SOS1_LB_gshed_da(ng101,k0,t20) = 0
 SOS1_LB_gshed_da(ng101,k1,t20): - gshed_da(ng101,k1,t20)
   + SOS1_LB_gshed_da(ng101,k1,t20) = 0
 SOS1_LB_gshed_da(ng101,k2,t20): - gshed_da(ng101,k2,t20)
   + SOS1_LB_gshed_da(ng101,k2,t20) = 0
 SOS1_LB_gshed_da(ng101,k0,t21): - gshed_da(ng101,k0,t21)
   + SOS1_LB_gshed_da(ng101,k0,t21) = 0
 SOS1_LB_gshed_da(ng101,k1,t21): - gshed_da(ng101,k1,t21)
   + SOS1_LB_gshed_da(ng101,k1,t21) = 0
 SOS1_LB_gshed_da(ng101,k2,t21): - gshed_da(ng101,k2,t21)
   + SOS1_LB_gshed_da(ng101,k2,t21) = 0
 SOS1_LB_gshed_da(ng101,k0,t22): - gshed_da(ng101,k0,t22)
   + SOS1_LB_gshed_da(ng101,k0,t22) = 0
 SOS1_LB_gshed_da(ng101,k1,t22): - gshed_da(ng101,k1,t22)
   + SOS1_LB_gshed_da(ng101,k1,t22) = 0
 SOS1_LB_gshed_da(ng101,k2,t22): - gshed_da(ng101,k2,t22)
   + SOS1_LB_gshed_da(ng101,k2,t22) = 0
 SOS1_LB_gshed_da(ng101,k0,t23): - gshed_da(ng101,k0,t23)
   + SOS1_LB_gshed_da(ng101,k0,t23) = 0
 SOS1_LB_gshed_da(ng101,k1,t23): - gshed_da(ng101,k1,t23)
   + SOS1_LB_gshed_da(ng101,k1,t23) = 0
 SOS1_LB_gshed_da(ng101,k2,t23): - gshed_da(ng101,k2,t23)
   + SOS1_LB_gshed_da(ng101,k2,t23) = 0
 SOS1_LB_gshed_da(ng101,k0,t24): - gshed_da(ng101,k0,t24)
   + SOS1_LB_gshed_da(ng101,k0,t24) = 0
 SOS1_LB_gshed_da(ng101,k1,t24): - gshed_da(ng101,k1,t24)
   + SOS1_LB_gshed_da(ng101,k1,t24) = 0
 SOS1_LB_gshed_da(ng101,k2,t24): - gshed_da(ng101,k2,t24)
   + SOS1_LB_gshed_da(ng101,k2,t24) = 0
 SOS1_LB_gshed_da(ng102,k0,t1): - gshed_da(ng102,k0,t1)
   + SOS1_LB_gshed_da(ng102,k0,t1) = 0
 SOS1_LB_gshed_da(ng102,k1,t1): - gshed_da(ng102,k1,t1)
   + SOS1_LB_gshed_da(ng102,k1,t1) = 0
 SOS1_LB_gshed_da(ng102,k2,t1): - gshed_da(ng102,k2,t1)
   + SOS1_LB_gshed_da(ng102,k2,t1) = 0
 SOS1_LB_gshed_da(ng102,k0,t2): - gshed_da(ng102,k0,t2)
   + SOS1_LB_gshed_da(ng102,k0,t2) = 0
 SOS1_LB_gshed_da(ng102,k1,t2): - gshed_da(ng102,k1,t2)
   + SOS1_LB_gshed_da(ng102,k1,t2) = 0
 SOS1_LB_gshed_da(ng102,k2,t2): - gshed_da(ng102,k2,t2)
   + SOS1_LB_gshed_da(ng102,k2,t2) = 0
 SOS1_LB_gshed_da(ng102,k0,t3): - gshed_da(ng102,k0,t3)
   + SOS1_LB_gshed_da(ng102,k0,t3) = 0
 SOS1_LB_gshed_da(ng102,k1,t3): - gshed_da(ng102,k1,t3)
   + SOS1_LB_gshed_da(ng102,k1,t3) = 0
 SOS1_LB_gshed_da(ng102,k2,t3): - gshed_da(ng102,k2,t3)
   + SOS1_LB_gshed_da(ng102,k2,t3) = 0
 SOS1_LB_gshed_da(ng102,k0,t4): - gshed_da(ng102,k0,t4)
   + SOS1_LB_gshed_da(ng102,k0,t4) = 0
 SOS1_LB_gshed_da(ng102,k1,t4): - gshed_da(ng102,k1,t4)
   + SOS1_LB_gshed_da(ng102,k1,t4) = 0
 SOS1_LB_gshed_da(ng102,k2,t4): - gshed_da(ng102,k2,t4)
   + SOS1_LB_gshed_da(ng102,k2,t4) = 0
 SOS1_LB_gshed_da(ng102,k0,t5): - gshed_da(ng102,k0,t5)
   + SOS1_LB_gshed_da(ng102,k0,t5) = 0
 SOS1_LB_gshed_da(ng102,k1,t5): - gshed_da(ng102,k1,t5)
   + SOS1_LB_gshed_da(ng102,k1,t5) = 0
 SOS1_LB_gshed_da(ng102,k2,t5): - gshed_da(ng102,k2,t5)
   + SOS1_LB_gshed_da(ng102,k2,t5) = 0
 SOS1_LB_gshed_da(ng102,k0,t6): - gshed_da(ng102,k0,t6)
   + SOS1_LB_gshed_da(ng102,k0,t6) = 0
 SOS1_LB_gshed_da(ng102,k1,t6): - gshed_da(ng102,k1,t6)
   + SOS1_LB_gshed_da(ng102,k1,t6) = 0
 SOS1_LB_gshed_da(ng102,k2,t6): - gshed_da(ng102,k2,t6)
   + SOS1_LB_gshed_da(ng102,k2,t6) = 0
 SOS1_LB_gshed_da(ng102,k0,t7): - gshed_da(ng102,k0,t7)
   + SOS1_LB_gshed_da(ng102,k0,t7) = 0
 SOS1_LB_gshed_da(ng102,k1,t7): - gshed_da(ng102,k1,t7)
   + SOS1_LB_gshed_da(ng102,k1,t7) = 0
 SOS1_LB_gshed_da(ng102,k2,t7): - gshed_da(ng102,k2,t7)
   + SOS1_LB_gshed_da(ng102,k2,t7) = 0
 SOS1_LB_gshed_da(ng102,k0,t8): - gshed_da(ng102,k0,t8)
   + SOS1_LB_gshed_da(ng102,k0,t8) = 0
 SOS1_LB_gshed_da(ng102,k1,t8): - gshed_da(ng102,k1,t8)
   + SOS1_LB_gshed_da(ng102,k1,t8) = 0
 SOS1_LB_gshed_da(ng102,k2,t8): - gshed_da(ng102,k2,t8)
   + SOS1_LB_gshed_da(ng102,k2,t8) = 0
 SOS1_LB_gshed_da(ng102,k0,t9): - gshed_da(ng102,k0,t9)
   + SOS1_LB_gshed_da(ng102,k0,t9) = 0
 SOS1_LB_gshed_da(ng102,k1,t9): - gshed_da(ng102,k1,t9)
   + SOS1_LB_gshed_da(ng102,k1,t9) = 0
 SOS1_LB_gshed_da(ng102,k2,t9): - gshed_da(ng102,k2,t9)
   + SOS1_LB_gshed_da(ng102,k2,t9) = 0
 SOS1_LB_gshed_da(ng102,k0,t10): - gshed_da(ng102,k0,t10)
   + SOS1_LB_gshed_da(ng102,k0,t10) = 0
 SOS1_LB_gshed_da(ng102,k1,t10): - gshed_da(ng102,k1,t10)
   + SOS1_LB_gshed_da(ng102,k1,t10) = 0
 SOS1_LB_gshed_da(ng102,k2,t10): - gshed_da(ng102,k2,t10)
   + SOS1_LB_gshed_da(ng102,k2,t10) = 0
 SOS1_LB_gshed_da(ng102,k0,t11): - gshed_da(ng102,k0,t11)
   + SOS1_LB_gshed_da(ng102,k0,t11) = 0
 SOS1_LB_gshed_da(ng102,k1,t11): - gshed_da(ng102,k1,t11)
   + SOS1_LB_gshed_da(ng102,k1,t11) = 0
 SOS1_LB_gshed_da(ng102,k2,t11): - gshed_da(ng102,k2,t11)
   + SOS1_LB_gshed_da(ng102,k2,t11) = 0
 SOS1_LB_gshed_da(ng102,k0,t12): - gshed_da(ng102,k0,t12)
   + SOS1_LB_gshed_da(ng102,k0,t12) = 0
 SOS1_LB_gshed_da(ng102,k1,t12): - gshed_da(ng102,k1,t12)
   + SOS1_LB_gshed_da(ng102,k1,t12) = 0
 SOS1_LB_gshed_da(ng102,k2,t12): - gshed_da(ng102,k2,t12)
   + SOS1_LB_gshed_da(ng102,k2,t12) = 0
 SOS1_LB_gshed_da(ng102,k0,t13): - gshed_da(ng102,k0,t13)
   + SOS1_LB_gshed_da(ng102,k0,t13) = 0
 SOS1_LB_gshed_da(ng102,k1,t13): - gshed_da(ng102,k1,t13)
   + SOS1_LB_gshed_da(ng102,k1,t13) = 0
 SOS1_LB_gshed_da(ng102,k2,t13): - gshed_da(ng102,k2,t13)
   + SOS1_LB_gshed_da(ng102,k2,t13) = 0
 SOS1_LB_gshed_da(ng102,k0,t14): - gshed_da(ng102,k0,t14)
   + SOS1_LB_gshed_da(ng102,k0,t14) = 0
 SOS1_LB_gshed_da(ng102,k1,t14): - gshed_da(ng102,k1,t14)
   + SOS1_LB_gshed_da(ng102,k1,t14) = 0
 SOS1_LB_gshed_da(ng102,k2,t14): - gshed_da(ng102,k2,t14)
   + SOS1_LB_gshed_da(ng102,k2,t14) = 0
 SOS1_LB_gshed_da(ng102,k0,t15): - gshed_da(ng102,k0,t15)
   + SOS1_LB_gshed_da(ng102,k0,t15) = 0
 SOS1_LB_gshed_da(ng102,k1,t15): - gshed_da(ng102,k1,t15)
   + SOS1_LB_gshed_da(ng102,k1,t15) = 0
 SOS1_LB_gshed_da(ng102,k2,t15): - gshed_da(ng102,k2,t15)
   + SOS1_LB_gshed_da(ng102,k2,t15) = 0
 SOS1_LB_gshed_da(ng102,k0,t16): - gshed_da(ng102,k0,t16)
   + SOS1_LB_gshed_da(ng102,k0,t16) = 0
 SOS1_LB_gshed_da(ng102,k1,t16): - gshed_da(ng102,k1,t16)
   + SOS1_LB_gshed_da(ng102,k1,t16) = 0
 SOS1_LB_gshed_da(ng102,k2,t16): - gshed_da(ng102,k2,t16)
   + SOS1_LB_gshed_da(ng102,k2,t16) = 0
 SOS1_LB_gshed_da(ng102,k0,t17): - gshed_da(ng102,k0,t17)
   + SOS1_LB_gshed_da(ng102,k0,t17) = 0
 SOS1_LB_gshed_da(ng102,k1,t17): - gshed_da(ng102,k1,t17)
   + SOS1_LB_gshed_da(ng102,k1,t17) = 0
 SOS1_LB_gshed_da(ng102,k2,t17): - gshed_da(ng102,k2,t17)
   + SOS1_LB_gshed_da(ng102,k2,t17) = 0
 SOS1_LB_gshed_da(ng102,k0,t18): - gshed_da(ng102,k0,t18)
   + SOS1_LB_gshed_da(ng102,k0,t18) = 0
 SOS1_LB_gshed_da(ng102,k1,t18): - gshed_da(ng102,k1,t18)
   + SOS1_LB_gshed_da(ng102,k1,t18) = 0
 SOS1_LB_gshed_da(ng102,k2,t18): - gshed_da(ng102,k2,t18)
   + SOS1_LB_gshed_da(ng102,k2,t18) = 0
 SOS1_LB_gshed_da(ng102,k0,t19): - gshed_da(ng102,k0,t19)
   + SOS1_LB_gshed_da(ng102,k0,t19) = 0
 SOS1_LB_gshed_da(ng102,k1,t19): - gshed_da(ng102,k1,t19)
   + SOS1_LB_gshed_da(ng102,k1,t19) = 0
 SOS1_LB_gshed_da(ng102,k2,t19): - gshed_da(ng102,k2,t19)
   + SOS1_LB_gshed_da(ng102,k2,t19) = 0
 SOS1_LB_gshed_da(ng102,k0,t20): - gshed_da(ng102,k0,t20)
   + SOS1_LB_gshed_da(ng102,k0,t20) = 0
 SOS1_LB_gshed_da(ng102,k1,t20): - gshed_da(ng102,k1,t20)
   + SOS1_LB_gshed_da(ng102,k1,t20) = 0
 SOS1_LB_gshed_da(ng102,k2,t20): - gshed_da(ng102,k2,t20)
   + SOS1_LB_gshed_da(ng102,k2,t20) = 0
 SOS1_LB_gshed_da(ng102,k0,t21): - gshed_da(ng102,k0,t21)
   + SOS1_LB_gshed_da(ng102,k0,t21) = 0
 SOS1_LB_gshed_da(ng102,k1,t21): - gshed_da(ng102,k1,t21)
   + SOS1_LB_gshed_da(ng102,k1,t21) = 0
 SOS1_LB_gshed_da(ng102,k2,t21): - gshed_da(ng102,k2,t21)
   + SOS1_LB_gshed_da(ng102,k2,t21) = 0
 SOS1_LB_gshed_da(ng102,k0,t22): - gshed_da(ng102,k0,t22)
   + SOS1_LB_gshed_da(ng102,k0,t22) = 0
 SOS1_LB_gshed_da(ng102,k1,t22): - gshed_da(ng102,k1,t22)
   + SOS1_LB_gshed_da(ng102,k1,t22) = 0
 SOS1_LB_gshed_da(ng102,k2,t22): - gshed_da(ng102,k2,t22)
   + SOS1_LB_gshed_da(ng102,k2,t22) = 0
 SOS1_LB_gshed_da(ng102,k0,t23): - gshed_da(ng102,k0,t23)
   + SOS1_LB_gshed_da(ng102,k0,t23) = 0
 SOS1_LB_gshed_da(ng102,k1,t23): - gshed_da(ng102,k1,t23)
   + SOS1_LB_gshed_da(ng102,k1,t23) = 0
 SOS1_LB_gshed_da(ng102,k2,t23): - gshed_da(ng102,k2,t23)
   + SOS1_LB_gshed_da(ng102,k2,t23) = 0
 SOS1_LB_gshed_da(ng102,k0,t24): - gshed_da(ng102,k0,t24)
   + SOS1_LB_gshed_da(ng102,k0,t24) = 0
 SOS1_LB_gshed_da(ng102,k1,t24): - gshed_da(ng102,k1,t24)
   + SOS1_LB_gshed_da(ng102,k1,t24) = 0
 SOS1_LB_gshed_da(ng102,k2,t24): - gshed_da(ng102,k2,t24)
   + SOS1_LB_gshed_da(ng102,k2,t24) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t1):
   - gflow_sr(('ng101','ng102'),k0,t1)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t1) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t1):
   - gflow_sr(('ng101','ng102'),k1,t1)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t1) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t1):
   - gflow_sr(('ng101','ng102'),k2,t1)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t1) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t2):
   - gflow_sr(('ng101','ng102'),k0,t2)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t2) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t2):
   - gflow_sr(('ng101','ng102'),k1,t2)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t2) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t2):
   - gflow_sr(('ng101','ng102'),k2,t2)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t2) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t3):
   - gflow_sr(('ng101','ng102'),k0,t3)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t3) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t3):
   - gflow_sr(('ng101','ng102'),k1,t3)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t3) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t3):
   - gflow_sr(('ng101','ng102'),k2,t3)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t3) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t4):
   - gflow_sr(('ng101','ng102'),k0,t4)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t4) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t4):
   - gflow_sr(('ng101','ng102'),k1,t4)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t4) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t4):
   - gflow_sr(('ng101','ng102'),k2,t4)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t4) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t5):
   - gflow_sr(('ng101','ng102'),k0,t5)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t5) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t5):
   - gflow_sr(('ng101','ng102'),k1,t5)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t5) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t5):
   - gflow_sr(('ng101','ng102'),k2,t5)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t5) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t6):
   - gflow_sr(('ng101','ng102'),k0,t6)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t6) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t6):
   - gflow_sr(('ng101','ng102'),k1,t6)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t6) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t6):
   - gflow_sr(('ng101','ng102'),k2,t6)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t6) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t7):
   - gflow_sr(('ng101','ng102'),k0,t7)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t7) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t7):
   - gflow_sr(('ng101','ng102'),k1,t7)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t7) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t7):
   - gflow_sr(('ng101','ng102'),k2,t7)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t7) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t8):
   - gflow_sr(('ng101','ng102'),k0,t8)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t8) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t8):
   - gflow_sr(('ng101','ng102'),k1,t8)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t8) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t8):
   - gflow_sr(('ng101','ng102'),k2,t8)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t8) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t9):
   - gflow_sr(('ng101','ng102'),k0,t9)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t9) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t9):
   - gflow_sr(('ng101','ng102'),k1,t9)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t9) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t9):
   - gflow_sr(('ng101','ng102'),k2,t9)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t9) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t10):
   - gflow_sr(('ng101','ng102'),k0,t10)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t10) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t10):
   - gflow_sr(('ng101','ng102'),k1,t10)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t10) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t10):
   - gflow_sr(('ng101','ng102'),k2,t10)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t10) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t11):
   - gflow_sr(('ng101','ng102'),k0,t11)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t11) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t11):
   - gflow_sr(('ng101','ng102'),k1,t11)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t11) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t11):
   - gflow_sr(('ng101','ng102'),k2,t11)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t11) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t12):
   - gflow_sr(('ng101','ng102'),k0,t12)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t12) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t12):
   - gflow_sr(('ng101','ng102'),k1,t12)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t12) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t12):
   - gflow_sr(('ng101','ng102'),k2,t12)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t12) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t13):
   - gflow_sr(('ng101','ng102'),k0,t13)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t13) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t13):
   - gflow_sr(('ng101','ng102'),k1,t13)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t13) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t13):
   - gflow_sr(('ng101','ng102'),k2,t13)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t13) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t14):
   - gflow_sr(('ng101','ng102'),k0,t14)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t14) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t14):
   - gflow_sr(('ng101','ng102'),k1,t14)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t14) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t14):
   - gflow_sr(('ng101','ng102'),k2,t14)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t14) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t15):
   - gflow_sr(('ng101','ng102'),k0,t15)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t15) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t15):
   - gflow_sr(('ng101','ng102'),k1,t15)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t15) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t15):
   - gflow_sr(('ng101','ng102'),k2,t15)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t15) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t16):
   - gflow_sr(('ng101','ng102'),k0,t16)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t16) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t16):
   - gflow_sr(('ng101','ng102'),k1,t16)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t16) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t16):
   - gflow_sr(('ng101','ng102'),k2,t16)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t16) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t17):
   - gflow_sr(('ng101','ng102'),k0,t17)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t17) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t17):
   - gflow_sr(('ng101','ng102'),k1,t17)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t17) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t17):
   - gflow_sr(('ng101','ng102'),k2,t17)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t17) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t18):
   - gflow_sr(('ng101','ng102'),k0,t18)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t18) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t18):
   - gflow_sr(('ng101','ng102'),k1,t18)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t18) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t18):
   - gflow_sr(('ng101','ng102'),k2,t18)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t18) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t19):
   - gflow_sr(('ng101','ng102'),k0,t19)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t19) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t19):
   - gflow_sr(('ng101','ng102'),k1,t19)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t19) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t19):
   - gflow_sr(('ng101','ng102'),k2,t19)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t19) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t20):
   - gflow_sr(('ng101','ng102'),k0,t20)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t20) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t20):
   - gflow_sr(('ng101','ng102'),k1,t20)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t20) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t20):
   - gflow_sr(('ng101','ng102'),k2,t20)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t20) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t21):
   - gflow_sr(('ng101','ng102'),k0,t21)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t21) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t21):
   - gflow_sr(('ng101','ng102'),k1,t21)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t21) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t21):
   - gflow_sr(('ng101','ng102'),k2,t21)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t21) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t22):
   - gflow_sr(('ng101','ng102'),k0,t22)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t22) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t22):
   - gflow_sr(('ng101','ng102'),k1,t22)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t22) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t22):
   - gflow_sr(('ng101','ng102'),k2,t22)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t22) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t23):
   - gflow_sr(('ng101','ng102'),k0,t23)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t23) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t23):
   - gflow_sr(('ng101','ng102'),k1,t23)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t23) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t23):
   - gflow_sr(('ng101','ng102'),k2,t23)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t23) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t24):
   - gflow_sr(('ng101','ng102'),k0,t24)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t24) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t24):
   - gflow_sr(('ng101','ng102'),k1,t24)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t24) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t24):
   - gflow_sr(('ng101','ng102'),k2,t24)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t24) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t1): - qin_sr(('ng101','ng102'),k0,t1)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t1) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t1):
   - qout_sr(('ng101','ng102'),k0,t1)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t1) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t1): - qin_sr(('ng101','ng102'),k1,t1)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t1) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t1):
   - qout_sr(('ng101','ng102'),k1,t1)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t1) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t1): - qin_sr(('ng101','ng102'),k2,t1)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t1) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t1):
   - qout_sr(('ng101','ng102'),k2,t1)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t1) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t2): - qin_sr(('ng101','ng102'),k0,t2)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t2) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t2):
   - qout_sr(('ng101','ng102'),k0,t2)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t2) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t2): - qin_sr(('ng101','ng102'),k1,t2)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t2) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t2):
   - qout_sr(('ng101','ng102'),k1,t2)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t2) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t2): - qin_sr(('ng101','ng102'),k2,t2)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t2) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t2):
   - qout_sr(('ng101','ng102'),k2,t2)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t2) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t3): - qin_sr(('ng101','ng102'),k0,t3)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t3) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t3):
   - qout_sr(('ng101','ng102'),k0,t3)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t3) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t3): - qin_sr(('ng101','ng102'),k1,t3)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t3) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t3):
   - qout_sr(('ng101','ng102'),k1,t3)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t3) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t3): - qin_sr(('ng101','ng102'),k2,t3)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t3) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t3):
   - qout_sr(('ng101','ng102'),k2,t3)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t3) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t4): - qin_sr(('ng101','ng102'),k0,t4)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t4) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t4):
   - qout_sr(('ng101','ng102'),k0,t4)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t4) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t4): - qin_sr(('ng101','ng102'),k1,t4)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t4) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t4):
   - qout_sr(('ng101','ng102'),k1,t4)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t4) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t4): - qin_sr(('ng101','ng102'),k2,t4)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t4) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t4):
   - qout_sr(('ng101','ng102'),k2,t4)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t4) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t5): - qin_sr(('ng101','ng102'),k0,t5)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t5) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t5):
   - qout_sr(('ng101','ng102'),k0,t5)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t5) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t5): - qin_sr(('ng101','ng102'),k1,t5)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t5) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t5):
   - qout_sr(('ng101','ng102'),k1,t5)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t5) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t5): - qin_sr(('ng101','ng102'),k2,t5)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t5) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t5):
   - qout_sr(('ng101','ng102'),k2,t5)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t5) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t6): - qin_sr(('ng101','ng102'),k0,t6)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t6) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t6):
   - qout_sr(('ng101','ng102'),k0,t6)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t6) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t6): - qin_sr(('ng101','ng102'),k1,t6)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t6) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t6):
   - qout_sr(('ng101','ng102'),k1,t6)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t6) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t6): - qin_sr(('ng101','ng102'),k2,t6)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t6) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t6):
   - qout_sr(('ng101','ng102'),k2,t6)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t6) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t7): - qin_sr(('ng101','ng102'),k0,t7)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t7) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t7):
   - qout_sr(('ng101','ng102'),k0,t7)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t7) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t7): - qin_sr(('ng101','ng102'),k1,t7)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t7) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t7):
   - qout_sr(('ng101','ng102'),k1,t7)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t7) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t7): - qin_sr(('ng101','ng102'),k2,t7)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t7) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t7):
   - qout_sr(('ng101','ng102'),k2,t7)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t7) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t8): - qin_sr(('ng101','ng102'),k0,t8)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t8) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t8):
   - qout_sr(('ng101','ng102'),k0,t8)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t8) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t8): - qin_sr(('ng101','ng102'),k1,t8)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t8) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t8):
   - qout_sr(('ng101','ng102'),k1,t8)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t8) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t8): - qin_sr(('ng101','ng102'),k2,t8)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t8) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t8):
   - qout_sr(('ng101','ng102'),k2,t8)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t8) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t9): - qin_sr(('ng101','ng102'),k0,t9)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t9) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t9):
   - qout_sr(('ng101','ng102'),k0,t9)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t9) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t9): - qin_sr(('ng101','ng102'),k1,t9)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t9) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t9):
   - qout_sr(('ng101','ng102'),k1,t9)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t9) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t9): - qin_sr(('ng101','ng102'),k2,t9)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t9) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t9):
   - qout_sr(('ng101','ng102'),k2,t9)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t9) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t10):
   - qin_sr(('ng101','ng102'),k0,t10)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t10) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t10):
   - qout_sr(('ng101','ng102'),k0,t10)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t10) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t10):
   - qin_sr(('ng101','ng102'),k1,t10)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t10) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t10):
   - qout_sr(('ng101','ng102'),k1,t10)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t10) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t10):
   - qin_sr(('ng101','ng102'),k2,t10)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t10) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t10):
   - qout_sr(('ng101','ng102'),k2,t10)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t10) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t11):
   - qin_sr(('ng101','ng102'),k0,t11)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t11) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t11):
   - qout_sr(('ng101','ng102'),k0,t11)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t11) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t11):
   - qin_sr(('ng101','ng102'),k1,t11)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t11) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t11):
   - qout_sr(('ng101','ng102'),k1,t11)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t11) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t11):
   - qin_sr(('ng101','ng102'),k2,t11)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t11) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t11):
   - qout_sr(('ng101','ng102'),k2,t11)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t11) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t12):
   - qin_sr(('ng101','ng102'),k0,t12)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t12) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t12):
   - qout_sr(('ng101','ng102'),k0,t12)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t12) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t12):
   - qin_sr(('ng101','ng102'),k1,t12)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t12) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t12):
   - qout_sr(('ng101','ng102'),k1,t12)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t12) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t12):
   - qin_sr(('ng101','ng102'),k2,t12)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t12) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t12):
   - qout_sr(('ng101','ng102'),k2,t12)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t12) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t13):
   - qin_sr(('ng101','ng102'),k0,t13)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t13) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t13):
   - qout_sr(('ng101','ng102'),k0,t13)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t13) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t13):
   - qin_sr(('ng101','ng102'),k1,t13)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t13) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t13):
   - qout_sr(('ng101','ng102'),k1,t13)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t13) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t13):
   - qin_sr(('ng101','ng102'),k2,t13)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t13) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t13):
   - qout_sr(('ng101','ng102'),k2,t13)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t13) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t14):
   - qin_sr(('ng101','ng102'),k0,t14)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t14) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t14):
   - qout_sr(('ng101','ng102'),k0,t14)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t14) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t14):
   - qin_sr(('ng101','ng102'),k1,t14)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t14) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t14):
   - qout_sr(('ng101','ng102'),k1,t14)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t14) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t14):
   - qin_sr(('ng101','ng102'),k2,t14)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t14) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t14):
   - qout_sr(('ng101','ng102'),k2,t14)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t14) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t15):
   - qin_sr(('ng101','ng102'),k0,t15)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t15) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t15):
   - qout_sr(('ng101','ng102'),k0,t15)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t15) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t15):
   - qin_sr(('ng101','ng102'),k1,t15)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t15) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t15):
   - qout_sr(('ng101','ng102'),k1,t15)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t15) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t15):
   - qin_sr(('ng101','ng102'),k2,t15)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t15) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t15):
   - qout_sr(('ng101','ng102'),k2,t15)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t15) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t16):
   - qin_sr(('ng101','ng102'),k0,t16)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t16) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t16):
   - qout_sr(('ng101','ng102'),k0,t16)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t16) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t16):
   - qin_sr(('ng101','ng102'),k1,t16)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t16) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t16):
   - qout_sr(('ng101','ng102'),k1,t16)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t16) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t16):
   - qin_sr(('ng101','ng102'),k2,t16)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t16) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t16):
   - qout_sr(('ng101','ng102'),k2,t16)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t16) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t17):
   - qin_sr(('ng101','ng102'),k0,t17)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t17) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t17):
   - qout_sr(('ng101','ng102'),k0,t17)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t17) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t17):
   - qin_sr(('ng101','ng102'),k1,t17)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t17) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t17):
   - qout_sr(('ng101','ng102'),k1,t17)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t17) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t17):
   - qin_sr(('ng101','ng102'),k2,t17)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t17) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t17):
   - qout_sr(('ng101','ng102'),k2,t17)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t17) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t18):
   - qin_sr(('ng101','ng102'),k0,t18)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t18) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t18):
   - qout_sr(('ng101','ng102'),k0,t18)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t18) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t18):
   - qin_sr(('ng101','ng102'),k1,t18)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t18) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t18):
   - qout_sr(('ng101','ng102'),k1,t18)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t18) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t18):
   - qin_sr(('ng101','ng102'),k2,t18)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t18) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t18):
   - qout_sr(('ng101','ng102'),k2,t18)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t18) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t19):
   - qin_sr(('ng101','ng102'),k0,t19)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t19) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t19):
   - qout_sr(('ng101','ng102'),k0,t19)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t19) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t19):
   - qin_sr(('ng101','ng102'),k1,t19)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t19) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t19):
   - qout_sr(('ng101','ng102'),k1,t19)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t19) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t19):
   - qin_sr(('ng101','ng102'),k2,t19)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t19) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t19):
   - qout_sr(('ng101','ng102'),k2,t19)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t19) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t20):
   - qin_sr(('ng101','ng102'),k0,t20)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t20) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t20):
   - qout_sr(('ng101','ng102'),k0,t20)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t20) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t20):
   - qin_sr(('ng101','ng102'),k1,t20)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t20) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t20):
   - qout_sr(('ng101','ng102'),k1,t20)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t20) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t20):
   - qin_sr(('ng101','ng102'),k2,t20)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t20) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t20):
   - qout_sr(('ng101','ng102'),k2,t20)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t20) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t21):
   - qin_sr(('ng101','ng102'),k0,t21)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t21) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t21):
   - qout_sr(('ng101','ng102'),k0,t21)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t21) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t21):
   - qin_sr(('ng101','ng102'),k1,t21)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t21) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t21):
   - qout_sr(('ng101','ng102'),k1,t21)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t21) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t21):
   - qin_sr(('ng101','ng102'),k2,t21)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t21) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t21):
   - qout_sr(('ng101','ng102'),k2,t21)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t21) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t22):
   - qin_sr(('ng101','ng102'),k0,t22)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t22) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t22):
   - qout_sr(('ng101','ng102'),k0,t22)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t22) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t22):
   - qin_sr(('ng101','ng102'),k1,t22)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t22) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t22):
   - qout_sr(('ng101','ng102'),k1,t22)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t22) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t22):
   - qin_sr(('ng101','ng102'),k2,t22)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t22) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t22):
   - qout_sr(('ng101','ng102'),k2,t22)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t22) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t23):
   - qin_sr(('ng101','ng102'),k0,t23)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t23) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t23):
   - qout_sr(('ng101','ng102'),k0,t23)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t23) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t23):
   - qin_sr(('ng101','ng102'),k1,t23)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t23) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t23):
   - qout_sr(('ng101','ng102'),k1,t23)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t23) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t23):
   - qin_sr(('ng101','ng102'),k2,t23)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t23) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t23):
   - qout_sr(('ng101','ng102'),k2,t23)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t23) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k0,t24):
   - qin_sr(('ng101','ng102'),k0,t24)
   + SOS1_LB_qin_sr(('ng101','ng102'),k0,t24) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k0,t24):
   - qout_sr(('ng101','ng102'),k0,t24)
   + SOS1_LB_qout_sr(('ng101','ng102'),k0,t24) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k1,t24):
   - qin_sr(('ng101','ng102'),k1,t24)
   + SOS1_LB_qin_sr(('ng101','ng102'),k1,t24) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k1,t24):
   - qout_sr(('ng101','ng102'),k1,t24)
   + SOS1_LB_qout_sr(('ng101','ng102'),k1,t24) = 0
 SOS1_LB_qin_sr(('ng101','ng102'),k2,t24):
   - qin_sr(('ng101','ng102'),k2,t24)
   + SOS1_LB_qin_sr(('ng101','ng102'),k2,t24) = 0
 SOS1_LB_qout_sr(('ng101','ng102'),k2,t24):
   - qout_sr(('ng101','ng102'),k2,t24)
   + SOS1_LB_qout_sr(('ng101','ng102'),k2,t24) = 0
 SOS1_LB_gprod(gw1,k0,t1): - gprod(gw1,k0,t1) + SOS1_LB_gprod(gw1,k0,t1)
   = 0
 SOS1_LB_gprod(gw1,k1,t1): - gprod(gw1,k1,t1) + SOS1_LB_gprod(gw1,k1,t1)
   = 0
 SOS1_LB_gprod(gw1,k2,t1): - gprod(gw1,k2,t1) + SOS1_LB_gprod(gw1,k2,t1)
   = 0
 SOS1_LB_gprod(gw1,k0,t2): - gprod(gw1,k0,t2) + SOS1_LB_gprod(gw1,k0,t2)
   = 0
 SOS1_LB_gprod(gw1,k1,t2): - gprod(gw1,k1,t2) + SOS1_LB_gprod(gw1,k1,t2)
   = 0
 SOS1_LB_gprod(gw1,k2,t2): - gprod(gw1,k2,t2) + SOS1_LB_gprod(gw1,k2,t2)
   = 0
 SOS1_LB_gprod(gw1,k0,t3): - gprod(gw1,k0,t3) + SOS1_LB_gprod(gw1,k0,t3)
   = 0
 SOS1_LB_gprod(gw1,k1,t3): - gprod(gw1,k1,t3) + SOS1_LB_gprod(gw1,k1,t3)
   = 0
 SOS1_LB_gprod(gw1,k2,t3): - gprod(gw1,k2,t3) + SOS1_LB_gprod(gw1,k2,t3)
   = 0
 SOS1_LB_gprod(gw1,k0,t4): - gprod(gw1,k0,t4) + SOS1_LB_gprod(gw1,k0,t4)
   = 0
 SOS1_LB_gprod(gw1,k1,t4): - gprod(gw1,k1,t4) + SOS1_LB_gprod(gw1,k1,t4)
   = 0
 SOS1_LB_gprod(gw1,k2,t4): - gprod(gw1,k2,t4) + SOS1_LB_gprod(gw1,k2,t4)
   = 0
 SOS1_LB_gprod(gw1,k0,t5): - gprod(gw1,k0,t5) + SOS1_LB_gprod(gw1,k0,t5)
   = 0
 SOS1_LB_gprod(gw1,k1,t5): - gprod(gw1,k1,t5) + SOS1_LB_gprod(gw1,k1,t5)
   = 0
 SOS1_LB_gprod(gw1,k2,t5): - gprod(gw1,k2,t5) + SOS1_LB_gprod(gw1,k2,t5)
   = 0
 SOS1_LB_gprod(gw1,k0,t6): - gprod(gw1,k0,t6) + SOS1_LB_gprod(gw1,k0,t6)
   = 0
 SOS1_LB_gprod(gw1,k1,t6): - gprod(gw1,k1,t6) + SOS1_LB_gprod(gw1,k1,t6)
   = 0
 SOS1_LB_gprod(gw1,k2,t6): - gprod(gw1,k2,t6) + SOS1_LB_gprod(gw1,k2,t6)
   = 0
 SOS1_LB_gprod(gw1,k0,t7): - gprod(gw1,k0,t7) + SOS1_LB_gprod(gw1,k0,t7)
   = 0
 SOS1_LB_gprod(gw1,k1,t7): - gprod(gw1,k1,t7) + SOS1_LB_gprod(gw1,k1,t7)
   = 0
 SOS1_LB_gprod(gw1,k2,t7): - gprod(gw1,k2,t7) + SOS1_LB_gprod(gw1,k2,t7)
   = 0
 SOS1_LB_gprod(gw1,k0,t8): - gprod(gw1,k0,t8) + SOS1_LB_gprod(gw1,k0,t8)
   = 0
 SOS1_LB_gprod(gw1,k1,t8): - gprod(gw1,k1,t8) + SOS1_LB_gprod(gw1,k1,t8)
   = 0
 SOS1_LB_gprod(gw1,k2,t8): - gprod(gw1,k2,t8) + SOS1_LB_gprod(gw1,k2,t8)
   = 0
 SOS1_LB_gprod(gw1,k0,t9): - gprod(gw1,k0,t9) + SOS1_LB_gprod(gw1,k0,t9)
   = 0
 SOS1_LB_gprod(gw1,k1,t9): - gprod(gw1,k1,t9) + SOS1_LB_gprod(gw1,k1,t9)
   = 0
 SOS1_LB_gprod(gw1,k2,t9): - gprod(gw1,k2,t9) + SOS1_LB_gprod(gw1,k2,t9)
   = 0
 SOS1_LB_gprod(gw1,k0,t10): - gprod(gw1,k0,t10) + SOS1_LB_gprod(gw1,k0,t10)
   = 0
 SOS1_LB_gprod(gw1,k1,t10): - gprod(gw1,k1,t10) + SOS1_LB_gprod(gw1,k1,t10)
   = 0
 SOS1_LB_gprod(gw1,k2,t10): - gprod(gw1,k2,t10) + SOS1_LB_gprod(gw1,k2,t10)
   = 0
 SOS1_LB_gprod(gw1,k0,t11): - gprod(gw1,k0,t11) + SOS1_LB_gprod(gw1,k0,t11)
   = 0
 SOS1_LB_gprod(gw1,k1,t11): - gprod(gw1,k1,t11) + SOS1_LB_gprod(gw1,k1,t11)
   = 0
 SOS1_LB_gprod(gw1,k2,t11): - gprod(gw1,k2,t11) + SOS1_LB_gprod(gw1,k2,t11)
   = 0
 SOS1_LB_gprod(gw1,k0,t12): - gprod(gw1,k0,t12) + SOS1_LB_gprod(gw1,k0,t12)
   = 0
 SOS1_LB_gprod(gw1,k1,t12): - gprod(gw1,k1,t12) + SOS1_LB_gprod(gw1,k1,t12)
   = 0
 SOS1_LB_gprod(gw1,k2,t12): - gprod(gw1,k2,t12) + SOS1_LB_gprod(gw1,k2,t12)
   = 0
 SOS1_LB_gprod(gw1,k0,t13): - gprod(gw1,k0,t13) + SOS1_LB_gprod(gw1,k0,t13)
   = 0
 SOS1_LB_gprod(gw1,k1,t13): - gprod(gw1,k1,t13) + SOS1_LB_gprod(gw1,k1,t13)
   = 0
 SOS1_LB_gprod(gw1,k2,t13): - gprod(gw1,k2,t13) + SOS1_LB_gprod(gw1,k2,t13)
   = 0
 SOS1_LB_gprod(gw1,k0,t14): - gprod(gw1,k0,t14) + SOS1_LB_gprod(gw1,k0,t14)
   = 0
 SOS1_LB_gprod(gw1,k1,t14): - gprod(gw1,k1,t14) + SOS1_LB_gprod(gw1,k1,t14)
   = 0
 SOS1_LB_gprod(gw1,k2,t14): - gprod(gw1,k2,t14) + SOS1_LB_gprod(gw1,k2,t14)
   = 0
 SOS1_LB_gprod(gw1,k0,t15): - gprod(gw1,k0,t15) + SOS1_LB_gprod(gw1,k0,t15)
   = 0
 SOS1_LB_gprod(gw1,k1,t15): - gprod(gw1,k1,t15) + SOS1_LB_gprod(gw1,k1,t15)
   = 0
 SOS1_LB_gprod(gw1,k2,t15): - gprod(gw1,k2,t15) + SOS1_LB_gprod(gw1,k2,t15)
   = 0
 SOS1_LB_gprod(gw1,k0,t16): - gprod(gw1,k0,t16) + SOS1_LB_gprod(gw1,k0,t16)
   = 0
 SOS1_LB_gprod(gw1,k1,t16): - gprod(gw1,k1,t16) + SOS1_LB_gprod(gw1,k1,t16)
   = 0
 SOS1_LB_gprod(gw1,k2,t16): - gprod(gw1,k2,t16) + SOS1_LB_gprod(gw1,k2,t16)
   = 0
 SOS1_LB_gprod(gw1,k0,t17): - gprod(gw1,k0,t17) + SOS1_LB_gprod(gw1,k0,t17)
   = 0
 SOS1_LB_gprod(gw1,k1,t17): - gprod(gw1,k1,t17) + SOS1_LB_gprod(gw1,k1,t17)
   = 0
 SOS1_LB_gprod(gw1,k2,t17): - gprod(gw1,k2,t17) + SOS1_LB_gprod(gw1,k2,t17)
   = 0
 SOS1_LB_gprod(gw1,k0,t18): - gprod(gw1,k0,t18) + SOS1_LB_gprod(gw1,k0,t18)
   = 0
 SOS1_LB_gprod(gw1,k1,t18): - gprod(gw1,k1,t18) + SOS1_LB_gprod(gw1,k1,t18)
   = 0
 SOS1_LB_gprod(gw1,k2,t18): - gprod(gw1,k2,t18) + SOS1_LB_gprod(gw1,k2,t18)
   = 0
 SOS1_LB_gprod(gw1,k0,t19): - gprod(gw1,k0,t19) + SOS1_LB_gprod(gw1,k0,t19)
   = 0
 SOS1_LB_gprod(gw1,k1,t19): - gprod(gw1,k1,t19) + SOS1_LB_gprod(gw1,k1,t19)
   = 0
 SOS1_LB_gprod(gw1,k2,t19): - gprod(gw1,k2,t19) + SOS1_LB_gprod(gw1,k2,t19)
   = 0
 SOS1_LB_gprod(gw1,k0,t20): - gprod(gw1,k0,t20) + SOS1_LB_gprod(gw1,k0,t20)
   = 0
 SOS1_LB_gprod(gw1,k1,t20): - gprod(gw1,k1,t20) + SOS1_LB_gprod(gw1,k1,t20)
   = 0
 SOS1_LB_gprod(gw1,k2,t20): - gprod(gw1,k2,t20) + SOS1_LB_gprod(gw1,k2,t20)
   = 0
 SOS1_LB_gprod(gw1,k0,t21): - gprod(gw1,k0,t21) + SOS1_LB_gprod(gw1,k0,t21)
   = 0
 SOS1_LB_gprod(gw1,k1,t21): - gprod(gw1,k1,t21) + SOS1_LB_gprod(gw1,k1,t21)
   = 0
 SOS1_LB_gprod(gw1,k2,t21): - gprod(gw1,k2,t21) + SOS1_LB_gprod(gw1,k2,t21)
   = 0
 SOS1_LB_gprod(gw1,k0,t22): - gprod(gw1,k0,t22) + SOS1_LB_gprod(gw1,k0,t22)
   = 0
 SOS1_LB_gprod(gw1,k1,t22): - gprod(gw1,k1,t22) + SOS1_LB_gprod(gw1,k1,t22)
   = 0
 SOS1_LB_gprod(gw1,k2,t22): - gprod(gw1,k2,t22) + SOS1_LB_gprod(gw1,k2,t22)
   = 0
 SOS1_LB_gprod(gw1,k0,t23): - gprod(gw1,k0,t23) + SOS1_LB_gprod(gw1,k0,t23)
   = 0
 SOS1_LB_gprod(gw1,k1,t23): - gprod(gw1,k1,t23) + SOS1_LB_gprod(gw1,k1,t23)
   = 0
 SOS1_LB_gprod(gw1,k2,t23): - gprod(gw1,k2,t23) + SOS1_LB_gprod(gw1,k2,t23)
   = 0
 SOS1_LB_gprod(gw1,k0,t24): - gprod(gw1,k0,t24) + SOS1_LB_gprod(gw1,k0,t24)
   = 0
 SOS1_LB_gprod(gw1,k1,t24): - gprod(gw1,k1,t24) + SOS1_LB_gprod(gw1,k1,t24)
   = 0
 SOS1_LB_gprod(gw1,k2,t24): - gprod(gw1,k2,t24) + SOS1_LB_gprod(gw1,k2,t24)
   = 0
 SOS1_LB_gprod(gw2,k0,t1): - gprod(gw2,k0,t1) + SOS1_LB_gprod(gw2,k0,t1)
   = 0
 SOS1_LB_gprod(gw2,k1,t1): - gprod(gw2,k1,t1) + SOS1_LB_gprod(gw2,k1,t1)
   = 0
 SOS1_LB_gprod(gw2,k2,t1): - gprod(gw2,k2,t1) + SOS1_LB_gprod(gw2,k2,t1)
   = 0
 SOS1_LB_gprod(gw2,k0,t2): - gprod(gw2,k0,t2) + SOS1_LB_gprod(gw2,k0,t2)
   = 0
 SOS1_LB_gprod(gw2,k1,t2): - gprod(gw2,k1,t2) + SOS1_LB_gprod(gw2,k1,t2)
   = 0
 SOS1_LB_gprod(gw2,k2,t2): - gprod(gw2,k2,t2) + SOS1_LB_gprod(gw2,k2,t2)
   = 0
 SOS1_LB_gprod(gw2,k0,t3): - gprod(gw2,k0,t3) + SOS1_LB_gprod(gw2,k0,t3)
   = 0
 SOS1_LB_gprod(gw2,k1,t3): - gprod(gw2,k1,t3) + SOS1_LB_gprod(gw2,k1,t3)
   = 0
 SOS1_LB_gprod(gw2,k2,t3): - gprod(gw2,k2,t3) + SOS1_LB_gprod(gw2,k2,t3)
   = 0
 SOS1_LB_gprod(gw2,k0,t4): - gprod(gw2,k0,t4) + SOS1_LB_gprod(gw2,k0,t4)
   = 0
 SOS1_LB_gprod(gw2,k1,t4): - gprod(gw2,k1,t4) + SOS1_LB_gprod(gw2,k1,t4)
   = 0
 SOS1_LB_gprod(gw2,k2,t4): - gprod(gw2,k2,t4) + SOS1_LB_gprod(gw2,k2,t4)
   = 0
 SOS1_LB_gprod(gw2,k0,t5): - gprod(gw2,k0,t5) + SOS1_LB_gprod(gw2,k0,t5)
   = 0
 SOS1_LB_gprod(gw2,k1,t5): - gprod(gw2,k1,t5) + SOS1_LB_gprod(gw2,k1,t5)
   = 0
 SOS1_LB_gprod(gw2,k2,t5): - gprod(gw2,k2,t5) + SOS1_LB_gprod(gw2,k2,t5)
   = 0
 SOS1_LB_gprod(gw2,k0,t6): - gprod(gw2,k0,t6) + SOS1_LB_gprod(gw2,k0,t6)
   = 0
 SOS1_LB_gprod(gw2,k1,t6): - gprod(gw2,k1,t6) + SOS1_LB_gprod(gw2,k1,t6)
   = 0
 SOS1_LB_gprod(gw2,k2,t6): - gprod(gw2,k2,t6) + SOS1_LB_gprod(gw2,k2,t6)
   = 0
 SOS1_LB_gprod(gw2,k0,t7): - gprod(gw2,k0,t7) + SOS1_LB_gprod(gw2,k0,t7)
   = 0
 SOS1_LB_gprod(gw2,k1,t7): - gprod(gw2,k1,t7) + SOS1_LB_gprod(gw2,k1,t7)
   = 0
 SOS1_LB_gprod(gw2,k2,t7): - gprod(gw2,k2,t7) + SOS1_LB_gprod(gw2,k2,t7)
   = 0
 SOS1_LB_gprod(gw2,k0,t8): - gprod(gw2,k0,t8) + SOS1_LB_gprod(gw2,k0,t8)
   = 0
 SOS1_LB_gprod(gw2,k1,t8): - gprod(gw2,k1,t8) + SOS1_LB_gprod(gw2,k1,t8)
   = 0
 SOS1_LB_gprod(gw2,k2,t8): - gprod(gw2,k2,t8) + SOS1_LB_gprod(gw2,k2,t8)
   = 0
 SOS1_LB_gprod(gw2,k0,t9): - gprod(gw2,k0,t9) + SOS1_LB_gprod(gw2,k0,t9)
   = 0
 SOS1_LB_gprod(gw2,k1,t9): - gprod(gw2,k1,t9) + SOS1_LB_gprod(gw2,k1,t9)
   = 0
 SOS1_LB_gprod(gw2,k2,t9): - gprod(gw2,k2,t9) + SOS1_LB_gprod(gw2,k2,t9)
   = 0
 SOS1_LB_gprod(gw2,k0,t10): - gprod(gw2,k0,t10) + SOS1_LB_gprod(gw2,k0,t10)
   = 0
 SOS1_LB_gprod(gw2,k1,t10): - gprod(gw2,k1,t10) + SOS1_LB_gprod(gw2,k1,t10)
   = 0
 SOS1_LB_gprod(gw2,k2,t10): - gprod(gw2,k2,t10) + SOS1_LB_gprod(gw2,k2,t10)
   = 0
 SOS1_LB_gprod(gw2,k0,t11): - gprod(gw2,k0,t11) + SOS1_LB_gprod(gw2,k0,t11)
   = 0
 SOS1_LB_gprod(gw2,k1,t11): - gprod(gw2,k1,t11) + SOS1_LB_gprod(gw2,k1,t11)
   = 0
 SOS1_LB_gprod(gw2,k2,t11): - gprod(gw2,k2,t11) + SOS1_LB_gprod(gw2,k2,t11)
   = 0
 SOS1_LB_gprod(gw2,k0,t12): - gprod(gw2,k0,t12) + SOS1_LB_gprod(gw2,k0,t12)
   = 0
 SOS1_LB_gprod(gw2,k1,t12): - gprod(gw2,k1,t12) + SOS1_LB_gprod(gw2,k1,t12)
   = 0
 SOS1_LB_gprod(gw2,k2,t12): - gprod(gw2,k2,t12) + SOS1_LB_gprod(gw2,k2,t12)
   = 0
 SOS1_LB_gprod(gw2,k0,t13): - gprod(gw2,k0,t13) + SOS1_LB_gprod(gw2,k0,t13)
   = 0
 SOS1_LB_gprod(gw2,k1,t13): - gprod(gw2,k1,t13) + SOS1_LB_gprod(gw2,k1,t13)
   = 0
 SOS1_LB_gprod(gw2,k2,t13): - gprod(gw2,k2,t13) + SOS1_LB_gprod(gw2,k2,t13)
   = 0
 SOS1_LB_gprod(gw2,k0,t14): - gprod(gw2,k0,t14) + SOS1_LB_gprod(gw2,k0,t14)
   = 0
 SOS1_LB_gprod(gw2,k1,t14): - gprod(gw2,k1,t14) + SOS1_LB_gprod(gw2,k1,t14)
   = 0
 SOS1_LB_gprod(gw2,k2,t14): - gprod(gw2,k2,t14) + SOS1_LB_gprod(gw2,k2,t14)
   = 0
 SOS1_LB_gprod(gw2,k0,t15): - gprod(gw2,k0,t15) + SOS1_LB_gprod(gw2,k0,t15)
   = 0
 SOS1_LB_gprod(gw2,k1,t15): - gprod(gw2,k1,t15) + SOS1_LB_gprod(gw2,k1,t15)
   = 0
 SOS1_LB_gprod(gw2,k2,t15): - gprod(gw2,k2,t15) + SOS1_LB_gprod(gw2,k2,t15)
   = 0
 SOS1_LB_gprod(gw2,k0,t16): - gprod(gw2,k0,t16) + SOS1_LB_gprod(gw2,k0,t16)
   = 0
 SOS1_LB_gprod(gw2,k1,t16): - gprod(gw2,k1,t16) + SOS1_LB_gprod(gw2,k1,t16)
   = 0
 SOS1_LB_gprod(gw2,k2,t16): - gprod(gw2,k2,t16) + SOS1_LB_gprod(gw2,k2,t16)
   = 0
 SOS1_LB_gprod(gw2,k0,t17): - gprod(gw2,k0,t17) + SOS1_LB_gprod(gw2,k0,t17)
   = 0
 SOS1_LB_gprod(gw2,k1,t17): - gprod(gw2,k1,t17) + SOS1_LB_gprod(gw2,k1,t17)
   = 0
 SOS1_LB_gprod(gw2,k2,t17): - gprod(gw2,k2,t17) + SOS1_LB_gprod(gw2,k2,t17)
   = 0
 SOS1_LB_gprod(gw2,k0,t18): - gprod(gw2,k0,t18) + SOS1_LB_gprod(gw2,k0,t18)
   = 0
 SOS1_LB_gprod(gw2,k1,t18): - gprod(gw2,k1,t18) + SOS1_LB_gprod(gw2,k1,t18)
   = 0
 SOS1_LB_gprod(gw2,k2,t18): - gprod(gw2,k2,t18) + SOS1_LB_gprod(gw2,k2,t18)
   = 0
 SOS1_LB_gprod(gw2,k0,t19): - gprod(gw2,k0,t19) + SOS1_LB_gprod(gw2,k0,t19)
   = 0
 SOS1_LB_gprod(gw2,k1,t19): - gprod(gw2,k1,t19) + SOS1_LB_gprod(gw2,k1,t19)
   = 0
 SOS1_LB_gprod(gw2,k2,t19): - gprod(gw2,k2,t19) + SOS1_LB_gprod(gw2,k2,t19)
   = 0
 SOS1_LB_gprod(gw2,k0,t20): - gprod(gw2,k0,t20) + SOS1_LB_gprod(gw2,k0,t20)
   = 0
 SOS1_LB_gprod(gw2,k1,t20): - gprod(gw2,k1,t20) + SOS1_LB_gprod(gw2,k1,t20)
   = 0
 SOS1_LB_gprod(gw2,k2,t20): - gprod(gw2,k2,t20) + SOS1_LB_gprod(gw2,k2,t20)
   = 0
 SOS1_LB_gprod(gw2,k0,t21): - gprod(gw2,k0,t21) + SOS1_LB_gprod(gw2,k0,t21)
   = 0
 SOS1_LB_gprod(gw2,k1,t21): - gprod(gw2,k1,t21) + SOS1_LB_gprod(gw2,k1,t21)
   = 0
 SOS1_LB_gprod(gw2,k2,t21): - gprod(gw2,k2,t21) + SOS1_LB_gprod(gw2,k2,t21)
   = 0
 SOS1_LB_gprod(gw2,k0,t22): - gprod(gw2,k0,t22) + SOS1_LB_gprod(gw2,k0,t22)
   = 0
 SOS1_LB_gprod(gw2,k1,t22): - gprod(gw2,k1,t22) + SOS1_LB_gprod(gw2,k1,t22)
   = 0
 SOS1_LB_gprod(gw2,k2,t22): - gprod(gw2,k2,t22) + SOS1_LB_gprod(gw2,k2,t22)
   = 0
 SOS1_LB_gprod(gw2,k0,t23): - gprod(gw2,k0,t23) + SOS1_LB_gprod(gw2,k0,t23)
   = 0
 SOS1_LB_gprod(gw2,k1,t23): - gprod(gw2,k1,t23) + SOS1_LB_gprod(gw2,k1,t23)
   = 0
 SOS1_LB_gprod(gw2,k2,t23): - gprod(gw2,k2,t23) + SOS1_LB_gprod(gw2,k2,t23)
   = 0
 SOS1_LB_gprod(gw2,k0,t24): - gprod(gw2,k0,t24) + SOS1_LB_gprod(gw2,k0,t24)
   = 0
 SOS1_LB_gprod(gw2,k1,t24): - gprod(gw2,k1,t24) + SOS1_LB_gprod(gw2,k1,t24)
   = 0
 SOS1_LB_gprod(gw2,k2,t24): - gprod(gw2,k2,t24) + SOS1_LB_gprod(gw2,k2,t24)
   = 0
 SOS1_LB_gprod(gw3,k0,t1): - gprod(gw3,k0,t1) + SOS1_LB_gprod(gw3,k0,t1)
   = 0
 SOS1_LB_gprod(gw3,k1,t1): - gprod(gw3,k1,t1) + SOS1_LB_gprod(gw3,k1,t1)
   = 0
 SOS1_LB_gprod(gw3,k2,t1): - gprod(gw3,k2,t1) + SOS1_LB_gprod(gw3,k2,t1)
   = 0
 SOS1_LB_gprod(gw3,k0,t2): - gprod(gw3,k0,t2) + SOS1_LB_gprod(gw3,k0,t2)
   = 0
 SOS1_LB_gprod(gw3,k1,t2): - gprod(gw3,k1,t2) + SOS1_LB_gprod(gw3,k1,t2)
   = 0
 SOS1_LB_gprod(gw3,k2,t2): - gprod(gw3,k2,t2) + SOS1_LB_gprod(gw3,k2,t2)
   = 0
 SOS1_LB_gprod(gw3,k0,t3): - gprod(gw3,k0,t3) + SOS1_LB_gprod(gw3,k0,t3)
   = 0
 SOS1_LB_gprod(gw3,k1,t3): - gprod(gw3,k1,t3) + SOS1_LB_gprod(gw3,k1,t3)
   = 0
 SOS1_LB_gprod(gw3,k2,t3): - gprod(gw3,k2,t3) + SOS1_LB_gprod(gw3,k2,t3)
   = 0
 SOS1_LB_gprod(gw3,k0,t4): - gprod(gw3,k0,t4) + SOS1_LB_gprod(gw3,k0,t4)
   = 0
 SOS1_LB_gprod(gw3,k1,t4): - gprod(gw3,k1,t4) + SOS1_LB_gprod(gw3,k1,t4)
   = 0
 SOS1_LB_gprod(gw3,k2,t4): - gprod(gw3,k2,t4) + SOS1_LB_gprod(gw3,k2,t4)
   = 0
 SOS1_LB_gprod(gw3,k0,t5): - gprod(gw3,k0,t5) + SOS1_LB_gprod(gw3,k0,t5)
   = 0
 SOS1_LB_gprod(gw3,k1,t5): - gprod(gw3,k1,t5) + SOS1_LB_gprod(gw3,k1,t5)
   = 0
 SOS1_LB_gprod(gw3,k2,t5): - gprod(gw3,k2,t5) + SOS1_LB_gprod(gw3,k2,t5)
   = 0
 SOS1_LB_gprod(gw3,k0,t6): - gprod(gw3,k0,t6) + SOS1_LB_gprod(gw3,k0,t6)
   = 0
 SOS1_LB_gprod(gw3,k1,t6): - gprod(gw3,k1,t6) + SOS1_LB_gprod(gw3,k1,t6)
   = 0
 SOS1_LB_gprod(gw3,k2,t6): - gprod(gw3,k2,t6) + SOS1_LB_gprod(gw3,k2,t6)
   = 0
 SOS1_LB_gprod(gw3,k0,t7): - gprod(gw3,k0,t7) + SOS1_LB_gprod(gw3,k0,t7)
   = 0
 SOS1_LB_gprod(gw3,k1,t7): - gprod(gw3,k1,t7) + SOS1_LB_gprod(gw3,k1,t7)
   = 0
 SOS1_LB_gprod(gw3,k2,t7): - gprod(gw3,k2,t7) + SOS1_LB_gprod(gw3,k2,t7)
   = 0
 SOS1_LB_gprod(gw3,k0,t8): - gprod(gw3,k0,t8) + SOS1_LB_gprod(gw3,k0,t8)
   = 0
 SOS1_LB_gprod(gw3,k1,t8): - gprod(gw3,k1,t8) + SOS1_LB_gprod(gw3,k1,t8)
   = 0
 SOS1_LB_gprod(gw3,k2,t8): - gprod(gw3,k2,t8) + SOS1_LB_gprod(gw3,k2,t8)
   = 0
 SOS1_LB_gprod(gw3,k0,t9): - gprod(gw3,k0,t9) + SOS1_LB_gprod(gw3,k0,t9)
   = 0
 SOS1_LB_gprod(gw3,k1,t9): - gprod(gw3,k1,t9) + SOS1_LB_gprod(gw3,k1,t9)
   = 0
 SOS1_LB_gprod(gw3,k2,t9): - gprod(gw3,k2,t9) + SOS1_LB_gprod(gw3,k2,t9)
   = 0
 SOS1_LB_gprod(gw3,k0,t10): - gprod(gw3,k0,t10) + SOS1_LB_gprod(gw3,k0,t10)
   = 0
 SOS1_LB_gprod(gw3,k1,t10): - gprod(gw3,k1,t10) + SOS1_LB_gprod(gw3,k1,t10)
   = 0
 SOS1_LB_gprod(gw3,k2,t10): - gprod(gw3,k2,t10) + SOS1_LB_gprod(gw3,k2,t10)
   = 0
 SOS1_LB_gprod(gw3,k0,t11): - gprod(gw3,k0,t11) + SOS1_LB_gprod(gw3,k0,t11)
   = 0
 SOS1_LB_gprod(gw3,k1,t11): - gprod(gw3,k1,t11) + SOS1_LB_gprod(gw3,k1,t11)
   = 0
 SOS1_LB_gprod(gw3,k2,t11): - gprod(gw3,k2,t11) + SOS1_LB_gprod(gw3,k2,t11)
   = 0
 SOS1_LB_gprod(gw3,k0,t12): - gprod(gw3,k0,t12) + SOS1_LB_gprod(gw3,k0,t12)
   = 0
 SOS1_LB_gprod(gw3,k1,t12): - gprod(gw3,k1,t12) + SOS1_LB_gprod(gw3,k1,t12)
   = 0
 SOS1_LB_gprod(gw3,k2,t12): - gprod(gw3,k2,t12) + SOS1_LB_gprod(gw3,k2,t12)
   = 0
 SOS1_LB_gprod(gw3,k0,t13): - gprod(gw3,k0,t13) + SOS1_LB_gprod(gw3,k0,t13)
   = 0
 SOS1_LB_gprod(gw3,k1,t13): - gprod(gw3,k1,t13) + SOS1_LB_gprod(gw3,k1,t13)
   = 0
 SOS1_LB_gprod(gw3,k2,t13): - gprod(gw3,k2,t13) + SOS1_LB_gprod(gw3,k2,t13)
   = 0
 SOS1_LB_gprod(gw3,k0,t14): - gprod(gw3,k0,t14) + SOS1_LB_gprod(gw3,k0,t14)
   = 0
 SOS1_LB_gprod(gw3,k1,t14): - gprod(gw3,k1,t14) + SOS1_LB_gprod(gw3,k1,t14)
   = 0
 SOS1_LB_gprod(gw3,k2,t14): - gprod(gw3,k2,t14) + SOS1_LB_gprod(gw3,k2,t14)
   = 0
 SOS1_LB_gprod(gw3,k0,t15): - gprod(gw3,k0,t15) + SOS1_LB_gprod(gw3,k0,t15)
   = 0
 SOS1_LB_gprod(gw3,k1,t15): - gprod(gw3,k1,t15) + SOS1_LB_gprod(gw3,k1,t15)
   = 0
 SOS1_LB_gprod(gw3,k2,t15): - gprod(gw3,k2,t15) + SOS1_LB_gprod(gw3,k2,t15)
   = 0
 SOS1_LB_gprod(gw3,k0,t16): - gprod(gw3,k0,t16) + SOS1_LB_gprod(gw3,k0,t16)
   = 0
 SOS1_LB_gprod(gw3,k1,t16): - gprod(gw3,k1,t16) + SOS1_LB_gprod(gw3,k1,t16)
   = 0
 SOS1_LB_gprod(gw3,k2,t16): - gprod(gw3,k2,t16) + SOS1_LB_gprod(gw3,k2,t16)
   = 0
 SOS1_LB_gprod(gw3,k0,t17): - gprod(gw3,k0,t17) + SOS1_LB_gprod(gw3,k0,t17)
   = 0
 SOS1_LB_gprod(gw3,k1,t17): - gprod(gw3,k1,t17) + SOS1_LB_gprod(gw3,k1,t17)
   = 0
 SOS1_LB_gprod(gw3,k2,t17): - gprod(gw3,k2,t17) + SOS1_LB_gprod(gw3,k2,t17)
   = 0
 SOS1_LB_gprod(gw3,k0,t18): - gprod(gw3,k0,t18) + SOS1_LB_gprod(gw3,k0,t18)
   = 0
 SOS1_LB_gprod(gw3,k1,t18): - gprod(gw3,k1,t18) + SOS1_LB_gprod(gw3,k1,t18)
   = 0
 SOS1_LB_gprod(gw3,k2,t18): - gprod(gw3,k2,t18) + SOS1_LB_gprod(gw3,k2,t18)
   = 0
 SOS1_LB_gprod(gw3,k0,t19): - gprod(gw3,k0,t19) + SOS1_LB_gprod(gw3,k0,t19)
   = 0
 SOS1_LB_gprod(gw3,k1,t19): - gprod(gw3,k1,t19) + SOS1_LB_gprod(gw3,k1,t19)
   = 0
 SOS1_LB_gprod(gw3,k2,t19): - gprod(gw3,k2,t19) + SOS1_LB_gprod(gw3,k2,t19)
   = 0
 SOS1_LB_gprod(gw3,k0,t20): - gprod(gw3,k0,t20) + SOS1_LB_gprod(gw3,k0,t20)
   = 0
 SOS1_LB_gprod(gw3,k1,t20): - gprod(gw3,k1,t20) + SOS1_LB_gprod(gw3,k1,t20)
   = 0
 SOS1_LB_gprod(gw3,k2,t20): - gprod(gw3,k2,t20) + SOS1_LB_gprod(gw3,k2,t20)
   = 0
 SOS1_LB_gprod(gw3,k0,t21): - gprod(gw3,k0,t21) + SOS1_LB_gprod(gw3,k0,t21)
   = 0
 SOS1_LB_gprod(gw3,k1,t21): - gprod(gw3,k1,t21) + SOS1_LB_gprod(gw3,k1,t21)
   = 0
 SOS1_LB_gprod(gw3,k2,t21): - gprod(gw3,k2,t21) + SOS1_LB_gprod(gw3,k2,t21)
   = 0
 SOS1_LB_gprod(gw3,k0,t22): - gprod(gw3,k0,t22) + SOS1_LB_gprod(gw3,k0,t22)
   = 0
 SOS1_LB_gprod(gw3,k1,t22): - gprod(gw3,k1,t22) + SOS1_LB_gprod(gw3,k1,t22)
   = 0
 SOS1_LB_gprod(gw3,k2,t22): - gprod(gw3,k2,t22) + SOS1_LB_gprod(gw3,k2,t22)
   = 0
 SOS1_LB_gprod(gw3,k0,t23): - gprod(gw3,k0,t23) + SOS1_LB_gprod(gw3,k0,t23)
   = 0
 SOS1_LB_gprod(gw3,k1,t23): - gprod(gw3,k1,t23) + SOS1_LB_gprod(gw3,k1,t23)
   = 0
 SOS1_LB_gprod(gw3,k2,t23): - gprod(gw3,k2,t23) + SOS1_LB_gprod(gw3,k2,t23)
   = 0
 SOS1_LB_gprod(gw3,k0,t24): - gprod(gw3,k0,t24) + SOS1_LB_gprod(gw3,k0,t24)
   = 0
 SOS1_LB_gprod(gw3,k1,t24): - gprod(gw3,k1,t24) + SOS1_LB_gprod(gw3,k1,t24)
   = 0
 SOS1_LB_gprod(gw3,k2,t24): - gprod(gw3,k2,t24) + SOS1_LB_gprod(gw3,k2,t24)
   = 0
 SOS1_LB_gsin(gs1,t1,k0): - gsin(gs1,t1,k0) + SOS1_LB_gsin(gs1,t1,k0) = 0
 SOS1_LB_gsout(gs1,t1,k0): - gsout(gs1,t1,k0) + SOS1_LB_gsout(gs1,t1,k0)
   = 0
 SOS1_LB_gstore(gs1,t1,k0): - gstore(gs1,t1,k0) + SOS1_LB_gstore(gs1,t1,k0)
   = 0
 SOS1_LB_gsin(gs1,t1,k1): - gsin(gs1,t1,k1) + SOS1_LB_gsin(gs1,t1,k1) = 0
 SOS1_LB_gsout(gs1,t1,k1): - gsout(gs1,t1,k1) + SOS1_LB_gsout(gs1,t1,k1)
   = 0
 SOS1_LB_gstore(gs1,t1,k1): - gstore(gs1,t1,k1) + SOS1_LB_gstore(gs1,t1,k1)
   = 0
 SOS1_LB_gsin(gs1,t1,k2): - gsin(gs1,t1,k2) + SOS1_LB_gsin(gs1,t1,k2) = 0
 SOS1_LB_gsout(gs1,t1,k2): - gsout(gs1,t1,k2) + SOS1_LB_gsout(gs1,t1,k2)
   = 0
 SOS1_LB_gstore(gs1,t1,k2): - gstore(gs1,t1,k2) + SOS1_LB_gstore(gs1,t1,k2)
   = 0
 SOS1_LB_gsin(gs1,t2,k0): - gsin(gs1,t2,k0) + SOS1_LB_gsin(gs1,t2,k0) = 0
 SOS1_LB_gsout(gs1,t2,k0): - gsout(gs1,t2,k0) + SOS1_LB_gsout(gs1,t2,k0)
   = 0
 SOS1_LB_gstore(gs1,t2,k0): - gstore(gs1,t2,k0) + SOS1_LB_gstore(gs1,t2,k0)
   = 0
 SOS1_LB_gsin(gs1,t2,k1): - gsin(gs1,t2,k1) + SOS1_LB_gsin(gs1,t2,k1) = 0
 SOS1_LB_gsout(gs1,t2,k1): - gsout(gs1,t2,k1) + SOS1_LB_gsout(gs1,t2,k1)
   = 0
 SOS1_LB_gstore(gs1,t2,k1): - gstore(gs1,t2,k1) + SOS1_LB_gstore(gs1,t2,k1)
   = 0
 SOS1_LB_gsin(gs1,t2,k2): - gsin(gs1,t2,k2) + SOS1_LB_gsin(gs1,t2,k2) = 0
 SOS1_LB_gsout(gs1,t2,k2): - gsout(gs1,t2,k2) + SOS1_LB_gsout(gs1,t2,k2)
   = 0
 SOS1_LB_gstore(gs1,t2,k2): - gstore(gs1,t2,k2) + SOS1_LB_gstore(gs1,t2,k2)
   = 0
 SOS1_LB_gsin(gs1,t3,k0): - gsin(gs1,t3,k0) + SOS1_LB_gsin(gs1,t3,k0) = 0
 SOS1_LB_gsout(gs1,t3,k0): - gsout(gs1,t3,k0) + SOS1_LB_gsout(gs1,t3,k0)
   = 0
 SOS1_LB_gstore(gs1,t3,k0): - gstore(gs1,t3,k0) + SOS1_LB_gstore(gs1,t3,k0)
   = 0
 SOS1_LB_gsin(gs1,t3,k1): - gsin(gs1,t3,k1) + SOS1_LB_gsin(gs1,t3,k1) = 0
 SOS1_LB_gsout(gs1,t3,k1): - gsout(gs1,t3,k1) + SOS1_LB_gsout(gs1,t3,k1)
   = 0
 SOS1_LB_gstore(gs1,t3,k1): - gstore(gs1,t3,k1) + SOS1_LB_gstore(gs1,t3,k1)
   = 0
 SOS1_LB_gsin(gs1,t3,k2): - gsin(gs1,t3,k2) + SOS1_LB_gsin(gs1,t3,k2) = 0
 SOS1_LB_gsout(gs1,t3,k2): - gsout(gs1,t3,k2) + SOS1_LB_gsout(gs1,t3,k2)
   = 0
 SOS1_LB_gstore(gs1,t3,k2): - gstore(gs1,t3,k2) + SOS1_LB_gstore(gs1,t3,k2)
   = 0
 SOS1_LB_gsin(gs1,t4,k0): - gsin(gs1,t4,k0) + SOS1_LB_gsin(gs1,t4,k0) = 0
 SOS1_LB_gsout(gs1,t4,k0): - gsout(gs1,t4,k0) + SOS1_LB_gsout(gs1,t4,k0)
   = 0
 SOS1_LB_gstore(gs1,t4,k0): - gstore(gs1,t4,k0) + SOS1_LB_gstore(gs1,t4,k0)
   = 0
 SOS1_LB_gsin(gs1,t4,k1): - gsin(gs1,t4,k1) + SOS1_LB_gsin(gs1,t4,k1) = 0
 SOS1_LB_gsout(gs1,t4,k1): - gsout(gs1,t4,k1) + SOS1_LB_gsout(gs1,t4,k1)
   = 0
 SOS1_LB_gstore(gs1,t4,k1): - gstore(gs1,t4,k1) + SOS1_LB_gstore(gs1,t4,k1)
   = 0
 SOS1_LB_gsin(gs1,t4,k2): - gsin(gs1,t4,k2) + SOS1_LB_gsin(gs1,t4,k2) = 0
 SOS1_LB_gsout(gs1,t4,k2): - gsout(gs1,t4,k2) + SOS1_LB_gsout(gs1,t4,k2)
   = 0
 SOS1_LB_gstore(gs1,t4,k2): - gstore(gs1,t4,k2) + SOS1_LB_gstore(gs1,t4,k2)
   = 0
 SOS1_LB_gsin(gs1,t5,k0): - gsin(gs1,t5,k0) + SOS1_LB_gsin(gs1,t5,k0) = 0
 SOS1_LB_gsout(gs1,t5,k0): - gsout(gs1,t5,k0) + SOS1_LB_gsout(gs1,t5,k0)
   = 0
 SOS1_LB_gstore(gs1,t5,k0): - gstore(gs1,t5,k0) + SOS1_LB_gstore(gs1,t5,k0)
   = 0
 SOS1_LB_gsin(gs1,t5,k1): - gsin(gs1,t5,k1) + SOS1_LB_gsin(gs1,t5,k1) = 0
 SOS1_LB_gsout(gs1,t5,k1): - gsout(gs1,t5,k1) + SOS1_LB_gsout(gs1,t5,k1)
   = 0
 SOS1_LB_gstore(gs1,t5,k1): - gstore(gs1,t5,k1) + SOS1_LB_gstore(gs1,t5,k1)
   = 0
 SOS1_LB_gsin(gs1,t5,k2): - gsin(gs1,t5,k2) + SOS1_LB_gsin(gs1,t5,k2) = 0
 SOS1_LB_gsout(gs1,t5,k2): - gsout(gs1,t5,k2) + SOS1_LB_gsout(gs1,t5,k2)
   = 0
 SOS1_LB_gstore(gs1,t5,k2): - gstore(gs1,t5,k2) + SOS1_LB_gstore(gs1,t5,k2)
   = 0
 SOS1_LB_gsin(gs1,t6,k0): - gsin(gs1,t6,k0) + SOS1_LB_gsin(gs1,t6,k0) = 0
 SOS1_LB_gsout(gs1,t6,k0): - gsout(gs1,t6,k0) + SOS1_LB_gsout(gs1,t6,k0)
   = 0
 SOS1_LB_gstore(gs1,t6,k0): - gstore(gs1,t6,k0) + SOS1_LB_gstore(gs1,t6,k0)
   = 0
 SOS1_LB_gsin(gs1,t6,k1): - gsin(gs1,t6,k1) + SOS1_LB_gsin(gs1,t6,k1) = 0
 SOS1_LB_gsout(gs1,t6,k1): - gsout(gs1,t6,k1) + SOS1_LB_gsout(gs1,t6,k1)
   = 0
 SOS1_LB_gstore(gs1,t6,k1): - gstore(gs1,t6,k1) + SOS1_LB_gstore(gs1,t6,k1)
   = 0
 SOS1_LB_gsin(gs1,t6,k2): - gsin(gs1,t6,k2) + SOS1_LB_gsin(gs1,t6,k2) = 0
 SOS1_LB_gsout(gs1,t6,k2): - gsout(gs1,t6,k2) + SOS1_LB_gsout(gs1,t6,k2)
   = 0
 SOS1_LB_gstore(gs1,t6,k2): - gstore(gs1,t6,k2) + SOS1_LB_gstore(gs1,t6,k2)
   = 0
 SOS1_LB_gsin(gs1,t7,k0): - gsin(gs1,t7,k0) + SOS1_LB_gsin(gs1,t7,k0) = 0
 SOS1_LB_gsout(gs1,t7,k0): - gsout(gs1,t7,k0) + SOS1_LB_gsout(gs1,t7,k0)
   = 0
 SOS1_LB_gstore(gs1,t7,k0): - gstore(gs1,t7,k0) + SOS1_LB_gstore(gs1,t7,k0)
   = 0
 SOS1_LB_gsin(gs1,t7,k1): - gsin(gs1,t7,k1) + SOS1_LB_gsin(gs1,t7,k1) = 0
 SOS1_LB_gsout(gs1,t7,k1): - gsout(gs1,t7,k1) + SOS1_LB_gsout(gs1,t7,k1)
   = 0
 SOS1_LB_gstore(gs1,t7,k1): - gstore(gs1,t7,k1) + SOS1_LB_gstore(gs1,t7,k1)
   = 0
 SOS1_LB_gsin(gs1,t7,k2): - gsin(gs1,t7,k2) + SOS1_LB_gsin(gs1,t7,k2) = 0
 SOS1_LB_gsout(gs1,t7,k2): - gsout(gs1,t7,k2) + SOS1_LB_gsout(gs1,t7,k2)
   = 0
 SOS1_LB_gstore(gs1,t7,k2): - gstore(gs1,t7,k2) + SOS1_LB_gstore(gs1,t7,k2)
   = 0
 SOS1_LB_gsin(gs1,t8,k0): - gsin(gs1,t8,k0) + SOS1_LB_gsin(gs1,t8,k0) = 0
 SOS1_LB_gsout(gs1,t8,k0): - gsout(gs1,t8,k0) + SOS1_LB_gsout(gs1,t8,k0)
   = 0
 SOS1_LB_gstore(gs1,t8,k0): - gstore(gs1,t8,k0) + SOS1_LB_gstore(gs1,t8,k0)
   = 0
 SOS1_LB_gsin(gs1,t8,k1): - gsin(gs1,t8,k1) + SOS1_LB_gsin(gs1,t8,k1) = 0
 SOS1_LB_gsout(gs1,t8,k1): - gsout(gs1,t8,k1) + SOS1_LB_gsout(gs1,t8,k1)
   = 0
 SOS1_LB_gstore(gs1,t8,k1): - gstore(gs1,t8,k1) + SOS1_LB_gstore(gs1,t8,k1)
   = 0
 SOS1_LB_gsin(gs1,t8,k2): - gsin(gs1,t8,k2) + SOS1_LB_gsin(gs1,t8,k2) = 0
 SOS1_LB_gsout(gs1,t8,k2): - gsout(gs1,t8,k2) + SOS1_LB_gsout(gs1,t8,k2)
   = 0
 SOS1_LB_gstore(gs1,t8,k2): - gstore(gs1,t8,k2) + SOS1_LB_gstore(gs1,t8,k2)
   = 0
 SOS1_LB_gsin(gs1,t9,k0): - gsin(gs1,t9,k0) + SOS1_LB_gsin(gs1,t9,k0) = 0
 SOS1_LB_gsout(gs1,t9,k0): - gsout(gs1,t9,k0) + SOS1_LB_gsout(gs1,t9,k0)
   = 0
 SOS1_LB_gstore(gs1,t9,k0): - gstore(gs1,t9,k0) + SOS1_LB_gstore(gs1,t9,k0)
   = 0
 SOS1_LB_gsin(gs1,t9,k1): - gsin(gs1,t9,k1) + SOS1_LB_gsin(gs1,t9,k1) = 0
 SOS1_LB_gsout(gs1,t9,k1): - gsout(gs1,t9,k1) + SOS1_LB_gsout(gs1,t9,k1)
   = 0
 SOS1_LB_gstore(gs1,t9,k1): - gstore(gs1,t9,k1) + SOS1_LB_gstore(gs1,t9,k1)
   = 0
 SOS1_LB_gsin(gs1,t9,k2): - gsin(gs1,t9,k2) + SOS1_LB_gsin(gs1,t9,k2) = 0
 SOS1_LB_gsout(gs1,t9,k2): - gsout(gs1,t9,k2) + SOS1_LB_gsout(gs1,t9,k2)
   = 0
 SOS1_LB_gstore(gs1,t9,k2): - gstore(gs1,t9,k2) + SOS1_LB_gstore(gs1,t9,k2)
   = 0
 SOS1_LB_gsin(gs1,t10,k0): - gsin(gs1,t10,k0) + SOS1_LB_gsin(gs1,t10,k0)
   = 0
 SOS1_LB_gsout(gs1,t10,k0): - gsout(gs1,t10,k0) + SOS1_LB_gsout(gs1,t10,k0)
   = 0
 SOS1_LB_gstore(gs1,t10,k0): - gstore(gs1,t10,k0)
   + SOS1_LB_gstore(gs1,t10,k0) = 0
 SOS1_LB_gsin(gs1,t10,k1): - gsin(gs1,t10,k1) + SOS1_LB_gsin(gs1,t10,k1)
   = 0
 SOS1_LB_gsout(gs1,t10,k1): - gsout(gs1,t10,k1) + SOS1_LB_gsout(gs1,t10,k1)
   = 0
 SOS1_LB_gstore(gs1,t10,k1): - gstore(gs1,t10,k1)
   + SOS1_LB_gstore(gs1,t10,k1) = 0
 SOS1_LB_gsin(gs1,t10,k2): - gsin(gs1,t10,k2) + SOS1_LB_gsin(gs1,t10,k2)
   = 0
 SOS1_LB_gsout(gs1,t10,k2): - gsout(gs1,t10,k2) + SOS1_LB_gsout(gs1,t10,k2)
   = 0
 SOS1_LB_gstore(gs1,t10,k2): - gstore(gs1,t10,k2)
   + SOS1_LB_gstore(gs1,t10,k2) = 0
 SOS1_LB_gsin(gs1,t11,k0): - gsin(gs1,t11,k0) + SOS1_LB_gsin(gs1,t11,k0)
   = 0
 SOS1_LB_gsout(gs1,t11,k0): - gsout(gs1,t11,k0) + SOS1_LB_gsout(gs1,t11,k0)
   = 0
 SOS1_LB_gstore(gs1,t11,k0): - gstore(gs1,t11,k0)
   + SOS1_LB_gstore(gs1,t11,k0) = 0
 SOS1_LB_gsin(gs1,t11,k1): - gsin(gs1,t11,k1) + SOS1_LB_gsin(gs1,t11,k1)
   = 0
 SOS1_LB_gsout(gs1,t11,k1): - gsout(gs1,t11,k1) + SOS1_LB_gsout(gs1,t11,k1)
   = 0
 SOS1_LB_gstore(gs1,t11,k1): - gstore(gs1,t11,k1)
   + SOS1_LB_gstore(gs1,t11,k1) = 0
 SOS1_LB_gsin(gs1,t11,k2): - gsin(gs1,t11,k2) + SOS1_LB_gsin(gs1,t11,k2)
   = 0
 SOS1_LB_gsout(gs1,t11,k2): - gsout(gs1,t11,k2) + SOS1_LB_gsout(gs1,t11,k2)
   = 0
 SOS1_LB_gstore(gs1,t11,k2): - gstore(gs1,t11,k2)
   + SOS1_LB_gstore(gs1,t11,k2) = 0
 SOS1_LB_gsin(gs1,t12,k0): - gsin(gs1,t12,k0) + SOS1_LB_gsin(gs1,t12,k0)
   = 0
 SOS1_LB_gsout(gs1,t12,k0): - gsout(gs1,t12,k0) + SOS1_LB_gsout(gs1,t12,k0)
   = 0
 SOS1_LB_gstore(gs1,t12,k0): - gstore(gs1,t12,k0)
   + SOS1_LB_gstore(gs1,t12,k0) = 0
 SOS1_LB_gsin(gs1,t12,k1): - gsin(gs1,t12,k1) + SOS1_LB_gsin(gs1,t12,k1)
   = 0
 SOS1_LB_gsout(gs1,t12,k1): - gsout(gs1,t12,k1) + SOS1_LB_gsout(gs1,t12,k1)
   = 0
 SOS1_LB_gstore(gs1,t12,k1): - gstore(gs1,t12,k1)
   + SOS1_LB_gstore(gs1,t12,k1) = 0
 SOS1_LB_gsin(gs1,t12,k2): - gsin(gs1,t12,k2) + SOS1_LB_gsin(gs1,t12,k2)
   = 0
 SOS1_LB_gsout(gs1,t12,k2): - gsout(gs1,t12,k2) + SOS1_LB_gsout(gs1,t12,k2)
   = 0
 SOS1_LB_gstore(gs1,t12,k2): - gstore(gs1,t12,k2)
   + SOS1_LB_gstore(gs1,t12,k2) = 0
 SOS1_LB_gsin(gs1,t13,k0): - gsin(gs1,t13,k0) + SOS1_LB_gsin(gs1,t13,k0)
   = 0
 SOS1_LB_gsout(gs1,t13,k0): - gsout(gs1,t13,k0) + SOS1_LB_gsout(gs1,t13,k0)
   = 0
 SOS1_LB_gstore(gs1,t13,k0): - gstore(gs1,t13,k0)
   + SOS1_LB_gstore(gs1,t13,k0) = 0
 SOS1_LB_gsin(gs1,t13,k1): - gsin(gs1,t13,k1) + SOS1_LB_gsin(gs1,t13,k1)
   = 0
 SOS1_LB_gsout(gs1,t13,k1): - gsout(gs1,t13,k1) + SOS1_LB_gsout(gs1,t13,k1)
   = 0
 SOS1_LB_gstore(gs1,t13,k1): - gstore(gs1,t13,k1)
   + SOS1_LB_gstore(gs1,t13,k1) = 0
 SOS1_LB_gsin(gs1,t13,k2): - gsin(gs1,t13,k2) + SOS1_LB_gsin(gs1,t13,k2)
   = 0
 SOS1_LB_gsout(gs1,t13,k2): - gsout(gs1,t13,k2) + SOS1_LB_gsout(gs1,t13,k2)
   = 0
 SOS1_LB_gstore(gs1,t13,k2): - gstore(gs1,t13,k2)
   + SOS1_LB_gstore(gs1,t13,k2) = 0
 SOS1_LB_gsin(gs1,t14,k0): - gsin(gs1,t14,k0) + SOS1_LB_gsin(gs1,t14,k0)
   = 0
 SOS1_LB_gsout(gs1,t14,k0): - gsout(gs1,t14,k0) + SOS1_LB_gsout(gs1,t14,k0)
   = 0
 SOS1_LB_gstore(gs1,t14,k0): - gstore(gs1,t14,k0)
   + SOS1_LB_gstore(gs1,t14,k0) = 0
 SOS1_LB_gsin(gs1,t14,k1): - gsin(gs1,t14,k1) + SOS1_LB_gsin(gs1,t14,k1)
   = 0
 SOS1_LB_gsout(gs1,t14,k1): - gsout(gs1,t14,k1) + SOS1_LB_gsout(gs1,t14,k1)
   = 0
 SOS1_LB_gstore(gs1,t14,k1): - gstore(gs1,t14,k1)
   + SOS1_LB_gstore(gs1,t14,k1) = 0
 SOS1_LB_gsin(gs1,t14,k2): - gsin(gs1,t14,k2) + SOS1_LB_gsin(gs1,t14,k2)
   = 0
 SOS1_LB_gsout(gs1,t14,k2): - gsout(gs1,t14,k2) + SOS1_LB_gsout(gs1,t14,k2)
   = 0
 SOS1_LB_gstore(gs1,t14,k2): - gstore(gs1,t14,k2)
   + SOS1_LB_gstore(gs1,t14,k2) = 0
 SOS1_LB_gsin(gs1,t15,k0): - gsin(gs1,t15,k0) + SOS1_LB_gsin(gs1,t15,k0)
   = 0
 SOS1_LB_gsout(gs1,t15,k0): - gsout(gs1,t15,k0) + SOS1_LB_gsout(gs1,t15,k0)
   = 0
 SOS1_LB_gstore(gs1,t15,k0): - gstore(gs1,t15,k0)
   + SOS1_LB_gstore(gs1,t15,k0) = 0
 SOS1_LB_gsin(gs1,t15,k1): - gsin(gs1,t15,k1) + SOS1_LB_gsin(gs1,t15,k1)
   = 0
 SOS1_LB_gsout(gs1,t15,k1): - gsout(gs1,t15,k1) + SOS1_LB_gsout(gs1,t15,k1)
   = 0
 SOS1_LB_gstore(gs1,t15,k1): - gstore(gs1,t15,k1)
   + SOS1_LB_gstore(gs1,t15,k1) = 0
 SOS1_LB_gsin(gs1,t15,k2): - gsin(gs1,t15,k2) + SOS1_LB_gsin(gs1,t15,k2)
   = 0
 SOS1_LB_gsout(gs1,t15,k2): - gsout(gs1,t15,k2) + SOS1_LB_gsout(gs1,t15,k2)
   = 0
 SOS1_LB_gstore(gs1,t15,k2): - gstore(gs1,t15,k2)
   + SOS1_LB_gstore(gs1,t15,k2) = 0
 SOS1_LB_gsin(gs1,t16,k0): - gsin(gs1,t16,k0) + SOS1_LB_gsin(gs1,t16,k0)
   = 0
 SOS1_LB_gsout(gs1,t16,k0): - gsout(gs1,t16,k0) + SOS1_LB_gsout(gs1,t16,k0)
   = 0
 SOS1_LB_gstore(gs1,t16,k0): - gstore(gs1,t16,k0)
   + SOS1_LB_gstore(gs1,t16,k0) = 0
 SOS1_LB_gsin(gs1,t16,k1): - gsin(gs1,t16,k1) + SOS1_LB_gsin(gs1,t16,k1)
   = 0
 SOS1_LB_gsout(gs1,t16,k1): - gsout(gs1,t16,k1) + SOS1_LB_gsout(gs1,t16,k1)
   = 0
 SOS1_LB_gstore(gs1,t16,k1): - gstore(gs1,t16,k1)
   + SOS1_LB_gstore(gs1,t16,k1) = 0
 SOS1_LB_gsin(gs1,t16,k2): - gsin(gs1,t16,k2) + SOS1_LB_gsin(gs1,t16,k2)
   = 0
 SOS1_LB_gsout(gs1,t16,k2): - gsout(gs1,t16,k2) + SOS1_LB_gsout(gs1,t16,k2)
   = 0
 SOS1_LB_gstore(gs1,t16,k2): - gstore(gs1,t16,k2)
   + SOS1_LB_gstore(gs1,t16,k2) = 0
 SOS1_LB_gsin(gs1,t17,k0): - gsin(gs1,t17,k0) + SOS1_LB_gsin(gs1,t17,k0)
   = 0
 SOS1_LB_gsout(gs1,t17,k0): - gsout(gs1,t17,k0) + SOS1_LB_gsout(gs1,t17,k0)
   = 0
 SOS1_LB_gstore(gs1,t17,k0): - gstore(gs1,t17,k0)
   + SOS1_LB_gstore(gs1,t17,k0) = 0
 SOS1_LB_gsin(gs1,t17,k1): - gsin(gs1,t17,k1) + SOS1_LB_gsin(gs1,t17,k1)
   = 0
 SOS1_LB_gsout(gs1,t17,k1): - gsout(gs1,t17,k1) + SOS1_LB_gsout(gs1,t17,k1)
   = 0
 SOS1_LB_gstore(gs1,t17,k1): - gstore(gs1,t17,k1)
   + SOS1_LB_gstore(gs1,t17,k1) = 0
 SOS1_LB_gsin(gs1,t17,k2): - gsin(gs1,t17,k2) + SOS1_LB_gsin(gs1,t17,k2)
   = 0
 SOS1_LB_gsout(gs1,t17,k2): - gsout(gs1,t17,k2) + SOS1_LB_gsout(gs1,t17,k2)
   = 0
 SOS1_LB_gstore(gs1,t17,k2): - gstore(gs1,t17,k2)
   + SOS1_LB_gstore(gs1,t17,k2) = 0
 SOS1_LB_gsin(gs1,t18,k0): - gsin(gs1,t18,k0) + SOS1_LB_gsin(gs1,t18,k0)
   = 0
 SOS1_LB_gsout(gs1,t18,k0): - gsout(gs1,t18,k0) + SOS1_LB_gsout(gs1,t18,k0)
   = 0
 SOS1_LB_gstore(gs1,t18,k0): - gstore(gs1,t18,k0)
   + SOS1_LB_gstore(gs1,t18,k0) = 0
 SOS1_LB_gsin(gs1,t18,k1): - gsin(gs1,t18,k1) + SOS1_LB_gsin(gs1,t18,k1)
   = 0
 SOS1_LB_gsout(gs1,t18,k1): - gsout(gs1,t18,k1) + SOS1_LB_gsout(gs1,t18,k1)
   = 0
 SOS1_LB_gstore(gs1,t18,k1): - gstore(gs1,t18,k1)
   + SOS1_LB_gstore(gs1,t18,k1) = 0
 SOS1_LB_gsin(gs1,t18,k2): - gsin(gs1,t18,k2) + SOS1_LB_gsin(gs1,t18,k2)
   = 0
 SOS1_LB_gsout(gs1,t18,k2): - gsout(gs1,t18,k2) + SOS1_LB_gsout(gs1,t18,k2)
   = 0
 SOS1_LB_gstore(gs1,t18,k2): - gstore(gs1,t18,k2)
   + SOS1_LB_gstore(gs1,t18,k2) = 0
 SOS1_LB_gsin(gs1,t19,k0): - gsin(gs1,t19,k0) + SOS1_LB_gsin(gs1,t19,k0)
   = 0
 SOS1_LB_gsout(gs1,t19,k0): - gsout(gs1,t19,k0) + SOS1_LB_gsout(gs1,t19,k0)
   = 0
 SOS1_LB_gstore(gs1,t19,k0): - gstore(gs1,t19,k0)
   + SOS1_LB_gstore(gs1,t19,k0) = 0
 SOS1_LB_gsin(gs1,t19,k1): - gsin(gs1,t19,k1) + SOS1_LB_gsin(gs1,t19,k1)
   = 0
 SOS1_LB_gsout(gs1,t19,k1): - gsout(gs1,t19,k1) + SOS1_LB_gsout(gs1,t19,k1)
   = 0
 SOS1_LB_gstore(gs1,t19,k1): - gstore(gs1,t19,k1)
   + SOS1_LB_gstore(gs1,t19,k1) = 0
 SOS1_LB_gsin(gs1,t19,k2): - gsin(gs1,t19,k2) + SOS1_LB_gsin(gs1,t19,k2)
   = 0
 SOS1_LB_gsout(gs1,t19,k2): - gsout(gs1,t19,k2) + SOS1_LB_gsout(gs1,t19,k2)
   = 0
 SOS1_LB_gstore(gs1,t19,k2): - gstore(gs1,t19,k2)
   + SOS1_LB_gstore(gs1,t19,k2) = 0
 SOS1_LB_gsin(gs1,t20,k0): - gsin(gs1,t20,k0) + SOS1_LB_gsin(gs1,t20,k0)
   = 0
 SOS1_LB_gsout(gs1,t20,k0): - gsout(gs1,t20,k0) + SOS1_LB_gsout(gs1,t20,k0)
   = 0
 SOS1_LB_gstore(gs1,t20,k0): - gstore(gs1,t20,k0)
   + SOS1_LB_gstore(gs1,t20,k0) = 0
 SOS1_LB_gsin(gs1,t20,k1): - gsin(gs1,t20,k1) + SOS1_LB_gsin(gs1,t20,k1)
   = 0
 SOS1_LB_gsout(gs1,t20,k1): - gsout(gs1,t20,k1) + SOS1_LB_gsout(gs1,t20,k1)
   = 0
 SOS1_LB_gstore(gs1,t20,k1): - gstore(gs1,t20,k1)
   + SOS1_LB_gstore(gs1,t20,k1) = 0
 SOS1_LB_gsin(gs1,t20,k2): - gsin(gs1,t20,k2) + SOS1_LB_gsin(gs1,t20,k2)
   = 0
 SOS1_LB_gsout(gs1,t20,k2): - gsout(gs1,t20,k2) + SOS1_LB_gsout(gs1,t20,k2)
   = 0
 SOS1_LB_gstore(gs1,t20,k2): - gstore(gs1,t20,k2)
   + SOS1_LB_gstore(gs1,t20,k2) = 0
 SOS1_LB_gsin(gs1,t21,k0): - gsin(gs1,t21,k0) + SOS1_LB_gsin(gs1,t21,k0)
   = 0
 SOS1_LB_gsout(gs1,t21,k0): - gsout(gs1,t21,k0) + SOS1_LB_gsout(gs1,t21,k0)
   = 0
 SOS1_LB_gstore(gs1,t21,k0): - gstore(gs1,t21,k0)
   + SOS1_LB_gstore(gs1,t21,k0) = 0
 SOS1_LB_gsin(gs1,t21,k1): - gsin(gs1,t21,k1) + SOS1_LB_gsin(gs1,t21,k1)
   = 0
 SOS1_LB_gsout(gs1,t21,k1): - gsout(gs1,t21,k1) + SOS1_LB_gsout(gs1,t21,k1)
   = 0
 SOS1_LB_gstore(gs1,t21,k1): - gstore(gs1,t21,k1)
   + SOS1_LB_gstore(gs1,t21,k1) = 0
 SOS1_LB_gsin(gs1,t21,k2): - gsin(gs1,t21,k2) + SOS1_LB_gsin(gs1,t21,k2)
   = 0
 SOS1_LB_gsout(gs1,t21,k2): - gsout(gs1,t21,k2) + SOS1_LB_gsout(gs1,t21,k2)
   = 0
 SOS1_LB_gstore(gs1,t21,k2): - gstore(gs1,t21,k2)
   + SOS1_LB_gstore(gs1,t21,k2) = 0
 SOS1_LB_gsin(gs1,t22,k0): - gsin(gs1,t22,k0) + SOS1_LB_gsin(gs1,t22,k0)
   = 0
 SOS1_LB_gsout(gs1,t22,k0): - gsout(gs1,t22,k0) + SOS1_LB_gsout(gs1,t22,k0)
   = 0
 SOS1_LB_gstore(gs1,t22,k0): - gstore(gs1,t22,k0)
   + SOS1_LB_gstore(gs1,t22,k0) = 0
 SOS1_LB_gsin(gs1,t22,k1): - gsin(gs1,t22,k1) + SOS1_LB_gsin(gs1,t22,k1)
   = 0
 SOS1_LB_gsout(gs1,t22,k1): - gsout(gs1,t22,k1) + SOS1_LB_gsout(gs1,t22,k1)
   = 0
 SOS1_LB_gstore(gs1,t22,k1): - gstore(gs1,t22,k1)
   + SOS1_LB_gstore(gs1,t22,k1) = 0
 SOS1_LB_gsin(gs1,t22,k2): - gsin(gs1,t22,k2) + SOS1_LB_gsin(gs1,t22,k2)
   = 0
 SOS1_LB_gsout(gs1,t22,k2): - gsout(gs1,t22,k2) + SOS1_LB_gsout(gs1,t22,k2)
   = 0
 SOS1_LB_gstore(gs1,t22,k2): - gstore(gs1,t22,k2)
   + SOS1_LB_gstore(gs1,t22,k2) = 0
 SOS1_LB_gsin(gs1,t23,k0): - gsin(gs1,t23,k0) + SOS1_LB_gsin(gs1,t23,k0)
   = 0
 SOS1_LB_gsout(gs1,t23,k0): - gsout(gs1,t23,k0) + SOS1_LB_gsout(gs1,t23,k0)
   = 0
 SOS1_LB_gstore(gs1,t23,k0): - gstore(gs1,t23,k0)
   + SOS1_LB_gstore(gs1,t23,k0) = 0
 SOS1_LB_gsin(gs1,t23,k1): - gsin(gs1,t23,k1) + SOS1_LB_gsin(gs1,t23,k1)
   = 0
 SOS1_LB_gsout(gs1,t23,k1): - gsout(gs1,t23,k1) + SOS1_LB_gsout(gs1,t23,k1)
   = 0
 SOS1_LB_gstore(gs1,t23,k1): - gstore(gs1,t23,k1)
   + SOS1_LB_gstore(gs1,t23,k1) = 0
 SOS1_LB_gsin(gs1,t23,k2): - gsin(gs1,t23,k2) + SOS1_LB_gsin(gs1,t23,k2)
   = 0
 SOS1_LB_gsout(gs1,t23,k2): - gsout(gs1,t23,k2) + SOS1_LB_gsout(gs1,t23,k2)
   = 0
 SOS1_LB_gstore(gs1,t23,k2): - gstore(gs1,t23,k2)
   + SOS1_LB_gstore(gs1,t23,k2) = 0
 SOS1_LB_gsin(gs1,t24,k0): - gsin(gs1,t24,k0) + SOS1_LB_gsin(gs1,t24,k0)
   = 0
 SOS1_LB_gsout(gs1,t24,k0): - gsout(gs1,t24,k0) + SOS1_LB_gsout(gs1,t24,k0)
   = 0
 SOS1_LB_gstore(gs1,t24,k0): - gstore(gs1,t24,k0)
   + SOS1_LB_gstore(gs1,t24,k0) = 0
 SOS1_LB_gsin(gs1,t24,k1): - gsin(gs1,t24,k1) + SOS1_LB_gsin(gs1,t24,k1)
   = 0
 SOS1_LB_gsout(gs1,t24,k1): - gsout(gs1,t24,k1) + SOS1_LB_gsout(gs1,t24,k1)
   = 0
 SOS1_LB_gstore(gs1,t24,k1): - gstore(gs1,t24,k1)
   + SOS1_LB_gstore(gs1,t24,k1) = 0
 SOS1_LB_gsin(gs1,t24,k2): - gsin(gs1,t24,k2) + SOS1_LB_gsin(gs1,t24,k2)
   = 0
 SOS1_LB_gsout(gs1,t24,k2): - gsout(gs1,t24,k2) + SOS1_LB_gsout(gs1,t24,k2)
   = 0
 SOS1_LB_gstore(gs1,t24,k2): - gstore(gs1,t24,k2)
   + SOS1_LB_gstore(gs1,t24,k2) = 0
 dLag/gshed_da(ng101,k0,t1): mu_gshed_da_max(ng101,k0,t1)
   - muLB_gshed_da(ng101,k0,t1) = -10000
 dLag/gshed_da(ng101,k1,t1): mu_gshed_da_max(ng101,k1,t1)
   - muLB_gshed_da(ng101,k1,t1) = -10000
 dLag/gshed_da(ng101,k2,t1): mu_gshed_da_max(ng101,k2,t1)
   - muLB_gshed_da(ng101,k2,t1) = -10000
 dLag/gshed_da(ng101,k0,t2): mu_gshed_da_max(ng101,k0,t2)
   - muLB_gshed_da(ng101,k0,t2) = -10000
 dLag/gshed_da(ng101,k1,t2): mu_gshed_da_max(ng101,k1,t2)
   - muLB_gshed_da(ng101,k1,t2) = -10000
 dLag/gshed_da(ng101,k2,t2): mu_gshed_da_max(ng101,k2,t2)
   - muLB_gshed_da(ng101,k2,t2) = -10000
 dLag/gshed_da(ng101,k0,t3): mu_gshed_da_max(ng101,k0,t3)
   - muLB_gshed_da(ng101,k0,t3) = -10000
 dLag/gshed_da(ng101,k1,t3): mu_gshed_da_max(ng101,k1,t3)
   - muLB_gshed_da(ng101,k1,t3) = -10000
 dLag/gshed_da(ng101,k2,t3): mu_gshed_da_max(ng101,k2,t3)
   - muLB_gshed_da(ng101,k2,t3) = -10000
 dLag/gshed_da(ng101,k0,t4): mu_gshed_da_max(ng101,k0,t4)
   - muLB_gshed_da(ng101,k0,t4) = -10000
 dLag/gshed_da(ng101,k1,t4): mu_gshed_da_max(ng101,k1,t4)
   - muLB_gshed_da(ng101,k1,t4) = -10000
 dLag/gshed_da(ng101,k2,t4): mu_gshed_da_max(ng101,k2,t4)
   - muLB_gshed_da(ng101,k2,t4) = -10000
 dLag/gshed_da(ng101,k0,t5): - muLB_gshed_da(ng101,k0,t5) = 0
 dLag/gshed_da(ng101,k1,t5): - muLB_gshed_da(ng101,k1,t5) = 0
 dLag/gshed_da(ng101,k2,t5): - muLB_gshed_da(ng101,k2,t5) = 0
 dLag/gshed_da(ng101,k0,t6): - muLB_gshed_da(ng101,k0,t6) = 0
 dLag/gshed_da(ng101,k1,t6): - muLB_gshed_da(ng101,k1,t6) = 0
 dLag/gshed_da(ng101,k2,t6): - muLB_gshed_da(ng101,k2,t6) = 0
 dLag/gshed_da(ng101,k0,t7): - muLB_gshed_da(ng101,k0,t7) = 0
 dLag/gshed_da(ng101,k1,t7): - muLB_gshed_da(ng101,k1,t7) = 0
 dLag/gshed_da(ng101,k2,t7): - muLB_gshed_da(ng101,k2,t7) = 0
 dLag/gshed_da(ng101,k0,t8): - muLB_gshed_da(ng101,k0,t8) = 0
 dLag/gshed_da(ng101,k1,t8): - muLB_gshed_da(ng101,k1,t8) = 0
 dLag/gshed_da(ng101,k2,t8): - muLB_gshed_da(ng101,k2,t8) = 0
 dLag/gshed_da(ng101,k0,t9): - muLB_gshed_da(ng101,k0,t9) = 0
 dLag/gshed_da(ng101,k1,t9): - muLB_gshed_da(ng101,k1,t9) = 0
 dLag/gshed_da(ng101,k2,t9): - muLB_gshed_da(ng101,k2,t9) = 0
 dLag/gshed_da(ng101,k0,t10): - muLB_gshed_da(ng101,k0,t10) = 0
 dLag/gshed_da(ng101,k1,t10): - muLB_gshed_da(ng101,k1,t10) = 0
 dLag/gshed_da(ng101,k2,t10): - muLB_gshed_da(ng101,k2,t10) = 0
 dLag/gshed_da(ng101,k0,t11): - muLB_gshed_da(ng101,k0,t11) = 0
 dLag/gshed_da(ng101,k1,t11): - muLB_gshed_da(ng101,k1,t11) = 0
 dLag/gshed_da(ng101,k2,t11): - muLB_gshed_da(ng101,k2,t11) = 0
 dLag/gshed_da(ng101,k0,t12): - muLB_gshed_da(ng101,k0,t12) = 0
 dLag/gshed_da(ng101,k1,t12): - muLB_gshed_da(ng101,k1,t12) = 0
 dLag/gshed_da(ng101,k2,t12): - muLB_gshed_da(ng101,k2,t12) = 0
 dLag/gshed_da(ng101,k0,t13): - muLB_gshed_da(ng101,k0,t13) = 0
 dLag/gshed_da(ng101,k1,t13): - muLB_gshed_da(ng101,k1,t13) = 0
 dLag/gshed_da(ng101,k2,t13): - muLB_gshed_da(ng101,k2,t13) = 0
 dLag/gshed_da(ng101,k0,t14): - muLB_gshed_da(ng101,k0,t14) = 0
 dLag/gshed_da(ng101,k1,t14): - muLB_gshed_da(ng101,k1,t14) = 0
 dLag/gshed_da(ng101,k2,t14): - muLB_gshed_da(ng101,k2,t14) = 0
 dLag/gshed_da(ng101,k0,t15): - muLB_gshed_da(ng101,k0,t15) = 0
 dLag/gshed_da(ng101,k1,t15): - muLB_gshed_da(ng101,k1,t15) = 0
 dLag/gshed_da(ng101,k2,t15): - muLB_gshed_da(ng101,k2,t15) = 0
 dLag/gshed_da(ng101,k0,t16): - muLB_gshed_da(ng101,k0,t16) = 0
 dLag/gshed_da(ng101,k1,t16): - muLB_gshed_da(ng101,k1,t16) = 0
 dLag/gshed_da(ng101,k2,t16): - muLB_gshed_da(ng101,k2,t16) = 0
 dLag/gshed_da(ng101,k0,t17): - muLB_gshed_da(ng101,k0,t17) = 0
 dLag/gshed_da(ng101,k1,t17): - muLB_gshed_da(ng101,k1,t17) = 0
 dLag/gshed_da(ng101,k2,t17): - muLB_gshed_da(ng101,k2,t17) = 0
 dLag/gshed_da(ng101,k0,t18): - muLB_gshed_da(ng101,k0,t18) = 0
 dLag/gshed_da(ng101,k1,t18): - muLB_gshed_da(ng101,k1,t18) = 0
 dLag/gshed_da(ng101,k2,t18): - muLB_gshed_da(ng101,k2,t18) = 0
 dLag/gshed_da(ng101,k0,t19): - muLB_gshed_da(ng101,k0,t19) = 0
 dLag/gshed_da(ng101,k1,t19): - muLB_gshed_da(ng101,k1,t19) = 0
 dLag/gshed_da(ng101,k2,t19): - muLB_gshed_da(ng101,k2,t19) = 0
 dLag/gshed_da(ng101,k0,t20): - muLB_gshed_da(ng101,k0,t20) = 0
 dLag/gshed_da(ng101,k1,t20): - muLB_gshed_da(ng101,k1,t20) = 0
 dLag/gshed_da(ng101,k2,t20): - muLB_gshed_da(ng101,k2,t20) = 0
 dLag/gshed_da(ng101,k0,t21): - muLB_gshed_da(ng101,k0,t21) = 0
 dLag/gshed_da(ng101,k1,t21): - muLB_gshed_da(ng101,k1,t21) = 0
 dLag/gshed_da(ng101,k2,t21): - muLB_gshed_da(ng101,k2,t21) = 0
 dLag/gshed_da(ng101,k0,t22): - muLB_gshed_da(ng101,k0,t22) = 0
 dLag/gshed_da(ng101,k1,t22): - muLB_gshed_da(ng101,k1,t22) = 0
 dLag/gshed_da(ng101,k2,t22): - muLB_gshed_da(ng101,k2,t22) = 0
 dLag/gshed_da(ng101,k0,t23): - muLB_gshed_da(ng101,k0,t23) = 0
 dLag/gshed_da(ng101,k1,t23): - muLB_gshed_da(ng101,k1,t23) = 0
 dLag/gshed_da(ng101,k2,t23): - muLB_gshed_da(ng101,k2,t23) = 0
 dLag/gshed_da(ng101,k0,t24): - muLB_gshed_da(ng101,k0,t24) = 0
 dLag/gshed_da(ng101,k1,t24): - muLB_gshed_da(ng101,k1,t24) = 0
 dLag/gshed_da(ng101,k2,t24): - muLB_gshed_da(ng101,k2,t24) = 0
 dLag/gshed_da(ng102,k0,t1): mu_gshed_da_max(ng102,k0,t1)
   - muLB_gshed_da(ng102,k0,t1) = -10000
 dLag/gshed_da(ng102,k1,t1): mu_gshed_da_max(ng102,k1,t1)
   - muLB_gshed_da(ng102,k1,t1) = -10000
 dLag/gshed_da(ng102,k2,t1): mu_gshed_da_max(ng102,k2,t1)
   - muLB_gshed_da(ng102,k2,t1) = -10000
 dLag/gshed_da(ng102,k0,t2): mu_gshed_da_max(ng102,k0,t2)
   - muLB_gshed_da(ng102,k0,t2) = -10000
 dLag/gshed_da(ng102,k1,t2): mu_gshed_da_max(ng102,k1,t2)
   - muLB_gshed_da(ng102,k1,t2) = -10000
 dLag/gshed_da(ng102,k2,t2): mu_gshed_da_max(ng102,k2,t2)
   - muLB_gshed_da(ng102,k2,t2) = -10000
 dLag/gshed_da(ng102,k0,t3): mu_gshed_da_max(ng102,k0,t3)
   - muLB_gshed_da(ng102,k0,t3) = -10000
 dLag/gshed_da(ng102,k1,t3): mu_gshed_da_max(ng102,k1,t3)
   - muLB_gshed_da(ng102,k1,t3) = -10000
 dLag/gshed_da(ng102,k2,t3): mu_gshed_da_max(ng102,k2,t3)
   - muLB_gshed_da(ng102,k2,t3) = -10000
 dLag/gshed_da(ng102,k0,t4): mu_gshed_da_max(ng102,k0,t4)
   - muLB_gshed_da(ng102,k0,t4) = -10000
 dLag/gshed_da(ng102,k1,t4): mu_gshed_da_max(ng102,k1,t4)
   - muLB_gshed_da(ng102,k1,t4) = -10000
 dLag/gshed_da(ng102,k2,t4): mu_gshed_da_max(ng102,k2,t4)
   - muLB_gshed_da(ng102,k2,t4) = -10000
 dLag/gshed_da(ng102,k0,t5): - muLB_gshed_da(ng102,k0,t5) = 0
 dLag/gshed_da(ng102,k1,t5): - muLB_gshed_da(ng102,k1,t5) = 0
 dLag/gshed_da(ng102,k2,t5): - muLB_gshed_da(ng102,k2,t5) = 0
 dLag/gshed_da(ng102,k0,t6): - muLB_gshed_da(ng102,k0,t6) = 0
 dLag/gshed_da(ng102,k1,t6): - muLB_gshed_da(ng102,k1,t6) = 0
 dLag/gshed_da(ng102,k2,t6): - muLB_gshed_da(ng102,k2,t6) = 0
 dLag/gshed_da(ng102,k0,t7): - muLB_gshed_da(ng102,k0,t7) = 0
 dLag/gshed_da(ng102,k1,t7): - muLB_gshed_da(ng102,k1,t7) = 0
 dLag/gshed_da(ng102,k2,t7): - muLB_gshed_da(ng102,k2,t7) = 0
 dLag/gshed_da(ng102,k0,t8): - muLB_gshed_da(ng102,k0,t8) = 0
 dLag/gshed_da(ng102,k1,t8): - muLB_gshed_da(ng102,k1,t8) = 0
 dLag/gshed_da(ng102,k2,t8): - muLB_gshed_da(ng102,k2,t8) = 0
 dLag/gshed_da(ng102,k0,t9): - muLB_gshed_da(ng102,k0,t9) = 0
 dLag/gshed_da(ng102,k1,t9): - muLB_gshed_da(ng102,k1,t9) = 0
 dLag/gshed_da(ng102,k2,t9): - muLB_gshed_da(ng102,k2,t9) = 0
 dLag/gshed_da(ng102,k0,t10): - muLB_gshed_da(ng102,k0,t10) = 0
 dLag/gshed_da(ng102,k1,t10): - muLB_gshed_da(ng102,k1,t10) = 0
 dLag/gshed_da(ng102,k2,t10): - muLB_gshed_da(ng102,k2,t10) = 0
 dLag/gshed_da(ng102,k0,t11): - muLB_gshed_da(ng102,k0,t11) = 0
 dLag/gshed_da(ng102,k1,t11): - muLB_gshed_da(ng102,k1,t11) = 0
 dLag/gshed_da(ng102,k2,t11): - muLB_gshed_da(ng102,k2,t11) = 0
 dLag/gshed_da(ng102,k0,t12): - muLB_gshed_da(ng102,k0,t12) = 0
 dLag/gshed_da(ng102,k1,t12): - muLB_gshed_da(ng102,k1,t12) = 0
 dLag/gshed_da(ng102,k2,t12): - muLB_gshed_da(ng102,k2,t12) = 0
 dLag/gshed_da(ng102,k0,t13): - muLB_gshed_da(ng102,k0,t13) = 0
 dLag/gshed_da(ng102,k1,t13): - muLB_gshed_da(ng102,k1,t13) = 0
 dLag/gshed_da(ng102,k2,t13): - muLB_gshed_da(ng102,k2,t13) = 0
 dLag/gshed_da(ng102,k0,t14): - muLB_gshed_da(ng102,k0,t14) = 0
 dLag/gshed_da(ng102,k1,t14): - muLB_gshed_da(ng102,k1,t14) = 0
 dLag/gshed_da(ng102,k2,t14): - muLB_gshed_da(ng102,k2,t14) = 0
 dLag/gshed_da(ng102,k0,t15): - muLB_gshed_da(ng102,k0,t15) = 0
 dLag/gshed_da(ng102,k1,t15): - muLB_gshed_da(ng102,k1,t15) = 0
 dLag/gshed_da(ng102,k2,t15): - muLB_gshed_da(ng102,k2,t15) = 0
 dLag/gshed_da(ng102,k0,t16): - muLB_gshed_da(ng102,k0,t16) = 0
 dLag/gshed_da(ng102,k1,t16): - muLB_gshed_da(ng102,k1,t16) = 0
 dLag/gshed_da(ng102,k2,t16): - muLB_gshed_da(ng102,k2,t16) = 0
 dLag/gshed_da(ng102,k0,t17): - muLB_gshed_da(ng102,k0,t17) = 0
 dLag/gshed_da(ng102,k1,t17): - muLB_gshed_da(ng102,k1,t17) = 0
 dLag/gshed_da(ng102,k2,t17): - muLB_gshed_da(ng102,k2,t17) = 0
 dLag/gshed_da(ng102,k0,t18): - muLB_gshed_da(ng102,k0,t18) = 0
 dLag/gshed_da(ng102,k1,t18): - muLB_gshed_da(ng102,k1,t18) = 0
 dLag/gshed_da(ng102,k2,t18): - muLB_gshed_da(ng102,k2,t18) = 0
 dLag/gshed_da(ng102,k0,t19): - muLB_gshed_da(ng102,k0,t19) = 0
 dLag/gshed_da(ng102,k1,t19): - muLB_gshed_da(ng102,k1,t19) = 0
 dLag/gshed_da(ng102,k2,t19): - muLB_gshed_da(ng102,k2,t19) = 0
 dLag/gshed_da(ng102,k0,t20): - muLB_gshed_da(ng102,k0,t20) = 0
 dLag/gshed_da(ng102,k1,t20): - muLB_gshed_da(ng102,k1,t20) = 0
 dLag/gshed_da(ng102,k2,t20): - muLB_gshed_da(ng102,k2,t20) = 0
 dLag/gshed_da(ng102,k0,t21): - muLB_gshed_da(ng102,k0,t21) = 0
 dLag/gshed_da(ng102,k1,t21): - muLB_gshed_da(ng102,k1,t21) = 0
 dLag/gshed_da(ng102,k2,t21): - muLB_gshed_da(ng102,k2,t21) = 0
 dLag/gshed_da(ng102,k0,t22): - muLB_gshed_da(ng102,k0,t22) = 0
 dLag/gshed_da(ng102,k1,t22): - muLB_gshed_da(ng102,k1,t22) = 0
 dLag/gshed_da(ng102,k2,t22): - muLB_gshed_da(ng102,k2,t22) = 0
 dLag/gshed_da(ng102,k0,t23): - muLB_gshed_da(ng102,k0,t23) = 0
 dLag/gshed_da(ng102,k1,t23): - muLB_gshed_da(ng102,k1,t23) = 0
 dLag/gshed_da(ng102,k2,t23): - muLB_gshed_da(ng102,k2,t23) = 0
 dLag/gshed_da(ng102,k0,t24): - muLB_gshed_da(ng102,k0,t24) = 0
 dLag/gshed_da(ng102,k1,t24): - muLB_gshed_da(ng102,k1,t24) = 0
 dLag/gshed_da(ng102,k2,t24): - muLB_gshed_da(ng102,k2,t24) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t1):
   - lambda_gflow_sr_io(('ng101','ng102'),k0,t1)
   + mu_gflow_sr_limit(('ng101','ng102'),k0,t1)
   - muLB_gflow_sr(('ng101','ng102'),k0,t1) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t1):
   - lambda_gflow_sr_io(('ng101','ng102'),k1,t1)
   + mu_gflow_sr_limit(('ng101','ng102'),k1,t1)
   - muLB_gflow_sr(('ng101','ng102'),k1,t1) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t1):
   - lambda_gflow_sr_io(('ng101','ng102'),k2,t1)
   + mu_gflow_sr_limit(('ng101','ng102'),k2,t1)
   - muLB_gflow_sr(('ng101','ng102'),k2,t1) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t2):
   - lambda_gflow_sr_io(('ng101','ng102'),k0,t2)
   + mu_gflow_sr_limit(('ng101','ng102'),k0,t2)
   - muLB_gflow_sr(('ng101','ng102'),k0,t2) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t2):
   - lambda_gflow_sr_io(('ng101','ng102'),k1,t2)
   + mu_gflow_sr_limit(('ng101','ng102'),k1,t2)
   - muLB_gflow_sr(('ng101','ng102'),k1,t2) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t2):
   - lambda_gflow_sr_io(('ng101','ng102'),k2,t2)
   + mu_gflow_sr_limit(('ng101','ng102'),k2,t2)
   - muLB_gflow_sr(('ng101','ng102'),k2,t2) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t3):
   - lambda_gflow_sr_io(('ng101','ng102'),k0,t3)
   + mu_gflow_sr_limit(('ng101','ng102'),k0,t3)
   - muLB_gflow_sr(('ng101','ng102'),k0,t3) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t3):
   - lambda_gflow_sr_io(('ng101','ng102'),k1,t3)
   + mu_gflow_sr_limit(('ng101','ng102'),k1,t3)
   - muLB_gflow_sr(('ng101','ng102'),k1,t3) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t3):
   - lambda_gflow_sr_io(('ng101','ng102'),k2,t3)
   + mu_gflow_sr_limit(('ng101','ng102'),k2,t3)
   - muLB_gflow_sr(('ng101','ng102'),k2,t3) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t4):
   - lambda_gflow_sr_io(('ng101','ng102'),k0,t4)
   + mu_gflow_sr_limit(('ng101','ng102'),k0,t4)
   - muLB_gflow_sr(('ng101','ng102'),k0,t4) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t4):
   - lambda_gflow_sr_io(('ng101','ng102'),k1,t4)
   + mu_gflow_sr_limit(('ng101','ng102'),k1,t4)
   - muLB_gflow_sr(('ng101','ng102'),k1,t4) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t4):
   - lambda_gflow_sr_io(('ng101','ng102'),k2,t4)
   + mu_gflow_sr_limit(('ng101','ng102'),k2,t4)
   - muLB_gflow_sr(('ng101','ng102'),k2,t4) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t5):
   - muLB_gflow_sr(('ng101','ng102'),k0,t5) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t5):
   - muLB_gflow_sr(('ng101','ng102'),k1,t5) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t5):
   - muLB_gflow_sr(('ng101','ng102'),k2,t5) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t6):
   - muLB_gflow_sr(('ng101','ng102'),k0,t6) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t6):
   - muLB_gflow_sr(('ng101','ng102'),k1,t6) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t6):
   - muLB_gflow_sr(('ng101','ng102'),k2,t6) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t7):
   - muLB_gflow_sr(('ng101','ng102'),k0,t7) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t7):
   - muLB_gflow_sr(('ng101','ng102'),k1,t7) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t7):
   - muLB_gflow_sr(('ng101','ng102'),k2,t7) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t8):
   - muLB_gflow_sr(('ng101','ng102'),k0,t8) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t8):
   - muLB_gflow_sr(('ng101','ng102'),k1,t8) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t8):
   - muLB_gflow_sr(('ng101','ng102'),k2,t8) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t9):
   - muLB_gflow_sr(('ng101','ng102'),k0,t9) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t9):
   - muLB_gflow_sr(('ng101','ng102'),k1,t9) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t9):
   - muLB_gflow_sr(('ng101','ng102'),k2,t9) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t10):
   - muLB_gflow_sr(('ng101','ng102'),k0,t10) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t10):
   - muLB_gflow_sr(('ng101','ng102'),k1,t10) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t10):
   - muLB_gflow_sr(('ng101','ng102'),k2,t10) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t11):
   - muLB_gflow_sr(('ng101','ng102'),k0,t11) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t11):
   - muLB_gflow_sr(('ng101','ng102'),k1,t11) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t11):
   - muLB_gflow_sr(('ng101','ng102'),k2,t11) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t12):
   - muLB_gflow_sr(('ng101','ng102'),k0,t12) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t12):
   - muLB_gflow_sr(('ng101','ng102'),k1,t12) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t12):
   - muLB_gflow_sr(('ng101','ng102'),k2,t12) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t13):
   - muLB_gflow_sr(('ng101','ng102'),k0,t13) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t13):
   - muLB_gflow_sr(('ng101','ng102'),k1,t13) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t13):
   - muLB_gflow_sr(('ng101','ng102'),k2,t13) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t14):
   - muLB_gflow_sr(('ng101','ng102'),k0,t14) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t14):
   - muLB_gflow_sr(('ng101','ng102'),k1,t14) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t14):
   - muLB_gflow_sr(('ng101','ng102'),k2,t14) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t15):
   - muLB_gflow_sr(('ng101','ng102'),k0,t15) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t15):
   - muLB_gflow_sr(('ng101','ng102'),k1,t15) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t15):
   - muLB_gflow_sr(('ng101','ng102'),k2,t15) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t16):
   - muLB_gflow_sr(('ng101','ng102'),k0,t16) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t16):
   - muLB_gflow_sr(('ng101','ng102'),k1,t16) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t16):
   - muLB_gflow_sr(('ng101','ng102'),k2,t16) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t17):
   - muLB_gflow_sr(('ng101','ng102'),k0,t17) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t17):
   - muLB_gflow_sr(('ng101','ng102'),k1,t17) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t17):
   - muLB_gflow_sr(('ng101','ng102'),k2,t17) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t18):
   - muLB_gflow_sr(('ng101','ng102'),k0,t18) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t18):
   - muLB_gflow_sr(('ng101','ng102'),k1,t18) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t18):
   - muLB_gflow_sr(('ng101','ng102'),k2,t18) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t19):
   - muLB_gflow_sr(('ng101','ng102'),k0,t19) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t19):
   - muLB_gflow_sr(('ng101','ng102'),k1,t19) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t19):
   - muLB_gflow_sr(('ng101','ng102'),k2,t19) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t20):
   - muLB_gflow_sr(('ng101','ng102'),k0,t20) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t20):
   - muLB_gflow_sr(('ng101','ng102'),k1,t20) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t20):
   - muLB_gflow_sr(('ng101','ng102'),k2,t20) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t21):
   - muLB_gflow_sr(('ng101','ng102'),k0,t21) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t21):
   - muLB_gflow_sr(('ng101','ng102'),k1,t21) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t21):
   - muLB_gflow_sr(('ng101','ng102'),k2,t21) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t22):
   - muLB_gflow_sr(('ng101','ng102'),k0,t22) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t22):
   - muLB_gflow_sr(('ng101','ng102'),k1,t22) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t22):
   - muLB_gflow_sr(('ng101','ng102'),k2,t22) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t23):
   - muLB_gflow_sr(('ng101','ng102'),k0,t23) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t23):
   - muLB_gflow_sr(('ng101','ng102'),k1,t23) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t23):
   - muLB_gflow_sr(('ng101','ng102'),k2,t23) = 0
 dLag/gflow_sr(('ng101','ng102'),k0,t24):
   - muLB_gflow_sr(('ng101','ng102'),k0,t24) = 0
 dLag/gflow_sr(('ng101','ng102'),k1,t24):
   - muLB_gflow_sr(('ng101','ng102'),k1,t24) = 0
 dLag/gflow_sr(('ng101','ng102'),k2,t24):
   - muLB_gflow_sr(('ng101','ng102'),k2,t24) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t1): lambda_gas_balance_da(ng101,k0,t1)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k0,t1)
   - lambda_Flow_Bal(('ng101','ng102'),k0,t1)
   - muLB_qin_sr(('ng101','ng102'),k0,t1) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t1):
   - lambda_gas_balance_da(ng102,k0,t1)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k0,t1)
   + lambda_Flow_Bal(('ng101','ng102'),k0,t1)
   - muLB_qout_sr(('ng101','ng102'),k0,t1) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t1): lambda_gas_balance_da(ng101,k1,t1)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k1,t1)
   - lambda_Flow_Bal(('ng101','ng102'),k1,t1)
   - muLB_qin_sr(('ng101','ng102'),k1,t1) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t1):
   - lambda_gas_balance_da(ng102,k1,t1)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k1,t1)
   + lambda_Flow_Bal(('ng101','ng102'),k1,t1)
   - muLB_qout_sr(('ng101','ng102'),k1,t1) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t1): lambda_gas_balance_da(ng101,k2,t1)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k2,t1)
   - lambda_Flow_Bal(('ng101','ng102'),k2,t1)
   - muLB_qin_sr(('ng101','ng102'),k2,t1) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t1):
   - lambda_gas_balance_da(ng102,k2,t1)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k2,t1)
   + lambda_Flow_Bal(('ng101','ng102'),k2,t1)
   - muLB_qout_sr(('ng101','ng102'),k2,t1) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t2): lambda_gas_balance_da(ng101,k0,t2)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k0,t2)
   - lambda_Flow_Bal(('ng101','ng102'),k0,t2)
   - muLB_qin_sr(('ng101','ng102'),k0,t2) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t2):
   - lambda_gas_balance_da(ng102,k0,t2)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k0,t2)
   + lambda_Flow_Bal(('ng101','ng102'),k0,t2)
   - muLB_qout_sr(('ng101','ng102'),k0,t2) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t2): lambda_gas_balance_da(ng101,k1,t2)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k1,t2)
   - lambda_Flow_Bal(('ng101','ng102'),k1,t2)
   - muLB_qin_sr(('ng101','ng102'),k1,t2) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t2):
   - lambda_gas_balance_da(ng102,k1,t2)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k1,t2)
   + lambda_Flow_Bal(('ng101','ng102'),k1,t2)
   - muLB_qout_sr(('ng101','ng102'),k1,t2) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t2): lambda_gas_balance_da(ng101,k2,t2)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k2,t2)
   - lambda_Flow_Bal(('ng101','ng102'),k2,t2)
   - muLB_qin_sr(('ng101','ng102'),k2,t2) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t2):
   - lambda_gas_balance_da(ng102,k2,t2)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k2,t2)
   + lambda_Flow_Bal(('ng101','ng102'),k2,t2)
   - muLB_qout_sr(('ng101','ng102'),k2,t2) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t3): lambda_gas_balance_da(ng101,k0,t3)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k0,t3)
   - lambda_Flow_Bal(('ng101','ng102'),k0,t3)
   - muLB_qin_sr(('ng101','ng102'),k0,t3) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t3):
   - lambda_gas_balance_da(ng102,k0,t3)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k0,t3)
   + lambda_Flow_Bal(('ng101','ng102'),k0,t3)
   - muLB_qout_sr(('ng101','ng102'),k0,t3) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t3): lambda_gas_balance_da(ng101,k1,t3)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k1,t3)
   - lambda_Flow_Bal(('ng101','ng102'),k1,t3)
   - muLB_qin_sr(('ng101','ng102'),k1,t3) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t3):
   - lambda_gas_balance_da(ng102,k1,t3)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k1,t3)
   + lambda_Flow_Bal(('ng101','ng102'),k1,t3)
   - muLB_qout_sr(('ng101','ng102'),k1,t3) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t3): lambda_gas_balance_da(ng101,k2,t3)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k2,t3)
   - lambda_Flow_Bal(('ng101','ng102'),k2,t3)
   - muLB_qin_sr(('ng101','ng102'),k2,t3) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t3):
   - lambda_gas_balance_da(ng102,k2,t3)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k2,t3)
   + lambda_Flow_Bal(('ng101','ng102'),k2,t3)
   - muLB_qout_sr(('ng101','ng102'),k2,t3) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t4): lambda_gas_balance_da(ng101,k0,t4)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k0,t4)
   - lambda_Flow_Bal(('ng101','ng102'),k0,t4)
   - muLB_qin_sr(('ng101','ng102'),k0,t4) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t4):
   - lambda_gas_balance_da(ng102,k0,t4)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k0,t4)
   + lambda_Flow_Bal(('ng101','ng102'),k0,t4)
   - muLB_qout_sr(('ng101','ng102'),k0,t4) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t4): lambda_gas_balance_da(ng101,k1,t4)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k1,t4)
   - lambda_Flow_Bal(('ng101','ng102'),k1,t4)
   - muLB_qin_sr(('ng101','ng102'),k1,t4) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t4):
   - lambda_gas_balance_da(ng102,k1,t4)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k1,t4)
   + lambda_Flow_Bal(('ng101','ng102'),k1,t4)
   - muLB_qout_sr(('ng101','ng102'),k1,t4) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t4): lambda_gas_balance_da(ng101,k2,t4)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k2,t4)
   - lambda_Flow_Bal(('ng101','ng102'),k2,t4)
   - muLB_qin_sr(('ng101','ng102'),k2,t4) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t4):
   - lambda_gas_balance_da(ng102,k2,t4)
   + 0.5 lambda_gflow_sr_io(('ng101','ng102'),k2,t4)
   + lambda_Flow_Bal(('ng101','ng102'),k2,t4)
   - muLB_qout_sr(('ng101','ng102'),k2,t4) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t5):
   - muLB_qin_sr(('ng101','ng102'),k0,t5) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t5):
   - muLB_qout_sr(('ng101','ng102'),k0,t5) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t5):
   - muLB_qin_sr(('ng101','ng102'),k1,t5) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t5):
   - muLB_qout_sr(('ng101','ng102'),k1,t5) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t5):
   - muLB_qin_sr(('ng101','ng102'),k2,t5) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t5):
   - muLB_qout_sr(('ng101','ng102'),k2,t5) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t6):
   - muLB_qin_sr(('ng101','ng102'),k0,t6) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t6):
   - muLB_qout_sr(('ng101','ng102'),k0,t6) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t6):
   - muLB_qin_sr(('ng101','ng102'),k1,t6) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t6):
   - muLB_qout_sr(('ng101','ng102'),k1,t6) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t6):
   - muLB_qin_sr(('ng101','ng102'),k2,t6) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t6):
   - muLB_qout_sr(('ng101','ng102'),k2,t6) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t7):
   - muLB_qin_sr(('ng101','ng102'),k0,t7) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t7):
   - muLB_qout_sr(('ng101','ng102'),k0,t7) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t7):
   - muLB_qin_sr(('ng101','ng102'),k1,t7) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t7):
   - muLB_qout_sr(('ng101','ng102'),k1,t7) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t7):
   - muLB_qin_sr(('ng101','ng102'),k2,t7) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t7):
   - muLB_qout_sr(('ng101','ng102'),k2,t7) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t8):
   - muLB_qin_sr(('ng101','ng102'),k0,t8) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t8):
   - muLB_qout_sr(('ng101','ng102'),k0,t8) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t8):
   - muLB_qin_sr(('ng101','ng102'),k1,t8) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t8):
   - muLB_qout_sr(('ng101','ng102'),k1,t8) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t8):
   - muLB_qin_sr(('ng101','ng102'),k2,t8) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t8):
   - muLB_qout_sr(('ng101','ng102'),k2,t8) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t9):
   - muLB_qin_sr(('ng101','ng102'),k0,t9) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t9):
   - muLB_qout_sr(('ng101','ng102'),k0,t9) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t9):
   - muLB_qin_sr(('ng101','ng102'),k1,t9) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t9):
   - muLB_qout_sr(('ng101','ng102'),k1,t9) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t9):
   - muLB_qin_sr(('ng101','ng102'),k2,t9) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t9):
   - muLB_qout_sr(('ng101','ng102'),k2,t9) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t10):
   - muLB_qin_sr(('ng101','ng102'),k0,t10) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t10):
   - muLB_qout_sr(('ng101','ng102'),k0,t10) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t10):
   - muLB_qin_sr(('ng101','ng102'),k1,t10) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t10):
   - muLB_qout_sr(('ng101','ng102'),k1,t10) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t10):
   - muLB_qin_sr(('ng101','ng102'),k2,t10) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t10):
   - muLB_qout_sr(('ng101','ng102'),k2,t10) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t11):
   - muLB_qin_sr(('ng101','ng102'),k0,t11) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t11):
   - muLB_qout_sr(('ng101','ng102'),k0,t11) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t11):
   - muLB_qin_sr(('ng101','ng102'),k1,t11) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t11):
   - muLB_qout_sr(('ng101','ng102'),k1,t11) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t11):
   - muLB_qin_sr(('ng101','ng102'),k2,t11) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t11):
   - muLB_qout_sr(('ng101','ng102'),k2,t11) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t12):
   - muLB_qin_sr(('ng101','ng102'),k0,t12) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t12):
   - muLB_qout_sr(('ng101','ng102'),k0,t12) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t12):
   - muLB_qin_sr(('ng101','ng102'),k1,t12) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t12):
   - muLB_qout_sr(('ng101','ng102'),k1,t12) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t12):
   - muLB_qin_sr(('ng101','ng102'),k2,t12) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t12):
   - muLB_qout_sr(('ng101','ng102'),k2,t12) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t13):
   - muLB_qin_sr(('ng101','ng102'),k0,t13) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t13):
   - muLB_qout_sr(('ng101','ng102'),k0,t13) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t13):
   - muLB_qin_sr(('ng101','ng102'),k1,t13) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t13):
   - muLB_qout_sr(('ng101','ng102'),k1,t13) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t13):
   - muLB_qin_sr(('ng101','ng102'),k2,t13) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t13):
   - muLB_qout_sr(('ng101','ng102'),k2,t13) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t14):
   - muLB_qin_sr(('ng101','ng102'),k0,t14) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t14):
   - muLB_qout_sr(('ng101','ng102'),k0,t14) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t14):
   - muLB_qin_sr(('ng101','ng102'),k1,t14) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t14):
   - muLB_qout_sr(('ng101','ng102'),k1,t14) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t14):
   - muLB_qin_sr(('ng101','ng102'),k2,t14) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t14):
   - muLB_qout_sr(('ng101','ng102'),k2,t14) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t15):
   - muLB_qin_sr(('ng101','ng102'),k0,t15) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t15):
   - muLB_qout_sr(('ng101','ng102'),k0,t15) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t15):
   - muLB_qin_sr(('ng101','ng102'),k1,t15) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t15):
   - muLB_qout_sr(('ng101','ng102'),k1,t15) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t15):
   - muLB_qin_sr(('ng101','ng102'),k2,t15) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t15):
   - muLB_qout_sr(('ng101','ng102'),k2,t15) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t16):
   - muLB_qin_sr(('ng101','ng102'),k0,t16) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t16):
   - muLB_qout_sr(('ng101','ng102'),k0,t16) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t16):
   - muLB_qin_sr(('ng101','ng102'),k1,t16) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t16):
   - muLB_qout_sr(('ng101','ng102'),k1,t16) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t16):
   - muLB_qin_sr(('ng101','ng102'),k2,t16) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t16):
   - muLB_qout_sr(('ng101','ng102'),k2,t16) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t17):
   - muLB_qin_sr(('ng101','ng102'),k0,t17) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t17):
   - muLB_qout_sr(('ng101','ng102'),k0,t17) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t17):
   - muLB_qin_sr(('ng101','ng102'),k1,t17) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t17):
   - muLB_qout_sr(('ng101','ng102'),k1,t17) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t17):
   - muLB_qin_sr(('ng101','ng102'),k2,t17) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t17):
   - muLB_qout_sr(('ng101','ng102'),k2,t17) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t18):
   - muLB_qin_sr(('ng101','ng102'),k0,t18) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t18):
   - muLB_qout_sr(('ng101','ng102'),k0,t18) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t18):
   - muLB_qin_sr(('ng101','ng102'),k1,t18) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t18):
   - muLB_qout_sr(('ng101','ng102'),k1,t18) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t18):
   - muLB_qin_sr(('ng101','ng102'),k2,t18) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t18):
   - muLB_qout_sr(('ng101','ng102'),k2,t18) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t19):
   - muLB_qin_sr(('ng101','ng102'),k0,t19) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t19):
   - muLB_qout_sr(('ng101','ng102'),k0,t19) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t19):
   - muLB_qin_sr(('ng101','ng102'),k1,t19) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t19):
   - muLB_qout_sr(('ng101','ng102'),k1,t19) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t19):
   - muLB_qin_sr(('ng101','ng102'),k2,t19) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t19):
   - muLB_qout_sr(('ng101','ng102'),k2,t19) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t20):
   - muLB_qin_sr(('ng101','ng102'),k0,t20) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t20):
   - muLB_qout_sr(('ng101','ng102'),k0,t20) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t20):
   - muLB_qin_sr(('ng101','ng102'),k1,t20) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t20):
   - muLB_qout_sr(('ng101','ng102'),k1,t20) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t20):
   - muLB_qin_sr(('ng101','ng102'),k2,t20) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t20):
   - muLB_qout_sr(('ng101','ng102'),k2,t20) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t21):
   - muLB_qin_sr(('ng101','ng102'),k0,t21) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t21):
   - muLB_qout_sr(('ng101','ng102'),k0,t21) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t21):
   - muLB_qin_sr(('ng101','ng102'),k1,t21) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t21):
   - muLB_qout_sr(('ng101','ng102'),k1,t21) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t21):
   - muLB_qin_sr(('ng101','ng102'),k2,t21) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t21):
   - muLB_qout_sr(('ng101','ng102'),k2,t21) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t22):
   - muLB_qin_sr(('ng101','ng102'),k0,t22) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t22):
   - muLB_qout_sr(('ng101','ng102'),k0,t22) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t22):
   - muLB_qin_sr(('ng101','ng102'),k1,t22) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t22):
   - muLB_qout_sr(('ng101','ng102'),k1,t22) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t22):
   - muLB_qin_sr(('ng101','ng102'),k2,t22) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t22):
   - muLB_qout_sr(('ng101','ng102'),k2,t22) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t23):
   - muLB_qin_sr(('ng101','ng102'),k0,t23) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t23):
   - muLB_qout_sr(('ng101','ng102'),k0,t23) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t23):
   - muLB_qin_sr(('ng101','ng102'),k1,t23) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t23):
   - muLB_qout_sr(('ng101','ng102'),k1,t23) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t23):
   - muLB_qin_sr(('ng101','ng102'),k2,t23) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t23):
   - muLB_qout_sr(('ng101','ng102'),k2,t23) = 0
 dLag/qin_sr(('ng101','ng102'),k0,t24):
   - muLB_qin_sr(('ng101','ng102'),k0,t24) = 0
 dLag/qout_sr(('ng101','ng102'),k0,t24):
   - muLB_qout_sr(('ng101','ng102'),k0,t24) = 0
 dLag/qin_sr(('ng101','ng102'),k1,t24):
   - muLB_qin_sr(('ng101','ng102'),k1,t24) = 0
 dLag/qout_sr(('ng101','ng102'),k1,t24):
   - muLB_qout_sr(('ng101','ng102'),k1,t24) = 0
 dLag/qin_sr(('ng101','ng102'),k2,t24):
   - muLB_qin_sr(('ng101','ng102'),k2,t24) = 0
 dLag/qout_sr(('ng101','ng102'),k2,t24):
   - muLB_qout_sr(('ng101','ng102'),k2,t24) = 0
 dLag/gprod(gw1,k0,t1): - lambda_gas_balance_da(ng101,k0,t1)
   + mu_gprod_max(gw1,k0,t1) - muLB_gprod(gw1,k0,t1) = -2
 dLag/gprod(gw1,k1,t1): - lambda_gas_balance_da(ng101,k1,t1)
   + mu_gprod_max(gw1,k1,t1) - muLB_gprod(gw1,k1,t1) = 0
 dLag/gprod(gw1,k2,t1): - lambda_gas_balance_da(ng101,k2,t1)
   + mu_gprod_max(gw1,k2,t1) - muLB_gprod(gw1,k2,t1) = 0
 dLag/gprod(gw1,k0,t2): - lambda_gas_balance_da(ng101,k0,t2)
   + mu_gprod_max(gw1,k0,t2) - muLB_gprod(gw1,k0,t2) = -2
 dLag/gprod(gw1,k1,t2): - lambda_gas_balance_da(ng101,k1,t2)
   + mu_gprod_max(gw1,k1,t2) - muLB_gprod(gw1,k1,t2) = 0
 dLag/gprod(gw1,k2,t2): - lambda_gas_balance_da(ng101,k2,t2)
   + mu_gprod_max(gw1,k2,t2) - muLB_gprod(gw1,k2,t2) = 0
 dLag/gprod(gw1,k0,t3): - lambda_gas_balance_da(ng101,k0,t3)
   + mu_gprod_max(gw1,k0,t3) - muLB_gprod(gw1,k0,t3) = -2
 dLag/gprod(gw1,k1,t3): - lambda_gas_balance_da(ng101,k1,t3)
   + mu_gprod_max(gw1,k1,t3) - muLB_gprod(gw1,k1,t3) = 0
 dLag/gprod(gw1,k2,t3): - lambda_gas_balance_da(ng101,k2,t3)
   + mu_gprod_max(gw1,k2,t3) - muLB_gprod(gw1,k2,t3) = 0
 dLag/gprod(gw1,k0,t4): - lambda_gas_balance_da(ng101,k0,t4)
   + mu_gprod_max(gw1,k0,t4) - muLB_gprod(gw1,k0,t4) = -2
 dLag/gprod(gw1,k1,t4): - lambda_gas_balance_da(ng101,k1,t4)
   + mu_gprod_max(gw1,k1,t4) - muLB_gprod(gw1,k1,t4) = 0
 dLag/gprod(gw1,k2,t4): - lambda_gas_balance_da(ng101,k2,t4)
   + mu_gprod_max(gw1,k2,t4) - muLB_gprod(gw1,k2,t4) = 0
 dLag/gprod(gw1,k0,t5): - muLB_gprod(gw1,k0,t5) = 0
 dLag/gprod(gw1,k1,t5): - muLB_gprod(gw1,k1,t5) = 0
 dLag/gprod(gw1,k2,t5): - muLB_gprod(gw1,k2,t5) = 0
 dLag/gprod(gw1,k0,t6): - muLB_gprod(gw1,k0,t6) = 0
 dLag/gprod(gw1,k1,t6): - muLB_gprod(gw1,k1,t6) = 0
 dLag/gprod(gw1,k2,t6): - muLB_gprod(gw1,k2,t6) = 0
 dLag/gprod(gw1,k0,t7): - muLB_gprod(gw1,k0,t7) = 0
 dLag/gprod(gw1,k1,t7): - muLB_gprod(gw1,k1,t7) = 0
 dLag/gprod(gw1,k2,t7): - muLB_gprod(gw1,k2,t7) = 0
 dLag/gprod(gw1,k0,t8): - muLB_gprod(gw1,k0,t8) = 0
 dLag/gprod(gw1,k1,t8): - muLB_gprod(gw1,k1,t8) = 0
 dLag/gprod(gw1,k2,t8): - muLB_gprod(gw1,k2,t8) = 0
 dLag/gprod(gw1,k0,t9): - muLB_gprod(gw1,k0,t9) = 0
 dLag/gprod(gw1,k1,t9): - muLB_gprod(gw1,k1,t9) = 0
 dLag/gprod(gw1,k2,t9): - muLB_gprod(gw1,k2,t9) = 0
 dLag/gprod(gw1,k0,t10): - muLB_gprod(gw1,k0,t10) = 0
 dLag/gprod(gw1,k1,t10): - muLB_gprod(gw1,k1,t10) = 0
 dLag/gprod(gw1,k2,t10): - muLB_gprod(gw1,k2,t10) = 0
 dLag/gprod(gw1,k0,t11): - muLB_gprod(gw1,k0,t11) = 0
 dLag/gprod(gw1,k1,t11): - muLB_gprod(gw1,k1,t11) = 0
 dLag/gprod(gw1,k2,t11): - muLB_gprod(gw1,k2,t11) = 0
 dLag/gprod(gw1,k0,t12): - muLB_gprod(gw1,k0,t12) = 0
 dLag/gprod(gw1,k1,t12): - muLB_gprod(gw1,k1,t12) = 0
 dLag/gprod(gw1,k2,t12): - muLB_gprod(gw1,k2,t12) = 0
 dLag/gprod(gw1,k0,t13): - muLB_gprod(gw1,k0,t13) = 0
 dLag/gprod(gw1,k1,t13): - muLB_gprod(gw1,k1,t13) = 0
 dLag/gprod(gw1,k2,t13): - muLB_gprod(gw1,k2,t13) = 0
 dLag/gprod(gw1,k0,t14): - muLB_gprod(gw1,k0,t14) = 0
 dLag/gprod(gw1,k1,t14): - muLB_gprod(gw1,k1,t14) = 0
 dLag/gprod(gw1,k2,t14): - muLB_gprod(gw1,k2,t14) = 0
 dLag/gprod(gw1,k0,t15): - muLB_gprod(gw1,k0,t15) = 0
 dLag/gprod(gw1,k1,t15): - muLB_gprod(gw1,k1,t15) = 0
 dLag/gprod(gw1,k2,t15): - muLB_gprod(gw1,k2,t15) = 0
 dLag/gprod(gw1,k0,t16): - muLB_gprod(gw1,k0,t16) = 0
 dLag/gprod(gw1,k1,t16): - muLB_gprod(gw1,k1,t16) = 0
 dLag/gprod(gw1,k2,t16): - muLB_gprod(gw1,k2,t16) = 0
 dLag/gprod(gw1,k0,t17): - muLB_gprod(gw1,k0,t17) = 0
 dLag/gprod(gw1,k1,t17): - muLB_gprod(gw1,k1,t17) = 0
 dLag/gprod(gw1,k2,t17): - muLB_gprod(gw1,k2,t17) = 0
 dLag/gprod(gw1,k0,t18): - muLB_gprod(gw1,k0,t18) = 0
 dLag/gprod(gw1,k1,t18): - muLB_gprod(gw1,k1,t18) = 0
 dLag/gprod(gw1,k2,t18): - muLB_gprod(gw1,k2,t18) = 0
 dLag/gprod(gw1,k0,t19): - muLB_gprod(gw1,k0,t19) = 0
 dLag/gprod(gw1,k1,t19): - muLB_gprod(gw1,k1,t19) = 0
 dLag/gprod(gw1,k2,t19): - muLB_gprod(gw1,k2,t19) = 0
 dLag/gprod(gw1,k0,t20): - muLB_gprod(gw1,k0,t20) = 0
 dLag/gprod(gw1,k1,t20): - muLB_gprod(gw1,k1,t20) = 0
 dLag/gprod(gw1,k2,t20): - muLB_gprod(gw1,k2,t20) = 0
 dLag/gprod(gw1,k0,t21): - muLB_gprod(gw1,k0,t21) = 0
 dLag/gprod(gw1,k1,t21): - muLB_gprod(gw1,k1,t21) = 0
 dLag/gprod(gw1,k2,t21): - muLB_gprod(gw1,k2,t21) = 0
 dLag/gprod(gw1,k0,t22): - muLB_gprod(gw1,k0,t22) = 0
 dLag/gprod(gw1,k1,t22): - muLB_gprod(gw1,k1,t22) = 0
 dLag/gprod(gw1,k2,t22): - muLB_gprod(gw1,k2,t22) = 0
 dLag/gprod(gw1,k0,t23): - muLB_gprod(gw1,k0,t23) = 0
 dLag/gprod(gw1,k1,t23): - muLB_gprod(gw1,k1,t23) = 0
 dLag/gprod(gw1,k2,t23): - muLB_gprod(gw1,k2,t23) = 0
 dLag/gprod(gw1,k0,t24): - muLB_gprod(gw1,k0,t24) = 0
 dLag/gprod(gw1,k1,t24): - muLB_gprod(gw1,k1,t24) = 0
 dLag/gprod(gw1,k2,t24): - muLB_gprod(gw1,k2,t24) = 0
 dLag/gprod(gw2,k0,t1): - lambda_gas_balance_da(ng101,k0,t1)
   + mu_gprod_max(gw2,k0,t1) - muLB_gprod(gw2,k0,t1) = -3
 dLag/gprod(gw2,k1,t1): - lambda_gas_balance_da(ng101,k1,t1)
   + mu_gprod_max(gw2,k1,t1) - muLB_gprod(gw2,k1,t1) = 0
 dLag/gprod(gw2,k2,t1): - lambda_gas_balance_da(ng101,k2,t1)
   + mu_gprod_max(gw2,k2,t1) - muLB_gprod(gw2,k2,t1) = 0
 dLag/gprod(gw2,k0,t2): - lambda_gas_balance_da(ng101,k0,t2)
   + mu_gprod_max(gw2,k0,t2) - muLB_gprod(gw2,k0,t2) = -3
 dLag/gprod(gw2,k1,t2): - lambda_gas_balance_da(ng101,k1,t2)
   + mu_gprod_max(gw2,k1,t2) - muLB_gprod(gw2,k1,t2) = 0
 dLag/gprod(gw2,k2,t2): - lambda_gas_balance_da(ng101,k2,t2)
   + mu_gprod_max(gw2,k2,t2) - muLB_gprod(gw2,k2,t2) = 0
 dLag/gprod(gw2,k0,t3): - lambda_gas_balance_da(ng101,k0,t3)
   + mu_gprod_max(gw2,k0,t3) - muLB_gprod(gw2,k0,t3) = -3
 dLag/gprod(gw2,k1,t3): - lambda_gas_balance_da(ng101,k1,t3)
   + mu_gprod_max(gw2,k1,t3) - muLB_gprod(gw2,k1,t3) = 0
 dLag/gprod(gw2,k2,t3): - lambda_gas_balance_da(ng101,k2,t3)
   + mu_gprod_max(gw2,k2,t3) - muLB_gprod(gw2,k2,t3) = 0
 dLag/gprod(gw2,k0,t4): - lambda_gas_balance_da(ng101,k0,t4)
   + mu_gprod_max(gw2,k0,t4) - muLB_gprod(gw2,k0,t4) = -3
 dLag/gprod(gw2,k1,t4): - lambda_gas_balance_da(ng101,k1,t4)
   + mu_gprod_max(gw2,k1,t4) - muLB_gprod(gw2,k1,t4) = 0
 dLag/gprod(gw2,k2,t4): - lambda_gas_balance_da(ng101,k2,t4)
   + mu_gprod_max(gw2,k2,t4) - muLB_gprod(gw2,k2,t4) = 0
 dLag/gprod(gw2,k0,t5): - muLB_gprod(gw2,k0,t5) = 0
 dLag/gprod(gw2,k1,t5): - muLB_gprod(gw2,k1,t5) = 0
 dLag/gprod(gw2,k2,t5): - muLB_gprod(gw2,k2,t5) = 0
 dLag/gprod(gw2,k0,t6): - muLB_gprod(gw2,k0,t6) = 0
 dLag/gprod(gw2,k1,t6): - muLB_gprod(gw2,k1,t6) = 0
 dLag/gprod(gw2,k2,t6): - muLB_gprod(gw2,k2,t6) = 0
 dLag/gprod(gw2,k0,t7): - muLB_gprod(gw2,k0,t7) = 0
 dLag/gprod(gw2,k1,t7): - muLB_gprod(gw2,k1,t7) = 0
 dLag/gprod(gw2,k2,t7): - muLB_gprod(gw2,k2,t7) = 0
 dLag/gprod(gw2,k0,t8): - muLB_gprod(gw2,k0,t8) = 0
 dLag/gprod(gw2,k1,t8): - muLB_gprod(gw2,k1,t8) = 0
 dLag/gprod(gw2,k2,t8): - muLB_gprod(gw2,k2,t8) = 0
 dLag/gprod(gw2,k0,t9): - muLB_gprod(gw2,k0,t9) = 0
 dLag/gprod(gw2,k1,t9): - muLB_gprod(gw2,k1,t9) = 0
 dLag/gprod(gw2,k2,t9): - muLB_gprod(gw2,k2,t9) = 0
 dLag/gprod(gw2,k0,t10): - muLB_gprod(gw2,k0,t10) = 0
 dLag/gprod(gw2,k1,t10): - muLB_gprod(gw2,k1,t10) = 0
 dLag/gprod(gw2,k2,t10): - muLB_gprod(gw2,k2,t10) = 0
 dLag/gprod(gw2,k0,t11): - muLB_gprod(gw2,k0,t11) = 0
 dLag/gprod(gw2,k1,t11): - muLB_gprod(gw2,k1,t11) = 0
 dLag/gprod(gw2,k2,t11): - muLB_gprod(gw2,k2,t11) = 0
 dLag/gprod(gw2,k0,t12): - muLB_gprod(gw2,k0,t12) = 0
 dLag/gprod(gw2,k1,t12): - muLB_gprod(gw2,k1,t12) = 0
 dLag/gprod(gw2,k2,t12): - muLB_gprod(gw2,k2,t12) = 0
 dLag/gprod(gw2,k0,t13): - muLB_gprod(gw2,k0,t13) = 0
 dLag/gprod(gw2,k1,t13): - muLB_gprod(gw2,k1,t13) = 0
 dLag/gprod(gw2,k2,t13): - muLB_gprod(gw2,k2,t13) = 0
 dLag/gprod(gw2,k0,t14): - muLB_gprod(gw2,k0,t14) = 0
 dLag/gprod(gw2,k1,t14): - muLB_gprod(gw2,k1,t14) = 0
 dLag/gprod(gw2,k2,t14): - muLB_gprod(gw2,k2,t14) = 0
 dLag/gprod(gw2,k0,t15): - muLB_gprod(gw2,k0,t15) = 0
 dLag/gprod(gw2,k1,t15): - muLB_gprod(gw2,k1,t15) = 0
 dLag/gprod(gw2,k2,t15): - muLB_gprod(gw2,k2,t15) = 0
 dLag/gprod(gw2,k0,t16): - muLB_gprod(gw2,k0,t16) = 0
 dLag/gprod(gw2,k1,t16): - muLB_gprod(gw2,k1,t16) = 0
 dLag/gprod(gw2,k2,t16): - muLB_gprod(gw2,k2,t16) = 0
 dLag/gprod(gw2,k0,t17): - muLB_gprod(gw2,k0,t17) = 0
 dLag/gprod(gw2,k1,t17): - muLB_gprod(gw2,k1,t17) = 0
 dLag/gprod(gw2,k2,t17): - muLB_gprod(gw2,k2,t17) = 0
 dLag/gprod(gw2,k0,t18): - muLB_gprod(gw2,k0,t18) = 0
 dLag/gprod(gw2,k1,t18): - muLB_gprod(gw2,k1,t18) = 0
 dLag/gprod(gw2,k2,t18): - muLB_gprod(gw2,k2,t18) = 0
 dLag/gprod(gw2,k0,t19): - muLB_gprod(gw2,k0,t19) = 0
 dLag/gprod(gw2,k1,t19): - muLB_gprod(gw2,k1,t19) = 0
 dLag/gprod(gw2,k2,t19): - muLB_gprod(gw2,k2,t19) = 0
 dLag/gprod(gw2,k0,t20): - muLB_gprod(gw2,k0,t20) = 0
 dLag/gprod(gw2,k1,t20): - muLB_gprod(gw2,k1,t20) = 0
 dLag/gprod(gw2,k2,t20): - muLB_gprod(gw2,k2,t20) = 0
 dLag/gprod(gw2,k0,t21): - muLB_gprod(gw2,k0,t21) = 0
 dLag/gprod(gw2,k1,t21): - muLB_gprod(gw2,k1,t21) = 0
 dLag/gprod(gw2,k2,t21): - muLB_gprod(gw2,k2,t21) = 0
 dLag/gprod(gw2,k0,t22): - muLB_gprod(gw2,k0,t22) = 0
 dLag/gprod(gw2,k1,t22): - muLB_gprod(gw2,k1,t22) = 0
 dLag/gprod(gw2,k2,t22): - muLB_gprod(gw2,k2,t22) = 0
 dLag/gprod(gw2,k0,t23): - muLB_gprod(gw2,k0,t23) = 0
 dLag/gprod(gw2,k1,t23): - muLB_gprod(gw2,k1,t23) = 0
 dLag/gprod(gw2,k2,t23): - muLB_gprod(gw2,k2,t23) = 0
 dLag/gprod(gw2,k0,t24): - muLB_gprod(gw2,k0,t24) = 0
 dLag/gprod(gw2,k1,t24): - muLB_gprod(gw2,k1,t24) = 0
 dLag/gprod(gw2,k2,t24): - muLB_gprod(gw2,k2,t24) = 0
 dLag/gprod(gw3,k0,t1): - lambda_gas_balance_da(ng101,k0,t1)
   + mu_gprod_max(gw3,k0,t1) - muLB_gprod(gw3,k0,t1) = -4
 dLag/gprod(gw3,k1,t1): - lambda_gas_balance_da(ng101,k1,t1)
   + mu_gprod_max(gw3,k1,t1) - muLB_gprod(gw3,k1,t1) = 0
 dLag/gprod(gw3,k2,t1): - lambda_gas_balance_da(ng101,k2,t1)
   + mu_gprod_max(gw3,k2,t1) - muLB_gprod(gw3,k2,t1) = 0
 dLag/gprod(gw3,k0,t2): - lambda_gas_balance_da(ng101,k0,t2)
   + mu_gprod_max(gw3,k0,t2) - muLB_gprod(gw3,k0,t2) = -4
 dLag/gprod(gw3,k1,t2): - lambda_gas_balance_da(ng101,k1,t2)
   + mu_gprod_max(gw3,k1,t2) - muLB_gprod(gw3,k1,t2) = 0
 dLag/gprod(gw3,k2,t2): - lambda_gas_balance_da(ng101,k2,t2)
   + mu_gprod_max(gw3,k2,t2) - muLB_gprod(gw3,k2,t2) = 0
 dLag/gprod(gw3,k0,t3): - lambda_gas_balance_da(ng101,k0,t3)
   + mu_gprod_max(gw3,k0,t3) - muLB_gprod(gw3,k0,t3) = -4
 dLag/gprod(gw3,k1,t3): - lambda_gas_balance_da(ng101,k1,t3)
   + mu_gprod_max(gw3,k1,t3) - muLB_gprod(gw3,k1,t3) = 0
 dLag/gprod(gw3,k2,t3): - lambda_gas_balance_da(ng101,k2,t3)
   + mu_gprod_max(gw3,k2,t3) - muLB_gprod(gw3,k2,t3) = 0
 dLag/gprod(gw3,k0,t4): - lambda_gas_balance_da(ng101,k0,t4)
   + mu_gprod_max(gw3,k0,t4) - muLB_gprod(gw3,k0,t4) = -4
 dLag/gprod(gw3,k1,t4): - lambda_gas_balance_da(ng101,k1,t4)
   + mu_gprod_max(gw3,k1,t4) - muLB_gprod(gw3,k1,t4) = 0
 dLag/gprod(gw3,k2,t4): - lambda_gas_balance_da(ng101,k2,t4)
   + mu_gprod_max(gw3,k2,t4) - muLB_gprod(gw3,k2,t4) = 0
 dLag/gprod(gw3,k0,t5): - muLB_gprod(gw3,k0,t5) = 0
 dLag/gprod(gw3,k1,t5): - muLB_gprod(gw3,k1,t5) = 0
 dLag/gprod(gw3,k2,t5): - muLB_gprod(gw3,k2,t5) = 0
 dLag/gprod(gw3,k0,t6): - muLB_gprod(gw3,k0,t6) = 0
 dLag/gprod(gw3,k1,t6): - muLB_gprod(gw3,k1,t6) = 0
 dLag/gprod(gw3,k2,t6): - muLB_gprod(gw3,k2,t6) = 0
 dLag/gprod(gw3,k0,t7): - muLB_gprod(gw3,k0,t7) = 0
 dLag/gprod(gw3,k1,t7): - muLB_gprod(gw3,k1,t7) = 0
 dLag/gprod(gw3,k2,t7): - muLB_gprod(gw3,k2,t7) = 0
 dLag/gprod(gw3,k0,t8): - muLB_gprod(gw3,k0,t8) = 0
 dLag/gprod(gw3,k1,t8): - muLB_gprod(gw3,k1,t8) = 0
 dLag/gprod(gw3,k2,t8): - muLB_gprod(gw3,k2,t8) = 0
 dLag/gprod(gw3,k0,t9): - muLB_gprod(gw3,k0,t9) = 0
 dLag/gprod(gw3,k1,t9): - muLB_gprod(gw3,k1,t9) = 0
 dLag/gprod(gw3,k2,t9): - muLB_gprod(gw3,k2,t9) = 0
 dLag/gprod(gw3,k0,t10): - muLB_gprod(gw3,k0,t10) = 0
 dLag/gprod(gw3,k1,t10): - muLB_gprod(gw3,k1,t10) = 0
 dLag/gprod(gw3,k2,t10): - muLB_gprod(gw3,k2,t10) = 0
 dLag/gprod(gw3,k0,t11): - muLB_gprod(gw3,k0,t11) = 0
 dLag/gprod(gw3,k1,t11): - muLB_gprod(gw3,k1,t11) = 0
 dLag/gprod(gw3,k2,t11): - muLB_gprod(gw3,k2,t11) = 0
 dLag/gprod(gw3,k0,t12): - muLB_gprod(gw3,k0,t12) = 0
 dLag/gprod(gw3,k1,t12): - muLB_gprod(gw3,k1,t12) = 0
 dLag/gprod(gw3,k2,t12): - muLB_gprod(gw3,k2,t12) = 0
 dLag/gprod(gw3,k0,t13): - muLB_gprod(gw3,k0,t13) = 0
 dLag/gprod(gw3,k1,t13): - muLB_gprod(gw3,k1,t13) = 0
 dLag/gprod(gw3,k2,t13): - muLB_gprod(gw3,k2,t13) = 0
 dLag/gprod(gw3,k0,t14): - muLB_gprod(gw3,k0,t14) = 0
 dLag/gprod(gw3,k1,t14): - muLB_gprod(gw3,k1,t14) = 0
 dLag/gprod(gw3,k2,t14): - muLB_gprod(gw3,k2,t14) = 0
 dLag/gprod(gw3,k0,t15): - muLB_gprod(gw3,k0,t15) = 0
 dLag/gprod(gw3,k1,t15): - muLB_gprod(gw3,k1,t15) = 0
 dLag/gprod(gw3,k2,t15): - muLB_gprod(gw3,k2,t15) = 0
 dLag/gprod(gw3,k0,t16): - muLB_gprod(gw3,k0,t16) = 0
 dLag/gprod(gw3,k1,t16): - muLB_gprod(gw3,k1,t16) = 0
 dLag/gprod(gw3,k2,t16): - muLB_gprod(gw3,k2,t16) = 0
 dLag/gprod(gw3,k0,t17): - muLB_gprod(gw3,k0,t17) = 0
 dLag/gprod(gw3,k1,t17): - muLB_gprod(gw3,k1,t17) = 0
 dLag/gprod(gw3,k2,t17): - muLB_gprod(gw3,k2,t17) = 0
 dLag/gprod(gw3,k0,t18): - muLB_gprod(gw3,k0,t18) = 0
 dLag/gprod(gw3,k1,t18): - muLB_gprod(gw3,k1,t18) = 0
 dLag/gprod(gw3,k2,t18): - muLB_gprod(gw3,k2,t18) = 0
 dLag/gprod(gw3,k0,t19): - muLB_gprod(gw3,k0,t19) = 0
 dLag/gprod(gw3,k1,t19): - muLB_gprod(gw3,k1,t19) = 0
 dLag/gprod(gw3,k2,t19): - muLB_gprod(gw3,k2,t19) = 0
 dLag/gprod(gw3,k0,t20): - muLB_gprod(gw3,k0,t20) = 0
 dLag/gprod(gw3,k1,t20): - muLB_gprod(gw3,k1,t20) = 0
 dLag/gprod(gw3,k2,t20): - muLB_gprod(gw3,k2,t20) = 0
 dLag/gprod(gw3,k0,t21): - muLB_gprod(gw3,k0,t21) = 0
 dLag/gprod(gw3,k1,t21): - muLB_gprod(gw3,k1,t21) = 0
 dLag/gprod(gw3,k2,t21): - muLB_gprod(gw3,k2,t21) = 0
 dLag/gprod(gw3,k0,t22): - muLB_gprod(gw3,k0,t22) = 0
 dLag/gprod(gw3,k1,t22): - muLB_gprod(gw3,k1,t22) = 0
 dLag/gprod(gw3,k2,t22): - muLB_gprod(gw3,k2,t22) = 0
 dLag/gprod(gw3,k0,t23): - muLB_gprod(gw3,k0,t23) = 0
 dLag/gprod(gw3,k1,t23): - muLB_gprod(gw3,k1,t23) = 0
 dLag/gprod(gw3,k2,t23): - muLB_gprod(gw3,k2,t23) = 0
 dLag/gprod(gw3,k0,t24): - muLB_gprod(gw3,k0,t24) = 0
 dLag/gprod(gw3,k1,t24): - muLB_gprod(gw3,k1,t24) = 0
 dLag/gprod(gw3,k2,t24): - muLB_gprod(gw3,k2,t24) = 0
 dLag/gsin(gs1,t1,k0): lambda_gas_balance_da(ng102,k0,t1)
   + mu_gsinMax(gs1,t1,k0) + lambda_gstor_def(gs1,k0,t1)
   - muLB_gsin(gs1,t1,k0) = -2.1
 dLag/gsout(gs1,t1,k0): - lambda_gas_balance_da(ng102,k0,t1)
   + mu_gsoutMax(gs1,t1,k0) - lambda_gstor_def(gs1,k0,t1)
   - muLB_gsout(gs1,t1,k0) = -2.1
 dLag/gstore(gs1,t1,k0): mu_gstore_max(gs1,t1,k0)
   - mu_gstore_min(gs1,t1,k0) + lambda_gstor_def(gs1,k0,t2)
   - lambda_gstor_def(gs1,k0,t1) - muLB_gstore(gs1,t1,k0) = 0
 dLag/gsin(gs1,t1,k1): lambda_gas_balance_da(ng102,k1,t1)
   + mu_gsinMax(gs1,t1,k1) + lambda_gstor_def(gs1,k1,t1)
   - muLB_gsin(gs1,t1,k1) = 0
 dLag/gsout(gs1,t1,k1): - lambda_gas_balance_da(ng102,k1,t1)
   + mu_gsoutMax(gs1,t1,k1) - lambda_gstor_def(gs1,k1,t1)
   - muLB_gsout(gs1,t1,k1) = 0
 dLag/gstore(gs1,t1,k1): mu_gstore_max(gs1,t1,k1)
   - mu_gstore_min(gs1,t1,k1) + lambda_gstor_def(gs1,k1,t2)
   - lambda_gstor_def(gs1,k1,t1) - muLB_gstore(gs1,t1,k1) = 0
 dLag/gsin(gs1,t1,k2): lambda_gas_balance_da(ng102,k2,t1)
   + mu_gsinMax(gs1,t1,k2) + lambda_gstor_def(gs1,k2,t1)
   - muLB_gsin(gs1,t1,k2) = 0
 dLag/gsout(gs1,t1,k2): - lambda_gas_balance_da(ng102,k2,t1)
   + mu_gsoutMax(gs1,t1,k2) - lambda_gstor_def(gs1,k2,t1)
   - muLB_gsout(gs1,t1,k2) = 0
 dLag/gstore(gs1,t1,k2): mu_gstore_max(gs1,t1,k2)
   - mu_gstore_min(gs1,t1,k2) + lambda_gstor_def(gs1,k2,t2)
   - lambda_gstor_def(gs1,k2,t1) - muLB_gstore(gs1,t1,k2) = 0
 dLag/gsin(gs1,t2,k0): lambda_gas_balance_da(ng102,k0,t2)
   + mu_gsinMax(gs1,t2,k0) + lambda_gstor_def(gs1,k0,t2)
   - muLB_gsin(gs1,t2,k0) = -2.1
 dLag/gsout(gs1,t2,k0): - lambda_gas_balance_da(ng102,k0,t2)
   + mu_gsoutMax(gs1,t2,k0) - lambda_gstor_def(gs1,k0,t2)
   - muLB_gsout(gs1,t2,k0) = -2.1
 dLag/gstore(gs1,t2,k0): mu_gstore_max(gs1,t2,k0)
   - mu_gstore_min(gs1,t2,k0) - lambda_gstor_def(gs1,k0,t2)
   + lambda_gstor_def(gs1,k0,t3) - muLB_gstore(gs1,t2,k0) = 0
 dLag/gsin(gs1,t2,k1): lambda_gas_balance_da(ng102,k1,t2)
   + mu_gsinMax(gs1,t2,k1) + lambda_gstor_def(gs1,k1,t2)
   - muLB_gsin(gs1,t2,k1) = 0
 dLag/gsout(gs1,t2,k1): - lambda_gas_balance_da(ng102,k1,t2)
   + mu_gsoutMax(gs1,t2,k1) - lambda_gstor_def(gs1,k1,t2)
   - muLB_gsout(gs1,t2,k1) = 0
 dLag/gstore(gs1,t2,k1): mu_gstore_max(gs1,t2,k1)
   - mu_gstore_min(gs1,t2,k1) - lambda_gstor_def(gs1,k1,t2)
   + lambda_gstor_def(gs1,k1,t3) - muLB_gstore(gs1,t2,k1) = 0
 dLag/gsin(gs1,t2,k2): lambda_gas_balance_da(ng102,k2,t2)
   + mu_gsinMax(gs1,t2,k2) + lambda_gstor_def(gs1,k2,t2)
   - muLB_gsin(gs1,t2,k2) = 0
 dLag/gsout(gs1,t2,k2): - lambda_gas_balance_da(ng102,k2,t2)
   + mu_gsoutMax(gs1,t2,k2) - lambda_gstor_def(gs1,k2,t2)
   - muLB_gsout(gs1,t2,k2) = 0
 dLag/gstore(gs1,t2,k2): mu_gstore_max(gs1,t2,k2)
   - mu_gstore_min(gs1,t2,k2) - lambda_gstor_def(gs1,k2,t2)
   + lambda_gstor_def(gs1,k2,t3) - muLB_gstore(gs1,t2,k2) = 0
 dLag/gsin(gs1,t3,k0): lambda_gas_balance_da(ng102,k0,t3)
   + mu_gsinMax(gs1,t3,k0) + lambda_gstor_def(gs1,k0,t3)
   - muLB_gsin(gs1,t3,k0) = -2.1
 dLag/gsout(gs1,t3,k0): - lambda_gas_balance_da(ng102,k0,t3)
   + mu_gsoutMax(gs1,t3,k0) - lambda_gstor_def(gs1,k0,t3)
   - muLB_gsout(gs1,t3,k0) = -2.1
 dLag/gstore(gs1,t3,k0): mu_gstore_max(gs1,t3,k0)
   - mu_gstore_min(gs1,t3,k0) - lambda_gstor_def(gs1,k0,t3)
   + lambda_gstor_def(gs1,k0,t4) - muLB_gstore(gs1,t3,k0) = 0
 dLag/gsin(gs1,t3,k1): lambda_gas_balance_da(ng102,k1,t3)
   + mu_gsinMax(gs1,t3,k1) + lambda_gstor_def(gs1,k1,t3)
   - muLB_gsin(gs1,t3,k1) = 0
 dLag/gsout(gs1,t3,k1): - lambda_gas_balance_da(ng102,k1,t3)
   + mu_gsoutMax(gs1,t3,k1) - lambda_gstor_def(gs1,k1,t3)
   - muLB_gsout(gs1,t3,k1) = 0
 dLag/gstore(gs1,t3,k1): mu_gstore_max(gs1,t3,k1)
   - mu_gstore_min(gs1,t3,k1) - lambda_gstor_def(gs1,k1,t3)
   + lambda_gstor_def(gs1,k1,t4) - muLB_gstore(gs1,t3,k1) = 0
 dLag/gsin(gs1,t3,k2): lambda_gas_balance_da(ng102,k2,t3)
   + mu_gsinMax(gs1,t3,k2) + lambda_gstor_def(gs1,k2,t3)
   - muLB_gsin(gs1,t3,k2) = 0
 dLag/gsout(gs1,t3,k2): - lambda_gas_balance_da(ng102,k2,t3)
   + mu_gsoutMax(gs1,t3,k2) - lambda_gstor_def(gs1,k2,t3)
   - muLB_gsout(gs1,t3,k2) = 0
 dLag/gstore(gs1,t3,k2): mu_gstore_max(gs1,t3,k2)
   - mu_gstore_min(gs1,t3,k2) - lambda_gstor_def(gs1,k2,t3)
   + lambda_gstor_def(gs1,k2,t4) - muLB_gstore(gs1,t3,k2) = 0
 dLag/gsin(gs1,t4,k0): lambda_gas_balance_da(ng102,k0,t4)
   + mu_gsinMax(gs1,t4,k0) + lambda_gstor_def(gs1,k0,t4)
   - muLB_gsin(gs1,t4,k0) = -2.1
 dLag/gsout(gs1,t4,k0): - lambda_gas_balance_da(ng102,k0,t4)
   + mu_gsoutMax(gs1,t4,k0) - lambda_gstor_def(gs1,k0,t4)
   - muLB_gsout(gs1,t4,k0) = -2.1
 dLag/gstore(gs1,t4,k0): mu_gstore_max(gs1,t4,k0)
   - mu_gstore_min(gs1,t4,k0) - lambda_gstor_def(gs1,k0,t4)
   - mu_gs_end(gs1,k0) - muLB_gstore(gs1,t4,k0) = 0
 dLag/gsin(gs1,t4,k1): lambda_gas_balance_da(ng102,k1,t4)
   + mu_gsinMax(gs1,t4,k1) + lambda_gstor_def(gs1,k1,t4)
   - muLB_gsin(gs1,t4,k1) = 0
 dLag/gsout(gs1,t4,k1): - lambda_gas_balance_da(ng102,k1,t4)
   + mu_gsoutMax(gs1,t4,k1) - lambda_gstor_def(gs1,k1,t4)
   - muLB_gsout(gs1,t4,k1) = 0
 dLag/gstore(gs1,t4,k1): mu_gstore_max(gs1,t4,k1)
   - mu_gstore_min(gs1,t4,k1) - lambda_gstor_def(gs1,k1,t4)
   - muLB_gstore(gs1,t4,k1) = 0
 dLag/gsin(gs1,t4,k2): lambda_gas_balance_da(ng102,k2,t4)
   + mu_gsinMax(gs1,t4,k2) + lambda_gstor_def(gs1,k2,t4)
   - muLB_gsin(gs1,t4,k2) = 0
 dLag/gsout(gs1,t4,k2): - lambda_gas_balance_da(ng102,k2,t4)
   + mu_gsoutMax(gs1,t4,k2) - lambda_gstor_def(gs1,k2,t4)
   - muLB_gsout(gs1,t4,k2) = 0
 dLag/gstore(gs1,t4,k2): mu_gstore_max(gs1,t4,k2)
   - mu_gstore_min(gs1,t4,k2) - lambda_gstor_def(gs1,k2,t4)
   - muLB_gstore(gs1,t4,k2) = 0
 dLag/gsin(gs1,t5,k0): - muLB_gsin(gs1,t5,k0) = 0
 dLag/gsout(gs1,t5,k0): - muLB_gsout(gs1,t5,k0) = 0
 dLag/gstore(gs1,t5,k0): - muLB_gstore(gs1,t5,k0) = 0
 dLag/gsin(gs1,t5,k1): - muLB_gsin(gs1,t5,k1) = 0
 dLag/gsout(gs1,t5,k1): - muLB_gsout(gs1,t5,k1) = 0
 dLag/gstore(gs1,t5,k1): - muLB_gstore(gs1,t5,k1) = 0
 dLag/gsin(gs1,t5,k2): - muLB_gsin(gs1,t5,k2) = 0
 dLag/gsout(gs1,t5,k2): - muLB_gsout(gs1,t5,k2) = 0
 dLag/gstore(gs1,t5,k2): - muLB_gstore(gs1,t5,k2) = 0
 dLag/gsin(gs1,t6,k0): - muLB_gsin(gs1,t6,k0) = 0
 dLag/gsout(gs1,t6,k0): - muLB_gsout(gs1,t6,k0) = 0
 dLag/gstore(gs1,t6,k0): - muLB_gstore(gs1,t6,k0) = 0
 dLag/gsin(gs1,t6,k1): - muLB_gsin(gs1,t6,k1) = 0
 dLag/gsout(gs1,t6,k1): - muLB_gsout(gs1,t6,k1) = 0
 dLag/gstore(gs1,t6,k1): - muLB_gstore(gs1,t6,k1) = 0
 dLag/gsin(gs1,t6,k2): - muLB_gsin(gs1,t6,k2) = 0
 dLag/gsout(gs1,t6,k2): - muLB_gsout(gs1,t6,k2) = 0
 dLag/gstore(gs1,t6,k2): - muLB_gstore(gs1,t6,k2) = 0
 dLag/gsin(gs1,t7,k0): - muLB_gsin(gs1,t7,k0) = 0
 dLag/gsout(gs1,t7,k0): - muLB_gsout(gs1,t7,k0) = 0
 dLag/gstore(gs1,t7,k0): - muLB_gstore(gs1,t7,k0) = 0
 dLag/gsin(gs1,t7,k1): - muLB_gsin(gs1,t7,k1) = 0
 dLag/gsout(gs1,t7,k1): - muLB_gsout(gs1,t7,k1) = 0
 dLag/gstore(gs1,t7,k1): - muLB_gstore(gs1,t7,k1) = 0
 dLag/gsin(gs1,t7,k2): - muLB_gsin(gs1,t7,k2) = 0
 dLag/gsout(gs1,t7,k2): - muLB_gsout(gs1,t7,k2) = 0
 dLag/gstore(gs1,t7,k2): - muLB_gstore(gs1,t7,k2) = 0
 dLag/gsin(gs1,t8,k0): - muLB_gsin(gs1,t8,k0) = 0
 dLag/gsout(gs1,t8,k0): - muLB_gsout(gs1,t8,k0) = 0
 dLag/gstore(gs1,t8,k0): - muLB_gstore(gs1,t8,k0) = 0
 dLag/gsin(gs1,t8,k1): - muLB_gsin(gs1,t8,k1) = 0
 dLag/gsout(gs1,t8,k1): - muLB_gsout(gs1,t8,k1) = 0
 dLag/gstore(gs1,t8,k1): - muLB_gstore(gs1,t8,k1) = 0
 dLag/gsin(gs1,t8,k2): - muLB_gsin(gs1,t8,k2) = 0
 dLag/gsout(gs1,t8,k2): - muLB_gsout(gs1,t8,k2) = 0
 dLag/gstore(gs1,t8,k2): - muLB_gstore(gs1,t8,k2) = 0
 dLag/gsin(gs1,t9,k0): - muLB_gsin(gs1,t9,k0) = 0
 dLag/gsout(gs1,t9,k0): - muLB_gsout(gs1,t9,k0) = 0
 dLag/gstore(gs1,t9,k0): - muLB_gstore(gs1,t9,k0) = 0
 dLag/gsin(gs1,t9,k1): - muLB_gsin(gs1,t9,k1) = 0
 dLag/gsout(gs1,t9,k1): - muLB_gsout(gs1,t9,k1) = 0
 dLag/gstore(gs1,t9,k1): - muLB_gstore(gs1,t9,k1) = 0
 dLag/gsin(gs1,t9,k2): - muLB_gsin(gs1,t9,k2) = 0
 dLag/gsout(gs1,t9,k2): - muLB_gsout(gs1,t9,k2) = 0
 dLag/gstore(gs1,t9,k2): - muLB_gstore(gs1,t9,k2) = 0
 dLag/gsin(gs1,t10,k0): - muLB_gsin(gs1,t10,k0) = 0
 dLag/gsout(gs1,t10,k0): - muLB_gsout(gs1,t10,k0) = 0
 dLag/gstore(gs1,t10,k0): - muLB_gstore(gs1,t10,k0) = 0
 dLag/gsin(gs1,t10,k1): - muLB_gsin(gs1,t10,k1) = 0
 dLag/gsout(gs1,t10,k1): - muLB_gsout(gs1,t10,k1) = 0
 dLag/gstore(gs1,t10,k1): - muLB_gstore(gs1,t10,k1) = 0
 dLag/gsin(gs1,t10,k2): - muLB_gsin(gs1,t10,k2) = 0
 dLag/gsout(gs1,t10,k2): - muLB_gsout(gs1,t10,k2) = 0
 dLag/gstore(gs1,t10,k2): - muLB_gstore(gs1,t10,k2) = 0
 dLag/gsin(gs1,t11,k0): - muLB_gsin(gs1,t11,k0) = 0
 dLag/gsout(gs1,t11,k0): - muLB_gsout(gs1,t11,k0) = 0
 dLag/gstore(gs1,t11,k0): - muLB_gstore(gs1,t11,k0) = 0
 dLag/gsin(gs1,t11,k1): - muLB_gsin(gs1,t11,k1) = 0
 dLag/gsout(gs1,t11,k1): - muLB_gsout(gs1,t11,k1) = 0
 dLag/gstore(gs1,t11,k1): - muLB_gstore(gs1,t11,k1) = 0
 dLag/gsin(gs1,t11,k2): - muLB_gsin(gs1,t11,k2) = 0
 dLag/gsout(gs1,t11,k2): - muLB_gsout(gs1,t11,k2) = 0
 dLag/gstore(gs1,t11,k2): - muLB_gstore(gs1,t11,k2) = 0
 dLag/gsin(gs1,t12,k0): - muLB_gsin(gs1,t12,k0) = 0
 dLag/gsout(gs1,t12,k0): - muLB_gsout(gs1,t12,k0) = 0
 dLag/gstore(gs1,t12,k0): - muLB_gstore(gs1,t12,k0) = 0
 dLag/gsin(gs1,t12,k1): - muLB_gsin(gs1,t12,k1) = 0
 dLag/gsout(gs1,t12,k1): - muLB_gsout(gs1,t12,k1) = 0
 dLag/gstore(gs1,t12,k1): - muLB_gstore(gs1,t12,k1) = 0
 dLag/gsin(gs1,t12,k2): - muLB_gsin(gs1,t12,k2) = 0
 dLag/gsout(gs1,t12,k2): - muLB_gsout(gs1,t12,k2) = 0
 dLag/gstore(gs1,t12,k2): - muLB_gstore(gs1,t12,k2) = 0
 dLag/gsin(gs1,t13,k0): - muLB_gsin(gs1,t13,k0) = 0
 dLag/gsout(gs1,t13,k0): - muLB_gsout(gs1,t13,k0) = 0
 dLag/gstore(gs1,t13,k0): - muLB_gstore(gs1,t13,k0) = 0
 dLag/gsin(gs1,t13,k1): - muLB_gsin(gs1,t13,k1) = 0
 dLag/gsout(gs1,t13,k1): - muLB_gsout(gs1,t13,k1) = 0
 dLag/gstore(gs1,t13,k1): - muLB_gstore(gs1,t13,k1) = 0
 dLag/gsin(gs1,t13,k2): - muLB_gsin(gs1,t13,k2) = 0
 dLag/gsout(gs1,t13,k2): - muLB_gsout(gs1,t13,k2) = 0
 dLag/gstore(gs1,t13,k2): - muLB_gstore(gs1,t13,k2) = 0
 dLag/gsin(gs1,t14,k0): - muLB_gsin(gs1,t14,k0) = 0
 dLag/gsout(gs1,t14,k0): - muLB_gsout(gs1,t14,k0) = 0
 dLag/gstore(gs1,t14,k0): - muLB_gstore(gs1,t14,k0) = 0
 dLag/gsin(gs1,t14,k1): - muLB_gsin(gs1,t14,k1) = 0
 dLag/gsout(gs1,t14,k1): - muLB_gsout(gs1,t14,k1) = 0
 dLag/gstore(gs1,t14,k1): - muLB_gstore(gs1,t14,k1) = 0
 dLag/gsin(gs1,t14,k2): - muLB_gsin(gs1,t14,k2) = 0
 dLag/gsout(gs1,t14,k2): - muLB_gsout(gs1,t14,k2) = 0
 dLag/gstore(gs1,t14,k2): - muLB_gstore(gs1,t14,k2) = 0
 dLag/gsin(gs1,t15,k0): - muLB_gsin(gs1,t15,k0) = 0
 dLag/gsout(gs1,t15,k0): - muLB_gsout(gs1,t15,k0) = 0
 dLag/gstore(gs1,t15,k0): - muLB_gstore(gs1,t15,k0) = 0
 dLag/gsin(gs1,t15,k1): - muLB_gsin(gs1,t15,k1) = 0
 dLag/gsout(gs1,t15,k1): - muLB_gsout(gs1,t15,k1) = 0
 dLag/gstore(gs1,t15,k1): - muLB_gstore(gs1,t15,k1) = 0
 dLag/gsin(gs1,t15,k2): - muLB_gsin(gs1,t15,k2) = 0
 dLag/gsout(gs1,t15,k2): - muLB_gsout(gs1,t15,k2) = 0
 dLag/gstore(gs1,t15,k2): - muLB_gstore(gs1,t15,k2) = 0
 dLag/gsin(gs1,t16,k0): - muLB_gsin(gs1,t16,k0) = 0
 dLag/gsout(gs1,t16,k0): - muLB_gsout(gs1,t16,k0) = 0
 dLag/gstore(gs1,t16,k0): - muLB_gstore(gs1,t16,k0) = 0
 dLag/gsin(gs1,t16,k1): - muLB_gsin(gs1,t16,k1) = 0
 dLag/gsout(gs1,t16,k1): - muLB_gsout(gs1,t16,k1) = 0
 dLag/gstore(gs1,t16,k1): - muLB_gstore(gs1,t16,k1) = 0
 dLag/gsin(gs1,t16,k2): - muLB_gsin(gs1,t16,k2) = 0
 dLag/gsout(gs1,t16,k2): - muLB_gsout(gs1,t16,k2) = 0
 dLag/gstore(gs1,t16,k2): - muLB_gstore(gs1,t16,k2) = 0
 dLag/gsin(gs1,t17,k0): - muLB_gsin(gs1,t17,k0) = 0
 dLag/gsout(gs1,t17,k0): - muLB_gsout(gs1,t17,k0) = 0
 dLag/gstore(gs1,t17,k0): - muLB_gstore(gs1,t17,k0) = 0
 dLag/gsin(gs1,t17,k1): - muLB_gsin(gs1,t17,k1) = 0
 dLag/gsout(gs1,t17,k1): - muLB_gsout(gs1,t17,k1) = 0
 dLag/gstore(gs1,t17,k1): - muLB_gstore(gs1,t17,k1) = 0
 dLag/gsin(gs1,t17,k2): - muLB_gsin(gs1,t17,k2) = 0
 dLag/gsout(gs1,t17,k2): - muLB_gsout(gs1,t17,k2) = 0
 dLag/gstore(gs1,t17,k2): - muLB_gstore(gs1,t17,k2) = 0
 dLag/gsin(gs1,t18,k0): - muLB_gsin(gs1,t18,k0) = 0
 dLag/gsout(gs1,t18,k0): - muLB_gsout(gs1,t18,k0) = 0
 dLag/gstore(gs1,t18,k0): - muLB_gstore(gs1,t18,k0) = 0
 dLag/gsin(gs1,t18,k1): - muLB_gsin(gs1,t18,k1) = 0
 dLag/gsout(gs1,t18,k1): - muLB_gsout(gs1,t18,k1) = 0
 dLag/gstore(gs1,t18,k1): - muLB_gstore(gs1,t18,k1) = 0
 dLag/gsin(gs1,t18,k2): - muLB_gsin(gs1,t18,k2) = 0
 dLag/gsout(gs1,t18,k2): - muLB_gsout(gs1,t18,k2) = 0
 dLag/gstore(gs1,t18,k2): - muLB_gstore(gs1,t18,k2) = 0
 dLag/gsin(gs1,t19,k0): - muLB_gsin(gs1,t19,k0) = 0
 dLag/gsout(gs1,t19,k0): - muLB_gsout(gs1,t19,k0) = 0
 dLag/gstore(gs1,t19,k0): - muLB_gstore(gs1,t19,k0) = 0
 dLag/gsin(gs1,t19,k1): - muLB_gsin(gs1,t19,k1) = 0
 dLag/gsout(gs1,t19,k1): - muLB_gsout(gs1,t19,k1) = 0
 dLag/gstore(gs1,t19,k1): - muLB_gstore(gs1,t19,k1) = 0
 dLag/gsin(gs1,t19,k2): - muLB_gsin(gs1,t19,k2) = 0
 dLag/gsout(gs1,t19,k2): - muLB_gsout(gs1,t19,k2) = 0
 dLag/gstore(gs1,t19,k2): - muLB_gstore(gs1,t19,k2) = 0
 dLag/gsin(gs1,t20,k0): - muLB_gsin(gs1,t20,k0) = 0
 dLag/gsout(gs1,t20,k0): - muLB_gsout(gs1,t20,k0) = 0
 dLag/gstore(gs1,t20,k0): - muLB_gstore(gs1,t20,k0) = 0
 dLag/gsin(gs1,t20,k1): - muLB_gsin(gs1,t20,k1) = 0
 dLag/gsout(gs1,t20,k1): - muLB_gsout(gs1,t20,k1) = 0
 dLag/gstore(gs1,t20,k1): - muLB_gstore(gs1,t20,k1) = 0
 dLag/gsin(gs1,t20,k2): - muLB_gsin(gs1,t20,k2) = 0
 dLag/gsout(gs1,t20,k2): - muLB_gsout(gs1,t20,k2) = 0
 dLag/gstore(gs1,t20,k2): - muLB_gstore(gs1,t20,k2) = 0
 dLag/gsin(gs1,t21,k0): - muLB_gsin(gs1,t21,k0) = 0
 dLag/gsout(gs1,t21,k0): - muLB_gsout(gs1,t21,k0) = 0
 dLag/gstore(gs1,t21,k0): - muLB_gstore(gs1,t21,k0) = 0
 dLag/gsin(gs1,t21,k1): - muLB_gsin(gs1,t21,k1) = 0
 dLag/gsout(gs1,t21,k1): - muLB_gsout(gs1,t21,k1) = 0
 dLag/gstore(gs1,t21,k1): - muLB_gstore(gs1,t21,k1) = 0
 dLag/gsin(gs1,t21,k2): - muLB_gsin(gs1,t21,k2) = 0
 dLag/gsout(gs1,t21,k2): - muLB_gsout(gs1,t21,k2) = 0
 dLag/gstore(gs1,t21,k2): - muLB_gstore(gs1,t21,k2) = 0
 dLag/gsin(gs1,t22,k0): - muLB_gsin(gs1,t22,k0) = 0
 dLag/gsout(gs1,t22,k0): - muLB_gsout(gs1,t22,k0) = 0
 dLag/gstore(gs1,t22,k0): - muLB_gstore(gs1,t22,k0) = 0
 dLag/gsin(gs1,t22,k1): - muLB_gsin(gs1,t22,k1) = 0
 dLag/gsout(gs1,t22,k1): - muLB_gsout(gs1,t22,k1) = 0
 dLag/gstore(gs1,t22,k1): - muLB_gstore(gs1,t22,k1) = 0
 dLag/gsin(gs1,t22,k2): - muLB_gsin(gs1,t22,k2) = 0
 dLag/gsout(gs1,t22,k2): - muLB_gsout(gs1,t22,k2) = 0
 dLag/gstore(gs1,t22,k2): - muLB_gstore(gs1,t22,k2) = 0
 dLag/gsin(gs1,t23,k0): - muLB_gsin(gs1,t23,k0) = 0
 dLag/gsout(gs1,t23,k0): - muLB_gsout(gs1,t23,k0) = 0
 dLag/gstore(gs1,t23,k0): - muLB_gstore(gs1,t23,k0) = 0
 dLag/gsin(gs1,t23,k1): - muLB_gsin(gs1,t23,k1) = 0
 dLag/gsout(gs1,t23,k1): - muLB_gsout(gs1,t23,k1) = 0
 dLag/gstore(gs1,t23,k1): - muLB_gstore(gs1,t23,k1) = 0
 dLag/gsin(gs1,t23,k2): - muLB_gsin(gs1,t23,k2) = 0
 dLag/gsout(gs1,t23,k2): - muLB_gsout(gs1,t23,k2) = 0
 dLag/gstore(gs1,t23,k2): - muLB_gstore(gs1,t23,k2) = 0
 dLag/gsin(gs1,t24,k0): - muLB_gsin(gs1,t24,k0) = 0
 dLag/gsout(gs1,t24,k0): - muLB_gsout(gs1,t24,k0) = 0
 dLag/gstore(gs1,t24,k0): - muLB_gstore(gs1,t24,k0) = 0
 dLag/gsin(gs1,t24,k1): - muLB_gsin(gs1,t24,k1) = 0
 dLag/gsout(gs1,t24,k1): - muLB_gsout(gs1,t24,k1) = 0
 dLag/gstore(gs1,t24,k1): - muLB_gstore(gs1,t24,k1) = 0
 dLag/gsin(gs1,t24,k2): - muLB_gsin(gs1,t24,k2) = 0
 dLag/gsout(gs1,t24,k2): - muLB_gsout(gs1,t24,k2) = 0
 dLag/gstore(gs1,t24,k2): - muLB_gstore(gs1,t24,k2) = 0
Bounds
 lambda_gas_balance_da(ng101,k0,t1) free
 lambda_gas_balance_da(ng101,k1,t1) free
 lambda_gas_balance_da(ng101,k2,t1) free
 lambda_gas_balance_da(ng102,k0,t1) free
 lambda_gas_balance_da(ng102,k1,t1) free
 lambda_gas_balance_da(ng102,k2,t1) free
 lambda_gas_balance_da(ng101,k0,t2) free
 lambda_gas_balance_da(ng101,k1,t2) free
 lambda_gas_balance_da(ng101,k2,t2) free
 lambda_gas_balance_da(ng102,k0,t2) free
 lambda_gas_balance_da(ng102,k1,t2) free
 lambda_gas_balance_da(ng102,k2,t2) free
 lambda_gas_balance_da(ng101,k0,t3) free
 lambda_gas_balance_da(ng101,k1,t3) free
 lambda_gas_balance_da(ng101,k2,t3) free
 lambda_gas_balance_da(ng102,k0,t3) free
 lambda_gas_balance_da(ng102,k1,t3) free
 lambda_gas_balance_da(ng102,k2,t3) free
 lambda_gas_balance_da(ng101,k0,t4) free
 lambda_gas_balance_da(ng101,k1,t4) free
 lambda_gas_balance_da(ng101,k2,t4) free
 lambda_gas_balance_da(ng102,k0,t4) free
 lambda_gas_balance_da(ng102,k1,t4) free
 lambda_gas_balance_da(ng102,k2,t4) free
 lambda_gflow_sr_io(('ng101','ng102'),k0,t1) free
 lambda_Flow_Bal(('ng101','ng102'),k0,t1) free
 lambda_gflow_sr_io(('ng101','ng102'),k1,t1) free
 lambda_Flow_Bal(('ng101','ng102'),k1,t1) free
 lambda_gflow_sr_io(('ng101','ng102'),k2,t1) free
 lambda_Flow_Bal(('ng101','ng102'),k2,t1) free
 lambda_gflow_sr_io(('ng101','ng102'),k0,t2) free
 lambda_Flow_Bal(('ng101','ng102'),k0,t2) free
 lambda_gflow_sr_io(('ng101','ng102'),k1,t2) free
 lambda_Flow_Bal(('ng101','ng102'),k1,t2) free
 lambda_gflow_sr_io(('ng101','ng102'),k2,t2) free
 lambda_Flow_Bal(('ng101','ng102'),k2,t2) free
 lambda_gflow_sr_io(('ng101','ng102'),k0,t3) free
 lambda_Flow_Bal(('ng101','ng102'),k0,t3) free
 lambda_gflow_sr_io(('ng101','ng102'),k1,t3) free
 lambda_Flow_Bal(('ng101','ng102'),k1,t3) free
 lambda_gflow_sr_io(('ng101','ng102'),k2,t3) free
 lambda_Flow_Bal(('ng101','ng102'),k2,t3) free
 lambda_gflow_sr_io(('ng101','ng102'),k0,t4) free
 lambda_Flow_Bal(('ng101','ng102'),k0,t4) free
 lambda_gflow_sr_io(('ng101','ng102'),k1,t4) free
 lambda_Flow_Bal(('ng101','ng102'),k1,t4) free
 lambda_gflow_sr_io(('ng101','ng102'),k2,t4) free
 lambda_Flow_Bal(('ng101','ng102'),k2,t4) free
 lambda_gstor_def(gs1,k0,t2) free
 lambda_gstor_def(gs1,k0,t3) free
 lambda_gstor_def(gs1,k0,t4) free
 lambda_gstor_def(gs1,k0,t1) free
 lambda_gstor_def(gs1,k1,t2) free
 lambda_gstor_def(gs1,k1,t3) free
 lambda_gstor_def(gs1,k1,t4) free
 lambda_gstor_def(gs1,k1,t1) free
 lambda_gstor_def(gs1,k2,t2) free
 lambda_gstor_def(gs1,k2,t3) free
 lambda_gstor_def(gs1,k2,t4) free
 lambda_gstor_def(gs1,k2,t1) free
SOS
 s0:  S1 :: mu_gshed_da_max(ng101,k0,t1):1 SOS1_gshed_da_max(ng101,k0,t1):2
 s1:  S1 :: mu_gshed_da_max(ng101,k1,t1):1 SOS1_gshed_da_max(ng101,k1,t1):2
 s2:  S1 :: mu_gshed_da_max(ng101,k2,t1):1 SOS1_gshed_da_max(ng101,k2,t1):2
 s3:  S1 :: mu_gshed_da_max(ng101,k0,t2):1 SOS1_gshed_da_max(ng101,k0,t2):2
 s4:  S1 :: mu_gshed_da_max(ng101,k1,t2):1 SOS1_gshed_da_max(ng101,k1,t2):2
 s5:  S1 :: mu_gshed_da_max(ng101,k2,t2):1 SOS1_gshed_da_max(ng101,k2,t2):2
 s6:  S1 :: mu_gshed_da_max(ng101,k0,t3):1 SOS1_gshed_da_max(ng101,k0,t3):2
 s7:  S1 :: mu_gshed_da_max(ng101,k1,t3):1 SOS1_gshed_da_max(ng101,k1,t3):2
 s8:  S1 :: mu_gshed_da_max(ng101,k2,t3):1 SOS1_gshed_da_max(ng101,k2,t3):2
 s9:  S1 :: mu_gshed_da_max(ng101,k0,t4):1 SOS1_gshed_da_max(ng101,k0,t4):2
 s10:  S1 :: mu_gshed_da_max(ng101,k1,t4):1
     SOS1_gshed_da_max(ng101,k1,t4):2
 s11:  S1 :: mu_gshed_da_max(ng101,k2,t4):1
     SOS1_gshed_da_max(ng101,k2,t4):2
 s12:  S1 :: mu_gshed_da_max(ng102,k0,t1):1
     SOS1_gshed_da_max(ng102,k0,t1):2
 s13:  S1 :: mu_gshed_da_max(ng102,k1,t1):1
     SOS1_gshed_da_max(ng102,k1,t1):2
 s14:  S1 :: mu_gshed_da_max(ng102,k2,t1):1
     SOS1_gshed_da_max(ng102,k2,t1):2
 s15:  S1 :: mu_gshed_da_max(ng102,k0,t2):1
     SOS1_gshed_da_max(ng102,k0,t2):2
 s16:  S1 :: mu_gshed_da_max(ng102,k1,t2):1
     SOS1_gshed_da_max(ng102,k1,t2):2
 s17:  S1 :: mu_gshed_da_max(ng102,k2,t2):1
     SOS1_gshed_da_max(ng102,k2,t2):2
 s18:  S1 :: mu_gshed_da_max(ng102,k0,t3):1
     SOS1_gshed_da_max(ng102,k0,t3):2
 s19:  S1 :: mu_gshed_da_max(ng102,k1,t3):1
     SOS1_gshed_da_max(ng102,k1,t3):2
 s20:  S1 :: mu_gshed_da_max(ng102,k2,t3):1
     SOS1_gshed_da_max(ng102,k2,t3):2
 s21:  S1 :: mu_gshed_da_max(ng102,k0,t4):1
     SOS1_gshed_da_max(ng102,k0,t4):2
 s22:  S1 :: mu_gshed_da_max(ng102,k1,t4):1
     SOS1_gshed_da_max(ng102,k1,t4):2
 s23:  S1 :: mu_gshed_da_max(ng102,k2,t4):1
     SOS1_gshed_da_max(ng102,k2,t4):2
 s24:  S1 :: mu_gprod_max(gw1,k0,t1):1 SOS1_gprod_max(gw1,k0,t1):2
 s25:  S1 :: mu_gprod_max(gw1,k0,t2):1 SOS1_gprod_max(gw1,k0,t2):2
 s26:  S1 :: mu_gprod_max(gw1,k0,t3):1 SOS1_gprod_max(gw1,k0,t3):2
 s27:  S1 :: mu_gprod_max(gw1,k0,t4):1 SOS1_gprod_max(gw1,k0,t4):2
 s28:  S1 :: mu_gprod_max(gw1,k1,t1):1 SOS1_gprod_max(gw1,k1,t1):2
 s29:  S1 :: mu_gprod_max(gw1,k1,t2):1 SOS1_gprod_max(gw1,k1,t2):2
 s30:  S1 :: mu_gprod_max(gw1,k1,t3):1 SOS1_gprod_max(gw1,k1,t3):2
 s31:  S1 :: mu_gprod_max(gw1,k1,t4):1 SOS1_gprod_max(gw1,k1,t4):2
 s32:  S1 :: mu_gprod_max(gw1,k2,t1):1 SOS1_gprod_max(gw1,k2,t1):2
 s33:  S1 :: mu_gprod_max(gw1,k2,t2):1 SOS1_gprod_max(gw1,k2,t2):2
 s34:  S1 :: mu_gprod_max(gw1,k2,t3):1 SOS1_gprod_max(gw1,k2,t3):2
 s35:  S1 :: mu_gprod_max(gw1,k2,t4):1 SOS1_gprod_max(gw1,k2,t4):2
 s36:  S1 :: mu_gprod_max(gw2,k0,t1):1 SOS1_gprod_max(gw2,k0,t1):2
 s37:  S1 :: mu_gprod_max(gw2,k0,t2):1 SOS1_gprod_max(gw2,k0,t2):2
 s38:  S1 :: mu_gprod_max(gw2,k0,t3):1 SOS1_gprod_max(gw2,k0,t3):2
 s39:  S1 :: mu_gprod_max(gw2,k0,t4):1 SOS1_gprod_max(gw2,k0,t4):2
 s40:  S1 :: mu_gprod_max(gw2,k1,t1):1 SOS1_gprod_max(gw2,k1,t1):2
 s41:  S1 :: mu_gprod_max(gw2,k1,t2):1 SOS1_gprod_max(gw2,k1,t2):2
 s42:  S1 :: mu_gprod_max(gw2,k1,t3):1 SOS1_gprod_max(gw2,k1,t3):2
 s43:  S1 :: mu_gprod_max(gw2,k1,t4):1 SOS1_gprod_max(gw2,k1,t4):2
 s44:  S1 :: mu_gprod_max(gw2,k2,t1):1 SOS1_gprod_max(gw2,k2,t1):2
 s45:  S1 :: mu_gprod_max(gw2,k2,t2):1 SOS1_gprod_max(gw2,k2,t2):2
 s46:  S1 :: mu_gprod_max(gw2,k2,t3):1 SOS1_gprod_max(gw2,k2,t3):2
 s47:  S1 :: mu_gprod_max(gw2,k2,t4):1 SOS1_gprod_max(gw2,k2,t4):2
 s48:  S1 :: mu_gprod_max(gw3,k0,t1):1 SOS1_gprod_max(gw3,k0,t1):2
 s49:  S1 :: mu_gprod_max(gw3,k0,t2):1 SOS1_gprod_max(gw3,k0,t2):2
 s50:  S1 :: mu_gprod_max(gw3,k0,t3):1 SOS1_gprod_max(gw3,k0,t3):2
 s51:  S1 :: mu_gprod_max(gw3,k0,t4):1 SOS1_gprod_max(gw3,k0,t4):2
 s52:  S1 :: mu_gprod_max(gw3,k1,t1):1 SOS1_gprod_max(gw3,k1,t1):2
 s53:  S1 :: mu_gprod_max(gw3,k1,t2):1 SOS1_gprod_max(gw3,k1,t2):2
 s54:  S1 :: mu_gprod_max(gw3,k1,t3):1 SOS1_gprod_max(gw3,k1,t3):2
 s55:  S1 :: mu_gprod_max(gw3,k1,t4):1 SOS1_gprod_max(gw3,k1,t4):2
 s56:  S1 :: mu_gprod_max(gw3,k2,t1):1 SOS1_gprod_max(gw3,k2,t1):2
 s57:  S1 :: mu_gprod_max(gw3,k2,t2):1 SOS1_gprod_max(gw3,k2,t2):2
 s58:  S1 :: mu_gprod_max(gw3,k2,t3):1 SOS1_gprod_max(gw3,k2,t3):2
 s59:  S1 :: mu_gprod_max(gw3,k2,t4):1 SOS1_gprod_max(gw3,k2,t4):2
 s60:  S1 :: mu_gflow_sr_limit(('ng101','ng102'),k0,t1):1
     SOS1_gflow_sr_limit(('ng101','ng102'),k0,t1):2
 s61:  S1 :: mu_gflow_sr_limit(('ng101','ng102'),k1,t1):1
     SOS1_gflow_sr_limit(('ng101','ng102'),k1,t1):2
 s62:  S1 :: mu_gflow_sr_limit(('ng101','ng102'),k2,t1):1
     SOS1_gflow_sr_limit(('ng101','ng102'),k2,t1):2
 s63:  S1 :: mu_gflow_sr_limit(('ng101','ng102'),k0,t2):1
     SOS1_gflow_sr_limit(('ng101','ng102'),k0,t2):2
 s64:  S1 :: mu_gflow_sr_limit(('ng101','ng102'),k1,t2):1
     SOS1_gflow_sr_limit(('ng101','ng102'),k1,t2):2
 s65:  S1 :: mu_gflow_sr_limit(('ng101','ng102'),k2,t2):1
     SOS1_gflow_sr_limit(('ng101','ng102'),k2,t2):2
 s66:  S1 :: mu_gflow_sr_limit(('ng101','ng102'),k0,t3):1
     SOS1_gflow_sr_limit(('ng101','ng102'),k0,t3):2
 s67:  S1 :: mu_gflow_sr_limit(('ng101','ng102'),k1,t3):1
     SOS1_gflow_sr_limit(('ng101','ng102'),k1,t3):2
 s68:  S1 :: mu_gflow_sr_limit(('ng101','ng102'),k2,t3):1
     SOS1_gflow_sr_limit(('ng101','ng102'),k2,t3):2
 s69:  S1 :: mu_gflow_sr_limit(('ng101','ng102'),k0,t4):1
     SOS1_gflow_sr_limit(('ng101','ng102'),k0,t4):2
 s70:  S1 :: mu_gflow_sr_limit(('ng101','ng102'),k1,t4):1
     SOS1_gflow_sr_limit(('ng101','ng102'),k1,t4):2
 s71:  S1 :: mu_gflow_sr_limit(('ng101','ng102'),k2,t4):1
     SOS1_gflow_sr_limit(('ng101','ng102'),k2,t4):2
 s72:  S1 :: mu_gsinMax(gs1,t1,k0):1 SOS1_gsinMax(gs1,t1,k0):2
 s73:  S1 :: mu_gsoutMax(gs1,t1,k0):1 SOS1_gsoutMax(gs1,t1,k0):2
 s74:  S1 :: mu_gstore_max(gs1,t1,k0):1 SOS1_gstore_max(gs1,t1,k0):2
 s75:  S1 :: mu_gstore_min(gs1,t1,k0):1 SOS1_gstore_min(gs1,t1,k0):2
 s76:  S1 :: mu_gsinMax(gs1,t2,k0):1 SOS1_gsinMax(gs1,t2,k0):2
 s77:  S1 :: mu_gsoutMax(gs1,t2,k0):1 SOS1_gsoutMax(gs1,t2,k0):2
 s78:  S1 :: mu_gstore_max(gs1,t2,k0):1 SOS1_gstore_max(gs1,t2,k0):2
 s79:  S1 :: mu_gstore_min(gs1,t2,k0):1 SOS1_gstore_min(gs1,t2,k0):2
 s80:  S1 :: mu_gsinMax(gs1,t3,k0):1 SOS1_gsinMax(gs1,t3,k0):2
 s81:  S1 :: mu_gsoutMax(gs1,t3,k0):1 SOS1_gsoutMax(gs1,t3,k0):2
 s82:  S1 :: mu_gstore_max(gs1,t3,k0):1 SOS1_gstore_max(gs1,t3,k0):2
 s83:  S1 :: mu_gstore_min(gs1,t3,k0):1 SOS1_gstore_min(gs1,t3,k0):2
 s84:  S1 :: mu_gsinMax(gs1,t4,k0):1 SOS1_gsinMax(gs1,t4,k0):2
 s85:  S1 :: mu_gsoutMax(gs1,t4,k0):1 SOS1_gsoutMax(gs1,t4,k0):2
 s86:  S1 :: mu_gstore_max(gs1,t4,k0):1 SOS1_gstore_max(gs1,t4,k0):2
 s87:  S1 :: mu_gstore_min(gs1,t4,k0):1 SOS1_gstore_min(gs1,t4,k0):2
 s88:  S1 :: mu_gsinMax(gs1,t1,k1):1 SOS1_gsinMax(gs1,t1,k1):2
 s89:  S1 :: mu_gsoutMax(gs1,t1,k1):1 SOS1_gsoutMax(gs1,t1,k1):2
 s90:  S1 :: mu_gstore_max(gs1,t1,k1):1 SOS1_gstore_max(gs1,t1,k1):2
 s91:  S1 :: mu_gstore_min(gs1,t1,k1):1 SOS1_gstore_min(gs1,t1,k1):2
 s92:  S1 :: mu_gsinMax(gs1,t2,k1):1 SOS1_gsinMax(gs1,t2,k1):2
 s93:  S1 :: mu_gsoutMax(gs1,t2,k1):1 SOS1_gsoutMax(gs1,t2,k1):2
 s94:  S1 :: mu_gstore_max(gs1,t2,k1):1 SOS1_gstore_max(gs1,t2,k1):2
 s95:  S1 :: mu_gstore_min(gs1,t2,k1):1 SOS1_gstore_min(gs1,t2,k1):2
 s96:  S1 :: mu_gsinMax(gs1,t3,k1):1 SOS1_gsinMax(gs1,t3,k1):2
 s97:  S1 :: mu_gsoutMax(gs1,t3,k1):1 SOS1_gsoutMax(gs1,t3,k1):2
 s98:  S1 :: mu_gstore_max(gs1,t3,k1):1 SOS1_gstore_max(gs1,t3,k1):2
 s99:  S1 :: mu_gstore_min(gs1,t3,k1):1 SOS1_gstore_min(gs1,t3,k1):2
 s100:  S1 :: mu_gsinMax(gs1,t4,k1):1 SOS1_gsinMax(gs1,t4,k1):2
 s101:  S1 :: mu_gsoutMax(gs1,t4,k1):1 SOS1_gsoutMax(gs1,t4,k1):2
 s102:  S1 :: mu_gstore_max(gs1,t4,k1):1 SOS1_gstore_max(gs1,t4,k1):2
 s103:  S1 :: mu_gstore_min(gs1,t4,k1):1 SOS1_gstore_min(gs1,t4,k1):2
 s104:  S1 :: mu_gsinMax(gs1,t1,k2):1 SOS1_gsinMax(gs1,t1,k2):2
 s105:  S1 :: mu_gsoutMax(gs1,t1,k2):1 SOS1_gsoutMax(gs1,t1,k2):2
 s106:  S1 :: mu_gstore_max(gs1,t1,k2):1 SOS1_gstore_max(gs1,t1,k2):2
 s107:  S1 :: mu_gstore_min(gs1,t1,k2):1 SOS1_gstore_min(gs1,t1,k2):2
 s108:  S1 :: mu_gsinMax(gs1,t2,k2):1 SOS1_gsinMax(gs1,t2,k2):2
 s109:  S1 :: mu_gsoutMax(gs1,t2,k2):1 SOS1_gsoutMax(gs1,t2,k2):2
 s110:  S1 :: mu_gstore_max(gs1,t2,k2):1 SOS1_gstore_max(gs1,t2,k2):2
 s111:  S1 :: mu_gstore_min(gs1,t2,k2):1 SOS1_gstore_min(gs1,t2,k2):2
 s112:  S1 :: mu_gsinMax(gs1,t3,k2):1 SOS1_gsinMax(gs1,t3,k2):2
 s113:  S1 :: mu_gsoutMax(gs1,t3,k2):1 SOS1_gsoutMax(gs1,t3,k2):2
 s114:  S1 :: mu_gstore_max(gs1,t3,k2):1 SOS1_gstore_max(gs1,t3,k2):2
 s115:  S1 :: mu_gstore_min(gs1,t3,k2):1 SOS1_gstore_min(gs1,t3,k2):2
 s116:  S1 :: mu_gsinMax(gs1,t4,k2):1 SOS1_gsinMax(gs1,t4,k2):2
 s117:  S1 :: mu_gsoutMax(gs1,t4,k2):1 SOS1_gsoutMax(gs1,t4,k2):2
 s118:  S1 :: mu_gstore_max(gs1,t4,k2):1 SOS1_gstore_max(gs1,t4,k2):2
 s119:  S1 :: mu_gstore_min(gs1,t4,k2):1 SOS1_gstore_min(gs1,t4,k2):2
 s120:  S1 :: mu_gs_end(gs1,k0):1 SOS1_gs_end(gs1,k0):2
 s121:  S1 :: muLB_gshed_da(ng101,k0,t1):1 SOS1_LB_gshed_da(ng101,k0,t1):2
 s122:  S1 :: muLB_gshed_da(ng101,k1,t1):1 SOS1_LB_gshed_da(ng101,k1,t1):2
 s123:  S1 :: muLB_gshed_da(ng101,k2,t1):1 SOS1_LB_gshed_da(ng101,k2,t1):2
 s124:  S1 :: muLB_gshed_da(ng101,k0,t2):1 SOS1_LB_gshed_da(ng101,k0,t2):2
 s125:  S1 :: muLB_gshed_da(ng101,k1,t2):1 SOS1_LB_gshed_da(ng101,k1,t2):2
 s126:  S1 :: muLB_gshed_da(ng101,k2,t2):1 SOS1_LB_gshed_da(ng101,k2,t2):2
 s127:  S1 :: muLB_gshed_da(ng101,k0,t3):1 SOS1_LB_gshed_da(ng101,k0,t3):2
 s128:  S1 :: muLB_gshed_da(ng101,k1,t3):1 SOS1_LB_gshed_da(ng101,k1,t3):2
 s129:  S1 :: muLB_gshed_da(ng101,k2,t3):1 SOS1_LB_gshed_da(ng101,k2,t3):2
 s130:  S1 :: muLB_gshed_da(ng101,k0,t4):1 SOS1_LB_gshed_da(ng101,k0,t4):2
 s131:  S1 :: muLB_gshed_da(ng101,k1,t4):1 SOS1_LB_gshed_da(ng101,k1,t4):2
 s132:  S1 :: muLB_gshed_da(ng101,k2,t4):1 SOS1_LB_gshed_da(ng101,k2,t4):2
 s133:  S1 :: muLB_gshed_da(ng101,k0,t5):1 SOS1_LB_gshed_da(ng101,k0,t5):2
 s134:  S1 :: muLB_gshed_da(ng101,k1,t5):1 SOS1_LB_gshed_da(ng101,k1,t5):2
 s135:  S1 :: muLB_gshed_da(ng101,k2,t5):1 SOS1_LB_gshed_da(ng101,k2,t5):2
 s136:  S1 :: muLB_gshed_da(ng101,k0,t6):1 SOS1_LB_gshed_da(ng101,k0,t6):2
 s137:  S1 :: muLB_gshed_da(ng101,k1,t6):1 SOS1_LB_gshed_da(ng101,k1,t6):2
 s138:  S1 :: muLB_gshed_da(ng101,k2,t6):1 SOS1_LB_gshed_da(ng101,k2,t6):2
 s139:  S1 :: muLB_gshed_da(ng101,k0,t7):1 SOS1_LB_gshed_da(ng101,k0,t7):2
 s140:  S1 :: muLB_gshed_da(ng101,k1,t7):1 SOS1_LB_gshed_da(ng101,k1,t7):2
 s141:  S1 :: muLB_gshed_da(ng101,k2,t7):1 SOS1_LB_gshed_da(ng101,k2,t7):2
 s142:  S1 :: muLB_gshed_da(ng101,k0,t8):1 SOS1_LB_gshed_da(ng101,k0,t8):2
 s143:  S1 :: muLB_gshed_da(ng101,k1,t8):1 SOS1_LB_gshed_da(ng101,k1,t8):2
 s144:  S1 :: muLB_gshed_da(ng101,k2,t8):1 SOS1_LB_gshed_da(ng101,k2,t8):2
 s145:  S1 :: muLB_gshed_da(ng101,k0,t9):1 SOS1_LB_gshed_da(ng101,k0,t9):2
 s146:  S1 :: muLB_gshed_da(ng101,k1,t9):1 SOS1_LB_gshed_da(ng101,k1,t9):2
 s147:  S1 :: muLB_gshed_da(ng101,k2,t9):1 SOS1_LB_gshed_da(ng101,k2,t9):2
 s148:  S1 :: muLB_gshed_da(ng101,k0,t10):1
     SOS1_LB_gshed_da(ng101,k0,t10):2
 s149:  S1 :: muLB_gshed_da(ng101,k1,t10):1
     SOS1_LB_gshed_da(ng101,k1,t10):2
 s150:  S1 :: muLB_gshed_da(ng101,k2,t10):1
     SOS1_LB_gshed_da(ng101,k2,t10):2
 s151:  S1 :: muLB_gshed_da(ng101,k0,t11):1
     SOS1_LB_gshed_da(ng101,k0,t11):2
 s152:  S1 :: muLB_gshed_da(ng101,k1,t11):1
     SOS1_LB_gshed_da(ng101,k1,t11):2
 s153:  S1 :: muLB_gshed_da(ng101,k2,t11):1
     SOS1_LB_gshed_da(ng101,k2,t11):2
 s154:  S1 :: muLB_gshed_da(ng101,k0,t12):1
     SOS1_LB_gshed_da(ng101,k0,t12):2
 s155:  S1 :: muLB_gshed_da(ng101,k1,t12):1
     SOS1_LB_gshed_da(ng101,k1,t12):2
 s156:  S1 :: muLB_gshed_da(ng101,k2,t12):1
     SOS1_LB_gshed_da(ng101,k2,t12):2
 s157:  S1 :: muLB_gshed_da(ng101,k0,t13):1
     SOS1_LB_gshed_da(ng101,k0,t13):2
 s158:  S1 :: muLB_gshed_da(ng101,k1,t13):1
     SOS1_LB_gshed_da(ng101,k1,t13):2
 s159:  S1 :: muLB_gshed_da(ng101,k2,t13):1
     SOS1_LB_gshed_da(ng101,k2,t13):2
 s160:  S1 :: muLB_gshed_da(ng101,k0,t14):1
     SOS1_LB_gshed_da(ng101,k0,t14):2
 s161:  S1 :: muLB_gshed_da(ng101,k1,t14):1
     SOS1_LB_gshed_da(ng101,k1,t14):2
 s162:  S1 :: muLB_gshed_da(ng101,k2,t14):1
     SOS1_LB_gshed_da(ng101,k2,t14):2
 s163:  S1 :: muLB_gshed_da(ng101,k0,t15):1
     SOS1_LB_gshed_da(ng101,k0,t15):2
 s164:  S1 :: muLB_gshed_da(ng101,k1,t15):1
     SOS1_LB_gshed_da(ng101,k1,t15):2
 s165:  S1 :: muLB_gshed_da(ng101,k2,t15):1
     SOS1_LB_gshed_da(ng101,k2,t15):2
 s166:  S1 :: muLB_gshed_da(ng101,k0,t16):1
     SOS1_LB_gshed_da(ng101,k0,t16):2
 s167:  S1 :: muLB_gshed_da(ng101,k1,t16):1
     SOS1_LB_gshed_da(ng101,k1,t16):2
 s168:  S1 :: muLB_gshed_da(ng101,k2,t16):1
     SOS1_LB_gshed_da(ng101,k2,t16):2
 s169:  S1 :: muLB_gshed_da(ng101,k0,t17):1
     SOS1_LB_gshed_da(ng101,k0,t17):2
 s170:  S1 :: muLB_gshed_da(ng101,k1,t17):1
     SOS1_LB_gshed_da(ng101,k1,t17):2
 s171:  S1 :: muLB_gshed_da(ng101,k2,t17):1
     SOS1_LB_gshed_da(ng101,k2,t17):2
 s172:  S1 :: muLB_gshed_da(ng101,k0,t18):1
     SOS1_LB_gshed_da(ng101,k0,t18):2
 s173:  S1 :: muLB_gshed_da(ng101,k1,t18):1
     SOS1_LB_gshed_da(ng101,k1,t18):2
 s174:  S1 :: muLB_gshed_da(ng101,k2,t18):1
     SOS1_LB_gshed_da(ng101,k2,t18):2
 s175:  S1 :: muLB_gshed_da(ng101,k0,t19):1
     SOS1_LB_gshed_da(ng101,k0,t19):2
 s176:  S1 :: muLB_gshed_da(ng101,k1,t19):1
     SOS1_LB_gshed_da(ng101,k1,t19):2
 s177:  S1 :: muLB_gshed_da(ng101,k2,t19):1
     SOS1_LB_gshed_da(ng101,k2,t19):2
 s178:  S1 :: muLB_gshed_da(ng101,k0,t20):1
     SOS1_LB_gshed_da(ng101,k0,t20):2
 s179:  S1 :: muLB_gshed_da(ng101,k1,t20):1
     SOS1_LB_gshed_da(ng101,k1,t20):2
 s180:  S1 :: muLB_gshed_da(ng101,k2,t20):1
     SOS1_LB_gshed_da(ng101,k2,t20):2
 s181:  S1 :: muLB_gshed_da(ng101,k0,t21):1
     SOS1_LB_gshed_da(ng101,k0,t21):2
 s182:  S1 :: muLB_gshed_da(ng101,k1,t21):1
     SOS1_LB_gshed_da(ng101,k1,t21):2
 s183:  S1 :: muLB_gshed_da(ng101,k2,t21):1
     SOS1_LB_gshed_da(ng101,k2,t21):2
 s184:  S1 :: muLB_gshed_da(ng101,k0,t22):1
     SOS1_LB_gshed_da(ng101,k0,t22):2
 s185:  S1 :: muLB_gshed_da(ng101,k1,t22):1
     SOS1_LB_gshed_da(ng101,k1,t22):2
 s186:  S1 :: muLB_gshed_da(ng101,k2,t22):1
     SOS1_LB_gshed_da(ng101,k2,t22):2
 s187:  S1 :: muLB_gshed_da(ng101,k0,t23):1
     SOS1_LB_gshed_da(ng101,k0,t23):2
 s188:  S1 :: muLB_gshed_da(ng101,k1,t23):1
     SOS1_LB_gshed_da(ng101,k1,t23):2
 s189:  S1 :: muLB_gshed_da(ng101,k2,t23):1
     SOS1_LB_gshed_da(ng101,k2,t23):2
 s190:  S1 :: muLB_gshed_da(ng101,k0,t24):1
     SOS1_LB_gshed_da(ng101,k0,t24):2
 s191:  S1 :: muLB_gshed_da(ng101,k1,t24):1
     SOS1_LB_gshed_da(ng101,k1,t24):2
 s192:  S1 :: muLB_gshed_da(ng101,k2,t24):1
     SOS1_LB_gshed_da(ng101,k2,t24):2
 s193:  S1 :: muLB_gshed_da(ng102,k0,t1):1 SOS1_LB_gshed_da(ng102,k0,t1):2
 s194:  S1 :: muLB_gshed_da(ng102,k1,t1):1 SOS1_LB_gshed_da(ng102,k1,t1):2
 s195:  S1 :: muLB_gshed_da(ng102,k2,t1):1 SOS1_LB_gshed_da(ng102,k2,t1):2
 s196:  S1 :: muLB_gshed_da(ng102,k0,t2):1 SOS1_LB_gshed_da(ng102,k0,t2):2
 s197:  S1 :: muLB_gshed_da(ng102,k1,t2):1 SOS1_LB_gshed_da(ng102,k1,t2):2
 s198:  S1 :: muLB_gshed_da(ng102,k2,t2):1 SOS1_LB_gshed_da(ng102,k2,t2):2
 s199:  S1 :: muLB_gshed_da(ng102,k0,t3):1 SOS1_LB_gshed_da(ng102,k0,t3):2
 s200:  S1 :: muLB_gshed_da(ng102,k1,t3):1 SOS1_LB_gshed_da(ng102,k1,t3):2
 s201:  S1 :: muLB_gshed_da(ng102,k2,t3):1 SOS1_LB_gshed_da(ng102,k2,t3):2
 s202:  S1 :: muLB_gshed_da(ng102,k0,t4):1 SOS1_LB_gshed_da(ng102,k0,t4):2
 s203:  S1 :: muLB_gshed_da(ng102,k1,t4):1 SOS1_LB_gshed_da(ng102,k1,t4):2
 s204:  S1 :: muLB_gshed_da(ng102,k2,t4):1 SOS1_LB_gshed_da(ng102,k2,t4):2
 s205:  S1 :: muLB_gshed_da(ng102,k0,t5):1 SOS1_LB_gshed_da(ng102,k0,t5):2
 s206:  S1 :: muLB_gshed_da(ng102,k1,t5):1 SOS1_LB_gshed_da(ng102,k1,t5):2
 s207:  S1 :: muLB_gshed_da(ng102,k2,t5):1 SOS1_LB_gshed_da(ng102,k2,t5):2
 s208:  S1 :: muLB_gshed_da(ng102,k0,t6):1 SOS1_LB_gshed_da(ng102,k0,t6):2
 s209:  S1 :: muLB_gshed_da(ng102,k1,t6):1 SOS1_LB_gshed_da(ng102,k1,t6):2
 s210:  S1 :: muLB_gshed_da(ng102,k2,t6):1 SOS1_LB_gshed_da(ng102,k2,t6):2
 s211:  S1 :: muLB_gshed_da(ng102,k0,t7):1 SOS1_LB_gshed_da(ng102,k0,t7):2
 s212:  S1 :: muLB_gshed_da(ng102,k1,t7):1 SOS1_LB_gshed_da(ng102,k1,t7):2
 s213:  S1 :: muLB_gshed_da(ng102,k2,t7):1 SOS1_LB_gshed_da(ng102,k2,t7):2
 s214:  S1 :: muLB_gshed_da(ng102,k0,t8):1 SOS1_LB_gshed_da(ng102,k0,t8):2
 s215:  S1 :: muLB_gshed_da(ng102,k1,t8):1 SOS1_LB_gshed_da(ng102,k1,t8):2
 s216:  S1 :: muLB_gshed_da(ng102,k2,t8):1 SOS1_LB_gshed_da(ng102,k2,t8):2
 s217:  S1 :: muLB_gshed_da(ng102,k0,t9):1 SOS1_LB_gshed_da(ng102,k0,t9):2
 s218:  S1 :: muLB_gshed_da(ng102,k1,t9):1 SOS1_LB_gshed_da(ng102,k1,t9):2
 s219:  S1 :: muLB_gshed_da(ng102,k2,t9):1 SOS1_LB_gshed_da(ng102,k2,t9):2
 s220:  S1 :: muLB_gshed_da(ng102,k0,t10):1
     SOS1_LB_gshed_da(ng102,k0,t10):2
 s221:  S1 :: muLB_gshed_da(ng102,k1,t10):1
     SOS1_LB_gshed_da(ng102,k1,t10):2
 s222:  S1 :: muLB_gshed_da(ng102,k2,t10):1
     SOS1_LB_gshed_da(ng102,k2,t10):2
 s223:  S1 :: muLB_gshed_da(ng102,k0,t11):1
     SOS1_LB_gshed_da(ng102,k0,t11):2
 s224:  S1 :: muLB_gshed_da(ng102,k1,t11):1
     SOS1_LB_gshed_da(ng102,k1,t11):2
 s225:  S1 :: muLB_gshed_da(ng102,k2,t11):1
     SOS1_LB_gshed_da(ng102,k2,t11):2
 s226:  S1 :: muLB_gshed_da(ng102,k0,t12):1
     SOS1_LB_gshed_da(ng102,k0,t12):2
 s227:  S1 :: muLB_gshed_da(ng102,k1,t12):1
     SOS1_LB_gshed_da(ng102,k1,t12):2
 s228:  S1 :: muLB_gshed_da(ng102,k2,t12):1
     SOS1_LB_gshed_da(ng102,k2,t12):2
 s229:  S1 :: muLB_gshed_da(ng102,k0,t13):1
     SOS1_LB_gshed_da(ng102,k0,t13):2
 s230:  S1 :: muLB_gshed_da(ng102,k1,t13):1
     SOS1_LB_gshed_da(ng102,k1,t13):2
 s231:  S1 :: muLB_gshed_da(ng102,k2,t13):1
     SOS1_LB_gshed_da(ng102,k2,t13):2
 s232:  S1 :: muLB_gshed_da(ng102,k0,t14):1
     SOS1_LB_gshed_da(ng102,k0,t14):2
 s233:  S1 :: muLB_gshed_da(ng102,k1,t14):1
     SOS1_LB_gshed_da(ng102,k1,t14):2
 s234:  S1 :: muLB_gshed_da(ng102,k2,t14):1
     SOS1_LB_gshed_da(ng102,k2,t14):2
 s235:  S1 :: muLB_gshed_da(ng102,k0,t15):1
     SOS1_LB_gshed_da(ng102,k0,t15):2
 s236:  S1 :: muLB_gshed_da(ng102,k1,t15):1
     SOS1_LB_gshed_da(ng102,k1,t15):2
 s237:  S1 :: muLB_gshed_da(ng102,k2,t15):1
     SOS1_LB_gshed_da(ng102,k2,t15):2
 s238:  S1 :: muLB_gshed_da(ng102,k0,t16):1
     SOS1_LB_gshed_da(ng102,k0,t16):2
 s239:  S1 :: muLB_gshed_da(ng102,k1,t16):1
     SOS1_LB_gshed_da(ng102,k1,t16):2
 s240:  S1 :: muLB_gshed_da(ng102,k2,t16):1
     SOS1_LB_gshed_da(ng102,k2,t16):2
 s241:  S1 :: muLB_gshed_da(ng102,k0,t17):1
     SOS1_LB_gshed_da(ng102,k0,t17):2
 s242:  S1 :: muLB_gshed_da(ng102,k1,t17):1
     SOS1_LB_gshed_da(ng102,k1,t17):2
 s243:  S1 :: muLB_gshed_da(ng102,k2,t17):1
     SOS1_LB_gshed_da(ng102,k2,t17):2
 s244:  S1 :: muLB_gshed_da(ng102,k0,t18):1
     SOS1_LB_gshed_da(ng102,k0,t18):2
 s245:  S1 :: muLB_gshed_da(ng102,k1,t18):1
     SOS1_LB_gshed_da(ng102,k1,t18):2
 s246:  S1 :: muLB_gshed_da(ng102,k2,t18):1
     SOS1_LB_gshed_da(ng102,k2,t18):2
 s247:  S1 :: muLB_gshed_da(ng102,k0,t19):1
     SOS1_LB_gshed_da(ng102,k0,t19):2
 s248:  S1 :: muLB_gshed_da(ng102,k1,t19):1
     SOS1_LB_gshed_da(ng102,k1,t19):2
 s249:  S1 :: muLB_gshed_da(ng102,k2,t19):1
     SOS1_LB_gshed_da(ng102,k2,t19):2
 s250:  S1 :: muLB_gshed_da(ng102,k0,t20):1
     SOS1_LB_gshed_da(ng102,k0,t20):2
 s251:  S1 :: muLB_gshed_da(ng102,k1,t20):1
     SOS1_LB_gshed_da(ng102,k1,t20):2
 s252:  S1 :: muLB_gshed_da(ng102,k2,t20):1
     SOS1_LB_gshed_da(ng102,k2,t20):2
 s253:  S1 :: muLB_gshed_da(ng102,k0,t21):1
     SOS1_LB_gshed_da(ng102,k0,t21):2
 s254:  S1 :: muLB_gshed_da(ng102,k1,t21):1
     SOS1_LB_gshed_da(ng102,k1,t21):2
 s255:  S1 :: muLB_gshed_da(ng102,k2,t21):1
     SOS1_LB_gshed_da(ng102,k2,t21):2
 s256:  S1 :: muLB_gshed_da(ng102,k0,t22):1
     SOS1_LB_gshed_da(ng102,k0,t22):2
 s257:  S1 :: muLB_gshed_da(ng102,k1,t22):1
     SOS1_LB_gshed_da(ng102,k1,t22):2
 s258:  S1 :: muLB_gshed_da(ng102,k2,t22):1
     SOS1_LB_gshed_da(ng102,k2,t22):2
 s259:  S1 :: muLB_gshed_da(ng102,k0,t23):1
     SOS1_LB_gshed_da(ng102,k0,t23):2
 s260:  S1 :: muLB_gshed_da(ng102,k1,t23):1
     SOS1_LB_gshed_da(ng102,k1,t23):2
 s261:  S1 :: muLB_gshed_da(ng102,k2,t23):1
     SOS1_LB_gshed_da(ng102,k2,t23):2
 s262:  S1 :: muLB_gshed_da(ng102,k0,t24):1
     SOS1_LB_gshed_da(ng102,k0,t24):2
 s263:  S1 :: muLB_gshed_da(ng102,k1,t24):1
     SOS1_LB_gshed_da(ng102,k1,t24):2
 s264:  S1 :: muLB_gshed_da(ng102,k2,t24):1
     SOS1_LB_gshed_da(ng102,k2,t24):2
 s265:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t1):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t1):2
 s266:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t1):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t1):2
 s267:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t1):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t1):2
 s268:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t2):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t2):2
 s269:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t2):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t2):2
 s270:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t2):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t2):2
 s271:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t3):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t3):2
 s272:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t3):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t3):2
 s273:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t3):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t3):2
 s274:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t4):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t4):2
 s275:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t4):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t4):2
 s276:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t4):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t4):2
 s277:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t5):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t5):2
 s278:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t5):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t5):2
 s279:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t5):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t5):2
 s280:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t6):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t6):2
 s281:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t6):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t6):2
 s282:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t6):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t6):2
 s283:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t7):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t7):2
 s284:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t7):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t7):2
 s285:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t7):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t7):2
 s286:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t8):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t8):2
 s287:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t8):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t8):2
 s288:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t8):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t8):2
 s289:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t9):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t9):2
 s290:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t9):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t9):2
 s291:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t9):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t9):2
 s292:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t10):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t10):2
 s293:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t10):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t10):2
 s294:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t10):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t10):2
 s295:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t11):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t11):2
 s296:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t11):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t11):2
 s297:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t11):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t11):2
 s298:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t12):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t12):2
 s299:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t12):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t12):2
 s300:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t12):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t12):2
 s301:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t13):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t13):2
 s302:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t13):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t13):2
 s303:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t13):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t13):2
 s304:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t14):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t14):2
 s305:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t14):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t14):2
 s306:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t14):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t14):2
 s307:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t15):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t15):2
 s308:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t15):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t15):2
 s309:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t15):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t15):2
 s310:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t16):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t16):2
 s311:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t16):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t16):2
 s312:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t16):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t16):2
 s313:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t17):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t17):2
 s314:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t17):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t17):2
 s315:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t17):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t17):2
 s316:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t18):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t18):2
 s317:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t18):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t18):2
 s318:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t18):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t18):2
 s319:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t19):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t19):2
 s320:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t19):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t19):2
 s321:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t19):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t19):2
 s322:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t20):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t20):2
 s323:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t20):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t20):2
 s324:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t20):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t20):2
 s325:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t21):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t21):2
 s326:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t21):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t21):2
 s327:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t21):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t21):2
 s328:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t22):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t22):2
 s329:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t22):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t22):2
 s330:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t22):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t22):2
 s331:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t23):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t23):2
 s332:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t23):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t23):2
 s333:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t23):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t23):2
 s334:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t24):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t24):2
 s335:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t24):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t24):2
 s336:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t24):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t24):2
 s337:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t1):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t1):2
 s338:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t1):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t1):2
 s339:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t1):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t1):2
 s340:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t1):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t1):2
 s341:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t1):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t1):2
 s342:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t1):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t1):2
 s343:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t2):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t2):2
 s344:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t2):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t2):2
 s345:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t2):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t2):2
 s346:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t2):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t2):2
 s347:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t2):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t2):2
 s348:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t2):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t2):2
 s349:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t3):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t3):2
 s350:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t3):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t3):2
 s351:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t3):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t3):2
 s352:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t3):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t3):2
 s353:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t3):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t3):2
 s354:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t3):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t3):2
 s355:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t4):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t4):2
 s356:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t4):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t4):2
 s357:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t4):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t4):2
 s358:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t4):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t4):2
 s359:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t4):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t4):2
 s360:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t4):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t4):2
 s361:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t5):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t5):2
 s362:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t5):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t5):2
 s363:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t5):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t5):2
 s364:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t5):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t5):2
 s365:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t5):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t5):2
 s366:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t5):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t5):2
 s367:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t6):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t6):2
 s368:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t6):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t6):2
 s369:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t6):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t6):2
 s370:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t6):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t6):2
 s371:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t6):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t6):2
 s372:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t6):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t6):2
 s373:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t7):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t7):2
 s374:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t7):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t7):2
 s375:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t7):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t7):2
 s376:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t7):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t7):2
 s377:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t7):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t7):2
 s378:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t7):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t7):2
 s379:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t8):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t8):2
 s380:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t8):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t8):2
 s381:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t8):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t8):2
 s382:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t8):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t8):2
 s383:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t8):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t8):2
 s384:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t8):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t8):2
 s385:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t9):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t9):2
 s386:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t9):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t9):2
 s387:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t9):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t9):2
 s388:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t9):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t9):2
 s389:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t9):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t9):2
 s390:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t9):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t9):2
 s391:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t10):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t10):2
 s392:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t10):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t10):2
 s393:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t10):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t10):2
 s394:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t10):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t10):2
 s395:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t10):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t10):2
 s396:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t10):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t10):2
 s397:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t11):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t11):2
 s398:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t11):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t11):2
 s399:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t11):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t11):2
 s400:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t11):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t11):2
 s401:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t11):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t11):2
 s402:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t11):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t11):2
 s403:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t12):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t12):2
 s404:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t12):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t12):2
 s405:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t12):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t12):2
 s406:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t12):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t12):2
 s407:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t12):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t12):2
 s408:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t12):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t12):2
 s409:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t13):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t13):2
 s410:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t13):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t13):2
 s411:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t13):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t13):2
 s412:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t13):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t13):2
 s413:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t13):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t13):2
 s414:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t13):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t13):2
 s415:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t14):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t14):2
 s416:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t14):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t14):2
 s417:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t14):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t14):2
 s418:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t14):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t14):2
 s419:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t14):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t14):2
 s420:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t14):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t14):2
 s421:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t15):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t15):2
 s422:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t15):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t15):2
 s423:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t15):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t15):2
 s424:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t15):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t15):2
 s425:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t15):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t15):2
 s426:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t15):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t15):2
 s427:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t16):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t16):2
 s428:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t16):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t16):2
 s429:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t16):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t16):2
 s430:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t16):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t16):2
 s431:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t16):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t16):2
 s432:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t16):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t16):2
 s433:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t17):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t17):2
 s434:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t17):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t17):2
 s435:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t17):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t17):2
 s436:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t17):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t17):2
 s437:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t17):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t17):2
 s438:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t17):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t17):2
 s439:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t18):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t18):2
 s440:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t18):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t18):2
 s441:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t18):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t18):2
 s442:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t18):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t18):2
 s443:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t18):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t18):2
 s444:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t18):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t18):2
 s445:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t19):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t19):2
 s446:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t19):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t19):2
 s447:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t19):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t19):2
 s448:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t19):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t19):2
 s449:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t19):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t19):2
 s450:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t19):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t19):2
 s451:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t20):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t20):2
 s452:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t20):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t20):2
 s453:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t20):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t20):2
 s454:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t20):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t20):2
 s455:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t20):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t20):2
 s456:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t20):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t20):2
 s457:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t21):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t21):2
 s458:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t21):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t21):2
 s459:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t21):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t21):2
 s460:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t21):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t21):2
 s461:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t21):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t21):2
 s462:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t21):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t21):2
 s463:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t22):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t22):2
 s464:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t22):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t22):2
 s465:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t22):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t22):2
 s466:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t22):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t22):2
 s467:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t22):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t22):2
 s468:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t22):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t22):2
 s469:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t23):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t23):2
 s470:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t23):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t23):2
 s471:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t23):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t23):2
 s472:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t23):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t23):2
 s473:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t23):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t23):2
 s474:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t23):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t23):2
 s475:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t24):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t24):2
 s476:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t24):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t24):2
 s477:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t24):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t24):2
 s478:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t24):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t24):2
 s479:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t24):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t24):2
 s480:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t24):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t24):2
 s481:  S1 :: muLB_gprod(gw1,k0,t1):1 SOS1_LB_gprod(gw1,k0,t1):2
 s482:  S1 :: muLB_gprod(gw1,k1,t1):1 SOS1_LB_gprod(gw1,k1,t1):2
 s483:  S1 :: muLB_gprod(gw1,k2,t1):1 SOS1_LB_gprod(gw1,k2,t1):2
 s484:  S1 :: muLB_gprod(gw1,k0,t2):1 SOS1_LB_gprod(gw1,k0,t2):2
 s485:  S1 :: muLB_gprod(gw1,k1,t2):1 SOS1_LB_gprod(gw1,k1,t2):2
 s486:  S1 :: muLB_gprod(gw1,k2,t2):1 SOS1_LB_gprod(gw1,k2,t2):2
 s487:  S1 :: muLB_gprod(gw1,k0,t3):1 SOS1_LB_gprod(gw1,k0,t3):2
 s488:  S1 :: muLB_gprod(gw1,k1,t3):1 SOS1_LB_gprod(gw1,k1,t3):2
 s489:  S1 :: muLB_gprod(gw1,k2,t3):1 SOS1_LB_gprod(gw1,k2,t3):2
 s490:  S1 :: muLB_gprod(gw1,k0,t4):1 SOS1_LB_gprod(gw1,k0,t4):2
 s491:  S1 :: muLB_gprod(gw1,k1,t4):1 SOS1_LB_gprod(gw1,k1,t4):2
 s492:  S1 :: muLB_gprod(gw1,k2,t4):1 SOS1_LB_gprod(gw1,k2,t4):2
 s493:  S1 :: muLB_gprod(gw1,k0,t5):1 SOS1_LB_gprod(gw1,k0,t5):2
 s494:  S1 :: muLB_gprod(gw1,k1,t5):1 SOS1_LB_gprod(gw1,k1,t5):2
 s495:  S1 :: muLB_gprod(gw1,k2,t5):1 SOS1_LB_gprod(gw1,k2,t5):2
 s496:  S1 :: muLB_gprod(gw1,k0,t6):1 SOS1_LB_gprod(gw1,k0,t6):2
 s497:  S1 :: muLB_gprod(gw1,k1,t6):1 SOS1_LB_gprod(gw1,k1,t6):2
 s498:  S1 :: muLB_gprod(gw1,k2,t6):1 SOS1_LB_gprod(gw1,k2,t6):2
 s499:  S1 :: muLB_gprod(gw1,k0,t7):1 SOS1_LB_gprod(gw1,k0,t7):2
 s500:  S1 :: muLB_gprod(gw1,k1,t7):1 SOS1_LB_gprod(gw1,k1,t7):2
 s501:  S1 :: muLB_gprod(gw1,k2,t7):1 SOS1_LB_gprod(gw1,k2,t7):2
 s502:  S1 :: muLB_gprod(gw1,k0,t8):1 SOS1_LB_gprod(gw1,k0,t8):2
 s503:  S1 :: muLB_gprod(gw1,k1,t8):1 SOS1_LB_gprod(gw1,k1,t8):2
 s504:  S1 :: muLB_gprod(gw1,k2,t8):1 SOS1_LB_gprod(gw1,k2,t8):2
 s505:  S1 :: muLB_gprod(gw1,k0,t9):1 SOS1_LB_gprod(gw1,k0,t9):2
 s506:  S1 :: muLB_gprod(gw1,k1,t9):1 SOS1_LB_gprod(gw1,k1,t9):2
 s507:  S1 :: muLB_gprod(gw1,k2,t9):1 SOS1_LB_gprod(gw1,k2,t9):2
 s508:  S1 :: muLB_gprod(gw1,k0,t10):1 SOS1_LB_gprod(gw1,k0,t10):2
 s509:  S1 :: muLB_gprod(gw1,k1,t10):1 SOS1_LB_gprod(gw1,k1,t10):2
 s510:  S1 :: muLB_gprod(gw1,k2,t10):1 SOS1_LB_gprod(gw1,k2,t10):2
 s511:  S1 :: muLB_gprod(gw1,k0,t11):1 SOS1_LB_gprod(gw1,k0,t11):2
 s512:  S1 :: muLB_gprod(gw1,k1,t11):1 SOS1_LB_gprod(gw1,k1,t11):2
 s513:  S1 :: muLB_gprod(gw1,k2,t11):1 SOS1_LB_gprod(gw1,k2,t11):2
 s514:  S1 :: muLB_gprod(gw1,k0,t12):1 SOS1_LB_gprod(gw1,k0,t12):2
 s515:  S1 :: muLB_gprod(gw1,k1,t12):1 SOS1_LB_gprod(gw1,k1,t12):2
 s516:  S1 :: muLB_gprod(gw1,k2,t12):1 SOS1_LB_gprod(gw1,k2,t12):2
 s517:  S1 :: muLB_gprod(gw1,k0,t13):1 SOS1_LB_gprod(gw1,k0,t13):2
 s518:  S1 :: muLB_gprod(gw1,k1,t13):1 SOS1_LB_gprod(gw1,k1,t13):2
 s519:  S1 :: muLB_gprod(gw1,k2,t13):1 SOS1_LB_gprod(gw1,k2,t13):2
 s520:  S1 :: muLB_gprod(gw1,k0,t14):1 SOS1_LB_gprod(gw1,k0,t14):2
 s521:  S1 :: muLB_gprod(gw1,k1,t14):1 SOS1_LB_gprod(gw1,k1,t14):2
 s522:  S1 :: muLB_gprod(gw1,k2,t14):1 SOS1_LB_gprod(gw1,k2,t14):2
 s523:  S1 :: muLB_gprod(gw1,k0,t15):1 SOS1_LB_gprod(gw1,k0,t15):2
 s524:  S1 :: muLB_gprod(gw1,k1,t15):1 SOS1_LB_gprod(gw1,k1,t15):2
 s525:  S1 :: muLB_gprod(gw1,k2,t15):1 SOS1_LB_gprod(gw1,k2,t15):2
 s526:  S1 :: muLB_gprod(gw1,k0,t16):1 SOS1_LB_gprod(gw1,k0,t16):2
 s527:  S1 :: muLB_gprod(gw1,k1,t16):1 SOS1_LB_gprod(gw1,k1,t16):2
 s528:  S1 :: muLB_gprod(gw1,k2,t16):1 SOS1_LB_gprod(gw1,k2,t16):2
 s529:  S1 :: muLB_gprod(gw1,k0,t17):1 SOS1_LB_gprod(gw1,k0,t17):2
 s530:  S1 :: muLB_gprod(gw1,k1,t17):1 SOS1_LB_gprod(gw1,k1,t17):2
 s531:  S1 :: muLB_gprod(gw1,k2,t17):1 SOS1_LB_gprod(gw1,k2,t17):2
 s532:  S1 :: muLB_gprod(gw1,k0,t18):1 SOS1_LB_gprod(gw1,k0,t18):2
 s533:  S1 :: muLB_gprod(gw1,k1,t18):1 SOS1_LB_gprod(gw1,k1,t18):2
 s534:  S1 :: muLB_gprod(gw1,k2,t18):1 SOS1_LB_gprod(gw1,k2,t18):2
 s535:  S1 :: muLB_gprod(gw1,k0,t19):1 SOS1_LB_gprod(gw1,k0,t19):2
 s536:  S1 :: muLB_gprod(gw1,k1,t19):1 SOS1_LB_gprod(gw1,k1,t19):2
 s537:  S1 :: muLB_gprod(gw1,k2,t19):1 SOS1_LB_gprod(gw1,k2,t19):2
 s538:  S1 :: muLB_gprod(gw1,k0,t20):1 SOS1_LB_gprod(gw1,k0,t20):2
 s539:  S1 :: muLB_gprod(gw1,k1,t20):1 SOS1_LB_gprod(gw1,k1,t20):2
 s540:  S1 :: muLB_gprod(gw1,k2,t20):1 SOS1_LB_gprod(gw1,k2,t20):2
 s541:  S1 :: muLB_gprod(gw1,k0,t21):1 SOS1_LB_gprod(gw1,k0,t21):2
 s542:  S1 :: muLB_gprod(gw1,k1,t21):1 SOS1_LB_gprod(gw1,k1,t21):2
 s543:  S1 :: muLB_gprod(gw1,k2,t21):1 SOS1_LB_gprod(gw1,k2,t21):2
 s544:  S1 :: muLB_gprod(gw1,k0,t22):1 SOS1_LB_gprod(gw1,k0,t22):2
 s545:  S1 :: muLB_gprod(gw1,k1,t22):1 SOS1_LB_gprod(gw1,k1,t22):2
 s546:  S1 :: muLB_gprod(gw1,k2,t22):1 SOS1_LB_gprod(gw1,k2,t22):2
 s547:  S1 :: muLB_gprod(gw1,k0,t23):1 SOS1_LB_gprod(gw1,k0,t23):2
 s548:  S1 :: muLB_gprod(gw1,k1,t23):1 SOS1_LB_gprod(gw1,k1,t23):2
 s549:  S1 :: muLB_gprod(gw1,k2,t23):1 SOS1_LB_gprod(gw1,k2,t23):2
 s550:  S1 :: muLB_gprod(gw1,k0,t24):1 SOS1_LB_gprod(gw1,k0,t24):2
 s551:  S1 :: muLB_gprod(gw1,k1,t24):1 SOS1_LB_gprod(gw1,k1,t24):2
 s552:  S1 :: muLB_gprod(gw1,k2,t24):1 SOS1_LB_gprod(gw1,k2,t24):2
 s553:  S1 :: muLB_gprod(gw2,k0,t1):1 SOS1_LB_gprod(gw2,k0,t1):2
 s554:  S1 :: muLB_gprod(gw2,k1,t1):1 SOS1_LB_gprod(gw2,k1,t1):2
 s555:  S1 :: muLB_gprod(gw2,k2,t1):1 SOS1_LB_gprod(gw2,k2,t1):2
 s556:  S1 :: muLB_gprod(gw2,k0,t2):1 SOS1_LB_gprod(gw2,k0,t2):2
 s557:  S1 :: muLB_gprod(gw2,k1,t2):1 SOS1_LB_gprod(gw2,k1,t2):2
 s558:  S1 :: muLB_gprod(gw2,k2,t2):1 SOS1_LB_gprod(gw2,k2,t2):2
 s559:  S1 :: muLB_gprod(gw2,k0,t3):1 SOS1_LB_gprod(gw2,k0,t3):2
 s560:  S1 :: muLB_gprod(gw2,k1,t3):1 SOS1_LB_gprod(gw2,k1,t3):2
 s561:  S1 :: muLB_gprod(gw2,k2,t3):1 SOS1_LB_gprod(gw2,k2,t3):2
 s562:  S1 :: muLB_gprod(gw2,k0,t4):1 SOS1_LB_gprod(gw2,k0,t4):2
 s563:  S1 :: muLB_gprod(gw2,k1,t4):1 SOS1_LB_gprod(gw2,k1,t4):2
 s564:  S1 :: muLB_gprod(gw2,k2,t4):1 SOS1_LB_gprod(gw2,k2,t4):2
 s565:  S1 :: muLB_gprod(gw2,k0,t5):1 SOS1_LB_gprod(gw2,k0,t5):2
 s566:  S1 :: muLB_gprod(gw2,k1,t5):1 SOS1_LB_gprod(gw2,k1,t5):2
 s567:  S1 :: muLB_gprod(gw2,k2,t5):1 SOS1_LB_gprod(gw2,k2,t5):2
 s568:  S1 :: muLB_gprod(gw2,k0,t6):1 SOS1_LB_gprod(gw2,k0,t6):2
 s569:  S1 :: muLB_gprod(gw2,k1,t6):1 SOS1_LB_gprod(gw2,k1,t6):2
 s570:  S1 :: muLB_gprod(gw2,k2,t6):1 SOS1_LB_gprod(gw2,k2,t6):2
 s571:  S1 :: muLB_gprod(gw2,k0,t7):1 SOS1_LB_gprod(gw2,k0,t7):2
 s572:  S1 :: muLB_gprod(gw2,k1,t7):1 SOS1_LB_gprod(gw2,k1,t7):2
 s573:  S1 :: muLB_gprod(gw2,k2,t7):1 SOS1_LB_gprod(gw2,k2,t7):2
 s574:  S1 :: muLB_gprod(gw2,k0,t8):1 SOS1_LB_gprod(gw2,k0,t8):2
 s575:  S1 :: muLB_gprod(gw2,k1,t8):1 SOS1_LB_gprod(gw2,k1,t8):2
 s576:  S1 :: muLB_gprod(gw2,k2,t8):1 SOS1_LB_gprod(gw2,k2,t8):2
 s577:  S1 :: muLB_gprod(gw2,k0,t9):1 SOS1_LB_gprod(gw2,k0,t9):2
 s578:  S1 :: muLB_gprod(gw2,k1,t9):1 SOS1_LB_gprod(gw2,k1,t9):2
 s579:  S1 :: muLB_gprod(gw2,k2,t9):1 SOS1_LB_gprod(gw2,k2,t9):2
 s580:  S1 :: muLB_gprod(gw2,k0,t10):1 SOS1_LB_gprod(gw2,k0,t10):2
 s581:  S1 :: muLB_gprod(gw2,k1,t10):1 SOS1_LB_gprod(gw2,k1,t10):2
 s582:  S1 :: muLB_gprod(gw2,k2,t10):1 SOS1_LB_gprod(gw2,k2,t10):2
 s583:  S1 :: muLB_gprod(gw2,k0,t11):1 SOS1_LB_gprod(gw2,k0,t11):2
 s584:  S1 :: muLB_gprod(gw2,k1,t11):1 SOS1_LB_gprod(gw2,k1,t11):2
 s585:  S1 :: muLB_gprod(gw2,k2,t11):1 SOS1_LB_gprod(gw2,k2,t11):2
 s586:  S1 :: muLB_gprod(gw2,k0,t12):1 SOS1_LB_gprod(gw2,k0,t12):2
 s587:  S1 :: muLB_gprod(gw2,k1,t12):1 SOS1_LB_gprod(gw2,k1,t12):2
 s588:  S1 :: muLB_gprod(gw2,k2,t12):1 SOS1_LB_gprod(gw2,k2,t12):2
 s589:  S1 :: muLB_gprod(gw2,k0,t13):1 SOS1_LB_gprod(gw2,k0,t13):2
 s590:  S1 :: muLB_gprod(gw2,k1,t13):1 SOS1_LB_gprod(gw2,k1,t13):2
 s591:  S1 :: muLB_gprod(gw2,k2,t13):1 SOS1_LB_gprod(gw2,k2,t13):2
 s592:  S1 :: muLB_gprod(gw2,k0,t14):1 SOS1_LB_gprod(gw2,k0,t14):2
 s593:  S1 :: muLB_gprod(gw2,k1,t14):1 SOS1_LB_gprod(gw2,k1,t14):2
 s594:  S1 :: muLB_gprod(gw2,k2,t14):1 SOS1_LB_gprod(gw2,k2,t14):2
 s595:  S1 :: muLB_gprod(gw2,k0,t15):1 SOS1_LB_gprod(gw2,k0,t15):2
 s596:  S1 :: muLB_gprod(gw2,k1,t15):1 SOS1_LB_gprod(gw2,k1,t15):2
 s597:  S1 :: muLB_gprod(gw2,k2,t15):1 SOS1_LB_gprod(gw2,k2,t15):2
 s598:  S1 :: muLB_gprod(gw2,k0,t16):1 SOS1_LB_gprod(gw2,k0,t16):2
 s599:  S1 :: muLB_gprod(gw2,k1,t16):1 SOS1_LB_gprod(gw2,k1,t16):2
 s600:  S1 :: muLB_gprod(gw2,k2,t16):1 SOS1_LB_gprod(gw2,k2,t16):2
 s601:  S1 :: muLB_gprod(gw2,k0,t17):1 SOS1_LB_gprod(gw2,k0,t17):2
 s602:  S1 :: muLB_gprod(gw2,k1,t17):1 SOS1_LB_gprod(gw2,k1,t17):2
 s603:  S1 :: muLB_gprod(gw2,k2,t17):1 SOS1_LB_gprod(gw2,k2,t17):2
 s604:  S1 :: muLB_gprod(gw2,k0,t18):1 SOS1_LB_gprod(gw2,k0,t18):2
 s605:  S1 :: muLB_gprod(gw2,k1,t18):1 SOS1_LB_gprod(gw2,k1,t18):2
 s606:  S1 :: muLB_gprod(gw2,k2,t18):1 SOS1_LB_gprod(gw2,k2,t18):2
 s607:  S1 :: muLB_gprod(gw2,k0,t19):1 SOS1_LB_gprod(gw2,k0,t19):2
 s608:  S1 :: muLB_gprod(gw2,k1,t19):1 SOS1_LB_gprod(gw2,k1,t19):2
 s609:  S1 :: muLB_gprod(gw2,k2,t19):1 SOS1_LB_gprod(gw2,k2,t19):2
 s610:  S1 :: muLB_gprod(gw2,k0,t20):1 SOS1_LB_gprod(gw2,k0,t20):2
 s611:  S1 :: muLB_gprod(gw2,k1,t20):1 SOS1_LB_gprod(gw2,k1,t20):2
 s612:  S1 :: muLB_gprod(gw2,k2,t20):1 SOS1_LB_gprod(gw2,k2,t20):2
 s613:  S1 :: muLB_gprod(gw2,k0,t21):1 SOS1_LB_gprod(gw2,k0,t21):2
 s614:  S1 :: muLB_gprod(gw2,k1,t21):1 SOS1_LB_gprod(gw2,k1,t21):2
 s615:  S1 :: muLB_gprod(gw2,k2,t21):1 SOS1_LB_gprod(gw2,k2,t21):2
 s616:  S1 :: muLB_gprod(gw2,k0,t22):1 SOS1_LB_gprod(gw2,k0,t22):2
 s617:  S1 :: muLB_gprod(gw2,k1,t22):1 SOS1_LB_gprod(gw2,k1,t22):2
 s618:  S1 :: muLB_gprod(gw2,k2,t22):1 SOS1_LB_gprod(gw2,k2,t22):2
 s619:  S1 :: muLB_gprod(gw2,k0,t23):1 SOS1_LB_gprod(gw2,k0,t23):2
 s620:  S1 :: muLB_gprod(gw2,k1,t23):1 SOS1_LB_gprod(gw2,k1,t23):2
 s621:  S1 :: muLB_gprod(gw2,k2,t23):1 SOS1_LB_gprod(gw2,k2,t23):2
 s622:  S1 :: muLB_gprod(gw2,k0,t24):1 SOS1_LB_gprod(gw2,k0,t24):2
 s623:  S1 :: muLB_gprod(gw2,k1,t24):1 SOS1_LB_gprod(gw2,k1,t24):2
 s624:  S1 :: muLB_gprod(gw2,k2,t24):1 SOS1_LB_gprod(gw2,k2,t24):2
 s625:  S1 :: muLB_gprod(gw3,k0,t1):1 SOS1_LB_gprod(gw3,k0,t1):2
 s626:  S1 :: muLB_gprod(gw3,k1,t1):1 SOS1_LB_gprod(gw3,k1,t1):2
 s627:  S1 :: muLB_gprod(gw3,k2,t1):1 SOS1_LB_gprod(gw3,k2,t1):2
 s628:  S1 :: muLB_gprod(gw3,k0,t2):1 SOS1_LB_gprod(gw3,k0,t2):2
 s629:  S1 :: muLB_gprod(gw3,k1,t2):1 SOS1_LB_gprod(gw3,k1,t2):2
 s630:  S1 :: muLB_gprod(gw3,k2,t2):1 SOS1_LB_gprod(gw3,k2,t2):2
 s631:  S1 :: muLB_gprod(gw3,k0,t3):1 SOS1_LB_gprod(gw3,k0,t3):2
 s632:  S1 :: muLB_gprod(gw3,k1,t3):1 SOS1_LB_gprod(gw3,k1,t3):2
 s633:  S1 :: muLB_gprod(gw3,k2,t3):1 SOS1_LB_gprod(gw3,k2,t3):2
 s634:  S1 :: muLB_gprod(gw3,k0,t4):1 SOS1_LB_gprod(gw3,k0,t4):2
 s635:  S1 :: muLB_gprod(gw3,k1,t4):1 SOS1_LB_gprod(gw3,k1,t4):2
 s636:  S1 :: muLB_gprod(gw3,k2,t4):1 SOS1_LB_gprod(gw3,k2,t4):2
 s637:  S1 :: muLB_gprod(gw3,k0,t5):1 SOS1_LB_gprod(gw3,k0,t5):2
 s638:  S1 :: muLB_gprod(gw3,k1,t5):1 SOS1_LB_gprod(gw3,k1,t5):2
 s639:  S1 :: muLB_gprod(gw3,k2,t5):1 SOS1_LB_gprod(gw3,k2,t5):2
 s640:  S1 :: muLB_gprod(gw3,k0,t6):1 SOS1_LB_gprod(gw3,k0,t6):2
 s641:  S1 :: muLB_gprod(gw3,k1,t6):1 SOS1_LB_gprod(gw3,k1,t6):2
 s642:  S1 :: muLB_gprod(gw3,k2,t6):1 SOS1_LB_gprod(gw3,k2,t6):2
 s643:  S1 :: muLB_gprod(gw3,k0,t7):1 SOS1_LB_gprod(gw3,k0,t7):2
 s644:  S1 :: muLB_gprod(gw3,k1,t7):1 SOS1_LB_gprod(gw3,k1,t7):2
 s645:  S1 :: muLB_gprod(gw3,k2,t7):1 SOS1_LB_gprod(gw3,k2,t7):2
 s646:  S1 :: muLB_gprod(gw3,k0,t8):1 SOS1_LB_gprod(gw3,k0,t8):2
 s647:  S1 :: muLB_gprod(gw3,k1,t8):1 SOS1_LB_gprod(gw3,k1,t8):2
 s648:  S1 :: muLB_gprod(gw3,k2,t8):1 SOS1_LB_gprod(gw3,k2,t8):2
 s649:  S1 :: muLB_gprod(gw3,k0,t9):1 SOS1_LB_gprod(gw3,k0,t9):2
 s650:  S1 :: muLB_gprod(gw3,k1,t9):1 SOS1_LB_gprod(gw3,k1,t9):2
 s651:  S1 :: muLB_gprod(gw3,k2,t9):1 SOS1_LB_gprod(gw3,k2,t9):2
 s652:  S1 :: muLB_gprod(gw3,k0,t10):1 SOS1_LB_gprod(gw3,k0,t10):2
 s653:  S1 :: muLB_gprod(gw3,k1,t10):1 SOS1_LB_gprod(gw3,k1,t10):2
 s654:  S1 :: muLB_gprod(gw3,k2,t10):1 SOS1_LB_gprod(gw3,k2,t10):2
 s655:  S1 :: muLB_gprod(gw3,k0,t11):1 SOS1_LB_gprod(gw3,k0,t11):2
 s656:  S1 :: muLB_gprod(gw3,k1,t11):1 SOS1_LB_gprod(gw3,k1,t11):2
 s657:  S1 :: muLB_gprod(gw3,k2,t11):1 SOS1_LB_gprod(gw3,k2,t11):2
 s658:  S1 :: muLB_gprod(gw3,k0,t12):1 SOS1_LB_gprod(gw3,k0,t12):2
 s659:  S1 :: muLB_gprod(gw3,k1,t12):1 SOS1_LB_gprod(gw3,k1,t12):2
 s660:  S1 :: muLB_gprod(gw3,k2,t12):1 SOS1_LB_gprod(gw3,k2,t12):2
 s661:  S1 :: muLB_gprod(gw3,k0,t13):1 SOS1_LB_gprod(gw3,k0,t13):2
 s662:  S1 :: muLB_gprod(gw3,k1,t13):1 SOS1_LB_gprod(gw3,k1,t13):2
 s663:  S1 :: muLB_gprod(gw3,k2,t13):1 SOS1_LB_gprod(gw3,k2,t13):2
 s664:  S1 :: muLB_gprod(gw3,k0,t14):1 SOS1_LB_gprod(gw3,k0,t14):2
 s665:  S1 :: muLB_gprod(gw3,k1,t14):1 SOS1_LB_gprod(gw3,k1,t14):2
 s666:  S1 :: muLB_gprod(gw3,k2,t14):1 SOS1_LB_gprod(gw3,k2,t14):2
 s667:  S1 :: muLB_gprod(gw3,k0,t15):1 SOS1_LB_gprod(gw3,k0,t15):2
 s668:  S1 :: muLB_gprod(gw3,k1,t15):1 SOS1_LB_gprod(gw3,k1,t15):2
 s669:  S1 :: muLB_gprod(gw3,k2,t15):1 SOS1_LB_gprod(gw3,k2,t15):2
 s670:  S1 :: muLB_gprod(gw3,k0,t16):1 SOS1_LB_gprod(gw3,k0,t16):2
 s671:  S1 :: muLB_gprod(gw3,k1,t16):1 SOS1_LB_gprod(gw3,k1,t16):2
 s672:  S1 :: muLB_gprod(gw3,k2,t16):1 SOS1_LB_gprod(gw3,k2,t16):2
 s673:  S1 :: muLB_gprod(gw3,k0,t17):1 SOS1_LB_gprod(gw3,k0,t17):2
 s674:  S1 :: muLB_gprod(gw3,k1,t17):1 SOS1_LB_gprod(gw3,k1,t17):2
 s675:  S1 :: muLB_gprod(gw3,k2,t17):1 SOS1_LB_gprod(gw3,k2,t17):2
 s676:  S1 :: muLB_gprod(gw3,k0,t18):1 SOS1_LB_gprod(gw3,k0,t18):2
 s677:  S1 :: muLB_gprod(gw3,k1,t18):1 SOS1_LB_gprod(gw3,k1,t18):2
 s678:  S1 :: muLB_gprod(gw3,k2,t18):1 SOS1_LB_gprod(gw3,k2,t18):2
 s679:  S1 :: muLB_gprod(gw3,k0,t19):1 SOS1_LB_gprod(gw3,k0,t19):2
 s680:  S1 :: muLB_gprod(gw3,k1,t19):1 SOS1_LB_gprod(gw3,k1,t19):2
 s681:  S1 :: muLB_gprod(gw3,k2,t19):1 SOS1_LB_gprod(gw3,k2,t19):2
 s682:  S1 :: muLB_gprod(gw3,k0,t20):1 SOS1_LB_gprod(gw3,k0,t20):2
 s683:  S1 :: muLB_gprod(gw3,k1,t20):1 SOS1_LB_gprod(gw3,k1,t20):2
 s684:  S1 :: muLB_gprod(gw3,k2,t20):1 SOS1_LB_gprod(gw3,k2,t20):2
 s685:  S1 :: muLB_gprod(gw3,k0,t21):1 SOS1_LB_gprod(gw3,k0,t21):2
 s686:  S1 :: muLB_gprod(gw3,k1,t21):1 SOS1_LB_gprod(gw3,k1,t21):2
 s687:  S1 :: muLB_gprod(gw3,k2,t21):1 SOS1_LB_gprod(gw3,k2,t21):2
 s688:  S1 :: muLB_gprod(gw3,k0,t22):1 SOS1_LB_gprod(gw3,k0,t22):2
 s689:  S1 :: muLB_gprod(gw3,k1,t22):1 SOS1_LB_gprod(gw3,k1,t22):2
 s690:  S1 :: muLB_gprod(gw3,k2,t22):1 SOS1_LB_gprod(gw3,k2,t22):2
 s691:  S1 :: muLB_gprod(gw3,k0,t23):1 SOS1_LB_gprod(gw3,k0,t23):2
 s692:  S1 :: muLB_gprod(gw3,k1,t23):1 SOS1_LB_gprod(gw3,k1,t23):2
 s693:  S1 :: muLB_gprod(gw3,k2,t23):1 SOS1_LB_gprod(gw3,k2,t23):2
 s694:  S1 :: muLB_gprod(gw3,k0,t24):1 SOS1_LB_gprod(gw3,k0,t24):2
 s695:  S1 :: muLB_gprod(gw3,k1,t24):1 SOS1_LB_gprod(gw3,k1,t24):2
 s696:  S1 :: muLB_gprod(gw3,k2,t24):1 SOS1_LB_gprod(gw3,k2,t24):2
 s697:  S1 :: muLB_gsin(gs1,t1,k0):1 SOS1_LB_gsin(gs1,t1,k0):2
 s698:  S1 :: muLB_gsout(gs1,t1,k0):1 SOS1_LB_gsout(gs1,t1,k0):2
 s699:  S1 :: muLB_gstore(gs1,t1,k0):1 SOS1_LB_gstore(gs1,t1,k0):2
 s700:  S1 :: muLB_gsin(gs1,t1,k1):1 SOS1_LB_gsin(gs1,t1,k1):2
 s701:  S1 :: muLB_gsout(gs1,t1,k1):1 SOS1_LB_gsout(gs1,t1,k1):2
 s702:  S1 :: muLB_gstore(gs1,t1,k1):1 SOS1_LB_gstore(gs1,t1,k1):2
 s703:  S1 :: muLB_gsin(gs1,t1,k2):1 SOS1_LB_gsin(gs1,t1,k2):2
 s704:  S1 :: muLB_gsout(gs1,t1,k2):1 SOS1_LB_gsout(gs1,t1,k2):2
 s705:  S1 :: muLB_gstore(gs1,t1,k2):1 SOS1_LB_gstore(gs1,t1,k2):2
 s706:  S1 :: muLB_gsin(gs1,t2,k0):1 SOS1_LB_gsin(gs1,t2,k0):2
 s707:  S1 :: muLB_gsout(gs1,t2,k0):1 SOS1_LB_gsout(gs1,t2,k0):2
 s708:  S1 :: muLB_gstore(gs1,t2,k0):1 SOS1_LB_gstore(gs1,t2,k0):2
 s709:  S1 :: muLB_gsin(gs1,t2,k1):1 SOS1_LB_gsin(gs1,t2,k1):2
 s710:  S1 :: muLB_gsout(gs1,t2,k1):1 SOS1_LB_gsout(gs1,t2,k1):2
 s711:  S1 :: muLB_gstore(gs1,t2,k1):1 SOS1_LB_gstore(gs1,t2,k1):2
 s712:  S1 :: muLB_gsin(gs1,t2,k2):1 SOS1_LB_gsin(gs1,t2,k2):2
 s713:  S1 :: muLB_gsout(gs1,t2,k2):1 SOS1_LB_gsout(gs1,t2,k2):2
 s714:  S1 :: muLB_gstore(gs1,t2,k2):1 SOS1_LB_gstore(gs1,t2,k2):2
 s715:  S1 :: muLB_gsin(gs1,t3,k0):1 SOS1_LB_gsin(gs1,t3,k0):2
 s716:  S1 :: muLB_gsout(gs1,t3,k0):1 SOS1_LB_gsout(gs1,t3,k0):2
 s717:  S1 :: muLB_gstore(gs1,t3,k0):1 SOS1_LB_gstore(gs1,t3,k0):2
 s718:  S1 :: muLB_gsin(gs1,t3,k1):1 SOS1_LB_gsin(gs1,t3,k1):2
 s719:  S1 :: muLB_gsout(gs1,t3,k1):1 SOS1_LB_gsout(gs1,t3,k1):2
 s720:  S1 :: muLB_gstore(gs1,t3,k1):1 SOS1_LB_gstore(gs1,t3,k1):2
 s721:  S1 :: muLB_gsin(gs1,t3,k2):1 SOS1_LB_gsin(gs1,t3,k2):2
 s722:  S1 :: muLB_gsout(gs1,t3,k2):1 SOS1_LB_gsout(gs1,t3,k2):2
 s723:  S1 :: muLB_gstore(gs1,t3,k2):1 SOS1_LB_gstore(gs1,t3,k2):2
 s724:  S1 :: muLB_gsin(gs1,t4,k0):1 SOS1_LB_gsin(gs1,t4,k0):2
 s725:  S1 :: muLB_gsout(gs1,t4,k0):1 SOS1_LB_gsout(gs1,t4,k0):2
 s726:  S1 :: muLB_gstore(gs1,t4,k0):1 SOS1_LB_gstore(gs1,t4,k0):2
 s727:  S1 :: muLB_gsin(gs1,t4,k1):1 SOS1_LB_gsin(gs1,t4,k1):2
 s728:  S1 :: muLB_gsout(gs1,t4,k1):1 SOS1_LB_gsout(gs1,t4,k1):2
 s729:  S1 :: muLB_gstore(gs1,t4,k1):1 SOS1_LB_gstore(gs1,t4,k1):2
 s730:  S1 :: muLB_gsin(gs1,t4,k2):1 SOS1_LB_gsin(gs1,t4,k2):2
 s731:  S1 :: muLB_gsout(gs1,t4,k2):1 SOS1_LB_gsout(gs1,t4,k2):2
 s732:  S1 :: muLB_gstore(gs1,t4,k2):1 SOS1_LB_gstore(gs1,t4,k2):2
 s733:  S1 :: muLB_gsin(gs1,t5,k0):1 SOS1_LB_gsin(gs1,t5,k0):2
 s734:  S1 :: muLB_gsout(gs1,t5,k0):1 SOS1_LB_gsout(gs1,t5,k0):2
 s735:  S1 :: muLB_gstore(gs1,t5,k0):1 SOS1_LB_gstore(gs1,t5,k0):2
 s736:  S1 :: muLB_gsin(gs1,t5,k1):1 SOS1_LB_gsin(gs1,t5,k1):2
 s737:  S1 :: muLB_gsout(gs1,t5,k1):1 SOS1_LB_gsout(gs1,t5,k1):2
 s738:  S1 :: muLB_gstore(gs1,t5,k1):1 SOS1_LB_gstore(gs1,t5,k1):2
 s739:  S1 :: muLB_gsin(gs1,t5,k2):1 SOS1_LB_gsin(gs1,t5,k2):2
 s740:  S1 :: muLB_gsout(gs1,t5,k2):1 SOS1_LB_gsout(gs1,t5,k2):2
 s741:  S1 :: muLB_gstore(gs1,t5,k2):1 SOS1_LB_gstore(gs1,t5,k2):2
 s742:  S1 :: muLB_gsin(gs1,t6,k0):1 SOS1_LB_gsin(gs1,t6,k0):2
 s743:  S1 :: muLB_gsout(gs1,t6,k0):1 SOS1_LB_gsout(gs1,t6,k0):2
 s744:  S1 :: muLB_gstore(gs1,t6,k0):1 SOS1_LB_gstore(gs1,t6,k0):2
 s745:  S1 :: muLB_gsin(gs1,t6,k1):1 SOS1_LB_gsin(gs1,t6,k1):2
 s746:  S1 :: muLB_gsout(gs1,t6,k1):1 SOS1_LB_gsout(gs1,t6,k1):2
 s747:  S1 :: muLB_gstore(gs1,t6,k1):1 SOS1_LB_gstore(gs1,t6,k1):2
 s748:  S1 :: muLB_gsin(gs1,t6,k2):1 SOS1_LB_gsin(gs1,t6,k2):2
 s749:  S1 :: muLB_gsout(gs1,t6,k2):1 SOS1_LB_gsout(gs1,t6,k2):2
 s750:  S1 :: muLB_gstore(gs1,t6,k2):1 SOS1_LB_gstore(gs1,t6,k2):2
 s751:  S1 :: muLB_gsin(gs1,t7,k0):1 SOS1_LB_gsin(gs1,t7,k0):2
 s752:  S1 :: muLB_gsout(gs1,t7,k0):1 SOS1_LB_gsout(gs1,t7,k0):2
 s753:  S1 :: muLB_gstore(gs1,t7,k0):1 SOS1_LB_gstore(gs1,t7,k0):2
 s754:  S1 :: muLB_gsin(gs1,t7,k1):1 SOS1_LB_gsin(gs1,t7,k1):2
 s755:  S1 :: muLB_gsout(gs1,t7,k1):1 SOS1_LB_gsout(gs1,t7,k1):2
 s756:  S1 :: muLB_gstore(gs1,t7,k1):1 SOS1_LB_gstore(gs1,t7,k1):2
 s757:  S1 :: muLB_gsin(gs1,t7,k2):1 SOS1_LB_gsin(gs1,t7,k2):2
 s758:  S1 :: muLB_gsout(gs1,t7,k2):1 SOS1_LB_gsout(gs1,t7,k2):2
 s759:  S1 :: muLB_gstore(gs1,t7,k2):1 SOS1_LB_gstore(gs1,t7,k2):2
 s760:  S1 :: muLB_gsin(gs1,t8,k0):1 SOS1_LB_gsin(gs1,t8,k0):2
 s761:  S1 :: muLB_gsout(gs1,t8,k0):1 SOS1_LB_gsout(gs1,t8,k0):2
 s762:  S1 :: muLB_gstore(gs1,t8,k0):1 SOS1_LB_gstore(gs1,t8,k0):2
 s763:  S1 :: muLB_gsin(gs1,t8,k1):1 SOS1_LB_gsin(gs1,t8,k1):2
 s764:  S1 :: muLB_gsout(gs1,t8,k1):1 SOS1_LB_gsout(gs1,t8,k1):2
 s765:  S1 :: muLB_gstore(gs1,t8,k1):1 SOS1_LB_gstore(gs1,t8,k1):2
 s766:  S1 :: muLB_gsin(gs1,t8,k2):1 SOS1_LB_gsin(gs1,t8,k2):2
 s767:  S1 :: muLB_gsout(gs1,t8,k2):1 SOS1_LB_gsout(gs1,t8,k2):2
 s768:  S1 :: muLB_gstore(gs1,t8,k2):1 SOS1_LB_gstore(gs1,t8,k2):2
 s769:  S1 :: muLB_gsin(gs1,t9,k0):1 SOS1_LB_gsin(gs1,t9,k0):2
 s770:  S1 :: muLB_gsout(gs1,t9,k0):1 SOS1_LB_gsout(gs1,t9,k0):2
 s771:  S1 :: muLB_gstore(gs1,t9,k0):1 SOS1_LB_gstore(gs1,t9,k0):2
 s772:  S1 :: muLB_gsin(gs1,t9,k1):1 SOS1_LB_gsin(gs1,t9,k1):2
 s773:  S1 :: muLB_gsout(gs1,t9,k1):1 SOS1_LB_gsout(gs1,t9,k1):2
 s774:  S1 :: muLB_gstore(gs1,t9,k1):1 SOS1_LB_gstore(gs1,t9,k1):2
 s775:  S1 :: muLB_gsin(gs1,t9,k2):1 SOS1_LB_gsin(gs1,t9,k2):2
 s776:  S1 :: muLB_gsout(gs1,t9,k2):1 SOS1_LB_gsout(gs1,t9,k2):2
 s777:  S1 :: muLB_gstore(gs1,t9,k2):1 SOS1_LB_gstore(gs1,t9,k2):2
 s778:  S1 :: muLB_gsin(gs1,t10,k0):1 SOS1_LB_gsin(gs1,t10,k0):2
 s779:  S1 :: muLB_gsout(gs1,t10,k0):1 SOS1_LB_gsout(gs1,t10,k0):2
 s780:  S1 :: muLB_gstore(gs1,t10,k0):1 SOS1_LB_gstore(gs1,t10,k0):2
 s781:  S1 :: muLB_gsin(gs1,t10,k1):1 SOS1_LB_gsin(gs1,t10,k1):2
 s782:  S1 :: muLB_gsout(gs1,t10,k1):1 SOS1_LB_gsout(gs1,t10,k1):2
 s783:  S1 :: muLB_gstore(gs1,t10,k1):1 SOS1_LB_gstore(gs1,t10,k1):2
 s784:  S1 :: muLB_gsin(gs1,t10,k2):1 SOS1_LB_gsin(gs1,t10,k2):2
 s785:  S1 :: muLB_gsout(gs1,t10,k2):1 SOS1_LB_gsout(gs1,t10,k2):2
 s786:  S1 :: muLB_gstore(gs1,t10,k2):1 SOS1_LB_gstore(gs1,t10,k2):2
 s787:  S1 :: muLB_gsin(gs1,t11,k0):1 SOS1_LB_gsin(gs1,t11,k0):2
 s788:  S1 :: muLB_gsout(gs1,t11,k0):1 SOS1_LB_gsout(gs1,t11,k0):2
 s789:  S1 :: muLB_gstore(gs1,t11,k0):1 SOS1_LB_gstore(gs1,t11,k0):2
 s790:  S1 :: muLB_gsin(gs1,t11,k1):1 SOS1_LB_gsin(gs1,t11,k1):2
 s791:  S1 :: muLB_gsout(gs1,t11,k1):1 SOS1_LB_gsout(gs1,t11,k1):2
 s792:  S1 :: muLB_gstore(gs1,t11,k1):1 SOS1_LB_gstore(gs1,t11,k1):2
 s793:  S1 :: muLB_gsin(gs1,t11,k2):1 SOS1_LB_gsin(gs1,t11,k2):2
 s794:  S1 :: muLB_gsout(gs1,t11,k2):1 SOS1_LB_gsout(gs1,t11,k2):2
 s795:  S1 :: muLB_gstore(gs1,t11,k2):1 SOS1_LB_gstore(gs1,t11,k2):2
 s796:  S1 :: muLB_gsin(gs1,t12,k0):1 SOS1_LB_gsin(gs1,t12,k0):2
 s797:  S1 :: muLB_gsout(gs1,t12,k0):1 SOS1_LB_gsout(gs1,t12,k0):2
 s798:  S1 :: muLB_gstore(gs1,t12,k0):1 SOS1_LB_gstore(gs1,t12,k0):2
 s799:  S1 :: muLB_gsin(gs1,t12,k1):1 SOS1_LB_gsin(gs1,t12,k1):2
 s800:  S1 :: muLB_gsout(gs1,t12,k1):1 SOS1_LB_gsout(gs1,t12,k1):2
 s801:  S1 :: muLB_gstore(gs1,t12,k1):1 SOS1_LB_gstore(gs1,t12,k1):2
 s802:  S1 :: muLB_gsin(gs1,t12,k2):1 SOS1_LB_gsin(gs1,t12,k2):2
 s803:  S1 :: muLB_gsout(gs1,t12,k2):1 SOS1_LB_gsout(gs1,t12,k2):2
 s804:  S1 :: muLB_gstore(gs1,t12,k2):1 SOS1_LB_gstore(gs1,t12,k2):2
 s805:  S1 :: muLB_gsin(gs1,t13,k0):1 SOS1_LB_gsin(gs1,t13,k0):2
 s806:  S1 :: muLB_gsout(gs1,t13,k0):1 SOS1_LB_gsout(gs1,t13,k0):2
 s807:  S1 :: muLB_gstore(gs1,t13,k0):1 SOS1_LB_gstore(gs1,t13,k0):2
 s808:  S1 :: muLB_gsin(gs1,t13,k1):1 SOS1_LB_gsin(gs1,t13,k1):2
 s809:  S1 :: muLB_gsout(gs1,t13,k1):1 SOS1_LB_gsout(gs1,t13,k1):2
 s810:  S1 :: muLB_gstore(gs1,t13,k1):1 SOS1_LB_gstore(gs1,t13,k1):2
 s811:  S1 :: muLB_gsin(gs1,t13,k2):1 SOS1_LB_gsin(gs1,t13,k2):2
 s812:  S1 :: muLB_gsout(gs1,t13,k2):1 SOS1_LB_gsout(gs1,t13,k2):2
 s813:  S1 :: muLB_gstore(gs1,t13,k2):1 SOS1_LB_gstore(gs1,t13,k2):2
 s814:  S1 :: muLB_gsin(gs1,t14,k0):1 SOS1_LB_gsin(gs1,t14,k0):2
 s815:  S1 :: muLB_gsout(gs1,t14,k0):1 SOS1_LB_gsout(gs1,t14,k0):2
 s816:  S1 :: muLB_gstore(gs1,t14,k0):1 SOS1_LB_gstore(gs1,t14,k0):2
 s817:  S1 :: muLB_gsin(gs1,t14,k1):1 SOS1_LB_gsin(gs1,t14,k1):2
 s818:  S1 :: muLB_gsout(gs1,t14,k1):1 SOS1_LB_gsout(gs1,t14,k1):2
 s819:  S1 :: muLB_gstore(gs1,t14,k1):1 SOS1_LB_gstore(gs1,t14,k1):2
 s820:  S1 :: muLB_gsin(gs1,t14,k2):1 SOS1_LB_gsin(gs1,t14,k2):2
 s821:  S1 :: muLB_gsout(gs1,t14,k2):1 SOS1_LB_gsout(gs1,t14,k2):2
 s822:  S1 :: muLB_gstore(gs1,t14,k2):1 SOS1_LB_gstore(gs1,t14,k2):2
 s823:  S1 :: muLB_gsin(gs1,t15,k0):1 SOS1_LB_gsin(gs1,t15,k0):2
 s824:  S1 :: muLB_gsout(gs1,t15,k0):1 SOS1_LB_gsout(gs1,t15,k0):2
 s825:  S1 :: muLB_gstore(gs1,t15,k0):1 SOS1_LB_gstore(gs1,t15,k0):2
 s826:  S1 :: muLB_gsin(gs1,t15,k1):1 SOS1_LB_gsin(gs1,t15,k1):2
 s827:  S1 :: muLB_gsout(gs1,t15,k1):1 SOS1_LB_gsout(gs1,t15,k1):2
 s828:  S1 :: muLB_gstore(gs1,t15,k1):1 SOS1_LB_gstore(gs1,t15,k1):2
 s829:  S1 :: muLB_gsin(gs1,t15,k2):1 SOS1_LB_gsin(gs1,t15,k2):2
 s830:  S1 :: muLB_gsout(gs1,t15,k2):1 SOS1_LB_gsout(gs1,t15,k2):2
 s831:  S1 :: muLB_gstore(gs1,t15,k2):1 SOS1_LB_gstore(gs1,t15,k2):2
 s832:  S1 :: muLB_gsin(gs1,t16,k0):1 SOS1_LB_gsin(gs1,t16,k0):2
 s833:  S1 :: muLB_gsout(gs1,t16,k0):1 SOS1_LB_gsout(gs1,t16,k0):2
 s834:  S1 :: muLB_gstore(gs1,t16,k0):1 SOS1_LB_gstore(gs1,t16,k0):2
 s835:  S1 :: muLB_gsin(gs1,t16,k1):1 SOS1_LB_gsin(gs1,t16,k1):2
 s836:  S1 :: muLB_gsout(gs1,t16,k1):1 SOS1_LB_gsout(gs1,t16,k1):2
 s837:  S1 :: muLB_gstore(gs1,t16,k1):1 SOS1_LB_gstore(gs1,t16,k1):2
 s838:  S1 :: muLB_gsin(gs1,t16,k2):1 SOS1_LB_gsin(gs1,t16,k2):2
 s839:  S1 :: muLB_gsout(gs1,t16,k2):1 SOS1_LB_gsout(gs1,t16,k2):2
 s840:  S1 :: muLB_gstore(gs1,t16,k2):1 SOS1_LB_gstore(gs1,t16,k2):2
 s841:  S1 :: muLB_gsin(gs1,t17,k0):1 SOS1_LB_gsin(gs1,t17,k0):2
 s842:  S1 :: muLB_gsout(gs1,t17,k0):1 SOS1_LB_gsout(gs1,t17,k0):2
 s843:  S1 :: muLB_gstore(gs1,t17,k0):1 SOS1_LB_gstore(gs1,t17,k0):2
 s844:  S1 :: muLB_gsin(gs1,t17,k1):1 SOS1_LB_gsin(gs1,t17,k1):2
 s845:  S1 :: muLB_gsout(gs1,t17,k1):1 SOS1_LB_gsout(gs1,t17,k1):2
 s846:  S1 :: muLB_gstore(gs1,t17,k1):1 SOS1_LB_gstore(gs1,t17,k1):2
 s847:  S1 :: muLB_gsin(gs1,t17,k2):1 SOS1_LB_gsin(gs1,t17,k2):2
 s848:  S1 :: muLB_gsout(gs1,t17,k2):1 SOS1_LB_gsout(gs1,t17,k2):2
 s849:  S1 :: muLB_gstore(gs1,t17,k2):1 SOS1_LB_gstore(gs1,t17,k2):2
 s850:  S1 :: muLB_gsin(gs1,t18,k0):1 SOS1_LB_gsin(gs1,t18,k0):2
 s851:  S1 :: muLB_gsout(gs1,t18,k0):1 SOS1_LB_gsout(gs1,t18,k0):2
 s852:  S1 :: muLB_gstore(gs1,t18,k0):1 SOS1_LB_gstore(gs1,t18,k0):2
 s853:  S1 :: muLB_gsin(gs1,t18,k1):1 SOS1_LB_gsin(gs1,t18,k1):2
 s854:  S1 :: muLB_gsout(gs1,t18,k1):1 SOS1_LB_gsout(gs1,t18,k1):2
 s855:  S1 :: muLB_gstore(gs1,t18,k1):1 SOS1_LB_gstore(gs1,t18,k1):2
 s856:  S1 :: muLB_gsin(gs1,t18,k2):1 SOS1_LB_gsin(gs1,t18,k2):2
 s857:  S1 :: muLB_gsout(gs1,t18,k2):1 SOS1_LB_gsout(gs1,t18,k2):2
 s858:  S1 :: muLB_gstore(gs1,t18,k2):1 SOS1_LB_gstore(gs1,t18,k2):2
 s859:  S1 :: muLB_gsin(gs1,t19,k0):1 SOS1_LB_gsin(gs1,t19,k0):2
 s860:  S1 :: muLB_gsout(gs1,t19,k0):1 SOS1_LB_gsout(gs1,t19,k0):2
 s861:  S1 :: muLB_gstore(gs1,t19,k0):1 SOS1_LB_gstore(gs1,t19,k0):2
 s862:  S1 :: muLB_gsin(gs1,t19,k1):1 SOS1_LB_gsin(gs1,t19,k1):2
 s863:  S1 :: muLB_gsout(gs1,t19,k1):1 SOS1_LB_gsout(gs1,t19,k1):2
 s864:  S1 :: muLB_gstore(gs1,t19,k1):1 SOS1_LB_gstore(gs1,t19,k1):2
 s865:  S1 :: muLB_gsin(gs1,t19,k2):1 SOS1_LB_gsin(gs1,t19,k2):2
 s866:  S1 :: muLB_gsout(gs1,t19,k2):1 SOS1_LB_gsout(gs1,t19,k2):2
 s867:  S1 :: muLB_gstore(gs1,t19,k2):1 SOS1_LB_gstore(gs1,t19,k2):2
 s868:  S1 :: muLB_gsin(gs1,t20,k0):1 SOS1_LB_gsin(gs1,t20,k0):2
 s869:  S1 :: muLB_gsout(gs1,t20,k0):1 SOS1_LB_gsout(gs1,t20,k0):2
 s870:  S1 :: muLB_gstore(gs1,t20,k0):1 SOS1_LB_gstore(gs1,t20,k0):2
 s871:  S1 :: muLB_gsin(gs1,t20,k1):1 SOS1_LB_gsin(gs1,t20,k1):2
 s872:  S1 :: muLB_gsout(gs1,t20,k1):1 SOS1_LB_gsout(gs1,t20,k1):2
 s873:  S1 :: muLB_gstore(gs1,t20,k1):1 SOS1_LB_gstore(gs1,t20,k1):2
 s874:  S1 :: muLB_gsin(gs1,t20,k2):1 SOS1_LB_gsin(gs1,t20,k2):2
 s875:  S1 :: muLB_gsout(gs1,t20,k2):1 SOS1_LB_gsout(gs1,t20,k2):2
 s876:  S1 :: muLB_gstore(gs1,t20,k2):1 SOS1_LB_gstore(gs1,t20,k2):2
 s877:  S1 :: muLB_gsin(gs1,t21,k0):1 SOS1_LB_gsin(gs1,t21,k0):2
 s878:  S1 :: muLB_gsout(gs1,t21,k0):1 SOS1_LB_gsout(gs1,t21,k0):2
 s879:  S1 :: muLB_gstore(gs1,t21,k0):1 SOS1_LB_gstore(gs1,t21,k0):2
 s880:  S1 :: muLB_gsin(gs1,t21,k1):1 SOS1_LB_gsin(gs1,t21,k1):2
 s881:  S1 :: muLB_gsout(gs1,t21,k1):1 SOS1_LB_gsout(gs1,t21,k1):2
 s882:  S1 :: muLB_gstore(gs1,t21,k1):1 SOS1_LB_gstore(gs1,t21,k1):2
 s883:  S1 :: muLB_gsin(gs1,t21,k2):1 SOS1_LB_gsin(gs1,t21,k2):2
 s884:  S1 :: muLB_gsout(gs1,t21,k2):1 SOS1_LB_gsout(gs1,t21,k2):2
 s885:  S1 :: muLB_gstore(gs1,t21,k2):1 SOS1_LB_gstore(gs1,t21,k2):2
 s886:  S1 :: muLB_gsin(gs1,t22,k0):1 SOS1_LB_gsin(gs1,t22,k0):2
 s887:  S1 :: muLB_gsout(gs1,t22,k0):1 SOS1_LB_gsout(gs1,t22,k0):2
 s888:  S1 :: muLB_gstore(gs1,t22,k0):1 SOS1_LB_gstore(gs1,t22,k0):2
 s889:  S1 :: muLB_gsin(gs1,t22,k1):1 SOS1_LB_gsin(gs1,t22,k1):2
 s890:  S1 :: muLB_gsout(gs1,t22,k1):1 SOS1_LB_gsout(gs1,t22,k1):2
 s891:  S1 :: muLB_gstore(gs1,t22,k1):1 SOS1_LB_gstore(gs1,t22,k1):2
 s892:  S1 :: muLB_gsin(gs1,t22,k2):1 SOS1_LB_gsin(gs1,t22,k2):2
 s893:  S1 :: muLB_gsout(gs1,t22,k2):1 SOS1_LB_gsout(gs1,t22,k2):2
 s894:  S1 :: muLB_gstore(gs1,t22,k2):1 SOS1_LB_gstore(gs1,t22,k2):2
 s895:  S1 :: muLB_gsin(gs1,t23,k0):1 SOS1_LB_gsin(gs1,t23,k0):2
 s896:  S1 :: muLB_gsout(gs1,t23,k0):1 SOS1_LB_gsout(gs1,t23,k0):2
 s897:  S1 :: muLB_gstore(gs1,t23,k0):1 SOS1_LB_gstore(gs1,t23,k0):2
 s898:  S1 :: muLB_gsin(gs1,t23,k1):1 SOS1_LB_gsin(gs1,t23,k1):2
 s899:  S1 :: muLB_gsout(gs1,t23,k1):1 SOS1_LB_gsout(gs1,t23,k1):2
 s900:  S1 :: muLB_gstore(gs1,t23,k1):1 SOS1_LB_gstore(gs1,t23,k1):2
 s901:  S1 :: muLB_gsin(gs1,t23,k2):1 SOS1_LB_gsin(gs1,t23,k2):2
 s902:  S1 :: muLB_gsout(gs1,t23,k2):1 SOS1_LB_gsout(gs1,t23,k2):2
 s903:  S1 :: muLB_gstore(gs1,t23,k2):1 SOS1_LB_gstore(gs1,t23,k2):2
 s904:  S1 :: muLB_gsin(gs1,t24,k0):1 SOS1_LB_gsin(gs1,t24,k0):2
 s905:  S1 :: muLB_gsout(gs1,t24,k0):1 SOS1_LB_gsout(gs1,t24,k0):2
 s906:  S1 :: muLB_gstore(gs1,t24,k0):1 SOS1_LB_gstore(gs1,t24,k0):2
 s907:  S1 :: muLB_gsin(gs1,t24,k1):1 SOS1_LB_gsin(gs1,t24,k1):2
 s908:  S1 :: muLB_gsout(gs1,t24,k1):1 SOS1_LB_gsout(gs1,t24,k1):2
 s909:  S1 :: muLB_gstore(gs1,t24,k1):1 SOS1_LB_gstore(gs1,t24,k1):2
 s910:  S1 :: muLB_gsin(gs1,t24,k2):1 SOS1_LB_gsin(gs1,t24,k2):2
 s911:  S1 :: muLB_gsout(gs1,t24,k2):1 SOS1_LB_gsout(gs1,t24,k2):2
 s912:  S1 :: muLB_gstore(gs1,t24,k2):1 SOS1_LB_gstore(gs1,t24,k2):2
End
