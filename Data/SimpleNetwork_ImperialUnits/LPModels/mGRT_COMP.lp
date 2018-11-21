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
 SOS1_gflow_sr_limit_rt(('ng101','ng102'),s1,t1):
   gflow_sr_rt(('ng101','ng102'),s1,t1)
   + SOS1_gflow_sr_limit_rt(('ng101','ng102'),s1,t1) = 4000
 SOS1_gflow_sr_limit_rt(('ng101','ng102'),s2,t1):
   gflow_sr_rt(('ng101','ng102'),s2,t1)
   + SOS1_gflow_sr_limit_rt(('ng101','ng102'),s2,t1) = 4000
 SOS1_gflow_sr_limit_rt(('ng101','ng102'),s1,t2):
   gflow_sr_rt(('ng101','ng102'),s1,t2)
   + SOS1_gflow_sr_limit_rt(('ng101','ng102'),s1,t2) = 4000
 SOS1_gflow_sr_limit_rt(('ng101','ng102'),s2,t2):
   gflow_sr_rt(('ng101','ng102'),s2,t2)
   + SOS1_gflow_sr_limit_rt(('ng101','ng102'),s2,t2) = 4000
 SOS1_gflow_sr_limit_rt(('ng101','ng102'),s1,t3):
   gflow_sr_rt(('ng101','ng102'),s1,t3)
   + SOS1_gflow_sr_limit_rt(('ng101','ng102'),s1,t3) = 4000
 SOS1_gflow_sr_limit_rt(('ng101','ng102'),s2,t3):
   gflow_sr_rt(('ng101','ng102'),s2,t3)
   + SOS1_gflow_sr_limit_rt(('ng101','ng102'),s2,t3) = 4000
 SOS1_gflow_sr_limit_rt(('ng101','ng102'),s1,t4):
   gflow_sr_rt(('ng101','ng102'),s1,t4)
   + SOS1_gflow_sr_limit_rt(('ng101','ng102'),s1,t4) = 4000
 SOS1_gflow_sr_limit_rt(('ng101','ng102'),s2,t4):
   gflow_sr_rt(('ng101','ng102'),s2,t4)
   + SOS1_gflow_sr_limit_rt(('ng101','ng102'),s2,t4) = 4000
 SOS1_gprodUp_max(gw1,s1,t1): gprodUp(gw1,s1,t1)
   + SOS1_gprodUp_max(gw1,s1,t1) = 0
 SOS1_gprodDn_max(gw1,s1,t1): gprodDn(gw1,s1,t1)
   + SOS1_gprodDn_max(gw1,s1,t1) = 100
 SOS1_gprodUp_max(gw1,s1,t2): gprodUp(gw1,s1,t2)
   + SOS1_gprodUp_max(gw1,s1,t2) = 0
 SOS1_gprodDn_max(gw1,s1,t2): gprodDn(gw1,s1,t2)
   + SOS1_gprodDn_max(gw1,s1,t2) = 100
 SOS1_gprodUp_max(gw1,s1,t3): gprodUp(gw1,s1,t3)
   + SOS1_gprodUp_max(gw1,s1,t3) = 0
 SOS1_gprodDn_max(gw1,s1,t3): gprodDn(gw1,s1,t3)
   + SOS1_gprodDn_max(gw1,s1,t3) = 100
 SOS1_gprodUp_max(gw1,s1,t4): gprodUp(gw1,s1,t4)
   + SOS1_gprodUp_max(gw1,s1,t4) = 0
 SOS1_gprodDn_max(gw1,s1,t4): gprodDn(gw1,s1,t4)
   + SOS1_gprodDn_max(gw1,s1,t4) = 100
 SOS1_gprodUp_max(gw1,s2,t1): gprodUp(gw1,s2,t1)
   + SOS1_gprodUp_max(gw1,s2,t1) = 0
 SOS1_gprodDn_max(gw1,s2,t1): gprodDn(gw1,s2,t1)
   + SOS1_gprodDn_max(gw1,s2,t1) = 100
 SOS1_gprodUp_max(gw1,s2,t2): gprodUp(gw1,s2,t2)
   + SOS1_gprodUp_max(gw1,s2,t2) = 0
 SOS1_gprodDn_max(gw1,s2,t2): gprodDn(gw1,s2,t2)
   + SOS1_gprodDn_max(gw1,s2,t2) = 100
 SOS1_gprodUp_max(gw1,s2,t3): gprodUp(gw1,s2,t3)
   + SOS1_gprodUp_max(gw1,s2,t3) = 0
 SOS1_gprodDn_max(gw1,s2,t3): gprodDn(gw1,s2,t3)
   + SOS1_gprodDn_max(gw1,s2,t3) = 100
 SOS1_gprodUp_max(gw1,s2,t4): gprodUp(gw1,s2,t4)
   + SOS1_gprodUp_max(gw1,s2,t4) = 0
 SOS1_gprodDn_max(gw1,s2,t4): gprodDn(gw1,s2,t4)
   + SOS1_gprodDn_max(gw1,s2,t4) = 100
 SOS1_gprodUp_max(gw2,s1,t1): gprodUp(gw2,s1,t1)
   + SOS1_gprodUp_max(gw2,s1,t1) = 0
 SOS1_gprodDn_max(gw2,s1,t1): gprodDn(gw2,s1,t1)
   + SOS1_gprodDn_max(gw2,s1,t1) = 250
 SOS1_gprodUp_max(gw2,s1,t2): gprodUp(gw2,s1,t2)
   + SOS1_gprodUp_max(gw2,s1,t2) = 0
 SOS1_gprodDn_max(gw2,s1,t2): gprodDn(gw2,s1,t2)
   + SOS1_gprodDn_max(gw2,s1,t2) = 250
 SOS1_gprodUp_max(gw2,s1,t3): gprodUp(gw2,s1,t3)
   + SOS1_gprodUp_max(gw2,s1,t3) = 0
 SOS1_gprodDn_max(gw2,s1,t3): gprodDn(gw2,s1,t3)
   + SOS1_gprodDn_max(gw2,s1,t3) = 250
 SOS1_gprodUp_max(gw2,s1,t4): gprodUp(gw2,s1,t4)
   + SOS1_gprodUp_max(gw2,s1,t4) = 0
 SOS1_gprodDn_max(gw2,s1,t4): gprodDn(gw2,s1,t4)
   + SOS1_gprodDn_max(gw2,s1,t4) = 250
 SOS1_gprodUp_max(gw2,s2,t1): gprodUp(gw2,s2,t1)
   + SOS1_gprodUp_max(gw2,s2,t1) = 0
 SOS1_gprodDn_max(gw2,s2,t1): gprodDn(gw2,s2,t1)
   + SOS1_gprodDn_max(gw2,s2,t1) = 250
 SOS1_gprodUp_max(gw2,s2,t2): gprodUp(gw2,s2,t2)
   + SOS1_gprodUp_max(gw2,s2,t2) = 0
 SOS1_gprodDn_max(gw2,s2,t2): gprodDn(gw2,s2,t2)
   + SOS1_gprodDn_max(gw2,s2,t2) = 250
 SOS1_gprodUp_max(gw2,s2,t3): gprodUp(gw2,s2,t3)
   + SOS1_gprodUp_max(gw2,s2,t3) = 0
 SOS1_gprodDn_max(gw2,s2,t3): gprodDn(gw2,s2,t3)
   + SOS1_gprodDn_max(gw2,s2,t3) = 250
 SOS1_gprodUp_max(gw2,s2,t4): gprodUp(gw2,s2,t4)
   + SOS1_gprodUp_max(gw2,s2,t4) = 0
 SOS1_gprodDn_max(gw2,s2,t4): gprodDn(gw2,s2,t4)
   + SOS1_gprodDn_max(gw2,s2,t4) = 250
 SOS1_gprodUp_max(gw3,s1,t1): gprodUp(gw3,s1,t1)
   + SOS1_gprodUp_max(gw3,s1,t1) = 450
 SOS1_gprodDn_max(gw3,s1,t1): gprodDn(gw3,s1,t1)
   + SOS1_gprodDn_max(gw3,s1,t1) = 50
 SOS1_gprodUp_max(gw3,s1,t2): gprodUp(gw3,s1,t2)
   + SOS1_gprodUp_max(gw3,s1,t2) = 439.64723816
 SOS1_gprodDn_max(gw3,s1,t2): gprodDn(gw3,s1,t2)
   + SOS1_gprodDn_max(gw3,s1,t2) = 60.35276184000003
 SOS1_gprodUp_max(gw3,s1,t3): gprodUp(gw3,s1,t3)
   + SOS1_gprodUp_max(gw3,s1,t3) = 430
 SOS1_gprodDn_max(gw3,s1,t3): gprodDn(gw3,s1,t3)
   + SOS1_gprodDn_max(gw3,s1,t3) = 70
 SOS1_gprodUp_max(gw3,s1,t4): gprodUp(gw3,s1,t4)
   + SOS1_gprodUp_max(gw3,s1,t4) = 421.71572872
 SOS1_gprodDn_max(gw3,s1,t4): gprodDn(gw3,s1,t4)
   + SOS1_gprodDn_max(gw3,s1,t4) = 78.28427127999998
 SOS1_gprodUp_max(gw3,s2,t1): gprodUp(gw3,s2,t1)
   + SOS1_gprodUp_max(gw3,s2,t1) = 450
 SOS1_gprodDn_max(gw3,s2,t1): gprodDn(gw3,s2,t1)
   + SOS1_gprodDn_max(gw3,s2,t1) = 50
 SOS1_gprodUp_max(gw3,s2,t2): gprodUp(gw3,s2,t2)
   + SOS1_gprodUp_max(gw3,s2,t2) = 439.64723816
 SOS1_gprodDn_max(gw3,s2,t2): gprodDn(gw3,s2,t2)
   + SOS1_gprodDn_max(gw3,s2,t2) = 60.35276184000003
 SOS1_gprodUp_max(gw3,s2,t3): gprodUp(gw3,s2,t3)
   + SOS1_gprodUp_max(gw3,s2,t3) = 430
 SOS1_gprodDn_max(gw3,s2,t3): gprodDn(gw3,s2,t3)
   + SOS1_gprodDn_max(gw3,s2,t3) = 70
 SOS1_gprodUp_max(gw3,s2,t4): gprodUp(gw3,s2,t4)
   + SOS1_gprodUp_max(gw3,s2,t4) = 421.71572872
 SOS1_gprodDn_max(gw3,s2,t4): gprodDn(gw3,s2,t4)
   + SOS1_gprodDn_max(gw3,s2,t4) = 78.28427127999998
 SOS1_gsinMax_rt(gs1,t1,s1): gsin_rt(gs1,s1,t1)
   + SOS1_gsinMax_rt(gs1,t1,s1) = 0
 SOS1_gsoutMax_rt(gs1,t1,s1): gsout_rt(gs1,s1,t1)
   + SOS1_gsoutMax_rt(gs1,t1,s1) = 0
 SOS1_gstore_max_rt(gs1,t1,s1): gstore_rt(gs1,s1,t1)
   + SOS1_gstore_max_rt(gs1,t1,s1) = 0
 SOS1_gstore_min_rt(gs1,t1,s1): - gstore_rt(gs1,s1,t1)
   + SOS1_gstore_min_rt(gs1,t1,s1) = 0
 SOS1_gsinMax_rt(gs1,t1,s2): gsin_rt(gs1,s2,t1)
   + SOS1_gsinMax_rt(gs1,t1,s2) = 0
 SOS1_gsoutMax_rt(gs1,t1,s2): gsout_rt(gs1,s2,t1)
   + SOS1_gsoutMax_rt(gs1,t1,s2) = 0
 SOS1_gstore_max_rt(gs1,t1,s2): gstore_rt(gs1,s2,t1)
   + SOS1_gstore_max_rt(gs1,t1,s2) = 0
 SOS1_gstore_min_rt(gs1,t1,s2): - gstore_rt(gs1,s2,t1)
   + SOS1_gstore_min_rt(gs1,t1,s2) = 0
 SOS1_gsinMax_rt(gs1,t2,s1): gsin_rt(gs1,s1,t2)
   + SOS1_gsinMax_rt(gs1,t2,s1) = 0
 SOS1_gsoutMax_rt(gs1,t2,s1): gsout_rt(gs1,s1,t2)
   + SOS1_gsoutMax_rt(gs1,t2,s1) = 0
 SOS1_gstore_max_rt(gs1,t2,s1): gstore_rt(gs1,s1,t2)
   + SOS1_gstore_max_rt(gs1,t2,s1) = 0
 SOS1_gstore_min_rt(gs1,t2,s1): - gstore_rt(gs1,s1,t2)
   + SOS1_gstore_min_rt(gs1,t2,s1) = 0
 SOS1_gsinMax_rt(gs1,t2,s2): gsin_rt(gs1,s2,t2)
   + SOS1_gsinMax_rt(gs1,t2,s2) = 0
 SOS1_gsoutMax_rt(gs1,t2,s2): gsout_rt(gs1,s2,t2)
   + SOS1_gsoutMax_rt(gs1,t2,s2) = 0
 SOS1_gstore_max_rt(gs1,t2,s2): gstore_rt(gs1,s2,t2)
   + SOS1_gstore_max_rt(gs1,t2,s2) = 0
 SOS1_gstore_min_rt(gs1,t2,s2): - gstore_rt(gs1,s2,t2)
   + SOS1_gstore_min_rt(gs1,t2,s2) = 0
 SOS1_gsinMax_rt(gs1,t3,s1): gsin_rt(gs1,s1,t3)
   + SOS1_gsinMax_rt(gs1,t3,s1) = 0
 SOS1_gsoutMax_rt(gs1,t3,s1): gsout_rt(gs1,s1,t3)
   + SOS1_gsoutMax_rt(gs1,t3,s1) = 0
 SOS1_gstore_max_rt(gs1,t3,s1): gstore_rt(gs1,s1,t3)
   + SOS1_gstore_max_rt(gs1,t3,s1) = 0
 SOS1_gstore_min_rt(gs1,t3,s1): - gstore_rt(gs1,s1,t3)
   + SOS1_gstore_min_rt(gs1,t3,s1) = 0
 SOS1_gsinMax_rt(gs1,t3,s2): gsin_rt(gs1,s2,t3)
   + SOS1_gsinMax_rt(gs1,t3,s2) = 0
 SOS1_gsoutMax_rt(gs1,t3,s2): gsout_rt(gs1,s2,t3)
   + SOS1_gsoutMax_rt(gs1,t3,s2) = 0
 SOS1_gstore_max_rt(gs1,t3,s2): gstore_rt(gs1,s2,t3)
   + SOS1_gstore_max_rt(gs1,t3,s2) = 0
 SOS1_gstore_min_rt(gs1,t3,s2): - gstore_rt(gs1,s2,t3)
   + SOS1_gstore_min_rt(gs1,t3,s2) = 0
 SOS1_gsinMax_rt(gs1,t4,s1): gsin_rt(gs1,s1,t4)
   + SOS1_gsinMax_rt(gs1,t4,s1) = 0
 SOS1_gsoutMax_rt(gs1,t4,s1): gsout_rt(gs1,s1,t4)
   + SOS1_gsoutMax_rt(gs1,t4,s1) = 0
 SOS1_gstore_max_rt(gs1,t4,s1): gstore_rt(gs1,s1,t4)
   + SOS1_gstore_max_rt(gs1,t4,s1) = 0
 SOS1_gstore_min_rt(gs1,t4,s1): - gstore_rt(gs1,s1,t4)
   + SOS1_gstore_min_rt(gs1,t4,s1) = 0
 SOS1_gsinMax_rt(gs1,t4,s2): gsin_rt(gs1,s2,t4)
   + SOS1_gsinMax_rt(gs1,t4,s2) = 0
 SOS1_gsoutMax_rt(gs1,t4,s2): gsout_rt(gs1,s2,t4)
   + SOS1_gsoutMax_rt(gs1,t4,s2) = 0
 SOS1_gstore_max_rt(gs1,t4,s2): gstore_rt(gs1,s2,t4)
   + SOS1_gstore_max_rt(gs1,t4,s2) = 0
 SOS1_gstore_min_rt(gs1,t4,s2): - gstore_rt(gs1,s2,t4)
   + SOS1_gstore_min_rt(gs1,t4,s2) = 0
 SOS1_gstor_end(gs1,s1): - gstore_rt(gs1,s1,t4) + SOS1_gstor_end(gs1,s1)
   = 0
 SOS1_gstor_end(gs1,s2): - gstore_rt(gs1,s2,t4) + SOS1_gstor_end(gs1,s2)
   = 0
 SOS1_gas_shed_rt(ng101,s1,t1): gshed(ng101,s1,t1)
   + SOS1_gas_shed_rt(ng101,s1,t1) = 0
 SOS1_gas_shed_rt(ng101,s1,t2): gshed(ng101,s1,t2)
   + SOS1_gas_shed_rt(ng101,s1,t2) = 0
 SOS1_gas_shed_rt(ng101,s1,t3): gshed(ng101,s1,t3)
   + SOS1_gas_shed_rt(ng101,s1,t3) = 0
 SOS1_gas_shed_rt(ng101,s1,t4): gshed(ng101,s1,t4)
   + SOS1_gas_shed_rt(ng101,s1,t4) = 0
 SOS1_gas_shed_rt(ng102,s1,t1): gshed(ng102,s1,t1)
   + SOS1_gas_shed_rt(ng102,s1,t1) = 0
 SOS1_gas_shed_rt(ng102,s1,t2): gshed(ng102,s1,t2)
   + SOS1_gas_shed_rt(ng102,s1,t2) = 0
 SOS1_gas_shed_rt(ng102,s1,t3): gshed(ng102,s1,t3)
   + SOS1_gas_shed_rt(ng102,s1,t3) = 0
 SOS1_gas_shed_rt(ng102,s1,t4): gshed(ng102,s1,t4)
   + SOS1_gas_shed_rt(ng102,s1,t4) = 0
 SOS1_gas_shed_rt(ng101,s2,t1): gshed(ng101,s2,t1)
   + SOS1_gas_shed_rt(ng101,s2,t1) = 0
 SOS1_gas_shed_rt(ng101,s2,t2): gshed(ng101,s2,t2)
   + SOS1_gas_shed_rt(ng101,s2,t2) = 0
 SOS1_gas_shed_rt(ng101,s2,t3): gshed(ng101,s2,t3)
   + SOS1_gas_shed_rt(ng101,s2,t3) = 0
 SOS1_gas_shed_rt(ng101,s2,t4): gshed(ng101,s2,t4)
   + SOS1_gas_shed_rt(ng101,s2,t4) = 0
 SOS1_gas_shed_rt(ng102,s2,t1): gshed(ng102,s2,t1)
   + SOS1_gas_shed_rt(ng102,s2,t1) = 0
 SOS1_gas_shed_rt(ng102,s2,t2): gshed(ng102,s2,t2)
   + SOS1_gas_shed_rt(ng102,s2,t2) = 0
 SOS1_gas_shed_rt(ng102,s2,t3): gshed(ng102,s2,t3)
   + SOS1_gas_shed_rt(ng102,s2,t3) = 0
 SOS1_gas_shed_rt(ng102,s2,t4): gshed(ng102,s2,t4)
   + SOS1_gas_shed_rt(ng102,s2,t4) = 0
 SOS1_LB_gshed(ng101,s1,t1): - gshed(ng101,s1,t1)
   + SOS1_LB_gshed(ng101,s1,t1) = 0
 SOS1_LB_gshed(ng102,s1,t1): - gshed(ng102,s1,t1)
   + SOS1_LB_gshed(ng102,s1,t1) = 0
 SOS1_LB_gflow_sr_rt(('ng101','ng102'),s1,t1):
   - gflow_sr_rt(('ng101','ng102'),s1,t1)
   + SOS1_LB_gflow_sr_rt(('ng101','ng102'),s1,t1) = 0
 SOS1_LB_qin_sr_rt(('ng101','ng102'),s1,t1):
   - qin_sr_rt(('ng101','ng102'),s1,t1)
   + SOS1_LB_qin_sr_rt(('ng101','ng102'),s1,t1) = 0
 SOS1_LB_qout_sr_rt(('ng101','ng102'),s1,t1):
   - qout_sr_rt(('ng101','ng102'),s1,t1)
   + SOS1_LB_qout_sr_rt(('ng101','ng102'),s1,t1) = 0
 SOS1_LB_gprodUp(gw1,s1,t1): - gprodUp(gw1,s1,t1)
   + SOS1_LB_gprodUp(gw1,s1,t1) = 0
 SOS1_LB_gprodDn(gw1,s1,t1): - gprodDn(gw1,s1,t1)
   + SOS1_LB_gprodDn(gw1,s1,t1) = 0
 SOS1_LB_gprodUp(gw2,s1,t1): - gprodUp(gw2,s1,t1)
   + SOS1_LB_gprodUp(gw2,s1,t1) = 0
 SOS1_LB_gprodDn(gw2,s1,t1): - gprodDn(gw2,s1,t1)
   + SOS1_LB_gprodDn(gw2,s1,t1) = 0
 SOS1_LB_gprodUp(gw3,s1,t1): - gprodUp(gw3,s1,t1)
   + SOS1_LB_gprodUp(gw3,s1,t1) = 0
 SOS1_LB_gprodDn(gw3,s1,t1): - gprodDn(gw3,s1,t1)
   + SOS1_LB_gprodDn(gw3,s1,t1) = 0
 SOS1_LB_gsin_rt(gs1,s1,t1): - gsin_rt(gs1,s1,t1)
   + SOS1_LB_gsin_rt(gs1,s1,t1) = 0
 SOS1_LB_gsout_rt(gs1,s1,t1): - gsout_rt(gs1,s1,t1)
   + SOS1_LB_gsout_rt(gs1,s1,t1) = 0
 SOS1_LB_gstore_rt(gs1,s1,t1): - gstore_rt(gs1,s1,t1)
   + SOS1_LB_gstore_rt(gs1,s1,t1) = 0
 SOS1_LB_gshed(ng101,s1,t2): - gshed(ng101,s1,t2)
   + SOS1_LB_gshed(ng101,s1,t2) = 0
 SOS1_LB_gshed(ng102,s1,t2): - gshed(ng102,s1,t2)
   + SOS1_LB_gshed(ng102,s1,t2) = 0
 SOS1_LB_gflow_sr_rt(('ng101','ng102'),s1,t2):
   - gflow_sr_rt(('ng101','ng102'),s1,t2)
   + SOS1_LB_gflow_sr_rt(('ng101','ng102'),s1,t2) = 0
 SOS1_LB_qin_sr_rt(('ng101','ng102'),s1,t2):
   - qin_sr_rt(('ng101','ng102'),s1,t2)
   + SOS1_LB_qin_sr_rt(('ng101','ng102'),s1,t2) = 0
 SOS1_LB_qout_sr_rt(('ng101','ng102'),s1,t2):
   - qout_sr_rt(('ng101','ng102'),s1,t2)
   + SOS1_LB_qout_sr_rt(('ng101','ng102'),s1,t2) = 0
 SOS1_LB_gprodUp(gw1,s1,t2): - gprodUp(gw1,s1,t2)
   + SOS1_LB_gprodUp(gw1,s1,t2) = 0
 SOS1_LB_gprodDn(gw1,s1,t2): - gprodDn(gw1,s1,t2)
   + SOS1_LB_gprodDn(gw1,s1,t2) = 0
 SOS1_LB_gprodUp(gw2,s1,t2): - gprodUp(gw2,s1,t2)
   + SOS1_LB_gprodUp(gw2,s1,t2) = 0
 SOS1_LB_gprodDn(gw2,s1,t2): - gprodDn(gw2,s1,t2)
   + SOS1_LB_gprodDn(gw2,s1,t2) = 0
 SOS1_LB_gprodUp(gw3,s1,t2): - gprodUp(gw3,s1,t2)
   + SOS1_LB_gprodUp(gw3,s1,t2) = 0
 SOS1_LB_gprodDn(gw3,s1,t2): - gprodDn(gw3,s1,t2)
   + SOS1_LB_gprodDn(gw3,s1,t2) = 0
 SOS1_LB_gsin_rt(gs1,s1,t2): - gsin_rt(gs1,s1,t2)
   + SOS1_LB_gsin_rt(gs1,s1,t2) = 0
 SOS1_LB_gsout_rt(gs1,s1,t2): - gsout_rt(gs1,s1,t2)
   + SOS1_LB_gsout_rt(gs1,s1,t2) = 0
 SOS1_LB_gstore_rt(gs1,s1,t2): - gstore_rt(gs1,s1,t2)
   + SOS1_LB_gstore_rt(gs1,s1,t2) = 0
 SOS1_LB_gshed(ng101,s1,t3): - gshed(ng101,s1,t3)
   + SOS1_LB_gshed(ng101,s1,t3) = 0
 SOS1_LB_gshed(ng102,s1,t3): - gshed(ng102,s1,t3)
   + SOS1_LB_gshed(ng102,s1,t3) = 0
 SOS1_LB_gflow_sr_rt(('ng101','ng102'),s1,t3):
   - gflow_sr_rt(('ng101','ng102'),s1,t3)
   + SOS1_LB_gflow_sr_rt(('ng101','ng102'),s1,t3) = 0
 SOS1_LB_qin_sr_rt(('ng101','ng102'),s1,t3):
   - qin_sr_rt(('ng101','ng102'),s1,t3)
   + SOS1_LB_qin_sr_rt(('ng101','ng102'),s1,t3) = 0
 SOS1_LB_qout_sr_rt(('ng101','ng102'),s1,t3):
   - qout_sr_rt(('ng101','ng102'),s1,t3)
   + SOS1_LB_qout_sr_rt(('ng101','ng102'),s1,t3) = 0
 SOS1_LB_gprodUp(gw1,s1,t3): - gprodUp(gw1,s1,t3)
   + SOS1_LB_gprodUp(gw1,s1,t3) = 0
 SOS1_LB_gprodDn(gw1,s1,t3): - gprodDn(gw1,s1,t3)
   + SOS1_LB_gprodDn(gw1,s1,t3) = 0
 SOS1_LB_gprodUp(gw2,s1,t3): - gprodUp(gw2,s1,t3)
   + SOS1_LB_gprodUp(gw2,s1,t3) = 0
 SOS1_LB_gprodDn(gw2,s1,t3): - gprodDn(gw2,s1,t3)
   + SOS1_LB_gprodDn(gw2,s1,t3) = 0
 SOS1_LB_gprodUp(gw3,s1,t3): - gprodUp(gw3,s1,t3)
   + SOS1_LB_gprodUp(gw3,s1,t3) = 0
 SOS1_LB_gprodDn(gw3,s1,t3): - gprodDn(gw3,s1,t3)
   + SOS1_LB_gprodDn(gw3,s1,t3) = 0
 SOS1_LB_gsin_rt(gs1,s1,t3): - gsin_rt(gs1,s1,t3)
   + SOS1_LB_gsin_rt(gs1,s1,t3) = 0
 SOS1_LB_gsout_rt(gs1,s1,t3): - gsout_rt(gs1,s1,t3)
   + SOS1_LB_gsout_rt(gs1,s1,t3) = 0
 SOS1_LB_gstore_rt(gs1,s1,t3): - gstore_rt(gs1,s1,t3)
   + SOS1_LB_gstore_rt(gs1,s1,t3) = 0
 SOS1_LB_gshed(ng101,s1,t4): - gshed(ng101,s1,t4)
   + SOS1_LB_gshed(ng101,s1,t4) = 0
 SOS1_LB_gshed(ng102,s1,t4): - gshed(ng102,s1,t4)
   + SOS1_LB_gshed(ng102,s1,t4) = 0
 SOS1_LB_gflow_sr_rt(('ng101','ng102'),s1,t4):
   - gflow_sr_rt(('ng101','ng102'),s1,t4)
   + SOS1_LB_gflow_sr_rt(('ng101','ng102'),s1,t4) = 0
 SOS1_LB_qin_sr_rt(('ng101','ng102'),s1,t4):
   - qin_sr_rt(('ng101','ng102'),s1,t4)
   + SOS1_LB_qin_sr_rt(('ng101','ng102'),s1,t4) = 0
 SOS1_LB_qout_sr_rt(('ng101','ng102'),s1,t4):
   - qout_sr_rt(('ng101','ng102'),s1,t4)
   + SOS1_LB_qout_sr_rt(('ng101','ng102'),s1,t4) = 0
 SOS1_LB_gprodUp(gw1,s1,t4): - gprodUp(gw1,s1,t4)
   + SOS1_LB_gprodUp(gw1,s1,t4) = 0
 SOS1_LB_gprodDn(gw1,s1,t4): - gprodDn(gw1,s1,t4)
   + SOS1_LB_gprodDn(gw1,s1,t4) = 0
 SOS1_LB_gprodUp(gw2,s1,t4): - gprodUp(gw2,s1,t4)
   + SOS1_LB_gprodUp(gw2,s1,t4) = 0
 SOS1_LB_gprodDn(gw2,s1,t4): - gprodDn(gw2,s1,t4)
   + SOS1_LB_gprodDn(gw2,s1,t4) = 0
 SOS1_LB_gprodUp(gw3,s1,t4): - gprodUp(gw3,s1,t4)
   + SOS1_LB_gprodUp(gw3,s1,t4) = 0
 SOS1_LB_gprodDn(gw3,s1,t4): - gprodDn(gw3,s1,t4)
   + SOS1_LB_gprodDn(gw3,s1,t4) = 0
 SOS1_LB_gsin_rt(gs1,s1,t4): - gsin_rt(gs1,s1,t4)
   + SOS1_LB_gsin_rt(gs1,s1,t4) = 0
 SOS1_LB_gsout_rt(gs1,s1,t4): - gsout_rt(gs1,s1,t4)
   + SOS1_LB_gsout_rt(gs1,s1,t4) = 0
 SOS1_LB_gstore_rt(gs1,s1,t4): - gstore_rt(gs1,s1,t4)
   + SOS1_LB_gstore_rt(gs1,s1,t4) = 0
 SOS1_LB_gshed(ng101,s2,t1): - gshed(ng101,s2,t1)
   + SOS1_LB_gshed(ng101,s2,t1) = 0
 SOS1_LB_gshed(ng102,s2,t1): - gshed(ng102,s2,t1)
   + SOS1_LB_gshed(ng102,s2,t1) = 0
 SOS1_LB_gflow_sr_rt(('ng101','ng102'),s2,t1):
   - gflow_sr_rt(('ng101','ng102'),s2,t1)
   + SOS1_LB_gflow_sr_rt(('ng101','ng102'),s2,t1) = 0
 SOS1_LB_qin_sr_rt(('ng101','ng102'),s2,t1):
   - qin_sr_rt(('ng101','ng102'),s2,t1)
   + SOS1_LB_qin_sr_rt(('ng101','ng102'),s2,t1) = 0
 SOS1_LB_qout_sr_rt(('ng101','ng102'),s2,t1):
   - qout_sr_rt(('ng101','ng102'),s2,t1)
   + SOS1_LB_qout_sr_rt(('ng101','ng102'),s2,t1) = 0
 SOS1_LB_gprodUp(gw1,s2,t1): - gprodUp(gw1,s2,t1)
   + SOS1_LB_gprodUp(gw1,s2,t1) = 0
 SOS1_LB_gprodDn(gw1,s2,t1): - gprodDn(gw1,s2,t1)
   + SOS1_LB_gprodDn(gw1,s2,t1) = 0
 SOS1_LB_gprodUp(gw2,s2,t1): - gprodUp(gw2,s2,t1)
   + SOS1_LB_gprodUp(gw2,s2,t1) = 0
 SOS1_LB_gprodDn(gw2,s2,t1): - gprodDn(gw2,s2,t1)
   + SOS1_LB_gprodDn(gw2,s2,t1) = 0
 SOS1_LB_gprodUp(gw3,s2,t1): - gprodUp(gw3,s2,t1)
   + SOS1_LB_gprodUp(gw3,s2,t1) = 0
 SOS1_LB_gprodDn(gw3,s2,t1): - gprodDn(gw3,s2,t1)
   + SOS1_LB_gprodDn(gw3,s2,t1) = 0
 SOS1_LB_gsin_rt(gs1,s2,t1): - gsin_rt(gs1,s2,t1)
   + SOS1_LB_gsin_rt(gs1,s2,t1) = 0
 SOS1_LB_gsout_rt(gs1,s2,t1): - gsout_rt(gs1,s2,t1)
   + SOS1_LB_gsout_rt(gs1,s2,t1) = 0
 SOS1_LB_gstore_rt(gs1,s2,t1): - gstore_rt(gs1,s2,t1)
   + SOS1_LB_gstore_rt(gs1,s2,t1) = 0
 SOS1_LB_gshed(ng101,s2,t2): - gshed(ng101,s2,t2)
   + SOS1_LB_gshed(ng101,s2,t2) = 0
 SOS1_LB_gshed(ng102,s2,t2): - gshed(ng102,s2,t2)
   + SOS1_LB_gshed(ng102,s2,t2) = 0
 SOS1_LB_gflow_sr_rt(('ng101','ng102'),s2,t2):
   - gflow_sr_rt(('ng101','ng102'),s2,t2)
   + SOS1_LB_gflow_sr_rt(('ng101','ng102'),s2,t2) = 0
 SOS1_LB_qin_sr_rt(('ng101','ng102'),s2,t2):
   - qin_sr_rt(('ng101','ng102'),s2,t2)
   + SOS1_LB_qin_sr_rt(('ng101','ng102'),s2,t2) = 0
 SOS1_LB_qout_sr_rt(('ng101','ng102'),s2,t2):
   - qout_sr_rt(('ng101','ng102'),s2,t2)
   + SOS1_LB_qout_sr_rt(('ng101','ng102'),s2,t2) = 0
 SOS1_LB_gprodUp(gw1,s2,t2): - gprodUp(gw1,s2,t2)
   + SOS1_LB_gprodUp(gw1,s2,t2) = 0
 SOS1_LB_gprodDn(gw1,s2,t2): - gprodDn(gw1,s2,t2)
   + SOS1_LB_gprodDn(gw1,s2,t2) = 0
 SOS1_LB_gprodUp(gw2,s2,t2): - gprodUp(gw2,s2,t2)
   + SOS1_LB_gprodUp(gw2,s2,t2) = 0
 SOS1_LB_gprodDn(gw2,s2,t2): - gprodDn(gw2,s2,t2)
   + SOS1_LB_gprodDn(gw2,s2,t2) = 0
 SOS1_LB_gprodUp(gw3,s2,t2): - gprodUp(gw3,s2,t2)
   + SOS1_LB_gprodUp(gw3,s2,t2) = 0
 SOS1_LB_gprodDn(gw3,s2,t2): - gprodDn(gw3,s2,t2)
   + SOS1_LB_gprodDn(gw3,s2,t2) = 0
 SOS1_LB_gsin_rt(gs1,s2,t2): - gsin_rt(gs1,s2,t2)
   + SOS1_LB_gsin_rt(gs1,s2,t2) = 0
 SOS1_LB_gsout_rt(gs1,s2,t2): - gsout_rt(gs1,s2,t2)
   + SOS1_LB_gsout_rt(gs1,s2,t2) = 0
 SOS1_LB_gstore_rt(gs1,s2,t2): - gstore_rt(gs1,s2,t2)
   + SOS1_LB_gstore_rt(gs1,s2,t2) = 0
 SOS1_LB_gshed(ng101,s2,t3): - gshed(ng101,s2,t3)
   + SOS1_LB_gshed(ng101,s2,t3) = 0
 SOS1_LB_gshed(ng102,s2,t3): - gshed(ng102,s2,t3)
   + SOS1_LB_gshed(ng102,s2,t3) = 0
 SOS1_LB_gflow_sr_rt(('ng101','ng102'),s2,t3):
   - gflow_sr_rt(('ng101','ng102'),s2,t3)
   + SOS1_LB_gflow_sr_rt(('ng101','ng102'),s2,t3) = 0
 SOS1_LB_qin_sr_rt(('ng101','ng102'),s2,t3):
   - qin_sr_rt(('ng101','ng102'),s2,t3)
   + SOS1_LB_qin_sr_rt(('ng101','ng102'),s2,t3) = 0
 SOS1_LB_qout_sr_rt(('ng101','ng102'),s2,t3):
   - qout_sr_rt(('ng101','ng102'),s2,t3)
   + SOS1_LB_qout_sr_rt(('ng101','ng102'),s2,t3) = 0
 SOS1_LB_gprodUp(gw1,s2,t3): - gprodUp(gw1,s2,t3)
   + SOS1_LB_gprodUp(gw1,s2,t3) = 0
 SOS1_LB_gprodDn(gw1,s2,t3): - gprodDn(gw1,s2,t3)
   + SOS1_LB_gprodDn(gw1,s2,t3) = 0
 SOS1_LB_gprodUp(gw2,s2,t3): - gprodUp(gw2,s2,t3)
   + SOS1_LB_gprodUp(gw2,s2,t3) = 0
 SOS1_LB_gprodDn(gw2,s2,t3): - gprodDn(gw2,s2,t3)
   + SOS1_LB_gprodDn(gw2,s2,t3) = 0
 SOS1_LB_gprodUp(gw3,s2,t3): - gprodUp(gw3,s2,t3)
   + SOS1_LB_gprodUp(gw3,s2,t3) = 0
 SOS1_LB_gprodDn(gw3,s2,t3): - gprodDn(gw3,s2,t3)
   + SOS1_LB_gprodDn(gw3,s2,t3) = 0
 SOS1_LB_gsin_rt(gs1,s2,t3): - gsin_rt(gs1,s2,t3)
   + SOS1_LB_gsin_rt(gs1,s2,t3) = 0
 SOS1_LB_gsout_rt(gs1,s2,t3): - gsout_rt(gs1,s2,t3)
   + SOS1_LB_gsout_rt(gs1,s2,t3) = 0
 SOS1_LB_gstore_rt(gs1,s2,t3): - gstore_rt(gs1,s2,t3)
   + SOS1_LB_gstore_rt(gs1,s2,t3) = 0
 SOS1_LB_gshed(ng101,s2,t4): - gshed(ng101,s2,t4)
   + SOS1_LB_gshed(ng101,s2,t4) = 0
 SOS1_LB_gshed(ng102,s2,t4): - gshed(ng102,s2,t4)
   + SOS1_LB_gshed(ng102,s2,t4) = 0
 SOS1_LB_gflow_sr_rt(('ng101','ng102'),s2,t4):
   - gflow_sr_rt(('ng101','ng102'),s2,t4)
   + SOS1_LB_gflow_sr_rt(('ng101','ng102'),s2,t4) = 0
 SOS1_LB_qin_sr_rt(('ng101','ng102'),s2,t4):
   - qin_sr_rt(('ng101','ng102'),s2,t4)
   + SOS1_LB_qin_sr_rt(('ng101','ng102'),s2,t4) = 0
 SOS1_LB_qout_sr_rt(('ng101','ng102'),s2,t4):
   - qout_sr_rt(('ng101','ng102'),s2,t4)
   + SOS1_LB_qout_sr_rt(('ng101','ng102'),s2,t4) = 0
 SOS1_LB_gprodUp(gw1,s2,t4): - gprodUp(gw1,s2,t4)
   + SOS1_LB_gprodUp(gw1,s2,t4) = 0
 SOS1_LB_gprodDn(gw1,s2,t4): - gprodDn(gw1,s2,t4)
   + SOS1_LB_gprodDn(gw1,s2,t4) = 0
 SOS1_LB_gprodUp(gw2,s2,t4): - gprodUp(gw2,s2,t4)
   + SOS1_LB_gprodUp(gw2,s2,t4) = 0
 SOS1_LB_gprodDn(gw2,s2,t4): - gprodDn(gw2,s2,t4)
   + SOS1_LB_gprodDn(gw2,s2,t4) = 0
 SOS1_LB_gprodUp(gw3,s2,t4): - gprodUp(gw3,s2,t4)
   + SOS1_LB_gprodUp(gw3,s2,t4) = 0
 SOS1_LB_gprodDn(gw3,s2,t4): - gprodDn(gw3,s2,t4)
   + SOS1_LB_gprodDn(gw3,s2,t4) = 0
 SOS1_LB_gsin_rt(gs1,s2,t4): - gsin_rt(gs1,s2,t4)
   + SOS1_LB_gsin_rt(gs1,s2,t4) = 0
 SOS1_LB_gsout_rt(gs1,s2,t4): - gsout_rt(gs1,s2,t4)
   + SOS1_LB_gsout_rt(gs1,s2,t4) = 0
 SOS1_LB_gstore_rt(gs1,s2,t4): - gstore_rt(gs1,s2,t4)
   + SOS1_LB_gstore_rt(gs1,s2,t4) = 0
 dLag/gshed(ng101,s1,t1): - lambda_gas_balance_rt(ng101,s1,t1)
   + mu_gas_shed_rt(ng101,s1,t1) - muLB_gshed(ng101,s1,t1) = -5000
 dLag/gshed(ng102,s1,t1): - lambda_gas_balance_rt(ng102,s1,t1)
   + mu_gas_shed_rt(ng102,s1,t1) - muLB_gshed(ng102,s1,t1) = -5000
 dLag/gflow_sr_rt(('ng101','ng102'),s1,t1):
   lambda_gflow_sr_io_rt(('ng101','ng102'),s1,t1)
   + mu_gflow_sr_limit_rt(('ng101','ng102'),s1,t1)
   - muLB_gflow_sr_rt(('ng101','ng102'),s1,t1) = 0
 dLag/qin_sr_rt(('ng101','ng102'),s1,t1):
   lambda_gas_balance_rt(ng101,s1,t1)
   - 0.5 lambda_gflow_sr_io_rt(('ng101','ng102'),s1,t1)
   + lambda_line_store_rt(('ng101','ng102'),s1,t1)
   - muLB_qin_sr_rt(('ng101','ng102'),s1,t1) = 0
 dLag/qout_sr_rt(('ng101','ng102'),s1,t1):
   - lambda_gas_balance_rt(ng102,s1,t1)
   - 0.5 lambda_gflow_sr_io_rt(('ng101','ng102'),s1,t1)
   - lambda_line_store_rt(('ng101','ng102'),s1,t1)
   - muLB_qout_sr_rt(('ng101','ng102'),s1,t1) = 0
 dLag/gprodUp(gw1,s1,t1): - lambda_gas_balance_rt(ng101,s1,t1)
   + mu_gprodUp_max(gw1,s1,t1) - muLB_gprodUp(gw1,s1,t1) = -1.05
 dLag/gprodDn(gw1,s1,t1): lambda_gas_balance_rt(ng101,s1,t1)
   + mu_gprodDn_max(gw1,s1,t1) - muLB_gprodDn(gw1,s1,t1) = 0.99
 dLag/gprodUp(gw2,s1,t1): - lambda_gas_balance_rt(ng101,s1,t1)
   + mu_gprodUp_max(gw2,s1,t1) - muLB_gprodUp(gw2,s1,t1) = -1.575
 dLag/gprodDn(gw2,s1,t1): lambda_gas_balance_rt(ng101,s1,t1)
   + mu_gprodDn_max(gw2,s1,t1) - muLB_gprodDn(gw2,s1,t1) = 1.485
 dLag/gprodUp(gw3,s1,t1): - lambda_gas_balance_rt(ng101,s1,t1)
   + mu_gprodUp_max(gw3,s1,t1) - muLB_gprodUp(gw3,s1,t1) = -2.1
 dLag/gprodDn(gw3,s1,t1): lambda_gas_balance_rt(ng101,s1,t1)
   + mu_gprodDn_max(gw3,s1,t1) - muLB_gprodDn(gw3,s1,t1) = 1.98
 dLag/gsin_rt(gs1,s1,t1): lambda_gas_balance_rt(ng102,s1,t1)
   + mu_gsinMax_rt(gs1,t1,s1) - lambda_gstor_def_rt(gs1,s1,t1)
   - muLB_gsin_rt(gs1,s1,t1) = 0
 dLag/gsout_rt(gs1,s1,t1): - lambda_gas_balance_rt(ng102,s1,t1)
   + mu_gsoutMax_rt(gs1,t1,s1) + lambda_gstor_def_rt(gs1,s1,t1)
   - muLB_gsout_rt(gs1,s1,t1) = 0
 dLag/gstore_rt(gs1,s1,t1): mu_gstore_max_rt(gs1,t1,s1)
   - mu_gstore_min_rt(gs1,t1,s1) - lambda_gstor_def_rt(gs1,s1,t2)
   + lambda_gstor_def_rt(gs1,s1,t1) - muLB_gstore_rt(gs1,s1,t1) = 0
 dLag/gshed(ng101,s1,t2): - lambda_gas_balance_rt(ng101,s1,t2)
   + mu_gas_shed_rt(ng101,s1,t2) - muLB_gshed(ng101,s1,t2) = -5000
 dLag/gshed(ng102,s1,t2): - lambda_gas_balance_rt(ng102,s1,t2)
   + mu_gas_shed_rt(ng102,s1,t2) - muLB_gshed(ng102,s1,t2) = -5000
 dLag/gflow_sr_rt(('ng101','ng102'),s1,t2):
   lambda_gflow_sr_io_rt(('ng101','ng102'),s1,t2)
   + mu_gflow_sr_limit_rt(('ng101','ng102'),s1,t2)
   - muLB_gflow_sr_rt(('ng101','ng102'),s1,t2) = 0
 dLag/qin_sr_rt(('ng101','ng102'),s1,t2):
   lambda_gas_balance_rt(ng101,s1,t2)
   - 0.5 lambda_gflow_sr_io_rt(('ng101','ng102'),s1,t2)
   + lambda_line_store_rt(('ng101','ng102'),s1,t2)
   - muLB_qin_sr_rt(('ng101','ng102'),s1,t2) = 0
 dLag/qout_sr_rt(('ng101','ng102'),s1,t2):
   - lambda_gas_balance_rt(ng102,s1,t2)
   - 0.5 lambda_gflow_sr_io_rt(('ng101','ng102'),s1,t2)
   - lambda_line_store_rt(('ng101','ng102'),s1,t2)
   - muLB_qout_sr_rt(('ng101','ng102'),s1,t2) = 0
 dLag/gprodUp(gw1,s1,t2): - lambda_gas_balance_rt(ng101,s1,t2)
   + mu_gprodUp_max(gw1,s1,t2) - muLB_gprodUp(gw1,s1,t2) = -1.05
 dLag/gprodDn(gw1,s1,t2): lambda_gas_balance_rt(ng101,s1,t2)
   + mu_gprodDn_max(gw1,s1,t2) - muLB_gprodDn(gw1,s1,t2) = 0.99
 dLag/gprodUp(gw2,s1,t2): - lambda_gas_balance_rt(ng101,s1,t2)
   + mu_gprodUp_max(gw2,s1,t2) - muLB_gprodUp(gw2,s1,t2) = -1.575
 dLag/gprodDn(gw2,s1,t2): lambda_gas_balance_rt(ng101,s1,t2)
   + mu_gprodDn_max(gw2,s1,t2) - muLB_gprodDn(gw2,s1,t2) = 1.485
 dLag/gprodUp(gw3,s1,t2): - lambda_gas_balance_rt(ng101,s1,t2)
   + mu_gprodUp_max(gw3,s1,t2) - muLB_gprodUp(gw3,s1,t2) = -2.1
 dLag/gprodDn(gw3,s1,t2): lambda_gas_balance_rt(ng101,s1,t2)
   + mu_gprodDn_max(gw3,s1,t2) - muLB_gprodDn(gw3,s1,t2) = 1.98
 dLag/gsin_rt(gs1,s1,t2): lambda_gas_balance_rt(ng102,s1,t2)
   + mu_gsinMax_rt(gs1,t2,s1) - lambda_gstor_def_rt(gs1,s1,t2)
   - muLB_gsin_rt(gs1,s1,t2) = 0
 dLag/gsout_rt(gs1,s1,t2): - lambda_gas_balance_rt(ng102,s1,t2)
   + mu_gsoutMax_rt(gs1,t2,s1) + lambda_gstor_def_rt(gs1,s1,t2)
   - muLB_gsout_rt(gs1,s1,t2) = 0
 dLag/gstore_rt(gs1,s1,t2): mu_gstore_max_rt(gs1,t2,s1)
   - mu_gstore_min_rt(gs1,t2,s1) + lambda_gstor_def_rt(gs1,s1,t2)
   - lambda_gstor_def_rt(gs1,s1,t3) - muLB_gstore_rt(gs1,s1,t2) = 0
 dLag/gshed(ng101,s1,t3): - lambda_gas_balance_rt(ng101,s1,t3)
   + mu_gas_shed_rt(ng101,s1,t3) - muLB_gshed(ng101,s1,t3) = -5000
 dLag/gshed(ng102,s1,t3): - lambda_gas_balance_rt(ng102,s1,t3)
   + mu_gas_shed_rt(ng102,s1,t3) - muLB_gshed(ng102,s1,t3) = -5000
 dLag/gflow_sr_rt(('ng101','ng102'),s1,t3):
   lambda_gflow_sr_io_rt(('ng101','ng102'),s1,t3)
   + mu_gflow_sr_limit_rt(('ng101','ng102'),s1,t3)
   - muLB_gflow_sr_rt(('ng101','ng102'),s1,t3) = 0
 dLag/qin_sr_rt(('ng101','ng102'),s1,t3):
   lambda_gas_balance_rt(ng101,s1,t3)
   - 0.5 lambda_gflow_sr_io_rt(('ng101','ng102'),s1,t3)
   + lambda_line_store_rt(('ng101','ng102'),s1,t3)
   - muLB_qin_sr_rt(('ng101','ng102'),s1,t3) = 0
 dLag/qout_sr_rt(('ng101','ng102'),s1,t3):
   - lambda_gas_balance_rt(ng102,s1,t3)
   - 0.5 lambda_gflow_sr_io_rt(('ng101','ng102'),s1,t3)
   - lambda_line_store_rt(('ng101','ng102'),s1,t3)
   - muLB_qout_sr_rt(('ng101','ng102'),s1,t3) = 0
 dLag/gprodUp(gw1,s1,t3): - lambda_gas_balance_rt(ng101,s1,t3)
   + mu_gprodUp_max(gw1,s1,t3) - muLB_gprodUp(gw1,s1,t3) = -1.05
 dLag/gprodDn(gw1,s1,t3): lambda_gas_balance_rt(ng101,s1,t3)
   + mu_gprodDn_max(gw1,s1,t3) - muLB_gprodDn(gw1,s1,t3) = 0.99
 dLag/gprodUp(gw2,s1,t3): - lambda_gas_balance_rt(ng101,s1,t3)
   + mu_gprodUp_max(gw2,s1,t3) - muLB_gprodUp(gw2,s1,t3) = -1.575
 dLag/gprodDn(gw2,s1,t3): lambda_gas_balance_rt(ng101,s1,t3)
   + mu_gprodDn_max(gw2,s1,t3) - muLB_gprodDn(gw2,s1,t3) = 1.485
 dLag/gprodUp(gw3,s1,t3): - lambda_gas_balance_rt(ng101,s1,t3)
   + mu_gprodUp_max(gw3,s1,t3) - muLB_gprodUp(gw3,s1,t3) = -2.1
 dLag/gprodDn(gw3,s1,t3): lambda_gas_balance_rt(ng101,s1,t3)
   + mu_gprodDn_max(gw3,s1,t3) - muLB_gprodDn(gw3,s1,t3) = 1.98
 dLag/gsin_rt(gs1,s1,t3): lambda_gas_balance_rt(ng102,s1,t3)
   + mu_gsinMax_rt(gs1,t3,s1) - lambda_gstor_def_rt(gs1,s1,t3)
   - muLB_gsin_rt(gs1,s1,t3) = 0
 dLag/gsout_rt(gs1,s1,t3): - lambda_gas_balance_rt(ng102,s1,t3)
   + mu_gsoutMax_rt(gs1,t3,s1) + lambda_gstor_def_rt(gs1,s1,t3)
   - muLB_gsout_rt(gs1,s1,t3) = 0
 dLag/gstore_rt(gs1,s1,t3): mu_gstore_max_rt(gs1,t3,s1)
   - mu_gstore_min_rt(gs1,t3,s1) + lambda_gstor_def_rt(gs1,s1,t3)
   - lambda_gstor_def_rt(gs1,s1,t4) - muLB_gstore_rt(gs1,s1,t3) = 0
 dLag/gshed(ng101,s1,t4): - lambda_gas_balance_rt(ng101,s1,t4)
   + mu_gas_shed_rt(ng101,s1,t4) - muLB_gshed(ng101,s1,t4) = -5000
 dLag/gshed(ng102,s1,t4): - lambda_gas_balance_rt(ng102,s1,t4)
   + mu_gas_shed_rt(ng102,s1,t4) - muLB_gshed(ng102,s1,t4) = -5000
 dLag/gflow_sr_rt(('ng101','ng102'),s1,t4):
   lambda_gflow_sr_io_rt(('ng101','ng102'),s1,t4)
   + mu_gflow_sr_limit_rt(('ng101','ng102'),s1,t4)
   - muLB_gflow_sr_rt(('ng101','ng102'),s1,t4) = 0
 dLag/qin_sr_rt(('ng101','ng102'),s1,t4):
   lambda_gas_balance_rt(ng101,s1,t4)
   - 0.5 lambda_gflow_sr_io_rt(('ng101','ng102'),s1,t4)
   + lambda_line_store_rt(('ng101','ng102'),s1,t4)
   - muLB_qin_sr_rt(('ng101','ng102'),s1,t4) = 0
 dLag/qout_sr_rt(('ng101','ng102'),s1,t4):
   - lambda_gas_balance_rt(ng102,s1,t4)
   - 0.5 lambda_gflow_sr_io_rt(('ng101','ng102'),s1,t4)
   - lambda_line_store_rt(('ng101','ng102'),s1,t4)
   - muLB_qout_sr_rt(('ng101','ng102'),s1,t4) = 0
 dLag/gprodUp(gw1,s1,t4): - lambda_gas_balance_rt(ng101,s1,t4)
   + mu_gprodUp_max(gw1,s1,t4) - muLB_gprodUp(gw1,s1,t4) = -1.05
 dLag/gprodDn(gw1,s1,t4): lambda_gas_balance_rt(ng101,s1,t4)
   + mu_gprodDn_max(gw1,s1,t4) - muLB_gprodDn(gw1,s1,t4) = 0.99
 dLag/gprodUp(gw2,s1,t4): - lambda_gas_balance_rt(ng101,s1,t4)
   + mu_gprodUp_max(gw2,s1,t4) - muLB_gprodUp(gw2,s1,t4) = -1.575
 dLag/gprodDn(gw2,s1,t4): lambda_gas_balance_rt(ng101,s1,t4)
   + mu_gprodDn_max(gw2,s1,t4) - muLB_gprodDn(gw2,s1,t4) = 1.485
 dLag/gprodUp(gw3,s1,t4): - lambda_gas_balance_rt(ng101,s1,t4)
   + mu_gprodUp_max(gw3,s1,t4) - muLB_gprodUp(gw3,s1,t4) = -2.1
 dLag/gprodDn(gw3,s1,t4): lambda_gas_balance_rt(ng101,s1,t4)
   + mu_gprodDn_max(gw3,s1,t4) - muLB_gprodDn(gw3,s1,t4) = 1.98
 dLag/gsin_rt(gs1,s1,t4): lambda_gas_balance_rt(ng102,s1,t4)
   + mu_gsinMax_rt(gs1,t4,s1) - lambda_gstor_def_rt(gs1,s1,t4)
   - muLB_gsin_rt(gs1,s1,t4) = 0
 dLag/gsout_rt(gs1,s1,t4): - lambda_gas_balance_rt(ng102,s1,t4)
   + mu_gsoutMax_rt(gs1,t4,s1) + lambda_gstor_def_rt(gs1,s1,t4)
   - muLB_gsout_rt(gs1,s1,t4) = 0
 dLag/gstore_rt(gs1,s1,t4): mu_gstore_max_rt(gs1,t4,s1)
   - mu_gstore_min_rt(gs1,t4,s1) + lambda_gstor_def_rt(gs1,s1,t4)
   - mu_gstor_end(gs1,s1) - muLB_gstore_rt(gs1,s1,t4) = 0
 dLag/gshed(ng101,s2,t1): - lambda_gas_balance_rt(ng101,s2,t1)
   + mu_gas_shed_rt(ng101,s2,t1) - muLB_gshed(ng101,s2,t1) = -5000
 dLag/gshed(ng102,s2,t1): - lambda_gas_balance_rt(ng102,s2,t1)
   + mu_gas_shed_rt(ng102,s2,t1) - muLB_gshed(ng102,s2,t1) = -5000
 dLag/gflow_sr_rt(('ng101','ng102'),s2,t1):
   lambda_gflow_sr_io_rt(('ng101','ng102'),s2,t1)
   + mu_gflow_sr_limit_rt(('ng101','ng102'),s2,t1)
   - muLB_gflow_sr_rt(('ng101','ng102'),s2,t1) = 0
 dLag/qin_sr_rt(('ng101','ng102'),s2,t1):
   lambda_gas_balance_rt(ng101,s2,t1)
   - 0.5 lambda_gflow_sr_io_rt(('ng101','ng102'),s2,t1)
   + lambda_line_store_rt(('ng101','ng102'),s2,t1)
   - muLB_qin_sr_rt(('ng101','ng102'),s2,t1) = 0
 dLag/qout_sr_rt(('ng101','ng102'),s2,t1):
   - lambda_gas_balance_rt(ng102,s2,t1)
   - 0.5 lambda_gflow_sr_io_rt(('ng101','ng102'),s2,t1)
   - lambda_line_store_rt(('ng101','ng102'),s2,t1)
   - muLB_qout_sr_rt(('ng101','ng102'),s2,t1) = 0
 dLag/gprodUp(gw1,s2,t1): - lambda_gas_balance_rt(ng101,s2,t1)
   + mu_gprodUp_max(gw1,s2,t1) - muLB_gprodUp(gw1,s2,t1) = -1.05
 dLag/gprodDn(gw1,s2,t1): lambda_gas_balance_rt(ng101,s2,t1)
   + mu_gprodDn_max(gw1,s2,t1) - muLB_gprodDn(gw1,s2,t1) = 0.99
 dLag/gprodUp(gw2,s2,t1): - lambda_gas_balance_rt(ng101,s2,t1)
   + mu_gprodUp_max(gw2,s2,t1) - muLB_gprodUp(gw2,s2,t1) = -1.575
 dLag/gprodDn(gw2,s2,t1): lambda_gas_balance_rt(ng101,s2,t1)
   + mu_gprodDn_max(gw2,s2,t1) - muLB_gprodDn(gw2,s2,t1) = 1.485
 dLag/gprodUp(gw3,s2,t1): - lambda_gas_balance_rt(ng101,s2,t1)
   + mu_gprodUp_max(gw3,s2,t1) - muLB_gprodUp(gw3,s2,t1) = -2.1
 dLag/gprodDn(gw3,s2,t1): lambda_gas_balance_rt(ng101,s2,t1)
   + mu_gprodDn_max(gw3,s2,t1) - muLB_gprodDn(gw3,s2,t1) = 1.98
 dLag/gsin_rt(gs1,s2,t1): lambda_gas_balance_rt(ng102,s2,t1)
   + mu_gsinMax_rt(gs1,t1,s2) - lambda_gstor_def_rt(gs1,s2,t1)
   - muLB_gsin_rt(gs1,s2,t1) = 0
 dLag/gsout_rt(gs1,s2,t1): - lambda_gas_balance_rt(ng102,s2,t1)
   + mu_gsoutMax_rt(gs1,t1,s2) + lambda_gstor_def_rt(gs1,s2,t1)
   - muLB_gsout_rt(gs1,s2,t1) = 0
 dLag/gstore_rt(gs1,s2,t1): mu_gstore_max_rt(gs1,t1,s2)
   - mu_gstore_min_rt(gs1,t1,s2) - lambda_gstor_def_rt(gs1,s2,t2)
   + lambda_gstor_def_rt(gs1,s2,t1) - muLB_gstore_rt(gs1,s2,t1) = 0
 dLag/gshed(ng101,s2,t2): - lambda_gas_balance_rt(ng101,s2,t2)
   + mu_gas_shed_rt(ng101,s2,t2) - muLB_gshed(ng101,s2,t2) = -5000
 dLag/gshed(ng102,s2,t2): - lambda_gas_balance_rt(ng102,s2,t2)
   + mu_gas_shed_rt(ng102,s2,t2) - muLB_gshed(ng102,s2,t2) = -5000
 dLag/gflow_sr_rt(('ng101','ng102'),s2,t2):
   lambda_gflow_sr_io_rt(('ng101','ng102'),s2,t2)
   + mu_gflow_sr_limit_rt(('ng101','ng102'),s2,t2)
   - muLB_gflow_sr_rt(('ng101','ng102'),s2,t2) = 0
 dLag/qin_sr_rt(('ng101','ng102'),s2,t2):
   lambda_gas_balance_rt(ng101,s2,t2)
   - 0.5 lambda_gflow_sr_io_rt(('ng101','ng102'),s2,t2)
   + lambda_line_store_rt(('ng101','ng102'),s2,t2)
   - muLB_qin_sr_rt(('ng101','ng102'),s2,t2) = 0
 dLag/qout_sr_rt(('ng101','ng102'),s2,t2):
   - lambda_gas_balance_rt(ng102,s2,t2)
   - 0.5 lambda_gflow_sr_io_rt(('ng101','ng102'),s2,t2)
   - lambda_line_store_rt(('ng101','ng102'),s2,t2)
   - muLB_qout_sr_rt(('ng101','ng102'),s2,t2) = 0
 dLag/gprodUp(gw1,s2,t2): - lambda_gas_balance_rt(ng101,s2,t2)
   + mu_gprodUp_max(gw1,s2,t2) - muLB_gprodUp(gw1,s2,t2) = -1.05
 dLag/gprodDn(gw1,s2,t2): lambda_gas_balance_rt(ng101,s2,t2)
   + mu_gprodDn_max(gw1,s2,t2) - muLB_gprodDn(gw1,s2,t2) = 0.99
 dLag/gprodUp(gw2,s2,t2): - lambda_gas_balance_rt(ng101,s2,t2)
   + mu_gprodUp_max(gw2,s2,t2) - muLB_gprodUp(gw2,s2,t2) = -1.575
 dLag/gprodDn(gw2,s2,t2): lambda_gas_balance_rt(ng101,s2,t2)
   + mu_gprodDn_max(gw2,s2,t2) - muLB_gprodDn(gw2,s2,t2) = 1.485
 dLag/gprodUp(gw3,s2,t2): - lambda_gas_balance_rt(ng101,s2,t2)
   + mu_gprodUp_max(gw3,s2,t2) - muLB_gprodUp(gw3,s2,t2) = -2.1
 dLag/gprodDn(gw3,s2,t2): lambda_gas_balance_rt(ng101,s2,t2)
   + mu_gprodDn_max(gw3,s2,t2) - muLB_gprodDn(gw3,s2,t2) = 1.98
 dLag/gsin_rt(gs1,s2,t2): lambda_gas_balance_rt(ng102,s2,t2)
   + mu_gsinMax_rt(gs1,t2,s2) - lambda_gstor_def_rt(gs1,s2,t2)
   - muLB_gsin_rt(gs1,s2,t2) = 0
 dLag/gsout_rt(gs1,s2,t2): - lambda_gas_balance_rt(ng102,s2,t2)
   + mu_gsoutMax_rt(gs1,t2,s2) + lambda_gstor_def_rt(gs1,s2,t2)
   - muLB_gsout_rt(gs1,s2,t2) = 0
 dLag/gstore_rt(gs1,s2,t2): mu_gstore_max_rt(gs1,t2,s2)
   - mu_gstore_min_rt(gs1,t2,s2) + lambda_gstor_def_rt(gs1,s2,t2)
   - lambda_gstor_def_rt(gs1,s2,t3) - muLB_gstore_rt(gs1,s2,t2) = 0
 dLag/gshed(ng101,s2,t3): - lambda_gas_balance_rt(ng101,s2,t3)
   + mu_gas_shed_rt(ng101,s2,t3) - muLB_gshed(ng101,s2,t3) = -5000
 dLag/gshed(ng102,s2,t3): - lambda_gas_balance_rt(ng102,s2,t3)
   + mu_gas_shed_rt(ng102,s2,t3) - muLB_gshed(ng102,s2,t3) = -5000
 dLag/gflow_sr_rt(('ng101','ng102'),s2,t3):
   lambda_gflow_sr_io_rt(('ng101','ng102'),s2,t3)
   + mu_gflow_sr_limit_rt(('ng101','ng102'),s2,t3)
   - muLB_gflow_sr_rt(('ng101','ng102'),s2,t3) = 0
 dLag/qin_sr_rt(('ng101','ng102'),s2,t3):
   lambda_gas_balance_rt(ng101,s2,t3)
   - 0.5 lambda_gflow_sr_io_rt(('ng101','ng102'),s2,t3)
   + lambda_line_store_rt(('ng101','ng102'),s2,t3)
   - muLB_qin_sr_rt(('ng101','ng102'),s2,t3) = 0
 dLag/qout_sr_rt(('ng101','ng102'),s2,t3):
   - lambda_gas_balance_rt(ng102,s2,t3)
   - 0.5 lambda_gflow_sr_io_rt(('ng101','ng102'),s2,t3)
   - lambda_line_store_rt(('ng101','ng102'),s2,t3)
   - muLB_qout_sr_rt(('ng101','ng102'),s2,t3) = 0
 dLag/gprodUp(gw1,s2,t3): - lambda_gas_balance_rt(ng101,s2,t3)
   + mu_gprodUp_max(gw1,s2,t3) - muLB_gprodUp(gw1,s2,t3) = -1.05
 dLag/gprodDn(gw1,s2,t3): lambda_gas_balance_rt(ng101,s2,t3)
   + mu_gprodDn_max(gw1,s2,t3) - muLB_gprodDn(gw1,s2,t3) = 0.99
 dLag/gprodUp(gw2,s2,t3): - lambda_gas_balance_rt(ng101,s2,t3)
   + mu_gprodUp_max(gw2,s2,t3) - muLB_gprodUp(gw2,s2,t3) = -1.575
 dLag/gprodDn(gw2,s2,t3): lambda_gas_balance_rt(ng101,s2,t3)
   + mu_gprodDn_max(gw2,s2,t3) - muLB_gprodDn(gw2,s2,t3) = 1.485
 dLag/gprodUp(gw3,s2,t3): - lambda_gas_balance_rt(ng101,s2,t3)
   + mu_gprodUp_max(gw3,s2,t3) - muLB_gprodUp(gw3,s2,t3) = -2.1
 dLag/gprodDn(gw3,s2,t3): lambda_gas_balance_rt(ng101,s2,t3)
   + mu_gprodDn_max(gw3,s2,t3) - muLB_gprodDn(gw3,s2,t3) = 1.98
 dLag/gsin_rt(gs1,s2,t3): lambda_gas_balance_rt(ng102,s2,t3)
   + mu_gsinMax_rt(gs1,t3,s2) - lambda_gstor_def_rt(gs1,s2,t3)
   - muLB_gsin_rt(gs1,s2,t3) = 0
 dLag/gsout_rt(gs1,s2,t3): - lambda_gas_balance_rt(ng102,s2,t3)
   + mu_gsoutMax_rt(gs1,t3,s2) + lambda_gstor_def_rt(gs1,s2,t3)
   - muLB_gsout_rt(gs1,s2,t3) = 0
 dLag/gstore_rt(gs1,s2,t3): mu_gstore_max_rt(gs1,t3,s2)
   - mu_gstore_min_rt(gs1,t3,s2) + lambda_gstor_def_rt(gs1,s2,t3)
   - lambda_gstor_def_rt(gs1,s2,t4) - muLB_gstore_rt(gs1,s2,t3) = 0
 dLag/gshed(ng101,s2,t4): - lambda_gas_balance_rt(ng101,s2,t4)
   + mu_gas_shed_rt(ng101,s2,t4) - muLB_gshed(ng101,s2,t4) = -5000
 dLag/gshed(ng102,s2,t4): - lambda_gas_balance_rt(ng102,s2,t4)
   + mu_gas_shed_rt(ng102,s2,t4) - muLB_gshed(ng102,s2,t4) = -5000
 dLag/gflow_sr_rt(('ng101','ng102'),s2,t4):
   lambda_gflow_sr_io_rt(('ng101','ng102'),s2,t4)
   + mu_gflow_sr_limit_rt(('ng101','ng102'),s2,t4)
   - muLB_gflow_sr_rt(('ng101','ng102'),s2,t4) = 0
 dLag/qin_sr_rt(('ng101','ng102'),s2,t4):
   lambda_gas_balance_rt(ng101,s2,t4)
   - 0.5 lambda_gflow_sr_io_rt(('ng101','ng102'),s2,t4)
   + lambda_line_store_rt(('ng101','ng102'),s2,t4)
   - muLB_qin_sr_rt(('ng101','ng102'),s2,t4) = 0
 dLag/qout_sr_rt(('ng101','ng102'),s2,t4):
   - lambda_gas_balance_rt(ng102,s2,t4)
   - 0.5 lambda_gflow_sr_io_rt(('ng101','ng102'),s2,t4)
   - lambda_line_store_rt(('ng101','ng102'),s2,t4)
   - muLB_qout_sr_rt(('ng101','ng102'),s2,t4) = 0
 dLag/gprodUp(gw1,s2,t4): - lambda_gas_balance_rt(ng101,s2,t4)
   + mu_gprodUp_max(gw1,s2,t4) - muLB_gprodUp(gw1,s2,t4) = -1.05
 dLag/gprodDn(gw1,s2,t4): lambda_gas_balance_rt(ng101,s2,t4)
   + mu_gprodDn_max(gw1,s2,t4) - muLB_gprodDn(gw1,s2,t4) = 0.99
 dLag/gprodUp(gw2,s2,t4): - lambda_gas_balance_rt(ng101,s2,t4)
   + mu_gprodUp_max(gw2,s2,t4) - muLB_gprodUp(gw2,s2,t4) = -1.575
 dLag/gprodDn(gw2,s2,t4): lambda_gas_balance_rt(ng101,s2,t4)
   + mu_gprodDn_max(gw2,s2,t4) - muLB_gprodDn(gw2,s2,t4) = 1.485
 dLag/gprodUp(gw3,s2,t4): - lambda_gas_balance_rt(ng101,s2,t4)
   + mu_gprodUp_max(gw3,s2,t4) - muLB_gprodUp(gw3,s2,t4) = -2.1
 dLag/gprodDn(gw3,s2,t4): lambda_gas_balance_rt(ng101,s2,t4)
   + mu_gprodDn_max(gw3,s2,t4) - muLB_gprodDn(gw3,s2,t4) = 1.98
 dLag/gsin_rt(gs1,s2,t4): lambda_gas_balance_rt(ng102,s2,t4)
   + mu_gsinMax_rt(gs1,t4,s2) - lambda_gstor_def_rt(gs1,s2,t4)
   - muLB_gsin_rt(gs1,s2,t4) = 0
 dLag/gsout_rt(gs1,s2,t4): - lambda_gas_balance_rt(ng102,s2,t4)
   + mu_gsoutMax_rt(gs1,t4,s2) + lambda_gstor_def_rt(gs1,s2,t4)
   - muLB_gsout_rt(gs1,s2,t4) = 0
 dLag/gstore_rt(gs1,s2,t4): mu_gstore_max_rt(gs1,t4,s2)
   - mu_gstore_min_rt(gs1,t4,s2) + lambda_gstor_def_rt(gs1,s2,t4)
   - mu_gstor_end(gs1,s2) - muLB_gstore_rt(gs1,s2,t4) = 0
