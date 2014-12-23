Content-Type: multipart/mixed; boundary="===============4502718820130145382=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [sched] a15b12ac36a: -46.9% time.voluntary_context_switches +1.5% will-it-scale.per_process_ops
Date: Tue, 23 Dec 2014 13:15:54 +0800
Message-ID: <1419311754.26403.51.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4502718820130145382==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit a15b12ac36ad4e7b856a4ae54937ae26a51aebad ("sched: Do not stop cpu in=
 set_cpus_allowed_ptr() if task is not running")

testbox/testcase/testparams: lkp-g5/will-it-scale/performance-lock1

1ba93d42727c4400  a15b12ac36ad4e7b856a4ae549  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

   1517261 =C2=B1  0%      +1.5%    1539994 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
       247 =C2=B1 30%    +131.8%        573 =C2=B1 49%  sched_debug.cpu#61.=
ttwu_count
       225 =C2=B1 22%    +142.8%        546 =C2=B1 34%  sched_debug.cpu#81.=
ttwu_local
     15115 =C2=B1 44%     +37.3%      20746 =C2=B1 40%  numa-meminfo.node7.=
Active
      1028 =C2=B1 38%    +115.3%       2214 =C2=B1 36%  sched_debug.cpu#16.=
ttwu_local
         2 =C2=B1 19%    +133.3%          5 =C2=B1 43%  sched_debug.cpu#89.=
cpu_load[3]
        21 =C2=B1 45%     +88.2%         40 =C2=B1 23%  sched_debug.cfs_rq[=
99]:/.tg_load_contrib
       414 =C2=B1 33%     +98.6%        823 =C2=B1 28%  sched_debug.cpu#81.=
ttwu_count
         4 =C2=B1 10%     +88.2%          8 =C2=B1 12%  sched_debug.cfs_rq[=
33]:/.runnable_load_avg
        22 =C2=B1 26%     +80.9%         40 =C2=B1 24%  sched_debug.cfs_rq[=
103]:/.tg_load_contrib
         7 =C2=B1 17%     -41.4%          4 =C2=B1 25%  sched_debug.cfs_rq[=
41]:/.load
         7 =C2=B1 17%     -37.9%          4 =C2=B1 19%  sched_debug.cpu#41.=
load
         3 =C2=B1 22%    +106.7%          7 =C2=B1 10%  sched_debug.cfs_rq[=
36]:/.runnable_load_avg
       174 =C2=B1 13%     +48.7%        259 =C2=B1 31%  sched_debug.cpu#112=
.ttwu_count
         4 =C2=B1 19%     +88.9%          8 =C2=B1  5%  sched_debug.cfs_rq[=
35]:/.runnable_load_avg
       260 =C2=B1 10%     +55.6%        405 =C2=B1 26%  numa-vmstat.node3.n=
r_anon_pages
      1042 =C2=B1 10%     +56.0%       1626 =C2=B1 26%  numa-meminfo.node3.=
AnonPages
        26 =C2=B1 22%     +74.3%         45 =C2=B1 16%  sched_debug.cfs_rq[=
65]:/.tg_load_contrib
        21 =C2=B1 43%     +71.3%         37 =C2=B1 26%  sched_debug.cfs_rq[=
100]:/.tg_load_contrib
      3686 =C2=B1 21%     +40.2%       5167 =C2=B1 19%  sched_debug.cpu#16.=
ttwu_count
       142 =C2=B1  9%     +34.4%        191 =C2=B1 24%  sched_debug.cpu#112=
.ttwu_local
         5 =C2=B1 18%     +69.6%          9 =C2=B1 15%  sched_debug.cfs_rq[=
35]:/.load
         2 =C2=B1 30%    +100.0%          5 =C2=B1 37%  sched_debug.cpu#106=
.cpu_load[1]
         3 =C2=B1 23%    +100.0%          6 =C2=B1 48%  sched_debug.cpu#106=
.cpu_load[2]
         5 =C2=B1 18%     +69.6%          9 =C2=B1 15%  sched_debug.cpu#35.=
load
         9 =C2=B1 20%     +48.6%         13 =C2=B1 16%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
      1727 =C2=B1 15%     +43.9%       2484 =C2=B1 30%  sched_debug.cpu#34.=
ttwu_local
        10 =C2=B1 17%     -40.5%          6 =C2=B1 13%  sched_debug.cpu#41.=
cpu_load[0]
        10 =C2=B1 14%     -29.3%          7 =C2=B1  5%  sched_debug.cpu#45.=
cpu_load[4]
        10 =C2=B1 17%     -33.3%          7 =C2=B1 10%  sched_debug.cpu#41.=
cpu_load[1]
      6121 =C2=B1  8%     +56.7%       9595 =C2=B1 30%  sched_debug.cpu#13.=
sched_goidle
        13 =C2=B1  8%     -25.9%         10 =C2=B1 17%  sched_debug.cpu#39.=
cpu_load[2]
        12 =C2=B1 16%     -24.0%          9 =C2=B1 15%  sched_debug.cpu#37.=
cpu_load[2]
       492 =C2=B1 17%     -21.3%        387 =C2=B1 24%  sched_debug.cpu#46.=
ttwu_count
      3761 =C2=B1 11%     -23.9%       2863 =C2=B1 15%  sched_debug.cpu#93.=
curr->pid
       570 =C2=B1 19%     +43.2%        816 =C2=B1 17%  sched_debug.cpu#86.=
ttwu_count
      5279 =C2=B1  8%     +63.5%       8631 =C2=B1 33%  sched_debug.cpu#13.=
ttwu_count
       377 =C2=B1 22%     -28.6%        269 =C2=B1 14%  sched_debug.cpu#46.=
ttwu_local
      5396 =C2=B1 10%     +29.9%       7007 =C2=B1 14%  sched_debug.cpu#16.=
sched_goidle
      1959 =C2=B1 12%     +36.9%       2683 =C2=B1 15%  numa-vmstat.node2.n=
r_slab_reclaimable
      7839 =C2=B1 12%     +37.0%      10736 =C2=B1 15%  numa-meminfo.node2.=
SReclaimable
         5 =C2=B1 15%     +66.7%          8 =C2=B1  9%  sched_debug.cfs_rq[=
33]:/.load
         5 =C2=B1 25%     +47.8%          8 =C2=B1 10%  sched_debug.cfs_rq[=
37]:/.load
         2 =C2=B1  0%     +87.5%          3 =C2=B1 34%  sched_debug.cpu#89.=
cpu_load[4]
         5 =C2=B1 15%     +66.7%          8 =C2=B1  9%  sched_debug.cpu#33.=
load
         6 =C2=B1 23%     +41.7%          8 =C2=B1 10%  sched_debug.cpu#37.=
load
         8 =C2=B1 10%     -26.5%          6 =C2=B1  6%  sched_debug.cpu#51.=
cpu_load[1]
      7300 =C2=B1 37%     +63.6%      11943 =C2=B1 16%  softirqs.TASKLET
      2984 =C2=B1  6%     +43.1%       4271 =C2=B1 23%  sched_debug.cpu#20.=
ttwu_count
       328 =C2=B1  4%     +40.5%        462 =C2=B1 25%  sched_debug.cpu#26.=
ttwu_local
        10 =C2=B1  7%     -27.5%          7 =C2=B1  5%  sched_debug.cpu#43.=
cpu_load[3]
         9 =C2=B1  8%     -30.8%          6 =C2=B1  6%  sched_debug.cpu#41.=
cpu_load[3]
         9 =C2=B1  8%     -27.0%          6 =C2=B1  6%  sched_debug.cpu#41.=
cpu_load[4]
        10 =C2=B1 14%     -32.5%          6 =C2=B1  6%  sched_debug.cpu#41.=
cpu_load[2]
     16292 =C2=B1  6%     +42.8%      23260 =C2=B1 25%  sched_debug.cpu#13.=
nr_switches
        14 =C2=B1 28%     +55.9%         23 =C2=B1  8%  sched_debug.cpu#99.=
cpu_load[0]
         5 =C2=B1  8%     +28.6%          6 =C2=B1 12%  sched_debug.cpu#17.=
load
        13 =C2=B1  7%     -23.1%         10 =C2=B1 12%  sched_debug.cpu#39.=
cpu_load[3]
         7 =C2=B1 10%     -35.7%          4 =C2=B1 11%  sched_debug.cfs_rq[=
45]:/.runnable_load_avg
      5076 =C2=B1 13%     -21.8%       3970 =C2=B1 11%  numa-vmstat.node0.n=
r_slab_unreclaimable
     20306 =C2=B1 13%     -21.8%      15886 =C2=B1 11%  numa-meminfo.node0.=
SUnreclaim
        10 =C2=B1 10%     -28.6%          7 =C2=B1  6%  sched_debug.cpu#45.=
cpu_load[3]
        11 =C2=B1 11%     -29.5%          7 =C2=B1 14%  sched_debug.cpu#45.=
cpu_load[1]
        10 =C2=B1 12%     -26.8%          7 =C2=B1  6%  sched_debug.cpu#44.=
cpu_load[1]
        10 =C2=B1 10%     -28.6%          7 =C2=B1  6%  sched_debug.cpu#44.=
cpu_load[0]
         7 =C2=B1 17%     +48.3%         10 =C2=B1  7%  sched_debug.cfs_rq[=
11]:/.runnable_load_avg
        11 =C2=B1 12%     -34.1%          7 =C2=B1 11%  sched_debug.cpu#47.=
cpu_load[0]
        10 =C2=B1 10%     -27.9%          7 =C2=B1  5%  sched_debug.cpu#47.=
cpu_load[1]
        10 =C2=B1  8%     -26.8%          7 =C2=B1 11%  sched_debug.cpu#47.=
cpu_load[2]
        10 =C2=B1  8%     -28.6%          7 =C2=B1 14%  sched_debug.cpu#43.=
cpu_load[0]
        10 =C2=B1 10%     -27.9%          7 =C2=B1 10%  sched_debug.cpu#43.=
cpu_load[1]
        10 =C2=B1 10%     -28.6%          7 =C2=B1  6%  sched_debug.cpu#43.=
cpu_load[2]
     12940 =C2=B1  3%     +49.8%      19387 =C2=B1 35%  numa-meminfo.node2.=
Active(anon)
      3235 =C2=B1  2%     +49.8%       4844 =C2=B1 35%  numa-vmstat.node2.n=
r_active_anon
        17 =C2=B1 17%     +36.6%         24 =C2=B1  9%  sched_debug.cpu#97.=
cpu_load[2]
     14725 =C2=B1  8%     +21.8%      17928 =C2=B1 11%  sched_debug.cpu#16.=
nr_switches
       667 =C2=B1 10%     +45.3%        969 =C2=B1 22%  sched_debug.cpu#17.=
ttwu_local
      3257 =C2=B1  5%     +22.4%       3988 =C2=B1 11%  sched_debug.cpu#118=
.curr->pid
      3144 =C2=B1 15%     -20.7%       2493 =C2=B1  8%  sched_debug.cpu#95.=
curr->pid
      2192 =C2=B1 11%     +50.9%       3308 =C2=B1 37%  sched_debug.cpu#18.=
ttwu_count
         6 =C2=B1 11%     +37.5%          8 =C2=B1 19%  sched_debug.cfs_rq[=
22]:/.load
        12 =C2=B1  5%     +27.1%         15 =C2=B1  8%  sched_debug.cpu#5.c=
pu_load[1]
        11 =C2=B1 12%     -23.4%          9 =C2=B1 13%  sched_debug.cpu#37.=
cpu_load[3]
         6 =C2=B1 11%     +37.5%          8 =C2=B1 19%  sched_debug.cpu#22.=
load
         8 =C2=B1  8%     -25.0%          6 =C2=B1  0%  sched_debug.cpu#51.=
cpu_load[2]
         7 =C2=B1  6%     -20.0%          6 =C2=B1 11%  sched_debug.cpu#55.=
cpu_load[3]
        11 =C2=B1  9%     -17.4%          9 =C2=B1  9%  sched_debug.cpu#39.=
cpu_load[4]
        12 =C2=B1  5%     -22.9%          9 =C2=B1 11%  sched_debug.cpu#38.=
cpu_load[3]
       420 =C2=B1 13%     +43.0%        601 =C2=B1  9%  sched_debug.cpu#30.=
ttwu_local
      1682 =C2=B1 14%     +38.5%       2329 =C2=B1 17%  numa-meminfo.node7.=
AnonPages
       423 =C2=B1 13%     +37.0%        579 =C2=B1 16%  numa-vmstat.node7.n=
r_anon_pages
        15 =C2=B1 13%     +41.9%         22 =C2=B1  5%  sched_debug.cpu#99.=
cpu_load[1]
         6 =C2=B1 20%     +44.0%          9 =C2=B1 13%  sched_debug.cfs_rq[=
19]:/.runnable_load_avg
         9 =C2=B1  4%     -24.3%          7 =C2=B1  0%  sched_debug.cpu#43.=
cpu_load[4]
      6341 =C2=B1  7%     -19.6%       5100 =C2=B1 16%  sched_debug.cpu#43.=
curr->pid
      2577 =C2=B1 11%     -11.9%       2270 =C2=B1 10%  sched_debug.cpu#33.=
ttwu_count
        13 =C2=B1  6%     -18.5%         11 =C2=B1 12%  sched_debug.cpu#40.=
cpu_load[2]
      4828 =C2=B1  6%     +23.8%       5979 =C2=B1  6%  sched_debug.cpu#34.=
curr->pid
      4351 =C2=B1 12%     +33.9%       5824 =C2=B1 12%  sched_debug.cpu#36.=
curr->pid
        10 =C2=B1  8%     -23.8%          8 =C2=B1  8%  sched_debug.cpu#37.=
cpu_load[4]
        10 =C2=B1 14%     -28.6%          7 =C2=B1  6%  sched_debug.cpu#45.=
cpu_load[2]
        17 =C2=B1 22%     +40.6%         24 =C2=B1  7%  sched_debug.cpu#97.=
cpu_load[1]
        11 =C2=B1  9%     +21.3%         14 =C2=B1  5%  sched_debug.cpu#7.c=
pu_load[2]
        10 =C2=B1  8%     -26.2%          7 =C2=B1 10%  sched_debug.cpu#36.=
cpu_load[4]
     12853 =C2=B1  2%     +20.0%      15429 =C2=B1 11%  numa-meminfo.node2.=
AnonPages
      4744 =C2=B1  8%     +30.8%       6204 =C2=B1 11%  sched_debug.cpu#35.=
curr->pid
      3214 =C2=B1  2%     +20.0%       3856 =C2=B1 11%  numa-vmstat.node2.n=
r_anon_pages
      6181 =C2=B1  6%     +24.9%       7718 =C2=B1  9%  sched_debug.cpu#13.=
curr->pid
      6675 =C2=B1 23%     +27.5%       8510 =C2=B1 10%  sched_debug.cfs_rq[=
91]:/.tg_load_avg
    171261 =C2=B1  5%     -22.2%     133177 =C2=B1 15%  numa-numastat.node0=
.local_node
      6589 =C2=B1 21%     +29.3%       8522 =C2=B1 11%  sched_debug.cfs_rq[=
89]:/.tg_load_avg
      6508 =C2=B1 20%     +28.0%       8331 =C2=B1  8%  sched_debug.cfs_rq[=
88]:/.tg_load_avg
      6598 =C2=B1 22%     +29.2%       8525 =C2=B1 11%  sched_debug.cfs_rq[=
90]:/.tg_load_avg
       590 =C2=B1 13%     -21.4%        464 =C2=B1  7%  sched_debug.cpu#105=
.ttwu_local
    175392 =C2=B1  5%     -21.7%     137308 =C2=B1 14%  numa-numastat.node0=
.numa_hit
        11 =C2=B1  6%     -18.2%          9 =C2=B1  7%  sched_debug.cpu#38.=
cpu_load[4]
      6643 =C2=B1 23%     +27.4%       8465 =C2=B1 10%  sched_debug.cfs_rq[=
94]:/.tg_load_avg
      6764 =C2=B1  7%     +13.8%       7695 =C2=B1  7%  sched_debug.cpu#12.=
curr->pid
        29 =C2=B1 28%     +34.5%         39 =C2=B1  5%  sched_debug.cfs_rq[=
98]:/.tg_load_contrib
      1776 =C2=B1  7%     +29.4%       2298 =C2=B1 13%  sched_debug.cpu#11.=
ttwu_local
        13 =C2=B1  0%     -19.2%         10 =C2=B1  8%  sched_debug.cpu#40.=
cpu_load[3]
         7 =C2=B1  5%     -17.2%          6 =C2=B1  0%  sched_debug.cpu#51.=
cpu_load[3]
      7371 =C2=B1 20%     -18.0%       6045 =C2=B1  3%  sched_debug.cpu#1.s=
ched_goidle
     26560 =C2=B1  2%     +14.0%      30287 =C2=B1  7%  numa-meminfo.node2.=
Slab
     16161 =C2=B1  6%      -9.4%      14646 =C2=B1  1%  sched_debug.cfs_rq[=
27]:/.avg->runnable_avg_sum
       351 =C2=B1  6%      -9.3%        318 =C2=B1  1%  sched_debug.cfs_rq[=
27]:/.tg_runnable_contrib
      7753 =C2=B1 27%     -22.9%       5976 =C2=B1  5%  sched_debug.cpu#2.s=
ched_goidle
      3828 =C2=B1  9%     +17.3%       4490 =C2=B1  6%  sched_debug.cpu#23.=
sched_goidle
     23925 =C2=B1  2%     +23.0%      29419 =C2=B1 23%  numa-meminfo.node2.=
Active
        47 =C2=B1  6%     -15.8%         40 =C2=B1 19%  sched_debug.cpu#42.=
cpu_load[1]
       282 =C2=B1  5%      -9.7%        254 =C2=B1  7%  sched_debug.cfs_rq[=
109]:/.tg_runnable_contrib
       349 =C2=B1  5%      -9.3%        317 =C2=B1  1%  sched_debug.cfs_rq[=
26]:/.tg_runnable_contrib
      6941 =C2=B1  3%      +8.9%       7558 =C2=B1  7%  sched_debug.cpu#61.=
nr_switches
     16051 =C2=B1  5%      -8.9%      14618 =C2=B1  1%  sched_debug.cfs_rq[=
26]:/.avg->runnable_avg_sum
    238944 =C2=B1  3%      +9.2%     260958 =C2=B1  5%  numa-vmstat.node2.n=
uma_local
     12966 =C2=B1  5%      -9.5%      11732 =C2=B1  6%  sched_debug.cfs_rq[=
109]:/.avg->runnable_avg_sum
      1004 =C2=B1  3%      +8.2%       1086 =C2=B1  4%  sched_debug.cpu#118=
.sched_goidle
     20746 =C2=B1  4%      -8.4%      19000 =C2=B1  1%  sched_debug.cfs_rq[=
45]:/.avg->runnable_avg_sum
       451 =C2=B1  4%      -8.3%        413 =C2=B1  1%  sched_debug.cfs_rq[=
45]:/.tg_runnable_contrib
      3538 =C2=B1  4%     +17.2%       4147 =C2=B1  8%  sched_debug.cpu#26.=
ttwu_count
        16 =C2=B1  9%     +13.8%         18 =C2=B1  2%  sched_debug.cpu#99.=
cpu_load[3]
      1531 =C2=B1  0%     +11.3%       1704 =C2=B1  1%  numa-meminfo.node7.=
KernelStack
      3569 =C2=B1  3%     +17.2%       4182 =C2=B1 10%  sched_debug.cpu#24.=
sched_goidle
      1820 =C2=B1  3%     -12.5%       1594 =C2=B1  8%  slabinfo.taskstats.=
num_objs
      1819 =C2=B1  3%     -12.4%       1594 =C2=B1  8%  slabinfo.taskstats.=
active_objs
      4006 =C2=B1  5%     +19.1%       4769 =C2=B1  8%  sched_debug.cpu#17.=
sched_goidle
     21412 =C2=B1 19%     -17.0%      17779 =C2=B1  3%  sched_debug.cpu#2.n=
r_switches
        16 =C2=B1  9%     +24.2%         20 =C2=B1  4%  sched_debug.cpu#99.=
cpu_load[2]
     10493 =C2=B1  7%     +13.3%      11890 =C2=B1  4%  sched_debug.cpu#23.=
nr_switches
      1207 =C2=B1  2%     -46.9%        640 =C2=B1  4%  time.voluntary_cont=
ext_switches


                          time.voluntary_context_switches

  1300 ++-----------*--*--------------------*------------------------------=
-+
       *..*.*..*.. +      *.*..*..*.*..*..*     .*..*..*.  .*..*.*..*..    =
 |
  1200 ++         *                            *         *.            *.*.=
.*
  1100 ++                                                                  =
 |
       |                                                                   =
 |
  1000 ++                                                                  =
 |
       |                                                                   =
 |
   900 ++                                                                  =
 |
       |                                                                   =
 |
   800 ++                                                                  =
 |
   700 ++                                                                  =
 |
       O    O     O       O O  O       O  O O  O O       O       O         =
 |
   600 ++ O    O    O  O          O O                  O    O  O           =
 |
       |                                            O                      =
 |
   500 ++------------------------------------------------------------------=
-+

	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

	apt-get install ruby ruby-oj
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
Huang, Ying


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============4502718820130145382==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB3aWxsLWl0LXNjYWxlCmRlZmF1bHRfbW9uaXRvcnM6CiAgd2FpdDogcHJl
LXRlc3QKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAK
ICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1z
dGF0OiAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0
OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBk
aXNrc3RhdHM6IAogIGNwdWlkbGU6IAogIGNwdWZyZXE6IAogIHR1cmJvc3RhdDogCiAgc2NoZWRf
ZGVidWc6CiAgICBpbnRlcnZhbDogMTAKICBwbWV0ZXI6IApkZWZhdWx0X3dhdGNoZG9nczoKICB3
YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjoKLSBwZXJmb3JtYW5jZQpj
b21taXQ6IDA4ZWJlMWQ2Y2NkMTY4YmRkNTM3OWQzOWI1ZGY5MzE0YTE0NTM1MzQKbW9kZWw6IEc1
Cm5yX2NwdTogMTI4Cm1lbW9yeTogMjA0OEcKcm9vdGZzX3BhcnRpdGlvbjogCnBlcmYtcHJvZmls
ZToKICBmcmVxOiA4MDAKd2lsbC1pdC1zY2FsZToKICB0ZXN0OgogIC0gbG9jazEKdGVzdGJveDog
bGtwLWc1CnRib3hfZ3JvdXA6IGxrcC1nNQprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3Rp
bWU6IDIwMTQtMTItMTggMTU6MjU6MDguOTQyOTkyMDQ1ICswODowMApoZWFkX2NvbW1pdDogMDhl
YmUxZDZjY2QxNjhiZGQ1Mzc5ZDM5YjVkZjkzMTRhMTQ1MzUzNApiYXNlX2NvbW1pdDogYjI3NzZi
ZjcxNDliZGRkMWY0MTYxZjE0Zjc5NTIwZjE3ZmMxZDcxZApicmFuY2g6IGxpbnV4LWRldmVsL2Rl
dmVsLWhvdXJseS0yMDE0MTIxODA3Cmtlcm5lbDogIi9rZXJuZWwveDg2XzY0LXJoZWwvMDhlYmUx
ZDZjY2QxNjhiZGQ1Mzc5ZDM5YjVkZjkzMTRhMTQ1MzUzNC92bWxpbnV6LTMuMTguMC1nMDhlYmUx
ZCIKdXNlcjogbGtwCnF1ZXVlOiBjeWNsaWMKcm9vdGZzOiBkZWJpYW4teDg2XzY0LmNnegpyZXN1
bHRfcm9vdDogIi9yZXN1bHQvbGtwLWc1L3dpbGwtaXQtc2NhbGUvcGVyZm9ybWFuY2UtbG9jazEv
ZGViaWFuLXg4Nl82NC5jZ3oveDg2XzY0LXJoZWwvMDhlYmUxZDZjY2QxNjhiZGQ1Mzc5ZDM5YjVk
ZjkzMTRhMTQ1MzUzNC8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2xrcC1nNS9jeWNsaWNf
d2lsbC1pdC1zY2FsZS1wZXJmb3JtYW5jZS1sb2NrMS14ODZfNjQtcmhlbC1IRUFELTA4ZWJlMWQ2
Y2NkMTY4YmRkNTM3OWQzOWI1ZGY5MzE0YTE0NTM1MzQtMC55YW1sIgpkZXF1ZXVlX3RpbWU6IDIw
MTQtMTItMTggMjE6MDU6MTkuNjM3MDU4NDEwICswODowMApqb2Jfc3RhdGU6IGZpbmlzaGVkCmxv
YWRhdmc6IDYxLjQ1IDMyLjEzIDEzLjA5IDEvMTAxMCAyMDAwOQpzdGFydF90aW1lOiAnMTQxODkw
ODM4NScKZW5kX3RpbWU6ICcxNDE4OTA4Njk3Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE0
MTIxOC0xNDUxNTkiCg==

--===============4502718820130145382==
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
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTIwL2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTIxL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTIzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTI0L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTI2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTI3L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE1L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE4L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTkvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI1
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzAvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUzMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTMyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNC9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTM1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNy9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTM4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
NDAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQyL2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDkvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1NTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUyL2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU1L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU4L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTkv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2MS9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2NC9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTY1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2Ny9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY4L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU3MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzMvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3
NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTc1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3Ny9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTc4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1ODAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU4MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgyL2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1ODMv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU4NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1ODYvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU4Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1ODkvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1OTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5MS9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkyL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1OTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTk1L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1OTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU5Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTk4L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
OTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCi4vcnVudGVzdC5weSBsb2NrMSA4IDEgOCAxNiAy
NCAzMiA0MCA0OCA1NiA2NCA5NiAxMjgK

--===============4502718820130145382==--

