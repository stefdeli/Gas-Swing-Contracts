\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  5000 gshed(ng101,s1,t1) + 5000 gshed(ng102,s1,t1)
   + 1.05 gprodUp(gw1,s1,t1) - 0.99 gprodDn(gw1,s1,t1)
   + 1.575 gprodUp(gw2,s1,t1) - 1.485 gprodDn(gw2,s1,t1)
   + 2.1 gprodUp(gw3,s1,t1) - 1.98 gprodDn(gw3,s1,t1)
   + 5000 gshed(ng101,s1,t2) + 5000 gshed(ng102,s1,t2)
   + 1.05 gprodUp(gw1,s1,t2) - 0.99 gprodDn(gw1,s1,t2)
   + 1.575 gprodUp(gw2,s1,t2) - 1.485 gprodDn(gw2,s1,t2)
   + 2.1 gprodUp(gw3,s1,t2) - 1.98 gprodDn(gw3,s1,t2)
   + 5000 gshed(ng101,s1,t3) + 5000 gshed(ng102,s1,t3)
   + 1.05 gprodUp(gw1,s1,t3) - 0.99 gprodDn(gw1,s1,t3)
   + 1.575 gprodUp(gw2,s1,t3) - 1.485 gprodDn(gw2,s1,t3)
   + 2.1 gprodUp(gw3,s1,t3) - 1.98 gprodDn(gw3,s1,t3)
   + 5000 gshed(ng101,s1,t4) + 5000 gshed(ng102,s1,t4)
   + 1.05 gprodUp(gw1,s1,t4) - 0.99 gprodDn(gw1,s1,t4)
   + 1.575 gprodUp(gw2,s1,t4) - 1.485 gprodDn(gw2,s1,t4)
   + 2.1 gprodUp(gw3,s1,t4) - 1.98 gprodDn(gw3,s1,t4)
   + 5000 gshed(ng101,s2,t1) + 5000 gshed(ng102,s2,t1)
   + 1.05 gprodUp(gw1,s2,t1) - 0.99 gprodDn(gw1,s2,t1)
   + 1.575 gprodUp(gw2,s2,t1) - 1.485 gprodDn(gw2,s2,t1)
   + 2.1 gprodUp(gw3,s2,t1) - 1.98 gprodDn(gw3,s2,t1)
   + 5000 gshed(ng101,s2,t2) + 5000 gshed(ng102,s2,t2)
   + 1.05 gprodUp(gw1,s2,t2) - 0.99 gprodDn(gw1,s2,t2)
   + 1.575 gprodUp(gw2,s2,t2) - 1.485 gprodDn(gw2,s2,t2)
   + 2.1 gprodUp(gw3,s2,t2) - 1.98 gprodDn(gw3,s2,t2)
   + 5000 gshed(ng101,s2,t3) + 5000 gshed(ng102,s2,t3)
   + 1.05 gprodUp(gw1,s2,t3) - 0.99 gprodDn(gw1,s2,t3)
   + 1.575 gprodUp(gw2,s2,t3) - 1.485 gprodDn(gw2,s2,t3)
   + 2.1 gprodUp(gw3,s2,t3) - 1.98 gprodDn(gw3,s2,t3)
   + 5000 gshed(ng101,s2,t4) + 5000 gshed(ng102,s2,t4)
   + 1.05 gprodUp(gw1,s2,t4) - 0.99 gprodDn(gw1,s2,t4)
   + 1.575 gprodUp(gw2,s2,t4) - 1.485 gprodDn(gw2,s2,t4)
   + 2.1 gprodUp(gw3,s2,t4) - 1.98 gprodDn(gw3,s2,t4)