Bounds
 lambda_gas_balance_rt(ng101,s1,t1) free
 lambda_gas_balance_rt(ng101,s1,t2) free
 lambda_gas_balance_rt(ng101,s1,t3) free
 lambda_gas_balance_rt(ng101,s1,t4) free
 lambda_gas_balance_rt(ng102,s1,t1) free
 lambda_gas_balance_rt(ng102,s1,t2) free
 lambda_gas_balance_rt(ng102,s1,t3) free
 lambda_gas_balance_rt(ng102,s1,t4) free
 lambda_gas_balance_rt(ng101,s2,t1) free
 lambda_gas_balance_rt(ng101,s2,t2) free
 lambda_gas_balance_rt(ng101,s2,t3) free
 lambda_gas_balance_rt(ng101,s2,t4) free
 lambda_gas_balance_rt(ng102,s2,t1) free
 lambda_gas_balance_rt(ng102,s2,t2) free
 lambda_gas_balance_rt(ng102,s2,t3) free
 lambda_gas_balance_rt(ng102,s2,t4) free
 lambda_gflow_sr_io_rt(('ng101','ng102'),s1,t1) free
 lambda_gflow_sr_io_rt(('ng101','ng102'),s2,t1) free
 lambda_gflow_sr_io_rt(('ng101','ng102'),s1,t2) free
 lambda_gflow_sr_io_rt(('ng101','ng102'),s2,t2) free
 lambda_gflow_sr_io_rt(('ng101','ng102'),s1,t3) free
 lambda_gflow_sr_io_rt(('ng101','ng102'),s2,t3) free
 lambda_gflow_sr_io_rt(('ng101','ng102'),s1,t4) free
 lambda_gflow_sr_io_rt(('ng101','ng102'),s2,t4) free
 lambda_line_store_rt(('ng101','ng102'),s1,t1) free
 lambda_line_store_rt(('ng101','ng102'),s1,t2) free
 lambda_line_store_rt(('ng101','ng102'),s1,t3) free
 lambda_line_store_rt(('ng101','ng102'),s1,t4) free
 lambda_line_store_rt(('ng101','ng102'),s2,t1) free
 lambda_line_store_rt(('ng101','ng102'),s2,t2) free
 lambda_line_store_rt(('ng101','ng102'),s2,t3) free
 lambda_line_store_rt(('ng101','ng102'),s2,t4) free
 lambda_gstor_def_rt(gs1,s1,t2) free
 lambda_gstor_def_rt(gs1,s1,t3) free
 lambda_gstor_def_rt(gs1,s1,t4) free
 lambda_gstor_def_rt(gs1,s1,t1) free
 lambda_gstor_def_rt(gs1,s2,t2) free
 lambda_gstor_def_rt(gs1,s2,t3) free
 lambda_gstor_def_rt(gs1,s2,t4) free
 lambda_gstor_def_rt(gs1,s2,t1) free
