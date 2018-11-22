\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  8 RUp(g1,s1,t1) - 8 RDn(g1,s1,t1) + 13 RUp(g2,s1,t1) - 13 RDn(g2,s1,t1)
   + 5.6 RUpSC(g1,s1,t1) - 5.6 RDnSC(g1,s1,t1) + 5000 Lshed(s1,t1)
   + 8 RUp(g1,s1,t2) - 8 RDn(g1,s1,t2) + 13 RUp(g2,s1,t2)
   - 13 RDn(g2,s1,t2) + 5.6 RUpSC(g1,s1,t2) - 5.6 RDnSC(g1,s1,t2)
   + 5000 Lshed(s1,t2) + 8 RUp(g1,s1,t3) - 8 RDn(g1,s1,t3)
   + 13 RUp(g2,s1,t3) - 13 RDn(g2,s1,t3) + 5.6 RUpSC(g1,s1,t3)
   - 5.6 RDnSC(g1,s1,t3) + 5000 Lshed(s1,t3) + 8 RUp(g1,s1,t4)
   - 8 RDn(g1,s1,t4) + 13 RUp(g2,s1,t4) - 13 RDn(g2,s1,t4)
   + 5.6 RUpSC(g1,s1,t4) - 5.6 RDnSC(g1,s1,t4) + 5000 Lshed(s1,t4)
   + 8 RUp(g1,s2,t1) - 8 RDn(g1,s2,t1) + 13 RUp(g2,s2,t1)
   - 13 RDn(g2,s2,t1) + 5.6 RUpSC(g1,s2,t1) - 5.6 RDnSC(g1,s2,t1)
   + 5000 Lshed(s2,t1) + 8 RUp(g1,s2,t2) - 8 RDn(g1,s2,t2)
   + 13 RUp(g2,s2,t2) - 13 RDn(g2,s2,t2) + 5.6 RUpSC(g1,s2,t2)
   - 5.6 RDnSC(g1,s2,t2) + 5000 Lshed(s2,t2) + 8 RUp(g1,s2,t3)
   - 8 RDn(g1,s2,t3) + 13 RUp(g2,s2,t3) - 13 RDn(g2,s2,t3)
   + 5.6 RUpSC(g1,s2,t3) - 5.6 RDnSC(g1,s2,t3) + 5000 Lshed(s2,t3)
   + 8 RUp(g1,s2,t4) - 8 RDn(g1,s2,t4) + 13 RUp(g2,s2,t4)
   - 13 RDn(g2,s2,t4) + 5.6 RUpSC(g1,s2,t4) - 5.6 RDnSC(g1,s2,t4)
   + 5000 Lshed(s2,t4)
