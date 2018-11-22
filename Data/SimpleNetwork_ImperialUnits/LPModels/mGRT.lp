\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  5000 gshed(ng101,s1,t1) + 5000 gshed(ng102,s1,t1) + gprodUp(gw1,s1,t1)
   - gprodDn(gw1,s1,t1) + 1.5 gprodUp(gw2,s1,t1) - 1.5 gprodDn(gw2,s1,t1)
   + 2 gprodUp(gw3,s1,t1) - 2 gprodDn(gw3,s1,t1) + 5000 gshed(ng101,s1,t2)
   + 5000 gshed(ng102,s1,t2) + gprodUp(gw1,s1,t2) - gprodDn(gw1,s1,t2)
   + 1.5 gprodUp(gw2,s1,t2) - 1.5 gprodDn(gw2,s1,t2) + 2 gprodUp(gw3,s1,t2)
   - 2 gprodDn(gw3,s1,t2) + 5000 gshed(ng101,s1,t3)
   + 5000 gshed(ng102,s1,t3) + gprodUp(gw1,s1,t3) - gprodDn(gw1,s1,t3)
   + 1.5 gprodUp(gw2,s1,t3) - 1.5 gprodDn(gw2,s1,t3) + 2 gprodUp(gw3,s1,t3)
   - 2 gprodDn(gw3,s1,t3) + 5000 gshed(ng101,s1,t4)
   + 5000 gshed(ng102,s1,t4) + gprodUp(gw1,s1,t4) - gprodDn(gw1,s1,t4)
   + 1.5 gprodUp(gw2,s1,t4) - 1.5 gprodDn(gw2,s1,t4) + 2 gprodUp(gw3,s1,t4)
   - 2 gprodDn(gw3,s1,t4) + 5000 gshed(ng101,s2,t1)
   + 5000 gshed(ng102,s2,t1) + gprodUp(gw1,s2,t1) - gprodDn(gw1,s2,t1)
   + 1.5 gprodUp(gw2,s2,t1) - 1.5 gprodDn(gw2,s2,t1) + 2 gprodUp(gw3,s2,t1)
   - 2 gprodDn(gw3,s2,t1) + 5000 gshed(ng101,s2,t2)
   + 5000 gshed(ng102,s2,t2) + gprodUp(gw1,s2,t2) - gprodDn(gw1,s2,t2)
   + 1.5 gprodUp(gw2,s2,t2) - 1.5 gprodDn(gw2,s2,t2) + 2 gprodUp(gw3,s2,t2)
   - 2 gprodDn(gw3,s2,t2) + 5000 gshed(ng101,s2,t3)
   + 5000 gshed(ng102,s2,t3) + gprodUp(gw1,s2,t3) - gprodDn(gw1,s2,t3)
   + 1.5 gprodUp(gw2,s2,t3) - 1.5 gprodDn(gw2,s2,t3) + 2 gprodUp(gw3,s2,t3)
   - 2 gprodDn(gw3,s2,t3) + 5000 gshed(ng101,s2,t4)
   + 5000 gshed(ng102,s2,t4) + gprodUp(gw1,s2,t4) - gprodDn(gw1,s2,t4)
   + 1.5 gprodUp(gw2,s2,t4) - 1.5 gprodDn(gw2,s2,t4) + 2 gprodUp(gw3,s2,t4)
   - 2 gprodDn(gw3,s2,t4)
