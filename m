Content-Type: multipart/mixed; boundary="===============7078362682708644547=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [sched] 2db34be8238: -7.0% aim7.jobs-per-min
Date: Fri, 08 May 2015 15:13:42 +0800
Message-ID: <1431069222.5148.120.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7078362682708644547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://bee.sh.intel.com/git/ydu19/linux for-lkp
commit 2db34be8238b94521a8985f66d2520e0492dcfba ("sched: Rewrite per entity=
 runnable load average tracking")


testcase/path_params/tbox_group: aim7/performance-2000-fork_test/brickland3

72cc303b8e634656  2db34be8238b94521a8985f66d  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

     24953 =C2=B1  1%      -7.0%      23199 =C2=B1  1%  aim7.jobs-per-min
     41872 =C2=B1 38%    +757.8%     359187 =C2=B1 13%  aim7.time.involunta=
ry_context_switches
       228 =C2=B1  5%     -11.0%        203 =C2=B1  3%  aim7.time.user_time
  90816951 =C2=B1  3%      -6.9%   84529093 =C2=B1  5%  aim7.time.voluntary=
_context_switches
       481 =C2=B1  1%      +7.6%        517 =C2=B1  1%  aim7.time.elapsed_t=
ime
       481 =C2=B1  1%      +7.6%        517 =C2=B1  1%  aim7.time.elapsed_t=
ime.max
       751 =C2=B1  2%      -7.8%        693 =C2=B1  1%  pmeter.Average_Acti=
ve_Power
        25 =C2=B1  6%    +237.3%         86 =C2=B1  7%  vmstat.procs.r
    388606 =C2=B1  4%     -19.6%     312449 =C2=B1  6%  vmstat.system.cs
     41872 =C2=B1 38%    +757.8%     359187 =C2=B1 13%  time.involuntary_co=
ntext_switches
       228 =C2=B1  5%     -11.0%        203 =C2=B1  3%  time.user_time
    275414 =C2=B1 11%     -41.7%     160498 =C2=B1 14%  softirqs.HRTIMER
   5138484 =C2=B1  4%     -14.7%    4385384 =C2=B1  2%  softirqs.RCU
    345303 =C2=B1  1%      -9.9%     311201 =C2=B1  0%  meminfo.Active
    249510 =C2=B1  2%     -13.4%     215994 =C2=B1  0%  meminfo.Active(anon)
    210600 =C2=B1  2%     -16.4%     176076 =C2=B1  0%  meminfo.AnonPages
    248769 =C2=B1  1%     -14.2%     213525 =C2=B1  2%  meminfo.KernelStack
    160700 =C2=B1  4%     -14.3%     137788 =C2=B1  6%  meminfo.PageTables
 1.537e+08 =C2=B1  1%     +37.9%  2.119e+08 =C2=B1  2%  numa-numastat.node0=
.local_node
 1.537e+08 =C2=B1  1%     +37.9%  2.119e+08 =C2=B1  2%  numa-numastat.node0=
.numa_hit
         1 =C2=B1 24%    +400.0%          8 =C2=B1 45%  numa-numastat.node1=
.other_node
         2 =C2=B1 36%    +277.8%          8 =C2=B1 21%  numa-numastat.node2=
.other_node
 1.594e+09 =C2=B1  8%    +124.3%  3.575e+09 =C2=B1  4%  cpuidle.C1-IVT-4S.t=
ime
   2954018 =C2=B1 15%    +482.6%   17209296 =C2=B1  9%  cpuidle.C1-IVT-4S.u=
sage
  1.34e+09 =C2=B1 11%     -30.0%  9.384e+08 =C2=B1  6%  cpuidle.C1E-IVT-4S.=
time
 4.316e+09 =C2=B1  6%     -53.6%  2.003e+09 =C2=B1  6%  cpuidle.C3-IVT-4S.t=
ime
   8127887 =C2=B1 11%     -23.6%    6208689 =C2=B1  3%  cpuidle.C3-IVT-4S.u=
sage
  48976675 =C2=B1  1%     -34.8%   31946658 =C2=B1  2%  cpuidle.C6-IVT-4S.u=
sage
       177 =C2=B1  6%     -55.6%         78 =C2=B1 15%  cpuidle.POLL.usage
     52.89 =C2=B1  2%     -24.1%      40.14 =C2=B1  1%  turbostat.CPU%c1
      4.65 =C2=B1  2%     -41.9%       2.70 =C2=B1 10%  turbostat.CPU%c3
     18.38 =C2=B1 14%     +88.6%      34.67 =C2=B1  2%  turbostat.CPU%c6
       283 =C2=B1  3%     -13.6%        244 =C2=B1  1%  turbostat.CorWatt
      0.78 =C2=B1  9%   +2400.0%      19.44 =C2=B1  1%  turbostat.Pkg%pc2
       354 =C2=B1  2%     -11.2%        315 =C2=B1  1%  turbostat.PkgWatt
     93.83 =C2=B1  0%      -7.5%      86.84 =C2=B1  0%  turbostat.RAMWatt
     62386 =C2=B1  2%     -13.4%      54027 =C2=B1  0%  proc-vmstat.nr_acti=
ve_anon
     52669 =C2=B1  2%     -16.4%      44028 =C2=B1  0%  proc-vmstat.nr_anon=
_pages
       202 =C2=B1 24%     -54.6%         92 =C2=B1 21%  proc-vmstat.nr_dirt=
ied
     15558 =C2=B1  1%     -14.2%      13356 =C2=B1  1%  proc-vmstat.nr_kern=
el_stack
     40156 =C2=B1  4%     -14.2%      34441 =C2=B1  6%  proc-vmstat.nr_page=
_table_pages
       220 =C2=B1 15%     -37.8%        136 =C2=B1 16%  proc-vmstat.nr_writ=
ten
   6411013 =C2=B1  1%     +42.5%    9133531 =C2=B1  2%  proc-vmstat.pgalloc=
_dma32
     71679 =C2=B1  2%     +15.8%      83023 =C2=B1  2%  numa-meminfo.node0.=
SUnreclaim
    683976 =C2=B1  1%     +20.6%     824678 =C2=B1  2%  numa-meminfo.node0.=
MemUsed
     92533 =C2=B1  1%      +6.3%      98335 =C2=B1  4%  numa-meminfo.node0.=
Inactive
    803390 =C2=B1 10%     -25.0%     602675 =C2=B1  9%  numa-meminfo.node1.=
MemUsed
     70282 =C2=B1 25%     -42.4%      40515 =C2=B1 24%  numa-meminfo.node1.=
KernelStack
      8654 =C2=B1 44%     -82.0%       1555 =C2=B1 41%  numa-meminfo.node3.=
Shmem
      8023 =C2=B1 44%     -87.6%        995 =C2=B1 35%  numa-meminfo.node3.=
Inactive(anon)
     39389 =C2=B1  7%     +98.6%      78242 =C2=B1  2%  slabinfo.kmalloc-12=
8.active_objs
     39403 =C2=B1  7%     +99.5%      78610 =C2=B1  3%  slabinfo.kmalloc-12=
8.num_objs
       615 =C2=B1  7%     +99.6%       1227 =C2=B1  3%  slabinfo.kmalloc-12=
8.active_slabs
       615 =C2=B1  7%     +99.6%       1227 =C2=B1  3%  slabinfo.kmalloc-12=
8.num_slabs
    193739 =C2=B1  0%     +10.6%     214199 =C2=B1  0%  slabinfo.kmalloc-64=
.num_objs
    190791 =C2=B1  0%     +11.1%     212045 =C2=B1  0%  slabinfo.kmalloc-64=
.active_objs
      3026 =C2=B1  0%     +10.6%       3346 =C2=B1  0%  slabinfo.kmalloc-64=
.num_slabs
      3026 =C2=B1  0%     +10.6%       3346 =C2=B1  0%  slabinfo.kmalloc-64=
.active_slabs
      8593 =C2=B1  0%     +10.5%       9491 =C2=B1  0%  slabinfo.mm_struct.=
num_objs
      8454 =C2=B1  0%     +10.1%       9308 =C2=B1  0%  slabinfo.mm_struct.=
active_objs
  75192762 =C2=B1  1%     +36.5%  1.026e+08 =C2=B1  3%  numa-vmstat.node0.n=
uma_hit
     17922 =C2=B1  2%     +15.8%      20759 =C2=B1  2%  numa-vmstat.node0.n=
r_slab_unreclaimable
  75161178 =C2=B1  1%     +36.5%  1.026e+08 =C2=B1  3%  numa-vmstat.node0.n=
uma_local
      4394 =C2=B1 25%     -42.2%       2540 =C2=B1 25%  numa-vmstat.node1.n=
r_kernel_stack
     52426 =C2=B1  0%     +59.3%      83495 =C2=B1  0%  numa-vmstat.node1.n=
uma_other
     83295 =C2=B1  0%     -36.7%      52715 =C2=B1  0%  numa-vmstat.node2.n=
uma_other
      2005 =C2=B1 44%     -87.6%        248 =C2=B1 35%  numa-vmstat.node3.n=
r_inactive_anon
      2163 =C2=B1 44%     -82.0%        388 =C2=B1 41%  numa-vmstat.node3.n=
r_shmem
   1257390 =C2=B1  2%     -99.8%       2133 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
      2115 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.blocked_load_avg
  28699924 =C2=B1  5%     -65.4%    9932690 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.min_vruntime
        51 =C2=B1 18%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.utilization_load_avg
     64335 =C2=B1  5%     +39.5%      89744 =C2=B1  3%  sched_debug.cfs_rq[=
0]:/.exec_clock
        14 =C2=B1 37%     -76.8%          3 =C2=B1 33%  sched_debug.cfs_rq[=
0]:/.nr_spread_over
      2132 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
   1297304 =C2=B1  2%     -99.8%       1986 =C2=B1  2%  sched_debug.cfs_rq[=
100]:/.tg_load_avg
        99 =C2=B1 23%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
100]:/.utilization_load_avg
     13597 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
100]:/.tg_load_contrib
  16843099 =C2=B1  8%     -79.6%    3442369 =C2=B1 23%  sched_debug.cfs_rq[=
100]:/.min_vruntime
     13538 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
100]:/.blocked_load_avg
     13109 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
101]:/.blocked_load_avg
       122 =C2=B1 25%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
101]:/.utilization_load_avg
     13193 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
101]:/.tg_load_contrib
  16907143 =C2=B1  7%     -79.7%    3428806 =C2=B1 23%  sched_debug.cfs_rq[=
101]:/.min_vruntime
   1297648 =C2=B1  2%     -99.8%       1986 =C2=B1  2%  sched_debug.cfs_rq[=
101]:/.tg_load_avg
  17037690 =C2=B1  8%     -79.8%    3434272 =C2=B1 23%  sched_debug.cfs_rq[=
102]:/.min_vruntime
     14156 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
102]:/.blocked_load_avg
       121 =C2=B1 44%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
102]:/.utilization_load_avg
     14250 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
102]:/.tg_load_contrib
   1297593 =C2=B1  2%     -99.8%       1989 =C2=B1  3%  sched_debug.cfs_rq[=
102]:/.tg_load_avg
     14010 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
103]:/.blocked_load_avg
     14077 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
103]:/.tg_load_contrib
        84 =C2=B1 17%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
103]:/.utilization_load_avg
   1297902 =C2=B1  2%     -99.8%       1986 =C2=B1  3%  sched_debug.cfs_rq[=
103]:/.tg_load_avg
  17308420 =C2=B1  8%     -80.2%    3425797 =C2=B1 23%  sched_debug.cfs_rq[=
103]:/.min_vruntime
     14535 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
104]:/.blocked_load_avg
   1297991 =C2=B1  2%     -99.8%       1985 =C2=B1  3%  sched_debug.cfs_rq[=
104]:/.tg_load_avg
  17620551 =C2=B1  8%     -80.6%    3410019 =C2=B1 23%  sched_debug.cfs_rq[=
104]:/.min_vruntime
       133 =C2=B1 20%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
104]:/.utilization_load_avg
     14604 =C2=B1 16%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
104]:/.tg_load_contrib
   1297262 =C2=B1  2%     -99.8%       1981 =C2=B1  3%  sched_debug.cfs_rq[=
105]:/.tg_load_avg
         1 =C2=B1 33%    +700.0%         12 =C2=B1  5%  sched_debug.cfs_rq[=
105]:/.runnable_load_avg
     15157 =C2=B1 11%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
105]:/.tg_load_contrib
       115 =C2=B1 27%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
105]:/.utilization_load_avg
     15063 =C2=B1 11%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
105]:/.blocked_load_avg
  18220360 =C2=B1  2%     -85.8%    2588613 =C2=B1 32%  sched_debug.cfs_rq[=
105]:/.min_vruntime
  17733781 =C2=B1  3%     -85.4%    2583251 =C2=B1 32%  sched_debug.cfs_rq[=
106]:/.min_vruntime
     14034 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
106]:/.tg_load_contrib
       149 =C2=B1 46%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
106]:/.utilization_load_avg
   1297519 =C2=B1  2%     -99.8%       1980 =C2=B1  3%  sched_debug.cfs_rq[=
106]:/.tg_load_avg
     13919 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
106]:/.blocked_load_avg
   1297805 =C2=B1  2%     -99.8%       1975 =C2=B1  3%  sched_debug.cfs_rq[=
107]:/.tg_load_avg
       163 =C2=B1 34%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
107]:/.utilization_load_avg
     13335 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
107]:/.tg_load_contrib
     13224 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
107]:/.blocked_load_avg
  17429448 =C2=B1  3%     -85.0%    2615721 =C2=B1 32%  sched_debug.cfs_rq[=
107]:/.min_vruntime
     13087 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
108]:/.blocked_load_avg
   1298273 =C2=B1  2%     -99.8%       1973 =C2=B1  3%  sched_debug.cfs_rq[=
108]:/.tg_load_avg
  17139485 =C2=B1  3%     -84.9%    2593242 =C2=B1 32%  sched_debug.cfs_rq[=
108]:/.min_vruntime
     13181 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
108]:/.tg_load_contrib
       126 =C2=B1 26%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
108]:/.utilization_load_avg
     13576 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
109]:/.tg_load_contrib
  17013902 =C2=B1  2%     -84.7%    2602111 =C2=B1 32%  sched_debug.cfs_rq[=
109]:/.min_vruntime
     13494 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
109]:/.blocked_load_avg
   1296843 =C2=B1  2%     -99.8%       1970 =C2=B1  3%  sched_debug.cfs_rq[=
109]:/.tg_load_avg
       134 =C2=B1 46%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
109]:/.utilization_load_avg
        53 =C2=B1 42%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.utilization_load_avg
     63989 =C2=B1  4%     +36.6%      87389 =C2=B1  2%  sched_debug.cfs_rq[=
10]:/.exec_clock
  30520609 =C2=B1  4%     -67.4%    9936406 =C2=B1  4%  sched_debug.cfs_rq[=
10]:/.min_vruntime
      6828 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
   1263785 =C2=B1  2%     -99.8%       2110 =C2=B1  5%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
      6726 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.blocked_load_avg
     12571 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
110]:/.tg_load_contrib
        89 =C2=B1 37%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
110]:/.utilization_load_avg
     12509 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
110]:/.blocked_load_avg
  16981688 =C2=B1  2%     -84.6%    2622647 =C2=B1 33%  sched_debug.cfs_rq[=
110]:/.min_vruntime
   1298970 =C2=B1  2%     -99.8%       1972 =C2=B1  3%  sched_debug.cfs_rq[=
110]:/.tg_load_avg
     13166 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
111]:/.tg_load_contrib
  16855401 =C2=B1  2%     -84.5%    2607113 =C2=B1 33%  sched_debug.cfs_rq[=
111]:/.min_vruntime
     13072 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
111]:/.blocked_load_avg
   1298512 =C2=B1  2%     -99.8%       1974 =C2=B1  3%  sched_debug.cfs_rq[=
111]:/.tg_load_avg
       100 =C2=B1 49%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
111]:/.utilization_load_avg
       110 =C2=B1 20%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
112]:/.utilization_load_avg
     12700 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
112]:/.blocked_load_avg
  16786802 =C2=B1  2%     -84.4%    2620052 =C2=B1 33%  sched_debug.cfs_rq[=
112]:/.min_vruntime
     12786 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
112]:/.tg_load_contrib
   1299098 =C2=B1  2%     -99.8%       1974 =C2=B1  3%  sched_debug.cfs_rq[=
112]:/.tg_load_avg
     12233 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
113]:/.tg_load_contrib
     12173 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
113]:/.blocked_load_avg
       101 =C2=B1 24%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
113]:/.utilization_load_avg
  16747527 =C2=B1  2%     -84.3%    2621005 =C2=B1 32%  sched_debug.cfs_rq[=
113]:/.min_vruntime
   1298913 =C2=B1  2%     -99.8%       1971 =C2=B1  3%  sched_debug.cfs_rq[=
113]:/.tg_load_avg
  16710632 =C2=B1  2%     -84.5%    2597564 =C2=B1 33%  sched_debug.cfs_rq[=
114]:/.min_vruntime
     13379 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
114]:/.tg_load_contrib
     13324 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
114]:/.blocked_load_avg
   1298550 =C2=B1  2%     -99.8%       1965 =C2=B1  3%  sched_debug.cfs_rq[=
114]:/.tg_load_avg
   1298650 =C2=B1  2%     -99.8%       1966 =C2=B1  3%  sched_debug.cfs_rq[=
115]:/.tg_load_avg
  16857312 =C2=B1  2%     -84.6%    2589869 =C2=B1 32%  sched_debug.cfs_rq[=
115]:/.min_vruntime
     12773 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
115]:/.tg_load_contrib
     12701 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
115]:/.blocked_load_avg
       168 =C2=B1 36%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
116]:/.utilization_load_avg
     12513 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
116]:/.tg_load_contrib
  16942146 =C2=B1  2%     -84.6%    2612577 =C2=B1 32%  sched_debug.cfs_rq[=
116]:/.min_vruntime
     12422 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
116]:/.blocked_load_avg
   1296968 =C2=B1  2%     -99.8%       1965 =C2=B1  3%  sched_debug.cfs_rq[=
116]:/.tg_load_avg
     13522 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
117]:/.tg_load_contrib
     13453 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
117]:/.blocked_load_avg
  17062474 =C2=B1  2%     -84.8%    2588672 =C2=B1 33%  sched_debug.cfs_rq[=
117]:/.min_vruntime
       127 =C2=B1 35%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
117]:/.utilization_load_avg
   1296448 =C2=B1  2%     -99.8%       1964 =C2=B1  3%  sched_debug.cfs_rq[=
117]:/.tg_load_avg
     12634 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
118]:/.blocked_load_avg
  17268018 =C2=B1  2%     -85.1%    2579101 =C2=B1 32%  sched_debug.cfs_rq[=
118]:/.min_vruntime
        95 =C2=B1 49%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
118]:/.utilization_load_avg
   1296574 =C2=B1  2%     -99.8%       1964 =C2=B1  3%  sched_debug.cfs_rq[=
118]:/.tg_load_avg
     12681 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
118]:/.tg_load_contrib
  17625296 =C2=B1  2%     -85.4%    2574849 =C2=B1 32%  sched_debug.cfs_rq[=
119]:/.min_vruntime
     12767 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
119]:/.blocked_load_avg
       127 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
119]:/.utilization_load_avg
     12836 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
