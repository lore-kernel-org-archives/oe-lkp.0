Content-Type: multipart/mixed; boundary="===============2050916496765387342=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [mutex] 6aa15f5a2fe: -9.2% will-it-scale.per_process_ops
Date: Fri, 13 Feb 2015 13:37:35 +0800
Message-ID: <1423805855.5968.139.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2050916496765387342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
commit 6aa15f5a2febe058056180786bb39513ad5ae70d ("mutex: In mutex_spin_on_o=
wner(), return true when owner changes")


testbox/testcase/testparams: wsm/will-it-scale/performance-writeseek3

afffc6c1805d98e0  6aa15f5a2febe058056180786b  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

  27329774 =C2=B1  5%     -98.7%     350559 =C2=B1  4%  will-it-scale.time.=
voluntary_context_switches
      1401 =C2=B1  4%    +340.4%       6172 =C2=B1  9%  will-it-scale.time.=
involuntary_context_switches
       402 =C2=B1  7%    +157.9%       1036 =C2=B1  0%  will-it-scale.time.=
system_time
       141 =C2=B1  6%    +146.3%        347 =C2=B1  0%  will-it-scale.time.=
percent_of_cpu_this_job_got
     28.29 =C2=B1  4%     -25.7%      21.01 =C2=B1  1%  will-it-scale.time.=
user_time
    777773 =C2=B1  0%      -9.2%     706114 =C2=B1  7%  will-it-scale.per_p=
rocess_ops
   4995546 =C2=B1 11%     -99.4%      31990 =C2=B1 29%  sched_debug.cpu#11.=
sched_count
    332497 =C2=B1  9%     -87.9%      40257 =C2=B1  4%  softirqs.SCHED
      0.96 =C2=B1 20%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.hrtimer_try_to_cancel.hrtimer_cancel.tick_nohz_restart.tick_nohz_idle_=
exit.cpu_startup_entry
      0.99 =C2=B1 14%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.hrtimer_cancel.tick_nohz_restart.tick_nohz_idle_exit.cpu_startup_entry=
.start_secondary
      1.40 =C2=B1  3%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.dequeue_entity.dequeue_task_fair.dequeue_task.deactivate_task.__schedu=
le
      1.36 =C2=B1 15%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.get_nohz_timer_target.__hrtimer_start_range_ns.hrtimer_start.tick_nohz=
_stop_sched_tick.__tick_nohz_idle_enter
      1.62 =C2=B1  4%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.pick_next_task_fair.__schedule.schedule_preempt_disabled.cpu_startup_e=
ntry.start_secondary
      1.69 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.dequeue_task_fair.dequeue_task.deactivate_task.__schedule.schedule_pre=
empt_disabled
     15.54 =C2=B1 32%    +351.5%      70.18 =C2=B1  2%  perf-profile.cpu-cy=
cles.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.generic_file_wr=
ite_iter.new_sync_write
      1.94 =C2=B1  3%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.dequeue_task.deactivate_task.__schedule.schedule_preempt_disabled.__mu=
tex_lock_slowpath
      1.96 =C2=B1  4%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.deactivate_task.__schedule.schedule_preempt_disabled.__mutex_lock_slow=
path.mutex_lock
      2.08 =C2=B1 11%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles._raw_spin_lock.try_to_wake_up.wake_up_process.__mutex_unlock_slowpath.=
mutex_unlock
     20.14 =C2=B1 10%     -82.3%       3.56 =C2=B1 34%  perf-profile.cpu-cy=
cles.start_secondary
     20.04 =C2=B1 10%     -82.2%       3.56 =C2=B1 34%  perf-profile.cpu-cy=
cles.cpu_startup_entry.start_secondary
      2.67 =C2=B1  8%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles._raw_spin_unlock_irqrestore.__hrtimer_start_range_ns.hrtimer_start_ran=
ge_ns.tick_nohz_restart.tick_nohz_idle_exit
   4495470 =C2=B1  7%     -99.4%      25868 =C2=B1 12%  sched_debug.cpu#9.n=
r_switches
   4496190 =C2=B1  7%     -99.4%      26052 =C2=B1 12%  sched_debug.cpu#9.s=
ched_count
  40599.18 =C2=B1 41%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.max_vruntime
      3.30 =C2=B1  8%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.__hrtimer_start_range_ns.hrtimer_start_range_ns.tick_nohz_restart.tick=
_nohz_idle_exit.cpu_startup_entry
      3.33 =C2=B1  6%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.hrtimer_start_range_ns.tick_nohz_restart.tick_nohz_idle_exit.cpu_start=
up_entry.start_secondary
   2247155 =C2=B1  7%     -99.4%      12447 =C2=B1 14%  sched_debug.cpu#9.s=
ched_goidle
  40599.18 =C2=B1 41%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.MIN_vruntime
      3.99 =C2=B1  6%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.__schedule.schedule_preempt_disabled.__mutex_lock_slowpath.mutex_lock.=
generic_file_write_iter
   2448071 =C2=B1  2%     -99.4%      13482 =C2=B1  9%  sched_debug.cpu#6.t=
twu_count
   2554386 =C2=B1  2%     -99.5%      13020 =C2=B1  8%  sched_debug.cpu#6.s=
ched_goidle
   5111673 =C2=B1  2%     -99.5%      26787 =C2=B1  8%  sched_debug.cpu#6.s=
ched_count
   2527550 =C2=B1  6%     -99.5%      12538 =C2=B1 14%  sched_debug.cpu#9.t=
twu_count
   5109913 =C2=B1  2%     -99.5%      26531 =C2=B1  8%  sched_debug.cpu#6.n=
r_switches
     54085 =C2=B1 37%    +845.7%     511463 =C2=B1 40%  sched_debug.cfs_rq[=
5]:/.min_vruntime
      8424 =C2=B1 16%    +560.9%      55678 =C2=B1 42%  sched_debug.cfs_rq[=
5]:/.exec_clock
   1201871 =C2=B1 19%     -83.0%     204673 =C2=B1 49%  sched_debug.cpu#5.s=
ched_count
        10 =C2=B1 28%    +490.5%         62 =C2=B1 31%  sched_debug.cpu#5.c=
pu_load[4]
  93687275 =C2=B1 19%     -94.0%    5611171 =C2=B1 33%  cpuidle.C1-NHM.time
    558262 =C2=B1 18%     -96.2%      21169 =C2=B1  6%  cpuidle.C1-NHM.usage
 9.831e+08 =C2=B1 15%     -98.8%   11473350 =C2=B1 25%  cpuidle.C3-NHM.time
   3976387 =C2=B1 13%     -99.3%      26803 =C2=B1  6%  cpuidle.C3-NHM.usage
   1390481 =C2=B1  7%     -95.5%      63030 =C2=B1  4%  cpuidle.C6-NHM.usage
      0.92 =C2=B1  8%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles._raw_spin_lock_irqsave.try_to_wake_up.wake_up_process.__mutex_unlock_s=
lowpath.mutex_unlock
   5406764 =C2=B1  9%     -99.3%      38661 =C2=B1 36%  sched_debug.cpu#8.n=
r_switches
  27329774 =C2=B1  5%     -98.7%     350559 =C2=B1  4%  time.voluntary_cont=
ext_switches
   2702648 =C2=B1  9%     -99.3%      18971 =C2=B1 37%  sched_debug.cpu#8.s=
ched_goidle
   5408351 =C2=B1  9%     -99.3%      38886 =C2=B1 36%  sched_debug.cpu#8.s=
ched_count
     23.91 =C2=B1 12%     -99.1%       0.22 =C2=B1 40%  turbostat.CPU%c3
   1588237 =C2=B1  8%     -87.6%     197379 =C2=B1 28%  sched_debug.cpu#1.s=
ched_goidle
        12 =C2=B1 21%    +400.0%         61 =C2=B1 31%  sched_debug.cpu#5.c=
pu_load[3]
        14 =C2=B1 15%    +324.6%         60 =C2=B1 30%  sched_debug.cpu#5.c=
pu_load[2]
   2804909 =C2=B1  4%     -99.5%      15331 =C2=B1 33%  sched_debug.cpu#11.=
ttwu_count
   2496582 =C2=B1 11%     -99.4%      14895 =C2=B1 31%  sched_debug.cpu#11.=
sched_goidle
   2449189 =C2=B1  2%     -99.2%      19646 =C2=B1 34%  sched_debug.cpu#8.t=
twu_count
   2672337 =C2=B1  9%     -98.3%      44488 =C2=B1 29%  sched_debug.cpu#0.n=
r_switches
   4995012 =C2=B1 11%     -99.4%      31857 =C2=B1 29%  sched_debug.cpu#11.=
nr_switches
   1201660 =C2=B1 19%     -83.0%     204494 =C2=B1 49%  sched_debug.cpu#5.n=
r_switches
    955232 =C2=B1 15%     -85.7%     136563 =C2=B1 20%  sched_debug.cpu#4.t=
twu_count
    995565 =C2=B1 13%     -86.3%     136302 =C2=B1 19%  sched_debug.cpu#4.s=
ched_goidle
   1992443 =C2=B1 13%     -86.2%     274424 =C2=B1 19%  sched_debug.cpu#4.s=
ched_count
   2673257 =C2=B1  9%     -98.3%      44671 =C2=B1 29%  sched_debug.cpu#0.s=
ched_count
   1334237 =C2=B1  9%     -98.5%      20205 =C2=B1 32%  sched_debug.cpu#0.s=
ched_goidle
   1354162 =C2=B1  5%     -98.3%      22809 =C2=B1 28%  sched_debug.cpu#0.t=
twu_count
  26659.70 =C2=B1 14%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.MIN_vruntime
   1992050 =C2=B1 13%     -86.2%     274292 =C2=B1 19%  sched_debug.cpu#4.n=
r_switches
     88563 =C2=B1 27%    +365.2%     411997 =C2=B1 25%  sched_debug.cfs_rq[=
3]:/.min_vruntime
  26659.70 =C2=B1 14%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.max_vruntime
   1531974 =C2=B1 19%     -89.7%     157815 =C2=B1 23%  sched_debug.cpu#2.t=
twu_count
   1650173 =C2=B1 16%     -90.5%     157023 =C2=B1 24%  sched_debug.cpu#2.s=
ched_goidle
   2264230 =C2=B1  4%     -99.5%      12323 =C2=B1  7%  sched_debug.cpu#10.=
ttwu_count
   3177630 =C2=B1  8%     -87.5%     395822 =C2=B1 28%  sched_debug.cpu#1.n=
r_switches
   3302396 =C2=B1 16%     -90.4%     315490 =C2=B1 24%  sched_debug.cpu#2.s=
ched_count
   4365273 =C2=B1  5%     -99.4%      24251 =C2=B1  6%  sched_debug.cpu#10.=
nr_switches
   3301465 =C2=B1 16%     -90.4%     315323 =C2=B1 24%  sched_debug.cpu#2.n=
r_switches
   4366326 =C2=B1  5%     -99.4%      24433 =C2=B1  6%  sched_debug.cpu#10.=
sched_count
   2182166 =C2=B1  5%     -99.5%      11526 =C2=B1  7%  sched_debug.cpu#10.=
sched_goidle
   1462067 =C2=B1  3%     -86.5%     197145 =C2=B1 29%  sched_debug.cpu#1.t=
twu_count
   3178415 =C2=B1  8%     -87.5%     396013 =C2=B1 28%  sched_debug.cpu#1.s=
ched_count
    145590 =C2=B1 45%    +280.1%     553319 =C2=B1 14%  sched_debug.cfs_rq[=
1]:/.min_vruntime
      1.14 =C2=B1 19%     -78.9%       0.24 =C2=B1 34%  perf-profile.cpu-cy=
cles.shmem_file_llseek.sys_lseek.system_call_fastpath
     14.24 =C2=B1  4%     -82.6%       2.48 =C2=B1 43%  perf-profile.cpu-cy=
cles.__mutex_unlock_slowpath.mutex_unlock.generic_file_write_iter.new_sync_=
write.vfs_write
     14.38 =C2=B1  4%     -82.2%       2.56 =C2=B1 41%  perf-profile.cpu-cy=
cles.mutex_unlock.generic_file_write_iter.new_sync_write.vfs_write.sys_write
     98519 =C2=B1 38%    +276.0%     370400 =C2=B1 40%  sched_debug.cfs_rq[=
4]:/.min_vruntime
        12 =C2=B1 23%    +324.5%         52 =C2=B1 23%  sched_debug.cpu#3.c=
pu_load[4]
       148 =C2=B1 13%    +291.3%        582 =C2=B1 28%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
      6860 =C2=B1 12%    +288.6%      26657 =C2=B1 28%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
      1401 =C2=B1  4%    +340.4%       6172 =C2=B1  9%  time.involuntary_co=
ntext_switches
    962541 =C2=B1 20%     -74.3%     247827 =C2=B1 22%  sched_debug.cpu#3.t=
twu_count
  27121946 =C2=B1 39%    +207.6%   83418729 =C2=B1 41%  cpuidle.POLL.time
     13141 =C2=B1 10%    +248.4%      45786 =C2=B1 28%  sched_debug.cfs_rq[=
3]:/.exec_clock
    871810 =C2=B1 19%     -71.6%     247691 =C2=B1 22%  sched_debug.cpu#3.s=
ched_goidle
   1744545 =C2=B1 19%     -71.5%     497212 =C2=B1 22%  sched_debug.cpu#3.n=
r_switches
   1744810 =C2=B1 19%     -71.5%     497350 =C2=B1 22%  sched_debug.cpu#3.s=
ched_count
      8013 =C2=B1 48%    +177.9%      22273 =C2=B1 26%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
       175 =C2=B1 48%    +177.1%        485 =C2=B1 26%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
        19 =C2=B1 21%    +236.4%         64 =C2=B1 30%  sched_debug.cfs_rq[=
5]:/.runnable_load_avg
        18 =C2=B1 35%    +236.0%         63 =C2=B1 14%  sched_debug.cpu#1.c=
pu_load[4]
        18 =C2=B1 14%    +226.0%         59 =C2=B1 28%  sched_debug.cpu#5.c=
pu_load[1]
     20.76 =C2=B1 23%    +239.0%      70.38 =C2=B1  2%  perf-profile.cpu-cy=
cles.__mutex_lock_slowpath.mutex_lock.generic_file_write_iter.new_sync_writ=
e.vfs_write
    152212 =C2=B1 36%    +234.5%     509104 =C2=B1  9%  sched_debug.cfs_rq[=
2]:/.min_vruntime
      7857 =C2=B1 13%    +193.3%      23042 =C2=B1 16%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
       171 =C2=B1 13%    +192.1%        501 =C2=B1 16%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
        14 =C2=B1 26%    +267.2%         53 =C2=B1 21%  sched_debug.cpu#3.c=
pu_load[3]
        18 =C2=B1 33%    +213.5%         58 =C2=B1  7%  sched_debug.cpu#2.c=
pu_load[4]
     23.57 =C2=B1 20%    +205.2%      71.91 =C2=B1  2%  perf-profile.cpu-cy=
cles.mutex_lock.generic_file_write_iter.new_sync_write.vfs_write.sys_write
        20 =C2=B1 30%    +214.8%         63 =C2=B1 14%  sched_debug.cpu#1.c=
pu_load[3]
      2.08 =C2=B1 12%     -66.5%       0.70 =C2=B1 11%  perf-profile.cpu-cy=
cles.sys_lseek.system_call_fastpath
      1.42 =C2=B1 15%     -73.2%       0.38 =C2=B1 22%  perf-profile.cpu-cy=
cles.file_update_time.__generic_file_write_iter.generic_file_write_iter.new=
_sync_write.vfs_write
        18 =C2=B1 37%    +194.7%         55 =C2=B1 18%  sched_debug.cpu#3.c=
pu_load[2]
       740 =C2=B1 11%    +182.5%       2091 =C2=B1 17%  sched_debug.cpu#5.c=
urr->pid
     21881 =C2=B1 23%    +163.3%      57608 =C2=B1 16%  sched_debug.cfs_rq[=
1]:/.exec_clock
    246670 =C2=B1 26%    +164.8%     653087 =C2=B1  5%  sched_debug.cfs_rq[=
8]:/.min_vruntime
    114092 =C2=B1  5%     -67.0%      37644 =C2=B1  5%  softirqs.RCU
        30 =C2=B1 30%    +125.6%         68 =C2=B1 15%  sched_debug.cpu#1.c=
pu_load[0]
        36 =C2=B1 44%    +132.7%         85 =C2=B1 19%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
        28 =C2=B1 16%    +163.7%         74 =C2=B1  5%  sched_debug.cpu#8.c=
pu_load[4]
       258 =C2=B1 22%    +139.6%        620 =C2=B1  9%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
     11830 =C2=B1 21%    +139.7%      28352 =C2=B1  9%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
        22 =C2=B1 27%    +185.6%         64 =C2=B1 13%  sched_debug.cpu#1.c=
pu_load[2]
    430107 =C2=B1 20%    +153.1%    1088393 =C2=B1  0%  softirqs.TIMER
        21 =C2=B1 21%    +178.6%         58 =C2=B1  7%  sched_debug.cpu#2.c=
pu_load[3]
        24 =C2=B1 19%    +144.3%         59 =C2=B1 26%  sched_debug.cpu#5.c=
pu_load[0]
       818 =C2=B1 29%    +131.7%       1895 =C2=B1  6%  sched_debug.cpu#3.c=
urr->pid
     11124 =C2=B1 29%    +135.6%      26209 =C2=B1  5%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
        31 =C2=B1 13%    +141.9%         75 =C2=B1  5%  sched_debug.cpu#8.c=
pu_load[3]
       243 =C2=B1 29%    +134.7%        571 =C2=B1  5%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
        28 =C2=B1 20%    +142.6%         69 =C2=B1 13%  sched_debug.cpu#7.c=
pu_load[4]
       402 =C2=B1  7%    +157.9%       1036 =C2=B1  0%  time.system_time
       834 =C2=B1 18%    +152.6%       2108 =C2=B1 14%  sched_debug.cpu#1.c=
urr->pid
      1.13 =C2=B1  8%     -59.6%       0.46 =C2=B1  3%  perf-profile.cpu-cy=
cles.__sb_end_write.vfs_write.sys_write.system_call_fastpath
        30 =C2=B1 17%    +130.1%         70 =C2=B1 14%  sched_debug.cpu#7.c=
pu_load[3]
    253168 =C2=B1 22%    +141.0%     610051 =C2=B1 10%  sched_debug.cfs_rq[=
7]:/.min_vruntime
        26 =C2=B1  9%    +147.7%         66 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
       141 =C2=B1  6%    +146.3%        347 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
        25 =C2=B1 24%    +154.4%         65 =C2=B1 14%  sched_debug.cpu#1.c=
pu_load[1]
     31986 =C2=B1 39%    +129.0%      73256 =C2=B1 16%  sched_debug.cfs_rq[=
0]:/.exec_clock
      1.19 =C2=B1 11%     -53.6%       0.55 =C2=B1  3%  perf-profile.cpu-cy=
cles.__sb_start_write.vfs_write.sys_write.system_call_fastpath
    215936 =C2=B1 21%    +135.4%     508378 =C2=B1 30%  sched_debug.cfs_rq[=
10]:/.min_vruntime
    233932 =C2=B1 23%    +100.7%     469477 =C2=B1 20%  sched_debug.cfs_rq[=
9]:/.min_vruntime
      0.93 =C2=B1 13%     -55.3%       0.41 =C2=B1  8%  perf-profile.cpu-cy=
cles.__srcu_read_unlock.fsnotify.vfs_write.sys_write.system_call_fastpath
      1.23 =C2=B1 16%     -57.2%       0.53 =C2=B1  6%  perf-profile.cpu-cy=
cles.find_get_entry.find_lock_entry.shmem_getpage_gfp.shmem_write_begin.gen=
eric_perform_write
        32 =C2=B1 10%    +123.7%         73 =C2=B1 16%  sched_debug.cpu#7.c=
pu_load[2]
    187996 =C2=B1 37%    +213.3%     588915 =C2=B1 10%  sched_debug.cfs_rq[=
0]:/.min_vruntime
      1684 =C2=B1  8%     -59.5%        681 =C2=B1 19%  cpuidle.POLL.usage
      1.50 =C2=B1 14%     -56.7%       0.65 =C2=B1  7%  perf-profile.cpu-cy=
cles.unlock_page.shmem_write_end.generic_perform_write.__generic_file_write=
_iter.generic_file_write_iter
        35 =C2=B1  9%    +115.5%         76 =C2=B1  6%  sched_debug.cpu#8.c=
pu_load[2]
        30 =C2=B1 13%     +94.2%         58 =C2=B1 24%  sched_debug.cpu#10.=
cpu_load[4]
      3.56 =C2=B1  8%     -51.2%       1.74 =C2=B1 19%  perf-profile.cpu-cy=
cles.shmem_write_end.generic_perform_write.__generic_file_write_iter.generi=
c_file_write_iter.new_sync_write
      7.42 =C2=B1  6%     -52.0%       3.56 =C2=B1  2%  perf-profile.cpu-cy=
cles.copy_user_generic_string.generic_perform_write.__generic_file_write_it=
er.generic_file_write_iter.new_sync_write
      3508 =C2=B1 17%    +104.5%       7174 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
      3508 =C2=B1 17%    +104.5%       7175 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
      3513 =C2=B1 17%    +104.3%       7177 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
      3516 =C2=B1 17%    +104.2%       7179 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
      3517 =C2=B1 17%    +104.2%       7181 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
      3520 =C2=B1 17%    +104.1%       7183 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
      3522 =C2=B1 17%    +104.0%       7184 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
      3524 =C2=B1 17%    +103.9%       7185 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
      2.21 =C2=B1 11%     -55.5%       0.98 =C2=B1  7%  perf-profile.cpu-cy=
cles.find_lock_entry.shmem_getpage_gfp.shmem_write_begin.generic_perform_wr=
ite.__generic_file_write_iter
      3528 =C2=B1 17%    +103.7%       7186 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
      3532 =C2=B1 17%    +103.5%       7188 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
      3509 =C2=B1 17%    +104.5%       7177 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
      3513 =C2=B1 17%    +104.2%       7173 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
      3.50 =C2=B1  6%     -52.9%       1.65 =C2=B1  8%  perf-profile.cpu-cy=
cles.shmem_write_begin.generic_perform_write.__generic_file_write_iter.gene=
ric_file_write_iter.new_sync_write
      2.96 =C2=B1  9%     -54.3%       1.35 =C2=B1  5%  perf-profile.cpu-cy=
cles.shmem_getpage_gfp.shmem_write_begin.generic_perform_write.__generic_fi=
le_write_iter.generic_file_write_iter
      1.33 =C2=B1 10%     -52.2%       0.64 =C2=B1  1%  perf-profile.cpu-cy=
cles.system_call
      2.91 =C2=B1  6%     -49.0%       1.48 =C2=B1 13%  perf-profile.cpu-cy=
cles.fsnotify.vfs_write.sys_write.system_call_fastpath
       968 =C2=B1 32%    +111.7%       2049 =C2=B1 11%  sched_debug.cpu#2.c=
urr->pid
     22881 =C2=B1 17%    +125.4%      51569 =C2=B1  9%  sched_debug.cfs_rq[=
2]:/.exec_clock
     20.55 =C2=B1  4%     -50.4%      10.20 =C2=B1  3%  perf-profile.cpu-cy=
cles.__generic_file_write_iter.generic_file_write_iter.new_sync_write.vfs_w=
rite.sys_write
        25 =C2=B1 16%    +131.7%         58 =C2=B1  7%  sched_debug.cpu#2.c=
pu_load[2]
     12228 =C2=B1 24%    +149.6%      30527 =C2=B1  9%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
       267 =C2=B1 24%    +149.2%        666 =C2=B1  8%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
     36965 =C2=B1 14%     +90.9%      70555 =C2=B1  6%  sched_debug.cfs_rq[=
8]:/.exec_clock
       974 =C2=B1 17%    +118.5%       2129 =C2=B1  7%  sched_debug.cpu#0.c=
urr->pid
        33 =C2=B1 15%     +79.3%         60 =C2=B1 22%  sched_debug.cpu#10.=
cpu_load[3]
      1018 =C2=B1 10%     +86.4%       1898 =C2=B1 26%  sched_debug.cpu#10.=
curr->pid
       344 =C2=B1 20%     +92.7%        664 =C2=B1  9%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
     15780 =C2=B1 20%     +93.2%      30482 =C2=B1  9%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
      1.18 =C2=B1  6%     -50.1%       0.59 =C2=B1  6%  perf-profile.cpu-cy=
cles.__srcu_read_lock.fsnotify.vfs_write.sys_write.system_call_fastpath
      1.36 =C2=B1  8%     -50.6%       0.67 =C2=B1  3%  perf-profile.cpu-cy=
cles.system_call_after_swapgs
     17.36 =C2=B1  6%     -48.1%       9.00 =C2=B1  2%  perf-profile.cpu-cy=
cles.generic_perform_write.__generic_file_write_iter.generic_file_write_ite=
r.new_sync_write.vfs_write
       348 =C2=B1 12%     +98.7%        691 =C2=B1  4%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib
     15908 =C2=B1 12%     +99.2%      31685 =C2=B1  4%  sched_debug.cfs_rq[=
8]:/.avg->runnable_avg_sum
         2 =C2=B1 15%    +109.1%          5 =C2=B1  7%  vmstat.procs.r
        57 =C2=B1 18%     +76.6%        102 =C2=B1 26%  sched_debug.cfs_rq[=
0]:/.load
        39 =C2=B1 19%     +61.1%         63 =C2=B1 20%  sched_debug.cpu#10.=
cpu_load[2]
       979 =C2=B1 12%     +93.5%       1894 =C2=B1 19%  sched_debug.cpu#4.c=
urr->pid
        36 =C2=B1 12%    +113.0%         77 =C2=B1 22%  sched_debug.cpu#7.c=
pu_load[1]
      2.58 =C2=B1  4%     -56.6%       1.12 =C2=B1 41%  perf-profile.cpu-cy=
cles._raw_spin_lock.__mutex_unlock_slowpath.mutex_unlock.generic_file_write=
_iter.new_sync_write
        29 =C2=B1 20%     +89.9%         56 =C2=B1 19%  sched_debug.cpu#9.c=
pu_load[4]
       328 =C2=B1 16%     +66.5%        547 =C2=B1 15%  sched_debug.cfs_rq[=
9]:/.tg_runnable_contrib
        28 =C2=B1 21%     +67.5%         47 =C2=B1 43%  sched_debug.cpu#11.=
cpu_load[3]
     15011 =C2=B1 16%     +67.0%      25062 =C2=B1 15%  sched_debug.cfs_rq[=
9]:/.avg->runnable_avg_sum
      6.06 =C2=B1 27%     +64.2%       9.95 =C2=B1  3%  perf-profile.cpu-cy=
cles.mutex_spin_on_owner.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_=
lock.generic_file_write_iter
      1328 =C2=B1  8%     +72.3%       2288 =C2=B1 11%  sched_debug.cpu#6.c=
urr->pid
      3035 =C2=B1  6%     -43.1%       1727 =C2=B1  0%  uptime.idle
        62 =C2=B1 19%     +64.1%        103 =C2=B1 26%  sched_debug.cpu#0.l=
oad
        27 =C2=B1 25%     +65.8%         46 =C2=B1 46%  sched_debug.cpu#11.=
cpu_load[4]
        30 =C2=B1 23%     +91.0%         58 =C2=B1  8%  sched_debug.cpu#2.c=
pu_load[1]
        33 =C2=B1 20%     +73.5%         57 =C2=B1 18%  sched_debug.cpu#9.c=
pu_load[3]
       335 =C2=B1  6%     +70.3%        570 =C2=B1 23%  sched_debug.cfs_rq[=
10]:/.tg_runnable_contrib
     15314 =C2=B1  6%     +70.7%      26147 =C2=B1 23%  sched_debug.cfs_rq[=
10]:/.avg->runnable_avg_sum
        43 =C2=B1 15%     +83.2%         79 =C2=B1  8%  sched_debug.cpu#8.c=
pu_load[1]
      1002 =C2=B1 29%     +96.0%       1964 =C2=B1 16%  sched_debug.cpu#9.c=
urr->pid
        37 =C2=B1 26%     +56.3%         59 =C2=B1 16%  sched_debug.cpu#9.c=
pu_load[2]
     38074 =C2=B1 11%     +70.5%      64907 =C2=B1 14%  sched_debug.cfs_rq[=
7]:/.exec_clock
     35574 =C2=B1 12%     +37.3%      48848 =C2=B1 26%  sched_debug.cfs_rq[=
9]:/.exec_clock
      1446 =C2=B1 22%     +53.7%       2223 =C2=B1 10%  sched_debug.cpu#7.c=
urr->pid
    303929 =C2=B1  8%     +49.3%     453870 =C2=B1 17%  sched_debug.cpu#9.a=
vg_idle
     39159 =C2=B1 16%     +64.5%      64413 =C2=B1 14%  sched_debug.cpu#3.n=
r_load_updates
    487643 =C2=B1 21%     +71.0%     834025 =C2=B1  5%  sched_debug.cfs_rq[=
6]:/.min_vruntime
        45 =C2=B1 30%     +90.2%         87 =C2=B1 30%  sched_debug.cpu#7.c=
pu_load[0]
        55 =C2=B1 18%     +65.3%         91 =C2=B1 26%  sched_debug.cpu#1.l=
oad
     59.50 =C2=B1  5%     +43.1%      85.14 =C2=B1  2%  perf-profile.cpu-cy=
cles.generic_file_write_iter.new_sync_write.vfs_write.sys_write.system_call=
_fastpath
     24882 =C2=B1 19%     +51.9%      37790 =C2=B1  7%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
       543 =C2=B1 19%     +51.8%        824 =C2=B1  7%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
     63.20 =C2=B1  5%     +38.4%      87.45 =C2=B1  3%  perf-profile.cpu-cy=
cles.new_sync_write.vfs_write.sys_write.system_call_fastpath
      2.83 =C2=B1  3%     -31.4%       1.94 =C2=B1 14%  perf-profile.cpu-cy=
cles.mutex_unlock.new_sync_write.vfs_write.sys_write.system_call_fastpath
      2391 =C2=B1  3%     +43.0%       3419 =C2=B1  1%  proc-vmstat.pgactiv=
ate
      1330 =C2=B1 33%     +71.0%       2275 =C2=B1  4%  sched_debug.cpu#8.c=
urr->pid
     28.29 =C2=B1  4%     -25.7%      21.01 =C2=B1  1%  time.user_time
     31.42 =C2=B1  7%     -24.9%      23.60 =C2=B1  3%  turbostat.CPU%c1
     70.99 =C2=B1  4%     +28.4%      91.13 =C2=B1  2%  perf-profile.cpu-cy=
cles.vfs_write.sys_write.system_call_fastpath
     72.19 =C2=B1  3%     +27.1%      91.74 =C2=B1  2%  perf-profile.cpu-cy=
cles.sys_write.system_call_fastpath
     74.71 =C2=B1  3%     +24.0%      92.63 =C2=B1  2%  perf-profile.cpu-cy=
cles.system_call_fastpath
      2766 =C2=B1  1%     +26.2%       3491 =C2=B1  0%  proc-vmstat.nr_shmem
     11068 =C2=B1  1%     +26.2%      13969 =C2=B1  0%  meminfo.Shmem
        54 =C2=B1 17%     +40.1%         76 =C2=B1 13%  sched_debug.cfs_rq[=
1]:/.load
        55 =C2=B1 32%     +43.0%         79 =C2=B1 13%  sched_debug.cfs_rq[=
8]:/.runnable_load_avg
      2690 =C2=B1  5%     -10.1%       2417 =C2=B1  2%  slabinfo.kmalloc-25=
6.active_objs
        60 =C2=B1  1%     +10.4%         66 =C2=B1  2%  turbostat.CoreTmp
      6214 =C2=B1  2%      -7.0%       5777 =C2=B1  5%  slabinfo.vm_area_st=
ruct.num_objs
     24089 =C2=B1  4%      +9.4%      26356 =C2=B1  0%  meminfo.Active(anon)
      6024 =C2=B1  4%      +9.4%       6589 =C2=B1  0%  proc-vmstat.nr_acti=
ve_anon
     17.44 =C2=B1  1%      -9.4%      15.80 =C2=B1  2%  turbostat.CPU%c6
   1064863 =C2=B1 12%     -13.3%     923694 =C2=B1  0%  cpuidle.C1E-NHM.usa=
ge
    378254 =C2=B1  4%     -97.0%      11409 =C2=B1  2%  vmstat.system.cs
     27.23 =C2=B1 16%    +121.7%      60.38 =C2=B1  1%  turbostat.%Busy
       959 =C2=B1 16%    +121.5%       2124 =C2=B1  1%  turbostat.Avg_MHz
      7791 =C2=B1  4%     +33.8%      10421 =C2=B1  0%  vmstat.system.in

wsm: Westmere
Memory: 6G




                                 time.system_time

  1100 ++------------------------------------------------------------------=
-+
       O  O O  O  O O  O  O O  O  O O  O  O O  O O  O  O O  O  O O  O  O O =
 O
  1000 ++                                                                  =
 |
   900 ++                                                                  =
 |
       |                                                                   =
 |
   800 ++                                                                  =
 |
       |                                                                   =
 |
   700 ++              *                                                   =
 |
       |              + :                                                  =
 |
   600 ++            +  :                                                  =
 |
   500 ++           *    :                                                 =
 |
       |      .*.. +     :         .*..                    .*              =
 |
   400 *+.*.*.    *       *.*..*..*    *..*.*..*.*..    .*.                =
 |
       |                                            *..*                   =
 |
   300 ++------------------------------------------------------------------=
-+


                         time.percent_of_cpu_this_job_got

  350 O+-O-O--O--O-O--O--O--O-O--O--O-O--O--O-O--O--O-O--O--O--O-O--O--O-O-=
-O
      |                                                                    =
 |
      |                                                                    =
 |
  300 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  250 ++              *                                                    =
 |
      |              + :                                                   =
 |
  200 ++            +  :                                                   =
 |
      |            *    :                                                  =
 |
      |           +     :                                                  =
 |
  150 ++  .*..*..*       :   .*..  .*.  .*..               .*              =
 |
      *..*               *..*    *.   *.    *.*..*..*.*..*.                =
 |
      |                                                                    =
 |
  100 ++-------------------------------------------------------------------=
-+


                            time.voluntary_context_switches

    3e+07 ++-----------------------------------------*---------------------=
-+
          *..                              *..      +   *.*..              =
 |
  2.5e+07 ++     .*.*..*.  .*.*..    .*. ..   *.*..*         *             =
 |
          |  *.*.        *.      *.*.   *                                  =
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
        0 O+-O-O--O-O--O-O--O-O--O-O--O-O--O--O-O--O-O--O-O--O-O--O-O--O-O-=
-O


                                   softirqs.SCHED

  450000 ++----------------------------------------------------------------=
-+
         |            *                                                    =
 |
  400000 ++          + +                            .*                     =
 |
  350000 ++         +   *..                      .*.  +      *             =
 |
         |   .*..*.*           .*..*.*..*..  *..*      *.. ..              =
 |
  300000 *+.*              *..*             +             *                =
 |
  250000 ++                                *                               =
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
         O  O O  O O  O O  O  O O  O O  O  O O  O O  O O  O  O O  O O  O O =
 O
       0 ++----------------------------------------------------------------=
-+


                                    softirqs.RCU

  130000 ++----------------------------------------------------------------=
-+
  120000 ++                          *..                     *             =
 |
         | .*.  .*.*..         .*.. +   *..     *     .*.. ..              =
 |
  110000 *+   *.           *..*    *       *   + +  .*    *                =
 |
  100000 ++           *. ..                 + +   *.                       =
 |
         |              *                    *                             =
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
         |         O               O                                       =
 |
   40000 O+ O O  O    O O  O  O O    O  O  O O    O  O O     O O  O O  O O =
 O
   30000 ++-------------------------------------O---------O----------------=
-+


                                cpuidle.C1-NHM.usage

  900000 ++----------------------------------------------------------------=
-+
         |                             .*       *.*                        =
 |
  800000 ++           *.             *.  :     :   :                       =
 |
  700000 ++          :  *..*..      :    :     :    :        *             =
 |
         |           :              :     :   :     :       +              =
 |
  600000 *+.*.*..   :         *.*..*      : .*       *     +               =
 |
  500000 ++      *.*                       *          +  .*                =
 |
         |                                             *.                  =
 |
  400000 ++                                                                =
 |
  300000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
  100000 ++                                                                =
 |
         |                      O  O O  O                                  =
 |
       0 O+-O-O--O-O--O-O--O--O------------O-O--O-O--O-O--O--O-O--O-O--O-O-=
-O


                                 cpuidle.C6-NHM.usage

  1.8e+06 ++---------------------------------------------------------------=
-+
          |         *                 *.*..                                =
 |
  1.6e+06 *+. .*.. + +       .*..    +     *..  *..*        .*             =
 |
  1.4e+06 ++ *    *   +     *    *. +          +    +    .*.               =
 |
          |            *. ..       *          *      *..*                  =
 |
  1.2e+06 ++             *                                                 =
 |
    1e+06 ++                                                               =
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
          |    O    O              O            O         O              O =
 |
        0 O+-O----O----O-O--O-O--O----O-O--O--O----O-O--O----O-O--O-O--O---=
-O


                          will-it-scale.time.system_time

  1100 ++------------------------------------------------------------------=
-+
       O  O O  O  O O  O  O O  O  O O  O  O O  O O  O  O O  O  O O  O  O O =
 O
  1000 ++                                                                  =
 |
   900 ++                                                                  =
 |
       |                                                                   =
 |
   800 ++                                                                  =
 |
       |                                                                   =
 |
   700 ++              *                                                   =
 |
       |              + :                                                  =
 |
   600 ++            +  :                                                  =
 |
   500 ++           *    :                                                 =
 |
       |      .*.. +     :         .*..                    .*              =
 |
   400 *+.*.*.    *       *.*..*..*    *..*.*..*.*..    .*.                =
 |
       |                                            *..*                   =
 |
   300 ++------------------------------------------------------------------=
-+


                  will-it-scale.time.percent_of_cpu_this_job_got

  350 O+-O-O--O--O-O--O--O--O-O--O--O-O--O--O-O--O--O-O--O--O--O-O--O--O-O-=
-O
      |                                                                    =
 |
      |                                                                    =
 |
  300 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  250 ++              *                                                    =
 |
      |              + :                                                   =
 |
  200 ++            +  :                                                   =
 |
      |            *    :                                                  =
 |
      |           +     :                                                  =
 |
  150 ++  .*..*..*       :   .*..  .*.  .*..               .*              =
 |
      *..*               *..*    *.   *.    *.*..*..*.*..*.                =
 |
      |                                                                    =
 |
  100 ++-------------------------------------------------------------------=
-+


                     will-it-scale.time.voluntary_context_switches

    3e+07 ++-----------------------------------------*---------------------=
-+
          *..                              *..      +   *.*..              =
 |
  2.5e+07 ++     .*.*..*.  .*.*..    .*. ..   *.*..*         *             =
 |
          |  *.*.        *.      *.*.   *                                  =
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
        0 O+-O-O--O-O--O-O--O-O--O-O--O-O--O--O-O--O-O--O-O--O-O--O-O--O-O-=
-O


                                  vmstat.system.cs

  450000 ++----------------------------------------------------------------=
-+
         *..                                                               =
 |
  400000 ++ *    *.*..        *.*.. .*..        *.    .*..*..*             =
 |
  350000 ++  + ..           ..     *    *..   ..  *..*                     =
 |
         |    *       *    *               *.*                             =
 |
  300000 ++            + ..                                                =
 |
  250000 ++             *                                                  =
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
       0 O+-O-O--O-O--O-O--O--O-O--O-O--O--O-O--O-O--O-O--O--O-O--O-O--O-O-=
-O


                             sched_debug.cpu#0.nr_switches

  3.5e+06 ++-----------------------*---------------------------------------=
-+
          |                      *  +                                      =
 |
    3e+06 *+.      .*..     *. ..    +     *..           .*..              =
 |
          |  *    *        +  *       *. ..    .*..     *                  =
 |
  2.5e+06 ++  + ..     *. +             *     *    *. ..     *             =
 |
          |    *         *                           *                     =
 |
    2e+06 ++                                                               =
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
        0 O+-O-O--O-O--O-O--O-O--O-O--O-O--O--O-O--O-O--O-O--O-O--O-O--O-O-=
-O


                             sched_debug.cpu#0.sched_count

  3.5e+06 ++-----------------------*---------------------------------------=
-+
          |                      *  +                                      =
 |
    3e+06 *+.      .*..     *. ..    +     *..           .*..              =
 |
          |  *    *        +  *       *. ..    .*..    .*                  =
 |
  2.5e+06 ++  + ..     *. +             *     *    *.*.      *             =
 |
          |    *         *                                                 =
 |
    2e+06 ++                                                               =
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
        0 O+-O-O--O-O--O-O--O-O--O-O--O-O--O--O-O--O-O--O-O--O-O--O-O--O-O-=
-O


                            sched_debug.cpu#0.sched_goidle

  1.8e+06 ++---------------------------------------------------------------=
-+
          |                      *.*..                                     =
 |
  1.6e+06 *+.                   +          *..           .*..              =
 |
  1.4e+06 ++ *    *.*..     *. +      *. ..    .*..     *                  =
 |
          |   + ..     *   +  *         *     *       ..     *             =
 |
  1.2e+06 ++   *        + +                        *.*                     =
 |
    1e+06 ++             *                                                 =
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
        0 O+-O-O--O-O--O-O--O-O--O-O--O-O--O--O-O--O-O--O-O--O-O--O-O--O-O-=
-O


                             sched_debug.cpu#0.ttwu_count

  1.8e+06 ++-----------------------*---------------------------------------=
-+
          |                       : +                                      =
 |
  1.6e+06 ++                      :  +                                     =
 |
  1.4e+06 *+.     *.        *.*..*    *    *..  *..    .*.*..*             =
 |
          |  *   +  *..*   +           + ..    +    .*.                    =
 |
  1.2e+06 ++  + +       + +             *     *    *                       =
 |
    1e+06 ++   *         *                                                 =
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
        0 O+-O-O--O-O--O-O--O-O--O-O--O-O--O--O-O--O-O--O-O--O-O--O-O--O-O-=
-O


                             sched_debug.cpu#1.nr_switches

    4e+06 *+---------------------------------------------------------------=
-+
          |:                                                               =
 |
  3.5e+06 ++:                     .*..                 .*.                 =
 |
    3e+06 ++:    .*.*..       *..*    *           .*.*.   *..              =
 |
          |  *.*.            +         +     .*.*.           *             =
 |
  2.5e+06 ++           *.  .*           *..*.                              =
 |
          |              *.                                                =
 |
    2e+06 ++                                                               =
 |
          |                                                                =
 |
  1.5e+06 ++                                                               =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++ O    O    O                      O    O         O      O      =
 |
          O    O    O    O  O O  O O  O O  O    O    O  O O    O  O    O O =
 O
        0 ++---------------------------------------------------------------=
-+


                             sched_debug.cpu#1.sched_count

    4e+06 *+---------------------------------------------------------------=
-+
          |:                                                               =
 |
  3.5e+06 ++:                     .*..                 .*.                 =
 |
    3e+06 ++:    .*.*..       *..*    *           .*.*.   *..              =
 |
          |  *.*.            +         +     .*.*.           *             =
 |
  2.5e+06 ++           *.  .*           *..*.                              =
 |
          |              *.                                                =
 |
    2e+06 ++                                                               =
 |
          |                                                                =
 |
  1.5e+06 ++                                                               =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   500000 ++ O    O    O                      O    O         O      O      =
 |
          O    O    O    O  O O  O O  O O  O    O    O  O O    O  O    O O =
 O
        0 ++---------------------------------------------------------------=
-+


                            sched_debug.cpu#1.sched_goidle

    2e+06 *+---------------------------------------------------------------=
-+
  1.8e+06 ++                                                               =
 |
          | :                     .*..                 .*.                 =
 |
  1.6e+06 ++:    .*.*..       *..*    *           .*.*.   *..              =
 |
  1.4e+06 ++ *.*.            +         +     .*.*.           *             =
 |
          |            *.  .*           *..*.                              =
 |
  1.2e+06 ++             *.                                                =
 |
    1e+06 ++                                                               =
 |
   800000 ++                                                               =
 |
          |                                                                =
 |
   600000 ++                                                               =
 |
   400000 ++                                                               =
 |
          |  O    O    O                      O    O         O      O      =
 |
   200000 O+   O    O    O  O O  O O  O O  O    O    O  O O    O  O    O O =
 O
        0 ++---------------------------------------------------------------=
-+


                             sched_debug.cpu#1.ttwu_count

  1.8e+06 ++---------------------------------------------------------------=
-+
          *..                                                              =
 |
  1.6e+06 ++      *.*..       *..*.*..*                .*.                 =
 |
  1.4e+06 ++ *. ..           +         +  .*.. .*..*.*.   *..*             =
 |
          |    *       *.  .*           *.    *                            =
 |
  1.2e+06 ++             *.                                                =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   800000 ++                                                               =
 |
   600000 ++                                                               =
 |
          |                                                                =
 |
   400000 ++                                  O                            =
 |
   200000 ++ O O  O    O    O         O            O         O      O    O =
 O
          O         O    O    O  O O    O  O    O    O  O O    O  O    O   =
 |
        0 ++---------------------------------------------------------------=
-+


                             sched_debug.cpu#2.nr_switches

  4.5e+06 ++---------------------------------------------------------------=
-+
          |                                                  *             =
 |
    4e+06 ++                                               ..              =
 |
  3.5e+06 ++                                              *                =
 |
          | .*     .*..*    *     .*.. .*..*.. .*..      +                 =
 |
    3e+06 *+  :   *     :  + +  .*    *       *    *.  .*                  =
 |
  2.5e+06 ++  : ..      : +   *.                     *.                    =
 |
          |    *         *                                                 =
 |
    2e+06 ++                                                               =
 |
  1.5e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
   500000 ++   O    O    O    O       O              O         O           =
 |
          O  O         O    O    O O    O  O    O  O    O O  O    O O  O O =
 O
        0 ++------O---------------------------O----------------------------=
-+


                             sched_debug.cpu#2.sched_count

  4.5e+06 ++---------------------------------------------------------------=
-+
          |                                                  *             =
 |
    4e+06 ++                                               ..              =
 |
  3.5e+06 ++                                              *                =
 |
          | .*     .*..*    *     .*.. .*..*.. .*..      +                 =
 |
    3e+06 *+  :   *     :  + +  .*    *       *    *.  .*                  =
 |
  2.5e+06 ++  : ..      : +   *.                     *.                    =
 |
          |    *         *                                                 =
 |
    2e+06 ++                                                               =
 |
  1.5e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
   500000 ++   O    O    O    O       O              O         O           =
 |
          O  O         O    O    O O    O  O    O  O    O O  O    O O  O O =
 O
        0 ++------O---------------------------O----------------------------=
-+


                            sched_debug.cpu#2.sched_goidle

  2.2e+06 ++---------------------------------------------------------------=
-+
    2e+06 ++                                                 *             =
 |
          |                                                ..              =
 |
  1.8e+06 ++        *..                                  .*                =
 |
  1.6e+06 ++.*     +   *    *     .*.. .*..*.. .*..     *                  =
 |
  1.4e+06 *+  +  .*     :  + +  .*    *       *    *. ..                   =
 |
  1.2e+06 ++   *.       : +   *.                     *                     =
 |
          |              *                                                 =
 |
    1e+06 ++                                                               =
 |
   800000 ++                                                               =
 |
   600000 ++                                                               =
 |
   400000 ++                                                               =
 |
          |    O    O    O    O       O              O         O           =
 |
   200000 O+ O         O    O    O O    O  O  O O  O    O O  O    O O  O O =
 O
        0 ++------O--------------------------------------------------------=
-+


                             sched_debug.cpu#2.ttwu_count

    2e+06 ++-------------------------------------------------*-------------=
-+
  1.8e+06 ++                                                +              =
 |
          |         *..                                    +               =
 |
  1.6e+06 *+.      :   *    *.    .*..          *..      .*                =
 |
  1.4e+06 ++ *     :    :  +  *..*    *.*..*.. +   *    *                  =
 |
          |   +  .*     : +                   *     + ..                   =
 |
  1.2e+06 ++   *.        *                           *                     =
 |
    1e+06 ++                                                               =
 |
   800000 ++                                                               =
 |
          |                                                                =
 |
   600000 ++                                                               =
 |
   400000 ++                                                               =
 |
          |    O    O    O    O       O              O         O           =
 |
   200000 O+ O         O    O    O O    O  O  O O  O    O O  O    O O  O O =
 O
        0 ++------O--------------------------------------------------------=
-+


                            sched_debug.cpu#6.nr_switches

  6e+06 ++--------*--------------------------------------------------------=
-+
        | .*     : :                   *..                                 =
 |
  5e+06 *+  :    : :           .*     +               .*..*.*              =
 |
        |   :  .*   :        *.  :   *    *    *..*.*.                     =
 |
        |    *.     :       +    : ..      :   :                           =
 |
  4e+06 ++           : .*. +      *         : :                            =
 |
        |            *.   *                 : :                            =
 |
  3e+06 ++                                   *                             =
 |
        |                                                                  =
 |
  2e+06 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 O+-O-O--O-O--O--O-O--O--O-O--O-O--O--O-O--O-O--O--O-O--O--O-O--O-O-=
-O


                            sched_debug.cpu#6.sched_count

  6e+06 ++--------*--------------------------------------------------------=
-+
        | .*     : :                   *..                                 =
 |
  5e+06 *+  :    : :           .*     +               .*..*.*              =
 |
        |   :  .*   :        *.  :   *    *    *..*.*.                     =
 |
        |    *.     :       +    : ..      :   :                           =
 |
  4e+06 ++           : .*. +      *         : :                            =
 |
        |            *.   *                 : :                            =
 |
  3e+06 ++                                   *                             =
 |
        |                                                                  =
 |
  2e+06 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 O+-O-O--O-O--O--O-O--O--O-O--O-O--O--O-O--O-O--O--O-O--O--O-O--O-O-=
-O


                            sched_debug.cpu#6.sched_goidle

    3e+06 ++--------*------------------------------------------------------=
-+
          | .*     : :                  *..                                =
 |
  2.5e+06 *+  :    : :          .*     +               .*.*..*             =
 |
          |   :  .*   :       *.  :   *    *    *..*.*.                    =
 |
          |    *.     :      :    : ..      :   :                          =
 |
    2e+06 ++           :.*.. :     *         : :                           =
 |
          |            *    *                : :                           =
 |
  1.5e+06 ++                                  *                            =
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
        0 O+-O-O--O-O--O-O--O-O--O-O--O-O--O--O-O--O-O--O-O--O-O--O-O--O-O-=
-O


                             sched_debug.cpu#6.ttwu_count

    3e+06 ++---------------------------------------------------------------=
-+
          |        .*         *..                                          =
 |
  2.5e+06 *+.     *  :        :        .*..              .*..*             =
 |
          |  *   +    :      :   *    *         *..*.*..*                  =
 |
          |   + +     :      :    + ..     *    :                          =
 |
    2e+06 ++   *       *.*.. :     *        +  :                           =
 |
          |                 :                + :                           =
 |
  1.5e+06 ++                *                 *                            =
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
        0 O+-O-O--O-O--O-O--O-O--O-O--O-O--O--O-O--O-O--O-O--O-O--O-O--O-O-=
-O


                            sched_debug.cpu#7.nr_switches

  6e+06 ++-----------------------------------------------------------------=
-+
        |       *.*          *..    .*.                    .*              =
 |
  5e+06 *+.*   +   :        :    .*.   *..     *.. .*..*..*                =
 |
        |   + +     :       :   *         *    :  *                        =
 |
        |    *      :      :               +  :                            =
 |
  4e+06 ++           *..*. :                + :                            =
 |
        |                 *                  *                             =
 |
  3e+06 ++                                                                 =
 |
        |                                                                  =
 |
  2e+06 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  1e+06 ++                                                                 =
 |
        |                                                              O   =
 |
      0 O+-O-O--O-O--O--O-O--O--O-O--O-O--O--O-O--O-O--O--O-O--O--O-O----O-=
-O


                            sched_debug.cpu#7.sched_count

  6e+06 ++-----------------------------------------------------------------=
-+
        |       *.*          *..    .*.                    .*              =
 |
  5e+06 *+.*   +   :        :    .*.   *..     *.. .*..*..*                =
 |
        |   + +     :       :   *         *    :  *                        =
 |
        |    *      :      :               +  :                            =
 |
  4e+06 ++           *..*. :                + :                            =
 |
        |                 *                  *                             =
 |
  3e+06 ++                                                                 =
 |
        |                                                                  =
 |
  2e+06 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  1e+06 ++                                                                 =
 |
        |                                                              O   =
 |
      0 O+-O-O--O-O--O--O-O--O--O-O--O-O--O--O-O--O-O--O--O-O--O--O-O----O-=
-O


                            sched_debug.cpu#7.sched_goidle

    3e+06 ++---------------------------------------------------------------=
-+
          |       *.*         *..    .*.                    .*             =
 |
  2.5e+06 *+.*   +   :        :   .*.   *..     *.. .*..*.*.               =
 |
          |   + +     :      :   *         *    :  *                       =
 |
          |    *      :      :              +  :                           =
 |
    2e+06 ++           *.*..:                + :                           =
 |
          |                 *                 *                            =
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
          |                                                            O   =
 |
        0 O+-O-O--O-O--O-O--O-O--O-O--O-O--O--O-O--O-O--O-O--O-O--O-O----O-=
-O


                             sched_debug.cpu#7.ttwu_count

  3.5e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    3e+06 ++.*                                                             =
 |
          *.  :   *.*           .*.  .*.*..              .*..              =
 |
  2.5e+06 ++  :  +   +        *.   *.      *    *..*.*..*    *             =
 |
          |    :+     +      :              :   :                          =
 |
    2e+06 ++   *       *.*.. :               : :                           =
 |
          |                 *                : :                           =
 |
  1.5e+06 ++                                  *                            =
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
        0 O+-O-O--O-O--O-O--O-O--O-O--O-O--O--O-O--O-O--O-O--O-O--O-O--O-O-=
-O


                            sched_debug.cpu#8.nr_switches

  7e+06 ++-----------------------------------------------------------------=
-+
        |       *            *                                             =
 |
  6e+06 ++     : :          : +                       .*..                 =
 |
        *..    : :          :  +      .*..     *..  *.                     =
 |
  5e+06 ++ *  :   *..      :    *.  .*         :   +      *.               =
 |
        |   + :        .*. :      *.      *.. :   *         *              =
 |
  4e+06 ++   *       *.   *                   :                            =
 |
        |                                    *                             =
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
      0 O+-O-O--O-O--O--O-O--O--O-O--O-O--O--O-O--O-O--O--O-O--O--O-O--O-O-=
-O


                            sched_debug.cpu#8.sched_count

  7e+06 ++-----------------------------------------------------------------=
-+
        |       *            *                                             =
 |
  6e+06 ++     : :          : +                       .*..                 =
 |
        *..    : :          :  +      .*..     *..  *.                     =
 |
  5e+06 ++ *  :   *..      :    *.  .*         :   +      *.               =
 |
        |   + :        .*. :      *.      *.. :   *         *              =
 |
  4e+06 ++   *       *.   *                   :                            =
 |
        |                                    *                             =
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
      0 O+-O-O--O-O--O--O-O--O--O-O--O-O--O--O-O--O-O--O--O-O--O--O-O--O-O-=
-O


                            sched_debug.cpu#8.sched_goidle

  3.5e+06 ++---------------------------------------------------------------=
-+
          |       *           *                                            =
 |
    3e+06 ++     : :          :+                       .*                  =
 |
          *..    : :         :  +      .*..     *..  *.  +                 =
 |
  2.5e+06 ++ *  :   *..      :   *.  .*         :   +     *..              =
 |
          |   + :       .*..:      *.      *.. :   *         *             =
 |
    2e+06 ++   *       *    *                  :                           =
 |
          |                                   *                            =
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
        0 O+-O-O--O-O--O-O--O-O--O-O--O-O--O--O-O--O-O--O-O--O-O--O-O--O-O-=
-O


                             sched_debug.cpu#8.ttwu_count

    3e+06 ++---------------------------------------------------------------=
-+
          *..                                                              =
 |
  2.5e+06 ++      *.          *..*    *.               .*.                 =
 |
          |  *   +  *..       :   + ..  *..*    *..*.*.   *..*             =
 |
          |   + +       .*.. :     *        :   :                          =
 |
    2e+06 ++   *       *     :               : :                           =
 |
          |                 *                : :                           =
 |
  1.5e+06 ++                                  *                            =
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
        0 O+-O-O--O-O--O-O--O-O--O-O--O-O--O--O-O--O-O--O-O--O-O--O-O--O-O-=
-O


                             sched_debug.cpu#9.ttwu_count

    3e+06 ++---------------------------------------------------------------=
-+
          *..       *                                    .*..              =
 |
  2.5e+06 ++ *     + :        *..      .*..     *    *..*                  =
 |
          |   :   *  :        :      .*         :+  :        *             =
 |
          |   : ..    :  *.. :   *.*.      *   :  + :                      =
 |
    2e+06 ++   *      : :    :              :  :   *                       =
 |
          |            ::   *                : :                           =
 |
  1.5e+06 ++           *                     ::                            =
 |
          |                                   *                            =
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
        0 O+-O-O--O-O--O-O--O-O--O-O--O-O--O--O-O--O-O--O-O--O-O--O-O--O-O-=
-O


                           sched_debug.cpu#10.nr_switches

  6e+06 ++-----------------------------------------------------------------=
-+
        *                                                                  =
 |
  5e+06 ++                     .*.  .*.*..     *..                         =
 |
        | +      .*          *.   *.      *    :      .*.. .*              =
 |
        |  *.*..*  :        :              :  :   *.*.    *                =
 |
  4e+06 ++          :   *   :              :  :                            =
 |
        |           : .. + :                : :                            =
 |
  3e+06 ++           *    *                 ::                             =
 |
        |                                    *                             =
 |
  2e+06 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 O+-O-O--O-O--O--O-O--O--O-O--O-O--O--O-O--O-O--O--O-O--O--O-O--O-O-=
-O


                           sched_debug.cpu#10.sched_count

  6e+06 ++-----------------------------------------------------------------=
-+
        *                                                                  =
 |
  5e+06 ++                     .*.  .*.*..     *..                         =
 |
        | +      .*          *.   *.      *    :      .*.. .*              =
 |
        |  *.*..*  :        :              :  :   *.*.    *                =
 |
  4e+06 ++          :   *   :              :  :                            =
 |
        |           : .. + :                : :                            =
 |
  3e+06 ++           *    *                 ::                             =
 |
        |                                    *                             =
 |
  2e+06 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  1e+06 ++                                                                 =
 |
        |                                                                  =
 |
      0 O+-O-O--O-O--O--O-O--O--O-O--O-O--O--O-O--O-O--O--O-O--O--O-O--O-O-=
-O


                            sched_debug.cpu#10.sched_goidle

    3e+06 ++---------------------------------------------------------------=
-+
          *                                                                =
 |
  2.5e+06 ++                    .*.  .*.*..     *..                        =
 |
          | +      .*         *.   *.      *    :      .*.  .*             =
 |
          |  *.*..*  :        :             :  :   *.*.   *.               =
 |
    2e+06 ++          :  *.. :              :  :                           =
 |
          |           : +    :               : :                           =
 |
  1.5e+06 ++           *    *                ::                            =
 |
          |                                   *                            =
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
        0 O+-O-O--O-O--O-O--O-O--O-O--O-O--O--O-O--O-O--O-O--O-O--O-O--O-O-=
-O


                             sched_debug.cpu#10.ttwu_countTO: =

CC: =

CC: =

CC: =




    3e+06 ++-*-------------------------------------------------------------=
-+
          *. :                                                             =
 |
  2.5e+06 ++  :                 .*.        *                               =
 |
          |   :               *.   *..*. .. :   *..*.  .*.*..*             =
 |
          |    : .*.*    *    :         *   :   :    *.                    =
 |
    2e+06 ++   *.    +  : +  :               : :                           =
 |
          |           + :  + :               : :                           =
 |
  1.5e+06 ++           *    *                 *                            =
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
        0 O+-O-O--O-O--O-O--O-O--O-O--O-O--O--O-O--O-O--O-O--O-O--O-O--O-O-=
-O


                           sched_debug.cpu#11.nr_switches

  7e+06 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  6e+06 *+.*                                              *                =
 |
        |  :                 *..*.             *..       + +               =
 |
  5e+06 ++  :    .*         :     *..*.*..*    :  *.    +   *              =
 |
        |   :   *  +    *   :              :  :     *..*                   =
 |
  4e+06 ++  :  +    + .. + :                : :                            =
 |
        |    :+      *    *                 ::                             =
 |
  3e+06 ++   *                               *                             =
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
      0 O+-O-O--O-O--O--O-O--O--O-O--O-O--O--O-O--O-O--O--O-O--O--O-O--O-O-=
-O


                           sched_debug.cpu#11.sched_count

  7e+06 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  6e+06 *+.*                                              *                =
 |
        |  :                 *..*.             *..       + +               =
 |
  5e+06 ++  :    .*         :     *..*.*..*    :  *.    +   *              =
 |
        |   :   *  +    *   :              :  :     *..*                   =
 |
  4e+06 ++  :  +    + .. + :                : :                            =
 |
        |    :+      *    *                 ::                             =
 |
  3e+06 ++   *                               *                             =
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
      0 O+-O-O--O-O--O--O-O--O--O-O--O-O--O--O-O--O-O--O--O-O--O--O-O--O-O-=
-O


                            sched_debug.cpu#11.sched_goidle

  3.5e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    3e+06 *+.*                                            *..              =
 |
          |  :                *..*.             *..      :                 =
 |
  2.5e+06 ++  :    .*         :    *..*.*..*    :  *.    :   *             =
 |
          |   :   *  +   *.. :              :  :     *..*                  =
 |
    2e+06 ++  :  +    + +    :               : :                           =
 |
          |    :+      *    *                ::                            =
 |
  1.5e+06 ++   *                              *                            =
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
        0 O+-O-O--O-O--O-O--O-O--O-O--O-O--O--O-O--O-O--O-O--O-O--O-O--O-O-=
-O


                             sched_debug.cpu#11.ttwu_count

  3.5e+06 ++---------------------------------------------------------------=
-+
          |        .*                                                      =
 |
    3e+06 *+.     * :                                    .*..              =
 |
          |      :   :        *..*.     *..     *.. .*..*    *             =
 |
  2.5e+06 ++ *   :   :       :     *.. +   *    :  *                       =
 |
          |   + :     :  *.. :        *     +  :                           =
 |
    2e+06 ++   *      : :   *                + :                           =
 |
          |            ::                     *                            =
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
        0 O+-O-O--O-O--O-O--O-O--O-O--O-O--O--O-O--O-O--O-O--O-O--O-O--O-O-=
-O

        [*] bisect-good sample
        [O] bisect-bad  sample

To reproduce:

        apt-get install ruby
        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tes=
ts.git
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


--===============2050916496765387342==
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
cjogcGVyZm9ybWFuY2UKY29tbWl0OiA4NWQ4OGFjZGNhMzRlYmIzYzBmZTM1MjA1YWE5ZGJkNGU1
YmE0NDQ1Cm1vZGVsOiBXZXN0bWVyZQptZW1vcnk6IDZHCm5yX2hkZF9wYXJ0aXRpb25zOiAxCmhk
ZF9wYXJ0aXRpb25zOiAKc3dhcF9wYXJ0aXRpb25zOiAKcm9vdGZzX3BhcnRpdGlvbjogCm5ldGNv
bnNvbGVfcG9ydDogNjY2NwpwZXJmLXByb2ZpbGU6CiAgZnJlcTogODAwCndpbGwtaXQtc2NhbGU6
CiAgdGVzdDogd3JpdGVzZWVrMwp0ZXN0Ym94OiB3c20KdGJveF9ncm91cDogd3NtCmtjb25maWc6
IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNS0wMi0xMiAwNzoyNTowOC45MzU5MjY1MDQg
KzA4OjAwCmhlYWRfY29tbWl0OiA4NWQ4OGFjZGNhMzRlYmIzYzBmZTM1MjA1YWE5ZGJkNGU1YmE0
NDQ1CmJhc2VfY29tbWl0OiBiZmE3NmQ0OTU3NjU5OWE0YjlmOWI3YTcxZjIzZDczZDZkY2ZmNzM1
CmJyYW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUwMjEyMDQKa2VybmVsOiAiL2tl
cm5lbC94ODZfNjQtcmhlbC84NWQ4OGFjZGNhMzRlYmIzYzBmZTM1MjA1YWE5ZGJkNGU1YmE0NDQ1
L3ZtbGludXotMy4xOS4wLXdsLWF0aC1nODVkODhhYyIKdXNlcjogbGtwCnF1ZXVlOiBjeWNsaWMK
cm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3Vs
dC93c20vd2lsbC1pdC1zY2FsZS9wZXJmb3JtYW5jZS13cml0ZXNlZWszL2RlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvODVkODhhY2RjYTM0ZWJiM2MwZmUzNTIwNWFhOWRi
ZDRlNWJhNDQ0NS8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL3dzbS9jeWNsaWNfd2lsbC1p
dC1zY2FsZS1wZXJmb3JtYW5jZS13cml0ZXNlZWszLXg4Nl82NC1yaGVsLUhFQUQtODVkODhhY2Rj
YTM0ZWJiM2MwZmUzNTIwNWFhOWRiZDRlNWJhNDQ0NS0wLTIwMTUwMjEyLTMxNDQwLTE0dm9kdG8u
eWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE1LTAyLTEyIDE5OjU2OjIyLjc3Mjg4MjA5NSArMDg6MDAK
bnJfY3B1OiAiJChucHJvYykiCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogOC40MSA0Ljkz
IDIuMDMgMS8xNjEgNTY0OQpzdGFydF90aW1lOiAnMTQyMzc0MjIwNicKZW5kX3RpbWU6ICcxNDIz
NzQyNTEwJwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE1MDIxMi0xODQwMjQiCg==

--===============2050916496765387342==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

Li9ydW50ZXN0LnB5IHdyaXRlc2VlazMgMzIgYm90aCAxIDYgOSAxMgo=

--===============2050916496765387342==--

