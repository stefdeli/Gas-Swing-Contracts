\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  16 Pgen(g1,t1) + 200 Pgen(g2,t1) + 32 PgenSC(g1,t1) + 8.4 RUp(g1,s1,t1)
   - 8.4 RDn(g1,s1,t1) + 100 RUp(g2,s1,t1) - 100 RDn(g2,s1,t1)
   + 16 RUpSC(g1,s1,t1) - 16 RDnSC(g1,s1,t1) + 500 Lshed(s1,t1)
   + 8.4 RUp(g1,s2,t1) - 8.4 RDn(g1,s2,t1) + 100 RUp(g2,s2,t1)
   - 100 RDn(g2,s2,t1) + 16 RUpSC(g1,s2,t1) - 16 RDnSC(g1,s2,t1)
   + 500 Lshed(s2,t1)
Subject To
 PowerBalance_DA(t1): Pgen(g1,t1) + Pgen(g2,t1) + PgenSC(g1,t1)
   + WindDA(w1,t1) = 50
 Pmax_DA_GFPP(g1,t1): Pgen(g1,t1) + RCup(g1,t1) <= 140
 Pmax_DA_GFPP(g2,t1): Pgen(g2,t1) + RCup(g2,t1) <= 0
 Pmin_DA_GFPP(g1,t1): - Pgen(g1,t1) + RCdn(g1,t1) <= 0
 Pmin_DA(g2,t1): - Pgen(g2,t1) + RCdn(g2,t1) <= 0
 Wind_Max_DA(w1,t1): WindDA(w1,t1) <= 15
 PgenSCmax(g1,t1): PgenSC(g1,t1) <= 10
 PgenSCmin(g1,t1): - PgenSC(g1,t1) <= -10
 RCupSCmax(g1,t1): PgenSC(g1,t1) + RCupSC(g1,t1) <= 10
 RCdnSCmin(g1,t1): - PgenSC(g1,t1) + RCdnSC(g1,t1) <= -10
 PowerBalance_RT(s1,t1): - WindDA(w1,t1) + RUp(g1,s1,t1) - RDn(g1,s1,t1)
   + RUp(g2,s1,t1) - RDn(g2,s1,t1) + RUpSC(g1,s1,t1) - RDnSC(g1,s1,t1)
   - Wspill(w1,s1,t1) + Lshed(s1,t1) = -15
 PowerBalance_RT(s2,t1): - WindDA(w1,t1) + RUp(g1,s2,t1) - RDn(g1,s2,t1)
   + RUp(g2,s2,t1) - RDn(g2,s2,t1) + RUpSC(g1,s2,t1) - RDnSC(g1,s2,t1)
   - Wspill(w1,s2,t1) + Lshed(s2,t1) = -15
 RegUp_max_RT(g1,s1,t1): - RCup(g1,t1) + RUp(g1,s1,t1) <= 0
 RegDown_max_RT(g1,s1,t1): - RCdn(g1,t1) + RDn(g1,s1,t1) <= 0
 RegUp_max_RT(g2,s1,t1): - RCup(g2,t1) + RUp(g2,s1,t1) <= 0
 RegDown_max_RT(g2,s1,t1): - RCdn(g2,t1) + RDn(g2,s1,t1) <= 0
 RegUp_max_RT(g1,s2,t1): - RCup(g1,t1) + RUp(g1,s2,t1) <= 0
 RegDown_max_RT(g1,s2,t1): - RCdn(g1,t1) + RDn(g1,s2,t1) <= 0
 RegUp_max_RT(g2,s2,t1): - RCup(g2,t1) + RUp(g2,s2,t1) <= 0
 RegDown_max_RT(g2,s2,t1): - RCdn(g2,t1) + RDn(g2,s2,t1) <= 0
 RegUpSC_max_RT(g1,s1,t1): - RCupSC(g1,t1) + RUpSC(g1,s1,t1) <= 0
 RegDnSC_max_RT(g1,s1,t1): - RCdnSC(g1,t1) + RDnSC(g1,s1,t1) <= 0
 RegUpSC_max_RT(g1,s2,t1): - RCupSC(g1,t1) + RUpSC(g1,s2,t1) <= 0
 RegDnSC_max_RT(g1,s2,t1): - RCdnSC(g1,t1) + RDnSC(g1,s2,t1) <= 0
 Max_load_shed_RT(s1,t1): Lshed(s1,t1) <= 50
 Max_load_shed_RT(s2,t1): Lshed(s2,t1) <= 50
 Max_wind_spill_RT(w1,s1,t1): Wspill(w1,s1,t1) <= 15
 Max_wind_spill_RT(w1,s2,t1): Wspill(w1,s2,t1) <= 15
 SOS1_Pmax_DA_GFPP(g1,t1): Pgen(g1,t1) + RCup(g1,t1)
   + SOS1_Pmax_DA_GFPP(g1,t1) = 140
 SOS1_Pmax_DA_GFPP(g2,t1): Pgen(g2,t1) + RCup(g2,t1)
   + SOS1_Pmax_DA_GFPP(g2,t1) = 0
 SOS1_Pmin_DA_GFPP(g1,t1): - Pgen(g1,t1) + RCdn(g1,t1)
   + SOS1_Pmin_DA_GFPP(g1,t1) = 0
 SOS1_Pmin_DA(g2,t1): - Pgen(g2,t1) + RCdn(g2,t1) + SOS1_Pmin_DA(g2,t1)
   = 0
 SOS1_Wind_Max_DA(w1,t1): WindDA(w1,t1) + SOS1_Wind_Max_DA(w1,t1) = 15
 SOS1_PgenSCmax(g1,t1): PgenSC(g1,t1) + SOS1_PgenSCmax(g1,t1) = 10
 SOS1_PgenSCmin(g1,t1): - PgenSC(g1,t1) + SOS1_PgenSCmin(g1,t1) = -10
 SOS1_RCupSCmax(g1,t1): PgenSC(g1,t1) + RCupSC(g1,t1)
   + SOS1_RCupSCmax(g1,t1) = 10
 SOS1_RCdnSCmin(g1,t1): - PgenSC(g1,t1) + RCdnSC(g1,t1)
   + SOS1_RCdnSCmin(g1,t1) = -10
 SOS1_RegUp_max_RT(g1,s1,t1): - RCup(g1,t1) + RUp(g1,s1,t1)
   + SOS1_RegUp_max_RT(g1,s1,t1) = 0
 SOS1_RegDown_max_RT(g1,s1,t1): - RCdn(g1,t1) + RDn(g1,s1,t1)
   + SOS1_RegDown_max_RT(g1,s1,t1) = 0
 SOS1_RegUp_max_RT(g2,s1,t1): - RCup(g2,t1) + RUp(g2,s1,t1)
   + SOS1_RegUp_max_RT(g2,s1,t1) = 0
 SOS1_RegDown_max_RT(g2,s1,t1): - RCdn(g2,t1) + RDn(g2,s1,t1)
   + SOS1_RegDown_max_RT(g2,s1,t1) = 0
 SOS1_RegUp_max_RT(g1,s2,t1): - RCup(g1,t1) + RUp(g1,s2,t1)
   + SOS1_RegUp_max_RT(g1,s2,t1) = 0
 SOS1_RegDown_max_RT(g1,s2,t1): - RCdn(g1,t1) + RDn(g1,s2,t1)
   + SOS1_RegDown_max_RT(g1,s2,t1) = 0
 SOS1_RegUp_max_RT(g2,s2,t1): - RCup(g2,t1) + RUp(g2,s2,t1)
   + SOS1_RegUp_max_RT(g2,s2,t1) = 0
 SOS1_RegDown_max_RT(g2,s2,t1): - RCdn(g2,t1) + RDn(g2,s2,t1)
   + SOS1_RegDown_max_RT(g2,s2,t1) = 0
 SOS1_RegUpSC_max_RT(g1,s1,t1): - RCupSC(g1,t1) + RUpSC(g1,s1,t1)
   + SOS1_RegUpSC_max_RT(g1,s1,t1) = 0
 SOS1_RegDnSC_max_RT(g1,s1,t1): - RCdnSC(g1,t1) + RDnSC(g1,s1,t1)
   + SOS1_RegDnSC_max_RT(g1,s1,t1) = 0
 SOS1_RegUpSC_max_RT(g1,s2,t1): - RCupSC(g1,t1) + RUpSC(g1,s2,t1)
   + SOS1_RegUpSC_max_RT(g1,s2,t1) = 0
 SOS1_RegDnSC_max_RT(g1,s2,t1): - RCdnSC(g1,t1) + RDnSC(g1,s2,t1)
   + SOS1_RegDnSC_max_RT(g1,s2,t1) = 0
 SOS1_Max_load_shed_RT(s1,t1): Lshed(s1,t1) + SOS1_Max_load_shed_RT(s1,t1)
   = 50
 SOS1_Max_load_shed_RT(s2,t1): Lshed(s2,t1) + SOS1_Max_load_shed_RT(s2,t1)
   = 50
 SOS1_Max_wind_spill_RT(w1,s1,t1): Wspill(w1,s1,t1)
   + SOS1_Max_wind_spill_RT(w1,s1,t1) = 15
 SOS1_Max_wind_spill_RT(w1,s2,t1): Wspill(w1,s2,t1)
   + SOS1_Max_wind_spill_RT(w1,s2,t1) = 15
 SOS1_LB_Pgen(g1,t1): - Pgen(g1,t1) + SOS1_LB_Pgen(g1,t1) = 0
 SOS1_LB_Pgen(g2,t1): - Pgen(g2,t1) + SOS1_LB_Pgen(g2,t1) = 0
 SOS1_LB_PgenSC(g1,t1): - PgenSC(g1,t1) + SOS1_LB_PgenSC(g1,t1) = 0
 SOS1_LB_RCup(g1,t1): - RCup(g1,t1) + SOS1_LB_RCup(g1,t1) = 0
 SOS1_LB_RCup(g2,t1): - RCup(g2,t1) + SOS1_LB_RCup(g2,t1) = 0
 SOS1_LB_RCdn(g1,t1): - RCdn(g1,t1) + SOS1_LB_RCdn(g1,t1) = 0
 SOS1_LB_RCdn(g2,t1): - RCdn(g2,t1) + SOS1_LB_RCdn(g2,t1) = 0
 SOS1_LB_RCupSC(g1,t1): - RCupSC(g1,t1) + SOS1_LB_RCupSC(g1,t1) = 0
 SOS1_LB_RCdnSC(g1,t1): - RCdnSC(g1,t1) + SOS1_LB_RCdnSC(g1,t1) = 0
 SOS1_LB_WindDA(w1,t1): - WindDA(w1,t1) + SOS1_LB_WindDA(w1,t1) = 0
 SOS1_LB_RUp(g1,s1,t1): - RUp(g1,s1,t1) + SOS1_LB_RUp(g1,s1,t1) = 0
 SOS1_LB_RDn(g1,s1,t1): - RDn(g1,s1,t1) + SOS1_LB_RDn(g1,s1,t1) = 0
 SOS1_LB_RUp(g2,s1,t1): - RUp(g2,s1,t1) + SOS1_LB_RUp(g2,s1,t1) = 0
 SOS1_LB_RDn(g2,s1,t1): - RDn(g2,s1,t1) + SOS1_LB_RDn(g2,s1,t1) = 0
 SOS1_LB_RUpSC(g1,s1,t1): - RUpSC(g1,s1,t1) + SOS1_LB_RUpSC(g1,s1,t1) = 0
 SOS1_LB_RDnSC(g1,s1,t1): - RDnSC(g1,s1,t1) + SOS1_LB_RDnSC(g1,s1,t1) = 0
 SOS1_LB_Wspill(w1,s1,t1): - Wspill(w1,s1,t1) + SOS1_LB_Wspill(w1,s1,t1)
   = 0
 SOS1_LB_Lshed(s1,t1): - Lshed(s1,t1) + SOS1_LB_Lshed(s1,t1) = 0
 SOS1_LB_RUp(g1,s2,t1): - RUp(g1,s2,t1) + SOS1_LB_RUp(g1,s2,t1) = 0
 SOS1_LB_RDn(g1,s2,t1): - RDn(g1,s2,t1) + SOS1_LB_RDn(g1,s2,t1) = 0
 SOS1_LB_RUp(g2,s2,t1): - RUp(g2,s2,t1) + SOS1_LB_RUp(g2,s2,t1) = 0
 SOS1_LB_RDn(g2,s2,t1): - RDn(g2,s2,t1) + SOS1_LB_RDn(g2,s2,t1) = 0
 SOS1_LB_RUpSC(g1,s2,t1): - RUpSC(g1,s2,t1) + SOS1_LB_RUpSC(g1,s2,t1) = 0
 SOS1_LB_RDnSC(g1,s2,t1): - RDnSC(g1,s2,t1) + SOS1_LB_RDnSC(g1,s2,t1) = 0
 SOS1_LB_Wspill(w1,s2,t1): - Wspill(w1,s2,t1) + SOS1_LB_Wspill(w1,s2,t1)
   = 0
 SOS1_LB_Lshed(s2,t1): - Lshed(s2,t1) + SOS1_LB_Lshed(s2,t1) = 0
 dLag/Pgen(g1,t1): - lambda_PowerBalance_DA(t1) + mu_Pmax_DA_GFPP(g1,t1)
   - mu_Pmin_DA_GFPP(g1,t1) - muLB_Pgen(g1,t1) = -16
 dLag/Pgen(g2,t1): - lambda_PowerBalance_DA(t1) + mu_Pmax_DA_GFPP(g2,t1)
   - mu_Pmin_DA(g2,t1) - muLB_Pgen(g2,t1) = -200
 dLag/PgenSC(g1,t1): - lambda_PowerBalance_DA(t1) + mu_PgenSCmax(g1,t1)
   - mu_PgenSCmin(g1,t1) + mu_RCupSCmax(g1,t1) - mu_RCdnSCmin(g1,t1)
   - muLB_PgenSC(g1,t1) = -32
 dLag/RCup(g1,t1): mu_Pmax_DA_GFPP(g1,t1) - mu_RegUp_max_RT(g1,s1,t1)
   - mu_RegUp_max_RT(g1,s2,t1) - muLB_RCup(g1,t1) = 0
 dLag/RCup(g2,t1): mu_Pmax_DA_GFPP(g2,t1) - mu_RegUp_max_RT(g2,s1,t1)
   - mu_RegUp_max_RT(g2,s2,t1) - muLB_RCup(g2,t1) = 0
 dLag/RCdn(g1,t1): mu_Pmin_DA_GFPP(g1,t1) - mu_RegDown_max_RT(g1,s1,t1)
   - mu_RegDown_max_RT(g1,s2,t1) - muLB_RCdn(g1,t1) = 0
 dLag/RCdn(g2,t1): mu_Pmin_DA(g2,t1) - mu_RegDown_max_RT(g2,s1,t1)
   - mu_RegDown_max_RT(g2,s2,t1) - muLB_RCdn(g2,t1) = 0
 dLag/RCupSC(g1,t1): mu_RCupSCmax(g1,t1) - mu_RegUpSC_max_RT(g1,s1,t1)
   - mu_RegUpSC_max_RT(g1,s2,t1) - muLB_RCupSC(g1,t1) = 0
 dLag/RCdnSC(g1,t1): mu_RCdnSCmin(g1,t1) - mu_RegDnSC_max_RT(g1,s1,t1)
   - mu_RegDnSC_max_RT(g1,s2,t1) - muLB_RCdnSC(g1,t1) = 0
 dLag/WindDA(w1,t1): - lambda_PowerBalance_DA(t1) + mu_Wind_Max_DA(w1,t1)
   + lambda_PowerBalance_RT(s1,t1) + lambda_PowerBalance_RT(s2,t1)
   - muLB_WindDA(w1,t1) = 0
 dLag/RUp(g1,s1,t1): - lambda_PowerBalance_RT(s1,t1)
   + mu_RegUp_max_RT(g1,s1,t1) - muLB_RUp(g1,s1,t1) = -8.4
 dLag/RDn(g1,s1,t1): lambda_PowerBalance_RT(s1,t1)
   + mu_RegDown_max_RT(g1,s1,t1) - muLB_RDn(g1,s1,t1) = 8.4
 dLag/RUp(g2,s1,t1): - lambda_PowerBalance_RT(s1,t1)
   + mu_RegUp_max_RT(g2,s1,t1) - muLB_RUp(g2,s1,t1) = -100
 dLag/RDn(g2,s1,t1): lambda_PowerBalance_RT(s1,t1)
   + mu_RegDown_max_RT(g2,s1,t1) - muLB_RDn(g2,s1,t1) = 100
 dLag/RUpSC(g1,s1,t1): - lambda_PowerBalance_RT(s1,t1)
   + mu_RegUpSC_max_RT(g1,s1,t1) - muLB_RUpSC(g1,s1,t1) = -16
 dLag/RDnSC(g1,s1,t1): lambda_PowerBalance_RT(s1,t1)
   + mu_RegDnSC_max_RT(g1,s1,t1) - muLB_RDnSC(g1,s1,t1) = 16
 dLag/Wspill(w1,s1,t1): lambda_PowerBalance_RT(s1,t1)
   + mu_Max_wind_spill_RT(w1,s1,t1) - muLB_Wspill(w1,s1,t1) = 0
 dLag/Lshed(s1,t1): - lambda_PowerBalance_RT(s1,t1)
   + mu_Max_load_shed_RT(s1,t1) - muLB_Lshed(s1,t1) = -500
 dLag/RUp(g1,s2,t1): - lambda_PowerBalance_RT(s2,t1)
   + mu_RegUp_max_RT(g1,s2,t1) - muLB_RUp(g1,s2,t1) = -8.4
 dLag/RDn(g1,s2,t1): lambda_PowerBalance_RT(s2,t1)
   + mu_RegDown_max_RT(g1,s2,t1) - muLB_RDn(g1,s2,t1) = 8.4
 dLag/RUp(g2,s2,t1): - lambda_PowerBalance_RT(s2,t1)
   + mu_RegUp_max_RT(g2,s2,t1) - muLB_RUp(g2,s2,t1) = -100
 dLag/RDn(g2,s2,t1): lambda_PowerBalance_RT(s2,t1)
   + mu_RegDown_max_RT(g2,s2,t1) - muLB_RDn(g2,s2,t1) = 100
 dLag/RUpSC(g1,s2,t1): - lambda_PowerBalance_RT(s2,t1)
   + mu_RegUpSC_max_RT(g1,s2,t1) - muLB_RUpSC(g1,s2,t1) = -16
 dLag/RDnSC(g1,s2,t1): lambda_PowerBalance_RT(s2,t1)
   + mu_RegDnSC_max_RT(g1,s2,t1) - muLB_RDnSC(g1,s2,t1) = 16
 dLag/Wspill(w1,s2,t1): lambda_PowerBalance_RT(s2,t1)
   + mu_Max_wind_spill_RT(w1,s2,t1) - muLB_Wspill(w1,s2,t1) = 0
 dLag/Lshed(s2,t1): - lambda_PowerBalance_RT(s2,t1)
   + mu_Max_load_shed_RT(s2,t1) - muLB_Lshed(s2,t1) = -500