119]:/.tg_load_contrib
   1296763 =C2=B1  2%     -99.8%       1966 =C2=B1  3%  sched_debug.cfs_rq[=
119]:/.tg_load_avg
         1 =C2=B1  0%   +1250.0%         13 =C2=B1  8%  sched_debug.cfs_rq[=
11]:/.runnable_load_avg
   1264432 =C2=B1  2%     -99.8%       2108 =C2=B1  5%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
        53 =C2=B1 34%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.utilization_load_avg
  30345143 =C2=B1  4%     -67.3%    9918910 =C2=B1  5%  sched_debug.cfs_rq[=
11]:/.min_vruntime
     63568 =C2=B1  4%     +37.4%      87364 =C2=B1  3%  sched_debug.cfs_rq[=
11]:/.exec_clock
      7120 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg_load_contrib
      7029 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.blocked_load_avg
     63197 =C2=B1  4%     +38.2%      87315 =C2=B1  3%  sched_debug.cfs_rq[=
12]:/.exec_clock
        48 =C2=B1 19%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.utilization_load_avg
      6997 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.blocked_load_avg
  30157769 =C2=B1  4%     -67.1%    9923363 =C2=B1  5%  sched_debug.cfs_rq[=
12]:/.min_vruntime
   1263051 =C2=B1  2%     -99.8%       2106 =C2=B1  5%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
      7084 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg_load_contrib
   1717292 =C2=B1 22%     -64.2%     615535 =C2=B1 25%  sched_debug.cfs_rq[=
13]:/.max_vruntime
   1717292 =C2=B1 22%     -64.2%     615535 =C2=B1 25%  sched_debug.cfs_rq[=
13]:/.MIN_vruntime
      7336 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg_load_contrib
      7243 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.blocked_load_avg
  30048314 =C2=B1  4%     -67.0%    9913403 =C2=B1  4%  sched_debug.cfs_rq[=
13]:/.min_vruntime
   1264142 =C2=B1  2%     -99.8%       2100 =C2=B1  5%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
     63053 =C2=B1  4%     +38.9%      87610 =C2=B1  3%  sched_debug.cfs_rq[=
13]:/.exec_clock
      6776 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg_load_contrib
     62893 =C2=B1  4%     +39.2%      87531 =C2=B1  3%  sched_debug.cfs_rq[=
14]:/.exec_clock
        60 =C2=B1 16%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.utilization_load_avg
  29921296 =C2=B1  4%     -66.9%    9894201 =C2=B1  4%  sched_debug.cfs_rq[=
14]:/.min_vruntime
   1262418 =C2=B1  2%     -99.8%       2096 =C2=B1  5%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
      6678 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.blocked_load_avg
   1264287 =C2=B1  2%     -99.8%       2092 =C2=B1  5%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
      8277 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg_load_contrib
      8162 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.blocked_load_avg
        91 =C2=B1 31%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.utilization_load_avg
   1264502 =C2=B1  2%     -99.8%       2090 =C2=B1  5%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
      7647 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.blocked_load_avg
      7737 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.tg_load_contrib
         1 =C2=B1 33%   +1066.7%         17 =C2=B1 14%  sched_debug.cfs_rq[=
17]:/.runnable_load_avg
      7953 =C2=B1 17%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.blocked_load_avg
      8045 =C2=B1 17%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.tg_load_contrib
   1266771 =C2=B1  2%     -99.8%       2087 =C2=B1  5%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
      8027 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.blocked_load_avg
        69 =C2=B1 25%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.utilization_load_avg
      8149 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.tg_load_contrib
   1266363 =C2=B1  2%     -99.8%       2081 =C2=B1  5%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
      7689 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.blocked_load_avg
   1268542 =C2=B1  2%     -99.8%       2076 =C2=B1  5%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
      7821 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.tg_load_contrib
     65966 =C2=B1  4%     +32.2%      87214 =C2=B1  3%  sched_debug.cfs_rq[=
1]:/.exec_clock
  31421923 =C2=B1  4%     -68.6%    9853570 =C2=B1  5%  sched_debug.cfs_rq[=
1]:/.min_vruntime
      8521 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.blocked_load_avg
        58 =C2=B1 40%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.utilization_load_avg
      8629 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
         1 =C2=B1 34%    +940.0%         13 =C2=B1  7%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
   1259904 =C2=B1  2%     -99.8%       2129 =C2=B1  5%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
      7903 =C2=B1 11%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.tg_load_contrib
      7788 =C2=B1 11%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.blocked_load_avg
         1 =C2=B1  0%   +1650.0%         17 =C2=B1 18%  sched_debug.cfs_rq[=
20]:/.runnable_load_avg
   1268618 =C2=B1  2%     -99.8%       2075 =C2=B1  5%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
        70 =C2=B1 33%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.utilization_load_avg
      7483 =C2=B1 11%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.blocked_load_avg
   1267874 =C2=B1  2%     -99.8%       2072 =C2=B1  5%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
      7603 =C2=B1 11%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.tg_load_contrib
      7412 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.blocked_load_avg
   1269455 =C2=B1  2%     -99.8%       2067 =C2=B1  5%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
      7486 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.tg_load_contrib
      7603 =C2=B1 11%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.tg_load_contrib
   1268827 =C2=B1  2%     -99.8%       2062 =C2=B1  5%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
      7506 =C2=B1 11%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.blocked_load_avg
        38 =C2=B1 47%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.utilization_load_avg
      7408 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.blocked_load_avg
         1 =C2=B1 34%   +1420.0%         19 =C2=B1 18%  sched_debug.cfs_rq[=
24]:/.runnable_load_avg
   1272125 =C2=B1  2%     -99.8%       2060 =C2=B1  5%  sched_debug.cfs_rq[=
24]:/.tg_load_avg
      7527 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.tg_load_contrib
      8034 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.blocked_load_avg
      8175 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.tg_load_contrib
        32 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.utilization_load_avg
         1 =C2=B1  0%   +1725.0%         18 =C2=B1 18%  sched_debug.cfs_rq[=
25]:/.runnable_load_avg
   1273513 =C2=B1  2%     -99.8%       2059 =C2=B1  5%  sched_debug.cfs_rq[=
25]:/.tg_load_avg
   1271660 =C2=B1  2%     -99.8%       2055 =C2=B1  5%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
      7386 =C2=B1 16%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.blocked_load_avg
      7496 =C2=B1 17%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.tg_load_contrib
      8025 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.tg_load_contrib
   1270142 =C2=B1  2%     -99.8%       2048 =C2=B1  5%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
      7899 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.blocked_load_avg
      7912 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.blocked_load_avg
        96 =C2=B1 41%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.utilization_load_avg
      8021 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.tg_load_contrib
   1272513 =C2=B1  2%     -99.8%       2047 =C2=B1  5%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
      7453 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.blocked_load_avg
      7567 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.tg_load_contrib
   1273454 =C2=B1  1%     -99.8%       2045 =C2=B1  5%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
     68132 =C2=B1  3%     +29.9%      88514 =C2=B1  4%  sched_debug.cfs_rq[=
2]:/.exec_clock
  32561605 =C2=B1  3%     -69.6%    9886080 =C2=B1  4%  sched_debug.cfs_rq[=
2]:/.min_vruntime
      7200 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.blocked_load_avg
   1255791 =C2=B1  2%     -99.8%       2129 =C2=B1  5%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
      7297 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
         1 =C2=B1  0%   +1325.0%         14 =C2=B1 12%  sched_debug.cfs_rq[=
30]:/.runnable_load_avg
   1274303 =C2=B1  1%     -99.8%       2043 =C2=B1  5%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
        60 =C2=B1 44%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.utilization_load_avg
      8222 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.blocked_load_avg
      8350 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.tg_load_contrib
  32370033 =C2=B1  6%     -74.5%    8241237 =C2=B1 15%  sched_debug.cfs_rq[=
30]:/.min_vruntime
   1276736 =C2=B1  1%     -99.8%       2041 =C2=B1  5%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
      7796 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.tg_load_contrib
  32444271 =C2=B1  6%     -74.9%    8133972 =C2=B1 14%  sched_debug.cfs_rq[=
31]:/.min_vruntime
      7675 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.blocked_load_avg
        49 =C2=B1 22%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.utilization_load_avg
  32025935 =C2=B1  7%     -74.5%    8152920 =C2=B1 15%  sched_debug.cfs_rq[=
32]:/.min_vruntime
      7761 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.tg_load_contrib
      7629 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.blocked_load_avg
   1276111 =C2=B1  1%     -99.8%       2034 =C2=B1  5%  sched_debug.cfs_rq[=
32]:/.tg_load_avg
   1276774 =C2=B1  1%     -99.8%       2031 =C2=B1  5%  sched_debug.cfs_rq[=
33]:/.tg_load_avg
  31628083 =C2=B1  7%     -74.2%    8144756 =C2=B1 15%  sched_debug.cfs_rq[=
33]:/.min_vruntime
      7696 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.blocked_load_avg
      7826 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.tg_load_contrib
  31244748 =C2=B1  7%     -73.9%    8143865 =C2=B1 15%  sched_debug.cfs_rq[=
34]:/.min_vruntime
      7539 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.tg_load_contrib
        45 =C2=B1 34%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.utilization_load_avg
      7436 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.blocked_load_avg
   1277729 =C2=B1  1%     -99.8%       2028 =C2=B1  5%  sched_debug.cfs_rq[=
34]:/.tg_load_avg
         1 =C2=B1  0%   +1400.0%         15 =C2=B1 12%  sched_debug.cfs_rq[=
34]:/.runnable_load_avg
        59 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.utilization_load_avg
      6769 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.blocked_load_avg
      6867 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.tg_load_contrib
  30835233 =C2=B1  8%     -73.3%    8237780 =C2=B1 15%  sched_debug.cfs_rq[=
35]:/.min_vruntime
   1276250 =C2=B1  1%     -99.8%       2023 =C2=B1  5%  sched_debug.cfs_rq[=
35]:/.tg_load_avg
   1276527 =C2=B1  1%     -99.8%       2019 =C2=B1  5%  sched_debug.cfs_rq[=
36]:/.tg_load_avg
      7790 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.blocked_load_avg
        91 =C2=B1 22%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.utilization_load_avg
  31206999 =C2=B1  6%     -73.7%    8216155 =C2=B1 15%  sched_debug.cfs_rq[=
36]:/.min_vruntime
      7898 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.tg_load_contrib
   1276979 =C2=B1  1%     -99.8%       2018 =C2=B1  5%  sched_debug.cfs_rq[=
37]:/.tg_load_avg
      7495 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.tg_load_contrib
  31284022 =C2=B1  6%     -73.7%    8225683 =C2=B1 15%  sched_debug.cfs_rq[=
37]:/.min_vruntime
      7376 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.blocked_load_avg
         1 =C2=B1  0%   +1350.0%         14 =C2=B1 14%  sched_debug.cfs_rq[=
38]:/.runnable_load_avg
      7167 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.blocked_load_avg
        60 =C2=B1 28%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.utilization_load_avg
  31287625 =C2=B1  5%     -73.9%    8159876 =C2=B1 15%  sched_debug.cfs_rq[=
38]:/.min_vruntime
      7274 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.tg_load_contrib
   1275869 =C2=B1  1%     -99.8%       2017 =C2=B1  5%  sched_debug.cfs_rq[=
38]:/.tg_load_avg
      7581 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.blocked_load_avg
   1036555 =C2=B1 32%     -68.3%     328720 =C2=B1 48%  sched_debug.cfs_rq[=
39]:/.MIN_vruntime
   1036555 =C2=B1 32%     -68.3%     328720 =C2=B1 48%  sched_debug.cfs_rq[=
39]:/.max_vruntime
        63 =C2=B1 33%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.utilization_load_avg
      7709 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.tg_load_contrib
   1277209 =C2=B1  1%     -99.8%       2012 =C2=B1  6%  sched_debug.cfs_rq[=
39]:/.tg_load_avg
  31179610 =C2=B1  5%     -73.7%    8186405 =C2=B1 15%  sched_debug.cfs_rq[=
39]:/.min_vruntime
     67498 =C2=B1  4%     +34.3%      90623 =C2=B1  2%  sched_debug.cfs_rq[=
3]:/.exec_clock
      7223 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
  32380079 =C2=B1  3%     -69.4%    9900194 =C2=B1  5%  sched_debug.cfs_rq[=
3]:/.min_vruntime
      7110 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
   1256951 =C2=B1  2%     -99.8%       2126 =C2=B1  5%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
   1278998 =C2=B1  1%     -99.8%       2008 =C2=B1  6%  sched_debug.cfs_rq[=
40]:/.tg_load_avg
      7455 =C2=B1 16%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.blocked_load_avg
        39 =C2=B1 43%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.utilization_load_avg
      7588 =C2=B1 17%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.tg_load_contrib
  31181443 =C2=B1  5%     -73.8%    8166086 =C2=B1 15%  sched_debug.cfs_rq[=
40]:/.min_vruntime
      8071 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.tg_load_contrib
        48 =C2=B1 48%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.utilization_load_avg
  31219849 =C2=B1  6%     -74.0%    8128936 =C2=B1 15%  sched_debug.cfs_rq[=
41]:/.min_vruntime
      7959 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.blocked_load_avg
   1279508 =C2=B1  1%     -99.8%       2006 =C2=B1  6%  sched_debug.cfs_rq[=
41]:/.tg_load_avg
         0 =C2=B1  0%      +Inf%          2 =C2=B1 44%  sched_debug.cfs_rq[=
41]:/.load
   1278063 =C2=B1  1%     -99.8%       2003 =C2=B1  6%  sched_debug.cfs_rq[=
42]:/.tg_load_avg
  31280500 =C2=B1  6%     -74.0%    8145420 =C2=B1 15%  sched_debug.cfs_rq[=
42]:/.min_vruntime
      7558 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.tg_load_contrib
      7474 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.blocked_load_avg
         1 =C2=B1  0%   +1375.0%         14 =C2=B1 10%  sched_debug.cfs_rq[=
43]:/.runnable_load_avg
   1279939 =C2=B1  1%     -99.8%       2004 =C2=B1  6%  sched_debug.cfs_rq[=
43]:/.tg_load_avg
        38 =C2=B1 46%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.utilization_load_avg
      7496 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.blocked_load_avg
  31380609 =C2=B1  6%     -74.0%    8147480 =C2=B1 15%  sched_debug.cfs_rq[=
43]:/.min_vruntime
      7601 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.tg_load_contrib
   1279763 =C2=B1  1%     -99.8%       2000 =C2=B1  6%  sched_debug.cfs_rq[=
44]:/.tg_load_avg
  31657973 =C2=B1  6%     -74.3%    8141050 =C2=B1 15%  sched_debug.cfs_rq[=
44]:/.min_vruntime
      8355 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.tg_load_contrib
      8250 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.blocked_load_avg
      8589 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.tg_load_contrib
        68 =C2=B1 45%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.utilization_load_avg
   1279921 =C2=B1  1%     -99.8%       1999 =C2=B1  6%  sched_debug.cfs_rq[=
45]:/.tg_load_avg
  32303098 =C2=B1  2%     -81.2%    6060450 =C2=B1 27%  sched_debug.cfs_rq[=
45]:/.min_vruntime
      8480 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.blocked_load_avg
  32574894 =C2=B1  2%     -81.5%    6025932 =C2=B1 28%  sched_debug.cfs_rq[=
46]:/.min_vruntime
   1282275 =C2=B1  1%     -99.8%       2001 =C2=B1  6%  sched_debug.cfs_rq[=
46]:/.tg_load_avg
      7869 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.blocked_load_avg
      7995 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.tg_load_contrib
         1 =C2=B1  0%   +1375.0%         14 =C2=B1  5%  sched_debug.cfs_rq[=
46]:/.runnable_load_avg
  32356280 =C2=B1  2%     -81.5%    5995175 =C2=B1 29%  sched_debug.cfs_rq[=
47]:/.min_vruntime
   1281150 =C2=B1  2%     -99.8%       2005 =C2=B1  6%  sched_debug.cfs_rq[=
47]:/.tg_load_avg
      7930 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.blocked_load_avg
        76 =C2=B1 49%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.utilization_load_avg
      8081 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.tg_load_contrib
        50 =C2=B1 18%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.utilization_load_avg
      7808 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.blocked_load_avg
      7911 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.tg_load_contrib
   1280329 =C2=B1  1%     -99.8%       2002 =C2=B1  6%  sched_debug.cfs_rq[=
48]:/.tg_load_avg
         1 =C2=B1  0%   +1450.0%         15 =C2=B1  7%  sched_debug.cfs_rq[=
48]:/.runnable_load_avg
  32077870 =C2=B1  2%     -81.2%    6026082 =C2=B1 27%  sched_debug.cfs_rq[=
48]:/.min_vruntime
      8085 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.tg_load_contrib
  31747791 =C2=B1  2%     -81.1%    6009817 =C2=B1 28%  sched_debug.cfs_rq[=
49]:/.min_vruntime
   1281102 =C2=B1  1%     -99.8%       1997 =C2=B1  6%  sched_debug.cfs_rq[=
49]:/.tg_load_avg
      7957 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.blocked_load_avg
     67069 =C2=B1  4%     +30.4%      87454 =C2=B1  3%  sched_debug.cfs_rq[=
4]:/.exec_clock
  31984181 =C2=B1  3%     -68.9%    9948076 =C2=B1  5%  sched_debug.cfs_rq[=
4]:/.min_vruntime
   1258251 =C2=B1  2%     -99.8%       2123 =C2=B1  5%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
      7152 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
         1 =C2=B1 34%    +960.0%         13 =C2=B1  6%  sched_debug.cfs_rq[=
4]:/.runnable_load_avg
      7264 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
        48 =C2=B1 34%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.utilization_load_avg
   1282542 =C2=B1  2%     -99.8%       1993 =C2=B1  6%  sched_debug.cfs_rq[=
50]:/.tg_load_avg
      7716 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.tg_load_contrib
      7592 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.blocked_load_avg
  31620130 =C2=B1  2%     -80.7%    6090204 =C2=B1 28%  sched_debug.cfs_rq[=
50]:/.min_vruntime
      7663 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.blocked_load_avg
  31495201 =C2=B1  2%     -80.8%    6058202 =C2=B1 28%  sched_debug.cfs_rq[=
51]:/.min_vruntime
        80 =C2=B1 26%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.utilization_load_avg
      7768 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.tg_load_contrib
   1282028 =C2=B1  1%     -99.8%       1987 =C2=B1  6%  sched_debug.cfs_rq[=
51]:/.tg_load_avg
  31275600 =C2=B1  2%     -80.7%    6034367 =C2=B1 28%  sched_debug.cfs_rq[=
52]:/.min_vruntime
      7925 =C2=B1 16%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.blocked_load_avg
   1284572 =C2=B1  1%     -99.8%       1990 =C2=B1  6%  sched_debug.cfs_rq[=
52]:/.tg_load_avg
      8036 =C2=B1 16%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.tg_load_contrib
  31176732 =C2=B1  2%     -80.6%    6054590 =C2=B1 28%  sched_debug.cfs_rq[=
53]:/.min_vruntime
   1284665 =C2=B1  2%     -99.8%       1988 =C2=B1  6%  sched_debug.cfs_rq[=
53]:/.tg_load_avg
      7571 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.tg_load_contrib
      7469 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.blocked_load_avg
  31105150 =C2=B1  2%     -80.7%    5993395 =C2=B1 28%  sched_debug.cfs_rq[=
54]:/.min_vruntime
      7313 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.blocked_load_avg
   1285119 =C2=B1  2%     -99.8%       1984 =C2=B1  6%  sched_debug.cfs_rq[=
54]:/.tg_load_avg
      7424 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.tg_load_contrib
   1286085 =C2=B1  2%     -99.8%       1980 =C2=B1  6%  sched_debug.cfs_rq[=
55]:/.tg_load_avg
      8183 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.tg_load_contrib
      8079 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.blocked_load_avg
  31123445 =C2=B1  2%     -80.8%    5975863 =C2=B1 28%  sched_debug.cfs_rq[=
55]:/.min_vruntime
      7561 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
56]:/.tg_load_contrib
   1285969 =C2=B1  2%     -99.8%       1980 =C2=B1  6%  sched_debug.cfs_rq[=
56]:/.tg_load_avg
  31208163 =C2=B1  2%     -80.9%    5968001 =C2=B1 28%  sched_debug.cfs_rq[=
56]:/.min_vruntime
        45 =C2=B1 46%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
56]:/.utilization_load_avg
      7460 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
56]:/.blocked_load_avg
         1 =C2=B1 34%   +1140.0%         15 =C2=B1  9%  sched_debug.cfs_rq[=
56]:/.runnable_load_avg
        76 =C2=B1 38%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
57]:/.utilization_load_avg
      7834 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
57]:/.blocked_load_avg
  31282504 =C2=B1  2%     -80.9%    5971017 =C2=B1 27%  sched_debug.cfs_rq[=
57]:/.min_vruntime
      7932 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
57]:/.tg_load_contrib
   1287860 =C2=B1  2%     -99.8%       1982 =C2=B1  6%  sched_debug.cfs_rq[=
57]:/.tg_load_avg
         1 =C2=B1 47%    +814.3%         16 =C2=B1 11%  sched_debug.cfs_rq[=
57]:/.runnable_load_avg
      8087 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
58]:/.blocked_load_avg
      8213 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
58]:/.tg_load_contrib
  31460262 =C2=B1  2%     -80.9%    5999599 =C2=B1 28%  sched_debug.cfs_rq[=
58]:/.min_vruntime
        74 =C2=B1 40%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
58]:/.utilization_load_avg
   1286949 =C2=B1  2%     -99.8%       1985 =C2=B1  6%  sched_debug.cfs_rq[=
58]:/.tg_load_avg
   1288900 =C2=B1  2%     -99.8%       1985 =C2=B1  6%  sched_debug.cfs_rq[=
59]:/.tg_load_avg
        82 =C2=B1 45%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
59]:/.utilization_load_avg
  31665848 =C2=B1  2%     -81.1%    5982858 =C2=B1 28%  sched_debug.cfs_rq[=
59]:/.min_vruntime
         1 =C2=B1 34%   +1180.0%         16 =C2=B1 11%  sched_debug.cfs_rq[=
59]:/.runnable_load_avg
      8296 =C2=B1 11%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
59]:/.blocked_load_avg
      8421 =C2=B1 11%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
59]:/.tg_load_contrib
     66338 =C2=B1  3%     +32.1%      87605 =C2=B1  3%  sched_debug.cfs_rq[=
5]:/.exec_clock
   1259776 =C2=B1  2%     -99.8%       2121 =C2=B1  5%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
   2903821 =C2=B1 15%     -96.9%      89014 =C2=B1 43%  sched_debug.cfs_rq[=
5]:/.spread0
      7252 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
        59 =C2=B1 31%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.utilization_load_avg
  31604243 =C2=B1  4%     -68.3%   10021931 =C2=B1  5%  sched_debug.cfs_rq[=
5]:/.min_vruntime
      7138 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.blocked_load_avg
         1 =C2=B1  0%   +1250.0%         13 =C2=B1  3%  sched_debug.cfs_rq[=
5]:/.runnable_load_avg
  17261898 =C2=B1  6%     -75.8%    4174611 =C2=B1  3%  sched_debug.cfs_rq[=
60]:/.min_vruntime
       155 =C2=B1 23%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
