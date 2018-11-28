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
   + qout_sr(('ng101','ng102'),k0,t1) = 400
 gas_balance_da(ng102,k1,t1): gshed_da(ng102,k1,t1)
   + qout_sr(('ng101','ng102'),k1,t1) = 400
 gas_balance_da(ng102,k2,t1): gshed_da(ng102,k2,t1)
   + qout_sr(('ng101','ng102'),k2,t1) = 400
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
   + qout_sr(('ng101','ng102'),k0,t2) = 400
 gas_balance_da(ng102,k1,t2): gshed_da(ng102,k1,t2)
   + qout_sr(('ng101','ng102'),k1,t2) = 400
 gas_balance_da(ng102,k2,t2): gshed_da(ng102,k2,t2)
   + qout_sr(('ng101','ng102'),k2,t2) = 400
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
   + qout_sr(('ng101','ng102'),k0,t3) = 400
 gas_balance_da(ng102,k1,t3): gshed_da(ng102,k1,t3)
   + qout_sr(('ng101','ng102'),k1,t3) = 400
 gas_balance_da(ng102,k2,t3): gshed_da(ng102,k2,t3)
   + qout_sr(('ng101','ng102'),k2,t3) = 400
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
   + qout_sr(('ng101','ng102'),k0,t4) = 428.28427128
 gas_balance_da(ng102,k1,t4): gshed_da(ng102,k1,t4)
   + qout_sr(('ng101','ng102'),k1,t4) = 428.28427128
 gas_balance_da(ng102,k2,t4): gshed_da(ng102,k2,t4)
   + qout_sr(('ng101','ng102'),k2,t4) = 428.28427128
 gprod_max(gw1,k0,t1): gprod(gw1,k0,t1) <= 240
 gprod_max(gw1,k0,t2): gprod(gw1,k0,t2) <= 240
 gprod_max(gw1,k0,t3): gprod(gw1,k0,t3) <= 240
 gprod_max(gw1,k0,t4): gprod(gw1,k0,t4) <= 240
 gprod_max(gw1,k1,t1): gprod(gw1,k1,t1) <= 240
 gprod_max(gw1,k1,t2): gprod(gw1,k1,t2) <= 240
 gprod_max(gw1,k1,t3): gprod(gw1,k1,t3) <= 240
 gprod_max(gw1,k1,t4): gprod(gw1,k1,t4) <= 240
 gprod_max(gw1,k2,t1): gprod(gw1,k2,t1) <= 240
 gprod_max(gw1,k2,t2): gprod(gw1,k2,t2) <= 240
 gprod_max(gw1,k2,t3): gprod(gw1,k2,t3) <= 240
 gprod_max(gw1,k2,t4): gprod(gw1,k2,t4) <= 240
 gprod_max(gw2,k0,t1): gprod(gw2,k0,t1) <= 144
 gprod_max(gw2,k0,t2): gprod(gw2,k0,t2) <= 144
 gprod_max(gw2,k0,t3): gprod(gw2,k0,t3) <= 144
 gprod_max(gw2,k0,t4): gprod(gw2,k0,t4) <= 144
 gprod_max(gw2,k1,t1): gprod(gw2,k1,t1) <= 144
 gprod_max(gw2,k1,t2): gprod(gw2,k1,t2) <= 144
 gprod_max(gw2,k1,t3): gprod(gw2,k1,t3) <= 144
 gprod_max(gw2,k1,t4): gprod(gw2,k1,t4) <= 144
 gprod_max(gw2,k2,t1): gprod(gw2,k2,t1) <= 144
 gprod_max(gw2,k2,t2): gprod(gw2,k2,t2) <= 144
 gprod_max(gw2,k2,t3): gprod(gw2,k2,t3) <= 144
 gprod_max(gw2,k2,t4): gprod(gw2,k2,t4) <= 144
 gprod_max(gw3,k0,t1): gprod(gw3,k0,t1) <= 3000
 gprod_max(gw3,k0,t2): gprod(gw3,k0,t2) <= 3000
 gprod_max(gw3,k0,t3): gprod(gw3,k0,t3) <= 3000
 gprod_max(gw3,k0,t4): gprod(gw3,k0,t4) <= 3000
 gprod_max(gw3,k1,t1): gprod(gw3,k1,t1) <= 3000
 gprod_max(gw3,k1,t2): gprod(gw3,k1,t2) <= 3000
 gprod_max(gw3,k1,t3): gprod(gw3,k1,t3) <= 3000
 gprod_max(gw3,k1,t4): gprod(gw3,k1,t4) <= 3000
 gprod_max(gw3,k2,t1): gprod(gw3,k2,t1) <= 3000
 gprod_max(gw3,k2,t2): gprod(gw3,k2,t2) <= 3000
 gprod_max(gw3,k2,t3): gprod(gw3,k2,t3) <= 3000
 gprod_max(gw3,k2,t4): gprod(gw3,k2,t4) <= 3000
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
   = 240
 SOS1_gprod_max(gw1,k0,t2): gprod(gw1,k0,t2) + SOS1_gprod_max(gw1,k0,t2)
   = 240
 SOS1_gprod_max(gw1,k0,t3): gprod(gw1,k0,t3) + SOS1_gprod_max(gw1,k0,t3)
   = 240
 SOS1_gprod_max(gw1,k0,t4): gprod(gw1,k0,t4) + SOS1_gprod_max(gw1,k0,t4)
   = 240
 SOS1_gprod_max(gw1,k1,t1): gprod(gw1,k1,t1) + SOS1_gprod_max(gw1,k1,t1)
   = 240
 SOS1_gprod_max(gw1,k1,t2): gprod(gw1,k1,t2) + SOS1_gprod_max(gw1,k1,t2)
   = 240
 SOS1_gprod_max(gw1,k1,t3): gprod(gw1,k1,t3) + SOS1_gprod_max(gw1,k1,t3)
   = 240
 SOS1_gprod_max(gw1,k1,t4): gprod(gw1,k1,t4) + SOS1_gprod_max(gw1,k1,t4)
   = 240
 SOS1_gprod_max(gw1,k2,t1): gprod(gw1,k2,t1) + SOS1_gprod_max(gw1,k2,t1)
   = 240
 SOS1_gprod_max(gw1,k2,t2): gprod(gw1,k2,t2) + SOS1_gprod_max(gw1,k2,t2)
   = 240
 SOS1_gprod_max(gw1,k2,t3): gprod(gw1,k2,t3) + SOS1_gprod_max(gw1,k2,t3)
   = 240
 SOS1_gprod_max(gw1,k2,t4): gprod(gw1,k2,t4) + SOS1_gprod_max(gw1,k2,t4)
   = 240
 SOS1_gprod_max(gw2,k0,t1): gprod(gw2,k0,t1) + SOS1_gprod_max(gw2,k0,t1)
   = 144
 SOS1_gprod_max(gw2,k0,t2): gprod(gw2,k0,t2) + SOS1_gprod_max(gw2,k0,t2)
   = 144
 SOS1_gprod_max(gw2,k0,t3): gprod(gw2,k0,t3) + SOS1_gprod_max(gw2,k0,t3)
   = 144
 SOS1_gprod_max(gw2,k0,t4): gprod(gw2,k0,t4) + SOS1_gprod_max(gw2,k0,t4)
   = 144
 SOS1_gprod_max(gw2,k1,t1): gprod(gw2,k1,t1) + SOS1_gprod_max(gw2,k1,t1)
   = 144
 SOS1_gprod_max(gw2,k1,t2): gprod(gw2,k1,t2) + SOS1_gprod_max(gw2,k1,t2)
   = 144
 SOS1_gprod_max(gw2,k1,t3): gprod(gw2,k1,t3) + SOS1_gprod_max(gw2,k1,t3)
   = 144
 SOS1_gprod_max(gw2,k1,t4): gprod(gw2,k1,t4) + SOS1_gprod_max(gw2,k1,t4)
   = 144
 SOS1_gprod_max(gw2,k2,t1): gprod(gw2,k2,t1) + SOS1_gprod_max(gw2,k2,t1)
   = 144
 SOS1_gprod_max(gw2,k2,t2): gprod(gw2,k2,t2) + SOS1_gprod_max(gw2,k2,t2)
   = 144
 SOS1_gprod_max(gw2,k2,t3): gprod(gw2,k2,t3) + SOS1_gprod_max(gw2,k2,t3)
   = 144
 SOS1_gprod_max(gw2,k2,t4): gprod(gw2,k2,t4) + SOS1_gprod_max(gw2,k2,t4)
   = 144
 SOS1_gprod_max(gw3,k0,t1): gprod(gw3,k0,t1) + SOS1_gprod_max(gw3,k0,t1)
   = 3000
 SOS1_gprod_max(gw3,k0,t2): gprod(gw3,k0,t2) + SOS1_gprod_max(gw3,k0,t2)
   = 3000
 SOS1_gprod_max(gw3,k0,t3): gprod(gw3,k0,t3) + SOS1_gprod_max(gw3,k0,t3)
   = 3000
 SOS1_gprod_max(gw3,k0,t4): gprod(gw3,k0,t4) + SOS1_gprod_max(gw3,k0,t4)
   = 3000
 SOS1_gprod_max(gw3,k1,t1): gprod(gw3,k1,t1) + SOS1_gprod_max(gw3,k1,t1)
   = 3000
 SOS1_gprod_max(gw3,k1,t2): gprod(gw3,k1,t2) + SOS1_gprod_max(gw3,k1,t2)
   = 3000
 SOS1_gprod_max(gw3,k1,t3): gprod(gw3,k1,t3) + SOS1_gprod_max(gw3,k1,t3)
   = 3000
 SOS1_gprod_max(gw3,k1,t4): gprod(gw3,k1,t4) + SOS1_gprod_max(gw3,k1,t4)
   = 3000
 SOS1_gprod_max(gw3,k2,t1): gprod(gw3,k2,t1) + SOS1_gprod_max(gw3,k2,t1)
   = 3000
 SOS1_gprod_max(gw3,k2,t2): gprod(gw3,k2,t2) + SOS1_gprod_max(gw3,k2,t2)
   = 3000
 SOS1_gprod_max(gw3,k2,t3): gprod(gw3,k2,t3) + SOS1_gprod_max(gw3,k2,t3)
   = 3000
 SOS1_gprod_max(gw3,k2,t4): gprod(gw3,k2,t4) + SOS1_gprod_max(gw3,k2,t4)
   = 3000
 SOS1_gflow_sr_limit(('ng101','ng102'),k0,t1):
   gflow_sr(('ng101','ng102'),k0,t1)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k0,t1) = 10000
 SOS1_gflow_sr_limit(('ng101','ng102'),k1,t1):
   gflow_sr(('ng101','ng102'),k1,t1)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k1,t1) = 10000
 SOS1_gflow_sr_limit(('ng101','ng102'),k2,t1):
   gflow_sr(('ng101','ng102'),k2,t1)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k2,t1) = 10000
 SOS1_gflow_sr_limit(('ng101','ng102'),k0,t2):
   gflow_sr(('ng101','ng102'),k0,t2)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k0,t2) = 10000
 SOS1_gflow_sr_limit(('ng101','ng102'),k1,t2):
   gflow_sr(('ng101','ng102'),k1,t2)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k1,t2) = 10000
 SOS1_gflow_sr_limit(('ng101','ng102'),k2,t2):
   gflow_sr(('ng101','ng102'),k2,t2)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k2,t2) = 10000
 SOS1_gflow_sr_limit(('ng101','ng102'),k0,t3):
   gflow_sr(('ng101','ng102'),k0,t3)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k0,t3) = 10000
 SOS1_gflow_sr_limit(('ng101','ng102'),k1,t3):
   gflow_sr(('ng101','ng102'),k1,t3)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k1,t3) = 10000
 SOS1_gflow_sr_limit(('ng101','ng102'),k2,t3):
   gflow_sr(('ng101','ng102'),k2,t3)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k2,t3) = 10000
 SOS1_gflow_sr_limit(('ng101','ng102'),k0,t4):
   gflow_sr(('ng101','ng102'),k0,t4)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k0,t4) = 10000
 SOS1_gflow_sr_limit(('ng101','ng102'),k1,t4):
   gflow_sr(('ng101','ng102'),k1,t4)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k1,t4) = 10000
 SOS1_gflow_sr_limit(('ng101','ng102'),k2,t4):
   gflow_sr(('ng101','ng102'),k2,t4)
   + SOS1_gflow_sr_limit(('ng101','ng102'),k2,t4) = 10000
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
 dLag/gshed_da(ng101,k0,t1): mu_gshed_da_max(ng101,k0,t1)
   - lambda_gas_balance_da(ng101,k0,t1) - muLB_gshed_da(ng101,k0,t1)
   = -1000
 dLag/gshed_da(ng101,k1,t1): mu_gshed_da_max(ng101,k1,t1)
   - lambda_gas_balance_da(ng101,k1,t1) - muLB_gshed_da(ng101,k1,t1)
   = -1000
 dLag/gshed_da(ng101,k2,t1): mu_gshed_da_max(ng101,k2,t1)
   - lambda_gas_balance_da(ng101,k2,t1) - muLB_gshed_da(ng101,k2,t1)
   = -1000
 dLag/gshed_da(ng101,k0,t2): mu_gshed_da_max(ng101,k0,t2)
   - lambda_gas_balance_da(ng101,k0,t2) - muLB_gshed_da(ng101,k0,t2)
   = -1000
 dLag/gshed_da(ng101,k1,t2): mu_gshed_da_max(ng101,k1,t2)
   - lambda_gas_balance_da(ng101,k1,t2) - muLB_gshed_da(ng101,k1,t2)
   = -1000
 dLag/gshed_da(ng101,k2,t2): mu_gshed_da_max(ng101,k2,t2)
   - lambda_gas_balance_da(ng101,k2,t2) - muLB_gshed_da(ng101,k2,t2)
   = -1000
 dLag/gshed_da(ng101,k0,t3): mu_gshed_da_max(ng101,k0,t3)
   - lambda_gas_balance_da(ng101,k0,t3) - muLB_gshed_da(ng101,k0,t3)
   = -1000
 dLag/gshed_da(ng101,k1,t3): mu_gshed_da_max(ng101,k1,t3)
   - lambda_gas_balance_da(ng101,k1,t3) - muLB_gshed_da(ng101,k1,t3)
   = -1000
 dLag/gshed_da(ng101,k2,t3): mu_gshed_da_max(ng101,k2,t3)
   - lambda_gas_balance_da(ng101,k2,t3) - muLB_gshed_da(ng101,k2,t3)
   = -1000
 dLag/gshed_da(ng101,k0,t4): mu_gshed_da_max(ng101,k0,t4)
   - lambda_gas_balance_da(ng101,k0,t4) - muLB_gshed_da(ng101,k0,t4)
   = -1000
 dLag/gshed_da(ng101,k1,t4): mu_gshed_da_max(ng101,k1,t4)
   - lambda_gas_balance_da(ng101,k1,t4) - muLB_gshed_da(ng101,k1,t4)
   = -1000
 dLag/gshed_da(ng101,k2,t4): mu_gshed_da_max(ng101,k2,t4)
   - lambda_gas_balance_da(ng101,k2,t4) - muLB_gshed_da(ng101,k2,t4)
   = -1000
 dLag/gshed_da(ng102,k0,t1): mu_gshed_da_max(ng102,k0,t1)
   - lambda_gas_balance_da(ng102,k0,t1) - muLB_gshed_da(ng102,k0,t1)
   = -1000
 dLag/gshed_da(ng102,k1,t1): mu_gshed_da_max(ng102,k1,t1)
   - lambda_gas_balance_da(ng102,k1,t1) - muLB_gshed_da(ng102,k1,t1)
   = -1000
 dLag/gshed_da(ng102,k2,t1): mu_gshed_da_max(ng102,k2,t1)
   - lambda_gas_balance_da(ng102,k2,t1) - muLB_gshed_da(ng102,k2,t1)
   = -1000
 dLag/gshed_da(ng102,k0,t2): mu_gshed_da_max(ng102,k0,t2)
   - lambda_gas_balance_da(ng102,k0,t2) - muLB_gshed_da(ng102,k0,t2)
   = -1000
 dLag/gshed_da(ng102,k1,t2): mu_gshed_da_max(ng102,k1,t2)
   - lambda_gas_balance_da(ng102,k1,t2) - muLB_gshed_da(ng102,k1,t2)
   = -1000
 dLag/gshed_da(ng102,k2,t2): mu_gshed_da_max(ng102,k2,t2)
   - lambda_gas_balance_da(ng102,k2,t2) - muLB_gshed_da(ng102,k2,t2)
   = -1000
 dLag/gshed_da(ng102,k0,t3): mu_gshed_da_max(ng102,k0,t3)
   - lambda_gas_balance_da(ng102,k0,t3) - muLB_gshed_da(ng102,k0,t3)
   = -1000
 dLag/gshed_da(ng102,k1,t3): mu_gshed_da_max(ng102,k1,t3)
   - lambda_gas_balance_da(ng102,k1,t3) - muLB_gshed_da(ng102,k1,t3)
   = -1000
 dLag/gshed_da(ng102,k2,t3): mu_gshed_da_max(ng102,k2,t3)
   - lambda_gas_balance_da(ng102,k2,t3) - muLB_gshed_da(ng102,k2,t3)
   = -1000
 dLag/gshed_da(ng102,k0,t4): mu_gshed_da_max(ng102,k0,t4)
   - lambda_gas_balance_da(ng102,k0,t4) - muLB_gshed_da(ng102,k0,t4)
   = -1000
 dLag/gshed_da(ng102,k1,t4): mu_gshed_da_max(ng102,k1,t4)
   - lambda_gas_balance_da(ng102,k1,t4) - muLB_gshed_da(ng102,k1,t4)
   = -1000
 dLag/gshed_da(ng102,k2,t4): mu_gshed_da_max(ng102,k2,t4)
   - lambda_gas_balance_da(ng102,k2,t4) - muLB_gshed_da(ng102,k2,t4)
   = -1000
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
 s72:  S1 :: muLB_gshed_da(ng101,k0,t1):1 SOS1_LB_gshed_da(ng101,k0,t1):2
 s73:  S1 :: muLB_gshed_da(ng101,k1,t1):1 SOS1_LB_gshed_da(ng101,k1,t1):2
 s74:  S1 :: muLB_gshed_da(ng101,k2,t1):1 SOS1_LB_gshed_da(ng101,k2,t1):2
 s75:  S1 :: muLB_gshed_da(ng101,k0,t2):1 SOS1_LB_gshed_da(ng101,k0,t2):2
 s76:  S1 :: muLB_gshed_da(ng101,k1,t2):1 SOS1_LB_gshed_da(ng101,k1,t2):2
 s77:  S1 :: muLB_gshed_da(ng101,k2,t2):1 SOS1_LB_gshed_da(ng101,k2,t2):2
 s78:  S1 :: muLB_gshed_da(ng101,k0,t3):1 SOS1_LB_gshed_da(ng101,k0,t3):2
 s79:  S1 :: muLB_gshed_da(ng101,k1,t3):1 SOS1_LB_gshed_da(ng101,k1,t3):2
 s80:  S1 :: muLB_gshed_da(ng101,k2,t3):1 SOS1_LB_gshed_da(ng101,k2,t3):2
 s81:  S1 :: muLB_gshed_da(ng101,k0,t4):1 SOS1_LB_gshed_da(ng101,k0,t4):2
 s82:  S1 :: muLB_gshed_da(ng101,k1,t4):1 SOS1_LB_gshed_da(ng101,k1,t4):2
 s83:  S1 :: muLB_gshed_da(ng101,k2,t4):1 SOS1_LB_gshed_da(ng101,k2,t4):2
 s84:  S1 :: muLB_gshed_da(ng102,k0,t1):1 SOS1_LB_gshed_da(ng102,k0,t1):2
 s85:  S1 :: muLB_gshed_da(ng102,k1,t1):1 SOS1_LB_gshed_da(ng102,k1,t1):2
 s86:  S1 :: muLB_gshed_da(ng102,k2,t1):1 SOS1_LB_gshed_da(ng102,k2,t1):2
 s87:  S1 :: muLB_gshed_da(ng102,k0,t2):1 SOS1_LB_gshed_da(ng102,k0,t2):2
 s88:  S1 :: muLB_gshed_da(ng102,k1,t2):1 SOS1_LB_gshed_da(ng102,k1,t2):2
 s89:  S1 :: muLB_gshed_da(ng102,k2,t2):1 SOS1_LB_gshed_da(ng102,k2,t2):2
 s90:  S1 :: muLB_gshed_da(ng102,k0,t3):1 SOS1_LB_gshed_da(ng102,k0,t3):2
 s91:  S1 :: muLB_gshed_da(ng102,k1,t3):1 SOS1_LB_gshed_da(ng102,k1,t3):2
 s92:  S1 :: muLB_gshed_da(ng102,k2,t3):1 SOS1_LB_gshed_da(ng102,k2,t3):2
 s93:  S1 :: muLB_gshed_da(ng102,k0,t4):1 SOS1_LB_gshed_da(ng102,k0,t4):2
 s94:  S1 :: muLB_gshed_da(ng102,k1,t4):1 SOS1_LB_gshed_da(ng102,k1,t4):2
 s95:  S1 :: muLB_gshed_da(ng102,k2,t4):1 SOS1_LB_gshed_da(ng102,k2,t4):2
 s96:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t1):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t1):2
 s97:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t1):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t1):2
 s98:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t1):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t1):2
 s99:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t2):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t2):2
 s100:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t2):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t2):2
 s101:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t2):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t2):2
 s102:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t3):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t3):2
 s103:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t3):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t3):2
 s104:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t3):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t3):2
 s105:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t4):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t4):2
 s106:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t4):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t4):2
 s107:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t4):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t4):2
 s108:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t1):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t1):2
 s109:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t1):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t1):2
 s110:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t1):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t1):2
 s111:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t1):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t1):2
 s112:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t1):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t1):2
 s113:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t1):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t1):2
 s114:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t2):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t2):2
 s115:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t2):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t2):2
 s116:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t2):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t2):2
 s117:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t2):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t2):2
 s118:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t2):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t2):2
 s119:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t2):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t2):2
 s120:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t3):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t3):2
 s121:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t3):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t3):2
 s122:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t3):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t3):2
 s123:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t3):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t3):2
 s124:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t3):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t3):2
 s125:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t3):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t3):2
 s126:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t4):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t4):2
 s127:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t4):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t4):2
 s128:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t4):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t4):2
 s129:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t4):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t4):2
 s130:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t4):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t4):2
 s131:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t4):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t4):2
 s132:  S1 :: muLB_gprod(gw1,k0,t1):1 SOS1_LB_gprod(gw1,k0,t1):2
 s133:  S1 :: muLB_gprod(gw1,k1,t1):1 SOS1_LB_gprod(gw1,k1,t1):2
 s134:  S1 :: muLB_gprod(gw1,k2,t1):1 SOS1_LB_gprod(gw1,k2,t1):2
 s135:  S1 :: muLB_gprod(gw1,k0,t2):1 SOS1_LB_gprod(gw1,k0,t2):2
 s136:  S1 :: muLB_gprod(gw1,k1,t2):1 SOS1_LB_gprod(gw1,k1,t2):2
 s137:  S1 :: muLB_gprod(gw1,k2,t2):1 SOS1_LB_gprod(gw1,k2,t2):2
 s138:  S1 :: muLB_gprod(gw1,k0,t3):1 SOS1_LB_gprod(gw1,k0,t3):2
 s139:  S1 :: muLB_gprod(gw1,k1,t3):1 SOS1_LB_gprod(gw1,k1,t3):2
 s140:  S1 :: muLB_gprod(gw1,k2,t3):1 SOS1_LB_gprod(gw1,k2,t3):2
 s141:  S1 :: muLB_gprod(gw1,k0,t4):1 SOS1_LB_gprod(gw1,k0,t4):2
 s142:  S1 :: muLB_gprod(gw1,k1,t4):1 SOS1_LB_gprod(gw1,k1,t4):2
 s143:  S1 :: muLB_gprod(gw1,k2,t4):1 SOS1_LB_gprod(gw1,k2,t4):2
 s144:  S1 :: muLB_gprod(gw2,k0,t1):1 SOS1_LB_gprod(gw2,k0,t1):2
 s145:  S1 :: muLB_gprod(gw2,k1,t1):1 SOS1_LB_gprod(gw2,k1,t1):2
 s146:  S1 :: muLB_gprod(gw2,k2,t1):1 SOS1_LB_gprod(gw2,k2,t1):2
 s147:  S1 :: muLB_gprod(gw2,k0,t2):1 SOS1_LB_gprod(gw2,k0,t2):2
 s148:  S1 :: muLB_gprod(gw2,k1,t2):1 SOS1_LB_gprod(gw2,k1,t2):2
 s149:  S1 :: muLB_gprod(gw2,k2,t2):1 SOS1_LB_gprod(gw2,k2,t2):2
 s150:  S1 :: muLB_gprod(gw2,k0,t3):1 SOS1_LB_gprod(gw2,k0,t3):2
 s151:  S1 :: muLB_gprod(gw2,k1,t3):1 SOS1_LB_gprod(gw2,k1,t3):2
 s152:  S1 :: muLB_gprod(gw2,k2,t3):1 SOS1_LB_gprod(gw2,k2,t3):2
 s153:  S1 :: muLB_gprod(gw2,k0,t4):1 SOS1_LB_gprod(gw2,k0,t4):2
 s154:  S1 :: muLB_gprod(gw2,k1,t4):1 SOS1_LB_gprod(gw2,k1,t4):2
 s155:  S1 :: muLB_gprod(gw2,k2,t4):1 SOS1_LB_gprod(gw2,k2,t4):2
 s156:  S1 :: muLB_gprod(gw3,k0,t1):1 SOS1_LB_gprod(gw3,k0,t1):2
 s157:  S1 :: muLB_gprod(gw3,k1,t1):1 SOS1_LB_gprod(gw3,k1,t1):2
 s158:  S1 :: muLB_gprod(gw3,k2,t1):1 SOS1_LB_gprod(gw3,k2,t1):2
 s159:  S1 :: muLB_gprod(gw3,k0,t2):1 SOS1_LB_gprod(gw3,k0,t2):2
 s160:  S1 :: muLB_gprod(gw3,k1,t2):1 SOS1_LB_gprod(gw3,k1,t2):2
 s161:  S1 :: muLB_gprod(gw3,k2,t2):1 SOS1_LB_gprod(gw3,k2,t2):2
 s162:  S1 :: muLB_gprod(gw3,k0,t3):1 SOS1_LB_gprod(gw3,k0,t3):2
 s163:  S1 :: muLB_gprod(gw3,k1,t3):1 SOS1_LB_gprod(gw3,k1,t3):2
 s164:  S1 :: muLB_gprod(gw3,k2,t3):1 SOS1_LB_gprod(gw3,k2,t3):2
 s165:  S1 :: muLB_gprod(gw3,k0,t4):1 SOS1_LB_gprod(gw3,k0,t4):2
 s166:  S1 :: muLB_gprod(gw3,k1,t4):1 SOS1_LB_gprod(gw3,k1,t4):2
 s167:  S1 :: muLB_gprod(gw3,k2,t4):1 SOS1_LB_gprod(gw3,k2,t4):2
End
