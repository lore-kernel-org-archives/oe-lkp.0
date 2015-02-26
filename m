Content-Type: multipart/mixed; boundary="===============0027714814367400478=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [futex] 76835b0ebf8: -8.1% will-it-scale.per_thread_ops
Date: Thu, 26 Feb 2015 13:16:53 +0800
Message-ID: <1424927813.10337.19.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0027714814367400478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 76835b0ebf8a7fe85beb03c75121419a7dec52f0 ("futex: Ensure get_futex_k=
ey_refs() always implies a barrier")


testbox/testcase/testparams: lkp-wsx01/will-it-scale/performance-futex4

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

   6314259 =C2=B1  0%      -8.1%    5800079 =C2=B1  0%  will-it-scale.per_t=
hread_ops
   6274871 =C2=B1  0%      -8.1%    5768747 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
      0.64 =C2=B1  0%      +4.6%       0.67 =C2=B1  1%  will-it-scale.scala=
bility
      0.79 =C2=B1  2%    +716.1%       6.48 =C2=B1  1%  perf-profile.cpu-cy=
cles.get_futex_key_refs.isra.11.futex_wait_setup.futex_wait.do_futex.sys_fu=
tex
         2 =C2=B1 44%    +200.0%          6 =C2=B1 21%  sched_debug.cpu#79.=
nr_uninterruptible
      1320 =C2=B1 49%     -64.8%        464 =C2=B1 15%  sched_debug.cpu#61.=
ttwu_count
       167 =C2=B1 21%     -45.9%         90 =C2=B1 49%  sched_debug.cfs_rq[=
61]:/.blocked_load_avg
         7 =C2=B1 18%     +48.6%         10 =C2=B1 28%  sched_debug.cfs_rq[=
25]:/.load
         7 =C2=B1 18%     +60.0%         11 =C2=B1 34%  sched_debug.cpu#25.=
load
       175 =C2=B1 20%     -44.3%         97 =C2=B1 47%  sched_debug.cfs_rq[=
61]:/.tg_load_contrib
      2406 =C2=B1 49%     -58.3%       1003 =C2=B1 25%  sched_debug.cpu#61.=
nr_switches
      2417 =C2=B1 49%     -58.1%       1014 =C2=B1 25%  sched_debug.cpu#61.=
sched_count
       613 =C2=B1 19%     -34.6%        401 =C2=B1 25%  sched_debug.cpu#61.=
sched_goidle
      4.56 =C2=B1  1%     +37.4%       6.26 =C2=B1  2%  perf-profile.cpu-cy=
cles.get_futex_key.futex_wait_setup.futex_wait.do_futex.sys_futex
     85583 =C2=B1  9%     -14.8%      72913 =C2=B1  7%  sched_debug.cpu#0.n=
r_load_updates
     29.29 =C2=B1  0%     +19.2%      34.90 =C2=B1  2%  perf-profile.cpu-cy=
cles.futex_wait_setup.futex_wait.do_futex.sys_futex.system_call_fastpath
      1.05 =C2=B1  3%     -10.6%       0.94 =C2=B1  1%  perf-profile.cpu-cy=
cles.testcase
      2.43 =C2=B1  2%     -10.4%       2.18 =C2=B1  0%  perf-profile.cpu-cy=
cles.sysret_check.syscall
     84405 =C2=B1  7%     -11.0%      75139 =C2=B1  7%  sched_debug.cfs_rq[=
0]:/.exec_clock
      1.07 =C2=B1  2%     -14.7%       0.91 =C2=B1  2%  perf-profile.cpu-cy=
cles._raw_spin_unlock.futex_wait_setup.futex_wait.do_futex.sys_futex
      5.91 =C2=B1  0%     -10.2%       5.31 =C2=B1  2%  perf-profile.cpu-cy=
cles._raw_spin_lock.futex_wait_setup.futex_wait.do_futex.sys_futex
     66640 =C2=B1  5%      +5.7%      70433 =C2=B1  6%  sched_debug.cpu#10.=
nr_load_updates
      4274 =C2=B1  3%     -12.0%       3762 =C2=B1  7%  sched_debug.cpu#21.=
curr->pid

testbox/testcase/testparams: wsm/will-it-scale/performance-futex3

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

  11676004 =C2=B1  0%     -10.3%   10473333 =C2=B1  0%  will-it-scale.per_t=
hread_ops
  11515138 =C2=B1  0%      -8.8%   10501984 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
      0.69 =C2=B1  3%      +8.2%       0.75 =C2=B1  1%  will-it-scale.scala=
bility
      1.76 =C2=B1  4%    +364.0%       8.18 =C2=B1  0%  perf-profile.cpu-cy=
cles.get_futex_key_refs.isra.11.futex_wake.do_futex.sys_futex.system_call_f=
astpath
  76838319 =C2=B1 12%     +24.4%   95586476 =C2=B1  5%  cpuidle.POLL.time
    163113 =C2=B1 44%     +89.7%     309491 =C2=B1 14%  sched_debug.cfs_rq[=
6]:/.spread0
     16.31 =C2=B1  1%     +40.2%      22.86 =C2=B1  0%  perf-profile.cpu-cy=
cles.futex_wake.do_futex.sys_futex.system_call_fastpath.syscall
        89 =C2=B1 17%     -26.8%         65 =C2=B1 24%  sched_debug.cfs_rq[=
2]:/.load
        88 =C2=B1 19%     -24.1%         66 =C2=B1 23%  sched_debug.cpu#2.l=
oad
       100 =C2=B1 11%     +20.3%        121 =C2=B1 13%  sched_debug.cpu#6.l=
oad
        87 =C2=B1 10%     -24.6%         66 =C2=B1 10%  sched_debug.cfs_rq[=
1]:/.load
       787 =C2=B1 13%     -22.1%        613 =C2=B1  9%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
      7.05 =C2=B1  0%     +12.0%       7.89 =C2=B1  1%  perf-profile.cpu-cy=
cles.get_futex_key.futex_wake.do_futex.sys_futex.system_call_fastpath
      2132 =C2=B1 11%     +21.8%       2597 =C2=B1 12%  cpuidle.C1-NHM.usage
        77 =C2=B1  9%     -15.4%         65 =C2=B1 10%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
       100 =C2=B1 13%     +17.4%        118 =C2=B1 10%  sched_debug.cpu#6.c=
pu_load[1]
       101 =C2=B1 14%     +17.8%        119 =C2=B1 10%  sched_debug.cpu#6.c=
pu_load[2]
        85 =C2=B1 10%     -19.7%         68 =C2=B1  8%  sched_debug.cpu#1.l=
oad
     38.14 =C2=B1  0%     +13.0%      43.08 =C2=B1  0%  perf-profile.cpu-cy=
cles.do_futex.sys_futex.system_call_fastpath.syscall
    272.17 =C2=B1  0%      -9.3%     246.76 =C2=B1  0%  time.user_time
      3.24 =C2=B1  4%     -12.3%       2.84 =C2=B1  2%  perf-profile.cpu-cy=
cles.testcase
     43.30 =C2=B1  0%     +10.3%      47.76 =C2=B1  0%  perf-profile.cpu-cy=
cles.sys_futex.system_call_fastpath.syscall
      3152 =C2=B1  6%     -12.5%       2758 =C2=B1  8%  sched_debug.cpu#2.c=
urr->pid
        74 =C2=B1  4%     -13.5%         64 =C2=B1  7%  sched_debug.cpu#1.c=
pu_load[0]
     11.00 =C2=B1  2%     -10.8%       9.81 =C2=B1  1%  perf-profile.cpu-cy=
cles.system_call_after_swapgs.syscall
     10.10 =C2=B1  1%     -14.3%       8.66 =C2=B1  1%  perf-profile.cpu-cy=
cles.system_call.syscall
    729331 =C2=B1  4%     +11.8%     815471 =C2=B1  4%  sched_debug.cfs_rq[=
6]:/.min_vruntime
    110881 =C2=B1 10%     +13.5%     125833 =C2=B1  3%  sched_debug.cfs_rq[=
6]:/.exec_clock
      3.26 =C2=B1  0%     -12.7%       2.85 =C2=B1  1%  perf-profile.cpu-cy=
cles.sysret_check.syscall
    112231 =C2=B1 10%     +13.1%     126884 =C2=B1  3%  sched_debug.cpu#6.n=
r_load_updates
        69 =C2=B1  3%     -12.3%         60 =C2=B1  8%  sched_debug.cpu#2.c=
pu_load[0]
       693 =C2=B1  6%     -10.9%        617 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
     31740 =C2=B1  6%     -10.5%      28410 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
    566208 =C2=B1  7%     -10.6%     505972 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.min_vruntime

testbox/testcase/testparams: lkp-snb01/will-it-scale/performance-futex3

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

  11940878 =C2=B1  0%     -17.1%    9902263 =C2=B1  0%  will-it-scale.per_t=
hread_ops
  11923215 =C2=B1  0%     -17.3%    9861898 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
      0.61 =C2=B1  0%     +12.0%       0.68 =C2=B1  0%  will-it-scale.scala=
bility
      0.85 =C2=B1  1%   +1283.8%      11.73 =C2=B1  0%  perf-profile.cpu-cy=
cles.get_futex_key_refs.isra.11.futex_wake.do_futex.sys_futex.system_call_f=
astpath
       235 =C2=B1 47%    +154.9%        600 =C2=B1 26%  sched_debug.cfs_rq[=
25]:/.blocked_load_avg
       162 =C2=B1 19%     -40.2%         97 =C2=B1 40%  sched_debug.cfs_rq[=
22]:/.blocked_load_avg
       272 =C2=B1 35%    +130.6%        627 =C2=B1 26%  sched_debug.cfs_rq[=
25]:/.tg_load_contrib
       900 =C2=B1 31%     -62.6%        337 =C2=B1 46%  sched_debug.cpu#29.=
ttwu_local
       192 =C2=B1 16%     -33.8%        127 =C2=B1 31%  sched_debug.cfs_rq[=
22]:/.tg_load_contrib
       354 =C2=B1 15%    +179.4%        991 =C2=B1 40%  sched_debug.cpu#22.=
ttwu_count
       181 =C2=B1 43%     -49.9%         90 =C2=B1  8%  sched_debug.cpu#19.=
ttwu_local
      1491 =C2=B1 37%     -35.8%        958 =C2=B1 24%  sched_debug.cpu#26.=
sched_goidle
       524 =C2=B1 45%     -48.3%        271 =C2=B1 18%  sched_debug.cfs_rq[=
26]:/.tg_load_contrib
    312620 =C2=B1 45%     +88.4%     588988 =C2=B1 18%  sched_debug.cfs_rq[=
16]:/.spread0
       490 =C2=B1 49%     -50.2%        244 =C2=B1 14%  sched_debug.cfs_rq[=
26]:/.blocked_load_avg
      3749 =C2=B1 27%     -39.5%       2268 =C2=B1 27%  sched_debug.cpu#29.=
nr_switches
     14.06 =C2=B1  0%     +99.3%      28.02 =C2=B1  0%  perf-profile.cpu-cy=
cles.futex_wake.do_futex.sys_futex.system_call_fastpath.syscall
      4096 =C2=B1 24%     -38.9%       2502 =C2=B1 18%  sched_debug.cpu#3.n=
r_switches
      1517 =C2=B1 19%     -26.3%       1118 =C2=B1 18%  sched_debug.cpu#3.s=
ched_goidle
      3955 =C2=B1 18%     -18.5%       3225 =C2=B1  8%  sched_debug.cpu#28.=
curr->pid
      6.22 =C2=B1  1%     +53.6%       9.55 =C2=B1  0%  perf-profile.cpu-cy=
cles.get_futex_key.futex_wake.do_futex.sys_futex.system_call_fastpath
        51 =C2=B1 11%     -20.0%         41 =C2=B1  3%  sched_debug.cpu#0.l=
oad
        51 =C2=B1 11%     -20.0%         41 =C2=B1  3%  sched_debug.cfs_rq[=
0]:/.load
      3865 =C2=B1 12%     +29.7%       5013 =C2=B1 19%  sched_debug.cpu#15.=
sched_goidle
     82552 =C2=B1  6%     -17.5%      68090 =C2=B1  3%  sched_debug.cpu#0.n=
r_load_updates
      1.24 =C2=B1  3%     -19.5%       1.00 =C2=B1  2%  perf-profile.cpu-cy=
cles.drop_futex_key_refs.isra.12.do_futex.sys_futex.system_call_fastpath.sy=
scall
     36.98 =C2=B1  1%     +32.7%      49.09 =C2=B1  0%  perf-profile.cpu-cy=
cles.do_futex.sys_futex.system_call_fastpath.syscall
     43.52 =C2=B1  1%     +25.0%      54.42 =C2=B1  0%  perf-profile.cpu-cy=
cles.system_call_fastpath.syscall
        54 =C2=B1  8%     +16.6%         63 =C2=B1  8%  sched_debug.cpu#16.=
cpu_load[1]
        54 =C2=B1  6%     +19.8%         65 =C2=B1 10%  sched_debug.cpu#16.=
cpu_load[2]
    666.39 =C2=B1  0%     -14.9%     566.95 =C2=B1  0%  time.user_time
        54 =C2=B1  5%     +23.6%         66 =C2=B1 14%  sched_debug.cpu#16.=
cpu_load[4]
      4.59 =C2=B1  1%     -20.6%       3.65 =C2=B1  1%  perf-profile.cpu-cy=
cles.testcase
      4478 =C2=B1  5%     -12.4%       3921 =C2=B1  6%  sched_debug.cpu#0.c=
urr->pid
     41.87 =C2=B1  1%     +26.7%      53.06 =C2=B1  0%  perf-profile.cpu-cy=
cles.sys_futex.system_call_fastpath.syscall
     11.37 =C2=B1  1%     -19.8%       9.12 =C2=B1  0%  perf-profile.cpu-cy=
cles.system_call_after_swapgs.syscall
     13.93 =C2=B1  2%     -18.7%      11.32 =C2=B1  1%  perf-profile.cpu-cy=
cles.system_call.syscall
      2.46 =C2=B1  4%     -17.3%       2.04 =C2=B1  3%  perf-profile.cpu-cy=
cles.sysret_check.syscall
     83964 =C2=B1  6%     -18.1%      68727 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.exec_clock
        54 =C2=B1  6%     +22.7%         66 =C2=B1 13%  sched_debug.cpu#16.=
cpu_load[3]
    102941 =C2=B1  4%     +15.5%     118874 =C2=B1  2%  sched_debug.cfs_rq[=
16]:/.exec_clock
       645 =C2=B1  5%     -13.2%        560 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
     29634 =C2=B1  5%     -13.2%      25712 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
   1087374 =C2=B1  6%     -13.1%     944559 =C2=B1  6%  sched_debug.cfs_rq[=
0]:/.min_vruntime
      2464 =C2=B1  6%      -9.0%       2243 =C2=B1  2%  numa-meminfo.node1.=
KernelStack
    110191 =C2=B1  4%     +12.1%     123516 =C2=B1  2%  sched_debug.cpu#16.=
nr_load_updates
     34745 =C2=B1  4%     +11.5%      38751 =C2=B1  3%  sched_debug.cfs_rq[=
16]:/.avg->runnable_avg_sum
       757 =C2=B1  4%     +11.5%        844 =C2=B1  3%  sched_debug.cfs_rq[=
16]:/.tg_runnable_contrib

testbox/testcase/testparams: lkp-sbx04/will-it-scale/performance-futex3

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

  11423732 =C2=B1  0%     -17.8%    9387203 =C2=B1  0%  will-it-scale.per_t=
hread_ops
  11419511 =C2=B1  0%     -18.0%    9368303 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
      0.60 =C2=B1  0%     +11.9%       0.68 =C2=B1  0%  will-it-scale.scala=
bility
      0.84 =C2=B1  3%   +1303.0%      11.82 =C2=B1  0%  perf-profile.cpu-cy=
cles.get_futex_key_refs.isra.11.futex_wake.do_futex.sys_futex.system_call_f=
astpath
        68 =C2=B1 41%    +125.1%        154 =C2=B1 37%  sched_debug.cfs_rq[=
31]:/.blocked_load_avg
        76 =C2=B1 38%    +111.5%        161 =C2=B1 35%  sched_debug.cfs_rq[=
31]:/.tg_load_contrib
      1603 =C2=B1 47%     -53.1%        751 =C2=B1 35%  sched_debug.cpu#6.t=
twu_count
       937 =C2=B1 13%     +84.1%       1726 =C2=B1 41%  sched_debug.cpu#30.=
ttwu_local
      3733 =C2=B1 12%     +37.0%       5117 =C2=B1 23%  sched_debug.cpu#14.=
sched_count
       131 =C2=B1 17%    +146.6%        324 =C2=B1 22%  sched_debug.cpu#47.=
ttwu_local
        96 =C2=B1 12%    +106.2%        199 =C2=B1 35%  sched_debug.cpu#33.=
ttwu_local
       199 =C2=B1 32%     -50.1%         99 =C2=B1 16%  sched_debug.cfs_rq[=
53]:/.blocked_load_avg
       210 =C2=B1 31%     -48.2%        109 =C2=B1 12%  sched_debug.cfs_rq[=
53]:/.tg_load_contrib
      2354 =C2=B1 19%     -41.9%       1368 =C2=B1 33%  sched_debug.cpu#48.=
nr_switches
        47 =C2=B1 44%    +131.9%        110 =C2=B1 43%  sched_debug.cfs_rq[=
33]:/.blocked_load_avg
        11 =C2=B1 36%     -45.7%          6 =C2=B1  6%  sched_debug.cpu#31.=
load
      2824 =C2=B1 19%     -37.3%       1771 =C2=B1 29%  sched_debug.cpu#63.=
nr_switches
         7 =C2=B1  5%     +61.3%         12 =C2=B1 20%  sched_debug.cpu#62.=
cpu_load[0]
      2846 =C2=B1 18%     -37.4%       1783 =C2=B1 29%  sched_debug.cpu#63.=
sched_count
       183 =C2=B1 21%     -52.3%         87 =C2=B1 33%  sched_debug.cfs_rq[=
46]:/.blocked_load_avg
        70 =C2=B1 30%     +89.3%        132 =C2=B1 36%  sched_debug.cfs_rq[=
33]:/.tg_load_contrib
      1064 =C2=B1 10%     -35.2%        689 =C2=B1 25%  sched_debug.cpu#63.=
sched_goidle
      5806 =C2=B1 11%     +23.7%       7184 =C2=B1 18%  sched_debug.cpu#28.=
nr_switches
     14.28 =C2=B1  0%     +97.8%      28.25 =C2=B1  0%  perf-profile.cpu-cy=
cles.futex_wake.do_futex.sys_futex.system_call_fastpath.syscall
       198 =C2=B1 20%     -48.4%        102 =C2=B1 28%  sched_debug.cfs_rq[=
46]:/.tg_load_contrib
       501 =C2=B1  5%     -49.9%        251 =C2=B1 47%  sched_debug.cpu#40.=
ttwu_local
         6 =C2=B1  6%     +40.0%          8 =C2=B1 14%  sched_debug.cpu#25.=
cpu_load[1]
       803 =C2=B1 26%     -33.1%        538 =C2=B1 12%  sched_debug.cpu#53.=
ttwu_count
        11 =C2=B1 28%     +48.9%         17 =C2=B1 15%  sched_debug.cpu#51.=
cpu_load[0]
        83 =C2=B1 17%     +42.7%        119 =C2=B1 26%  sched_debug.cpu#39.=
ttwu_local
         6 =C2=B1  6%     +32.0%          8 =C2=B1 15%  sched_debug.cpu#25.=
cpu_load[2]
        22 =C2=B1 23%     -30.0%         15 =C2=B1 12%  sched_debug.cpu#45.=
cpu_load[1]
      2528 =C2=B1  7%     -19.1%       2045 =C2=B1 17%  sched_debug.cpu#18.=
sched_goidle
      1219 =C2=B1 22%     +39.0%       1695 =C2=B1 19%  sched_debug.cpu#47.=
sched_count
      1208 =C2=B1 22%     +27.3%       1538 =C2=B1  5%  sched_debug.cpu#47.=
nr_switches
       944 =C2=B1 13%     -32.7%        635 =C2=B1 15%  sched_debug.cpu#40.=
ttwu_count
        19 =C2=B1 12%     -23.4%         14 =C2=B1  5%  sched_debug.cpu#45.=
cpu_load[2]
      2946 =C2=B1 10%     +18.9%       3502 =C2=B1 12%  sched_debug.cpu#61.=
curr->pid
       561 =C2=B1 10%     +35.3%        759 =C2=B1  5%  sched_debug.cpu#47.=
ttwu_count
      6.28 =C2=B1  0%     +54.7%       9.71 =C2=B1  1%  perf-profile.cpu-cy=
cles.get_futex_key.futex_wake.do_futex.sys_futex.system_call_fastpath
         6 =C2=B1  0%     +29.2%          7 =C2=B1 10%  sched_debug.cpu#25.=
cpu_load[3]
       531 =C2=B1 12%     +31.8%        700 =C2=B1  5%  sched_debug.cpu#44.=
ttwu_count
      1.27 =C2=B1  1%     -22.1%       0.99 =C2=B1  1%  perf-profile.cpu-cy=
cles.drop_futex_key_refs.isra.12.do_futex.sys_futex.system_call_fastpath.sy=
scall
     37.44 =C2=B1  0%     +32.2%      49.50 =C2=B1  0%  perf-profile.cpu-cy=
cles.do_futex.sys_futex.system_call_fastpath.syscall
      1004 =C2=B1  5%     +24.3%       1247 =C2=B1  6%  numa-meminfo.node3.=
PageTables
       253 =C2=B1  6%     +23.2%        312 =C2=B1  6%  numa-vmstat.node3.n=
r_page_table_pages
     44.13 =C2=B1  0%     +24.3%      54.84 =C2=B1  0%  perf-profile.cpu-cy=
cles.system_call_fastpath.syscall
      1967 =C2=B1  7%     -12.4%       1722 =C2=B1  5%  numa-meminfo.node2.=
KernelStack
      3710 =C2=B1  4%     -14.0%       3191 =C2=B1  1%  sched_debug.cpu#31.=
curr->pid
   1141.59 =C2=B1  0%     -16.2%     956.67 =C2=B1  0%  time.user_time
      4.56 =C2=B1  0%     -18.7%       3.71 =C2=B1  2%  perf-profile.cpu-cy=
cles.testcase
     42.42 =C2=B1  0%     +26.2%      53.51 =C2=B1  0%  perf-profile.cpu-cy=
cles.sys_futex.system_call_fastpath.syscall
    436335 =C2=B1  2%      -9.8%     393521 =C2=B1  1%  softirqs.RCU
      3339 =C2=B1  2%     +12.7%       3764 =C2=B1  9%  sched_debug.cpu#54.=
curr->pid
    973122 =C2=B1  0%      +9.1%    1062051 =C2=B1  8%  sched_debug.cfs_rq[=
53]:/.min_vruntime
     11.40 =C2=B1  0%     -19.5%       9.18 =C2=B1  0%  perf-profile.cpu-cy=
cles.system_call_after_swapgs.syscall
     14.13 =C2=B1  0%     -19.8%      11.34 =C2=B1  0%  perf-profile.cpu-cy=
cles.system_call.syscall
      2.46 =C2=B1  0%     -19.6%       1.98 =C2=B1  2%  perf-profile.cpu-cy=
cles.sysret_check.syscall
      1820 =C2=B1 13%     -29.1%       1290 =C2=B1 22%  sched_debug.cpu#40.=
nr_switches
         8 =C2=B1  0%     +12.5%          9 =C2=B1  0%  sched_debug.cpu#16.=
cpu_load[3]
      1630 =C2=B1 14%     +38.0%       2250 =C2=B1 12%  sched_debug.cpu#13.=
sched_goidle
     12601 =C2=B1  7%     -11.4%      11165 =C2=B1  3%  numa-meminfo.node0.=
SReclaimable
      3149 =C2=B1  7%     -11.4%       2791 =C2=B1  3%  numa-vmstat.node0.n=
r_slab_reclaimable
      9845 =C2=B1  9%     +15.7%      11388 =C2=B1  7%  numa-meminfo.node1.=
SReclaimable
      2460 =C2=B1  9%     +15.7%       2846 =C2=B1  7%  numa-vmstat.node1.n=
r_slab_reclaimable
      1410 =C2=B1  5%      +9.6%       1545 =C2=B1  4%  slabinfo.mm_struct.=
active_objs
      3055 =C2=B1 12%     +14.1%       3484 =C2=B1  8%  sched_debug.cpu#26.=
curr->pid
      1410 =C2=B1  5%      +9.6%       1545 =C2=B1  4%  slabinfo.mm_struct.=
num_objs
      5757 =C2=B1  7%     +13.3%       6521 =C2=B1  6%  numa-vmstat.node3.n=
r_slab_unreclaimable
     23031 =C2=B1  7%     +13.3%      26086 =C2=B1  6%  numa-meminfo.node3.=
SUnreclaim

testbox/testcase/testparams: lkp-snb01/will-it-scale/performance-futex4

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

   7502355 =C2=B1  0%     -11.5%    6637575 =C2=B1  1%  will-it-scale.per_t=
hread_ops
   7513211 =C2=B1  0%     -10.9%    6692022 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
      0.65 =C2=B1  0%      +3.9%       0.68 =C2=B1  0%  will-it-scale.scala=
bility
      0.53 =C2=B1  3%   +1423.7%       8.04 =C2=B1  1%  perf-profile.cpu-cy=
cles.get_futex_key_refs.isra.11.futex_wait_setup.futex_wait.do_futex.sys_fu=
tex
      1699 =C2=B1 37%     -68.6%        533 =C2=B1 35%  sched_debug.cpu#25.=
ttwu_local
       513 =C2=B1 39%     -50.7%        253 =C2=B1 38%  sched_debug.cfs_rq[=
27]:/.tg_load_contrib
      2846 =C2=B1 28%     -36.7%       1801 =C2=B1  5%  sched_debug.cpu#25.=
ttwu_count
        33 =C2=B1 45%     -54.9%         15 =C2=B1 18%  sched_debug.cpu#10.=
load
       450 =C2=B1 26%    +165.3%       1195 =C2=B1 45%  sched_debug.cpu#23.=
sched_goidle
        18 =C2=B1  8%     +81.1%         33 =C2=B1 38%  sched_debug.cpu#29.=
cpu_load[2]
      5401 =C2=B1 26%     -49.1%       2748 =C2=B1  8%  sched_debug.cpu#25.=
nr_switches
        17 =C2=B1 14%     +71.4%         30 =C2=B1 40%  sched_debug.cfs_rq[=
14]:/.load
        37 =C2=B1 23%     -50.7%         18 =C2=B1 17%  sched_debug.cpu#26.=
cpu_load[0]
       493 =C2=B1 41%     -52.4%        234 =C2=B1 42%  sched_debug.cfs_rq[=
27]:/.blocked_load_avg
        17 =C2=B1  4%     +51.4%         26 =C2=B1 27%  sched_debug.cpu#29.=
cpu_load[3]
      2116 =C2=B1 32%     +87.3%       3963 =C2=B1 44%  sched_debug.cpu#28.=
nr_switches
       752 =C2=B1 11%     +78.1%       1340 =C2=B1 32%  sched_debug.cpu#28.=
sched_goidle
     11262 =C2=B1 14%     -25.6%       8382 =C2=B1 20%  sched_debug.cpu#10.=
nr_switches
      3179 =C2=B1  4%     +35.0%       4292 =C2=B1 19%  sched_debug.cpu#29.=
curr->pid
      4945 =C2=B1 14%     -25.4%       3687 =C2=B1 21%  sched_debug.cpu#10.=
sched_goidle
      4.60 =C2=B1  1%     +56.9%       7.21 =C2=B1  0%  perf-profile.cpu-cy=
cles.get_futex_key.futex_wait_setup.futex_wait.do_futex.sys_futex
        16 =C2=B1  2%     +33.8%         21 =C2=B1 19%  sched_debug.cpu#29.=
cpu_load[4]
        22 =C2=B1 27%     -36.4%         14 =C2=B1 14%  sched_debug.cpu#10.=
cpu_load[0]
      1676 =C2=B1  5%     -18.0%       1374 =C2=B1 15%  numa-meminfo.node0.=
PageTables
       418 =C2=B1  5%     -17.8%        343 =C2=B1 15%  numa-vmstat.node0.n=
r_page_table_pages
        16 =C2=B1  2%     +24.6%         20 =C2=B1  9%  sched_debug.cpu#13.=
load
        16 =C2=B1  0%     +25.0%         20 =C2=B1  9%  sched_debug.cfs_rq[=
13]:/.load
        16 =C2=B1  0%     +26.6%         20 =C2=B1  9%  sched_debug.cpu#13.=
cpu_load[0]
      3345 =C2=B1 14%     +27.5%       4266 =C2=B1  8%  sched_debug.cpu#13.=
ttwu_count
     10925 =C2=B1  4%     -15.6%       9218 =C2=B1  3%  slabinfo.kmalloc-25=
6.active_objs
     31.80 =C2=B1  1%     +24.9%      39.74 =C2=B1  0%  perf-profile.cpu-cy=
cles.futex_wait_setup.futex_wait.do_futex.sys_futex.system_call_fastpath
     11691 =C2=B1  4%     -14.7%       9976 =C2=B1  3%  slabinfo.kmalloc-25=
6.num_objs
    465.75 =C2=B1  0%     -11.2%     413.51 =C2=B1  0%  time.user_time
        16 =C2=B1  0%     +15.6%         18 =C2=B1  6%  sched_debug.cpu#13.=
cpu_load[1]
      7.28 =C2=B1  1%     -11.7%       6.43 =C2=B1  2%  perf-profile.cpu-cy=
cles.system_call_after_swapgs.syscall
      8.14 =C2=B1  0%     -11.1%       7.23 =C2=B1  1%  perf-profile.cpu-cy=
cles.system_call.syscall
      1.77 =C2=B1  3%     -10.1%       1.59 =C2=B1  2%  perf-profile.cpu-cy=
cles.sysret_check.syscall
      1.97 =C2=B1  2%      -8.5%       1.80 =C2=B1  2%  perf-profile.cpu-cy=
cles._raw_spin_unlock.futex_wait_setup.futex_wait.do_futex.sys_futex
      3865 =C2=B1 13%     +15.8%       4474 =C2=B1  3%  numa-vmstat.node1.n=
r_anon_pages
     15441 =C2=B1 13%     +15.9%      17889 =C2=B1  3%  numa-meminfo.node1.=
AnonPages
      6.95 =C2=B1  2%     -11.4%       6.16 =C2=B1  0%  perf-profile.cpu-cy=
cles._raw_spin_lock.futex_wait_setup.futex_wait.do_futex.sys_futex
     17320 =C2=B1 12%     -14.0%      14897 =C2=B1  3%  numa-meminfo.node0.=
Active(anon)
      4329 =C2=B1 12%     -14.0%       3723 =C2=B1  3%  numa-vmstat.node0.n=
r_active_anon
        16 =C2=B1  0%     +12.5%         18 =C2=B1  6%  sched_debug.cpu#12.=
cpu_load[4]
     12.79 =C2=B1  1%      -9.9%      11.52 =C2=B1  0%  perf-profile.cpu-cy=
cles.hash_futex.futex_wait.do_futex.sys_futex.system_call_fastpath
     16945 =C2=B1 12%     -14.2%      14539 =C2=B1  3%  numa-meminfo.node0.=
AnonPages
      4235 =C2=B1 12%     -14.2%       3634 =C2=B1  3%  numa-vmstat.node0.n=
r_anon_pages

testbox/testcase/testparams: nhm4/will-it-scale/performance-futex4

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

   7653177 =C2=B1  0%      -6.5%    7158623 =C2=B1  0%  will-it-scale.per_t=
hread_ops
   7616372 =C2=B1  0%      -6.5%    7119979 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
      0.70 =C2=B1  0%      +2.4%       0.71 =C2=B1  0%  will-it-scale.scala=
bility
      1.31 =C2=B1  0%    +385.8%       6.37 =C2=B1  2%  perf-profile.cpu-cy=
cles.get_futex_key_refs.isra.11.futex_wait_setup.futex_wait.do_futex.sys_fu=
tex
       847 =C2=B1 22%     -39.7%        510 =C2=B1 21%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
       979 =C2=B1 18%     -34.4%        642 =C2=B1 16%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
       139 =C2=B1 18%     -25.7%        103 =C2=B1 17%  sched_debug.cpu#6.l=
oad
      5.35 =C2=B1  2%     +25.7%       6.73 =C2=B1  2%  perf-profile.cpu-cy=
cles.get_futex_key.futex_wait_setup.futex_wait.do_futex.sys_futex
       163 =C2=B1 11%     -17.2%        135 =C2=B1 11%  sched_debug.cpu#4.c=
pu_load[0]
     30.79 =C2=B1  1%     +15.4%      35.54 =C2=B1  1%  perf-profile.cpu-cy=
cles.futex_wait_setup.futex_wait.do_futex.sys_futex.system_call_fastpath
    146.40 =C2=B1  2%     -36.7%      92.65 =C2=B1  2%  time.user_time
      2734 =C2=B1  5%     +10.7%       3027 =C2=B1  7%  sched_debug.cpu#0.c=
urr->pid
      7.93 =C2=B1  2%      -8.3%       7.27 =C2=B1  3%  perf-profile.cpu-cy=
cles.system_call_after_swapgs.syscall
      7.20 =C2=B1  2%     -10.7%       6.44 =C2=B1  1%  perf-profile.cpu-cy=
cles.system_call.syscall
      2.28 =C2=B1  3%      -8.6%       2.08 =C2=B1  3%  perf-profile.cpu-cy=
cles.sysret_check.syscall
     12.98 =C2=B1  1%     -10.2%      11.65 =C2=B1  2%  perf-profile.cpu-cy=
cles.hash_futex.futex_wait.do_futex.sys_futex.system_call_fastpath

testbox/testcase/testparams: lkp-sbx04/will-it-scale/performance-futex4

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

   7139956 =C2=B1  0%     -11.0%    6357641 =C2=B1  0%  will-it-scale.per_t=
hread_ops
   7161715 =C2=B1  0%     -11.3%    6351262 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
      0.64 =C2=B1  0%      +4.5%       0.67 =C2=B1  0%  will-it-scale.scala=
bility
       379 =C2=B1 48%     -72.3%        105 =C2=B1 35%  sched_debug.cpu#37.=
ttwu_local
      0.53 =C2=B1  3%   +1395.3%       7.92 =C2=B1  1%  perf-profile.cpu-cy=
cles.get_futex_key_refs.isra.11.futex_wait_setup.futex_wait.do_futex.sys_fu=
tex
       860 =C2=B1 22%     +44.8%       1245 =C2=B1 16%  sched_debug.cpu#17.=
ttwu_local
      1025 =C2=B1 43%     +95.4%       2003 =C2=B1 42%  sched_debug.cpu#32.=
sched_count
      1010 =C2=B1 43%     +96.8%       1989 =C2=B1 43%  sched_debug.cpu#32.=
nr_switches
       361 =C2=B1 28%     -46.7%        192 =C2=B1 19%  sched_debug.cfs_rq[=
60]:/.blocked_load_avg
       368 =C2=B1 27%     -45.8%        199 =C2=B1 20%  sched_debug.cfs_rq[=
60]:/.tg_load_contrib
       525 =C2=B1 20%     +63.2%        857 =C2=B1 30%  sched_debug.cpu#48.=
sched_goidle
      1292 =C2=B1 18%    +109.9%       2713 =C2=B1 37%  sched_debug.cpu#48.=
nr_switches
       375 =C2=B1 30%     +60.9%        603 =C2=B1 30%  sched_debug.cpu#32.=
sched_goidle
      1903 =C2=B1 17%     +35.2%       2572 =C2=B1 21%  sched_debug.cpu#23.=
ttwu_count
       888 =C2=B1 33%     +53.7%       1365 =C2=B1 21%  sched_debug.cpu#34.=
sched_count
       777 =C2=B1 21%     +52.7%       1186 =C2=B1  7%  sched_debug.cpu#21.=
ttwu_local
       504 =C2=B1 21%     +44.3%        727 =C2=B1 11%  sched_debug.cpu#55.=
sched_goidle
      1410 =C2=B1 16%     -46.8%        749 =C2=B1 11%  sched_debug.cpu#60.=
ttwu_count
       622 =C2=B1 21%     -44.8%        343 =C2=B1 17%  sched_debug.cpu#47.=
sched_goidle
       148 =C2=B1 36%     +58.8%        235 =C2=B1 22%  sched_debug.cfs_rq[=
49]:/.blocked_load_avg
       878 =C2=B1 33%     +54.0%       1352 =C2=B1 21%  sched_debug.cpu#34.=
nr_switches
       645 =C2=B1  8%     +98.8%       1283 =C2=B1 42%  sched_debug.cpu#48.=
ttwu_count
       157 =C2=B1 34%     +56.0%        245 =C2=B1 21%  sched_debug.cfs_rq[=
49]:/.tg_load_contrib
        91 =C2=B1 34%     +89.1%        173 =C2=B1 37%  sched_debug.cfs_rq[=
41]:/.blocked_load_avg
      1211 =C2=B1 20%     +53.1%       1855 =C2=B1 12%  sched_debug.cpu#55.=
nr_switches
       109 =C2=B1 26%     +74.7%        191 =C2=B1 34%  sched_debug.cfs_rq[=
41]:/.tg_load_contrib
      2418 =C2=B1 25%     +62.7%       3934 =C2=B1 17%  numa-vmstat.node3.n=
r_active_anon
      9680 =C2=B1 25%     +62.6%      15742 =C2=B1 17%  numa-meminfo.node3.=
Active(anon)
       744 =C2=B1 32%     -36.1%        475 =C2=B1 19%  sched_debug.cpu#45.=
ttwu_count
       546 =C2=B1 19%     +34.6%        735 =C2=B1 14%  sched_debug.cpu#61.=
sched_goidle
        11 =C2=B1 14%     -25.0%          8 =C2=B1 13%  sched_debug.cpu#54.=
load
      1912 =C2=B1  7%     +48.1%       2831 =C2=B1 10%  sched_debug.cpu#17.=
ttwu_count
      4.64 =C2=B1  0%     +56.4%       7.26 =C2=B1  1%  perf-profile.cpu-cy=
cles.get_futex_key.futex_wait_setup.futex_wait.do_futex.sys_futex
        14 =C2=B1  8%     +28.8%         19 =C2=B1  8%  sched_debug.cpu#46.=
cpu_load[0]
      4908 =C2=B1  6%     +34.3%       6593 =C2=B1  8%  sched_debug.cpu#17.=
nr_switches
      2287 =C2=B1  3%     +29.7%       2965 =C2=B1  6%  sched_debug.cpu#17.=
sched_goidle
  66715375 =C2=B1 27%     -38.5%   41040216 =C2=B1 25%  cpuidle.C1-SNB.time
      1866 =C2=B1  7%     -29.1%       1323 =C2=B1  9%  sched_debug.cpu#60.=
nr_switches
      1877 =C2=B1  7%     -21.7%       1470 =C2=B1 12%  sched_debug.cpu#60.=
sched_count
      3412 =C2=B1  3%     +34.1%       4577 =C2=B1  5%  numa-vmstat.node2.n=
r_anon_pages
     13651 =C2=B1  3%     +34.1%      18306 =C2=B1  5%  numa-meminfo.node2.=
AnonPages
      1859 =C2=B1 10%     +52.1%       2828 =C2=B1 21%  sched_debug.cpu#62.=
sched_count
     30187 =C2=B1  9%     +22.8%      37073 =C2=B1  8%  numa-meminfo.node3.=
Active
       199 =C2=B1  2%     +27.4%        253 =C2=B1  7%  sched_debug.cpu#35.=
ttwu_count
       307 =C2=B1 27%     -28.0%        221 =C2=B1 17%  sched_debug.cfs_rq[=
56]:/.tg_load_contrib
     13213 =C2=B1  6%     -14.4%      11313 =C2=B1 14%  numa-meminfo.node2.=
SReclaimable
      3302 =C2=B1  6%     -14.4%       2828 =C2=B1 14%  numa-vmstat.node2.n=
r_slab_reclaimable
     32.22 =C2=B1  0%     +24.4%      40.07 =C2=B1  1%  perf-profile.cpu-cy=
cles.futex_wait_setup.futex_wait.do_futex.sys_futex.system_call_fastpath
    794.01 =C2=B1  0%     -11.4%     703.26 =C2=B1  0%  time.user_time
     27693 =C2=B1  4%     +11.5%      30884 =C2=B1  3%  numa-vmstat.node3.n=
r_file_pages
    110774 =C2=B1  4%     +11.5%     123540 =C2=B1  3%  numa-meminfo.node3.=
FilePages
      7.30 =C2=B1  0%     -14.6%       6.24 =C2=B1  0%  perf-profile.cpu-cy=
cles.system_call_after_swapgs.syscall
    122283 =C2=B1  3%     -10.2%     109866 =C2=B1  3%  numa-meminfo.node2.=
FilePages
     30570 =C2=B1  3%     -10.2%      27466 =C2=B1  3%  numa-vmstat.node2.n=
r_file_pages
      1.78 =C2=B1  2%     -13.1%       1.55 =C2=B1  3%  perf-profile.cpu-cy=
cles.sysret_check.syscall
      2.04 =C2=B1  3%     -12.0%       1.79 =C2=B1  1%  perf-profile.cpu-cy=
cles._raw_spin_unlock.futex_wait_setup.futex_wait.do_futex.sys_futex
      7.00 =C2=B1  0%     -12.9%       6.09 =C2=B1  2%  perf-profile.cpu-cy=
cles._raw_spin_lock.futex_wait_setup.futex_wait.do_futex.sys_futex
        14 =C2=B1  5%     +15.3%         17 =C2=B1  4%  sched_debug.cpu#46.=
cpu_load[1]
      1363 =C2=B1  2%     +10.6%       1507 =C2=B1  3%  slabinfo.mm_struct.=
active_objs
     12.81 =C2=B1  1%     -12.0%      11.27 =C2=B1  1%  perf-profile.cpu-cy=
cles.hash_futex.futex_wait.do_futex.sys_futex.system_call_fastpath

testbox/testcase/testparams: lkp-g5/will-it-scale/performance-futex3

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

   8319207 =C2=B1  0%      -9.9%    7498648 =C2=B1  0%  will-it-scale.per_t=
hread_ops
   8330959 =C2=B1  0%      -9.9%    7503988 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
      1800 =C2=B1  0%     -10.3%       1615 =C2=B1  0%  will-it-scale.time.=
user_time
      0.58 =C2=B1  0%      +7.4%       0.63 =C2=B1  0%  will-it-scale.scala=
bility
      5374 =C2=B1  0%      +3.4%       5557 =C2=B1  0%  will-it-scale.time.=
system_time
      2.37 =C2=B1 11%    +335.3%      10.30 =C2=B1 10%  perf-profile.cpu-cy=
cles.get_futex_key_refs.isra.11.futex_wake.do_futex.sys_futex.system_call_f=
astpath
        13 =C2=B1 31%    +250.0%         45 =C2=B1 44%  sched_debug.cfs_rq[=
13]:/.tg_load_contrib
       909 =C2=B1 46%    +124.5%       2041 =C2=B1 14%  sched_debug.cpu#65.=
ttwu_local
       472 =C2=B1 12%    +184.0%       1340 =C2=B1 49%  sched_debug.cpu#2.s=
ched_goidle
      1642 =C2=B1 19%     -55.8%        726 =C2=B1 43%  sched_debug.cpu#27.=
ttwu_local
      2326 =C2=B1 21%     -70.9%        676 =C2=B1 38%  sched_debug.cpu#32.=
ttwu_local
       351 =C2=B1 23%     +81.6%        637 =C2=B1 35%  sched_debug.cpu#23.=
ttwu_local
      1674 =C2=B1 47%    +151.0%       4203 =C2=B1 33%  numa-meminfo.node6.=
Active(anon)
       418 =C2=B1 48%    +151.3%       1050 =C2=B1 33%  numa-vmstat.node6.n=
r_active_anon
      1754 =C2=B1 46%    +144.9%       4297 =C2=B1 33%  numa-meminfo.node6.=
AnonPages
       438 =C2=B1 46%    +145.0%       1073 =C2=B1 33%  numa-vmstat.node6.n=
r_anon_pages
      4561 =C2=B1 27%     -70.9%       1328 =C2=B1 27%  sched_debug.cpu#32.=
ttwu_count
      1261 =C2=B1 15%    +145.4%       3094 =C2=B1 46%  sched_debug.cpu#2.n=
r_switches
         1 =C2=B1 35%     +87.5%          2 =C2=B1 20%  sched_debug.cfs_rq[=
28]:/.nr_spread_over
      2285 =C2=B1 23%     +38.1%       3155 =C2=B1 27%  sched_debug.cpu#23.=
nr_switches
      1621 =C2=B1  2%     -47.2%        855 =C2=B1 41%  sched_debug.cpu#29.=
ttwu_local
        10 =C2=B1  4%     +86.3%         19 =C2=B1 33%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
       351 =C2=B1 30%     +64.5%        578 =C2=B1 31%  sched_debug.cpu#24.=
ttwu_local
      2931 =C2=B1 11%     -48.9%       1499 =C2=B1 22%  sched_debug.cpu#27.=
ttwu_count
      1044 =C2=B1 24%     +42.4%       1486 =C2=B1 28%  sched_debug.cpu#23.=
sched_goidle
      8008 =C2=B1  6%     -57.6%       3395 =C2=B1 25%  sched_debug.cpu#32.=
nr_switches
       362 =C2=B1 30%     +77.4%        643 =C2=B1 34%  sched_debug.cpu#20.=
ttwu_local
        21 =C2=B1 27%     +66.7%         35 =C2=B1 26%  sched_debug.cfs_rq[=
100]:/.tg_load_contrib
      3168 =C2=B1 18%     -50.3%       1573 =C2=B1 34%  sched_debug.cpu#29.=
ttwu_count
       426 =C2=B1 41%     +57.4%        671 =C2=B1 29%  sched_debug.cpu#34.=
sched_goidle
        18 =C2=B1 37%    +114.3%         40 =C2=B1 25%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
       985 =C2=B1 30%     +56.2%       1538 =C2=B1 19%  sched_debug.cpu#22.=
ttwu_count
       945 =C2=B1 28%     +56.7%       1482 =C2=B1 32%  sched_debug.cpu#21.=
ttwu_count
        22 =C2=B1 38%     +57.7%         35 =C2=B1 36%  sched_debug.cfs_rq[=
103]:/.tg_load_contrib
       389 =C2=B1 18%     +89.7%        738 =C2=B1  8%  sched_debug.cpu#87.=
ttwu_local
        32 =C2=B1 41%     +74.7%         56 =C2=B1 26%  sched_debug.cfs_rq[=
64]:/.blocked_load_avg
       887 =C2=B1 24%     +59.4%       1413 =C2=B1 32%  sched_debug.cpu#20.=
ttwu_count
      6242 =C2=B1  9%     -42.9%       3562 =C2=B1 17%  sched_debug.cpu#27.=
nr_switches
      3293 =C2=B1 18%     -54.7%       1493 =C2=B1 25%  sched_debug.cpu#32.=
sched_goidle
        37 =C2=B1 36%     +70.9%         63 =C2=B1 19%  sched_debug.cfs_rq[=
64]:/.tg_load_contrib
       759 =C2=B1 18%     +75.3%       1330 =C2=B1 18%  sched_debug.cpu#87.=
ttwu_count
       919 =C2=B1 28%     +54.2%       1416 =C2=B1 32%  sched_debug.cpu#23.=
ttwu_count
       183 =C2=B1 35%     -65.8%         62 =C2=B1 38%  sched_debug.cfs_rq[=
121]:/.blocked_load_avg
       185 =C2=B1 34%     -64.6%         65 =C2=B1 35%  sched_debug.cfs_rq[=
121]:/.tg_load_contrib
       355 =C2=B1 25%     +74.0%        618 =C2=B1 35%  sched_debug.cpu#21.=
ttwu_local
       538 =C2=B1 17%     +66.1%        893 =C2=B1 33%  sched_debug.cpu#111=
.sched_count
      1784 =C2=B1  6%     +48.9%       2657 =C2=B1 27%  sched_debug.cpu#2.t=
twu_count
      1986 =C2=B1  5%     +70.2%       3379 =C2=B1 14%  sched_debug.cpu#65.=
sched_goidle
      2955 =C2=B1  9%     -45.5%       1609 =C2=B1 18%  sched_debug.cpu#27.=
sched_goidle
      1149 =C2=B1 38%     +56.4%       1796 =C2=B1 24%  sched_debug.cpu#34.=
nr_switches
     23615 =C2=B1 21%     -46.6%      12602 =C2=B1 24%  sched_debug.cpu#88.=
sched_count
       703 =C2=B1 18%     -24.4%        532 =C2=B1 12%  sched_debug.cpu#48.=
ttwu_count
      6768 =C2=B1 15%     -37.6%       4221 =C2=B1 20%  sched_debug.cpu#29.=
nr_switches
      4471 =C2=B1  7%     +66.1%       7429 =C2=B1 13%  sched_debug.cpu#65.=
nr_switches
    644953 =C2=B1  7%     -44.9%     355582 =C2=B1 21%  sched_debug.cfs_rq[=
94]:/.min_vruntime
       728 =C2=B1  8%     +11.1%        809 =C2=B1  9%  sched_debug.cpu#55.=
nr_switches
       235 =C2=B1 11%     +60.7%        378 =C2=B1 32%  sched_debug.cpu#115=
.ttwu_count
      2547 =C2=B1  8%     +34.0%       3411 =C2=B1 23%  sched_debug.cpu#18.=
nr_switches
       268 =C2=B1 14%     +38.1%        370 =C2=B1 23%  sched_debug.cpu#102=
.sched_goidle
      1480 =C2=B1  5%     +59.4%       2358 =C2=B1 24%  numa-vmstat.node3.n=
r_slab_reclaimable
      5921 =C2=B1  5%     +59.4%       9436 =C2=B1 24%  numa-meminfo.node3.=
SReclaimable
       529 =C2=B1 17%     +32.9%        703 =C2=B1 19%  sched_debug.cpu#111=
.nr_switches
         8 =C2=B1 19%     +55.8%         13 =C2=B1 21%  sched_debug.cpu#41.=
cpu_load[0]
       845 =C2=B1  8%     +50.6%       1272 =C2=B1  4%  sched_debug.cpu#87.=
sched_goidle
      3208 =C2=B1 15%     -40.0%       1924 =C2=B1 23%  sched_debug.cpu#29.=
sched_goidle
      1836 =C2=B1  5%     +52.4%       2798 =C2=B1 11%  sched_debug.cpu#87.=
nr_switches
      2424 =C2=B1 31%     +43.9%       3489 =C2=B1 11%  sched_debug.cpu#65.=
ttwu_count
       167 =C2=B1 16%     +33.1%        222 =C2=B1 17%  sched_debug.cpu#103=
.ttwu_count
       916 =C2=B1 15%     +50.5%       1379 =C2=B1 15%  sched_debug.cpu#84.=
ttwu_count
       161 =C2=B1  8%     +41.6%        229 =C2=B1 14%  sched_debug.cpu#51.=
ttwu_local
     12493 =C2=B1 19%     -31.2%       8594 =C2=B1 14%  sched_debug.cfs_rq[=
122]:/.exec_clock
       153 =C2=B1  3%     +23.9%        190 =C2=B1 19%  sched_debug.cpu#55.=
ttwu_local
      9141 =C2=B1  4%     +29.4%      11831 =C2=B1 10%  sched_debug.cfs_rq[=
126]:/.avg->runnable_avg_sum
       230 =C2=B1 17%     +31.1%        302 =C2=B1 18%  sched_debug.cpu#111=
.sched_goidle
       198 =C2=B1  3%     +29.7%        256 =C2=B1 10%  sched_debug.cfs_rq[=
126]:/.tg_runnable_contrib
    652664 =C2=B1 21%     -36.4%     415054 =C2=B1 15%  meminfo.Committed_AS
      1196 =C2=B1  8%     +34.2%       1606 =C2=B1 24%  sched_debug.cpu#18.=
sched_goidle
      1583 =C2=B1  8%     +26.2%       1998 =C2=B1 12%  sched_debug.cpu#80.=
ttwu_count
        11 =C2=B1 12%     -34.1%          7 =C2=B1 15%  sched_debug.cfs_rq[=
9]:/.load
        11 =C2=B1 19%     -34.1%          7 =C2=B1 15%  sched_debug.cpu#9.c=
pu_load[0]
        11 =C2=B1 12%     -34.1%          7 =C2=B1 15%  sched_debug.cpu#9.l=
oad
      3032 =C2=B1  5%     +32.3%       4013 =C2=B1 11%  sched_debug.cpu#126=
.curr->pid
      6039 =C2=B1 49%     -49.8%       3033 =C2=B1 13%  sched_debug.cpu#90.=
ttwu_count
       442 =C2=B1  9%     -34.9%        288 =C2=B1 11%  sched_debug.cpu#62.=
ttwu_local
       954 =C2=B1 31%     +68.0%       1604 =C2=B1 46%  sched_debug.cpu#81.=
ttwu_count
       251 =C2=B1 19%     +39.5%        350 =C2=B1 28%  sched_debug.cpu#36.=
sched_goidle
       778 =C2=B1 13%     +25.7%        978 =C2=B1 10%  sched_debug.cpu#53.=
nr_switches
       406 =C2=B1  9%     -35.1%        263 =C2=B1  9%  sched_debug.cpu#41.=
ttwu_local
     12511 =C2=B1 15%     +18.7%      14847 =C2=B1 13%  numa-meminfo.node6.=
Active
       646 =C2=B1 14%     +38.6%        896 =C2=B1 27%  sched_debug.cpu#115=
.nr_switches
      1802 =C2=B1 15%     +39.0%       2505 =C2=B1 13%  sched_debug.cpu#86.=
nr_switches
       838 =C2=B1 16%     +38.2%       1159 =C2=B1 12%  sched_debug.cpu#86.=
sched_goidle
       655 =C2=B1 14%     +38.1%        904 =C2=B1 27%  sched_debug.cpu#115=
.sched_count
       660 =C2=B1 14%     +51.7%       1001 =C2=B1 42%  sched_debug.cpu#119=
.sched_count
         8 =C2=B1 14%     +38.0%         11 =C2=B1 19%  sched_debug.cpu#41.=
cpu_load[1]
       527 =C2=B1 16%     -34.3%        346 =C2=B1 18%  sched_debug.cpu#96.=
ttwu_local
       354 =C2=B1 22%     +60.8%        569 =C2=B1 22%  sched_debug.cpu#18.=
ttwu_local
         8 =C2=B1 10%     -25.0%          6 =C2=B1  0%  sched_debug.cpu#17.=
cpu_load[0]
         8 =C2=B1 10%     -25.0%          6 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.runnable_load_avg
         8 =C2=B1  5%     -28.0%          6 =C2=B1  0%  sched_debug.cpu#17.=
cpu_load[1]
         8 =C2=B1  5%     -28.0%          6 =C2=B1  0%  sched_debug.cpu#17.=
cpu_load[2]
         8 =C2=B1 10%     -25.0%          6 =C2=B1  0%  sched_debug.cpu#17.=
cpu_load[4]
         8 =C2=B1 10%     -25.0%          6 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.load
         8 =C2=B1 10%     -25.0%          6 =C2=B1  0%  sched_debug.cpu#17.=
cpu_load[3]
         8 =C2=B1 10%     -25.0%          6 =C2=B1  0%  sched_debug.cpu#17.=
load
     10464 =C2=B1  8%     -32.9%       7025 =C2=B1 17%  sched_debug.cfs_rq[=
94]:/.avg->runnable_avg_sum
       227 =C2=B1  8%     -33.1%        152 =C2=B1 17%  sched_debug.cfs_rq[=
94]:/.tg_runnable_contrib
      3279 =C2=B1 11%     +13.7%       3729 =C2=B1 11%  sched_debug.cpu#125=
.curr->pid
      2956 =C2=B1  4%     +17.5%       3474 =C2=B1  9%  sched_debug.cpu#127=
.curr->pid
       637 =C2=B1  9%     -25.4%        475 =C2=B1 18%  sched_debug.cpu#62.=
ttwu_count
      9187 =C2=B1  1%     +21.9%      11201 =C2=B1 10%  sched_debug.cfs_rq[=
127]:/.avg->runnable_avg_sum
         8 =C2=B1  5%     -19.2%          7 =C2=B1 10%  sched_debug.cpu#9.c=
pu_load[4]
       200 =C2=B1  1%     +21.4%        243 =C2=B1 10%  sched_debug.cfs_rq[=
127]:/.tg_runnable_contrib
       611 =C2=B1  8%     -16.8%        509 =C2=B1  6%  sched_debug.cpu#41.=
sched_goidle
     23669 =C2=B1 14%     +18.0%      27933 =C2=B1 10%  numa-meminfo.node3.=
Slab
    753533 =C2=B1 11%     +16.9%     880591 =C2=B1 14%  sched_debug.cfs_rq[=
125]:/.min_vruntime
    675885 =C2=B1  5%     +36.5%     922395 =C2=B1  8%  sched_debug.cfs_rq[=
126]:/.min_vruntime
      1557 =C2=B1  0%     -18.8%       1264 =C2=B1  6%  sched_debug.cpu#41.=
nr_switches
      1572 =C2=B1  0%     -18.8%       1277 =C2=B1  5%  sched_debug.cpu#41.=
sched_count
         9 =C2=B1  4%     -22.4%          7 =C2=B1 14%  sched_debug.cpu#9.c=
pu_load[2]
        10 =C2=B1  8%     -25.0%          7 =C2=B1 14%  sched_debug.cpu#9.c=
pu_load[1]
       428 =C2=B1 19%     -27.8%        309 =C2=B1 15%  sched_debug.cpu#54.=
sched_goidle
      3838 =C2=B1  1%     -21.8%       3000 =C2=B1  5%  sched_debug.cpu#122=
.curr->pid
       772 =C2=B1  3%     +15.6%        893 =C2=B1 12%  numa-vmstat.node4.n=
r_alloc_batch
       266 =C2=B1 13%     +38.2%        368 =C2=B1 35%  sched_debug.cpu#119=
.sched_goidle
      1763 =C2=B1  2%     -16.5%       1472 =C2=B1 10%  numa-vmstat.node6.n=
r_slab_reclaimable
      7054 =C2=B1  2%     -16.5%       5889 =C2=B1  9%  numa-meminfo.node6.=
SReclaimable
   1800.43 =C2=B1  0%     -10.3%    1615.50 =C2=B1  0%  time.user_time
      1018 =C2=B1 17%     -23.4%        780 =C2=B1 11%  sched_debug.cpu#54.=
nr_switches
     10904 =C2=B1  6%     -15.2%       9246 =C2=B1  6%  sched_debug.cfs_rq[=
122]:/.avg->runnable_avg_sum
       237 =C2=B1  6%     -15.3%        201 =C2=B1  6%  sched_debug.cfs_rq[=
122]:/.tg_runnable_contrib
       461 =C2=B1  4%     +36.1%        627 =C2=B1 27%  sched_debug.cpu#43.=
sched_goidle
       488 =C2=B1  9%     -20.3%        389 =C2=B1 11%  sched_debug.cpu#58.=
ttwu_local
       974 =C2=B1 18%     -25.6%        725 =C2=B1 11%  numa-meminfo.node7.=
PageTables
     57552 =C2=B1  7%     +14.9%      66133 =C2=B1  6%  sched_debug.cfs_rq[=
69]:/.exec_clock
      3658 =C2=B1  6%     +15.7%       4230 =C2=B1 11%  sched_debug.cpu#80.=
nr_switches
       794 =C2=B1  6%      +9.3%        867 =C2=B1  7%  numa-vmstat.node0.n=
r_alloc_batch
       331 =C2=B1 14%     +26.6%        419 =C2=B1 12%  sched_debug.cpu#59.=
ttwu_local
     75174 =C2=B1  6%     -12.1%      66087 =C2=B1  6%  sched_debug.cfs_rq[=
101]:/.exec_clock
       164 =C2=B1 10%     +25.4%        206 =C2=B1 20%  sched_debug.cpu#114=
.ttwu_local
   1618315 =C2=B1  5%      +2.4%    1656815 =C2=B1  5%  sched_debug.cfs_rq[=
58]:/.min_vruntime

testbox/testcase/testparams: lkp-wsx01/will-it-scale/performance-futex3

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

   9211097 =C2=B1  0%     -10.2%    8268370 =C2=B1  0%  will-it-scale.per_t=
hread_ops
   9204866 =C2=B1  0%     -10.2%    8266680 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
      0.63 =C2=B1  0%      +6.3%       0.66 =C2=B1  0%  will-it-scale.scala=
bility
      2.01 =C2=B1  1%    +365.3%       9.35 =C2=B1  1%  perf-profile.cpu-cy=
cles.get_futex_key_refs.isra.11.futex_wake.do_futex.sys_futex.system_call_f=
astpath
         1 =C2=B1 34%    +200.0%          4 =C2=B1 17%  sched_debug.cpu#63.=
nr_uninterruptible
       404 =C2=B1 23%    +143.3%        984 =C2=B1 27%  sched_debug.cpu#48.=
sched_count
       434 =C2=B1 32%     -68.0%        139 =C2=B1 20%  sched_debug.cpu#61.=
ttwu_local
      5335 =C2=B1 48%     -54.4%       2433 =C2=B1 43%  sched_debug.cpu#20.=
sched_goidle
       576 =C2=B1 26%     -46.8%        306 =C2=B1 34%  sched_debug.cpu#55.=
ttwu_count
       161 =C2=B1 27%    +159.0%        418 =C2=B1 29%  sched_debug.cpu#48.=
sched_goidle
     11216 =C2=B1 46%     -49.6%       5648 =C2=B1 38%  sched_debug.cpu#20.=
nr_switches
     11237 =C2=B1 46%     -49.5%       5669 =C2=B1 38%  sched_debug.cpu#20.=
sched_count
       395 =C2=B1 23%    +146.2%        972 =C2=B1 27%  sched_debug.cpu#48.=
nr_switches
      1461 =C2=B1 31%     -46.9%        776 =C2=B1 23%  sched_debug.cpu#42.=
ttwu_local
       926 =C2=B1 19%     -41.0%        546 =C2=B1 24%  sched_debug.cpu#61.=
ttwu_count
       856 =C2=B1 34%     -50.2%        426 =C2=B1 31%  sched_debug.cpu#58.=
ttwu_count
       498 =C2=B1 23%     -54.4%        227 =C2=B1 25%  sched_debug.cpu#55.=
sched_goidle
      3667 =C2=B1 25%     -38.3%       2263 =C2=B1 18%  sched_debug.cpu#42.=
nr_switches
      3680 =C2=B1 25%     -38.1%       2279 =C2=B1 18%  sched_debug.cpu#42.=
sched_count
      1593 =C2=B1 17%     -45.1%        875 =C2=B1 20%  sched_debug.cpu#61.=
nr_switches
       155 =C2=B1 36%    +182.5%        438 =C2=B1 40%  sched_debug.cpu#48.=
ttwu_count
      1604 =C2=B1 17%     -44.8%        885 =C2=B1 20%  sched_debug.cpu#61.=
sched_count
      1245 =C2=B1 27%     -52.5%        591 =C2=B1 21%  sched_debug.cpu#55.=
sched_count
       534 =C2=B1 11%     +63.0%        871 =C2=B1 35%  sched_debug.cpu#45.=
nr_switches
      1232 =C2=B1 27%     -52.8%        581 =C2=B1 21%  sched_debug.cpu#55.=
nr_switches
       545 =C2=B1 11%     +62.0%        883 =C2=B1 35%  sched_debug.cpu#45.=
sched_count
       402 =C2=B1 22%     +45.4%        585 =C2=B1 29%  sched_debug.cpu#70.=
sched_goidle
       595 =C2=B1 21%    +108.8%       1242 =C2=B1 40%  sched_debug.cpu#70.=
ttwu_count
       575 =C2=B1 24%     -39.7%        346 =C2=B1 21%  sched_debug.cpu#61.=
sched_goidle
        10 =C2=B1 26%     -44.0%          5 =C2=B1 18%  sched_debug.cpu#72.=
cpu_load[0]
      7.76 =C2=B1  0%     +15.3%       8.95 =C2=B1  0%  perf-profile.cpu-cy=
cles.get_futex_key.futex_wake.do_futex.sys_futex.system_call_fastpath
      3149 =C2=B1 11%     -15.0%       2677 =C2=B1 10%  sched_debug.cpu#71.=
curr->pid
      4.52 =C2=B1  2%     -11.5%       4.00 =C2=B1  1%  perf-profile.cpu-cy=
cles.do_futex.sys_futex.system_call_fastpath.syscall
   1401.34 =C2=B1  0%     -10.1%    1260.10 =C2=B1  0%  time.user_time
      4.92 =C2=B1  0%     -11.5%       4.36 =C2=B1  1%  perf-profile.cpu-cy=
cles.sys_futex.system_call_fastpath.syscall
     12.56 =C2=B1  0%     -12.2%      11.03 =C2=B1  1%  perf-profile.cpu-cy=
cles.system_call_after_swapgs.syscall
     11.31 =C2=B1  0%     -11.2%      10.05 =C2=B1  0%  perf-profile.cpu-cy=
cles.system_call.syscall
      3.76 =C2=B1  0%     -13.5%       3.25 =C2=B1  0%  perf-profile.cpu-cy=
cles.sysret_check.syscall
      1.21 =C2=B1  1%     -11.4%       1.08 =C2=B1  1%  perf-profile.cpu-cy=
cles.drop_futex_key_refs.isra.12.futex_wake.do_futex.sys_futex.system_call_=
fastpath
     20.50 =C2=B1  0%     -10.9%      18.25 =C2=B1  0%  perf-profile.cpu-cy=
cles.syscall
      3007 =C2=B1  6%     -11.8%       2654 =C2=B1 13%  sched_debug.cpu#38.=
curr->pid

testbox/testcase/testparams: nhm4/will-it-scale/performance-futex3

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

          2:5          -40%            :5     kmsg.Spurious_LAPIC_timer_int=
errupt_on_cpu
  11324367 =C2=B1  0%     -12.0%    9969101 =C2=B1  0%  will-it-scale.per_t=
hread_ops
  11271283 =C2=B1  0%     -12.1%    9911001 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
      0.66 =C2=B1  0%      +9.6%       0.72 =C2=B1  0%  will-it-scale.scala=
bility
      1.67 =C2=B1  1%    +509.7%      10.17 =C2=B1  3%  perf-profile.cpu-cy=
cles.get_futex_key_refs.isra.11.futex_wake.do_futex.sys_futex.system_call_f=
astpath
      1127 =C2=B1 31%     -42.3%        651 =C2=B1  8%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
       799 =C2=B1 19%     -34.8%        521 =C2=B1 26%  sched_debug.cfs_rq[=
2]:/.blocked_load_avg
       906 =C2=B1 17%     -30.8%        627 =C2=B1 21%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
      1245 =C2=B1 28%     -38.8%        762 =C2=B1  8%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
      0.47 =C2=B1  7%    +119.7%       1.02 =C2=B1  5%  perf-profile.cpu-cy=
cles.ret_from_sys_call.syscall
     16.48 =C2=B1  1%     +56.0%      25.71 =C2=B1  2%  perf-profile.cpu-cy=
cles.futex_wake.do_futex.sys_futex.system_call_fastpath.syscall
       153 =C2=B1 13%     -35.3%         99 =C2=B1 22%  sched_debug.cpu#6.l=
oad
       969 =C2=B1 22%     +48.4%       1438 =C2=B1 20%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
       133 =C2=B1 11%     -28.7%         95 =C2=B1 22%  sched_debug.cfs_rq[=
6]:/.load
       827 =C2=B1 26%     +55.5%       1286 =C2=B1 23%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
      6.55 =C2=B1  3%     +22.3%       8.01 =C2=B1  1%  perf-profile.cpu-cy=
cles.get_futex_key.futex_wake.do_futex.sys_futex.system_call_fastpath
        70 =C2=B1 10%     +21.7%         85 =C2=B1  9%  sched_debug.cpu#2.c=
pu_load[3]
        68 =C2=B1 12%     +23.5%         84 =C2=B1  9%  sched_debug.cpu#2.c=
pu_load[4]
       114 =C2=B1  4%     -21.6%         89 =C2=B1 12%  sched_debug.cpu#6.c=
pu_load[1]
       103 =C2=B1  5%     -21.8%         81 =C2=B1  9%  sched_debug.cpu#6.c=
pu_load[2]
    214345 =C2=B1 13%     +31.5%     281773 =C2=B1 13%  sched_debug.cfs_rq[=
2]:/.min_vruntime
     37071 =C2=B1 15%     +36.8%      50702 =C2=B1 15%  sched_debug.cfs_rq[=
2]:/.exec_clock
      1.22 =C2=B1  4%     -15.5%       1.03 =C2=B1  9%  perf-profile.cpu-cy=
cles.drop_futex_key_refs.isra.12.do_futex.sys_futex.system_call_fastpath.sy=
scall
     42.44 =C2=B1  0%     +13.8%      48.30 =C2=B1  2%  perf-profile.cpu-cy=
cles.do_futex.sys_futex.system_call_fastpath.syscall
     50.65 =C2=B1  0%     +11.9%      56.69 =C2=B1  2%  perf-profile.cpu-cy=
cles.system_call_fastpath.syscall
    199.04 =C2=B1  0%     -21.5%     156.27 =C2=B1  2%  time.user_time
     48.57 =C2=B1  0%     +11.3%      54.04 =C2=B1  2%  perf-profile.cpu-cy=
cles.sys_futex.system_call_fastpath.syscall
     38234 =C2=B1  5%     -17.6%      31518 =C2=B1  1%  softirqs.RCU
     82318 =C2=B1 11%     -20.7%      65237 =C2=B1 13%  sched_debug.cpu#1.n=
r_load_updates
        95 =C2=B1  7%     -19.9%         76 =C2=B1  8%  sched_debug.cpu#6.c=
pu_load[4]
     12.54 =C2=B1  1%     -14.4%      10.73 =C2=B1  3%  perf-profile.cpu-cy=
cles.system_call_after_swapgs.syscall
        98 =C2=B1  7%     -20.5%         78 =C2=B1  8%  sched_debug.cpu#6.c=
pu_load[3]
     11.27 =C2=B1  1%     -16.4%       9.43 =C2=B1  1%  perf-profile.cpu-cy=
cles.system_call.syscall
    324067 =C2=B1  8%     -18.2%     265084 =C2=B1 14%  sched_debug.cfs_rq[=
6]:/.min_vruntime
     58381 =C2=B1 10%     -23.2%      44812 =C2=B1 18%  sched_debug.cfs_rq[=
6]:/.exec_clock
      3.23 =C2=B1  2%     -15.0%       2.75 =C2=B1  2%  perf-profile.cpu-cy=
cles.sysret_check.syscall
     18.21 =C2=B1  1%     -13.6%      15.74 =C2=B1  2%  perf-profile.cpu-cy=
cles.hash_futex.do_futex.sys_futex.system_call_fastpath.syscall
      3053 =C2=B1  8%     -18.2%       2499 =C2=B1 13%  sched_debug.cpu#6.c=
urr->pid
     21140 =C2=B1  9%     +17.5%      24849 =C2=B1  8%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
     27368 =C2=B1  7%     -13.6%      23638 =C2=B1  8%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
       596 =C2=B1  7%     -13.6%        515 =C2=B1  8%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
     39113 =C2=B1  2%     +10.7%      43292 =C2=B1  4%  cpuidle.C6-NHM.usage

testbox/testcase/testparams: ivb42/will-it-scale/performance-futex3

0429fbc0bdc297d6  76835b0ebf8a7fe85beb03c751  =

----------------  --------------------------  =

  11973558 =C2=B1  0%     -16.3%   10023607 =C2=B1  0%  will-it-scale.per_t=
hread_ops
  11960916 =C2=B1  0%     -16.5%    9989502 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
      0.61 =C2=B1  0%      +9.2%       0.66 =C2=B1  0%  will-it-scale.scala=
bility
      0.83 =C2=B1  4%   +1394.0%      12.45 =C2=B1  0%  perf-profile.cpu-cy=
cles.get_futex_key_refs.isra.11.futex_wake.do_futex.sys_futex.system_call_f=
astpath
       271 =C2=B1 46%    +125.9%        613 =C2=B1 17%  sched_debug.cpu#38.=
ttwu_local
       327 =C2=B1 42%    +155.8%        838 =C2=B1 41%  sched_debug.cpu#45.=
ttwu_local
       624 =C2=B1 25%    +137.2%       1482 =C2=B1 30%  sched_debug.cpu#27.=
sched_count
       492 =C2=B1 20%    +116.3%       1065 =C2=B1 12%  sched_debug.cpu#38.=
sched_goidle
       280 =C2=B1 14%    +193.7%        822 =C2=B1 43%  sched_debug.cpu#27.=
ttwu_count
      1317 =C2=B1 23%     +99.7%       2630 =C2=B1 12%  sched_debug.cpu#38.=
nr_switches
       146 =C2=B1 38%     +34.1%        196 =C2=B1 36%  sched_debug.cfs_rq[=
39]:/.blocked_load_avg
       163 =C2=B1 37%     +28.0%        209 =C2=B1 34%  sched_debug.cfs_rq[=
39]:/.tg_load_contrib
       613 =C2=B1 26%    +139.4%       1469 =C2=B1 31%  sched_debug.cpu#27.=
nr_switches
      1560 =C2=B1 31%     +37.3%       2142 =C2=B1 29%  sched_debug.cpu#37.=
nr_switches
       277 =C2=B1 27%     +82.0%        504 =C2=B1 18%  sched_debug.cpu#27.=
sched_goidle
     15.50 =C2=B1  0%     +96.1%      30.40 =C2=B1  0%  perf-profile.cpu-cy=
cles.futex_wake.do_futex.sys_futex.system_call_fastpath.syscall
      1625 =C2=B1 38%     -56.3%        710 =C2=B1 12%  sched_debug.cpu#40.=
ttwu_local
      1528 =C2=B1 21%     +91.9%       2933 =C2=B1 35%  sched_debug.cpu#45.=
nr_switches
      1539 =C2=B1 21%     +91.4%       2945 =C2=B1 35%  sched_debug.cpu#45.=
sched_count
      5876 =C2=B1 18%     -35.8%       3771 =C2=B1 32%  sched_debug.cpu#40.=
sched_count
       447 =C2=B1 35%     +59.3%        712 =C2=B1 22%  sched_debug.cpu#44.=
sched_goidle
        16 =C2=B1 35%     -35.9%         10 =C2=B1  4%  sched_debug.cpu#41.=
cpu_load[0]
       948 =C2=B1 21%     +49.5%       1418 =C2=B1 21%  sched_debug.cpu#45.=
ttwu_count
      5504 =C2=B1  5%     -36.8%       3479 =C2=B1 14%  sched_debug.cpu#10.=
sched_count
         7 =C2=B1 34%     +94.3%         14 =C2=B1 43%  sched_debug.cpu#19.=
cpu_load[1]
         7 =C2=B1 34%     +56.8%         11 =C2=B1 17%  sched_debug.cpu#19.=
cpu_load[3]
         7 =C2=B1 34%     +70.5%         12 =C2=B1 30%  sched_debug.cpu#19.=
cpu_load[2]
        15 =C2=B1 30%     -33.2%         10 =C2=B1  4%  sched_debug.cpu#41.=
cpu_load[1]
      7.20 =C2=B1  0%     +52.5%      10.98 =C2=B1  1%  perf-profile.cpu-cy=
cles.get_futex_key.futex_wake.do_futex.sys_futex.system_call_fastpath
      3947 =C2=B1 12%     -44.3%       2199 =C2=B1 44%  sched_debug.cpu#14.=
ttwu_count
      2594 =C2=B1 21%     +38.4%       3591 =C2=B1 13%  sched_debug.cpu#19.=
curr->pid
      1120 =C2=B1 31%     +55.1%       1738 =C2=B1 27%  sched_debug.cpu#43.=
ttwu_count
       270 =C2=B1 13%     +14.0%        307 =C2=B1  8%  numa-vmstat.node1.n=
r_mlock
       270 =C2=B1 13%     +14.0%        307 =C2=B1  8%  numa-vmstat.node1.n=
r_unevictable
      1082 =C2=B1 13%     +13.8%       1232 =C2=B1  8%  numa-meminfo.node1.=
Mlocked
      1082 =C2=B1 13%     +13.8%       1232 =C2=B1  8%  numa-meminfo.node1.=
Unevictable
   1461464 =C2=B1 17%     -16.1%    1226347 =C2=B1 10%  sched_debug.cfs_rq[=
43]:/.min_vruntime
      3199 =C2=B1  1%     +12.5%       3600 =C2=B1 11%  sched_debug.cpu#44.=
curr->pid
      1.27 =C2=B1  1%     -19.5%       1.02 =C2=B1  1%  perf-profile.cpu-cy=
cles.drop_futex_key_refs.isra.12.do_futex.sys_futex.system_call_fastpath.sy=
scall
     37.32 =C2=B1  0%     +30.8%      48.80 =C2=B1  0%  perf-profile.cpu-cy=
cles.do_futex.sys_futex.system_call_fastpath.syscall
     44.13 =C2=B1  0%     +23.4%      54.44 =C2=B1  0%  perf-profile.cpu-cy=
cles.system_call_fastpath.syscall
    995.56 =C2=B1  0%     -15.9%     836.90 =C2=B1  0%  time.user_time
        14 =C2=B1 28%     -28.5%         10 =C2=B1  4%  sched_debug.cpu#41.=
cpu_load[2]
        13 =C2=B1 14%     -23.1%         10 =C2=B1  4%  sched_debug.cfs_rq[=
41]:/.runnable_load_avg
        13 =C2=B1 16%     -21.2%         10 =C2=B1  4%  sched_debug.cfs_rq[=
41]:/.load
      5.09 =C2=B1  2%     -18.1%       4.17 =C2=B1  0%  perf-profile.cpu-cy=
cles.testcase
     42.39 =C2=B1  0%     +25.1%      53.01 =C2=B1  0%  perf-profile.cpu-cy=
cles.sys_futex.system_call_fastpath.syscall
     20179 =C2=B1 46%     +40.0%      28253 =C2=B1  5%  sched_debug.cfs_rq[=
19]:/.exec_clock
     12.68 =C2=B1  0%     -20.3%      10.11 =C2=B1  0%  perf-profile.cpu-cy=
cles.system_call_after_swapgs.syscall
     13.54 =C2=B1  0%     -18.0%      11.10 =C2=B1  1%  perf-profile.cpu-cy=
cles.system_call.syscall
      2.55 =C2=B1  0%     -18.3%       2.08 =C2=B1  0%  perf-profile.cpu-cy=
cles.sysret_check.syscall
      4928 =C2=B1 21%     -32.7%       3319 =C2=B1 19%  sched_debug.cpu#40.=
nr_switches
      1547 =C2=B1  4%     +12.9%       1746 =C2=B1  5%  slabinfo.sock_inode=
_cache.num_objs
      1547 =C2=B1  4%     +12.9%       1746 =C2=B1  5%  slabinfo.sock_inode=
_cache.active_objs
     16.28 =C2=B1  0%     -15.2%      13.80 =C2=B1  1%  perf-profile.cpu-cy=
cles.hash_futex.do_futex.sys_futex.system_call_fastpath.syscall
     90590 =C2=B1  1%     -12.1%      79668 =C2=B1  5%  meminfo.DirectMap4k
      4143 =C2=B1  5%     -11.0%       3689 =C2=B1  8%  sched_debug.cpu#37.=
curr->pid
       956 =C2=B1  6%      +8.3%       1036 =C2=B1  4%  slabinfo.RAW.active=
_objs
       956 =C2=B1  6%      +8.3%       1036 =C2=B1  4%  slabinfo.RAW.num_ob=
js

lkp-wsx01: Westmere-EX
Memory: 128G

wsm: Westmere
Memory: 6G

lkp-snb01: Sandy Bridge-EP
Memory: 32G

lkp-sbx04: Sandy Bridge-EX
Memory: 64G

nhm4: Nehalem
Memory: 4G

lkp-g5: Westmere-EX
Memory: 2048G

ivb42: Ivytown Ivy Bridge-EP
Memory: 64G

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


--===============0027714814367400478==
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
b21taXQ6IGIyNzc2YmY3MTQ5YmRkZDFmNDE2MWYxNGY3OTUyMGYxN2ZjMWQ3MWQKbW9kZWw6IFdl
c3RtZXJlCm1lbW9yeTogNkcKbnJfaGRkX3BhcnRpdGlvbnM6IDEKaGRkX3BhcnRpdGlvbnM6IApz
d2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAKcGVyZi1wcm9maWxlOgogIGZyZXE6
IDgwMAp3aWxsLWl0LXNjYWxlOgogIHRlc3Q6CiAgLSBmdXRleDMKdGVzdGJveDogd3NtCnRib3hf
Z3JvdXA6IHdzbQprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTQtMTItMDgg
MTc6Mzc6MTguNDgxMTI1MzUzICswODowMApoZWFkX2NvbW1pdDogNjg4OGRmMjVmYjFiNDQ2Mzc4
YjBlYTllYTk3OGMxOGY0OTJmNGVlMQpiYXNlX2NvbW1pdDogYjI3NzZiZjcxNDliZGRkMWY0MTYx
ZjE0Zjc5NTIwZjE3ZmMxZDcxZApicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE0
MTIwODExCmtlcm5lbDogIi9rZXJuZWwveDg2XzY0LXJoZWwvYjI3NzZiZjcxNDliZGRkMWY0MTYx
ZjE0Zjc5NTIwZjE3ZmMxZDcxZC92bWxpbnV6LTMuMTguMC1nYjI3NzZiZiIKdXNlcjogbGtwCnF1
ZXVlOiBjeWNsaWMKcm9vdGZzOiBkZWJpYW4teDg2XzY0LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1
bHQvd3NtL3dpbGwtaXQtc2NhbGUvcGVyZm9ybWFuY2UtZnV0ZXgzL2RlYmlhbi14ODZfNjQuY2d6
L3g4Nl82NC1yaGVsL2IyNzc2YmY3MTQ5YmRkZDFmNDE2MWYxNGY3OTUyMGYxN2ZjMWQ3MWQvMCIK
am9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC93c20vY3ljbGljX3dpbGwtaXQtc2NhbGUtcGVyZm9y
bWFuY2UtZnV0ZXgzLXg4Nl82NC1yaGVsLUJBU0UtYjI3NzZiZjcxNDliZGRkMWY0MTYxZjE0Zjc5
NTIwZjE3ZmMxZDcxZC0wLnlhbWwiCmRlcXVldWVfdGltZTogMjAxNC0xMi0wOCAxODoyODo0My4y
OTgxNTA3OTMgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogOS4xMyA0Ljk2IDIu
MDIgMS8xNDkgNTgyMQpzdGFydF90aW1lOiAnMTQxODAzNDU1NCcKZW5kX3RpbWU6ICcxNDE4MDM0
ODU4Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE0MTIwNi0wNjAyMTkiCg==

--===============0027714814367400478==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgouL3J1bnRlc3QucHkgZnV0ZXgzIDMyIDEgNiA5IDEyCg==

--===============0027714814367400478==--

