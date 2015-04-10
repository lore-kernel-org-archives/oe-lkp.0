Content-Type: multipart/mixed; boundary="===============6156081037311657780=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [mm] bea66fbd11a: -13.5% aim7.time.minor_page_faults, -41.1% time.system_time
Date: Fri, 10 Apr 2015 09:07:36 +0800
Message-ID: <1428628056.6726.62.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6156081037311657780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit bea66fbd11af1ca98ae26855eea41eda8582923e ("mm: numa: group related p=
rocesses based on VMA flags instead of page table flags")


testbox/testcase/testparams: brickland3/aim7/performance-3000-sieve

98cf21c61a7f5419  bea66fbd11af1ca98ae26855ee  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

 1.155e+08 =C2=B1  1%     -13.5%   99915100 =C2=B1  1%  aim7.time.minor_pag=
e_faults
    904971 =C2=B1  1%     -64.8%     318137 =C2=B1 10%  aim7.time.voluntary=
_context_switches
    120.22 =C2=B1  1%     -41.1%      70.87 =C2=B1  3%  aim7.time.system_ti=
me
   6122485 =C2=B1  0%      -1.6%    6025423 =C2=B1  0%  aim7.time.involunta=
ry_context_switches
      1464 =C2=B1 14%     -66.0%        498 =C2=B1 37%  cpuidle.C1-IVT-4S.u=
sage
       470 =C2=B1  1%     -65.0%        164 =C2=B1 26%  vmstat.procs.b
    125221 =C2=B1  0%      -2.2%     122500 =C2=B1  0%  vmstat.system.in
     32780 =C2=B1  0%     -10.4%      29374 =C2=B1  1%  vmstat.system.cs
 1.155e+08 =C2=B1  1%     -13.5%   99915100 =C2=B1  1%  time.minor_page_fau=
lts
    120.22 =C2=B1  1%     -41.1%      70.87 =C2=B1  3%  time.system_time
    904971 =C2=B1  1%     -64.8%     318137 =C2=B1 10%  time.voluntary_cont=
ext_switches
        84 =C2=B1 43%     -67.0%         28 =C2=B1 23%  numa-numastat.node0=
.other_node
  56733780 =C2=B1  1%     -12.9%   49397913 =C2=B1  1%  proc-vmstat.numa_hi=
nt_faults
  55660319 =C2=B1  1%     -13.2%   48314771 =C2=B1  1%  proc-vmstat.numa_hi=
nt_faults_local
   3054195 =C2=B1  0%     -13.5%    2642998 =C2=B1  0%  proc-vmstat.numa_hit
   3053893 =C2=B1  0%     -13.5%    2642870 =C2=B1  0%  proc-vmstat.numa_lo=
cal
   1010298 =C2=B1  1%     -41.6%     590406 =C2=B1  1%  proc-vmstat.numa_pa=
ges_migrated
  57648883 =C2=B1  1%     -13.5%   49892114 =C2=B1  1%  proc-vmstat.numa_pt=
e_updates
   3076975 =C2=B1  0%     -13.6%    2659661 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
  1.16e+08 =C2=B1  1%     -13.4%  1.005e+08 =C2=B1  1%  proc-vmstat.pgfault
   3003186 =C2=B1  0%     -12.3%    2633789 =C2=B1  0%  proc-vmstat.pgfree
   1010298 =C2=B1  1%     -41.6%     590406 =C2=B1  1%  proc-vmstat.pgmigra=
te_success
         6 =C2=B1 12%     +33.3%          9 =C2=B1  7%  sched_debug.cfs_rq[=
104]:/.load
         5 =C2=B1 28%     +66.7%          8 =C2=B1 21%  sched_debug.cfs_rq[=
106]:/.load
         5 =C2=B1 28%     +61.9%          8 =C2=B1 17%  sched_debug.cfs_rq[=
106]:/.runnable_load_avg
      5069 =C2=B1  4%      +6.5%       5399 =C2=B1  5%  sched_debug.cfs_rq[=
109]:/.tg_load_avg
         6 =C2=B1  6%     +20.0%          7 =C2=B1  6%  sched_debug.cfs_rq[=
110]:/.load
      5060 =C2=B1  6%     +10.2%       5574 =C2=B1  5%  sched_debug.cfs_rq[=
115]:/.tg_load_avg
         6 =C2=B1  0%     +20.8%          7 =C2=B1  5%  sched_debug.cfs_rq[=
115]:/.load
      4974 =C2=B1  4%     +11.8%       5562 =C2=B1  6%  sched_debug.cfs_rq[=
116]:/.tg_load_avg
      4906 =C2=B1  2%     +11.3%       5459 =C2=B1  7%  sched_debug.cfs_rq[=
117]:/.tg_load_avg
         5 =C2=B1 14%     +50.0%          7 =C2=B1 11%  sched_debug.cfs_rq[=
118]:/.load
         5 =C2=B1  8%     +38.1%          7 =C2=B1 11%  sched_debug.cfs_rq[=
118]:/.runnable_load_avg
         6 =C2=B1 13%    +500.0%         37 =C2=B1 42%  sched_debug.cfs_rq[=
26]:/.tg_load_contrib
  20927468 =C2=B1  4%      +8.4%   22685964 =C2=B1  4%  sched_debug.cfs_rq[=
27]:/.min_vruntime
  21203485 =C2=B1  3%     +13.4%   24049232 =C2=B1  7%  sched_debug.cfs_rq[=
28]:/.min_vruntime
  18134631 =C2=B1  6%     +13.3%   20548482 =C2=B1 12%  sched_debug.cfs_rq[=
29]:/.min_vruntime
         7 =C2=B1 14%     -30.0%          5 =C2=B1 20%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
         5 =C2=B1 15%     +36.4%          7 =C2=B1 14%  sched_debug.cfs_rq[=
45]:/.runnable_load_avg
  22214373 =C2=B1  6%      +9.3%   24278287 =C2=B1  4%  sched_debug.cfs_rq[=
64]:/.min_vruntime
         7 =C2=B1 20%     -40.0%          4 =C2=B1 24%  sched_debug.cfs_rq[=
67]:/.load
         8 =C2=B1 15%     -40.6%          4 =C2=B1 31%  sched_debug.cfs_rq[=
67]:/.runnable_load_avg
         9 =C2=B1 37%     -35.9%          6 =C2=B1  6%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
         9 =C2=B1 30%     -35.1%          6 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.load
        66 =C2=B1 41%     -68.9%         20 =C2=B1 38%  sched_debug.cfs_rq[=
72]:/.blocked_load_avg
        74 =C2=B1 38%     -63.4%         27 =C2=B1 29%  sched_debug.cfs_rq[=
72]:/.tg_load_contrib
         7 =C2=B1 14%     -33.3%          5 =C2=B1 24%  sched_debug.cfs_rq[=
73]:/.runnable_load_avg
         7 =C2=B1 17%     -24.1%          5 =C2=B1 15%  sched_debug.cfs_rq[=
73]:/.load
         8 =C2=B1 13%     -29.4%          6 =C2=B1 11%  sched_debug.cfs_rq[=
7]:/.load
         8 =C2=B1 13%     -27.3%          6 =C2=B1 11%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
         7 =C2=B1  6%     -26.7%          5 =C2=B1 15%  sched_debug.cfs_rq[=
82]:/.load
         8 =C2=B1 21%     -38.2%          5 =C2=B1 34%  sched_debug.cfs_rq[=
84]:/.runnable_load_avg
  20672959 =C2=B1  3%     +18.6%   24508843 =C2=B1  8%  sched_debug.cfs_rq[=
84]:/.min_vruntime
         7 =C2=B1  6%     -26.7%          5 =C2=B1 20%  sched_debug.cfs_rq[=
9]:/.load
         8 =C2=B1 17%     -35.3%          5 =C2=B1 20%  sched_debug.cfs_rq[=
9]:/.runnable_load_avg
     12917 =C2=B1 12%     -27.9%       9309 =C2=B1  4%  sched_debug.cpu#0.t=
twu_count
      4804 =C2=B1  3%      -9.3%       4356 =C2=B1  7%  sched_debug.cpu#0.t=
twu_local
      1907 =C2=B1 36%     -61.0%        744 =C2=B1 25%  sched_debug.cpu#100=
.ttwu_local
      5295 =C2=B1 24%     -56.4%       2309 =C2=B1 25%  sched_debug.cpu#100=
.ttwu_count
     32486 =C2=B1  4%     -17.8%      26713 =C2=B1  7%  sched_debug.cpu#104=
.nr_switches
     33183 =C2=B1  4%     -14.9%      28232 =C2=B1  7%  sched_debug.cpu#104=
.sched_count
         6 =C2=B1 12%     +33.3%          9 =C2=B1  7%  sched_debug.cpu#104=
.load
        15 =C2=B1 11%     +52.5%         23 =C2=B1  4%  sched_debug.cpu#104=
.nr_running
         5 =C2=B1 28%     +57.1%          8 =C2=B1 13%  sched_debug.cpu#106=
.cpu_load[0]
        12 =C2=B1 22%     +70.8%         20 =C2=B1  2%  sched_debug.cpu#106=
.nr_running
       242 =C2=B1 17%     -29.9%        169 =C2=B1 29%  sched_debug.cpu#106=
.sched_goidle
         5 =C2=B1 28%     +66.7%          8 =C2=B1 21%  sched_debug.cpu#106=
.load
        15 =C2=B1  4%     +20.0%         18 =C2=B1  5%  sched_debug.cpu#11.=
nr_running
      1608 =C2=B1 25%     -49.3%        815 =C2=B1 32%  sched_debug.cpu#11.=
ttwu_local
      2025 =C2=B1 28%     -30.6%       1405 =C2=B1 19%  sched_debug.cpu#110=
.ttwu_count
         6 =C2=B1  6%     +20.0%          7 =C2=B1  6%  sched_debug.cpu#110=
.load
       673 =C2=B1 15%     -32.9%        452 =C2=B1 25%  sched_debug.cpu#110=
.ttwu_local
        14 =C2=B1  9%     +28.1%         18 =C2=B1  4%  sched_debug.cpu#110=
.nr_running
        13 =C2=B1 18%     +39.6%         18 =C2=B1  8%  sched_debug.cpu#112=
.nr_running
      3580 =C2=B1 36%     -52.6%       1698 =C2=B1 36%  sched_debug.cpu#114=
.ttwu_count
        14 =C2=B1 10%     +25.9%         18 =C2=B1  8%  sched_debug.cpu#115=
.nr_running
       240 =C2=B1  9%     -31.8%        164 =C2=B1 31%  sched_debug.cpu#118=
.sched_goidle
         5 =C2=B1  9%     +31.8%          7 =C2=B1  5%  sched_debug.cpu#118=
.cpu_load[3]
         5 =C2=B1  9%     +31.8%          7 =C2=B1  5%  sched_debug.cpu#118=
.cpu_load[4]
         5 =C2=B1  8%     +38.1%          7 =C2=B1 11%  sched_debug.cpu#118=
.cpu_load[1]
         5 =C2=B1  8%     +38.1%          7 =C2=B1 11%  sched_debug.cpu#118=
.cpu_load[2]
         5 =C2=B1 14%     +50.0%          7 =C2=B1 11%  sched_debug.cpu#118=
.load
         5 =C2=B1  8%     +38.1%          7 =C2=B1 11%  sched_debug.cpu#118=
.cpu_load[0]
        12 =C2=B1  5%     +54.2%         18 =C2=B1 16%  sched_debug.cpu#118=
.nr_running
      5276 =C2=B1 14%     -39.7%       3182 =C2=B1 42%  sched_debug.cpu#16.=
ttwu_count
      6741 =C2=B1 46%     -66.3%       2270 =C2=B1 28%  sched_debug.cpu#17.=
ttwu_count
         7 =C2=B1 14%     -30.0%          5 =C2=B1 20%  sched_debug.cpu#2.c=
pu_load[0]
       376 =C2=B1 18%    +132.8%        877 =C2=B1 29%  sched_debug.cpu#21.=
sched_goidle
      6779 =C2=B1 20%     -60.5%       2681 =C2=B1 40%  sched_debug.cpu#23.=
ttwu_count
      5932 =C2=B1 36%     -57.0%       2552 =C2=B1 38%  sched_debug.cpu#26.=
ttwu_count
      1871 =C2=B1 43%     -50.9%        919 =C2=B1 38%  sched_debug.cpu#3.t=
twu_local
      3782 =C2=B1 14%     -34.2%       2488 =C2=B1 11%  sched_debug.cpu#30.=
ttwu_count
        13 =C2=B1  3%     +36.4%         18 =C2=B1 12%  sched_debug.cpu#31.=
nr_running
      1664 =C2=B1 43%     -48.2%        861 =C2=B1 22%  sched_debug.cpu#32.=
ttwu_local
        14 =C2=B1 10%     +29.3%         18 =C2=B1  7%  sched_debug.cpu#32.=
nr_running
     31176 =C2=B1 12%     -16.1%      26153 =C2=B1  4%  sched_debug.cpu#32.=
sched_count
      5754 =C2=B1 22%     -54.7%       2606 =C2=B1 25%  sched_debug.cpu#36.=
ttwu_count
      1067 =C2=B1 16%     -31.1%        735 =C2=B1 16%  sched_debug.cpu#38.=
ttwu_local
     28900 =C2=B1  5%     -11.0%      25726 =C2=B1  7%  sched_debug.cpu#39.=
sched_count
      1257 =C2=B1 37%     -44.8%        693 =C2=B1 49%  sched_debug.cpu#39.=
ttwu_local
      4893 =C2=B1 21%     -54.0%       2249 =C2=B1 47%  sched_debug.cpu#40.=
ttwu_count
     28781 =C2=B1  4%      -9.0%      26197 =C2=B1  7%  sched_debug.cpu#40.=
sched_count
      4800 =C2=B1 29%     -51.7%       2320 =C2=B1 13%  sched_debug.cpu#42.=
ttwu_count
      1628 =C2=B1 35%     -53.3%        760 =C2=B1 26%  sched_debug.cpu#42.=
ttwu_local
     28887 =C2=B1  5%      -9.1%      26257 =C2=B1  7%  sched_debug.cpu#42.=
sched_count
         5 =C2=B1 15%     +36.4%          7 =C2=B1 14%  sched_debug.cpu#45.=
cpu_load[1]
         5 =C2=B1 15%     +36.4%          7 =C2=B1 14%  sched_debug.cpu#45.=
cpu_load[0]
     29036 =C2=B1  3%     -11.5%      25689 =C2=B1  4%  sched_debug.cpu#45.=
nr_switches
        13 =C2=B1 16%     +42.6%         19 =C2=B1 14%  sched_debug.cpu#45.=
nr_running
      6709 =C2=B1 35%     -69.9%       2020 =C2=B1 36%  sched_debug.cpu#45.=
ttwu_count
     30362 =C2=B1  6%     -13.8%      26186 =C2=B1  4%  sched_debug.cpu#45.=
sched_count
      1784 =C2=B1 24%     -53.0%        838 =C2=B1 23%  sched_debug.cpu#45.=
ttwu_local
     29093 =C2=B1  5%      -9.0%      26479 =C2=B1  5%  sched_debug.cpu#46.=
sched_count
        11 =C2=B1 13%     +57.4%         18 =C2=B1 22%  sched_debug.cpu#48.=
nr_running
        12 =C2=B1 23%     +40.8%         17 =C2=B1  8%  sched_debug.cpu#49.=
nr_running
      1020 =C2=B1  9%     -21.7%        799 =C2=B1 12%  sched_debug.cpu#50.=
ttwu_local
       514 =C2=B1 11%     -28.1%        370 =C2=B1 15%  sched_debug.cpu#52.=
sched_goidle
      5126 =C2=B1 36%     -63.0%       1898 =C2=B1 11%  sched_debug.cpu#53.=
ttwu_count
     29319 =C2=B1  5%     -11.6%      25920 =C2=B1  5%  sched_debug.cpu#54.=
sched_count
        13 =C2=B1 17%     +39.6%         18 =C2=B1 14%  sched_debug.cpu#54.=
nr_running
     28346 =C2=B1  3%      -9.9%      25537 =C2=B1  5%  sched_debug.cpu#54.=
nr_switches
       558 =C2=B1  5%     -35.9%        358 =C2=B1 12%  sched_debug.cpu#54.=
sched_goidle
      3768 =C2=B1 19%     -54.5%       1714 =C2=B1 43%  sched_debug.cpu#55.=
ttwu_count
     30565 =C2=B1 10%     -13.6%      26415 =C2=B1  2%  sched_debug.cpu#55.=
sched_count
      1582 =C2=B1 20%     -50.3%        787 =C2=B1 45%  sched_debug.cpu#56.=
ttwu_local
      6921 =C2=B1 37%     -73.0%       1871 =C2=B1 41%  sched_debug.cpu#56.=
ttwu_count
      1232 =C2=B1 18%     -47.0%        653 =C2=B1 20%  sched_debug.cpu#57.=
ttwu_local
       626 =C2=B1 41%     -38.0%        388 =C2=B1 11%  sched_debug.cpu#57.=
sched_goidle
     32348 =C2=B1 16%     -17.6%      26669 =C2=B1  2%  sched_debug.cpu#57.=
sched_count
      1441 =C2=B1 42%     -51.7%        695 =C2=B1 23%  sched_debug.cpu#58.=
ttwu_local
     41619 =C2=B1 45%     -35.7%      26769 =C2=B1  5%  sched_debug.cpu#59.=
sched_count
         9 =C2=B1 30%     -35.1%          6 =C2=B1  0%  sched_debug.cpu#6.l=
oad
         9 =C2=B1 37%     -35.9%          6 =C2=B1  6%  sched_debug.cpu#6.c=
pu_load[0]
         9 =C2=B1 37%     -35.9%          6 =C2=B1  6%  sched_debug.cpu#6.c=
pu_load[1]
         9 =C2=B1 39%     -34.2%          6 =C2=B1  6%  sched_debug.cpu#6.c=
pu_load[2]
     28059 =C2=B1  4%      -8.6%      25653 =C2=B1  4%  sched_debug.cpu#60.=
sched_count
      4532 =C2=B1 36%     -68.8%       1413 =C2=B1 40%  sched_debug.cpu#60.=
ttwu_count
      4914 =C2=B1 38%     -60.7%       1929 =C2=B1 36%  sched_debug.cpu#62.=
ttwu_count
      1128 =C2=B1  7%     -42.9%        644 =C2=B1 20%  sched_debug.cpu#62.=
ttwu_local
         7 =C2=B1 20%     -40.0%          4 =C2=B1 24%  sched_debug.cpu#67.=
load
     28008 =C2=B1  2%      -9.4%      25363 =C2=B1  5%  sched_debug.cpu#67.=
sched_count
     27655 =C2=B1  3%      -9.5%      25024 =C2=B1  5%  sched_debug.cpu#67.=
nr_switches
      1403 =C2=B1 21%     -56.1%        616 =C2=B1  8%  sched_debug.cpu#67.=
ttwu_local
      4889 =C2=B1 30%     -54.4%       2228 =C2=B1 36%  sched_debug.cpu#67.=
ttwu_count
      1174 =C2=B1 36%     -59.3%        477 =C2=B1 27%  sched_debug.cpu#69.=
ttwu_local
        15 =C2=B1  8%     +28.3%         19 =C2=B1 14%  sched_debug.cpu#69.=
nr_running
         8 =C2=B1 13%     -29.4%          6 =C2=B1 11%  sched_debug.cpu#7.l=
oad
      4411 =C2=B1 33%     -41.1%       2596 =C2=B1 36%  sched_debug.cpu#7.t=
twu_count
      1528 =C2=B1 23%     -65.7%        524 =C2=B1 21%  sched_debug.cpu#71.=
ttwu_local
     28435 =C2=B1  3%     -11.3%      25224 =C2=B1  4%  sched_debug.cpu#71.=
sched_count
         7 =C2=B1 14%     -35.5%          5 =C2=B1 24%  sched_debug.cpu#73.=
cpu_load[2]
         8 =C2=B1 15%     -37.5%          5 =C2=B1 24%  sched_debug.cpu#73.=
cpu_load[3]
         7 =C2=B1 14%     -33.3%          5 =C2=B1 24%  sched_debug.cpu#73.=
cpu_load[1]
         8 =C2=B1 15%     -34.4%          5 =C2=B1 20%  sched_debug.cpu#73.=
cpu_load[4]
         7 =C2=B1 14%     -33.3%          5 =C2=B1 24%  sched_debug.cpu#73.=
cpu_load[0]
         7 =C2=B1 17%     -24.1%          5 =C2=B1 15%  sched_debug.cpu#73.=
load
     32392 =C2=B1  4%     -17.2%      26828 =C2=B1  5%  sched_debug.cpu#74.=
nr_switches
     34243 =C2=B1  8%     -17.3%      28320 =C2=B1  4%  sched_debug.cpu#74.=
sched_count
      1728 =C2=B1 29%     -50.9%        849 =C2=B1 39%  sched_debug.cpu#75.=
ttwu_local
      5389 =C2=B1 21%     -61.6%       2072 =C2=B1 39%  sched_debug.cpu#75.=
ttwu_count
     28023 =C2=B1  4%      -8.3%      25700 =C2=B1  6%  sched_debug.cpu#75.=
nr_switches
      3398 =C2=B1 11%     -33.9%       2248 =C2=B1 38%  sched_debug.cpu#76.=
ttwu_count
         7 =C2=B1  6%     -26.7%          5 =C2=B1 15%  sched_debug.cpu#82.=
load
         8 =C2=B1 16%     -37.1%          5 =C2=B1 32%  sched_debug.cpu#84.=
cpu_load[3]
         8 =C2=B1 21%     -40.0%          5 =C2=B1 34%  sched_debug.cpu#84.=
cpu_load[1]
         8 =C2=B1 16%     -40.0%          5 =C2=B1 34%  sched_debug.cpu#84.=
cpu_load[2]
         8 =C2=B1 16%     -37.1%          5 =C2=B1 32%  sched_debug.cpu#84.=
cpu_load[4]
         8 =C2=B1 21%     -38.2%          5 =C2=B1 34%  sched_debug.cpu#84.=
cpu_load[0]
      1555 =C2=B1 43%     -56.6%        675 =C2=B1 38%  sched_debug.cpu#87.=
ttwu_local
     33842 =C2=B1  1%     -15.1%      28727 =C2=B1  6%  sched_debug.cpu#89.=
sched_count
     33213 =C2=B1  1%     -18.8%      26968 =C2=B1  7%  sched_debug.cpu#89.=
nr_switches
         7 =C2=B1  6%     -26.7%          5 =C2=B1 20%  sched_debug.cpu#9.l=
oad
        12 =C2=B1 10%     +37.3%         17 =C2=B1 16%  sched_debug.cpu#90.=
nr_running
         5 =C2=B1  8%     +33.3%          7 =C2=B1 17%  sched_debug.cpu#90.=
cpu_load[4]
         5 =C2=B1  8%     +33.3%          7 =C2=B1 17%  sched_debug.cpu#90.=
cpu_load[3]
      2539 =C2=B1 15%     -66.6%        847 =C2=B1 39%  sched_debug.cpu#96.=
ttwu_count
      1124 =C2=B1 47%     -49.8%        564 =C2=B1 23%  sched_debug.cpu#97.=
ttwu_local
         4 =C2=B1 10%     +58.8%          6 =C2=B1 21%  sched_debug.cpu#99.=
cpu_load[3]
         4 =C2=B1 10%     +47.1%          6 =C2=B1 13%  sched_debug.cpu#99.=
cpu_load[4]
         4 =C2=B1 10%     +58.8%          6 =C2=B1 21%  sched_debug.cpu#99.=
cpu_load[2]
      1124 =C2=B1 34%     -53.8%        519 =C2=B1 12%  sched_debug.cpu#99.=
ttwu_local

testbox/testcase/testparams: lkp-ne02/netperf/performance-300s-200%-TCP_SEN=
DFILE

98cf21c61a7f5419  bea66fbd11af1ca98ae26855ee  =

----------------  --------------------------  =

      3618 =C2=B1  2%      -8.1%       3326 =C2=B1  2%  slabinfo.proc_inode=
_cache.num_objs
      0.26 =C2=B1  7%      -8.7%       0.24 =C2=B1  5%  turbostat.CPU%c1
      2937 =C2=B1  0%     +12.9%       3314 =C2=B1  9%  numa-meminfo.node1.=
PageTables
    387540 =C2=B1 29%     -49.3%     196421 =C2=B1 39%  cpuidle.C1-NHM.time
     85799 =C2=B1  6%    +214.0%     269448 =C2=B1 37%  numa-vmstat.node0.n=
uma_local
       733 =C2=B1  0%     +12.9%        827 =C2=B1  9%  numa-vmstat.node1.n=
r_page_table_pages
     69008 =C2=B1  4%    +555.5%     452353 =C2=B1 47%  numa-numastat.node0=
.local_node
     68999 =C2=B1  4%    +555.6%     452349 =C2=B1 47%  numa-numastat.node0=
.numa_hit
      3720 =C2=B1  9%     +67.5%       6232 =C2=B1 21%  proc-vmstat.pgalloc=
_dma
    550092 =C2=B1  8%     +32.5%     728886 =C2=B1 12%  proc-vmstat.pgalloc=
_dma32
       124 =C2=B1  6%      -5.4%        117 =C2=B1  7%  sched_debug.cfs_rq[=
0]:/.load
      5872 =C2=B1 11%     -17.9%       4821 =C2=B1 10%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
       129 =C2=B1  4%      -7.6%        119 =C2=B1  5%  sched_debug.cfs_rq[=
10]:/.runnable_load_avg
       129 =C2=B1  4%     -10.4%        116 =C2=B1  4%  sched_debug.cfs_rq[=
10]:/.load
      5817 =C2=B1 13%     -17.2%       4816 =C2=B1  9%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
   1511306 =C2=B1  3%      -7.4%    1399297 =C2=B1  5%  sched_debug.cfs_rq[=
12]:/.min_vruntime
      5799 =C2=B1 13%     -17.2%       4800 =C2=B1 10%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
       629 =C2=B1 33%     -51.0%        308 =C2=B1 35%  sched_debug.cfs_rq[=
12]:/.tg_load_contrib
   1511248 =C2=B1  3%     -11.9%    1331134 =C2=B1  5%  sched_debug.cfs_rq[=
12]:/.MIN_vruntime
   1511249 =C2=B1  3%     -11.9%    1331134 =C2=B1  5%  sched_debug.cfs_rq[=
12]:/.max_vruntime
       522 =C2=B1  1%     -55.4%        233 =C2=B1 15%  sched_debug.cfs_rq[=
13]:/.tg_load_contrib
       406 =C2=B1  0%     -71.9%        114 =C2=B1 33%  sched_debug.cfs_rq[=
13]:/.blocked_load_avg
      5789 =C2=B1 13%     -17.3%       4788 =C2=B1 10%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
      5784 =C2=B1 13%     -17.7%       4760 =C2=B1  9%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
       643 =C2=B1 16%     -73.9%        168 =C2=B1 34%  sched_debug.cfs_rq[=
15]:/.tg_load_contrib
      5760 =C2=B1 12%     -17.7%       4742 =C2=B1  9%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
       153 =C2=B1  9%    +142.6%        371 =C2=B1 33%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
       178 =C2=B1 20%    +191.3%        518 =C2=B1 37%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
   1484495 =C2=B1  1%     -10.4%    1330254 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.max_vruntime
   1484495 =C2=B1  1%     -10.4%    1330254 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.MIN_vruntime
   1525410 =C2=B1  4%      -9.1%    1387280 =C2=B1  5%  sched_debug.cfs_rq[=
4]:/.min_vruntime
       363 =C2=B1  0%     -38.9%        222 =C2=B1 31%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
      5881 =C2=B1 12%     -14.0%       5059 =C2=B1  5%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
       654 =C2=B1  4%     -70.7%        191 =C2=B1 28%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
      5915 =C2=B1 11%     -14.7%       5043 =C2=B1  5%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
      5895 =C2=B1 11%     -14.8%       5024 =C2=B1  5%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
       144 =C2=B1  9%     -18.2%        117 =C2=B1  5%  sched_debug.cfs_rq[=
8]:/.load
        72 =C2=B1 18%    +305.9%        294 =C2=B1 38%  sched_debug.cfs_rq[=
8]:/.blocked_load_avg
       202 =C2=B1  6%    +104.7%        413 =C2=B1 26%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
      5887 =C2=B1 11%     -15.1%       4998 =C2=B1  6%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
       128 =C2=B1  5%      -7.4%        119 =C2=B1  6%  sched_debug.cpu#0.c=
pu_load[4]
       128 =C2=B1  6%      -6.6%        119 =C2=B1  6%  sched_debug.cpu#0.c=
pu_load[3]
       127 =C2=B1  6%      -5.5%        120 =C2=B1  5%  sched_debug.cpu#0.c=
pu_load[2]
     12677 =C2=B1 35%     -49.6%       6383 =C2=B1 48%  sched_debug.cpu#1.s=
ched_goidle
       127 =C2=B1  3%      -7.5%        117 =C2=B1  4%  sched_debug.cpu#10.=
cpu_load[3]
       127 =C2=B1  5%     -10.6%        114 =C2=B1  5%  sched_debug.cpu#10.=
load
       127 =C2=B1  3%      -7.3%        117 =C2=B1  4%  sched_debug.cpu#10.=
cpu_load[4]
    285821 =C2=B1 31%     -31.8%     194934 =C2=B1  0%  sched_debug.cpu#12.=
ttwu_local
    289858 =C2=B1 31%     -31.6%     198184 =C2=B1  0%  sched_debug.cpu#12.=
ttwu_count
    382013 =C2=B1 45%     -47.0%     202396 =C2=B1  0%  sched_debug.cpu#12.=
nr_switches
    382110 =C2=B1 45%     -47.0%     202488 =C2=B1  0%  sched_debug.cpu#12.=
sched_count
      1504 =C2=B1 24%     -22.1%       1171 =C2=B1 29%  sched_debug.cpu#12.=
curr->pid
      1670 =C2=B1 24%     -72.9%        453 =C2=B1 17%  sched_debug.cpu#13.=
sched_goidle
      1840 =C2=B1 18%     -41.9%       1068 =C2=B1 15%  sched_debug.cpu#14.=
curr->pid
       114 =C2=B1  0%      +6.4%        121 =C2=B1  4%  sched_debug.cpu#15.=
cpu_load[2]
      1494 =C2=B1 18%     -29.7%       1050 =C2=B1 13%  sched_debug.cpu#15.=
curr->pid
    211892 =C2=B1  5%      -5.7%     199867 =C2=B1  0%  sched_debug.cpu#2.t=
twu_local
    330774 =C2=B1 35%     -37.9%     205319 =C2=B1  2%  sched_debug.cpu#4.t=
twu_count
    324839 =C2=B1 36%     -38.4%     200110 =C2=B1  2%  sched_debug.cpu#4.t=
twu_local
      1397 =C2=B1  0%     -23.7%       1066 =C2=B1 13%  sched_debug.cpu#6.c=
urr->pid
       128 =C2=B1  2%      -7.2%        118 =C2=B1  4%  sched_debug.cpu#8.c=
pu_load[4]
       144 =C2=B1  7%     -18.2%        118 =C2=B1  5%  sched_debug.cpu#8.l=
oad
       141 =C2=B1 11%     -18.1%        115 =C2=B1  5%  sched_debug.cpu#9.l=
oad

brickland3: Brickland Ivy Bridge-EX
Memory: 512G

lkp-ne02: Nehalem-EP
Memory: 5G




                               aim7.time.system_time

  140 ++-------------------------------------------------------------------=
-+
  130 ++       .*..   .*..                                                 =
 |
      |    ..*.     ..    *..      .*..                          .*        =
 |
  120 *+.*.        *         *...*.      ..*..*..*...  .*..*...*.          =
 |
  110 ++                               *.            *.                    =
 |
      |                                                                    =
 |
  100 ++                                                                   =
 |
   90 ++                                                                   =
 |
   80 ++                                                                   =
 |
      |                                                                  O =
 |
   70 ++                                                          O  O     =
 O
   60 ++                                                                   =
 |
      |  O                                              O  O   O           =
 |
   50 ++     O     O      O      O         O     O                         =
 |
   40 O+--------O------O-----O------O--O------O------O---------------------=
-+


                         aim7.time.voluntary_context_switches

  1.1e+06 ++---------------------------------------------------------------=
-+
          |               *..                                              =
 |
    1e+06 ++   .*..     ..           .*..                                  =
 |
   900000 *+.*.    *...*     *..*..*.      ..*..*..*..  .*..*..*...*       =
 |
          |                              *.           *.                   =
 |
   800000 ++                                                               =
 |
   700000 ++                                                               =
 |
          |                                                                =
 |
   600000 ++                                                               =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
   400000 ++                       O         O  O  O  O     O  O         O =
 |
   300000 ++ O  O  O   O  O     O     O  O               O            O    =
 O
          O                  O                                     O       =
 |
   200000 ++---------------------------------------------------------------=
-+


                                 time.system_time

  140 ++-------------------------------------------------------------------=
-+
  130 ++       .*..   .*..                                                 =
 |
      |    ..*.     ..    *..      .*..                          .*        =
 |
  120 *+.*.        *         *...*.      ..*..*..*...  .*..*...*.          =
 |
  110 ++                               *.            *.                    =
 |
      |                                                                    =
 |
  100 ++                                                                   =
 |
   90 ++                                                                   =
 |
   80 ++                                                                   =
 |
      |                                                                  O =
 |
   70 ++                                                          O  O     =
 O
   60 ++                                                                   =
 |
      |  O                                              O  O   O           =
 |
   50 ++     O     O      O      O         O     O                         =
 |
   40 O+--------O------O-----O------O--O------O------O---------------------=
-+


                            time.voluntary_context_switches

  1.1e+06 ++---------------------------------------------------------------=
-+
          |               *..                                              =
 |
    1e+06 ++   .*..     ..           .*..                                  =
 |
   900000 *+.*.    *...*     *..*..*.      ..*..*..*..  .*..*..*...*       =
 |
          |                              *.           *.                   =
 |
   800000 ++                                                               =
 |
   700000 ++                                                               =
 |
          |                                                                =
 |
   600000 ++                                                               =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
   400000 ++                       O         O  O  O  O     O  O         O =
 |
   300000 ++ O  O  O   O  O     O     O  O               O            O    =
 O
          O                  O                                     O       =
 |
   200000 ++---------------------------------------------------------------=
-+


                                  vmstat.procs.b

  500 ++-----*--*--*-------------------------------------------------------=
-+
      *.. ..           *..*..*...*..*..*...*..     ..*..*..*...*..*        =
 |
  450 ++ *                                    *..*.                        =
 |
  400 ++                                                                   =
 |
      |                                                                    =
 |
  350 ++                                                                   =
 |
      |                                                                    =
 |
  300 ++                                                                   =
 |
      |                                                                    =
 |
  250 ++                                                                   =
 |
  200 ++               O     O                             O             O =
 |
      |  O         O             O  O  O   O  O  O   O  O      O           =
 O
  150 ++     O  O         O                                                =
 |
      O                                                              O     =
 |
  100 ++----------------------------------------------------------O--------=
-+


                                  vmstat.system.in

  126000 ++----------------------------------------------------------------=
-+
         | .*..                                                            =
 |
  125500 *+      ..*..  .*..         .*..      *..      .*..   *..*        =
 |
  125000 ++    *.     *.    *..  ..*.        ..   *...*.     ..            =
 |
         |                     *.        *..*               *              =
 |
  124500 ++                                                                =
 |
  124000 ++                                                                =
 |
         |                                                                 =
 |
  123500 ++                                                                =
 |
  123000 ++ O                                                              =
 |
         |            O                     O     O         O  O           =
 |
  122500 ++    O         O         O     O                        O   O  O =
 O
  122000 ++        O        O  O      O        O      O  O                 =
 |
         |                                                                 =
 |
  121500 O+----------------------------------------------------------------=
-+


                                  vmstat.system.cs

  33500 ++-----------------------------------------------------------------=
-+
  33000 ++   .*.       .*..      .*..*..                                   =
 |
        *..*.   ..   *.    *...*.         ..*..*..*..  ..*..*..*..*        =
 |
  32500 ++         ..                   *.           *.                    =
 |
  32000 ++        *                                                        =
 |
        |                                                                  =
 |
  31500 ++                                                                 =
 |
  31000 ++                                                                 =
 |
  30500 ++                                                                 =
 |
        |                                                   O              =
 |
  30000 ++        O  O  O      O  O     O   O  O  O  O         O         O =
 |
  29500 O+ O  O            O         O                   O                 =
 |
        |                                                             O    =
 O
  29000 ++                                                        O        =
 |
  28500 ++-----------------------------------------------------------------=
-+


                                 proc-vmstat.numa_hit

  3.3e+06 ++--------------*------------------------------------------------=
-+
          |        *.    : :                                               =
 |
  3.2e+06 ++      +  ..  :  :                                              =
 |
          *..*.. +      :   :                  .*..                        =
 |
  3.1e+06 ++    *      *     *..*..        ..*.    *..  .*..  .*...*       =
 |
    3e+06 ++                       *..*..*.           *.    *.             =
 |
          |                                                                =
 |
  2.9e+06 ++                                                               =
 |
          |                                                                =
 |
  2.8e+06 ++                                                               =
 |
  2.7e+06 ++                                                               =
 |
          |  O                                                        O    =
 O
  2.6e+06 O+    O      O  O  O     O  O  O   O  O  O  O        O   O     O =
 |
          |        O            O                        O  O              =
 |
  2.5e+06 ++---------------------------------------------------------------=
-+


                                proc-vmstat.numa_local

  3.3e+06 ++--------------*------------------------------------------------=
-+
          |        *.    : :                                               =
 |
  3.2e+06 ++      +  ..  :  :                                              =
 |
          *..*.. +      :   :                  .*..                        =
 |
  3.1e+06 ++    *      *     *..*..        ..*.    *..  .*..  .*...*       =
 |
    3e+06 ++                       *..*..*.           *.    *.             =
 |
          |                                                                =
 |
  2.9e+06 ++                                                               =
 |
          |                                                                =
 |
  2.8e+06 ++                                                               =
 |
  2.7e+06 ++                                                               =
 |
          |  O                                                             =
 O
  2.6e+06 O+    O      O  O  O     O  O  O   O  O  O  O        O   O  O  O =
 |
          |        O            O                        O  O              =
 |
  2.5e+06 ++---------------------------------------------------------------=
-+


                              proc-vmstat.pgalloc_normal

  3.4e+06 ++---------------------------------------------------------------=
-+
          |               *                                                =
 |
  3.3e+06 ++             : :                                               =
 |
  3.2e+06 ++       *..   :  :                                              =
 |
          | .*.. ..   . :   :                  .*..                        =
 |
  3.1e+06 *+    *      *     *..*..     .*...*.    *..  .*..  .*...*       =
 |
    3e+06 ++                       *..*.              *.    *.             =
 |
          |                                                                =
 |
  2.9e+06 ++                                                               =
 |
  2.8e+06 ++                                                               =
 |
          |                                                                =
 |
  2.7e+06 ++ O                                                     O       =
 |
  2.6e+06 O+    O      O  O  O     O  O  O   O  O  O  O     O  O      O  O =
 O
          |        O            O                        O                 =
 |
  2.5e+06 ++---------------------------------------------------------------=
-+


                            proc-vmstat.numa_pages_migrated

  1.3e+06 ++---------------------------------------------------------------=
-+
          |               *                                                =
 |
  1.2e+06 ++       *.    : :                                               =
 |
          |       +  ..  :  :                                              =
 |
  1.1e+06 *+.*.. +      :   :                  .*..                        =
 |
    1e+06 ++    *      *     *..*..        ..*.    *..  .*..  .*...*       =
 |
          |                        *..*..*.           *.    *.             =
 |
   900000 ++                                                               =
 |
          |                                                                =
 |
   800000 ++                                                               =
 |
   700000 ++                                                               =
 |
          |                                                                =
 |
   600000 ++ O                                                        O  O =
 O
          O            O  O        O  O  O   O  O  O  O     O  O   O       =
 |
   500000 ++----O--O---------O--O------------------------O-----------------=
-+


                             proc-vmstat.pgmigrate_success

  1.3e+06 ++---------------------------------------------------------------=
-+
          |               *                                                =
 |
  1.2e+06 ++       *.    : :                                               =
 |
          |       +  ..  :  :                                              =
 |
  1.1e+06 *+.*.. +      :   :                  .*..                        =
 |
    1e+06 ++    *      *     *..*..        ..*.    *..  .*..  .*...*       =
 |
          |                        *..*..*.           *.    *.             =
 |
   900000 ++                                                               =
 |
          |                                                                =
 |
   800000 ++                                                               =
 |
   700000 ++                                                               =
 |
          |                                                                =
 |
   600000 ++ O                                                        O  O =
 O
          O            O  O        O  O  O   O  O  O  O     O  O   O       =
 |
   500000 ++----O--O---------O--O------------------------O-----------------=
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
Ying Huang


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============6156081037311657780==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBhaW03CmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJlLXRlc3QKICB1
cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAKICBudW1hLXZt
c3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1zdGF0OiAKICBt
ZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRl
bmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6
IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDog
CiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiAxMApkZWZhdWx0LXdhdGNo
ZG9nczoKICB3YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjogcGVyZm9y
bWFuY2UKbW9kZWw6IEJyaWNrbGFuZCBJdnkgQnJpZGdlLUVYCm5yX2NwdTogMTIwCm1lbW9yeTog
NTEyRwpoZGRfcGFydGl0aW9uczogCnN3YXBfcGFydGl0aW9uczogCnBtZXRlcl9zZXJ2ZXI6IGxr
cC1zdDAxCnBtZXRlcl9kZXZpY2U6IHlva29nYXdhLXd0MzEwCmFpbTc6CiAgbG9hZDogMzAwMAog
IHRlc3Q6IHNpZXZlCmJyYW5jaDogcG0vbGludXgtbmV4dApjb21taXQ6IGYyMmU2ZTg0NzExNWFi
YzNhMGUyYWQ3YmIxOGQyNDNkNDIyNzVhZjEKcmVwZWF0X3RvOiAyCnRlc3Rib3g6IGJyaWNrbGFu
ZDMKdGJveF9ncm91cDogYnJpY2tsYW5kMwprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3Rp
bWU6IDIwMTUtMDMtMzAgMDg6MDY6NTguMjg1Mjk2MTAyICswODowMApoZWFkX2NvbW1pdDogMDlk
MjZlNjM3YTU2ZWQ4ZTkzNWE4MmMwNzAxZWZmZTkyNjFmZTk0MwpiYXNlX2NvbW1pdDogZjIyZTZl
ODQ3MTE1YWJjM2EwZTJhZDdiYjE4ZDI0M2Q0MjI3NWFmMQprZXJuZWw6ICIva2VybmVsL3g4Nl82
NC1yaGVsL2YyMmU2ZTg0NzExNWFiYzNhMGUyYWQ3YmIxOGQyNDNkNDIyNzVhZjEvdm1saW51ei00
LjAuMC1yYzciCnVzZXI6IGxrcApxdWV1ZTogdW5pdApyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAx
NS0wMi0wNy5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L2JyaWNrbGFuZDMvYWltNy9wZXJmb3Jt
YW5jZS0zMDAwLXNpZXZlL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwv
ZjIyZTZlODQ3MTE1YWJjM2EwZTJhZDdiYjE4ZDI0M2Q0MjI3NWFmMS8wIgpMS1BfU0VSVkVSOiBp
bm4Kam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9icmlja2xhbmQzL3VuaXRfYWltNy1wZXJmb3Jt
YW5jZS0zMDAwLXNpZXZlLXg4Nl82NC1yaGVsLUJBU0UtZjIyZTZlODQ3MTE1YWJjM2EwZTJhZDdi
YjE4ZDI0M2Q0MjI3NWFmMS0xLTIwMTUwMzMwLTEyMTcxMS0xdWZsd2R6LnlhbWwiCmRlcXVldWVf
dGltZTogMjAxNS0wNC0wOCAwMjowNzowMi45NjgwNjMyNjEgKzA4OjAwCm1heF91cHRpbWU6IDIx
NzAuMDIwMDAwMDAwMDAwNAptb2R1bGVzX2luaXRyZDogIi9rZXJuZWwveDg2XzY0LXJoZWwvZjIy
ZTZlODQ3MTE1YWJjM2EwZTJhZDdiYjE4ZDI0M2Q0MjI3NWFmMS9tb2R1bGVzLmNneiIKYm1faW5p
dHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3os
L29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3os
L2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL2FpbTcteDg2XzY0
LmNneiIKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAxODMwLjMxIDEzODEuMzIgNTkwLjU1
IDEvOTgyIDExODgyCnN0YXJ0X3RpbWU6ICcxNDI4NDMwMTA1JwplbmRfdGltZTogJzE0Mjg0MzAz
MzcnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTUwNDA2LTIxMjIxOCIK

--===============6156081037311657780==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDAvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUx
MDEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUxMDIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDQv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUxMDUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDcvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUxMDgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMS9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTExMC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMi9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExMy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExNS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTExNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTExNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExOC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEx
OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTEyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNC9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTE1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTE4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjAv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjMvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjYvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTI4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjkvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMyL2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1MzMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MzYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUzNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHU0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTQyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ1
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NDkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTAvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU1MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTU4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
NjAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHU2MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjMvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHU2NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjYvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU2Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjkvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1NzAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcyL2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NzMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc1L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NzYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU3Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc4L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Nzkv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1ODAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4MS9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTgyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1ODMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4NC9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTg1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1ODYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4Ny9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg4L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1ODkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU5MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTMvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5
NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTk1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5Ny9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTk4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCg==

--===============6156081037311657780==--

