\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  16 Pgen(g1,t1) + 16 Pgen(g1,t2) + 16 Pgen(g1,t3) + 200 Pgen(g2,t1)
   + 200 Pgen(g2,t2) + 200 Pgen(g2,t3) + 32 PgenSC(g1,t1)
   + 32 PgenSC(g1,t2) + 32 PgenSC(g1,t3) + 8.4 RUp(g1,s1,t1)
   - 8.4 RDn(g1,s1,t1) + 100 RUp(g2,s1,t1) - 100 RDn(g2,s1,t1)
   + 16 RUpSC(g1,s1,t1) - 16 RDnSC(g1,s1,t1) + 500 Lshed(s1,t1)
   + 8.4 RUp(g1,s1,t2) - 8.4 RDn(g1,s1,t2) + 100 RUp(g2,s1,t2)
   - 100 RDn(g2,s1,t2) + 16 RUpSC(g1,s1,t2) - 16 RDnSC(g1,s1,t2)
   + 500 Lshed(s1,t2) + 8.4 RUp(g1,s1,t3) - 8.4 RDn(g1,s1,t3)
   + 100 RUp(g2,s1,t3) - 100 RDn(g2,s1,t3) + 16 RUpSC(g1,s1,t3)
   - 16 RDnSC(g1,s1,t3) + 500 Lshed(s1,t3) + 8.4 RUp(g1,s2,t1)
   - 8.4 RDn(g1,s2,t1) + 100 RUp(g2,s2,t1) - 100 RDn(g2,s2,t1)
   + 16 RUpSC(g1,s2,t1) - 16 RDnSC(g1,s2,t1) + 500 Lshed(s2,t1)
   + 8.4 RUp(g1,s2,t2) - 8.4 RDn(g1,s2,t2) + 100 RUp(g2,s2,t2)
   - 100 RDn(g2,s2,t2) + 16 RUpSC(g1,s2,t2) - 16 RDnSC(g1,s2,t2)
   + 500 Lshed(s2,t2) + 8.4 RUp(g1,s2,t3) - 8.4 RDn(g1,s2,t3)
   + 100 RUp(g2,s2,t3) - 100 RDn(g2,s2,t3) + 16 RUpSC(g1,s2,t3)
   - 16 RDnSC(g1,s2,t3) + 500 Lshed(s2,t3)
