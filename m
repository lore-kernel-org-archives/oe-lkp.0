Content-Type: multipart/mixed; boundary="===============4686041787132756065=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Wed, 10 Aug 2016 17:11:16 -0700
Message-ID: <87a8gk17x7.fsf@yhuang-mobile.sh.intel.com>
In-Reply-To: <87eg5w18iu.fsf@yhuang-mobile.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4686041787132756065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"Huang, Ying" <ying.huang@intel.com> writes:

> Hi, Linus,
>
> Linus Torvalds <torvalds@linux-foundation.org> writes:
>
>> On Wed, Aug 10, 2016 at 4:08 PM, Dave Chinner <david@fromorbit.com> wr=
ote:
>>>
>>> That, to me, says there's a change in lock contention behaviour in
>>> the workload (which we know aim7 is good at exposing). i.e. the
>>> iomap change shifted contention from a sleeping lock to a spinning
>>> lock, or maybe we now trigger optimistic spinning behaviour on a
>>> lock we previously didn't spin on at all.
>>
>> Hmm. Possibly. I reacted to the lower cpu load number, but yeah, I
>> could easily imagine some locking primitive difference too.
>>
>>> We really need instruction level perf profiles to understand
>>> this - I don't have a machine with this many cpu cores available
>>> locally, so I'm not sure I'm going to be able to make any progress
>>> tracking it down in the short term. Maybe the lkp team has more
>>> in-depth cpu usage profiles they can share?
>>
>> Yeah, I've occasionally wanted to see some kind of "top-25 kernel
>> functions in the profile" thing. That said, when the load isn't all
>> that familiar, the profiles usually are not all that easy to make
>> sense of either. But comparing the before and after state might give
>> us clues.
>
> I have started perf-profile data collection, will send out the
> comparison result soon.

Here is the comparison result with perf-profile data.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/debug-setup/disk/fs/kconfig/load/rootfs/tbox_grou=
p/test/testcase:
  gcc-6/performance/profile/1BRD_48G/xfs/x86_64-rhel/3000/debian-x86_64-201=
5-02-07.cgz/ivb44/disk_wrt/aim7

commit: =

  f0c6bcba74ac51cb77aadb33ad35cb2dc1ad1506
  68a9f5e7007c1afa2cf6830b690a90d0187c0684

f0c6bcba74ac51cb 68a9f5e7007c1afa2cf6830b69 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    484435 =C2=B1  0%     -13.3%     420004 =C2=B1  0%  aim7.jobs-per-min
     37.37 =C2=B1  0%     +15.3%      43.09 =C2=B1  0%  aim7.time.elapsed_t=
ime
     37.37 =C2=B1  0%     +15.3%      43.09 =C2=B1  0%  aim7.time.elapsed_t=
ime.max
      6491 =C2=B1  3%     +30.8%       8491 =C2=B1  0%  aim7.time.involunta=
ry_context_switches
    376.89 =C2=B1  0%     +28.4%     484.11 =C2=B1  0%  aim7.time.system_ti=
me
    430512 =C2=B1  0%     -20.1%     343838 =C2=B1  0%  aim7.time.voluntary=
_context_switches
     26816 =C2=B1  8%     +10.2%      29542 =C2=B1  1%  interrupts.CAL:Func=
tion_call_interrupts
    125122 =C2=B1 10%     -10.7%     111758 =C2=B1 12%  softirqs.SCHED
     24772 =C2=B1  0%     -28.6%      17675 =C2=B1  0%  vmstat.system.cs
     53477 =C2=B1  2%      +5.6%      56453 =C2=B1  0%  vmstat.system.in
     15627 =C2=B1  0%     +27.7%      19956 =C2=B1  1%  meminfo.Active(file)
     16103 =C2=B1  3%     +14.3%      18405 =C2=B1  8%  meminfo.AnonHugePag=
es
    132898 =C2=B1  9%     +15.4%     153380 =C2=B1  1%  meminfo.DirectMap4k
     13777 =C2=B1  5%     +43.1%      19709 =C2=B1  0%  meminfo.Shmem
      3906 =C2=B1  0%     +28.8%       5032 =C2=B1  2%  proc-vmstat.nr_acti=
ve_file
    919.33 =C2=B1  5%     +14.8%       1055 =C2=B1  8%  proc-vmstat.nr_dirty
      3444 =C2=B1  5%     +41.8%       4884 =C2=B1  0%  proc-vmstat.nr_shmem
      4092 =C2=B1 14%     +61.2%       6595 =C2=B1  1%  proc-vmstat.pgactiv=
ate
      1975 =C2=B1 15%     +63.2%       3224 =C2=B1 17%  slabinfo.scsi_data_=
buffer.active_objs
      1975 =C2=B1 15%     +63.2%       3224 =C2=B1 17%  slabinfo.scsi_data_=
buffer.num_objs
    464.33 =C2=B1 15%     +63.3%     758.33 =C2=B1 17%  slabinfo.xfs_efd_it=
em.active_objs
    464.33 =C2=B1 15%     +63.3%     758.33 =C2=B1 17%  slabinfo.xfs_efd_it=
em.num_objs
   1724300 =C2=B1 27%     -40.5%    1025538 =C2=B1  1%  sched_debug.cfs_rq:=
/.load.max
     96.36 =C2=B1  3%     +18.6%     114.32 =C2=B1 15%  sched_debug.cfs_rq:=
