\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  500 gshed(ng101,s1,t1) + 500 gshed(ng102,s1,t1) + 1.03 gprodUp(gw1,s1,t1)
   - 0.98 gprodDn(gw1,s1,t1) + 1.545 gprodUp(gw2,s1,t1)
   - 1.47 gprodDn(gw2,s1,t1) + 2.06 gprodUp(gw3,s1,t1)
   - 1.96 gprodDn(gw3,s1,t1) + 500 gshed(ng101,s1,t2)
   + 500 gshed(ng102,s1,t2) + 1.03 gprodUp(gw1,s1,t2)
   - 0.98 gprodDn(gw1,s1,t2) + 1.545 gprodUp(gw2,s1,t2)
   - 1.47 gprodDn(gw2,s1,t2) + 2.06 gprodUp(gw3,s1,t2)
   - 1.96 gprodDn(gw3,s1,t2) + 500 gshed(ng101,s1,t3)
   + 500 gshed(ng102,s1,t3) + 1.03 gprodUp(gw1,s1,t3)
   - 0.98 gprodDn(gw1,s1,t3) + 1.545 gprodUp(gw2,s1,t3)
   - 1.47 gprodDn(gw2,s1,t3) + 2.06 gprodUp(gw3,s1,t3)
   - 1.96 gprodDn(gw3,s1,t3) + 500 gshed(ng101,s2,t1)
   + 500 gshed(ng102,s2,t1) + 1.03 gprodUp(gw1,s2,t1)
   - 0.98 gprodDn(gw1,s2,t1) + 1.545 gprodUp(gw2,s2,t1)
   - 1.47 gprodDn(gw2,s2,t1) + 2.06 gprodUp(gw3,s2,t1)
   - 1.96 gprodDn(gw3,s2,t1) + 500 gshed(ng101,s2,t2)
   + 500 gshed(ng102,s2,t2) + 1.03 gprodUp(gw1,s2,t2)
   - 0.98 gprodDn(gw1,s2,t2) + 1.545 gprodUp(gw2,s2,t2)
   - 1.47 gprodDn(gw2,s2,t2) + 2.06 gprodUp(gw3,s2,t2)
   - 1.96 gprodDn(gw3,s2,t2) + 500 gshed(ng101,s2,t3)
   + 500 gshed(ng102,s2,t3) + 1.03 gprodUp(gw1,s2,t3)
   - 0.98 gprodDn(gw1,s2,t3) + 1.545 gprodUp(gw2,s2,t3)
   - 1.47 gprodDn(gw2,s2,t3) + 2.06 gprodUp(gw3,s2,t3)
   - 1.96 gprodDn(gw3,s2,t3)