Subject To
 PowerBalance_RT(s1,t1): RUp(g1,s1,t1) - RDn(g1,s1,t1) + RUp(g2,s1,t1)
   - RDn(g2,s1,t1) + RUpSC(g1,s1,t1) - RDnSC(g1,s1,t1) - Wspill(w1,s1,t1)
   + Lshed(s1,t1) = -1.6185495
 PowerBalance_RT(s1,t2): RUp(g1,s1,t2) - RDn(g1,s1,t2) + RUp(g2,s1,t2)
   - RDn(g2,s1,t2) + RUpSC(g1,s1,t2) - RDnSC(g1,s1,t2) - Wspill(w1,s1,t2)
   + Lshed(s1,t2) = -1.56189987
 PowerBalance_RT(s1,t3): RUp(g1,s1,t3) - RDn(g1,s1,t3) + RUp(g2,s1,t3)
   - RDn(g2,s1,t3) + RUpSC(g1,s1,t3) - RDnSC(g1,s1,t3) - Wspill(w1,s1,t3)
   + Lshed(s1,t3) = -1.56099951
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
   + Lshed(s2,t3) = -9.571274219999999
 PowerBalance_RT(s2,t4): RUp(g1,s2,t4) - RDn(g1,s2,t4) + RUp(g2,s2,t4)
   - RDn(g2,s2,t4) + RUpSC(g1,s2,t4) - RDnSC(g1,s2,t4) - Wspill(w1,s2,t4)
   + Lshed(s2,t4) = -10.24495167
 RegUp_max_RT(g1,s1,t1): RUp(g1,s1,t1) <= 110
 RegDown_max_RT(g1,s1,t1): RDn(g1,s1,t1) <= 0
 RegUp_max_RT(g2,s1,t1): RUp(g2,s1,t1) <= 0
 RegDown_max_RT(g2,s1,t1): RDn(g2,s1,t1) <= 124
 RegUp_max_RT(g1,s1,t2): RUp(g1,s1,t2) <= 108.70590477
 RegDown_max_RT(g1,s1,t2): RDn(g1,s1,t2) <= 0
 RegUp_max_RT(g2,s1,t2): RUp(g2,s1,t2) <= 0
 RegDown_max_RT(g2,s1,t2): RDn(g2,s1,t2) <= 123
 RegUp_max_RT(g1,s1,t3): RUp(g1,s1,t3) <= 107.5
 RegDown_max_RT(g1,s1,t3): RDn(g1,s1,t3) <= 0
 RegUp_max_RT(g2,s1,t3): RUp(g2,s1,t3) <= 0
 RegDown_max_RT(g2,s1,t3): RDn(g2,s1,t3) <= 118
 RegUp_max_RT(g1,s1,t4): RUp(g1,s1,t4) <= 106.46446609
 RegDown_max_RT(g1,s1,t4): RDn(g1,s1,t4) <= 0
 RegUp_max_RT(g2,s1,t4): RUp(g2,s1,t4) <= 0
 RegDown_max_RT(g2,s1,t4): RDn(g2,s1,t4) <= 117
 RegUp_max_RT(g1,s2,t1): RUp(g1,s2,t1) <= 110
 RegDown_max_RT(g1,s2,t1): RDn(g1,s2,t1) <= 0
 RegUp_max_RT(g2,s2,t1): RUp(g2,s2,t1) <= 0
 RegDown_max_RT(g2,s2,t1): RDn(g2,s2,t1) <= 124
 RegUp_max_RT(g1,s2,t2): RUp(g1,s2,t2) <= 108.70590477
 RegDown_max_RT(g1,s2,t2): RDn(g1,s2,t2) <= 0
 RegUp_max_RT(g2,s2,t2): RUp(g2,s2,t2) <= 0
 RegDown_max_RT(g2,s2,t2): RDn(g2,s2,t2) <= 123
 RegUp_max_RT(g1,s2,t3): RUp(g1,s2,t3) <= 107.5
 RegDown_max_RT(g1,s2,t3): RDn(g1,s2,t3) <= 0
 RegUp_max_RT(g2,s2,t3): RUp(g2,s2,t3) <= 0
 RegDown_max_RT(g2,s2,t3): RDn(g2,s2,t3) <= 118
 RegUp_max_RT(g1,s2,t4): RUp(g1,s2,t4) <= 106.46446609
 RegDown_max_RT(g1,s2,t4): RDn(g1,s2,t4) <= 0
 RegUp_max_RT(g2,s2,t4): RUp(g2,s2,t4) <= 0
 RegDown_max_RT(g2,s2,t4): RDn(g2,s2,t4) <= 117
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
 SOS1_RegUp_max_RT(g1,s1,t1): RUp(g1,s1,t1) + SOS1_RegUp_max_RT(g1,s1,t1)
   = 110
 SOS1_RegDown_max_RT(g1,s1,t1): RDn(g1,s1,t1)
   + SOS1_RegDown_max_RT(g1,s1,t1) = 0
 SOS1_RegUp_max_RT(g2,s1,t1): RUp(g2,s1,t1) + SOS1_RegUp_max_RT(g2,s1,t1)
   = 0
 SOS1_RegDown_max_RT(g2,s1,t1): RDn(g2,s1,t1)
   + SOS1_RegDown_max_RT(g2,s1,t1) = 124
 SOS1_RegUp_max_RT(g1,s1,t2): RUp(g1,s1,t2) + SOS1_RegUp_max_RT(g1,s1,t2)
   = 108.70590477
 SOS1_RegDown_max_RT(g1,s1,t2): RDn(g1,s1,t2)
   + SOS1_RegDown_max_RT(g1,s1,t2) = 0
 SOS1_RegUp_max_RT(g2,s1,t2): RUp(g2,s1,t2) + SOS1_RegUp_max_RT(g2,s1,t2)
   = 0
 SOS1_RegDown_max_RT(g2,s1,t2): RDn(g2,s1,t2)
   + SOS1_RegDown_max_RT(g2,s1,t2) = 123
 SOS1_RegUp_max_RT(g1,s1,t3): RUp(g1,s1,t3) + SOS1_RegUp_max_RT(g1,s1,t3)
   = 107.5
 SOS1_RegDown_max_RT(g1,s1,t3): RDn(g1,s1,t3)
   + SOS1_RegDown_max_RT(g1,s1,t3) = 0
 SOS1_RegUp_max_RT(g2,s1,t3): RUp(g2,s1,t3) + SOS1_RegUp_max_RT(g2,s1,t3)
   = 0
 SOS1_RegDown_max_RT(g2,s1,t3): RDn(g2,s1,t3)
   + SOS1_RegDown_max_RT(g2,s1,t3) = 118
 SOS1_RegUp_max_RT(g1,s1,t4): RUp(g1,s1,t4) + SOS1_RegUp_max_RT(g1,s1,t4)
   = 106.46446609
 SOS1_RegDown_max_RT(g1,s1,t4): RDn(g1,s1,t4)
   + SOS1_RegDown_max_RT(g1,s1,t4) = 0
 SOS1_RegUp_max_RT(g2,s1,t4): RUp(g2,s1,t4) + SOS1_RegUp_max_RT(g2,s1,t4)
   = 0
 SOS1_RegDown_max_RT(g2,s1,t4): RDn(g2,s1,t4)
   + SOS1_RegDown_max_RT(g2,s1,t4) = 117
 SOS1_RegUp_max_RT(g1,s2,t1): RUp(g1,s2,t1) + SOS1_RegUp_max_RT(g1,s2,t1)
   = 110
 SOS1_RegDown_max_RT(g1,s2,t1): RDn(g1,s2,t1)
   + SOS1_RegDown_max_RT(g1,s2,t1) = 0
 SOS1_RegUp_max_RT(g2,s2,t1): RUp(g2,s2,t1) + SOS1_RegUp_max_RT(g2,s2,t1)
   = 0
 SOS1_RegDown_max_RT(g2,s2,t1): RDn(g2,s2,t1)
   + SOS1_RegDown_max_RT(g2,s2,t1) = 124
 SOS1_RegUp_max_RT(g1,s2,t2): RUp(g1,s2,t2) + SOS1_RegUp_max_RT(g1,s2,t2)
   = 108.70590477
 SOS1_RegDown_max_RT(g1,s2,t2): RDn(g1,s2,t2)
   + SOS1_RegDown_max_RT(g1,s2,t2) = 0
 SOS1_RegUp_max_RT(g2,s2,t2): RUp(g2,s2,t2) + SOS1_RegUp_max_RT(g2,s2,t2)
   = 0
 SOS1_RegDown_max_RT(g2,s2,t2): RDn(g2,s2,t2)
   + SOS1_RegDown_max_RT(g2,s2,t2) = 123
 SOS1_RegUp_max_RT(g1,s2,t3): RUp(g1,s2,t3) + SOS1_RegUp_max_RT(g1,s2,t3)
   = 107.5
 SOS1_RegDown_max_RT(g1,s2,t3): RDn(g1,s2,t3)
   + SOS1_RegDown_max_RT(g1,s2,t3) = 0
 SOS1_RegUp_max_RT(g2,s2,t3): RUp(g2,s2,t3) + SOS1_RegUp_max_RT(g2,s2,t3)
   = 0
 SOS1_RegDown_max_RT(g2,s2,t3): RDn(g2,s2,t3)
   + SOS1_RegDown_max_RT(g2,s2,t3) = 118
 SOS1_RegUp_max_RT(g1,s2,t4): RUp(g1,s2,t4) + SOS1_RegUp_max_RT(g1,s2,t4)
   = 106.46446609
 SOS1_RegDown_max_RT(g1,s2,t4): RDn(g1,s2,t4)
   + SOS1_RegDown_max_RT(g1,s2,t4) = 0
 SOS1_RegUp_max_RT(g2,s2,t4): RUp(g2,s2,t4) + SOS1_RegUp_max_RT(g2,s2,t4)
   = 0
 SOS1_RegDown_max_RT(g2,s2,t4): RDn(g2,s2,t4)
   + SOS1_RegDown_max_RT(g2,s2,t4) = 117
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
 SOS1_RegUpSC_max_RT(g1,s1,t4): RUpSC(g1,s1,t4)
   + SOS1_RegUpSC_max_RT(g1,s1,t4) = 0
 SOS1_RegDnSC_max_RT(g1,s1,t4): RDnSC(g1,s1,t4)
   + SOS1_RegDnSC_max_RT(g1,s1,t4) = 0
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
 SOS1_RegUpSC_max_RT(g1,s2,t4): RUpSC(g1,s2,t4)
   + SOS1_RegUpSC_max_RT(g1,s2,t4) = 0
 SOS1_RegDnSC_max_RT(g1,s2,t4): RDnSC(g1,s2,t4)
   + SOS1_RegDnSC_max_RT(g1,s2,t4) = 0
 SOS1_Max_load_shed_RT(s1,t1): Lshed(s1,t1) + SOS1_Max_load_shed_RT(s1,t1)
   = 50
 SOS1_Max_load_shed_RT(s1,t2): Lshed(s1,t2) + SOS1_Max_load_shed_RT(s1,t2)
   = 51.29409523
 SOS1_Max_load_shed_RT(s1,t3): Lshed(s1,t3) + SOS1_Max_load_shed_RT(s1,t3)
   = 52.5
 SOS1_Max_load_shed_RT(s1,t4): Lshed(s1,t4) + SOS1_Max_load_shed_RT(s1,t4)
   = 53.53553391
 SOS1_Max_load_shed_RT(s2,t1): Lshed(s2,t1) + SOS1_Max_load_shed_RT(s2,t1)
   = 50
 SOS1_Max_load_shed_RT(s2,t2): Lshed(s2,t2) + SOS1_Max_load_shed_RT(s2,t2)
   = 51.29409523
 SOS1_Max_load_shed_RT(s2,t3): Lshed(s2,t3) + SOS1_Max_load_shed_RT(s2,t3)
   = 52.5
 SOS1_Max_load_shed_RT(s2,t4): Lshed(s2,t4) + SOS1_Max_load_shed_RT(s2,t4)
   = 53.53553391
 SOS1_Max_wind_spill_RT(w1,s1,t1): Wspill(w1,s1,t1)
   + SOS1_Max_wind_spill_RT(w1,s1,t1) = 1.6185495
 SOS1_Max_wind_spill_RT(w1,s1,t2): Wspill(w1,s1,t2)
   + SOS1_Max_wind_spill_RT(w1,s1,t2) = 1.56189987
 SOS1_Max_wind_spill_RT(w1,s1,t3): Wspill(w1,s1,t3)
   + SOS1_Max_wind_spill_RT(w1,s1,t3) = 1.56099951
 SOS1_Max_wind_spill_RT(w1,s1,t4): Wspill(w1,s1,t4)
   + SOS1_Max_wind_spill_RT(w1,s1,t4) = 1.23759195
 SOS1_Max_wind_spill_RT(w1,s2,t1): Wspill(w1,s2,t1)
   + SOS1_Max_wind_spill_RT(w1,s2,t1) = 13.64523828
 SOS1_Max_wind_spill_RT(w1,s2,t2): Wspill(w1,s2,t2)
   + SOS1_Max_wind_spill_RT(w1,s2,t2) = 14.13210003
 SOS1_Max_wind_spill_RT(w1,s2,t3): Wspill(w1,s2,t3)
   + SOS1_Max_wind_spill_RT(w1,s2,t3) = 9.571274219999999
 SOS1_Max_wind_spill_RT(w1,s2,t4): Wspill(w1,s2,t4)
   + SOS1_Max_wind_spill_RT(w1,s2,t4) = 10.24495167
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
 SOS1_LB_RUp(g1,s1,t4): - RUp(g1,s1,t4) + SOS1_LB_RUp(g1,s1,t4) = 0
 SOS1_LB_RDn(g1,s1,t4): - RDn(g1,s1,t4) + SOS1_LB_RDn(g1,s1,t4) = 0
 SOS1_LB_RUp(g2,s1,t4): - RUp(g2,s1,t4) + SOS1_LB_RUp(g2,s1,t4) = 0
 SOS1_LB_RDn(g2,s1,t4): - RDn(g2,s1,t4) + SOS1_LB_RDn(g2,s1,t4) = 0
 SOS1_LB_RUpSC(g1,s1,t4): - RUpSC(g1,s1,t4) + SOS1_LB_RUpSC(g1,s1,t4) = 0
 SOS1_LB_RDnSC(g1,s1,t4): - RDnSC(g1,s1,t4) + SOS1_LB_RDnSC(g1,s1,t4) = 0
 SOS1_LB_Wspill(w1,s1,t4): - Wspill(w1,s1,t4) + SOS1_LB_Wspill(w1,s1,t4)
   = 0
 SOS1_LB_Lshed(s1,t4): - Lshed(s1,t4) + SOS1_LB_Lshed(s1,t4) = 0
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
 SOS1_LB_RUp(g1,s2,t4): - RUp(g1,s2,t4) + SOS1_LB_RUp(g1,s2,t4) = 0
 SOS1_LB_RDn(g1,s2,t4): - RDn(g1,s2,t4) + SOS1_LB_RDn(g1,s2,t4) = 0
 SOS1_LB_RUp(g2,s2,t4): - RUp(g2,s2,t4) + SOS1_LB_RUp(g2,s2,t4) = 0
 SOS1_LB_RDn(g2,s2,t4): - RDn(g2,s2,t4) + SOS1_LB_RDn(g2,s2,t4) = 0
 SOS1_LB_RUpSC(g1,s2,t4): - RUpSC(g1,s2,t4) + SOS1_LB_RUpSC(g1,s2,t4) = 0
 SOS1_LB_RDnSC(g1,s2,t4): - RDnSC(g1,s2,t4) + SOS1_LB_RDnSC(g1,s2,t4) = 0
 SOS1_LB_Wspill(w1,s2,t4): - Wspill(w1,s2,t4) + SOS1_LB_Wspill(w1,s2,t4)
   = 0
 SOS1_LB_Lshed(s2,t4): - Lshed(s2,t4) + SOS1_LB_Lshed(s2,t4) = 0
 dLag/RUp(g1,s1,t1): - lambda_PowerBalance_RT(s1,t1)
   + mu_RegUp_max_RT(g1,s1,t1) - muLB_RUp(g1,s1,t1) = -8
 dLag/RDn(g1,s1,t1): lambda_PowerBalance_RT(s1,t1)
   + mu_RegDown_max_RT(g1,s1,t1) - muLB_RDn(g1,s1,t1) = 8
 dLag/RUp(g2,s1,t1): - lambda_PowerBalance_RT(s1,t1)
   + mu_RegUp_max_RT(g2,s1,t1) - muLB_RUp(g2,s1,t1) = -13
 dLag/RDn(g2,s1,t1): lambda_PowerBalance_RT(s1,t1)
   + mu_RegDown_max_RT(g2,s1,t1) - muLB_RDn(g2,s1,t1) = 13
 dLag/RUpSC(g1,s1,t1): - lambda_PowerBalance_RT(s1,t1)
   + mu_RegUpSC_max_RT(g1,s1,t1) - muLB_RUpSC(g1,s1,t1) = -5.6
 dLag/RDnSC(g1,s1,t1): lambda_PowerBalance_RT(s1,t1)
   + mu_RegDnSC_max_RT(g1,s1,t1) - muLB_RDnSC(g1,s1,t1) = 5.6
 dLag/Wspill(w1,s1,t1): lambda_PowerBalance_RT(s1,t1)
   + mu_Max_wind_spill_RT(w1,s1,t1) - muLB_Wspill(w1,s1,t1) = 0
 dLag/Lshed(s1,t1): - lambda_PowerBalance_RT(s1,t1)
   + mu_Max_load_shed_RT(s1,t1) - muLB_Lshed(s1,t1) = -5000
 dLag/RUp(g1,s1,t2): - lambda_PowerBalance_RT(s1,t2)
   + mu_RegUp_max_RT(g1,s1,t2) - muLB_RUp(g1,s1,t2) = -8
 dLag/RDn(g1,s1,t2): lambda_PowerBalance_RT(s1,t2)
   + mu_RegDown_max_RT(g1,s1,t2) - muLB_RDn(g1,s1,t2) = 8
 dLag/RUp(g2,s1,t2): - lambda_PowerBalance_RT(s1,t2)
   + mu_RegUp_max_RT(g2,s1,t2) - muLB_RUp(g2,s1,t2) = -13
 dLag/RDn(g2,s1,t2): lambda_PowerBalance_RT(s1,t2)
   + mu_RegDown_max_RT(g2,s1,t2) - muLB_RDn(g2,s1,t2) = 13
 dLag/RUpSC(g1,s1,t2): - lambda_PowerBalance_RT(s1,t2)
   + mu_RegUpSC_max_RT(g1,s1,t2) - muLB_RUpSC(g1,s1,t2) = -5.6
 dLag/RDnSC(g1,s1,t2): lambda_PowerBalance_RT(s1,t2)
   + mu_RegDnSC_max_RT(g1,s1,t2) - muLB_RDnSC(g1,s1,t2) = 5.6
 dLag/Wspill(w1,s1,t2): lambda_PowerBalance_RT(s1,t2)
   + mu_Max_wind_spill_RT(w1,s1,t2) - muLB_Wspill(w1,s1,t2) = 0
 dLag/Lshed(s1,t2): - lambda_PowerBalance_RT(s1,t2)
   + mu_Max_load_shed_RT(s1,t2) - muLB_Lshed(s1,t2) = -5000
 dLag/RUp(g1,s1,t3): - lambda_PowerBalance_RT(s1,t3)
   + mu_RegUp_max_RT(g1,s1,t3) - muLB_RUp(g1,s1,t3) = -8
 dLag/RDn(g1,s1,t3): lambda_PowerBalance_RT(s1,t3)
   + mu_RegDown_max_RT(g1,s1,t3) - muLB_RDn(g1,s1,t3) = 8
 dLag/RUp(g2,s1,t3): - lambda_PowerBalance_RT(s1,t3)
   + mu_RegUp_max_RT(g2,s1,t3) - muLB_RUp(g2,s1,t3) = -13
 dLag/RDn(g2,s1,t3): lambda_PowerBalance_RT(s1,t3)
   + mu_RegDown_max_RT(g2,s1,t3) - muLB_RDn(g2,s1,t3) = 13
 dLag/RUpSC(g1,s1,t3): - lambda_PowerBalance_RT(s1,t3)
   + mu_RegUpSC_max_RT(g1,s1,t3) - muLB_RUpSC(g1,s1,t3) = -5.6
 dLag/RDnSC(g1,s1,t3): lambda_PowerBalance_RT(s1,t3)
   + mu_RegDnSC_max_RT(g1,s1,t3) - muLB_RDnSC(g1,s1,t3) = 5.6
 dLag/Wspill(w1,s1,t3): lambda_PowerBalance_RT(s1,t3)
   + mu_Max_wind_spill_RT(w1,s1,t3) - muLB_Wspill(w1,s1,t3) = 0
 dLag/Lshed(s1,t3): - lambda_PowerBalance_RT(s1,t3)
   + mu_Max_load_shed_RT(s1,t3) - muLB_Lshed(s1,t3) = -5000
 dLag/RUp(g1,s1,t4): - lambda_PowerBalance_RT(s1,t4)
   + mu_RegUp_max_RT(g1,s1,t4) - muLB_RUp(g1,s1,t4) = -8
 dLag/RDn(g1,s1,t4): lambda_PowerBalance_RT(s1,t4)
   + mu_RegDown_max_RT(g1,s1,t4) - muLB_RDn(g1,s1,t4) = 8
 dLag/RUp(g2,s1,t4): - lambda_PowerBalance_RT(s1,t4)
   + mu_RegUp_max_RT(g2,s1,t4) - muLB_RUp(g2,s1,t4) = -13
 dLag/RDn(g2,s1,t4): lambda_PowerBalance_RT(s1,t4)
   + mu_RegDown_max_RT(g2,s1,t4) - muLB_RDn(g2,s1,t4) = 13
 dLag/RUpSC(g1,s1,t4): - lambda_PowerBalance_RT(s1,t4)
   + mu_RegUpSC_max_RT(g1,s1,t4) - muLB_RUpSC(g1,s1,t4) = -5.6
 dLag/RDnSC(g1,s1,t4): lambda_PowerBalance_RT(s1,t4)
   + mu_RegDnSC_max_RT(g1,s1,t4) - muLB_RDnSC(g1,s1,t4) = 5.6
 dLag/Wspill(w1,s1,t4): lambda_PowerBalance_RT(s1,t4)
   + mu_Max_wind_spill_RT(w1,s1,t4) - muLB_Wspill(w1,s1,t4) = 0
 dLag/Lshed(s1,t4): - lambda_PowerBalance_RT(s1,t4)
   + mu_Max_load_shed_RT(s1,t4) - muLB_Lshed(s1,t4) = -5000
 dLag/RUp(g1,s2,t1): - lambda_PowerBalance_RT(s2,t1)
   + mu_RegUp_max_RT(g1,s2,t1) - muLB_RUp(g1,s2,t1) = -8
 dLag/RDn(g1,s2,t1): lambda_PowerBalance_RT(s2,t1)
   + mu_RegDown_max_RT(g1,s2,t1) - muLB_RDn(g1,s2,t1) = 8
 dLag/RUp(g2,s2,t1): - lambda_PowerBalance_RT(s2,t1)
   + mu_RegUp_max_RT(g2,s2,t1) - muLB_RUp(g2,s2,t1) = -13
 dLag/RDn(g2,s2,t1): lambda_PowerBalance_RT(s2,t1)
   + mu_RegDown_max_RT(g2,s2,t1) - muLB_RDn(g2,s2,t1) = 13
 dLag/RUpSC(g1,s2,t1): - lambda_PowerBalance_RT(s2,t1)
   + mu_RegUpSC_max_RT(g1,s2,t1) - muLB_RUpSC(g1,s2,t1) = -5.6
 dLag/RDnSC(g1,s2,t1): lambda_PowerBalance_RT(s2,t1)
   + mu_RegDnSC_max_RT(g1,s2,t1) - muLB_RDnSC(g1,s2,t1) = 5.6
 dLag/Wspill(w1,s2,t1): lambda_PowerBalance_RT(s2,t1)
   + mu_Max_wind_spill_RT(w1,s2,t1) - muLB_Wspill(w1,s2,t1) = 0
 dLag/Lshed(s2,t1): - lambda_PowerBalance_RT(s2,t1)
   + mu_Max_load_shed_RT(s2,t1) - muLB_Lshed(s2,t1) = -5000
 dLag/RUp(g1,s2,t2): - lambda_PowerBalance_RT(s2,t2)
   + mu_RegUp_max_RT(g1,s2,t2) - muLB_RUp(g1,s2,t2) = -8
 dLag/RDn(g1,s2,t2): lambda_PowerBalance_RT(s2,t2)
   + mu_RegDown_max_RT(g1,s2,t2) - muLB_RDn(g1,s2,t2) = 8
 dLag/RUp(g2,s2,t2): - lambda_PowerBalance_RT(s2,t2)
   + mu_RegUp_max_RT(g2,s2,t2) - muLB_RUp(g2,s2,t2) = -13
 dLag/RDn(g2,s2,t2): lambda_PowerBalance_RT(s2,t2)
   + mu_RegDown_max_RT(g2,s2,t2) - muLB_RDn(g2,s2,t2) = 13
 dLag/RUpSC(g1,s2,t2): - lambda_PowerBalance_RT(s2,t2)
   + mu_RegUpSC_max_RT(g1,s2,t2) - muLB_RUpSC(g1,s2,t2) = -5.6
 dLag/RDnSC(g1,s2,t2): lambda_PowerBalance_RT(s2,t2)
   + mu_RegDnSC_max_RT(g1,s2,t2) - muLB_RDnSC(g1,s2,t2) = 5.6
 dLag/Wspill(w1,s2,t2): lambda_PowerBalance_RT(s2,t2)
   + mu_Max_wind_spill_RT(w1,s2,t2) - muLB_Wspill(w1,s2,t2) = 0
 dLag/Lshed(s2,t2): - lambda_PowerBalance_RT(s2,t2)
   + mu_Max_load_shed_RT(s2,t2) - muLB_Lshed(s2,t2) = -5000
 dLag/RUp(g1,s2,t3): - lambda_PowerBalance_RT(s2,t3)
   + mu_RegUp_max_RT(g1,s2,t3) - muLB_RUp(g1,s2,t3) = -8
 dLag/RDn(g1,s2,t3): lambda_PowerBalance_RT(s2,t3)
   + mu_RegDown_max_RT(g1,s2,t3) - muLB_RDn(g1,s2,t3) = 8
 dLag/RUp(g2,s2,t3): - lambda_PowerBalance_RT(s2,t3)
   + mu_RegUp_max_RT(g2,s2,t3) - muLB_RUp(g2,s2,t3) = -13
 dLag/RDn(g2,s2,t3): lambda_PowerBalance_RT(s2,t3)
   + mu_RegDown_max_RT(g2,s2,t3) - muLB_RDn(g2,s2,t3) = 13
 dLag/RUpSC(g1,s2,t3): - lambda_PowerBalance_RT(s2,t3)
   + mu_RegUpSC_max_RT(g1,s2,t3) - muLB_RUpSC(g1,s2,t3) = -5.6
 dLag/RDnSC(g1,s2,t3): lambda_PowerBalance_RT(s2,t3)
   + mu_RegDnSC_max_RT(g1,s2,t3) - muLB_RDnSC(g1,s2,t3) = 5.6
 dLag/Wspill(w1,s2,t3): lambda_PowerBalance_RT(s2,t3)
   + mu_Max_wind_spill_RT(w1,s2,t3) - muLB_Wspill(w1,s2,t3) = 0
 dLag/Lshed(s2,t3): - lambda_PowerBalance_RT(s2,t3)
   + mu_Max_load_shed_RT(s2,t3) - muLB_Lshed(s2,t3) = -5000
 dLag/RUp(g1,s2,t4): - lambda_PowerBalance_RT(s2,t4)
   + mu_RegUp_max_RT(g1,s2,t4) - muLB_RUp(g1,s2,t4) = -8
 dLag/RDn(g1,s2,t4): lambda_PowerBalance_RT(s2,t4)
   + mu_RegDown_max_RT(g1,s2,t4) - muLB_RDn(g1,s2,t4) = 8
 dLag/RUp(g2,s2,t4): - lambda_PowerBalance_RT(s2,t4)
   + mu_RegUp_max_RT(g2,s2,t4) - muLB_RUp(g2,s2,t4) = -13
 dLag/RDn(g2,s2,t4): lambda_PowerBalance_RT(s2,t4)
   + mu_RegDown_max_RT(g2,s2,t4) - muLB_RDn(g2,s2,t4) = 13
 dLag/RUpSC(g1,s2,t4): - lambda_PowerBalance_RT(s2,t4)
   + mu_RegUpSC_max_RT(g1,s2,t4) - muLB_RUpSC(g1,s2,t4) = -5.6
 dLag/RDnSC(g1,s2,t4): lambda_PowerBalance_RT(s2,t4)
   + mu_RegDnSC_max_RT(g1,s2,t4) - muLB_RDnSC(g1,s2,t4) = 5.6
 dLag/Wspill(w1,s2,t4): lambda_PowerBalance_RT(s2,t4)
   + mu_Max_wind_spill_RT(w1,s2,t4) - muLB_Wspill(w1,s2,t4) = 0
 dLag/Lshed(s2,t4): - lambda_PowerBalance_RT(s2,t4)
   + mu_Max_load_shed_RT(s2,t4) - muLB_Lshed(s2,t4) = -5000