/.util_avg.stddev
   1724300 =C2=B1 27%     -40.5%    1025538 =C2=B1  1%  sched_debug.cpu.loa=
d.max
      2887 =C2=B1 30%     -28.2%       2073 =C2=B1 48%  sched_debug.cpu.nr_=
load_updates.min
      7.66 =C2=B1 20%     -24.9%       5.75 =C2=B1 15%  sched_debug.cpu.nr_=
uninterruptible.stddev
     37.37 =C2=B1  0%     +15.3%      43.09 =C2=B1  0%  time.elapsed_time
     37.37 =C2=B1  0%     +15.3%      43.09 =C2=B1  0%  time.elapsed_time.m=
ax
      6491 =C2=B1  3%     +30.8%       8491 =C2=B1  0%  time.involuntary_co=
ntext_switches
      1037 =C2=B1  0%     +10.8%       1148 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
    376.89 =C2=B1  0%     +28.4%     484.11 =C2=B1  0%  time.system_time
    430512 =C2=B1  0%     -20.1%     343838 =C2=B1  0%  time.voluntary_cont=
ext_switches
     24.18 =C2=B1  0%      +9.0%      26.35 =C2=B1  0%  turbostat.%Busy
    686.00 =C2=B1  0%      +9.5%     751.00 =C2=B1  0%  turbostat.Avg_MHz
      0.28 =C2=B1  0%     -25.0%       0.21 =C2=B1  0%  turbostat.CPU%c3
     93.33 =C2=B1  1%      +3.0%      96.15 =C2=B1  0%  turbostat.CorWatt
    124.61 =C2=B1  0%      +2.1%     127.17 =C2=B1  0%  turbostat.PkgWatt
      4.74 =C2=B1  0%      -2.7%       4.61 =C2=B1  1%  turbostat.RAMWatt
      7723 =C2=B1  0%     +32.6%      10238 =C2=B1  5%  numa-meminfo.node0.=
Active(file)
      1589 =C2=B1 17%     +45.5%       2313 =C2=B1 24%  numa-meminfo.node0.=
Dirty
     56052 =C2=B1  3%     +58.2%      88666 =C2=B1 17%  numa-meminfo.node1.=
Active
     48142 =C2=B1  4%     +64.0%      78943 =C2=B1 19%  numa-meminfo.node1.=
Active(anon)
      7908 =C2=B1  1%     +22.9%       9722 =C2=B1  3%  numa-meminfo.node1.=
Active(file)
     46721 =C2=B1  3%     +55.9%      72837 =C2=B1 24%  numa-meminfo.node1.=
AnonPages
      4789 =C2=B1 69%    +102.3%       9687 =C2=B1  9%  numa-meminfo.node1.=
Shmem
  52991525 =C2=B1  1%     -19.4%   42687208 =C2=B1  0%  cpuidle.C1-IVT.time
    319584 =C2=B1  1%     -26.5%     234868 =C2=B1  1%  cpuidle.C1-IVT.usage
   3468808 =C2=B1  2%     -19.8%    2783341 =C2=B1  3%  cpuidle.C1E-IVT.time
     46760 =C2=B1  0%     -22.4%      36298 =C2=B1  0%  cpuidle.C1E-IVT.usa=
ge
  12590471 =C2=B1  0%     -22.3%    9788585 =C2=B1  1%  cpuidle.C3-IVT.time
     79965 =C2=B1  0%     -19.0%      64749 =C2=B1  0%  cpuidle.C3-IVT.usage
   1.3e+09 =C2=B1  0%     +13.3%  1.473e+09 =C2=B1  0%  cpuidle.C6-IVT.time
    352.33 =C2=B1  8%     -24.7%     265.33 =C2=B1  1%  cpuidle.POLL.usage
      1930 =C2=B1  0%     +33.9%       2585 =C2=B1  3%  numa-vmstat.node0.n=
r_active_file
      4468 =C2=B1  7%      -8.5%       4089 =C2=B1  5%  numa-vmstat.node0.n=
r_alloc_batch
    466.67 =C2=B1  4%     +29.3%     603.33 =C2=B1 14%  numa-vmstat.node0.n=
r_dirty
     12026 =C2=B1  4%     +64.1%      19734 =C2=B1 20%  numa-vmstat.node1.n=
r_active_anon
      1977 =C2=B1  1%     +23.6%       2444 =C2=B1  1%  numa-vmstat.node1.n=
r_active_file
      3809 =C2=B1  6%     +16.1%       4422 =C2=B1  4%  numa-vmstat.node1.n=
r_alloc_batch
     11671 =C2=B1  3%     +55.9%      18197 =C2=B1 24%  numa-vmstat.node1.n=
r_anon_pages
      1197 =C2=B1 69%    +102.3%       2422 =C2=B1  9%  numa-vmstat.node1.n=
r_shmem
    456.33 =C2=B1 57%     -75.6%     111.33 =C2=B1 86%  numa-vmstat.node1.n=
r_written
 2.658e+11 =C2=B1  4%     +24.7%  3.316e+11 =C2=B1  2%  perf-stat.branch-in=
structions
      0.41 =C2=B1  1%      -9.1%       0.37 =C2=B1  1%  perf-stat.branch-mi=
ss-rate
  1.09e+09 =C2=B1  3%     +13.4%  1.237e+09 =C2=B1  1%  perf-stat.branch-mi=
