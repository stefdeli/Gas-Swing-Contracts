\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  2 gprod(gw1,k0,t1) + 2 gprod(gw1,k0,t2) + 2 gprod(gw1,k0,t3)
   + 2 gprod(gw1,k0,t4) + 2 gprod(gw1,k0,t5) + 2 gprod(gw1,k0,t6)
   + 2 gprod(gw1,k0,t7) + 2 gprod(gw1,k0,t8) + 2 gprod(gw1,k0,t9)
   + 2 gprod(gw1,k0,t10) + 2 gprod(gw1,k0,t11) + 2 gprod(gw1,k0,t12)
   + 2 gprod(gw1,k0,t13) + 2 gprod(gw1,k0,t14) + 2 gprod(gw1,k0,t15)
   + 2 gprod(gw1,k0,t16) + 2 gprod(gw1,k0,t17) + 2 gprod(gw1,k0,t18)
   + 2 gprod(gw1,k0,t19) + 2 gprod(gw1,k0,t20) + 2 gprod(gw1,k0,t21)
   + 2 gprod(gw1,k0,t22) + 2 gprod(gw1,k0,t23) + 2 gprod(gw1,k0,t24)
   + 2.1 gsin(gs1,t1,k0) + 2.1 gsout(gs1,t1,k0) + 2.1 gsin(gs1,t2,k0)
   + 2.1 gsout(gs1,t2,k0) + 2.1 gsin(gs1,t3,k0) + 2.1 gsout(gs1,t3,k0)
   + 2.1 gsin(gs1,t4,k0) + 2.1 gsout(gs1,t4,k0) + 2.1 gsin(gs1,t5,k0)
   + 2.1 gsout(gs1,t5,k0) + 2.1 gsin(gs1,t6,k0) + 2.1 gsout(gs1,t6,k0)
   + 2.1 gsin(gs1,t7,k0) + 2.1 gsout(gs1,t7,k0) + 2.1 gsin(gs1,t8,k0)
   + 2.1 gsout(gs1,t8,k0) + 2.1 gsin(gs1,t9,k0) + 2.1 gsout(gs1,t9,k0)
   + 2.1 gsin(gs1,t10,k0) + 2.1 gsout(gs1,t10,k0) + 2.1 gsin(gs1,t11,k0)
   + 2.1 gsout(gs1,t11,k0) + 2.1 gsin(gs1,t12,k0) + 2.1 gsout(gs1,t12,k0)
   + 2.1 gsin(gs1,t13,k0) + 2.1 gsout(gs1,t13,k0) + 2.1 gsin(gs1,t14,k0)
   + 2.1 gsout(gs1,t14,k0) + 2.1 gsin(gs1,t15,k0) + 2.1 gsout(gs1,t15,k0)
   + 2.1 gsin(gs1,t16,k0) + 2.1 gsout(gs1,t16,k0) + 2.1 gsin(gs1,t17,k0)
   + 2.1 gsout(gs1,t17,k0) + 2.1 gsin(gs1,t18,k0) + 2.1 gsout(gs1,t18,k0)
   + 2.1 gsin(gs1,t19,k0) + 2.1 gsout(gs1,t19,k0) + 2.1 gsin(gs1,t20,k0)
   + 2.1 gsout(gs1,t20,k0) + 2.1 gsin(gs1,t21,k0) + 2.1 gsout(gs1,t21,k0)
   + 2.1 gsin(gs1,t22,k0) + 2.1 gsout(gs1,t22,k0) + 2.1 gsin(gs1,t23,k0)
   + 2.1 gsout(gs1,t23,k0) + 2.1 gsin(gs1,t24,k0) + 2.1 gsout(gs1,t24,k0)
