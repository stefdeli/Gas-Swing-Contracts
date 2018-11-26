\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  8.4 RUp(g1,s1,t1) - 8.4 RDn(g1,s1,t1) + 100 RUp(g2,s1,t1)
   - 100 RDn(g2,s1,t1) + 16 RUpSC(g1,s1,t1) - 16 RDnSC(g1,s1,t1)
   + 500 Lshed(s1,t1) + 8.4 RUp(g1,s1,t2) - 8.4 RDn(g1,s1,t2)
   + 100 RUp(g2,s1,t2) - 100 RDn(g2,s1,t2) + 16 RUpSC(g1,s1,t2)
   - 16 RDnSC(g1,s1,t2) + 500 Lshed(s1,t2) + 8.4 RUp(g1,s1,t3)
   - 8.4 RDn(g1,s1,t3) + 100 RUp(g2,s1,t3) - 100 RDn(g2,s1,t3)
   + 16 RUpSC(g1,s1,t3) - 16 RDnSC(g1,s1,t3) + 500 Lshed(s1,t3)
   + 8.4 RUp(g1,s2,t1) - 8.4 RDn(g1,s2,t1) + 100 RUp(g2,s2,t1)
   - 100 RDn(g2,s2,t1) + 16 RUpSC(g1,s2,t1) - 16 RDnSC(g1,s2,t1)
   + 500 Lshed(s2,t1) + 8.4 RUp(g1,s2,t2) - 8.4 RDn(g1,s2,t2)
   + 100 RUp(g2,s2,t2) - 100 RDn(g2,s2,t2) + 16 RUpSC(g1,s2,t2)
   - 16 RDnSC(g1,s2,t2) + 500 Lshed(s2,t2) + 8.4 RUp(g1,s2,t3)
   - 8.4 RDn(g1,s2,t3) + 100 RUp(g2,s2,t3) - 100 RDn(g2,s2,t3)
   + 16 RUpSC(g1,s2,t3) - 16 RDnSC(g1,s2,t3) + 500 Lshed(s2,t3)