60]:/.utilization_load_avg
     14071 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
60]:/.blocked_load_avg
   1291042 =C2=B1  2%     -99.8%       1987 =C2=B1  6%  sched_debug.cfs_rq[=
60]:/.tg_load_avg
     37257 =C2=B1  7%     +19.8%      44627 =C2=B1  7%  sched_debug.cfs_rq[=
60]:/.exec_clock
     14143 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
60]:/.tg_load_contrib
  18970013 =C2=B1  5%     -78.4%    4104573 =C2=B1  3%  sched_debug.cfs_rq[=
61]:/.min_vruntime
       173 =C2=B1 32%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
61]:/.utilization_load_avg
     16260 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
61]:/.tg_load_contrib
     40852 =C2=B1  6%     +11.5%      45550 =C2=B1  6%  sched_debug.cfs_rq[=
61]:/.exec_clock
     16158 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
61]:/.blocked_load_avg
   1290339 =C2=B1  2%     -99.8%       1990 =C2=B1  6%  sched_debug.cfs_rq[=
61]:/.tg_load_avg
     38545 =C2=B1  6%     +17.7%      45356 =C2=B1  7%  sched_debug.cfs_rq[=
62]:/.exec_clock
     15379 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
62]:/.tg_load_contrib
     15302 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
62]:/.blocked_load_avg
  17851602 =C2=B1  5%     -76.9%    4122318 =C2=B1  3%  sched_debug.cfs_rq[=
62]:/.min_vruntime
   1289834 =C2=B1  2%     -99.8%       1992 =C2=B1  6%  sched_debug.cfs_rq[=
62]:/.tg_load_avg
     37345 =C2=B1  5%     +21.0%      45199 =C2=B1  8%  sched_debug.cfs_rq[=
63]:/.exec_clock
  17288069 =C2=B1  5%     -76.3%    4100823 =C2=B1  2%  sched_debug.cfs_rq[=
63]:/.min_vruntime
       111 =C2=B1 36%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
63]:/.utilization_load_avg
     14615 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
63]:/.tg_load_contrib
     14512 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
63]:/.blocked_load_avg
   1288713 =C2=B1  1%     -99.8%       1988 =C2=B1  6%  sched_debug.cfs_rq[=
63]:/.tg_load_avg
     15023 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
64]:/.blocked_load_avg
     36714 =C2=B1  5%     +23.2%      45215 =C2=B1  7%  sched_debug.cfs_rq[=
64]:/.exec_clock
  16943908 =C2=B1  5%     -75.8%    4102781 =C2=B1  4%  sched_debug.cfs_rq[=
64]:/.min_vruntime
     15120 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
64]:/.tg_load_contrib
   1289203 =C2=B1  2%     -99.8%       1983 =C2=B1  6%  sched_debug.cfs_rq[=
64]:/.tg_load_avg
   1288770 =C2=B1  1%     -99.8%       1987 =C2=B1  5%  sched_debug.cfs_rq[=
65]:/.tg_load_avg
     14368 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
65]:/.tg_load_contrib
     36363 =C2=B1  5%     +24.6%      45315 =C2=B1  7%  sched_debug.cfs_rq[=
65]:/.exec_clock
  16805184 =C2=B1  5%     -75.4%    4127563 =C2=B1  3%  sched_debug.cfs_rq[=
65]:/.min_vruntime
     14276 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
65]:/.blocked_load_avg
       120 =C2=B1 46%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
65]:/.utilization_load_avg
     35814 =C2=B1  5%     +26.5%      45320 =C2=B1  7%  sched_debug.cfs_rq[=
66]:/.exec_clock
  16586490 =C2=B1  5%     -75.2%    4110024 =C2=B1  4%  sched_debug.cfs_rq[=
66]:/.min_vruntime
     14003 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
66]:/.blocked_load_avg
       110 =C2=B1 20%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
66]:/.utilization_load_avg
     14100 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
66]:/.tg_load_contrib
   1289222 =C2=B1  2%     -99.8%       1987 =C2=B1  5%  sched_debug.cfs_rq[=
66]:/.tg_load_avg
     14693 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
67]:/.tg_load_contrib
       121 =C2=B1 18%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
67]:/.utilization_load_avg
     14593 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
67]:/.blocked_load_avg
     36596 =C2=B1  7%     +22.7%      44914 =C2=B1  7%  sched_debug.cfs_rq[=
67]:/.exec_clock
   1288991 =C2=B1  2%     -99.8%       1990 =C2=B1  6%  sched_debug.cfs_rq[=
67]:/.tg_load_avg
  16933869 =C2=B1  7%     -75.7%    4122680 =C2=B1  4%  sched_debug.cfs_rq[=
67]:/.min_vruntime
     35949 =C2=B1  6%     +25.3%      45027 =C2=B1  7%  sched_debug.cfs_rq[=
68]:/.exec_clock
       133 =C2=B1 18%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
68]:/.utilization_load_avg
     13595 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
68]:/.tg_load_contrib
   1291134 =C2=B1  1%     -99.8%       1984 =C2=B1  5%  sched_debug.cfs_rq[=
68]:/.tg_load_avg
  16638068 =C2=B1  6%     -75.4%    4099752 =C2=B1  5%  sched_debug.cfs_rq[=
68]:/.min_vruntime
     13504 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
68]:/.blocked_load_avg
     13378 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
69]:/.tg_load_contrib
   1287493 =C2=B1  1%     -99.8%       1987 =C2=B1  5%  sched_debug.cfs_rq[=
69]:/.tg_load_avg
     13324 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
69]:/.blocked_load_avg
         0 =C2=B1  0%      +Inf%         17 =C2=B1 48%  sched_debug.cfs_rq[=
69]:/.load
  16378018 =C2=B1  5%     -74.9%    4104247 =C2=B1  4%  sched_debug.cfs_rq[=
69]:/.min_vruntime
     35482 =C2=B1  6%     +26.9%      45034 =C2=B1  7%  sched_debug.cfs_rq[=
69]:/.exec_clock
        89 =C2=B1 34%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
69]:/.utilization_load_avg
     65237 =C2=B1  4%     +34.7%      87901 =C2=B1  3%  sched_debug.cfs_rq[=
6]:/.exec_clock
      6945 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
   1260608 =C2=B1  2%     -99.8%       2120 =C2=B1  5%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
         0 =C2=B1  0%      +Inf%          3 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.load
      7046 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
  31032393 =C2=B1  4%     -67.8%    9984141 =C2=B1  4%  sched_debug.cfs_rq[=
6]:/.min_vruntime
  16185513 =C2=B1  6%     -74.7%    4088386 =C2=B1  4%  sched_debug.cfs_rq[=
70]:/.min_vruntime
   1289167 =C2=B1  1%     -99.8%       1988 =C2=B1  5%  sched_debug.cfs_rq[=
70]:/.tg_load_avg
     14068 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
70]:/.tg_load_contrib
        74 =C2=B1 31%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
70]:/.utilization_load_avg
     34993 =C2=B1  6%     +28.5%      44959 =C2=B1  7%  sched_debug.cfs_rq[=
70]:/.exec_clock
     13985 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
70]:/.blocked_load_avg
     13431 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
71]:/.tg_load_contrib
     34807 =C2=B1  6%     +29.8%      45176 =C2=B1  6%  sched_debug.cfs_rq[=
71]:/.exec_clock
        95 =C2=B1 39%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
71]:/.utilization_load_avg
   1288733 =C2=B1  1%     -99.8%       1993 =C2=B1  5%  sched_debug.cfs_rq[=
71]:/.tg_load_avg
  16070569 =C2=B1  6%     -74.4%    4110886 =C2=B1  5%  sched_debug.cfs_rq[=
71]:/.min_vruntime
     13367 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
71]:/.blocked_load_avg
        90 =C2=B1 34%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
72]:/.utilization_load_avg
     34683 =C2=B1  7%     +31.7%      45667 =C2=B1  7%  sched_debug.cfs_rq[=
72]:/.exec_clock
     13512 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
72]:/.blocked_load_avg
   1286529 =C2=B1  1%     -99.8%       1993 =C2=B1  5%  sched_debug.cfs_rq[=
72]:/.tg_load_avg
  15993091 =C2=B1  6%     -74.4%    4093989 =C2=B1  4%  sched_debug.cfs_rq[=
72]:/.min_vruntime
     13576 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
72]:/.tg_load_contrib
     12533 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
73]:/.tg_load_contrib
  15963083 =C2=B1  6%     -74.3%    4100627 =C2=B1  4%  sched_debug.cfs_rq[=
73]:/.min_vruntime
     34556 =C2=B1  7%     +30.6%      45126 =C2=B1  7%  sched_debug.cfs_rq[=
73]:/.exec_clock
     12446 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
73]:/.blocked_load_avg
   1286434 =C2=B1  2%     -99.8%       1995 =C2=B1  5%  sched_debug.cfs_rq[=
73]:/.tg_load_avg
     12633 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
74]:/.blocked_load_avg
  15968393 =C2=B1  6%     -74.4%    4080116 =C2=B1  3%  sched_debug.cfs_rq[=
74]:/.min_vruntime
   1287548 =C2=B1  1%     -99.8%       1999 =C2=B1  5%  sched_debug.cfs_rq[=
74]:/.tg_load_avg
     34553 =C2=B1  7%     +30.1%      44965 =C2=B1  7%  sched_debug.cfs_rq[=
74]:/.exec_clock
     12692 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
74]:/.tg_load_contrib
        80 =C2=B1 21%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
74]:/.utilization_load_avg
     15616 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
75]:/.tg_load_contrib
     15525 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
75]:/.blocked_load_avg
   1288073 =C2=B1  1%     -99.8%       2003 =C2=B1  5%  sched_debug.cfs_rq[=
75]:/.tg_load_avg
       147 =C2=B1 20%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
75]:/.utilization_load_avg
       110 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
76]:/.utilization_load_avg
   1287479 =C2=B1  1%     -99.8%       1994 =C2=B1  5%  sched_debug.cfs_rq[=
76]:/.tg_load_avg
     15195 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
76]:/.tg_load_contrib
         1 =C2=B1 33%    +833.3%         14 =C2=B1 15%  sched_debug.cfs_rq[=
76]:/.runnable_load_avg
     15107 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
76]:/.blocked_load_avg
   1287305 =C2=B1  1%     -99.8%       1998 =C2=B1  5%  sched_debug.cfs_rq[=
77]:/.tg_load_avg
       137 =C2=B1 42%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
77]:/.utilization_load_avg
     15832 =C2=B1 20%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
77]:/.blocked_load_avg
     15911 =C2=B1 20%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
77]:/.tg_load_contrib
   1286971 =C2=B1  1%     -99.8%       2001 =C2=B1  5%  sched_debug.cfs_rq[=
78]:/.tg_load_avg
     14248 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
78]:/.blocked_load_avg
     14352 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
78]:/.tg_load_contrib
       111 =C2=B1 34%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
78]:/.utilization_load_avg
     14411 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
79]:/.tg_load_contrib
   1288909 =C2=B1  1%     -99.8%       2001 =C2=B1  5%  sched_debug.cfs_rq[=
79]:/.tg_load_avg
        75 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
79]:/.utilization_load_avg
     14338 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
79]:/.blocked_load_avg
      7923 =C2=B1 11%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
     65375 =C2=B1  4%     +34.1%      87657 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.exec_clock
  31157107 =C2=B1  4%     -67.8%   10027453 =C2=B1  4%  sched_debug.cfs_rq[=
7]:/.min_vruntime
   1259259 =C2=B1  2%     -99.8%       2118 =C2=B1  5%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
        90 =C2=B1 25%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.utilization_load_avg
      7827 =C2=B1 11%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.blocked_load_avg
   1288387 =C2=B1  1%     -99.8%       2003 =C2=B1  5%  sched_debug.cfs_rq[=
80]:/.tg_load_avg
     14455 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
80]:/.blocked_load_avg
     14541 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
80]:/.tg_load_contrib
       122 =C2=B1 35%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
80]:/.utilization_load_avg
   1288733 =C2=B1  1%     -99.8%       1994 =C2=B1  4%  sched_debug.cfs_rq[=
81]:/.tg_load_avg
     14921 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
81]:/.tg_load_contrib
       131 =C2=B1 16%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
81]:/.utilization_load_avg
     14835 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
81]:/.blocked_load_avg
     13468 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
82]:/.tg_load_contrib
       116 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
82]:/.utilization_load_avg
         1 =C2=B1 34%   +1020.0%         14 =C2=B1 13%  sched_debug.cfs_rq[=
82]:/.runnable_load_avg
     13402 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
82]:/.blocked_load_avg
   1289545 =C2=B1  2%     -99.8%       1997 =C2=B1  4%  sched_debug.cfs_rq[=
82]:/.tg_load_avg
   1290465 =C2=B1  2%     -99.8%       1990 =C2=B1  3%  sched_debug.cfs_rq[=
83]:/.tg_load_avg
     13372 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
83]:/.blocked_load_avg
     13427 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
83]:/.tg_load_contrib
     13994 =C2=B1 18%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
84]:/.tg_load_contrib
   1288701 =C2=B1  2%     -99.8%       1994 =C2=B1  3%  sched_debug.cfs_rq[=
84]:/.tg_load_avg
     13914 =C2=B1 18%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
84]:/.blocked_load_avg
   1288295 =C2=B1  2%     -99.8%       1997 =C2=B1  3%  sched_debug.cfs_rq[=
85]:/.tg_load_avg
       136 =C2=B1 25%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
85]:/.utilization_load_avg
     14285 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
85]:/.tg_load_contrib
     14203 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
85]:/.blocked_load_avg
     14493 =C2=B1 16%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
86]:/.blocked_load_avg
   1290351 =C2=B1  2%     -99.8%       1999 =C2=B1  3%  sched_debug.cfs_rq[=
86]:/.tg_load_avg
     14582 =C2=B1 16%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
86]:/.tg_load_contrib
       131 =C2=B1 25%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
86]:/.utilization_load_avg
   1291995 =C2=B1  2%     -99.8%       1995 =C2=B1  3%  sched_debug.cfs_rq[=
87]:/.tg_load_avg
       157 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
87]:/.utilization_load_avg
     13568 =C2=B1 19%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
87]:/.blocked_load_avg
     13634 =C2=B1 19%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
87]:/.tg_load_contrib
     13771 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
88]:/.blocked_load_avg
   1294612 =C2=B1  2%     -99.8%       1999 =C2=B1  3%  sched_debug.cfs_rq[=
88]:/.tg_load_avg
       106 =C2=B1 37%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
88]:/.utilization_load_avg
     13848 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
88]:/.tg_load_contrib
     14099 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
89]:/.blocked_load_avg
     14179 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
89]:/.tg_load_contrib
   1293496 =C2=B1  2%     -99.8%       2000 =C2=B1  3%  sched_debug.cfs_rq[=
89]:/.tg_load_avg
       148 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
89]:/.utilization_load_avg
        53 =C2=B1 17%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.utilization_load_avg
      7008 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
  31125220 =C2=B1  4%     -67.8%   10016250 =C2=B1  4%  sched_debug.cfs_rq[=
8]:/.min_vruntime
      6909 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.blocked_load_avg
     65076 =C2=B1  4%     +34.3%      87412 =C2=B1  3%  sched_debug.cfs_rq[=
8]:/.exec_clock
   1260552 =C2=B1  2%     -99.8%       2116 =C2=B1  5%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
     15070 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
90]:/.tg_load_contrib
     14993 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
90]:/.blocked_load_avg
       160 =C2=B1 25%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
90]:/.utilization_load_avg
  18098859 =C2=B1  8%     -80.9%    3458486 =C2=B1 22%  sched_debug.cfs_rq[=
90]:/.min_vruntime
   1293608 =C2=B1  2%     -99.8%       2001 =C2=B1  3%  sched_debug.cfs_rq[=
90]:/.tg_load_avg
   1293253 =C2=B1  2%     -99.8%       2000 =C2=B1  3%  sched_debug.cfs_rq[=
91]:/.tg_load_avg
     13313 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
91]:/.blocked_load_avg
       181 =C2=B1 31%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
91]:/.utilization_load_avg
         1 =C2=B1 24%    +600.0%         12 =C2=B1 12%  sched_debug.cfs_rq[=
91]:/.runnable_load_avg
     13398 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
91]:/.tg_load_contrib
  17441462 =C2=B1  8%     -80.3%    3430296 =C2=B1 22%  sched_debug.cfs_rq[=
91]:/.min_vruntime
       106 =C2=B1 23%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
92]:/.utilization_load_avg
     13076 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
92]:/.blocked_load_avg
   1291860 =C2=B1  2%     -99.8%       1999 =C2=B1  3%  sched_debug.cfs_rq[=
92]:/.tg_load_avg
     13169 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
92]:/.tg_load_contrib
  17098211 =C2=B1  8%     -79.7%    3463238 =C2=B1 23%  sched_debug.cfs_rq[=
92]:/.min_vruntime
  16849249 =C2=B1  9%     -79.6%    3442554 =C2=B1 23%  sched_debug.cfs_rq[=
93]:/.min_vruntime
   1292421 =C2=B1  2%     -99.8%       1997 =C2=B1  3%  sched_debug.cfs_rq[=
93]:/.tg_load_avg
     13756 =C2=B1 18%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
93]:/.tg_load_contrib
       153 =C2=B1 38%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
93]:/.utilization_load_avg
     13669 =C2=B1 18%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
93]:/.blocked_load_avg
  16554257 =C2=B1  9%     -79.2%    3435110 =C2=B1 23%  sched_debug.cfs_rq[=
94]:/.min_vruntime
     13283 =C2=B1 18%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
94]:/.tg_load_contrib
   1293431 =C2=B1  2%     -99.8%       1996 =C2=B1  3%  sched_debug.cfs_rq[=
94]:/.tg_load_avg
     13226 =C2=B1 18%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
94]:/.blocked_load_avg
     13186 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
95]:/.tg_load_contrib
       121 =C2=B1 31%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
95]:/.utilization_load_avg
   1294318 =C2=B1  2%     -99.8%       1997 =C2=B1  3%  sched_debug.cfs_rq[=
95]:/.tg_load_avg
     13125 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
95]:/.blocked_load_avg
  16653435 =C2=B1  8%     -79.2%    3471376 =C2=B1 22%  sched_debug.cfs_rq[=
95]:/.min_vruntime
  17113324 =C2=B1  7%     -79.6%    3484867 =C2=B1 23%  sched_debug.cfs_rq[=
96]:/.min_vruntime
       137 =C2=B1 23%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
96]:/.utilization_load_avg
   1293535 =C2=B1  2%     -99.8%       1996 =C2=B1  3%  sched_debug.cfs_rq[=
96]:/.tg_load_avg
     14067 =C2=B1 11%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
96]:/.tg_load_contrib
     13983 =C2=B1 11%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
96]:/.blocked_load_avg
   1294425 =C2=B1  2%     -99.8%       1993 =C2=B1  3%  sched_debug.cfs_rq[=
97]:/.tg_load_avg
     13713 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
97]:/.tg_load_contrib
     13603 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
97]:/.blocked_load_avg
  16807656 =C2=B1  7%     -79.3%    3476910 =C2=B1 23%  sched_debug.cfs_rq[=
97]:/.min_vruntime
       121 =C2=B1 29%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
97]:/.utilization_load_avg
     13394 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
98]:/.blocked_load_avg
       116 =C2=B1 37%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
98]:/.utilization_load_avg
   1293736 =C2=B1  2%     -99.8%       1985 =C2=B1  2%  sched_debug.cfs_rq[=
98]:/.tg_load_avg
     13487 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
98]:/.tg_load_contrib
  16790802 =C2=B1  7%     -79.5%    3450066 =C2=B1 22%  sched_debug.cfs_rq[=
98]:/.min_vruntime
  16781556 =C2=B1  7%     -79.5%    3432159 =C2=B1 23%  sched_debug.cfs_rq[=
99]:/.min_vruntime
     13144 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
99]:/.tg_load_contrib
       110 =C2=B1 29%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
99]:/.utilization_load_avg
     13085 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
99]:/.blocked_load_avg
   1295505 =C2=B1  2%     -99.8%       1980 =C2=B1  2%  sched_debug.cfs_rq[=
99]:/.tg_load_avg
  30828048 =C2=B1  4%     -67.7%    9946390 =C2=B1  5%  sched_debug.cfs_rq[=
9]:/.min_vruntime
     64554 =C2=B1  4%     +35.2%      87301 =C2=B1  2%  sched_debug.cfs_rq[=
9]:/.exec_clock
      7642 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg_load_contrib
         0 =C2=B1  0%      +Inf%         17 =C2=B1 47%  sched_debug.cfs_rq[=
9]:/.load
   1262693 =C2=B1  2%     -99.8%       2113 =C2=B1  5%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
         1 =C2=B1 24%    +657.1%         13 =C2=B1 13%  sched_debug.cfs_rq[=
9]:/.runnable_load_avg
      7534 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.blocked_load_avg
         2 =C2=B1 30%     -54.5%          1 =C2=B1 34%  sched_debug.cpu#0.c=
