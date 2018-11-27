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
 Pmax_DA_GFPP(g1,t1): 30 u(sc1) + Pgen(g1,t1) + RCup(g1,t1) <= 150
 Pmax_DA_GFPP(g2,t1): Pgen(g2,t1) + RCup(g2,t1) <= 0
 Pmax_DA_GFPP(g1,t2): 30 u(sc1) + Pgen(g1,t2) + RCup(g1,t2) <= 150
 Pmax_DA_GFPP(g2,t2): Pgen(g2,t2) + RCup(g2,t2) <= 0
 Pmax_DA_GFPP(g1,t3): 30 u(sc1) + Pgen(g1,t3) + RCup(g1,t3) <= 150
 Pmax_DA_GFPP(g2,t3): Pgen(g2,t3) + RCup(g2,t3) <= 0
 Pmin_DA_GFPP(g1,t1): - Pgen(g1,t1) + RCdn(g1,t1) <= 0
 Pmin_DA(g2,t1): - Pgen(g2,t1) + RCdn(g2,t1) <= 0
 Pmin_DA_GFPP(g1,t2): - Pgen(g1,t2) + RCdn(g1,t2) <= 0
 Pmin_DA(g2,t2): - Pgen(g2,t2) + RCdn(g2,t2) <= 0
 Pmin_DA_GFPP(g1,t3): - Pgen(g1,t3) + RCdn(g1,t3) <= 0
 Pmin_DA(g2,t3): - Pgen(g2,t3) + RCdn(g2,t3) <= 0
 Wind_Max_DA(w1,t1): WindDA(w1,t1) <= 15
 Wind_Max_DA(w1,t2): WindDA(w1,t2) <= 20
 Wind_Max_DA(w1,t3): WindDA(w1,t3) <= 1
 SW_Active(g1t1): u(sc1) <= 1
 SW_Active(g1t2): u(sc1) <= 1
 SW_Active(g1t3): u(sc1) <= 1
 PgenSCmax(g1,t1): - 30 u(sc1) + PgenSC(g1,t1) <= 0
 PgenSCmin(g1,t1): 10 u(sc1) - PgenSC(g1,t1) <= 0
 RCupSCmax(g1,t1): - 30 u(sc1) + PgenSC(g1,t1) + RCupSC(g1,t1) <= 0
 RCdnSCmin(g1,t1): 10 u(sc1) - PgenSC(g1,t1) + RCdnSC(g1,t1) <= 0
 PgenSCmax(g1,t2): - 30 u(sc1) + PgenSC(g1,t2) <= 0
 PgenSCmin(g1,t2): 10 u(sc1) - PgenSC(g1,t2) <= 0
 RCupSCmax(g1,t2): - 30 u(sc1) + PgenSC(g1,t2) + RCupSC(g1,t2) <= 0
 RCdnSCmin(g1,t2): 10 u(sc1) - PgenSC(g1,t2) + RCdnSC(g1,t2) <= 0
 PgenSCmax(g1,t3): - 30 u(sc1) + PgenSC(g1,t3) <= 0
 PgenSCmin(g1,t3): 10 u(sc1) - PgenSC(g1,t3) <= 0
 RCupSCmax(g1,t3): - 30 u(sc1) + PgenSC(g1,t3) + RCupSC(g1,t3) <= 0
 RCdnSCmin(g1,t3): 10 u(sc1) - PgenSC(g1,t3) + RCdnSC(g1,t3) <= 0
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
Bounds
Binaries
 u(sc1)
End
