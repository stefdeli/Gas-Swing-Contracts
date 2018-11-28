NAME 
* Max problem is converted into Min one
ROWS
 N  OBJ
 E  PowerBalance_DA(t1)
 L  Pmax_DA_GFPP(g2,t1)
 L  Pmin_DA_GFPP(g1,t1)
 L  Pmin_DA(g2,t1)
 L  Wind_Max_DA(w1,t1)
 E  PowerBalance_RT(s1,t1)
 E  PowerBalance_RT(s2,t1)
 L  RegUp_max_RT(g1,s1,t1)
 L  RegDown_max_RT(g1,s1,t1)
 L  RegUp_max_RT(g2,s1,t1)
 L  RegDown_max_RT(g2,s1,t1)
 L  RegUp_max_RT(g1,s2,t1)
 L  RegDown_max_RT(g1,s2,t1)
 L  RegUp_max_RT(g2,s2,t1)
 L  RegDown_max_RT(g2,s2,t1)
 L  RegUpSC_max_RT(g1,s1,t1)
 L  RegDnSC_max_RT(g1,s1,t1)
 L  RegUpSC_max_RT(g1,s2,t1)
 L  RegDnSC_max_RT(g1,s2,t1)
 L  Max_load_shed_RT(s1,t1)
 L  Max_load_shed_RT(s2,t1)
 L  Max_wind_spill_RT(w1,s1,t1)
 L  Max_wind_spill_RT(w1,s2,t1)
 E  SOS1_Pmax_DA_GFPP(g2,t1)
 E  SOS1_Pmin_DA_GFPP(g1,t1)
 E  SOS1_Pmin_DA(g2,t1)
 E  SOS1_Wind_Max_DA(w1,t1)
 E  SOS1_RegUp_max_RT(g1,s1,t1)
 E  SOS1_RegDown_max_RT(g1,s1,t1)
 E  SOS1_RegUp_max_RT(g2,s1,t1)
 E  SOS1_RegDown_max_RT(g2,s1,t1)
 E  SOS1_RegUp_max_RT(g1,s2,t1)
 E  SOS1_RegDown_max_RT(g1,s2,t1)
 E  SOS1_RegUp_max_RT(g2,s2,t1)
 E  SOS1_RegDown_max_RT(g2,s2,t1)
 E  SOS1_RegUpSC_max_RT(g1,s1,t1)
 E  SOS1_RegDnSC_max_RT(g1,s1,t1)
 E  SOS1_RegUpSC_max_RT(g1,s2,t1)
 E  SOS1_RegDnSC_max_RT(g1,s2,t1)
 E  SOS1_Max_load_shed_RT(s1,t1)
 E  SOS1_Max_load_shed_RT(s2,t1)
 E  SOS1_Max_wind_spill_RT(w1,s1,t1)
 E  SOS1_Max_wind_spill_RT(w1,s2,t1)
 E  SOS1_LB_Pgen(g1,t1)
 E  SOS1_LB_Pgen(g2,t1)
 E  SOS1_LB_PgenSC(g1,t1)
 E  SOS1_LB_RCup(g1,t1)
 E  SOS1_LB_RCup(g2,t1)
 E  SOS1_LB_RCdn(g1,t1)
 E  SOS1_LB_RCdn(g2,t1)
 E  SOS1_LB_RCupSC(g1,t1)
 E  SOS1_LB_RCdnSC(g1,t1)
 E  SOS1_LB_WindDA(w1,t1)
 E  SOS1_LB_RUp(g1,s1,t1)
 E  SOS1_LB_RDn(g1,s1,t1)
 E  SOS1_LB_RUp(g2,s1,t1)
 E  SOS1_LB_RDn(g2,s1,t1)
 E  SOS1_LB_RUpSC(g1,s1,t1)
 E  SOS1_LB_RDnSC(g1,s1,t1)
 E  SOS1_LB_Wspill(w1,s1,t1)
 E  SOS1_LB_Lshed(s1,t1)
 E  SOS1_LB_RUp(g1,s2,t1)
 E  SOS1_LB_RDn(g1,s2,t1)
 E  SOS1_LB_RUp(g2,s2,t1)
 E  SOS1_LB_RDn(g2,s2,t1)
 E  SOS1_LB_RUpSC(g1,s2,t1)
 E  SOS1_LB_RDnSC(g1,s2,t1)
 E  SOS1_LB_Wspill(w1,s2,t1)
 E  SOS1_LB_Lshed(s2,t1)
 E  dLag/Pgen(g2,t1)
 E  dLag/RCup(g1,t1)
 E  dLag/RCup(g2,t1)
 E  dLag/RCdn(g1,t1)
 E  dLag/RCdn(g2,t1)
 E  dLag/RCupSC(g1,t1)
 E  dLag/RCdnSC(g1,t1)
 E  dLag/WindDA(w1,t1)
 E  dLag/RUp(g2,s1,t1)
 E  dLag/RDn(g2,s1,t1)
 E  dLag/Wspill(w1,s1,t1)
 E  dLag/Lshed(s1,t1)
 E  dLag/RUp(g2,s2,t1)
 E  dLag/RDn(g2,s2,t1)
 E  dLag/Wspill(w1,s2,t1)
 E  dLag/Lshed(s2,t1)
 L  gshed_da_max(ng101,k0,t1)
 L  gshed_da_max(ng101,k1,t1)
 L  gshed_da_max(ng101,k2,t1)
 L  gprod_max(gw1,k0,t1)
 L  gprod_max(gw1,k1,t1)
 L  gprod_max(gw1,k2,t1)
 L  gprod_max(gw2,k0,t1)
 L  gprod_max(gw2,k1,t1)
 L  gprod_max(gw2,k2,t1)
 L  gprod_max(gw3,k0,t1)
 L  gprod_max(gw3,k1,t1)
 L  gprod_max(gw3,k2,t1)
 E  SOS1_gshed_da_max(ng101,k0,t1)
 E  SOS1_gshed_da_max(ng101,k1,t1)
 E  SOS1_gshed_da_max(ng101,k2,t1)
 E  SOS1_gprod_max(gw1,k0,t1)
 E  SOS1_gprod_max(gw1,k1,t1)
 E  SOS1_gprod_max(gw1,k2,t1)
 E  SOS1_gprod_max(gw2,k0,t1)
 E  SOS1_gprod_max(gw2,k1,t1)
 E  SOS1_gprod_max(gw2,k2,t1)
 E  SOS1_gprod_max(gw3,k0,t1)
 E  SOS1_gprod_max(gw3,k1,t1)
 E  SOS1_gprod_max(gw3,k2,t1)
 E  SOS1_LB_gshed_da(ng101,k0,t1)
 E  SOS1_LB_gshed_da(ng101,k1,t1)
 E  SOS1_LB_gshed_da(ng101,k2,t1)
 E  SOS1_LB_gprod(gw1,k0,t1)
 E  SOS1_LB_gprod(gw1,k1,t1)
 E  SOS1_LB_gprod(gw1,k2,t1)
 E  SOS1_LB_gprod(gw2,k0,t1)
 E  SOS1_LB_gprod(gw2,k1,t1)
 E  SOS1_LB_gprod(gw2,k2,t1)
 E  SOS1_LB_gprod(gw3,k0,t1)
 E  SOS1_LB_gprod(gw3,k1,t1)
 E  SOS1_LB_gprod(gw3,k2,t1)
 E  dLag/gshed_da(ng101,k0,t1)
 E  dLag/gshed_da(ng101,k1,t1)
 E  dLag/gshed_da(ng101,k2,t1)
 E  dLag/gprod(gw1,k0,t1)
 E  dLag/gprod(gw1,k1,t1)
 E  dLag/gprod(gw1,k2,t1)
 E  dLag/gprod(gw2,k0,t1)
 E  dLag/gprod(gw2,k1,t1)
 E  dLag/gprod(gw2,k2,t1)
 E  dLag/gprod(gw3,k0,t1)
 E  dLag/gprod(gw3,k1,t1)
 E  dLag/gprod(gw3,k2,t1)
 L  gas_shed_rt(ng101,s1,t1)
 L  gas_shed_rt(ng101,s2,t1)
 E  SOS1_gas_shed_rt(ng101,s1,t1)
 E  SOS1_gas_shed_rt(ng101,s2,t1)
 E  SOS1_LB_gshed(ng101,s1,t1)
 E  SOS1_LB_gprodUp(gw1,s1,t1)
 E  SOS1_LB_gprodDn(gw1,s1,t1)
 E  SOS1_LB_gprodUp(gw2,s1,t1)
 E  SOS1_LB_gprodDn(gw2,s1,t1)
 E  SOS1_LB_gprodUp(gw3,s1,t1)
 E  SOS1_LB_gprodDn(gw3,s1,t1)
 E  SOS1_LB_gshed(ng101,s2,t1)
 E  SOS1_LB_gprodUp(gw1,s2,t1)
 E  SOS1_LB_gprodDn(gw1,s2,t1)
 E  SOS1_LB_gprodUp(gw2,s2,t1)
 E  SOS1_LB_gprodDn(gw2,s2,t1)
 E  SOS1_LB_gprodUp(gw3,s2,t1)
 E  SOS1_LB_gprodDn(gw3,s2,t1)
 E  dLag/gshed(ng101,s1,t1)
 E  dLag/gprodUp(gw1,s1,t1)
 E  dLag/gprodDn(gw1,s1,t1)
 E  dLag/gprodUp(gw2,s1,t1)
 E  dLag/gprodDn(gw2,s1,t1)
 E  dLag/gprodUp(gw3,s1,t1)
 E  dLag/gprodDn(gw3,s1,t1)
 E  dLag/gshed(ng101,s2,t1)
 E  dLag/gprodUp(gw1,s2,t1)
 E  dLag/gprodDn(gw1,s2,t1)
 E  dLag/gprodUp(gw2,s2,t1)
 E  dLag/gprodDn(gw2,s2,t1)
 E  dLag/gprodUp(gw3,s2,t1)
 E  dLag/gprodDn(gw3,s2,t1)
 E  dLag/Pgen(g1,t1)
 E  dLag/PgenSC(g1,t1)
 E  dLag/RUp(g1,s1,t1)
 E  dLag/RUp(g1,s2,t1)
 E  dLag/RDn(g1,s1,t1)
 E  dLag/RDn(g1,s2,t1)
 E  dLag/RUpSC(g1,s1,t1)
 E  dLag/RUpSC(g1,s2,t1)
 E  dLag/RDnSC(g1,s1,t1)
 E  dLag/RDnSC(g1,s2,t1)
 L  gprodUp_max(gw1,s1,t1)
 E  SOS1_gprodUp_max(gw1,s1,t1)
 L  gprodDn_max(gw1,s1,t1)
 E  SOS1_gprodDn_max(gw1,s1,t1)
 L  gprodUp_max(gw1,s2,t1)
 E  SOS1_gprodUp_max(gw1,s2,t1)
 L  gprodDn_max(gw1,s2,t1)
 E  SOS1_gprodDn_max(gw1,s2,t1)
 L  gprodUp_max(gw2,s1,t1)
 E  SOS1_gprodUp_max(gw2,s1,t1)
 L  gprodDn_max(gw2,s1,t1)
 E  SOS1_gprodDn_max(gw2,s1,t1)
 L  gprodUp_max(gw2,s2,t1)
 E  SOS1_gprodUp_max(gw2,s2,t1)
 L  gprodDn_max(gw2,s2,t1)
 E  SOS1_gprodDn_max(gw2,s2,t1)
 L  gprodUp_max(gw3,s1,t1)
 E  SOS1_gprodUp_max(gw3,s1,t1)
 L  gprodDn_max(gw3,s1,t1)
 E  SOS1_gprodDn_max(gw3,s1,t1)
 L  gprodUp_max(gw3,s2,t1)
 E  SOS1_gprodUp_max(gw3,s2,t1)
 L  gprodDn_max(gw3,s2,t1)
 E  SOS1_gprodDn_max(gw3,s2,t1)
 E  gas_balance_rt(ng101,s1,t1)
 E  gas_balance_rt(ng101,s2,t1)
 L  Pmax_DA_GFPP(g1,t1)
 E  SOS1_Pmax_DA_GFPP(g1,t1)
 L  PgenSCmax(g1,t1)
 E  SOS1_PgenSCmax(g1,t1)
 L  PgenSCmin(g1,t1)
 E  SOS1_PgenSCmin(g1,t1)
 L  RCupSCmax(g1,t1)
 E  SOS1_RCupSCmax(g1,t1)
 L  RCdnSCmin(g1,t1)
 E  SOS1_RCdnSCmin(g1,t1)
 E  gas_balance_da(ng101,k0,t1)
 E  gas_balance_da(ng101,k1,t1)
 E  gas_balance_da(ng101,k2,t1)
 E  Profit_def
 E  Contract_zero
 L  ProfitLimit