Subject To
 gas_balance_rt(ng101,s1,t1): gshed(ng101,s1,t1)
   - qin_sr_rt(('ng101','ng102'),s1,t1) + gprodUp(gw1,s1,t1)
   - gprodDn(gw1,s1,t1) + gprodUp(gw2,s1,t1) - gprodDn(gw2,s1,t1)
   + gprodUp(gw3,s1,t1) - gprodDn(gw3,s1,t1) = -400
 gas_balance_rt(ng101,s1,t2): gshed(ng101,s1,t2)
   - qin_sr_rt(('ng101','ng102'),s1,t2) + gprodUp(gw1,s1,t2)
   - gprodDn(gw1,s1,t2) + gprodUp(gw2,s1,t2) - gprodDn(gw2,s1,t2)
   + gprodUp(gw3,s1,t2) - gprodDn(gw3,s1,t2) = -400
 gas_balance_rt(ng101,s1,t3): gshed(ng101,s1,t3)
   - qin_sr_rt(('ng101','ng102'),s1,t3) + gprodUp(gw1,s1,t3)
   - gprodDn(gw1,s1,t3) + gprodUp(gw2,s1,t3) - gprodDn(gw2,s1,t3)
   + gprodUp(gw3,s1,t3) - gprodDn(gw3,s1,t3) = -400
 gas_balance_rt(ng102,s1,t1): gshed(ng102,s1,t1)
   + qout_sr_rt(('ng101','ng102'),s1,t1) = 280
 gas_balance_rt(ng102,s1,t2): gshed(ng102,s1,t2)
   + qout_sr_rt(('ng101','ng102'),s1,t2) = 240
 gas_balance_rt(ng102,s1,t3): gshed(ng102,s1,t3)
   + qout_sr_rt(('ng101','ng102'),s1,t3) = 392
 gas_balance_rt(ng101,s2,t1): gshed(ng101,s2,t1)
   - qin_sr_rt(('ng101','ng102'),s2,t1) + gprodUp(gw1,s2,t1)
   - gprodDn(gw1,s2,t1) + gprodUp(gw2,s2,t1) - gprodDn(gw2,s2,t1)
   + gprodUp(gw3,s2,t1) - gprodDn(gw3,s2,t1) = -400
 gas_balance_rt(ng101,s2,t2): gshed(ng101,s2,t2)
   - qin_sr_rt(('ng101','ng102'),s2,t2) + gprodUp(gw1,s2,t2)
   - gprodDn(gw1,s2,t2) + gprodUp(gw2,s2,t2) - gprodDn(gw2,s2,t2)
   + gprodUp(gw3,s2,t2) - gprodDn(gw3,s2,t2) = -400
 gas_balance_rt(ng101,s2,t3): gshed(ng101,s2,t3)
   - qin_sr_rt(('ng101','ng102'),s2,t3) + gprodUp(gw1,s2,t3)
   - gprodDn(gw1,s2,t3) + gprodUp(gw2,s2,t3) - gprodDn(gw2,s2,t3)
   + gprodUp(gw3,s2,t3) - gprodDn(gw3,s2,t3) = -400
 gas_balance_rt(ng102,s2,t1): gshed(ng102,s2,t1)
   + qout_sr_rt(('ng101','ng102'),s2,t1) = 280
 gas_balance_rt(ng102,s2,t2): gshed(ng102,s2,t2)
   + qout_sr_rt(('ng101','ng102'),s2,t2) = 240
 gas_balance_rt(ng102,s2,t3): gshed(ng102,s2,t3)
   + qout_sr_rt(('ng101','ng102'),s2,t3) = 392
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
 gprodUp_max(gw1,s1,t1): gprodUp(gw1,s1,t1) <= 0
 gprodDn_max(gw1,s1,t1): gprodDn(gw1,s1,t1) <= 320
 gprodUp_max(gw1,s1,t2): gprodUp(gw1,s1,t2) <= 0
 gprodDn_max(gw1,s1,t2): gprodDn(gw1,s1,t2) <= 320
 gprodUp_max(gw1,s1,t3): gprodUp(gw1,s1,t3) <= 0
 gprodDn_max(gw1,s1,t3): gprodDn(gw1,s1,t3) <= 320
 gprodUp_max(gw1,s2,t1): gprodUp(gw1,s2,t1) <= 0
 gprodDn_max(gw1,s2,t1): gprodDn(gw1,s2,t1) <= 320
 gprodUp_max(gw1,s2,t2): gprodUp(gw1,s2,t2) <= 0
 gprodDn_max(gw1,s2,t2): gprodDn(gw1,s2,t2) <= 320
 gprodUp_max(gw1,s2,t3): gprodUp(gw1,s2,t3) <= 0
 gprodDn_max(gw1,s2,t3): gprodDn(gw1,s2,t3) <= 320
 gprodUp_max(gw2,s1,t1): gprodUp(gw2,s1,t1) <= 0
 gprodDn_max(gw2,s1,t1): gprodDn(gw2,s1,t1) <= 64
 gprodUp_max(gw2,s1,t2): gprodUp(gw2,s1,t2) <= 0
 gprodDn_max(gw2,s1,t2): gprodDn(gw2,s1,t2) <= 64
 gprodUp_max(gw2,s1,t3): gprodUp(gw2,s1,t3) <= 0
 gprodDn_max(gw2,s1,t3): gprodDn(gw2,s1,t3) <= 64
 gprodUp_max(gw2,s2,t1): gprodUp(gw2,s2,t1) <= 0
 gprodDn_max(gw2,s2,t1): gprodDn(gw2,s2,t1) <= 64
 gprodUp_max(gw2,s2,t2): gprodUp(gw2,s2,t2) <= 0
 gprodDn_max(gw2,s2,t2): gprodDn(gw2,s2,t2) <= 64
 gprodUp_max(gw2,s2,t3): gprodUp(gw2,s2,t3) <= 0
 gprodDn_max(gw2,s2,t3): gprodDn(gw2,s2,t3) <= 64
 gprodUp_max(gw3,s1,t1): gprodUp(gw3,s1,t1) <= 2984
 gprodDn_max(gw3,s1,t1): gprodDn(gw3,s1,t1) <= 16
 gprodUp_max(gw3,s1,t2): gprodUp(gw3,s1,t2) <= 2984
 gprodDn_max(gw3,s1,t2): gprodDn(gw3,s1,t2) <= 16
 gprodUp_max(gw3,s1,t3): gprodUp(gw3,s1,t3) <= 2984
 gprodDn_max(gw3,s1,t3): gprodDn(gw3,s1,t3) <= 16
 gprodUp_max(gw3,s2,t1): gprodUp(gw3,s2,t1) <= 2984
 gprodDn_max(gw3,s2,t1): gprodDn(gw3,s2,t1) <= 16
 gprodUp_max(gw3,s2,t2): gprodUp(gw3,s2,t2) <= 2984
 gprodDn_max(gw3,s2,t2): gprodDn(gw3,s2,t2) <= 16
 gprodUp_max(gw3,s2,t3): gprodUp(gw3,s2,t3) <= 2984
 gprodDn_max(gw3,s2,t3): gprodDn(gw3,s2,t3) <= 16
 line_store_rt(('ng101','ng102'),s1,t1):
   - qin_sr_rt(('ng101','ng102'),s1,t1)
   + qout_sr_rt(('ng101','ng102'),s1,t1) = 0
 line_store_rt(('ng101','ng102'),s1,t2):
   - qin_sr_rt(('ng101','ng102'),s1,t2)
   + qout_sr_rt(('ng101','ng102'),s1,t2) = 0
 line_store_rt(('ng101','ng102'),s1,t3):
   - qin_sr_rt(('ng101','ng102'),s1,t3)
   + qout_sr_rt(('ng101','ng102'),s1,t3) = 0
 line_store_rt(('ng101','ng102'),s2,t1):
   - qin_sr_rt(('ng101','ng102'),s2,t1)
   + qout_sr_rt(('ng101','ng102'),s2,t1) = 0
 line_store_rt(('ng101','ng102'),s2,t2):
   - qin_sr_rt(('ng101','ng102'),s2,t2)
   + qout_sr_rt(('ng101','ng102'),s2,t2) = 0
 line_store_rt(('ng101','ng102'),s2,t3):
   - qin_sr_rt(('ng101','ng102'),s2,t3)
   + qout_sr_rt(('ng101','ng102'),s2,t3) = 0
 gas_shed_rt(ng101,s1,t1): gshed(ng101,s1,t1) <= 0
 gas_shed_rt(ng101,s1,t2): gshed(ng101,s1,t2) <= 0
 gas_shed_rt(ng101,s1,t3): gshed(ng101,s1,t3) <= 0
 gas_shed_rt(ng102,s1,t1): gshed(ng102,s1,t1) <= 0
 gas_shed_rt(ng102,s1,t2): gshed(ng102,s1,t2) <= 0
 gas_shed_rt(ng102,s1,t3): gshed(ng102,s1,t3) <= 0
 gas_shed_rt(ng101,s2,t1): gshed(ng101,s2,t1) <= 0
 gas_shed_rt(ng101,s2,t2): gshed(ng101,s2,t2) <= 0
 gas_shed_rt(ng101,s2,t3): gshed(ng101,s2,t3) <= 0
 gas_shed_rt(ng102,s2,t1): gshed(ng102,s2,t1) <= 0
 gas_shed_rt(ng102,s2,t2): gshed(ng102,s2,t2) <= 0
 gas_shed_rt(ng102,s2,t3): gshed(ng102,s2,t3) <= 0
 SOS1_gflow_sr_limit_rt(('ng101','ng102'),s1,t1):
   gflow_sr_rt(('ng101','ng102'),s1,t1)
   + SOS1_gflow_sr_limit_rt(('ng101','ng102'),s1,t1) = 10000
 SOS1_gflow_sr_limit_rt(('ng101','ng102'),s2,t1):
   gflow_sr_rt(('ng101','ng102'),s2,t1)
   + SOS1_gflow_sr_limit_rt(('ng101','ng102'),s2,t1) = 10000
 SOS1_gflow_sr_limit_rt(('ng101','ng102'),s1,t2):
   gflow_sr_rt(('ng101','ng102'),s1,t2)
   + SOS1_gflow_sr_limit_rt(('ng101','ng102'),s1,t2) = 10000
 SOS1_gflow_sr_limit_rt(('ng101','ng102'),s2,t2):
   gflow_sr_rt(('ng101','ng102'),s2,t2)
   + SOS1_gflow_sr_limit_rt(('ng101','ng102'),s2,t2) = 10000
 SOS1_gflow_sr_limit_rt(('ng101','ng102'),s1,t3):
   gflow_sr_rt(('ng101','ng102'),s1,t3)
   + SOS1_gflow_sr_limit_rt(('ng101','ng102'),s1,t3) = 10000
 SOS1_gflow_sr_limit_rt(('ng101','ng102'),s2,t3):
   gflow_sr_rt(('ng101','ng102'),s2,t3)
   + SOS1_gflow_sr_limit_rt(('ng101','ng102'),s2,t3) = 10000
 SOS1_gprodUp_max(gw1,s1,t1): gprodUp(gw1,s1,t1)
   + SOS1_gprodUp_max(gw1,s1,t1) = 0
 SOS1_gprodDn_max(gw1,s1,t1): gprodDn(gw1,s1,t1)
   + SOS1_gprodDn_max(gw1,s1,t1) = 320
 SOS1_gprodUp_max(gw1,s1,t2): gprodUp(gw1,s1,t2)
   + SOS1_gprodUp_max(gw1,s1,t2) = 0
 SOS1_gprodDn_max(gw1,s1,t2): gprodDn(gw1,s1,t2)
   + SOS1_gprodDn_max(gw1,s1,t2) = 320
 SOS1_gprodUp_max(gw1,s1,t3): gprodUp(gw1,s1,t3)
   + SOS1_gprodUp_max(gw1,s1,t3) = 0
 SOS1_gprodDn_max(gw1,s1,t3): gprodDn(gw1,s1,t3)
   + SOS1_gprodDn_max(gw1,s1,t3) = 320
 SOS1_gprodUp_max(gw1,s2,t1): gprodUp(gw1,s2,t1)
   + SOS1_gprodUp_max(gw1,s2,t1) = 0
 SOS1_gprodDn_max(gw1,s2,t1): gprodDn(gw1,s2,t1)
   + SOS1_gprodDn_max(gw1,s2,t1) = 320
 SOS1_gprodUp_max(gw1,s2,t2): gprodUp(gw1,s2,t2)
   + SOS1_gprodUp_max(gw1,s2,t2) = 0
 SOS1_gprodDn_max(gw1,s2,t2): gprodDn(gw1,s2,t2)
   + SOS1_gprodDn_max(gw1,s2,t2) = 320
 SOS1_gprodUp_max(gw1,s2,t3): gprodUp(gw1,s2,t3)
   + SOS1_gprodUp_max(gw1,s2,t3) = 0
 SOS1_gprodDn_max(gw1,s2,t3): gprodDn(gw1,s2,t3)
   + SOS1_gprodDn_max(gw1,s2,t3) = 320
 SOS1_gprodUp_max(gw2,s1,t1): gprodUp(gw2,s1,t1)
   + SOS1_gprodUp_max(gw2,s1,t1) = 0
 SOS1_gprodDn_max(gw2,s1,t1): gprodDn(gw2,s1,t1)
   + SOS1_gprodDn_max(gw2,s1,t1) = 64
 SOS1_gprodUp_max(gw2,s1,t2): gprodUp(gw2,s1,t2)
   + SOS1_gprodUp_max(gw2,s1,t2) = 0
 SOS1_gprodDn_max(gw2,s1,t2): gprodDn(gw2,s1,t2)
   + SOS1_gprodDn_max(gw2,s1,t2) = 64
 SOS1_gprodUp_max(gw2,s1,t3): gprodUp(gw2,s1,t3)
   + SOS1_gprodUp_max(gw2,s1,t3) = 0
 SOS1_gprodDn_max(gw2,s1,t3): gprodDn(gw2,s1,t3)
   + SOS1_gprodDn_max(gw2,s1,t3) = 64
 SOS1_gprodUp_max(gw2,s2,t1): gprodUp(gw2,s2,t1)
   + SOS1_gprodUp_max(gw2,s2,t1) = 0
 SOS1_gprodDn_max(gw2,s2,t1): gprodDn(gw2,s2,t1)
   + SOS1_gprodDn_max(gw2,s2,t1) = 64
 SOS1_gprodUp_max(gw2,s2,t2): gprodUp(gw2,s2,t2)
   + SOS1_gprodUp_max(gw2,s2,t2) = 0
 SOS1_gprodDn_max(gw2,s2,t2): gprodDn(gw2,s2,t2)
   + SOS1_gprodDn_max(gw2,s2,t2) = 64
 SOS1_gprodUp_max(gw2,s2,t3): gprodUp(gw2,s2,t3)
   + SOS1_gprodUp_max(gw2,s2,t3) = 0
 SOS1_gprodDn_max(gw2,s2,t3): gprodDn(gw2,s2,t3)
   + SOS1_gprodDn_max(gw2,s2,t3) = 64
 SOS1_gprodUp_max(gw3,s1,t1): gprodUp(gw3,s1,t1)
   + SOS1_gprodUp_max(gw3,s1,t1) = 2984
 SOS1_gprodDn_max(gw3,s1,t1): gprodDn(gw3,s1,t1)
   + SOS1_gprodDn_max(gw3,s1,t1) = 16
 SOS1_gprodUp_max(gw3,s1,t2): gprodUp(gw3,s1,t2)
   + SOS1_gprodUp_max(gw3,s1,t2) = 2984
 SOS1_gprodDn_max(gw3,s1,t2): gprodDn(gw3,s1,t2)
   + SOS1_gprodDn_max(gw3,s1,t2) = 16
 SOS1_gprodUp_max(gw3,s1,t3): gprodUp(gw3,s1,t3)
   + SOS1_gprodUp_max(gw3,s1,t3) = 2984
 SOS1_gprodDn_max(gw3,s1,t3): gprodDn(gw3,s1,t3)
   + SOS1_gprodDn_max(gw3,s1,t3) = 16
 SOS1_gprodUp_max(gw3,s2,t1): gprodUp(gw3,s2,t1)
   + SOS1_gprodUp_max(gw3,s2,t1) = 2984
 SOS1_gprodDn_max(gw3,s2,t1): gprodDn(gw3,s2,t1)
   + SOS1_gprodDn_max(gw3,s2,t1) = 16
 SOS1_gprodUp_max(gw3,s2,t2): gprodUp(gw3,s2,t2)
   + SOS1_gprodUp_max(gw3,s2,t2) = 2984
 SOS1_gprodDn_max(gw3,s2,t2): gprodDn(gw3,s2,t2)
   + SOS1_gprodDn_max(gw3,s2,t2) = 16
 SOS1_gprodUp_max(gw3,s2,t3): gprodUp(gw3,s2,t3)
   + SOS1_gprodUp_max(gw3,s2,t3) = 2984
 SOS1_gprodDn_max(gw3,s2,t3): gprodDn(gw3,s2,t3)
   + SOS1_gprodDn_max(gw3,s2,t3) = 16
 SOS1_gas_shed_rt(ng101,s1,t1): gshed(ng101,s1,t1)
   + SOS1_gas_shed_rt(ng101,s1,t1) = 0
 SOS1_gas_shed_rt(ng101,s1,t2): gshed(ng101,s1,t2)
   + SOS1_gas_shed_rt(ng101,s1,t2) = 0
 SOS1_gas_shed_rt(ng101,s1,t3): gshed(ng101,s1,t3)
   + SOS1_gas_shed_rt(ng101,s1,t3) = 0
 SOS1_gas_shed_rt(ng102,s1,t1): gshed(ng102,s1,t1)
   + SOS1_gas_shed_rt(ng102,s1,t1) = 0
 SOS1_gas_shed_rt(ng102,s1,t2): gshed(ng102,s1,t2)
   + SOS1_gas_shed_rt(ng102,s1,t2) = 0
 SOS1_gas_shed_rt(ng102,s1,t3): gshed(ng102,s1,t3)
   + SOS1_gas_shed_rt(ng102,s1,t3) = 0
 SOS1_gas_shed_rt(ng101,s2,t1): gshed(ng101,s2,t1)
   + SOS1_gas_shed_rt(ng101,s2,t1) = 0
 SOS1_gas_shed_rt(ng101,s2,t2): gshed(ng101,s2,t2)
   + SOS1_gas_shed_rt(ng101,s2,t2) = 0
 SOS1_gas_shed_rt(ng101,s2,t3): gshed(ng101,s2,t3)
   + SOS1_gas_shed_rt(ng101,s2,t3) = 0
 SOS1_gas_shed_rt(ng102,s2,t1): gshed(ng102,s2,t1)
   + SOS1_gas_shed_rt(ng102,s2,t1) = 0
 SOS1_gas_shed_rt(ng102,s2,t2): gshed(ng102,s2,t2)
   + SOS1_gas_shed_rt(ng102,s2,t2) = 0
 SOS1_gas_shed_rt(ng102,s2,t3): gshed(ng102,s2,t3)
   + SOS1_gas_shed_rt(ng102,s2,t3) = 0
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
 dLag/gshed(ng101,s1,t1): - lambda_gas_balance_rt(ng101,s1,t1)
   + mu_gas_shed_rt(ng101,s1,t1) - muLB_gshed(ng101,s1,t1) = -500
 dLag/gshed(ng102,s1,t1): - lambda_gas_balance_rt(ng102,s1,t1)
   + mu_gas_shed_rt(ng102,s1,t1) - muLB_gshed(ng102,s1,t1) = -500
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
   + mu_gprodUp_max(gw1,s1,t1) - muLB_gprodUp(gw1,s1,t1) = -1.03
 dLag/gprodDn(gw1,s1,t1): lambda_gas_balance_rt(ng101,s1,t1)
   + mu_gprodDn_max(gw1,s1,t1) - muLB_gprodDn(gw1,s1,t1) = 0.98
 dLag/gprodUp(gw2,s1,t1): - lambda_gas_balance_rt(ng101,s1,t1)
   + mu_gprodUp_max(gw2,s1,t1) - muLB_gprodUp(gw2,s1,t1) = -1.545
 dLag/gprodDn(gw2,s1,t1): lambda_gas_balance_rt(ng101,s1,t1)
   + mu_gprodDn_max(gw2,s1,t1) - muLB_gprodDn(gw2,s1,t1) = 1.47
 dLag/gprodUp(gw3,s1,t1): - lambda_gas_balance_rt(ng101,s1,t1)
   + mu_gprodUp_max(gw3,s1,t1) - muLB_gprodUp(gw3,s1,t1) = -2.06
 dLag/gprodDn(gw3,s1,t1): lambda_gas_balance_rt(ng101,s1,t1)
   + mu_gprodDn_max(gw3,s1,t1) - muLB_gprodDn(gw3,s1,t1) = 1.96
 dLag/gshed(ng101,s1,t2): - lambda_gas_balance_rt(ng101,s1,t2)
   + mu_gas_shed_rt(ng101,s1,t2) - muLB_gshed(ng101,s1,t2) = -500
 dLag/gshed(ng102,s1,t2): - lambda_gas_balance_rt(ng102,s1,t2)
   + mu_gas_shed_rt(ng102,s1,t2) - muLB_gshed(ng102,s1,t2) = -500
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
   + mu_gprodUp_max(gw1,s1,t2) - muLB_gprodUp(gw1,s1,t2) = -1.03
 dLag/gprodDn(gw1,s1,t2): lambda_gas_balance_rt(ng101,s1,t2)
   + mu_gprodDn_max(gw1,s1,t2) - muLB_gprodDn(gw1,s1,t2) = 0.98
 dLag/gprodUp(gw2,s1,t2): - lambda_gas_balance_rt(ng101,s1,t2)
   + mu_gprodUp_max(gw2,s1,t2) - muLB_gprodUp(gw2,s1,t2) = -1.545
 dLag/gprodDn(gw2,s1,t2): lambda_gas_balance_rt(ng101,s1,t2)
   + mu_gprodDn_max(gw2,s1,t2) - muLB_gprodDn(gw2,s1,t2) = 1.47
 dLag/gprodUp(gw3,s1,t2): - lambda_gas_balance_rt(ng101,s1,t2)
   + mu_gprodUp_max(gw3,s1,t2) - muLB_gprodUp(gw3,s1,t2) = -2.06
 dLag/gprodDn(gw3,s1,t2): lambda_gas_balance_rt(ng101,s1,t2)
   + mu_gprodDn_max(gw3,s1,t2) - muLB_gprodDn(gw3,s1,t2) = 1.96
 dLag/gshed(ng101,s1,t3): - lambda_gas_balance_rt(ng101,s1,t3)
   + mu_gas_shed_rt(ng101,s1,t3) - muLB_gshed(ng101,s1,t3) = -500
 dLag/gshed(ng102,s1,t3): - lambda_gas_balance_rt(ng102,s1,t3)
   + mu_gas_shed_rt(ng102,s1,t3) - muLB_gshed(ng102,s1,t3) = -500
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
   + mu_gprodUp_max(gw1,s1,t3) - muLB_gprodUp(gw1,s1,t3) = -1.03
 dLag/gprodDn(gw1,s1,t3): lambda_gas_balance_rt(ng101,s1,t3)
   + mu_gprodDn_max(gw1,s1,t3) - muLB_gprodDn(gw1,s1,t3) = 0.98
 dLag/gprodUp(gw2,s1,t3): - lambda_gas_balance_rt(ng101,s1,t3)
   + mu_gprodUp_max(gw2,s1,t3) - muLB_gprodUp(gw2,s1,t3) = -1.545
 dLag/gprodDn(gw2,s1,t3): lambda_gas_balance_rt(ng101,s1,t3)
   + mu_gprodDn_max(gw2,s1,t3) - muLB_gprodDn(gw2,s1,t3) = 1.47
 dLag/gprodUp(gw3,s1,t3): - lambda_gas_balance_rt(ng101,s1,t3)
   + mu_gprodUp_max(gw3,s1,t3) - muLB_gprodUp(gw3,s1,t3) = -2.06
 dLag/gprodDn(gw3,s1,t3): lambda_gas_balance_rt(ng101,s1,t3)
   + mu_gprodDn_max(gw3,s1,t3) - muLB_gprodDn(gw3,s1,t3) = 1.96
 dLag/gshed(ng101,s2,t1): - lambda_gas_balance_rt(ng101,s2,t1)
   + mu_gas_shed_rt(ng101,s2,t1) - muLB_gshed(ng101,s2,t1) = -500
 dLag/gshed(ng102,s2,t1): - lambda_gas_balance_rt(ng102,s2,t1)
   + mu_gas_shed_rt(ng102,s2,t1) - muLB_gshed(ng102,s2,t1) = -500
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
   + mu_gprodUp_max(gw1,s2,t1) - muLB_gprodUp(gw1,s2,t1) = -1.03
 dLag/gprodDn(gw1,s2,t1): lambda_gas_balance_rt(ng101,s2,t1)
   + mu_gprodDn_max(gw1,s2,t1) - muLB_gprodDn(gw1,s2,t1) = 0.98
 dLag/gprodUp(gw2,s2,t1): - lambda_gas_balance_rt(ng101,s2,t1)
   + mu_gprodUp_max(gw2,s2,t1) - muLB_gprodUp(gw2,s2,t1) = -1.545
 dLag/gprodDn(gw2,s2,t1): lambda_gas_balance_rt(ng101,s2,t1)
   + mu_gprodDn_max(gw2,s2,t1) - muLB_gprodDn(gw2,s2,t1) = 1.47
 dLag/gprodUp(gw3,s2,t1): - lambda_gas_balance_rt(ng101,s2,t1)
   + mu_gprodUp_max(gw3,s2,t1) - muLB_gprodUp(gw3,s2,t1) = -2.06
 dLag/gprodDn(gw3,s2,t1): lambda_gas_balance_rt(ng101,s2,t1)
   + mu_gprodDn_max(gw3,s2,t1) - muLB_gprodDn(gw3,s2,t1) = 1.96
 dLag/gshed(ng101,s2,t2): - lambda_gas_balance_rt(ng101,s2,t2)
   + mu_gas_shed_rt(ng101,s2,t2) - muLB_gshed(ng101,s2,t2) = -500
 dLag/gshed(ng102,s2,t2): - lambda_gas_balance_rt(ng102,s2,t2)
   + mu_gas_shed_rt(ng102,s2,t2) - muLB_gshed(ng102,s2,t2) = -500
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
   + mu_gprodUp_max(gw1,s2,t2) - muLB_gprodUp(gw1,s2,t2) = -1.03
 dLag/gprodDn(gw1,s2,t2): lambda_gas_balance_rt(ng101,s2,t2)
   + mu_gprodDn_max(gw1,s2,t2) - muLB_gprodDn(gw1,s2,t2) = 0.98
 dLag/gprodUp(gw2,s2,t2): - lambda_gas_balance_rt(ng101,s2,t2)
   + mu_gprodUp_max(gw2,s2,t2) - muLB_gprodUp(gw2,s2,t2) = -1.545
 dLag/gprodDn(gw2,s2,t2): lambda_gas_balance_rt(ng101,s2,t2)
   + mu_gprodDn_max(gw2,s2,t2) - muLB_gprodDn(gw2,s2,t2) = 1.47
 dLag/gprodUp(gw3,s2,t2): - lambda_gas_balance_rt(ng101,s2,t2)
   + mu_gprodUp_max(gw3,s2,t2) - muLB_gprodUp(gw3,s2,t2) = -2.06
 dLag/gprodDn(gw3,s2,t2): lambda_gas_balance_rt(ng101,s2,t2)
   + mu_gprodDn_max(gw3,s2,t2) - muLB_gprodDn(gw3,s2,t2) = 1.96
 dLag/gshed(ng101,s2,t3): - lambda_gas_balance_rt(ng101,s2,t3)
   + mu_gas_shed_rt(ng101,s2,t3) - muLB_gshed(ng101,s2,t3) = -500
 dLag/gshed(ng102,s2,t3): - lambda_gas_balance_rt(ng102,s2,t3)
   + mu_gas_shed_rt(ng102,s2,t3) - muLB_gshed(ng102,s2,t3) = -500
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
   + mu_gprodUp_max(gw1,s2,t3) - muLB_gprodUp(gw1,s2,t3) = -1.03
 dLag/gprodDn(gw1,s2,t3): lambda_gas_balance_rt(ng101,s2,t3)
   + mu_gprodDn_max(gw1,s2,t3) - muLB_gprodDn(gw1,s2,t3) = 0.98
 dLag/gprodUp(gw2,s2,t3): - lambda_gas_balance_rt(ng101,s2,t3)
   + mu_gprodUp_max(gw2,s2,t3) - muLB_gprodUp(gw2,s2,t3) = -1.545
 dLag/gprodDn(gw2,s2,t3): lambda_gas_balance_rt(ng101,s2,t3)
   + mu_gprodDn_max(gw2,s2,t3) - muLB_gprodDn(gw2,s2,t3) = 1.47
 dLag/gprodUp(gw3,s2,t3): - lambda_gas_balance_rt(ng101,s2,t3)
   + mu_gprodUp_max(gw3,s2,t3) - muLB_gprodUp(gw3,s2,t3) = -2.06
 dLag/gprodDn(gw3,s2,t3): lambda_gas_balance_rt(ng101,s2,t3)
   + mu_gprodDn_max(gw3,s2,t3) - muLB_gprodDn(gw3,s2,t3) = 1.96