pu_load[4]
   1067783 =C2=B1  3%     +30.4%    1391905 =C2=B1  4%  sched_debug.cpu#0.s=
ched_count
   1030847 =C2=B1  3%     +29.9%    1338797 =C2=B1  4%  sched_debug.cpu#0.n=
r_switches
    500455 =C2=B1  3%     +23.9%     619920 =C2=B1  5%  sched_debug.cpu#0.s=
ched_goidle
    396349 =C2=B1  5%     +44.4%     572387 =C2=B1 11%  sched_debug.cpu#0.t=
twu_count
      8659 =C2=B1  7%     +50.4%      13023 =C2=B1 18%  sched_debug.cpu#0.t=
twu_local
    195437 =C2=B1  1%     +11.3%     217539 =C2=B1  2%  sched_debug.cpu#0.n=
r_load_updates
   1102888 =C2=B1  2%     +22.0%    1345056 =C2=B1  5%  sched_debug.cpu#1.s=
ched_count
    421072 =C2=B1  4%     +33.0%     560086 =C2=B1 11%  sched_debug.cpu#1.t=
twu_count
   1080649 =C2=B1  3%     +21.2%    1309912 =C2=B1  5%  sched_debug.cpu#1.n=
r_switches
    529946 =C2=B1  3%     +14.4%     606226 =C2=B1  5%  sched_debug.cpu#1.s=
ched_goidle
      5373 =C2=B1  9%     +96.4%      10552 =C2=B1 23%  sched_debug.cpu#1.t=
twu_local
    403029 =C2=B1  5%     +39.0%     560131 =C2=B1  9%  sched_debug.cpu#10.=
ttwu_count
   1056794 =C2=B1  3%     +24.0%    1310867 =C2=B1  4%  sched_debug.cpu#10.=
nr_switches
      4532 =C2=B1 13%    +117.0%       9835 =C2=B1 27%  sched_debug.cpu#10.=
ttwu_local
   1077929 =C2=B1  3%     +24.9%    1346113 =C2=B1  4%  sched_debug.cpu#10.=
sched_count
    517885 =C2=B1  3%     +17.1%     606556 =C2=B1  4%  sched_debug.cpu#10.=
sched_goidle
    365298 =C2=B1  5%    +131.0%     843923 =C2=B1  5%  sched_debug.cpu#100=
.avg_idle
    456436 =C2=B1  4%     -34.6%     298496 =C2=B1 20%  sched_debug.cpu#100=
.sched_count
    159012 =C2=B1  1%     -43.7%      89468 =C2=B1 12%  sched_debug.cpu#100=
.nr_load_updates
     10489 =C2=B1 14%    +365.2%      48797 =C2=B1 39%  sched_debug.cpu#100=
.nr_uninterruptible
      1906 =C2=B1 10%    +223.8%       6173 =C2=B1 25%  sched_debug.cpu#100=
.ttwu_local
    218937 =C2=B1  4%     -60.1%      87357 =C2=B1 16%  sched_debug.cpu#100=
.sched_goidle
    449700 =C2=B1  4%     -35.0%     292116 =C2=B1 20%  sched_debug.cpu#100=
.nr_switches
     14022 =C2=B1 13%     -41.9%       8153 =C2=B1 49%  sched_debug.cpu#101=
.curr->pid
      1900 =C2=B1 11%    +226.6%       6206 =C2=B1 24%  sched_debug.cpu#101=
.ttwu_local
    362789 =C2=B1  8%    +136.1%     856706 =C2=B1  3%  sched_debug.cpu#101=
.avg_idle
    453763 =C2=B1  4%     -35.8%     291315 =C2=B1 20%  sched_debug.cpu#101=
.nr_switches
    159260 =C2=B1  1%     -44.0%      89177 =C2=B1 12%  sched_debug.cpu#101=
.nr_load_updates
         8 =C2=B1 40%     -84.4%          1 =C2=B1 34%  sched_debug.cpu#101=
.cpu_load[3]
    220953 =C2=B1  4%     -60.4%      87391 =C2=B1 17%  sched_debug.cpu#101=
.sched_goidle
        18 =C2=B1 38%     -86.7%          2 =C2=B1 20%  sched_debug.cpu#101=
.cpu_load[1]
        11 =C2=B1 37%     -84.8%          1 =C2=B1 24%  sched_debug.cpu#101=
.cpu_load[2]
     10581 =C2=B1 15%    +354.5%      48092 =C2=B1 37%  sched_debug.cpu#101=
.nr_uninterruptible
        33 =C2=B1 32%     -90.3%          3 =C2=B1 13%  sched_debug.cpu#101=
.cpu_load[0]
    460554 =C2=B1  4%     -35.5%     297013 =C2=B1 20%  sched_debug.cpu#101=
.sched_count
    381257 =C2=B1 10%    +126.7%     864487 =C2=B1  2%  sched_debug.cpu#102=
.avg_idle
    457120 =C2=B1  5%     -36.7%     289202 =C2=B1 20%  sched_debug.cpu#102=
.nr_switches
    464020 =C2=B1  5%     -36.4%     294946 =C2=B1 20%  sched_debug.cpu#102=
.sched_count
    159614 =C2=B1  1%     -44.4%      88729 =C2=B1 12%  sched_debug.cpu#102=
.nr_load_updates
    222593 =C2=B1  4%     -61.2%      86471 =C2=B1 16%  sched_debug.cpu#102=
.sched_goidle
         7 =C2=B1 24%     -83.9%          1 =C2=B1 34%  sched_debug.cpu#102=
.cpu_load[3]
      1896 =C2=B1 12%    +226.1%       6185 =C2=B1 26%  sched_debug.cpu#102=
.ttwu_local
         8 =C2=B1 39%     -76.5%          2 =C2=B1  0%  sched_debug.cpu#102=
.cpu_load[2]
     10714 =C2=B1 14%    +348.7%      48080 =C2=B1 38%  sched_debug.cpu#102=
.nr_uninterruptible
    160961 =C2=B1  1%     -44.7%      88963 =C2=B1 12%  sched_debug.cpu#103=
.nr_load_updates
        18 =C2=B1 22%     -86.7%          2 =C2=B1 34%  sched_debug.cpu#103=
.cpu_load[1]
        29 =C2=B1 30%     -88.8%          3 =C2=B1 33%  sched_debug.cpu#103=
.cpu_load[0]
    350413 =C2=B1  4%    +147.0%     865509 =C2=B1  3%  sched_debug.cpu#103=
.avg_idle
    474428 =C2=B1  4%     -37.3%     297374 =C2=B1 20%  sched_debug.cpu#103=
.sched_count
     11193 =C2=B1 15%    +337.1%      48929 =C2=B1 37%  sched_debug.cpu#103=
.nr_uninterruptible
      1963 =C2=B1 10%    +216.7%       6217 =C2=B1 25%  sched_debug.cpu#103=
.ttwu_local
    467221 =C2=B1  4%     -37.7%     290912 =C2=B1 20%  sched_debug.cpu#103=
.nr_switches
         9 =C2=B1 38%     -86.5%          1 =C2=B1 34%  sched_debug.cpu#103=
.cpu_load[3]
    227615 =C2=B1  4%     -61.9%      86663 =C2=B1 16%  sched_debug.cpu#103=
.sched_goidle
        13 =C2=B1 29%     -84.9%          2 =C2=B1 35%  sched_debug.cpu#103=
.cpu_load[2]
    231531 =C2=B1  4%     -62.6%      86600 =C2=B1 16%  sched_debug.cpu#104=
.sched_goidle
    357971 =C2=B1 12%    +136.2%     845542 =C2=B1  5%  sched_debug.cpu#104=
.avg_idle
      1974 =C2=B1 13%    +210.5%       6130 =C2=B1 25%  sched_debug.cpu#104=
.ttwu_local
    475014 =C2=B1  4%     -38.6%     291706 =C2=B1 20%  sched_debug.cpu#104=
.nr_switches
    161873 =C2=B1  1%     -45.0%      89005 =C2=B1 12%  sched_debug.cpu#104=
.nr_load_updates
     11493 =C2=B1 14%    +328.7%      49274 =C2=B1 37%  sched_debug.cpu#104=
.nr_uninterruptible
    482004 =C2=B1  4%     -38.3%     297512 =C2=B1 20%  sched_debug.cpu#104=
.sched_count
    376857 =C2=B1  1%    +135.5%     887605 =C2=B1  3%  sched_debug.cpu#105=
.avg_idle
    479657 =C2=B1  5%     -52.5%     228014 =C2=B1 27%  sched_debug.cpu#105=
.nr_switches
    233823 =C2=B1  5%     -68.9%      72804 =C2=B1 22%  sched_debug.cpu#105=
.sched_goidle
    486675 =C2=B1  5%     -52.2%     232670 =C2=B1 27%  sched_debug.cpu#105=
.sched_count
     11520 =C2=B1 21%    +181.5%      32428 =C2=B1 45%  sched_debug.cpu#105=
.nr_uninterruptible
         7 =C2=B1 45%     -82.8%          1 =C2=B1 34%  sched_debug.cpu#105=
.cpu_load[3]
    252967 =C2=B1  3%     -43.0%     144291 =C2=B1 34%  sched_debug.cpu#105=
.ttwu_count
    164221 =C2=B1  0%     -54.7%      74406 =C2=B1 18%  sched_debug.cpu#105=
.nr_load_updates
     16589 =C2=B1 42%     -55.4%       7396 =C2=B1 35%  sched_debug.cpu#106=
.curr->pid
    468655 =C2=B1  6%     -51.1%     229029 =C2=B1 26%  sched_debug.cpu#106=
.nr_switches
    162419 =C2=B1  0%     -53.8%      75000 =C2=B1 16%  sched_debug.cpu#106=
.nr_load_updates
    475888 =C2=B1  6%     -50.8%     233905 =C2=B1 26%  sched_debug.cpu#106=
.sched_count
         7 =C2=B1 45%     -79.3%          1 =C2=B1 33%  sched_debug.cpu#106=
.cpu_load[2]
    246487 =C2=B1  3%     -43.0%     140405 =C2=B1 36%  sched_debug.cpu#106=
.ttwu_count
     11120 =C2=B1 19%    +192.1%      32481 =C2=B1 43%  sched_debug.cpu#106=
.nr_uninterruptible
    228269 =C2=B1  6%     -67.9%      73274 =C2=B1 21%  sched_debug.cpu#106=
.sched_goidle
    406908 =C2=B1  7%    +112.6%     865001 =C2=B1  7%  sched_debug.cpu#106=
.avg_idle
     14380 =C2=B1 31%     -54.4%       6560 =C2=B1 46%  sched_debug.cpu#107=
.curr->pid
    370251 =C2=B1  8%    +130.8%     854462 =C2=B1  5%  sched_debug.cpu#107=
.avg_idle
    161470 =C2=B1  1%     -53.2%      75636 =C2=B1 16%  sched_debug.cpu#107=
.nr_load_updates
    460610 =C2=B1  5%     -49.8%     231031 =C2=B1 26%  sched_debug.cpu#107=
.nr_switches
        18 =C2=B1 47%     -86.7%          2 =C2=B1 20%  sched_debug.cpu#107=
.cpu_load[1]
     10829 =C2=B1 18%    +202.1%      32719 =C2=B1 44%  sched_debug.cpu#107=
.nr_uninterruptible
    224331 =C2=B1  5%     -67.0%      74073 =C2=B1 21%  sched_debug.cpu#107=
.sched_goidle
         8 =C2=B1 29%     -88.6%          1 =C2=B1  0%  sched_debug.cpu#107=
.cpu_load[4]
        14 =C2=B1 34%     -87.7%          1 =C2=B1 24%  sched_debug.cpu#107=
.cpu_load[2]
    242403 =C2=B1  3%     -41.5%     141720 =C2=B1 36%  sched_debug.cpu#107=
.ttwu_count
        11 =C2=B1 32%     -91.1%          1 =C2=B1  0%  sched_debug.cpu#107=
.cpu_load[3]
    468411 =C2=B1  6%     -49.7%     235417 =C2=B1 26%  sched_debug.cpu#107=
.sched_count
         8 =C2=B1 21%     -84.8%          1 =C2=B1 34%  sched_debug.cpu#108=
.cpu_load[3]
    380484 =C2=B1  3%    +126.1%     860361 =C2=B1  4%  sched_debug.cpu#108=
.avg_idle
      1938 =C2=B1 11%    +144.4%       4736 =C2=B1 34%  sched_debug.cpu#108=
.ttwu_local
    220306 =C2=B1  5%     -66.9%      72929 =C2=B1 21%  sched_debug.cpu#108=
.sched_goidle
         9 =C2=B1 31%     -81.6%          1 =C2=B1 24%  sched_debug.cpu#108=
.cpu_load[2]
    237165 =C2=B1  3%     -39.2%     144275 =C2=B1 33%  sched_debug.cpu#108=
.ttwu_count
     10533 =C2=B1 18%    +213.2%      32988 =C2=B1 44%  sched_debug.cpu#108=
.nr_uninterruptible
    459326 =C2=B1  5%     -49.1%     233641 =C2=B1 27%  sched_debug.cpu#108=
.sched_count
    160159 =C2=B1  1%     -53.4%      74576 =C2=B1 17%  sched_debug.cpu#108=
.nr_load_updates
    452591 =C2=B1  5%     -49.4%     229189 =C2=B1 26%  sched_debug.cpu#108=
.nr_switches
    159796 =C2=B1  0%     -53.5%      74381 =C2=B1 17%  sched_debug.cpu#109=
.nr_load_updates
    235027 =C2=B1  3%     -40.9%     138966 =C2=B1 37%  sched_debug.cpu#109=
.ttwu_count
         9 =C2=B1 13%     -83.3%          1 =C2=B1 33%  sched_debug.cpu#109=
.cpu_load[2]
        11 =C2=B1 17%     -82.2%          2 =C2=B1 35%  sched_debug.cpu#109=
.cpu_load[1]
    377549 =C2=B1  9%    +127.3%     858083 =C2=B1  5%  sched_debug.cpu#109=
.avg_idle
    219624 =C2=B1  4%     -66.8%      72964 =C2=B1 22%  sched_debug.cpu#109=
.sched_goidle
     10595 =C2=B1 17%    +212.3%      33088 =C2=B1 43%  sched_debug.cpu#109=
.nr_uninterruptible
    458219 =C2=B1  5%     -49.0%     233915 =C2=B1 27%  sched_debug.cpu#109=
.sched_count
         7 =C2=B1 10%     -83.9%          1 =C2=B1 34%  sched_debug.cpu#109=
.cpu_load[3]
    451458 =C2=B1  5%     -49.3%     228945 =C2=B1 27%  sched_debug.cpu#109=
.nr_switches
   1074502 =C2=B1  3%     +25.3%    1346508 =C2=B1  4%  sched_debug.cpu#11.=
sched_count
   1053435 =C2=B1  3%     +24.5%    1311348 =C2=B1  4%  sched_debug.cpu#11.=
nr_switches
    516178 =C2=B1  3%     +17.5%     606755 =C2=B1  4%  sched_debug.cpu#11.=
sched_goidle
    399968 =C2=B1  5%     +39.7%     558833 =C2=B1  9%  sched_debug.cpu#11.=
ttwu_count
    314120 =C2=B1  5%      +9.2%     342906 =C2=B1  4%  sched_debug.cpu#11.=
avg_idle
      4418 =C2=B1 12%    +126.2%       9995 =C2=B1 29%  sched_debug.cpu#11.=
ttwu_local
    215980 =C2=B1  4%     -66.2%      72935 =C2=B1 21%  sched_debug.cpu#110=
.sched_goidle
    450583 =C2=B1  5%     -48.4%     232685 =C2=B1 26%  sched_debug.cpu#110=
.sched_count
     10218 =C2=B1 17%    +217.1%      32403 =C2=B1 45%  sched_debug.cpu#110=
.nr_uninterruptible
    236411 =C2=B1  4%     -40.1%     141614 =C2=B1 35%  sched_debug.cpu#110=
.ttwu_count
      1902 =C2=B1 11%    +141.6%       4596 =C2=B1 36%  sched_debug.cpu#110=
.ttwu_local
    361093 =C2=B1  2%    +142.4%     875352 =C2=B1  6%  sched_debug.cpu#110=
.avg_idle
    443846 =C2=B1  5%     -48.6%     228167 =C2=B1 26%  sched_debug.cpu#110=
.nr_switches
    158751 =C2=B1  1%     -52.9%      74729 =C2=B1 16%  sched_debug.cpu#110=
.nr_load_updates
     10236 =C2=B1 17%    +224.9%      33257 =C2=B1 42%  sched_debug.cpu#111=
.nr_uninterruptible
    441970 =C2=B1  5%     -48.2%     228980 =C2=B1 26%  sched_debug.cpu#111=
.nr_switches
    448690 =C2=B1  5%     -48.0%     233442 =C2=B1 26%  sched_debug.cpu#111=
.sched_count
         7 =C2=B1 38%     -87.1%          1 =C2=B1  0%  sched_debug.cpu#111=
.cpu_load[3]
    234647 =C2=B1  3%     -39.7%     141577 =C2=B1 35%  sched_debug.cpu#111=
.ttwu_count
    158578 =C2=B1  0%     -52.9%      74649 =C2=B1 17%  sched_debug.cpu#111=
.nr_load_updates
    362093 =C2=B1  8%    +139.5%     867085 =C2=B1  7%  sched_debug.cpu#111=
.avg_idle
    214924 =C2=B1  5%     -66.1%      72865 =C2=B1 22%  sched_debug.cpu#111=
.sched_goidle
    158157 =C2=B1  0%     -52.9%      74489 =C2=B1 17%  sched_debug.cpu#112=
.nr_load_updates
    440397 =C2=B1  5%     -48.0%     228865 =C2=B1 25%  sched_debug.cpu#112=
.nr_switches
    365887 =C2=B1  7%    +133.1%     852963 =C2=B1  5%  sched_debug.cpu#112=
.avg_idle
    447069 =C2=B1  5%     -47.7%     233692 =C2=B1 26%  sched_debug.cpu#112=
.sched_count
      1900 =C2=B1 10%    +141.1%       4582 =C2=B1 37%  sched_debug.cpu#112=
.ttwu_local
        12 =C2=B1 31%     -85.7%          1 =C2=B1 47%  sched_debug.cpu#112=
.cpu_load[2]
    214176 =C2=B1  5%     -66.1%      72600 =C2=B1 21%  sched_debug.cpu#112=
.sched_goidle
     10159 =C2=B1 18%    +228.7%      33392 =C2=B1 41%  sched_debug.cpu#112=
.nr_uninterruptible
    232979 =C2=B1  3%     -39.8%     140142 =C2=B1 35%  sched_debug.cpu#112=
.ttwu_count
    232848 =C2=B1  3%     -39.6%     140551 =C2=B1 36%  sched_debug.cpu#113=
.ttwu_count
         5 =C2=B1 40%     -80.0%          1 =C2=B1  0%  sched_debug.cpu#113=
.cpu_load[3]
    447370 =C2=B1  5%     -47.4%     235538 =C2=B1 26%  sched_debug.cpu#113=
.sched_count
     10181 =C2=B1 19%    +226.5%      33244 =C2=B1 43%  sched_debug.cpu#113=
.nr_uninterruptible
      1878 =C2=B1 11%    +155.2%       4793 =C2=B1 35%  sched_debug.cpu#113=
.ttwu_local
    214289 =C2=B1  5%     -65.7%      73398 =C2=B1 21%  sched_debug.cpu#113=
.sched_goidle
    376183 =C2=B1  8%    +130.9%     868488 =C2=B1  4%  sched_debug.cpu#113=
.avg_idle
    158046 =C2=B1  0%     -52.6%      74970 =C2=B1 16%  sched_debug.cpu#113=
.nr_load_updates
    440528 =C2=B1  5%     -47.8%     230099 =C2=B1 26%  sched_debug.cpu#113=
.nr_switches
    157984 =C2=B1  0%     -52.8%      74585 =C2=B1 17%  sched_debug.cpu#114=
.nr_load_updates
    389341 =C2=B1 11%    +126.6%     882130 =C2=B1  4%  sched_debug.cpu#114=
.avg_idle
    446361 =C2=B1  5%     -47.6%     234059 =C2=B1 27%  sched_debug.cpu#114=
.sched_count
     10131 =C2=B1 18%    +230.7%      33508 =C2=B1 44%  sched_debug.cpu#114=
.nr_uninterruptible
      1868 =C2=B1 11%    +145.1%       4578 =C2=B1 37%  sched_debug.cpu#114=
.ttwu_local
    231072 =C2=B1  3%     -39.7%     139256 =C2=B1 36%  sched_debug.cpu#114=
.ttwu_count
    439650 =C2=B1  5%     -47.7%     229733 =C2=B1 26%  sched_debug.cpu#114=