Subject To
 gas_balance_rt(ng101,s1,t1): gshed(ng101,s1,t1)
   - qin_sr_rt(('ng101','ng102'),s1,t1) + gprodUp(gw1,s1,t1)
   - gprodDn(gw1,s1,t1) + gprodUp(gw2,s1,t1) - gprodDn(gw2,s1,t1)
   + gprodUp(gw3,s1,t1) - gprodDn(gw3,s1,t1) = -320
 gas_balance_rt(ng101,s1,t2): gshed(ng101,s1,t2)
   - qin_sr_rt(('ng101','ng102'),s1,t2) + gprodUp(gw1,s1,t2)
   - gprodDn(gw1,s1,t2) + gprodUp(gw2,s1,t2) - gprodDn(gw2,s1,t2)
   + gprodUp(gw3,s1,t2) - gprodDn(gw3,s1,t2) = -330.35276184
 gas_balance_rt(ng101,s1,t3): gshed(ng101,s1,t3)
   - qin_sr_rt(('ng101','ng102'),s1,t3) + gprodUp(gw1,s1,t3)
   - gprodDn(gw1,s1,t3) + gprodUp(gw2,s1,t3) - gprodDn(gw2,s1,t3)
   + gprodUp(gw3,s1,t3) - gprodDn(gw3,s1,t3) = -340
 gas_balance_rt(ng101,s1,t4): gshed(ng101,s1,t4)
   - qin_sr_rt(('ng101','ng102'),s1,t4) + gprodUp(gw1,s1,t4)
   - gprodDn(gw1,s1,t4) + gprodUp(gw2,s1,t4) - gprodDn(gw2,s1,t4)
   + gprodUp(gw3,s1,t4) - gprodDn(gw3,s1,t4) = -348.28427128
 gas_balance_rt(ng102,s1,t1): gshed(ng102,s1,t1)
   + qout_sr_rt(('ng101','ng102'),s1,t1) = 1200
 gas_balance_rt(ng102,s1,t2): gshed(ng102,s1,t2)
   + qout_sr_rt(('ng101','ng102'),s1,t2) = 1200
 gas_balance_rt(ng102,s1,t3): gshed(ng102,s1,t3)
   + qout_sr_rt(('ng101','ng102'),s1,t3) = 1200
 gas_balance_rt(ng102,s1,t4): gshed(ng102,s1,t4)
   + qout_sr_rt(('ng101','ng102'),s1,t4) = 1200
 gas_balance_rt(ng101,s2,t1): gshed(ng101,s2,t1)
   - qin_sr_rt(('ng101','ng102'),s2,t1) + gprodUp(gw1,s2,t1)
   - gprodDn(gw1,s2,t1) + gprodUp(gw2,s2,t1) - gprodDn(gw2,s2,t1)
   + gprodUp(gw3,s2,t1) - gprodDn(gw3,s2,t1) = -320
 gas_balance_rt(ng101,s2,t2): gshed(ng101,s2,t2)
   - qin_sr_rt(('ng101','ng102'),s2,t2) + gprodUp(gw1,s2,t2)
   - gprodDn(gw1,s2,t2) + gprodUp(gw2,s2,t2) - gprodDn(gw2,s2,t2)
   + gprodUp(gw3,s2,t2) - gprodDn(gw3,s2,t2) = -330.35276184
 gas_balance_rt(ng101,s2,t3): gshed(ng101,s2,t3)
   - qin_sr_rt(('ng101','ng102'),s2,t3) + gprodUp(gw1,s2,t3)
   - gprodDn(gw1,s2,t3) + gprodUp(gw2,s2,t3) - gprodDn(gw2,s2,t3)
   + gprodUp(gw3,s2,t3) - gprodDn(gw3,s2,t3) = -340
 gas_balance_rt(ng101,s2,t4): gshed(ng101,s2,t4)
   - qin_sr_rt(('ng101','ng102'),s2,t4) + gprodUp(gw1,s2,t4)
   - gprodDn(gw1,s2,t4) + gprodUp(gw2,s2,t4) - gprodDn(gw2,s2,t4)
   + gprodUp(gw3,s2,t4) - gprodDn(gw3,s2,t4) = -348.28427128
 gas_balance_rt(ng102,s2,t1): gshed(ng102,s2,t1)
   + qout_sr_rt(('ng101','ng102'),s2,t1) = 1200
 gas_balance_rt(ng102,s2,t2): gshed(ng102,s2,t2)
   + qout_sr_rt(('ng101','ng102'),s2,t2) = 1200
 gas_balance_rt(ng102,s2,t3): gshed(ng102,s2,t3)
   + qout_sr_rt(('ng101','ng102'),s2,t3) = 1200
 gas_balance_rt(ng102,s2,t4): gshed(ng102,s2,t4)
   + qout_sr_rt(('ng101','ng102'),s2,t4) = 1200
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
 gprodUp_max(gw2,s1,t1): gprodUp(gw2,s1,t1) <= 30
 gprodDn_max(gw2,s1,t1): gprodDn(gw2,s1,t1) <= 220
 gprodUp_max(gw2,s1,t2): gprodUp(gw2,s1,t2) <= 19.64723815999997
 gprodDn_max(gw2,s1,t2): gprodDn(gw2,s1,t2) <= 230.35276184
 gprodUp_max(gw2,s1,t3): gprodUp(gw2,s1,t3) <= 10
 gprodDn_max(gw2,s1,t3): gprodDn(gw2,s1,t3) <= 240
 gprodUp_max(gw2,s1,t4): gprodUp(gw2,s1,t4) <= 1.715728720000016
 gprodDn_max(gw2,s1,t4): gprodDn(gw2,s1,t4) <= 248.28427128
 gprodUp_max(gw2,s2,t1): gprodUp(gw2,s2,t1) <= 30
 gprodDn_max(gw2,s2,t1): gprodDn(gw2,s2,t1) <= 220
 gprodUp_max(gw2,s2,t2): gprodUp(gw2,s2,t2) <= 19.64723815999997
 gprodDn_max(gw2,s2,t2): gprodDn(gw2,s2,t2) <= 230.35276184
 gprodUp_max(gw2,s2,t3): gprodUp(gw2,s2,t3) <= 10
 gprodDn_max(gw2,s2,t3): gprodDn(gw2,s2,t3) <= 240
 gprodUp_max(gw2,s2,t4): gprodUp(gw2,s2,t4) <= 1.715728720000016
 gprodDn_max(gw2,s2,t4): gprodDn(gw2,s2,t4) <= 248.28427128
 gprodUp_max(gw3,s1,t1): gprodUp(gw3,s1,t1) <= 500
 gprodDn_max(gw3,s1,t1): gprodDn(gw3,s1,t1) <= 0
 gprodUp_max(gw3,s1,t2): gprodUp(gw3,s1,t2) <= 500
 gprodDn_max(gw3,s1,t2): gprodDn(gw3,s1,t2) <= 0
 gprodUp_max(gw3,s1,t3): gprodUp(gw3,s1,t3) <= 500
 gprodDn_max(gw3,s1,t3): gprodDn(gw3,s1,t3) <= 0
 gprodUp_max(gw3,s1,t4): gprodUp(gw3,s1,t4) <= 500
 gprodDn_max(gw3,s1,t4): gprodDn(gw3,s1,t4) <= 0
 gprodUp_max(gw3,s2,t1): gprodUp(gw3,s2,t1) <= 500
 gprodDn_max(gw3,s2,t1): gprodDn(gw3,s2,t1) <= 0
 gprodUp_max(gw3,s2,t2): gprodUp(gw3,s2,t2) <= 500
 gprodDn_max(gw3,s2,t2): gprodDn(gw3,s2,t2) <= 0
 gprodUp_max(gw3,s2,t3): gprodUp(gw3,s2,t3) <= 500
 gprodDn_max(gw3,s2,t3): gprodDn(gw3,s2,t3) <= 0
 gprodUp_max(gw3,s2,t4): gprodUp(gw3,s2,t4) <= 500
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