sses
    981138 =C2=B1  0%     -18.1%     803696 =C2=B1  0%  perf-stat.context-s=
witches
 1.511e+12 =C2=B1  5%     +23.4%  1.864e+12 =C2=B1  3%  perf-stat.cpu-cycles
    102600 =C2=B1  1%      -7.3%      95075 =C2=B1  1%  perf-stat.cpu-migra=
tions
      0.26 =C2=B1 12%     -30.8%       0.18 =C2=B1 10%  perf-stat.dTLB-load=
-miss-rate
 3.164e+11 =C2=B1  1%     +39.9%  4.426e+11 =C2=B1  4%  perf-stat.dTLB-loads
      0.03 =C2=B1 26%     -41.3%       0.02 =C2=B1 13%  perf-stat.dTLB-stor=
e-miss-rate
 2.247e+11 =C2=B1  6%     +26.4%  2.839e+11 =C2=B1  2%  perf-stat.dTLB-stor=
es
  1.49e+12 =C2=B1  4%     +30.1%  1.939e+12 =C2=B1  2%  perf-stat.instructi=
ons
     43348 =C2=B1  2%     +34.2%      58161 =C2=B1 12%  perf-stat.instructi=
ons-per-iTLB-miss
      0.99 =C2=B1  0%      +5.5%       1.04 =C2=B1  0%  perf-stat.ipc
    262799 =C2=B1  0%      +4.4%     274251 =C2=B1  1%  perf-stat.minor-fau=
lts
     34.12 =C2=B1  1%      +2.1%      34.83 =C2=B1  0%  perf-stat.node-load=
-miss-rate
  46476754 =C2=B1  2%      +4.6%   48601269 =C2=B1  1%  perf-stat.node-load=
-misses
      9.96 =C2=B1  0%     +13.4%      11.30 =C2=B1  0%  perf-stat.node-stor=
e-miss-rate
  24460859 =C2=B1  1%     +14.4%   27971097 =C2=B1  1%  perf-stat.node-stor=
e-misses
    262780 =C2=B1  0%      +4.4%     274227 =C2=B1  1%  perf-stat.page-faul=
ts
     11.31 =C2=B1  1%     -18.1%       9.27 =C2=B1  0%  perf-profile.cycles=
-pp.____fput.task_work_run.exit_to_usermode_loop.syscall_return_slowpath.en=
try_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%       1.68 =C2=B1  1%  perf-profile.cycles=
-pp.__add_to_page_cache_locked.add_to_page_cache_lru.pagecache_get_page.gra=
b_cache_page_write_begin.iomap_write_begin
      1.80 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.__add_to_page_cache_locked.add_to_page_cache_lru.pagecache_get_page.gra=
b_cache_page_write_begin.xfs_vm_write_begin
      2.55 =C2=B1  3%     -14.2%       2.19 =C2=B1  2%  perf-profile.cycles=
-pp.__alloc_pages_nodemask.alloc_pages_current.__page_cache_alloc.pagecache=
_get_page.grab_cache_page_write_begin
      0.00 =C2=B1 -1%      +Inf%       4.45 =C2=B1  1%  perf-profile.cycles=
-pp.__block_commit_write.isra.24.block_write_end.generic_write_end.iomap_wr=
ite_actor.iomap_apply
      5.93 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.__block_commit_write.isra.24.block_write_end.generic_write_end.xfs_vm_w=
rite_end.generic_perform_write
     13.71 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.__block_write_begin.xfs_vm_write_begin.generic_perform_write.xfs_file_b=
uffered_aio_write.xfs_file_write_iter
     10.36 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.__block_write_begin_int.__block_write_begin.xfs_vm_write_begin.generic_=
perform_write.xfs_file_buffered_aio_write
      0.00 =C2=B1 -1%      +Inf%       3.64 =C2=B1  0%  perf-profile.cycles=
-pp.__block_write_begin_int.iomap_write_begin.iomap_write_actor.iomap_apply=
.iomap_file_buffered_write
      1.04 =C2=B1  2%     -18.9%       0.84 =C2=B1  1%  perf-profile.cycles=
-pp.__delete_from_page_cache.delete_from_page_cache.truncate_inode_page.tru=
ncate_inode_pages_range.truncate_inode_pages_final
     11.24 =C2=B1  2%     -18.1%       9.21 =C2=B1  0%  perf-profile.cycles=
-pp.__dentry_kill.dput.__fput.____fput.task_work_run
     11.31 =C2=B1  2%     -18.1%       9.26 =C2=B1  0%  perf-profile.cycles=
-pp.__fput.____fput.task_work_run.exit_to_usermode_loop.syscall_return_slow=
path
      0.00 =C2=B1 -1%      +Inf%       1.09 =C2=B1  2%  perf-profile.cycles=
-pp.__mark_inode_dirty.generic_write_end.iomap_write_actor.iomap_apply.ioma=
p_file_buffered_write
      1.32 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.__mark_inode_dirty.generic_write_end.xfs_vm_write_end.generic_perform_w=
rite.xfs_file_buffered_aio_write
      0.00 =C2=B1 -1%      +Inf%       2.68 =C2=B1  2%  perf-profile.cycles=
-pp.__page_cache_alloc.pagecache_get_page.grab_cache_page_write_begin.iomap=
_write_begin.iomap_write_actor
      3.04 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.__page_cache_alloc.pagecache_get_page.grab_cache_page_write_begin.xfs_v=
