\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  16.8 RUp(g1,s1,t1) - 16 RDn(g1,s1,t1) + 8.925 RUp(g2,s1,t1)
   - 8.245 RDn(g2,s1,t1) + 80 RUpSC(g1,s1,t1) - 80 RDnSC(g1,s1,t1)
   + 500 Lshed(s1,t1) + 16.8 RUp(g1,s1,t2) - 16 RDn(g1,s1,t2)
   + 8.925 RUp(g2,s1,t2) - 8.245 RDn(g2,s1,t2) + 80 RUpSC(g1,s1,t2)
   - 80 RDnSC(g1,s1,t2) + 500 Lshed(s1,t2) + 16.8 RUp(g1,s1,t3)
   - 16 RDn(g1,s1,t3) + 8.925 RUp(g2,s1,t3) - 8.245 RDn(g2,s1,t3)
   + 80 RUpSC(g1,s1,t3) - 80 RDnSC(g1,s1,t3) + 500 Lshed(s1,t3)
   + 16.8 RUp(g1,s1,t4) - 16 RDn(g1,s1,t4) + 8.925 RUp(g2,s1,t4)
   - 8.245 RDn(g2,s1,t4) + 80 RUpSC(g1,s1,t4) - 80 RDnSC(g1,s1,t4)
   + 500 Lshed(s1,t4) + 16.8 RUp(g1,s2,t1) - 16 RDn(g1,s2,t1)
   + 8.925 RUp(g2,s2,t1) - 8.245 RDn(g2,s2,t1) + 80 RUpSC(g1,s2,t1)
   - 80 RDnSC(g1,s2,t1) + 500 Lshed(s2,t1) + 16.8 RUp(g1,s2,t2)
   - 16 RDn(g1,s2,t2) + 8.925 RUp(g2,s2,t2) - 8.245 RDn(g2,s2,t2)
   + 80 RUpSC(g1,s2,t2) - 80 RDnSC(g1,s2,t2) + 500 Lshed(s2,t2)
   + 16.8 RUp(g1,s2,t3) - 16 RDn(g1,s2,t3) + 8.925 RUp(g2,s2,t3)
   - 8.245 RDn(g2,s2,t3) + 80 RUpSC(g1,s2,t3) - 80 RDnSC(g1,s2,t3)
   + 500 Lshed(s2,t3) + 16.8 RUp(g1,s2,t4) - 16 RDn(g1,s2,t4)
   + 8.925 RUp(g2,s2,t4) - 8.245 RDn(g2,s2,t4) + 80 RUpSC(g1,s2,t4)
   - 80 RDnSC(g1,s2,t4) + 500 Lshed(s2,t4)