.nr_switches
    213858 =C2=B1  4%     -65.8%      73221 =C2=B1 21%  sched_debug.cpu#114=
.sched_goidle
     10257 =C2=B1 19%    +223.6%      33189 =C2=B1 45%  sched_debug.cpu#115=
.nr_uninterruptible
    215333 =C2=B1  5%     -66.1%      73048 =C2=B1 21%  sched_debug.cpu#115=
.sched_goidle
    158530 =C2=B1  0%     -52.7%      74953 =C2=B1 16%  sched_debug.cpu#115=
.nr_load_updates
    373651 =C2=B1  3%    +139.0%     892874 =C2=B1  6%  sched_debug.cpu#115=
.avg_idle
      1870 =C2=B1 11%    +148.4%       4645 =C2=B1 37%  sched_debug.cpu#115=
.ttwu_local
    449557 =C2=B1  5%     -47.8%     234775 =C2=B1 26%  sched_debug.cpu#115=
.sched_count
    235907 =C2=B1  3%     -39.4%     142887 =C2=B1 36%  sched_debug.cpu#115=
.ttwu_count
        11 =C2=B1 48%     -89.1%          1 =C2=B1 34%  sched_debug.cpu#115=
.cpu_load[3]
    442695 =C2=B1  5%     -48.0%     230068 =C2=B1 26%  sched_debug.cpu#115=
.nr_switches
    377458 =C2=B1  5%    +130.2%     869008 =C2=B1  6%  sched_debug.cpu#116=
.avg_idle
    158733 =C2=B1  0%     -52.8%      74844 =C2=B1 16%  sched_debug.cpu#116=
.nr_load_updates
    217431 =C2=B1  5%     -66.5%      72782 =C2=B1 21%  sched_debug.cpu#116=
.sched_goidle
    236350 =C2=B1  3%     -39.2%     143794 =C2=B1 34%  sched_debug.cpu#116=
.ttwu_count
        11 =C2=B1 46%     -88.6%          1 =C2=B1 34%  sched_debug.cpu#116=
.cpu_load[3]
    446682 =C2=B1  5%     -48.6%     229763 =C2=B1 26%  sched_debug.cpu#116=
.nr_switches
    453332 =C2=B1  5%     -48.2%     234604 =C2=B1 26%  sched_debug.cpu#116=
.sched_count
        23 =C2=B1 49%     -88.2%          2 =C2=B1 30%  sched_debug.cpu#116=
.cpu_load[1]
        33 =C2=B1 30%     -91.0%          3 =C2=B1 33%  sched_debug.cpu#116=
.cpu_load[0]
     15318 =C2=B1  5%     -37.5%       9566 =C2=B1 37%  sched_debug.cpu#116=
.curr->pid
     10313 =C2=B1 18%    +223.4%      33352 =C2=B1 43%  sched_debug.cpu#116=
.nr_uninterruptible
    219393 =C2=B1  5%     -66.9%      72645 =C2=B1 21%  sched_debug.cpu#117=
.sched_goidle
     10507 =C2=B1 19%    +217.5%      33362 =C2=B1 44%  sched_debug.cpu#117=
.nr_uninterruptible
    354700 =C2=B1  8%    +147.6%     878317 =C2=B1  3%  sched_debug.cpu#117=
.avg_idle
         9 =C2=B1 46%     -82.1%          1 =C2=B1 47%  sched_debug.cpu#117=
.cpu_load[2]
    159100 =C2=B1  0%     -53.1%      74634 =C2=B1 17%  sched_debug.cpu#117=
.nr_load_updates
    240074 =C2=B1  3%     -40.1%     143847 =C2=B1 35%  sched_debug.cpu#117=
.ttwu_count
      1926 =C2=B1 10%    +144.1%       4702 =C2=B1 35%  sched_debug.cpu#117=
.ttwu_local
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cpu#117=
.nr_running
    450850 =C2=B1  5%     -49.1%     229588 =C2=B1 26%  sched_debug.cpu#117=
.nr_switches
    458037 =C2=B1  5%     -48.9%     234019 =C2=B1 26%  sched_debug.cpu#117=
.sched_count
    363475 =C2=B1  2%    +135.4%     855586 =C2=B1  6%  sched_debug.cpu#118=
.avg_idle
    241373 =C2=B1  3%     -40.3%     144168 =C2=B1 35%  sched_debug.cpu#118=
.ttwu_count
    465668 =C2=B1  5%     -49.7%     234055 =C2=B1 26%  sched_debug.cpu#118=
.sched_count
    458922 =C2=B1  5%     -50.1%     229212 =C2=B1 25%  sched_debug.cpu#118=
.nr_switches
     10907 =C2=B1 19%    +203.9%      33151 =C2=B1 43%  sched_debug.cpu#118=
.nr_uninterruptible
    160228 =C2=B1  0%     -53.5%      74553 =C2=B1 16%  sched_debug.cpu#118=
.nr_load_updates
    223357 =C2=B1  5%     -67.5%      72534 =C2=B1 20%  sched_debug.cpu#118=
.sched_goidle
     11282 =C2=B1 20%    +191.8%      32926 =C2=B1 43%  sched_debug.cpu#119=
.nr_uninterruptible
    365829 =C2=B1  5%    +139.7%     877017 =C2=B1  5%  sched_debug.cpu#119=
.avg_idle
    228345 =C2=B1  5%     -68.3%      72484 =C2=B1 21%  sched_debug.cpu#119=
.sched_goidle
      1952 =C2=B1  8%    +142.6%       4736 =C2=B1 36%  sched_debug.cpu#119=
.ttwu_local
    161450 =C2=B1  0%     -54.0%      74215 =C2=B1 16%  sched_debug.cpu#119=
.nr_load_updates
    476317 =C2=B1  5%     -50.9%     233762 =C2=B1 26%  sched_debug.cpu#119=
.sched_count
    468835 =C2=B1  5%     -51.1%     229406 =C2=B1 26%  sched_debug.cpu#119=
.nr_switches
    245834 =C2=B1  2%     -42.4%     141647 =C2=B1 36%  sched_debug.cpu#119=
.ttwu_count
   1069632 =C2=B1  3%     +25.9%    1346347 =C2=B1  4%  sched_debug.cpu#12.=
sched_count
      4492 =C2=B1 10%    +126.0%      10153 =C2=B1 25%  sched_debug.cpu#12.=
ttwu_local
         0 =C2=B1  0%      +Inf%          2 =C2=B1 34%  sched_debug.cpu#12.=
load
    512665 =C2=B1  3%     +18.4%     606896 =C2=B1  4%  sched_debug.cpu#12.=
sched_goidle
   1046593 =C2=B1  3%     +25.4%    1312232 =C2=B1  4%  sched_debug.cpu#12.=
nr_switches
    398917 =C2=B1  5%     +40.0%     558290 =C2=B1  9%  sched_debug.cpu#12.=
ttwu_count
    397758 =C2=B1  5%     +41.8%     563965 =C2=B1 10%  sched_debug.cpu#13.=
ttwu_count
      4605 =C2=B1 10%    +118.3%      10054 =C2=B1 29%  sched_debug.cpu#13.=
ttwu_local
   1066964 =C2=B1  3%     +26.5%    1349215 =C2=B1  4%  sched_debug.cpu#13.=
sched_count
    512519 =C2=B1  3%     +18.8%     608637 =C2=B1  4%  sched_debug.cpu#13.=
sched_goidle
   1046422 =C2=B1  3%     +25.7%    1315144 =C2=B1  4%  sched_debug.cpu#13.=
nr_switches
   1063482 =C2=B1  3%     +27.2%    1352562 =C2=B1  4%  sched_debug.cpu#14.=
sched_count
   1042319 =C2=B1  4%     +26.4%    1317288 =C2=B1  4%  sched_debug.cpu#14.=
nr_switches
         2 =C2=B1 30%     -54.5%          1 =C2=B1 34%  sched_debug.cpu#14.=
cpu_load[4]
    395972 =C2=B1  5%     +43.1%     566604 =C2=B1 10%  sched_debug.cpu#14.=
ttwu_count
      4417 =C2=B1 12%    +130.6%      10185 =C2=B1 33%  sched_debug.cpu#14.=
ttwu_local
    510493 =C2=B1  4%     +19.4%     609573 =C2=B1  4%  sched_debug.cpu#14.=
sched_goidle
    316104 =C2=B1 11%    +102.9%     641422 =C2=B1 30%  sched_debug.cpu#15.=
avg_idle
      5655 =C2=B1 26%     +47.6%       8349 =C2=B1  4%  sched_debug.cpu#16.=
ttwu_local
    304298 =C2=B1  6%    +109.3%     636995 =C2=B1 30%  sched_debug.cpu#16.=
avg_idle
      5317 =C2=B1 12%     +46.5%       7791 =C2=B1  6%  sched_debug.cpu#17.=
ttwu_local
    303838 =C2=B1  6%    +108.3%     632990 =C2=B1 32%  sched_debug.cpu#17.=
avg_idle
      5213 =C2=B1 17%     +52.5%       7947 =C2=B1  8%  sched_debug.cpu#18.=
ttwu_local
    297224 =C2=B1  7%    +114.0%     636143 =C2=B1 31%  sched_debug.cpu#18.=
avg_idle
      5325 =C2=B1 12%     +59.1%       8475 =C2=B1  5%  sched_debug.cpu#19.=
ttwu_local
    322255 =C2=B1 10%     +95.1%     628732 =C2=B1 33%  sched_debug.cpu#19.=
avg_idle
   1111501 =C2=B1  2%     +17.9%    1310937 =C2=B1  5%  sched_debug.cpu#2.n=
r_switches
      4788 =C2=B1 13%    +105.3%       9830 =C2=B1 25%  sched_debug.cpu#2.t=
twu_local
   1131111 =C2=B1  2%     +19.0%    1345850 =C2=B1  5%  sched_debug.cpu#2.s=
ched_count
    545588 =C2=B1  2%     +11.2%     606775 =C2=B1  5%  sched_debug.cpu#2.s=
ched_goidle
    423779 =C2=B1  4%     +31.3%     556589 =C2=B1 10%  sched_debug.cpu#2.t=
twu_count
    291025 =C2=B1  6%    +114.3%     623791 =C2=B1 31%  sched_debug.cpu#20.=
avg_idle
      4983 =C2=B1  5%     +69.8%       8460 =C2=B1  7%  sched_debug.cpu#20.=
ttwu_local
      4751 =C2=B1  6%     +84.1%       8748 =C2=B1  4%  sched_debug.cpu#21.=
ttwu_local
    318379 =C2=B1  2%     +99.5%     635089 =C2=B1 33%  sched_debug.cpu#21.=
avg_idle
      4822 =C2=B1  7%     +67.5%       8078 =C2=B1  8%  sched_debug.cpu#22.=
ttwu_local
    328942 =C2=B1  8%     +89.1%     622099 =C2=B1 33%  sched_debug.cpu#23.=
avg_idle
      4753 =C2=B1  8%     +70.6%       8108 =C2=B1 11%  sched_debug.cpu#23.=
ttwu_local
      5070 =C2=B1  4%     +62.7%       8251 =C2=B1  9%  sched_debug.cpu#24.=
ttwu_local
    311654 =C2=B1  5%    +101.4%     627764 =C2=B1 34%  sched_debug.cpu#24.=
avg_idle
        11 =C2=B1 36%     -75.0%          2 =C2=B1 30%  sched_debug.cpu#25.=
cpu_load[2]
         8 =C2=B1 29%     -65.6%          2 =C2=B1 30%  sched_debug.cpu#25.=
cpu_load[3]
      4735 =C2=B1  8%     +66.4%       7878 =C2=B1  8%  sched_debug.cpu#25.=
ttwu_local
    334745 =C2=B1  4%     +89.2%     633318 =C2=B1 32%  sched_debug.cpu#25.=
avg_idle
    312300 =C2=B1  9%    +108.0%     649565 =C2=B1 31%  sched_debug.cpu#26.=
avg_idle
         3 =C2=B1 24%     -64.3%          1 =C2=B1 34%  sched_debug.cpu#26.=
cpu_load[4]
      5139 =C2=B1 11%     +51.4%       7782 =C2=B1  8%  sched_debug.cpu#26.=
ttwu_local
         1 =C2=B1 47%    +100.0%          3 =C2=B1 14%  sched_debug.cpu#27.=
cpu_load[1]
      4972 =C2=B1  9%     +57.5%       7828 =C2=B1 12%  sched_debug.cpu#27.=
ttwu_local
    339666 =C2=B1 13%     +87.2%     635981 =C2=B1 31%  sched_debug.cpu#27.=
avg_idle
         1 =C2=B1 34%    +140.0%          3 =C2=B1 23%  sched_debug.cpu#27.=
cpu_load[0]
      5120 =C2=B1 12%     +59.9%       8189 =C2=B1  9%  sched_debug.cpu#28.=
ttwu_local
    326310 =C2=B1  5%     +96.9%     642647 =C2=B1 31%  sched_debug.cpu#28.=
avg_idle
      5624 =C2=B1 18%     +50.7%       8479 =C2=B1  6%  sched_debug.cpu#29.=
ttwu_local
    317361 =C2=B1  7%     +95.0%     618915 =C2=B1 35%  sched_debug.cpu#29.=
avg_idle
         1 =C2=B1  0%    +375.0%          4 =C2=B1  9%  sched_debug.cpu#3.c=
pu_load[0]
    543732 =C2=B1  2%     +11.7%     607295 =C2=B1  5%  sched_debug.cpu#3.s=
ched_goidle
   1133509 =C2=B1  2%     +18.8%    1347015 =C2=B1  4%  sched_debug.cpu#3.s=
ched_count
    419045 =C2=B1  5%     +32.6%     555748 =C2=B1 10%  sched_debug.cpu#3.t=
twu_count
   1108080 =C2=B1  2%     +18.4%    1312225 =C2=B1  4%  sched_debug.cpu#3.n=
r_switches
      4586 =C2=B1 10%    +113.2%       9777 =C2=B1 25%  sched_debug.cpu#3.t=
twu_local
      4814 =C2=B1 13%    +115.8%      10391 =C2=B1 20%  sched_debug.cpu#30.=
ttwu_local
      4956 =C2=B1 12%    +116.4%      10725 =C2=B1 17%  sched_debug.cpu#31.=
ttwu_local
      4822 =C2=B1 13%    +100.7%       9676 =C2=B1 14%  sched_debug.cpu#32.=
ttwu_local
         1 =C2=B1  0%    +300.0%          4 =C2=B1 30%  sched_debug.cpu#32.=
cpu_load[0]
         3 =C2=B1 14%     -64.3%          1 =C2=B1 34%  sched_debug.cpu#33.=
cpu_load[4]
      5034 =C2=B1 17%     +93.5%       9741 =C2=B1 14%  sched_debug.cpu#33.=
ttwu_local
         1 =C2=B1 33%    +133.3%          3 =C2=B1 14%  sched_debug.cpu#34.=
cpu_load[2]
      4908 =C2=B1 15%     +96.4%       9637 =C2=B1 12%  sched_debug.cpu#34.=
ttwu_local
      5062 =C2=B1 14%     +89.2%       9576 =C2=B1 16%  sched_debug.cpu#35.=
ttwu_local
      4738 =C2=B1 15%    +108.7%       9892 =C2=B1 15%  sched_debug.cpu#36.=
ttwu_local
    315129 =C2=B1  9%     +55.5%     490026 =C2=B1 17%  sched_debug.cpu#37.=
avg_idle
      4831 =C2=B1 15%    +107.7%      10032 =C2=B1 12%  sched_debug.cpu#37.=
ttwu_local
    331506 =C2=B1  7%     +40.9%     467107 =C2=B1 16%  sched_debug.cpu#38.=
avg_idle
      4738 =C2=B1 13%    +125.1%      10668 =C2=B1  9%  sched_debug.cpu#38.=
ttwu_local
         4 =C2=B1 25%     -58.8%          1 =C2=B1 24%  sched_debug.cpu#39.=
cpu_load[4]
      4788 =C2=B1 14%    +108.3%       9975 =C2=B1 22%  sched_debug.cpu#39.=
ttwu_local
    541207 =C2=B1  2%     +13.1%     611853 =C2=B1  5%  sched_debug.cpu#4.s=
ched_goidle
   1103021 =C2=B1  2%     +19.8%    1321365 =C2=B1  5%  sched_debug.cpu#4.n=
r_switches
      4589 =C2=B1 10%    +111.5%       9707 =C2=B1 22%  sched_debug.cpu#4.t=
twu_local
   1122810 =C2=B1  2%     +20.8%    1355960 =C2=B1  5%  sched_debug.cpu#4.s=
ched_count
    414454 =C2=B1  5%     +32.3%     548289 =C2=B1 10%  sched_debug.cpu#4.t=
twu_count
      4792 =C2=B1 16%    +106.2%       9883 =C2=B1 19%  sched_debug.cpu#40.=
ttwu_local
      4816 =C2=B1 15%    +110.7%      10147 =C2=B1 12%  sched_debug.cpu#41.=
ttwu_local
      4735 =C2=B1 15%    +119.3%      10384 =C2=B1 23%  sched_debug.cpu#42.=
ttwu_local
      4982 =C2=B1 37%     +74.9%       8713 =C2=B1 14%  sched_debug.cpu#42.=
curr->pid
         1 =C2=B1 34%    +140.0%          3 =C2=B1 33%  sched_debug.cpu#43.=
cpu_load[0]
      4756 =C2=B1 14%    +101.0%       9560 =C2=B1 17%  sched_debug.cpu#43.=
ttwu_local
         1 =C2=B1 34%    +160.0%          3 =C2=B1 13%  sched_debug.cpu#43.=
cpu_load[1]
    322258 =C2=B1 11%     +43.5%     462420 =C2=B1 16%  sched_debug.cpu#43.=
avg_idle
    325887 =C2=B1  4%     +43.4%     467240 =C2=B1 18%  sched_debug.cpu#44.=
avg_idle
      4814 =C2=B1 14%    +112.4%      10226 =C2=B1 11%  sched_debug.cpu#44.=
ttwu_local
      5017 =C2=B1  8%     +72.0%       8628 =C2=B1 13%  sched_debug.cpu#45.=
ttwu_local
    323613 =C2=B1  9%     +61.2%     521795 =C2=B1 24%  sched_debug.cpu#45.=
avg_idle
    212655 =C2=B1  0%     -29.2%     150525 =C2=B1 21%  sched_debug.cpu#45.=
nr_load_updates
      4919 =C2=B1  6%     +91.3%       9413 =C2=B1 12%  sched_debug.cpu#46.=
ttwu_local
    316524 =C2=B1  4%     +61.2%     510277 =C2=B1 29%  sched_debug.cpu#46.=
avg_idle
    213391 =C2=B1  0%     -29.7%     150024 =C2=B1 22%  sched_debug.cpu#46.=
nr_load_updates
         1 =C2=B1 34%    +260.0%          4 =C2=B1 45%  sched_debug.cpu#47.=
cpu_load[2]
    213365 =C2=B1  0%     -29.3%     150874 =C2=B1 21%  sched_debug.cpu#47.=
nr_load_updates
      4959 =C2=B1  5%    +110.2%      10424 =C2=B1 12%  sched_debug.cpu#47.=
ttwu_local
    297977 =C2=B1  5%     +70.9%     509246 =C2=B1 27%  sched_debug.cpu#47.=
avg_idle
      5010 =C2=B1  5%     +87.0%       9370 =C2=B1 10%  sched_debug.cpu#48.=
ttwu_local
    295224 =C2=B1 14%     +75.4%     517762 =C2=B1 20%  sched_debug.cpu#48.=
avg_idle
    212733 =C2=B1  0%     -29.1%     150866 =C2=B1 21%  sched_debug.cpu#48.=
nr_load_updates
         1 =C2=B1  0%    +400.0%          5 =C2=B1 34%  sched_debug.cpu#48.=
cpu_load[0]
    212347 =C2=B1  0%     -29.2%     150357 =C2=B1 21%  sched_debug.cpu#49.=
nr_load_updates
    307183 =C2=B1  7%     +65.7%     509139 =C2=B1 22%  sched_debug.cpu#49.=
avg_idle
      5076 =C2=B1  8%     +70.0%       8630 =C2=B1 13%  sched_debug.cpu#49.=
ttwu_local
      5672 =C2=B1 47%     -53.8%       2619 =C2=B1 33%  sched_debug.cpu#49.=
curr->pid
         1 =C2=B1  0%    +325.0%          4 =C2=B1 10%  sched_debug.cpu#5.c=
pu_load[1]
      4557 =C2=B1 11%    +112.8%       9695 =C2=B1 26%  sched_debug.cpu#5.t=
twu_local
      5632 =C2=B1 45%    +100.1%      11273 =C2=B1 22%  sched_debug.cpu#5.c=
urr->pid
         1 =C2=B1 24%    +128.6%          4 =C2=B1  0%  sched_debug.cpu#5.c=
pu_load[2]
    529333 =C2=B1  3%     +14.2%     604409 =C2=B1  5%  sched_debug.cpu#5.s=
