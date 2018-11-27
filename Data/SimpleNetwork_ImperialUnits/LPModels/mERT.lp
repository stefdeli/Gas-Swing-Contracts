\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  8.4 RUp(g1,s1,t1) - 8.4 RDn(g1,s1,t1) + 100 RUp(g2,s1,t1)
   - 100 RDn(g2,s1,t1) + 16 RUpSC(g1,s1,t1) - 16 RDnSC(g1,s1,t1)
   + 500 Lshed(s1,t1) + 8.4 RUp(g1,s2,t1) - 8.4 RDn(g1,s2,t1)
   + 100 RUp(g2,s2,t1) - 100 RDn(g2,s2,t1) + 16 RUpSC(g1,s2,t1)
   - 16 RDnSC(g1,s2,t1) + 500 Lshed(s2,t1)
Subject To
 PowerBalance_RT(s1,t1): RUp(g1,s1,t1) - RDn(g1,s1,t1) + RUp(g2,s1,t1)
   - RDn(g2,s1,t1) + RUpSC(g1,s1,t1) - RDnSC(g1,s1,t1) - Wspill(w1,s1,t1)
   + Lshed(s1,t1) = -15
 PowerBalance_RT(s2,t1): RUp(g1,s2,t1) - RDn(g1,s2,t1) + RUp(g2,s2,t1)
   - RDn(g2,s2,t1) + RUpSC(g1,s2,t1) - RDnSC(g1,s2,t1) - Wspill(w1,s2,t1)
   + Lshed(s2,t1) = -15
 RegUp_max_RT(g1,s1,t1): RUp(g1,s1,t1) <= 100
 RegDown_max_RT(g1,s1,t1): RDn(g1,s1,t1) <= 50
 RegUp_max_RT(g2,s1,t1): RUp(g2,s1,t1) <= 0
 RegDown_max_RT(g2,s1,t1): RDn(g2,s1,t1) <= 0
 RegUp_max_RT(g1,s2,t1): RUp(g1,s2,t1) <= 100
 RegDown_max_RT(g1,s2,t1): RDn(g1,s2,t1) <= 50
 RegUp_max_RT(g2,s2,t1): RUp(g2,s2,t1) <= 0
 RegDown_max_RT(g2,s2,t1): RDn(g2,s2,t1) <= 0
 RegUpSC_max_RT(g1,s1,t1): RUpSC(g1,s1,t1) <= 0
 RegDnSC_max_RT(g1,s1,t1): RDnSC(g1,s1,t1) <= 0
 RegUpSC_max_RT(g1,s2,t1): RUpSC(g1,s2,t1) <= 0
 RegDnSC_max_RT(g1,s2,t1): RDnSC(g1,s2,t1) <= 0
 Max_load_shed_RT(s1,t1): Lshed(s1,t1) <= 50
 Max_load_shed_RT(s2,t1): Lshed(s2,t1) <= 50
 Max_wind_spill_RT(w1,s1,t1): Wspill(w1,s1,t1) <= 15
 Max_wind_spill_RT(w1,s2,t1): Wspill(w1,s2,t1) <= 15
Bounds
End