m_write_begin.generic_perform_write
      1.00 =C2=B1  1%     -18.0%       0.82 =C2=B1  1%  perf-profile.cycles=
-pp.__radix_tree_lookup.radix_tree_lookup_slot.find_get_entry.pagecache_get=
_page.grab_cache_page_write_begin
      1.12 =C2=B1  2%     -17.6%       0.92 =C2=B1  4%  perf-profile.cycles=
-pp.__sb_start_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      1.38 =C2=B1  2%     -13.3%       1.19 =C2=B1  1%  perf-profile.cycles=
-pp.__set_page_dirty.mark_buffer_dirty.__block_commit_write.isra.24.block_w=
rite_end.generic_write_end
     54.10 =C2=B1  1%     +13.1%      61.20 =C2=B1  0%  perf-profile.cycles=
-pp.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      6.34 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.__xfs_get_blocks.xfs_get_blocks.__block_write_begin_int.__block_write_b=
egin.xfs_vm_write_begin
      0.00 =C2=B1 -1%      +Inf%       3.69 =C2=B1  1%  perf-profile.cycles=
-pp.add_to_page_cache_lru.pagecache_get_page.grab_cache_page_write_begin.io=
map_write_begin.iomap_write_actor
      4.02 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.add_to_page_cache_lru.pagecache_get_page.grab_cache_page_write_begin.xf=
s_vm_write_begin.generic_perform_write
      0.98 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.alloc_page_buffers.create_empty_buffers.create_page_buffers.__block_wri=
te_begin_int.__block_write_begin
      0.00 =C2=B1 -1%      +Inf%       2.56 =C2=B1  2%  perf-profile.cycles=
-pp.alloc_pages_current.__page_cache_alloc.pagecache_get_page.grab_cache_pa=
ge_write_begin.iomap_write_begin
      2.91 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.alloc_pages_current.__page_cache_alloc.pagecache_get_page.grab_cache_pa=
ge_write_begin.xfs_vm_write_begin
      3.42 =C2=B1  0%     -20.9%       2.71 =C2=B1  2%  perf-profile.cycles=
-pp.block_invalidatepage.xfs_vm_invalidatepage.truncate_inode_page.truncate=
_inode_pages_range.truncate_inode_pages_final
      0.00 =C2=B1 -1%      +Inf%       4.69 =C2=B1  0%  perf-profile.cycles=
-pp.block_write_end.generic_write_end.iomap_write_actor.iomap_apply.iomap_f=
ile_buffered_write
      6.24 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.block_write_end.generic_write_end.xfs_vm_write_end.generic_perform_writ=
e.xfs_file_buffered_aio_write
     19.18 =C2=B1  5%      -9.3%      17.40 =C2=B1  0%  perf-profile.cycles=
-pp.call_cpuidle.cpu_startup_entry.start_secondary
      0.94 =C2=B1  4%     -19.8%       0.76 =C2=B1  0%  perf-profile.cycles=
-pp.cancel_dirty_page.try_to_free_buffers.xfs_vm_releasepage.try_to_release=
_page.block_invalidatepage
      3.95 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.copy_user_enhanced_fast_string.generic_perform_write.xfs_file_buffered_=
aio_write.xfs_file_write_iter.__vfs_write
      0.00 =C2=B1 -1%      +Inf%       3.22 =C2=B1  0%  perf-profile.cycles=
-pp.copy_user_enhanced_fast_string.iomap_write_actor.iomap_apply.iomap_file=
_buffered_write.xfs_file_buffered_aio_write
     19.75 =C2=B1  5%      -9.8%      17.81 =C2=B1  0%  perf-profile.cycles=
-pp.cpu_startup_entry.start_secondary
     19.18 =C2=B1  5%      -9.3%      17.40 =C2=B1  0%  perf-profile.cycles=
-pp.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
     18.45 =C2=B1  5%      -9.2%      16.75 =C2=B1  0%  perf-profile.cycles=
-pp.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_=
secondary
      1.44 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.create_empty_buffers.create_page_buffers.__block_write_begin_int.__bloc=
k_write_begin.xfs_vm_write_begin
      0.00 =C2=B1 -1%      +Inf%       1.18 =C2=B1  1%  perf-profile.cycles=
-pp.create_empty_buffers.create_page_buffers.__block_write_begin_int.iomap_=
write_begin.iomap_write_actor
      1.86 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.create_page_buffers.__block_write_begin_int.__block_write_begin.xfs_vm_=
write_begin.generic_perform_write
      0.00 =C2=B1 -1%      +Inf%       1.53 =C2=B1  1%  perf-profile.cycles=
-pp.create_page_buffers.__block_write_begin_int.iomap_write_begin.iomap_wri=
te_actor.iomap_apply
      1.74 =C2=B1  2%     -19.9%       1.40 =C2=B1  3%  perf-profile.cycles=
-pp.delete_from_page_cache.truncate_inode_page.truncate_inode_pages_range.t=
runcate_inode_pages_final.evict
      1.27 =C2=B1  0%     -22.5%       0.99 =C2=B1  4%  perf-profile.cycles=
-pp.destroy_inode.evict.iput.__dentry_kill.dput
      2.61 =C2=B1  1%     -24.3%       1.98 =C2=B1  1%  perf-profile.cycles=