ched_goidle
   1079377 =C2=B1  3%     +21.0%    1306000 =C2=B1  5%  sched_debug.cpu#5.n=
r_switches
    413773 =C2=B1  4%     +33.3%     551394 =C2=B1  9%  sched_debug.cpu#5.t=
twu_count
   1099369 =C2=B1  3%     +22.0%    1340945 =C2=B1  5%  sched_debug.cpu#5.s=
ched_count
    338950 =C2=B1 12%     +56.4%     530174 =C2=B1 22%  sched_debug.cpu#50.=
avg_idle
      4950 =C2=B1  5%     +71.8%       8507 =C2=B1 12%  sched_debug.cpu#50.=
ttwu_local
    211756 =C2=B1  0%     -29.1%     150035 =C2=B1 21%  sched_debug.cpu#50.=
nr_load_updates
    211395 =C2=B1  0%     -28.7%     150623 =C2=B1 21%  sched_debug.cpu#51.=
nr_load_updates
    333949 =C2=B1  8%     +54.1%     514474 =C2=B1 25%  sched_debug.cpu#51.=
avg_idle
      4856 =C2=B1  7%     +85.0%       8985 =C2=B1 12%  sched_debug.cpu#51.=
ttwu_local
    211096 =C2=B1  0%     -28.4%     151073 =C2=B1 21%  sched_debug.cpu#52.=
nr_load_updates
      4834 =C2=B1  7%    +110.5%      10175 =C2=B1  9%  sched_debug.cpu#52.=
ttwu_local
    325681 =C2=B1  1%     +60.7%     523453 =C2=B1 27%  sched_debug.cpu#52.=
avg_idle
         1 =C2=B1  0%    +425.0%          5 =C2=B1 43%  sched_debug.cpu#53.=
cpu_load[1]
    210826 =C2=B1  0%     -28.6%     150475 =C2=B1 21%  sched_debug.cpu#53.=
nr_load_updates
    322501 =C2=B1 11%     +60.3%     516953 =C2=B1 22%  sched_debug.cpu#53.=
avg_idle
      4764 =C2=B1  8%     +89.9%       9047 =C2=B1 14%  sched_debug.cpu#53.=
ttwu_local
    210701 =C2=B1  0%     -28.8%     150099 =C2=B1 21%  sched_debug.cpu#54.=
nr_load_updates
    338710 =C2=B1 11%     +55.1%     525412 =C2=B1 22%  sched_debug.cpu#54.=
avg_idle
         1 =C2=B1  0%    +300.0%          4 =C2=B1 50%  sched_debug.cpu#54.=
cpu_load[0]
      4884 =C2=B1  5%     +89.3%       9248 =C2=B1 12%  sched_debug.cpu#54.=
ttwu_local
    210894 =C2=B1  0%     -28.7%     150271 =C2=B1 21%  sched_debug.cpu#55.=
nr_load_updates
      5071 =C2=B1  5%     +84.2%       9341 =C2=B1  6%  sched_debug.cpu#55.=
ttwu_local
    325786 =C2=B1  2%     +60.5%     522749 =C2=B1 20%  sched_debug.cpu#55.=
avg_idle
      4926 =C2=B1  6%     +87.5%       9236 =C2=B1 17%  sched_debug.cpu#56.=
ttwu_local
    210935 =C2=B1  0%     -28.7%     150334 =C2=B1 21%  sched_debug.cpu#56.=
nr_load_updates
    322812 =C2=B1  7%     +64.7%     531744 =C2=B1 18%  sched_debug.cpu#56.=
avg_idle
         3 =C2=B1 39%     -61.5%          1 =C2=B1 34%  sched_debug.cpu#56.=
cpu_load[4]
      4935 =C2=B1  7%     +89.4%       9345 =C2=B1 12%  sched_debug.cpu#57.=
ttwu_local
    308906 =C2=B1  6%     +68.8%     521531 =C2=B1 18%  sched_debug.cpu#57.=
avg_idle
    210966 =C2=B1  0%     -28.8%     150297 =C2=B1 21%  sched_debug.cpu#57.=
nr_load_updates
      4881 =C2=B1  8%     +89.1%       9229 =C2=B1  9%  sched_debug.cpu#58.=
ttwu_local
    211377 =C2=B1  0%     -29.1%     149801 =C2=B1 21%  sched_debug.cpu#58.=
nr_load_updates
    313176 =C2=B1  7%     +62.7%     509465 =C2=B1 21%  sched_debug.cpu#58.=
avg_idle
    332981 =C2=B1  7%     +52.0%     506078 =C2=B1 23%  sched_debug.cpu#59.=
avg_idle
      4903 =C2=B1  6%     +88.8%       9259 =C2=B1 16%  sched_debug.cpu#59.=
ttwu_local
    211798 =C2=B1  0%     -29.2%     150043 =C2=B1 21%  sched_debug.cpu#59.=
nr_load_updates
    408039 =C2=B1  4%     +35.0%     550837 =C2=B1  9%  sched_debug.cpu#6.t=
twu_count
    522969 =C2=B1  3%     +16.1%     607170 =C2=B1  5%  sched_debug.cpu#6.s=
ched_goidle
      4818 =C2=B1 17%    +103.6%       9809 =C2=B1 25%  sched_debug.cpu#6.t=
twu_local
   1067408 =C2=B1  3%     +22.9%    1311321 =C2=B1  4%  sched_debug.cpu#6.n=
r_switches
   1098484 =C2=B1  3%     +22.6%    1346438 =C2=B1  4%  sched_debug.cpu#6.s=
ched_count
    159254 =C2=B1  1%     -37.4%      99737 =C2=B1  5%  sched_debug.cpu#60.=
nr_load_updates
    465823 =C2=B1  5%     -29.8%     327041 =C2=B1  5%  sched_debug.cpu#60.=
nr_switches
    472826 =C2=B1  5%     -29.4%     333802 =C2=B1  5%  sched_debug.cpu#60.=
sched_count
         4 =C2=B1 40%     -72.2%          1 =C2=B1 34%  sched_debug.cpu#60.=
cpu_load[4]
      2046 =C2=B1 12%    +254.3%       7252 =C2=B1 28%  sched_debug.cpu#60.=
ttwu_local
    226846 =C2=B1  5%     -57.3%      96883 =C2=B1  6%  sched_debug.cpu#60.=
sched_goidle
    375332 =C2=B1  4%    +112.6%     797875 =C2=B1  2%  sched_debug.cpu#60.=
avg_idle
     11749 =C2=B1 14%    +348.3%      52676 =C2=B1  2%  sched_debug.cpu#60.=
nr_uninterruptible
      2192 =C2=B1 13%    +228.1%       7192 =C2=B1 29%  sched_debug.cpu#61.=
ttwu_local
     13261 =C2=B1 13%    +323.8%      56208 =C2=B1  3%  sched_debug.cpu#61.=
nr_uninterruptible
    258980 =C2=B1  3%     -11.4%     229352 =C2=B1  7%  sched_debug.cpu#61.=
ttwu_count
         8 =C2=B1 24%     -68.6%          2 =C2=B1 30%  sched_debug.cpu#61.=
cpu_load[2]
    170014 =C2=B1  1%     -40.7%     100819 =C2=B1  5%  sched_debug.cpu#61.=
nr_load_updates
    526023 =C2=B1  4%     -35.3%     340593 =C2=B1  5%  sched_debug.cpu#61.=
sched_count
    253250 =C2=B1  4%     -61.4%      97676 =C2=B1  6%  sched_debug.cpu#61.=
sched_goidle
         8 =C2=B1 26%     -78.1%          1 =C2=B1 24%  sched_debug.cpu#61.=
cpu_load[3]
         6 =C2=B1 28%     -81.5%          1 =C2=B1 34%  sched_debug.cpu#61.=
cpu_load[4]
    351138 =C2=B1  4%    +136.7%     831304 =C2=B1  4%  sched_debug.cpu#61.=
avg_idle
    518488 =C2=B1  4%     -35.6%     333844 =C2=B1  5%  sched_debug.cpu#61.=
nr_switches
    166210 =C2=B1  0%     -39.4%     100751 =C2=B1  5%  sched_debug.cpu#62.=
nr_load_updates
         4 =C2=B1 40%     -78.9%          1 =C2=B1  0%  sched_debug.cpu#62.=
cpu_load[4]
         7 =C2=B1 38%     -79.3%          1 =C2=B1 33%  sched_debug.cpu#62.=
cpu_load[3]
    487117 =C2=B1  4%     -31.6%     332975 =C2=B1  5%  sched_debug.cpu#62.=
nr_switches
        10 =C2=B1 47%     -76.2%          2 =C2=B1 20%  sched_debug.cpu#62.=
cpu_load[2]
      2007 =C2=B1 12%    +257.3%       7174 =C2=B1 28%  sched_debug.cpu#62.=
ttwu_local
    351310 =C2=B1  5%    +137.9%     835592 =C2=B1  2%  sched_debug.cpu#62.=
avg_idle
    494319 =C2=B1  4%     -31.3%     339633 =C2=B1  5%  sched_debug.cpu#62.=
sched_count
     11740 =C2=B1 14%    +376.8%      55979 =C2=B1  5%  sched_debug.cpu#62.=
nr_uninterruptible
    237774 =C2=B1  4%     -59.0%      97456 =C2=B1  6%  sched_debug.cpu#62.=
sched_goidle
    163519 =C2=B1  0%     -38.4%     100702 =C2=B1  5%  sched_debug.cpu#63.=
nr_load_updates
        19 =C2=B1 39%     -77.6%          4 =C2=B1 30%  sched_debug.cpu#63.=
cpu_load[0]
         8 =C2=B1 23%     -72.7%          2 =C2=B1 19%  sched_debug.cpu#63.=
cpu_load[2]
         5 =C2=B1 25%     -82.6%          1 =C2=B1  0%  sched_debug.cpu#63.=
cpu_load[4]
         7 =C2=B1 24%     -78.6%          1 =C2=B1 33%  sched_debug.cpu#63.=
cpu_load[3]
        11 =C2=B1 28%     -69.6%          3 =C2=B1 14%  sched_debug.cpu#63.=
cpu_load[1]
    383806 =C2=B1  6%    +107.3%     795485 =C2=B1  2%  sched_debug.cpu#63.=
avg_idle
    230985 =C2=B1  3%     -57.7%      97730 =C2=B1  6%  sched_debug.cpu#63.=
sched_goidle
    473483 =C2=B1  4%     -29.6%     333448 =C2=B1  5%  sched_debug.cpu#63.=
nr_switches
     11189 =C2=B1 12%    +402.7%      56248 =C2=B1  4%  sched_debug.cpu#63.=
nr_uninterruptible
      1967 =C2=B1  9%    +268.6%       7251 =C2=B1 30%  sched_debug.cpu#63.=
ttwu_local
    480528 =C2=B1  4%     -29.0%     341011 =C2=B1  5%  sched_debug.cpu#63.=
sched_count
    360584 =C2=B1  1%    +124.2%     808561 =C2=B1  5%  sched_debug.cpu#64.=
avg_idle
         6 =C2=B1 49%     -84.6%          1 =C2=B1  0%  sched_debug.cpu#64.=
cpu_load[4]
    162032 =C2=B1  1%     -37.9%     100543 =C2=B1  5%  sched_debug.cpu#64.=
nr_load_updates
    471634 =C2=B1  4%     -27.6%     341321 =C2=B1  5%  sched_debug.cpu#64.=
sched_count
    464736 =C2=B1  4%     -28.0%     334706 =C2=B1  5%  sched_debug.cpu#64.=
nr_switches
      1924 =C2=B1 10%    +271.0%       7140 =C2=B1 28%  sched_debug.cpu#64.=
ttwu_local
    226602 =C2=B1  4%     -56.8%      97801 =C2=B1  7%  sched_debug.cpu#64.=
sched_goidle
     10882 =C2=B1 13%    +426.6%      57312 =C2=B1  2%  sched_debug.cpu#64.=
nr_uninterruptible
    454639 =C2=B1  4%     -26.7%     333349 =C2=B1  5%  sched_debug.cpu#65.=
nr_switches
    461901 =C2=B1  4%     -26.3%     340369 =C2=B1  6%  sched_debug.cpu#65.=
sched_count
         0 =C2=B1  0%      +Inf%          1 =C2=B1 24%  sched_debug.cpu#65.=
nr_running
     10689 =C2=B1 12%    +426.0%      56232 =C2=B1  3%  sched_debug.cpu#65.=
nr_uninterruptible
    369695 =C2=B1  3%    +115.9%     798046 =C2=B1  4%  sched_debug.cpu#65.=
avg_idle
         5 =C2=B1 28%     -81.0%          1 =C2=B1  0%  sched_debug.cpu#65.=
cpu_load[4]
    221512 =C2=B1  4%     -55.9%      97706 =C2=B1  7%  sched_debug.cpu#65.=
sched_goidle
    160420 =C2=B1  1%     -37.3%     100577 =C2=B1  5%  sched_debug.cpu#65.=
nr_load_updates
         5 =C2=B1 28%     -65.2%          2 =C2=B1  0%  sched_debug.cpu#65.=
cpu_load[3]
      1926 =C2=B1 11%    +275.3%       7228 =C2=B1 28%  sched_debug.cpu#65.=
ttwu_local
         5 =C2=B1 20%     -72.7%          1 =C2=B1 33%  sched_debug.cpu#66.=
cpu_load[3]
         7 =C2=B1 15%     -65.5%          2 =C2=B1 20%  sched_debug.cpu#66.=
cpu_load[2]
      1859 =C2=B1  9%    +282.2%       7106 =C2=B1 29%  sched_debug.cpu#66.=
ttwu_local
    159053 =C2=B1  1%     -36.6%     100774 =C2=B1  5%  sched_debug.cpu#66.=
nr_load_updates
         8 =C2=B1 29%     -61.8%          3 =C2=B1 13%  sched_debug.cpu#66.=
cpu_load[1]
    457600 =C2=B1  4%     -25.3%     341731 =C2=B1  5%  sched_debug.cpu#66.=
sched_count
     10564 =C2=B1 14%    +438.2%      56855 =C2=B1  4%  sched_debug.cpu#66.=
nr_uninterruptible
    369343 =C2=B1  8%    +118.8%     808095 =C2=B1  3%  sched_debug.cpu#66.=
avg_idle
         4 =C2=B1 30%     -75.0%          1 =C2=B1  0%  sched_debug.cpu#66.=
cpu_load[4]
    219472 =C2=B1  3%     -55.3%      98188 =C2=B1  6%  sched_debug.cpu#66.=
sched_goidle
    450502 =C2=B1  4%     -25.7%     334770 =C2=B1  5%  sched_debug.cpu#66.=
nr_switches
    466476 =C2=B1  6%     -27.1%     339837 =C2=B1  5%  sched_debug.cpu#67.=
sched_count
    160888 =C2=B1  2%     -37.7%     100182 =C2=B1  5%  sched_debug.cpu#67.=
nr_load_updates
         5 =C2=B1 37%     -69.6%          1 =C2=B1 24%  sched_debug.cpu#67.=
cpu_load[3]
    459640 =C2=B1  6%     -27.6%     332819 =C2=B1  5%  sched_debug.cpu#67.=
nr_switches
         5 =C2=B1 24%     -76.2%          1 =C2=B1 34%  sched_debug.cpu#67.=
cpu_load[4]
     10908 =C2=B1 17%    +417.4%      56441 =C2=B1  3%  sched_debug.cpu#67.=
nr_uninterruptible
      1935 =C2=B1  9%    +273.9%       7235 =C2=B1 30%  sched_debug.cpu#67.=
ttwu_local
    224021 =C2=B1  6%     -56.4%      97632 =C2=B1  6%  sched_debug.cpu#67.=
sched_goidle
    349251 =C2=B1  6%    +128.9%     799422 =C2=B1  1%  sched_debug.cpu#67.=
avg_idle
         0 =C2=B1  0%      +Inf%          1 =C2=B1 34%  sched_debug.cpu#67.=
nr_running
      1907 =C2=B1 11%    +280.5%       7256 =C2=B1 29%  sched_debug.cpu#68.=
ttwu_local
    219479 =C2=B1  4%     -55.6%      97442 =C2=B1  6%  sched_debug.cpu#68.=
sched_goidle
    450587 =C2=B1  5%     -26.0%     333323 =C2=B1  5%  sched_debug.cpu#68.=
nr_switches
    392113 =C2=B1  8%    +108.3%     816905 =C2=B1  2%  sched_debug.cpu#68.=
avg_idle
         0 =C2=B1  0%      +Inf%          1 =C2=B1 33%  sched_debug.cpu#68.=
nr_running
         5 =C2=B1 34%     -81.0%          1 =C2=B1  0%  sched_debug.cpu#68.=
cpu_load[4]
    159530 =C2=B1  1%     -37.2%     100191 =C2=B1  5%  sched_debug.cpu#68.=
nr_load_updates
    457458 =C2=B1  5%     -25.7%     340032 =C2=B1  5%  sched_debug.cpu#68.=
sched_count
     10515 =C2=B1 14%    +439.1%      56681 =C2=B1  3%  sched_debug.cpu#68.=
nr_uninterruptible
     10444 =C2=B1 14%    +450.7%      57517 =C2=B1  1%  sched_debug.cpu#69.=
nr_uninterruptible
    446109 =C2=B1  4%     -25.1%     334321 =C2=B1  5%  sched_debug.cpu#69.=
nr_switches
    452933 =C2=B1  4%     -24.7%     340979 =C2=B1  5%  sched_debug.cpu#69.=
sched_count
    217204 =C2=B1  4%     -55.1%      97621 =C2=B1  6%  sched_debug.cpu#69.=
sched_goidle
    158575 =C2=B1  1%     -36.8%     100204 =C2=B1  5%  sched_debug.cpu#69.=
nr_load_updates
    351220 =C2=B1  4%    +137.5%     834165 =C2=B1  3%  sched_debug.cpu#69.=
avg_idle
      1876 =C2=B1 11%    +283.9%       7204 =C2=B1 28%  sched_debug.cpu#69.=
ttwu_local
   1091164 =C2=B1  3%     +24.1%    1354466 =C2=B1  5%  sched_debug.cpu#7.s=
ched_count
    523643 =C2=B1  3%     +16.7%     611192 =C2=B1  5%  sched_debug.cpu#7.s=
ched_goidle
    410239 =C2=B1  4%     +34.6%     552357 =C2=B1  9%  sched_debug.cpu#7.t=
twu_count
      4561 =C2=B1 10%    +124.7%      10249 =C2=B1 21%  sched_debug.cpu#7.t=
twu_local
   1068057 =C2=B1  3%     +23.5%    1319002 =C2=B1  5%  sched_debug.cpu#7.n=
r_switches
     10279 =C2=B1 14%    +448.2%      56356 =C2=B1  2%  sched_debug.cpu#70.=
nr_uninterruptible
    352820 =C2=B1  9%    +134.6%     827636 =C2=B1  4%  sched_debug.cpu#70.=
avg_idle
      9783 =C2=B1 25%     +48.0%      14480 =C2=B1  8%  sched_debug.cpu#70.=
curr->pid
    449808 =C2=B1  4%     -24.4%     340071 =C2=B1  5%  sched_debug.cpu#70.=
sched_count
    215565 =C2=B1  4%     -54.9%      97278 =C2=B1  6%  sched_debug.cpu#70.=
sched_goidle
    442796 =C2=B1  5%     -24.7%     333367 =C2=B1  5%  sched_debug.cpu#70.=
nr_switches
    157886 =C2=B1  1%     -36.6%     100081 =C2=B1  5%  sched_debug.cpu#70.=
nr_load_updates
         3 =C2=B1 31%     -71.4%          1 =C2=B1  0%  sched_debug.cpu#70.=
cpu_load[4]
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cpu#70.=
nr_running
      1847 =C2=B1 12%    +290.8%       7217 =C2=B1 29%  sched_debug.cpu#70.=
ttwu_local
     10300 =C2=B1 15%    +445.5%      56190 =C2=B1  2%  sched_debug.cpu#71.=
nr_uninterruptible
    440375 =C2=B1  5%     -24.4%     332977 =C2=B1  4%  sched_debug.cpu#71.=
nr_switches
      1857 =C2=B1 12%    +287.9%       7205 =C2=B1 30%  sched_debug.cpu#71.=
ttwu_local
    447123 =C2=B1  5%     -24.0%     339605 =C2=B1  4%  sched_debug.cpu#71.=
sched_count
    372180 =C2=B1  6%    +119.1%     815314 =C2=B1  2%  sched_debug.cpu#71.=
avg_idle
    214355 =C2=B1  4%     -54.7%      97027 =C2=B1  6%  sched_debug.cpu#71.=
sched_goidle
    157564 =C2=B1  1%     -36.4%     100194 =C2=B1  4%  sched_debug.cpu#71.=
nr_load_updates
      1848 =C2=B1 12%    +290.7%       7220 =C2=B1 29%  sched_debug.cpu#72.=
ttwu_local
      9980 =C2=B1 32%     +51.9%      15161 =C2=B1 35%  sched_debug.cpu#72.=
curr->pid
         7 =C2=B1 10%     -78.6%          1 =C2=B1 33%  sched_debug.cpu#72.=
