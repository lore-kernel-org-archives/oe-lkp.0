Content-Type: multipart/mixed; boundary="===============6699025548643419076=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [mutex] 871a6bb4916: -1.8% will-it-scale.per_process_ops, -98.3% will-it-scale.time.voluntary_context_switches, +209.6% will-it-scale.time.involuntary_context_switches
Date: Sun, 15 Feb 2015 15:46:54 +0800
Message-ID: <1423986414.5538.8.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6699025548643419076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
commit 871a6bb4916fef3123b6ff749b0dc82680fb0d2a ("mutex: In mutex_spin_on_o=
wner(), return true when owner changes")


testbox/testcase/testparams: wsm/will-it-scale/performance-writeseek3

e07e0d4cb0c4bfe8  871a6bb4916fef3123b6ff749b  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

  24972759 =C2=B1  2%     -98.3%     417134 =C2=B1  9%  will-it-scale.time.=
voluntary_context_switches
      2223 =C2=B1 49%    +209.6%       6884 =C2=B1 10%  will-it-scale.time.=
involuntary_context_switches
       542 =C2=B1 32%     +91.3%       1037 =C2=B1  0%  will-it-scale.time.=
system_time
       186 =C2=B1 30%     +86.3%        347 =C2=B1  0%  will-it-scale.time.=
percent_of_cpu_this_job_got
     26.11 =C2=B1  5%     -22.7%      20.18 =C2=B1  2%  will-it-scale.time.=
user_time
      0.09 =C2=B1  1%     -18.2%       0.07 =C2=B1  1%  will-it-scale.scala=
bility
    783528 =C2=B1  0%      -1.8%     769550 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
   6038710 =C2=B1  9%     -99.4%      34622 =C2=B1 29%  sched_debug.cpu#8.n=
r_switches
    354318 =C2=B1 12%     -88.4%      41041 =C2=B1  3%  softirqs.SCHED
      1.67 =C2=B1 14%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.pick_next_task_fair.__sched_text_start.schedule.schedule_preempt_disab=
led.cpu_startup_entry
      1.82 =C2=B1  9%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.dequeue_task_fair.dequeue_task.deactivate_task.__sched_text_start.sche=
dule
      2.09 =C2=B1  6%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles._raw_spin_lock.try_to_wake_up.wake_up_process.__mutex_unlock_slowpath.=
mutex_unlock
      2.05 =C2=B1  9%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.dequeue_task.deactivate_task.__sched_text_start.schedule.schedule_pree=
mpt_disabled
      2.07 =C2=B1  9%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.deactivate_task.__sched_text_start.schedule.schedule_preempt_disabled.=
__mutex_lock_slowpath
      2.45 =C2=B1 11%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.__sched_text_start.schedule.schedule_preempt_disabled.cpu_startup_entr=
y.start_secondary
      3.72 =C2=B1  3%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.activate_task.ttwu_do_activate.try_to_wake_up.wake_up_process.__mutex_=
unlock_slowpath
   1033400 =C2=B1  5%     -89.4%     109500 =C2=B1 30%  sched_debug.cpu#3.t=
twu_count
    975947 =C2=B1  2%     -88.8%     109094 =C2=B1 30%  sched_debug.cpu#3.s=
ched_goidle
     12.27 =C2=B1 10%    +492.7%      72.73 =C2=B1  1%  perf-profile.cpu-cy=
cles.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.generic_file_wr=
ite_iter.new_sync_write
      3.22 =C2=B1 26%   +1718.0%      58.50 =C2=B1  1%  perf-profile.cpu-cy=
cles.osq_lock.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.generi=
c_file_write_iter
      3.22 =C2=B1 10%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles._raw_spin_unlock_irqrestore.__hrtimer_start_range_ns.hrtimer_start_ran=
ge_ns.tick_nohz_restart.tick_nohz_idle_exit
      4.29 =C2=B1  9%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.__sched_text_start.schedule.schedule_preempt_disabled.__mutex_lock_slo=
wpath.mutex_lock
      4.54 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.ttwu_do_activate.constprop.85.try_to_wake_up.wake_up_process.__mutex_u=
nlock_slowpath.mutex_unlock
      4.02 =C2=B1  9%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.__hrtimer_start_range_ns.hrtimer_start_range_ns.tick_nohz_restart.tick=
_nohz_idle_exit.cpu_startup_entry
   1953046 =C2=B1  2%     -88.7%     219857 =C2=B1 30%  sched_debug.cpu#3.s=
ched_count
     15.15 =C2=B1  2%     -84.0%       2.42 =C2=B1 36%  perf-profile.cpu-cy=
cles.__mutex_unlock_slowpath.mutex_unlock.generic_file_write_iter.new_sync_=
write.vfs_write
      4.39 =C2=B1 10%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.schedule.schedule_preempt_disabled.__mutex_lock_slowpath.mutex_lock.ge=
neric_file_write_iter
      4.41 =C2=B1  9%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.schedule_preempt_disabled.__mutex_lock_slowpath.mutex_lock.generic_fil=
e_write_iter.new_sync_write
      6.24 =C2=B1 15%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.tick_nohz_stop_sched_tick.__tick_nohz_idle_enter.tick_nohz_idle_enter.=
cpu_startup_entry.start_secondary
      6.69 =C2=B1 15%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.__tick_nohz_idle_enter.tick_nohz_idle_enter.cpu_startup_entry.start_se=
condary
      6.85 =C2=B1 15%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.tick_nohz_idle_enter.cpu_startup_entry.start_secondary
 1.372e+08 =C2=B1 14%     -95.4%    6291721 =C2=B1 10%  cpuidle.C1-NHM.time
   1005704 =C2=B1 29%     -97.1%      28896 =C2=B1  3%  cpuidle.C1-NHM.usage
  9.11e+08 =C2=B1 13%     -98.8%   10867422 =C2=B1 11%  cpuidle.C3-NHM.time
   3887769 =C2=B1 14%     -99.3%      28556 =C2=B1  8%  cpuidle.C3-NHM.usage
   1510725 =C2=B1 22%     -95.9%      62458 =C2=B1  1%  cpuidle.C6-NHM.usage
      0.78 =C2=B1 32%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles._raw_spin_unlock_irqrestore.__hrtimer_start_range_ns.hrtimer_start.tic=
k_nohz_stop_sched_tick.__tick_nohz_idle_enter
  24972759 =C2=B1  2%     -98.3%     417134 =C2=B1  9%  time.voluntary_cont=
ext_switches
      0.94 =C2=B1 25%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.hrtimer_cancel.tick_nohz_restart.tick_nohz_idle_exit.cpu_startup_entry=
.start_secondary
      0.99 =C2=B1 19%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.hrtimer_try_to_cancel.hrtimer_cancel.tick_nohz_restart.tick_nohz_idle_=
exit.cpu_startup_entry
     20.83 =C2=B1 15%     -99.3%       0.15 =C2=B1 40%  turbostat.CPU%c3
   2456623 =C2=B1  8%     -99.2%      20817 =C2=B1 38%  sched_debug.cpu#10.=
ttwu_count
   2493452 =C2=B1  9%     -99.2%      20381 =C2=B1 38%  sched_debug.cpu#10.=
sched_goidle
   4988930 =C2=B1  9%     -99.2%      42017 =C2=B1 37%  sched_debug.cpu#10.=
sched_count
   4988215 =C2=B1  9%     -99.2%      41816 =C2=B1 37%  sched_debug.cpu#10.=
nr_switches
  14655.48 =C2=B1 32%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.max_vruntime
  14655.48 =C2=B1 32%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.MIN_vruntime
   2644593 =C2=B1  7%     -99.4%      16074 =C2=B1 33%  sched_debug.cpu#9.t=
twu_count
   2265014 =C2=B1 15%     -99.3%      15600 =C2=B1 34%  sched_debug.cpu#9.s=
ched_goidle
   3222460 =C2=B1  7%     -98.6%      45873 =C2=B1 27%  sched_debug.cpu#0.n=
r_switches
   4531465 =C2=B1 15%     -99.3%      32789 =C2=B1 32%  sched_debug.cpu#9.s=
ched_count
   3223037 =C2=B1  7%     -98.6%      46060 =C2=B1 26%  sched_debug.cpu#0.s=
ched_count
   1609191 =C2=B1  7%     -98.7%      20811 =C2=B1 29%  sched_debug.cpu#0.s=
ched_goidle
   1498187 =C2=B1 10%     -98.4%      23779 =C2=B1 27%  sched_debug.cpu#0.t=
twu_count
   4530977 =C2=B1 15%     -99.3%      32616 =C2=B1 32%  sched_debug.cpu#9.n=
r_switches
   2759516 =C2=B1  3%     -99.4%      17615 =C2=B1 30%  sched_debug.cpu#8.t=
twu_count
   3018619 =C2=B1  9%     -99.4%      16773 =C2=B1 29%  sched_debug.cpu#8.s=
ched_goidle
   6039570 =C2=B1  9%     -99.4%      34816 =C2=B1 28%  sched_debug.cpu#8.s=
ched_count
      1.45 =C2=B1 11%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.dequeue_entity.dequeue_task_fair.dequeue_task.deactivate_task.__sched_=
text_start
   3261866 =C2=B1 12%     -86.4%     443808 =C2=B1 24%  sched_debug.cpu#1.n=
r_switches
   2788959 =C2=B1  7%     -99.5%      15010 =C2=B1 12%  sched_debug.cpu#7.t=
twu_count
   2910769 =C2=B1  3%     -99.5%      14317 =C2=B1 12%  sched_debug.cpu#7.s=
ched_goidle
   5823925 =C2=B1  3%     -99.5%      29602 =C2=B1 11%  sched_debug.cpu#7.s=
ched_count
   5822919 =C2=B1  3%     -99.5%      29393 =C2=B1 11%  sched_debug.cpu#7.n=
r_switches
   3262414 =C2=B1 12%     -86.4%     443998 =C2=B1 24%  sched_debug.cpu#1.s=
ched_count
   1630336 =C2=B1 12%     -86.4%     221383 =C2=B1 24%  sched_debug.cpu#1.s=
ched_goidle
   1590850 =C2=B1 11%     -86.1%     221730 =C2=B1 24%  sched_debug.cpu#1.t=
twu_count
   2244028 =C2=B1 15%     -80.0%     448572 =C2=B1 20%  sched_debug.cpu#4.s=
ched_count
   1121323 =C2=B1 15%     -80.1%     223305 =C2=B1 20%  sched_debug.cpu#4.s=
ched_goidle
   2727451 =C2=B1  4%     -99.5%      14096 =C2=B1  5%  sched_debug.cpu#6.t=
twu_count
   1952837 =C2=B1  2%     -88.7%     219701 =C2=B1 30%  sched_debug.cpu#3.n=
r_switches
      9443 =C2=B1 24%    +510.5%      57651 =C2=B1 20%  sched_debug.cfs_rq[=
5]:/.exec_clock
   5386675 =C2=B1  7%     -99.5%      28321 =C2=B1  5%  sched_debug.cpu#6.s=
ched_count
   5385896 =C2=B1  7%     -99.5%      28079 =C2=B1  5%  sched_debug.cpu#6.n=
r_switches
   2243723 =C2=B1 15%     -80.0%     448446 =C2=B1 20%  sched_debug.cpu#4.n=
r_switches
     58333 =C2=B1 26%    +800.2%     525096 =C2=B1 19%  sched_debug.cfs_rq[=
5]:/.min_vruntime
   2692398 =C2=B1  7%     -99.5%      13778 =C2=B1  5%  sched_debug.cpu#6.s=
ched_goidle
     15.29 =C2=B1  2%     -83.6%       2.51 =C2=B1 34%  perf-profile.cpu-cy=
cles.mutex_unlock.generic_file_write_iter.new_sync_write.vfs_write.sys_write
        12 =C2=B1 25%    +431.2%         63 =C2=B1 11%  sched_debug.cpu#5.c=
pu_load[4]
        12 =C2=B1 25%    +278.0%         47 =C2=B1 29%  sched_debug.cpu#4.c=
pu_load[4]
        14 =C2=B1 20%    +356.1%         65 =C2=B1 11%  sched_debug.cpu#5.c=
pu_load[3]
     88847 =C2=B1 19%    +279.8%     337399 =C2=B1 37%  sched_debug.cfs_rq[=
4]:/.min_vruntime
   1031731 =C2=B1 16%     -78.4%     223086 =C2=B1 20%  sched_debug.cpu#4.t=
twu_count
     99804 =C2=B1 24%    +338.8%     437987 =C2=B1 19%  sched_debug.cfs_rq[=
3]:/.min_vruntime
      2223 =C2=B1 49%    +209.6%       6884 =C2=B1 10%  time.involuntary_co=
ntext_switches
     17.87 =C2=B1  5%    +308.0%      72.92 =C2=B1  1%  perf-profile.cpu-cy=
cles.__mutex_lock_slowpath.mutex_lock.generic_file_write_iter.new_sync_writ=
e.vfs_write
        18 =C2=B1 18%    +260.0%         67 =C2=B1 12%  sched_debug.cpu#5.c=
pu_load[2]
      6968 =C2=B1 20%    +278.9%      26401 =C2=B1  9%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
       151 =C2=B1 20%    +279.4%        575 =C2=B1  9%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
    144391 =C2=B1 29%    +340.5%     635982 =C2=B1 10%  sched_debug.cfs_rq[=
2]:/.min_vruntime
        13 =C2=B1 27%    +250.9%         48 =C2=B1 28%  sched_debug.cpu#4.c=
pu_load[3]
     13600 =C2=B1 14%    +165.3%      36078 =C2=B1 44%  sched_debug.cfs_rq[=
4]:/.exec_clock
     14705 =C2=B1 16%    +210.9%      45712 =C2=B1 23%  sched_debug.cfs_rq[=
3]:/.exec_clock
     21.26 =C2=B1  3%    +249.9%      74.39 =C2=B1  1%  perf-profile.cpu-cy=
cles.mutex_lock.generic_file_write_iter.new_sync_write.vfs_write.sys_write
        19 =C2=B1 32%    +265.4%         71 =C2=B1 12%  sched_debug.cpu#2.c=
pu_load[4]
    146181 =C2=B1 22%    +276.4%     550280 =C2=B1  7%  sched_debug.cfs_rq[=
1]:/.min_vruntime
        14 =C2=B1 19%    +250.8%         51 =C2=B1 21%  sched_debug.cpu#3.c=
pu_load[4]
        15 =C2=B1 32%    +215.9%         49 =C2=B1 27%  sched_debug.cpu#4.c=
pu_load[2]
     22075 =C2=B1 18%    +206.6%      67680 =C2=B1 13%  sched_debug.cfs_rq[=
2]:/.exec_clock
        21 =C2=B1 25%    +228.7%         71 =C2=B1 12%  sched_debug.cpu#2.c=
pu_load[3]
     30386 =C2=B1 36%    +127.5%      69129 =C2=B1  9%  sched_debug.cpu#5.n=
r_load_updates
    211200 =C2=B1 15%    +164.8%     559266 =C2=B1 24%  sched_debug.cfs_rq[=
10]:/.min_vruntime
        26 =C2=B1 19%    +170.5%         71 =C2=B1 15%  sched_debug.cpu#5.c=
pu_load[1]
        17 =C2=B1 11%    +200.0%         51 =C2=B1 21%  sched_debug.cpu#3.c=
pu_load[3]
        24 =C2=B1 24%    +193.8%         71 =C2=B1 13%  sched_debug.cpu#2.c=
pu_load[2]
    115343 =C2=B1  5%     -64.3%      41124 =C2=B1  5%  softirqs.RCU
      1683 =C2=B1  8%     -62.1%        638 =C2=B1  6%  cpuidle.POLL.usage
      8658 =C2=B1 15%    +144.1%      21138 =C2=B1 20%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
       189 =C2=B1 15%    +144.4%        462 =C2=B1 20%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
       256 =C2=B1 29%    +159.6%        666 =C2=B1  8%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
     11739 =C2=B1 29%    +159.9%      30515 =C2=B1  8%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
        29 =C2=B1 14%    +110.3%         61 =C2=B1 21%  sched_debug.cpu#10.=
cpu_load[4]
    336086 =C2=B1 15%    +150.3%     841284 =C2=B1  6%  sched_debug.cfs_rq[=
6]:/.min_vruntime
       969 =C2=B1 40%    +109.0%       2025 =C2=B1  9%  sched_debug.cpu#1.c=
urr->pid
        21 =C2=B1  5%    +145.2%         51 =C2=B1 20%  sched_debug.cpu#3.c=
pu_load[2]
       202 =C2=B1 13%    +155.3%        515 =C2=B1 12%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
      9249 =C2=B1 13%    +155.4%      23619 =C2=B1 12%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
       739 =C2=B1 21%    +150.6%       1853 =C2=B1 22%  sched_debug.cpu#4.c=
urr->pid
    202942 =C2=B1 11%    +125.2%     456974 =C2=B1 16%  sched_debug.cfs_rq[=
9]:/.min_vruntime
       970 =C2=B1  6%     -55.7%        430 =C2=B1 45%  sched_debug.cpu#6.t=
twu_local
        19 =C2=B1 37%    +167.9%         52 =C2=B1 26%  sched_debug.cpu#4.c=
pu_load[1]
    452477 =C2=B1 19%    +140.5%    1088065 =C2=B1  0%  softirqs.TIMER
     22472 =C2=B1 11%    +148.8%      55914 =C2=B1  7%  sched_debug.cfs_rq[=
1]:/.exec_clock
        36 =C2=B1 27%    +106.9%         75 =C2=B1 22%  sched_debug.cfs_rq[=
5]:/.runnable_load_avg
      1.52 =C2=B1  7%     -53.9%       0.70 =C2=B1  7%  perf-profile.cpu-cy=
cles.system_call_after_swapgs
        32 =C2=B1  9%     +94.5%         62 =C2=B1 20%  sched_debug.cpu#10.=
cpu_load[3]
        21 =C2=B1 34%    +183.3%         59 =C2=B1  9%  sched_debug.cpu#1.c=
pu_load[4]
       542 =C2=B1 32%     +91.3%       1037 =C2=B1  0%  time.system_time
      1.01 =C2=B1  8%     -52.1%       0.48 =C2=B1  3%  perf-profile.cpu-cy=
cles.__sb_end_write.vfs_write.sys_write.system_call_fastpath
      1.44 =C2=B1 16%     -57.3%       0.61 =C2=B1  8%  perf-profile.cpu-cy=
cles.sys_lseek.system_call_fastpath
    241726 =C2=B1 20%    +161.9%     633158 =C2=B1  4%  sched_debug.cfs_rq[=
7]:/.min_vruntime
        29 =C2=B1 26%    +133.6%         69 =C2=B1 15%  sched_debug.cpu#2.c=
pu_load[1]
       186 =C2=B1 30%     +86.3%        347 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
        23 =C2=B1 15%    +151.1%         57 =C2=B1 30%  sched_debug.cfs_rq[=
4]:/.runnable_load_avg
        46 =C2=B1 24%    +144.9%        114 =C2=B1 21%  sched_debug.cpu#6.c=
pu_load[3]
        41 =C2=B1 20%     +82.6%         76 =C2=B1 28%  sched_debug.cpu#11.=
cpu_load[0]
       893 =C2=B1 11%    +122.5%       1986 =C2=B1  4%  sched_debug.cpu#10.=
curr->pid
        50 =C2=B1 28%    +148.0%        124 =C2=B1 22%  sched_debug.cpu#6.c=
pu_load[4]
        47 =C2=B1 23%    +131.4%        108 =C2=B1 17%  sched_debug.cpu#6.c=
pu_load[2]
      1.26 =C2=B1  7%     -54.5%       0.57 =C2=B1  8%  perf-profile.cpu-cy=
cles.__sb_start_write.vfs_write.sys_write.system_call_fastpath
      3.00 =C2=B1  8%     -52.7%       1.42 =C2=B1  4%  perf-profile.cpu-cy=
cles.shmem_getpage_gfp.shmem_write_begin.generic_perform_write.__generic_fi=
le_write_iter.generic_file_write_iter
        31 =C2=B1 36%    +130.2%         72 =C2=B1  7%  sched_debug.cpu#7.c=
pu_load[4]
      3.37 =C2=B1  7%     -51.4%       1.64 =C2=B1  1%  perf-profile.cpu-cy=
cles.shmem_write_begin.generic_perform_write.__generic_file_write_iter.gene=
ric_file_write_iter.new_sync_write
        41 =C2=B1 27%     +90.2%         78 =C2=B1 21%  sched_debug.cpu#5.c=
pu_load[0]
      1152 =C2=B1 36%     +91.5%       2207 =C2=B1  9%  sched_debug.cpu#7.c=
urr->pid
     32766 =C2=B1  7%     +78.3%      58423 =C2=B1 27%  sched_debug.cfs_rq[=
10]:/.exec_clock
      2.42 =C2=B1 13%     -54.2%       1.11 =C2=B1 32%  perf-profile.cpu-cy=
cles._raw_spin_lock.__mutex_unlock_slowpath.mutex_unlock.generic_file_write=
_iter.new_sync_write
        22 =C2=B1 32%    +164.4%         59 =C2=B1  8%  sched_debug.cpu#1.c=
pu_load[3]
       998 =C2=B1 21%    +108.6%       2081 =C2=B1  8%  sched_debug.cpu#8.c=
urr->pid
      1.43 =C2=B1  8%     -49.6%       0.72 =C2=B1 10%  perf-profile.cpu-cy=
cles.unlock_page.shmem_write_end.generic_perform_write.__generic_file_write=
_iter.generic_file_write_iter
        27 =C2=B1  9%     +85.5%         51 =C2=B1 19%  sched_debug.cpu#3.c=
pu_load[1]
        51 =C2=B1 20%    +106.3%        105 =C2=B1 12%  sched_debug.cpu#6.c=
pu_load[1]
      2.20 =C2=B1  8%     -51.8%       1.06 =C2=B1  6%  perf-profile.cpu-cy=
cles.find_lock_entry.shmem_getpage_gfp.shmem_write_begin.generic_perform_wr=
ite.__generic_file_write_iter
      7.46 =C2=B1  4%     -51.1%       3.65 =C2=B1  6%  perf-profile.cpu-cy=
cles.copy_user_generic_string.generic_perform_write.__generic_file_write_it=
er.generic_file_write_iter.new_sync_write
      2.79 =C2=B1  3%     -48.3%       1.44 =C2=B1  7%  perf-profile.cpu-cy=
cles.fsnotify.vfs_write.sys_write.system_call_fastpath
       327 =C2=B1 17%     +75.1%        573 =C2=B1 15%  sched_debug.cfs_rq[=
10]:/.tg_runnable_contrib
     14967 =C2=B1 17%     +75.2%      26221 =C2=B1 15%  sched_debug.cfs_rq[=
10]:/.avg->runnable_avg_sum
         2 =C2=B1 15%    +109.1%          5 =C2=B1  7%  vmstat.procs.r
        24 =C2=B1 25%    +145.5%         60 =C2=B1  6%  sched_debug.cpu#1.c=
pu_load[1]
        30 =C2=B1 21%     +99.2%         59 =C2=B1 13%  sched_debug.cpu#8.c=
pu_load[4]
        23 =C2=B1 29%    +151.6%         59 =C2=B1  7%  sched_debug.cpu#1.c=
pu_load[2]
     19.91 =C2=B1  3%     -48.4%      10.27 =C2=B1  3%  perf-profile.cpu-cy=
cles.__generic_file_write_iter.generic_file_write_iter.new_sync_write.vfs_w=
rite.sys_write
     17.33 =C2=B1  4%     -48.1%       8.99 =C2=B1  3%  perf-profile.cpu-cy=
cles.generic_perform_write.__generic_file_write_iter.generic_file_write_ite=
r.new_sync_write.vfs_write
      3.35 =C2=B1  2%     -46.9%       1.78 =C2=B1 16%  perf-profile.cpu-cy=
cles.shmem_write_end.generic_perform_write.__generic_file_write_iter.generi=
c_file_write_iter.new_sync_write
        29 =C2=B1 29%     +85.7%         55 =C2=B1 17%  sched_debug.cpu#9.c=
pu_load[4]
      1.18 =C2=B1  9%     -51.8%       0.57 =C2=B1 11%  perf-profile.cpu-cy=
cles.find_get_entry.find_lock_entry.shmem_getpage_gfp.shmem_write_begin.gen=
eric_perform_write
      1.31 =C2=B1  5%     -51.0%       0.65 =C2=B1  7%  perf-profile.cpu-cy=
cles.system_call
     12371 =C2=B1 18%    +118.5%      27032 =C2=B1  6%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
    244456 =C2=B1 15%    +123.7%     546812 =C2=B1 14%  sched_debug.cfs_rq[=
8]:/.min_vruntime
       271 =C2=B1 18%    +118.0%        590 =C2=B1  6%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
        36 =C2=B1  9%     +78.5%         64 =C2=B1 18%  sched_debug.cpu#10.=
cpu_load[2]
        35 =C2=B1 38%    +103.5%         72 =C2=B1  6%  sched_debug.cpu#7.c=
pu_load[3]
        31 =C2=B1 19%     +90.5%         60 =C2=B1 13%  sched_debug.cpu#8.c=
pu_load[3]
      3694 =C2=B1 15%     +94.6%       7190 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
      3694 =C2=B1 15%     +94.4%       7183 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
        37 =C2=B1 22%     +73.8%         64 =C2=B1  5%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
      3695 =C2=B1 15%     +93.8%       7161 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
      3696 =C2=B1 15%     +93.7%       7162 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
      3701 =C2=B1 15%     +93.6%       7165 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
      3698 =C2=B1 15%     +93.7%       7162 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
      3703 =C2=B1 15%     +93.5%       7166 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
      3711 =C2=B1 15%     +93.3%       7173 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
      3711 =C2=B1 15%     +93.2%       7169 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
      3707 =C2=B1 15%     +93.3%       7167 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
      3714 =C2=B1 15%     +93.1%       7174 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
      3717 =C2=B1 15%     +93.1%       7177 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
       457 =C2=B1 16%     +80.3%        824 =C2=B1  4%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
       327 =C2=B1 19%     +63.5%        535 =C2=B1 15%  sched_debug.cfs_rq[=
9]:/.tg_runnable_contrib
      5.21 =C2=B1  8%     +94.9%      10.14 =C2=B1  1%  perf-profile.cpu-cy=
cles.mutex_spin_on_owner.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_=
lock.generic_file_write_iter
     20973 =C2=B1 16%     +80.4%      37832 =C2=B1  4%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
     14981 =C2=B1 19%     +63.9%      24548 =C2=B1 15%  sched_debug.cfs_rq[=
9]:/.avg->runnable_avg_sum
        36 =C2=B1 20%     +38.8%         51 =C2=B1 19%  sched_debug.cpu#3.c=
pu_load[0]
      1052 =C2=B1 22%     +68.3%       1770 =C2=B1 15%  sched_debug.cpu#3.c=
urr->pid
        41 =C2=B1 42%     +78.7%         73 =C2=B1  5%  sched_debug.cpu#7.c=
pu_load[2]
        42 =C2=B1 33%     +63.9%         69 =C2=B1 19%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
        28 =C2=B1 25%    +121.4%         62 =C2=B1  5%  sched_debug.cpu#1.c=
pu_load[0]
      2973 =C2=B1  6%     -41.9%       1727 =C2=B1  0%  uptime.idle
      1370 =C2=B1 10%     +68.7%       2311 =C2=B1  9%  sched_debug.cpu#6.c=
urr->pid
    301194 =C2=B1  6%     +73.9%     523791 =C2=B1 10%  sched_debug.cpu#11.=
avg_idle
        32 =C2=B1 14%     +83.8%         59 =C2=B1 13%  sched_debug.cpu#8.c=
pu_load[2]
       234 =C2=B1 30%     +45.9%        341 =C2=B1 13%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
        41 =C2=B1 17%     +64.1%         68 =C2=B1 17%  sched_debug.cpu#10.=
cpu_load[1]
     61684 =C2=B1 20%     +85.4%     114380 =C2=B1  9%  sched_debug.cfs_rq[=
6]:/.exec_clock
    315489 =C2=B1 24%     +83.4%     578759 =C2=B1 10%  sched_debug.cfs_rq[=
0]:/.min_vruntime
 1.474e+08 =C2=B1  8%     -42.1%   85363914 =C2=B1  6%  cpuidle.C1E-NHM.time
      1.15 =C2=B1  4%     -39.4%       0.70 =C2=B1 12%  perf-profile.cpu-cy=
cles.__srcu_read_lock.fsnotify.vfs_write.sys_write.system_call_fastpath
        28 =C2=B1 40%    +105.4%         57 =C2=B1 27%  sched_debug.cpu#4.c=
pu_load[0]
        35 =C2=B1 14%     +68.8%         59 =C2=B1 13%  sched_debug.cpu#8.c=
pu_load[1]
        31 =C2=B1 12%     +54.0%         47 =C2=B1 13%  sched_debug.cpu#11.=
cpu_load[4]
        59 =C2=B1 22%     +75.8%        103 =C2=B1 14%  sched_debug.cpu#6.c=
pu_load[0]
      1137 =C2=B1 25%     +92.1%       2184 =C2=B1 14%  sched_debug.cpu#5.c=
urr->pid
        32 =C2=B1 27%     +72.5%         56 =C2=B1 16%  sched_debug.cpu#9.c=
pu_load[3]
    264073 =C2=B1  5%     +49.3%     394342 =C2=B1 13%  sched_debug.cpu#8.a=
vg_idle
     37082 =C2=B1 12%     +79.2%      66466 =C2=B1  6%  sched_debug.cfs_rq[=
7]:/.exec_clock
        39 =C2=B1 22%     +46.8%         58 =C2=B1 14%  sched_debug.cpu#8.c=
pu_load[0]
     31977 =C2=B1  5%     +51.3%      48388 =C2=B1 22%  sched_debug.cfs_rq[=
9]:/.exec_clock
     17401 =C2=B1 15%     +79.1%      31162 =C2=B1  4%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
       380 =C2=B1 15%     +78.6%        679 =C2=B1  4%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
        40 =C2=B1 13%     +72.4%         70 =C2=B1 17%  sched_debug.cfs_rq[=
10]:/.runnable_load_avg
        37 =C2=B1 27%     +58.8%         58 =C2=B1  9%  sched_debug.cfs_rq[=
8]:/.runnable_load_avg
  38761708 =C2=B1 33%     +61.8%   62732448 =C2=B1  7%  cpuidle.POLL.time
      1178 =C2=B1 19%     +83.1%       2158 =C2=B1  5%  sched_debug.cpu#0.c=
urr->pid
      1220 =C2=B1  4%     +55.6%       1899 =C2=B1 11%  sched_debug.cpu#11.=
curr->pid
     57975 =C2=B1  9%     +40.6%      81536 =C2=B1  8%  sched_debug.cpu#2.n=
r_load_updates
    166493 =C2=B1 16%     -41.6%      97254 =C2=B1 35%  sched_debug.cpu#3.t=
twu_local
     75051 =C2=B1  6%     -45.2%      41162 =C2=B1 24%  sched_debug.cpu#11.=
nr_load_updates
     57.44 =C2=B1  2%     +52.6%      87.64 =C2=B1  1%  perf-profile.cpu-cy=
cles.generic_file_write_iter.new_sync_write.vfs_write.sys_write.system_call=
_fastpath
        35 =C2=B1 13%     +57.4%         55 =C2=B1 10%  sched_debug.cpu#11.=
cpu_load[2]
    293147 =C2=B1  5%     +41.2%     413910 =C2=B1 19%  sched_debug.cpu#10.=
avg_idle
        32 =C2=B1 12%     +55.7%         51 =C2=B1  9%  sched_debug.cpu#11.=
cpu_load[3]
        38 =C2=B1 16%     +66.7%         63 =C2=B1 18%  sched_debug.cpu#11.=
cpu_load[1]
     16272 =C2=B1 14%     +32.4%      21550 =C2=B1 13%  sched_debug.cfs_rq[=
11]:/.avg->runnable_avg_sum
       356 =C2=B1 14%     +32.1%        471 =C2=B1 13%  sched_debug.cfs_rq[=
11]:/.tg_runnable_contrib
      2315 =C2=B1  1%     +48.7%       3444 =C2=B1  1%  proc-vmstat.pgactiv=
ate
     61.08 =C2=B1  2%     +47.4%      90.04 =C2=B1  2%  perf-profile.cpu-cy=
cles.new_sync_write.vfs_write.sys_write.system_call_fastpath
        46 =C2=B1 26%     +66.3%         76 =C2=B1 18%  sched_debug.cpu#10.=
cpu_load[0]
    395145 =C2=B1 15%     -28.1%     283954 =C2=B1 15%  sched_debug.cpu#2.a=
vg_idle
     16930 =C2=B1 13%     +62.2%      27468 =C2=B1  8%  sched_debug.cfs_rq[=
8]:/.avg->runnable_avg_sum
       370 =C2=B1 13%     +62.0%        600 =C2=B1  8%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib
      1111 =C2=B1 35%     +81.5%       2016 =C2=B1 16%  sched_debug.cpu#2.c=
urr->pid
        53 =C2=B1 24%     +72.0%         92 =C2=B1 13%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
      1264 =C2=B1 16%     +50.8%       1906 =C2=B1  1%  sched_debug.cpu#9.c=
urr->pid
     76679 =C2=B1  3%     -26.1%      56701 =C2=B1 15%  sched_debug.cpu#8.n=
r_load_updates
     32.91 =C2=B1  5%     -26.8%      24.09 =C2=B1  1%  turbostat.CPU%c1
     18589 =C2=B1 18%     +64.6%      30603 =C2=B1  8%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
       405 =C2=B1 18%     +64.4%        667 =C2=B1  8%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
     37668 =C2=B1  8%     +44.7%      54510 =C2=B1 16%  sched_debug.cfs_rq[=
8]:/.exec_clock
     68.80 =C2=B1  2%     +36.2%      93.71 =C2=B1  2%  perf-profile.cpu-cy=
cles.vfs_write.sys_write.system_call_fastpath
     70.12 =C2=B1  2%     +34.5%      94.33 =C2=B1  1%  perf-profile.cpu-cy=
cles.sys_write.system_call_fastpath
     26.11 =C2=B1  5%     -22.7%      20.18 =C2=B1  2%  time.user_time
     71.98 =C2=B1  2%     +32.2%      95.16 =C2=B1  1%  perf-profile.cpu-cy=
cles.system_call_fastpath
   1191441 =C2=B1  3%     -22.4%     924579 =C2=B1  0%  cpuidle.C1E-NHM.usa=
ge
      2.82 =C2=B1  5%     -27.8%       2.04 =C2=B1 12%  perf-profile.cpu-cy=
cles.mutex_unlock.new_sync_write.vfs_write.sys_write.system_call_fastpath
      2741 =C2=B1  0%     +27.5%       3496 =C2=B1  0%  proc-vmstat.nr_shmem
     10969 =C2=B1  0%     +27.5%      13987 =C2=B1  0%  meminfo.Shmem
     67072 =C2=B1  3%     -25.0%      50333 =C2=B1 21%  sched_debug.cpu#9.n=
r_load_updates
    253442 =C2=B1  8%     +29.3%     327656 =C2=B1 10%  sched_debug.cpu#7.a=
vg_idle
        61 =C2=B1  6%     +13.9%         69 =C2=B1  1%  turbostat.CoreTmp
       121 =C2=B1  6%     -18.5%         99 =C2=B1 23%  sched_debug.cfs_rq[=
0]:/.load
     76604 =C2=B1  3%     -11.6%      67691 =C2=B1  6%  sched_debug.cpu#7.n=
r_load_updates
     23935 =C2=B1  3%     +12.8%      26987 =C2=B1  2%  meminfo.Active(anon)
      5982 =C2=B1  3%     +12.8%       6745 =C2=B1  2%  proc-vmstat.nr_acti=
ve_anon
     63339 =C2=B1 10%     +13.7%      72028 =C2=B1  4%  sched_debug.cpu#1.n=
r_load_updates
     69405 =C2=B1  3%      -7.2%      64386 =C2=B1  4%  meminfo.DirectMap4k
    401667 =C2=B1  2%     -97.0%      11907 =C2=B1  3%  vmstat.system.cs
     29.02 =C2=B1 16%    +106.1%      59.81 =C2=B1  0%  turbostat.%Busy
      1022 =C2=B1 16%    +105.8%       2103 =C2=B1  0%  turbostat.Avg_MHz
      7739 =C2=B1  9%     +34.9%      10437 =C2=B1  0%  vmstat.system.in

wsm: Westmere
Memory: 6G




                            time.voluntary_context_switches

    3e+07 ++------------------------*--*-----------------------------------=
-+
          *..                      :    +                 *                =
 |
  2.5e+07 ++     .*..*.*..         :     +    .*..*.*.. .. +  .*.     .*.*.=
.*
          |  *.*.         *.*..*..*       *.*.         *    *.   *..*.     =
 |
          |                                                                =
 |
    2e+07 ++                                                               =
 |
          |                                                                =
 |
  1.5e+07 ++                                                               =
 |
          |                                                                =
 |
    1e+07 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
    5e+06 ++                                                               =
 |
          |                                                                =
 |
        0 O+-O-O--O--O-O--O-O--O--O-O--O--O-O--O--O-O--O--O-O--O-----------=
-+


                                   softirqs.SCHED

  450000 ++----------------------------------------------------------------=
-+
         |            *..                                              *   =
 |
  400000 ++          :     .*                                         : :  =
 *
  350000 ++          :   *.  +                           *..          : : .=
.|
         |   .*..*..*         *..*..       .*..*.       +            :   * =
 |
  300000 *+.*                       *.*..*.      *..*..*    *..*.*..*      =
 |
  250000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
  150000 ++                                                                =
 |
         |                                                                 =
 |
  100000 ++                                                                =
 |
   50000 ++                                                                =
 |
         O  O O  O  O O  O  O O  O  O O  O  O  O O  O  O O  O  O           =
 |
       0 ++----------------------------------------------------------------=
-+


                                  softirqs.HRTIMER

  12000 ++-----------------------------------------------------------------=
-+
        |                               .*.*..*..*                         =
 |
  10000 ++                    *.  .*..*.          :                        =
 |
        | .*                ..  *.                :   *..        *..*..    =
 |
        *.  +  .*..*..     *                       : :   *..   ..      *.*.=
.*
   8000 ++   *.           +                        : :      *.*            =
 |
        |             *. +                          *                      =
 |
   6000 ++              *                                                  =
 |
        |                                                                  =
 |
   4000 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        |                                                                  =
 |
      0 O+-O-O--O--O--O-O--O--O-O--O--O--O-O--O--O--O-O--O--O-O------------=
-+


                                    softirqs.RCU

  130000 ++----------------------------------------------------------------=
-+
  120000 ++                                                              *.=
.|
         | .*.  .*..*       *.*..*..*.  .*..*..*.*..*..          *..*.. +  =
 *
  110000 *+   *.     +     +          *.               *.*..    +      *   =
 |
  100000 ++           *.. +                                 *..*           =
 |
         |               *                                                 =
 |
   90000 ++                                                                =
 |
   80000 ++                                                                =
 |
   70000 ++                                                                =
 |
         |                                                                 =
 |
   60000 ++                                                                =
 |
   50000 ++                                                                =
 |
         |                    O                             O  O           =
 |
   40000 O+ O O  O  O O  O  O    O  O O  O  O  O O  O  O O                 =
 |
   30000 ++----------------------------------------------------------------=
-+


                     will-it-scale.time.voluntary_context_switches

    3e+07 ++------------------------*--*-----------------------------------=
-+
          *..                      :    +                 *                =
 |
  2.5e+07 ++     .*..*.*..         :     +    .*..*.*.. .. +  .*.     .*.*.=
.*
          |  *.*.         *.*..*..*       *.*.         *    *.   *..*.     =
 |
          |                                                                =
 |
    2e+07 ++                                                               =
 |
          |                                                                =
 |
  1.5e+07 ++                                                               =
 |
          |                                                                =
 |
    1e+07 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
    5e+06 ++                                                               =
 |
          |                                                                =
 |
        0 O+-O-O--O--O-O--O-O--O--O-O--O--O-O--O--O-O--O--O-O--O-----------=
-+


                                  vmstat.system.cs

  450000 ++----------------------------------------------------------------=
-+
         *..                       .*.*..                        *..  .*.*.=
.|
  400000 ++ *    *..*       *.*..*.      *..*..*.*..   *.*..    :   *.     =
 *
  350000 ++  + ..    +     :                         ..     *.. :          =
 |
         |    *       *..  :                        *          *           =
 |
  300000 ++               :                                                =
 |
  250000 ++              *                                                 =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
  150000 ++                                                                =
 |
         |                                                                 =
 |
  100000 ++                                                                =
 |
   50000 ++                                                                =
 |
         |                                                                 =
 |
       0 O+-O-O--O--O-O--O--O-O--O--O-O--O--O--O-O--O--O-O--O--O-----------=
-+


                             sched_debug.cpu#0.nr_switches

    4e+06 ++---------------------------------------------------------------=
-+
          |                                                            *   =
 |
  3.5e+06 ++                                                         .. +  =
 |
    3e+06 *+.                       *..                          *..*    *.=
.|
          |  *    *..*.       .*.. +   *..*.*..*..*.  .*..*.*.. +          =
 *
  2.5e+06 ++  + ..     *..  *.    *                 *.         *           =
 |
          |    *           +                                               =
 |
    2e+06 ++              *                                                =
 |
          |                                                                =
 |
  1.5e+06 ++                                                               =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 O+-O-O--O--O-O--O-O--O--O-O--O--O-O--O--O-O--O--O-O--O-----------=
-+


                             sched_debug.cpu#0.sched_count

    4e+06 ++---------------------------------------------------------------=
-+
          |                                                            *   =
 |
  3.5e+06 ++                                                         .. +  =
 |
    3e+06 *+.                       *..                          *..*    *.=
.|
          |  *    *..*.       .*.. +   *..*.*..*..*.  .*..*.*.. +          =
 *
  2.5e+06 ++  + ..     *..  *.    *                 *.         *           =
 |
          |    *           +                                               =
 |
    2e+06 ++              *                                                =
 |
          |                                                                =
 |
  1.5e+06 ++                                                               =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 O+-O-O--O--O-O--O-O--O--O-O--O--O-O--O--O-O--O--O-O--O-----------=
-+


                            sched_debug.cpu#0.sched_goidle

  1.8e+06 ++-----------------------------------------------------------*---=
-+
          |                                                          ..  *.=
.|
  1.6e+06 *+.                       *..*..                       *..*      =
 |
  1.4e+06 ++ *    *..*.       .*.. +      *.*..*..*.  .*..*.*.. +          =
 *
          |   + ..     *..  *.    *                 *.         *           =
 |
  1.2e+06 ++   *           +                                               =
 |
    1e+06 ++              *                                                =
 |
          |                                                                =
 |
   800000 ++                                                               =
 |
   600000 ++                                                               =
 |
          |                                                                =
 |
   400000 ++                                                               =
 |
   200000 ++                                                               =
 |
          |                                                                =
 |
        0 O+-O-O--O--O-O--O-O--O--O-O--O--O-O--O--O-O--O--O-O--O-----------=
-+


                             sched_debug.cpu#0.ttwu_count

  1.8e+06 ++---------------------------------------------------------------=
-+
          |                                               *            *.  =
 |
  1.6e+06 ++                        *..                  : +         ..  *.=
.|
  1.4e+06 *+.     *..         .*.. +   *.. .*..*..       :  *..  *..*      =
 |
          |  *   +   *.*..  *.    *       *       *.*.. :       +          =
 *
  1.2e+06 ++  + +          +                           *       *           =
 |
    1e+06 ++   *          *                                                =
 |
          |                                                                =
 |
   800000 ++                                                               =
 |
   600000 ++                                                               =
 |
          |                                                                =
 |
   400000 ++                                                               =
 |
   200000 ++                                                               =
 |
          |                                                                =
 |
        0 O+-O-O--O--O-O--O-O--O--O-O--O--O-O--O--O-O--O--O-O--O-----------=
-+


                            sched_debug.cpu#6.nr_switches

  7e+06 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  6e+06 ++         *                                             *..*..    =
 |
        | .*      + :             .*..*..            .*         :      *.  =
 |
  5e+06 *+  :    +  :      *..*.*.       *.*..*..*..*  +        :        *.=
.*
        |   :  .*    :   ..                             +      :           =
 |
  4e+06 ++   *.      : .*                                *..*. :           =
 |
        |             *                                       *            =
 |
  3e+06 ++                                                                 =
 |
        |                                                                  =
 |
  2e+06 ++                                                                 =
 |
        |                                                                  =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 O+-O-O--O--O--O-O--O--O-O--O--O--O-O--O--O--O-O--O--O-O------------=
-+


                            sched_debug.cpu#6.sched_count

  7e+06 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  6e+06 ++         *                                             *..*..    =
 |
        | .*      + :             .*..*..            .*         :      *.  =
 |
  5e+06 *+  :    +  :      *..*.*.       *.*..*..*..*  +        :        *.=
.*
        |   :  .*    :   ..                             +      :           =
 |
  4e+06 ++   *.      : .*                                *..*. :           =
 |
        |             *                                       *            =
 |
  3e+06 ++                                                                 =
 |
        |                                                                  =
 |
  2e+06 ++                                                                 =
 |
        |                                                                  =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 O+-O-O--O--O--O-O--O--O-O--O--O--O-O--O--O--O-O--O--O-O------------=
-+


                            sched_debug.cpu#6.sched_goidle

  3.5e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    3e+06 ++         *                                           *..*..    =
 |
          | .*      +:             .*..*..            .*         :     *.  =
 |
  2.5e+06 *+  :    +  :     *..*..*       *.*..*..*.*.  +       :        *.=
.*
          |   :  .*   :    +                             +      :          =
 |
    2e+06 ++   *.      : .*                               *.*..:           =
 |
          |            *.                                      *           =
 |
  1.5e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 O+-O-O--O--O-O--O-O--O--O-O--O--O-O--O--O-O--O--O-O--O-----------=
-+


                             sched_debug.cpu#6.ttwu_count

    3e+06 ++---------------------------------------------------------------=
-+
          |         .*           .*.             .*.             *..  .*.*.=
.*
  2.5e+06 *+.     *.  :     *..*.   *..*..*.*..*.   *..*..       :  *.     =
 |
          |  *   +    :    :                              *.    :          =
 |
          |   + +      :   :                                *.. :          =
 |
    2e+06 ++   *       *..*                                    :           =
 |
          |                                                    *           =
 |
  1.5e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 O+-O-O--O--O-O--O-O--O--O-O--O--O-O--O--O-O--O--O-O--O-----------=
-+


                            sched_debug.cpu#7.nr_switches

  7e+06 ++-----------------------------------------------------------------=
-+
        |                     *                                            =
 |
  6e+06 ++                  .. +     .*..                          .*..    =
.*
        *..*    *..*       *    *..*.    *.*..*..*..*.  .*..     *.    *.*.=
 |
  5e+06 ++  :  +    +     +                           *.    *. ..          =
 |
        |   : +      +   +                                    *            =
 |
  4e+06 ++   *        *.*                                                  =
 |
        |                                                                  =
 |
  3e+06 ++                                                                 =
 |
        |                                                                  =
 |
  2e+06 ++                                                                 =
 |
        |                                                                  =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 O+-O-O--O--O--O-O--O--O-O--O--O--O-O--O--O--O-O--O--O-O------------=
-+


                            sched_debug.cpu#7.sched_count

  7e+06 ++-----------------------------------------------------------------=
-+
        |                     *                                            =
 |
  6e+06 ++                  .. +     .*..                          .*..    =
.*
        *..*    *..*       *    *..*.    *.*..*..*..*.  .*..     *.    *.*.=
 |
  5e+06 ++  :  +    +     +                           *.    *. ..          =
 |
        |   : +      +   +                                    *            =
 |
  4e+06 ++   *        *.*                                                  =
 |
        |                                                                  =
 |
  3e+06 ++                                                                 =
 |
        |                                                                  =
 |
  2e+06 ++                                                                 =
 |
        |                                                                  =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 O+-O-O--O--O--O-O--O--O-O--O--O--O-O--O--O--O-O--O--O-O------------=
-+


                            sched_debug.cpu#7.sched_goidle

  3.5e+06 ++---------------------------------------------------------------=
-+
          |                    *..                                         =
 |
    3e+06 ++                 ..       .*..                         .*..    =
.*
          *..*    *..*      *     *.*.    *.*..*..*.*..  .*.     *.    *.*.=
 |
  2.5e+06 ++  :  +    :    :                           *.   *.. +          =
 |
          |   : +     :    :                                   *           =
 |
    2e+06 ++   *       *..*                                                =
 |
          |                                                                =
 |
  1.5e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 O+-O-O--O--O-O--O-O--O--O-O--O--O-O--O--O-O--O--O-O--O-----------=
-+


                             sched_debug.cpu#7.ttwu_count

  3.5e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    3e+06 ++.*                     .*     *.                           *.  =
.*
          *.  :   *..*           .*  +   +  *..    .*..              ..  *.=
 |
  2.5e+06 ++  :  +    :     *..*.     + +      *..*    *..*     .*..*      =
 |
          |    :+     :    +           *                   +  .*           =
 |
    2e+06 ++   *       *..*                                 *.             =
 |
          |                                                                =
 |
  1.5e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 O+-O-O--O--O-O--O-O--O--O-O--O--O-O--O--O-O--O--O-O--O-----------=
-+


                            sched_debug.cpu#8.nr_switches

  7e+06 ++-----------------------------------------------------------------=
-+
        |       *                        *                         .*    *.=
.|
  6e+06 ++     : +                .*.. .. +  .*..     *..        *.  +  :  =
 *
        *..    :  +          .*.*.    *    *.    *.. +   *     ..     + :  =
 |
  5e+06 ++ *  :    *..    .*.                       *     +   *        *   =
 |
        |   + :        .*.                                 + +             =
 |
  4e+06 ++   *        *                                     *              =
 |
        |                                                                  =
 |
  3e+06 ++                                                                 =
 |
        |                                                                  =
 |
  2e+06 ++                                                                 =
 |
        |                                                                  =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 O+-O-O--O--O--O-O--O--O-O--O--O--O-O--O--O--O-O--O--O-O------------=
-+


                            sched_debug.cpu#8.sched_count

  7e+06 ++-----------------------------------------------------------------=
-+
        |       *                        *                         .*    *.=
.|
  6e+06 ++     : +                .*.. .. +  .*..     *..        *.  +  :  =
 *
        *..    :  +          .*.*.    *    *.    *.. +   *     ..     + :  =
 |
  5e+06 ++ *  :    *..    .*.                       *     +   *        *   =
 |
        |   + :        .*.                                 + +             =
 |
  4e+06 ++   *        *                                     *              =
 |
        |                                                                  =
 |
  3e+06 ++                                                                 =
 |
        |                                                                  =
 |
  2e+06 ++                                                                 =
 |
        |                                                                  =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 O+-O-O--O--O--O-O--O--O-O--O--O--O-O--O--O--O-O--O--O-O------------=
-+


                            sched_debug.cpu#8.sched_goidle

  3.5e+06 ++---------------------------------------------------------------=
-+
          |       *                       *                        .*    *.=
.|
    3e+06 ++     : +               .*.. .. +  .*..     *..       *.  +  :  =
 *
          *..    :  +         .*..*    *    *.    *. ..   *     +     + :  =
 |
  2.5e+06 ++ *  :    *     .*.                      *      :   *       *   =
 |
          |   + :     +  .*                                : ..            =
 |
    2e+06 ++   *       *.                                   *              =
 |
          |                                                                =
 |
  1.5e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 O+-O-O--O--O-O--O-O--O--O-O--O--O-O--O--O-O--O--O-O--O-----------=
-+


                             sched_debug.cpu#8.ttwu_count

  3.5e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    3e+06 ++                          .*..                       *..       =
 |
          *..                  *..*.*.     .*..*..*.            :   *..*.*.=
.*
  2.5e+06 ++      *..        ..           *         *..  .*     :          =
 |
          |  *. ..   *.  .*.*                          *.  :   *           =
 |
    2e+06 ++   *       *.                                  : ..            =
 |
          |                                                 *              =
 |
  1.5e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 O+-O-O--O--O-O--O-O--O--O-O--O--O-O--O--O-O--O--O-O--O-----------=
-+


                            sched_debug.cpu#9.nr_switches

  7e+06 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  6e+06 *+                      *..                      *       *         =
 |
        |+         *           +   *..                  : :     : :    *   =
 |
  5e+06 +++      .. :         *                         : :     :  :  + :  =
 *
        |  *.  .*   :   *.. ..        *..*.  .*..*..*. :   :   :   : +  : .=
.|
  4e+06 ++   *.      : :   *               *.         *    :   :    *    * =
 |
        |            : :                                    :.*            =
 |
  3e+06 ++            *                                     *              =
 |
        |                                                                  =
 |
  2e+06 ++                                                                 =
 |
        |                                                                  =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 O+-O-O--O--O--O-O--O--O-O--O--O--O-O--O--O--O-O--O--O-O------------=
-+


                            sched_debug.cpu#9.sched_count

  7e+06 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  6e+06 *+                      *..                      *       *         =
 |
        |+         *           +   *..                  : :     : :    *   =
 |
  5e+06 +++      .. :         *                         : :     :  :  + :  =
 *
        |  *.  .*   :   *.. ..        *..*.  .*..*..*. :   :   :   : +  : .=
.|
  4e+06 ++   *.      : :   *               *.         *    :   :    *    * =
 |
        |            : :                                    :.*            =
 |
  3e+06 ++            *                                     *              =
 |
        |                                                                  =
 |
  2e+06 ++                                                                 =
 |
        |                                                                  =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 O+-O-O--O--O--O-O--O--O-O--O--O--O-O--O--O--O-O--O--O-O------------=
-+


                            sched_debug.cpu#9.sched_goidle

  3.5e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    3e+06 *+                      *.                      *      *         =
 |
          |+         *          ..  *..                  ::      ::    *   =
 |
  2.5e+06 +++      ..:         *                         : :    :  :  + :  =
 *
          |  *.  .*   :   *. ..        *..*.  .*..*.*.. :  :    :  : +  : .=
.|
    2e+06 ++   *.     :  +  *               *.         *   :   :    *    * =
 |
          |            :+                                   : .*           =
 |
  1.5e+06 ++           *                                    *.             =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 O+-O-O--O--O-O--O-O--O--O-O--O--O-O--O--O-O--O--O-O--O-----------=
-+


                             sched_debug.cpu#9.ttwu_count

  3.5e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    3e+06 ++                        *..        *..               *..*..    =
 |
          *..*      .*             +   *..*   +   *              :     *.*.=
.|
  2.5e+06 ++  :   *. :      *..  .*        + +     +  .*..*     :          =
 |
          |   : ..    :    +   *.           *       *.     +    :          =
 *
    2e+06 ++   *      :   *                                 *..*           =
 |
          |            :..                                                 =
 |
  1.5e+06 ++           *                                                   =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 O+-O-O--O--O-O--O-O--O--O-O--O--O-O--O--O-O--O--O-O--O-----------=
-+


                           sched_debug.cpu#10.nr_switches

  7e+06 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  6e+06 ++                      *..                                        =
 |
        *..                    :   *..                           *..  .*.* =
 |
  5e+06 ++        .*       *.. :        .*.*..*..               +   *.    +=
 |
        |  *.  .*.  :    ..   *       *.         *..*.         +           =
+|
  4e+06 ++   *.      :  *                             *..*..*.*            =
 *
        |            : +                                                   =
 |
  3e+06 ++            *                                                    =
 |
        |                                                                  =
 |
  2e+06 ++                                                                 =
 |
        |                                                                  =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 O+-O-O--O--O--O-O--O--O-O--O--O--O-O--O--O--O-O--O--O-O------------=
-+


                           sched_debug.cpu#10.sched_count

  7e+06 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  6e+06 ++                      *..                                        =
 |
        *..                    :   *..                           *..  .*.* =
 |
  5e+06 ++        .*       *.. :        .*.*..*..               +   *.    +=
 |
        |  *.  .*.  :    ..   *       *.         *..*.         +           =
+|
  4e+06 ++   *.      :  *                             *..*..*.*            =
 *
        |            : +                                                   =
 |
  3e+06 ++            *                                                    =
 |
        |                                                                  =
 |
  2e+06 ++                                                                 =
 |
        |                                                                  =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 O+-O-O--O--O--O-O--O--O-O--O--O--O-O--O--O--O-O--O--O-O------------=
-+


                            sched_debug.cpu#10.sched_goidle

  3.5e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    3e+06 ++                      *.                                       =
 |
          *..                    +  *..                          *..  .*.* =
 |
  2.5e+06 ++        .*      *.. +        .*.*..*..              :   *.    +=
 |
          |  *.  .*.  :    +   *       *.         *.*..         :          =
+|
    2e+06 ++   *.     :   *                            *..*.*..*           =
 *
          |            :..                                                 =
 |
  1.5e+06 ++           *                                                   =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 O+-O-O--O--O-O--O-O--O--O-O--O--O-O--O--O-O--O--O-O--O-----------=
-+


                             sched_debug.cpu#10.ttwu_count

    3e+06 ++-*---------------------------------------------------*---------=
-+
          *. :                     .*..    .*..                  :  *..    =
 |
  2.5e+06 ++  :               .*..*    *..*    *..*.            :      *.  =
 |
          |   :            .*.                      *..*..*.    :        *.=
.|
          |    : .*..*    *                                 *..:           =
 *
    2e+06 ++   *.     :  +                                     *           =
 |
          |           : +                                                  =
 |
  1.5e+06 ++           *                                                   =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 O+-O-O--O--O-O--O-O--O--O-O--O--O-O--O--O-O--O--O-O--O-----------=
-+


                           sched_debug.cpu#11.nr_switches

  7e+06 ++-----------------------------------------------------------------=
-+
        |                                 .*..  .*..                       =
 |
  6e+06 *+.*                       *..  .*    *.                 *..  .*   =
 |
        |  :                      +   *.            *.*..       +   *.  :  =
 |
  5e+06 ++  :     .*             +                       *     +        :  =
.*
        |   :   *.  +   *..*..*.*                         :   *          *.=
 |
  4e+06 ++  :  +     + +                                   : :             =
 |
        |    :+       *                                    : :             =
 |
  3e+06 ++   *                                              *              =
 |
        |                                                                  =
 |
  2e+06 ++                                                                 =
 |
        |                                                                  =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 O+-O-O--O--O--O-O--O--O-O--O--O--O-O--O--O--O-O--O--O-O------------=
-+


                           sched_debug.cpu#11.sched_count

  7e+06 ++-----------------------------------------------------------------=
-+
        |                                 .*..  .*..                       =
 |
  6e+06 *+.*                       *..  .*    *.                 *..  .*   =
 |
        |  :                      +   *.            *.*..       +   *.  :  =
 |
  5e+06 ++  :     .*             +                       *     +        :  =
.*
        |   :   *.  +   *..*..*.*                         :   *          *.=
 |
  4e+06 ++  :  +     + +                                   : :             =
 |
        |    :+       *                                    : :             =
 |
  3e+06 ++   *                                              *              =
 |
        |                                                                  =
 |
  2e+06 ++                                                                 =
 |
        |                                                                  =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 O+-O-O--O--O--O-O--O--O-O--O--O--O-O--O--O--O-O--O--O-O------------=
-+


                            sched_debug.cpu#11.sched_goidle

  3.5e+06 ++---------------------------------------------------------------=
-+
          |                                .*..  .*                        =
 |
    3e+06 *+.*                      *..  .*    *.  +             *..  .*   =
 |
          |  :                     :   *.           *..*..      :   *.  :  =
 |
  2.5e+06 ++  :     .*             :                      *     :       :  =
.*
          |   :   *.  :   *.*..*..*                        :   *         *.=
 |
    2e+06 ++  :  +    : ..                                 :  +            =
 |
          |    :+      *                                    :+             =
 |
  1.5e+06 ++   *                                            *              =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 O+-O-O--O--O-O--O-O--O--O-O--O--O-O--O--O-O--O--O-O--O-----------=
-+


                             sched_debug.cpu#11.ttwu_count

  3.5e+06 ++---------------------------------------------------------------=
-+
          |         .*                                 *..                 =
 |
    3e+06 *+.     *. :      *..*..*.     .*.          +          *..*..*   =
 |
          |      :    :    :        *..*.   *..*..   +    *     +       :  =
 *
  2.5e+06 ++ *   :    :    :                      *.*      :   *        : .=
.|
          |   + :     :   *                                : ..          * =
 |
    2e+06 ++   *      :  +                                  *              =
 |
          |            :+                                                  =
 |
  1.5e+06 ++           *                                                   =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
        0 O+-O-O--O--O-O--O-O--O--O-O--O--O-O--O--O-O--O--O-O--O-----------=
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
Huang, Ying


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============6699025548643419076==
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
cjogcGVyZm9ybWFuY2UKY29tbWl0OiA1MTM5MWNlM2Q1OTM3NmNjYzJmY2NjMzYzNmYxZTlmYTc0
ZWY1ZDFhCm1vZGVsOiBXZXN0bWVyZQptZW1vcnk6IDZHCm5yX2hkZF9wYXJ0aXRpb25zOiAxCmhk
ZF9wYXJ0aXRpb25zOiAKc3dhcF9wYXJ0aXRpb25zOiAKcm9vdGZzX3BhcnRpdGlvbjogCm5ldGNv
bnNvbGVfcG9ydDogNjY2NwpwZXJmLXByb2ZpbGU6CiAgZnJlcTogODAwCndpbGwtaXQtc2NhbGU6
CiAgdGVzdDogd3JpdGVzZWVrMwp0ZXN0Ym94OiB3c20KdGJveF9ncm91cDogd3NtCmtjb25maWc6
IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNS0wMi0xMyAyMDozMTo0Mi42ODcxMTYyMDkg
KzA4OjAwCmhlYWRfY29tbWl0OiA1MTM5MWNlM2Q1OTM3NmNjYzJmY2NjMzYzNmYxZTlmYTc0ZWY1
ZDFhCmJhc2VfY29tbWl0OiBiZmE3NmQ0OTU3NjU5OWE0YjlmOWI3YTcxZjIzZDczZDZkY2ZmNzM1
CmJyYW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUwMjEzMDQKa2VybmVsOiAiL2tl
cm5lbC94ODZfNjQtcmhlbC81MTM5MWNlM2Q1OTM3NmNjYzJmY2NjMzYzNmYxZTlmYTc0ZWY1ZDFh
L3ZtbGludXotMy4xOS4wLWc1MTM5MWNlIgp1c2VyOiBsa3AKcXVldWU6IGN5Y2xpYwpyb290ZnM6
IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L3dzbS93
aWxsLWl0LXNjYWxlL3BlcmZvcm1hbmNlLXdyaXRlc2VlazMvZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNnei94ODZfNjQtcmhlbC81MTM5MWNlM2Q1OTM3NmNjYzJmY2NjMzYzNmYxZTlmYTc0ZWY1
ZDFhLzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvd3NtL2N5Y2xpY193aWxsLWl0LXNjYWxl
LXBlcmZvcm1hbmNlLXdyaXRlc2VlazMteDg2XzY0LXJoZWwtSEVBRC01MTM5MWNlM2Q1OTM3NmNj
YzJmY2NjMzYzNmYxZTlmYTc0ZWY1ZDFhLTAtMjAxNTAyMTMtMzE0ODUtdTVwdnFqLnlhbWwiCmRl
cXVldWVfdGltZTogMjAxNS0wMi0xNCAxMDo0NDoyMi44MTIxMDA2NjUgKzA4OjAwCm5yX2NwdTog
IiQobnByb2MpIgpqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDguNTEgNS4wMSAyLjA2IDEv
MTYwIDU2NTQKc3RhcnRfdGltZTogJzE0MjM4ODE4ODgnCmVuZF90aW1lOiAnMTQyMzg4MjE5MicK
dmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNTAyMTMtMDk0ODQ2Igo=

--===============6699025548643419076==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

Li9ydW50ZXN0LnB5IHdyaXRlc2VlazMgMzIgYm90aCAxIDYgOSAxMgo=

--===============6699025548643419076==--

