\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  1000 gshed_da(ng101,k0,t1) + 1000 gshed_da(ng101,k1,t1)
   + 1000 gshed_da(ng101,k2,t1) + 1000 gshed_da(ng102,k0,t1)
   + 1000 gshed_da(ng102,k1,t1) + 1000 gshed_da(ng102,k2,t1)
   + 2 gprod(gw1,k0,t1) + 3 gprod(gw2,k0,t1) + 4 gprod(gw3,k0,t1)
Subject To
 gshed_da_max(ng101,k0,t1): gshed_da(ng101,k0,t1) <= 0
 gshed_da_max(ng101,k1,t1): gshed_da(ng101,k1,t1) <= 0
 gshed_da_max(ng101,k2,t1): gshed_da(ng101,k2,t1) <= 0
 gshed_da_max(ng102,k0,t1): gshed_da(ng102,k0,t1) <= 0
 gshed_da_max(ng102,k1,t1): gshed_da(ng102,k1,t1) <= 0
 gshed_da_max(ng102,k2,t1): gshed_da(ng102,k2,t1) <= 0
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
 gprod_max(gw1,k0,t1): gprod(gw1,k0,t1) <= 240
 gprod_max(gw1,k1,t1): gprod(gw1,k1,t1) <= 240
 gprod_max(gw1,k2,t1): gprod(gw1,k2,t1) <= 240
 gprod_max(gw2,k0,t1): gprod(gw2,k0,t1) <= 144
 gprod_max(gw2,k1,t1): gprod(gw2,k1,t1) <= 144
 gprod_max(gw2,k2,t1): gprod(gw2,k2,t1) <= 144
 gprod_max(gw3,k0,t1): gprod(gw3,k0,t1) <= 3000
 gprod_max(gw3,k1,t1): gprod(gw3,k1,t1) <= 3000
 gprod_max(gw3,k2,t1): gprod(gw3,k2,t1) <= 3000
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
 SOS1_gshed_da_max(ng101,k0,t1): gshed_da(ng101,k0,t1)
   + SOS1_gshed_da_max(ng101,k0,t1) = 0
 SOS1_gshed_da_max(ng101,k1,t1): gshed_da(ng101,k1,t1)
   + SOS1_gshed_da_max(ng101,k1,t1) = 0
 SOS1_gshed_da_max(ng101,k2,t1): gshed_da(ng101,k2,t1)
   + SOS1_gshed_da_max(ng101,k2,t1) = 0
 SOS1_gshed_da_max(ng102,k0,t1): gshed_da(ng102,k0,t1)
   + SOS1_gshed_da_max(ng102,k0,t1) = 0
 SOS1_gshed_da_max(ng102,k1,t1): gshed_da(ng102,k1,t1)
   + SOS1_gshed_da_max(ng102,k1,t1) = 0
 SOS1_gshed_da_max(ng102,k2,t1): gshed_da(ng102,k2,t1)
   + SOS1_gshed_da_max(ng102,k2,t1) = 0
 SOS1_gprod_max(gw1,k0,t1): gprod(gw1,k0,t1) + SOS1_gprod_max(gw1,k0,t1)
   = 240
 SOS1_gprod_max(gw1,k1,t1): gprod(gw1,k1,t1) + SOS1_gprod_max(gw1,k1,t1)
   = 240
 SOS1_gprod_max(gw1,k2,t1): gprod(gw1,k2,t1) + SOS1_gprod_max(gw1,k2,t1)
   = 240
 SOS1_gprod_max(gw2,k0,t1): gprod(gw2,k0,t1) + SOS1_gprod_max(gw2,k0,t1)
   = 144
 SOS1_gprod_max(gw2,k1,t1): gprod(gw2,k1,t1) + SOS1_gprod_max(gw2,k1,t1)
   = 144
 SOS1_gprod_max(gw2,k2,t1): gprod(gw2,k2,t1) + SOS1_gprod_max(gw2,k2,t1)
   = 144
 SOS1_gprod_max(gw3,k0,t1): gprod(gw3,k0,t1) + SOS1_gprod_max(gw3,k0,t1)
   = 3000
 SOS1_gprod_max(gw3,k1,t1): gprod(gw3,k1,t1) + SOS1_gprod_max(gw3,k1,t1)
   = 3000
 SOS1_gprod_max(gw3,k2,t1): gprod(gw3,k2,t1) + SOS1_gprod_max(gw3,k2,t1)
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
 SOS1_LB_gshed_da(ng101,k0,t1): - gshed_da(ng101,k0,t1)
   + SOS1_LB_gshed_da(ng101,k0,t1) = 0
 SOS1_LB_gshed_da(ng101,k1,t1): - gshed_da(ng101,k1,t1)
   + SOS1_LB_gshed_da(ng101,k1,t1) = 0
 SOS1_LB_gshed_da(ng101,k2,t1): - gshed_da(ng101,k2,t1)
   + SOS1_LB_gshed_da(ng101,k2,t1) = 0
 SOS1_LB_gshed_da(ng102,k0,t1): - gshed_da(ng102,k0,t1)
   + SOS1_LB_gshed_da(ng102,k0,t1) = 0
 SOS1_LB_gshed_da(ng102,k1,t1): - gshed_da(ng102,k1,t1)
   + SOS1_LB_gshed_da(ng102,k1,t1) = 0
 SOS1_LB_gshed_da(ng102,k2,t1): - gshed_da(ng102,k2,t1)
   + SOS1_LB_gshed_da(ng102,k2,t1) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k0,t1):
   - gflow_sr(('ng101','ng102'),k0,t1)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k0,t1) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k1,t1):
   - gflow_sr(('ng101','ng102'),k1,t1)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k1,t1) = 0
 SOS1_LB_gflow_sr(('ng101','ng102'),k2,t1):
   - gflow_sr(('ng101','ng102'),k2,t1)
   + SOS1_LB_gflow_sr(('ng101','ng102'),k2,t1) = 0
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
 SOS1_LB_gprod(gw1,k0,t1): - gprod(gw1,k0,t1) + SOS1_LB_gprod(gw1,k0,t1)
   = 0
 SOS1_LB_gprod(gw1,k1,t1): - gprod(gw1,k1,t1) + SOS1_LB_gprod(gw1,k1,t1)
   = 0
 SOS1_LB_gprod(gw1,k2,t1): - gprod(gw1,k2,t1) + SOS1_LB_gprod(gw1,k2,t1)
   = 0
 SOS1_LB_gprod(gw2,k0,t1): - gprod(gw2,k0,t1) + SOS1_LB_gprod(gw2,k0,t1)
   = 0
 SOS1_LB_gprod(gw2,k1,t1): - gprod(gw2,k1,t1) + SOS1_LB_gprod(gw2,k1,t1)
   = 0
 SOS1_LB_gprod(gw2,k2,t1): - gprod(gw2,k2,t1) + SOS1_LB_gprod(gw2,k2,t1)
   = 0
 SOS1_LB_gprod(gw3,k0,t1): - gprod(gw3,k0,t1) + SOS1_LB_gprod(gw3,k0,t1)
   = 0
 SOS1_LB_gprod(gw3,k1,t1): - gprod(gw3,k1,t1) + SOS1_LB_gprod(gw3,k1,t1)
   = 0
 SOS1_LB_gprod(gw3,k2,t1): - gprod(gw3,k2,t1) + SOS1_LB_gprod(gw3,k2,t1)
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
 dLag/gshed_da(ng102,k0,t1): mu_gshed_da_max(ng102,k0,t1)
   - lambda_gas_balance_da(ng102,k0,t1) - muLB_gshed_da(ng102,k0,t1)
   = -1000
 dLag/gshed_da(ng102,k1,t1): mu_gshed_da_max(ng102,k1,t1)
   - lambda_gas_balance_da(ng102,k1,t1) - muLB_gshed_da(ng102,k1,t1)
   = -1000
 dLag/gshed_da(ng102,k2,t1): mu_gshed_da_max(ng102,k2,t1)
   - lambda_gas_balance_da(ng102,k2,t1) - muLB_gshed_da(ng102,k2,t1)
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
 dLag/gprod(gw1,k0,t1): - lambda_gas_balance_da(ng101,k0,t1)
   + mu_gprod_max(gw1,k0,t1) - muLB_gprod(gw1,k0,t1) = -2
 dLag/gprod(gw1,k1,t1): - lambda_gas_balance_da(ng101,k1,t1)
   + mu_gprod_max(gw1,k1,t1) - muLB_gprod(gw1,k1,t1) = 0
 dLag/gprod(gw1,k2,t1): - lambda_gas_balance_da(ng101,k2,t1)
   + mu_gprod_max(gw1,k2,t1) - muLB_gprod(gw1,k2,t1) = 0
 dLag/gprod(gw2,k0,t1): - lambda_gas_balance_da(ng101,k0,t1)
   + mu_gprod_max(gw2,k0,t1) - muLB_gprod(gw2,k0,t1) = -3
 dLag/gprod(gw2,k1,t1): - lambda_gas_balance_da(ng101,k1,t1)
   + mu_gprod_max(gw2,k1,t1) - muLB_gprod(gw2,k1,t1) = 0
 dLag/gprod(gw2,k2,t1): - lambda_gas_balance_da(ng101,k2,t1)
   + mu_gprod_max(gw2,k2,t1) - muLB_gprod(gw2,k2,t1) = 0
 dLag/gprod(gw3,k0,t1): - lambda_gas_balance_da(ng101,k0,t1)
   + mu_gprod_max(gw3,k0,t1) - muLB_gprod(gw3,k0,t1) = -4
 dLag/gprod(gw3,k1,t1): - lambda_gas_balance_da(ng101,k1,t1)
   + mu_gprod_max(gw3,k1,t1) - muLB_gprod(gw3,k1,t1) = 0
 dLag/gprod(gw3,k2,t1): - lambda_gas_balance_da(ng101,k2,t1)
   + mu_gprod_max(gw3,k2,t1) - muLB_gprod(gw3,k2,t1) = 0
