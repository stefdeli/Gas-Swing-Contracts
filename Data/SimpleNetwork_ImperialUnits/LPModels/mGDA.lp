\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  1000 gshed_da(ng101,k0,t1) + 1000 gshed_da(ng101,k1,t1)
   + 1000 gshed_da(ng101,k2,t1) + 1000 gshed_da(ng101,k0,t2)
   + 1000 gshed_da(ng101,k1,t2) + 1000 gshed_da(ng101,k2,t2)
   + 1000 gshed_da(ng101,k0,t3) + 1000 gshed_da(ng101,k1,t3)
   + 1000 gshed_da(ng101,k2,t3) + 1000 gshed_da(ng101,k0,t4)
   + 1000 gshed_da(ng101,k1,t4) + 1000 gshed_da(ng101,k2,t4)
   + 1000 gshed_da(ng102,k0,t1) + 1000 gshed_da(ng102,k1,t1)
   + 1000 gshed_da(ng102,k2,t1) + 1000 gshed_da(ng102,k0,t2)
   + 1000 gshed_da(ng102,k1,t2) + 1000 gshed_da(ng102,k2,t2)
   + 1000 gshed_da(ng102,k0,t3) + 1000 gshed_da(ng102,k1,t3)
   + 1000 gshed_da(ng102,k2,t3) + 1000 gshed_da(ng102,k0,t4)
   + 1000 gshed_da(ng102,k1,t4) + 1000 gshed_da(ng102,k2,t4)
   + 2 gprod(gw1,k0,t1) + 2 gprod(gw1,k0,t2) + 2 gprod(gw1,k0,t3)
   + 2 gprod(gw1,k0,t4) + 3 gprod(gw2,k0,t1) + 3 gprod(gw2,k0,t2)
   + 3 gprod(gw2,k0,t3) + 3 gprod(gw2,k0,t4) + 4 gprod(gw3,k0,t1)
   + 4 gprod(gw3,k0,t2) + 4 gprod(gw3,k0,t3) + 4 gprod(gw3,k0,t4)
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
 gas_balance_da(ng101,k0,t1): gshed_da(ng101,k0,t1)
   - qin_sr(('ng101','ng102'),k0,t1) + gprod(gw1,k0,t1) + gprod(gw2,k0,t1)
   + gprod(gw3,k0,t1) = 0
 gas_balance_da(ng101,k1,t1): gshed_da(ng101,k1,t1)
   - qin_sr(('ng101','ng102'),k1,t1) + gprod(gw1,k1,t1) + gprod(gw2,k1,t1)
   + gprod(gw3,k1,t1) = 0
 gas_balance_da(ng101,k2,t1): gshed_da(ng101,k2,t1)
   - qin_sr(('ng101','ng102'),k2,t1) + gprod(gw1,k2,t1) + gprod(gw2,k2,t1)
   + gprod(gw3,k2,t1) = 0
 gas_balance_da(ng102,k0,t1): gshed_da(ng102,k0,t1)
   + qout_sr(('ng101','ng102'),k0,t1) = 328
 gas_balance_da(ng102,k1,t1): gshed_da(ng102,k1,t1)
   + qout_sr(('ng101','ng102'),k1,t1) = 328
 gas_balance_da(ng102,k2,t1): gshed_da(ng102,k2,t1)
   + qout_sr(('ng101','ng102'),k2,t1) = 328
 gas_balance_da(ng101,k0,t2): gshed_da(ng101,k0,t2)
   - qin_sr(('ng101','ng102'),k0,t2) + gprod(gw1,k0,t2) + gprod(gw2,k0,t2)
   + gprod(gw3,k0,t2) = 0
 gas_balance_da(ng101,k1,t2): gshed_da(ng101,k1,t2)
   - qin_sr(('ng101','ng102'),k1,t2) + gprod(gw1,k1,t2) + gprod(gw2,k1,t2)
   + gprod(gw3,k1,t2) = 0
 gas_balance_da(ng101,k2,t2): gshed_da(ng101,k2,t2)
   - qin_sr(('ng101','ng102'),k2,t2) + gprod(gw1,k2,t2) + gprod(gw2,k2,t2)
   + gprod(gw3,k2,t2) = 0
 gas_balance_da(ng102,k0,t2): gshed_da(ng102,k0,t2)
   + qout_sr(('ng101','ng102'),k0,t2) = 338.35276184
 gas_balance_da(ng102,k1,t2): gshed_da(ng102,k1,t2)
   + qout_sr(('ng101','ng102'),k1,t2) = 338.35276184
 gas_balance_da(ng102,k2,t2): gshed_da(ng102,k2,t2)
   + qout_sr(('ng101','ng102'),k2,t2) = 338.35276184
 gas_balance_da(ng101,k0,t3): gshed_da(ng101,k0,t3)
   - qin_sr(('ng101','ng102'),k0,t3) + gprod(gw1,k0,t3) + gprod(gw2,k0,t3)
   + gprod(gw3,k0,t3) = 0
 gas_balance_da(ng101,k1,t3): gshed_da(ng101,k1,t3)
   - qin_sr(('ng101','ng102'),k1,t3) + gprod(gw1,k1,t3) + gprod(gw2,k1,t3)
   + gprod(gw3,k1,t3) = 0
 gas_balance_da(ng101,k2,t3): gshed_da(ng101,k2,t3)
   - qin_sr(('ng101','ng102'),k2,t3) + gprod(gw1,k2,t3) + gprod(gw2,k2,t3)
   + gprod(gw3,k2,t3) = 0
 gas_balance_da(ng102,k0,t3): gshed_da(ng102,k0,t3)
   + qout_sr(('ng101','ng102'),k0,t3) = 348
 gas_balance_da(ng102,k1,t3): gshed_da(ng102,k1,t3)
   + qout_sr(('ng101','ng102'),k1,t3) = 348
 gas_balance_da(ng102,k2,t3): gshed_da(ng102,k2,t3)
   + qout_sr(('ng101','ng102'),k2,t3) = 348
 gas_balance_da(ng101,k0,t4): gshed_da(ng101,k0,t4)
   - qin_sr(('ng101','ng102'),k0,t4) + gprod(gw1,k0,t4) + gprod(gw2,k0,t4)
   + gprod(gw3,k0,t4) = 0
 gas_balance_da(ng101,k1,t4): gshed_da(ng101,k1,t4)
   - qin_sr(('ng101','ng102'),k1,t4) + gprod(gw1,k1,t4) + gprod(gw2,k1,t4)
   + gprod(gw3,k1,t4) = 0
 gas_balance_da(ng101,k2,t4): gshed_da(ng101,k2,t4)
   - qin_sr(('ng101','ng102'),k2,t4) + gprod(gw1,k2,t4) + gprod(gw2,k2,t4)
   + gprod(gw3,k2,t4) = 0
 gas_balance_da(ng102,k0,t4): gshed_da(ng102,k0,t4)
   + qout_sr(('ng101','ng102'),k0,t4) = 356.28427128
 gas_balance_da(ng102,k1,t4): gshed_da(ng102,k1,t4)
   + qout_sr(('ng101','ng102'),k1,t4) = 356.28427128
 gas_balance_da(ng102,k2,t4): gshed_da(ng102,k2,t4)
   + qout_sr(('ng101','ng102'),k2,t4) = 356.28427128
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
 gprod_max(gw2,k0,t1): gprod(gw2,k0,t1) <= 200
 gprod_max(gw2,k0,t2): gprod(gw2,k0,t2) <= 200
 gprod_max(gw2,k0,t3): gprod(gw2,k0,t3) <= 200
 gprod_max(gw2,k0,t4): gprod(gw2,k0,t4) <= 200
 gprod_max(gw2,k1,t1): gprod(gw2,k1,t1) <= 200
 gprod_max(gw2,k1,t2): gprod(gw2,k1,t2) <= 200
 gprod_max(gw2,k1,t3): gprod(gw2,k1,t3) <= 200
 gprod_max(gw2,k1,t4): gprod(gw2,k1,t4) <= 200
 gprod_max(gw2,k2,t1): gprod(gw2,k2,t1) <= 200
 gprod_max(gw2,k2,t2): gprod(gw2,k2,t2) <= 200
 gprod_max(gw2,k2,t3): gprod(gw2,k2,t3) <= 200
 gprod_max(gw2,k2,t4): gprod(gw2,k2,t4) <= 200
 gprod_max(gw3,k0,t1): gprod(gw3,k0,t1) <= 1000
 gprod_max(gw3,k0,t2): gprod(gw3,k0,t2) <= 1000
 gprod_max(gw3,k0,t3): gprod(gw3,k0,t3) <= 1000
 gprod_max(gw3,k0,t4): gprod(gw3,k0,t4) <= 1000
 gprod_max(gw3,k1,t1): gprod(gw3,k1,t1) <= 1000
 gprod_max(gw3,k1,t2): gprod(gw3,k1,t2) <= 1000
 gprod_max(gw3,k1,t3): gprod(gw3,k1,t3) <= 1000
 gprod_max(gw3,k1,t4): gprod(gw3,k1,t4) <= 1000
 gprod_max(gw3,k2,t1): gprod(gw3,k2,t1) <= 1000
 gprod_max(gw3,k2,t2): gprod(gw3,k2,t2) <= 1000
 gprod_max(gw3,k2,t3): gprod(gw3,k2,t3) <= 1000
 gprod_max(gw3,k2,t4): gprod(gw3,k2,t4) <= 1000
 gflow_sr_io(('ng101','ng102'),k0,t1): gflow_sr(('ng101','ng102'),k0,t1)
   - 0.5 qin_sr(('ng101','ng102'),k0,t1)
   - 0.5 qout_sr(('ng101','ng102'),k0,t1) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t1): gflow_sr(('ng101','ng102'),k0,t1)
   <= 10000
 Flow_Bal(('ng101','ng102'),k0,t1): qin_sr(('ng101','ng102'),k0,t1)
   - qout_sr(('ng101','ng102'),k0,t1) = 0
 gflow_sr_io(('ng101','ng102'),k1,t1): gflow_sr(('ng101','ng102'),k1,t1)
   - 0.5 qin_sr(('ng101','ng102'),k1,t1)
   - 0.5 qout_sr(('ng101','ng102'),k1,t1) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t1): gflow_sr(('ng101','ng102'),k1,t1)
   <= 10000
 Flow_Bal(('ng101','ng102'),k1,t1): qin_sr(('ng101','ng102'),k1,t1)
   - qout_sr(('ng101','ng102'),k1,t1) = 0
 gflow_sr_io(('ng101','ng102'),k2,t1): gflow_sr(('ng101','ng102'),k2,t1)
   - 0.5 qin_sr(('ng101','ng102'),k2,t1)
   - 0.5 qout_sr(('ng101','ng102'),k2,t1) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t1): gflow_sr(('ng101','ng102'),k2,t1)
   <= 10000
 Flow_Bal(('ng101','ng102'),k2,t1): qin_sr(('ng101','ng102'),k2,t1)
   - qout_sr(('ng101','ng102'),k2,t1) = 0
 gflow_sr_io(('ng101','ng102'),k0,t2): gflow_sr(('ng101','ng102'),k0,t2)
   - 0.5 qin_sr(('ng101','ng102'),k0,t2)
   - 0.5 qout_sr(('ng101','ng102'),k0,t2) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t2): gflow_sr(('ng101','ng102'),k0,t2)
   <= 10000
 Flow_Bal(('ng101','ng102'),k0,t2): qin_sr(('ng101','ng102'),k0,t2)
   - qout_sr(('ng101','ng102'),k0,t2) = 0
 gflow_sr_io(('ng101','ng102'),k1,t2): gflow_sr(('ng101','ng102'),k1,t2)
   - 0.5 qin_sr(('ng101','ng102'),k1,t2)
   - 0.5 qout_sr(('ng101','ng102'),k1,t2) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t2): gflow_sr(('ng101','ng102'),k1,t2)
   <= 10000
 Flow_Bal(('ng101','ng102'),k1,t2): qin_sr(('ng101','ng102'),k1,t2)
   - qout_sr(('ng101','ng102'),k1,t2) = 0
 gflow_sr_io(('ng101','ng102'),k2,t2): gflow_sr(('ng101','ng102'),k2,t2)
   - 0.5 qin_sr(('ng101','ng102'),k2,t2)
   - 0.5 qout_sr(('ng101','ng102'),k2,t2) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t2): gflow_sr(('ng101','ng102'),k2,t2)
   <= 10000
 Flow_Bal(('ng101','ng102'),k2,t2): qin_sr(('ng101','ng102'),k2,t2)
   - qout_sr(('ng101','ng102'),k2,t2) = 0
 gflow_sr_io(('ng101','ng102'),k0,t3): gflow_sr(('ng101','ng102'),k0,t3)
   - 0.5 qin_sr(('ng101','ng102'),k0,t3)
   - 0.5 qout_sr(('ng101','ng102'),k0,t3) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t3): gflow_sr(('ng101','ng102'),k0,t3)
   <= 10000
 Flow_Bal(('ng101','ng102'),k0,t3): qin_sr(('ng101','ng102'),k0,t3)
   - qout_sr(('ng101','ng102'),k0,t3) = 0
 gflow_sr_io(('ng101','ng102'),k1,t3): gflow_sr(('ng101','ng102'),k1,t3)
   - 0.5 qin_sr(('ng101','ng102'),k1,t3)
   - 0.5 qout_sr(('ng101','ng102'),k1,t3) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t3): gflow_sr(('ng101','ng102'),k1,t3)
   <= 10000
 Flow_Bal(('ng101','ng102'),k1,t3): qin_sr(('ng101','ng102'),k1,t3)
   - qout_sr(('ng101','ng102'),k1,t3) = 0
 gflow_sr_io(('ng101','ng102'),k2,t3): gflow_sr(('ng101','ng102'),k2,t3)
   - 0.5 qin_sr(('ng101','ng102'),k2,t3)
   - 0.5 qout_sr(('ng101','ng102'),k2,t3) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t3): gflow_sr(('ng101','ng102'),k2,t3)
   <= 10000
 Flow_Bal(('ng101','ng102'),k2,t3): qin_sr(('ng101','ng102'),k2,t3)
   - qout_sr(('ng101','ng102'),k2,t3) = 0
 gflow_sr_io(('ng101','ng102'),k0,t4): gflow_sr(('ng101','ng102'),k0,t4)
   - 0.5 qin_sr(('ng101','ng102'),k0,t4)
   - 0.5 qout_sr(('ng101','ng102'),k0,t4) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t4): gflow_sr(('ng101','ng102'),k0,t4)
   <= 10000
 Flow_Bal(('ng101','ng102'),k0,t4): qin_sr(('ng101','ng102'),k0,t4)
   - qout_sr(('ng101','ng102'),k0,t4) = 0
 gflow_sr_io(('ng101','ng102'),k1,t4): gflow_sr(('ng101','ng102'),k1,t4)
   - 0.5 qin_sr(('ng101','ng102'),k1,t4)
   - 0.5 qout_sr(('ng101','ng102'),k1,t4) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t4): gflow_sr(('ng101','ng102'),k1,t4)
   <= 10000
 Flow_Bal(('ng101','ng102'),k1,t4): qin_sr(('ng101','ng102'),k1,t4)
   - qout_sr(('ng101','ng102'),k1,t4) = 0
 gflow_sr_io(('ng101','ng102'),k2,t4): gflow_sr(('ng101','ng102'),k2,t4)
   - 0.5 qin_sr(('ng101','ng102'),k2,t4)
   - 0.5 qout_sr(('ng101','ng102'),k2,t4) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t4): gflow_sr(('ng101','ng102'),k2,t4)
   <= 10000
 Flow_Bal(('ng101','ng102'),k2,t4): qin_sr(('ng101','ng102'),k2,t4)
   - qout_sr(('ng101','ng102'),k2,t4) = 0
Bounds
End
