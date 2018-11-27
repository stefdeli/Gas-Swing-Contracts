\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  500 gshed(ng101,s1,t1) + 500 gshed(ng102,s1,t1) + 1.03 gprodUp(gw1,s1,t1)
   - 0.98 gprodDn(gw1,s1,t1) + 1.545 gprodUp(gw2,s1,t1)
   - 1.47 gprodDn(gw2,s1,t1) + 2.06 gprodUp(gw3,s1,t1)
   - 1.96 gprodDn(gw3,s1,t1) + 500 gshed(ng101,s2,t1)
   + 500 gshed(ng102,s2,t1) + 1.03 gprodUp(gw1,s2,t1)
   - 0.98 gprodDn(gw1,s2,t1) + 1.545 gprodUp(gw2,s2,t1)
   - 1.47 gprodDn(gw2,s2,t1) + 2.06 gprodUp(gw3,s2,t1)
   - 1.96 gprodDn(gw3,s2,t1)
Subject To
 gas_balance_rt(ng101,s1,t1): gshed(ng101,s1,t1)
   - qin_sr_rt(('ng101','ng102'),s1,t1) + gprodUp(gw1,s1,t1)
   - gprodDn(gw1,s1,t1) + gprodUp(gw2,s1,t1) - gprodDn(gw2,s1,t1)
   + gprodUp(gw3,s1,t1) - gprodDn(gw3,s1,t1) = -400
 gas_balance_rt(ng102,s1,t1): gshed(ng102,s1,t1)
   + qout_sr_rt(('ng101','ng102'),s1,t1) = 280
 gas_balance_rt(ng101,s2,t1): gshed(ng101,s2,t1)
   - qin_sr_rt(('ng101','ng102'),s2,t1) + gprodUp(gw1,s2,t1)
   - gprodDn(gw1,s2,t1) + gprodUp(gw2,s2,t1) - gprodDn(gw2,s2,t1)
   + gprodUp(gw3,s2,t1) - gprodDn(gw3,s2,t1) = -400
 gas_balance_rt(ng102,s2,t1): gshed(ng102,s2,t1)
   + qout_sr_rt(('ng101','ng102'),s2,t1) = 280
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
 gprodUp_max(gw1,s1,t1): gprodUp(gw1,s1,t1) <= 0
 gprodDn_max(gw1,s1,t1): gprodDn(gw1,s1,t1) <= 240
 gprodUp_max(gw1,s2,t1): gprodUp(gw1,s2,t1) <= 0
 gprodDn_max(gw1,s2,t1): gprodDn(gw1,s2,t1) <= 240
 gprodUp_max(gw2,s1,t1): gprodUp(gw2,s1,t1) <= 0
 gprodDn_max(gw2,s1,t1): gprodDn(gw2,s1,t1) <= 144
 gprodUp_max(gw2,s2,t1): gprodUp(gw2,s2,t1) <= 0
 gprodDn_max(gw2,s2,t1): gprodDn(gw2,s2,t1) <= 144
 gprodUp_max(gw3,s1,t1): gprodUp(gw3,s1,t1) <= 2984
 gprodDn_max(gw3,s1,t1): gprodDn(gw3,s1,t1) <= 16
 gprodUp_max(gw3,s2,t1): gprodUp(gw3,s2,t1) <= 2984
 gprodDn_max(gw3,s2,t1): gprodDn(gw3,s2,t1) <= 16
 line_store_rt(('ng101','ng102'),s1,t1):
   - qin_sr_rt(('ng101','ng102'),s1,t1)
   + qout_sr_rt(('ng101','ng102'),s1,t1) = 0
 line_store_rt(('ng101','ng102'),s2,t1):
   - qin_sr_rt(('ng101','ng102'),s2,t1)
   + qout_sr_rt(('ng101','ng102'),s2,t1) = 0
 gas_shed_rt(ng101,s1,t1): gshed(ng101,s1,t1) <= 0
 gas_shed_rt(ng102,s1,t1): gshed(ng102,s1,t1) <= 0
 gas_shed_rt(ng101,s2,t1): gshed(ng101,s2,t1) <= 0
 gas_shed_rt(ng102,s2,t1): gshed(ng102,s2,t1) <= 0
 SOS1_gflow_sr_limit_rt(('ng101','ng102'),s1,t1):
   gflow_sr_rt(('ng101','ng102'),s1,t1)
   + SOS1_gflow_sr_limit_rt(('ng101','ng102'),s1,t1) = 10000
 SOS1_gflow_sr_limit_rt(('ng101','ng102'),s2,t1):
   gflow_sr_rt(('ng101','ng102'),s2,t1)
   + SOS1_gflow_sr_limit_rt(('ng101','ng102'),s2,t1) = 10000
 SOS1_gprodUp_max(gw1,s1,t1): gprodUp(gw1,s1,t1)
   + SOS1_gprodUp_max(gw1,s1,t1) = 0
 SOS1_gprodDn_max(gw1,s1,t1): gprodDn(gw1,s1,t1)
   + SOS1_gprodDn_max(gw1,s1,t1) = 240
 SOS1_gprodUp_max(gw1,s2,t1): gprodUp(gw1,s2,t1)
   + SOS1_gprodUp_max(gw1,s2,t1) = 0
 SOS1_gprodDn_max(gw1,s2,t1): gprodDn(gw1,s2,t1)
   + SOS1_gprodDn_max(gw1,s2,t1) = 240
 SOS1_gprodUp_max(gw2,s1,t1): gprodUp(gw2,s1,t1)
   + SOS1_gprodUp_max(gw2,s1,t1) = 0
 SOS1_gprodDn_max(gw2,s1,t1): gprodDn(gw2,s1,t1)
   + SOS1_gprodDn_max(gw2,s1,t1) = 144
 SOS1_gprodUp_max(gw2,s2,t1): gprodUp(gw2,s2,t1)
   + SOS1_gprodUp_max(gw2,s2,t1) = 0
 SOS1_gprodDn_max(gw2,s2,t1): gprodDn(gw2,s2,t1)
   + SOS1_gprodDn_max(gw2,s2,t1) = 144
 SOS1_gprodUp_max(gw3,s1,t1): gprodUp(gw3,s1,t1)
   + SOS1_gprodUp_max(gw3,s1,t1) = 2984
 SOS1_gprodDn_max(gw3,s1,t1): gprodDn(gw3,s1,t1)
   + SOS1_gprodDn_max(gw3,s1,t1) = 16
 SOS1_gprodUp_max(gw3,s2,t1): gprodUp(gw3,s2,t1)
   + SOS1_gprodUp_max(gw3,s2,t1) = 2984
 SOS1_gprodDn_max(gw3,s2,t1): gprodDn(gw3,s2,t1)
   + SOS1_gprodDn_max(gw3,s2,t1) = 16
 SOS1_gas_shed_rt(ng101,s1,t1): gshed(ng101,s1,t1)
   + SOS1_gas_shed_rt(ng101,s1,t1) = 0
 SOS1_gas_shed_rt(ng102,s1,t1): gshed(ng102,s1,t1)
   + SOS1_gas_shed_rt(ng102,s1,t1) = 0
 SOS1_gas_shed_rt(ng101,s2,t1): gshed(ng101,s2,t1)
   + SOS1_gas_shed_rt(ng101,s2,t1) = 0
 SOS1_gas_shed_rt(ng102,s2,t1): gshed(ng102,s2,t1)
   + SOS1_gas_shed_rt(ng102,s2,t1) = 0
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
Bounds
 lambda_gas_balance_rt(ng101,s1,t1) free
 lambda_gas_balance_rt(ng102,s1,t1) free
 lambda_gas_balance_rt(ng101,s2,t1) free
 lambda_gas_balance_rt(ng102,s2,t1) free
 lambda_gflow_sr_io_rt(('ng101','ng102'),s1,t1) free
 lambda_gflow_sr_io_rt(('ng101','ng102'),s2,t1) free
 lambda_line_store_rt(('ng101','ng102'),s1,t1) free
 lambda_line_store_rt(('ng101','ng102'),s2,t1) free