COLUMNS
    Pgen(g1,t1)  PowerBalance_DA(t1)  1
    Pgen(g1,t1)  Pmin_DA_GFPP(g1,t1)  -1
    Pgen(g1,t1)  SOS1_Pmin_DA_GFPP(g1,t1)  -1
    Pgen(g1,t1)  SOS1_LB_Pgen(g1,t1)  -1
    Pgen(g1,t1)  Pmax_DA_GFPP(g1,t1)  1
    Pgen(g1,t1)  SOS1_Pmax_DA_GFPP(g1,t1)  1
    Pgen(g1,t1)  gas_balance_da(ng101,k0,t1)  -8
    Pgen(g1,t1)  gas_balance_da(ng101,k1,t1)  -8
    Pgen(g1,t1)  gas_balance_da(ng101,k2,t1)  -8
    Pgen(g2,t1)  PowerBalance_DA(t1)  1
    Pgen(g2,t1)  Pmax_DA_GFPP(g2,t1)  1
    Pgen(g2,t1)  Pmin_DA(g2,t1)  -1
    Pgen(g2,t1)  SOS1_Pmax_DA_GFPP(g2,t1)  1
    Pgen(g2,t1)  SOS1_Pmin_DA(g2,t1)  -1
    Pgen(g2,t1)  SOS1_LB_Pgen(g2,t1)  -1
    Pgen(g2,t1)  Profit_def  100
    PgenSC(g1,t1)  PowerBalance_DA(t1)  1
    PgenSC(g1,t1)  SOS1_LB_PgenSC(g1,t1)  -1
    PgenSC(g1,t1)  PgenSCmax(g1,t1)  1
    PgenSC(g1,t1)  SOS1_PgenSCmax(g1,t1)  1
    PgenSC(g1,t1)  PgenSCmin(g1,t1)  -1
    PgenSC(g1,t1)  SOS1_PgenSCmin(g1,t1)  -1
    PgenSC(g1,t1)  RCupSCmax(g1,t1)  1
    PgenSC(g1,t1)  SOS1_RCupSCmax(g1,t1)  1
    PgenSC(g1,t1)  RCdnSCmin(g1,t1)  -1
    PgenSC(g1,t1)  SOS1_RCdnSCmin(g1,t1)  -1
    PgenSC(g1,t1)  gas_balance_da(ng101,k0,t1)  -8
    RCup(g1,t1)  RegUp_max_RT(g1,s1,t1)  -1
    RCup(g1,t1)  RegUp_max_RT(g1,s2,t1)  -1
    RCup(g1,t1)  SOS1_RegUp_max_RT(g1,s1,t1)  -1
    RCup(g1,t1)  SOS1_RegUp_max_RT(g1,s2,t1)  -1
    RCup(g1,t1)  SOS1_LB_RCup(g1,t1)  -1
    RCup(g1,t1)  Pmax_DA_GFPP(g1,t1)  1
    RCup(g1,t1)  SOS1_Pmax_DA_GFPP(g1,t1)  1
    RCup(g2,t1)  Pmax_DA_GFPP(g2,t1)  1
    RCup(g2,t1)  RegUp_max_RT(g2,s1,t1)  -1
    RCup(g2,t1)  RegUp_max_RT(g2,s2,t1)  -1
    RCup(g2,t1)  SOS1_Pmax_DA_GFPP(g2,t1)  1
    RCup(g2,t1)  SOS1_RegUp_max_RT(g2,s1,t1)  -1
    RCup(g2,t1)  SOS1_RegUp_max_RT(g2,s2,t1)  -1
    RCup(g2,t1)  SOS1_LB_RCup(g2,t1)  -1
    RCdn(g1,t1)  Pmin_DA_GFPP(g1,t1)  1
    RCdn(g1,t1)  RegDown_max_RT(g1,s1,t1)  -1
    RCdn(g1,t1)  RegDown_max_RT(g1,s2,t1)  -1
    RCdn(g1,t1)  SOS1_Pmin_DA_GFPP(g1,t1)  1
    RCdn(g1,t1)  SOS1_RegDown_max_RT(g1,s1,t1)  -1
    RCdn(g1,t1)  SOS1_RegDown_max_RT(g1,s2,t1)  -1
    RCdn(g1,t1)  SOS1_LB_RCdn(g1,t1)  -1
    RCdn(g2,t1)  Pmin_DA(g2,t1)  1
    RCdn(g2,t1)  RegDown_max_RT(g2,s1,t1)  -1
    RCdn(g2,t1)  RegDown_max_RT(g2,s2,t1)  -1
    RCdn(g2,t1)  SOS1_Pmin_DA(g2,t1)  1
    RCdn(g2,t1)  SOS1_RegDown_max_RT(g2,s1,t1)  -1
    RCdn(g2,t1)  SOS1_RegDown_max_RT(g2,s2,t1)  -1
    RCdn(g2,t1)  SOS1_LB_RCdn(g2,t1)  -1
    RCupSC(g1,t1)  RegUpSC_max_RT(g1,s1,t1)  -1
    RCupSC(g1,t1)  RegUpSC_max_RT(g1,s2,t1)  -1
    RCupSC(g1,t1)  SOS1_RegUpSC_max_RT(g1,s1,t1)  -1
    RCupSC(g1,t1)  SOS1_RegUpSC_max_RT(g1,s2,t1)  -1
    RCupSC(g1,t1)  SOS1_LB_RCupSC(g1,t1)  -1
    RCupSC(g1,t1)  RCupSCmax(g1,t1)  1
    RCupSC(g1,t1)  SOS1_RCupSCmax(g1,t1)  1
    RCdnSC(g1,t1)  RegDnSC_max_RT(g1,s1,t1)  -1
    RCdnSC(g1,t1)  RegDnSC_max_RT(g1,s2,t1)  -1
    RCdnSC(g1,t1)  SOS1_RegDnSC_max_RT(g1,s1,t1)  -1
    RCdnSC(g1,t1)  SOS1_RegDnSC_max_RT(g1,s2,t1)  -1
    RCdnSC(g1,t1)  SOS1_LB_RCdnSC(g1,t1)  -1
    RCdnSC(g1,t1)  RCdnSCmin(g1,t1)  1
    RCdnSC(g1,t1)  SOS1_RCdnSCmin(g1,t1)  1
    WindDA(w1,t1)  PowerBalance_DA(t1)  1
    WindDA(w1,t1)  Wind_Max_DA(w1,t1)  1
    WindDA(w1,t1)  PowerBalance_RT(s1,t1)  -1
    WindDA(w1,t1)  PowerBalance_RT(s2,t1)  -1
    WindDA(w1,t1)  SOS1_Wind_Max_DA(w1,t1)  1
    WindDA(w1,t1)  SOS1_LB_WindDA(w1,t1)  -1
    RUp(g1,s1,t1)  PowerBalance_RT(s1,t1)  1
    RUp(g1,s1,t1)  RegUp_max_RT(g1,s1,t1)  1
    RUp(g1,s1,t1)  SOS1_RegUp_max_RT(g1,s1,t1)  1
    RUp(g1,s1,t1)  SOS1_LB_RUp(g1,s1,t1)  -1
    RUp(g1,s1,t1)  gas_balance_rt(ng101,s1,t1)  -8
    RDn(g1,s1,t1)  PowerBalance_RT(s1,t1)  -1
    RDn(g1,s1,t1)  RegDown_max_RT(g1,s1,t1)  1
    RDn(g1,s1,t1)  SOS1_RegDown_max_RT(g1,s1,t1)  1
    RDn(g1,s1,t1)  SOS1_LB_RDn(g1,s1,t1)  -1
    RDn(g1,s1,t1)  gas_balance_rt(ng101,s1,t1)  8
    RUp(g2,s1,t1)  PowerBalance_RT(s1,t1)  1
    RUp(g2,s1,t1)  RegUp_max_RT(g2,s1,t1)  1
    RUp(g2,s1,t1)  SOS1_RegUp_max_RT(g2,s1,t1)  1
    RUp(g2,s1,t1)  SOS1_LB_RUp(g2,s1,t1)  -1
    RUp(g2,s1,t1)  Profit_def  100
    RDn(g2,s1,t1)  PowerBalance_RT(s1,t1)  -1
    RDn(g2,s1,t1)  RegDown_max_RT(g2,s1,t1)  1
    RDn(g2,s1,t1)  SOS1_RegDown_max_RT(g2,s1,t1)  1
    RDn(g2,s1,t1)  SOS1_LB_RDn(g2,s1,t1)  -1
    RDn(g2,s1,t1)  Profit_def  -100
    RUpSC(g1,s1,t1)  PowerBalance_RT(s1,t1)  1
    RUpSC(g1,s1,t1)  RegUpSC_max_RT(g1,s1,t1)  1
    RUpSC(g1,s1,t1)  SOS1_RegUpSC_max_RT(g1,s1,t1)  1
    RUpSC(g1,s1,t1)  SOS1_LB_RUpSC(g1,s1,t1)  -1
    RUpSC(g1,s1,t1)  gas_balance_rt(ng101,s1,t1)  -8
    RDnSC(g1,s1,t1)  PowerBalance_RT(s1,t1)  -1
    RDnSC(g1,s1,t1)  RegDnSC_max_RT(g1,s1,t1)  1
    RDnSC(g1,s1,t1)  SOS1_RegDnSC_max_RT(g1,s1,t1)  1
    RDnSC(g1,s1,t1)  SOS1_LB_RDnSC(g1,s1,t1)  -1
    RDnSC(g1,s1,t1)  gas_balance_rt(ng101,s1,t1)  8
    Wspill(w1,s1,t1)  PowerBalance_RT(s1,t1)  -1
    Wspill(w1,s1,t1)  Max_wind_spill_RT(w1,s1,t1)  1
    Wspill(w1,s1,t1)  SOS1_Max_wind_spill_RT(w1,s1,t1)  1
    Wspill(w1,s1,t1)  SOS1_LB_Wspill(w1,s1,t1)  -1
    Lshed(s1,t1)  PowerBalance_RT(s1,t1)  1
    Lshed(s1,t1)  Max_load_shed_RT(s1,t1)  1
    Lshed(s1,t1)  SOS1_Max_load_shed_RT(s1,t1)  1
    Lshed(s1,t1)  SOS1_LB_Lshed(s1,t1)  -1
    Lshed(s1,t1)  Profit_def  1000
    RUp(g1,s2,t1)  PowerBalance_RT(s2,t1)  1
    RUp(g1,s2,t1)  RegUp_max_RT(g1,s2,t1)  1
    RUp(g1,s2,t1)  SOS1_RegUp_max_RT(g1,s2,t1)  1
    RUp(g1,s2,t1)  SOS1_LB_RUp(g1,s2,t1)  -1
    RUp(g1,s2,t1)  gas_balance_rt(ng101,s2,t1)  -8
    RDn(g1,s2,t1)  PowerBalance_RT(s2,t1)  -1
    RDn(g1,s2,t1)  RegDown_max_RT(g1,s2,t1)  1
    RDn(g1,s2,t1)  SOS1_RegDown_max_RT(g1,s2,t1)  1
    RDn(g1,s2,t1)  SOS1_LB_RDn(g1,s2,t1)  -1
    RDn(g1,s2,t1)  gas_balance_rt(ng101,s2,t1)  8
    RUp(g2,s2,t1)  PowerBalance_RT(s2,t1)  1
    RUp(g2,s2,t1)  RegUp_max_RT(g2,s2,t1)  1
    RUp(g2,s2,t1)  SOS1_RegUp_max_RT(g2,s2,t1)  1
    RUp(g2,s2,t1)  SOS1_LB_RUp(g2,s2,t1)  -1
    RDn(g2,s2,t1)  PowerBalance_RT(s2,t1)  -1
    RDn(g2,s2,t1)  RegDown_max_RT(g2,s2,t1)  1
    RDn(g2,s2,t1)  SOS1_RegDown_max_RT(g2,s2,t1)  1
    RDn(g2,s2,t1)  SOS1_LB_RDn(g2,s2,t1)  -1
    RUpSC(g1,s2,t1)  PowerBalance_RT(s2,t1)  1
    RUpSC(g1,s2,t1)  RegUpSC_max_RT(g1,s2,t1)  1
    RUpSC(g1,s2,t1)  SOS1_RegUpSC_max_RT(g1,s2,t1)  1
    RUpSC(g1,s2,t1)  SOS1_LB_RUpSC(g1,s2,t1)  -1
    RUpSC(g1,s2,t1)  gas_balance_rt(ng101,s2,t1)  -8
    RDnSC(g1,s2,t1)  PowerBalance_RT(s2,t1)  -1
    RDnSC(g1,s2,t1)  RegDnSC_max_RT(g1,s2,t1)  1
    RDnSC(g1,s2,t1)  SOS1_RegDnSC_max_RT(g1,s2,t1)  1
    RDnSC(g1,s2,t1)  SOS1_LB_RDnSC(g1,s2,t1)  -1
    RDnSC(g1,s2,t1)  gas_balance_rt(ng101,s2,t1)  8
    Wspill(w1,s2,t1)  PowerBalance_RT(s2,t1)  -1
    Wspill(w1,s2,t1)  Max_wind_spill_RT(w1,s2,t1)  1
    Wspill(w1,s2,t1)  SOS1_Max_wind_spill_RT(w1,s2,t1)  1
    Wspill(w1,s2,t1)  SOS1_LB_Wspill(w1,s2,t1)  -1
    Lshed(s2,t1)  PowerBalance_RT(s2,t1)  1
    Lshed(s2,t1)  Max_load_shed_RT(s2,t1)  1
    Lshed(s2,t1)  SOS1_Max_load_shed_RT(s2,t1)  1
    Lshed(s2,t1)  SOS1_LB_Lshed(s2,t1)  -1
    lambda_PowerBalance_DA(t1)  dLag/Pgen(g2,t1)  -1
    lambda_PowerBalance_DA(t1)  dLag/WindDA(w1,t1)  -1
    lambda_PowerBalance_DA(t1)  dLag/Pgen(g1,t1)  -1
    lambda_PowerBalance_DA(t1)  dLag/PgenSC(g1,t1)  -1
    lambda_PowerBalance_DA(t1)  Profit_def  -50
    mu_Pmax_DA_GFPP(g1,t1)  dLag/RCup(g1,t1)  1
    mu_Pmax_DA_GFPP(g1,t1)  dLag/Pgen(g1,t1)  1
    mu_Pmax_DA_GFPP(g1,t1)  Profit_def  150
    SOS1_Pmax_DA_GFPP(g1,t1)  SOS1_Pmax_DA_GFPP(g1,t1)  1
    mu_Pmax_DA_GFPP(g2,t1)  dLag/Pgen(g2,t1)  1
    mu_Pmax_DA_GFPP(g2,t1)  dLag/RCup(g2,t1)  1
    mu_Pmax_DA_GFPP(g2,t1)  Profit_def  50
    SOS1_Pmax_DA_GFPP(g2,t1)  SOS1_Pmax_DA_GFPP(g2,t1)  1
    mu_Pmin_DA_GFPP(g1,t1)  dLag/RCdn(g1,t1)  1
    mu_Pmin_DA_GFPP(g1,t1)  dLag/Pgen(g1,t1)  -1
    SOS1_Pmin_DA_GFPP(g1,t1)  SOS1_Pmin_DA_GFPP(g1,t1)  1
    mu_Pmin_DA(g2,t1)  dLag/Pgen(g2,t1)  -1
    mu_Pmin_DA(g2,t1)  dLag/RCdn(g2,t1)  1
    SOS1_Pmin_DA(g2,t1)  SOS1_Pmin_DA(g2,t1)  1
    mu_Wind_Max_DA(w1,t1)  dLag/WindDA(w1,t1)  1
    mu_Wind_Max_DA(w1,t1)  Profit_def  30
    SOS1_Wind_Max_DA(w1,t1)  SOS1_Wind_Max_DA(w1,t1)  1
    mu_PgenSCmax(g1,t1)  dLag/PgenSC(g1,t1)  1
    SOS1_PgenSCmax(g1,t1)  SOS1_PgenSCmax(g1,t1)  1
    mu_PgenSCmin(g1,t1)  dLag/PgenSC(g1,t1)  -1
    SOS1_PgenSCmin(g1,t1)  SOS1_PgenSCmin(g1,t1)  1
    mu_RCupSCmax(g1,t1)  dLag/RCupSC(g1,t1)  1
    mu_RCupSCmax(g1,t1)  dLag/PgenSC(g1,t1)  1
    SOS1_RCupSCmax(g1,t1)  SOS1_RCupSCmax(g1,t1)  1
    mu_RCdnSCmin(g1,t1)  dLag/RCdnSC(g1,t1)  1
    mu_RCdnSCmin(g1,t1)  dLag/PgenSC(g1,t1)  -1
    SOS1_RCdnSCmin(g1,t1)  SOS1_RCdnSCmin(g1,t1)  1
    lambda_PowerBalance_RT(s1,t1)  dLag/WindDA(w1,t1)  1
    lambda_PowerBalance_RT(s1,t1)  dLag/RUp(g2,s1,t1)  -1
    lambda_PowerBalance_RT(s1,t1)  dLag/RDn(g2,s1,t1)  1
    lambda_PowerBalance_RT(s1,t1)  dLag/Wspill(w1,s1,t1)  1
    lambda_PowerBalance_RT(s1,t1)  dLag/Lshed(s1,t1)  -1
    lambda_PowerBalance_RT(s1,t1)  dLag/RUp(g1,s1,t1)  -1
    lambda_PowerBalance_RT(s1,t1)  dLag/RDn(g1,s1,t1)  1
    lambda_PowerBalance_RT(s1,t1)  dLag/RUpSC(g1,s1,t1)  -1
    lambda_PowerBalance_RT(s1,t1)  dLag/RDnSC(g1,s1,t1)  1
    lambda_PowerBalance_RT(s1,t1)  Profit_def  13.5
    lambda_PowerBalance_RT(s2,t1)  dLag/WindDA(w1,t1)  1
    lambda_PowerBalance_RT(s2,t1)  dLag/RUp(g2,s2,t1)  -1
    lambda_PowerBalance_RT(s2,t1)  dLag/RDn(g2,s2,t1)  1
    lambda_PowerBalance_RT(s2,t1)  dLag/Wspill(w1,s2,t1)  1
    lambda_PowerBalance_RT(s2,t1)  dLag/Lshed(s2,t1)  -1
    lambda_PowerBalance_RT(s2,t1)  dLag/RUp(g1,s2,t1)  -1
    lambda_PowerBalance_RT(s2,t1)  dLag/RDn(g1,s2,t1)  1
    lambda_PowerBalance_RT(s2,t1)  dLag/RUpSC(g1,s2,t1)  -1
    lambda_PowerBalance_RT(s2,t1)  dLag/RDnSC(g1,s2,t1)  1
    lambda_PowerBalance_RT(s2,t1)  Profit_def  1.5
    mu_RegUp_max_RT(g1,s1,t1)  dLag/RCup(g1,t1)  -1
    mu_RegUp_max_RT(g1,s1,t1)  dLag/RUp(g1,s1,t1)  1
    SOS1_RegUp_max_RT(g1,s1,t1)  SOS1_RegUp_max_RT(g1,s1,t1)  1
    mu_RegDown_max_RT(g1,s1,t1)  dLag/RCdn(g1,t1)  -1
    mu_RegDown_max_RT(g1,s1,t1)  dLag/RDn(g1,s1,t1)  1
    SOS1_RegDown_max_RT(g1,s1,t1)  SOS1_RegDown_max_RT(g1,s1,t1)  1
    mu_RegUp_max_RT(g2,s1,t1)  dLag/RCup(g2,t1)  -1
    mu_RegUp_max_RT(g2,s1,t1)  dLag/RUp(g2,s1,t1)  1
    SOS1_RegUp_max_RT(g2,s1,t1)  SOS1_RegUp_max_RT(g2,s1,t1)  1
    mu_RegDown_max_RT(g2,s1,t1)  dLag/RCdn(g2,t1)  -1
    mu_RegDown_max_RT(g2,s1,t1)  dLag/RDn(g2,s1,t1)  1
    SOS1_RegDown_max_RT(g2,s1,t1)  SOS1_RegDown_max_RT(g2,s1,t1)  1
    mu_RegUp_max_RT(g1,s2,t1)  dLag/RCup(g1,t1)  -1
    mu_RegUp_max_RT(g1,s2,t1)  dLag/RUp(g1,s2,t1)  1
    SOS1_RegUp_max_RT(g1,s2,t1)  SOS1_RegUp_max_RT(g1,s2,t1)  1
    mu_RegDown_max_RT(g1,s2,t1)  dLag/RCdn(g1,t1)  -1
    mu_RegDown_max_RT(g1,s2,t1)  dLag/RDn(g1,s2,t1)  1
    SOS1_RegDown_max_RT(g1,s2,t1)  SOS1_RegDown_max_RT(g1,s2,t1)  1
    mu_RegUp_max_RT(g2,s2,t1)  dLag/RCup(g2,t1)  -1
    mu_RegUp_max_RT(g2,s2,t1)  dLag/RUp(g2,s2,t1)  1
    SOS1_RegUp_max_RT(g2,s2,t1)  SOS1_RegUp_max_RT(g2,s2,t1)  1
    mu_RegDown_max_RT(g2,s2,t1)  dLag/RCdn(g2,t1)  -1
    mu_RegDown_max_RT(g2,s2,t1)  dLag/RDn(g2,s2,t1)  1
    SOS1_RegDown_max_RT(g2,s2,t1)  SOS1_RegDown_max_RT(g2,s2,t1)  1
    mu_RegUpSC_max_RT(g1,s1,t1)  dLag/RCupSC(g1,t1)  -1
    mu_RegUpSC_max_RT(g1,s1,t1)  dLag/RUpSC(g1,s1,t1)  1
    SOS1_RegUpSC_max_RT(g1,s1,t1)  SOS1_RegUpSC_max_RT(g1,s1,t1)  1
    mu_RegDnSC_max_RT(g1,s1,t1)  dLag/RCdnSC(g1,t1)  -1
    mu_RegDnSC_max_RT(g1,s1,t1)  dLag/RDnSC(g1,s1,t1)  1
    SOS1_RegDnSC_max_RT(g1,s1,t1)  SOS1_RegDnSC_max_RT(g1,s1,t1)  1
    mu_RegUpSC_max_RT(g1,s2,t1)  dLag/RCupSC(g1,t1)  -1
    mu_RegUpSC_max_RT(g1,s2,t1)  dLag/RUpSC(g1,s2,t1)  1
    SOS1_RegUpSC_max_RT(g1,s2,t1)  SOS1_RegUpSC_max_RT(g1,s2,t1)  1
    mu_RegDnSC_max_RT(g1,s2,t1)  dLag/RCdnSC(g1,t1)  -1
    mu_RegDnSC_max_RT(g1,s2,t1)  dLag/RDnSC(g1,s2,t1)  1
    SOS1_RegDnSC_max_RT(g1,s2,t1)  SOS1_RegDnSC_max_RT(g1,s2,t1)  1
    mu_Max_load_shed_RT(s1,t1)  dLag/Lshed(s1,t1)  1
    mu_Max_load_shed_RT(s1,t1)  Profit_def  50
    SOS1_Max_load_shed_RT(s1,t1)  SOS1_Max_load_shed_RT(s1,t1)  1
    mu_Max_load_shed_RT(s2,t1)  dLag/Lshed(s2,t1)  1
    mu_Max_load_shed_RT(s2,t1)  Profit_def  50
    SOS1_Max_load_shed_RT(s2,t1)  SOS1_Max_load_shed_RT(s2,t1)  1
    mu_Max_wind_spill_RT(w1,s1,t1)  dLag/Wspill(w1,s1,t1)  1
    mu_Max_wind_spill_RT(w1,s1,t1)  Profit_def  13.5
    SOS1_Max_wind_spill_RT(w1,s1,t1)  SOS1_Max_wind_spill_RT(w1,s1,t1)  1
    mu_Max_wind_spill_RT(w1,s2,t1)  dLag/Wspill(w1,s2,t1)  1
    mu_Max_wind_spill_RT(w1,s2,t1)  Profit_def  1.5
    SOS1_Max_wind_spill_RT(w1,s2,t1)  SOS1_Max_wind_spill_RT(w1,s2,t1)  1
    muLB_Pgen(g1,t1)  dLag/Pgen(g1,t1)  -1
    SOS1_LB_Pgen(g1,t1)  SOS1_LB_Pgen(g1,t1)  1
    muLB_Pgen(g2,t1)  dLag/Pgen(g2,t1)  -1
    SOS1_LB_Pgen(g2,t1)  SOS1_LB_Pgen(g2,t1)  1
    muLB_PgenSC(g1,t1)  dLag/PgenSC(g1,t1)  -1
    SOS1_LB_PgenSC(g1,t1)  SOS1_LB_PgenSC(g1,t1)  1
    muLB_RCup(g1,t1)  dLag/RCup(g1,t1)  -1
    SOS1_LB_RCup(g1,t1)  SOS1_LB_RCup(g1,t1)  1
    muLB_RCup(g2,t1)  dLag/RCup(g2,t1)  -1
    SOS1_LB_RCup(g2,t1)  SOS1_LB_RCup(g2,t1)  1
    muLB_RCdn(g1,t1)  dLag/RCdn(g1,t1)  -1
    SOS1_LB_RCdn(g1,t1)  SOS1_LB_RCdn(g1,t1)  1
    muLB_RCdn(g2,t1)  dLag/RCdn(g2,t1)  -1
    SOS1_LB_RCdn(g2,t1)  SOS1_LB_RCdn(g2,t1)  1
    muLB_RCupSC(g1,t1)  dLag/RCupSC(g1,t1)  -1
    SOS1_LB_RCupSC(g1,t1)  SOS1_LB_RCupSC(g1,t1)  1
    muLB_RCdnSC(g1,t1)  dLag/RCdnSC(g1,t1)  -1
    SOS1_LB_RCdnSC(g1,t1)  SOS1_LB_RCdnSC(g1,t1)  1
    muLB_WindDA(w1,t1)  dLag/WindDA(w1,t1)  -1
    SOS1_LB_WindDA(w1,t1)  SOS1_LB_WindDA(w1,t1)  1
    muLB_RUp(g1,s1,t1)  dLag/RUp(g1,s1,t1)  -1
    SOS1_LB_RUp(g1,s1,t1)  SOS1_LB_RUp(g1,s1,t1)  1
    muLB_RDn(g1,s1,t1)  dLag/RDn(g1,s1,t1)  -1
    SOS1_LB_RDn(g1,s1,t1)  SOS1_LB_RDn(g1,s1,t1)  1
    muLB_RUp(g2,s1,t1)  dLag/RUp(g2,s1,t1)  -1
    SOS1_LB_RUp(g2,s1,t1)  SOS1_LB_RUp(g2,s1,t1)  1
    muLB_RDn(g2,s1,t1)  dLag/RDn(g2,s1,t1)  -1
    SOS1_LB_RDn(g2,s1,t1)  SOS1_LB_RDn(g2,s1,t1)  1
    muLB_RUpSC(g1,s1,t1)  dLag/RUpSC(g1,s1,t1)  -1
    SOS1_LB_RUpSC(g1,s1,t1)  SOS1_LB_RUpSC(g1,s1,t1)  1
    muLB_RDnSC(g1,s1,t1)  dLag/RDnSC(g1,s1,t1)  -1
    SOS1_LB_RDnSC(g1,s1,t1)  SOS1_LB_RDnSC(g1,s1,t1)  1
    muLB_Wspill(w1,s1,t1)  dLag/Wspill(w1,s1,t1)  -1
    SOS1_LB_Wspill(w1,s1,t1)  SOS1_LB_Wspill(w1,s1,t1)  1
    muLB_Lshed(s1,t1)  dLag/Lshed(s1,t1)  -1
    SOS1_LB_Lshed(s1,t1)  SOS1_LB_Lshed(s1,t1)  1
    muLB_RUp(g1,s2,t1)  dLag/RUp(g1,s2,t1)  -1
    SOS1_LB_RUp(g1,s2,t1)  SOS1_LB_RUp(g1,s2,t1)  1
    muLB_RDn(g1,s2,t1)  dLag/RDn(g1,s2,t1)  -1
    SOS1_LB_RDn(g1,s2,t1)  SOS1_LB_RDn(g1,s2,t1)  1
    muLB_RUp(g2,s2,t1)  dLag/RUp(g2,s2,t1)  -1
    SOS1_LB_RUp(g2,s2,t1)  SOS1_LB_RUp(g2,s2,t1)  1
    muLB_RDn(g2,s2,t1)  dLag/RDn(g2,s2,t1)  -1
    SOS1_LB_RDn(g2,s2,t1)  SOS1_LB_RDn(g2,s2,t1)  1
    muLB_RUpSC(g1,s2,t1)  dLag/RUpSC(g1,s2,t1)  -1
    SOS1_LB_RUpSC(g1,s2,t1)  SOS1_LB_RUpSC(g1,s2,t1)  1
    muLB_RDnSC(g1,s2,t1)  dLag/RDnSC(g1,s2,t1)  -1
    SOS1_LB_RDnSC(g1,s2,t1)  SOS1_LB_RDnSC(g1,s2,t1)  1
    muLB_Wspill(w1,s2,t1)  dLag/Wspill(w1,s2,t1)  -1
    SOS1_LB_Wspill(w1,s2,t1)  SOS1_LB_Wspill(w1,s2,t1)  1
    muLB_Lshed(s2,t1)  dLag/Lshed(s2,t1)  -1
    SOS1_LB_Lshed(s2,t1)  SOS1_LB_Lshed(s2,t1)  1
    gshed_da(ng101,k0,t1)  gshed_da_max(ng101,k0,t1)  1
    gshed_da(ng101,k0,t1)  SOS1_gshed_da_max(ng101,k0,t1)  1
    gshed_da(ng101,k0,t1)  SOS1_LB_gshed_da(ng101,k0,t1)  -1
    gshed_da(ng101,k0,t1)  gas_balance_da(ng101,k0,t1)  1
    gshed_da(ng101,k0,t1)  Profit_def  1000
    gshed_da(ng101,k1,t1)  gshed_da_max(ng101,k1,t1)  1
    gshed_da(ng101,k1,t1)  SOS1_gshed_da_max(ng101,k1,t1)  1
    gshed_da(ng101,k1,t1)  SOS1_LB_gshed_da(ng101,k1,t1)  -1
    gshed_da(ng101,k1,t1)  gas_balance_da(ng101,k1,t1)  1
    gshed_da(ng101,k1,t1)  Profit_def  1000
    gshed_da(ng101,k2,t1)  gshed_da_max(ng101,k2,t1)  1
    gshed_da(ng101,k2,t1)  SOS1_gshed_da_max(ng101,k2,t1)  1
    gshed_da(ng101,k2,t1)  SOS1_LB_gshed_da(ng101,k2,t1)  -1
    gshed_da(ng101,k2,t1)  gas_balance_da(ng101,k2,t1)  1
    gshed_da(ng101,k2,t1)  Profit_def  1000
    gprod(gw1,k0,t1)  gprod_max(gw1,k0,t1)  1
    gprod(gw1,k0,t1)  SOS1_gprod_max(gw1,k0,t1)  1
    gprod(gw1,k0,t1)  SOS1_LB_gprod(gw1,k0,t1)  -1
    gprod(gw1,k0,t1)  gprodUp_max(gw1,s1,t1)  1
    gprod(gw1,k0,t1)  SOS1_gprodUp_max(gw1,s1,t1)  1
    gprod(gw1,k0,t1)  gprodDn_max(gw1,s1,t1)  -1
    gprod(gw1,k0,t1)  SOS1_gprodDn_max(gw1,s1,t1)  -1
    gprod(gw1,k0,t1)  gprodUp_max(gw1,s2,t1)  1
    gprod(gw1,k0,t1)  SOS1_gprodUp_max(gw1,s2,t1)  1
    gprod(gw1,k0,t1)  gprodDn_max(gw1,s2,t1)  -1
    gprod(gw1,k0,t1)  SOS1_gprodDn_max(gw1,s2,t1)  -1
    gprod(gw1,k0,t1)  gas_balance_da(ng101,k0,t1)  1
    gprod(gw1,k0,t1)  Profit_def  2
    gprod(gw1,k1,t1)  gprod_max(gw1,k1,t1)  1
    gprod(gw1,k1,t1)  SOS1_gprod_max(gw1,k1,t1)  1
    gprod(gw1,k1,t1)  SOS1_LB_gprod(gw1,k1,t1)  -1
    gprod(gw1,k1,t1)  gas_balance_da(ng101,k1,t1)  1
    gprod(gw1,k1,t1)  Profit_def  2
    gprod(gw1,k2,t1)  gprod_max(gw1,k2,t1)  1
    gprod(gw1,k2,t1)  SOS1_gprod_max(gw1,k2,t1)  1
    gprod(gw1,k2,t1)  SOS1_LB_gprod(gw1,k2,t1)  -1
    gprod(gw1,k2,t1)  gas_balance_da(ng101,k2,t1)  1
    gprod(gw1,k2,t1)  Profit_def  2
    gprod(gw2,k0,t1)  gprod_max(gw2,k0,t1)  1
    gprod(gw2,k0,t1)  SOS1_gprod_max(gw2,k0,t1)  1
    gprod(gw2,k0,t1)  SOS1_LB_gprod(gw2,k0,t1)  -1
    gprod(gw2,k0,t1)  gprodUp_max(gw2,s1,t1)  1
    gprod(gw2,k0,t1)  SOS1_gprodUp_max(gw2,s1,t1)  1
    gprod(gw2,k0,t1)  gprodDn_max(gw2,s1,t1)  -1
    gprod(gw2,k0,t1)  SOS1_gprodDn_max(gw2,s1,t1)  -1
    gprod(gw2,k0,t1)  gprodUp_max(gw2,s2,t1)  1
    gprod(gw2,k0,t1)  SOS1_gprodUp_max(gw2,s2,t1)  1
    gprod(gw2,k0,t1)  gprodDn_max(gw2,s2,t1)  -1
    gprod(gw2,k0,t1)  SOS1_gprodDn_max(gw2,s2,t1)  -1
    gprod(gw2,k0,t1)  gas_balance_da(ng101,k0,t1)  1
    gprod(gw2,k0,t1)  Profit_def  3
    gprod(gw2,k1,t1)  gprod_max(gw2,k1,t1)  1
    gprod(gw2,k1,t1)  SOS1_gprod_max(gw2,k1,t1)  1
    gprod(gw2,k1,t1)  SOS1_LB_gprod(gw2,k1,t1)  -1
    gprod(gw2,k1,t1)  gas_balance_da(ng101,k1,t1)  1
    gprod(gw2,k1,t1)  Profit_def  3
    gprod(gw2,k2,t1)  gprod_max(gw2,k2,t1)  1
    gprod(gw2,k2,t1)  SOS1_gprod_max(gw2,k2,t1)  1
    gprod(gw2,k2,t1)  SOS1_LB_gprod(gw2,k2,t1)  -1
    gprod(gw2,k2,t1)  gas_balance_da(ng101,k2,t1)  1
    gprod(gw2,k2,t1)  Profit_def  3
    gprod(gw3,k0,t1)  gprod_max(gw3,k0,t1)  1
    gprod(gw3,k0,t1)  SOS1_gprod_max(gw3,k0,t1)  1
    gprod(gw3,k0,t1)  SOS1_LB_gprod(gw3,k0,t1)  -1
    gprod(gw3,k0,t1)  gprodUp_max(gw3,s1,t1)  1
    gprod(gw3,k0,t1)  SOS1_gprodUp_max(gw3,s1,t1)  1
    gprod(gw3,k0,t1)  gprodDn_max(gw3,s1,t1)  -1
    gprod(gw3,k0,t1)  SOS1_gprodDn_max(gw3,s1,t1)  -1
    gprod(gw3,k0,t1)  gprodUp_max(gw3,s2,t1)  1
    gprod(gw3,k0,t1)  SOS1_gprodUp_max(gw3,s2,t1)  1
    gprod(gw3,k0,t1)  gprodDn_max(gw3,s2,t1)  -1
    gprod(gw3,k0,t1)  SOS1_gprodDn_max(gw3,s2,t1)  -1
    gprod(gw3,k0,t1)  gas_balance_da(ng101,k0,t1)  1
    gprod(gw3,k0,t1)  Profit_def  4
    gprod(gw3,k1,t1)  gprod_max(gw3,k1,t1)  1
    gprod(gw3,k1,t1)  SOS1_gprod_max(gw3,k1,t1)  1
    gprod(gw3,k1,t1)  SOS1_LB_gprod(gw3,k1,t1)  -1
    gprod(gw3,k1,t1)  gas_balance_da(ng101,k1,t1)  1
    gprod(gw3,k1,t1)  Profit_def  4
    gprod(gw3,k2,t1)  gprod_max(gw3,k2,t1)  1
    gprod(gw3,k2,t1)  SOS1_gprod_max(gw3,k2,t1)  1
    gprod(gw3,k2,t1)  SOS1_LB_gprod(gw3,k2,t1)  -1
    gprod(gw3,k2,t1)  gas_balance_da(ng101,k2,t1)  1
    gprod(gw3,k2,t1)  Profit_def  4
    mu_gshed_da_max(ng101,k0,t1)  dLag/gshed_da(ng101,k0,t1)  1
    SOS1_gshed_da_max(ng101,k0,t1)  SOS1_gshed_da_max(ng101,k0,t1)  1
    mu_gshed_da_max(ng101,k1,t1)  dLag/gshed_da(ng101,k1,t1)  1
    SOS1_gshed_da_max(ng101,k1,t1)  SOS1_gshed_da_max(ng101,k1,t1)  1
    mu_gshed_da_max(ng101,k2,t1)  dLag/gshed_da(ng101,k2,t1)  1
    SOS1_gshed_da_max(ng101,k2,t1)  SOS1_gshed_da_max(ng101,k2,t1)  1
    lambda_gas_balance_da(ng101,k0,t1)  dLag/gshed_da(ng101,k0,t1)  -1
    lambda_gas_balance_da(ng101,k0,t1)  dLag/gprod(gw1,k0,t1)  -1
    lambda_gas_balance_da(ng101,k0,t1)  dLag/gprod(gw2,k0,t1)  -1
    lambda_gas_balance_da(ng101,k0,t1)  dLag/gprod(gw3,k0,t1)  -1
    lambda_gas_balance_da(ng101,k0,t1)  dLag/Pgen(g1,t1)  8
    lambda_gas_balance_da(ng101,k1,t1)  dLag/gshed_da(ng101,k1,t1)  -1
    lambda_gas_balance_da(ng101,k1,t1)  dLag/gprod(gw1,k1,t1)  -1
    lambda_gas_balance_da(ng101,k1,t1)  dLag/gprod(gw2,k1,t1)  -1
    lambda_gas_balance_da(ng101,k1,t1)  dLag/gprod(gw3,k1,t1)  -1
    lambda_gas_balance_da(ng101,k2,t1)  dLag/gshed_da(ng101,k2,t1)  -1
    lambda_gas_balance_da(ng101,k2,t1)  dLag/gprod(gw1,k2,t1)  -1
    lambda_gas_balance_da(ng101,k2,t1)  dLag/gprod(gw2,k2,t1)  -1
    lambda_gas_balance_da(ng101,k2,t1)  dLag/gprod(gw3,k2,t1)  -1
    mu_gprod_max(gw1,k0,t1)  dLag/gprod(gw1,k0,t1)  1
    SOS1_gprod_max(gw1,k0,t1)  SOS1_gprod_max(gw1,k0,t1)  1
    mu_gprod_max(gw1,k1,t1)  dLag/gprod(gw1,k1,t1)  1
    SOS1_gprod_max(gw1,k1,t1)  SOS1_gprod_max(gw1,k1,t1)  1
    mu_gprod_max(gw1,k2,t1)  dLag/gprod(gw1,k2,t1)  1
    SOS1_gprod_max(gw1,k2,t1)  SOS1_gprod_max(gw1,k2,t1)  1
    mu_gprod_max(gw2,k0,t1)  dLag/gprod(gw2,k0,t1)  1
    SOS1_gprod_max(gw2,k0,t1)  SOS1_gprod_max(gw2,k0,t1)  1
    mu_gprod_max(gw2,k1,t1)  dLag/gprod(gw2,k1,t1)  1
    SOS1_gprod_max(gw2,k1,t1)  SOS1_gprod_max(gw2,k1,t1)  1
    mu_gprod_max(gw2,k2,t1)  dLag/gprod(gw2,k2,t1)  1
    SOS1_gprod_max(gw2,k2,t1)  SOS1_gprod_max(gw2,k2,t1)  1
    mu_gprod_max(gw3,k0,t1)  dLag/gprod(gw3,k0,t1)  1
    SOS1_gprod_max(gw3,k0,t1)  SOS1_gprod_max(gw3,k0,t1)  1
    mu_gprod_max(gw3,k1,t1)  dLag/gprod(gw3,k1,t1)  1
    SOS1_gprod_max(gw3,k1,t1)  SOS1_gprod_max(gw3,k1,t1)  1
    mu_gprod_max(gw3,k2,t1)  dLag/gprod(gw3,k2,t1)  1
    SOS1_gprod_max(gw3,k2,t1)  SOS1_gprod_max(gw3,k2,t1)  1
    muLB_gshed_da(ng101,k0,t1)  dLag/gshed_da(ng101,k0,t1)  -1
    SOS1_LB_gshed_da(ng101,k0,t1)  SOS1_LB_gshed_da(ng101,k0,t1)  1
    muLB_gshed_da(ng101,k1,t1)  dLag/gshed_da(ng101,k1,t1)  -1
    SOS1_LB_gshed_da(ng101,k1,t1)  SOS1_LB_gshed_da(ng101,k1,t1)  1
    muLB_gshed_da(ng101,k2,t1)  dLag/gshed_da(ng101,k2,t1)  -1
    SOS1_LB_gshed_da(ng101,k2,t1)  SOS1_LB_gshed_da(ng101,k2,t1)  1
    muLB_gprod(gw1,k0,t1)  dLag/gprod(gw1,k0,t1)  -1
    SOS1_LB_gprod(gw1,k0,t1)  SOS1_LB_gprod(gw1,k0,t1)  1
    muLB_gprod(gw1,k1,t1)  dLag/gprod(gw1,k1,t1)  -1
    SOS1_LB_gprod(gw1,k1,t1)  SOS1_LB_gprod(gw1,k1,t1)  1
    muLB_gprod(gw1,k2,t1)  dLag/gprod(gw1,k2,t1)  -1
    SOS1_LB_gprod(gw1,k2,t1)  SOS1_LB_gprod(gw1,k2,t1)  1
    muLB_gprod(gw2,k0,t1)  dLag/gprod(gw2,k0,t1)  -1
    SOS1_LB_gprod(gw2,k0,t1)  SOS1_LB_gprod(gw2,k0,t1)  1
    muLB_gprod(gw2,k1,t1)  dLag/gprod(gw2,k1,t1)  -1
    SOS1_LB_gprod(gw2,k1,t1)  SOS1_LB_gprod(gw2,k1,t1)  1
    muLB_gprod(gw2,k2,t1)  dLag/gprod(gw2,k2,t1)  -1
    SOS1_LB_gprod(gw2,k2,t1)  SOS1_LB_gprod(gw2,k2,t1)  1
    muLB_gprod(gw3,k0,t1)  dLag/gprod(gw3,k0,t1)  -1
    SOS1_LB_gprod(gw3,k0,t1)  SOS1_LB_gprod(gw3,k0,t1)  1
    muLB_gprod(gw3,k1,t1)  dLag/gprod(gw3,k1,t1)  -1
    SOS1_LB_gprod(gw3,k1,t1)  SOS1_LB_gprod(gw3,k1,t1)  1
    muLB_gprod(gw3,k2,t1)  dLag/gprod(gw3,k2,t1)  -1
    SOS1_LB_gprod(gw3,k2,t1)  SOS1_LB_gprod(gw3,k2,t1)  1
    gshed(ng101,s1,t1)  gas_shed_rt(ng101,s1,t1)  1
    gshed(ng101,s1,t1)  SOS1_gas_shed_rt(ng101,s1,t1)  1
    gshed(ng101,s1,t1)  SOS1_LB_gshed(ng101,s1,t1)  -1
    gshed(ng101,s1,t1)  gas_balance_rt(ng101,s1,t1)  1
    gshed(ng101,s1,t1)  Profit_def  1000
    gprodUp(gw1,s1,t1)  SOS1_LB_gprodUp(gw1,s1,t1)  -1
    gprodUp(gw1,s1,t1)  gprodUp_max(gw1,s1,t1)  1
    gprodUp(gw1,s1,t1)  SOS1_gprodUp_max(gw1,s1,t1)  1
    gprodUp(gw1,s1,t1)  gas_balance_rt(ng101,s1,t1)  1
    gprodUp(gw1,s1,t1)  Profit_def  2.06
    gprodDn(gw1,s1,t1)  SOS1_LB_gprodDn(gw1,s1,t1)  -1
    gprodDn(gw1,s1,t1)  gprodDn_max(gw1,s1,t1)  1
    gprodDn(gw1,s1,t1)  SOS1_gprodDn_max(gw1,s1,t1)  1
    gprodDn(gw1,s1,t1)  gas_balance_rt(ng101,s1,t1)  -1
    gprodDn(gw1,s1,t1)  Profit_def  -1.96
    gprodUp(gw2,s1,t1)  SOS1_LB_gprodUp(gw2,s1,t1)  -1
    gprodUp(gw2,s1,t1)  gprodUp_max(gw2,s1,t1)  1
    gprodUp(gw2,s1,t1)  SOS1_gprodUp_max(gw2,s1,t1)  1
    gprodUp(gw2,s1,t1)  gas_balance_rt(ng101,s1,t1)  1
    gprodUp(gw2,s1,t1)  Profit_def  3.09
    gprodDn(gw2,s1,t1)  SOS1_LB_gprodDn(gw2,s1,t1)  -1
    gprodDn(gw2,s1,t1)  gprodDn_max(gw2,s1,t1)  1
    gprodDn(gw2,s1,t1)  SOS1_gprodDn_max(gw2,s1,t1)  1
    gprodDn(gw2,s1,t1)  gas_balance_rt(ng101,s1,t1)  -1
    gprodDn(gw2,s1,t1)  Profit_def  -2.94
    gprodUp(gw3,s1,t1)  SOS1_LB_gprodUp(gw3,s1,t1)  -1
    gprodUp(gw3,s1,t1)  gprodUp_max(gw3,s1,t1)  1
    gprodUp(gw3,s1,t1)  SOS1_gprodUp_max(gw3,s1,t1)  1
    gprodUp(gw3,s1,t1)  gas_balance_rt(ng101,s1,t1)  1
    gprodUp(gw3,s1,t1)  Profit_def  4.12
    gprodDn(gw3,s1,t1)  SOS1_LB_gprodDn(gw3,s1,t1)  -1
    gprodDn(gw3,s1,t1)  gprodDn_max(gw3,s1,t1)  1
    gprodDn(gw3,s1,t1)  SOS1_gprodDn_max(gw3,s1,t1)  1
    gprodDn(gw3,s1,t1)  gas_balance_rt(ng101,s1,t1)  -1
    gprodDn(gw3,s1,t1)  Profit_def  -3.92
    gshed(ng101,s2,t1)  gas_shed_rt(ng101,s2,t1)  1
    gshed(ng101,s2,t1)  SOS1_gas_shed_rt(ng101,s2,t1)  1
    gshed(ng101,s2,t1)  SOS1_LB_gshed(ng101,s2,t1)  -1
    gshed(ng101,s2,t1)  gas_balance_rt(ng101,s2,t1)  1
    gprodUp(gw1,s2,t1)  SOS1_LB_gprodUp(gw1,s2,t1)  -1
    gprodUp(gw1,s2,t1)  gprodUp_max(gw1,s2,t1)  1
    gprodUp(gw1,s2,t1)  SOS1_gprodUp_max(gw1,s2,t1)  1
    gprodUp(gw1,s2,t1)  gas_balance_rt(ng101,s2,t1)  1
    gprodDn(gw1,s2,t1)  SOS1_LB_gprodDn(gw1,s2,t1)  -1
    gprodDn(gw1,s2,t1)  gprodDn_max(gw1,s2,t1)  1
    gprodDn(gw1,s2,t1)  SOS1_gprodDn_max(gw1,s2,t1)  1
    gprodDn(gw1,s2,t1)  gas_balance_rt(ng101,s2,t1)  -1
    gprodUp(gw2,s2,t1)  SOS1_LB_gprodUp(gw2,s2,t1)  -1
    gprodUp(gw2,s2,t1)  gprodUp_max(gw2,s2,t1)  1
    gprodUp(gw2,s2,t1)  SOS1_gprodUp_max(gw2,s2,t1)  1
    gprodUp(gw2,s2,t1)  gas_balance_rt(ng101,s2,t1)  1
    gprodDn(gw2,s2,t1)  SOS1_LB_gprodDn(gw2,s2,t1)  -1
    gprodDn(gw2,s2,t1)  gprodDn_max(gw2,s2,t1)  1
    gprodDn(gw2,s2,t1)  SOS1_gprodDn_max(gw2,s2,t1)  1
    gprodDn(gw2,s2,t1)  gas_balance_rt(ng101,s2,t1)  -1
    gprodUp(gw3,s2,t1)  SOS1_LB_gprodUp(gw3,s2,t1)  -1
    gprodUp(gw3,s2,t1)  gprodUp_max(gw3,s2,t1)  1
    gprodUp(gw3,s2,t1)  SOS1_gprodUp_max(gw3,s2,t1)  1
    gprodUp(gw3,s2,t1)  gas_balance_rt(ng101,s2,t1)  1
    gprodDn(gw3,s2,t1)  SOS1_LB_gprodDn(gw3,s2,t1)  -1
    gprodDn(gw3,s2,t1)  gprodDn_max(gw3,s2,t1)  1
    gprodDn(gw3,s2,t1)  SOS1_gprodDn_max(gw3,s2,t1)  1
    gprodDn(gw3,s2,t1)  gas_balance_rt(ng101,s2,t1)  -1
    lambda_gas_balance_rt(ng101,s1,t1)  dLag/gshed(ng101,s1,t1)  -1
    lambda_gas_balance_rt(ng101,s1,t1)  dLag/gprodUp(gw1,s1,t1)  -1
    lambda_gas_balance_rt(ng101,s1,t1)  dLag/gprodDn(gw1,s1,t1)  1
    lambda_gas_balance_rt(ng101,s1,t1)  dLag/gprodUp(gw2,s1,t1)  -1
    lambda_gas_balance_rt(ng101,s1,t1)  dLag/gprodDn(gw2,s1,t1)  1
    lambda_gas_balance_rt(ng101,s1,t1)  dLag/gprodUp(gw3,s1,t1)  -1
    lambda_gas_balance_rt(ng101,s1,t1)  dLag/gprodDn(gw3,s1,t1)  1
    lambda_gas_balance_rt(ng101,s1,t1)  dLag/RUp(g1,s1,t1)  8
    lambda_gas_balance_rt(ng101,s1,t1)  dLag/RDn(g1,s1,t1)  -8
    lambda_gas_balance_rt(ng101,s2,t1)  dLag/gshed(ng101,s2,t1)  -1
    lambda_gas_balance_rt(ng101,s2,t1)  dLag/gprodUp(gw1,s2,t1)  -1
    lambda_gas_balance_rt(ng101,s2,t1)  dLag/gprodDn(gw1,s2,t1)  1
    lambda_gas_balance_rt(ng101,s2,t1)  dLag/gprodUp(gw2,s2,t1)  -1
    lambda_gas_balance_rt(ng101,s2,t1)  dLag/gprodDn(gw2,s2,t1)  1
    lambda_gas_balance_rt(ng101,s2,t1)  dLag/gprodUp(gw3,s2,t1)  -1
    lambda_gas_balance_rt(ng101,s2,t1)  dLag/gprodDn(gw3,s2,t1)  1
    lambda_gas_balance_rt(ng101,s2,t1)  dLag/RUp(g1,s2,t1)  8
    lambda_gas_balance_rt(ng101,s2,t1)  dLag/RDn(g1,s2,t1)  -8
    mu_gprodUp_max(gw1,s1,t1)  dLag/gprodUp(gw1,s1,t1)  1
    SOS1_gprodUp_max(gw1,s1,t1)  SOS1_gprodUp_max(gw1,s1,t1)  1
    mu_gprodDn_max(gw1,s1,t1)  dLag/gprodDn(gw1,s1,t1)  1
    SOS1_gprodDn_max(gw1,s1,t1)  SOS1_gprodDn_max(gw1,s1,t1)  1
    mu_gprodUp_max(gw1,s2,t1)  dLag/gprodUp(gw1,s2,t1)  1
    SOS1_gprodUp_max(gw1,s2,t1)  SOS1_gprodUp_max(gw1,s2,t1)  1
    mu_gprodDn_max(gw1,s2,t1)  dLag/gprodDn(gw1,s2,t1)  1
    SOS1_gprodDn_max(gw1,s2,t1)  SOS1_gprodDn_max(gw1,s2,t1)  1
    mu_gprodUp_max(gw2,s1,t1)  dLag/gprodUp(gw2,s1,t1)  1
    SOS1_gprodUp_max(gw2,s1,t1)  SOS1_gprodUp_max(gw2,s1,t1)  1
    mu_gprodDn_max(gw2,s1,t1)  dLag/gprodDn(gw2,s1,t1)  1
    SOS1_gprodDn_max(gw2,s1,t1)  SOS1_gprodDn_max(gw2,s1,t1)  1
    mu_gprodUp_max(gw2,s2,t1)  dLag/gprodUp(gw2,s2,t1)  1
    SOS1_gprodUp_max(gw2,s2,t1)  SOS1_gprodUp_max(gw2,s2,t1)  1
    mu_gprodDn_max(gw2,s2,t1)  dLag/gprodDn(gw2,s2,t1)  1
    SOS1_gprodDn_max(gw2,s2,t1)  SOS1_gprodDn_max(gw2,s2,t1)  1
    mu_gprodUp_max(gw3,s1,t1)  dLag/gprodUp(gw3,s1,t1)  1
    SOS1_gprodUp_max(gw3,s1,t1)  SOS1_gprodUp_max(gw3,s1,t1)  1
    mu_gprodDn_max(gw3,s1,t1)  dLag/gprodDn(gw3,s1,t1)  1
    SOS1_gprodDn_max(gw3,s1,t1)  SOS1_gprodDn_max(gw3,s1,t1)  1
    mu_gprodUp_max(gw3,s2,t1)  dLag/gprodUp(gw3,s2,t1)  1
    SOS1_gprodUp_max(gw3,s2,t1)  SOS1_gprodUp_max(gw3,s2,t1)  1
    mu_gprodDn_max(gw3,s2,t1)  dLag/gprodDn(gw3,s2,t1)  1
    SOS1_gprodDn_max(gw3,s2,t1)  SOS1_gprodDn_max(gw3,s2,t1)  1
    mu_gas_shed_rt(ng101,s1,t1)  dLag/gshed(ng101,s1,t1)  1
    SOS1_gas_shed_rt(ng101,s1,t1)  SOS1_gas_shed_rt(ng101,s1,t1)  1
    mu_gas_shed_rt(ng101,s2,t1)  dLag/gshed(ng101,s2,t1)  1
    SOS1_gas_shed_rt(ng101,s2,t1)  SOS1_gas_shed_rt(ng101,s2,t1)  1
    muLB_gshed(ng101,s1,t1)  dLag/gshed(ng101,s1,t1)  -1
    SOS1_LB_gshed(ng101,s1,t1)  SOS1_LB_gshed(ng101,s1,t1)  1
    muLB_gprodUp(gw1,s1,t1)  dLag/gprodUp(gw1,s1,t1)  -1
    SOS1_LB_gprodUp(gw1,s1,t1)  SOS1_LB_gprodUp(gw1,s1,t1)  1
    muLB_gprodDn(gw1,s1,t1)  dLag/gprodDn(gw1,s1,t1)  -1
    SOS1_LB_gprodDn(gw1,s1,t1)  SOS1_LB_gprodDn(gw1,s1,t1)  1
    muLB_gprodUp(gw2,s1,t1)  dLag/gprodUp(gw2,s1,t1)  -1
    SOS1_LB_gprodUp(gw2,s1,t1)  SOS1_LB_gprodUp(gw2,s1,t1)  1
    muLB_gprodDn(gw2,s1,t1)  dLag/gprodDn(gw2,s1,t1)  -1
    SOS1_LB_gprodDn(gw2,s1,t1)  SOS1_LB_gprodDn(gw2,s1,t1)  1
    muLB_gprodUp(gw3,s1,t1)  dLag/gprodUp(gw3,s1,t1)  -1
    SOS1_LB_gprodUp(gw3,s1,t1)  SOS1_LB_gprodUp(gw3,s1,t1)  1
    muLB_gprodDn(gw3,s1,t1)  dLag/gprodDn(gw3,s1,t1)  -1
    SOS1_LB_gprodDn(gw3,s1,t1)  SOS1_LB_gprodDn(gw3,s1,t1)  1
    muLB_gshed(ng101,s2,t1)  dLag/gshed(ng101,s2,t1)  -1
    SOS1_LB_gshed(ng101,s2,t1)  SOS1_LB_gshed(ng101,s2,t1)  1
    muLB_gprodUp(gw1,s2,t1)  dLag/gprodUp(gw1,s2,t1)  -1
    SOS1_LB_gprodUp(gw1,s2,t1)  SOS1_LB_gprodUp(gw1,s2,t1)  1
    muLB_gprodDn(gw1,s2,t1)  dLag/gprodDn(gw1,s2,t1)  -1
    SOS1_LB_gprodDn(gw1,s2,t1)  SOS1_LB_gprodDn(gw1,s2,t1)  1
    muLB_gprodUp(gw2,s2,t1)  dLag/gprodUp(gw2,s2,t1)  -1
    SOS1_LB_gprodUp(gw2,s2,t1)  SOS1_LB_gprodUp(gw2,s2,t1)  1
    muLB_gprodDn(gw2,s2,t1)  dLag/gprodDn(gw2,s2,t1)  -1
    SOS1_LB_gprodDn(gw2,s2,t1)  SOS1_LB_gprodDn(gw2,s2,t1)  1
    muLB_gprodUp(gw3,s2,t1)  dLag/gprodUp(gw3,s2,t1)  -1
    SOS1_LB_gprodUp(gw3,s2,t1)  SOS1_LB_gprodUp(gw3,s2,t1)  1
    muLB_gprodDn(gw3,s2,t1)  dLag/gprodDn(gw3,s2,t1)  -1
    SOS1_LB_gprodDn(gw3,s2,t1)  SOS1_LB_gprodDn(gw3,s2,t1)  1
    ContractPrice(ng101)  dLag/PgenSC(g1,t1)  8
    ContractPrice(ng101)  dLag/RUpSC(g1,s1,t1)  8
    ContractPrice(ng101)  dLag/RDnSC(g1,s1,t1)  -8
    ContractPrice(ng101)  Contract_zero  1
    Profit    OBJ       -1
    Profit    Profit_def  1
    Profit    ProfitLimit  1