Bounds
 lambda_PowerBalance_DA(t1) free
 lambda_PowerBalance_RT(s1,t1) free
 lambda_PowerBalance_RT(s2,t1) free
SOS
 s0:  S1 :: mu_Pmax_DA_GFPP(g1,t1):1 SOS1_Pmax_DA_GFPP(g1,t1):2
 s1:  S1 :: mu_Pmax_DA_GFPP(g2,t1):1 SOS1_Pmax_DA_GFPP(g2,t1):2
 s2:  S1 :: mu_Pmin_DA_GFPP(g1,t1):1 SOS1_Pmin_DA_GFPP(g1,t1):2
 s3:  S1 :: mu_Pmin_DA(g2,t1):1 SOS1_Pmin_DA(g2,t1):2
 s4:  S1 :: mu_Wind_Max_DA(w1,t1):1 SOS1_Wind_Max_DA(w1,t1):2
 s5:  S1 :: mu_PgenSCmax(g1,t1):1 SOS1_PgenSCmax(g1,t1):2
 s6:  S1 :: mu_PgenSCmin(g1,t1):1 SOS1_PgenSCmin(g1,t1):2
 s7:  S1 :: mu_RCupSCmax(g1,t1):1 SOS1_RCupSCmax(g1,t1):2
 s8:  S1 :: mu_RCdnSCmin(g1,t1):1 SOS1_RCdnSCmin(g1,t1):2
 s9:  S1 :: mu_RegUp_max_RT(g1,s1,t1):1 SOS1_RegUp_max_RT(g1,s1,t1):2
 s10:  S1 :: mu_RegDown_max_RT(g1,s1,t1):1 SOS1_RegDown_max_RT(g1,s1,t1):2
 s11:  S1 :: mu_RegUp_max_RT(g2,s1,t1):1 SOS1_RegUp_max_RT(g2,s1,t1):2
 s12:  S1 :: mu_RegDown_max_RT(g2,s1,t1):1 SOS1_RegDown_max_RT(g2,s1,t1):2
 s13:  S1 :: mu_RegUp_max_RT(g1,s2,t1):1 SOS1_RegUp_max_RT(g1,s2,t1):2
 s14:  S1 :: mu_RegDown_max_RT(g1,s2,t1):1 SOS1_RegDown_max_RT(g1,s2,t1):2
 s15:  S1 :: mu_RegUp_max_RT(g2,s2,t1):1 SOS1_RegUp_max_RT(g2,s2,t1):2
 s16:  S1 :: mu_RegDown_max_RT(g2,s2,t1):1 SOS1_RegDown_max_RT(g2,s2,t1):2
 s17:  S1 :: mu_RegUpSC_max_RT(g1,s1,t1):1 SOS1_RegUpSC_max_RT(g1,s1,t1):2
 s18:  S1 :: mu_RegDnSC_max_RT(g1,s1,t1):1 SOS1_RegDnSC_max_RT(g1,s1,t1):2
 s19:  S1 :: mu_RegUpSC_max_RT(g1,s2,t1):1 SOS1_RegUpSC_max_RT(g1,s2,t1):2
 s20:  S1 :: mu_RegDnSC_max_RT(g1,s2,t1):1 SOS1_RegDnSC_max_RT(g1,s2,t1):2
 s21:  S1 :: mu_Max_load_shed_RT(s1,t1):1 SOS1_Max_load_shed_RT(s1,t1):2
 s22:  S1 :: mu_Max_load_shed_RT(s2,t1):1 SOS1_Max_load_shed_RT(s2,t1):2
 s23:  S1 :: mu_Max_wind_spill_RT(w1,s1,t1):1
     SOS1_Max_wind_spill_RT(w1,s1,t1):2
 s24:  S1 :: mu_Max_wind_spill_RT(w1,s2,t1):1
     SOS1_Max_wind_spill_RT(w1,s2,t1):2
 s25:  S1 :: muLB_Pgen(g1,t1):1 SOS1_LB_Pgen(g1,t1):2
 s26:  S1 :: muLB_Pgen(g2,t1):1 SOS1_LB_Pgen(g2,t1):2
 s27:  S1 :: muLB_PgenSC(g1,t1):1 SOS1_LB_PgenSC(g1,t1):2
 s28:  S1 :: muLB_RCup(g1,t1):1 SOS1_LB_RCup(g1,t1):2
 s29:  S1 :: muLB_RCup(g2,t1):1 SOS1_LB_RCup(g2,t1):2
 s30:  S1 :: muLB_RCdn(g1,t1):1 SOS1_LB_RCdn(g1,t1):2
 s31:  S1 :: muLB_RCdn(g2,t1):1 SOS1_LB_RCdn(g2,t1):2
 s32:  S1 :: muLB_RCupSC(g1,t1):1 SOS1_LB_RCupSC(g1,t1):2
 s33:  S1 :: muLB_RCdnSC(g1,t1):1 SOS1_LB_RCdnSC(g1,t1):2
 s34:  S1 :: muLB_WindDA(w1,t1):1 SOS1_LB_WindDA(w1,t1):2
 s35:  S1 :: muLB_RUp(g1,s1,t1):1 SOS1_LB_RUp(g1,s1,t1):2
 s36:  S1 :: muLB_RDn(g1,s1,t1):1 SOS1_LB_RDn(g1,s1,t1):2
 s37:  S1 :: muLB_RUp(g2,s1,t1):1 SOS1_LB_RUp(g2,s1,t1):2
 s38:  S1 :: muLB_RDn(g2,s1,t1):1 SOS1_LB_RDn(g2,s1,t1):2
 s39:  S1 :: muLB_RUpSC(g1,s1,t1):1 SOS1_LB_RUpSC(g1,s1,t1):2
 s40:  S1 :: muLB_RDnSC(g1,s1,t1):1 SOS1_LB_RDnSC(g1,s1,t1):2
 s41:  S1 :: muLB_Wspill(w1,s1,t1):1 SOS1_LB_Wspill(w1,s1,t1):2
 s42:  S1 :: muLB_Lshed(s1,t1):1 SOS1_LB_Lshed(s1,t1):2
 s43:  S1 :: muLB_RUp(g1,s2,t1):1 SOS1_LB_RUp(g1,s2,t1):2
 s44:  S1 :: muLB_RDn(g1,s2,t1):1 SOS1_LB_RDn(g1,s2,t1):2
 s45:  S1 :: muLB_RUp(g2,s2,t1):1 SOS1_LB_RUp(g2,s2,t1):2
 s46:  S1 :: muLB_RDn(g2,s2,t1):1 SOS1_LB_RDn(g2,s2,t1):2
 s47:  S1 :: muLB_RUpSC(g1,s2,t1):1 SOS1_LB_RUpSC(g1,s2,t1):2
 s48:  S1 :: muLB_RDnSC(g1,s2,t1):1 SOS1_LB_RDnSC(g1,s2,t1):2
 s49:  S1 :: muLB_Wspill(w1,s2,t1):1 SOS1_LB_Wspill(w1,s2,t1):2
 s50:  S1 :: muLB_Lshed(s2,t1):1 SOS1_LB_Lshed(s2,t1):2
End
