Content-Type: multipart/mixed; boundary="===============4812479304146721158=="
MIME-Version: 1.0
From: Yuanhan Liu <yuanhan.liu@linux.intel.com>
To: lkp@lists.01.org
Subject: [sched] 3bb1e2aecc8: -5.3% aim9.div_int.ops_per_sec
Date: Thu, 30 Apr 2015 12:10:29 +0800
Message-ID: <20150430041029.GB9795@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4812479304146721158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.linaro.org/people/vincent.guittot/kernel.git test-sched-tasks-p=
acking
commit 3bb1e2aecc81817e158bead697bf133aa42e24e1 ("sched: ensure periodic up=
date of load tracking and buddy state")


testbox/testcase/testparams: lkp-wsx02/aim9/performance-300s-div_int

4ddbf3b0f1f755a5  3bb1e2aecc81817e158bead697  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

    232405 =C2=B1  0%      -5.3%     220054 =C2=B1  0%  aim9.div_int.ops_pe=
r_sec
      1192 =C2=B1  0%     +88.2%       2244 =C2=B1  0%  vmstat.system.in
     87308 =C2=B1 35%    +518.1%     539648 =C2=B1 27%  softirqs.SCHED
       926 =C2=B1 10%  +24172.2%     224760 =C2=B1  5%  cpuidle.C3-NHM.usage
    311418 =C2=B1  1%     +30.1%     405196 =C2=B1  2%  cpuidle.C6-NHM.usage
     27358 =C2=B1  6%      -7.8%      25224 =C2=B1  3%  numa-meminfo.node0.=
SUnreclaim
     31180 =C2=B1  9%     -14.3%      26709 =C2=B1  9%  numa-meminfo.node2.=
Active
     30879 =C2=B1  0%     -36.2%      19701 =C2=B1  9%  numa-vmstat.node0.n=
uma_other
      6839 =C2=B1  6%      -7.8%       6305 =C2=B1  3%  numa-vmstat.node0.n=
r_slab_unreclaimable
     44385 =C2=B1  0%     -13.1%      38577 =C2=B1  4%  numa-vmstat.node1.n=
uma_other
    199019 =C2=B1  2%     -12.4%     174421 =C2=B1  4%  numa-vmstat.node2.n=
uma_local
     14213 =C2=B1  0%    +130.1%      32701 =C2=B1  5%  numa-vmstat.node2.n=
uma_other
     10493 =C2=B1 23%     -66.4%       3523 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
      1695 =C2=B1  6%     -27.4%       1231 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
      1642 =C2=B1  7%     -23.4%       1258 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
      9460 =C2=B1 24%     -65.1%       3305 =C2=B1  2%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
      1644 =C2=B1  7%     -23.3%       1262 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
      9449 =C2=B1 24%     -65.1%       3299 =C2=B1  2%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
      1644 =C2=B1  7%     -23.0%       1266 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
      9394 =C2=B1 23%     -64.9%       3296 =C2=B1  2%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
      5918 =C2=B1 11%     -60.7%       2327 =C2=B1 18%  sched_debug.cfs_rq[=
13]:/.exec_clock
      9600 =C2=B1 15%     -40.1%       5745 =C2=B1 27%  sched_debug.cfs_rq[=
13]:/.min_vruntime
      1635 =C2=B1  6%     -22.3%       1270 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
      9255 =C2=B1 23%     -64.3%       3304 =C2=B1  2%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
      1625 =C2=B1  6%     -21.7%       1273 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
      8926 =C2=B1 23%     -63.0%       3299 =C2=B1  2%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
      1609 =C2=B1  5%     -20.7%       1275 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
      8537 =C2=B1 22%     -61.4%       3294 =C2=B1  2%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
      1588 =C2=B1  4%     -19.6%       1277 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.tg->runnable_avg
      8275 =C2=B1 21%     -60.3%       3288 =C2=B1  2%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
      1589 =C2=B1  4%     -19.5%       1279 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.tg->runnable_avg
      8159 =C2=B1 20%     -59.7%       3286 =C2=B1  2%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
         2 =C2=B1 19%    +144.4%          5 =C2=B1 47%  sched_debug.cfs_rq[=
18]:/.nr_spread_over
      1593 =C2=B1  4%     -19.5%       1283 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.tg->runnable_avg
      8171 =C2=B1 19%     -59.7%       3294 =C2=B1  1%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
      1597 =C2=B1  4%     -19.6%       1285 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.tg->runnable_avg
      8186 =C2=B1 19%     -60.0%       3271 =C2=B1  1%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
       361 =C2=B1 13%    +483.4%       2108 =C2=B1 37%  sched_debug.cfs_rq[=
1]:/.exec_clock
      1704 =C2=B1  6%     -27.1%       1242 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
     10497 =C2=B1 23%     -67.3%       3431 =C2=B1  3%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
      8195 =C2=B1 19%     -60.1%       3270 =C2=B1  1%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
       206 =C2=B1 28%     -37.7%        128 =C2=B1 38%  sched_debug.cfs_rq[=
20]:/.avg->runnable_avg_sum
      1600 =C2=B1  4%     -19.6%       1286 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.tg->runnable_avg
      8163 =C2=B1 20%     -59.9%       3270 =C2=B1  1%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
      1602 =C2=B1  4%     -19.5%       1290 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.tg->runnable_avg
      8153 =C2=B1 20%     -59.9%       3265 =C2=B1  1%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
      1604 =C2=B1  5%     -19.5%       1292 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.tg->runnable_avg
      8146 =C2=B1 21%     -59.9%       3264 =C2=B1  1%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
      1607 =C2=B1  5%     -19.3%       1297 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.tg->runnable_avg
      1610 =C2=B1  5%     -19.1%       1302 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.tg->runnable_avg
      8113 =C2=B1 21%     -59.8%       3264 =C2=B1  1%  sched_debug.cfs_rq[=
24]:/.tg_load_avg
      1611 =C2=B1  5%     -18.8%       1307 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.tg->runnable_avg
      8032 =C2=B1 21%     -59.4%       3258 =C2=B1  1%  sched_debug.cfs_rq[=
25]:/.tg_load_avg
      7994 =C2=B1 21%     -59.3%       3256 =C2=B1  1%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
      1612 =C2=B1  5%     -18.7%       1310 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.tg->runnable_avg
      1614 =C2=B1  5%     -18.7%       1312 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.tg->runnable_avg
      7970 =C2=B1 21%     -59.2%       3252 =C2=B1  1%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
      1616 =C2=B1  5%     -18.7%       1314 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.tg->runnable_avg
         3 =C2=B1 33%     -66.7%          1 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.nr_spread_over
      7949 =C2=B1 21%     -58.9%       3264 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
      7945 =C2=B1 21%     -58.9%       3265 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
      1620 =C2=B1  5%     -18.7%       1317 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.tg->runnable_avg
     10485 =C2=B1 23%     -67.4%       3415 =C2=B1  3%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
      1705 =C2=B1  6%     -27.1%       1243 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
      1625 =C2=B1  5%     -18.8%       1320 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.tg->runnable_avg
      7934 =C2=B1 21%     -58.9%       3264 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
      1618 =C2=B1  5%     -18.3%       1322 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.tg->runnable_avg
      4732 =C2=B1 46%     -66.2%       1601 =C2=B1 33%  sched_debug.cfs_rq[=
31]:/.min_vruntime
      7843 =C2=B1 20%     -58.6%       3250 =C2=B1  1%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
      7714 =C2=B1 19%     -57.8%       3257 =C2=B1  1%  sched_debug.cfs_rq[=
32]:/.tg_load_avg
      1609 =C2=B1  4%     -17.7%       1325 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.tg->runnable_avg
      2833 =C2=B1 24%     -51.5%       1374 =C2=B1 43%  sched_debug.cfs_rq[=
33]:/.min_vruntime
      1606 =C2=B1  4%     -17.3%       1328 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.tg->runnable_avg
      7701 =C2=B1 19%     -57.8%       3253 =C2=B1  1%  sched_debug.cfs_rq[=
33]:/.tg_load_avg
      1607 =C2=B1  5%     -17.2%       1331 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.tg->runnable_avg
      3932 =C2=B1 21%     -50.5%       1947 =C2=B1 34%  sched_debug.cfs_rq[=
34]:/.min_vruntime
      7637 =C2=B1 19%     -57.6%       3239 =C2=B1  1%  sched_debug.cfs_rq[=
34]:/.tg_load_avg
      1608 =C2=B1  4%     -17.1%       1334 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.tg->runnable_avg
      7544 =C2=B1 19%     -57.1%       3239 =C2=B1  1%  sched_debug.cfs_rq[=
35]:/.tg_load_avg
    142.09 =C2=B1 13%     -34.2%      93.44 =C2=B1 36%  sched_debug.cfs_rq[=
35]:/.exec_clock
      1608 =C2=B1  4%     -16.9%       1336 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.tg->runnable_avg
      7508 =C2=B1 19%     -57.0%       3225 =C2=B1  2%  sched_debug.cfs_rq[=
36]:/.tg_load_avg
      7418 =C2=B1 20%     -56.6%       3221 =C2=B1  2%  sched_debug.cfs_rq[=
37]:/.tg_load_avg
      1601 =C2=B1  4%     -16.2%       1342 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.tg->runnable_avg
      1602 =C2=B1  4%     -16.0%       1347 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.tg->runnable_avg
         2 =C2=B1 30%     -63.6%          1 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.nr_spread_over
      7301 =C2=B1 21%     -55.8%       3225 =C2=B1  2%  sched_debug.cfs_rq[=
38]:/.tg_load_avg
      7113 =C2=B1 21%     -54.7%       3219 =C2=B1  3%  sched_debug.cfs_rq[=
39]:/.tg_load_avg
      1595 =C2=B1  4%     -15.3%       1351 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.tg->runnable_avg
      1707 =C2=B1  6%     -27.1%       1244 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
     10483 =C2=B1 23%     -67.5%       3408 =C2=B1  3%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
      7012 =C2=B1 21%     -54.2%       3211 =C2=B1  3%  sched_debug.cfs_rq[=
40]:/.tg_load_avg
      1592 =C2=B1  4%     -14.9%       1354 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.tg->runnable_avg
      6804 =C2=B1 21%     -53.0%       3201 =C2=B1  4%  sched_debug.cfs_rq[=
41]:/.tg_load_avg
      1581 =C2=B1  4%     -14.1%       1357 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.tg->runnable_avg
      1579 =C2=B1  4%     -13.8%       1361 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.tg->runnable_avg
      6611 =C2=B1 23%     -51.4%       3213 =C2=B1  5%  sched_debug.cfs_rq[=
42]:/.tg_load_avg
      1578 =C2=B1  3%     -13.5%       1366 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.tg->runnable_avg
      6477 =C2=B1 23%     -50.5%       3208 =C2=B1  5%  sched_debug.cfs_rq[=
43]:/.tg_load_avg
      6453 =C2=B1 22%     -50.2%       3217 =C2=B1  4%  sched_debug.cfs_rq[=
44]:/.tg_load_avg
      1575 =C2=B1  3%     -13.2%       1368 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.tg->runnable_avg
      6359 =C2=B1 21%     -49.3%       3226 =C2=B1  4%  sched_debug.cfs_rq[=
45]:/.tg_load_avg
      1574 =C2=B1  4%     -12.8%       1372 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.tg->runnable_avg
      3484 =C2=B1 40%     -64.6%       1235 =C2=B1 42%  sched_debug.cfs_rq[=
45]:/.min_vruntime
      6172 =C2=B1 20%     -47.7%       3226 =C2=B1  3%  sched_debug.cfs_rq[=
46]:/.tg_load_avg
      1566 =C2=B1  3%     -12.3%       1374 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.tg->runnable_avg
      5935 =C2=B1 19%     -45.8%       3219 =C2=B1  3%  sched_debug.cfs_rq[=
47]:/.tg_load_avg
      1556 =C2=B1  4%     -11.4%       1378 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.tg->runnable_avg
      1547 =C2=B1  4%     -10.7%       1381 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.tg->runnable_avg
      5696 =C2=B1 18%     -43.7%       3208 =C2=B1  3%  sched_debug.cfs_rq[=
48]:/.tg_load_avg
      5520 =C2=B1 18%     -42.2%       3188 =C2=B1  4%  sched_debug.cfs_rq[=
49]:/.tg_load_avg
      1545 =C2=B1  4%     -10.4%       1384 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.tg->runnable_avg
     10447 =C2=B1 23%     -67.6%       3388 =C2=B1  3%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
      1708 =C2=B1  6%     -27.0%       1246 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
      1536 =C2=B1  4%      -9.6%       1388 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.tg->runnable_avg
      5433 =C2=B1 17%     -41.1%       3200 =C2=B1  4%  sched_debug.cfs_rq[=
50]:/.tg_load_avg
      5335 =C2=B1 16%     -40.3%       3186 =C2=B1  4%  sched_debug.cfs_rq[=
51]:/.tg_load_avg
      1530 =C2=B1  3%      -9.1%       1391 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.tg->runnable_avg
      5259 =C2=B1 15%     -39.6%       3175 =C2=B1  4%  sched_debug.cfs_rq[=
52]:/.tg_load_avg
      1531 =C2=B1  3%      -8.9%       1395 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.tg->runnable_avg
        73 =C2=B1 18%     -50.7%         36 =C2=B1 30%  sched_debug.cfs_rq[=
53]:/.tg_load_contrib
        64 =C2=B1 27%     -55.6%         28 =C2=B1 22%  sched_debug.cfs_rq[=
53]:/.blocked_load_avg
      5193 =C2=B1 15%     -38.8%       3177 =C2=B1  4%  sched_debug.cfs_rq[=
53]:/.tg_load_avg
      5123 =C2=B1 14%     -38.0%       3177 =C2=B1  4%  sched_debug.cfs_rq[=
54]:/.tg_load_avg
      3440 =C2=B1 26%     -54.5%       1564 =C2=B1 13%  sched_debug.cfs_rq[=
55]:/.min_vruntime
      5015 =C2=B1 14%     -36.8%       3171 =C2=B1  4%  sched_debug.cfs_rq[=
55]:/.tg_load_avg
      4899 =C2=B1 12%     -35.5%       3159 =C2=B1  4%  sched_debug.cfs_rq[=
56]:/.tg_load_avg
      4760 =C2=B1  9%     -33.5%       3166 =C2=B1  4%  sched_debug.cfs_rq[=
57]:/.tg_load_avg
       147 =C2=B1 41%     -76.8%         34 =C2=B1 43%  sched_debug.cfs_rq[=
57]:/.blocked_load_avg
       151 =C2=B1 44%     -77.4%         34 =C2=B1 43%  sched_debug.cfs_rq[=
57]:/.tg_load_contrib
      4676 =C2=B1  7%     -32.3%       3166 =C2=B1  5%  sched_debug.cfs_rq[=
58]:/.tg_load_avg
      4613 =C2=B1  6%     -31.4%       3165 =C2=B1  5%  sched_debug.cfs_rq[=
59]:/.tg_load_avg
     10378 =C2=B1 23%     -67.6%       3367 =C2=B1  2%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
      1703 =C2=B1  6%     -26.6%       1249 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
      4535 =C2=B1  4%     -29.9%       3178 =C2=B1  5%  sched_debug.cfs_rq[=
60]:/.tg_load_avg
      4477 =C2=B1  6%     -28.9%       3183 =C2=B1  5%  sched_debug.cfs_rq[=
61]:/.tg_load_avg
      4456 =C2=B1  5%     -28.5%       3185 =C2=B1  5%  sched_debug.cfs_rq[=
62]:/.tg_load_avg
         1 =C2=B1 34%    +100.0%          2 =C2=B1 20%  sched_debug.cfs_rq[=
62]:/.nr_spread_over
      4428 =C2=B1  5%     -28.4%       3172 =C2=B1  5%  sched_debug.cfs_rq[=
63]:/.tg_load_avg
      4337 =C2=B1  5%     -26.7%       3181 =C2=B1  4%  sched_debug.cfs_rq[=
64]:/.tg_load_avg
      4284 =C2=B1  5%     -25.9%       3177 =C2=B1  5%  sched_debug.cfs_rq[=
65]:/.tg_load_avg
      4193 =C2=B1  6%     -24.1%       3183 =C2=B1  5%  sched_debug.cfs_rq[=
66]:/.tg_load_avg
      5113 =C2=B1 30%     -56.5%       2225 =C2=B1 27%  sched_debug.cfs_rq[=
67]:/.min_vruntime
      4184 =C2=B1  6%     -24.0%       3181 =C2=B1  5%  sched_debug.cfs_rq[=
67]:/.tg_load_avg
       388 =C2=B1 15%     -37.2%        243 =C2=B1 16%  sched_debug.cfs_rq[=
67]:/.exec_clock
      4128 =C2=B1  8%     -23.2%       3171 =C2=B1  5%  sched_debug.cfs_rq[=
68]:/.tg_load_avg
       376 =C2=B1 27%     -24.5%        284 =C2=B1 16%  sched_debug.cfs_rq[=
69]:/.exec_clock
      4137 =C2=B1  8%     -23.2%       3176 =C2=B1  5%  sched_debug.cfs_rq[=
69]:/.tg_load_avg
     10244 =C2=B1 23%     -66.9%       3387 =C2=B1  2%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
      1689 =C2=B1  6%     -26.0%       1250 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
      4150 =C2=B1  8%     -23.1%       3192 =C2=B1  5%  sched_debug.cfs_rq[=
70]:/.tg_load_avg
      4158 =C2=B1  8%     -22.9%       3204 =C2=B1  5%  sched_debug.cfs_rq[=
71]:/.tg_load_avg
      4157 =C2=B1  8%     -22.9%       3203 =C2=B1  5%  sched_debug.cfs_rq[=
72]:/.tg_load_avg
      4133 =C2=B1  6%     -22.2%       3214 =C2=B1  5%  sched_debug.cfs_rq[=
73]:/.tg_load_avg
      4059 =C2=B1  3%     -20.4%       3232 =C2=B1  6%  sched_debug.cfs_rq[=
74]:/.tg_load_avg
      4054 =C2=B1  3%     -20.8%       3210 =C2=B1  5%  sched_debug.cfs_rq[=
75]:/.tg_load_avg
    172.83 =C2=B1 34%     -46.0%      93.27 =C2=B1 28%  sched_debug.cfs_rq[=
75]:/.exec_clock
      4050 =C2=B1  3%     -21.5%       3180 =C2=B1  5%  sched_debug.cfs_rq[=
76]:/.tg_load_avg
       209 =C2=B1  7%     -24.7%        157 =C2=B1 19%  sched_debug.cfs_rq[=
77]:/.exec_clock
      4060 =C2=B1  3%     -21.9%       3173 =C2=B1  5%  sched_debug.cfs_rq[=
77]:/.tg_load_avg
         2 =C2=B1  0%     -50.0%          1 =C2=B1  0%  sched_debug.cfs_rq[=
77]:/.nr_spread_over
      2679 =C2=B1 23%     -49.5%       1353 =C2=B1 33%  sched_debug.cfs_rq[=
77]:/.min_vruntime
      2925 =C2=B1 37%     -60.4%       1157 =C2=B1 24%  sched_debug.cfs_rq[=
78]:/.min_vruntime
      4049 =C2=B1  2%     -21.9%       3164 =C2=B1  5%  sched_debug.cfs_rq[=
78]:/.tg_load_avg
      4050 =C2=B1  2%     -22.0%       3158 =C2=B1  4%  sched_debug.cfs_rq[=
79]:/.tg_load_avg
     10033 =C2=B1 23%     -66.4%       3369 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
         1 =C2=B1 34%    +140.0%          3 =C2=B1 40%  sched_debug.cfs_rq[=
7]:/.nr_spread_over
      1667 =C2=B1  7%     -24.9%       1252 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
      9677 =C2=B1 24%     -65.1%       3372 =C2=B1  2%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
      1644 =C2=B1  7%     -23.8%       1253 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
      9492 =C2=B1 24%     -65.0%       3319 =C2=B1  2%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
      1650 =C2=B1  7%     -23.9%       1255 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
       555 =C2=B1 28%    +140.8%       1337 =C2=B1 42%  sched_debug.cfs_rq[=
9]:/.exec_clock
      8676 =C2=B1 18%   +1770.1%     162256 =C2=B1  1%  sched_debug.cpu#0.n=
r_load_updates
      2680 =C2=B1 29%     +62.1%       4346 =C2=B1  7%  sched_debug.cpu#1.t=
twu_count
     12575 =C2=B1  6%   +1218.8%     165848 =C2=B1  0%  sched_debug.cpu#1.n=
r_load_updates
     11072 =C2=B1  7%   +1399.0%     165965 =C2=B1  1%  sched_debug.cpu#10.=
nr_load_updates
     11524 =C2=B1 10%   +1338.8%     165807 =C2=B1  0%  sched_debug.cpu#11.=
nr_load_updates
     10776 =C2=B1  6%   +1432.8%     165187 =C2=B1  0%  sched_debug.cpu#12.=
nr_load_updates
      9103 =C2=B1  9%     -25.7%       6762 =C2=B1  7%  sched_debug.cpu#13.=
nr_switches
      2678 =C2=B1 11%     -60.8%       1051 =C2=B1 15%  sched_debug.cpu#13.=
ttwu_local
     15072 =C2=B1  3%   +1001.8%     166069 =C2=B1  0%  sched_debug.cpu#13.=
nr_load_updates
     10636 =C2=B1 15%     -36.3%       6775 =C2=B1  7%  sched_debug.cpu#13.=
sched_count
     11318 =C2=B1 11%   +1363.5%     165644 =C2=B1  1%  sched_debug.cpu#14.=
nr_load_updates
     11245 =C2=B1 11%   +1373.1%     165664 =C2=B1  1%  sched_debug.cpu#15.=
nr_load_updates
     11241 =C2=B1  9%   +1374.1%     165703 =C2=B1  1%  sched_debug.cpu#16.=
nr_load_updates
     11917 =C2=B1  1%   +1292.2%     165919 =C2=B1  1%  sched_debug.cpu#17.=
nr_load_updates
     11275 =C2=B1 10%   +1367.1%     165427 =C2=B1  1%  sched_debug.cpu#19.=
nr_load_updates
     11906 =C2=B1  9%    +991.0%     129889 =C2=B1 48%  sched_debug.cpu#2.n=
r_load_updates
     10696 =C2=B1  6%   +1446.7%     165436 =C2=B1  1%  sched_debug.cpu#20.=
nr_load_updates
     11742 =C2=B1  3%   +1308.2%     165360 =C2=B1  1%  sched_debug.cpu#21.=
nr_load_updates
     10836 =C2=B1  8%   +1425.2%     165278 =C2=B1  1%  sched_debug.cpu#22.=
nr_load_updates
     11096 =C2=B1  9%   +1389.7%     165296 =C2=B1  1%  sched_debug.cpu#23.=
nr_load_updates
     10466 =C2=B1  7%   +1478.3%     165192 =C2=B1  1%  sched_debug.cpu#24.=
nr_load_updates
     11348 =C2=B1  4%   +1357.1%     165354 =C2=B1  1%  sched_debug.cpu#25.=
nr_load_updates
     10528 =C2=B1  7%   +1468.5%     165143 =C2=B1  1%  sched_debug.cpu#26.=
nr_load_updates
     10529 =C2=B1  7%   +1468.4%     165141 =C2=B1  1%  sched_debug.cpu#27.=
nr_load_updates
     10481 =C2=B1  7%   +1475.4%     165112 =C2=B1  1%  sched_debug.cpu#28.=
nr_load_updates
     10845 =C2=B1  0%   +1423.0%     165185 =C2=B1  1%  sched_debug.cpu#29.=
nr_load_updates
       590 =C2=B1  8%     +42.8%        843 =C2=B1 20%  sched_debug.cpu#29.=
ttwu_local
     10342 =C2=B1  6%   +1495.4%     165006 =C2=B1  1%  sched_debug.cpu#30.=
nr_load_updates
     10324 =C2=B1  7%   +1498.2%     164995 =C2=B1  1%  sched_debug.cpu#31.=
nr_load_updates
      8840 =C2=B1 18%   +1765.3%     164905 =C2=B1  1%  sched_debug.cpu#32.=
nr_load_updates
      9235 =C2=B1  0%   +1684.7%     164827 =C2=B1  1%  sched_debug.cpu#33.=
nr_load_updates
      9243 =C2=B1  2%   +1683.1%     164815 =C2=B1  1%  sched_debug.cpu#34.=
nr_load_updates
      9064 =C2=B1  2%   +1717.8%     164778 =C2=B1  1%  sched_debug.cpu#35.=
nr_load_updates
      8980 =C2=B1  2%   +1734.6%     164754 =C2=B1  1%  sched_debug.cpu#36.=
nr_load_updates
      9261 =C2=B1  0%   +1678.8%     164735 =C2=B1  1%  sched_debug.cpu#37.=
nr_load_updates
       376 =C2=B1  6%     +44.7%        544 =C2=B1 17%  sched_debug.cpu#37.=
ttwu_local
      9075 =C2=B1  1%   +1714.6%     164679 =C2=B1  1%  sched_debug.cpu#38.=
nr_load_updates
      8964 =C2=B1  2%   +1736.8%     164651 =C2=B1  1%  sched_debug.cpu#39.=
nr_load_updates
     11314 =C2=B1 12%   +1045.5%     129605 =C2=B1 48%  sched_debug.cpu#4.n=
r_load_updates
      8909 =C2=B1  3%   +1747.7%     164608 =C2=B1  1%  sched_debug.cpu#40.=
nr_load_updates
      9131 =C2=B1  0%   +1702.3%     164577 =C2=B1  1%  sched_debug.cpu#41.=
nr_load_updates
      9027 =C2=B1  3%   +1722.9%     164552 =C2=B1  1%  sched_debug.cpu#42.=
nr_load_updates
      9171 =C2=B1  4%   +1693.8%     164512 =C2=B1  1%  sched_debug.cpu#43.=
nr_load_updates
      8768 =C2=B1  3%   +1775.6%     164469 =C2=B1  1%  sched_debug.cpu#44.=
nr_load_updates
       852 =C2=B1 10%     -20.3%        679 =C2=B1 18%  sched_debug.cpu#45.=
ttwu_count
      9473 =C2=B1  4%   +1636.2%     164473 =C2=B1  1%  sched_debug.cpu#45.=
nr_load_updates
      8805 =C2=B1  2%   +1767.1%     164410 =C2=B1  1%  sched_debug.cpu#46.=
nr_load_updates
      8808 =C2=B1  2%   +1766.2%     164375 =C2=B1  1%  sched_debug.cpu#47.=
nr_load_updates
      8996 =C2=B1  2%   +1727.1%     164372 =C2=B1  1%  sched_debug.cpu#48.=
nr_load_updates
      9183 =C2=B1  3%   +1690.0%     164380 =C2=B1  1%  sched_debug.cpu#49.=
nr_load_updates
       859 =C2=B1 18%    +129.5%       1972 =C2=B1 23%  sched_debug.cpu#5.t=
twu_local
      5204 =C2=B1  7%     +41.3%       7354 =C2=B1  9%  sched_debug.cpu#5.n=
r_switches
      2490 =C2=B1  7%     +37.7%       3430 =C2=B1  9%  sched_debug.cpu#5.s=
ched_goidle
      2443 =C2=B1 16%     +45.1%       3545 =C2=B1 11%  sched_debug.cpu#5.t=
twu_count
     12670 =C2=B1  2%   +1211.6%     166189 =C2=B1  0%  sched_debug.cpu#5.n=
r_load_updates
      8638 =C2=B1  2%   +1801.6%     164273 =C2=B1  1%  sched_debug.cpu#50.=
nr_load_updates
      8610 =C2=B1  1%   +1807.5%     164238 =C2=B1  1%  sched_debug.cpu#51.=
nr_load_updates
      8508 =C2=B1  3%   +1830.0%     164212 =C2=B1  1%  sched_debug.cpu#52.=
nr_load_updates
      8654 =C2=B1  0%   +1797.4%     164202 =C2=B1  1%  sched_debug.cpu#53.=
nr_load_updates
      8532 =C2=B1  2%   +1823.8%     164138 =C2=B1  1%  sched_debug.cpu#54.=
nr_load_updates
      8504 =C2=B1  1%   +1829.8%     164113 =C2=B1  1%  sched_debug.cpu#55.=
nr_load_updates
      8348 =C2=B1  3%   +1865.5%     164087 =C2=B1  1%  sched_debug.cpu#56.=
nr_load_updates
       548 =C2=B1  1%     -20.2%        438 =C2=B1 16%  sched_debug.cpu#57.=
sched_goidle
       655 =C2=B1  2%     -23.2%        502 =C2=B1 20%  sched_debug.cpu#57.=
ttwu_count
      1271 =C2=B1  1%     -20.8%       1006 =C2=B1 16%  sched_debug.cpu#57.=
nr_switches
      1278 =C2=B1  1%     -20.7%       1013 =C2=B1 16%  sched_debug.cpu#57.=
sched_count
      8536 =C2=B1  0%   +1821.8%     164048 =C2=B1  1%  sched_debug.cpu#57.=
nr_load_updates
      8436 =C2=B1  2%   +1844.2%     164019 =C2=B1  1%  sched_debug.cpu#58.=
nr_load_updates
      8349 =C2=B1  3%   +1864.1%     163989 =C2=B1  1%  sched_debug.cpu#59.=
nr_load_updates
     11598 =C2=B1 10%   +1326.9%     165497 =C2=B1  1%  sched_debug.cpu#6.n=
r_load_updates
      8259 =C2=B1  3%   +1885.0%     163953 =C2=B1  1%  sched_debug.cpu#60.=
nr_load_updates
      1290 =C2=B1  6%     -22.2%       1004 =C2=B1 17%  sched_debug.cpu#61.=
sched_count
       562 =C2=B1  6%     -23.0%        433 =C2=B1 16%  sched_debug.cpu#61.=
sched_goidle
      1283 =C2=B1  6%     -22.3%        997 =C2=B1 17%  sched_debug.cpu#61.=
nr_switches
      8440 =C2=B1  0%   +1842.0%     163919 =C2=B1  1%  sched_debug.cpu#61.=
nr_load_updates
       645 =C2=B1  8%     -25.3%        482 =C2=B1 20%  sched_debug.cpu#61.=
ttwu_count
      8285 =C2=B1  2%   +1878.1%     163887 =C2=B1  1%  sched_debug.cpu#62.=
nr_load_updates
      8210 =C2=B1  2%   +1895.7%     163858 =C2=B1  1%  sched_debug.cpu#63.=
nr_load_updates
     10426 =C2=B1  4%   +1481.3%     164872 =C2=B1  1%  sched_debug.cpu#65.=
nr_load_updates
      9684 =C2=B1 10%   +1591.4%     163812 =C2=B1  1%  sched_debug.cpu#66.=
nr_load_updates
      9298 =C2=B1  7%   +1662.3%     163861 =C2=B1  1%  sched_debug.cpu#67.=
nr_load_updates
      9597 =C2=B1  2%   +1608.1%     163931 =C2=B1  0%  sched_debug.cpu#69.=
nr_load_updates
     11341 =C2=B1  7%   +1362.1%     165827 =C2=B1  0%  sched_debug.cpu#7.n=
r_load_updates
      9175 =C2=B1  8%   +1684.1%     163692 =C2=B1  1%  sched_debug.cpu#70.=
nr_load_updates
      9229 =C2=B1  3%   +1673.6%     163701 =C2=B1  1%  sched_debug.cpu#71.=
nr_load_updates
      8190 =C2=B1  3%   +1897.5%     163603 =C2=B1  1%  sched_debug.cpu#72.=
nr_load_updates
      8065 =C2=B1  1%   +1927.5%     163531 =C2=B1  1%  sched_debug.cpu#73.=
nr_load_updates
      7926 =C2=B1  2%   +1962.5%     163490 =C2=B1  1%  sched_debug.cpu#74.=
nr_load_updates
      7844 =C2=B1  2%   +1983.9%     163464 =C2=B1  1%  sched_debug.cpu#75.=
nr_load_updates
      7714 =C2=B1  3%   +2018.6%     163430 =C2=B1  1%  sched_debug.cpu#76.=
nr_load_updates
      1264 =C2=B1  7%     -19.9%       1013 =C2=B1 23%  sched_debug.cpu#77.=
nr_switches
      1270 =C2=B1  7%     -19.8%       1019 =C2=B1 23%  sched_debug.cpu#77.=
sched_count
      7942 =C2=B1  0%   +1957.1%     163387 =C2=B1  1%  sched_debug.cpu#77.=
nr_load_updates
       546 =C2=B1  7%     -20.2%        435 =C2=B1 23%  sched_debug.cpu#77.=
sched_goidle
      7826 =C2=B1  3%   +1987.3%     163359 =C2=B1  1%  sched_debug.cpu#78.=
nr_load_updates
      7694 =C2=B1  2%   +2022.6%     163329 =C2=B1  1%  sched_debug.cpu#79.=
nr_load_updates
     11634 =C2=B1  6%   +1322.8%     165538 =C2=B1  1%  sched_debug.cpu#8.n=
r_load_updates
     12045 =C2=B1  4%   +1289.2%     167335 =C2=B1  1%  sched_debug.cpu#9.n=
r_load_updates
      2528 =C2=B1 17%     +44.8%       3662 =C2=B1 16%  sched_debug.cpu#9.t=
twu_count
      5739 =C2=B1 19%     +47.3%       8456 =C2=B1  9%  sched_debug.cpu#9.n=
r_switches
       862 =C2=B1 42%    +114.0%       1845 =C2=B1 26%  sched_debug.cpu#9.t=
twu_local
      2787 =C2=B1 19%     +41.3%       3938 =C2=B1 12%  sched_debug.cpu#9.s=
ched_goidle

testbox/testcase/testparams: lkp-wsx02/aim9/performance-5s-all

4ddbf3b0f1f755a5  3bb1e2aecc81817e158bead697  =

----------------  --------------------------  =

   1591616 =C2=B1  0%      -5.4%    1505096 =C2=B1  0%  aim9.add_double.ops=
_per_sec
   1592609 =C2=B1  0%      -5.6%    1503144 =C2=B1  0%  aim9.add_float.ops_=
per_sec
   6689317 =C2=B1  0%     -17.9%    5490000 =C2=B1  0%  aim9.add_int.ops_pe=
r_sec
   6587173 =C2=B1  2%     -17.7%    5421293 =C2=B1  0%  aim9.add_long.ops_p=
er_sec
   5571216 =C2=B1  0%      -5.6%    5259140 =C2=B1  0%  aim9.add_short.ops_=
per_sec
   3131143 =C2=B1  7%     -18.2%    2562159 =C2=B1 12%  aim9.brk_test.ops_p=
er_sec
    738048 =C2=B1  1%      -6.7%     688233 =C2=B1  6%  aim9.disk_rr.ops_pe=
r_sec
    398002 =C2=B1  0%      -5.5%     376124 =C2=B1  0%  aim9.div_double.ops=
_per_sec
    398201 =C2=B1  0%      -5.5%     376311 =C2=B1  0%  aim9.div_float.ops_=
per_sec
    233856 =C2=B1  0%      -5.8%     220300 =C2=B1  0%  aim9.div_int.ops_pe=
r_sec
    226665 =C2=B1  0%      -5.2%     214767 =C2=B1  0%  aim9.div_short.ops_=
per_sec
  27465550 =C2=B1  1%     -20.7%   21793000 =C2=B1 12%  aim9.jmp_test.ops_p=
er_sec
   1114286 =C2=B1  0%      -5.4%    1053746 =C2=B1  0%  aim9.mul_double.ops=
_per_sec
   1391616 =C2=B1  0%      -5.4%    1316226 =C2=B1  0%  aim9.mul_float.ops_=
per_sec
   1282608 =C2=B1  0%      -5.4%    1213296 =C2=B1  0%  aim9.mul_int.ops_pe=
r_sec
   1282644 =C2=B1  0%      -5.4%    1212930 =C2=B1  0%  aim9.mul_long.ops_p=
er_sec
   1221840 =C2=B1  0%      -4.7%    1164135 =C2=B1  0%  aim9.mul_short.ops_=
per_sec
    478890 =C2=B1  4%     -14.3%     410609 =C2=B1  7%  aim9.page_test.ops_=
per_sec
  11173650 =C2=B1  0%      -5.9%   10511530 =C2=B1  1%  aim9.series_1.ops_p=
er_sec
       198 =C2=B1  0%      -5.2%        188 =C2=B1  0%  aim9.shell_rtns_2.o=
ps_per_sec
       198 =C2=B1  0%      -5.0%        188 =C2=B1  0%  aim9.shell_rtns_3.o=
ps_per_sec
    885256 =C2=B1  0%     -19.9%     709167 =C2=B1 14%  aim9.signal_test.op=
s_per_sec
   4552791 =C2=B1  2%      -9.0%    4143740 =C2=B1  3%  aim9.time.minor_pag=
e_faults
      2255 =C2=B1  0%      -5.0%       2142 =C2=B1  0%  vmstat.system.cs
      1341 =C2=B1  2%     +81.7%       2438 =C2=B1  2%  vmstat.system.in
     91797 =C2=B1 31%    +494.4%     545668 =C2=B1 22%  softirqs.SCHED
      1.74 =C2=B1 32%    +179.8%       4.88 =C2=B1 14%  turbostat.CPU%c3
 2.056e+08 =C2=B1 36%    +321.2%  8.659e+08 =C2=B1 13%  cpuidle.C3-NHM.time
      3875 =C2=B1 16%   +5884.4%     231912 =C2=B1  3%  cpuidle.C3-NHM.usage
    644070 =C2=B1  1%     +15.5%     743866 =C2=B1  1%  cpuidle.C6-NHM.usage
       635 =C2=B1 12%     +31.9%        838 =C2=B1 17%  numa-meminfo.node0.=
PageTables
     32344 =C2=B1  2%      +9.9%      35539 =C2=B1  7%  numa-meminfo.node3.=
Slab
       158 =C2=B1 12%     +31.9%        208 =C2=B1 17%  numa-vmstat.node0.n=
r_page_table_pages
     31262 =C2=B1  0%     -36.6%      19827 =C2=B1  7%  numa-vmstat.node0.n=
uma_other
     44471 =C2=B1  0%     -12.4%      38962 =C2=B1  4%  numa-vmstat.node1.n=
uma_other
     14056 =C2=B1  0%    +133.5%      32821 =C2=B1  3%  numa-vmstat.node2.n=
uma_other
      1003 =C2=B1  9%     +27.3%       1277 =C2=B1  4%  slabinfo.file_lock_=
ctx.num_objs
      1003 =C2=B1  9%     +27.3%       1277 =C2=B1  4%  slabinfo.file_lock_=
ctx.active_objs
     13138 =C2=B1 12%     -46.2%       7071 =C2=B1  5%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
      1802 =C2=B1  8%     -27.6%       1304 =C2=B1  3%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
      1728 =C2=B1  4%     -22.9%       1333 =C2=B1  3%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
       491 =C2=B1 23%    +137.3%       1167 =C2=B1 49%  sched_debug.cfs_rq[=
10]:/.exec_clock
     11978 =C2=B1 13%     -40.9%       7082 =C2=B1  4%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
      1725 =C2=B1  4%     -22.5%       1337 =C2=B1  3%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
     11810 =C2=B1 12%     -40.1%       7078 =C2=B1  4%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
      1715 =C2=B1  4%     -21.8%       1341 =C2=B1  3%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
     11615 =C2=B1 11%     -38.9%       7093 =C2=B1  4%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
      1701 =C2=B1  4%     -21.0%       1344 =C2=B1  3%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
     11375 =C2=B1 10%     -37.5%       7109 =C2=B1  4%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
      1673 =C2=B1  4%     -19.5%       1347 =C2=B1  3%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
     11063 =C2=B1  9%     -36.0%       7079 =C2=B1  4%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
     10994 =C2=B1 16%     -63.7%       3996 =C2=B1 13%  sched_debug.cfs_rq[=
14]:/.min_vruntime
      1656 =C2=B1  4%     -18.5%       1349 =C2=B1  3%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
     10678 =C2=B1  6%     -33.9%       7055 =C2=B1  4%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
      1632 =C2=B1  4%     -17.1%       1352 =C2=B1  3%  sched_debug.cfs_rq[=
16]:/.tg->runnable_avg
     10443 =C2=B1  7%     -32.6%       7044 =C2=B1  4%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
      1615 =C2=B1  5%     -16.2%       1353 =C2=B1  3%  sched_debug.cfs_rq[=
17]:/.tg->runnable_avg
         1 =C2=B1 47%    +185.7%          5 =C2=B1 24%  sched_debug.cfs_rq[=
17]:/.nr_spread_over
     10350 =C2=B1  8%     -32.0%       7037 =C2=B1  4%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
      1612 =C2=B1  5%     -15.7%       1359 =C2=B1  3%  sched_debug.cfs_rq[=
18]:/.tg->runnable_avg
     10276 =C2=B1  8%     -31.4%       7047 =C2=B1  4%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
      1616 =C2=B1  5%     -15.8%       1361 =C2=B1  3%  sched_debug.cfs_rq[=
19]:/.tg->runnable_avg
     10224 =C2=B1  8%     -31.4%       7014 =C2=B1  4%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
      1808 =C2=B1  8%     -27.3%       1314 =C2=B1  3%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
     13063 =C2=B1 12%     -45.6%       7111 =C2=B1  4%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
     10240 =C2=B1  8%     -31.5%       7015 =C2=B1  4%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
     10052 =C2=B1 10%     -66.1%       3410 =C2=B1 16%  sched_debug.cfs_rq[=
20]:/.min_vruntime
      1620 =C2=B1  5%     -15.9%       1363 =C2=B1  3%  sched_debug.cfs_rq[=
20]:/.tg->runnable_avg
     10270 =C2=B1  8%     -31.7%       7016 =C2=B1  4%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
      1624 =C2=B1  5%     -15.9%       1366 =C2=B1  3%  sched_debug.cfs_rq[=
21]:/.tg->runnable_avg
     10271 =C2=B1  8%     -31.5%       7039 =C2=B1  5%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
      1627 =C2=B1  5%     -15.9%       1369 =C2=B1  3%  sched_debug.cfs_rq[=
22]:/.tg->runnable_avg
     10306 =C2=B1  8%     -31.9%       7015 =C2=B1  4%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
      1631 =C2=B1  5%     -15.9%       1372 =C2=B1  3%  sched_debug.cfs_rq[=
23]:/.tg->runnable_avg
      1634 =C2=B1  5%     -15.9%       1374 =C2=B1  3%  sched_debug.cfs_rq[=
24]:/.tg->runnable_avg
     10320 =C2=B1  8%     -32.1%       7010 =C2=B1  4%  sched_debug.cfs_rq[=
24]:/.tg_load_avg
      9564 =C2=B1 25%     -64.0%       3442 =C2=B1 21%  sched_debug.cfs_rq[=
24]:/.min_vruntime
      1637 =C2=B1  5%     -15.7%       1381 =C2=B1  3%  sched_debug.cfs_rq[=
25]:/.tg->runnable_avg
     10366 =C2=B1  8%     -32.5%       7002 =C2=B1  4%  sched_debug.cfs_rq[=
25]:/.tg_load_avg
     10349 =C2=B1  8%     -32.3%       7006 =C2=B1  4%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
      1641 =C2=B1  5%     -15.7%       1384 =C2=B1  3%  sched_debug.cfs_rq[=
26]:/.tg->runnable_avg
      1645 =C2=B1  5%     -15.7%       1386 =C2=B1  3%  sched_debug.cfs_rq[=
27]:/.tg->runnable_avg
     10358 =C2=B1  8%     -32.5%       6993 =C2=B1  4%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
      1647 =C2=B1  5%     -15.7%       1388 =C2=B1  3%  sched_debug.cfs_rq[=
28]:/.tg->runnable_avg
     10267 =C2=B1  7%     -31.9%       6995 =C2=B1  4%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
     10000 =C2=B1  6%     -30.0%       7001 =C2=B1  4%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
      1648 =C2=B1  5%     -15.5%       1392 =C2=B1  3%  sched_debug.cfs_rq[=
29]:/.tg->runnable_avg
     13068 =C2=B1 12%     -45.4%       7131 =C2=B1  4%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
      1809 =C2=B1  8%     -27.3%       1316 =C2=B1  3%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
      1645 =C2=B1  5%     -15.2%       1395 =C2=B1  3%  sched_debug.cfs_rq[=
30]:/.tg->runnable_avg
      9910 =C2=B1  5%     -29.2%       7016 =C2=B1  4%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
      1642 =C2=B1  5%     -14.8%       1398 =C2=B1  3%  sched_debug.cfs_rq[=
31]:/.tg->runnable_avg
      9876 =C2=B1  5%     -28.9%       7018 =C2=B1  4%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
      9866 =C2=B1  4%     -28.7%       7032 =C2=B1  4%  sched_debug.cfs_rq[=
32]:/.tg_load_avg
      1644 =C2=B1  4%     -14.8%       1401 =C2=B1  3%  sched_debug.cfs_rq[=
32]:/.tg->runnable_avg
      7625 =C2=B1 31%     -85.0%       1147 =C2=B1 17%  sched_debug.cfs_rq[=
33]:/.min_vruntime
      1646 =C2=B1  4%     -14.7%       1405 =C2=B1  3%  sched_debug.cfs_rq[=
33]:/.tg->runnable_avg
       202 =C2=B1 15%     -82.9%         34 =C2=B1 45%  sched_debug.cfs_rq[=
33]:/.avg->runnable_avg_sum
      9806 =C2=B1  3%     -28.5%       7015 =C2=B1  5%  sched_debug.cfs_rq[=
33]:/.tg_load_avg
      1648 =C2=B1  4%     -14.5%       1408 =C2=B1  3%  sched_debug.cfs_rq[=
34]:/.tg->runnable_avg
      9796 =C2=B1  3%     -28.4%       7012 =C2=B1  4%  sched_debug.cfs_rq[=
34]:/.tg_load_avg
      1648 =C2=B1  4%     -14.4%       1412 =C2=B1  3%  sched_debug.cfs_rq[=
35]:/.tg->runnable_avg
      9795 =C2=B1  4%     -28.5%       7007 =C2=B1  4%  sched_debug.cfs_rq[=
35]:/.tg_load_avg
      8770 =C2=B1 13%     -76.8%       2034 =C2=B1 22%  sched_debug.cfs_rq[=
35]:/.min_vruntime
      1649 =C2=B1  4%     -14.3%       1413 =C2=B1  3%  sched_debug.cfs_rq[=
36]:/.tg->runnable_avg
      8383 =C2=B1  4%     -72.1%       2340 =C2=B1  9%  sched_debug.cfs_rq[=
36]:/.min_vruntime
      9754 =C2=B1  4%     -28.4%       6987 =C2=B1  4%  sched_debug.cfs_rq[=
36]:/.tg_load_avg
      9725 =C2=B1  4%     -28.3%       6970 =C2=B1  4%  sched_debug.cfs_rq[=
37]:/.tg_load_avg
      1652 =C2=B1  4%     -14.2%       1418 =C2=B1  3%  sched_debug.cfs_rq[=
37]:/.tg->runnable_avg
       325 =C2=B1 24%    +130.7%        751 =C2=B1 33%  sched_debug.cfs_rq[=
37]:/.exec_clock
      1655 =C2=B1  4%     -14.1%       1421 =C2=B1  3%  sched_debug.cfs_rq[=
38]:/.tg->runnable_avg
      8332 =C2=B1 11%     -54.0%       3830 =C2=B1 29%  sched_debug.cfs_rq[=
38]:/.min_vruntime
      9682 =C2=B1  4%     -28.1%       6961 =C2=B1  4%  sched_debug.cfs_rq[=
38]:/.tg_load_avg
       283 =C2=B1 11%    +108.3%        591 =C2=B1 21%  sched_debug.cfs_rq[=
38]:/.exec_clock
      9642 =C2=B1  4%     -27.8%       6963 =C2=B1  4%  sched_debug.cfs_rq[=
39]:/.tg_load_avg
      8655 =C2=B1  6%     -61.7%       3314 =C2=B1 49%  sched_debug.cfs_rq[=
39]:/.min_vruntime
      1656 =C2=B1  4%     -13.9%       1426 =C2=B1  3%  sched_debug.cfs_rq[=
39]:/.tg->runnable_avg
      1811 =C2=B1  8%     -27.2%       1318 =C2=B1  3%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
     13066 =C2=B1 12%     -45.4%       7134 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
         2 =C2=B1  0%    +125.0%          4 =C2=B1 24%  sched_debug.cfs_rq[=
3]:/.nr_spread_over
      9597 =C2=B1  3%     -27.7%       6942 =C2=B1  4%  sched_debug.cfs_rq[=
40]:/.tg_load_avg
      9031 =C2=B1  4%     -63.7%       3281 =C2=B1 22%  sched_debug.cfs_rq[=
40]:/.min_vruntime
      1655 =C2=B1  5%     -13.6%       1429 =C2=B1  3%  sched_debug.cfs_rq[=
40]:/.tg->runnable_avg
       329 =C2=B1  8%     +47.3%        484 =C2=B1  9%  sched_debug.cfs_rq[=
40]:/.exec_clock
       177 =C2=B1 17%     -64.8%         62 =C2=B1 29%  sched_debug.cfs_rq[=
41]:/.tg_load_contrib
      9552 =C2=B1  3%     -27.5%       6926 =C2=B1  4%  sched_debug.cfs_rq[=
41]:/.tg_load_avg
      8941 =C2=B1 17%     -65.9%       3045 =C2=B1 20%  sched_debug.cfs_rq[=
41]:/.min_vruntime
       166 =C2=B1 19%     -64.7%         58 =C2=B1 38%  sched_debug.cfs_rq[=
41]:/.blocked_load_avg
      1655 =C2=B1  5%     -13.4%       1433 =C2=B1  3%  sched_debug.cfs_rq[=
41]:/.tg->runnable_avg
      1643 =C2=B1  5%     -12.6%       1436 =C2=B1  3%  sched_debug.cfs_rq[=
42]:/.tg->runnable_avg
      7931 =C2=B1 14%     -76.0%       1904 =C2=B1 30%  sched_debug.cfs_rq[=
42]:/.min_vruntime
      9446 =C2=B1  3%     -26.3%       6966 =C2=B1  4%  sched_debug.cfs_rq[=
42]:/.tg_load_avg
      1643 =C2=B1  5%     -12.3%       1440 =C2=B1  3%  sched_debug.cfs_rq[=
43]:/.tg->runnable_avg
      9327 =C2=B1  2%     -25.4%       6961 =C2=B1  4%  sched_debug.cfs_rq[=
43]:/.tg_load_avg
        73 =C2=B1 37%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.utilization_load_avg
      9237 =C2=B1  1%     -24.5%       6973 =C2=B1  4%  sched_debug.cfs_rq[=
44]:/.tg_load_avg
      1644 =C2=B1  5%     -12.2%       1444 =C2=B1  3%  sched_debug.cfs_rq[=
44]:/.tg->runnable_avg
      8080 =C2=B1  7%     -65.4%       2792 =C2=B1 26%  sched_debug.cfs_rq[=
44]:/.min_vruntime
       220 =C2=B1 23%     -57.6%         93 =C2=B1 24%  sched_debug.cfs_rq[=
45]:/.avg->runnable_avg_sum
      9079 =C2=B1  1%     -23.2%       6975 =C2=B1  4%  sched_debug.cfs_rq[=
45]:/.tg_load_avg
      1643 =C2=B1  5%     -11.9%       1447 =C2=B1  2%  sched_debug.cfs_rq[=
45]:/.tg->runnable_avg
      8742 =C2=B1 24%     -78.7%       1865 =C2=B1 23%  sched_debug.cfs_rq[=
45]:/.min_vruntime
       382 =C2=B1 19%     -40.2%        228 =C2=B1 35%  sched_debug.cfs_rq[=
46]:/.exec_clock
       150 =C2=B1 41%     -52.7%         71 =C2=B1 22%  sched_debug.cfs_rq[=
46]:/.tg_load_contrib
      8970 =C2=B1  1%     -22.5%       6949 =C2=B1  4%  sched_debug.cfs_rq[=
46]:/.tg_load_avg
       145 =C2=B1 38%     -56.2%         63 =C2=B1 27%  sched_debug.cfs_rq[=
46]:/.blocked_load_avg
      8932 =C2=B1 13%     -79.2%       1859 =C2=B1 40%  sched_debug.cfs_rq[=
46]:/.min_vruntime
      8906 =C2=B1  1%     -22.0%       6948 =C2=B1  4%  sched_debug.cfs_rq[=
47]:/.tg_load_avg
     10358 =C2=B1 19%     -73.6%       2736 =C2=B1 43%  sched_debug.cfs_rq[=
47]:/.min_vruntime
      9900 =C2=B1 17%     -69.4%       3029 =C2=B1 15%  sched_debug.cfs_rq[=
48]:/.min_vruntime
      8879 =C2=B1  1%     -21.7%       6949 =C2=B1  4%  sched_debug.cfs_rq[=
48]:/.tg_load_avg
      8774 =C2=B1  3%     -20.6%       6963 =C2=B1  4%  sched_debug.cfs_rq[=
49]:/.tg_load_avg
      6615 =C2=B1 22%     -73.1%       1781 =C2=B1 19%  sched_debug.cfs_rq[=
49]:/.min_vruntime
     13007 =C2=B1 12%     -45.2%       7131 =C2=B1  4%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
      1799 =C2=B1  7%     -26.6%       1320 =C2=B1  3%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
       220 =C2=B1 48%     -76.6%         51 =C2=B1 30%  sched_debug.cfs_rq[=
50]:/.avg->runnable_avg_sum
      8497 =C2=B1  5%     -77.1%       1942 =C2=B1 33%  sched_debug.cfs_rq[=
50]:/.min_vruntime
      8695 =C2=B1  3%     -19.8%       6977 =C2=B1  4%  sched_debug.cfs_rq[=
50]:/.tg_load_avg
      8625 =C2=B1  3%     -19.2%       6972 =C2=B1  4%  sched_debug.cfs_rq[=
51]:/.tg_load_avg
      9463 =C2=B1 17%     -71.9%       2655 =C2=B1 43%  sched_debug.cfs_rq[=
51]:/.min_vruntime
      8536 =C2=B1  3%     -18.3%       6970 =C2=B1  4%  sched_debug.cfs_rq[=
52]:/.tg_load_avg
      8421 =C2=B1 21%     -66.1%       2855 =C2=B1 28%  sched_debug.cfs_rq[=
52]:/.min_vruntime
      8721 =C2=B1 17%     -75.3%       2157 =C2=B1 26%  sched_debug.cfs_rq[=
53]:/.min_vruntime
      8473 =C2=B1  2%     -17.8%       6962 =C2=B1  4%  sched_debug.cfs_rq[=
53]:/.tg_load_avg
      8437 =C2=B1  2%     -17.3%       6974 =C2=B1  4%  sched_debug.cfs_rq[=
54]:/.tg_load_avg
      8394 =C2=B1 24%     -75.2%       2081 =C2=B1 41%  sched_debug.cfs_rq[=
54]:/.min_vruntime
      9101 =C2=B1  8%     -70.9%       2644 =C2=B1 30%  sched_debug.cfs_rq[=
55]:/.min_vruntime
      8345 =C2=B1  2%     -16.8%       6944 =C2=B1  4%  sched_debug.cfs_rq[=
55]:/.tg_load_avg
       140 =C2=B1 35%     -54.8%         63 =C2=B1 22%  sched_debug.cfs_rq[=
56]:/.blocked_load_avg
       140 =C2=B1 35%     -49.6%         70 =C2=B1 20%  sched_debug.cfs_rq[=
56]:/.tg_load_contrib
     10852 =C2=B1 25%     -79.0%       2279 =C2=B1 31%  sched_debug.cfs_rq[=
56]:/.min_vruntime
      8279 =C2=B1  3%     -16.2%       6939 =C2=B1  4%  sched_debug.cfs_rq[=
56]:/.tg_load_avg
      7274 =C2=B1 22%     -74.2%       1878 =C2=B1 41%  sched_debug.cfs_rq[=
57]:/.min_vruntime
      8246 =C2=B1  3%     -15.9%       6932 =C2=B1  4%  sched_debug.cfs_rq[=
57]:/.tg_load_avg
      8213 =C2=B1 13%     -76.2%       1958 =C2=B1 14%  sched_debug.cfs_rq[=
58]:/.min_vruntime
      8214 =C2=B1  3%     -15.7%       6922 =C2=B1  4%  sched_debug.cfs_rq[=
58]:/.tg_load_avg
      8236 =C2=B1  2%     -16.0%       6920 =C2=B1  4%  sched_debug.cfs_rq[=
59]:/.tg_load_avg
     10049 =C2=B1 18%     -80.2%       1994 =C2=B1 30%  sched_debug.cfs_rq[=
59]:/.min_vruntime
     12842 =C2=B1 13%     -44.7%       7102 =C2=B1  4%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
         4 =C2=B1 24%    +122.2%         10 =C2=B1 12%  sched_debug.cfs_rq[=
5]:/.nr_spread_over
      1788 =C2=B1  6%     -26.1%       1322 =C2=B1  3%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
     10252 =C2=B1 15%     -73.4%       2726 =C2=B1 18%  sched_debug.cfs_rq[=
60]:/.min_vruntime
      8252 =C2=B1  2%     -16.4%       6899 =C2=B1  4%  sched_debug.cfs_rq[=
60]:/.tg_load_avg
       349 =C2=B1 20%     -45.0%        192 =C2=B1  7%  sched_debug.cfs_rq[=
61]:/.exec_clock
      8237 =C2=B1  3%     -16.2%       6906 =C2=B1  4%  sched_debug.cfs_rq[=
61]:/.tg_load_avg
      8573 =C2=B1 21%     -84.3%       1344 =C2=B1 21%  sched_debug.cfs_rq[=
61]:/.min_vruntime
      8204 =C2=B1  3%     -15.8%       6905 =C2=B1  4%  sched_debug.cfs_rq[=
62]:/.tg_load_avg
      8958 =C2=B1 16%     -70.1%       2677 =C2=B1 47%  sched_debug.cfs_rq[=
62]:/.min_vruntime
      8433 =C2=B1 16%     -71.5%       2403 =C2=B1 33%  sched_debug.cfs_rq[=
63]:/.min_vruntime
      8178 =C2=B1  3%     -15.4%       6917 =C2=B1  4%  sched_debug.cfs_rq[=
63]:/.tg_load_avg
      9360 =C2=B1 18%     -69.3%       2871 =C2=B1 25%  sched_debug.cfs_rq[=
64]:/.min_vruntime
      8180 =C2=B1  3%     -15.5%       6908 =C2=B1  4%  sched_debug.cfs_rq[=
64]:/.tg_load_avg
      8156 =C2=B1  2%     -15.2%       6918 =C2=B1  4%  sched_debug.cfs_rq[=
65]:/.tg_load_avg
      8136 =C2=B1  2%     -14.8%       6934 =C2=B1  4%  sched_debug.cfs_rq[=
66]:/.tg_load_avg
      8121 =C2=B1  2%     -14.9%       6908 =C2=B1  4%  sched_debug.cfs_rq[=
67]:/.tg_load_avg
      8120 =C2=B1  2%     -15.0%       6899 =C2=B1  4%  sched_debug.cfs_rq[=
68]:/.tg_load_avg
      8134 =C2=B1  2%     -15.1%       6902 =C2=B1  4%  sched_debug.cfs_rq[=
69]:/.tg_load_avg
     12633 =C2=B1 13%     -43.8%       7094 =C2=B1  4%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
      1768 =C2=B1  6%     -25.1%       1324 =C2=B1  3%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
      8148 =C2=B1  2%     -15.3%       6899 =C2=B1  4%  sched_debug.cfs_rq[=
70]:/.tg_load_avg
      8172 =C2=B1  2%     -15.5%       6903 =C2=B1  4%  sched_debug.cfs_rq[=
71]:/.tg_load_avg
      9890 =C2=B1 11%     -74.5%       2525 =C2=B1 16%  sched_debug.cfs_rq[=
71]:/.min_vruntime
       162 =C2=B1 30%    +147.3%        402 =C2=B1 22%  sched_debug.cfs_rq[=
72]:/.avg->runnable_avg_sum
         2 =C2=B1 39%    +200.0%          8 =C2=B1 27%  sched_debug.cfs_rq[=
72]:/.tg_runnable_contrib
      8183 =C2=B1  2%     -15.8%       6890 =C2=B1  4%  sched_debug.cfs_rq[=
72]:/.tg_load_avg
      9077 =C2=B1  5%     -72.0%       2545 =C2=B1 27%  sched_debug.cfs_rq[=
72]:/.min_vruntime
       309 =C2=B1  8%     -51.1%        151 =C2=B1  2%  sched_debug.cfs_rq[=
73]:/.exec_clock
      8212 =C2=B1  2%     -16.2%       6882 =C2=B1  4%  sched_debug.cfs_rq[=
73]:/.tg_load_avg
      9098 =C2=B1 24%     -87.2%       1162 =C2=B1 24%  sched_debug.cfs_rq[=
73]:/.min_vruntime
      8228 =C2=B1  1%     -16.4%       6882 =C2=B1  4%  sched_debug.cfs_rq[=
74]:/.tg_load_avg
      8747 =C2=B1  7%     -78.7%       1863 =C2=B1 49%  sched_debug.cfs_rq[=
74]:/.min_vruntime
         5 =C2=B1 20%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
75]:/.runnable_load_avg
      8229 =C2=B1  1%     -16.5%       6868 =C2=B1  4%  sched_debug.cfs_rq[=
75]:/.tg_load_avg
       259 =C2=B1 38%     -49.1%        132 =C2=B1 15%  sched_debug.cfs_rq[=
75]:/.avg->runnable_avg_sum
      9466 =C2=B1  4%     -79.8%       1910 =C2=B1 27%  sched_debug.cfs_rq[=
75]:/.min_vruntime
       188 =C2=B1 19%     -39.6%        114 =C2=B1 31%  sched_debug.cfs_rq[=
75]:/.blocked_load_avg
       194 =C2=B1 19%     -41.3%        114 =C2=B1 31%  sched_debug.cfs_rq[=
75]:/.tg_load_contrib
         5 =C2=B1 40%     -55.0%          2 =C2=B1 19%  sched_debug.cfs_rq[=
75]:/.tg_runnable_contrib
        32 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
75]:/.utilization_load_avg
      8138 =C2=B1  1%     -15.5%       6873 =C2=B1  4%  sched_debug.cfs_rq[=
76]:/.tg_load_avg
      8891 =C2=B1 10%     -78.3%       1926 =C2=B1 20%  sched_debug.cfs_rq[=
76]:/.min_vruntime
       308 =C2=B1 11%     -41.6%        180 =C2=B1 14%  sched_debug.cfs_rq[=
77]:/.exec_clock
      8132 =C2=B1  1%     -15.5%       6874 =C2=B1  4%  sched_debug.cfs_rq[=
77]:/.tg_load_avg
      8583 =C2=B1 13%     -82.2%       1526 =C2=B1 24%  sched_debug.cfs_rq[=
77]:/.min_vruntime
      8108 =C2=B1  1%     -15.3%       6871 =C2=B1  4%  sched_debug.cfs_rq[=
78]:/.tg_load_avg
      7464 =C2=B1 10%     -69.1%       2306 =C2=B1 42%  sched_debug.cfs_rq[=
79]:/.min_vruntime
      8118 =C2=B1  1%     -15.2%       6885 =C2=B1  4%  sched_debug.cfs_rq[=
79]:/.tg_load_avg
     10731 =C2=B1 12%     -57.0%       4612 =C2=B1 44%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     12423 =C2=B1 14%     -42.7%       7116 =C2=B1  4%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
       133 =C2=B1 30%     -57.8%         56 =C2=B1  9%  sched_debug.cfs_rq[=
7]:/.blocked_load_avg
       137 =C2=B1 26%     -53.4%         64 =C2=B1 25%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
      1752 =C2=B1  6%     -24.3%       1326 =C2=B1  3%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
       678 =C2=B1 19%     +34.3%        911 =C2=B1  5%  sched_debug.cfs_rq[=
8]:/.exec_clock
     12238 =C2=B1 13%     -42.0%       7100 =C2=B1  4%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
      1746 =C2=B1  6%     -23.9%       1328 =C2=B1  3%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
     10121 =C2=B1 20%     -46.0%       5461 =C2=B1 31%  sched_debug.cfs_rq[=
8]:/.min_vruntime
     12106 =C2=B1 13%     -41.3%       7111 =C2=B1  4%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
      1743 =C2=B1  6%     -23.6%       1331 =C2=B1  3%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
     12482 =C2=B1 44%     -50.2%       6220 =C2=B1 28%  sched_debug.cfs_rq[=
9]:/.min_vruntime
      4551 =C2=B1 10%     -18.5%       3708 =C2=B1  1%  sched_debug.cpu#0.s=
ched_goidle
      3066 =C2=B1  7%     +17.1%       3591 =C2=B1  4%  sched_debug.cpu#0.t=
twu_local
     14049 =C2=B1  5%    +819.4%     129172 =C2=B1 31%  sched_debug.cpu#1.n=
r_load_updates
      2855 =C2=B1 16%     +46.4%       4181 =C2=B1 14%  sched_debug.cpu#10.=
sched_goidle
      5875 =C2=B1 15%     +47.1%       8643 =C2=B1 15%  sched_debug.cpu#10.=
nr_switches
     12539 =C2=B1  2%   +1205.1%     163650 =C2=B1  0%  sched_debug.cpu#10.=
nr_load_updates
     13280 =C2=B1  5%   +1133.1%     163768 =C2=B1  0%  sched_debug.cpu#11.=
nr_load_updates
      3326 =C2=B1  8%     +31.8%       4382 =C2=B1 14%  sched_debug.cpu#13.=
sched_goidle
     29934 =C2=B1 23%    +445.3%     163231 =C2=B1  0%  sched_debug.cpu#13.=
nr_load_updates
     12602 =C2=B1  3%   +1193.2%     162971 =C2=B1  0%  sched_debug.cpu#14.=
nr_load_updates
     13358 =C2=B1  9%   +1120.4%     163016 =C2=B1  0%  sched_debug.cpu#15.=
nr_load_updates
     13349 =C2=B1  4%   +1119.6%     162804 =C2=B1  0%  sched_debug.cpu#16.=
nr_load_updates
       926 =C2=B1 43%    +115.1%       1992 =C2=B1 28%  sched_debug.cpu#16.=
ttwu_local
      8213 =C2=B1 12%     +29.7%      10657 =C2=B1 15%  sched_debug.cpu#16.=
sched_count
      2258 =C2=B1 19%     +50.1%       3390 =C2=B1  8%  sched_debug.cpu#17.=
ttwu_count
      6249 =C2=B1 15%     +32.1%       8255 =C2=B1  4%  sched_debug.cpu#17.=
nr_switches
     12960 =C2=B1  8%   +1158.7%     163136 =C2=B1  0%  sched_debug.cpu#17.=
nr_load_updates
      3035 =C2=B1 15%     +32.3%       4014 =C2=B1  4%  sched_debug.cpu#17.=
sched_goidle
     13343 =C2=B1  9%   +1117.9%     162501 =C2=B1  0%  sched_debug.cpu#19.=
nr_load_updates
     13322 =C2=B1  4%   +1119.2%     162430 =C2=B1  0%  sched_debug.cpu#20.=
nr_load_updates
     13214 =C2=B1  5%   +1130.4%     162591 =C2=B1  0%  sched_debug.cpu#21.=
nr_load_updates
     13115 =C2=B1 14%   +1137.2%     162267 =C2=B1  0%  sched_debug.cpu#22.=
nr_load_updates
     12726 =C2=B1  4%   +1175.6%     162346 =C2=B1  0%  sched_debug.cpu#23.=
nr_load_updates
     13374 =C2=B1  9%   +1113.0%     162235 =C2=B1  0%  sched_debug.cpu#24.=
nr_load_updates
     12484 =C2=B1  6%   +1198.6%     162119 =C2=B1  0%  sched_debug.cpu#27.=
nr_load_updates
     12406 =C2=B1 37%     -38.1%       7675 =C2=B1  5%  sched_debug.cpu#28.=
sched_count
     15514 =C2=B1 14%    +944.7%     162072 =C2=B1  0%  sched_debug.cpu#28.=
nr_load_updates
     16461 =C2=B1 43%    +885.4%     162201 =C2=B1  0%  sched_debug.cpu#29.=
nr_load_updates
     16970 =C2=B1 31%    +724.5%     139914 =C2=B1 22%  sched_debug.cpu#3.n=
r_load_updates
     12152 =C2=B1  7%   +1231.5%     161804 =C2=B1  0%  sched_debug.cpu#30.=
nr_load_updates
      9760 =C2=B1 11%   +1548.3%     160872 =C2=B1  1%  sched_debug.cpu#32.=
nr_load_updates
       728 =C2=B1 18%     -47.4%        383 =C2=B1 13%  sched_debug.cpu#33.=
ttwu_count
      9853 =C2=B1  0%   +1538.9%     161477 =C2=B1  0%  sched_debug.cpu#33.=
nr_load_updates
       726 =C2=B1 19%     -38.0%        450 =C2=B1 24%  sched_debug.cpu#33.=
sched_goidle
      1646 =C2=B1 20%     -35.9%       1055 =C2=B1 21%  sched_debug.cpu#33.=
sched_count
      1639 =C2=B1 20%     -36.1%       1047 =C2=B1 21%  sched_debug.cpu#33.=
nr_switches
      9879 =C2=B1  1%   +1534.2%     161442 =C2=B1  0%  sched_debug.cpu#34.=
nr_load_updates
     10043 =C2=B1  2%   +1507.3%     161421 =C2=B1  0%  sched_debug.cpu#35.=
nr_load_updates
     10016 =C2=B1  2%   +1511.7%     161427 =C2=B1  0%  sched_debug.cpu#36.=
nr_load_updates
       872 =C2=B1 21%    +137.9%       2074 =C2=B1 35%  sched_debug.cpu#37.=
ttwu_count
      9891 =C2=B1  2%   +1532.8%     161505 =C2=B1  0%  sched_debug.cpu#37.=
nr_load_updates
       396 =C2=B1 17%    +116.2%        857 =C2=B1 35%  sched_debug.cpu#37.=
ttwu_local
      1952 =C2=B1 21%    +125.7%       4406 =C2=B1 32%  sched_debug.cpu#37.=
nr_switches
       849 =C2=B1 21%    +118.9%       1858 =C2=B1 31%  sched_debug.cpu#37.=
sched_goidle
      1961 =C2=B1 21%    +125.1%       4414 =C2=B1 32%  sched_debug.cpu#37.=
sched_count
       333 =C2=B1 20%    +102.8%        676 =C2=B1 32%  sched_debug.cpu#38.=
ttwu_local
      1731 =C2=B1  6%    +122.7%       3856 =C2=B1 31%  sched_debug.cpu#38.=
nr_switches
      9725 =C2=B1  1%   +1561.0%     161541 =C2=B1  0%  sched_debug.cpu#38.=
nr_load_updates
       738 =C2=B1 13%    +132.1%       1713 =C2=B1 29%  sched_debug.cpu#38.=
ttwu_count
      1738 =C2=B1  6%    +122.4%       3865 =C2=B1 31%  sched_debug.cpu#38.=
sched_count
       758 =C2=B1  5%    +121.7%       1682 =C2=B1 32%  sched_debug.cpu#38.=
sched_goidle
     10036 =C2=B1  0%   +1507.2%     161313 =C2=B1  0%  sched_debug.cpu#39.=
nr_load_updates
      6661 =C2=B1 23%     -41.9%       3868 =C2=B1  5%  sched_debug.cpu#4.s=
ched_goidle
     13563 =C2=B1 23%     -40.4%       8078 =C2=B1  6%  sched_debug.cpu#4.n=
r_switches
     15575 =C2=B1 10%    +882.3%     152996 =C2=B1  5%  sched_debug.cpu#4.n=
r_load_updates
      5920 =C2=B1 30%     -38.9%       3615 =C2=B1 12%  sched_debug.cpu#4.t=
twu_count
      2845 =C2=B1 42%     -54.6%       1290 =C2=B1 20%  sched_debug.cpu#4.t=
twu_local
      9826 =C2=B1  2%   +1541.1%     161263 =C2=B1  0%  sched_debug.cpu#40.=
nr_load_updates
      2056 =C2=B1 12%     +33.9%       2753 =C2=B1 11%  sched_debug.cpu#40.=
sched_count
       905 =C2=B1 13%     +31.5%       1190 =C2=B1 10%  sched_debug.cpu#40.=
sched_goidle
      2049 =C2=B1 12%     +34.0%       2745 =C2=B1 11%  sched_debug.cpu#40.=
nr_switches
       371 =C2=B1 15%     +62.4%        603 =C2=B1 12%  sched_debug.cpu#40.=
ttwu_local
       911 =C2=B1 11%     +51.5%       1381 =C2=B1  9%  sched_debug.cpu#40.=
ttwu_count
      9757 =C2=B1  1%   +1552.7%     161266 =C2=B1  0%  sched_debug.cpu#41.=
nr_load_updates
      9674 =C2=B1  2%   +1565.3%     161105 =C2=B1  0%  sched_debug.cpu#42.=
nr_load_updates
     10184 =C2=B1  5%   +1481.9%     161113 =C2=B1  0%  sched_debug.cpu#43.=
nr_load_updates
      9692 =C2=B1  1%   +1562.1%     161092 =C2=B1  0%  sched_debug.cpu#44.=
nr_load_updates
       467 =C2=B1 10%     -25.6%        348 =C2=B1  9%  sched_debug.cpu#45.=
ttwu_local
        10 =C2=B1 35%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#45.=
cpu_load[1]
      2048 =C2=B1  3%     -15.6%       1729 =C2=B1 11%  sched_debug.cpu#45.=
nr_switches
       863 =C2=B1  1%     -15.0%        734 =C2=B1 14%  sched_debug.cpu#45.=
sched_goidle
         8 =C2=B1 26%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#45.=
cpu_load[2]
         5 =C2=B1 24%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#45.=
cpu_load[3]
      1017 =C2=B1 10%     -25.3%        760 =C2=B1 12%  sched_debug.cpu#45.=
ttwu_count
         2 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#45.=
cpu_load[4]
     10197 =C2=B1  3%   +1478.8%     161000 =C2=B1  0%  sched_debug.cpu#45.=
nr_load_updates
       892 =C2=B1 10%     -41.2%        524 =C2=B1 47%  sched_debug.cpu#46.=
sched_goidle
      9667 =C2=B1  2%   +1564.6%     160920 =C2=B1  0%  sched_debug.cpu#46.=
nr_load_updates
      2005 =C2=B1  9%     -40.7%       1190 =C2=B1 46%  sched_debug.cpu#46.=
nr_switches
      2013 =C2=B1  9%     -40.5%       1197 =C2=B1 46%  sched_debug.cpu#46.=
sched_count
      9724 =C2=B1  1%   +1555.2%     160959 =C2=B1  0%  sched_debug.cpu#47.=
nr_load_updates
      9893 =C2=B1  3%   +1526.7%     160943 =C2=B1  0%  sched_debug.cpu#48.=
nr_load_updates
       723 =C2=B1 14%     -32.2%        490 =C2=B1 11%  sched_debug.cpu#49.=
ttwu_count
      9307 =C2=B1  0%   +1628.3%     160858 =C2=B1  0%  sched_debug.cpu#49.=
nr_load_updates
      1204 =C2=B1 23%    +168.6%       3235 =C2=B1 43%  sched_debug.cpu#5.t=
twu_local
      3202 =C2=B1 12%     +65.5%       5299 =C2=B1 31%  sched_debug.cpu#5.s=
ched_goidle
      2620 =C2=B1 15%    +103.0%       5319 =C2=B1 29%  sched_debug.cpu#5.t=
twu_count
     13659 =C2=B1  5%   +1090.4%     162597 =C2=B1  1%  sched_debug.cpu#5.n=
r_load_updates
      9387 =C2=B1  1%   +1612.8%     160786 =C2=B1  0%  sched_debug.cpu#50.=
nr_load_updates
      9593 =C2=B1  2%   +1576.1%     160791 =C2=B1  0%  sched_debug.cpu#51.=
nr_load_updates
      9486 =C2=B1  2%   +1594.6%     160747 =C2=B1  0%  sched_debug.cpu#52.=
nr_load_updates
      9485 =C2=B1  3%   +1594.4%     160725 =C2=B1  0%  sched_debug.cpu#53.=
nr_load_updates
       958 =C2=B1 25%     -42.6%        550 =C2=B1 13%  sched_debug.cpu#53.=
ttwu_count
       890 =C2=B1 15%     -31.6%        608 =C2=B1 10%  sched_debug.cpu#53.=
sched_goidle
      2114 =C2=B1 18%     -33.8%       1399 =C2=B1  5%  sched_debug.cpu#53.=
nr_switches
       479 =C2=B1 34%     -41.9%        278 =C2=B1 39%  sched_debug.cpu#53.=
ttwu_local
      2122 =C2=B1 18%     -33.7%       1406 =C2=B1  5%  sched_debug.cpu#53.=
sched_count
      9261 =C2=B1  1%   +1634.4%     160627 =C2=B1  0%  sched_debug.cpu#54.=
nr_load_updates
      9393 =C2=B1  1%   +1610.1%     160640 =C2=B1  0%  sched_debug.cpu#55.=
nr_load_updates
      9408 =C2=B1  1%   +1606.7%     160567 =C2=B1  0%  sched_debug.cpu#56.=
nr_load_updates
      1052 =C2=B1 13%     -17.1%        872 =C2=B1 11%  sched_debug.cpu#56.=
ttwu_count
       347 =C2=B1 15%     -35.8%        222 =C2=B1 13%  sched_debug.cpu#57.=
ttwu_local
       791 =C2=B1 17%     -36.0%        506 =C2=B1  5%  sched_debug.cpu#57.=
ttwu_count
      9185 =C2=B1  1%   +1647.8%     160542 =C2=B1  0%  sched_debug.cpu#57.=
nr_load_updates
      9113 =C2=B1  1%   +1660.8%     160463 =C2=B1  0%  sched_debug.cpu#58.=
nr_load_updates
      9307 =C2=B1  1%   +1624.3%     160498 =C2=B1  0%  sched_debug.cpu#59.=
nr_load_updates
      6334 =C2=B1 14%     +42.6%       9033 =C2=B1 24%  sched_debug.cpu#6.n=
r_switches
      2606 =C2=B1 24%     +86.4%       4859 =C2=B1 31%  sched_debug.cpu#6.t=
twu_count
      3085 =C2=B1 14%     +36.8%       4220 =C2=B1 28%  sched_debug.cpu#6.s=
ched_goidle
      9237 =C2=B1  2%   +1636.7%     160431 =C2=B1  0%  sched_debug.cpu#60.=
nr_load_updates
       904 =C2=B1 17%     -37.2%        568 =C2=B1 15%  sched_debug.cpu#61.=
sched_goidle
      2031 =C2=B1 18%     -37.4%       1272 =C2=B1 14%  sched_debug.cpu#61.=
nr_switches
       417 =C2=B1 31%     -47.9%        217 =C2=B1 22%  sched_debug.cpu#61.=
ttwu_local
      9192 =C2=B1  2%   +1644.8%     160384 =C2=B1  0%  sched_debug.cpu#61.=
nr_load_updates
      1014 =C2=B1 17%     -49.6%        511 =C2=B1 18%  sched_debug.cpu#61.=
ttwu_count
      9013 =C2=B1  2%   +1678.8%     160329 =C2=B1  0%  sched_debug.cpu#62.=
nr_load_updates
      9150 =C2=B1  1%   +1652.2%     160337 =C2=B1  0%  sched_debug.cpu#63.=
nr_load_updates
     11879 =C2=B1  4%   +1253.1%     160733 =C2=B1  0%  sched_debug.cpu#64.=
nr_load_updates
     12214 =C2=B1 11%   +1220.1%     161247 =C2=B1  0%  sched_debug.cpu#65.=
nr_load_updates
     11148 =C2=B1  8%   +1340.1%     160543 =C2=B1  0%  sched_debug.cpu#66.=
nr_load_updates
     11464 =C2=B1  2%   +1301.4%     160660 =C2=B1  0%  sched_debug.cpu#67.=
nr_load_updates
     12415 =C2=B1  8%   +1193.4%     160575 =C2=B1  0%  sched_debug.cpu#68.=
nr_load_updates
     10687 =C2=B1  3%   +1403.5%     160677 =C2=B1  0%  sched_debug.cpu#69.=
nr_load_updates
     13803 =C2=B1  5%   +1076.7%     162429 =C2=B1  1%  sched_debug.cpu#7.n=
r_load_updates
     12068 =C2=B1 15%   +1228.4%     160318 =C2=B1  0%  sched_debug.cpu#70.=
nr_load_updates
     10972 =C2=B1  3%   +1362.9%     160512 =C2=B1  0%  sched_debug.cpu#71.=
nr_load_updates
      9218 =C2=B1  3%   +1636.4%     160066 =C2=B1  0%  sched_debug.cpu#72.=
nr_load_updates
      1740 =C2=B1 14%     -37.3%       1092 =C2=B1  5%  sched_debug.cpu#73.=
nr_switches
      1747 =C2=B1 14%     -37.1%       1099 =C2=B1  4%  sched_debug.cpu#73.=
sched_count
       770 =C2=B1 14%     -36.0%        492 =C2=B1  5%  sched_debug.cpu#73.=
sched_goidle
       795 =C2=B1 11%     -46.0%        429 =C2=B1 12%  sched_debug.cpu#73.=
ttwu_count
      8675 =C2=B1  1%   +1743.5%     159933 =C2=B1  0%  sched_debug.cpu#73.=
nr_load_updates
       328 =C2=B1 12%     -46.5%        175 =C2=B1 14%  sched_debug.cpu#73.=
ttwu_local
      8618 =C2=B1  1%   +1754.9%     159857 =C2=B1  0%  sched_debug.cpu#74.=
nr_load_updates
      1784 =C2=B1 16%     -36.6%       1131 =C2=B1 43%  sched_debug.cpu#74.=
sched_count
         4 =C2=B1 27%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#75.=
load
      8786 =C2=B1  1%   +1719.7%     159885 =C2=B1  0%  sched_debug.cpu#75.=
nr_load_updates
      2411 =C2=B1 12%     -22.7%       1863 =C2=B1  7%  sched_debug.cpu#76.=
nr_switches
      8900 =C2=B1  0%   +1696.6%     159914 =C2=B1  0%  sched_debug.cpu#76.=
nr_load_updates
      1078 =C2=B1 14%     -23.6%        823 =C2=B1  7%  sched_debug.cpu#76.=
sched_goidle
      2418 =C2=B1 12%     -22.7%       1870 =C2=B1  7%  sched_debug.cpu#76.=
sched_count
      1730 =C2=B1 14%     -32.8%       1163 =C2=B1 15%  sched_debug.cpu#77.=
nr_switches
      1738 =C2=B1 14%     -32.7%       1170 =C2=B1 15%  sched_debug.cpu#77.=
sched_count
      8534 =C2=B1  0%   +1773.0%     159839 =C2=B1  0%  sched_debug.cpu#77.=
nr_load_updates
       330 =C2=B1 14%     -37.0%        208 =C2=B1 22%  sched_debug.cpu#77.=
ttwu_local
       761 =C2=B1 13%     -42.8%        435 =C2=B1 18%  sched_debug.cpu#77.=
ttwu_count
       766 =C2=B1 14%     -32.0%        521 =C2=B1 15%  sched_debug.cpu#77.=
sched_goidle
      8571 =C2=B1  2%   +1763.7%     159748 =C2=B1  0%  sched_debug.cpu#78.=
nr_load_updates
      8731 =C2=B1  2%   +1730.1%     159785 =C2=B1  0%  sched_debug.cpu#79.=
nr_load_updates
     14583 =C2=B1  4%   +1028.7%     164600 =C2=B1  1%  sched_debug.cpu#8.n=
r_load_updates
     13452 =C2=B1 12%   +1119.6%     164057 =C2=B1  0%  sched_debug.cpu#9.n=
r_load_updates

testbox/testcase/testparams: lkp-nex04/blogbench/performance-1SSD-btrfs

4ddbf3b0f1f755a5  3bb1e2aecc81817e158bead697  =

----------------  --------------------------  =

    340282 =C2=B1  2%      -7.5%     314763 =C2=B1  7%  blogbench.read_score
   3280957 =C2=B1  1%     +43.9%    4721176 =C2=B1  1%  blogbench.time.invo=
luntary_context_switches
      6123 =C2=B1  0%      -1.7%       6017 =C2=B1  0%  blogbench.time.perc=
ent_of_cpu_this_job_got
  18259948 =C2=B1  1%     +11.2%   20296598 =C2=B1  3%  blogbench.time.file=
_system_outputs
    680702 =C2=B1  4%    +156.4%    1745237 =C2=B1  4%  blogbench.time.volu=
ntary_context_switches
     18314 =C2=B1  0%      -1.6%      18023 =C2=B1  0%  blogbench.time.syst=
em_time
      1681 =C2=B1  1%     +12.0%       1883 =C2=B1  2%  blogbench.write_sco=
re
     32827 =C2=B1  1%     +12.3%      36849 =C2=B1  3%  vmstat.io.bo
     24110 =C2=B1  1%     +52.5%      36772 =C2=B1  2%  vmstat.system.cs
     72966 =C2=B1  0%      +6.9%      78009 =C2=B1  0%  vmstat.system.in
    474560 =C2=B1  0%    +111.7%    1004423 =C2=B1  0%  softirqs.RCU
    169361 =C2=B1 13%   +3973.2%    6898389 =C2=B1  1%  softirqs.SCHED
          1:4          -25%            :4     kmsg.hrtimer:interrupt_took#ns
  18259948 =C2=B1  1%     +11.2%   20296598 =C2=B1  3%  time.file_system_ou=
tputs
   3280957 =C2=B1  1%     +43.9%    4721176 =C2=B1  1%  time.involuntary_co=
ntext_switches
    680702 =C2=B1  4%    +156.4%    1745237 =C2=B1  4%  time.voluntary_cont=
ext_switches
    693303 =C2=B1  6%     +29.3%     896576 =C2=B1  4%  numa-numastat.node3=
.local_node
    693349 =C2=B1  6%     +29.3%     896612 =C2=B1  4%  numa-numastat.node3=
.numa_hit
   2629685 =C2=B1  1%     +12.1%    2947642 =C2=B1  3%  proc-vmstat.nr_dirt=
ied
   2520044 =C2=B1  1%     +12.5%    2834657 =C2=B1  3%  proc-vmstat.nr_writ=
ten
   9865490 =C2=B1  1%     +12.1%   11062508 =C2=B1  3%  proc-vmstat.pgpgout
  14469108 =C2=B1 17%     +87.4%   27108367 =C2=B1 19%  cpuidle.C1-NHM.time
    111159 =C2=B1  8%    +107.5%     230625 =C2=B1 15%  cpuidle.C1-NHM.usage
   3390572 =C2=B1 33%     +57.9%    5353980 =C2=B1 14%  cpuidle.C1E-NHM.time
     11726 =C2=B1 11%    +194.1%      34492 =C2=B1 15%  cpuidle.C1E-NHM.usa=
ge
     54040 =C2=B1 13%    +215.9%     170728 =C2=B1 10%  cpuidle.C3-NHM.usage
        12 =C2=B1 36%     +81.6%         22 =C2=B1 25%  cpuidle.POLL.usage
     34948 =C2=B1  5%     -24.5%      26370 =C2=B1  6%  numa-meminfo.node0.=
Dirty
      4325 =C2=B1 25%     +90.1%       8223 =C2=B1 28%  numa-meminfo.node2.=
AnonPages
      4338 =C2=B1 25%     +90.5%       8266 =C2=B1 28%  numa-meminfo.node2.=
Active(anon)
     83729 =C2=B1  7%     +44.0%     120554 =C2=B1  9%  numa-meminfo.node3.=
SReclaimable
    256569 =C2=B1  4%     +27.8%     327879 =C2=B1  5%  numa-meminfo.node3.=
Inactive(file)
    948615 =C2=B1  3%     +39.3%    1321259 =C2=B1  7%  numa-meminfo.node3.=
FilePages
    259111 =C2=B1  5%     +26.8%     328472 =C2=B1  4%  numa-meminfo.node3.=
Inactive
     29029 =C2=B1  4%     +22.5%      35566 =C2=B1 13%  numa-meminfo.node3.=
Dirty
      8161 =C2=B1  7%     +41.2%      11525 =C2=B1  2%  numa-meminfo.node3.=
Writeback
   1208152 =C2=B1  3%     +34.4%    1623496 =C2=B1  6%  numa-meminfo.node3.=
MemUsed
    694564 =C2=B1  3%     +43.4%     996108 =C2=B1  7%  numa-meminfo.node3.=
Active
    688460 =C2=B1  3%     +44.0%     991426 =C2=B1  7%  numa-meminfo.node3.=
Active(file)
    111586 =C2=B1  7%     +34.8%     150451 =C2=B1  7%  numa-meminfo.node3.=
Slab
      8733 =C2=B1  5%     -24.1%       6630 =C2=B1  6%  numa-vmstat.node0.n=
r_dirty
     30640 =C2=B1  0%     -79.7%       6205 =C2=B1 13%  numa-vmstat.node0.n=
uma_other
     26326 =C2=B1  0%     +96.2%      51659 =C2=B1  1%  numa-vmstat.node1.n=
uma_other
      1080 =C2=B1 25%     +90.1%       2054 =C2=B1 28%  numa-vmstat.node2.n=
r_anon_pages
      1083 =C2=B1 25%     +90.6%       2064 =C2=B1 28%  numa-vmstat.node2.n=
r_active_anon
    172111 =C2=B1  3%     +44.0%     247796 =C2=B1  7%  numa-vmstat.node3.n=
r_active_file
    237162 =C2=B1  3%     +39.3%     330283 =C2=B1  7%  numa-vmstat.node3.n=
r_file_pages
     64157 =C2=B1  4%     +27.8%      81981 =C2=B1  5%  numa-vmstat.node3.n=
r_inactive_file
    399651 =C2=B1  6%     +31.0%     523683 =C2=B1  4%  numa-vmstat.node3.n=
uma_local
      2045 =C2=B1  7%     +39.1%       2846 =C2=B1  3%  numa-vmstat.node3.n=
r_writeback
      7273 =C2=B1  4%     +22.6%       8918 =C2=B1 12%  numa-vmstat.node3.n=
r_dirty
    279262 =C2=B1  3%     +47.4%     411657 =C2=B1  7%  numa-vmstat.node3.n=
r_dirtied
    456275 =C2=B1  6%     +27.1%     580148 =C2=B1  4%  numa-vmstat.node3.n=
uma_hit
     20934 =C2=B1  7%     +43.9%      30134 =C2=B1  9%  numa-vmstat.node3.n=
r_slab_reclaimable
    262081 =C2=B1  3%     +48.6%     389366 =C2=B1  7%  numa-vmstat.node3.n=
r_written
     13155 =C2=B1  6%     +21.2%      15938 =C2=B1  5%  slabinfo.bio-1.acti=
ve_objs
     13804 =C2=B1  5%     +20.9%      16687 =C2=B1  5%  slabinfo.bio-1.num_=
objs
      4757 =C2=B1  5%     +18.4%       5631 =C2=B1  5%  slabinfo.blkdev_req=
uests.num_objs
      4703 =C2=B1  5%     +18.8%       5588 =C2=B1  5%  slabinfo.blkdev_req=
uests.active_objs
     22272 =C2=B1  5%     +15.9%      25824 =C2=B1  2%  slabinfo.btrfs_dela=
yed_data_ref.active_objs
     22691 =C2=B1  5%     +15.7%      26260 =C2=B1  2%  slabinfo.btrfs_dela=
yed_data_ref.num_objs
    149035 =C2=B1  0%      +9.8%     163687 =C2=B1  3%  slabinfo.btrfs_dela=
yed_node.active_objs
    149048 =C2=B1  0%      +9.8%     163706 =C2=B1  3%  slabinfo.btrfs_dela=
yed_node.num_objs
      2811 =C2=B1  0%      +9.8%       3088 =C2=B1  3%  slabinfo.btrfs_dela=
yed_node.active_slabs
      2811 =C2=B1  0%      +9.8%       3088 =C2=B1  3%  slabinfo.btrfs_dela=
yed_node.num_slabs
     25945 =C2=B1  3%     +21.5%      31516 =C2=B1  2%  slabinfo.btrfs_dela=
yed_ref_head.active_objs
       516 =C2=B1  3%     +21.2%        626 =C2=B1  2%  slabinfo.btrfs_dela=
yed_ref_head.active_slabs
       516 =C2=B1  3%     +21.2%        626 =C2=B1  2%  slabinfo.btrfs_dela=
yed_ref_head.num_slabs
     26365 =C2=B1  3%     +21.2%      31951 =C2=B1  2%  slabinfo.btrfs_dela=
yed_ref_head.num_objs
    154947 =C2=B1  0%     +10.1%     170579 =C2=B1  3%  slabinfo.btrfs_exte=
nt_state.active_objs
      3050 =C2=B1  0%     +10.3%       3363 =C2=B1  3%  slabinfo.btrfs_exte=
nt_state.num_slabs
      3050 =C2=B1  0%     +10.3%       3363 =C2=B1  3%  slabinfo.btrfs_exte=
nt_state.active_slabs
    155604 =C2=B1  0%     +10.3%     171576 =C2=B1  3%  slabinfo.btrfs_exte=
nt_state.num_objs
      4495 =C2=B1  0%     +10.0%       4943 =C2=B1  3%  slabinfo.btrfs_inod=
e.num_slabs
    148319 =C2=B1  0%     +10.0%     163125 =C2=B1  3%  slabinfo.btrfs_inod=
e.active_objs
    148370 =C2=B1  0%     +10.0%     163162 =C2=B1  3%  slabinfo.btrfs_inod=
e.num_objs
      4495 =C2=B1  0%     +10.0%       4943 =C2=B1  3%  slabinfo.btrfs_inod=
e.active_slabs
     10848 =C2=B1  9%     +36.8%      14838 =C2=B1  4%  slabinfo.btrfs_orde=
red_extent.active_objs
       298 =C2=B1  9%     +35.8%        405 =C2=B1  4%  slabinfo.btrfs_orde=
red_extent.active_slabs
     11347 =C2=B1  9%     +35.9%      15417 =C2=B1  4%  slabinfo.btrfs_orde=
red_extent.num_objs
       298 =C2=B1  9%     +35.8%        405 =C2=B1  4%  slabinfo.btrfs_orde=
red_extent.num_slabs
       780 =C2=B1 45%    +118.8%       1706 =C2=B1 32%  slabinfo.buffer_hea=
d.active_objs
       926 =C2=B1 38%    +103.2%       1881 =C2=B1 30%  slabinfo.buffer_hea=
d.num_objs
     13688 =C2=B1  1%     -16.5%      11431 =C2=B1  2%  slabinfo.ext4_exten=
t_status.active_objs
     13688 =C2=B1  1%     -16.5%      11431 =C2=B1  2%  slabinfo.ext4_exten=
t_status.num_objs
       412 =C2=B1  1%     -32.2%        279 =C2=B1  2%  slabinfo.kmalloc-19=
2.num_slabs
     17308 =C2=B1  1%     -32.1%      11751 =C2=B1  2%  slabinfo.kmalloc-19=
2.active_objs
     17330 =C2=B1  1%     -32.2%      11753 =C2=B1  2%  slabinfo.kmalloc-19=
2.num_objs
       412 =C2=B1  1%     -32.2%        279 =C2=B1  2%  slabinfo.kmalloc-19=
2.active_slabs
     32558 =C2=B1  1%     -42.3%      18780 =C2=B1  3%  slabinfo.kmalloc-25=
6.num_objs
      1017 =C2=B1  1%     -42.4%        586 =C2=B1  3%  slabinfo.kmalloc-25=
6.num_slabs
      1017 =C2=B1  1%     -42.4%        586 =C2=B1  3%  slabinfo.kmalloc-25=
6.active_slabs
     30690 =C2=B1  1%     -40.2%      18339 =C2=B1  3%  slabinfo.kmalloc-25=
6.active_objs
       637 =C2=B1  3%     +36.3%        868 =C2=B1  2%  slabinfo.kmalloc-64=
.active_slabs
     40792 =C2=B1  3%     +36.3%      55612 =C2=B1  2%  slabinfo.kmalloc-64=
.num_objs
     39421 =C2=B1  4%     +38.9%      54746 =C2=B1  2%  slabinfo.kmalloc-64=
.active_objs
       637 =C2=B1  3%     +36.3%        868 =C2=B1  2%  slabinfo.kmalloc-64=
.num_slabs
       285 =C2=B1  9%     +41.3%        403 =C2=B1  7%  slabinfo.kmalloc-96=
.active_slabs
       285 =C2=B1  9%     +41.3%        403 =C2=B1  7%  slabinfo.kmalloc-96=
.num_slabs
     11479 =C2=B1 10%     +46.2%      16787 =C2=B1  6%  slabinfo.kmalloc-96=
.active_objs
     12007 =C2=B1  9%     +41.3%      16966 =C2=B1  6%  slabinfo.kmalloc-96=
.num_objs
      6250 =C2=B1  4%     -16.1%       5244 =C2=B1  7%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
       124 =C2=B1  5%     -32.5%         84 =C2=B1 31%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
        98 =C2=B1 20%     -28.3%         70 =C2=B1 37%  sched_debug.cfs_rq[=
10]:/.blocked_load_avg
      6066 =C2=B1  6%     -15.7%       5112 =C2=B1  8%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
      5999 =C2=B1  7%     -14.8%       5113 =C2=B1  7%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
      5986 =C2=B1  7%     -14.5%       5115 =C2=B1  7%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
      1084 =C2=B1  5%     -18.5%        883 =C2=B1  7%  sched_debug.cfs_rq[=
13]:/.utilization_load_avg
       109 =C2=B1 20%     -58.5%         45 =C2=B1 28%  sched_debug.cfs_rq[=
13]:/.blocked_load_avg
       131 =C2=B1 15%     -45.9%         71 =C2=B1 17%  sched_debug.cfs_rq[=
13]:/.tg_load_contrib
      5976 =C2=B1  7%     -14.9%       5087 =C2=B1  7%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
      5964 =C2=B1  7%     -14.9%       5075 =C2=B1  7%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
        73 =C2=B1 37%     -41.0%         43 =C2=B1 19%  sched_debug.cfs_rq[=
14]:/.blocked_load_avg
      5951 =C2=B1  7%     -14.7%       5075 =C2=B1  7%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
       140 =C2=B1 40%     -69.6%         42 =C2=B1 25%  sched_debug.cfs_rq[=
16]:/.blocked_load_avg
       156 =C2=B1 36%     -57.0%         67 =C2=B1 28%  sched_debug.cfs_rq[=
16]:/.tg_load_contrib
      5935 =C2=B1  6%     -15.3%       5025 =C2=B1  7%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
      5921 =C2=B1  7%     -15.2%       5019 =C2=B1  7%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
      1069 =C2=B1  3%     -12.5%        935 =C2=B1  5%  sched_debug.cfs_rq[=
17]:/.utilization_load_avg
      1008 =C2=B1  4%     -12.8%        879 =C2=B1  2%  sched_debug.cfs_rq[=
18]:/.utilization_load_avg
      5907 =C2=B1  6%     -15.5%       4994 =C2=B1  7%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
      5887 =C2=B1  6%     -15.7%       4965 =C2=B1  7%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
      6247 =C2=B1  4%     -16.5%       5213 =C2=B1  7%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
        15 =C2=B1 14%     +50.8%         23 =C2=B1 23%  sched_debug.cfs_rq[=
20]:/.runnable_load_avg
      5882 =C2=B1  5%     -15.6%       4964 =C2=B1  7%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
      1005 =C2=B1  2%     -10.2%        903 =C2=B1  6%  sched_debug.cfs_rq[=
20]:/.utilization_load_avg
      5889 =C2=B1  5%     -15.8%       4959 =C2=B1  7%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
      5872 =C2=B1  5%     -15.5%       4960 =C2=B1  8%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
        15 =C2=B1 17%    +100.0%         31 =C2=B1 38%  sched_debug.cfs_rq[=
22]:/.runnable_load_avg
      5818 =C2=B1  4%     -15.0%       4945 =C2=B1  8%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
        16 =C2=B1 11%    +110.9%         33 =C2=B1 47%  sched_debug.cfs_rq[=
23]:/.runnable_load_avg
      5795 =C2=B1  4%     -15.1%       4922 =C2=B1  7%  sched_debug.cfs_rq[=
24]:/.tg_load_avg
        14 =C2=B1  7%     +42.1%         20 =C2=B1  9%  sched_debug.cfs_rq[=
25]:/.runnable_load_avg
      5779 =C2=B1  4%     -15.4%       4888 =C2=B1  7%  sched_debug.cfs_rq[=
25]:/.tg_load_avg
      5768 =C2=B1  4%     -15.2%       4892 =C2=B1  7%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
      1045 =C2=B1  4%     -10.0%        940 =C2=B1  5%  sched_debug.cfs_rq[=
27]:/.utilization_load_avg
      5762 =C2=B1  4%     -15.1%       4892 =C2=B1  7%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
      1020 =C2=B1  2%     -10.5%        913 =C2=B1  8%  sched_debug.cfs_rq[=
28]:/.utilization_load_avg
      5741 =C2=B1  5%     -15.0%       4879 =C2=B1  7%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
      5709 =C2=B1  5%     -14.7%       4869 =C2=B1  8%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
      6247 =C2=B1  4%     -16.6%       5211 =C2=B1  7%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
      5683 =C2=B1  6%     -14.5%       4858 =C2=B1  8%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
      1030 =C2=B1  4%     -11.7%        909 =C2=B1  7%  sched_debug.cfs_rq[=
31]:/.utilization_load_avg
      5677 =C2=B1  5%     -14.4%       4859 =C2=B1  7%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
      5668 =C2=B1  5%     -14.4%       4851 =C2=B1  8%  sched_debug.cfs_rq[=
32]:/.tg_load_avg
      5651 =C2=B1  5%     -14.2%       4848 =C2=B1  8%  sched_debug.cfs_rq[=
33]:/.tg_load_avg
        99 =C2=B1 19%     -43.5%         56 =C2=B1 46%  sched_debug.cfs_rq[=
33]:/.tg_load_contrib
      5634 =C2=B1  5%     -14.1%       4841 =C2=B1  8%  sched_debug.cfs_rq[=
34]:/.tg_load_avg
      1027 =C2=B1  1%     -11.1%        913 =C2=B1  4%  sched_debug.cfs_rq[=
34]:/.utilization_load_avg
      5616 =C2=B1  6%     -13.7%       4844 =C2=B1  8%  sched_debug.cfs_rq[=
35]:/.tg_load_avg
      1019 =C2=B1  3%     -10.5%        912 =C2=B1  3%  sched_debug.cfs_rq[=
35]:/.utilization_load_avg
        41 =C2=B1 25%     -43.7%         23 =C2=B1 46%  sched_debug.cfs_rq[=
35]:/.blocked_load_avg
        58 =C2=B1 18%     -35.0%         38 =C2=B1 27%  sched_debug.cfs_rq[=
35]:/.tg_load_contrib
      5557 =C2=B1  6%     -12.9%       4843 =C2=B1  8%  sched_debug.cfs_rq[=
37]:/.tg_load_avg
      5534 =C2=B1  6%     -12.9%       4821 =C2=B1  8%  sched_debug.cfs_rq[=
38]:/.tg_load_avg
      5522 =C2=B1  6%     -12.8%       4817 =C2=B1  8%  sched_debug.cfs_rq[=
39]:/.tg_load_avg
      6251 =C2=B1  4%     -17.5%       5159 =C2=B1  7%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
      5488 =C2=B1  6%     -12.1%       4821 =C2=B1  9%  sched_debug.cfs_rq[=
40]:/.tg_load_avg
      5490 =C2=B1  7%     -12.3%       4817 =C2=B1  9%  sched_debug.cfs_rq[=
41]:/.tg_load_avg
       983 =C2=B1  1%      -9.8%        886 =C2=B1  5%  sched_debug.cfs_rq[=
42]:/.utilization_load_avg
      5500 =C2=B1  7%     -13.1%       4781 =C2=B1  8%  sched_debug.cfs_rq[=
42]:/.tg_load_avg
      5522 =C2=B1  7%     -13.7%       4763 =C2=B1  8%  sched_debug.cfs_rq[=
43]:/.tg_load_avg
      5488 =C2=B1  7%     -13.0%       4773 =C2=B1  8%  sched_debug.cfs_rq[=
44]:/.tg_load_avg
      6241 =C2=B1  4%     -17.5%       5149 =C2=B1  7%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
      5451 =C2=B1  6%     -12.8%       4753 =C2=B1  8%  sched_debug.cfs_rq[=
50]:/.tg_load_avg
      5446 =C2=B1  6%     -12.9%       4741 =C2=B1  8%  sched_debug.cfs_rq[=
51]:/.tg_load_avg
        65 =C2=B1 22%     +70.7%        112 =C2=B1 26%  sched_debug.cfs_rq[=
51]:/.tg_load_contrib
      5444 =C2=B1  5%     -13.2%       4727 =C2=B1  8%  sched_debug.cfs_rq[=
52]:/.tg_load_avg
       986 =C2=B1  2%     -12.0%        868 =C2=B1  9%  sched_debug.cfs_rq[=
52]:/.utilization_load_avg
       982 =C2=B1  4%      -7.7%        906 =C2=B1  3%  sched_debug.cfs_rq[=
53]:/.utilization_load_avg
      5440 =C2=B1  5%     -13.4%       4710 =C2=B1  8%  sched_debug.cfs_rq[=
53]:/.tg_load_avg
      5449 =C2=B1  5%     -13.8%       4697 =C2=B1  8%  sched_debug.cfs_rq[=
54]:/.tg_load_avg
      5432 =C2=B1  5%     -13.6%       4696 =C2=B1  8%  sched_debug.cfs_rq[=
55]:/.tg_load_avg
      1037 =C2=B1  4%      -9.5%        938 =C2=B1  5%  sched_debug.cfs_rq[=
56]:/.utilization_load_avg
      5420 =C2=B1  5%     -13.3%       4698 =C2=B1  8%  sched_debug.cfs_rq[=
56]:/.tg_load_avg
      5406 =C2=B1  5%     -13.0%       4703 =C2=B1  8%  sched_debug.cfs_rq[=
57]:/.tg_load_avg
        14 =C2=B1 46%    +125.9%         32 =C2=B1 27%  sched_debug.cfs_rq[=
59]:/.blocked_load_avg
       999 =C2=B1  2%     -10.0%        900 =C2=B1  4%  sched_debug.cfs_rq[=
59]:/.utilization_load_avg
        31 =C2=B1 17%     +52.4%         47 =C2=B1 18%  sched_debug.cfs_rq[=
59]:/.tg_load_contrib
      6221 =C2=B1  4%     -17.5%       5132 =C2=B1  7%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
        22 =C2=B1 47%    +238.6%         74 =C2=B1 39%  sched_debug.cfs_rq[=
61]:/.blocked_load_avg
      6205 =C2=B1  3%     -18.1%       5084 =C2=B1  7%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
      6215 =C2=B1  3%     -18.2%       5085 =C2=B1  7%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
      6240 =C2=B1  4%     -17.8%       5129 =C2=B1  7%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
       181 =C2=B1 28%     -45.9%         98 =C2=B1 31%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
      6121 =C2=B1  5%     -16.2%       5129 =C2=B1  8%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
     19078 =C2=B1  6%     -28.9%      13563 =C2=B1  8%  sched_debug.cpu#0.t=
twu_local
     35161 =C2=B1 17%     +52.1%      53462 =C2=B1 11%  sched_debug.cpu#1.t=
twu_count
      1962 =C2=B1 39%    +288.2%       7619 =C2=B1  5%  sched_debug.cpu#10.=
sched_goidle
     66011 =C2=B1 36%     +53.9%     101583 =C2=B1  1%  sched_debug.cpu#10.=
nr_switches
     35453 =C2=B1 35%     +61.4%      57210 =C2=B1  9%  sched_debug.cpu#10.=
ttwu_count
     88943 =C2=B1 29%     +76.0%     156556 =C2=B1 17%  sched_debug.cpu#10.=
sched_count
     25969 =C2=B1 25%    +111.8%      55004 =C2=B1  6%  sched_debug.cpu#11.=
ttwu_count
     49868 =C2=B1 37%     +96.8%      98135 =C2=B1  6%  sched_debug.cpu#11.=
nr_switches
     68156 =C2=B1 44%    +117.9%     148546 =C2=B1  6%  sched_debug.cpu#11.=
sched_count
     23306 =C2=B1 26%    +128.7%      53309 =C2=B1  5%  sched_debug.cpu#12.=
ttwu_count
     40188 =C2=B1 29%    +140.6%      96703 =C2=B1  3%  sched_debug.cpu#12.=
nr_switches
     48461 =C2=B1 36%    +102.2%      97965 =C2=B1  4%  sched_debug.cpu#13.=
nr_switches
     26539 =C2=B1 39%     +97.7%      52473 =C2=B1  1%  sched_debug.cpu#13.=
ttwu_count
      1460 =C2=B1 25%    +185.9%       4174 =C2=B1 20%  sched_debug.cpu#13.=
sched_goidle
     71509 =C2=B1 17%     +44.3%     103166 =C2=B1  9%  sched_debug.cpu#14.=
nr_switches
     38874 =C2=B1 18%     +49.7%      58201 =C2=B1  9%  sched_debug.cpu#14.=
ttwu_count
      1153 =C2=B1 30%    +408.5%       5863 =C2=B1 38%  sched_debug.cpu#14.=
sched_goidle
      1195 =C2=B1  8%    +399.5%       5971 =C2=B1 35%  sched_debug.cpu#15.=
sched_goidle
     37859 =C2=B1  7%     +60.8%      60891 =C2=B1  8%  sched_debug.cpu#16.=
ttwu_count
     70156 =C2=B1  7%     +49.9%     105147 =C2=B1  9%  sched_debug.cpu#16.=
nr_switches
      6740 =C2=B1 23%     +27.6%       8598 =C2=B1 15%  sched_debug.cpu#16.=
ttwu_local
     37750 =C2=B1 16%     +35.7%      51233 =C2=B1  9%  sched_debug.cpu#17.=
ttwu_count
     62627 =C2=B1 17%     +49.3%      93513 =C2=B1  8%  sched_debug.cpu#17.=
nr_switches
     82550 =C2=B1 40%     +72.9%     142697 =C2=B1  6%  sched_debug.cpu#18.=
sched_count
     29730 =C2=B1  7%     +88.5%      56041 =C2=B1 10%  sched_debug.cpu#18.=
ttwu_count
     51554 =C2=B1 12%     +94.0%     100034 =C2=B1  6%  sched_debug.cpu#18.=
nr_switches
     27954 =C2=B1 28%     +89.3%      52929 =C2=B1  7%  sched_debug.cpu#19.=
ttwu_count
     52842 =C2=B1 28%     +78.7%      94447 =C2=B1  4%  sched_debug.cpu#19.=
nr_switches
    102614 =C2=B1 27%     +62.1%     166382 =C2=B1 11%  sched_debug.cpu#2.s=
ched_count
     83727 =C2=B1  5%     +22.1%     102206 =C2=B1  8%  sched_debug.cpu#2.n=
r_switches
     43012 =C2=B1  6%     +24.5%      53564 =C2=B1  9%  sched_debug.cpu#2.t=
twu_count
      1947 =C2=B1  8%     -13.4%       1686 =C2=B1  4%  sched_debug.cpu#20.=
curr->pid
     66555 =C2=B1 19%    +117.3%     144596 =C2=B1 17%  sched_debug.cpu#20.=
sched_count
     61059 =C2=B1 27%     +61.7%      98727 =C2=B1 12%  sched_debug.cpu#20.=
nr_switches
     34340 =C2=B1 22%     +53.7%      52780 =C2=B1  9%  sched_debug.cpu#20.=
ttwu_count
     70412 =C2=B1 38%     +43.9%     101319 =C2=B1  9%  sched_debug.cpu#21.=
nr_switches
     38441 =C2=B1 39%     +41.1%      54237 =C2=B1  6%  sched_debug.cpu#21.=
ttwu_count
        15 =C2=B1  8%     +85.0%         27 =C2=B1 30%  sched_debug.cpu#21.=
cpu_load[1]
        14 =C2=B1  5%     +87.7%         26 =C2=B1 30%  sched_debug.cpu#21.=
cpu_load[0]
        16 =C2=B1 19%     +44.8%         24 =C2=B1 18%  sched_debug.cpu#22.=
cpu_load[2]
        16 =C2=B1 25%     +52.2%         25 =C2=B1 15%  sched_debug.cpu#22.=
cpu_load[1]
        17 =C2=B1 32%     +62.9%         28 =C2=B1 15%  sched_debug.cpu#22.=
cpu_load[0]
     11994 =C2=B1 39%     -46.6%       6399 =C2=B1  6%  sched_debug.cpu#22.=
ttwu_local
     35651 =C2=B1 18%     +47.1%      52430 =C2=B1  6%  sched_debug.cpu#23.=
ttwu_count
     71960 =C2=B1 17%    +101.7%     145130 =C2=B1 10%  sched_debug.cpu#23.=
sched_count
     61337 =C2=B1 18%     +51.6%      92983 =C2=B1  3%  sched_debug.cpu#23.=
nr_switches
     44512 =C2=B1 16%     +50.4%      66927 =C2=B1  7%  sched_debug.cpu#24.=
ttwu_count
    137523 =C2=B1 24%     +56.0%     214544 =C2=B1 13%  sched_debug.cpu#24.=
sched_count
     87003 =C2=B1 17%     +33.5%     116173 =C2=B1  8%  sched_debug.cpu#24.=
nr_switches
      4433 =C2=B1 16%     +76.8%       7839 =C2=B1 11%  sched_debug.cpu#25.=
ttwu_local
     50627 =C2=B1 25%    +103.5%     103034 =C2=B1  6%  sched_debug.cpu#25.=
nr_switches
     26207 =C2=B1 23%    +118.9%      57359 =C2=B1  6%  sched_debug.cpu#25.=
ttwu_count
        14 =C2=B1  5%    +219.0%         46 =C2=B1 47%  sched_debug.cpu#25.=
load
     36548 =C2=B1  8%     +69.0%      61761 =C2=B1  5%  sched_debug.cpu#26.=
ttwu_count
      6448 =C2=B1 21%     +32.4%       8539 =C2=B1  7%  sched_debug.cpu#26.=
ttwu_local
     68180 =C2=B1  3%     +56.0%     106383 =C2=B1  4%  sched_debug.cpu#26.=
nr_switches
      5533 =C2=B1 36%     +63.5%       9048 =C2=B1 18%  sched_debug.cpu#27.=
ttwu_local
     30828 =C2=B1 22%     +92.8%      59436 =C2=B1  9%  sched_debug.cpu#27.=
ttwu_count
     54617 =C2=B1 23%    +104.9%     111896 =C2=B1  8%  sched_debug.cpu#27.=
nr_switches
     34553 =C2=B1 44%    +200.7%     103888 =C2=B1  3%  sched_debug.cpu#28.=
nr_switches
     21363 =C2=B1 43%    +164.4%      56491 =C2=B1  4%  sched_debug.cpu#28.=
ttwu_count
      2441 =C2=B1 39%    +221.4%       7847 =C2=B1  5%  sched_debug.cpu#28.=
ttwu_local
     50398 =C2=B1 32%     +98.5%     100038 =C2=B1  5%  sched_debug.cpu#29.=
nr_switches
     25769 =C2=B1 26%    +120.9%      56936 =C2=B1  6%  sched_debug.cpu#29.=
ttwu_count
    804054 =C2=B1  4%     -10.7%     717817 =C2=B1  5%  sched_debug.cpu#29.=
avg_idle
     93854 =C2=B1 42%     +63.3%     153262 =C2=B1 17%  sched_debug.cpu#3.s=
ched_count
      4624 =C2=B1 44%     +58.5%       7329 =C2=B1  9%  sched_debug.cpu#3.t=
twu_local
      1923 =C2=B1  4%     -10.7%       1716 =C2=B1  2%  sched_debug.cpu#3.c=
urr->pid
     31079 =C2=B1 27%     +86.4%      57938 =C2=B1 13%  sched_debug.cpu#3.t=
twu_count
     55040 =C2=B1 23%     +81.8%     100066 =C2=B1 13%  sched_debug.cpu#3.n=
r_switches
     39383 =C2=B1 25%    +168.2%     105642 =C2=B1  5%  sched_debug.cpu#30.=
nr_switches
     21855 =C2=B1 16%    +167.6%      58481 =C2=B1  8%  sched_debug.cpu#30.=
ttwu_count
        13 =C2=B1  6%     +45.5%         20 =C2=B1 29%  sched_debug.cpu#30.=
cpu_load[3]
      3313 =C2=B1 21%    +135.3%       7795 =C2=B1  3%  sched_debug.cpu#30.=
ttwu_local
        13 =C2=B1  3%     +40.7%         19 =C2=B1 27%  sched_debug.cpu#30.=
cpu_load[4]
    812925 =C2=B1  6%     -13.2%     705760 =C2=B1  3%  sched_debug.cpu#30.=
avg_idle
     33023 =C2=B1 38%     +73.9%      57437 =C2=B1  8%  sched_debug.cpu#31.=
ttwu_count
     63557 =C2=B1 41%     +61.8%     102862 =C2=B1  6%  sched_debug.cpu#31.=
nr_switches
      1809 =C2=B1 40%    +248.0%       6296 =C2=B1 48%  sched_debug.cpu#32.=
sched_goidle
    871086 =C2=B1  4%     -16.8%     724925 =C2=B1  6%  sched_debug.cpu#34.=
avg_idle
     48226 =C2=B1 25%     +46.3%      70579 =C2=B1 11%  sched_debug.cpu#35.=
nr_switches
    866305 =C2=B1  3%     -12.2%     760880 =C2=B1  7%  sched_debug.cpu#35.=
avg_idle
     24790 =C2=B1 27%     +52.8%      37866 =C2=B1 10%  sched_debug.cpu#35.=
ttwu_count
    829898 =C2=B1  5%      -8.2%     761991 =C2=B1  4%  sched_debug.cpu#36.=
avg_idle
     85498 =C2=B1 23%     +52.8%     130666 =C2=B1 31%  sched_debug.cpu#36.=
sched_count
     54781 =C2=B1 30%     +42.4%      77991 =C2=B1 11%  sched_debug.cpu#37.=
nr_switches
    893753 =C2=B1  4%     -15.2%     758080 =C2=B1  4%  sched_debug.cpu#38.=
avg_idle
      5707 =C2=B1 17%     -23.8%       4347 =C2=B1  6%  sched_debug.cpu#38.=
ttwu_local
     79724 =C2=B1  8%     +42.7%     113786 =C2=B1 15%  sched_debug.cpu#38.=
sched_count
     45868 =C2=B1 26%     +51.7%      69597 =C2=B1 10%  sched_debug.cpu#39.=
nr_switches
     25981 =C2=B1 19%     +39.5%      36232 =C2=B1 13%  sched_debug.cpu#39.=
ttwu_count
     53420 =C2=B1 22%     +87.2%     100015 =C2=B1 16%  sched_debug.cpu#4.n=
r_switches
     30431 =C2=B1 20%     +76.1%      53584 =C2=B1 15%  sched_debug.cpu#4.t=
twu_count
     60135 =C2=B1 30%    +111.5%     127173 =C2=B1  9%  sched_debug.cpu#40.=
sched_count
       673 =C2=B1 43%    +382.6%       3251 =C2=B1 30%  sched_debug.cpu#40.=
sched_goidle
     32563 =C2=B1 20%     +33.5%      43476 =C2=B1  1%  sched_debug.cpu#41.=
ttwu_count
     61270 =C2=B1 18%     +26.8%      77709 =C2=B1  2%  sched_debug.cpu#41.=
nr_switches
       883 =C2=B1 30%    +282.6%       3378 =C2=B1 20%  sched_debug.cpu#41.=
sched_goidle
       574 =C2=B1 28%    +413.4%       2949 =C2=B1 15%  sched_debug.cpu#42.=
sched_goidle
     19789 =C2=B1 36%     +98.8%      39343 =C2=B1  3%  sched_debug.cpu#44.=
ttwu_count
     37257 =C2=B1 34%     +97.5%      73564 =C2=B1  4%  sched_debug.cpu#44.=
nr_switches
       560 =C2=B1 16%    +377.5%       2677 =C2=B1 21%  sched_debug.cpu#44.=
sched_goidle
     37056 =C2=B1 20%    +126.7%      84016 =C2=B1  5%  sched_debug.cpu#45.=
nr_switches
       578 =C2=B1 18%    +884.1%       5695 =C2=B1 39%  sched_debug.cpu#45.=
sched_goidle
     18635 =C2=B1 23%    +131.7%      43179 =C2=B1  6%  sched_debug.cpu#45.=
ttwu_count
       601 =C2=B1 34%    +584.0%       4110 =C2=B1 34%  sched_debug.cpu#46.=
sched_goidle
       626 =C2=B1  9%    +313.6%       2591 =C2=B1 17%  sched_debug.cpu#47.=
sched_goidle
     42230 =C2=B1 46%     +69.5%      71598 =C2=B1  3%  sched_debug.cpu#47.=
nr_switches
     54484 =C2=B1 34%     +52.4%      83042 =C2=B1  2%  sched_debug.cpu#48.=
nr_switches
      4659 =C2=B1 19%     +30.2%       6064 =C2=B1  6%  sched_debug.cpu#48.=
ttwu_local
     31320 =C2=B1 31%     +39.9%      43826 =C2=B1  4%  sched_debug.cpu#48.=
ttwu_count
     70129 =C2=B1 24%     +52.5%     106978 =C2=B1  7%  sched_debug.cpu#49.=
sched_count
     28541 =C2=B1 10%     +34.6%      38421 =C2=B1  8%  sched_debug.cpu#49.=
ttwu_count
     50959 =C2=B1  8%     +46.8%      74794 =C2=B1  9%  sched_debug.cpu#49.=
nr_switches
     65004 =C2=B1  5%     +50.9%      98113 =C2=B1 16%  sched_debug.cpu#5.n=
r_switches
     35371 =C2=B1  3%     +48.6%      52545 =C2=B1 19%  sched_debug.cpu#5.t=
twu_count
     92569 =C2=B1 33%     +67.5%     155022 =C2=B1 22%  sched_debug.cpu#5.s=
ched_count
     24318 =C2=B1 45%     +74.3%      42375 =C2=B1  7%  sched_debug.cpu#50.=
ttwu_count
    812425 =C2=B1  6%      -8.6%     742308 =C2=B1  6%  sched_debug.cpu#50.=
avg_idle
     22163 =C2=B1 45%     +98.7%      44048 =C2=B1  4%  sched_debug.cpu#51.=
ttwu_count
        14 =C2=B1 12%     +62.7%         24 =C2=B1 32%  sched_debug.cpu#51.=
cpu_load[4]
     41742 =C2=B1 44%     +95.1%      81441 =C2=B1  7%  sched_debug.cpu#51.=
nr_switches
        17 =C2=B1 17%     +61.4%         28 =C2=B1  9%  sched_debug.cpu#52.=
cpu_load[1]
        15 =C2=B1 21%     +85.5%         28 =C2=B1 15%  sched_debug.cpu#52.=
cpu_load[0]
     27487 =C2=B1 28%     +55.9%      42846 =C2=B1  6%  sched_debug.cpu#53.=
ttwu_count
     52707 =C2=B1 28%     +54.9%      81651 =C2=B1  8%  sched_debug.cpu#53.=
nr_switches
     88419 =C2=B1 13%     +26.3%     111637 =C2=B1  4%  sched_debug.cpu#54.=
sched_count
      7516 =C2=B1 25%     -34.7%       4911 =C2=B1  9%  sched_debug.cpu#54.=
ttwu_local
     55718 =C2=B1 35%    +120.5%     122882 =C2=B1 12%  sched_debug.cpu#55.=
sched_count
     91906 =C2=B1 41%     +74.6%     160480 =C2=B1  8%  sched_debug.cpu#56.=
sched_count
     27177 =C2=B1 16%     +73.1%      47055 =C2=B1  7%  sched_debug.cpu#56.=
ttwu_count
     47704 =C2=B1 23%     +76.7%      84275 =C2=B1  4%  sched_debug.cpu#56.=
nr_switches
       604 =C2=B1 35%    +468.4%       3434 =C2=B1 21%  sched_debug.cpu#56.=
sched_goidle
    827807 =C2=B1  5%     -12.8%     721768 =C2=B1  7%  sched_debug.cpu#56.=
avg_idle
       515 =C2=B1 26%    +424.2%       2701 =C2=B1 12%  sched_debug.cpu#57.=
sched_goidle
     23809 =C2=B1 22%     +90.9%      45451 =C2=B1  1%  sched_debug.cpu#57.=
ttwu_count
     45968 =C2=B1 31%     +78.9%      82257 =C2=B1  6%  sched_debug.cpu#57.=
nr_switches
    875107 =C2=B1  4%     -14.0%     752232 =C2=B1  3%  sched_debug.cpu#57.=
avg_idle
     83719 =C2=B1 30%     +55.5%     130224 =C2=B1 27%  sched_debug.cpu#58.=
sched_count
     31995 =C2=B1 28%     +44.4%      46208 =C2=B1  6%  sched_debug.cpu#58.=
ttwu_count
     51161 =C2=B1 28%     +71.5%      87746 =C2=B1  2%  sched_debug.cpu#59.=
nr_switches
     55238 =C2=B1 31%    +153.1%     139803 =C2=B1 13%  sched_debug.cpu#59.=
sched_count
     25699 =C2=B1 29%     +77.0%      45500 =C2=B1  3%  sched_debug.cpu#59.=
ttwu_count
      3161 =C2=B1 37%     +91.5%       6055 =C2=B1 15%  sched_debug.cpu#59.=
ttwu_local
     85318 =C2=B1 41%     +65.1%     140868 =C2=B1 19%  sched_debug.cpu#6.s=
ched_count
     39313 =C2=B1 29%     +31.3%      51605 =C2=B1 13%  sched_debug.cpu#6.t=
twu_count
       604 =C2=B1 16%    +539.8%       3864 =C2=B1 34%  sched_debug.cpu#60.=
sched_goidle
       652 =C2=B1 34%    +411.6%       3336 =C2=B1 15%  sched_debug.cpu#61.=
sched_goidle
     49314 =C2=B1 39%     +70.0%      83813 =C2=B1  4%  sched_debug.cpu#61.=
nr_switches
      3612 =C2=B1 24%     +60.3%       5790 =C2=B1 10%  sched_debug.cpu#61.=
ttwu_local
     24493 =C2=B1 36%     +78.5%      43729 =C2=B1  5%  sched_debug.cpu#61.=
ttwu_count
     44115 =C2=B1 24%     +89.3%      83509 =C2=B1  0%  sched_debug.cpu#62.=
nr_switches
        13 =C2=B1  6%     +23.6%         17 =C2=B1 13%  sched_debug.cpu#62.=
cpu_load[2]
     22787 =C2=B1 20%     +98.8%      45293 =C2=B1  7%  sched_debug.cpu#62.=
ttwu_count
        13 =C2=B1  5%     +28.8%         16 =C2=B1 18%  sched_debug.cpu#62.=
cpu_load[1]
      3425 =C2=B1 25%     +68.8%       5779 =C2=B1 10%  sched_debug.cpu#62.=
ttwu_local
    876411 =C2=B1  2%     -15.0%     744890 =C2=B1  5%  sched_debug.cpu#62.=
avg_idle
      3611 =C2=B1 32%     +65.3%       5970 =C2=B1  8%  sched_debug.cpu#63.=
ttwu_local
     25235 =C2=B1 17%     +69.6%      42800 =C2=B1 10%  sched_debug.cpu#63.=
ttwu_count
     49989 =C2=B1 20%     +68.1%      84050 =C2=B1  6%  sched_debug.cpu#63.=
nr_switches
       525 =C2=B1 32%    +503.7%       3169 =C2=B1 38%  sched_debug.cpu#63.=
sched_goidle
     73460 =C2=B1 36%     +84.2%     135279 =C2=B1 10%  sched_debug.cpu#63.=
sched_count
     58252 =C2=B1 30%     +68.1%      97924 =C2=B1 10%  sched_debug.cpu#7.n=
r_switches
     33244 =C2=B1 20%     +55.4%      51659 =C2=B1 11%  sched_debug.cpu#7.t=
twu_count
      1855 =C2=B1  7%     -12.2%       1629 =C2=B1  7%  sched_debug.cpu#7.c=
urr->pid
      1636 =C2=B1 40%    +369.2%       7680 =C2=B1 40%  sched_debug.cpu#8.s=
ched_goidle
     72671 =C2=B1 34%     +44.6%     105089 =C2=B1  7%  sched_debug.cpu#8.n=
r_switches
     39153 =C2=B1 31%     +53.2%      59977 =C2=B1  5%  sched_debug.cpu#8.t=
twu_count
    126260 =C2=B1 26%     +39.3%     175896 =C2=B1  9%  sched_debug.cpu#8.s=
ched_count
     34894 =C2=B1 28%     +58.4%      55261 =C2=B1  3%  sched_debug.cpu#9.t=
twu_count
     65866 =C2=B1 30%     +49.0%      98128 =C2=B1  4%  sched_debug.cpu#9.n=
r_switches
      2082 =C2=B1 49%    +204.2%       6335 =C2=B1 34%  sched_debug.cpu#9.s=
ched_goidle

testbox/testcase/testparams: lkp-wsx02/netperf/performance-300s-200%-TCP_SE=
NDFILE

4ddbf3b0f1f755a5  3bb1e2aecc81817e158bead697  =

----------------  --------------------------  =

      9782 =C2=B1  0%      -8.5%       8952 =C2=B1  0%  netperf.Throughput_=
Mbps
       395 =C2=B1  1%      -9.5%        358 =C2=B1  0%  netperf.time.user_t=
ime
      4265 =C2=B1  0%      +3.1%       4399 =C2=B1  0%  netperf.time.percen=
t_of_cpu_this_job_got
     12458 =C2=B1  0%      +3.6%      12900 =C2=B1  0%  netperf.time.system=
_time
     67186 =C2=B1  0%     +25.9%      84577 =C2=B1  1%  netperf.time.minor_=
page_faults
  13990021 =C2=B1  0%     -31.7%    9552475 =C2=B1  0%  netperf.time.volunt=
ary_context_switches
    202883 =C2=B1  7%    +794.0%    1813788 =C2=B1  0%  netperf.time.involu=
ntary_context_switches
     96523 =C2=B1  0%     +24.9%     120570 =C2=B1  0%  vmstat.system.cs
     84350 =C2=B1  0%      +1.3%      85421 =C2=B1  0%  vmstat.system.in
 2.838e+08 =C2=B1  0%     +31.1%   3.72e+08 =C2=B1  1%  softirqs.NET_RX
   1571497 =C2=B1  4%     -12.1%    1380801 =C2=B1  3%  softirqs.RCU
    169683 =C2=B1 17%   +5190.5%    8977094 =C2=B1  1%  softirqs.SCHED
    202883 =C2=B1  7%    +794.0%    1813788 =C2=B1  0%  time.involuntary_co=
ntext_switches
     67186 =C2=B1  0%     +25.9%      84577 =C2=B1  1%  time.minor_page_fau=
lts
       395 =C2=B1  1%      -9.5%        358 =C2=B1  0%  time.user_time
  13990021 =C2=B1  0%     -31.7%    9552475 =C2=B1  0%  time.voluntary_cont=
ext_switches
      0.05 =C2=B1  9%   +1068.4%       0.56 =C2=B1  1%  turbostat.CPU%c1
    196676 =C2=B1 22%    +584.8%    1346889 =C2=B1  4%  numa-numastat.node2=
.local_node
    197504 =C2=B1 21%    +583.6%    1350227 =C2=B1  4%  numa-numastat.node2=
.numa_hit
    147543 =C2=B1  1%    +124.2%     330815 =C2=B1  8%  proc-vmstat.numa_hi=
nt_faults
    141668 =C2=B1  0%    +123.9%     317172 =C2=B1  8%  proc-vmstat.numa_hi=
nt_faults_local
   1282739 =C2=B1  5%    +334.4%    5572242 =C2=B1  4%  proc-vmstat.numa_hit
   1280438 =C2=B1  4%    +335.0%    5569683 =C2=B1  4%  proc-vmstat.numa_lo=
cal
      5521 =C2=B1 18%    +118.2%      12048 =C2=B1 12%  proc-vmstat.numa_pa=
ges_migrated
    158793 =C2=B1  0%    +116.0%     342966 =C2=B1  8%  proc-vmstat.numa_pt=
e_updates
     58509 =C2=B1 48%    +822.4%     539678 =C2=B1  2%  proc-vmstat.pgalloc=
_dma32
   3549265 =C2=B1 10%    +683.0%   27790088 =C2=B1  4%  proc-vmstat.pgalloc=
_normal
   1210587 =C2=B1  0%     +28.1%    1550448 =C2=B1  3%  proc-vmstat.pgfault
   3554462 =C2=B1 10%    +695.5%   28275635 =C2=B1  4%  proc-vmstat.pgfree
      5521 =C2=B1 18%    +118.2%      12048 =C2=B1 12%  proc-vmstat.pgmigra=
te_success
   2465916 =C2=B1  7%   +4664.9%  1.175e+08 =C2=B1  2%  cpuidle.C1-NHM.time
    119654 =C2=B1  9%   +4789.9%    5850977 =C2=B1  2%  cpuidle.C1-NHM.usage
      1007 =C2=B1  9%  +11933.9%     121272 =C2=B1  1%  cpuidle.C1E-NHM.usa=
ge
   1910695 =C2=B1 32%    +491.0%   11292072 =C2=B1 15%  cpuidle.C3-NHM.time
      1161 =C2=B1  8%   +8519.0%     100131 =C2=B1  2%  cpuidle.C3-NHM.usage
      9209 =C2=B1  3%     +15.7%      10651 =C2=B1  7%  cpuidle.C6-NHM.usage
       335 =C2=B1 16%   +2651.5%       9238 =C2=B1  2%  cpuidle.POLL.time
        13 =C2=B1 23%   +1698.1%        233 =C2=B1  5%  cpuidle.POLL.usage
    295003 =C2=B1  2%     +21.2%     357597 =C2=B1 14%  numa-meminfo.node0.=
MemUsed
      4290 =C2=B1 17%     -33.6%       2849 =C2=B1  8%  numa-meminfo.node1.=
KernelStack
    275398 =C2=B1  2%     +21.4%     334430 =C2=B1 14%  numa-meminfo.node1.=
MemUsed
       183 =C2=B1 19%     -45.8%         99 =C2=B1 27%  numa-vmstat.node0.n=
r_dirtied
       182 =C2=B1 19%     -46.2%         98 =C2=B1 28%  numa-vmstat.node0.n=
r_written
     36277 =C2=B1  0%     -29.6%      25537 =C2=B1 13%  numa-vmstat.node0.n=
uma_other
    226390 =C2=B1 37%    +261.3%     817957 =C2=B1  5%  numa-vmstat.node0.n=
uma_hit
    190111 =C2=B1 44%    +316.8%     792419 =C2=B1  5%  numa-vmstat.node0.n=
uma_local
    339770 =C2=B1 42%    +137.1%     805686 =C2=B1  4%  numa-vmstat.node1.n=
uma_hit
     49644 =C2=B1  0%     -22.0%      38725 =C2=B1 10%  numa-vmstat.node1.n=
uma_other
       267 =C2=B1 17%     -33.7%        177 =C2=B1  8%  numa-vmstat.node1.n=
r_kernel_stack
    192193 =C2=B1 13%    +282.4%     734878 =C2=B1  5%  numa-vmstat.node2.n=
uma_local
     15362 =C2=B1 14%    +138.3%      36609 =C2=B1  3%  numa-vmstat.node2.n=
uma_other
    207556 =C2=B1 11%    +271.7%     771488 =C2=B1  4%  numa-vmstat.node2.n=
uma_hit
     17243 =C2=B1  0%     -11.1%      15334 =C2=B1  0%  slabinfo.kmalloc-10=
24.active_objs
     17416 =C2=B1  0%     -10.4%      15602 =C2=B1  0%  slabinfo.kmalloc-10=
24.num_objs
      3.45 =C2=B1  1%     +30.3%       4.49 =C2=B1  1%  perf-profile.cpu-cy=
cles.tcp_send_ack.tcp_cleanup_rbuf.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      2.70 =C2=B1  0%     +27.1%       3.43 =C2=B1  2%  perf-profile.cpu-cy=
cles.ip_queue_xmit.tcp_transmit_skb.tcp_send_ack.tcp_cleanup_rbuf.tcp_recvm=
sg
      1.94 =C2=B1  0%     +10.8%       2.15 =C2=B1  1%  perf-profile.cpu-cy=
cles.tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.tcp_rcv_esta=
blished.tcp_v4_do_rcv
      6.39 =C2=B1  0%     +10.6%       7.07 =C2=B1  1%  perf-profile.cpu-cy=
cles.__local_bh_enable_ip.ip_finish_output.ip_output.ip_local_out_sk.ip_que=
ue_xmit
     28.47 =C2=B1  0%     +10.3%      31.41 =C2=B1  0%  perf-profile.cpu-cy=
cles.pipe_to_sendpage.__splice_from_pipe.splice_from_pipe.generic_splice_se=
ndpage.direct_splice_actor
      7.45 =C2=B1  0%     +10.4%       8.23 =C2=B1  0%  perf-profile.cpu-cy=
cles.__netif_receive_skb_core.__netif_receive_skb.process_backlog.net_rx_ac=
tion.__do_softirq
      2.71 =C2=B1  1%     +29.3%       3.50 =C2=B1  1%  perf-profile.cpu-cy=
cles.ip_local_out_sk.ip_queue_xmit.tcp_transmit_skb.tcp_send_ack.tcp_cleanu=
p_rbuf
      6.74 =C2=B1  0%     +16.2%       7.84 =C2=B1  0%  perf-profile.cpu-cy=
cles.ip_rcv.__netif_receive_skb_core.__netif_receive_skb.process_backlog.ne=
t_rx_action
      2.20 =C2=B1  1%     -19.7%       1.77 =C2=B1  2%  perf-profile.cpu-cy=
cles.copy_page_to_iter_iovec.copy_page_to_iter.skb_copy_datagram_iter.tcp_r=
ecvmsg.inet_recvmsg
      0.28 =C2=B1 14%    +606.2%       2.00 =C2=B1  2%  perf-profile.cpu-cy=
cles.release_sock.tcp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_recvfrom
      1.89 =C2=B1  1%     -36.9%       1.19 =C2=B1  0%  perf-profile.cpu-cy=
cles.__local_bh_enable_ip.tcp_prequeue_process.tcp_recvmsg.inet_recvmsg.soc=
k_recvmsg
      2.39 =C2=B1  1%     +24.0%       2.97 =C2=B1  2%  perf-profile.cpu-cy=
cles.__dev_queue_xmit.dev_queue_xmit.ip_finish_output.ip_output.ip_local_ou=
t_sk
      1.91 =C2=B1  1%     -37.2%       1.20 =C2=B1  0%  perf-profile.cpu-cy=
cles.__do_softirq.do_softirq_own_stack.do_softirq.__local_bh_enable_ip.tcp_=
prequeue_process
      6.17 =C2=B1  0%     +11.5%       6.88 =C2=B1  0%  perf-profile.cpu-cy=
cles.ip_local_deliver_finish.ip_local_deliver.ip_rcv_finish.ip_rcv.__netif_=
receive_skb_core
      1.77 =C2=B1  1%     -12.1%       1.56 =C2=B1  1%  perf-profile.cpu-cy=
cles.tcp_write_xmit.__tcp_push_pending_frames.tcp_push.tcp_sendpage.inet_se=
ndpage
      6.42 =C2=B1  0%     +15.5%       7.41 =C2=B1  0%  perf-profile.cpu-cy=
cles.ip_rcv_finish.ip_rcv.__netif_receive_skb_core.__netif_receive_skb.proc=
ess_backlog
      8.50 =C2=B1  0%     +15.3%       9.80 =C2=B1  0%  perf-profile.cpu-cy=
cles.ip_finish_output.ip_output.ip_local_out_sk.ip_queue_xmit.tcp_transmit_=
skb
      0.28 =C2=B1 13%    +224.8%       0.92 =C2=B1 11%  perf-profile.cpu-cy=
cles.nf_hook_slow.ip_output.ip_local_out_sk.ip_queue_xmit.tcp_transmit_skb
      1.72 =C2=B1  1%     +91.6%       3.30 =C2=B1  1%  perf-profile.cpu-cy=
cles.release_sock.tcp_sendpage.inet_sendpage.kernel_sendpage.sock_sendpage
      1.06 =C2=B1  7%     -19.5%       0.85 =C2=B1 13%  perf-profile.cpu-cy=
cles.tcp_established_options.tcp_current_mss.tcp_send_mss.tcp_sendpage.inet=
_sendpage
     27.29 =C2=B1  0%     +10.7%      30.22 =C2=B1  0%  perf-profile.cpu-cy=
cles.inet_sendpage.kernel_sendpage.sock_sendpage.pipe_to_sendpage.__splice_=
from_pipe
      6.35 =C2=B1  0%      +9.9%       6.98 =C2=B1  1%  perf-profile.cpu-cy=
cles.do_softirq.part.13.__local_bh_enable_ip.ip_finish_output.ip_output.ip_=
local_out_sk
      7.19 =C2=B1  0%     +13.0%       8.12 =C2=B1  0%  perf-profile.cpu-cy=
cles.tcp_write_xmit.tcp_push_one.tcp_sendpage.inet_sendpage.kernel_sendpage
      0.43 =C2=B1  1%    +159.6%       1.11 =C2=B1  0%  perf-profile.cpu-cy=
cles.tcp_v4_do_rcv.release_sock.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      4.82 =C2=B1  0%     +14.6%       5.52 =C2=B1  0%  perf-profile.cpu-cy=
cles.ip_local_out_sk.ip_queue_xmit.tcp_transmit_skb.tcp_write_xmit.tcp_push=
_one
      0.62 =C2=B1  2%    +178.9%       1.72 =C2=B1  1%  perf-profile.cpu-cy=
cles._raw_spin_lock_bh.lock_sock_nested.tcp_sendpage.inet_sendpage.kernel_s=
endpage
      3.32 =C2=B1  1%     -17.2%       2.75 =C2=B1  0%  perf-profile.cpu-cy=
cles.tcp_prequeue_process.tcp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_recvfr=
om
      5.16 =C2=B1  0%     +12.2%       5.79 =C2=B1  1%  perf-profile.cpu-cy=
cles.ip_queue_xmit.tcp_transmit_skb.tcp_write_xmit.tcp_push_one.tcp_sendpage
     33.41 =C2=B1  0%     -12.7%      29.17 =C2=B1  0%  perf-profile.cpu-cy=
cles.copy_page_to_iter.skb_copy_datagram_iter.tcp_recvmsg.inet_recvmsg.sock=
_recvmsg
     34.91 =C2=B1  0%     -12.7%      30.48 =C2=B1  0%  perf-profile.cpu-cy=
cles.skb_copy_datagram_iter.tcp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_recv=
from
      1.03 =C2=B1  3%     -10.7%       0.92 =C2=B1  1%  perf-profile.cpu-cy=
cles.rw_verify_area.do_splice_to.splice_direct_to_actor.do_splice_direct.do=
_sendfile
      5.91 =C2=B1  0%     +14.9%       6.79 =C2=B1  0%  perf-profile.cpu-cy=
cles.tcp_transmit_skb.tcp_write_xmit.tcp_push_one.tcp_sendpage.inet_sendpage
      7.22 =C2=B1  0%     +12.9%       8.15 =C2=B1  0%  perf-profile.cpu-cy=
cles.tcp_push_one.tcp_sendpage.inet_sendpage.kernel_sendpage.sock_sendpage
      2.15 =C2=B1  2%      +9.4%       2.35 =C2=B1  2%  perf-profile.cpu-cy=
cles.__kfree_skb.tcp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_recvfrom
      6.25 =C2=B1  0%     +10.7%       6.92 =C2=B1  1%  perf-profile.cpu-cy=
cles.__do_softirq.do_softirq_own_stack.do_softirq.__local_bh_enable_ip.ip_f=
inish_output
     27.76 =C2=B1  0%     +10.8%      30.75 =C2=B1  0%  perf-profile.cpu-cy=
cles.sock_sendpage.pipe_to_sendpage.__splice_from_pipe.splice_from_pipe.gen=
eric_splice_sendpage
      7.51 =C2=B1  0%     +10.1%       8.27 =C2=B1  0%  perf-profile.cpu-cy=
cles.__netif_receive_skb.process_backlog.net_rx_action.__do_softirq.do_soft=
irq_own_stack
      0.00 =C2=B1  0%      +Inf%       1.24 =C2=B1  2%  perf-profile.cpu-cy=
cles._raw_spin_unlock_bh.release_sock.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      2.56 =C2=B1  2%     +18.6%       3.03 =C2=B1  1%  perf-profile.cpu-cy=
cles.dev_queue_xmit.ip_finish_output.ip_output.ip_local_out_sk.ip_queue_xmit
      2.58 =C2=B1  1%     +34.2%       3.47 =C2=B1  3%  perf-profile.cpu-cy=
cles.tcp_transmit_skb.tcp_send_ack.tcp_cleanup_rbuf.tcp_recvmsg.inet_recvmsg
      1.85 =C2=B1  2%     -11.1%       1.64 =C2=B1  1%  perf-profile.cpu-cy=
cles.tcp_write_xmit.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_do=
_rcv.tcp_v4_rcv
     25.75 =C2=B1  0%     +11.2%      28.63 =C2=B1  0%  perf-profile.cpu-cy=
cles.tcp_sendpage.inet_sendpage.kernel_sendpage.sock_sendpage.pipe_to_sendp=
age
      1.91 =C2=B1  2%     -15.6%       1.61 =C2=B1  1%  perf-profile.cpu-cy=
cles.tcp_push.tcp_sendpage.inet_sendpage.kernel_sendpage.sock_sendpage
      0.00 =C2=B1  0%      +Inf%       1.44 =C2=B1  2%  perf-profile.cpu-cy=
cles.tcp_rcv_established.tcp_v4_do_rcv.release_sock.tcp_sendpage.inet_sendp=
age
      0.00 =C2=B1  0%      +Inf%       1.45 =C2=B1  2%  perf-profile.cpu-cy=
cles.tcp_v4_do_rcv.release_sock.tcp_sendpage.inet_sendpage.kernel_sendpage
      2.83 =C2=B1  1%     +35.3%       3.83 =C2=B1  0%  perf-profile.cpu-cy=
cles.ip_output.ip_local_out_sk.ip_queue_xmit.tcp_transmit_skb.tcp_send_ack
     30.67 =C2=B1  0%     -13.9%      26.41 =C2=B1  1%  perf-profile.cpu-cy=
cles.copy_user_generic_string.copy_page_to_iter.skb_copy_datagram_iter.tcp_=
recvmsg.inet_recvmsg
      0.23 =C2=B1 12%    +512.9%       1.42 =C2=B1  1%  perf-profile.cpu-cy=
cles._raw_spin_unlock_bh.release_sock.tcp_sendpage.inet_sendpage.kernel_sen=
dpage
      1.86 =C2=B1  2%     -11.0%       1.66 =C2=B1  1%  perf-profile.cpu-cy=
cles.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv=
.ip_local_deliver_finish
      6.26 =C2=B1  0%     +13.3%       7.09 =C2=B1  0%  perf-profile.cpu-cy=
cles.ip_local_deliver.ip_rcv_finish.ip_rcv.__netif_receive_skb_core.__netif=
_receive_skb
      1.92 =C2=B1  1%     -38.1%       1.19 =C2=B1  0%  perf-profile.cpu-cy=
cles.do_softirq.part.13.__local_bh_enable_ip.tcp_prequeue_process.tcp_recvm=
sg.inet_recvmsg
      3.55 =C2=B1  0%     +34.9%       4.79 =C2=B1  0%  perf-profile.cpu-cy=
cles.tcp_cleanup_rbuf.tcp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_recvfrom
      6.51 =C2=B1  0%     +11.1%       7.23 =C2=B1  0%  perf-profile.cpu-cy=
cles.ip_output.ip_local_out_sk.ip_queue_xmit.tcp_transmit_skb.tcp_write_xmit
     27.53 =C2=B1  0%     +11.0%      30.55 =C2=B1  0%  perf-profile.cpu-cy=
cles.kernel_sendpage.sock_sendpage.pipe_to_sendpage.__splice_from_pipe.spli=
ce_from_pipe
      2.85 =C2=B1  1%     +16.9%       3.34 =C2=B1  1%  perf-profile.cpu-cy=
cles.lock_sock_nested.tcp_sendpage.inet_sendpage.kernel_sendpage.sock_sendp=
age
      1.92 =C2=B1  1%     -38.5%       1.18 =C2=B1  0%  perf-profile.cpu-cy=
cles.do_softirq_own_stack.do_softirq.__local_bh_enable_ip.tcp_prequeue_proc=
ess.tcp_recvmsg
      1.91 =C2=B1  7%     -13.0%       1.66 =C2=B1  3%  perf-profile.cpu-cy=
cles.tcp_current_mss.tcp_send_mss.tcp_sendpage.inet_sendpage.kernel_sendpage
      0.36 =C2=B1  1%    +180.4%       1.00 =C2=B1  1%  perf-profile.cpu-cy=
cles.tcp_rcv_established.tcp_v4_do_rcv.release_sock.tcp_recvmsg.inet_recvmsg
      5045 =C2=B1  2%     -14.5%       4312 =C2=B1  1%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
   7350151 =C2=B1  2%     +10.1%    8091717 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     83919 =C2=B1  4%     -35.0%      54579 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.nr_spread_over
       149 =C2=B1 34%     -62.5%         56 =C2=B1 37%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
      4833 =C2=B1  3%     -13.0%       4205 =C2=B1  3%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
     91887 =C2=B1  4%     -40.0%      55114 =C2=B1  1%  sched_debug.cfs_rq[=
10]:/.nr_spread_over
     89514 =C2=B1 10%     -38.0%      55492 =C2=B1  1%  sched_debug.cfs_rq[=
11]:/.nr_spread_over
      4794 =C2=B1  4%     -13.5%       4146 =C2=B1  4%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
     82451 =C2=B1  8%     -32.3%      55796 =C2=B1  1%  sched_debug.cfs_rq[=
12]:/.nr_spread_over
       670 =C2=B1  6%     -11.2%        595 =C2=B1  1%  sched_debug.cfs_rq[=
12]:/.utilization_load_avg
   7272747 =C2=B1  4%     +12.0%    8145981 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.min_vruntime
   7005279 =C2=B1  4%     -11.5%    6197700 =C2=B1  5%  sched_debug.cfs_rq[=
12]:/.MIN_vruntime
   7005279 =C2=B1  4%     -11.5%    6197703 =C2=B1  5%  sched_debug.cfs_rq[=
12]:/.max_vruntime
      4781 =C2=B1  4%     -13.4%       4140 =C2=B1  4%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
     83228 =C2=B1  4%     -33.9%      55027 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.nr_spread_over
   7103592 =C2=B1  4%     -14.2%    6094054 =C2=B1  8%  sched_debug.cfs_rq[=
13]:/.MIN_vruntime
   7279736 =C2=B1  2%     +10.4%    8037151 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.min_vruntime
   7103592 =C2=B1  4%     -14.2%    6094056 =C2=B1  8%  sched_debug.cfs_rq[=
13]:/.max_vruntime
      4765 =C2=B1  4%     -12.8%       4155 =C2=B1  4%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
     92902 =C2=B1  3%     -40.2%      55581 =C2=B1  1%  sched_debug.cfs_rq[=
14]:/.nr_spread_over
      4744 =C2=B1  4%     -12.5%       4149 =C2=B1  4%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
     89708 =C2=B1 14%     -38.5%      55133 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.nr_spread_over
      4726 =C2=B1  4%     -12.8%       4121 =C2=B1  4%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
     83283 =C2=B1  7%     -33.2%      55602 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.nr_spread_over
        23 =C2=B1  3%      -9.7%         21 =C2=B1  3%  sched_debug.cfs_rq[=
16]:/.runnable_load_avg
      4716 =C2=B1  4%     -12.8%       4112 =C2=B1  4%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
   7308779 =C2=B1  3%     +11.2%    8130348 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.min_vruntime
   7074901 =C2=B1  3%     -14.6%    6038543 =C2=B1  8%  sched_debug.cfs_rq[=
17]:/.max_vruntime
     82867 =C2=B1  4%     -33.3%      55259 =C2=B1  1%  sched_debug.cfs_rq[=
17]:/.nr_spread_over
   7235244 =C2=B1  2%     +11.2%    8045671 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.min_vruntime
      4698 =C2=B1  4%     -12.9%       4093 =C2=B1  4%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
   7074898 =C2=B1  3%     -14.6%    6038543 =C2=B1  8%  sched_debug.cfs_rq[=
17]:/.MIN_vruntime
   7641609 =C2=B1  4%     -14.4%    6544905 =C2=B1  4%  sched_debug.cfs_rq[=
18]:/.MIN_vruntime
     95258 =C2=B1  5%     -41.6%      55667 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.nr_spread_over
   7641609 =C2=B1  4%     -14.4%    6544905 =C2=B1  4%  sched_debug.cfs_rq[=
18]:/.max_vruntime
      4695 =C2=B1  4%     -12.7%       4099 =C2=B1  4%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
   7311424 =C2=B1  7%     -21.5%    5742180 =C2=B1  8%  sched_debug.cfs_rq[=
19]:/.max_vruntime
       696 =C2=B1  2%     -12.2%        611 =C2=B1  3%  sched_debug.cfs_rq[=
19]:/.utilization_load_avg
      4644 =C2=B1  4%     -12.4%       4068 =C2=B1  4%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
     91998 =C2=B1 13%     -40.0%      55242 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.nr_spread_over
   7311424 =C2=B1  7%     -21.5%    5742180 =C2=B1  8%  sched_debug.cfs_rq[=
19]:/.MIN_vruntime
   7282898 =C2=B1  3%     +10.5%    8047782 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.min_vruntime
     83311 =C2=B1  5%     -34.2%      54800 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.nr_spread_over
        23 =C2=B1  6%     -11.6%         21 =C2=B1  3%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
      5032 =C2=B1  3%     -15.1%       4274 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
      4640 =C2=B1  4%     -12.5%       4060 =C2=B1  4%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
   7308462 =C2=B1  3%     +11.5%    8150131 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.min_vruntime
     83813 =C2=B1  6%     -34.1%      55269 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.nr_spread_over
     83058 =C2=B1  6%     -33.6%      55136 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.nr_spread_over
   7365701 =C2=B1  4%      +9.0%    8027425 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.min_vruntime
   7365656 =C2=B1  4%     -13.9%    6343085 =C2=B1  8%  sched_debug.cfs_rq[=
21]:/.max_vruntime
   7365654 =C2=B1  4%     -13.9%    6343085 =C2=B1  8%  sched_debug.cfs_rq[=
21]:/.MIN_vruntime
      4630 =C2=B1  3%     -12.7%       4041 =C2=B1  4%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
      4647 =C2=B1  3%     -13.0%       4041 =C2=B1  5%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
   7534124 =C2=B1  3%     -13.2%    6543304 =C2=B1  9%  sched_debug.cfs_rq[=
22]:/.max_vruntime
   7534124 =C2=B1  3%     -13.2%    6543303 =C2=B1  9%  sched_debug.cfs_rq[=
22]:/.MIN_vruntime
     92976 =C2=B1  5%     -40.2%      55642 =C2=B1  1%  sched_debug.cfs_rq[=
22]:/.nr_spread_over
      4639 =C2=B1  3%     -13.8%       3998 =C2=B1  3%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
     90577 =C2=B1 11%     -39.1%      55154 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.nr_spread_over
     83003 =C2=B1  9%     -33.3%      55344 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.nr_spread_over
      4629 =C2=B1  3%     -14.1%       3979 =C2=B1  3%  sched_debug.cfs_rq[=
24]:/.tg_load_avg
   7302644 =C2=B1  4%     +11.4%    8137329 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.min_vruntime
     83712 =C2=B1  7%     -34.1%      55125 =C2=B1  1%  sched_debug.cfs_rq[=
25]:/.nr_spread_over
      4626 =C2=B1  3%     -14.5%       3958 =C2=B1  3%  sched_debug.cfs_rq[=
25]:/.tg_load_avg
   7363013 =C2=B1  4%      +9.1%    8033443 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.min_vruntime
   7536112 =C2=B1  4%     -11.8%    6645593 =C2=B1  6%  sched_debug.cfs_rq[=
26]:/.max_vruntime
   7536112 =C2=B1  4%     -11.8%    6645593 =C2=B1  6%  sched_debug.cfs_rq[=
26]:/.MIN_vruntime
     94753 =C2=B1  6%     -41.6%      55347 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.nr_spread_over
      4639 =C2=B1  3%     -14.6%       3964 =C2=B1  2%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
     91705 =C2=B1 12%     -39.4%      55591 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.nr_spread_over
      4632 =C2=B1  2%     -15.1%       3930 =C2=B1  3%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
     84678 =C2=B1  7%     -34.5%      55494 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.nr_spread_over
      4631 =C2=B1  2%     -15.2%       3926 =C2=B1  3%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
      4601 =C2=B1  2%     -14.6%       3931 =C2=B1  3%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
     82404 =C2=B1  5%     -32.8%      55386 =C2=B1  1%  sched_debug.cfs_rq[=
29]:/.nr_spread_over
   7209884 =C2=B1  2%     +11.6%    8047576 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.min_vruntime
        26 =C2=B1  8%     +56.1%         41 =C2=B1 22%  sched_debug.cfs_rq[=
29]:/.tg_load_contrib
     94450 =C2=B1  6%     -42.3%      54474 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
   7707001 =C2=B1  4%     -18.2%    6304774 =C2=B1 10%  sched_debug.cfs_rq[=
2]:/.MIN_vruntime
   7707001 =C2=B1  4%     -18.2%    6304774 =C2=B1 10%  sched_debug.cfs_rq[=
2]:/.max_vruntime
      5008 =C2=B1  3%     -14.9%       4262 =C2=B1  1%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
   7503290 =C2=B1  2%     -15.9%    6313647 =C2=B1 12%  sched_debug.cfs_rq[=
30]:/.MIN_vruntime
     91620 =C2=B1  4%     -39.7%      55274 =C2=B1  1%  sched_debug.cfs_rq[=
30]:/.nr_spread_over
      4579 =C2=B1  2%     -14.5%       3913 =C2=B1  3%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
   7503290 =C2=B1  2%     -15.9%    6313649 =C2=B1 12%  sched_debug.cfs_rq[=
30]:/.max_vruntime
     89609 =C2=B1  9%     -38.0%      55563 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.nr_spread_over
        61 =C2=B1 33%     -38.5%         37 =C2=B1 26%  sched_debug.cfs_rq[=
31]:/.tg_load_contrib
      4577 =C2=B1  1%     -14.4%       3919 =C2=B1  3%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
   7028429 =C2=B1  2%     -11.5%    6221955 =C2=B1  3%  sched_debug.cfs_rq[=
32]:/.MIN_vruntime
      4581 =C2=B1  1%     -14.2%       3931 =C2=B1  2%  sched_debug.cfs_rq[=
32]:/.tg_load_avg
   7028429 =C2=B1  2%     -11.5%    6221955 =C2=B1  3%  sched_debug.cfs_rq[=
32]:/.max_vruntime
   7378598 =C2=B1  2%     +13.9%    8400722 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.min_vruntime
     84906 =C2=B1  6%     -27.8%      61261 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.nr_spread_over
   7289507 =C2=B1  3%     +13.3%    8260155 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.min_vruntime
        24 =C2=B1  4%     -13.3%         21 =C2=B1  5%  sched_debug.cfs_rq[=
33]:/.load
      4569 =C2=B1  1%     -14.2%       3918 =C2=B1  2%  sched_debug.cfs_rq[=
33]:/.tg_load_avg
     83405 =C2=B1  6%     -26.5%      61297 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.nr_spread_over
   7525877 =C2=B1  5%     -11.2%    6681733 =C2=B1  8%  sched_debug.cfs_rq[=
34]:/.MIN_vruntime
   7525877 =C2=B1  5%     -11.2%    6681733 =C2=B1  8%  sched_debug.cfs_rq[=
34]:/.max_vruntime
     93599 =C2=B1  6%     -34.7%      61085 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.nr_spread_over
      4565 =C2=B1  1%     -13.7%       3939 =C2=B1  2%  sched_debug.cfs_rq[=
34]:/.tg_load_avg
      4537 =C2=B1  1%     -13.3%       3933 =C2=B1  2%  sched_debug.cfs_rq[=
35]:/.tg_load_avg
     90567 =C2=B1 12%     -32.5%      61154 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.nr_spread_over
   7399271 =C2=B1  2%     +12.8%    8345169 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.min_vruntime
     85865 =C2=B1  5%     -28.8%      61163 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.nr_spread_over
      4529 =C2=B1  1%     -13.3%       3928 =C2=B1  2%  sched_debug.cfs_rq[=
36]:/.tg_load_avg
       706 =C2=B1  3%     -10.8%        630 =C2=B1  4%  sched_debug.cfs_rq[=
36]:/.utilization_load_avg
      4514 =C2=B1  1%     -13.2%       3919 =C2=B1  2%  sched_debug.cfs_rq[=
37]:/.tg_load_avg
   7213746 =C2=B1  1%     +14.8%    8278341 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.min_vruntime
     82425 =C2=B1  4%     -26.0%      61023 =C2=B1  1%  sched_debug.cfs_rq[=
37]:/.nr_spread_over
       699 =C2=B1  6%     -13.7%        603 =C2=B1  6%  sched_debug.cfs_rq[=
38]:/.utilization_load_avg
   7653899 =C2=B1  5%     -16.9%    6358581 =C2=B1  5%  sched_debug.cfs_rq[=
38]:/.max_vruntime
     95600 =C2=B1  7%     -36.0%      61185 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.nr_spread_over
        97 =C2=B1 34%     -56.6%         42 =C2=B1 48%  sched_debug.cfs_rq[=
38]:/.tg_load_contrib
      4505 =C2=B1  2%     -13.1%       3913 =C2=B1  2%  sched_debug.cfs_rq[=
38]:/.tg_load_avg
   7653899 =C2=B1  5%     -16.9%    6358581 =C2=B1  5%  sched_debug.cfs_rq[=
38]:/.MIN_vruntime
      4488 =C2=B1  2%     -12.4%       3933 =C2=B1  2%  sched_debug.cfs_rq[=
39]:/.tg_load_avg
     88289 =C2=B1  9%     -31.2%      60735 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.nr_spread_over
   7425737 =C2=B1  5%     +11.2%    8257380 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.min_vruntime
      4959 =C2=B1  3%     -15.3%       4199 =C2=B1  2%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
     89165 =C2=B1 11%     -38.6%      54728 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.nr_spread_over
   7158567 =C2=B1  3%     -12.6%    6258318 =C2=B1  8%  sched_debug.cfs_rq[=
3]:/.max_vruntime
   7158567 =C2=B1  3%     -12.6%    6258317 =C2=B1  8%  sched_debug.cfs_rq[=
3]:/.MIN_vruntime
        24 =C2=B1  5%     -16.7%         20 =C2=B1  6%  sched_debug.cfs_rq[=
40]:/.runnable_load_avg
      4482 =C2=B1  2%     -12.2%       3933 =C2=B1  2%  sched_debug.cfs_rq[=
40]:/.tg_load_avg
   7338965 =C2=B1  3%     +14.3%    8388266 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.min_vruntime
     83195 =C2=B1  5%     -26.9%      60848 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.nr_spread_over
      4473 =C2=B1  2%     -12.2%       3925 =C2=B1  3%  sched_debug.cfs_rq[=
41]:/.tg_load_avg
     83392 =C2=B1  4%     -27.2%      60706 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.nr_spread_over
   7273185 =C2=B1  1%     +13.5%    8256027 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.min_vruntime
      4466 =C2=B1  2%     -12.6%       3905 =C2=B1  2%  sched_debug.cfs_rq[=
42]:/.tg_load_avg
     93098 =C2=B1  5%     -34.5%      60997 =C2=B1  1%  sched_debug.cfs_rq[=
42]:/.nr_spread_over
     89860 =C2=B1  9%     -31.9%      61188 =C2=B1  1%  sched_debug.cfs_rq[=
43]:/.nr_spread_over
      4419 =C2=B1  4%     -12.4%       3870 =C2=B1  2%  sched_debug.cfs_rq[=
43]:/.tg_load_avg
      4389 =C2=B1  4%     -11.7%       3876 =C2=B1  2%  sched_debug.cfs_rq[=
44]:/.tg_load_avg
       682 =C2=B1  2%     -10.8%        608 =C2=B1  6%  sched_debug.cfs_rq[=
44]:/.utilization_load_avg
   7353197 =C2=B1  4%     +13.9%    8371744 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.min_vruntime
        23 =C2=B1  5%     -11.8%         20 =C2=B1  4%  sched_debug.cfs_rq[=
44]:/.runnable_load_avg
     85414 =C2=B1  9%     -27.4%      62010 =C2=B1  1%  sched_debug.cfs_rq[=
44]:/.nr_spread_over
      4395 =C2=B1  4%     -11.8%       3877 =C2=B1  2%  sched_debug.cfs_rq[=
45]:/.tg_load_avg
       714 =C2=B1  4%     -10.2%        641 =C2=B1  5%  sched_debug.cfs_rq[=
45]:/.utilization_load_avg
   7243891 =C2=B1  2%     +14.2%    8274790 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.min_vruntime
     82328 =C2=B1  4%     -26.3%      60715 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.nr_spread_over
        68 =C2=B1 39%     -49.6%         34 =C2=B1 36%  sched_debug.cfs_rq[=
46]:/.tg_load_contrib
      4397 =C2=B1  4%     -11.3%       3901 =C2=B1  2%  sched_debug.cfs_rq[=
46]:/.tg_load_avg
     93485 =C2=B1  2%     -34.1%      61595 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.nr_spread_over
      4407 =C2=B1  4%     -11.5%       3902 =C2=B1  3%  sched_debug.cfs_rq[=
47]:/.tg_load_avg
     90702 =C2=B1 13%     -32.7%      61048 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.nr_spread_over
     83974 =C2=B1  6%     -27.0%      61326 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.nr_spread_over
        23 =C2=B1  4%     -10.5%         21 =C2=B1  2%  sched_debug.cfs_rq[=
48]:/.runnable_load_avg
   7323070 =C2=B1  3%     +14.2%    8362417 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.min_vruntime
      4406 =C2=B1  4%     -11.8%       3885 =C2=B1  2%  sched_debug.cfs_rq[=
48]:/.tg_load_avg
      4404 =C2=B1  4%     -12.6%       3848 =C2=B1  3%  sched_debug.cfs_rq[=
49]:/.tg_load_avg
     82931 =C2=B1  5%     -26.2%      61165 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.nr_spread_over
        24 =C2=B1  3%     -12.4%         21 =C2=B1  6%  sched_debug.cfs_rq[=
49]:/.load
   7227899 =C2=B1  2%     +14.6%    8282617 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.min_vruntime
      4961 =C2=B1  2%     -15.4%       4198 =C2=B1  2%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
   6967932 =C2=B1  4%      -5.3%    6598895 =C2=B1  3%  sched_debug.cfs_rq[=
4]:/.max_vruntime
   7355677 =C2=B1  2%     +10.9%    8154594 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.min_vruntime
     84907 =C2=B1  6%     -35.1%      55131 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.nr_spread_over
   6967932 =C2=B1  4%      -5.3%    6598895 =C2=B1  3%  sched_debug.cfs_rq[=
4]:/.MIN_vruntime
      4410 =C2=B1  4%     -12.4%       3861 =C2=B1  2%  sched_debug.cfs_rq[=
50]:/.tg_load_avg
   7712958 =C2=B1  2%     -16.5%    6440725 =C2=B1  7%  sched_debug.cfs_rq[=
50]:/.MIN_vruntime
     93028 =C2=B1  5%     -33.7%      61647 =C2=B1  1%  sched_debug.cfs_rq[=
50]:/.nr_spread_over
   7712958 =C2=B1  2%     -16.5%    6440725 =C2=B1  7%  sched_debug.cfs_rq[=
50]:/.max_vruntime
      4407 =C2=B1  4%     -12.1%       3873 =C2=B1  3%  sched_debug.cfs_rq[=
51]:/.tg_load_avg
     91392 =C2=B1 11%     -33.1%      61163 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.nr_spread_over
     85176 =C2=B1  6%     -28.2%      61190 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.nr_spread_over
      4405 =C2=B1  4%     -12.1%       3874 =C2=B1  3%  sched_debug.cfs_rq[=
52]:/.tg_load_avg
   7319041 =C2=B1  3%     +14.1%    8350517 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.min_vruntime
        23 =C2=B1  5%     -10.8%         20 =C2=B1  5%  sched_debug.cfs_rq[=
52]:/.runnable_load_avg
        39 =C2=B1 43%     -47.5%         20 =C2=B1  2%  sched_debug.cfs_rq[=
53]:/.load
   7429092 =C2=B1  4%     +11.5%    8281492 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.min_vruntime
     86095 =C2=B1  7%     -29.1%      61071 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.nr_spread_over
      4407 =C2=B1  4%     -12.4%       3859 =C2=B1  4%  sched_debug.cfs_rq[=
53]:/.tg_load_avg
      4391 =C2=B1  4%     -12.1%       3859 =C2=B1  4%  sched_debug.cfs_rq[=
54]:/.tg_load_avg
     93358 =C2=B1  5%     -34.2%      61399 =C2=B1  1%  sched_debug.cfs_rq[=
54]:/.nr_spread_over
     91991 =C2=B1 12%     -33.9%      60775 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.nr_spread_over
      4360 =C2=B1  4%     -11.5%       3860 =C2=B1  3%  sched_debug.cfs_rq[=
55]:/.tg_load_avg
     86145 =C2=B1 10%     -28.8%      61301 =C2=B1  0%  sched_debug.cfs_rq[=
56]:/.nr_spread_over
        22 =C2=B1  4%     -11.0%         20 =C2=B1  5%  sched_debug.cfs_rq[=
56]:/.load
   7390216 =C2=B1  5%     +13.2%    8363778 =C2=B1  0%  sched_debug.cfs_rq[=
56]:/.min_vruntime
      4356 =C2=B1  4%     -11.7%       3848 =C2=B1  3%  sched_debug.cfs_rq[=
56]:/.tg_load_avg
   7400120 =C2=B1  3%     +11.8%    8272990 =C2=B1  0%  sched_debug.cfs_rq[=
57]:/.min_vruntime
   7157487 =C2=B1  4%      -9.4%    6486328 =C2=B1  6%  sched_debug.cfs_rq[=
57]:/.max_vruntime
     85939 =C2=B1  7%     -29.2%      60833 =C2=B1  1%  sched_debug.cfs_rq[=
57]:/.nr_spread_over
      4344 =C2=B1  4%     -11.9%       3829 =C2=B1  4%  sched_debug.cfs_rq[=
57]:/.tg_load_avg
   7157487 =C2=B1  4%      -9.4%    6486328 =C2=B1  6%  sched_debug.cfs_rq[=
57]:/.MIN_vruntime
     92971 =C2=B1  5%     -34.2%      61159 =C2=B1  1%  sched_debug.cfs_rq[=
58]:/.nr_spread_over
      4347 =C2=B1  4%     -11.6%       3841 =C2=B1  4%  sched_debug.cfs_rq[=
58]:/.tg_load_avg
     91888 =C2=B1 11%     -33.4%      61199 =C2=B1  0%  sched_debug.cfs_rq[=
59]:/.nr_spread_over
      4349 =C2=B1  4%     -11.9%       3830 =C2=B1  4%  sched_debug.cfs_rq[=
59]:/.tg_load_avg
      4945 =C2=B1  2%     -15.0%       4202 =C2=B1  2%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
     81015 =C2=B1  6%     -32.4%      54802 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.nr_spread_over
   7160936 =C2=B1  2%     +12.2%    8032784 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.min_vruntime
        23 =C2=B1  4%      -9.6%         21 =C2=B1  2%  sched_debug.cfs_rq[=
5]:/.runnable_load_avg
     84237 =C2=B1  7%     -27.1%      61427 =C2=B1  0%  sched_debug.cfs_rq[=
60]:/.nr_spread_over
   7404194 =C2=B1  3%     +12.7%    8344740 =C2=B1  0%  sched_debug.cfs_rq[=
60]:/.min_vruntime
      4358 =C2=B1  4%     -12.4%       3819 =C2=B1  4%  sched_debug.cfs_rq[=
60]:/.tg_load_avg
        23 =C2=B1  3%     -14.9%         20 =C2=B1  7%  sched_debug.cfs_rq[=
61]:/.runnable_load_avg
     83637 =C2=B1  5%     -26.6%      61365 =C2=B1  1%  sched_debug.cfs_rq[=
61]:/.nr_spread_over
      4351 =C2=B1  4%     -12.2%       3819 =C2=B1  4%  sched_debug.cfs_rq[=
61]:/.tg_load_avg
       704 =C2=B1  5%     -15.2%        597 =C2=B1  8%  sched_debug.cfs_rq[=
61]:/.utilization_load_avg
   7237426 =C2=B1  1%     +14.5%    8286978 =C2=B1  0%  sched_debug.cfs_rq[=
61]:/.min_vruntime
        23 =C2=B1  4%     -10.5%         21 =C2=B1  5%  sched_debug.cfs_rq[=
61]:/.load
      4336 =C2=B1  4%     -11.8%       3822 =C2=B1  4%  sched_debug.cfs_rq[=
62]:/.tg_load_avg
     92705 =C2=B1  6%     -33.8%      61415 =C2=B1  0%  sched_debug.cfs_rq[=
62]:/.nr_spread_over
       692 =C2=B1  6%     -13.0%        602 =C2=B1  9%  sched_debug.cfs_rq[=
62]:/.utilization_load_avg
   7098274 =C2=B1  2%     -10.6%    6346327 =C2=B1  1%  sched_debug.cfs_rq[=
63]:/.MIN_vruntime
     92189 =C2=B1  9%     -33.4%      61437 =C2=B1  0%  sched_debug.cfs_rq[=
63]:/.nr_spread_over
      4301 =C2=B1  4%     -11.6%       3801 =C2=B1  4%  sched_debug.cfs_rq[=
63]:/.tg_load_avg
   7098274 =C2=B1  2%     -10.6%    6346327 =C2=B1  1%  sched_debug.cfs_rq[=
63]:/.max_vruntime
        29 =C2=B1 18%     +65.3%         48 =C2=B1 11%  sched_debug.cfs_rq[=
64]:/.tg_load_contrib
   7346936 =C2=B1  2%     +10.9%    8144531 =C2=B1  0%  sched_debug.cfs_rq[=
64]:/.min_vruntime
      4290 =C2=B1  4%     -11.3%       3804 =C2=B1  4%  sched_debug.cfs_rq[=
64]:/.tg_load_avg
     83841 =C2=B1  5%     -33.9%      55380 =C2=B1  0%  sched_debug.cfs_rq[=
64]:/.nr_spread_over
      4260 =C2=B1  3%     -11.0%       3792 =C2=B1  5%  sched_debug.cfs_rq[=
65]:/.tg_load_avg
   7201056 =C2=B1  2%     +11.7%    8046037 =C2=B1  0%  sched_debug.cfs_rq[=
65]:/.min_vruntime
     83194 =C2=B1  6%     -33.2%      55611 =C2=B1  0%  sched_debug.cfs_rq[=
65]:/.nr_spread_over
        23 =C2=B1  1%     +68.4%         40 =C2=B1 37%  sched_debug.cfs_rq[=
65]:/.load
      4227 =C2=B1  3%     -10.7%       3774 =C2=B1  4%  sched_debug.cfs_rq[=
66]:/.tg_load_avg
     92270 =C2=B1  4%     -39.7%      55598 =C2=B1  0%  sched_debug.cfs_rq[=
66]:/.nr_spread_over
   7420210 =C2=B1  6%      -9.9%    6682064 =C2=B1  4%  sched_debug.cfs_rq[=
67]:/.MIN_vruntime
   7420210 =C2=B1  6%      -9.9%    6682064 =C2=B1  4%  sched_debug.cfs_rq[=
67]:/.max_vruntime
      4234 =C2=B1  3%     -10.8%       3777 =C2=B1  4%  sched_debug.cfs_rq[=
67]:/.tg_load_avg
     91650 =C2=B1 11%     -39.1%      55792 =C2=B1  1%  sched_debug.cfs_rq[=
67]:/.nr_spread_over
   7366726 =C2=B1  2%     +10.1%    8107308 =C2=B1  0%  sched_debug.cfs_rq[=
68]:/.min_vruntime
   7226174 =C2=B1  3%     -12.8%    6302520 =C2=B1  1%  sched_debug.cfs_rq[=
68]:/.max_vruntime
   7226174 =C2=B1  3%     -12.8%    6302520 =C2=B1  1%  sched_debug.cfs_rq[=
68]:/.MIN_vruntime
      4240 =C2=B1  3%     -10.6%       3789 =C2=B1  3%  sched_debug.cfs_rq[=
68]:/.tg_load_avg
     84071 =C2=B1  6%     -34.9%      54753 =C2=B1  0%  sched_debug.cfs_rq[=
68]:/.nr_spread_over
     81786 =C2=B1  6%     -32.6%      55098 =C2=B1  0%  sched_debug.cfs_rq[=
69]:/.nr_spread_over
   7234680 =C2=B1  2%     +10.6%    7999421 =C2=B1  0%  sched_debug.cfs_rq[=
69]:/.min_vruntime
   7103576 =C2=B1  4%     -11.6%    6277709 =C2=B1 10%  sched_debug.cfs_rq[=
69]:/.MIN_vruntime
   7103576 =C2=B1  4%     -11.6%    6277709 =C2=B1 10%  sched_debug.cfs_rq[=
69]:/.max_vruntime
      4232 =C2=B1  3%     -10.8%       3774 =C2=B1  4%  sched_debug.cfs_rq[=
69]:/.tg_load_avg
      4939 =C2=B1  2%     -14.9%       4204 =C2=B1  2%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     95001 =C2=B1  8%     -42.0%      55133 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.nr_spread_over
   7356574 =C2=B1  5%     -13.6%    6359106 =C2=B1 11%  sched_debug.cfs_rq[=
6]:/.max_vruntime
   7356574 =C2=B1  5%     -13.6%    6359106 =C2=B1 11%  sched_debug.cfs_rq[=
6]:/.MIN_vruntime
      4217 =C2=B1  4%     -10.3%       3783 =C2=B1  4%  sched_debug.cfs_rq[=
70]:/.tg_load_avg
     94616 =C2=B1  4%     -41.3%      55534 =C2=B1  1%  sched_debug.cfs_rq[=
70]:/.nr_spread_over
      4226 =C2=B1  4%     -11.9%       3722 =C2=B1  4%  sched_debug.cfs_rq[=
71]:/.tg_load_avg
     90679 =C2=B1 12%     -38.6%      55654 =C2=B1  0%  sched_debug.cfs_rq[=
71]:/.nr_spread_over
       674 =C2=B1  4%      -7.1%        626 =C2=B1  4%  sched_debug.cfs_rq[=
71]:/.utilization_load_avg
     85240 =C2=B1  7%     -27.9%      61496 =C2=B1  0%  sched_debug.cfs_rq[=
72]:/.nr_spread_over
      4230 =C2=B1  4%     -12.1%       3717 =C2=B1  4%  sched_debug.cfs_rq[=
72]:/.tg_load_avg
   7395583 =C2=B1  2%     +12.8%    8345628 =C2=B1  0%  sched_debug.cfs_rq[=
72]:/.min_vruntime
        25 =C2=B1 10%    +103.0%         50 =C2=B1 24%  sched_debug.cfs_rq[=
73]:/.tg_load_contrib
     83211 =C2=B1  5%     -26.4%      61243 =C2=B1  0%  sched_debug.cfs_rq[=
73]:/.nr_spread_over
      4227 =C2=B1  4%     -12.3%       3706 =C2=B1  3%  sched_debug.cfs_rq[=
73]:/.tg_load_avg
       677 =C2=B1  1%     -12.8%        591 =C2=B1  8%  sched_debug.cfs_rq[=
73]:/.utilization_load_avg
   7209152 =C2=B1  2%     +14.8%    8276119 =C2=B1  0%  sched_debug.cfs_rq[=
73]:/.min_vruntime
      4222 =C2=B1  5%     -12.5%       3696 =C2=B1  4%  sched_debug.cfs_rq[=
74]:/.tg_load_avg
       682 =C2=B1  1%     -15.1%        579 =C2=B1  6%  sched_debug.cfs_rq[=
74]:/.utilization_load_avg
     92456 =C2=B1  4%     -34.0%      61065 =C2=B1  0%  sched_debug.cfs_rq[=
74]:/.nr_spread_over
      4234 =C2=B1  5%     -12.4%       3707 =C2=B1  3%  sched_debug.cfs_rq[=
75]:/.tg_load_avg
     92554 =C2=B1 11%     -33.1%      61874 =C2=B1  1%  sched_debug.cfs_rq[=
75]:/.nr_spread_over
   7396900 =C2=B1  5%     -16.4%    6185764 =C2=B1  8%  sched_debug.cfs_rq[=
75]:/.MIN_vruntime
   7396900 =C2=B1  5%     -16.4%    6185764 =C2=B1  8%  sched_debug.cfs_rq[=
75]:/.max_vruntime
     85186 =C2=B1  5%     -28.3%      61048 =C2=B1  0%  sched_debug.cfs_rq[=
76]:/.nr_spread_over
      4220 =C2=B1  4%     -12.1%       3709 =C2=B1  4%  sched_debug.cfs_rq[=
76]:/.tg_load_avg
   7370291 =C2=B1  2%     +13.6%    8372505 =C2=B1  0%  sched_debug.cfs_rq[=
76]:/.min_vruntime
        26 =C2=B1 12%    +103.8%         54 =C2=B1 27%  sched_debug.cfs_rq[=
77]:/.tg_load_contrib
      4171 =C2=B1  4%     -11.2%       3702 =C2=B1  4%  sched_debug.cfs_rq[=
77]:/.tg_load_avg
     83239 =C2=B1  5%     -26.5%      61151 =C2=B1  0%  sched_debug.cfs_rq[=
77]:/.nr_spread_over
   7242561 =C2=B1  2%     +14.7%    8308004 =C2=B1  0%  sched_debug.cfs_rq[=
77]:/.min_vruntime
       677 =C2=B1  2%     -10.1%        609 =C2=B1  4%  sched_debug.cfs_rq[=
78]:/.utilization_load_avg
      4166 =C2=B1  5%     -11.4%       3693 =C2=B1  4%  sched_debug.cfs_rq[=
78]:/.tg_load_avg
     96851 =C2=B1  5%     -36.7%      61294 =C2=B1  1%  sched_debug.cfs_rq[=
78]:/.nr_spread_over
     90948 =C2=B1 13%     -32.3%      61590 =C2=B1  0%  sched_debug.cfs_rq[=
79]:/.nr_spread_over
      4170 =C2=B1  5%     -11.3%       3697 =C2=B1  4%  sched_debug.cfs_rq[=
79]:/.tg_load_avg
      4901 =C2=B1  2%     -14.6%       4186 =C2=B1  3%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
     88989 =C2=B1 10%     -38.1%      55056 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.nr_spread_over
   7427052 =C2=B1  6%     -20.2%    5926513 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.max_vruntime
   7427052 =C2=B1  6%     -20.2%    5926512 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.MIN_vruntime
        23 =C2=B1  3%     -12.6%         20 =C2=B1  2%  sched_debug.cfs_rq[=
8]:/.runnable_load_avg
     82188 =C2=B1  6%     -33.1%      54968 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.nr_spread_over
      4850 =C2=B1  2%     -13.7%       4187 =C2=B1  3%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
   7298532 =C2=B1  3%     +11.0%    8102793 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.min_vruntime
      4832 =C2=B1  3%     -12.8%       4211 =C2=B1  3%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
     83655 =C2=B1  6%     -34.2%      55018 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.nr_spread_over
        24 =C2=B1  5%     -11.5%         21 =C2=B1  2%  sched_debug.cfs_rq[=
9]:/.runnable_load_avg
   7269604 =C2=B1  2%     +10.8%    8056269 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.min_vruntime
    185083 =C2=B1  1%     +11.3%     205995 =C2=B1  3%  sched_debug.cpu#0.n=
r_switches
    169384 =C2=B1  1%     -42.4%      97583 =C2=B1  1%  sched_debug.cpu#0.t=
twu_local
    196877 =C2=B1  1%     +14.4%     225162 =C2=B1  3%  sched_debug.cpu#0.s=
ched_count
    166557 =C2=B1  1%     -41.6%      97280 =C2=B1  0%  sched_debug.cpu#1.t=
twu_local
    179141 =C2=B1  1%     +21.8%     218106 =C2=B1  1%  sched_debug.cpu#1.n=
r_switches
        23 =C2=B1  4%     -10.6%         21 =C2=B1  0%  sched_debug.cpu#1.c=
pu_load[0]
      2672 =C2=B1 19%   +1290.6%      37156 =C2=B1  4%  sched_debug.cpu#1.s=
ched_goidle
    179936 =C2=B1  1%     +22.8%     220913 =C2=B1  2%  sched_debug.cpu#10.=
nr_switches
    186925 =C2=B1  7%     +33.3%     249198 =C2=B1 17%  sched_debug.cpu#10.=
sched_count
    166873 =C2=B1  0%     -42.5%      95892 =C2=B1  1%  sched_debug.cpu#10.=
ttwu_local
      2491 =C2=B1 38%   +1407.8%      37567 =C2=B1  8%  sched_debug.cpu#11.=
sched_goidle
    166688 =C2=B1  0%     -41.8%      97011 =C2=B1  1%  sched_debug.cpu#11.=
ttwu_local
    178969 =C2=B1  0%     +22.5%     219220 =C2=B1  2%  sched_debug.cpu#11.=
nr_switches
    179123 =C2=B1  0%     +29.7%     232345 =C2=B1  3%  sched_debug.cpu#11.=
sched_count
     61457 =C2=B1 15%     +97.6%     121453 =C2=B1 26%  sched_debug.cpu#11.=
avg_idle
    181168 =C2=B1  2%     +15.4%     209077 =C2=B1  2%  sched_debug.cpu#12.=
nr_switches
    181989 =C2=B1  2%     +21.1%     220306 =C2=B1  3%  sched_debug.cpu#12.=
sched_count
    165680 =C2=B1  2%     -42.0%      96158 =C2=B1  1%  sched_debug.cpu#12.=
ttwu_local
      2666 =C2=B1 45%   +1141.3%      33093 =C2=B1  8%  sched_debug.cpu#12.=
sched_goidle
    181460 =C2=B1  1%     +20.5%     218583 =C2=B1  3%  sched_debug.cpu#13.=
nr_switches
    168391 =C2=B1  1%     -42.6%      96672 =C2=B1  0%  sched_debug.cpu#13.=
ttwu_local
      1671 =C2=B1 31%   +2131.4%      37298 =C2=B1 10%  sched_debug.cpu#13.=
sched_goidle
    186632 =C2=B1  3%     +21.4%     226566 =C2=B1  5%  sched_debug.cpu#13.=
sched_count
    181060 =C2=B1  0%     +14.9%     208036 =C2=B1  4%  sched_debug.cpu#14.=
nr_switches
        23 =C2=B1  4%     -10.6%         21 =C2=B1  3%  sched_debug.cpu#14.=
load
    167174 =C2=B1  0%     -42.3%      96478 =C2=B1  0%  sched_debug.cpu#14.=
ttwu_local
    181404 =C2=B1  0%     +16.5%     211279 =C2=B1  5%  sched_debug.cpu#14.=
sched_count
    166235 =C2=B1  2%     -41.7%      96863 =C2=B1  0%  sched_debug.cpu#15.=
ttwu_local
    176691 =C2=B1  1%     +19.8%     211617 =C2=B1  4%  sched_debug.cpu#15.=
nr_switches
       735 =C2=B1 45%   +4458.7%      33517 =C2=B1 14%  sched_debug.cpu#15.=
sched_goidle
    176770 =C2=B1  1%     +24.7%     220449 =C2=B1  4%  sched_debug.cpu#15.=
sched_count
    178095 =C2=B1  2%     +19.8%     213416 =C2=B1  4%  sched_debug.cpu#16.=
nr_switches
    166184 =C2=B1  1%     -42.2%      96084 =C2=B1  0%  sched_debug.cpu#16.=
ttwu_local
    178454 =C2=B1  2%     +26.8%     226348 =C2=B1  3%  sched_debug.cpu#16.=
sched_count
    178111 =C2=B1  1%     +18.6%     211152 =C2=B1  5%  sched_debug.cpu#17.=
nr_switches
    167142 =C2=B1  1%     -41.9%      97093 =C2=B1  1%  sched_debug.cpu#17.=
ttwu_local
      1616 =C2=B1 44%   +1993.0%      33838 =C2=B1 17%  sched_debug.cpu#17.=
sched_goidle
    183896 =C2=B1  5%     +21.1%     222617 =C2=B1  8%  sched_debug.cpu#17.=
sched_count
    180325 =C2=B1  8%     +19.4%     215276 =C2=B1  4%  sched_debug.cpu#18.=
sched_count
    164506 =C2=B1  0%     -41.4%      96349 =C2=B1  1%  sched_debug.cpu#18.=
ttwu_local
    172993 =C2=B1  1%     +21.2%     209609 =C2=B1  4%  sched_debug.cpu#18.=
nr_switches
    178844 =C2=B1  1%     +20.1%     214758 =C2=B1  4%  sched_debug.cpu#19.=
sched_count
    178748 =C2=B1  1%     +16.4%     208109 =C2=B1  3%  sched_debug.cpu#19.=
nr_switches
      2036 =C2=B1  5%      +6.7%       2173 =C2=B1  5%  sched_debug.cpu#19.=
curr->pid
    167284 =C2=B1  1%     -42.1%      96804 =C2=B1  0%  sched_debug.cpu#19.=
ttwu_local
    174854 =C2=B1  2%     +25.7%     219810 =C2=B1  3%  sched_debug.cpu#2.s=
ched_count
    165697 =C2=B1  0%     -42.6%      95074 =C2=B1  0%  sched_debug.cpu#2.t=
twu_local
    174539 =C2=B1  2%     +20.9%     211099 =C2=B1  2%  sched_debug.cpu#2.n=
r_switches
      1433 =C2=B1 46%   +2508.6%      37381 =C2=B1 11%  sched_debug.cpu#20.=
sched_goidle
    166338 =C2=B1  1%     -42.5%      95638 =C2=B1  1%  sched_debug.cpu#20.=
ttwu_local
    177699 =C2=B1  2%     +22.7%     218065 =C2=B1  3%  sched_debug.cpu#20.=
nr_switches
    180865 =C2=B1  3%     +18.0%     213449 =C2=B1  4%  sched_debug.cpu#21.=
nr_switches
    182014 =C2=B1  4%     +22.1%     222268 =C2=B1  5%  sched_debug.cpu#21.=
sched_count
      1944 =C2=B1 36%   +1692.9%      34862 =C2=B1 13%  sched_debug.cpu#21.=
sched_goidle
    167217 =C2=B1  1%     -42.3%      96428 =C2=B1  0%  sched_debug.cpu#21.=
ttwu_local
    177003 =C2=B1  2%     +16.1%     205541 =C2=B1  6%  sched_debug.cpu#22.=
nr_switches
    178314 =C2=B1  3%     +19.8%     213661 =C2=B1  5%  sched_debug.cpu#22.=
sched_count
    165721 =C2=B1  0%     -41.9%      96318 =C2=B1  1%  sched_debug.cpu#22.=
ttwu_local
    166518 =C2=B1  2%     -41.9%      96788 =C2=B1  1%  sched_debug.cpu#23.=
ttwu_local
      2127 =C2=B1 43%   +1667.6%      37597 =C2=B1  5%  sched_debug.cpu#23.=
sched_goidle
    182879 =C2=B1  2%     +26.4%     231172 =C2=B1  3%  sched_debug.cpu#23.=
sched_count
    179015 =C2=B1  1%     +22.7%     219685 =C2=B1  1%  sched_debug.cpu#23.=
nr_switches
      1997 =C2=B1 24%   +1682.8%      35616 =C2=B1 16%  sched_debug.cpu#24.=
sched_goidle
    167885 =C2=B1  2%     -43.0%      95704 =C2=B1  1%  sched_debug.cpu#24.=
ttwu_local
    183676 =C2=B1  4%     +16.5%     213944 =C2=B1  4%  sched_debug.cpu#24.=
nr_switches
    181262 =C2=B1  1%     +23.4%     223661 =C2=B1  4%  sched_debug.cpu#25.=
sched_count
    164904 =C2=B1  1%     -41.7%      96153 =C2=B1  1%  sched_debug.cpu#25.=
ttwu_local
    179993 =C2=B1  1%     +19.7%     215476 =C2=B1  3%  sched_debug.cpu#25.=
nr_switches
    166512 =C2=B1  0%     -42.6%      95634 =C2=B1  0%  sched_debug.cpu#26.=
ttwu_local
    175420 =C2=B1  2%     +24.1%     217673 =C2=B1  3%  sched_debug.cpu#26.=
nr_switches
      2225 =C2=B1 11%     -11.2%       1974 =C2=B1  1%  sched_debug.cpu#26.=
curr->pid
    166929 =C2=B1  1%     -41.7%      97337 =C2=B1  0%  sched_debug.cpu#27.=
ttwu_local
    177840 =C2=B1  1%     +22.9%     218538 =C2=B1  3%  sched_debug.cpu#27.=
nr_switches
    177936 =C2=B1  1%     +27.7%     227235 =C2=B1  4%  sched_debug.cpu#27.=
sched_count
    178781 =C2=B1  3%     +20.4%     215270 =C2=B1  5%  sched_debug.cpu#28.=
nr_switches
    180744 =C2=B1  3%     +24.9%     225704 =C2=B1  4%  sched_debug.cpu#28.=
sched_count
    166837 =C2=B1  2%     -42.6%      95709 =C2=B1  0%  sched_debug.cpu#28.=
ttwu_local
    176529 =C2=B1  1%     +19.3%     210630 =C2=B1  2%  sched_debug.cpu#29.=
nr_switches
      1058 =C2=B1 40%   +3067.8%      33523 =C2=B1  9%  sched_debug.cpu#29.=
sched_goidle
    166318 =C2=B1  1%     -42.0%      96529 =C2=B1  1%  sched_debug.cpu#29.=
ttwu_local
    177473 =C2=B1  1%     +21.9%     216361 =C2=B1  2%  sched_debug.cpu#29.=
sched_count
    179612 =C2=B1  0%     +28.3%     230422 =C2=B1  2%  sched_debug.cpu#3.s=
ched_count
    167241 =C2=B1  1%     -42.4%      96344 =C2=B1  0%  sched_debug.cpu#3.t=
twu_local
      1570 =C2=B1 47%   +2288.2%      37495 =C2=B1  1%  sched_debug.cpu#3.s=
ched_goidle
    179492 =C2=B1  0%     +21.7%     218405 =C2=B1  0%  sched_debug.cpu#3.n=
r_switches
    177308 =C2=B1  3%     +21.1%     214783 =C2=B1  4%  sched_debug.cpu#30.=
nr_switches
    177810 =C2=B1  3%     +26.6%     225140 =C2=B1  1%  sched_debug.cpu#30.=
sched_count
    166423 =C2=B1  1%     -42.6%      95563 =C2=B1  1%  sched_debug.cpu#30.=
ttwu_local
     65275 =C2=B1 11%     +98.0%     129228 =C2=B1 24%  sched_debug.cpu#30.=
avg_idle
    166932 =C2=B1  1%     -41.9%      96992 =C2=B1  0%  sched_debug.cpu#31.=
ttwu_local
    178121 =C2=B1  2%     +17.8%     209779 =C2=B1  4%  sched_debug.cpu#31.=
nr_switches
    178245 =C2=B1  2%     +21.4%     216460 =C2=B1  2%  sched_debug.cpu#31.=
sched_count
    591295 =C2=B1 28%     -73.9%     154353 =C2=B1 31%  sched_debug.cpu#32.=
avg_idle
    174467 =C2=B1  0%     +44.7%     252427 =C2=B1  4%  sched_debug.cpu#32.=
sched_count
       324 =C2=B1 10%  +14385.7%      47006 =C2=B1  7%  sched_debug.cpu#32.=
sched_goidle
    166801 =C2=B1  1%     -37.1%     104984 =C2=B1  0%  sched_debug.cpu#32.=
ttwu_local
    174398 =C2=B1  0%     +39.6%     243415 =C2=B1  2%  sched_debug.cpu#32.=
nr_switches
        33 =C2=B1 46%     -35.3%         21 =C2=B1  4%  sched_debug.cpu#33.=
load
      1850 =C2=B1 36%   +1852.7%      36140 =C2=B1 13%  sched_debug.cpu#33.=
sched_goidle
     68542 =C2=B1 16%    +169.9%     184976 =C2=B1 10%  sched_debug.cpu#33.=
avg_idle
    176692 =C2=B1  1%     +28.4%     226924 =C2=B1  3%  sched_debug.cpu#33.=
sched_count
    176529 =C2=B1  1%     +25.8%     222003 =C2=B1  4%  sched_debug.cpu#33.=
nr_switches
    165517 =C2=B1  1%     -35.8%     106277 =C2=B1  0%  sched_debug.cpu#33.=
ttwu_local
    172862 =C2=B1  1%     +33.9%     231513 =C2=B1  1%  sched_debug.cpu#34.=
nr_switches
    166495 =C2=B1  0%     -36.9%     105062 =C2=B1  0%  sched_debug.cpu#34.=
ttwu_local
    172912 =C2=B1  1%     +38.8%     239989 =C2=B1  3%  sched_debug.cpu#34.=
sched_count
    176341 =C2=B1  0%     +24.4%     219453 =C2=B1  5%  sched_debug.cpu#35.=
nr_switches
    176434 =C2=B1  0%     +29.3%     228093 =C2=B1  4%  sched_debug.cpu#35.=
sched_count
    167194 =C2=B1  1%     -36.3%     106442 =C2=B1  0%  sched_debug.cpu#35.=
ttwu_local
    167299 =C2=B1  1%     -37.2%     105099 =C2=B1  0%  sched_debug.cpu#36.=
ttwu_local
    173642 =C2=B1  0%     +25.9%     218593 =C2=B1  4%  sched_debug.cpu#36.=
nr_switches
        23 =C2=B1  6%     -11.6%         21 =C2=B1  3%  sched_debug.cpu#36.=
cpu_load[0]
        23 =C2=B1  6%     -10.5%         21 =C2=B1  2%  sched_debug.cpu#36.=
cpu_load[1]
    183869 =C2=B1  9%     +22.5%     225259 =C2=B1  5%  sched_debug.cpu#36.=
sched_count
        24 =C2=B1  5%     -11.5%         21 =C2=B1  2%  sched_debug.cpu#37.=
cpu_load[4]
    166301 =C2=B1  1%     -36.4%     105746 =C2=B1  0%  sched_debug.cpu#37.=
ttwu_local
    174524 =C2=B1  1%     +32.6%     231490 =C2=B1  4%  sched_debug.cpu#37.=
nr_switches
       160 =C2=B1 12%  +25529.9%      41200 =C2=B1 12%  sched_debug.cpu#37.=
sched_goidle
    830312 =C2=B1 17%     -82.9%     142236 =C2=B1 24%  sched_debug.cpu#37.=
avg_idle
        24 =C2=B1  5%     -11.5%         21 =C2=B1  2%  sched_debug.cpu#37.=
cpu_load[2]
        24 =C2=B1  5%     -11.5%         21 =C2=B1  2%  sched_debug.cpu#37.=
cpu_load[3]
    174606 =C2=B1  1%     +34.9%     235497 =C2=B1  4%  sched_debug.cpu#37.=
sched_count
    166593 =C2=B1  0%     -36.8%     105336 =C2=B1  0%  sched_debug.cpu#38.=
ttwu_local
    176922 =C2=B1  1%     +31.5%     232720 =C2=B1  3%  sched_debug.cpu#38.=
nr_switches
    179103 =C2=B1  1%     +33.9%     239788 =C2=B1  3%  sched_debug.cpu#38.=
sched_count
    175222 =C2=B1  1%     +32.8%     232640 =C2=B1  3%  sched_debug.cpu#39.=
nr_switches
    167175 =C2=B1  1%     -36.6%     105952 =C2=B1  0%  sched_debug.cpu#39.=
ttwu_local
    175296 =C2=B1  1%     +37.6%     241227 =C2=B1  2%  sched_debug.cpu#39.=
sched_count
    180204 =C2=B1  2%     +22.6%     220867 =C2=B1  1%  sched_debug.cpu#4.n=
r_switches
        23 =C2=B1  3%      -7.5%         21 =C2=B1  4%  sched_debug.cpu#4.c=
pu_load[1]
    167963 =C2=B1  2%     -43.1%      95636 =C2=B1  0%  sched_debug.cpu#4.t=
twu_local
    182969 =C2=B1  6%     +36.0%     248877 =C2=B1  1%  sched_debug.cpu#40.=
sched_count
    180197 =C2=B1  4%     +32.2%     238240 =C2=B1  2%  sched_debug.cpu#40.=
nr_switches
    167123 =C2=B1  2%     -37.7%     104187 =C2=B1  0%  sched_debug.cpu#40.=
ttwu_local
        23 =C2=B1  6%     -13.7%         20 =C2=B1  8%  sched_debug.cpu#40.=
load
        23 =C2=B1  6%     -11.6%         21 =C2=B1  5%  sched_debug.cpu#40.=
cpu_load[0]
        24 =C2=B1  4%     -12.4%         21 =C2=B1  2%  sched_debug.cpu#40.=
cpu_load[4]
    180011 =C2=B1  1%     +24.5%     224026 =C2=B1  6%  sched_debug.cpu#41.=
nr_switches
        41 =C2=B1 41%     -47.6%         21 =C2=B1  6%  sched_debug.cpu#41.=
load
    180162 =C2=B1  1%     +27.9%     230377 =C2=B1  6%  sched_debug.cpu#41.=
sched_count
    167663 =C2=B1  2%     -36.8%     105978 =C2=B1  0%  sched_debug.cpu#41.=
ttwu_local
    167554 =C2=B1  0%     -37.2%     105272 =C2=B1  0%  sched_debug.cpu#42.=
ttwu_local
    183068 =C2=B1  8%     +27.5%     233336 =C2=B1  7%  sched_debug.cpu#42.=
sched_count
    173902 =C2=B1  1%     +30.7%     227207 =C2=B1  8%  sched_debug.cpu#42.=
nr_switches
    176293 =C2=B1  1%     +23.5%     217789 =C2=B1  8%  sched_debug.cpu#43.=
nr_switches
    167136 =C2=B1  0%     -36.3%     106524 =C2=B1  1%  sched_debug.cpu#43.=
ttwu_local
    176405 =C2=B1  1%     +28.5%     226645 =C2=B1  5%  sched_debug.cpu#43.=
sched_count
        23 =C2=B1  4%     -11.7%         20 =C2=B1  3%  sched_debug.cpu#44.=
cpu_load[0]
    165829 =C2=B1  1%     -36.2%     105834 =C2=B1  1%  sched_debug.cpu#44.=
ttwu_local
    175453 =C2=B1  1%     +21.2%     212599 =C2=B1 10%  sched_debug.cpu#44.=
nr_switches
    176054 =C2=B1  1%     +25.1%     220252 =C2=B1  9%  sched_debug.cpu#44.=
sched_count
        23 =C2=B1  5%      -8.6%         21 =C2=B1  2%  sched_debug.cpu#44.=
cpu_load[1]
       420 =C2=B1 49%   +7500.7%      31960 =C2=B1 35%  sched_debug.cpu#44.=
sched_goidle
    760359 =C2=B1 24%     -77.3%     172652 =C2=B1 26%  sched_debug.cpu#45.=
avg_idle
    167005 =C2=B1  1%     -36.8%     105619 =C2=B1  0%  sched_debug.cpu#45.=
ttwu_local
    176436 =C2=B1  2%     +31.4%     231823 =C2=B1  3%  sched_debug.cpu#45.=
nr_switches
       231 =C2=B1 23%  +17464.6%      40618 =C2=B1 11%  sched_debug.cpu#45.=
sched_goidle
    177403 =C2=B1  3%     +34.3%     238262 =C2=B1  2%  sched_debug.cpu#45.=
sched_count
        23 =C2=B1  2%      -9.6%         21 =C2=B1  2%  sched_debug.cpu#45.=
cpu_load[3]
    167678 =C2=B1  0%     -36.9%     105872 =C2=B1  0%  sched_debug.cpu#46.=
ttwu_local
    175671 =C2=B1  1%     +27.0%     223164 =C2=B1  5%  sched_debug.cpu#46.=
nr_switches
    175773 =C2=B1  1%     +29.9%     228350 =C2=B1  5%  sched_debug.cpu#46.=
sched_count
    178671 =C2=B1  1%     +36.6%     244089 =C2=B1  7%  sched_debug.cpu#47.=
sched_count
     60296 =C2=B1 15%    +128.0%     137502 =C2=B1 34%  sched_debug.cpu#47.=
avg_idle
    166763 =C2=B1  2%     -36.4%     106094 =C2=B1  0%  sched_debug.cpu#47.=
ttwu_local
    178497 =C2=B1  1%     +30.3%     232640 =C2=B1  5%  sched_debug.cpu#47.=
nr_switches
      2000 =C2=B1  5%      +6.3%       2126 =C2=B1  3%  sched_debug.cpu#47.=
curr->pid
    176663 =C2=B1  0%     +29.2%     228325 =C2=B1  8%  sched_debug.cpu#48.=
sched_count
        23 =C2=B1  4%     -10.5%         21 =C2=B1  2%  sched_debug.cpu#48.=
cpu_load[3]
    176560 =C2=B1  0%     +26.7%     223628 =C2=B1  8%  sched_debug.cpu#48.=
nr_switches
    166724 =C2=B1  1%     -36.6%     105767 =C2=B1  0%  sched_debug.cpu#48.=
ttwu_local
        23 =C2=B1  4%     -11.6%         21 =C2=B1  3%  sched_debug.cpu#48.=
cpu_load[2]
        24 =C2=B1  5%     -11.5%         21 =C2=B1  2%  sched_debug.cpu#48.=
cpu_load[1]
        23 =C2=B1  4%     -11.6%         21 =C2=B1  3%  sched_debug.cpu#48.=
cpu_load[0]
    186519 =C2=B1  8%     +23.7%     230641 =C2=B1 10%  sched_debug.cpu#49.=
sched_count
        23 =C2=B1  4%     -11.6%         21 =C2=B1  6%  sched_debug.cpu#49.=
load
        23 =C2=B1  3%      -8.5%         21 =C2=B1  4%  sched_debug.cpu#49.=
cpu_load[3]
    177089 =C2=B1  2%     +27.3%     225406 =C2=B1 10%  sched_debug.cpu#49.=
nr_switches
    167664 =C2=B1  1%     -36.7%     106117 =C2=B1  0%  sched_debug.cpu#49.=
ttwu_local
        23 =C2=B1  3%      -8.5%         21 =C2=B1  4%  sched_debug.cpu#49.=
cpu_load[4]
    166672 =C2=B1  1%     -41.5%      97464 =C2=B1  1%  sched_debug.cpu#5.t=
twu_local
    178755 =C2=B1  1%     +20.8%     215849 =C2=B1  4%  sched_debug.cpu#5.n=
r_switches
        24 =C2=B1  3%     -10.3%         21 =C2=B1  1%  sched_debug.cpu#5.c=
pu_load[3]
      1952 =C2=B1 49%   +1764.2%      36403 =C2=B1 14%  sched_debug.cpu#5.s=
ched_goidle
        24 =C2=B1  3%     -11.3%         21 =C2=B1  4%  sched_debug.cpu#5.c=
pu_load[2]
        24 =C2=B1  3%      -9.3%         22 =C2=B1  3%  sched_debug.cpu#5.c=
pu_load[4]
    180103 =C2=B1  1%     +22.3%     220293 =C2=B1  4%  sched_debug.cpu#5.s=
ched_count
     69030 =C2=B1  6%    +212.1%     215419 =C2=B1 20%  sched_debug.cpu#50.=
avg_idle
    176148 =C2=B1  2%     +28.0%     225540 =C2=B1  5%  sched_debug.cpu#50.=
sched_count
    175987 =C2=B1  2%     +24.0%     218171 =C2=B1  4%  sched_debug.cpu#50.=
nr_switches
      2560 =C2=B1 41%   +1254.3%      34681 =C2=B1 12%  sched_debug.cpu#50.=
sched_goidle
    164647 =C2=B1  0%     -35.7%     105808 =C2=B1  1%  sched_debug.cpu#50.=
ttwu_local
    176242 =C2=B1  0%     +34.9%     237746 =C2=B1  3%  sched_debug.cpu#51.=
sched_count
    168148 =C2=B1  1%     -36.8%     106237 =C2=B1  0%  sched_debug.cpu#51.=
ttwu_local
    176164 =C2=B1  0%     +31.4%     231560 =C2=B1  3%  sched_debug.cpu#51.=
nr_switches
      1213 =C2=B1 45%   +2944.3%      36950 =C2=B1  6%  sched_debug.cpu#52.=
sched_goidle
        23 =C2=B1  3%      -9.7%         21 =C2=B1  3%  sched_debug.cpu#52.=
cpu_load[4]
    175292 =C2=B1  1%     +27.5%     223468 =C2=B1  2%  sched_debug.cpu#52.=
nr_switches
    166730 =C2=B1  1%     -37.0%     105089 =C2=B1  0%  sched_debug.cpu#52.=
ttwu_local
        23 =C2=B1  3%     -14.0%         20 =C2=B1  9%  sched_debug.cpu#52.=
cpu_load[0]
        23 =C2=B1  3%      -8.6%         21 =C2=B1  2%  sched_debug.cpu#53.=
cpu_load[3]
        40 =C2=B1 42%     -48.4%         20 =C2=B1  3%  sched_debug.cpu#53.=
load
    179569 =C2=B1  2%     +28.9%     231388 =C2=B1  3%  sched_debug.cpu#53.=
nr_switches
    167407 =C2=B1  1%     -36.9%     105692 =C2=B1  0%  sched_debug.cpu#53.=
ttwu_local
    179655 =C2=B1  2%     +34.2%     241141 =C2=B1  6%  sched_debug.cpu#53.=
sched_count
        23 =C2=B1  3%      -8.6%         21 =C2=B1  2%  sched_debug.cpu#53.=
cpu_load[4]
    174428 =C2=B1  1%     +36.4%     237955 =C2=B1  7%  sched_debug.cpu#54.=
sched_count
    173993 =C2=B1  1%     +32.2%     229940 =C2=B1  6%  sched_debug.cpu#54.=
nr_switches
    166433 =C2=B1  0%     -36.5%     105657 =C2=B1  1%  sched_debug.cpu#54.=
ttwu_local
    175746 =C2=B1  1%     +33.9%     235295 =C2=B1  4%  sched_debug.cpu#55.=
nr_switches
    167475 =C2=B1  1%     -36.7%     105966 =C2=B1  0%  sched_debug.cpu#55.=
ttwu_local
    175821 =C2=B1  1%     +39.2%     244753 =C2=B1  2%  sched_debug.cpu#55.=
sched_count
        23 =C2=B1  3%      -8.6%         21 =C2=B1  2%  sched_debug.cpu#56.=
cpu_load[4]
        23 =C2=B1  3%      -9.7%         21 =C2=B1  3%  sched_debug.cpu#56.=
cpu_load[3]
    167230 =C2=B1  1%     -37.2%     105025 =C2=B1  0%  sched_debug.cpu#56.=
ttwu_local
        23 =C2=B1  3%     -10.8%         20 =C2=B1  3%  sched_debug.cpu#56.=
cpu_load[2]
    176311 =C2=B1  2%     +28.3%     226191 =C2=B1  7%  sched_debug.cpu#56.=
nr_switches
       193 =C2=B1 19%  +19850.3%      38653 =C2=B1 21%  sched_debug.cpu#56.=
sched_goidle
        23 =C2=B1  5%     -12.0%         20 =C2=B1  5%  sched_debug.cpu#56.=
load
    759954 =C2=B1 13%     -79.3%     157648 =C2=B1 31%  sched_debug.cpu#56.=
avg_idle
    165900 =C2=B1  1%     -36.2%     105834 =C2=B1  1%  sched_debug.cpu#57.=
ttwu_local
    176279 =C2=B1  1%     +28.4%     226267 =C2=B1  5%  sched_debug.cpu#57.=
nr_switches
    176380 =C2=B1  1%     +32.8%     234176 =C2=B1  6%  sched_debug.cpu#57.=
sched_count
    167197 =C2=B1  0%     -37.0%     105305 =C2=B1  0%  sched_debug.cpu#58.=
ttwu_local
    176862 =C2=B1  2%     +23.7%     218848 =C2=B1  5%  sched_debug.cpu#58.=
nr_switches
    175807 =C2=B1  0%     +25.7%     221068 =C2=B1  2%  sched_debug.cpu#59.=
nr_switches
    175872 =C2=B1  0%     +30.3%     229131 =C2=B1  4%  sched_debug.cpu#59.=
sched_count
    167614 =C2=B1  1%     -36.2%     106902 =C2=B1  0%  sched_debug.cpu#59.=
ttwu_local
    166025 =C2=B1  0%     -42.4%      95660 =C2=B1  0%  sched_debug.cpu#6.t=
twu_local
    179032 =C2=B1  1%     +16.7%     208870 =C2=B1  4%  sched_debug.cpu#6.n=
r_switches
    179443 =C2=B1  1%     +20.5%     216251 =C2=B1  5%  sched_debug.cpu#6.s=
ched_count
    167213 =C2=B1  2%     -37.1%     105213 =C2=B1  0%  sched_debug.cpu#60.=
ttwu_local
    177699 =C2=B1  2%     +27.0%     225692 =C2=B1  4%  sched_debug.cpu#60.=
sched_count
    177596 =C2=B1  2%     +23.8%     219923 =C2=B1  4%  sched_debug.cpu#60.=
nr_switches
        24 =C2=B1  5%     -13.4%         21 =C2=B1  6%  sched_debug.cpu#61.=
load
    180983 =C2=B1  2%     +24.6%     225422 =C2=B1  8%  sched_debug.cpu#61.=
sched_count
    177131 =C2=B1  1%     +25.4%     222086 =C2=B1  8%  sched_debug.cpu#61.=
nr_switches
    166756 =C2=B1  1%     -36.3%     106293 =C2=B1  1%  sched_debug.cpu#61.=
ttwu_local
        23 =C2=B1  3%      -9.6%         21 =C2=B1  2%  sched_debug.cpu#61.=
cpu_load[3]
        23 =C2=B1  3%     -11.7%         20 =C2=B1  3%  sched_debug.cpu#61.=
cpu_load[0]
        23 =C2=B1  3%     -10.6%         21 =C2=B1  0%  sched_debug.cpu#61.=
cpu_load[2]
        23 =C2=B1  3%     -10.6%         21 =C2=B1  0%  sched_debug.cpu#61.=
cpu_load[1]
    175605 =C2=B1  2%     +27.5%     223907 =C2=B1  4%  sched_debug.cpu#62.=
nr_switches
    166760 =C2=B1  1%     -36.8%     105367 =C2=B1  0%  sched_debug.cpu#62.=
ttwu_local
    175734 =C2=B1  2%     +33.3%     234219 =C2=B1  7%  sched_debug.cpu#62.=
sched_count
    167720 =C2=B1  1%     -36.4%     106617 =C2=B1  0%  sched_debug.cpu#63.=
ttwu_local
    174924 =C2=B1  0%     +28.0%     223964 =C2=B1  3%  sched_debug.cpu#63.=
nr_switches
    174986 =C2=B1  0%     +32.9%     232539 =C2=B1  5%  sched_debug.cpu#63.=
sched_count
    166347 =C2=B1  1%     -42.6%      95559 =C2=B1  0%  sched_debug.cpu#64.=
ttwu_local
    175633 =C2=B1  0%     +25.9%     221167 =C2=B1  7%  sched_debug.cpu#64.=
sched_count
    175345 =C2=B1  0%     +23.3%     216170 =C2=B1  7%  sched_debug.cpu#64.=
nr_switches
        23 =C2=B1  3%     +70.2%         40 =C2=B1 37%  sched_debug.cpu#65.=
load
    166978 =C2=B1  1%     -41.6%      97436 =C2=B1  0%  sched_debug.cpu#65.=
ttwu_local
    191419 =C2=B1  6%     +13.0%     216269 =C2=B1  2%  sched_debug.cpu#65.=
sched_count
      1950 =C2=B1 39%   +1663.0%      34382 =C2=B1  7%  sched_debug.cpu#65.=
sched_goidle
    179204 =C2=B1  1%     +18.2%     211768 =C2=B1  2%  sched_debug.cpu#65.=
nr_switches
    165750 =C2=B1  0%     -42.4%      95477 =C2=B1  1%  sched_debug.cpu#66.=
ttwu_local
    175172 =C2=B1  2%     +23.5%     216411 =C2=B1  3%  sched_debug.cpu#66.=
nr_switches
    165786 =C2=B1  1%     -41.2%      97552 =C2=B1  2%  sched_debug.cpu#67.=
ttwu_local
    176798 =C2=B1  1%     +25.6%     222117 =C2=B1  3%  sched_debug.cpu#67.=
sched_count
    176722 =C2=B1  1%     +21.9%     215357 =C2=B1  4%  sched_debug.cpu#67.=
nr_switches
    166178 =C2=B1  2%     -43.0%      94690 =C2=B1  0%  sched_debug.cpu#68.=
ttwu_local
    175199 =C2=B1  2%     +27.8%     223987 =C2=B1  2%  sched_debug.cpu#68.=
sched_count
    174934 =C2=B1  2%     +23.2%     215541 =C2=B1  2%  sched_debug.cpu#68.=
nr_switches
    177251 =C2=B1  2%     +12.9%     200127 =C2=B1  5%  sched_debug.cpu#69.=
nr_switches
    165528 =C2=B1  1%     -41.8%      96412 =C2=B1  0%  sched_debug.cpu#69.=
ttwu_local
    179528 =C2=B1  2%     +14.4%     205343 =C2=B1  6%  sched_debug.cpu#69.=
sched_count
      2210 =C2=B1 45%   +1519.2%      35793 =C2=B1 10%  sched_debug.cpu#7.s=
ched_goidle
    167391 =C2=B1  1%     -42.2%      96823 =C2=B1  0%  sched_debug.cpu#7.t=
twu_local
    179573 =C2=B1  1%     +20.6%     216493 =C2=B1  3%  sched_debug.cpu#7.n=
r_switches
    179713 =C2=B1  1%     +26.3%     227048 =C2=B1  2%  sched_debug.cpu#7.s=
ched_count
    165566 =C2=B1  0%     -42.2%      95708 =C2=B1  1%  sched_debug.cpu#70.=
ttwu_local
    175773 =C2=B1  2%     +18.6%     208431 =C2=B1  5%  sched_debug.cpu#70.=
nr_switches
    166038 =C2=B1  1%     -41.4%      97292 =C2=B1  0%  sched_debug.cpu#71.=
ttwu_local
    178809 =C2=B1  3%     +16.3%     207874 =C2=B1  8%  sched_debug.cpu#71.=
sched_count
    178641 =C2=B1  3%     +13.2%     202297 =C2=B1  7%  sched_debug.cpu#71.=
nr_switches
    174677 =C2=B1  1%     +26.8%     221521 =C2=B1  4%  sched_debug.cpu#72.=
nr_switches
    174737 =C2=B1  1%     +29.5%     226273 =C2=B1  3%  sched_debug.cpu#72.=
sched_count
    167174 =C2=B1  0%     -36.9%     105460 =C2=B1  0%  sched_debug.cpu#72.=
ttwu_local
        23 =C2=B1  4%     -10.6%         21 =C2=B1  3%  sched_debug.cpu#72.=
load
        23 =C2=B1  6%     -10.5%         21 =C2=B1  2%  sched_debug.cpu#72.=
cpu_load[4]
    175197 =C2=B1  1%     +27.2%     222813 =C2=B1  2%  sched_debug.cpu#73.=
nr_switches
    180501 =C2=B1  5%     +26.1%     227669 =C2=B1  3%  sched_debug.cpu#73.=
sched_count
       907 =C2=B1 41%   +3938.1%      36645 =C2=B1  7%  sched_debug.cpu#73.=
sched_goidle
    166710 =C2=B1  1%     -36.3%     106170 =C2=B1  0%  sched_debug.cpu#73.=
ttwu_local
    165948 =C2=B1  0%     -36.5%     105379 =C2=B1  1%  sched_debug.cpu#74.=
ttwu_local
    174736 =C2=B1  3%     +24.9%     218301 =C2=B1  4%  sched_debug.cpu#74.=
sched_count
    173210 =C2=B1  1%     +22.1%     211497 =C2=B1  3%  sched_debug.cpu#74.=
nr_switches
    179808 =C2=B1  2%     +20.5%     216740 =C2=B1  8%  sched_debug.cpu#75.=
sched_count
    166196 =C2=B1  1%     -35.4%     107422 =C2=B1  2%  sched_debug.cpu#75.=
ttwu_local
    175970 =C2=B1  1%     +33.6%     235089 =C2=B1  3%  sched_debug.cpu#76.=
nr_switches
    166773 =C2=B1  1%     -37.3%     104592 =C2=B1  0%  sched_debug.cpu#76.=
ttwu_local
    176888 =C2=B1  2%     +38.5%     244955 =C2=B1  4%  sched_debug.cpu#76.=
sched_count
    175877 =C2=B1  1%     +32.3%     232768 =C2=B1  0%  sched_debug.cpu#77.=
nr_switches
    175962 =C2=B1  2%     +35.0%     237569 =C2=B1  0%  sched_debug.cpu#77.=
sched_count
    166344 =C2=B1  1%     -36.5%     105637 =C2=B1  0%  sched_debug.cpu#77.=
ttwu_local
        23 =C2=B1  4%      -8.7%         21 =C2=B1  0%  sched_debug.cpu#77.=
cpu_load[2]
    830522 =C2=B1 20%     -81.1%     156749 =C2=B1 18%  sched_debug.cpu#77.=
avg_idle
       218 =C2=B1 29%  +16095.5%      35427 =C2=B1 14%  sched_debug.cpu#78.=
sched_goidle
    165833 =C2=B1  0%     -36.6%     105162 =C2=B1  1%  sched_debug.cpu#78.=
ttwu_local
    837749 =C2=B1  9%     -74.5%     213985 =C2=B1 27%  sched_debug.cpu#78.=
avg_idle
    174413 =C2=B1  1%     +26.0%     219774 =C2=B1  4%  sched_debug.cpu#78.=
nr_switches
    174442 =C2=B1  1%     +30.3%     227212 =C2=B1  4%  sched_debug.cpu#78.=
sched_count
    166858 =C2=B1  1%     -35.9%     106969 =C2=B1  0%  sched_debug.cpu#79.=
ttwu_local
    176287 =C2=B1  1%     +25.3%     220962 =C2=B1  5%  sched_debug.cpu#79.=
nr_switches
         6 =C2=B1 36%     -68.0%          2 =C2=B1 50%  sched_debug.cpu#79.=
nr_uninterruptible
    176380 =C2=B1  1%     +29.2%     227883 =C2=B1  5%  sched_debug.cpu#79.=
sched_count
      2350 =C2=B1 13%   +1304.1%      32997 =C2=B1  9%  sched_debug.cpu#8.s=
ched_goidle
        24 =C2=B1  5%     -12.5%         21 =C2=B1  0%  sched_debug.cpu#8.c=
pu_load[2]
        24 =C2=B1  4%      -9.4%         21 =C2=B1  1%  sched_debug.cpu#8.c=
pu_load[4]
        23 =C2=B1  3%     -11.6%         21 =C2=B1  0%  sched_debug.cpu#8.c=
pu_load[1]
     57546 =C2=B1 21%    +180.9%     161635 =C2=B1 17%  sched_debug.cpu#8.a=
vg_idle
    180675 =C2=B1  3%     +15.4%     208566 =C2=B1  3%  sched_debug.cpu#8.n=
r_switches
        23 =C2=B1  3%     -13.7%         20 =C2=B1  2%  sched_debug.cpu#8.c=
pu_load[0]
    166132 =C2=B1  1%     -42.8%      95077 =C2=B1  0%  sched_debug.cpu#8.t=
twu_local
        25 =C2=B1  3%     -11.9%         22 =C2=B1  3%  sched_debug.cpu#9.l=
oad
    177994 =C2=B1  1%     +26.3%     224774 =C2=B1  1%  sched_debug.cpu#9.n=
r_switches
    167487 =C2=B1  1%     -41.8%      97488 =C2=B1  2%  sched_debug.cpu#9.t=
twu_local

testbox/testcase/testparams: lituya/unixbench/powersave-shell8

4ddbf3b0f1f755a5  3bb1e2aecc81817e158bead697  =

----------------  --------------------------  =

  15901822 =C2=B1  0%      -3.9%   15284691 =C2=B1  0%  unixbench.time.volu=
ntary_context_switches
       961 =C2=B1  0%      -2.1%        940 =C2=B1  0%  unixbench.time.perc=
ent_of_cpu_this_job_got
 4.699e+08 =C2=B1  0%      -3.1%  4.555e+08 =C2=B1  0%  unixbench.time.mino=
r_page_faults
      1305 =C2=B1  0%      -1.7%       1282 =C2=B1  0%  unixbench.time.user=
_time
      2333 =C2=B1  0%      -2.3%       2278 =C2=B1  0%  unixbench.time.syst=
em_time
    112454 =C2=B1  0%      -4.0%     107945 =C2=B1  0%  vmstat.system.cs
     20600 =C2=B1  0%      +1.1%      20825 =C2=B1  0%  vmstat.system.in
   1072956 =C2=B1  0%     -11.3%     951975 =C2=B1  0%  softirqs.RCU
   1004522 =C2=B1  0%     +53.1%    1537989 =C2=B1  0%  softirqs.SCHED
     61.48 =C2=B1  0%      -2.1%      60.19 =C2=B1  0%  turbostat.%Busy
      2019 =C2=B1  0%      -2.1%       1976 =C2=B1  0%  turbostat.Avg_MHz
      2.09 =C2=B1  3%     +48.6%       3.11 =C2=B1  4%  turbostat.CPU%c3
      5.61 =C2=B1  2%     +11.3%       6.24 =C2=B1  2%  turbostat.CPU%c6
     77.58 =C2=B1  0%      -2.0%      76.03 =C2=B1  0%  turbostat.PkgWatt
   2.6e+08 =C2=B1  4%     -20.0%  2.079e+08 =C2=B1  3%  cpuidle.C1-HSW.time
   2998166 =C2=B1  3%     -13.6%    2590084 =C2=B1  3%  cpuidle.C1E-HSW.usa=
ge
 4.318e+08 =C2=B1  1%     -15.7%  3.641e+08 =C2=B1  0%  cpuidle.C1E-HSW.time
   3559266 =C2=B1  3%     -14.5%    3041670 =C2=B1  3%  cpuidle.C3-HSW.usage
 8.768e+08 =C2=B1  3%     +18.7%  1.041e+09 =C2=B1  3%  cpuidle.C6-HSW.time
     24306 =C2=B1  5%     -16.6%      20282 =C2=B1  3%  cpuidle.POLL.time
      4933 =C2=B1  1%     -15.5%       4168 =C2=B1  0%  cpuidle.POLL.usage
    580742 =C2=B1  1%     -13.8%     500818 =C2=B1  1%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
     35905 =C2=B1  4%     -19.6%      28867 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
     35701 =C2=B1  4%     -19.4%      28760 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.blocked_load_avg
     35869 =C2=B1  6%     -19.5%      28859 =C2=B1  4%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
     35677 =C2=B1  6%     -19.5%      28724 =C2=B1  5%  sched_debug.cfs_rq[=
10]:/.blocked_load_avg
    579538 =C2=B1  1%     -13.8%     499341 =C2=B1  1%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
     35636 =C2=B1  4%     -13.1%      30972 =C2=B1  1%  sched_debug.cfs_rq[=
11]:/.blocked_load_avg
     35859 =C2=B1  4%     -13.3%      31085 =C2=B1  1%  sched_debug.cfs_rq[=
11]:/.tg_load_contrib
    579274 =C2=B1  1%     -13.9%     498853 =C2=B1  1%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
    579238 =C2=B1  1%     -13.9%     498918 =C2=B1  1%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
     34811 =C2=B1  4%      -8.1%      32004 =C2=B1  3%  sched_debug.cfs_rq[=
13]:/.blocked_load_avg
     35013 =C2=B1  4%      -8.3%      32117 =C2=B1  3%  sched_debug.cfs_rq[=
13]:/.tg_load_contrib
    578960 =C2=B1  1%     -14.0%     497635 =C2=B1  1%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
    579225 =C2=B1  1%     -14.1%     497561 =C2=B1  1%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
     36153 =C2=B1  2%     -13.2%      31365 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg_load_contrib
     35902 =C2=B1  2%     -12.9%      31261 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.blocked_load_avg
     36506 =C2=B1  2%     -15.9%      30687 =C2=B1  6%  sched_debug.cfs_rq[=
15]:/.blocked_load_avg
     36730 =C2=B1  2%     -16.2%      30774 =C2=B1  6%  sched_debug.cfs_rq[=
15]:/.tg_load_contrib
    579433 =C2=B1  1%     -14.1%     497827 =C2=B1  1%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
      2153 =C2=B1 10%     -30.3%       1501 =C2=B1 11%  sched_debug.cfs_rq[=
15]:/.utilization_load_avg
     36832 =C2=B1  2%     -16.5%      30740 =C2=B1  1%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
     36634 =C2=B1  2%     -16.4%      30635 =C2=B1  1%  sched_debug.cfs_rq[=
1]:/.blocked_load_avg
    581434 =C2=B1  1%     -14.0%     500162 =C2=B1  1%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
     35462 =C2=B1  3%      -9.5%      32097 =C2=B1  4%  sched_debug.cfs_rq[=
2]:/.blocked_load_avg
     35669 =C2=B1  3%      -9.6%      32240 =C2=B1  4%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
    581305 =C2=B1  1%     -14.0%     499849 =C2=B1  1%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
     36738 =C2=B1  2%     -11.8%      32386 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
     36944 =C2=B1  2%     -12.0%      32517 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
    581311 =C2=B1  1%     -14.0%     499700 =C2=B1  1%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
    581021 =C2=B1  1%     -14.0%     499633 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
     36645 =C2=B1  0%     -16.2%      30703 =C2=B1  2%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
     36873 =C2=B1  0%     -16.4%      30820 =C2=B1  2%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
     36549 =C2=B1  5%     -13.9%      31469 =C2=B1  1%  sched_debug.cfs_rq[=
5]:/.blocked_load_avg
    580261 =C2=B1  1%     -13.9%     499703 =C2=B1  1%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
   3084933 =C2=B1  1%      -9.3%    2797076 =C2=B1  1%  sched_debug.cfs_rq[=
5]:/.min_vruntime
     36776 =C2=B1  4%     -14.2%      31550 =C2=B1  1%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
    580504 =C2=B1  1%     -14.1%     498900 =C2=B1  1%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     36401 =C2=B1  0%     -13.5%      31476 =C2=B1  5%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
   3093202 =C2=B1  1%      -9.7%    2792581 =C2=B1  1%  sched_debug.cfs_rq[=
6]:/.min_vruntime
      1853 =C2=B1 16%     -27.4%       1346 =C2=B1 10%  sched_debug.cfs_rq[=
6]:/.utilization_load_avg
     36667 =C2=B1  0%     -13.8%      31589 =C2=B1  5%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
    580568 =C2=B1  1%     -13.9%     499602 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
     37463 =C2=B1  2%     -17.4%      30963 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.blocked_load_avg
     37686 =C2=B1  2%     -17.5%      31106 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
    580276 =C2=B1  1%     -14.0%     499073 =C2=B1  1%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
    579841 =C2=B1  1%     -13.9%     499390 =C2=B1  1%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
         4 =C2=B1 25%     +88.2%          8 =C2=B1 44%  sched_debug.cfs_rq[=
9]:/.nr_spread_over
     36130 =C2=B1  2%     -14.8%      30793 =C2=B1  4%  sched_debug.cfs_rq[=
9]:/.tg_load_contrib
     35930 =C2=B1  2%     -14.7%      30665 =C2=B1  4%  sched_debug.cfs_rq[=
9]:/.blocked_load_avg
    356452 =C2=B1  4%     -13.2%     309273 =C2=B1  1%  sched_debug.cpu#10.=
sched_goidle
    160536 =C2=B1  0%     +10.1%     176742 =C2=B1  0%  sched_debug.cpu#10.=
nr_load_updates
    348045 =C2=B1  0%     -11.3%     308650 =C2=B1  1%  sched_debug.cpu#11.=
sched_goidle
       595 =C2=B1 22%     -50.9%        292 =C2=B1 37%  sched_debug.cpu#11.=
nr_uninterruptible
    160084 =C2=B1  0%     +10.3%     176573 =C2=B1  0%  sched_debug.cpu#11.=
nr_load_updates
    160199 =C2=B1  0%     +10.2%     176479 =C2=B1  0%  sched_debug.cpu#12.=
nr_load_updates
    350644 =C2=B1  1%     -11.7%     309530 =C2=B1  1%  sched_debug.cpu#12.=
sched_goidle
    349761 =C2=B1  1%     -11.6%     309021 =C2=B1  1%  sched_debug.cpu#13.=
sched_goidle
    349724 =C2=B1  0%     -10.9%     311703 =C2=B1  1%  sched_debug.cpu#14.=
sched_goidle
       679 =C2=B1 12%     -59.4%        275 =C2=B1 40%  sched_debug.cpu#14.=
nr_uninterruptible
    348808 =C2=B1  1%     -12.8%     303997 =C2=B1  0%  sched_debug.cpu#15.=
sched_goidle
        56 =C2=B1 15%     -34.2%         37 =C2=B1  5%  sched_debug.cpu#15.=
cpu_load[0]
    159500 =C2=B1  0%     +10.4%     176028 =C2=B1  0%  sched_debug.cpu#15.=
nr_load_updates
    510665 =C2=B1  1%     -12.7%     445648 =C2=B1  1%  sched_debug.cpu#2.s=
ched_goidle
        48 =C2=B1  5%     -16.4%         40 =C2=B1  9%  sched_debug.cpu#2.c=
pu_load[1]
    277120 =C2=B1  6%     +12.5%     311786 =C2=B1  8%  sched_debug.cpu#3.a=
vg_idle
    163869 =C2=B1  0%     +10.0%     180247 =C2=B1  0%  sched_debug.cpu#3.n=
r_load_updates
    504905 =C2=B1  1%     -10.5%     451680 =C2=B1  1%  sched_debug.cpu#3.s=
ched_goidle
    510955 =C2=B1  1%     -10.2%     458684 =C2=B1  1%  sched_debug.cpu#4.s=
ched_goidle
        35 =C2=B1  5%    +101.4%         71 =C2=B1 33%  sched_debug.cpu#5.l=
oad
    504253 =C2=B1  0%     -10.6%     450994 =C2=B1  0%  sched_debug.cpu#5.s=
ched_goidle
    503338 =C2=B1  0%      -9.0%     458201 =C2=B1  1%  sched_debug.cpu#7.s=
ched_goidle
    352445 =C2=B1  1%     -11.2%     312961 =C2=B1  1%  sched_debug.cpu#8.s=
ched_goidle
    160420 =C2=B1  0%     +10.0%     176505 =C2=B1  0%  sched_debug.cpu#8.n=
r_load_updates
     40121 =C2=B1  2%     +11.2%      44599 =C2=B1  1%  sched_debug.cpu#8.c=
urr->pid
    350408 =C2=B1  1%     -12.0%     308488 =C2=B1  1%  sched_debug.cpu#9.s=
ched_goidle
      0.00 =C2=B1 33%     +40.3%       0.00 =C2=B1  9%  sched_debug.rt_rq[3=
]:/.rt_time

testbox/testcase/testparams: lkp-nex04/pigz/performance-100%-128K

4ddbf3b0f1f755a5  3bb1e2aecc81817e158bead697  =

----------------  --------------------------  =

 4.472e+08 =C2=B1  0%      +3.3%  4.619e+08 =C2=B1  0%  pigz.throughput
      6099 =C2=B1  0%      +2.7%       6263 =C2=B1  0%  pigz.time.percent_o=
f_cpu_this_job_got
     17911 =C2=B1  0%      +2.6%      18380 =C2=B1  0%  pigz.time.user_time
   3680069 =C2=B1  0%     -17.6%    3033472 =C2=B1  0%  pigz.time.voluntary=
_context_switches
   1235329 =C2=B1  1%     +62.0%    2000666 =C2=B1  1%  pigz.time.involunta=
ry_context_switches
      3082 =C2=B1  0%     -17.4%       2547 =C2=B1  0%  uptime.idle
     23400 =C2=B1  0%     -13.6%      20227 =C2=B1  0%  vmstat.system.cs
    140127 =C2=B1  2%      +4.6%     146546 =C2=B1  1%  vmstat.system.in
    329967 =C2=B1  8%   +2084.7%    7208720 =C2=B1  1%  softirqs.SCHED
          1:4          -25%            :4     kmsg.CE:hpet_increased_min_de=
lta_ns_to#nsec
   1235329 =C2=B1  1%     +62.0%    2000666 =C2=B1  1%  time.involuntary_co=
ntext_switches
   3680069 =C2=B1  0%     -17.6%    3033472 =C2=B1  0%  time.voluntary_cont=
ext_switches
     95.35 =C2=B1  0%      +2.7%      97.92 =C2=B1  0%  turbostat.%Busy
      2214 =C2=B1  0%      +4.7%       2319 =C2=B1  0%  turbostat.Avg_MHz
      3.44 =C2=B1  2%     -56.5%       1.50 =C2=B1  3%  turbostat.CPU%c1
      1.20 =C2=B1  1%     -51.8%       0.58 =C2=B1  3%  turbostat.CPU%c3
  13579670 =C2=B1  9%     -22.0%   10588584 =C2=B1 12%  numa-numastat.node1=
.local_node
  13581239 =C2=B1  9%     -22.0%   10590677 =C2=B1 12%  numa-numastat.node1=
.numa_hit
  43644561 =C2=B1  2%     +13.8%   49653422 =C2=B1  3%  cpuidle.C1-NHM.time
  55321458 =C2=B1  3%     -64.7%   19521564 =C2=B1  7%  cpuidle.C1E-NHM.time
    269036 =C2=B1  2%     -64.2%      96236 =C2=B1  7%  cpuidle.C1E-NHM.usa=
ge
 8.101e+08 =C2=B1  2%     -58.3%  3.378e+08 =C2=B1  2%  cpuidle.C3-NHM.time
   1681898 =C2=B1  1%     -57.4%     717280 =C2=B1  2%  cpuidle.C3-NHM.usage
        67 =C2=B1 16%     -44.3%         37 =C2=B1 16%  cpuidle.POLL.usage
      2226 =C2=B1  9%     +17.7%       2619 =C2=B1  4%  numa-meminfo.node1.=
KernelStack
     57316 =C2=B1 17%     -16.4%      47929 =C2=B1  5%  numa-meminfo.node1.=
Active
     19210 =C2=B1  3%      +8.2%      20786 =C2=B1  2%  numa-meminfo.node3.=
SUnreclaim
     34742 =C2=B1  5%     -72.7%       9491 =C2=B1 28%  numa-vmstat.node0.n=
uma_other
   6941583 =C2=B1 13%     -21.9%    5420712 =C2=B1 15%  numa-vmstat.node1.n=
uma_local
   6971028 =C2=B1 13%     -21.4%    5477271 =C2=B1 14%  numa-vmstat.node1.n=
uma_hit
     29444 =C2=B1  6%     +92.1%      56559 =C2=B1  3%  numa-vmstat.node1.n=
uma_other
   4761738 =C2=B1 12%     +34.0%    6381555 =C2=B1 16%  numa-vmstat.node3.n=
uma_local
   4822491 =C2=B1 11%     +33.6%    6443149 =C2=B1 16%  numa-vmstat.node3.n=
uma_hit
      4802 =C2=B1  3%      +8.2%       5196 =C2=B1  2%  numa-vmstat.node3.n=
r_slab_unreclaimable
      2150 =C2=B1  2%      +8.6%       2335 =C2=B1  4%  slabinfo.mnt_cache.=
active_objs
      2150 =C2=B1  2%      +8.6%       2335 =C2=B1  4%  slabinfo.mnt_cache.=
num_objs
      1.57 =C2=B1  8%     -56.2%       0.69 =C2=B1 16%  perf-profile.cpu-cy=
cles.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.start_secondary
      1.67 =C2=B1 11%     +47.4%       2.46 =C2=B1 11%  perf-profile.cpu-cy=
cles.trigger_load_balance.scheduler_tick.update_process_times.tick_sched_ha=
ndle.tick_sched_timer
     27.51 =C2=B1  8%     -21.8%      21.52 =C2=B1 11%  perf-profile.cpu-cy=
cles.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interru=
pt
      3.40 =C2=B1 15%     -27.2%       2.47 =C2=B1 16%  perf-profile.cpu-cy=
cles.do_futex.sys_futex.system_call_fastpath
      1.39 =C2=B1  4%     -59.0%       0.57 =C2=B1 20%  perf-profile.cpu-cy=
cles.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate.sched_tt=
wu_pending
      3.44 =C2=B1 14%     -27.4%       2.50 =C2=B1 16%  perf-profile.cpu-cy=
cles.sys_futex.system_call_fastpath
      2.16 =C2=B1 11%     -23.4%       1.66 =C2=B1 11%  perf-profile.cpu-cy=
cles.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.enqueue_t=
ask.activate_task
      1.46 =C2=B1  9%    +389.3%       7.12 =C2=B1 10%  perf-profile.cpu-cy=
cles.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt
     27.27 =C2=B1  9%     -21.9%      21.30 =C2=B1 11%  perf-profile.cpu-cy=
cles.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_timer_interrupt.=
apic_timer_interrupt
     26.67 =C2=B1  9%     -22.0%      20.80 =C2=B1 11%  perf-profile.cpu-cy=
cles.__run_hrtimer.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_ti=
mer_interrupt.apic_timer_interrupt
      1.93 =C2=B1 12%     -22.6%       1.50 =C2=B1 11%  perf-profile.cpu-cy=
cles.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entity.enqueu=
e_task_fair.enqueue_task
      1.10 =C2=B1  5%     -61.4%       0.43 =C2=B1 24%  perf-profile.cpu-cy=
cles.enqueue_task.activate_task.ttwu_do_activate.sched_ttwu_pending.cpu_sta=
rtup_entry
      1.92 =C2=B1 12%     -22.5%       1.49 =C2=B1 11%  perf-profile.cpu-cy=
cles.dump_trace.save_stack_trace_tsk.__account_scheduler_latency.enqueue_en=
tity.enqueue_task_fair
      0.63 =C2=B1 19%     +75.4%       1.10 =C2=B1 20%  perf-profile.cpu-cy=
cles.update_curr.task_tick_fair.scheduler_tick.update_process_times.tick_sc=
hed_handle
      1.09 =C2=B1  6%     -61.4%       0.42 =C2=B1 23%  perf-profile.cpu-cy=
cles.activate_task.ttwu_do_activate.sched_ttwu_pending.cpu_startup_entry.st=
art_secondary
      5.30 =C2=B1 13%     -30.1%       3.71 =C2=B1 11%  perf-profile.cpu-cy=
cles.update_cfs_shares.task_tick_fair.scheduler_tick.update_process_times.t=
ick_sched_handle
      1.50 =C2=B1  7%     -57.4%       0.64 =C2=B1 18%  perf-profile.cpu-cy=
cles.intel_idle.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.start_s=
econdary
     25.26 =C2=B1  9%     -22.2%      19.66 =C2=B1 11%  perf-profile.cpu-cy=
cles.tick_sched_handle.isra.18.tick_sched_timer.__run_hrtimer.hrtimer_inter=
rupt.local_apic_timer_interrupt
     25.63 =C2=B1  9%     -21.9%      20.01 =C2=B1 11%  perf-profile.cpu-cy=
cles.tick_sched_timer.__run_hrtimer.hrtimer_interrupt.local_apic_timer_inte=
rrupt.smp_apic_timer_interrupt
      1.17 =C2=B1  4%     -61.8%       0.45 =C2=B1 24%  perf-profile.cpu-cy=
cles.sched_ttwu_pending.cpu_startup_entry.start_secondary
      4.83 =C2=B1 11%     -33.6%       3.21 =C2=B1 11%  perf-profile.cpu-cy=
cles.update_cfs_rq_blocked_load.task_tick_fair.scheduler_tick.update_proces=
s_times.tick_sched_handle
      1.12 =C2=B1  5%     -61.9%       0.43 =C2=B1 23%  perf-profile.cpu-cy=
cles.ttwu_do_activate.constprop.86.sched_ttwu_pending.cpu_startup_entry.sta=
rt_secondary
      2.72 =C2=B1 11%     -26.5%       2.00 =C2=B1 12%  perf-profile.cpu-cy=
cles.enqueue_entity.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_ac=
tivate
      1.99 =C2=B1  8%     -29.2%       1.41 =C2=B1 18%  perf-profile.cpu-cy=
cles.cpuidle_enter.cpu_startup_entry.start_secondary
     25.05 =C2=B1  9%     -22.4%      19.45 =C2=B1 11%  perf-profile.cpu-cy=
cles.update_process_times.tick_sched_handle.tick_sched_timer.__run_hrtimer.=
hrtimer_interrupt
     18.91 =C2=B1  9%     -31.7%      12.92 =C2=B1 11%  perf-profile.cpu-cy=
cles.task_tick_fair.scheduler_tick.update_process_times.tick_sched_handle.t=
ick_sched_timer
     22.73 =C2=B1  9%     -22.5%      17.60 =C2=B1 11%  perf-profile.cpu-cy=
cles.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer=
.__run_hrtimer
      1.03 =C2=B1 12%     -18.9%       0.84 =C2=B1 13%  perf-profile.cpu-cy=
cles.__kernel_text_address.print_context_stack.dump_trace.save_stack_trace_=
tsk.__account_scheduler_latency
      4.53 =C2=B1  5%     -45.8%       2.46 =C2=B1 16%  perf-profile.cpu-cy=
cles.cpu_startup_entry.start_secondary
      1.16 =C2=B1 13%    +486.4%       6.79 =C2=B1 10%  perf-profile.cpu-cy=
cles.__do_softirq.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt
      0.08 =C2=B1 42%   +6985.3%       6.02 =C2=B1 12%  perf-profile.cpu-cy=
cles.run_rebalance_domains.__do_softirq.irq_exit.smp_apic_timer_interrupt.a=
pic_timer_interrupt
      4.58 =C2=B1  5%     -45.7%       2.49 =C2=B1 17%  perf-profile.cpu-cy=
cles.start_secondary
      0.08 =C2=B1 43%   +7467.7%       5.87 =C2=B1 12%  perf-profile.cpu-cy=
cles.rebalance_domains.run_rebalance_domains.__do_softirq.irq_exit.smp_apic=
_timer_interrupt
      0.22 =C2=B1 10%   +2055.6%       4.85 =C2=B1 13%  perf-profile.cpu-cy=
cles.load_balance.rebalance_domains.run_rebalance_domains.__do_softirq.irq_=
exit
      0.15 =C2=B1 20%   +2230.0%       3.50 =C2=B1 10%  perf-profile.cpu-cy=
cles.find_busiest_group.load_balance.rebalance_domains.run_rebalance_domain=
s.__do_softirq
      4510 =C2=B1  6%     -24.3%       3413 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
       914 =C2=B1  6%     +11.1%       1015 =C2=B1  3%  sched_debug.cfs_rq[=
0]:/.utilization_load_avg
        12 =C2=B1 15%     +60.4%         19 =C2=B1 17%  sched_debug.cfs_rq[=
0]:/.nr_spread_over
      4432 =C2=B1  6%     -25.1%       3318 =C2=B1  2%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
      4403 =C2=B1  7%     -24.6%       3318 =C2=B1  2%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
      4358 =C2=B1  8%     -24.1%       3308 =C2=B1  2%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
        72 =C2=B1 28%     -74.7%         18 =C2=B1 28%  sched_debug.cfs_rq[=
13]:/.tg_load_contrib
      4284 =C2=B1  7%     -22.2%       3335 =C2=B1  2%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
        14 =C2=B1 34%     +50.9%         21 =C2=B1 13%  sched_debug.cfs_rq[=
14]:/.nr_spread_over
      4256 =C2=B1  7%     -21.5%       3343 =C2=B1  2%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
      4166 =C2=B1  6%     -20.2%       3323 =C2=B1  3%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
         7 =C2=B1 46%    +182.8%         20 =C2=B1 17%  sched_debug.cfs_rq[=
16]:/.nr_spread_over
      4160 =C2=B1  5%     -20.3%       3314 =C2=B1  3%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
      4152 =C2=B1  6%     -20.7%       3294 =C2=B1  4%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
      4156 =C2=B1  6%     -21.0%       3282 =C2=B1  4%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
      4094 =C2=B1  5%     -19.3%       3305 =C2=B1  5%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
         5 =C2=B1 31%    +265.0%         18 =C2=B1 42%  sched_debug.cfs_rq[=
19]:/.nr_spread_over
      4523 =C2=B1  6%     -25.3%       3377 =C2=B1  3%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
      4008 =C2=B1  6%     -17.9%       3290 =C2=B1  5%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
        11 =C2=B1 18%    +104.3%         23 =C2=B1 19%  sched_debug.cfs_rq[=
20]:/.nr_spread_over
      4004 =C2=B1  6%     -18.1%       3279 =C2=B1  4%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
      4006 =C2=B1  6%     -18.7%       3258 =C2=B1  4%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
      4008 =C2=B1  6%     -18.3%       3276 =C2=B1  4%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
      4000 =C2=B1  6%     -17.9%       3283 =C2=B1  4%  sched_debug.cfs_rq[=
24]:/.tg_load_avg
        85 =C2=B1 15%     -57.6%         36 =C2=B1 32%  sched_debug.cfs_rq[=
25]:/.tg_load_contrib
      4088 =C2=B1  4%     -19.4%       3296 =C2=B1  4%  sched_debug.cfs_rq[=
25]:/.tg_load_avg
      4072 =C2=B1  4%     -18.5%       3317 =C2=B1  5%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
      4068 =C2=B1  4%     -18.7%       3307 =C2=B1  5%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
       852 =C2=B1  4%     +11.0%        946 =C2=B1  5%  sched_debug.cfs_rq[=
28]:/.utilization_load_avg
      4068 =C2=B1  4%     -19.0%       3295 =C2=B1  5%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
      4067 =C2=B1  4%     -19.1%       3291 =C2=B1  5%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
         6 =C2=B1 36%    +251.9%         23 =C2=B1 40%  sched_debug.cfs_rq[=
29]:/.nr_spread_over
         8 =C2=B1 21%    +132.4%         19 =C2=B1 24%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
      4484 =C2=B1  6%     -24.8%       3373 =C2=B1  3%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
         8 =C2=B1 35%    +166.7%         22 =C2=B1 26%  sched_debug.cfs_rq[=
30]:/.nr_spread_over
      4068 =C2=B1  3%     -19.2%       3285 =C2=B1  5%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
      4096 =C2=B1  3%     -19.7%       3289 =C2=B1  6%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
      4112 =C2=B1  2%     -19.9%       3294 =C2=B1  5%  sched_debug.cfs_rq[=
32]:/.tg_load_avg
         5 =C2=B1 43%    +133.3%         12 =C2=B1 32%  sched_debug.cfs_rq[=
32]:/.nr_spread_over
      4105 =C2=B1  3%     -20.1%       3278 =C2=B1  4%  sched_debug.cfs_rq[=
33]:/.tg_load_avg
      4092 =C2=B1  2%     -19.7%       3287 =C2=B1  6%  sched_debug.cfs_rq[=
34]:/.tg_load_avg
      4091 =C2=B1  2%     -19.1%       3310 =C2=B1  7%  sched_debug.cfs_rq[=
35]:/.tg_load_avg
      4045 =C2=B1  2%     -17.5%       3337 =C2=B1  7%  sched_debug.cfs_rq[=
36]:/.tg_load_avg
       843 =C2=B1  4%     +11.9%        944 =C2=B1  2%  sched_debug.cfs_rq[=
36]:/.utilization_load_avg
      4050 =C2=B1  3%     -17.7%       3334 =C2=B1  7%  sched_debug.cfs_rq[=
37]:/.tg_load_avg
       837 =C2=B1  4%     +10.9%        928 =C2=B1  5%  sched_debug.cfs_rq[=
38]:/.utilization_load_avg
      4061 =C2=B1  3%     -18.4%       3313 =C2=B1  6%  sched_debug.cfs_rq[=
38]:/.tg_load_avg
      4047 =C2=B1  3%     -18.5%       3299 =C2=B1  6%  sched_debug.cfs_rq[=
39]:/.tg_load_avg
      4477 =C2=B1  6%     -25.0%       3357 =C2=B1  2%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
        10 =C2=B1 48%    +110.0%         21 =C2=B1 31%  sched_debug.cfs_rq[=
3]:/.nr_spread_over
      4052 =C2=B1  3%     -18.2%       3313 =C2=B1  7%  sched_debug.cfs_rq[=
40]:/.tg_load_avg
      4070 =C2=B1  4%     -18.1%       3331 =C2=B1  7%  sched_debug.cfs_rq[=
41]:/.tg_load_avg
      4077 =C2=B1  4%     -17.8%       3353 =C2=B1  8%  sched_debug.cfs_rq[=
42]:/.tg_load_avg
         5 =C2=B1 41%    +176.2%         14 =C2=B1 39%  sched_debug.cfs_rq[=
43]:/.nr_spread_over
       890 =C2=B1  1%     +10.7%        985 =C2=B1  3%  sched_debug.cfs_rq[=
47]:/.utilization_load_avg
         6 =C2=B1 39%     +87.5%         11 =C2=B1  7%  sched_debug.cfs_rq[=
47]:/.nr_spread_over
         3 =C2=B1 33%    +400.0%         16 =C2=B1 33%  sched_debug.cfs_rq[=
49]:/.nr_spread_over
      4460 =C2=B1  6%     -25.1%       3341 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
       863 =C2=B1  6%     +10.2%        951 =C2=B1  3%  sched_debug.cfs_rq[=
51]:/.utilization_load_avg
       835 =C2=B1  2%     +13.6%        949 =C2=B1  4%  sched_debug.cfs_rq[=
52]:/.utilization_load_avg
         5 =C2=B1 37%    +160.0%         13 =C2=B1 40%  sched_debug.cfs_rq[=
53]:/.nr_spread_over
      4464 =C2=B1  6%     -25.2%       3339 =C2=B1  1%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
         6 =C2=B1 39%     +61.5%         10 =C2=B1 14%  sched_debug.cfs_rq[=
63]:/.nr_spread_over
        42 =C2=B1 32%     -45.9%         23 =C2=B1 43%  sched_debug.cfs_rq[=
63]:/.tg_load_contrib
      4459 =C2=B1  6%     -25.4%       3327 =C2=B1  2%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
      4448 =C2=B1  6%     -25.1%       3330 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
         9 =C2=B1 23%    +102.8%         18 =C2=B1 21%  sched_debug.cfs_rq[=
7]:/.nr_spread_over
      4443 =C2=B1  6%     -25.3%       3319 =C2=B1  2%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
      4430 =C2=B1  6%     -25.2%       3315 =C2=B1  2%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
     16863 =C2=B1  2%     -52.8%       7967 =C2=B1  8%  sched_debug.cpu#0.s=
ched_goidle
     14511 =C2=B1 16%     +29.6%      18800 =C2=B1 10%  sched_debug.cpu#0.t=
twu_local
    437738 =C2=B1  5%    +147.9%    1085133 =C2=B1 45%  sched_debug.cpu#0.a=
vg_idle
     11628 =C2=B1 22%     +58.4%      18420 =C2=B1 14%  sched_debug.cpu#1.t=
twu_local
     16438 =C2=B1  3%     -55.1%       7373 =C2=B1  4%  sched_debug.cpu#1.s=
ched_goidle
     19110 =C2=B1  8%     -59.1%       7817 =C2=B1  2%  sched_debug.cpu#10.=
sched_goidle
     75360 =C2=B1 15%     -25.3%      56264 =C2=B1 12%  sched_debug.cpu#10.=
nr_switches
     40935 =C2=B1 18%     -26.1%      30249 =C2=B1 10%  sched_debug.cpu#10.=
ttwu_count
     17920 =C2=B1  9%     -52.6%       8493 =C2=B1  3%  sched_debug.cpu#11.=
sched_goidle
      4877 =C2=B1  3%      +8.3%       5283 =C2=B1  4%  sched_debug.cpu#12.=
curr->pid
     17648 =C2=B1 10%     -59.1%       7223 =C2=B1  6%  sched_debug.cpu#12.=
sched_goidle
     68448 =C2=B1  5%     -22.1%      53323 =C2=B1 11%  sched_debug.cpu#13.=
nr_switches
    401066 =C2=B1  9%     +42.1%     569965 =C2=B1 11%  sched_debug.cpu#13.=
avg_idle
     37896 =C2=B1  5%     -23.2%      29095 =C2=B1 10%  sched_debug.cpu#13.=
ttwu_count
     17296 =C2=B1  4%     -57.7%       7311 =C2=B1  2%  sched_debug.cpu#13.=
sched_goidle
     71797 =C2=B1  4%     -31.0%      49510 =C2=B1 17%  sched_debug.cpu#14.=
nr_switches
     38959 =C2=B1  3%     -30.2%      27179 =C2=B1 18%  sched_debug.cpu#14.=
ttwu_count
     18487 =C2=B1  6%     -64.5%       6562 =C2=B1  5%  sched_debug.cpu#14.=
sched_goidle
     36370 =C2=B1 12%     -24.5%      27442 =C2=B1 10%  sched_debug.cpu#15.=
ttwu_count
     65857 =C2=B1 10%     -22.6%      50946 =C2=B1 10%  sched_debug.cpu#15.=
nr_switches
     16935 =C2=B1  8%     -60.3%       6723 =C2=B1  4%  sched_debug.cpu#15.=
sched_goidle
     16297 =C2=B1  8%     -58.8%       6713 =C2=B1  8%  sched_debug.cpu#16.=
sched_goidle
     11383 =C2=B1 31%     +60.8%      18308 =C2=B1 30%  sched_debug.cpu#17.=
ttwu_local
     16024 =C2=B1  8%     -59.5%       6489 =C2=B1  6%  sched_debug.cpu#17.=
sched_goidle
     15970 =C2=B1  8%     -57.9%       6726 =C2=B1  7%  sched_debug.cpu#18.=
sched_goidle
     16111 =C2=B1  4%     -59.8%       6483 =C2=B1  4%  sched_debug.cpu#19.=
sched_goidle
    439227 =C2=B1  8%     +25.2%     550035 =C2=B1  8%  sched_debug.cpu#19.=
avg_idle
     17181 =C2=B1  4%     -56.7%       7435 =C2=B1  6%  sched_debug.cpu#2.s=
ched_goidle
    393196 =C2=B1  2%     +20.7%     474648 =C2=B1 11%  sched_debug.cpu#2.a=
vg_idle
    107102 =C2=B1 40%    +115.3%     230574 =C2=B1 30%  sched_debug.cpu#2.s=
ched_count
     12461 =C2=B1  8%     +40.1%      17456 =C2=B1 14%  sched_debug.cpu#2.t=
twu_local
     16105 =C2=B1  6%     -57.8%       6789 =C2=B1  8%  sched_debug.cpu#20.=
sched_goidle
    420962 =C2=B1  7%     +30.1%     547836 =C2=B1 13%  sched_debug.cpu#21.=
avg_idle
     15178 =C2=B1  7%     -54.9%       6851 =C2=B1  7%  sched_debug.cpu#21.=
sched_goidle
     11093 =C2=B1 16%     +51.2%      16770 =C2=B1 26%  sched_debug.cpu#21.=
ttwu_local
     15629 =C2=B1  8%     -56.8%       6747 =C2=B1  7%  sched_debug.cpu#22.=
sched_goidle
    429716 =C2=B1  3%     +80.3%     774680 =C2=B1 41%  sched_debug.cpu#23.=
avg_idle
     10133 =C2=B1 16%     +74.0%      17629 =C2=B1 46%  sched_debug.cpu#23.=
ttwu_local
     15685 =C2=B1  6%     -57.5%       6661 =C2=B1  8%  sched_debug.cpu#23.=
sched_goidle
     15621 =C2=B1  8%     -53.1%       7319 =C2=B1 17%  sched_debug.cpu#24.=
sched_goidle
     10793 =C2=B1 19%     +89.2%      20417 =C2=B1 32%  sched_debug.cpu#24.=
ttwu_local
     15696 =C2=B1  4%     -54.3%       7172 =C2=B1  9%  sched_debug.cpu#25.=
sched_goidle
     10699 =C2=B1  9%     +77.4%      18985 =C2=B1  6%  sched_debug.cpu#25.=
ttwu_local
    409073 =C2=B1  8%     +33.1%     544568 =C2=B1 10%  sched_debug.cpu#26.=
avg_idle
     10930 =C2=B1 16%     +47.2%      16085 =C2=B1 11%  sched_debug.cpu#26.=
ttwu_local
     15439 =C2=B1  5%     -54.5%       7027 =C2=B1  8%  sched_debug.cpu#26.=
sched_goidle
     15713 =C2=B1  4%     -54.0%       7225 =C2=B1  8%  sched_debug.cpu#27.=
sched_goidle
     14739 =C2=B1  1%     -53.2%       6903 =C2=B1  8%  sched_debug.cpu#28.=
sched_goidle
    466153 =C2=B1  7%     +32.7%     618467 =C2=B1  7%  sched_debug.cpu#28.=
avg_idle
      9979 =C2=B1 16%     +66.8%      16646 =C2=B1  5%  sched_debug.cpu#28.=
ttwu_local
     50993 =C2=B1  4%     +16.3%      59328 =C2=B1  7%  sched_debug.cpu#29.=
nr_switches
     14913 =C2=B1  4%     -54.0%       6855 =C2=B1  9%  sched_debug.cpu#29.=
sched_goidle
      9267 =C2=B1  6%    +107.0%      19183 =C2=B1  8%  sched_debug.cpu#29.=
ttwu_local
     28317 =C2=B1  5%     +13.5%      32135 =C2=B1  6%  sched_debug.cpu#29.=
ttwu_count
     56947 =C2=B1 10%    +363.0%     263690 =C2=B1 46%  sched_debug.cpu#29.=
sched_count
    386248 =C2=B1  9%     +49.6%     577789 =C2=B1 12%  sched_debug.cpu#29.=
avg_idle
      9914 =C2=B1 15%     +74.4%      17289 =C2=B1 16%  sched_debug.cpu#3.t=
twu_local
    421374 =C2=B1  9%     +30.0%     547775 =C2=B1  7%  sched_debug.cpu#3.a=
vg_idle
     16212 =C2=B1  4%     -56.9%       6985 =C2=B1  6%  sched_debug.cpu#3.s=
ched_goidle
      9952 =C2=B1 13%     +74.5%      17365 =C2=B1 24%  sched_debug.cpu#30.=
ttwu_local
     15270 =C2=B1  4%     -55.2%       6847 =C2=B1  9%  sched_debug.cpu#30.=
sched_goidle
    436567 =C2=B1  8%     +22.6%     535104 =C2=B1  7%  sched_debug.cpu#30.=
avg_idle
      9863 =C2=B1 26%     +76.4%      17395 =C2=B1  7%  sched_debug.cpu#31.=
ttwu_local
     15151 =C2=B1  6%     -52.5%       7198 =C2=B1 10%  sched_debug.cpu#31.=
sched_goidle
    410894 =C2=B1  8%     +19.5%     491153 =C2=B1  6%  sched_debug.cpu#32.=
avg_idle
     13675 =C2=B1  2%     -57.5%       5814 =C2=B1  5%  sched_debug.cpu#32.=
sched_goidle
      8577 =C2=B1 22%     +51.7%      13015 =C2=B1 12%  sched_debug.cpu#32.=
ttwu_local
     28174 =C2=B1  4%     -22.9%      21736 =C2=B1  6%  sched_debug.cpu#33.=
ttwu_count
     14459 =C2=B1  0%     -61.6%       5551 =C2=B1  3%  sched_debug.cpu#33.=
sched_goidle
     68385 =C2=B1 35%    +108.9%     142863 =C2=B1 28%  sched_debug.cpu#33.=
sched_count
     52218 =C2=B1  6%     -22.8%      40330 =C2=B1  6%  sched_debug.cpu#33.=
nr_switches
      8700 =C2=B1 22%     +50.0%      13053 =C2=B1 18%  sched_debug.cpu#34.=
ttwu_local
         7 =C2=B1 16%     -67.7%          2 =C2=B1 44%  sched_debug.cpu#34.=
nr_uninterruptible
     13774 =C2=B1  2%     -53.7%       6384 =C2=B1 27%  sched_debug.cpu#34.=
sched_goidle
     26797 =C2=B1 13%     -19.2%      21641 =C2=B1 11%  sched_debug.cpu#35.=
ttwu_count
     14146 =C2=B1  3%     -57.5%       6009 =C2=B1 17%  sched_debug.cpu#35.=
sched_goidle
      7914 =C2=B1 17%     +45.1%      11484 =C2=B1 18%  sched_debug.cpu#36.=
ttwu_local
     13245 =C2=B1  2%     -56.3%       5784 =C2=B1  7%  sched_debug.cpu#36.=
sched_goidle
     23746 =C2=B1  4%     -18.0%      19472 =C2=B1 10%  sched_debug.cpu#37.=
ttwu_count
      7664 =C2=B1  9%     +40.2%      10749 =C2=B1 11%  sched_debug.cpu#37.=
ttwu_local
     44625 =C2=B1  4%     -16.4%      37321 =C2=B1 11%  sched_debug.cpu#37.=
nr_switches
     13494 =C2=B1  1%     -58.5%       5599 =C2=B1  9%  sched_debug.cpu#37.=
sched_goidle
    429844 =C2=B1  8%     +25.0%     537498 =C2=B1  8%  sched_debug.cpu#37.=
avg_idle
      7505 =C2=B1 16%     +59.2%      11947 =C2=B1 11%  sched_debug.cpu#38.=
ttwu_local
     45998 =C2=B1  6%     -13.1%      39986 =C2=B1 10%  sched_debug.cpu#38.=
nr_switches
     24728 =C2=B1  3%     -14.8%      21070 =C2=B1  8%  sched_debug.cpu#38.=
ttwu_count
     13865 =C2=B1  2%     -57.6%       5873 =C2=B1 10%  sched_debug.cpu#38.=
sched_goidle
     49621 =C2=B1  4%     -23.5%      37979 =C2=B1 11%  sched_debug.cpu#39.=
nr_switches
    425023 =C2=B1  8%     +27.4%     541378 =C2=B1 10%  sched_debug.cpu#39.=
avg_idle
     26678 =C2=B1  4%     -25.2%      19946 =C2=B1 10%  sched_debug.cpu#39.=
ttwu_count
     13698 =C2=B1  3%     -58.2%       5732 =C2=B1 10%  sched_debug.cpu#39.=
sched_goidle
     10692 =C2=B1 14%     +72.7%      18467 =C2=B1 32%  sched_debug.cpu#4.t=
twu_local
    399860 =C2=B1  5%     +59.4%     637189 =C2=B1 36%  sched_debug.cpu#4.a=
vg_idle
     15247 =C2=B1  4%     -63.8%       5524 =C2=B1  5%  sched_debug.cpu#40.=
sched_goidle
     58412 =C2=B1  5%     -37.9%      36261 =C2=B1  3%  sched_debug.cpu#40.=
nr_switches
     12790 =C2=B1 10%     -18.7%      10399 =C2=B1  0%  sched_debug.cpu#40.=
ttwu_local
     31398 =C2=B1  6%     -37.8%      19529 =C2=B1  1%  sched_debug.cpu#40.=
ttwu_count
     28813 =C2=B1  7%     -26.4%      21206 =C2=B1 20%  sched_debug.cpu#41.=
ttwu_count
     53801 =C2=B1  4%     -27.0%      39260 =C2=B1 18%  sched_debug.cpu#41.=
nr_switches
     14952 =C2=B1  3%     -62.0%       5679 =C2=B1  4%  sched_debug.cpu#41.=
sched_goidle
    398784 =C2=B1  9%     +32.6%     528776 =C2=B1  2%  sched_debug.cpu#42.=
avg_idle
     14192 =C2=B1  6%     -59.1%       5802 =C2=B1  6%  sched_debug.cpu#42.=
sched_goidle
     15002 =C2=B1  8%     -61.9%       5709 =C2=B1  1%  sched_debug.cpu#43.=
sched_goidle
     57282 =C2=B1 13%     -26.1%      42309 =C2=B1 11%  sched_debug.cpu#43.=
nr_switches
     30549 =C2=B1 11%     -25.6%      22739 =C2=B1 13%  sched_debug.cpu#43.=
ttwu_count
     29674 =C2=B1  7%     -26.5%      21800 =C2=B1 19%  sched_debug.cpu#44.=
ttwu_count
     55957 =C2=B1  8%     -26.6%      41083 =C2=B1 18%  sched_debug.cpu#44.=
nr_switches
     15047 =C2=B1  7%     -61.1%       5850 =C2=B1 10%  sched_debug.cpu#44.=
sched_goidle
     56343 =C2=B1  5%     -28.1%      40482 =C2=B1 11%  sched_debug.cpu#45.=
nr_switches
     14790 =C2=B1  2%     -61.5%       5694 =C2=B1  4%  sched_debug.cpu#45.=
sched_goidle
     74020 =C2=B1 23%    +133.9%     173104 =C2=B1 47%  sched_debug.cpu#45.=
sched_count
     30632 =C2=B1  8%     -29.7%      21523 =C2=B1 11%  sched_debug.cpu#45.=
ttwu_count
     17383 =C2=B1 21%     -68.3%       5515 =C2=B1  7%  sched_debug.cpu#46.=
sched_goidle
     59635 =C2=B1  9%     -34.1%      39275 =C2=B1  9%  sched_debug.cpu#46.=
nr_switches
     31145 =C2=B1  7%     -31.8%      21244 =C2=B1  9%  sched_debug.cpu#46.=
ttwu_count
     14728 =C2=B1  6%     -63.6%       5366 =C2=B1  6%  sched_debug.cpu#47.=
sched_goidle
    384623 =C2=B1 15%     +33.5%     513355 =C2=B1 12%  sched_debug.cpu#47.=
avg_idle
     58628 =C2=B1 14%     -37.0%      36946 =C2=B1  9%  sched_debug.cpu#47.=
nr_switches
      4799 =C2=B1  5%     +11.1%       5330 =C2=B1  2%  sched_debug.cpu#47.=
curr->pid
     31854 =C2=B1 12%     -38.2%      19676 =C2=B1 10%  sched_debug.cpu#47.=
ttwu_count
     13661 =C2=B1  4%     -56.3%       5964 =C2=B1  9%  sched_debug.cpu#48.=
sched_goidle
     27955 =C2=B1 13%     -24.7%      21063 =C2=B1 21%  sched_debug.cpu#48.=
ttwu_count
     65384 =C2=B1 25%    +148.0%     162162 =C2=B1 37%  sched_debug.cpu#49.=
sched_count
     13513 =C2=B1  4%     -58.9%       5547 =C2=B1  4%  sched_debug.cpu#49.=
sched_goidle
     26250 =C2=B1 12%     -24.2%      19890 =C2=B1 17%  sched_debug.cpu#49.=
ttwu_count
     11129 =C2=B1 11%     +46.7%      16329 =C2=B1 21%  sched_debug.cpu#5.t=
twu_local
      4777 =C2=B1  8%     +12.1%       5357 =C2=B1  3%  sched_debug.cpu#5.c=
urr->pid
     15674 =C2=B1  5%     -55.6%       6958 =C2=B1  6%  sched_debug.cpu#5.s=
ched_goidle
    445710 =C2=B1  9%     +22.1%     544292 =C2=B1  3%  sched_debug.cpu#5.a=
vg_idle
    397088 =C2=B1  6%     +29.3%     513379 =C2=B1  5%  sched_debug.cpu#50.=
avg_idle
     83350 =C2=B1 46%    +136.0%     196712 =C2=B1 29%  sched_debug.cpu#50.=
sched_count
     13673 =C2=B1  3%     -57.1%       5867 =C2=B1  7%  sched_debug.cpu#50.=
sched_goidle
     13769 =C2=B1  3%     -61.1%       5361 =C2=B1  5%  sched_debug.cpu#51.=
sched_goidle
     26916 =C2=B1 16%     -22.0%      20992 =C2=B1 25%  sched_debug.cpu#51.=
ttwu_count
    419525 =C2=B1  7%     +23.7%     519140 =C2=B1  7%  sched_debug.cpu#51.=
avg_idle
    392838 =C2=B1  8%     +34.7%     529218 =C2=B1 10%  sched_debug.cpu#52.=
avg_idle
     13723 =C2=B1  3%     -58.1%       5754 =C2=B1  6%  sched_debug.cpu#52.=
sched_goidle
     25912 =C2=B1  9%     -23.8%      19757 =C2=B1 16%  sched_debug.cpu#52.=
ttwu_count
     47124 =C2=B1 10%     -20.6%      37422 =C2=B1 16%  sched_debug.cpu#52.=
nr_switches
        12 =C2=B1  3%     +16.3%         14 =C2=B1  3%  sched_debug.cpu#52.=
cpu_load[0]
     13895 =C2=B1  4%     -58.0%       5831 =C2=B1  7%  sched_debug.cpu#53.=
sched_goidle
    408375 =C2=B1  7%     +19.2%     486834 =C2=B1  2%  sched_debug.cpu#54.=
avg_idle
     13420 =C2=B1  4%     -57.1%       5762 =C2=B1  8%  sched_debug.cpu#54.=
sched_goidle
      4891 =C2=B1  2%      +9.3%       5348 =C2=B1  2%  sched_debug.cpu#55.=
curr->pid
    423900 =C2=B1  5%     +22.5%     519418 =C2=B1  9%  sched_debug.cpu#55.=
avg_idle
      7537 =C2=B1 16%     +58.4%      11940 =C2=B1 15%  sched_debug.cpu#55.=
ttwu_local
     13690 =C2=B1  1%     -58.9%       5626 =C2=B1  5%  sched_debug.cpu#55.=
sched_goidle
        13 =C2=B1  3%     +13.2%         15 =C2=B1  8%  sched_debug.cpu#56.=
cpu_load[3]
      8332 =C2=B1  5%     +58.4%      13198 =C2=B1 14%  sched_debug.cpu#56.=
ttwu_local
        13 =C2=B1  3%     +17.0%         15 =C2=B1 13%  sched_debug.cpu#56.=
cpu_load[2]
     13530 =C2=B1  1%     -55.3%       6043 =C2=B1 11%  sched_debug.cpu#56.=
sched_goidle
      7242 =C2=B1 11%     +83.5%      13289 =C2=B1  8%  sched_debug.cpu#57.=
ttwu_local
     13681 =C2=B1  3%     -57.2%       5860 =C2=B1  6%  sched_debug.cpu#57.=
sched_goidle
    395033 =C2=B1  7%     +27.1%     502216 =C2=B1 11%  sched_debug.cpu#58.=
avg_idle
      7445 =C2=B1 11%     +73.8%      12941 =C2=B1 18%  sched_debug.cpu#58.=
ttwu_local
     13251 =C2=B1  2%     -56.9%       5709 =C2=B1  6%  sched_debug.cpu#58.=
sched_goidle
     13591 =C2=B1  4%     -57.6%       5757 =C2=B1  6%  sched_debug.cpu#59.=
sched_goidle
     25456 =C2=B1  5%     -10.4%      22805 =C2=B1  3%  sched_debug.cpu#59.=
ttwu_count
      8178 =C2=B1 11%     +65.7%      13553 =C2=B1  5%  sched_debug.cpu#59.=
ttwu_local
     15776 =C2=B1  2%     -54.8%       7127 =C2=B1 13%  sched_debug.cpu#6.s=
ched_goidle
    395993 =C2=B1  8%     +60.6%     636010 =C2=B1 32%  sched_debug.cpu#6.a=
vg_idle
     13767 =C2=B1  2%     -58.8%       5672 =C2=B1 10%  sched_debug.cpu#60.=
sched_goidle
      8163 =C2=B1 12%     +68.0%      13717 =C2=B1 18%  sched_debug.cpu#60.=
ttwu_local
     13606 =C2=B1  5%     -56.3%       5947 =C2=B1  6%  sched_debug.cpu#61.=
sched_goidle
      6973 =C2=B1 18%    +120.9%      15401 =C2=B1 16%  sched_debug.cpu#61.=
ttwu_local
      6991 =C2=B1 12%    +115.0%      15032 =C2=B1 21%  sched_debug.cpu#62.=
ttwu_local
    424760 =C2=B1 15%     +22.2%     519074 =C2=B1  4%  sched_debug.cpu#62.=
avg_idle
     13755 =C2=B1  2%     -56.2%       6021 =C2=B1  6%  sched_debug.cpu#62.=
sched_goidle
     14696 =C2=B1 16%     -57.8%       6196 =C2=B1  8%  sched_debug.cpu#63.=
sched_goidle
     15675 =C2=B1  1%     -57.1%       6721 =C2=B1  7%  sched_debug.cpu#7.s=
ched_goidle
     18723 =C2=B1  4%     -51.8%       9026 =C2=B1  6%  sched_debug.cpu#8.s=
ched_goidle
    480682 =C2=B1 12%     +53.4%     737154 =C2=B1 46%  sched_debug.cpu#9.a=
vg_idle
     18604 =C2=B1  9%     -60.8%       7292 =C2=B1  7%  sched_debug.cpu#9.s=
ched_goidle

lkp-wsx02: Westmere-EX
Memory: 128G

lkp-nex04: Nehalem-EX
Memory: 256G

lituya: Grantley Haswell
Memory: 16G




                                   softirqs.SCHED

  8e+06 ++-----------------------------------------------------------------=
-+
        |                  O O O    O O  O                                 =
 |
  7e+06 O+O  O O O  O O O         O                                        =
 |
  6e+06 ++                                                                 =
 |
        |                                                                  =
 |
  5e+06 ++                                                                 =
 |
        |                                                                  =
 |
  4e+06 ++                                                                 =
 |
        |                                                                  =
 |
  3e+06 ++                                                                 =
 |
  2e+06 ++                                                                 =
 |
        |                                                                  =
 |
  1e+06 ++                                                                 =
 |
        *.*..*.*.*..*.*.*..*.*.  .*.*.    .*.. .*.*..*.*.*..*.*.  .*.*.*..*=
.*
      0 ++---------------------*------*--*----*-----------------*----------=
-+


                                cpuidle.C1E-NHM.time

  1e+08 ++-----------------------------------------------------------------=
-+
        |                                           .*                     =
 |
  9e+07 ++                                        *. :                     =
 |
  8e+07 *+  .*.*.*..*.*.*..*.*                    :   :                    =
 |
        | *.                 :                   :    :                    =
 |
  7e+07 ++                    :                  :     :   .*.             =
 |
  6e+07 ++                    :                 :      *.*.   *.  .*.      =
 |
        |                      : .*.*.*..*.*..*.*               *.   *.*..*=
.*
  5e+07 ++                     *.                                          =
 |
  4e+07 ++                                                                 =
 |
        |                                                                  =
 |
  3e+07 ++                                                                 =
 |
  2e+07 ++                 O        O                                      =
 |
        |      O O    O O    O O  O   O  O                                 =
 |
  1e+07 O+O--O------O------------------------------------------------------=
-+


                                cpuidle.C1E-NHM.usage

  400000 ++----------------------------------------------------------------=
-+
         |     .*.*..   .*.                        *.*                     =
 |
  350000 *+*..*       .*   *..*                   :   :                    =
 |
         |           *         :                  :   :                    =
 |
  300000 ++                    :                 :     :   .*.    .*.      =
 |
         |                      :                :     *..*   *.*.   *.*..*=
.|
  250000 ++                     *.*..*.*.*..*.*.*                          =
 *
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  150000 ++                                                                =
 |
         |                                                                 =
 |
  100000 ++              O O  O O O  O O O                                 =
 |
         O    O O O  O O                                                   =
 |
   50000 ++O---------------------------------------------------------------=
-+


                                  cpuidle.C3-NHM.time

  1.1e+09 ++-----------------------------------------*---------------------=
-+
          |                                        *  :                    =
 |
    1e+09 ++    .*.*.  .*.*.                       :   :                   =
 |
    9e+08 *+*..*     *.     *.*                   :    :   .*              =
 |
          |                    :                  :     *.*  +      .*.*..*=
.|
    8e+08 ++                    :  *.*..        .*            *.. .*       =
 *
    7e+08 ++                    : +     *.*.*.*.                 *         =
 |
          |                      *                                         =
 |
    6e+08 ++                                                               =
 |
    5e+08 ++                                                               =
 |
          |                                                                =
 |
    4e+08 ++                                                               =
 |
    3e+08 ++              O O O  O O O  O O                                =
 |
          |          O                                                     =
 |
    2e+08 O+O--O-O-O----O--------------------------------------------------=
-+


                                 cpuidle.C3-NHM.usage

  2.4e+06 ++-----------------------------------------*---------------------=
-+
  2.2e+06 ++                                       *  :                    =
 |
          *.  .*.*.*.  .*.*. .*                    :  :                    =
 |
    2e+06 ++*.       *.     *  :                  :    :                   =
 |
  1.8e+06 ++                   :                  :    : .*.*.    .*.      =
 |
          |                     :                :      *     *..*   *.*..*=
.*
  1.6e+06 ++                    : .*.*..*.*.*.*..*                         =
 |
  1.4e+06 ++                     *                                         =
 |
  1.2e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
   800000 ++                                                               =
 |
          |               O O O  O O O  O O                                =
 |
   600000 ++         O  O                                                  =
 |
   400000 O+O--O-O-O-------------------------------------------------------=
-+


                                 turbostat.Avg_MHz

  2360 ++------------------------------------------------------------------=
-+
  2340 ++O  O O  O   O                                                     =
 |
       O           O    O O      O  O                                      =
 |
  2320 ++                   O  O      O O                                  =
 |
  2300 ++                                                                  =
 |
  2280 ++                                                                  =
 |
  2260 ++                                                                  =
 |
       |                                                                   =
 |
  2240 ++                      *.           .*                             =
 |
  2220 ++                     :  *..*.*.*..*  +                .*.  .*.  .*=
.*
  2200 ++                     :                *..     *.*    *   *.   *.  =
 |
  2180 *+    .*.. .*.    .*. :                        +   + ..             =
 |
       | *..*    *   *..*   *                     *. +     *               =
 |
  2160 ++                                           *                      =
 |
  2140 ++------------------------------------------------------------------=
-+


                                 turbostat.%Busy

  99 ++O-------------------------------------------------------------------=
-+
     O    O O  O O  O                                                      =
 |
  98 ++                      O         O                                   =
 |
     |                O  O O    O O  O                                     =
 |
     |                                                                     =
 |
  97 ++                                                                    =
 |
     |                       *..                                           =
 |
  96 ++                      :      .*.*..*.*..                            =
 |
     |                      :   *.*.           *               .*.         =
.*
  95 ++                     :                   :     *.*.. .*.   *..*.*..*=
 |
     *.*..*.*..*.*..*.  .*.*                    :    :     *               =
 |
     |                *.                         :   :                     =
 |
  94 ++                                          *..*                      =
 |
     |                                                                     =
 |
  93 ++--------------------------------------------------------------------=
-+


                                 turbostat.CPU%c1

    5 ++-------------------------------------------------------------------=
-+
      |                                            .*                      =
 |
  4.5 ++                                         *.  :                     =
 |
    4 ++    .*..*. .*..*.                        :   :    .*..             =
 |
      *.*..*      *      *..*                   :     : .*                 =
 |
  3.5 ++                     :                  :     *.      *. .*..*.*..*=
.*
    3 ++                     :  .*.*.*..*.*..*.*                *          =
 |
      |                       *.                                           =
 |
  2.5 ++                                                                   =
 |
    2 ++                                                                   =
 |
      |                                                                    =
 |
  1.5 ++               O O  O O  O O O  O                                  =
 |
    1 ++                                                                   =
 |
      O O  O O  O O O                                                      =
 |
  0.5 ++-------------------------------------------------------------------=
-+


                                 turbostat.CPU%c3

  1.8 ++--------------------------------------------*----------------------=
-+
      |                                           ..:                      =
 |
  1.6 ++       .*. .*..*.                        *   :                     =
 |
      *.*..*.*.   *      *..*                    :   :                     =
 |
  1.4 ++                    :                   :    :     *..             =
 |
      |                      :                  :     :   +       *..      =
 |
  1.2 ++                     :                 :      *..*    *. +   *.*..*=
.*
      |                       : .*.*.*..*.*..*.*                *          =
 |
    1 ++                      *.                                           =
 |
      |                                                                    =
 |
  0.8 ++                                                                   =
 |
      |                                                                    =
 |
  0.6 ++               O O  O O  O O O  O                                  =
 |
      |           O O                                                      =
 |
  0.4 O+O--O-O--O----------------------------------------------------------=
-+


                       pigz.time.percent_of_cpu_this_job_got

  6350 ++O-----------------------------------------------------------------=
-+
       O    O O  O O O                                                     =
 |
  6300 ++                                                                  =
 |
  6250 ++               O O O  O O  O O O                                  =
 |
       |                                                                   =
 |
  6200 ++                                                                  =
 |
       |                                                                   =
 |
  6150 ++                      *       .*.. .*.                            =
 |
       |                      : +  .*.*    *   *               .*.         =
.*
  6100 ++                     :  *.             :      *.*    *   *..*.*..*=
 |
  6050 *+         .*.*.. .*. :                   :    :   + ..             =
 |
       | *..*.*..*      *   *                    :    :    *               =
 |
  6000 ++                                         *. :                     =
 |
       |                                            *                      =
 |
  5950 ++------------------------------------------------------------------=
-+


                         pigz.time.voluntary_context_switches

  4.4e+06 ++-----------------------------------------*---------------------=
-+
          *.*..*.*.*.  .*.*. .*                    *  :                    =
 |
  4.2e+06 ++         *.     *  :                   :  :                    =
 |
          |                    :                  :    :                   =
 |
    4e+06 ++                    :                 :    :                   =
 |
  3.8e+06 ++                    :                :      *.*.*.    .*.      =
 |
          |                      :.*.*..*.*.*.*..*            *..*   *.*..*=
.|
  3.6e+06 ++                     *                                         =
 *
          |                                                                =
 |
  3.4e+06 ++                                                               =
 |
  3.2e+06 ++                                                               =
 |
          |                                                                =
 |
    3e+06 ++            O O O O  O O O  O O                                =
 |
          |          O                                                     =
 |
  2.8e+06 O+O--O-O-O-------------------------------------------------------=
-+


                        pigz.time.involuntary_context_switches

  2.2e+06 ++---------------------------------------------------------------=
-+
  2.1e+06 ++            O                                                  =
 |
          |          O           O        O                                =
 |
    2e+06 O+O  O O O      O O O    O O  O                                  =
 |
  1.9e+06 ++                                                               =
 |
  1.8e+06 ++                                                               =
 |
  1.7e+06 ++                                                               =
 |
          |                                                                =
 |
  1.6e+06 ++                                                               =
 |
  1.5e+06 ++                                                               =
 |
  1.4e+06 ++                                                               =
 |
  1.3e+06 *+*..        .*.   .*..*.    .*. .*.                             =
 |
          |    *.*.*.*.   *.*      *.*.   *   *..*.*.  .*.*.*.*..*. .*.*.. =
.*
  1.2e+06 ++                                         *.            *      *=
 |
  1.1e+06 ++---------------------------------------------------------------=
-+


                            time.voluntary_context_switches

  4.4e+06 ++-----------------------------------------*---------------------=
-+
          *.*..*.*.*.  .*.*. .*                    *  :                    =
 |
  4.2e+06 ++         *.     *  :                   :  :                    =
 |
          |                    :                  :    :                   =
 |
    4e+06 ++                    :                 :    :                   =
 |
  3.8e+06 ++                    :                :      *.*.*.    .*.      =
 |
          |                      :.*.*..*.*.*.*..*            *..*   *.*..*=
.|
  3.6e+06 ++                     *                                         =
 *
          |                                                                =
 |
  3.4e+06 ++                                                               =
 |
  3.2e+06 ++                                                               =
 |
          |                                                                =
 |
    3e+06 ++            O O O O  O O O  O O                                =
 |
          |          O                                                     =
 |
  2.8e+06 O+O--O-O-O-------------------------------------------------------=
-+


                           time.involuntary_context_switches

  2.2e+06 ++---------------------------------------------------------------=
-+
  2.1e+06 ++            O                                                  =
 |
          |          O           O        O                                =
 |
    2e+06 O+O  O O O      O O O    O O  O                                  =
 |
  1.9e+06 ++                                                               =
 |
  1.8e+06 ++                                                               =
 |
  1.7e+06 ++                                                               =
 |
          |                                                                =
 |
  1.6e+06 ++                                                               =
 |
  1.5e+06 ++                                                               =
 |
  1.4e+06 ++                                                               =
 |
  1.3e+06 *+*..        .*.   .*..*.    .*. .*.                             =
 |
          |    *.*.*.*.   *.*      *.*.   *   *..*.*.  .*.*.*.*..*. .*.*.. =
.*
  1.2e+06 ++                                         *.            *      *=
 |
  1.1e+06 ++---------------------------------------------------------------=
-+


                                  vmstat.system.cs

  29000 ++-----------------------------------------------------------------=
-+
  28000 ++    .*.      .*..                       *..*                     =
 |
        *.*..*   *.. .*    *.*                    :  :                     =
 |
  27000 ++          *        :                   :    :                    =
 |
  26000 ++                    :                  :    :                    =
 |
  25000 ++                    :                  :     :   .*              =
 |
  24000 ++                    :                 :      *.*.  +    .*.      =
 |
        |                      : .*.*.*..*.*.. .*             *.*.   *.*..*=
.*
  23000 ++                     *.             *                            =
 |
  22000 ++                                                                 =
 |
  21000 ++                                                                 =
 |
  20000 ++              O  O O O  O O O  O                                 =
 |
        |           O O                                                    =
 |
  19000 O+   O O O                                                         =
 |
  18000 ++O----------------------------------------------------------------=
-+


                           sched_debug.cpu#0.sched_goidle

  35000 ++-----------------------------------------------------------------=
-+
        |                                            *                     =
 |
  30000 ++                                          ::                     =
 |
        |              .*..                         : :                    =
 |
        |             *                            :  :                    =
 |
  25000 ++  .*.*.*.. +     *.                     *   :                    =
 |
        *.*.        *        *                    :   :                    =
 |
  20000 ++                    :                  :     : *..*.*.           =
 |
        |                     :    .*.  .*.      :     :+       *..*.*.    =
.*
  15000 ++                     *..*   *.   *..*.*      *               *..*=
 |
        |                                                                  =
 |
        |                                                                  =
 |
  10000 ++                 O        O                                      =
 |
        |      O    O   O    O O  O   O  O                                 =
 |
   5000 O+O--O---O----O----------------------------------------------------=
-+


                           sched_debug.cpu#1.sched_goidle

  30000 ++-------------------------------------------*---------------------=
-+
        |    *        *.                           ..:                     =
 |
  25000 ++  + +      :  *..                       *   :                    =
 |
        *. +   *.*.. :     *.*                    :   :                    =
 |
        | *         *         :                  :     :.*..               =
 |
  20000 ++                    :         .*.*..*. :     *    *.    .*.      =
 |
        |                      : .*.*.*.        *             *.*.   *.*.. =
.*
  15000 ++                     *.                                         *=
 |
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        |                  O        O                                      =
 |
        |             O O    O O  O   O  O                                 =
 |
   5000 O+O  O O O  O                                                      =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#2.sched_goidle

  30000 ++-----------------------------------------------------------------=
-+
        |                                            *                     =
 |
  25000 ++                                         ..:                     =
 |
        *.*..*.      .*.*..*.                     *   :                    =
 |
        |      *.*..*        *                    :   :                    =
 |
  20000 ++                    :                  :     :.*..*.*.           =
 |
        |                     :         .*.*..*. :     *        *..*.*.*..*=
.*
  15000 ++                     *..*.*.*.        *                          =
 |
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        |               O  O      O O                                      =
 |
        |      O O    O      O O      O  O                                 =
 |
   5000 O+O  O      O                                                      =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#3.sched_goidle

  30000 ++-----------------------------------------------------------------=
-+
        |                                            *                     =
 |
  25000 ++       *..                               ..:                     =
 |
        *.      +    .*.                          *   :                    =
 |
        | *..*.*    *   *..*.*                   :    :                    =
 |
  20000 ++                    :                  :     :   .*.             =
 |
        |                     :         .*.*.. .*      *.*.   *.*..*. .*..*=
.|
  15000 ++                     *..*.*.*.      *                      *     =
 *
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        |                  O        O                                      =
 |
        |               O    O O  O   O  O                                 =
 |
   5000 O+O  O O O  O O                                                    =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#5.sched_goidle

  30000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  25000 ++                                           *                     =
 |
        |     .*.*..  *.*..                        ..:                     =
 |
        *.*..*       +     *.                     *   :                    =
 |
  20000 ++          *        *                   :    :    .*.             =
 |
        |                     +  .*.    .*.  .*. :     :.*.   *.  .*.      =
.*
  15000 ++                     *.   *.*.   *.   *      *        *.   *.*..*=
 |
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        |                  O        O                                      =
 |
        |               O    O O  O   O  O                                 =
 |
   5000 O+O  O O O  O O                                                    =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#7.sched_goidle

  30000 ++-----------------------------------------------------------------=
-+
        |                                            *                     =
 |
  25000 ++              *..                         +:                     =
 |
        |      *.      +                           +  :                    =
 |
        *.*.. +  *..*.*    *.*                    *   :                    =
 |
  20000 ++   *                :                  :    :    .*.             =
 |
        |                     :         .*.*..   :     :.*.   *.*..*.      =
 |
  15000 ++                     : .*.*.*.      *.*      *             *.*..*=
.*
        |                      *.                                          =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
        |    O          O  O O O  O O O  O                                 =
 |
   5000 O+O    O O  O O                                                    =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#9.sched_goidle

  30000 ++-----------------------------------------------------------------=
-+
        *        *                                                         =
 |
  25000 ++      : +                                                        =
 |
        | *..   :  +      .*.*                    *..*                     =
 |
        |    *.*    *.*.*.    :               *  :    +                *.. =
 |
  20000 ++                    :    .*.*..   .. + :     *.    .*.      +   *=
.|
        |                      *..*       .*    *        *..*   *..*.*     =
 *
  15000 ++                               *                                 =
 |
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        O      O      O O    O    O   O                                    =
 |
        | O      O  O      O   O    O    O                                 =
 |
   5000 ++   O                                                             =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#10.sched_goidle

  30000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  25000 ++       *..                                                       =
 |
        *.      +      .*..                         .*                     =
 |
        | *.. .*    *.*     .*                    *.  :                *.. =
 |
  20000 ++   *             *  +                  :    :    .*   *..*. +    =
.*
        |                      *.. .*.  .*.*..   :     *.*.  + +     *    *=
 |
  15000 ++                        *   *.      *.*             *            =
 |
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        O           O   O    O O  O   O  O                                 =
 |
        |    O O           O        O                                      =
 |
   5000 ++O      O    O                                                    =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#11.sched_goidle

  30000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  25000 ++       *..                                                       =
 |
        *       +                                                          =
 |
        |+  .*.*    *.*.*..*.*                    *..*                 *.. =
 |
  20000 ++*.                  :       *..        :    +    .*.        +    =
 |
        |                     :      +    .*..   :     *.*.   *.*..*.*    *=
.*
  15000 ++                     *..*.*    *    *.*                          =
 |
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        |               O  O O O  O O O  O                                 =
 |
        O      O    O                                                      =
 |
   5000 ++O  O   O    O                                                    =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#12.sched_goidle

  25000 ++-------*---------------------------------------------------------=
-+
        *.      + +   *.                                                   =
 |
        | *..*.*   + +  *..*.                     *..*                     =
 |
  20000 ++          *        *                   :    :                  .*=
 |
        |                     :      .*..        :    :    .*     .*. .*.  =
+|
        |                     :    .*     .*.. .*      *.*.  + .*.   *     =
 *
  15000 ++                     *..*      *    *               *            =
 |
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
        |               O  O O O  O O O  O                                 =
 |
   5000 O+       O  O O                                                    =
 |
        | O  O O                                                           =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#13.sched_goidle

  25000 *+-----------------------------------------------------------------=
-+
        |+      .*..                                                       =
 |
        | *.. .*          .*.*                    *..*                     =
 |
  20000 ++   *      *.*.*.    :                  :    :                    =
 |
        |                     :                  :    : .*..      .*. .*..*=
.|
        |                      : .*.*.*.. .*.. .*      *    *. .*.   *     =
 *
  15000 ++                     *.        *    *               *            =
 |
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
        |               O  O O O  O O O  O                                 =
 |
   5000 O+     O O  O O                                                    =
 |
        | O  O                                                             =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#14.sched_goidle

  30000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  25000 *+              *..                                                =
 |
        |+       *..   :                                                   =
 |
        | *..*. +      :   *.*                    *..*.                    =
 |
  20000 ++     *    *.*       :                  :     *.           .*.*..*=
.|
        |                     :  .*. .*..        :       *..      .*       =
 *
  15000 ++                     *.   *    *.*..*.*           *.*.*.         =
 |
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
        |        O    O O  O O O  O O O  O                                 =
 |
   5000 O+O  O O    O                                                      =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#15.sched_goidle

  25000 ++-------*---------------------------------------------------------=
-+
        *.      : +                               *..*                     =
 |
        | *..*. :  +      .*.*        *           :   +                    =
 |
  20000 ++     *    *.*.*.    :      : +         :     *          .*   *.. =
 |
        |                     :      :  +        :      +  .*   *.  + +   *=
.|
        |                      : .*.*    *.*..*.*        *.  + +     *     =
 *
  15000 ++                     *.                             *            =
 |
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
        |               O  O O O  O O O  O                                 =
 |
   5000 ++     O O  O O                                                    =
 |
        O O  O                                                             =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#17.sched_goidle

  30000 ++-----------------------------------------------------------------=
-+
        |      *                                                           =
 |
  25000 ++    : :                                                          =
 |
        |.*.. : :                                .*..*                     =
 |
        *    *   *..*.*.*..*.*                  *     :                    =
 |
  20000 ++                    :           .*.. :      :           .*.      =
 |
        |                     :  .*.    .*     :       *.*..*.*.*.   *.  .*=
.|
  15000 ++                     *.   *.*.      *                        *.  =
 *
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
        |               O  O O O  O O O  O                                 =
 |
   5000 O+O  O O O  O O                                                    =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#18.sched_goidle

  25000 ++*----*-----------------------------------------------------------=
-+
        |:    + +         .*.                     *..*                     =
 |
        |:   *   *.. .*.*.   *                    :   :                    =
 |
  20000 *+          *         :                  :    :    .*.             =
 |
        |                     :   *.      .*..   :     :.*.   *.*..*.*     =
 |
        |                      :..  *.  .*    *.*      *              +  .*=
.|
  15000 ++                     *      *.                               *.  =
 *
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
        |                  O O O    O O  O                                 =
 |
   5000 ++   O O O  O O O         O                                        =
 |
        O O                                                                =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#19.sched_goidle

  30000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  25000 ++     *                                  *..                      =
 |
        |.*.. + +          *.                     :  *                     =
 |
        *    *   *.. .*. ..  *                   :    :      .*.           =
 |
  20000 ++          *   *     :                  :    :    .*   *..        =
 |
        |                     :         .*.     :      *.*.        *.*.  .*=
.|
  15000 ++                     *..*.*.*.   *..*.*                      *.  =
 *
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
        |             O O  O O O  O O O  O                                 =
 |
   5000 O+O  O O O  O                                                      =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#20.sched_goidle

  25000 ++*----*-------------*---------------------------------------------=
-+
        |+ +  : +     *.  .* :                    *..*                     =
 |
        *   + :  *.. +  *.    :                   :   :                    =
 |
  20000 ++   *      *         :                  :    :    .*. .*..*.      =
 |
        |                     :                  :     *.*.   *      *     =
 |
        |                      : .*.*.*..*.*.. .*                     +  .*=
.*
  15000 ++                     *.             *                        *.  =
 |
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
        |                  O O O    O O  O                                 =
 |
   5000 O+     O O  O O O         O                                        =
 |
        | O  O                                                             =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#21.sched_goidle

  30000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  25000 ++     *                                                           =
 |
        | *.. + +          *.                     *..                      =
 |
        |+   *   *.. .*. ..  *                    :  *                     =
 |
  20000 *+          *   *     :                  :    +      .*.           =
 |
        |                     :                  :     *.*..*   *..*.     *=
.|
  15000 ++                     *..*.*.*..*.*..*.*                    *. .. =
 *
        |                                                              *   =
 |
  10000 ++                                                                 =
 |
        |                      O         O                                 =
 |
        |               O  O O    O O O                                    =
 |
   5000 O+O  O O O  O O                                                    =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#22.sched_goidle

  25000 ++----------------------------------------*------------------------=
-+
        |.*.. .*.         .*.                     :  *                     =
 |
        *    *   *..*.*.*.   *                   :    :                    =
 |
  20000 ++                    :                  :    :         *..*.      =
 |
        |                     :                  :     :.*..*. +     *     =
 |
        |                      *..*.*.*..*.     :      *      *       +  .*=
.|
  15000 ++                                 *..*.*                      *.  =
 *
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
        |                  O O O    O O  O                                 =
 |
   5000 O+     O O  O O O         O                                        =
 |
        | O  O                                                             =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#23.sched_goidle

  30000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  25000 ++*..               .*                                             =
 |
        |+    .*.         .* :                    *..*                     =
 |
        *    *   *.. .*.*.    :                   :   :                    =
 |
  20000 ++          *         :                  :    :    .*.    .*.      =
 |
        |                      :   .*.           :     *.*.   *.*.   *.  .*=
.|
  15000 ++                     *..*   *..*.*..*.*                      *.  =
 *
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
        |               O  O O O  O O O  O                                 =
 |
   5000 O+O  O O O  O O                                                    =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#27.sched_goidle

  25000 ++-----------------------------------------------------------------=
-+
        |    *.                                   *..*                     =
 |
        |  ..  *.*..*.*.*.. .*                    :  :                     =
 |
  20000 *+*                *  :                  :    :    .*              =
 |
        |                     :    .*     .*..   :    :  *.  +    .*       =
 |
        |                      *..*  +  .*     .*      :+     *.*.  + .*..*=
.*
  15000 ++                            *.      *        *             *     =
 |
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
        |               O  O O O  O O O  O                                 =
 |
   5000 O+   O O O    O                                                    =
 |
        | O         O                                                      =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#28.sched_goidle

  30000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  25000 ++                                        *..                      =
 |
        |                    *                    :  *                     =
 |
        *.*..*.*.*.. .*.    +:                   :    :     *              =
 |
  20000 ++          *   *..*  :                  :    :   .. +             =
 |
        |                     :    .*     .*..  :      :.*    *.  .*.      =
 |
  15000 ++                     : .*  +  .*     .*      *        *.   *.*..*=
.*
        |                      *.     *.      *                            =
 |
  10000 ++                                                                 =
 |
        |                    O        O                                    =
 |
        |               O  O   O  O O    O                                 =
 |
   5000 O+O  O O O  O O                                                    =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#29.sched_goidle

  24000 ++---*---------------*---------------------------------------------=
-+
  22000 ++  +  *.           +:                    *..*                     =
 |
        *. +     *..      .*  :                   :  :                     =
 |
  20000 ++*         *.*.*.    :                  :    :    .*              =
 |
  18000 ++                    :                  :    :  *.  +             =
 |
        |                     :    .*.     *..  *      :+     *.  .*       =
 |
  16000 ++                     : .*   *.. +    +       *        *.  + .*..*=
.*
  14000 ++                     *.        *    *                      *     =
 |
  12000 ++                                                                 =
 |
        |                                                                  =
 |
  10000 ++                                                                 =
 |
   8000 ++                   O        O                                    =
 |
        |               O  O   O  O O    O                                 =
 |
   6000 ++                                                                 =
 |
   4000 O+O--O-O-O--O-O----------------------------------------------------=
-+


                           sched_debug.cpu#30.sched_goidle

  30000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  25000 ++                                        *..                      =
 |
        |    *.                                   :  *                     =
 |
        *. ..  *.*..*.*.*.. .*                   :    :    .*              =
 |
  20000 ++*                *  :                  :    :  *.  +             =
 |
        |                     :    .*.    .*.. .*      :+     *.  .*.    .*=
.|
  15000 ++                     *..*   *..*    *        *        *.   *.*.  =
 *
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        |                    O        O                                    =
 |
        |               O  O   O  O O    O                                 =
 |
   5000 O+O  O O O  O O                                                    =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#32.sched_goidle

  24000 ++-----------------------------------------------------------------=
-+
  22000 ++                                           *                     =
 |
        |             *.*..                        ..:                     =
 |
  20000 ++*..*.*.*.. +     *.*                    *   :                    =
 |
  18000 *+          *         :                   :   :                    =
 |
  16000 ++                    :                  :    :    .*.    .*       =
 |
  14000 ++                     : .*.    .*.*..   :     :.*.   *.*.  +      =
.*
        |                      *.   *.*.       .*      *             *.*..*=
 |
  12000 ++                                    *                            =
 |
  10000 ++                                                                 =
 |
   8000 ++                                                                 =
 |
   6000 ++                 O        O                                      =
 |
        | O         O   O    O O  O   O  O                                 =
 |
   4000 O+   O O O    O                                                    =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#33.sched_goidle

  24000 ++-----------------------------------------------------------------=
-+
  22000 ++                                           *                     =
 |
        *              .*.. .*                     ..:                     =
 |
  20000 ++  .*.*.*.. .*    * :                    *   :                    =
 |
  18000 ++*.        *         :                   :   :                    =
 |
  16000 ++                    :                  :     :.*.. .*    *.      =
 |
  14000 ++                     :   .*.  .*.*..   :     *    *  + ..  *.*..*=
.*
        |                      *..*   *.      *.*               *          =
 |
  12000 ++                                                                 =
 |
  10000 ++                                                                 =
 |
   8000 ++                                                                 =
 |
   6000 ++                                                                 =
 |
        |               O  O O O  O O O  O                                 =
 |
   4000 O+O  O O O  O O                                                    =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#36.sched_goidle

  24000 ++-------------------------------------------*---------------------=
-+
  22000 ++                 *                        +:                     =
 |
        |                .. +                      +  :                    =
 |
  20000 *+  .*.*.*..   .*    *                    *   :                    =
 |
  18000 ++*.        *.*       :                   :   :                    =
 |
  16000 ++                    :                  :     :   .*.*.           =
 |
  14000 ++                     :        .*.*..   :     *.*.     *..*.      =
.*
        |                      *..*.*.*.      *.*                    *.*..*=
 |
  12000 ++                                                                 =
 |
  10000 ++                                                                 =
 |
   8000 ++                                                                 =
 |
   6000 ++                 O        O                                      =
 |
        |        O      O    O O  O   O  O                                 =
 |
   4000 O+O  O O    O O                                                    =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#37.sched_goidle

  22000 ++-------------------------------------------*---------------------=
-+
  20000 ++              *..                        ..:                     =
 |
        *.*..*.*.*..   +                          *   :                    =
 |
  18000 ++          *.*    *.*                    :   :     *.             =
 |
  16000 ++                    :                  :    :   ..  *    *       =
 |
        |                     :                  :     :.*     + .. +      =
 |
  14000 ++                     : .*.*.*..*.*..*.*      *        *    *.*..*=
.*
  12000 ++                     *.                                          =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   6000 ++                 O        O                                      =
 |
        |           O O O    O O  O   O  O                                 =
 |
   4000 O+O  O O O                                                         =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#38.sched_goidle

  25000 ++-----------------------------------------------------------------=
-+
        |                                            *                     =
 |
        |                                          ..:                     =
 |
  20000 *+  .*.*.*.. .*.*..*.*                    *   :                    =
 |
        | *.        *         :                  :    :                    =
 |
        |                     :                  :     :                   =
 |
  15000 ++                     :   .*.  .*.*.. .*      *.*..*.*.*..*.*.*..*=
.*
        |                      *..*   *.      *                            =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
        |                  O        O                                      =
 |
   5000 ++              O    O O  O   O  O                                 =
 |
        O O  O O O  O O                                                    =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#39.sched_goidle

  22000 ++-------------------------------------------*---------------------=
-+
  20000 ++              *..                        ..:                     =
 |
        *.    .*.*..   +   *.*                    *   :                    =
 |
  18000 ++*..*      *.*      :                    :   :                    =
 |
  16000 ++                    :                  :    :    .*.             =
 |
        |                     :         .*.      :     :.*.   *.*..*.    .*=
.|
  14000 ++                     : .*.*.*.   *..*.*      *             *.*.  =
 *
  12000 ++                     *.                                          =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   6000 ++                 O O      O O                                    =
 |
        |    O      O   O      O  O      O                                 =
 |
   4000 O+O    O O    O                                                    =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#40.sched_goidle

  22000 *+-----------------------------------------------------------------=
-+
  20000 ++  .*.                                   *..                      =
 |
        | *.   *.*..                              :  *                     =
 |
  18000 ++           .*.*..*.*                   :    :                    =
 |
  16000 ++          *         :                  :    :    .*            .*=
.|
        |                     :      .*..      .*      *.*.  + .*..*.*.*.  =
 *
  14000 ++                     : .*.*    *.*..*               *            =
 |
  12000 ++                     *.                                          =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   6000 ++                   O        O                                    =
 |
        O      O O  O O O  O   O  O O    O                                 =
 |
   4000 ++O  O                                                             =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#41.sched_goidle

  22000 *+-----------------------------------------------------------------=
-+
  20000 ++      .*..                                                       =
 |
        | *..*.*       .*..*.                     *..*                     =
 |
  18000 ++          *.*      *                    :   +                    =
 |
  16000 ++                    :                  :     *.*..*              =
 |
        |                     :    .*.    .*..*. :           + .*..*.*.*..*=
.|
  14000 ++                     *..*   *..*      *             *            =
 *
  12000 ++                                                                 =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   6000 ++                 O O      O O                                    =
 |
        |             O O      O  O      O                                 =
 |
   4000 O+O  O O O  O                                                      =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#42.sched_goidle

  22000 ++-----------------------------------------------------------------=
-+
  20000 *+     *.*      *..                                                =
 |
        |+    +   +    +    .*                    *..*                     =
 |
  18000 ++*..*     + .*    * :                    :   :                    =
 |
  16000 ++          *         :                  :    :                    =
 |
        |                     :      .*..*.*..   :     :.*..*. .*..*. .*..*=
.|
  14000 ++                     : .*.*         *.*      *      *      *     =
 *
  12000 ++                     *.                                          =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   6000 ++              O  O O    O O O                                    =
 |
        O      O    O O        O         O                                 =
 |
   4000 ++O  O   O                                                         =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#43.sched_goidle

  22000 ++-----------------------------------------------------------------=
-+
  20000 *+                                        *..                      =
 |
        | *.. .*.*.. .*.  .*.                     :  *                     =
 |
  18000 ++   *      *   *.   *                   :    :                *.. =
 |
  16000 ++                    :                  :    :  *..*.        +    =
 |
        |                     :    .*.  .*.*..  :      :+     *.  .*.*    *=
.|
  14000 ++                     : .*   *.      *.*      *        *.         =
 *
  12000 ++                     *.                                          =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   6000 ++              O  O O O  O O O  O                                 =
 |
        |           O O                                                    =
 |
   4000 O+O  O O O                                                         =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#44.sched_goidle

  22000 ++-------*---------------------------------------------------------=
-+
  20000 *+      + :                                                        =
 |
        | *.. .*   :  *.                          *..*                     =
 |
  18000 ++   *     : +  *..*.*                    :   :                    =
 |
  16000 ++          *         :                  :    : .*..          .*..*=
 |
        |                     :  .*.*.           :     *    *. .*..*.*     =
+|
  14000 ++                     *.     *.. .*..*.*             *            =
 *
  12000 ++                               *                                 =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   6000 ++              O  O O    O O O                                    =
 |
        O      O O    O        O         O                                 =
 |
   4000 ++O  O      O                                                      =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#45.sched_goidle

  22000 ++-----------------------------------------------------------------=
-+
  20000 ++       *                                *..                      =
 |
        *.      + +       .*.                     :                        =
 |
  18000 ++*..*.*   + .*.*.   *                   :   *                     =
 |
  16000 ++          *         :                  :    :                    =
 |
        |                     :            *..  :     : .*..*.*.  .*.*.*..*=
.*
  14000 ++                     *..*.*.*.. +   *.*      *        *.         =
 |
  12000 ++                               *                                 =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   6000 ++              O  O O    O O O                                    =
 |
        |      O    O O        O         O                                 =
 |
   4000 O+O  O   O                                                         =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#47.sched_goidle

  24000 ++-----------------------------------------------------------------=
-+
  22000 ++       *                                                         =
 |
        |       : +                               *..                      =
 |
  20000 *+*..   :  +      .*.                     :  *          *          =
 |
  18000 ++   *.*    *.*.*.   *                   :    :        : +         =
 |
  16000 ++                    :                  :    :        :  +   .*.. =
 |
  14000 ++                    :    .*.*..*.    .*      *.*..*.*    *.*    *=
.|
        |                      *..*        *..*                            =
 *
  12000 ++                                                                 =
 |
  10000 ++                                                                 =
 |
   8000 ++                                                                 =
 |
   6000 ++                                                                 =
 |
        |      O      O O  O O O  O O O  O                                 =
 |
   4000 O+O  O   O  O                                                      =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#48.sched_goidle

  24000 ++-----------------------------------------------------------------=
-+
  22000 ++                 *                                               =
 |
        |     .*.         + +                       .*                     =
 |
  20000 *+*..*   *.. .*. +   *                    *.  :                    =
 |
  18000 ++          *   *     :                  :    :                    =
 |
  16000 ++                    :         .*       :     *.  .*.    .*.      =
 |
  14000 ++                     *..*.*.*.  +    .*        *.   *.*.   *.  .*=
.|
        |                                  *..*                        *.  =
 *
  12000 ++                                                                 =
 |
  10000 ++                                                                 =
 |
   8000 ++                                                                 =
 |
   6000 ++                 O O O    O O  O                                 =
 |
        O               O         O                                        =
 |
   4000 ++O  O O O  O O                                                    =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#49.sched_goidle

  22000 ++-----------------------------------------------------------------=
-+
  20000 ++*..  *.                                 *..*                     =
 |
        |+    +  *..   .*..*.*                    :   :                    =
 |
  18000 *+   *      *.*       :                  :    :                    =
 |
  16000 ++                    :                  :     :   .*.             =
 |
        |                      :     .*..       :      *.*.   *.*..*.*.    =
 |
  14000 ++                     *..*.*    *.*..*.*                      *..*=
.|
  12000 ++                                                                 =
 *
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   6000 ++                 O O O    O O  O                                 =
 |
        |           O O O         O                                        =
 |
   4000 O+O  O O O                                                         =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#50.sched_goidle

  22000 ++-----------------------------------------------------------------=
-+
  20000 ++*..  *.                                 *..*                     =
 |
        |+    +  *.. .*.*..*.*                    :   :                    =
 |
  18000 *+   *      *         :                  :    :                    =
 |
  16000 ++                    :            *     :     :   .*.*.  .*.      =
 |
        |                      : .*.*.*.. : +   :      *.*.     *.   *.    =
 |
  14000 ++                     *.         :  + .*                      *..*=
.*
  12000 ++                               *    *                            =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   6000 ++                 O O O    O O  O                                 =
 |
        |           O O O         O                                        =
 |
   4000 O+O  O O O                                                         =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#51.sched_goidle

  22000 ++-----------------------------------------------------------------=
-+
  20000 *+*.. .*           *.*                    *..*                     =
 |
        |    *  +        ..  :                    :   :                    =
 |
  18000 ++       *..*.*.*     :                  :    :                    =
 |
  16000 ++                    :                  :     :   .*.    .*.      =
 |
        |                      :        .*.     :      *.*.   *.*.   *.  .*=
.|
  14000 ++                     *..*.*.*.   *.. .*                      *.  =
 *
  12000 ++                                    *                            =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   6000 ++                     O         O                                 =
 |
        |             O O  O O    O O O                                    =
 |
   4000 O+O  O O O  O                                                      =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#52.sched_goidle

  22000 ++-----------------------------------------------------------------=
-+
  20000 ++                  .*                      .*                     =
 |
        |.*.. .*.     *.*..* :                    *.  :                    =
 |
  18000 *+   *   *.. +        :                  :    :     *              =
 |
  16000 ++          *         :                  :     :  .. +     *       =
 |
        |                      :     .*..*.     *      *.*    *. .. +    .*=
.|
  14000 ++                     *..*.*      *.. +                *    *.*.  =
 *
  12000 ++                                    *                            =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   6000 ++                 O   O    O    O                                 =
 |
        |             O O    O    O   O                                    =
 |
   4000 O+O  O O O  O                                                      =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#53.sched_goidle

  25000 ++-----------------------------------------------------------------=
-+
        |                  *                                               =
 |
        |      *          + :                                              =
 |
  20000 *+*.. + +        +  :                     *..*                     =
 |
        |    *   *..*.*.*    *                   :    :                    =
 |
        |                     :                  :    : .*..*.*.*..*.      =
 |
  15000 ++                    :  .*.*.  .*.*..*.*      *             *.*..*=
.|
        |                      *.     *.                                   =
 *
  10000 ++                                                                 =
 |
        |                                                                  =
 |
        |                  O        O                                      =
 |
   5000 ++            O O    O O  O   O  O                                 =
 |
        O O  O O O  O                                                      =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#54.sched_goidle

  24000 ++-----------------------------------------------------------------=
-+
  22000 ++                                                         *       =
 |
        |.*..              *                      *..*            ::       =
 |
  20000 *+   *.*.        .. +                     :   :           : :      =
 |
  18000 ++       *..*.*.*    *                   :    :          :  :      =
 |
  16000 ++                    :                  :     :         :   :     =
 |
  14000 ++                    :  .*.*.          :      *.*..*.*.*    *.    =
 |
        |                      *.     *..*.*..*.*                      *..*=
.*
  12000 ++                                                                 =
 |
  10000 ++                                                                 =
 |
   8000 ++                                                                 =
 |
   6000 ++                 O   O    O    O                                 =
 |
        |               O    O    O   O                                    =
 |
   4000 O+O  O O O  O O                                                    =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#55.sched_goidle

  22000 ++-----*-----------------------------------------------------------=
-+
  20000 ++    : +                                 *..                      =
 |
        |.*.. :  *..*.    .*.*                    :  *                     =
 |
  18000 *+   *        *.*.    :                  :    :                    =
 |
  16000 ++                    :                  :    :    .*. .*..*       =
 |
        |                      : .*.    .*.     :      *.*.   *     +      =
 |
  14000 ++                     *.   *.*.   *.. .*                    *.*..*=
.*
  12000 ++                                    *                            =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   6000 ++                   O O      O  O                                 =
 |
        O             O O  O      O O                                      =
 |
   4000 ++O  O O O  O                                                      =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#56.sched_goidle

  22000 ++----------------------------------------*------------------------=
-+
  20000 ++                                        :                        =
 |
        |   .*.*.*.. .*.*.. .*                   :   *                     =
 |
  18000 *+*.        *      *  :                  :    :                    =
 |
  16000 ++                    :    .*      *    :     :    .*.             =
 |
        |                      : .*  +    + +   *      :.*.   *.  .*.      =
 |
  14000 ++                     *.     *..*   + +       *        *.   *.*..*=
.*
  12000 ++                                    *                            =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   6000 ++              O  O O    O O O                                    =
 |
        |    O   O    O        O         O                                 =
 |
   4000 O+O    O    O                                                      =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#57.sched_goidle

  22000 ++----------------------------------------*------------------------=
-+
  20000 ++   *                                    :  *                     =
 |
        *. .. +      .*.    .*                   :    :                    =
 |
  18000 ++*    *.*..*   *..* :                   :    :                    =
 |
  16000 ++                    :                 :      :.*..               =
 |
        |                     :    .*.    .*.. .*      *    *.*.  .*.    .*=
.|
  14000 ++                     : .*   *..*    *                 *.   *.*.  =
 *
  12000 ++                     *.                                          =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   6000 ++              O  O O    O O O                                    =
 |
        |      O               O         O                                 =
 |
   4000 O+O  O   O  O O                                                    =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#58.sched_goidle

  22000 ++-----------------------------------------------------------------=
-+
  20000 ++                                        *..                      =
 |
        |   .*.             .*                    :  *                     =
 |
  18000 *+*.   *.*..*.*.*..*  :                  :    :                    =
 |
  16000 ++                    :            *     :    :  *..*              =
 |
        |                      :   .*.    + +   *      :+    +    .*.      =
 |
  14000 ++                     *..*   *..*   + +       *      *.*.   *.*..*=
.*
  12000 ++                                    *                            =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   6000 ++                 O O      O O                                    =
 |
        |    O      O   O      O  O      O                                 =
 |
   4000 O+O    O O    O                                                    =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#59.sched_goidle

  22000 ++-------------------------------------------*---------------------=
-+
  20000 ++                                        *. :                     =
 |
        *.  .*. .*.. .*.    .*                   +    :                    =
 |
  18000 ++*.   *    *   *..* :                  *     :    .*              =
 |
  16000 ++                    :                 :     :  *.  +             =
 |
        |                     :    .*.  .*.    :       :+     *.  .*.    .*=
.|
  14000 ++                     : .*   *.   *.. :       *        *.   *.*.  =
 *
  12000 ++                     *.             *                            =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   6000 ++                 O O      O O                                    =
 |
        |      O      O O      O  O      O                                 =
 |
   4000 O+O  O   O  O                                                      =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#60.sched_goidle

  22000 ++-----------------------------------------------------------------=
-+
  20000 ++                                        *..*                     =
 |
        *.  .*.*.*.. .*.*.. .*                    :  :                     =
 |
  18000 ++*.        *      *  :                  :    :                    =
 |
  16000 ++                    :                  :    :    .*.             =
 |
        |                      :   .*     .*..  *      :.*.   *.  .*.      =
 |
  14000 ++                     *..*  +  .*     +       *        *.   *.*..*=
.*
  12000 ++                            *.      *                            =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   6000 ++                 O O      O O                                    =
 |
        |        O    O O      O  O      O                                 =
 |
   4000 O+O  O O    O                                                      =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#61.sched_goidle

  22000 ++-----------------------------------------------------------------=
-+
  20000 ++                                        *..*                     =
 |
        |   .*.*.*..   .*..                       :  :                     =
 |
  18000 *+*.        *.*    *.*                   :    :    .*              =
 |
  16000 ++                    :                  :    :  *.  :             =
 |
        |                     :    .*.*.. .*..  *      :+    :    .*     .*=
.|
  14000 ++                     : .*      *     +       *      *.*.  + .*.  =
 *
  12000 ++                     *.             *                      *     =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   6000 ++              O  O O    O O O                                    =
 |
        |             O        O         O                                 =
 |
   4000 O+O  O O O  O                                                      =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#62.sched_goidle

  22000 ++-----------------------------------------------------------------=
-+
  20000 ++                                        *..*                     =
 |
        *.    .*.                                 :  :                     =
 |
  18000 ++*..*   *..*.*.  .*.*                   :    :                    =
 |
  16000 ++              *.    :                  :    :  *..       *.      =
 |
        |                     :   *.*.    .*..  :      :+   *.*. ..  *.    =
 |
  14000 ++                     :..    *..*     .*      *        *      *..*=
.*
  12000 ++                     *              *                            =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   6000 ++              O  O O O  O O O  O                                 =
 |
        |             O                                                    =
 |
   4000 O+O  O O O  O                                                      =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#63.sched_goidle

  22000 ++-----------------------------------------------------------------=
-+
  20000 ++                                        *..*                     =
 |
        |   .*.*.*.. .*.*..*.                     :  :                     =
 *
  18000 *+*.        *        *                   :    :                    =
 |
  16000 ++                    :                  :    :  *..*.    .*       =
:|
        |                     :           .*..  *      :+     *.*.  +      =
:|
  14000 ++                     *..*.*.  .*     +       *             *.*..*=
 |
  12000 ++                            *.      *                            =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   6000 ++              O  O O O  O O O  O                                 =
 |
        |        O                                                         =
 |
   4000 O+O  O O    O O                                                    =
 |
   2000 ++-----------------------------------------------------------------=
-+


 perf-profile.cpu-cycles.irq_exit.smp_apic_timer_interrupt.apic_timer_inter=
rupt

  14 ++O-------------------------------------------------------------------=
-+
     O    O         O                                                      =
 |
  12 ++     O    O                                                         =
 |
     |         O                                                           =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
   8 ++                    O         O                                     =
 |
     |                O      O  O      O                                   =
 |
   6 ++                  O        O                                        =
 |
     |                                                                     =
 |
   4 ++                                                                    =
 |
     |                                                                     =
 |
   2 *+  .*.*..*.*..*.*..*.*.*..*.*..*.*..*.*..*.    .*.            .*.    =
 |
     | *.                                        *..*   *..*.*..*.*.   *..*=
.*
   0 ++--------------------------------------------------------------------=
-+




  14 ++--------------------------------------------------------------------=
-+
     | O            O                                                      =
 |
  12 O+   O                                                                =
 |
     |      O  O O                                                         =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
   8 ++                    O         O                                     =
 |
     |                O      O  O      O                                   =
 |
   6 ++                  O        O                                        =
 |
     |                                                                     =
 |
   4 ++                                                                    =
 |
     |                                                                     =
 |
   2 ++  .*.    .*..*.      .*..         .*.*..                            =
 |
     *.*.   *..*      *..*.*    *.*..*.*.      *.*..*.*.*..*.*..*.*..*.*..*=
.*
   0 ++--------------------------------------------------------------------=
-+




  12 ++--------------------------------------------------------------------=
-+
     | O  O         O                                                      =
 |
  10 O+     O                                                              =
 |
     |         O O                                                         =
 |
     |                                                                     =
 |
   8 ++                                                                    =
 |
     |                     O         O                                     =
 |
   6 ++               O      O  O      O                                   =
 |
     |                   O        O                                        =
 |
   4 ++                                                                    =
 |
     |                                                                     =
 |
     |                                                                     =
 |
   2 ++                                                                    =
 |
     |                                                                     =
 |
   0 *+*--*-*--*-*--*-*--*-*-*--*-*--*-*--*-*--*-*--*-*-*--*-*--*-*--*-*--*=
-*




  12 ++--------------------------------------------------------------------=
-+
     | O            O                                                      =
 |
  10 O+   O                                                                =
 |
     |      O  O O                                                         =
 |
     |                                                                     =
 |
   8 ++                                                                    =
 |
     |                     O         O                                     =
 |
   6 ++               O      O  O      O                                   =
 |
     |                   O        O                                        =
 |
   4 ++                                                                    =
 |
     |                                                                     =
 |
     |                                                                     =
 |
   2 ++                                                                    =
 |
     |                                                                     =
 |
   0 *+*--*-*--*-*--*-*--*-*-*--*-*--*-*--*-*--*-*--*-*-*--*-*--*-*--*-*--*=
-*




  9 ++O------------O-------------------------------------------------------=
-+
    O    O                                                                 =
 |
  8 ++     O  O O                                                          =
 |
  7 ++                                                                     =
 |
    |                                                                      =
 |
  6 ++                    O         O                                      =
 |
  5 ++               O         O                                           =
 |
    |                        O         O                                   =
 |
  4 ++                  O         O                                        =
 |
  3 ++                                                                     =
 |
    |                                                                      =
 |
  2 ++                                                                     =
 |
  1 ++                                                                     =
 |
    |                                      .*.*..                          =
 |
  0 *+*--*-*--*-*--*-*--*-*--*-*--*-*--*-*-------*-*--*-*--*-*--*-*--*-*--*=
-*




  7 ++---------------------------------------------------------------------=
-+
    | O            O                                                       =
 |
  6 O+   O O                                                               =
 |
    |         O                                                            =
 |
  5 ++          O                                                          =
 |
    |                                                                      =
 |
  4 ++                    O         O                                      =
 |
    |                O       O O       O                                   =
 |
  3 ++                  O         O                                        =
 |
    |                                                                      =
 |
  2 ++                                                                     =
 |
    |                                                                      =
 |
  1 ++                                                                     =
 |
    |                         .*..           .*..                          =
 |
  0 *+*--*-*--*-*--*-*--*-*--*----*-*--*-*--*----*-*--*-*--*-*--*-*--*-*--*=
-*




  1.4 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  1.2 ++O  O        O                                                      =
 |
      |      O  O O                                                        =
 |
    1 O+                                                                   =
 |
      |                O         O                                         =
 |
  0.8 ++                    O        O                                     =
 |
      |                       O         O                                  =
 |
  0.6 ++                 O         O                                       =
 |
      |                                                                    =
 |
  0.4 ++                                                                   =
 |
      |                                                                    =
 |
  0.2 ++                                                                   =
 |
      *.  .*.*..*.*.*..*.*..*.*..*.*.*..*.*..*.*.  .*.*.. .*..*.*.  .*.*..*=
.*
    0 ++*----------------------------------------*-------*--------*--------=
-+


                   kmsg.DHCP/BOOTP:Reply_not_for_us,op[#]xid[#]

    1 ++----------------*----------------------*-----------*---------------=
-*
      |                 :                      :           :               =
 |
      |                 :                      :           :               =
 |
  0.8 ++               ::                     : :         ::               =
:|
      |                : :                    : :         : :              =
:|
      |                : :                    : :         : :              =
:|
  0.6 ++               : :                    : :         : :              =
:|
      |                : :                    :  :        : :              =
:|
  0.4 ++              :  :                   :   :       :  :             :=
 |
      |               :  :                   :   :       :  :             :=
 |
      |               :  :                   :   :       :  :             :=
 |
  0.2 ++              :   :                  :   :       :   :            :=
 |
      |              :    :                 :     :     :    :           : =
 |
      |              :    :                 :     :     :    :           : =
 |
    0 *+-*--*--*--*--*----*--*--*--*--*--*--*-----*--*--*----*--*--*--*--*-=
-+




    1 ++-------------------------------------------------------------------=
-*
      |                                                                    =
 |
      |                                                                    =
:|
  0.8 ++                                                                   =
:|
      |                                                                   :=
 |
      |                                                                   :=
 |
  0.6 ++                                                                 : =
 |
      |                                                                  : =
 |
  0.4 ++                                                                :  =
 |
      |                                                                 :  =
 |
      |                                                                :   =
 |
  0.2 ++                                                               :   =
 |
      |                                                               :    =
 |
      |                                                               :    =
 |
    0 *+-----*------*------*------*------*------*------*------*------*-----=
-+

	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

	apt-get install ruby
	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
	cd lkp-tests
	bin/setup-local job.yaml # the job file attached in this email
	bin/run-local   job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
lkp

_______________________________________________
LKP mailing list
LKP(a)linux.intel.com

--===============4812479304146721158==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBwaWd6CmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJlLXRlc3QKICB1
cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAKICBudW1hLXZt
c3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1zdGF0OiAKICBt
ZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRl
bmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6
IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDog
CiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiAxMApkZWZhdWx0LXdhdGNo
ZG9nczoKICB3YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjogcGVyZm9y
bWFuY2UKY29tbWl0OiBhOGE5YmU0YjY4NjA1Y2Y2MmVlOWIwNDE0NzJhM2Q1YmJlYmViYzliCm1v
ZGVsOiBOZWhhbGVtLUVYCm1lbW9yeTogMjU2Rwpucl9zc2RfcGFydGl0aW9uczogNgpzc2RfcGFy
dGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtSU5URUxfU1NEKnBhcnQxIgpzd2FwX3BhcnRp
dGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLVdEQ19XRDEwRUFSUy0wMFk1QjFfV0QtV0NBVjVG
MDU5MDc0LXBhcnQyIgpwZXJmLXByb2ZpbGU6CiAgZnJlcTogODAwCm5yX3RocmVhZHM6IDEwMCUK
cGlnejoKICBibG9ja3NpemU6IDEyOEsKdGVzdGJveDogbGtwLW5leDA0CnRib3hfZ3JvdXA6IGxr
cC1uZXgwNAprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTUtMDQtMjMgMTA6
NTg6NTYuMzAxODIzNTg4ICswODowMApoZWFkX2NvbW1pdDogYThhOWJlNGI2ODYwNWNmNjJlZTli
MDQxNDcyYTNkNWJiZWJlYmM5YgpiYXNlX2NvbW1pdDogMzlhODgwNDQ1NWZiMjNmMDkxNTczNDFk
M2JhN2RiNmQ3YWU2ZWU3NgpicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE1MDQy
MzE0Cmtlcm5lbDogIi9rZXJuZWwveDg2XzY0LXJoZWwvYThhOWJlNGI2ODYwNWNmNjJlZTliMDQx
NDcyYTNkNWJiZWJlYmM5Yi92bWxpbnV6LTQuMC4wLTAxNjc1LWdhOGE5YmU0Igp1c2VyOiBsa3AK
cXVldWU6IGN5Y2xpYwpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKcmVzdWx0
X3Jvb3Q6ICIvcmVzdWx0L2xrcC1uZXgwNC9waWd6L3BlcmZvcm1hbmNlLTEwMCUtMTI4Sy9kZWJp
YW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2E4YTliZTRiNjg2MDVjZjYyZWU5
YjA0MTQ3MmEzZDViYmViZWJjOWIvMCIKTEtQX1NFUlZFUjogaW5uCmpvYl9maWxlOiAiL2xrcC9z
Y2hlZHVsZWQvbGtwLW5leDA0L2N5Y2xpY19waWd6LXBlcmZvcm1hbmNlLTEwMCUtMTI4Sy14ODZf
NjQtcmhlbC1IRUFELWE4YTliZTRiNjg2MDVjZjYyZWU5YjA0MTQ3MmEzZDViYmViZWJjOWItMC0y
MDE1MDQyMy05MzkwOC03M2ltb2QueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE1LTA0LTIzIDE2OjIy
OjEyLjA5NjUwODAxNCArMDg6MDAKbnJfY3B1OiAiJChucHJvYykiCmluaXRyZDogIi9vc2ltYWdl
L2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVyX2FwcGVuZDoK
LSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVkL2xrcC1uZXgw
NC9jeWNsaWNfcGlnei1wZXJmb3JtYW5jZS0xMDAlLTEyOEsteDg2XzY0LXJoZWwtSEVBRC1hOGE5
YmU0YjY4NjA1Y2Y2MmVlOWIwNDE0NzJhM2Q1YmJlYmViYzliLTAtMjAxNTA0MjMtOTM5MDgtNzNp
bW9kLnlhbWwKLSBBUkNIPXg4Nl82NAotIGtjb25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9bGlu
dXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUwNDIzMTQKLSBjb21taXQ9YThhOWJlNGI2ODYwNWNm
NjJlZTliMDQxNDcyYTNkNWJiZWJlYmM5YgotIEJPT1RfSU1BR0U9L2tlcm5lbC94ODZfNjQtcmhl
bC9hOGE5YmU0YjY4NjA1Y2Y2MmVlOWIwNDE0NzJhM2Q1YmJlYmViYzliL3ZtbGludXotNC4wLjAt
MDE2NzUtZ2E4YTliZTQKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L2xrcC1uZXgwNC9waWd6L3BlcmZv
cm1hbmNlLTEwMCUtMTI4Sy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVs
L2E4YTliZTRiNjg2MDVjZjYyZWU5YjA0MTQ3MmEzZDViYmViZWJjOWIvMAotIExLUF9TRVJWRVI9
aW5uCi0gfDItCgoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgcmQudWRldi5sb2ctcHJpb3Jp
dHk9ZXJyIHN5c3RlbWQubG9nX3RhcmdldD1qb3VybmFsIHN5c3RlbWQubG9nX2xldmVsPXdhcm5p
bmcKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9j
cHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dh
dGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAog
IGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3Cm1heF91
cHRpbWU6IDEyNjguNjU5OTk5OTk5OTk5OQpsa3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82
NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL2tlcm5lbC94ODZfNjQtcmhlbC9hOGE5YmU0YjY4NjA1
Y2Y2MmVlOWIwNDE0NzJhM2Q1YmJlYmViYzliL21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3Np
bWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9k
ZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNo
bWFya3MvdHVyYm9zdGF0LmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3ovcGlnei5jZ3oiCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogNTEuMjEgMzkuNzIg
MTcuOTAgMi82MzkgMTE4MzYKc3RhcnRfdGltZTogJzE0Mjk3NzczOTgnCmVuZF90aW1lOiAnMTQy
OTc3NzY5OCcKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNTA0MjMtMTI1ODQxIgo=

--===============4812479304146721158==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE1L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE4L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjAvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMS9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNC9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNy9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTI4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzAvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUzMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzMvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUzNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUz
Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NDAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQyL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NDMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ1L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDkvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1MS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU4L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1NTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjAvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2
MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCg==

--===============4812479304146721158==--

