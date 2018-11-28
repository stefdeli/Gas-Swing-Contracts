\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  8.4 RUp(g1,s1,t1) - 8.4 RDn(g1,s1,t1) + 100 RUp(g2,s1,t1)
   - 100 RDn(g2,s1,t1) + 16 RUpSC(g1,s1,t1) - 16 RDnSC(g1,s1,t1)
   + 500 Lshed(s1,t1) + 8.4 RUp(g1,s1,t2) - 8.4 RDn(g1,s1,t2)
   + 100 RUp(g2,s1,t2) - 100 RDn(g2,s1,t2) + 16 RUpSC(g1,s1,t2)
   - 16 RDnSC(g1,s1,t2) + 500 Lshed(s1,t2) + 8.4 RUp(g1,s1,t3)
   - 8.4 RDn(g1,s1,t3) + 100 RUp(g2,s1,t3) - 100 RDn(g2,s1,t3)
   + 16 RUpSC(g1,s1,t3) - 16 RDnSC(g1,s1,t3) + 500 Lshed(s1,t3)
   + 16 RUp(g1,s1,t4) - 16 RDn(g1,s1,t4) + 100 RUp(g2,s1,t4)
   - 100 RDn(g2,s1,t4) + 16 RUpSC(g1,s1,t4) - 16 RDnSC(g1,s1,t4)
   + 500 Lshed(s1,t4) + 8.4 RUp(g1,s2,t1) - 8.4 RDn(g1,s2,t1)
   + 100 RUp(g2,s2,t1) - 100 RDn(g2,s2,t1) + 16 RUpSC(g1,s2,t1)
   - 16 RDnSC(g1,s2,t1) + 500 Lshed(s2,t1) + 8.4 RUp(g1,s2,t2)
   - 8.4 RDn(g1,s2,t2) + 100 RUp(g2,s2,t2) - 100 RDn(g2,s2,t2)
   + 16 RUpSC(g1,s2,t2) - 16 RDnSC(g1,s2,t2) + 500 Lshed(s2,t2)
   + 8.4 RUp(g1,s2,t3) - 8.4 RDn(g1,s2,t3) + 100 RUp(g2,s2,t3)
   - 100 RDn(g2,s2,t3) + 16 RUpSC(g1,s2,t3) - 16 RDnSC(g1,s2,t3)
   + 500 Lshed(s2,t3) + 16 RUp(g1,s2,t4) - 16 RDn(g1,s2,t4)
   + 100 RUp(g2,s2,t4) - 100 RDn(g2,s2,t4) + 16 RUpSC(g1,s2,t4)
   - 16 RDnSC(g1,s2,t4) + 500 Lshed(s2,t4)
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
 PowerBalance_RT(s1,t4): RUp(g1,s1,t4) - RDn(g1,s1,t4) + RUp(g2,s1,t4)
   - RDn(g2,s1,t4) + RUpSC(g1,s1,t4) - RDnSC(g1,s1,t4) - Wspill(w1,s1,t4)
   + Lshed(s1,t4) = -4.1253065
 PowerBalance_RT(s2,t1): RUp(g1,s2,t1) - RDn(g1,s2,t1) + RUp(g2,s2,t1)
   - RDn(g2,s2,t1) + RUpSC(g1,s2,t1) - RDnSC(g1,s2,t1) - Wspill(w1,s2,t1)
   + Lshed(s2,t1) = -15
 PowerBalance_RT(s2,t2): RUp(g1,s2,t2) - RDn(g1,s2,t2) + RUp(g2,s2,t2)
   - RDn(g2,s2,t2) + RUpSC(g1,s2,t2) - RDnSC(g1,s2,t2) - Wspill(w1,s2,t2)
   + Lshed(s2,t2) = -20
 PowerBalance_RT(s2,t3): RUp(g1,s2,t3) - RDn(g1,s2,t3) + RUp(g2,s2,t3)
   - RDn(g2,s2,t3) + RUpSC(g1,s2,t3) - RDnSC(g1,s2,t3) - Wspill(w1,s2,t3)
   + Lshed(s2,t3) = -1
 PowerBalance_RT(s2,t4): RUp(g1,s2,t4) - RDn(g1,s2,t4) + RUp(g2,s2,t4)
   - RDn(g2,s2,t4) + RUpSC(g1,s2,t4) - RDnSC(g1,s2,t4) - Wspill(w1,s2,t4)
   + Lshed(s2,t4) = -34.1498389
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
 RegUp_max_RT(g1,s1,t4): RUp(g1,s1,t4) <= 96.46446609
 RegDown_max_RT(g1,s1,t4): RDn(g1,s1,t4) <= 53.53553391
 RegUp_max_RT(g2,s1,t4): RUp(g2,s1,t4) <= 0
 RegDown_max_RT(g2,s1,t4): RDn(g2,s1,t4) <= 0
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
 RegUp_max_RT(g1,s2,t4): RUp(g1,s2,t4) <= 96.46446609
 RegDown_max_RT(g1,s2,t4): RDn(g1,s2,t4) <= 53.53553391
 RegUp_max_RT(g2,s2,t4): RUp(g2,s2,t4) <= 0
 RegDown_max_RT(g2,s2,t4): RDn(g2,s2,t4) <= 0
 RegUpSC_max_RT(g1,s1,t1): RUpSC(g1,s1,t1) <= 0
 RegDnSC_max_RT(g1,s1,t1): RDnSC(g1,s1,t1) <= 0
 RegUpSC_max_RT(g1,s1,t2): RUpSC(g1,s1,t2) <= 0
 RegDnSC_max_RT(g1,s1,t2): RDnSC(g1,s1,t2) <= 0
 RegUpSC_max_RT(g1,s1,t3): RUpSC(g1,s1,t3) <= 0
 RegDnSC_max_RT(g1,s1,t3): RDnSC(g1,s1,t3) <= 0
 RegUpSC_max_RT(g1,s1,t4): RUpSC(g1,s1,t4) <= 0
 RegDnSC_max_RT(g1,s1,t4): RDnSC(g1,s1,t4) <= 0
 RegUpSC_max_RT(g1,s2,t1): RUpSC(g1,s2,t1) <= 0
 RegDnSC_max_RT(g1,s2,t1): RDnSC(g1,s2,t1) <= 0
 RegUpSC_max_RT(g1,s2,t2): RUpSC(g1,s2,t2) <= 0
 RegDnSC_max_RT(g1,s2,t2): RDnSC(g1,s2,t2) <= 0
 RegUpSC_max_RT(g1,s2,t3): RUpSC(g1,s2,t3) <= 0
 RegDnSC_max_RT(g1,s2,t3): RDnSC(g1,s2,t3) <= 0
 RegUpSC_max_RT(g1,s2,t4): RUpSC(g1,s2,t4) <= 0
 RegDnSC_max_RT(g1,s2,t4): RDnSC(g1,s2,t4) <= 0
 Max_load_shed_RT(s1,t1): Lshed(s1,t1) <= 50
 Max_load_shed_RT(s1,t2): Lshed(s1,t2) <= 50
 Max_load_shed_RT(s1,t3): Lshed(s1,t3) <= 50
 Max_load_shed_RT(s1,t4): Lshed(s1,t4) <= 53.53553391
 Max_load_shed_RT(s2,t1): Lshed(s2,t1) <= 50
 Max_load_shed_RT(s2,t2): Lshed(s2,t2) <= 50
 Max_load_shed_RT(s2,t3): Lshed(s2,t3) <= 50
 Max_load_shed_RT(s2,t4): Lshed(s2,t4) <= 53.53553391
 Max_wind_spill_RT(w1,s1,t1): Wspill(w1,s1,t1) <= 15
 Max_wind_spill_RT(w1,s1,t2): Wspill(w1,s1,t2) <= 20
 Max_wind_spill_RT(w1,s1,t3): Wspill(w1,s1,t3) <= 1
 Max_wind_spill_RT(w1,s1,t4): Wspill(w1,s1,t4) <= 4.1253065
 Max_wind_spill_RT(w1,s2,t1): Wspill(w1,s2,t1) <= 15
 Max_wind_spill_RT(w1,s2,t2): Wspill(w1,s2,t2) <= 20
 Max_wind_spill_RT(w1,s2,t3): Wspill(w1,s2,t3) <= 1
 Max_wind_spill_RT(w1,s2,t4): Wspill(w1,s2,t4) <= 34.1498389
Bounds
End