Subject To
 gas_balance_rt(ng101,s1,t1): gshed(ng101,s1,t1)
   - qin_sr_rt(('ng101','ng102'),s1,t1) + gprodUp(gw1,s1,t1)
   - gprodDn(gw1,s1,t1) + gprodUp(gw2,s1,t1) - gprodDn(gw2,s1,t1)
   + gprodUp(gw3,s1,t1) - gprodDn(gw3,s1,t1) = -400
 gas_balance_rt(ng101,s1,t2): gshed(ng101,s1,t2)
   - qin_sr_rt(('ng101','ng102'),s1,t2) + gprodUp(gw1,s1,t2)
   - gprodDn(gw1,s1,t2) + gprodUp(gw2,s1,t2) - gprodDn(gw2,s1,t2)
   + gprodUp(gw3,s1,t2) - gprodDn(gw3,s1,t2) = -410.35276184
 gas_balance_rt(ng101,s1,t3): gshed(ng101,s1,t3)
   - qin_sr_rt(('ng101','ng102'),s1,t3) + gprodUp(gw1,s1,t3)
   - gprodDn(gw1,s1,t3) + gprodUp(gw2,s1,t3) - gprodDn(gw2,s1,t3)
   + gprodUp(gw3,s1,t3) - gprodDn(gw3,s1,t3) = -420
 gas_balance_rt(ng101,s1,t4): gshed(ng101,s1,t4)
   - qin_sr_rt(('ng101','ng102'),s1,t4) + gprodUp(gw1,s1,t4)
   - gprodDn(gw1,s1,t4) + gprodUp(gw2,s1,t4) - gprodDn(gw2,s1,t4)
   + gprodUp(gw3,s1,t4) - gprodDn(gw3,s1,t4) = -428.28427128
 gas_balance_rt(ng102,s1,t1): gshed(ng102,s1,t1)
   + qout_sr_rt(('ng101','ng102'),s1,t1) - gsin_rt(gs1,s1,t1)
   + gsout_rt(gs1,s1,t1) = 387.051604
 gas_balance_rt(ng102,s1,t2): gshed(ng102,s1,t2)
   + qout_sr_rt(('ng101','ng102'),s1,t2) - gsin_rt(gs1,s1,t2)
   + gsout_rt(gs1,s1,t2) = 397.8575628800001
 gas_balance_rt(ng102,s1,t3): gshed(ng102,s1,t3)
   + qout_sr_rt(('ng101','ng102'),s1,t3) - gsin_rt(gs1,s1,t3)
   + gsout_rt(gs1,s1,t3) = 407.51200392
 gas_balance_rt(ng102,s1,t4): gshed(ng102,s1,t4)
   + qout_sr_rt(('ng101','ng102'),s1,t4) - gsin_rt(gs1,s1,t4)
   + gsout_rt(gs1,s1,t4) = 418.38353568
 gas_balance_rt(ng101,s2,t1): gshed(ng101,s2,t1)
   - qin_sr_rt(('ng101','ng102'),s2,t1) + gprodUp(gw1,s2,t1)
   - gprodDn(gw1,s2,t1) + gprodUp(gw2,s2,t1) - gprodDn(gw2,s2,t1)
   + gprodUp(gw3,s2,t1) - gprodDn(gw3,s2,t1) = -400
 gas_balance_rt(ng101,s2,t2): gshed(ng101,s2,t2)
   - qin_sr_rt(('ng101','ng102'),s2,t2) + gprodUp(gw1,s2,t2)
   - gprodDn(gw1,s2,t2) + gprodUp(gw2,s2,t2) - gprodDn(gw2,s2,t2)
   + gprodUp(gw3,s2,t2) - gprodDn(gw3,s2,t2) = -410.35276184
 gas_balance_rt(ng101,s2,t3): gshed(ng101,s2,t3)
   - qin_sr_rt(('ng101','ng102'),s2,t3) + gprodUp(gw1,s2,t3)
   - gprodDn(gw1,s2,t3) + gprodUp(gw2,s2,t3) - gprodDn(gw2,s2,t3)
   + gprodUp(gw3,s2,t3) - gprodDn(gw3,s2,t3) = -420
 gas_balance_rt(ng101,s2,t4): gshed(ng101,s2,t4)
   - qin_sr_rt(('ng101','ng102'),s2,t4) + gprodUp(gw1,s2,t4)
   - gprodDn(gw1,s2,t4) + gprodUp(gw2,s2,t4) - gprodDn(gw2,s2,t4)
   + gprodUp(gw3,s2,t4) - gprodDn(gw3,s2,t4) = -428.28427128
 gas_balance_rt(ng102,s2,t1): gshed(ng102,s2,t1)
   + qout_sr_rt(('ng101','ng102'),s2,t1) - gsin_rt(gs1,s2,t1)
   + gsout_rt(gs1,s2,t1) = 290.83809376
 gas_balance_rt(ng102,s2,t2): gshed(ng102,s2,t2)
   + qout_sr_rt(('ng101','ng102'),s2,t2) - gsin_rt(gs1,s2,t2)
   + gsout_rt(gs1,s2,t2) = 297.2959616000001
 gas_balance_rt(ng102,s2,t3): gshed(ng102,s2,t3)
   + qout_sr_rt(('ng101','ng102'),s2,t3) - gsin_rt(gs1,s2,t3)
   + gsout_rt(gs1,s2,t3) = 343.42980624
 gas_balance_rt(ng102,s2,t4): gshed(ng102,s2,t4)
   + qout_sr_rt(('ng101','ng102'),s2,t4) - gsin_rt(gs1,s2,t4)
   + gsout_rt(gs1,s2,t4) = 346.32465792
 gflow_sr_io_rt(('ng101','ng102'),s1,t1):
   - gflow_sr_rt(('ng101','ng102'),s1,t1)
   + 0.5 qin_sr_rt(('ng101','ng102'),s1,t1)
   + 0.5 qout_sr_rt(('ng101','ng102'),s1,t1) = 0
 gflow_sr_limit_rt(('ng101','ng102'),s1,t1):
   gflow_sr_rt(('ng101','ng102'),s1,t1) <= 4000
 gflow_sr_io_rt(('ng101','ng102'),s2,t1):
   - gflow_sr_rt(('ng101','ng102'),s2,t1)
   + 0.5 qin_sr_rt(('ng101','ng102'),s2,t1)
   + 0.5 qout_sr_rt(('ng101','ng102'),s2,t1) = 0
 gflow_sr_limit_rt(('ng101','ng102'),s2,t1):
   gflow_sr_rt(('ng101','ng102'),s2,t1) <= 4000
 gflow_sr_io_rt(('ng101','ng102'),s1,t2):
   - gflow_sr_rt(('ng101','ng102'),s1,t2)
   + 0.5 qin_sr_rt(('ng101','ng102'),s1,t2)
   + 0.5 qout_sr_rt(('ng101','ng102'),s1,t2) = 0
 gflow_sr_limit_rt(('ng101','ng102'),s1,t2):
   gflow_sr_rt(('ng101','ng102'),s1,t2) <= 4000
 gflow_sr_io_rt(('ng101','ng102'),s2,t2):
   - gflow_sr_rt(('ng101','ng102'),s2,t2)
   + 0.5 qin_sr_rt(('ng101','ng102'),s2,t2)
   + 0.5 qout_sr_rt(('ng101','ng102'),s2,t2) = 0
 gflow_sr_limit_rt(('ng101','ng102'),s2,t2):
   gflow_sr_rt(('ng101','ng102'),s2,t2) <= 4000
 gflow_sr_io_rt(('ng101','ng102'),s1,t3):
   - gflow_sr_rt(('ng101','ng102'),s1,t3)
   + 0.5 qin_sr_rt(('ng101','ng102'),s1,t3)
   + 0.5 qout_sr_rt(('ng101','ng102'),s1,t3) = 0
 gflow_sr_limit_rt(('ng101','ng102'),s1,t3):
   gflow_sr_rt(('ng101','ng102'),s1,t3) <= 4000
 gflow_sr_io_rt(('ng101','ng102'),s2,t3):
   - gflow_sr_rt(('ng101','ng102'),s2,t3)
   + 0.5 qin_sr_rt(('ng101','ng102'),s2,t3)
   + 0.5 qout_sr_rt(('ng101','ng102'),s2,t3) = 0
 gflow_sr_limit_rt(('ng101','ng102'),s2,t3):
   gflow_sr_rt(('ng101','ng102'),s2,t3) <= 4000
 gflow_sr_io_rt(('ng101','ng102'),s1,t4):
   - gflow_sr_rt(('ng101','ng102'),s1,t4)
   + 0.5 qin_sr_rt(('ng101','ng102'),s1,t4)
   + 0.5 qout_sr_rt(('ng101','ng102'),s1,t4) = 0
 gflow_sr_limit_rt(('ng101','ng102'),s1,t4):
   gflow_sr_rt(('ng101','ng102'),s1,t4) <= 4000
 gflow_sr_io_rt(('ng101','ng102'),s2,t4):
   - gflow_sr_rt(('ng101','ng102'),s2,t4)
   + 0.5 qin_sr_rt(('ng101','ng102'),s2,t4)
   + 0.5 qout_sr_rt(('ng101','ng102'),s2,t4) = 0
 gflow_sr_limit_rt(('ng101','ng102'),s2,t4):
   gflow_sr_rt(('ng101','ng102'),s2,t4) <= 4000
 gprodUp_max(gw1,s1,t1): gprodUp(gw1,s1,t1) <= 0
 gprodDn_max(gw1,s1,t1): gprodDn(gw1,s1,t1) <= 100
 gprodUp_max(gw1,s1,t2): gprodUp(gw1,s1,t2) <= 0
 gprodDn_max(gw1,s1,t2): gprodDn(gw1,s1,t2) <= 100
 gprodUp_max(gw1,s1,t3): gprodUp(gw1,s1,t3) <= 0
 gprodDn_max(gw1,s1,t3): gprodDn(gw1,s1,t3) <= 100
 gprodUp_max(gw1,s1,t4): gprodUp(gw1,s1,t4) <= 0
 gprodDn_max(gw1,s1,t4): gprodDn(gw1,s1,t4) <= 100
 gprodUp_max(gw1,s2,t1): gprodUp(gw1,s2,t1) <= 0
 gprodDn_max(gw1,s2,t1): gprodDn(gw1,s2,t1) <= 100
 gprodUp_max(gw1,s2,t2): gprodUp(gw1,s2,t2) <= 0
 gprodDn_max(gw1,s2,t2): gprodDn(gw1,s2,t2) <= 100
 gprodUp_max(gw1,s2,t3): gprodUp(gw1,s2,t3) <= 0
 gprodDn_max(gw1,s2,t3): gprodDn(gw1,s2,t3) <= 100
 gprodUp_max(gw1,s2,t4): gprodUp(gw1,s2,t4) <= 0
 gprodDn_max(gw1,s2,t4): gprodDn(gw1,s2,t4) <= 100
 gprodUp_max(gw2,s1,t1): gprodUp(gw2,s1,t1) <= 0
 gprodDn_max(gw2,s1,t1): gprodDn(gw2,s1,t1) <= 250
 gprodUp_max(gw2,s1,t2): gprodUp(gw2,s1,t2) <= 0
 gprodDn_max(gw2,s1,t2): gprodDn(gw2,s1,t2) <= 250
 gprodUp_max(gw2,s1,t3): gprodUp(gw2,s1,t3) <= 0
 gprodDn_max(gw2,s1,t3): gprodDn(gw2,s1,t3) <= 250
 gprodUp_max(gw2,s1,t4): gprodUp(gw2,s1,t4) <= 0
 gprodDn_max(gw2,s1,t4): gprodDn(gw2,s1,t4) <= 250
 gprodUp_max(gw2,s2,t1): gprodUp(gw2,s2,t1) <= 0
 gprodDn_max(gw2,s2,t1): gprodDn(gw2,s2,t1) <= 250
 gprodUp_max(gw2,s2,t2): gprodUp(gw2,s2,t2) <= 0
 gprodDn_max(gw2,s2,t2): gprodDn(gw2,s2,t2) <= 250
 gprodUp_max(gw2,s2,t3): gprodUp(gw2,s2,t3) <= 0
 gprodDn_max(gw2,s2,t3): gprodDn(gw2,s2,t3) <= 250
 gprodUp_max(gw2,s2,t4): gprodUp(gw2,s2,t4) <= 0
 gprodDn_max(gw2,s2,t4): gprodDn(gw2,s2,t4) <= 250
 gprodUp_max(gw3,s1,t1): gprodUp(gw3,s1,t1) <= 450
 gprodDn_max(gw3,s1,t1): gprodDn(gw3,s1,t1) <= 50
 gprodUp_max(gw3,s1,t2): gprodUp(gw3,s1,t2) <= 439.64723816
 gprodDn_max(gw3,s1,t2): gprodDn(gw3,s1,t2) <= 60.35276184000003
 gprodUp_max(gw3,s1,t3): gprodUp(gw3,s1,t3) <= 430
 gprodDn_max(gw3,s1,t3): gprodDn(gw3,s1,t3) <= 70
 gprodUp_max(gw3,s1,t4): gprodUp(gw3,s1,t4) <= 421.71572872
 gprodDn_max(gw3,s1,t4): gprodDn(gw3,s1,t4) <= 78.28427127999998
 gprodUp_max(gw3,s2,t1): gprodUp(gw3,s2,t1) <= 450
 gprodDn_max(gw3,s2,t1): gprodDn(gw3,s2,t1) <= 50
 gprodUp_max(gw3,s2,t2): gprodUp(gw3,s2,t2) <= 439.64723816
 gprodDn_max(gw3,s2,t2): gprodDn(gw3,s2,t2) <= 60.35276184000003
 gprodUp_max(gw3,s2,t3): gprodUp(gw3,s2,t3) <= 430
 gprodDn_max(gw3,s2,t3): gprodDn(gw3,s2,t3) <= 70
 gprodUp_max(gw3,s2,t4): gprodUp(gw3,s2,t4) <= 421.71572872
 gprodDn_max(gw3,s2,t4): gprodDn(gw3,s2,t4) <= 78.28427127999998
 line_store_rt(('ng101','ng102'),s1,t1):
   - qin_sr_rt(('ng101','ng102'),s1,t1)
   + qout_sr_rt(('ng101','ng102'),s1,t1) = 0
 line_store_rt(('ng101','ng102'),s1,t2):
   - qin_sr_rt(('ng101','ng102'),s1,t2)
   + qout_sr_rt(('ng101','ng102'),s1,t2) = 0
 line_store_rt(('ng101','ng102'),s1,t3):
   - qin_sr_rt(('ng101','ng102'),s1,t3)
   + qout_sr_rt(('ng101','ng102'),s1,t3) = 0
 line_store_rt(('ng101','ng102'),s1,t4):
   - qin_sr_rt(('ng101','ng102'),s1,t4)
   + qout_sr_rt(('ng101','ng102'),s1,t4) = 0
 line_store_rt(('ng101','ng102'),s2,t1):
   - qin_sr_rt(('ng101','ng102'),s2,t1)
   + qout_sr_rt(('ng101','ng102'),s2,t1) = 0
 line_store_rt(('ng101','ng102'),s2,t2):
   - qin_sr_rt(('ng101','ng102'),s2,t2)
   + qout_sr_rt(('ng101','ng102'),s2,t2) = 0
 line_store_rt(('ng101','ng102'),s2,t3):
   - qin_sr_rt(('ng101','ng102'),s2,t3)
   + qout_sr_rt(('ng101','ng102'),s2,t3) = 0
 line_store_rt(('ng101','ng102'),s2,t4):
   - qin_sr_rt(('ng101','ng102'),s2,t4)
   + qout_sr_rt(('ng101','ng102'),s2,t4) = 0
 gsinMax_rt(gs1,t1,s1): gsin_rt(gs1,s1,t1) <= 0
 gsoutMax_rt(gs1,t1,s1): gsout_rt(gs1,s1,t1) <= 0
 gstore_max_rt(gs1,t1,s1): gstore_rt(gs1,s1,t1) <= 0
 gstore_min_rt(gs1,t1,s1): gstore_rt(gs1,s1,t1) >= 0
 gsinMax_rt(gs1,t1,s2): gsin_rt(gs1,s2,t1) <= 0
 gsoutMax_rt(gs1,t1,s2): gsout_rt(gs1,s2,t1) <= 0
 gstore_max_rt(gs1,t1,s2): gstore_rt(gs1,s2,t1) <= 0
 gstore_min_rt(gs1,t1,s2): gstore_rt(gs1,s2,t1) >= 0
 gsinMax_rt(gs1,t2,s1): gsin_rt(gs1,s1,t2) <= 0
 gsoutMax_rt(gs1,t2,s1): gsout_rt(gs1,s1,t2) <= 0
 gstore_max_rt(gs1,t2,s1): gstore_rt(gs1,s1,t2) <= 0
 gstore_min_rt(gs1,t2,s1): gstore_rt(gs1,s1,t2) >= 0
 gsinMax_rt(gs1,t2,s2): gsin_rt(gs1,s2,t2) <= 0
 gsoutMax_rt(gs1,t2,s2): gsout_rt(gs1,s2,t2) <= 0
 gstore_max_rt(gs1,t2,s2): gstore_rt(gs1,s2,t2) <= 0
 gstore_min_rt(gs1,t2,s2): gstore_rt(gs1,s2,t2) >= 0
 gsinMax_rt(gs1,t3,s1): gsin_rt(gs1,s1,t3) <= 0
 gsoutMax_rt(gs1,t3,s1): gsout_rt(gs1,s1,t3) <= 0
 gstore_max_rt(gs1,t3,s1): gstore_rt(gs1,s1,t3) <= 0
 gstore_min_rt(gs1,t3,s1): gstore_rt(gs1,s1,t3) >= 0
 gsinMax_rt(gs1,t3,s2): gsin_rt(gs1,s2,t3) <= 0
 gsoutMax_rt(gs1,t3,s2): gsout_rt(gs1,s2,t3) <= 0
 gstore_max_rt(gs1,t3,s2): gstore_rt(gs1,s2,t3) <= 0
 gstore_min_rt(gs1,t3,s2): gstore_rt(gs1,s2,t3) >= 0
 gsinMax_rt(gs1,t4,s1): gsin_rt(gs1,s1,t4) <= 0
 gsoutMax_rt(gs1,t4,s1): gsout_rt(gs1,s1,t4) <= 0
 gstore_max_rt(gs1,t4,s1): gstore_rt(gs1,s1,t4) <= 0
 gstore_min_rt(gs1,t4,s1): gstore_rt(gs1,s1,t4) >= 0
 gsinMax_rt(gs1,t4,s2): gsin_rt(gs1,s2,t4) <= 0
 gsoutMax_rt(gs1,t4,s2): gsout_rt(gs1,s2,t4) <= 0
 gstore_max_rt(gs1,t4,s2): gstore_rt(gs1,s2,t4) <= 0
 gstore_min_rt(gs1,t4,s2): gstore_rt(gs1,s2,t4) >= 0
 gstor_def_rt(gs1,s1,t2): gstore_rt(gs1,s1,t1) + gsin_rt(gs1,s1,t2)
   - gsout_rt(gs1,s1,t2) - gstore_rt(gs1,s1,t2) = 0
 gstor_def_rt(gs1,s1,t3): gstore_rt(gs1,s1,t2) + gsin_rt(gs1,s1,t3)
   - gsout_rt(gs1,s1,t3) - gstore_rt(gs1,s1,t3) = 0
 gstor_def_rt(gs1,s1,t4): gstore_rt(gs1,s1,t3) + gsin_rt(gs1,s1,t4)
   - gsout_rt(gs1,s1,t4) - gstore_rt(gs1,s1,t4) = 0
 gstor_def_rt(gs1,s1,t1): gsin_rt(gs1,s1,t1) - gsout_rt(gs1,s1,t1)
   - gstore_rt(gs1,s1,t1) = 0
 gstor_end(gs1,s1): gstore_rt(gs1,s1,t4) >= 0
 gstor_def_rt(gs1,s2,t2): gstore_rt(gs1,s2,t1) + gsin_rt(gs1,s2,t2)
   - gsout_rt(gs1,s2,t2) - gstore_rt(gs1,s2,t2) = 0
 gstor_def_rt(gs1,s2,t3): gstore_rt(gs1,s2,t2) + gsin_rt(gs1,s2,t3)
   - gsout_rt(gs1,s2,t3) - gstore_rt(gs1,s2,t3) = 0
 gstor_def_rt(gs1,s2,t4): gstore_rt(gs1,s2,t3) + gsin_rt(gs1,s2,t4)
   - gsout_rt(gs1,s2,t4) - gstore_rt(gs1,s2,t4) = 0
 gstor_def_rt(gs1,s2,t1): gsin_rt(gs1,s2,t1) - gsout_rt(gs1,s2,t1)
   - gstore_rt(gs1,s2,t1) = 0
 gstor_end(gs1,s2): gstore_rt(gs1,s2,t4) >= 0
 gas_shed_rt(ng101,s1,t1): gshed(ng101,s1,t1) <= 0
 gas_shed_rt(ng101,s1,t2): gshed(ng101,s1,t2) <= 0
 gas_shed_rt(ng101,s1,t3): gshed(ng101,s1,t3) <= 0
 gas_shed_rt(ng101,s1,t4): gshed(ng101,s1,t4) <= 0
 gas_shed_rt(ng102,s1,t1): gshed(ng102,s1,t1) <= 0
 gas_shed_rt(ng102,s1,t2): gshed(ng102,s1,t2) <= 0
 gas_shed_rt(ng102,s1,t3): gshed(ng102,s1,t3) <= 0
 gas_shed_rt(ng102,s1,t4): gshed(ng102,s1,t4) <= 0
 gas_shed_rt(ng101,s2,t1): gshed(ng101,s2,t1) <= 0
 gas_shed_rt(ng101,s2,t2): gshed(ng101,s2,t2) <= 0
 gas_shed_rt(ng101,s2,t3): gshed(ng101,s2,t3) <= 0
 gas_shed_rt(ng101,s2,t4): gshed(ng101,s2,t4) <= 0
 gas_shed_rt(ng102,s2,t1): gshed(ng102,s2,t1) <= 0
 gas_shed_rt(ng102,s2,t2): gshed(ng102,s2,t2) <= 0
 gas_shed_rt(ng102,s2,t3): gshed(ng102,s2,t3) <= 0
 gas_shed_rt(ng102,s2,t4): gshed(ng102,s2,t4) <= 0
Bounds
End