Subject To
 gas_balance_da(ng101,k0,t1): - qin_sr(('ng101','ng102'),k0,t1)
   + gprod(gw1,k0,t1) = 0
 gas_balance_da(ng101,k1,t1): - qin_sr(('ng101','ng102'),k1,t1)
   + gprod(gw1,k1,t1) = 0
 gas_balance_da(ng101,k2,t1): - qin_sr(('ng101','ng102'),k2,t1)
   + gprod(gw1,k2,t1) = 0
 gas_balance_da(ng102,k0,t1): qout_sr(('ng101','ng102'),k0,t1)
   - gsin(gs1,t1,k0) + gsout(gs1,t1,k0) = 2383.830856
 gas_balance_da(ng102,k1,t1): qout_sr(('ng101','ng102'),k1,t1)
   - gsin(gs1,t1,k1) + gsout(gs1,t1,k1) = 2463.830856
 gas_balance_da(ng102,k2,t1): qout_sr(('ng101','ng102'),k2,t1)
   - gsin(gs1,t1,k2) + gsout(gs1,t1,k2) = 2383.830856
 gas_balance_da(ng101,k0,t2): - qin_sr(('ng101','ng102'),k0,t2)
   + gprod(gw1,k0,t2) = 0
 gas_balance_da(ng101,k1,t2): - qin_sr(('ng101','ng102'),k1,t2)
   + gprod(gw1,k1,t2) = 0
 gas_balance_da(ng101,k2,t2): - qin_sr(('ng101','ng102'),k2,t2)
   + gprod(gw1,k2,t2) = 0
 gas_balance_da(ng102,k0,t2): qout_sr(('ng101','ng102'),k0,t2)
   - gsin(gs1,t2,k0) + gsout(gs1,t2,k0) = 2301.50205872
 gas_balance_da(ng102,k1,t2): qout_sr(('ng101','ng102'),k1,t2)
   - gsin(gs1,t2,k1) + gsout(gs1,t2,k1) = 2381.50205872
 gas_balance_da(ng102,k2,t2): qout_sr(('ng101','ng102'),k2,t2)
   - gsin(gs1,t2,k2) + gsout(gs1,t2,k2) = 2301.50205872
 gas_balance_da(ng101,k0,t3): - qin_sr(('ng101','ng102'),k0,t3)
   + gprod(gw1,k0,t3) = 0
 gas_balance_da(ng101,k1,t3): - qin_sr(('ng101','ng102'),k1,t3)
   + gprod(gw1,k1,t3) = 0
 gas_balance_da(ng101,k2,t3): - qin_sr(('ng101','ng102'),k2,t3)
   + gprod(gw1,k2,t3) = 0
 gas_balance_da(ng102,k0,t3): qout_sr(('ng101','ng102'),k0,t3)
   - gsin(gs1,t3,k0) + gsout(gs1,t3,k0) = 2215.80789384
 gas_balance_da(ng102,k1,t3): qout_sr(('ng101','ng102'),k1,t3)
   - gsin(gs1,t3,k1) + gsout(gs1,t3,k1) = 2295.80789384
 gas_balance_da(ng102,k2,t3): qout_sr(('ng101','ng102'),k2,t3)
   - gsin(gs1,t3,k2) + gsout(gs1,t3,k2) = 2215.80789384
 gas_balance_da(ng101,k0,t4): - qin_sr(('ng101','ng102'),k0,t4)
   + gprod(gw1,k0,t4) = 0
 gas_balance_da(ng101,k1,t4): - qin_sr(('ng101','ng102'),k1,t4)
   + gprod(gw1,k1,t4) = 0
 gas_balance_da(ng101,k2,t4): - qin_sr(('ng101','ng102'),k2,t4)
   + gprod(gw1,k2,t4) = 0
 gas_balance_da(ng102,k0,t4): qout_sr(('ng101','ng102'),k0,t4)
   - gsin(gs1,t4,k0) + gsout(gs1,t4,k0) = 2259.63127596
 gas_balance_da(ng102,k1,t4): qout_sr(('ng101','ng102'),k1,t4)
   - gsin(gs1,t4,k1) + gsout(gs1,t4,k1) = 2339.63127596
 gas_balance_da(ng102,k2,t4): qout_sr(('ng101','ng102'),k2,t4)
   - gsin(gs1,t4,k2) + gsout(gs1,t4,k2) = 2259.63127596
 gas_balance_da(ng101,k0,t5): - qin_sr(('ng101','ng102'),k0,t5)
   + gprod(gw1,k0,t5) = 0
 gas_balance_da(ng101,k1,t5): - qin_sr(('ng101','ng102'),k1,t5)
   + gprod(gw1,k1,t5) = 0
 gas_balance_da(ng101,k2,t5): - qin_sr(('ng101','ng102'),k2,t5)
   + gprod(gw1,k2,t5) = 0
 gas_balance_da(ng102,k0,t5): qout_sr(('ng101','ng102'),k0,t5)
   - gsin(gs1,t5,k0) + gsout(gs1,t5,k0) = 2294.1903576
 gas_balance_da(ng102,k1,t5): qout_sr(('ng101','ng102'),k1,t5)
   - gsin(gs1,t5,k1) + gsout(gs1,t5,k1) = 2374.1903576
 gas_balance_da(ng102,k2,t5): qout_sr(('ng101','ng102'),k2,t5)
   - gsin(gs1,t5,k2) + gsout(gs1,t5,k2) = 2294.1903576
 gas_balance_da(ng101,k0,t6): - qin_sr(('ng101','ng102'),k0,t6)
   + gprod(gw1,k0,t6) = 0
 gas_balance_da(ng101,k1,t6): - qin_sr(('ng101','ng102'),k1,t6)
   + gprod(gw1,k1,t6) = 0
 gas_balance_da(ng101,k2,t6): - qin_sr(('ng101','ng102'),k2,t6)
   + gprod(gw1,k2,t6) = 0
 gas_balance_da(ng102,k0,t6): qout_sr(('ng101','ng102'),k0,t6)
   - gsin(gs1,t6,k0) + gsout(gs1,t6,k0) = 2339.62351868
 gas_balance_da(ng102,k1,t6): qout_sr(('ng101','ng102'),k1,t6)
   - gsin(gs1,t6,k1) + gsout(gs1,t6,k1) = 2419.62351868
 gas_balance_da(ng102,k2,t6): qout_sr(('ng101','ng102'),k2,t6)
   - gsin(gs1,t6,k2) + gsout(gs1,t6,k2) = 2339.62351868
 gas_balance_da(ng101,k0,t7): - qin_sr(('ng101','ng102'),k0,t7)
   + gprod(gw1,k0,t7) = 0
 gas_balance_da(ng101,k1,t7): - qin_sr(('ng101','ng102'),k1,t7)
   + gprod(gw1,k1,t7) = 0
 gas_balance_da(ng101,k2,t7): - qin_sr(('ng101','ng102'),k2,t7)
   + gprod(gw1,k2,t7) = 0
 gas_balance_da(ng102,k0,t7): qout_sr(('ng101','ng102'),k0,t7)
   - gsin(gs1,t7,k0) + gsout(gs1,t7,k0) = 2665.43204996
 gas_balance_da(ng102,k1,t7): qout_sr(('ng101','ng102'),k1,t7)
   - gsin(gs1,t7,k1) + gsout(gs1,t7,k1) = 2745.43204996
 gas_balance_da(ng102,k2,t7): qout_sr(('ng101','ng102'),k2,t7)
   - gsin(gs1,t7,k2) + gsout(gs1,t7,k2) = 2665.43204996
 gas_balance_da(ng101,k0,t8): - qin_sr(('ng101','ng102'),k0,t8)
   + gprod(gw1,k0,t8) = 0
 gas_balance_da(ng101,k1,t8): - qin_sr(('ng101','ng102'),k1,t8)
   + gprod(gw1,k1,t8) = 0
 gas_balance_da(ng101,k2,t8): - qin_sr(('ng101','ng102'),k2,t8)
   + gprod(gw1,k2,t8) = 0
 gas_balance_da(ng102,k0,t8): qout_sr(('ng101','ng102'),k0,t8)
   - gsin(gs1,t8,k0) + gsout(gs1,t8,k0) = 2698.5561764
 gas_balance_da(ng102,k1,t8): qout_sr(('ng101','ng102'),k1,t8)
   - gsin(gs1,t8,k1) + gsout(gs1,t8,k1) = 2778.5561764
 gas_balance_da(ng102,k2,t8): qout_sr(('ng101','ng102'),k2,t8)
   - gsin(gs1,t8,k2) + gsout(gs1,t8,k2) = 2698.5561764
 gas_balance_da(ng101,k0,t9): - qin_sr(('ng101','ng102'),k0,t9)
   + gprod(gw1,k0,t9) = 0
 gas_balance_da(ng101,k1,t9): - qin_sr(('ng101','ng102'),k1,t9)
   + gprod(gw1,k1,t9) = 0
 gas_balance_da(ng101,k2,t9): - qin_sr(('ng101','ng102'),k2,t9)
   + gprod(gw1,k2,t9) = 0
 gas_balance_da(ng102,k0,t9): qout_sr(('ng101','ng102'),k0,t9)
   - gsin(gs1,t9,k0) + gsout(gs1,t9,k0) = 2936.78271432
 gas_balance_da(ng102,k1,t9): qout_sr(('ng101','ng102'),k1,t9)
   - gsin(gs1,t9,k1) + gsout(gs1,t9,k1) = 3016.78271432
 gas_balance_da(ng102,k2,t9): qout_sr(('ng101','ng102'),k2,t9)
   - gsin(gs1,t9,k2) + gsout(gs1,t9,k2) = 2936.78271432
 gas_balance_da(ng101,k0,t10): - qin_sr(('ng101','ng102'),k0,t10)
   + gprod(gw1,k0,t10) = 0
 gas_balance_da(ng101,k1,t10): - qin_sr(('ng101','ng102'),k1,t10)
   + gprod(gw1,k1,t10) = 0
 gas_balance_da(ng101,k2,t10): - qin_sr(('ng101','ng102'),k2,t10)
   + gprod(gw1,k2,t10) = 0
 gas_balance_da(ng102,k0,t10): qout_sr(('ng101','ng102'),k0,t10)
   - gsin(gs1,t10,k0) + gsout(gs1,t10,k0) = 2991.78911724
 gas_balance_da(ng102,k1,t10): qout_sr(('ng101','ng102'),k1,t10)
   - gsin(gs1,t10,k1) + gsout(gs1,t10,k1) = 3071.78911724
 gas_balance_da(ng102,k2,t10): qout_sr(('ng101','ng102'),k2,t10)
   - gsin(gs1,t10,k2) + gsout(gs1,t10,k2) = 2991.78911724
 gas_balance_da(ng101,k0,t11): - qin_sr(('ng101','ng102'),k0,t11)
   + gprod(gw1,k0,t11) = 0
 gas_balance_da(ng101,k1,t11): - qin_sr(('ng101','ng102'),k1,t11)
   + gprod(gw1,k1,t11) = 0
 gas_balance_da(ng101,k2,t11): - qin_sr(('ng101','ng102'),k2,t11)
   + gprod(gw1,k2,t11) = 0
 gas_balance_da(ng102,k0,t11): qout_sr(('ng101','ng102'),k0,t11)
   - gsin(gs1,t11,k0) + gsout(gs1,t11,k0) = 2994.21505968
 gas_balance_da(ng102,k1,t11): qout_sr(('ng101','ng102'),k1,t11)
   - gsin(gs1,t11,k1) + gsout(gs1,t11,k1) = 3074.21505968
 gas_balance_da(ng102,k2,t11): qout_sr(('ng101','ng102'),k2,t11)
   - gsin(gs1,t11,k2) + gsout(gs1,t11,k2) = 2994.21505968
 gas_balance_da(ng101,k0,t12): - qin_sr(('ng101','ng102'),k0,t12)
   + gprod(gw1,k0,t12) = 0
 gas_balance_da(ng101,k1,t12): - qin_sr(('ng101','ng102'),k1,t12)
   + gprod(gw1,k1,t12) = 0
 gas_balance_da(ng101,k2,t12): - qin_sr(('ng101','ng102'),k2,t12)
   + gprod(gw1,k2,t12) = 0
 gas_balance_da(ng102,k0,t12): qout_sr(('ng101','ng102'),k0,t12)
   - gsin(gs1,t12,k0) + gsout(gs1,t12,k0) = 2943.37160072
 gas_balance_da(ng102,k1,t12): qout_sr(('ng101','ng102'),k1,t12)
   - gsin(gs1,t12,k1) + gsout(gs1,t12,k1) = 3023.37160072
 gas_balance_da(ng102,k2,t12): qout_sr(('ng101','ng102'),k2,t12)
   - gsin(gs1,t12,k2) + gsout(gs1,t12,k2) = 2943.37160072
 gas_balance_da(ng101,k0,t13): - qin_sr(('ng101','ng102'),k0,t13)
   + gprod(gw1,k0,t13) = 0
 gas_balance_da(ng101,k1,t13): - qin_sr(('ng101','ng102'),k1,t13)
   + gprod(gw1,k1,t13) = 0
 gas_balance_da(ng101,k2,t13): - qin_sr(('ng101','ng102'),k2,t13)
   + gprod(gw1,k2,t13) = 0
 gas_balance_da(ng102,k0,t13): qout_sr(('ng101','ng102'),k0,t13)
   - gsin(gs1,t13,k0) + gsout(gs1,t13,k0) = 2932.22877808
 gas_balance_da(ng102,k1,t13): qout_sr(('ng101','ng102'),k1,t13)
   - gsin(gs1,t13,k1) + gsout(gs1,t13,k1) = 3012.22877808
 gas_balance_da(ng102,k2,t13): qout_sr(('ng101','ng102'),k2,t13)
   - gsin(gs1,t13,k2) + gsout(gs1,t13,k2) = 2932.22877808
 gas_balance_da(ng101,k0,t14): - qin_sr(('ng101','ng102'),k0,t14)
   + gprod(gw1,k0,t14) = 0
 gas_balance_da(ng101,k1,t14): - qin_sr(('ng101','ng102'),k1,t14)
   + gprod(gw1,k1,t14) = 0
 gas_balance_da(ng101,k2,t14): - qin_sr(('ng101','ng102'),k2,t14)
   + gprod(gw1,k2,t14) = 0
 gas_balance_da(ng102,k0,t14): qout_sr(('ng101','ng102'),k0,t14)
   - gsin(gs1,t14,k0) + gsout(gs1,t14,k0) = 2912.61918324
 gas_balance_da(ng102,k1,t14): qout_sr(('ng101','ng102'),k1,t14)
   - gsin(gs1,t14,k1) + gsout(gs1,t14,k1) = 2992.61918324
 gas_balance_da(ng102,k2,t14): qout_sr(('ng101','ng102'),k2,t14)
   - gsin(gs1,t14,k2) + gsout(gs1,t14,k2) = 2912.61918324
 gas_balance_da(ng101,k0,t15): - qin_sr(('ng101','ng102'),k0,t15)
   + gprod(gw1,k0,t15) = 0
 gas_balance_da(ng101,k1,t15): - qin_sr(('ng101','ng102'),k1,t15)
   + gprod(gw1,k1,t15) = 0
 gas_balance_da(ng101,k2,t15): - qin_sr(('ng101','ng102'),k2,t15)
   + gprod(gw1,k2,t15) = 0
 gas_balance_da(ng102,k0,t15): qout_sr(('ng101','ng102'),k0,t15)
   - gsin(gs1,t15,k0) + gsout(gs1,t15,k0) = 2852.2276634
 gas_balance_da(ng102,k1,t15): qout_sr(('ng101','ng102'),k1,t15)
   - gsin(gs1,t15,k1) + gsout(gs1,t15,k1) = 2932.2276634
 gas_balance_da(ng102,k2,t15): qout_sr(('ng101','ng102'),k2,t15)
   - gsin(gs1,t15,k2) + gsout(gs1,t15,k2) = 2852.2276634
 gas_balance_da(ng101,k0,t16): - qin_sr(('ng101','ng102'),k0,t16)
   + gprod(gw1,k0,t16) = 0
 gas_balance_da(ng101,k1,t16): - qin_sr(('ng101','ng102'),k1,t16)
   + gprod(gw1,k1,t16) = 0
 gas_balance_da(ng101,k2,t16): - qin_sr(('ng101','ng102'),k2,t16)
   + gprod(gw1,k2,t16) = 0
 gas_balance_da(ng102,k0,t16): qout_sr(('ng101','ng102'),k0,t16)
   - gsin(gs1,t16,k0) + gsout(gs1,t16,k0) = 2890.41138104
 gas_balance_da(ng102,k1,t16): qout_sr(('ng101','ng102'),k1,t16)
   - gsin(gs1,t16,k1) + gsout(gs1,t16,k1) = 2970.41138104
 gas_balance_da(ng102,k2,t16): qout_sr(('ng101','ng102'),k2,t16)
   - gsin(gs1,t16,k2) + gsout(gs1,t16,k2) = 2890.41138104
 gas_balance_da(ng101,k0,t17): - qin_sr(('ng101','ng102'),k0,t17)
   + gprod(gw1,k0,t17) = 0
 gas_balance_da(ng101,k1,t17): - qin_sr(('ng101','ng102'),k1,t17)
   + gprod(gw1,k1,t17) = 0
 gas_balance_da(ng101,k2,t17): - qin_sr(('ng101','ng102'),k2,t17)
   + gprod(gw1,k2,t17) = 0
 gas_balance_da(ng102,k0,t17): qout_sr(('ng101','ng102'),k0,t17)
   - gsin(gs1,t17,k0) + gsout(gs1,t17,k0) = 3026.52303392
 gas_balance_da(ng102,k1,t17): qout_sr(('ng101','ng102'),k1,t17)
   - gsin(gs1,t17,k1) + gsout(gs1,t17,k1) = 3106.52303392
 gas_balance_da(ng102,k2,t17): qout_sr(('ng101','ng102'),k2,t17)
   - gsin(gs1,t17,k2) + gsout(gs1,t17,k2) = 3026.52303392
 gas_balance_da(ng101,k0,t18): - qin_sr(('ng101','ng102'),k0,t18)
   + gprod(gw1,k0,t18) = 0
 gas_balance_da(ng101,k1,t18): - qin_sr(('ng101','ng102'),k1,t18)
   + gprod(gw1,k1,t18) = 0
 gas_balance_da(ng101,k2,t18): - qin_sr(('ng101','ng102'),k2,t18)
   + gprod(gw1,k2,t18) = 0
 gas_balance_da(ng102,k0,t18): qout_sr(('ng101','ng102'),k0,t18)
   - gsin(gs1,t18,k0) + gsout(gs1,t18,k0) = 3024.93329268
 gas_balance_da(ng102,k1,t18): qout_sr(('ng101','ng102'),k1,t18)
   - gsin(gs1,t18,k1) + gsout(gs1,t18,k1) = 3104.93329268
 gas_balance_da(ng102,k2,t18): qout_sr(('ng101','ng102'),k2,t18)
   - gsin(gs1,t18,k2) + gsout(gs1,t18,k2) = 3024.93329268
 gas_balance_da(ng101,k0,t19): - qin_sr(('ng101','ng102'),k0,t19)
   + gprod(gw1,k0,t19) = 0
 gas_balance_da(ng101,k1,t19): - qin_sr(('ng101','ng102'),k1,t19)
   + gprod(gw1,k1,t19) = 0
 gas_balance_da(ng101,k2,t19): - qin_sr(('ng101','ng102'),k2,t19)
   + gprod(gw1,k2,t19) = 0
 gas_balance_da(ng102,k0,t19): qout_sr(('ng101','ng102'),k0,t19)
   - gsin(gs1,t19,k0) + gsout(gs1,t19,k0) = 3025.34092188
 gas_balance_da(ng102,k1,t19): qout_sr(('ng101','ng102'),k1,t19)
   - gsin(gs1,t19,k1) + gsout(gs1,t19,k1) = 3105.34092188
 gas_balance_da(ng102,k2,t19): qout_sr(('ng101','ng102'),k2,t19)
   - gsin(gs1,t19,k2) + gsout(gs1,t19,k2) = 3025.34092188
 gas_balance_da(ng101,k0,t20): - qin_sr(('ng101','ng102'),k0,t20)
   + gprod(gw1,k0,t20) = 0
 gas_balance_da(ng101,k1,t20): - qin_sr(('ng101','ng102'),k1,t20)
   + gprod(gw1,k1,t20) = 0
 gas_balance_da(ng101,k2,t20): - qin_sr(('ng101','ng102'),k2,t20)
   + gprod(gw1,k2,t20) = 0
 gas_balance_da(ng102,k0,t20): qout_sr(('ng101','ng102'),k0,t20)
   - gsin(gs1,t20,k0) + gsout(gs1,t20,k0) = 2938.75175496
 gas_balance_da(ng102,k1,t20): qout_sr(('ng101','ng102'),k1,t20)
   - gsin(gs1,t20,k1) + gsout(gs1,t20,k1) = 3018.75175496
 gas_balance_da(ng102,k2,t20): qout_sr(('ng101','ng102'),k2,t20)
   - gsin(gs1,t20,k2) + gsout(gs1,t20,k2) = 2938.75175496
 gas_balance_da(ng101,k0,t21): - qin_sr(('ng101','ng102'),k0,t21)
   + gprod(gw1,k0,t21) = 0
 gas_balance_da(ng101,k1,t21): - qin_sr(('ng101','ng102'),k1,t21)
   + gprod(gw1,k1,t21) = 0
 gas_balance_da(ng101,k2,t21): - qin_sr(('ng101','ng102'),k2,t21)
   + gprod(gw1,k2,t21) = 0
 gas_balance_da(ng102,k0,t21): qout_sr(('ng101','ng102'),k0,t21)
   - gsin(gs1,t21,k0) + gsout(gs1,t21,k0) = 2811.25661024
 gas_balance_da(ng102,k1,t21): qout_sr(('ng101','ng102'),k1,t21)
   - gsin(gs1,t21,k1) + gsout(gs1,t21,k1) = 2891.25661024
 gas_balance_da(ng102,k2,t21): qout_sr(('ng101','ng102'),k2,t21)
   - gsin(gs1,t21,k2) + gsout(gs1,t21,k2) = 2811.25661024
 gas_balance_da(ng101,k0,t22): - qin_sr(('ng101','ng102'),k0,t22)
   + gprod(gw1,k0,t22) = 0
 gas_balance_da(ng101,k1,t22): - qin_sr(('ng101','ng102'),k1,t22)
   + gprod(gw1,k1,t22) = 0
 gas_balance_da(ng101,k2,t22): - qin_sr(('ng101','ng102'),k2,t22)
   + gprod(gw1,k2,t22) = 0
 gas_balance_da(ng102,k0,t22): qout_sr(('ng101','ng102'),k0,t22)
   - gsin(gs1,t22,k0) + gsout(gs1,t22,k0) = 2594.74976132
 gas_balance_da(ng102,k1,t22): qout_sr(('ng101','ng102'),k1,t22)
   - gsin(gs1,t22,k1) + gsout(gs1,t22,k1) = 2674.74976132
 gas_balance_da(ng102,k2,t22): qout_sr(('ng101','ng102'),k2,t22)
   - gsin(gs1,t22,k2) + gsout(gs1,t22,k2) = 2594.74976132
 gas_balance_da(ng101,k0,t23): - qin_sr(('ng101','ng102'),k0,t23)
   + gprod(gw1,k0,t23) = 0
 gas_balance_da(ng101,k1,t23): - qin_sr(('ng101','ng102'),k1,t23)
   + gprod(gw1,k1,t23) = 0
 gas_balance_da(ng101,k2,t23): - qin_sr(('ng101','ng102'),k2,t23)
   + gprod(gw1,k2,t23) = 0
 gas_balance_da(ng102,k0,t23): qout_sr(('ng101','ng102'),k0,t23)
   - gsin(gs1,t23,k0) + gsout(gs1,t23,k0) = 2336.69919272
 gas_balance_da(ng102,k1,t23): qout_sr(('ng101','ng102'),k1,t23)
   - gsin(gs1,t23,k1) + gsout(gs1,t23,k1) = 2416.69919272
 gas_balance_da(ng102,k2,t23): qout_sr(('ng101','ng102'),k2,t23)
   - gsin(gs1,t23,k2) + gsout(gs1,t23,k2) = 2336.69919272
 gas_balance_da(ng101,k0,t24): - qin_sr(('ng101','ng102'),k0,t24)
   + gprod(gw1,k0,t24) = 0
 gas_balance_da(ng101,k1,t24): - qin_sr(('ng101','ng102'),k1,t24)
   + gprod(gw1,k1,t24) = 0
 gas_balance_da(ng101,k2,t24): - qin_sr(('ng101','ng102'),k2,t24)
   + gprod(gw1,k2,t24) = 0
 gas_balance_da(ng102,k0,t24): qout_sr(('ng101','ng102'),k0,t24)
   - gsin(gs1,t24,k0) + gsout(gs1,t24,k0) = 2384.60073084
 gas_balance_da(ng102,k1,t24): qout_sr(('ng101','ng102'),k1,t24)
   - gsin(gs1,t24,k1) + gsout(gs1,t24,k1) = 2464.60073084
 gas_balance_da(ng102,k2,t24): qout_sr(('ng101','ng102'),k2,t24)
   - gsin(gs1,t24,k2) + gsout(gs1,t24,k2) = 2384.60073084
 gprod_max(gw1,k0,t1): gprod(gw1,k0,t1) <= 100000
 gprod_max(gw1,k0,t2): gprod(gw1,k0,t2) <= 100000
 gprod_max(gw1,k0,t3): gprod(gw1,k0,t3) <= 100000
 gprod_max(gw1,k0,t4): gprod(gw1,k0,t4) <= 100000
 gprod_max(gw1,k0,t5): gprod(gw1,k0,t5) <= 100000
 gprod_max(gw1,k0,t6): gprod(gw1,k0,t6) <= 100000
 gprod_max(gw1,k0,t7): gprod(gw1,k0,t7) <= 100000
 gprod_max(gw1,k0,t8): gprod(gw1,k0,t8) <= 100000
 gprod_max(gw1,k0,t9): gprod(gw1,k0,t9) <= 100000
 gprod_max(gw1,k0,t10): gprod(gw1,k0,t10) <= 100000
 gprod_max(gw1,k0,t11): gprod(gw1,k0,t11) <= 100000
 gprod_max(gw1,k0,t12): gprod(gw1,k0,t12) <= 100000
 gprod_max(gw1,k0,t13): gprod(gw1,k0,t13) <= 100000
 gprod_max(gw1,k0,t14): gprod(gw1,k0,t14) <= 100000
 gprod_max(gw1,k0,t15): gprod(gw1,k0,t15) <= 100000
 gprod_max(gw1,k0,t16): gprod(gw1,k0,t16) <= 100000
 gprod_max(gw1,k0,t17): gprod(gw1,k0,t17) <= 100000
 gprod_max(gw1,k0,t18): gprod(gw1,k0,t18) <= 100000
 gprod_max(gw1,k0,t19): gprod(gw1,k0,t19) <= 100000
 gprod_max(gw1,k0,t20): gprod(gw1,k0,t20) <= 100000
 gprod_max(gw1,k0,t21): gprod(gw1,k0,t21) <= 100000
 gprod_max(gw1,k0,t22): gprod(gw1,k0,t22) <= 100000
 gprod_max(gw1,k0,t23): gprod(gw1,k0,t23) <= 100000
 gprod_max(gw1,k0,t24): gprod(gw1,k0,t24) <= 100000
 gprod_max(gw1,k1,t1): gprod(gw1,k1,t1) <= 100000
 gprod_max(gw1,k1,t2): gprod(gw1,k1,t2) <= 100000
 gprod_max(gw1,k1,t3): gprod(gw1,k1,t3) <= 100000
 gprod_max(gw1,k1,t4): gprod(gw1,k1,t4) <= 100000
 gprod_max(gw1,k1,t5): gprod(gw1,k1,t5) <= 100000
 gprod_max(gw1,k1,t6): gprod(gw1,k1,t6) <= 100000
 gprod_max(gw1,k1,t7): gprod(gw1,k1,t7) <= 100000
 gprod_max(gw1,k1,t8): gprod(gw1,k1,t8) <= 100000
 gprod_max(gw1,k1,t9): gprod(gw1,k1,t9) <= 100000
 gprod_max(gw1,k1,t10): gprod(gw1,k1,t10) <= 100000
 gprod_max(gw1,k1,t11): gprod(gw1,k1,t11) <= 100000
 gprod_max(gw1,k1,t12): gprod(gw1,k1,t12) <= 100000
 gprod_max(gw1,k1,t13): gprod(gw1,k1,t13) <= 100000
 gprod_max(gw1,k1,t14): gprod(gw1,k1,t14) <= 100000
 gprod_max(gw1,k1,t15): gprod(gw1,k1,t15) <= 100000
 gprod_max(gw1,k1,t16): gprod(gw1,k1,t16) <= 100000
 gprod_max(gw1,k1,t17): gprod(gw1,k1,t17) <= 100000
 gprod_max(gw1,k1,t18): gprod(gw1,k1,t18) <= 100000
 gprod_max(gw1,k1,t19): gprod(gw1,k1,t19) <= 100000
 gprod_max(gw1,k1,t20): gprod(gw1,k1,t20) <= 100000
 gprod_max(gw1,k1,t21): gprod(gw1,k1,t21) <= 100000
 gprod_max(gw1,k1,t22): gprod(gw1,k1,t22) <= 100000
 gprod_max(gw1,k1,t23): gprod(gw1,k1,t23) <= 100000
 gprod_max(gw1,k1,t24): gprod(gw1,k1,t24) <= 100000
 gprod_max(gw1,k2,t1): gprod(gw1,k2,t1) <= 100000
 gprod_max(gw1,k2,t2): gprod(gw1,k2,t2) <= 100000
 gprod_max(gw1,k2,t3): gprod(gw1,k2,t3) <= 100000
 gprod_max(gw1,k2,t4): gprod(gw1,k2,t4) <= 100000
 gprod_max(gw1,k2,t5): gprod(gw1,k2,t5) <= 100000
 gprod_max(gw1,k2,t6): gprod(gw1,k2,t6) <= 100000
 gprod_max(gw1,k2,t7): gprod(gw1,k2,t7) <= 100000
 gprod_max(gw1,k2,t8): gprod(gw1,k2,t8) <= 100000
 gprod_max(gw1,k2,t9): gprod(gw1,k2,t9) <= 100000
 gprod_max(gw1,k2,t10): gprod(gw1,k2,t10) <= 100000
 gprod_max(gw1,k2,t11): gprod(gw1,k2,t11) <= 100000
 gprod_max(gw1,k2,t12): gprod(gw1,k2,t12) <= 100000
 gprod_max(gw1,k2,t13): gprod(gw1,k2,t13) <= 100000
 gprod_max(gw1,k2,t14): gprod(gw1,k2,t14) <= 100000
 gprod_max(gw1,k2,t15): gprod(gw1,k2,t15) <= 100000
 gprod_max(gw1,k2,t16): gprod(gw1,k2,t16) <= 100000
 gprod_max(gw1,k2,t17): gprod(gw1,k2,t17) <= 100000
 gprod_max(gw1,k2,t18): gprod(gw1,k2,t18) <= 100000
 gprod_max(gw1,k2,t19): gprod(gw1,k2,t19) <= 100000
 gprod_max(gw1,k2,t20): gprod(gw1,k2,t20) <= 100000
 gprod_max(gw1,k2,t21): gprod(gw1,k2,t21) <= 100000
 gprod_max(gw1,k2,t22): gprod(gw1,k2,t22) <= 100000
 gprod_max(gw1,k2,t23): gprod(gw1,k2,t23) <= 100000
 gprod_max(gw1,k2,t24): gprod(gw1,k2,t24) <= 100000
 gflow_sr_io(('ng101','ng102'),k0,t1): gflow_sr(('ng101','ng102'),k0,t1)
   - 0.5 qin_sr(('ng101','ng102'),k0,t1)
   - 0.5 qout_sr(('ng101','ng102'),k0,t1) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t1): gflow_sr(('ng101','ng102'),k0,t1)
   <= 4000
 Flow_Bal(('ng101','ng102'),k0,t1): - qin_sr(('ng101','ng102'),k0,t1)
   + qout_sr(('ng101','ng102'),k0,t1) = 0
 gflow_sr_io(('ng101','ng102'),k1,t1): gflow_sr(('ng101','ng102'),k1,t1)
   - 0.5 qin_sr(('ng101','ng102'),k1,t1)
   - 0.5 qout_sr(('ng101','ng102'),k1,t1) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t1): gflow_sr(('ng101','ng102'),k1,t1)
   <= 4000
 Flow_Bal(('ng101','ng102'),k1,t1): - qin_sr(('ng101','ng102'),k1,t1)
   + qout_sr(('ng101','ng102'),k1,t1) = 0
 gflow_sr_io(('ng101','ng102'),k2,t1): gflow_sr(('ng101','ng102'),k2,t1)
   - 0.5 qin_sr(('ng101','ng102'),k2,t1)
   - 0.5 qout_sr(('ng101','ng102'),k2,t1) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t1): gflow_sr(('ng101','ng102'),k2,t1)
   <= 4000
 Flow_Bal(('ng101','ng102'),k2,t1): - qin_sr(('ng101','ng102'),k2,t1)
   + qout_sr(('ng101','ng102'),k2,t1) = 0
 gflow_sr_io(('ng101','ng102'),k0,t2): gflow_sr(('ng101','ng102'),k0,t2)
   - 0.5 qin_sr(('ng101','ng102'),k0,t2)
   - 0.5 qout_sr(('ng101','ng102'),k0,t2) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t2): gflow_sr(('ng101','ng102'),k0,t2)
   <= 4000
 Flow_Bal(('ng101','ng102'),k0,t2): - qin_sr(('ng101','ng102'),k0,t2)
   + qout_sr(('ng101','ng102'),k0,t2) = 0
 gflow_sr_io(('ng101','ng102'),k1,t2): gflow_sr(('ng101','ng102'),k1,t2)
   - 0.5 qin_sr(('ng101','ng102'),k1,t2)
   - 0.5 qout_sr(('ng101','ng102'),k1,t2) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t2): gflow_sr(('ng101','ng102'),k1,t2)
   <= 4000
 Flow_Bal(('ng101','ng102'),k1,t2): - qin_sr(('ng101','ng102'),k1,t2)
   + qout_sr(('ng101','ng102'),k1,t2) = 0
 gflow_sr_io(('ng101','ng102'),k2,t2): gflow_sr(('ng101','ng102'),k2,t2)
   - 0.5 qin_sr(('ng101','ng102'),k2,t2)
   - 0.5 qout_sr(('ng101','ng102'),k2,t2) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t2): gflow_sr(('ng101','ng102'),k2,t2)
   <= 4000
 Flow_Bal(('ng101','ng102'),k2,t2): - qin_sr(('ng101','ng102'),k2,t2)
   + qout_sr(('ng101','ng102'),k2,t2) = 0
 gflow_sr_io(('ng101','ng102'),k0,t3): gflow_sr(('ng101','ng102'),k0,t3)
   - 0.5 qin_sr(('ng101','ng102'),k0,t3)
   - 0.5 qout_sr(('ng101','ng102'),k0,t3) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t3): gflow_sr(('ng101','ng102'),k0,t3)
   <= 4000
 Flow_Bal(('ng101','ng102'),k0,t3): - qin_sr(('ng101','ng102'),k0,t3)
   + qout_sr(('ng101','ng102'),k0,t3) = 0
 gflow_sr_io(('ng101','ng102'),k1,t3): gflow_sr(('ng101','ng102'),k1,t3)
   - 0.5 qin_sr(('ng101','ng102'),k1,t3)
   - 0.5 qout_sr(('ng101','ng102'),k1,t3) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t3): gflow_sr(('ng101','ng102'),k1,t3)
   <= 4000
 Flow_Bal(('ng101','ng102'),k1,t3): - qin_sr(('ng101','ng102'),k1,t3)
   + qout_sr(('ng101','ng102'),k1,t3) = 0
 gflow_sr_io(('ng101','ng102'),k2,t3): gflow_sr(('ng101','ng102'),k2,t3)
   - 0.5 qin_sr(('ng101','ng102'),k2,t3)
   - 0.5 qout_sr(('ng101','ng102'),k2,t3) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t3): gflow_sr(('ng101','ng102'),k2,t3)
   <= 4000
 Flow_Bal(('ng101','ng102'),k2,t3): - qin_sr(('ng101','ng102'),k2,t3)
   + qout_sr(('ng101','ng102'),k2,t3) = 0
 gflow_sr_io(('ng101','ng102'),k0,t4): gflow_sr(('ng101','ng102'),k0,t4)
   - 0.5 qin_sr(('ng101','ng102'),k0,t4)
   - 0.5 qout_sr(('ng101','ng102'),k0,t4) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t4): gflow_sr(('ng101','ng102'),k0,t4)
   <= 4000
 Flow_Bal(('ng101','ng102'),k0,t4): - qin_sr(('ng101','ng102'),k0,t4)
   + qout_sr(('ng101','ng102'),k0,t4) = 0
 gflow_sr_io(('ng101','ng102'),k1,t4): gflow_sr(('ng101','ng102'),k1,t4)
   - 0.5 qin_sr(('ng101','ng102'),k1,t4)
   - 0.5 qout_sr(('ng101','ng102'),k1,t4) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t4): gflow_sr(('ng101','ng102'),k1,t4)
   <= 4000
 Flow_Bal(('ng101','ng102'),k1,t4): - qin_sr(('ng101','ng102'),k1,t4)
   + qout_sr(('ng101','ng102'),k1,t4) = 0
 gflow_sr_io(('ng101','ng102'),k2,t4): gflow_sr(('ng101','ng102'),k2,t4)
   - 0.5 qin_sr(('ng101','ng102'),k2,t4)
   - 0.5 qout_sr(('ng101','ng102'),k2,t4) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t4): gflow_sr(('ng101','ng102'),k2,t4)
   <= 4000
 Flow_Bal(('ng101','ng102'),k2,t4): - qin_sr(('ng101','ng102'),k2,t4)
   + qout_sr(('ng101','ng102'),k2,t4) = 0
 gflow_sr_io(('ng101','ng102'),k0,t5): gflow_sr(('ng101','ng102'),k0,t5)
   - 0.5 qin_sr(('ng101','ng102'),k0,t5)
   - 0.5 qout_sr(('ng101','ng102'),k0,t5) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t5): gflow_sr(('ng101','ng102'),k0,t5)
   <= 4000
 Flow_Bal(('ng101','ng102'),k0,t5): - qin_sr(('ng101','ng102'),k0,t5)
   + qout_sr(('ng101','ng102'),k0,t5) = 0
 gflow_sr_io(('ng101','ng102'),k1,t5): gflow_sr(('ng101','ng102'),k1,t5)
   - 0.5 qin_sr(('ng101','ng102'),k1,t5)
   - 0.5 qout_sr(('ng101','ng102'),k1,t5) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t5): gflow_sr(('ng101','ng102'),k1,t5)
   <= 4000
 Flow_Bal(('ng101','ng102'),k1,t5): - qin_sr(('ng101','ng102'),k1,t5)
   + qout_sr(('ng101','ng102'),k1,t5) = 0
 gflow_sr_io(('ng101','ng102'),k2,t5): gflow_sr(('ng101','ng102'),k2,t5)
   - 0.5 qin_sr(('ng101','ng102'),k2,t5)
   - 0.5 qout_sr(('ng101','ng102'),k2,t5) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t5): gflow_sr(('ng101','ng102'),k2,t5)
   <= 4000
 Flow_Bal(('ng101','ng102'),k2,t5): - qin_sr(('ng101','ng102'),k2,t5)
   + qout_sr(('ng101','ng102'),k2,t5) = 0
 gflow_sr_io(('ng101','ng102'),k0,t6): gflow_sr(('ng101','ng102'),k0,t6)
   - 0.5 qin_sr(('ng101','ng102'),k0,t6)
   - 0.5 qout_sr(('ng101','ng102'),k0,t6) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t6): gflow_sr(('ng101','ng102'),k0,t6)
   <= 4000
 Flow_Bal(('ng101','ng102'),k0,t6): - qin_sr(('ng101','ng102'),k0,t6)
   + qout_sr(('ng101','ng102'),k0,t6) = 0
 gflow_sr_io(('ng101','ng102'),k1,t6): gflow_sr(('ng101','ng102'),k1,t6)
   - 0.5 qin_sr(('ng101','ng102'),k1,t6)
   - 0.5 qout_sr(('ng101','ng102'),k1,t6) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t6): gflow_sr(('ng101','ng102'),k1,t6)
   <= 4000
 Flow_Bal(('ng101','ng102'),k1,t6): - qin_sr(('ng101','ng102'),k1,t6)
   + qout_sr(('ng101','ng102'),k1,t6) = 0
 gflow_sr_io(('ng101','ng102'),k2,t6): gflow_sr(('ng101','ng102'),k2,t6)
   - 0.5 qin_sr(('ng101','ng102'),k2,t6)
   - 0.5 qout_sr(('ng101','ng102'),k2,t6) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t6): gflow_sr(('ng101','ng102'),k2,t6)
   <= 4000
 Flow_Bal(('ng101','ng102'),k2,t6): - qin_sr(('ng101','ng102'),k2,t6)
   + qout_sr(('ng101','ng102'),k2,t6) = 0
 gflow_sr_io(('ng101','ng102'),k0,t7): gflow_sr(('ng101','ng102'),k0,t7)
   - 0.5 qin_sr(('ng101','ng102'),k0,t7)
   - 0.5 qout_sr(('ng101','ng102'),k0,t7) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t7): gflow_sr(('ng101','ng102'),k0,t7)
   <= 4000
 Flow_Bal(('ng101','ng102'),k0,t7): - qin_sr(('ng101','ng102'),k0,t7)
   + qout_sr(('ng101','ng102'),k0,t7) = 0
 gflow_sr_io(('ng101','ng102'),k1,t7): gflow_sr(('ng101','ng102'),k1,t7)
   - 0.5 qin_sr(('ng101','ng102'),k1,t7)
   - 0.5 qout_sr(('ng101','ng102'),k1,t7) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t7): gflow_sr(('ng101','ng102'),k1,t7)
   <= 4000
 Flow_Bal(('ng101','ng102'),k1,t7): - qin_sr(('ng101','ng102'),k1,t7)
   + qout_sr(('ng101','ng102'),k1,t7) = 0
 gflow_sr_io(('ng101','ng102'),k2,t7): gflow_sr(('ng101','ng102'),k2,t7)
   - 0.5 qin_sr(('ng101','ng102'),k2,t7)
   - 0.5 qout_sr(('ng101','ng102'),k2,t7) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t7): gflow_sr(('ng101','ng102'),k2,t7)
   <= 4000
 Flow_Bal(('ng101','ng102'),k2,t7): - qin_sr(('ng101','ng102'),k2,t7)
   + qout_sr(('ng101','ng102'),k2,t7) = 0
 gflow_sr_io(('ng101','ng102'),k0,t8): gflow_sr(('ng101','ng102'),k0,t8)
   - 0.5 qin_sr(('ng101','ng102'),k0,t8)
   - 0.5 qout_sr(('ng101','ng102'),k0,t8) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t8): gflow_sr(('ng101','ng102'),k0,t8)
   <= 4000
 Flow_Bal(('ng101','ng102'),k0,t8): - qin_sr(('ng101','ng102'),k0,t8)
   + qout_sr(('ng101','ng102'),k0,t8) = 0
 gflow_sr_io(('ng101','ng102'),k1,t8): gflow_sr(('ng101','ng102'),k1,t8)
   - 0.5 qin_sr(('ng101','ng102'),k1,t8)
   - 0.5 qout_sr(('ng101','ng102'),k1,t8) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t8): gflow_sr(('ng101','ng102'),k1,t8)
   <= 4000
 Flow_Bal(('ng101','ng102'),k1,t8): - qin_sr(('ng101','ng102'),k1,t8)
   + qout_sr(('ng101','ng102'),k1,t8) = 0
 gflow_sr_io(('ng101','ng102'),k2,t8): gflow_sr(('ng101','ng102'),k2,t8)
   - 0.5 qin_sr(('ng101','ng102'),k2,t8)
   - 0.5 qout_sr(('ng101','ng102'),k2,t8) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t8): gflow_sr(('ng101','ng102'),k2,t8)
   <= 4000
 Flow_Bal(('ng101','ng102'),k2,t8): - qin_sr(('ng101','ng102'),k2,t8)
   + qout_sr(('ng101','ng102'),k2,t8) = 0
 gflow_sr_io(('ng101','ng102'),k0,t9): gflow_sr(('ng101','ng102'),k0,t9)
   - 0.5 qin_sr(('ng101','ng102'),k0,t9)
   - 0.5 qout_sr(('ng101','ng102'),k0,t9) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t9): gflow_sr(('ng101','ng102'),k0,t9)
   <= 4000
 Flow_Bal(('ng101','ng102'),k0,t9): - qin_sr(('ng101','ng102'),k0,t9)
   + qout_sr(('ng101','ng102'),k0,t9) = 0
 gflow_sr_io(('ng101','ng102'),k1,t9): gflow_sr(('ng101','ng102'),k1,t9)
   - 0.5 qin_sr(('ng101','ng102'),k1,t9)
   - 0.5 qout_sr(('ng101','ng102'),k1,t9) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t9): gflow_sr(('ng101','ng102'),k1,t9)
   <= 4000
 Flow_Bal(('ng101','ng102'),k1,t9): - qin_sr(('ng101','ng102'),k1,t9)
   + qout_sr(('ng101','ng102'),k1,t9) = 0
 gflow_sr_io(('ng101','ng102'),k2,t9): gflow_sr(('ng101','ng102'),k2,t9)
   - 0.5 qin_sr(('ng101','ng102'),k2,t9)
   - 0.5 qout_sr(('ng101','ng102'),k2,t9) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t9): gflow_sr(('ng101','ng102'),k2,t9)
   <= 4000
 Flow_Bal(('ng101','ng102'),k2,t9): - qin_sr(('ng101','ng102'),k2,t9)
   + qout_sr(('ng101','ng102'),k2,t9) = 0
 gflow_sr_io(('ng101','ng102'),k0,t10): gflow_sr(('ng101','ng102'),k0,t10)
   - 0.5 qin_sr(('ng101','ng102'),k0,t10)
   - 0.5 qout_sr(('ng101','ng102'),k0,t10) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t10):
   gflow_sr(('ng101','ng102'),k0,t10) <= 4000
 Flow_Bal(('ng101','ng102'),k0,t10): - qin_sr(('ng101','ng102'),k0,t10)
   + qout_sr(('ng101','ng102'),k0,t10) = 0
 gflow_sr_io(('ng101','ng102'),k1,t10): gflow_sr(('ng101','ng102'),k1,t10)
   - 0.5 qin_sr(('ng101','ng102'),k1,t10)
   - 0.5 qout_sr(('ng101','ng102'),k1,t10) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t10):
   gflow_sr(('ng101','ng102'),k1,t10) <= 4000
 Flow_Bal(('ng101','ng102'),k1,t10): - qin_sr(('ng101','ng102'),k1,t10)
   + qout_sr(('ng101','ng102'),k1,t10) = 0
 gflow_sr_io(('ng101','ng102'),k2,t10): gflow_sr(('ng101','ng102'),k2,t10)
   - 0.5 qin_sr(('ng101','ng102'),k2,t10)
   - 0.5 qout_sr(('ng101','ng102'),k2,t10) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t10):
   gflow_sr(('ng101','ng102'),k2,t10) <= 4000
 Flow_Bal(('ng101','ng102'),k2,t10): - qin_sr(('ng101','ng102'),k2,t10)
   + qout_sr(('ng101','ng102'),k2,t10) = 0
 gflow_sr_io(('ng101','ng102'),k0,t11): gflow_sr(('ng101','ng102'),k0,t11)
   - 0.5 qin_sr(('ng101','ng102'),k0,t11)
   - 0.5 qout_sr(('ng101','ng102'),k0,t11) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t11):
   gflow_sr(('ng101','ng102'),k0,t11) <= 4000
 Flow_Bal(('ng101','ng102'),k0,t11): - qin_sr(('ng101','ng102'),k0,t11)
   + qout_sr(('ng101','ng102'),k0,t11) = 0
 gflow_sr_io(('ng101','ng102'),k1,t11): gflow_sr(('ng101','ng102'),k1,t11)
   - 0.5 qin_sr(('ng101','ng102'),k1,t11)
   - 0.5 qout_sr(('ng101','ng102'),k1,t11) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t11):
   gflow_sr(('ng101','ng102'),k1,t11) <= 4000
 Flow_Bal(('ng101','ng102'),k1,t11): - qin_sr(('ng101','ng102'),k1,t11)
   + qout_sr(('ng101','ng102'),k1,t11) = 0
 gflow_sr_io(('ng101','ng102'),k2,t11): gflow_sr(('ng101','ng102'),k2,t11)
   - 0.5 qin_sr(('ng101','ng102'),k2,t11)
   - 0.5 qout_sr(('ng101','ng102'),k2,t11) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t11):
   gflow_sr(('ng101','ng102'),k2,t11) <= 4000
 Flow_Bal(('ng101','ng102'),k2,t11): - qin_sr(('ng101','ng102'),k2,t11)
   + qout_sr(('ng101','ng102'),k2,t11) = 0
 gflow_sr_io(('ng101','ng102'),k0,t12): gflow_sr(('ng101','ng102'),k0,t12)
   - 0.5 qin_sr(('ng101','ng102'),k0,t12)
   - 0.5 qout_sr(('ng101','ng102'),k0,t12) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t12):
   gflow_sr(('ng101','ng102'),k0,t12) <= 4000
 Flow_Bal(('ng101','ng102'),k0,t12): - qin_sr(('ng101','ng102'),k0,t12)
   + qout_sr(('ng101','ng102'),k0,t12) = 0
 gflow_sr_io(('ng101','ng102'),k1,t12): gflow_sr(('ng101','ng102'),k1,t12)
   - 0.5 qin_sr(('ng101','ng102'),k1,t12)
   - 0.5 qout_sr(('ng101','ng102'),k1,t12) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t12):
   gflow_sr(('ng101','ng102'),k1,t12) <= 4000
 Flow_Bal(('ng101','ng102'),k1,t12): - qin_sr(('ng101','ng102'),k1,t12)
   + qout_sr(('ng101','ng102'),k1,t12) = 0
 gflow_sr_io(('ng101','ng102'),k2,t12): gflow_sr(('ng101','ng102'),k2,t12)
   - 0.5 qin_sr(('ng101','ng102'),k2,t12)
   - 0.5 qout_sr(('ng101','ng102'),k2,t12) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t12):
   gflow_sr(('ng101','ng102'),k2,t12) <= 4000
 Flow_Bal(('ng101','ng102'),k2,t12): - qin_sr(('ng101','ng102'),k2,t12)
   + qout_sr(('ng101','ng102'),k2,t12) = 0
 gflow_sr_io(('ng101','ng102'),k0,t13): gflow_sr(('ng101','ng102'),k0,t13)
   - 0.5 qin_sr(('ng101','ng102'),k0,t13)
   - 0.5 qout_sr(('ng101','ng102'),k0,t13) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t13):
   gflow_sr(('ng101','ng102'),k0,t13) <= 4000
 Flow_Bal(('ng101','ng102'),k0,t13): - qin_sr(('ng101','ng102'),k0,t13)
   + qout_sr(('ng101','ng102'),k0,t13) = 0
 gflow_sr_io(('ng101','ng102'),k1,t13): gflow_sr(('ng101','ng102'),k1,t13)
   - 0.5 qin_sr(('ng101','ng102'),k1,t13)
   - 0.5 qout_sr(('ng101','ng102'),k1,t13) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t13):
   gflow_sr(('ng101','ng102'),k1,t13) <= 4000
 Flow_Bal(('ng101','ng102'),k1,t13): - qin_sr(('ng101','ng102'),k1,t13)
   + qout_sr(('ng101','ng102'),k1,t13) = 0
 gflow_sr_io(('ng101','ng102'),k2,t13): gflow_sr(('ng101','ng102'),k2,t13)
   - 0.5 qin_sr(('ng101','ng102'),k2,t13)
   - 0.5 qout_sr(('ng101','ng102'),k2,t13) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t13):
   gflow_sr(('ng101','ng102'),k2,t13) <= 4000
 Flow_Bal(('ng101','ng102'),k2,t13): - qin_sr(('ng101','ng102'),k2,t13)
   + qout_sr(('ng101','ng102'),k2,t13) = 0
 gflow_sr_io(('ng101','ng102'),k0,t14): gflow_sr(('ng101','ng102'),k0,t14)
   - 0.5 qin_sr(('ng101','ng102'),k0,t14)
   - 0.5 qout_sr(('ng101','ng102'),k0,t14) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t14):
   gflow_sr(('ng101','ng102'),k0,t14) <= 4000
 Flow_Bal(('ng101','ng102'),k0,t14): - qin_sr(('ng101','ng102'),k0,t14)
   + qout_sr(('ng101','ng102'),k0,t14) = 0
 gflow_sr_io(('ng101','ng102'),k1,t14): gflow_sr(('ng101','ng102'),k1,t14)
   - 0.5 qin_sr(('ng101','ng102'),k1,t14)
   - 0.5 qout_sr(('ng101','ng102'),k1,t14) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t14):
   gflow_sr(('ng101','ng102'),k1,t14) <= 4000
 Flow_Bal(('ng101','ng102'),k1,t14): - qin_sr(('ng101','ng102'),k1,t14)
   + qout_sr(('ng101','ng102'),k1,t14) = 0
 gflow_sr_io(('ng101','ng102'),k2,t14): gflow_sr(('ng101','ng102'),k2,t14)
   - 0.5 qin_sr(('ng101','ng102'),k2,t14)
   - 0.5 qout_sr(('ng101','ng102'),k2,t14) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t14):
   gflow_sr(('ng101','ng102'),k2,t14) <= 4000
 Flow_Bal(('ng101','ng102'),k2,t14): - qin_sr(('ng101','ng102'),k2,t14)
   + qout_sr(('ng101','ng102'),k2,t14) = 0
 gflow_sr_io(('ng101','ng102'),k0,t15): gflow_sr(('ng101','ng102'),k0,t15)
   - 0.5 qin_sr(('ng101','ng102'),k0,t15)
   - 0.5 qout_sr(('ng101','ng102'),k0,t15) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t15):
   gflow_sr(('ng101','ng102'),k0,t15) <= 4000
 Flow_Bal(('ng101','ng102'),k0,t15): - qin_sr(('ng101','ng102'),k0,t15)
   + qout_sr(('ng101','ng102'),k0,t15) = 0
 gflow_sr_io(('ng101','ng102'),k1,t15): gflow_sr(('ng101','ng102'),k1,t15)
   - 0.5 qin_sr(('ng101','ng102'),k1,t15)
   - 0.5 qout_sr(('ng101','ng102'),k1,t15) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t15):
   gflow_sr(('ng101','ng102'),k1,t15) <= 4000
 Flow_Bal(('ng101','ng102'),k1,t15): - qin_sr(('ng101','ng102'),k1,t15)
   + qout_sr(('ng101','ng102'),k1,t15) = 0
 gflow_sr_io(('ng101','ng102'),k2,t15): gflow_sr(('ng101','ng102'),k2,t15)
   - 0.5 qin_sr(('ng101','ng102'),k2,t15)
   - 0.5 qout_sr(('ng101','ng102'),k2,t15) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t15):
   gflow_sr(('ng101','ng102'),k2,t15) <= 4000
 Flow_Bal(('ng101','ng102'),k2,t15): - qin_sr(('ng101','ng102'),k2,t15)
   + qout_sr(('ng101','ng102'),k2,t15) = 0
 gflow_sr_io(('ng101','ng102'),k0,t16): gflow_sr(('ng101','ng102'),k0,t16)
   - 0.5 qin_sr(('ng101','ng102'),k0,t16)
   - 0.5 qout_sr(('ng101','ng102'),k0,t16) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t16):
   gflow_sr(('ng101','ng102'),k0,t16) <= 4000
 Flow_Bal(('ng101','ng102'),k0,t16): - qin_sr(('ng101','ng102'),k0,t16)
   + qout_sr(('ng101','ng102'),k0,t16) = 0
 gflow_sr_io(('ng101','ng102'),k1,t16): gflow_sr(('ng101','ng102'),k1,t16)
   - 0.5 qin_sr(('ng101','ng102'),k1,t16)
   - 0.5 qout_sr(('ng101','ng102'),k1,t16) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t16):
   gflow_sr(('ng101','ng102'),k1,t16) <= 4000
 Flow_Bal(('ng101','ng102'),k1,t16): - qin_sr(('ng101','ng102'),k1,t16)
   + qout_sr(('ng101','ng102'),k1,t16) = 0
 gflow_sr_io(('ng101','ng102'),k2,t16): gflow_sr(('ng101','ng102'),k2,t16)
   - 0.5 qin_sr(('ng101','ng102'),k2,t16)
   - 0.5 qout_sr(('ng101','ng102'),k2,t16) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t16):
   gflow_sr(('ng101','ng102'),k2,t16) <= 4000
 Flow_Bal(('ng101','ng102'),k2,t16): - qin_sr(('ng101','ng102'),k2,t16)
   + qout_sr(('ng101','ng102'),k2,t16) = 0
 gflow_sr_io(('ng101','ng102'),k0,t17): gflow_sr(('ng101','ng102'),k0,t17)
   - 0.5 qin_sr(('ng101','ng102'),k0,t17)
   - 0.5 qout_sr(('ng101','ng102'),k0,t17) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t17):
   gflow_sr(('ng101','ng102'),k0,t17) <= 4000
 Flow_Bal(('ng101','ng102'),k0,t17): - qin_sr(('ng101','ng102'),k0,t17)
   + qout_sr(('ng101','ng102'),k0,t17) = 0
 gflow_sr_io(('ng101','ng102'),k1,t17): gflow_sr(('ng101','ng102'),k1,t17)
   - 0.5 qin_sr(('ng101','ng102'),k1,t17)
   - 0.5 qout_sr(('ng101','ng102'),k1,t17) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t17):
   gflow_sr(('ng101','ng102'),k1,t17) <= 4000
 Flow_Bal(('ng101','ng102'),k1,t17): - qin_sr(('ng101','ng102'),k1,t17)
   + qout_sr(('ng101','ng102'),k1,t17) = 0
 gflow_sr_io(('ng101','ng102'),k2,t17): gflow_sr(('ng101','ng102'),k2,t17)
   - 0.5 qin_sr(('ng101','ng102'),k2,t17)
   - 0.5 qout_sr(('ng101','ng102'),k2,t17) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t17):
   gflow_sr(('ng101','ng102'),k2,t17) <= 4000
 Flow_Bal(('ng101','ng102'),k2,t17): - qin_sr(('ng101','ng102'),k2,t17)
   + qout_sr(('ng101','ng102'),k2,t17) = 0
 gflow_sr_io(('ng101','ng102'),k0,t18): gflow_sr(('ng101','ng102'),k0,t18)
   - 0.5 qin_sr(('ng101','ng102'),k0,t18)
   - 0.5 qout_sr(('ng101','ng102'),k0,t18) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t18):
   gflow_sr(('ng101','ng102'),k0,t18) <= 4000
 Flow_Bal(('ng101','ng102'),k0,t18): - qin_sr(('ng101','ng102'),k0,t18)
   + qout_sr(('ng101','ng102'),k0,t18) = 0
 gflow_sr_io(('ng101','ng102'),k1,t18): gflow_sr(('ng101','ng102'),k1,t18)
   - 0.5 qin_sr(('ng101','ng102'),k1,t18)
   - 0.5 qout_sr(('ng101','ng102'),k1,t18) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t18):
   gflow_sr(('ng101','ng102'),k1,t18) <= 4000
 Flow_Bal(('ng101','ng102'),k1,t18): - qin_sr(('ng101','ng102'),k1,t18)
   + qout_sr(('ng101','ng102'),k1,t18) = 0
 gflow_sr_io(('ng101','ng102'),k2,t18): gflow_sr(('ng101','ng102'),k2,t18)
   - 0.5 qin_sr(('ng101','ng102'),k2,t18)
   - 0.5 qout_sr(('ng101','ng102'),k2,t18) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t18):
   gflow_sr(('ng101','ng102'),k2,t18) <= 4000
 Flow_Bal(('ng101','ng102'),k2,t18): - qin_sr(('ng101','ng102'),k2,t18)
   + qout_sr(('ng101','ng102'),k2,t18) = 0
 gflow_sr_io(('ng101','ng102'),k0,t19): gflow_sr(('ng101','ng102'),k0,t19)
   - 0.5 qin_sr(('ng101','ng102'),k0,t19)
   - 0.5 qout_sr(('ng101','ng102'),k0,t19) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t19):
   gflow_sr(('ng101','ng102'),k0,t19) <= 4000
 Flow_Bal(('ng101','ng102'),k0,t19): - qin_sr(('ng101','ng102'),k0,t19)
   + qout_sr(('ng101','ng102'),k0,t19) = 0
 gflow_sr_io(('ng101','ng102'),k1,t19): gflow_sr(('ng101','ng102'),k1,t19)
   - 0.5 qin_sr(('ng101','ng102'),k1,t19)
   - 0.5 qout_sr(('ng101','ng102'),k1,t19) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t19):
   gflow_sr(('ng101','ng102'),k1,t19) <= 4000
 Flow_Bal(('ng101','ng102'),k1,t19): - qin_sr(('ng101','ng102'),k1,t19)
   + qout_sr(('ng101','ng102'),k1,t19) = 0
 gflow_sr_io(('ng101','ng102'),k2,t19): gflow_sr(('ng101','ng102'),k2,t19)
   - 0.5 qin_sr(('ng101','ng102'),k2,t19)
   - 0.5 qout_sr(('ng101','ng102'),k2,t19) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t19):
   gflow_sr(('ng101','ng102'),k2,t19) <= 4000
 Flow_Bal(('ng101','ng102'),k2,t19): - qin_sr(('ng101','ng102'),k2,t19)
   + qout_sr(('ng101','ng102'),k2,t19) = 0
 gflow_sr_io(('ng101','ng102'),k0,t20): gflow_sr(('ng101','ng102'),k0,t20)
   - 0.5 qin_sr(('ng101','ng102'),k0,t20)
   - 0.5 qout_sr(('ng101','ng102'),k0,t20) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t20):
   gflow_sr(('ng101','ng102'),k0,t20) <= 4000
 Flow_Bal(('ng101','ng102'),k0,t20): - qin_sr(('ng101','ng102'),k0,t20)
   + qout_sr(('ng101','ng102'),k0,t20) = 0
 gflow_sr_io(('ng101','ng102'),k1,t20): gflow_sr(('ng101','ng102'),k1,t20)
   - 0.5 qin_sr(('ng101','ng102'),k1,t20)
   - 0.5 qout_sr(('ng101','ng102'),k1,t20) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t20):
   gflow_sr(('ng101','ng102'),k1,t20) <= 4000
 Flow_Bal(('ng101','ng102'),k1,t20): - qin_sr(('ng101','ng102'),k1,t20)
   + qout_sr(('ng101','ng102'),k1,t20) = 0
 gflow_sr_io(('ng101','ng102'),k2,t20): gflow_sr(('ng101','ng102'),k2,t20)
   - 0.5 qin_sr(('ng101','ng102'),k2,t20)
   - 0.5 qout_sr(('ng101','ng102'),k2,t20) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t20):
   gflow_sr(('ng101','ng102'),k2,t20) <= 4000
 Flow_Bal(('ng101','ng102'),k2,t20): - qin_sr(('ng101','ng102'),k2,t20)
   + qout_sr(('ng101','ng102'),k2,t20) = 0
 gflow_sr_io(('ng101','ng102'),k0,t21): gflow_sr(('ng101','ng102'),k0,t21)
   - 0.5 qin_sr(('ng101','ng102'),k0,t21)
   - 0.5 qout_sr(('ng101','ng102'),k0,t21) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t21):
   gflow_sr(('ng101','ng102'),k0,t21) <= 4000
 Flow_Bal(('ng101','ng102'),k0,t21): - qin_sr(('ng101','ng102'),k0,t21)
   + qout_sr(('ng101','ng102'),k0,t21) = 0
 gflow_sr_io(('ng101','ng102'),k1,t21): gflow_sr(('ng101','ng102'),k1,t21)
   - 0.5 qin_sr(('ng101','ng102'),k1,t21)
   - 0.5 qout_sr(('ng101','ng102'),k1,t21) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t21):
   gflow_sr(('ng101','ng102'),k1,t21) <= 4000
 Flow_Bal(('ng101','ng102'),k1,t21): - qin_sr(('ng101','ng102'),k1,t21)
   + qout_sr(('ng101','ng102'),k1,t21) = 0
 gflow_sr_io(('ng101','ng102'),k2,t21): gflow_sr(('ng101','ng102'),k2,t21)
   - 0.5 qin_sr(('ng101','ng102'),k2,t21)
   - 0.5 qout_sr(('ng101','ng102'),k2,t21) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t21):
   gflow_sr(('ng101','ng102'),k2,t21) <= 4000
 Flow_Bal(('ng101','ng102'),k2,t21): - qin_sr(('ng101','ng102'),k2,t21)
   + qout_sr(('ng101','ng102'),k2,t21) = 0
 gflow_sr_io(('ng101','ng102'),k0,t22): gflow_sr(('ng101','ng102'),k0,t22)
   - 0.5 qin_sr(('ng101','ng102'),k0,t22)
   - 0.5 qout_sr(('ng101','ng102'),k0,t22) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t22):
   gflow_sr(('ng101','ng102'),k0,t22) <= 4000
 Flow_Bal(('ng101','ng102'),k0,t22): - qin_sr(('ng101','ng102'),k0,t22)
   + qout_sr(('ng101','ng102'),k0,t22) = 0
 gflow_sr_io(('ng101','ng102'),k1,t22): gflow_sr(('ng101','ng102'),k1,t22)
   - 0.5 qin_sr(('ng101','ng102'),k1,t22)
   - 0.5 qout_sr(('ng101','ng102'),k1,t22) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t22):
   gflow_sr(('ng101','ng102'),k1,t22) <= 4000
 Flow_Bal(('ng101','ng102'),k1,t22): - qin_sr(('ng101','ng102'),k1,t22)
   + qout_sr(('ng101','ng102'),k1,t22) = 0
 gflow_sr_io(('ng101','ng102'),k2,t22): gflow_sr(('ng101','ng102'),k2,t22)
   - 0.5 qin_sr(('ng101','ng102'),k2,t22)
   - 0.5 qout_sr(('ng101','ng102'),k2,t22) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t22):
   gflow_sr(('ng101','ng102'),k2,t22) <= 4000
 Flow_Bal(('ng101','ng102'),k2,t22): - qin_sr(('ng101','ng102'),k2,t22)
   + qout_sr(('ng101','ng102'),k2,t22) = 0
 gflow_sr_io(('ng101','ng102'),k0,t23): gflow_sr(('ng101','ng102'),k0,t23)
   - 0.5 qin_sr(('ng101','ng102'),k0,t23)
   - 0.5 qout_sr(('ng101','ng102'),k0,t23) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t23):
   gflow_sr(('ng101','ng102'),k0,t23) <= 4000
 Flow_Bal(('ng101','ng102'),k0,t23): - qin_sr(('ng101','ng102'),k0,t23)
   + qout_sr(('ng101','ng102'),k0,t23) = 0
 gflow_sr_io(('ng101','ng102'),k1,t23): gflow_sr(('ng101','ng102'),k1,t23)
   - 0.5 qin_sr(('ng101','ng102'),k1,t23)
   - 0.5 qout_sr(('ng101','ng102'),k1,t23) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t23):
   gflow_sr(('ng101','ng102'),k1,t23) <= 4000
 Flow_Bal(('ng101','ng102'),k1,t23): - qin_sr(('ng101','ng102'),k1,t23)
   + qout_sr(('ng101','ng102'),k1,t23) = 0
 gflow_sr_io(('ng101','ng102'),k2,t23): gflow_sr(('ng101','ng102'),k2,t23)
   - 0.5 qin_sr(('ng101','ng102'),k2,t23)
   - 0.5 qout_sr(('ng101','ng102'),k2,t23) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t23):
   gflow_sr(('ng101','ng102'),k2,t23) <= 4000
 Flow_Bal(('ng101','ng102'),k2,t23): - qin_sr(('ng101','ng102'),k2,t23)
   + qout_sr(('ng101','ng102'),k2,t23) = 0
 gflow_sr_io(('ng101','ng102'),k0,t24): gflow_sr(('ng101','ng102'),k0,t24)
   - 0.5 qin_sr(('ng101','ng102'),k0,t24)
   - 0.5 qout_sr(('ng101','ng102'),k0,t24) = 0
 gflow_sr_limit(('ng101','ng102'),k0,t24):
   gflow_sr(('ng101','ng102'),k0,t24) <= 4000
 Flow_Bal(('ng101','ng102'),k0,t24): - qin_sr(('ng101','ng102'),k0,t24)
   + qout_sr(('ng101','ng102'),k0,t24) = 0
 gflow_sr_io(('ng101','ng102'),k1,t24): gflow_sr(('ng101','ng102'),k1,t24)
   - 0.5 qin_sr(('ng101','ng102'),k1,t24)
   - 0.5 qout_sr(('ng101','ng102'),k1,t24) = 0
 gflow_sr_limit(('ng101','ng102'),k1,t24):
   gflow_sr(('ng101','ng102'),k1,t24) <= 4000
 Flow_Bal(('ng101','ng102'),k1,t24): - qin_sr(('ng101','ng102'),k1,t24)
   + qout_sr(('ng101','ng102'),k1,t24) = 0
 gflow_sr_io(('ng101','ng102'),k2,t24): gflow_sr(('ng101','ng102'),k2,t24)
   - 0.5 qin_sr(('ng101','ng102'),k2,t24)
   - 0.5 qout_sr(('ng101','ng102'),k2,t24) = 0
 gflow_sr_limit(('ng101','ng102'),k2,t24):
   gflow_sr(('ng101','ng102'),k2,t24) <= 4000
 Flow_Bal(('ng101','ng102'),k2,t24): - qin_sr(('ng101','ng102'),k2,t24)
   + qout_sr(('ng101','ng102'),k2,t24) = 0
 gsinMax(gs1,t1,k0): gsin(gs1,t1,k0) <= 0
 gsoutMax(gs1,t1,k0): gsout(gs1,t1,k0) <= 0
 gstore_max(gs1,t1,k0): gstore(gs1,t1,k0) <= 0
 gstore_min(gs1,t1,k0): gstore(gs1,t1,k0) >= 0
 gsinMax(gs1,t2,k0): gsin(gs1,t2,k0) <= 0
 gsoutMax(gs1,t2,k0): gsout(gs1,t2,k0) <= 0
 gstore_max(gs1,t2,k0): gstore(gs1,t2,k0) <= 0
 gstore_min(gs1,t2,k0): gstore(gs1,t2,k0) >= 0
 gsinMax(gs1,t3,k0): gsin(gs1,t3,k0) <= 0
 gsoutMax(gs1,t3,k0): gsout(gs1,t3,k0) <= 0
 gstore_max(gs1,t3,k0): gstore(gs1,t3,k0) <= 0
 gstore_min(gs1,t3,k0): gstore(gs1,t3,k0) >= 0
 gsinMax(gs1,t4,k0): gsin(gs1,t4,k0) <= 0
 gsoutMax(gs1,t4,k0): gsout(gs1,t4,k0) <= 0
 gstore_max(gs1,t4,k0): gstore(gs1,t4,k0) <= 0
 gstore_min(gs1,t4,k0): gstore(gs1,t4,k0) >= 0
 gsinMax(gs1,t5,k0): gsin(gs1,t5,k0) <= 0
 gsoutMax(gs1,t5,k0): gsout(gs1,t5,k0) <= 0
 gstore_max(gs1,t5,k0): gstore(gs1,t5,k0) <= 0
 gstore_min(gs1,t5,k0): gstore(gs1,t5,k0) >= 0
 gsinMax(gs1,t6,k0): gsin(gs1,t6,k0) <= 0
 gsoutMax(gs1,t6,k0): gsout(gs1,t6,k0) <= 0
 gstore_max(gs1,t6,k0): gstore(gs1,t6,k0) <= 0
 gstore_min(gs1,t6,k0): gstore(gs1,t6,k0) >= 0
 gsinMax(gs1,t7,k0): gsin(gs1,t7,k0) <= 0
 gsoutMax(gs1,t7,k0): gsout(gs1,t7,k0) <= 0
 gstore_max(gs1,t7,k0): gstore(gs1,t7,k0) <= 0
 gstore_min(gs1,t7,k0): gstore(gs1,t7,k0) >= 0
 gsinMax(gs1,t8,k0): gsin(gs1,t8,k0) <= 0
 gsoutMax(gs1,t8,k0): gsout(gs1,t8,k0) <= 0
 gstore_max(gs1,t8,k0): gstore(gs1,t8,k0) <= 0
 gstore_min(gs1,t8,k0): gstore(gs1,t8,k0) >= 0
 gsinMax(gs1,t9,k0): gsin(gs1,t9,k0) <= 0
 gsoutMax(gs1,t9,k0): gsout(gs1,t9,k0) <= 0
 gstore_max(gs1,t9,k0): gstore(gs1,t9,k0) <= 0
 gstore_min(gs1,t9,k0): gstore(gs1,t9,k0) >= 0
 gsinMax(gs1,t10,k0): gsin(gs1,t10,k0) <= 0
 gsoutMax(gs1,t10,k0): gsout(gs1,t10,k0) <= 0
 gstore_max(gs1,t10,k0): gstore(gs1,t10,k0) <= 0
 gstore_min(gs1,t10,k0): gstore(gs1,t10,k0) >= 0
 gsinMax(gs1,t11,k0): gsin(gs1,t11,k0) <= 0
 gsoutMax(gs1,t11,k0): gsout(gs1,t11,k0) <= 0
 gstore_max(gs1,t11,k0): gstore(gs1,t11,k0) <= 0
 gstore_min(gs1,t11,k0): gstore(gs1,t11,k0) >= 0
 gsinMax(gs1,t12,k0): gsin(gs1,t12,k0) <= 0
 gsoutMax(gs1,t12,k0): gsout(gs1,t12,k0) <= 0
 gstore_max(gs1,t12,k0): gstore(gs1,t12,k0) <= 0
 gstore_min(gs1,t12,k0): gstore(gs1,t12,k0) >= 0
 gsinMax(gs1,t13,k0): gsin(gs1,t13,k0) <= 0
 gsoutMax(gs1,t13,k0): gsout(gs1,t13,k0) <= 0
 gstore_max(gs1,t13,k0): gstore(gs1,t13,k0) <= 0
 gstore_min(gs1,t13,k0): gstore(gs1,t13,k0) >= 0
 gsinMax(gs1,t14,k0): gsin(gs1,t14,k0) <= 0
 gsoutMax(gs1,t14,k0): gsout(gs1,t14,k0) <= 0
 gstore_max(gs1,t14,k0): gstore(gs1,t14,k0) <= 0
 gstore_min(gs1,t14,k0): gstore(gs1,t14,k0) >= 0
 gsinMax(gs1,t15,k0): gsin(gs1,t15,k0) <= 0
 gsoutMax(gs1,t15,k0): gsout(gs1,t15,k0) <= 0
 gstore_max(gs1,t15,k0): gstore(gs1,t15,k0) <= 0
 gstore_min(gs1,t15,k0): gstore(gs1,t15,k0) >= 0
 gsinMax(gs1,t16,k0): gsin(gs1,t16,k0) <= 0
 gsoutMax(gs1,t16,k0): gsout(gs1,t16,k0) <= 0
 gstore_max(gs1,t16,k0): gstore(gs1,t16,k0) <= 0
 gstore_min(gs1,t16,k0): gstore(gs1,t16,k0) >= 0
 gsinMax(gs1,t17,k0): gsin(gs1,t17,k0) <= 0
 gsoutMax(gs1,t17,k0): gsout(gs1,t17,k0) <= 0
 gstore_max(gs1,t17,k0): gstore(gs1,t17,k0) <= 0
 gstore_min(gs1,t17,k0): gstore(gs1,t17,k0) >= 0
 gsinMax(gs1,t18,k0): gsin(gs1,t18,k0) <= 0
 gsoutMax(gs1,t18,k0): gsout(gs1,t18,k0) <= 0
 gstore_max(gs1,t18,k0): gstore(gs1,t18,k0) <= 0
 gstore_min(gs1,t18,k0): gstore(gs1,t18,k0) >= 0
 gsinMax(gs1,t19,k0): gsin(gs1,t19,k0) <= 0
 gsoutMax(gs1,t19,k0): gsout(gs1,t19,k0) <= 0
 gstore_max(gs1,t19,k0): gstore(gs1,t19,k0) <= 0
 gstore_min(gs1,t19,k0): gstore(gs1,t19,k0) >= 0
 gsinMax(gs1,t20,k0): gsin(gs1,t20,k0) <= 0
 gsoutMax(gs1,t20,k0): gsout(gs1,t20,k0) <= 0
 gstore_max(gs1,t20,k0): gstore(gs1,t20,k0) <= 0
 gstore_min(gs1,t20,k0): gstore(gs1,t20,k0) >= 0
 gsinMax(gs1,t21,k0): gsin(gs1,t21,k0) <= 0
 gsoutMax(gs1,t21,k0): gsout(gs1,t21,k0) <= 0
 gstore_max(gs1,t21,k0): gstore(gs1,t21,k0) <= 0
 gstore_min(gs1,t21,k0): gstore(gs1,t21,k0) >= 0
 gsinMax(gs1,t22,k0): gsin(gs1,t22,k0) <= 0
 gsoutMax(gs1,t22,k0): gsout(gs1,t22,k0) <= 0
 gstore_max(gs1,t22,k0): gstore(gs1,t22,k0) <= 0
 gstore_min(gs1,t22,k0): gstore(gs1,t22,k0) >= 0
 gsinMax(gs1,t23,k0): gsin(gs1,t23,k0) <= 0
 gsoutMax(gs1,t23,k0): gsout(gs1,t23,k0) <= 0
 gstore_max(gs1,t23,k0): gstore(gs1,t23,k0) <= 0
 gstore_min(gs1,t23,k0): gstore(gs1,t23,k0) >= 0
 gsinMax(gs1,t24,k0): gsin(gs1,t24,k0) <= 0
 gsoutMax(gs1,t24,k0): gsout(gs1,t24,k0) <= 0
 gstore_max(gs1,t24,k0): gstore(gs1,t24,k0) <= 0
 gstore_min(gs1,t24,k0): gstore(gs1,t24,k0) >= 0
 gstor_def(gs1,k0,t2): - gstore(gs1,t1,k0) - gsin(gs1,t2,k0)
   + gsout(gs1,t2,k0) + gstore(gs1,t2,k0) = 0
 gstor_def(gs1,k0,t3): - gstore(gs1,t2,k0) - gsin(gs1,t3,k0)
   + gsout(gs1,t3,k0) + gstore(gs1,t3,k0) = 0
 gstor_def(gs1,k0,t4): - gstore(gs1,t3,k0) - gsin(gs1,t4,k0)
   + gsout(gs1,t4,k0) + gstore(gs1,t4,k0) = 0
 gstor_def(gs1,k0,t5): - gstore(gs1,t4,k0) - gsin(gs1,t5,k0)
   + gsout(gs1,t5,k0) + gstore(gs1,t5,k0) = 0
 gstor_def(gs1,k0,t6): - gstore(gs1,t5,k0) - gsin(gs1,t6,k0)
   + gsout(gs1,t6,k0) + gstore(gs1,t6,k0) = 0
 gstor_def(gs1,k0,t7): - gstore(gs1,t6,k0) - gsin(gs1,t7,k0)
   + gsout(gs1,t7,k0) + gstore(gs1,t7,k0) = 0
 gstor_def(gs1,k0,t8): - gstore(gs1,t7,k0) - gsin(gs1,t8,k0)
   + gsout(gs1,t8,k0) + gstore(gs1,t8,k0) = 0
 gstor_def(gs1,k0,t9): - gstore(gs1,t8,k0) - gsin(gs1,t9,k0)
   + gsout(gs1,t9,k0) + gstore(gs1,t9,k0) = 0
 gstor_def(gs1,k0,t10): - gstore(gs1,t9,k0) - gsin(gs1,t10,k0)
   + gsout(gs1,t10,k0) + gstore(gs1,t10,k0) = 0
 gstor_def(gs1,k0,t11): - gstore(gs1,t10,k0) - gsin(gs1,t11,k0)
   + gsout(gs1,t11,k0) + gstore(gs1,t11,k0) = 0
 gstor_def(gs1,k0,t12): - gstore(gs1,t11,k0) - gsin(gs1,t12,k0)
   + gsout(gs1,t12,k0) + gstore(gs1,t12,k0) = 0
 gstor_def(gs1,k0,t13): - gstore(gs1,t12,k0) - gsin(gs1,t13,k0)
   + gsout(gs1,t13,k0) + gstore(gs1,t13,k0) = 0
 gstor_def(gs1,k0,t14): - gstore(gs1,t13,k0) - gsin(gs1,t14,k0)
   + gsout(gs1,t14,k0) + gstore(gs1,t14,k0) = 0
 gstor_def(gs1,k0,t15): - gstore(gs1,t14,k0) - gsin(gs1,t15,k0)
   + gsout(gs1,t15,k0) + gstore(gs1,t15,k0) = 0
 gstor_def(gs1,k0,t16): - gstore(gs1,t15,k0) - gsin(gs1,t16,k0)
   + gsout(gs1,t16,k0) + gstore(gs1,t16,k0) = 0
 gstor_def(gs1,k0,t17): - gstore(gs1,t16,k0) - gsin(gs1,t17,k0)
   + gsout(gs1,t17,k0) + gstore(gs1,t17,k0) = 0
 gstor_def(gs1,k0,t18): - gstore(gs1,t17,k0) - gsin(gs1,t18,k0)
   + gsout(gs1,t18,k0) + gstore(gs1,t18,k0) = 0
 gstor_def(gs1,k0,t19): - gstore(gs1,t18,k0) - gsin(gs1,t19,k0)
   + gsout(gs1,t19,k0) + gstore(gs1,t19,k0) = 0
 gstor_def(gs1,k0,t20): - gstore(gs1,t19,k0) - gsin(gs1,t20,k0)
   + gsout(gs1,t20,k0) + gstore(gs1,t20,k0) = 0
 gstor_def(gs1,k0,t21): - gstore(gs1,t20,k0) - gsin(gs1,t21,k0)
   + gsout(gs1,t21,k0) + gstore(gs1,t21,k0) = 0
 gstor_def(gs1,k0,t22): - gstore(gs1,t21,k0) - gsin(gs1,t22,k0)
   + gsout(gs1,t22,k0) + gstore(gs1,t22,k0) = 0
 gstor_def(gs1,k0,t23): - gstore(gs1,t22,k0) - gsin(gs1,t23,k0)
   + gsout(gs1,t23,k0) + gstore(gs1,t23,k0) = 0
 gstor_def(gs1,k0,t24): - gstore(gs1,t23,k0) - gsin(gs1,t24,k0)
   + gsout(gs1,t24,k0) + gstore(gs1,t24,k0) = 0
 gstor_def(gs1,k0,t1): - gsin(gs1,t1,k0) + gsout(gs1,t1,k0)
   + gstore(gs1,t1,k0) = 0
 gsinMax(gs1,t1,k1): gsin(gs1,t1,k1) <= 0
 gsoutMax(gs1,t1,k1): gsout(gs1,t1,k1) <= 0
 gstore_max(gs1,t1,k1): gstore(gs1,t1,k1) <= 0
 gstore_min(gs1,t1,k1): gstore(gs1,t1,k1) >= 0
 gsinMax(gs1,t2,k1): gsin(gs1,t2,k1) <= 0
 gsoutMax(gs1,t2,k1): gsout(gs1,t2,k1) <= 0
 gstore_max(gs1,t2,k1): gstore(gs1,t2,k1) <= 0
 gstore_min(gs1,t2,k1): gstore(gs1,t2,k1) >= 0
 gsinMax(gs1,t3,k1): gsin(gs1,t3,k1) <= 0
 gsoutMax(gs1,t3,k1): gsout(gs1,t3,k1) <= 0
 gstore_max(gs1,t3,k1): gstore(gs1,t3,k1) <= 0
 gstore_min(gs1,t3,k1): gstore(gs1,t3,k1) >= 0
 gsinMax(gs1,t4,k1): gsin(gs1,t4,k1) <= 0
 gsoutMax(gs1,t4,k1): gsout(gs1,t4,k1) <= 0
 gstore_max(gs1,t4,k1): gstore(gs1,t4,k1) <= 0
 gstore_min(gs1,t4,k1): gstore(gs1,t4,k1) >= 0
 gsinMax(gs1,t5,k1): gsin(gs1,t5,k1) <= 0
 gsoutMax(gs1,t5,k1): gsout(gs1,t5,k1) <= 0
 gstore_max(gs1,t5,k1): gstore(gs1,t5,k1) <= 0
 gstore_min(gs1,t5,k1): gstore(gs1,t5,k1) >= 0
 gsinMax(gs1,t6,k1): gsin(gs1,t6,k1) <= 0
 gsoutMax(gs1,t6,k1): gsout(gs1,t6,k1) <= 0
 gstore_max(gs1,t6,k1): gstore(gs1,t6,k1) <= 0
 gstore_min(gs1,t6,k1): gstore(gs1,t6,k1) >= 0
 gsinMax(gs1,t7,k1): gsin(gs1,t7,k1) <= 0
 gsoutMax(gs1,t7,k1): gsout(gs1,t7,k1) <= 0
 gstore_max(gs1,t7,k1): gstore(gs1,t7,k1) <= 0
 gstore_min(gs1,t7,k1): gstore(gs1,t7,k1) >= 0
 gsinMax(gs1,t8,k1): gsin(gs1,t8,k1) <= 0
 gsoutMax(gs1,t8,k1): gsout(gs1,t8,k1) <= 0
 gstore_max(gs1,t8,k1): gstore(gs1,t8,k1) <= 0
 gstore_min(gs1,t8,k1): gstore(gs1,t8,k1) >= 0
 gsinMax(gs1,t9,k1): gsin(gs1,t9,k1) <= 0
 gsoutMax(gs1,t9,k1): gsout(gs1,t9,k1) <= 0
 gstore_max(gs1,t9,k1): gstore(gs1,t9,k1) <= 0
 gstore_min(gs1,t9,k1): gstore(gs1,t9,k1) >= 0
 gsinMax(gs1,t10,k1): gsin(gs1,t10,k1) <= 0
 gsoutMax(gs1,t10,k1): gsout(gs1,t10,k1) <= 0
 gstore_max(gs1,t10,k1): gstore(gs1,t10,k1) <= 0
 gstore_min(gs1,t10,k1): gstore(gs1,t10,k1) >= 0
 gsinMax(gs1,t11,k1): gsin(gs1,t11,k1) <= 0
 gsoutMax(gs1,t11,k1): gsout(gs1,t11,k1) <= 0
 gstore_max(gs1,t11,k1): gstore(gs1,t11,k1) <= 0
 gstore_min(gs1,t11,k1): gstore(gs1,t11,k1) >= 0
 gsinMax(gs1,t12,k1): gsin(gs1,t12,k1) <= 0
 gsoutMax(gs1,t12,k1): gsout(gs1,t12,k1) <= 0
 gstore_max(gs1,t12,k1): gstore(gs1,t12,k1) <= 0
 gstore_min(gs1,t12,k1): gstore(gs1,t12,k1) >= 0
 gsinMax(gs1,t13,k1): gsin(gs1,t13,k1) <= 0
 gsoutMax(gs1,t13,k1): gsout(gs1,t13,k1) <= 0
 gstore_max(gs1,t13,k1): gstore(gs1,t13,k1) <= 0
 gstore_min(gs1,t13,k1): gstore(gs1,t13,k1) >= 0
 gsinMax(gs1,t14,k1): gsin(gs1,t14,k1) <= 0
 gsoutMax(gs1,t14,k1): gsout(gs1,t14,k1) <= 0
 gstore_max(gs1,t14,k1): gstore(gs1,t14,k1) <= 0
 gstore_min(gs1,t14,k1): gstore(gs1,t14,k1) >= 0
 gsinMax(gs1,t15,k1): gsin(gs1,t15,k1) <= 0
 gsoutMax(gs1,t15,k1): gsout(gs1,t15,k1) <= 0
 gstore_max(gs1,t15,k1): gstore(gs1,t15,k1) <= 0
 gstore_min(gs1,t15,k1): gstore(gs1,t15,k1) >= 0
 gsinMax(gs1,t16,k1): gsin(gs1,t16,k1) <= 0
 gsoutMax(gs1,t16,k1): gsout(gs1,t16,k1) <= 0
 gstore_max(gs1,t16,k1): gstore(gs1,t16,k1) <= 0
 gstore_min(gs1,t16,k1): gstore(gs1,t16,k1) >= 0
 gsinMax(gs1,t17,k1): gsin(gs1,t17,k1) <= 0
 gsoutMax(gs1,t17,k1): gsout(gs1,t17,k1) <= 0
 gstore_max(gs1,t17,k1): gstore(gs1,t17,k1) <= 0
 gstore_min(gs1,t17,k1): gstore(gs1,t17,k1) >= 0
 gsinMax(gs1,t18,k1): gsin(gs1,t18,k1) <= 0
 gsoutMax(gs1,t18,k1): gsout(gs1,t18,k1) <= 0
 gstore_max(gs1,t18,k1): gstore(gs1,t18,k1) <= 0
 gstore_min(gs1,t18,k1): gstore(gs1,t18,k1) >= 0
 gsinMax(gs1,t19,k1): gsin(gs1,t19,k1) <= 0
 gsoutMax(gs1,t19,k1): gsout(gs1,t19,k1) <= 0
 gstore_max(gs1,t19,k1): gstore(gs1,t19,k1) <= 0
 gstore_min(gs1,t19,k1): gstore(gs1,t19,k1) >= 0
 gsinMax(gs1,t20,k1): gsin(gs1,t20,k1) <= 0
 gsoutMax(gs1,t20,k1): gsout(gs1,t20,k1) <= 0
 gstore_max(gs1,t20,k1): gstore(gs1,t20,k1) <= 0
 gstore_min(gs1,t20,k1): gstore(gs1,t20,k1) >= 0
 gsinMax(gs1,t21,k1): gsin(gs1,t21,k1) <= 0
 gsoutMax(gs1,t21,k1): gsout(gs1,t21,k1) <= 0
 gstore_max(gs1,t21,k1): gstore(gs1,t21,k1) <= 0
 gstore_min(gs1,t21,k1): gstore(gs1,t21,k1) >= 0
 gsinMax(gs1,t22,k1): gsin(gs1,t22,k1) <= 0
 gsoutMax(gs1,t22,k1): gsout(gs1,t22,k1) <= 0
 gstore_max(gs1,t22,k1): gstore(gs1,t22,k1) <= 0
 gstore_min(gs1,t22,k1): gstore(gs1,t22,k1) >= 0
 gsinMax(gs1,t23,k1): gsin(gs1,t23,k1) <= 0
 gsoutMax(gs1,t23,k1): gsout(gs1,t23,k1) <= 0
 gstore_max(gs1,t23,k1): gstore(gs1,t23,k1) <= 0
 gstore_min(gs1,t23,k1): gstore(gs1,t23,k1) >= 0
 gsinMax(gs1,t24,k1): gsin(gs1,t24,k1) <= 0
 gsoutMax(gs1,t24,k1): gsout(gs1,t24,k1) <= 0
 gstore_max(gs1,t24,k1): gstore(gs1,t24,k1) <= 0
 gstore_min(gs1,t24,k1): gstore(gs1,t24,k1) >= 0
 gstor_def(gs1,k1,t2): - gstore(gs1,t1,k1) - gsin(gs1,t2,k1)
   + gsout(gs1,t2,k1) + gstore(gs1,t2,k1) = 0
 gstor_def(gs1,k1,t3): - gstore(gs1,t2,k1) - gsin(gs1,t3,k1)
   + gsout(gs1,t3,k1) + gstore(gs1,t3,k1) = 0
 gstor_def(gs1,k1,t4): - gstore(gs1,t3,k1) - gsin(gs1,t4,k1)
   + gsout(gs1,t4,k1) + gstore(gs1,t4,k1) = 0
 gstor_def(gs1,k1,t5): - gstore(gs1,t4,k1) - gsin(gs1,t5,k1)
   + gsout(gs1,t5,k1) + gstore(gs1,t5,k1) = 0
 gstor_def(gs1,k1,t6): - gstore(gs1,t5,k1) - gsin(gs1,t6,k1)
   + gsout(gs1,t6,k1) + gstore(gs1,t6,k1) = 0
 gstor_def(gs1,k1,t7): - gstore(gs1,t6,k1) - gsin(gs1,t7,k1)
   + gsout(gs1,t7,k1) + gstore(gs1,t7,k1) = 0
 gstor_def(gs1,k1,t8): - gstore(gs1,t7,k1) - gsin(gs1,t8,k1)
   + gsout(gs1,t8,k1) + gstore(gs1,t8,k1) = 0
 gstor_def(gs1,k1,t9): - gstore(gs1,t8,k1) - gsin(gs1,t9,k1)
   + gsout(gs1,t9,k1) + gstore(gs1,t9,k1) = 0
 gstor_def(gs1,k1,t10): - gstore(gs1,t9,k1) - gsin(gs1,t10,k1)
   + gsout(gs1,t10,k1) + gstore(gs1,t10,k1) = 0
 gstor_def(gs1,k1,t11): - gstore(gs1,t10,k1) - gsin(gs1,t11,k1)
   + gsout(gs1,t11,k1) + gstore(gs1,t11,k1) = 0
 gstor_def(gs1,k1,t12): - gstore(gs1,t11,k1) - gsin(gs1,t12,k1)
   + gsout(gs1,t12,k1) + gstore(gs1,t12,k1) = 0
 gstor_def(gs1,k1,t13): - gstore(gs1,t12,k1) - gsin(gs1,t13,k1)
   + gsout(gs1,t13,k1) + gstore(gs1,t13,k1) = 0
 gstor_def(gs1,k1,t14): - gstore(gs1,t13,k1) - gsin(gs1,t14,k1)
   + gsout(gs1,t14,k1) + gstore(gs1,t14,k1) = 0
 gstor_def(gs1,k1,t15): - gstore(gs1,t14,k1) - gsin(gs1,t15,k1)
   + gsout(gs1,t15,k1) + gstore(gs1,t15,k1) = 0
 gstor_def(gs1,k1,t16): - gstore(gs1,t15,k1) - gsin(gs1,t16,k1)
   + gsout(gs1,t16,k1) + gstore(gs1,t16,k1) = 0
 gstor_def(gs1,k1,t17): - gstore(gs1,t16,k1) - gsin(gs1,t17,k1)
   + gsout(gs1,t17,k1) + gstore(gs1,t17,k1) = 0
 gstor_def(gs1,k1,t18): - gstore(gs1,t17,k1) - gsin(gs1,t18,k1)
   + gsout(gs1,t18,k1) + gstore(gs1,t18,k1) = 0
 gstor_def(gs1,k1,t19): - gstore(gs1,t18,k1) - gsin(gs1,t19,k1)
   + gsout(gs1,t19,k1) + gstore(gs1,t19,k1) = 0
 gstor_def(gs1,k1,t20): - gstore(gs1,t19,k1) - gsin(gs1,t20,k1)
   + gsout(gs1,t20,k1) + gstore(gs1,t20,k1) = 0
 gstor_def(gs1,k1,t21): - gstore(gs1,t20,k1) - gsin(gs1,t21,k1)
   + gsout(gs1,t21,k1) + gstore(gs1,t21,k1) = 0
 gstor_def(gs1,k1,t22): - gstore(gs1,t21,k1) - gsin(gs1,t22,k1)
   + gsout(gs1,t22,k1) + gstore(gs1,t22,k1) = 0
 gstor_def(gs1,k1,t23): - gstore(gs1,t22,k1) - gsin(gs1,t23,k1)
   + gsout(gs1,t23,k1) + gstore(gs1,t23,k1) = 0
 gstor_def(gs1,k1,t24): - gstore(gs1,t23,k1) - gsin(gs1,t24,k1)
   + gsout(gs1,t24,k1) + gstore(gs1,t24,k1) = 0
 gstor_def(gs1,k1,t1): - gsin(gs1,t1,k1) + gsout(gs1,t1,k1)
   + gstore(gs1,t1,k1) = 0
 gsinMax(gs1,t1,k2): gsin(gs1,t1,k2) <= 0
 gsoutMax(gs1,t1,k2): gsout(gs1,t1,k2) <= 0
 gstore_max(gs1,t1,k2): gstore(gs1,t1,k2) <= 0
 gstore_min(gs1,t1,k2): gstore(gs1,t1,k2) >= 0
 gsinMax(gs1,t2,k2): gsin(gs1,t2,k2) <= 0
 gsoutMax(gs1,t2,k2): gsout(gs1,t2,k2) <= 0
 gstore_max(gs1,t2,k2): gstore(gs1,t2,k2) <= 0
 gstore_min(gs1,t2,k2): gstore(gs1,t2,k2) >= 0
 gsinMax(gs1,t3,k2): gsin(gs1,t3,k2) <= 0
 gsoutMax(gs1,t3,k2): gsout(gs1,t3,k2) <= 0
 gstore_max(gs1,t3,k2): gstore(gs1,t3,k2) <= 0
 gstore_min(gs1,t3,k2): gstore(gs1,t3,k2) >= 0
 gsinMax(gs1,t4,k2): gsin(gs1,t4,k2) <= 0
 gsoutMax(gs1,t4,k2): gsout(gs1,t4,k2) <= 0
 gstore_max(gs1,t4,k2): gstore(gs1,t4,k2) <= 0
 gstore_min(gs1,t4,k2): gstore(gs1,t4,k2) >= 0
 gsinMax(gs1,t5,k2): gsin(gs1,t5,k2) <= 0
 gsoutMax(gs1,t5,k2): gsout(gs1,t5,k2) <= 0
 gstore_max(gs1,t5,k2): gstore(gs1,t5,k2) <= 0
 gstore_min(gs1,t5,k2): gstore(gs1,t5,k2) >= 0
 gsinMax(gs1,t6,k2): gsin(gs1,t6,k2) <= 0
 gsoutMax(gs1,t6,k2): gsout(gs1,t6,k2) <= 0
 gstore_max(gs1,t6,k2): gstore(gs1,t6,k2) <= 0
 gstore_min(gs1,t6,k2): gstore(gs1,t6,k2) >= 0
 gsinMax(gs1,t7,k2): gsin(gs1,t7,k2) <= 0
 gsoutMax(gs1,t7,k2): gsout(gs1,t7,k2) <= 0
 gstore_max(gs1,t7,k2): gstore(gs1,t7,k2) <= 0
 gstore_min(gs1,t7,k2): gstore(gs1,t7,k2) >= 0
 gsinMax(gs1,t8,k2): gsin(gs1,t8,k2) <= 0
 gsoutMax(gs1,t8,k2): gsout(gs1,t8,k2) <= 0
 gstore_max(gs1,t8,k2): gstore(gs1,t8,k2) <= 0
 gstore_min(gs1,t8,k2): gstore(gs1,t8,k2) >= 0
 gsinMax(gs1,t9,k2): gsin(gs1,t9,k2) <= 0
 gsoutMax(gs1,t9,k2): gsout(gs1,t9,k2) <= 0
 gstore_max(gs1,t9,k2): gstore(gs1,t9,k2) <= 0
 gstore_min(gs1,t9,k2): gstore(gs1,t9,k2) >= 0
 gsinMax(gs1,t10,k2): gsin(gs1,t10,k2) <= 0
 gsoutMax(gs1,t10,k2): gsout(gs1,t10,k2) <= 0
 gstore_max(gs1,t10,k2): gstore(gs1,t10,k2) <= 0
 gstore_min(gs1,t10,k2): gstore(gs1,t10,k2) >= 0
 gsinMax(gs1,t11,k2): gsin(gs1,t11,k2) <= 0
 gsoutMax(gs1,t11,k2): gsout(gs1,t11,k2) <= 0
 gstore_max(gs1,t11,k2): gstore(gs1,t11,k2) <= 0
 gstore_min(gs1,t11,k2): gstore(gs1,t11,k2) >= 0
 gsinMax(gs1,t12,k2): gsin(gs1,t12,k2) <= 0
 gsoutMax(gs1,t12,k2): gsout(gs1,t12,k2) <= 0
 gstore_max(gs1,t12,k2): gstore(gs1,t12,k2) <= 0
 gstore_min(gs1,t12,k2): gstore(gs1,t12,k2) >= 0
 gsinMax(gs1,t13,k2): gsin(gs1,t13,k2) <= 0
 gsoutMax(gs1,t13,k2): gsout(gs1,t13,k2) <= 0
 gstore_max(gs1,t13,k2): gstore(gs1,t13,k2) <= 0
 gstore_min(gs1,t13,k2): gstore(gs1,t13,k2) >= 0
 gsinMax(gs1,t14,k2): gsin(gs1,t14,k2) <= 0
 gsoutMax(gs1,t14,k2): gsout(gs1,t14,k2) <= 0
 gstore_max(gs1,t14,k2): gstore(gs1,t14,k2) <= 0
 gstore_min(gs1,t14,k2): gstore(gs1,t14,k2) >= 0
 gsinMax(gs1,t15,k2): gsin(gs1,t15,k2) <= 0
 gsoutMax(gs1,t15,k2): gsout(gs1,t15,k2) <= 0
 gstore_max(gs1,t15,k2): gstore(gs1,t15,k2) <= 0
 gstore_min(gs1,t15,k2): gstore(gs1,t15,k2) >= 0
 gsinMax(gs1,t16,k2): gsin(gs1,t16,k2) <= 0
 gsoutMax(gs1,t16,k2): gsout(gs1,t16,k2) <= 0
 gstore_max(gs1,t16,k2): gstore(gs1,t16,k2) <= 0
 gstore_min(gs1,t16,k2): gstore(gs1,t16,k2) >= 0
 gsinMax(gs1,t17,k2): gsin(gs1,t17,k2) <= 0
 gsoutMax(gs1,t17,k2): gsout(gs1,t17,k2) <= 0
 gstore_max(gs1,t17,k2): gstore(gs1,t17,k2) <= 0
 gstore_min(gs1,t17,k2): gstore(gs1,t17,k2) >= 0
 gsinMax(gs1,t18,k2): gsin(gs1,t18,k2) <= 0
 gsoutMax(gs1,t18,k2): gsout(gs1,t18,k2) <= 0
 gstore_max(gs1,t18,k2): gstore(gs1,t18,k2) <= 0
 gstore_min(gs1,t18,k2): gstore(gs1,t18,k2) >= 0
 gsinMax(gs1,t19,k2): gsin(gs1,t19,k2) <= 0
 gsoutMax(gs1,t19,k2): gsout(gs1,t19,k2) <= 0
 gstore_max(gs1,t19,k2): gstore(gs1,t19,k2) <= 0
 gstore_min(gs1,t19,k2): gstore(gs1,t19,k2) >= 0
 gsinMax(gs1,t20,k2): gsin(gs1,t20,k2) <= 0
 gsoutMax(gs1,t20,k2): gsout(gs1,t20,k2) <= 0
 gstore_max(gs1,t20,k2): gstore(gs1,t20,k2) <= 0
 gstore_min(gs1,t20,k2): gstore(gs1,t20,k2) >= 0
 gsinMax(gs1,t21,k2): gsin(gs1,t21,k2) <= 0
 gsoutMax(gs1,t21,k2): gsout(gs1,t21,k2) <= 0
 gstore_max(gs1,t21,k2): gstore(gs1,t21,k2) <= 0
 gstore_min(gs1,t21,k2): gstore(gs1,t21,k2) >= 0
 gsinMax(gs1,t22,k2): gsin(gs1,t22,k2) <= 0
 gsoutMax(gs1,t22,k2): gsout(gs1,t22,k2) <= 0
 gstore_max(gs1,t22,k2): gstore(gs1,t22,k2) <= 0
 gstore_min(gs1,t22,k2): gstore(gs1,t22,k2) >= 0
 gsinMax(gs1,t23,k2): gsin(gs1,t23,k2) <= 0
 gsoutMax(gs1,t23,k2): gsout(gs1,t23,k2) <= 0
 gstore_max(gs1,t23,k2): gstore(gs1,t23,k2) <= 0
 gstore_min(gs1,t23,k2): gstore(gs1,t23,k2) >= 0
 gsinMax(gs1,t24,k2): gsin(gs1,t24,k2) <= 0
 gsoutMax(gs1,t24,k2): gsout(gs1,t24,k2) <= 0
 gstore_max(gs1,t24,k2): gstore(gs1,t24,k2) <= 0
 gstore_min(gs1,t24,k2): gstore(gs1,t24,k2) >= 0
 gstor_def(gs1,k2,t2): - gstore(gs1,t1,k2) - gsin(gs1,t2,k2)
   + gsout(gs1,t2,k2) + gstore(gs1,t2,k2) = 0
 gstor_def(gs1,k2,t3): - gstore(gs1,t2,k2) - gsin(gs1,t3,k2)
   + gsout(gs1,t3,k2) + gstore(gs1,t3,k2) = 0
 gstor_def(gs1,k2,t4): - gstore(gs1,t3,k2) - gsin(gs1,t4,k2)
   + gsout(gs1,t4,k2) + gstore(gs1,t4,k2) = 0
 gstor_def(gs1,k2,t5): - gstore(gs1,t4,k2) - gsin(gs1,t5,k2)
   + gsout(gs1,t5,k2) + gstore(gs1,t5,k2) = 0
 gstor_def(gs1,k2,t6): - gstore(gs1,t5,k2) - gsin(gs1,t6,k2)
   + gsout(gs1,t6,k2) + gstore(gs1,t6,k2) = 0
 gstor_def(gs1,k2,t7): - gstore(gs1,t6,k2) - gsin(gs1,t7,k2)
   + gsout(gs1,t7,k2) + gstore(gs1,t7,k2) = 0
 gstor_def(gs1,k2,t8): - gstore(gs1,t7,k2) - gsin(gs1,t8,k2)
   + gsout(gs1,t8,k2) + gstore(gs1,t8,k2) = 0
 gstor_def(gs1,k2,t9): - gstore(gs1,t8,k2) - gsin(gs1,t9,k2)
   + gsout(gs1,t9,k2) + gstore(gs1,t9,k2) = 0
 gstor_def(gs1,k2,t10): - gstore(gs1,t9,k2) - gsin(gs1,t10,k2)
   + gsout(gs1,t10,k2) + gstore(gs1,t10,k2) = 0
 gstor_def(gs1,k2,t11): - gstore(gs1,t10,k2) - gsin(gs1,t11,k2)
   + gsout(gs1,t11,k2) + gstore(gs1,t11,k2) = 0
 gstor_def(gs1,k2,t12): - gstore(gs1,t11,k2) - gsin(gs1,t12,k2)
   + gsout(gs1,t12,k2) + gstore(gs1,t12,k2) = 0
 gstor_def(gs1,k2,t13): - gstore(gs1,t12,k2) - gsin(gs1,t13,k2)
   + gsout(gs1,t13,k2) + gstore(gs1,t13,k2) = 0
 gstor_def(gs1,k2,t14): - gstore(gs1,t13,k2) - gsin(gs1,t14,k2)
   + gsout(gs1,t14,k2) + gstore(gs1,t14,k2) = 0
 gstor_def(gs1,k2,t15): - gstore(gs1,t14,k2) - gsin(gs1,t15,k2)
   + gsout(gs1,t15,k2) + gstore(gs1,t15,k2) = 0
 gstor_def(gs1,k2,t16): - gstore(gs1,t15,k2) - gsin(gs1,t16,k2)
   + gsout(gs1,t16,k2) + gstore(gs1,t16,k2) = 0
 gstor_def(gs1,k2,t17): - gstore(gs1,t16,k2) - gsin(gs1,t17,k2)
   + gsout(gs1,t17,k2) + gstore(gs1,t17,k2) = 0
 gstor_def(gs1,k2,t18): - gstore(gs1,t17,k2) - gsin(gs1,t18,k2)
   + gsout(gs1,t18,k2) + gstore(gs1,t18,k2) = 0
 gstor_def(gs1,k2,t19): - gstore(gs1,t18,k2) - gsin(gs1,t19,k2)
   + gsout(gs1,t19,k2) + gstore(gs1,t19,k2) = 0
 gstor_def(gs1,k2,t20): - gstore(gs1,t19,k2) - gsin(gs1,t20,k2)
   + gsout(gs1,t20,k2) + gstore(gs1,t20,k2) = 0
 gstor_def(gs1,k2,t21): - gstore(gs1,t20,k2) - gsin(gs1,t21,k2)
   + gsout(gs1,t21,k2) + gstore(gs1,t21,k2) = 0
 gstor_def(gs1,k2,t22): - gstore(gs1,t21,k2) - gsin(gs1,t22,k2)
   + gsout(gs1,t22,k2) + gstore(gs1,t22,k2) = 0
 gstor_def(gs1,k2,t23): - gstore(gs1,t22,k2) - gsin(gs1,t23,k2)
   + gsout(gs1,t23,k2) + gstore(gs1,t23,k2) = 0
 gstor_def(gs1,k2,t24): - gstore(gs1,t23,k2) - gsin(gs1,t24,k2)
   + gsout(gs1,t24,k2) + gstore(gs1,t24,k2) = 0
 gstor_def(gs1,k2,t1): - gsin(gs1,t1,k2) + gsout(gs1,t1,k2)
   + gstore(gs1,t1,k2) = 0
 gs_end(gs1,k0): gstore(gs1,t24,k0) >= 0
Bounds
End
