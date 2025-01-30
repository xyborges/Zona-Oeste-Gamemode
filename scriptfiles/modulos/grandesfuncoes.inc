enum zoneinfo {
    zone_name[27],
    Float:zone_minx,
    Float:zone_miny,
    Float:zone_minz,
    Float:zone_maxx,
    Float:zone_maxy,
    Float:zone_maxz
}
new zones[][zoneinfo] = {
{ "The Big Ear",                -410.00,  1403.30,    -3.00,  -137.90,  1681.20,   200.00},
{ "Aldea Malvada",               -1372.10,  2498.50,     0.00, -1277.50,  2615.30,   200.00},
{ "Angel Pine",                  -2324.90, -2584.20,    -6.10, -1964.20, -2212.10,   200.00},
{ "Arco del Oeste",               -901.10,  2221.80,     0.00,  -592.00,  2571.90,   200.00},
{ "Avispa Country Club",         -2646.40,  -355.40,     0.00, -2270.00,  -222.50,   200.00},
{ "Avispa Country Club",         -2831.80,  -430.20,    -6.10, -2646.40,  -222.50,   200.00},
{ "Avispa Country Club",         -2361.50,  -417.10,     0.00, -2270.00,  -355.40,   200.00},
{ "Avispa Country Club",         -2667.80,  -302.10,   -28.80, -2646.40,  -262.30,    71.10},
{ "Avispa Country Club",         -2470.00,  -355.40,     0.00, -2270.00,  -318.40,    46.10},
{ "Avispa Country Club",         -2550.00,  -355.40,     0.00, -2470.00,  -318.40,    39.70},
{ "Back o Beyond",               -1166.90, -2641.10,     0.00,  -321.70, -1856.00,   200.00},
{ "Battery Point",               -2741.00,  1268.40,    -4.50, -2533.00,  1490.40,   200.00},
{ "Bayside",                     -2741.00,  2175.10,     0.00, -2353.10,  2722.70,   200.00},
{ "Bayside Marina",              -2353.10,  2275.70,     0.00, -2153.10,  2475.70,   200.00},
{ "Beacon Hill",                  -399.60, -1075.50,    -1.40,  -319.00,  -977.50,   198.50},
{ "Blackfield",                    964.30,  1203.20,   -89.00,  1197.30,  1403.20,   110.90},
{ "Blackfield",                    964.30,  1403.20,   -89.00,  1197.30,  1726.20,   110.90},
{ "Blackfield Chapel",            1375.60,   596.30,   -89.00,  1558.00,   823.20,   110.90},
{ "Blackfield Chapel",            1325.60,   596.30,   -89.00,  1375.60,   795.00,   110.90},
{ "Blackfield Intersection",      1197.30,  1044.60,   -89.00,  1277.00,  1163.30,   110.90},
{ "Blackfield Intersection",      1166.50,   795.00,   -89.00,  1375.60,  1044.60,   110.90},
{ "Blackfield Intersection",      1277.00,  1044.60,   -89.00,  1315.30,  1087.60,   110.90},
{ "Blackfield Intersection",      1375.60,   823.20,   -89.00,  1457.30,   919.40,   110.90},
{ "Blueberry",                     104.50,  -220.10,     2.30,   349.60,   152.20,   200.00},
{ "Blueberry",                      19.60,  -404.10,     3.80,   349.60,  -220.10,   200.00},
{ "Blueberry Acres",              -319.60,  -220.10,     0.00,   104.50,   293.30,   200.00},
{ "Caligula's Palace",            2087.30,  1543.20,   -89.00,  2437.30,  1703.20,   110.90},
{ "Caligula's Palace",            2137.40,  1703.20,   -89.00,  2437.30,  1783.20,   110.90},
{ "Calton Heights",              -2274.10,   744.10,    -6.10, -1982.30,  1358.90,   200.00},
{ "Chinatown",                   -2274.10,   578.30,    -7.60, -2078.60,   744.10,   200.00},
{ "City Hall",                   -2867.80,   277.40,    -9.10, -2593.40,   458.40,   200.00},
{ "Come-A-Lot",                   2087.30,   943.20,   -89.00,  2623.10,  1203.20,   110.90},
{ "Commerce",                     1323.90, -1842.20,   -89.00,  1701.90, -1722.20,   110.90},
{ "Commerce",                     1323.90, -1722.20,   -89.00,  1440.90, -1577.50,   110.90},
{ "Commerce",                     1370.80, -1577.50,   -89.00,  1463.90, -1384.90,   110.90},
{ "Commerce",                     1463.90, -1577.50,   -89.00,  1667.90, -1430.80,   110.90},
{ "Commerce",                     1583.50, -1722.20,   -89.00,  1758.90, -1577.50,   110.90},
{ "Commerce",                     1667.90, -1577.50,   -89.00,  1812.60, -1430.80,   110.90},
{ "Conference Center",            1046.10, -1804.20,   -89.00,  1323.90, -1722.20,   110.90},
{ "Conference Center",            1073.20, -1842.20,   -89.00,  1323.90, -1804.20,   110.90},
{ "Cranberry Station",           -2007.80,    56.30,     0.00, -1922.00,   224.70,   100.00},
{ "Creek",                        2749.90,  1937.20,   -89.00,  2921.60,  2669.70,   110.90},
{ "Dillimore",                     580.90,  -674.80,    -9.50,   861.00,  -404.70,   200.00},
{ "Doherty",                     -2270.00,  -324.10,    -0.00, -1794.90,  -222.50,   200.00},
{ "Doherty",                     -2173.00,  -222.50,    -0.00, -1794.90,   265.20,   200.00},
{ "Downtown",                    -1982.30,   744.10,    -6.10, -1871.70,  1274.20,   200.00},
{ "Downtown",                    -1871.70,  1176.40,    -4.50, -1620.30,  1274.20,   200.00},
{ "Downtown",                    -1700.00,   744.20,    -6.10, -1580.00,  1176.50,   200.00},
{ "Downtown",                    -1580.00,   744.20,    -6.10, -1499.80,  1025.90,   200.00},
{ "Downtown",                    -2078.60,   578.30,    -7.60, -1499.80,   744.20,   200.00},
{ "Downtown",                    -1993.20,   265.20,    -9.10, -1794.90,   578.30,   200.00},
{ "Downtown Los Santos",          1463.90, -1430.80,   -89.00,  1724.70, -1290.80,   110.90},
{ "Downtown Los Santos",          1724.70, -1430.80,   -89.00,  1812.60, -1250.90,   110.90},
{ "Downtown Los Santos",          1463.90, -1290.80,   -89.00,  1724.70, -1150.80,   110.90},
{ "Downtown Los Santos",          1370.80, -1384.90,   -89.00,  1463.90, -1170.80,   110.90},
{ "Downtown Los Santos",          1724.70, -1250.90,   -89.00,  1812.60, -1150.80,   110.90},
{ "Downtown Los Santos",          1370.80, -1170.80,   -89.00,  1463.90, -1130.80,   110.90},
{ "Downtown Los Santos",          1378.30, -1130.80,   -89.00,  1463.90, -1026.30,   110.90},
{ "Downtown Los Santos",          1391.00, -1026.30,   -89.00,  1463.90,  -926.90,   110.90},
{ "Downtown Los Santos",          1507.50, -1385.20,   110.90,  1582.50, -1325.30,   335.90},
{ "East Beach",                   2632.80, -1852.80,   -89.00,  2959.30, -1668.10,   110.90},
{ "East Beach",                   2632.80, -1668.10,   -89.00,  2747.70, -1393.40,   110.90},
{ "East Beach",                   2747.70, -1668.10,   -89.00,  2959.30, -1498.60,   110.90},
{ "East Beach",                   2747.70, -1498.60,   -89.00,  2959.30, -1120.00,   110.90},
{ "East Los Santos",              2421.00, -1628.50,   -89.00,  2632.80, -1454.30,   110.90},
{ "East Los Santos",              2222.50, -1628.50,   -89.00,  2421.00, -1494.00,   110.90},
{ "East Los Santos",              2266.20, -1494.00,   -89.00,  2381.60, -1372.00,   110.90},
{ "East Los Santos",              2381.60, -1494.00,   -89.00,  2421.00, -1454.30,   110.90},
{ "East Los Santos",              2281.40, -1372.00,   -89.00,  2381.60, -1135.00,   110.90},
{ "East Los Santos",              2381.60, -1454.30,   -89.00,  2462.10, -1135.00,   110.90},
{ "East Los Santos",              2462.10, -1454.30,   -89.00,  2581.70, -1135.00,   110.90},
{ "Easter Basin",                -1794.90,   249.90,    -9.10, -1242.90,   578.30,   200.00},
{ "Easter Basin",                -1794.90,   -50.00,    -0.00, -1499.80,   249.90,   200.00},
{ "Easter Bay Airport",          -1499.80,   -50.00,    -0.00, -1242.90,   249.90,   200.00},
{ "Easter Bay Airport",          -1794.90,  -730.10,    -3.00, -1213.90,   -50.00,   200.00},
{ "Easter Bay Airport",          -1213.90,  -730.10,     0.00, -1132.80,   -50.00,   200.00},
{ "Easter Bay Airport",          -1242.90,   -50.00,     0.00, -1213.90,   578.30,   200.00},
{ "Easter Bay Airport",          -1213.90,   -50.00,    -4.50,  -947.90,   578.30,   200.00},
{ "Easter Bay Airport",          -1315.40,  -405.30,    15.40, -1264.40,  -209.50,    25.40},
{ "Easter Bay Airport",          -1354.30,  -287.30,    15.40, -1315.40,  -209.50,    25.40},
{ "Easter Bay Airport",          -1490.30,  -209.50,    15.40, -1264.40,  -148.30,    25.40},
{ "Easter Bay Chemicals",        -1132.80,  -768.00,     0.00,  -956.40,  -578.10,   200.00},
{ "Easter Bay Chemicals",        -1132.80,  -787.30,     0.00,  -956.40,  -768.00,   200.00},
{ "El Castillo del Diablo",       -464.50,  2217.60,     0.00,  -208.50,  2580.30,   200.00},
{ "El Castillo del Diablo",       -208.50,  2123.00,    -7.60,   114.00,  2337.10,   200.00},
{ "El Castillo del Diablo",       -208.50,  2337.10,     0.00,     8.40,  2487.10,   200.00},
{ "El Corona",                    1812.60, -2179.20,   -89.00,  1970.60, -1852.80,   110.90},
{ "El Corona",                    1692.60, -2179.20,   -89.00,  1812.60, -1842.20,   110.90},
{ "El Quebrados",                -1645.20,  2498.50,     0.00, -1372.10,  2777.80,   200.00},
{ "Esplanade East",              -1620.30,  1176.50,    -4.50, -1580.00,  1274.20,   200.00},
{ "Esplanade East",              -1580.00,  1025.90,    -6.10, -1499.80,  1274.20,   200.00},
{ "Esplanade East",              -1499.80,   578.30,   -79.60, -1339.80,  1274.20,    20.30},
{ "Esplanade North",             -2533.00,  1358.90,    -4.50, -1996.60,  1501.20,   200.00},
{ "Esplanade North",             -1996.60,  1358.90,    -4.50, -1524.20,  1592.50,   200.00},
{ "Esplanade North",             -1982.30,  1274.20,    -4.50, -1524.20,  1358.90,   200.00},
{ "Fallen Tree",                  -792.20,  -698.50,    -5.30,  -452.40,  -380.00,   200.00},
{ "Fallow Bridge",                 434.30,   366.50,     0.00,   603.00,   555.60,   200.00},
{ "Fern Ridge",                    508.10,  -139.20,     0.00,  1306.60,   119.50,   200.00},
{ "Financial",                   -1871.70,   744.10,    -6.10, -1701.30,  1176.40,   300.00},
{ "Fisher's Lagoon",              1916.90,  -233.30,  -100.00,  2131.70,    13.80,   200.00},
{ "Flint Intersection",           -187.70, -1596.70,   -89.00,    17.00, -1276.60,   110.90},
{ "Flint Range",                  -594.10, -1648.50,     0.00,  -187.70, -1276.60,   200.00},
{ "Fort Carson",                  -376.20,   826.30,    -3.00,   123.70,  1220.40,   200.00},
{ "Foster Valley",               -2270.00,  -430.20,    -0.00, -2178.60,  -324.10,   200.00},
{ "Foster Valley",               -2178.60,  -599.80,    -0.00, -1794.90,  -324.10,   200.00},
{ "Foster Valley",               -2178.60, -1115.50,     0.00, -1794.90,  -599.80,   200.00},
{ "Foster Valley",               -2178.60, -1250.90,     0.00, -1794.90, -1115.50,   200.00},
{ "Frederick Bridge",             2759.20,   296.50,     0.00,  2774.20,   594.70,   200.00},
{ "Gant Bridge",                 -2741.40,  1659.60,    -6.10, -2616.40,  2175.10,   200.00},
{ "Gant Bridge",                 -2741.00,  1490.40,    -6.10, -2616.40,  1659.60,   200.00},
{ "Ganton",                       2222.50, -1852.80,   -89.00,  2632.80, -1722.30,   110.90},
{ "Ganton",                       2222.50, -1722.30,   -89.00,  2632.80, -1628.50,   110.90},
{ "Garcia",                      -2411.20,  -222.50,    -0.00, -2173.00,   265.20,   200.00},
{ "Garcia",                      -2395.10,  -222.50,    -5.30, -2354.00,  -204.70,   200.00},
{ "Garver Bridge",               -1339.80,   828.10,   -89.00, -1213.90,  1057.00,   110.90},
{ "Garver Bridge",               -1213.90,   950.00,   -89.00, -1087.90,  1178.90,   110.90},
{ "Garver Bridge",               -1499.80,   696.40,  -179.60, -1339.80,   925.30,    20.30},
{ "Glen Park",                    1812.60, -1449.60,   -89.00,  1996.90, -1350.90,   110.90},
{ "Glen Park",                    1812.60, -1100.80,   -89.00,  1994.30,  -973.30,   110.90},
{ "Glen Park",                    1812.60, -1350.90,   -89.00,  2056.80, -1100.80,   110.90},
{ "Green Palms",                   176.50,  1305.40,    -3.00,   338.60,  1520.90,   200.00},
{ "Greenglass College",            964.30,  1044.60,   -89.00,  1197.30,  1203.20,   110.90},
{ "Greenglass College",            964.30,   930.80,   -89.00,  1166.50,  1044.60,   110.90},
{ "Hampton Barns",                 603.00,   264.30,     0.00,   761.90,   366.50,   200.00},
{ "Hankypanky Point",             2576.90,    62.10,     0.00,  2759.20,   385.50,   200.00},
{ "Harry Gold Parkway",           1777.30,   863.20,   -89.00,  1817.30,  2342.80,   110.90},
{ "Hashbury",                    -2593.40,  -222.50,    -0.00, -2411.20,    54.70,   200.00},
{ "Hilltop Farm",                  967.30,  -450.30,    -3.00,  1176.70,  -217.90,   200.00},
{ "Hunter Quarry",                 337.20,   710.80,  -115.20,   860.50,  1031.70,   203.70},
{ "Idlewood",                     1812.60, -1852.80,   -89.00,  1971.60, -1742.30,   110.90},
{ "Idlewood",                     1812.60, -1742.30,   -89.00,  1951.60, -1602.30,   110.90},
{ "Idlewood",                     1951.60, -1742.30,   -89.00,  2124.60, -1602.30,   110.90},
{ "Idlewood",                     1812.60, -1602.30,   -89.00,  2124.60, -1449.60,   110.90},
{ "Idlewood",                     2124.60, -1742.30,   -89.00,  2222.50, -1494.00,   110.90},
{ "Idlewood",                     1971.60, -1852.80,   -89.00,  2222.50, -1742.30,   110.90},
{ "Jefferson",                    1996.90, -1449.60,   -89.00,  2056.80, -1350.90,   110.90},
{ "Jefferson",                    2124.60, -1494.00,   -89.00,  2266.20, -1449.60,   110.90},
{ "Jefferson",                    2056.80, -1372.00,   -89.00,  2281.40, -1210.90,   110.90},
{ "Jefferson",                    2056.80, -1210.90,   -89.00,  2185.30, -1126.30,   110.90},
{ "Jefferson",                    2185.30, -1210.90,   -89.00,  2281.40, -1154.50,   110.90},
{ "Jefferson",                    2056.80, -1449.60,   -89.00,  2266.20, -1372.00,   110.90},
{ "Julius Thruway East",          2623.10,   943.20,   -89.00,  2749.90,  1055.90,   110.90},
{ "Julius Thruway East",          2685.10,  1055.90,   -89.00,  2749.90,  2626.50,   110.90},
{ "Julius Thruway East",          2536.40,  2442.50,   -89.00,  2685.10,  2542.50,   110.90},
{ "Julius Thruway East",          2625.10,  2202.70,   -89.00,  2685.10,  2442.50,   110.90},
{ "Julius Thruway North",         2498.20,  2542.50,   -89.00,  2685.10,  2626.50,   110.90},
{ "Julius Thruway North",         2237.40,  2542.50,   -89.00,  2498.20,  2663.10,   110.90},
{ "Julius Thruway North",         2121.40,  2508.20,   -89.00,  2237.40,  2663.10,   110.90},
{ "Julius Thruway North",         1938.80,  2508.20,   -89.00,  2121.40,  2624.20,   110.90},
{ "Julius Thruway North",         1534.50,  2433.20,   -89.00,  1848.40,  2583.20,   110.90},
{ "Julius Thruway North",         1848.40,  2478.40,   -89.00,  1938.80,  2553.40,   110.90},
{ "Julius Thruway North",         1704.50,  2342.80,   -89.00,  1848.40,  2433.20,   110.90},
{ "Julius Thruway North",         1377.30,  2433.20,   -89.00,  1534.50,  2507.20,   110.90},
{ "Julius Thruway South",         1457.30,   823.20,   -89.00,  2377.30,   863.20,   110.90},
{ "Julius Thruway South",         2377.30,   788.80,   -89.00,  2537.30,   897.90,   110.90},
{ "Julius Thruway West",          1197.30,  1163.30,   -89.00,  1236.60,  2243.20,   110.90},
{ "Julius Thruway West",          1236.60,  2142.80,   -89.00,  1297.40,  2243.20,   110.90},
{ "Juniper Hill",                -2533.00,   578.30,    -7.60, -2274.10,   968.30,   200.00},
{ "Juniper Hollow",              -2533.00,   968.30,    -6.10, -2274.10,  1358.90,   200.00},
{ "K.A.C.C. Military Fuels",      2498.20,  2626.50,   -89.00,  2749.90,  2861.50,   110.90},
{ "Kincaid Bridge",              -1339.80,   599.20,   -89.00, -1213.90,   828.10,   110.90},
{ "Kincaid Bridge",              -1213.90,   721.10,   -89.00, -1087.90,   950.00,   110.90},
{ "Kincaid Bridge",              -1087.90,   855.30,   -89.00,  -961.90,   986.20,   110.90},
{ "King's",                      -2329.30,   458.40,    -7.60, -1993.20,   578.30,   200.00},
{ "King's",                      -2411.20,   265.20,    -9.10, -1993.20,   373.50,   200.00},
{ "King's",                      -2253.50,   373.50,    -9.10, -1993.20,   458.40,   200.00},
{ "LVA Freight Depot",            1457.30,   863.20,   -89.00,  1777.40,  1143.20,   110.90},
{ "LVA Freight Depot",            1375.60,   919.40,   -89.00,  1457.30,  1203.20,   110.90},
{ "LVA Freight Depot",            1277.00,  1087.60,   -89.00,  1375.60,  1203.20,   110.90},
{ "LVA Freight Depot",            1315.30,  1044.60,   -89.00,  1375.60,  1087.60,   110.90},
{ "LVA Freight Depot",            1236.60,  1163.40,   -89.00,  1277.00,  1203.20,   110.90},
{ "Las Barrancas",                -926.10,  1398.70,    -3.00,  -719.20,  1634.60,   200.00},
{ "Las Brujas",                   -365.10,  2123.00,    -3.00,  -208.50,  2217.60,   200.00},
{ "Las Colinas",                  1994.30, -1100.80,   -89.00,  2056.80,  -920.80,   110.90},
{ "Las Colinas",                  2056.80, -1126.30,   -89.00,  2126.80,  -920.80,   110.90},
{ "Las Colinas",                  2185.30, -1154.50,   -89.00,  2281.40,  -934.40,   110.90},
{ "Las Colinas",                  2126.80, -1126.30,   -89.00,  2185.30,  -934.40,   110.90},
{ "Las Colinas",                  2747.70, -1120.00,   -89.00,  2959.30,  -945.00,   110.90},
{ "Las Colinas",                  2632.70, -1135.00,   -89.00,  2747.70,  -945.00,   110.90},
{ "Las Colinas",                  2281.40, -1135.00,   -89.00,  2632.70,  -945.00,   110.90},
{ "Las Payasadas",                -354.30,  2580.30,     2.00,  -133.60,  2816.80,   200.00},
{ "Las Venturas Airport",         1236.60,  1203.20,   -89.00,  1457.30,  1883.10,   110.90},
{ "Las Venturas Airport",         1457.30,  1203.20,   -89.00,  1777.30,  1883.10,   110.90},
{ "Las Venturas Airport",         1457.30,  1143.20,   -89.00,  1777.40,  1203.20,   110.90},
{ "Las Venturas Airport",         1515.80,  1586.40,   -12.50,  1729.90,  1714.50,    87.50},
{ "Last Dime Motel",              1823.00,   596.30,   -89.00,  1997.20,   823.20,   110.90},
{ "Leafy Hollow",                -1166.90, -1856.00,     0.00,  -815.60, -1602.00,   200.00},
{ "Lil' Probe Inn",                -90.20,  1286.80,    -3.00,   153.80,  1554.10,   200.00},
{ "Linden Side",                  2749.90,   943.20,   -89.00,  2923.30,  1198.90,   110.90},
{ "Linden Station",               2749.90,  1198.90,   -89.00,  2923.30,  1548.90,   110.90},
{ "Linden Station",               2811.20,  1229.50,   -39.50,  2861.20,  1407.50,    60.40},
{ "Little Mexico",                1701.90, -1842.20,   -89.00,  1812.60, -1722.20,   110.90},
{ "Little Mexico",                1758.90, -1722.20,   -89.00,  1812.60, -1577.50,   110.90},
{ "Los Flores",                   2581.70, -1454.30,   -89.00,  2632.80, -1393.40,   110.90},
{ "Los Flores",                   2581.70, -1393.40,   -89.00,  2747.70, -1135.00,   110.90},
{ "Los Santos International",     1249.60, -2394.30,   -89.00,  1852.00, -2179.20,   110.90},
{ "Los Santos International",     1852.00, -2394.30,   -89.00,  2089.00, -2179.20,   110.90},
{ "Los Santos International",     1382.70, -2730.80,   -89.00,  2201.80, -2394.30,   110.90},
{ "Los Santos International",     1974.60, -2394.30,   -39.00,  2089.00, -2256.50,    60.90},
{ "Los Santos International",     1400.90, -2669.20,   -39.00,  2189.80, -2597.20,    60.90},
{ "Los Santos International",     2051.60, -2597.20,   -39.00,  2152.40, -2394.30,    60.90},
{ "Marina",                        647.70, -1804.20,   -89.00,   851.40, -1577.50,   110.90},
{ "Marina",                        647.70, -1577.50,   -89.00,   807.90, -1416.20,   110.90},
{ "Marina",                        807.90, -1577.50,   -89.00,   926.90, -1416.20,   110.90},
{ "Market",                        787.40, -1416.20,   -89.00,  1072.60, -1310.20,   110.90},
{ "Market",                        952.60, -1310.20,   -89.00,  1072.60, -1130.80,   110.90},
{ "Market",                       1072.60, -1416.20,   -89.00,  1370.80, -1130.80,   110.90},
{ "Market",                        926.90, -1577.50,   -89.00,  1370.80, -1416.20,   110.90},
{ "Market Station",                787.40, -1410.90,   -34.10,   866.00, -1310.20,    65.80},
{ "Montgomery",                   1119.50,   119.50,    -3.00,  1451.40,   493.30,   200.00},
{ "Montgomery",                   1451.40,   347.40,    -6.10,  1582.40,   420.80,   200.00},
{ "Montgomery Intersection",      1546.60,   208.10,     0.00,  1745.80,   347.40,   200.00},
{ "Montgomery Intersection",      1582.40,   347.40,     0.00,  1664.60,   401.70,   200.00},
{ "Mulholland",                   1414.00,  -768.00,   -89.00,  1667.60,  -452.40,   110.90},
{ "Mulholland",                   1281.10,  -452.40,   -89.00,  1641.10,  -290.90,   110.90},
{ "Mulholland",                   1269.10,  -768.00,   -89.00,  1414.00,  -452.40,   110.90},
{ "Mulholland",                   1357.00,  -926.90,   -89.00,  1463.90,  -768.00,   110.90},
{ "Mulholland",                   1318.10,  -910.10,   -89.00,  1357.00,  -768.00,   110.90},
{ "Mulholland",                   1169.10,  -910.10,   -89.00,  1318.10,  -768.00,   110.90},
{ "Mulholland",                    768.60,  -954.60,   -89.00,   952.60,  -860.60,   110.90},
{ "Mulholland",                    687.80,  -860.60,   -89.00,   911.80,  -768.00,   110.90},
{ "Mulholland",                    737.50,  -768.00,   -89.00,  1142.20,  -674.80,   110.90},
{ "Mulholland",                   1096.40,  -910.10,   -89.00,  1169.10,  -768.00,   110.90},
{ "Mulholland",                    952.60,  -937.10,   -89.00,  1096.40,  -860.60,   110.90},
{ "Mulholland",                    911.80,  -860.60,   -89.00,  1096.40,  -768.00,   110.90},
{ "Mulholland",                    861.00,  -674.80,   -89.00,  1156.50,  -600.80,   110.90},
{ "Mulholland Intersection",      1463.90, -1150.80,   -89.00,  1812.60,  -768.00,   110.90},
{ "North Rock",                   2285.30,  -768.00,     0.00,  2770.50,  -269.70,   200.00},
{ "Ocean Docks",                  2373.70, -2697.00,   -89.00,  2809.20, -2330.40,   110.90},
{ "Ocean Docks",                  2201.80, -2418.30,   -89.00,  2324.00, -2095.00,   110.90},
{ "Ocean Docks",                  2324.00, -2302.30,   -89.00,  2703.50, -2145.10,   110.90},
{ "Ocean Docks",                  2089.00, -2394.30,   -89.00,  2201.80, -2235.80,   110.90},
{ "Ocean Docks",                  2201.80, -2730.80,   -89.00,  2324.00, -2418.30,   110.90},
{ "Ocean Docks",                  2703.50, -2302.30,   -89.00,  2959.30, -2126.90,   110.90},
{ "Ocean Docks",                  2324.00, -2145.10,   -89.00,  2703.50, -2059.20,   110.90},
{ "Ocean Flats",                 -2994.40,   277.40,    -9.10, -2867.80,   458.40,   200.00},
{ "Ocean Flats",                 -2994.40,  -222.50,    -0.00, -2593.40,   277.40,   200.00},
{ "Ocean Flats",                 -2994.40,  -430.20,    -0.00, -2831.80,  -222.50,   200.00},
{ "Octane Springs",                338.60,  1228.50,     0.00,   664.30,  1655.00,   200.00},
{ "Old Venturas Strip",           2162.30,  2012.10,   -89.00,  2685.10,  2202.70,   110.90},
{ "Palisades",                   -2994.40,   458.40,    -6.10, -2741.00,  1339.60,   200.00},
{ "Palomino Creek",               2160.20,  -149.00,     0.00,  2576.90,   228.30,   200.00},
{ "Paradiso",                    -2741.00,   793.40,    -6.10, -2533.00,  1268.40,   200.00},
{ "Pershing Square",              1440.90, -1722.20,   -89.00,  1583.50, -1577.50,   110.90},
{ "Pilgrim",                      2437.30,  1383.20,   -89.00,  2624.40,  1783.20,   110.90},
{ "Pilgrim",                      2624.40,  1383.20,   -89.00,  2685.10,  1783.20,   110.90},
{ "Pilson Intersection",          1098.30,  2243.20,   -89.00,  1377.30,  2507.20,   110.90},
{ "Pirates in Men's Pants",       1817.30,  1469.20,   -89.00,  2027.40,  1703.20,   110.90},
{ "Playa del Seville",            2703.50, -2126.90,   -89.00,  2959.30, -1852.80,   110.90},
{ "Prickle Pine",                 1534.50,  2583.20,   -89.00,  1848.40,  2863.20,   110.90},
{ "Prickle Pine",                 1117.40,  2507.20,   -89.00,  1534.50,  2723.20,   110.90},
{ "Prickle Pine",                 1848.40,  2553.40,   -89.00,  1938.80,  2863.20,   110.90},
{ "Prickle Pine",                 1938.80,  2624.20,   -89.00,  2121.40,  2861.50,   110.90},
{ "Queens",                      -2533.00,   458.40,     0.00, -2329.30,   578.30,   200.00},
{ "Queens",                      -2593.40,    54.70,     0.00, -2411.20,   458.40,   200.00},
{ "Queens",                      -2411.20,   373.50,     0.00, -2253.50,   458.40,   200.00},
{ "Randolph Industrial Estate",   1558.00,   596.30,   -89.00,  1823.00,   823.20,   110.90},
{ "Redsands East",                1817.30,  2011.80,   -89.00,  2106.70,  2202.70,   110.90},
{ "Redsands East",                1817.30,  2202.70,   -89.00,  2011.90,  2342.80,   110.90},
{ "Redsands East",                1848.40,  2342.80,   -89.00,  2011.90,  2478.40,   110.90},
{ "Redsands West",                1236.60,  1883.10,   -89.00,  1777.30,  2142.80,   110.90},
{ "Redsands West",                1297.40,  2142.80,   -89.00,  1777.30,  2243.20,   110.90},
{ "Redsands West",                1377.30,  2243.20,   -89.00,  1704.50,  2433.20,   110.90},
{ "Redsands West",                1704.50,  2243.20,   -89.00,  1777.30,  2342.80,   110.90},
{ "Regular Tom",                  -405.70,  1712.80,    -3.00,  -276.70,  1892.70,   200.00},
{ "Richman",                       647.50, -1118.20,   -89.00,   787.40,  -954.60,   110.90},
{ "Richman",                       647.50,  -954.60,   -89.00,   768.60,  -860.60,   110.90},
{ "Richman",                       225.10, -1369.60,   -89.00,   334.50, -1292.00,   110.90},
{ "Richman",                       225.10, -1292.00,   -89.00,   466.20, -1235.00,   110.90},
{ "Richman",                        72.60, -1404.90,   -89.00,   225.10, -1235.00,   110.90},
{ "Richman",                        72.60, -1235.00,   -89.00,   321.30, -1008.10,   110.90},
{ "Richman",                       321.30, -1235.00,   -89.00,   647.50, -1044.00,   110.90},
{ "Richman",                       321.30, -1044.00,   -89.00,   647.50,  -860.60,   110.90},
{ "Richman",                       321.30,  -860.60,   -89.00,   687.80,  -768.00,   110.90},
{ "Richman",                       321.30,  -768.00,   -89.00,   700.90,  -674.80,   110.90},
{ "Robada Intersection",         -1119.00,  1178.90,   -89.00,  -862.00,  1351.40,   110.90},
{ "Roca Escalante",               2237.40,  2202.70,   -89.00,  2536.40,  2542.50,   110.90},
{ "Roca Escalante",               2536.40,  2202.70,   -89.00,  2625.10,  2442.50,   110.90},
{ "Rockshore East",               2537.30,   676.50,   -89.00,  2902.30,   943.20,   110.90},
{ "Rockshore West",               1997.20,   596.30,   -89.00,  2377.30,   823.20,   110.90},
{ "Rockshore West",               2377.30,   596.30,   -89.00,  2537.30,   788.80,   110.90},
{ "Rodeo",                          72.60, -1684.60,   -89.00,   225.10, -1544.10,   110.90},
{ "Rodeo",                          72.60, -1544.10,   -89.00,   225.10, -1404.90,   110.90},
{ "Rodeo",                         225.10, -1684.60,   -89.00,   312.80, -1501.90,   110.90},
{ "Rodeo",                         225.10, -1501.90,   -89.00,   334.50, -1369.60,   110.90},
{ "Rodeo",                         334.50, -1501.90,   -89.00,   422.60, -1406.00,   110.90},
{ "Rodeo",                         312.80, -1684.60,   -89.00,   422.60, -1501.90,   110.90},
{ "Rodeo",                         422.60, -1684.60,   -89.00,   558.00, -1570.20,   110.90},
{ "Rodeo",                         558.00, -1684.60,   -89.00,   647.50, -1384.90,   110.90},
{ "Rodeo",                         466.20, -1570.20,   -89.00,   558.00, -1385.00,   110.90},
{ "Rodeo",                         422.60, -1570.20,   -89.00,   466.20, -1406.00,   110.90},
{ "Rodeo",                         466.20, -1385.00,   -89.00,   647.50, -1235.00,   110.90},
{ "Rodeo",                         334.50, -1406.00,   -89.00,   466.20, -1292.00,   110.90},
{ "Royal Casino",                 2087.30,  1383.20,   -89.00,  2437.30,  1543.20,   110.90},
{ "San Andreas Sound",            2450.30,   385.50,  -100.00,  2759.20,   562.30,   200.00},
{ "Santa Flora",                 -2741.00,   458.40,    -7.60, -2533.00,   793.40,   200.00},
{ "Santa Maria Beach",             342.60, -2173.20,   -89.00,   647.70, -1684.60,   110.90},
{ "Santa Maria Beach",              72.60, -2173.20,   -89.00,   342.60, -1684.60,   110.90},
{ "Shady Cabin",                 -1632.80, -2263.40,    -3.00, -1601.30, -2231.70,   200.00},
{ "Shady Creeks",                -1820.60, -2643.60,    -8.00, -1226.70, -1771.60,   200.00},
{ "Shady Creeks",                -2030.10, -2174.80,    -6.10, -1820.60, -1771.60,   200.00},
{ "Sobell Rail Yards",            2749.90,  1548.90,   -89.00,  2923.30,  1937.20,   110.90},
{ "Spinybed",                     2121.40,  2663.10,   -89.00,  2498.20,  2861.50,   110.90},
{ "Starfish Casino",              2437.30,  1783.20,   -89.00,  2685.10,  2012.10,   110.90},
{ "Starfish Casino",              2437.30,  1858.10,   -39.00,  2495.00,  1970.80,    60.90},
{ "Starfish Casino",              2162.30,  1883.20,   -89.00,  2437.30,  2012.10,   110.90},
{ "Temple",                       1252.30, -1130.80,   -89.00,  1378.30, -1026.30,   110.90},
{ "Temple",                       1252.30, -1026.30,   -89.00,  1391.00,  -926.90,   110.90},
{ "Temple",                       1252.30,  -926.90,   -89.00,  1357.00,  -910.10,   110.90},
{ "Temple",                        952.60, -1130.80,   -89.00,  1096.40,  -937.10,   110.90},
{ "Temple",                       1096.40, -1130.80,   -89.00,  1252.30, -1026.30,   110.90},
{ "Temple",                       1096.40, -1026.30,   -89.00,  1252.30,  -910.10,   110.90},
{ "The Camel's Toe",              2087.30,  1203.20,   -89.00,  2640.40,  1383.20,   110.90},
{ "The Clown's Pocket",           2162.30,  1783.20,   -89.00,  2437.30,  1883.20,   110.90},
{ "The Emerald Isle",             2011.90,  2202.70,   -89.00,  2237.40,  2508.20,   110.90},
{ "The Farm",                    -1209.60, -1317.10,   114.90,  -908.10,  -787.30,   251.90},
{ "The Four Dragons Casino",      1817.30,   863.20,   -89.00,  2027.30,  1083.20,   110.90},
{ "The High Roller",              1817.30,  1283.20,   -89.00,  2027.30,  1469.20,   110.90},
{ "The Mako Span",                1664.60,   401.70,     0.00,  1785.10,   567.20,   200.00},
{ "The Panopticon",               -947.90,  -304.30,    -1.10,  -319.60,   327.00,   200.00},
{ "The Pink Swan",                1817.30,  1083.20,   -89.00,  2027.30,  1283.20,   110.90},
{ "The Sherman Dam",              -968.70,  1929.40,    -3.00,  -481.10,  2155.20,   200.00},
{ "The Strip",                    2027.40,   863.20,   -89.00,  2087.30,  1703.20,   110.90},
{ "The Strip",                    2106.70,  1863.20,   -89.00,  2162.30,  2202.70,   110.90},
{ "The Strip",                    2027.40,  1783.20,   -89.00,  2162.30,  1863.20,   110.90},
{ "The Strip",                    2027.40,  1703.20,   -89.00,  2137.40,  1783.20,   110.90},
{ "The Visage",                   1817.30,  1863.20,   -89.00,  2106.70,  2011.80,   110.90},
{ "The Visage",                   1817.30,  1703.20,   -89.00,  2027.40,  1863.20,   110.90},
{ "Unity Station",                1692.60, -1971.80,   -20.40,  1812.60, -1932.80,    79.50},
{ "Valle Ocultado",               -936.60,  2611.40,     2.00,  -715.90,  2847.90,   200.00},
{ "Verdant Bluffs",                930.20, -2488.40,   -89.00,  1249.60, -2006.70,   110.90},
{ "Verdant Bluffs",               1073.20, -2006.70,   -89.00,  1249.60, -1842.20,   110.90},
{ "Verdant Bluffs",               1249.60, -2179.20,   -89.00,  1692.60, -1842.20,   110.90},
{ "Verdant Meadows",                37.00,  2337.10,    -3.00,   435.90,  2677.90,   200.00},
{ "Verona Beach",                  647.70, -2173.20,   -89.00,   930.20, -1804.20,   110.90},
{ "Verona Beach",                  930.20, -2006.70,   -89.00,  1073.20, -1804.20,   110.90},
{ "Verona Beach",                  851.40, -1804.20,   -89.00,  1046.10, -1577.50,   110.90},
{ "Verona Beach",                 1161.50, -1722.20,   -89.00,  1323.90, -1577.50,   110.90},
{ "Verona Beach",                 1046.10, -1722.20,   -89.00,  1161.50, -1577.50,   110.90},
{ "Vinewood",                      787.40, -1310.20,   -89.00,   952.60, -1130.80,   110.90},
{ "Vinewood",                      787.40, -1130.80,   -89.00,   952.60,  -954.60,   110.90},
{ "Vinewood",                      647.50, -1227.20,   -89.00,   787.40, -1118.20,   110.90},
{ "Vinewood",                      647.70, -1416.20,   -89.00,   787.40, -1227.20,   110.90},
{ "Whitewood Estates",             883.30,  1726.20,   -89.00,  1098.30,  2507.20,   110.90},
{ "Whitewood Estates",            1098.30,  1726.20,   -89.00,  1197.30,  2243.20,   110.90},
{ "Willowfield",                  1970.60, -2179.20,   -89.00,  2089.00, -1852.80,   110.90},
{ "Willowfield",                  2089.00, -2235.80,   -89.00,  2201.80, -1989.90,   110.90},
{ "Willowfield",                  2089.00, -1989.90,   -89.00,  2324.00, -1852.80,   110.90},
{ "Willowfield",                  2201.80, -2095.00,   -89.00,  2324.00, -1989.90,   110.90},
{ "Willowfield",                  2541.70, -1941.40,   -89.00,  2703.50, -1852.80,   110.90},
{ "Willowfield",                  2324.00, -2059.20,   -89.00,  2541.70, -1852.80,   110.90},
{ "Willowfield",                  2541.70, -2059.20,   -89.00,  2703.50, -1941.40,   110.90},
{ "Yellow Bell Station",          1377.40,  2600.40,   -21.90,  1492.40,  2687.30,    78.00},
// Main Zones
{ "Los Santos",                     44.60, -2892.90,  -242.90,  2997.00,  -768.00,   900.00},
{ "Las Venturas",                  869.40,   596.30,  -242.90,  2997.00,  2993.80,   900.00},
{ "Bone County",                  -480.50,   596.30,  -242.90,   869.40,  2993.80,   900.00},
{ "Tierra Robada",               -2997.40,  1659.60,  -242.90,  -480.50,  2993.80,   900.00},
{ "Tierra Robada",               -1213.90,   596.30,  -242.90,  -480.50,  1659.60,   900.00},
{ "San Fierro",                  -2997.40, -1115.50,  -242.90, -1213.90,  1659.60,   900.00},
{ "Red County",                  -1213.90,  -768.00,  -242.90,  2997.00,   596.30,   900.00},
{ "Flint County",                -1213.90, -2892.90,  -242.90,    44.60,  -768.00,   900.00},
{ "Whetstone",                   -2997.40, -2892.90,  -242.90, -1213.90, -1115.50,   900.00}};
enum{
	DIALOG_CARMENU,
	DIALOG_FUNCOES,
	DIALOG_SEPARAR_ITEM,
	DIALOG_VENDERCONCE,
	DIALOG_COMPRARVEICULO,
	DIALOG_COMPRAR,
	DIALOG_VENDERPLAYER,
	DIALOG_MENUCORPS,
	DIALOG_MENUORGS,
	DIALOG_CONFIGURAR,
	DIALOG_TROCARORG,
	DIALOG_VEH,
	DIALOG_TROCARCARRO,
	DIALOG_SPAWNVEH,
	DIALOG_EDITAR,
	DIALOG_SALVAROB,
	DIALOG_KICK,
	DIALOG_INUTIL,
	DIALOG_CONVIDARORG,
	DIALOG_CRIARCASA,
	DIALOG_OFCASA,
	DIALOG_TROCARNOMEORG,
	DIALOG_CHANGECOLORORG,
	DIALOG_MEDEMITIR,
	DIALOG_CRIANDOINTS,
	DIALOG_MERCADINHO,
	DIALOG_CAIXABANCO,
	DIALOG_DEPOSITARBANCO,
	DIALOG_SACARBANCO,
	DIALOG_TRANSFERIR,
	DIALOG_TERMINAR_TRANSFERENCIA,
	DIALOG_CAIXA,
	DIALOG_COMIDAS,
	DIALOG_MOCHILA,
	DIALOG_FUNCOESMOCHILA,
	DIALOG_CELULAR,
	DIALOG_WHATSSAP,
	DIALOG_GRUPOZAP,
	DIALOG_ZAPPV,
	DIALOG_MANDARMSG,
	DIALOG_CERTEZADROP,
	DIALOG_CONFIRMAR_ITEM,
	DIALOG_CARTEIRA,
	DIALOG_VERCARTEIRA,
	DIALOG_HABS,
	DIALOG_COMPRARROUPA,
	DIALOG_AJUDAGERAL,
	DIALOG_VENDERPEIXES,
	DIALOG_EMPREGOS,
	DIALOG_GPS,
	DIALOG_SELECIONAR_GPSPUBLICO,
	DIALOG_CFGRCAIXA,
	DIALOG_DELETECAIXA,
	DIALOG_SAQUE,
	DIALOG_DEPOSITAR,
	DIALOG_CONFIRMAR_TODOS,
	DIALOG_EQUIPARSKIN,
	DIALOG_MUDARESTILO,
	DIALOG_MERCADO_NEGRO,
	DIALOG_OLX,
	DIALOG_DISCAR,
	DIALOG_TELEPORT_VEH,
	DIALOG_AMMUNATION,
	DIALOG_CFGINT,
	DIALOG_MUDARNOMEINT,
	DIALOG_TROCARCORCARRO,
	DIALOG_SELECIONAR_NEGO,
	DIALOG_SELECIONAR_NEGO_2,
	DIALOG_SELECIONAR_NEGO_3,
	DIALOG_MENUVIP,
	DIALOG_COMPRARVIP,
	DIALOG_TERMINARCOMPRAVIP,
	DIALOG_TROCARNOME,
	DIALOG_TROCARNOME_2,
	DIALOG_COMPRAR_ITEM,
	DIALOG_TERMINARCOMPRA_MVIP,
	DIALOG_FUNCOESPORTAO,
	DIALOG_DEFINIRSENHA,
	DIALOG_ABRIRPORTAO,
	DIALOG_EDITARGPS,
    DIALOG_OPCOESEDIT,
    DIALOG_MUDARNOMEGPS,
    DIALOG_TROCARCORNAMETAG,
    DIALOG_NOTAADMIN,
    DIALOG_CFGCOFRE,
    DIALOG_EDITARCOFRENOME,
    DIALOG_ACEITARMEC,
    DIALOG_ACEITARTAXI,
    DIALOG_ACEITARSAMU,
    DIALOG_EMERGENCIAS,
    DIALOG_MENUCONSERTO,
    DIALOG_MECMENU,
    DIALOG_TROCARCOR,
    DIALOG_JBL,
    DIALOG_MP3,
    DIALOG_LOGARADMIN,
    DIALOG_SPAWN_HOUSE,
    DIALOG_OPCAO_CAREDIT,
    DIALOG_MOSTRARMALAS, 
    DIALOG_INPUTPLAYER,
    DIALOG_SIGLA,
    DIALOG_OUTPUTPMALAS, 
    DIALOG_ENFIARNOPM,
    DIALOG_SELECTSPAWN,
    DIALOG_PORTAMALAS_PLAYER,
    DIALOG_PORTAMULA,
    DIALOG_SUBS_MOCHILA_PM,
    DIALOG_COMPRAR_MACONHA,
    DIALOG_EQS_MAFIA,
    DIALOG_OPCAODROP,
    DIALOG_QUANTIADROP,
    DIALOG_VERRG_CARTEIRA,
    DIALOG_INFO_VERRG,
   	DIALOG_CONFIGURACAO_ORG,
	DIALOG_EDITAR_CARROS,
	DIALOG_EDITAR_VEICULO_ORG,
	DIALOG_EDITAR_SLOTCARRO,
	DIALOG_TROCARNOME_ORG,
	DIALOG_EDITARCOR_ORG,
	DIALOG_ALTERAR_ESTILO,
	DIALOG_EDITAR_VORG_COR,
	DIALOG_ESCOLHAS_PLACA,
	DIALOG_SELECTVEH_PLACA,
	DIALOG_SELECT_IPVA,
	DIALOG_NEGOCIAR_MAFIA,
	DIALOG_MACONHAS_MAFIA,
	DIALOG_COMPRAR_CARRO_ORG,
	DIALOG_VER_SALARIOS,
	DIALOG_EDITAR_SALARIO,
	DIALOG_COFREMONEY,
	DIALOG_TUNAR_OFICINA,
	DIALOG_SELECIONAR_COMPID,
	DIALOG_COMPRARCOMP,
	DIALOG_COFRECASA,
	DIALOG_COFRECASASELECT,
	DIALOG_SUBS_MOCHILA_CASA,
	DIALOG_OPCAO_HOSPITAL,
	DIALOG_ABASTECER,
	DIALOG_VER_ACCS,
	DIALOG_OPCOES_EDITAC,
	DIALOG_SUBS_LOCAL,
	DIALOG_SELECT_LOCAL_SET,
	DIALOG_COMPRAR_ACESSORIO,
	DIALOG_CONSULTA_PLACA,
	DIALOG_SELECT_MODEL_CONCE,
	DIALOG_MENU_SCRIPTER,
	DIALOG_SETAR_DINHEIRO,
	DIALOG_CONSULTARCONTA,
	DIALOG_TITULOS,
	DIALOG_TITULOPERSONALIZADO,
	DIALOG_TITULOPERSONALIZADOE,
	DIALOG_APREENDER,
	DIALOG_GENERO,
	DIALOG_OPEDITAR,
	DIALOG_LIMPAR_GRANA,
	DIALOG_VENDER_COUROS,
	DIALOG_EQUIPAMENTOCORP,
	DIALOG_EQUIPAMENTOORG,
	DIALOG_ENCHER_CAMION,
	DIALOG_CRIARCONTABANCO,
	DIALOG_BEBIDAS,
	DIALOG_QUANTIACOMPRAR,
	DIALOG_COMPRAR_EMPRESA,
	DIALOG_SACARSALARIO,
	DIALOG_SACARSALARIOBANCO,
	DIALOG_OPCOES_EMPRESA,
	DIALOG_CONFIMARVENDAEMRPESA,
	DIALOG_TROCARNOMEEMPRESA,
	DIALOG_ACHAR_NEGOEmpresa,
	DIALOG_PASSAR_EMPRESA,
	DIALOG_SENHA,
	DIALOG_TIPOSCONCE,
	DIALOG_ESCOLHER_OPCAO,
	DIALOG_FUNCOESMOCHILATD,
	DIALOG_PXVEHICLE,
	DIALOG_BUY_WHEEL,
	DIALOG_BUY_SCAPE,
	DIALOG_BUY_SPOILER,
    DIALOG_ALUGAR_CARRO,
    DIALOG_CONFIRMAR_ALUGUEL,
    DIALOG_CARMENU_ALUGUEL,
    DIALOG_FUNCOES_ALUGUEL,
    DIALOG_BUSCAR_CONTA,
    DIALOG_RETORNARBANCO,
    DIALOG_GENERO_LOGIN
};
GetVehicleName(carid){
	new modelo[32];
	switch(carid)
	{
	    case 400: modelo = "Landstalker";
	    case 522: modelo = "NRG-500";
		case 401: modelo = "Bravura";
		case 402: modelo = "Buffalo";
		case 403: modelo = "Linerunner";
		case 404: modelo = "Perrenial";
		case 405: modelo = "Sentinel";
		case 406: modelo = "Dumper";
		case 407: modelo = "Firetruck";
		case 408: modelo = "Trashmaster";
		case 409: modelo = "Stretch";
		case 410: modelo = "Manana";
		case 411: modelo = "Infernus";
		case 413: modelo = "Pony";
		case 414: modelo = "Mule";
		case 415: modelo = "Cheetah";
		case 416: modelo = "Ambulance";
		case 417: modelo = "Leviathan";
		case 418: modelo = "Moonbeam";
	    case 419: modelo = "Esperanto";
		case 420: modelo = "Taxi";
		case 421: modelo = "Washington";
		case 424: modelo = "BF";
	    case 425: modelo = "Hunter";
		case 426: modelo = "Premier";
		case 427: modelo = "Enforcer";
		case 428: modelo = "CarroForte";
		case 429: modelo = "Banshee";
		case 430: modelo = "Predator";
		case 431: modelo = "Bus";
	    case 432: modelo = "Rhino";
		case 433: modelo = "Barracks";
		case 434: modelo = "Hotknife";
		case 435: modelo = "Trailer";
		case 436: modelo = "Previon";
		case 437: modelo = "Coach";
		case 438: modelo = "Cabbie";
	    case 439: modelo = "Stallion";
		case 440: modelo = "Rumpo";
		case 441: modelo = "Bandit";
		case 442: modelo = "Romero";
		case 443: modelo = "Packer";
		case 444: modelo = "Monster";
		case 445: modelo = "Admiral";
	    case 446: modelo = "Squalo";
		case 447: modelo = "Seasparrow";
		case 448: modelo = "Pizzaboy";
		case 449: modelo = "Tram";
		case 450: modelo = "Trailer";
		case 451: modelo = "Turismo";
		case 452: modelo = "Speeder";
	    case 453: modelo = "Reefer";
		case 454: modelo = "Tropic";
		case 455: modelo = "Flatbed";
		case 456: modelo = "Yankee";
		case 457: modelo = "Caddy";
		case 458: modelo = "Solair";
		case 459: modelo = "Van";
	    case 466: modelo = "Glendale";
	    case 467: modelo = "Oceanic";
		case 469: modelo = "Sparrow";
		case 470: modelo = "Patriot";
		case 471: modelo = "Quad";
		case 472: modelo = "Coastguard";
		case 473: modelo = "Dinghy";
	    case 474: modelo = "Hermes";
		//case 475: modelo = "Sabre";
		case 476: modelo = "Rustler";
		case 477: modelo = "ZR-350";
		case 478: modelo = "Walton";
		case 479: modelo = "Regina";
		case 480: modelo = "Comet";
		case 481: modelo = "BMX";
	    case 482: modelo = "Burrito";
		//case 483: modelo = "Camper";
		case 484: modelo = "Marquis";
		case 485: modelo = "Baggage";
		case 486: modelo = "Dozer";
		case 487: modelo = "Maverick";
		case 488: modelo = "Chopper";
	    case 489: modelo = "Rancher";
		case 490: modelo = "RancherFBI";
		case 491: modelo = "Virgo";
		case 492: modelo = "Greenwood";
		case 494: modelo = "Hotring";
		case 495: modelo = "Sandking";
	    case 496: modelo = "Blista Compact";
		case 497: modelo = "Police Maverick";
		case 498: modelo = "Boxville";
		case 499: modelo = "Benson";
		//case 500: modelo = "Mesa";
		case 501: modelo = "RC Goblin";
	    case 502: modelo = "Hotring";
		case 503: modelo = "Hotring";
		case 504: modelo = "Banger";
		case 505: modelo = "Rancher";
	    case 507: modelo = "Elegant";
		case 508: modelo = "Journey";
		case 509: modelo = "Bike";
		case 510: modelo = "Mountain Bike";
		case 511: modelo = "Beagle";
		case 512: modelo = "Cropduster";
		case 513: modelo = "Stunt";
		case 514: modelo = "Tanker";
		case 515: modelo = "Roadtrain";
		case 516: modelo = "Nebula";
		case 517: modelo = "Majestic";
		case 518: modelo = "Buccaneer";
		case 519: modelo = "Shamal";
		case 520: modelo = "Hydra";
		case 521: modelo = "FCR-900";
	    case 523: modelo = "HPV1000";
		case 524: modelo = "Truck";
		case 525: modelo = "Tow Truck";
		case 526: modelo = "Fortune";
	    case 527: modelo = "Cadrona";
		case 528: modelo = "FBI Truck";
		case 529: modelo = "Willard";
		case 530: modelo = "Forklift";
		case 532: modelo = "Combe";
		case 533: modelo = "Feltzer";
	    case 534: modelo = "Remington";
		case 535: modelo = "Slamvan";
		case 536: modelo = "Blade";
		case 537: modelo = "Freight";
		case 538: modelo = "Streak";
		case 539: modelo = "Vortex";
		case 540: modelo = "Vincent";
	    case 541: modelo = "Bullet";
		case 542: modelo = "Clover";
		case 543: modelo = "Sadler";
		case 544: modelo = "Firetruck";
		//case 545: modelo = "Hustler";
		case 546: modelo = "Intruder";
		case 547: modelo = "Primo";
	    case 548: modelo = "Cargobob";
		case 549: modelo = "Tampa";
		case 550: modelo = "Sunrise";
		case 551: modelo = "Merit";
		case 552: modelo = "Utility";
		case 553: modelo = "Nevada";
		case 554: modelo = "Yosemite";
	    case 555: modelo = "Windsor";
		case 556: modelo = "Monster";
		case 557: modelo = "Monster";
		case 558: modelo = "Uranus";
		case 559: modelo = "Jester";
		case 561: modelo = "Stratium";
	    case 562: modelo = "Elegy";
		case 563: modelo = "Raindance";
		case 564: modelo = "RC Tiger";
		case 565: modelo = "Flash";
		case 566: modelo = "Tahoma";
		case 567: modelo = "Savanna";
		case 568: modelo = "Bandito";
	    case 569: modelo = "Freight Flat";
		case 570: modelo = "Streak";
		case 571: modelo = "Kart";
		case 572: modelo = "Mower";
		case 573: modelo = "Dune";
		case 574: modelo = "Sweeper";
	    case 575: modelo = "Broadway";
		case 576: modelo = "Tornado";
		case 577: modelo = "AT-400";
		case 578: modelo = "DFT-30";
		//case 579: modelo = "Huntley";
		case 581: modelo = "BF-400";
	    case 582: modelo = "News Van";
		case 583: modelo = "Tug";
		case 584: modelo = "Trailer";
		case 585: modelo = "Emperor";
		case 586: modelo = "Wayfarer";
		case 587: modelo = "Euros";
		case 588: modelo =  "Hotdog";
		case 590: modelo = "Freight Box";
		case 591: modelo = "Trailer";
		case 592: modelo = "Andromada";
		case 593: modelo = "Dodo";
		case 594: modelo = "RC Cam";
		case 595: modelo = "Launch";
		case 596: modelo = "Police Car";
	    case 597: modelo = "Police Car";
		case 598: modelo = "Police Car";
		case 599: modelo = "Ranger";
		case 600: modelo = "Picador";
		case 601: modelo = "S.W.A.T";
		case 602: modelo = "Alpha";
	    case 603: modelo = "Phoenix";
		case 604: modelo = "Glendale";
		case 605: modelo = "Sadler";
		case 606: modelo = "Luggage";
  		case 580: modelo = "Stafford";
	    case 589: modelo = "Club";
	    case 506: modelo = "Super GT";
	    case 531: modelo = "Trator";
	    case 462: modelo = "Faggio";
	    //case 410: modelo = "{FF8080}Manana";
	    case 412: modelo = "VooDoo";
		case 468: modelo = "Sanchez";
		//case 551: modelo = "{FF8080}Merit";
		//case 445: modelo = "{FF8080}Admiral";
		case 579: modelo = "Huntley";
		case 463: modelo = "Freeway";
		case 475: modelo = "Sabre";
		case 483: modelo = "Camper";
		case 500: modelo = "Mesa";
		case 461: modelo = "PCJ-600";
		case 560: modelo = "Sultan";
		case 545: modelo = "Hustler";
		default: modelo = "Desconhecido";
	}
	return modelo;
}
new
	// List of valid modifications per vehicle model.
	s_ValidComponentArray[][] = {
		{400,  1024, 1021, 1020, 1019, 1018, 1013, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{401,  1145, 1144, 1143, 1142, 1020, 1019, 1017, 1013, 1007, 1006, 1005, 1004, 1003, 1001, 0000, 0000, 0000, 0000},
		{402,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{403,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{404,  1021, 1020, 1019, 1017, 1016, 1013, 1007, 1002, 1000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{405,  1023, 1021, 1020, 1019, 1018, 1014, 1001, 1000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{406,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{407,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{408,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{409,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{410,  1024, 1023, 1021, 1020, 1019, 1017, 1013, 1007, 1003, 1001, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{411,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{412,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{413,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{414,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{415,  1023, 1019, 1018, 1017, 1007, 1003, 1001, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{416,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{417,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{418,  1021, 1020, 1016, 1006, 1002, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{419,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{420,  1021, 1019, 1005, 1004, 1003, 1001, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{421,  1023, 1021, 1020, 1019, 1018, 1016, 1014, 1000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{422,  1021, 1020, 1019, 1017, 1013, 1007, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{423,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{424,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{425,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{426,  1021, 1019, 1006, 1005, 1004, 1003, 1001, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{427,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{428,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{429,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{430,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{431,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{432,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{433,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{434,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{435,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{436,  1022, 1021, 1020, 1019, 1017, 1013, 1007, 1006, 1003, 1001, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{437,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{438,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{439,  1145, 1144, 1143, 1142, 1023, 1017, 1013, 1007, 1003, 1001, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{440,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{441,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{442,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{443,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{444,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{445,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{446,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{447,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{448,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{449,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{450,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{451,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{452,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{453,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{454,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{455,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{456,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{457,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{458,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{459,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{460,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{461,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{462,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{463,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{464,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{465,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{466,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{467,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{468,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{469,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{470,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{471,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{472,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{473,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{474,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{475,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{476,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{477,  1021, 1020, 1019, 1018, 1017, 1007, 1006, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{478,  1024, 1022, 1021, 1020, 1013, 1012, 1005, 1004, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{479,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{480,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{481,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{482,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{483,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{484,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{485,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{486,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{487,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{488,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{489,  1024, 1020, 1019, 1018, 1016, 1013, 1006, 1005, 1004, 1002, 1000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{490,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{491,  1145, 1144, 1143, 1142, 1023, 1021, 1020, 1019, 1018, 1017, 1014, 1007, 1003, 0000, 0000, 0000, 0000, 0000},
		{492,  1016, 1006, 1005, 1004, 1000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{493,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{494,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{495,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{496,  1143, 1142, 1023, 1020, 1019, 1017, 1011, 1007, 1006, 1003, 1002, 1001, 0000, 0000, 0000, 0000, 0000, 0000},
		{497,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{498,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{499,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{500,  1024, 1021, 1020, 1019, 1013, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{501,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{502,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{503,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{504,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{505,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{506,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{507,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{508,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{509,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{510,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{511,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{512,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{513,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{514,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{515,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{516,  1021, 1020, 1019, 1018, 1017, 1016, 1015, 1007, 1004, 1002, 1000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{517,  1145, 1144, 1143, 1142, 1023, 1020, 1019, 1018, 1017, 1016, 1007, 1003, 1002, 0000, 0000, 0000, 0000, 0000},
		{518,  1145, 1144, 1143, 1142, 1023, 1020, 1018, 1017, 1013, 1007, 1006, 1005, 1003, 1001, 0000, 0000, 0000, 0000},
		{519,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{520,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{521,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{522,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{523,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{524,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{525,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{526,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{527,  1021, 1020, 1018, 1017, 1015, 1014, 1007, 1001, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{528,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{529,  1023, 1020, 1019, 1018, 1017, 1012, 1011, 1007, 1006, 1003, 1001, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{530,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{531,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{532,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{533,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{534,  1185, 1180, 1179, 1178, 1127, 1126, 1125, 1124, 1123, 1122, 1106, 1101, 1100, 0000, 0000, 0000, 0000, 0000},
		{535,  1121, 1120, 1119, 1118, 1117, 1116, 1115, 1114, 1113, 1110, 1109, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{536,  1184, 1183, 1182, 1181, 1128, 1108, 1107, 1105, 1104, 1103, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{537,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{538,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{539,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{540,  1145, 1144, 1143, 1142, 1024, 1023, 1020, 1019, 1018, 1017, 1007, 1006, 1004, 1001, 0000, 0000, 0000, 0000},
		{541,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{542,  1145, 1144, 1021, 1020, 1019, 1018, 1015, 1014, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{543,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{544,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{545,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{546,  1145, 1144, 1143, 1142, 1024, 1023, 1019, 1018, 1017, 1007, 1006, 1004, 1002, 1001, 0000, 0000, 0000, 0000},
		{547,  1143, 1142, 1021, 1020, 1019, 1018, 1016, 1003, 1000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{548,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{549,  1145, 1144, 1143, 1142, 1023, 1020, 1019, 1018, 1017, 1012, 1011, 1007, 1003, 1001, 0000, 0000, 0000, 0000},
		{550,  1145, 1144, 1143, 1142, 1023, 1020, 1019, 1018, 1006, 1005, 1004, 1003, 1001, 0000, 0000, 0000, 0000, 0000},
		{551,  1023, 1021, 1020, 1019, 1018, 1016, 1006, 1005, 1003, 1002, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{552,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{553,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{554,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{555,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{556,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{557,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{558,  1168, 1167, 1166, 1165, 1164, 1163, 1095, 1094, 1093, 1092, 1091, 1090, 1089, 1088, 0000, 0000, 0000, 0000},
		{559,  1173, 1162, 1161, 1160, 1159, 1158, 1072, 1071, 1070, 1069, 1068, 1067, 1066, 1065, 0000, 0000, 0000, 0000},
		{560,  1170, 1169, 1141, 1140, 1139, 1138, 1033, 1032, 1031, 1030, 1029, 1028, 1027, 1026, 0000, 0000, 0000, 0000},
		{561,  1157, 1156, 1155, 1154, 1064, 1063, 1062, 1061, 1060, 1059, 1058, 1057, 1056, 1055, 0000, 0000, 0000, 0000},
		{562,  1172, 1171, 1149, 1148, 1147, 1146, 1041, 1040, 1039, 1038, 1037, 1036, 1035, 1034, 0000, 0000, 0000, 0000},
		{563,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{564,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{565,  1153, 1152, 1151, 1150, 1054, 1053, 1052, 1051, 1050, 1049, 1048, 1047, 1046, 1045, 0000, 0000, 0000, 0000},
		{566,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{567,  1189, 1188, 1187, 1186, 1133, 1132, 1131, 1130, 1129, 1102, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{568,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{569,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{570,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{571,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{572,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{573,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{574,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{575,  1177, 1176, 1175, 1174, 1099, 1044, 1043, 1042, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{576,  1193, 1192, 1191, 1190, 1137, 1136, 1135, 1134, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{577,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{578,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{579,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{580,  1023, 1020, 1018, 1017, 1007, 1006, 1001, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{581,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{582,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{583,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{584,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{585,  1145, 1144, 1143, 1142, 1020, 1019, 1018, 1013, 1006, 1001, 1023, 1003, 1007, 1017, 0000, 0000, 0000, 0000},
		{586,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{587,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{588,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{589,  1145, 1144, 1024, 1020, 1018, 1017, 1016, 1013, 1007, 1006, 1005, 1004, 1000, 0000, 0000, 0000, 0000, 0000},
		{590,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{591,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{592,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{593,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{594,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{595,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{596,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{597,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{598,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{599,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{600,  1022, 1020, 1018, 1017, 1013, 1007, 1006, 1005, 1004, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{601,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{602,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{603,  1145, 1144, 1143, 1142, 1024, 1023, 1020, 1019, 1018, 1017, 1007, 1006, 1001, 0000, 0000, 0000, 0000, 0000},
		{604,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{605,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{606,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{607,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{608,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{609,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{610,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000},
		{611,  0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000}
};
stock IsValidComponentForVehicle(vehicleid, componentid)
{
	new modelid = GetVehicleModel(vehicleid);

	// Check for nitrous, wheels, and hydraulics.
	if ((1008 <= componentid <= 1010) || (componentid == 1025) || (1073 <= componentid <= 1087) || (1096 <= componentid <= 1098))
	{
		switch (modelid)
		{
			case 581, 523, 462, 521, 463, 522, 461, 448, 468, 586, 509, 481, 510, 472, 473, 493, 595, 484, 430, 453, 452, 446, 454, 590, 569, 537, 538, 570, 449:
			{
				return false;
			}
			default:
			{
				return true;
			}
		}
	}
	else
	{
		modelid -= 400;
	
		for (new i = 0; i < sizeof(s_ValidComponentArray[]); i ++)
		{
			if (s_ValidComponentArray[modelid][i] == componentid)
			{
				return true;
			}
		}
	}
	return false;
}
RemoveBuilding(playerid){
	//ADA
	RemoveBuildingForPlayer(playerid, 3654, 2428.2188, -1290.5859, 26.1875, 0.25);
	RemoveBuildingForPlayer(playerid, 3647, 2428.0781, -1273.6641, 26.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 3654, 2395.0078, -1278.3750, 25.9688, 0.25);
	RemoveBuildingForPlayer(playerid, 3647, 2395.2578, -1347.4609, 26.3203, 0.25);
	RemoveBuildingForPlayer(playerid, 3650, 2426.5547, -1321.8984, 26.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 3650, 2426.5547, -1304.5781, 26.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 3706, 2394.4375, -1327.1172, 25.9609, 0.25);
	RemoveBuildingForPlayer(playerid, 3706, 2390.1094, -1365.0078, 25.3281, 0.25);
	RemoveBuildingForPlayer(playerid, 3648, 2395.2578, -1347.4609, 26.3203, 0.25);
	RemoveBuildingForPlayer(playerid, 3646, 2390.1094, -1365.0078, 25.3281, 0.25);
	RemoveBuildingForPlayer(playerid, 3646, 2394.4375, -1327.1172, 25.9609, 0.25);
	RemoveBuildingForPlayer(playerid, 3649, 2395.0078, -1278.3750, 25.9688, 0.25);
	RemoveBuildingForPlayer(playerid, 3651, 2426.5547, -1321.8984, 26.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 3651, 2426.5547, -1304.5781, 26.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 3649, 2428.2188, -1290.5859, 26.1875, 0.25);
	RemoveBuildingForPlayer(playerid, 3648, 2428.0781, -1273.6641, 26.0000, 0.25);
	// TCP
	RemoveBuildingForPlayer(playerid, 5317, 2264.2109, -1953.2188, 15.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 3748, 2238.2188, -1916.1094, 15.1875, 0.25);
	RemoveBuildingForPlayer(playerid, 3748, 2261.4609, -1916.0313, 15.1875, 0.25);
	RemoveBuildingForPlayer(playerid, 3748, 2284.7031, -1915.8750, 15.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 3748, 2333.3984, -1892.8359, 15.2500, 0.25);
	RemoveBuildingForPlayer(playerid, 3748, 2333.4063, -1933.9609, 15.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1266, 2300.3281, -1954.5469, 21.8281, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 2231.1172, -1962.8359, 11.5156, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 2256.0156, -1962.7422, 11.5156, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 2285.9063, -1962.8594, 11.5156, 0.25);
	RemoveBuildingForPlayer(playerid, 5309, 2264.2109, -1953.2188, 15.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1635, 2230.1797, -1943.5469, 17.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 5266, 2278.0000, -1942.8672, 20.0781, 0.25);
	RemoveBuildingForPlayer(playerid, 1635, 2268.8906, -1943.5781, 17.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 1260, 2300.3281, -1954.5469, 21.8281, 0.25);
	RemoveBuildingForPlayer(playerid, 673, 2229.1016, -1928.7578, 11.4453, 0.25);
	RemoveBuildingForPlayer(playerid, 3628, 2238.2188, -1916.1094, 15.1875, 0.25);
	RemoveBuildingForPlayer(playerid, 3628, 2261.4609, -1916.0313, 15.1875, 0.25);
	RemoveBuildingForPlayer(playerid, 3628, 2284.7031, -1915.8750, 15.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2221.5938, -1905.4922, 15.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1635, 2302.1016, -1958.6563, 17.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 3628, 2333.4063, -1933.9609, 15.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 3628, 2333.3984, -1892.8359, 15.2500, 0.25);
	// milicia nova base la perto do puteiro
	RemoveBuildingForPlayer(playerid, 3654, 2428.2188, -1290.5859, 26.1875, 0.25);
	RemoveBuildingForPlayer(playerid, 3647, 2428.0781, -1273.6641, 26.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 3654, 2395.0078, -1278.3750, 25.9688, 0.25);
	RemoveBuildingForPlayer(playerid, 3647, 2395.2578, -1347.4609, 26.3203, 0.25);
	RemoveBuildingForPlayer(playerid, 3650, 2426.5547, -1321.8984, 26.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 3650, 2426.5547, -1304.5781, 26.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 3706, 2394.4375, -1327.1172, 25.9609, 0.25);
	RemoveBuildingForPlayer(playerid, 3706, 2390.1094, -1365.0078, 25.3281, 0.25);
	RemoveBuildingForPlayer(playerid, 3648, 2395.2578, -1347.4609, 26.3203, 0.25);
	RemoveBuildingForPlayer(playerid, 3646, 2390.1094, -1365.0078, 25.3281, 0.25);
	RemoveBuildingForPlayer(playerid, 3646, 2394.4375, -1327.1172, 25.9609, 0.25);
	RemoveBuildingForPlayer(playerid, 3649, 2395.0078, -1278.3750, 25.9688, 0.25);
	RemoveBuildingForPlayer(playerid, 3651, 2426.5547, -1321.8984, 26.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 3651, 2426.5547, -1304.5781, 26.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 3649, 2428.2188, -1290.5859, 26.1875, 0.25);
	RemoveBuildingForPlayer(playerid, 3648, 2428.0781, -1273.6641, 26.0000, 0.25);
	//estufa de maconha
	RemoveBuildingForPlayer(playerid, 7172, 2546.0313, 2828.7344, 11.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 961, 2570.7344, 2829.7734, 11.1719, 0.25);
	RemoveBuildingForPlayer(playerid, 960, 2570.7344, 2829.7734, 11.1641, 0.25);
	RemoveBuildingForPlayer(playerid, 961, 2590.1406, 2816.3516, 10.2109, 0.25);
	RemoveBuildingForPlayer(playerid, 960, 2590.1406, 2816.3516, 10.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 961, 2590.8594, 2815.1094, 10.2109, 0.25);
	RemoveBuildingForPlayer(playerid, 960, 2590.8594, 2815.1094, 10.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 960, 2590.6328, 2815.5938, 11.1641, 0.25);
	RemoveBuildingForPlayer(playerid, 961, 2590.6328, 2815.5938, 11.1641, 0.25);
	RemoveBuildingForPlayer(playerid, 625, 1879.0547, 698.9141, 10.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 625, 1879.0547, 710.3359, 10.7109, 0.25);
	// Favelinha Aeroporto
	RemoveBuildingForPlayer(playerid, 3667, 1904.8047, -1991.7422, 15.1250, 0.25);
	RemoveBuildingForPlayer(playerid, 3667, 1907.6328, -2025.9375, 15.1328, 0.25);
	RemoveBuildingForPlayer(playerid, 3667, 1858.6328, -2025.9375, 15.2109, 0.25);
	RemoveBuildingForPlayer(playerid, 3667, 1861.4453, -1991.7500, 15.2109, 0.25);
	RemoveBuildingForPlayer(playerid, 3667, 1826.6016, -1989.6094, 15.2109, 0.25);
	RemoveBuildingForPlayer(playerid, 1531, 1889.2422, -1982.5078, 15.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 3588, 1826.6016, -1989.6094, 15.2109, 0.25);
	RemoveBuildingForPlayer(playerid, 3588, 1858.6328, -2025.9375, 15.2109, 0.25);
	RemoveBuildingForPlayer(playerid, 3588, 1861.4453, -1991.7500, 15.2109, 0.25);
	RemoveBuildingForPlayer(playerid, 4982, 1892.5391, -2012.8281, 21.3750, 0.25);
	RemoveBuildingForPlayer(playerid, 5086, 1892.5391, -2012.8281, 21.3750, 0.25);
	RemoveBuildingForPlayer(playerid, 3588, 1904.8047, -1991.7422, 15.1250, 0.25);
	RemoveBuildingForPlayer(playerid, 3588, 1907.6328, -2025.9375, 15.1328, 0.25);
	// fabrica de drogas K.A.C.C
	RemoveBuildingForPlayer(playerid, 985, 2497.4063, 2777.0703, 11.5313, 0.25);
	RemoveBuildingForPlayer(playerid, 986, 2497.4063, 2769.1094, 11.5313, 0.25);

	// conce nova
	//RemoveBuildingForPlayer(playerid, 6357, 505.053, -1269.937, 28.687, 0.250);
	//==== mecanica do douglas perto posto
	RemoveBuildingForPlayer(playerid, 1412, 1917.3203, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1912.0547, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1906.7734, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1927.8516, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1922.5859, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1938.3906, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1933.1250, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1948.9844, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1943.6875, -1797.4219, 13.8125, 0.25);	
	// pref / guaritas douglas
	RemoveBuildingForPlayer(playerid, 1283, 1753.4453, -1610.8281, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1835.9063, -1461.4063, 15.7422, 0.25);
	// Base Do Exercito por souza
    RemoveBuildingForPlayer(playerid, 8272, 1285.5469, 1669.3359, 12.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, 347.1953, 1799.2656, 18.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, 342.9375, 1796.2891, 18.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 16670, 330.7891, 1813.2188, 17.8281, 0.25);
	RemoveBuildingForPlayer(playerid, 3279, 113.3828, 1814.4531, 16.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 16640, 263.4297, 1840.7891, 7.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 16094, 191.1406, 1870.0391, 21.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3279, 103.8906, 1901.1016, 16.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 16096, 120.5078, 1934.0313, 19.8281, 0.25);
	RemoveBuildingForPlayer(playerid, 3279, 161.9063, 1933.0938, 16.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 16671, 193.9531, 2051.7969, 20.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 16668, 357.9375, 2049.4219, 16.8438, 0.25);
	RemoveBuildingForPlayer(playerid, 16669, 380.2578, 1914.9609, 17.4297, 0.25);
	// emprego TRANSP_ARMA ( borges )
	RemoveBuildingForPlayer(playerid, 3291, 2371.4922, -2114.9766, 13.4922, 0.25);
	RemoveBuildingForPlayer(playerid, 3686, 2396.8750, -2126.5000, 16.0469, 0.25);
	RemoveBuildingForPlayer(playerid, 3627, 2396.8750, -2126.5000, 16.0469, 0.25);
	RemoveBuildingForPlayer(playerid, 5294, 2348.8750, -2119.9219, 24.8984, 0.25);
	RemoveBuildingForPlayer(playerid, 3255, 2371.4922, -2114.9766, 13.4922, 0.25);
	// pedagio douglas
	RemoveBuildingForPlayer(playerid, 1290, 1750.109, 556.546, 31.038, 0.250);
	// casinha no madeireiro
	RemoveBuildingForPlayer(playerid, 3253, -420.3594, -1756.2188, 5.2188, 0.25);
	// 24/7 las colinas
	RemoveBuildingForPlayer(playerid, 5852, 1315.3672, -887.4688, 41.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 1522, 1314.7266, -897.2656, 38.4688, 0.25);
	RemoveBuildingForPlayer(playerid, 5762, 1315.3672, -887.4688, 41.7031, 0.25);
	// spawn
	RemoveBuildingForPlayer(playerid, 1215, 379.5938, -2030.3359, 7.3750, 0.25);

	RemoveBuildingForPlayer(playerid, 3276, -182.9531, -1146.2891, 4.1641, 0.25);
	RemoveBuildingForPlayer(playerid, 3276, -192.7266, -1142.4922, 3.7891, 0.25);
	RemoveBuildingForPlayer(playerid, 3276, -203.6172, -1138.7500, 3.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 3276, -172.2344, -1149.7734, 3.9609, 0.25);
}
/*CMD:abrirporta(playerid, params[])
{
	if(!IsPlayerInAnyVehicle(playerid)) return 1;
	if(isnull(params)) return SendClientMessage(playerid, -1, "USAGE: /abrirporta [ 1 - 4]");
	new vehicleid = GetPlayerVehicleID(playerid);
	switch(strval(params)){
		case 1: OpenVehicleDoor(vehicleid, FL_DOOR);
		case 2: OpenVehicleDoor(vehicleid, FR_DOOR);
		//if(IsVehicleDoorOpened(vehicleid, FR_DOOR)) return SendClientMessage(playerid, -1, "Error: door is already opened.");
		case 3: OpenVehicleDoor(vehicleid, BL_DOOR);
		//if(IsVehicleDoorOpened(vehicleid, BR_DOOR)) return SendClientMessage(playerid, -1, "Error: door is already opened.");
		case 4: OpenVehicleDoor(vehicleid, BR_DOOR);
	}
	SCM(playerid, LIGHTRED, "* Esta porta foi aberta.");
	return 1;
}//CloseVehicleDoor
CMD:fecharporta(playerid, params[])
{
	if(!IsPlayerInAnyVehicle(playerid)) return 1;
	if(isnull(params)) return SendClientMessage(playerid, -1, "USAGE: /fecharporta [ 1 - 4]");
	new vehicleid = GetPlayerVehicleID(playerid);
	switch(strval(params)){

		case 1: CloseVehicleDoor(vehicleid, FL_DOOR);
		case 2: CloseVehicleDoor(vehicleid, FR_DOOR);
		//if(IsVehicleDoorOpened(vehicleid, FR_DOOR)) return SendClientMessage(playerid, -1, "Error: door is already opened.");
		case 3: CloseVehicleDoor(vehicleid, BL_DOOR);
		//if(IsVehicleDoorOpened(vehicleid, BR_DOOR)) return SendClientMessage(playerid, -1, "Error: door is already opened.");
		case 4: CloseVehicleDoor(vehicleid, BR_DOOR);
		default: return 1;
	}
	SCM(playerid, LIGHTRED, "* Esta porta foi fechada.");
	return 1;
}
CMD:abrirjanela(playerid, params[])
{
	if(!IsPlayerInAnyVehicle(playerid)) return 1;
	if(isnull(params)) 
	{
		SendClientMessage(playerid, -1, "USAGE: /abrirjanela [ 1 - 4 ]");
		return 1;
	}
	new vehicleid = GetPlayerVehicleID(playerid);
	//if(IsVehicleWindowClosed(vehicleid, FR_DOOR))
	switch(strval(params)){
		case 1: OpenVehicleWindow(vehicleid, FL_DOOR);
		case 2: OpenVehicleWindow(vehicleid, FR_DOOR);
		case 3: OpenVehicleWindow(vehicleid, BL_DOOR);
		case 4: OpenVehicleWindow(vehicleid, BR_DOOR);
		default: return 1;
	}
	SCM(playerid, LIGHTRED, "* Esta janela foi aberta.");
	return 1;
}
CMD:fecharjanela(playerid, params[])
{
	if(!IsPlayerInAnyVehicle(playerid)) return 1;
	if(isnull(params)) 
	{
		SendClientMessage(playerid, -1, "USAGE: /fecharjanela [ 1 - 4 ]");
		return 1;
	}
	new vehicleid = GetPlayerVehicleID(playerid);
	//if(IsVehicleWindowClosed(vehicleid, FR_DOOR))
	switch(strval(params)){
		case 1: CloseVehicleWindow(vehicleid, FL_DOOR);
		case 2: CloseVehicleWindow(vehicleid, FR_DOOR);
		case 3: CloseVehicleWindow(vehicleid, BL_DOOR);
		case 4: CloseVehicleWindow(vehicleid, BR_DOOR);
		default: return 1;
	}
	SCM(playerid, LIGHTRED, "* Esta janela foi fechada.");
	return 1;
}*/