Subject To
 PowerBalance_DA(t1): Pgen(g1,t1) + Pgen(g2,t1) + PgenSC(g1,t1)
   + WindDA(w1,t1) = 50
 PowerBalance_DA(t2): Pgen(g1,t2) + Pgen(g2,t2) + PgenSC(g1,t2)
   + WindDA(w1,t2) = 50
 PowerBalance_DA(t3): Pgen(g1,t3) + Pgen(g2,t3) + PgenSC(g1,t3)
   + WindDA(w1,t3) = 50
 Pmax_DA_GFPP(g1,t1): Pgen(g1,t1) + PgenSC(g1,t1) + RCup(g1,t1)
   + RCupSC(g1,t1) <= 150
 Pmax_DA_GFPP(g2,t1): Pgen(g2,t1) + RCup(g2,t1) <= 0
 Pmax_DA_GFPP(g1,t2): Pgen(g1,t2) + PgenSC(g1,t2) + RCup(g1,t2)
   + RCupSC(g1,t2) <= 150
 Pmax_DA_GFPP(g2,t2): Pgen(g2,t2) + RCup(g2,t2) <= 0
 Pmax_DA_GFPP(g1,t3): Pgen(g1,t3) + PgenSC(g1,t3) + RCup(g1,t3)
   + RCupSC(g1,t3) <= 150
 Pmax_DA_GFPP(g2,t3): Pgen(g2,t3) + RCup(g2,t3) <= 0
 Pmin_DA_GFPP(g1,t1): - Pgen(g1,t1) - PgenSC(g1,t1) + RCdn(g1,t1)
   + RCdnSC(g1,t1) <= 0
 Pmin_DA(g2,t1): - Pgen(g2,t1) + RCdn(g2,t1) <= 0
 Pmin_DA_GFPP(g1,t2): - Pgen(g1,t2) - PgenSC(g1,t2) + RCdn(g1,t2)
   + RCdnSC(g1,t2) <= 0
 Pmin_DA(g2,t2): - Pgen(g2,t2) + RCdn(g2,t2) <= 0
 Pmin_DA_GFPP(g1,t3): - Pgen(g1,t3) - PgenSC(g1,t3) + RCdn(g1,t3)
   + RCdnSC(g1,t3) <= 0
 Pmin_DA(g2,t3): - Pgen(g2,t3) + RCdn(g2,t3) <= 0
 Wind_Max_DA(w1,t1): WindDA(w1,t1) <= 15
 Wind_Max_DA(w1,t2): WindDA(w1,t2) <= 20
 Wind_Max_DA(w1,t3): WindDA(w1,t3) <= 1
 PgenSCmax(g1,t1): PgenSC(g1,t1) <= 10
 PgenSCmin(g1,t1): - PgenSC(g1,t1) <= -10
 RCupSCmax(g1,t1): PgenSC(g1,t1) + RCupSC(g1,t1) <= 10
 RCdnSCmin(g1,t1): - PgenSC(g1,t1) + RCdnSC(g1,t1) <= -10
 PgenSCmax(g1,t2): PgenSC(g1,t2) <= 10
 PgenSCmin(g1,t2): - PgenSC(g1,t2) <= -10
 RCupSCmax(g1,t2): PgenSC(g1,t2) + RCupSC(g1,t2) <= 10
 RCdnSCmin(g1,t2): - PgenSC(g1,t2) + RCdnSC(g1,t2) <= -10
 PgenSCmax(g1,t3): PgenSC(g1,t3) <= 10
 PgenSCmin(g1,t3): - PgenSC(g1,t3) <= -10
 RCupSCmax(g1,t3): PgenSC(g1,t3) + RCupSC(g1,t3) <= 10
 RCdnSCmin(g1,t3): - PgenSC(g1,t3) + RCdnSC(g1,t3) <= -10
 PowerBalance_RT(s1,t1): - WindDA(w1,t1) + RUp(g1,s1,t1) - RDn(g1,s1,t1)
   + RUp(g2,s1,t1) - RDn(g2,s1,t1) + RUpSC(g1,s1,t1) - RDnSC(g1,s1,t1)
   - Wspill(w1,s1,t1) + Lshed(s1,t1) = -15
 PowerBalance_RT(s1,t2): - WindDA(w1,t2) + RUp(g1,s1,t2) - RDn(g1,s1,t2)
   + RUp(g2,s1,t2) - RDn(g2,s1,t2) + RUpSC(g1,s1,t2) - RDnSC(g1,s1,t2)
   - Wspill(w1,s1,t2) + Lshed(s1,t2) = -20
 PowerBalance_RT(s1,t3): - WindDA(w1,t3) + RUp(g1,s1,t3) - RDn(g1,s1,t3)
   + RUp(g2,s1,t3) - RDn(g2,s1,t3) + RUpSC(g1,s1,t3) - RDnSC(g1,s1,t3)
   - Wspill(w1,s1,t3) + Lshed(s1,t3) = -1
 PowerBalance_RT(s2,t1): - WindDA(w1,t1) + RUp(g1,s2,t1) - RDn(g1,s2,t1)
   + RUp(g2,s2,t1) - RDn(g2,s2,t1) + RUpSC(g1,s2,t1) - RDnSC(g1,s2,t1)
   - Wspill(w1,s2,t1) + Lshed(s2,t1) = -15
 PowerBalance_RT(s2,t2): - WindDA(w1,t2) + RUp(g1,s2,t2) - RDn(g1,s2,t2)
   + RUp(g2,s2,t2) - RDn(g2,s2,t2) + RUpSC(g1,s2,t2) - RDnSC(g1,s2,t2)
   - Wspill(w1,s2,t2) + Lshed(s2,t2) = -20
 PowerBalance_RT(s2,t3): - WindDA(w1,t3) + RUp(g1,s2,t3) - RDn(g1,s2,t3)
   + RUp(g2,s2,t3) - RDn(g2,s2,t3) + RUpSC(g1,s2,t3) - RDnSC(g1,s2,t3)
   - Wspill(w1,s2,t3) + Lshed(s2,t3) = -1
 RegUp_max_RT(g1,s1,t1): - RCup(g1,t1) + RUp(g1,s1,t1) <= 0
 RegDown_max_RT(g1,s1,t1): - RCdn(g1,t1) + RDn(g1,s1,t1) <= 0
 RegUp_max_RT(g2,s1,t1): - RCup(g2,t1) + RUp(g2,s1,t1) <= 0
 RegDown_max_RT(g2,s1,t1): - RCdn(g2,t1) + RDn(g2,s1,t1) <= 0
 RegUp_max_RT(g1,s1,t2): - RCup(g1,t2) + RUp(g1,s1,t2) <= 0
 RegDown_max_RT(g1,s1,t2): - RCdn(g1,t2) + RDn(g1,s1,t2) <= 0
 RegUp_max_RT(g2,s1,t2): - RCup(g2,t2) + RUp(g2,s1,t2) <= 0
 RegDown_max_RT(g2,s1,t2): - RCdn(g2,t2) + RDn(g2,s1,t2) <= 0
 RegUp_max_RT(g1,s1,t3): - RCup(g1,t3) + RUp(g1,s1,t3) <= 0
 RegDown_max_RT(g1,s1,t3): - RCdn(g1,t3) + RDn(g1,s1,t3) <= 0
 RegUp_max_RT(g2,s1,t3): - RCup(g2,t3) + RUp(g2,s1,t3) <= 0
 RegDown_max_RT(g2,s1,t3): - RCdn(g2,t3) + RDn(g2,s1,t3) <= 0
 RegUp_max_RT(g1,s2,t1): - RCup(g1,t1) + RUp(g1,s2,t1) <= 0
 RegDown_max_RT(g1,s2,t1): - RCdn(g1,t1) + RDn(g1,s2,t1) <= 0
 RegUp_max_RT(g2,s2,t1): - RCup(g2,t1) + RUp(g2,s2,t1) <= 0
 RegDown_max_RT(g2,s2,t1): - RCdn(g2,t1) + RDn(g2,s2,t1) <= 0
 RegUp_max_RT(g1,s2,t2): - RCup(g1,t2) + RUp(g1,s2,t2) <= 0
 RegDown_max_RT(g1,s2,t2): - RCdn(g1,t2) + RDn(g1,s2,t2) <= 0
 RegUp_max_RT(g2,s2,t2): - RCup(g2,t2) + RUp(g2,s2,t2) <= 0
 RegDown_max_RT(g2,s2,t2): - RCdn(g2,t2) + RDn(g2,s2,t2) <= 0
 RegUp_max_RT(g1,s2,t3): - RCup(g1,t3) + RUp(g1,s2,t3) <= 0
 RegDown_max_RT(g1,s2,t3): - RCdn(g1,t3) + RDn(g1,s2,t3) <= 0
 RegUp_max_RT(g2,s2,t3): - RCup(g2,t3) + RUp(g2,s2,t3) <= 0
 RegDown_max_RT(g2,s2,t3): - RCdn(g2,t3) + RDn(g2,s2,t3) <= 0
 RegUpSC_max_RT(g1,s1,t1): - RCupSC(g1,t1) + RUpSC(g1,s1,t1) <= 0
 RegDnSC_max_RT(g1,s1,t1): - RCdnSC(g1,t1) + RDnSC(g1,s1,t1) <= 0
 RegUpSC_max_RT(g1,s1,t2): - RCupSC(g1,t2) + RUpSC(g1,s1,t2) <= 0
 RegDnSC_max_RT(g1,s1,t2): - RCdnSC(g1,t2) + RDnSC(g1,s1,t2) <= 0
 RegUpSC_max_RT(g1,s1,t3): - RCupSC(g1,t3) + RUpSC(g1,s1,t3) <= 0
 RegDnSC_max_RT(g1,s1,t3): - RCdnSC(g1,t3) + RDnSC(g1,s1,t3) <= 0
 RegUpSC_max_RT(g1,s2,t1): - RCupSC(g1,t1) + RUpSC(g1,s2,t1) <= 0
 RegDnSC_max_RT(g1,s2,t1): - RCdnSC(g1,t1) + RDnSC(g1,s2,t1) <= 0
 RegUpSC_max_RT(g1,s2,t2): - RCupSC(g1,t2) + RUpSC(g1,s2,t2) <= 0
 RegDnSC_max_RT(g1,s2,t2): - RCdnSC(g1,t2) + RDnSC(g1,s2,t2) <= 0
 RegUpSC_max_RT(g1,s2,t3): - RCupSC(g1,t3) + RUpSC(g1,s2,t3) <= 0
 RegDnSC_max_RT(g1,s2,t3): - RCdnSC(g1,t3) + RDnSC(g1,s2,t3) <= 0
 Max_load_shed_RT(s1,t1): Lshed(s1,t1) <= 50
 Max_load_shed_RT(s1,t2): Lshed(s1,t2) <= 50
 Max_load_shed_RT(s1,t3): Lshed(s1,t3) <= 50
 Max_load_shed_RT(s2,t1): Lshed(s2,t1) <= 50
 Max_load_shed_RT(s2,t2): Lshed(s2,t2) <= 50
 Max_load_shed_RT(s2,t3): Lshed(s2,t3) <= 50
 Max_wind_spill_RT(w1,s1,t1): Wspill(w1,s1,t1) <= 15
 Max_wind_spill_RT(w1,s1,t2): Wspill(w1,s1,t2) <= 20
 Max_wind_spill_RT(w1,s1,t3): Wspill(w1,s1,t3) <= 1
 Max_wind_spill_RT(w1,s2,t1): Wspill(w1,s2,t1) <= 15
 Max_wind_spill_RT(w1,s2,t2): Wspill(w1,s2,t2) <= 20
 Max_wind_spill_RT(w1,s2,t3): Wspill(w1,s2,t3) <= 1
 SOS1_Pmax_DA_GFPP(g1,t1): Pgen(g1,t1) + PgenSC(g1,t1) + RCup(g1,t1)
   + RCupSC(g1,t1) + SOS1_Pmax_DA_GFPP(g1,t1) = 150
 SOS1_Pmax_DA_GFPP(g2,t1): Pgen(g2,t1) + RCup(g2,t1)
   + SOS1_Pmax_DA_GFPP(g2,t1) = 0
 SOS1_Pmax_DA_GFPP(g1,t2): Pgen(g1,t2) + PgenSC(g1,t2) + RCup(g1,t2)
   + RCupSC(g1,t2) + SOS1_Pmax_DA_GFPP(g1,t2) = 150
 SOS1_Pmax_DA_GFPP(g2,t2): Pgen(g2,t2) + RCup(g2,t2)
   + SOS1_Pmax_DA_GFPP(g2,t2) = 0
 SOS1_Pmax_DA_GFPP(g1,t3): Pgen(g1,t3) + PgenSC(g1,t3) + RCup(g1,t3)
   + RCupSC(g1,t3) + SOS1_Pmax_DA_GFPP(g1,t3) = 150
 SOS1_Pmax_DA_GFPP(g2,t3): Pgen(g2,t3) + RCup(g2,t3)
   + SOS1_Pmax_DA_GFPP(g2,t3) = 0
 SOS1_Pmin_DA_GFPP(g1,t1): - Pgen(g1,t1) - PgenSC(g1,t1) + RCdn(g1,t1)
   + RCdnSC(g1,t1) + SOS1_Pmin_DA_GFPP(g1,t1) = 0
 SOS1_Pmin_DA(g2,t1): - Pgen(g2,t1) + RCdn(g2,t1) + SOS1_Pmin_DA(g2,t1)
   = 0
 SOS1_Pmin_DA_GFPP(g1,t2): - Pgen(g1,t2) - PgenSC(g1,t2) + RCdn(g1,t2)
   + RCdnSC(g1,t2) + SOS1_Pmin_DA_GFPP(g1,t2) = 0
 SOS1_Pmin_DA(g2,t2): - Pgen(g2,t2) + RCdn(g2,t2) + SOS1_Pmin_DA(g2,t2)
   = 0
 SOS1_Pmin_DA_GFPP(g1,t3): - Pgen(g1,t3) - PgenSC(g1,t3) + RCdn(g1,t3)
   + RCdnSC(g1,t3) + SOS1_Pmin_DA_GFPP(g1,t3) = 0
 SOS1_Pmin_DA(g2,t3): - Pgen(g2,t3) + RCdn(g2,t3) + SOS1_Pmin_DA(g2,t3)
   = 0
 SOS1_Wind_Max_DA(w1,t1): WindDA(w1,t1) + SOS1_Wind_Max_DA(w1,t1) = 15
 SOS1_Wind_Max_DA(w1,t2): WindDA(w1,t2) + SOS1_Wind_Max_DA(w1,t2) = 20
 SOS1_Wind_Max_DA(w1,t3): WindDA(w1,t3) + SOS1_Wind_Max_DA(w1,t3) = 1
 SOS1_PgenSCmax(g1,t1): PgenSC(g1,t1) + SOS1_PgenSCmax(g1,t1) = 10
 SOS1_PgenSCmin(g1,t1): - PgenSC(g1,t1) + SOS1_PgenSCmin(g1,t1) = -10
 SOS1_RCupSCmax(g1,t1): PgenSC(g1,t1) + RCupSC(g1,t1)
   + SOS1_RCupSCmax(g1,t1) = 10
 SOS1_RCdnSCmin(g1,t1): - PgenSC(g1,t1) + RCdnSC(g1,t1)
   + SOS1_RCdnSCmin(g1,t1) = -10
 SOS1_PgenSCmax(g1,t2): PgenSC(g1,t2) + SOS1_PgenSCmax(g1,t2) = 10
 SOS1_PgenSCmin(g1,t2): - PgenSC(g1,t2) + SOS1_PgenSCmin(g1,t2) = -10
 SOS1_RCupSCmax(g1,t2): PgenSC(g1,t2) + RCupSC(g1,t2)
   + SOS1_RCupSCmax(g1,t2) = 10
 SOS1_RCdnSCmin(g1,t2): - PgenSC(g1,t2) + RCdnSC(g1,t2)
   + SOS1_RCdnSCmin(g1,t2) = -10
 SOS1_PgenSCmax(g1,t3): PgenSC(g1,t3) + SOS1_PgenSCmax(g1,t3) = 10
 SOS1_PgenSCmin(g1,t3): - PgenSC(g1,t3) + SOS1_PgenSCmin(g1,t3) = -10
 SOS1_RCupSCmax(g1,t3): PgenSC(g1,t3) + RCupSC(g1,t3)
   + SOS1_RCupSCmax(g1,t3) = 10
 SOS1_RCdnSCmin(g1,t3): - PgenSC(g1,t3) + RCdnSC(g1,t3)
   + SOS1_RCdnSCmin(g1,t3) = -10
 SOS1_RegUp_max_RT(g1,s1,t1): - RCup(g1,t1) + RUp(g1,s1,t1)
   + SOS1_RegUp_max_RT(g1,s1,t1) = 0
 SOS1_RegDown_max_RT(g1,s1,t1): - RCdn(g1,t1) + RDn(g1,s1,t1)
   + SOS1_RegDown_max_RT(g1,s1,t1) = 0
 SOS1_RegUp_max_RT(g2,s1,t1): - RCup(g2,t1) + RUp(g2,s1,t1)
   + SOS1_RegUp_max_RT(g2,s1,t1) = 0
 SOS1_RegDown_max_RT(g2,s1,t1): - RCdn(g2,t1) + RDn(g2,s1,t1)
   + SOS1_RegDown_max_RT(g2,s1,t1) = 0
 SOS1_RegUp_max_RT(g1,s1,t2): - RCup(g1,t2) + RUp(g1,s1,t2)
   + SOS1_RegUp_max_RT(g1,s1,t2) = 0
 SOS1_RegDown_max_RT(g1,s1,t2): - RCdn(g1,t2) + RDn(g1,s1,t2)
   + SOS1_RegDown_max_RT(g1,s1,t2) = 0
 SOS1_RegUp_max_RT(g2,s1,t2): - RCup(g2,t2) + RUp(g2,s1,t2)
   + SOS1_RegUp_max_RT(g2,s1,t2) = 0
 SOS1_RegDown_max_RT(g2,s1,t2): - RCdn(g2,t2) + RDn(g2,s1,t2)
   + SOS1_RegDown_max_RT(g2,s1,t2) = 0
 SOS1_RegUp_max_RT(g1,s1,t3): - RCup(g1,t3) + RUp(g1,s1,t3)
   + SOS1_RegUp_max_RT(g1,s1,t3) = 0
 SOS1_RegDown_max_RT(g1,s1,t3): - RCdn(g1,t3) + RDn(g1,s1,t3)
   + SOS1_RegDown_max_RT(g1,s1,t3) = 0
 SOS1_RegUp_max_RT(g2,s1,t3): - RCup(g2,t3) + RUp(g2,s1,t3)
   + SOS1_RegUp_max_RT(g2,s1,t3) = 0
 SOS1_RegDown_max_RT(g2,s1,t3): - RCdn(g2,t3) + RDn(g2,s1,t3)
   + SOS1_RegDown_max_RT(g2,s1,t3) = 0
 SOS1_RegUp_max_RT(g1,s2,t1): - RCup(g1,t1) + RUp(g1,s2,t1)
   + SOS1_RegUp_max_RT(g1,s2,t1) = 0
 SOS1_RegDown_max_RT(g1,s2,t1): - RCdn(g1,t1) + RDn(g1,s2,t1)
   + SOS1_RegDown_max_RT(g1,s2,t1) = 0
 SOS1_RegUp_max_RT(g2,s2,t1): - RCup(g2,t1) + RUp(g2,s2,t1)
   + SOS1_RegUp_max_RT(g2,s2,t1) = 0
 SOS1_RegDown_max_RT(g2,s2,t1): - RCdn(g2,t1) + RDn(g2,s2,t1)
   + SOS1_RegDown_max_RT(g2,s2,t1) = 0
 SOS1_RegUp_max_RT(g1,s2,t2): - RCup(g1,t2) + RUp(g1,s2,t2)
   + SOS1_RegUp_max_RT(g1,s2,t2) = 0
 SOS1_RegDown_max_RT(g1,s2,t2): - RCdn(g1,t2) + RDn(g1,s2,t2)
   + SOS1_RegDown_max_RT(g1,s2,t2) = 0
 SOS1_RegUp_max_RT(g2,s2,t2): - RCup(g2,t2) + RUp(g2,s2,t2)
   + SOS1_RegUp_max_RT(g2,s2,t2) = 0
 SOS1_RegDown_max_RT(g2,s2,t2): - RCdn(g2,t2) + RDn(g2,s2,t2)
   + SOS1_RegDown_max_RT(g2,s2,t2) = 0
 SOS1_RegUp_max_RT(g1,s2,t3): - RCup(g1,t3) + RUp(g1,s2,t3)
   + SOS1_RegUp_max_RT(g1,s2,t3) = 0
 SOS1_RegDown_max_RT(g1,s2,t3): - RCdn(g1,t3) + RDn(g1,s2,t3)
   + SOS1_RegDown_max_RT(g1,s2,t3) = 0
 SOS1_RegUp_max_RT(g2,s2,t3): - RCup(g2,t3) + RUp(g2,s2,t3)
   + SOS1_RegUp_max_RT(g2,s2,t3) = 0
 SOS1_RegDown_max_RT(g2,s2,t3): - RCdn(g2,t3) + RDn(g2,s2,t3)
   + SOS1_RegDown_max_RT(g2,s2,t3) = 0
 SOS1_RegUpSC_max_RT(g1,s1,t1): - RCupSC(g1,t1) + RUpSC(g1,s1,t1)
   + SOS1_RegUpSC_max_RT(g1,s1,t1) = 0
 SOS1_RegDnSC_max_RT(g1,s1,t1): - RCdnSC(g1,t1) + RDnSC(g1,s1,t1)
   + SOS1_RegDnSC_max_RT(g1,s1,t1) = 0
 SOS1_RegUpSC_max_RT(g1,s1,t2): - RCupSC(g1,t2) + RUpSC(g1,s1,t2)
   + SOS1_RegUpSC_max_RT(g1,s1,t2) = 0
 SOS1_RegDnSC_max_RT(g1,s1,t2): - RCdnSC(g1,t2) + RDnSC(g1,s1,t2)
   + SOS1_RegDnSC_max_RT(g1,s1,t2) = 0
 SOS1_RegUpSC_max_RT(g1,s1,t3): - RCupSC(g1,t3) + RUpSC(g1,s1,t3)
   + SOS1_RegUpSC_max_RT(g1,s1,t3) = 0
 SOS1_RegDnSC_max_RT(g1,s1,t3): - RCdnSC(g1,t3) + RDnSC(g1,s1,t3)
   + SOS1_RegDnSC_max_RT(g1,s1,t3) = 0
 SOS1_RegUpSC_max_RT(g1,s2,t1): - RCupSC(g1,t1) + RUpSC(g1,s2,t1)
   + SOS1_RegUpSC_max_RT(g1,s2,t1) = 0
 SOS1_RegDnSC_max_RT(g1,s2,t1): - RCdnSC(g1,t1) + RDnSC(g1,s2,t1)
   + SOS1_RegDnSC_max_RT(g1,s2,t1) = 0
 SOS1_RegUpSC_max_RT(g1,s2,t2): - RCupSC(g1,t2) + RUpSC(g1,s2,t2)
   + SOS1_RegUpSC_max_RT(g1,s2,t2) = 0
 SOS1_RegDnSC_max_RT(g1,s2,t2): - RCdnSC(g1,t2) + RDnSC(g1,s2,t2)
   + SOS1_RegDnSC_max_RT(g1,s2,t2) = 0
 SOS1_RegUpSC_max_RT(g1,s2,t3): - RCupSC(g1,t3) + RUpSC(g1,s2,t3)
   + SOS1_RegUpSC_max_RT(g1,s2,t3) = 0
 SOS1_RegDnSC_max_RT(g1,s2,t3): - RCdnSC(g1,t3) + RDnSC(g1,s2,t3)
   + SOS1_RegDnSC_max_RT(g1,s2,t3) = 0
 SOS1_Max_load_shed_RT(s1,t1): Lshed(s1,t1) + SOS1_Max_load_shed_RT(s1,t1)
   = 50
 SOS1_Max_load_shed_RT(s1,t2): Lshed(s1,t2) + SOS1_Max_load_shed_RT(s1,t2)
   = 50
 SOS1_Max_load_shed_RT(s1,t3): Lshed(s1,t3) + SOS1_Max_load_shed_RT(s1,t3)
   = 50
 SOS1_Max_load_shed_RT(s2,t1): Lshed(s2,t1) + SOS1_Max_load_shed_RT(s2,t1)
   = 50
 SOS1_Max_load_shed_RT(s2,t2): Lshed(s2,t2) + SOS1_Max_load_shed_RT(s2,t2)
   = 50
 SOS1_Max_load_shed_RT(s2,t3): Lshed(s2,t3) + SOS1_Max_load_shed_RT(s2,t3)
   = 50
 SOS1_Max_wind_spill_RT(w1,s1,t1): Wspill(w1,s1,t1)
   + SOS1_Max_wind_spill_RT(w1,s1,t1) = 15
 SOS1_Max_wind_spill_RT(w1,s1,t2): Wspill(w1,s1,t2)
   + SOS1_Max_wind_spill_RT(w1,s1,t2) = 20
 SOS1_Max_wind_spill_RT(w1,s1,t3): Wspill(w1,s1,t3)
   + SOS1_Max_wind_spill_RT(w1,s1,t3) = 1
 SOS1_Max_wind_spill_RT(w1,s2,t1): Wspill(w1,s2,t1)
   + SOS1_Max_wind_spill_RT(w1,s2,t1) = 15
 SOS1_Max_wind_spill_RT(w1,s2,t2): Wspill(w1,s2,t2)
   + SOS1_Max_wind_spill_RT(w1,s2,t2) = 20
 SOS1_Max_wind_spill_RT(w1,s2,t3): Wspill(w1,s2,t3)
   + SOS1_Max_wind_spill_RT(w1,s2,t3) = 1
 SOS1_LB_Pgen(g1,t1): - Pgen(g1,t1) + SOS1_LB_Pgen(g1,t1) = 0
 SOS1_LB_Pgen(g1,t2): - Pgen(g1,t2) + SOS1_LB_Pgen(g1,t2) = 0
 SOS1_LB_Pgen(g1,t3): - Pgen(g1,t3) + SOS1_LB_Pgen(g1,t3) = 0
 SOS1_LB_Pgen(g2,t1): - Pgen(g2,t1) + SOS1_LB_Pgen(g2,t1) = 0
 SOS1_LB_Pgen(g2,t2): - Pgen(g2,t2) + SOS1_LB_Pgen(g2,t2) = 0
 SOS1_LB_Pgen(g2,t3): - Pgen(g2,t3) + SOS1_LB_Pgen(g2,t3) = 0
 SOS1_LB_PgenSC(g1,t1): - PgenSC(g1,t1) + SOS1_LB_PgenSC(g1,t1) = 0
 SOS1_LB_PgenSC(g1,t2): - PgenSC(g1,t2) + SOS1_LB_PgenSC(g1,t2) = 0
 SOS1_LB_PgenSC(g1,t3): - PgenSC(g1,t3) + SOS1_LB_PgenSC(g1,t3) = 0
 SOS1_LB_RCup(g1,t1): - RCup(g1,t1) + SOS1_LB_RCup(g1,t1) = 0
 SOS1_LB_RCup(g1,t2): - RCup(g1,t2) + SOS1_LB_RCup(g1,t2) = 0
 SOS1_LB_RCup(g1,t3): - RCup(g1,t3) + SOS1_LB_RCup(g1,t3) = 0
 SOS1_LB_RCup(g2,t1): - RCup(g2,t1) + SOS1_LB_RCup(g2,t1) = 0
 SOS1_LB_RCup(g2,t2): - RCup(g2,t2) + SOS1_LB_RCup(g2,t2) = 0
 SOS1_LB_RCup(g2,t3): - RCup(g2,t3) + SOS1_LB_RCup(g2,t3) = 0
 SOS1_LB_RCdn(g1,t1): - RCdn(g1,t1) + SOS1_LB_RCdn(g1,t1) = 0
 SOS1_LB_RCdn(g1,t2): - RCdn(g1,t2) + SOS1_LB_RCdn(g1,t2) = 0
 SOS1_LB_RCdn(g1,t3): - RCdn(g1,t3) + SOS1_LB_RCdn(g1,t3) = 0
 SOS1_LB_RCdn(g2,t1): - RCdn(g2,t1) + SOS1_LB_RCdn(g2,t1) = 0
 SOS1_LB_RCdn(g2,t2): - RCdn(g2,t2) + SOS1_LB_RCdn(g2,t2) = 0
 SOS1_LB_RCdn(g2,t3): - RCdn(g2,t3) + SOS1_LB_RCdn(g2,t3) = 0
 SOS1_LB_RCupSC(g1,t1): - RCupSC(g1,t1) + SOS1_LB_RCupSC(g1,t1) = 0
 SOS1_LB_RCupSC(g1,t2): - RCupSC(g1,t2) + SOS1_LB_RCupSC(g1,t2) = 0
 SOS1_LB_RCupSC(g1,t3): - RCupSC(g1,t3) + SOS1_LB_RCupSC(g1,t3) = 0
 SOS1_LB_RCdnSC(g1,t1): - RCdnSC(g1,t1) + SOS1_LB_RCdnSC(g1,t1) = 0
 SOS1_LB_RCdnSC(g1,t2): - RCdnSC(g1,t2) + SOS1_LB_RCdnSC(g1,t2) = 0
 SOS1_LB_RCdnSC(g1,t3): - RCdnSC(g1,t3) + SOS1_LB_RCdnSC(g1,t3) = 0
 SOS1_LB_WindDA(w1,t1): - WindDA(w1,t1) + SOS1_LB_WindDA(w1,t1) = 0
 SOS1_LB_WindDA(w1,t2): - WindDA(w1,t2) + SOS1_LB_WindDA(w1,t2) = 0
 SOS1_LB_WindDA(w1,t3): - WindDA(w1,t3) + SOS1_LB_WindDA(w1,t3) = 0
 SOS1_LB_RUp(g1,s1,t1): - RUp(g1,s1,t1) + SOS1_LB_RUp(g1,s1,t1) = 0
 SOS1_LB_RDn(g1,s1,t1): - RDn(g1,s1,t1) + SOS1_LB_RDn(g1,s1,t1) = 0
 SOS1_LB_RUp(g2,s1,t1): - RUp(g2,s1,t1) + SOS1_LB_RUp(g2,s1,t1) = 0
 SOS1_LB_RDn(g2,s1,t1): - RDn(g2,s1,t1) + SOS1_LB_RDn(g2,s1,t1) = 0
 SOS1_LB_RUpSC(g1,s1,t1): - RUpSC(g1,s1,t1) + SOS1_LB_RUpSC(g1,s1,t1) = 0
 SOS1_LB_RDnSC(g1,s1,t1): - RDnSC(g1,s1,t1) + SOS1_LB_RDnSC(g1,s1,t1) = 0
 SOS1_LB_Wspill(w1,s1,t1): - Wspill(w1,s1,t1) + SOS1_LB_Wspill(w1,s1,t1)
   = 0
 SOS1_LB_Lshed(s1,t1): - Lshed(s1,t1) + SOS1_LB_Lshed(s1,t1) = 0
 SOS1_LB_RUp(g1,s1,t2): - RUp(g1,s1,t2) + SOS1_LB_RUp(g1,s1,t2) = 0
 SOS1_LB_RDn(g1,s1,t2): - RDn(g1,s1,t2) + SOS1_LB_RDn(g1,s1,t2) = 0
 SOS1_LB_RUp(g2,s1,t2): - RUp(g2,s1,t2) + SOS1_LB_RUp(g2,s1,t2) = 0
 SOS1_LB_RDn(g2,s1,t2): - RDn(g2,s1,t2) + SOS1_LB_RDn(g2,s1,t2) = 0
 SOS1_LB_RUpSC(g1,s1,t2): - RUpSC(g1,s1,t2) + SOS1_LB_RUpSC(g1,s1,t2) = 0
 SOS1_LB_RDnSC(g1,s1,t2): - RDnSC(g1,s1,t2) + SOS1_LB_RDnSC(g1,s1,t2) = 0
 SOS1_LB_Wspill(w1,s1,t2): - Wspill(w1,s1,t2) + SOS1_LB_Wspill(w1,s1,t2)
   = 0
 SOS1_LB_Lshed(s1,t2): - Lshed(s1,t2) + SOS1_LB_Lshed(s1,t2) = 0
 SOS1_LB_RUp(g1,s1,t3): - RUp(g1,s1,t3) + SOS1_LB_RUp(g1,s1,t3) = 0
 SOS1_LB_RDn(g1,s1,t3): - RDn(g1,s1,t3) + SOS1_LB_RDn(g1,s1,t3) = 0
 SOS1_LB_RUp(g2,s1,t3): - RUp(g2,s1,t3) + SOS1_LB_RUp(g2,s1,t3) = 0
 SOS1_LB_RDn(g2,s1,t3): - RDn(g2,s1,t3) + SOS1_LB_RDn(g2,s1,t3) = 0
 SOS1_LB_RUpSC(g1,s1,t3): - RUpSC(g1,s1,t3) + SOS1_LB_RUpSC(g1,s1,t3) = 0
 SOS1_LB_RDnSC(g1,s1,t3): - RDnSC(g1,s1,t3) + SOS1_LB_RDnSC(g1,s1,t3) = 0
 SOS1_LB_Wspill(w1,s1,t3): - Wspill(w1,s1,t3) + SOS1_LB_Wspill(w1,s1,t3)
   = 0
 SOS1_LB_Lshed(s1,t3): - Lshed(s1,t3) + SOS1_LB_Lshed(s1,t3) = 0
 SOS1_LB_RUp(g1,s2,t1): - RUp(g1,s2,t1) + SOS1_LB_RUp(g1,s2,t1) = 0
 SOS1_LB_RDn(g1,s2,t1): - RDn(g1,s2,t1) + SOS1_LB_RDn(g1,s2,t1) = 0
 SOS1_LB_RUp(g2,s2,t1): - RUp(g2,s2,t1) + SOS1_LB_RUp(g2,s2,t1) = 0
 SOS1_LB_RDn(g2,s2,t1): - RDn(g2,s2,t1) + SOS1_LB_RDn(g2,s2,t1) = 0
 SOS1_LB_RUpSC(g1,s2,t1): - RUpSC(g1,s2,t1) + SOS1_LB_RUpSC(g1,s2,t1) = 0
 SOS1_LB_RDnSC(g1,s2,t1): - RDnSC(g1,s2,t1) + SOS1_LB_RDnSC(g1,s2,t1) = 0
 SOS1_LB_Wspill(w1,s2,t1): - Wspill(w1,s2,t1) + SOS1_LB_Wspill(w1,s2,t1)
   = 0
 SOS1_LB_Lshed(s2,t1): - Lshed(s2,t1) + SOS1_LB_Lshed(s2,t1) = 0
 SOS1_LB_RUp(g1,s2,t2): - RUp(g1,s2,t2) + SOS1_LB_RUp(g1,s2,t2) = 0
 SOS1_LB_RDn(g1,s2,t2): - RDn(g1,s2,t2) + SOS1_LB_RDn(g1,s2,t2) = 0
 SOS1_LB_RUp(g2,s2,t2): - RUp(g2,s2,t2) + SOS1_LB_RUp(g2,s2,t2) = 0
 SOS1_LB_RDn(g2,s2,t2): - RDn(g2,s2,t2) + SOS1_LB_RDn(g2,s2,t2) = 0
 SOS1_LB_RUpSC(g1,s2,t2): - RUpSC(g1,s2,t2) + SOS1_LB_RUpSC(g1,s2,t2) = 0
 SOS1_LB_RDnSC(g1,s2,t2): - RDnSC(g1,s2,t2) + SOS1_LB_RDnSC(g1,s2,t2) = 0
 SOS1_LB_Wspill(w1,s2,t2): - Wspill(w1,s2,t2) + SOS1_LB_Wspill(w1,s2,t2)
   = 0
 SOS1_LB_Lshed(s2,t2): - Lshed(s2,t2) + SOS1_LB_Lshed(s2,t2) = 0
 SOS1_LB_RUp(g1,s2,t3): - RUp(g1,s2,t3) + SOS1_LB_RUp(g1,s2,t3) = 0
 SOS1_LB_RDn(g1,s2,t3): - RDn(g1,s2,t3) + SOS1_LB_RDn(g1,s2,t3) = 0
 SOS1_LB_RUp(g2,s2,t3): - RUp(g2,s2,t3) + SOS1_LB_RUp(g2,s2,t3) = 0
 SOS1_LB_RDn(g2,s2,t3): - RDn(g2,s2,t3) + SOS1_LB_RDn(g2,s2,t3) = 0
 SOS1_LB_RUpSC(g1,s2,t3): - RUpSC(g1,s2,t3) + SOS1_LB_RUpSC(g1,s2,t3) = 0
 SOS1_LB_RDnSC(g1,s2,t3): - RDnSC(g1,s2,t3) + SOS1_LB_RDnSC(g1,s2,t3) = 0
 SOS1_LB_Wspill(w1,s2,t3): - Wspill(w1,s2,t3) + SOS1_LB_Wspill(w1,s2,t3)
   = 0
 SOS1_LB_Lshed(s2,t3): - Lshed(s2,t3) + SOS1_LB_Lshed(s2,t3) = 0
 dLag/Pgen(g1,t1): - lambda_PowerBalance_DA(t1) + mu_Pmax_DA_GFPP(g1,t1)
   - mu_Pmin_DA_GFPP(g1,t1) - muLB_Pgen(g1,t1) = -16
 dLag/Pgen(g1,t2): - lambda_PowerBalance_DA(t2) + mu_Pmax_DA_GFPP(g1,t2)
   - mu_Pmin_DA_GFPP(g1,t2) - muLB_Pgen(g1,t2) = -16
 dLag/Pgen(g1,t3): - lambda_PowerBalance_DA(t3) + mu_Pmax_DA_GFPP(g1,t3)
   - mu_Pmin_DA_GFPP(g1,t3) - muLB_Pgen(g1,t3) = -16
 dLag/Pgen(g2,t1): - lambda_PowerBalance_DA(t1) + mu_Pmax_DA_GFPP(g2,t1)
   - mu_Pmin_DA(g2,t1) - muLB_Pgen(g2,t1) = -200
 dLag/Pgen(g2,t2): - lambda_PowerBalance_DA(t2) + mu_Pmax_DA_GFPP(g2,t2)
   - mu_Pmin_DA(g2,t2) - muLB_Pgen(g2,t2) = -200
 dLag/Pgen(g2,t3): - lambda_PowerBalance_DA(t3) + mu_Pmax_DA_GFPP(g2,t3)
   - mu_Pmin_DA(g2,t3) - muLB_Pgen(g2,t3) = -200
 dLag/PgenSC(g1,t1): - lambda_PowerBalance_DA(t1) + mu_Pmax_DA_GFPP(g1,t1)
   - mu_Pmin_DA_GFPP(g1,t1) + mu_PgenSCmax(g1,t1) - mu_PgenSCmin(g1,t1)
   + mu_RCupSCmax(g1,t1) - mu_RCdnSCmin(g1,t1) - muLB_PgenSC(g1,t1) = -32
 dLag/PgenSC(g1,t2): - lambda_PowerBalance_DA(t2) + mu_Pmax_DA_GFPP(g1,t2)
   - mu_Pmin_DA_GFPP(g1,t2) + mu_PgenSCmax(g1,t2) - mu_PgenSCmin(g1,t2)
   + mu_RCupSCmax(g1,t2) - mu_RCdnSCmin(g1,t2) - muLB_PgenSC(g1,t2) = -32
 dLag/PgenSC(g1,t3): - lambda_PowerBalance_DA(t3) + mu_Pmax_DA_GFPP(g1,t3)
   - mu_Pmin_DA_GFPP(g1,t3) + mu_PgenSCmax(g1,t3) - mu_PgenSCmin(g1,t3)
   + mu_RCupSCmax(g1,t3) - mu_RCdnSCmin(g1,t3) - muLB_PgenSC(g1,t3) = -32
 dLag/RCup(g1,t1): mu_Pmax_DA_GFPP(g1,t1) - mu_RegUp_max_RT(g1,s1,t1)
   - mu_RegUp_max_RT(g1,s2,t1) - muLB_RCup(g1,t1) = 0
 dLag/RCup(g1,t2): mu_Pmax_DA_GFPP(g1,t2) - mu_RegUp_max_RT(g1,s1,t2)
   - mu_RegUp_max_RT(g1,s2,t2) - muLB_RCup(g1,t2) = 0
 dLag/RCup(g1,t3): mu_Pmax_DA_GFPP(g1,t3) - mu_RegUp_max_RT(g1,s1,t3)
   - mu_RegUp_max_RT(g1,s2,t3) - muLB_RCup(g1,t3) = 0
 dLag/RCup(g2,t1): mu_Pmax_DA_GFPP(g2,t1) - mu_RegUp_max_RT(g2,s1,t1)
   - mu_RegUp_max_RT(g2,s2,t1) - muLB_RCup(g2,t1) = 0
 dLag/RCup(g2,t2): mu_Pmax_DA_GFPP(g2,t2) - mu_RegUp_max_RT(g2,s1,t2)
   - mu_RegUp_max_RT(g2,s2,t2) - muLB_RCup(g2,t2) = 0
 dLag/RCup(g2,t3): mu_Pmax_DA_GFPP(g2,t3) - mu_RegUp_max_RT(g2,s1,t3)
   - mu_RegUp_max_RT(g2,s2,t3) - muLB_RCup(g2,t3) = 0
 dLag/RCdn(g1,t1): mu_Pmin_DA_GFPP(g1,t1) - mu_RegDown_max_RT(g1,s1,t1)
   - mu_RegDown_max_RT(g1,s2,t1) - muLB_RCdn(g1,t1) = 0
 dLag/RCdn(g1,t2): mu_Pmin_DA_GFPP(g1,t2) - mu_RegDown_max_RT(g1,s1,t2)
   - mu_RegDown_max_RT(g1,s2,t2) - muLB_RCdn(g1,t2) = 0
 dLag/RCdn(g1,t3): mu_Pmin_DA_GFPP(g1,t3) - mu_RegDown_max_RT(g1,s1,t3)
   - mu_RegDown_max_RT(g1,s2,t3) - muLB_RCdn(g1,t3) = 0
 dLag/RCdn(g2,t1): mu_Pmin_DA(g2,t1) - mu_RegDown_max_RT(g2,s1,t1)
   - mu_RegDown_max_RT(g2,s2,t1) - muLB_RCdn(g2,t1) = 0
 dLag/RCdn(g2,t2): mu_Pmin_DA(g2,t2) - mu_RegDown_max_RT(g2,s1,t2)
   - mu_RegDown_max_RT(g2,s2,t2) - muLB_RCdn(g2,t2) = 0
 dLag/RCdn(g2,t3): mu_Pmin_DA(g2,t3) - mu_RegDown_max_RT(g2,s1,t3)
   - mu_RegDown_max_RT(g2,s2,t3) - muLB_RCdn(g2,t3) = 0
 dLag/RCupSC(g1,t1): mu_Pmax_DA_GFPP(g1,t1) + mu_RCupSCmax(g1,t1)
   - mu_RegUpSC_max_RT(g1,s1,t1) - mu_RegUpSC_max_RT(g1,s2,t1)
   - muLB_RCupSC(g1,t1) = 0
 dLag/RCupSC(g1,t2): mu_Pmax_DA_GFPP(g1,t2) + mu_RCupSCmax(g1,t2)
   - mu_RegUpSC_max_RT(g1,s1,t2) - mu_RegUpSC_max_RT(g1,s2,t2)
   - muLB_RCupSC(g1,t2) = 0
 dLag/RCupSC(g1,t3): mu_Pmax_DA_GFPP(g1,t3) + mu_RCupSCmax(g1,t3)
   - mu_RegUpSC_max_RT(g1,s1,t3) - mu_RegUpSC_max_RT(g1,s2,t3)
   - muLB_RCupSC(g1,t3) = 0
 dLag/RCdnSC(g1,t1): mu_Pmin_DA_GFPP(g1,t1) + mu_RCdnSCmin(g1,t1)
   - mu_RegDnSC_max_RT(g1,s1,t1) - mu_RegDnSC_max_RT(g1,s2,t1)
   - muLB_RCdnSC(g1,t1) = 0
 dLag/RCdnSC(g1,t2): mu_Pmin_DA_GFPP(g1,t2) + mu_RCdnSCmin(g1,t2)
   - mu_RegDnSC_max_RT(g1,s1,t2) - mu_RegDnSC_max_RT(g1,s2,t2)
   - muLB_RCdnSC(g1,t2) = 0
 dLag/RCdnSC(g1,t3): mu_Pmin_DA_GFPP(g1,t3) + mu_RCdnSCmin(g1,t3)
   - mu_RegDnSC_max_RT(g1,s1,t3) - mu_RegDnSC_max_RT(g1,s2,t3)
   - muLB_RCdnSC(g1,t3) = 0
 dLag/WindDA(w1,t1): - lambda_PowerBalance_DA(t1) + mu_Wind_Max_DA(w1,t1)
   + lambda_PowerBalance_RT(s1,t1) + lambda_PowerBalance_RT(s2,t1)
   - muLB_WindDA(w1,t1) = 0
 dLag/WindDA(w1,t2): - lambda_PowerBalance_DA(t2) + mu_Wind_Max_DA(w1,t2)
   + lambda_PowerBalance_RT(s1,t2) + lambda_PowerBalance_RT(s2,t2)
   - muLB_WindDA(w1,t2) = 0
 dLag/WindDA(w1,t3): - lambda_PowerBalance_DA(t3) + mu_Wind_Max_DA(w1,t3)
   + lambda_PowerBalance_RT(s1,t3) + lambda_PowerBalance_RT(s2,t3)
   - muLB_WindDA(w1,t3) = 0
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
 dLag/RUp(g1,s1,t2): - lambda_PowerBalance_RT(s1,t2)
   + mu_RegUp_max_RT(g1,s1,t2) - muLB_RUp(g1,s1,t2) = -8.4
 dLag/RDn(g1,s1,t2): lambda_PowerBalance_RT(s1,t2)
   + mu_RegDown_max_RT(g1,s1,t2) - muLB_RDn(g1,s1,t2) = 8.4
 dLag/RUp(g2,s1,t2): - lambda_PowerBalance_RT(s1,t2)
   + mu_RegUp_max_RT(g2,s1,t2) - muLB_RUp(g2,s1,t2) = -100
 dLag/RDn(g2,s1,t2): lambda_PowerBalance_RT(s1,t2)
   + mu_RegDown_max_RT(g2,s1,t2) - muLB_RDn(g2,s1,t2) = 100
 dLag/RUpSC(g1,s1,t2): - lambda_PowerBalance_RT(s1,t2)
   + mu_RegUpSC_max_RT(g1,s1,t2) - muLB_RUpSC(g1,s1,t2) = -16
 dLag/RDnSC(g1,s1,t2): lambda_PowerBalance_RT(s1,t2)
   + mu_RegDnSC_max_RT(g1,s1,t2) - muLB_RDnSC(g1,s1,t2) = 16
 dLag/Wspill(w1,s1,t2): lambda_PowerBalance_RT(s1,t2)
   + mu_Max_wind_spill_RT(w1,s1,t2) - muLB_Wspill(w1,s1,t2) = 0
 dLag/Lshed(s1,t2): - lambda_PowerBalance_RT(s1,t2)
   + mu_Max_load_shed_RT(s1,t2) - muLB_Lshed(s1,t2) = -500
 dLag/RUp(g1,s1,t3): - lambda_PowerBalance_RT(s1,t3)
   + mu_RegUp_max_RT(g1,s1,t3) - muLB_RUp(g1,s1,t3) = -8.4
 dLag/RDn(g1,s1,t3): lambda_PowerBalance_RT(s1,t3)
   + mu_RegDown_max_RT(g1,s1,t3) - muLB_RDn(g1,s1,t3) = 8.4
 dLag/RUp(g2,s1,t3): - lambda_PowerBalance_RT(s1,t3)
   + mu_RegUp_max_RT(g2,s1,t3) - muLB_RUp(g2,s1,t3) = -100
 dLag/RDn(g2,s1,t3): lambda_PowerBalance_RT(s1,t3)
   + mu_RegDown_max_RT(g2,s1,t3) - muLB_RDn(g2,s1,t3) = 100
 dLag/RUpSC(g1,s1,t3): - lambda_PowerBalance_RT(s1,t3)
   + mu_RegUpSC_max_RT(g1,s1,t3) - muLB_RUpSC(g1,s1,t3) = -16
 dLag/RDnSC(g1,s1,t3): lambda_PowerBalance_RT(s1,t3)
   + mu_RegDnSC_max_RT(g1,s1,t3) - muLB_RDnSC(g1,s1,t3) = 16
 dLag/Wspill(w1,s1,t3): lambda_PowerBalance_RT(s1,t3)
   + mu_Max_wind_spill_RT(w1,s1,t3) - muLB_Wspill(w1,s1,t3) = 0
 dLag/Lshed(s1,t3): - lambda_PowerBalance_RT(s1,t3)
   + mu_Max_load_shed_RT(s1,t3) - muLB_Lshed(s1,t3) = -500
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
 dLag/RUp(g1,s2,t2): - lambda_PowerBalance_RT(s2,t2)
   + mu_RegUp_max_RT(g1,s2,t2) - muLB_RUp(g1,s2,t2) = -8.4
 dLag/RDn(g1,s2,t2): lambda_PowerBalance_RT(s2,t2)
   + mu_RegDown_max_RT(g1,s2,t2) - muLB_RDn(g1,s2,t2) = 8.4
 dLag/RUp(g2,s2,t2): - lambda_PowerBalance_RT(s2,t2)
   + mu_RegUp_max_RT(g2,s2,t2) - muLB_RUp(g2,s2,t2) = -100
 dLag/RDn(g2,s2,t2): lambda_PowerBalance_RT(s2,t2)
   + mu_RegDown_max_RT(g2,s2,t2) - muLB_RDn(g2,s2,t2) = 100
 dLag/RUpSC(g1,s2,t2): - lambda_PowerBalance_RT(s2,t2)
   + mu_RegUpSC_max_RT(g1,s2,t2) - muLB_RUpSC(g1,s2,t2) = -16
 dLag/RDnSC(g1,s2,t2): lambda_PowerBalance_RT(s2,t2)
   + mu_RegDnSC_max_RT(g1,s2,t2) - muLB_RDnSC(g1,s2,t2) = 16
 dLag/Wspill(w1,s2,t2): lambda_PowerBalance_RT(s2,t2)
   + mu_Max_wind_spill_RT(w1,s2,t2) - muLB_Wspill(w1,s2,t2) = 0
 dLag/Lshed(s2,t2): - lambda_PowerBalance_RT(s2,t2)
   + mu_Max_load_shed_RT(s2,t2) - muLB_Lshed(s2,t2) = -500
 dLag/RUp(g1,s2,t3): - lambda_PowerBalance_RT(s2,t3)
   + mu_RegUp_max_RT(g1,s2,t3) - muLB_RUp(g1,s2,t3) = -8.4
 dLag/RDn(g1,s2,t3): lambda_PowerBalance_RT(s2,t3)
   + mu_RegDown_max_RT(g1,s2,t3) - muLB_RDn(g1,s2,t3) = 8.4
 dLag/RUp(g2,s2,t3): - lambda_PowerBalance_RT(s2,t3)
   + mu_RegUp_max_RT(g2,s2,t3) - muLB_RUp(g2,s2,t3) = -100
 dLag/RDn(g2,s2,t3): lambda_PowerBalance_RT(s2,t3)
   + mu_RegDown_max_RT(g2,s2,t3) - muLB_RDn(g2,s2,t3) = 100
 dLag/RUpSC(g1,s2,t3): - lambda_PowerBalance_RT(s2,t3)
   + mu_RegUpSC_max_RT(g1,s2,t3) - muLB_RUpSC(g1,s2,t3) = -16
 dLag/RDnSC(g1,s2,t3): lambda_PowerBalance_RT(s2,t3)
   + mu_RegDnSC_max_RT(g1,s2,t3) - muLB_RDnSC(g1,s2,t3) = 16
 dLag/Wspill(w1,s2,t3): lambda_PowerBalance_RT(s2,t3)
   + mu_Max_wind_spill_RT(w1,s2,t3) - muLB_Wspill(w1,s2,t3) = 0
 dLag/Lshed(s2,t3): - lambda_PowerBalance_RT(s2,t3)
   + mu_Max_load_shed_RT(s2,t3) - muLB_Lshed(s2,t3) = -500
