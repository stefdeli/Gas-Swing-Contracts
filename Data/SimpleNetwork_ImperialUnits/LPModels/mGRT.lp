\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  500 gshed(ng101,s1,t1) + 500 gshed(ng102,s1,t1) + gprodUp(gw1,s1,t1)
   - gprodDn(gw1,s1,t1) + 1.5 gprodUp(gw2,s1,t1) - 1.5 gprodDn(gw2,s1,t1)
   + 2 gprodUp(gw3,s1,t1) - 2 gprodDn(gw3,s1,t1) + 500 gshed(ng101,s1,t2)
   + 500 gshed(ng102,s1,t2) + gprodUp(gw1,s1,t2) - gprodDn(gw1,s1,t2)
   + 1.5 gprodUp(gw2,s1,t2) - 1.5 gprodDn(gw2,s1,t2) + 2 gprodUp(gw3,s1,t2)
   - 2 gprodDn(gw3,s1,t2) + 500 gshed(ng101,s1,t3) + 500 gshed(ng102,s1,t3)
   + gprodUp(gw1,s1,t3) - gprodDn(gw1,s1,t3) + 1.5 gprodUp(gw2,s1,t3)
   - 1.5 gprodDn(gw2,s1,t3) + 2 gprodUp(gw3,s1,t3) - 2 gprodDn(gw3,s1,t3)
   + 500 gshed(ng101,s1,t4) + 500 gshed(ng102,s1,t4) + gprodUp(gw1,s1,t4)
   - gprodDn(gw1,s1,t4) + 1.5 gprodUp(gw2,s1,t4) - 1.5 gprodDn(gw2,s1,t4)
   + 2 gprodUp(gw3,s1,t4) - 2 gprodDn(gw3,s1,t4) + 500 gshed(ng101,s2,t1)
   + 500 gshed(ng102,s2,t1) + gprodUp(gw1,s2,t1) - gprodDn(gw1,s2,t1)
   + 1.5 gprodUp(gw2,s2,t1) - 1.5 gprodDn(gw2,s2,t1) + 2 gprodUp(gw3,s2,t1)
   - 2 gprodDn(gw3,s2,t1) + 500 gshed(ng101,s2,t2) + 500 gshed(ng102,s2,t2)
   + gprodUp(gw1,s2,t2) - gprodDn(gw1,s2,t2) + 1.5 gprodUp(gw2,s2,t2)
   - 1.5 gprodDn(gw2,s2,t2) + 2 gprodUp(gw3,s2,t2) - 2 gprodDn(gw3,s2,t2)
   + 500 gshed(ng101,s2,t3) + 500 gshed(ng102,s2,t3) + gprodUp(gw1,s2,t3)
   - gprodDn(gw1,s2,t3) + 1.5 gprodUp(gw2,s2,t3) - 1.5 gprodDn(gw2,s2,t3)
   + 2 gprodUp(gw3,s2,t3) - 2 gprodDn(gw3,s2,t3) + 500 gshed(ng101,s2,t4)
   + 500 gshed(ng102,s2,t4) + gprodUp(gw1,s2,t4) - gprodDn(gw1,s2,t4)
   + 1.5 gprodUp(gw2,s2,t4) - 1.5 gprodDn(gw2,s2,t4) + 2 gprodUp(gw3,s2,t4)
   - 2 gprodDn(gw3,s2,t4)
