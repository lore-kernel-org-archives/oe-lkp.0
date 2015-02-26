Content-Type: multipart/mixed; boundary="===============6355461527906549294=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [vmstat] ba4877b9ca5: not primary result change, -62.5% will-it-scale.time.involuntary_context_switches
Date: Thu, 26 Feb 2015 11:10:54 +0800
Message-ID: <1424920254.10337.12.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6355461527906549294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit ba4877b9ca51f80b5d30f304a46762f0509e1635 ("vmstat: do not use deferr=
able delayed work for vmstat_update")

testbox/testcase/testparams: wsm/will-it-scale/performance-malloc1

9c0415eb8cbf0c8f  ba4877b9ca51f80b5d30f304a4  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

      1194 =C2=B1  0%     -62.5%        447 =C2=B1  7%  will-it-scale.time.=
involuntary_context_switches
       246 =C2=B1  0%      +2.3%        252 =C2=B1  1%  will-it-scale.time.=
system_time
  18001.54 =C2=B1 22%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.MIN_vruntime
  18001.54 =C2=B1 22%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.max_vruntime
   1097152 =C2=B1  3%     -82.4%     192865 =C2=B1  1%  cpuidle.C6-NHM.usage
     99560 =C2=B1 16%     +57.7%     157029 =C2=B1 23%  sched_debug.cfs_rq[=
8]:/.spread0
     27671 =C2=B1 23%     -65.9%       9439 =C2=B1  8%  sched_debug.cfs_rq[=
5]:/.exec_clock
      1194 =C2=B1  0%     -62.5%        447 =C2=B1  7%  time.involuntary_co=
ntext_switches
    247334 =C2=B1 20%     -61.2%      96086 =C2=B1  3%  sched_debug.cfs_rq[=
5]:/.min_vruntime
     20417 =C2=B1 35%     -48.7%      10473 =C2=B1  8%  sched_debug.cfs_rq[=
3]:/.exec_clock
    104076 =C2=B1 38%     +73.9%     181000 =C2=B1 30%  sched_debug.cpu#2.t=
twu_local
    180071 =C2=B1 29%     -41.3%     105641 =C2=B1 10%  sched_debug.cfs_rq[=
3]:/.min_vruntime
        34 =C2=B1 14%     -48.6%         17 =C2=B1 10%  sched_debug.cpu#5.c=
pu_load[4]
     43629 =C2=B1 18%     -32.7%      29370 =C2=B1 13%  sched_debug.cpu#3.n=
r_load_updates
     42653 =C2=B1 14%     -42.6%      24488 =C2=B1 14%  sched_debug.cpu#5.n=
r_load_updates
     13660 =C2=B1  9%     -41.4%       8010 =C2=B1  3%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
       296 =C2=B1  9%     -41.2%        174 =C2=B1  3%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
    205846 =C2=B1  6%     -11.2%     182783 =C2=B1  6%  sched_debug.cpu#7.s=
ched_count
        37 =C2=B1 10%     -38.4%         23 =C2=B1  8%  sched_debug.cpu#5.c=
pu_load[3]
      1378 =C2=B1 12%     -20.6%       1094 =C2=B1  4%  sched_debug.cpu#11.=
ttwu_local
    205691 =C2=B1  6%     -11.2%     182623 =C2=B1  6%  sched_debug.cpu#7.n=
r_switches
    102423 =C2=B1  6%     -11.2%      90915 =C2=B1  6%  sched_debug.cpu#7.s=
ched_goidle
        25 =C2=B1 21%     +41.6%         35 =C2=B1 17%  sched_debug.cpu#3.c=
pu_load[0]
        68 =C2=B1 16%     -29.3%         48 =C2=B1  9%  sched_debug.cpu#8.c=
pu_load[0]
        32 =C2=B1 14%     +54.2%         50 =C2=B1  6%  sched_debug.cpu#11.=
cpu_load[4]
       507 =C2=B1 10%     -30.0%        355 =C2=B1  3%  sched_debug.cfs_rq[=
10]:/.blocked_load_avg
     39084 =C2=B1 16%     +48.0%      57862 =C2=B1  2%  sched_debug.cfs_rq[=
11]:/.exec_clock
  10022712 =C2=B1  9%     -28.8%    7139491 =C2=B1 13%  cpuidle.C1-NHM.time
    341246 =C2=B1 14%     +47.3%     502560 =C2=B1  6%  sched_debug.cfs_rq[=
11]:/.min_vruntime
       562 =C2=B1  9%     -28.8%        400 =C2=B1  4%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
        66 =C2=B1  7%     -20.8%         52 =C2=B1 14%  sched_debug.cfs_rq[=
8]:/.runnable_load_avg
        36 =C2=B1 18%     +45.8%         52 =C2=B1  6%  sched_debug.cpu#11.=
cpu_load[3]
     43079 =C2=B1  1%      +8.0%      46513 =C2=B1  2%  softirqs.RCU
        43 =C2=B1  9%     -25.6%         32 =C2=B1 10%  sched_debug.cpu#5.c=
pu_load[2]
   1745173 =C2=B1  4%     +43.2%    2499517 =C2=B1  3%  cpuidle.C3-NHM.usage
        44 =C2=B1 18%     +25.3%         55 =C2=B1 10%  sched_debug.cpu#9.c=
pu_load[2]
     64453 =C2=B1  8%     +27.0%      81824 =C2=B1  3%  sched_debug.cpu#11.=
nr_load_updates
     58719 =C2=B1  7%     -14.3%      50299 =C2=B1  9%  sched_debug.cpu#0.t=
twu_count
        40 =C2=B1 16%     +24.7%         50 =C2=B1  3%  sched_debug.cpu#9.c=
pu_load[4]
        42 =C2=B1 16%     +26.2%         53 =C2=B1  5%  sched_debug.cpu#9.c=
pu_load[3]
     61887 =C2=B1  4%     -16.2%      51890 =C2=B1 11%  sched_debug.cpu#0.s=
ched_goidle
    125652 =C2=B1  4%     -16.1%     105434 =C2=B1 10%  sched_debug.cpu#0.n=
r_switches
    125769 =C2=B1  4%     -16.1%     105564 =C2=B1 10%  sched_debug.cpu#0.s=
ched_count
     16164 =C2=B1  7%     +35.2%      21852 =C2=B1  1%  sched_debug.cfs_rq[=
11]:/.avg->runnable_avg_sum
       352 =C2=B1  7%     +34.9%        475 =C2=B1  1%  sched_debug.cfs_rq[=
11]:/.tg_runnable_contrib
      1442 =C2=B1 11%     +20.9%       1742 =C2=B1  3%  sched_debug.cpu#11.=
curr->pid
 7.243e+08 =C2=B1  1%     +20.0%   8.69e+08 =C2=B1  3%  cpuidle.C3-NHM.time
    172138 =C2=B1  5%     +11.9%     192649 =C2=B1  6%  sched_debug.cpu#9.s=
ched_count
     85576 =C2=B1  5%     +12.0%      95879 =C2=B1  6%  sched_debug.cpu#9.s=
ched_goidle
     91826 =C2=B1  0%     +13.0%     103784 =C2=B1 11%  sched_debug.cfs_rq[=
6]:/.exec_clock
     46977 =C2=B1 15%     +21.8%      57227 =C2=B1  2%  sched_debug.cfs_rq[=
9]:/.exec_clock
    115370 =C2=B1  1%     +11.5%     128602 =C2=B1  8%  sched_debug.cpu#6.n=
r_load_updates
     67629 =C2=B1 10%     +19.7%      80928 =C2=B1  0%  sched_debug.cpu#9.n=
r_load_updates
      0.92 =C2=B1  4%      +9.2%       1.00 =C2=B1  3%  perf-profile.cpu-cy=
cles.__vma_link_rb.vma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgoff
      0.89 =C2=B1  3%      +9.5%       0.98 =C2=B1  5%  perf-profile.cpu-cy=
cles._cond_resched.unmap_single_vma.unmap_vmas.unmap_region.do_munmap
     17.84 =C2=B1  3%      -7.2%      16.56 =C2=B1  1%  turbostat.CPU%c6
     10197 =C2=B1  0%      +2.5%      10455 =C2=B1  1%  vmstat.system.in

testbox/testcase/testparams: lkp-sb03/will-it-scale/malloc1

9c0415eb8cbf0c8f  ba4877b9ca51f80b5d30f304a4  =

----------------  --------------------------  =

      2585 =C2=B1  2%     -69.2%        797 =C2=B1  8%  will-it-scale.time.=
involuntary_context_switches
     78369 =C2=B1 36%    +156.1%     200708 =C2=B1 19%  cpuidle.C3-SNB.usage
     95820 =C2=B1 11%     +60.9%     154175 =C2=B1 19%  sched_debug.cfs_rq[=
28]:/.spread0
     95549 =C2=B1 10%     +61.3%     154133 =C2=B1 20%  sched_debug.cfs_rq[=
26]:/.spread0
     95600 =C2=B1 10%     +60.3%     153220 =C2=B1 19%  sched_debug.cfs_rq[=
29]:/.spread0
     97285 =C2=B1  8%     +57.9%     153634 =C2=B1 19%  sched_debug.cfs_rq[=
31]:/.spread0
    254274 =C2=B1 29%     +39.0%     353345 =C2=B1  7%  sched_debug.cfs_rq[=
20]:/.spread0
    297854 =C2=B1  3%     +18.5%     353038 =C2=B1  8%  sched_debug.cfs_rq[=
22]:/.spread0
    298185 =C2=B1  2%     +18.1%     352124 =C2=B1  8%  sched_debug.cfs_rq[=
17]:/.spread0
    296875 =C2=B1  3%     +19.4%     354400 =C2=B1  7%  sched_debug.cfs_rq[=
18]:/.spread0
    297800 =C2=B1  3%     +18.5%     352927 =C2=B1  7%  sched_debug.cfs_rq[=
21]:/.spread0
      0.00 =C2=B1  8%    +142.4%       0.00 =C2=B1 33%  sched_debug.rt_rq[8=
]:/.rt_time
      2585 =C2=B1  2%     -69.2%        797 =C2=B1  8%  time.involuntary_co=
ntext_switches
  29637066 =C2=B1 30%    +101.3%   59653820 =C2=B1 24%  cpuidle.C3-SNB.time
        40 =C2=B1 43%    +105.5%         83 =C2=B1 14%  sched_debug.cpu#0.c=
pu_load[4]
        11 =C2=B1 26%     +91.5%         22 =C2=B1  4%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
        39 =C2=B1 40%    +104.5%         79 =C2=B1 13%  sched_debug.cpu#0.c=
pu_load[3]
       531 =C2=B1 10%     +75.1%        930 =C2=B1 44%  sched_debug.cpu#26.=
ttwu_local
        36 =C2=B1 34%     +91.1%         69 =C2=B1 12%  sched_debug.cpu#0.c=
pu_load[2]
     95262 =C2=B1 11%     +60.9%     153293 =C2=B1 18%  sched_debug.cfs_rq[=
27]:/.spread0
       120 =C2=B1 19%     -53.7%         55 =C2=B1 42%  sched_debug.cfs_rq[=
17]:/.tg_load_contrib
    278957 =C2=B1 26%     +57.1%     438311 =C2=B1 17%  cpuidle.C1E-SNB.usa=
ge
        29 =C2=B1 30%     +62.7%         48 =C2=B1 18%  sched_debug.cfs_rq[=
0]:/.load
        33 =C2=B1 27%     +66.7%         56 =C2=B1 10%  sched_debug.cpu#0.c=
pu_load[1]
        68 =C2=B1 23%     -32.2%         46 =C2=B1 18%  sched_debug.cpu#16.=
load
       295 =C2=B1  9%     +46.9%        434 =C2=B1 28%  sched_debug.cpu#17.=
ttwu_local
        16 =C2=B1 41%     +95.3%         31 =C2=B1 36%  sched_debug.cpu#7.l=
oad
        42 =C2=B1 20%     -32.2%         29 =C2=B1 16%  sched_debug.cpu#21.=
cpu_load[0]
     50555 =C2=B1 17%     -30.4%      35165 =C2=B1  3%  sched_debug.cpu#26.=
sched_count
        19 =C2=B1 25%     -24.7%         14 =C2=B1 14%  sched_debug.cpu#29.=
cpu_load[1]
     24874 =C2=B1 18%     -30.9%      17181 =C2=B1  5%  sched_debug.cpu#26.=
sched_goidle
     50298 =C2=B1 17%     -30.3%      35047 =C2=B1  3%  sched_debug.cpu#26.=
nr_switches
  34788152 =C2=B1 26%     +49.5%   52019925 =C2=B1 15%  cpuidle.C1E-SNB.time
         8 =C2=B1 37%     +87.5%         15 =C2=B1 12%  sched_debug.cpu#8.c=
pu_load[2]
     93498 =C2=B1  4%     +11.4%     104199 =C2=B1  7%  softirqs.RCU
        28 =C2=B1 24%     +44.2%         40 =C2=B1 12%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
      3508 =C2=B1  5%     +21.1%       4247 =C2=B1 11%  numa-vmstat.node1.n=
r_anon_pages
     14073 =C2=B1  6%     +20.8%      16993 =C2=B1 11%  numa-meminfo.node1.=
AnonPages
         5 =C2=B1 15%     +45.5%          8 =C2=B1  8%  sched_debug.cpu#8.c=
pu_load[4]
      1651 =C2=B1 16%     +54.6%       2554 =C2=B1 29%  sched_debug.cpu#1.t=
twu_local
        35 =C2=B1 28%     +36.9%         48 =C2=B1 17%  sched_debug.cpu#0.c=
pu_load[0]
       173 =C2=B1 12%     -17.7%        142 =C2=B1  4%  sched_debug.cfs_rq[=
14]:/.tg_runnable_contrib
     25918 =C2=B1 19%     -26.8%      18974 =C2=B1  2%  sched_debug.cpu#26.=
ttwu_count
      8010 =C2=B1 12%     -17.8%       6582 =C2=B1  4%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
         6 =C2=B1 25%     +65.4%         10 =C2=B1 12%  sched_debug.cpu#8.c=
pu_load[3]
     15670 =C2=B1 10%     +14.3%      17912 =C2=B1  9%  numa-vmstat.node1.n=
uma_other
    297389 =C2=B1  3%     +22.0%     362854 =C2=B1 11%  sched_debug.cfs_rq[=
23]:/.spread0
    297771 =C2=B1  3%     +18.8%     353825 =C2=B1  8%  sched_debug.cfs_rq[=
19]:/.spread0
      6713 =C2=B1  3%     +10.3%       7405 =C2=B1  4%  sched_debug.cfs_rq[=
11]:/.avg->runnable_avg_sum
       145 =C2=B1  3%     +10.1%        160 =C2=B1  4%  sched_debug.cfs_rq[=
11]:/.tg_runnable_contrib
      2566 =C2=B1  7%      -9.6%       2319 =C2=B1  5%  sched_debug.cpu#21.=
curr->pid
      4694 =C2=B1 10%     +14.4%       5368 =C2=B1  6%  sched_debug.cpu#0.t=
twu_local
        37 =C2=B1  8%     -19.9%         30 =C2=B1 14%  sched_debug.cpu#21.=
cpu_load[1]
     33072 =C2=B1 10%     -19.5%      26612 =C2=B1  9%  sched_debug.cpu#11.=
nr_switches
     16783 =C2=B1  8%     -20.1%      13407 =C2=B1 14%  numa-meminfo.node0.=
AnonPages
      4198 =C2=B1  7%     -19.9%       3365 =C2=B1 14%  numa-vmstat.node0.n=
r_anon_pages
      3458 =C2=B1  7%      -9.8%       3120 =C2=B1  1%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
      3451 =C2=B1  7%      -9.4%       3126 =C2=B1  2%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
     23550 =C2=B1  1%     -25.1%      17646 =C2=B1 19%  sched_debug.cpu#28.=
sched_goidle
      3468 =C2=B1  7%      -9.1%       3154 =C2=B1  1%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
      1493 =C2=B1 11%     +22.2%       1823 =C2=B1  8%  sched_debug.cpu#2.c=
urr->pid
     38654 =C2=B1  6%     -10.1%      34735 =C2=B1  4%  sched_debug.cpu#14.=
nr_load_updates
     16449 =C2=B1  8%     -15.7%      13867 =C2=B1  8%  sched_debug.cpu#11.=
ttwu_count
     47593 =C2=B1  1%     -23.4%      36466 =C2=B1 21%  sched_debug.cpu#28.=
nr_switches
      6164 =C2=B1  1%      +8.5%       6687 =C2=B1  4%  sched_debug.cfs_rq[=
12]:/.exec_clock

testbox/testcase/testparams: lkp-sbx04/will-it-scale/performance-malloc1

9c0415eb8cbf0c8f  ba4877b9ca51f80b5d30f304a4  =

----------------  --------------------------  =

      4389 =C2=B1  2%     -66.0%       1494 =C2=B1  0%  will-it-scale.time.=
involuntary_context_switches
     37594 =C2=B1 32%    +542.8%     241666 =C2=B1  9%  cpuidle.C3-SNB.usage
        12 =C2=B1 38%     -60.4%          4 =C2=B1 27%  sched_debug.cpu#56.=
load
     73932 =C2=B1 14%     -48.3%      38186 =C2=B1 43%  sched_debug.cpu#7.t=
twu_count
         2 =C2=B1  0%    +175.0%          5 =C2=B1 47%  sched_debug.cpu#11.=
cpu_load[2]
        23 =C2=B1 43%    +206.5%         70 =C2=B1 39%  sched_debug.cfs_rq[=
55]:/.blocked_load_avg
      4389 =C2=B1  2%     -66.0%       1494 =C2=B1  0%  time.involuntary_co=
ntext_switches
        73 =C2=B1 44%     -53.7%         34 =C2=B1 29%  sched_debug.cfs_rq[=
33]:/.tg_load_contrib
        14 =C2=B1 29%    +125.9%         32 =C2=B1 37%  sched_debug.cpu#45.=
load
 1.324e+08 =C2=B1 29%     -63.7%   48101669 =C2=B1 16%  cpuidle.C1-SNB.time
  34290260 =C2=B1  6%    +165.5%   91052161 =C2=B1 14%  cpuidle.C3-SNB.time
        12 =C2=B1 25%     +78.0%         22 =C2=B1 14%  sched_debug.cpu#0.c=
pu_load[4]
         2 =C2=B1 19%     -55.6%          1 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.nr_spread_over
        12 =C2=B1  0%    +145.8%         29 =C2=B1 46%  sched_debug.cfs_rq[=
45]:/.load
      5215 =C2=B1 18%     -55.2%       2334 =C2=B1 22%  numa-vmstat.node2.n=
r_active_anon
     20854 =C2=B1 18%     -55.3%       9329 =C2=B1 22%  numa-meminfo.node2.=
Active(anon)
       316 =C2=B1 17%     +68.0%        531 =C2=B1 25%  sched_debug.cpu#62.=
ttwu_local
       176 =C2=B1 10%     +54.4%        272 =C2=B1 21%  sched_debug.cpu#39.=
ttwu_local
    157060 =C2=B1 19%     -48.4%      81039 =C2=B1 39%  sched_debug.cpu#7.s=
ched_count
    171170 =C2=B1 34%     +62.8%     278733 =C2=B1 11%  cpuidle.C1E-SNB.usa=
ge
      0.00 =C2=B1 10%     +41.8%       0.00 =C2=B1 19%  sched_debug.rt_rq[3=
6]:/.rt_time
    243909 =C2=B1 31%     +72.6%     421059 =C2=B1  5%  sched_debug.cfs_rq[=
51]:/.spread0
        12 =C2=B1 25%     +27.1%         15 =C2=B1 21%  sched_debug.cpu#0.c=
pu_load[1]
    143112 =C2=B1 14%     -46.3%      76834 =C2=B1 44%  sched_debug.cpu#7.n=
r_switches
     71413 =C2=B1 14%     -46.3%      38314 =C2=B1 44%  sched_debug.cpu#7.s=
ched_goidle
        13 =C2=B1 12%     +41.5%         18 =C2=B1 23%  sched_debug.cpu#46.=
cpu_load[0]
      1024 =C2=B1 27%     -27.2%        745 =C2=B1 26%  sched_debug.cpu#15.=
ttwu_local
      1061 =C2=B1  9%     -34.8%        692 =C2=B1  2%  sched_debug.cpu#30.=
curr->pid
       744 =C2=B1  8%     +43.5%       1068 =C2=B1 18%  sched_debug.cpu#20.=
curr->pid
      0.00 =C2=B1 24%     +76.1%       0.00 =C2=B1 14%  sched_debug.rt_rq[1=
6]:/.rt_time
       308 =C2=B1 11%     +79.2%        552 =C2=B1 35%  sched_debug.cpu#57.=
ttwu_local
     28950 =C2=B1 29%     -37.0%      18242 =C2=B1 16%  sched_debug.cpu#23.=
sched_count
     14117 =C2=B1 17%     +55.5%      21946 =C2=B1 17%  sched_debug.cpu#13.=
sched_goidle
     13969 =C2=B1 16%     +59.1%      22223 =C2=B1 18%  sched_debug.cpu#13.=
ttwu_count
     28524 =C2=B1 16%     +54.6%      44106 =C2=B1 17%  sched_debug.cpu#13.=
nr_switches
      3587 =C2=B1 12%     -22.7%       2774 =C2=B1 18%  numa-vmstat.node2.n=
r_slab_reclaimable
     14352 =C2=B1 12%     -22.7%      11099 =C2=B1 18%  numa-meminfo.node2.=
SReclaimable
     29903 =C2=B1  7%     +29.5%      38737 =C2=B1 14%  numa-meminfo.node1.=
Active
  91841976 =C2=B1 13%     -27.9%   66180100 =C2=B1 13%  cpuidle.C1E-SNB.time
        76 =C2=B1 11%     +34.1%        102 =C2=B1 24%  sched_debug.cfs_rq[=
40]:/.tg_load_contrib
       745 =C2=B1 14%     +15.8%        863 =C2=B1 18%  sched_debug.cpu#31.=
curr->pid
     42244 =C2=B1  9%     -27.8%      30503 =C2=B1  8%  numa-meminfo.node2.=
Active
     28600 =C2=B1  2%     +25.5%      35889 =C2=B1 12%  numa-meminfo.node0.=
Active
       284 =C2=B1 17%     +30.5%        371 =C2=B1  1%  sched_debug.cpu#44.=
ttwu_local
    655478 =C2=B1 13%     -20.0%     524404 =C2=B1  3%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     42280 =C2=B1  2%     -23.1%      32510 =C2=B1 14%  sched_debug.cpu#45.=
ttwu_count
       290 =C2=B1  7%     +25.9%        365 =C2=B1 10%  sched_debug.cpu#50.=
ttwu_local
     83350 =C2=B1  2%     -23.2%      64039 =C2=B1 15%  sched_debug.cpu#45.=
nr_switches
     41131 =C2=B1  3%     -22.4%      31900 =C2=B1 15%  sched_debug.cpu#45.=
sched_goidle
     83731 =C2=B1  2%     -23.1%      64394 =C2=B1 15%  sched_debug.cpu#45.=
sched_count
       317 =C2=B1 17%     +25.5%        398 =C2=B1 11%  sched_debug.cpu#52.=
ttwu_local
       264 =C2=B1  6%     +53.6%        406 =C2=B1 36%  sched_debug.cpu#46.=
ttwu_local
     41799 =C2=B1  7%     -13.2%      36279 =C2=B1 13%  sched_debug.cpu#51.=
nr_switches
     42064 =C2=B1  7%     -13.1%      36535 =C2=B1 13%  sched_debug.cpu#51.=
sched_count
     12557 =C2=B1 27%     +56.5%      19654 =C2=B1 27%  sched_debug.cpu#57.=
sched_count
     10442 =C2=B1  6%     -12.3%       9152 =C2=B1  8%  sched_debug.cfs_rq[=
7]:/.exec_clock
     56292 =C2=B1  7%     -15.4%      47608 =C2=B1 13%  sched_debug.cpu#7.n=
r_load_updates
      1174 =C2=B1 18%     +45.2%       1704 =C2=B1 11%  sched_debug.cpu#11.=
curr->pid
       286 =C2=B1 13%     +32.5%        379 =C2=B1  9%  sched_debug.cpu#55.=
ttwu_local
    288745 =C2=B1 30%     +45.7%     420730 =C2=B1  5%  sched_debug.cfs_rq[=
53]:/.spread0
    287389 =C2=B1 30%     +46.5%     420927 =C2=B1  5%  sched_debug.cfs_rq[=
52]:/.spread0
      2584 =C2=B1  3%     +11.2%       2872 =C2=B1  6%  sched_debug.cpu#45.=
curr->pid
    289910 =C2=B1 31%     +45.7%     422398 =C2=B1  5%  sched_debug.cfs_rq[=
54]:/.spread0
    293040 =C2=B1 31%     +42.7%     418044 =C2=B1  4%  sched_debug.cfs_rq[=
49]:/.spread0
     35054 =C2=B1  5%      -9.1%      31878 =C2=B1  7%  sched_debug.cpu#30.=
nr_load_updates
     37803 =C2=B1 10%     +12.3%      42455 =C2=B1  5%  sched_debug.cpu#43.=
sched_goidle
     99686 =C2=B1  4%      -6.0%      93667 =C2=B1  5%  sched_debug.cpu#38.=
nr_load_updates
     39264 =C2=B1  6%     +12.8%      44305 =C2=B1  4%  sched_debug.cpu#43.=
ttwu_count
      3884 =C2=B1 16%     -14.7%       3311 =C2=B1  2%  sched_debug.cfs_rq[=
30]:/.avg->runnable_avg_sum

testbox/testcase/testparams: xps2/pigz/performance-100%-512K

9c0415eb8cbf0c8f  ba4877b9ca51f80b5d30f304a4  =

----------------  --------------------------  =

     26318 =C2=B1  1%      -4.7%      25068 =C2=B1  3%  pigz.time.maximum_r=
esident_set_size
         1 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.nr_running
      1706 =C2=B1  7%     -59.5%        691 =C2=B1 15%  sched_debug.cpu#6.s=
ched_goidle
      1.13 =C2=B1 38%     -51.1%       0.55 =C2=B1 40%  perf-profile.cpu-cy=
cles.copy_process.part.26.do_fork.sys_clone.stub_clone
      1.18 =C2=B1 32%     -48.9%       0.60 =C2=B1 39%  perf-profile.cpu-cy=
cles.sys_clone.stub_clone
        11 =C2=B1  4%     -56.5%          5 =C2=B1 42%  sched_debug.cfs_rq[=
3]:/.nr_spread_over
      1.18 =C2=B1 32%     -48.9%       0.60 =C2=B1 39%  perf-profile.cpu-cy=
cles.stub_clone
      1.18 =C2=B1 32%     -48.9%       0.60 =C2=B1 39%  perf-profile.cpu-cy=
cles.do_fork.sys_clone.stub_clone
      1.63 =C2=B1 27%     -50.3%       0.81 =C2=B1 24%  perf-profile.cpu-cy=
cles.__do_softirq.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt
      0.00 =C2=B1 19%     -52.3%       0.00 =C2=B1 49%  sched_debug.rt_rq[1=
]:/.rt_time
      1.88 =C2=B1 15%     -32.3%       1.27 =C2=B1 17%  perf-profile.cpu-cy=
cles.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt
      5059 =C2=B1 16%     -45.2%       2773 =C2=B1 39%  sched_debug.cpu#3.s=
ched_goidle
       138 =C2=B1  2%      -8.2%        126 =C2=B1  4%  sched_debug.cpu#2.c=
pu_load[1]
       126 =C2=B1  6%     -12.5%        110 =C2=B1  2%  sched_debug.cpu#7.l=
oad
        14 =C2=B1  7%     -41.1%          8 =C2=B1 34%  sched_debug.cfs_rq[=
4]:/.nr_spread_over
       121 =C2=B1  2%     +15.0%        139 =C2=B1  3%  sched_debug.cfs_rq[=
1]:/.load
       122 =C2=B1  3%     +14.5%        139 =C2=B1  3%  sched_debug.cpu#1.l=
oad
       320 =C2=B1 42%    +113.6%        683 =C2=B1 10%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
       351 =C2=B1  1%     +23.3%        433 =C2=B1  4%  cpuidle.C3-NHM.usage
      1.39 =C2=B1  3%     -19.6%       1.12 =C2=B1  3%  perf-profile.cpu-cy=
cles.ret_from_fork
      1.62 =C2=B1  3%     -28.1%       1.17 =C2=B1 25%  perf-profile.cpu-cy=
cles.__do_page_fault.do_page_fault.page_fault
      1.62 =C2=B1  3%     -26.5%       1.19 =C2=B1 27%  perf-profile.cpu-cy=
cles.do_page_fault.page_fault
      1.77 =C2=B1  6%     -20.3%       1.41 =C2=B1 17%  perf-profile.cpu-cy=
cles.page_fault
      1.52 =C2=B1  2%     -31.6%       1.04 =C2=B1 24%  perf-profile.cpu-cy=
cles.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      1.34 =C2=B1  0%     -18.5%       1.09 =C2=B1  7%  perf-profile.cpu-cy=
cles.kthread.ret_from_fork
       126 =C2=B1  6%     -12.5%        110 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.load
     15.23 =C2=B1  2%     -13.7%      13.15 =C2=B1  3%  perf-profile.cpu-cy=
cles.copy_page_to_iter.pipe_read.new_sync_read.__vfs_read.vfs_read
       126 =C2=B1  3%     +19.2%        150 =C2=B1  2%  sched_debug.cfs_rq[=
3]:/.load
       126 =C2=B1  3%     +19.2%        150 =C2=B1  2%  sched_debug.cpu#3.l=
oad
     14.38 =C2=B1  2%     -12.4%      12.60 =C2=B1  5%  perf-profile.cpu-cy=
cles.copy_user_generic_string.copy_page_to_iter.pipe_read.new_sync_read.__v=
fs_read

xps2: Nehalem
Memory: 4G

wsm: Westmere
Memory: 6G

lkp-sb03: Sandy Bridge-EP
Memory: 64G

lkp-sbx04: Sandy Bridge-EX
Memory: 64G



                         time.involuntary_context_switches

  1300 ++------------------------------------------------------------------=
-+
  1200 **      *.* .*          **. *.***. *. *   *. **.    *.     *.* *. *.=
*|
       | +  .* :  *  * .**. *.*   *      *  * *.*  *   **. : ***.*   *  *  =
 *
  1100 ++ **  *       *    *                              *                =
 |
  1000 ++                                                                  =
 |
       |                                                                   =
 |
   900 ++                                                                  =
 |
   800 ++                                                                  =
 |
   700 ++                                                                  =
 |
       |                                                                   =
 |
   600 ++                                                                  =
 |
   500 ++                            O O               O                   =
 |
       OO OO OOO OO O O OO OO OOO OO  O  OO OOO OO O O                     =
 |
   400 ++            O                              O                      =
 |
   300 ++------------------------------------------------------------------=
-+


                                  cpuidle.C3-NHM.time

  9.5e+08 ++---------------------------------------------------------------=
-+
          |                       O                                        =
 |
    9e+08 ++                                          O                    =
 |
          |          O       O  O           O O                            =
 |
          O   OO OOO  OO  O O O  O  OOO  O   O  OOO  O                     =
 |
  8.5e+08 +O O           O              O O         O   O                  =
 |
          |                                                                =
 |
    8e+08 ++                                                               =
 |
          |                                                                =
 |
  7.5e+08 ++                                                               =
 |
          |             .* .* *. *  *  .**      **                .*    *  =
 *
          |   **.*   ***  *  *  * :+ **   *.** +  :.* *.  *.**.* *  * .* *.=
*|
    7e+08 *+.*    * +             *           *   *  *  **      *    *     =
 |
          |*       *                                                       =
 |
  6.5e+08 ++---------------------------------------------------------------=
-+


                                  cpuidle.C6-NHM.time

   1.6e+09 ++--------------------------------------------------------------=
-+
           |     .* *                       *                        *     =
*|
  1.55e+09 **.* * : :+  *.*   * *  *       * :    .***. **.*  .**    :+   :=
:|
           |   ::  :  **   : : ::+ ::.**   : *.***     *    :*   :  *  *  :=
 |
           |   *   *       * : *  * *   *.*                 *    *.*    ** =
 |
   1.5e+09 ++               *                                              =
 *
           |                                                               =
 |
  1.45e+09 ++                                                              =
 |
           |            O                           O                      =
 |
   1.4e+09 OO O O  O      O           OOO OO     O O O  O                  =
 |
           |   O  O O OO   OO OOO O O       O  O                           =
 |
           |                       O         O  O                          =
 |
  1.35e+09 ++                                          O                   =
 |
           |                                                               =
 |
   1.3e+09 ++--------------------------------------------------------------=
-+


                                 cpuidle.C6-NHM.usage

  1.4e+06 ++----------------------------------------------------*----------=
-+
          **.                             *. *    *.     *      :          =
 |
  1.2e+06 ++ **   **. **  *.      *. **. *  * *   : ***.* :.*  : :  **.**  =
 |
          |    *.*   *  + : * *.**  *   *      + *        *  *.* *.*     :.=
**
    1e+06 ++             *   *                  *                        * =
 |
          |                                                                =
 |
   800000 ++                                                               =
 |
          |                                                                =
 |
   600000 ++                                                               =
 |
          |                                                                =
 |
   400000 ++                                                               =
 |
          |                                                                =
 |
   200000 OO OOO OOO OOO OO OOO OOO OOO OOO OOO OOO OOO O                  =
 |
          |                                                                =
 |
        0 ++---------------------------------------------------------------=
-+


                  will-it-scale.time.involuntary_context_switches

  1300 ++------------------------------------------------------------------=
-+
  1200 **      *.* .*          **. *.***. *. *   *. **.    *.     *.* *. *.=
*|
       | +  .* :  *  * .**. *.*   *      *  * *.*  *   **. : ***.*   *  *  =
 *
  1100 ++ **  *       *    *                              *                =
 |
  1000 ++                                                                  =
 |
       |                                                                   =
 |
   900 ++                                                                  =
 |
   800 ++                                                                  =
 |
   700 ++                                                                  =
 |
       |                                                                   =
 |
   600 ++                                                                  =
 |
   500 ++                            O O               O                   =
 |
       OO OO OOO OO O O OO OO OOO OO  O  OO OOO OO O O                     =
 |
   400 ++            O                              O                      =
 |
   300 ++------------------------------------------------------------------=
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

--===============6355461527906549294==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB3aWxsLWl0LXNjYWxlCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJl
LXRlc3QKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAK
ICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1z
dGF0OiAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0
OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBk
aXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1
cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiAxMApkZWZh
dWx0X3dhdGNoZG9nczoKICB3YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5v
cjogcGVyZm9ybWFuY2UKY29tbWl0OiBlYTJiYmUzYjliZjkzMDQwOGRiMjA1MzQ0ZmUxMGM4Zjcx
OWJhNzM4Cm1vZGVsOiBXZXN0bWVyZQptZW1vcnk6IDZHCm5yX2hkZF9wYXJ0aXRpb25zOiAxCmhk
ZF9wYXJ0aXRpb25zOiAKc3dhcF9wYXJ0aXRpb25zOiAKcm9vdGZzX3BhcnRpdGlvbjogCm5ldGNv
bnNvbGVfcG9ydDogNjY2NwpwZXJmLXByb2ZpbGU6CiAgZnJlcTogODAwCndpbGwtaXQtc2NhbGU6
CiAgdGVzdDogbWFsbG9jMQp0ZXN0Ym94OiB3c20KdGJveF9ncm91cDogd3NtCmtjb25maWc6IHg4
Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNS0wMi0xNCAxODoyMTo1Ni44MDQzNjUwNjIgKzA4
OjAwCmhlYWRfY29tbWl0OiBlYTJiYmUzYjliZjkzMDQwOGRiMjA1MzQ0ZmUxMGM4ZjcxOWJhNzM4
CmJhc2VfY29tbWl0OiBiZmE3NmQ0OTU3NjU5OWE0YjlmOWI3YTcxZjIzZDczZDZkY2ZmNzM1CmJy
YW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUwMjE0MjMKa2VybmVsOiAiL2tlcm5l
bC94ODZfNjQtcmhlbC9lYTJiYmUzYjliZjkzMDQwOGRiMjA1MzQ0ZmUxMGM4ZjcxOWJhNzM4L3Zt
bGludXotMy4xOS4wLWdlYTJiYmUzIgp1c2VyOiBsa3AKcXVldWU6IGN5Y2xpYwpyb290ZnM6IGRl
Ymlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L3dzbS93aWxs
LWl0LXNjYWxlL3BlcmZvcm1hbmNlLW1hbGxvYzEvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNn
ei94ODZfNjQtcmhlbC9lYTJiYmUzYjliZjkzMDQwOGRiMjA1MzQ0ZmUxMGM4ZjcxOWJhNzM4LzAi
CmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvd3NtL2N5Y2xpY193aWxsLWl0LXNjYWxlLXBlcmZv
cm1hbmNlLW1hbGxvYzEteDg2XzY0LXJoZWwtSEVBRC1lYTJiYmUzYjliZjkzMDQwOGRiMjA1MzQ0
ZmUxMGM4ZjcxOWJhNzM4LTAtMjAxNTAyMTQtODk5OTQtMWV2cmExNC55YW1sIgpkZXF1ZXVlX3Rp
bWU6IDIwMTUtMDItMTUgMDc6MjI6MzkuNjgzNTc5NTExICswODowMApucl9jcHU6ICIkKG5wcm9j
KSIKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiA4LjM5IDQuOTMgMi4wMyAxLzE1NyA1NjI4
CnN0YXJ0X3RpbWU6ICcxNDIzOTU2MTgzJwplbmRfdGltZTogJzE0MjM5NTY0ODcnCnZlcnNpb246
ICIvbGtwL2xrcC8uc3JjLTIwMTUwMjEzLTA5NDg0NiIK

--===============6355461527906549294==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

Li9ydW50ZXN0LnB5IG1hbGxvYzEgMzIgYm90aCAxIDYgOSAxMgo=

--===============6355461527906549294==--