SOS
 s0:  S1 :: mu_gflow_sr_limit_rt(('ng101','ng102'),s1,t1):1
     SOS1_gflow_sr_limit_rt(('ng101','ng102'),s1,t1):2
 s1:  S1 :: mu_gflow_sr_limit_rt(('ng101','ng102'),s2,t1):1
     SOS1_gflow_sr_limit_rt(('ng101','ng102'),s2,t1):2
 s2:  S1 :: mu_gflow_sr_limit_rt(('ng101','ng102'),s1,t2):1
     SOS1_gflow_sr_limit_rt(('ng101','ng102'),s1,t2):2
 s3:  S1 :: mu_gflow_sr_limit_rt(('ng101','ng102'),s2,t2):1
     SOS1_gflow_sr_limit_rt(('ng101','ng102'),s2,t2):2
 s4:  S1 :: mu_gflow_sr_limit_rt(('ng101','ng102'),s1,t3):1
     SOS1_gflow_sr_limit_rt(('ng101','ng102'),s1,t3):2
 s5:  S1 :: mu_gflow_sr_limit_rt(('ng101','ng102'),s2,t3):1
     SOS1_gflow_sr_limit_rt(('ng101','ng102'),s2,t3):2
 s6:  S1 :: mu_gflow_sr_limit_rt(('ng101','ng102'),s1,t4):1
     SOS1_gflow_sr_limit_rt(('ng101','ng102'),s1,t4):2
 s7:  S1 :: mu_gflow_sr_limit_rt(('ng101','ng102'),s2,t4):1
     SOS1_gflow_sr_limit_rt(('ng101','ng102'),s2,t4):2
 s8:  S1 :: mu_gprodUp_max(gw1,s1,t1):1 SOS1_gprodUp_max(gw1,s1,t1):2
 s9:  S1 :: mu_gprodDn_max(gw1,s1,t1):1 SOS1_gprodDn_max(gw1,s1,t1):2
 s10:  S1 :: mu_gprodUp_max(gw1,s1,t2):1 SOS1_gprodUp_max(gw1,s1,t2):2
 s11:  S1 :: mu_gprodDn_max(gw1,s1,t2):1 SOS1_gprodDn_max(gw1,s1,t2):2
 s12:  S1 :: mu_gprodUp_max(gw1,s1,t3):1 SOS1_gprodUp_max(gw1,s1,t3):2
 s13:  S1 :: mu_gprodDn_max(gw1,s1,t3):1 SOS1_gprodDn_max(gw1,s1,t3):2
 s14:  S1 :: mu_gprodUp_max(gw1,s1,t4):1 SOS1_gprodUp_max(gw1,s1,t4):2
 s15:  S1 :: mu_gprodDn_max(gw1,s1,t4):1 SOS1_gprodDn_max(gw1,s1,t4):2
 s16:  S1 :: mu_gprodUp_max(gw1,s2,t1):1 SOS1_gprodUp_max(gw1,s2,t1):2
 s17:  S1 :: mu_gprodDn_max(gw1,s2,t1):1 SOS1_gprodDn_max(gw1,s2,t1):2
 s18:  S1 :: mu_gprodUp_max(gw1,s2,t2):1 SOS1_gprodUp_max(gw1,s2,t2):2
 s19:  S1 :: mu_gprodDn_max(gw1,s2,t2):1 SOS1_gprodDn_max(gw1,s2,t2):2
 s20:  S1 :: mu_gprodUp_max(gw1,s2,t3):1 SOS1_gprodUp_max(gw1,s2,t3):2
 s21:  S1 :: mu_gprodDn_max(gw1,s2,t3):1 SOS1_gprodDn_max(gw1,s2,t3):2
 s22:  S1 :: mu_gprodUp_max(gw1,s2,t4):1 SOS1_gprodUp_max(gw1,s2,t4):2
 s23:  S1 :: mu_gprodDn_max(gw1,s2,t4):1 SOS1_gprodDn_max(gw1,s2,t4):2
 s24:  S1 :: mu_gprodUp_max(gw2,s1,t1):1 SOS1_gprodUp_max(gw2,s1,t1):2
 s25:  S1 :: mu_gprodDn_max(gw2,s1,t1):1 SOS1_gprodDn_max(gw2,s1,t1):2
 s26:  S1 :: mu_gprodUp_max(gw2,s1,t2):1 SOS1_gprodUp_max(gw2,s1,t2):2
 s27:  S1 :: mu_gprodDn_max(gw2,s1,t2):1 SOS1_gprodDn_max(gw2,s1,t2):2
 s28:  S1 :: mu_gprodUp_max(gw2,s1,t3):1 SOS1_gprodUp_max(gw2,s1,t3):2
 s29:  S1 :: mu_gprodDn_max(gw2,s1,t3):1 SOS1_gprodDn_max(gw2,s1,t3):2
 s30:  S1 :: mu_gprodUp_max(gw2,s1,t4):1 SOS1_gprodUp_max(gw2,s1,t4):2
 s31:  S1 :: mu_gprodDn_max(gw2,s1,t4):1 SOS1_gprodDn_max(gw2,s1,t4):2
 s32:  S1 :: mu_gprodUp_max(gw2,s2,t1):1 SOS1_gprodUp_max(gw2,s2,t1):2
 s33:  S1 :: mu_gprodDn_max(gw2,s2,t1):1 SOS1_gprodDn_max(gw2,s2,t1):2
 s34:  S1 :: mu_gprodUp_max(gw2,s2,t2):1 SOS1_gprodUp_max(gw2,s2,t2):2
 s35:  S1 :: mu_gprodDn_max(gw2,s2,t2):1 SOS1_gprodDn_max(gw2,s2,t2):2
 s36:  S1 :: mu_gprodUp_max(gw2,s2,t3):1 SOS1_gprodUp_max(gw2,s2,t3):2
 s37:  S1 :: mu_gprodDn_max(gw2,s2,t3):1 SOS1_gprodDn_max(gw2,s2,t3):2
 s38:  S1 :: mu_gprodUp_max(gw2,s2,t4):1 SOS1_gprodUp_max(gw2,s2,t4):2
 s39:  S1 :: mu_gprodDn_max(gw2,s2,t4):1 SOS1_gprodDn_max(gw2,s2,t4):2
 s40:  S1 :: mu_gprodUp_max(gw3,s1,t1):1 SOS1_gprodUp_max(gw3,s1,t1):2
 s41:  S1 :: mu_gprodDn_max(gw3,s1,t1):1 SOS1_gprodDn_max(gw3,s1,t1):2
 s42:  S1 :: mu_gprodUp_max(gw3,s1,t2):1 SOS1_gprodUp_max(gw3,s1,t2):2
 s43:  S1 :: mu_gprodDn_max(gw3,s1,t2):1 SOS1_gprodDn_max(gw3,s1,t2):2
 s44:  S1 :: mu_gprodUp_max(gw3,s1,t3):1 SOS1_gprodUp_max(gw3,s1,t3):2
 s45:  S1 :: mu_gprodDn_max(gw3,s1,t3):1 SOS1_gprodDn_max(gw3,s1,t3):2
 s46:  S1 :: mu_gprodUp_max(gw3,s1,t4):1 SOS1_gprodUp_max(gw3,s1,t4):2
 s47:  S1 :: mu_gprodDn_max(gw3,s1,t4):1 SOS1_gprodDn_max(gw3,s1,t4):2
 s48:  S1 :: mu_gprodUp_max(gw3,s2,t1):1 SOS1_gprodUp_max(gw3,s2,t1):2
 s49:  S1 :: mu_gprodDn_max(gw3,s2,t1):1 SOS1_gprodDn_max(gw3,s2,t1):2
 s50:  S1 :: mu_gprodUp_max(gw3,s2,t2):1 SOS1_gprodUp_max(gw3,s2,t2):2
 s51:  S1 :: mu_gprodDn_max(gw3,s2,t2):1 SOS1_gprodDn_max(gw3,s2,t2):2
 s52:  S1 :: mu_gprodUp_max(gw3,s2,t3):1 SOS1_gprodUp_max(gw3,s2,t3):2
 s53:  S1 :: mu_gprodDn_max(gw3,s2,t3):1 SOS1_gprodDn_max(gw3,s2,t3):2
 s54:  S1 :: mu_gprodUp_max(gw3,s2,t4):1 SOS1_gprodUp_max(gw3,s2,t4):2
 s55:  S1 :: mu_gprodDn_max(gw3,s2,t4):1 SOS1_gprodDn_max(gw3,s2,t4):2
 s56:  S1 :: mu_gsinMax_rt(gs1,t1,s1):1 SOS1_gsinMax_rt(gs1,t1,s1):2
 s57:  S1 :: mu_gsoutMax_rt(gs1,t1,s1):1 SOS1_gsoutMax_rt(gs1,t1,s1):2
 s58:  S1 :: mu_gstore_max_rt(gs1,t1,s1):1 SOS1_gstore_max_rt(gs1,t1,s1):2
 s59:  S1 :: mu_gstore_min_rt(gs1,t1,s1):1 SOS1_gstore_min_rt(gs1,t1,s1):2
 s60:  S1 :: mu_gsinMax_rt(gs1,t1,s2):1 SOS1_gsinMax_rt(gs1,t1,s2):2
 s61:  S1 :: mu_gsoutMax_rt(gs1,t1,s2):1 SOS1_gsoutMax_rt(gs1,t1,s2):2
 s62:  S1 :: mu_gstore_max_rt(gs1,t1,s2):1 SOS1_gstore_max_rt(gs1,t1,s2):2
 s63:  S1 :: mu_gstore_min_rt(gs1,t1,s2):1 SOS1_gstore_min_rt(gs1,t1,s2):2
 s64:  S1 :: mu_gsinMax_rt(gs1,t2,s1):1 SOS1_gsinMax_rt(gs1,t2,s1):2
 s65:  S1 :: mu_gsoutMax_rt(gs1,t2,s1):1 SOS1_gsoutMax_rt(gs1,t2,s1):2
 s66:  S1 :: mu_gstore_max_rt(gs1,t2,s1):1 SOS1_gstore_max_rt(gs1,t2,s1):2
 s67:  S1 :: mu_gstore_min_rt(gs1,t2,s1):1 SOS1_gstore_min_rt(gs1,t2,s1):2
 s68:  S1 :: mu_gsinMax_rt(gs1,t2,s2):1 SOS1_gsinMax_rt(gs1,t2,s2):2
 s69:  S1 :: mu_gsoutMax_rt(gs1,t2,s2):1 SOS1_gsoutMax_rt(gs1,t2,s2):2
 s70:  S1 :: mu_gstore_max_rt(gs1,t2,s2):1 SOS1_gstore_max_rt(gs1,t2,s2):2
 s71:  S1 :: mu_gstore_min_rt(gs1,t2,s2):1 SOS1_gstore_min_rt(gs1,t2,s2):2
 s72:  S1 :: mu_gsinMax_rt(gs1,t3,s1):1 SOS1_gsinMax_rt(gs1,t3,s1):2
 s73:  S1 :: mu_gsoutMax_rt(gs1,t3,s1):1 SOS1_gsoutMax_rt(gs1,t3,s1):2
 s74:  S1 :: mu_gstore_max_rt(gs1,t3,s1):1 SOS1_gstore_max_rt(gs1,t3,s1):2
 s75:  S1 :: mu_gstore_min_rt(gs1,t3,s1):1 SOS1_gstore_min_rt(gs1,t3,s1):2
 s76:  S1 :: mu_gsinMax_rt(gs1,t3,s2):1 SOS1_gsinMax_rt(gs1,t3,s2):2
 s77:  S1 :: mu_gsoutMax_rt(gs1,t3,s2):1 SOS1_gsoutMax_rt(gs1,t3,s2):2
 s78:  S1 :: mu_gstore_max_rt(gs1,t3,s2):1 SOS1_gstore_max_rt(gs1,t3,s2):2
 s79:  S1 :: mu_gstore_min_rt(gs1,t3,s2):1 SOS1_gstore_min_rt(gs1,t3,s2):2
 s80:  S1 :: mu_gsinMax_rt(gs1,t4,s1):1 SOS1_gsinMax_rt(gs1,t4,s1):2
 s81:  S1 :: mu_gsoutMax_rt(gs1,t4,s1):1 SOS1_gsoutMax_rt(gs1,t4,s1):2
 s82:  S1 :: mu_gstore_max_rt(gs1,t4,s1):1 SOS1_gstore_max_rt(gs1,t4,s1):2
 s83:  S1 :: mu_gstore_min_rt(gs1,t4,s1):1 SOS1_gstore_min_rt(gs1,t4,s1):2
 s84:  S1 :: mu_gsinMax_rt(gs1,t4,s2):1 SOS1_gsinMax_rt(gs1,t4,s2):2
 s85:  S1 :: mu_gsoutMax_rt(gs1,t4,s2):1 SOS1_gsoutMax_rt(gs1,t4,s2):2
 s86:  S1 :: mu_gstore_max_rt(gs1,t4,s2):1 SOS1_gstore_max_rt(gs1,t4,s2):2
 s87:  S1 :: mu_gstore_min_rt(gs1,t4,s2):1 SOS1_gstore_min_rt(gs1,t4,s2):2
 s88:  S1 :: mu_gstor_end(gs1,s1):1 SOS1_gstor_end(gs1,s1):2
 s89:  S1 :: mu_gstor_end(gs1,s2):1 SOS1_gstor_end(gs1,s2):2
 s90:  S1 :: mu_gas_shed_rt(ng101,s1,t1):1 SOS1_gas_shed_rt(ng101,s1,t1):2
 s91:  S1 :: mu_gas_shed_rt(ng101,s1,t2):1 SOS1_gas_shed_rt(ng101,s1,t2):2
 s92:  S1 :: mu_gas_shed_rt(ng101,s1,t3):1 SOS1_gas_shed_rt(ng101,s1,t3):2
 s93:  S1 :: mu_gas_shed_rt(ng101,s1,t4):1 SOS1_gas_shed_rt(ng101,s1,t4):2
 s94:  S1 :: mu_gas_shed_rt(ng102,s1,t1):1 SOS1_gas_shed_rt(ng102,s1,t1):2
 s95:  S1 :: mu_gas_shed_rt(ng102,s1,t2):1 SOS1_gas_shed_rt(ng102,s1,t2):2
 s96:  S1 :: mu_gas_shed_rt(ng102,s1,t3):1 SOS1_gas_shed_rt(ng102,s1,t3):2
 s97:  S1 :: mu_gas_shed_rt(ng102,s1,t4):1 SOS1_gas_shed_rt(ng102,s1,t4):2
 s98:  S1 :: mu_gas_shed_rt(ng101,s2,t1):1 SOS1_gas_shed_rt(ng101,s2,t1):2
 s99:  S1 :: mu_gas_shed_rt(ng101,s2,t2):1 SOS1_gas_shed_rt(ng101,s2,t2):2
 s100:  S1 :: mu_gas_shed_rt(ng101,s2,t3):1 SOS1_gas_shed_rt(ng101,s2,t3):2
 s101:  S1 :: mu_gas_shed_rt(ng101,s2,t4):1 SOS1_gas_shed_rt(ng101,s2,t4):2
 s102:  S1 :: mu_gas_shed_rt(ng102,s2,t1):1 SOS1_gas_shed_rt(ng102,s2,t1):2
 s103:  S1 :: mu_gas_shed_rt(ng102,s2,t2):1 SOS1_gas_shed_rt(ng102,s2,t2):2
 s104:  S1 :: mu_gas_shed_rt(ng102,s2,t3):1 SOS1_gas_shed_rt(ng102,s2,t3):2
 s105:  S1 :: mu_gas_shed_rt(ng102,s2,t4):1 SOS1_gas_shed_rt(ng102,s2,t4):2
 s106:  S1 :: muLB_gshed(ng101,s1,t1):1 SOS1_LB_gshed(ng101,s1,t1):2
 s107:  S1 :: muLB_gshed(ng102,s1,t1):1 SOS1_LB_gshed(ng102,s1,t1):2
 s108:  S1 :: muLB_gflow_sr_rt(('ng101','ng102'),s1,t1):1
     SOS1_LB_gflow_sr_rt(('ng101','ng102'),s1,t1):2
 s109:  S1 :: muLB_qin_sr_rt(('ng101','ng102'),s1,t1):1
     SOS1_LB_qin_sr_rt(('ng101','ng102'),s1,t1):2
 s110:  S1 :: muLB_qout_sr_rt(('ng101','ng102'),s1,t1):1
     SOS1_LB_qout_sr_rt(('ng101','ng102'),s1,t1):2
 s111:  S1 :: muLB_gprodUp(gw1,s1,t1):1 SOS1_LB_gprodUp(gw1,s1,t1):2
 s112:  S1 :: muLB_gprodDn(gw1,s1,t1):1 SOS1_LB_gprodDn(gw1,s1,t1):2
 s113:  S1 :: muLB_gprodUp(gw2,s1,t1):1 SOS1_LB_gprodUp(gw2,s1,t1):2
 s114:  S1 :: muLB_gprodDn(gw2,s1,t1):1 SOS1_LB_gprodDn(gw2,s1,t1):2
 s115:  S1 :: muLB_gprodUp(gw3,s1,t1):1 SOS1_LB_gprodUp(gw3,s1,t1):2
 s116:  S1 :: muLB_gprodDn(gw3,s1,t1):1 SOS1_LB_gprodDn(gw3,s1,t1):2
 s117:  S1 :: muLB_gsin_rt(gs1,s1,t1):1 SOS1_LB_gsin_rt(gs1,s1,t1):2
 s118:  S1 :: muLB_gsout_rt(gs1,s1,t1):1 SOS1_LB_gsout_rt(gs1,s1,t1):2
 s119:  S1 :: muLB_gstore_rt(gs1,s1,t1):1 SOS1_LB_gstore_rt(gs1,s1,t1):2
 s120:  S1 :: muLB_gshed(ng101,s1,t2):1 SOS1_LB_gshed(ng101,s1,t2):2
 s121:  S1 :: muLB_gshed(ng102,s1,t2):1 SOS1_LB_gshed(ng102,s1,t2):2
 s122:  S1 :: muLB_gflow_sr_rt(('ng101','ng102'),s1,t2):1
     SOS1_LB_gflow_sr_rt(('ng101','ng102'),s1,t2):2
 s123:  S1 :: muLB_qin_sr_rt(('ng101','ng102'),s1,t2):1
     SOS1_LB_qin_sr_rt(('ng101','ng102'),s1,t2):2
 s124:  S1 :: muLB_qout_sr_rt(('ng101','ng102'),s1,t2):1
     SOS1_LB_qout_sr_rt(('ng101','ng102'),s1,t2):2
 s125:  S1 :: muLB_gprodUp(gw1,s1,t2):1 SOS1_LB_gprodUp(gw1,s1,t2):2
 s126:  S1 :: muLB_gprodDn(gw1,s1,t2):1 SOS1_LB_gprodDn(gw1,s1,t2):2
 s127:  S1 :: muLB_gprodUp(gw2,s1,t2):1 SOS1_LB_gprodUp(gw2,s1,t2):2
 s128:  S1 :: muLB_gprodDn(gw2,s1,t2):1 SOS1_LB_gprodDn(gw2,s1,t2):2
 s129:  S1 :: muLB_gprodUp(gw3,s1,t2):1 SOS1_LB_gprodUp(gw3,s1,t2):2
 s130:  S1 :: muLB_gprodDn(gw3,s1,t2):1 SOS1_LB_gprodDn(gw3,s1,t2):2
 s131:  S1 :: muLB_gsin_rt(gs1,s1,t2):1 SOS1_LB_gsin_rt(gs1,s1,t2):2
 s132:  S1 :: muLB_gsout_rt(gs1,s1,t2):1 SOS1_LB_gsout_rt(gs1,s1,t2):2
 s133:  S1 :: muLB_gstore_rt(gs1,s1,t2):1 SOS1_LB_gstore_rt(gs1,s1,t2):2
 s134:  S1 :: muLB_gshed(ng101,s1,t3):1 SOS1_LB_gshed(ng101,s1,t3):2
 s135:  S1 :: muLB_gshed(ng102,s1,t3):1 SOS1_LB_gshed(ng102,s1,t3):2
 s136:  S1 :: muLB_gflow_sr_rt(('ng101','ng102'),s1,t3):1
     SOS1_LB_gflow_sr_rt(('ng101','ng102'),s1,t3):2
 s137:  S1 :: muLB_qin_sr_rt(('ng101','ng102'),s1,t3):1
     SOS1_LB_qin_sr_rt(('ng101','ng102'),s1,t3):2
 s138:  S1 :: muLB_qout_sr_rt(('ng101','ng102'),s1,t3):1
     SOS1_LB_qout_sr_rt(('ng101','ng102'),s1,t3):2
 s139:  S1 :: muLB_gprodUp(gw1,s1,t3):1 SOS1_LB_gprodUp(gw1,s1,t3):2
 s140:  S1 :: muLB_gprodDn(gw1,s1,t3):1 SOS1_LB_gprodDn(gw1,s1,t3):2
 s141:  S1 :: muLB_gprodUp(gw2,s1,t3):1 SOS1_LB_gprodUp(gw2,s1,t3):2
 s142:  S1 :: muLB_gprodDn(gw2,s1,t3):1 SOS1_LB_gprodDn(gw2,s1,t3):2
 s143:  S1 :: muLB_gprodUp(gw3,s1,t3):1 SOS1_LB_gprodUp(gw3,s1,t3):2
 s144:  S1 :: muLB_gprodDn(gw3,s1,t3):1 SOS1_LB_gprodDn(gw3,s1,t3):2
 s145:  S1 :: muLB_gsin_rt(gs1,s1,t3):1 SOS1_LB_gsin_rt(gs1,s1,t3):2
 s146:  S1 :: muLB_gsout_rt(gs1,s1,t3):1 SOS1_LB_gsout_rt(gs1,s1,t3):2
 s147:  S1 :: muLB_gstore_rt(gs1,s1,t3):1 SOS1_LB_gstore_rt(gs1,s1,t3):2
 s148:  S1 :: muLB_gshed(ng101,s1,t4):1 SOS1_LB_gshed(ng101,s1,t4):2
 s149:  S1 :: muLB_gshed(ng102,s1,t4):1 SOS1_LB_gshed(ng102,s1,t4):2
 s150:  S1 :: muLB_gflow_sr_rt(('ng101','ng102'),s1,t4):1
     SOS1_LB_gflow_sr_rt(('ng101','ng102'),s1,t4):2
 s151:  S1 :: muLB_qin_sr_rt(('ng101','ng102'),s1,t4):1
     SOS1_LB_qin_sr_rt(('ng101','ng102'),s1,t4):2
 s152:  S1 :: muLB_qout_sr_rt(('ng101','ng102'),s1,t4):1
     SOS1_LB_qout_sr_rt(('ng101','ng102'),s1,t4):2
 s153:  S1 :: muLB_gprodUp(gw1,s1,t4):1 SOS1_LB_gprodUp(gw1,s1,t4):2
 s154:  S1 :: muLB_gprodDn(gw1,s1,t4):1 SOS1_LB_gprodDn(gw1,s1,t4):2
 s155:  S1 :: muLB_gprodUp(gw2,s1,t4):1 SOS1_LB_gprodUp(gw2,s1,t4):2
 s156:  S1 :: muLB_gprodDn(gw2,s1,t4):1 SOS1_LB_gprodDn(gw2,s1,t4):2
 s157:  S1 :: muLB_gprodUp(gw3,s1,t4):1 SOS1_LB_gprodUp(gw3,s1,t4):2
 s158:  S1 :: muLB_gprodDn(gw3,s1,t4):1 SOS1_LB_gprodDn(gw3,s1,t4):2
 s159:  S1 :: muLB_gsin_rt(gs1,s1,t4):1 SOS1_LB_gsin_rt(gs1,s1,t4):2
 s160:  S1 :: muLB_gsout_rt(gs1,s1,t4):1 SOS1_LB_gsout_rt(gs1,s1,t4):2
 s161:  S1 :: muLB_gstore_rt(gs1,s1,t4):1 SOS1_LB_gstore_rt(gs1,s1,t4):2
 s162:  S1 :: muLB_gshed(ng101,s2,t1):1 SOS1_LB_gshed(ng101,s2,t1):2
 s163:  S1 :: muLB_gshed(ng102,s2,t1):1 SOS1_LB_gshed(ng102,s2,t1):2
 s164:  S1 :: muLB_gflow_sr_rt(('ng101','ng102'),s2,t1):1
     SOS1_LB_gflow_sr_rt(('ng101','ng102'),s2,t1):2
 s165:  S1 :: muLB_qin_sr_rt(('ng101','ng102'),s2,t1):1
     SOS1_LB_qin_sr_rt(('ng101','ng102'),s2,t1):2
 s166:  S1 :: muLB_qout_sr_rt(('ng101','ng102'),s2,t1):1
     SOS1_LB_qout_sr_rt(('ng101','ng102'),s2,t1):2
 s167:  S1 :: muLB_gprodUp(gw1,s2,t1):1 SOS1_LB_gprodUp(gw1,s2,t1):2
 s168:  S1 :: muLB_gprodDn(gw1,s2,t1):1 SOS1_LB_gprodDn(gw1,s2,t1):2
 s169:  S1 :: muLB_gprodUp(gw2,s2,t1):1 SOS1_LB_gprodUp(gw2,s2,t1):2
 s170:  S1 :: muLB_gprodDn(gw2,s2,t1):1 SOS1_LB_gprodDn(gw2,s2,t1):2
 s171:  S1 :: muLB_gprodUp(gw3,s2,t1):1 SOS1_LB_gprodUp(gw3,s2,t1):2
 s172:  S1 :: muLB_gprodDn(gw3,s2,t1):1 SOS1_LB_gprodDn(gw3,s2,t1):2
 s173:  S1 :: muLB_gsin_rt(gs1,s2,t1):1 SOS1_LB_gsin_rt(gs1,s2,t1):2
 s174:  S1 :: muLB_gsout_rt(gs1,s2,t1):1 SOS1_LB_gsout_rt(gs1,s2,t1):2
 s175:  S1 :: muLB_gstore_rt(gs1,s2,t1):1 SOS1_LB_gstore_rt(gs1,s2,t1):2
 s176:  S1 :: muLB_gshed(ng101,s2,t2):1 SOS1_LB_gshed(ng101,s2,t2):2
 s177:  S1 :: muLB_gshed(ng102,s2,t2):1 SOS1_LB_gshed(ng102,s2,t2):2
 s178:  S1 :: muLB_gflow_sr_rt(('ng101','ng102'),s2,t2):1
     SOS1_LB_gflow_sr_rt(('ng101','ng102'),s2,t2):2
 s179:  S1 :: muLB_qin_sr_rt(('ng101','ng102'),s2,t2):1
     SOS1_LB_qin_sr_rt(('ng101','ng102'),s2,t2):2
 s180:  S1 :: muLB_qout_sr_rt(('ng101','ng102'),s2,t2):1
     SOS1_LB_qout_sr_rt(('ng101','ng102'),s2,t2):2
 s181:  S1 :: muLB_gprodUp(gw1,s2,t2):1 SOS1_LB_gprodUp(gw1,s2,t2):2
 s182:  S1 :: muLB_gprodDn(gw1,s2,t2):1 SOS1_LB_gprodDn(gw1,s2,t2):2
 s183:  S1 :: muLB_gprodUp(gw2,s2,t2):1 SOS1_LB_gprodUp(gw2,s2,t2):2
 s184:  S1 :: muLB_gprodDn(gw2,s2,t2):1 SOS1_LB_gprodDn(gw2,s2,t2):2
 s185:  S1 :: muLB_gprodUp(gw3,s2,t2):1 SOS1_LB_gprodUp(gw3,s2,t2):2
 s186:  S1 :: muLB_gprodDn(gw3,s2,t2):1 SOS1_LB_gprodDn(gw3,s2,t2):2
 s187:  S1 :: muLB_gsin_rt(gs1,s2,t2):1 SOS1_LB_gsin_rt(gs1,s2,t2):2
 s188:  S1 :: muLB_gsout_rt(gs1,s2,t2):1 SOS1_LB_gsout_rt(gs1,s2,t2):2
 s189:  S1 :: muLB_gstore_rt(gs1,s2,t2):1 SOS1_LB_gstore_rt(gs1,s2,t2):2
 s190:  S1 :: muLB_gshed(ng101,s2,t3):1 SOS1_LB_gshed(ng101,s2,t3):2
 s191:  S1 :: muLB_gshed(ng102,s2,t3):1 SOS1_LB_gshed(ng102,s2,t3):2
 s192:  S1 :: muLB_gflow_sr_rt(('ng101','ng102'),s2,t3):1
     SOS1_LB_gflow_sr_rt(('ng101','ng102'),s2,t3):2
 s193:  S1 :: muLB_qin_sr_rt(('ng101','ng102'),s2,t3):1
     SOS1_LB_qin_sr_rt(('ng101','ng102'),s2,t3):2
 s194:  S1 :: muLB_qout_sr_rt(('ng101','ng102'),s2,t3):1
     SOS1_LB_qout_sr_rt(('ng101','ng102'),s2,t3):2
 s195:  S1 :: muLB_gprodUp(gw1,s2,t3):1 SOS1_LB_gprodUp(gw1,s2,t3):2
 s196:  S1 :: muLB_gprodDn(gw1,s2,t3):1 SOS1_LB_gprodDn(gw1,s2,t3):2
 s197:  S1 :: muLB_gprodUp(gw2,s2,t3):1 SOS1_LB_gprodUp(gw2,s2,t3):2
 s198:  S1 :: muLB_gprodDn(gw2,s2,t3):1 SOS1_LB_gprodDn(gw2,s2,t3):2
 s199:  S1 :: muLB_gprodUp(gw3,s2,t3):1 SOS1_LB_gprodUp(gw3,s2,t3):2
 s200:  S1 :: muLB_gprodDn(gw3,s2,t3):1 SOS1_LB_gprodDn(gw3,s2,t3):2
 s201:  S1 :: muLB_gsin_rt(gs1,s2,t3):1 SOS1_LB_gsin_rt(gs1,s2,t3):2
 s202:  S1 :: muLB_gsout_rt(gs1,s2,t3):1 SOS1_LB_gsout_rt(gs1,s2,t3):2
 s203:  S1 :: muLB_gstore_rt(gs1,s2,t3):1 SOS1_LB_gstore_rt(gs1,s2,t3):2
 s204:  S1 :: muLB_gshed(ng101,s2,t4):1 SOS1_LB_gshed(ng101,s2,t4):2
 s205:  S1 :: muLB_gshed(ng102,s2,t4):1 SOS1_LB_gshed(ng102,s2,t4):2
 s206:  S1 :: muLB_gflow_sr_rt(('ng101','ng102'),s2,t4):1
     SOS1_LB_gflow_sr_rt(('ng101','ng102'),s2,t4):2
 s207:  S1 :: muLB_qin_sr_rt(('ng101','ng102'),s2,t4):1
     SOS1_LB_qin_sr_rt(('ng101','ng102'),s2,t4):2
 s208:  S1 :: muLB_qout_sr_rt(('ng101','ng102'),s2,t4):1
     SOS1_LB_qout_sr_rt(('ng101','ng102'),s2,t4):2
 s209:  S1 :: muLB_gprodUp(gw1,s2,t4):1 SOS1_LB_gprodUp(gw1,s2,t4):2
 s210:  S1 :: muLB_gprodDn(gw1,s2,t4):1 SOS1_LB_gprodDn(gw1,s2,t4):2
 s211:  S1 :: muLB_gprodUp(gw2,s2,t4):1 SOS1_LB_gprodUp(gw2,s2,t4):2
 s212:  S1 :: muLB_gprodDn(gw2,s2,t4):1 SOS1_LB_gprodDn(gw2,s2,t4):2
 s213:  S1 :: muLB_gprodUp(gw3,s2,t4):1 SOS1_LB_gprodUp(gw3,s2,t4):2
 s214:  S1 :: muLB_gprodDn(gw3,s2,t4):1 SOS1_LB_gprodDn(gw3,s2,t4):2
 s215:  S1 :: muLB_gsin_rt(gs1,s2,t4):1 SOS1_LB_gsin_rt(gs1,s2,t4):2
 s216:  S1 :: muLB_gsout_rt(gs1,s2,t4):1 SOS1_LB_gsout_rt(gs1,s2,t4):2
 s217:  S1 :: muLB_gstore_rt(gs1,s2,t4):1 SOS1_LB_gstore_rt(gs1,s2,t4):2
End