-pp.do_filp_open.do_sys_open.sys_creat.entry_SYSCALL_64_fastpath
      2.66 =C2=B1  1%     -24.3%       2.01 =C2=B1  1%  perf-profile.cycles=
-pp.do_sys_open.sys_creat.entry_SYSCALL_64_fastpath
      1.79 =C2=B1  2%     -28.2%       1.28 =C2=B1  3%  perf-profile.cycles=
-pp.do_unlinkat.sys_unlink.entry_SYSCALL_64_fastpath
      1.07 =C2=B1  3%     -23.3%       0.82 =C2=B1  3%  perf-profile.cycles=
-pp.down_write.xfs_file_buffered_aio_write.xfs_file_write_iter.__vfs_write.=
vfs_write
      1.01 =C2=B1  3%     -17.9%       0.83 =C2=B1  2%  perf-profile.cycles=
-pp.down_write.xfs_ilock.xfs_file_buffered_aio_write.xfs_file_write_iter.__=
vfs_write
     11.26 =C2=B1  2%     -18.1%       9.23 =C2=B1  0%  perf-profile.cycles=
-pp.dput.__fput.____fput.task_work_run.exit_to_usermode_loop
     11.21 =C2=B1  2%     -18.1%       9.18 =C2=B1  0%  perf-profile.cycles=
-pp.evict.iput.__dentry_kill.dput.__fput
     11.34 =C2=B1  2%     -18.1%       9.29 =C2=B1  0%  perf-profile.cycles=
-pp.exit_to_usermode_loop.syscall_return_slowpath.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%       1.55 =C2=B1  3%  perf-profile.cycles=
-pp.find_get_entry.pagecache_get_page.grab_cache_page_write_begin.iomap_wri=
te_begin.iomap_write_actor
      1.83 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.find_get_entry.pagecache_get_page.grab_cache_page_write_begin.xfs_vm_wr=
ite_begin.generic_perform_write
     43.95 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.generic_perform_write.xfs_file_buffered_aio_write.xfs_file_write_iter._=
_vfs_write.vfs_write
      0.00 =C2=B1 -1%      +Inf%       7.91 =C2=B1  1%  perf-profile.cycles=
-pp.generic_write_end.iomap_write_actor.iomap_apply.iomap_file_buffered_wri=
te.xfs_file_buffered_aio_write
     10.68 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.generic_write_end.xfs_vm_write_end.generic_perform_write.xfs_file_buffe=
red_aio_write.xfs_file_write_iter
      1.91 =C2=B1  3%     -16.4%       1.59 =C2=B1  1%  perf-profile.cycles=
-pp.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_current.__pag=
e_cache_alloc.pagecache_get_page
      0.00 =C2=B1 -1%      +Inf%       9.85 =C2=B1  0%  perf-profile.cycles=
-pp.grab_cache_page_write_begin.iomap_write_begin.iomap_write_actor.iomap_a=
pply.iomap_file_buffered_write
     10.96 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.grab_cache_page_write_begin.xfs_vm_write_begin.generic_perform_write.xf=
s_file_buffered_aio_write.xfs_file_write_iter
      0.00 =C2=B1 -1%      +Inf%      52.29 =C2=B1  0%  perf-profile.cycles=
-pp.iomap_apply.iomap_file_buffered_write.xfs_file_buffered_aio_write.xfs_f=
ile_write_iter.__vfs_write
      0.00 =C2=B1 -1%      +Inf%      52.94 =C2=B1  0%  perf-profile.cycles=
-pp.iomap_file_buffered_write.xfs_file_buffered_aio_write.xfs_file_write_it=
er.__vfs_write.vfs_write
      0.00 =C2=B1 -1%      +Inf%      34.35 =C2=B1  0%  perf-profile.cycles=
-pp.iomap_write_actor.iomap_apply.iomap_file_buffered_write.xfs_file_buffer=
ed_aio_write.xfs_file_write_iter
      0.00 =C2=B1 -1%      +Inf%      16.48 =C2=B1  0%  perf-profile.cycles=
-pp.iomap_write_begin.iomap_write_actor.iomap_apply.iomap_file_buffered_wri=
te.xfs_file_buffered_aio_write
     11.22 =C2=B1  2%     -18.1%       9.19 =C2=B1  0%  perf-profile.cycles=
-pp.iput.__dentry_kill.dput.__fput.____fput
      0.00 =C2=B1 -1%      +Inf%       1.55 =C2=B1  1%  perf-profile.cycles=
-pp.lru_cache_add.add_to_page_cache_lru.pagecache_get_page.grab_cache_page_=
write_begin.iomap_write_begin
      1.72 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.lru_cache_add.add_to_page_cache_lru.pagecache_get_page.grab_cache_page_=
write_begin.xfs_vm_write_begin
      0.00 =C2=B1 -1%      +Inf%       2.78 =C2=B1  0%  perf-profile.cycles=
-pp.mark_buffer_dirty.__block_commit_write.isra.24.block_write_end.generic_=
write_end.iomap_write_actor
      3.39 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.mark_buffer_dirty.__block_commit_write.isra.24.block_write_end.generic_=
write_end.xfs_vm_write_end
      0.00 =C2=B1 -1%      +Inf%       3.44 =C2=B1  1%  perf-profile.cycles=
-pp.mark_page_accessed.iomap_write_actor.iomap_apply.iomap_file_buffered_wr=
ite.xfs_file_buffered_aio_write
      3.03 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.memset_erms.__block_write_begin.xfs_vm_write_begin.generic_perform_writ=
