\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  16 Pgen(g1,t1) + 16 Pgen(g1,t2) + 16 Pgen(g1,t3) + 16 Pgen(g1,t4)
   + 17 Pgen(g2,t1) + 17 Pgen(g2,t2) + 17 Pgen(g2,t3) + 17 Pgen(g2,t4)
   + 160 PgenSC(g1,t1) + 160 PgenSC(g1,t2) + 160 PgenSC(g1,t3)
   + 160 PgenSC(g1,t4) + 8 RUp(g1,s1,t1) - 8 RDn(g1,s1,t1)
   + 8.5 RUp(g2,s1,t1) - 8.5 RDn(g2,s1,t1) + 80 RUpSC(g1,s1,t1)
   - 80 RDnSC(g1,s1,t1) + 500 Lshed(s1,t1) + 8 RUp(g1,s1,t2)
   - 8 RDn(g1,s1,t2) + 8.5 RUp(g2,s1,t2) - 8.5 RDn(g2,s1,t2)
   + 80 RUpSC(g1,s1,t2) - 80 RDnSC(g1,s1,t2) + 500 Lshed(s1,t2)
   + 8 RUp(g1,s1,t3) - 8 RDn(g1,s1,t3) + 8.5 RUp(g2,s1,t3)
   - 8.5 RDn(g2,s1,t3) + 80 RUpSC(g1,s1,t3) - 80 RDnSC(g1,s1,t3)
   + 500 Lshed(s1,t3) + 8 RUp(g1,s1,t4) - 8 RDn(g1,s1,t4)
   + 8.5 RUp(g2,s1,t4) - 8.5 RDn(g2,s1,t4) + 80 RUpSC(g1,s1,t4)
   - 80 RDnSC(g1,s1,t4) + 500 Lshed(s1,t4) + 8 RUp(g1,s2,t1)
   - 8 RDn(g1,s2,t1) + 8.5 RUp(g2,s2,t1) - 8.5 RDn(g2,s2,t1)
   + 80 RUpSC(g1,s2,t1) - 80 RDnSC(g1,s2,t1) + 500 Lshed(s2,t1)
   + 8 RUp(g1,s2,t2) - 8 RDn(g1,s2,t2) + 8.5 RUp(g2,s2,t2)
   - 8.5 RDn(g2,s2,t2) + 80 RUpSC(g1,s2,t2) - 80 RDnSC(g1,s2,t2)
   + 500 Lshed(s2,t2) + 8 RUp(g1,s2,t3) - 8 RDn(g1,s2,t3)
   + 8.5 RUp(g2,s2,t3) - 8.5 RDn(g2,s2,t3) + 80 RUpSC(g1,s2,t3)
   - 80 RDnSC(g1,s2,t3) + 500 Lshed(s2,t3) + 8 RUp(g1,s2,t4)
   - 8 RDn(g1,s2,t4) + 8.5 RUp(g2,s2,t4) - 8.5 RDn(g2,s2,t4)
   + 80 RUpSC(g1,s2,t4) - 80 RDnSC(g1,s2,t4) + 500 Lshed(s2,t4)