Bounds
 lambda_gas_balance_rt(ng101,s1,t1) free
 lambda_gas_balance_rt(ng101,s1,t2) free
 lambda_gas_balance_rt(ng101,s1,t3) free
 lambda_gas_balance_rt(ng102,s1,t1) free
 lambda_gas_balance_rt(ng102,s1,t2) free
 lambda_gas_balance_rt(ng102,s1,t3) free
 lambda_gas_balance_rt(ng101,s2,t1) free
 lambda_gas_balance_rt(ng101,s2,t2) free
 lambda_gas_balance_rt(ng101,s2,t3) free
 lambda_gas_balance_rt(ng102,s2,t1) free
 lambda_gas_balance_rt(ng102,s2,t2) free
 lambda_gas_balance_rt(ng102,s2,t3) free
 lambda_gflow_sr_io_rt(('ng101','ng102'),s1,t1) free
 lambda_gflow_sr_io_rt(('ng101','ng102'),s2,t1) free
 lambda_gflow_sr_io_rt(('ng101','ng102'),s1,t2) free
 lambda_gflow_sr_io_rt(('ng101','ng102'),s2,t2) free
 lambda_gflow_sr_io_rt(('ng101','ng102'),s1,t3) free
 lambda_gflow_sr_io_rt(('ng101','ng102'),s2,t3) free
 lambda_line_store_rt(('ng101','ng102'),s1,t1) free
 lambda_line_store_rt(('ng101','ng102'),s1,t2) free
 lambda_line_store_rt(('ng101','ng102'),s1,t3) free
 lambda_line_store_rt(('ng101','ng102'),s2,t1) free
 lambda_line_store_rt(('ng101','ng102'),s2,t2) free
 lambda_line_store_rt(('ng101','ng102'),s2,t3) free
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
 s6:  S1 :: mu_gprodUp_max(gw1,s1,t1):1 SOS1_gprodUp_max(gw1,s1,t1):2
 s7:  S1 :: mu_gprodDn_max(gw1,s1,t1):1 SOS1_gprodDn_max(gw1,s1,t1):2
 s8:  S1 :: mu_gprodUp_max(gw1,s1,t2):1 SOS1_gprodUp_max(gw1,s1,t2):2
 s9:  S1 :: mu_gprodDn_max(gw1,s1,t2):1 SOS1_gprodDn_max(gw1,s1,t2):2
 s10:  S1 :: mu_gprodUp_max(gw1,s1,t3):1 SOS1_gprodUp_max(gw1,s1,t3):2
 s11:  S1 :: mu_gprodDn_max(gw1,s1,t3):1 SOS1_gprodDn_max(gw1,s1,t3):2
 s12:  S1 :: mu_gprodUp_max(gw1,s2,t1):1 SOS1_gprodUp_max(gw1,s2,t1):2
 s13:  S1 :: mu_gprodDn_max(gw1,s2,t1):1 SOS1_gprodDn_max(gw1,s2,t1):2
 s14:  S1 :: mu_gprodUp_max(gw1,s2,t2):1 SOS1_gprodUp_max(gw1,s2,t2):2
 s15:  S1 :: mu_gprodDn_max(gw1,s2,t2):1 SOS1_gprodDn_max(gw1,s2,t2):2
 s16:  S1 :: mu_gprodUp_max(gw1,s2,t3):1 SOS1_gprodUp_max(gw1,s2,t3):2
 s17:  S1 :: mu_gprodDn_max(gw1,s2,t3):1 SOS1_gprodDn_max(gw1,s2,t3):2
 s18:  S1 :: mu_gprodUp_max(gw2,s1,t1):1 SOS1_gprodUp_max(gw2,s1,t1):2
 s19:  S1 :: mu_gprodDn_max(gw2,s1,t1):1 SOS1_gprodDn_max(gw2,s1,t1):2
 s20:  S1 :: mu_gprodUp_max(gw2,s1,t2):1 SOS1_gprodUp_max(gw2,s1,t2):2
 s21:  S1 :: mu_gprodDn_max(gw2,s1,t2):1 SOS1_gprodDn_max(gw2,s1,t2):2
 s22:  S1 :: mu_gprodUp_max(gw2,s1,t3):1 SOS1_gprodUp_max(gw2,s1,t3):2
 s23:  S1 :: mu_gprodDn_max(gw2,s1,t3):1 SOS1_gprodDn_max(gw2,s1,t3):2
 s24:  S1 :: mu_gprodUp_max(gw2,s2,t1):1 SOS1_gprodUp_max(gw2,s2,t1):2
 s25:  S1 :: mu_gprodDn_max(gw2,s2,t1):1 SOS1_gprodDn_max(gw2,s2,t1):2
 s26:  S1 :: mu_gprodUp_max(gw2,s2,t2):1 SOS1_gprodUp_max(gw2,s2,t2):2
 s27:  S1 :: mu_gprodDn_max(gw2,s2,t2):1 SOS1_gprodDn_max(gw2,s2,t2):2
 s28:  S1 :: mu_gprodUp_max(gw2,s2,t3):1 SOS1_gprodUp_max(gw2,s2,t3):2
 s29:  S1 :: mu_gprodDn_max(gw2,s2,t3):1 SOS1_gprodDn_max(gw2,s2,t3):2
 s30:  S1 :: mu_gprodUp_max(gw3,s1,t1):1 SOS1_gprodUp_max(gw3,s1,t1):2
 s31:  S1 :: mu_gprodDn_max(gw3,s1,t1):1 SOS1_gprodDn_max(gw3,s1,t1):2
 s32:  S1 :: mu_gprodUp_max(gw3,s1,t2):1 SOS1_gprodUp_max(gw3,s1,t2):2
 s33:  S1 :: mu_gprodDn_max(gw3,s1,t2):1 SOS1_gprodDn_max(gw3,s1,t2):2
 s34:  S1 :: mu_gprodUp_max(gw3,s1,t3):1 SOS1_gprodUp_max(gw3,s1,t3):2
 s35:  S1 :: mu_gprodDn_max(gw3,s1,t3):1 SOS1_gprodDn_max(gw3,s1,t3):2
 s36:  S1 :: mu_gprodUp_max(gw3,s2,t1):1 SOS1_gprodUp_max(gw3,s2,t1):2
 s37:  S1 :: mu_gprodDn_max(gw3,s2,t1):1 SOS1_gprodDn_max(gw3,s2,t1):2
 s38:  S1 :: mu_gprodUp_max(gw3,s2,t2):1 SOS1_gprodUp_max(gw3,s2,t2):2
 s39:  S1 :: mu_gprodDn_max(gw3,s2,t2):1 SOS1_gprodDn_max(gw3,s2,t2):2
 s40:  S1 :: mu_gprodUp_max(gw3,s2,t3):1 SOS1_gprodUp_max(gw3,s2,t3):2
 s41:  S1 :: mu_gprodDn_max(gw3,s2,t3):1 SOS1_gprodDn_max(gw3,s2,t3):2
 s42:  S1 :: mu_gas_shed_rt(ng101,s1,t1):1 SOS1_gas_shed_rt(ng101,s1,t1):2
 s43:  S1 :: mu_gas_shed_rt(ng101,s1,t2):1 SOS1_gas_shed_rt(ng101,s1,t2):2
 s44:  S1 :: mu_gas_shed_rt(ng101,s1,t3):1 SOS1_gas_shed_rt(ng101,s1,t3):2
 s45:  S1 :: mu_gas_shed_rt(ng102,s1,t1):1 SOS1_gas_shed_rt(ng102,s1,t1):2
 s46:  S1 :: mu_gas_shed_rt(ng102,s1,t2):1 SOS1_gas_shed_rt(ng102,s1,t2):2
 s47:  S1 :: mu_gas_shed_rt(ng102,s1,t3):1 SOS1_gas_shed_rt(ng102,s1,t3):2
 s48:  S1 :: mu_gas_shed_rt(ng101,s2,t1):1 SOS1_gas_shed_rt(ng101,s2,t1):2
 s49:  S1 :: mu_gas_shed_rt(ng101,s2,t2):1 SOS1_gas_shed_rt(ng101,s2,t2):2
 s50:  S1 :: mu_gas_shed_rt(ng101,s2,t3):1 SOS1_gas_shed_rt(ng101,s2,t3):2
 s51:  S1 :: mu_gas_shed_rt(ng102,s2,t1):1 SOS1_gas_shed_rt(ng102,s2,t1):2
 s52:  S1 :: mu_gas_shed_rt(ng102,s2,t2):1 SOS1_gas_shed_rt(ng102,s2,t2):2
 s53:  S1 :: mu_gas_shed_rt(ng102,s2,t3):1 SOS1_gas_shed_rt(ng102,s2,t3):2
 s54:  S1 :: muLB_gshed(ng101,s1,t1):1 SOS1_LB_gshed(ng101,s1,t1):2
 s55:  S1 :: muLB_gshed(ng102,s1,t1):1 SOS1_LB_gshed(ng102,s1,t1):2
 s56:  S1 :: muLB_gflow_sr_rt(('ng101','ng102'),s1,t1):1
     SOS1_LB_gflow_sr_rt(('ng101','ng102'),s1,t1):2
 s57:  S1 :: muLB_qin_sr_rt(('ng101','ng102'),s1,t1):1
     SOS1_LB_qin_sr_rt(('ng101','ng102'),s1,t1):2
 s58:  S1 :: muLB_qout_sr_rt(('ng101','ng102'),s1,t1):1
     SOS1_LB_qout_sr_rt(('ng101','ng102'),s1,t1):2
 s59:  S1 :: muLB_gprodUp(gw1,s1,t1):1 SOS1_LB_gprodUp(gw1,s1,t1):2
 s60:  S1 :: muLB_gprodDn(gw1,s1,t1):1 SOS1_LB_gprodDn(gw1,s1,t1):2
 s61:  S1 :: muLB_gprodUp(gw2,s1,t1):1 SOS1_LB_gprodUp(gw2,s1,t1):2
 s62:  S1 :: muLB_gprodDn(gw2,s1,t1):1 SOS1_LB_gprodDn(gw2,s1,t1):2
 s63:  S1 :: muLB_gprodUp(gw3,s1,t1):1 SOS1_LB_gprodUp(gw3,s1,t1):2
 s64:  S1 :: muLB_gprodDn(gw3,s1,t1):1 SOS1_LB_gprodDn(gw3,s1,t1):2
 s65:  S1 :: muLB_gshed(ng101,s1,t2):1 SOS1_LB_gshed(ng101,s1,t2):2
 s66:  S1 :: muLB_gshed(ng102,s1,t2):1 SOS1_LB_gshed(ng102,s1,t2):2
 s67:  S1 :: muLB_gflow_sr_rt(('ng101','ng102'),s1,t2):1
     SOS1_LB_gflow_sr_rt(('ng101','ng102'),s1,t2):2
 s68:  S1 :: muLB_qin_sr_rt(('ng101','ng102'),s1,t2):1
     SOS1_LB_qin_sr_rt(('ng101','ng102'),s1,t2):2
 s69:  S1 :: muLB_qout_sr_rt(('ng101','ng102'),s1,t2):1
     SOS1_LB_qout_sr_rt(('ng101','ng102'),s1,t2):2
 s70:  S1 :: muLB_gprodUp(gw1,s1,t2):1 SOS1_LB_gprodUp(gw1,s1,t2):2
 s71:  S1 :: muLB_gprodDn(gw1,s1,t2):1 SOS1_LB_gprodDn(gw1,s1,t2):2
 s72:  S1 :: muLB_gprodUp(gw2,s1,t2):1 SOS1_LB_gprodUp(gw2,s1,t2):2
 s73:  S1 :: muLB_gprodDn(gw2,s1,t2):1 SOS1_LB_gprodDn(gw2,s1,t2):2
 s74:  S1 :: muLB_gprodUp(gw3,s1,t2):1 SOS1_LB_gprodUp(gw3,s1,t2):2
 s75:  S1 :: muLB_gprodDn(gw3,s1,t2):1 SOS1_LB_gprodDn(gw3,s1,t2):2
 s76:  S1 :: muLB_gshed(ng101,s1,t3):1 SOS1_LB_gshed(ng101,s1,t3):2
 s77:  S1 :: muLB_gshed(ng102,s1,t3):1 SOS1_LB_gshed(ng102,s1,t3):2
 s78:  S1 :: muLB_gflow_sr_rt(('ng101','ng102'),s1,t3):1
     SOS1_LB_gflow_sr_rt(('ng101','ng102'),s1,t3):2
 s79:  S1 :: muLB_qin_sr_rt(('ng101','ng102'),s1,t3):1
     SOS1_LB_qin_sr_rt(('ng101','ng102'),s1,t3):2
 s80:  S1 :: muLB_qout_sr_rt(('ng101','ng102'),s1,t3):1
     SOS1_LB_qout_sr_rt(('ng101','ng102'),s1,t3):2
 s81:  S1 :: muLB_gprodUp(gw1,s1,t3):1 SOS1_LB_gprodUp(gw1,s1,t3):2
 s82:  S1 :: muLB_gprodDn(gw1,s1,t3):1 SOS1_LB_gprodDn(gw1,s1,t3):2
 s83:  S1 :: muLB_gprodUp(gw2,s1,t3):1 SOS1_LB_gprodUp(gw2,s1,t3):2
 s84:  S1 :: muLB_gprodDn(gw2,s1,t3):1 SOS1_LB_gprodDn(gw2,s1,t3):2
 s85:  S1 :: muLB_gprodUp(gw3,s1,t3):1 SOS1_LB_gprodUp(gw3,s1,t3):2
 s86:  S1 :: muLB_gprodDn(gw3,s1,t3):1 SOS1_LB_gprodDn(gw3,s1,t3):2
 s87:  S1 :: muLB_gshed(ng101,s2,t1):1 SOS1_LB_gshed(ng101,s2,t1):2
 s88:  S1 :: muLB_gshed(ng102,s2,t1):1 SOS1_LB_gshed(ng102,s2,t1):2
 s89:  S1 :: muLB_gflow_sr_rt(('ng101','ng102'),s2,t1):1
     SOS1_LB_gflow_sr_rt(('ng101','ng102'),s2,t1):2
 s90:  S1 :: muLB_qin_sr_rt(('ng101','ng102'),s2,t1):1
     SOS1_LB_qin_sr_rt(('ng101','ng102'),s2,t1):2
 s91:  S1 :: muLB_qout_sr_rt(('ng101','ng102'),s2,t1):1
     SOS1_LB_qout_sr_rt(('ng101','ng102'),s2,t1):2
 s92:  S1 :: muLB_gprodUp(gw1,s2,t1):1 SOS1_LB_gprodUp(gw1,s2,t1):2
 s93:  S1 :: muLB_gprodDn(gw1,s2,t1):1 SOS1_LB_gprodDn(gw1,s2,t1):2
 s94:  S1 :: muLB_gprodUp(gw2,s2,t1):1 SOS1_LB_gprodUp(gw2,s2,t1):2
 s95:  S1 :: muLB_gprodDn(gw2,s2,t1):1 SOS1_LB_gprodDn(gw2,s2,t1):2
 s96:  S1 :: muLB_gprodUp(gw3,s2,t1):1 SOS1_LB_gprodUp(gw3,s2,t1):2
 s97:  S1 :: muLB_gprodDn(gw3,s2,t1):1 SOS1_LB_gprodDn(gw3,s2,t1):2
 s98:  S1 :: muLB_gshed(ng101,s2,t2):1 SOS1_LB_gshed(ng101,s2,t2):2
 s99:  S1 :: muLB_gshed(ng102,s2,t2):1 SOS1_LB_gshed(ng102,s2,t2):2
 s100:  S1 :: muLB_gflow_sr_rt(('ng101','ng102'),s2,t2):1
     SOS1_LB_gflow_sr_rt(('ng101','ng102'),s2,t2):2
 s101:  S1 :: muLB_qin_sr_rt(('ng101','ng102'),s2,t2):1
     SOS1_LB_qin_sr_rt(('ng101','ng102'),s2,t2):2
 s102:  S1 :: muLB_qout_sr_rt(('ng101','ng102'),s2,t2):1
     SOS1_LB_qout_sr_rt(('ng101','ng102'),s2,t2):2
 s103:  S1 :: muLB_gprodUp(gw1,s2,t2):1 SOS1_LB_gprodUp(gw1,s2,t2):2
 s104:  S1 :: muLB_gprodDn(gw1,s2,t2):1 SOS1_LB_gprodDn(gw1,s2,t2):2
 s105:  S1 :: muLB_gprodUp(gw2,s2,t2):1 SOS1_LB_gprodUp(gw2,s2,t2):2
 s106:  S1 :: muLB_gprodDn(gw2,s2,t2):1 SOS1_LB_gprodDn(gw2,s2,t2):2
 s107:  S1 :: muLB_gprodUp(gw3,s2,t2):1 SOS1_LB_gprodUp(gw3,s2,t2):2
 s108:  S1 :: muLB_gprodDn(gw3,s2,t2):1 SOS1_LB_gprodDn(gw3,s2,t2):2
 s109:  S1 :: muLB_gshed(ng101,s2,t3):1 SOS1_LB_gshed(ng101,s2,t3):2
 s110:  S1 :: muLB_gshed(ng102,s2,t3):1 SOS1_LB_gshed(ng102,s2,t3):2
 s111:  S1 :: muLB_gflow_sr_rt(('ng101','ng102'),s2,t3):1
     SOS1_LB_gflow_sr_rt(('ng101','ng102'),s2,t3):2
 s112:  S1 :: muLB_qin_sr_rt(('ng101','ng102'),s2,t3):1
     SOS1_LB_qin_sr_rt(('ng101','ng102'),s2,t3):2
 s113:  S1 :: muLB_qout_sr_rt(('ng101','ng102'),s2,t3):1
     SOS1_LB_qout_sr_rt(('ng101','ng102'),s2,t3):2
 s114:  S1 :: muLB_gprodUp(gw1,s2,t3):1 SOS1_LB_gprodUp(gw1,s2,t3):2
 s115:  S1 :: muLB_gprodDn(gw1,s2,t3):1 SOS1_LB_gprodDn(gw1,s2,t3):2
 s116:  S1 :: muLB_gprodUp(gw2,s2,t3):1 SOS1_LB_gprodUp(gw2,s2,t3):2
 s117:  S1 :: muLB_gprodDn(gw2,s2,t3):1 SOS1_LB_gprodDn(gw2,s2,t3):2
 s118:  S1 :: muLB_gprodUp(gw3,s2,t3):1 SOS1_LB_gprodUp(gw3,s2,t3):2
 s119:  S1 :: muLB_gprodDn(gw3,s2,t3):1 SOS1_LB_gprodDn(gw3,s2,t3):2
End