e.xfs_file_buffered_aio_write
      0.00 =C2=B1 -1%      +Inf%       2.43 =C2=B1  0%  perf-profile.cycles=
-pp.memset_erms.iomap_write_begin.iomap_write_actor.iomap_apply.iomap_file_=
buffered_write
      0.00 =C2=B1 -1%      +Inf%       9.25 =C2=B1  0%  perf-profile.cycles=
-pp.pagecache_get_page.grab_cache_page_write_begin.iomap_write_begin.iomap_=
write_actor.iomap_apply
     10.37 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.pagecache_get_page.grab_cache_page_write_begin.xfs_vm_write_begin.gener=
ic_perform_write.xfs_file_buffered_aio_write
      2.58 =C2=B1  1%     -24.1%       1.96 =C2=B1  0%  perf-profile.cycles=
-pp.path_openat.do_filp_open.do_sys_open.sys_creat.entry_SYSCALL_64_fastpath
      1.17 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.radix_tree_lookup_slot.find_get_entry.pagecache_get_page.grab_cache_pag=
e_write_begin.xfs_vm_write_begin
      2.06 =C2=B1  3%     -22.5%       1.60 =C2=B1  2%  perf-profile.cycles=
-pp.rw_verify_area.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      1.79 =C2=B1  3%     -22.2%       1.39 =C2=B1  0%  perf-profile.cycles=
-pp.security_file_permission.rw_verify_area.vfs_write.sys_write.entry_SYSCA=
LL_64_fastpath
      1.32 =C2=B1  4%     -21.4%       1.04 =C2=B1  0%  perf-profile.cycles=
-pp.selinux_file_permission.security_file_permission.rw_verify_area.vfs_wri=
te.sys_write
     19.79 =C2=B1  5%      -9.9%      17.84 =C2=B1  0%  perf-profile.cycles=
-pp.start_secondary
      2.67 =C2=B1  1%     -24.2%       2.02 =C2=B1  1%  perf-profile.cycles=
-pp.sys_creat.entry_SYSCALL_64_fastpath
      1.79 =C2=B1  3%     -27.9%       1.29 =C2=B1  3%  perf-profile.cycles=
-pp.sys_unlink.entry_SYSCALL_64_fastpath
     60.98 =C2=B1  1%      +9.5%      66.76 =C2=B1  0%  perf-profile.cycles=
-pp.sys_write.entry_SYSCALL_64_fastpath
     11.34 =C2=B1  1%     -18.1%       9.29 =C2=B1  0%  perf-profile.cycles=
-pp.syscall_return_slowpath.entry_SYSCALL_64_fastpath
     11.32 =C2=B1  1%     -18.0%       9.28 =C2=B1  0%  perf-profile.cycles=
-pp.task_work_run.exit_to_usermode_loop.syscall_return_slowpath.entry_SYSCA=
LL_64_fastpath
      5.96 =C2=B1  1%     -20.0%       4.77 =C2=B1  0%  perf-profile.cycles=
-pp.truncate_inode_page.truncate_inode_pages_range.truncate_inode_pages_fin=
al.evict.iput
      9.89 =C2=B1  2%     -17.4%       8.17 =C2=B1  0%  perf-profile.cycles=
-pp.truncate_inode_pages_final.evict.iput.__dentry_kill.dput
      9.87 =C2=B1  2%     -17.5%       8.15 =C2=B1  0%  perf-profile.cycles=
-pp.truncate_inode_pages_range.truncate_inode_pages_final.evict.iput.__dent=
ry_kill
      2.07 =C2=B1  1%     -20.4%       1.65 =C2=B1  2%  perf-profile.cycles=
-pp.try_to_free_buffers.xfs_vm_releasepage.try_to_release_page.block_invali=
datepage.xfs_vm_invalidatepage
      2.40 =C2=B1  1%     -21.0%       1.89 =C2=B1  2%  perf-profile.cycles=
-pp.try_to_release_page.block_invalidatepage.xfs_vm_invalidatepage.truncate=
_inode_page.truncate_inode_pages_range
      0.00 =C2=B1 -1%      +Inf%       1.36 =C2=B1  1%  perf-profile.cycles=
-pp.unlock_page.generic_write_end.iomap_write_actor.iomap_apply.iomap_file_=
buffered_write
      1.72 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.unlock_page.generic_write_end.xfs_vm_write_end.generic_perform_write.xf=
s_file_buffered_aio_write
     59.63 =C2=B1  1%     +10.2%      65.72 =C2=B1  0%  perf-profile.cycles=
-pp.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%       1.52 =C2=B1  2%  perf-profile.cycles=
-pp.workingset_activation.mark_page_accessed.iomap_write_actor.iomap_apply.=
iomap_file_buffered_write
      0.00 =C2=B1 -1%      +Inf%       1.73 =C2=B1  1%  perf-profile.cycles=
-pp.xfs_bmap_search_extents.xfs_bmapi_delay.xfs_iomap_write_delay.xfs_file_=
iomap_begin.iomap_apply
      0.00 =C2=B1 -1%      +Inf%       1.97 =C2=B1  2%  perf-profile.cycles=
-pp.xfs_bmap_search_extents.xfs_bmapi_read.xfs_file_iomap_begin.iomap_apply=
.iomap_file_buffered_write
      0.00 =C2=B1 -1%      +Inf%       1.61 =C2=B1  2%  perf-profile.cycles=