SOS
 s0:  S1 :: mu_gflow_sr_limit_rt(('ng101','ng102'),s1,t1):1
     SOS1_gflow_sr_limit_rt(('ng101','ng102'),s1,t1):2
 s1:  S1 :: mu_gflow_sr_limit_rt(('ng101','ng102'),s2,t1):1
     SOS1_gflow_sr_limit_rt(('ng101','ng102'),s2,t1):2
 s2:  S1 :: mu_gprodUp_max(gw1,s1,t1):1 SOS1_gprodUp_max(gw1,s1,t1):2
 s3:  S1 :: mu_gprodDn_max(gw1,s1,t1):1 SOS1_gprodDn_max(gw1,s1,t1):2
 s4:  S1 :: mu_gprodUp_max(gw1,s2,t1):1 SOS1_gprodUp_max(gw1,s2,t1):2
 s5:  S1 :: mu_gprodDn_max(gw1,s2,t1):1 SOS1_gprodDn_max(gw1,s2,t1):2
 s6:  S1 :: mu_gprodUp_max(gw2,s1,t1):1 SOS1_gprodUp_max(gw2,s1,t1):2
 s7:  S1 :: mu_gprodDn_max(gw2,s1,t1):1 SOS1_gprodDn_max(gw2,s1,t1):2
 s8:  S1 :: mu_gprodUp_max(gw2,s2,t1):1 SOS1_gprodUp_max(gw2,s2,t1):2
 s9:  S1 :: mu_gprodDn_max(gw2,s2,t1):1 SOS1_gprodDn_max(gw2,s2,t1):2
 s10:  S1 :: mu_gprodUp_max(gw3,s1,t1):1 SOS1_gprodUp_max(gw3,s1,t1):2
 s11:  S1 :: mu_gprodDn_max(gw3,s1,t1):1 SOS1_gprodDn_max(gw3,s1,t1):2
 s12:  S1 :: mu_gprodUp_max(gw3,s2,t1):1 SOS1_gprodUp_max(gw3,s2,t1):2
 s13:  S1 :: mu_gprodDn_max(gw3,s2,t1):1 SOS1_gprodDn_max(gw3,s2,t1):2
 s14:  S1 :: mu_gas_shed_rt(ng101,s1,t1):1 SOS1_gas_shed_rt(ng101,s1,t1):2
 s15:  S1 :: mu_gas_shed_rt(ng102,s1,t1):1 SOS1_gas_shed_rt(ng102,s1,t1):2
 s16:  S1 :: mu_gas_shed_rt(ng101,s2,t1):1 SOS1_gas_shed_rt(ng101,s2,t1):2
 s17:  S1 :: mu_gas_shed_rt(ng102,s2,t1):1 SOS1_gas_shed_rt(ng102,s2,t1):2
 s18:  S1 :: muLB_gshed(ng101,s1,t1):1 SOS1_LB_gshed(ng101,s1,t1):2
 s19:  S1 :: muLB_gshed(ng102,s1,t1):1 SOS1_LB_gshed(ng102,s1,t1):2
 s20:  S1 :: muLB_gflow_sr_rt(('ng101','ng102'),s1,t1):1
     SOS1_LB_gflow_sr_rt(('ng101','ng102'),s1,t1):2
 s21:  S1 :: muLB_qin_sr_rt(('ng101','ng102'),s1,t1):1
     SOS1_LB_qin_sr_rt(('ng101','ng102'),s1,t1):2
 s22:  S1 :: muLB_qout_sr_rt(('ng101','ng102'),s1,t1):1
     SOS1_LB_qout_sr_rt(('ng101','ng102'),s1,t1):2
 s23:  S1 :: muLB_gprodUp(gw1,s1,t1):1 SOS1_LB_gprodUp(gw1,s1,t1):2
 s24:  S1 :: muLB_gprodDn(gw1,s1,t1):1 SOS1_LB_gprodDn(gw1,s1,t1):2
 s25:  S1 :: muLB_gprodUp(gw2,s1,t1):1 SOS1_LB_gprodUp(gw2,s1,t1):2
 s26:  S1 :: muLB_gprodDn(gw2,s1,t1):1 SOS1_LB_gprodDn(gw2,s1,t1):2
 s27:  S1 :: muLB_gprodUp(gw3,s1,t1):1 SOS1_LB_gprodUp(gw3,s1,t1):2
 s28:  S1 :: muLB_gprodDn(gw3,s1,t1):1 SOS1_LB_gprodDn(gw3,s1,t1):2
 s29:  S1 :: muLB_gshed(ng101,s2,t1):1 SOS1_LB_gshed(ng101,s2,t1):2
 s30:  S1 :: muLB_gshed(ng102,s2,t1):1 SOS1_LB_gshed(ng102,s2,t1):2
 s31:  S1 :: muLB_gflow_sr_rt(('ng101','ng102'),s2,t1):1
     SOS1_LB_gflow_sr_rt(('ng101','ng102'),s2,t1):2
 s32:  S1 :: muLB_qin_sr_rt(('ng101','ng102'),s2,t1):1
     SOS1_LB_qin_sr_rt(('ng101','ng102'),s2,t1):2
 s33:  S1 :: muLB_qout_sr_rt(('ng101','ng102'),s2,t1):1
     SOS1_LB_qout_sr_rt(('ng101','ng102'),s2,t1):2
 s34:  S1 :: muLB_gprodUp(gw1,s2,t1):1 SOS1_LB_gprodUp(gw1,s2,t1):2
 s35:  S1 :: muLB_gprodDn(gw1,s2,t1):1 SOS1_LB_gprodDn(gw1,s2,t1):2
 s36:  S1 :: muLB_gprodUp(gw2,s2,t1):1 SOS1_LB_gprodUp(gw2,s2,t1):2
 s37:  S1 :: muLB_gprodDn(gw2,s2,t1):1 SOS1_LB_gprodDn(gw2,s2,t1):2
 s38:  S1 :: muLB_gprodUp(gw3,s2,t1):1 SOS1_LB_gprodUp(gw3,s2,t1):2
 s39:  S1 :: muLB_gprodDn(gw3,s2,t1):1 SOS1_LB_gprodDn(gw3,s2,t1):2
End
