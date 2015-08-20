Content-Type: multipart/mixed; boundary="===============2305406313214129767=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [x86/entry/64] fa58aafc448: 10.8% aim7.jobs-per-min
Date: Thu, 20 Aug 2015 13:32:07 +0800
Message-ID: <87r3myed9k.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2305406313214129767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git x86/entry
commit fa58aafc44805ac425d17c6a8082513b5442ce9d ("x86/entry/64: When return=
ing via SYSRET, POP regs instead of using MOV")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/load/test:
  lkp-a06/aim7/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/4000/new_ra=
ph

commit: =

  a4be9881623375fd126762af65ef18dc8175c68d
  fa58aafc44805ac425d17c6a8082513b5442ce9d

a4be9881623375fd fa58aafc44805ac425d17c6a80 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    184099 =C2=B1  0%     +10.8%     204000 =C2=B1  0%  aim7.jobs-per-min
    131.89 =C2=B1  0%      -9.8%     119.00 =C2=B1  0%  aim7.time.elapsed_t=
ime
    131.89 =C2=B1  0%      -9.8%     119.00 =C2=B1  0%  aim7.time.elapsed_t=
ime.max
   2215262 =C2=B1  0%     -92.5%     165275 =C2=B1  0%  aim7.time.involunta=
ry_context_switches
     19.56 =C2=B1  1%     -65.8%       6.70 =C2=B1  5%  aim7.time.system_ti=
me
    435.63 =C2=B1  0%      -2.8%     423.34 =C2=B1  0%  aim7.time.user_time
     60385 =C2=B1  1%     -17.3%      49927 =C2=B1  0%  aim7.time.voluntary=
_context_switches
    131.89 =C2=B1  0%      -9.8%     119.00 =C2=B1  0%  time.elapsed_time
    131.89 =C2=B1  0%      -9.8%     119.00 =C2=B1  0%  time.elapsed_time.m=
ax
   2215262 =C2=B1  0%     -92.5%     165275 =C2=B1  0%  time.involuntary_co=
ntext_switches
     19.56 =C2=B1  1%     -65.8%       6.70 =C2=B1  5%  time.system_time
     60385 =C2=B1  1%     -17.3%      49927 =C2=B1  0%  time.voluntary_cont=
ext_switches

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/load/test:
  lkp-a06/aim7/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/4000/pipe_c=
py

commit: =

  a4be9881623375fd126762af65ef18dc8175c68d
  fa58aafc44805ac425d17c6a8082513b5442ce9d

a4be9881623375fd fa58aafc44805ac425d17c6a80 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    247245 =C2=B1  1%     +15.6%     285751 =C2=B1  1%  aim7.jobs-per-min
     98.61 =C2=B1  1%     -13.4%      85.37 =C2=B1  1%  aim7.time.elapsed_t=
ime
     98.61 =C2=B1  1%     -13.4%      85.37 =C2=B1  1%  aim7.time.elapsed_t=
ime.max
   2003598 =C2=B1  0%     -93.3%     133967 =C2=B1  2%  aim7.time.involunta=
ry_context_switches
    266.80 =C2=B1  1%      -7.1%     247.73 =C2=B1  1%  aim7.time.system_ti=
me
     51.41 =C2=B1  4%     -11.8%      45.32 =C2=B1  7%  aim7.time.user_time
     53934 =C2=B1  1%     -21.5%      42329 =C2=B1  1%  aim7.time.voluntary=
_context_switches
     98.61 =C2=B1  1%     -13.4%      85.37 =C2=B1  1%  time.elapsed_time
     98.61 =C2=B1  1%     -13.4%      85.37 =C2=B1  1%  time.elapsed_time.m=
ax
   2003598 =C2=B1  0%     -93.3%     133967 =C2=B1  2%  time.involuntary_co=
ntext_switches
     51.41 =C2=B1  4%     -11.8%      45.32 =C2=B1  7%  time.user_time
     53934 =C2=B1  1%     -21.5%      42329 =C2=B1  1%  time.voluntary_cont=
ext_switches

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_threads:
  lkp-a06/dbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performan=
ce/100%

commit: =

  a4be9881623375fd126762af65ef18dc8175c68d
  fa58aafc44805ac425d17c6a8082513b5442ce9d

a4be9881623375fd fa58aafc44805ac425d17c6a80 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   2245160 =C2=B1  8%     -76.6%     526406 =C2=B1  4%  dbench.time.involun=
tary_context_switches
    379.50 =C2=B1  0%      +1.3%     384.50 =C2=B1  0%  dbench.time.percent=
_of_cpu_this_job_got
      1715 =C2=B1  0%      +1.7%       1745 =C2=B1  0%  dbench.time.system_=
time
   2245160 =C2=B1  8%     -76.6%     526406 =C2=B1  4%  time.involuntary_co=
ntext_switches
      2.69 =C2=B1 11%     +81.5%       4.88 =C2=B1 37%  perf-profile.cpu-cy=
cles.__hrtimer_run_queues.hrtimer_interrupt.local_apic_timer_interrupt.smp_=
apic_timer_interrupt.apic_timer_interrupt
      1.43 =C2=B1  2%     -10.1%       1.29 =C2=B1  2%  perf-profile.cpu-cy=
cles.entry_SYSCALL_64_after_swapgs
      1.51 =C2=B1  8%     -26.2%       1.11 =C2=B1 10%  perf-profile.cpu-cy=
cles.rcu_nocb_kthread.kthread.ret_from_fork
      1.20 =C2=B1 15%    +109.4%       2.51 =C2=B1 46%  perf-profile.cpu-cy=
cles.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer=
.__hrtimer_run_queues
      0.68 =C2=B1 16%    +110.7%       1.43 =C2=B1 47%  perf-profile.cpu-cy=
cles.task_tick_fair.scheduler_tick.update_process_times.tick_sched_handle.t=
ick_sched_timer
      1.97 =C2=B1 11%     +96.4%       3.87 =C2=B1 40%  perf-profile.cpu-cy=
cles.tick_sched_handle.isra.17.tick_sched_timer.__hrtimer_run_queues.hrtime=
r_interrupt.local_apic_timer_interrupt
      2.33 =C2=B1 10%     +84.8%       4.30 =C2=B1 38%  perf-profile.cpu-cy=
cles.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.local_apic_tim=
er_interrupt.smp_apic_timer_interrupt
      1.90 =C2=B1 11%     +96.3%       3.72 =C2=B1 41%  perf-profile.cpu-cy=
cles.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_=
queues.hrtimer_interrupt
      1.07 =C2=B1  2%      -9.3%       0.97 =C2=B1  3%  perf-profile.cpu-cy=
cles.vfs_create.path_openat.do_filp_open.do_sys_open.sys_open

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/filesize/test_size/sync_method/nr_directories/nr_files_per_=
directory:
  nhm4/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/=
1x/32t/1HDD/ext4/8K/400M/fsyncBeforeClose/16d/256fpd

commit: =

  a4be9881623375fd126762af65ef18dc8175c68d
  fa58aafc44805ac425d17c6a8082513b5442ce9d

a4be9881623375fd fa58aafc44805ac425d17c6a80 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     10935 =C2=B1  7%     -38.1%       6768 =C2=B1  1%  fsmark.time.involun=
tary_context_switches
      2989 =C2=B1  0%      +1.2%       3026 =C2=B1  0%  fsmark.time.maximum=
_resident_set_size
     10935 =C2=B1  7%     -38.1%       6768 =C2=B1  1%  time.involuntary_co=
ntext_switches
     29861 =C2=B1  3%     -86.7%       3970 =C2=B1  1%  vmstat.system.cs
     13362 =C2=B1  3%     -97.0%     405.25 =C2=B1  1%  vmstat.system.in
  76414335 =C2=B1  1%     -55.4%   34106888 =C2=B1  4%  cpuidle.C1-NHM.time
   4836217 =C2=B1  0%     -92.9%     344308 =C2=B1  4%  cpuidle.C1-NHM.usage
      1310 =C2=B1  4%     -96.7%      43.00 =C2=B1 10%  cpuidle.POLL.usage
      1.32 =C2=B1  2%     -43.9%       0.74 =C2=B1  0%  turbostat.%Busy
     39.25 =C2=B1  2%     -51.6%      19.00 =C2=B1  0%  turbostat.Avg_MHz
      2985 =C2=B1  0%     -15.9%       2512 =C2=B1  0%  turbostat.Bzy_MHz
      7.68 =C2=B1  5%     -42.2%       4.44 =C2=B1  3%  turbostat.CPU%c1
      0.00 =C2=B1 -1%      +Inf%      20233 =C2=B1125%  latency_stats.avg.s=
ubmit_bio_wait.blkdev_issue_flush.jbd2_cleanup_journal_tail.jbd2_log_do_che=
ckpoint.__jbd2_log_wait_for_space.start_this_handle.jbd2__journal_start.__e=
xt4_journal_start_sb.__ext4_new_inode.ext4_mkdir.vfs_mkdir.SyS_mkdir
      4866 =C2=B1 28%     +42.4%       6930 =C2=B1141%  latency_stats.max.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_reserve_inode_write.ext4_mark_inode_dirty.ext4_dirty_inode.__mar=
k_inode_dirty.generic_update_time.file_update_time.__generic_file_write_ite=
r.ext4_file_write_iter.__vfs_write
      8314 =C2=B1 73%    +365.2%      38680 =C2=B1 69%  latency_stats.max.d=
o_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write_a=
ccess.ext4_reserve_inode_write.ext4_mark_inode_dirty.ext4_dirty_inode.__mar=
k_inode_dirty.generic_write_end.ext4_da_write_end.generic_perform_write.__g=
eneric_file_write_iter.ext4_file_write_iter
      0.00 =C2=B1 -1%      +Inf%      24939 =C2=B1105%  latency_stats.max.s=
ubmit_bio_wait.blkdev_issue_flush.jbd2_cleanup_journal_tail.jbd2_log_do_che=
ckpoint.__jbd2_log_wait_for_space.start_this_handle.jbd2__journal_start.__e=
xt4_journal_start_sb.__ext4_new_inode.ext4_mkdir.vfs_mkdir.SyS_mkdir
      0.00 =C2=B1 -1%      +Inf%      24960 =C2=B1105%  latency_stats.sum.s=
ubmit_bio_wait.blkdev_issue_flush.jbd2_cleanup_journal_tail.jbd2_log_do_che=
ckpoint.__jbd2_log_wait_for_space.start_this_handle.jbd2__journal_start.__e=
xt4_journal_start_sb.__ext4_new_inode.ext4_mkdir.vfs_mkdir.SyS_mkdir
      5099 =C2=B1  5%      +8.2%       5517 =C2=B1  5%  sched_debug.cfs_rq[=
0]:/.min_vruntime
    533.25 =C2=B1  3%      -9.6%     482.25 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
    537.75 =C2=B1  3%      -9.9%     484.75 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
     11.50 =C2=B1 35%     +65.2%      19.00 =C2=B1 11%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
    538.50 =C2=B1  3%      -9.7%     486.50 =C2=B1  2%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
     -1924 =C2=B1-24%     +34.3%      -2583 =C2=B1-12%  sched_debug.cfs_rq[=
3]:/.spread0
    539.75 =C2=B1  3%     -10.4%     483.75 =C2=B1  2%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
      1006 =C2=B1 13%     +17.2%       1179 =C2=B1  5%  sched_debug.cfs_rq[=
4]:/.exec_clock
      2780 =C2=B1 16%     +20.9%       3361 =C2=B1  7%  sched_debug.cfs_rq[=
4]:/.min_vruntime
    542.75 =C2=B1  3%     -10.7%     484.50 =C2=B1  2%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
      2626 =C2=B1  5%     +41.7%       3723 =C2=B1 12%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
      2463 =C2=B1  8%     +16.3%       2865 =C2=B1  7%  sched_debug.cfs_rq[=
5]:/.min_vruntime
    547.00 =C2=B1  4%     -11.4%     484.50 =C2=B1  2%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
     56.75 =C2=B1  4%     +41.9%      80.50 =C2=B1 13%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
    909.00 =C2=B1 74%    +241.7%       3105 =C2=B1  4%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
    549.00 =C2=B1  4%     -11.5%     486.00 =C2=B1  2%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
    927.25 =C2=B1 71%    +240.7%       3158 =C2=B1  6%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
      4572 =C2=B1 22%     -49.6%       2303 =C2=B1 27%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
     -1634 =C2=B1-23%     +55.2%      -2535 =C2=B1-19%  sched_debug.cfs_rq[=
7]:/.spread0
    551.00 =C2=B1  4%     -11.4%     488.25 =C2=B1  3%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
     98.00 =C2=B1 22%     -49.7%      49.25 =C2=B1 27%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
     -9609 =C2=B1 -7%     +10.0%     -10571 =C2=B1 -1%  sched_debug.cpu#0.n=
r_uninterruptible
     15.50 =C2=B1 79%     -91.9%       1.25 =C2=B1173%  sched_debug.cpu#2.c=
pu_load[1]
     12.75 =C2=B1 58%     -76.5%       3.00 =C2=B1117%  sched_debug.cpu#2.c=
pu_load[2]
     11.75 =C2=B1 42%     -70.2%       3.50 =C2=B1 95%  sched_debug.cpu#2.c=
pu_load[3]
     11.00 =C2=B1 39%     -68.2%       3.50 =C2=B1 82%  sched_debug.cpu#2.c=
pu_load[4]
    851076 =C2=B1155%     -93.9%      52140 =C2=B1 38%  sched_debug.cpu#3.n=
r_switches
      1395 =C2=B1  4%      -8.7%       1274 =C2=B1  1%  sched_debug.cpu#3.n=
r_uninterruptible
    851137 =C2=B1155%     -93.9%      52218 =C2=B1 38%  sched_debug.cpu#3.s=
ched_count
    418288 =C2=B1157%     -94.6%      22436 =C2=B1 44%  sched_debug.cpu#3.s=
ched_goidle
      6.00 =C2=B1100%    +150.0%      15.00 =C2=B1 30%  sched_debug.cpu#4.c=
pu_load[2]
      5.25 =C2=B1 76%    +157.1%      13.50 =C2=B1 19%  sched_debug.cpu#4.c=
pu_load[3]
      5.25 =C2=B1 72%    +123.8%      11.75 =C2=B1 20%  sched_debug.cpu#4.c=
pu_load[4]
      1507 =C2=B1  5%     +23.3%       1859 =C2=B1  5%  sched_debug.cpu#5.n=
r_uninterruptible
    811411 =C2=B1  8%     +10.4%     895772 =C2=B1  6%  sched_debug.cpu#6.a=
vg_idle
      1349 =C2=B1 13%     +38.2%       1863 =C2=B1  3%  sched_debug.cpu#6.n=
r_uninterruptible

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/filesize/test_size/sync_method/nr_directories/nr_files_per_=
directory:
  nhm4/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/=
1x/32t/1HDD/xfs/8K/400M/fsyncBeforeClose/16d/256fpd

commit: =

  a4be9881623375fd126762af65ef18dc8175c68d
  fa58aafc44805ac425d17c6a8082513b5442ce9d

a4be9881623375fd fa58aafc44805ac425d17c6a80 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     85071 =C2=B1 14%     -33.4%      56662 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
     44.50 =C2=B1  2%     +12.9%      50.25 =C2=B1  0%  fsmark.time.percent=
_of_cpu_this_job_got
   1173823 =C2=B1  2%     +25.4%    1472245 =C2=B1  6%  latency_stats.sum.d=
own.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_r=
ead_buf_map.xfs_read_agi.xfs_ialloc_read_agi.xfs_dialloc.xfs_ialloc.xfs_dir=
_ialloc.xfs_create
     16393 =C2=B1  0%    +224.5%      53190 =C2=B1112%  softirqs.TIMER
     36.11 =C2=B1  2%    +148.9%      89.88 =C2=B1 94%  uptime.boot
    178.57 =C2=B1  4%    +241.2%     609.30 =C2=B1111%  uptime.idle
    178335 =C2=B1  0%     -80.3%      35149 =C2=B1  2%  vmstat.system.cs
     77433 =C2=B1  0%     -93.5%       5027 =C2=B1  2%  vmstat.system.in
     28135 =C2=B1  3%     -12.1%      24722 =C2=B1  1%  meminfo.Active(anon)
     27784 =C2=B1  3%     -12.3%      24365 =C2=B1  1%  meminfo.AnonPages
     14863 =C2=B1  2%     -14.8%      12659 =C2=B1  2%  meminfo.Mapped
      6993 =C2=B1  3%     -11.9%       6160 =C2=B1  1%  proc-vmstat.nr_acti=
ve_anon
      6906 =C2=B1  3%     -12.0%       6075 =C2=B1  1%  proc-vmstat.nr_anon=
_pages
      3703 =C2=B1  2%     -14.9%       3152 =C2=B1  2%  proc-vmstat.nr_mapp=
ed
     85071 =C2=B1 14%     -33.4%      56662 =C2=B1  0%  time.involuntary_co=
ntext_switches
     44.50 =C2=B1  2%     +12.9%      50.25 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
      5.87 =C2=B1  1%     +13.5%       6.67 =C2=B1  1%  time.system_time
     10.71 =C2=B1  1%     -27.2%       7.79 =C2=B1  0%  turbostat.%Busy
    357.25 =C2=B1  1%     -34.9%     232.50 =C2=B1  0%  turbostat.Avg_MHz
      3333 =C2=B1  0%     -10.5%       2984 =C2=B1  0%  turbostat.Bzy_MHz
     48.21 =C2=B1  5%     -23.5%      36.86 =C2=B1  4%  turbostat.CPU%c1
     32.52 =C2=B1  5%     +22.7%      39.91 =C2=B1  5%  turbostat.CPU%c3
      8.56 =C2=B1 11%     +80.3%      15.43 =C2=B1  5%  turbostat.CPU%c6
  18315930 =C2=B1  4%     -46.6%    9777154 =C2=B1  8%  cpuidle.C1-NHM.time
   1153863 =C2=B1  2%     -94.6%      62163 =C2=B1  3%  cpuidle.C1-NHM.usage
     73216 =C2=B1  3%     +10.4%      80802 =C2=B1  3%  cpuidle.C3-NHM.usage
  22540985 =C2=B1  6%     +26.9%   28610584 =C2=B1  4%  cpuidle.C6-NHM.time
     10006 =C2=B1  8%     +10.7%      11072 =C2=B1  3%  cpuidle.C6-NHM.usage
     43036 =C2=B1 99%     -98.5%     641.00 =C2=B1 24%  cpuidle.POLL.time
     14491 =C2=B1104%     -99.6%      51.50 =C2=B1 21%  cpuidle.POLL.usage
     17223 =C2=B1 25%     -42.3%       9931 =C2=B1 35%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
      2435 =C2=B1  2%     -10.7%       2174 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
    379.00 =C2=B1 25%     -42.8%     216.75 =C2=B1 34%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
      2432 =C2=B1  2%     -10.7%       2172 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
     12047 =C2=B1 12%     +26.4%      15233 =C2=B1  4%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
      1122 =C2=B1 11%     +18.6%       1331 =C2=B1  4%  sched_debug.cfs_rq[=
2]:/.min_vruntime
     -2608 =C2=B1 -9%     -16.4%      -2180 =C2=B1-12%  sched_debug.cfs_rq[=
2]:/.spread0
      2436 =C2=B1  2%     -10.9%       2170 =C2=B1  2%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
    262.50 =C2=B1 12%     +27.0%     333.50 =C2=B1  5%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
      2435 =C2=B1  2%     -10.7%       2173 =C2=B1  2%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
      2050 =C2=B1120%    +731.3%      17041 =C2=B1 16%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
      2433 =C2=B1  1%     -10.3%       2181 =C2=B1  2%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
      2073 =C2=B1121%    +731.2%      17235 =C2=B1 16%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
      1043 =C2=B1 19%     -35.6%     672.06 =C2=B1 20%  sched_debug.cfs_rq[=
5]:/.min_vruntime
      2433 =C2=B1  1%     -10.3%       2184 =C2=B1  2%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
      2433 =C2=B1  1%     -10.2%       2185 =C2=B1  2%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
     13519 =C2=B1 30%     -40.0%       8114 =C2=B1 35%  sched_debug.cfs_rq[=
7]:/.blocked_load_avg
      2429 =C2=B1  1%     -10.1%       2185 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
     13871 =C2=B1 30%     -39.9%       8331 =C2=B1 35%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
    353549 =C2=B1  9%     +66.8%     589619 =C2=B1 40%  sched_debug.cpu#0.a=
vg_idle
     21206 =C2=B1  3%    +253.8%      75034 =C2=B1113%  sched_debug.cpu#0.c=
lock
     21206 =C2=B1  3%    +253.8%      75034 =C2=B1113%  sched_debug.cpu#0.c=
lock_task
     21207 =C2=B1  3%    +253.8%      75035 =C2=B1113%  sched_debug.cpu#1.c=
lock
     21207 =C2=B1  3%    +253.8%      75035 =C2=B1113%  sched_debug.cpu#1.c=
lock_task
     21205 =C2=B1  3%    +253.9%      75035 =C2=B1113%  sched_debug.cpu#2.c=
lock
     21205 =C2=B1  3%    +253.9%      75035 =C2=B1113%  sched_debug.cpu#2.c=
lock_task
      5275 =C2=B1 21%     +95.3%      10300 =C2=B1 35%  sched_debug.cpu#2.n=
r_switches
      5280 =C2=B1 21%     +95.4%      10319 =C2=B1 35%  sched_debug.cpu#2.s=
ched_count
      2298 =C2=B1 24%    +108.5%       4792 =C2=B1 37%  sched_debug.cpu#2.s=
ched_goidle
      2377 =C2=B1 31%     +96.9%       4680 =C2=B1 34%  sched_debug.cpu#2.t=
twu_count
    748.00 =C2=B1 47%    +284.9%       2879 =C2=B1 48%  sched_debug.cpu#2.t=
twu_local
     21208 =C2=B1  3%    +253.8%      75034 =C2=B1113%  sched_debug.cpu#3.c=
lock
     21208 =C2=B1  3%    +253.8%      75034 =C2=B1113%  sched_debug.cpu#3.c=
lock_task
     21206 =C2=B1  3%    +253.8%      75034 =C2=B1113%  sched_debug.cpu#4.c=
lock
     21206 =C2=B1  3%    +253.8%      75034 =C2=B1113%  sched_debug.cpu#4.c=
lock_task
     73956 =C2=B1163%     -96.5%       2581 =C2=B1 41%  sched_debug.cpu#4.n=
r_switches
     73962 =C2=B1163%     -96.5%       2600 =C2=B1 42%  sched_debug.cpu#4.s=
ched_count
     36498 =C2=B1165%     -97.4%     950.25 =C2=B1 60%  sched_debug.cpu#4.s=
ched_goidle
    507768 =C2=B1 26%     +65.5%     840493 =C2=B1 20%  sched_debug.cpu#5.a=
vg_idle
     21207 =C2=B1  3%    +253.8%      75034 =C2=B1113%  sched_debug.cpu#5.c=
lock
     21207 =C2=B1  3%    +253.8%      75034 =C2=B1113%  sched_debug.cpu#5.c=
lock_task
     44.75 =C2=B1 62%     -84.4%       7.00 =C2=B1 81%  sched_debug.cpu#5.c=
pu_load[1]
    779.25 =C2=B1 42%     +33.1%       1037 =C2=B1 34%  sched_debug.cpu#5.n=
r_load_updates
     21207 =C2=B1  3%    +253.8%      75035 =C2=B1113%  sched_debug.cpu#6.c=
lock
     21207 =C2=B1  3%    +253.8%      75035 =C2=B1113%  sched_debug.cpu#6.c=
lock_task
      1995 =C2=B1 11%     +21.6%       2427 =C2=B1 17%  sched_debug.cpu#6.n=
r_switches
      2001 =C2=B1 11%     +22.3%       2446 =C2=B1 17%  sched_debug.cpu#6.s=
ched_count
     21206 =C2=B1  3%    +253.8%      75035 =C2=B1113%  sched_debug.cpu#7.c=
lock
     21206 =C2=B1  3%    +253.8%      75035 =C2=B1113%  sched_debug.cpu#7.c=
lock_task
     21207 =C2=B1  3%    +253.8%      75036 =C2=B1113%  sched_debug.cpu_clk
     21049 =C2=B1  3%    +255.7%      74876 =C2=B1113%  sched_debug.ktime
     21207 =C2=B1  3%    +253.8%      75036 =C2=B1113%  sched_debug.sched_c=
lk

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_threads/ite=
rations/samples:
  lituya/ftq/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/powersave/100=
%/20x/100000ss

commit: =

  a4be9881623375fd126762af65ef18dc8175c68d
  fa58aafc44805ac425d17c6a8082513b5442ce9d

a4be9881623375fd fa58aafc44805ac425d17c6a80 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      7572 =C2=B1  0%      +6.2%       8040 =C2=B1  0%  ftq.counts
      0.18 =C2=B1  2%     -82.4%       0.03 =C2=B1  8%  ftq.stddev
   1737203 =C2=B1  0%     -99.1%      15898 =C2=B1 18%  ftq.time.involuntar=
y_context_switches
      1467 =C2=B1  0%      +3.4%       1517 =C2=B1  0%  ftq.time.percent_of=
_cpu_this_job_got
    547.01 =C2=B1  0%      +3.5%     566.08 =C2=B1  0%  ftq.time.user_time
     16734 =C2=B1  0%     -13.5%      14475 =C2=B1  0%  meminfo.Mapped
      4181 =C2=B1  0%     -13.3%       3624 =C2=B1  0%  proc-vmstat.nr_mapp=
ed
      1.21 =C2=B1  3%     -53.7%       0.56 =C2=B1  2%  turbostat.CPU%c1
      5.76 =C2=B1  3%     +14.6%       6.61 =C2=B1  1%  turbostat.CPU%c6
     97309 =C2=B1  0%     -96.9%       2991 =C2=B1  2%  vmstat.system.cs
     62011 =C2=B1  0%     -76.5%      14573 =C2=B1  0%  vmstat.system.in
   1737203 =C2=B1  0%     -99.1%      15898 =C2=B1 18%  time.involuntary_co=
ntext_switches
      2.07 =C2=B1  6%     -47.5%       1.09 =C2=B1  2%  time.system_time
    655.75 =C2=B1 36%     +55.8%       1021 =C2=B1  5%  time.voluntary_cont=
ext_switches
   1917711 =C2=B1 27%     -91.5%     163688 =C2=B1 12%  cpuidle.C1-HSW.time
    144241 =C2=B1  3%     -99.6%     608.50 =C2=B1 13%  cpuidle.C1-HSW.usage
     13.25 =C2=B1 38%     -92.5%       1.00 =C2=B1100%  cpuidle.POLL.time
      7.00 =C2=B1 30%     -92.9%       0.50 =C2=B1100%  cpuidle.POLL.usage
      3330 =C2=B1  2%     -12.4%       2918 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
     48305 =C2=B1 10%     +46.6%      70802 =C2=B1  3%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
      1737 =C2=B1 74%    +479.4%      10066 =C2=B1 59%  sched_debug.cfs_rq[=
10]:/.blocked_load_avg
      3330 =C2=B1  2%     -12.3%       2922 =C2=B1  1%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
     47674 =C2=B1 10%     +46.5%      69861 =C2=B1  3%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
      1812 =C2=B1 73%    +457.2%      10098 =C2=B1 59%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
     -4849 =C2=B1 -2%     -17.4%      -4006 =C2=B1-17%  sched_debug.cfs_rq[=
11]:/.spread0
      3330 =C2=B1  2%     -12.3%       2922 =C2=B1  1%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
     47674 =C2=B1 10%     +46.5%      69861 =C2=B1  3%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
      3330 =C2=B1  2%     -12.0%       2930 =C2=B1  1%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
     47674 =C2=B1 10%     +46.4%      69806 =C2=B1  3%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
      3330 =C2=B1  2%     -12.0%       2930 =C2=B1  1%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
     47674 =C2=B1 10%     +46.4%      69806 =C2=B1  3%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
      3338 =C2=B1  2%     -12.2%       2930 =C2=B1  1%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
     47612 =C2=B1 10%     +46.6%      69806 =C2=B1  3%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
     13486 =C2=B1 65%     -66.1%       4567 =C2=B1 44%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
      3347 =C2=B1  2%     -12.5%       2930 =C2=B1  1%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
     47536 =C2=B1 10%     +46.8%      69806 =C2=B1  3%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
    295.00 =C2=B1 67%     -66.2%      99.75 =C2=B1 45%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
      3329 =C2=B1  2%     -12.4%       2917 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
     48268 =C2=B1 10%     +46.7%      70802 =C2=B1  3%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
    611.00 =C2=B1164%    +895.1%       6080 =C2=B1 65%  sched_debug.cfs_rq[=
2]:/.blocked_load_avg
      3328 =C2=B1  2%     -13.0%       2897 =C2=B1  1%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
     48268 =C2=B1 10%     +45.8%      70372 =C2=B1  3%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
    611.00 =C2=B1164%    +961.3%       6484 =C2=B1 69%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
      2088 =C2=B1 22%     -30.6%       1448 =C2=B1  2%  sched_debug.cfs_rq[=
3]:/.min_vruntime
      3328 =C2=B1  2%     -13.0%       2897 =C2=B1  1%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
     48268 =C2=B1 10%     +45.8%      70372 =C2=B1  3%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
      3330 =C2=B1  2%     -12.8%       2902 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
     48037 =C2=B1 10%     +46.3%      70285 =C2=B1  3%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
      3321 =C2=B1  2%     -12.5%       2905 =C2=B1  1%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
     48034 =C2=B1 10%     +46.2%      70241 =C2=B1  3%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
      5958 =C2=B1 58%     -79.2%       1239 =C2=B1 77%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
      3321 =C2=B1  2%     -12.4%       2909 =C2=B1  1%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
     48034 =C2=B1 10%     +46.2%      70222 =C2=B1  3%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
      6017 =C2=B1 57%     -79.4%       1239 =C2=B1 77%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
     -4384 =C2=B1-20%     -23.6%      -3350 =C2=B1-37%  sched_debug.cfs_rq[=
7]:/.spread0
      3321 =C2=B1  2%     -12.4%       2909 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
     47777 =C2=B1 10%     +47.0%      70222 =C2=B1  3%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
      6303 =C2=B1 42%     +54.5%       9736 =C2=B1 14%  sched_debug.cfs_rq[=
8]:/.avg->runnable_avg_sum
    909.28 =C2=B1 36%     +91.1%       1738 =C2=B1 39%  sched_debug.cfs_rq[=
8]:/.min_vruntime
      3330 =C2=B1  2%     -12.5%       2914 =C2=B1  1%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
     47674 =C2=B1 10%     +47.2%      70180 =C2=B1  3%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
    137.75 =C2=B1 43%     +52.8%     210.50 =C2=B1 14%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib
     99.27 =C2=B1 18%     +50.2%     149.07 =C2=B1 22%  sched_debug.cfs_rq[=
9]:/.exec_clock
      3330 =C2=B1  2%     -12.3%       2922 =C2=B1  1%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
     47674 =C2=B1 10%     +46.5%      69861 =C2=B1  3%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
     27.00 =C2=B1 43%     -55.6%      12.00 =C2=B1  5%  sched_debug.cpu#0.c=
pu_load[3]
    889905 =C2=B1  9%     -24.5%     671951 =C2=B1 16%  sched_debug.cpu#1.a=
vg_idle
     10.00 =C2=B1 43%     -70.0%       3.00 =C2=B1102%  sched_debug.cpu#1.c=
pu_load[3]
      8.50 =C2=B1 52%     -79.4%       1.75 =C2=B1102%  sched_debug.cpu#1.c=
pu_load[4]
      7.75 =C2=B1 19%    -108.6%      -0.67 =C2=B1-430%  sched_debug.cpu#10=
.nr_uninterruptible
      2398 =C2=B1 82%     -86.6%     321.25 =C2=B1 45%  sched_debug.cpu#10.=
ttwu_count
      1835 =C2=B1 95%     -96.5%      64.00 =C2=B1 30%  sched_debug.cpu#10.=
ttwu_local
      1368 =C2=B1  8%     +26.8%       1736 =C2=B1 18%  sched_debug.cpu#11.=
nr_switches
      1373 =C2=B1  8%     +26.6%       1738 =C2=B1 18%  sched_debug.cpu#11.=
sched_count
    509.75 =C2=B1 10%     +35.9%     693.00 =C2=B1 22%  sched_debug.cpu#11.=
sched_goidle
    578.00 =C2=B1 30%     +36.0%     786.25 =C2=B1 17%  sched_debug.cpu#11.=
ttwu_count
    334.00 =C2=B1 36%    +115.6%     720.25 =C2=B1 16%  sched_debug.cpu#13.=
ttwu_count
    588893 =C2=B1 42%     +64.2%     966897 =C2=B1  5%  sched_debug.cpu#5.a=
vg_idle
     -4.00 =C2=B1-68%    -118.8%       0.75 =C2=B1331%  sched_debug.cpu#5.n=
r_uninterruptible
      2.25 =C2=B1164%    -355.6%      -5.75 =C2=B1-65%  sched_debug.cpu#7.n=
r_uninterruptible
    343.25 =C2=B1 42%     +86.7%     641.00 =C2=B1 43%  sched_debug.cpu#9.t=
twu_count

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_threads/ite=
rations/samples:
  lituya/fwq/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/1=
00%/20x/100000ss

commit: =

  a4be9881623375fd126762af65ef18dc8175c68d
  fa58aafc44805ac425d17c6a8082513b5442ce9d

a4be9881623375fd fa58aafc44805ac425d17c6a80 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      0.11 =C2=B1  2%     -44.0%       0.06 =C2=B1  2%  fwq.stddev
   3229188 =C2=B1  0%     -85.9%     455853 =C2=B1 11%  fwq.time.involuntar=
y_context_switches
     13780 =C2=B1  1%      +5.7%      14566 =C2=B1  0%  fwq.time.maximum_re=
sident_set_size
    176058 =C2=B1 20%     -31.6%     120345 =C2=B1  0%  latency_stats.sum.d=
o_wait.SyS_wait4.entry_SYSCALL_64_fastpath
      0.30 =C2=B1 22%     -76.9%       0.07 =C2=B1  0%  turbostat.CPU%c1
    484.63 =C2=B1 56%     -36.7%     307.00 =C2=B1  1%  uptime.idle
     16399 =C2=B1  3%     -78.3%       3553 =C2=B1  2%  vmstat.system.cs
     22757 =C2=B1  3%     -26.2%      16801 =C2=B1  0%  vmstat.system.in
      3907 =C2=B1  4%     -10.0%       3517 =C2=B1  4%  slabinfo.anon_vma.a=
ctive_objs
      3907 =C2=B1  4%     -10.0%       3517 =C2=B1  4%  slabinfo.anon_vma.n=
um_objs
      8215 =C2=B1  4%      -8.4%       7522 =C2=B1  4%  slabinfo.kmalloc-51=
2.num_objs
   3229188 =C2=B1  0%     -85.9%     455853 =C2=B1 11%  time.involuntary_co=
ntext_switches
      1791 =C2=B1  3%     +10.3%       1976 =C2=B1  3%  time.minor_page_fau=
lts
      3.12 =C2=B1  1%     -72.4%       0.86 =C2=B1  6%  time.system_time
   2392395 =C2=B1114%     -93.4%     156963 =C2=B1 92%  cpuidle.C1-HSW.time
     48618 =C2=B1 12%     -99.3%     331.33 =C2=B1 14%  cpuidle.C1-HSW.usage
 2.271e+08 =C2=B1130%     -82.5%   39690941 =C2=B1  3%  cpuidle.C6-HSW.time
      5212 =C2=B1 82%     -75.3%       1289 =C2=B1  6%  cpuidle.C6-HSW.usage
      6.25 =C2=B1 66%    -100.0%       0.00 =C2=B1  0%  cpuidle.POLL.time
      2.75 =C2=B1 15%    -100.0%       0.00 =C2=B1  0%  cpuidle.POLL.usage
    300.50 =C2=B1 49%    +108.2%     625.67 =C2=B1 33%  sched_debug.cfs_rq[=
0]:/.blocked_load_avg
     55.25 =C2=B1  4%      -7.7%      51.00 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.load
     58.75 =C2=B1  8%     -14.9%      50.00 =C2=B1  1%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
    364.25 =C2=B1 42%     +87.7%     683.67 =C2=B1 28%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
    912.75 =C2=B1 35%     -41.1%     537.33 =C2=B1 70%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
    792.33 =C2=B1 74%    +151.1%       1989 =C2=B1 32%  sched_debug.cfs_rq[=
11]:/.blocked_load_avg
    659.50 =C2=B1 92%    +212.5%       2061 =C2=B1 30%  sched_debug.cfs_rq[=
11]:/.tg_load_contrib
    489.50 =C2=B1 59%    +158.1%       1263 =C2=B1 20%  sched_debug.cfs_rq[=
12]:/.blocked_load_avg
    544.75 =C2=B1 53%    +143.4%       1326 =C2=B1 19%  sched_debug.cfs_rq[=
12]:/.tg_load_contrib
     98.25 =C2=B1 86%    +298.3%     391.33 =C2=B1 34%  sched_debug.cfs_rq[=
1]:/.blocked_load_avg
    157.25 =C2=B1 57%    +194.9%     463.67 =C2=B1 28%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
    324.00 =C2=B1 68%    +471.2%       1850 =C2=B1 22%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
    379.75 =C2=B1 60%    +402.9%       1909 =C2=B1 21%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
     67.75 =C2=B1 26%     -23.2%      52.00 =C2=B1  6%  sched_debug.cfs_rq[=
5]:/.load
      1586 =C2=B1 85%     -64.3%     566.67 =C2=B1 46%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
      1679 =C2=B1 82%     -61.8%     642.00 =C2=B1 43%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
      1.25 =C2=B1 34%    +406.7%       6.33 =C2=B1 39%  sched_debug.cfs_rq[=
7]:/.nr_spread_over
     59.75 =C2=B1 12%     -11.3%      53.00 =C2=B1  6%  sched_debug.cpu#0.c=
pu_load[0]
     55.25 =C2=B1  4%      -7.7%      51.00 =C2=B1  4%  sched_debug.cpu#0.l=
oad
    125050 =C2=B1 80%     -83.6%      20475 =C2=B1 37%  sched_debug.cpu#1.n=
r_switches
      1.75 =C2=B1240%    +776.2%      15.33 =C2=B1 13%  sched_debug.cpu#1.n=
r_uninterruptible
    125107 =C2=B1 80%     -83.6%      20557 =C2=B1 37%  sched_debug.cpu#1.s=
ched_count
     54622 =C2=B1 93%     -78.4%      11825 =C2=B1 72%  sched_debug.cpu#1.t=
twu_count
     36441 =C2=B1 92%     -91.9%       2955 =C2=B1 47%  sched_debug.cpu#1.t=
twu_local
      7.75 =C2=B1 78%     -95.7%       0.33 =C2=B1282%  sched_debug.cpu#10.=
nr_uninterruptible
      7.25 =C2=B1 45%     -51.7%       3.50 =C2=B1 42%  sched_debug.cpu#12.=
nr_uninterruptible
      1584 =C2=B1 72%   +1888.2%      31493 =C2=B1121%  sched_debug.cpu#13.=
ttwu_count
     12188 =C2=B1141%     -91.0%       1100 =C2=B1 68%  sched_debug.cpu#4.s=
ched_goidle
     80.00 =C2=B1 15%     -27.1%      58.33 =C2=B1  7%  sched_debug.cpu#6.c=
pu_load[3]
     78.00 =C2=B1 16%     -27.8%      56.33 =C2=B1  4%  sched_debug.cpu#6.c=
pu_load[4]
    128000 =C2=B1128%     -95.1%       6219 =C2=B1103%  sched_debug.cpu#8.t=
twu_count
    106189 =C2=B1165%     -99.7%     357.33 =C2=B1  2%  sched_debug.cpu#8.t=
twu_local
     32547 =C2=B1143%     -89.9%       3291 =C2=B1 62%  sched_debug.cpu#9.n=
r_switches
     32615 =C2=B1143%     -89.7%       3352 =C2=B1 62%  sched_debug.cpu#9.s=
ched_count
     26785 =C2=B1 79%     -85.9%       3781 =C2=B1 81%  sched_debug.cpu#9.t=
twu_count
      5.94 =C2=B1172%    -100.0%       0.00 =C2=B1 85%  sched_debug.rt_rq[2=
]:/.rt_time
      1.89 =C2=B1172%     -99.9%       0.00 =C2=B1 89%  sched_debug.rt_rq[8=
]:/.rt_time

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/runtime/nr_thr=
eads/cluster/test:
  lkp-ne02/netperf/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perform=
ance/300s/200%/cs-localhost/SCTP_RR

commit: =

  a4be9881623375fd126762af65ef18dc8175c68d
  fa58aafc44805ac425d17c6a8082513b5442ce9d

a4be9881623375fd fa58aafc44805ac425d17c6a80 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   1233946 =C2=B1  1%     -93.3%      83018 =C2=B1 13%  netperf.time.involu=
ntary_context_switches
     26623 =C2=B1120%     -76.8%       6174 =C2=B1 63%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs4_file_open.[nfsv4].do_dentry_open.vfs_open.path_openat.do_filp_=
open.do_sys_open
    301360 =C2=B1  2%      -8.2%     276612 =C2=B1  1%  softirqs.RCU
   1233946 =C2=B1  1%     -93.3%      83018 =C2=B1 13%  time.involuntary_co=
ntext_switches
      0.22 =C2=B1 12%     -27.0%       0.16 =C2=B1 13%  turbostat.CPU%c1
     26675 =C2=B1  0%     -32.3%      18052 =C2=B1  0%  vmstat.system.in
      9078 =C2=B1  5%     +12.7%      10235 =C2=B1  3%  slabinfo.vm_area_st=
ruct.active_objs
      9128 =C2=B1  4%     +12.8%      10298 =C2=B1  3%  slabinfo.vm_area_st=
ruct.num_objs
   3247591 =C2=B1 37%     -42.2%    1877235 =C2=B1 23%  cpuidle.C1-NHM.time
    175462 =C2=B1  7%     -95.2%       8494 =C2=B1  6%  cpuidle.C1-NHM.usage
    863871 =C2=B1 11%    -100.0%      63.00 =C2=B1  8%  cpuidle.POLL.time
    175219 =C2=B1 10%    -100.0%       5.50 =C2=B1 20%  cpuidle.POLL.usage
      2731 =C2=B1120%    +218.4%       8696 =C2=B1  3%  numa-meminfo.node0.=
Inactive(anon)
     15363 =C2=B1  5%      +7.2%      16474 =C2=B1  4%  numa-meminfo.node0.=
SUnreclaim
      6557 =C2=B1 50%     -91.3%     570.25 =C2=B1 49%  numa-meminfo.node1.=
Inactive(anon)
      7805 =C2=B1 13%     -25.5%       5812 =C2=B1  0%  numa-meminfo.node1.=
Mapped
     18367 =C2=B1  2%      -7.4%      17002 =C2=B1  5%  numa-meminfo.node1.=
SReclaimable
    682.50 =C2=B1120%    +218.5%       2173 =C2=B1  3%  numa-vmstat.node0.n=
r_inactive_anon
      3840 =C2=B1  5%      +7.2%       4118 =C2=B1  4%  numa-vmstat.node0.n=
r_slab_unreclaimable
      1639 =C2=B1 50%     -91.3%     142.00 =C2=B1 49%  numa-vmstat.node1.n=
r_inactive_anon
      1950 =C2=B1 13%     -25.5%       1452 =C2=B1  0%  numa-vmstat.node1.n=
r_mapped
      4591 =C2=B1  2%      -7.4%       4250 =C2=B1  5%  numa-vmstat.node1.n=
r_slab_reclaimable
      1.00 =C2=B1 70%    +350.0%       4.50 =C2=B1 57%  sched_debug.cfs_rq[=
12]:/.nr_spread_over
     -1967 =C2=B1-3098%   +5332.3%    -106895 =C2=B1-79%  sched_debug.cfs_r=
q[13]:/.spread0
    103.00 =C2=B1  5%     +19.4%     123.00 =C2=B1  5%  sched_debug.cfs_rq[=
15]:/.load
     95.75 =C2=B1 10%     +16.7%     111.75 =C2=B1 10%  sched_debug.cfs_rq[=
15]:/.runnable_load_avg
     -1514 =C2=B1-4117%   +6467.6%     -99452 =C2=B1-81%  sched_debug.cfs_r=
q[15]:/.spread0
   1116022 =C2=B1  6%     +11.2%    1240796 =C2=B1  4%  sched_debug.cfs_rq[=
2]:/.MIN_vruntime
   1116022 =C2=B1  6%     +11.2%    1240796 =C2=B1  4%  sched_debug.cfs_rq[=
2]:/.max_vruntime
   1084538 =C2=B1  9%     +15.0%    1247278 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.MIN_vruntime
   1084538 =C2=B1  9%     +15.0%    1247278 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.max_vruntime
     12.25 =C2=B1 10%     -40.8%       7.25 =C2=B1 35%  sched_debug.cfs_rq[=
5]:/.nr_spread_over
     -3847 =C2=B1-1573%   +2484.2%     -99431 =C2=B1-80%  sched_debug.cfs_r=
q[7]:/.spread0
     -2145 =C2=B1-139%    +451.8%     -11836 =C2=B1-59%  sched_debug.cfs_rq=
[8]:/.spread0
    119.00 =C2=B1  7%     -23.1%      91.50 =C2=B1 12%  sched_debug.cpu#0.c=
pu_load[0]
    105.25 =C2=B1  3%     -15.9%      88.50 =C2=B1  6%  sched_debug.cpu#0.c=
pu_load[1]
     99.00 =C2=B1  4%     -13.1%      86.00 =C2=B1  5%  sched_debug.cpu#0.c=
pu_load[2]
      1480 =C2=B1 21%     -34.8%     965.50 =C2=B1 10%  sched_debug.cpu#0.c=
urr->pid
      2943 =C2=B1 29%     +28.1%       3770 =C2=B1  1%  sched_debug.cpu#0.s=
ched_goidle
      1784 =C2=B1 77%     -75.2%     442.50 =C2=B1  7%  sched_debug.cpu#13.=
sched_goidle
     88778 =C2=B1 53%     +58.4%     140611 =C2=B1  8%  sched_debug.cpu#2.a=
vg_idle
     89.00 =C2=B1  6%     +27.2%     113.25 =C2=B1  4%  sched_debug.cpu#3.l=
oad
      2979 =C2=B1 51%     -67.9%     956.75 =C2=B1 19%  sched_debug.cpu#7.s=
ched_goidle
      1369 =C2=B1 29%     -26.8%       1002 =C2=B1 21%  sched_debug.cpu#9.c=
urr->pid

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/runtime/nr_thr=
eads/cluster/test:
  lkp-ne02/netperf/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perform=
ance/300s/200%/cs-localhost/TCP_SENDFILE

commit: =

  a4be9881623375fd126762af65ef18dc8175c68d
  fa58aafc44805ac425d17c6a8082513b5442ce9d

a4be9881623375fd fa58aafc44805ac425d17c6a80 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   2033310 =C2=B1  0%     -97.2%      57638 =C2=B1  4%  netperf.time.involu=
ntary_context_switches
    165110 =C2=B1 33%     +47.2%     243029 =C2=B1 20%  proc-vmstat.pgalloc=
_normal
   2033310 =C2=B1  0%     -97.2%      57638 =C2=B1  4%  time.involuntary_co=
ntext_switches
      3320 =C2=B1  7%     +12.2%       3725 =C2=B1  4%  numa-meminfo.node0.=
KernelStack
      2760 =C2=B1  8%     -15.4%       2335 =C2=B1  6%  numa-meminfo.node1.=
KernelStack
     78.25 =C2=B1 37%     -78.3%      17.00 =C2=B1139%  numa-vmstat.node1.n=
r_dirtied
     76.25 =C2=B1 37%     -78.4%      16.50 =C2=B1138%  numa-vmstat.node1.n=
r_written
      0.22 =C2=B1  5%     -35.6%       0.14 =C2=B1  8%  turbostat.CPU%c1
      0.53 =C2=B1  5%     +16.0%       0.61 =C2=B1  0%  turbostat.CPU%c6
     49180 =C2=B1  0%     -48.2%      25479 =C2=B1  0%  vmstat.system.cs
     27651 =C2=B1  0%     -37.2%      17351 =C2=B1  0%  vmstat.system.in
   4278144 =C2=B1  1%     -22.0%    3335680 =C2=B1  0%  latency_stats.hits.=
sk_wait_data.tcp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_recvfrom.SyS_recvfr=
om.entry_SYSCALL_64_fastpath
     44720 =C2=B1 36%    +113.9%      95674 =C2=B1108%  latency_stats.sum.g=
eneric_file_write_iter.nfs_file_write.__vfs_write.vfs_write.SyS_write.entry=
_SYSCALL_64_fastpath
 2.379e+09 =C2=B1  0%      -1.2%  2.351e+09 =C2=B1  0%  latency_stats.sum.s=
k_wait_data.tcp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_recvfrom.SyS_recvfro=
m.entry_SYSCALL_64_fastpath
   1875754 =C2=B1  8%     -75.8%     453014 =C2=B1 30%  cpuidle.C1-NHM.time
    149386 =C2=B1  1%     -95.2%       7207 =C2=B1 45%  cpuidle.C1-NHM.usage
    322.75 =C2=B1 51%     -65.1%     112.50 =C2=B1 16%  cpuidle.C1E-NHM.usa=
ge
     14707 =C2=B1165%     -99.7%      42.00 =C2=B1 41%  cpuidle.POLL.time
    232.50 =C2=B1 82%     -98.6%       3.25 =C2=B1 45%  cpuidle.POLL.usage
    106.75 =C2=B1  2%     -10.5%      95.50 =C2=B1  5%  sched_debug.cfs_rq[=
12]:/.load
    112.50 =C2=B1  7%     -15.8%      94.75 =C2=B1  5%  sched_debug.cfs_rq[=
12]:/.runnable_load_avg
    110.75 =C2=B1  3%     -12.0%      97.50 =C2=B1 15%  sched_debug.cfs_rq[=
13]:/.runnable_load_avg
    143.00 =C2=B1 98%    +628.1%       1041 =C2=B1 47%  sched_debug.cfs_rq[=
2]:/.blocked_load_avg
    247.75 =C2=B1 57%    +366.3%       1155 =C2=B1 42%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
     42.50 =C2=B1158%    +665.3%     325.25 =C2=B1 68%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
    -75934 =C2=B1-49%    -129.8%      22591 =C2=B1 76%  sched_debug.cfs_rq[=
3]:/.spread0
    145.50 =C2=B1 46%    +199.0%     435.00 =C2=B1 51%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
     30.75 =C2=B1 31%     +74.8%      53.75 =C2=B1 25%  sched_debug.cfs_rq[=
4]:/.nr_spread_over
    102.75 =C2=B1  3%     +10.7%     113.75 =C2=B1  6%  sched_debug.cpu#0.c=
pu_load[0]
      2530 =C2=B1 20%     +68.6%       4265 =C2=B1 23%  sched_debug.cpu#0.s=
ched_goidle
    350.25 =C2=B1 10%     +81.1%     634.25 =C2=B1 24%  sched_debug.cpu#10.=
sched_goidle
    112.00 =C2=B1  7%     -14.7%      95.50 =C2=B1  8%  sched_debug.cpu#12.=
cpu_load[0]
    110.25 =C2=B1  6%     -11.3%      97.75 =C2=B1  5%  sched_debug.cpu#12.=
cpu_load[1]
    109.50 =C2=B1  4%      -8.9%      99.75 =C2=B1  4%  sched_debug.cpu#12.=
cpu_load[2]
    110.75 =C2=B1  4%     -12.0%      97.50 =C2=B1 11%  sched_debug.cpu#13.=
cpu_load[1]
    111.25 =C2=B1  4%     -11.9%      98.00 =C2=B1 10%  sched_debug.cpu#13.=
cpu_load[2]
    624.00 =C2=B1 23%     -32.6%     420.50 =C2=B1 16%  sched_debug.cpu#13.=
sched_goidle
    947672 =C2=B1 76%     -77.0%     217667 =C2=B1  3%  sched_debug.cpu#15.=
nr_switches
    947705 =C2=B1 76%     -77.0%     217685 =C2=B1  3%  sched_debug.cpu#15.=
sched_count
    592433 =C2=B1 65%     -66.0%     201467 =C2=B1  1%  sched_debug.cpu#15.=
ttwu_local
    911.50 =C2=B1  8%      +9.5%     998.50 =C2=B1 11%  sched_debug.cpu#3.c=
urr->pid
    562814 =C2=B1 32%     +41.8%     798162 =C2=B1 15%  sched_debug.cpu#4.a=
vg_idle
    277723 =C2=B1 12%     -17.9%     227889 =C2=B1  5%  sched_debug.cpu#4.n=
r_switches
    277747 =C2=B1 12%     -17.9%     227907 =C2=B1  5%  sched_debug.cpu#4.s=
ched_count
    109.00 =C2=B1  2%     -11.0%      97.00 =C2=B1  0%  sched_debug.cpu#5.l=
oad

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_threads/ite=
rations/entries:
  snb-drag/tlbflush/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perfor=
mance/200%/32x/512

commit: =

  a4be9881623375fd126762af65ef18dc8175c68d
  fa58aafc44805ac425d17c6a8082513b5442ce9d

a4be9881623375fd fa58aafc44805ac425d17c6a80 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     89406 =C2=B1  1%      +2.1%      91264 =C2=B1  0%  tlbflush.mem_acc_ti=
me_thread_ms
     12692 =C2=B1 29%     -69.7%       3848 =C2=B1  6%  tlbflush.time.invol=
untary_context_switches
     45262 =C2=B1 14%     -20.5%      35996 =C2=B1 13%  softirqs.SCHED
     12692 =C2=B1 29%     -69.7%       3848 =C2=B1  6%  time.involuntary_co=
ntext_switches
      5023 =C2=B1 14%     +24.8%       6271 =C2=B1  4%  slabinfo.kmalloc-32=
.active_objs
      5023 =C2=B1 14%     +24.8%       6271 =C2=B1  4%  slabinfo.kmalloc-32=
.num_objs
     62647 =C2=B1  4%     -20.7%      49700 =C2=B1  4%  vmstat.system.cs
     26516 =C2=B1  6%     -24.7%      19964 =C2=B1  3%  vmstat.system.in
 1.486e+08 =C2=B1  4%     -25.5%  1.108e+08 =C2=B1  7%  cpuidle.C1-SNB.time
   9489652 =C2=B1  0%     -45.4%    5183155 =C2=B1  1%  cpuidle.C1-SNB.usage
     94983 =C2=B1 14%     -35.2%      61571 =C2=B1  0%  cpuidle.POLL.usage
    424061 =C2=B1 57%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs_atomic_open.path_openat.do_filp_open.do_sys_open.SyS_open.entry=
_SYSCALL_64_fastpath
    424061 =C2=B1 57%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs_atomic_open.path_openat.do_filp_open.do_sys_open.SyS_open.entry=
_SYSCALL_64_fastpath
    424061 =C2=B1 57%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs_atomic_open.path_openat.do_filp_open.do_sys_open.SyS_open.entry=
_SYSCALL_64_fastpath
      4767 =C2=B1 56%     -94.4%     268.00 =C2=B1 30%  sched_debug.cfs_rq[=
0]:/.load
     17.25 =C2=B1 58%    +127.5%      39.25 =C2=B1 19%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
   8521655 =C2=B1 15%     -42.7%    4882199 =C2=B1 15%  sched_debug.cpu#0.n=
r_switches
   8522183 =C2=B1 15%     -42.7%    4882721 =C2=B1 15%  sched_debug.cpu#0.s=
ched_count
   4225538 =C2=B1 15%     -42.7%    2421794 =C2=B1 15%  sched_debug.cpu#0.s=
ched_goidle
   4280766 =C2=B1 15%     -41.3%    2511288 =C2=B1 15%  sched_debug.cpu#0.t=
twu_count
   3693688 =C2=B1 17%     -48.0%    1919886 =C2=B1 18%  sched_debug.cpu#0.t=
twu_local
  10474544 =C2=B1 12%     -43.9%    5872222 =C2=B1  9%  sched_debug.cpu#1.n=
r_switches
  10474799 =C2=B1 12%     -43.9%    5872473 =C2=B1  9%  sched_debug.cpu#1.s=
ched_count
   5198778 =C2=B1 12%     -43.9%    2917524 =C2=B1  9%  sched_debug.cpu#1.s=
ched_goidle
   5265913 =C2=B1 12%     -44.2%    2940722 =C2=B1  9%  sched_debug.cpu#1.t=
twu_count
   4654824 =C2=B1 14%     -48.5%    2396748 =C2=B1 10%  sched_debug.cpu#1.t=
twu_local
      6.50 =C2=B1 50%    +138.5%      15.50 =C2=B1 25%  sched_debug.cpu#3.c=
pu_load[1]
      5.25 =C2=B1 28%    +114.3%      11.25 =C2=B1 25%  sched_debug.cpu#3.c=
pu_load[2]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/test:
  nhm-white/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/shel=
l8

commit: =

  a4be9881623375fd126762af65ef18dc8175c68d
  fa58aafc44805ac425d17c6a8082513b5442ce9d

a4be9881623375fd fa58aafc44805ac425d17c6a80 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   5937622 =C2=B1  1%     -26.4%    4369228 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
     51200 =C2=B1  3%     +15.0%      58880 =C2=B1  4%  meminfo.DirectMap4k
   5937622 =C2=B1  1%     -26.4%    4369228 =C2=B1  0%  time.involuntary_co=
ntext_switches
     62839 =C2=B1  1%     -28.4%      44966 =C2=B1  2%  vmstat.system.cs
     19289 =C2=B1  2%     -46.2%      10378 =C2=B1  2%  vmstat.system.in
      6.09 =C2=B1  0%      +8.9%       6.63 =C2=B1  2%  turbostat.CPU%c3
      0.45 =C2=B1 10%     +50.6%       0.67 =C2=B1 20%  turbostat.Pkg%pc3
      3.17 =C2=B1  1%     +62.5%       5.15 =C2=B1 47%  turbostat.Pkg%pc6
  45216499 =C2=B1  0%     -34.6%   29566388 =C2=B1  1%  cpuidle.C1-NHM.time
   1918738 =C2=B1  7%     -88.4%     222808 =C2=B1  2%  cpuidle.C1-NHM.usage
    220032 =C2=B1 10%     -90.2%      21647 =C2=B1 11%  cpuidle.POLL.time
     30597 =C2=B1  3%     -96.6%       1051 =C2=B1  2%  cpuidle.POLL.usage
      1886 =C2=B1 45%     +73.6%       3275 =C2=B1 36%  sched_debug.cfs_rq[=
4]:/.utilization_load_avg
    294740 =C2=B1  5%     +42.0%     418454 =C2=B1  8%  sched_debug.cpu#1.a=
vg_idle
   2624072 =C2=B1 63%     -60.8%    1029438 =C2=B1  2%  sched_debug.cpu#1.n=
r_switches
   2624725 =C2=B1 63%     -60.8%    1030184 =C2=B1  2%  sched_debug.cpu#1.s=
ched_count
   1203729 =C2=B1 70%     -66.9%     398300 =C2=B1  1%  sched_debug.cpu#1.t=
twu_count
    992043 =C2=B1 86%     -81.8%     180660 =C2=B1  3%  sched_debug.cpu#1.t=
twu_local
     15179 =C2=B1 13%     -43.3%       8606 =C2=B1 20%  sched_debug.cpu#2.c=
urr->pid
   -204.00 =C2=B1-22%     -47.5%    -107.00 =C2=B1-43%  sched_debug.cpu#2.n=
r_uninterruptible
    184.75 =C2=B1 28%     -28.1%     132.75 =C2=B1 13%  sched_debug.cpu#5.n=
r_uninterruptible
     14010 =C2=B1 11%     -20.8%      11095 =C2=B1 16%  sched_debug.cpu#7.c=
urr->pid
   2209845 =C2=B1 57%     -56.4%     962613 =C2=B1  3%  sched_debug.cpu#7.n=
r_switches
   2210474 =C2=B1 57%     -56.4%     963302 =C2=B1  3%  sched_debug.cpu#7.s=
ched_count
    575333 =C2=B1 61%     -58.4%     239461 =C2=B1  1%  sched_debug.cpu#7.s=
ched_goidle
      7.45 =C2=B1124%     -99.9%       0.01 =C2=B1  3%  sched_debug.rt_rq[5=
]:/.rt_time


lkp-a06: Atom
Memory: 8G

nhm4: Nehalem
Memory: 4G

lituya: Grantley Haswell
Memory: 16G

lkp-ne02: Nehalem-EP
Memory: 5G

snb-drag: Sandy Bridge
Memory: 6G

nhm-white: Nehalem
Memory: 6G



                        aim7.time.voluntary_context_switches

  58000 ++-----------------------------------------------------------------=
-+
        |                  *                                               =
 |
  56000 *+               .. +      .*                               .*     =
 |
  54000 ++*..*.*.*..   .*    *.*..*  +  .*     .*.*..*.*.    .*.  .*  +  .*=
.*
        |           *.*               *.  +  .*          *..*   *.     *.  =
 |
  52000 ++                                 *.                              =
 |
  50000 ++                                                                 =
 |
        |                                                                  =
 |
  48000 ++                                                                 =
 |
  46000 ++                                                                 =
 |
        |                                                                  =
 |
  44000 O+   O   O    O                                                    =
 |
  42000 ++O    O                  O O O                                    =
 |
        |           O   O  O O O         O                                 =
 |
  40000 ++-----------------------------------------------------------------=
-+


                        aim7.time.involuntary_context_switches

  2.2e+06 ++---------------------------------------------------------------=
-+
    2e+06 *+*..*.*.*.*..   .*.  .*.*.*..*.*.*.*..*.*.*..*.*.*.*..*.*.*.*..*=
.*
          |             *.*   *.                                           =
 |
  1.8e+06 ++                                                               =
 |
  1.6e+06 ++                                                               =
 |
  1.4e+06 ++                                                               =
 |
  1.2e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
   800000 ++                                                               =
 |
   600000 ++                                                               =
 |
   400000 ++                                                               =
 |
          |                                                                =
 |
   200000 O+O  O O O O  O O O O  O O O  O O                                =
 |
        0 ++---------------------------------------------------------------=
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

--===============2305406313214129767==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQpk
ZWZhdWx0LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogNDMz
NGU1OWVmMjgzOTY0MjU4MzNlMTUyZWRmNDBjNDBlNThjY2I4NAptb2RlbDogQXRvbQptZW1vcnk6
IDhHCmhkZF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1UT1NISUJBX01LODA2MUdT
WUJfMjJGSFAwTkdULXBhcnQxIgpzd2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAi
L2Rldi9kaXNrL2J5LWlkL2F0YS1UT1NISUJBX01LODA2MUdTWUJfMjJGSFAwTkdULXBhcnQyIgp0
ZXN0Y2FzZTogYWltNwphaW03OgogIGxvYWQ6IDQwMDAKICB0ZXN0OiBwaXBlX2NweQpxdWV1ZTog
Y3ljbGljCnRlc3Rib3g6IGxrcC1hMDYKdGJveF9ncm91cDogbGtwLWEwNgprY29uZmlnOiB4ODZf
NjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTUtMDgtMTMgMTU6MTk6MTEuMTkzNDIzMDI3ICswODow
MAppZDogMzRhYTUwZTI3OWFiMGY1MTNhY2I3ZjZhYmQzYTU3MmZlNjQ3ODdhNwp1c2VyOiBsa3AK
Y29tcGlsZXI6IGdjYy00LjkKaGVhZF9jb21taXQ6IDQzMzRlNTllZjI4Mzk2NDI1ODMzZTE1MmVk
ZjQwYzQwZTU4Y2NiODQKYmFzZV9jb21taXQ6IGY3NjQ0Y2JmY2RmMDM1MjhmMGY0NTBmMzk0MGM0
OTg1YjIyOTFmNDkKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNTA4MTMwMgpr
ZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNDMzNGU1OWVmMjgzOTY0MjU4
MzNlMTUyZWRmNDBjNDBlNThjY2I4NC92bWxpbnV6LTQuMi4wLXJjNi13bC1hdGgtMDM4NDAtZzQz
MzRlNTkiCnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegpyZXN1bHRfcm9vdDog
Ii9yZXN1bHQvYWltNy80MDAwLXBpcGVfY3B5L2xrcC1hMDYvZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzQzMzRlNTllZjI4Mzk2NDI1ODMzZTE1MmVkZjQw
YzQwZTU4Y2NiODQvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9sa3AtYTA2L2N5Y2xpY19h
aW03LTQwMDAtcGlwZV9jcHkteDg2XzY0LXJoZWwtQ1lDTElDX0hFQUQtNDMzNGU1OWVmMjgzOTY0
MjU4MzNlMTUyZWRmNDBjNDBlNThjY2I4NC0yMDE1MDgxMy0xNjMwOS1neDlycDgtMC55YW1sIgpk
ZXF1ZXVlX3RpbWU6IDIwMTUtMDgtMTMgMTY6Mjk6MjkuODI2NjkxMjY1ICswODowMApucl9jcHU6
ICIkKG5wcm9jKSIKbWF4X3VwdGltZTogMzYwMAppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGVi
aWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2
L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVkdWxlZC9sa3AtYTA2L2N5Y2xpY19haW03
LTQwMDAtcGlwZV9jcHkteDg2XzY0LXJoZWwtQ1lDTElDX0hFQUQtNDMzNGU1OWVmMjgzOTY0MjU4
MzNlMTUyZWRmNDBjNDBlNThjY2I4NC0yMDE1MDgxMy0xNjMwOS1neDlycDgtMC55YW1sCi0gQVJD
SD14ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1yaGVsCi0gYnJhbmNoPWxpbnV4LWRldmVsL2RldmVs
LWhvdXJseS0yMDE1MDgxMzAyCi0gY29tbWl0PTQzMzRlNTllZjI4Mzk2NDI1ODMzZTE1MmVkZjQw
YzQwZTU4Y2NiODQKLSBCT09UX0lNQUdFPS9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS80
MzM0ZTU5ZWYyODM5NjQyNTgzM2UxNTJlZGY0MGM0MGU1OGNjYjg0L3ZtbGludXotNC4yLjAtcmM2
LXdsLWF0aC0wMzg0MC1nNDMzNGU1OQotIG1heF91cHRpbWU9MzYwMAotIFJFU1VMVF9ST09UPS9y
ZXN1bHQvYWltNy80MDAwLXBpcGVfY3B5L2xrcC1hMDYvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzQzMzRlNTllZjI4Mzk2NDI1ODMzZTE1MmVkZjQwYzQw
ZTU4Y2NiODQvMAotIExLUF9TRVJWRVI9aW5uCi0gfDItCgoKICBlYXJseXByaW50az10dHlTMCwx
MTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdh
eXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEg
c29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFt
ZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0
eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oi
Cm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzQzMzRlNTll
ZjI4Mzk2NDI1ODMzZTE1MmVkZjQwYzQwZTU4Y2NiODQvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDog
Ii9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2lt
YWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9s
a3AvYmVuY2htYXJrcy9haW03LXg4Nl82NC5jZ3oiCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2
ZzogMjA0OC45NCA3MjEuNzggMjU3LjM3IDEvMTMxIDQ1MzgKc3RhcnRfdGltZTogJzE0Mzk0NTQ2
NzUnCmVuZF90aW1lOiAnMTQzOTQ1NDc2NCcKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNTA4
MTMtMDAxNjQwIgo=

--===============2305406313214129767==
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
bS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OC9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCm5ldHNlcnZlcgpuZXRwZXJmIC10IFRD
UF9TRU5ERklMRSAtYyAtQyAtbCAzMDAgLUggMTI3LjAuMC4xCm5ldHBlcmYgLXQgVENQX1NFTkRG
SUxFIC1jIC1DIC1sIDMwMCAtSCAxMjcuMC4wLjEKbmV0cGVyZiAtdCBUQ1BfU0VOREZJTEUgLWMg
LUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9TRU5ERklMRSAtYyAtQyAtbCAz
MDAgLUggMTI3LjAuMC4xCm5ldHBlcmYgLXQgVENQX1NFTkRGSUxFIC1jIC1DIC1sIDMwMCAtSCAx
MjcuMC4wLjEKbmV0cGVyZiAtdCBUQ1BfU0VOREZJTEUgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAu
MQpuZXRwZXJmIC10IFRDUF9TRU5ERklMRSAtYyAtQyAtbCAzMDAgLUggMTI3LjAuMC4xCm5ldHBl
cmYgLXQgVENQX1NFTkRGSUxFIC1jIC1DIC1sIDMwMCAtSCAxMjcuMC4wLjEKbmV0cGVyZiAtdCBU
Q1BfU0VOREZJTEUgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9TRU5E
RklMRSAtYyAtQyAtbCAzMDAgLUggMTI3LjAuMC4xCm5ldHBlcmYgLXQgVENQX1NFTkRGSUxFIC1j
IC1DIC1sIDMwMCAtSCAxMjcuMC4wLjEKbmV0cGVyZiAtdCBUQ1BfU0VOREZJTEUgLWMgLUMgLWwg
MzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9TRU5ERklMRSAtYyAtQyAtbCAzMDAgLUgg
MTI3LjAuMC4xCm5ldHBlcmYgLXQgVENQX1NFTkRGSUxFIC1jIC1DIC1sIDMwMCAtSCAxMjcuMC4w
LjEKbmV0cGVyZiAtdCBUQ1BfU0VOREZJTEUgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRw
ZXJmIC10IFRDUF9TRU5ERklMRSAtYyAtQyAtbCAzMDAgLUggMTI3LjAuMC4xCm5ldHBlcmYgLXQg
VENQX1NFTkRGSUxFIC1jIC1DIC1sIDMwMCAtSCAxMjcuMC4wLjEKbmV0cGVyZiAtdCBUQ1BfU0VO
REZJTEUgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9TRU5ERklMRSAt
YyAtQyAtbCAzMDAgLUggMTI3LjAuMC4xCm5ldHBlcmYgLXQgVENQX1NFTkRGSUxFIC1jIC1DIC1s
IDMwMCAtSCAxMjcuMC4wLjEKbmV0cGVyZiAtdCBUQ1BfU0VOREZJTEUgLWMgLUMgLWwgMzAwIC1I
IDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9TRU5ERklMRSAtYyAtQyAtbCAzMDAgLUggMTI3LjAu
MC4xCm5ldHBlcmYgLXQgVENQX1NFTkRGSUxFIC1jIC1DIC1sIDMwMCAtSCAxMjcuMC4wLjEKbmV0
cGVyZiAtdCBUQ1BfU0VOREZJTEUgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10
IFRDUF9TRU5ERklMRSAtYyAtQyAtbCAzMDAgLUggMTI3LjAuMC4xCm5ldHBlcmYgLXQgVENQX1NF
TkRGSUxFIC1jIC1DIC1sIDMwMCAtSCAxMjcuMC4wLjEKbmV0cGVyZiAtdCBUQ1BfU0VOREZJTEUg
LWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9TRU5ERklMRSAtYyAtQyAt
bCAzMDAgLUggMTI3LjAuMC4xCm5ldHBlcmYgLXQgVENQX1NFTkRGSUxFIC1jIC1DIC1sIDMwMCAt
SCAxMjcuMC4wLjEKbmV0cGVyZiAtdCBUQ1BfU0VOREZJTEUgLWMgLUMgLWwgMzAwIC1IIDEyNy4w
LjAuMQpuZXRwZXJmIC10IFRDUF9TRU5ERklMRSAtYyAtQyAtbCAzMDAgLUggMTI3LjAuMC4xCm5l
dHBlcmYgLXQgVENQX1NFTkRGSUxFIC1jIC1DIC1sIDMwMCAtSCAxMjcuMC4wLjEK

--===============2305406313214129767==--