Subject To
 PowerBalance_DA(t1): Pgen(g1,t1) + Pgen(g2,t1) + PgenSC(g1,t1)
   + WindDA(w1,t1) = 50
 PowerBalance_DA(t2): Pgen(g1,t2) + Pgen(g2,t2) + PgenSC(g1,t2)
   + WindDA(w1,t2) = 51.29409523
 PowerBalance_DA(t3): Pgen(g1,t3) + Pgen(g2,t3) + PgenSC(g1,t3)
   + WindDA(w1,t3) = 52.5
 PowerBalance_DA(t4): Pgen(g1,t4) + Pgen(g2,t4) + PgenSC(g1,t4)
   + WindDA(w1,t4) = 53.53553391
 Pmax_DA_GFPP(g1,t1): Pgen(g1,t1) + PgenSC(g1,t1) + RCup(g1,t1)
   + RCupSC(g1,t1) <= 150
 Pmax_DA_GFPP(g2,t1): Pgen(g2,t1) + RCup(g2,t1) <= 9
 Pmax_DA_GFPP(g1,t2): Pgen(g1,t2) + PgenSC(g1,t2) + RCup(g1,t2)
   + RCupSC(g1,t2) <= 150
 Pmax_DA_GFPP(g2,t2): Pgen(g2,t2) + RCup(g2,t2) <= 9
 Pmax_DA_GFPP(g1,t3): Pgen(g1,t3) + PgenSC(g1,t3) + RCup(g1,t3)
   + RCupSC(g1,t3) <= 150
 Pmax_DA_GFPP(g2,t3): Pgen(g2,t3) + RCup(g2,t3) <= 9
 Pmax_DA_GFPP(g1,t4): Pgen(g1,t4) + PgenSC(g1,t4) + RCup(g1,t4)
   + RCupSC(g1,t4) <= 150
 Pmax_DA_GFPP(g2,t4): Pgen(g2,t4) + RCup(g2,t4) <= 9
 Pmin_DA_GFPP(g1,t1): - Pgen(g1,t1) - PgenSC(g1,t1) + RCdn(g1,t1)
   + RCdnSC(g1,t1) <= 0
 Pmin_DA(g2,t1): - Pgen(g2,t1) + RCup(g2,t1) <= 0
 Pmin_DA_GFPP(g1,t2): - Pgen(g1,t2) - PgenSC(g1,t2) + RCdn(g1,t2)
   + RCdnSC(g1,t2) <= 0
 Pmin_DA(g2,t2): - Pgen(g2,t2) + RCup(g2,t2) <= 0
 Pmin_DA_GFPP(g1,t3): - Pgen(g1,t3) - PgenSC(g1,t3) + RCdn(g1,t3)
   + RCdnSC(g1,t3) <= 0
 Pmin_DA(g2,t3): - Pgen(g2,t3) + RCup(g2,t3) <= 0
 Pmin_DA_GFPP(g1,t4): - Pgen(g1,t4) - PgenSC(g1,t4) + RCdn(g1,t4)
   + RCdnSC(g1,t4) <= 0
 Pmin_DA(g2,t4): - Pgen(g2,t4) + RCup(g2,t4) <= 0
 Wind_Max_DA(w1,t1): WindDA(w1,t1) <= 7.631893890000001
 Wind_Max_DA(w1,t2): WindDA(w1,t2) <= 7.846999950000001
 Wind_Max_DA(w1,t3): WindDA(w1,t3) <= 5.566136865
 Wind_Max_DA(w1,t4): WindDA(w1,t4) <= 5.741271809999999
 SW_Active(g1t1): u(sc1) <= 1
 SW_Active(g1t2): u(sc1) <= 1
 SW_Active(g1t3): u(sc1) <= 1
 SW_Active(g1t4): u(sc1) <= 1
 PgenSCmax(g1,t1): - 10 u(sc1) + PgenSC(g1,t1) <= 0
 PgenSCmin(g1,t1): u(sc1) - PgenSC(g1,t1) <= 0
 RCupSCmax(g1,t1): - 10 u(sc1) + PgenSC(g1,t1) + RCupSC(g1,t1) <= 0
 RCdnSCmin(g1,t1): u(sc1) - PgenSC(g1,t1) + RCdnSC(g1,t1) <= 0
 PgenSCmax(g1,t2): - 10 u(sc1) + PgenSC(g1,t2) <= 0
 PgenSCmin(g1,t2): u(sc1) - PgenSC(g1,t2) <= 0
 RCupSCmax(g1,t2): - 10 u(sc1) + PgenSC(g1,t2) + RCupSC(g1,t2) <= 0
 RCdnSCmin(g1,t2): u(sc1) - PgenSC(g1,t2) + RCdnSC(g1,t2) <= 0
 PgenSCmax(g1,t3): - 10 u(sc1) + PgenSC(g1,t3) <= 0
 PgenSCmin(g1,t3): u(sc1) - PgenSC(g1,t3) <= 0
 RCupSCmax(g1,t3): - 10 u(sc1) + PgenSC(g1,t3) + RCupSC(g1,t3) <= 0
 RCdnSCmin(g1,t3): u(sc1) - PgenSC(g1,t3) + RCdnSC(g1,t3) <= 0
 PgenSCmax(g1,t4): - 10 u(sc1) + PgenSC(g1,t4) <= 0
 PgenSCmin(g1,t4): u(sc1) - PgenSC(g1,t4) <= 0
 RCupSCmax(g1,t4): - 10 u(sc1) + PgenSC(g1,t4) + RCupSC(g1,t4) <= 0
 RCdnSCmin(g1,t4): u(sc1) - PgenSC(g1,t4) + RCdnSC(g1,t4) <= 0
 PowerBalance_RT(s1,t1): - WindDA(w1,t1) + RUp(g1,s1,t1) - RDn(g1,s1,t1)
   + RUp(g2,s1,t1) - RDn(g2,s1,t1) + RUpSC(g1,s1,t1) - RDnSC(g1,s1,t1)
   - Wspill(w1,s1,t1) + Lshed(s1,t1) = -1.6185495
 PowerBalance_RT(s1,t2): - WindDA(w1,t2) + RUp(g1,s1,t2) - RDn(g1,s1,t2)
   + RUp(g2,s1,t2) - RDn(g2,s1,t2) + RUpSC(g1,s1,t2) - RDnSC(g1,s1,t2)
   - Wspill(w1,s1,t2) + Lshed(s1,t2) = -1.56189987
 PowerBalance_RT(s1,t3): - WindDA(w1,t3) + RUp(g1,s1,t3) - RDn(g1,s1,t3)
   + RUp(g2,s1,t3) - RDn(g2,s1,t3) + RUpSC(g1,s1,t3) - RDnSC(g1,s1,t3)
   - Wspill(w1,s1,t3) + Lshed(s1,t3) = -1.56099951
 PowerBalance_RT(s1,t4): - WindDA(w1,t4) + RUp(g1,s1,t4) - RDn(g1,s1,t4)
   + RUp(g2,s1,t4) - RDn(g2,s1,t4) + RUpSC(g1,s1,t4) - RDnSC(g1,s1,t4)
   - Wspill(w1,s1,t4) + Lshed(s1,t4) = -1.23759195
 PowerBalance_RT(s2,t1): - WindDA(w1,t1) + RUp(g1,s2,t1) - RDn(g1,s2,t1)
   + RUp(g2,s2,t1) - RDn(g2,s2,t1) + RUpSC(g1,s2,t1) - RDnSC(g1,s2,t1)
   - Wspill(w1,s2,t1) + Lshed(s2,t1) = -13.64523828
 PowerBalance_RT(s2,t2): - WindDA(w1,t2) + RUp(g1,s2,t2) - RDn(g1,s2,t2)
   + RUp(g2,s2,t2) - RDn(g2,s2,t2) + RUpSC(g1,s2,t2) - RDnSC(g1,s2,t2)
   - Wspill(w1,s2,t2) + Lshed(s2,t2) = -14.13210003
 PowerBalance_RT(s2,t3): - WindDA(w1,t3) + RUp(g1,s2,t3) - RDn(g1,s2,t3)
   + RUp(g2,s2,t3) - RDn(g2,s2,t3) + RUpSC(g1,s2,t3) - RDnSC(g1,s2,t3)
   - Wspill(w1,s2,t3) + Lshed(s2,t3) = -9.571274219999999
 PowerBalance_RT(s2,t4): - WindDA(w1,t4) + RUp(g1,s2,t4) - RDn(g1,s2,t4)
   + RUp(g2,s2,t4) - RDn(g2,s2,t4) + RUpSC(g1,s2,t4) - RDnSC(g1,s2,t4)
   - Wspill(w1,s2,t4) + Lshed(s2,t4) = -10.24495167
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
 RegUp_max_RT(g1,s1,t4): - RCup(g1,t4) + RUp(g1,s1,t4) <= 0
 RegDown_max_RT(g1,s1,t4): - RCdn(g1,t4) + RDn(g1,s1,t4) <= 0
 RegUp_max_RT(g2,s1,t4): - RCup(g2,t4) + RUp(g2,s1,t4) <= 0
 RegDown_max_RT(g2,s1,t4): - RCdn(g2,t4) + RDn(g2,s1,t4) <= 0
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
 RegUp_max_RT(g1,s2,t4): - RCup(g1,t4) + RUp(g1,s2,t4) <= 0
 RegDown_max_RT(g1,s2,t4): - RCdn(g1,t4) + RDn(g1,s2,t4) <= 0
 RegUp_max_RT(g2,s2,t4): - RCup(g2,t4) + RUp(g2,s2,t4) <= 0
 RegDown_max_RT(g2,s2,t4): - RCdn(g2,t4) + RDn(g2,s2,t4) <= 0
 RegUpSC_max_RT(g1,s1,t1): - RCupSC(g1,t1) + RUpSC(g1,s1,t1) <= 0
 RegDnSC_max_RT(g1,s1,t1): - RCdnSC(g1,t1) + RDnSC(g1,s1,t1) <= 0
 RegUpSC_max_RT(g1,s1,t2): - RCupSC(g1,t2) + RUpSC(g1,s1,t2) <= 0
 RegDnSC_max_RT(g1,s1,t2): - RCdnSC(g1,t2) + RDnSC(g1,s1,t2) <= 0
 RegUpSC_max_RT(g1,s1,t3): - RCupSC(g1,t3) + RUpSC(g1,s1,t3) <= 0
 RegDnSC_max_RT(g1,s1,t3): - RCdnSC(g1,t3) + RDnSC(g1,s1,t3) <= 0
 RegUpSC_max_RT(g1,s1,t4): - RCupSC(g1,t4) + RUpSC(g1,s1,t4) <= 0
 RegDnSC_max_RT(g1,s1,t4): - RCdnSC(g1,t4) + RDnSC(g1,s1,t4) <= 0
 RegUpSC_max_RT(g1,s2,t1): - RCupSC(g1,t1) + RUpSC(g1,s2,t1) <= 0
 RegDnSC_max_RT(g1,s2,t1): - RCdnSC(g1,t1) + RDnSC(g1,s2,t1) <= 0
 RegUpSC_max_RT(g1,s2,t2): - RCupSC(g1,t2) + RUpSC(g1,s2,t2) <= 0
 RegDnSC_max_RT(g1,s2,t2): - RCdnSC(g1,t2) + RDnSC(g1,s2,t2) <= 0
 RegUpSC_max_RT(g1,s2,t3): - RCupSC(g1,t3) + RUpSC(g1,s2,t3) <= 0
 RegDnSC_max_RT(g1,s2,t3): - RCdnSC(g1,t3) + RDnSC(g1,s2,t3) <= 0
 RegUpSC_max_RT(g1,s2,t4): - RCupSC(g1,t4) + RUpSC(g1,s2,t4) <= 0
 RegDnSC_max_RT(g1,s2,t4): - RCdnSC(g1,t4) + RDnSC(g1,s2,t4) <= 0
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
Binaries
 u(sc1)
End