cpu_load[4]
    389711 =C2=B1  4%    +112.4%     827764 =C2=B1  1%  sched_debug.cpu#72.=
avg_idle
         8 =C2=B1 24%     -79.4%          1 =C2=B1 47%  sched_debug.cpu#72.=
cpu_load[3]
    439193 =C2=B1  5%     -23.8%     334863 =C2=B1  5%  sched_debug.cpu#72.=
nr_switches
    445902 =C2=B1  5%     -23.4%     341459 =C2=B1  5%  sched_debug.cpu#72.=
sched_count
    213663 =C2=B1  5%     -54.6%      96938 =C2=B1  6%  sched_debug.cpu#72.=
sched_goidle
    157330 =C2=B1  1%     -36.1%     100472 =C2=B1  5%  sched_debug.cpu#72.=
nr_load_updates
     10371 =C2=B1 15%    +454.6%      57521 =C2=B1  2%  sched_debug.cpu#72.=
nr_uninterruptible
         7 =C2=B1 39%     -65.5%          2 =C2=B1 20%  sched_debug.cpu#73.=
cpu_load[2]
    214049 =C2=B1  5%     -54.6%      97108 =C2=B1  6%  sched_debug.cpu#73.=
sched_goidle
     10495 =C2=B1 16%    +434.3%      56076 =C2=B1  3%  sched_debug.cpu#73.=
nr_uninterruptible
      1824 =C2=B1 14%    +299.2%       7281 =C2=B1 30%  sched_debug.cpu#73.=
ttwu_local
         6 =C2=B1 45%     -70.8%          1 =C2=B1 24%  sched_debug.cpu#73.=
cpu_load[3]
    440090 =C2=B1  6%     -24.2%     333514 =C2=B1  4%  sched_debug.cpu#73.=
nr_switches
    398199 =C2=B1  4%    +100.8%     799630 =C2=B1  2%  sched_debug.cpu#73.=
avg_idle
    446777 =C2=B1  6%     -23.9%     339998 =C2=B1  4%  sched_debug.cpu#73.=
sched_count
    157615 =C2=B1  1%     -36.4%     100184 =C2=B1  5%  sched_debug.cpu#73.=
nr_load_updates
     10541 =C2=B1 16%    +435.4%      56435 =C2=B1  3%  sched_debug.cpu#74.=
nr_uninterruptible
    448101 =C2=B1  5%     -24.4%     338746 =C2=B1  5%  sched_debug.cpu#74.=
sched_count
    394634 =C2=B1  4%    +101.7%     796067 =C2=B1  1%  sched_debug.cpu#74.=
avg_idle
        17 =C2=B1 43%     -77.9%          3 =C2=B1 22%  sched_debug.cpu#74.=
cpu_load[1]
    441455 =C2=B1  5%     -24.7%     332301 =C2=B1  5%  sched_debug.cpu#74.=
nr_switches
      1844 =C2=B1 11%    +291.8%       7227 =C2=B1 30%  sched_debug.cpu#74.=
ttwu_local
    157582 =C2=B1  1%     -36.7%      99748 =C2=B1  5%  sched_debug.cpu#74.=
nr_load_updates
         9 =C2=B1 28%     -81.6%          1 =C2=B1 24%  sched_debug.cpu#74.=
cpu_load[3]
    214781 =C2=B1  5%     -55.1%      96404 =C2=B1  6%  sched_debug.cpu#74.=
sched_goidle
         7 =C2=B1 26%     -82.1%          1 =C2=B1 34%  sched_debug.cpu#74.=
cpu_load[4]
        12 =C2=B1 35%     -80.0%          2 =C2=B1 20%  sched_debug.cpu#74.=
cpu_load[2]
    164640 =C2=B1  1%     -52.7%      77949 =C2=B1 26%  sched_debug.cpu#75.=
nr_load_updates
    361203 =C2=B1  5%    +153.4%     915258 =C2=B1  5%  sched_debug.cpu#75.=
avg_idle
    483086 =C2=B1  1%     -51.1%     236050 =C2=B1 37%  sched_debug.cpu#75.=
sched_count
    476102 =C2=B1  1%     -51.3%     231994 =C2=B1 36%  sched_debug.cpu#75.=
nr_switches
    232077 =C2=B1  1%     -68.4%      73385 =C2=B1 27%  sched_debug.cpu#75.=
sched_goidle
    475860 =C2=B1  1%     -50.4%     235843 =C2=B1 37%  sched_debug.cpu#76.=
sched_count
    370986 =C2=B1  4%    +140.8%     893396 =C2=B1  7%  sched_debug.cpu#76.=
avg_idle
    468899 =C2=B1  1%     -50.6%     231822 =C2=B1 37%  sched_debug.cpu#76.=
nr_switches
    163074 =C2=B1  0%     -52.4%      77553 =C2=B1 26%  sched_debug.cpu#76.=
nr_load_updates
    228349 =C2=B1  1%     -68.1%      72873 =C2=B1 28%  sched_debug.cpu#76.=
sched_goidle
         0 =C2=B1  0%      +Inf%         25 =C2=B1 38%  sched_debug.cpu#76.=
load
    363660 =C2=B1  1%    +148.2%     902694 =C2=B1  4%  sched_debug.cpu#77.=
avg_idle
    476100 =C2=B1  6%     -50.2%     236976 =C2=B1 37%  sched_debug.cpu#77.=
sched_count
    228629 =C2=B1  5%     -68.1%      72878 =C2=B1 28%  sched_debug.cpu#77.=
sched_goidle
    163638 =C2=B1  3%     -52.6%      77542 =C2=B1 27%  sched_debug.cpu#77.=
nr_load_updates
    469211 =C2=B1  6%     -50.5%     232239 =C2=B1 37%  sched_debug.cpu#77.=
nr_switches
    460611 =C2=B1  4%     -49.7%     231831 =C2=B1 37%  sched_debug.cpu#78.=
nr_switches
    467338 =C2=B1  4%     -49.5%     235855 =C2=B1 37%  sched_debug.cpu#78.=
sched_count
    224421 =C2=B1  4%     -67.6%      72672 =C2=B1 28%  sched_debug.cpu#78.=
sched_goidle
    381951 =C2=B1 13%    +136.3%     902531 =C2=B1  6%  sched_debug.cpu#78.=
avg_idle
    162704 =C2=B1  2%     -52.4%      77434 =C2=B1 27%  sched_debug.cpu#78.=
nr_load_updates
    221400 =C2=B1  3%     -66.8%      73518 =C2=B1 28%  sched_debug.cpu#79.=
sched_goidle
    397648 =C2=B1  7%    +127.9%     906260 =C2=B1  5%  sched_debug.cpu#79.=
avg_idle
    461046 =C2=B1  3%     -48.4%     237777 =C2=B1 37%  sched_debug.cpu#79.=
sched_count
    454447 =C2=B1  3%     -48.6%     233725 =C2=B1 37%  sched_debug.cpu#79.=
nr_switches
    161593 =C2=B1  2%     -51.8%      77813 =C2=B1 26%  sched_debug.cpu#79.=
nr_load_updates
      4503 =C2=B1 11%    +117.6%       9799 =C2=B1 25%  sched_debug.cpu#8.t=
twu_local
   1064520 =C2=B1  3%     +23.4%    1313774 =C2=B1  4%  sched_debug.cpu#8.n=
r_switches
    521824 =C2=B1  3%     +16.6%     608464 =C2=B1  5%  sched_debug.cpu#8.s=
ched_goidle
    407022 =C2=B1  5%     +35.5%     551655 =C2=B1  9%  sched_debug.cpu#8.t=
twu_count
   1084793 =C2=B1  3%     +24.3%    1348477 =C2=B1  4%  sched_debug.cpu#8.s=
ched_count
    449003 =C2=B1  4%     -48.8%     230108 =C2=B1 37%  sched_debug.cpu#80.=
nr_switches
    218669 =C2=B1  4%     -67.0%      72091 =C2=B1 28%  sched_debug.cpu#80.=
sched_goidle
    455752 =C2=B1  4%     -48.3%     235485 =C2=B1 37%  sched_debug.cpu#80.=
sched_count
    355619 =C2=B1 11%    +154.8%     906078 =C2=B1  5%  sched_debug.cpu#80.=
avg_idle
    160754 =C2=B1  2%     -52.2%      76880 =C2=B1 27%  sched_debug.cpu#80.=
nr_load_updates
    216571 =C2=B1  4%     -66.5%      72533 =C2=B1 29%  sched_debug.cpu#81.=
sched_goidle
    375573 =C2=B1  5%    +137.9%     893511 =C2=B1  6%  sched_debug.cpu#81.=
avg_idle
    160219 =C2=B1  2%     -51.7%      77329 =C2=B1 28%  sched_debug.cpu#81.=
nr_load_updates
    451643 =C2=B1  4%     -47.6%     236789 =C2=B1 38%  sched_debug.cpu#81.=
sched_count
    444845 =C2=B1  4%     -47.7%     232555 =C2=B1 37%  sched_debug.cpu#81.=
nr_switches
    215428 =C2=B1  4%     -66.6%      71893 =C2=B1 29%  sched_debug.cpu#82.=
sched_goidle
    368902 =C2=B1  6%    +152.6%     931727 =C2=B1  3%  sched_debug.cpu#82.=
avg_idle
    442822 =C2=B1  4%     -48.0%     230123 =C2=B1 37%  sched_debug.cpu#82.=
nr_switches
    159684 =C2=B1  2%     -52.1%      76475 =C2=B1 27%  sched_debug.cpu#82.=
nr_load_updates
    449549 =C2=B1  4%     -47.8%     234604 =C2=B1 37%  sched_debug.cpu#82.=
sched_count
    159520 =C2=B1  2%     -51.4%      77568 =C2=B1 27%  sched_debug.cpu#83.=
nr_load_updates
    449125 =C2=B1  4%     -46.8%     239047 =C2=B1 38%  sched_debug.cpu#83.=
sched_count
    215386 =C2=B1  4%     -66.1%      72964 =C2=B1 28%  sched_debug.cpu#83.=
sched_goidle
    385918 =C2=B1  6%    +136.5%     912662 =C2=B1  5%  sched_debug.cpu#83.=
avg_idle
    442478 =C2=B1  4%     -47.3%     233229 =C2=B1 37%  sched_debug.cpu#83.=
nr_switches
    449876 =C2=B1  4%     -47.3%     236952 =C2=B1 37%  sched_debug.cpu#84.=
sched_count
    443343 =C2=B1  4%     -47.6%     232453 =C2=B1 37%  sched_debug.cpu#84.=
nr_switches
    159522 =C2=B1  2%     -51.7%      77037 =C2=B1 27%  sched_debug.cpu#84.=
nr_load_updates
    215677 =C2=B1  4%     -66.3%      72592 =C2=B1 29%  sched_debug.cpu#84.=
sched_goidle
    364262 =C2=B1 13%    +148.5%     905299 =C2=B1  5%  sched_debug.cpu#84.=
avg_idle
    444975 =C2=B1  3%     -48.1%     230920 =C2=B1 37%  sched_debug.cpu#85.=
nr_switches
    216569 =C2=B1  3%     -66.8%      71874 =C2=B1 29%  sched_debug.cpu#85.=
sched_goidle
    451627 =C2=B1  3%     -48.0%     234975 =C2=B1 37%  sched_debug.cpu#85.=
sched_count
    387650 =C2=B1  7%    +129.1%     888267 =C2=B1  7%  sched_debug.cpu#85.=
avg_idle
    159827 =C2=B1  2%     -51.9%      76809 =C2=B1 27%  sched_debug.cpu#85.=
nr_load_updates
    398952 =C2=B1 16%    +120.7%     880379 =C2=B1  7%  sched_debug.cpu#86.=
avg_idle
    447181 =C2=B1  3%     -48.3%     231357 =C2=B1 37%  sched_debug.cpu#86.=
nr_switches
    159916 =C2=B1  2%     -51.8%      77000 =C2=B1 27%  sched_debug.cpu#86.=
nr_load_updates
    453947 =C2=B1  3%     -48.1%     235643 =C2=B1 37%  sched_debug.cpu#86.=
sched_count
    217599 =C2=B1  3%     -67.1%      71651 =C2=B1 28%  sched_debug.cpu#86.=
sched_goidle
    160324 =C2=B1  2%     -52.1%      76764 =C2=B1 27%  sched_debug.cpu#87.=
nr_load_updates
    374310 =C2=B1  6%    +138.1%     891320 =C2=B1  6%  sched_debug.cpu#87.=
avg_idle
    220101 =C2=B1  3%     -67.3%      72026 =C2=B1 28%  sched_debug.cpu#87.=
sched_goidle
    458878 =C2=B1  3%     -48.7%     235540 =C2=B1 37%  sched_debug.cpu#87.=
sched_count
    452233 =C2=B1  3%     -48.8%     231554 =C2=B1 37%  sched_debug.cpu#87.=
nr_switches
    160998 =C2=B1  1%     -52.2%      76976 =C2=B1 27%  sched_debug.cpu#88.=
nr_load_updates
    388490 =C2=B1 10%    +133.5%     907200 =C2=B1  6%  sched_debug.cpu#88.=
avg_idle
    464167 =C2=B1  3%     -49.3%     235524 =C2=B1 37%  sched_debug.cpu#88.=
sched_count
    222658 =C2=B1  2%     -67.8%      71589 =C2=B1 28%  sched_debug.cpu#88.=
sched_goidle
    457358 =C2=B1  3%     -49.5%     230996 =C2=B1 37%  sched_debug.cpu#88.=
nr_switches
    373956 =C2=B1 11%    +142.8%     908123 =C2=B1  4%  sched_debug.cpu#89.=
avg_idle
    227255 =C2=B1  2%     -68.5%      71532 =C2=B1 29%  sched_debug.cpu#89.=
sched_goidle
    466727 =C2=B1  2%     -50.5%     231136 =C2=B1 38%  sched_debug.cpu#89.=
nr_switches
    161927 =C2=B1  1%     -52.7%      76598 =C2=B1 28%  sched_debug.cpu#89.=
nr_load_updates
    473645 =C2=B1  2%     -50.3%     235205 =C2=B1 38%  sched_debug.cpu#89.=
sched_count
   1081031 =C2=B1  3%     +25.0%    1351582 =C2=B1  4%  sched_debug.cpu#9.s=
ched_count
         0 =C2=B1  0%      +Inf%         17 =C2=B1 47%  sched_debug.cpu#9.l=
oad
    402463 =C2=B1  4%     +36.8%     550573 =C2=B1  9%  sched_debug.cpu#9.t=
twu_count
    518725 =C2=B1  3%     +17.5%     609468 =C2=B1  4%  sched_debug.cpu#9.s=
ched_goidle
   1058429 =C2=B1  3%     +24.5%    1317308 =C2=B1  4%  sched_debug.cpu#9.n=
r_switches
      4530 =C2=B1 14%    +118.6%       9905 =C2=B1 28%  sched_debug.cpu#9.t=
twu_local
    330519 =C2=B1 11%    +154.1%     839727 =C2=B1  6%  sched_debug.cpu#90.=
avg_idle
    247920 =C2=B1  7%     -23.5%     189659 =C2=B1 21%  sched_debug.cpu#90.=
ttwu_count
     11641 =C2=B1 14%    +310.1%      47738 =C2=B1 37%  sched_debug.cpu#90.=
nr_uninterruptible
        12 =C2=B1 26%     -86.0%          1 =C2=B1 47%  sched_debug.cpu#90.=
cpu_load[2]
         9 =C2=B1 27%     -84.2%          1 =C2=B1 33%  sched_debug.cpu#90.=
cpu_load[3]
    236121 =C2=B1  4%     -62.6%      88204 =C2=B1 16%  sched_debug.cpu#90.=
sched_goidle
    492698 =C2=B1  4%     -39.5%     297909 =C2=B1 20%  sched_debug.cpu#90.=
sched_count
    484160 =C2=B1  5%     -39.8%     291626 =C2=B1 20%  sched_debug.cpu#90.=
nr_switches
    164750 =C2=B1  1%     -45.4%      89920 =C2=B1 12%  sched_debug.cpu#90.=
nr_load_updates
        13 =C2=B1 36%     -80.0%          2 =C2=B1 30%  sched_debug.cpu#90.=
cpu_load[1]
      2380 =C2=B1 22%    +161.2%       6218 =C2=B1 25%  sched_debug.cpu#90.=
ttwu_local
        10 =C2=B1 22%     -78.0%          2 =C2=B1 19%  sched_debug.cpu#91.=
cpu_load[2]
         6 =C2=B1 17%     -84.6%          1 =C2=B1  0%  sched_debug.cpu#91.=
cpu_load[4]
      1958 =C2=B1 11%    +216.4%       6195 =C2=B1 25%  sched_debug.cpu#91.=
ttwu_local
    466743 =C2=B1  4%     -37.1%     293473 =C2=B1 20%  sched_debug.cpu#91.=
nr_switches
     11129 =C2=B1 13%    +339.4%      48904 =C2=B1 38%  sched_debug.cpu#91.=
nr_uninterruptible
        11 =C2=B1 37%     -73.3%          3 =C2=B1  0%  sched_debug.cpu#91.=
cpu_load[1]
    161859 =C2=B1  2%     -44.3%      90199 =C2=B1 12%  sched_debug.cpu#91.=
nr_load_updates
    227465 =C2=B1  4%     -61.2%      88334 =C2=B1 16%  sched_debug.cpu#91.=
sched_goidle
         8 =C2=B1 23%     -78.1%          1 =C2=B1 24%  sched_debug.cpu#91.=
cpu_load[3]
    473602 =C2=B1  4%     -36.6%     300206 =C2=B1 20%  sched_debug.cpu#91.=
sched_count
    365768 =C2=B1  8%    +131.9%     848199 =C2=B1  5%  sched_debug.cpu#91.=
avg_idle
    464831 =C2=B1  5%     -35.8%     298566 =C2=B1 20%  sched_debug.cpu#92.=
sched_count
      1909 =C2=B1 12%    +225.2%       6209 =C2=B1 25%  sched_debug.cpu#92.=
ttwu_local
         6 =C2=B1 41%     -84.0%          1 =C2=B1  0%  sched_debug.cpu#92.=
cpu_load[4]
     10722 =C2=B1 14%    +354.4%      48718 =C2=B1 37%  sched_debug.cpu#92.=
nr_uninterruptible
    223142 =C2=B1  5%     -60.5%      88183 =C2=B1 16%  sched_debug.cpu#92.=
sched_goidle
    160290 =C2=B1  2%     -43.9%      89915 =C2=B1 12%  sched_debug.cpu#92.=
nr_load_updates
    379115 =C2=B1  7%    +132.0%     879627 =C2=B1  2%  sched_debug.cpu#92.=
avg_idle
    458041 =C2=B1  5%     -36.1%     292684 =C2=B1 20%  sched_debug.cpu#92.=
nr_switches
    159097 =C2=B1  2%     -43.6%      89715 =C2=B1 12%  sched_debug.cpu#93.=
nr_load_updates
    363321 =C2=B1  9%    +135.0%     853706 =C2=B1  4%  sched_debug.cpu#93.=
avg_idle
         9 =C2=B1 38%     -66.7%          3 =C2=B1 13%  sched_debug.cpu#93.=
cpu_load[1]
    449508 =C2=B1  5%     -35.0%     291986 =C2=B1 20%  sched_debug.cpu#93.=
nr_switches
    218847 =C2=B1  5%     -59.9%      87722 =C2=B1 16%  sched_debug.cpu#93.=
sched_goidle
    456189 =C2=B1  5%     -34.6%     298447 =C2=B1 20%  sched_debug.cpu#93.=
sched_count
         9 =C2=B1 20%     -73.0%          2 =C2=B1 20%  sched_debug.cpu#93.=
cpu_load[2]
         8 =C2=B1  8%     -78.1%          1 =C2=B1 24%  sched_debug.cpu#93.=
cpu_load[3]
     10526 =C2=B1 14%    +364.2%      48867 =C2=B1 36%  sched_debug.cpu#93.=
nr_uninterruptible
         6 =C2=B1  7%     -80.8%          1 =C2=B1 34%  sched_debug.cpu#93.=
cpu_load[4]
      1885 =C2=B1 12%    +225.2%       6131 =C2=B1 25%  sched_debug.cpu#93.=
ttwu_local
    215555 =C2=B1  5%     -59.0%      88450 =C2=B1 16%  sched_debug.cpu#94.=
sched_goidle
    157842 =C2=B1  2%     -43.0%      90011 =C2=B1 12%  sched_debug.cpu#94.=
nr_load_updates
     10314 =C2=B1 15%    +383.2%      49839 =C2=B1 37%  sched_debug.cpu#94.=
nr_uninterruptible
    373165 =C2=B1 12%    +128.3%     851916 =C2=B1  2%  sched_debug.cpu#94.=
avg_idle
         2 =C2=B1  0%     +87.5%          3 =C2=B1 22%  sched_debug.cpu#94.=
cpu_load[0]
    443064 =C2=B1  5%     -33.5%     294760 =C2=B1 20%  sched_debug.cpu#94.=