Subject To
 gas_balance_rt(ng101,s1,t1): gshed(ng101,s1,t1)
   - qin_sr_rt(('ng101','ng102'),s1,t1) + gprodUp(gw1,s1,t1)
   - gprodDn(gw1,s1,t1) + gprodUp(gw2,s1,t1) - gprodDn(gw2,s1,t1)
   + gprodUp(gw3,s1,t1) - gprodDn(gw3,s1,t1) = -364
 gas_balance_rt(ng101,s1,t2): gshed(ng101,s1,t2)
   - qin_sr_rt(('ng101','ng102'),s1,t2) + gprodUp(gw1,s1,t2)
   - gprodDn(gw1,s1,t2) + gprodUp(gw2,s1,t2) - gprodDn(gw2,s1,t2)
   + gprodUp(gw3,s1,t2) - gprodDn(gw3,s1,t2) = -374.35276184
 gas_balance_rt(ng101,s1,t3): gshed(ng101,s1,t3)
   - qin_sr_rt(('ng101','ng102'),s1,t3) + gprodUp(gw1,s1,t3)
   - gprodDn(gw1,s1,t3) + gprodUp(gw2,s1,t3) - gprodDn(gw2,s1,t3)
   + gprodUp(gw3,s1,t3) - gprodDn(gw3,s1,t3) = -108
 gas_balance_rt(ng101,s1,t4): gshed(ng101,s1,t4)
   - qin_sr_rt(('ng101','ng102'),s1,t4) + gprodUp(gw1,s1,t4)
   - gprodDn(gw1,s1,t4) + gprodUp(gw2,s1,t4) - gprodDn(gw2,s1,t4)
   + gprodUp(gw3,s1,t4) - gprodDn(gw3,s1,t4) = -116.28427128
 gas_balance_rt(ng102,s1,t1): gshed(ng102,s1,t1)
   + qout_sr_rt(('ng101','ng102'),s1,t1) = 315.051604
 gas_balance_rt(ng102,s1,t2): gshed(ng102,s1,t2)
   + qout_sr_rt(('ng101','ng102'),s1,t2) = 325.8575628800001
 gas_balance_rt(ng102,s1,t3): gshed(ng102,s1,t3)
   + qout_sr_rt(('ng101','ng102'),s1,t3) = 335.51200392
 gas_balance_rt(ng102,s1,t4): gshed(ng102,s1,t4)
   + qout_sr_rt(('ng101','ng102'),s1,t4) = 346.38353568
 gas_balance_rt(ng101,s2,t1): gshed(ng101,s2,t1)
   - qin_sr_rt(('ng101','ng102'),s2,t1) + gprodUp(gw1,s2,t1)
   - gprodDn(gw1,s2,t1) + gprodUp(gw2,s2,t1) - gprodDn(gw2,s2,t1)
   + gprodUp(gw3,s2,t1) - gprodDn(gw3,s2,t1) = -364
 gas_balance_rt(ng101,s2,t2): gshed(ng101,s2,t2)
   - qin_sr_rt(('ng101','ng102'),s2,t2) + gprodUp(gw1,s2,t2)
   - gprodDn(gw1,s2,t2) + gprodUp(gw2,s2,t2) - gprodDn(gw2,s2,t2)
   + gprodUp(gw3,s2,t2) - gprodDn(gw3,s2,t2) = -374.35276184
 gas_balance_rt(ng101,s2,t3): gshed(ng101,s2,t3)
   - qin_sr_rt(('ng101','ng102'),s2,t3) + gprodUp(gw1,s2,t3)
   - gprodDn(gw1,s2,t3) + gprodUp(gw2,s2,t3) - gprodDn(gw2,s2,t3)
   + gprodUp(gw3,s2,t3) - gprodDn(gw3,s2,t3) = -108
 gas_balance_rt(ng101,s2,t4): gshed(ng101,s2,t4)
   - qin_sr_rt(('ng101','ng102'),s2,t4) + gprodUp(gw1,s2,t4)
   - gprodDn(gw1,s2,t4) + gprodUp(gw2,s2,t4) - gprodDn(gw2,s2,t4)
   + gprodUp(gw3,s2,t4) - gprodDn(gw3,s2,t4) = -116.28427128
 gas_balance_rt(ng102,s2,t1): gshed(ng102,s2,t1)
   + qout_sr_rt(('ng101','ng102'),s2,t1) = 218.83809376
 gas_balance_rt(ng102,s2,t2): gshed(ng102,s2,t2)
   + qout_sr_rt(('ng101','ng102'),s2,t2) = 225.2959616
 gas_balance_rt(ng102,s2,t3): gshed(ng102,s2,t3)
   + qout_sr_rt(('ng101','ng102'),s2,t3) = 271.42980624
 gas_balance_rt(ng102,s2,t4): gshed(ng102,s2,t4)
   + qout_sr_rt(('ng101','ng102'),s2,t4) = 274.32465792
 gflow_sr_io_rt(('ng101','ng102'),s1,t1):
   - gflow_sr_rt(('ng101','ng102'),s1,t1)
   + 0.5 qin_sr_rt(('ng101','ng102'),s1,t1)
   + 0.5 qout_sr_rt(('ng101','ng102'),s1,t1) = 0
 gflow_sr_limit_rt(('ng101','ng102'),s1,t1):
   gflow_sr_rt(('ng101','ng102'),s1,t1) <= 10000
 gflow_sr_io_rt(('ng101','ng102'),s2,t1):
   - gflow_sr_rt(('ng101','ng102'),s2,t1)
   + 0.5 qin_sr_rt(('ng101','ng102'),s2,t1)
   + 0.5 qout_sr_rt(('ng101','ng102'),s2,t1) = 0
 gflow_sr_limit_rt(('ng101','ng102'),s2,t1):
   gflow_sr_rt(('ng101','ng102'),s2,t1) <= 10000
 gflow_sr_io_rt(('ng101','ng102'),s1,t2):
   - gflow_sr_rt(('ng101','ng102'),s1,t2)
   + 0.5 qin_sr_rt(('ng101','ng102'),s1,t2)
   + 0.5 qout_sr_rt(('ng101','ng102'),s1,t2) = 0
 gflow_sr_limit_rt(('ng101','ng102'),s1,t2):
   gflow_sr_rt(('ng101','ng102'),s1,t2) <= 10000
 gflow_sr_io_rt(('ng101','ng102'),s2,t2):
   - gflow_sr_rt(('ng101','ng102'),s2,t2)
   + 0.5 qin_sr_rt(('ng101','ng102'),s2,t2)
   + 0.5 qout_sr_rt(('ng101','ng102'),s2,t2) = 0
 gflow_sr_limit_rt(('ng101','ng102'),s2,t2):
   gflow_sr_rt(('ng101','ng102'),s2,t2) <= 10000
 gflow_sr_io_rt(('ng101','ng102'),s1,t3):
   - gflow_sr_rt(('ng101','ng102'),s1,t3)
   + 0.5 qin_sr_rt(('ng101','ng102'),s1,t3)
   + 0.5 qout_sr_rt(('ng101','ng102'),s1,t3) = 0
 gflow_sr_limit_rt(('ng101','ng102'),s1,t3):
   gflow_sr_rt(('ng101','ng102'),s1,t3) <= 10000
 gflow_sr_io_rt(('ng101','ng102'),s2,t3):
   - gflow_sr_rt(('ng101','ng102'),s2,t3)
   + 0.5 qin_sr_rt(('ng101','ng102'),s2,t3)
   + 0.5 qout_sr_rt(('ng101','ng102'),s2,t3) = 0
 gflow_sr_limit_rt(('ng101','ng102'),s2,t3):
   gflow_sr_rt(('ng101','ng102'),s2,t3) <= 10000
 gflow_sr_io_rt(('ng101','ng102'),s1,t4):
   - gflow_sr_rt(('ng101','ng102'),s1,t4)
   + 0.5 qin_sr_rt(('ng101','ng102'),s1,t4)
   + 0.5 qout_sr_rt(('ng101','ng102'),s1,t4) = 0
 gflow_sr_limit_rt(('ng101','ng102'),s1,t4):
   gflow_sr_rt(('ng101','ng102'),s1,t4) <= 10000
 gflow_sr_io_rt(('ng101','ng102'),s2,t4):
   - gflow_sr_rt(('ng101','ng102'),s2,t4)
   + 0.5 qin_sr_rt(('ng101','ng102'),s2,t4)
   + 0.5 qout_sr_rt(('ng101','ng102'),s2,t4) = 0
 gflow_sr_limit_rt(('ng101','ng102'),s2,t4):
   gflow_sr_rt(('ng101','ng102'),s2,t4) <= 10000
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
 gprodDn_max(gw2,s1,t1): gprodDn(gw2,s1,t1) <= 200
 gprodUp_max(gw2,s1,t2): gprodUp(gw2,s1,t2) <= 0
 gprodDn_max(gw2,s1,t2): gprodDn(gw2,s1,t2) <= 200
 gprodUp_max(gw2,s1,t3): gprodUp(gw2,s1,t3) <= 192
 gprodDn_max(gw2,s1,t3): gprodDn(gw2,s1,t3) <= 8
 gprodUp_max(gw2,s1,t4): gprodUp(gw2,s1,t4) <= 183.71572872
 gprodDn_max(gw2,s1,t4): gprodDn(gw2,s1,t4) <= 16.28427127999998
 gprodUp_max(gw2,s2,t1): gprodUp(gw2,s2,t1) <= 0
 gprodDn_max(gw2,s2,t1): gprodDn(gw2,s2,t1) <= 200
 gprodUp_max(gw2,s2,t2): gprodUp(gw2,s2,t2) <= 0
 gprodDn_max(gw2,s2,t2): gprodDn(gw2,s2,t2) <= 200
 gprodUp_max(gw2,s2,t3): gprodUp(gw2,s2,t3) <= 192
 gprodDn_max(gw2,s2,t3): gprodDn(gw2,s2,t3) <= 8
 gprodUp_max(gw2,s2,t4): gprodUp(gw2,s2,t4) <= 183.71572872
 gprodDn_max(gw2,s2,t4): gprodDn(gw2,s2,t4) <= 16.28427127999998
 gprodUp_max(gw3,s1,t1): gprodUp(gw3,s1,t1) <= 2936
 gprodDn_max(gw3,s1,t1): gprodDn(gw3,s1,t1) <= 64
 gprodUp_max(gw3,s1,t2): gprodUp(gw3,s1,t2) <= 2925.64723816
 gprodDn_max(gw3,s1,t2): gprodDn(gw3,s1,t2) <= 74.35276184000003
 gprodUp_max(gw3,s1,t3): gprodUp(gw3,s1,t3) <= 3000
 gprodDn_max(gw3,s1,t3): gprodDn(gw3,s1,t3) <= 0
 gprodUp_max(gw3,s1,t4): gprodUp(gw3,s1,t4) <= 3000
 gprodDn_max(gw3,s1,t4): gprodDn(gw3,s1,t4) <= 0
 gprodUp_max(gw3,s2,t1): gprodUp(gw3,s2,t1) <= 2936
 gprodDn_max(gw3,s2,t1): gprodDn(gw3,s2,t1) <= 64
 gprodUp_max(gw3,s2,t2): gprodUp(gw3,s2,t2) <= 2925.64723816
 gprodDn_max(gw3,s2,t2): gprodDn(gw3,s2,t2) <= 74.35276184000003
 gprodUp_max(gw3,s2,t3): gprodUp(gw3,s2,t3) <= 3000
 gprodDn_max(gw3,s2,t3): gprodDn(gw3,s2,t3) <= 0
 gprodUp_max(gw3,s2,t4): gprodUp(gw3,s2,t4) <= 3000
 gprodDn_max(gw3,s2,t4): gprodDn(gw3,s2,t4) <= 0
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