Subject To
 PowerBalance_RT(s1,t1): RUp(g1,s1,t1) - RDn(g1,s1,t1) + RUp(g2,s1,t1)
   - RDn(g2,s1,t1) + RUpSC(g1,s1,t1) - RDnSC(g1,s1,t1) - Wspill(w1,s1,t1)
   + Lshed(s1,t1) = -15
 PowerBalance_RT(s1,t2): RUp(g1,s1,t2) - RDn(g1,s1,t2) + RUp(g2,s1,t2)
   - RDn(g2,s1,t2) + RUpSC(g1,s1,t2) - RDnSC(g1,s1,t2) - Wspill(w1,s1,t2)
   + Lshed(s1,t2) = -20
 PowerBalance_RT(s1,t3): RUp(g1,s1,t3) - RDn(g1,s1,t3) + RUp(g2,s1,t3)
   - RDn(g2,s1,t3) + RUpSC(g1,s1,t3) - RDnSC(g1,s1,t3) - Wspill(w1,s1,t3)
   + Lshed(s1,t3) = -1
 PowerBalance_RT(s2,t1): RUp(g1,s2,t1) - RDn(g1,s2,t1) + RUp(g2,s2,t1)
   - RDn(g2,s2,t1) + RUpSC(g1,s2,t1) - RDnSC(g1,s2,t1) - Wspill(w1,s2,t1)
   + Lshed(s2,t1) = -15
 PowerBalance_RT(s2,t2): RUp(g1,s2,t2) - RDn(g1,s2,t2) + RUp(g2,s2,t2)
   - RDn(g2,s2,t2) + RUpSC(g1,s2,t2) - RDnSC(g1,s2,t2) - Wspill(w1,s2,t2)
   + Lshed(s2,t2) = -20
 PowerBalance_RT(s2,t3): RUp(g1,s2,t3) - RDn(g1,s2,t3) + RUp(g2,s2,t3)
   - RDn(g2,s2,t3) + RUpSC(g1,s2,t3) - RDnSC(g1,s2,t3) - Wspill(w1,s2,t3)
   + Lshed(s2,t3) = -1
 RegUp_max_RT(g1,s1,t1): RUp(g1,s1,t1) <= 100
 RegDown_max_RT(g1,s1,t1): RDn(g1,s1,t1) <= 50
 RegUp_max_RT(g2,s1,t1): RUp(g2,s1,t1) <= 0
 RegDown_max_RT(g2,s1,t1): RDn(g2,s1,t1) <= 0
 RegUp_max_RT(g1,s1,t2): RUp(g1,s1,t2) <= 100
 RegDown_max_RT(g1,s1,t2): RDn(g1,s1,t2) <= 50
 RegUp_max_RT(g2,s1,t2): RUp(g2,s1,t2) <= 0
 RegDown_max_RT(g2,s1,t2): RDn(g2,s1,t2) <= 0
 RegUp_max_RT(g1,s1,t3): RUp(g1,s1,t3) <= 100
 RegDown_max_RT(g1,s1,t3): RDn(g1,s1,t3) <= 50
 RegUp_max_RT(g2,s1,t3): RUp(g2,s1,t3) <= 0
 RegDown_max_RT(g2,s1,t3): RDn(g2,s1,t3) <= 0
 RegUp_max_RT(g1,s2,t1): RUp(g1,s2,t1) <= 100
 RegDown_max_RT(g1,s2,t1): RDn(g1,s2,t1) <= 50
 RegUp_max_RT(g2,s2,t1): RUp(g2,s2,t1) <= 0
 RegDown_max_RT(g2,s2,t1): RDn(g2,s2,t1) <= 0
 RegUp_max_RT(g1,s2,t2): RUp(g1,s2,t2) <= 100
 RegDown_max_RT(g1,s2,t2): RDn(g1,s2,t2) <= 50
 RegUp_max_RT(g2,s2,t2): RUp(g2,s2,t2) <= 0
 RegDown_max_RT(g2,s2,t2): RDn(g2,s2,t2) <= 0
 RegUp_max_RT(g1,s2,t3): RUp(g1,s2,t3) <= 100
 RegDown_max_RT(g1,s2,t3): RDn(g1,s2,t3) <= 50
 RegUp_max_RT(g2,s2,t3): RUp(g2,s2,t3) <= 0
 RegDown_max_RT(g2,s2,t3): RDn(g2,s2,t3) <= 0
 RegUpSC_max_RT(g1,s1,t1): RUpSC(g1,s1,t1) <= 0
 RegDnSC_max_RT(g1,s1,t1): RDnSC(g1,s1,t1) <= 0
 RegUpSC_max_RT(g1,s1,t2): RUpSC(g1,s1,t2) <= 0
 RegDnSC_max_RT(g1,s1,t2): RDnSC(g1,s1,t2) <= 0
 RegUpSC_max_RT(g1,s1,t3): RUpSC(g1,s1,t3) <= 0
 RegDnSC_max_RT(g1,s1,t3): RDnSC(g1,s1,t3) <= 0
 RegUpSC_max_RT(g1,s2,t1): RUpSC(g1,s2,t1) <= 0
 RegDnSC_max_RT(g1,s2,t1): RDnSC(g1,s2,t1) <= 0
 RegUpSC_max_RT(g1,s2,t2): RUpSC(g1,s2,t2) <= 0
 RegDnSC_max_RT(g1,s2,t2): RDnSC(g1,s2,t2) <= 0
 RegUpSC_max_RT(g1,s2,t3): RUpSC(g1,s2,t3) <= 0
 RegDnSC_max_RT(g1,s2,t3): RDnSC(g1,s2,t3) <= 0
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
 SOS1_RegUp_max_RT(g1,s1,t1): RUp(g1,s1,t1) + SOS1_RegUp_max_RT(g1,s1,t1)
   = 100
 SOS1_RegDown_max_RT(g1,s1,t1): RDn(g1,s1,t1)
   + SOS1_RegDown_max_RT(g1,s1,t1) = 50
 SOS1_RegUp_max_RT(g2,s1,t1): RUp(g2,s1,t1) + SOS1_RegUp_max_RT(g2,s1,t1)
   = 0
 SOS1_RegDown_max_RT(g2,s1,t1): RDn(g2,s1,t1)
   + SOS1_RegDown_max_RT(g2,s1,t1) = 0
 SOS1_RegUp_max_RT(g1,s1,t2): RUp(g1,s1,t2) + SOS1_RegUp_max_RT(g1,s1,t2)
   = 100
 SOS1_RegDown_max_RT(g1,s1,t2): RDn(g1,s1,t2)
   + SOS1_RegDown_max_RT(g1,s1,t2) = 50
 SOS1_RegUp_max_RT(g2,s1,t2): RUp(g2,s1,t2) + SOS1_RegUp_max_RT(g2,s1,t2)
   = 0
 SOS1_RegDown_max_RT(g2,s1,t2): RDn(g2,s1,t2)
   + SOS1_RegDown_max_RT(g2,s1,t2) = 0
 SOS1_RegUp_max_RT(g1,s1,t3): RUp(g1,s1,t3) + SOS1_RegUp_max_RT(g1,s1,t3)
   = 100
 SOS1_RegDown_max_RT(g1,s1,t3): RDn(g1,s1,t3)
   + SOS1_RegDown_max_RT(g1,s1,t3) = 50
 SOS1_RegUp_max_RT(g2,s1,t3): RUp(g2,s1,t3) + SOS1_RegUp_max_RT(g2,s1,t3)
   = 0
 SOS1_RegDown_max_RT(g2,s1,t3): RDn(g2,s1,t3)
   + SOS1_RegDown_max_RT(g2,s1,t3) = 0
 SOS1_RegUp_max_RT(g1,s2,t1): RUp(g1,s2,t1) + SOS1_RegUp_max_RT(g1,s2,t1)
   = 100
 SOS1_RegDown_max_RT(g1,s2,t1): RDn(g1,s2,t1)
   + SOS1_RegDown_max_RT(g1,s2,t1) = 50
 SOS1_RegUp_max_RT(g2,s2,t1): RUp(g2,s2,t1) + SOS1_RegUp_max_RT(g2,s2,t1)
   = 0
 SOS1_RegDown_max_RT(g2,s2,t1): RDn(g2,s2,t1)
   + SOS1_RegDown_max_RT(g2,s2,t1) = 0
 SOS1_RegUp_max_RT(g1,s2,t2): RUp(g1,s2,t2) + SOS1_RegUp_max_RT(g1,s2,t2)
   = 100
 SOS1_RegDown_max_RT(g1,s2,t2): RDn(g1,s2,t2)
   + SOS1_RegDown_max_RT(g1,s2,t2) = 50
 SOS1_RegUp_max_RT(g2,s2,t2): RUp(g2,s2,t2) + SOS1_RegUp_max_RT(g2,s2,t2)
   = 0
 SOS1_RegDown_max_RT(g2,s2,t2): RDn(g2,s2,t2)
   + SOS1_RegDown_max_RT(g2,s2,t2) = 0
 SOS1_RegUp_max_RT(g1,s2,t3): RUp(g1,s2,t3) + SOS1_RegUp_max_RT(g1,s2,t3)
   = 100
 SOS1_RegDown_max_RT(g1,s2,t3): RDn(g1,s2,t3)
   + SOS1_RegDown_max_RT(g1,s2,t3) = 50
 SOS1_RegUp_max_RT(g2,s2,t3): RUp(g2,s2,t3) + SOS1_RegUp_max_RT(g2,s2,t3)
   = 0
 SOS1_RegDown_max_RT(g2,s2,t3): RDn(g2,s2,t3)
   + SOS1_RegDown_max_RT(g2,s2,t3) = 0
 SOS1_RegUpSC_max_RT(g1,s1,t1): RUpSC(g1,s1,t1)
   + SOS1_RegUpSC_max_RT(g1,s1,t1) = 0
 SOS1_RegDnSC_max_RT(g1,s1,t1): RDnSC(g1,s1,t1)
   + SOS1_RegDnSC_max_RT(g1,s1,t1) = 0
 SOS1_RegUpSC_max_RT(g1,s1,t2): RUpSC(g1,s1,t2)
   + SOS1_RegUpSC_max_RT(g1,s1,t2) = 0
 SOS1_RegDnSC_max_RT(g1,s1,t2): RDnSC(g1,s1,t2)
   + SOS1_RegDnSC_max_RT(g1,s1,t2) = 0
 SOS1_RegUpSC_max_RT(g1,s1,t3): RUpSC(g1,s1,t3)
   + SOS1_RegUpSC_max_RT(g1,s1,t3) = 0
 SOS1_RegDnSC_max_RT(g1,s1,t3): RDnSC(g1,s1,t3)
   + SOS1_RegDnSC_max_RT(g1,s1,t3) = 0
 SOS1_RegUpSC_max_RT(g1,s2,t1): RUpSC(g1,s2,t1)
   + SOS1_RegUpSC_max_RT(g1,s2,t1) = 0
 SOS1_RegDnSC_max_RT(g1,s2,t1): RDnSC(g1,s2,t1)
   + SOS1_RegDnSC_max_RT(g1,s2,t1) = 0
 SOS1_RegUpSC_max_RT(g1,s2,t2): RUpSC(g1,s2,t2)
   + SOS1_RegUpSC_max_RT(g1,s2,t2) = 0
 SOS1_RegDnSC_max_RT(g1,s2,t2): RDnSC(g1,s2,t2)
   + SOS1_RegDnSC_max_RT(g1,s2,t2) = 0
 SOS1_RegUpSC_max_RT(g1,s2,t3): RUpSC(g1,s2,t3)
   + SOS1_RegUpSC_max_RT(g1,s2,t3) = 0
 SOS1_RegDnSC_max_RT(g1,s2,t3): RDnSC(g1,s2,t3)
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
 lambda_PowerBalance_RT(s1,t1) free
 lambda_PowerBalance_RT(s1,t2) free
 lambda_PowerBalance_RT(s1,t3) free
 lambda_PowerBalance_RT(s2,t1) free
 lambda_PowerBalance_RT(s2,t2) free
 lambda_PowerBalance_RT(s2,t3) free
