Content-Type: multipart/mixed; boundary="===============3536755864032960739=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [pipe] 759c01142a: -51.5% hackbench.throughput
Date: Fri, 05 Feb 2016 16:43:54 +0800
Message-ID: <87d1sb8s39.fsf@yhuang-dev.intel.com>
In-Reply-To: <87h9hxm5rf.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3536755864032960739==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <ying.huang@linux.intel.com> writes:

> FYI, we noticed the below changes on
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 759c01142a5d0f364a462346168a56de28a80f52 ("pipe: limit the per-use=
r amount of pages allocated in pipes")
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/ipc/kconfig/mode/nr_threads/rootfs/tbox_group/t=
estcase:
>   gcc-4.9/performance/pipe/x86_64-rhel/threads/1600%/debian-x86_64-2015-0=
2-07.cgz/lkp-wsx02/hackbench
>
> commit: =

>   558041d8d21b48287224dd0e32cf19563c77607c
>   759c01142a5d0f364a462346168a56de28a80f52
>
> 558041d8d21b4828 759c01142a5d0f364a46234616 =

> ---------------- -------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     219967 .  4%     -51.5%     106583 .  1%  hackbench.throughput
>  5.319e+08 . 11%     -19.7%  4.273e+08 .  0%  hackbench.time.involuntary_=
context_switches
>    2422668 .  9%     -36.4%    1540731 .  2%  hackbench.time.minor_page_f=
aults
>       7127 . 11%      +9.4%       7800 .  0%  hackbench.time.percent_of_c=
pu_this_job_got
>      42924 .  9%     +11.9%      48049 .  1%  hackbench.time.system_time
>       1665 . 11%     -49.3%     844.05 .  1%  hackbench.time.user_time
>     534.25 . 55%    +298.5%       2129 . 67%  numa-meminfo.node3.AnonHuge=
Pages
>       8581 . 57%     -48.4%       4427 .  1%  uptime.idle
>    5705345 . 13%     +58.8%    9061490 .  5%  softirqs.RCU
>     279868 .  8%     +20.4%     336916 .  1%  softirqs.SCHED
>      26.75 . 23%    +245.8%      92.50 . 39%  vmstat.procs.b
>       9809 . 13%     -64.7%       3463 .  7%  vmstat.procs.r
>     284320 . 13%     -45.9%     153686 .  1%  vmstat.system.in
>     114.00 . 10%     -50.9%      56.00 .  0%  time.file_system_outputs
>  5.319e+08 . 11%     -19.7%  4.273e+08 .  0%  time.involuntary_context_sw=
itches
>    2422668 .  9%     -36.4%    1540731 .  2%  time.minor_page_faults
>       1665 . 11%     -49.3%     844.05 .  1%  time.user_time
>      89.86 . 10%      +8.9%      97.84 .  0%  turbostat.%Busy
>       2270 . 10%      +8.9%       2471 .  0%  turbostat.Avg_MHz
>       1.45 .  8%     -52.6%       0.69 .  9%  turbostat.CPU%c1
>       0.17 . 13%     -52.2%       0.08 . 34%  turbostat.CPU%c3
>       8.53 .116%     -83.7%       1.39 .  3%  turbostat.CPU%c6
>   63583716 . 16%     -98.1%    1183913 . 53%  numa-numastat.node0.local_n=
ode
>   63587769 . 16%     -98.1%    1189061 . 53%  numa-numastat.node0.numa_hit
>   69989955 .  6%     -96.8%    2239323 .  8%  numa-numastat.node1.local_n=
ode
>   69995282 .  6%     -96.8%    2244474 .  8%  numa-numastat.node1.numa_hit
>   56620071 . 22%     -97.3%    1520012 . 32%  numa-numastat.node2.local_n=
ode
>   56625301 . 22%     -97.3%    1522594 . 31%  numa-numastat.node2.numa_hit
>   63753303 . 22%     -96.1%    2508634 . 14%  numa-numastat.node3.local_n=
ode
>   63754612 . 22%     -96.1%    2511213 . 14%  numa-numastat.node3.numa_hit
>   32233121 . 15%     -97.4%     830659 . 60%  numa-vmstat.node0.numa_hit
>   32193958 . 15%     -97.5%     790185 . 63%  numa-vmstat.node0.numa_local
>   35020615 . 10%     -96.4%    1253289 .  8%  numa-vmstat.node1.numa_hit
>   34968563 . 10%     -96.6%    1201078 .  9%  numa-vmstat.node1.numa_local
>   30394713 . 14%     -97.2%     843134 . 31%  numa-vmstat.node2.numa_hit
>   30373607 . 14%     -97.3%     824676 . 31%  numa-vmstat.node2.numa_local
>   32334081 . 21%     -95.5%    1469250 . 16%  numa-vmstat.node3.numa_hit
>   32286373 . 21%     -95.6%    1420300 . 16%  numa-vmstat.node3.numa_local
>  1.868e+08 . 11%     -51.0%   91569694 . 13%  cpuidle.C1-NHM.time
>    1743049 . 10%     -34.6%    1139878 . 11%  cpuidle.C1-NHM.usage
>  1.918e+08 . 12%     -49.7%   96433830 . 11%  cpuidle.C1E-NHM.time
>    1243978 . 16%     -40.7%     738168 . 12%  cpuidle.C1E-NHM.usage
>   70404853 .  8%     -47.4%   37040591 . 19%  cpuidle.C3-NHM.time
>  4.723e+09 .108%     -81.6%  8.672e+08 .  3%  cpuidle.C6-NHM.time
>     311666 . 18%     -47.9%     162252 . 15%  cpuidle.C6-NHM.usage
>  2.456e+08 . 18%     -53.2%   1.15e+08 .  9%  cpuidle.POLL.time
>     260576 . 21%     -58.6%     107765 . 17%  cpuidle.POLL.usage
>     906770 .  8%     -19.4%     730530 .  5%  proc-vmstat.numa_hint_faults
>   2.54e+08 . 11%     -97.1%    7464740 .  4%  proc-vmstat.numa_hit
>  2.539e+08 . 11%     -97.1%    7449281 .  4%  proc-vmstat.numa_local
>     662291 . 10%     -33.4%     441016 .  5%  proc-vmstat.numa_pages_migr=
ated
>    1203460 .  6%     -16.7%    1002984 .  5%  proc-vmstat.numa_pte_updates
>    5716982 . 17%     -97.2%     158482 . 40%  proc-vmstat.pgalloc_dma32
>  2.521e+08 . 11%     -96.3%    9338972 .  3%  proc-vmstat.pgalloc_normal
>    3627983 .  4%     -26.1%    2682860 .  1%  proc-vmstat.pgfault
>  2.576e+08 . 11%     -96.4%    9352801 .  3%  proc-vmstat.pgfree
>     662291 . 10%     -33.4%     441016 .  5%  proc-vmstat.pgmigrate_succe=
ss
>      27845 . 11%     -79.8%       5624 .  1%  slabinfo.kmalloc-1024.activ=
e_objs
>     879.00 . 11%     -79.2%     183.00 .  1%  slabinfo.kmalloc-1024.activ=
e_slabs
>      28142 . 11%     -79.1%       5879 .  0%  slabinfo.kmalloc-1024.num_o=
bjs
>     879.00 . 11%     -79.2%     183.00 .  1%  slabinfo.kmalloc-1024.num_s=
labs
>      20288 .  0%    +129.9%      46639 .  0%  slabinfo.kmalloc-64.active_=
objs
>     317.00 .  0%    +131.4%     733.50 .  0%  slabinfo.kmalloc-64.active_=
slabs
>      20288 .  0%    +131.6%      46980 .  0%  slabinfo.kmalloc-64.num_objs
>     317.00 .  0%    +131.4%     733.50 .  0%  slabinfo.kmalloc-64.num_sla=
bs
>     335.50 .  9%     -44.8%     185.25 .  4%  slabinfo.taskstats.active_o=
bjs
>     335.50 .  9%     -44.8%     185.25 .  4%  slabinfo.taskstats.num_objs
>      38.97 . 29%     +51.7%      59.11 .  7%  perf-profile.cycles-pp.__ac=
count_scheduler_latency.enqueue_entity.enqueue_task_fair.activate_task.ttwu=
_do_activate
>      39.95 . 28%     +53.0%      61.10 .  7%  perf-profile.cycles-pp.ttwu=
_do_activate.constprop.86.try_to_wake_up.default_wake_function.autoremove_w=
ake_function.__wake_up_common

>From above perf profile output,

Most time is spent for __account_scheduler_latency, which is part of
latency-stats (latencytop) utility to collect system latency statistics.
It uses a global spinlock (latency_lock) to protect its data structure,
the latency_lock becomes the bottleneck of the test.  The increased
context switches after the commit increases the contention of
latency_lock, so cause the regression.  After disable latency-stats, the
performance improved instead of regressed.  The compare result is as
follow:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/debug-setup/ipc/kconfig/mode/nr_threads/rootfs/tb=
ox_group/testcase:
  gcc-4.9/performance/no-latency_stats/pipe/x86_64-rhel/threads/1600%/debia=
n-x86_64-2015-02-07.cgz/lkp-wsx02/hackbench

commit: =

  558041d8d21b48287224dd0e32cf19563c77607c
  759c01142a5d0f364a462346168a56de28a80f52

558041d8d21b4828 759c01142a5d0f364a46234616 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

          1:6          -17%            :4     last_state.is_incomplete_run
         %stddev     %change         %stddev
             \          |                \  =

    251067 =C2=B1  4%     +53.2%     384708 =C2=B1  0%  hackbench.throughput
 1.468e+09 =C2=B1  6%     -51.6%  7.099e+08 =C2=B1 40%  hackbench.time.invo=
luntary_context_switches
      7299 =C2=B1  4%     -49.0%       3725 =C2=B1 57%  hackbench.time.perc=
ent_of_cpu_this_job_got
     42840 =C2=B1  3%     -33.3%      28582 =C2=B1 38%  hackbench.time.syst=
em_time

I think the performance improvement comes from the decreased the cache
miss rate, because of the decreased working set, which comes from the
decreased pipe size, as follow,

7.478e+09 =C2=B1  4%     -54.8%   3.38e+09 =C2=B1 36%  perf-stat.LLC-load-m=
isses
 2.087e+11 =C2=B1  3%      -3.6%  2.012e+11 =C2=B1 37%  perf-stat.LLC-loads
 1.605e+10 =C2=B1  3%     -76.5%  3.771e+09 =C2=B1 37%  perf-stat.LLC-store=
-misses
 6.751e+10 =C2=B1  2%     -11.7%  5.963e+10 =C2=B1 36%  perf-stat.LLC-stores
 =

The store miss rate decreased from about 23.77% to 6.32%.

Best Regards,
Huang, Ying

>       3.89 . 60%    +334.7%      16.93 . 13%  perf-profile.cycles-pp.__vf=
s_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
>       0.70 . 30%   +1969.3%      14.49 . 11%  perf-profile.cycles-pp.__wa=
ke_up_common.__wake_up_sync_key.pipe_read.__vfs_read.vfs_read
>       0.71 . 30%   +1971.0%      14.65 . 11%  perf-profile.cycles-pp.__wa=
ke_up_sync_key.pipe_read.__vfs_read.vfs_read.sys_read
>       0.69 . 84%     -92.3%       0.05 . 63%  perf-profile.cycles-pp._raw=
_spin_lock.__schedule.schedule.exit_to_usermode_loop.syscall_return_slowpath
>      34.58 . 33%     +57.1%      54.33 .  7%  perf-profile.cycles-pp._raw=
_spin_lock_irqsave.__account_scheduler_latency.enqueue_entity.enqueue_task_=
fair.activate_task
>      39.61 . 28%     +53.7%      60.89 .  7%  perf-profile.cycles-pp.acti=
vate_task.ttwu_do_activate.try_to_wake_up.default_wake_function.autoremove_=
wake_function
>       0.70 . 30%   +1967.9%      14.47 . 11%  perf-profile.cycles-pp.auto=
remove_wake_function.__wake_up_common.__wake_up_sync_key.pipe_read.__vfs_re=
ad
>       0.70 . 30%   +1965.0%      14.46 . 11%  perf-profile.cycles-pp.defa=
ult_wake_function.autoremove_wake_function.__wake_up_common.__wake_up_sync_=
key.pipe_read
>      38.99 . 28%     +54.5%      60.25 .  7%  perf-profile.cycles-pp.enqu=
eue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up
>      39.45 . 28%     +53.9%      60.72 .  7%  perf-profile.cycles-pp.enqu=
eue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.default_wake_fu=
nction
>      57.97 . 20%     +40.4%      81.35 .  8%  perf-profile.cycles-pp.entr=
y_SYSCALL_64_fastpath
>       1.31 . 60%     -92.0%       0.10 . 67%  perf-profile.cycles-pp.nati=
ve_queued_spin_lock_slowpath._raw_spin_lock.__schedule.schedule.exit_to_use=
rmode_loop
>       2.54 . 68%     -81.8%       0.46 . 60%  perf-profile.cycles-pp.nati=
ve_queued_spin_lock_slowpath._raw_spin_lock.try_to_wake_up.default_wake_fun=
ction.autoremove_wake_function
>      34.38 . 33%     +55.7%      53.54 .  6%  perf-profile.cycles-pp.nati=
ve_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__account_scheduler_lat=
ency.enqueue_entity.enqueue_task_fair
>       3.67 . 65%    +354.5%      16.69 . 11%  perf-profile.cycles-pp.pipe=
_read.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
>       5.22 . 42%    +250.6%      18.30 . 21%  perf-profile.cycles-pp.sys_=
read.entry_SYSCALL_64_fastpath
>      39.95 . 28%     +53.0%      61.10 .  7%  perf-profile.cycles-pp.ttwu=
_do_activate.constprop.86.try_to_wake_up.default_wake_function.autoremove_w=
ake_function.__wake_up_common
>       4.70 . 48%    +282.5%      17.96 . 19%  perf-profile.cycles-pp.vfs_=
read.sys_read.entry_SYSCALL_64_fastpath
>   16323355 . 13%    -100.0%       0.00 . -1%  latency_stats.avg.nfs_wait_=
on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__generic_fil=
e_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs_write.S=
yS_write.entry_SYSCALL_64_fastpath
>    1702613 . 26%    +288.1%    6607185 . 61%  latency_stats.avg.pipe_read=
.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
>      31.67 . 74%  +63999.7%      20298 .149%  latency_stats.avg.stop_two_=
cpus.migrate_swap.task_numa_migrate.numa_migrate_preferred.task_numa_fault.=
handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>    3607008 .163%    -100.0%     384.25 . 14%  latency_stats.avg.wait_on_p=
age_bit.__filemap_fdatawait_range.filemap_fdatawait_range.filemap_write_and=
_wait_range.nfs4_file_fsync.[nfsv4].vfs_fsync_range.vfs_fsync.nfs4_file_flu=
sh.[nfsv4].filp_close.do_dup2.SyS_dup2.entry_SYSCALL_64_fastpath
>    1042512 . 15%    +145.7%    2561649 . 35%  latency_stats.avg.wait_on_p=
age_bit.__migration_entry_wait.migration_entry_wait.handle_mm_fault.__do_pa=
ge_fault.do_page_fault.page_fault
>     384229 .  2%     -76.9%      88748 . 24%  latency_stats.hits.call_rws=
em_down_read_failed.do_exit.SyS_exit.entry_SYSCALL_64_fastpath

[snip]

--===============3536755864032960739==--

