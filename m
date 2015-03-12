Content-Type: multipart/mixed; boundary="===============4977682915665396709=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [locking/rwsem] 1a99367023f: no primary result change, +23.6% will-it-scale.time.system_time
Date: Thu, 12 Mar 2015 14:35:40 +0800
Message-ID: <1426142140.6711.214.camel@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4977682915665396709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit 1a99367023f6ac664365a37fa508b059e31d0e88 ("locking/rwsem: Check for =
active lock before bailing on spinning")

There is some minor will-it-scale.per_thread_ops changes below (-1.8%), but=
 not stable enough during bisect.
So in general, there is no user visible change, just more system time.

testbox/testcase/testparams: ivb42/will-it-scale/performance-brk1

b3fd4f03ca0b9952  1a99367023f6ac664365a37fa5  =

----------------  --------------------------  =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :4           25%           1:4     kmsg.Spurious_LAPIC_timer_int=
errupt_on_cpu
         %stddev     %change         %stddev
             \          |                \  =

       308 =C2=B1  3%     +23.6%        381 =C2=B1  1%  will-it-scale.time.=
system_time
        99 =C2=B1  3%     +20.2%        119 =C2=B1  0%  will-it-scale.time.=
percent_of_cpu_this_job_got
  34098838 =C2=B1  1%      +6.0%   36159517 =C2=B1  2%  will-it-scale.time.=
voluntary_context_switches
       314 =C2=B1  0%      +2.5%        322 =C2=B1  0%  will-it-scale.time.=
elapsed_time
       314 =C2=B1  0%      +2.5%        322 =C2=B1  0%  will-it-scale.time.=
elapsed_time.max
      0.61 =C2=B1 20%    +428.8%       3.21 =C2=B1  5%  perf-profile.cpu-cy=
cles.osq_lock.rwsem_down_write_failed.call_rwsem_down_write_failed.sys_brk.=
system_call_fastpath
      0.39 =C2=B1 23%    +127.3%       0.88 =C2=B1 14%  perf-profile.cpu-cy=
cles.osq_unlock.rwsem_down_write_failed.call_rwsem_down_write_failed.sys_br=
k.system_call_fastpath
    991202 =C2=B1 25%     -47.8%     517752 =C2=B1 41%  sched_debug.cpu#5.s=
ched_count
    481295 =C2=B1 25%     -48.0%     250449 =C2=B1 42%  sched_debug.cpu#5.s=
ched_goidle
    963157 =C2=B1 25%     -47.9%     501898 =C2=B1 42%  sched_debug.cpu#5.n=
r_switches
      5.03 =C2=B1 16%    +133.3%      11.73 =C2=B1  7%  perf-profile.cpu-cy=
cles.rwsem_spin_on_owner.rwsem_down_write_failed.call_rwsem_down_write_fail=
ed.sys_brk.system_call_fastpath
    185603 =C2=B1 45%     +99.3%     369978 =C2=B1 34%  sched_debug.cpu#9.t=
twu_count
        17 =C2=B1 20%     +75.0%         29 =C2=B1 35%  sched_debug.cfs_rq[=
33]:/.load
      1.07 =C2=B1 13%     +88.8%       2.02 =C2=B1 17%  perf-profile.cpu-cy=
cles.__kernel_text_address.print_context_stack.dump_trace.save_stack_trace_=
tsk.__account_scheduler_latency
      2.41 =C2=B1  9%     +92.7%       4.64 =C2=B1 12%  perf-profile.cpu-cy=
cles._raw_spin_lock_irqsave.rwsem_wake.call_rwsem_wake.sys_brk.system_call_=
fastpath
      1201 =C2=B1 30%     -45.8%        651 =C2=B1 21%  cpuidle.C3-IVT.usage
      1.92 =C2=B1  3%     -39.8%       1.16 =C2=B1 19%  perf-profile.cpu-cy=
cles._raw_spin_lock.try_to_wake_up.wake_up_process.__rwsem_do_wake.rwsem_wa=
ke
      1.10 =C2=B1 10%     +93.6%       2.12 =C2=B1  5%  perf-profile.cpu-cy=
cles.up_write.vma_adjust.vma_merge.do_brk.sys_brk
         6 =C2=B1 17%     +92.3%         12 =C2=B1 22%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
      2.02 =C2=B1 13%     +95.2%       3.94 =C2=B1 20%  perf-profile.cpu-cy=
cles.print_context_stack.dump_trace.save_stack_trace_tsk.__account_schedule=
r_latency.enqueue_entity
         6 =C2=B1 36%     +52.0%          9 =C2=B1 17%  sched_debug.cpu#6.c=
pu_load[2]
      2.63 =C2=B1 14%     +95.0%       5.13 =C2=B1 18%  perf-profile.cpu-cy=
cles.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.enqueue_t=
ask.activate_task
         5 =C2=B1 20%     +66.7%          8 =C2=B1  9%  sched_debug.cpu#6.c=
pu_load[3]
      2.41 =C2=B1 14%     +93.1%       4.66 =C2=B1 19%  perf-profile.cpu-cy=
cles.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entity.enqueu=
e_task_fair.enqueue_task
      2.34 =C2=B1 14%     +94.5%       4.55 =C2=B1 18%  perf-profile.cpu-cy=
cles.dump_trace.save_stack_trace_tsk.__account_scheduler_latency.enqueue_en=
tity.enqueue_task_fair
      0.96 =C2=B1 13%     +71.0%       1.65 =C2=B1 13%  perf-profile.cpu-cy=
cles.find_vma.sys_brk.system_call_fastpath
     17462 =C2=B1  4%     +15.1%      20096 =C2=B1  6%  sched_debug.cfs_rq[=
4]:/.exec_clock
        82 =C2=B1 24%    +116.2%        177 =C2=B1 46%  sched_debug.cfs_rq[=
27]:/.tg_load_contrib
    155743 =C2=B1 31%     +81.1%     281980 =C2=B1 34%  sched_debug.cpu#14.=
sched_count
     13.98 =C2=B1  6%     +63.6%      22.87 =C2=B1  3%  perf-profile.cpu-cy=
cles.call_rwsem_down_write_failed.sys_brk.system_call_fastpath
     13.94 =C2=B1  6%     +63.5%      22.78 =C2=B1  3%  perf-profile.cpu-cy=
cles.rwsem_down_write_failed.call_rwsem_down_write_failed.sys_brk.system_ca=
ll_fastpath
       702 =C2=B1 12%     -39.2%        427 =C2=B1 16%  cpuidle.C1E-IVT.usa=
ge
    103116 =C2=B1 29%     +82.1%     187794 =C2=B1 22%  sched_debug.cpu#41.=
sched_goidle
    206574 =C2=B1 29%     +82.0%     375906 =C2=B1 22%  sched_debug.cpu#41.=
nr_switches
    214754 =C2=B1 29%     +79.4%     385314 =C2=B1 22%  sched_debug.cpu#41.=
sched_count
         5 =C2=B1  8%     +52.4%          8 =C2=B1  8%  sched_debug.cpu#6.c=
pu_load[4]
     67108 =C2=B1 40%     +86.7%     125260 =C2=B1 35%  sched_debug.cpu#14.=
sched_goidle
    134740 =C2=B1 40%     +86.4%     251133 =C2=B1 35%  sched_debug.cpu#14.=
nr_switches
      1.42 =C2=B1  8%     -33.0%       0.95 =C2=B1  6%  perf-profile.cpu-cy=
cles.cpuidle_select.cpu_startup_entry.start_secondary
      1.27 =C2=B1  6%     -34.1%       0.83 =C2=B1  7%  perf-profile.cpu-cy=
cles.menu_select.cpuidle_select.cpu_startup_entry.start_secondary
      1.28 =C2=B1  7%     +44.9%       1.85 =C2=B1  8%  perf-profile.cpu-cy=
cles.find_vma.do_munmap.sys_brk.system_call_fastpath
      2.69 =C2=B1  4%     +36.6%       3.68 =C2=B1  4%  perf-profile.cpu-cy=
cles.vma_adjust.vma_merge.do_brk.sys_brk.system_call_fastpath
     40423 =C2=B1  2%     +11.6%      45108 =C2=B1  3%  sched_debug.cpu#6.n=
r_load_updates
      1.24 =C2=B1  7%     -31.6%       0.85 =C2=B1 11%  perf-profile.cpu-cy=
cles.check_preempt_curr.ttwu_do_wakeup.ttwu_do_activate.try_to_wake_up.wake=
_up_process
      5.67 =C2=B1  5%     -29.9%       3.98 =C2=B1  7%  perf-profile.cpu-cy=
cles.perf_event_mmap.do_brk.sys_brk.system_call_fastpath
      3.09 =C2=B1  1%     -30.0%       2.16 =C2=B1  3%  perf-profile.cpu-cy=
cles.dequeue_task_fair.dequeue_task.deactivate_task.__sched_text_start.sche=
dule
      2.08 =C2=B1  7%     -29.9%       1.46 =C2=B1 12%  perf-profile.cpu-cy=
cles.ttwu_do_wakeup.ttwu_do_activate.try_to_wake_up.wake_up_process.__rwsem=
_do_wake
      2.52 =C2=B1  1%     -30.1%       1.76 =C2=B1  3%  perf-profile.cpu-cy=
cles.dequeue_entity.dequeue_task_fair.dequeue_task.deactivate_task.__sched_=
text_start
      3.20 =C2=B1  2%     -28.8%       2.28 =C2=B1  4%  perf-profile.cpu-cy=
cles.pick_next_task_fair.__sched_text_start.schedule.schedule_preempt_disab=
led.cpu_startup_entry
     10.55 =C2=B1  6%     -24.9%       7.92 =C2=B1  4%  perf-profile.cpu-cy=
cles.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.start_secondary
      1.16 =C2=B1  2%     -30.1%       0.81 =C2=B1  9%  perf-profile.cpu-cy=
cles.free_pgtables.unmap_region.do_munmap.sys_brk.system_call_fastpath
      1.10 =C2=B1 15%     -28.9%       0.78 =C2=B1  5%  perf-profile.cpu-cy=
cles.unmap_page_range.unmap_single_vma.unmap_vmas.unmap_region.do_munmap
     18033 =C2=B1  2%     +10.5%      19932 =C2=B1  6%  sched_debug.cfs_rq[=
6]:/.exec_clock
      5.61 =C2=B1  1%     -27.5%       4.07 =C2=B1  4%  perf-profile.cpu-cy=
cles.__sched_text_start.schedule.schedule_preempt_disabled.cpu_startup_entr=
y.start_secondary
      5.74 =C2=B1  2%     -27.5%       4.16 =C2=B1  5%  perf-profile.cpu-cy=
cles.schedule_preempt_disabled.cpu_startup_entry.start_secondary
      3.30 =C2=B1  1%     -28.5%       2.36 =C2=B1  4%  perf-profile.cpu-cy=
cles.dequeue_task.deactivate_task.__sched_text_start.schedule.rwsem_down_wr=
ite_failed
      5.67 =C2=B1  1%     -27.3%       4.12 =C2=B1  4%  perf-profile.cpu-cy=
cles.schedule.schedule_preempt_disabled.cpu_startup_entry.start_secondary
      3.31 =C2=B1  1%     -28.5%       2.37 =C2=B1  3%  perf-profile.cpu-cy=
cles.deactivate_task.__sched_text_start.schedule.rwsem_down_write_failed.ca=
ll_rwsem_down_write_failed
      4.74 =C2=B1  5%     -29.1%       3.36 =C2=B1  6%  perf-profile.cpu-cy=
cles.perf_event_aux.perf_event_mmap.do_brk.sys_brk.system_call_fastpath
     10.92 =C2=B1  5%     -24.4%       8.25 =C2=B1  4%  perf-profile.cpu-cy=
cles.cpuidle_enter.cpu_startup_entry.start_secondary
      6.64 =C2=B1  2%     -28.1%       4.77 =C2=B1  3%  perf-profile.cpu-cy=
cles.schedule.rwsem_down_write_failed.call_rwsem_down_write_failed.sys_brk.=
system_call_fastpath
      6.51 =C2=B1  2%     -28.2%       4.67 =C2=B1  4%  perf-profile.cpu-cy=
cles.__sched_text_start.schedule.rwsem_down_write_failed.call_rwsem_down_wr=
ite_failed.sys_brk
      1.77 =C2=B1  3%     -29.4%       1.25 =C2=B1  9%  perf-profile.cpu-cy=
cles.set_next_entity.pick_next_task_fair.__sched_text_start.schedule.schedu=
le_preempt_disabled
      1.32 =C2=B1  5%     +33.2%       1.77 =C2=B1  9%  perf-profile.cpu-cy=
cles.up_write.sys_brk.system_call_fastpath
       205 =C2=B1 11%     +20.3%        247 =C2=B1 13%  sched_debug.cpu#33.=
ttwu_local
      5926 =C2=B1  3%     +38.9%       8234 =C2=B1 23%  sched_debug.cfs_rq[=
20]:/.exec_clock
       244 =C2=B1  9%     -26.4%        179 =C2=B1  8%  sched_debug.cpu#26.=
ttwu_local
    354306 =C2=B1  9%     -20.2%     282834 =C2=B1  2%  cpuidle.C6-IVT.usage
      0.98 =C2=B1  9%     -25.8%       0.73 =C2=B1  7%  perf-profile.cpu-cy=
cles.update_cfs_shares.dequeue_entity.dequeue_task_fair.dequeue_task.deacti=
vate_task
     17515 =C2=B1  3%     +10.5%      19349 =C2=B1  3%  sched_debug.cfs_rq[=
10]:/.exec_clock
      0.79 =C2=B1 15%     -27.5%       0.57 =C2=B1 13%  perf-profile.cpu-cy=
cles.resched_curr.ttwu_do_wakeup.ttwu_do_activate.try_to_wake_up.wake_up_pr=
ocess
      3.13 =C2=B1  2%     +27.9%       4.00 =C2=B1  4%  perf-profile.cpu-cy=
cles.vma_merge.do_brk.sys_brk.system_call_fastpath
     29.84 =C2=B1  2%     -25.2%      22.32 =C2=B1  3%  perf-profile.cpu-cy=
cles.start_secondary
     29.69 =C2=B1  2%     -25.2%      22.21 =C2=B1  3%  perf-profile.cpu-cy=
cles.cpu_startup_entry.start_secondary
      1.93 =C2=B1  5%     -24.9%       1.45 =C2=B1  8%  perf-profile.cpu-cy=
cles.perf_event_aux_ctx.perf_event_aux.perf_event_mmap.do_brk.sys_brk
      3.67 =C2=B1  4%     -23.4%       2.81 =C2=B1  3%  perf-profile.cpu-cy=
cles.tick_nohz_stop_sched_tick.__tick_nohz_idle_enter.tick_nohz_idle_enter.=
cpu_startup_entry.start_secondary
       308 =C2=B1  3%     +23.6%        381 =C2=B1  1%  time.system_time
      1.35 =C2=B1 11%     -22.7%       1.05 =C2=B1  3%  perf-profile.cpu-cy=
cles.unmap_single_vma.unmap_vmas.unmap_region.do_munmap.sys_brk
      4.09 =C2=B1  3%     -22.8%       3.16 =C2=B1  3%  perf-profile.cpu-cy=
cles.__tick_nohz_idle_enter.tick_nohz_idle_enter.cpu_startup_entry.start_se=
condary
      1.05 =C2=B1  8%     -19.7%       0.84 =C2=B1  2%  perf-profile.cpu-cy=
cles.lapic_next_deadline.clockevents_program_event.tick_program_event.__hrt=
imer_start_range_ns.hrtimer_start_range_ns
      4.38 =C2=B1  3%     -22.9%       3.38 =C2=B1  4%  perf-profile.cpu-cy=
cles.tick_nohz_idle_enter.cpu_startup_entry.start_secondary
        99 =C2=B1  3%     +20.2%        119 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
      4.31 =C2=B1  4%     -22.4%       3.35 =C2=B1  3%  perf-profile.cpu-cy=
cles.tick_nohz_idle_exit.cpu_startup_entry.start_secondary
      5808 =C2=B1  4%     +26.5%       7349 =C2=B1 14%  sched_debug.cfs_rq[=
13]:/.exec_clock
      2.05 =C2=B1  7%     -21.1%       1.61 =C2=B1  2%  perf-profile.cpu-cy=
cles.hrtimer_start_range_ns.tick_nohz_restart.tick_nohz_idle_exit.cpu_start=
up_entry.start_secondary
      1.58 =C2=B1  6%     +21.9%       1.92 =C2=B1  8%  perf-profile.cpu-cy=
cles.anon_vma_clone.__split_vma.do_munmap.sys_brk.system_call_fastpath
      1.43 =C2=B1 10%     -20.5%       1.14 =C2=B1  2%  perf-profile.cpu-cy=
cles.tick_program_event.__hrtimer_start_range_ns.hrtimer_start_range_ns.tic=
k_nohz_restart.tick_nohz_idle_exit
      9.35 =C2=B1  1%     -19.6%       7.52 =C2=B1  5%  perf-profile.cpu-cy=
cles.intel_idle.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.start_s=
econdary
      6081 =C2=B1  7%     +14.6%       6970 =C2=B1  5%  sched_debug.cfs_rq[=
15]:/.exec_clock
      6.83 =C2=B1  3%     +17.1%       8.00 =C2=B1 10%  perf-profile.cpu-cy=
cles.enqueue_entity.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_ac=
tivate
      5956 =C2=B1 10%     +17.5%       7000 =C2=B1  8%  sched_debug.cfs_rq[=
17]:/.exec_clock
      2.02 =C2=B1  6%     -20.7%       1.60 =C2=B1  2%  perf-profile.cpu-cy=
cles.__hrtimer_start_range_ns.hrtimer_start_range_ns.tick_nohz_restart.tick=
_nohz_idle_exit.cpu_startup_entry
      2.57 =C2=B1  4%     -19.3%       2.08 =C2=B1  4%  perf-profile.cpu-cy=
cles.hrtimer_start.tick_nohz_stop_sched_tick.__tick_nohz_idle_enter.tick_no=
hz_idle_enter.cpu_startup_entry
    246343 =C2=B1  1%      +9.9%     270748 =C2=B1  3%  sched_debug.cfs_rq[=
14]:/.min_vruntime
      1.40 =C2=B1  9%     -20.3%       1.11 =C2=B1  2%  perf-profile.cpu-cy=
cles.clockevents_program_event.tick_program_event.__hrtimer_start_range_ns.=
hrtimer_start_range_ns.tick_nohz_restart
     17631 =C2=B1  1%     +15.3%      20334 =C2=B1  6%  sched_debug.cfs_rq[=
8]:/.exec_clock
      2.53 =C2=B1  4%     -19.1%       2.05 =C2=B1  4%  perf-profile.cpu-cy=
cles.__hrtimer_start_range_ns.hrtimer_start.tick_nohz_stop_sched_tick.__tic=
k_nohz_idle_enter.tick_nohz_idle_enter
      2222 =C2=B1  7%      +8.8%       2419 =C2=B1  7%  sched_debug.cpu#35.=
curr->pid
      2.95 =C2=B1  7%     -18.9%       2.40 =C2=B1  2%  perf-profile.cpu-cy=
cles.tick_nohz_restart.tick_nohz_idle_exit.cpu_startup_entry.start_secondary
      6200 =C2=B1  7%     +17.9%       7311 =C2=B1  4%  sched_debug.cfs_rq[=
14]:/.exec_clock
      7.35 =C2=B1  3%     +13.7%       8.36 =C2=B1  9%  perf-profile.cpu-cy=
cles.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate.try_to_w=
ake_up
     30922 =C2=B1  2%     +14.9%      35531 =C2=B1  1%  sched_debug.cpu#15.=
nr_load_updates
      5940 =C2=B1  2%     +28.2%       7617 =C2=B1 22%  sched_debug.cfs_rq[=
18]:/.exec_clock
      1.13 =C2=B1 18%     +39.4%       1.57 =C2=B1 12%  perf-profile.cpu-cy=
cles.down_write.sys_brk.system_call_fastpath
     10.54 =C2=B1  3%     -12.9%       9.19 =C2=B1  3%  perf-profile.cpu-cy=
cles.do_brk.sys_brk.system_call_fastpath
     40246 =C2=B1  1%     +13.2%      45575 =C2=B1  3%  sched_debug.cpu#8.n=
r_load_updates
     30869 =C2=B1  2%     +19.1%      36767 =C2=B1  4%  sched_debug.cpu#20.=
nr_load_updates
      2178 =C2=B1  4%     +11.7%       2433 =C2=B1  6%  sched_debug.cpu#33.=
curr->pid
     17639 =C2=B1  2%     +13.5%      20020 =C2=B1  6%  sched_debug.cfs_rq[=
11]:/.exec_clock
     39954 =C2=B1  2%     +13.5%      45359 =C2=B1  2%  sched_debug.cpu#4.n=
r_load_updates
      2483 =C2=B1  2%      -9.9%       2238 =C2=B1  4%  time.involuntary_co=
ntext_switches
     31335 =C2=B1  1%     +13.6%      35597 =C2=B1  3%  sched_debug.cpu#13.=
nr_load_updates
     30990 =C2=B1  3%     +13.9%      35313 =C2=B1  2%  sched_debug.cpu#17.=
nr_load_updates
    246393 =C2=B1  3%     +13.8%     280499 =C2=B1  6%  sched_debug.cfs_rq[=
18]:/.min_vruntime
     31272 =C2=B1  2%     +14.6%      35823 =C2=B1  1%  sched_debug.cpu#14.=
nr_load_updates
    242514 =C2=B1  1%     +13.0%     274042 =C2=B1  4%  sched_debug.cfs_rq[=
13]:/.min_vruntime
     17452 =C2=B1  4%     +14.8%      20038 =C2=B1  4%  sched_debug.cfs_rq[=
9]:/.exec_clock
     39962 =C2=B1  3%     +13.9%      45502 =C2=B1  3%  sched_debug.cpu#9.n=
r_load_updates
     31046 =C2=B1  1%     +16.6%      36199 =C2=B1  5%  sched_debug.cpu#18.=
nr_load_updates
     62.38 =C2=B1  1%     +14.6%      71.51 =C2=B1  1%  perf-profile.cpu-cy=
cles.sys_brk.system_call_fastpath
     62.72 =C2=B1  1%     +14.4%      71.76 =C2=B1  1%  perf-profile.cpu-cy=
cles.system_call_fastpath
     39742 =C2=B1  2%     +11.1%      44168 =C2=B1  1%  sched_debug.cpu#10.=
nr_load_updates
  30858596 =C2=B1  1%     +11.6%   34423247 =C2=B1  3%  cpuidle.C1-IVT.usage
      3.52 =C2=B1  4%      -8.0%       3.24 =C2=B1  3%  perf-profile.cpu-cy=
cles.unmap_region.do_munmap.sys_brk.system_call_fastpath
    243796 =C2=B1  1%     +10.9%     270426 =C2=B1  2%  sched_debug.cfs_rq[=
16]:/.min_vruntime
     16.93 =C2=B1  2%     -13.5%      14.65 =C2=B1  6%  perf-profile.cpu-cy=
cles.try_to_wake_up.wake_up_process.__rwsem_do_wake.rwsem_wake.call_rwsem_w=
ake
     29303 =C2=B1  4%     +11.6%      32702 =C2=B1  4%  sched_debug.cpu#12.=
nr_load_updates
    245510 =C2=B1  0%     +10.3%     270675 =C2=B1  2%  sched_debug.cfs_rq[=
19]:/.min_vruntime
    244024 =C2=B1  1%     +10.4%     269379 =C2=B1  1%  sched_debug.cfs_rq[=
15]:/.min_vruntime
     17.91 =C2=B1  2%     -12.8%      15.62 =C2=B1  5%  perf-profile.cpu-cy=
cles.wake_up_process.__rwsem_do_wake.rwsem_wake.call_rwsem_wake.sys_brk
     15043 =C2=B1  3%      -8.3%      13799 =C2=B1  4%  slabinfo.kmalloc-51=
2.num_objs
    246096 =C2=B1  0%     +11.1%     273409 =C2=B1  3%  sched_debug.cfs_rq[=
12]:/.min_vruntime
     18.14 =C2=B1  2%     -12.5%      15.87 =C2=B1  5%  perf-profile.cpu-cy=
cles.__rwsem_do_wake.rwsem_wake.call_rwsem_wake.sys_brk.system_call_fastpath
     17738 =C2=B1  2%     +11.4%      19752 =C2=B1  5%  sched_debug.cfs_rq[=
1]:/.exec_clock
     31513 =C2=B1  1%     +13.4%      35747 =C2=B1  3%  sched_debug.cpu#16.=
nr_load_updates
     14995 =C2=B1  3%      -8.2%      13765 =C2=B1  4%  slabinfo.kmalloc-51=
2.active_objs
     39689 =C2=B1  2%     +12.7%      44717 =C2=B1  2%  sched_debug.cpu#11.=
nr_load_updates
     31173 =C2=B1  2%     +10.8%      34530 =C2=B1  0%  sched_debug.cpu#19.=
nr_load_updates
      2900 =C2=B1  2%      +8.2%       3137 =C2=B1  6%  slabinfo.kmalloc-20=
48.active_objs
     50519 =C2=B1  2%      +9.3%      55204 =C2=B1  0%  sched_debug.cpu#43.=
nr_load_updates
    754899 =C2=B1  3%      -7.2%     700567 =C2=B1  5%  sched_debug.cpu#35.=
avg_idle
      2189 =C2=B1  6%      -6.5%       2046 =C2=B1  4%  sched_debug.cpu#47.=
curr->pid
    245137 =C2=B1  1%     +10.9%     271884 =C2=B1  1%  sched_debug.cfs_rq[=
20]:/.min_vruntime
    252683 =C2=B1  2%      +6.8%     269903 =C2=B1  2%  sched_debug.cfs_rq[=
22]:/.min_vruntime
    250553 =C2=B1  4%      +7.3%     268896 =C2=B1  2%  sched_debug.cfs_rq[=
21]:/.min_vruntime
     40942 =C2=B1  4%     +10.5%      45255 =C2=B1  2%  sched_debug.cpu#1.n=
r_load_updates
     19657 =C2=B1  4%      -9.8%      17725 =C2=B1  5%  vmstat.system.in
     27.10 =C2=B1  0%      -0.7%      26.90 =C2=B1  0%  turbostat.%Busy
      4.10 =C2=B1  0%      -2.4%       4.00 =C2=B1  0%  turbostat.RAMWatt

testbox/testcase/testparams: lituya/will-it-scale/performance-brk1

b3fd4f03ca0b9952  1a99367023f6ac664365a37fa5  =

----------------  --------------------------  =

       239 =C2=B1  1%     +32.0%        316 =C2=B1  3%  will-it-scale.time.=
system_time
        80 =C2=B1  1%     +30.4%        105 =C2=B1  3%  will-it-scale.time.=
percent_of_cpu_this_job_got
  52295908 =C2=B1  1%      -5.4%   49462338 =C2=B1  0%  will-it-scale.time.=
voluntary_context_switches
    728289 =C2=B1  0%      -1.8%     715194 =C2=B1  0%  will-it-scale.per_t=
hread_ops
        63 =C2=B1 48%     -36.9%         40 =C2=B1  7%  sched_debug.cpu#12.=
load
    223957 =C2=B1 16%     -62.8%      83209 =C2=B1 16%  cpuidle.C6-HSW.usage
        31 =C2=B1 16%    +116.1%         67 =C2=B1 34%  sched_debug.cpu#14.=
load
        80 =C2=B1 34%     -60.7%         31 =C2=B1 20%  sched_debug.cpu#2.l=
oad
        73 =C2=B1 25%     -53.4%         34 =C2=B1 12%  sched_debug.cfs_rq[=
2]:/.load
    300986 =C2=B1 24%     -40.3%     179777 =C2=B1 42%  sched_debug.cfs_rq[=
4]:/.min_vruntime
       346 =C2=B1 33%     +91.1%        662 =C2=B1 25%  cpuidle.POLL.usage
   1212812 =C2=B1 35%     -44.7%     670407 =C2=B1 25%  sched_debug.cpu#2.t=
twu_count
    144641 =C2=B1 35%     -62.3%      54518 =C2=B1 15%  sched_debug.cpu#6.t=
twu_local
        33 =C2=B1 25%     +90.2%         63 =C2=B1 34%  sched_debug.cfs_rq[=
14]:/.load
   1377774 =C2=B1 40%    +210.8%    4282777 =C2=B1 48%  sched_debug.cpu#9.s=
ched_count
        34 =C2=B1 10%    +109.4%         72 =C2=B1 43%  sched_debug.cpu#14.=
cpu_load[0]
    681074 =C2=B1 40%    +210.0%    2111486 =C2=B1 49%  sched_debug.cpu#9.s=
ched_goidle
   1362573 =C2=B1 40%    +210.0%    4223660 =C2=B1 49%  sched_debug.cpu#9.n=
r_switches
       327 =C2=B1  7%     +81.2%        593 =C2=B1 14%  sched_debug.cfs_rq[=
14]:/.tg_load_contrib
    588875 =C2=B1 12%     +78.6%    1051474 =C2=B1 12%  sched_debug.cpu#6.s=
ched_count
    292062 =C2=B1 13%     +77.6%     518637 =C2=B1 12%  sched_debug.cpu#6.s=
ched_goidle
    585096 =C2=B1 13%     +77.5%    1038414 =C2=B1 12%  sched_debug.cpu#6.n=
r_switches
    262640 =C2=B1  6%     -41.6%     153289 =C2=B1 11%  sched_debug.cfs_rq[=
6]:/.min_vruntime
    148498 =C2=B1 46%    +113.4%     316963 =C2=B1 13%  sched_debug.cpu#1.t=
twu_local
   1385681 =C2=B1 22%     +86.1%    2578972 =C2=B1 18%  sched_debug.cpu#8.t=
twu_count
       296 =C2=B1  9%     +80.1%        533 =C2=B1 17%  sched_debug.cfs_rq[=
14]:/.blocked_load_avg
     24472 =C2=B1 25%     -40.1%      14663 =C2=B1 48%  sched_debug.cfs_rq[=
4]:/.exec_clock
        32 =C2=B1  7%     +79.7%         57 =C2=B1 34%  sched_debug.cpu#14.=
cpu_load[1]
   1650425 =C2=B1 13%     -37.7%    1027432 =C2=B1 29%  sched_debug.cpu#14.=
ttwu_count
        57 =C2=B1 14%     +36.2%         78 =C2=B1 10%  sched_debug.cpu#0.l=
oad
     43412 =C2=B1 13%     -26.2%      32048 =C2=B1 22%  sched_debug.cfs_rq[=
2]:/.exec_clock
        33 =C2=B1  6%     +67.7%         55 =C2=B1 21%  sched_debug.cpu#13.=
cpu_load[0]
        64 =C2=B1 17%     -22.5%         50 =C2=B1 19%  sched_debug.cpu#9.c=
pu_load[0]
        53 =C2=B1 14%     +34.4%         72 =C2=B1  5%  sched_debug.cfs_rq[=
0]:/.load
        31 =C2=B1  7%     +53.5%         48 =C2=B1 22%  sched_debug.cpu#14.=
cpu_load[2]
        29 =C2=B1 10%     +47.9%         43 =C2=B1 15%  sched_debug.cpu#13.=
cpu_load[1]
        32 =C2=B1 16%     -36.9%         20 =C2=B1 24%  sched_debug.cpu#4.c=
pu_load[1]
        30 =C2=B1  5%     +36.9%         41 =C2=B1 10%  sched_debug.cpu#14.=
cpu_load[4]
        31 =C2=B1  5%     +40.5%         44 =C2=B1 14%  sched_debug.cpu#14.=
cpu_load[3]
    520038 =C2=B1 13%     -19.4%     419303 =C2=B1 18%  sched_debug.cfs_rq[=
2]:/.min_vruntime
    469998 =C2=B1 13%     +31.3%     616962 =C2=B1 12%  sched_debug.cfs_rq[=
10]:/.min_vruntime
     36098 =C2=B1 10%     -40.6%      21432 =C2=B1  4%  sched_debug.cpu#6.n=
r_load_updates
        21 =C2=B1 26%     -33.7%         14 =C2=B1 13%  sched_debug.cpu#4.c=
pu_load[4]
      1178 =C2=B1 12%     +43.7%       1694 =C2=B1 13%  sched_debug.cpu#14.=
curr->pid
     21211 =C2=B1 10%     -38.2%      13103 =C2=B1 12%  sched_debug.cfs_rq[=
6]:/.exec_clock
     39866 =C2=B1 16%     +32.5%      52814 =C2=B1 16%  sched_debug.cfs_rq[=
10]:/.exec_clock
        24 =C2=B1 23%     -35.1%         15 =C2=B1 15%  sched_debug.cpu#4.c=
pu_load[3]
      1.38 =C2=B1 12%     -15.0%       1.17 =C2=B1  4%  perf-profile.cpu-cy=
cles.avc_has_perm_noaudit.cred_has_capability.selinux_capable.selinux_vm_en=
ough_memory.security_vm_enough_memory_mm
       239 =C2=B1  1%     +32.0%        316 =C2=B1  3%  time.system_time
       394 =C2=B1  7%     +26.1%        497 =C2=B1  5%  sched_debug.cfs_rq[=
14]:/.tg_runnable_contrib
     18088 =C2=B1  7%     +26.4%      22861 =C2=B1  5%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
        39 =C2=B1 17%     -33.8%         26 =C2=B1 29%  sched_debug.cpu#4.c=
pu_load[0]
      1228 =C2=B1  4%     +32.1%       1622 =C2=B1  6%  sched_debug.cpu#0.c=
urr->pid
        80 =C2=B1  1%     +30.4%        105 =C2=B1  3%  time.percent_of_cpu=
_this_job_got
        27 =C2=B1 18%     -34.9%         17 =C2=B1 19%  sched_debug.cpu#4.c=
pu_load[2]
       401 =C2=B1  9%     -14.3%        344 =C2=B1 11%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
      6.50 =C2=B1  1%     -20.3%       5.19 =C2=B1  7%  time.user_time
    502752 =C2=B1  2%     +29.0%     648466 =C2=B1  3%  sched_debug.cfs_rq[=
14]:/.min_vruntime
        53 =C2=B1 12%     +23.6%         65 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
       353 =C2=B1 12%     +28.8%        455 =C2=B1  7%  sched_debug.cfs_rq[=
12]:/.tg_runnable_contrib
     16234 =C2=B1 12%     +28.8%      20903 =C2=B1  7%  sched_debug.cfs_rq[=
12]:/.avg->runnable_avg_sum
     43966 =C2=B1  4%     +26.9%      55773 =C2=B1  4%  sched_debug.cfs_rq[=
14]:/.exec_clock
      1344 =C2=B1  8%     +15.4%       1552 =C2=B1  4%  sched_debug.cpu#11.=
curr->pid
      1080 =C2=B1  1%     -15.6%        912 =C2=B1  4%  time.involuntary_co=
ntext_switches
       433 =C2=B1  3%     +16.3%        504 =C2=B1  2%  sched_debug.cfs_rq[=
9]:/.tg_runnable_contrib
     19913 =C2=B1  3%     +16.5%      23191 =C2=B1  2%  sched_debug.cfs_rq[=
9]:/.avg->runnable_avg_sum
     54233 =C2=B1  6%     +14.0%      61828 =C2=B1  6%  sched_debug.cpu#14.=
nr_load_updates
     48889 =C2=B1  7%     +17.7%      57564 =C2=B1  2%  sched_debug.cfs_rq[=
9]:/.exec_clock
     59096 =C2=B1  3%     +11.9%      66139 =C2=B1  4%  sched_debug.cpu#9.n=
r_load_updates
        53 =C2=B1 12%     +18.8%         63 =C2=B1  7%  sched_debug.cpu#0.c=
pu_load[0]
     13853 =C2=B1 10%     +35.6%      18786 =C2=B1 10%  vmstat.system.in
    346546 =C2=B1  1%      -5.3%     328077 =C2=B1  0%  vmstat.system.cs
      1146 =C2=B1  0%      +4.2%       1195 =C2=B1  0%  turbostat.Avg_MHz
     34.76 =C2=B1  0%      +4.2%      36.23 =C2=B1  0%  turbostat.%Busy

ivb42: Ivytown Ivy Bridge-EP
Memory: 64G

lituya: Grantley Haswell
Memory: 16G




                  will-it-scale.time.percent_of_cpu_this_job_got

  125 ++-------------------------------------------------------------------=
-+
      O                                                                    =
 |
  120 ++                                                   O  O   O  O     =
 |
  115 ++  O  O   O  O             O                    O                   =
 |
      |                    O   O         O      O   O                      =
 |
  110 ++                O             O      O                             =
 |
      |                                                                    =
 |
  105 ++                                                          *        =
 |
      |                                                          + +       =
 |
  100 ++                      .*..*..                           +   +      =
.*
   95 ++     *...*..  ..*.. ..       .            ..*..*..     +     *...*.=
 |
      |    ..       *.     *          *..      .*.        .  .*            =
 |
   90 ++..*                              *...*.            *.              =
 |
      *.                                                                   =
 |
   85 ++-------------------------------------------------------------------=
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


--===============4977682915665396709==
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
cjogcGVyZm9ybWFuY2UKY29tbWl0OiA1YWFhNmI5ZjI4YjFjMGM3NjIzZGNmZDhkODdlMWQwZThi
ZDRkZGU2Cm1vZGVsOiBJdnl0b3duIEl2eSBCcmlkZ2UtRVAKbnJfY3B1OiA0OAptZW1vcnk6IDY0
Rwpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKcGVyZi1wcm9maWxlOgogIGZy
ZXE6IDgwMAp3aWxsLWl0LXNjYWxlOgogIHRlc3Q6IGJyazEKdGVzdGJveDogaXZiNDIKdGJveF9n
cm91cDogaXZiNDIKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE1LTAzLTA4
IDIyOjIzOjUxLjYwMjUyODA0NSArMDg6MDAKaGVhZF9jb21taXQ6IDVhYWE2YjlmMjhiMWMwYzc2
MjNkY2ZkOGQ4N2UxZDBlOGJkNGRkZTYKYmFzZV9jb21taXQ6IDllY2NjYTA4NDMyMDVmODdjMDA0
MDRiNjYzMTg4Yjg4ZWIyNDgwNTEKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAx
NTAzMDkwNwprZXJuZWw6ICIva2VybmVsL3g4Nl82NC1yaGVsLzVhYWE2YjlmMjhiMWMwYzc2MjNk
Y2ZkOGQ4N2UxZDBlOGJkNGRkZTYvdm1saW51ei00LjAuMC1yYzMtMDEwNTEtZzVhYWE2YjkiCnVz
ZXI6IGxrcApxdWV1ZTogY3ljbGljCnJlc3VsdF9yb290OiAiL3Jlc3VsdC9pdmI0Mi93aWxsLWl0
LXNjYWxlL3BlcmZvcm1hbmNlLWJyazEvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZf
NjQtcmhlbC81YWFhNmI5ZjI4YjFjMGM3NjIzZGNmZDhkODdlMWQwZThiZDRkZGU2LzAiCmpvYl9m
aWxlOiAiL2xrcC9zY2hlZHVsZWQvaXZiNDIvY3ljbGljX3dpbGwtaXQtc2NhbGUtcGVyZm9ybWFu
Y2UtYnJrMS1kZWJpYW4teDg2XzY0LmNnei14ODZfNjQtcmhlbC1IRUFELTVhYWE2YjlmMjhiMWMw
Yzc2MjNkY2ZkOGQ4N2UxZDBlOGJkNGRkZTYtMC0yMDE1MDMwOC00MDkyNS0xdWdvNnhwLnlhbWwi
CmRlcXVldWVfdGltZTogMjAxNS0wMy0wOSAwODo1MjoxOC41MTIyMDA4OTAgKzA4OjAwCmpvYl9z
dGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMjkuMTcgMTcuODggNy40MyAxLzQyMCAxMDc0OApzdGFy
dF90aW1lOiAnMTQyNTg2MjM4NCcKZW5kX3RpbWU6ICcxNDI1ODYyNzE4Jwp2ZXJzaW9uOiAiL2xr
cC9sa3AvLnNyYy0yMDE1MDMwOC0xNzU3NDYiCg==

--===============4977682915665396709==
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
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgouL3J1bnRlc3QucHkgYnJrMSAyNSBib3RoIDEgMTIgMjQgMzYgNDgK

--===============4977682915665396709==--

