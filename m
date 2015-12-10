Content-Type: multipart/mixed; boundary="===============7161062081280901381=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [smpboot] 0aefb957de: -97.6% pigz.throughput and many others changes
Date: Thu, 10 Dec 2015 10:41:55 +0800
Message-ID: <87si3brpn0.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7161062081280901381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://internal_merge_and_test_tree revert-0aefb957de5f2a1d9467126114146b6c7=
93cf180-0aefb957de5f2a1d9467126114146b6c793cf180
commit 0aefb957de5f2a1d9467126114146b6c793cf180 ("smpboot: Add CPU hotplug =
state variables instead of reusing CPU states")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-ivb-d02/=
pwrite3/will-it-scale

commit: =

  8025943c32f5de29b3fd548e917e24424297ca73
  0aefb957de5f2a1d9467126114146b6c793cf180

8025943c32f5de29 0aefb957de5f2a1d9467126114 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   1364213 =C2=B1  1%      +9.0%    1486873 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
   1279326 =C2=B1  0%      +6.0%    1356383 =C2=B1  0%  will-it-scale.per_t=
hread_ops
      0.17 =C2=B1  0%     +41.4%       0.25 =C2=B1  0%  will-it-scale.scala=
bility
    304.07 =C2=B1  0%     -25.0%     228.07 =C2=B1  0%  will-it-scale.time.=
elapsed_time
    304.07 =C2=B1  0%     -25.0%     228.07 =C2=B1  0%  will-it-scale.time.=
elapsed_time.max
      4705 =C2=B1  4%    +892.6%      46711 =C2=B1  0%  will-it-scale.time.=
involuntary_context_switches
      8670 =C2=B1  0%     -23.2%       6660 =C2=B1  0%  will-it-scale.time.=
minor_page_faults
    124.00 =C2=B1  0%     -60.5%      49.00 =C2=B1  0%  will-it-scale.time.=
percent_of_cpu_this_job_got
    366.82 =C2=B1  0%     -71.7%     103.82 =C2=B1  0%  will-it-scale.time.=
system_time
    172606 =C2=B1 16%     -79.9%      34644 =C2=B1  0%  will-it-scale.time.=
voluntary_context_switches
    487.21 =C2=B1  6%     -87.7%      60.08 =C2=B1161%  uptime.idle
     85581 =C2=B1 18%     -53.1%      40116 =C2=B1  4%  meminfo.DirectMap4k
     17877 =C2=B1  0%     -13.6%      15438 =C2=B1  0%  meminfo.SUnreclaim
      3891 =C2=B1  4%     -38.1%       2410 =C2=B1  2%  vmstat.system.cs
      2722 =C2=B1  0%     -60.2%       1084 =C2=B1  0%  vmstat.system.in
     15612 =C2=B1  5%     -85.0%       2335 =C2=B1  9%  softirqs.RCU
     19525 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  softirqs.SCHED
    398686 =C2=B1  0%     -69.4%     121923 =C2=B1  0%  softirqs.TIMER
  27989466 =C2=B1132%     -97.5%     710524 =C2=B1153%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     11122 =C2=B1  1%    +459.4%      62221 =C2=B1  0%  latency_stats.hits.=
generic_file_write_iter.__vfs_write.vfs_write.SyS_pwrite64.entry_SYSCALL_64=
_fastpath
  42247018 =C2=B1145%     -98.3%     710524 =C2=B1153%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
   1072135 =C2=B1  7%   +4401.0%   48256852 =C2=B1  0%  latency_stats.sum.g=
eneric_file_write_iter.__vfs_write.vfs_write.SyS_pwrite64.entry_SYSCALL_64_=
fastpath
  50160257 =C2=B1150%     -98.6%     710524 =C2=B1153%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
   1334934 =C2=B1  1%    +267.5%    4906096 =C2=B1  1%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      4469 =C2=B1  0%     -13.6%       3859 =C2=B1  0%  proc-vmstat.nr_slab=
_unreclaimable
    300600 =C2=B1  0%     -25.9%     222872 =C2=B1  0%  proc-vmstat.numa_hit
    300600 =C2=B1  0%     -25.9%     222872 =C2=B1  0%  proc-vmstat.numa_lo=
cal
      1615 =C2=B1  2%     -42.2%     933.60 =C2=B1  5%  proc-vmstat.pgactiv=
ate
    134199 =C2=B1  0%     -24.8%     100937 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
    179571 =C2=B1  0%     -26.6%     131771 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
    352023 =C2=B1  0%     -25.4%     262552 =C2=B1  0%  proc-vmstat.pgfault
    311385 =C2=B1  0%     -26.2%     229764 =C2=B1  0%  proc-vmstat.pgfree
    304.07 =C2=B1  0%     -25.0%     228.07 =C2=B1  0%  time.elapsed_time
    304.07 =C2=B1  0%     -25.0%     228.07 =C2=B1  0%  time.elapsed_time.m=
ax
      4705 =C2=B1  4%    +892.6%      46711 =C2=B1  0%  time.involuntary_co=
ntext_switches
      8670 =C2=B1  0%     -23.2%       6660 =C2=B1  0%  time.minor_page_fau=
lts
    124.00 =C2=B1  0%     -60.5%      49.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
    366.82 =C2=B1  0%     -71.7%     103.82 =C2=B1  0%  time.system_time
     12.11 =C2=B1  1%     -24.0%       9.20 =C2=B1  1%  time.user_time
    172606 =C2=B1 16%     -79.9%      34644 =C2=B1  0%  time.voluntary_cont=
ext_switches
  11305186 =C2=B1 14%     -99.9%       7783 =C2=B1199%  cpuidle.C1-IVB.time
     75377 =C2=B1 13%    -100.0%       4.00 =C2=B1 61%  cpuidle.C1-IVB.usage
   4233748 =C2=B1 18%    -100.0%     699.20 =C2=B1 38%  cpuidle.C1E-IVB.time
      3279 =C2=B1  5%     -99.9%       3.20 =C2=B1 23%  cpuidle.C1E-IVB.usa=
ge
    532500 =C2=B1 38%     -99.9%     633.40 =C2=B1 40%  cpuidle.C3-IVB.time
      1070 =C2=B1  8%     -99.8%       2.20 =C2=B1 44%  cpuidle.C3-IVB.usage
 4.359e+08 =C2=B1  0%     -99.8%     679907 =C2=B1  6%  cpuidle.C6-IVB.time
     27901 =C2=B1  5%     -99.8%      51.00 =C2=B1 17%  cpuidle.C6-IVB.usage
   5569279 =C2=B1 42%     -99.4%      31002 =C2=B1145%  cpuidle.POLL.time
    386.20 =C2=B1 10%     -99.6%       1.40 =C2=B1 85%  cpuidle.POLL.usage
     62.96 =C2=B1  0%     +58.4%      99.70 =C2=B1  0%  turbostat.%Busy
      2072 =C2=B1  0%     +58.4%       3282 =C2=B1  0%  turbostat.Avg_MHz
     25.01 =C2=B1  0%     -98.8%       0.30 =C2=B1  7%  turbostat.CPU%c1
      0.03 =C2=B1 88%    -100.0%       0.00 =C2=B1 -1%  turbostat.CPU%c3
     12.00 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  turbostat.CPU%c6
     15.30 =C2=B1  0%     -16.7%      12.75 =C2=B1  0%  turbostat.CorWatt
     41.40 =C2=B1  1%     -15.5%      35.00 =C2=B1  3%  turbostat.CoreTmp
      0.01 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  turbostat.Pkg%pc2
      0.22 =C2=B1 17%    -100.0%       0.00 =C2=B1 -1%  turbostat.Pkg%pc6
     42.40 =C2=B1  1%     -13.2%      36.80 =C2=B1  2%  turbostat.PkgTmp
     32.13 =C2=B1  0%      -8.0%      29.57 =C2=B1  0%  turbostat.PkgWatt
      2244 =C2=B1  0%     -13.6%       1938 =C2=B1  0%  slabinfo.Acpi-Names=
pace.active_objs
      2244 =C2=B1  0%     -13.6%       1938 =C2=B1  0%  slabinfo.Acpi-Names=
pace.num_objs
      1993 =C2=B1  4%     -43.5%       1125 =C2=B1  1%  slabinfo.anon_vma.a=
ctive_objs
      1993 =C2=B1  4%     -43.5%       1125 =C2=B1  1%  slabinfo.anon_vma.n=
um_objs
    262.80 =C2=B1 13%     -72.2%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.active_objs
    262.80 =C2=B1 13%     -72.2%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.num_objs
      1900 =C2=B1  5%     -22.5%       1472 =C2=B1  0%  slabinfo.kmalloc-12=
8.active_objs
      1900 =C2=B1  5%     -22.5%       1472 =C2=B1  0%  slabinfo.kmalloc-12=
8.num_objs
      4281 =C2=B1  2%     -10.4%       3838 =C2=B1  0%  slabinfo.kmalloc-16=
.active_objs
      4281 =C2=B1  2%     -10.4%       3838 =C2=B1  0%  slabinfo.kmalloc-16=
.num_objs
      2461 =C2=B1  2%     -17.5%       2030 =C2=B1  2%  slabinfo.kmalloc-19=
2.active_objs
      2683 =C2=B1  3%     -23.3%       2058 =C2=B1  0%  slabinfo.kmalloc-19=
2.num_objs
      1180 =C2=B1  2%     -13.6%       1019 =C2=B1  0%  slabinfo.kmalloc-25=
6.active_objs
      1675 =C2=B1  5%     -19.2%       1354 =C2=B1  2%  slabinfo.kmalloc-25=
6.num_objs
      5708 =C2=B1  4%     -37.2%       3584 =C2=B1  0%  slabinfo.kmalloc-32=
.active_objs
      5708 =C2=B1  4%     -37.2%       3584 =C2=B1  0%  slabinfo.kmalloc-32=
.num_objs
    628.80 =C2=B1 11%     -17.5%     519.00 =C2=B1  5%  slabinfo.kmalloc-51=
2.active_objs
      7195 =C2=B1  3%     -14.0%       6191 =C2=B1  0%  slabinfo.kmalloc-64=
.active_objs
      7515 =C2=B1  2%     -17.6%       6191 =C2=B1  0%  slabinfo.kmalloc-64=
.num_objs
      4505 =C2=B1  4%     -20.5%       3584 =C2=B1  0%  slabinfo.kmalloc-8.=
active_objs
      4505 =C2=B1  4%     -20.5%       3584 =C2=B1  0%  slabinfo.kmalloc-8.=
num_objs
      1310 =C2=B1  3%     -23.1%       1008 =C2=B1  0%  slabinfo.kmalloc-96=
.active_objs
      1310 =C2=B1  3%     -23.1%       1008 =C2=B1  0%  slabinfo.kmalloc-96=
.num_objs
    243.20 =C2=B1 19%     -47.4%     128.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.active_objs
    243.20 =C2=B1 19%     -47.4%     128.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.num_objs
      1756 =C2=B1  3%     -22.6%       1360 =C2=B1  1%  slabinfo.proc_inode=
_cache.active_objs
      1809 =C2=B1  3%     -24.2%       1372 =C2=B1  0%  slabinfo.proc_inode=
_cache.num_objs
    350.80 =C2=B1  5%     -40.4%     209.00 =C2=B1  0%  slabinfo.signal_cac=
he.active_objs
    350.80 =C2=B1  5%     -40.4%     209.00 =C2=B1  0%  slabinfo.signal_cac=
he.num_objs
      2651 =C2=B1  3%     -16.5%       2213 =C2=B1  0%  slabinfo.vm_area_st=
ruct.active_objs
      2692 =C2=B1  3%     -15.8%       2266 =C2=B1  0%  slabinfo.vm_area_st=
ruct.num_objs
      0.41 =C2=B1 14%    +169.6%       1.10 =C2=B1  7%  perf-profile.cycles=
-pp.___might_sleep.__might_sleep.find_lock_entry.shmem_getpage_gfp.shmem_wr=
ite_begin
      0.62 =C2=B1 15%    +156.6%       1.60 =C2=B1  7%  perf-profile.cycles=
-pp.___might_sleep.generic_perform_write.__generic_file_write_iter.generic_=
file_write_iter.__vfs_write
      0.54 =C2=B1  6%    +179.4%       1.52 =C2=B1 16%  perf-profile.cycles=
-pp.__fget_light.sys_pwrite64.entry_SYSCALL_64_fastpath
     25.76 =C2=B1  6%    +148.0%      63.89 =C2=B1  0%  perf-profile.cycles=
-pp.__generic_file_write_iter.generic_file_write_iter.__vfs_write.vfs_write=
.sys_pwrite64
      0.58 =C2=B1 14%    +169.0%       1.56 =C2=B1  5%  perf-profile.cycles=
-pp.__might_sleep.find_lock_entry.shmem_getpage_gfp.shmem_write_begin.gener=
ic_perform_write
      0.33 =C2=B1 15%    +219.3%       1.06 =C2=B1 12%  perf-profile.cycles=
-pp.__might_sleep.mutex_lock.generic_file_write_iter.__vfs_write.vfs_write
      0.49 =C2=B1 31%    +195.5%       1.45 =C2=B1  7%  perf-profile.cycles=
-pp.__might_sleep.percpu_down_read.__sb_start_write.vfs_write.sys_pwrite64
     31.23 =C2=B1  6%    -100.0%       0.01 =C2=B1100%  perf-profile.cycles=
-pp.__mutex_lock_slowpath.mutex_lock.generic_file_write_iter.__vfs_write.vf=
s_write
      4.79 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.__mutex_unlock_slowpath.mutex_unlock.generic_file_write_iter.__vfs_writ=
e.vfs_write
      0.63 =C2=B1  3%    +137.1%       1.48 =C2=B1 16%  perf-profile.cycles=
-pp.__radix_tree_lookup.radix_tree_lookup_slot.find_get_entry.find_lock_ent=
ry.shmem_getpage_gfp
      0.34 =C2=B1 24%    +293.5%       1.32 =C2=B1 13%  perf-profile.cycles=
-pp.__sb_end_write.vfs_write.sys_pwrite64.entry_SYSCALL_64_fastpath
      1.14 =C2=B1 24%    +186.2%       3.27 =C2=B1  5%  perf-profile.cycles=
-pp.__sb_start_write.vfs_write.sys_pwrite64.entry_SYSCALL_64_fastpath
      4.01 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp._raw_spin_lock.__mutex_unlock_slowpath.mutex_unlock.generic_file_write_=
iter.__vfs_write
      0.68 =C2=B1 18%     +96.5%       1.34 =C2=B1  3%  perf-profile.cycles=
-pp.balance_dirty_pages_ratelimited.generic_perform_write.__generic_file_wr=
ite_iter.generic_file_write_iter.__vfs_write
     12.24 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.call_cpuidle.cpu_startup_entry.start_secondary
      9.87 =C2=B1  6%    +152.7%      24.93 =C2=B1  0%  perf-profile.cycles=
-pp.copy_user_enhanced_fast_string.generic_perform_write.__generic_file_wri=
te_iter.generic_file_write_iter.__vfs_write
     12.25 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.cpu_startup_entry.start_secondary
     12.24 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
     12.20 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_=
secondary
      1.02 =C2=B1  9%    +166.6%       2.71 =C2=B1  7%  perf-profile.cycles=
-pp.entry_SYSCALL_64_after_swapgs
     80.93 =C2=B1  5%     +19.5%      96.68 =C2=B1  0%  perf-profile.cycles=
-pp.entry_SYSCALL_64_fastpath
      0.79 =C2=B1  7%    +120.9%       1.75 =C2=B1  8%  perf-profile.cycles=
-pp.file_update_time.__generic_file_write_iter.generic_file_write_iter.__vf=
s_write.vfs_write
      1.82 =C2=B1  7%    +145.0%       4.46 =C2=B1  8%  perf-profile.cycles=
-pp.find_get_entry.find_lock_entry.shmem_getpage_gfp.shmem_write_begin.gene=
ric_perform_write
      3.38 =C2=B1  8%    +159.7%       8.77 =C2=B1  3%  perf-profile.cycles=
-pp.find_lock_entry.shmem_getpage_gfp.shmem_write_begin.generic_perform_wri=
te.__generic_file_write_iter
      0.37 =C2=B1 43%    +279.9%       1.40 =C2=B1  4%  perf-profile.cycles=
-pp.fsnotify.vfs_write.sys_pwrite64.entry_SYSCALL_64_fastpath
     23.75 =C2=B1  5%    +142.2%      57.52 =C2=B1  0%  perf-profile.cycles=
-pp.generic_perform_write.__generic_file_write_iter.generic_file_write_iter=
.__vfs_write.vfs_write
     17.68 =C2=B1 24%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_e=
ntry
      0.49 =C2=B1 11%    +133.6%       1.14 =C2=B1  8%  perf-profile.cycles=
-pp.iov_iter_advance.generic_perform_write.__generic_file_write_iter.generi=
c_file_write_iter.__vfs_write
      0.78 =C2=B1 14%    +112.4%       1.65 =C2=B1  4%  perf-profile.cycles=
-pp.iov_iter_copy_from_user_atomic.generic_perform_write.__generic_file_wri=
te_iter.generic_file_write_iter.__vfs_write
      0.20 =C2=B1 24%    +593.1%       1.41 =C2=B1  5%  perf-profile.cycles=
-pp.iov_iter_fault_in_readable.generic_perform_write.__generic_file_write_i=
ter.generic_file_write_iter.__vfs_write
      0.42 =C2=B1 16%    +148.6%       1.04 =C2=B1  7%  perf-profile.cycles=
-pp.mark_page_accessed.shmem_write_begin.generic_perform_write.__generic_fi=
le_write_iter.generic_file_write_iter
     34.83 =C2=B1  5%     -90.3%       3.38 =C2=B1  6%  perf-profile.cycles=
-pp.mutex_lock.generic_file_write_iter.__vfs_write.vfs_write.sys_pwrite64
     30.76 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.generic_file_wri=
te_iter.__vfs_write
     18.67 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.mutex_spin_on_owner.isra.4.mutex_optimistic_spin.__mutex_lock_slowpath.=
mutex_lock.generic_file_write_iter
      4.49 =C2=B1 17%     -55.6%       1.99 =C2=B1  3%  perf-profile.cycles=
-pp.mutex_unlock.__vfs_write.vfs_write.sys_pwrite64.entry_SYSCALL_64_fastpa=
th
      4.90 =C2=B1 33%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.mutex_unlock.generic_file_write_iter.__vfs_write.vfs_write.sys_pwrite64
      1.63 =C2=B1 52%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.osq_lock.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.generic=
_file_write_iter
      1.70 =C2=B1 50%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.osq_unlock.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.gener=
ic_file_write_iter
      0.92 =C2=B1 30%    +187.2%       2.65 =C2=B1  6%  perf-profile.cycles=
-pp.percpu_down_read.__sb_start_write.vfs_write.sys_pwrite64.entry_SYSCALL_=
64_fastpath
      0.22 =C2=B1 27%    +373.2%       1.06 =C2=B1 11%  perf-profile.cycles=
-pp.percpu_up_read.__sb_end_write.vfs_write.sys_pwrite64.entry_SYSCALL_64_f=
astpath
      0.76 =C2=B1 14%    +156.2%       1.94 =C2=B1  4%  perf-profile.cycles=
-pp.put_page.shmem_write_end.generic_perform_write.__generic_file_write_ite=
r.generic_file_write_iter
      0.68 =C2=B1  3%    +131.9%       1.57 =C2=B1 16%  perf-profile.cycles=
-pp.radix_tree_lookup_slot.find_get_entry.find_lock_entry.shmem_getpage_gfp=
.shmem_write_begin
      2.37 =C2=B1 30%    +102.0%       4.79 =C2=B1  6%  perf-profile.cycles=
-pp.rw_verify_area.vfs_write.sys_pwrite64.entry_SYSCALL_64_fastpath
      0.46 =C2=B1 14%    +161.8%       1.19 =C2=B1 15%  perf-profile.cycles=
-pp.selinux_file_permission.rw_verify_area.vfs_write.sys_pwrite64.entry_SYS=
CALL_64_fastpath
      0.34 =C2=B1 27%    +151.5%       0.86 =C2=B1 13%  perf-profile.cycles=
-pp.set_page_dirty.shmem_write_end.generic_perform_write.__generic_file_wri=
te_iter.generic_file_write_iter
      4.28 =C2=B1  7%    +164.4%      11.32 =C2=B1  2%  perf-profile.cycles=
-pp.shmem_getpage_gfp.shmem_write_begin.generic_perform_write.__generic_fil=
e_write_iter.generic_file_write_iter
      5.10 =C2=B1  8%    +153.4%      12.93 =C2=B1  2%  perf-profile.cycles=
-pp.shmem_write_begin.generic_perform_write.__generic_file_write_iter.gener=
ic_file_write_iter.__vfs_write
      4.58 =C2=B1 14%    +102.2%       9.26 =C2=B1  3%  perf-profile.cycles=
-pp.shmem_write_end.generic_perform_write.__generic_file_write_iter.generic=
_file_write_iter.__vfs_write
     12.25 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.start_secondary
     79.25 =C2=B1  5%     +16.7%      92.47 =C2=B1  0%  perf-profile.cycles=
-pp.sys_pwrite64.entry_SYSCALL_64_fastpath
      2.27 =C2=B1  9%    +134.2%       5.31 =C2=B1  4%  perf-profile.cycles=
-pp.unlock_page.shmem_write_end.generic_perform_write.__generic_file_write_=
iter.generic_file_write_iter
      0.13 =C2=B1 25%    +541.8%       0.86 =C2=B1 13%  perf-profile.cycles=
-pp.update_fast_ctr.percpu_up_read.__sb_end_write.vfs_write.sys_pwrite64
     77.89 =C2=B1  5%     +13.9%      88.70 =C2=B1  0%  perf-profile.cycles=
-pp.vfs_write.sys_pwrite64.entry_SYSCALL_64_fastpath

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
blocksize/compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/te=
stcase:
  512K/gcc-4.9/performance/x86_64-rhel/100%/debian-x86_64-2015-02-07.cgz/lk=
p-nex04/pigz

commit: =

  8025943c32f5de29b3fd548e917e24424297ca73
  0aefb957de5f2a1d9467126114146b6c793cf180

8025943c32f5de29 0aefb957de5f2a1d9467126114 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

 4.804e+08 =C2=B1  0%     -97.6%   11606706 =C2=B1  0%  pigz.throughput
    300.56 =C2=B1  0%      +5.3%     316.41 =C2=B1  0%  pigz.time.elapsed_t=
ime
    300.56 =C2=B1  0%      +5.3%     316.41 =C2=B1  0%  pigz.time.elapsed_t=
ime.max
    931472 =C2=B1  1%     -64.7%     328708 =C2=B1  0%  pigz.time.involunta=
ry_context_switches
    166245 =C2=B1  0%     -21.9%     129826 =C2=B1  1%  pigz.time.maximum_r=
esident_set_size
   1573717 =C2=B1  8%     -90.4%     151177 =C2=B1  0%  pigz.time.minor_pag=
e_faults
      6318 =C2=B1  0%     -98.5%      96.00 =C2=B1  0%  pigz.time.percent_o=
f_cpu_this_job_got
    240.25 =C2=B1  3%     -98.6%       3.33 =C2=B1  1%  pigz.time.system_ti=
me
     18752 =C2=B1  0%     -98.4%     302.80 =C2=B1  0%  pigz.time.user_time
   1140974 =C2=B1  0%     -92.9%      80442 =C2=B1  4%  pigz.time.voluntary=
_context_switches
      2338 =C2=B1  1%     -99.4%      13.81 =C2=B1  1%  uptime.idle
   2564754 =C2=B1  6%     -99.5%      11821 =C2=B1  0%  softirqs.RCU
    219857 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  softirqs.SCHED
   9845159 =C2=B1  0%     -98.2%     173613 =C2=B1  0%  softirqs.TIMER
    633810 =C2=B1  0%     -13.4%     549028 =C2=B1  0%  vmstat.memory.cache
     10393 =C2=B1  1%     -62.3%       3913 =C2=B1  0%  vmstat.system.cs
     97367 =C2=B1  0%     -98.9%       1095 =C2=B1  0%  vmstat.system.in
     98.58 =C2=B1  0%      +1.4%      99.94 =C2=B1  0%  turbostat.%Busy
      2335 =C2=B1  0%      +2.3%       2388 =C2=B1  0%  turbostat.Avg_MHz
      0.92 =C2=B1  8%     -93.2%       0.06 =C2=B1 58%  turbostat.CPU%c1
      0.50 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  turbostat.CPU%c3
     69.50 =C2=B1  0%     -21.9%      54.25 =C2=B1  0%  turbostat.CoreTmp
      0.29 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  turbostat.Pkg%pc3
    931472 =C2=B1  1%     -64.7%     328708 =C2=B1  0%  time.involuntary_co=
ntext_switches
    166245 =C2=B1  0%     -21.9%     129826 =C2=B1  1%  time.maximum_reside=
nt_set_size
   1573717 =C2=B1  8%     -90.4%     151177 =C2=B1  0%  time.minor_page_fau=
lts
      6318 =C2=B1  0%     -98.5%      96.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
    240.25 =C2=B1  3%     -98.6%       3.33 =C2=B1  1%  time.system_time
     18752 =C2=B1  0%     -98.4%     302.80 =C2=B1  0%  time.user_time
   1140974 =C2=B1  0%     -92.9%      80442 =C2=B1  4%  time.voluntary_cont=
ext_switches
   6256256 =C2=B1  7%     -99.9%       3673 =C2=B1173%  cpuidle.C1-NHM.time
     57557 =C2=B1 19%    -100.0%       0.75 =C2=B1173%  cpuidle.C1-NHM.usage
    846984 =C2=B1 19%    -100.0%       0.00 =C2=B1  0%  cpuidle.C1E-NHM.time
      1979 =C2=B1  7%    -100.0%       0.00 =C2=B1  0%  cpuidle.C1E-NHM.usa=
ge
 2.707e+08 =C2=B1  6%     -99.9%     195386 =C2=B1 58%  cpuidle.C3-NHM.time
    193977 =C2=B1  6%    -100.0%      21.00 =C2=B1 58%  cpuidle.C3-NHM.usage
    695.00 =C2=B1 72%    -100.0%       0.00 =C2=B1  0%  cpuidle.POLL.time
     14.25 =C2=B1 33%    -100.0%       0.00 =C2=B1  0%  cpuidle.POLL.usage
    314083 =C2=B1  0%     -19.9%     251563 =C2=B1  0%  meminfo.Active
    212669 =C2=B1  0%     -28.6%     151797 =C2=B1  0%  meminfo.Active(anon)
     57910 =C2=B1  1%     -24.7%      43629 =C2=B1  1%  meminfo.AnonHugePag=
es
    190323 =C2=B1  0%     -20.8%     150824 =C2=B1  0%  meminfo.AnonPages
    584454 =C2=B1  3%     +20.0%     701458 =C2=B1  0%  meminfo.Committed_AS
    153636 =C2=B1  4%     -73.8%      40256 =C2=B1  8%  meminfo.DirectMap4k
     13591 =C2=B1  0%     -14.6%      11602 =C2=B1  0%  meminfo.KernelStack
     48915 =C2=B1  0%     -24.1%      37120 =C2=B1  0%  meminfo.SReclaimable
     85754 =C2=B1  0%     -58.0%      36001 =C2=B1  0%  meminfo.SUnreclaim
     33565 =C2=B1  0%     -69.1%      10387 =C2=B1  0%  meminfo.Shmem
    134670 =C2=B1  0%     -45.7%      73122 =C2=B1  0%  meminfo.Slab
  11238820 =C2=B1 16%     -82.8%    1928687 =C2=B1  0%  numa-numastat.node0=
.local_node
  11241118 =C2=B1 16%     -82.8%    1928687 =C2=B1  0%  numa-numastat.node0=
.numa_hit
      2297 =C2=B1 98%    -100.0%       0.00 =C2=B1 -1%  numa-numastat.node0=
.other_node
   9917497 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  numa-numastat.node1=
.local_node
   9921295 =C2=B1  6%    -100.0%       3.25 =C2=B1 13%  numa-numastat.node1=
.numa_hit
      3798 =C2=B1 57%     -99.9%       3.25 =C2=B1 13%  numa-numastat.node1=
.other_node
  10831204 =C2=B1 38%    -100.0%       0.00 =C2=B1 -1%  numa-numastat.node2=
.local_node
  10834629 =C2=B1 38%    -100.0%       4.25 =C2=B1 19%  numa-numastat.node2=
.numa_hit
  16539540 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  numa-numastat.node3=
.local_node
  16544507 =C2=B1 26%    -100.0%       4.50 =C2=B1 19%  numa-numastat.node3=
.numa_hit
      4967 =C2=B1  9%     -99.9%       4.50 =C2=B1 19%  numa-numastat.node3=
.other_node
     53137 =C2=B1  0%     -28.6%      37934 =C2=B1  0%  proc-vmstat.nr_acti=
ve_anon
     47559 =C2=B1  0%     -20.8%      37690 =C2=B1  0%  proc-vmstat.nr_anon=
_pages
    129.00 =C2=B1 14%     -47.3%      68.00 =C2=B1 18%  proc-vmstat.nr_dirt=
ied
    849.00 =C2=B1  0%     -14.7%     724.25 =C2=B1  0%  proc-vmstat.nr_kern=
el_stack
      8388 =C2=B1  0%     -69.0%       2596 =C2=B1  0%  proc-vmstat.nr_shmem
     12228 =C2=B1  0%     -24.1%       9279 =C2=B1  0%  proc-vmstat.nr_slab=
_reclaimable
     21438 =C2=B1  0%     -58.0%       8999 =C2=B1  0%  proc-vmstat.nr_slab=
_unreclaimable
   1398902 =C2=B1  9%    -100.0%     468.25 =C2=B1  2%  proc-vmstat.numa_hi=
nt_faults
    430311 =C2=B1  8%     -99.9%     468.25 =C2=B1  2%  proc-vmstat.numa_hi=
nt_faults_local
  48502006 =C2=B1  0%     -96.0%    1924877 =C2=B1  0%  proc-vmstat.numa_hit
      1208 =C2=B1 11%    -100.0%       0.50 =C2=B1100%  proc-vmstat.numa_hu=
ge_pte_updates
  48489586 =C2=B1  0%     -96.0%    1924865 =C2=B1  0%  proc-vmstat.numa_lo=
cal
     12420 =C2=B1  0%     -99.9%      12.00 =C2=B1  0%  proc-vmstat.numa_ot=
her
    210322 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.numa_pa=
ges_migrated
   2020867 =C2=B1 10%     -99.9%       1825 =C2=B1  0%  proc-vmstat.numa_pt=
e_updates
     10691 =C2=B1  0%     -79.0%       2245 =C2=B1  2%  proc-vmstat.pgactiv=
ate
    665378 =C2=B1 16%     -90.5%      63448 =C2=B1  1%  proc-vmstat.pgalloc=
_dma32
  48011294 =C2=B1  0%     -95.9%    1964536 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
   2355082 =C2=B1  5%     -65.6%     810560 =C2=B1  0%  proc-vmstat.pgfault
  48628427 =C2=B1  0%     -95.9%    1991560 =C2=B1  0%  proc-vmstat.pgfree
      2560 =C2=B1 31%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.pgmigra=
te_fail
    210322 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.pgmigra=
te_success
    697.00 =C2=B1 23%   +1660.2%      12268 =C2=B1  1%  latency_stats.avg.c=
all_rwsem_down_write_failed.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.entry_SYS=
CALL_64_fastpath
      7952 =C2=B1  5%    +261.7%      28765 =C2=B1  9%  latency_stats.hits.=
call_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
    748841 =C2=B1  0%     -97.3%      20276 =C2=B1  1%  latency_stats.hits.=
futex_wait_queue_me.futex_wait.do_futex.SyS_futex.entry_SYSCALL_64_fastpath
    279787 =C2=B1  0%     -98.5%       4111 =C2=B1  1%  latency_stats.hits.=
pipe_wait.pipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastp=
ath
     13662 =C2=B1  9%    +668.6%     105007 =C2=B1 37%  latency_stats.max.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
     10879 =C2=B1 24%    +313.5%      44986 =C2=B1 40%  latency_stats.max.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault.copy_pa=
ge_to_iter.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      24354 =C2=B1 14%  latency_stats.max.c=
all_rwsem_down_write_failed.SyS_brk.entry_SYSCALL_64_fastpath
      3398 =C2=B1 83%    +979.7%      36695 =C2=B1 13%  latency_stats.max.c=
all_rwsem_down_write_failed.SyS_mprotect.entry_SYSCALL_64_fastpath
     13812 =C2=B1 11%    +626.7%     100378 =C2=B1 43%  latency_stats.max.c=
all_rwsem_down_write_failed.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.entry_SYS=
CALL_64_fastpath
   5878524 =C2=B1100%     +90.6%   11203552 =C2=B1148%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      8061 =C2=B1 59%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.p=
ipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      4989 =C2=B1  0%   +1304.2%      70056 =C2=B1 93%  latency_stats.max.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
    121769 =C2=B1 33%     -95.9%       4993 =C2=B1  0%  latency_stats.max.p=
ipe_wait.pipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpa=
th
     13368 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.p=
ipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
   4600119 =C2=B1 17%   +4057.1%  1.912e+08 =C2=B1 10%  latency_stats.sum.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
     98531 =C2=B1 20%    +784.2%     871253 =C2=B1 20%  latency_stats.sum.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault.copy_pa=
ge_to_iter.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%     338052 =C2=B1  8%  latency_stats.sum.c=
all_rwsem_down_write_failed.SyS_brk.entry_SYSCALL_64_fastpath
     57183 =C2=B1 20%  +15459.0%    8897168 =C2=B1  9%  latency_stats.sum.c=
all_rwsem_down_write_failed.SyS_mprotect.entry_SYSCALL_64_fastpath
    483056 =C2=B1 28%   +2323.4%   11706316 =C2=B1 11%  latency_stats.sum.c=
all_rwsem_down_write_failed.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.entry_SYS=
CALL_64_fastpath
     10678 =C2=B1 12%     -98.1%     203.25 =C2=B1 53%  latency_stats.sum.c=
all_rwsem_down_write_failed.vm_munmap.SyS_munmap.entry_SYSCALL_64_fastpath
   1767988 =C2=B1  4%     -89.6%     183379 =C2=B1  7%  latency_stats.sum.d=
o_wait.SyS_wait4.entry_SYSCALL_64_fastpath
     25141 =C2=B1 60%    +159.3%      65203 =C2=B1123%  latency_stats.sum.f=
lush_work.__cancel_work_timer.cancel_delayed_work_sync.disk_block_events.__=
blkdev_get.blkdev_get.blkdev_open.do_dentry_open.vfs_open.path_openat.do_fi=
lp_open.do_sys_open
 3.062e+08 =C2=B1  0%     -97.4%    7900413 =C2=B1  2%  latency_stats.sum.f=
utex_wait_queue_me.futex_wait.do_futex.SyS_futex.entry_SYSCALL_64_fastpath
     38352 =C2=B1 31%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.p=
ipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
  18136228 =C2=B1  0%     -84.8%    2749541 =C2=B1  5%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
  86992591 =C2=B1  2%     -97.7%    1965980 =C2=B1  2%  latency_stats.sum.p=
ipe_wait.pipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpa=
th
     62261 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.p=
ipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
     37570 =C2=B1 30%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.w=
ait_on_page_bit.do_huge_pmd_numa_page.handle_mm_fault.__do_page_fault.do_pa=
ge_fault.page_fault
     13868 =C2=B1 22%    +173.7%      37962 =C2=B1  0%  numa-vmstat.node0.n=
r_active_anon
     12198 =C2=B1  7%    +209.2%      37719 =C2=B1  0%  numa-vmstat.node0.n=
r_anon_pages
    372.00 =C2=B1  3%     +30.2%     484.50 =C2=B1  0%  numa-vmstat.node0.n=
r_kernel_stack
    304.75 =C2=B1 27%    +211.6%     949.75 =C2=B1  0%  numa-vmstat.node0.n=
r_page_table_pages
      3109 =C2=B1 16%     +34.0%       4165 =C2=B1  3%  numa-vmstat.node0.n=
r_slab_reclaimable
      6037 =C2=B1  2%     -25.0%       4527 =C2=B1  2%  numa-vmstat.node0.n=
r_slab_unreclaimable
   5591515 =C2=B1 15%     -79.7%    1133022 =C2=B1  0%  numa-vmstat.node0.n=
uma_hit
   5585628 =C2=B1 15%     -79.7%    1133022 =C2=B1  0%  numa-vmstat.node0.n=
uma_local
      5886 =C2=B1 41%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node0.n=
uma_other
     12258 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_active_anon
    288.75 =C2=B1  5%     -48.6%     148.50 =C2=B1  4%  numa-vmstat.node1.n=
r_alloc_batch
     10864 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_anon_pages
    102.00 =C2=B1 37%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_inactive_anon
    159.50 =C2=B1 10%     -49.8%      80.00 =C2=B1  0%  numa-vmstat.node1.n=
r_kernel_stack
    265.00 =C2=B1 49%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_page_table_pages
      1587 =C2=B1162%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_shmem
      3085 =C2=B1 11%     -43.3%       1748 =C2=B1 11%  numa-vmstat.node1.n=
r_slab_reclaimable
      5059 =C2=B1  8%     -72.6%       1386 =C2=B1  7%  numa-vmstat.node1.n=
r_slab_unreclaimable
   5170131 =C2=B1 15%     -98.9%      57543 =C2=B1  0%  numa-vmstat.node1.n=
uma_hit
   5107949 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
uma_local
     13335 =C2=B1 24%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_active_anon
    548.50 =C2=B1  2%     +24.6%     683.25 =C2=B1  4%  numa-vmstat.node2.n=
r_alloc_batch
     11930 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_anon_pages
    590.25 =C2=B1151%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_inactive_anon
    152.75 =C2=B1  9%     -47.6%      80.00 =C2=B1  0%  numa-vmstat.node2.n=
r_kernel_stack
    198.50 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_page_table_pages
      2092 =C2=B1115%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_shmem
      3141 =C2=B1 12%     -45.8%       1702 =C2=B1 10%  numa-vmstat.node2.n=
r_slab_reclaimable
      4969 =C2=B1 10%     -67.0%       1640 =C2=B1  6%  numa-vmstat.node2.n=
r_slab_unreclaimable
   5304816 =C2=B1 34%     -98.9%      57590 =C2=B1  0%  numa-vmstat.node2.n=
uma_hit
   5243176 =C2=B1 35%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
uma_local
     13722 =C2=B1 17%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_active_anon
    563.25 =C2=B1  5%     +15.9%     652.75 =C2=B1  3%  numa-vmstat.node3.n=
r_alloc_batch
     12588 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_anon_pages
    576.00 =C2=B1151%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_inactive_anon
    163.00 =C2=B1  7%     -50.9%      80.00 =C2=B1  0%  numa-vmstat.node3.n=
r_kernel_stack
    257.00 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_page_table_pages
      1791 =C2=B1108%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_shmem
      2891 =C2=B1  9%     -42.5%       1662 =C2=B1  5%  numa-vmstat.node3.n=
r_slab_reclaimable
      5371 =C2=B1  8%     -73.1%       1444 =C2=B1  6%  numa-vmstat.node3.n=
r_slab_unreclaimable
   8512325 =C2=B1 26%     -99.3%      57556 =C2=B1  0%  numa-vmstat.node3.n=
uma_hit
   8448839 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
uma_local
     63485 =C2=B1  1%      -9.3%      57556 =C2=B1  0%  numa-vmstat.node3.n=
uma_other
     80249 =C2=B1 15%    +119.6%     176240 =C2=B1  0%  numa-meminfo.node0.=
Active
     55464 =C2=B1 22%    +172.9%     151387 =C2=B1  0%  numa-meminfo.node0.=
Active(anon)
     14472 =C2=B1 17%    +200.4%      43478 =C2=B1  1%  numa-meminfo.node0.=
AnonHugePages
     48785 =C2=B1  7%    +208.3%     150414 =C2=B1  0%  numa-meminfo.node0.=
AnonPages
      5957 =C2=B1  3%     +30.3%       7759 =C2=B1  0%  numa-meminfo.node0.=
KernelStack
    391714 =C2=B1  6%     +16.1%     454800 =C2=B1  0%  numa-meminfo.node0.=
MemUsed
      1221 =C2=B1 27%    +211.1%       3799 =C2=B1  0%  numa-meminfo.node0.=
PageTables
     12437 =C2=B1 16%     +34.0%      16664 =C2=B1  3%  numa-meminfo.node0.=
SReclaimable
     24152 =C2=B1  2%     -25.0%      18107 =C2=B1  2%  numa-meminfo.node0.=
SUnreclaim
     74995 =C2=B1 16%     -66.5%      25090 =C2=B1  4%  numa-meminfo.node1.=
Active
     49007 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
Active(anon)
     12289 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
AnonHugePages
     43438 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
AnonPages
      2559 =C2=B1 10%     -50.0%       1280 =C2=B1  0%  numa-meminfo.node1.=
KernelStack
    353899 =C2=B1  4%     -33.0%     236965 =C2=B1  0%  numa-meminfo.node1.=
MemUsed
      1060 =C2=B1 49%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
PageTables
     12341 =C2=B1 11%     -43.3%       6994 =C2=B1 11%  numa-meminfo.node1.=
SReclaimable
     20236 =C2=B1  8%     -72.6%       5546 =C2=B1  7%  numa-meminfo.node1.=
SUnreclaim
      6351 =C2=B1162%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
Shmem
     32578 =C2=B1  8%     -61.5%      12540 =C2=B1  8%  numa-meminfo.node1.=
Slab
     78467 =C2=B1 18%     -67.9%      25158 =C2=B1  3%  numa-meminfo.node2.=
Active
     53324 =C2=B1 24%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
Active(anon)
     15471 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
AnonHugePages
     47705 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
AnonPages
      2362 =C2=B1151%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
Inactive(anon)
      2449 =C2=B1  9%     -47.7%       1280 =C2=B1  0%  numa-meminfo.node2.=
KernelStack
    365232 =C2=B1  4%     -35.0%     237453 =C2=B1  0%  numa-meminfo.node2.=
MemUsed
    795.50 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
PageTables
     12566 =C2=B1 12%     -45.8%       6810 =C2=B1 10%  numa-meminfo.node2.=
SReclaimable
     19878 =C2=B1 10%     -67.0%       6561 =C2=B1  6%  numa-meminfo.node2.=
SUnreclaim
      8371 =C2=B1115%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
Shmem
     32445 =C2=B1  3%     -58.8%      13371 =C2=B1  6%  numa-meminfo.node2.=
Slab
     80327 =C2=B1 12%     -69.3%      24653 =C2=B1  3%  numa-meminfo.node3.=
Active
     54830 =C2=B1 17%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
Active(anon)
     15647 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
AnonHugePages
     50291 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
AnonPages
      2281 =C2=B1153%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
Inactive(anon)
      2617 =C2=B1  7%     -51.1%       1280 =C2=B1  0%  numa-meminfo.node3.=
KernelStack
    364629 =C2=B1  3%     -35.1%     236563 =C2=B1  0%  numa-meminfo.node3.=
MemUsed
      1029 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
PageTables
     11568 =C2=B1  9%     -42.5%       6650 =C2=B1  5%  numa-meminfo.node3.=
SReclaimable
     21484 =C2=B1  8%     -73.1%       5780 =C2=B1  6%  numa-meminfo.node3.=
SUnreclaim
      7152 =C2=B1108%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
Shmem
     33053 =C2=B1  5%     -62.4%      12430 =C2=B1  4%  numa-meminfo.node3.=
Slab
      7535 =C2=B1  1%     -18.8%       6120 =C2=B1  0%  slabinfo.Acpi-Names=
pace.active_objs
      7535 =C2=B1  1%     -18.8%       6120 =C2=B1  0%  slabinfo.Acpi-Names=
pace.num_objs
     45262 =C2=B1  0%     -15.3%      38327 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.active_objs
    808.25 =C2=B1  0%     -15.2%     685.25 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.active_slabs
     45262 =C2=B1  0%     -15.2%      38374 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.num_objs
    808.25 =C2=B1  0%     -15.2%     685.25 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.num_slabs
      2466 =C2=B1  0%     -96.9%      77.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.active_objs
      2466 =C2=B1  0%     -96.9%      77.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.num_objs
     50812 =C2=B1  0%     -13.4%      44013 =C2=B1  0%  slabinfo.Acpi-State=
.active_objs
    996.00 =C2=B1  0%     -13.4%     863.00 =C2=B1  0%  slabinfo.Acpi-State=
.active_slabs
     50812 =C2=B1  0%     -13.3%      44038 =C2=B1  0%  slabinfo.Acpi-State=
.num_objs
    996.00 =C2=B1  0%     -13.4%     863.00 =C2=B1  0%  slabinfo.Acpi-State=
.num_slabs
      2319 =C2=B1  2%     -89.1%     252.00 =C2=B1  0%  slabinfo.RAW.active=
_objs
      2319 =C2=B1  2%     -89.1%     252.00 =C2=B1  0%  slabinfo.RAW.num_ob=
js
    114.75 =C2=B1  6%     -85.2%      17.00 =C2=B1  0%  slabinfo.TCP.active=
_objs
    114.75 =C2=B1  6%     -85.2%      17.00 =C2=B1  0%  slabinfo.TCP.num_ob=
js
    272.00 =C2=B1  8%     -87.5%      34.00 =C2=B1  0%  slabinfo.UDP.active=
_objs
    272.00 =C2=B1  8%     -87.5%      34.00 =C2=B1  0%  slabinfo.UDP.num_ob=
js
     10201 =C2=B1  1%     -84.0%       1628 =C2=B1  0%  slabinfo.anon_vma.a=
ctive_objs
    199.50 =C2=B1  1%     -84.5%      31.00 =C2=B1  0%  slabinfo.anon_vma.a=
ctive_slabs
     10201 =C2=B1  1%     -84.0%       1628 =C2=B1  0%  slabinfo.anon_vma.n=
um_objs
    199.50 =C2=B1  1%     -84.5%      31.00 =C2=B1  0%  slabinfo.anon_vma.n=
um_slabs
    783.75 =C2=B1  7%     -90.7%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.active_objs
    783.75 =C2=B1  7%     -90.7%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.num_objs
    193.50 =C2=B1 19%     -79.8%      39.00 =C2=B1  0%  slabinfo.bdev_cache=
.active_objs
    193.50 =C2=B1 19%     -79.8%      39.00 =C2=B1  0%  slabinfo.bdev_cache=
.num_objs
    841.00 =C2=B1 12%     -94.8%      44.00 =C2=B1  0%  slabinfo.blkdev_req=
uests.active_objs
    841.00 =C2=B1 12%     -94.8%      44.00 =C2=B1  0%  slabinfo.blkdev_req=
uests.num_objs
     57176 =C2=B1  0%     -23.3%      43852 =C2=B1  0%  slabinfo.dentry.act=
ive_objs
      1361 =C2=B1  0%     -23.3%       1044 =C2=B1  0%  slabinfo.dentry.act=
ive_slabs
     57191 =C2=B1  0%     -23.2%      43902 =C2=B1  0%  slabinfo.dentry.num=
_objs
      1361 =C2=B1  0%     -23.3%       1044 =C2=B1  0%  slabinfo.dentry.num=
_slabs
    476.50 =C2=B1  6%     -91.8%      39.00 =C2=B1  0%  slabinfo.file_lock_=
cache.active_objs
    476.50 =C2=B1  6%     -91.8%      39.00 =C2=B1  0%  slabinfo.file_lock_=
cache.num_objs
      3067 =C2=B1  0%     -94.0%     183.00 =C2=B1  0%  slabinfo.files_cach=
e.active_objs
      3067 =C2=B1  0%     -94.0%     183.00 =C2=B1  0%  slabinfo.files_cach=
e.num_objs
      4013 =C2=B1  0%     -11.1%       3568 =C2=B1  0%  slabinfo.ftrace_eve=
nt_field.active_objs
      4013 =C2=B1  0%     -11.1%       3568 =C2=B1  0%  slabinfo.ftrace_eve=
nt_field.num_objs
      2136 =C2=B1  0%     -45.2%       1170 =C2=B1  0%  slabinfo.idr_layer_=
cache.active_objs
      2136 =C2=B1  0%     -45.2%       1170 =C2=B1  0%  slabinfo.idr_layer_=
cache.num_objs
     42026 =C2=B1  0%     -10.9%      37440 =C2=B1  0%  slabinfo.inode_cach=
e.active_objs
     42026 =C2=B1  0%     -10.9%      37440 =C2=B1  0%  slabinfo.inode_cach=
e.num_objs
     56283 =C2=B1  0%     -30.2%      39290 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.active_objs
      1654 =C2=B1  0%     -30.2%       1155 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.active_slabs
     56283 =C2=B1  0%     -30.2%      39290 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.num_objs
      1654 =C2=B1  0%     -30.2%       1155 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.num_slabs
      3575 =C2=B1  0%     -76.1%     856.00 =C2=B1  3%  slabinfo.kmalloc-10=
24.active_objs
      3719 =C2=B1  0%     -74.0%     968.00 =C2=B1  5%  slabinfo.kmalloc-10=
24.num_objs
      5023 =C2=B1  1%     -58.0%       2109 =C2=B1  0%  slabinfo.kmalloc-12=
8.active_objs
      5023 =C2=B1  1%     -57.4%       2141 =C2=B1  0%  slabinfo.kmalloc-12=
8.num_objs
     19925 =C2=B1  1%     -68.7%       6235 =C2=B1  0%  slabinfo.kmalloc-16=
.active_objs
     19925 =C2=B1  1%     -66.6%       6651 =C2=B1  0%  slabinfo.kmalloc-16=
.num_objs
     10246 =C2=B1  0%     -64.3%       3653 =C2=B1  0%  slabinfo.kmalloc-19=
2.active_objs
    243.50 =C2=B1  1%     -63.2%      89.50 =C2=B1  0%  slabinfo.kmalloc-19=
2.active_slabs
     10250 =C2=B1  0%     -63.3%       3759 =C2=B1  0%  slabinfo.kmalloc-19=
2.num_objs
    243.50 =C2=B1  1%     -63.2%      89.50 =C2=B1  0%  slabinfo.kmalloc-19=
2.num_slabs
      3240 =C2=B1  2%     -78.0%     712.00 =C2=B1  2%  slabinfo.kmalloc-20=
48.active_objs
    208.75 =C2=B1  1%     -77.6%      46.75 =C2=B1  0%  slabinfo.kmalloc-20=
48.active_slabs
      3347 =C2=B1  1%     -77.5%     754.50 =C2=B1  0%  slabinfo.kmalloc-20=
48.num_objs
    208.75 =C2=B1  1%     -77.6%      46.75 =C2=B1  0%  slabinfo.kmalloc-20=
48.num_slabs
     10778 =C2=B1 10%     -87.2%       1379 =C2=B1  0%  slabinfo.kmalloc-25=
6.active_objs
    347.50 =C2=B1 10%     -77.1%      79.50 =C2=B1  5%  slabinfo.kmalloc-25=
6.active_slabs
     11141 =C2=B1 10%     -77.0%       2562 =C2=B1  5%  slabinfo.kmalloc-25=
6.num_objs
    347.50 =C2=B1 10%     -77.1%      79.50 =C2=B1  5%  slabinfo.kmalloc-25=
6.num_slabs
     20631 =C2=B1  1%     -60.3%       8192 =C2=B1  0%  slabinfo.kmalloc-32=
.active_objs
     20631 =C2=B1  1%     -60.3%       8192 =C2=B1  0%  slabinfo.kmalloc-32=
.num_objs
      1007 =C2=B1  0%     -56.1%     442.50 =C2=B1  0%  slabinfo.kmalloc-40=
96.active_objs
      1060 =C2=B1  0%     -55.1%     476.50 =C2=B1  0%  slabinfo.kmalloc-40=
96.num_objs
      6919 =C2=B1  5%     -63.7%       2510 =C2=B1  0%  slabinfo.kmalloc-51=
2.active_objs
    219.50 =C2=B1  3%     -59.9%      88.00 =C2=B1  2%  slabinfo.kmalloc-51=
2.active_slabs
      7044 =C2=B1  3%     -59.8%       2833 =C2=B1  1%  slabinfo.kmalloc-51=
2.num_objs
    219.50 =C2=B1  3%     -59.9%      88.00 =C2=B1  2%  slabinfo.kmalloc-51=
2.num_slabs
     36557 =C2=B1  1%     -56.2%      16001 =C2=B1  0%  slabinfo.kmalloc-64=
.active_objs
    571.00 =C2=B1  1%     -54.3%     261.00 =C2=B1  0%  slabinfo.kmalloc-64=
.active_slabs
     36557 =C2=B1  1%     -54.2%      16725 =C2=B1  0%  slabinfo.kmalloc-64=
.num_objs
    571.00 =C2=B1  1%     -54.3%     261.00 =C2=B1  0%  slabinfo.kmalloc-64=
.num_slabs
     38060 =C2=B1  1%     -86.5%       5132 =C2=B1  1%  slabinfo.kmalloc-8.=
active_objs
     39168 =C2=B1  1%     -84.3%       6140 =C2=B1  0%  slabinfo.kmalloc-8.=
num_objs
    489.75 =C2=B1  0%     -88.0%      59.00 =C2=B1  0%  slabinfo.kmalloc-81=
92.active_objs
    122.75 =C2=B1  0%     -87.8%      15.00 =C2=B1  0%  slabinfo.kmalloc-81=
92.active_slabs
    491.00 =C2=B1  0%     -87.8%      60.00 =C2=B1  0%  slabinfo.kmalloc-81=
92.num_objs
    122.75 =C2=B1  0%     -87.8%      15.00 =C2=B1  0%  slabinfo.kmalloc-81=
92.num_slabs
      4181 =C2=B1  0%     -62.6%       1562 =C2=B1  1%  slabinfo.kmalloc-96=
.active_objs
      4614 =C2=B1  1%     -63.6%       1678 =C2=B1  0%  slabinfo.kmalloc-96=
.num_objs
    547.50 =C2=B1 10%     -72.1%     153.00 =C2=B1  0%  slabinfo.kmem_cache=
.active_objs
    547.50 =C2=B1 10%     -72.1%     153.00 =C2=B1  0%  slabinfo.kmem_cache=
.num_objs
    979.25 =C2=B1  7%     -50.6%     484.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.active_objs
      1007 =C2=B1  6%     -49.2%     512.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.num_objs
      1211 =C2=B1  1%     -91.7%     101.00 =C2=B1  0%  slabinfo.mm_struct.=
active_objs
      1211 =C2=B1  1%     -91.7%     101.00 =C2=B1  0%  slabinfo.mm_struct.=
num_objs
      1298 =C2=B1  6%     -93.5%      84.00 =C2=B1  0%  slabinfo.mnt_cache.=
active_objs
      1298 =C2=B1  6%     -93.5%      84.00 =C2=B1  0%  slabinfo.mnt_cache.=
num_objs
    152.00 =C2=B1  9%     -78.9%      32.00 =C2=B1  0%  slabinfo.nfs_inode_=
cache.active_objs
    152.00 =C2=B1  9%     -78.9%      32.00 =C2=B1  0%  slabinfo.nfs_inode_=
cache.num_objs
      9608 =C2=B1  0%     -47.2%       5069 =C2=B1  0%  slabinfo.proc_inode=
_cache.active_objs
      9608 =C2=B1  0%     -47.1%       5082 =C2=B1  0%  slabinfo.proc_inode=
_cache.num_objs
     10861 =C2=B1  1%     -29.9%       7614 =C2=B1  0%  slabinfo.radix_tree=
_node.active_objs
     10861 =C2=B1  1%     -29.9%       7614 =C2=B1  0%  slabinfo.radix_tree=
_node.num_objs
      3783 =C2=B1  1%     -66.4%       1271 =C2=B1  0%  slabinfo.shmem_inod=
e_cache.active_objs
      3783 =C2=B1  1%     -66.4%       1271 =C2=B1  0%  slabinfo.shmem_inod=
e_cache.num_objs
      1589 =C2=B1  1%     -57.8%     670.00 =C2=B1  0%  slabinfo.sighand_ca=
che.active_objs
      1608 =C2=B1  1%     -57.9%     677.75 =C2=B1  0%  slabinfo.sighand_ca=
che.num_objs
      2725 =C2=B1  0%     -72.5%     749.75 =C2=B1  0%  slabinfo.signal_cac=
he.active_objs
      2725 =C2=B1  0%     -72.5%     749.75 =C2=B1  0%  slabinfo.signal_cac=
he.num_objs
      3263 =C2=B1  0%     -98.4%      51.00 =C2=B1  0%  slabinfo.sigqueue.a=
ctive_objs
      3263 =C2=B1  0%     -98.4%      51.00 =C2=B1  0%  slabinfo.sigqueue.n=
um_objs
      3172 =C2=B1  4%     -90.4%     306.00 =C2=B1  0%  slabinfo.sock_inode=
_cache.active_objs
      3172 =C2=B1  4%     -90.4%     306.00 =C2=B1  0%  slabinfo.sock_inode=
_cache.num_objs
      1139 =C2=B1  1%     -36.2%     727.25 =C2=B1  0%  slabinfo.task_struc=
t.active_objs
    390.25 =C2=B1  1%     -37.7%     243.25 =C2=B1  0%  slabinfo.task_struc=
t.active_slabs
      1171 =C2=B1  1%     -37.6%     730.75 =C2=B1  0%  slabinfo.task_struc=
t.num_objs
    390.25 =C2=B1  1%     -37.7%     243.25 =C2=B1  0%  slabinfo.task_struc=
t.num_slabs
      2297 =C2=B1  2%     -22.0%       1792 =C2=B1  0%  slabinfo.trace_even=
t_file.active_objs
      2297 =C2=B1  2%     -22.0%       1792 =C2=B1  0%  slabinfo.trace_even=
t_file.num_objs
     20147 =C2=B1  3%     -87.0%       2627 =C2=B1  0%  slabinfo.vm_area_st=
ruct.active_objs
    457.50 =C2=B1  3%     -84.8%      69.50 =C2=B1  2%  slabinfo.vm_area_st=
ruct.active_slabs
     20147 =C2=B1  3%     -84.7%       3080 =C2=B1  2%  slabinfo.vm_area_st=
ruct.num_objs
    457.50 =C2=B1  3%     -84.8%      69.50 =C2=B1  2%  slabinfo.vm_area_st=
ruct.num_slabs
      1.40 =C2=B1 14%    +411.1%       7.14 =C2=B1  6%  perf-profile.cycles=
-pp.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.activate_t=
ask.ttwu_do_activate
      2.46 =C2=B1  7%     -61.5%       0.94 =C2=B1 32%  perf-profile.cycles=
-pp.__alloc_pages_nodemask.alloc_pages_current.pipe_write.__vfs_write.vfs_w=
rite
      0.04 =C2=B1 74%   +2507.1%       0.91 =C2=B1 50%  perf-profile.cycles=
-pp.__alloc_pages_nodemask.alloc_pages_vma.handle_mm_fault.__do_page_fault.=
do_page_fault
      0.06 =C2=B1 37%   +2400.0%       1.38 =C2=B1 16%  perf-profile.cycles=
-pp.__const_udelay.wait_for_xmitr.serial8250_console_putchar.uart_console_w=
rite.serial8250_console_write
      1.91 =C2=B1 29%    +160.9%       4.98 =C2=B1 29%  perf-profile.cycles=
-pp.__do_page_fault.do_page_fault.page_fault
      0.01 =C2=B1 87%   +7560.0%       0.96 =C2=B1 45%  perf-profile.cycles=
-pp.__enqueue_entity.pick_next_task_fair.__schedule.schedule.exit_to_usermo=
de_loop
     26.51 =C2=B1  9%     -63.8%       9.59 =C2=B1 28%  perf-profile.cycles=
-pp.__hrtimer_run_queues.hrtimer_interrupt.local_apic_timer_interrupt.smp_a=
pic_timer_interrupt.apic_timer_interrupt
      0.73 =C2=B1 20%    +349.3%       3.28 =C2=B1 19%  perf-profile.cycles=
-pp.__kernel_text_address.print_context_stack.dump_trace.save_stack_trace_t=
sk.__account_scheduler_latency
      0.24 =C2=B1 18%   +1133.0%       2.99 =C2=B1 16%  perf-profile.cycles=
-pp.__libc_fork
      0.15 =C2=B1 18%    +258.3%       0.54 =C2=B1 65%  perf-profile.cycles=
-pp.__module_text_address.is_module_text_address.__kernel_text_address.prin=
t_context_stack.dump_trace
      0.88 =C2=B1 25%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.__mutex_lock_slowpath.mutex_lock.pipe_read.__vfs_read.vfs_read
      0.06 =C2=B1 18%   +4234.8%       2.49 =C2=B1 26%  perf-profile.cycles=
-pp.__schedule.schedule.exit_to_usermode_loop.prepare_exit_to_usermode.reti=
nt_user
      0.23 =C2=B1 11%    +684.8%       1.80 =C2=B1 48%  perf-profile.cycles=
-pp.__schedule.schedule.exit_to_usermode_loop.syscall_return_slowpath.int_r=
et_from_sys_call
      0.13 =C2=B1 31%   +1107.8%       1.54 =C2=B1 26%  perf-profile.cycles=
-pp.__schedule.schedule.pipe_wait.pipe_read.__vfs_read
      0.09 =C2=B1 37%    +577.1%       0.59 =C2=B1 53%  perf-profile.cycles=
-pp.__switch_to
     20.40 =C2=B1  4%     -56.0%       8.98 =C2=B1 11%  perf-profile.cycles=
-pp.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      0.39 =C2=B1 21%   +1131.2%       4.83 =C2=B1 24%  perf-profile.cycles=
-pp.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath.read
     13.24 =C2=B1  9%     -44.0%       7.41 =C2=B1 19%  perf-profile.cycles=
-pp.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      0.72 =C2=B1 22%   +1489.9%      11.45 =C2=B1  6%  perf-profile.cycles=
-pp.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath.write
      0.05 =C2=B1 61%   +1495.0%       0.80 =C2=B1 71%  perf-profile.cycles=
-pp.__wake_up_bit.unlock_page.filemap_map_pages.handle_mm_fault.__do_page_f=
ault
      0.55 =C2=B1 31%   +1290.5%       7.65 =C2=B1  5%  perf-profile.cycles=
-pp.__wake_up_common.__wake_up_sync_key.pipe_write.__vfs_write.vfs_write
      0.60 =C2=B1 30%   +1257.1%       8.14 =C2=B1  6%  perf-profile.cycles=
-pp.__wake_up_sync_key.pipe_write.__vfs_write.vfs_write.sys_write
      0.04 =C2=B1 60%   +2352.9%       1.04 =C2=B1 48%  perf-profile.cycles=
-pp._dl_addr
      0.19 =C2=B1 16%   +1094.8%       2.30 =C2=B1 15%  perf-profile.cycles=
-pp._do_fork.sys_clone.entry_SYSCALL_64_fastpath.__libc_fork
      1.01 =C2=B1 16%     -73.3%       0.27 =C2=B1 89%  perf-profile.cycles=
-pp.account_process_tick.update_process_times.tick_sched_handle.tick_sched_=
timer.__hrtimer_run_queues
      0.68 =C2=B1 17%    +947.3%       7.15 =C2=B1  6%  perf-profile.cycles=
-pp.activate_task.ttwu_do_activate.try_to_wake_up.default_wake_function.aut=
oremove_wake_function
      0.05 =C2=B1 54%   +2115.0%       1.11 =C2=B1 16%  perf-profile.cycles=
-pp.activate_task.ttwu_do_activate.try_to_wake_up.wake_up_process.process_t=
imeout
      0.89 =C2=B1 22%     -75.2%       0.22 =C2=B1 81%  perf-profile.cycles=
-pp.activate_task.ttwu_do_activate.try_to_wake_up.wake_up_process.wake_up_q
      2.88 =C2=B1  7%     -59.9%       1.16 =C2=B1 17%  perf-profile.cycles=
-pp.alloc_pages_current.pipe_write.__vfs_write.vfs_write.sys_write
      0.04 =C2=B1 86%   +2575.0%       1.07 =C2=B1 47%  perf-profile.cycles=
-pp.alloc_pages_vma.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      1.71 =C2=B1 17%     -60.8%       0.67 =C2=B1 37%  perf-profile.cycles=
-pp.anon_pipe_buf_release.pipe_read.__vfs_read.vfs_read.sys_read
     37.78 =C2=B1  9%     -59.7%      15.23 =C2=B1 22%  perf-profile.cycles=
-pp.apic_timer_interrupt
      0.53 =C2=B1 33%   +1314.1%       7.53 =C2=B1  4%  perf-profile.cycles=
-pp.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.pipe_write=
.__vfs_write
      0.14 =C2=B1 26%   +2436.2%       3.68 =C2=B1  4%  perf-profile.cycles=
-pp.call_console_drivers.constprop.24.console_unlock.vprintk_emit.vprintk_d=
efault.printk
     17.02 =C2=B1 36%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.call_cpuidle.cpu_startup_entry.start_secondary
      0.84 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.call_function_interrupt
      0.10 =C2=B1 23%   +1743.6%       1.80 =C2=B1 20%  perf-profile.cycles=
-pp.call_timer_fn.run_timer_softirq.__do_softirq.irq_exit.smp_apic_timer_in=
terrupt
      0.14 =C2=B1 26%   +2436.2%       3.68 =C2=B1  4%  perf-profile.cycles=
-pp.console_unlock.vprintk_emit.vprintk_default.printk.perf_duration_warn
     16.27 =C2=B1  3%     -53.6%       7.54 =C2=B1 14%  perf-profile.cycles=
-pp.copy_page_to_iter.pipe_read.__vfs_read.vfs_read.sys_read
      0.17 =C2=B1 16%   +1201.4%       2.25 =C2=B1 18%  perf-profile.cycles=
-pp.copy_process._do_fork.sys_clone.entry_SYSCALL_64_fastpath.__libc_fork
     15.40 =C2=B1  4%     -54.5%       7.00 =C2=B1 13%  perf-profile.cycles=
-pp.copy_user_generic_string.copy_page_to_iter.pipe_read.__vfs_read.vfs_read
     17.30 =C2=B1 36%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.cpu_startup_entry.start_secondary
     17.02 =C2=B1 36%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
     16.93 =C2=B1 36%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_=
secondary
      0.06 =C2=B1 39%    +764.0%       0.54 =C2=B1 54%  perf-profile.cycles=
-pp.deactivate_task.__schedule.schedule.pipe_wait.pipe_read
      0.95 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.default_send_IPI_mask_sequence_phys.physflat_send_IPI_mask.native_send_=
call_func_ipi.smp_call_function_many.native_flush_tlb_others
      0.53 =C2=B1 33%   +1314.1%       7.53 =C2=B1  4%  perf-profile.cycles=
-pp.default_wake_function.autoremove_wake_function.__wake_up_common.__wake_=
up_sync_key.pipe_write
      0.06 =C2=B1 37%   +2400.0%       1.38 =C2=B1 16%  perf-profile.cycles=
-pp.delay_tsc.__const_udelay.wait_for_xmitr.serial8250_console_putchar.uart=
_console_write
      0.44 =C2=B1  7%    +759.0%       3.82 =C2=B1 19%  perf-profile.cycles=
-pp.do_execveat_common.isra.33.sys_execve.return_from_execve.execve
      0.14 =C2=B1 19%   +1303.5%       2.00 =C2=B1 14%  perf-profile.cycles=
-pp.do_exit.do_group_exit.sys_exit_group.entry_SYSCALL_64_fastpath
      1.95 =C2=B1 14%     -72.1%       0.55 =C2=B1 59%  perf-profile.cycles=
-pp.do_futex.sys_futex.entry_SYSCALL_64_fastpath
      0.13 =C2=B1 17%   +1409.4%       2.00 =C2=B1 14%  perf-profile.cycles=
-pp.do_group_exit.sys_exit_group.entry_SYSCALL_64_fastpath
      0.10 =C2=B1 29%   +1453.7%       1.59 =C2=B1 34%  perf-profile.cycles=
-pp.do_mmap.vm_mmap_pgoff.sys_mmap_pgoff.sys_mmap.entry_SYSCALL_64_fastpath
      1.92 =C2=B1 29%    +161.6%       5.03 =C2=B1 29%  perf-profile.cycles=
-pp.do_page_fault.page_fault
      0.11 =C2=B1 33%   +1179.1%       1.38 =C2=B1 25%  perf-profile.cycles=
-pp.do_wp_page.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      1.28 =C2=B1 15%    +438.8%       6.91 =C2=B1  5%  perf-profile.cycles=
-pp.dump_trace.save_stack_trace_tsk.__account_scheduler_latency.enqueue_ent=
ity.enqueue_task_fair
      1.50 =C2=B1 17%    +438.1%       8.08 =C2=B1  7%  perf-profile.cycles=
-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_=
wake_up
      0.67 =C2=B1 14%    +962.8%       7.15 =C2=B1  6%  perf-profile.cycles=
-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.default=
_wake_function
      0.92 =C2=B1 20%     +43.8%       1.32 =C2=B1 20%  perf-profile.cycles=
-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.wake_up=
_process
     35.92 =C2=B1  6%     -46.5%      19.21 =C2=B1  4%  perf-profile.cycles=
-pp.entry_SYSCALL_64_fastpath
      0.19 =C2=B1 17%   +1125.3%       2.30 =C2=B1 15%  perf-profile.cycles=
-pp.entry_SYSCALL_64_fastpath.__libc_fork
      0.47 =C2=B1 32%    +997.9%       5.13 =C2=B1 28%  perf-profile.cycles=
-pp.entry_SYSCALL_64_fastpath.read
      0.91 =C2=B1 16%   +1368.1%      13.36 =C2=B1  8%  perf-profile.cycles=
-pp.entry_SYSCALL_64_fastpath.write
      0.45 =C2=B1  8%    +777.7%       3.93 =C2=B1 18%  perf-profile.cycles=
-pp.execve
      0.11 =C2=B1 26%   +1663.6%       1.94 =C2=B1 13%  perf-profile.cycles=
-pp.exit_mmap.mmput.do_exit.do_group_exit.sys_exit_group
      0.09 =C2=B1 21%    +917.1%       0.89 =C2=B1 44%  perf-profile.cycles=
-pp.exit_mmap.mmput.flush_old_exec.load_elf_binary.search_binary_handler
      0.29 =C2=B1 16%    +797.4%       2.60 =C2=B1 27%  perf-profile.cycles=
-pp.exit_to_usermode_loop.prepare_exit_to_usermode.retint_user
      0.04 =C2=B1 65%   +4257.1%       1.52 =C2=B1 53%  perf-profile.cycles=
-pp.exit_to_usermode_loop.syscall_return_slowpath.int_ret_from_sys_call.wri=
te
      0.19 =C2=B1 23%   +1154.7%       2.35 =C2=B1 33%  perf-profile.cycles=
-pp.filemap_map_pages.handle_mm_fault.__do_page_fault.do_page_fault.page_fa=
ult
      0.02 =C2=B1 33%   +3533.3%       0.54 =C2=B1 57%  perf-profile.cycles=
-pp.filename_lookup.user_path_at_empty.vfs_fstatat.SYSC_newstat.sys_newstat
      0.10 =C2=B1 13%    +864.1%       0.94 =C2=B1 44%  perf-profile.cycles=
-pp.flush_old_exec.load_elf_binary.search_binary_handler.do_execveat_common=
.sys_execve
      1.25 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.flush_tlb_page.ptep_clear_flush.try_to_unmap_one.rmap_walk.try_to_unmap
      1.09 =C2=B1 24%     -71.6%       0.31 =C2=B1 41%  perf-profile.cycles=
-pp.free_hot_cold_page.put_page.anon_pipe_buf_release.pipe_read.__vfs_read
      0.84 =C2=B1 21%     -82.9%       0.14 =C2=B1 70%  perf-profile.cycles=
-pp.futex_requeue.do_futex.sys_futex.entry_SYSCALL_64_fastpath
      1.77 =C2=B1 10%     -55.8%       0.78 =C2=B1 51%  perf-profile.cycles=
-pp.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_current.pipe_=
write.__vfs_write
      1.87 =C2=B1 27%    +132.4%       4.34 =C2=B1 30%  perf-profile.cycles=
-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
     30.01 =C2=B1  8%     -66.0%      10.20 =C2=B1 29%  perf-profile.cycles=
-pp.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_timer_interrupt.a=
pic_timer_interrupt
      0.05 =C2=B1 71%   +3650.0%       1.69 =C2=B1 43%  perf-profile.cycles=
-pp.int_ret_from_sys_call.write
     17.41 =C2=B1 35%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_e=
ntry
      0.10 =C2=B1 13%   +1923.1%       1.97 =C2=B1  5%  perf-profile.cycles=
-pp.io_serial_in.wait_for_xmitr.serial8250_console_putchar.uart_console_wri=
te.serial8250_console_write
      4.19 =C2=B1 22%     -38.8%       2.56 =C2=B1  9%  perf-profile.cycles=
-pp.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt
      0.14 =C2=B1 26%   +2436.2%       3.68 =C2=B1  4%  perf-profile.cycles=
-pp.irq_work_interrupt
      0.14 =C2=B1 26%   +2436.2%       3.68 =C2=B1  4%  perf-profile.cycles=
-pp.irq_work_run.smp_irq_work_interrupt.irq_work_interrupt
      0.14 =C2=B1 26%   +2436.2%       3.68 =C2=B1  4%  perf-profile.cycles=
-pp.irq_work_run_list.irq_work_run.smp_irq_work_interrupt.irq_work_interrupt
      0.16 =C2=B1 26%    +592.2%       1.11 =C2=B1 26%  perf-profile.cycles=
-pp.is_ftrace_trampoline.__kernel_text_address.print_context_stack.dump_tra=
ce.save_stack_trace_tsk
      0.26 =C2=B1 27%    +239.2%       0.86 =C2=B1 60%  perf-profile.cycles=
-pp.is_module_text_address.__kernel_text_address.print_context_stack.dump_t=
race.save_stack_trace_tsk
      0.10 =C2=B1 21%    +817.1%       0.94 =C2=B1 53%  perf-profile.cycles=
-pp.is_module_text_address.print_context_stack.dump_trace.save_stack_trace_=
tsk.__account_scheduler_latency
      0.02 =C2=B1 79%   +6766.7%       1.54 =C2=B1 34%  perf-profile.cycles=
-pp.khugepaged.kthread.ret_from_fork
      0.68 =C2=B1 17%   +1182.3%       8.69 =C2=B1 57%  perf-profile.cycles=
-pp.kthread.ret_from_fork
      2.10 =C2=B1  7%     -89.5%       0.22 =C2=B1  6%  perf-profile.cycles=
-pp.ktime_get_update_offsets_now.hrtimer_interrupt.local_apic_timer_interru=
pt.smp_apic_timer_interrupt.apic_timer_interrupt
      0.31 =C2=B1  9%    +766.1%       2.68 =C2=B1 26%  perf-profile.cycles=
-pp.load_elf_binary.search_binary_handler.do_execveat_common.sys_execve.ret=
urn_from_execve
     30.49 =C2=B1  8%     -65.5%      10.51 =C2=B1 27%  perf-profile.cycles=
-pp.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interrupt
      1.35 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.migrate_misplaced_page.handle_mm_fault.__do_page_fault.do_page_fault.pa=
ge_fault
      1.34 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.migrate_pages.migrate_misplaced_page.handle_mm_fault.__do_page_fault.do=
_page_fault
      0.10 =C2=B1 32%   +1340.0%       1.44 =C2=B1 44%  perf-profile.cycles=
-pp.mmap_region.do_mmap.vm_mmap_pgoff.sys_mmap_pgoff.sys_mmap
      0.11 =C2=B1 26%   +1663.6%       1.94 =C2=B1 13%  perf-profile.cycles=
-pp.mmput.do_exit.do_group_exit.sys_exit_group.entry_SYSCALL_64_fastpath
      0.09 =C2=B1 21%    +917.1%       0.89 =C2=B1 44%  perf-profile.cycles=
-pp.mmput.flush_old_exec.load_elf_binary.search_binary_handler.do_execveat_=
common
      0.08 =C2=B1 27%   +1180.6%       0.99 =C2=B1 48%  perf-profile.cycles=
-pp.mprotect_fixup.sys_mprotect.entry_SYSCALL_64_fastpath
      0.90 =C2=B1 25%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.mutex_lock.pipe_read.__vfs_read.vfs_read.sys_read
      0.88 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.pipe_read.__vfs_=
read
      0.86 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.mutex_spin_on_owner.isra.4.mutex_optimistic_spin.__mutex_lock_slowpath.=
mutex_lock.pipe_read
      1.25 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.native_flush_tlb_others.flush_tlb_page.ptep_clear_flush.try_to_unmap_on=
e.rmap_walk
      0.95 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.native_send_call_func_ipi.smp_call_function_many.native_flush_tlb_other=
s.flush_tlb_page.ptep_clear_flush
      1.70 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.note_gp_changes.rcu_process_callbacks.__do_softirq.irq_exit.smp_apic_ti=
mer_interrupt
      2.03 =C2=B1 27%    +187.1%       5.83 =C2=B1 29%  perf-profile.cycles=
-pp.page_fault
      0.02 =C2=B1 33%   +3533.3%       0.54 =C2=B1 57%  perf-profile.cycles=
-pp.path_lookupat.filename_lookup.user_path_at_empty.vfs_fstatat.SYSC_newst=
at
      0.06 =C2=B1 34%   +1572.0%       1.05 =C2=B1 16%  perf-profile.cycles=
-pp.path_openat.do_filp_open.do_sys_open.sys_open.entry_SYSCALL_64_fastpath
      0.14 =C2=B1 26%   +2436.2%       3.68 =C2=B1  4%  perf-profile.cycles=
-pp.perf_duration_warn.irq_work_run_list.irq_work_run.smp_irq_work_interrup=
t.irq_work_interrupt
      1.61 =C2=B1 12%     -66.8%       0.53 =C2=B1 39%  perf-profile.cycles=
-pp.perf_event_task_tick.scheduler_tick.update_process_times.tick_sched_han=
dle.tick_sched_timer
      0.87 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.physflat_send_IPI_mask.native_send_call_func_ipi.smp_call_function_many=
.native_flush_tlb_others.flush_tlb_page
      0.03 =C2=B1 33%   +5258.3%       1.61 =C2=B1 16%  perf-profile.cycles=
-pp.pick_next_task_fair.__schedule.schedule.exit_to_usermode_loop.prepare_e=
xit_to_usermode
      0.14 =C2=B1 15%    +664.3%       1.07 =C2=B1 48%  perf-profile.cycles=
-pp.pick_next_task_fair.__schedule.schedule.exit_to_usermode_loop.syscall_r=
eturn_slowpath
     20.51 =C2=B1  3%     -47.3%      10.81 =C2=B1 14%  perf-profile.cycles=
-pp.pipe_read.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      0.15 =C2=B1 31%   +1201.6%       1.99 =C2=B1 22%  perf-profile.cycles=
-pp.pipe_wait.pipe_read.__vfs_read.vfs_read.sys_read
     13.80 =C2=B1  9%     +30.7%      18.04 =C2=B1 12%  perf-profile.cycles=
-pp.pipe_write.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      0.29 =C2=B1 14%    +865.8%       2.83 =C2=B1 21%  perf-profile.cycles=
-pp.prepare_exit_to_usermode.retint_user
      1.16 =C2=B1 14%    +428.2%       6.14 =C2=B1  9%  perf-profile.cycles=
-pp.print_context_stack.dump_trace.save_stack_trace_tsk.__account_scheduler=
_latency.enqueue_entity
      0.14 =C2=B1 26%   +2436.2%       3.68 =C2=B1  4%  perf-profile.cycles=
-pp.printk.perf_duration_warn.irq_work_run_list.irq_work_run.smp_irq_work_i=
nterrupt
      0.12 =C2=B1 15%   +1026.5%       1.38 =C2=B1 24%  perf-profile.cycles=
-pp.proc_reg_read.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      0.43 =C2=B1 24%   +1080.1%       5.04 =C2=B1 95%  perf-profile.cycles=
-pp.process_one_work.worker_thread.kthread.ret_from_fork
      0.06 =C2=B1 55%   +2370.8%       1.48 =C2=B1 18%  perf-profile.cycles=
-pp.process_timeout.call_timer_fn.run_timer_softirq.__do_softirq.irq_exit
      1.25 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.ptep_clear_flush.try_to_unmap_one.rmap_walk.try_to_unmap.migrate_pages
      1.34 =C2=B1 20%     -62.8%       0.50 =C2=B1 26%  perf-profile.cycles=
-pp.put_page.anon_pipe_buf_release.pipe_read.__vfs_read.vfs_read
      2.73 =C2=B1 11%     -80.5%       0.53 =C2=B1 39%  perf-profile.cycles=
-pp.rcu_check_callbacks.update_process_times.tick_sched_handle.tick_sched_t=
imer.__hrtimer_run_queues
      0.04 =C2=B1 72%   +2831.2%       1.17 =C2=B1 38%  perf-profile.cycles=
-pp.rcu_gp_kthread.kthread.ret_from_fork
      2.26 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.rcu_process_callbacks.__do_softirq.irq_exit.smp_apic_timer_interrupt.ap=
ic_timer_interrupt
      0.52 =C2=B1 27%   +1133.3%       6.48 =C2=B1 22%  perf-profile.cycles=
-pp.read
      0.49 =C2=B1 87%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel
      0.68 =C2=B1 17%   +1182.3%       8.69 =C2=B1 57%  perf-profile.cycles=
-pp.ret_from_fork
      0.32 =C2=B1 14%    +800.0%       2.88 =C2=B1 23%  perf-profile.cycles=
-pp.retint_user
      0.44 =C2=B1  7%    +770.8%       3.88 =C2=B1 19%  perf-profile.cycles=
-pp.return_from_execve.execve
      1.26 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.rmap_walk.try_to_unmap.migrate_pages.migrate_misplaced_page.handle_mm_f=
ault
      0.64 =C2=B1 14%    +232.2%       2.12 =C2=B1 19%  perf-profile.cycles=
-pp.run_timer_softirq.__do_softirq.irq_exit.smp_apic_timer_interrupt.apic_t=
imer_interrupt
      0.08 =C2=B1 29%   +1253.1%       1.08 =C2=B1 22%  perf-profile.cycles=
-pp.rw_verify_area.vfs_write.sys_write.entry_SYSCALL_64_fastpath.write
      1.29 =C2=B1 15%    +435.7%       6.91 =C2=B1  5%  perf-profile.cycles=
-pp.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entity.enqueue=
_task_fair.activate_task
      0.06 =C2=B1 23%   +3976.0%       2.55 =C2=B1 24%  perf-profile.cycles=
-pp.schedule.exit_to_usermode_loop.prepare_exit_to_usermode.retint_user
      0.03 =C2=B1 62%   +4592.3%       1.52 =C2=B1 53%  perf-profile.cycles=
-pp.schedule.exit_to_usermode_loop.syscall_return_slowpath.int_ret_from_sys=
_call.write
      0.13 =C2=B1 30%   +1130.8%       1.60 =C2=B1 27%  perf-profile.cycles=
-pp.schedule.pipe_wait.pipe_read.__vfs_read.vfs_read
     17.18 =C2=B1  9%     -79.0%       3.61 =C2=B1 28%  perf-profile.cycles=
-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer.=
__hrtimer_run_queues
      0.31 =C2=B1  9%    +693.6%       2.48 =C2=B1 25%  perf-profile.cycles=
-pp.search_binary_handler.do_execveat_common.sys_execve.return_from_execve.=
execve
      0.09 =C2=B1 24%    +897.3%       0.92 =C2=B1 26%  perf-profile.cycles=
-pp.security_file_permission.rw_verify_area.vfs_write.sys_write.entry_SYSCA=
LL_64_fastpath
      0.07 =C2=B1 28%    +866.7%       0.65 =C2=B1 39%  perf-profile.cycles=
-pp.selinux_file_permission.security_file_permission.rw_verify_area.vfs_wri=
te.sys_write
      0.11 =C2=B1 15%   +1071.1%       1.32 =C2=B1 26%  perf-profile.cycles=
-pp.seq_read.proc_reg_read.__vfs_read.vfs_read.sys_read
      0.15 =C2=B1  8%   +2286.4%       3.52 =C2=B1  6%  perf-profile.cycles=
-pp.serial8250_console_putchar.uart_console_write.serial8250_console_write.=
univ8250_console_write.call_console_drivers
      0.13 =C2=B1 27%   +2556.6%       3.52 =C2=B1  6%  perf-profile.cycles=
-pp.serial8250_console_write.univ8250_console_write.call_console_drivers.co=
nsole_unlock.vprintk_emit
     35.62 =C2=B1  9%     -60.9%      13.92 =C2=B1 23%  perf-profile.cycles=
-pp.smp_apic_timer_interrupt.apic_timer_interrupt
      1.24 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.smp_call_function_many.native_flush_tlb_others.flush_tlb_page.ptep_clea=
r_flush.try_to_unmap_one
      0.14 =C2=B1 26%   +2436.2%       3.68 =C2=B1  4%  perf-profile.cycles=
-pp.smp_irq_work_interrupt.irq_work_interrupt
      0.49 =C2=B1 87%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.start_kernel.x86_64_start_reservations.x86_64_start_kernel
     17.31 =C2=B1 36%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.start_secondary
      0.19 =C2=B1 16%   +1094.8%       2.30 =C2=B1 15%  perf-profile.cycles=
-pp.sys_clone.entry_SYSCALL_64_fastpath.__libc_fork
      0.44 =C2=B1  7%    +770.8%       3.88 =C2=B1 19%  perf-profile.cycles=
-pp.sys_execve.return_from_execve.execve
      0.13 =C2=B1 17%   +1409.4%       2.00 =C2=B1 14%  perf-profile.cycles=
-pp.sys_exit_group.entry_SYSCALL_64_fastpath
      1.99 =C2=B1 13%     -67.1%       0.66 =C2=B1 70%  perf-profile.cycles=
-pp.sys_futex.entry_SYSCALL_64_fastpath
      0.08 =C2=B1 31%   +1850.0%       1.66 =C2=B1 34%  perf-profile.cycles=
-pp.sys_mmap.entry_SYSCALL_64_fastpath
      0.09 =C2=B1 27%   +1794.3%       1.66 =C2=B1 34%  perf-profile.cycles=
-pp.sys_mmap_pgoff.sys_mmap.entry_SYSCALL_64_fastpath
      0.09 =C2=B1 21%   +1091.4%       1.04 =C2=B1 46%  perf-profile.cycles=
-pp.sys_mprotect.entry_SYSCALL_64_fastpath
     20.46 =C2=B1  4%     -55.6%       9.09 =C2=B1 12%  perf-profile.cycles=
-pp.sys_read.entry_SYSCALL_64_fastpath
      0.47 =C2=B1 31%   +1045.3%       5.44 =C2=B1 21%  perf-profile.cycles=
-pp.sys_read.entry_SYSCALL_64_fastpath.read
     13.32 =C2=B1  9%     -44.4%       7.41 =C2=B1 19%  perf-profile.cycles=
-pp.sys_write.entry_SYSCALL_64_fastpath
      0.91 =C2=B1 18%   +1388.1%      13.47 =C2=B1  7%  perf-profile.cycles=
-pp.sys_write.entry_SYSCALL_64_fastpath.write
      0.04 =C2=B1 66%   +4253.3%       1.63 =C2=B1 47%  perf-profile.cycles=
-pp.syscall_return_slowpath.int_ret_from_sys_call.write
     12.22 =C2=B1  9%     -88.2%       1.44 =C2=B1 23%  perf-profile.cycles=
-pp.task_tick_fair.scheduler_tick.update_process_times.tick_sched_handle.ti=
ck_sched_timer
      0.15 =C2=B1 42%    +880.6%       1.52 =C2=B1 41%  perf-profile.cycles=
-pp.tick_do_update_jiffies64.tick_sched_do_timer.tick_sched_timer.__hrtimer=
_run_queues.hrtimer_interrupt
      1.03 =C2=B1 13%     -78.7%       0.22 =C2=B1 81%  perf-profile.cycles=
-pp.tick_program_event.hrtimer_interrupt.local_apic_timer_interrupt.smp_api=
c_timer_interrupt.apic_timer_interrupt
      0.17 =C2=B1 47%    +926.5%       1.75 =C2=B1 26%  perf-profile.cycles=
-pp.tick_sched_do_timer.tick_sched_timer.__hrtimer_run_queues.hrtimer_inter=
rupt.local_apic_timer_interrupt
     23.17 =C2=B1  9%     -74.4%       5.92 =C2=B1 31%  perf-profile.cycles=
-pp.tick_sched_handle.isra.17.tick_sched_timer.__hrtimer_run_queues.hrtimer=
_interrupt.local_apic_timer_interrupt
     24.14 =C2=B1  9%     -67.0%       7.97 =C2=B1 27%  perf-profile.cycles=
-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.local_apic_time=
r_interrupt.smp_apic_timer_interrupt
      1.33 =C2=B1 30%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.trigger_load_balance.scheduler_tick.update_process_times.tick_sched_han=
dle.tick_sched_timer
      1.26 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.try_to_unmap.migrate_pages.migrate_misplaced_page.handle_mm_fault.__do_=
page_fault
      1.26 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.try_to_unmap_one.rmap_walk.try_to_unmap.migrate_pages.migrate_misplaced=
_page
      0.92 =C2=B1 22%    +739.8%       7.70 =C2=B1  6%  perf-profile.cycles=
-pp.try_to_wake_up.default_wake_function.autoremove_wake_function.__wake_up=
_common.__wake_up_sync_key
      0.05 =C2=B1 48%   +2645.0%       1.37 =C2=B1 11%  perf-profile.cycles=
-pp.try_to_wake_up.wake_up_process.process_timeout.call_timer_fn.run_timer_=
softirq
      0.72 =C2=B1 18%    +986.4%       7.79 =C2=B1  5%  perf-profile.cycles=
-pp.ttwu_do_activate.constprop.86.try_to_wake_up.default_wake_function.auto=
remove_wake_function.__wake_up_common
      0.05 =C2=B1 54%   +2315.0%       1.21 =C2=B1  6%  perf-profile.cycles=
-pp.ttwu_do_activate.constprop.86.try_to_wake_up.wake_up_process.process_ti=
meout.call_timer_fn
      0.03 =C2=B1 45%   +1876.9%       0.64 =C2=B1 51%  perf-profile.cycles=
-pp.ttwu_do_wakeup.ttwu_do_activate.try_to_wake_up.default_wake_function.au=
toremove_wake_function
      0.15 =C2=B1  8%   +2286.4%       3.52 =C2=B1  6%  perf-profile.cycles=
-pp.uart_console_write.serial8250_console_write.univ8250_console_write.call=
_console_drivers.console_unlock
      0.13 =C2=B1 27%   +2556.6%       3.52 =C2=B1  6%  perf-profile.cycles=
-pp.univ8250_console_write.call_console_drivers.console_unlock.vprintk_emit=
.vprintk_default
      0.07 =C2=B1 39%   +1706.9%       1.31 =C2=B1 53%  perf-profile.cycles=
-pp.unlock_page.filemap_map_pages.handle_mm_fault.__do_page_fault.do_page_f=
ault
      0.11 =C2=B1 31%   +1378.6%       1.55 =C2=B1 38%  perf-profile.cycles=
-pp.unmap_page_range.unmap_single_vma.unmap_vmas.exit_mmap.mmput
      0.07 =C2=B1 42%   +1544.4%       1.11 =C2=B1 36%  perf-profile.cycles=
-pp.unmap_single_vma.unmap_vmas.exit_mmap.mmput.do_exit
      0.07 =C2=B1 39%   +1607.7%       1.11 =C2=B1 36%  perf-profile.cycles=
-pp.unmap_vmas.exit_mmap.mmput.do_exit.do_group_exit
      7.36 =C2=B1 11%     -94.1%       0.43 =C2=B1 31%  perf-profile.cycles=
-pp.update_cfs_shares.task_tick_fair.scheduler_tick.update_process_times.ti=
ck_sched_handle
      0.94 =C2=B1 11%     -67.5%       0.31 =C2=B1 39%  perf-profile.cycles=
-pp.update_curr.task_tick_fair.scheduler_tick.update_process_times.tick_sch=
ed_handle
     22.60 =C2=B1  9%     -75.0%       5.64 =C2=B1 33%  perf-profile.cycles=
-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_q=
ueues.hrtimer_interrupt
      0.14 =C2=B1 42%    +822.2%       1.25 =C2=B1 47%  perf-profile.cycles=
-pp.update_wall_time.tick_do_update_jiffies64.tick_sched_do_timer.tick_sche=
d_timer.__hrtimer_run_queues
      0.02 =C2=B1 33%   +3883.3%       0.60 =C2=B1 67%  perf-profile.cycles=
-pp.user_path_at_empty.vfs_fstatat.SYSC_newstat.sys_newstat.entry_SYSCALL_6=
4_fastpath
     20.45 =C2=B1  4%     -55.5%       9.09 =C2=B1 12%  perf-profile.cycles=
-pp.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      0.47 =C2=B1 30%   +1021.8%       5.27 =C2=B1 21%  perf-profile.cycles=
-pp.vfs_read.sys_read.entry_SYSCALL_64_fastpath.read
     13.28 =C2=B1  9%     -44.2%       7.41 =C2=B1 19%  perf-profile.cycles=
-pp.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      0.86 =C2=B1 19%   +1420.4%      13.04 =C2=B1  7%  perf-profile.cycles=
-pp.vfs_write.sys_write.entry_SYSCALL_64_fastpath.write
      0.08 =C2=B1 27%   +1968.8%       1.65 =C2=B1 34%  perf-profile.cycles=
-pp.vm_mmap_pgoff.sys_mmap_pgoff.sys_mmap.entry_SYSCALL_64_fastpath
      0.14 =C2=B1 26%   +2436.2%       3.68 =C2=B1  4%  perf-profile.cycles=
-pp.vprintk_default.printk.perf_duration_warn.irq_work_run_list.irq_work_run
      0.14 =C2=B1 26%   +2436.2%       3.68 =C2=B1  4%  perf-profile.cycles=
-pp.vprintk_emit.vprintk_default.printk.perf_duration_warn.irq_work_run_list
      0.15 =C2=B1  7%   +2212.1%       3.35 =C2=B1  5%  perf-profile.cycles=
-pp.wait_for_xmitr.serial8250_console_putchar.uart_console_write.serial8250=
_console_write.univ8250_console_write
      0.05 =C2=B1 47%   +2723.8%       1.48 =C2=B1 18%  perf-profile.cycles=
-pp.wake_up_process.process_timeout.call_timer_fn.run_timer_softirq.__do_so=
ftirq
      0.45 =C2=B1 22%   +1057.2%       5.21 =C2=B1 94%  perf-profile.cycles=
-pp.worker_thread.kthread.ret_from_fork
      1.02 =C2=B1 15%   +1487.7%      16.20 =C2=B1 10%  perf-profile.cycles=
-pp.write
      0.49 =C2=B1 87%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.x86_64_start_kernel
      0.49 =C2=B1 87%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.x86_64_start_reservations.x86_64_start_kernel

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/load/rootfs/tbox_group/test/testcase:
  gcc-4.9/powersave/x86_64-rhel/6000/debian-x86_64-2015-02-07.cgz/brickland=
1/page_test/aim7

commit: =

  8025943c32f5de29b3fd548e917e24424297ca73
  0aefb957de5f2a1d9467126114146b6c793cf180

8025943c32f5de29 0aefb957de5f2a1d9467126114 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     92222 =C2=B1  0%     -90.8%       8479 =C2=B1  0%  aim7.jobs-per-min
    392.70 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  aim7.time.elapsed_t=
ime
    392.70 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  aim7.time.elapsed_t=
ime.max
   8461942 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  aim7.time.involunta=
ry_context_switches
      7865 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  aim7.time.maximum_r=
esident_set_size
 9.618e+08 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  aim7.time.minor_pag=
e_faults
      4096 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  aim7.time.page_size
     43770 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  aim7.time.system_ti=
me
      1310 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  aim7.time.user_time
   1379465 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  aim7.time.voluntary=
_context_switches
    392.70 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  time.elapsed_time
    392.70 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  time.elapsed_time.m=
ax
   8461942 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  time.involuntary_co=
ntext_switches
      7865 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  time.maximum_reside=
nt_set_size
 9.618e+08 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  time.minor_page_fau=
lts
      4096 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  time.page_size
     11479 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  time.percent_of_cpu=
_this_job_got
     43770 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  time.system_time
      1310 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  time.user_time
   1379465 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  time.voluntary_cont=
ext_switches
      0.00 =C2=B1 -1%      +Inf%      15.15 =C2=B1 14%  perf-profile.cycles=
-pp.___might_sleep.unmap_page_range.unmap_single_vma.unmap_vmas.unmap_region
      0.00 =C2=B1 -1%      +Inf%       3.56 =C2=B1 15%  perf-profile.cycles=
-pp.___might_sleep.unmap_single_vma.unmap_vmas.unmap_region.do_munmap
     27.21 =C2=B1 13%     -56.4%      11.86 =C2=B1 61%  perf-profile.cycles=
-pp.__do_page_fault.do_page_fault.page_fault
     18.62 =C2=B1 23%    -100.0%       0.01 =C2=B1100%  perf-profile.cycles=
-pp.__hrtimer_run_queues.hrtimer_interrupt.local_apic_timer_interrupt.smp_a=
pic_timer_interrupt.apic_timer_interrupt
      0.00 =C2=B1 -1%      +Inf%       1.01 =C2=B1  9%  perf-profile.cycles=
-pp.__list_del_entry.list_del.free_pcppages_bulk.free_hot_cold_page.free_ho=
t_cold_page_list
     14.18 =C2=B1 28%     -99.9%       0.01 =C2=B1110%  perf-profile.cycles=
-pp.__percpu_counter_add.__vm_enough_memory.security_vm_enough_memory_mm.do=
_brk.sys_brk
     15.62 =C2=B1 25%     -99.8%       0.03 =C2=B1 45%  perf-profile.cycles=
-pp.__vm_enough_memory.security_vm_enough_memory_mm.do_brk.sys_brk.entry_SY=
SCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%       2.00 =C2=B1 19%  perf-profile.cycles=
-pp._cond_resched.unmap_single_vma.unmap_vmas.unmap_region.do_munmap
      8.68 =C2=B1 54%     -99.6%       0.04 =C2=B1 29%  perf-profile.cycles=
-pp._raw_spin_lock.free_pcppages_bulk.free_hot_cold_page.free_hot_cold_page=
_list.release_pages
      2.41 =C2=B1 36%     -99.9%       0.00 =C2=B1173%  perf-profile.cycles=
-pp._raw_spin_lock.get_page_from_freelist.__alloc_pages_nodemask.alloc_page=
s_vma.handle_mm_fault
      0.00 =C2=B1 -1%      +Inf%       1.08 =C2=B1 65%  perf-profile.cycles=
-pp._raw_spin_lock.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
     11.48 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp._raw_spin_lock_irqsave.__percpu_counter_add.__vm_enough_memory.security=
_vm_enough_memory_mm.do_brk
      0.99 =C2=B1 34%     -99.3%       0.01 =C2=B1 70%  perf-profile.cycles=
-pp._raw_spin_lock_irqsave.pagevec_lru_move_fn.__lru_cache_add.lru_cache_ad=
d_active_or_unevictable.handle_mm_fault
      8.13 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.apic_timer_interrupt.__alloc_pages_nodemask.alloc_pages_vma.handle_mm_f=
ault.__do_page_fault
      2.87 =C2=B1 29%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.apic_timer_interrupt.__percpu_counter_add.__vm_enough_memory.security_v=
m_enough_memory_mm.do_brk
      1.11 =C2=B1 30%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.apic_timer_interrupt.do_page_fault.page_fault
      1.17 =C2=B1  5%     -99.6%       0.01 =C2=B1100%  perf-profile.cycles=
-pp.apic_timer_interrupt.free_hot_cold_page_list.release_pages.free_pages_a=
nd_swap_cache.tlb_flush_mmu_free
      2.13 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.apic_timer_interrupt.pagevec_lru_move_fn.__lru_cache_add.lru_cache_add_=
active_or_unevictable.handle_mm_fault
      2.62 =C2=B1 24%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.apic_timer_interrupt.perf_event_mmap.do_brk.sys_brk.entry_SYSCALL_64_fa=
stpath
      2.41 =C2=B1 14%     -99.6%       0.01 =C2=B1-10000%  perf-profile.cyc=
les-pp.apic_timer_interrupt.unmap_single_vma.unmap_vmas.unmap_region.do_mun=
map
      0.02 =C2=B1127%  +27000.0%       6.10 =C2=B1 58%  perf-profile.cycles=
-pp.clear_page_c_e.__alloc_pages_nodemask.alloc_pages_vma.handle_mm_fault._=
_do_page_fault
     33.43 =C2=B1 15%     -89.8%       3.41 =C2=B1 65%  perf-profile.cycles=
-pp.do_brk.sys_brk.entry_SYSCALL_64_fastpath
     22.17 =C2=B1 26%    +265.1%      80.92 =C2=B1 13%  perf-profile.cycles=
-pp.do_munmap.sys_brk.entry_SYSCALL_64_fastpath
     29.94 =C2=B1 13%     -60.2%      11.91 =C2=B1 60%  perf-profile.cycles=
-pp.do_page_fault.page_fault
     63.35 =C2=B1  3%     +34.3%      85.06 =C2=B1 10%  perf-profile.cycles=
-pp.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%       0.92 =C2=B1 16%  perf-profile.cycles=
-pp.free_pages_prepare.free_hot_cold_page.free_hot_cold_page_list.release_p=
ages.free_pages_and_swap_cache
      0.00 =C2=B1 -1%      +Inf%      10.19 =C2=B1 22%  perf-profile.cycles=
-pp.free_pgd_range.free_pgtables.unmap_region.do_munmap.sys_brk
      0.00 =C2=B1 -1%      +Inf%      10.25 =C2=B1 22%  perf-profile.cycles=
-pp.free_pgtables.unmap_region.do_munmap.sys_brk.entry_SYSCALL_64_fastpath
     24.26 =C2=B1 13%     -52.7%      11.46 =C2=B1 61%  perf-profile.cycles=
-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      8.75 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_timer_interrupt.a=
pic_timer_interrupt.__alloc_pages_nodemask
      2.81 =C2=B1 29%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_timer_interrupt.a=
pic_timer_interrupt.__percpu_counter_add
      1.10 =C2=B1 30%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_timer_interrupt.a=
pic_timer_interrupt.do_page_fault
      1.10 =C2=B1  5%     -99.5%       0.01 =C2=B1100%  perf-profile.cycles=
-pp.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_timer_interrupt.a=
pic_timer_interrupt.free_hot_cold_page_list
      2.12 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_timer_interrupt.a=
pic_timer_interrupt.pagevec_lru_move_fn
      2.58 =C2=B1 24%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_timer_interrupt.a=
pic_timer_interrupt.perf_event_mmap
      2.34 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_timer_interrupt.a=
pic_timer_interrupt.unmap_single_vma
      1.44 =C2=B1 30%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.ktime_get.clockevents_program_event.tick_program_event.hrtimer_interrup=
t.local_apic_timer_interrupt
      4.88 =C2=B1 28%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.ktime_get.sched_clock_tick.scheduler_tick.update_process_times.tick_sch=
ed_handle
      7.50 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.ktime_get.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.local=
_apic_timer_interrupt
      1.07 =C2=B1 46%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.ktime_get_update_offsets_now.hrtimer_interrupt.local_apic_timer_interru=
pt.smp_apic_timer_interrupt.apic_timer_interrupt
      0.00 =C2=B1 -1%      +Inf%       1.39 =C2=B1 14%  perf-profile.cycles=
-pp.list_del.free_pcppages_bulk.free_hot_cold_page.free_hot_cold_page_list.=
release_pages
      0.74 =C2=B1 25%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interrup=
t.__alloc_pages_nodemask.alloc_pages_current
      7.98 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interrup=
t.__alloc_pages_nodemask.alloc_pages_vma
      2.81 =C2=B1 29%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interrup=
t.__percpu_counter_add.__vm_enough_memory
      1.10 =C2=B1 30%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interrup=
t.do_page_fault.page_fault
      1.11 =C2=B1  5%     -99.5%       0.01 =C2=B1100%  perf-profile.cycles=
-pp.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interrup=
t.free_hot_cold_page_list.release_pages
      2.09 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interrup=
t.pagevec_lru_move_fn.__lru_cache_add
      2.58 =C2=B1 24%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interrup=
t.perf_event_mmap.do_brk
      2.34 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interrup=
t.unmap_single_vma.unmap_vmas
      0.00 =C2=B1 -1%      +Inf%       0.65 =C2=B1 61%  perf-profile.cycles=
-pp.mem_cgroup_try_charge.handle_mm_fault.__do_page_fault.do_page_fault.pag=
e_fault
      0.00 =C2=B1 -1%      +Inf%       0.73 =C2=B1 59%  perf-profile.cycles=
-pp.native_irq_return_iret
     13.20 =C2=B1 24%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock.free_pcppages_bulk.free=
_hot_cold_page.free_hot_cold_page_list
      3.95 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock.get_page_from_freelist.=
__alloc_pages_nodemask.alloc_pages_vma
     17.57 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__percpu_counte=
r_add.__vm_enough_memory.security_vm_enough_memory_mm
      1.48 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.pagevec_lru_mov=
e_fn.__lru_cache_add.lru_cache_add_active_or_unevictable
     30.13 =C2=B1 12%     -60.4%      11.94 =C2=B1 60%  perf-profile.cycles=
-pp.page_fault
      0.00 =C2=B1 -1%      +Inf%       2.19 =C2=B1 17%  perf-profile.cycles=
-pp.page_remove_rmap.unmap_page_range.unmap_single_vma.unmap_vmas.unmap_reg=
ion
      0.02 =C2=B1-5000%   +9550.0%       1.93 =C2=B1 62%  perf-profile.cycl=
es-pp.perf_event_aux.perf_event_mmap.do_brk.sys_brk.entry_SYSCALL_64_fastpa=
th
      0.04 =C2=B1 73%   +5170.6%       2.24 =C2=B1 63%  perf-profile.cycles=
-pp.perf_event_mmap.do_brk.sys_brk.entry_SYSCALL_64_fastpath
      2.06 =C2=B1 21%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.read_hpet.ktime_get.clockevents_program_event.tick_program_event.hrtime=
r_interrupt
      7.23 =C2=B1 23%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.read_hpet.ktime_get.sched_clock_tick.scheduler_tick.update_process_times
     11.48 =C2=B1 25%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.read_hpet.ktime_get.tick_sched_timer.__hrtimer_run_queues.hrtimer_inter=
rupt
     10.70 =C2=B1 27%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.read_hpet.ktime_get_update_offsets_now.hrtimer_interrupt.local_apic_tim=
er_interrupt.smp_apic_timer_interrupt
      1.02 =C2=B1 55%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer.=
__hrtimer_run_queues
     17.45 =C2=B1 20%     -98.3%       0.30 =C2=B1 59%  perf-profile.cycles=
-pp.security_vm_enough_memory_mm.do_brk.sys_brk.entry_SYSCALL_64_fastpath
      8.09 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.smp_apic_timer_interrupt.apic_timer_interrupt.__alloc_pages_nodemask.al=
loc_pages_vma.handle_mm_fault
      2.85 =C2=B1 29%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.smp_apic_timer_interrupt.apic_timer_interrupt.__percpu_counter_add.__vm=
_enough_memory.security_vm_enough_memory_mm
      1.11 =C2=B1 29%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.smp_apic_timer_interrupt.apic_timer_interrupt.do_page_fault.page_fault
      1.16 =C2=B1  4%     -99.6%       0.01 =C2=B1100%  perf-profile.cycles=
-pp.smp_apic_timer_interrupt.apic_timer_interrupt.free_hot_cold_page_list.r=
elease_pages.free_pages_and_swap_cache
      2.12 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.smp_apic_timer_interrupt.apic_timer_interrupt.pagevec_lru_move_fn.__lru=
_cache_add.lru_cache_add_active_or_unevictable
      2.62 =C2=B1 24%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.smp_apic_timer_interrupt.apic_timer_interrupt.perf_event_mmap.do_brk.sy=
s_brk
      2.40 =C2=B1 14%     -99.6%       0.01 =C2=B1-10000%  perf-profile.cyc=
les-pp.smp_apic_timer_interrupt.apic_timer_interrupt.unmap_single_vma.unmap=
_vmas.unmap_region
     62.91 =C2=B1  3%     +34.7%      84.73 =C2=B1 10%  perf-profile.cycles=
-pp.sys_brk.entry_SYSCALL_64_fastpath
      2.01 =C2=B1 56%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.tick_sched_handle.isra.17.tick_sched_timer.__hrtimer_run_queues.hrtimer=
_interrupt.local_apic_timer_interrupt
     17.39 =C2=B1 24%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.local_apic_time=
r_interrupt.smp_apic_timer_interrupt
      0.01 =C2=B1-10000%  +4.6e+05%      45.80 =C2=B1 14%  perf-profile.cyc=
les-pp.unmap_page_range.unmap_single_vma.unmap_vmas.unmap_region.do_munmap
     22.09 =C2=B1 26%    +265.6%      80.76 =C2=B1 13%  perf-profile.cycles=
-pp.unmap_region.do_munmap.sys_brk.entry_SYSCALL_64_fastpath
      0.04 =C2=B1 82%  +1.5e+05%      51.84 =C2=B1 15%  perf-profile.cycles=
-pp.unmap_single_vma.unmap_vmas.unmap_region.do_munmap.sys_brk
      0.04 =C2=B1 82%  +1.5e+05%      51.86 =C2=B1 15%  perf-profile.cycles=
-pp.unmap_vmas.unmap_region.do_munmap.sys_brk.entry_SYSCALL_64_fastpath
      1.91 =C2=B1 56%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_q=
ueues.hrtimer_interrupt
      0.00 =C2=B1 -1%      +Inf%       0.54 =C2=B1 66%  perf-profile.cycles=
-pp.vma_merge.do_brk.sys_brk.entry_SYSCALL_64_fastpath

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/filesize/fs/iterations/kconfig/nr_directorie=
s/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_size=
/testcase:
  gcc-4.9/performance/1HDD/9B/f2fs/1x/x86_64-rhel/16d/256fpd/32t/debian-x86=
_64-2015-02-07.cgz/fsyncBeforeClose/nhm4/400M/fsmark

commit: =

  8025943c32f5de29b3fd548e917e24424297ca73
  0aefb957de5f2a1d9467126114146b6c793cf180

8025943c32f5de29 0aefb957de5f2a1d9467126114 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   4027079 =C2=B1 10%    +109.1%    8418766 =C2=B1  3%  fsmark.app_overhead
      1355 =C2=B1  0%     +26.7%       1716 =C2=B1  0%  fsmark.files_per_sec
     76.33 =C2=B1  0%     -21.0%      60.28 =C2=B1  0%  fsmark.time.elapsed=
_time
     76.33 =C2=B1  0%     -21.0%      60.28 =C2=B1  0%  fsmark.time.elapsed=
_time.max
   1896890 =C2=B1  0%      -1.1%    1875796 =C2=B1  0%  fsmark.time.file_sy=
stem_outputs
     21424 =C2=B1  1%      -9.8%      19326 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
     36.00 =C2=B1  0%     -80.6%       7.00 =C2=B1  0%  fsmark.time.percent=
_of_cpu_this_job_got
     27.05 =C2=B1  0%     -85.3%       3.97 =C2=B1  0%  fsmark.time.system_=
time
    975566 =C2=B1  0%     -76.9%     225370 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
     52132 =C2=B1  6%     -30.4%      36260 =C2=B1  4%  meminfo.DirectMap4k
    519.97 =C2=B1  0%     -87.0%      67.41 =C2=B1130%  uptime.idle
     51034 =C2=B1  0%     -83.4%       8476 =C2=B1  0%  proc-vmstat.pgactiv=
ate
    107205 =C2=B1  0%     -15.7%      90362 =C2=B1  0%  proc-vmstat.pgfault
     93793 =C2=B1  1%     -12.6%      81987 =C2=B1  3%  proc-vmstat.pgfree
     17409 =C2=B1  0%    +176.1%      48062 =C2=B1  0%  softirqs.BLOCK
     22860 =C2=B1  2%     -80.8%       4380 =C2=B1  4%  softirqs.RCU
     21946 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  softirqs.SCHED
      4.71 =C2=B1  0%    +122.6%      10.48 =C2=B1  0%  turbostat.%Busy
    146.25 =C2=B1  0%    +138.8%     349.25 =C2=B1  0%  turbostat.Avg_MHz
     62.05 =C2=B1  0%     +44.3%      89.52 =C2=B1  0%  turbostat.CPU%c1
     21.54 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  turbostat.CPU%c3
     11.71 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  turbostat.CPU%c6
      6857 =C2=B1  0%     +23.5%       8467 =C2=B1  0%  vmstat.io.bo
    605.00 =C2=B1  1%     -64.6%     214.00 =C2=B1  1%  vmstat.memory.buff
      9.25 =C2=B1  8%     -40.5%       5.50 =C2=B1  9%  vmstat.procs.b
     25176 =C2=B1  1%     -67.8%       8100 =C2=B1  0%  vmstat.system.cs
      1315 =C2=B1  1%     +39.3%       1831 =C2=B1  0%  vmstat.system.in
     76.33 =C2=B1  0%     -21.0%      60.28 =C2=B1  0%  time.elapsed_time
     76.33 =C2=B1  0%     -21.0%      60.28 =C2=B1  0%  time.elapsed_time.m=
ax
     36.00 =C2=B1  0%     -80.6%       7.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
     27.05 =C2=B1  0%     -85.3%       3.97 =C2=B1  0%  time.system_time
      0.89 =C2=B1  4%     -42.7%       0.51 =C2=B1  1%  time.user_time
    975566 =C2=B1  0%     -76.9%     225370 =C2=B1  0%  time.voluntary_cont=
ext_switches
  2.28e+08 =C2=B1  0%     -88.1%   27227040 =C2=B1  0%  cpuidle.C1-NHM.time
    334829 =C2=B1  1%     -84.8%      50823 =C2=B1  0%  cpuidle.C1-NHM.usage
  38611787 =C2=B1  1%     -90.3%    3750457 =C2=B1  1%  cpuidle.C1E-NHM.time
    122293 =C2=B1  1%     -96.4%       4383 =C2=B1  2%  cpuidle.C1E-NHM.usa=
ge
 1.793e+08 =C2=B1  1%     -94.7%    9496358 =C2=B1  1%  cpuidle.C3-NHM.time
    259062 =C2=B1  0%     -97.2%       7144 =C2=B1  2%  cpuidle.C3-NHM.usage
 1.448e+08 =C2=B1  2%     -90.1%   14263960 =C2=B1  1%  cpuidle.C6-NHM.time
    127979 =C2=B1  1%     -98.8%       1498 =C2=B1  2%  cpuidle.C6-NHM.usage
      2033 =C2=B1  8%     -67.7%     656.50 =C2=B1 12%  cpuidle.POLL.time
    191.00 =C2=B1  4%     -63.6%      69.50 =C2=B1 15%  cpuidle.POLL.usage
    942.50 =C2=B1 16%    +848.0%       8934 =C2=B1 12%  latency_stats.avg.c=
all_rwsem_down_read_failed.f2fs_create.[f2fs].vfs_create.path_openat.do_fil=
p_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
      1549 =C2=B1  9%   +1421.1%      23570 =C2=B1  4%  latency_stats.avg.f=
2fs_write_data_pages.[f2fs].do_writepages.__filemap_fdatawrite_range.filema=
p_write_and_wait_range.f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_f=
sync.entry_SYSCALL_64_fastpath
     78.50 =C2=B1173%  +20853.2%      16448 =C2=B1 17%  latency_stats.avg.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].update_inode.[f2fs].update_inode_page.[f2fs].f2fs_write_end.[f2f=
s].generic_perform_write.__generic_file_write_iter.generic_file_write_iter.=
f2fs_file_write_iter.[f2fs].__vfs_write.vfs_write
     55103 =C2=B1  0%     -99.9%      33.25 =C2=B1 31%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].alloc_nid.[f2fs].f2fs_new_=
inode.[f2fs].f2fs_create.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_=
open.SyS_open.entry_SYSCALL_64_fastpath
     67547 =C2=B1  1%    -100.0%      23.00 =C2=B1 44%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_cre=
ate.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
     76671 =C2=B1  0%    -100.0%      27.00 =C2=B1 37%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_fi=
le_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs].__vfs_wri=
te.vfs_write.SyS_write
    109802 =C2=B1  0%    -100.0%      43.75 =C2=B1 43%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].get_new=
_data_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_create.[f2fs].vfs_create.path=
_openat.do_filp_open
     22906 =C2=B1  0%     -99.9%      22.75 =C2=B1 48%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_write_inline_data.[f2fs].f2f=
s_write_data_page.[f2fs].__f2fs_writepage.[f2fs].f2fs_write_cache_pages.[f2=
fs].f2fs_write_data_pages.[f2fs].do_writepages.__filemap_fdatawrite_range
     28676 =C2=B1  0%    -100.0%      12.75 =C2=B1 33%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].get_dnode_of_data.[f2fs].get_read_data_page.[f2fs].find_da=
ta_page.[f2fs].f2fs_find_entry.[f2fs].f2fs_lookup.[f2fs].lookup_real.path_o=
penat.do_filp_open
     61445 =C2=B1  0%    -100.0%      23.00 =C2=B1 38%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].update_inode_page.[f2fs].f2fs_write_end.[f2fs].generic_per=
form_write.__generic_file_write_iter.generic_file_write_iter.f2fs_file_writ=
e_iter.[f2fs].__vfs_write.vfs_write
     16009 =C2=B1  0%     -99.9%       9.75 =C2=B1 73%  latency_stats.hits.=
call_rwsem_down_read_failed.is_checkpointed_node.[f2fs].f2fs_sync_file.[f2f=
s].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     10285 =C2=B1  0%     -99.9%       7.75 =C2=B1 60%  latency_stats.hits.=
call_rwsem_down_read_failed.need_dentry_mark.[f2fs].sync_node_pages.[f2fs].=
f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_f=
astpath
     38496 =C2=B1  0%    -100.0%      11.25 =C2=B1 45%  latency_stats.hits.=
call_rwsem_down_read_failed.need_inode_block_update.[f2fs].f2fs_sync_file.[=
f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     66377 =C2=B1  0%    -100.0%      26.75 =C2=B1 35%  latency_stats.hits.=
call_rwsem_down_write_failed.get_node_info.[f2fs].alloc_nid.[f2fs].f2fs_new=
_inode.[f2fs].f2fs_create.[f2fs].vfs_create.path_openat.do_filp_open.do_sys=
_open.SyS_open.entry_SYSCALL_64_fastpath
     42333 =C2=B1  0%     -99.9%      27.25 =C2=B1 35%  latency_stats.hits.=
call_rwsem_down_write_failed.set_node_addr.[f2fs].f2fs_write_node_page.[f2f=
s].sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.Sy=
S_fsync.entry_SYSCALL_64_fastpath
     66623 =C2=B1  0%     -99.9%      34.25 =C2=B1 32%  latency_stats.hits.=
call_rwsem_down_write_failed.set_node_addr.[f2fs].new_node_page.[f2fs].new_=
inode_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_cr=
eate.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
     64133 =C2=B1  0%     -92.0%       5141 =C2=B1  2%  latency_stats.hits.=
f2fs_write_data_pages.[f2fs].do_writepages.__filemap_fdatawrite_range.filem=
ap_write_and_wait_range.f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_=
fsync.entry_SYSCALL_64_fastpath
      8423 =C2=B1  3%    +474.7%      48412 =C2=B1  2%  latency_stats.hits.=
pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
    892908 =C2=B1 41%     -72.7%     243382 =C2=B1 23%  latency_stats.max.f=
2fs_sync_fs.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync=
.entry_SYSCALL_64_fastpath
     78.50 =C2=B1173%  +28207.6%      22221 =C2=B1 13%  latency_stats.max.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].update_inode.[f2fs].update_inode_page.[f2fs].f2fs_write_end.[f2f=
s].generic_perform_write.__generic_file_write_iter.generic_file_write_iter.=
f2fs_file_write_iter.[f2fs].__vfs_write.vfs_write
    500239 =C2=B1  6%     -90.9%      45738 =C2=B1 34%  latency_stats.sum.a=
lloc_nid.[f2fs].f2fs_new_inode.[f2fs].f2fs_create.[f2fs].vfs_create.path_op=
enat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
     31619 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.add_free_nid.[f2fs].build_free_nids.[f2fs].alloc=
_nid.[f2fs].f2fs_new_inode.[f2fs].f2fs_create.[f2fs].vfs_create.path_openat=
.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
   1668876 =C2=B1  3%   +1100.0%   20026914 =C2=B1 11%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_create.[f2fs].vfs_create.path_openat.do_fil=
p_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
     50641 =C2=B1 56%    +712.2%     411336 =C2=B1 61%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_mkdir.[f2fs].vfs_mkdir.SyS_mkdir.entry_SYSC=
ALL_64_fastpath
    336517 =C2=B1  2%     -90.3%      32791 =C2=B1 20%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_=
page_writeback.[f2fs].wait_on_node_pages_writeback.[f2fs].f2fs_sync_file.[f=
2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
  11699569 =C2=B1  0%    -100.0%       1299 =C2=B1 46%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].alloc_nid.[f2fs].f2fs_new_i=
node.[f2fs].f2fs_create.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_o=
pen.SyS_open.entry_SYSCALL_64_fastpath
     48341 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].alloc_nid.[f2fs].f2fs_new_i=
node.[f2fs].f2fs_mkdir.[f2fs].vfs_mkdir.SyS_mkdir.entry_SYSCALL_64_fastpath
    942937 =C2=B1  0%    -100.0%     151.25 =C2=B1112%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].f2fs_write_node_page.[f2fs]=
.sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_=
fsync.entry_SYSCALL_64_fastpath
  14463821 =C2=B1  1%    -100.0%     703.75 =C2=B1 84%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].new_node_page.[f2fs].new_in=
ode_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_crea=
te.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
     63549 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].new_node_page.[f2fs].new_in=
ode_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_mkdi=
r.[f2fs].vfs_mkdir.SyS_mkdir.entry_SYSCALL_64_fastpath
  13106613 =C2=B1  0%    -100.0%     791.50 =C2=B1 71%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_fil=
e_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs].__vfs_writ=
e.vfs_write.SyS_write
     33684 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].do_write_data_page.[f2fs].f2fs_wri=
te_data_page.[f2fs].__f2fs_writepage.[f2fs].f2fs_write_cache_pages.[f2fs].f=
2fs_write_data_pages.[f2fs].do_writepages.__filemap_fdatawrite_range
  28833316 =C2=B1  0%    -100.0%       1671 =C2=B1 88%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].get_new_=
data_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_create.[f2fs].vfs_create.path_=
openat.do_filp_open
     80281 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].get_new_=
data_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_mkdir.[f2fs].vfs_mkdir.SyS_mkd=
ir.entry_SYSCALL_64_fastpath
   2484259 =C2=B1  0%    -100.0%     416.25 =C2=B1 73%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_write_inline_data.[f2fs].f2fs=
_write_data_page.[f2fs].__f2fs_writepage.[f2fs].f2fs_write_cache_pages.[f2f=
s].f2fs_write_data_pages.[f2fs].do_writepages.__filemap_fdatawrite_range
     18328 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].get_read_data_page.[f2fs].find_dat=
a_page.[f2fs].f2fs_find_entry.[f2fs].f2fs_lookup.[f2fs].lookup_real.__looku=
p_hash.filename_create
   4566294 =C2=B1  0%    -100.0%     433.00 =C2=B1 43%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].get_read_data_page.[f2fs].find_dat=
a_page.[f2fs].f2fs_find_entry.[f2fs].f2fs_lookup.[f2fs].lookup_real.path_op=
enat.do_filp_open
    221064 =C2=B1  2%    -100.0%      26.75 =C2=B1 94%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].update_inode_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_create=
.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
     60653 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].update_inode_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_mkdir.=
[f2fs].vfs_mkdir.SyS_mkdir.entry_SYSCALL_64_fastpath
   8554135 =C2=B1  1%    -100.0%     581.75 =C2=B1 69%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].update_inode_page.[f2fs].f2fs_write_end.[f2fs].generic_perf=
orm_write.__generic_file_write_iter.generic_file_write_iter.f2fs_file_write=
_iter.[f2fs].__vfs_write.vfs_write
     21248 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].write_data_page.[f2fs].do_w=
rite_data_page.[f2fs].f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2fs].f=
2fs_write_cache_pages.[f2fs].f2fs_write_data_pages.[f2fs].do_writepages.__f=
ilemap_fdatawrite_range.filemap_fdatawrite.sync_dirty_dir_inodes.[f2fs]
   1753053 =C2=B1  0%    -100.0%     181.50 =C2=B1 94%  latency_stats.sum.c=
all_rwsem_down_read_failed.is_checkpointed_node.[f2fs].f2fs_sync_file.[f2fs=
].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
   1259144 =C2=B1  0%    -100.0%     180.50 =C2=B1 89%  latency_stats.sum.c=
all_rwsem_down_read_failed.need_dentry_mark.[f2fs].sync_node_pages.[f2fs].f=
2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fa=
stpath
   3130739 =C2=B1  1%    -100.0%     210.50 =C2=B1 57%  latency_stats.sum.c=
all_rwsem_down_read_failed.need_inode_block_update.[f2fs].f2fs_sync_file.[f=
2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
    805.00 =C2=B1 69%   +1614.6%      13802 =C2=B1 76%  latency_stats.sum.c=
all_rwsem_down_write_failed.f2fs_init_extent_tree.[f2fs].f2fs_new_inode.[f2=
fs].f2fs_create.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_=
open.entry_SYSCALL_64_fastpath
     68585 =C2=B1  4%     -98.3%       1180 =C2=B1 10%  latency_stats.sum.c=
all_rwsem_down_write_failed.f2fs_submit_merged_bio.[f2fs].sync_node_pages.[=
f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCAL=
L_64_fastpath
  14609333 =C2=B1  1%    -100.0%     889.25 =C2=B1 70%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].alloc_nid.[f2fs].f2fs_new_=
inode.[f2fs].f2fs_create.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_=
open.SyS_open.entry_SYSCALL_64_fastpath
     67081 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].alloc_nid.[f2fs].f2fs_new_=
inode.[f2fs].f2fs_mkdir.[f2fs].vfs_mkdir.SyS_mkdir.entry_SYSCALL_64_fastpath
   1766106 =C2=B1  1%    -100.0%     207.00 =C2=B1 65%  latency_stats.sum.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].f2fs_write_node_page.[f2fs=
].sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS=
_fsync.entry_SYSCALL_64_fastpath
  10660937 =C2=B1  0%    -100.0%     684.25 =C2=B1 83%  latency_stats.sum.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_cre=
ate.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
     46579 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_mkd=
ir.[f2fs].vfs_mkdir.SyS_mkdir.entry_SYSCALL_64_fastpath
  19075347 =C2=B1 37%     -79.8%    3843968 =C2=B1 11%  latency_stats.sum.f=
2fs_sync_fs.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync=
.entry_SYSCALL_64_fastpath
     78.50 =C2=B1173%  +75824.2%      59600 =C2=B1  9%  latency_stats.sum.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].update_inode.[f2fs].update_inode_page.[f2fs].f2fs_write_end.[f2f=
s].generic_perform_write.__generic_file_write_iter.generic_file_write_iter.=
f2fs_file_write_iter.[f2fs].__vfs_write.vfs_write
      6580 =C2=B1  2%     -22.6%       5096 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.active_objs
      6580 =C2=B1  2%     -22.6%       5096 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.num_objs
    312.00 =C2=B1  0%     -75.0%      78.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.active_objs
    312.00 =C2=B1  0%     -75.0%      78.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.num_objs
    360.00 =C2=B1  0%     -47.5%     189.00 =C2=B1  8%  slabinfo.RAW.active=
_objs
    360.00 =C2=B1  0%     -47.5%     189.00 =C2=B1  8%  slabinfo.RAW.num_ob=
js
    170.00 =C2=B1 14%     -80.0%      34.00 =C2=B1  0%  slabinfo.UDP.active=
_objs
    170.00 =C2=B1 14%     -80.0%      34.00 =C2=B1  0%  slabinfo.UDP.num_ob=
js
      2642 =C2=B1  1%     -55.0%       1189 =C2=B1  1%  slabinfo.anon_vma.a=
ctive_objs
      2642 =C2=B1  1%     -55.0%       1189 =C2=B1  1%  slabinfo.anon_vma.n=
um_objs
    438.00 =C2=B1 11%     -83.3%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.active_objs
    438.00 =C2=B1 11%     -83.3%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.num_objs
    195.00 =C2=B1 14%     -80.0%      39.00 =C2=B1  0%  slabinfo.bdev_cache=
.active_objs
    195.00 =C2=B1 14%     -80.0%      39.00 =C2=B1  0%  slabinfo.bdev_cache=
.num_objs
    505.50 =C2=B1  4%     -65.2%     176.00 =C2=B1  0%  slabinfo.blkdev_req=
uests.active_objs
    505.50 =C2=B1  4%     -65.2%     176.00 =C2=B1  0%  slabinfo.blkdev_req=
uests.num_objs
    630.75 =C2=B1  3%     -15.6%     532.25 =C2=B1  3%  slabinfo.buffer_hea=
d.active_objs
    799.50 =C2=B1  2%     -11.0%     711.75 =C2=B1  2%  slabinfo.buffer_hea=
d.num_objs
    792.50 =C2=B1  0%     -87.1%     102.00 =C2=B1  0%  slabinfo.ext4_exten=
t_status.active_objs
    792.50 =C2=B1  0%     -87.1%     102.00 =C2=B1  0%  slabinfo.ext4_exten=
t_status.num_objs
    270.75 =C2=B1  1%     -85.6%      39.00 =C2=B1  0%  slabinfo.file_lock_=
cache.active_objs
    270.75 =C2=B1  1%     -85.6%      39.00 =C2=B1  0%  slabinfo.file_lock_=
cache.num_objs
    401.50 =C2=B1  9%     -65.9%     137.00 =C2=B1  0%  slabinfo.files_cach=
e.active_objs
    401.50 =C2=B1  9%     -65.9%     137.00 =C2=B1  0%  slabinfo.files_cach=
e.num_objs
     14862 =C2=B1  6%     -87.4%       1870 =C2=B1  0%  slabinfo.free_nid.a=
ctive_objs
     14891 =C2=B1  6%     -87.4%       1870 =C2=B1  0%  slabinfo.free_nid.n=
um_objs
    491.25 =C2=B1  1%     -23.7%     375.00 =C2=B1  0%  slabinfo.idr_layer_=
cache.active_objs
    491.25 =C2=B1  1%     -23.7%     375.00 =C2=B1  0%  slabinfo.idr_layer_=
cache.num_objs
    952.00 =C2=B1  3%     -33.5%     633.25 =C2=B1  1%  slabinfo.kmalloc-10=
24.active_objs
    952.00 =C2=B1  3%     -32.9%     639.25 =C2=B1  0%  slabinfo.kmalloc-10=
24.num_objs
      1783 =C2=B1  3%     -37.2%       1119 =C2=B1  0%  slabinfo.kmalloc-12=
8.active_objs
      1783 =C2=B1  3%     -37.2%       1119 =C2=B1  0%  slabinfo.kmalloc-12=
8.num_objs
      4900 =C2=B1  1%     -19.4%       3950 =C2=B1  2%  slabinfo.kmalloc-16=
.active_objs
      4900 =C2=B1  1%     -19.4%       3950 =C2=B1  2%  slabinfo.kmalloc-16=
.num_objs
      3880 =C2=B1  2%     -40.5%       2310 =C2=B1  0%  slabinfo.kmalloc-19=
2.active_objs
      3880 =C2=B1  2%     -40.5%       2310 =C2=B1  0%  slabinfo.kmalloc-19=
2.num_objs
    799.25 =C2=B1  4%     -13.4%     692.50 =C2=B1  1%  slabinfo.kmalloc-20=
48.active_objs
    821.00 =C2=B1  3%     -15.7%     692.50 =C2=B1  1%  slabinfo.kmalloc-20=
48.num_objs
      1854 =C2=B1  1%     -24.4%       1402 =C2=B1  1%  slabinfo.kmalloc-25=
6.active_objs
      2538 =C2=B1  3%     -28.5%       1815 =C2=B1  8%  slabinfo.kmalloc-25=
6.num_objs
      6877 =C2=B1  3%     -40.4%       4096 =C2=B1  0%  slabinfo.kmalloc-32=
.active_objs
      6877 =C2=B1  3%     -40.4%       4096 =C2=B1  0%  slabinfo.kmalloc-32=
.num_objs
      1847 =C2=B1  5%     -51.5%     895.25 =C2=B1  1%  slabinfo.kmalloc-51=
2.active_objs
      1859 =C2=B1  4%     -36.8%       1176 =C2=B1  4%  slabinfo.kmalloc-51=
2.num_objs
      6272 =C2=B1  8%     -34.7%       4096 =C2=B1  0%  slabinfo.kmalloc-8.=
active_objs
      6272 =C2=B1  8%     -34.7%       4096 =C2=B1  0%  slabinfo.kmalloc-8.=
num_objs
      1438 =C2=B1  3%     -29.9%       1008 =C2=B1  0%  slabinfo.kmalloc-96=
.active_objs
      1438 =C2=B1  3%     -29.9%       1008 =C2=B1  0%  slabinfo.kmalloc-96=
.num_objs
    320.00 =C2=B1 14%     -60.0%     128.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.active_objs
    320.00 =C2=B1 14%     -60.0%     128.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.num_objs
    377.50 =C2=B1  0%     -66.6%     126.00 =C2=B1  0%  slabinfo.mnt_cache.=
active_objs
    377.50 =C2=B1  0%     -66.6%     126.00 =C2=B1  0%  slabinfo.mnt_cache.=
num_objs
      1713 =C2=B1  5%     -39.7%       1033 =C2=B1  2%  slabinfo.proc_inode=
_cache.active_objs
      1754 =C2=B1  5%     -32.2%       1189 =C2=B1  3%  slabinfo.proc_inode=
_cache.num_objs
      1151 =C2=B1  1%     -12.5%       1007 =C2=B1  0%  slabinfo.shmem_inod=
e_cache.active_objs
      1151 =C2=B1  1%     -12.5%       1007 =C2=B1  0%  slabinfo.shmem_inod=
e_cache.num_objs
    360.50 =C2=B1  1%     -29.6%     253.75 =C2=B1  0%  slabinfo.sighand_ca=
che.active_objs
    360.50 =C2=B1  1%     -29.6%     253.75 =C2=B1  0%  slabinfo.sighand_ca=
che.num_objs
    531.00 =C2=B1  8%     -43.7%     299.00 =C2=B1  0%  slabinfo.signal_cac=
he.active_objs
    531.00 =C2=B1  8%     -43.7%     299.00 =C2=B1  0%  slabinfo.signal_cac=
he.num_objs
    200.00 =C2=B1  0%     -87.5%      25.00 =C2=B1  0%  slabinfo.sigqueue.a=
ctive_objs
    200.00 =C2=B1  0%     -87.5%      25.00 =C2=B1  0%  slabinfo.sigqueue.n=
um_objs
    287.50 =C2=B1  4%     -47.8%     150.00 =C2=B1  0%  slabinfo.sock_inode=
_cache.active_objs
    287.50 =C2=B1  4%     -47.8%     150.00 =C2=B1  0%  slabinfo.sock_inode=
_cache.num_objs
      1989 =C2=B1  1%      -9.8%       1794 =C2=B1  0%  slabinfo.trace_even=
t_file.active_objs
      1989 =C2=B1  1%      -9.8%       1794 =C2=B1  0%  slabinfo.trace_even=
t_file.num_objs
      5726 =C2=B1  8%     -58.5%       2374 =C2=B1  2%  slabinfo.vm_area_st=
ruct.active_objs
      5741 =C2=B1  8%     -58.6%       2376 =C2=B1  2%  slabinfo.vm_area_st=
ruct.num_objs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-sbx04/pr=
ead3/will-it-scale

commit: =

  8025943c32f5de29b3fd548e917e24424297ca73
  0aefb957de5f2a1d9467126114146b6c793cf180

8025943c32f5de29 0aefb957de5f2a1d9467126114 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   2729845 =C2=B1  1%     -75.4%     671463 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
   2442702 =C2=B1  0%     -76.6%     571872 =C2=B1  0%  will-it-scale.per_t=
hread_ops
      0.47 =C2=B1  1%     -96.7%       0.02 =C2=B1  0%  will-it-scale.scala=
bility
    308.70 =C2=B1  0%     -28.6%     220.33 =C2=B1  0%  will-it-scale.time.=
elapsed_time
    308.70 =C2=B1  0%     -28.6%     220.33 =C2=B1  0%  will-it-scale.time.=
elapsed_time.max
     19174 =C2=B1 10%    +359.0%      88004 =C2=B1  0%  will-it-scale.time.=
involuntary_context_switches
     48720 =C2=B1  0%     -76.8%      11279 =C2=B1  0%  will-it-scale.time.=
minor_page_faults
      1375 =C2=B1  0%     -96.5%      48.00 =C2=B1  0%  will-it-scale.time.=
percent_of_cpu_this_job_got
      3837 =C2=B1  0%     -97.6%      93.85 =C2=B1  0%  will-it-scale.time.=
system_time
    407.32 =C2=B1  0%     -96.7%      13.51 =C2=B1  0%  will-it-scale.time.=
user_time
    343.77 =C2=B1  0%     -27.4%     249.62 =C2=B1  0%  uptime.boot
     13414 =C2=B1  0%     -99.9%      13.94 =C2=B1  0%  uptime.idle
    597038 =C2=B1  3%     -98.9%       6733 =C2=B1  2%  softirqs.RCU
    241694 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  softirqs.SCHED
   4674474 =C2=B1  0%     -97.5%     118125 =C2=B1  0%  softirqs.TIMER
    646731 =C2=B1  0%     -12.5%     565617 =C2=B1  0%  vmstat.memory.cache
     27.00 =C2=B1  0%     +18.5%      32.00 =C2=B1  0%  vmstat.procs.r
      2376 =C2=B1  1%     +69.3%       4023 =C2=B1  0%  vmstat.system.cs
     29727 =C2=B1  0%     -96.2%       1141 =C2=B1  0%  vmstat.system.in
    135531 =C2=B1 23%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.e=
xpand_files.__alloc_fd.get_unused_fd_flags.do_sys_open.SyS_open.entry_SYSCA=
LL_64_fastpath
    135781 =C2=B1 23%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.e=
xpand_files.__alloc_fd.get_unused_fd_flags.do_sys_open.SyS_open.entry_SYSCA=
LL_64_fastpath
      5673 =C2=B1 46%   +1003.3%      62588 =C2=B1  5%  latency_stats.sum.e=
p_poll.SyS_epoll_wait.entry_SYSCALL_64_fastpath
    542125 =C2=B1 23%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.e=
xpand_files.__alloc_fd.get_unused_fd_flags.do_sys_open.SyS_open.entry_SYSCA=
LL_64_fastpath
    633854 =C2=B1 41%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.w=
ait_on_page_bit.__migration_entry_wait.migration_entry_wait.handle_mm_fault=
.__do_page_fault.do_page_fault.page_fault
      1.89 =C2=B1  3%      -8.1%       1.73 =C2=B1  3%  perf-profile.cycles=
.__fget_light.sys_pread64.entry_SYSCALL_64_fastpath
      0.10 =C2=B1 10%   +1190.2%       1.32 =C2=B1  7%  perf-profile.cycles=
.__radix_tree_lookup.find_get_entry.find_lock_entry.shmem_getpage_gfp.shmem=
_file_read_iter
      1.36 =C2=B1  6%     +92.3%       2.62 =C2=B1  4%  perf-profile.cycles=
.__radix_tree_lookup.radix_tree_lookup_slot.find_get_entry.find_lock_entry.=
shmem_getpage_gfp
      4.88 =C2=B1  2%     +47.8%       7.22 =C2=B1  1%  perf-profile.cycles=
.find_get_entry.find_lock_entry.shmem_getpage_gfp.shmem_file_read_iter.__vf=
s_read
      9.89 =C2=B1  1%     +23.0%      12.17 =C2=B1  2%  perf-profile.cycles=
.find_lock_entry.shmem_getpage_gfp.shmem_file_read_iter.__vfs_read.vfs_read
      1.58 =C2=B1  6%     +82.9%       2.88 =C2=B1  6%  perf-profile.cycles=
.radix_tree_lookup_slot.find_get_entry.find_lock_entry.shmem_getpage_gfp.sh=
mem_file_read_iter
      0.96 =C2=B1  4%     -13.0%       0.84 =C2=B1  6%  perf-profile.cycles=
.selinux_file_permission.security_file_permission.rw_verify_area.vfs_read.s=
ys_pread64
     15.21 =C2=B1  1%     +14.4%      17.41 =C2=B1  2%  perf-profile.cycles=
.shmem_getpage_gfp.shmem_file_read_iter.__vfs_read.vfs_read.sys_pread64
    308.70 =C2=B1  0%     -28.6%     220.33 =C2=B1  0%  time.elapsed_time
    308.70 =C2=B1  0%     -28.6%     220.33 =C2=B1  0%  time.elapsed_time.m=
ax
     19174 =C2=B1 10%    +359.0%      88004 =C2=B1  0%  time.involuntary_co=
ntext_switches
     48720 =C2=B1  0%     -76.8%      11279 =C2=B1  0%  time.minor_page_fau=
lts
      1375 =C2=B1  0%     -96.5%      48.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
      3837 =C2=B1  0%     -97.6%      93.85 =C2=B1  0%  time.system_time
    407.32 =C2=B1  0%     -96.7%      13.51 =C2=B1  0%  time.user_time
    609.00 =C2=B1  3%     -45.5%     332.00 =C2=B1  0%  time.voluntary_cont=
ext_switches
     68593 =C2=B1 20%    +578.4%     465372 =C2=B1  0%  numa-numastat.node0=
.local_node
     72714 =C2=B1 19%    +540.0%     465372 =C2=B1  0%  numa-numastat.node0=
.numa_hit
      4120 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  numa-numastat.node0=
.other_node
    115421 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  numa-numastat.node1=
.local_node
    118512 =C2=B1  6%    -100.0%       5.25 =C2=B1 15%  numa-numastat.node1=
.numa_hit
    169708 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  numa-numastat.node2=
.local_node
    170741 =C2=B1  9%    -100.0%       5.50 =C2=B1  9%  numa-numastat.node2=
.numa_hit
    437345 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  numa-numastat.node3=
.local_node
    441466 =C2=B1  3%    -100.0%       6.75 =C2=B1 12%  numa-numastat.node3=
.numa_hit
      4121 =C2=B1  0%     -99.8%       6.75 =C2=B1 12%  numa-numastat.node3=
.other_node
    139447 =C2=B1  1%      -9.0%     126896 =C2=B1  0%  meminfo.Active
     38756 =C2=B1  3%     -29.3%      27402 =C2=B1  1%  meminfo.Active(anon)
      5811 =C2=B1 17%     -30.2%       4055 =C2=B1  0%  meminfo.AnonHugePag=
es
     28305 =C2=B1  4%      -7.2%      26260 =C2=B1  1%  meminfo.AnonPages
   6076928 =C2=B1  0%     -28.6%    4338176 =C2=B1 10%  meminfo.DirectMap2M
    136796 =C2=B1 14%     -70.4%      40540 =C2=B1  4%  meminfo.DirectMap4k
     14553 =C2=B1  0%     -12.6%      12719 =C2=B1  0%  meminfo.KernelStack
     53280 =C2=B1  0%     -27.1%      38868 =C2=B1  0%  meminfo.SReclaimable
    103204 =C2=B1  0%     -54.9%      46582 =C2=B1  0%  meminfo.SUnreclaim
     21239 =C2=B1  0%     -47.4%      11165 =C2=B1  0%  meminfo.Shmem
    156486 =C2=B1  0%     -45.4%      85450 =C2=B1  0%  meminfo.Slab
     43.08 =C2=B1  0%    +131.6%      99.79 =C2=B1  0%  turbostat.%Busy
      1247 =C2=B1  0%    +131.5%       2887 =C2=B1  0%  turbostat.Avg_MHz
     21.90 =C2=B1  0%     -99.1%       0.21 =C2=B1 11%  turbostat.CPU%c1
      0.05 =C2=B1 45%    -100.0%       0.00 =C2=B1 -1%  turbostat.CPU%c3
     34.96 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  turbostat.CPU%c7
    221.81 =C2=B1  0%     -82.7%      38.45 =C2=B1  0%  turbostat.CorWatt
     71.25 =C2=B1  0%     -29.1%      50.50 =C2=B1  1%  turbostat.CoreTmp
     28.42 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  turbostat.Pkg%pc2
      0.12 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  turbostat.Pkg%pc6
     71.50 =C2=B1  0%     -29.4%      50.50 =C2=B1  1%  turbostat.PkgTmp
    276.79 =C2=B1  0%     -81.2%      52.15 =C2=B1  0%  turbostat.PkgWatt
  33245984 =C2=B1 38%    -100.0%       0.00 =C2=B1  0%  cpuidle.C1-SNB.time
     99348 =C2=B1  9%    -100.0%       0.00 =C2=B1  0%  cpuidle.C1-SNB.usage
  20275044 =C2=B1 24%    -100.0%     237.00 =C2=B1173%  cpuidle.C1E-SNB.time
      3278 =C2=B1 23%    -100.0%       0.25 =C2=B1173%  cpuidle.C1E-SNB.usa=
ge
    525630 =C2=B1 27%    -100.0%       0.00 =C2=B1  0%  cpuidle.C3-SNB.time
    336.75 =C2=B1 16%    -100.0%       0.00 =C2=B1  0%  cpuidle.C3-SNB.usage
     13379 =C2=B1 58%     -96.0%     533.25 =C2=B1173%  cpuidle.C6-SNB.time
     30.75 =C2=B1 39%     -99.2%       0.25 =C2=B1173%  cpuidle.C6-SNB.usage
 1.123e+10 =C2=B1  0%    -100.0%     449847 =C2=B1 10%  cpuidle.C7-SNB.time
    314007 =C2=B1  1%    -100.0%      12.25 =C2=B1 15%  cpuidle.C7-SNB.usage
  25173571 =C2=B1 14%     -99.8%      55758 =C2=B1 93%  cpuidle.POLL.time
    844.25 =C2=B1 16%     -99.9%       1.00 =C2=B1 70%  cpuidle.POLL.usage
      9685 =C2=B1  3%     -29.2%       6858 =C2=B1  1%  proc-vmstat.nr_acti=
ve_anon
    166.75 =C2=B1  3%     -56.7%      72.25 =C2=B1  1%  proc-vmstat.nr_dirt=
ied
    909.25 =C2=B1  0%     -12.6%     794.50 =C2=B1  0%  proc-vmstat.nr_kern=
el_stack
      5309 =C2=B1  0%     -47.4%       2791 =C2=B1  0%  proc-vmstat.nr_shmem
     13319 =C2=B1  0%     -27.1%       9716 =C2=B1  0%  proc-vmstat.nr_slab=
_reclaimable
     25800 =C2=B1  0%     -54.9%      11645 =C2=B1  0%  proc-vmstat.nr_slab=
_unreclaimable
    169.25 =C2=B1  1%     -43.4%      95.75 =C2=B1  1%  proc-vmstat.nr_writ=
ten
      7589 =C2=B1  1%     -96.4%     273.00 =C2=B1  0%  proc-vmstat.numa_hi=
nt_faults
      6404 =C2=B1  1%     -95.7%     273.00 =C2=B1  0%  proc-vmstat.numa_hi=
nt_faults_local
    799545 =C2=B1  0%     -42.3%     461637 =C2=B1  0%  proc-vmstat.numa_hit
    788638 =C2=B1  0%     -41.5%     461620 =C2=B1  0%  proc-vmstat.numa_lo=
cal
     10907 =C2=B1 11%     -99.8%      17.50 =C2=B1  6%  proc-vmstat.numa_ot=
her
     24713 =C2=B1  0%     -96.5%     867.00 =C2=B1  0%  proc-vmstat.numa_pt=
e_updates
      5531 =C2=B1  0%     -65.9%       1884 =C2=B1  2%  proc-vmstat.pgactiv=
ate
     19003 =C2=B1 15%    +392.3%      93557 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
    814564 =C2=B1  0%     -52.2%     389240 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
    875402 =C2=B1  0%     -38.4%     539508 =C2=B1  0%  proc-vmstat.pgfault
    831290 =C2=B1  0%     -42.1%     481073 =C2=B1  0%  proc-vmstat.pgfree
     31759 =C2=B1 11%     +62.6%      51626 =C2=B1  3%  numa-meminfo.node0.=
Active
      5751 =C2=B1 70%    +376.8%      27420 =C2=B1  1%  numa-meminfo.node0.=
Active(anon)
      5825 =C2=B1 69%    +351.7%      26310 =C2=B1  1%  numa-meminfo.node0.=
AnonPages
     93660 =C2=B1  4%     +10.5%     103482 =C2=B1  1%  numa-meminfo.node0.=
Inactive
      2403 =C2=B1147%    +316.6%      10013 =C2=B1  0%  numa-meminfo.node0.=
Inactive(anon)
      7131 =C2=B1  2%     +24.3%       8865 =C2=B1  0%  numa-meminfo.node0.=
KernelStack
      5105 =C2=B1 50%     +89.1%       9656 =C2=B1  0%  numa-meminfo.node0.=
Mapped
    770.00 =C2=B1 20%    +430.2%       4082 =C2=B1  0%  numa-meminfo.node0.=
PageTables
     13064 =C2=B1  4%     +38.3%      18074 =C2=B1  3%  numa-meminfo.node0.=
SReclaimable
     26763 =C2=B1  6%     -16.5%      22336 =C2=B1  1%  numa-meminfo.node0.=
SUnreclaim
      2502 =C2=B1141%    +344.9%      11134 =C2=B1  0%  numa-meminfo.node0.=
Shmem
     34698 =C2=B1 15%     -27.1%      25293 =C2=B1  3%  numa-meminfo.node1.=
Active
     10512 =C2=B1 56%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
Active(anon)
      7935 =C2=B1 50%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
AnonPages
      2500 =C2=B1139%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
Inactive(anon)
      2344 =C2=B1  4%     -45.4%       1280 =C2=B1  0%  numa-meminfo.node1.=
KernelStack
    289660 =C2=B1 21%     -42.7%     166011 =C2=B1  0%  numa-meminfo.node1.=
MemUsed
    975.00 =C2=B1 28%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
PageTables
     12758 =C2=B1 10%     -48.5%       6570 =C2=B1 10%  numa-meminfo.node1.=
SReclaimable
     25154 =C2=B1  4%     -69.6%       7652 =C2=B1  4%  numa-meminfo.node1.=
SUnreclaim
      5220 =C2=B1 92%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
Shmem
     37913 =C2=B1  6%     -62.5%      14222 =C2=B1  6%  numa-meminfo.node1.=
Slab
     41206 =C2=B1 10%     -39.9%      24753 =C2=B1  2%  numa-meminfo.node2.=
Active
     15316 =C2=B1 30%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
Active(anon)
      2582 =C2=B1 72%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
AnonHugePages
      7448 =C2=B1 31%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
AnonPages
    129976 =C2=B1  3%      -9.9%     117092 =C2=B1  0%  numa-meminfo.node2.=
FilePages
      4800 =C2=B1 83%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
Inactive(anon)
      2403 =C2=B1  7%     -46.7%       1280 =C2=B1  0%  numa-meminfo.node2.=
KernelStack
    297365 =C2=B1 21%     -43.6%     167858 =C2=B1  0%  numa-meminfo.node2.=
MemUsed
     14695 =C2=B1  8%     -49.2%       7462 =C2=B1  5%  numa-meminfo.node2.=
SReclaimable
     24487 =C2=B1  6%     -64.9%       8590 =C2=B1  3%  numa-meminfo.node2.=
SUnreclaim
     12786 =C2=B1 30%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
Shmem
     39183 =C2=B1  5%     -59.0%      16052 =C2=B1  4%  numa-meminfo.node2.=
Slab
     31752 =C2=B1  6%     -20.5%      25231 =C2=B1  4%  numa-meminfo.node3.=
Active
      7145 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
Active(anon)
      7101 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
AnonPages
      2668 =C2=B1  2%     -52.0%       1280 =C2=B1  0%  numa-meminfo.node3.=
KernelStack
    226009 =C2=B1  0%     -26.3%     166525 =C2=B1  0%  numa-meminfo.node3.=
MemUsed
      1385 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
PageTables
     12758 =C2=B1  9%     -47.0%       6756 =C2=B1  6%  numa-meminfo.node3.=
SReclaimable
     26790 =C2=B1  5%     -70.2%       7983 =C2=B1  3%  numa-meminfo.node3.=
SUnreclaim
    718.50 =C2=B1 37%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
Shmem
     39548 =C2=B1  1%     -62.7%      14739 =C2=B1  4%  numa-meminfo.node3.=
Slab
      1436 =C2=B1 70%    +376.9%       6851 =C2=B1  1%  numa-vmstat.node0.n=
r_active_anon
      1455 =C2=B1 69%    +351.5%       6573 =C2=B1  1%  numa-vmstat.node0.n=
r_anon_pages
    600.50 =C2=B1147%    +316.9%       2503 =C2=B1  0%  numa-vmstat.node0.n=
r_inactive_anon
    445.50 =C2=B1  2%     +24.2%     553.50 =C2=B1  0%  numa-vmstat.node0.n=
r_kernel_stack
      1275 =C2=B1 50%     +89.1%       2413 =C2=B1  0%  numa-vmstat.node0.n=
r_mapped
    192.00 =C2=B1 20%    +430.3%       1018 =C2=B1  0%  numa-vmstat.node0.n=
r_page_table_pages
    625.25 =C2=B1141%    +345.3%       2784 =C2=B1  0%  numa-vmstat.node0.n=
r_shmem
      3265 =C2=B1  4%     +38.3%       4517 =C2=B1  3%  numa-vmstat.node0.n=
r_slab_reclaimable
      6690 =C2=B1  6%     -16.5%       5583 =C2=B1  1%  numa-vmstat.node0.n=
r_slab_unreclaimable
    106747 =C2=B1 12%    +242.0%     365071 =C2=B1  0%  numa-vmstat.node0.n=
uma_hit
     70620 =C2=B1 19%    +416.9%     365071 =C2=B1  0%  numa-vmstat.node0.n=
uma_local
     36126 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node0.n=
uma_other
      2626 =C2=B1 56%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_active_anon
      1982 =C2=B1 50%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_anon_pages
    624.75 =C2=B1139%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_inactive_anon
    146.00 =C2=B1  5%     -45.2%      80.00 =C2=B1  0%  numa-vmstat.node1.n=
r_kernel_stack
    243.00 =C2=B1 28%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_page_table_pages
      1304 =C2=B1 92%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_shmem
      3189 =C2=B1 10%     -48.5%       1642 =C2=B1 10%  numa-vmstat.node1.n=
r_slab_reclaimable
      6288 =C2=B1  4%     -69.6%       1912 =C2=B1  4%  numa-vmstat.node1.n=
r_slab_unreclaimable
    211207 =C2=B1  6%     -82.0%      38035 =C2=B1  0%  numa-vmstat.node1.n=
uma_hit
    193131 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
uma_local
      3828 =C2=B1 30%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_active_anon
      1860 =C2=B1 31%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_anon_pages
     32493 =C2=B1  3%      -9.9%      29273 =C2=B1  0%  numa-vmstat.node2.n=
r_file_pages
      1199 =C2=B1 83%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_inactive_anon
    149.75 =C2=B1  7%     -46.6%      80.00 =C2=B1  0%  numa-vmstat.node2.n=
r_kernel_stack
    227.00 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_page_table_pages
      3196 =C2=B1 30%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_shmem
      3673 =C2=B1  8%     -49.2%       1865 =C2=B1  5%  numa-vmstat.node2.n=
r_slab_reclaimable
      6121 =C2=B1  6%     -64.9%       2147 =C2=B1  3%  numa-vmstat.node2.n=
r_slab_unreclaimable
    200562 =C2=B1 13%     -81.0%      38202 =C2=B1  0%  numa-vmstat.node2.n=
uma_hit
    168527 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
uma_local
      1785 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_active_anon
      1774 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_anon_pages
    143.00 =C2=B1 41%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_inactive_anon
    166.50 =C2=B1  2%     -52.0%      80.00 =C2=B1  0%  numa-vmstat.node3.n=
r_kernel_stack
    346.00 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_page_table_pages
    179.25 =C2=B1 37%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_shmem
      3189 =C2=B1  9%     -47.0%       1689 =C2=B1  6%  numa-vmstat.node3.n=
r_slab_reclaimable
      6697 =C2=B1  5%     -70.2%       1995 =C2=B1  3%  numa-vmstat.node3.n=
r_slab_unreclaimable
    285548 =C2=B1  3%     -86.7%      38047 =C2=B1  0%  numa-vmstat.node3.n=
uma_hit
    242535 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
uma_local
     43013 =C2=B1  0%     -11.5%      38047 =C2=B1  0%  numa-vmstat.node3.n=
uma_other
     92008 =C2=B1  0%     -11.4%      81556 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.active_objs
      1643 =C2=B1  0%     -11.2%       1458 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.active_slabs
     92008 =C2=B1  0%     -11.2%      81690 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.num_objs
      1643 =C2=B1  0%     -11.2%       1458 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.num_slabs
      2476 =C2=B1  0%     -96.9%      78.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.active_objs
      2476 =C2=B1  0%     -96.9%      78.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.num_objs
     56099 =C2=B1  0%     -17.2%      46473 =C2=B1  0%  slabinfo.Acpi-State=
.active_objs
      1099 =C2=B1  0%     -17.1%     911.00 =C2=B1  0%  slabinfo.Acpi-State=
.active_slabs
     56099 =C2=B1  0%     -17.1%      46498 =C2=B1  0%  slabinfo.Acpi-State=
.num_objs
      1099 =C2=B1  0%     -17.1%     911.00 =C2=B1  0%  slabinfo.Acpi-State=
.num_slabs
      2397 =C2=B1  2%     -83.5%     396.00 =C2=B1  0%  slabinfo.RAW.active=
_objs
      2397 =C2=B1  2%     -83.5%     396.00 =C2=B1  0%  slabinfo.RAW.num_ob=
js
    131.75 =C2=B1  5%     -87.1%      17.00 =C2=B1  0%  slabinfo.TCP.active=
_objs
    131.75 =C2=B1  5%     -87.1%      17.00 =C2=B1  0%  slabinfo.TCP.num_ob=
js
    229.50 =C2=B1  6%     -85.2%      34.00 =C2=B1  0%  slabinfo.UDP.active=
_objs
    229.50 =C2=B1  6%     -85.2%      34.00 =C2=B1  0%  slabinfo.UDP.num_ob=
js
     11110 =C2=B1  6%     -84.8%       1686 =C2=B1  1%  slabinfo.anon_vma.a=
ctive_objs
    217.50 =C2=B1  6%     -84.0%      34.75 =C2=B1  1%  slabinfo.anon_vma.a=
ctive_slabs
     11110 =C2=B1  6%     -83.9%       1793 =C2=B1  0%  slabinfo.anon_vma.n=
um_objs
    217.50 =C2=B1  6%     -84.0%      34.75 =C2=B1  1%  slabinfo.anon_vma.n=
um_slabs
      1168 =C2=B1  9%     -93.8%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.active_objs
      1168 =C2=B1  9%     -93.8%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.num_objs
    750.75 =C2=B1  9%     -94.8%      39.00 =C2=B1  0%  slabinfo.bdev_cache=
.active_objs
    750.75 =C2=B1  9%     -94.8%      39.00 =C2=B1  0%  slabinfo.bdev_cache=
.num_objs
    157.50 =C2=B1  7%     -82.2%      28.00 =C2=B1  0%  slabinfo.blkdev_que=
ue.active_objs
    157.50 =C2=B1  7%     -82.2%      28.00 =C2=B1  0%  slabinfo.blkdev_que=
ue.num_objs
      1682 =C2=B1  5%     -92.2%     132.00 =C2=B1  0%  slabinfo.blkdev_req=
uests.active_objs
      1682 =C2=B1  5%     -92.2%     132.00 =C2=B1  0%  slabinfo.blkdev_req=
uests.num_objs
    263.25 =C2=B1 12%     -85.2%      39.00 =C2=B1  0%  slabinfo.buffer_hea=
d.active_objs
    263.25 =C2=B1 12%     -85.2%      39.00 =C2=B1  0%  slabinfo.buffer_hea=
d.num_objs
     61989 =C2=B1  0%     -25.5%      46171 =C2=B1  0%  slabinfo.dentry.act=
ive_objs
      1476 =C2=B1  0%     -25.6%       1099 =C2=B1  0%  slabinfo.dentry.act=
ive_slabs
     62035 =C2=B1  0%     -25.5%      46190 =C2=B1  0%  slabinfo.dentry.num=
_objs
      1476 =C2=B1  0%     -25.6%       1099 =C2=B1  0%  slabinfo.dentry.num=
_slabs
    885.00 =C2=B1 12%     -95.6%      39.00 =C2=B1  0%  slabinfo.file_lock_=
cache.active_objs
    885.00 =C2=B1 12%     -95.6%      39.00 =C2=B1  0%  slabinfo.file_lock_=
cache.num_objs
      3038 =C2=B1  2%     -90.7%     284.00 =C2=B1  0%  slabinfo.files_cach=
e.active_objs
      3038 =C2=B1  2%     -90.7%     284.00 =C2=B1  0%  slabinfo.files_cach=
e.num_objs
      3867 =C2=B1  1%      -9.9%       3485 =C2=B1  0%  slabinfo.ftrace_eve=
nt_field.active_objs
      3867 =C2=B1  1%      -9.9%       3485 =C2=B1  0%  slabinfo.ftrace_eve=
nt_field.num_objs
      2145 =C2=B1  0%     -44.8%       1185 =C2=B1  0%  slabinfo.idr_layer_=
cache.active_objs
      2145 =C2=B1  0%     -44.8%       1185 =C2=B1  0%  slabinfo.idr_layer_=
cache.num_objs
     46395 =C2=B1  0%     -15.7%      39095 =C2=B1  0%  slabinfo.inode_cach=
e.active_objs
    813.50 =C2=B1  0%     -15.8%     685.00 =C2=B1  0%  slabinfo.inode_cach=
e.active_slabs
     46395 =C2=B1  0%     -15.7%      39095 =C2=B1  0%  slabinfo.inode_cach=
e.num_objs
    813.50 =C2=B1  0%     -15.8%     685.00 =C2=B1  0%  slabinfo.inode_cach=
e.num_slabs
     68442 =C2=B1  0%     -30.5%      47600 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.active_objs
      1006 =C2=B1  0%     -30.5%     700.00 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.active_slabs
     68442 =C2=B1  0%     -30.5%      47600 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.num_objs
      1006 =C2=B1  0%     -30.5%     700.00 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.num_slabs
      3607 =C2=B1  1%     -67.3%       1180 =C2=B1  0%  slabinfo.kmalloc-10=
24.active_objs
      3685 =C2=B1  2%     -67.0%       1215 =C2=B1  0%  slabinfo.kmalloc-10=
24.num_objs
      7135 =C2=B1  2%     -70.7%       2090 =C2=B1  0%  slabinfo.kmalloc-12=
8.active_objs
      7135 =C2=B1  2%     -69.5%       2176 =C2=B1  0%  slabinfo.kmalloc-12=
8.num_objs
     23282 =C2=B1  0%     -61.1%       9055 =C2=B1  0%  slabinfo.kmalloc-16=
.active_objs
     23649 =C2=B1  0%     -59.4%       9598 =C2=B1  1%  slabinfo.kmalloc-16=
.num_objs
     11567 =C2=B1  5%     -60.9%       4523 =C2=B1  1%  slabinfo.kmalloc-19=
2.active_objs
    277.75 =C2=B1  4%     -56.5%     120.75 =C2=B1  1%  slabinfo.kmalloc-19=
2.active_slabs
     11697 =C2=B1  4%     -56.3%       5110 =C2=B1  1%  slabinfo.kmalloc-19=
2.num_objs
    277.75 =C2=B1  4%     -56.5%     120.75 =C2=B1  1%  slabinfo.kmalloc-19=
2.num_slabs
      3859 =C2=B1  5%     -78.5%     830.00 =C2=B1  0%  slabinfo.kmalloc-20=
48.active_objs
    250.75 =C2=B1  6%     -76.1%      60.00 =C2=B1  2%  slabinfo.kmalloc-20=
48.active_slabs
      4020 =C2=B1  5%     -76.1%     962.25 =C2=B1  1%  slabinfo.kmalloc-20=
48.num_objs
    250.75 =C2=B1  6%     -76.1%      60.00 =C2=B1  2%  slabinfo.kmalloc-20=
48.num_slabs
     20387 =C2=B1 10%     -91.0%       1836 =C2=B1  0%  slabinfo.kmalloc-25=
6.active_objs
    340.50 =C2=B1  9%     -84.8%      51.75 =C2=B1  3%  slabinfo.kmalloc-25=
6.active_slabs
     21813 =C2=B1  9%     -84.7%       3341 =C2=B1  3%  slabinfo.kmalloc-25=
6.num_objs
    340.50 =C2=B1  9%     -84.8%      51.75 =C2=B1  3%  slabinfo.kmalloc-25=
6.num_slabs
     27080 =C2=B1  4%     -44.5%      15023 =C2=B1  0%  slabinfo.kmalloc-32=
.active_objs
     27218 =C2=B1  4%     -41.2%      15995 =C2=B1  1%  slabinfo.kmalloc-32=
.num_objs
      1304 =C2=B1  0%     -40.0%     782.50 =C2=B1  0%  slabinfo.kmalloc-40=
96.active_objs
      1388 =C2=B1  0%     -39.8%     835.00 =C2=B1  0%  slabinfo.kmalloc-40=
96.num_objs
     12429 =C2=B1  3%     -63.8%       4504 =C2=B1  1%  slabinfo.kmalloc-51=
2.active_objs
    194.75 =C2=B1  3%     -60.7%      76.50 =C2=B1  2%  slabinfo.kmalloc-51=
2.active_slabs
     12498 =C2=B1  4%     -60.5%       4938 =C2=B1  2%  slabinfo.kmalloc-51=
2.num_objs
    194.75 =C2=B1  3%     -60.7%      76.50 =C2=B1  2%  slabinfo.kmalloc-51=
2.num_slabs
     45108 =C2=B1  3%     -46.9%      23971 =C2=B1  0%  slabinfo.kmalloc-64=
.active_objs
    705.00 =C2=B1  3%     -44.7%     389.75 =C2=B1  0%  slabinfo.kmalloc-64=
.active_slabs
     45157 =C2=B1  3%     -44.7%      24986 =C2=B1  0%  slabinfo.kmalloc-64=
.num_objs
    705.00 =C2=B1  3%     -44.7%     389.75 =C2=B1  0%  slabinfo.kmalloc-64=
.num_slabs
     37504 =C2=B1  0%     -89.1%       4096 =C2=B1  0%  slabinfo.kmalloc-8.=
active_objs
     37504 =C2=B1  0%     -89.1%       4096 =C2=B1  0%  slabinfo.kmalloc-8.=
num_objs
    476.00 =C2=B1  1%     -91.8%      39.25 =C2=B1  1%  slabinfo.kmalloc-81=
92.active_objs
    119.00 =C2=B1  1%     -91.2%      10.50 =C2=B1  4%  slabinfo.kmalloc-81=
92.active_slabs
    476.00 =C2=B1  1%     -91.2%      42.00 =C2=B1  4%  slabinfo.kmalloc-81=
92.num_objs
    119.00 =C2=B1  1%     -91.2%      10.50 =C2=B1  4%  slabinfo.kmalloc-81=
92.num_slabs
      5147 =C2=B1  6%     -65.1%       1794 =C2=B1  0%  slabinfo.kmalloc-96=
.active_objs
      5409 =C2=B1  5%     -60.8%       2122 =C2=B1  0%  slabinfo.kmalloc-96=
.num_objs
    484.50 =C2=B1 18%     -68.4%     153.00 =C2=B1  0%  slabinfo.kmem_cache=
.active_objs
    484.50 =C2=B1 18%     -68.4%     153.00 =C2=B1  0%  slabinfo.kmem_cache=
.num_objs
    865.00 =C2=B1 13%     -48.1%     449.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.active_objs
    928.00 =C2=B1 12%     -44.8%     512.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.num_objs
      1207 =C2=B1  3%     -89.9%     122.25 =C2=B1  0%  slabinfo.mm_struct.=
active_objs
      1207 =C2=B1  3%     -89.6%     125.50 =C2=B1  0%  slabinfo.mm_struct.=
num_objs
      1954 =C2=B1  4%     -94.6%     105.00 =C2=B1 20%  slabinfo.mnt_cache.=
active_objs
      1954 =C2=B1  4%     -94.6%     105.00 =C2=B1 20%  slabinfo.mnt_cache.=
num_objs
    152.00 =C2=B1  9%     -78.9%      32.00 =C2=B1  0%  slabinfo.nfs_inode_=
cache.active_objs
    152.00 =C2=B1  9%     -78.9%      32.00 =C2=B1  0%  slabinfo.nfs_inode_=
cache.num_objs
     10117 =C2=B1  1%     -47.2%       5341 =C2=B1  0%  slabinfo.proc_inode=
_cache.active_objs
     10117 =C2=B1  1%     -47.2%       5341 =C2=B1  0%  slabinfo.proc_inode=
_cache.num_objs
     11020 =C2=B1  0%     -29.4%       7784 =C2=B1  0%  slabinfo.radix_tree=
_node.active_objs
     11020 =C2=B1  0%     -29.4%       7784 =C2=B1  0%  slabinfo.radix_tree=
_node.num_objs
      3968 =C2=B1  1%     -59.3%       1616 =C2=B1  0%  slabinfo.shmem_inod=
e_cache.active_objs
      3968 =C2=B1  1%     -59.3%       1616 =C2=B1  0%  slabinfo.shmem_inod=
e_cache.num_objs
      1749 =C2=B1  2%     -54.9%     789.50 =C2=B1  0%  slabinfo.sighand_ca=
che.active_objs
      1768 =C2=B1  1%     -54.8%     799.50 =C2=B1  0%  slabinfo.sighand_ca=
che.num_objs
      2843 =C2=B1  1%     -66.5%     951.50 =C2=B1  0%  slabinfo.signal_cac=
he.active_objs
      2843 =C2=B1  1%     -66.5%     951.50 =C2=B1  0%  slabinfo.signal_cac=
he.num_objs
      3267 =C2=B1  0%     -98.3%      55.00 =C2=B1  0%  slabinfo.sigqueue.a=
ctive_objs
      3267 =C2=B1  0%     -98.3%      55.00 =C2=B1  0%  slabinfo.sigqueue.n=
um_objs
      3353 =C2=B1  2%     -84.8%     510.00 =C2=B1  0%  slabinfo.sock_inode=
_cache.active_objs
      3353 =C2=B1  2%     -84.8%     510.00 =C2=B1  0%  slabinfo.sock_inode=
_cache.num_objs
      1207 =C2=B1  0%     -33.9%     797.75 =C2=B1  0%  slabinfo.task_struc=
t.active_objs
    413.75 =C2=B1  0%     -35.2%     268.25 =C2=B1  0%  slabinfo.task_struc=
t.active_slabs
      1242 =C2=B1  0%     -35.2%     804.75 =C2=B1  0%  slabinfo.task_struc=
t.num_objs
    413.75 =C2=B1  0%     -35.2%     268.25 =C2=B1  0%  slabinfo.task_struc=
t.num_slabs
      1018 =C2=B1  0%     -96.3%      38.00 =C2=B1  0%  slabinfo.taskstats.=
active_objs
      1018 =C2=B1  0%     -96.3%      38.00 =C2=B1  0%  slabinfo.taskstats.=
num_objs
      2645 =C2=B1  2%     -33.9%       1748 =C2=B1  0%  slabinfo.trace_even=
t_file.active_objs
      2645 =C2=B1  2%     -33.9%       1748 =C2=B1  0%  slabinfo.trace_even=
t_file.num_objs
     20850 =C2=B1  6%     -85.1%       3111 =C2=B1  0%  slabinfo.vm_area_st=
ruct.active_objs
    473.00 =C2=B1  6%     -83.9%      76.25 =C2=B1  1%  slabinfo.vm_area_st=
ruct.active_slabs
     20850 =C2=B1  6%     -83.8%       3381 =C2=B1  1%  slabinfo.vm_area_st=
ruct.num_objs
    473.00 =C2=B1  6%     -83.9%      76.25 =C2=B1  1%  slabinfo.vm_area_st=
ruct.num_slabs
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/filesize/fs/iterations/kconfig/nr_directorie=
s/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_size=
/testcase:
  gcc-4.9/performance/1HDD/8K/f2fs/1x/x86_64-rhel/16d/256fpd/32t/debian-x86=
_64-2015-02-07.cgz/fsyncBeforeClose/nhm4/400M/fsmark

commit: =

  8025943c32f5de29b3fd548e917e24424297ca73
  0aefb957de5f2a1d9467126114146b6c793cf180

8025943c32f5de29 0aefb957de5f2a1d9467126114 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   4869620 =C2=B1  8%     -16.3%    4077423 =C2=B1  5%  fsmark.app_overhead
    511.70 =C2=B1  0%     +15.0%     588.67 =C2=B1  0%  fsmark.files_per_sec
    100.74 =C2=B1  0%     -13.3%      87.33 =C2=B1  0%  fsmark.time.elapsed=
_time
    100.74 =C2=B1  0%     -13.3%      87.33 =C2=B1  0%  fsmark.time.elapsed=
_time.max
   1311972 =C2=B1  0%      -1.8%    1288254 =C2=B1  0%  fsmark.time.file_sy=
stem_outputs
     14906 =C2=B1  1%     -32.6%      10047 =C2=B1  1%  fsmark.time.involun=
tary_context_switches
     15.00 =C2=B1  0%     -86.7%       2.00 =C2=B1  0%  fsmark.time.percent=
_of_cpu_this_job_got
     15.08 =C2=B1  0%     -85.2%       2.23 =C2=B1  1%  fsmark.time.system_=
time
    499439 =C2=B1  0%     -68.3%     158519 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
     48548 =C2=B1  6%     -26.4%      35748 =C2=B1  4%  meminfo.DirectMap4k
     32438 =C2=B1  0%     -89.0%       3575 =C2=B1  2%  proc-vmstat.pgactiv=
ate
    130992 =C2=B1  0%     -11.2%     116266 =C2=B1  0%  proc-vmstat.pgfault
    159.65 =C2=B1 41%     -32.4%     107.88 =C2=B1  0%  uptime.boot
    616.98 =C2=B1 86%     -97.8%      13.79 =C2=B1  1%  uptime.idle
      6360 =C2=B1  0%     +13.6%       7227 =C2=B1  0%  vmstat.io.bo
    600.00 =C2=B1  1%     -64.7%     212.00 =C2=B1  0%  vmstat.memory.buff
     11949 =C2=B1  0%     -54.2%       5474 =C2=B1  0%  vmstat.system.cs
     23824 =C2=B1  0%     +39.5%      33225 =C2=B1  0%  softirqs.BLOCK
     17370 =C2=B1  4%     -76.3%       4113 =C2=B1  0%  softirqs.RCU
     16565 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  softirqs.SCHED
     26434 =C2=B1  2%     -34.8%      17241 =C2=B1  0%  softirqs.TIMER
      2.24 =C2=B1  0%    +136.4%       5.29 =C2=B1  0%  turbostat.%Busy
     66.50 =C2=B1  0%    +165.4%     176.50 =C2=B1  0%  turbostat.Avg_MHz
      2975 =C2=B1  0%     +12.0%       3333 =C2=B1  0%  turbostat.Bzy_MHz
     44.29 =C2=B1  1%    +113.8%      94.70 =C2=B1  0%  turbostat.CPU%c1
     44.75 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  turbostat.CPU%c3
      8.72 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  turbostat.CPU%c6
    100.74 =C2=B1  0%     -13.3%      87.33 =C2=B1  0%  time.elapsed_time
    100.74 =C2=B1  0%     -13.3%      87.33 =C2=B1  0%  time.elapsed_time.m=
ax
     14906 =C2=B1  1%     -32.6%      10047 =C2=B1  1%  time.involuntary_co=
ntext_switches
     15.00 =C2=B1  0%     -86.7%       2.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
     15.08 =C2=B1  0%     -85.2%       2.23 =C2=B1  1%  time.system_time
      0.56 =C2=B1  6%     -55.2%       0.25 =C2=B1  7%  time.user_time
    499439 =C2=B1  0%     -68.3%     158519 =C2=B1  0%  time.voluntary_cont=
ext_switches
 1.933e+08 =C2=B1  2%     -82.5%   33777725 =C2=B1  0%  cpuidle.C1-NHM.time
    205957 =C2=B1  2%     -69.1%      63597 =C2=B1  1%  cpuidle.C1-NHM.usage
  27418772 =C2=B1  2%     -88.7%    3087064 =C2=B1  8%  cpuidle.C1E-NHM.time
     42420 =C2=B1  2%     -96.8%       1338 =C2=B1  4%  cpuidle.C1E-NHM.usa=
ge
 3.989e+08 =C2=B1  0%     -90.8%   36819105 =C2=B1  0%  cpuidle.C3-NHM.time
    204527 =C2=B1  0%     -97.9%       4195 =C2=B1  4%  cpuidle.C3-NHM.usage
  1.77e+08 =C2=B1  1%     -94.4%    9834887 =C2=B1  2%  cpuidle.C6-NHM.time
     95424 =C2=B1  1%     -99.3%     692.25 =C2=B1  3%  cpuidle.C6-NHM.usage
      1101 =C2=B1  9%     -26.8%     805.75 =C2=B1 14%  cpuidle.POLL.time
     10030 =C2=B1 59%    +770.4%      87308 =C2=B1  4%  latency_stats.avg.c=
all_rwsem_down_read_failed.f2fs_write_node_page.[f2fs].sync_node_pages.[f2f=
s].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_6=
4_fastpath
      2537 =C2=B1 15%    +816.6%      23260 =C2=B1 31%  latency_stats.avg.f=
2fs_write_data_pages.[f2fs].do_writepages.__filemap_fdatawrite_range.filema=
p_write_and_wait_range.f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_f=
sync.entry_SYSCALL_64_fastpath
     15329 =C2=B1  0%     -79.0%       3217 =C2=B1 10%  latency_stats.avg.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.filemap_w=
rite_and_wait_range.f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsyn=
c.entry_SYSCALL_64_fastpath
     19773 =C2=B1  1%     -99.8%      35.50 =C2=B1 36%  latency_stats.hits.=
call_rwsem_down_read_failed.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on=
_page_writeback.[f2fs].wait_on_node_pages_writeback.[f2fs].f2fs_sync_file.[=
f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     20025 =C2=B1  1%    -100.0%       9.50 =C2=B1 21%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].alloc_nid.[f2fs].f2fs_new_=
inode.[f2fs].f2fs_create.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_=
open.SyS_open.entry_SYSCALL_64_fastpath
     22898 =C2=B1  0%    -100.0%       8.00 =C2=B1 27%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_cre=
ate.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
     35764 =C2=B1  0%    -100.0%      12.50 =C2=B1 38%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_fi=
le_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs].__vfs_wri=
te.vfs_write.SyS_write
     20189 =C2=B1  0%    -100.0%       6.00 =C2=B1 54%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_ge=
t_block.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_file=
_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs]
     45245 =C2=B1  0%    -100.0%       9.50 =C2=B1 18%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].get_new=
_data_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_create.[f2fs].vfs_create.path=
_openat.do_filp_open
     11452 =C2=B1  1%     -99.9%       9.00 =C2=B1 22%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].get_dnode_of_data.[f2fs].get_read_data_page.[f2fs].find_da=
ta_page.[f2fs].f2fs_find_entry.[f2fs].f2fs_lookup.[f2fs].lookup_real.path_o=
penat.do_filp_open
     14357 =C2=B1  1%     -99.9%       9.25 =C2=B1 56%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].update_inode_page.[f2fs].f2fs_write_end.[f2fs].generic_per=
form_write.__generic_file_write_iter.generic_file_write_iter.f2fs_file_writ=
e_iter.[f2fs].__vfs_write.vfs_write
     30422 =C2=B1  0%    -100.0%       7.75 =C2=B1 27%  latency_stats.hits.=
call_rwsem_down_write_failed.get_node_info.[f2fs].alloc_nid.[f2fs].f2fs_new=
_inode.[f2fs].f2fs_create.[f2fs].vfs_create.path_openat.do_filp_open.do_sys=
_open.SyS_open.entry_SYSCALL_64_fastpath
     32498 =C2=B1  0%    -100.0%       8.25 =C2=B1 17%  latency_stats.hits.=
call_rwsem_down_write_failed.set_node_addr.[f2fs].new_node_page.[f2fs].new_=
inode_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_cr=
eate.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
     21271 =C2=B1  1%     -94.7%       1134 =C2=B1 13%  latency_stats.hits.=
f2fs_write_data_pages.[f2fs].do_writepages.__filemap_fdatawrite_range.filem=
ap_write_and_wait_range.f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_=
fsync.entry_SYSCALL_64_fastpath
      9992 =C2=B1  1%    +675.7%      77512 =C2=B1  1%  latency_stats.hits.=
pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      8907 =C2=B1 37%     -99.5%      42.00 =C2=B1 16%  latency_stats.max.c=
all_rwsem_down_read_failed.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_=
page_writeback.[f2fs].wait_on_node_pages_writeback.[f2fs].f2fs_sync_file.[f=
2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     11371 =C2=B1 16%     -99.7%      36.50 =C2=B1 20%  latency_stats.max.c=
all_rwsem_down_write_failed.f2fs_submit_merged_bio.[f2fs].sync_node_pages.[=
f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCAL=
L_64_fastpath
     12480 =C2=B1  1%     -98.8%     148.00 =C2=B1 32%  latency_stats.max.c=
all_rwsem_down_write_failed.f2fs_submit_page_mbio.[f2fs].do_write_page.[f2f=
s].write_node_page.[f2fs].f2fs_write_node_page.[f2fs].sync_node_pages.[f2fs=
].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64=
_fastpath
    134008 =C2=B1 14%     -90.4%      12909 =C2=B1 29%  latency_stats.sum.a=
lloc_nid.[f2fs].f2fs_new_inode.[f2fs].f2fs_create.[f2fs].vfs_create.path_op=
enat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
     10767 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.add_free_nid.[f2fs].build_free_nids.[f2fs].alloc=
_nid.[f2fs].f2fs_new_inode.[f2fs].f2fs_create.[f2fs].vfs_create.path_openat=
.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
   5016725 =C2=B1 18%    +305.6%   20346108 =C2=B1  9%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_convert_inline_inode.[f2fs].f2fs_write_begi=
n.[f2fs].generic_perform_write.__generic_file_write_iter.generic_file_write=
_iter.f2fs_file_write_iter.[f2fs].__vfs_write.vfs_write.SyS_write.entry_SYS=
CALL_64_fastpath
   1693586 =C2=B1  4%    -100.0%     627.25 =C2=B1 44%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_=
page_writeback.[f2fs].wait_on_node_pages_writeback.[f2fs].f2fs_sync_file.[f=
2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
   3462045 =C2=B1  1%    -100.0%     444.00 =C2=B1 58%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].alloc_nid.[f2fs].f2fs_new_i=
node.[f2fs].f2fs_create.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_o=
pen.SyS_open.entry_SYSCALL_64_fastpath
     23890 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].alloc_nid.[f2fs].f2fs_new_i=
node.[f2fs].f2fs_mkdir.[f2fs].vfs_mkdir.SyS_mkdir.entry_SYSCALL_64_fastpath
    475110 =C2=B1  2%    -100.0%     161.75 =C2=B1109%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].f2fs_write_node_page.[f2fs]=
.sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_=
fsync.entry_SYSCALL_64_fastpath
   4350665 =C2=B1  1%    -100.0%     329.00 =C2=B1 43%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].new_node_page.[f2fs].new_in=
ode_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_crea=
te.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
     28599 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].new_node_page.[f2fs].new_in=
ode_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_mkdi=
r.[f2fs].vfs_mkdir.SyS_mkdir.entry_SYSCALL_64_fastpath
    875527 =C2=B1  1%    -100.0%     217.50 =C2=B1 86%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].f2fs_convert_inline_inode.[f2fs].f2fs_write_begin.[f2fs].ge=
neric_perform_write.__generic_file_write_iter.generic_file_write_iter.f2fs_=
file_write_iter.[f2fs].__vfs_write.vfs_write
   5262125 =C2=B1  0%    -100.0%     543.25 =C2=B1 61%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_fil=
e_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs].__vfs_writ=
e.vfs_write.SyS_write
    610751 =C2=B1  2%    -100.0%     127.75 =C2=B1 66%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].do_write_data_page.[f2fs].f2fs_wri=
te_data_page.[f2fs].__f2fs_writepage.[f2fs].f2fs_write_cache_pages.[f2fs].f=
2fs_write_data_pages.[f2fs].do_writepages.__filemap_fdatawrite_range
   2787585 =C2=B1  1%    -100.0%     261.50 =C2=B1 83%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_get=
_block.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_file_=
write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs]
   9524677 =C2=B1  1%    -100.0%     412.75 =C2=B1 23%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].get_new_=
data_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_create.[f2fs].vfs_create.path_=
openat.do_filp_open
     35645 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].get_new_=
data_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_mkdir.[f2fs].vfs_mkdir.SyS_mkd=
ir.entry_SYSCALL_64_fastpath
   1403361 =C2=B1  1%    -100.0%     377.50 =C2=B1 33%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].get_read_data_page.[f2fs].find_dat=
a_page.[f2fs].f2fs_find_entry.[f2fs].f2fs_lookup.[f2fs].lookup_real.path_op=
enat.do_filp_open
     93443 =C2=B1  2%     -99.9%      60.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].update_inode_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_create=
.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
     30595 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].update_inode_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_mkdir.=
[f2fs].vfs_mkdir.SyS_mkdir.entry_SYSCALL_64_fastpath
   1842740 =C2=B1  2%    -100.0%     349.00 =C2=B1 68%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].update_inode_page.[f2fs].f2fs_write_end.[f2fs].generic_perf=
orm_write.__generic_file_write_iter.generic_file_write_iter.f2fs_file_write=
_iter.[f2fs].__vfs_write.vfs_write
    437921 =C2=B1  3%    -100.0%      85.75 =C2=B1 93%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].write_data_page.[f2fs].do_w=
rite_data_page.[f2fs].f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2fs].f=
2fs_write_cache_pages.[f2fs].f2fs_write_data_pages.[f2fs].do_writepages.__f=
ilemap_fdatawrite_range.filemap_write_and_wait_range.f2fs_sync_file.[f2fs]
    978238 =C2=B1  2%    -100.0%     296.25 =C2=B1 43%  latency_stats.sum.c=
all_rwsem_down_read_failed.is_checkpointed_node.[f2fs].f2fs_sync_file.[f2fs=
].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
    743986 =C2=B1  2%    -100.0%     202.75 =C2=B1 94%  latency_stats.sum.c=
all_rwsem_down_read_failed.need_dentry_mark.[f2fs].sync_node_pages.[f2fs].f=
2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fa=
stpath
    758052 =C2=B1  1%    -100.0%     289.50 =C2=B1 71%  latency_stats.sum.c=
all_rwsem_down_read_failed.need_inode_block_update.[f2fs].f2fs_sync_file.[f=
2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
    211383 =C2=B1 24%     -87.0%      27536 =C2=B1 57%  latency_stats.sum.c=
all_rwsem_down_write_failed.block_operations.[f2fs].write_checkpoint.[f2fs]=
.f2fs_sync_fs.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsy=
nc.entry_SYSCALL_64_fastpath
    302311 =C2=B1  5%    -100.0%      76.00 =C2=B1 24%  latency_stats.sum.c=
all_rwsem_down_write_failed.f2fs_submit_merged_bio.[f2fs].sync_node_pages.[=
f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCAL=
L_64_fastpath
   1091213 =C2=B1  6%     -99.9%       1286 =C2=B1 38%  latency_stats.sum.c=
all_rwsem_down_write_failed.f2fs_submit_page_mbio.[f2fs].do_write_page.[f2f=
s].write_node_page.[f2fs].f2fs_write_node_page.[f2fs].sync_node_pages.[f2fs=
].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64=
_fastpath
   4675431 =C2=B1  1%    -100.0%     423.50 =C2=B1 60%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].alloc_nid.[f2fs].f2fs_new_=
inode.[f2fs].f2fs_create.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_=
open.SyS_open.entry_SYSCALL_64_fastpath
     38734 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].alloc_nid.[f2fs].f2fs_new_=
inode.[f2fs].f2fs_mkdir.[f2fs].vfs_mkdir.SyS_mkdir.entry_SYSCALL_64_fastpath
    531207 =C2=B1  2%    -100.0%     230.00 =C2=B1 38%  latency_stats.sum.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].f2fs_write_node_page.[f2fs=
].sync_node_pages.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS=
_fsync.entry_SYSCALL_64_fastpath
   3517334 =C2=B1  1%    -100.0%     324.00 =C2=B1 36%  latency_stats.sum.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_cre=
ate.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
     22754 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_mkd=
ir.[f2fs].vfs_mkdir.SyS_mkdir.entry_SYSCALL_64_fastpath
 7.936e+08 =C2=B1  0%     -79.2%  1.648e+08 =C2=B1 10%  latency_stats.sum.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.filemap_w=
rite_and_wait_range.f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsyn=
c.entry_SYSCALL_64_fastpath
      6734 =C2=B1  3%     -23.9%       5124 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.active_objs
      6734 =C2=B1  3%     -23.9%       5124 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.num_objs
    321.50 =C2=B1  5%     -75.7%      78.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.active_objs
    321.50 =C2=B1  5%     -75.7%      78.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.num_objs
    360.00 =C2=B1  0%     -47.5%     189.00 =C2=B1  8%  slabinfo.RAW.active=
_objs
    360.00 =C2=B1  0%     -47.5%     189.00 =C2=B1  8%  slabinfo.RAW.num_ob=
js
    170.00 =C2=B1 14%     -80.0%      34.00 =C2=B1  0%  slabinfo.UDP.active=
_objs
    170.00 =C2=B1 14%     -80.0%      34.00 =C2=B1  0%  slabinfo.UDP.num_ob=
js
      2645 =C2=B1  9%     -55.5%       1177 =C2=B1  1%  slabinfo.anon_vma.a=
ctive_objs
      2645 =C2=B1  9%     -55.5%       1177 =C2=B1  1%  slabinfo.anon_vma.n=
um_objs
    383.25 =C2=B1 15%     -81.0%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.active_objs
    383.25 =C2=B1 15%     -81.0%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.num_objs
    185.25 =C2=B1 17%     -78.9%      39.00 =C2=B1  0%  slabinfo.bdev_cache=
.active_objs
    185.25 =C2=B1 17%     -78.9%      39.00 =C2=B1  0%  slabinfo.bdev_cache=
.num_objs
    528.00 =C2=B1  5%     -66.7%     176.00 =C2=B1  0%  slabinfo.blkdev_req=
uests.active_objs
    528.00 =C2=B1  5%     -66.7%     176.00 =C2=B1  0%  slabinfo.blkdev_req=
uests.num_objs
    624.25 =C2=B1  4%     -16.4%     522.00 =C2=B1  0%  slabinfo.buffer_hea=
d.active_objs
    780.25 =C2=B1  0%     -86.9%     102.00 =C2=B1  0%  slabinfo.ext4_exten=
t_status.active_objs
    780.25 =C2=B1  0%     -86.9%     102.00 =C2=B1  0%  slabinfo.ext4_exten=
t_status.num_objs
    242.00 =C2=B1 12%     -83.9%      39.00 =C2=B1  0%  slabinfo.file_lock_=
cache.active_objs
    242.00 =C2=B1 12%     -83.9%      39.00 =C2=B1  0%  slabinfo.file_lock_=
cache.num_objs
    379.25 =C2=B1  5%     -63.9%     137.00 =C2=B1  0%  slabinfo.files_cach=
e.active_objs
    379.25 =C2=B1  5%     -63.9%     137.00 =C2=B1  0%  slabinfo.files_cach=
e.num_objs
     12699 =C2=B1  8%     -85.3%       1870 =C2=B1  0%  slabinfo.free_nid.a=
ctive_objs
     12706 =C2=B1  8%     -85.3%       1870 =C2=B1  0%  slabinfo.free_nid.n=
um_objs
    487.50 =C2=B1  1%     -23.1%     375.00 =C2=B1  0%  slabinfo.idr_layer_=
cache.active_objs
    487.50 =C2=B1  1%     -23.1%     375.00 =C2=B1  0%  slabinfo.idr_layer_=
cache.num_objs
    984.00 =C2=B1  1%     -35.1%     639.00 =C2=B1  0%  slabinfo.kmalloc-10=
24.active_objs
    984.00 =C2=B1  1%     -35.1%     639.00 =C2=B1  0%  slabinfo.kmalloc-10=
24.num_objs
      1782 =C2=B1  3%     -35.4%       1150 =C2=B1  0%  slabinfo.kmalloc-12=
8.active_objs
      1782 =C2=B1  3%     -35.4%       1150 =C2=B1  0%  slabinfo.kmalloc-12=
8.num_objs
      4984 =C2=B1  4%     -22.2%       3879 =C2=B1  1%  slabinfo.kmalloc-16=
.active_objs
      4984 =C2=B1  4%     -22.2%       3879 =C2=B1  1%  slabinfo.kmalloc-16=
.num_objs
      3902 =C2=B1  3%     -40.8%       2310 =C2=B1  0%  slabinfo.kmalloc-19=
2.active_objs
      3902 =C2=B1  3%     -40.8%       2310 =C2=B1  0%  slabinfo.kmalloc-19=
2.num_objs
    806.75 =C2=B1  2%     -14.0%     693.50 =C2=B1  1%  slabinfo.kmalloc-20=
48.active_objs
    845.00 =C2=B1  2%     -17.9%     693.50 =C2=B1  1%  slabinfo.kmalloc-20=
48.num_objs
      1834 =C2=B1  3%     -24.1%       1393 =C2=B1  0%  slabinfo.kmalloc-25=
6.active_objs
      2613 =C2=B1  7%     -26.6%       1917 =C2=B1  7%  slabinfo.kmalloc-25=
6.num_objs
      6684 =C2=B1  3%     -38.7%       4096 =C2=B1  0%  slabinfo.kmalloc-32=
.active_objs
      6684 =C2=B1  3%     -38.7%       4096 =C2=B1  0%  slabinfo.kmalloc-32=
.num_objs
      1739 =C2=B1 12%     -48.4%     898.50 =C2=B1  1%  slabinfo.kmalloc-51=
2.active_objs
      1739 =C2=B1 12%     -35.2%       1128 =C2=B1  4%  slabinfo.kmalloc-51=
2.num_objs
      6528 =C2=B1  3%     -37.3%       4096 =C2=B1  0%  slabinfo.kmalloc-8.=
active_objs
      6528 =C2=B1  3%     -37.3%       4096 =C2=B1  0%  slabinfo.kmalloc-8.=
num_objs
      1447 =C2=B1  2%     -30.3%       1008 =C2=B1  0%  slabinfo.kmalloc-96=
.active_objs
      1447 =C2=B1  2%     -30.3%       1008 =C2=B1  0%  slabinfo.kmalloc-96=
.num_objs
    304.00 =C2=B1  9%     -57.9%     128.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.active_objs
    304.00 =C2=B1  9%     -57.9%     128.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.num_objs
    388.50 =C2=B1  4%     -67.6%     126.00 =C2=B1  0%  slabinfo.mnt_cache.=
active_objs
    388.50 =C2=B1  4%     -67.6%     126.00 =C2=B1  0%  slabinfo.mnt_cache.=
num_objs
      1777 =C2=B1  6%     -42.9%       1015 =C2=B1  1%  slabinfo.proc_inode=
_cache.active_objs
      1807 =C2=B1  5%     -35.3%       1170 =C2=B1  3%  slabinfo.proc_inode=
_cache.num_objs
      1133 =C2=B1  0%     -11.1%       1007 =C2=B1  0%  slabinfo.shmem_inod=
e_cache.active_objs
      1133 =C2=B1  0%     -11.1%       1007 =C2=B1  0%  slabinfo.shmem_inod=
e_cache.num_objs
    545.75 =C2=B1  8%     -46.5%     291.75 =C2=B1  4%  slabinfo.signal_cac=
he.active_objs
    545.75 =C2=B1  8%     -46.5%     291.75 =C2=B1  4%  slabinfo.signal_cac=
he.num_objs
    200.00 =C2=B1  0%     -87.5%      25.00 =C2=B1  0%  slabinfo.sigqueue.a=
ctive_objs
    200.00 =C2=B1  0%     -87.5%      25.00 =C2=B1  0%  slabinfo.sigqueue.n=
um_objs
    287.50 =C2=B1  4%     -47.8%     150.00 =C2=B1  0%  slabinfo.sock_inode=
_cache.active_objs
    287.50 =C2=B1  4%     -47.8%     150.00 =C2=B1  0%  slabinfo.sock_inode=
_cache.num_objs
      2001 =C2=B1  1%     -10.3%       1794 =C2=B1  0%  slabinfo.trace_even=
t_file.active_objs
      2001 =C2=B1  1%     -10.3%       1794 =C2=B1  0%  slabinfo.trace_even=
t_file.num_objs
      4486 =C2=B1  8%     -47.7%       2344 =C2=B1  1%  slabinfo.vm_area_st=
ruct.active_objs
      4526 =C2=B1  8%     -48.2%       2344 =C2=B1  1%  slabinfo.vm_area_st=
ruct.num_objs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/testcase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-ivb-d04/=
linpack

commit: =

  8025943c32f5de29b3fd548e917e24424297ca73
  0aefb957de5f2a1d9467126114146b6c793cf180

8025943c32f5de29 0aefb957de5f2a1d9467126114 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     45.27 =C2=B1  0%     -48.5%      23.32 =C2=B1  0%  linpack.GFlops
    104.70 =C2=B1  0%     +72.1%     180.18 =C2=B1  0%  linpack.time.elapse=
d_time
    104.70 =C2=B1  0%     +72.1%     180.18 =C2=B1  0%  linpack.time.elapse=
d_time.max
      4729 =C2=B1 18%     +38.1%       6529 =C2=B1  4%  linpack.time.involu=
ntary_context_switches
      5134 =C2=B1  5%     +11.1%       5706 =C2=B1  5%  linpack.time.minor_=
page_faults
    235.75 =C2=B1  0%     -58.4%      98.00 =C2=B1  0%  linpack.time.percen=
t_of_cpu_this_job_got
    245.43 =C2=B1  0%     -27.5%     177.86 =C2=B1  0%  linpack.time.user_t=
ime
     10679 =C2=B1 19%     -86.3%       1463 =C2=B1  4%  softirqs.RCU
    137008 =C2=B1  2%     -30.0%      95840 =C2=B1  0%  softirqs.TIMER
    126.98 =C2=B1  4%     +54.7%     196.50 =C2=B1  0%  uptime.boot
    250.28 =C2=B1  8%     -96.5%       8.83 =C2=B1 15%  uptime.idle
     33266 =C2=B1 11%    +265.8%     121692 =C2=B1  1%  latency_stats.hits.=
pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
    453713 =C2=B1  3%    +305.7%    1840510 =C2=B1  6%  latency_stats.sum.d=
o_wait.SyS_wait4.entry_SYSCALL_64_fastpath
    859539 =C2=B1  3%    +411.0%    4392268 =C2=B1  8%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     66188 =C2=B1  2%     -45.6%      35980 =C2=B1  4%  meminfo.DirectMap4k
      2800 =C2=B1  1%      -9.0%       2547 =C2=B1  0%  meminfo.KernelStack
     17137 =C2=B1  0%     -12.9%      14932 =C2=B1  0%  meminfo.SUnreclaim
      2.00 =C2=B1  0%     -50.0%       1.00 =C2=B1  0%  vmstat.procs.r
    926.75 =C2=B1  6%     +90.9%       1769 =C2=B1  3%  vmstat.system.cs
      2391 =C2=B1  0%     -58.0%       1005 =C2=B1  0%  vmstat.system.in
      4284 =C2=B1  0%     -12.9%       3732 =C2=B1  0%  proc-vmstat.nr_slab=
_unreclaimable
    112981 =C2=B1  0%     +60.0%     180741 =C2=B1  0%  proc-vmstat.numa_hit
    112981 =C2=B1  0%     +60.0%     180741 =C2=B1  0%  proc-vmstat.numa_lo=
cal
    131691 =C2=B1  0%     +61.7%     212958 =C2=B1  0%  proc-vmstat.pgfault
    113408 =C2=B1  0%     +60.8%     182335 =C2=B1  0%  proc-vmstat.pgfree
    104.70 =C2=B1  0%     +72.1%     180.18 =C2=B1  0%  time.elapsed_time
    104.70 =C2=B1  0%     +72.1%     180.18 =C2=B1  0%  time.elapsed_time.m=
ax
      4729 =C2=B1 18%     +38.1%       6529 =C2=B1  4%  time.involuntary_co=
ntext_switches
      5134 =C2=B1  5%     +11.1%       5706 =C2=B1  5%  time.minor_page_fau=
lts
    235.75 =C2=B1  0%     -58.4%      98.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
      1.92 =C2=B1  3%     -86.2%       0.27 =C2=B1  1%  time.system_time
    245.43 =C2=B1  0%     -27.5%     177.86 =C2=B1  0%  time.user_time
    611.25 =C2=B1  1%     -87.2%      78.00 =C2=B1  0%  time.voluntary_cont=
ext_switches
   1458158 =C2=B1 22%     -98.6%      20421 =C2=B1173%  cpuidle.C1-IVB.time
     11676 =C2=B1 17%    -100.0%       1.00 =C2=B1122%  cpuidle.C1-IVB.usage
   1574739 =C2=B1 24%    -100.0%     181.00 =C2=B1 24%  cpuidle.C1E-IVB.time
    269.00 =C2=B1  7%     -99.3%       1.75 =C2=B1 24%  cpuidle.C1E-IVB.usa=
ge
     92320 =C2=B1 21%     -98.1%       1726 =C2=B1 43%  cpuidle.C3-IVB.time
    169.75 =C2=B1 15%     -97.1%       5.00 =C2=B1 24%  cpuidle.C3-IVB.usage
 1.702e+08 =C2=B1  0%     -99.5%     805505 =C2=B1  4%  cpuidle.C6-IVB.time
      4452 =C2=B1  4%     -98.2%      80.00 =C2=B1  3%  cpuidle.C6-IVB.usage
     81.25 =C2=B1 49%     -98.2%       1.50 =C2=B1173%  cpuidle.POLL.time
     11.25 =C2=B1 55%     -93.3%       0.75 =C2=B1173%  cpuidle.POLL.usage
     58.98 =C2=B1  0%     +68.8%      99.54 =C2=B1  0%  turbostat.%Busy
      1942 =C2=B1  0%     +68.7%       3277 =C2=B1  0%  turbostat.Avg_MHz
     39.80 =C2=B1  0%     -98.8%       0.46 =C2=B1  0%  turbostat.CPU%c1
      0.02 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  turbostat.CPU%c3
      1.20 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  turbostat.CPU%c6
     19.34 =C2=B1  0%     -29.8%      13.58 =C2=B1  0%  turbostat.CorWatt
     42.25 =C2=B1  1%      -8.3%      38.75 =C2=B1  1%  turbostat.CoreTmp
      0.04 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  turbostat.Pkg%pc2
      0.02 =C2=B1 86%    -100.0%       0.00 =C2=B1 -1%  turbostat.Pkg%pc3
      0.82 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  turbostat.Pkg%pc6
     36.95 =C2=B1  0%     -16.3%      30.91 =C2=B1  0%  turbostat.PkgWatt
      2091 =C2=B1  2%     -12.2%       1836 =C2=B1  0%  slabinfo.Acpi-Names=
pace.active_objs
      2091 =C2=B1  2%     -12.2%       1836 =C2=B1  0%  slabinfo.Acpi-Names=
pace.num_objs
    156.00 =C2=B1  0%     -75.0%      39.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.active_objs
    156.00 =C2=B1  0%     -75.0%      39.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.num_objs
      1816 =C2=B1  4%     -43.7%       1022 =C2=B1  0%  slabinfo.anon_vma.a=
ctive_objs
      1816 =C2=B1  4%     -43.7%       1022 =C2=B1  0%  slabinfo.anon_vma.n=
um_objs
    273.75 =C2=B1 11%     -73.3%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.active_objs
    273.75 =C2=B1 11%     -73.3%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.num_objs
      1647 =C2=B1  3%     -12.1%       1447 =C2=B1  0%  slabinfo.kmalloc-12=
8.active_objs
      1647 =C2=B1  3%     -12.1%       1447 =C2=B1  0%  slabinfo.kmalloc-12=
8.num_objs
      4284 =C2=B1  4%     -10.4%       3838 =C2=B1  0%  slabinfo.kmalloc-16=
.active_objs
      4284 =C2=B1  4%     -10.4%       3838 =C2=B1  0%  slabinfo.kmalloc-16=
.num_objs
      2429 =C2=B1  2%     -20.5%       1931 =C2=B1  0%  slabinfo.kmalloc-19=
2.active_objs
      2614 =C2=B1  2%     -26.1%       1931 =C2=B1  0%  slabinfo.kmalloc-19=
2.num_objs
      1162 =C2=B1  2%     -11.5%       1028 =C2=B1  0%  slabinfo.kmalloc-25=
6.active_objs
      5598 =C2=B1  7%     -36.0%       3584 =C2=B1  0%  slabinfo.kmalloc-32=
.active_objs
      5598 =C2=B1  7%     -36.0%       3584 =C2=B1  0%  slabinfo.kmalloc-32=
.num_objs
    787.50 =C2=B1  3%     -21.4%     618.75 =C2=B1  2%  slabinfo.kmalloc-51=
2.active_objs
      7301 =C2=B1  4%     -17.6%       6018 =C2=B1  0%  slabinfo.kmalloc-64=
.active_objs
      7538 =C2=B1  4%     -20.2%       6018 =C2=B1  0%  slabinfo.kmalloc-64=
.num_objs
      4480 =C2=B1  4%     -20.0%       3584 =C2=B1  0%  slabinfo.kmalloc-8.=
active_objs
      4480 =C2=B1  4%     -20.0%       3584 =C2=B1  0%  slabinfo.kmalloc-8.=
num_objs
      1113 =C2=B1  4%     -13.2%     966.00 =C2=B1  0%  slabinfo.kmalloc-96=
.active_objs
      1113 =C2=B1  4%     -13.2%     966.00 =C2=B1  0%  slabinfo.kmalloc-96=
.num_objs
    304.00 =C2=B1  9%     -57.9%     128.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.active_objs
    304.00 =C2=B1  9%     -57.9%     128.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.num_objs
      1256 =C2=B1  9%     -26.6%     922.00 =C2=B1  2%  slabinfo.proc_inode=
_cache.active_objs
      1325 =C2=B1  4%     -18.1%       1085 =C2=B1  2%  slabinfo.proc_inode=
_cache.num_objs
    314.25 =C2=B1  4%     -33.5%     209.00 =C2=B1  0%  slabinfo.signal_cac=
he.active_objs
    314.25 =C2=B1  4%     -33.5%     209.00 =C2=B1  0%  slabinfo.signal_cac=
he.num_objs
      2475 =C2=B1  2%     -15.0%       2104 =C2=B1  0%  slabinfo.vm_area_st=
ruct.active_objs
      2506 =C2=B1  2%     -15.9%       2107 =C2=B1  0%  slabinfo.vm_area_st=
ruct.num_objs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-sb02/all=
_utime/reaim

commit: =

  8025943c32f5de29b3fd548e917e24424297ca73
  0aefb957de5f2a1d9467126114146b6c793cf180

8025943c32f5de29 0aefb957de5f2a1d9467126114 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      8.12 =C2=B1  0%     -63.7%       2.94 =C2=B1  0%  reaim.child_utime
     17817 =C2=B1  0%     -71.2%       5139 =C2=B1  0%  reaim.jobs_per_min
      3431 =C2=B1  0%     -22.0%       2677 =C2=B1  0%  reaim.jobs_per_min_=
child
     95.81 =C2=B1  0%      +4.4%     100.00 =C2=B1  0%  reaim.jti
     20745 =C2=B1  0%     -75.1%       5164 =C2=B1  0%  reaim.max_jobs_per_=
min
      2.22 =C2=B1  0%     +34.1%       2.98 =C2=B1  0%  reaim.parent_time
      3.79 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  reaim.std_dev_perce=
nt
      0.09 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  reaim.std_dev_time
     39.73 =C2=B1  0%     -57.4%      16.94 =C2=B1  0%  reaim.time.elapsed_=
time
     39.73 =C2=B1  0%     -57.4%      16.94 =C2=B1  0%  reaim.time.elapsed_=
time.max
     11361 =C2=B1  1%     -60.3%       4509 =C2=B1  0%  reaim.time.involunt=
ary_context_switches
      2400 =C2=B1  0%      +3.9%       2493 =C2=B1  1%  reaim.time.maximum_=
resident_set_size
     11711 =C2=B1  0%     -65.1%       4090 =C2=B1  0%  reaim.time.minor_pa=
ge_faults
    244.75 =C2=B1  0%     -71.8%      69.00 =C2=B1  0%  reaim.time.percent_=
of_cpu_this_job_got
     97.45 =C2=B1  0%     -87.9%      11.78 =C2=B1  0%  reaim.time.user_time
     62925 =C2=B1  0%     -76.9%      14562 =C2=B1  2%  softirqs.TIMER
     59.88 =C2=B1  0%     -31.0%      41.33 =C2=B1 12%  uptime.boot
    132.29 =C2=B1  1%     -83.7%      21.56 =C2=B1 23%  uptime.idle
     67302 =C2=B1  1%      -9.5%      60918 =C2=B1  1%  meminfo.Committed_AS
     66608 =C2=B1 28%     -42.3%      38448 =C2=B1  7%  meminfo.DirectMap4k
     18050 =C2=B1  0%     -13.3%      15643 =C2=B1  0%  meminfo.SUnreclaim
      5.00 =C2=B1  0%     -60.0%       2.00 =C2=B1  0%  vmstat.procs.r
      1382 =C2=B1  1%     +12.6%       1555 =C2=B1  5%  vmstat.system.cs
      2420 =C2=B1  0%     -70.8%     705.75 =C2=B1  1%  vmstat.system.in
      4511 =C2=B1  0%     -13.3%       3909 =C2=B1  0%  proc-vmstat.nr_slab=
_unreclaimable
     58560 =C2=B1  0%     -47.5%      30756 =C2=B1  0%  proc-vmstat.numa_hit
     58560 =C2=B1  0%     -47.5%      30756 =C2=B1  0%  proc-vmstat.numa_lo=
cal
     46094 =C2=B1  0%     -46.1%      24857 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
     15691 =C2=B1  0%     -51.1%       7670 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
     68010 =C2=B1  0%     -47.6%      35651 =C2=B1  0%  proc-vmstat.pgfault
     59666 =C2=B1  0%     -49.2%      30340 =C2=B1  0%  proc-vmstat.pgfree
    124679 =C2=B1  4%     -99.0%       1233 =C2=B1 37%  cpuidle.C1-SNB.time
      1088 =C2=B1 13%     -98.0%      22.25 =C2=B1 66%  cpuidle.C1-SNB.usage
    426214 =C2=B1 61%     -95.5%      19322 =C2=B1  6%  cpuidle.C1E-SNB.time
    401.50 =C2=B1  8%     -86.9%      52.50 =C2=B1  5%  cpuidle.C1E-SNB.usa=
ge
     71067 =C2=B1 28%     -95.0%       3524 =C2=B1 29%  cpuidle.C3-SNB.time
    109.00 =C2=B1 11%     -90.1%      10.75 =C2=B1 13%  cpuidle.C3-SNB.usage
  63922064 =C2=B1  0%     -91.0%    5727394 =C2=B1  0%  cpuidle.C6-SNB.time
      3859 =C2=B1  4%     -92.4%     294.50 =C2=B1  4%  cpuidle.C6-SNB.usage
    115648 =C2=B1101%     -90.7%      10761 =C2=B1173%  cpuidle.POLL.time
     39.73 =C2=B1  0%     -57.4%      16.94 =C2=B1  0%  time.elapsed_time
     39.73 =C2=B1  0%     -57.4%      16.94 =C2=B1  0%  time.elapsed_time.m=
ax
    120.00 =C2=B1  0%     -53.3%      56.00 =C2=B1  0%  time.file_system_ou=
tputs
     11361 =C2=B1  1%     -60.3%       4509 =C2=B1  0%  time.involuntary_co=
ntext_switches
     11711 =C2=B1  0%     -65.1%       4090 =C2=B1  0%  time.minor_page_fau=
lts
    244.75 =C2=B1  0%     -71.8%      69.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
      0.07 =C2=B1  5%     -72.4%       0.02 =C2=B1  0%  time.system_time
     97.45 =C2=B1  0%     -87.9%      11.78 =C2=B1  0%  time.user_time
    714.25 =C2=B1  0%     -71.9%     200.50 =C2=B1  0%  time.voluntary_cont=
ext_switches
     60.33 =C2=B1  0%     +12.1%      67.60 =C2=B1  0%  turbostat.%Busy
      1751 =C2=B1  0%     +11.7%       1956 =C2=B1  0%  turbostat.Avg_MHz
      0.44 =C2=B1 37%     -61.7%       0.17 =C2=B1  4%  turbostat.CPU%c1
      0.10 =C2=B1 15%     -80.5%       0.02 =C2=B1 35%  turbostat.CPU%c3
     39.13 =C2=B1  0%     -17.7%      32.21 =C2=B1  0%  turbostat.CPU%c6
     21.75 =C2=B1  0%     -16.8%      18.09 =C2=B1  0%  turbostat.CorWatt
      1.75 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  turbostat.Pkg%pc2
      0.14 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  turbostat.Pkg%pc3
     30.35 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  turbostat.Pkg%pc6
     25.34 =C2=B1  0%     -14.3%      21.70 =C2=B1  0%  turbostat.PkgWatt
      1377 =C2=B1  3%     -11.1%       1224 =C2=B1  0%  slabinfo.Acpi-Names=
pace.active_objs
      1377 =C2=B1  3%     -11.1%       1224 =C2=B1  0%  slabinfo.Acpi-Names=
pace.num_objs
    156.00 =C2=B1  0%     -75.0%      39.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.active_objs
    156.00 =C2=B1  0%     -75.0%      39.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.num_objs
      2006 =C2=B1  6%     -47.2%       1059 =C2=B1  0%  slabinfo.anon_vma.a=
ctive_objs
      2006 =C2=B1  6%     -47.2%       1059 =C2=B1  0%  slabinfo.anon_vma.n=
um_objs
    273.75 =C2=B1 11%     -73.3%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.active_objs
    273.75 =C2=B1 11%     -73.3%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.num_objs
    204.00 =C2=B1  0%     -50.0%     102.00 =C2=B1  0%  slabinfo.ext4_exten=
t_status.active_objs
    204.00 =C2=B1  0%     -50.0%     102.00 =C2=B1  0%  slabinfo.ext4_exten=
t_status.num_objs
      1870 =C2=B1  0%     -14.5%       1600 =C2=B1  0%  slabinfo.kmalloc-12=
8.active_objs
      1870 =C2=B1  0%     -14.5%       1600 =C2=B1  0%  slabinfo.kmalloc-12=
8.num_objs
      4462 =C2=B1  2%     -13.9%       3840 =C2=B1  0%  slabinfo.kmalloc-16=
.active_objs
      4462 =C2=B1  2%     -13.9%       3840 =C2=B1  0%  slabinfo.kmalloc-16=
.num_objs
      2577 =C2=B1  5%     -19.3%       2079 =C2=B1  0%  slabinfo.kmalloc-19=
2.active_objs
      2619 =C2=B1  4%     -20.6%       2079 =C2=B1  0%  slabinfo.kmalloc-19=
2.num_objs
      1345 =C2=B1  1%      -7.7%       1241 =C2=B1  2%  slabinfo.kmalloc-25=
6.active_objs
      1802 =C2=B1  4%     -15.3%       1526 =C2=B1  3%  slabinfo.kmalloc-25=
6.num_objs
      5728 =C2=B1  4%     -37.4%       3584 =C2=B1  0%  slabinfo.kmalloc-32=
.active_objs
      5728 =C2=B1  4%     -37.4%       3584 =C2=B1  0%  slabinfo.kmalloc-32=
.num_objs
    625.50 =C2=B1  9%     -25.2%     468.00 =C2=B1  4%  slabinfo.kmalloc-51=
2.active_objs
      7370 =C2=B1  3%     -14.5%       6304 =C2=B1  0%  slabinfo.kmalloc-64=
.active_objs
      7608 =C2=B1  2%     -17.1%       6304 =C2=B1  0%  slabinfo.kmalloc-64=
.num_objs
      4864 =C2=B1  5%     -15.8%       4096 =C2=B1  0%  slabinfo.kmalloc-8.=
active_objs
      4864 =C2=B1  5%     -15.8%       4096 =C2=B1  0%  slabinfo.kmalloc-8.=
num_objs
      1239 =C2=B1  2%     -11.9%       1092 =C2=B1  0%  slabinfo.kmalloc-96=
.active_objs
      1239 =C2=B1  2%     -11.9%       1092 =C2=B1  0%  slabinfo.kmalloc-96=
.num_objs
    288.00 =C2=B1 11%     -55.6%     128.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.active_objs
    288.00 =C2=B1 11%     -55.6%     128.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.num_objs
      1273 =C2=B1  3%     -26.4%     937.50 =C2=B1  3%  slabinfo.proc_inode=
_cache.active_objs
      1365 =C2=B1  4%     -19.0%       1105 =C2=B1  4%  slabinfo.proc_inode=
_cache.num_objs
    343.50 =C2=B1  4%     -38.9%     210.00 =C2=B1  0%  slabinfo.signal_cac=
he.active_objs
    343.50 =C2=B1  4%     -38.9%     210.00 =C2=B1  0%  slabinfo.signal_cac=
he.num_objs
      2773 =C2=B1  2%     -22.2%       2157 =C2=B1  0%  slabinfo.vm_area_st=
ruct.active_objs
      2797 =C2=B1  2%     -22.8%       2160 =C2=B1  0%  slabinfo.vm_area_st=
ruct.num_objs
      3326 =C2=B1 18%    +157.5%       8565 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.exec_clock
    616.00 =C2=B1 16%     +78.0%       1096 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.load_avg
      3924 =C2=B1 16%    +101.9%       7924 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.min_vruntime
      7.75 =C2=B1 14%    +119.4%      17.00 =C2=B1  9%  sched_debug.cfs_rq[=
0]:/.nr_spread_over
      6.00 =C2=B1100%  +16558.3%     999.50 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
      1549 =C2=B1 17%     -28.7%       1105 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
    616.00 =C2=B1 16%     +79.5%       1105 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.tg_load_avg_contrib
    635.75 =C2=B1 14%     +58.8%       1009 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.util_avg
      0.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.MIN_vruntime
      2118 =C2=B1 63%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.exec_clock
    306.50 =C2=B1 25%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.load_avg
      0.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.max_vruntime
      2653 =C2=B1 49%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.min_vruntime
      3.00 =C2=B1 23%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.nr_spread_over
     76.00 =C2=B1 90%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
      1540 =C2=B1 17%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
    306.50 =C2=B1 25%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.tg_load_avg_contrib
    593.00 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.util_avg
      0.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.MIN_vruntime
      1627 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.exec_clock
    437.25 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.load
    281.00 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.load_avg
      0.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.max_vruntime
      2413 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.min_vruntime
      1.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.nr_running
      3.00 =C2=B1 23%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
    102.50 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
     -1511 =C2=B1-40%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.spread0
      1540 =C2=B1 17%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
    281.00 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.tg_load_avg_contrib
    539.50 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.util_avg
      0.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.MIN_vruntime
      2199 =C2=B1 55%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.exec_clock
    338.50 =C2=B1 52%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.load_avg
      0.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.max_vruntime
      2818 =C2=B1 43%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.min_vruntime
      3.00 =C2=B1 23%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.nr_spread_over
     25.25 =C2=B1144%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
      1538 =C2=B1 17%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
    338.25 =C2=B1 53%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.tg_load_avg_contrib
    600.75 =C2=B1 23%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.util_avg
    241050 =C2=B1 16%    +234.1%     805228 =C2=B1  0%  sched_debug.cpu#0.a=
vg_idle
     65.00 =C2=B1103%   +1436.2%     998.50 =C2=B1  0%  sched_debug.cpu#0.c=
pu_load[0]
     52.75 =C2=B1 81%   +1791.9%     998.00 =C2=B1  0%  sched_debug.cpu#0.c=
pu_load[1]
     54.00 =C2=B1 49%   +1748.1%     998.00 =C2=B1  0%  sched_debug.cpu#0.c=
pu_load[2]
     58.50 =C2=B1 34%   +1605.1%     997.50 =C2=B1  0%  sched_debug.cpu#0.c=
pu_load[3]
     64.00 =C2=B1 32%   +1458.6%     997.50 =C2=B1  0%  sched_debug.cpu#0.c=
pu_load[4]
      3466 =C2=B1  3%    +149.9%       8662 =C2=B1  3%  sched_debug.cpu#0.n=
r_load_updates
      6361 =C2=B1  8%    +747.6%      53925 =C2=B1  3%  sched_debug.cpu#0.n=
r_switches
     -7.00 =C2=B1-44%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#0.n=
r_uninterruptible
    152836 =C2=B1  0%     -64.7%      53935 =C2=B1  3%  sched_debug.cpu#0.s=
ched_count
      2208 =C2=B1  9%    +117.3%       4797 =C2=B1  6%  sched_debug.cpu#0.s=
ched_goidle
      4027 =C2=B1  5%    +608.6%      28542 =C2=B1  3%  sched_debug.cpu#0.t=
twu_count
      1871 =C2=B1 10%   +1424.9%      28542 =C2=B1  3%  sched_debug.cpu#0.t=
twu_local
    186707 =C2=B1 30%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#1.a=
vg_idle
     19748 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#1.c=
lock
     19748 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#1.c=
lock_task
     66.25 =C2=B1 60%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#1.c=
pu_load[1]
     67.50 =C2=B1 45%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#1.c=
pu_load[2]
     73.00 =C2=B1 36%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#1.c=
pu_load[3]
     81.00 =C2=B1 36%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#1.c=
pu_load[4]
    500000 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#1.m=
ax_idle_balance_cost
      4294 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#1.n=
ext_balance
      4449 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#1.n=
r_load_updates
      9718 =C2=B1 30%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#1.n=
r_switches
      9748 =C2=B1 29%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#1.s=
ched_count
      3776 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#1.s=
ched_goidle
      4756 =C2=B1 31%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#1.t=
twu_count
      3137 =C2=B1 45%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#1.t=
twu_local
    304621 =C2=B1 31%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#2.a=
vg_idle
     19749 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#2.c=
lock
     19749 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#2.c=
lock_task
     27.25 =C2=B1 78%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#2.c=
pu_load[1]
     31.50 =C2=B1 33%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#2.c=
pu_load[2]
     34.00 =C2=B1 31%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#2.c=
pu_load[3]
     41.50 =C2=B1 27%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#2.c=
pu_load[4]
    755.25 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#2.c=
urr->pid
    437.25 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#2.l=
oad
    500000 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#2.m=
ax_idle_balance_cost
      4294 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#2.n=
ext_balance
      4770 =C2=B1 35%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#2.n=
r_load_updates
      1.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#2.n=
r_running
      9692 =C2=B1 35%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#2.n=
r_switches
      9717 =C2=B1 35%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#2.s=
ched_count
      4001 =C2=B1 41%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#2.s=
ched_goidle
      4181 =C2=B1 38%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#2.t=
twu_count
      3159 =C2=B1 51%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#2.t=
twu_local
    304004 =C2=B1 28%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#3.a=
vg_idle
     19748 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#3.c=
lock
     19748 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#3.c=
lock_task
     23.50 =C2=B1 86%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#3.c=
pu_load[1]
     30.75 =C2=B1 29%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#3.c=
pu_load[2]
     34.00 =C2=B1 28%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#3.c=
pu_load[3]
     40.00 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#3.c=
pu_load[4]
    500000 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#3.m=
ax_idle_balance_cost
      4294 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#3.n=
ext_balance
      3224 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#3.n=
r_load_updates
      6232 =C2=B1 21%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#3.n=
r_switches
      6258 =C2=B1 21%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#3.s=
ched_count
      2167 =C2=B1 24%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#3.s=
ched_goidle
      2988 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#3.t=
twu_count
      1605 =C2=B1 39%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#3.t=
twu_local
      7.26 =C2=B1 44%    +188.3%      20.94 =C2=B1  0%  sched_debug.rt_rq[0=
]:/.rt_time
    950.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.rt_rq[1=
]:/.rt_runtime
      7.07 =C2=B1 40%    -100.0%       0.00 =C2=B1 -1%  sched_debug.rt_rq[1=
]:/.rt_time
    950.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.rt_rq[2=
]:/.rt_runtime
      4.36 =C2=B1 46%    -100.0%       0.00 =C2=B1 -1%  sched_debug.rt_rq[2=
]:/.rt_time
    950.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.rt_rq[3=
]:/.rt_runtime
      0.98 =C2=B1 41%    -100.0%       0.00 =C2=B1 -1%  sched_debug.rt_rq[3=
]:/.rt_time
     18.00 =C2=B1  0%     -66.7%       6.00 =C2=B1  0%  sched_debug.sysctl_=
sched.sysctl_sched_latency
      2.25 =C2=B1  0%     -66.7%       0.75 =C2=B1  0%  sched_debug.sysctl_=
sched.sysctl_sched_min_granularity
      3.00 =C2=B1  0%     -66.7%       1.00 =C2=B1  0%  sched_debug.sysctl_=
sched.sysctl_sched_wakeup_granularity

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/testcase:
  gcc-4.9/performance/x86_64-rhel/200%/debian-x86_64-2015-02-07.cgz/lkp-nex=
04/kbuild

commit: =

  8025943c32f5de29b3fd548e917e24424297ca73
  0aefb957de5f2a1d9467126114146b6c793cf180

8025943c32f5de29 0aefb957de5f2a1d9467126114 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    104.84 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  kbuild.time.elapsed=
_time
    104.84 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  kbuild.time.elapsed=
_time.max
    412541 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  kbuild.time.involun=
tary_context_switches
    121633 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  kbuild.time.maximum=
_resident_set_size
  52747117 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  kbuild.time.minor_p=
age_faults
      4096 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  kbuild.time.page_si=
ze
      3778 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  kbuild.time.percent=
_of_cpu_this_job_got
    379.86 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  kbuild.time.system_=
time
      3570 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  kbuild.time.user_ti=
me
    288008 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  kbuild.time.volunta=
ry_context_switches
    142.44 =C2=B1  3%   +1089.5%       1694 =C2=B1  0%  uptime.boot
      5002 =C2=B1  7%     -99.7%      13.52 =C2=B1  5%  uptime.idle
    904720 =C2=B1  0%     -85.4%     131979 =C2=B1  0%  softirqs.RCU
    121427 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  softirqs.SCHED
   2361233 =C2=B1  0%     -64.0%     850141 =C2=B1  0%  softirqs.TIMER
   1480596 =C2=B1  0%     -13.3%    1284395 =C2=B1  0%  vmstat.memory.cache
     76.75 =C2=B1  4%     +66.1%     127.50 =C2=B1  0%  vmstat.procs.r
     12767 =C2=B1  3%     -72.7%       3483 =C2=B1  0%  vmstat.system.cs
     98762 =C2=B1  4%     -98.9%       1097 =C2=B1  0%  vmstat.system.in
     59.72 =C2=B1  5%     +67.4%      99.99 =C2=B1  0%  turbostat.%Busy
      1391 =C2=B1  5%     +72.0%       2392 =C2=B1  0%  turbostat.Avg_MHz
      2.19 =C2=B1  6%     -99.4%       0.01 =C2=B1 66%  turbostat.CPU%c1
     38.09 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  turbostat.CPU%c3
     21.12 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  turbostat.Pkg%pc3
   5495433 =C2=B1 17%    -100.0%     215.25 =C2=B1 23%  cpuidle.C1-NHM.time
     31751 =C2=B1 26%    -100.0%       3.75 =C2=B1 29%  cpuidle.C1-NHM.usage
   1805244 =C2=B1 37%    -100.0%      72.25 =C2=B1104%  cpuidle.C1E-NHM.time
      3774 =C2=B1  1%     -99.9%       2.00 =C2=B1 50%  cpuidle.C1E-NHM.usa=
ge
 2.731e+09 =C2=B1 13%    -100.0%     191811 =C2=B1 62%  cpuidle.C3-NHM.time
    130803 =C2=B1  6%    -100.0%      33.00 =C2=B1 40%  cpuidle.C3-NHM.usage
     15662 =C2=B1171%    -100.0%       0.00 =C2=B1  0%  cpuidle.POLL.time
     10.00 =C2=B1 12%    -100.0%       0.00 =C2=B1  0%  cpuidle.POLL.usage
  11799872 =C2=B1  0%    +151.4%   29663670 =C2=B1  0%  numa-numastat.node0=
.local_node
  11803235 =C2=B1  0%    +151.3%   29663670 =C2=B1  0%  numa-numastat.node0=
.numa_hit
      3363 =C2=B1 40%    -100.0%       0.00 =C2=B1 -1%  numa-numastat.node0=
.other_node
  11101506 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  numa-numastat.node1=
.local_node
  11105625 =C2=B1  2%    -100.0%       3.25 =C2=B1 13%  numa-numastat.node1=
.numa_hit
      4119 =C2=B1 42%     -99.9%       3.25 =C2=B1 13%  numa-numastat.node1=
.other_node
  11853583 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  numa-numastat.node2=
.local_node
  11858825 =C2=B1  0%    -100.0%       3.50 =C2=B1 14%  numa-numastat.node2=
.numa_hit
      5242 =C2=B1  0%     -99.9%       3.50 =C2=B1 14%  numa-numastat.node2=
.other_node
  11573634 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  numa-numastat.node3=
.local_node
  11576259 =C2=B1  3%    -100.0%       5.25 =C2=B1 34%  numa-numastat.node3=
.numa_hit
    104.84 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  time.elapsed_time
    104.84 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  time.elapsed_time.m=
ax
     72.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  time.file_system_ou=
tputs
    412541 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  time.involuntary_co=
ntext_switches
    121633 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  time.maximum_reside=
nt_set_size
  52747117 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  time.minor_page_fau=
lts
      4096 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  time.page_size
      3778 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  time.percent_of_cpu=
_this_job_got
    379.86 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  time.system_time
      3570 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  time.user_time
    288008 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  time.voluntary_cont=
ext_switches
   2066024 =C2=B1  3%     +60.5%    3315086 =C2=B1  0%  meminfo.Active
   1794443 =C2=B1  4%     +70.8%    3065010 =C2=B1  0%  meminfo.Active(anon)
     22315 =C2=B1  6%    +403.0%     112252 =C2=B1  2%  meminfo.AnonHugePag=
es
   1696178 =C2=B1  4%     +80.3%    3057526 =C2=B1  0%  meminfo.AnonPages
   1272562 =C2=B1  1%      -9.9%    1146164 =C2=B1  0%  meminfo.Cached
   1880690 =C2=B1  3%     +82.9%    3439557 =C2=B1  0%  meminfo.Committed_AS
    131011 =C2=B1 17%     -73.9%      34239 =C2=B1  2%  meminfo.DirectMap4k
     19678 =C2=B1  2%     -49.1%      10014 =C2=B1  0%  meminfo.Inactive(an=
on)
     37596 =C2=B1  3%     -13.2%      32645 =C2=B1  0%  meminfo.Mapped
     22047 =C2=B1  5%     +55.7%      34324 =C2=B1  0%  meminfo.PageTables
    101076 =C2=B1  0%     -15.5%      85395 =C2=B1  0%  meminfo.SReclaimable
    106116 =C2=B1  0%     -50.2%      52881 =C2=B1  0%  meminfo.SUnreclaim
    117627 =C2=B1  5%     -87.7%      14428 =C2=B1  0%  meminfo.Shmem
    207193 =C2=B1  0%     -33.3%     138276 =C2=B1  0%  meminfo.Slab
    449109 =C2=B1  4%     +70.6%     766102 =C2=B1  0%  proc-vmstat.nr_acti=
ve_anon
    424353 =C2=B1  4%     +80.1%     764234 =C2=B1  0%  proc-vmstat.nr_anon=
_pages
    318120 =C2=B1  1%      -9.9%     286543 =C2=B1  0%  proc-vmstat.nr_file=
_pages
      4894 =C2=B1  2%     -48.9%       2503 =C2=B1  0%  proc-vmstat.nr_inac=
tive_anon
      9339 =C2=B1  2%     -12.6%       8162 =C2=B1  0%  proc-vmstat.nr_mapp=
ed
      5499 =C2=B1  4%     +56.0%       8579 =C2=B1  0%  proc-vmstat.nr_page=
_table_pages
     29375 =C2=B1  5%     -87.7%       3607 =C2=B1  0%  proc-vmstat.nr_shmem
     25268 =C2=B1  0%     -15.5%      21348 =C2=B1  0%  proc-vmstat.nr_slab=
_reclaimable
     26527 =C2=B1  0%     -50.2%      13219 =C2=B1  0%  proc-vmstat.nr_slab=
_unreclaimable
    755717 =C2=B1  1%     -91.8%      61736 =C2=B1  9%  proc-vmstat.numa_hi=
nt_faults
    689912 =C2=B1  2%     -91.1%      61700 =C2=B1  9%  proc-vmstat.numa_hi=
nt_faults_local
  46356067 =C2=B1  0%     -36.0%   29659695 =C2=B1  0%  proc-vmstat.numa_hit
  46343679 =C2=B1  0%     -36.0%   29659683 =C2=B1  0%  proc-vmstat.numa_lo=
cal
     12388 =C2=B1  0%     -99.9%      12.00 =C2=B1 21%  proc-vmstat.numa_ot=
her
     57823 =C2=B1 21%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.numa_pa=
ges_migrated
   1990271 =C2=B1  1%     -80.1%     395921 =C2=B1  2%  proc-vmstat.numa_pt=
e_updates
    162988 =C2=B1  0%     -60.6%      64139 =C2=B1  0%  proc-vmstat.pgactiv=
ate
    655192 =C2=B1  0%     +44.2%     944722 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
  46328460 =C2=B1  0%     -35.8%   29750505 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
  53042719 =C2=B1  0%     -36.4%   33736338 =C2=B1  0%  proc-vmstat.pgfault
  46867311 =C2=B1  0%     -36.4%   29785295 =C2=B1  0%  proc-vmstat.pgfree
    315.50 =C2=B1 79%     -88.7%      35.75 =C2=B1 36%  proc-vmstat.pgmigra=
te_fail
     57823 =C2=B1 21%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.pgmigra=
te_success
     49.00 =C2=B1 18%   +2333.2%       1192 =C2=B1  0%  proc-vmstat.thp_col=
lapse_alloc
   1665376 =C2=B1 10%    +319.3%    6982441 =C2=B1  0%  latency_stats.avg.a=
sync_synchronize_cookie_domain.async_synchronize_full.do_init_module.load_m=
odule.SyS_finit_module.entry_SYSCALL_64_fastpath
      4338 =C2=B1 67%   +1052.7%      50004 =C2=B1141%  latency_stats.avg.c=
all_rwsem_down_read_failed.rmap_walk.remove_migration_ptes.migrate_pages.mi=
grate_misplaced_page.handle_mm_fault.__do_page_fault.do_page_fault.page_fau=
lt
      2125 =C2=B1 67%   +3514.0%      76816 =C2=B1 12%  latency_stats.avg.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.f=
lush_old_exec.load_elf_binary.search_binary_handler.do_execveat_common.SyS_=
execve.return_from_execve
    795.75 =C2=B1129%   +9140.8%      73534 =C2=B1 18%  latency_stats.avg.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.split_vma.mprotect_fixup=
.SyS_mprotect.entry_SYSCALL_64_fastpath
      1165 =C2=B1 74%   +4634.4%      55191 =C2=B1 13%  latency_stats.avg.c=
all_rwsem_down_write_failed.vma_link.mmap_region.do_mmap.vm_mmap_pgoff.SyS_=
mmap_pgoff.SyS_mmap.entry_SYSCALL_64_fastpath
      5711 =C2=B1125%   +1029.5%      64513 =C2=B1 22%  latency_stats.avg.c=
all_rwsem_down_write_failed.vma_link.mmap_region.do_mmap.vm_mmap_pgoff.vm_m=
map.elf_map.load_elf_binary.search_binary_handler.do_execveat_common.SyS_ex=
ecve.return_from_execve
    122831 =C2=B1100%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.c=
all_usermodehelper_exec.__request_module.misc_open.chrdev_open.do_dentry_op=
en.vfs_open.path_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_=
fastpath
      0.00 =C2=B1 -1%      +Inf%      39597 =C2=B1108%  latency_stats.avg.d=
o_unlinkat.SyS_unlink.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      73352 =C2=B1 25%  latency_stats.avg.d=
o_unlinkat.SyS_unlinkat.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      49371 =C2=B1 75%  latency_stats.avg.f=
ilename_create.SyS_mkdir.entry_SYSCALL_64_fastpath
     35223 =C2=B1  6%     -94.2%       2047 =C2=B1101%  latency_stats.avg.f=
lush_work.__cancel_work_timer.cancel_delayed_work_sync.disk_block_events.__=
blkdev_get.blkdev_get.blkdev_open.do_dentry_open.vfs_open.path_openat.do_fi=
lp_open.do_sys_open
      0.00 =C2=B1 -1%      +Inf%   14611942 =C2=B1 33%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      8426 =C2=B1 65%    +768.5%      73176 =C2=B1 22%  latency_stats.avg.w=
alk_component.path_lookupat.filename_lookup.user_path_at_empty.vfs_fstatat.=
SYSC_newstat.SyS_newstat.entry_SYSCALL_64_fastpath
    218812 =C2=B1  1%    +522.6%    1362320 =C2=B1  0%  latency_stats.hits.=
pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      9134 =C2=B1 68%    +804.7%      82637 =C2=B1141%  latency_stats.max.c=
all_rwsem_down_read_failed.rmap_walk.remove_migration_ptes.migrate_pages.mi=
grate_misplaced_page.handle_mm_fault.__do_page_fault.do_page_fault.page_fau=
lt
     12282 =C2=B1 53%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_m=
unmap.vm_munmap.elf_map.load_elf_binary.search_binary_handler.do_execveat_c=
ommon.SyS_execve.return_from_execve
      7134 =C2=B1 37%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.do_munmap.vm_munmap.elf_=
map.load_elf_binary.search_binary_handler.do_execveat_common.SyS_execve.ret=
urn_from_execve
     12658 =C2=B1 50%    +874.7%     123382 =C2=B1  3%  latency_stats.max.c=
all_rwsem_down_write_failed.vma_link.mmap_region.do_mmap.vm_mmap_pgoff.SyS_=
mmap_pgoff.SyS_mmap.entry_SYSCALL_64_fastpath
    122831 =C2=B1100%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.c=
all_usermodehelper_exec.__request_module.misc_open.chrdev_open.do_dentry_op=
en.vfs_open.path_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_=
fastpath
      0.00 =C2=B1 -1%      +Inf%      43262 =C2=B1112%  latency_stats.max.d=
o_unlinkat.SyS_unlink.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%     118159 =C2=B1  3%  latency_stats.max.d=
o_unlinkat.SyS_unlinkat.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      49371 =C2=B1 75%  latency_stats.max.f=
ilename_create.SyS_mkdir.entry_SYSCALL_64_fastpath
    168505 =C2=B1  9%     -95.9%       6848 =C2=B1 99%  latency_stats.max.f=
lush_work.__cancel_work_timer.cancel_delayed_work_sync.disk_block_events.__=
blkdev_get.blkdev_get.blkdev_open.do_dentry_open.vfs_open.path_openat.do_fi=
lp_open.do_sys_open
      0.00 =C2=B1 -1%      +Inf%   51311280 =C2=B1 63%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      5000 =C2=B1  0%   +4875.6%     248777 =C2=B1 16%  latency_stats.max.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     14429 =C2=B1 40%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.w=
ait_on_page_bit.__migration_entry_wait.migration_entry_wait.handle_mm_fault=
.__do_page_fault.do_page_fault.page_fault
     12322 =C2=B1 64%   +1089.5%     146575 =C2=B1 28%  latency_stats.max.w=
alk_component.path_lookupat.filename_lookup.user_path_at_empty.vfs_fstatat.=
SYSC_newstat.SyS_newstat.entry_SYSCALL_64_fastpath
     90763 =C2=B1 20%     -91.4%       7823 =C2=B1 30%  latency_stats.sum.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
     20718 =C2=B1 72%    +624.0%     150011 =C2=B1141%  latency_stats.sum.c=
all_rwsem_down_read_failed.rmap_walk.remove_migration_ptes.migrate_pages.mi=
grate_misplaced_page.handle_mm_fault.__do_page_fault.do_page_fault.page_fau=
lt
    243636 =C2=B1 75%    +778.5%    2140388 =C2=B1 42%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.f=
lush_old_exec.load_elf_binary.search_binary_handler.do_execveat_common.SyS_=
execve.return_from_execve
      5951 =C2=B1 82%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_m=
unmap.mmap_region.do_mmap.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.entry_SYSCA=
LL_64_fastpath
     20277 =C2=B1 33%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_m=
unmap.vm_munmap.elf_map.load_elf_binary.search_binary_handler.do_execveat_c=
ommon.SyS_execve.return_from_execve
     14602 =C2=B1 44%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.do_munmap.vm_munmap.elf_=
map.load_elf_binary.search_binary_handler.do_execveat_common.SyS_execve.ret=
urn_from_execve
     53613 =C2=B1 82%   +1634.2%     929747 =C2=B1 23%  latency_stats.sum.c=
all_rwsem_down_write_failed.vma_link.mmap_region.do_mmap.vm_mmap_pgoff.SyS_=
mmap_pgoff.SyS_mmap.entry_SYSCALL_64_fastpath
    122831 =C2=B1100%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_usermodehelper_exec.__request_module.misc_open.chrdev_open.do_dentry_op=
en.vfs_open.path_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_=
fastpath
      0.00 =C2=B1 -1%      +Inf%      65312 =C2=B1128%  latency_stats.sum.d=
o_unlinkat.SyS_unlink.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%     308983 =C2=B1 33%  latency_stats.sum.d=
o_unlinkat.SyS_unlinkat.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      49371 =C2=B1 75%  latency_stats.sum.f=
ilename_create.SyS_mkdir.entry_SYSCALL_64_fastpath
    193289 =C2=B1  9%     -96.4%       6943 =C2=B1 98%  latency_stats.sum.f=
lush_work.__cancel_work_timer.cancel_delayed_work_sync.disk_block_events.__=
blkdev_get.blkdev_get.blkdev_open.do_dentry_open.vfs_open.path_openat.do_fi=
lp_open.do_sys_open
      0.00 =C2=B1 -1%      +Inf%   1.36e+08 =C2=B1 63%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
 1.188e+08 =C2=B1  3%     -82.5%   20794203 =C2=B1  2%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      4281 =C2=B1  5%    +327.1%      18286 =C2=B1 19%  latency_stats.sum.u=
nix_wait_for_peer.unix_dgram_sendmsg.sock_sendmsg.___sys_sendmsg.__sys_send=
msg.SyS_sendmsg.entry_SYSCALL_64_fastpath
     26548 =C2=B1 57%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.w=
ait_on_page_bit.__migration_entry_wait.migration_entry_wait.handle_mm_fault=
.__do_page_fault.do_page_fault.page_fault
     27361 =C2=B1107%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.w=
ait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.hand=
le_mm_fault.__do_page_fault.do_page_fault.page_fault
  18947055 =C2=B1  2%     -93.3%    1266142 =C2=B1  3%  latency_stats.sum.w=
ait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpa=
th
  71501253 =C2=B1 15%    +638.0%  5.277e+08 =C2=B1 11%  latency_stats.sum.w=
alk_component.link_path_walk.path_openat.do_filp_open.do_sys_open.SyS_open.=
entry_SYSCALL_64_fastpath
     26943 =C2=B1 78%   +4133.8%    1140734 =C2=B1 68%  latency_stats.sum.w=
alk_component.path_lookupat.filename_lookup.user_path_at_empty.vfs_fstatat.=
SYSC_newstat.SyS_newstat.entry_SYSCALL_64_fastpath
    110139 =C2=B1 11%    +589.8%     759693 =C2=B1  0%  numa-vmstat.node0.n=
r_active_anon
     16984 =C2=B1  6%     +14.5%      19449 =C2=B1  1%  numa-vmstat.node0.n=
r_active_file
    104129 =C2=B1  5%    +627.8%     757813 =C2=B1  0%  numa-vmstat.node0.n=
r_anon_pages
    679.50 =C2=B1146%    +268.4%       2503 =C2=B1  0%  numa-vmstat.node0.n=
r_inactive_anon
    433.50 =C2=B1  2%    +113.2%     924.25 =C2=B1  0%  numa-vmstat.node0.n=
r_kernel_stack
      1872 =C2=B1  2%     +67.1%       3128 =C2=B1  0%  numa-vmstat.node0.n=
r_mapped
      1320 =C2=B1  9%    +544.5%       8510 =C2=B1  0%  numa-vmstat.node0.n=
r_page_table_pages
      5854 =C2=B1  6%     +34.8%       7893 =C2=B1  1%  numa-vmstat.node0.n=
r_slab_reclaimable
     57.50 =C2=B1100%    +125.7%     129.75 =C2=B1  2%  numa-vmstat.node0.n=
r_written
   5938372 =C2=B1  0%    +159.4%   15406922 =C2=B1  0%  numa-vmstat.node0.n=
uma_hit
   5932132 =C2=B1  0%    +159.7%   15406922 =C2=B1  0%  numa-vmstat.node0.n=
uma_local
      6239 =C2=B1 25%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node0.n=
uma_other
    108408 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_active_anon
     16904 =C2=B1  1%     -15.7%      14256 =C2=B1  0%  numa-vmstat.node1.n=
r_active_file
    299.00 =C2=B1  3%     -42.3%     172.50 =C2=B1 10%  numa-vmstat.node1.n=
r_alloc_batch
    102542 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_anon_pages
    716.50 =C2=B1154%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_inactive_anon
    209.25 =C2=B1  2%     -61.8%      80.00 =C2=B1  0%  numa-vmstat.node1.n=
r_kernel_stack
      1944 =C2=B1  7%     -13.9%       1673 =C2=B1  0%  numa-vmstat.node1.n=
r_mapped
      1290 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_page_table_pages
      6538 =C2=B1169%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_shmem
      6193 =C2=B1 13%     -26.5%       4555 =C2=B1  2%  numa-vmstat.node1.n=
r_slab_reclaimable
      6407 =C2=B1  5%     -73.1%       1726 =C2=B1  4%  numa-vmstat.node1.n=
r_slab_unreclaimable
   5623718 =C2=B1  3%     -98.3%      95861 =C2=B1  0%  numa-vmstat.node1.n=
uma_hit
   5523150 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
uma_local
    107833 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_active_anon
     17345 =C2=B1  3%     -16.4%      14492 =C2=B1  1%  numa-vmstat.node2.n=
r_active_file
    568.00 =C2=B1  3%     +21.2%     688.50 =C2=B1  2%  numa-vmstat.node2.n=
r_alloc_batch
    107789 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_anon_pages
    579.25 =C2=B1153%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_inactive_anon
    229.25 =C2=B1  5%     -65.1%      80.00 =C2=B1  0%  numa-vmstat.node2.n=
r_kernel_stack
      2230 =C2=B1 27%     -24.9%       1673 =C2=B1  0%  numa-vmstat.node2.n=
r_mapped
      1496 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_page_table_pages
    628.50 =C2=B1139%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_shmem
      6596 =C2=B1  5%     -32.9%       4424 =C2=B1  2%  numa-vmstat.node2.n=
r_slab_reclaimable
      6283 =C2=B1  5%     -72.5%       1726 =C2=B1  3%  numa-vmstat.node2.n=
r_slab_unreclaimable
   5929199 =C2=B1  0%     -98.4%      95779 =C2=B1  0%  numa-vmstat.node2.n=
uma_hit
   5826957 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
uma_local
    116961 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_active_anon
     16707 =C2=B1  2%     -13.9%      14380 =C2=B1  3%  numa-vmstat.node3.n=
r_active_file
    561.25 =C2=B1 10%     +19.1%     668.50 =C2=B1  2%  numa-vmstat.node3.n=
r_alloc_batch
    104224 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_anon_pages
     87508 =C2=B1 16%     -22.8%      67595 =C2=B1  0%  numa-vmstat.node3.n=
r_file_pages
      2769 =C2=B1 66%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_inactive_anon
    237.00 =C2=B1  3%     -66.2%      80.00 =C2=B1  0%  numa-vmstat.node3.n=
r_kernel_stack
      2984 =C2=B1 21%     -43.9%       1673 =C2=B1  0%  numa-vmstat.node3.n=
r_mapped
      1427 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_page_table_pages
     15490 =C2=B1 93%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_shmem
      6616 =C2=B1  6%     -32.3%       4477 =C2=B1  3%  numa-vmstat.node3.n=
r_slab_reclaimable
      6653 =C2=B1  4%     -72.6%       1821 =C2=B1  2%  numa-vmstat.node3.n=
r_slab_unreclaimable
   5847574 =C2=B1  3%     -98.4%      95859 =C2=B1  0%  numa-vmstat.node3.n=
uma_hit
   5748223 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
uma_local
    509957 =C2=B1  9%    +511.3%    3117196 =C2=B1  0%  numa-meminfo.node0.=
Active
    442054 =C2=B1 11%    +587.6%    3039390 =C2=B1  0%  numa-meminfo.node0.=
Active(anon)
     67901 =C2=B1  6%     +14.6%      77805 =C2=B1  1%  numa-meminfo.node0.=
Active(file)
      4423 =C2=B1 15%   +2423.8%     111633 =C2=B1  2%  numa-meminfo.node0.=
AnonHugePages
    418189 =C2=B1  5%    +625.0%    3031716 =C2=B1  0%  numa-meminfo.node0.=
AnonPages
    224231 =C2=B1  2%     +12.9%     253176 =C2=B1  0%  numa-meminfo.node0.=
Inactive
      2729 =C2=B1147%    +266.9%      10012 =C2=B1  0%  numa-meminfo.node0.=
Inactive(anon)
      6946 =C2=B1  2%    +113.0%      14795 =C2=B1  0%  numa-meminfo.node0.=
KernelStack
      7512 =C2=B1  4%     +66.7%      12521 =C2=B1  0%  numa-meminfo.node0.=
Mapped
    984792 =C2=B1  6%    +268.3%    3627071 =C2=B1  0%  numa-meminfo.node0.=
MemUsed
      5295 =C2=B1  9%    +543.1%      34049 =C2=B1  0%  numa-meminfo.node0.=
PageTables
     23417 =C2=B1  6%     +34.8%      31574 =C2=B1  1%  numa-meminfo.node0.=
SReclaimable
     52037 =C2=B1  4%     +21.6%      63262 =C2=B1  0%  numa-meminfo.node0.=
Slab
    499568 =C2=B1 10%     -88.6%      57028 =C2=B1  0%  numa-meminfo.node1.=
Active
    431939 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
Active(anon)
     67627 =C2=B1  1%     -15.7%      57028 =C2=B1  0%  numa-meminfo.node1.=
Active(file)
      3606 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
AnonHugePages
    408452 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
AnonPages
      2780 =C2=B1153%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
Inactive(anon)
      3359 =C2=B1  2%     -61.9%       1280 =C2=B1  0%  numa-meminfo.node1.=
KernelStack
      7686 =C2=B1  5%     -12.9%       6695 =C2=B1  0%  numa-meminfo.node1.=
Mapped
    941516 =C2=B1  7%     -57.2%     403269 =C2=B1  0%  numa-meminfo.node1.=
MemUsed
      5218 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
PageTables
     24774 =C2=B1 13%     -26.5%      18220 =C2=B1  2%  numa-meminfo.node1.=
SReclaimable
     25634 =C2=B1  5%     -73.1%       6907 =C2=B1  4%  numa-meminfo.node1.=
SUnreclaim
     26059 =C2=B1169%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
Shmem
     50409 =C2=B1  8%     -50.2%      25127 =C2=B1  2%  numa-meminfo.node1.=
Slab
    502526 =C2=B1  3%     -88.5%      57971 =C2=B1  1%  numa-meminfo.node2.=
Active
    433231 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
Active(anon)
     69294 =C2=B1  3%     -16.3%      57971 =C2=B1  1%  numa-meminfo.node2.=
Active(file)
      5696 =C2=B1 38%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
AnonHugePages
    432924 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
AnonPages
      2324 =C2=B1152%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
Inactive(anon)
      3667 =C2=B1  6%     -65.1%       1280 =C2=B1  0%  numa-meminfo.node2.=
KernelStack
      8914 =C2=B1 27%     -24.9%       6698 =C2=B1  0%  numa-meminfo.node2.=
Mapped
    957199 =C2=B1  2%     -57.9%     402880 =C2=B1  0%  numa-meminfo.node2.=
MemUsed
      5993 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
PageTables
     26387 =C2=B1  5%     -32.9%      17696 =C2=B1  2%  numa-meminfo.node2.=
SReclaimable
     25142 =C2=B1  5%     -72.5%       6906 =C2=B1  3%  numa-meminfo.node2.=
SUnreclaim
      2526 =C2=B1138%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
Shmem
     51530 =C2=B1  5%     -52.3%      24602 =C2=B1  1%  numa-meminfo.node2.=
Slab
    534938 =C2=B1  6%     -89.2%      57522 =C2=B1  3%  numa-meminfo.node3.=
Active
    468139 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
Active(anon)
     66798 =C2=B1  2%     -13.9%      57522 =C2=B1  3%  numa-meminfo.node3.=
Active(file)
      8733 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
AnonHugePages
    417249 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
AnonPages
    350026 =C2=B1 16%     -22.8%     270382 =C2=B1  0%  numa-meminfo.node3.=
FilePages
    232290 =C2=B1  3%      -8.4%     212855 =C2=B1  0%  numa-meminfo.node3.=
Inactive
     11082 =C2=B1 66%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
Inactive(anon)
      3810 =C2=B1  4%     -66.4%       1280 =C2=B1  0%  numa-meminfo.node3.=
KernelStack
     11993 =C2=B1 21%     -44.1%       6698 =C2=B1  0%  numa-meminfo.node3.=
Mapped
    992484 =C2=B1  4%     -59.3%     403674 =C2=B1  0%  numa-meminfo.node3.=
MemUsed
      5683 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
PageTables
     26471 =C2=B1  6%     -32.3%      17910 =C2=B1  3%  numa-meminfo.node3.=
SReclaimable
     26622 =C2=B1  4%     -72.6%       7285 =C2=B1  1%  numa-meminfo.node3.=
SUnreclaim
     61961 =C2=B1 93%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
Shmem
     53094 =C2=B1  2%     -52.5%      25195 =C2=B1  1%  numa-meminfo.node3.=
Slab
     12113 =C2=B1  0%     -48.7%       6220 =C2=B1  0%  slabinfo.Acpi-Names=
pace.active_objs
     12113 =C2=B1  0%     -48.7%       6220 =C2=B1  0%  slabinfo.Acpi-Names=
pace.num_objs
     45248 =C2=B1  0%     -15.3%      38340 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.active_objs
    808.00 =C2=B1  0%     -15.2%     685.50 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.active_slabs
     45248 =C2=B1  0%     -15.2%      38388 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.num_objs
    808.00 =C2=B1  0%     -15.2%     685.50 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.num_slabs
      2457 =C2=B1  0%     -96.9%      77.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.active_objs
      2457 =C2=B1  0%     -96.9%      77.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.num_objs
    101478 =C2=B1  0%     -10.4%      90897 =C2=B1  0%  slabinfo.Acpi-State=
.active_objs
      1991 =C2=B1  0%     -10.5%       1782 =C2=B1  0%  slabinfo.Acpi-State=
.active_slabs
    101558 =C2=B1  0%     -10.5%      90924 =C2=B1  0%  slabinfo.Acpi-State=
.num_objs
      1991 =C2=B1  0%     -10.5%       1782 =C2=B1  0%  slabinfo.Acpi-State=
.num_slabs
      2381 =C2=B1  1%     -89.0%     261.00 =C2=B1  5%  slabinfo.RAW.active=
_objs
      2381 =C2=B1  1%     -89.0%     261.00 =C2=B1  5%  slabinfo.RAW.num_ob=
js
    119.00 =C2=B1  0%     -85.7%      17.00 =C2=B1  0%  slabinfo.TCP.active=
_objs
    119.00 =C2=B1  0%     -85.7%      17.00 =C2=B1  0%  slabinfo.TCP.num_ob=
js
    280.50 =C2=B1  5%     -87.9%      34.00 =C2=B1  0%  slabinfo.UDP.active=
_objs
    280.50 =C2=B1  5%     -87.9%      34.00 =C2=B1  0%  slabinfo.UDP.num_ob=
js
     32761 =C2=B1  1%     -75.7%       7962 =C2=B1  0%  slabinfo.anon_vma.a=
ctive_objs
    644.75 =C2=B1  1%     -74.8%     162.25 =C2=B1  0%  slabinfo.anon_vma.a=
ctive_slabs
     32914 =C2=B1  1%     -74.8%       8298 =C2=B1  0%  slabinfo.anon_vma.n=
um_objs
    644.75 =C2=B1  1%     -74.8%     162.25 =C2=B1  0%  slabinfo.anon_vma.n=
um_slabs
    727.75 =C2=B1 12%     -90.0%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.active_objs
    727.75 =C2=B1 12%     -90.0%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.num_objs
    286.75 =C2=B1 14%     -86.4%      39.00 =C2=B1  0%  slabinfo.bdev_cache=
.active_objs
    286.75 =C2=B1 14%     -86.4%      39.00 =C2=B1  0%  slabinfo.bdev_cache=
.num_objs
    850.50 =C2=B1 11%     -94.8%      44.00 =C2=B1  0%  slabinfo.blkdev_req=
uests.active_objs
    850.50 =C2=B1 11%     -94.8%      44.00 =C2=B1  0%  slabinfo.blkdev_req=
uests.num_objs
    102815 =C2=B1  0%     -11.7%      90801 =C2=B1  0%  slabinfo.dentry.act=
ive_objs
      2514 =C2=B1  0%     -14.0%       2163 =C2=B1  0%  slabinfo.dentry.act=
ive_slabs
    105626 =C2=B1  0%     -14.0%      90887 =C2=B1  0%  slabinfo.dentry.num=
_objs
      2514 =C2=B1  0%     -14.0%       2163 =C2=B1  0%  slabinfo.dentry.num=
_slabs
    530.75 =C2=B1 10%     -92.7%      39.00 =C2=B1  0%  slabinfo.file_lock_=
cache.active_objs
    530.75 =C2=B1 10%     -92.7%      39.00 =C2=B1  0%  slabinfo.file_lock_=
cache.num_objs
      3108 =C2=B1  0%     -76.5%     729.75 =C2=B1  0%  slabinfo.files_cach=
e.active_objs
      3108 =C2=B1  0%     -76.5%     729.75 =C2=B1  0%  slabinfo.files_cach=
e.num_objs
      3970 =C2=B1  2%     -12.2%       3485 =C2=B1  0%  slabinfo.ftrace_eve=
nt_field.active_objs
      3970 =C2=B1  2%     -12.2%       3485 =C2=B1  0%  slabinfo.ftrace_eve=
nt_field.num_objs
      2129 =C2=B1  1%     -45.0%       1170 =C2=B1  0%  slabinfo.idr_layer_=
cache.active_objs
      2129 =C2=B1  1%     -45.0%       1170 =C2=B1  0%  slabinfo.idr_layer_=
cache.num_objs
     55954 =C2=B1  0%     -30.7%      38763 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.active_objs
      1645 =C2=B1  0%     -30.7%       1139 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.active_slabs
     55954 =C2=B1  0%     -30.7%      38763 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.num_objs
      1645 =C2=B1  0%     -30.7%       1139 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.num_slabs
      3558 =C2=B1  0%     -72.7%     972.50 =C2=B1  0%  slabinfo.kmalloc-10=
24.active_objs
      3687 =C2=B1  0%     -72.3%       1020 =C2=B1  1%  slabinfo.kmalloc-10=
24.num_objs
      5673 =C2=B1  2%     -58.0%       2380 =C2=B1  0%  slabinfo.kmalloc-12=
8.active_objs
    177.00 =C2=B1  2%     -57.6%      75.00 =C2=B1  0%  slabinfo.kmalloc-12=
8.active_slabs
      5673 =C2=B1  2%     -57.3%       2424 =C2=B1  0%  slabinfo.kmalloc-12=
8.num_objs
    177.00 =C2=B1  2%     -57.6%      75.00 =C2=B1  0%  slabinfo.kmalloc-12=
8.num_slabs
     21548 =C2=B1  0%     -54.6%       9784 =C2=B1  0%  slabinfo.kmalloc-16=
.active_objs
     21548 =C2=B1  0%     -52.7%      10200 =C2=B1  0%  slabinfo.kmalloc-16=
.num_objs
     17530 =C2=B1  2%     -73.2%       4704 =C2=B1  0%  slabinfo.kmalloc-19=
2.active_objs
    434.25 =C2=B1  2%     -73.2%     116.25 =C2=B1  0%  slabinfo.kmalloc-19=
2.active_slabs
     18270 =C2=B1  2%     -73.2%       4900 =C2=B1  0%  slabinfo.kmalloc-19=
2.num_objs
    434.25 =C2=B1  2%     -73.2%     116.25 =C2=B1  0%  slabinfo.kmalloc-19=
2.num_slabs
      3461 =C2=B1  2%     -79.2%     718.75 =C2=B1  0%  slabinfo.kmalloc-20=
48.active_objs
    220.00 =C2=B1  2%     -78.8%      46.75 =C2=B1  0%  slabinfo.kmalloc-20=
48.active_slabs
      3534 =C2=B1  2%     -78.7%     751.75 =C2=B1  0%  slabinfo.kmalloc-20=
48.num_objs
    220.00 =C2=B1  2%     -78.8%      46.75 =C2=B1  0%  slabinfo.kmalloc-20=
48.num_slabs
     11286 =C2=B1  1%     -57.5%       4801 =C2=B1  0%  slabinfo.kmalloc-25=
6.active_objs
    394.75 =C2=B1  0%     -56.2%     172.75 =C2=B1  2%  slabinfo.kmalloc-25=
6.active_slabs
     12643 =C2=B1  0%     -56.1%       5545 =C2=B1  2%  slabinfo.kmalloc-25=
6.num_objs
    394.75 =C2=B1  0%     -56.2%     172.75 =C2=B1  2%  slabinfo.kmalloc-25=
6.num_slabs
     25089 =C2=B1  5%     -68.9%       7797 =C2=B1  0%  slabinfo.kmalloc-32=
.active_objs
    197.50 =C2=B1  4%     -62.4%      74.25 =C2=B1  1%  slabinfo.kmalloc-32=
.active_slabs
     25367 =C2=B1  4%     -62.1%       9626 =C2=B1  1%  slabinfo.kmalloc-32=
.num_objs
    197.50 =C2=B1  4%     -62.4%      74.25 =C2=B1  1%  slabinfo.kmalloc-32=
.num_slabs
      1080 =C2=B1  1%     -61.5%     416.00 =C2=B1  0%  slabinfo.kmalloc-40=
96.active_objs
      1113 =C2=B1  1%     -56.6%     483.50 =C2=B1  0%  slabinfo.kmalloc-40=
96.num_objs
      6479 =C2=B1  4%     -61.9%       2469 =C2=B1  0%  slabinfo.kmalloc-51=
2.active_objs
    206.00 =C2=B1  4%     -57.3%      88.00 =C2=B1  0%  slabinfo.kmalloc-51=
2.active_slabs
      6621 =C2=B1  4%     -57.2%       2834 =C2=B1  0%  slabinfo.kmalloc-51=
2.num_objs
    206.00 =C2=B1  4%     -57.3%      88.00 =C2=B1  0%  slabinfo.kmalloc-51=
2.num_slabs
     54719 =C2=B1  2%     -51.5%      26525 =C2=B1  0%  slabinfo.kmalloc-64=
.active_objs
    861.50 =C2=B1  2%     -50.1%     430.00 =C2=B1  0%  slabinfo.kmalloc-64=
.active_slabs
     55167 =C2=B1  2%     -50.0%      27557 =C2=B1  0%  slabinfo.kmalloc-64=
.num_objs
    861.50 =C2=B1  2%     -50.1%     430.00 =C2=B1  0%  slabinfo.kmalloc-64=
.num_slabs
     37940 =C2=B1  1%     -86.7%       5040 =C2=B1  3%  slabinfo.kmalloc-8.=
active_objs
     39296 =C2=B1  1%     -84.7%       6015 =C2=B1  3%  slabinfo.kmalloc-8.=
num_objs
    489.00 =C2=B1  0%     -87.8%      59.50 =C2=B1  0%  slabinfo.kmalloc-81=
92.active_objs
    122.25 =C2=B1  0%     -87.7%      15.00 =C2=B1  0%  slabinfo.kmalloc-81=
92.active_slabs
    489.00 =C2=B1  0%     -87.7%      60.00 =C2=B1  0%  slabinfo.kmalloc-81=
92.num_objs
    122.25 =C2=B1  0%     -87.7%      15.00 =C2=B1  0%  slabinfo.kmalloc-81=
92.num_slabs
      4326 =C2=B1  1%     -65.1%       1510 =C2=B1  0%  slabinfo.kmalloc-96=
.active_objs
      4754 =C2=B1  2%     -64.7%       1679 =C2=B1  0%  slabinfo.kmalloc-96=
.num_objs
    547.00 =C2=B1 12%     -72.0%     153.00 =C2=B1  0%  slabinfo.kmem_cache=
.active_objs
    547.00 =C2=B1 12%     -72.0%     153.00 =C2=B1  0%  slabinfo.kmem_cache=
.num_objs
    961.00 =C2=B1  8%     -53.3%     449.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.active_objs
      1006 =C2=B1  8%     -49.1%     512.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.num_objs
      2199 =C2=B1  0%     -72.6%     602.50 =C2=B1  0%  slabinfo.mm_struct.=
active_objs
      2199 =C2=B1  0%     -71.5%     627.50 =C2=B1  0%  slabinfo.mm_struct.=
num_objs
      1250 =C2=B1  3%     -93.3%      84.00 =C2=B1  0%  slabinfo.mnt_cache.=
active_objs
      1250 =C2=B1  3%     -93.3%      84.00 =C2=B1  0%  slabinfo.mnt_cache.=
num_objs
    160.00 =C2=B1  0%     -80.0%      32.00 =C2=B1  0%  slabinfo.nfs_inode_=
cache.active_objs
    160.00 =C2=B1  0%     -80.0%      32.00 =C2=B1  0%  slabinfo.nfs_inode_=
cache.num_objs
     11179 =C2=B1  2%     -55.0%       5028 =C2=B1  0%  slabinfo.proc_inode=
_cache.active_objs
    215.50 =C2=B1  2%     -54.5%      98.00 =C2=B1  0%  slabinfo.proc_inode=
_cache.active_slabs
     11232 =C2=B1  2%     -54.2%       5146 =C2=B1  0%  slabinfo.proc_inode=
_cache.num_objs
    215.50 =C2=B1  2%     -54.5%      98.00 =C2=B1  0%  slabinfo.proc_inode=
_cache.num_slabs
     35555 =C2=B1  0%     -15.3%      30118 =C2=B1  0%  slabinfo.radix_tree=
_node.active_objs
    638.50 =C2=B1  0%     -15.7%     538.50 =C2=B1  0%  slabinfo.radix_tree=
_node.active_slabs
     35779 =C2=B1  0%     -15.6%      30182 =C2=B1  0%  slabinfo.radix_tree=
_node.num_objs
    638.50 =C2=B1  0%     -15.7%     538.50 =C2=B1  0%  slabinfo.radix_tree=
_node.num_slabs
      4685 =C2=B1  1%     -70.8%       1370 =C2=B1  0%  slabinfo.shmem_inod=
e_cache.active_objs
      4685 =C2=B1  1%     -70.8%       1370 =C2=B1  0%  slabinfo.shmem_inod=
e_cache.num_objs
      3003 =C2=B1  1%     -61.0%       1172 =C2=B1  0%  slabinfo.sighand_ca=
che.active_objs
    201.00 =C2=B1  1%     -60.3%      79.75 =C2=B1  0%  slabinfo.sighand_ca=
che.active_slabs
      3021 =C2=B1  1%     -60.2%       1203 =C2=B1  0%  slabinfo.sighand_ca=
che.num_objs
    201.00 =C2=B1  1%     -60.3%      79.75 =C2=B1  0%  slabinfo.sighand_ca=
che.num_slabs
      3402 =C2=B1  0%     -63.4%       1245 =C2=B1  0%  slabinfo.signal_cac=
he.active_objs
      3402 =C2=B1  0%     -62.2%       1284 =C2=B1  0%  slabinfo.signal_cac=
he.num_objs
      3301 =C2=B1  1%     -98.5%      51.00 =C2=B1  0%  slabinfo.sigqueue.a=
ctive_objs
      3301 =C2=B1  1%     -98.5%      51.00 =C2=B1  0%  slabinfo.sigqueue.n=
um_objs
      3402 =C2=B1  1%     -91.0%     306.00 =C2=B1  0%  slabinfo.sock_inode=
_cache.active_objs
      3402 =C2=B1  1%     -91.0%     306.00 =C2=B1  0%  slabinfo.sock_inode=
_cache.num_objs
      1293 =C2=B1  0%      -9.5%       1170 =C2=B1  0%  slabinfo.task_struc=
t.active_objs
      1338 =C2=B1  0%     -11.5%       1185 =C2=B1  0%  slabinfo.task_struc=
t.num_objs
      2329 =C2=B1  5%     -25.0%       1747 =C2=B1  0%  slabinfo.trace_even=
t_file.active_objs
      2329 =C2=B1  5%     -25.0%       1747 =C2=B1  0%  slabinfo.trace_even=
t_file.num_objs
     35881 =C2=B1  1%     -48.6%      18445 =C2=B1  0%  slabinfo.vm_area_st=
ruct.active_objs
    821.00 =C2=B1  1%     -46.9%     435.75 =C2=B1  0%  slabinfo.vm_area_st=
ruct.active_slabs
     36135 =C2=B1  1%     -46.9%      19188 =C2=B1  0%  slabinfo.vm_area_st=
ruct.num_objs
    821.00 =C2=B1  1%     -46.9%     435.75 =C2=B1  0%  slabinfo.vm_area_st=
ruct.num_slabs
      0.02 =C2=B1 57%   +4900.0%       1.12 =C2=B1 27%  perf-profile.cycles=
-pp.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.activate_t=
ask.ttwu_do_activate
      4.11 =C2=B1  2%    +163.5%      10.82 =C2=B1  3%  perf-profile.cycles=
-pp.__alloc_pages_nodemask.alloc_pages_vma.handle_mm_fault.__do_page_fault.=
do_page_fault
      0.78 =C2=B1 61%   +1929.0%      15.73 =C2=B1  2%  perf-profile.cycles=
-pp.__do_page_fault.do_page_fault.page_fault
      1.71 =C2=B1 41%     +53.6%       2.63 =C2=B1  3%  perf-profile.cycles=
-pp.__do_page_fault.do_page_fault.page_fault.memset
      0.20 =C2=B1  2%    +370.7%       0.96 =C2=B1  8%  perf-profile.cycles=
-pp.__do_softirq.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt
      1.47 =C2=B1  0%    +122.8%       3.27 =C2=B1  6%  perf-profile.cycles=
-pp.__hrtimer_run_queues.hrtimer_interrupt.local_apic_timer_interrupt.smp_a=
pic_timer_interrupt.apic_timer_interrupt
      0.19 =C2=B1  3%    +534.2%       1.21 =C2=B1  4%  perf-profile.cycles=
-pp.__libc_fork
      0.91 =C2=B1  4%    +114.2%       1.95 =C2=B1 10%  perf-profile.cycles=
-pp.__memcpy.mga_imageblit.bit_putcs.fbcon_putcs.fbcon_redraw
      0.01 =C2=B1100%  +66150.0%       3.31 =C2=B1 25%  perf-profile.cycles=
-pp.__memcpy.mga_imageblit.soft_cursor.bit_cursor.fb_flashcursor
      0.04 =C2=B1 10%   +3082.4%       1.35 =C2=B1 19%  perf-profile.cycles=
-pp.__schedule.schedule.exit_to_usermode_loop.prepare_exit_to_usermode.reti=
nt_user
      0.00 =C2=B1 -1%      +Inf%       1.26 =C2=B1  7%  perf-profile.cycles=
-pp.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      0.59 =C2=B1  9%     +80.5%       1.06 =C2=B1  5%  perf-profile.cycles=
-pp.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath.read
      0.00 =C2=B1 -1%      +Inf%       0.71 =C2=B1 48%  perf-profile.cycles=
-pp.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      1.49 =C2=B1  3%    +152.9%       3.77 =C2=B1  8%  perf-profile.cycles=
-pp.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath.write
      3.84 =C2=B1  1%     -56.4%       1.67 =C2=B1  5%  perf-profile.cycles=
-pp._cpp_lex_direct
      4.39 =C2=B1  1%    +164.5%      11.61 =C2=B1  2%  perf-profile.cycles=
-pp.alloc_pages_vma.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      0.28 =C2=B1  2%    +239.3%       0.95 =C2=B1 12%  perf-profile.cycles=
-pp.alloc_pages_vma.wp_page_copy.do_wp_page.handle_mm_fault.__do_page_fault
      1.90 =C2=B1  2%    +135.2%       4.46 =C2=B1  4%  perf-profile.cycles=
-pp.apic_timer_interrupt
      0.01 =C2=B1100%  +68400.0%       3.43 =C2=B1 24%  perf-profile.cycles=
-pp.bit_cursor.fb_flashcursor.process_one_work.worker_thread.kthread
      1.20 =C2=B1  3%    +112.1%       2.54 =C2=B1  8%  perf-profile.cycles=
-pp.bit_putcs.fbcon_putcs.fbcon_redraw.fbcon_scroll.scrup
      2.78 =C2=B1  1%     -45.1%       1.53 =C2=B1  9%  perf-profile.cycles=
-pp.bool)
      0.01 =C2=B1100%  +18400.0%       0.92 =C2=B1 18%  perf-profile.cycles=
-pp.call_timer_fn.run_timer_softirq.__do_softirq.irq_exit.smp_apic_timer_in=
terrupt
      2.89 =C2=B1  1%    +163.3%       7.60 =C2=B1  3%  perf-profile.cycles=
-pp.clear_page.__alloc_pages_nodemask.alloc_pages_vma.handle_mm_fault.__do_=
page_fault
      1.36 =C2=B1  3%    +157.6%       3.50 =C2=B1 10%  perf-profile.cycles=
-pp.con_write.do_output_char.n_tty_write.tty_write.redirected_tty_write
      5.49 =C2=B1  2%     -86.4%       0.74 =C2=B1 24%  perf-profile.cycles=
-pp.const*)
      0.42 =C2=B1  3%    +119.0%       0.92 =C2=B1 10%  perf-profile.cycles=
-pp.copy_page_to_iter.generic_file_read_iter.__vfs_read.vfs_read.sys_read
      1.34 =C2=B1  3%    +103.2%       2.72 =C2=B1  9%  perf-profile.cycles=
-pp.do_con_trol.do_con_write.con_write.do_output_char.n_tty_write
      1.34 =C2=B1  3%    +159.5%       3.49 =C2=B1 10%  perf-profile.cycles=
-pp.do_con_write.part.23.con_write.do_output_char.n_tty_write.tty_write
      0.39 =C2=B1  5%    +542.6%       2.49 =C2=B1  8%  perf-profile.cycles=
-pp.do_execveat_common.isra.33.sys_execve.return_from_execve.execve
      0.01 =C2=B1-10000%  +34525.0%       3.46 =C2=B1  9%  perf-profile.cyc=
les-pp.do_exit.do_group_exit.sys_exit_group.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%       1.83 =C2=B1 14%  perf-profile.cycles=
-pp.do_filp_open.do_sys_open.sys_open.entry_SYSCALL_64_fastpath
      0.95 =C2=B1 26%     +90.3%       1.81 =C2=B1  8%  perf-profile.cycles=
-pp.do_filp_open.do_sys_open.sys_open.entry_SYSCALL_64_fastpath.open64
      0.01 =C2=B1-10000%  +33600.0%       3.37 =C2=B1 11%  perf-profile.cyc=
les-pp.do_group_exit.sys_exit_group.entry_SYSCALL_64_fastpath
      0.52 =C2=B1  2%    +273.6%       1.94 =C2=B1  2%  perf-profile.cycles=
-pp.do_mmap.vm_mmap_pgoff.sys_mmap_pgoff.sys_mmap.entry_SYSCALL_64_fastpath
      1.36 =C2=B1  3%    +157.2%       3.50 =C2=B1  9%  perf-profile.cycles=
-pp.do_output_char.n_tty_write.tty_write.redirected_tty_write.__vfs_write
      0.79 =C2=B1 60%   +1940.8%      16.02 =C2=B1  2%  perf-profile.cycles=
-pp.do_page_fault.page_fault
      2.21 =C2=B1 18%     +23.4%       2.72 =C2=B1  5%  perf-profile.cycles=
-pp.do_page_fault.page_fault.memset
      0.01 =C2=B1-10000%  +20225.0%       2.03 =C2=B1 14%  perf-profile.cyc=
les-pp.do_sys_open.sys_open.entry_SYSCALL_64_fastpath
      0.62 =C2=B1  3%    +311.2%       2.56 =C2=B1  9%  perf-profile.cycles=
-pp.do_wp_page.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      0.01 =C2=B1 57%   +7133.3%       1.08 =C2=B1 26%  perf-profile.cycles=
-pp.dump_trace.save_stack_trace_tsk.__account_scheduler_latency.enqueue_ent=
ity.enqueue_task_fair
      0.03 =C2=B1 13%   +4100.0%       1.36 =C2=B1 21%  perf-profile.cycles=
-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_=
wake_up
      0.61 =C2=B1 21%   +1467.2%       9.56 =C2=B1 12%  perf-profile.cycles=
-pp.entry_SYSCALL_64_fastpath
      0.55 =C2=B1 52%    +254.3%       1.94 =C2=B1 12%  perf-profile.cycles=
-pp.entry_SYSCALL_64_fastpath.open64
      0.24 =C2=B1 56%    +293.8%       0.95 =C2=B1 10%  perf-profile.cycles=
-pp.entry_SYSCALL_64_fastpath.read
      1.47 =C2=B1  3%    +149.7%       3.66 =C2=B1  9%  perf-profile.cycles=
-pp.entry_SYSCALL_64_fastpath.write
      0.42 =C2=B1  1%    +496.5%       2.54 =C2=B1  8%  perf-profile.cycles=
-pp.execve
      1.07 =C2=B1  2%    +229.7%       3.53 =C2=B1  4%  perf-profile.cycles=
-pp.exit_mmap.mmput.do_exit.do_group_exit.sys_exit_group
      0.11 =C2=B1  4%    +741.3%       0.97 =C2=B1 12%  perf-profile.cycles=
-pp.exit_mmap.mmput.flush_old_exec.load_elf_binary.search_binary_handler
      0.06 =C2=B1  0%   +2233.3%       1.40 =C2=B1 23%  perf-profile.cycles=
-pp.exit_to_usermode_loop.prepare_exit_to_usermode.retint_user
      0.01 =C2=B1100%  +68500.0%       3.43 =C2=B1 24%  perf-profile.cycles=
-pp.fb_flashcursor.process_one_work.worker_thread.kthread.ret_from_fork
      1.20 =C2=B1  3%    +112.5%       2.54 =C2=B1  8%  perf-profile.cycles=
-pp.fbcon_putcs.fbcon_redraw.fbcon_scroll.scrup.lf
      1.22 =C2=B1  3%    +104.7%       2.49 =C2=B1  9%  perf-profile.cycles=
-pp.fbcon_redraw.isra.23.fbcon_scroll.scrup.lf.do_con_trol
      1.34 =C2=B1  3%    +103.2%       2.72 =C2=B1  9%  perf-profile.cycles=
-pp.fbcon_scroll.scrup.lf.do_con_trol.do_con_write
      0.45 =C2=B1  1%    +550.6%       2.93 =C2=B1  5%  perf-profile.cycles=
-pp.filemap_map_pages.handle_mm_fault.__do_page_fault.do_page_fault.page_fa=
ult
      0.12 =C2=B1  5%    +750.0%       1.02 =C2=B1 11%  perf-profile.cycles=
-pp.flush_old_exec.load_elf_binary.search_binary_handler.do_execveat_common=
.sys_execve
      0.36 =C2=B1  1%    +149.0%       0.89 =C2=B1 10%  perf-profile.cycles=
-pp.free_hot_cold_page.free_hot_cold_page_list.release_pages.free_pages_and=
_swap_cache.tlb_flush_mmu_free
      0.24 =C2=B1  3%    +272.2%       0.90 =C2=B1  7%  perf-profile.cycles=
-pp.free_hot_cold_page_list.release_pages.free_pages_and_swap_cache.tlb_flu=
sh_mmu_free.tlb_finish_mmu
      0.38 =C2=B1  3%    +353.6%       1.71 =C2=B1  3%  perf-profile.cycles=
-pp.free_pages_and_swap_cache.tlb_flush_mmu_free.tlb_finish_mmu.exit_mmap.m=
mput
      0.57 =C2=B1  1%    +138.3%       1.37 =C2=B1  9%  perf-profile.cycles=
-pp.generic_file_read_iter.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fa=
stpath
      0.88 =C2=B1  0%    +163.5%       2.31 =C2=B1  7%  perf-profile.cycles=
-pp.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_vma.handle_mm=
_fault.__do_page_fault
      0.69 =C2=B1 72%   +1864.3%      13.60 =C2=B1  2%  perf-profile.cycles=
-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      1.51 =C2=B1  1%     +97.7%       2.98 =C2=B1 10%  perf-profile.cycles=
-pp.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_timer_interrupt.a=
pic_timer_interrupt
      5.30 =C2=B1  2%     -49.4%       2.68 =C2=B1  1%  perf-profile.cycles=
-pp.ht_lookup_option)
     10.34 =C2=B1  0%     -67.4%       3.37 =C2=B1  8%  perf-profile.cycles=
-pp.int)
      0.33 =C2=B1  1%    +260.2%       1.20 =C2=B1  1%  perf-profile.cycles=
-pp.ira_init
      0.20 =C2=B1  3%    +310.0%       0.82 =C2=B1 18%  perf-profile.cycles=
-pp.ira_init_register_move_cost
      0.24 =C2=B1  2%    +333.3%       1.04 =C2=B1 10%  perf-profile.cycles=
-pp.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt
      0.12 =C2=B1 21%   +4718.0%       6.02 =C2=B1 12%  perf-profile.cycles=
-pp.kthread.ret_from_fork
      1.34 =C2=B1  3%    +103.2%       2.72 =C2=B1  9%  perf-profile.cycles=
-pp.lf.do_con_trol.do_con_write.con_write.do_output_char
      0.63 =C2=B1  3%    +111.2%       1.32 =C2=B1 11%  perf-profile.cycles=
-pp.link_path_walk.path_openat.do_filp_open.do_sys_open.sys_open
      0.36 =C2=B1  1%    +652.1%       2.75 =C2=B1  6%  perf-profile.cycles=
-pp.load_elf_binary.search_binary_handler.do_execveat_common.sys_execve.ret=
urn_from_execve
      1.53 =C2=B1  1%     +97.9%       3.03 =C2=B1 10%  perf-profile.cycles=
-pp.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interrupt
      4.79 =C2=B1  1%     -65.7%       1.64 =C2=B1  5%  perf-profile.cycles=
-pp.long)
      1.06 =C2=B1  5%     -41.8%       0.61 =C2=B1 19%  perf-profile.cycles=
-pp.machine_mode)
      6.65 =C2=B1  1%     -30.4%       4.63 =C2=B1  7%  perf-profile.cycles=
-pp.memset
      1.18 =C2=B1  3%    +112.3%       2.51 =C2=B1  8%  perf-profile.cycles=
-pp.mga_imageblit.bit_putcs.fbcon_putcs.fbcon_redraw.fbcon_scroll
      0.01 =C2=B1100%  +68400.0%       3.43 =C2=B1 24%  perf-profile.cycles=
-pp.mga_imageblit.soft_cursor.bit_cursor.fb_flashcursor.process_one_work
      0.43 =C2=B1  1%    +274.0%       1.62 =C2=B1  3%  perf-profile.cycles=
-pp.mmap_region.do_mmap.vm_mmap_pgoff.sys_mmap_pgoff.sys_mmap
      1.07 =C2=B1  3%    +230.3%       3.54 =C2=B1  4%  perf-profile.cycles=
-pp.mmput.do_exit.do_group_exit.sys_exit_group.entry_SYSCALL_64_fastpath
      0.12 =C2=B1  3%    +734.0%       0.98 =C2=B1 12%  perf-profile.cycles=
-pp.mmput.flush_old_exec.load_elf_binary.search_binary_handler.do_execveat_=
common
      1.40 =C2=B1  3%    +154.7%       3.57 =C2=B1 10%  perf-profile.cycles=
-pp.n_tty_write.tty_write.redirected_tty_write.__vfs_write.vfs_write
      2.29 =C2=B1140%    +681.4%      17.89 =C2=B1  2%  perf-profile.cycles=
-pp.page_fault
      0.81 =C2=B1  3%    +198.2%       2.42 =C2=B1  7%  perf-profile.cycles=
-pp.parse_dep_file
      1.37 =C2=B1  1%    +168.7%       3.69 =C2=B1  8%  perf-profile.cycles=
-pp.path_openat.do_filp_open.do_sys_open.sys_open.entry_SYSCALL_64_fastpath
      0.02 =C2=B1 19%   +3733.3%       0.86 =C2=B1 23%  perf-profile.cycles=
-pp.pick_next_task_fair.__schedule.schedule.exit_to_usermode_loop.prepare_e=
xit_to_usermode
      0.06 =C2=B1 13%   +1132.0%       0.77 =C2=B1 39%  perf-profile.cycles=
-pp.pipe_write.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      1.10 =C2=B1  4%     -88.6%       0.12 =C2=B1 35%  perf-profile.cycles=
-pp.pop_scope
      0.06 =C2=B1  0%   +2345.8%       1.47 =C2=B1 22%  perf-profile.cycles=
-pp.prepare_exit_to_usermode.retint_user
      0.01 =C2=B1173%  +18750.0%       0.94 =C2=B1 26%  perf-profile.cycles=
-pp.print_context_stack.dump_trace.save_stack_trace_tsk.__account_scheduler=
_latency.enqueue_entity
      0.01 =C2=B1100%  +70200.0%       3.52 =C2=B1 23%  perf-profile.cycles=
-pp.process_one_work.worker_thread.kthread.ret_from_fork
      0.00 =C2=B1 -1%      +Inf%       0.85 =C2=B1 18%  perf-profile.cycles=
-pp.process_timeout.call_timer_fn.run_timer_softirq.__do_softirq.irq_exit
      0.01 =C2=B1  0%  +10850.0%       1.09 =C2=B1 17%  perf-profile.cycles=
-pp.rcu_gp_kthread.kthread.ret_from_fork
      0.74 =C2=B1  2%     +58.2%       1.17 =C2=B1  6%  perf-profile.cycles=
-pp.read
      1.40 =C2=B1  3%    +154.7%       3.57 =C2=B1 10%  perf-profile.cycles=
-pp.redirected_tty_write.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_f=
astpath
      0.36 =C2=B1  3%    +326.1%       1.51 =C2=B1  3%  perf-profile.cycles=
-pp.release_pages.free_pages_and_swap_cache.tlb_flush_mmu_free.tlb_finish_m=
mu.exit_mmap
      0.12 =C2=B1 21%   +4734.0%       6.04 =C2=B1 11%  perf-profile.cycles=
-pp.ret_from_fork
      0.00 =C2=B1 -1%      +Inf%       1.55 =C2=B1 22%  perf-profile.cycles=
-pp.retint_user
      0.39 =C2=B1  7%    +540.6%       2.48 =C2=B1  8%  perf-profile.cycles=
-pp.return_from_execve.execve
      0.03 =C2=B1  0%   +3166.7%       0.98 =C2=B1 17%  perf-profile.cycles=
-pp.run_timer_softirq.__do_softirq.irq_exit.smp_apic_timer_interrupt.apic_t=
imer_interrupt
      0.01 =C2=B1 87%   +8580.0%       1.08 =C2=B1 26%  perf-profile.cycles=
-pp.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entity.enqueue=
_task_fair.activate_task
      0.04 =C2=B1  0%   +3325.0%       1.37 =C2=B1 23%  perf-profile.cycles=
-pp.schedule.exit_to_usermode_loop.prepare_exit_to_usermode.retint_user
      1.34 =C2=B1  3%    +103.2%       2.72 =C2=B1  9%  perf-profile.cycles=
-pp.scrup.lf.do_con_trol.do_con_write.con_write
      0.28 =C2=B1  5%    +558.6%       1.83 =C2=B1 13%  perf-profile.cycles=
-pp.search_binary_handler.do_execveat_common.sys_execve.return_from_execve.=
execve
      1.82 =C2=B1  1%    +130.4%       4.21 =C2=B1  4%  perf-profile.cycles=
-pp.smp_apic_timer_interrupt.apic_timer_interrupt
      0.01 =C2=B1100%  +68400.0%       3.43 =C2=B1 24%  perf-profile.cycles=
-pp.soft_cursor.bit_cursor.fb_flashcursor.process_one_work.worker_thread
      0.39 =C2=B1  6%    +539.1%       2.49 =C2=B1  8%  perf-profile.cycles=
-pp.sys_execve.return_from_execve.execve
      0.01 =C2=B1-10000%  +33600.0%       3.37 =C2=B1 11%  perf-profile.cyc=
les-pp.sys_exit_group.entry_SYSCALL_64_fastpath
      0.06 =C2=B1  6%   +1472.0%       0.98 =C2=B1  3%  perf-profile.cycles=
-pp.sys_mmap.entry_SYSCALL_64_fastpath
      0.06 =C2=B1  6%   +1464.0%       0.98 =C2=B1  3%  perf-profile.cycles=
-pp.sys_mmap_pgoff.sys_mmap.entry_SYSCALL_64_fastpath
      0.00 =C2=B1173%  +83200.0%       2.08 =C2=B1 14%  perf-profile.cycles=
-pp.sys_open.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%       1.39 =C2=B1 10%  perf-profile.cycles=
-pp.sys_read.entry_SYSCALL_64_fastpath
      0.67 =C2=B1  6%     +67.8%       1.12 =C2=B1  4%  perf-profile.cycles=
-pp.sys_read.entry_SYSCALL_64_fastpath.read
      0.01 =C2=B1 57%  +11500.0%       0.87 =C2=B1 42%  perf-profile.cycles=
-pp.sys_write.entry_SYSCALL_64_fastpath
      1.52 =C2=B1  3%    +149.8%       3.79 =C2=B1  8%  perf-profile.cycles=
-pp.sys_write.entry_SYSCALL_64_fastpath.write
      1.33 =C2=B1  1%     +65.7%       2.20 =C2=B1  8%  perf-profile.cycles=
-pp.tick_sched_handle.isra.17.tick_sched_timer.__hrtimer_run_queues.hrtimer=
_interrupt.local_apic_timer_interrupt
      1.36 =C2=B1  1%    +109.2%       2.84 =C2=B1  7%  perf-profile.cycles=
-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.local_apic_time=
r_interrupt.smp_apic_timer_interrupt
      0.36 =C2=B1  4%    +343.4%       1.58 =C2=B1  3%  perf-profile.cycles=
-pp.tlb_finish_mmu.exit_mmap.mmput.do_exit.do_group_exit
      0.35 =C2=B1  3%    +345.1%       1.58 =C2=B1  3%  perf-profile.cycles=
-pp.tlb_flush_mmu_free.tlb_finish_mmu.exit_mmap.mmput.do_exit
      7.40 =C2=B1  1%     -72.7%       2.02 =C2=B1 11%  perf-profile.cycles=
-pp.tree_node*)
      0.00 =C2=B1 -1%      +Inf%       0.82 =C2=B1 18%  perf-profile.cycles=
-pp.try_to_wake_up.wake_up_process.process_timeout.call_timer_fn.run_timer_=
softirq
      1.40 =C2=B1  3%    +154.7%       3.57 =C2=B1 10%  perf-profile.cycles=
-pp.tty_write.redirected_tty_write.__vfs_write.vfs_write.sys_write
      0.15 =C2=B1  3%    +631.0%       1.06 =C2=B1  5%  perf-profile.cycles=
-pp.unlock_page.filemap_map_pages.handle_mm_fault.__do_page_fault.do_page_f=
ault
      0.67 =C2=B1  2%    +142.9%       1.63 =C2=B1  9%  perf-profile.cycles=
-pp.unmap_page_range.unmap_single_vma.unmap_vmas.exit_mmap.mmput
      0.66 =C2=B1  3%    +119.8%       1.45 =C2=B1  5%  perf-profile.cycles=
-pp.unmap_single_vma.unmap_vmas.exit_mmap.mmput.do_exit
      0.66 =C2=B1  3%    +121.3%       1.46 =C2=B1  4%  perf-profile.cycles=
-pp.unmap_vmas.exit_mmap.mmput.do_exit.do_group_exit
      1.30 =C2=B1  0%     +61.8%       2.11 =C2=B1  7%  perf-profile.cycles=
-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_q=
ueues.hrtimer_interrupt
      0.00 =C2=B1 -1%      +Inf%       1.35 =C2=B1  9%  perf-profile.cycles=
-pp.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      0.64 =C2=B1 14%     +73.2%       1.10 =C2=B1  4%  perf-profile.cycles=
-pp.vfs_read.sys_read.entry_SYSCALL_64_fastpath.read
      0.01 =C2=B1  0%   +8200.0%       0.83 =C2=B1 43%  perf-profile.cycles=
-pp.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      1.50 =C2=B1  3%    +151.7%       3.79 =C2=B1  8%  perf-profile.cycles=
-pp.vfs_write.sys_write.entry_SYSCALL_64_fastpath.write
      0.07 =C2=B1 10%   +1289.3%       0.97 =C2=B1  2%  perf-profile.cycles=
-pp.vm_mmap_pgoff.sys_mmap_pgoff.sys_mmap.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%       0.85 =C2=B1 18%  perf-profile.cycles=
-pp.wake_up_process.process_timeout.call_timer_fn.run_timer_softirq.__do_so=
ftirq
      0.01 =C2=B1100%  +70300.0%       3.52 =C2=B1 23%  perf-profile.cycles=
-pp.worker_thread.kthread.ret_from_fork
      0.44 =C2=B1  1%    +266.3%       1.60 =C2=B1 15%  perf-profile.cycles=
-pp.wp_page_copy.isra.58.do_wp_page.handle_mm_fault.__do_page_fault.do_page=
_fault
      1.53 =C2=B1  3%    +150.1%       3.83 =C2=B1  8%  perf-profile.cycles=
-pp.write

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/filesize/fs/iterations/kconfig/nr_directorie=
s/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_size=
/testcase:
  gcc-4.9/performance/1HDD/16MB/f2fs/1x/x86_64-rhel/16d/256fpd/32t/debian-x=
86_64-2015-02-07.cgz/fsyncBeforeClose/nhm4/60G/fsmark

commit: =

  8025943c32f5de29b3fd548e917e24424297ca73
  0aefb957de5f2a1d9467126114146b6c793cf180

8025943c32f5de29 0aefb957de5f2a1d9467126114 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    791288 =C2=B1  2%   +1263.4%   10788460 =C2=B1  5%  fsmark.app_overhead
    494.86 =C2=B1  0%      +2.3%     506.45 =C2=B1  0%  fsmark.time.elapsed=
_time
    494.86 =C2=B1  0%      +2.3%     506.45 =C2=B1  0%  fsmark.time.elapsed=
_time.max
     29598 =C2=B1  2%     +33.6%      39544 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
     19.50 =C2=B1  2%     -59.0%       8.00 =C2=B1  0%  fsmark.time.percent=
_of_cpu_this_job_got
     98.06 =C2=B1  1%     -55.9%      43.25 =C2=B1  0%  fsmark.time.system_=
time
    882595 =C2=B1  0%     -92.5%      65869 =C2=B1  1%  fsmark.time.volunta=
ry_context_switches
     45988 =C2=B1  6%     -22.3%      35748 =C2=B1  4%  meminfo.DirectMap4k
      1983 =C2=B1  0%     -99.0%      20.25 =C2=B1  2%  uptime.idle
     35575 =C2=B1  1%     -87.7%       4386 =C2=B1  1%  softirqs.RCU
     42625 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  softirqs.SCHED
     75521 =C2=B1  0%     -45.9%      40839 =C2=B1  0%  softirqs.TIMER
      3.14 =C2=B1  0%    +271.5%      11.64 =C2=B1  0%  turbostat.%Busy
    100.50 =C2=B1  0%    +286.1%     388.00 =C2=B1  0%  turbostat.Avg_MHz
     14.76 =C2=B1  1%    +498.6%      88.36 =C2=B1  0%  turbostat.CPU%c1
     21.60 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  turbostat.CPU%c3
     60.51 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  turbostat.CPU%c6
      1252 =C2=B1  0%     -12.6%       1094 =C2=B1  1%  time.file_system_in=
puts
     29598 =C2=B1  2%     +33.6%      39544 =C2=B1  0%  time.involuntary_co=
ntext_switches
     19.50 =C2=B1  2%     -59.0%       8.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
     98.06 =C2=B1  1%     -55.9%      43.25 =C2=B1  0%  time.system_time
      0.69 =C2=B1  4%     -47.4%       0.36 =C2=B1  2%  time.user_time
    882595 =C2=B1  0%     -92.5%      65869 =C2=B1  1%  time.voluntary_cont=
ext_switches
    126962 =C2=B1  0%      -2.3%     124044 =C2=B1  0%  vmstat.io.bo
    256.25 =C2=B1  3%     -13.0%     223.00 =C2=B1  5%  vmstat.memory.buff
     17.75 =C2=B1  2%      -8.5%      16.25 =C2=B1  2%  vmstat.procs.b
      0.00 =C2=B1  0%      +Inf%       2.00 =C2=B1  0%  vmstat.procs.r
      4414 =C2=B1  1%     -50.3%       2192 =C2=B1  0%  vmstat.system.cs
    630.50 =C2=B1  0%     -36.8%     398.75 =C2=B1  0%  vmstat.system.in
 1.457e+08 =C2=B1  5%     -55.0%   65592950 =C2=B1  2%  cpuidle.C1-NHM.time
    420131 =C2=B1  2%     -94.0%      25205 =C2=B1  1%  cpuidle.C1-NHM.usage
    157273 =C2=B1  2%     -75.3%      38902 =C2=B1  1%  cpuidle.C1E-NHM.usa=
ge
  5.06e+08 =C2=B1  1%     -57.8%  2.135e+08 =C2=B1  0%  cpuidle.C3-NHM.time
    161592 =C2=B1  1%     -62.4%      60815 =C2=B1  0%  cpuidle.C3-NHM.usage
 3.047e+09 =C2=B1  0%     -98.9%   32859965 =C2=B1  5%  cpuidle.C6-NHM.time
    130268 =C2=B1  0%     -94.4%       7285 =C2=B1  6%  cpuidle.C6-NHM.usage
    910716 =C2=B1 59%     -93.5%      59009 =C2=B1139%  cpuidle.POLL.time
    173.25 =C2=B1  6%     -87.2%      22.25 =C2=B1 16%  cpuidle.POLL.usage
      2785 =C2=B1  7%     -91.7%     231.00 =C2=B1  4%  proc-vmstat.allocst=
all
     41004 =C2=B1 50%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.compact=
_free_scanned
    928.75 =C2=B1 23%     -98.6%      13.00 =C2=B1 24%  proc-vmstat.kswapd_=
high_wmark_hit_quickly
     11778 =C2=B1  2%     +40.4%      16541 =C2=B1  0%  proc-vmstat.kswapd_=
low_wmark_hit_quickly
    188.75 =C2=B1 28%     -89.1%      20.50 =C2=B1 73%  proc-vmstat.nr_page=
s_scanned
      8109 =C2=B1 15%     -97.9%     168.25 =C2=B1 36%  proc-vmstat.nr_vmsc=
an_immediate_reclaim
     13663 =C2=B1  3%     +22.1%      16679 =C2=B1  0%  proc-vmstat.pageout=
run
     21477 =C2=B1  0%     -88.3%       2523 =C2=B1  2%  proc-vmstat.pgactiv=
ate
      1398 =C2=B1 12%     -84.6%     214.75 =C2=B1 23%  proc-vmstat.pgalloc=
_dma
      1464 =C2=B1 75%     -90.7%     135.75 =C2=B1 31%  proc-vmstat.pgrotat=
ed
    463204 =C2=B1  5%     -82.4%      81721 =C2=B1  1%  proc-vmstat.pgscan_=
direct_dma32
     17825 =C2=B1 28%     -99.7%      54.25 =C2=B1  7%  proc-vmstat.pgscan_=
kswapd_dma
    382311 =C2=B1  7%     -92.0%      30436 =C2=B1  3%  proc-vmstat.pgsteal=
_direct_dma32
    376514 =C2=B1  3%     -37.6%     235044 =C2=B1  0%  proc-vmstat.slabs_s=
canned
     31030 =C2=B1 54%    +532.0%     196129 =C2=B1 37%  latency_stats.avg.a=
lloc_nid.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_get=
_block.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_file_=
write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs].__vfs_write.=
vfs_write.SyS_write
     97723 =C2=B1 60%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.c=
all_rwsem_down_read_failed.f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2=
fs].f2fs_write_cache_pages.[f2fs].f2fs_write_data_pages.[f2fs].do_writepage=
s.__filemap_fdatawrite_range.filemap_write_and_wait_range.f2fs_sync_file.[f=
2fs].vfs_fsync_range.do_fsync.SyS_fsync
     55449 =C2=B1 23%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.c=
all_rwsem_down_write_failed.f2fs_submit_merged_bio.[f2fs].sync_node_pages.[=
f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCAL=
L_64_fastpath
    166272 =C2=B1 82%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.__submit_merged_bi=
o.[f2fs].f2fs_submit_merged_bio.[f2fs].ra_meta_pages.[f2fs].build_free_nids=
.[f2fs].alloc_nid.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs]=
.f2fs_get_block.[f2fs]
     77955 =C2=B1101%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.submit_bio_wait.f2=
fs_issue_flush.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fs=
ync.entry_SYSCALL_64_fastpath
    461592 =C2=B1 64%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].set_data_blkaddr.[f2fs].do_write_data_page.[f2fs].f2fs_write_dat=
a_page.[f2fs].__f2fs_writepage.[f2fs].f2fs_write_cache_pages.[f2fs].f2fs_wr=
ite_data_pages.[f2fs].do_writepages.__filemap_fdatawrite_range.filemap_writ=
e_and_wait_range
      0.00 =C2=B1 -1%      +Inf%      13758 =C2=B1 10%  latency_stats.avg.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].update_inode.[f2fs].update_inode_page.[f2fs].f2fs_write_end.[f2f=
s].generic_perform_write.__generic_file_write_iter.generic_file_write_iter.=
f2fs_file_write_iter.[f2fs].__vfs_write.vfs_write
     10810 =C2=B1  0%     -99.8%      17.25 =C2=B1173%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].new_node_page.[f2fs].get_d=
node_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_get_block.[f2fs].f2fs_wr=
ite_begin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_fi=
le_write_iter.f2fs_file_write_iter.[f2fs].__vfs_write
    174329 =C2=B1  0%     -99.9%     149.50 =C2=B1173%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].f2fs_convert_inline_inode.[f2fs].f2fs_write_begin.[f2fs].g=
eneric_perform_write.__generic_file_write_iter.generic_file_write_iter.f2fs=
_file_write_iter.[f2fs].__vfs_write.vfs_write
    181340 =C2=B1  0%     -99.9%     159.00 =C2=B1173%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_fi=
le_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs].__vfs_wri=
te.vfs_write.SyS_write
    149512 =C2=B1  0%     -99.9%     207.50 =C2=B1173%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_ge=
t_block.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_file=
_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs]
    194491 =C2=B1  0%     -99.9%     157.50 =C2=B1173%  latency_stats.hits.=
call_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].update_inode_page.[f2fs].f2fs_write_end.[f2fs].generic_per=
form_write.__generic_file_write_iter.generic_file_write_iter.f2fs_file_writ=
e_iter.[f2fs].__vfs_write.vfs_write
     16907 =C2=B1  0%     -99.9%      25.25 =C2=B1173%  latency_stats.hits.=
call_rwsem_down_write_failed.get_node_info.[f2fs].alloc_nid.[f2fs].get_dnod=
e_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_get_block.[f2fs].f2fs_write=
_begin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_file_=
write_iter.f2fs_file_write_iter.[f2fs].__vfs_write
     16263 =C2=B1  0%     -99.8%      25.00 =C2=B1173%  latency_stats.hits.=
call_rwsem_down_write_failed.set_node_addr.[f2fs].new_node_page.[f2fs].get_=
dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_get_block.[f2fs].f2fs_w=
rite_begin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_f=
ile_write_iter.f2fs_file_write_iter.[f2fs].__vfs_write
     47934 =C2=B1  0%    +786.0%     424715 =C2=B1  1%  latency_stats.hits.=
pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     11445 =C2=B1 56%    +214.8%      36035 =C2=B1 92%  latency_stats.max.a=
lloc_nid.[f2fs].f2fs_new_inode.[f2fs].f2fs_create.[f2fs].vfs_create.path_op=
enat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
    146916 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.c=
all_rwsem_down_read_failed.f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2=
fs].f2fs_write_cache_pages.[f2fs].f2fs_write_data_pages.[f2fs].do_writepage=
s.__filemap_fdatawrite_range.filemap_write_and_wait_range.f2fs_sync_file.[f=
2fs].vfs_fsync_range.do_fsync.SyS_fsync
      8154 =C2=B1 64%     -90.1%     807.75 =C2=B1173%  latency_stats.max.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_get=
_block.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_file_=
write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs]
    215029 =C2=B1 24%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.c=
all_rwsem_down_write_failed.f2fs_submit_merged_bio.[f2fs].sync_node_pages.[=
f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCAL=
L_64_fastpath
      6281 =C2=B1 73%     -98.6%      87.25 =C2=B1173%  latency_stats.max.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].alloc_nid.[f2fs].get_dnode=
_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_get_block.[f2fs].f2fs_write_=
begin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_file_w=
rite_iter.f2fs_file_write_iter.[f2fs].__vfs_write
      6922 =C2=B1 89%     -98.8%      81.75 =C2=B1173%  latency_stats.max.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].new_node_page.[f2fs].get_d=
node_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_get_block.[f2fs].f2fs_wr=
ite_begin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_fi=
le_write_iter.f2fs_file_write_iter.[f2fs].__vfs_write
    211936 =C2=B1 76%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.__submit_merged_bi=
o.[f2fs].f2fs_submit_merged_bio.[f2fs].ra_meta_pages.[f2fs].build_free_nids=
.[f2fs].alloc_nid.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs]=
.f2fs_get_block.[f2fs]
     88752 =C2=B1104%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.submit_bio_wait.f2=
fs_issue_flush.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fs=
ync.entry_SYSCALL_64_fastpath
  17473022 =C2=B1 34%    +100.2%   34977406 =C2=B1 88%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
    461592 =C2=B1 64%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].set_data_blkaddr.[f2fs].do_write_data_page.[f2fs].f2fs_write_dat=
a_page.[f2fs].__f2fs_writepage.[f2fs].f2fs_write_cache_pages.[f2fs].f2fs_wr=
ite_data_pages.[f2fs].do_writepages.__filemap_fdatawrite_range.filemap_writ=
e_and_wait_range
      0.00 =C2=B1 -1%      +Inf%      19842 =C2=B1  0%  latency_stats.max.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].update_inode.[f2fs].update_inode_page.[f2fs].f2fs_write_end.[f2f=
s].generic_perform_write.__generic_file_write_iter.generic_file_write_iter.=
f2fs_file_write_iter.[f2fs].__vfs_write.vfs_write
   2798443 =C2=B1 56%   +1633.2%   48502387 =C2=B1 33%  latency_stats.sum.a=
lloc_nid.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_get=
_block.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_file_=
write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs].__vfs_write.=
vfs_write.SyS_write
  41166275 =C2=B1  3%     -99.5%     190477 =C2=B1 34%  latency_stats.sum.b=
alance_dirty_pages.balance_dirty_pages_ratelimited.generic_perform_write.__=
generic_file_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs]=
.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
    147025 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2=
fs].f2fs_write_cache_pages.[f2fs].f2fs_write_data_pages.[f2fs].do_writepage=
s.__filemap_fdatawrite_range.filemap_write_and_wait_range.f2fs_sync_file.[f=
2fs].vfs_fsync_range.do_fsync.SyS_fsync
    685660 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].alloc_nid.[f2fs].f2fs_new_i=
node.[f2fs].f2fs_create.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_o=
pen.SyS_open.entry_SYSCALL_64_fastpath
    360591 =C2=B1  0%     -99.7%       1233 =C2=B1173%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].alloc_nid.[f2fs].get_dnode_=
of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_get_block.[f2fs].f2fs_write_b=
egin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_file_wr=
ite_iter.f2fs_file_write_iter.[f2fs].__vfs_write
   1694024 =C2=B1  1%     -99.9%       1934 =C2=B1173%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].new_node_page.[f2fs].get_dn=
ode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_get_block.[f2fs].f2fs_wri=
te_begin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_fil=
e_write_iter.f2fs_file_write_iter.[f2fs].__vfs_write
   1039930 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].new_node_page.[f2fs].new_in=
ode_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_crea=
te.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
  25396916 =C2=B1  1%     -99.9%      12834 =C2=B1173%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].f2fs_convert_inline_inode.[f2fs].f2fs_write_begin.[f2fs].ge=
neric_perform_write.__generic_file_write_iter.generic_file_write_iter.f2fs_=
file_write_iter.[f2fs].__vfs_write.vfs_write
  26847777 =C2=B1  1%     -99.9%      18782 =C2=B1173%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_fil=
e_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs].__vfs_writ=
e.vfs_write.SyS_write
    388761 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].do_write_data_page.[f2fs].f2fs_wri=
te_data_page.[f2fs].__f2fs_writepage.[f2fs].f2fs_write_cache_pages.[f2fs].f=
2fs_write_data_pages.[f2fs].do_writepages.__filemap_fdatawrite_range
  21200825 =C2=B1  1%     -99.9%      17555 =C2=B1173%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_get=
_block.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_file_=
write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs]
   1646843 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].get_new_=
data_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_create.[f2fs].vfs_create.path_=
openat.do_filp_open
    320326 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].get_dnode_of_data.[f2fs].get_read_data_page.[f2fs].find_dat=
a_page.[f2fs].f2fs_find_entry.[f2fs].f2fs_lookup.[f2fs].lookup_real.path_op=
enat.do_filp_open
     27653 =C2=B1 17%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].update_inode_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_create=
.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
  27613150 =C2=B1  1%     -99.9%      16296 =C2=B1173%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_n=
ode_page.[f2fs].update_inode_page.[f2fs].f2fs_write_end.[f2fs].generic_perf=
orm_write.__generic_file_write_iter.generic_file_write_iter.f2fs_file_write=
_iter.[f2fs].__vfs_write.vfs_write
    170377 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].write_data_page.[f2fs].do_w=
rite_data_page.[f2fs].f2fs_write_data_page.[f2fs].__f2fs_writepage.[f2fs].f=
2fs_write_cache_pages.[f2fs].f2fs_write_data_pages.[f2fs].do_writepages.__f=
ilemap_fdatawrite_range.filemap_write_and_wait_range.f2fs_sync_file.[f2fs]
      4452 =C2=B1101%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_write_failed.f2fs_init_extent_tree.[f2fs].f2fs_new_inode.[f2=
fs].f2fs_create.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_=
open.entry_SYSCALL_64_fastpath
    899019 =C2=B1 40%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_write_failed.f2fs_submit_merged_bio.[f2fs].sync_node_pages.[=
f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCAL=
L_64_fastpath
    893402 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].alloc_nid.[f2fs].f2fs_new_=
inode.[f2fs].f2fs_create.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_=
open.SyS_open.entry_SYSCALL_64_fastpath
   1358444 =C2=B1  1%     -99.9%       1789 =C2=B1173%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].alloc_nid.[f2fs].get_dnode=
_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_get_block.[f2fs].f2fs_write_=
begin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_file_w=
rite_iter.f2fs_file_write_iter.[f2fs].__vfs_write
      9697 =C2=B1 61%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].get_new=
_data_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_create.[f2fs].vfs_create.path=
_openat.do_filp_open
     19206 =C2=B1 55%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].read_node_page.[f2fs].get_=
node_page.[f2fs].get_dnode_of_data.[f2fs].get_read_data_page.[f2fs].find_da=
ta_page.[f2fs].f2fs_find_entry.[f2fs].f2fs_lookup.[f2fs].lookup_real.path_o=
penat.do_filp_open
   1493713 =C2=B1  1%     -99.9%       2025 =C2=B1173%  latency_stats.sum.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].new_node_page.[f2fs].get_d=
node_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_get_block.[f2fs].f2fs_wr=
ite_begin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_fi=
le_write_iter.f2fs_file_write_iter.[f2fs].__vfs_write
    935312 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_cre=
ate.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
    332545 =C2=B1 82%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.__submit_merged_bi=
o.[f2fs].f2fs_submit_merged_bio.[f2fs].ra_meta_pages.[f2fs].build_free_nids=
.[f2fs].alloc_nid.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs]=
.f2fs_get_block.[f2fs]
   3296371 =C2=B1 13%     -88.0%     396462 =C2=B1 17%  latency_stats.sum.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.__submit_merged_bi=
o.[f2fs].f2fs_submit_page_mbio.[f2fs].do_write_page.[f2fs].write_node_page.=
[f2fs].f2fs_write_node_page.[f2fs].sync_node_pages.[f2fs].f2fs_sync_file.[f=
2fs].vfs_fsync_range
   1066734 =C2=B1158%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.submit_bio_wait.f2=
fs_issue_flush.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fs=
ync.entry_SYSCALL_64_fastpath
    461592 =C2=B1 64%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].set_data_blkaddr.[f2fs].do_write_data_page.[f2fs].f2fs_write_dat=
a_page.[f2fs].__f2fs_writepage.[f2fs].f2fs_write_cache_pages.[f2fs].f2fs_wr=
ite_data_pages.[f2fs].do_writepages.__filemap_fdatawrite_range.filemap_writ=
e_and_wait_range
      0.00 =C2=B1 -1%      +Inf%     389579 =C2=B1 22%  latency_stats.sum.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].update_inode.[f2fs].update_inode_page.[f2fs].f2fs_write_end.[f2f=
s].generic_perform_write.__generic_file_write_iter.generic_file_write_iter.=
f2fs_file_write_iter.[f2fs].__vfs_write.vfs_write
     42496 =C2=B1 33%     -76.3%      10051 =C2=B1 62%  latency_stats.sum.w=
ait_on_page_bit.find_data_page.[f2fs].f2fs_find_entry.[f2fs].f2fs_lookup.[f=
2fs].lookup_real.path_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCAL=
L_64_fastpath
      6594 =C2=B1  2%     -22.7%       5096 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.active_objs
      6594 =C2=B1  2%     -22.7%       5096 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.num_objs
    331.00 =C2=B1  5%     -76.4%      78.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.active_objs
    331.00 =C2=B1  5%     -76.4%      78.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.num_objs
    360.00 =C2=B1  0%     -50.0%     180.00 =C2=B1  0%  slabinfo.RAW.active=
_objs
    360.00 =C2=B1  0%     -50.0%     180.00 =C2=B1  0%  slabinfo.RAW.num_ob=
js
    178.50 =C2=B1 15%     -81.0%      34.00 =C2=B1  0%  slabinfo.UDP.active=
_objs
    178.50 =C2=B1 15%     -81.0%      34.00 =C2=B1  0%  slabinfo.UDP.num_ob=
js
      2577 =C2=B1  5%     -54.5%       1172 =C2=B1  0%  slabinfo.anon_vma.a=
ctive_objs
      2577 =C2=B1  5%     -54.5%       1172 =C2=B1  0%  slabinfo.anon_vma.n=
um_objs
    456.25 =C2=B1  6%     -84.0%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.active_objs
    456.25 =C2=B1  6%     -84.0%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.num_objs
    185.25 =C2=B1 17%     -78.9%      39.00 =C2=B1  0%  slabinfo.bdev_cache=
.active_objs
    185.25 =C2=B1 17%     -78.9%      39.00 =C2=B1  0%  slabinfo.bdev_cache=
.num_objs
    716.25 =C2=B1  0%     -51.7%     346.00 =C2=B1  0%  slabinfo.blkdev_req=
uests.active_objs
    767.00 =C2=B1  0%     -54.9%     346.00 =C2=B1  0%  slabinfo.blkdev_req=
uests.num_objs
    769.75 =C2=B1  1%     -86.7%     102.00 =C2=B1  0%  slabinfo.ext4_exten=
t_status.active_objs
    769.75 =C2=B1  1%     -86.7%     102.00 =C2=B1  0%  slabinfo.ext4_exten=
t_status.num_objs
      2140 =C2=B1  1%     -18.8%       1738 =C2=B1  0%  slabinfo.f2fs_exten=
t_tree.active_objs
      2140 =C2=B1  1%     -18.8%       1738 =C2=B1  0%  slabinfo.f2fs_exten=
t_tree.num_objs
      1841 =C2=B1  2%     -11.2%       1634 =C2=B1  0%  slabinfo.f2fs_inode=
_cache.active_objs
      1865 =C2=B1  2%     -11.5%       1650 =C2=B1  0%  slabinfo.f2fs_inode=
_cache.num_objs
    263.25 =C2=B1 12%     -85.2%      39.00 =C2=B1  0%  slabinfo.file_lock_=
cache.active_objs
    263.25 =C2=B1 12%     -85.2%      39.00 =C2=B1  0%  slabinfo.file_lock_=
cache.num_objs
    388.75 =C2=B1  5%     -64.8%     137.00 =C2=B1  0%  slabinfo.files_cach=
e.active_objs
    388.75 =C2=B1  5%     -64.8%     137.00 =C2=B1  0%  slabinfo.files_cach=
e.num_objs
     12292 =C2=B1 11%     -84.8%       1870 =C2=B1  0%  slabinfo.free_nid.a=
ctive_objs
     12339 =C2=B1 11%     -84.8%       1870 =C2=B1  0%  slabinfo.free_nid.n=
um_objs
    495.00 =C2=B1  3%     -24.2%     375.00 =C2=B1  0%  slabinfo.idr_layer_=
cache.active_objs
    495.00 =C2=B1  3%     -24.2%     375.00 =C2=B1  0%  slabinfo.idr_layer_=
cache.num_objs
      7265 =C2=B1  3%     -60.1%       2897 =C2=B1  0%  slabinfo.jbd2_revok=
e_record_s.active_objs
      7271 =C2=B1  3%     -60.2%       2897 =C2=B1  0%  slabinfo.jbd2_revok=
e_record_s.num_objs
    963.00 =C2=B1  3%     -34.1%     634.25 =C2=B1  1%  slabinfo.kmalloc-10=
24.active_objs
    963.00 =C2=B1  3%     -33.6%     639.25 =C2=B1  0%  slabinfo.kmalloc-10=
24.num_objs
      2087 =C2=B1  1%     -44.9%       1151 =C2=B1  0%  slabinfo.kmalloc-12=
8.active_objs
      2087 =C2=B1  1%     -44.9%       1151 =C2=B1  0%  slabinfo.kmalloc-12=
8.num_objs
      4979 =C2=B1  2%     -20.6%       3954 =C2=B1  2%  slabinfo.kmalloc-16=
.active_objs
      4979 =C2=B1  2%     -20.6%       3954 =C2=B1  2%  slabinfo.kmalloc-16=
.num_objs
      3810 =C2=B1  1%     -39.4%       2310 =C2=B1  0%  slabinfo.kmalloc-19=
2.active_objs
      3810 =C2=B1  1%     -39.4%       2310 =C2=B1  0%  slabinfo.kmalloc-19=
2.num_objs
    835.75 =C2=B1  2%     -16.4%     699.00 =C2=B1  0%  slabinfo.kmalloc-20=
48.num_objs
      1762 =C2=B1  0%     -17.5%       1454 =C2=B1  0%  slabinfo.kmalloc-25=
6.active_objs
      2586 =C2=B1  5%     -32.3%       1752 =C2=B1  6%  slabinfo.kmalloc-25=
6.num_objs
      6879 =C2=B1  3%     -40.5%       4096 =C2=B1  0%  slabinfo.kmalloc-32=
.active_objs
      6879 =C2=B1  3%     -40.5%       4096 =C2=B1  0%  slabinfo.kmalloc-32=
.num_objs
      1719 =C2=B1  9%     -48.1%     892.25 =C2=B1  1%  slabinfo.kmalloc-51=
2.active_objs
      1769 =C2=B1  7%     -34.4%       1160 =C2=B1  3%  slabinfo.kmalloc-51=
2.num_objs
      6656 =C2=B1  5%     -38.5%       4096 =C2=B1  0%  slabinfo.kmalloc-8.=
active_objs
      6656 =C2=B1  5%     -38.5%       4096 =C2=B1  0%  slabinfo.kmalloc-8.=
num_objs
      1438 =C2=B1  4%     -29.9%       1008 =C2=B1  0%  slabinfo.kmalloc-96=
.active_objs
      1438 =C2=B1  4%     -29.9%       1008 =C2=B1  0%  slabinfo.kmalloc-96=
.num_objs
    240.00 =C2=B1  6%     -46.7%     128.00 =C2=B1  0%  slabinfo.kmem_cache=
.active_objs
    240.00 =C2=B1  6%     -46.7%     128.00 =C2=B1  0%  slabinfo.kmem_cache=
.num_objs
    352.00 =C2=B1  9%     -63.6%     128.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.active_objs
    352.00 =C2=B1  9%     -63.6%     128.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.num_objs
    401.00 =C2=B1  4%     -68.6%     126.00 =C2=B1  0%  slabinfo.mnt_cache.=
active_objs
    401.00 =C2=B1  4%     -68.6%     126.00 =C2=B1  0%  slabinfo.mnt_cache.=
num_objs
      1569 =C2=B1  8%     -33.5%       1043 =C2=B1  3%  slabinfo.proc_inode=
_cache.active_objs
      1689 =C2=B1  5%     -28.8%       1202 =C2=B1  3%  slabinfo.proc_inode=
_cache.num_objs
      1157 =C2=B1  1%     -13.0%       1007 =C2=B1  0%  slabinfo.shmem_inod=
e_cache.active_objs
      1157 =C2=B1  1%     -13.0%       1007 =C2=B1  0%  slabinfo.shmem_inod=
e_cache.num_objs
    354.25 =C2=B1  1%     -30.2%     247.25 =C2=B1  0%  slabinfo.sighand_ca=
che.active_objs
    354.50 =C2=B1  1%     -28.3%     254.00 =C2=B1  0%  slabinfo.sighand_ca=
che.num_objs
    509.00 =C2=B1  0%     -42.6%     292.25 =C2=B1  2%  slabinfo.signal_cac=
he.active_objs
    509.00 =C2=B1  0%     -41.3%     299.00 =C2=B1  0%  slabinfo.signal_cac=
he.num_objs
    200.00 =C2=B1  0%     -87.5%      25.00 =C2=B1  0%  slabinfo.sigqueue.a=
ctive_objs
    200.00 =C2=B1  0%     -87.5%      25.00 =C2=B1  0%  slabinfo.sigqueue.n=
um_objs
    281.25 =C2=B1  3%     -46.7%     150.00 =C2=B1  0%  slabinfo.sock_inode=
_cache.active_objs
    281.25 =C2=B1  3%     -46.7%     150.00 =C2=B1  0%  slabinfo.sock_inode=
_cache.num_objs
      1978 =C2=B1  3%      -9.3%       1794 =C2=B1  0%  slabinfo.trace_even=
t_file.active_objs
      1978 =C2=B1  3%      -9.3%       1794 =C2=B1  0%  slabinfo.trace_even=
t_file.num_objs
      4820 =C2=B1  3%     -50.4%       2392 =C2=B1  0%  slabinfo.vm_area_st=
ruct.active_objs
      4893 =C2=B1  3%     -51.1%       2392 =C2=B1  0%  slabinfo.vm_area_st=
ruct.num_objs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/entries/iterations/kconfig/nr_threads/rootfs/tbox=
_group/testcase:
  gcc-4.9/performance/512/32x/x86_64-rhel/200%/debian-x86_64-2015-02-07.cgz=
/lkp-ne04/tlbflush

commit: =

  8025943c32f5de29b3fd548e917e24424297ca73
  0aefb957de5f2a1d9467126114146b6c793cf180

8025943c32f5de29 0aefb957de5f2a1d9467126114 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     40.25 =C2=B1  1%     -70.2%      12.00 =C2=B1  0%  tlbflush.mem_acc_co=
st_ns_time
     24194 =C2=B1  0%    +224.0%      78392 =C2=B1  0%  tlbflush.mem_acc_ti=
me_thread_ms
     13.50 =C2=B1  8%     -22.2%      10.50 =C2=B1  8%  tlbflush.munmap_ms
     93302 =C2=B1  1%     -11.4%      82676 =C2=B1  0%  tlbflush.munmap_ns_=
time
      1850 =C2=B1  2%     -96.4%      67.44 =C2=B1  0%  tlbflush.time.elaps=
ed_time
      1850 =C2=B1  2%     -96.4%      67.44 =C2=B1  0%  tlbflush.time.elaps=
ed_time.max
     15481 =C2=B1  7%     -95.0%     769.50 =C2=B1  2%  tlbflush.time.invol=
untary_context_switches
   1089421 =C2=B1  0%      -1.5%    1073125 =C2=B1  0%  tlbflush.time.minor=
_page_faults
    106.00 =C2=B1  4%     -94.3%       6.00 =C2=B1  0%  tlbflush.time.perce=
nt_of_cpu_this_job_got
      1857 =C2=B1  3%     -99.8%       3.26 =C2=B1  0%  tlbflush.time.syste=
m_time
    114.14 =C2=B1  0%     -99.2%       0.87 =C2=B1  1%  tlbflush.time.user_=
time
 2.937e+08 =C2=B1  1%     -99.6%    1149148 =C2=B1  0%  tlbflush.time.volun=
tary_context_switches
      1884 =C2=B1  2%     -95.0%      93.39 =C2=B1  4%  uptime.boot
     29615 =C2=B1  2%     -99.7%      77.05 =C2=B1  5%  uptime.idle
    189778 =C2=B1  1%     -99.3%       1300 =C2=B1  5%  softirqs.RCU
    449769 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  softirqs.SCHED
    527955 =C2=B1  2%     -97.3%      14115 =C2=B1  2%  softirqs.TIMER
      0.00 =C2=B1  0%      +Inf%       1.00 =C2=B1  0%  vmstat.procs.r
    318492 =C2=B1  3%     -91.4%      27411 =C2=B1  0%  vmstat.system.cs
    150983 =C2=B1  3%     -94.5%       8329 =C2=B1  0%  vmstat.system.in
   2170127 =C2=B1  1%     -44.1%    1212584 =C2=B1  0%  numa-numastat.node0=
.local_node
   2170130 =C2=B1  1%     -44.1%    1212584 =C2=B1  0%  numa-numastat.node0=
.numa_hit
   2186570 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  numa-numastat.node1=
.local_node
   2186572 =C2=B1  2%    -100.0%       0.75 =C2=B1 57%  numa-numastat.node1=
.numa_hit
      1850 =C2=B1  2%     -96.4%      67.44 =C2=B1  0%  time.elapsed_time
      1850 =C2=B1  2%     -96.4%      67.44 =C2=B1  0%  time.elapsed_time.m=
ax
     15481 =C2=B1  7%     -95.0%     769.50 =C2=B1  2%  time.involuntary_co=
ntext_switches
    106.00 =C2=B1  4%     -94.3%       6.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
      1857 =C2=B1  3%     -99.8%       3.26 =C2=B1  0%  time.system_time
    114.14 =C2=B1  0%     -99.2%       0.87 =C2=B1  1%  time.user_time
 2.937e+08 =C2=B1  1%     -99.6%    1149148 =C2=B1  0%  time.voluntary_cont=
ext_switches
     23322 =C2=B1  1%      -9.6%      21088 =C2=B1  3%  meminfo.Active(anon)
     23069 =C2=B1  1%     -10.0%      20761 =C2=B1  3%  meminfo.AnonPages
    448939 =C2=B1  0%     -28.2%     322421 =C2=B1  0%  meminfo.Committed_AS
     75620 =C2=B1  9%     -55.5%      33636 =C2=B1  9%  meminfo.DirectMap4k
      5124 =C2=B1  0%      -9.4%       4642 =C2=B1  0%  meminfo.KernelStack
     36775 =C2=B1  0%     -10.0%      33099 =C2=B1  0%  meminfo.SReclaimable
     34169 =C2=B1  0%     -37.2%      21461 =C2=B1  1%  meminfo.SUnreclaim
     70945 =C2=B1  0%     -23.1%      54561 =C2=B1  0%  meminfo.Slab
     10.16 =C2=B1  3%     +25.7%      12.78 =C2=B1  0%  turbostat.%Busy
    193.25 =C2=B1  3%    +111.3%     408.25 =C2=B1  0%  turbostat.Avg_MHz
      1902 =C2=B1  0%     +67.8%       3192 =C2=B1  0%  turbostat.Bzy_MHz
     76.39 =C2=B1  2%     +14.2%      87.22 =C2=B1  0%  turbostat.CPU%c1
      0.17 =C2=B1 36%    -100.0%       0.00 =C2=B1 -1%  turbostat.CPU%c3
     13.28 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  turbostat.CPU%c6
      0.17 =C2=B1 37%    -100.0%       0.00 =C2=B1 -1%  turbostat.Pkg%pc3
      0.93 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  turbostat.Pkg%pc6
 3.452e+08 =C2=B1 13%    -100.0%      33527 =C2=B1  8%  cpuidle.C1-NHM.time
  17560412 =C2=B1  6%    -100.0%       1062 =C2=B1  6%  cpuidle.C1-NHM.usage
 1.618e+10 =C2=B1  2%     -99.8%   30101860 =C2=B1  0%  cpuidle.C1E-NHM.time
 2.734e+08 =C2=B1  2%     -99.8%     561256 =C2=B1  0%  cpuidle.C1E-NHM.usa=
ge
  46772830 =C2=B1 23%     -99.7%     138721 =C2=B1 13%  cpuidle.C3-NHM.time
      8532 =C2=B1  5%     -96.8%     269.75 =C2=B1 10%  cpuidle.C3-NHM.usage
 1.008e+10 =C2=B1  8%     -99.7%   29131409 =C2=B1  1%  cpuidle.C6-NHM.time
    294031 =C2=B1 11%     -99.4%       1634 =C2=B1  1%  cpuidle.C6-NHM.usage
  18990826 =C2=B1  6%     -99.3%     125616 =C2=B1 50%  cpuidle.POLL.time
   1217914 =C2=B1  1%    -100.0%     142.75 =C2=B1 13%  cpuidle.POLL.usage
      5830 =C2=B1  1%      -9.6%       5268 =C2=B1  3%  proc-vmstat.nr_acti=
ve_anon
      5767 =C2=B1  1%     -10.1%       5187 =C2=B1  3%  proc-vmstat.nr_anon=
_pages
    231.50 =C2=B1  2%     -78.4%      50.00 =C2=B1 13%  proc-vmstat.nr_dirt=
ied
      9193 =C2=B1  0%     -10.0%       8274 =C2=B1  0%  proc-vmstat.nr_slab=
_reclaimable
      8542 =C2=B1  0%     -37.2%       5364 =C2=B1  1%  proc-vmstat.nr_slab=
_unreclaimable
    229.00 =C2=B1  1%     -59.7%      92.25 =C2=B1  5%  proc-vmstat.nr_writ=
ten
      8368 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%  proc-vmstat.numa_hi=
nt_faults
      6412 =C2=B1  3%    -100.0%       0.00 =C2=B1  0%  proc-vmstat.numa_hi=
nt_faults_local
   4352636 =C2=B1  1%     -72.2%    1208291 =C2=B1  0%  proc-vmstat.numa_hit
   4352630 =C2=B1  1%     -72.2%    1208290 =C2=B1  0%  proc-vmstat.numa_lo=
cal
      4911 =C2=B1 33%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.numa_pa=
ges_migrated
     44578 =C2=B1 37%    -100.0%       0.00 =C2=B1  0%  proc-vmstat.numa_pt=
e_updates
    809846 =C2=B1  2%     -42.6%     464591 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
   3707267 =C2=B1  1%     -79.7%     753227 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
   4938958 =C2=B1  1%     -75.1%    1230331 =C2=B1  0%  proc-vmstat.pgfault
   4476805 =C2=B1  1%     -73.6%    1180993 =C2=B1  0%  proc-vmstat.pgfree
      4911 =C2=B1 33%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.pgmigra=
te_success
     15521 =C2=B1 25%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.c=
group_kn_lock_live.__cgroup_procs_write.cgroup_procs_write.cgroup_file_writ=
e.kernfs_fop_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
  13899367 =C2=B1 31%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     15761 =C2=B1 25%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.p=
roc_cgroup_show.proc_single_show.seq_read.__vfs_read.vfs_read.SyS_read.entr=
y_SYSCALL_64_fastpath
     30956 =C2=B1  1%     -95.7%       1316 =C2=B1  0%  latency_stats.hits.=
do_wait.SyS_wait4.entry_SYSCALL_64_fastpath
    203077 =C2=B1  3%    -100.0%      47.75 =C2=B1  5%  latency_stats.hits.=
futex_wait_queue_me.futex_wait.do_futex.SyS_futex.entry_SYSCALL_64_fastpath
 2.935e+08 =C2=B1  1%     -99.6%    1148536 =C2=B1  0%  latency_stats.hits.=
hrtimer_nanosleep.SyS_nanosleep.entry_SYSCALL_64_fastpath
    326462 =C2=B1  2%     -73.9%      85271 =C2=B1  1%  latency_stats.hits.=
pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     15521 =C2=B1 25%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.c=
group_kn_lock_live.__cgroup_procs_write.cgroup_procs_write.cgroup_file_writ=
e.kernfs_fop_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
  51851682 =C2=B1 59%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     15761 =C2=B1 25%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.p=
roc_cgroup_show.proc_single_show.seq_read.__vfs_read.vfs_read.SyS_read.entr=
y_SYSCALL_64_fastpath
     62270 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
      9619 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_write_failed.SyS_mprotect.entry_SYSCALL_64_fastpath
     15521 =C2=B1 25%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
group_kn_lock_live.__cgroup_procs_write.cgroup_procs_write.cgroup_file_writ=
e.kernfs_fop_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
   9595382 =C2=B1  3%     -93.3%     643311 =C2=B1  1%  latency_stats.sum.d=
o_wait.SyS_wait4.entry_SYSCALL_64_fastpath
    480285 =C2=B1  4%     -99.5%       2564 =C2=B1 23%  latency_stats.sum.f=
utex_wait_queue_me.futex_wait.do_futex.SyS_futex.entry_SYSCALL_64_fastpath
 1.493e+10 =C2=B1  1%     -99.6%   57819715 =C2=B1  0%  latency_stats.sum.h=
rtimer_nanosleep.SyS_nanosleep.entry_SYSCALL_64_fastpath
 1.381e+08 =C2=B1 45%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
  15513065 =C2=B1  3%     -93.1%    1064895 =C2=B1  1%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     15128 =C2=B1 17%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.p=
ipe_wait.pipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpa=
th
     15761 =C2=B1 25%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.p=
roc_cgroup_show.proc_single_show.seq_read.__vfs_read.vfs_read.SyS_read.entr=
y_SYSCALL_64_fastpath
     50381 =C2=B1 28%     -97.0%       1488 =C2=B1 29%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.link_path_walk
      3307 =C2=B1 16%     +59.2%       5263 =C2=B1  3%  numa-vmstat.node0.n=
r_active_anon
      3269 =C2=B1 16%     +58.5%       5182 =C2=B1  3%  numa-vmstat.node0.n=
r_anon_pages
     76608 =C2=B1  2%     +20.1%      91993 =C2=B1  0%  numa-vmstat.node0.n=
r_file_pages
     18363 =C2=B1  8%     +83.1%      33630 =C2=B1  0%  numa-vmstat.node0.n=
r_inactive_anon
    193.75 =C2=B1  5%     +28.6%     249.25 =C2=B1  0%  numa-vmstat.node0.n=
r_kernel_stack
     18719 =C2=B1  8%     +78.9%      33496 =C2=B1  0%  numa-vmstat.node0.n=
r_mapped
    486.50 =C2=B1 10%     +86.4%     906.75 =C2=B1  0%  numa-vmstat.node0.n=
r_page_table_pages
     18412 =C2=B1  8%     +83.1%      33716 =C2=B1  0%  numa-vmstat.node0.n=
r_shmem
      4314 =C2=B1  4%     -11.1%       3834 =C2=B1  2%  numa-vmstat.node0.n=
r_slab_unreclaimable
   1195184 =C2=B1  2%     -36.6%     757237 =C2=B1  0%  numa-vmstat.node0.n=
uma_hit
   1193548 =C2=B1  2%     -36.6%     757237 =C2=B1  0%  numa-vmstat.node0.n=
uma_local
      1635 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node0.n=
uma_other
      2524 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_active_anon
      2499 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_anon_pages
     74964 =C2=B1  2%     -22.5%      58104 =C2=B1  0%  numa-vmstat.node1.n=
r_file_pages
     16719 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_inactive_anon
    125.50 =C2=B1  7%     -68.1%      40.00 =C2=B1  0%  numa-vmstat.node1.n=
r_kernel_stack
     17613 =C2=B1  9%     -92.6%       1305 =C2=B1  0%  numa-vmstat.node1.n=
r_mapped
    414.00 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_page_table_pages
     16757 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_shmem
      4593 =C2=B1  3%     -24.4%       3473 =C2=B1  3%  numa-vmstat.node1.n=
r_slab_reclaimable
      4227 =C2=B1  3%     -63.8%       1529 =C2=B1  4%  numa-vmstat.node1.n=
r_slab_unreclaimable
   1211585 =C2=B1  3%     -94.7%      64037 =C2=B1  0%  numa-vmstat.node1.n=
uma_hit
   1148733 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
uma_local
     13229 =C2=B1 16%     +59.3%      21068 =C2=B1  3%  numa-meminfo.node0.=
Active(anon)
     13080 =C2=B1 16%     +58.6%      20744 =C2=B1  3%  numa-meminfo.node0.=
AnonPages
    306422 =C2=B1  2%     +20.2%     368375 =C2=B1  0%  numa-meminfo.node0.=
FilePages
    257002 =C2=B1  2%     +24.4%     319620 =C2=B1  0%  numa-meminfo.node0.=
Inactive
     73438 =C2=B1  8%     +83.7%     134925 =C2=B1  0%  numa-meminfo.node0.=
Inactive(anon)
      3110 =C2=B1  5%     +28.5%       3998 =C2=B1  0%  numa-meminfo.node0.=
KernelStack
     74863 =C2=B1  8%     +79.6%     134428 =C2=B1  0%  numa-meminfo.node0.=
Mapped
    400809 =C2=B1  1%     +14.9%     460453 =C2=B1  0%  numa-meminfo.node0.=
MemUsed
      1947 =C2=B1 10%     +86.5%       3631 =C2=B1  0%  numa-meminfo.node0.=
PageTables
     17259 =C2=B1  4%     -11.1%      15340 =C2=B1  2%  numa-meminfo.node0.=
SUnreclaim
     73635 =C2=B1  8%     +83.7%     135270 =C2=B1  0%  numa-meminfo.node0.=
Shmem
     59303 =C2=B1  5%     -17.0%      49195 =C2=B1  1%  numa-meminfo.node1.=
Active
     10097 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
Active(anon)
      1315 =C2=B1141%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
AnonHugePages
      9997 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
AnonPages
    299861 =C2=B1  2%     -22.5%     232416 =C2=B1  0%  numa-meminfo.node1.=
FilePages
    250508 =C2=B1  2%     -26.9%     183219 =C2=B1  0%  numa-meminfo.node1.=
Inactive
     66881 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
Inactive(anon)
      2013 =C2=B1  8%     -68.2%     640.00 =C2=B1  0%  numa-meminfo.node1.=
KernelStack
     70467 =C2=B1  9%     -92.6%       5223 =C2=B1  0%  numa-meminfo.node1.=
Mapped
    379163 =C2=B1  1%     -28.8%     270081 =C2=B1  0%  numa-meminfo.node1.=
MemUsed
      1656 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
PageTables
     18374 =C2=B1  3%     -24.4%      13892 =C2=B1  3%  numa-meminfo.node1.=
SReclaimable
     16910 =C2=B1  3%     -63.8%       6118 =C2=B1  4%  numa-meminfo.node1.=
SUnreclaim
     67031 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
Shmem
     35284 =C2=B1  0%     -43.3%      20010 =C2=B1  3%  numa-meminfo.node1.=
Slab
      3074 =C2=B1  3%     -37.0%       1938 =C2=B1  0%  slabinfo.Acpi-Names=
pace.active_objs
      3074 =C2=B1  3%     -37.0%       1938 =C2=B1  0%  slabinfo.Acpi-Names=
pace.num_objs
    614.25 =C2=B1  2%     -87.3%      78.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.active_objs
    614.25 =C2=B1  2%     -87.3%      78.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.num_objs
    648.00 =C2=B1  0%     -70.8%     189.00 =C2=B1  8%  slabinfo.RAW.active=
_objs
    648.00 =C2=B1  0%     -70.8%     189.00 =C2=B1  8%  slabinfo.RAW.num_ob=
js
    114.75 =C2=B1  6%     -85.2%      17.00 =C2=B1  0%  slabinfo.TCP.active=
_objs
    114.75 =C2=B1  6%     -85.2%      17.00 =C2=B1  0%  slabinfo.TCP.num_ob=
js
    204.00 =C2=B1 11%     -83.3%      34.00 =C2=B1  0%  slabinfo.UDP.active=
_objs
    204.00 =C2=B1 11%     -83.3%      34.00 =C2=B1  0%  slabinfo.UDP.num_ob=
js
      4338 =C2=B1  5%     -73.0%       1171 =C2=B1  0%  slabinfo.anon_vma.a=
ctive_objs
      4338 =C2=B1  5%     -73.0%       1171 =C2=B1  0%  slabinfo.anon_vma.n=
um_objs
    784.75 =C2=B1  7%     -90.7%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.active_objs
    784.75 =C2=B1  7%     -90.7%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.num_objs
    351.00 =C2=B1  7%     -88.9%      39.00 =C2=B1  0%  slabinfo.bdev_cache=
.active_objs
    351.00 =C2=B1  7%     -88.9%      39.00 =C2=B1  0%  slabinfo.bdev_cache=
.num_objs
    649.00 =C2=B1  5%     -93.2%      44.00 =C2=B1  0%  slabinfo.blkdev_req=
uests.active_objs
    649.00 =C2=B1  5%     -93.2%      44.00 =C2=B1  0%  slabinfo.blkdev_req=
uests.num_objs
    312.00 =C2=B1  0%     -75.0%      78.00 =C2=B1  0%  slabinfo.buffer_hea=
d.active_objs
    312.00 =C2=B1  0%     -75.0%      78.00 =C2=B1  0%  slabinfo.buffer_hea=
d.num_objs
    204.00 =C2=B1  0%     -50.0%     102.00 =C2=B1  0%  slabinfo.ext4_exten=
t_status.active_objs
    204.00 =C2=B1  0%     -50.0%     102.00 =C2=B1  0%  slabinfo.ext4_exten=
t_status.num_objs
    467.75 =C2=B1  7%     -91.7%      39.00 =C2=B1  0%  slabinfo.file_lock_=
cache.active_objs
    467.75 =C2=B1  7%     -91.7%      39.00 =C2=B1  0%  slabinfo.file_lock_=
cache.num_objs
    736.00 =C2=B1  0%     -81.4%     137.00 =C2=B1  0%  slabinfo.files_cach=
e.active_objs
    736.00 =C2=B1  0%     -81.4%     137.00 =C2=B1  0%  slabinfo.files_cach=
e.num_objs
      3995 =C2=B1  2%     -10.6%       3570 =C2=B1  0%  slabinfo.ftrace_eve=
nt_field.active_objs
      3995 =C2=B1  2%     -10.6%       3570 =C2=B1  0%  slabinfo.ftrace_eve=
nt_field.num_objs
    744.25 =C2=B1  2%     -33.5%     495.00 =C2=B1  0%  slabinfo.idr_layer_=
cache.active_objs
    744.25 =C2=B1  2%     -33.5%     495.00 =C2=B1  0%  slabinfo.idr_layer_=
cache.num_objs
     29312 =C2=B1  0%     -13.4%      25389 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.active_objs
    862.00 =C2=B1  0%     -13.4%     746.75 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.active_slabs
     29312 =C2=B1  0%     -13.4%      25389 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.num_objs
    862.00 =C2=B1  0%     -13.4%     746.75 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.num_slabs
      1476 =C2=B1  2%     -48.2%     764.25 =C2=B1  0%  slabinfo.kmalloc-10=
24.active_objs
      1476 =C2=B1  2%     -48.0%     768.00 =C2=B1  0%  slabinfo.kmalloc-10=
24.num_objs
      2397 =C2=B1  3%     -44.0%       1343 =C2=B1  0%  slabinfo.kmalloc-12=
8.active_objs
      2397 =C2=B1  3%     -44.0%       1343 =C2=B1  0%  slabinfo.kmalloc-12=
8.num_objs
      9651 =C2=B1  5%     -39.1%       5874 =C2=B1 21%  slabinfo.kmalloc-16=
.active_objs
      9651 =C2=B1  5%     -35.9%       6183 =C2=B1 28%  slabinfo.kmalloc-16=
.num_objs
      4914 =C2=B1  1%     -48.4%       2538 =C2=B1  1%  slabinfo.kmalloc-19=
2.active_objs
      4934 =C2=B1  1%     -47.6%       2583 =C2=B1  1%  slabinfo.kmalloc-19=
2.num_objs
    681.00 =C2=B1  4%     -42.8%     389.25 =C2=B1  1%  slabinfo.kmalloc-20=
48.active_objs
    744.00 =C2=B1  3%     -45.2%     407.75 =C2=B1  1%  slabinfo.kmalloc-20=
48.num_objs
      3212 =C2=B1  5%     -55.1%       1442 =C2=B1  8%  slabinfo.kmalloc-25=
6.active_objs
      3782 =C2=B1  5%     -47.7%       1979 =C2=B1  5%  slabinfo.kmalloc-25=
6.num_objs
      9887 =C2=B1  1%     -43.0%       5632 =C2=B1  0%  slabinfo.kmalloc-32=
.active_objs
      9887 =C2=B1  1%     -43.0%       5632 =C2=B1  0%  slabinfo.kmalloc-32=
.num_objs
    336.00 =C2=B1  2%     -38.4%     207.00 =C2=B1  0%  slabinfo.kmalloc-40=
96.active_objs
    336.00 =C2=B1  2%     -38.4%     207.00 =C2=B1  0%  slabinfo.kmalloc-40=
96.num_objs
      2137 =C2=B1  4%     -46.7%       1139 =C2=B1  0%  slabinfo.kmalloc-51=
2.active_objs
      2232 =C2=B1  1%     -35.5%       1440 =C2=B1  3%  slabinfo.kmalloc-51=
2.num_objs
     21337 =C2=B1  1%     -34.0%      14075 =C2=B1  0%  slabinfo.kmalloc-64=
.active_objs
    338.50 =C2=B1  1%     -34.9%     220.50 =C2=B1  0%  slabinfo.kmalloc-64=
.active_slabs
     21692 =C2=B1  1%     -34.7%      14158 =C2=B1  0%  slabinfo.kmalloc-64=
.num_objs
    338.50 =C2=B1  1%     -34.9%     220.50 =C2=B1  0%  slabinfo.kmalloc-64=
.num_slabs
      9882 =C2=B1  2%     -62.6%       3698 =C2=B1  5%  slabinfo.kmalloc-8.=
active_objs
     10112 =C2=B1  2%     -63.3%       3712 =C2=B1  5%  slabinfo.kmalloc-8.=
num_objs
      1864 =C2=B1  7%     -42.8%       1067 =C2=B1  0%  slabinfo.kmalloc-96=
.active_objs
      1976 =C2=B1  4%     -39.4%       1197 =C2=B1  1%  slabinfo.kmalloc-96=
.num_objs
    275.00 =C2=B1  6%     -54.5%     125.00 =C2=B1  0%  slabinfo.kmem_cache=
.active_objs
    275.00 =C2=B1  6%     -54.5%     125.00 =C2=B1  0%  slabinfo.kmem_cache=
.num_objs
    631.00 =C2=B1  7%     -60.9%     247.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.active_objs
    640.00 =C2=B1  7%     -60.0%     256.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.num_objs
    310.00 =C2=B1  2%     -67.4%     101.00 =C2=B1  0%  slabinfo.mm_struct.=
active_objs
    310.00 =C2=B1  2%     -67.4%     101.00 =C2=B1  0%  slabinfo.mm_struct.=
num_objs
    661.50 =C2=B1  2%     -81.0%     126.00 =C2=B1  0%  slabinfo.mnt_cache.=
active_objs
    661.50 =C2=B1  2%     -81.0%     126.00 =C2=B1  0%  slabinfo.mnt_cache.=
num_objs
      2464 =C2=B1  3%     -41.1%       1451 =C2=B1  0%  slabinfo.proc_inode=
_cache.active_objs
      2569 =C2=B1  3%     -42.8%       1469 =C2=B1  0%  slabinfo.proc_inode=
_cache.num_objs
      9852 =C2=B1  1%     -18.6%       8017 =C2=B1  0%  slabinfo.radix_tree=
_node.active_objs
     10056 =C2=B1  1%     -20.2%       8020 =C2=B1  0%  slabinfo.radix_tree=
_node.num_objs
      2544 =C2=B1  9%     -40.7%       1507 =C2=B1  9%  slabinfo.shmem_inod=
e_cache.active_objs
      2627 =C2=B1  9%     -40.5%       1562 =C2=B1  8%  slabinfo.shmem_inod=
e_cache.num_objs
    539.00 =C2=B1  3%     -44.5%     299.00 =C2=B1  0%  slabinfo.sighand_ca=
che.active_objs
    539.00 =C2=B1  3%     -44.5%     299.00 =C2=B1  0%  slabinfo.sighand_ca=
che.num_objs
    774.75 =C2=B1  2%     -53.7%     359.00 =C2=B1  0%  slabinfo.signal_cac=
he.active_objs
    774.75 =C2=B1  2%     -53.7%     359.00 =C2=B1  0%  slabinfo.signal_cac=
he.num_objs
    425.00 =C2=B1  0%     -94.1%      25.00 =C2=B1  0%  slabinfo.sigqueue.a=
ctive_objs
    425.00 =C2=B1  0%     -94.1%      25.00 =C2=B1  0%  slabinfo.sigqueue.n=
um_objs
    512.50 =C2=B1  2%     -65.9%     175.00 =C2=B1  0%  slabinfo.sock_inode=
_cache.active_objs
    512.50 =C2=B1  2%     -65.9%     175.00 =C2=B1  0%  slabinfo.sock_inode=
_cache.num_objs
    329.25 =C2=B1  2%     -93.3%      22.00 =C2=B1  0%  slabinfo.taskstats.=
active_objs
    329.25 =C2=B1  2%     -93.3%      22.00 =C2=B1  0%  slabinfo.taskstats.=
num_objs
      2139 =C2=B1  1%     -16.1%       1794 =C2=B1  0%  slabinfo.trace_even=
t_file.active_objs
      2139 =C2=B1  1%     -16.1%       1794 =C2=B1  0%  slabinfo.trace_even=
t_file.num_objs
      7852 =C2=B1  1%     -64.9%       2759 =C2=B1 11%  slabinfo.vm_area_st=
ruct.active_objs
    180.75 =C2=B1  1%     -63.3%      66.25 =C2=B1 12%  slabinfo.vm_area_st=
ruct.active_slabs
      7964 =C2=B1  1%     -63.0%       2945 =C2=B1 12%  slabinfo.vm_area_st=
ruct.num_objs
    180.75 =C2=B1  1%     -63.3%      66.25 =C2=B1 12%  slabinfo.vm_area_st=
ruct.num_slabs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/ipc/kconfig/mode/nr_threads/rootfs/tbox_group/tes=
tcase:
  gcc-4.9/performance/socket/x86_64-rhel/threads/1600%/debian-x86_64-2015-0=
2-07.cgz/lkp-ivb-d02/hackbench

commit: =

  8025943c32f5de29b3fd548e917e24424297ca73
  0aefb957de5f2a1d9467126114146b6c793cf180

8025943c32f5de29 0aefb957de5f2a1d9467126114 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     20799 =C2=B1  0%     -60.4%       8242 =C2=B1  0%  hackbench.throughput
    610.81 =C2=B1  0%      +2.6%     626.57 =C2=B1  0%  hackbench.time.elap=
sed_time
    610.81 =C2=B1  0%      +2.6%     626.57 =C2=B1  0%  hackbench.time.elap=
sed_time.max
   2432500 =C2=B1 11%    +193.8%    7147756 =C2=B1  2%  hackbench.time.invo=
luntary_context_switches
    152233 =C2=B1  0%     -59.2%      62096 =C2=B1  0%  hackbench.time.mino=
r_page_faults
    395.00 =C2=B1  0%     -75.2%      98.00 =C2=B1  0%  hackbench.time.perc=
ent_of_cpu_this_job_got
      2294 =C2=B1  0%     -74.7%     580.34 =C2=B1  0%  hackbench.time.syst=
em_time
    119.19 =C2=B1  0%     -66.9%      39.50 =C2=B1  0%  hackbench.time.user=
_time
     64.79 =C2=B1  1%     -82.3%      11.44 =C2=B1  2%  uptime.idle
     48697 =C2=B1  1%     +10.1%      53595 =C2=B1  2%  vmstat.system.cs
      4849 =C2=B1  1%     -78.5%       1041 =C2=B1  0%  vmstat.system.in
    156904 =C2=B1  1%     -92.7%      11518 =C2=B1  1%  softirqs.RCU
     19311 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  softirqs.SCHED
   1226199 =C2=B1  0%     -73.9%     320362 =C2=B1  0%  softirqs.TIMER
     73396 =C2=B1 25%     -47.4%      38580 =C2=B1  7%  meminfo.DirectMap4k
     85032 =C2=B1  0%     +18.9%     101134 =C2=B1  1%  meminfo.SUnreclaim
     13612 =C2=B1  0%     -22.2%      10592 =C2=B1  0%  meminfo.Shmem
    120348 =C2=B1  0%     +12.7%     135681 =C2=B1  0%  meminfo.Slab
    216.00 =C2=B1  0%     -59.3%      88.00 =C2=B1  0%  time.file_system_ou=
tputs
   2432500 =C2=B1 11%    +193.8%    7147756 =C2=B1  2%  time.involuntary_co=
ntext_switches
    152233 =C2=B1  0%     -59.2%      62096 =C2=B1  0%  time.minor_page_fau=
lts
    395.00 =C2=B1  0%     -75.2%      98.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
      2294 =C2=B1  0%     -74.7%     580.34 =C2=B1  0%  time.system_time
    119.19 =C2=B1  0%     -66.9%      39.50 =C2=B1  0%  time.user_time
   3318176 =C2=B1  4%     -99.0%      32776 =C2=B1172%  cpuidle.C1-IVB.time
    212064 =C2=B1  4%    -100.0%       5.00 =C2=B1 82%  cpuidle.C1-IVB.usage
    400214 =C2=B1 17%     -98.3%       6757 =C2=B1 25%  cpuidle.C1E-IVB.time
      2638 =C2=B1 12%     -99.0%      25.75 =C2=B1 16%  cpuidle.C1E-IVB.usa=
ge
    377012 =C2=B1 24%     -97.6%       9008 =C2=B1 16%  cpuidle.C3-IVB.time
    501.75 =C2=B1 10%     -95.9%      20.75 =C2=B1 29%  cpuidle.C3-IVB.usage
   7514918 =C2=B1  2%     -91.0%     674327 =C2=B1  9%  cpuidle.C6-IVB.time
      3212 =C2=B1  4%     -96.4%     114.50 =C2=B1  8%  cpuidle.C6-IVB.usage
     25.75 =C2=B1 42%     -90.3%       2.50 =C2=B1 60%  cpuidle.POLL.usage
    287530 =C2=B1  1%     -71.4%      82258 =C2=B1  0%  latency_stats.hits.=
pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     21314 =C2=B1  1%     -75.0%       5331 =C2=B1  0%  latency_stats.hits.=
poll_schedule_timeout.do_sys_poll.SyS_poll.entry_SYSCALL_64_fastpath
   5790615 =C2=B1  0%     -82.5%    1010834 =C2=B1  3%  latency_stats.hits.=
sock_alloc_send_pskb.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.__vfs=
_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
  45471476 =C2=B1104%     -79.2%    9474069 =C2=B1100%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     29980 =C2=B1 93%   +1198.2%     389198 =C2=B1171%  latency_stats.max.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
  68545649 =C2=B1 77%     -66.5%   22958470 =C2=B1100%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
  52450453 =C2=B1  1%     -79.2%   10917503 =C2=B1  1%  latency_stats.sum.p=
oll_schedule_timeout.do_sys_poll.SyS_poll.entry_SYSCALL_64_fastpath
 1.046e+10 =C2=B1  0%     -89.5%  1.103e+09 =C2=B1  3%  latency_stats.sum.s=
ock_alloc_send_pskb.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.__vfs_=
write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
 7.692e+09 =C2=B1  2%     -75.3%  1.902e+09 =C2=B1  1%  latency_stats.sum.u=
nix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.__v=
fs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      0.26 =C2=B1  1%     -54.9%       0.11 =C2=B1  7%  turbostat.CPU%c1
      0.02 =C2=B1 35%    -100.0%       0.00 =C2=B1 -1%  turbostat.CPU%c3
      0.20 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  turbostat.CPU%c6
     18.31 =C2=B1  0%     -34.1%      12.06 =C2=B1  0%  turbostat.CorWatt
     44.75 =C2=B1  2%     -16.8%      37.25 =C2=B1  2%  turbostat.CoreTmp
      0.01 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  turbostat.Pkg%pc2
      0.02 =C2=B1 61%    -100.0%       0.00 =C2=B1 -1%  turbostat.Pkg%pc3
      0.12 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  turbostat.Pkg%pc6
     45.25 =C2=B1  1%     -17.1%      37.50 =C2=B1  2%  turbostat.PkgTmp
     35.83 =C2=B1  0%     -18.8%      29.11 =C2=B1  0%  turbostat.PkgWatt
    141.25 =C2=B1 18%     -51.7%      68.25 =C2=B1  4%  proc-vmstat.nr_dirt=
ied
      3400 =C2=B1  0%     -22.2%       2646 =C2=B1  0%  proc-vmstat.nr_shmem
     21489 =C2=B1  1%     +18.6%      25495 =C2=B1  1%  proc-vmstat.nr_slab=
_unreclaimable
    141.50 =C2=B1 19%     -33.2%      94.50 =C2=B1  5%  proc-vmstat.nr_writ=
ten
   1631639 =C2=B1  2%     -37.2%    1025165 =C2=B1  0%  proc-vmstat.numa_hit
   1631639 =C2=B1  2%     -37.2%    1025165 =C2=B1  0%  proc-vmstat.numa_lo=
cal
      1776 =C2=B1  1%     -71.2%     511.50 =C2=B1  2%  proc-vmstat.pgactiv=
ate
   1137636 =C2=B1  2%     -39.1%     693352 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
   1497599 =C2=B1  2%     -39.5%     905878 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
    312396 =C2=B1  0%     -45.7%     169585 =C2=B1  0%  proc-vmstat.pgfault
   2609201 =C2=B1  2%     -39.7%    1573353 =C2=B1  0%  proc-vmstat.pgfree
      2213 =C2=B1  1%     -12.4%       1938 =C2=B1  0%  slabinfo.Acpi-Names=
pace.active_objs
      2213 =C2=B1  1%     -12.4%       1938 =C2=B1  0%  slabinfo.Acpi-Names=
pace.num_objs
      2137 =C2=B1  7%     -50.1%       1067 =C2=B1  0%  slabinfo.anon_vma.a=
ctive_objs
      2141 =C2=B1  7%     -50.2%       1067 =C2=B1  0%  slabinfo.anon_vma.n=
um_objs
    273.75 =C2=B1 11%     -73.3%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.active_objs
    273.75 =C2=B1 11%     -73.3%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.num_objs
    204.00 =C2=B1  0%     -50.0%     102.00 =C2=B1  0%  slabinfo.ext4_exten=
t_status.active_objs
    204.00 =C2=B1  0%     -50.0%     102.00 =C2=B1  0%  slabinfo.ext4_exten=
t_status.num_objs
      4682 =C2=B1  1%     -21.4%       3680 =C2=B1  0%  slabinfo.kmalloc-12=
8.active_objs
      4788 =C2=B1  1%     -20.7%       3795 =C2=B1  0%  slabinfo.kmalloc-12=
8.num_objs
     12605 =C2=B1  5%     -49.6%       6357 =C2=B1  0%  slabinfo.kmalloc-16=
.active_objs
     12745 =C2=B1  5%     -50.1%       6357 =C2=B1  0%  slabinfo.kmalloc-16=
.num_objs
      2465 =C2=B1  5%     -20.1%       1969 =C2=B1  1%  slabinfo.kmalloc-19=
2.active_objs
      2615 =C2=B1  4%     -21.7%       2047 =C2=B1  0%  slabinfo.kmalloc-19=
2.num_objs
     26550 =C2=B1  3%     +36.9%      36341 =C2=B1  2%  slabinfo.kmalloc-25=
6.active_objs
      3371 =C2=B1  3%     +47.0%       4954 =C2=B1  1%  slabinfo.kmalloc-25=
6.active_slabs
     53940 =C2=B1  3%     +47.0%      79284 =C2=B1  1%  slabinfo.kmalloc-25=
6.num_objs
      3371 =C2=B1  3%     +47.0%       4954 =C2=B1  1%  slabinfo.kmalloc-25=
6.num_slabs
      8607 =C2=B1  8%     -39.3%       5223 =C2=B1  0%  slabinfo.kmalloc-32=
.active_objs
      8758 =C2=B1  8%     -40.4%       5223 =C2=B1  0%  slabinfo.kmalloc-32=
.num_objs
     23697 =C2=B1  3%     +40.6%      33308 =C2=B1  3%  slabinfo.kmalloc-51=
2.active_objs
      3182 =C2=B1  3%     +49.7%       4764 =C2=B1  1%  slabinfo.kmalloc-51=
2.active_slabs
     50916 =C2=B1  3%     +49.7%      76240 =C2=B1  1%  slabinfo.kmalloc-51=
2.num_objs
      3182 =C2=B1  3%     +49.7%       4764 =C2=B1  1%  slabinfo.kmalloc-51=
2.num_slabs
      4478 =C2=B1  9%     -20.0%       3584 =C2=B1  0%  slabinfo.kmalloc-8.=
active_objs
      4478 =C2=B1  9%     -20.0%       3584 =C2=B1  0%  slabinfo.kmalloc-8.=
num_objs
      1278 =C2=B1  7%     -21.2%       1008 =C2=B1  0%  slabinfo.kmalloc-96=
.active_objs
      1278 =C2=B1  7%     -21.2%       1008 =C2=B1  0%  slabinfo.kmalloc-96=
.num_objs
    256.00 =C2=B1 17%     -50.0%     128.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.active_objs
    256.00 =C2=B1 17%     -50.0%     128.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.num_objs
      1680 =C2=B1  2%     -21.1%       1326 =C2=B1  0%  slabinfo.proc_inode=
_cache.active_objs
      1730 =C2=B1  2%     -20.4%       1377 =C2=B1  0%  slabinfo.proc_inode=
_cache.num_objs
    362.25 =C2=B1  1%     -42.3%     209.00 =C2=B1  0%  slabinfo.signal_cac=
he.active_objs
    362.25 =C2=B1  1%     -42.3%     209.00 =C2=B1  0%  slabinfo.signal_cac=
he.num_objs
      1.71 =C2=B1 10%    +312.9%       7.06 =C2=B1  5%  perf-profile.cycles=
-pp.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.activate_t=
ask.ttwu_do_activate
     11.64 =C2=B1  2%     -17.3%       9.63 =C2=B1  2%  perf-profile.cycles=
-pp.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendm=
sg.sock_sendmsg
      0.60 =C2=B1 17%    +448.5%       3.30 =C2=B1  6%  perf-profile.cycles=
-pp.__kernel_text_address.print_context_stack.dump_trace.save_stack_trace_t=
sk.__account_scheduler_latency
      2.83 =C2=B1  7%     +18.3%       3.35 =C2=B1  4%  perf-profile.cycles=
-pp.__kmalloc_node_track_caller.__kmalloc_reserve.__alloc_skb.alloc_skb_wit=
h_frags.sock_alloc_send_pskb
      0.15 =C2=B1 23%    +541.9%       0.99 =C2=B1  6%  perf-profile.cycles=
-pp.__schedule.schedule.schedule_timeout.unix_stream_read_generic.unix_stre=
am_recvmsg
      0.83 =C2=B1  9%     +37.8%       1.14 =C2=B1  8%  perf-profile.cycles=
-pp.__slab_alloc.__kmalloc_node_track_caller.__kmalloc_reserve.__alloc_skb.=
alloc_skb_with_frags
      0.87 =C2=B1 13%     +28.4%       1.12 =C2=B1  6%  perf-profile.cycles=
-pp.__slab_alloc.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.soc=
k_alloc_send_pskb
      1.02 =C2=B1  9%     +58.3%       1.62 =C2=B1  6%  perf-profile.cycles=
-pp.__slab_free.kmem_cache_free.kfree_skbmem.consume_skb.unix_stream_read_g=
eneric
     40.33 =C2=B1  0%      -9.0%      36.71 =C2=B1  1%  perf-profile.cycles=
-pp.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
     35.45 =C2=B1  0%     +23.0%      43.61 =C2=B1  1%  perf-profile.cycles=
-pp.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      1.44 =C2=B1 14%    +467.4%       8.19 =C2=B1  4%  perf-profile.cycles=
-pp.__wake_up_common.__wake_up_sync_key.sock_def_readable.unix_stream_sendm=
sg.sock_sendmsg
      1.55 =C2=B1  8%     -64.5%       0.55 =C2=B1 26%  perf-profile.cycles=
-pp.__wake_up_common.__wake_up_sync_key.unix_write_space.sock_wfree.unix_de=
struct_scm
      1.48 =C2=B1 15%    +461.4%       8.28 =C2=B1  4%  perf-profile.cycles=
-pp.__wake_up_sync_key.sock_def_readable.unix_stream_sendmsg.sock_sendmsg.s=
ock_write_iter
      1.56 =C2=B1  8%     -64.4%       0.55 =C2=B1 26%  perf-profile.cycles=
-pp.__wake_up_sync_key.unix_write_space.sock_wfree.unix_destruct_scm.skb_re=
lease_head_state
      2.40 =C2=B1  9%    +234.6%       8.01 =C2=B1  5%  perf-profile.cycles=
-pp.activate_task.ttwu_do_activate.try_to_wake_up.default_wake_function.aut=
oremove_wake_function
     12.42 =C2=B1  2%     -16.2%      10.40 =C2=B1  2%  perf-profile.cycles=
-pp.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_send=
msg.sock_write_iter
      1.40 =C2=B1 14%    +481.1%       8.13 =C2=B1  4%  perf-profile.cycles=
-pp.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.sock_def_r=
eadable.unix_stream_sendmsg
      1.54 =C2=B1  8%     -64.7%       0.54 =C2=B1 25%  perf-profile.cycles=
-pp.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.unix_write=
_space.sock_wfree
     14.73 =C2=B1  1%     -19.7%      11.84 =C2=B1  3%  perf-profile.cycles=
-pp.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.s=
ock_read_iter
      5.08 =C2=B1  4%     -10.8%       4.52 =C2=B1  5%  perf-profile.cycles=
-pp.copy_user_enhanced_fast_string.skb_copy_datagram_iter.unix_stream_read_=
actor.unix_stream_read_generic.unix_stream_recvmsg
      1.39 =C2=B1 14%    +484.9%       8.12 =C2=B1  4%  perf-profile.cycles=
-pp.default_wake_function.autoremove_wake_function.__wake_up_common.__wake_=
up_sync_key.sock_def_readable
      1.50 =C2=B1  8%     -65.2%       0.52 =C2=B1 26%  perf-profile.cycles=
-pp.default_wake_function.autoremove_wake_function.__wake_up_common.__wake_=
up_sync_key.unix_write_space
      1.52 =C2=B1  8%    +348.1%       6.82 =C2=B1  5%  perf-profile.cycles=
-pp.dump_trace.save_stack_trace_tsk.__account_scheduler_latency.enqueue_ent=
ity.enqueue_task_fair
      2.13 =C2=B1  9%    +258.1%       7.64 =C2=B1  5%  perf-profile.cycles=
-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_=
wake_up
      2.31 =C2=B1  9%    +242.2%       7.91 =C2=B1  5%  perf-profile.cycles=
-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.default=
_wake_function
      0.34 =C2=B1 21%    +275.6%       1.27 =C2=B1  8%  perf-profile.cycles=
-pp.entry_SYSCALL_64_after_swapgs
      0.14 =C2=B1 26%    +820.0%       1.26 =C2=B1  8%  perf-profile.cycles=
-pp.is_module_text_address.__kernel_text_address.print_context_stack.dump_t=
race.save_stack_trace_tsk
      2.07 =C2=B1  6%     +17.5%       2.44 =C2=B1  6%  perf-profile.cycles=
-pp.kfree.skb_free_head.skb_release_data.skb_release_all.consume_skb
      1.31 =C2=B1  8%    +374.7%       6.24 =C2=B1  6%  perf-profile.cycles=
-pp.print_context_stack.dump_trace.save_stack_trace_tsk.__account_scheduler=
_latency.enqueue_entity
      4.64 =C2=B1  3%     -48.3%       2.40 =C2=B1  7%  perf-profile.cycles=
-pp.rw_verify_area.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      3.73 =C2=B1  8%     -50.2%       1.86 =C2=B1  4%  perf-profile.cycles=
-pp.rw_verify_area.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      1.52 =C2=B1  8%    +348.2%       6.83 =C2=B1  5%  perf-profile.cycles=
-pp.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entity.enqueue=
_task_fair.activate_task
      0.17 =C2=B1 27%    +519.4%       1.04 =C2=B1  6%  perf-profile.cycles=
-pp.schedule.schedule_timeout.unix_stream_read_generic.unix_stream_recvmsg.=
sock_recvmsg
      0.18 =C2=B1 25%    +511.3%       1.08 =C2=B1  5%  perf-profile.cycles=
-pp.schedule_timeout.unix_stream_read_generic.unix_stream_recvmsg.sock_recv=
msg.sock_read_iter
      4.10 =C2=B1  4%     -49.5%       2.07 =C2=B1  7%  perf-profile.cycles=
-pp.security_file_permission.rw_verify_area.vfs_read.sys_read.entry_SYSCALL=
_64_fastpath
      3.07 =C2=B1 10%     -48.4%       1.58 =C2=B1  4%  perf-profile.cycles=
-pp.security_file_permission.rw_verify_area.vfs_write.sys_write.entry_SYSCA=
LL_64_fastpath
      0.79 =C2=B1 11%     +50.0%       1.19 =C2=B1  4%  perf-profile.cycles=
-pp.security_socket_sendmsg.sock_sendmsg.sock_write_iter.__vfs_write.vfs_wr=
ite
      2.68 =C2=B1  5%     -47.1%       1.42 =C2=B1  8%  perf-profile.cycles=
-pp.selinux_file_permission.security_file_permission.rw_verify_area.vfs_rea=
d.sys_read
      2.69 =C2=B1 10%     -49.8%       1.35 =C2=B1  6%  perf-profile.cycles=
-pp.selinux_file_permission.security_file_permission.rw_verify_area.vfs_wri=
te.sys_write
      0.53 =C2=B1 13%     +80.6%       0.95 =C2=B1  6%  perf-profile.cycles=
-pp.selinux_socket_sendmsg.security_socket_sendmsg.sock_sendmsg.sock_write_=
iter.__vfs_write
      2.62 =C2=B1  4%     -23.2%       2.01 =C2=B1  6%  perf-profile.cycles=
-pp.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_sendmsg.sock_write=
_iter.__vfs_write
      7.87 =C2=B1  3%     -25.0%       5.90 =C2=B1  3%  perf-profile.cycles=
-pp.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.=
unix_stream_recvmsg.sock_recvmsg
      2.11 =C2=B1  5%     +16.6%       2.46 =C2=B1  6%  perf-profile.cycles=
-pp.skb_free_head.skb_release_data.skb_release_all.consume_skb.unix_stream_=
read_generic
      0.67 =C2=B1  6%    +149.1%       1.66 =C2=B1  6%  perf-profile.cycles=
-pp.skb_queue_tail.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.__vfs_w=
rite
     11.04 =C2=B1  2%     -19.8%       8.86 =C2=B1  2%  perf-profile.cycles=
-pp.skb_release_all.consume_skb.unix_stream_read_generic.unix_stream_recvms=
g.sock_recvmsg
      6.24 =C2=B1  2%     -21.2%       4.91 =C2=B1  7%  perf-profile.cycles=
-pp.skb_release_data.skb_release_all.consume_skb.unix_stream_read_generic.u=
nix_stream_recvmsg
      2.04 =C2=B1  7%    +160.6%       5.30 =C2=B1  3%  perf-profile.cycles=
-pp.skb_set_owner_w.sock_alloc_send_pskb.unix_stream_sendmsg.sock_sendmsg.s=
ock_write_iter
      0.79 =C2=B1  6%     +84.9%       1.46 =C2=B1 10%  perf-profile.cycles=
-pp.skb_unlink.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.so=
ck_read_iter
      3.12 =C2=B1  8%    +220.4%      10.00 =C2=B1  4%  perf-profile.cycles=
-pp.sock_def_readable.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.__vf=
s_write
     39.40 =C2=B1  0%      -8.5%      36.07 =C2=B1  1%  perf-profile.cycles=
-pp.sock_read_iter.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
     33.54 =C2=B1  1%     +25.5%      42.09 =C2=B1  1%  perf-profile.cycles=
-pp.sock_sendmsg.sock_write_iter.__vfs_write.vfs_write.sys_write
     34.55 =C2=B1  1%     +24.5%      42.99 =C2=B1  1%  perf-profile.cycles=
-pp.sock_write_iter.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpa=
th
     50.49 =C2=B1  0%     -14.8%      42.99 =C2=B1  1%  perf-profile.cycles=
-pp.sys_read.entry_SYSCALL_64_fastpath
     45.34 =C2=B1  0%      +9.6%      49.69 =C2=B1  1%  perf-profile.cycles=
-pp.sys_write.entry_SYSCALL_64_fastpath
      2.88 =C2=B1  7%    +199.0%       8.62 =C2=B1  5%  perf-profile.cycles=
-pp.try_to_wake_up.default_wake_function.autoremove_wake_function.__wake_up=
_common.__wake_up_sync_key
      2.44 =C2=B1 10%    +232.3%       8.12 =C2=B1  4%  perf-profile.cycles=
-pp.ttwu_do_activate.constprop.86.try_to_wake_up.default_wake_function.auto=
remove_wake_function.__wake_up_common
      8.00 =C2=B1  3%     -24.9%       6.01 =C2=B1  3%  perf-profile.cycles=
-pp.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.soc=
k_recvmsg.sock_read_iter
     34.62 =C2=B1  0%      -9.2%      31.44 =C2=B1  2%  perf-profile.cycles=
-pp.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_ite=
r.__vfs_read
     30.80 =C2=B1  1%     +28.2%      39.49 =C2=B1  1%  perf-profile.cycles=
-pp.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.__vfs_write.vfs_write
      1.94 =C2=B1 10%     -26.1%       1.44 =C2=B1 16%  perf-profile.cycles=
-pp.unix_write_space.sock_wfree.unix_destruct_scm.skb_release_head_state.sk=
b_release_all
     47.80 =C2=B1  0%     -14.4%      40.90 =C2=B1  1%  perf-profile.cycles=
-pp.vfs_read.sys_read.entry_SYSCALL_64_fastpath
     42.32 =C2=B1  0%     +12.0%      47.39 =C2=B1  1%  perf-profile.cycles=
-pp.vfs_write.sys_write.entry_SYSCALL_64_fastpath

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lituya/mallo=
c1/will-it-scale

commit: =

  8025943c32f5de29b3fd548e917e24424297ca73
  0aefb957de5f2a1d9467126114146b6c793cf180

8025943c32f5de29 0aefb957de5f2a1d9467126114 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    211040 =C2=B1  0%     -36.6%     133899 =C2=B1  2%  will-it-scale.per_p=
rocess_ops
    100225 =C2=B1  0%     +25.4%     125723 =C2=B1  2%  will-it-scale.per_t=
hread_ops
      0.28 =C2=B1  0%     -76.9%       0.06 =C2=B1  0%  will-it-scale.scala=
bility
    304.14 =C2=B1  0%     -25.0%     228.07 =C2=B1  0%  will-it-scale.time.=
elapsed_time
    304.14 =C2=B1  0%     -25.0%     228.07 =C2=B1  0%  will-it-scale.time.=
elapsed_time.max
    500.75 =C2=B1  5%  +1.7e+05%     869953 =C2=B1 15%  will-it-scale.time.=
involuntary_context_switches
     66.00 =C2=B1  1%     -25.8%      49.00 =C2=B1  0%  will-it-scale.time.=
percent_of_cpu_this_job_got
    194.65 =C2=B1  1%     -45.4%     106.29 =C2=B1  0%  will-it-scale.time.=
system_time
    322.40 =C2=B1  0%     -23.8%     245.80 =C2=B1  0%  uptime.boot
      3537 =C2=B1  0%     -99.7%      11.70 =C2=B1  0%  uptime.idle
     52213 =C2=B1  5%     -93.3%       3521 =C2=B1  5%  softirqs.RCU
     85543 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  softirqs.SCHED
    821398 =C2=B1  0%     -85.1%     122622 =C2=B1  0%  softirqs.TIMER
      5.00 =C2=B1  0%     +35.0%       6.75 =C2=B1  6%  vmstat.procs.r
     47456 =C2=B1  7%     -13.1%      41237 =C2=B1  7%  vmstat.system.cs
     12929 =C2=B1 15%     -91.6%       1082 =C2=B1  0%  vmstat.system.in
    304.14 =C2=B1  0%     -25.0%     228.07 =C2=B1  0%  time.elapsed_time
    304.14 =C2=B1  0%     -25.0%     228.07 =C2=B1  0%  time.elapsed_time.m=
ax
    500.75 =C2=B1  5%  +1.7e+05%     869953 =C2=B1 15%  time.involuntary_co=
ntext_switches
     66.00 =C2=B1  1%     -25.8%      49.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
    194.65 =C2=B1  1%     -45.4%     106.29 =C2=B1  0%  time.system_time
      7.76 =C2=B1  2%     -20.3%       6.19 =C2=B1  5%  time.user_time
     29486 =C2=B1  2%     -19.8%      23651 =C2=B1  3%  meminfo.Active(anon)
   1176564 =C2=B1  0%     -12.0%    1035437 =C2=B1  0%  meminfo.Committed_AS
     81756 =C2=B1 10%     -50.1%      40796 =C2=B1  5%  meminfo.DirectMap4k
     39768 =C2=B1  0%     -10.0%      35810 =C2=B1  0%  meminfo.SReclaimable
     53921 =C2=B1  0%     -28.0%      38819 =C2=B1  0%  meminfo.SUnreclaim
     15076 =C2=B1  0%     -35.4%       9743 =C2=B1  0%  meminfo.Shmem
     93691 =C2=B1  0%     -20.3%      74630 =C2=B1  0%  meminfo.Slab
     32.88 =C2=B1  0%    +203.3%      99.72 =C2=B1  0%  turbostat.%Busy
      1085 =C2=B1  0%    +211.6%       3382 =C2=B1  2%  turbostat.Avg_MHz
     40.41 =C2=B1  1%     -99.7%       0.13 =C2=B1102%  turbostat.CPU%c1
      3.46 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  turbostat.CPU%c3
     23.25 =C2=B1  0%     -98.7%       0.30 =C2=B1  0%  turbostat.CPU%c6
     56.48 =C2=B1  0%     -39.7%      34.08 =C2=B1  7%  turbostat.PkgWatt
      0.94 =C2=B1  1%     -66.8%       0.31 =C2=B1  2%  turbostat.RAMWatt
 1.304e+08 =C2=B1 34%    -100.0%       6.50 =C2=B1155%  cpuidle.C1-HSW.time
   2435313 =C2=B1 47%    -100.0%       0.50 =C2=B1100%  cpuidle.C1-HSW.usage
  61520601 =C2=B1 22%    -100.0%       1015 =C2=B1 39%  cpuidle.C1E-HSW.time
    898875 =C2=B1 19%    -100.0%      11.25 =C2=B1 45%  cpuidle.C1E-HSW.usa=
ge
 6.752e+08 =C2=B1  3%    -100.0%     526.25 =C2=B1 15%  cpuidle.C3-HSW.time
   3378988 =C2=B1  1%    -100.0%       6.00 =C2=B1 42%  cpuidle.C3-HSW.usage
 2.412e+09 =C2=B1  1%    -100.0%     639581 =C2=B1 12%  cpuidle.C6-HSW.time
   1953772 =C2=B1  3%    -100.0%      28.25 =C2=B1 15%  cpuidle.C6-HSW.usage
    233.50 =C2=B1 77%     -99.8%       0.50 =C2=B1173%  cpuidle.POLL.usage
  46885311 =C2=B1116%     -96.1%    1842699 =C2=B1173%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      2.75 =C2=B1 30%  +4.2e+07%    1153671 =C2=B1 12%  latency_stats.hits.=
futex_wait_queue_me.futex_wait.do_futex.SyS_futex.entry_SYSCALL_64_fastpath
    110243 =C2=B1  4%     -74.2%      28405 =C2=B1  2%  latency_stats.hits.=
pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      9797 =C2=B1 49%     -66.8%       3249 =C2=B1  5%  latency_stats.max.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
      6891 =C2=B1 81%     -50.5%       3413 =C2=B1  5%  latency_stats.max.c=
all_rwsem_down_write_failed.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.entry_SYS=
CALL_64_fastpath
      9965 =C2=B1 48%     -64.8%       3507 =C2=B1  6%  latency_stats.max.c=
all_rwsem_down_write_failed.vm_munmap.SyS_munmap.entry_SYSCALL_64_fastpath
  50113913 =C2=B1105%     -96.3%    1842699 =C2=B1173%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
 5.309e+08 =C2=B1  0%     -76.8%  1.231e+08 =C2=B1  3%  latency_stats.sum.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
     24.25 =C2=B1 25%  +9.1e+08%  2.211e+08 =C2=B1  7%  latency_stats.sum.f=
utex_wait_queue_me.futex_wait.do_futex.SyS_futex.entry_SYSCALL_64_fastpath
  53087121 =C2=B1 96%     -96.5%    1842699 =C2=B1173%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
    995734 =C2=B1  1%    +597.0%    6940437 =C2=B1  1%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      7369 =C2=B1  2%     -19.8%       5913 =C2=B1  3%  proc-vmstat.nr_acti=
ve_anon
     94.25 =C2=B1 17%     -82.0%      17.00 =C2=B1  0%  proc-vmstat.nr_dirt=
ied
      3768 =C2=B1  0%     -35.4%       2435 =C2=B1  0%  proc-vmstat.nr_shmem
      9941 =C2=B1  0%     -10.0%       8952 =C2=B1  0%  proc-vmstat.nr_slab=
_reclaimable
     13480 =C2=B1  0%     -28.0%       9704 =C2=B1  0%  proc-vmstat.nr_slab=
_unreclaimable
 4.611e+08 =C2=B1  0%     -74.9%  1.158e+08 =C2=B1  3%  proc-vmstat.numa_hit
 4.611e+08 =C2=B1  0%     -74.9%  1.158e+08 =C2=B1  3%  proc-vmstat.numa_lo=
cal
      3234 =C2=B1  0%     -71.4%     923.75 =C2=B1  5%  proc-vmstat.pgactiv=
ate
 1.142e+08 =C2=B1  1%     -46.6%   60957798 =C2=B1  5%  proc-vmstat.pgalloc=
_dma32
 4.937e+08 =C2=B1  0%     -60.4%  1.954e+08 =C2=B1  3%  proc-vmstat.pgalloc=
_normal
 2.314e+08 =C2=B1  0%     -74.5%   59076648 =C2=B1  3%  proc-vmstat.pgfault
 6.079e+08 =C2=B1  0%     -57.8%  2.564e+08 =C2=B1  3%  proc-vmstat.pgfree
      1.56 =C2=B1  2%    +141.0%       3.77 =C2=B1  3%  perf-profile.cycles=
-pp.___might_sleep.unmap_page_range.unmap_single_vma.unmap_vmas.unmap_region
      0.83 =C2=B1  6%     +98.5%       1.65 =C2=B1  4%  perf-profile.cycles=
-pp.___might_sleep.unmap_single_vma.unmap_vmas.unmap_region.do_munmap
      2.83 =C2=B1  3%     +56.7%       4.43 =C2=B1  2%  perf-profile.cycles=
-pp.__alloc_pages_nodemask.alloc_pages_current.pte_alloc_one.__pte_alloc.ha=
ndle_mm_fault
      2.74 =C2=B1  2%     +64.4%       4.51 =C2=B1  1%  perf-profile.cycles=
-pp.__alloc_pages_nodemask.alloc_pages_vma.handle_mm_fault.__do_page_fault.=
do_page_fault
     12.21 =C2=B1  2%     +72.7%      21.07 =C2=B1  2%  perf-profile.cycles=
-pp.__do_page_fault.do_page_fault.page_fault
      1.10 =C2=B1  5%     -29.5%       0.78 =C2=B1 10%  perf-profile.cycles=
-pp.__pagevec_lru_add_fn.pagevec_lru_move_fn.lru_add_drain_cpu.lru_add_drai=
n.unmap_region
      1.17 =C2=B1  3%     -33.8%       0.77 =C2=B1  9%  perf-profile.cycles=
-pp.__percpu_counter_add.__vm_enough_memory.security_vm_enough_memory_mm.mm=
ap_region.do_mmap
      1.57 =C2=B1  5%     -38.8%       0.96 =C2=B1  8%  perf-profile.cycles=
-pp.__percpu_counter_add.do_munmap.vm_munmap.sys_munmap.entry_SYSCALL_64_fa=
stpath
      3.68 =C2=B1  3%     +72.2%       6.33 =C2=B1  2%  perf-profile.cycles=
-pp.__pte_alloc.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      1.46 =C2=B1  3%     -35.9%       0.93 =C2=B1  7%  perf-profile.cycles=
-pp.__vm_enough_memory.security_vm_enough_memory_mm.mmap_region.do_mmap.vm_=
mmap_pgoff
      0.78 =C2=B1  4%     +73.6%       1.35 =C2=B1 13%  perf-profile.cycles=
-pp.__vma_link_rb.vma_link.mmap_region.do_mmap.vm_mmap_pgoff
      0.26 =C2=B1  4%    +294.1%       1.00 =C2=B1  4%  perf-profile.cycles=
-pp._raw_spin_lock.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
     13.75 =C2=B1  3%     -97.3%       0.38 =C2=B1 12%  perf-profile.cycles=
-pp._raw_spin_lock_irqsave.pagevec_lru_move_fn.lru_add_drain_cpu.lru_add_dr=
ain.unmap_region
     12.93 =C2=B1  2%     -96.3%       0.47 =C2=B1  6%  perf-profile.cycles=
-pp._raw_spin_lock_irqsave.release_pages.free_pages_and_swap_cache.tlb_flus=
h_mmu_free.tlb_finish_mmu
      3.06 =C2=B1  3%     +60.8%       4.91 =C2=B1  4%  perf-profile.cycles=
-pp.alloc_pages_current.pte_alloc_one.__pte_alloc.handle_mm_fault.__do_page=
_fault
      2.98 =C2=B1  2%     +68.5%       5.02 =C2=B1  1%  perf-profile.cycles=
-pp.alloc_pages_vma.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      2.05 =C2=B1  3%     +44.7%       2.97 =C2=B1  3%  perf-profile.cycles=
-pp.anon_vma_prepare.handle_mm_fault.__do_page_fault.do_page_fault.page_fau=
lt
      2.55 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.call_cpuidle.cpu_startup_entry.rest_init.start_kernel.x86_64_start_rese=
rvations
      8.12 =C2=B1 24%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.call_cpuidle.cpu_startup_entry.start_secondary
      0.94 =C2=B1  5%     +84.8%       1.73 =C2=B1  5%  perf-profile.cycles=
-pp.clear_page_c_e.__alloc_pages_nodemask.alloc_pages_current.pte_alloc_one=
.__pte_alloc
      0.93 =C2=B1  4%     +97.6%       1.84 =C2=B1  4%  perf-profile.cycles=
-pp.clear_page_c_e.__alloc_pages_nodemask.alloc_pages_vma.handle_mm_fault._=
_do_page_fault
      2.56 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.cpu_startup_entry.rest_init.start_kernel.x86_64_start_reservations.x86_=
64_start_kernel
      8.12 =C2=B1 24%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.cpu_startup_entry.start_secondary
      2.55 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.cpuidle_enter.call_cpuidle.cpu_startup_entry.rest_init.start_kernel
      8.12 =C2=B1 24%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
      2.53 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry.rest_i=
nit
      8.12 =C2=B1 24%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_=
secondary
      9.78 =C2=B1  2%     +72.3%      16.85 =C2=B1  0%  perf-profile.cycles=
-pp.do_mmap.vm_mmap_pgoff.sys_mmap_pgoff.sys_mmap.entry_SYSCALL_64_fastpath
     62.39 =C2=B1  1%     -16.7%      51.97 =C2=B1  1%  perf-profile.cycles=
-pp.do_munmap.vm_munmap.sys_munmap.entry_SYSCALL_64_fastpath
     12.30 =C2=B1  2%     +72.7%      21.25 =C2=B1  2%  perf-profile.cycles=
-pp.do_page_fault.page_fault
      1.08 =C2=B1  6%     +79.7%       1.95 =C2=B1  4%  perf-profile.cycles=
-pp.flush_tlb_mm_range.tlb_flush_mmu_tlbonly.tlb_finish_mmu.unmap_region.do=
_munmap
      1.56 =C2=B1  1%     +37.6%       2.15 =C2=B1  6%  perf-profile.cycles=
-pp.free_hot_cold_page.free_hot_cold_page_list.release_pages.free_pages_and=
_swap_cache.tlb_flush_mmu_free
      1.85 =C2=B1  2%     +32.6%       2.45 =C2=B1  6%  perf-profile.cycles=
-pp.free_hot_cold_page_list.release_pages.free_pages_and_swap_cache.tlb_flu=
sh_mmu_free.tlb_finish_mmu
     21.02 =C2=B1  1%     -69.9%       6.32 =C2=B1  3%  perf-profile.cycles=
-pp.free_pages_and_swap_cache.tlb_flush_mmu_free.tlb_finish_mmu.unmap_regio=
n.do_munmap
      3.13 =C2=B1  4%    +102.9%       6.35 =C2=B1  2%  perf-profile.cycles=
-pp.free_pgd_range.free_pgtables.unmap_region.do_munmap.vm_munmap
      5.17 =C2=B1  3%     +83.5%       9.48 =C2=B1  2%  perf-profile.cycles=
-pp.free_pgtables.unmap_region.do_munmap.vm_munmap.sys_munmap
      1.41 =C2=B1  5%     +32.4%       1.87 =C2=B1  7%  perf-profile.cycles=
-pp.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_current.pte_a=
lloc_one.__pte_alloc
      1.42 =C2=B1  2%     +32.5%       1.89 =C2=B1  4%  perf-profile.cycles=
-pp.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_vma.handle_mm=
_fault.__do_page_fault
      0.54 =C2=B1  7%     +82.0%       0.99 =C2=B1  9%  perf-profile.cycles=
-pp.get_unmapped_area.do_mmap.vm_mmap_pgoff.sys_mmap_pgoff.sys_mmap
     11.07 =C2=B1  2%     +72.3%      19.07 =C2=B1  1%  perf-profile.cycles=
-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
     10.36 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_e=
ntry
     18.55 =C2=B1  2%     -85.3%       2.73 =C2=B1  7%  perf-profile.cycles=
-pp.lru_add_drain.unmap_region.do_munmap.vm_munmap.sys_munmap
     18.52 =C2=B1  2%     -85.4%       2.69 =C2=B1  6%  perf-profile.cycles=
-pp.lru_add_drain_cpu.lru_add_drain.unmap_region.do_munmap.vm_munmap
      1.04 =C2=B1  2%     -95.4%       0.05 =C2=B1 77%  perf-profile.cycles=
-pp.mem_cgroup_page_lruvec.release_pages.free_pages_and_swap_cache.tlb_flus=
h_mmu_free.tlb_finish_mmu
      8.91 =C2=B1  1%     +70.6%      15.19 =C2=B1  0%  perf-profile.cycles=
-pp.mmap_region.do_mmap.vm_mmap_pgoff.sys_mmap_pgoff.sys_mmap
      0.53 =C2=B1  8%     +91.5%       1.02 =C2=B1 13%  perf-profile.cycles=
-pp.native_flush_tlb.flush_tlb_mm_range.tlb_flush_mmu_tlbonly.tlb_finish_mm=
u.unmap_region
      1.24 =C2=B1 41%    +162.7%       3.26 =C2=B1 12%  perf-profile.cycles=
-pp.native_irq_return_iret
     12.63 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.pagevec_lru_mov=
e_fn.lru_add_drain_cpu.lru_add_drain
     11.82 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.release_pages.f=
ree_pages_and_swap_cache.tlb_flush_mmu_free
     12.35 =C2=B1  2%     +73.0%      21.36 =C2=B1  2%  perf-profile.cycles=
-pp.page_fault
     18.38 =C2=B1  2%     -87.6%       2.29 =C2=B1  6%  perf-profile.cycles=
-pp.pagevec_lru_move_fn.lru_add_drain_cpu.lru_add_drain.unmap_region.do_mun=
map
      3.59 =C2=B1  2%     +96.6%       7.06 =C2=B1  3%  perf-profile.cycles=
-pp.perf_event_aux.perf_event_mmap.mmap_region.do_mmap.vm_mmap_pgoff
      1.03 =C2=B1  2%     +97.3%       2.02 =C2=B1  7%  perf-profile.cycles=
-pp.perf_event_aux_ctx.perf_event_aux.perf_event_mmap.mmap_region.do_mmap
      4.47 =C2=B1  2%     +90.0%       8.50 =C2=B1  0%  perf-profile.cycles=
-pp.perf_event_mmap.mmap_region.do_mmap.vm_mmap_pgoff.sys_mmap_pgoff
      3.24 =C2=B1  3%     +65.4%       5.36 =C2=B1  3%  perf-profile.cycles=
-pp.pte_alloc_one.__pte_alloc.handle_mm_fault.__do_page_fault.do_page_fault
     20.11 =C2=B1  2%     -71.1%       5.81 =C2=B1  4%  perf-profile.cycles=
-pp.release_pages.free_pages_and_swap_cache.tlb_flush_mmu_free.tlb_finish_m=
mu.unmap_region
      2.59 =C2=B1  2%     -83.2%       0.43 =C2=B1 17%  perf-profile.cycles=
-pp.release_pages.pagevec_lru_move_fn.lru_add_drain_cpu.lru_add_drain.unmap=
_region
      2.56 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel
      2.56 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.start_kernel.x86_64_start_reservations.x86_64_start_kernel
      8.12 =C2=B1 24%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.start_secondary
     10.64 =C2=B1  2%     +72.7%      18.37 =C2=B1  0%  perf-profile.cycles=
-pp.sys_mmap.entry_SYSCALL_64_fastpath
     10.63 =C2=B1  2%     +72.7%      18.36 =C2=B1  0%  perf-profile.cycles=
-pp.sys_mmap_pgoff.sys_mmap.entry_SYSCALL_64_fastpath
     63.09 =C2=B1  1%     -15.8%      53.15 =C2=B1  1%  perf-profile.cycles=
-pp.sys_munmap.entry_SYSCALL_64_fastpath
     22.54 =C2=B1  2%     -59.7%       9.08 =C2=B1  3%  perf-profile.cycles=
-pp.tlb_finish_mmu.unmap_region.do_munmap.vm_munmap.sys_munmap
     21.11 =C2=B1  1%     -69.3%       6.48 =C2=B1  4%  perf-profile.cycles=
-pp.tlb_flush_mmu_free.tlb_finish_mmu.unmap_region.do_munmap.vm_munmap
      1.33 =C2=B1  6%     +80.5%       2.41 =C2=B1  4%  perf-profile.cycles=
-pp.tlb_flush_mmu_tlbonly.tlb_finish_mmu.unmap_region.do_munmap.vm_munmap
      1.82 =C2=B1  4%     +51.0%       2.75 =C2=B1  4%  perf-profile.cycles=
-pp.unlink_anon_vmas.free_pgtables.unmap_region.do_munmap.vm_munmap
     10.85 =C2=B1  2%    +110.0%      22.78 =C2=B1  0%  perf-profile.cycles=
-pp.unmap_page_range.unmap_single_vma.unmap_vmas.unmap_region.do_munmap
     58.91 =C2=B1  1%     -19.6%      47.39 =C2=B1  1%  perf-profile.cycles=
-pp.unmap_region.do_munmap.vm_munmap.sys_munmap.entry_SYSCALL_64_fastpath
     12.35 =C2=B1  1%    +107.2%      25.59 =C2=B1  1%  perf-profile.cycles=
-pp.unmap_single_vma.unmap_vmas.unmap_region.do_munmap.vm_munmap
     12.43 =C2=B1  2%    +106.9%      25.72 =C2=B1  1%  perf-profile.cycles=
-pp.unmap_vmas.unmap_region.do_munmap.vm_munmap.sys_munmap
     10.52 =C2=B1  2%     +72.8%      18.17 =C2=B1  0%  perf-profile.cycles=
-pp.vm_mmap_pgoff.sys_mmap_pgoff.sys_mmap.entry_SYSCALL_64_fastpath
     62.92 =C2=B1  1%     -15.9%      52.90 =C2=B1  1%  perf-profile.cycles=
-pp.vm_munmap.sys_munmap.entry_SYSCALL_64_fastpath
      0.47 =C2=B1  4%     +78.5%       0.83 =C2=B1 14%  perf-profile.cycles=
-pp.vma_compute_subtree_gap.__vma_link_rb.vma_link.mmap_region.do_mmap
      0.97 =C2=B1  2%     +69.8%       1.64 =C2=B1  9%  perf-profile.cycles=
-pp.vma_link.mmap_region.do_mmap.vm_mmap_pgoff.sys_mmap_pgoff
      2.56 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.x86_64_start_kernel
      2.56 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.x86_64_start_reservations.x86_64_start_kernel
    624.00 =C2=B1  0%     -87.5%      78.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.active_objs
    624.00 =C2=B1  0%     -87.5%      78.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.num_objs
    882.00 =C2=B1  2%     -51.0%     432.00 =C2=B1  0%  slabinfo.RAW.active=
_objs
    882.00 =C2=B1  2%     -51.0%     432.00 =C2=B1  0%  slabinfo.RAW.num_ob=
js
    170.00 =C2=B1 14%     -80.0%      34.00 =C2=B1  0%  slabinfo.UDP.active=
_objs
    170.00 =C2=B1 14%     -80.0%      34.00 =C2=B1  0%  slabinfo.UDP.num_ob=
js
      3824 =C2=B1  3%     -67.1%       1260 =C2=B1  0%  slabinfo.anon_vma.a=
ctive_objs
      3824 =C2=B1  3%     -67.1%       1260 =C2=B1  0%  slabinfo.anon_vma.n=
um_objs
    602.25 =C2=B1 10%     -87.9%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.active_objs
    602.25 =C2=B1 10%     -87.9%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.num_objs
    253.50 =C2=B1  7%     -84.6%      39.00 =C2=B1  0%  slabinfo.bdev_cache=
.active_objs
    253.50 =C2=B1  7%     -84.6%      39.00 =C2=B1  0%  slabinfo.bdev_cache=
.num_objs
    539.00 =C2=B1 12%     -91.8%      44.00 =C2=B1  0%  slabinfo.blkdev_req=
uests.active_objs
    539.00 =C2=B1 12%     -91.8%      44.00 =C2=B1  0%  slabinfo.blkdev_req=
uests.num_objs
     46484 =C2=B1  0%      -9.3%      42166 =C2=B1  0%  slabinfo.dentry.act=
ive_objs
      1111 =C2=B1  0%      -9.8%       1003 =C2=B1  0%  slabinfo.dentry.act=
ive_slabs
     46716 =C2=B1  0%      -9.7%      42166 =C2=B1  0%  slabinfo.dentry.num=
_objs
      1111 =C2=B1  0%      -9.8%       1003 =C2=B1  0%  slabinfo.dentry.num=
_slabs
    428.50 =C2=B1  6%     -90.9%      39.00 =C2=B1  0%  slabinfo.file_lock_=
cache.active_objs
    428.50 =C2=B1  6%     -90.9%      39.00 =C2=B1  0%  slabinfo.file_lock_=
cache.num_objs
    874.00 =C2=B1  0%     -70.4%     259.00 =C2=B1  0%  slabinfo.files_cach=
e.active_objs
    874.00 =C2=B1  0%     -70.4%     259.00 =C2=B1  0%  slabinfo.files_cach=
e.num_objs
      3803 =C2=B1  2%      -8.4%       3485 =C2=B1  0%  slabinfo.ftrace_eve=
nt_field.active_objs
      3803 =C2=B1  2%      -8.4%       3485 =C2=B1  0%  slabinfo.ftrace_eve=
nt_field.num_objs
    735.00 =C2=B1  1%     -34.7%     480.00 =C2=B1  0%  slabinfo.idr_layer_=
cache.active_objs
    735.00 =C2=B1  1%     -34.7%     480.00 =C2=B1  0%  slabinfo.idr_layer_=
cache.num_objs
     42228 =C2=B1  0%     -10.1%      37944 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.active_objs
     42228 =C2=B1  0%     -10.1%      37944 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.num_objs
      1434 =C2=B1  1%     -45.5%     781.75 =C2=B1  0%  slabinfo.kmalloc-10=
24.active_objs
      1434 =C2=B1  1%     -42.0%     832.00 =C2=B1  0%  slabinfo.kmalloc-10=
24.num_objs
      3135 =C2=B1  3%     -53.1%       1471 =C2=B1  0%  slabinfo.kmalloc-12=
8.active_objs
      3135 =C2=B1  3%     -53.1%       1471 =C2=B1  0%  slabinfo.kmalloc-12=
8.num_objs
      9783 =C2=B1  0%     -24.1%       7424 =C2=B1  0%  slabinfo.kmalloc-16=
.active_objs
      9783 =C2=B1  0%     -24.1%       7424 =C2=B1  0%  slabinfo.kmalloc-16=
.num_objs
      6059 =C2=B1  2%     -36.3%       3859 =C2=B1  0%  slabinfo.kmalloc-19=
2.active_objs
      6479 =C2=B1  2%     -34.3%       4259 =C2=B1  0%  slabinfo.kmalloc-19=
2.num_objs
      2100 =C2=B1  1%     -36.3%       1337 =C2=B1  0%  slabinfo.kmalloc-20=
48.active_objs
      2220 =C2=B1  1%     -34.5%       1454 =C2=B1  0%  slabinfo.kmalloc-20=
48.num_objs
      6528 =C2=B1  3%     -71.2%       1879 =C2=B1  2%  slabinfo.kmalloc-25=
6.active_objs
      7083 =C2=B1  2%     -54.8%       3200 =C2=B1  3%  slabinfo.kmalloc-25=
6.num_objs
     22970 =C2=B1  4%     -14.2%      19710 =C2=B1  0%  slabinfo.kmalloc-32=
.active_objs
     22970 =C2=B1  4%     -14.2%      19710 =C2=B1  0%  slabinfo.kmalloc-32=
.num_objs
    364.75 =C2=B1  0%     -28.5%     260.75 =C2=B1  0%  slabinfo.kmalloc-40=
96.active_objs
    386.25 =C2=B1  0%     -28.3%     277.00 =C2=B1  1%  slabinfo.kmalloc-40=
96.num_objs
      8302 =C2=B1  5%     -47.4%       4369 =C2=B1  2%  slabinfo.kmalloc-51=
2.active_objs
      8526 =C2=B1  4%     -43.1%       4848 =C2=B1  4%  slabinfo.kmalloc-51=
2.num_objs
     36996 =C2=B1  1%     -17.7%      30430 =C2=B1  0%  slabinfo.kmalloc-64=
.active_objs
    577.50 =C2=B1  1%     -17.6%     476.00 =C2=B1  0%  slabinfo.kmalloc-64=
.active_slabs
     36996 =C2=B1  1%     -17.6%      30494 =C2=B1  0%  slabinfo.kmalloc-64=
.num_objs
    577.50 =C2=B1  1%     -17.6%     476.00 =C2=B1  0%  slabinfo.kmalloc-64=
.num_slabs
     10112 =C2=B1  4%     -64.6%       3584 =C2=B1  0%  slabinfo.kmalloc-8.=
active_objs
     10112 =C2=B1  4%     -64.6%       3584 =C2=B1  0%  slabinfo.kmalloc-8.=
num_objs
      3729 =C2=B1  2%     -58.3%       1554 =C2=B1  0%  slabinfo.kmalloc-96=
.active_objs
      3729 =C2=B1  2%     -58.3%       1554 =C2=B1  0%  slabinfo.kmalloc-96=
.num_objs
    240.00 =C2=B1 11%     -46.7%     128.00 =C2=B1  0%  slabinfo.kmem_cache=
.active_objs
    240.00 =C2=B1 11%     -46.7%     128.00 =C2=B1  0%  slabinfo.kmem_cache=
.num_objs
    240.00 =C2=B1 11%     -46.7%     128.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.active_objs
    240.00 =C2=B1 11%     -46.7%     128.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.num_objs
    301.75 =C2=B1  2%     -68.2%      96.00 =C2=B1  0%  slabinfo.mm_struct.=
active_objs
    301.75 =C2=B1  2%     -68.2%      96.00 =C2=B1  0%  slabinfo.mm_struct.=
num_objs
    609.00 =C2=B1  5%     -86.2%      84.00 =C2=B1  0%  slabinfo.mnt_cache.=
active_objs
    609.00 =C2=B1  5%     -86.2%      84.00 =C2=B1  0%  slabinfo.mnt_cache.=
num_objs
      3772 =C2=B1  2%     -44.9%       2080 =C2=B1  0%  slabinfo.proc_inode=
_cache.active_objs
      3775 =C2=B1  2%     -44.9%       2080 =C2=B1  0%  slabinfo.proc_inode=
_cache.num_objs
      8496 =C2=B1  0%      -9.7%       7672 =C2=B1  0%  slabinfo.radix_tree=
_node.active_objs
      8496 =C2=B1  0%      -9.7%       7672 =C2=B1  0%  slabinfo.radix_tree=
_node.num_objs
      1579 =C2=B1  1%     -31.8%       1078 =C2=B1  0%  slabinfo.shmem_inod=
e_cache.active_objs
      1579 =C2=B1  1%     -31.8%       1078 =C2=B1  0%  slabinfo.shmem_inod=
e_cache.num_objs
    635.50 =C2=B1  1%     -34.9%     414.00 =C2=B1  0%  slabinfo.sighand_ca=
che.active_objs
    635.50 =C2=B1  1%     -34.9%     414.00 =C2=B1  0%  slabinfo.sighand_ca=
che.num_objs
      1009 =C2=B1  2%     -43.6%     570.00 =C2=B1  0%  slabinfo.signal_cac=
he.active_objs
      1009 =C2=B1  2%     -43.6%     570.00 =C2=B1  0%  slabinfo.signal_cac=
he.num_objs
    816.00 =C2=B1  0%     -93.8%      51.00 =C2=B1  0%  slabinfo.sigqueue.a=
ctive_objs
    816.00 =C2=B1  0%     -93.8%      51.00 =C2=B1  0%  slabinfo.sigqueue.n=
um_objs
      1249 =C2=B1  2%     -55.1%     561.00 =C2=B1  0%  slabinfo.sock_inode=
_cache.active_objs
      1249 =C2=B1  2%     -55.1%     561.00 =C2=B1  0%  slabinfo.sock_inode=
_cache.num_objs
      2081 =C2=B1  3%     -16.0%       1748 =C2=B1  0%  slabinfo.trace_even=
t_file.active_objs
      2081 =C2=B1  3%     -16.0%       1748 =C2=B1  0%  slabinfo.trace_even=
t_file.num_objs
      8559 =C2=B1  5%     -72.1%       2387 =C2=B1  0%  slabinfo.vm_area_st=
ruct.active_objs
    194.25 =C2=B1  5%     -71.3%      55.75 =C2=B1  0%  slabinfo.vm_area_st=
ruct.active_slabs
      8568 =C2=B1  5%     -71.0%       2482 =C2=B1  0%  slabinfo.vm_area_st=
ruct.num_objs
    194.25 =C2=B1  5%     -71.3%      55.75 =C2=B1  0%  slabinfo.vm_area_st=
ruct.num_slabs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/testtime:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-wsx02/sh=
ared_memory/aim9/300s

commit: =

  8025943c32f5de29b3fd548e917e24424297ca73
  0aefb957de5f2a1d9467126114146b6c793cf180

8025943c32f5de29 0aefb957de5f2a1d9467126114 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    945356 =C2=B1  0%     -12.4%     827988 =C2=B1  4%  aim9.shared_memory.=
ops_per_sec
    387.75 =C2=B1  0%  +26660.6%     103764 =C2=B1  0%  aim9.time.involunta=
ry_context_switches
   2837238 =C2=B1  0%     -12.4%    2485141 =C2=B1  4%  aim9.time.minor_pag=
e_faults
     99.00 =C2=B1  0%      -3.0%      96.00 =C2=B1  0%  aim9.time.percent_o=
f_cpu_this_job_got
    259.94 =C2=B1  0%      -3.6%     250.69 =C2=B1  0%  aim9.time.system_ti=
me
     26895 =C2=B1  1%     -99.9%      19.16 =C2=B1 26%  uptime.idle
    387.75 =C2=B1  0%  +26660.6%     103764 =C2=B1  0%  time.involuntary_co=
ntext_switches
   2837238 =C2=B1  0%     -12.4%    2485141 =C2=B1  4%  time.minor_page_fau=
lts
     77943 =C2=B1  2%     -66.7%      25962 =C2=B1  0%  softirqs.RCU
    147092 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  softirqs.SCHED
    651218 =C2=B1  0%     -74.7%     164897 =C2=B1  0%  softirqs.TIMER
    647512 =C2=B1  0%     -13.3%     561279 =C2=B1  0%  vmstat.memory.cache
      3707 =C2=B1  1%     +15.6%       4285 =C2=B1  0%  vmstat.system.cs
      2015 =C2=B1  0%     -29.8%       1415 =C2=B1  0%  vmstat.system.in
      0.00 =C2=B1 -1%      +Inf%    1626990 =C2=B1100%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%    1626990 =C2=B1100%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      4043 =C2=B1 26%    +794.1%      36152 =C2=B1 14%  latency_stats.sum.e=
p_poll.SyS_epoll_wait.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%    1626990 =C2=B1100%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
   6889764 =C2=B1  1%    +200.1%   20678450 =C2=B1  2%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     12329 =C2=B1  4%     -99.5%      63.25 =C2=B1  3%  latency_stats.sum.p=
ipe_wait.pipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpa=
th
      1.45 =C2=B1  0%   +6805.9%      99.96 =C2=B1  0%  turbostat.%Busy
     38.00 =C2=B1  0%   +6875.0%       2650 =C2=B1  4%  turbostat.Avg_MHz
      1.84 =C2=B1  0%     -96.7%       0.06 =C2=B1-1666%  turbostat.CPU%c1
      0.56 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  turbostat.CPU%c3
     96.15 =C2=B1  0%    -100.0%       0.03 =C2=B1141%  turbostat.CPU%c6
      0.20 =C2=B1 14%     -84.8%       0.03 =C2=B1141%  turbostat.Pkg%pc3
    110688 =C2=B1  7%     -38.6%      67990 =C2=B1  0%  meminfo.Committed_AS
   6096896 =C2=B1  0%     -24.4%    4606976 =C2=B1 11%  meminfo.DirectMap2M
    116984 =C2=B1  5%     -70.9%      34040 =C2=B1  5%  meminfo.DirectMap4k
     15057 =C2=B1  0%     -16.7%      12545 =C2=B1  0%  meminfo.KernelStack
     52369 =C2=B1  0%     -27.7%      37856 =C2=B1  0%  meminfo.SReclaimable
    110068 =C2=B1  1%     -64.1%      39523 =C2=B1  0%  meminfo.SUnreclaim
    162438 =C2=B1  1%     -52.4%      77379 =C2=B1  0%  meminfo.Slab
  22092158 =C2=B1  5%    -100.0%     367.25 =C2=B1117%  cpuidle.C1-NHM.time
    232500 =C2=B1  2%    -100.0%       5.50 =C2=B1134%  cpuidle.C1-NHM.usage
  15154580 =C2=B1 77%    -100.0%     272.00 =C2=B1101%  cpuidle.C1E-NHM.time
    763.00 =C2=B1 28%     -99.5%       3.75 =C2=B1100%  cpuidle.C1E-NHM.usa=
ge
  73634849 =C2=B1 10%    -100.0%     528.00 =C2=B1105%  cpuidle.C3-NHM.time
     19059 =C2=B1  3%    -100.0%       5.50 =C2=B1100%  cpuidle.C3-NHM.usage
 2.362e+10 =C2=B1  0%    -100.0%     112246 =C2=B1104%  cpuidle.C6-NHM.time
    608291 =C2=B1  1%    -100.0%       3.00 =C2=B1102%  cpuidle.C6-NHM.usage
   3843019 =C2=B1 55%    -100.0%       0.00 =C2=B1  0%  cpuidle.POLL.time
     60.00 =C2=B1 45%    -100.0%       0.00 =C2=B1  0%  cpuidle.POLL.usage
    500747 =C2=B1 93%    +534.0%    3174963 =C2=B1  3%  numa-numastat.node0=
.local_node
    503454 =C2=B1 93%    +530.6%    3174963 =C2=B1  3%  numa-numastat.node0=
.numa_hit
      2707 =C2=B1 97%    -100.0%       0.00 =C2=B1 -1%  numa-numastat.node0=
.other_node
   1018770 =C2=B1135%    -100.0%       0.00 =C2=B1 -1%  numa-numastat.node1=
.local_node
   1023905 =C2=B1134%    -100.0%       4.25 =C2=B1 30%  numa-numastat.node1=
.numa_hit
      5135 =C2=B1  0%     -99.9%       4.25 =C2=B1 30%  numa-numastat.node1=
.other_node
    749376 =C2=B1120%    -100.0%       0.00 =C2=B1 -1%  numa-numastat.node2=
.local_node
    751947 =C2=B1120%    -100.0%       3.75 =C2=B1 22%  numa-numastat.node2=
.numa_hit
   1801676 =C2=B1 87%    -100.0%       0.00 =C2=B1 -1%  numa-numastat.node3=
.local_node
   1806773 =C2=B1 87%    -100.0%       4.75 =C2=B1 27%  numa-numastat.node3=
.numa_hit
      5097 =C2=B1  0%     -99.9%       4.75 =C2=B1 27%  numa-numastat.node3=
.other_node
      1617 =C2=B1  3%     -41.9%     939.25 =C2=B1  4%  proc-vmstat.nr_allo=
c_batch
    174.00 =C2=B1  1%     -57.3%      74.25 =C2=B1 11%  proc-vmstat.nr_dirt=
ied
    940.75 =C2=B1  0%     -16.7%     784.00 =C2=B1  0%  proc-vmstat.nr_kern=
el_stack
     13092 =C2=B1  0%     -27.7%       9463 =C2=B1  0%  proc-vmstat.nr_slab=
_reclaimable
     27483 =C2=B1  1%     -64.0%       9881 =C2=B1  0%  proc-vmstat.nr_slab=
_unreclaimable
    172.75 =C2=B1  2%     -46.7%      92.00 =C2=B1  0%  proc-vmstat.nr_writ=
ten
   4078832 =C2=B1  0%     -22.3%    3170316 =C2=B1  3%  proc-vmstat.numa_hit
   4063463 =C2=B1  0%     -22.0%    3170303 =C2=B1  3%  proc-vmstat.numa_lo=
cal
     15369 =C2=B1  0%     -99.9%      12.75 =C2=B1 26%  proc-vmstat.numa_ot=
her
     72722 =C2=B1 92%    +185.3%     207454 =C2=B1  5%  proc-vmstat.pgalloc=
_dma32
   6246311 =C2=B1  1%     -49.4%    3161179 =C2=B1  5%  proc-vmstat.pgalloc=
_normal
   6321814 =C2=B1  0%     -46.8%    3364037 =C2=B1  5%  proc-vmstat.pgfree
     54.27 =C2=B1  1%     +10.8%      60.11 =C2=B1  1%  perf-profile.cycles=
-pp.SYSC_semtimedop.sys_semop.entry_SYSCALL_64_fastpath
      1.01 =C2=B1 14%     -97.0%       0.03 =C2=B1 23%  perf-profile.cycles=
-pp.__memcpy.mga_imageblit.soft_cursor.bit_cursor.fb_flashcursor
      1.92 =C2=B1  4%     +37.4%       2.64 =C2=B1 10%  perf-profile.cycles=
-pp.__might_fault.SYSC_semtimedop.sys_semop.entry_SYSCALL_64_fastpath
      1.24 =C2=B1  4%     +48.1%       1.84 =C2=B1 13%  perf-profile.cycles=
-pp.__might_sleep.__might_fault.SYSC_semtimedop.sys_semop.entry_SYSCALL_64_=
fastpath
      1.40 =C2=B1  3%     -23.5%       1.07 =C2=B1  2%  perf-profile.cycles=
-pp.__shmem_file_setup.shmem_kernel_file_setup.newseg.ipcget.sys_shmget
      1.01 =C2=B1 14%     -96.8%       0.03 =C2=B1 13%  perf-profile.cycles=
-pp.bit_cursor.fb_flashcursor.process_one_work.worker_thread.kthread
      4.77 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.call_cpuidle.cpu_startup_entry.start_secondary
      5.41 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.cpu_startup_entry.start_secondary
      4.77 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
      4.26 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_=
secondary
      1.34 =C2=B1  4%     +14.9%       1.54 =C2=B1  7%  perf-profile.cycles=
-pp.do_munmap.sys_shmdt.entry_SYSCALL_64_fastpath
      2.10 =C2=B1  2%      -8.7%       1.92 =C2=B1  3%  perf-profile.cycles=
-pp.do_shmat.sys_shmat.entry_SYSCALL_64_fastpath
      1.03 =C2=B1 16%     -96.9%       0.03 =C2=B1 13%  perf-profile.cycles=
-pp.fb_flashcursor.process_one_work.worker_thread.kthread.ret_from_fork
      4.24 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_e=
ntry
      5.73 =C2=B1  4%     +23.3%       7.07 =C2=B1  4%  perf-profile.cycles=
-pp.ipc_has_perm.isra.26.selinux_ipc_permission.security_ipc_permission.ipc=
perms.SYSC_semtimedop
      2.67 =C2=B1  4%     -23.0%       2.05 =C2=B1  2%  perf-profile.cycles=
-pp.ipcget.sys_shmget.entry_SYSCALL_64_fastpath
     11.46 =C2=B1  2%     +23.8%      14.19 =C2=B1  6%  perf-profile.cycles=
-pp.ipcperms.SYSC_semtimedop.sys_semop.entry_SYSCALL_64_fastpath
      1.92 =C2=B1 15%     -63.2%       0.71 =C2=B1 58%  perf-profile.cycles=
-pp.kthread.ret_from_fork
      1.01 =C2=B1 14%     -96.8%       0.03 =C2=B1 13%  perf-profile.cycles=
-pp.mga_imageblit.soft_cursor.bit_cursor.fb_flashcursor.process_one_work
      2.54 =C2=B1  4%     -23.3%       1.95 =C2=B1  3%  perf-profile.cycles=
-pp.newseg.ipcget.sys_shmget.entry_SYSCALL_64_fastpath
      1.68 =C2=B1  4%     +23.2%       2.07 =C2=B1  8%  perf-profile.cycles=
-pp.perform_atomic_semop.isra.4.SYSC_semtimedop.sys_semop.entry_SYSCALL_64_=
fastpath
      1.04 =C2=B1 16%     -96.2%       0.04 =C2=B1 17%  perf-profile.cycles=
-pp.process_one_work.worker_thread.kthread.ret_from_fork
      1.92 =C2=B1 15%     -63.2%       0.71 =C2=B1 58%  perf-profile.cycles=
-pp.ret_from_fork
      8.47 =C2=B1  4%     +20.9%      10.24 =C2=B1  3%  perf-profile.cycles=
-pp.security_ipc_permission.ipcperms.SYSC_semtimedop.sys_semop.entry_SYSCAL=
L_64_fastpath
      6.48 =C2=B1  4%     +25.6%       8.14 =C2=B1  5%  perf-profile.cycles=
-pp.selinux_ipc_permission.security_ipc_permission.ipcperms.SYSC_semtimedop=
.sys_semop
      1.45 =C2=B1  3%     -23.1%       1.11 =C2=B1  0%  perf-profile.cycles=
-pp.shmem_kernel_file_setup.newseg.ipcget.sys_shmget.entry_SYSCALL_64_fastp=
ath
      1.01 =C2=B1 14%     -96.8%       0.03 =C2=B1 13%  perf-profile.cycles=
-pp.soft_cursor.bit_cursor.fb_flashcursor.process_one_work.worker_thread
      5.43 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.start_secondary
      2.15 =C2=B1  3%      -8.9%       1.96 =C2=B1  3%  perf-profile.cycles=
-pp.sys_shmat.entry_SYSCALL_64_fastpath
      1.40 =C2=B1  4%     +16.4%       1.63 =C2=B1  7%  perf-profile.cycles=
-pp.sys_shmdt.entry_SYSCALL_64_fastpath
      2.69 =C2=B1  4%     -22.6%       2.08 =C2=B1  2%  perf-profile.cycles=
-pp.sys_shmget.entry_SYSCALL_64_fastpath
      0.98 =C2=B1  7%     +17.8%       1.16 =C2=B1 10%  perf-profile.cycles=
-pp.unmap_region.do_munmap.sys_shmdt.entry_SYSCALL_64_fastpath
      1.04 =C2=B1 16%     -96.2%       0.04 =C2=B1 17%  perf-profile.cycles=
-pp.worker_thread.kthread.ret_from_fork
      0.02 =C2=B1 35%   +2625.0%       0.55 =C2=B1 90%  perf-profile.cycles=
-pp.write
     33183 =C2=B1 16%     +63.3%      54174 =C2=B1  2%  numa-meminfo.node0.=
Active
      9029 =C2=B1 56%    +236.0%      30334 =C2=B1  2%  numa-meminfo.node0.=
Active(anon)
    497.33 =C2=B1 70%    +820.9%       4580 =C2=B1 19%  numa-meminfo.node0.=
AnonHugePages
      5620 =C2=B1 22%    +286.1%      21698 =C2=B1  3%  numa-meminfo.node0.=
AnonPages
    120525 =C2=B1  3%     +12.1%     135059 =C2=B1  0%  numa-meminfo.node0.=
FilePages
    529.25 =C2=B1 28%   +1698.3%       9517 =C2=B1  0%  numa-meminfo.node0.=
Inactive(anon)
      2878 =C2=B1  0%    +197.0%       8547 =C2=B1  0%  numa-meminfo.node0.=
Mapped
    940.25 =C2=B1 19%    +239.6%       3192 =C2=B1  0%  numa-meminfo.node0.=
PageTables
     31892 =C2=B1 20%     -42.8%      18242 =C2=B1  4%  numa-meminfo.node0.=
SUnreclaim
      3992 =C2=B1 97%    +355.1%      18169 =C2=B1  0%  numa-meminfo.node0.=
Shmem
     46158 =C2=B1 19%     -23.4%      35344 =C2=B1  2%  numa-meminfo.node0.=
Slab
     28573 =C2=B1 11%     -15.2%      24240 =C2=B1  3%  numa-meminfo.node1.=
Active
      4538 =C2=B1 78%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
Active(anon)
      3207 =C2=B1 43%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
AnonPages
      2511 =C2=B1  4%     -36.3%       1600 =C2=B1  0%  numa-meminfo.node1.=
KernelStack
    251025 =C2=B1  1%     -24.5%     189492 =C2=B1  0%  numa-meminfo.node1.=
MemUsed
    670.75 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
PageTables
     12102 =C2=B1  8%     -42.0%       7020 =C2=B1  9%  numa-meminfo.node1.=
SReclaimable
     23477 =C2=B1 11%     -69.5%       7171 =C2=B1 10%  numa-meminfo.node1.=
SUnreclaim
      1588 =C2=B1133%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
Shmem
     35580 =C2=B1  7%     -60.1%      14191 =C2=B1  8%  numa-meminfo.node1.=
Slab
     35909 =C2=B1 15%     -34.0%      23700 =C2=B1  3%  numa-meminfo.node2.=
Active
     11217 =C2=B1 54%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
Active(anon)
      7744 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
AnonPages
    126406 =C2=B1  5%      -8.0%     116263 =C2=B1  0%  numa-meminfo.node2.=
FilePages
      6530 =C2=B1 56%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
Inactive(anon)
      2594 =C2=B1  6%     -38.3%       1600 =C2=B1  0%  numa-meminfo.node2.=
KernelStack
      7153 =C2=B1 34%     -59.8%       2877 =C2=B1  0%  numa-meminfo.node2.=
Mapped
    265732 =C2=B1  4%     -28.5%     190010 =C2=B1  0%  numa-meminfo.node2.=
MemUsed
     13992 =C2=B1  9%     -51.2%       6828 =C2=B1  6%  numa-meminfo.node2.=
SReclaimable
     25439 =C2=B1 10%     -73.4%       6770 =C2=B1 12%  numa-meminfo.node2.=
SUnreclaim
     10054 =C2=B1 64%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
Shmem
     39432 =C2=B1  5%     -65.5%      13598 =C2=B1  8%  numa-meminfo.node2.=
Slab
     32201 =C2=B1 11%     -19.6%      25885 =C2=B1  2%  numa-meminfo.node3.=
Active
      7541 =C2=B1 28%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
Active(anon)
      6204 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
AnonPages
      2403 =C2=B1145%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
Inactive(anon)
      2894 =C2=B1  4%     -44.7%       1600 =C2=B1  0%  numa-meminfo.node3.=
KernelStack
    258097 =C2=B1  2%     -26.5%     189733 =C2=B1  0%  numa-meminfo.node3.=
MemUsed
    926.00 =C2=B1 27%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
PageTables
     12008 =C2=B1 12%     -42.5%       6906 =C2=B1  3%  numa-meminfo.node3.=
SReclaimable
     29494 =C2=B1 23%     -75.1%       7335 =C2=B1 11%  numa-meminfo.node3.=
SUnreclaim
      3776 =C2=B1 87%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
Shmem
     41503 =C2=B1 14%     -65.7%      14241 =C2=B1  6%  numa-meminfo.node3.=
Slab
      2256 =C2=B1 56%    +236.0%       7583 =C2=B1  2%  numa-vmstat.node0.n=
r_active_anon
    418.75 =C2=B1  3%     -14.8%     356.75 =C2=B1  2%  numa-vmstat.node0.n=
r_alloc_batch
      1404 =C2=B1 22%    +286.2%       5424 =C2=B1  3%  numa-vmstat.node0.n=
r_anon_pages
     30130 =C2=B1  3%     +12.1%      33764 =C2=B1  0%  numa-vmstat.node0.n=
r_file_pages
    132.00 =C2=B1 28%   +1702.3%       2379 =C2=B1  0%  numa-vmstat.node0.n=
r_inactive_anon
    719.00 =C2=B1  0%    +197.1%       2136 =C2=B1  0%  numa-vmstat.node0.n=
r_mapped
    234.75 =C2=B1 19%    +239.6%     797.25 =C2=B1  0%  numa-vmstat.node0.n=
r_page_table_pages
    997.50 =C2=B1 97%    +355.3%       4542 =C2=B1  0%  numa-vmstat.node0.n=
r_shmem
      7972 =C2=B1 20%     -42.8%       4560 =C2=B1  4%  numa-vmstat.node0.n=
r_slab_unreclaimable
    435246 =C2=B1 90%    +293.4%    1712328 =C2=B1  3%  numa-vmstat.node0.n=
uma_hit
    398199 =C2=B1 98%    +330.0%    1712328 =C2=B1  3%  numa-vmstat.node0.n=
uma_local
     37047 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node0.n=
uma_other
      1134 =C2=B1 78%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_active_anon
    451.25 =C2=B1  7%     -50.6%     223.00 =C2=B1 14%  numa-vmstat.node1.n=
r_alloc_batch
    801.00 =C2=B1 43%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_anon_pages
    156.50 =C2=B1  4%     -36.1%     100.00 =C2=B1  0%  numa-vmstat.node1.n=
r_kernel_stack
    167.25 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_page_table_pages
    396.75 =C2=B1133%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_shmem
      3025 =C2=B1  8%     -42.0%       1755 =C2=B1  9%  numa-vmstat.node1.n=
r_slab_reclaimable
      5873 =C2=B1 11%     -69.5%       1792 =C2=B1 10%  numa-vmstat.node1.n=
r_slab_unreclaimable
    601135 =C2=B1113%     -92.6%      44250 =C2=B1  0%  numa-vmstat.node1.n=
uma_hit
    558278 =C2=B1121%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
uma_local
      2803 =C2=B1 54%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_active_anon
    475.75 =C2=B1  4%     -58.2%     198.75 =C2=B1 15%  numa-vmstat.node2.n=
r_alloc_batch
      1935 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_anon_pages
     31601 =C2=B1  5%      -8.0%      29065 =C2=B1  0%  numa-vmstat.node2.n=
r_file_pages
      1632 =C2=B1 56%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_inactive_anon
    161.75 =C2=B1  6%     -38.2%     100.00 =C2=B1  0%  numa-vmstat.node2.n=
r_kernel_stack
      1788 =C2=B1 34%     -59.8%     719.00 =C2=B1  0%  numa-vmstat.node2.n=
r_mapped
    164.75 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_page_table_pages
      2513 =C2=B1 64%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_shmem
      3497 =C2=B1  9%     -51.2%       1707 =C2=B1  6%  numa-vmstat.node2.n=
r_slab_reclaimable
      6356 =C2=B1 10%     -73.4%       1692 =C2=B1 12%  numa-vmstat.node2.n=
r_slab_unreclaimable
    379630 =C2=B1 76%     -88.4%      44216 =C2=B1  0%  numa-vmstat.node2.n=
uma_hit
    353146 =C2=B1 83%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
uma_local
      1884 =C2=B1 28%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_active_anon
    440.50 =C2=B1 10%     -64.5%     156.50 =C2=B1 21%  numa-vmstat.node3.n=
r_alloc_batch
      1550 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_anon_pages
    600.50 =C2=B1145%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_inactive_anon
    180.25 =C2=B1  4%     -44.5%     100.00 =C2=B1  0%  numa-vmstat.node3.n=
r_kernel_stack
    231.25 =C2=B1 27%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_page_table_pages
    943.50 =C2=B1 87%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_shmem
      3001 =C2=B1 12%     -42.5%       1726 =C2=B1  3%  numa-vmstat.node3.n=
r_slab_reclaimable
      7371 =C2=B1 23%     -75.1%       1833 =C2=B1 11%  numa-vmstat.node3.n=
r_slab_unreclaimable
    988661 =C2=B1 78%     -95.5%      44266 =C2=B1  0%  numa-vmstat.node3.n=
uma_hit
    936273 =C2=B1 83%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
uma_local
     52387 =C2=B1  0%     -15.5%      44266 =C2=B1  0%  numa-vmstat.node3.n=
uma_other
      7980 =C2=B1  1%     -11.8%       7038 =C2=B1  0%  slabinfo.Acpi-Names=
pace.active_objs
      7980 =C2=B1  1%     -11.8%       7038 =C2=B1  0%  slabinfo.Acpi-Names=
pace.num_objs
     56168 =C2=B1  0%     -15.6%      47403 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.active_objs
      1003 =C2=B1  0%     -15.3%     849.25 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.active_slabs
     56168 =C2=B1  0%     -15.3%      47558 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.num_objs
      1003 =C2=B1  0%     -15.3%     849.25 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.num_slabs
      3081 =C2=B1  0%     -97.5%      78.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.active_objs
      3081 =C2=B1  0%     -97.5%      78.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.num_objs
     63773 =C2=B1  4%     -29.6%      44900 =C2=B1  0%  slabinfo.Acpi-State=
.active_objs
      1253 =C2=B1  4%     -29.8%     880.25 =C2=B1  0%  slabinfo.Acpi-State=
.active_slabs
     63945 =C2=B1  4%     -29.7%      44925 =C2=B1  0%  slabinfo.Acpi-State=
.num_objs
      1253 =C2=B1  4%     -29.8%     880.25 =C2=B1  0%  slabinfo.Acpi-State=
.num_slabs
      2760 =C2=B1  1%     -89.2%     297.00 =C2=B1  5%  slabinfo.RAW.active=
_objs
      2760 =C2=B1  1%     -89.2%     297.00 =C2=B1  5%  slabinfo.RAW.num_ob=
js
    131.75 =C2=B1  5%     -87.1%      17.00 =C2=B1  0%  slabinfo.TCP.active=
_objs
    131.75 =C2=B1  5%     -87.1%      17.00 =C2=B1  0%  slabinfo.TCP.num_ob=
js
    272.00 =C2=B1 12%     -87.5%      34.00 =C2=B1  0%  slabinfo.UDP.active=
_objs
    272.00 =C2=B1 12%     -87.5%      34.00 =C2=B1  0%  slabinfo.UDP.num_ob=
js
     12139 =C2=B1  3%     -89.6%       1260 =C2=B1  1%  slabinfo.anon_vma.a=
ctive_objs
    237.50 =C2=B1  3%     -90.0%      23.75 =C2=B1  1%  slabinfo.anon_vma.a=
ctive_slabs
     12139 =C2=B1  3%     -89.6%       1260 =C2=B1  1%  slabinfo.anon_vma.n=
um_objs
    237.50 =C2=B1  3%     -90.0%      23.75 =C2=B1  1%  slabinfo.anon_vma.n=
um_slabs
      1131 =C2=B1  7%     -93.5%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.active_objs
      1131 =C2=B1  7%     -93.5%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.num_objs
    399.75 =C2=B1  8%     -90.2%      39.00 =C2=B1  0%  slabinfo.bdev_cache=
.active_objs
    399.75 =C2=B1  8%     -90.2%      39.00 =C2=B1  0%  slabinfo.bdev_cache=
.num_objs
    399.00 =C2=B1 15%     -86.0%      56.00 =C2=B1  0%  slabinfo.blkdev_que=
ue.active_objs
    399.00 =C2=B1 15%     -86.0%      56.00 =C2=B1  0%  slabinfo.blkdev_que=
ue.num_objs
      1221 =C2=B1  4%     -96.4%      44.00 =C2=B1  0%  slabinfo.blkdev_req=
uests.active_objs
      1221 =C2=B1  4%     -96.4%      44.00 =C2=B1  0%  slabinfo.blkdev_req=
uests.num_objs
     59543 =C2=B1  1%     -24.6%      44917 =C2=B1  0%  slabinfo.dentry.act=
ive_objs
      1419 =C2=B1  1%     -24.6%       1069 =C2=B1  0%  slabinfo.dentry.act=
ive_slabs
     59611 =C2=B1  1%     -24.6%      44932 =C2=B1  0%  slabinfo.dentry.num=
_objs
      1419 =C2=B1  1%     -24.6%       1069 =C2=B1  0%  slabinfo.dentry.num=
_slabs
    617.25 =C2=B1 14%     -93.7%      39.00 =C2=B1  0%  slabinfo.file_lock_=
cache.active_objs
    617.25 =C2=B1 14%     -93.7%      39.00 =C2=B1  0%  slabinfo.file_lock_=
cache.num_objs
      3748 =C2=B1  2%     -95.1%     184.00 =C2=B1  0%  slabinfo.files_cach=
e.active_objs
      3748 =C2=B1  2%     -95.1%     184.00 =C2=B1  0%  slabinfo.files_cach=
e.num_objs
      3888 =C2=B1  0%     -10.4%       3485 =C2=B1  0%  slabinfo.ftrace_eve=
nt_field.active_objs
      3888 =C2=B1  0%     -10.4%       3485 =C2=B1  0%  slabinfo.ftrace_eve=
nt_field.num_objs
      4055 =C2=B1  3%     -62.2%       1531 =C2=B1  0%  slabinfo.idr_layer_=
cache.active_objs
    274.75 =C2=B1  3%     -61.7%     105.25 =C2=B1  0%  slabinfo.idr_layer_=
cache.active_slabs
      4127 =C2=B1  3%     -61.6%       1584 =C2=B1  0%  slabinfo.idr_layer_=
cache.num_objs
    274.75 =C2=B1  3%     -61.7%     105.25 =C2=B1  0%  slabinfo.idr_layer_=
cache.num_slabs
     43639 =C2=B1  0%     -14.6%      37276 =C2=B1  0%  slabinfo.inode_cach=
e.active_objs
    764.75 =C2=B1  0%     -14.6%     653.00 =C2=B1  0%  slabinfo.inode_cach=
e.active_slabs
     43639 =C2=B1  0%     -14.6%      37276 =C2=B1  0%  slabinfo.inode_cach=
e.num_objs
    764.75 =C2=B1  0%     -14.6%     653.00 =C2=B1  0%  slabinfo.inode_cach=
e.num_slabs
     60554 =C2=B1  0%     -36.5%      38454 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.active_objs
      1781 =C2=B1  0%     -36.5%       1131 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.active_slabs
     60554 =C2=B1  0%     -36.5%      38454 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.num_objs
      1781 =C2=B1  0%     -36.5%       1131 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.num_slabs
      4283 =C2=B1  0%     -80.9%     819.75 =C2=B1  3%  slabinfo.kmalloc-10=
24.active_objs
    137.75 =C2=B1  0%     -77.9%      30.50 =C2=B1  5%  slabinfo.kmalloc-10=
24.active_slabs
      4410 =C2=B1  0%     -77.9%     976.00 =C2=B1  5%  slabinfo.kmalloc-10=
24.num_objs
    137.75 =C2=B1  0%     -77.9%      30.50 =C2=B1  5%  slabinfo.kmalloc-10=
24.num_slabs
      6191 =C2=B1  1%     -62.9%       2296 =C2=B1  1%  slabinfo.kmalloc-12=
8.active_objs
    192.75 =C2=B1  1%     -62.4%      72.50 =C2=B1  1%  slabinfo.kmalloc-12=
8.active_slabs
      6191 =C2=B1  1%     -62.5%       2320 =C2=B1  1%  slabinfo.kmalloc-12=
8.num_objs
    192.75 =C2=B1  1%     -62.4%      72.50 =C2=B1  1%  slabinfo.kmalloc-12=
8.num_slabs
     26275 =C2=B1  0%     -72.3%       7283 =C2=B1  1%  slabinfo.kmalloc-16=
.active_objs
     26556 =C2=B1  0%     -71.3%       7615 =C2=B1  1%  slabinfo.kmalloc-16=
.num_objs
      9568 =C2=B1  3%     -59.2%       3903 =C2=B1  0%  slabinfo.kmalloc-19=
2.active_objs
    227.75 =C2=B1  3%     -57.6%      96.50 =C2=B1  0%  slabinfo.kmalloc-19=
2.active_slabs
      9606 =C2=B1  3%     -57.8%       4053 =C2=B1  0%  slabinfo.kmalloc-19=
2.num_objs
    227.75 =C2=B1  3%     -57.6%      96.50 =C2=B1  0%  slabinfo.kmalloc-19=
2.num_slabs
      4112 =C2=B1  4%     -81.7%     750.50 =C2=B1  1%  slabinfo.kmalloc-20=
48.active_objs
    264.00 =C2=B1  4%     -81.0%      50.25 =C2=B1  0%  slabinfo.kmalloc-20=
48.active_slabs
      4229 =C2=B1  4%     -80.9%     807.75 =C2=B1  0%  slabinfo.kmalloc-20=
48.num_objs
    264.00 =C2=B1  4%     -81.0%      50.25 =C2=B1  0%  slabinfo.kmalloc-20=
48.num_slabs
     14676 =C2=B1 10%     -89.0%       1615 =C2=B1  1%  slabinfo.kmalloc-25=
6.active_objs
    470.50 =C2=B1 10%     -83.7%      76.50 =C2=B1  1%  slabinfo.kmalloc-25=
6.active_slabs
     15079 =C2=B1 10%     -83.7%       2464 =C2=B1  0%  slabinfo.kmalloc-25=
6.num_objs
    470.50 =C2=B1 10%     -83.7%      76.50 =C2=B1  1%  slabinfo.kmalloc-25=
6.num_slabs
     22983 =C2=B1  0%     -59.9%       9217 =C2=B1  0%  slabinfo.kmalloc-32=
.active_objs
    179.00 =C2=B1  0%     -59.2%      73.00 =C2=B1  0%  slabinfo.kmalloc-32=
.active_slabs
     22983 =C2=B1  0%     -59.3%       9344 =C2=B1  0%  slabinfo.kmalloc-32=
.num_objs
    179.00 =C2=B1  0%     -59.2%      73.00 =C2=B1  0%  slabinfo.kmalloc-32=
.num_slabs
      1162 =C2=B1  0%     -59.1%     475.00 =C2=B1  0%  slabinfo.kmalloc-40=
96.active_objs
      1229 =C2=B1  0%     -57.4%     523.00 =C2=B1  0%  slabinfo.kmalloc-40=
96.num_objs
      8679 =C2=B1  6%     -65.5%       2996 =C2=B1  1%  slabinfo.kmalloc-51=
2.active_objs
    276.00 =C2=B1  5%     -62.5%     103.50 =C2=B1  1%  slabinfo.kmalloc-51=
2.active_slabs
      8845 =C2=B1  5%     -62.3%       3334 =C2=B1  1%  slabinfo.kmalloc-51=
2.num_objs
    276.00 =C2=B1  5%     -62.5%     103.50 =C2=B1  1%  slabinfo.kmalloc-51=
2.num_slabs
     40241 =C2=B1  2%     -58.4%      16722 =C2=B1  0%  slabinfo.kmalloc-64=
.active_objs
    628.00 =C2=B1  2%     -57.6%     266.50 =C2=B1  0%  slabinfo.kmalloc-64=
.active_slabs
     40241 =C2=B1  2%     -57.5%      17115 =C2=B1  0%  slabinfo.kmalloc-64=
.num_objs
    628.00 =C2=B1  2%     -57.6%     266.50 =C2=B1  0%  slabinfo.kmalloc-64=
.num_slabs
    146474 =C2=B1 10%     -97.2%       4094 =C2=B1  0%  slabinfo.kmalloc-8.=
active_objs
    287.50 =C2=B1 10%     -97.6%       7.00 =C2=B1  0%  slabinfo.kmalloc-8.=
active_slabs
    147537 =C2=B1 10%     -97.2%       4094 =C2=B1  0%  slabinfo.kmalloc-8.=
num_objs
    287.50 =C2=B1 10%     -97.6%       7.00 =C2=B1  0%  slabinfo.kmalloc-8.=
num_slabs
    585.50 =C2=B1  1%     -91.1%      52.00 =C2=B1  0%  slabinfo.kmalloc-81=
92.active_objs
    147.00 =C2=B1  1%     -90.6%      13.75 =C2=B1  3%  slabinfo.kmalloc-81=
92.active_slabs
    588.00 =C2=B1  1%     -90.6%      55.00 =C2=B1  3%  slabinfo.kmalloc-81=
92.num_objs
    147.00 =C2=B1  1%     -90.6%      13.75 =C2=B1  3%  slabinfo.kmalloc-81=
92.num_slabs
      6062 =C2=B1  1%     -59.8%       2440 =C2=B1  0%  slabinfo.kmalloc-96=
.active_objs
      6321 =C2=B1  2%     -56.5%       2750 =C2=B1  1%  slabinfo.kmalloc-96=
.num_objs
    612.00 =C2=B1  0%     -75.0%     153.00 =C2=B1  0%  slabinfo.kmem_cache=
.active_objs
    612.00 =C2=B1  0%     -75.0%     153.00 =C2=B1  0%  slabinfo.kmem_cache=
.num_objs
      1025 =C2=B1  0%     -56.2%     449.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.active_objs
      1088 =C2=B1  0%     -52.9%     512.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.num_objs
      1512 =C2=B1  0%     -93.3%     101.00 =C2=B1  0%  slabinfo.mm_struct.=
active_objs
      1512 =C2=B1  0%     -93.3%     101.00 =C2=B1  0%  slabinfo.mm_struct.=
num_objs
      1743 =C2=B1  7%     -95.2%      84.00 =C2=B1  0%  slabinfo.mnt_cache.=
active_objs
      1743 =C2=B1  7%     -95.2%      84.00 =C2=B1  0%  slabinfo.mnt_cache.=
num_objs
    152.00 =C2=B1 17%     -78.9%      32.00 =C2=B1  0%  slabinfo.nfs_inode_=
cache.active_objs
    152.00 =C2=B1 17%     -78.9%      32.00 =C2=B1  0%  slabinfo.nfs_inode_=
cache.num_objs
     11506 =C2=B1  1%     -48.2%       5959 =C2=B1  0%  slabinfo.proc_inode=
_cache.active_objs
    220.75 =C2=B1  1%     -48.4%     114.00 =C2=B1  0%  slabinfo.proc_inode=
_cache.active_slabs
     11506 =C2=B1  1%     -48.2%       5964 =C2=B1  0%  slabinfo.proc_inode=
_cache.num_objs
    220.75 =C2=B1  1%     -48.4%     114.00 =C2=B1  0%  slabinfo.proc_inode=
_cache.num_slabs
     11577 =C2=B1  0%     -33.4%       7714 =C2=B1  0%  slabinfo.radix_tree=
_node.active_objs
     11577 =C2=B1  0%     -33.4%       7714 =C2=B1  0%  slabinfo.radix_tree=
_node.num_objs
      9696 =C2=B1 11%     -85.4%       1420 =C2=B1  0%  slabinfo.shmem_inod=
e_cache.active_objs
    199.75 =C2=B1 11%     -86.0%      28.00 =C2=B1  0%  slabinfo.shmem_inod=
e_cache.active_slabs
      9818 =C2=B1 11%     -85.5%       1420 =C2=B1  0%  slabinfo.shmem_inod=
e_cache.num_objs
    199.75 =C2=B1 11%     -86.0%      28.00 =C2=B1  0%  slabinfo.shmem_inod=
e_cache.num_slabs
      1999 =C2=B1  0%     -60.3%     794.00 =C2=B1  0%  slabinfo.sighand_ca=
che.active_objs
      2010 =C2=B1  1%     -60.5%     794.00 =C2=B1  0%  slabinfo.sighand_ca=
che.num_objs
      3456 =C2=B1  2%     -74.0%     899.00 =C2=B1  0%  slabinfo.signal_cac=
he.active_objs
      3456 =C2=B1  2%     -74.0%     899.00 =C2=B1  0%  slabinfo.signal_cac=
he.num_objs
      4079 =C2=B1  0%     -98.7%      51.00 =C2=B1  0%  slabinfo.sigqueue.a=
ctive_objs
      4079 =C2=B1  0%     -98.7%      51.00 =C2=B1  0%  slabinfo.sigqueue.n=
um_objs
      3722 =C2=B1  5%     -90.4%     357.00 =C2=B1  0%  slabinfo.sock_inode=
_cache.active_objs
      3722 =C2=B1  5%     -90.4%     357.00 =C2=B1  0%  slabinfo.sock_inode=
_cache.num_objs
      1320 =C2=B1  0%     -40.4%     787.25 =C2=B1  0%  slabinfo.task_struc=
t.active_objs
    450.00 =C2=B1  0%     -40.8%     266.50 =C2=B1  0%  slabinfo.task_struc=
t.active_slabs
      1351 =C2=B1  0%     -40.8%     800.25 =C2=B1  0%  slabinfo.task_struc=
t.num_objs
    450.00 =C2=B1  0%     -40.8%     266.50 =C2=B1  0%  slabinfo.task_struc=
t.num_slabs
      2357 =C2=B1  1%     -25.9%       1748 =C2=B1  0%  slabinfo.trace_even=
t_file.active_objs
      2357 =C2=B1  1%     -25.9%       1748 =C2=B1  0%  slabinfo.trace_even=
t_file.num_objs
     22037 =C2=B1  3%     -89.2%       2370 =C2=B1  2%  slabinfo.vm_area_st=
ruct.active_objs
    500.75 =C2=B1  3%     -88.3%      58.50 =C2=B1  1%  slabinfo.vm_area_st=
ruct.active_slabs
     22053 =C2=B1  3%     -88.2%       2601 =C2=B1  1%  slabinfo.vm_area_st=
ruct.num_objs
    500.75 =C2=B1  3%     -88.3%      58.50 =C2=B1  1%  slabinfo.vm_area_st=
ruct.num_slabs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-sbx04/po=
ll2/will-it-scale

commit: =

  8025943c32f5de29b3fd548e917e24424297ca73
  0aefb957de5f2a1d9467126114146b6c793cf180

8025943c32f5de29 0aefb957de5f2a1d9467126114 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    621087 =C2=B1  0%     -75.6%     151438 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
    270552 =C2=B1  0%     -76.8%      62683 =C2=B1  0%  will-it-scale.per_t=
hread_ops
      0.51 =C2=B1  0%     -96.9%       0.02 =C2=B1  0%  will-it-scale.scala=
bility
    308.83 =C2=B1  0%     -28.6%     220.39 =C2=B1  0%  will-it-scale.time.=
elapsed_time
    308.83 =C2=B1  0%     -28.6%     220.39 =C2=B1  0%  will-it-scale.time.=
elapsed_time.max
     16661 =C2=B1  4%    +427.8%      87940 =C2=B1  0%  will-it-scale.time.=
involuntary_context_switches
     47746 =C2=B1  0%     -76.4%      11255 =C2=B1  0%  will-it-scale.time.=
minor_page_faults
      1371 =C2=B1  0%     -96.5%      48.00 =C2=B1  0%  will-it-scale.time.=
percent_of_cpu_this_job_got
      3997 =C2=B1  0%     -97.5%     101.17 =C2=B1  0%  will-it-scale.time.=
system_time
    238.37 =C2=B1  0%     -97.4%       6.18 =C2=B1  0%  will-it-scale.time.=
user_time
      2415 =C2=B1 13%     -86.3%     332.00 =C2=B1  0%  will-it-scale.time.=
voluntary_context_switches
    343.60 =C2=B1  0%     -27.3%     249.68 =C2=B1  0%  uptime.boot
     13400 =C2=B1  0%     -99.9%      13.95 =C2=B1  0%  uptime.idle
     23.86 =C2=B1  0%     -16.9%      19.83 =C2=B1  1%  perf-profile.cycles=
.__fget_light.do_sys_poll.sys_poll.entry_SYSCALL_64_fastpath
      1.41 =C2=B1  2%     -14.0%       1.22 =C2=B1  5%  perf-profile.cycles=
.__kmalloc.do_sys_poll.sys_poll.entry_SYSCALL_64_fastpath
      2.58 =C2=B1  2%     -10.6%       2.30 =C2=B1  6%  perf-profile.cycles=
.kfree.do_sys_poll.sys_poll.entry_SYSCALL_64_fastpath
    595356 =C2=B1  2%     -98.9%       6604 =C2=B1  3%  softirqs.RCU
    239132 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  softirqs.SCHED
   4674720 =C2=B1  0%     -97.5%     118150 =C2=B1  0%  softirqs.TIMER
    647756 =C2=B1  0%     -12.0%     569945 =C2=B1  0%  vmstat.memory.cache
     27.00 =C2=B1  0%     +18.5%      32.00 =C2=B1  0%  vmstat.procs.r
      2496 =C2=B1  3%     +61.6%       4034 =C2=B1  0%  vmstat.system.cs
     29660 =C2=B1  0%     -96.2%       1139 =C2=B1  0%  vmstat.system.in
    308.83 =C2=B1  0%     -28.6%     220.39 =C2=B1  0%  time.elapsed_time
    308.83 =C2=B1  0%     -28.6%     220.39 =C2=B1  0%  time.elapsed_time.m=
ax
     16661 =C2=B1  4%    +427.8%      87940 =C2=B1  0%  time.involuntary_co=
ntext_switches
     47746 =C2=B1  0%     -76.4%      11255 =C2=B1  0%  time.minor_page_fau=
lts
      1371 =C2=B1  0%     -96.5%      48.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
      3997 =C2=B1  0%     -97.5%     101.17 =C2=B1  0%  time.system_time
    238.37 =C2=B1  0%     -97.4%       6.18 =C2=B1  0%  time.user_time
      2415 =C2=B1 13%     -86.3%     332.00 =C2=B1  0%  time.voluntary_cont=
ext_switches
  12555159 =C2=B1111%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
    110916 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.e=
xpand_files.__alloc_fd.get_unused_fd_flags.do_sys_open.SyS_open.entry_SYSCA=
LL_64_fastpath
  13529494 =C2=B1114%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     28467 =C2=B1119%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.d=
o_unlinkat.SyS_unlink.entry_SYSCALL_64_fastpath
     27346 =C2=B1  8%    +273.2%     102063 =C2=B1  7%  latency_stats.sum.e=
p_poll.SyS_epoll_wait.entry_SYSCALL_64_fastpath
   5252412 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.e=
xpand_files.__alloc_fd.get_unused_fd_flags.do_sys_open.SyS_open.entry_SYSCA=
LL_64_fastpath
  21016052 =C2=B1132%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     29706 =C2=B1127%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.p=
ath_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
    875325 =C2=B1 36%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.w=
ait_on_page_bit.__migration_entry_wait.migration_entry_wait.handle_mm_fault=
.__do_page_fault.do_page_fault.page_fault
     37435 =C2=B1  2%     -27.1%      27283 =C2=B1  1%  meminfo.Active(anon)
      5839 =C2=B1 17%     -30.5%       4056 =C2=B1  0%  meminfo.AnonHugePag=
es
     28264 =C2=B1  3%      -6.9%      26318 =C2=B1  1%  meminfo.AnonPages
   6068736 =C2=B1  0%     -32.8%    4076544 =C2=B1  0%  meminfo.DirectMap2M
    144988 =C2=B1 16%     -72.4%      40028 =C2=B1  2%  meminfo.DirectMap4k
     14592 =C2=B1  0%     -12.8%      12721 =C2=B1  0%  meminfo.KernelStack
     53538 =C2=B1  0%     -26.0%      39607 =C2=B1  0%  meminfo.SReclaimable
    105238 =C2=B1  0%     -52.3%      50204 =C2=B1  0%  meminfo.SUnreclaim
     19949 =C2=B1  0%     -44.9%      10987 =C2=B1  0%  meminfo.Shmem
    158777 =C2=B1  0%     -43.4%      89812 =C2=B1  0%  meminfo.Slab
     64609 =C2=B1  1%    +625.6%     468811 =C2=B1  0%  numa-numastat.node0=
.local_node
     67698 =C2=B1  4%    +592.5%     468811 =C2=B1  0%  numa-numastat.node0=
.numa_hit
      3089 =C2=B1 57%    -100.0%       0.00 =C2=B1 -1%  numa-numastat.node0=
.other_node
    123400 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  numa-numastat.node1=
.local_node
    127518 =C2=B1  5%    -100.0%       4.50 =C2=B1 11%  numa-numastat.node1=
.numa_hit
      4117 =C2=B1  0%     -99.9%       4.50 =C2=B1 11%  numa-numastat.node1=
.other_node
    189086 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  numa-numastat.node2=
.local_node
    193204 =C2=B1 13%    -100.0%       4.75 =C2=B1 17%  numa-numastat.node2=
.numa_hit
      4118 =C2=B1  0%     -99.9%       4.75 =C2=B1 17%  numa-numastat.node2=
.other_node
    416535 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  numa-numastat.node3=
.local_node
    417570 =C2=B1  4%    -100.0%       8.25 =C2=B1  5%  numa-numastat.node3=
.numa_hit
     42.99 =C2=B1  0%    +132.1%      99.79 =C2=B1  0%  turbostat.%Busy
      1244 =C2=B1  0%    +132.0%       2887 =C2=B1  0%  turbostat.Avg_MHz
     21.65 =C2=B1  0%     -99.0%       0.21 =C2=B1  6%  turbostat.CPU%c1
      0.01 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  turbostat.CPU%c3
     35.36 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  turbostat.CPU%c7
    205.94 =C2=B1  0%     -81.8%      37.53 =C2=B1  0%  turbostat.CorWatt
     69.75 =C2=B1  1%     -28.3%      50.00 =C2=B1  1%  turbostat.CoreTmp
     30.57 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  turbostat.Pkg%pc2
      0.07 =C2=B1 43%    -100.0%       0.00 =C2=B1 -1%  turbostat.Pkg%pc6
     69.75 =C2=B1  1%     -28.3%      50.00 =C2=B1  1%  turbostat.PkgTmp
    260.89 =C2=B1  0%     -80.4%      51.23 =C2=B1  0%  turbostat.PkgWatt
  26901856 =C2=B1 24%    -100.0%       0.00 =C2=B1  0%  cpuidle.C1-SNB.time
    114490 =C2=B1  2%    -100.0%       0.00 =C2=B1  0%  cpuidle.C1-SNB.usage
  13309860 =C2=B1  5%    -100.0%     550.25 =C2=B1115%  cpuidle.C1E-SNB.time
      3950 =C2=B1 35%    -100.0%       0.50 =C2=B1100%  cpuidle.C1E-SNB.usa=
ge
    447645 =C2=B1 20%     -99.3%       3217 =C2=B1109%  cpuidle.C3-SNB.time
    360.75 =C2=B1  9%     -99.7%       1.25 =C2=B1 87%  cpuidle.C3-SNB.usage
     10273 =C2=B1 69%     -91.3%     894.67 =C2=B1141%  cpuidle.C6-SNB.time
     21.50 =C2=B1 26%     -98.4%       0.33 =C2=B1141%  cpuidle.C6-SNB.usage
 1.126e+10 =C2=B1  0%    -100.0%     459884 =C2=B1  7%  cpuidle.C7-SNB.time
    312083 =C2=B1  1%    -100.0%      14.25 =C2=B1 35%  cpuidle.C7-SNB.usage
  15647510 =C2=B1 83%     -99.8%      36264 =C2=B1103%  cpuidle.POLL.time
    655.00 =C2=B1 53%     -99.8%       1.50 =C2=B1 33%  cpuidle.POLL.usage
      9357 =C2=B1  2%     -27.1%       6823 =C2=B1  1%  proc-vmstat.nr_acti=
ve_anon
      7063 =C2=B1  3%      -6.8%       6582 =C2=B1  1%  proc-vmstat.nr_anon=
_pages
    153.75 =C2=B1 12%     -52.5%      73.00 =C2=B1  0%  proc-vmstat.nr_dirt=
ied
    911.50 =C2=B1  0%     -12.8%     794.50 =C2=B1  0%  proc-vmstat.nr_kern=
el_stack
      4986 =C2=B1  0%     -44.9%       2746 =C2=B1  0%  proc-vmstat.nr_shmem
     13384 =C2=B1  0%     -26.0%       9901 =C2=B1  0%  proc-vmstat.nr_slab=
_reclaimable
     26309 =C2=B1  0%     -52.3%      12550 =C2=B1  0%  proc-vmstat.nr_slab=
_unreclaimable
    146.00 =C2=B1 11%     -33.6%      97.00 =C2=B1  0%  proc-vmstat.nr_writ=
ten
      5821 =C2=B1  2%     -96.2%     222.00 =C2=B1  0%  proc-vmstat.numa_hi=
nt_faults
      4816 =C2=B1  3%     -95.4%     222.00 =C2=B1  0%  proc-vmstat.numa_hi=
nt_faults_local
    799548 =C2=B1  0%     -41.9%     464510 =C2=B1  0%  proc-vmstat.numa_hit
    789143 =C2=B1  0%     -41.1%     464492 =C2=B1  0%  proc-vmstat.numa_lo=
cal
     10405 =C2=B1 13%     -99.8%      17.50 =C2=B1  6%  proc-vmstat.numa_ot=
her
     23329 =C2=B1  0%     -96.3%     852.00 =C2=B1  0%  proc-vmstat.numa_pt=
e_updates
      4709 =C2=B1  0%     -67.7%       1521 =C2=B1  2%  proc-vmstat.pgactiv=
ate
     17082 =C2=B1  2%    +458.2%      95354 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
    820429 =C2=B1  0%     -51.5%     397809 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
    875926 =C2=B1  0%     -38.2%     541689 =C2=B1  0%  proc-vmstat.pgfault
    833766 =C2=B1  0%     -41.3%     489231 =C2=B1  0%  proc-vmstat.pgfree
     34304 =C2=B1 11%     +50.7%      51706 =C2=B1  1%  numa-meminfo.node0.=
Active
      8891 =C2=B1 39%    +207.5%      27338 =C2=B1  1%  numa-meminfo.node0.=
Active(anon)
      6646 =C2=B1 42%    +297.2%      26396 =C2=B1  1%  numa-meminfo.node0.=
AnonPages
     94246 =C2=B1  3%      +9.6%     103265 =C2=B1  0%  numa-meminfo.node0.=
Inactive
      2510 =C2=B1135%    +298.8%      10012 =C2=B1  0%  numa-meminfo.node0.=
Inactive(anon)
      7218 =C2=B1  1%     +22.8%       8865 =C2=B1  0%  numa-meminfo.node0.=
KernelStack
      5065 =C2=B1 51%     +90.7%       9662 =C2=B1  0%  numa-meminfo.node0.=
Mapped
    860.00 =C2=B1 21%    +377.8%       4109 =C2=B1  0%  numa-meminfo.node0.=
PageTables
     13345 =C2=B1  6%     +40.1%      18695 =C2=B1  3%  numa-meminfo.node0.=
SReclaimable
     29466 =C2=B1  1%     -14.1%      25300 =C2=B1  1%  numa-meminfo.node0.=
SUnreclaim
      4924 =C2=B1 88%    +122.6%      10964 =C2=B1  0%  numa-meminfo.node0.=
Shmem
     28020 =C2=B1  6%     -10.4%      25101 =C2=B1  2%  numa-meminfo.node1.=
Active
      3829 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
Active(anon)
      3912 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
AnonPages
      2477 =C2=B1  5%     -48.3%       1280 =C2=B1  0%  numa-meminfo.node1.=
KernelStack
    250026 =C2=B1 21%     -33.2%     167095 =C2=B1  0%  numa-meminfo.node1.=
MemUsed
     12473 =C2=B1  9%     -43.6%       7040 =C2=B1  8%  numa-meminfo.node1.=
SReclaimable
     24000 =C2=B1  5%     -65.9%       8193 =C2=B1  3%  numa-meminfo.node1.=
SUnreclaim
     36474 =C2=B1  6%     -58.2%      15233 =C2=B1  4%  numa-meminfo.node1.=
Slab
     34538 =C2=B1  9%     -26.4%      25414 =C2=B1  7%  numa-meminfo.node2.=
Active
      8814 =C2=B1 30%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
Active(anon)
      8808 =C2=B1 30%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
AnonPages
      4691 =C2=B1 86%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
Inactive(anon)
      2540 =C2=B1  9%     -49.6%       1280 =C2=B1  0%  numa-meminfo.node2.=
KernelStack
    258906 =C2=B1 22%     -35.5%     166905 =C2=B1  0%  numa-meminfo.node2.=
MemUsed
      1184 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
PageTables
     13055 =C2=B1  9%     -46.2%       7028 =C2=B1  3%  numa-meminfo.node2.=
SReclaimable
     24555 =C2=B1  8%     -66.9%       8135 =C2=B1  3%  numa-meminfo.node2.=
SUnreclaim
      4817 =C2=B1 83%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
Shmem
     37611 =C2=B1  7%     -59.7%      15163 =C2=B1  2%  numa-meminfo.node2.=
Slab
     41359 =C2=B1  5%     -39.1%      25174 =C2=B1  4%  numa-meminfo.node3.=
Active
     15871 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
Active(anon)
      2088 =C2=B1112%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
AnonHugePages
      8900 =C2=B1 31%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
AnonPages
      2760 =C2=B1123%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
Inactive(anon)
      2349 =C2=B1  8%     -45.5%       1280 =C2=B1  0%  numa-meminfo.node3.=
KernelStack
    298598 =C2=B1 20%     -44.0%     167245 =C2=B1  0%  numa-meminfo.node3.=
MemUsed
      1071 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
PageTables
     14657 =C2=B1 11%     -53.6%       6808 =C2=B1  5%  numa-meminfo.node3.=
SReclaimable
     27185 =C2=B1 10%     -69.1%       8406 =C2=B1  3%  numa-meminfo.node3.=
SUnreclaim
      9824 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
Shmem
     41842 =C2=B1  8%     -63.6%      15214 =C2=B1  3%  numa-meminfo.node3.=
Slab
      2221 =C2=B1 39%    +207.1%       6822 =C2=B1  1%  numa-vmstat.node0.n=
r_active_anon
      1661 =C2=B1 42%    +296.5%       6586 =C2=B1  1%  numa-vmstat.node0.n=
r_anon_pages
    627.25 =C2=B1135%    +298.8%       2501 =C2=B1  0%  numa-vmstat.node0.n=
r_inactive_anon
    450.50 =C2=B1  1%     +22.9%     553.50 =C2=B1  0%  numa-vmstat.node0.n=
r_kernel_stack
      1266 =C2=B1 51%     +90.7%       2413 =C2=B1  0%  numa-vmstat.node0.n=
r_mapped
    214.50 =C2=B1 21%    +377.3%       1023 =C2=B1  0%  numa-vmstat.node0.n=
r_page_table_pages
      1231 =C2=B1 88%    +122.6%       2740 =C2=B1  0%  numa-vmstat.node0.n=
r_shmem
      3336 =C2=B1  6%     +40.1%       4674 =C2=B1  3%  numa-vmstat.node0.n=
r_slab_reclaimable
      7365 =C2=B1  1%     -14.1%       6328 =C2=B1  1%  numa-vmstat.node0.n=
r_slab_unreclaimable
    112532 =C2=B1  9%    +225.1%     365843 =C2=B1  0%  numa-vmstat.node0.n=
uma_hit
     77391 =C2=B1 16%    +372.7%     365843 =C2=B1  0%  numa-vmstat.node0.n=
uma_local
     35141 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node0.n=
uma_other
    957.25 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_active_anon
    977.75 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_anon_pages
    154.50 =C2=B1  6%     -48.2%      80.00 =C2=B1  0%  numa-vmstat.node1.n=
r_kernel_stack
    224.75 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_page_table_pages
     86.50 =C2=B1 22%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_shmem
      3118 =C2=B1  9%     -43.6%       1760 =C2=B1  8%  numa-vmstat.node1.n=
r_slab_reclaimable
      5999 =C2=B1  5%     -65.9%       2047 =C2=B1  3%  numa-vmstat.node1.n=
r_slab_unreclaimable
    186838 =C2=B1  2%     -79.6%      38117 =C2=B1  0%  numa-vmstat.node1.n=
uma_hit
    167571 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
uma_local
      2203 =C2=B1 30%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_active_anon
      2201 =C2=B1 30%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_anon_pages
      1172 =C2=B1 86%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_inactive_anon
    158.25 =C2=B1  9%     -49.4%      80.00 =C2=B1  0%  numa-vmstat.node2.n=
r_kernel_stack
    295.25 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_page_table_pages
      1204 =C2=B1 83%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
r_shmem
      3263 =C2=B1  9%     -46.2%       1757 =C2=B1  3%  numa-vmstat.node2.n=
r_slab_reclaimable
      6138 =C2=B1  8%     -66.9%       2033 =C2=B1  3%  numa-vmstat.node2.n=
r_slab_unreclaimable
    201075 =C2=B1 11%     -81.0%      38129 =C2=B1  0%  numa-vmstat.node2.n=
uma_hit
    166043 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node2.n=
uma_local
      3966 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_active_anon
    310.00 =C2=B1  2%     +44.0%     446.25 =C2=B1  6%  numa-vmstat.node3.n=
r_alloc_batch
      2225 =C2=B1 31%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_anon_pages
    689.50 =C2=B1123%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_inactive_anon
    146.50 =C2=B1  8%     -45.4%      80.00 =C2=B1  0%  numa-vmstat.node3.n=
r_kernel_stack
    267.25 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_page_table_pages
      2455 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
r_shmem
      3663 =C2=B1 11%     -53.5%       1702 =C2=B1  5%  numa-vmstat.node3.n=
r_slab_reclaimable
      6796 =C2=B1 10%     -69.1%       2101 =C2=B1  3%  numa-vmstat.node3.n=
r_slab_unreclaimable
    300233 =C2=B1  8%     -87.3%      38111 =C2=B1  0%  numa-vmstat.node3.n=
uma_hit
    260400 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node3.n=
uma_local
     92008 =C2=B1  0%     -11.4%      81550 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.active_objs
      1643 =C2=B1  0%     -11.2%       1459 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.active_slabs
     92008 =C2=B1  0%     -11.2%      81718 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.num_objs
      1643 =C2=B1  0%     -11.2%       1459 =C2=B1  0%  slabinfo.Acpi-Opera=
nd.num_slabs
      2466 =C2=B1  0%     -96.8%      78.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.active_objs
      2466 =C2=B1  0%     -96.8%      78.00 =C2=B1  0%  slabinfo.Acpi-Parse=
Ext.num_objs
     61161 =C2=B1  0%     -17.6%      50373 =C2=B1  0%  slabinfo.Acpi-State=
.active_objs
      1199 =C2=B1  0%     -17.7%     987.75 =C2=B1  0%  slabinfo.Acpi-State=
.active_slabs
     61191 =C2=B1  0%     -17.6%      50392 =C2=B1  0%  slabinfo.Acpi-State=
.num_objs
      1199 =C2=B1  0%     -17.7%     987.75 =C2=B1  0%  slabinfo.Acpi-State=
.num_slabs
      2391 =C2=B1  2%     -83.4%     396.00 =C2=B1  0%  slabinfo.RAW.active=
_objs
      2391 =C2=B1  2%     -83.4%     396.00 =C2=B1  0%  slabinfo.RAW.num_ob=
js
    127.50 =C2=B1 11%     -86.7%      17.00 =C2=B1  0%  slabinfo.TCP.active=
_objs
    127.50 =C2=B1 11%     -86.7%      17.00 =C2=B1  0%  slabinfo.TCP.num_ob=
js
    221.00 =C2=B1  7%     -84.6%      34.00 =C2=B1  0%  slabinfo.UDP.active=
_objs
    221.00 =C2=B1  7%     -84.6%      34.00 =C2=B1  0%  slabinfo.UDP.num_ob=
js
     10428 =C2=B1  3%     -83.9%       1675 =C2=B1  1%  slabinfo.anon_vma.a=
ctive_objs
    203.75 =C2=B1  3%     -83.1%      34.50 =C2=B1  1%  slabinfo.anon_vma.a=
ctive_slabs
     10428 =C2=B1  3%     -82.9%       1787 =C2=B1  0%  slabinfo.anon_vma.n=
um_objs
    203.75 =C2=B1  3%     -83.1%      34.50 =C2=B1  1%  slabinfo.anon_vma.n=
um_slabs
      1149 =C2=B1 12%     -93.7%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.active_objs
      1149 =C2=B1 12%     -93.7%      73.00 =C2=B1  0%  slabinfo.avc_xperms=
_node.num_objs
    721.50 =C2=B1 15%     -94.6%      39.00 =C2=B1  0%  slabinfo.bdev_cache=
.active_objs
    721.50 =C2=B1 15%     -94.6%      39.00 =C2=B1  0%  slabinfo.bdev_cache=
.num_objs
    154.00 =C2=B1 17%     -81.8%      28.00 =C2=B1  0%  slabinfo.blkdev_que=
ue.active_objs
    154.00 =C2=B1 17%     -81.8%      28.00 =C2=B1  0%  slabinfo.blkdev_que=
ue.num_objs
      1737 =C2=B1  8%     -92.4%     132.00 =C2=B1  0%  slabinfo.blkdev_req=
uests.active_objs
      1737 =C2=B1  8%     -92.4%     132.00 =C2=B1  0%  slabinfo.blkdev_req=
uests.num_objs
    282.75 =C2=B1 20%     -86.2%      39.00 =C2=B1  0%  slabinfo.buffer_hea=
d.active_objs
    282.75 =C2=B1 20%     -86.2%      39.00 =C2=B1  0%  slabinfo.buffer_hea=
d.num_objs
     64437 =C2=B1  0%     -22.4%      50035 =C2=B1  0%  slabinfo.dentry.act=
ive_objs
      1535 =C2=B1  0%     -22.3%       1192 =C2=B1  0%  slabinfo.dentry.act=
ive_slabs
     64489 =C2=B1  0%     -22.4%      50074 =C2=B1  0%  slabinfo.dentry.num=
_objs
      1535 =C2=B1  0%     -22.3%       1192 =C2=B1  0%  slabinfo.dentry.num=
_slabs
    805.00 =C2=B1 10%     -95.2%      39.00 =C2=B1  0%  slabinfo.file_lock_=
cache.active_objs
    805.00 =C2=B1 10%     -95.2%      39.00 =C2=B1  0%  slabinfo.file_lock_=
cache.num_objs
      3069 =C2=B1  1%     -90.7%     284.00 =C2=B1  0%  slabinfo.files_cach=
e.active_objs
      3069 =C2=B1  1%     -90.7%     284.00 =C2=B1  0%  slabinfo.files_cach=
e.num_objs
      3846 =C2=B1  1%      -9.4%       3485 =C2=B1  0%  slabinfo.ftrace_eve=
nt_field.active_objs
      3846 =C2=B1  1%      -9.4%       3485 =C2=B1  0%  slabinfo.ftrace_eve=
nt_field.num_objs
      2145 =C2=B1  0%     -44.8%       1185 =C2=B1  0%  slabinfo.idr_layer_=
cache.active_objs
      2145 =C2=B1  0%     -44.8%       1185 =C2=B1  0%  slabinfo.idr_layer_=
cache.num_objs
     46494 =C2=B1  0%     -15.9%      39094 =C2=B1  0%  slabinfo.inode_cach=
e.active_objs
    815.50 =C2=B1  0%     -16.0%     685.00 =C2=B1  0%  slabinfo.inode_cach=
e.active_slabs
     46494 =C2=B1  0%     -15.9%      39094 =C2=B1  0%  slabinfo.inode_cach=
e.num_objs
    815.50 =C2=B1  0%     -16.0%     685.00 =C2=B1  0%  slabinfo.inode_cach=
e.num_slabs
     68289 =C2=B1  0%     -30.3%      47600 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.active_objs
      1004 =C2=B1  0%     -30.3%     700.00 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.active_slabs
     68289 =C2=B1  0%     -30.3%      47600 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.num_objs
      1004 =C2=B1  0%     -30.3%     700.00 =C2=B1  0%  slabinfo.kernfs_nod=
e_cache.num_slabs
      3581 =C2=B1  0%     -67.0%       1181 =C2=B1  0%  slabinfo.kmalloc-10=
24.active_objs
      3678 =C2=B1  0%     -67.0%       1215 =C2=B1  0%  slabinfo.kmalloc-10=
24.num_objs
      7279 =C2=B1  3%     -70.9%       2115 =C2=B1  1%  slabinfo.kmalloc-12=
8.active_objs
      7279 =C2=B1  3%     -69.7%       2208 =C2=B1  1%  slabinfo.kmalloc-12=
8.num_objs
     24301 =C2=B1  0%     -46.6%      12981 =C2=B1  0%  slabinfo.kmalloc-16=
.active_objs
     24503 =C2=B1  0%     -44.5%      13588 =C2=B1  0%  slabinfo.kmalloc-16=
.num_objs
     11912 =C2=B1  2%     -62.3%       4493 =C2=B1  0%  slabinfo.kmalloc-19=
2.active_objs
    284.25 =C2=B1  2%     -57.3%     121.50 =C2=B1  1%  slabinfo.kmalloc-19=
2.active_slabs
     11950 =C2=B1  2%     -57.0%       5142 =C2=B1  1%  slabinfo.kmalloc-19=
2.num_objs
    284.25 =C2=B1  2%     -57.3%     121.50 =C2=B1  1%  slabinfo.kmalloc-19=
2.num_slabs
      3519 =C2=B1  2%     -76.1%     841.50 =C2=B1  1%  slabinfo.kmalloc-20=
48.active_objs
    226.50 =C2=B1  3%     -73.5%      60.00 =C2=B1  1%  slabinfo.kmalloc-20=
48.active_slabs
      3634 =C2=B1  3%     -73.4%     967.75 =C2=B1  1%  slabinfo.kmalloc-20=
48.num_objs
    226.50 =C2=B1  3%     -73.5%      60.00 =C2=B1  1%  slabinfo.kmalloc-20=
48.num_slabs
     18521 =C2=B1  5%     -70.2%       5514 =C2=B1  0%  slabinfo.kmalloc-25=
6.active_objs
    303.00 =C2=B1  5%     -68.2%      96.50 =C2=B1  1%  slabinfo.kmalloc-25=
6.active_slabs
     19420 =C2=B1  5%     -68.0%       6211 =C2=B1  1%  slabinfo.kmalloc-25=
6.num_objs
    303.00 =C2=B1  5%     -68.2%      96.50 =C2=B1  1%  slabinfo.kmalloc-25=
6.num_slabs
     26391 =C2=B1  4%     -43.2%      15000 =C2=B1  0%  slabinfo.kmalloc-32=
.active_objs
     26512 =C2=B1  3%     -39.8%      15963 =C2=B1  0%  slabinfo.kmalloc-32=
.num_objs
      1308 =C2=B1  0%     -40.2%     782.75 =C2=B1  0%  slabinfo.kmalloc-40=
96.active_objs
      1390 =C2=B1  0%     -40.0%     834.00 =C2=B1  0%  slabinfo.kmalloc-40=
96.num_objs
     12543 =C2=B1  4%     -64.3%       4473 =C2=B1  0%  slabinfo.kmalloc-51=
2.active_objs
    200.00 =C2=B1  5%     -62.5%      75.00 =C2=B1  2%  slabinfo.kmalloc-51=
2.active_slabs
     12855 =C2=B1  5%     -62.2%       4863 =C2=B1  2%  slabinfo.kmalloc-51=
2.num_objs
    200.00 =C2=B1  5%     -62.5%      75.00 =C2=B1  2%  slabinfo.kmalloc-51=
2.num_slabs
     43396 =C2=B1  1%     -44.7%      23979 =C2=B1  0%  slabinfo.kmalloc-64=
.active_objs
    678.25 =C2=B1  1%     -42.6%     389.00 =C2=B1  0%  slabinfo.kmalloc-64=
.active_slabs
     43428 =C2=B1  1%     -42.6%      24935 =C2=B1  0%  slabinfo.kmalloc-64=
.num_objs
    678.25 =C2=B1  1%     -42.6%     389.00 =C2=B1  0%  slabinfo.kmalloc-64=
.num_slabs
     37376 =C2=B1  0%     -89.0%       4096 =C2=B1  0%  slabinfo.kmalloc-8.=
active_objs
     37376 =C2=B1  0%     -89.0%       4096 =C2=B1  0%  slabinfo.kmalloc-8.=
num_objs
    469.00 =C2=B1  1%     -91.6%      39.25 =C2=B1  1%  slabinfo.kmalloc-81=
92.active_objs
    117.25 =C2=B1  1%     -91.0%      10.50 =C2=B1  4%  slabinfo.kmalloc-81=
92.active_slabs
    469.00 =C2=B1  1%     -91.0%      42.00 =C2=B1  4%  slabinfo.kmalloc-81=
92.num_objs
    117.25 =C2=B1  1%     -91.0%      10.50 =C2=B1  4%  slabinfo.kmalloc-81=
92.num_slabs
      5323 =C2=B1  2%     -66.1%       1802 =C2=B1  0%  slabinfo.kmalloc-96=
.active_objs
      5596 =C2=B1  2%     -62.5%       2100 =C2=B1  2%  slabinfo.kmalloc-96=
.num_objs
    561.00 =C2=B1  6%     -72.7%     153.00 =C2=B1  0%  slabinfo.kmem_cache=
.active_objs
    561.00 =C2=B1  6%     -72.7%     153.00 =C2=B1  0%  slabinfo.kmem_cache=
.num_objs
    961.00 =C2=B1  4%     -53.3%     449.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.active_objs
      1024 =C2=B1  4%     -50.0%     512.00 =C2=B1  0%  slabinfo.kmem_cache=
_node.num_objs
      1189 =C2=B1  1%     -89.7%     122.00 =C2=B1  0%  slabinfo.mm_struct.=
active_objs
      1189 =C2=B1  1%     -89.4%     125.75 =C2=B1  0%  slabinfo.mm_struct.=
num_objs
      1889 =C2=B1  7%     -93.9%     115.50 =C2=B1 15%  slabinfo.mnt_cache.=
active_objs
      1889 =C2=B1  7%     -93.9%     115.50 =C2=B1 15%  slabinfo.mnt_cache.=
num_objs
    160.00 =C2=B1  0%     -80.0%      32.00 =C2=B1  0%  slabinfo.nfs_inode_=
cache.active_objs
    160.00 =C2=B1  0%     -80.0%      32.00 =C2=B1  0%  slabinfo.nfs_inode_=
cache.num_objs
      9849 =C2=B1  1%     -45.8%       5342 =C2=B1  0%  slabinfo.proc_inode=
_cache.active_objs
      9849 =C2=B1  1%     -45.8%       5342 =C2=B1  0%  slabinfo.proc_inode=
_cache.num_objs
     10929 =C2=B1  0%     -28.8%       7784 =C2=B1  0%  slabinfo.radix_tree=
_node.active_objs
     10929 =C2=B1  0%     -28.8%       7784 =C2=B1  0%  slabinfo.radix_tree=
_node.num_objs
      9192 =C2=B1  3%     -39.4%       5570 =C2=B1  0%  slabinfo.shmem_inod=
e_cache.active_objs
      9202 =C2=B1  3%     -39.5%       5570 =C2=B1  0%  slabinfo.shmem_inod=
e_cache.num_objs
      1765 =C2=B1  0%     -55.3%     789.50 =C2=B1  0%  slabinfo.sighand_ca=
che.active_objs
      1765 =C2=B1  0%     -54.8%     798.75 =C2=B1  0%  slabinfo.sighand_ca=
che.num_objs
      2801 =C2=B1  1%     -66.0%     951.25 =C2=B1  0%  slabinfo.signal_cac=
he.active_objs
      2801 =C2=B1  1%     -66.0%     951.25 =C2=B1  0%  slabinfo.signal_cac=
he.num_objs
      3267 =C2=B1  0%     -98.3%      55.00 =C2=B1  0%  slabinfo.sigqueue.a=
ctive_objs
      3267 =C2=B1  0%     -98.3%      55.00 =C2=B1  0%  slabinfo.sigqueue.n=
um_objs
      3299 =C2=B1  6%     -84.5%     510.00 =C2=B1  0%  slabinfo.sock_inode=
_cache.active_objs
      3299 =C2=B1  6%     -84.5%     510.00 =C2=B1  0%  slabinfo.sock_inode=
_cache.num_objs
      1199 =C2=B1  0%     -33.5%     797.75 =C2=B1  0%  slabinfo.task_struc=
t.active_objs
    410.50 =C2=B1  1%     -35.0%     267.00 =C2=B1  0%  slabinfo.task_struc=
t.active_slabs
      1232 =C2=B1  1%     -34.9%     802.25 =C2=B1  0%  slabinfo.task_struc=
t.num_objs
    410.50 =C2=B1  1%     -35.0%     267.00 =C2=B1  0%  slabinfo.task_struc=
t.num_slabs
      1081 =C2=B1  2%     -96.5%      38.00 =C2=B1  0%  slabinfo.taskstats.=
active_objs
      1081 =C2=B1  2%     -96.5%      38.00 =C2=B1  0%  slabinfo.taskstats.=
num_objs
      2599 =C2=B1  1%     -32.7%       1748 =C2=B1  0%  slabinfo.trace_even=
t_file.active_objs
      2599 =C2=B1  1%     -32.7%       1748 =C2=B1  0%  slabinfo.trace_even=
t_file.num_objs
     19377 =C2=B1  3%     -84.0%       3103 =C2=B1  0%  slabinfo.vm_area_st=
ruct.active_objs
    441.25 =C2=B1  3%     -82.6%      76.75 =C2=B1  0%  slabinfo.vm_area_st=
ruct.active_slabs
     19433 =C2=B1  3%     -82.5%       3405 =C2=B1  0%  slabinfo.vm_area_st=
ruct.num_objs
    441.25 =C2=B1  3%     -82.6%      76.75 =C2=B1  0%  slabinfo.vm_area_st=
ruct.num_slabs
lkp-ivb-d04: Ivy Bridge
Memory: 4G

lkp-wsx02: Westmere-EX
Memory: 128G

lkp-nex04: Nehalem-EX
Memory: 256G

ivb42: Ivytown Ivy Bridge-EP
Memory: 64G

lkp-a06: Atom
Memory: 8G

lkp-sbx04: Sandy Bridge-EX
Memory: 64G

lkp-sb03: Sandy Bridge-EP
Memory: 64G

lkp-ivb-d02: Ivy Bridge
Memory: 8G

nhm4: Nehalem
Memory: 4G

wsm: Westmere
Memory: 6G

lkp-hsw01: Grantley Haswell-EP
Memory: 64G

lkp-hsw-ep2: Brickland Haswell-EP
Memory: 128G

brickland1: Brickland Ivy Bridge-EX
Memory: 128G

lkp-sb02: Sandy Bridge-EP
Memory: 4G

lkp-ne04: Nehalem-EP
Memory: 12G

lituya: Grantley Haswell
Memory: 16G

snb-drag: Sandy Bridge
Memory: 6G

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

--===============7161062081280901381==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogd2lsbC1pdC1zY2FsZQpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IGFjdGl2YXRl
LW1vbml0b3IKICBrbXNnOiAKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1h
LW51bWFzdGF0OiAKICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3Rh
dDogCiAgcHJvYy1zdGF0OgogICAgaW50ZXJ2YWw6IDEwCiAgbWVtaW5mbzogCiAgc2xhYmluZm86
IAogIGludGVycnVwdHM6IAogIGxvY2tfc3RhdDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGly
cXM6IAogIGJkaV9kZXZfbWFwcGluZzogCiAgZGlza3N0YXRzOiAKICBuZnNzdGF0OiAKICBjcHVp
ZGxlOiAKICBjcHVmcmVxLXN0YXRzOiAKICB0dXJib3N0YXQ6IAogIHBtZXRlcjogCiAgc2NoZWRf
ZGVidWc6CiAgICBpbnRlcnZhbDogNjAKY3B1ZnJlcV9nb3Zlcm5vcjogcGVyZm9ybWFuY2UKZGVm
YXVsdC13YXRjaGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IDBhZWZi
OTU3ZGU1ZjJhMWQ5NDY3MTI2MTE0MTQ2YjZjNzkzY2YxODAKbW9kZWw6IFNhbmR5IEJyaWRnZS1F
WApucl9jcHU6IDY0Cm1lbW9yeTogNjRHCm5yX3NzZF9wYXJ0aXRpb25zOiA3CnNzZF9wYXJ0aXRp
b25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1JTlRFTF9TU0RTQzIqLXBhcnQxIgpzd2FwX3BhcnRp
dGlvbnM6IApjYXRlZ29yeTogYmVuY2htYXJrCnBlcmYtcHJvZmlsZToKICBmcmVxOiA4MDAKd2ls
bC1pdC1zY2FsZToKICB0ZXN0OiBwb2xsMgpxdWV1ZTogYmlzZWN0CnRlc3Rib3g6IGxrcC1zYngw
NAp0Ym94X2dyb3VwOiBsa3Atc2J4MDQKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1l
OiAyMDE1LTEyLTA4IDE3OjQzOjQwLjEyMjgxMTk5OCArMDg6MDAKaWQ6IDQ2ZDEzNzZjZjg0ODE5
YTcxODgwNGViOGUzNTFmNjRhNzk4YjE4ZmMKdXNlcjogbGtwCmNvbXBpbGVyOiBnY2MtNC45Cmhl
YWRfY29tbWl0OiA5OTdiM2I1ZGRiNzQxOWY1MzM5NmJhNGM0MDVlZGViODhiZDdkMjZlCmJhc2Vf
Y29tbWl0OiA1MjdlOTMxNmY4ZWM0NGJkNTNkOTBmYjlmNjExZmE3ZmZmZjUyYmI5CmJyYW5jaDog
bGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUxMjA3MjIKcm9vdGZzOiBkZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC93aWxsLWl0LXNjYWxlL3BlcmZv
cm1hbmNlLXBvbGwyL2xrcC1zYngwNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82
NC1yaGVsL2djYy00LjkvMGFlZmI5NTdkZTVmMmExZDk0NjcxMjYxMTQxNDZiNmM3OTNjZjE4MC8w
Igpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2xrcC1zYngwNC9iaXNlY3Rfd2lsbC1pdC1zY2Fs
ZS1wZXJmb3JtYW5jZS1wb2xsMi1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1y
aGVsLTBhZWZiOTU3ZGU1ZjJhMWQ5NDY3MTI2MTE0MTQ2YjZjNzkzY2YxODAtMjAxNTEyMDgtMzQ4
MzAtZWJnNmR2LTAueWFtbCIKbWF4X3VwdGltZTogMTUwMAppbml0cmQ6ICIvb3NpbWFnZS9kZWJp
YW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9v
dD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVkdWxlZC9sa3Atc2J4MDQvYmlz
ZWN0X3dpbGwtaXQtc2NhbGUtcGVyZm9ybWFuY2UtcG9sbDItZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNnei14ODZfNjQtcmhlbC0wYWVmYjk1N2RlNWYyYTFkOTQ2NzEyNjExNDE0NmI2Yzc5M2Nm
MTgwLTIwMTUxMjA4LTM0ODMwLWViZzZkdi0wLnlhbWwKLSBBUkNIPXg4Nl82NAotIGtjb25maWc9
eDg2XzY0LXJoZWwKLSBicmFuY2g9bGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUxMjA3MjIK
LSBjb21taXQ9MGFlZmI5NTdkZTVmMmExZDk0NjcxMjYxMTQxNDZiNmM3OTNjZjE4MAotIEJPT1Rf
SU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzBhZWZiOTU3ZGU1ZjJhMWQ5NDY3
MTI2MTE0MTQ2YjZjNzkzY2YxODAvdm1saW51ei00LjQuMC1yYzEtMDAwMTQtZzBhZWZiOTUKLSBt
YXhfdXB0aW1lPTE1MDAKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L3dpbGwtaXQtc2NhbGUvcGVyZm9y
bWFuY2UtcG9sbDIvbGtwLXNieDA0L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0
LXJoZWwvZ2NjLTQuOS8wYWVmYjk1N2RlNWYyYTFkOTQ2NzEyNjExNDE0NmI2Yzc5M2NmMTgwLzAK
LSBMS1BfU0VSVkVSPWlubgotIHwyLQoKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3Rl
bWQubG9nX2xldmVsPWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQg
cmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBf
cGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9t
cHRfcmFtZGlzaz0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3Jt
YWwKCiAgcncKbGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2lu
aXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8wYWVmYjk1N2RlNWYyYTFkOTQ2
NzEyNjExNDE0NmI2Yzc5M2NmMTgwL21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9k
ZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2Rl
Ymlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBz
L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFy
a3MvdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3Mvd2lsbC1pdC1zY2FsZS5jZ3oiCnJlcGVh
dF90bzogMgprZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvMGFlZmI5NTdk
ZTVmMmExZDk0NjcxMjYxMTQxNDZiNmM3OTNjZjE4MC92bWxpbnV6LTQuNC4wLXJjMS0wMDAxNC1n
MGFlZmI5NSIKZGVxdWV1ZV90aW1lOiAyMDE1LTEyLTA4IDE3OjQ0OjMyLjU1MzI3MjMwOCArMDg6
MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiA0Ni43MSAxOS4xMyA3LjE4IDEvNTc3IDc3
MzIKc3RhcnRfdGltZTogJzE0NDk1Njc5MTknCmVuZF90aW1lOiAnMTQ0OTU2ODEzOScKdmVyc2lv
bjogIi9sa3AvbGtwLy5zcmMtMjAxNTEyMDgtMTcxNzE1Igo=

--===============7161062081280901381==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNS0xMi0wOCAxNzo0NToxOCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0wOCAxNzo0NToxOSAu
L3J1bnRlc3QucHkgcG9sbDIgMTYgYm90aCAxIDE2IDMyIDQ4IDY0Cg==

--===============7161062081280901381==--