Bounds
 lambda_PowerBalance_DA(t1) free
 lambda_PowerBalance_DA(t2) free
 lambda_PowerBalance_DA(t3) free
 lambda_PowerBalance_RT(s1,t1) free
 lambda_PowerBalance_RT(s1,t2) free
 lambda_PowerBalance_RT(s1,t3) free
 lambda_PowerBalance_RT(s2,t1) free
 lambda_PowerBalance_RT(s2,t2) free
 lambda_PowerBalance_RT(s2,t3) free
SOS
 s0:  S1 :: mu_Pmax_DA_GFPP(g1,t1):1 SOS1_Pmax_DA_GFPP(g1,t1):2
 s1:  S1 :: mu_Pmax_DA_GFPP(g2,t1):1 SOS1_Pmax_DA_GFPP(g2,t1):2
 s2:  S1 :: mu_Pmax_DA_GFPP(g1,t2):1 SOS1_Pmax_DA_GFPP(g1,t2):2
 s3:  S1 :: mu_Pmax_DA_GFPP(g2,t2):1 SOS1_Pmax_DA_GFPP(g2,t2):2
 s4:  S1 :: mu_Pmax_DA_GFPP(g1,t3):1 SOS1_Pmax_DA_GFPP(g1,t3):2
 s5:  S1 :: mu_Pmax_DA_GFPP(g2,t3):1 SOS1_Pmax_DA_GFPP(g2,t3):2
 s6:  S1 :: mu_Pmin_DA_GFPP(g1,t1):1 SOS1_Pmin_DA_GFPP(g1,t1):2
 s7:  S1 :: mu_Pmin_DA(g2,t1):1 SOS1_Pmin_DA(g2,t1):2
 s8:  S1 :: mu_Pmin_DA_GFPP(g1,t2):1 SOS1_Pmin_DA_GFPP(g1,t2):2
 s9:  S1 :: mu_Pmin_DA(g2,t2):1 SOS1_Pmin_DA(g2,t2):2
 s10:  S1 :: mu_Pmin_DA_GFPP(g1,t3):1 SOS1_Pmin_DA_GFPP(g1,t3):2
 s11:  S1 :: mu_Pmin_DA(g2,t3):1 SOS1_Pmin_DA(g2,t3):2
 s12:  S1 :: mu_Wind_Max_DA(w1,t1):1 SOS1_Wind_Max_DA(w1,t1):2
 s13:  S1 :: mu_Wind_Max_DA(w1,t2):1 SOS1_Wind_Max_DA(w1,t2):2
 s14:  S1 :: mu_Wind_Max_DA(w1,t3):1 SOS1_Wind_Max_DA(w1,t3):2
 s15:  S1 :: mu_PgenSCmax(g1,t1):1 SOS1_PgenSCmax(g1,t1):2
 s16:  S1 :: mu_PgenSCmin(g1,t1):1 SOS1_PgenSCmin(g1,t1):2
 s17:  S1 :: mu_RCupSCmax(g1,t1):1 SOS1_RCupSCmax(g1,t1):2
 s18:  S1 :: mu_RCdnSCmin(g1,t1):1 SOS1_RCdnSCmin(g1,t1):2
 s19:  S1 :: mu_PgenSCmax(g1,t2):1 SOS1_PgenSCmax(g1,t2):2
 s20:  S1 :: mu_PgenSCmin(g1,t2):1 SOS1_PgenSCmin(g1,t2):2
 s21:  S1 :: mu_RCupSCmax(g1,t2):1 SOS1_RCupSCmax(g1,t2):2
 s22:  S1 :: mu_RCdnSCmin(g1,t2):1 SOS1_RCdnSCmin(g1,t2):2
 s23:  S1 :: mu_PgenSCmax(g1,t3):1 SOS1_PgenSCmax(g1,t3):2
 s24:  S1 :: mu_PgenSCmin(g1,t3):1 SOS1_PgenSCmin(g1,t3):2
 s25:  S1 :: mu_RCupSCmax(g1,t3):1 SOS1_RCupSCmax(g1,t3):2
 s26:  S1 :: mu_RCdnSCmin(g1,t3):1 SOS1_RCdnSCmin(g1,t3):2
 s27:  S1 :: mu_RegUp_max_RT(g1,s1,t1):1 SOS1_RegUp_max_RT(g1,s1,t1):2
 s28:  S1 :: mu_RegDown_max_RT(g1,s1,t1):1 SOS1_RegDown_max_RT(g1,s1,t1):2
 s29:  S1 :: mu_RegUp_max_RT(g2,s1,t1):1 SOS1_RegUp_max_RT(g2,s1,t1):2
 s30:  S1 :: mu_RegDown_max_RT(g2,s1,t1):1 SOS1_RegDown_max_RT(g2,s1,t1):2
 s31:  S1 :: mu_RegUp_max_RT(g1,s1,t2):1 SOS1_RegUp_max_RT(g1,s1,t2):2
 s32:  S1 :: mu_RegDown_max_RT(g1,s1,t2):1 SOS1_RegDown_max_RT(g1,s1,t2):2
 s33:  S1 :: mu_RegUp_max_RT(g2,s1,t2):1 SOS1_RegUp_max_RT(g2,s1,t2):2
 s34:  S1 :: mu_RegDown_max_RT(g2,s1,t2):1 SOS1_RegDown_max_RT(g2,s1,t2):2
 s35:  S1 :: mu_RegUp_max_RT(g1,s1,t3):1 SOS1_RegUp_max_RT(g1,s1,t3):2
 s36:  S1 :: mu_RegDown_max_RT(g1,s1,t3):1 SOS1_RegDown_max_RT(g1,s1,t3):2
 s37:  S1 :: mu_RegUp_max_RT(g2,s1,t3):1 SOS1_RegUp_max_RT(g2,s1,t3):2
 s38:  S1 :: mu_RegDown_max_RT(g2,s1,t3):1 SOS1_RegDown_max_RT(g2,s1,t3):2
 s39:  S1 :: mu_RegUp_max_RT(g1,s2,t1):1 SOS1_RegUp_max_RT(g1,s2,t1):2
 s40:  S1 :: mu_RegDown_max_RT(g1,s2,t1):1 SOS1_RegDown_max_RT(g1,s2,t1):2
 s41:  S1 :: mu_RegUp_max_RT(g2,s2,t1):1 SOS1_RegUp_max_RT(g2,s2,t1):2
 s42:  S1 :: mu_RegDown_max_RT(g2,s2,t1):1 SOS1_RegDown_max_RT(g2,s2,t1):2
 s43:  S1 :: mu_RegUp_max_RT(g1,s2,t2):1 SOS1_RegUp_max_RT(g1,s2,t2):2
 s44:  S1 :: mu_RegDown_max_RT(g1,s2,t2):1 SOS1_RegDown_max_RT(g1,s2,t2):2
 s45:  S1 :: mu_RegUp_max_RT(g2,s2,t2):1 SOS1_RegUp_max_RT(g2,s2,t2):2
 s46:  S1 :: mu_RegDown_max_RT(g2,s2,t2):1 SOS1_RegDown_max_RT(g2,s2,t2):2
 s47:  S1 :: mu_RegUp_max_RT(g1,s2,t3):1 SOS1_RegUp_max_RT(g1,s2,t3):2
 s48:  S1 :: mu_RegDown_max_RT(g1,s2,t3):1 SOS1_RegDown_max_RT(g1,s2,t3):2
 s49:  S1 :: mu_RegUp_max_RT(g2,s2,t3):1 SOS1_RegUp_max_RT(g2,s2,t3):2
 s50:  S1 :: mu_RegDown_max_RT(g2,s2,t3):1 SOS1_RegDown_max_RT(g2,s2,t3):2
 s51:  S1 :: mu_RegUpSC_max_RT(g1,s1,t1):1 SOS1_RegUpSC_max_RT(g1,s1,t1):2
 s52:  S1 :: mu_RegDnSC_max_RT(g1,s1,t1):1 SOS1_RegDnSC_max_RT(g1,s1,t1):2
 s53:  S1 :: mu_RegUpSC_max_RT(g1,s1,t2):1 SOS1_RegUpSC_max_RT(g1,s1,t2):2
 s54:  S1 :: mu_RegDnSC_max_RT(g1,s1,t2):1 SOS1_RegDnSC_max_RT(g1,s1,t2):2
 s55:  S1 :: mu_RegUpSC_max_RT(g1,s1,t3):1 SOS1_RegUpSC_max_RT(g1,s1,t3):2
 s56:  S1 :: mu_RegDnSC_max_RT(g1,s1,t3):1 SOS1_RegDnSC_max_RT(g1,s1,t3):2
 s57:  S1 :: mu_RegUpSC_max_RT(g1,s2,t1):1 SOS1_RegUpSC_max_RT(g1,s2,t1):2
 s58:  S1 :: mu_RegDnSC_max_RT(g1,s2,t1):1 SOS1_RegDnSC_max_RT(g1,s2,t1):2
 s59:  S1 :: mu_RegUpSC_max_RT(g1,s2,t2):1 SOS1_RegUpSC_max_RT(g1,s2,t2):2
 s60:  S1 :: mu_RegDnSC_max_RT(g1,s2,t2):1 SOS1_RegDnSC_max_RT(g1,s2,t2):2
 s61:  S1 :: mu_RegUpSC_max_RT(g1,s2,t3):1 SOS1_RegUpSC_max_RT(g1,s2,t3):2
 s62:  S1 :: mu_RegDnSC_max_RT(g1,s2,t3):1 SOS1_RegDnSC_max_RT(g1,s2,t3):2
 s63:  S1 :: mu_Max_load_shed_RT(s1,t1):1 SOS1_Max_load_shed_RT(s1,t1):2
 s64:  S1 :: mu_Max_load_shed_RT(s1,t2):1 SOS1_Max_load_shed_RT(s1,t2):2
 s65:  S1 :: mu_Max_load_shed_RT(s1,t3):1 SOS1_Max_load_shed_RT(s1,t3):2
 s66:  S1 :: mu_Max_load_shed_RT(s2,t1):1 SOS1_Max_load_shed_RT(s2,t1):2
 s67:  S1 :: mu_Max_load_shed_RT(s2,t2):1 SOS1_Max_load_shed_RT(s2,t2):2
 s68:  S1 :: mu_Max_load_shed_RT(s2,t3):1 SOS1_Max_load_shed_RT(s2,t3):2
 s69:  S1 :: mu_Max_wind_spill_RT(w1,s1,t1):1
     SOS1_Max_wind_spill_RT(w1,s1,t1):2
 s70:  S1 :: mu_Max_wind_spill_RT(w1,s1,t2):1
     SOS1_Max_wind_spill_RT(w1,s1,t2):2
 s71:  S1 :: mu_Max_wind_spill_RT(w1,s1,t3):1
     SOS1_Max_wind_spill_RT(w1,s1,t3):2
 s72:  S1 :: mu_Max_wind_spill_RT(w1,s2,t1):1
     SOS1_Max_wind_spill_RT(w1,s2,t1):2
 s73:  S1 :: mu_Max_wind_spill_RT(w1,s2,t2):1
     SOS1_Max_wind_spill_RT(w1,s2,t2):2
 s74:  S1 :: mu_Max_wind_spill_RT(w1,s2,t3):1
     SOS1_Max_wind_spill_RT(w1,s2,t3):2
 s75:  S1 :: muLB_Pgen(g1,t1):1 SOS1_LB_Pgen(g1,t1):2
 s76:  S1 :: muLB_Pgen(g1,t2):1 SOS1_LB_Pgen(g1,t2):2
 s77:  S1 :: muLB_Pgen(g1,t3):1 SOS1_LB_Pgen(g1,t3):2
 s78:  S1 :: muLB_Pgen(g2,t1):1 SOS1_LB_Pgen(g2,t1):2
 s79:  S1 :: muLB_Pgen(g2,t2):1 SOS1_LB_Pgen(g2,t2):2
 s80:  S1 :: muLB_Pgen(g2,t3):1 SOS1_LB_Pgen(g2,t3):2
 s81:  S1 :: muLB_PgenSC(g1,t1):1 SOS1_LB_PgenSC(g1,t1):2
 s82:  S1 :: muLB_PgenSC(g1,t2):1 SOS1_LB_PgenSC(g1,t2):2
 s83:  S1 :: muLB_PgenSC(g1,t3):1 SOS1_LB_PgenSC(g1,t3):2
 s84:  S1 :: muLB_RCup(g1,t1):1 SOS1_LB_RCup(g1,t1):2
 s85:  S1 :: muLB_RCup(g1,t2):1 SOS1_LB_RCup(g1,t2):2
 s86:  S1 :: muLB_RCup(g1,t3):1 SOS1_LB_RCup(g1,t3):2
 s87:  S1 :: muLB_RCup(g2,t1):1 SOS1_LB_RCup(g2,t1):2
 s88:  S1 :: muLB_RCup(g2,t2):1 SOS1_LB_RCup(g2,t2):2
 s89:  S1 :: muLB_RCup(g2,t3):1 SOS1_LB_RCup(g2,t3):2
 s90:  S1 :: muLB_RCdn(g1,t1):1 SOS1_LB_RCdn(g1,t1):2
 s91:  S1 :: muLB_RCdn(g1,t2):1 SOS1_LB_RCdn(g1,t2):2
 s92:  S1 :: muLB_RCdn(g1,t3):1 SOS1_LB_RCdn(g1,t3):2
 s93:  S1 :: muLB_RCdn(g2,t1):1 SOS1_LB_RCdn(g2,t1):2
 s94:  S1 :: muLB_RCdn(g2,t2):1 SOS1_LB_RCdn(g2,t2):2
 s95:  S1 :: muLB_RCdn(g2,t3):1 SOS1_LB_RCdn(g2,t3):2
 s96:  S1 :: muLB_RCupSC(g1,t1):1 SOS1_LB_RCupSC(g1,t1):2
 s97:  S1 :: muLB_RCupSC(g1,t2):1 SOS1_LB_RCupSC(g1,t2):2
 s98:  S1 :: muLB_RCupSC(g1,t3):1 SOS1_LB_RCupSC(g1,t3):2
 s99:  S1 :: muLB_RCdnSC(g1,t1):1 SOS1_LB_RCdnSC(g1,t1):2
 s100:  S1 :: muLB_RCdnSC(g1,t2):1 SOS1_LB_RCdnSC(g1,t2):2
 s101:  S1 :: muLB_RCdnSC(g1,t3):1 SOS1_LB_RCdnSC(g1,t3):2
 s102:  S1 :: muLB_WindDA(w1,t1):1 SOS1_LB_WindDA(w1,t1):2
 s103:  S1 :: muLB_WindDA(w1,t2):1 SOS1_LB_WindDA(w1,t2):2
 s104:  S1 :: muLB_WindDA(w1,t3):1 SOS1_LB_WindDA(w1,t3):2
 s105:  S1 :: muLB_RUp(g1,s1,t1):1 SOS1_LB_RUp(g1,s1,t1):2
 s106:  S1 :: muLB_RDn(g1,s1,t1):1 SOS1_LB_RDn(g1,s1,t1):2
 s107:  S1 :: muLB_RUp(g2,s1,t1):1 SOS1_LB_RUp(g2,s1,t1):2
 s108:  S1 :: muLB_RDn(g2,s1,t1):1 SOS1_LB_RDn(g2,s1,t1):2
 s109:  S1 :: muLB_RUpSC(g1,s1,t1):1 SOS1_LB_RUpSC(g1,s1,t1):2
 s110:  S1 :: muLB_RDnSC(g1,s1,t1):1 SOS1_LB_RDnSC(g1,s1,t1):2
 s111:  S1 :: muLB_Wspill(w1,s1,t1):1 SOS1_LB_Wspill(w1,s1,t1):2
 s112:  S1 :: muLB_Lshed(s1,t1):1 SOS1_LB_Lshed(s1,t1):2
 s113:  S1 :: muLB_RUp(g1,s1,t2):1 SOS1_LB_RUp(g1,s1,t2):2
 s114:  S1 :: muLB_RDn(g1,s1,t2):1 SOS1_LB_RDn(g1,s1,t2):2
 s115:  S1 :: muLB_RUp(g2,s1,t2):1 SOS1_LB_RUp(g2,s1,t2):2
 s116:  S1 :: muLB_RDn(g2,s1,t2):1 SOS1_LB_RDn(g2,s1,t2):2
 s117:  S1 :: muLB_RUpSC(g1,s1,t2):1 SOS1_LB_RUpSC(g1,s1,t2):2
 s118:  S1 :: muLB_RDnSC(g1,s1,t2):1 SOS1_LB_RDnSC(g1,s1,t2):2
 s119:  S1 :: muLB_Wspill(w1,s1,t2):1 SOS1_LB_Wspill(w1,s1,t2):2
 s120:  S1 :: muLB_Lshed(s1,t2):1 SOS1_LB_Lshed(s1,t2):2
 s121:  S1 :: muLB_RUp(g1,s1,t3):1 SOS1_LB_RUp(g1,s1,t3):2
 s122:  S1 :: muLB_RDn(g1,s1,t3):1 SOS1_LB_RDn(g1,s1,t3):2
 s123:  S1 :: muLB_RUp(g2,s1,t3):1 SOS1_LB_RUp(g2,s1,t3):2
 s124:  S1 :: muLB_RDn(g2,s1,t3):1 SOS1_LB_RDn(g2,s1,t3):2
 s125:  S1 :: muLB_RUpSC(g1,s1,t3):1 SOS1_LB_RUpSC(g1,s1,t3):2
 s126:  S1 :: muLB_RDnSC(g1,s1,t3):1 SOS1_LB_RDnSC(g1,s1,t3):2
 s127:  S1 :: muLB_Wspill(w1,s1,t3):1 SOS1_LB_Wspill(w1,s1,t3):2
 s128:  S1 :: muLB_Lshed(s1,t3):1 SOS1_LB_Lshed(s1,t3):2
 s129:  S1 :: muLB_RUp(g1,s2,t1):1 SOS1_LB_RUp(g1,s2,t1):2
 s130:  S1 :: muLB_RDn(g1,s2,t1):1 SOS1_LB_RDn(g1,s2,t1):2
 s131:  S1 :: muLB_RUp(g2,s2,t1):1 SOS1_LB_RUp(g2,s2,t1):2
 s132:  S1 :: muLB_RDn(g2,s2,t1):1 SOS1_LB_RDn(g2,s2,t1):2
 s133:  S1 :: muLB_RUpSC(g1,s2,t1):1 SOS1_LB_RUpSC(g1,s2,t1):2
 s134:  S1 :: muLB_RDnSC(g1,s2,t1):1 SOS1_LB_RDnSC(g1,s2,t1):2
 s135:  S1 :: muLB_Wspill(w1,s2,t1):1 SOS1_LB_Wspill(w1,s2,t1):2
 s136:  S1 :: muLB_Lshed(s2,t1):1 SOS1_LB_Lshed(s2,t1):2
 s137:  S1 :: muLB_RUp(g1,s2,t2):1 SOS1_LB_RUp(g1,s2,t2):2
 s138:  S1 :: muLB_RDn(g1,s2,t2):1 SOS1_LB_RDn(g1,s2,t2):2
 s139:  S1 :: muLB_RUp(g2,s2,t2):1 SOS1_LB_RUp(g2,s2,t2):2
 s140:  S1 :: muLB_RDn(g2,s2,t2):1 SOS1_LB_RDn(g2,s2,t2):2
 s141:  S1 :: muLB_RUpSC(g1,s2,t2):1 SOS1_LB_RUpSC(g1,s2,t2):2
 s142:  S1 :: muLB_RDnSC(g1,s2,t2):1 SOS1_LB_RDnSC(g1,s2,t2):2
 s143:  S1 :: muLB_Wspill(w1,s2,t2):1 SOS1_LB_Wspill(w1,s2,t2):2
 s144:  S1 :: muLB_Lshed(s2,t2):1 SOS1_LB_Lshed(s2,t2):2
 s145:  S1 :: muLB_RUp(g1,s2,t3):1 SOS1_LB_RUp(g1,s2,t3):2
 s146:  S1 :: muLB_RDn(g1,s2,t3):1 SOS1_LB_RDn(g1,s2,t3):2
 s147:  S1 :: muLB_RUp(g2,s2,t3):1 SOS1_LB_RUp(g2,s2,t3):2
 s148:  S1 :: muLB_RDn(g2,s2,t3):1 SOS1_LB_RDn(g2,s2,t3):2
 s149:  S1 :: muLB_RUpSC(g1,s2,t3):1 SOS1_LB_RUpSC(g1,s2,t3):2
 s150:  S1 :: muLB_RDnSC(g1,s2,t3):1 SOS1_LB_RDnSC(g1,s2,t3):2
 s151:  S1 :: muLB_Wspill(w1,s2,t3):1 SOS1_LB_Wspill(w1,s2,t3):2
 s152:  S1 :: muLB_Lshed(s2,t3):1 SOS1_LB_Lshed(s2,t3):2
End