RHS
    RHS1      PowerBalance_DA(t1)  50
    RHS1      Pmax_DA_GFPP(g2,t1)  50
    RHS1      Wind_Max_DA(w1,t1)  30
    RHS1      PowerBalance_RT(s1,t1)  -13.5
    RHS1      PowerBalance_RT(s2,t1)  -1.5
    RHS1      Max_load_shed_RT(s1,t1)  50
    RHS1      Max_load_shed_RT(s2,t1)  50
    RHS1      Max_wind_spill_RT(w1,s1,t1)  13.5
    RHS1      Max_wind_spill_RT(w1,s2,t1)  1.5
    RHS1      SOS1_Pmax_DA_GFPP(g2,t1)  50
    RHS1      SOS1_Wind_Max_DA(w1,t1)  30
    RHS1      SOS1_Max_load_shed_RT(s1,t1)  50
    RHS1      SOS1_Max_load_shed_RT(s2,t1)  50
    RHS1      SOS1_Max_wind_spill_RT(w1,s1,t1)  13.5
    RHS1      SOS1_Max_wind_spill_RT(w1,s2,t1)  1.5
    RHS1      dLag/Pgen(g2,t1)  -100
    RHS1      dLag/RUp(g2,s1,t1)  -100
    RHS1      dLag/RDn(g2,s1,t1)  100
    RHS1      dLag/Lshed(s1,t1)  -1000
    RHS1      gprod_max(gw1,k0,t1)  240
    RHS1      gprod_max(gw1,k1,t1)  240
    RHS1      gprod_max(gw1,k2,t1)  240
    RHS1      gprod_max(gw2,k0,t1)  120
    RHS1      gprod_max(gw2,k1,t1)  120
    RHS1      gprod_max(gw2,k2,t1)  120
    RHS1      gprod_max(gw3,k0,t1)  3000
    RHS1      gprod_max(gw3,k1,t1)  3000
    RHS1      gprod_max(gw3,k2,t1)  3000
    RHS1      SOS1_gprod_max(gw1,k0,t1)  240
    RHS1      SOS1_gprod_max(gw1,k1,t1)  240
    RHS1      SOS1_gprod_max(gw1,k2,t1)  240
    RHS1      SOS1_gprod_max(gw2,k0,t1)  120
    RHS1      SOS1_gprod_max(gw2,k1,t1)  120
    RHS1      SOS1_gprod_max(gw2,k2,t1)  120
    RHS1      SOS1_gprod_max(gw3,k0,t1)  3000
    RHS1      SOS1_gprod_max(gw3,k1,t1)  3000
    RHS1      SOS1_gprod_max(gw3,k2,t1)  3000
    RHS1      dLag/gshed_da(ng101,k0,t1)  -1000
    RHS1      dLag/gshed_da(ng101,k1,t1)  -1000
    RHS1      dLag/gshed_da(ng101,k2,t1)  -1000
    RHS1      dLag/gprod(gw1,k0,t1)  -2
    RHS1      dLag/gprod(gw1,k1,t1)  -2
    RHS1      dLag/gprod(gw1,k2,t1)  -2
    RHS1      dLag/gprod(gw2,k0,t1)  -3
    RHS1      dLag/gprod(gw2,k1,t1)  -3
    RHS1      dLag/gprod(gw2,k2,t1)  -3
    RHS1      dLag/gprod(gw3,k0,t1)  -4
    RHS1      dLag/gprod(gw3,k1,t1)  -4
    RHS1      dLag/gprod(gw3,k2,t1)  -4
    RHS1      dLag/gshed(ng101,s1,t1)  -1000
    RHS1      dLag/gprodUp(gw1,s1,t1)  -2.06
    RHS1      dLag/gprodDn(gw1,s1,t1)  1.96
    RHS1      dLag/gprodUp(gw2,s1,t1)  -3.09
    RHS1      dLag/gprodDn(gw2,s1,t1)  2.94
    RHS1      dLag/gprodUp(gw3,s1,t1)  -4.12
    RHS1      dLag/gprodDn(gw3,s1,t1)  3.92
    RHS1      gprodUp_max(gw1,s1,t1)  240
    RHS1      SOS1_gprodUp_max(gw1,s1,t1)  240
    RHS1      gprodUp_max(gw1,s2,t1)  240
    RHS1      SOS1_gprodUp_max(gw1,s2,t1)  240
    RHS1      gprodUp_max(gw2,s1,t1)  120
    RHS1      SOS1_gprodUp_max(gw2,s1,t1)  120
    RHS1      gprodUp_max(gw2,s2,t1)  120
    RHS1      SOS1_gprodUp_max(gw2,s2,t1)  120
    RHS1      gprodUp_max(gw3,s1,t1)  3000
    RHS1      SOS1_gprodUp_max(gw3,s1,t1)  3000
    RHS1      gprodUp_max(gw3,s2,t1)  3000
    RHS1      SOS1_gprodUp_max(gw3,s2,t1)  3000
    RHS1      Pmax_DA_GFPP(g1,t1)  150
    RHS1      SOS1_Pmax_DA_GFPP(g1,t1)  150
    RHS1      ProfitLimit  12000
