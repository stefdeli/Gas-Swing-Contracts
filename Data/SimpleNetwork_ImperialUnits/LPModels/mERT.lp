\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  8 RUp(g1,s1,t1) - 8 RDn(g1,s1,t1) + 5.6 RUpSC(g1,s1,t1)
   - 5.6 RDnSC(g1,s1,t1) + 5000 Lshed(s1,t1) + 8 RUp(g1,s1,t2)
   - 8 RDn(g1,s1,t2) + 5.6 RUpSC(g1,s1,t2) - 5.6 RDnSC(g1,s1,t2)
   + 5000 Lshed(s1,t2) + 8 RUp(g1,s1,t3) - 8 RDn(g1,s1,t3)
   + 5.6 RUpSC(g1,s1,t3) - 5.6 RDnSC(g1,s1,t3) + 5000 Lshed(s1,t3)
   + 8 RUp(g1,s1,t4) - 8 RDn(g1,s1,t4) + 5.6 RUpSC(g1,s1,t4)
   - 5.6 RDnSC(g1,s1,t4) + 5000 Lshed(s1,t4) + 8 RUp(g1,s2,t1)
   - 8 RDn(g1,s2,t1) + 5.6 RUpSC(g1,s2,t1) - 5.6 RDnSC(g1,s2,t1)
   + 5000 Lshed(s2,t1) + 8 RUp(g1,s2,t2) - 8 RDn(g1,s2,t2)
   + 5.6 RUpSC(g1,s2,t2) - 5.6 RDnSC(g1,s2,t2) + 5000 Lshed(s2,t2)
   + 8 RUp(g1,s2,t3) - 8 RDn(g1,s2,t3) + 5.6 RUpSC(g1,s2,t3)
   - 5.6 RDnSC(g1,s2,t3) + 5000 Lshed(s2,t3) + 8 RUp(g1,s2,t4)
   - 8 RDn(g1,s2,t4) + 5.6 RUpSC(g1,s2,t4) - 5.6 RDnSC(g1,s2,t4)
   + 5000 Lshed(s2,t4)
Subject To
 PowerBalance_RT(s1,t1): RUp(g1,s1,t1) - RDn(g1,s1,t1) + RUpSC(g1,s1,t1)
   - RDnSC(g1,s1,t1) - Wspill(w1,s1,t1) + Lshed(s1,t1) = -1.6185495
 PowerBalance_RT(s1,t2): RUp(g1,s1,t2) - RDn(g1,s1,t2) + RUpSC(g1,s1,t2)
   - RDnSC(g1,s1,t2) - Wspill(w1,s1,t2) + Lshed(s1,t2) = -1.56189987
 PowerBalance_RT(s1,t3): RUp(g1,s1,t3) - RDn(g1,s1,t3) + RUpSC(g1,s1,t3)
   - RDnSC(g1,s1,t3) - Wspill(w1,s1,t3) + Lshed(s1,t3) = -1.56099951
 PowerBalance_RT(s1,t4): RUp(g1,s1,t4) - RDn(g1,s1,t4) + RUpSC(g1,s1,t4)
   - RDnSC(g1,s1,t4) - Wspill(w1,s1,t4) + Lshed(s1,t4) = -1.23759195
 PowerBalance_RT(s2,t1): RUp(g1,s2,t1) - RDn(g1,s2,t1) + RUpSC(g1,s2,t1)
   - RDnSC(g1,s2,t1) - Wspill(w1,s2,t1) + Lshed(s2,t1) = -13.64523828
 PowerBalance_RT(s2,t2): RUp(g1,s2,t2) - RDn(g1,s2,t2) + RUpSC(g1,s2,t2)
   - RDnSC(g1,s2,t2) - Wspill(w1,s2,t2) + Lshed(s2,t2) = -14.13210003
 PowerBalance_RT(s2,t3): RUp(g1,s2,t3) - RDn(g1,s2,t3) + RUpSC(g1,s2,t3)
   - RDnSC(g1,s2,t3) - Wspill(w1,s2,t3) + Lshed(s2,t3)
   = -9.571274219999999
 PowerBalance_RT(s2,t4): RUp(g1,s2,t4) - RDn(g1,s2,t4) + RUpSC(g1,s2,t4)
   - RDnSC(g1,s2,t4) - Wspill(w1,s2,t4) + Lshed(s2,t4) = -10.24495167
 RegUp_max_RT(g1,s1,t1): RUp(g1,s1,t1) <= 100
 RegDown_max_RT(g1,s1,t1): RDn(g1,s1,t1) <= 50
 RegUp_max_RT(g1,s1,t2): RUp(g1,s1,t2) <= 98.70590476999999
 RegDown_max_RT(g1,s1,t2): RDn(g1,s1,t2) <= 51.29409523
 RegUp_max_RT(g1,s1,t3): RUp(g1,s1,t3) <= 97.5
 RegDown_max_RT(g1,s1,t3): RDn(g1,s1,t3) <= 52.5
 RegUp_max_RT(g1,s1,t4): RUp(g1,s1,t4) <= 96.46446609
 RegDown_max_RT(g1,s1,t4): RDn(g1,s1,t4) <= 53.53553391
 RegUp_max_RT(g1,s2,t1): RUp(g1,s2,t1) <= 100
 RegDown_max_RT(g1,s2,t1): RDn(g1,s2,t1) <= 50
 RegUp_max_RT(g1,s2,t2): RUp(g1,s2,t2) <= 98.70590476999999
 RegDown_max_RT(g1,s2,t2): RDn(g1,s2,t2) <= 51.29409523
 RegUp_max_RT(g1,s2,t3): RUp(g1,s2,t3) <= 97.5
 RegDown_max_RT(g1,s2,t3): RDn(g1,s2,t3) <= 52.5
 RegUp_max_RT(g1,s2,t4): RUp(g1,s2,t4) <= 96.46446609
 RegDown_max_RT(g1,s2,t4): RDn(g1,s2,t4) <= 53.53553391
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
 Max_load_shed_RT(s1,t2): Lshed(s1,t2) <= 51.29409523
 Max_load_shed_RT(s1,t3): Lshed(s1,t3) <= 52.5
 Max_load_shed_RT(s1,t4): Lshed(s1,t4) <= 53.53553391
 Max_load_shed_RT(s2,t1): Lshed(s2,t1) <= 50
 Max_load_shed_RT(s2,t2): Lshed(s2,t2) <= 51.29409523
 Max_load_shed_RT(s2,t3): Lshed(s2,t3) <= 52.5
 Max_load_shed_RT(s2,t4): Lshed(s2,t4) <= 53.53553391
 Max_wind_spill_RT(w1,s1,t1): Wspill(w1,s1,t1) <= 1.6185495
 Max_wind_spill_RT(w1,s1,t2): Wspill(w1,s1,t2) <= 1.56189987
 Max_wind_spill_RT(w1,s1,t3): Wspill(w1,s1,t3) <= 1.56099951
 Max_wind_spill_RT(w1,s1,t4): Wspill(w1,s1,t4) <= 1.23759195
 Max_wind_spill_RT(w1,s2,t1): Wspill(w1,s2,t1) <= 13.64523828
 Max_wind_spill_RT(w1,s2,t2): Wspill(w1,s2,t2) <= 14.13210003
 Max_wind_spill_RT(w1,s2,t3): Wspill(w1,s2,t3) <= 9.571274219999999
 Max_wind_spill_RT(w1,s2,t4): Wspill(w1,s2,t4) <= 10.24495167
Bounds
End