Bounds
 lambda_PowerBalance_RT(s1,t1) free
 lambda_PowerBalance_RT(s1,t2) free
 lambda_PowerBalance_RT(s1,t3) free
 lambda_PowerBalance_RT(s1,t4) free
 lambda_PowerBalance_RT(s2,t1) free
 lambda_PowerBalance_RT(s2,t2) free
 lambda_PowerBalance_RT(s2,t3) free
 lambda_PowerBalance_RT(s2,t4) free
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
 s12:  S1 :: mu_RegUp_max_RT(g1,s1,t4):1 SOS1_RegUp_max_RT(g1,s1,t4):2
 s13:  S1 :: mu_RegDown_max_RT(g1,s1,t4):1 SOS1_RegDown_max_RT(g1,s1,t4):2
 s14:  S1 :: mu_RegUp_max_RT(g2,s1,t4):1 SOS1_RegUp_max_RT(g2,s1,t4):2
 s15:  S1 :: mu_RegDown_max_RT(g2,s1,t4):1 SOS1_RegDown_max_RT(g2,s1,t4):2
 s16:  S1 :: mu_RegUp_max_RT(g1,s2,t1):1 SOS1_RegUp_max_RT(g1,s2,t1):2
 s17:  S1 :: mu_RegDown_max_RT(g1,s2,t1):1 SOS1_RegDown_max_RT(g1,s2,t1):2
 s18:  S1 :: mu_RegUp_max_RT(g2,s2,t1):1 SOS1_RegUp_max_RT(g2,s2,t1):2
 s19:  S1 :: mu_RegDown_max_RT(g2,s2,t1):1 SOS1_RegDown_max_RT(g2,s2,t1):2
 s20:  S1 :: mu_RegUp_max_RT(g1,s2,t2):1 SOS1_RegUp_max_RT(g1,s2,t2):2
 s21:  S1 :: mu_RegDown_max_RT(g1,s2,t2):1 SOS1_RegDown_max_RT(g1,s2,t2):2
 s22:  S1 :: mu_RegUp_max_RT(g2,s2,t2):1 SOS1_RegUp_max_RT(g2,s2,t2):2
 s23:  S1 :: mu_RegDown_max_RT(g2,s2,t2):1 SOS1_RegDown_max_RT(g2,s2,t2):2
 s24:  S1 :: mu_RegUp_max_RT(g1,s2,t3):1 SOS1_RegUp_max_RT(g1,s2,t3):2
 s25:  S1 :: mu_RegDown_max_RT(g1,s2,t3):1 SOS1_RegDown_max_RT(g1,s2,t3):2
 s26:  S1 :: mu_RegUp_max_RT(g2,s2,t3):1 SOS1_RegUp_max_RT(g2,s2,t3):2
 s27:  S1 :: mu_RegDown_max_RT(g2,s2,t3):1 SOS1_RegDown_max_RT(g2,s2,t3):2
 s28:  S1 :: mu_RegUp_max_RT(g1,s2,t4):1 SOS1_RegUp_max_RT(g1,s2,t4):2
 s29:  S1 :: mu_RegDown_max_RT(g1,s2,t4):1 SOS1_RegDown_max_RT(g1,s2,t4):2
 s30:  S1 :: mu_RegUp_max_RT(g2,s2,t4):1 SOS1_RegUp_max_RT(g2,s2,t4):2
 s31:  S1 :: mu_RegDown_max_RT(g2,s2,t4):1 SOS1_RegDown_max_RT(g2,s2,t4):2
 s32:  S1 :: mu_RegUpSC_max_RT(g1,s1,t1):1 SOS1_RegUpSC_max_RT(g1,s1,t1):2
 s33:  S1 :: mu_RegDnSC_max_RT(g1,s1,t1):1 SOS1_RegDnSC_max_RT(g1,s1,t1):2
 s34:  S1 :: mu_RegUpSC_max_RT(g1,s1,t2):1 SOS1_RegUpSC_max_RT(g1,s1,t2):2
 s35:  S1 :: mu_RegDnSC_max_RT(g1,s1,t2):1 SOS1_RegDnSC_max_RT(g1,s1,t2):2
 s36:  S1 :: mu_RegUpSC_max_RT(g1,s1,t3):1 SOS1_RegUpSC_max_RT(g1,s1,t3):2
 s37:  S1 :: mu_RegDnSC_max_RT(g1,s1,t3):1 SOS1_RegDnSC_max_RT(g1,s1,t3):2
 s38:  S1 :: mu_RegUpSC_max_RT(g1,s1,t4):1 SOS1_RegUpSC_max_RT(g1,s1,t4):2
 s39:  S1 :: mu_RegDnSC_max_RT(g1,s1,t4):1 SOS1_RegDnSC_max_RT(g1,s1,t4):2
 s40:  S1 :: mu_RegUpSC_max_RT(g1,s2,t1):1 SOS1_RegUpSC_max_RT(g1,s2,t1):2
 s41:  S1 :: mu_RegDnSC_max_RT(g1,s2,t1):1 SOS1_RegDnSC_max_RT(g1,s2,t1):2
 s42:  S1 :: mu_RegUpSC_max_RT(g1,s2,t2):1 SOS1_RegUpSC_max_RT(g1,s2,t2):2
 s43:  S1 :: mu_RegDnSC_max_RT(g1,s2,t2):1 SOS1_RegDnSC_max_RT(g1,s2,t2):2
 s44:  S1 :: mu_RegUpSC_max_RT(g1,s2,t3):1 SOS1_RegUpSC_max_RT(g1,s2,t3):2
 s45:  S1 :: mu_RegDnSC_max_RT(g1,s2,t3):1 SOS1_RegDnSC_max_RT(g1,s2,t3):2
 s46:  S1 :: mu_RegUpSC_max_RT(g1,s2,t4):1 SOS1_RegUpSC_max_RT(g1,s2,t4):2
 s47:  S1 :: mu_RegDnSC_max_RT(g1,s2,t4):1 SOS1_RegDnSC_max_RT(g1,s2,t4):2
 s48:  S1 :: mu_Max_load_shed_RT(s1,t1):1 SOS1_Max_load_shed_RT(s1,t1):2
 s49:  S1 :: mu_Max_load_shed_RT(s1,t2):1 SOS1_Max_load_shed_RT(s1,t2):2
 s50:  S1 :: mu_Max_load_shed_RT(s1,t3):1 SOS1_Max_load_shed_RT(s1,t3):2
 s51:  S1 :: mu_Max_load_shed_RT(s1,t4):1 SOS1_Max_load_shed_RT(s1,t4):2
 s52:  S1 :: mu_Max_load_shed_RT(s2,t1):1 SOS1_Max_load_shed_RT(s2,t1):2
 s53:  S1 :: mu_Max_load_shed_RT(s2,t2):1 SOS1_Max_load_shed_RT(s2,t2):2
 s54:  S1 :: mu_Max_load_shed_RT(s2,t3):1 SOS1_Max_load_shed_RT(s2,t3):2
 s55:  S1 :: mu_Max_load_shed_RT(s2,t4):1 SOS1_Max_load_shed_RT(s2,t4):2
 s56:  S1 :: mu_Max_wind_spill_RT(w1,s1,t1):1
     SOS1_Max_wind_spill_RT(w1,s1,t1):2
 s57:  S1 :: mu_Max_wind_spill_RT(w1,s1,t2):1
     SOS1_Max_wind_spill_RT(w1,s1,t2):2
 s58:  S1 :: mu_Max_wind_spill_RT(w1,s1,t3):1
     SOS1_Max_wind_spill_RT(w1,s1,t3):2
 s59:  S1 :: mu_Max_wind_spill_RT(w1,s1,t4):1
     SOS1_Max_wind_spill_RT(w1,s1,t4):2
 s60:  S1 :: mu_Max_wind_spill_RT(w1,s2,t1):1
     SOS1_Max_wind_spill_RT(w1,s2,t1):2
 s61:  S1 :: mu_Max_wind_spill_RT(w1,s2,t2):1
     SOS1_Max_wind_spill_RT(w1,s2,t2):2
 s62:  S1 :: mu_Max_wind_spill_RT(w1,s2,t3):1
     SOS1_Max_wind_spill_RT(w1,s2,t3):2
 s63:  S1 :: mu_Max_wind_spill_RT(w1,s2,t4):1
     SOS1_Max_wind_spill_RT(w1,s2,t4):2
 s64:  S1 :: muLB_RUp(g1,s1,t1):1 SOS1_LB_RUp(g1,s1,t1):2
 s65:  S1 :: muLB_RDn(g1,s1,t1):1 SOS1_LB_RDn(g1,s1,t1):2
 s66:  S1 :: muLB_RUp(g2,s1,t1):1 SOS1_LB_RUp(g2,s1,t1):2
 s67:  S1 :: muLB_RDn(g2,s1,t1):1 SOS1_LB_RDn(g2,s1,t1):2
 s68:  S1 :: muLB_RUpSC(g1,s1,t1):1 SOS1_LB_RUpSC(g1,s1,t1):2
 s69:  S1 :: muLB_RDnSC(g1,s1,t1):1 SOS1_LB_RDnSC(g1,s1,t1):2
 s70:  S1 :: muLB_Wspill(w1,s1,t1):1 SOS1_LB_Wspill(w1,s1,t1):2
 s71:  S1 :: muLB_Lshed(s1,t1):1 SOS1_LB_Lshed(s1,t1):2
 s72:  S1 :: muLB_RUp(g1,s1,t2):1 SOS1_LB_RUp(g1,s1,t2):2
 s73:  S1 :: muLB_RDn(g1,s1,t2):1 SOS1_LB_RDn(g1,s1,t2):2
 s74:  S1 :: muLB_RUp(g2,s1,t2):1 SOS1_LB_RUp(g2,s1,t2):2
 s75:  S1 :: muLB_RDn(g2,s1,t2):1 SOS1_LB_RDn(g2,s1,t2):2
 s76:  S1 :: muLB_RUpSC(g1,s1,t2):1 SOS1_LB_RUpSC(g1,s1,t2):2
 s77:  S1 :: muLB_RDnSC(g1,s1,t2):1 SOS1_LB_RDnSC(g1,s1,t2):2
 s78:  S1 :: muLB_Wspill(w1,s1,t2):1 SOS1_LB_Wspill(w1,s1,t2):2
 s79:  S1 :: muLB_Lshed(s1,t2):1 SOS1_LB_Lshed(s1,t2):2
 s80:  S1 :: muLB_RUp(g1,s1,t3):1 SOS1_LB_RUp(g1,s1,t3):2
 s81:  S1 :: muLB_RDn(g1,s1,t3):1 SOS1_LB_RDn(g1,s1,t3):2
 s82:  S1 :: muLB_RUp(g2,s1,t3):1 SOS1_LB_RUp(g2,s1,t3):2
 s83:  S1 :: muLB_RDn(g2,s1,t3):1 SOS1_LB_RDn(g2,s1,t3):2
 s84:  S1 :: muLB_RUpSC(g1,s1,t3):1 SOS1_LB_RUpSC(g1,s1,t3):2
 s85:  S1 :: muLB_RDnSC(g1,s1,t3):1 SOS1_LB_RDnSC(g1,s1,t3):2
 s86:  S1 :: muLB_Wspill(w1,s1,t3):1 SOS1_LB_Wspill(w1,s1,t3):2
 s87:  S1 :: muLB_Lshed(s1,t3):1 SOS1_LB_Lshed(s1,t3):2
 s88:  S1 :: muLB_RUp(g1,s1,t4):1 SOS1_LB_RUp(g1,s1,t4):2
 s89:  S1 :: muLB_RDn(g1,s1,t4):1 SOS1_LB_RDn(g1,s1,t4):2
 s90:  S1 :: muLB_RUp(g2,s1,t4):1 SOS1_LB_RUp(g2,s1,t4):2
 s91:  S1 :: muLB_RDn(g2,s1,t4):1 SOS1_LB_RDn(g2,s1,t4):2
 s92:  S1 :: muLB_RUpSC(g1,s1,t4):1 SOS1_LB_RUpSC(g1,s1,t4):2
 s93:  S1 :: muLB_RDnSC(g1,s1,t4):1 SOS1_LB_RDnSC(g1,s1,t4):2
 s94:  S1 :: muLB_Wspill(w1,s1,t4):1 SOS1_LB_Wspill(w1,s1,t4):2
 s95:  S1 :: muLB_Lshed(s1,t4):1 SOS1_LB_Lshed(s1,t4):2
 s96:  S1 :: muLB_RUp(g1,s2,t1):1 SOS1_LB_RUp(g1,s2,t1):2
 s97:  S1 :: muLB_RDn(g1,s2,t1):1 SOS1_LB_RDn(g1,s2,t1):2
 s98:  S1 :: muLB_RUp(g2,s2,t1):1 SOS1_LB_RUp(g2,s2,t1):2
 s99:  S1 :: muLB_RDn(g2,s2,t1):1 SOS1_LB_RDn(g2,s2,t1):2
 s100:  S1 :: muLB_RUpSC(g1,s2,t1):1 SOS1_LB_RUpSC(g1,s2,t1):2
 s101:  S1 :: muLB_RDnSC(g1,s2,t1):1 SOS1_LB_RDnSC(g1,s2,t1):2
 s102:  S1 :: muLB_Wspill(w1,s2,t1):1 SOS1_LB_Wspill(w1,s2,t1):2
 s103:  S1 :: muLB_Lshed(s2,t1):1 SOS1_LB_Lshed(s2,t1):2
 s104:  S1 :: muLB_RUp(g1,s2,t2):1 SOS1_LB_RUp(g1,s2,t2):2
 s105:  S1 :: muLB_RDn(g1,s2,t2):1 SOS1_LB_RDn(g1,s2,t2):2
 s106:  S1 :: muLB_RUp(g2,s2,t2):1 SOS1_LB_RUp(g2,s2,t2):2
 s107:  S1 :: muLB_RDn(g2,s2,t2):1 SOS1_LB_RDn(g2,s2,t2):2
 s108:  S1 :: muLB_RUpSC(g1,s2,t2):1 SOS1_LB_RUpSC(g1,s2,t2):2
 s109:  S1 :: muLB_RDnSC(g1,s2,t2):1 SOS1_LB_RDnSC(g1,s2,t2):2
 s110:  S1 :: muLB_Wspill(w1,s2,t2):1 SOS1_LB_Wspill(w1,s2,t2):2
 s111:  S1 :: muLB_Lshed(s2,t2):1 SOS1_LB_Lshed(s2,t2):2
 s112:  S1 :: muLB_RUp(g1,s2,t3):1 SOS1_LB_RUp(g1,s2,t3):2
 s113:  S1 :: muLB_RDn(g1,s2,t3):1 SOS1_LB_RDn(g1,s2,t3):2
 s114:  S1 :: muLB_RUp(g2,s2,t3):1 SOS1_LB_RUp(g2,s2,t3):2
 s115:  S1 :: muLB_RDn(g2,s2,t3):1 SOS1_LB_RDn(g2,s2,t3):2
 s116:  S1 :: muLB_RUpSC(g1,s2,t3):1 SOS1_LB_RUpSC(g1,s2,t3):2
 s117:  S1 :: muLB_RDnSC(g1,s2,t3):1 SOS1_LB_RDnSC(g1,s2,t3):2
 s118:  S1 :: muLB_Wspill(w1,s2,t3):1 SOS1_LB_Wspill(w1,s2,t3):2
 s119:  S1 :: muLB_Lshed(s2,t3):1 SOS1_LB_Lshed(s2,t3):2
 s120:  S1 :: muLB_RUp(g1,s2,t4):1 SOS1_LB_RUp(g1,s2,t4):2
 s121:  S1 :: muLB_RDn(g1,s2,t4):1 SOS1_LB_RDn(g1,s2,t4):2
 s122:  S1 :: muLB_RUp(g2,s2,t4):1 SOS1_LB_RUp(g2,s2,t4):2
 s123:  S1 :: muLB_RDn(g2,s2,t4):1 SOS1_LB_RDn(g2,s2,t4):2
 s124:  S1 :: muLB_RUpSC(g1,s2,t4):1 SOS1_LB_RUpSC(g1,s2,t4):2
 s125:  S1 :: muLB_RDnSC(g1,s2,t4):1 SOS1_LB_RDnSC(g1,s2,t4):2
 s126:  S1 :: muLB_Wspill(w1,s2,t4):1 SOS1_LB_Wspill(w1,s2,t4):2
 s127:  S1 :: muLB_Lshed(s2,t4):1 SOS1_LB_Lshed(s2,t4):2
End