Bounds
 lambda_gas_balance_da(ng101,k0,t1) free
 lambda_gas_balance_da(ng101,k1,t1) free
 lambda_gas_balance_da(ng101,k2,t1) free
 lambda_gas_balance_da(ng102,k0,t1) free
 lambda_gas_balance_da(ng102,k1,t1) free
 lambda_gas_balance_da(ng102,k2,t1) free
 lambda_gflow_sr_io(('ng101','ng102'),k0,t1) free
 lambda_Flow_Bal(('ng101','ng102'),k0,t1) free
 lambda_gflow_sr_io(('ng101','ng102'),k1,t1) free
 lambda_Flow_Bal(('ng101','ng102'),k1,t1) free
 lambda_gflow_sr_io(('ng101','ng102'),k2,t1) free
 lambda_Flow_Bal(('ng101','ng102'),k2,t1) free
SOS
 s0:  S1 :: mu_gshed_da_max(ng101,k0,t1):1 SOS1_gshed_da_max(ng101,k0,t1):2
 s1:  S1 :: mu_gshed_da_max(ng101,k1,t1):1 SOS1_gshed_da_max(ng101,k1,t1):2
 s2:  S1 :: mu_gshed_da_max(ng101,k2,t1):1 SOS1_gshed_da_max(ng101,k2,t1):2
 s3:  S1 :: mu_gshed_da_max(ng102,k0,t1):1 SOS1_gshed_da_max(ng102,k0,t1):2
 s4:  S1 :: mu_gshed_da_max(ng102,k1,t1):1 SOS1_gshed_da_max(ng102,k1,t1):2
 s5:  S1 :: mu_gshed_da_max(ng102,k2,t1):1 SOS1_gshed_da_max(ng102,k2,t1):2
 s6:  S1 :: mu_gprod_max(gw1,k0,t1):1 SOS1_gprod_max(gw1,k0,t1):2
 s7:  S1 :: mu_gprod_max(gw1,k1,t1):1 SOS1_gprod_max(gw1,k1,t1):2
 s8:  S1 :: mu_gprod_max(gw1,k2,t1):1 SOS1_gprod_max(gw1,k2,t1):2
 s9:  S1 :: mu_gprod_max(gw2,k0,t1):1 SOS1_gprod_max(gw2,k0,t1):2
 s10:  S1 :: mu_gprod_max(gw2,k1,t1):1 SOS1_gprod_max(gw2,k1,t1):2
 s11:  S1 :: mu_gprod_max(gw2,k2,t1):1 SOS1_gprod_max(gw2,k2,t1):2
 s12:  S1 :: mu_gprod_max(gw3,k0,t1):1 SOS1_gprod_max(gw3,k0,t1):2
 s13:  S1 :: mu_gprod_max(gw3,k1,t1):1 SOS1_gprod_max(gw3,k1,t1):2
 s14:  S1 :: mu_gprod_max(gw3,k2,t1):1 SOS1_gprod_max(gw3,k2,t1):2
 s15:  S1 :: mu_gflow_sr_limit(('ng101','ng102'),k0,t1):1
     SOS1_gflow_sr_limit(('ng101','ng102'),k0,t1):2
 s16:  S1 :: mu_gflow_sr_limit(('ng101','ng102'),k1,t1):1
     SOS1_gflow_sr_limit(('ng101','ng102'),k1,t1):2
 s17:  S1 :: mu_gflow_sr_limit(('ng101','ng102'),k2,t1):1
     SOS1_gflow_sr_limit(('ng101','ng102'),k2,t1):2
 s18:  S1 :: muLB_gshed_da(ng101,k0,t1):1 SOS1_LB_gshed_da(ng101,k0,t1):2
 s19:  S1 :: muLB_gshed_da(ng101,k1,t1):1 SOS1_LB_gshed_da(ng101,k1,t1):2
 s20:  S1 :: muLB_gshed_da(ng101,k2,t1):1 SOS1_LB_gshed_da(ng101,k2,t1):2
 s21:  S1 :: muLB_gshed_da(ng102,k0,t1):1 SOS1_LB_gshed_da(ng102,k0,t1):2
 s22:  S1 :: muLB_gshed_da(ng102,k1,t1):1 SOS1_LB_gshed_da(ng102,k1,t1):2
 s23:  S1 :: muLB_gshed_da(ng102,k2,t1):1 SOS1_LB_gshed_da(ng102,k2,t1):2
 s24:  S1 :: muLB_gflow_sr(('ng101','ng102'),k0,t1):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k0,t1):2
 s25:  S1 :: muLB_gflow_sr(('ng101','ng102'),k1,t1):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k1,t1):2
 s26:  S1 :: muLB_gflow_sr(('ng101','ng102'),k2,t1):1
     SOS1_LB_gflow_sr(('ng101','ng102'),k2,t1):2
 s27:  S1 :: muLB_qin_sr(('ng101','ng102'),k0,t1):1
     SOS1_LB_qin_sr(('ng101','ng102'),k0,t1):2
 s28:  S1 :: muLB_qout_sr(('ng101','ng102'),k0,t1):1
     SOS1_LB_qout_sr(('ng101','ng102'),k0,t1):2
 s29:  S1 :: muLB_qin_sr(('ng101','ng102'),k1,t1):1
     SOS1_LB_qin_sr(('ng101','ng102'),k1,t1):2
 s30:  S1 :: muLB_qout_sr(('ng101','ng102'),k1,t1):1
     SOS1_LB_qout_sr(('ng101','ng102'),k1,t1):2
 s31:  S1 :: muLB_qin_sr(('ng101','ng102'),k2,t1):1
     SOS1_LB_qin_sr(('ng101','ng102'),k2,t1):2
 s32:  S1 :: muLB_qout_sr(('ng101','ng102'),k2,t1):1
     SOS1_LB_qout_sr(('ng101','ng102'),k2,t1):2
 s33:  S1 :: muLB_gprod(gw1,k0,t1):1 SOS1_LB_gprod(gw1,k0,t1):2
 s34:  S1 :: muLB_gprod(gw1,k1,t1):1 SOS1_LB_gprod(gw1,k1,t1):2
 s35:  S1 :: muLB_gprod(gw1,k2,t1):1 SOS1_LB_gprod(gw1,k2,t1):2
 s36:  S1 :: muLB_gprod(gw2,k0,t1):1 SOS1_LB_gprod(gw2,k0,t1):2
 s37:  S1 :: muLB_gprod(gw2,k1,t1):1 SOS1_LB_gprod(gw2,k1,t1):2
 s38:  S1 :: muLB_gprod(gw2,k2,t1):1 SOS1_LB_gprod(gw2,k2,t1):2
 s39:  S1 :: muLB_gprod(gw3,k0,t1):1 SOS1_LB_gprod(gw3,k0,t1):2
 s40:  S1 :: muLB_gprod(gw3,k1,t1):1 SOS1_LB_gprod(gw3,k1,t1):2
 s41:  S1 :: muLB_gprod(gw3,k2,t1):1 SOS1_LB_gprod(gw3,k2,t1):2
End
