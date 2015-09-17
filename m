Content-Type: multipart/mixed; boundary="===============0571485855964879366=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [sched/numa] 2a595721a1: No primary change, -4.1% pigz.time.system_time, -35.6% pigz.time.involuntary_context_switches
Date: Thu, 17 Sep 2015 11:13:42 +0800
Message-ID: <87h9mtg2l5.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0571485855964879366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit 2a595721a1fa6b684c1c818f379bef834ac3d65e ("sched/numa: Convert sched=
_numa_balancing to a static_branch")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_threads/blo=
cksize:
  brickland1/pigz/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performa=
nce/25%/512K

commit: =

  2b49d84b259fc18e131026e5d38e7855352f71b9
  2a595721a1fa6b684c1c818f379bef834ac3d65e

2b49d84b259fc18e 2a595721a1fa6b684c1c818f37 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      8893 =C2=B1  3%     -35.6%       5725 =C2=B1  2%  pigz.time.involunta=
ry_context_switches
    529645 =C2=B1  7%     -84.6%      81746 =C2=B1  2%  pigz.time.minor_pag=
e_faults
    136.12 =C2=B1  0%      -4.1%     130.53 =C2=B1  0%  pigz.time.system_ti=
me
     49894 =C2=B1  0%     -12.0%      43908 =C2=B1  0%  vmstat.system.in
     23110 =C2=B1  4%     +10.4%      25504 =C2=B1  3%  numa-meminfo.node2.=
Active(file)
     34491 =C2=B1  7%      +9.9%      37902 =C2=B1  7%  numa-meminfo.node3.=
SUnreclaim
   2198559 =C2=B1 85%    +298.4%    8759838 =C2=B1 40%  numa-numastat.node3=
.local_node
   2201064 =C2=B1 85%    +298.1%    8762796 =C2=B1 40%  numa-numastat.node3=
.numa_hit
      8893 =C2=B1  3%     -35.6%       5725 =C2=B1  2%  time.involuntary_co=
ntext_switches
    529645 =C2=B1  7%     -84.6%      81746 =C2=B1  2%  time.minor_page_fau=
lts
    921.83 =C2=B1  0%      +4.0%     958.44 =C2=B1  0%  turbostat.CorWatt
    935.50 =C2=B1  0%      +3.9%     972.09 =C2=B1  0%  turbostat.PkgWatt
   1210520 =C2=B1116%    +466.6%    6858564 =C2=B1173%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
   1210520 =C2=B1116%    +466.6%    6858564 =C2=B1173%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
   1210520 =C2=B1116%    +466.6%    6858564 =C2=B1173%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      5777 =C2=B1  4%     +10.4%       6375 =C2=B1  3%  numa-vmstat.node2.n=
r_active_file
      8622 =C2=B1  7%      +9.9%       9475 =C2=B1  7%  numa-vmstat.node3.n=
r_slab_unreclaimable
   1397511 =C2=B1112%    +225.2%    4545159 =C2=B1 45%  numa-vmstat.node3.n=
uma_hit
   1344766 =C2=B1116%    +234.2%    4494534 =C2=B1 45%  numa-vmstat.node3.n=
uma_local
    446934 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.numa_hi=
nt_faults
    156287 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.numa_hi=
nt_faults_local
     79222 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.numa_pa=
ges_migrated
    606436 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.numa_pt=
e_updates
   1325944 =C2=B1  3%     -34.0%     875483 =C2=B1  0%  proc-vmstat.pgfault
      2944 =C2=B1 22%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.pgmigra=
te_fail
     79222 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.pgmigra=
te_success
      1.66 =C2=B1 88%     -90.3%       0.16 =C2=B1 35%  perf-profile.cpu-cy=
cles.__acct_update_integrals.acct_account_cputime.account_user_time.account=
_process_tick.update_process_times
     51.92 =C2=B1 11%     -18.3%      42.43 =C2=B1 14%  perf-profile.cpu-cy=
cles.__hrtimer_run_queues.hrtimer_interrupt.local_apic_timer_interrupt.smp_=
apic_timer_interrupt.apic_timer_interrupt
     29.38 =C2=B1  7%     -23.4%      22.52 =C2=B1 14%  perf-profile.cpu-cy=
cles.ktime_get.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.loca=
l_apic_timer_interrupt
     29.13 =C2=B1  7%     -23.4%      22.32 =C2=B1 13%  perf-profile.cpu-cy=
cles.read_hpet.ktime_get.tick_sched_timer.__hrtimer_run_queues.hrtimer_inte=
rrupt
      1.17 =C2=B1 31%    +112.8%       2.48 =C2=B1 17%  perf-profile.cpu-cy=
cles.read_hpet.update_wall_time.tick_do_update_jiffies64.tick_sched_do_time=
r.tick_sched_timer
      1.78 =C2=B1 32%    +107.3%       3.70 =C2=B1 13%  perf-profile.cpu-cy=
cles.tick_do_update_jiffies64.tick_sched_do_timer.tick_sched_timer.__hrtime=
r_run_queues.hrtimer_interrupt
      1.78 =C2=B1 32%    +107.4%       3.70 =C2=B1 13%  perf-profile.cpu-cy=
cles.tick_sched_do_timer.tick_sched_timer.__hrtimer_run_queues.hrtimer_inte=
rrupt.local_apic_timer_interrupt
     50.82 =C2=B1 11%     -18.1%      41.61 =C2=B1 14%  perf-profile.cpu-cy=
cles.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.local_apic_tim=
er_interrupt.smp_apic_timer_interrupt
      1.77 =C2=B1 32%    +106.6%       3.67 =C2=B1 13%  perf-profile.cpu-cy=
cles.update_wall_time.tick_do_update_jiffies64.tick_sched_do_timer.tick_sch=
ed_timer.__hrtimer_run_queues
    116261 =C2=B1  3%     -24.1%      88256 =C2=B1  7%  sched_debug.cfs_rq[=
0]:/.exec_clock
   3830581 =C2=B1  1%     -24.8%    2878817 =C2=B1  7%  sched_debug.cfs_rq[=
0]:/.min_vruntime
    133.00 =C2=B1 55%     -98.7%       1.67 =C2=B1 74%  sched_debug.cfs_rq[=
100]:/.util_avg
  -3659940 =C2=B1 -3%     -24.4%   -2765978 =C2=B1 -7%  sched_debug.cfs_rq[=
101]:/.spread0
  -3278346 =C2=B1 -8%     -20.5%   -2604920 =C2=B1-18%  sched_debug.cfs_rq[=
102]:/.spread0
  -3435271 =C2=B1-11%     -22.2%   -2672848 =C2=B1-15%  sched_debug.cfs_rq[=
103]:/.spread0
  -3566499 =C2=B1 -3%     -29.6%   -2512386 =C2=B1-20%  sched_debug.cfs_rq[=
104]:/.spread0
  -3574386 =C2=B1-10%     -24.6%   -2693594 =C2=B1-14%  sched_debug.cfs_rq[=
105]:/.spread0
      2881 =C2=B1120%   +1131.0%      35471 =C2=B1 40%  sched_debug.cfs_rq[=
106]:/.exec_clock
      0.50 =C2=B1173%   +1100.0%       6.00 =C2=B1 31%  sched_debug.cfs_rq[=
106]:/.load_avg
    145030 =C2=B1 68%    +703.4%    1165173 =C2=B1 40%  sched_debug.cfs_rq[=
106]:/.min_vruntime
  -3686246 =C2=B1 -3%     -53.5%   -1714418 =C2=B1-32%  sched_debug.cfs_rq[=
106]:/.spread0
      0.50 =C2=B1173%   +1100.0%       6.00 =C2=B1 31%  sched_debug.cfs_rq[=
106]:/.tg_load_avg_contrib
      2.75 =C2=B1132%   +7254.5%     202.25 =C2=B1 26%  sched_debug.cfs_rq[=
106]:/.util_avg
     18683 =C2=B1 58%     -85.0%       2799 =C2=B1 95%  sched_debug.cfs_rq[=
107]:/.exec_clock
  -3196208 =C2=B1-10%     -15.4%   -2705137 =C2=B1-11%  sched_debug.cfs_rq[=
107]:/.spread0
    750.95 =C2=B1 58%   +1665.3%      13256 =C2=B1 95%  sched_debug.cfs_rq[=
108]:/.exec_clock
     66759 =C2=B1 44%    +599.7%     467098 =C2=B1 81%  sched_debug.cfs_rq[=
108]:/.min_vruntime
  -3764526 =C2=B1  0%     -35.9%   -2412505 =C2=B1-20%  sched_debug.cfs_rq[=
108]:/.spread0
  -3621586 =C2=B1 -2%     -23.4%   -2774188 =C2=B1 -7%  sched_debug.cfs_rq[=
109]:/.spread0
     17.25 =C2=B1 25%     -36.2%      11.00 =C2=B1 23%  sched_debug.cfs_rq[=
10]:/.load_avg
  -2053233 =C2=B1-43%     -51.5%    -994945 =C2=B1-61%  sched_debug.cfs_rq[=
10]:/.spread0
     17.25 =C2=B1 25%     -36.2%      11.00 =C2=B1 23%  sched_debug.cfs_rq[=
10]:/.tg_load_avg_contrib
  -3753277 =C2=B1  0%     -36.5%   -2382031 =C2=B1-18%  sched_debug.cfs_rq[=
110]:/.spread0
      6278 =C2=B1157%    +389.1%      30704 =C2=B1 39%  sched_debug.cfs_rq[=
111]:/.exec_clock
      0.00 =C2=B1  0%      +Inf%       6.00 =C2=B1 20%  sched_debug.cfs_rq[=
111]:/.load_avg
    229896 =C2=B1131%    +344.9%    1022781 =C2=B1 37%  sched_debug.cfs_rq[=
111]:/.min_vruntime
  -3601405 =C2=B1 -8%     -48.4%   -1856844 =C2=B1-24%  sched_debug.cfs_rq[=
111]:/.spread0
      0.00 =C2=B1  0%      +Inf%       6.00 =C2=B1 20%  sched_debug.cfs_rq[=
111]:/.tg_load_avg_contrib
      1.67 =C2=B1101%  +10235.0%     172.25 =C2=B1  0%  sched_debug.cfs_rq[=
111]:/.util_avg
    737.39 =C2=B1 29%    +726.5%       6094 =C2=B1137%  sched_debug.cfs_rq[=
112]:/.exec_clock
     67404 =C2=B1 35%    +324.5%     286110 =C2=B1 83%  sched_debug.cfs_rq[=
112]:/.min_vruntime
  -3763902 =C2=B1 -1%     -31.1%   -2593520 =C2=B1-15%  sched_debug.cfs_rq[=
112]:/.spread0
  -3486522 =C2=B1 -9%     -26.7%   -2556764 =C2=B1-22%  sched_debug.cfs_rq[=
113]:/.spread0
      1443 =C2=B1 78%    +667.7%      11079 =C2=B1111%  sched_debug.cfs_rq[=
114]:/.exec_clock
  -3740179 =C2=B1 -1%     -33.8%   -2474399 =C2=B1-19%  sched_debug.cfs_rq[=
114]:/.spread0
      1.00 =C2=B1 81%   +8650.0%      87.50 =C2=B1 94%  sched_debug.cfs_rq[=
114]:/.util_avg
  -3696449 =C2=B1 -3%     -34.1%   -2434206 =C2=B1-28%  sched_debug.cfs_rq[=
115]:/.spread0
  -3332046 =C2=B1-11%     -15.3%   -2822306 =C2=B1 -7%  sched_debug.cfs_rq[=
116]:/.spread0
  -3750772 =C2=B1  0%     -27.2%   -2730139 =C2=B1 -5%  sched_debug.cfs_rq[=
117]:/.spread0
    781.26 =C2=B1 27%    +197.5%       2324 =C2=B1 72%  sched_debug.cfs_rq[=
118]:/.exec_clock
     62554 =C2=B1 40%    +131.9%     145063 =C2=B1 37%  sched_debug.cfs_rq[=
118]:/.min_vruntime
  -3768786 =C2=B1 -1%     -27.4%   -2734597 =C2=B1 -9%  sched_debug.cfs_rq[=
118]:/.spread0
     34.00 =C2=B1109%     -99.0%       0.33 =C2=B1141%  sched_debug.cfs_rq[=
118]:/.util_avg
    964.82 =C2=B1 17%    +535.2%       6128 =C2=B1139%  sched_debug.cfs_rq[=
119]:/.exec_clock
  -3743042 =C2=B1 -1%     -29.5%   -2638522 =C2=B1-16%  sched_debug.cfs_rq[=
119]:/.spread0
     33831 =C2=B1 35%    +136.1%      79889 =C2=B1 18%  sched_debug.cfs_rq[=
11]:/.exec_clock
   1598925 =C2=B1 14%     +69.9%    2717005 =C2=B1 13%  sched_debug.cfs_rq[=
11]:/.min_vruntime
      6.00 =C2=B1 65%    +150.0%      15.00 =C2=B1 33%  sched_debug.cfs_rq[=
11]:/.runnable_load_avg
  -2231731 =C2=B1-10%     -92.7%    -161883 =C2=B1-290%  sched_debug.cfs_rq=
[11]:/.spread0
    211.00 =C2=B1 48%    +145.1%     517.25 =C2=B1 30%  sched_debug.cfs_rq[=
11]:/.util_avg
  -1733896 =C2=B1-28%     -95.5%     -78376 =C2=B1-1047%  sched_debug.cfs_r=
q[12]:/.spread0
     30322 =C2=B1 29%    +114.8%      65119 =C2=B1 41%  sched_debug.cfs_rq[=
13]:/.exec_clock
  -2454110 =C2=B1-10%     -75.7%    -597570 =C2=B1-187%  sched_debug.cfs_rq=
[13]:/.spread0
  -2559592 =C2=B1-14%     -62.8%    -952814 =C2=B1-46%  sched_debug.cfs_rq[=
14]:/.spread0
    109741 =C2=B1  2%     -10.9%      97760 =C2=B1  2%  sched_debug.cfs_rq[=
15]:/.exec_clock
   3599873 =C2=B1  5%     -12.0%    3168005 =C2=B1  4%  sched_debug.cfs_rq[=
15]:/.min_vruntime
   -230805 =C2=B1-64%    -225.3%     289094 =C2=B1 42%  sched_debug.cfs_rq[=
15]:/.spread0
    -93388 =C2=B1-171%   -1216.9%    1043029 =C2=B1 44%  sched_debug.cfs_rq=
[16]:/.spread0
  -1052675 =C2=B1-33%    -165.5%     689427 =C2=B1 65%  sched_debug.cfs_rq[=
18]:/.spread0
      1.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.nr_spread_over
  -1248598 =C2=B1-26%     -54.5%    -568164 =C2=B1-71%  sched_debug.cfs_rq[=
21]:/.spread0
     67072 =C2=B1 27%     -82.4%      11829 =C2=B1 54%  sched_debug.cfs_rq[=
22]:/.exec_clock
     10.75 =C2=B1 19%     -53.5%       5.00 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.load
     13.25 =C2=B1 14%     -45.3%       7.25 =C2=B1 24%  sched_debug.cfs_rq[=
22]:/.load_avg
   2526358 =C2=B1 34%     -61.6%     970591 =C2=B1 40%  sched_debug.cfs_rq[=
22]:/.min_vruntime
     11.00 =C2=B1 21%     -56.8%       4.75 =C2=B1  9%  sched_debug.cfs_rq[=
22]:/.runnable_load_avg
     13.25 =C2=B1 14%     -45.3%       7.25 =C2=B1 24%  sched_debug.cfs_rq[=
22]:/.tg_load_avg_contrib
    404.75 =C2=B1 15%     -55.7%     179.25 =C2=B1  8%  sched_debug.cfs_rq[=
22]:/.util_avg
     34903 =C2=B1 43%    +111.9%      73956 =C2=B1  7%  sched_debug.cfs_rq[=
24]:/.exec_clock
   1459089 =C2=B1 37%     +78.7%    2607295 =C2=B1  6%  sched_debug.cfs_rq[=
24]:/.min_vruntime
  -2371657 =C2=B1-21%     -88.5%    -271682 =C2=B1-51%  sched_debug.cfs_rq[=
24]:/.spread0
    114156 =C2=B1 14%     -24.2%      86563 =C2=B1  5%  sched_debug.cfs_rq[=
2]:/.exec_clock
    108423 =C2=B1  6%     -19.3%      87469 =C2=B1 16%  sched_debug.cfs_rq[=
30]:/.exec_clock
     23.25 =C2=B1  9%     -28.0%      16.75 =C2=B1 12%  sched_debug.cfs_rq[=
30]:/.load_avg
   3552781 =C2=B1  5%     -19.5%    2860014 =C2=B1 16%  sched_debug.cfs_rq[=
30]:/.min_vruntime
     23.25 =C2=B1  9%     -28.0%      16.75 =C2=B1 12%  sched_debug.cfs_rq[=
30]:/.tg_load_avg_contrib
    738.50 =C2=B1  8%     -23.7%     563.25 =C2=B1 12%  sched_debug.cfs_rq[=
30]:/.util_avg
   -435993 =C2=B1-87%    -290.1%     828697 =C2=B1 66%  sched_debug.cfs_rq[=
31]:/.spread0
  -1171740 =C2=B1-71%    -119.6%     229420 =C2=B1240%  sched_debug.cfs_rq[=
32]:/.spread0
  -1371768 =C2=B1-44%    -104.5%      61104 =C2=B11230%  sched_debug.cfs_rq=
[33]:/.spread0
    616.00 =C2=B1 16%     -29.3%     435.50 =C2=B1 38%  sched_debug.cfs_rq[=
36]:/.util_avg
     40119 =C2=B1 43%     +65.1%      66221 =C2=B1 18%  sched_debug.cfs_rq[=
38]:/.exec_clock
  -2124064 =C2=B1-28%     -78.3%    -460976 =C2=B1-79%  sched_debug.cfs_rq[=
38]:/.spread0
  -1798066 =C2=B1-18%     -82.6%    -312882 =C2=B1-148%  sched_debug.cfs_rq=
[39]:/.spread0
    114466 =C2=B1  5%     -40.3%      68312 =C2=B1 40%  sched_debug.cfs_rq[=
3]:/.exec_clock
   3814268 =C2=B1  5%     -33.5%    2537783 =C2=B1 32%  sched_debug.cfs_rq[=
3]:/.min_vruntime
    688.00 =C2=B1 15%     -46.4%     369.00 =C2=B1 35%  sched_debug.cfs_rq[=
3]:/.util_avg
  -1624917 =C2=B1-29%     -70.9%    -473178 =C2=B1-168%  sched_debug.cfs_rq=
[41]:/.spread0
     10.75 =C2=B1 31%     -53.5%       5.00 =C2=B1 70%  sched_debug.cfs_rq[=
42]:/.load
    112152 =C2=B1  7%     -28.8%      79900 =C2=B1  5%  sched_debug.cfs_rq[=
45]:/.exec_clock
     27.25 =C2=B1 38%     -67.9%       8.75 =C2=B1 74%  sched_debug.cfs_rq[=
45]:/.load
     23.25 =C2=B1  8%     -52.7%      11.00 =C2=B1 60%  sched_debug.cfs_rq[=
45]:/.load_avg
   3652753 =C2=B1  5%     -24.6%    2754845 =C2=B1  3%  sched_debug.cfs_rq[=
45]:/.min_vruntime
     22.25 =C2=B1 10%     -65.2%       7.75 =C2=B1 73%  sched_debug.cfs_rq[=
45]:/.runnable_load_avg
     23.25 =C2=B1  8%     -52.7%      11.00 =C2=B1 60%  sched_debug.cfs_rq[=
45]:/.tg_load_avg_contrib
    744.75 =C2=B1  9%     -62.0%     283.25 =C2=B1 65%  sched_debug.cfs_rq[=
45]:/.util_avg
    101629 =C2=B1  3%     -44.1%      56764 =C2=B1 13%  sched_debug.cfs_rq[=
46]:/.exec_clock
     20.00 =C2=B1 19%     -51.2%       9.75 =C2=B1 60%  sched_debug.cfs_rq[=
46]:/.load
     21.50 =C2=B1 18%     -50.0%      10.75 =C2=B1 59%  sched_debug.cfs_rq[=
46]:/.load_avg
   3325558 =C2=B1  2%     -36.6%    2107303 =C2=B1 12%  sched_debug.cfs_rq[=
46]:/.min_vruntime
     19.75 =C2=B1 18%     -51.9%       9.50 =C2=B1 60%  sched_debug.cfs_rq[=
46]:/.runnable_load_avg
     21.50 =C2=B1 18%     -50.0%      10.75 =C2=B1 59%  sched_debug.cfs_rq[=
46]:/.tg_load_avg_contrib
    680.50 =C2=B1 18%     -50.8%     335.00 =C2=B1 59%  sched_debug.cfs_rq[=
46]:/.util_avg
     92913 =C2=B1  2%     -35.2%      60227 =C2=B1 38%  sched_debug.cfs_rq[=
47]:/.exec_clock
    730.50 =C2=B1  9%     -48.3%     378.00 =C2=B1 47%  sched_debug.cfs_rq[=
47]:/.util_avg
    100043 =C2=B1  6%     -35.7%      64337 =C2=B1 10%  sched_debug.cfs_rq[=
48]:/.exec_clock
   3482864 =C2=B1  9%     -32.0%    2368231 =C2=B1  9%  sched_debug.cfs_rq[=
48]:/.min_vruntime
    682.50 =C2=B1 15%     -31.2%     469.75 =C2=B1 28%  sched_debug.cfs_rq[=
4]:/.util_avg
  -1795812 =C2=B1-34%     -99.6%      -7570 =C2=B1-10364%  sched_debug.cfs_=
rq[52]:/.spread0
  -1189477 =C2=B1-80%    -101.2%      13908 =C2=B14111%  sched_debug.cfs_rq=
[53]:/.spread0
  -2198387 =C2=B1-28%     -73.4%    -585016 =C2=B1-64%  sched_debug.cfs_rq[=
55]:/.spread0
    272.50 =C2=B1 24%     +46.1%     398.00 =C2=B1  4%  sched_debug.cfs_rq[=
55]:/.util_avg
   1882614 =C2=B1 10%     +30.9%    2464360 =C2=B1  4%  sched_debug.cfs_rq[=
56]:/.min_vruntime
  -1948373 =C2=B1-11%     -78.7%    -414875 =C2=B1-44%  sched_debug.cfs_rq[=
56]:/.spread0
      6.25 =C2=B1 34%    +100.0%      12.50 =C2=B1 20%  sched_debug.cfs_rq[=
57]:/.load
      6.00 =C2=B1 28%    +108.3%      12.50 =C2=B1 20%  sched_debug.cfs_rq[=
57]:/.runnable_load_avg
  -2176925 =C2=B1-24%    -104.0%      86742 =C2=B11111%  sched_debug.cfs_rq=
[57]:/.spread0
    223.00 =C2=B1 33%     +91.1%     426.25 =C2=B1 19%  sched_debug.cfs_rq[=
57]:/.util_avg
  -2261079 =C2=B1-41%     -78.7%    -482338 =C2=B1-65%  sched_debug.cfs_rq[=
58]:/.spread0
  -1954361 =C2=B1-42%     -78.4%    -421282 =C2=B1-115%  sched_debug.cfs_rq=
[59]:/.spread0
     94715 =C2=B1  3%     -34.4%      62135 =C2=B1 26%  sched_debug.cfs_rq[=
5]:/.exec_clock
     17.50 =C2=B1 21%     -57.1%       7.50 =C2=B1 33%  sched_debug.cfs_rq[=
5]:/.load
   3311193 =C2=B1  9%     -27.7%    2394814 =C2=B1 23%  sched_debug.cfs_rq[=
5]:/.min_vruntime
    632.25 =C2=B1 24%     -59.1%     258.75 =C2=B1 33%  sched_debug.cfs_rq[=
5]:/.util_avg
      0.33 =C2=B1141%   +2900.0%      10.00 =C2=B1 66%  sched_debug.cfs_rq[=
60]:/.load_avg
  -3742126 =C2=B1  0%     -36.8%   -2365254 =C2=B1-24%  sched_debug.cfs_rq[=
60]:/.spread0
      0.33 =C2=B1141%   +2900.0%      10.00 =C2=B1 66%  sched_debug.cfs_rq[=
60]:/.tg_load_avg_contrib
  -3554476 =C2=B1 -7%     -21.3%   -2796294 =C2=B1 -9%  sched_debug.cfs_rq[=
61]:/.spread0
  -3612954 =C2=B1 -6%     -28.9%   -2568207 =C2=B1-16%  sched_debug.cfs_rq[=
63]:/.spread0
  -3759598 =C2=B1 -1%     -34.4%   -2464987 =C2=B1-15%  sched_debug.cfs_rq[=
65]:/.spread0
    980.95 =C2=B1 17%   +2645.6%      26932 =C2=B1 60%  sched_debug.cfs_rq[=
66]:/.exec_clock
    105444 =C2=B1 34%    +751.5%     897829 =C2=B1 57%  sched_debug.cfs_rq[=
66]:/.min_vruntime
  -3725607 =C2=B1 -1%     -46.8%   -1981493 =C2=B1-23%  sched_debug.cfs_rq[=
66]:/.spread0
  -3656770 =C2=B1 -3%     -31.5%   -2503974 =C2=B1-10%  sched_debug.cfs_rq[=
67]:/.spread0
  -3680625 =C2=B1 -3%     -39.5%   -2226211 =C2=B1-55%  sched_debug.cfs_rq[=
68]:/.spread0
  -3594149 =C2=B1 -5%     -22.2%   -2795647 =C2=B1 -7%  sched_debug.cfs_rq[=
69]:/.spread0
    451.25 =C2=B1 29%     -50.7%     222.25 =C2=B1 55%  sched_debug.cfs_rq[=
6]:/.util_avg
  -3731439 =C2=B1  0%     -30.3%   -2601216 =C2=B1-15%  sched_debug.cfs_rq[=
71]:/.spread0
      1121 =C2=B1 22%     -27.4%     814.73 =C2=B1 17%  sched_debug.cfs_rq[=
72]:/.exec_clock
    128857 =C2=B1 49%     -54.6%      58446 =C2=B1  9%  sched_debug.cfs_rq[=
72]:/.min_vruntime
  -3702229 =C2=B1  0%     -23.8%   -2820926 =C2=B1 -7%  sched_debug.cfs_rq[=
72]:/.spread0
  -3669791 =C2=B1 -3%     -25.3%   -2740420 =C2=B1-12%  sched_debug.cfs_rq[=
73]:/.spread0
  -3674440 =C2=B1 -4%     -24.1%   -2788078 =C2=B1-10%  sched_debug.cfs_rq[=
74]:/.spread0
  -3770001 =C2=B1  0%     -27.8%   -2721945 =C2=B1-13%  sched_debug.cfs_rq[=
75]:/.spread0
      3.50 =C2=B1 58%   +4264.3%     152.75 =C2=B1 86%  sched_debug.cfs_rq[=
75]:/.util_avg
  -3736543 =C2=B1  0%     -25.8%   -2771201 =C2=B1 -9%  sched_debug.cfs_rq[=
76]:/.spread0
    734.97 =C2=B1 63%   +1526.6%      11954 =C2=B1 90%  sched_debug.cfs_rq[=
78]:/.exec_clock
  -3772623 =C2=B1  0%     -34.7%   -2462353 =C2=B1-23%  sched_debug.cfs_rq[=
78]:/.spread0
  -3552096 =C2=B1 -6%     -38.4%   -2187150 =C2=B1-30%  sched_debug.cfs_rq[=
79]:/.spread0
     63492 =C2=B1 10%     -22.1%      49436 =C2=B1 13%  sched_debug.cfs_rq[=
7]:/.exec_clock
   2387489 =C2=B1 14%     -21.1%    1883110 =C2=B1 16%  sched_debug.cfs_rq[=
7]:/.min_vruntime
  -3751786 =C2=B1 -1%     -26.6%   -2754141 =C2=B1 -5%  sched_debug.cfs_rq[=
80]:/.spread0
  -3554010 =C2=B1 -6%     -21.4%   -2792868 =C2=B1 -6%  sched_debug.cfs_rq[=
81]:/.spread0
  -3632345 =C2=B1 -6%     -28.9%   -2581916 =C2=B1-14%  sched_debug.cfs_rq[=
86]:/.spread0
  -3760781 =C2=B1  0%     -43.9%   -2111066 =C2=B1-31%  sched_debug.cfs_rq[=
87]:/.spread0
     26902 =C2=B1 64%     -74.7%       6797 =C2=B1163%  sched_debug.cfs_rq[=
88]:/.exec_clock
    884822 =C2=B1 59%     -72.3%     244816 =C2=B1150%  sched_debug.cfs_rq[=
88]:/.min_vruntime
  -3666833 =C2=B1 -3%     -29.3%   -2591895 =C2=B1-21%  sched_debug.cfs_rq[=
89]:/.spread0
  -3552123 =C2=B1 -6%     -36.1%   -2270416 =C2=B1-23%  sched_debug.cfs_rq[=
90]:/.spread0
  -3734940 =C2=B1 -1%     -26.2%   -2755171 =C2=B1-10%  sched_debug.cfs_rq[=
91]:/.spread0
    655826 =C2=B1 83%     -91.1%      58454 =C2=B1 31%  sched_debug.cfs_rq[=
93]:/.min_vruntime
      1479 =C2=B1 11%     -19.0%       1198 =C2=B1 14%  sched_debug.cfs_rq[=
93]:/.tg_load_avg
     87.25 =C2=B1 96%     -98.6%       1.25 =C2=B1 66%  sched_debug.cfs_rq[=
94]:/.util_avg
     35140 =C2=B1 37%     -98.7%     444.99 =C2=B1 54%  sched_debug.cfs_rq[=
95]:/.exec_clock
   1158811 =C2=B1 34%     -96.8%      37162 =C2=B1 63%  sched_debug.cfs_rq[=
95]:/.min_vruntime
  -3744235 =C2=B1  0%     -35.4%   -2417077 =C2=B1-18%  sched_debug.cfs_rq[=
96]:/.spread0
  -3403276 =C2=B1-13%     -17.3%   -2814514 =C2=B1 -7%  sched_debug.cfs_rq[=
97]:/.spread0
    633334 =C2=B1 52%     -81.4%     117729 =C2=B1 62%  sched_debug.cfs_rq[=
98]:/.min_vruntime
  -3197900 =C2=B1 -9%     -13.6%   -2761812 =C2=B1 -6%  sched_debug.cfs_rq[=
98]:/.spread0
  -3375824 =C2=B1 -6%     -18.2%   -2760505 =C2=B1 -8%  sched_debug.cfs_rq[=
99]:/.spread0
      8.75 =C2=B1 16%     +65.7%      14.50 =C2=B1 20%  sched_debug.cfs_rq[=
9]:/.load_avg
  -2128634 =C2=B1-31%     -80.4%    -416709 =C2=B1-118%  sched_debug.cfs_rq=
[9]:/.spread0
      8.75 =C2=B1 16%     +65.7%      14.50 =C2=B1 20%  sched_debug.cfs_rq[=
9]:/.tg_load_avg_contrib
    225.50 =C2=B1 41%     +87.3%     422.25 =C2=B1 21%  sched_debug.cfs_rq[=
9]:/.util_avg
    122178 =C2=B1  2%     -23.0%      94103 =C2=B1  6%  sched_debug.cpu#0.n=
r_load_updates
      7369 =C2=B1 22%     -42.4%       4245 =C2=B1 23%  sched_debug.cpu#10.=
ttwu_count
    924.50 =C2=B1 59%     +78.6%       1650 =C2=B1 32%  sched_debug.cpu#104=
.ttwu_count
    675.50 =C2=B1 12%     +85.4%       1252 =C2=B1 26%  sched_debug.cpu#105=
.nr_switches
    676.00 =C2=B1 12%     +85.5%       1253 =C2=B1 26%  sched_debug.cpu#105=
.sched_count
    287.50 =C2=B1  9%     +89.2%     544.00 =C2=B1 27%  sched_debug.cpu#105=
.sched_goidle
    431.50 =C2=B1 71%    +457.5%       2405 =C2=B1 86%  sched_debug.cpu#105=
.ttwu_count
    134.75 =C2=B1 12%    +157.9%     347.50 =C2=B1 35%  sched_debug.cpu#105=
.ttwu_local
     43808 =C2=B1  5%     +55.4%      68059 =C2=B1 16%  sched_debug.cpu#106=
.nr_load_updates
    423.75 =C2=B1 24%    +808.6%       3850 =C2=B1 80%  sched_debug.cpu#106=
.ttwu_count
     55428 =C2=B1 14%     -23.5%      42409 =C2=B1  9%  sched_debug.cpu#107=
.nr_load_updates
    673.75 =C2=B1 26%    +297.4%       2677 =C2=B1 92%  sched_debug.cpu#107=
.nr_switches
      2.75 =C2=B1 82%      -9.1%       2.50 =C2=B1142%  sched_debug.cpu#107=
.nr_uninterruptible
    675.00 =C2=B1 26%    +296.9%       2679 =C2=B1 92%  sched_debug.cpu#107=
.sched_count
    286.75 =C2=B1 26%    +334.6%       1246 =C2=B1 99%  sched_debug.cpu#107=
.sched_goidle
    714.00 =C2=B1  5%     +89.0%       1349 =C2=B1 51%  sched_debug.cpu#108=
.nr_switches
    714.75 =C2=B1  4%     +88.9%       1350 =C2=B1 51%  sched_debug.cpu#108=
.sched_count
    308.25 =C2=B1  5%     +92.8%     594.25 =C2=B1 57%  sched_debug.cpu#108=
.sched_goidle
    364.00 =C2=B1 46%    +169.8%     982.25 =C2=B1 33%  sched_debug.cpu#108=
.ttwu_count
    150.75 =C2=B1 14%     +54.2%     232.50 =C2=B1 11%  sched_debug.cpu#108=
.ttwu_local
      6.00 =C2=B1 65%    +150.0%      15.00 =C2=B1 33%  sched_debug.cpu#11.=
cpu_load[0]
      6.00 =C2=B1 65%    +150.0%      15.00 =C2=B1 33%  sched_debug.cpu#11.=
cpu_load[1]
      6.00 =C2=B1 65%    +150.0%      15.00 =C2=B1 33%  sched_debug.cpu#11.=
cpu_load[2]
      5.75 =C2=B1 65%    +160.9%      15.00 =C2=B1 33%  sched_debug.cpu#11.=
cpu_load[3]
      5.75 =C2=B1 65%    +160.9%      15.00 =C2=B1 33%  sched_debug.cpu#11.=
cpu_load[4]
    933.00 =C2=B1 64%    +218.0%       2966 =C2=B1 41%  sched_debug.cpu#11.=
curr->pid
     74672 =C2=B1 10%     +39.5%     104165 =C2=B1  9%  sched_debug.cpu#11.=
nr_load_updates
     23887 =C2=B1 35%     -60.2%       9514 =C2=B1 55%  sched_debug.cpu#11.=
nr_switches
     23935 =C2=B1 34%     -60.2%       9517 =C2=B1 55%  sched_debug.cpu#11.=
sched_count
     11797 =C2=B1 35%     -60.5%       4657 =C2=B1 56%  sched_debug.cpu#11.=
sched_goidle
    617.00 =C2=B1 14%    +285.7%       2379 =C2=B1 91%  sched_debug.cpu#110=
.nr_switches
    618.00 =C2=B1 14%    +285.2%       2380 =C2=B1 91%  sched_debug.cpu#110=
.sched_count
    260.75 =C2=B1 11%    +333.4%       1130 =C2=B1 95%  sched_debug.cpu#110=
.sched_goidle
    242.75 =C2=B1 25%    +494.5%       1443 =C2=B1 90%  sched_debug.cpu#110=
.ttwu_count
    135.00 =C2=B1 18%     +53.9%     207.75 =C2=B1 13%  sched_debug.cpu#110=
.ttwu_local
    985570 =C2=B1  1%     -13.1%     856012 =C2=B1  1%  sched_debug.cpu#111=
.avg_idle
     45139 =C2=B1 17%     +43.1%      64592 =C2=B1 14%  sched_debug.cpu#111=
.nr_load_updates
    378.00 =C2=B1 77%    +464.0%       2132 =C2=B1 38%  sched_debug.cpu#111=
.ttwu_count
    740.50 =C2=B1 25%    +181.4%       2084 =C2=B1 87%  sched_debug.cpu#112=
.nr_switches
    741.50 =C2=B1 25%    +181.3%       2085 =C2=B1 87%  sched_debug.cpu#112=
.sched_count
    313.75 =C2=B1 27%    +203.7%     952.75 =C2=B1 96%  sched_debug.cpu#112=
.sched_goidle
    733.25 =C2=B1 41%     +84.6%       1353 =C2=B1 36%  sched_debug.cpu#115=
.nr_switches
    734.25 =C2=B1 41%     +84.5%       1354 =C2=B1 36%  sched_debug.cpu#115=
.sched_count
    322.00 =C2=B1 40%     +86.8%     601.50 =C2=B1 40%  sched_debug.cpu#115=
.sched_goidle
    808.50 =C2=B1 15%    +416.0%       4171 =C2=B1 57%  sched_debug.cpu#118=
.nr_switches
      1004 =C2=B1 34%    +315.4%       4173 =C2=B1 57%  sched_debug.cpu#118=
.sched_count
    348.25 =C2=B1 15%    +471.2%       1989 =C2=B1 60%  sched_debug.cpu#118=
.sched_goidle
     15394 =C2=B1 20%     -64.2%       5513 =C2=B1 60%  sched_debug.cpu#12.=
nr_switches
     15483 =C2=B1 20%     -64.4%       5515 =C2=B1 60%  sched_debug.cpu#12.=
sched_count
      7564 =C2=B1 21%     -64.8%       2665 =C2=B1 62%  sched_debug.cpu#12.=
sched_goidle
      7731 =C2=B1 19%     -32.4%       5229 =C2=B1 38%  sched_debug.cpu#12.=
ttwu_count
    782.75 =C2=B1 11%     -43.9%     438.75 =C2=B1  4%  sched_debug.cpu#12.=
ttwu_local
      1002 =C2=B1  5%     -62.6%     374.75 =C2=B1 25%  sched_debug.cpu#13.=
ttwu_local
     -0.25 =C2=B1-591%   +1500.0%      -4.00 =C2=B1-35%  sched_debug.cpu#14=
.nr_uninterruptible
    795.75 =C2=B1  9%     -46.3%     427.00 =C2=B1  9%  sched_debug.cpu#14.=
ttwu_local
     -3.00 =C2=B1-81%    -141.7%       1.25 =C2=B1228%  sched_debug.cpu#17.=
nr_uninterruptible
      4479 =C2=B1 30%     +29.2%       5787 =C2=B1 17%  sched_debug.cpu#18.=
ttwu_count
    335.00 =C2=B1 35%     -41.0%     197.50 =C2=B1 19%  sched_debug.cpu#18.=
ttwu_local
      9528 =C2=B1 57%    +159.3%      24709 =C2=B1 50%  sched_debug.cpu#2.n=
r_switches
      9621 =C2=B1 57%    +156.9%      24713 =C2=B1 50%  sched_debug.cpu#2.s=
ched_count
      4569 =C2=B1 60%    +167.5%      12220 =C2=B1 50%  sched_debug.cpu#2.s=
ched_goidle
      5817 =C2=B1  9%     +61.1%       9374 =C2=B1 29%  sched_debug.cpu#2.t=
twu_count
     11.00 =C2=B1 21%     -56.8%       4.75 =C2=B1  9%  sched_debug.cpu#22.=
cpu_load[0]
     11.00 =C2=B1 21%     -56.8%       4.75 =C2=B1  9%  sched_debug.cpu#22.=
cpu_load[1]
     11.00 =C2=B1 21%     -56.8%       4.75 =C2=B1  9%  sched_debug.cpu#22.=
cpu_load[2]
     11.00 =C2=B1 21%     -56.8%       4.75 =C2=B1  9%  sched_debug.cpu#22.=
cpu_load[3]
     11.00 =C2=B1 21%     -56.8%       4.75 =C2=B1  9%  sched_debug.cpu#22.=
cpu_load[4]
      2778 =C2=B1 10%     -61.6%       1066 =C2=B1 43%  sched_debug.cpu#22.=
curr->pid
     10.75 =C2=B1 19%     -53.5%       5.00 =C2=B1  0%  sched_debug.cpu#22.=
load
     96429 =C2=B1 15%     -39.1%      58700 =C2=B1 10%  sched_debug.cpu#22.=
nr_load_updates
    281.75 =C2=B1 28%    +119.5%     618.50 =C2=B1 23%  sched_debug.cpu#22.=
ttwu_local
    842.75 =C2=B1 89%    +267.5%       3097 =C2=B1 44%  sched_debug.cpu#23.=
curr->pid
     72493 =C2=B1 15%     +39.1%     100851 =C2=B1  3%  sched_debug.cpu#24.=
nr_load_updates
     20.00 =C2=B1 17%     -45.0%      11.00 =C2=B1 45%  sched_debug.cpu#3.c=
pu_load[1]
     20.00 =C2=B1 17%     -45.0%      11.00 =C2=B1 45%  sched_debug.cpu#3.c=
pu_load[2]
     20.00 =C2=B1 17%     -46.2%      10.75 =C2=B1 43%  sched_debug.cpu#3.c=
pu_load[3]
     20.00 =C2=B1 17%     -46.2%      10.75 =C2=B1 43%  sched_debug.cpu#3.c=
pu_load[4]
      4116 =C2=B1 16%     -48.0%       2142 =C2=B1 59%  sched_debug.cpu#3.c=
urr->pid
    127716 =C2=B1  3%     -26.1%      94370 =C2=B1 23%  sched_debug.cpu#3.n=
r_load_updates
    985032 =C2=B1  1%     -13.4%     852699 =C2=B1  5%  sched_debug.cpu#32.=
avg_idle
    253.25 =C2=B1 18%     +72.4%     436.50 =C2=B1 18%  sched_debug.cpu#35.=
ttwu_local
      3857 =C2=B1 13%     -36.0%       2470 =C2=B1 39%  sched_debug.cpu#36.=
curr->pid
      4029 =C2=B1 14%     -36.4%       2563 =C2=B1 35%  sched_debug.cpu#4.c=
urr->pid
     10.75 =C2=B1 31%     -53.5%       5.00 =C2=B1 70%  sched_debug.cpu#42.=
load
     22.25 =C2=B1 10%     -65.2%       7.75 =C2=B1 73%  sched_debug.cpu#45.=
cpu_load[0]
     22.25 =C2=B1 10%     -65.2%       7.75 =C2=B1 73%  sched_debug.cpu#45.=
cpu_load[1]
     22.25 =C2=B1 10%     -65.2%       7.75 =C2=B1 73%  sched_debug.cpu#45.=
cpu_load[2]
     22.25 =C2=B1 10%     -65.2%       7.75 =C2=B1 73%  sched_debug.cpu#45.=
cpu_load[3]
     22.25 =C2=B1 10%     -65.2%       7.75 =C2=B1 73%  sched_debug.cpu#45.=
cpu_load[4]
      4517 =C2=B1  7%     -63.5%       1650 =C2=B1 91%  sched_debug.cpu#45.=
curr->pid
     27.25 =C2=B1 38%     -67.9%       8.75 =C2=B1 74%  sched_debug.cpu#45.=
load
    126272 =C2=B1  4%     -17.7%     103981 =C2=B1  2%  sched_debug.cpu#45.=
nr_load_updates
      2986 =C2=B1 50%    +268.2%      10993 =C2=B1 12%  sched_debug.cpu#45.=
nr_switches
      3060 =C2=B1 46%    +259.3%      10997 =C2=B1 12%  sched_debug.cpu#45.=
sched_count
      1349 =C2=B1 56%    +295.6%       5336 =C2=B1 13%  sched_debug.cpu#45.=
sched_goidle
      4670 =C2=B1  3%     +18.0%       5508 =C2=B1  6%  sched_debug.cpu#45.=
ttwu_count
    229.25 =C2=B1 11%     +90.9%     437.75 =C2=B1 16%  sched_debug.cpu#45.=
ttwu_local
     19.75 =C2=B1 18%     -55.7%       8.75 =C2=B1 62%  sched_debug.cpu#46.=
cpu_load[0]
     19.75 =C2=B1 18%     -55.7%       8.75 =C2=B1 62%  sched_debug.cpu#46.=
cpu_load[1]
     19.75 =C2=B1 18%     -54.4%       9.00 =C2=B1 61%  sched_debug.cpu#46.=
cpu_load[2]
     19.75 =C2=B1 18%     -54.4%       9.00 =C2=B1 61%  sched_debug.cpu#46.=
cpu_load[3]
     19.75 =C2=B1 18%     -55.7%       8.75 =C2=B1 62%  sched_debug.cpu#46.=
cpu_load[4]
     21.50 =C2=B1 12%     -54.7%       9.75 =C2=B1 60%  sched_debug.cpu#46.=
load
    118521 =C2=B1  1%     -25.9%      87824 =C2=B1  6%  sched_debug.cpu#46.=
nr_load_updates
      3312 =C2=B1 57%    +310.0%      13580 =C2=B1 52%  sched_debug.cpu#46.=
nr_switches
      3392 =C2=B1 54%    +300.5%      13585 =C2=B1 52%  sched_debug.cpu#46.=
sched_count
      1508 =C2=B1 62%    +339.1%       6624 =C2=B1 54%  sched_debug.cpu#46.=
sched_goidle
     21.75 =C2=B1  9%     -46.0%      11.75 =C2=B1 45%  sched_debug.cpu#47.=
cpu_load[4]
      4444 =C2=B1 12%     -49.7%       2235 =C2=B1 50%  sched_debug.cpu#47.=
curr->pid
    112219 =C2=B1  1%     -18.9%      91025 =C2=B1 18%  sched_debug.cpu#47.=
nr_load_updates
      3516 =C2=B1 60%    +371.4%      16575 =C2=B1 32%  sched_debug.cpu#47.=
nr_switches
      3560 =C2=B1 59%    +365.7%      16580 =C2=B1 32%  sched_debug.cpu#47.=
sched_count
      1631 =C2=B1 65%    +400.6%       8168 =C2=B1 33%  sched_debug.cpu#47.=
sched_goidle
      3937 =C2=B1 14%     +62.5%       6398 =C2=B1 20%  sched_debug.cpu#47.=
ttwu_count
    191.00 =C2=B1 18%    +189.0%     552.00 =C2=B1 14%  sched_debug.cpu#47.=
ttwu_local
    119687 =C2=B1  4%     -21.9%      93518 =C2=B1  5%  sched_debug.cpu#48.=
nr_load_updates
      2246 =C2=B1 83%    +352.0%      10153 =C2=B1 74%  sched_debug.cpu#49.=
sched_goidle
    197.75 =C2=B1 21%     +82.4%     360.75 =C2=B1 47%  sched_debug.cpu#49.=
ttwu_local
      4103 =C2=B1 26%     -63.9%       1482 =C2=B1 44%  sched_debug.cpu#5.c=
urr->pid
     18.25 =C2=B1 24%     -58.9%       7.50 =C2=B1 33%  sched_debug.cpu#5.l=
oad
    113195 =C2=B1  4%     -21.4%      88966 =C2=B1 12%  sched_debug.cpu#5.n=
r_load_updates
    255.75 =C2=B1 29%     +37.4%     351.50 =C2=B1 22%  sched_debug.cpu#50.=
ttwu_local
      1848 =C2=B1 43%     +65.1%       3051 =C2=B1 35%  sched_debug.cpu#54.=
curr->pid
    257.75 =C2=B1 20%     +37.3%     354.00 =C2=B1 23%  sched_debug.cpu#54.=
ttwu_local
      3400 =C2=B1 25%     +67.6%       5698 =C2=B1 41%  sched_debug.cpu#55.=
ttwu_count
     82247 =C2=B1  3%     +12.2%      92289 =C2=B1  2%  sched_debug.cpu#56.=
nr_load_updates
      7470 =C2=B1118%    +216.4%      23636 =C2=B1 41%  sched_debug.cpu#56.=
nr_switches
      7527 =C2=B1117%    +214.0%      23638 =C2=B1 41%  sched_debug.cpu#56.=
sched_count
      3652 =C2=B1121%    +220.7%      11713 =C2=B1 41%  sched_debug.cpu#56.=
sched_goidle
      2864 =C2=B1 16%    +137.4%       6799 =C2=B1 50%  sched_debug.cpu#56.=
ttwu_count
      6.00 =C2=B1 28%    +108.3%      12.50 =C2=B1 20%  sched_debug.cpu#57.=
cpu_load[0]
      6.00 =C2=B1 28%    +108.3%      12.50 =C2=B1 20%  sched_debug.cpu#57.=
cpu_load[1]
      6.00 =C2=B1 28%    +108.3%      12.50 =C2=B1 20%  sched_debug.cpu#57.=
cpu_load[2]
      6.00 =C2=B1 28%    +108.3%      12.50 =C2=B1 20%  sched_debug.cpu#57.=
cpu_load[3]
      6.00 =C2=B1 28%    +108.3%      12.50 =C2=B1 20%  sched_debug.cpu#57.=
cpu_load[4]
      6.25 =C2=B1 34%    +100.0%      12.50 =C2=B1 20%  sched_debug.cpu#57.=
load
      2554 =C2=B1 28%     +94.0%       4955 =C2=B1 32%  sched_debug.cpu#57.=
ttwu_count
      4928 =C2=B1 54%    +373.3%      23326 =C2=B1 39%  sched_debug.cpu#58.=
nr_switches
      4962 =C2=B1 54%    +370.1%      23328 =C2=B1 39%  sched_debug.cpu#58.=
sched_count
      2388 =C2=B1 56%    +384.7%      11576 =C2=B1 39%  sched_debug.cpu#58.=
sched_goidle
      2382 =C2=B1 50%    +168.0%       6385 =C2=B1 30%  sched_debug.cpu#58.=
ttwu_count
      2857 =C2=B1 30%     -45.9%       1544 =C2=B1 66%  sched_debug.cpu#6.c=
urr->pid
      3210 =C2=B1 42%     -74.7%     813.50 =C2=B1 32%  sched_debug.cpu#61.=
nr_switches
      4.00 =C2=B1 77%    -100.0%       0.00 =C2=B1  1%  sched_debug.cpu#61.=
nr_uninterruptible
      3212 =C2=B1 42%     -74.6%     815.25 =C2=B1 32%  sched_debug.cpu#61.=
sched_count
      1485 =C2=B1 46%     -76.2%     353.50 =C2=B1 36%  sched_debug.cpu#61.=
sched_goidle
    645.00 =C2=B1 24%     +97.9%       1276 =C2=B1 23%  sched_debug.cpu#62.=
nr_switches
    645.50 =C2=B1 24%     +97.9%       1277 =C2=B1 23%  sched_debug.cpu#62.=
sched_count
    277.00 =C2=B1 24%    +107.7%     575.25 =C2=B1 25%  sched_debug.cpu#62.=
sched_goidle
    142.25 =C2=B1 29%     +55.5%     221.25 =C2=B1 21%  sched_debug.cpu#62.=
ttwu_local
     43304 =C2=B1  1%     +44.5%      62557 =C2=B1 19%  sched_debug.cpu#66.=
nr_load_updates
      1942 =C2=B1 59%     -65.9%     662.50 =C2=B1 27%  sched_debug.cpu#68.=
nr_switches
      1943 =C2=B1 59%     -65.9%     662.75 =C2=B1 27%  sched_debug.cpu#68.=
sched_count
    871.75 =C2=B1 63%     -66.4%     292.75 =C2=B1 27%  sched_debug.cpu#68.=
sched_goidle
      2863 =C2=B1100%     -68.4%     905.75 =C2=B1121%  sched_debug.cpu#68.=
ttwu_count
    304.25 =C2=B1 11%     -48.9%     155.50 =C2=B1 47%  sched_debug.cpu#68.=
ttwu_local
      3742 =C2=B1 63%     -70.0%       1122 =C2=B1 17%  sched_debug.cpu#69.=
nr_switches
      3743 =C2=B1 63%     -70.0%       1123 =C2=B1 17%  sched_debug.cpu#69.=
sched_count
      1767 =C2=B1 67%     -72.4%     488.50 =C2=B1 16%  sched_debug.cpu#69.=
sched_goidle
    338.75 =C2=B1  8%     -34.8%     221.00 =C2=B1 27%  sched_debug.cpu#69.=
ttwu_local
      6904 =C2=B1 20%     -37.2%       4338 =C2=B1 23%  sched_debug.cpu#7.t=
twu_count
      3540 =C2=B1 48%     -75.2%     877.00 =C2=B1 86%  sched_debug.cpu#70.=
ttwu_count
    545.75 =C2=B1 73%     -63.3%     200.50 =C2=B1 30%  sched_debug.cpu#70.=
ttwu_local
      1629 =C2=B1 14%     -50.8%     801.75 =C2=B1 39%  sched_debug.cpu#71.=
nr_switches
      1822 =C2=B1 27%     -56.0%     802.00 =C2=B1 39%  sched_debug.cpu#71.=
sched_count
    701.50 =C2=B1 14%     -49.4%     355.00 =C2=B1 38%  sched_debug.cpu#71.=
sched_goidle
    335.25 =C2=B1 21%     -52.0%     161.00 =C2=B1 35%  sched_debug.cpu#71.=
ttwu_local
      2889 =C2=B1 72%     -68.4%     914.25 =C2=B1 16%  sched_debug.cpu#72.=
nr_switches
      2889 =C2=B1 72%     -68.3%     915.25 =C2=B1 16%  sched_debug.cpu#72.=
sched_count
      1351 =C2=B1 77%     -69.8%     408.75 =C2=B1 15%  sched_debug.cpu#72.=
sched_goidle
      1367 =C2=B1 15%     -36.3%     871.25 =C2=B1 25%  sched_debug.cpu#73.=
nr_switches
      1368 =C2=B1 15%     -36.3%     872.00 =C2=B1 25%  sched_debug.cpu#73.=
sched_count
    595.25 =C2=B1 15%     -34.8%     388.25 =C2=B1 29%  sched_debug.cpu#73.=
sched_goidle
      4466 =C2=B1104%     -88.9%     497.75 =C2=B1 21%  sched_debug.cpu#73.=
ttwu_count
      2033 =C2=B1 20%     -55.1%     913.75 =C2=B1 33%  sched_debug.cpu#74.=
nr_switches
      2034 =C2=B1 20%     -55.1%     914.50 =C2=B1 33%  sched_debug.cpu#74.=
sched_count
    887.00 =C2=B1 25%     -54.1%     407.25 =C2=B1 33%  sched_debug.cpu#74.=
sched_goidle
    536.75 =C2=B1 47%     -63.2%     197.75 =C2=B1 26%  sched_debug.cpu#74.=
ttwu_local
    355.00 =C2=B1 21%     -25.7%     263.75 =C2=B1  3%  sched_debug.cpu#77.=
sched_goidle
     42672 =C2=B1  1%     +20.1%      51258 =C2=B1 15%  sched_debug.cpu#78.=
nr_load_updates
     30851 =C2=B1 46%     -73.6%       8131 =C2=B1 83%  sched_debug.cpu#8.n=
r_switches
      1.50 =C2=B1300%    -400.0%      -4.50 =C2=B1-24%  sched_debug.cpu#8.n=
r_uninterruptible
     30940 =C2=B1 46%     -73.7%       8134 =C2=B1 82%  sched_debug.cpu#8.s=
ched_count
     15271 =C2=B1 46%     -74.0%       3967 =C2=B1 84%  sched_debug.cpu#8.s=
ched_goidle
      0.75 =C2=B1404%     -66.7%       0.25 =C2=B1331%  sched_debug.cpu#83.=
nr_uninterruptible
     62144 =C2=B1 20%     -23.7%      47431 =C2=B1 17%  sched_debug.cpu#88.=
nr_load_updates
      3349 =C2=B1 60%     -76.1%     799.00 =C2=B1 25%  sched_debug.cpu#89.=
nr_switches
      3.75 =C2=B1 22%     -86.7%       0.50 =C2=B1100%  sched_debug.cpu#89.=
nr_uninterruptible
      3350 =C2=B1 60%     -76.1%     799.25 =C2=B1 25%  sched_debug.cpu#89.=
sched_count
      1579 =C2=B1 66%     -78.1%     346.50 =C2=B1 22%  sched_debug.cpu#89.=
sched_goidle
      5.00 =C2=B1 56%    +135.0%      11.75 =C2=B1 29%  sched_debug.cpu#9.c=
pu_load[2]
      5.00 =C2=B1 56%    +145.0%      12.25 =C2=B1 22%  sched_debug.cpu#9.c=
pu_load[3]
      4.75 =C2=B1 67%    +163.2%      12.50 =C2=B1 20%  sched_debug.cpu#9.c=
pu_load[4]
      7871 =C2=B1 17%     -39.6%       4756 =C2=B1 22%  sched_debug.cpu#9.t=
twu_count
      1391 =C2=B1 55%     -58.6%     576.50 =C2=B1 11%  sched_debug.cpu#9.t=
twu_local
    142.50 =C2=B1 15%    +122.6%     317.25 =C2=B1 66%  sched_debug.cpu#90.=
ttwu_local
     55305 =C2=B1 21%     -22.6%      42803 =C2=B1  0%  sched_debug.cpu#93.=
nr_load_updates
     67974 =C2=B1 14%     -37.5%      42516 =C2=B1  0%  sched_debug.cpu#95.=
nr_load_updates
      4.00 =C2=B1 30%     -75.0%       1.00 =C2=B1 70%  sched_debug.cpu#95.=
nr_uninterruptible
    299.50 =C2=B1 15%     +28.9%     386.00 =C2=B1  9%  sched_debug.cpu#95.=
sched_goidle
      3575 =C2=B1 72%     -89.5%     373.75 =C2=B1  9%  sched_debug.cpu#95.=
ttwu_count
    153.75 =C2=B1 12%     +36.6%     210.00 =C2=B1 11%  sched_debug.cpu#95.=
ttwu_local
     41155 =C2=B1  4%     +24.5%      51234 =C2=B1 16%  sched_debug.cpu#96.=
nr_load_updates
    353.25 =C2=B1 46%    +625.9%       2564 =C2=B1 42%  sched_debug.cpu#96.=
ttwu_count
     48865 =C2=B1 11%     -10.2%      43872 =C2=B1  4%  sched_debug.cpu#98.=
nr_load_updates


brickland1: Brickland Ivy Bridge-EX
Memory: 128G




                             pigz.time.minor_page_faults

  700000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  600000 ++  .*..                 .*        .*..               *..         =
 |
         *..*                .*.*.  +  .*..*    *.*..*.*..    +   *.       =
 |
  500000 ++      *.*..*.*..*.        *.                   *..*      *..*   =
 |
         |                                                                 =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  100000 O+ O O  O O  O O  O  O O  O O  O  O O  O O  O O  O  O O  O O  O O =
 O
         |                                                                 =
 |
       0 ++----------------------------------------------------------------=
-+


                               time.minor_page_faults

  700000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  600000 ++  .*..                 .*        .*..               *..         =
 |
         *..*                .*.*.  +  .*..*    *.*..*.*..    +   *.       =
 |
  500000 ++      *.*..*.*..*.        *.                   *..*      *..*   =
 |
         |                                                                 =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  100000 O+ O O  O O  O O  O  O O  O O  O  O O  O O  O O  O  O O  O O  O O =
 O
         |                                                                 =
 |
       0 ++----------------------------------------------------------------=
-+


                                  vmstat.system.in

  51000 ++-----------------------------------------------------------------=
-+
        |   .*..*              .*.*..            .*.  .*..                 =
 |
  50000 *+.*     +  .*..*.*..*.      *.     .*.*.   *.    *.*..*..*.*..*   =
 |
  49000 ++        *.                   *..*.                               =
 |
        |                                                                  =
 |
  48000 ++                                                                 =
 |
        |                                                                  =
 |
  47000 ++                                                                 =
 |
        |                                                                  =
 |
  46000 ++                                                                 =
 |
  45000 ++                                                                 =
 |
        |                                                                  =
 |
  44000 ++ O O  O O  O  O O  O  O    O       O O    O     O O  O  O    O   =
 O
        O                         O    O  O       O    O            O    O =
 |
  43000 ++-----------------------------------------------------------------=
-+


                                  proc-vmstat.pgfault

  1.5e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
  1.4e+06 ++   *..                .*..        *.               *..         =
 |
          *.. +                 .*     .*.. ..  *..*.*..*.    +   *.       =
 |
  1.3e+06 ++ *    *.*..*.*..*.*.      *    *              *..*      *..*   =
 |
          |                                                                =
 |
  1.2e+06 ++                                                               =
 |
          |                                                                =
 |
  1.1e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   900000 O+   O  O      O  O    O O  O O     O O    O    O  O O  O O    O =
 |
          |  O      O  O      O            O       O    O              O   =
 O
   800000 ++---------------------------------------------------------------=
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

--===============0571485855964879366==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogcGlnegpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IGFjdGl2YXRlLW1vbml0b3IK
ICBrbXNnOiAKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0
OiAKICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJv
Yy1zdGF0OgogICAgaW50ZXJ2YWw6IDEwCiAgbWVtaW5mbzogCiAgc2xhYmluZm86IAogIGludGVy
cnVwdHM6IAogIGxvY2tfc3RhdDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGlycXM6IAogIGJk
aV9kZXZfbWFwcGluZzogCiAgZGlza3N0YXRzOiAKICBuZnNzdGF0OiAKICBjcHVpZGxlOiAKICBj
cHVmcmVxLXN0YXRzOiAKICB0dXJib3N0YXQ6IAogIHBtZXRlcjogCiAgc2NoZWRfZGVidWc6CiAg
ICBpbnRlcnZhbDogNjAKY3B1ZnJlcV9nb3Zlcm5vcjogcGVyZm9ybWFuY2UKZGVmYXVsdC13YXRj
aGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IGIxYWI5MDg2ZDdhMDM5
NTEwZTE5YzgxYzM2YWZmNjEwMjEzZmUxYTAKbW9kZWw6IEJyaWNrbGFuZCBJdnkgQnJpZGdlLUVY
Cm5yX2NwdTogMTIwCm1lbW9yeTogMTI4RwpoZGRfcGFydGl0aW9uczogIi9kZXYvc2RhMiIKc3dh
cF9wYXJ0aXRpb25zOiAKY2F0ZWdvcnk6IGJlbmNobWFyawpwZXJmLXByb2ZpbGU6CiAgZnJlcTog
ODAwCm5yX3RocmVhZHM6IDI1JQpwaWd6OgogIGJsb2Nrc2l6ZTogNTEySwpxdWV1ZTogY3ljbGlj
CnRlc3Rib3g6IGJyaWNrbGFuZDEKdGJveF9ncm91cDogYnJpY2tsYW5kMQprY29uZmlnOiB4ODZf
NjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTUtMDktMDggMDE6MjE6MDguOTU4MDM3NTYxICswODow
MAppZDogMGEzYTUwZjViOTcwZGViYjI2MGZkMjMyY2EyYTVjZTE0NjQzZDQzMgp1c2VyOiBsa3AK
Y29tcGlsZXI6IGdjYy00LjkKaGVhZF9jb21taXQ6IGIxYWI5MDg2ZDdhMDM5NTEwZTE5YzgxYzM2
YWZmNjEwMjEzZmUxYTAKYmFzZV9jb21taXQ6IDZmZjMzZjM5MDJjM2IxYzVkMGRiNmIxZTJjNzBi
NmQ3NmZiYTM1N2YKYnJhbmNoOiBsaW51eC1uZXh0L21hc3RlcgprZXJuZWw6ICIvcGtnL2xpbnV4
L3g4Nl82NC1yaGVsL2djYy00LjkvYjFhYjkwODZkN2EwMzk1MTBlMTljODFjMzZhZmY2MTAyMTNm
ZTFhMC92bWxpbnV6LTQuMy4wLXJjMS1uZXh0LTIwMTUwOTE1Igpyb290ZnM6IGRlYmlhbi14ODZf
NjQtMjAxNS0wMi0wNy5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L3BpZ3ovcGVyZm9ybWFuY2Ut
MjUlLTUxMksvYnJpY2tsYW5kMS9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1y
aGVsL2djYy00LjkvYjFhYjkwODZkN2EwMzk1MTBlMTljODFjMzZhZmY2MTAyMTNmZTFhMC8wIgpq
b2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2JyaWNrbGFuZDEvY3ljbGljX3BpZ3otcGVyZm9ybWFu
Y2UtMjUlLTUxMksteDg2XzY0LXJoZWwtQ1lDTElDX0hFQUQtYjFhYjkwODZkN2EwMzk1MTBlMTlj
ODFjMzZhZmY2MTAyMTNmZTFhMC0yMDE1MDkwOC00ODc3My15ZmVsajctMC55YW1sIgpkZXF1ZXVl
X3RpbWU6IDIwMTUtMDktMTUgMTI6MzI6MzIuNTQ3NTc2NDIzICswODowMAptYXhfdXB0aW1lOiAy
Njk1Ljk4CmluaXRyZDogIi9vc2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6Igpib290bG9hZGVyX2FwcGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9i
PS9sa3Avc2NoZWR1bGVkL2JyaWNrbGFuZDEvY3ljbGljX3BpZ3otcGVyZm9ybWFuY2UtMjUlLTUx
MksteDg2XzY0LXJoZWwtQ1lDTElDX0hFQUQtYjFhYjkwODZkN2EwMzk1MTBlMTljODFjMzZhZmY2
MTAyMTNmZTFhMC0yMDE1MDkwOC00ODc3My15ZmVsajctMC55YW1sCi0gQVJDSD14ODZfNjQKLSBr
Y29uZmlnPXg4Nl82NC1yaGVsCi0gYnJhbmNoPWxpbnV4LW5leHQvbWFzdGVyCi0gY29tbWl0PWIx
YWI5MDg2ZDdhMDM5NTEwZTE5YzgxYzM2YWZmNjEwMjEzZmUxYTAKLSBCT09UX0lNQUdFPS9wa2cv
bGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9iMWFiOTA4NmQ3YTAzOTUxMGUxOWM4MWMzNmFmZjYx
MDIxM2ZlMWEwL3ZtbGludXotNC4zLjAtcmMxLW5leHQtMjAxNTA5MTUKLSBtYXhfdXB0aW1lPTI2
OTUKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L3BpZ3ovcGVyZm9ybWFuY2UtMjUlLTUxMksvYnJpY2ts
YW5kMS9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvYjFh
YjkwODZkN2EwMzk1MTBlMTljODFjMzZhZmY2MTAyMTNmZTFhMC8wCi0gTEtQX1NFUlZFUj1pbm4K
LSB8LQogIGlwbWlfc2kudHJ5YWNwaT0wIGlwbWlfd2F0Y2hkb2cuc3RhcnRfbm93PTEKCiAgZWFy
bHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgogIGRlYnVnIGFwaWM9
ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0
PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29w
cz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29sZT10dHlTMCwx
MTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRyZDogIi9sa3AvbGtw
L2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwv
Z2NjLTQuOS9iMWFiOTA4NmQ3YTAzOTUxMGUxOWM4MWMzNmFmZjYxMDIxM2ZlMWEwL21vZHVsZXMu
Y2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5j
Z3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVu
LWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ov
dHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwvb3NpbWFnZS9kZXBz
L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcGlnei5jZ3oiCmpvYl9zdGF0ZTogZmluaXNo
ZWQKbG9hZGF2ZzogMjYuOTQgMTguMzMgOC4wOSAxLzExMDEgMTE1MzQKc3RhcnRfdGltZTogJzE0
NDIyOTE2MjInCmVuZF90aW1lOiAnMTQ0MjI5MTkyMicKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMt
MjAxNTA5MTUtMTAzNjIzIgo=

--===============0571485855964879366==
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

--===============0571485855964879366==--