nr_switches
      1869 =C2=B1 13%    +231.5%       6198 =C2=B1 23%  sched_debug.cpu#94.=
ttwu_local
    449617 =C2=B1  5%     -33.0%     301360 =C2=B1 20%  sched_debug.cpu#94.=
sched_count
     10349 =C2=B1 13%    +364.1%      48028 =C2=B1 38%  sched_debug.cpu#95.=
nr_uninterruptible
    157490 =C2=B1  2%     -43.3%      89361 =C2=B1 12%  sched_debug.cpu#95.=
nr_load_updates
    447749 =C2=B1  5%     -33.6%     297481 =C2=B1 20%  sched_debug.cpu#95.=
sched_count
    440550 =C2=B1  5%     -33.9%     291184 =C2=B1 20%  sched_debug.cpu#95.=
nr_switches
    380790 =C2=B1 12%    +129.2%     872691 =C2=B1  4%  sched_debug.cpu#95.=
avg_idle
         7 =C2=B1 40%     -83.9%          1 =C2=B1 34%  sched_debug.cpu#95.=
cpu_load[3]
    214335 =C2=B1  5%     -59.1%      87594 =C2=B1 16%  sched_debug.cpu#95.=
sched_goidle
      1843 =C2=B1 12%    +243.4%       6328 =C2=B1 22%  sched_debug.cpu#95.=
ttwu_local
     10609 =C2=B1 12%    +352.8%      48034 =C2=B1 35%  sched_debug.cpu#96.=
nr_uninterruptible
    220349 =C2=B1  4%     -60.3%      87478 =C2=B1 15%  sched_debug.cpu#96.=
sched_goidle
    459952 =C2=B1  4%     -35.5%     296579 =C2=B1 19%  sched_debug.cpu#96.=
sched_count
    382794 =C2=B1  8%    +121.5%     847879 =C2=B1  3%  sched_debug.cpu#96.=
avg_idle
         8 =C2=B1 40%     -72.7%          2 =C2=B1 19%  sched_debug.cpu#96.=
cpu_load[2]
    159883 =C2=B1  1%     -44.1%      89417 =C2=B1 12%  sched_debug.cpu#96.=
nr_load_updates
    452633 =C2=B1  4%     -35.8%     290522 =C2=B1 19%  sched_debug.cpu#96.=
nr_switches
      1927 =C2=B1 13%    +223.1%       6226 =C2=B1 23%  sched_debug.cpu#96.=
ttwu_local
         6 =C2=B1 36%     -77.8%          1 =C2=B1 33%  sched_debug.cpu#96.=
cpu_load[3]
    158918 =C2=B1  1%     -43.8%      89247 =C2=B1 12%  sched_debug.cpu#97.=
nr_load_updates
         7 =C2=B1 27%     -83.3%          1 =C2=B1 34%  sched_debug.cpu#97.=
cpu_load[4]
    371984 =C2=B1 10%    +126.9%     843866 =C2=B1  4%  sched_debug.cpu#97.=
avg_idle
         9 =C2=B1 42%     -81.6%          1 =C2=B1 24%  sched_debug.cpu#97.=
cpu_load[3]
      1857 =C2=B1 11%    +231.5%       6158 =C2=B1 24%  sched_debug.cpu#97.=
ttwu_local
    454841 =C2=B1  4%     -34.8%     296555 =C2=B1 20%  sched_debug.cpu#97.=
sched_count
    448082 =C2=B1  4%     -35.1%     290591 =C2=B1 20%  sched_debug.cpu#97.=
nr_switches
    218092 =C2=B1  4%     -59.9%      87476 =C2=B1 16%  sched_debug.cpu#97.=
sched_goidle
     10490 =C2=B1 13%    +357.9%      48042 =C2=B1 37%  sched_debug.cpu#97.=
nr_uninterruptible
         8 =C2=B1 26%     -85.3%          1 =C2=B1 34%  sched_debug.cpu#98.=
cpu_load[3]
    363336 =C2=B1  8%    +139.6%     870418 =C2=B1  2%  sched_debug.cpu#98.=
avg_idle
    217716 =C2=B1  4%     -59.6%      88025 =C2=B1 15%  sched_debug.cpu#98.=
sched_goidle
         6 =C2=B1 25%     -84.6%          1 =C2=B1  0%  sched_debug.cpu#98.=
cpu_load[4]
    454322 =C2=B1  4%     -34.0%     299712 =C2=B1 19%  sched_debug.cpu#98.=
sched_count
      1891 =C2=B1  9%    +231.0%       6262 =C2=B1 25%  sched_debug.cpu#98.=
ttwu_local
    447408 =C2=B1  4%     -34.5%     293275 =C2=B1 20%  sched_debug.cpu#98.=
nr_switches
        10 =C2=B1 36%     -80.5%          2 =C2=B1  0%  sched_debug.cpu#98.=
cpu_load[2]
    158876 =C2=B1  1%     -43.4%      89862 =C2=B1 12%  sched_debug.cpu#98.=
nr_load_updates
     10482 =C2=B1 13%    +370.9%      49366 =C2=B1 38%  sched_debug.cpu#98.=
nr_uninterruptible
     10469 =C2=B1 14%    +370.8%      49296 =C2=B1 38%  sched_debug.cpu#99.=
nr_uninterruptible
    455622 =C2=B1  4%     -34.3%     299384 =C2=B1 20%  sched_debug.cpu#99.=
sched_count
    218527 =C2=B1  4%     -59.7%      88000 =C2=B1 16%  sched_debug.cpu#99.=
sched_goidle
    448998 =C2=B1  4%     -34.6%     293470 =C2=B1 20%  sched_debug.cpu#99.=
nr_switches
      1912 =C2=B1 12%    +226.2%       6237 =C2=B1 25%  sched_debug.cpu#99.=
ttwu_local
    379179 =C2=B1 11%    +115.2%     815881 =C2=B1  3%  sched_debug.cpu#99.=
avg_idle
         9 =C2=B1 49%     -81.1%          1 =C2=B1 24%  sched_debug.cpu#99.=
cpu_load[3]
    158830 =C2=B1  1%     -43.5%      89753 =C2=B1 12%  sched_debug.cpu#99.=
nr_load_updates
         6 =C2=B1 39%     -81.5%          1 =C2=B1 34%  sched_debug.cpu#99.=
cpu_load[4]

brickland3: Brickland Ivy Bridge-EX
Memory: 512G




                        aim7.time.involuntary_context_switches

  1.4e+06 ++---------------------------------------------------------------=
-+
          O                                                                =
 |
  1.2e+06 ++                               O                               =
 |
          |       O        O       O                                       =
 |
    1e+06 ++                                                               =
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
   400000 ++                                                        O      =
 |
          |                                        O        O              =
 O
   200000 ++                                                               =
 |
          |                                                             ...=
.*
        0 *+------*--------*-------*-------*-------*--------*-------*------=
-+


                                cpuidle.POLL.usage

  300 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  250 ++     ..*....                                                       =
 |
      |  ....       ...                                                    =
 |
      *..              .    ....*......                                    =
 |
  200 ++                *...           ..     ....*........*.......        =
 |
      |                                  *....                     *.......=
.*
  150 ++                                                                   =
 |
      |                                                                    =
 |
  100 ++                                                                   =
 |
      |                                           O        O               =
 O
      |        O                                                   O       =
 |
   50 O+                                 O                                 =
 |
      |                 O       O                                          =
 |
    0 ++-------------------------------------------------------------------=
-+


                                cpuidle.C1-IVT-4S.usage

    2e+07 ++---------------------------------------------------------------=
-+
  1.8e+07 ++                                                O       O      =
 |
          |                                                                =
 |
  1.6e+07 ++                                       O                       =
 O
  1.4e+07 ++                                                               =
 |
          O                                O                               =
 |
  1.2e+07 ++      O        O       O                                       =
 |
    1e+07 ++                                                               =
 |
    8e+06 ++                                                               =
 |
          |                                                                =
 |
    6e+06 ++                                                               =
 |
    4e+06 ++                                                            ...=
.*
          |            ....*.......*.......*.......*........*.......*...   =
 |
    2e+06 *+......*....                                                    =
 |
        0 ++---------------------------------------------------------------=
-+


                            numa-vmstat.node1.numa_other

  85000 ++-------------------------------------------------O---------------=
-+
        O        O       O        O       O        O                O      =
 O
  80000 ++                                                                 =
 |
        |                                                                  =
 |
  75000 ++                                                                 =
 |
        |                                                                  =
 |
  70000 ++                                                                 =
 |
        |                                                                  =
 |
  65000 ++                                                                 =
 |
        |                                                                  =
 |
  60000 ++                                                                 =
 |
        |                                                                  =
 |
  55000 ++                                                                 =
 |
        *........*.......*........*.......*........*.......*........*......=
.*
  50000 ++-----------------------------------------------------------------=
-+


                            numa-vmstat.node2.numa_other

  85000 ++-----------------------------------------------------------------=
-+
        *........*.......*........*.......*........*.......*........*......=
.*
  80000 ++                                                                 =
 |
        |                                                                  =
 |
  75000 ++                                                                 =
 |
        |                                                                  =
 |
  70000 ++                                                                 =
 |
        |                                                                  =
 |
  65000 ++                                                                 =
 |
        |                                                                  =
 |
  60000 ++                                                                 =
 |
        |                                                                  =
 |
  55000 ++                                                                 =
 |
        O        O       O        O       O        O       O        O      =
 O
  50000 ++-----------------------------------------------------------------=
-+


                              proc-vmstat.nr_anon_pages

  56000 ++-----------------------------------------------------------------=
-+
        *........*.....                        ....*...                    =
 |
  54000 ++             ..     ....*.......*....        ...                .=
.*
  52000 ++               *....                            .           .... =
 |
        |                                                  *........*.     =
 |
  50000 ++                                                                 =
 |
  48000 ++                                                                 =
 |
        |                                                                  =
 |
  46000 ++                                                                 =
 |
  44000 ++                                         O       O        O      =
 O
        |                                                                  =
 |
  42000 ++                                                                 =
 |
  40000 O+               O        O       O                                =
 |
        |        O                                                         =
 |
  38000 ++-----------------------------------------------------------------=
-+


                                  meminfo.AnonPages

  220000 *+----------------------------------------------------------------=
-+
         |       *........             ....*.......*.....                 .=
.*
  210000 ++               *.......*....                  ..           .... =
 |
         |                                                 *........*.     =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  190000 ++                                                                =
 |
         |                                                                 =
 |
  180000 ++                                                                =
 |
         |                                         O       O        O      =
 O
  170000 ++                                                                =
 |
         O                                                                 =
 |
  160000 ++      O        O       O        O                               =
 |
         |                                                                 =
 |
  150000 ++----------------------------------------------------------------=
-+


                           slabinfo.mm_struct.active_objs

  11000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  10500 ++               O                                                 =
 |
        O        O                O                                        =
 |
        |                                                                  =
 |
  10000 ++                                O                                =
 |
        |                                                                  =
 |
   9500 ++                                                 O               =
 |
        |                                          O                O      =
 O
   9000 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
   8500 *+.......*.......*........*.......*........*.......*........*......=
.*
        |                                                                  =
 |
   8000 ++-----------------------------------------------------------------=
-+


                             slabinfo.mm_struct.num_objs

  11000 ++-----------------------------------------------------------------=
-+
        |                O                                                 =
 |
        O        O                                                         =
 |
  10500 ++                        O                                        =
 |
        |                                                                  =
 |
        |                                 O                                =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   9500 ++                                         O       O               =
 |
        |                                                           O      =
 O
        |                                                                  =
 |
   9000 ++                                                                 =
 |
        |                                                                  =
 |
        *........*.......             ....*........*.......*........*......=
.|
   8500 ++---------------*--------*----------------------------------------=
-*


                          slabinfo.kmalloc-128.active_objs

  100000 ++----------------------------------------------------------------=
-+
         O                O                O                               =
 |
   90000 ++      O                O                                        =
 |
         |                                                                 =
 |
   80000 ++                                                O        O      =
 O
         |                                         O                       =
 |
   70000 ++                                                                =
 |
         |                                                                 =
 |
   60000 ++                                                                =
 |
         |                                                                 =
 |
   50000 ++                                                                =
 |
         |                                                              ...=
.*
   40000 *+......     ....*.......     ....*.......    ....*........*...   =
 |
         |       *....            *....            *...                    =
 |
   30000 ++----------------------------------------------------------------=
-+


                            slabinfo.kmalloc-128.num_objs

  100000 ++----------------------------------------------------------------=
-+
         O       O        O                O                               =
 |
   90000 ++                       O                                        =
 |
         |                                                                 =
 |
   80000 ++                                                O        O      =
 O
         |                                         O                       =
 |
   70000 ++                                                                =
 |
         |                                                                 =
 |
   60000 ++                                                                =
 |
         |                                                                 =
 |
   50000 ++                                                                =
 |
         |                                                              ...=
.*
   40000 *+......     ....*.......     ....*.......    ....*........*...   =
 |
         |       *....            *....            *...                    =
 |
   30000 ++----------------------------------------------------------------=
-+


                         slabinfo.kmalloc-128.active_slabs

  1600 ++------------------------------------------------------------------=
-+
  1500 ++               O                 O                                =
 |
       O        O                O                                         =
 |
  1400 ++                                                                  =
 |
  1300 ++                                                  O               =
 |
  1200 ++                                         O                O       =
 O
  1100 ++                                                                  =
 |
       |                                                                   =
 |
  1000 ++                                                                  =
 |
   900 ++                                                                  =
 |
   800 ++                                                                  =
 |
   700 ++                                                                  =
 |
       *........                      ....*.......     ....*.......     ...=
.*
   600 ++       *.......*........*....            *....            *....   =
 |
   500 ++------------------------------------------------------------------=
-+


                          slabinfo.kmalloc-128.num_slabs

  1600 ++------------------------------------------------------------------=
-+
  1500 ++               O                 O                                =
 |
       O        O                O                                         =
 |
  1400 ++                                                                  =
 |
  1300 ++                                                  O               =
 |
  1200 ++                                         O                O       =
 O
  1100 ++                                                                  =
 |
       |                                                                   =
 |
  1000 ++                                                                  =
 |
   900 ++                                                                  =
 |
   800 ++                                                                  =
 |
   700 ++                                                                  =
 |
       *........                      ....*.......     ....*.......     ...=
.*
   600 ++       *.......*........*....            *....            *....   =
 |
   500 ++------------------------------------------------------------------=
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


--===============7078362682708644547==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBhaW03CmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJlLXRlc3QKICB1
cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAKICBudW1hLXZt
c3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1zdGF0OgogICAg
aW50ZXJ2YWw6IDEwCiAgbWVtaW5mbzogCiAgc2xhYmluZm86IAogIGludGVycnVwdHM6IAogIGxv
Y2tfc3RhdDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGlycXM6IAogIGJkaV9kZXZfbWFwcGlu
ZzogCiAgZGlza3N0YXRzOiAKICBuZnNzdGF0OiAKICBjcHVpZGxlOiAKICBjcHVmcmVxLXN0YXRz
OiAKICB0dXJib3N0YXQ6IAogIHBtZXRlcjogCiAgc2NoZWRfZGVidWc6CiAgICBpbnRlcnZhbDog
NjAKZGVmYXVsdC13YXRjaGRvZ3M6CiAgd2F0Y2gtb29tOiAKICB3YXRjaGRvZzogCmNwdWZyZXFf
Z292ZXJub3I6IHBlcmZvcm1hbmNlCm1vZGVsOiBCcmlja2xhbmQgSXZ5IEJyaWRnZS1FWApucl9j
cHU6IDEyMAptZW1vcnk6IDUxMkcKaGRkX3BhcnRpdGlvbnM6IApzd2FwX3BhcnRpdGlvbnM6IApw
bWV0ZXJfc2VydmVyOiBsa3Atc3QwMQpwbWV0ZXJfZGV2aWNlOiB5b2tvZ2F3YS13dDMxMAphaW03
OgogIGxvYWQ6IDIwMDAKICB0ZXN0OiBmb3JrX3Rlc3QKYnJhbmNoOiB5dXlhbmcvZm9yLWxrcApj
b21taXQ6IGU0NzllZmQ1ZGJiMzhkYjhmM2I0MDhhZGM5YTE5NGIyOTQzNmZkYzkKcmVwZWF0X3Rv
OiAyCnRlc3Rib3g6IGJyaWNrbGFuZDMKdGJveF9ncm91cDogYnJpY2tsYW5kMwprY29uZmlnOiB4
ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTUtMDUtMDcgMDk6MzU6NDUuMDI2Nzc2MzE4ICsw
ODowMAp1c2VyOiBsa3AKcXVldWU6IHVuaXQKY29tcGlsZXI6IGdjYy00LjkKaGVhZF9jb21taXQ6
IGU0NzllZmQ1ZGJiMzhkYjhmM2I0MDhhZGM5YTE5NGIyOTQzNmZkYzkKYmFzZV9jb21taXQ6IGI3
ODdmNjhjMzZkNDliYjFkOTIzNmY0MDM4MTM2NDFlZmE3NGEwMzEKa2VybmVsOiAiL3BrZy9saW51
eC94ODZfNjQtcmhlbC9nY2MtNC45L2U0NzllZmQ1ZGJiMzhkYjhmM2I0MDhhZGM5YTE5NGIyOTQz
NmZkYzkvdm1saW51ei00LjEuMC1yYzEtMDAwMDQtZ2U0NzllZmQiCnJvb3RmczogZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1bHQvYWltNy9wZXJmb3JtYW5j
ZS0yMDAwLWZvcmtfdGVzdC9icmlja2xhbmQzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ov
eDg2XzY0LXJoZWwvZ2NjLTQuOS9lNDc5ZWZkNWRiYjM4ZGI4ZjNiNDA4YWRjOWExOTRiMjk0MzZm
ZGM5LzAiCkxLUF9TRVJWRVI6IGlubgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2JyaWNrbGFu
ZDMvdW5pdF9haW03LXBlcmZvcm1hbmNlLTIwMDAtZm9ya190ZXN0LXg4Nl82NC1yaGVsLUhFQUQt
ZTQ3OWVmZDVkYmIzOGRiOGYzYjQwOGFkYzlhMTk0YjI5NDM2ZmRjOS0xLTIwMTUwNTA3LTI4NDEz
LXBwcGpjaC55YW1sIgpkZXF1ZXVlX3RpbWU6IDIwMTUtMDUtMDcgMTE6NDA6NDMuNjI5OTg4Njg0
ICswODowMAppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpv
Yj0vbGtwL3NjaGVkdWxlZC9icmlja2xhbmQzL3VuaXRfYWltNy1wZXJmb3JtYW5jZS0yMDAwLWZv
cmtfdGVzdC14ODZfNjQtcmhlbC1IRUFELWU0NzllZmQ1ZGJiMzhkYjhmM2I0MDhhZGM5YTE5NGIy
OTQzNmZkYzktMS0yMDE1MDUwNy0yODQxMy1wcHBqY2gueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2Nv
bmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD15dXlhbmcvZm9yLWxrcAotIGNvbW1pdD1lNDc5ZWZk
NWRiYjM4ZGI4ZjNiNDA4YWRjOWExOTRiMjk0MzZmZGM5Ci0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4
L3g4Nl82NC1yaGVsL2djYy00LjkvZTQ3OWVmZDVkYmIzOGRiOGYzYjQwOGFkYzlhMTk0YjI5NDM2
ZmRjOS92bWxpbnV6LTQuMS4wLXJjMS0wMDAwNC1nZTQ3OWVmZAotIFJFU1VMVF9ST09UPS9yZXN1
bHQvYWltNy9wZXJmb3JtYW5jZS0yMDAwLWZvcmtfdGVzdC9icmlja2xhbmQzL2RlYmlhbi14ODZf
NjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS9lNDc5ZWZkNWRiYjM4ZGI4ZjNi
NDA4YWRjOWExOTRiMjk0MzZmZGM5LzAKLSBMS1BfU0VSVkVSPWlubgotIHwyLQoKCiAgZWFybHlw
cmludGs9dHR5UzAsMTE1MjAwCiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxl
ZCByY3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1
cF9wYW5pYz0xIG5taV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHBy
b21wdF9yYW1kaXNrPTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5v
cm1hbAoKICBydwptYXhfdXB0aW1lOiAxODUxLjA2MDAwMDAwMDAwMDIKbGtwX2luaXRyZDogIi9s
a3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0
LXJoZWwvZ2NjLTQuOS9lNDc5ZWZkNWRiYjM4ZGI4ZjNiNDA4YWRjOWExOTRiMjk0MzZmZGM5L21v
ZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5j
Z3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwvbGtwL2Jl
bmNobWFya3MvYWltNy14ODZfNjQuY2d6Igpqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDE0
NTEuOTYgMTIyNy44OCA1NjcuODAgMS8xMTE2IDEwMDU5OApzdGFydF90aW1lOiAnMTQzMDk3MDEy
NScKZW5kX3RpbWU6ICcxNDMwOTcwNDYzJwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE1MDUw
Ny0xMTExMjIiCg==

--===============7078362682708644547==
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

--===============7078362682708644547==--