-pp.xfs_bmap_search_extents.xfs_bmapi_read.xfs_iomap_eof_want_preallocate.c=
onstprop.8.xfs_iomap_write_delay.xfs_file_iomap_begin
      0.00 =C2=B1 -1%      +Inf%       1.24 =C2=B1  2%  perf-profile.cycles=
-pp.xfs_bmap_search_multi_extents.xfs_bmap_search_extents.xfs_bmapi_delay.x=
fs_iomap_write_delay.xfs_file_iomap_begin
      0.00 =C2=B1 -1%      +Inf%       1.46 =C2=B1  1%  perf-profile.cycles=
-pp.xfs_bmap_search_multi_extents.xfs_bmap_search_extents.xfs_bmapi_read.xf=
s_file_iomap_begin.iomap_apply
      0.00 =C2=B1 -1%      +Inf%       1.21 =C2=B1  2%  perf-profile.cycles=
-pp.xfs_bmap_search_multi_extents.xfs_bmap_search_extents.xfs_bmapi_read.xf=
s_iomap_eof_want_preallocate.constprop.8.xfs_iomap_write_delay
      1.25 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.xfs_bmapi_delay.xfs_iomap_write_delay.__xfs_get_blocks.xfs_get_blocks._=
_block_write_begin_int
      0.00 =C2=B1 -1%      +Inf%       3.06 =C2=B1  1%  perf-profile.cycles=
-pp.xfs_bmapi_delay.xfs_iomap_write_delay.xfs_file_iomap_begin.iomap_apply.=
iomap_file_buffered_write
      1.04 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.xfs_bmapi_read.__xfs_get_blocks.xfs_get_blocks.__block_write_begin_int.=
__block_write_begin
      0.00 =C2=B1 -1%      +Inf%       3.04 =C2=B1  1%  perf-profile.cycles=
-pp.xfs_bmapi_read.xfs_file_iomap_begin.iomap_apply.iomap_file_buffered_wri=
te.xfs_file_buffered_aio_write
      0.00 =C2=B1 -1%      +Inf%       3.05 =C2=B1  1%  perf-profile.cycles=
-pp.xfs_bmapi_read.xfs_iomap_eof_want_preallocate.constprop.8.xfs_iomap_wri=
te_delay.xfs_file_iomap_begin.iomap_apply
      1.32 =C2=B1  2%     -21.5%       1.04 =C2=B1  1%  perf-profile.cycles=
-pp.xfs_create.xfs_generic_create.xfs_vn_mknod.xfs_vn_create.path_openat
     51.83 =C2=B1  1%     +14.3%      59.25 =C2=B1  0%  perf-profile.cycles=
-pp.xfs_file_buffered_aio_write.xfs_file_write_iter.__vfs_write.vfs_write.s=
ys_write
      0.00 =C2=B1 -1%      +Inf%      16.05 =C2=B1  0%  perf-profile.cycles=
-pp.xfs_file_iomap_begin.iomap_apply.iomap_file_buffered_write.xfs_file_buf=
fered_aio_write.xfs_file_write_iter
     53.16 =C2=B1  1%     +13.6%      60.40 =C2=B1  0%  perf-profile.cycles=
-pp.xfs_file_write_iter.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fa=
stpath
      1.24 =C2=B1  1%     -23.1%       0.95 =C2=B1  4%  perf-profile.cycles=
-pp.xfs_fs_destroy_inode.destroy_inode.evict.iput.__dentry_kill
      1.42 =C2=B1  2%     -21.2%       1.12 =C2=B1  1%  perf-profile.cycles=
-pp.xfs_generic_create.xfs_vn_mknod.xfs_vn_create.path_openat.do_filp_open
      6.46 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.xfs_get_blocks.__block_write_begin_int.__block_write_begin.xfs_vm_write=
_begin.generic_perform_write
      1.29 =C2=B1  3%     -18.9%       1.04 =C2=B1  1%  perf-profile.cycles=
-pp.xfs_ilock.xfs_file_buffered_aio_write.xfs_file_write_iter.__vfs_write.v=
fs_write
      0.00 =C2=B1 -1%      +Inf%       1.14 =C2=B1  3%  perf-profile.cycles=
-pp.xfs_ilock.xfs_file_iomap_begin.iomap_apply.iomap_file_buffered_write.xf=
s_file_buffered_aio_write
      1.21 =C2=B1  1%     -23.4%       0.93 =C2=B1  4%  perf-profile.cycles=
-pp.xfs_inactive.xfs_fs_destroy_inode.destroy_inode.evict.iput
      1.23 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.xfs_iomap_eof_want_preallocate.constprop.6.xfs_iomap_write_delay.__xfs_=
get_blocks.xfs_get_blocks.__block_write_begin_int
      0.00 =C2=B1 -1%      +Inf%       4.14 =C2=B1  0%  perf-profile.cycles=
-pp.xfs_iomap_eof_want_preallocate.constprop.8.xfs_iomap_write_delay.xfs_fi=
le_iomap_begin.iomap_apply.iomap_file_buffered_write
      3.28 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.xfs_iomap_write_delay.__xfs_get_blocks.xfs_get_blocks.__block_write_beg=
in_int.__block_write_begin
      0.00 =C2=B1 -1%      +Inf%       9.08 =C2=B1  0%  perf-profile.cycles=