BOUNDS
 FR BND1      lambda_PowerBalance_DA(t1)
 FR BND1      lambda_PowerBalance_RT(s1,t1)
 FR BND1      lambda_PowerBalance_RT(s2,t1)
 FR BND1      lambda_gas_balance_da(ng101,k0,t1)
 FR BND1      lambda_gas_balance_da(ng101,k1,t1)
 FR BND1      lambda_gas_balance_da(ng101,k2,t1)
 FR BND1      lambda_gas_balance_rt(ng101,s1,t1)
 FR BND1      lambda_gas_balance_rt(ng101,s2,t1)
SOS
 S1 s0
    mu_Pmax_DA_GFPP(g1,t1)     1
    SOS1_Pmax_DA_GFPP(g1,t1)     2
 S1 s1
    mu_Pmax_DA_GFPP(g2,t1)     1
    SOS1_Pmax_DA_GFPP(g2,t1)     2
 S1 s2
    mu_Pmin_DA_GFPP(g1,t1)     1
    SOS1_Pmin_DA_GFPP(g1,t1)     2
 S1 s3
    mu_Pmin_DA(g2,t1)     1
    SOS1_Pmin_DA(g2,t1)     2
 S1 s4
    mu_Wind_Max_DA(w1,t1)     1
    SOS1_Wind_Max_DA(w1,t1)     2
 S1 s5
    mu_PgenSCmax(g1,t1)     1
    SOS1_PgenSCmax(g1,t1)     2
 S1 s6
    mu_PgenSCmin(g1,t1)     1
    SOS1_PgenSCmin(g1,t1)     2
 S1 s7
    mu_RCupSCmax(g1,t1)     1
    SOS1_RCupSCmax(g1,t1)     2
 S1 s8
    mu_RCdnSCmin(g1,t1)     1
    SOS1_RCdnSCmin(g1,t1)     2
 S1 s9
    mu_RegUp_max_RT(g1,s1,t1)     1
    SOS1_RegUp_max_RT(g1,s1,t1)     2
 S1 s10
    mu_RegDown_max_RT(g1,s1,t1)     1
    SOS1_RegDown_max_RT(g1,s1,t1)     2
 S1 s11
    mu_RegUp_max_RT(g2,s1,t1)     1
    SOS1_RegUp_max_RT(g2,s1,t1)     2
 S1 s12
    mu_RegDown_max_RT(g2,s1,t1)     1
    SOS1_RegDown_max_RT(g2,s1,t1)     2
 S1 s13
    mu_RegUp_max_RT(g1,s2,t1)     1
    SOS1_RegUp_max_RT(g1,s2,t1)     2
 S1 s14
    mu_RegDown_max_RT(g1,s2,t1)     1
    SOS1_RegDown_max_RT(g1,s2,t1)     2
 S1 s15
    mu_RegUp_max_RT(g2,s2,t1)     1
    SOS1_RegUp_max_RT(g2,s2,t1)     2
 S1 s16
    mu_RegDown_max_RT(g2,s2,t1)     1
    SOS1_RegDown_max_RT(g2,s2,t1)     2
 S1 s17
    mu_RegUpSC_max_RT(g1,s1,t1)     1
    SOS1_RegUpSC_max_RT(g1,s1,t1)     2
 S1 s18
    mu_RegDnSC_max_RT(g1,s1,t1)     1
    SOS1_RegDnSC_max_RT(g1,s1,t1)     2
 S1 s19
    mu_RegUpSC_max_RT(g1,s2,t1)     1
    SOS1_RegUpSC_max_RT(g1,s2,t1)     2
 S1 s20
    mu_RegDnSC_max_RT(g1,s2,t1)     1
    SOS1_RegDnSC_max_RT(g1,s2,t1)     2
 S1 s21
    mu_Max_load_shed_RT(s1,t1)     1
    SOS1_Max_load_shed_RT(s1,t1)     2
 S1 s22
    mu_Max_load_shed_RT(s2,t1)     1
    SOS1_Max_load_shed_RT(s2,t1)     2
 S1 s23
    mu_Max_wind_spill_RT(w1,s1,t1)     1
    SOS1_Max_wind_spill_RT(w1,s1,t1)     2
 S1 s24
    mu_Max_wind_spill_RT(w1,s2,t1)     1
    SOS1_Max_wind_spill_RT(w1,s2,t1)     2
 S1 s25
    muLB_Pgen(g1,t1)     1
    SOS1_LB_Pgen(g1,t1)     2
 S1 s26
    muLB_Pgen(g2,t1)     1
    SOS1_LB_Pgen(g2,t1)     2
 S1 s27
    muLB_PgenSC(g1,t1)     1
    SOS1_LB_PgenSC(g1,t1)     2
 S1 s28
    muLB_RCup(g1,t1)     1
    SOS1_LB_RCup(g1,t1)     2
 S1 s29
    muLB_RCup(g2,t1)     1
    SOS1_LB_RCup(g2,t1)     2
 S1 s30
    muLB_RCdn(g1,t1)     1
    SOS1_LB_RCdn(g1,t1)     2
 S1 s31
    muLB_RCdn(g2,t1)     1
    SOS1_LB_RCdn(g2,t1)     2
 S1 s32
    muLB_RCupSC(g1,t1)     1
    SOS1_LB_RCupSC(g1,t1)     2
 S1 s33
    muLB_RCdnSC(g1,t1)     1
    SOS1_LB_RCdnSC(g1,t1)     2
 S1 s34
    muLB_WindDA(w1,t1)     1
    SOS1_LB_WindDA(w1,t1)     2
 S1 s35
    muLB_RUp(g1,s1,t1)     1
    SOS1_LB_RUp(g1,s1,t1)     2
 S1 s36
    muLB_RDn(g1,s1,t1)     1
    SOS1_LB_RDn(g1,s1,t1)     2
 S1 s37
    muLB_RUp(g2,s1,t1)     1
    SOS1_LB_RUp(g2,s1,t1)     2
 S1 s38
    muLB_RDn(g2,s1,t1)     1
    SOS1_LB_RDn(g2,s1,t1)     2
 S1 s39
    muLB_RUpSC(g1,s1,t1)     1
    SOS1_LB_RUpSC(g1,s1,t1)     2
 S1 s40
    muLB_RDnSC(g1,s1,t1)     1
    SOS1_LB_RDnSC(g1,s1,t1)     2
 S1 s41
    muLB_Wspill(w1,s1,t1)     1
    SOS1_LB_Wspill(w1,s1,t1)     2
 S1 s42
    muLB_Lshed(s1,t1)     1
    SOS1_LB_Lshed(s1,t1)     2
 S1 s43
    muLB_RUp(g1,s2,t1)     1
    SOS1_LB_RUp(g1,s2,t1)     2
 S1 s44
    muLB_RDn(g1,s2,t1)     1
    SOS1_LB_RDn(g1,s2,t1)     2
 S1 s45
    muLB_RUp(g2,s2,t1)     1
    SOS1_LB_RUp(g2,s2,t1)     2
 S1 s46
    muLB_RDn(g2,s2,t1)     1
    SOS1_LB_RDn(g2,s2,t1)     2
 S1 s47
    muLB_RUpSC(g1,s2,t1)     1
    SOS1_LB_RUpSC(g1,s2,t1)     2
 S1 s48
    muLB_RDnSC(g1,s2,t1)     1
    SOS1_LB_RDnSC(g1,s2,t1)     2
 S1 s49
    muLB_Wspill(w1,s2,t1)     1
    SOS1_LB_Wspill(w1,s2,t1)     2
 S1 s50
    muLB_Lshed(s2,t1)     1
    SOS1_LB_Lshed(s2,t1)     2
 S1 s51
    mu_gshed_da_max(ng101,k0,t1)     1
    SOS1_gshed_da_max(ng101,k0,t1)     2
 S1 s52
    mu_gshed_da_max(ng101,k1,t1)     1
    SOS1_gshed_da_max(ng101,k1,t1)     2
 S1 s53
    mu_gshed_da_max(ng101,k2,t1)     1
    SOS1_gshed_da_max(ng101,k2,t1)     2
 S1 s54
    mu_gprod_max(gw1,k0,t1)     1
    SOS1_gprod_max(gw1,k0,t1)     2
 S1 s55
    mu_gprod_max(gw1,k1,t1)     1
    SOS1_gprod_max(gw1,k1,t1)     2
 S1 s56
    mu_gprod_max(gw1,k2,t1)     1
    SOS1_gprod_max(gw1,k2,t1)     2
 S1 s57
    mu_gprod_max(gw2,k0,t1)     1
    SOS1_gprod_max(gw2,k0,t1)     2
 S1 s58
    mu_gprod_max(gw2,k1,t1)     1
    SOS1_gprod_max(gw2,k1,t1)     2
 S1 s59
    mu_gprod_max(gw2,k2,t1)     1
    SOS1_gprod_max(gw2,k2,t1)     2
 S1 s60
    mu_gprod_max(gw3,k0,t1)     1
    SOS1_gprod_max(gw3,k0,t1)     2
 S1 s61
    mu_gprod_max(gw3,k1,t1)     1
    SOS1_gprod_max(gw3,k1,t1)     2
 S1 s62
    mu_gprod_max(gw3,k2,t1)     1
    SOS1_gprod_max(gw3,k2,t1)     2
 S1 s63
    muLB_gshed_da(ng101,k0,t1)     1
    SOS1_LB_gshed_da(ng101,k0,t1)     2
 S1 s64
    muLB_gshed_da(ng101,k1,t1)     1
    SOS1_LB_gshed_da(ng101,k1,t1)     2
 S1 s65
    muLB_gshed_da(ng101,k2,t1)     1
    SOS1_LB_gshed_da(ng101,k2,t1)     2
 S1 s66
    muLB_gprod(gw1,k0,t1)     1
    SOS1_LB_gprod(gw1,k0,t1)     2
 S1 s67
    muLB_gprod(gw1,k1,t1)     1
    SOS1_LB_gprod(gw1,k1,t1)     2
 S1 s68
    muLB_gprod(gw1,k2,t1)     1
    SOS1_LB_gprod(gw1,k2,t1)     2
 S1 s69
    muLB_gprod(gw2,k0,t1)     1
    SOS1_LB_gprod(gw2,k0,t1)     2
 S1 s70
    muLB_gprod(gw2,k1,t1)     1
    SOS1_LB_gprod(gw2,k1,t1)     2
 S1 s71
    muLB_gprod(gw2,k2,t1)     1
    SOS1_LB_gprod(gw2,k2,t1)     2
 S1 s72
    muLB_gprod(gw3,k0,t1)     1
    SOS1_LB_gprod(gw3,k0,t1)     2
 S1 s73
    muLB_gprod(gw3,k1,t1)     1
    SOS1_LB_gprod(gw3,k1,t1)     2
 S1 s74
    muLB_gprod(gw3,k2,t1)     1
    SOS1_LB_gprod(gw3,k2,t1)     2
 S1 s75
    mu_gprodUp_max(gw1,s1,t1)     1
    SOS1_gprodUp_max(gw1,s1,t1)     2
 S1 s76
    mu_gprodDn_max(gw1,s1,t1)     1
    SOS1_gprodDn_max(gw1,s1,t1)     2
 S1 s77
    mu_gprodUp_max(gw1,s2,t1)     1
    SOS1_gprodUp_max(gw1,s2,t1)     2
 S1 s78
    mu_gprodDn_max(gw1,s2,t1)     1
    SOS1_gprodDn_max(gw1,s2,t1)     2
 S1 s79
    mu_gprodUp_max(gw2,s1,t1)     1
    SOS1_gprodUp_max(gw2,s1,t1)     2
 S1 s80
    mu_gprodDn_max(gw2,s1,t1)     1
    SOS1_gprodDn_max(gw2,s1,t1)     2
 S1 s81
    mu_gprodUp_max(gw2,s2,t1)     1
    SOS1_gprodUp_max(gw2,s2,t1)     2
 S1 s82
    mu_gprodDn_max(gw2,s2,t1)     1
    SOS1_gprodDn_max(gw2,s2,t1)     2
 S1 s83
    mu_gprodUp_max(gw3,s1,t1)     1
    SOS1_gprodUp_max(gw3,s1,t1)     2
 S1 s84
    mu_gprodDn_max(gw3,s1,t1)     1
    SOS1_gprodDn_max(gw3,s1,t1)     2
 S1 s85
    mu_gprodUp_max(gw3,s2,t1)     1
    SOS1_gprodUp_max(gw3,s2,t1)     2
 S1 s86
    mu_gprodDn_max(gw3,s2,t1)     1
    SOS1_gprodDn_max(gw3,s2,t1)     2
 S1 s87
    mu_gas_shed_rt(ng101,s1,t1)     1
    SOS1_gas_shed_rt(ng101,s1,t1)     2
 S1 s88
    mu_gas_shed_rt(ng101,s2,t1)     1
    SOS1_gas_shed_rt(ng101,s2,t1)     2
 S1 s89
    muLB_gshed(ng101,s1,t1)     1
    SOS1_LB_gshed(ng101,s1,t1)     2
 S1 s90
    muLB_gprodUp(gw1,s1,t1)     1
    SOS1_LB_gprodUp(gw1,s1,t1)     2
 S1 s91
    muLB_gprodDn(gw1,s1,t1)     1
    SOS1_LB_gprodDn(gw1,s1,t1)     2
 S1 s92
    muLB_gprodUp(gw2,s1,t1)     1
    SOS1_LB_gprodUp(gw2,s1,t1)     2
 S1 s93
    muLB_gprodDn(gw2,s1,t1)     1
    SOS1_LB_gprodDn(gw2,s1,t1)     2
 S1 s94
    muLB_gprodUp(gw3,s1,t1)     1
    SOS1_LB_gprodUp(gw3,s1,t1)     2
 S1 s95
    muLB_gprodDn(gw3,s1,t1)     1
    SOS1_LB_gprodDn(gw3,s1,t1)     2
 S1 s96
    muLB_gshed(ng101,s2,t1)     1
    SOS1_LB_gshed(ng101,s2,t1)     2
 S1 s97
    muLB_gprodUp(gw1,s2,t1)     1
    SOS1_LB_gprodUp(gw1,s2,t1)     2
 S1 s98
    muLB_gprodDn(gw1,s2,t1)     1
    SOS1_LB_gprodDn(gw1,s2,t1)     2
 S1 s99
    muLB_gprodUp(gw2,s2,t1)     1
    SOS1_LB_gprodUp(gw2,s2,t1)     2
 S1 s100
    muLB_gprodDn(gw2,s2,t1)     1
    SOS1_LB_gprodDn(gw2,s2,t1)     2
 S1 s101
    muLB_gprodUp(gw3,s2,t1)     1
    SOS1_LB_gprodUp(gw3,s2,t1)     2
 S1 s102
    muLB_gprodDn(gw3,s2,t1)     1
    SOS1_LB_gprodDn(gw3,s2,t1)     2
ENDATA