Subject To
 PowerBalance_RT(s1,t1): RUp(g1,s1,t1) - RDn(g1,s1,t1) + RUp(g2,s1,t1)
   - RDn(g2,s1,t1) + RUpSC(g1,s1,t1) - RDnSC(g1,s1,t1) - Wspill(w1,s1,t1)
   + Lshed(s1,t1) = -1.6185495
 PowerBalance_RT(s1,t2): RUp(g1,s1,t2) - RDn(g1,s1,t2) + RUp(g2,s1,t2)
   - RDn(g2,s1,t2) + RUpSC(g1,s1,t2) - RDnSC(g1,s1,t2) - Wspill(w1,s1,t2)
   + Lshed(s1,t2) = -1.56189987
 PowerBalance_RT(s1,t3): RUp(g1,s1,t3) - RDn(g1,s1,t3) + RUp(g2,s1,t3)
   - RDn(g2,s1,t3) + RUpSC(g1,s1,t3) - RDnSC(g1,s1,t3) - Wspill(w1,s1,t3)
   + Lshed(s1,t3) = 0
 PowerBalance_RT(s1,t4): RUp(g1,s1,t4) - RDn(g1,s1,t4) + RUp(g2,s1,t4)
   - RDn(g2,s1,t4) + RUpSC(g1,s1,t4) - RDnSC(g1,s1,t4) - Wspill(w1,s1,t4)
   + Lshed(s1,t4) = -1.23759195
 PowerBalance_RT(s2,t1): RUp(g1,s2,t1) - RDn(g1,s2,t1) + RUp(g2,s2,t1)
   - RDn(g2,s2,t1) + RUpSC(g1,s2,t1) - RDnSC(g1,s2,t1) - Wspill(w1,s2,t1)
   + Lshed(s2,t1) = -13.64523828
 PowerBalance_RT(s2,t2): RUp(g1,s2,t2) - RDn(g1,s2,t2) + RUp(g2,s2,t2)
   - RDn(g2,s2,t2) + RUpSC(g1,s2,t2) - RDnSC(g1,s2,t2) - Wspill(w1,s2,t2)
   + Lshed(s2,t2) = -14.13210003
 PowerBalance_RT(s2,t3): RUp(g1,s2,t3) - RDn(g1,s2,t3) + RUp(g2,s2,t3)
   - RDn(g2,s2,t3) + RUpSC(g1,s2,t3) - RDnSC(g1,s2,t3) - Wspill(w1,s2,t3)
   + Lshed(s2,t3) = -8.010274709999999
 PowerBalance_RT(s2,t4): RUp(g1,s2,t4) - RDn(g1,s2,t4) + RUp(g2,s2,t4)
   - RDn(g2,s2,t4) + RUpSC(g1,s2,t4) - RDnSC(g1,s2,t4) - Wspill(w1,s2,t4)
   + Lshed(s2,t4) = -10.24495167
 RegUp_max_RT(g1,s1,t1): RUp(g1,s1,t1) <= 104.5
 RegDown_max_RT(g1,s1,t1): RDn(g1,s1,t1) <= 45.5
 RegUp_max_RT(g2,s1,t1): RUp(g2,s1,t1) <= 4.5
 RegDown_max_RT(g2,s1,t1): RDn(g2,s1,t1) <= 0
 RegUp_max_RT(g1,s1,t2): RUp(g1,s1,t2) <= 103.20590477
 RegDown_max_RT(g1,s1,t2): RDn(g1,s1,t2) <= 46.79409523
 RegUp_max_RT(g2,s1,t2): RUp(g2,s1,t2) <= 4.5
 RegDown_max_RT(g2,s1,t2): RDn(g2,s1,t2) <= 0
 RegUp_max_RT(g1,s1,t3): RUp(g1,s1,t3) <= 108.06099951
 RegDown_max_RT(g1,s1,t3): RDn(g1,s1,t3) <= 41.93900049
 RegUp_max_RT(g2,s1,t3): RUp(g2,s1,t3) <= 0
 RegDown_max_RT(g2,s1,t3): RDn(g2,s1,t3) <= 0
 RegUp_max_RT(g1,s1,t4): RUp(g1,s1,t4) <= 105.46446609
 RegDown_max_RT(g1,s1,t4): RDn(g1,s1,t4) <= 44.53553391
 RegUp_max_RT(g2,s1,t4): RUp(g2,s1,t4) <= 0
 RegDown_max_RT(g2,s1,t4): RDn(g2,s1,t4) <= 0
 RegUp_max_RT(g1,s2,t1): RUp(g1,s2,t1) <= 104.5
 RegDown_max_RT(g1,s2,t1): RDn(g1,s2,t1) <= 45.5
 RegUp_max_RT(g2,s2,t1): RUp(g2,s2,t1) <= 4.5
 RegDown_max_RT(g2,s2,t1): RDn(g2,s2,t1) <= 0
 RegUp_max_RT(g1,s2,t2): RUp(g1,s2,t2) <= 103.20590477
 RegDown_max_RT(g1,s2,t2): RDn(g1,s2,t2) <= 46.79409523
 RegUp_max_RT(g2,s2,t2): RUp(g2,s2,t2) <= 4.5
 RegDown_max_RT(g2,s2,t2): RDn(g2,s2,t2) <= 0
 RegUp_max_RT(g1,s2,t3): RUp(g1,s2,t3) <= 108.06099951
 RegDown_max_RT(g1,s2,t3): RDn(g1,s2,t3) <= 41.93900049
 RegUp_max_RT(g2,s2,t3): RUp(g2,s2,t3) <= 0
 RegDown_max_RT(g2,s2,t3): RDn(g2,s2,t3) <= 0
 RegUp_max_RT(g1,s2,t4): RUp(g1,s2,t4) <= 105.46446609
 RegDown_max_RT(g1,s2,t4): RDn(g1,s2,t4) <= 44.53553391
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
