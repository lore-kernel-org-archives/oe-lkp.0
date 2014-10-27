Content-Type: multipart/mixed; boundary="===============2510939963099105018=="
MIME-Version: 1.0
From: kernel test robot <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [mm] 3193913ce62: 4.7% will-it-scale.per_process_ops
Date: Mon, 27 Oct 2014 10:15:43 +0800
Message-ID: <20141027021543.GE27038@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2510939963099105018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit 3193913ce62c63056bc67a6ae378beaf494afa66 ("mm: page_alloc: default n=
ode-ordering on 64-bit NUMA, zone-ordering on 32-bit")


97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  testbox/testcase/testparams
----------------  --------------------------  ---------------------------
         %stddev     %change         %stddev
             \          |                \  =

      0.08 =C2=B1  0%      +6.2%       0.08 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      0.08            +6.2%       0.08        GEO-MEAN will-it-scale.scalab=
ility

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

    238085 =C2=B1  0%      +4.7%     249169 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
    238085            +4.7%     249169        GEO-MEAN will-it-scale.per_pr=
ocess_ops

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

    210740 =C2=B1  0%      +2.2%     215479 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
    210740            +2.2%     215479        GEO-MEAN will-it-scale.per_th=
read_ops

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      2733 =C2=B1  0%      -1.6%       2689 =C2=B1  0%  client7/netperf/per=
formance-900s-200%-TCP_STREAM
      2733            -1.6%       2689        GEO-MEAN netperf.Throughput_M=
bps

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

         4 =C2=B1 40%    +2e+09%   92498119 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
         4          +2e+09%   92498119        GEO-MEAN proc-vmstat.pgalloc_=
dma32

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

         3 =C2=B1 45%     -73.7%          1 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
         3           -73.7%          1        GEO-MEAN sched_debug.cfs_rq[3=
3]:/.runnable_load_avg

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      4069 =C2=B1 33%    +201.3%      12262 =C2=B1 49%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      4069          +201.3%      12262        GEO-MEAN sched_debug.cpu#25.s=
ched_goidle

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      8353 =C2=B1 33%    +195.8%      24712 =C2=B1 48%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      8353          +195.8%      24712        GEO-MEAN sched_debug.cpu#25.n=
r_switches

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      8388 =C2=B1 33%    +195.2%      24763 =C2=B1 48%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      8388          +195.2%      24763        GEO-MEAN sched_debug.cpu#25.s=
ched_count

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

    544767 =C2=B1 41%     -54.8%     246478 =C2=B1 47%  client7/netperf/per=
formance-900s-200%-TCP_STREAM
    544767           -54.8%     246478        GEO-MEAN cpuidle.C1-NHM.time

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

         3 =C2=B1 19%     -57.9%          1 =C2=B1 30%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
         3           -57.9%          1        GEO-MEAN sched_debug.cfs_rq[3=
0]:/.runnable_load_avg

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

         4 =C2=B1 15%     -55.0%          1 =C2=B1 41%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
         4           -55.0%          1        GEO-MEAN sched_debug.cpu#30.c=
pu_load[0]

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

         4 =C2=B1 35%     -60.9%          1 =C2=B1 41%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
         4           -60.9%          1        GEO-MEAN sched_debug.cpu#22.c=
pu_load[0]

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      3784 =C2=B1 35%    +138.2%       9015 =C2=B1 49%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      3784          +138.2%       9015        GEO-MEAN sched_debug.cpu#29.s=
ched_goidle

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      1704 =C2=B1 36%     +82.4%       3109 =C2=B1 32%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      1704           +82.4%       3109        GEO-MEAN sched_debug.cpu#22.t=
twu_local

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      7771 =C2=B1 34%    +134.1%      18194 =C2=B1 48%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      7770          +134.1%      18194        GEO-MEAN sched_debug.cpu#29.n=
r_switches

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      7806 =C2=B1 34%    +133.3%      18216 =C2=B1 48%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      7806          +133.3%      18216        GEO-MEAN sched_debug.cpu#29.s=
ched_count

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

        44 =C2=B1 16%     -49.5%         22 =C2=B1 15%  client7/netperf/per=
formance-900s-200%-TCP_STREAM
        44           -49.5%         22        GEO-MEAN sched_debug.cpu#11.n=
r_uninterruptible

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      1679 =C2=B1 12%     -32.6%       1131 =C2=B1 13%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      1678           -32.6%       1131        GEO-MEAN sched_debug.cpu#33.c=
urr->pid

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

        29 =C2=B1 14%     -34.9%         19 =C2=B1 19%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
        29           -34.9%         18        GEO-MEAN sched_debug.cfs_rq[5=
1]:/.nr_spread_over

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      1516 =C2=B1 24%     -23.5%       1160 =C2=B1 21%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      1516           -23.5%       1160        GEO-MEAN sched_debug.cpu#37.c=
urr->pid

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      4991 =C2=B1 15%     +42.4%       7106 =C2=B1 21%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      4991           +42.4%       7106        GEO-MEAN sched_debug.cpu#22.t=
twu_count

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

        18 =C2=B1 24%     +42.4%         26 =C2=B1 23%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
        18           +42.4%         26        GEO-MEAN sched_debug.cpu#51.c=
pu_load[3]

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      2077 =C2=B1 15%     -34.3%       1365 =C2=B1 16%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      2077           -34.3%       1365        GEO-MEAN sched_debug.cpu#30.c=
urr->pid

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      6608 =C2=B1 13%     +30.9%       8648 =C2=B1 21%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      6608           +30.9%       8648        GEO-MEAN sched_debug.cpu#22.s=
ched_goidle

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

     13690 =C2=B1 13%     +29.8%      17766 =C2=B1 20%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
     13690           +29.8%      17765        GEO-MEAN sched_debug.cpu#22.n=
r_switches

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

     13732 =C2=B1 13%     +29.6%      17792 =C2=B1 20%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
     13732           +29.6%      17792        GEO-MEAN sched_debug.cpu#22.s=
ched_count

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      6728 =C2=B1 17%     -21.9%       5252 =C2=B1 10%  client7/netperf/per=
formance-900s-200%-TCP_STREAM
      6728           -21.9%       5252        GEO-MEAN cpuidle.C6-NHM.usage

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      5777 =C2=B1 16%     +46.6%       8469 =C2=B1 23%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      5777           +46.6%       8469        GEO-MEAN sched_debug.cpu#21.s=
ched_goidle

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

     12608 =C2=B1 14%     +42.5%      17962 =C2=B1 22%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
     12607           +42.5%      17962        GEO-MEAN sched_debug.cpu#21.n=
r_switches

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

     12665 =C2=B1 14%     +42.0%      17983 =C2=B1 22%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
     12665           +42.0%      17983        GEO-MEAN sched_debug.cpu#21.s=
ched_count

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

  41168114 =C2=B1 17%     -27.5%   29866057 =C2=B1  7%  client7/netperf/per=
formance-900s-200%-TCP_STREAM
  41168114           -27.5%   29866057        GEO-MEAN cpuidle.C6-NHM.time

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      1848 =C2=B1 19%     -26.0%       1367 =C2=B1 23%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      1848           -26.0%       1367        GEO-MEAN sched_debug.cpu#29.c=
urr->pid

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

     59132 =C2=B1  0%     -25.8%      43889 =C2=B1  0%  client7/netperf/per=
formance-900s-200%-TCP_STREAM
     59132           -25.8%      43889        GEO-MEAN numa-vmstat.node0.nu=
ma_interleave

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

         8 =C2=B1 21%     -34.9%          5 =C2=B1 18%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
         8           -34.9%          5        GEO-MEAN sched_debug.cpu#65.c=
pu_load[0]

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

         7 =C2=B1  9%     -25.6%          5 =C2=B1 16%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
         7           -25.6%          5        GEO-MEAN sched_debug.cpu#65.c=
pu_load[1]

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

         6 =C2=B1 12%     +29.0%          8 =C2=B1 13%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
         6           +29.0%          7        GEO-MEAN sched_debug.cpu#19.c=
pu_load[0]

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      2464 =C2=B1  9%     -24.6%       1857 =C2=B1 19%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      2464           -24.6%       1857        GEO-MEAN sched_debug.cpu#21.c=
urr->pid

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

       642 =C2=B1  4%     -20.5%        511 =C2=B1  9%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
       642           -20.5%        511        GEO-MEAN slabinfo.ip_fib_trie=
.num_objs

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

       642 =C2=B1  4%     -20.5%        511 =C2=B1  9%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
       642           -20.5%        511        GEO-MEAN slabinfo.ip_fib_trie=
.active_objs

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

       314 =C2=B1  6%     -22.6%        243 =C2=B1 15%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
       314           -22.6%        243        GEO-MEAN sched_debug.cfs_rq[7=
9]:/.tg_runnable_contrib

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

     14409 =C2=B1  6%     -22.3%      11197 =C2=B1 14%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
     14409           -22.3%      11197        GEO-MEAN sched_debug.cfs_rq[7=
9]:/.avg->runnable_avg_sum

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

       203 =C2=B1  9%     -13.8%        175 =C2=B1  8%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
       203           -13.8%        175        GEO-MEAN sched_debug.cfs_rq[3=
5]:/.tg_runnable_contrib

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      9346 =C2=B1  9%     -13.6%       8078 =C2=B1  8%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      9346           -13.6%       8078        GEO-MEAN sched_debug.cfs_rq[3=
5]:/.avg->runnable_avg_sum

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      0.24 =C2=B1 16%     -26.9%       0.17 =C2=B1  5%  client7/netperf/per=
formance-900s-200%-TCP_STREAM
      0.24           -26.9%       0.17        GEO-MEAN turbostat.%c6

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

     17920 =C2=B1  7%     -13.3%      15538 =C2=B1  7%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
     17920           -13.3%      15538        GEO-MEAN sched_debug.cfs_rq[6=
5]:/.avg->runnable_avg_sum

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

       389 =C2=B1  7%     -13.2%        338 =C2=B1  7%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
       389           -13.2%        338        GEO-MEAN sched_debug.cfs_rq[6=
5]:/.tg_runnable_contrib

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      1843 =C2=B1  1%     -23.6%       1408 =C2=B1  2%  client7/netperf/per=
formance-900s-200%-TCP_STREAM
      1295 =C2=B1  3%     -10.7%       1156 =C2=B1  3%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      1545           -17.4%       1275        GEO-MEAN numa-vmstat.node0.nr=
_alloc_batch

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

    426745 =C2=B1 12%     -18.6%     347562 =C2=B1 11%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
    426745           -18.6%     347562        GEO-MEAN sched_debug.cfs_rq[3=
5]:/.min_vruntime

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

       211 =C2=B1  4%     -13.4%        182 =C2=B1  7%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
       211           -13.4%        182        GEO-MEAN sched_debug.cpu#73.t=
twu_local

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

   7560956 =C2=B1  0%     +18.7%    8973197 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
   7560956           +18.7%    8973197        GEO-MEAN numa-numastat.node0.=
local_node

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

   7566122 =C2=B1  0%     +18.7%    8978364 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
   7566122           +18.7%    8978364        GEO-MEAN numa-numastat.node0.=
numa_hit

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

    329055 =C2=B1  9%     +23.0%     404724 =C2=B1  6%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
    329055           +23.0%     404724        GEO-MEAN softirqs.SCHED

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

   3822373 =C2=B1  0%     +17.6%    4496660 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
   3822373           +17.6%    4496660        GEO-MEAN numa-vmstat.node0.nu=
ma_hit

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

   3817085 =C2=B1  0%     +17.7%    4490957 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
   3817085           +17.7%    4490957        GEO-MEAN numa-vmstat.node0.nu=
ma_local

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

 2.358e+09 =C2=B1  0%     -15.0%  2.004e+09 =C2=B1  0%  client7/netperf/per=
formance-900s-200%-TCP_STREAM
 2.358e+09           -15.0%  2.004e+09        GEO-MEAN proc-vmstat.pgalloc_=
normal

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      1777 =C2=B1 13%     +34.4%       2387 =C2=B1 16%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      1776           +34.4%       2387        GEO-MEAN sched_debug.cpu#74.s=
ched_goidle

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

    663710 =C2=B1 10%     +22.1%     810425 =C2=B1  5%  client7/netperf/per=
formance-900s-200%-TCP_STREAM
    663710           +22.1%     810425        GEO-MEAN sched_debug.cpu#9.av=
g_idle

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      3338 =C2=B1  0%     -13.8%       2876 =C2=B1  1%  client7/netperf/per=
formance-900s-200%-TCP_STREAM
      3338           -13.8%       2876        GEO-MEAN proc-vmstat.nr_alloc=
_batch

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

     47807 =C2=B1  6%     +19.2%      56984 =C2=B1 11%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
     47807           +19.2%      56984        GEO-MEAN sched_debug.cpu#25.n=
r_load_updates

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      3741 =C2=B1 13%     +33.3%       4985 =C2=B1 16%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      3740           +33.3%       4985        GEO-MEAN sched_debug.cpu#74.n=
r_switches

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

    295529 =C2=B1  3%     +16.2%     343525 =C2=B1  3%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
    295529           +16.2%     343525        GEO-MEAN softirqs.RCU

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      3374 =C2=B1  4%      -9.0%       3070 =C2=B1  5%  client7/netperf/per=
formance-900s-200%-TCP_STREAM
      3374            -9.0%       3070        GEO-MEAN sched_debug.cpu#4.cu=
rr->pid

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      3900 =C2=B1 12%     +31.4%       5124 =C2=B1 15%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      3900           +31.4%       5124        GEO-MEAN sched_debug.cpu#74.s=
ched_count

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

     14175 =C2=B1  3%     -19.5%      11408 =C2=B1 13%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
     14175           -19.5%      11408        GEO-MEAN sched_debug.cfs_rq[7=
8]:/.avg->runnable_avg_sum

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

       308 =C2=B1  3%     -19.5%        248 =C2=B1 13%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
       308           -19.5%        248        GEO-MEAN sched_debug.cfs_rq[7=
8]:/.tg_runnable_contrib

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

    605032 =C2=B1  8%     +19.7%     723984 =C2=B1 11%  client7/netperf/per=
formance-900s-200%-TCP_STREAM
    605032           +19.7%     723983        GEO-MEAN sched_debug.cpu#6.av=
g_idle

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

    493721 =C2=B1  2%     -10.8%     440327 =C2=B1  3%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
    493721           -10.8%     440327        GEO-MEAN sched_debug.cfs_rq[3=
1]:/.min_vruntime

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

    691172 =C2=B1  9%     -14.7%     589776 =C2=B1  1%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
    691172           -14.7%     589776        GEO-MEAN sched_debug.cfs_rq[2=
1]:/.min_vruntime

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

  10083100 =C2=B1  0%      -9.5%    9128227 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
  10083100            -9.5%    9128227        GEO-MEAN time.maximum_residen=
t_set_size

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

     99367 =C2=B1  3%      +8.2%     107474 =C2=B1  5%  client7/netperf/per=
formance-900s-200%-TCP_STREAM
     99367            +8.2%     107474        GEO-MEAN sched_debug.cpu#11.t=
twu_count

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      8369 =C2=B1 10%     +11.0%       9289 =C2=B1  2%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      8369           +11.0%       9289        GEO-MEAN sched_debug.cpu#51.s=
ched_count

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      8073 =C2=B1 10%     +11.1%       8968 =C2=B1  2%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      8073           +11.1%       8968        GEO-MEAN sched_debug.cpu#51.n=
r_switches

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

     81.24 =C2=B1  1%     -16.7%      67.64 =C2=B1  1%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
     81.24           -16.7%      67.64        GEO-MEAN time.user_time

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

    248649 =C2=B1  2%      +6.0%     263514 =C2=B1  1%  client7/netperf/per=
formance-900s-200%-TCP_STREAM
     13518 =C2=B1  2%     -16.2%      11335 =C2=B1  2%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
     57977            -5.7%      54652        GEO-MEAN time.involuntary_con=
text_switches

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

       577 =C2=B1  0%      +1.5%        585 =C2=B1  0%  client7/netperf/per=
formance-900s-200%-TCP_STREAM
      1155 =C2=B1  0%     -11.4%       1024 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
       816            -5.2%        774        GEO-MEAN time.percent_of_cpu_=
this_job_got

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      5059 =C2=B1  0%      +1.5%       5132 =C2=B1  0%  client7/netperf/per=
formance-900s-200%-TCP_STREAM
      3521 =C2=B1  0%     -11.3%       3123 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      4220            -5.1%       4004        GEO-MEAN time.system_time

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

      6480 =C2=B1  0%      +5.8%       6855 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
      6480            +5.8%       6855        GEO-MEAN vmstat.system.cs

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

   2613356 =C2=B1  0%      -1.4%    2576765 =C2=B1  0%  client7/netperf/per=
formance-900s-200%-TCP_STREAM
    791288 =C2=B1  0%      +8.0%     854734 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
   1438026            +3.2%    1484065        GEO-MEAN time.voluntary_conte=
xt_switches

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

     36.32 =C2=B1  0%      -4.4%      34.72 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
     36.32            -4.4%      34.72        GEO-MEAN turbostat.%c0

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

     30544 =C2=B1  0%      -4.3%      29236 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
     30544            -4.3%      29236        GEO-MEAN vmstat.system.in

97ee4ba7cbd30f18  3193913ce62c63056bc67a6ae3  =

----------------  --------------------------  =

   7423764 =C2=B1  0%      +1.9%    7566579 =C2=B1  0%  lkp-wsx01/will-it-s=
cale/performance-page_fault1
   7423764            +1.9%    7566579        GEO-MEAN time.minor_page_faul=
ts

lkp-wsx01: Westmere-EX
Memory: 128G

client7: Nehalem EP
Memory: 48G




                                 time.system_time

  3550 ++------*---------*--------------------------------*-------*--------=
-*
  3500 ++.*.*.   *.. .*.  +  .*..*.  .*.  .*.*..    .*.. :   *. ..  *..*. .=
.|
       *.           *      *.      *.   *.      *.*.     :     *         * =
 |
  3450 ++                                               *                  =
 |
  3400 ++                                                                  =
 |
       |                                                                   =
 |
  3350 ++                                                                  =
 |
  3300 ++                                                                  =
 |
  3250 ++                                                                  =
 |
       |                                                                   =
 |
  3200 ++ O                                                                =
 |
  3150 ++      O O                    O                      O             =
 |
       O    O       O O  O O  O  O O    O  O O  O O       O    O  O        =
 |
  3100 ++                                            O  O                  =
 |
  3050 ++------------------------------------------------------------------=
-+


                         time.percent_of_cpu_this_job_got

  1180 ++------------------------------------------------------------------=
-+
       |      .*.                                         *..              =
 *
  1160 ++.*.*.   *.. .*..*.  .*..*.  .*.  .*.*..    .*.. :   *.  .*.*..*. .=
.|
  1140 *+           *      *.      *.   *.      *.*.     :     *.        * =
 |
       |                                                *                  =
 |
  1120 ++                                                                  =
 |
  1100 ++                                                                  =
 |
       |                                                                   =
 |
  1080 ++                                                                  =
 |
  1060 ++                                                                  =
 |
       |  O                                                                =
 |
  1040 ++      O O                    O                                    =
 |
  1020 O+   O       O O  O O     O O    O  O O  O         O  O O  O        =
 |
       |                      O                   O  O  O                  =
 |
  1000 ++------------------------------------------------------------------=
-+


                            time.maximum_resident_set_size

  1.02e+07 ++--------------------------------------------------------------=
-+
           |   .*.                .*.         .*..   .*..*.*..*   *..*.*..*=
.|
     1e+07 *+*.   *..*.*.*..*.*..*   *..*.*..*    *.*          + +         =
 *
           |                                                    *          =
 |
   9.8e+06 ++                                                              =
 |
           |                                                               =
 |
   9.6e+06 ++                                                              =
 |
           |                                                               =
 |
   9.4e+06 ++                                                              =
 |
           |                                                               =
 |
   9.2e+06 ++     O                     O O    O         O O               =
 |
           | O       O O    O O  O O O       O    O O O         O O        =
 |
     9e+06 O+   O        O                                    O            =
 |
           |                                                               =
 |
   8.8e+06 ++--------------------------------------------------------------=
-+


                           time.voluntary_context_switches

  880000 ++----------------------------------------------------------------=
-+
         |                                         O                       =
 |
  860000 ++             O           O       O    O    O    O               =
 |
         O      O  O O    O  O O       O O    O         O    O  O          =
 |
         | O  O                   O                               O        =
 |
  840000 ++                                                                =
 |
         |                                                                 =
 |
  820000 ++                                                                =
 |
         |                                                                 =
 |
  800000 ++  .*    *.     *..*                        *.              .*.. =
 |
         *.*.  :  :  *.. +    +  .*.    .*..*.*..*. ..  *.. .*..*.*..*     =
 |
         |     :  :     *      *.   *..*           *       *              *=
.|
  780000 ++     ::                                                         =
 *
         |      *                                                          =
 |
  760000 ++----------------------------------------------------------------=
-+


                            will-it-scale.per_process_ops

  255000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  250000 ++        O O    O            O                     O  O          =
 |
         O              O    O O  O O       O    O O  O O  O      O        =
 |
         | O  O O                        O    O                            =
 |
  245000 ++                                                                =
 |
         |                                                                 =
 |
  240000 ++                                                                =
 |
         *.*..*     .*..*.*..*.*..*.*.. .*..  *..*.*..*.*..*.*..*.*..*.*..*=
.*
  235000 ++    :   *                   *     +                             =
 |
         |     :  +                         *                              =
 |
         |      :+                                                         =
 |
  230000 ++     *                                                          =
 |
         |                                                                 =
 |
  225000 ++----------------------------------------------------------------=
-+


                                   turbostat.%c0

  36.6 ++------------------------------------------------------------------=
-+
  36.4 ++     .*.                                                          =
 *
       |   .*.   *.. .*..*.  .*..*.  .*.    .*..    .*..  *..*.  .*.*..*. .=
.|
  36.2 *+.*         *      *.      *.   *..*    *.*.     +     *.        * =
 |
    36 ++                                               *                  =
 |
       |                                                                   =
 |
  35.8 ++                                                                  =
 |
  35.6 ++                                                                  =
 |
  35.4 ++                                                                  =
 |
       |                                                                   =
 |
  35.2 ++                                                                  =
 |
    35 ++ O                                                                =
 |
       |    O  O O                    O                                    =
 |
  34.8 O+           O O    O     O O    O  O O  O         O  O O  O        =
 |
  34.6 ++----------------O----O-------------------O--O--O------------------=
-+


                             numa-numastat.node0.numa_hit

  9.2e+06 ++---------------------------------------------------------------=
-+
    9e+06 O+   O    O    O O         O O  O O  O O         O O  O          =
 |
          | O    O    O       O O O                 O O O         O        =
 |
  8.8e+06 ++                                                               =
 |
  8.6e+06 ++                                                               =
 |
          |                                                                =
 |
  8.4e+06 ++                                                               =
 |
  8.2e+06 ++                                                               =
 |
    8e+06 ++                                                               =
 |
          |                                                                =
 |
  7.8e+06 ++                                                               =
 |
  7.6e+06 *+*..*          .*..        .*..*.*..*.*.. .*.*.. .*.. .*..    .*=
.|
          |     :   *.*..*    *.*.*..*              *      *    *    *.*.  =
 *
  7.4e+06 ++    : ..                                                       =
 |
  7.2e+06 ++-----*---------------------------------------------------------=
-+


                            numa-numastat.node0.local_node

  9.2e+06 ++---------------------------------------------------------------=
-+
    9e+06 O+   O    O      O         O    O O  O O         O O  O          =
 |
          | O    O    O  O    O O O    O            O O O         O        =
 |
  8.8e+06 ++                                                               =
 |
  8.6e+06 ++                                                               =
 |
          |                                                                =
 |
  8.4e+06 ++                                                               =
 |
  8.2e+06 ++                                                               =
 |
    8e+06 ++                                                               =
 |
          |                                                                =
 |
  7.8e+06 ++                                                               =
 |
  7.6e+06 *+  .*          .*..           .*.*..*.*.. .*.*.. .*.. .*..    .*=
.|
          | *.  :   *.*..*    *.*.*..*.*.           *      *    *    *.*.  =
 *
  7.4e+06 ++    : ..                                                       =
 |
  7.2e+06 ++-----*---------------------------------------------------------=
-+


                                  vmstat.system.in

  30800 ++-----------------------------------------------------------------=
-+
        |      .*.              .*..                 *                     =
 |
  30600 ++  .*.   *.. .*..*.*..*     .*.. .*..*.    + +   *..*.  .*.*..*.*.=
.*
  30400 *+.*         *              *    *      *..*   + +     *.          =
 |
        |                                               *                  =
 |
  30200 ++                                                                 =
 |
  30000 ++                                                                 =
 |
        |                                                                  =
 |
  29800 ++                                                                 =
 |
  29600 ++                                                                 =
 |
        |  O                                                               =
 |
  29400 ++   O  O O                   O                                    =
 |
  29200 O+           O O    O       O    O O  O O    O    O  O O  O        =
 |
        |                 O    O O                 O    O                  =
 |
  29000 ++-----------------------------------------------------------------=
-+


                                 vmstat.system.cs

  7100 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  7000 ++                                         O                        =
 |
  6900 O+      O O    O            O    O    O       O                     =
 |
       |  O O       O    O O  O       O    O    O       O O    O           =
 |
  6800 ++                        O                           O    O        =
 |
       |                                                                   =
 |
  6700 ++                                                                  =
 |
       |                                                                   =
 |
  6600 ++  .*    *..                                 *..               *   =
 |
  6500 ++.*  :   :  *     .*..         .*..*.*..   ..            .*. .. :  =
 |
       *.    :  :    +  .*      .*.*..*         *.*     *.*..*.*.   *   :  =
 |
  6400 ++     : :     *.      *.                                         *.=
.*
       |      ::                                                           =
 |
  6300 ++------*-----------------------------------------------------------=
-+


                              proc-vmstat.pgalloc_dma32

  1e+08 ++-----------------------------------------------------------------=
-+
  9e+07 O+ O O  O O  O O  O O  O O  O O  O O  O O  O O  O O  O O  O        =
 |
        |                                                                  =
 |
  8e+07 ++                                                                 =
 |
  7e+07 ++                                                                 =
 |
        |                                                                  =
 |
  6e+07 ++                                                                 =
 |
  5e+07 ++                                                                 =
 |
  4e+07 ++                                                                 =
 |
        |                                                                  =
 |
  3e+07 ++                                                                 =
 |
  2e+07 ++                                                                 =
 |
        |                                                                  =
 |
  1e+07 ++                                                                 =
 |
      0 *+-*-*--*-*--*-*--*-*--*-*--*-*--*-*--*-*--*-*--*-*--*-*--*-*--*-*-=
-*


                              numa-vmstat.node0.numa_hit

  4.6e+06 ++---------------------------------------------------------------=
-+
          O                O         O O  O O  O O         O O             =
 |
  4.5e+06 ++O  O O  O O  O    O O O                 O O O       O O        =
 |
  4.4e+06 ++                                                               =
 |
          |                                                                =
 |
  4.3e+06 ++                                                               =
 |
  4.2e+06 ++                                                               =
 |
          |                                                                =
 |
  4.1e+06 ++                                                               =
 |
    4e+06 ++                                                               =
 |
          |                                                                =
 |
  3.9e+06 ++              .*..                                             =
 |
  3.8e+06 *+*..*    *.  .*    *.*.*..*.*..*.*..*.*..*.*.*..*.*..*.*..*.*..*=
.*
          |     + ..  *.                                                   =
 |
  3.7e+06 ++-----*---------------------------------------------------------=
-+


                             numa-vmstat.node0.numa_local

  4.6e+06 ++---------------------------------------------------------------=
-+
          |                O           O  O O  O O         O O             =
 |
  4.5e+06 O+O  O O  O O  O    O O O  O              O O O       O O        =
 |
  4.4e+06 ++                                                               =
 |
          |                                                                =
 |
  4.3e+06 ++                                                               =
 |
  4.2e+06 ++                                                               =
 |
          |                                                                =
 |
  4.1e+06 ++                                                               =
 |
    4e+06 ++                                                               =
 |
          |                                                                =
 |
  3.9e+06 ++              .*..                                             =
 |
  3.8e+06 *+*..*    *.  .*    *.*.*.. .*..*.*..*.*..*.*.*..*.*..*.*..*.*..*=
.|
          |     + ..  *.             *                                     =
 *
  3.7e+06 ++-----*---------------------------------------------------------=
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
Fengguang

_______________________________________________
LKP mailing list
LKP(a)linux.intel.com

--===============2510939963099105018==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB3aWxsLWl0LXNjYWxlCmRlZmF1bHRfbW9uaXRvcnM6CiAgd2FpdDogcHJl
LXRlc3QKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAK
ICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1z
dGF0OiAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0
OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBk
aXNrc3RhdHM6IAogIGVuZXJneTogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcTogCiAgdHVyYm9zdGF0
OiAKICBzY2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiAxMAogIHBtZXRlcjogCmRlZmF1bHRfd2F0
Y2hkb2dzOgogIHdhdGNoLW9vbTogCiAgd2F0Y2hkb2c6IApjcHVmcmVxX2dvdmVybm9yOgotIHBl
cmZvcm1hbmNlCmNvbW1pdDogZjExNDA0MGUzZWE2ZTA3MzcyMzM0YWRlNzVkMWVlMDc3NWMzNTVl
MQptb2RlbDogV2VzdG1lcmUtRVgKbWVtb3J5OiAxMjhHCm5yX2NwdTogODAKbnJfaGRkX3BhcnRp
dGlvbnM6IDAKaGRkX3BhcnRpdGlvbnM6IApzd2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0
aW9uOiAKcm9vdGZzOiBjbGVhcmxpbnV4LXg4Nl82NC5jZ3oKcGVyZi1wcm9maWxlOgogIGZyZXE6
IDgwMAp3aWxsLWl0LXNjYWxlOgogIHRlc3Q6CiAgLSBwYWdlX2ZhdWx0MQplbnF1ZXVlX3RpbWU6
IDIwMTQtMTAtMjAgMTE6MTQ6MzYuNTY2NDYwNzEzICswODowMAp0ZXN0Ym94OiBsa3Atd3N4MDEK
dGJveF9ncm91cDogbGtwLXdzeDAxCmtjb25maWc6IHg4Nl82NC1yaGVsCmhlYWRfY29tbWl0OiAx
YTdhZDA4M2NhZjRhMjliMDBkN2VhYWJmZDgxZjYzZDZmZWNkZTVhCmJhc2VfY29tbWl0OiBmMTE0
MDQwZTNlYTZlMDczNzIzMzRhZGU3NWQxZWUwNzc1YzM1NWUxCmJyYW5jaDogbGludXgtZGV2ZWwv
ZGV2ZWwtaG91cmx5LTIwMTQxMDIwMTMKa2VybmVsOiAiL2tlcm5lbC94ODZfNjQtcmhlbC9mMTE0
MDQwZTNlYTZlMDczNzIzMzRhZGU3NWQxZWUwNzc1YzM1NWUxL3ZtbGludXotMy4xOC4wLXJjMS1n
ZjExNDA0MCIKdXNlcjogbGtwCnF1ZXVlOiBjeWNsaWMKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L2xr
cC13c3gwMS93aWxsLWl0LXNjYWxlL3BlcmZvcm1hbmNlLXBhZ2VfZmF1bHQxL2NsZWFybGludXgt
eDg2XzY0LmNnei94ODZfNjQtcmhlbC9mMTE0MDQwZTNlYTZlMDczNzIzMzRhZGU3NWQxZWUwNzc1
YzM1NWUxLzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtwLXdzeDAxL2N5Y2xpY193aWxs
LWl0LXNjYWxlLXBlcmZvcm1hbmNlLXBhZ2VfZmF1bHQxLWNsZWFybGludXgteDg2XzY0LmNnei14
ODZfNjQtcmhlbC1CQVNFLWYxMTQwNDBlM2VhNmUwNzM3MjMzNGFkZTc1ZDFlZTA3NzVjMzU1ZTEt
MC55YW1sIgpkZXF1ZXVlX3RpbWU6IDIwMTQtMTAtMjAgMTM6NDE6MDguNTk3MDEzNTk2ICswODow
MApqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDUzLjk2IDI2LjU2IDEwLjYyIDEvNjM3IDEy
NjIxCnN0YXJ0X3RpbWU6ICcxNDEzNzgzNzM5JwplbmRfdGltZTogJzE0MTM3ODQwNTAnCnZlcnNp
b246ICIvbGtwL2xrcC8uc3JjLTIwMTQxMDIwLTA5MjA1MiIK

--===============2510939963099105018==
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
c3RlbS9jcHUvY3B1OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKLi9ydW50ZXN0LnB5IHBhZ2Vf
ZmF1bHQxIDE2IDEgMTAgMjAgMzAgNDAgNjAgODAK

--===============2510939963099105018==--

