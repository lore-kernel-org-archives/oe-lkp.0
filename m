Content-Type: multipart/mixed; boundary="===============3100417548769755913=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [tmpfs] afa2db2fb6: -14.5% aim9.creat-clo.ops_per_sec
Date: Mon, 12 Oct 2015 14:44:27 +0800
Message-ID: <878u78io1g.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3100417548769755913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit afa2db2fb6f15f860069de94a1257db57589fe95 ("tmpfs: truncate prealloc =
blocks past i_size")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/testtime/test:
  lkp-wsx02/aim9/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performan=
ce/300s/creat-clo

commit: =

  c435a390574d012f8d30074135d8fcc6f480b484
  afa2db2fb6f15f860069de94a1257db57589fe95

c435a390574d012f afa2db2fb6f15f860069de94a1 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    563108 =C2=B1  0%     -14.5%     481585 =C2=B1  6%  aim9.creat-clo.ops_=
per_sec
     13485 =C2=B1  9%     -17.2%      11162 =C2=B1  8%  numa-meminfo.node0.=
SReclaimable
      9.21 =C2=B1  4%     -11.7%       8.13 =C2=B1  1%  time.user_time
      2.04 =C2=B1 10%     -19.6%       1.64 =C2=B1 14%  turbostat.CPU%c1
  11667682 =C2=B1 96%     -96.0%     463268 =C2=B1104%  cpuidle.C1E-NHM.time
      2401 =C2=B1  3%     -38.8%       1470 =C2=B1 27%  cpuidle.C3-NHM.usage
      2.25 =C2=B1 48%    +166.7%       6.00 =C2=B1 20%  numa-numastat.node2=
.other_node
      4.75 =C2=B1 68%    +126.3%      10.75 =C2=B1 34%  numa-numastat.node3=
.other_node
      3370 =C2=B1  9%     -17.2%       2790 =C2=B1  8%  numa-vmstat.node0.n=
r_slab_reclaimable
     15.00 =C2=B1101%    +338.3%      65.75 =C2=B1 69%  numa-vmstat.node1.n=
r_dirtied
     14.33 =C2=B1108%    +357.0%      65.50 =C2=B1 68%  numa-vmstat.node1.n=
r_written
     43359 =C2=B1  0%     -50.6%      21399 =C2=B1 58%  numa-vmstat.node2.n=
uma_other
   5522042 =C2=B1  0%     -11.8%    4871759 =C2=B1  5%  proc-vmstat.numa_hit
   5522030 =C2=B1  0%     -11.8%    4871736 =C2=B1  5%  proc-vmstat.numa_lo=
cal
  10381338 =C2=B1  0%     -16.1%    8713670 =C2=B1  5%  proc-vmstat.pgalloc=
_normal
  10403821 =C2=B1  0%     -12.5%    9099427 =C2=B1  5%  proc-vmstat.pgfree
      1101 =C2=B1  5%     -15.9%     926.25 =C2=B1 12%  slabinfo.blkdev_ioc=
.active_objs
      1101 =C2=B1  5%     -15.9%     926.25 =C2=B1 12%  slabinfo.blkdev_ioc=
.num_objs
      1058 =C2=B1  3%     -12.1%     930.75 =C2=B1  8%  slabinfo.file_lock_=
ctx.active_objs
      1058 =C2=B1  3%     -12.1%     930.75 =C2=B1  8%  slabinfo.file_lock_=
ctx.num_objs
    872.38 =C2=B1 56%     -46.5%     467.10 =C2=B1 70%  sched_debug.cfs_rq[=
11]:/.exec_clock
    530.50 =C2=B1 22%    +225.1%       1724 =C2=B1 52%  sched_debug.cfs_rq[=
13]:/.avg->runnable_avg_sum
     11.00 =C2=B1 23%    +234.1%      36.75 =C2=B1 54%  sched_debug.cfs_rq[=
13]:/.tg_runnable_contrib
    675.18 =C2=B1 30%    +492.9%       4003 =C2=B1 61%  sched_debug.cfs_rq[=
1]:/.exec_clock
      3045 =C2=B1 37%    +420.7%      15858 =C2=B1 73%  sched_debug.cfs_rq[=
1]:/.min_vruntime
      5240 =C2=B1 48%     -56.8%       2264 =C2=B1 35%  sched_debug.cfs_rq[=
22]:/.min_vruntime
      5424 =C2=B1 93%     -93.7%     339.50 =C2=B1 70%  sched_debug.cfs_rq[=
23]:/.avg->runnable_avg_sum
    117.00 =C2=B1 94%     -94.4%       6.50 =C2=B1 79%  sched_debug.cfs_rq[=
23]:/.tg_runnable_contrib
    337.21 =C2=B1 15%     -40.1%     201.92 =C2=B1 41%  sched_debug.cfs_rq[=
24]:/.exec_clock
    199.07 =C2=B1 78%    +241.7%     680.17 =C2=B1 50%  sched_debug.cfs_rq[=
25]:/.exec_clock
    367.50 =C2=B1 12%     -37.2%     230.75 =C2=B1 24%  sched_debug.cfs_rq[=
27]:/.avg->runnable_avg_sum
      7.00 =C2=B1 17%     -39.3%       4.25 =C2=B1 30%  sched_debug.cfs_rq[=
27]:/.tg_runnable_contrib
    326.96 =C2=B1 15%     -42.6%     187.64 =C2=B1 47%  sched_debug.cfs_rq[=
28]:/.exec_clock
    200.71 =C2=B1 88%   +1505.4%       3222 =C2=B1 75%  sched_debug.cfs_rq[=
29]:/.exec_clock
      3240 =C2=B1 20%     +72.0%       5574 =C2=B1 23%  sched_debug.cfs_rq[=
31]:/.min_vruntime
     97.47 =C2=B1 42%    +891.3%     966.27 =C2=B1 53%  sched_debug.cfs_rq[=
37]:/.exec_clock
      1403 =C2=B1 55%    +246.3%       4858 =C2=B1 53%  sched_debug.cfs_rq[=
37]:/.min_vruntime
      1461 =C2=B1 50%    +143.7%       3562 =C2=B1 52%  sched_debug.cfs_rq[=
41]:/.min_vruntime
    184.00 =C2=B1 46%    +671.9%       1420 =C2=B1 57%  sched_debug.cfs_rq[=
42]:/.avg->runnable_avg_sum
      3.25 =C2=B1 66%    +823.1%      30.00 =C2=B1 59%  sched_debug.cfs_rq[=
42]:/.tg_runnable_contrib
     69.67 =C2=B1 57%    +310.2%     285.75 =C2=B1 60%  sched_debug.cfs_rq[=
46]:/.blocked_load_avg
     69.67 =C2=B1 57%    +310.2%     285.75 =C2=B1 60%  sched_debug.cfs_rq[=
46]:/.tg_load_contrib
    107.61 =C2=B1 51%    +155.0%     274.41 =C2=B1 13%  sched_debug.cfs_rq[=
49]:/.exec_clock
      3332 =C2=B1 40%     -85.4%     487.59 =C2=B1 87%  sched_debug.cfs_rq[=
4]:/.exec_clock
     16.00 =C2=B1104%   +1359.4%     233.50 =C2=B1 81%  sched_debug.cfs_rq[=
53]:/.blocked_load_avg
     16.00 =C2=B1104%   +1360.9%     233.75 =C2=B1 81%  sched_debug.cfs_rq[=
53]:/.tg_load_contrib
      2502 =C2=B1 21%     +74.1%       4357 =C2=B1 22%  sched_debug.cfs_rq[=
5]:/.min_vruntime
    308.22 =C2=B1 17%     -53.7%     142.65 =C2=B1 64%  sched_debug.cfs_rq[=
60]:/.exec_clock
     91.55 =C2=B1 65%    +530.7%     577.43 =C2=B1 93%  sched_debug.cfs_rq[=
61]:/.exec_clock
      1023 =C2=B1 55%    +205.9%       3130 =C2=B1 47%  sched_debug.cfs_rq[=
61]:/.min_vruntime
     10369 =C2=B1  2%     -14.2%       8892 =C2=B1  6%  sched_debug.cfs_rq[=
63]:/.tg_load_avg
      2143 =C2=B1  6%     -11.1%       1905 =C2=B1  7%  sched_debug.cfs_rq[=
64]:/.tg->runnable_avg
     10383 =C2=B1  2%     -15.9%       8727 =C2=B1  4%  sched_debug.cfs_rq[=
64]:/.tg_load_avg
     76765 =C2=B1 94%     -98.9%     872.14 =C2=B1 62%  sched_debug.cfs_rq[=
65]:/.exec_clock
      2142 =C2=B1  6%     -11.1%       1905 =C2=B1  7%  sched_debug.cfs_rq[=
65]:/.tg->runnable_avg
     10306 =C2=B1  3%     -16.6%       8596 =C2=B1  6%  sched_debug.cfs_rq[=
65]:/.tg_load_avg
      2144 =C2=B1  6%     -10.9%       1912 =C2=B1  7%  sched_debug.cfs_rq[=
66]:/.tg->runnable_avg
     10312 =C2=B1  3%     -16.6%       8599 =C2=B1  6%  sched_debug.cfs_rq[=
66]:/.tg_load_avg
      2151 =C2=B1  6%     -11.1%       1913 =C2=B1  7%  sched_debug.cfs_rq[=
67]:/.tg->runnable_avg
     10302 =C2=B1  3%     -16.8%       8568 =C2=B1  7%  sched_debug.cfs_rq[=
67]:/.tg_load_avg
      2150 =C2=B1  6%     -10.8%       1917 =C2=B1  7%  sched_debug.cfs_rq[=
68]:/.tg->runnable_avg
     10242 =C2=B1  3%     -16.9%       8516 =C2=B1  7%  sched_debug.cfs_rq[=
68]:/.tg_load_avg
      2152 =C2=B1  6%     -11.2%       1911 =C2=B1  6%  sched_debug.cfs_rq[=
69]:/.tg->runnable_avg
     10201 =C2=B1  3%     -17.4%       8430 =C2=B1  7%  sched_debug.cfs_rq[=
69]:/.tg_load_avg
      2154 =C2=B1  6%     -11.3%       1910 =C2=B1  6%  sched_debug.cfs_rq[=
70]:/.tg->runnable_avg
     10132 =C2=B1  4%     -17.3%       8379 =C2=B1  7%  sched_debug.cfs_rq[=
70]:/.tg_load_avg
      2159 =C2=B1  5%     -11.3%       1914 =C2=B1  6%  sched_debug.cfs_rq[=
71]:/.tg->runnable_avg
     10119 =C2=B1  4%     -16.9%       8411 =C2=B1  7%  sched_debug.cfs_rq[=
71]:/.tg_load_avg
    251.79 =C2=B1 15%     -37.9%     156.44 =C2=B1 37%  sched_debug.cfs_rq[=
72]:/.exec_clock
      2161 =C2=B1  5%     -11.2%       1919 =C2=B1  6%  sched_debug.cfs_rq[=
72]:/.tg->runnable_avg
     10119 =C2=B1  4%     -16.7%       8429 =C2=B1  7%  sched_debug.cfs_rq[=
72]:/.tg_load_avg
      2123 =C2=B1 48%     +76.5%       3748 =C2=B1 22%  sched_debug.cfs_rq[=
73]:/.min_vruntime
      2164 =C2=B1  5%     -11.5%       1916 =C2=B1  6%  sched_debug.cfs_rq[=
73]:/.tg->runnable_avg
     10167 =C2=B1  4%     -17.5%       8389 =C2=B1  8%  sched_debug.cfs_rq[=
73]:/.tg_load_avg
      2816 =C2=B1 62%     -60.7%       1106 =C2=B1 47%  sched_debug.cfs_rq[=
74]:/.min_vruntime
      2169 =C2=B1  5%     -11.5%       1921 =C2=B1  6%  sched_debug.cfs_rq[=
74]:/.tg->runnable_avg
     10166 =C2=B1  3%     -17.5%       8388 =C2=B1  8%  sched_debug.cfs_rq[=
74]:/.tg_load_avg
      2167 =C2=B1  6%     -11.5%       1918 =C2=B1  6%  sched_debug.cfs_rq[=
75]:/.tg->runnable_avg
     10141 =C2=B1  3%     -18.1%       8304 =C2=B1  7%  sched_debug.cfs_rq[=
75]:/.tg_load_avg
      2165 =C2=B1  6%     -11.6%       1915 =C2=B1  6%  sched_debug.cfs_rq[=
76]:/.tg->runnable_avg
     10115 =C2=B1  3%     -18.3%       8261 =C2=B1  7%  sched_debug.cfs_rq[=
76]:/.tg_load_avg
    164.34 =C2=B1 26%     +61.6%     265.63 =C2=B1 31%  sched_debug.cfs_rq[=
77]:/.exec_clock
      1944 =C2=B1 19%     +92.2%       3736 =C2=B1 44%  sched_debug.cfs_rq[=
77]:/.min_vruntime
      2165 =C2=B1  6%     -11.5%       1917 =C2=B1  7%  sched_debug.cfs_rq[=
77]:/.tg->runnable_avg
      9935 =C2=B1  2%     -17.0%       8243 =C2=B1  7%  sched_debug.cfs_rq[=
77]:/.tg_load_avg
      2169 =C2=B1  6%     -11.5%       1920 =C2=B1  6%  sched_debug.cfs_rq[=
78]:/.tg->runnable_avg
      9924 =C2=B1  2%     -16.6%       8276 =C2=B1  7%  sched_debug.cfs_rq[=
78]:/.tg_load_avg
      2170 =C2=B1  6%     -11.3%       1924 =C2=B1  6%  sched_debug.cfs_rq[=
79]:/.tg->runnable_avg
      9901 =C2=B1  3%     -16.2%       8301 =C2=B1  7%  sched_debug.cfs_rq[=
79]:/.tg_load_avg
      3130 =C2=B1 24%     +84.8%       5784 =C2=B1 22%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     54.00 =C2=B1155%    +502.8%     325.50 =C2=B1 71%  sched_debug.cfs_rq[=
8]:/.blocked_load_avg
      0.75 =C2=B1110%    +233.3%       2.50 =C2=B1 20%  sched_debug.cfs_rq[=
8]:/.nr_spread_over
     54.00 =C2=B1155%    +510.6%     329.75 =C2=B1 70%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
    463.50 =C2=B1 17%    +284.5%       1782 =C2=B1 23%  sched_debug.cfs_rq[=
9]:/.avg->runnable_avg_sum
      9.25 =C2=B1 15%    +313.5%      38.25 =C2=B1 25%  sched_debug.cfs_rq[=
9]:/.tg_runnable_contrib
     10937 =C2=B1 12%     +33.6%      14607 =C2=B1 12%  sched_debug.cpu#1.n=
r_load_updates
      7725 =C2=B1  6%     +24.0%       9575 =C2=B1 10%  sched_debug.cpu#13.=
nr_load_updates
      1854 =C2=B1 67%    +752.3%      15802 =C2=B1 63%  sched_debug.cpu#13.=
nr_switches
      2061 =C2=B1 54%    +672.2%      15918 =C2=B1 64%  sched_debug.cpu#13.=
sched_count
    872.75 =C2=B1 67%    +785.0%       7723 =C2=B1 63%  sched_debug.cpu#13.=
sched_goidle
    277.25 =C2=B1 34%    +315.5%       1152 =C2=B1 51%  sched_debug.cpu#13.=
ttwu_local
      4484 =C2=B1114%    +270.1%      16600 =C2=B1 96%  sched_debug.cpu#21.=
nr_switches
      2158 =C2=B1115%    +280.1%       8205 =C2=B1 97%  sched_debug.cpu#21.=
sched_goidle
      7863 =C2=B1  9%     +20.8%       9497 =C2=B1 13%  sched_debug.cpu#25.=
nr_load_updates
      7848 =C2=B1 15%     +59.2%      12495 =C2=B1 24%  sched_debug.cpu#29.=
nr_load_updates
      3109 =C2=B1103%    +326.7%      13267 =C2=B1 75%  sched_debug.cpu#29.=
nr_switches
      3510 =C2=B1 85%    +288.3%      13631 =C2=B1 71%  sched_debug.cpu#29.=
sched_count
      1502 =C2=B1105%    +280.4%       5714 =C2=B1 75%  sched_debug.cpu#29.=
sched_goidle
      1473 =C2=B1 97%    +293.8%       5803 =C2=B1 54%  sched_debug.cpu#29.=
ttwu_count
    708.25 =C2=B1119%    +352.6%       3205 =C2=B1 65%  sched_debug.cpu#29.=
ttwu_local
      2741 =C2=B1 40%     -50.6%       1353 =C2=B1 35%  sched_debug.cpu#32.=
nr_switches
      2747 =C2=B1 40%     -50.5%       1358 =C2=B1 35%  sched_debug.cpu#32.=
sched_count
      1285 =C2=B1 43%     -53.4%     598.50 =C2=B1 34%  sched_debug.cpu#32.=
sched_goidle
      6713 =C2=B1  2%     +10.3%       7406 =C2=B1  2%  sched_debug.cpu#37.=
nr_load_updates
    701.00 =C2=B1 54%    +589.1%       4830 =C2=B1 52%  sched_debug.cpu#37.=
nr_switches
    707.50 =C2=B1 54%    +583.7%       4837 =C2=B1 52%  sched_debug.cpu#37.=
sched_count
    306.50 =C2=B1 55%    +650.9%       2301 =C2=B1 55%  sched_debug.cpu#37.=
sched_goidle
    292.25 =C2=B1 64%    +743.1%       2464 =C2=B1112%  sched_debug.cpu#37.=
ttwu_count
    178.00 =C2=B1 61%    +125.3%     401.00 =C2=B1  4%  sched_debug.cpu#37.=
ttwu_local
     17407 =C2=B1 65%     -65.6%       5986 =C2=B1 43%  sched_debug.cpu#4.n=
r_switches
    406.25 =C2=B1 81%   +1106.8%       4902 =C2=B1 98%  sched_debug.cpu#41.=
ttwu_count
    179.25 =C2=B1 57%    +119.2%     393.00 =C2=B1 11%  sched_debug.cpu#41.=
ttwu_local
      3.50 =C2=B1 14%     -35.7%       2.25 =C2=B1 19%  sched_debug.cpu#42.=
nr_uninterruptible
      2593 =C2=B1 74%     -55.7%       1148 =C2=B1 32%  sched_debug.cpu#47.=
nr_switches
      2599 =C2=B1 74%     -55.6%       1153 =C2=B1 32%  sched_debug.cpu#47.=
sched_count
    766.00 =C2=B1 53%    +551.0%       4986 =C2=B1 76%  sched_debug.cpu#49.=
nr_switches
    344.00 =C2=B1 52%    +603.2%       2419 =C2=B1 78%  sched_debug.cpu#49.=
sched_goidle
    693.75 =C2=B1133%    +671.1%       5349 =C2=B1 96%  sched_debug.cpu#49.=
ttwu_count
      8119 =C2=B1  7%     +23.0%       9984 =C2=B1 16%  sched_debug.cpu#5.n=
r_load_updates
      2417 =C2=B1 52%    +516.7%      14908 =C2=B1 68%  sched_debug.cpu#5.n=
r_switches
      2712 =C2=B1 40%    +463.7%      15290 =C2=B1 64%  sched_debug.cpu#5.s=
ched_count
      1116 =C2=B1 55%    +557.1%       7336 =C2=B1 69%  sched_debug.cpu#5.s=
ched_goidle
    714.75 =C2=B1 53%    +124.5%       1604 =C2=B1 19%  sched_debug.cpu#57.=
nr_switches
    720.00 =C2=B1 52%    +123.6%       1609 =C2=B1 19%  sched_debug.cpu#57.=
sched_count
    313.75 =C2=B1 53%    +132.7%     730.00 =C2=B1 20%  sched_debug.cpu#57.=
sched_goidle
    289.75 =C2=B1 80%    +463.1%       1631 =C2=B1 86%  sched_debug.cpu#57.=
ttwu_count
      4164 =C2=B1 83%     -80.4%     815.25 =C2=B1 49%  sched_debug.cpu#60.=
nr_switches
      2008 =C2=B1 86%     -82.0%     362.50 =C2=B1 49%  sched_debug.cpu#60.=
sched_goidle
    800.25 =C2=B1 44%     +59.8%       1279 =C2=B1  9%  sched_debug.cpu#61.=
nr_switches
    807.00 =C2=B1 43%     +59.1%       1284 =C2=B1  9%  sched_debug.cpu#61.=
sched_count
      1338 =C2=B1138%    +556.8%       8791 =C2=B1 31%  sched_debug.cpu#61.=
ttwu_count
    167.25 =C2=B1 60%    +112.6%     355.50 =C2=B1  5%  sched_debug.cpu#61.=
ttwu_local
     -0.50 =C2=B1-300%    -450.0%       1.75 =C2=B1 24%  sched_debug.cpu#63=
.nr_uninterruptible
    339.75 =C2=B1  8%     -12.3%     298.00 =C2=B1  8%  sched_debug.cpu#63.=
ttwu_local
      5420 =C2=B1 77%    +239.4%      18395 =C2=B1 39%  sched_debug.cpu#65.=
nr_switches
      6364 =C2=B1 57%    +193.7%      18690 =C2=B1 39%  sched_debug.cpu#65.=
sched_count
      2557 =C2=B1 83%    +256.1%       9106 =C2=B1 39%  sched_debug.cpu#65.=
sched_goidle
    978.50 =C2=B1  9%     +37.9%       1349 =C2=B1 19%  sched_debug.cpu#68.=
ttwu_count
    735.75 =C2=B1 50%    +117.2%       1597 =C2=B1 32%  sched_debug.cpu#73.=
nr_switches
    741.50 =C2=B1 50%    +116.1%       1602 =C2=B1 32%  sched_debug.cpu#73.=
sched_count
    300.50 =C2=B1 55%    +140.0%     721.25 =C2=B1 36%  sched_debug.cpu#73.=
sched_goidle
    214.75 =C2=B1 54%     +65.1%     354.50 =C2=B1  5%  sched_debug.cpu#73.=
ttwu_local
      9.75 =C2=B1 37%     -71.8%       2.75 =C2=B1136%  sched_debug.cpu#77.=
nr_uninterruptible
    960.50 =C2=B1117%    +508.8%       5848 =C2=B1 91%  sched_debug.cpu#77.=
ttwu_count
      1309 =C2=B1 14%     +54.1%       2018 =C2=B1 29%  sched_debug.cpu#8.t=
twu_count
    388.00 =C2=B1  6%    +104.0%     791.50 =C2=B1 45%  sched_debug.cpu#8.t=
twu_local
      2319 =C2=B1 56%    +210.3%       7198 =C2=B1 39%  sched_debug.cpu#9.n=
r_switches
      2514 =C2=B1 47%    +197.1%       7472 =C2=B1 33%  sched_debug.cpu#9.s=
ched_count
      1064 =C2=B1 57%    +189.9%       3085 =C2=B1 32%  sched_debug.cpu#9.s=
ched_goidle


lkp-wsx02: Westmere-EX
Memory: 128G




                             aim9.creat-clo.ops_per_sec

  600000 ++-------------------*---*---*------------------------------------=
-+
         *.*.*.*.*.*    *.*.*   *   *   *..*.*.*.*.*.*.*.*.*.*.  .*.*.*.*.*=
.*
  500000 ++        :    :       O O O O O      O   O O O O O O O.     O    =
 |
         O O     O :    O O O O            O O                      O      =
 |
         |   O O   O: O :                        O                O        =
 |
  400000 ++         :  :                                                   =
 |
         |          :  :                                                   =
 |
  300000 ++         :  :                                                   =
 |
         |           : :                                                   =
 |
  200000 ++          : :                                                   =
 |
         |           : :                                                   =
 |
         |           ::                                                    =
 |
  100000 ++           :                                                    =
 |
         |            :                                                    =
 |
       0 ++-----------*----------------------------------------------------=
-+

	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tes=
ts.git
        cd lkp-tests
        bin/lkp install job.yaml  # job file is attached in this email
        bin/lkp run     job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Ying Huang

--===============3100417548769755913==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogYWltOQpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IGFjdGl2YXRlLW1vbml0b3IK
ICBrbXNnOiAKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0
OiAKICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJv
Yy1zdGF0OgogICAgaW50ZXJ2YWw6IDEwCiAgbWVtaW5mbzogCiAgc2xhYmluZm86IAogIGludGVy
cnVwdHM6IAogIGxvY2tfc3RhdDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGlycXM6IAogIGJk
aV9kZXZfbWFwcGluZzogCiAgZGlza3N0YXRzOiAKICBuZnNzdGF0OiAKICBjcHVpZGxlOiAKICBj
cHVmcmVxLXN0YXRzOiAKICB0dXJib3N0YXQ6IAogIHBtZXRlcjogCiAgc2NoZWRfZGVidWc6CiAg
ICBpbnRlcnZhbDogNjAKY3B1ZnJlcV9nb3Zlcm5vcjogcGVyZm9ybWFuY2UKZGVmYXVsdC13YXRj
aGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IDY0MjkxZjdkYjViZDgx
NTBhNzRhZDIwMzZmMTAzN2U2YTA0MjhkZjIKbW9kZWw6IFdlc3RtZXJlLUVYCm1lbW9yeTogMTI4
Rwpucl9jcHU6IDgwCm5yX2hkZF9wYXJ0aXRpb25zOiAwCmhkZF9wYXJ0aXRpb25zOiAKc3dhcF9w
YXJ0aXRpb25zOiAKcm9vdGZzX3BhcnRpdGlvbjogCmNhdGVnb3J5OiBiZW5jaG1hcmsKYWltOToK
ICB0ZXN0dGltZTogMzAwcwogIHRlc3Q6IGNyZWF0LWNsbwpxdWV1ZTogY3ljbGljCnRlc3Rib3g6
IGxrcC13c3gwMgp0Ym94X2dyb3VwOiBsa3Atd3N4MDIKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5x
dWV1ZV90aW1lOiAyMDE1LTA4LTMxIDIwOjE0OjA3LjM2NDE3NjcxMCArMDg6MDAKaWQ6IGQ0NTQy
ZmVjYzE0YThjM2I0ODE2M2Y1Nzk1ZDgxMTE5MzcyMmVmYTgKdXNlcjogbGtwCmNvbXBpbGVyOiBn
Y2MtNC45CmhlYWRfY29tbWl0OiAyZDExYzY3NWUyYzMyOGExNzYzZDRmYmFkN2I2Njg0ODc5Zjgx
MDJhCmJhc2VfY29tbWl0OiA2NDI5MWY3ZGI1YmQ4MTUwYTc0YWQyMDM2ZjEwMzdlNmEwNDI4ZGYy
CmJyYW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUwODMxMDUKa2VybmVsOiAiL3Br
Zy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzY0MjkxZjdkYjViZDgxNTBhNzRhZDIwMzZmMTAz
N2U2YTA0MjhkZjIvdm1saW51ei00LjIuMCIKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDIt
MDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9haW05L3BlcmZvcm1hbmNlLTMwMHMtY3JlYXQt
Y2xvL2xrcC13c3gwMi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2dj
Yy00LjkvNjQyOTFmN2RiNWJkODE1MGE3NGFkMjAzNmYxMDM3ZTZhMDQyOGRmMi8wIgpqb2JfZmls
ZTogIi9sa3Avc2NoZWR1bGVkL2xrcC13c3gwMi9jeWNsaWNfYWltOS1wZXJmb3JtYW5jZS0zMDBz
LWNyZWF0LWNsby14ODZfNjQtcmhlbC1DWUNMSUNfQkFTRS02NDI5MWY3ZGI1YmQ4MTUwYTc0YWQy
MDM2ZjEwMzdlNmEwNDI4ZGYyLTIwMTUwODMxLTYzMDUxLTExN3NxcXMtMC55YW1sIgpkZXF1ZXVl
X3RpbWU6IDIwMTUtMDgtMzEgMjE6MjA6NDAuNzQzMjEzMTExICswODowMAptYXhfdXB0aW1lOiAx
NjU1LjQ0CmluaXRyZDogIi9vc2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6Igpib290bG9hZGVyX2FwcGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9i
PS9sa3Avc2NoZWR1bGVkL2xrcC13c3gwMi9jeWNsaWNfYWltOS1wZXJmb3JtYW5jZS0zMDBzLWNy
ZWF0LWNsby14ODZfNjQtcmhlbC1DWUNMSUNfQkFTRS02NDI5MWY3ZGI1YmQ4MTUwYTc0YWQyMDM2
ZjEwMzdlNmEwNDI4ZGYyLTIwMTUwODMxLTYzMDUxLTExN3NxcXMtMC55YW1sCi0gQVJDSD14ODZf
NjQKLSBrY29uZmlnPXg4Nl82NC1yaGVsCi0gYnJhbmNoPWxpbnV4LWRldmVsL2RldmVsLWhvdXJs
eS0yMDE1MDgzMTA1Ci0gY29tbWl0PTY0MjkxZjdkYjViZDgxNTBhNzRhZDIwMzZmMTAzN2U2YTA0
MjhkZjIKLSBCT09UX0lNQUdFPS9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS82NDI5MWY3
ZGI1YmQ4MTUwYTc0YWQyMDM2ZjEwMzdlNmEwNDI4ZGYyL3ZtbGludXotNC4yLjAKLSBtYXhfdXB0
aW1lPTE2NTUKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L2FpbTkvcGVyZm9ybWFuY2UtMzAwcy1jcmVh
dC1jbG8vbGtwLXdzeDAyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwv
Z2NjLTQuOS82NDI5MWY3ZGI1YmQ4MTUwYTc0YWQyMDM2ZjEwMzdlNmEwNDI4ZGYyLzAKLSBMS1Bf
U0VSVkVSPWlubgotIHwyLQoKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9n
X2xldmVsPWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRh
dGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9
MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFt
ZGlzaz0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAg
cncKbGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDog
Ii9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS82NDI5MWY3ZGI1YmQ4MTUwYTc0YWQyMDM2
ZjEwMzdlNmEwNDI4ZGYyL21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2Rl
Ymlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlh
bi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVy
Ym9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvYWltOS14ODZfNjQuY2d6Igpqb2Jfc3RhdGU6IGZp
bmlzaGVkCmxvYWRhdmc6IDAuOTMgMC43MCAwLjMzIDEvNzYzIDEwOTc2CnN0YXJ0X3RpbWU6ICcx
NDQxMDI3MzIxJwplbmRfdGltZTogJzE0NDEwMjc2MjEnCnZlcnNpb246ICIvbGtwL2xrcC8uc3Jj
LTIwMTUwODMxLTE3NDExMiIK

--===============3100417548769755913==
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
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2NC9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTY1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2Ny9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTY4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzAv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU3MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzMvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU3NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzYvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU3Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTc4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzkvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK

--===============3100417548769755913==--