-pp.xfs_iomap_write_delay.xfs_file_iomap_begin.iomap_apply.iomap_file_buffe=
red_write.xfs_file_buffered_aio_write
      3.54 =C2=B1  0%     -20.8%       2.81 =C2=B1  1%  perf-profile.cycles=
-pp.xfs_vm_invalidatepage.truncate_inode_page.truncate_inode_pages_range.tr=
uncate_inode_pages_final.evict
      2.35 =C2=B1  1%     -21.0%       1.86 =C2=B1  1%  perf-profile.cycles=
-pp.xfs_vm_releasepage.try_to_release_page.block_invalidatepage.xfs_vm_inva=
lidatepage.truncate_inode_page
     25.10 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.xfs_vm_write_begin.generic_perform_write.xfs_file_buffered_aio_write.xf=
s_file_write_iter.__vfs_write
     11.03 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.xfs_vm_write_end.generic_perform_write.xfs_file_buffered_aio_write.xfs_=
file_write_iter.__vfs_write
      1.42 =C2=B1  2%     -20.7%       1.13 =C2=B1  1%  perf-profile.cycles=
-pp.xfs_vn_create.path_openat.do_filp_open.do_sys_open.sys_creat
      1.42 =C2=B1  2%     -20.5%       1.13 =C2=B1  1%  perf-profile.cycles=
-pp.xfs_vn_mknod.xfs_vn_create.path_openat.do_filp_open.do_sys_open
      2.27 =C2=B1  1%     -10.6%       2.03 =C2=B1  0%  perf-profile.func.c=
ycles-pp.___might_sleep
      2.49 =C2=B1  0%     -34.5%       1.63 =C2=B1  1%  perf-profile.func.c=
ycles-pp.__block_commit_write.isra.24
      1.51 =C2=B1  2%     +15.4%       1.75 =C2=B1  1%  perf-profile.func.c=
ycles-pp.__block_write_begin_int
      1.79 =C2=B1  4%     -16.8%       1.49 =C2=B1  1%  perf-profile.func.c=
ycles-pp.__mark_inode_dirty
      1.32 =C2=B1  0%     -16.4%       1.10 =C2=B1  1%  perf-profile.func.c=
ycles-pp.__radix_tree_lookup
      1.08 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  perf-profile.func.c=
ycles-pp.__xfs_get_blocks
      1.16 =C2=B1  0%     -18.1%       0.95 =C2=B1  1%  perf-profile.func.c=
ycles-pp._raw_spin_lock
      3.96 =C2=B1  2%     -18.4%       3.23 =C2=B1  0%  perf-profile.func.c=
ycles-pp.copy_user_enhanced_fast_string
      1.41 =C2=B1  3%     -20.6%       1.12 =C2=B1  3%  perf-profile.func.c=
ycles-pp.entry_SYSCALL_64_fastpath
      1.30 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  perf-profile.func.c=
ycles-pp.generic_perform_write
      1.31 =C2=B1  2%     -46.7%       0.70 =C2=B1  0%  perf-profile.func.c=
ycles-pp.generic_write_end
     18.43 =C2=B1  5%      -9.1%      16.76 =C2=B1  0%  perf-profile.func.c=
ycles-pp.intel_idle
      0.00 =C2=B1 -1%      +Inf%       1.12 =C2=B1  1%  perf-profile.func.c=
ycles-pp.iomap_write_actor
      1.50 =C2=B1  1%     -20.9%       1.19 =C2=B1  1%  perf-profile.func.c=
ycles-pp.mark_buffer_dirty
      0.00 =C2=B1 -1%      +Inf%       1.91 =C2=B1  1%  perf-profile.func.c=
ycles-pp.mark_page_accessed
      3.24 =C2=B1  0%     -19.8%       2.60 =C2=B1  0%  perf-profile.func.c=
ycles-pp.memset_erms
      1.75 =C2=B1  2%     -18.9%       1.42 =C2=B1  1%  perf-profile.func.c=
ycles-pp.unlock_page
      1.16 =C2=B1  1%     -21.6%       0.91 =C2=B1  1%  perf-profile.func.c=
ycles-pp.vfs_write
      0.37 =C2=B1  2%    +243.6%       1.26 =C2=B1  2%  perf-profile.func.c=
ycles-pp.xfs_bmap_search_extents
      0.41 =C2=B1  1%    +198.4%       1.22 =C2=B1  2%  perf-profile.func.c=
ycles-pp.xfs_bmap_search_multi_extents
      0.70 =C2=B1  5%    +219.5%       2.24 =C2=B1  0%  perf-profile.func.c=
ycles-pp.xfs_bmapi_read
      1.05 =C2=B1  2%     -15.6%       0.88 =C2=B1  3%  perf-profile.func.c=
ycles-pp.xfs_file_write_iter
      0.64 =C2=B1  1%    +182.8%       1.81 =C2=B1  4%  perf-profile.func.c=
ycles-pp.xfs_iext_bno_to_ext
      0.00 =C2=B1 -1%      +Inf%       1.10 =C2=B1  3%  perf-profile.func.c=
ycles-pp.xfs_iomap_eof_want_preallocate.constprop.8
      0.46 =C2=B1  4%    +161.6%       1.20 =C2=B1  1%  perf-profile.func.c=
ycles-pp.xfs_iomap_write_delay

Best Regards,
Huang, Ying

--===============4686041787132756065==--