SOS
 s0:  S1 :: mu_RegUp_max_RT(g1,s1,t1):1 SOS1_RegUp_max_RT(g1,s1,t1):2
 s1:  S1 :: mu_RegDown_max_RT(g1,s1,t1):1 SOS1_RegDown_max_RT(g1,s1,t1):2
 s2:  S1 :: mu_RegUp_max_RT(g2,s1,t1):1 SOS1_RegUp_max_RT(g2,s1,t1):2
 s3:  S1 :: mu_RegDown_max_RT(g2,s1,t1):1 SOS1_RegDown_max_RT(g2,s1,t1):2
 s4:  S1 :: mu_RegUp_max_RT(g1,s1,t2):1 SOS1_RegUp_max_RT(g1,s1,t2):2
 s5:  S1 :: mu_RegDown_max_RT(g1,s1,t2):1 SOS1_RegDown_max_RT(g1,s1,t2):2
 s6:  S1 :: mu_RegUp_max_RT(g2,s1,t2):1 SOS1_RegUp_max_RT(g2,s1,t2):2
 s7:  S1 :: mu_RegDown_max_RT(g2,s1,t2):1 SOS1_RegDown_max_RT(g2,s1,t2):2
 s8:  S1 :: mu_RegUp_max_RT(g1,s1,t3):1 SOS1_RegUp_max_RT(g1,s1,t3):2
 s9:  S1 :: mu_RegDown_max_RT(g1,s1,t3):1 SOS1_RegDown_max_RT(g1,s1,t3):2
 s10:  S1 :: mu_RegUp_max_RT(g2,s1,t3):1 SOS1_RegUp_max_RT(g2,s1,t3):2
 s11:  S1 :: mu_RegDown_max_RT(g2,s1,t3):1 SOS1_RegDown_max_RT(g2,s1,t3):2
 s12:  S1 :: mu_RegUp_max_RT(g1,s2,t1):1 SOS1_RegUp_max_RT(g1,s2,t1):2
 s13:  S1 :: mu_RegDown_max_RT(g1,s2,t1):1 SOS1_RegDown_max_RT(g1,s2,t1):2
 s14:  S1 :: mu_RegUp_max_RT(g2,s2,t1):1 SOS1_RegUp_max_RT(g2,s2,t1):2
 s15:  S1 :: mu_RegDown_max_RT(g2,s2,t1):1 SOS1_RegDown_max_RT(g2,s2,t1):2
 s16:  S1 :: mu_RegUp_max_RT(g1,s2,t2):1 SOS1_RegUp_max_RT(g1,s2,t2):2
 s17:  S1 :: mu_RegDown_max_RT(g1,s2,t2):1 SOS1_RegDown_max_RT(g1,s2,t2):2
 s18:  S1 :: mu_RegUp_max_RT(g2,s2,t2):1 SOS1_RegUp_max_RT(g2,s2,t2):2
 s19:  S1 :: mu_RegDown_max_RT(g2,s2,t2):1 SOS1_RegDown_max_RT(g2,s2,t2):2
 s20:  S1 :: mu_RegUp_max_RT(g1,s2,t3):1 SOS1_RegUp_max_RT(g1,s2,t3):2
 s21:  S1 :: mu_RegDown_max_RT(g1,s2,t3):1 SOS1_RegDown_max_RT(g1,s2,t3):2
 s22:  S1 :: mu_RegUp_max_RT(g2,s2,t3):1 SOS1_RegUp_max_RT(g2,s2,t3):2
 s23:  S1 :: mu_RegDown_max_RT(g2,s2,t3):1 SOS1_RegDown_max_RT(g2,s2,t3):2
 s24:  S1 :: mu_RegUpSC_max_RT(g1,s1,t1):1 SOS1_RegUpSC_max_RT(g1,s1,t1):2
 s25:  S1 :: mu_RegDnSC_max_RT(g1,s1,t1):1 SOS1_RegDnSC_max_RT(g1,s1,t1):2
 s26:  S1 :: mu_RegUpSC_max_RT(g1,s1,t2):1 SOS1_RegUpSC_max_RT(g1,s1,t2):2
 s27:  S1 :: mu_RegDnSC_max_RT(g1,s1,t2):1 SOS1_RegDnSC_max_RT(g1,s1,t2):2
 s28:  S1 :: mu_RegUpSC_max_RT(g1,s1,t3):1 SOS1_RegUpSC_max_RT(g1,s1,t3):2
 s29:  S1 :: mu_RegDnSC_max_RT(g1,s1,t3):1 SOS1_RegDnSC_max_RT(g1,s1,t3):2
 s30:  S1 :: mu_RegUpSC_max_RT(g1,s2,t1):1 SOS1_RegUpSC_max_RT(g1,s2,t1):2
 s31:  S1 :: mu_RegDnSC_max_RT(g1,s2,t1):1 SOS1_RegDnSC_max_RT(g1,s2,t1):2
 s32:  S1 :: mu_RegUpSC_max_RT(g1,s2,t2):1 SOS1_RegUpSC_max_RT(g1,s2,t2):2
 s33:  S1 :: mu_RegDnSC_max_RT(g1,s2,t2):1 SOS1_RegDnSC_max_RT(g1,s2,t2):2
 s34:  S1 :: mu_RegUpSC_max_RT(g1,s2,t3):1 SOS1_RegUpSC_max_RT(g1,s2,t3):2
 s35:  S1 :: mu_RegDnSC_max_RT(g1,s2,t3):1 SOS1_RegDnSC_max_RT(g1,s2,t3):2
 s36:  S1 :: mu_Max_load_shed_RT(s1,t1):1 SOS1_Max_load_shed_RT(s1,t1):2
 s37:  S1 :: mu_Max_load_shed_RT(s1,t2):1 SOS1_Max_load_shed_RT(s1,t2):2
 s38:  S1 :: mu_Max_load_shed_RT(s1,t3):1 SOS1_Max_load_shed_RT(s1,t3):2
 s39:  S1 :: mu_Max_load_shed_RT(s2,t1):1 SOS1_Max_load_shed_RT(s2,t1):2
 s40:  S1 :: mu_Max_load_shed_RT(s2,t2):1 SOS1_Max_load_shed_RT(s2,t2):2
 s41:  S1 :: mu_Max_load_shed_RT(s2,t3):1 SOS1_Max_load_shed_RT(s2,t3):2
 s42:  S1 :: mu_Max_wind_spill_RT(w1,s1,t1):1
     SOS1_Max_wind_spill_RT(w1,s1,t1):2
 s43:  S1 :: mu_Max_wind_spill_RT(w1,s1,t2):1
     SOS1_Max_wind_spill_RT(w1,s1,t2):2
 s44:  S1 :: mu_Max_wind_spill_RT(w1,s1,t3):1
     SOS1_Max_wind_spill_RT(w1,s1,t3):2
 s45:  S1 :: mu_Max_wind_spill_RT(w1,s2,t1):1
     SOS1_Max_wind_spill_RT(w1,s2,t1):2
 s46:  S1 :: mu_Max_wind_spill_RT(w1,s2,t2):1
     SOS1_Max_wind_spill_RT(w1,s2,t2):2
 s47:  S1 :: mu_Max_wind_spill_RT(w1,s2,t3):1
     SOS1_Max_wind_spill_RT(w1,s2,t3):2
 s48:  S1 :: muLB_RUp(g1,s1,t1):1 SOS1_LB_RUp(g1,s1,t1):2
 s49:  S1 :: muLB_RDn(g1,s1,t1):1 SOS1_LB_RDn(g1,s1,t1):2
 s50:  S1 :: muLB_RUp(g2,s1,t1):1 SOS1_LB_RUp(g2,s1,t1):2
 s51:  S1 :: muLB_RDn(g2,s1,t1):1 SOS1_LB_RDn(g2,s1,t1):2
 s52:  S1 :: muLB_RUpSC(g1,s1,t1):1 SOS1_LB_RUpSC(g1,s1,t1):2
 s53:  S1 :: muLB_RDnSC(g1,s1,t1):1 SOS1_LB_RDnSC(g1,s1,t1):2
 s54:  S1 :: muLB_Wspill(w1,s1,t1):1 SOS1_LB_Wspill(w1,s1,t1):2
 s55:  S1 :: muLB_Lshed(s1,t1):1 SOS1_LB_Lshed(s1,t1):2
 s56:  S1 :: muLB_RUp(g1,s1,t2):1 SOS1_LB_RUp(g1,s1,t2):2
 s57:  S1 :: muLB_RDn(g1,s1,t2):1 SOS1_LB_RDn(g1,s1,t2):2
 s58:  S1 :: muLB_RUp(g2,s1,t2):1 SOS1_LB_RUp(g2,s1,t2):2
 s59:  S1 :: muLB_RDn(g2,s1,t2):1 SOS1_LB_RDn(g2,s1,t2):2
 s60:  S1 :: muLB_RUpSC(g1,s1,t2):1 SOS1_LB_RUpSC(g1,s1,t2):2
 s61:  S1 :: muLB_RDnSC(g1,s1,t2):1 SOS1_LB_RDnSC(g1,s1,t2):2
 s62:  S1 :: muLB_Wspill(w1,s1,t2):1 SOS1_LB_Wspill(w1,s1,t2):2
 s63:  S1 :: muLB_Lshed(s1,t2):1 SOS1_LB_Lshed(s1,t2):2
 s64:  S1 :: muLB_RUp(g1,s1,t3):1 SOS1_LB_RUp(g1,s1,t3):2
 s65:  S1 :: muLB_RDn(g1,s1,t3):1 SOS1_LB_RDn(g1,s1,t3):2
 s66:  S1 :: muLB_RUp(g2,s1,t3):1 SOS1_LB_RUp(g2,s1,t3):2
 s67:  S1 :: muLB_RDn(g2,s1,t3):1 SOS1_LB_RDn(g2,s1,t3):2
 s68:  S1 :: muLB_RUpSC(g1,s1,t3):1 SOS1_LB_RUpSC(g1,s1,t3):2
 s69:  S1 :: muLB_RDnSC(g1,s1,t3):1 SOS1_LB_RDnSC(g1,s1,t3):2
 s70:  S1 :: muLB_Wspill(w1,s1,t3):1 SOS1_LB_Wspill(w1,s1,t3):2
 s71:  S1 :: muLB_Lshed(s1,t3):1 SOS1_LB_Lshed(s1,t3):2
 s72:  S1 :: muLB_RUp(g1,s2,t1):1 SOS1_LB_RUp(g1,s2,t1):2
 s73:  S1 :: muLB_RDn(g1,s2,t1):1 SOS1_LB_RDn(g1,s2,t1):2
 s74:  S1 :: muLB_RUp(g2,s2,t1):1 SOS1_LB_RUp(g2,s2,t1):2
 s75:  S1 :: muLB_RDn(g2,s2,t1):1 SOS1_LB_RDn(g2,s2,t1):2
 s76:  S1 :: muLB_RUpSC(g1,s2,t1):1 SOS1_LB_RUpSC(g1,s2,t1):2
 s77:  S1 :: muLB_RDnSC(g1,s2,t1):1 SOS1_LB_RDnSC(g1,s2,t1):2
 s78:  S1 :: muLB_Wspill(w1,s2,t1):1 SOS1_LB_Wspill(w1,s2,t1):2
 s79:  S1 :: muLB_Lshed(s2,t1):1 SOS1_LB_Lshed(s2,t1):2
 s80:  S1 :: muLB_RUp(g1,s2,t2):1 SOS1_LB_RUp(g1,s2,t2):2
 s81:  S1 :: muLB_RDn(g1,s2,t2):1 SOS1_LB_RDn(g1,s2,t2):2
 s82:  S1 :: muLB_RUp(g2,s2,t2):1 SOS1_LB_RUp(g2,s2,t2):2
 s83:  S1 :: muLB_RDn(g2,s2,t2):1 SOS1_LB_RDn(g2,s2,t2):2
 s84:  S1 :: muLB_RUpSC(g1,s2,t2):1 SOS1_LB_RUpSC(g1,s2,t2):2
 s85:  S1 :: muLB_RDnSC(g1,s2,t2):1 SOS1_LB_RDnSC(g1,s2,t2):2
 s86:  S1 :: muLB_Wspill(w1,s2,t2):1 SOS1_LB_Wspill(w1,s2,t2):2
 s87:  S1 :: muLB_Lshed(s2,t2):1 SOS1_LB_Lshed(s2,t2):2
 s88:  S1 :: muLB_RUp(g1,s2,t3):1 SOS1_LB_RUp(g1,s2,t3):2
 s89:  S1 :: muLB_RDn(g1,s2,t3):1 SOS1_LB_RDn(g1,s2,t3):2
 s90:  S1 :: muLB_RUp(g2,s2,t3):1 SOS1_LB_RUp(g2,s2,t3):2
 s91:  S1 :: muLB_RDn(g2,s2,t3):1 SOS1_LB_RDn(g2,s2,t3):2
 s92:  S1 :: muLB_RUpSC(g1,s2,t3):1 SOS1_LB_RUpSC(g1,s2,t3):2
 s93:  S1 :: muLB_RDnSC(g1,s2,t3):1 SOS1_LB_RDnSC(g1,s2,t3):2
 s94:  S1 :: muLB_Wspill(w1,s2,t3):1 SOS1_LB_Wspill(w1,s2,t3):2
 s95:  S1 :: muLB_Lshed(s2,t3):1 SOS1_LB_Lshed(s2,t3):2
End
