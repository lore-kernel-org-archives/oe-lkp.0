Content-Type: multipart/mixed; boundary="===============1607940122152607613=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [sched] eae3e9e8843: +36.8% pigz.throughput
Date: Mon, 11 May 2015 13:50:47 +0800
Message-ID: <1431323447.5148.144.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1607940122152607613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://bee.sh.intel.com/git/ydu19/linux rewrite-v7-on-4.1-rc1
commit eae3e9e8843146e7e1cc77bd943e5f8138b61314 ("sched: Rewrite per entity=
 runnable load average tracking")

testcase/path_params/tbox_group: pigz/performance-100%-128K/lkp-nex06

40fa32019d8574cb  eae3e9e8843146e7e1cc77bd94  =

----------------  --------------------------  =

 2.683e+08 =C2=B1  0%     +36.8%   3.67e+08 =C2=B1  0%  pigz.throughput
     18661 =C2=B1  0%     -21.6%      14625 =C2=B1  0%  pigz.time.user_time
   2046066 =C2=B1  0%    +176.7%    5661440 =C2=B1  0%  pigz.time.voluntary=
_context_switches
       174 =C2=B1  0%     +40.9%        245 =C2=B1  0%  pigz.time.system_ti=
me
    904986 =C2=B1  1%     -43.8%     508883 =C2=B1  0%  pigz.time.involunta=
ry_context_switches
      6268 =C2=B1  0%     -21.0%       4952 =C2=B1  0%  pigz.time.percent_o=
f_cpu_this_job_got
      3382 =C2=B1  8%    +118.6%       7392 =C2=B1  3%  uptime.idle
     33576 =C2=B1  0%     -12.3%      29441 =C2=B1  1%  meminfo.Shmem
   1241653 =C2=B1  6%     -10.0%    1117099 =C2=B1  0%  softirqs.RCU
    201843 =C2=B1  0%     +97.2%     397952 =C2=B1  0%  softirqs.SCHED
   9772559 =C2=B1  0%     -20.6%    7762431 =C2=B1  0%  softirqs.TIMER
        63 =C2=B1  0%     -17.7%         52 =C2=B1  1%  vmstat.procs.r
     84867 =C2=B1  0%     -20.0%      67874 =C2=B1  0%  vmstat.system.in
     13057 =C2=B1  0%    +183.4%      37007 =C2=B1  0%  vmstat.system.cs
    904986 =C2=B1  1%     -43.8%     508883 =C2=B1  0%  time.involuntary_co=
ntext_switches
      6268 =C2=B1  0%     -21.0%       4952 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
       174 =C2=B1  0%     +40.9%        245 =C2=B1  0%  time.system_time
     18661 =C2=B1  0%     -21.6%      14625 =C2=B1  0%  time.user_time
   2046066 =C2=B1  0%    +176.7%    5661440 =C2=B1  0%  time.voluntary_cont=
ext_switches
     69.56 =C2=B1  0%      +7.4%      74.67 =C2=B1  0%  turbostat.%Busy
      1335 =C2=B1  0%     +24.6%       1663 =C2=B1  0%  turbostat.Avg_MHz
      1920 =C2=B1  0%     +16.0%       2227 =C2=B1  0%  turbostat.Bzy_MHz
     29.76 =C2=B1  0%     -44.5%      16.50 =C2=B1  1%  turbostat.CPU%c1
      0.69 =C2=B1  5%   +1182.5%       8.82 =C2=B1  1%  turbostat.CPU%c3
      0.28 =C2=B1  9%     +83.0%       0.51 =C2=B1  2%  turbostat.Pkg%pc3
      8379 =C2=B1  0%     -12.2%       7360 =C2=B1  1%  proc-vmstat.nr_shmem
  26862047 =C2=B1  0%     +36.0%   36537881 =C2=B1  0%  proc-vmstat.numa_hit
  26861982 =C2=B1  0%     +36.0%   36537861 =C2=B1  0%  proc-vmstat.numa_lo=
cal
      9403 =C2=B1  0%     -12.6%       8221 =C2=B1  2%  proc-vmstat.pgactiv=
ate
   2116622 =C2=B1  7%     +28.9%    2727789 =C2=B1  2%  proc-vmstat.pgalloc=
_dma32
  24828395 =C2=B1  0%     +36.6%   33904973 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
  26931165 =C2=B1  0%     +36.0%   36619978 =C2=B1  0%  proc-vmstat.pgfree
   6608532 =C2=B1  7%     +29.1%    8533790 =C2=B1  2%  numa-numastat.node0=
.numa_hit
   6607488 =C2=B1  7%     +29.1%    8533243 =C2=B1  2%  numa-numastat.node0=
.local_node
   6949144 =C2=B1 10%     +32.9%    9232380 =C2=B1 10%  numa-numastat.node1=
.local_node
   6950185 =C2=B1 10%     +32.8%    9232396 =C2=B1 10%  numa-numastat.node1=
.numa_hit
   6887396 =C2=B1 17%     +50.7%   10377491 =C2=B1 10%  numa-numastat.node2=
.local_node
   6889467 =C2=B1 17%     +50.6%   10378080 =C2=B1 10%  numa-numastat.node2=
.numa_hit
   6427416 =C2=B1 16%     +30.8%    8408092 =C2=B1  1%  numa-numastat.node3=
.local_node
   6429490 =C2=B1 16%     +30.8%    8408663 =C2=B1  1%  numa-numastat.node3=
.numa_hit
     23149 =C2=B1  4%    +100.3%      46357 =C2=B1  1%  cpuidle.C1-NHM.usage
   7161061 =C2=B1  6%    +326.7%   30557423 =C2=B1  1%  cpuidle.C1-NHM.time
    100163 =C2=B1  4%    +263.5%     364095 =C2=B1  1%  cpuidle.C1E-NHM.usa=
ge
  22529441 =C2=B1  3%    +390.6%  1.105e+08 =C2=B1  1%  cpuidle.C1E-NHM.time
 3.774e+08 =C2=B1  3%   +1024.6%  4.244e+09 =C2=B1  0%  cpuidle.C3-NHM.time
    669049 =C2=B1  2%    +556.3%    4391062 =C2=B1  0%  cpuidle.C3-NHM.usage
        16 =C2=B1 15%    +506.1%        100 =C2=B1 11%  cpuidle.POLL.usage
       770 =C2=B1 40%    +544.8%       4966 =C2=B1 35%  cpuidle.POLL.time
     34535 =C2=B1 36%     -41.8%      20095 =C2=B1  8%  numa-meminfo.node0.=
Active(anon)
     23133 =C2=B1  7%     -12.8%      20180 =C2=B1  8%  numa-meminfo.node0.=
AnonPages
     13351 =C2=B1  4%     -20.6%      10594 =C2=B1  9%  numa-meminfo.node0.=
SReclaimable
     28535 =C2=B1  5%     +15.7%      33003 =C2=B1  9%  numa-meminfo.node2.=
Slab
    218579 =C2=B1  2%     +13.3%     247589 =C2=B1  1%  numa-meminfo.node2.=
MemUsed
    118187 =C2=B1  2%      +8.3%     127984 =C2=B1  9%  numa-meminfo.node3.=
FilePages
    226067 =C2=B1  4%     +10.6%     249934 =C2=B1  5%  numa-meminfo.node3.=
MemUsed
      2447 =C2=B1  9%     +18.8%       2908 =C2=B1  3%  numa-meminfo.node3.=
KernelStack
      5775 =C2=B1  7%     -12.6%       5047 =C2=B1  8%  numa-vmstat.node0.n=
r_anon_pages
   3498916 =C2=B1  9%     +24.1%    4343868 =C2=B1  2%  numa-vmstat.node0.n=
uma_local
   3532759 =C2=B1  9%     +24.0%    4379945 =C2=B1  2%  numa-vmstat.node0.n=
uma_hit
      8629 =C2=B1 37%     -41.8%       5025 =C2=B1  8%  numa-vmstat.node0.n=
r_active_anon
      3337 =C2=B1  4%     -20.7%       2648 =C2=B1  9%  numa-vmstat.node0.n=
r_slab_reclaimable
       150 =C2=B1 20%     -22.2%        116 =C2=B1  0%  numa-vmstat.node0.n=
r_unevictable
       150 =C2=B1 20%     -22.2%        116 =C2=B1  0%  numa-vmstat.node0.n=
r_mlock
      6417 =C2=B1 32%    +363.7%      29753 =C2=B1 41%  numa-vmstat.node1.n=
uma_other
   3525752 =C2=B1 11%     +32.4%    4669694 =C2=B1  8%  numa-vmstat.node1.n=
uma_hit
   3519334 =C2=B1 11%     +31.8%    4639940 =C2=B1  8%  numa-vmstat.node1.n=
uma_local
   3389724 =C2=B1 16%     +53.8%    5212082 =C2=B1  9%  numa-vmstat.node2.n=
uma_local
   3429257 =C2=B1 16%     +52.9%    5243860 =C2=B1  9%  numa-vmstat.node2.n=
uma_hit
   3205283 =C2=B1 15%     +32.0%    4231247 =C2=B1  3%  numa-vmstat.node3.n=
uma_local
     29546 =C2=B1  2%      +8.3%      31998 =C2=B1  9%  numa-vmstat.node3.n=
r_file_pages
   3244813 =C2=B1 15%     +31.1%    4253113 =C2=B1  3%  numa-vmstat.node3.n=
uma_hit
       227 =C2=B1  1%    +139.2%        544 =C2=B1  0%  latency_stats.avg.f=
utex_wait_queue_me.futex_wait.do_futex.SyS_futex.system_call_fastpath
       452 =C2=B1  1%      -8.7%        413 =C2=B1  1%  latency_stats.avg.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
       183 =C2=B1  4%    +129.6%        421 =C2=B1 13%  latency_stats.avg.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
      3331 =C2=B1  0%     -23.0%       2564 =C2=B1  3%  latency_stats.avg.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
        56 =C2=B1 28%     -34.2%         37 =C2=B1 20%  latency_stats.avg.s=
top_two_cpus.migrate_swap.task_numa_migrate.numa_migrate_preferred.task_num=
a_fault.handle_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page=
_fault
       241 =C2=B1  8%     -21.6%        189 =C2=B1 10%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.may_open
       207 =C2=B1 12%    +263.9%        755 =C2=B1 26%  latency_stats.avg.c=
all_rwsem_down_write_failed.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.system_ca=
ll_fastpath
       927 =C2=B1  1%     -29.0%        658 =C2=B1  1%  latency_stats.avg.d=
o_wait.SyS_wait4.system_call_fastpath
       175 =C2=B1  1%     -17.5%        145 =C2=B1  0%  latency_stats.avg.p=
ipe_wait.pipe_write.__vfs_write.vfs_write.SyS_write.system_call_fastpath
        50 =C2=B1 11%    +181.1%        141 =C2=B1  5%  latency_stats.avg.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault.copy_pa=
ge_to_iter.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
        35 =C2=B1 11%    -100.0%          0 =C2=B1  0%  latency_stats.avg.c=
all_rwsem_down_write_failed.vma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgof=
f.SyS_mmap_pgoff.SyS_mmap.system_call_fastpath
        92 =C2=B1  5%     +47.3%        136 =C2=B1  7%  latency_stats.avg.c=
all_rwsem_down_write_failed.SyS_mprotect.system_call_fastpath
       152 =C2=B1 12%     +91.6%        291 =C2=B1  6%  latency_stats.avg.p=
ipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
        22 =C2=B1 19%     -42.7%         12 =C2=B1 40%  latency_stats.avg.w=
ait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.hand=
le_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
        10 =C2=B1 28%     -83.7%          1 =C2=B1 24%  latency_stats.hits.=
call_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.=
flush_old_exec.load_elf_binary.search_binary_handler.do_execveat_common.SyS=
_execve.return_from_execve
   1358060 =C2=B1  0%    +253.5%    4800372 =C2=B1  0%  latency_stats.hits.=
futex_wait_queue_me.futex_wait.do_futex.SyS_futex.system_call_fastpath
     15211 =C2=B1  1%     +52.3%      23161 =C2=B1  0%  latency_stats.hits.=
pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
       195 =C2=B1  6%     -26.6%        143 =C2=B1  5%  latency_stats.hits.=
call_rwsem_down_write_failed.vm_munmap.SyS_munmap.system_call_fastpath
       941 =C2=B1  2%     -41.3%        553 =C2=B1  5%  latency_stats.hits.=
call_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault.copy_p=
age_to_iter.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
       856 =C2=B1 21%    +233.1%       2851 =C2=B1  6%  latency_stats.hits.=
pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
        25 =C2=B1 29%    +169.0%         67 =C2=B1 15%  latency_stats.hits.=
pipe_write.__vfs_write.vfs_write.SyS_write.system_call_fastpath
         9 =C2=B1 40%     -84.2%          1 =C2=B1 33%  latency_stats.hits.=
wait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.han=
dle_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault.clea=
r_user.padzero.load_elf_binary
      1313 =C2=B1  1%     -12.4%       1151 =C2=B1  3%  latency_stats.hits.=
call_rwsem_down_write_failed.SyS_mprotect.system_call_fastpath
      4108 =C2=B1  0%     +55.7%       6398 =C2=B1  0%  latency_stats.hits.=
do_wait.SyS_wait4.system_call_fastpath
     12638 =C2=B1  0%     +27.0%      16053 =C2=B1 21%  latency_stats.max.p=
ipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
       344 =C2=B1 10%     -21.3%        271 =C2=B1 21%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.may_open
      2295 =C2=B1 25%    +331.3%       9898 =C2=B1 23%  latency_stats.max.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault.copy_pa=
ge_to_iter.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
        51 =C2=B1 18%    -100.0%          0 =C2=B1  0%  latency_stats.max.c=
all_rwsem_down_write_failed.vma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgof=
f.SyS_mmap_pgoff.SyS_mmap.system_call_fastpath
      5538 =C2=B1 45%    +120.8%      12228 =C2=B1 18%  latency_stats.max.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
      4086 =C2=B1  0%     -12.3%       3582 =C2=B1  8%  latency_stats.max.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
   3810831 =C2=B1  1%     +10.7%    4218213 =C2=B1  1%  latency_stats.sum.d=
o_wait.SyS_wait4.system_call_fastpath
    168212 =C2=B1 16%    +274.5%     630000 =C2=B1 26%  latency_stats.sum.c=
all_rwsem_down_write_failed.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.system_ca=
ll_fastpath
   6891099 =C2=B1  2%     +39.0%    9579806 =C2=B1  0%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
      1207 =C2=B1  8%     -21.7%        946 =C2=B1 10%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.may_open
    122162 =C2=B1  6%     +28.5%     156995 =C2=B1  5%  latency_stats.sum.c=
all_rwsem_down_write_failed.SyS_mprotect.system_call_fastpath
     33322 =C2=B1  0%     -23.0%      25650 =C2=B1  3%  latency_stats.sum.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
    128589 =C2=B1 19%    +544.3%     828462 =C2=B1  3%  latency_stats.sum.p=
ipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
     47841 =C2=B1 12%     +63.3%      78146 =C2=B1  3%  latency_stats.sum.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault.copy_pa=
ge_to_iter.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
     20227 =C2=B1 15%     +56.2%      31588 =C2=B1 11%  latency_stats.sum.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.filemap_write_and=
_wait.nfs_wb_all.nfs_getattr.vfs_getattr_nosec.vfs_getattr.vfs_fstat.SYSC_n=
ewfstat.SyS_newfstat.system_call_fastpath
       228 =C2=B1 34%     -93.8%         14 =C2=B1 46%  latency_stats.sum.w=
ait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.hand=
le_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault.clear=
_user.padzero.load_elf_binary
 1.137e+08 =C2=B1  1%      -9.5%  1.029e+08 =C2=B1  0%  latency_stats.sum.p=
ipe_wait.pipe_write.__vfs_write.vfs_write.SyS_write.system_call_fastpath
   3.1e+08 =C2=B1  1%    +744.4%  2.617e+09 =C2=B1  0%  latency_stats.sum.f=
utex_wait_queue_me.futex_wait.do_futex.SyS_futex.system_call_fastpath
       131 =C2=B1 48%    -100.0%          0 =C2=B1  0%  latency_stats.sum.c=
all_rwsem_down_write_failed.vma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgof=
f.SyS_mmap_pgoff.SyS_mmap.system_call_fastpath
   1581442 =C2=B1  5%    +105.4%    3248689 =C2=B1 14%  latency_stats.sum.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
      0.41 =C2=B1 25%    +196.3%       1.22 =C2=B1  2%  perf-profile.cpu-cy=
cles.__schedule.schedule.schedule_preempt_disabled.cpu_startup_entry.start_=
secondary
     22.52 =C2=B1  5%     -61.9%       8.57 =C2=B1  5%  perf-profile.cpu-cy=
cles.task_tick_fair.scheduler_tick.update_process_times.tick_sched_handle.t=
ick_sched_timer
      0.54 =C2=B1 29%    +356.0%       2.48 =C2=B1  6%  perf-profile.cpu-cy=
cles.__mutex_lock_slowpath.mutex_lock.pipe_wait.pipe_write.__vfs_write
      0.54 =C2=B1 29%    +356.0%       2.48 =C2=B1  6%  perf-profile.cpu-cy=
cles.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.pipe_wait.pipe_=
write
      0.54 =C2=B1 13%    +633.2%       3.98 =C2=B1  7%  perf-profile.cpu-cy=
cles.pick_next_task_fair.__schedule.schedule.futex_wait_queue_me.futex_wait
      0.52 =C2=B1 28%    +370.0%       2.47 =C2=B1  5%  perf-profile.cpu-cy=
cles.mutex_spin_on_owner.isra.4.mutex_optimistic_spin.__mutex_lock_slowpath=
.mutex_lock.pipe_wait
      0.40 =C2=B1 11%    +785.6%       3.54 =C2=B1  6%  perf-profile.cpu-cy=
cles.load_balance.pick_next_task_fair.__schedule.schedule.futex_wait_queue_=
me
      3.99 =C2=B1  5%     +62.1%       6.46 =C2=B1  2%  perf-profile.cpu-cy=
cles.enqueue_entity.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_ac=
tivate
      1.67 =C2=B1 26%     -47.8%       0.87 =C2=B1 20%  perf-profile.cpu-cy=
cles.handle_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fa=
ult
      0.30 =C2=B1 16%    +270.2%       1.12 =C2=B1  8%  perf-profile.cpu-cy=
cles.tick_nohz_stop_sched_tick.__tick_nohz_idle_enter.tick_nohz_idle_enter.=
cpu_startup_entry.start_secondary
      7.13 =C2=B1 11%     -29.1%       5.05 =C2=B1  3%  perf-profile.cpu-cy=
cles.update_cfs_shares.task_tick_fair.scheduler_tick.update_process_times.t=
ick_sched_handle
      1.25 =C2=B1 19%    +264.3%       4.54 =C2=B1  6%  perf-profile.cpu-cy=
cles.wake_futex.futex_wake.do_futex.sys_futex.system_call_fastpath
      2.16 =C2=B1 28%    +317.7%       9.01 =C2=B1  4%  perf-profile.cpu-cy=
cles.cpuidle_enter.cpu_startup_entry.start_secondary
      1.94 =C2=B1  1%     -32.0%       1.32 =C2=B1  2%  perf-profile.cpu-cy=
cles.__do_softirq.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt
      0.57 =C2=B1 26%    +334.8%       2.50 =C2=B1  6%  perf-profile.cpu-cy=
cles.mutex_lock.pipe_wait.pipe_write.__vfs_write.vfs_write
      0.36 =C2=B1 14%    +279.9%       1.37 =C2=B1  7%  perf-profile.cpu-cy=
cles.__tick_nohz_idle_enter.tick_nohz_idle_enter.cpu_startup_entry.start_se=
condary
      1.08 =C2=B1  9%     -52.2%       0.52 =C2=B1 14%  perf-profile.cpu-cy=
cles.enqueue_task.activate_task.ttwu_do_activate.try_to_wake_up.default_wak=
e_function
      1.07 =C2=B1  9%     -51.6%       0.52 =C2=B1 15%  perf-profile.cpu-cy=
cles.activate_task.ttwu_do_activate.try_to_wake_up.default_wake_function.au=
toremove_wake_function
     32.23 =C2=B1  3%     -53.5%      15.00 =C2=B1  3%  perf-profile.cpu-cy=
cles.update_process_times.tick_sched_handle.tick_sched_timer.__run_hrtimer.=
hrtimer_interrupt
     32.57 =C2=B1  2%     -53.2%      15.24 =C2=B1  3%  perf-profile.cpu-cy=
cles.tick_sched_handle.isra.18.tick_sched_timer.__run_hrtimer.hrtimer_inter=
rupt.local_apic_timer_interrupt
      1.06 =C2=B1  9%     -36.8%       0.67 =C2=B1 10%  perf-profile.cpu-cy=
cles.account_process_tick.update_process_times.tick_sched_handle.tick_sched=
_timer.__run_hrtimer
     33.62 =C2=B1  2%     -52.8%      15.88 =C2=B1  3%  perf-profile.cpu-cy=
cles.tick_sched_timer.__run_hrtimer.hrtimer_interrupt.local_apic_timer_inte=
rrupt.smp_apic_timer_interrupt
      1.27 =C2=B1  7%     -16.3%       1.06 =C2=B1 12%  perf-profile.cpu-cy=
cles.futex_requeue.do_futex.sys_futex.system_call_fastpath
     28.27 =C2=B1  3%     -55.3%      12.64 =C2=B1  4%  perf-profile.cpu-cy=
cles.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer=
.__run_hrtimer
     35.73 =C2=B1  1%     -52.2%      17.07 =C2=B1  3%  perf-profile.cpu-cy=
cles.__run_hrtimer.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_ti=
mer_interrupt.apic_timer_interrupt
      0.41 =C2=B1 12%    +124.5%       0.92 =C2=B1 15%  perf-profile.cpu-cy=
cles.dequeue_entity.dequeue_task_fair.dequeue_task.deactivate_task.__schedu=
le
     39.41 =C2=B1  1%     -52.4%      18.74 =C2=B1  2%  perf-profile.cpu-cy=
cles.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_timer_interrupt.=
apic_timer_interrupt
     12.73 =C2=B1  6%     +11.6%      14.21 =C2=B1  2%  perf-profile.cpu-cy=
cles.vfs_write.sys_write.system_call_fastpath
     39.95 =C2=B1  1%     -52.4%      19.02 =C2=B1  3%  perf-profile.cpu-cy=
cles.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interru=
pt
     45.98 =C2=B1  1%     -51.2%      22.46 =C2=B1  2%  perf-profile.cpu-cy=
cles.apic_timer_interrupt
      0.30 =C2=B1 21%    +235.0%       1.01 =C2=B1  3%  perf-profile.cpu-cy=
cles.irq_exit.scheduler_ipi.smp_reschedule_interrupt.reschedule_interrupt.c=
puidle_enter
      1.81 =C2=B1 17%    +104.3%       3.70 =C2=B1  3%  perf-profile.cpu-cy=
cles.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate.sched_tt=
wu_pending
     43.89 =C2=B1  1%     -51.3%      21.38 =C2=B1  2%  perf-profile.cpu-cy=
cles.smp_apic_timer_interrupt.apic_timer_interrupt
      1.66 =C2=B1  6%    +322.1%       6.99 =C2=B1  5%  perf-profile.cpu-cy=
cles.futex_wait.do_futex.sys_futex.system_call_fastpath
      2.99 =C2=B1  5%     +48.1%       4.42 =C2=B1  2%  perf-profile.cpu-cy=
cles.dump_trace.save_stack_trace_tsk.__account_scheduler_latency.enqueue_en=
tity.enqueue_task_fair
      3.02 =C2=B1  4%     +47.4%       4.45 =C2=B1  2%  perf-profile.cpu-cy=
cles.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entity.enqueu=
e_task_fair.enqueue_task
      0.72 =C2=B1 20%    +210.0%       2.24 =C2=B1  7%  perf-profile.cpu-cy=
cles.ttwu_do_activate.constprop.88.try_to_wake_up.wake_up_state.wake_futex.=
futex_wake
      3.29 =C2=B1  6%     +50.0%       4.94 =C2=B1  3%  perf-profile.cpu-cy=
cles.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.enqueue_t=
ask.activate_task
      1.11 =C2=B1  9%     -47.1%       0.59 =C2=B1 11%  perf-profile.cpu-cy=
cles.clockevents_program_event.tick_program_event.hrtimer_interrupt.local_a=
pic_timer_interrupt.smp_apic_timer_interrupt
     12.63 =C2=B1  6%     +11.8%      14.12 =C2=B1  2%  perf-profile.cpu-cy=
cles.__vfs_write.vfs_write.sys_write.system_call_fastpath
      1.81 =C2=B1 32%    +354.8%       8.22 =C2=B1  4%  perf-profile.cpu-cy=
cles.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.start_secondary
      1.12 =C2=B1  6%    +171.3%       3.05 =C2=B1  5%  perf-profile.cpu-cy=
cles.pipe_wait.pipe_write.__vfs_write.vfs_write.sys_write
      1.16 =C2=B1  7%     -50.6%       0.57 =C2=B1 13%  perf-profile.cpu-cy=
cles.ttwu_do_activate.constprop.88.try_to_wake_up.default_wake_function.aut=
oremove_wake_function.__wake_up_common
     12.57 =C2=B1  6%     +12.0%      14.08 =C2=B1  2%  perf-profile.cpu-cy=
cles.pipe_write.__vfs_write.vfs_write.sys_write.system_call_fastpath
      0.40 =C2=B1 17%    +157.0%       1.01 =C2=B1 11%  perf-profile.cpu-cy=
cles.deactivate_task.__schedule.schedule.futex_wait_queue_me.futex_wait
      1.83 =C2=B1 21%     -46.3%       0.98 =C2=B1 11%  perf-profile.cpu-cy=
cles.ktime_get_update_offsets_now.hrtimer_interrupt.local_apic_timer_interr=
upt.smp_apic_timer_interrupt.apic_timer_interrupt
     12.75 =C2=B1  6%     +11.6%      14.24 =C2=B1  2%  perf-profile.cpu-cy=
cles.sys_write.system_call_fastpath
     20.55 =C2=B1  2%     +11.7%      22.95 =C2=B1  2%  perf-profile.cpu-cy=
cles.sys_read.system_call_fastpath
      1.27 =C2=B1 12%     +97.8%       2.50 =C2=B1  4%  perf-profile.cpu-cy=
cles.activate_task.ttwu_do_activate.try_to_wake_up.wake_up_state.wake_futex
      1.61 =C2=B1  6%     +43.6%       2.31 =C2=B1  6%  perf-profile.cpu-cy=
cles.__kernel_text_address.print_context_stack.dump_trace.save_stack_trace_=
tsk.__account_scheduler_latency
     20.50 =C2=B1  2%     +11.8%      22.92 =C2=B1  2%  perf-profile.cpu-cy=
cles.vfs_read.sys_read.system_call_fastpath
      1.27 =C2=B1 12%     +97.8%       2.51 =C2=B1  4%  perf-profile.cpu-cy=
cles.enqueue_task.activate_task.ttwu_do_activate.try_to_wake_up.wake_up_sta=
te
      0.27 =C2=B1 24%    +229.0%       0.88 =C2=B1 14%  perf-profile.cpu-cy=
cles.cpuidle_select.cpu_startup_entry.start_secondary
      1.19 =C2=B1 10%     -47.4%       0.62 =C2=B1  9%  perf-profile.cpu-cy=
cles.tick_program_event.hrtimer_interrupt.local_apic_timer_interrupt.smp_ap=
ic_timer_interrupt.apic_timer_interrupt
      0.39 =C2=B1 16%    +151.6%       0.99 =C2=B1 12%  perf-profile.cpu-cy=
cles.dequeue_task.deactivate_task.__schedule.schedule.futex_wait_queue_me
      0.55 =C2=B1  7%     +96.8%       1.07 =C2=B1 13%  perf-profile.cpu-cy=
cles.dequeue_task_fair.dequeue_task.deactivate_task.__schedule.schedule
     20.22 =C2=B1  2%     +12.0%      22.64 =C2=B1  2%  perf-profile.cpu-cy=
cles.pipe_read.__vfs_read.vfs_read.sys_read.system_call_fastpath
      1.78 =C2=B1 14%     -47.1%       0.94 =C2=B1  9%  perf-profile.cpu-cy=
cles.perf_event_task_tick.scheduler_tick.update_process_times.tick_sched_ha=
ndle.tick_sched_timer
      1.33 =C2=B1  8%     -43.8%       0.75 =C2=B1 15%  perf-profile.cpu-cy=
cles.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.pipe_read=
.__vfs_read
      1.39 =C2=B1  7%     -43.4%       0.79 =C2=B1 15%  perf-profile.cpu-cy=
cles.__wake_up_sync_key.pipe_read.__vfs_read.vfs_read.sys_read
      0.33 =C2=B1 48%    +309.1%       1.35 =C2=B1  7%  perf-profile.cpu-cy=
cles.tick_broadcast_oneshot_control.intel_idle.cpuidle_enter_state.cpuidle_=
enter.cpu_startup_entry
      1.32 =C2=B1  8%     -43.7%       0.74 =C2=B1 15%  perf-profile.cpu-cy=
cles.default_wake_function.autoremove_wake_function.__wake_up_common.__wake=
_up_sync_key.pipe_read
      2.37 =C2=B1  7%     +25.1%       2.97 =C2=B1  1%  perf-profile.cpu-cy=
cles.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate.try_to_w=
ake_up
      0.44 =C2=B1 25%    +207.9%       1.36 =C2=B1  3%  perf-profile.cpu-cy=
cles.schedule.schedule_preempt_disabled.cpu_startup_entry.start_secondary
      1.35 =C2=B1  8%     -43.3%       0.77 =C2=B1 15%  perf-profile.cpu-cy=
cles.__wake_up_common.__wake_up_sync_key.pipe_read.__vfs_read.vfs_read
      1.06 =C2=B1  6%     -34.0%       0.70 =C2=B1 15%  perf-profile.cpu-cy=
cles.try_to_wake_up.wake_up_state.wake_futex.futex_requeue.do_futex
      1.08 =C2=B1  7%     -33.2%       0.72 =C2=B1 15%  perf-profile.cpu-cy=
cles.wake_up_state.wake_futex.futex_requeue.do_futex.sys_futex
      0.30 =C2=B1 20%    +222.7%       0.96 =C2=B1  2%  perf-profile.cpu-cy=
cles.__do_softirq.irq_exit.scheduler_ipi.smp_reschedule_interrupt.reschedul=
e_interrupt
      0.34 =C2=B1 22%    +747.4%       2.90 =C2=B1  7%  perf-profile.cpu-cy=
cles.update_sd_lb_stats.find_busiest_group.load_balance.pick_next_task_fair=
.__schedule
      4.81 =C2=B1  6%    +185.2%      13.73 =C2=B1  5%  perf-profile.cpu-cy=
cles.sys_futex.system_call_fastpath
      0.87 =C2=B1 10%     -31.7%       0.59 =C2=B1 10%  perf-profile.cpu-cy=
cles.account_user_time.account_process_tick.update_process_times.tick_sched=
_handle.tick_sched_timer
      2.75 =C2=B1  5%     +41.7%       3.91 =C2=B1  2%  perf-profile.cpu-cy=
cles.print_context_stack.dump_trace.save_stack_trace_tsk.__account_schedule=
r_latency.enqueue_entity
      4.75 =C2=B1  6%    +186.9%      13.62 =C2=B1  5%  perf-profile.cpu-cy=
cles.do_futex.sys_futex.system_call_fastpath
      1.38 =C2=B1 25%    +187.1%       3.95 =C2=B1  3%  perf-profile.cpu-cy=
cles.sched_ttwu_pending.cpu_startup_entry.start_secondary
      1.46 =C2=B1  9%     +44.7%       2.11 =C2=B1  4%  perf-profile.cpu-cy=
cles.anon_pipe_buf_release.pipe_read.__vfs_read.vfs_read.sys_read
      0.85 =C2=B1 11%     +51.8%       1.29 =C2=B1  5%  perf-profile.cpu-cy=
cles.free_hot_cold_page.put_page.anon_pipe_buf_release.pipe_read.__vfs_read
      0.38 =C2=B1 16%    +184.1%       1.07 =C2=B1  3%  perf-profile.cpu-cy=
cles.scheduler_ipi.smp_reschedule_interrupt.reschedule_interrupt.cpuidle_en=
ter.cpu_startup_entry
     20.31 =C2=B1  2%     +12.2%      22.77 =C2=B1  2%  perf-profile.cpu-cy=
cles.__vfs_read.vfs_read.sys_read.system_call_fastpath
      5.19 =C2=B1 23%    +266.7%      19.04 =C2=B1  2%  perf-profile.cpu-cy=
cles.cpu_startup_entry.start_secondary
      1.11 =C2=B1 11%     +51.1%       1.67 =C2=B1  5%  perf-profile.cpu-cy=
cles.put_page.anon_pipe_buf_release.pipe_read.__vfs_read.vfs_read
      5.23 =C2=B1 23%    +268.5%      19.27 =C2=B1  2%  perf-profile.cpu-cy=
cles.start_secondary
      0.45 =C2=B1 23%    +209.5%       1.39 =C2=B1  3%  perf-profile.cpu-cy=
cles.schedule_preempt_disabled.cpu_startup_entry.start_secondary
      1.20 =C2=B1 18%    +252.6%       4.22 =C2=B1  7%  perf-profile.cpu-cy=
cles.try_to_wake_up.wake_up_state.wake_futex.futex_wake.do_futex
      1.29 =C2=B1 25%    +185.3%       3.69 =C2=B1  3%  perf-profile.cpu-cy=
cles.enqueue_task.activate_task.ttwu_do_activate.sched_ttwu_pending.cpu_sta=
rtup_entry
      1.76 =C2=B1 11%    +252.5%       6.20 =C2=B1  3%  perf-profile.cpu-cy=
cles.mutex_spin_on_owner.isra.4.mutex_optimistic_spin.__mutex_lock_slowpath=
.mutex_lock.pipe_read
      1.33 =C2=B1  8%    +341.8%       5.89 =C2=B1  6%  perf-profile.cpu-cy=
cles.schedule.futex_wait_queue_me.futex_wait.do_futex.sys_futex
      1.47 =C2=B1  9%     -32.4%       1.00 =C2=B1  6%  perf-profile.cpu-cy=
cles.rcu_check_callbacks.update_process_times.tick_sched_handle.tick_sched_=
timer.__run_hrtimer
      1.13 =C2=B1  5%     -30.9%       0.78 =C2=B1 15%  perf-profile.cpu-cy=
cles.wake_futex.futex_requeue.do_futex.sys_futex.system_call_fastpath
      1.35 =C2=B1  7%     -42.8%       0.78 =C2=B1 13%  perf-profile.cpu-cy=
cles.try_to_wake_up.default_wake_function.autoremove_wake_function.__wake_u=
p_common.__wake_up_sync_key
      5.13 =C2=B1  8%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.update_cfs_rq_blocked_load.task_tick_fair.scheduler_tick.update_proces=
s_times.tick_sched_handle
      2.60 =C2=B1  4%     -34.7%       1.70 =C2=B1  5%  perf-profile.cpu-cy=
cles.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt
      1.21 =C2=B1 18%    +255.4%       4.28 =C2=B1  7%  perf-profile.cpu-cy=
cles.wake_up_state.wake_futex.futex_wake.do_futex.sys_futex
      0.32 =C2=B1 29%    +332.3%       1.40 =C2=B1 10%  perf-profile.cpu-cy=
cles.tick_nohz_idle_exit.cpu_startup_entry.start_secondary
      1.41 =C2=B1  6%    +336.3%       6.16 =C2=B1  6%  perf-profile.cpu-cy=
cles.futex_wait_queue_me.futex_wait.do_futex.sys_futex.system_call_fastpath
     13.78 =C2=B1  3%     -13.5%      11.92 =C2=B1  3%  perf-profile.cpu-cy=
cles.copy_user_generic_string.copy_page_to_iter.pipe_read.__vfs_read.vfs_re=
ad
      1.29 =C2=B1  9%    +348.0%       5.79 =C2=B1  6%  perf-profile.cpu-cy=
cles.__schedule.schedule.futex_wait_queue_me.futex_wait.do_futex
     38.58 =C2=B1  3%     +32.7%      51.21 =C2=B1  0%  perf-profile.cpu-cy=
cles.system_call_fastpath
     14.53 =C2=B1  4%     -13.9%      12.51 =C2=B1  3%  perf-profile.cpu-cy=
cles.copy_page_to_iter.pipe_read.__vfs_read.vfs_read.sys_read
      1.65 =C2=B1 29%    +367.9%       7.70 =C2=B1  4%  perf-profile.cpu-cy=
cles.intel_idle.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.start_s=
econdary
      1.57 =C2=B1 16%    +240.8%       5.35 =C2=B1  6%  perf-profile.cpu-cy=
cles.futex_wake.do_futex.sys_futex.system_call_fastpath
      1.82 =C2=B1 11%    +246.0%       6.31 =C2=B1  3%  perf-profile.cpu-cy=
cles.mutex_lock.pipe_read.__vfs_read.vfs_read.sys_read
      1.32 =C2=B1 24%    +185.4%       3.78 =C2=B1  3%  perf-profile.cpu-cy=
cles.ttwu_do_activate.constprop.88.sched_ttwu_pending.cpu_startup_entry.sta=
rt_secondary
      1.28 =C2=B1 25%    +183.0%       3.63 =C2=B1  2%  perf-profile.cpu-cy=
cles.activate_task.ttwu_do_activate.sched_ttwu_pending.cpu_startup_entry.st=
art_secondary
      1.80 =C2=B1 10%    +250.3%       6.30 =C2=B1  3%  perf-profile.cpu-cy=
cles.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.pipe_read.__vfs=
_read
      1.80 =C2=B1 10%    +248.9%       6.30 =C2=B1  3%  perf-profile.cpu-cy=
cles.__mutex_lock_slowpath.mutex_lock.pipe_read.__vfs_read.vfs_read
      0.39 =C2=B1 16%    +278.2%       1.48 =C2=B1  7%  perf-profile.cpu-cy=
cles.tick_nohz_idle_enter.cpu_startup_entry.start_secondary
      0.36 =C2=B1 20%    +791.6%       3.19 =C2=B1  6%  perf-profile.cpu-cy=
cles.find_busiest_group.load_balance.pick_next_task_fair.__schedule.schedule
      7.79 =C2=B1  6%     -10.4%       6.98 =C2=B1  2%  perf-profile.cpu-cy=
cles.copy_page_from_iter.pipe_write.__vfs_write.vfs_write.sys_write
        14 =C2=B1  3%     -27.6%         10 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
       936 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.utilization_load_avg
        14 =C2=B1  5%     -26.8%         10 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.load
      4850 =C2=B1  9%     -84.1%        769 =C2=B1 15%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
    149666 =C2=B1  0%     -17.3%     123710 =C2=B1  1%  sched_debug.cfs_rq[=
0]:/.exec_clock
        59 =C2=B1 35%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.blocked_load_avg
        14 =C2=B1  7%     -34.5%          9 =C2=B1  5%  sched_debug.cfs_rq[=
10]:/.load
       951 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.utilization_load_avg
        74 =C2=B1 27%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
         8 =C2=B1 49%    +100.0%         16 =C2=B1 23%  sched_debug.cfs_rq[=
10]:/.nr_spread_over
      4601 =C2=B1 11%     -83.4%        764 =C2=B1 13%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
    143527 =C2=B1  0%     -19.5%     115574 =C2=B1  1%  sched_debug.cfs_rq[=
10]:/.exec_clock
        14 =C2=B1  5%     -26.3%         10 =C2=B1  4%  sched_debug.cfs_rq[=
10]:/.runnable_load_avg
       121 =C2=B1 46%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg_load_contrib
    144746 =C2=B1  1%     -20.4%     115216 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.exec_clock
      4597 =C2=B1 11%     -83.5%        758 =C2=B1 12%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
       965 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.utilization_load_avg
        16 =C2=B1 11%     -35.9%         10 =C2=B1 12%  sched_debug.cfs_rq[=
11]:/.load
        15 =C2=B1 12%     -33.3%         10 =C2=B1  4%  sched_debug.cfs_rq[=
11]:/.runnable_load_avg
        14 =C2=B1  3%     -24.6%         10 =C2=B1  4%  sched_debug.cfs_rq[=
12]:/.runnable_load_avg
    142635 =C2=B1  0%     -18.8%     115855 =C2=B1  1%  sched_debug.cfs_rq[=
12]:/.exec_clock
       958 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.utilization_load_avg
        14 =C2=B1  3%     -32.8%          9 =C2=B1 11%  sched_debug.cfs_rq[=
12]:/.load
      4589 =C2=B1 12%     -83.6%        752 =C2=B1 11%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
        70 =C2=B1 47%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg_load_contrib
       984 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.utilization_load_avg
      4551 =C2=B1 12%     -83.5%        752 =C2=B1 11%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
        15 =C2=B1 10%     -30.0%         10 =C2=B1  8%  sched_debug.cfs_rq[=
13]:/.runnable_load_avg
    143643 =C2=B1  0%     -19.4%     115845 =C2=B1  1%  sched_debug.cfs_rq[=
13]:/.exec_clock
        14 =C2=B1 10%     -35.6%          9 =C2=B1 15%  sched_debug.cfs_rq[=
13]:/.load
        86 =C2=B1 39%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg_load_contrib
      4544 =C2=B1 11%     -83.4%        753 =C2=B1 11%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
       969 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.utilization_load_avg
    142757 =C2=B1  0%     -18.9%     115755 =C2=B1  1%  sched_debug.cfs_rq[=
14]:/.exec_clock
        70 =C2=B1 47%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.blocked_load_avg
        14 =C2=B1 10%     -30.5%         10 =C2=B1  4%  sched_debug.cfs_rq[=
14]:/.runnable_load_avg
        15 =C2=B1 10%     -35.5%         10 =C2=B1 14%  sched_debug.cfs_rq[=
14]:/.load
        15 =C2=B1  8%     -34.4%         10 =C2=B1 10%  sched_debug.cfs_rq[=
15]:/.runnable_load_avg
      4529 =C2=B1 11%     -83.4%        753 =C2=B1 11%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
    142995 =C2=B1  0%     -19.0%     115881 =C2=B1  1%  sched_debug.cfs_rq[=
15]:/.exec_clock
       961 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.utilization_load_avg
      4515 =C2=B1 11%     -83.3%        753 =C2=B1 11%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
        16 =C2=B1  9%     -35.9%         10 =C2=B1  4%  sched_debug.cfs_rq[=
16]:/.runnable_load_avg
        15 =C2=B1  9%     -39.7%          9 =C2=B1 15%  sched_debug.cfs_rq[=
16]:/.load
       975 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.utilization_load_avg
    142733 =C2=B1  0%     -18.6%     116189 =C2=B1  1%  sched_debug.cfs_rq[=
16]:/.exec_clock
        14 =C2=B1  7%     -33.3%          9 =C2=B1  9%  sched_debug.cfs_rq[=
17]:/.load
        93 =C2=B1 40%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.tg_load_contrib
    142654 =C2=B1  0%     -18.4%     116363 =C2=B1  1%  sched_debug.cfs_rq[=
17]:/.exec_clock
      4483 =C2=B1 11%     -83.2%        754 =C2=B1 11%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
        14 =C2=B1  2%     -30.5%         10 =C2=B1  4%  sched_debug.cfs_rq[=
17]:/.runnable_load_avg
       946 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.utilization_load_avg
        78 =C2=B1 47%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.blocked_load_avg
        14 =C2=B1  5%     -23.2%         10 =C2=B1  7%  sched_debug.cfs_rq[=
18]:/.runnable_load_avg
      4484 =C2=B1 10%     -83.2%        754 =C2=B1 11%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
    142729 =C2=B1  0%     -19.0%     115549 =C2=B1  1%  sched_debug.cfs_rq[=
18]:/.exec_clock
        54 =C2=B1 48%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.blocked_load_avg
        69 =C2=B1 38%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.tg_load_contrib
       928 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.utilization_load_avg
        14 =C2=B1  9%     -35.1%          9 =C2=B1 15%  sched_debug.cfs_rq[=
18]:/.load
        15 =C2=B1 10%     -33.9%         10 =C2=B1  4%  sched_debug.cfs_rq[=
19]:/.runnable_load_avg
    142749 =C2=B1  0%     -19.2%     115271 =C2=B1  1%  sched_debug.cfs_rq[=
19]:/.exec_clock
       960 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.utilization_load_avg
        83 =C2=B1 37%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.tg_load_contrib
      4479 =C2=B1 11%     -83.1%        754 =C2=B1 11%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
        14 =C2=B1 13%     -32.2%         10 =C2=B1 10%  sched_debug.cfs_rq[=
19]:/.load
        68 =C2=B1 44%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.blocked_load_avg
        14 =C2=B1  5%     -24.6%         10 =C2=B1  4%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
        14 =C2=B1  5%     -24.6%         10 =C2=B1 13%  sched_debug.cfs_rq[=
1]:/.load
      4879 =C2=B1 10%     -84.2%        769 =C2=B1 15%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
        93 =C2=B1 38%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.blocked_load_avg
       107 =C2=B1 33%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
    142952 =C2=B1  0%     -18.9%     115989 =C2=B1  1%  sched_debug.cfs_rq[=
1]:/.exec_clock
       955 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.utilization_load_avg
        91 =C2=B1 49%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.tg_load_contrib
    142991 =C2=B1  0%     -19.3%     115464 =C2=B1  1%  sched_debug.cfs_rq[=
20]:/.exec_clock
        13 =C2=B1  3%     -20.0%         11 =C2=B1  6%  sched_debug.cfs_rq[=
20]:/.runnable_load_avg
        14 =C2=B1  5%     -35.7%          9 =C2=B1  7%  sched_debug.cfs_rq[=
20]:/.load
       962 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.utilization_load_avg
      4474 =C2=B1 11%     -83.1%        755 =C2=B1 11%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
    142721 =C2=B1  0%     -19.1%     115419 =C2=B1  1%  sched_debug.cfs_rq[=
21]:/.exec_clock
        14 =C2=B1  7%     -28.6%         10 =C2=B1 12%  sched_debug.cfs_rq[=
21]:/.load
        84 =C2=B1 23%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.tg_load_contrib
        14 =C2=B1  7%     -24.6%         10 =C2=B1  4%  sched_debug.cfs_rq[=
21]:/.runnable_load_avg
      4435 =C2=B1 11%     -83.0%        752 =C2=B1 10%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
        69 =C2=B1 27%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.blocked_load_avg
       945 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.utilization_load_avg
      4424 =C2=B1 11%     -83.0%        752 =C2=B1 10%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
    142700 =C2=B1  0%     -18.9%     115735 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.exec_clock
        14 =C2=B1  7%     -33.3%          9 =C2=B1  5%  sched_debug.cfs_rq[=
22]:/.load
        14 =C2=B1  5%     -24.6%         10 =C2=B1  4%  sched_debug.cfs_rq[=
22]:/.runnable_load_avg
        42 =C2=B1 35%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.tg_load_contrib
       970 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.utilization_load_avg
        13 =C2=B1  6%     -18.5%         11 =C2=B1 11%  sched_debug.cfs_rq[=
23]:/.runnable_load_avg
       924 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.utilization_load_avg
         6 =C2=B1 30%    +268.0%         23 =C2=B1 29%  sched_debug.cfs_rq[=
23]:/.nr_spread_over
        14 =C2=B1  5%     -39.3%          8 =C2=B1 13%  sched_debug.cfs_rq[=
23]:/.load
    142864 =C2=B1  0%     -18.7%     116159 =C2=B1  1%  sched_debug.cfs_rq[=
23]:/.exec_clock
      4410 =C2=B1 11%     -82.9%        753 =C2=B1 10%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
        14 =C2=B1  3%     -24.1%         11 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.runnable_load_avg
    142964 =C2=B1  0%     -18.9%     116008 =C2=B1  1%  sched_debug.cfs_rq[=
24]:/.exec_clock
      4386 =C2=B1 11%     -82.8%        753 =C2=B1 10%  sched_debug.cfs_rq[=
24]:/.tg_load_avg
       118 =C2=B1 49%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.blocked_load_avg
       968 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.utilization_load_avg
       134 =C2=B1 43%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.tg_load_contrib
         6 =C2=B1 46%    +188.9%         19 =C2=B1 46%  sched_debug.cfs_rq[=
24]:/.nr_spread_over
        14 =C2=B1  3%     -29.3%         10 =C2=B1  4%  sched_debug.cfs_rq[=
25]:/.runnable_load_avg
    142996 =C2=B1  0%     -17.9%     117411 =C2=B1  2%  sched_debug.cfs_rq[=
25]:/.exec_clock
      4351 =C2=B1 11%     -82.7%        752 =C2=B1 10%  sched_debug.cfs_rq[=
25]:/.tg_load_avg
       968 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.utilization_load_avg
        62 =C2=B1 41%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.tg_load_contrib
        14 =C2=B1  5%     -37.3%          9 =C2=B1 14%  sched_debug.cfs_rq[=
25]:/.load
      4319 =C2=B1 10%     -82.6%        752 =C2=B1 10%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
        14 =C2=B1 10%     -31.0%         10 =C2=B1 10%  sched_debug.cfs_rq[=
26]:/.load
       944 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.utilization_load_avg
        68 =C2=B1 45%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.tg_load_contrib
    142832 =C2=B1  0%     -18.1%     117001 =C2=B1  2%  sched_debug.cfs_rq[=
26]:/.exec_clock
        14 =C2=B1  5%     -29.3%         10 =C2=B1  4%  sched_debug.cfs_rq[=
26]:/.runnable_load_avg
    142765 =C2=B1  0%     -18.6%     116191 =C2=B1  1%  sched_debug.cfs_rq[=
27]:/.exec_clock
      4280 =C2=B1 11%     -82.4%        751 =C2=B1 10%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
        14 =C2=B1  5%     -30.5%         10 =C2=B1  4%  sched_debug.cfs_rq[=
27]:/.runnable_load_avg
       950 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.utilization_load_avg
        14 =C2=B1  7%     -28.1%         10 =C2=B1  4%  sched_debug.cfs_rq[=
28]:/.runnable_load_avg
    143159 =C2=B1  0%     -18.6%     116593 =C2=B1  1%  sched_debug.cfs_rq[=
28]:/.exec_clock
        52 =C2=B1 46%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.blocked_load_avg
       947 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.utilization_load_avg
      4275 =C2=B1 11%     -82.4%        750 =C2=B1 10%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
        15 =C2=B1 12%     -38.3%          9 =C2=B1 14%  sched_debug.cfs_rq[=
28]:/.load
        67 =C2=B1 36%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.tg_load_contrib
        14 =C2=B1  5%     -27.1%         10 =C2=B1  4%  sched_debug.cfs_rq[=
29]:/.runnable_load_avg
        97 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.blocked_load_avg
       112 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.tg_load_contrib
       956 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.utilization_load_avg
      4205 =C2=B1  9%     -82.1%        750 =C2=B1 10%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
        13 =C2=B1  6%     -23.6%         10 =C2=B1 19%  sched_debug.cfs_rq[=
29]:/.load
    142927 =C2=B1  0%     -18.7%     116233 =C2=B1  1%  sched_debug.cfs_rq[=
29]:/.exec_clock
      4855 =C2=B1 10%     -84.1%        770 =C2=B1 15%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
        78 =C2=B1 34%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
        64 =C2=B1 42%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.blocked_load_avg
       948 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.utilization_load_avg
    142729 =C2=B1  0%     -18.8%     115944 =C2=B1  1%  sched_debug.cfs_rq[=
2]:/.exec_clock
      4173 =C2=B1  7%     -82.0%        750 =C2=B1 10%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
       949 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.utilization_load_avg
        14 =C2=B1  5%     -42.1%          8 =C2=B1 13%  sched_debug.cfs_rq[=
30]:/.load
    142883 =C2=B1  0%     -18.7%     116230 =C2=B1  1%  sched_debug.cfs_rq[=
30]:/.exec_clock
        14 =C2=B1  5%     -25.0%         10 =C2=B1  4%  sched_debug.cfs_rq[=
30]:/.runnable_load_avg
         5 =C2=B1 18%    +182.6%         16 =C2=B1 44%  sched_debug.cfs_rq[=
31]:/.nr_spread_over
        14 =C2=B1  5%     -33.9%          9 =C2=B1  8%  sched_debug.cfs_rq[=
31]:/.load
        68 =C2=B1 29%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.tg_load_contrib
       945 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.utilization_load_avg
        53 =C2=B1 36%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.blocked_load_avg
        14 =C2=B1  5%     -29.8%         10 =C2=B1  7%  sched_debug.cfs_rq[=
31]:/.runnable_load_avg
    142780 =C2=B1  0%     -18.6%     116266 =C2=B1  1%  sched_debug.cfs_rq[=
31]:/.exec_clock
      4148 =C2=B1  7%     -81.9%        750 =C2=B1 10%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
      4141 =C2=B1  7%     -81.9%        750 =C2=B1 10%  sched_debug.cfs_rq[=
32]:/.tg_load_avg
        13 =C2=B1  6%     -27.3%         10 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.runnable_load_avg
   9604126 =C2=B1  0%     -13.2%    8340155 =C2=B1  1%  sched_debug.cfs_rq[=
32]:/.min_vruntime
       963 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.utilization_load_avg
        14 =C2=B1  7%     -39.3%          8 =C2=B1 17%  sched_debug.cfs_rq[=
32]:/.load
    142960 =C2=B1  0%     -23.1%     109925 =C2=B1  1%  sched_debug.cfs_rq[=
32]:/.exec_clock
       968 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.utilization_load_avg
        14 =C2=B1  3%     -26.3%         10 =C2=B1  4%  sched_debug.cfs_rq[=
33]:/.runnable_load_avg
        13 =C2=B1  6%     -38.2%          8 =C2=B1 13%  sched_debug.cfs_rq[=
33]:/.load
    143024 =C2=B1  0%     -23.2%     109824 =C2=B1  1%  sched_debug.cfs_rq[=
33]:/.exec_clock
      4113 =C2=B1  7%     -81.8%        750 =C2=B1 10%  sched_debug.cfs_rq[=
33]:/.tg_load_avg
   9591369 =C2=B1  0%     -13.5%    8301137 =C2=B1  1%  sched_debug.cfs_rq[=
33]:/.min_vruntime
    142926 =C2=B1  0%     -22.7%     110486 =C2=B1  1%  sched_debug.cfs_rq[=
34]:/.exec_clock
   9586520 =C2=B1  0%     -12.5%    8385635 =C2=B1  1%  sched_debug.cfs_rq[=
34]:/.min_vruntime
        13 =C2=B1  3%     -24.5%         10 =C2=B1  7%  sched_debug.cfs_rq[=
34]:/.runnable_load_avg
      4089 =C2=B1  7%     -81.7%        750 =C2=B1 10%  sched_debug.cfs_rq[=
34]:/.tg_load_avg
        47 =C2=B1 44%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.tg_load_contrib
       942 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.utilization_load_avg
        13 =C2=B1  3%     -30.2%          9 =C2=B1  8%  sched_debug.cfs_rq[=
34]:/.load
    143196 =C2=B1  0%     -23.3%     109775 =C2=B1  1%  sched_debug.cfs_rq[=
35]:/.exec_clock
   9593365 =C2=B1  0%     -12.8%    8362919 =C2=B1  2%  sched_debug.cfs_rq[=
35]:/.min_vruntime
        14 =C2=B1  0%     -26.8%         10 =C2=B1  4%  sched_debug.cfs_rq[=
35]:/.runnable_load_avg
      4092 =C2=B1  7%     -81.7%        749 =C2=B1 10%  sched_debug.cfs_rq[=
35]:/.tg_load_avg
       944 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.utilization_load_avg
      4083 =C2=B1  7%     -81.6%        749 =C2=B1 10%  sched_debug.cfs_rq[=
36]:/.tg_load_avg
    142862 =C2=B1  0%     -22.9%     110159 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.exec_clock
       934 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.utilization_load_avg
        14 =C2=B1 11%     -35.1%          9 =C2=B1  4%  sched_debug.cfs_rq[=
36]:/.load
   9584087 =C2=B1  0%     -12.9%    8351358 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.min_vruntime
        13 =C2=B1  6%     -30.9%          9 =C2=B1  5%  sched_debug.cfs_rq[=
36]:/.runnable_load_avg
       963 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.utilization_load_avg
      4096 =C2=B1  8%     -81.7%        748 =C2=B1 10%  sched_debug.cfs_rq[=
37]:/.tg_load_avg
   9581773 =C2=B1  0%     -13.1%    8330912 =C2=B1  1%  sched_debug.cfs_rq[=
37]:/.min_vruntime
    142787 =C2=B1  0%     -23.0%     109956 =C2=B1  1%  sched_debug.cfs_rq[=
37]:/.exec_clock
        14 =C2=B1  5%     -28.6%         10 =C2=B1  7%  sched_debug.cfs_rq[=
37]:/.runnable_load_avg
        13 =C2=B1  3%     -32.7%          9 =C2=B1  8%  sched_debug.cfs_rq[=
37]:/.load
        14 =C2=B1  3%     -34.5%          9 =C2=B1  5%  sched_debug.cfs_rq[=
38]:/.runnable_load_avg
       959 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.utilization_load_avg
   9602528 =C2=B1  0%     -13.3%    8321364 =C2=B1  1%  sched_debug.cfs_rq[=
38]:/.min_vruntime
        59 =C2=B1 22%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.tg_load_contrib
        14 =C2=B1  3%     -41.4%          8 =C2=B1 13%  sched_debug.cfs_rq[=
38]:/.load
    142952 =C2=B1  0%     -23.2%     109718 =C2=B1  1%  sched_debug.cfs_rq[=
38]:/.exec_clock
        44 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.blocked_load_avg
      4096 =C2=B1 10%     -81.7%        748 =C2=B1 10%  sched_debug.cfs_rq[=
38]:/.tg_load_avg
        47 =C2=B1 41%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.blocked_load_avg
       963 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.utilization_load_avg
        14 =C2=B1  0%     -33.9%          9 =C2=B1  8%  sched_debug.cfs_rq[=
39]:/.load
        14 =C2=B1  3%     -28.1%         10 =C2=B1  4%  sched_debug.cfs_rq[=
39]:/.runnable_load_avg
        62 =C2=B1 31%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.tg_load_contrib
    142892 =C2=B1  0%     -22.9%     110233 =C2=B1  1%  sched_debug.cfs_rq[=
39]:/.exec_clock
      4089 =C2=B1 10%     -81.7%        748 =C2=B1  9%  sched_debug.cfs_rq[=
39]:/.tg_load_avg
   9563215 =C2=B1  0%     -12.6%    8356120 =C2=B1  1%  sched_debug.cfs_rq[=
39]:/.min_vruntime
    142636 =C2=B1  0%     -18.5%     116193 =C2=B1  1%  sched_debug.cfs_rq[=
3]:/.exec_clock
      4779 =C2=B1 12%     -83.9%        770 =C2=B1 15%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
        14 =C2=B1  5%     -28.6%         10 =C2=B1  7%  sched_debug.cfs_rq[=
3]:/.load
        36 =C2=B1 43%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
        13 =C2=B1  3%     -21.8%         10 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
       938 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.utilization_load_avg
        14 =C2=B1  5%     -42.1%          8 =C2=B1 15%  sched_debug.cfs_rq[=
40]:/.load
        14 =C2=B1  7%     -31.0%         10 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.runnable_load_avg
   9581440 =C2=B1  0%     -12.3%    8398863 =C2=B1  1%  sched_debug.cfs_rq[=
40]:/.min_vruntime
      4068 =C2=B1 10%     -81.6%        747 =C2=B1  9%  sched_debug.cfs_rq[=
40]:/.tg_load_avg
       979 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.utilization_load_avg
    142879 =C2=B1  0%     -22.5%     110697 =C2=B1  1%  sched_debug.cfs_rq[=
40]:/.exec_clock
       940 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.utilization_load_avg
    142941 =C2=B1  0%     -23.3%     109699 =C2=B1  1%  sched_debug.cfs_rq[=
41]:/.exec_clock
        30 =C2=B1 44%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.tg_load_contrib
      4072 =C2=B1 10%     -81.7%        747 =C2=B1  9%  sched_debug.cfs_rq[=
41]:/.tg_load_avg
        13 =C2=B1  6%     -38.2%          8 =C2=B1 17%  sched_debug.cfs_rq[=
41]:/.load
   9583957 =C2=B1  0%     -13.1%    8332859 =C2=B1  1%  sched_debug.cfs_rq[=
41]:/.min_vruntime
        13 =C2=B1  3%     -27.3%         10 =C2=B1  7%  sched_debug.cfs_rq[=
41]:/.runnable_load_avg
        15 =C2=B1  6%     -46.7%          8 =C2=B1 23%  sched_debug.cfs_rq[=
42]:/.load
       984 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.utilization_load_avg
    142998 =C2=B1  0%     -22.7%     110471 =C2=B1  1%  sched_debug.cfs_rq[=
42]:/.exec_clock
      4043 =C2=B1 11%     -81.5%        746 =C2=B1  9%  sched_debug.cfs_rq[=
42]:/.tg_load_avg
        15 =C2=B1  5%     -34.4%         10 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.runnable_load_avg
   9592620 =C2=B1  0%     -12.7%    8378446 =C2=B1  1%  sched_debug.cfs_rq[=
42]:/.min_vruntime
      4050 =C2=B1 12%     -81.6%        746 =C2=B1  9%  sched_debug.cfs_rq[=
43]:/.tg_load_avg
   9586033 =C2=B1  0%     -13.0%    8335645 =C2=B1  1%  sched_debug.cfs_rq[=
43]:/.min_vruntime
        14 =C2=B1  5%     -31.0%         10 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.runnable_load_avg
        14 =C2=B1  5%     -47.5%          7 =C2=B1  5%  sched_debug.cfs_rq[=
43]:/.load
       964 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.utilization_load_avg
    143013 =C2=B1  0%     -22.9%     110192 =C2=B1  1%  sched_debug.cfs_rq[=
43]:/.exec_clock
       961 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.utilization_load_avg
        14 =C2=B1  5%     -26.3%         10 =C2=B1  8%  sched_debug.cfs_rq[=
44]:/.runnable_load_avg
        14 =C2=B1  5%     -40.4%          8 =C2=B1 21%  sched_debug.cfs_rq[=
44]:/.load
    142914 =C2=B1  0%     -22.9%     110172 =C2=B1  1%  sched_debug.cfs_rq[=
44]:/.exec_clock
   9595791 =C2=B1  0%     -12.9%    8354769 =C2=B1  1%  sched_debug.cfs_rq[=
44]:/.min_vruntime
      4051 =C2=B1 11%     -81.6%        746 =C2=B1  9%  sched_debug.cfs_rq[=
44]:/.tg_load_avg
   9589932 =C2=B1  0%     -13.0%    8344377 =C2=B1  1%  sched_debug.cfs_rq[=
45]:/.min_vruntime
        14 =C2=B1  5%     -30.4%          9 =C2=B1  4%  sched_debug.cfs_rq[=
45]:/.runnable_load_avg
    143041 =C2=B1  0%     -22.2%     111261 =C2=B1  3%  sched_debug.cfs_rq[=
45]:/.exec_clock
        46 =C2=B1 34%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.tg_load_contrib
      4056 =C2=B1 11%     -81.6%        746 =C2=B1  9%  sched_debug.cfs_rq[=
45]:/.tg_load_avg
        14 =C2=B1  7%     -41.4%          8 =C2=B1 10%  sched_debug.cfs_rq[=
45]:/.load
       942 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.utilization_load_avg
      4056 =C2=B1 11%     -81.6%        746 =C2=B1  9%  sched_debug.cfs_rq[=
46]:/.tg_load_avg
   9595201 =C2=B1  0%     -13.2%    8331965 =C2=B1  1%  sched_debug.cfs_rq[=
46]:/.min_vruntime
        14 =C2=B1  3%     -34.5%          9 =C2=B1  5%  sched_debug.cfs_rq[=
46]:/.runnable_load_avg
        62 =C2=B1 17%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.blocked_load_avg
       959 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.utilization_load_avg
        77 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.tg_load_contrib
        13 =C2=B1  3%     -41.8%          8 =C2=B1 15%  sched_debug.cfs_rq[=
46]:/.load
    142914 =C2=B1  0%     -23.0%     110055 =C2=B1  1%  sched_debug.cfs_rq[=
46]:/.exec_clock
   9579237 =C2=B1  0%     -13.1%    8322157 =C2=B1  1%  sched_debug.cfs_rq[=
47]:/.min_vruntime
      4094 =C2=B1 12%     -81.8%        747 =C2=B1  9%  sched_debug.cfs_rq[=
47]:/.tg_load_avg
    142989 =C2=B1  0%     -23.0%     110124 =C2=B1  1%  sched_debug.cfs_rq[=
47]:/.exec_clock
       945 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.utilization_load_avg
        13 =C2=B1  6%     -38.9%          8 =C2=B1 10%  sched_debug.cfs_rq[=
47]:/.load
        14 =C2=B1  8%     -30.4%          9 =C2=B1  4%  sched_debug.cfs_rq[=
47]:/.runnable_load_avg
   9583731 =C2=B1  0%     -13.1%    8327758 =C2=B1  1%  sched_debug.cfs_rq[=
48]:/.min_vruntime
    142905 =C2=B1  0%     -22.4%     110964 =C2=B1  1%  sched_debug.cfs_rq[=
48]:/.exec_clock
        13 =C2=B1  3%     -24.1%         10 =C2=B1  4%  sched_debug.cfs_rq[=
48]:/.runnable_load_avg
       917 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.utilization_load_avg
        13 =C2=B1  6%     -30.2%          9 =C2=B1 20%  sched_debug.cfs_rq[=
48]:/.load
        51 =C2=B1 45%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.tg_load_contrib
      4063 =C2=B1 12%     -81.6%        747 =C2=B1  9%  sched_debug.cfs_rq[=
48]:/.tg_load_avg
        13 =C2=B1  3%     -29.1%          9 =C2=B1  8%  sched_debug.cfs_rq[=
49]:/.runnable_load_avg
        33 =C2=B1 42%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.blocked_load_avg
      4052 =C2=B1 12%     -81.6%        746 =C2=B1  9%  sched_debug.cfs_rq[=
49]:/.tg_load_avg
   9603241 =C2=B1  0%     -12.9%    8365083 =C2=B1  1%  sched_debug.cfs_rq[=
49]:/.min_vruntime
        13 =C2=B1  3%     -35.2%          8 =C2=B1 14%  sched_debug.cfs_rq[=
49]:/.load
        47 =C2=B1 29%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.tg_load_contrib
    142992 =C2=B1  0%     -23.1%     110022 =C2=B1  1%  sched_debug.cfs_rq[=
49]:/.exec_clock
       922 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.utilization_load_avg
    142939 =C2=B1  0%     -18.3%     116733 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.exec_clock
       949 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.utilization_load_avg
        13 =C2=B1  3%     -23.6%         10 =C2=B1  8%  sched_debug.cfs_rq[=
4]:/.runnable_load_avg
        60 =C2=B1 35%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
      4703 =C2=B1 12%     -83.6%        770 =C2=B1 15%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
        13 =C2=B1  3%     -25.5%         10 =C2=B1  8%  sched_debug.cfs_rq[=
4]:/.load
        74 =C2=B1 28%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
      4043 =C2=B1 12%     -81.5%        746 =C2=B1  9%  sched_debug.cfs_rq[=
50]:/.tg_load_avg
        14 =C2=B1 11%     -40.4%          8 =C2=B1 17%  sched_debug.cfs_rq[=
50]:/.load
        52 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.tg_load_contrib
    142825 =C2=B1  0%     -23.5%     109276 =C2=B1  1%  sched_debug.cfs_rq[=
50]:/.exec_clock
       929 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.utilization_load_avg
        37 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.blocked_load_avg
   9575580 =C2=B1  0%     -13.5%    8282955 =C2=B1  1%  sched_debug.cfs_rq[=
50]:/.min_vruntime
        14 =C2=B1 10%     -34.5%          9 =C2=B1  5%  sched_debug.cfs_rq[=
50]:/.runnable_load_avg
        13 =C2=B1  3%     -40.7%          8 =C2=B1 17%  sched_debug.cfs_rq[=
51]:/.load
        13 =C2=B1  3%     -27.8%          9 =C2=B1  8%  sched_debug.cfs_rq[=
51]:/.runnable_load_avg
   9592803 =C2=B1  0%     -12.9%    8356128 =C2=B1  1%  sched_debug.cfs_rq[=
51]:/.min_vruntime
    142861 =C2=B1  0%     -22.9%     110133 =C2=B1  1%  sched_debug.cfs_rq[=
51]:/.exec_clock
      4055 =C2=B1 12%     -81.6%        745 =C2=B1  9%  sched_debug.cfs_rq[=
51]:/.tg_load_avg
       923 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.utilization_load_avg
        14 =C2=B1  5%     -30.4%          9 =C2=B1  8%  sched_debug.cfs_rq[=
52]:/.runnable_load_avg
      4047 =C2=B1 12%     -81.6%        745 =C2=B1  9%  sched_debug.cfs_rq[=
52]:/.tg_load_avg
   9583802 =C2=B1  0%     -13.0%    8339035 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.min_vruntime
       945 =C2=B1  6%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.utilization_load_avg
        13 =C2=B1  6%     -38.9%          8 =C2=B1 26%  sched_debug.cfs_rq[=
52]:/.load
    142934 =C2=B1  0%     -23.0%     109993 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.exec_clock
   9600421 =C2=B1  0%     -12.6%    8390692 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.min_vruntime
        14 =C2=B1  2%     -33.9%          9 =C2=B1  4%  sched_debug.cfs_rq[=
53]:/.runnable_load_avg
      4041 =C2=B1 13%     -81.6%        745 =C2=B1  9%  sched_debug.cfs_rq[=
53]:/.tg_load_avg
        38 =C2=B1 48%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.tg_load_contrib
    142968 =C2=B1  0%     -22.7%     110490 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.exec_clock
        14 =C2=B1  3%     -36.2%          9 =C2=B1 14%  sched_debug.cfs_rq[=
53]:/.load
      1002 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.utilization_load_avg
       948 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.utilization_load_avg
        13 =C2=B1  6%     -30.9%          9 =C2=B1  5%  sched_debug.cfs_rq[=
54]:/.runnable_load_avg
      4023 =C2=B1 13%     -81.5%        745 =C2=B1  9%  sched_debug.cfs_rq[=
54]:/.tg_load_avg
        83 =C2=B1 43%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.tg_load_contrib
        13 =C2=B1  6%     -38.2%          8 =C2=B1  5%  sched_debug.cfs_rq[=
54]:/.load
    142953 =C2=B1  0%     -23.0%     110018 =C2=B1  1%  sched_debug.cfs_rq[=
54]:/.exec_clock
   9597890 =C2=B1  0%     -12.7%    8376139 =C2=B1  1%  sched_debug.cfs_rq[=
54]:/.min_vruntime
        13 =C2=B1  6%     -34.5%          9 =C2=B1  7%  sched_debug.cfs_rq[=
55]:/.load
    142898 =C2=B1  0%     -23.3%     109542 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.exec_clock
        13 =C2=B1  3%     -27.8%          9 =C2=B1  4%  sched_debug.cfs_rq[=
55]:/.runnable_load_avg
        22 =C2=B1 41%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.tg_load_contrib
   9571172 =C2=B1  0%     -13.2%    8310607 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.min_vruntime
       944 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.utilization_load_avg
      4015 =C2=B1 13%     -81.5%        744 =C2=B1  9%  sched_debug.cfs_rq[=
55]:/.tg_load_avg
        14 =C2=B1  8%     -39.3%          8 =C2=B1 10%  sched_debug.cfs_rq[=
56]:/.load
    143089 =C2=B1  0%     -22.9%     110304 =C2=B1  1%  sched_debug.cfs_rq[=
56]:/.exec_clock
   9598931 =C2=B1  0%     -13.1%    8345381 =C2=B1  1%  sched_debug.cfs_rq[=
56]:/.min_vruntime
       960 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
56]:/.utilization_load_avg
        33 =C2=B1 42%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
56]:/.tg_load_contrib
        14 =C2=B1  7%     -30.4%          9 =C2=B1  4%  sched_debug.cfs_rq[=
56]:/.runnable_load_avg
      4026 =C2=B1 14%     -81.5%        744 =C2=B1  9%  sched_debug.cfs_rq[=
56]:/.tg_load_avg
   9588434 =C2=B1  0%     -13.1%    8336741 =C2=B1  1%  sched_debug.cfs_rq[=
57]:/.min_vruntime
        43 =C2=B1 39%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
57]:/.tg_load_contrib
       936 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
57]:/.utilization_load_avg
    142957 =C2=B1  0%     -23.2%     109850 =C2=B1  0%  sched_debug.cfs_rq[=
57]:/.exec_clock
      4019 =C2=B1 14%     -81.5%        742 =C2=B1  9%  sched_debug.cfs_rq[=
57]:/.tg_load_avg
        13 =C2=B1  3%     -30.9%          9 =C2=B1  5%  sched_debug.cfs_rq[=
57]:/.runnable_load_avg
       960 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
58]:/.utilization_load_avg
        14 =C2=B1  3%     -31.0%         10 =C2=B1  0%  sched_debug.cfs_rq[=
58]:/.runnable_load_avg
   9594638 =C2=B1  0%     -13.0%    8350105 =C2=B1  1%  sched_debug.cfs_rq[=
58]:/.min_vruntime
        57 =C2=B1 39%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
58]:/.tg_load_contrib
    142941 =C2=B1  0%     -22.8%     110420 =C2=B1  1%  sched_debug.cfs_rq[=
58]:/.exec_clock
      4022 =C2=B1 13%     -81.5%        743 =C2=B1  9%  sched_debug.cfs_rq[=
58]:/.tg_load_avg
        14 =C2=B1  5%     -41.4%          8 =C2=B1 13%  sched_debug.cfs_rq[=
58]:/.load
        14 =C2=B1  0%     -28.6%         10 =C2=B1  7%  sched_debug.cfs_rq[=
59]:/.runnable_load_avg
        14 =C2=B1  0%     -35.7%          9 =C2=B1 15%  sched_debug.cfs_rq[=
59]:/.load
       968 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
59]:/.utilization_load_avg
        53 =C2=B1 43%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
59]:/.tg_load_contrib
      4016 =C2=B1 14%     -81.5%        742 =C2=B1  9%  sched_debug.cfs_rq[=
59]:/.tg_load_avg
    143046 =C2=B1  0%     -22.9%     110228 =C2=B1  1%  sched_debug.cfs_rq[=
59]:/.exec_clock
   9594718 =C2=B1  0%     -12.9%    8358121 =C2=B1  1%  sched_debug.cfs_rq[=
59]:/.min_vruntime
        63 =C2=B1 47%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
       920 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.utilization_load_avg
    142540 =C2=B1  0%     -18.9%     115610 =C2=B1  1%  sched_debug.cfs_rq[=
5]:/.exec_clock
      4696 =C2=B1 12%     -83.6%        770 =C2=B1 15%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
        14 =C2=B1  5%     -26.8%         10 =C2=B1  4%  sched_debug.cfs_rq[=
5]:/.runnable_load_avg
    143056 =C2=B1  0%     -22.8%     110429 =C2=B1  1%  sched_debug.cfs_rq[=
60]:/.exec_clock
        14 =C2=B1  5%     -28.1%         10 =C2=B1  4%  sched_debug.cfs_rq[=
60]:/.runnable_load_avg
   9597950 =C2=B1  0%     -12.8%    8366607 =C2=B1  0%  sched_debug.cfs_rq[=
60]:/.min_vruntime
       940 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
60]:/.utilization_load_avg
        14 =C2=B1  5%     -43.9%          8 =C2=B1  8%  sched_debug.cfs_rq[=
60]:/.load
      3982 =C2=B1 15%     -81.4%        742 =C2=B1  9%  sched_debug.cfs_rq[=
60]:/.tg_load_avg
        14 =C2=B1  3%     -26.3%         10 =C2=B1  4%  sched_debug.cfs_rq[=
61]:/.runnable_load_avg
       951 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
61]:/.utilization_load_avg
        38 =C2=B1 36%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
61]:/.tg_load_contrib
   9601058 =C2=B1  0%     -13.0%    8352950 =C2=B1  1%  sched_debug.cfs_rq[=
61]:/.min_vruntime
      3969 =C2=B1 15%     -81.3%        742 =C2=B1  9%  sched_debug.cfs_rq[=
61]:/.tg_load_avg
    143089 =C2=B1  0%     -23.1%     110084 =C2=B1  1%  sched_debug.cfs_rq[=
61]:/.exec_clock
        14 =C2=B1  5%     -39.3%          8 =C2=B1 19%  sched_debug.cfs_rq[=
61]:/.load
   9593570 =C2=B1  0%     -12.6%    8383474 =C2=B1  1%  sched_debug.cfs_rq[=
62]:/.min_vruntime
        49 =C2=B1 26%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
62]:/.tg_load_contrib
       920 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
62]:/.utilization_load_avg
        14 =C2=B1  5%     -28.6%         10 =C2=B1  7%  sched_debug.cfs_rq[=
62]:/.runnable_load_avg
        34 =C2=B1 37%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
62]:/.blocked_load_avg
    143017 =C2=B1  0%     -22.8%     110436 =C2=B1  1%  sched_debug.cfs_rq[=
62]:/.exec_clock
      3967 =C2=B1 15%     -81.3%        742 =C2=B1  9%  sched_debug.cfs_rq[=
62]:/.tg_load_avg
        14 =C2=B1  5%     -39.3%          8 =C2=B1 10%  sched_debug.cfs_rq[=
62]:/.load
        14 =C2=B1  0%     -37.5%          8 =C2=B1  4%  sched_debug.cfs_rq[=
63]:/.load
       930 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
63]:/.utilization_load_avg
   9570329 =C2=B1  0%     -13.0%    8330510 =C2=B1  1%  sched_debug.cfs_rq[=
63]:/.min_vruntime
      3969 =C2=B1 15%     -81.3%        741 =C2=B1  9%  sched_debug.cfs_rq[=
63]:/.tg_load_avg
        14 =C2=B1  0%     -32.1%          9 =C2=B1  5%  sched_debug.cfs_rq[=
63]:/.runnable_load_avg
    143128 =C2=B1  0%     -22.4%     111121 =C2=B1  1%  sched_debug.cfs_rq[=
63]:/.exec_clock
        61 =C2=B1 41%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
       951 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.utilization_load_avg
        15 =C2=B1  6%     -35.0%          9 =C2=B1 19%  sched_debug.cfs_rq[=
6]:/.load
      4669 =C2=B1 12%     -83.5%        770 =C2=B1 15%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
         5 =C2=B1 41%    +154.5%         14 =C2=B1 20%  sched_debug.cfs_rq[=
6]:/.nr_spread_over
    142485 =C2=B1  0%     -18.8%     115703 =C2=B1  1%  sched_debug.cfs_rq[=
6]:/.exec_clock
        14 =C2=B1  7%     -24.6%         10 =C2=B1  4%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
      4626 =C2=B1 11%     -83.4%        767 =C2=B1 14%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
        14 =C2=B1  3%     -26.3%         10 =C2=B1  4%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
       974 =C2=B1  4%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.utilization_load_avg
         4 =C2=B1 46%    +143.8%          9 =C2=B1 36%  sched_debug.cfs_rq[=
7]:/.nr_spread_over
        14 =C2=B1  3%     -36.8%          9 =C2=B1 19%  sched_debug.cfs_rq[=
7]:/.load
        56 =C2=B1 45%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
    142781 =C2=B1  0%     -18.7%     116026 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.exec_clock
       162 =C2=B1 26%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.blocked_load_avg
    147352 =C2=B1  1%     -21.3%     116014 =C2=B1  1%  sched_debug.cfs_rq[=
8]:/.exec_clock
       178 =C2=B1 23%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
      4611 =C2=B1 11%     -83.3%        768 =C2=B1 14%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
      1007 =C2=B1  3%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.utilization_load_avg
        15 =C2=B1  4%     -35.0%          9 =C2=B1  8%  sched_debug.cfs_rq[=
8]:/.load
        15 =C2=B1  5%     -31.1%         10 =C2=B1  4%  sched_debug.cfs_rq[=
8]:/.runnable_load_avg
       111 =C2=B1 22%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg_load_contrib
        14 =C2=B1  3%     -26.3%         10 =C2=B1  4%  sched_debug.cfs_rq[=
9]:/.runnable_load_avg
        14 =C2=B1  2%     -28.8%         10 =C2=B1  8%  sched_debug.cfs_rq[=
9]:/.load
      4603 =C2=B1 11%     -83.4%        764 =C2=B1 13%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
    142730 =C2=B1  0%     -18.9%     115809 =C2=B1  1%  sched_debug.cfs_rq[=
9]:/.exec_clock
       965 =C2=B1  1%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.utilization_load_avg
        14 =C2=B1 17%     -48.3%          7 =C2=B1 14%  sched_debug.cfs_rq[=
9]:/.nr_spread_over
        96 =C2=B1 25%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.blocked_load_avg
    459950 =C2=B1  8%     +26.5%     581670 =C2=B1  2%  sched_debug.cpu#0.a=
vg_idle
      5114 =C2=B1  3%     -15.0%       4345 =C2=B1  6%  sched_debug.cpu#0.c=
urr->pid
        14 =C2=B1  5%     -41.4%          8 =C2=B1  5%  sched_debug.cpu#0.c=
pu_load[1]
     54423 =C2=B1  2%    +115.2%     117124 =C2=B1  2%  sched_debug.cpu#0.s=
ched_count
        15 =C2=B1  5%     -39.3%          9 =C2=B1  4%  sched_debug.cpu#0.c=
pu_load[4]
        14 =C2=B1  3%     -38.6%          8 =C2=B1  4%  sched_debug.cpu#0.c=
pu_load[0]
     24243 =C2=B1  9%    +135.3%      57041 =C2=B1  3%  sched_debug.cpu#0.t=
twu_count
      8240 =C2=B1  6%    +442.7%      44723 =C2=B1  3%  sched_debug.cpu#0.s=
ched_goidle
     40005 =C2=B1 12%    +155.6%     102241 =C2=B1  3%  sched_debug.cpu#0.n=
r_switches
        15 =C2=B1  6%     -43.3%          8 =C2=B1  5%  sched_debug.cpu#0.c=
pu_load[2]
        15 =C2=B1  5%     -44.4%          8 =C2=B1  4%  sched_debug.cpu#0.c=
pu_load[3]
      5278 =C2=B1  1%     -15.1%       4479 =C2=B1  4%  sched_debug.cpu#1.c=
urr->pid
    152407 =C2=B1  0%      -9.3%     138247 =C2=B1  1%  sched_debug.cpu#1.n=
r_load_updates
        14 =C2=B1  5%     -25.0%         10 =C2=B1 10%  sched_debug.cpu#1.l=
oad
      9011 =C2=B1  5%    +397.4%      44820 =C2=B1  1%  sched_debug.cpu#1.s=
ched_goidle
        15 =C2=B1 12%     -38.3%          9 =C2=B1  4%  sched_debug.cpu#1.c=
pu_load[0]
        14 =C2=B1  3%     -36.2%          9 =C2=B1  4%  sched_debug.cpu#1.c=
pu_load[4]
    419898 =C2=B1  5%     +41.5%     593963 =C2=B1  3%  sched_debug.cpu#1.a=
vg_idle
        14 =C2=B1  5%     -39.0%          9 =C2=B1  0%  sched_debug.cpu#1.c=
pu_load[3]
     45611 =C2=B1 12%    +138.9%     108972 =C2=B1  5%  sched_debug.cpu#1.s=
ched_count
     22346 =C2=B1 14%    +138.4%      53266 =C2=B1  0%  sched_debug.cpu#1.t=
twu_count
     38054 =C2=B1 13%    +166.6%     101445 =C2=B1  0%  sched_debug.cpu#1.n=
r_switches
        15 =C2=B1 10%     -41.7%          8 =C2=B1  4%  sched_debug.cpu#1.c=
pu_load[1]
        15 =C2=B1  8%     -41.0%          9 =C2=B1  0%  sched_debug.cpu#1.c=
pu_load[2]
     19623 =C2=B1  3%    +155.1%      50061 =C2=B1  3%  sched_debug.cpu#10.=
ttwu_count
        14 =C2=B1  5%     -34.5%          9 =C2=B1  5%  sched_debug.cpu#10.=
cpu_load[4]
        14 =C2=B1  5%     -38.6%          8 =C2=B1  9%  sched_debug.cpu#10.=
cpu_load[0]
        14 =C2=B1  7%     -34.5%          9 =C2=B1  5%  sched_debug.cpu#10.=
load
      5286 =C2=B1  1%     -19.2%       4271 =C2=B1  2%  sched_debug.cpu#10.=
curr->pid
     33706 =C2=B1  8%    +181.6%      94912 =C2=B1  3%  sched_debug.cpu#10.=
nr_switches
        14 =C2=B1  5%     -37.9%          9 =C2=B1  7%  sched_debug.cpu#10.=
cpu_load[3]
        14 =C2=B1  5%     -38.6%          8 =C2=B1  9%  sched_debug.cpu#10.=
cpu_load[1]
    151771 =C2=B1  0%     -10.5%     135760 =C2=B1  1%  sched_debug.cpu#10.=
nr_load_updates
     39656 =C2=B1  9%    +153.7%     100597 =C2=B1  5%  sched_debug.cpu#10.=
sched_count
    425666 =C2=B1  9%     +28.1%     545278 =C2=B1  1%  sched_debug.cpu#10.=
avg_idle
      8362 =C2=B1  8%     -27.7%       6044 =C2=B1 12%  sched_debug.cpu#10.=
ttwu_local
      7486 =C2=B1 17%    +458.9%      41844 =C2=B1  2%  sched_debug.cpu#10.=
sched_goidle
        14 =C2=B1  5%     -41.4%          8 =C2=B1  5%  sched_debug.cpu#10.=
cpu_load[2]
        15 =C2=B1 13%     -33.9%         10 =C2=B1 10%  sched_debug.cpu#11.=
load
        15 =C2=B1  8%     -46.0%          8 =C2=B1  5%  sched_debug.cpu#11.=
cpu_load[0]
     35740 =C2=B1  6%    +168.3%      95897 =C2=B1  1%  sched_debug.cpu#11.=
nr_switches
     42550 =C2=B1  8%    +133.0%      99139 =C2=B1  1%  sched_debug.cpu#11.=
sched_count
        15 =C2=B1  4%     -40.0%          9 =C2=B1  7%  sched_debug.cpu#11.=
cpu_load[3]
        15 =C2=B1  0%     -41.7%          8 =C2=B1  4%  sched_debug.cpu#11.=
cpu_load[2]
      9422 =C2=B1  9%     -28.0%       6784 =C2=B1 11%  sched_debug.cpu#11.=
ttwu_local
        14 =C2=B1  5%     -32.8%          9 =C2=B1  4%  sched_debug.cpu#11.=
cpu_load[4]
    152028 =C2=B1  0%     -11.0%     135292 =C2=B1  1%  sched_debug.cpu#11.=
nr_load_updates
      5302 =C2=B1  1%     -29.1%       3757 =C2=B1 14%  sched_debug.cpu#11.=
curr->pid
    420019 =C2=B1  6%     +29.4%     543549 =C2=B1  9%  sched_debug.cpu#11.=
avg_idle
        15 =C2=B1  2%     -42.6%          8 =C2=B1  9%  sched_debug.cpu#11.=
cpu_load[1]
      7298 =C2=B1 13%    +471.9%      41743 =C2=B1  1%  sched_debug.cpu#11.=
sched_goidle
     20612 =C2=B1  8%    +147.3%      50976 =C2=B1  2%  sched_debug.cpu#11.=
ttwu_count
    426702 =C2=B1 12%     +39.0%     593273 =C2=B1  9%  sched_debug.cpu#12.=
avg_idle
     37593 =C2=B1  6%    +163.0%      98855 =C2=B1  1%  sched_debug.cpu#12.=
sched_count
     34305 =C2=B1  7%    +171.9%      93282 =C2=B1  2%  sched_debug.cpu#12.=
nr_switches
      7460 =C2=B1 12%    +448.1%      40887 =C2=B1  2%  sched_debug.cpu#12.=
sched_goidle
         1 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#12.=
nr_running
        14 =C2=B1  2%     -35.6%          9 =C2=B1  5%  sched_debug.cpu#12.=
cpu_load[4]
     19137 =C2=B1  6%    +163.6%      50437 =C2=B1  2%  sched_debug.cpu#12.=
ttwu_count
    151130 =C2=B1  0%     -10.2%     135743 =C2=B1  1%  sched_debug.cpu#12.=
nr_load_updates
        14 =C2=B1  2%     -37.3%          9 =C2=B1  4%  sched_debug.cpu#12.=
cpu_load[3]
        15 =C2=B1  4%     -40.0%          9 =C2=B1  7%  sched_debug.cpu#12.=
cpu_load[2]
        15 =C2=B1  8%     -44.4%          8 =C2=B1  9%  sched_debug.cpu#12.=
cpu_load[0]
      5203 =C2=B1  2%     -17.9%       4273 =C2=B1 10%  sched_debug.cpu#12.=
curr->pid
      8695 =C2=B1 14%     -27.6%       6297 =C2=B1 10%  sched_debug.cpu#12.=
ttwu_local
        15 =C2=B1  5%     -41.0%          9 =C2=B1  7%  sched_debug.cpu#12.=
cpu_load[1]
      6727 =C2=B1  8%    +516.7%      41486 =C2=B1  1%  sched_debug.cpu#13.=
sched_goidle
     18277 =C2=B1 15%    +171.8%      49677 =C2=B1  1%  sched_debug.cpu#13.=
ttwu_count
        14 =C2=B1  3%     -36.2%          9 =C2=B1  4%  sched_debug.cpu#13.=
cpu_load[3]
     40712 =C2=B1 21%    +142.4%      98700 =C2=B1  4%  sched_debug.cpu#13.=
sched_count
        15 =C2=B1  9%     -34.4%         10 =C2=B1 14%  sched_debug.cpu#13.=
load
    150856 =C2=B1  0%     -10.0%     135840 =C2=B1  1%  sched_debug.cpu#13.=
nr_load_updates
     32486 =C2=B1 15%    +188.1%      93585 =C2=B1  2%  sched_debug.cpu#13.=
nr_switches
    418274 =C2=B1  5%     +38.7%     580336 =C2=B1  4%  sched_debug.cpu#13.=
avg_idle
      5263 =C2=B1  2%     -29.2%       3727 =C2=B1 17%  sched_debug.cpu#13.=
curr->pid
        14 =C2=B1  5%     -40.4%          8 =C2=B1  5%  sched_debug.cpu#13.=
cpu_load[0]
        14 =C2=B1  3%     -34.5%          9 =C2=B1  5%  sched_debug.cpu#13.=
cpu_load[4]
        14 =C2=B1  5%     -40.4%          8 =C2=B1  5%  sched_debug.cpu#13.=
cpu_load[1]
        14 =C2=B1  5%     -36.8%          9 =C2=B1  0%  sched_debug.cpu#13.=
cpu_load[2]
        14 =C2=B1  5%     -38.6%          8 =C2=B1  9%  sched_debug.cpu#14.=
cpu_load[0]
     36644 =C2=B1  6%    +175.0%     100770 =C2=B1  2%  sched_debug.cpu#14.=
sched_count
        15 =C2=B1 19%     -38.1%          9 =C2=B1 11%  sched_debug.cpu#14.=
load
        14 =C2=B1  3%     -37.9%          9 =C2=B1  7%  sched_debug.cpu#14.=
cpu_load[1]
    150753 =C2=B1  0%     -10.0%     135653 =C2=B1  1%  sched_debug.cpu#14.=
nr_load_updates
     32557 =C2=B1  8%    +186.3%      93223 =C2=B1  0%  sched_debug.cpu#14.=
nr_switches
      6530 =C2=B1  6%    +527.6%      40983 =C2=B1  0%  sched_debug.cpu#14.=
sched_goidle
    430654 =C2=B1 11%     +35.1%     581977 =C2=B1  7%  sched_debug.cpu#14.=
avg_idle
        14 =C2=B1  3%     -37.9%          9 =C2=B1  7%  sched_debug.cpu#14.=
cpu_load[2]
      7967 =C2=B1 12%     -22.1%       6204 =C2=B1  6%  sched_debug.cpu#14.=
ttwu_local
      5162 =C2=B1  3%     -25.8%       3831 =C2=B1 10%  sched_debug.cpu#14.=
curr->pid
     18131 =C2=B1  6%    +175.2%      49892 =C2=B1  0%  sched_debug.cpu#14.=
ttwu_count
        14 =C2=B1  3%     -36.2%          9 =C2=B1  4%  sched_debug.cpu#14.=
cpu_load[3]
        14 =C2=B1  3%     -34.5%          9 =C2=B1  5%  sched_debug.cpu#14.=
cpu_load[4]
     32858 =C2=B1  9%    +181.0%      92338 =C2=B1  2%  sched_debug.cpu#15.=
nr_switches
        14 =C2=B1  5%     -35.6%          9 =C2=B1  5%  sched_debug.cpu#15.=
cpu_load[3]
        14 =C2=B1  7%     -37.9%          9 =C2=B1 11%  sched_debug.cpu#15.=
cpu_load[0]
      8518 =C2=B1 19%     -27.0%       6214 =C2=B1  5%  sched_debug.cpu#15.=
ttwu_local
        15 =C2=B1  4%     -36.7%          9 =C2=B1  5%  sched_debug.cpu#15.=
cpu_load[4]
        14 =C2=B1  5%     -37.3%          9 =C2=B1  8%  sched_debug.cpu#15.=
cpu_load[1]
    439603 =C2=B1  4%     +33.6%     587095 =C2=B1  7%  sched_debug.cpu#15.=
avg_idle
     37374 =C2=B1 14%    +172.7%     101927 =C2=B1  2%  sched_debug.cpu#15.=
sched_count
    150779 =C2=B1  0%     -10.1%     135609 =C2=B1  1%  sched_debug.cpu#15.=
nr_load_updates
     18461 =C2=B1 10%    +168.9%      49635 =C2=B1  3%  sched_debug.cpu#15.=
ttwu_count
        15 =C2=B1 13%     -38.7%          9 =C2=B1 11%  sched_debug.cpu#15.=
load
      5087 =C2=B1  4%     -21.3%       4005 =C2=B1  5%  sched_debug.cpu#15.=
curr->pid
      6623 =C2=B1  6%    +511.6%      40513 =C2=B1  2%  sched_debug.cpu#15.=
sched_goidle
        14 =C2=B1  5%     -37.3%          9 =C2=B1  8%  sched_debug.cpu#15.=
cpu_load[2]
        15 =C2=B1  4%     -45.0%          8 =C2=B1 10%  sched_debug.cpu#16.=
cpu_load[0]
    151350 =C2=B1  0%     -10.3%     135805 =C2=B1  1%  sched_debug.cpu#16.=
nr_load_updates
      7472 =C2=B1  8%    +468.9%      42510 =C2=B1  2%  sched_debug.cpu#16.=
sched_goidle
        15 =C2=B1  4%     -43.3%          8 =C2=B1  5%  sched_debug.cpu#16.=
cpu_load[2]
        15 =C2=B1  4%     -43.3%          8 =C2=B1  5%  sched_debug.cpu#16.=
cpu_load[3]
     42078 =C2=B1 16%    +172.3%     114559 =C2=B1 13%  sched_debug.cpu#16.=
sched_count
     18903 =C2=B1  5%    +169.1%      50867 =C2=B1  1%  sched_debug.cpu#16.=
ttwu_count
        15 =C2=B1  4%     -40.0%          9 =C2=B1  7%  sched_debug.cpu#16.=
cpu_load[4]
     33692 =C2=B1  4%    +188.6%      97225 =C2=B1  1%  sched_debug.cpu#16.=
nr_switches
      5230 =C2=B1  3%     -21.7%       4098 =C2=B1 12%  sched_debug.cpu#16.=
curr->pid
        14 =C2=B1  7%     -44.1%          8 =C2=B1 10%  sched_debug.cpu#16.=
cpu_load[1]
         1 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#16.=
nr_running
    388250 =C2=B1  4%     +48.8%     577899 =C2=B1  7%  sched_debug.cpu#16.=
avg_idle
      8751 =C2=B1 11%     -23.2%       6720 =C2=B1  9%  sched_debug.cpu#16.=
ttwu_local
        15 =C2=B1  4%     -45.0%          8 =C2=B1  5%  sched_debug.cpu#17.=
cpu_load[1]
        14 =C2=B1  5%     -39.0%          9 =C2=B1  0%  sched_debug.cpu#17.=
cpu_load[3]
        15 =C2=B1  4%     -41.7%          8 =C2=B1  4%  sched_debug.cpu#17.=
cpu_load[2]
     31973 =C2=B1  4%    +212.8%     100010 =C2=B1  2%  sched_debug.cpu#17.=
nr_switches
      5079 =C2=B1  4%     -25.6%       3781 =C2=B1  9%  sched_debug.cpu#17.=
curr->pid
        14 =C2=B1  5%     -37.3%          9 =C2=B1  4%  sched_debug.cpu#17.=
cpu_load[4]
     18052 =C2=B1  4%    +185.4%      51514 =C2=B1  3%  sched_debug.cpu#17.=
ttwu_count
        14 =C2=B1  2%     -44.1%          8 =C2=B1  5%  sched_debug.cpu#17.=
cpu_load[0]
      7214 =C2=B1  9%    +504.5%      43608 =C2=B1  2%  sched_debug.cpu#17.=
sched_goidle
     39953 =C2=B1 17%    +181.2%     112331 =C2=B1  6%  sched_debug.cpu#17.=
sched_count
        14 =C2=B1  7%     -33.3%          9 =C2=B1  9%  sched_debug.cpu#17.=
load
    150798 =C2=B1  0%     -10.0%     135723 =C2=B1  1%  sched_debug.cpu#17.=
nr_load_updates
    460177 =C2=B1  5%     +24.5%     572863 =C2=B1  6%  sched_debug.cpu#17.=
avg_idle
      7557 =C2=B1 15%    +463.6%      42592 =C2=B1  1%  sched_debug.cpu#18.=
sched_goidle
    151189 =C2=B1  0%     -10.4%     135505 =C2=B1  1%  sched_debug.cpu#18.=
nr_load_updates
        14 =C2=B1  3%     -42.1%          8 =C2=B1  5%  sched_debug.cpu#18.=
cpu_load[0]
     20909 =C2=B1  9%    +146.8%      51603 =C2=B1  2%  sched_debug.cpu#18.=
ttwu_count
     41296 =C2=B1 14%    +159.1%     107013 =C2=B1  4%  sched_debug.cpu#18.=
sched_count
        14 =C2=B1  3%     -40.4%          8 =C2=B1  5%  sched_debug.cpu#18.=
cpu_load[1]
        14 =C2=B1  3%     -38.6%          8 =C2=B1  4%  sched_debug.cpu#18.=
cpu_load[2]
     10219 =C2=B1 14%     -33.2%       6825 =C2=B1 10%  sched_debug.cpu#18.=
ttwu_local
        14 =C2=B1  2%     -37.3%          9 =C2=B1  4%  sched_debug.cpu#18.=
cpu_load[4]
        14 =C2=B1  2%     -39.0%          9 =C2=B1  0%  sched_debug.cpu#18.=
cpu_load[3]
      5088 =C2=B1  3%     -22.0%       3967 =C2=B1  3%  sched_debug.cpu#18.=
curr->pid
    425778 =C2=B1 11%     +32.5%     564360 =C2=B1  4%  sched_debug.cpu#18.=
avg_idle
     37128 =C2=B1 10%    +163.4%      97799 =C2=B1  1%  sched_debug.cpu#18.=
nr_switches
     19065 =C2=B1 13%    +166.6%      50829 =C2=B1  3%  sched_debug.cpu#19.=
ttwu_count
    150656 =C2=B1  0%     -10.2%     135240 =C2=B1  1%  sched_debug.cpu#19.=
nr_load_updates
        14 =C2=B1 14%     -32.8%          9 =C2=B1  8%  sched_debug.cpu#19.=
load
      5122 =C2=B1  1%     -25.9%       3793 =C2=B1  3%  sched_debug.cpu#19.=
curr->pid
      6661 =C2=B1  9%    +538.9%      42558 =C2=B1  2%  sched_debug.cpu#19.=
sched_goidle
        14 =C2=B1  3%     -37.9%          9 =C2=B1  7%  sched_debug.cpu#19.=
cpu_load[3]
        15 =C2=B1  8%     -46.7%          8 =C2=B1  8%  sched_debug.cpu#19.=
cpu_load[1]
     48405 =C2=B1 38%    +139.6%     115975 =C2=B1  9%  sched_debug.cpu#19.=
sched_count
        15 =C2=B1  9%     -45.2%          8 =C2=B1  5%  sched_debug.cpu#19.=
cpu_load[0]
    414211 =C2=B1 18%     +47.8%     612403 =C2=B1  7%  sched_debug.cpu#19.=
avg_idle
     33174 =C2=B1 16%    +194.1%      97573 =C2=B1  3%  sched_debug.cpu#19.=
nr_switches
        14 =C2=B1  3%     -37.9%          9 =C2=B1  7%  sched_debug.cpu#19.=
cpu_load[4]
        14 =C2=B1  5%     -44.1%          8 =C2=B1 13%  sched_debug.cpu#19.=
cpu_load[2]
    446481 =C2=B1  6%     +24.5%     555977 =C2=B1  3%  sched_debug.cpu#2.a=
vg_idle
     49149 =C2=B1 23%    +115.8%     106068 =C2=B1  7%  sched_debug.cpu#2.s=
ched_count
     10586 =C2=B1 10%     -25.4%       7902 =C2=B1 12%  sched_debug.cpu#2.t=
twu_local
        14 =C2=B1  2%     -35.6%          9 =C2=B1 21%  sched_debug.cpu#2.c=
pu_load[1]
    151563 =C2=B1  0%      -9.0%     137974 =C2=B1  1%  sched_debug.cpu#2.n=
r_load_updates
      5165 =C2=B1  1%     -24.7%       3887 =C2=B1 10%  sched_debug.cpu#2.c=
urr->pid
      7552 =C2=B1  3%    +469.0%      42974 =C2=B1  4%  sched_debug.cpu#2.s=
ched_goidle
        15 =C2=B1  0%     -36.7%          9 =C2=B1 21%  sched_debug.cpu#2.c=
pu_load[0]
     21396 =C2=B1  8%    +145.3%      52491 =C2=B1  3%  sched_debug.cpu#2.t=
twu_count
        14 =C2=B1  3%     -33.3%          9 =C2=B1 21%  sched_debug.cpu#2.c=
pu_load[2]
        14 =C2=B1  3%     -33.3%          9 =C2=B1 21%  sched_debug.cpu#2.c=
pu_load[3]
     38324 =C2=B1  9%    +156.4%      98254 =C2=B1  3%  sched_debug.cpu#2.n=
r_switches
    151276 =C2=B1  0%     -10.5%     135392 =C2=B1  1%  sched_debug.cpu#20.=
nr_load_updates
     18059 =C2=B1  8%    +186.4%      51716 =C2=B1  1%  sched_debug.cpu#20.=
ttwu_count
        14 =C2=B1  5%     -30.4%          9 =C2=B1  8%  sched_debug.cpu#20.=
load
      7481 =C2=B1  8%    +466.1%      42357 =C2=B1  2%  sched_debug.cpu#20.=
sched_goidle
    444177 =C2=B1 20%     +31.4%     583581 =C2=B1  4%  sched_debug.cpu#20.=
avg_idle
     34935 =C2=B1 17%    +231.3%     115752 =C2=B1  6%  sched_debug.cpu#20.=
sched_count
        13 =C2=B1  3%     -34.5%          9 =C2=B1  7%  sched_debug.cpu#20.=
cpu_load[1]
     31626 =C2=B1  7%    +212.4%      98796 =C2=B1  2%  sched_debug.cpu#20.=
nr_switches
        14 =C2=B1  3%     -34.5%          9 =C2=B1  5%  sched_debug.cpu#20.=
cpu_load[3]
        14 =C2=B1  0%     -35.7%          9 =C2=B1  7%  sched_debug.cpu#20.=
cpu_load[0]
        14 =C2=B1  3%     -32.8%          9 =C2=B1  4%  sched_debug.cpu#20.=
cpu_load[4]
      5213 =C2=B1  3%     -27.4%       3782 =C2=B1  7%  sched_debug.cpu#20.=
curr->pid
        14 =C2=B1  5%     -33.9%          9 =C2=B1  4%  sched_debug.cpu#20.=
cpu_load[2]
        14 =C2=B1  3%     -33.3%          9 =C2=B1  5%  sched_debug.cpu#21.=
cpu_load[3]
        14 =C2=B1  7%     -33.3%          9 =C2=B1  9%  sched_debug.cpu#21.=
cpu_load[0]
        14 =C2=B1  7%     -33.3%          9 =C2=B1  5%  sched_debug.cpu#21.=
cpu_load[1]
      7015 =C2=B1  7%    +490.2%      41403 =C2=B1  1%  sched_debug.cpu#21.=
sched_goidle
     32048 =C2=B1 16%    +198.2%      95554 =C2=B1  2%  sched_debug.cpu#21.=
nr_switches
      5073 =C2=B1  5%     -25.3%       3790 =C2=B1  6%  sched_debug.cpu#21.=
curr->pid
        14 =C2=B1  3%     -31.0%         10 =C2=B1  0%  sched_debug.cpu#21.=
cpu_load[4]
        14 =C2=B1  3%     -33.3%          9 =C2=B1  5%  sched_debug.cpu#21.=
cpu_load[2]
     39334 =C2=B1 17%    +167.5%     105239 =C2=B1  8%  sched_debug.cpu#21.=
sched_count
    150872 =C2=B1  0%     -10.5%     135099 =C2=B1  1%  sched_debug.cpu#21.=
nr_load_updates
     18112 =C2=B1 15%    +180.9%      50883 =C2=B1  2%  sched_debug.cpu#21.=
ttwu_count
    439087 =C2=B1  7%     +48.2%     650939 =C2=B1  5%  sched_debug.cpu#21.=
avg_idle
      5166 =C2=B1  2%     -26.3%       3805 =C2=B1  8%  sched_debug.cpu#22.=
curr->pid
        14 =C2=B1  3%     -38.6%          8 =C2=B1  9%  sched_debug.cpu#22.=
cpu_load[2]
        14 =C2=B1  3%     -33.3%          9 =C2=B1  5%  sched_debug.cpu#22.=
cpu_load[4]
        14 =C2=B1  3%     -35.1%          9 =C2=B1  4%  sched_debug.cpu#22.=
cpu_load[3]
        14 =C2=B1  7%     -36.8%          9 =C2=B1  0%  sched_debug.cpu#22.=
load
      7428 =C2=B1 10%    +458.5%      41491 =C2=B1  2%  sched_debug.cpu#22.=
sched_goidle
        14 =C2=B1  5%     -35.7%          9 =C2=B1  7%  sched_debug.cpu#22.=
cpu_load[0]
     17236 =C2=B1 10%    +197.8%      51335 =C2=B1  2%  sched_debug.cpu#22.=
ttwu_count
     40157 =C2=B1 29%    +179.4%     112186 =C2=B1  7%  sched_debug.cpu#22.=
sched_count
    425732 =C2=B1  7%     +42.6%     607224 =C2=B1  9%  sched_debug.cpu#22.=
avg_idle
        14 =C2=B1  5%     -35.7%          9 =C2=B1  7%  sched_debug.cpu#22.=
cpu_load[1]
     31510 =C2=B1  9%    +204.0%      95784 =C2=B1  2%  sched_debug.cpu#22.=
nr_switches
    151172 =C2=B1  0%     -10.6%     135200 =C2=B1  0%  sched_debug.cpu#22.=
nr_load_updates
      6321 =C2=B1  6%    +544.7%      40754 =C2=B1  2%  sched_debug.cpu#23.=
sched_goidle
    150554 =C2=B1  0%     -10.0%     135467 =C2=B1  1%  sched_debug.cpu#23.=
nr_load_updates
     17495 =C2=B1  7%    +184.8%      49824 =C2=B1  2%  sched_debug.cpu#23.=
ttwu_count
        13 =C2=B1  3%     -36.4%          8 =C2=B1  4%  sched_debug.cpu#23.=
cpu_load[2]
    421307 =C2=B1  8%     +34.1%     564941 =C2=B1  1%  sched_debug.cpu#23.=
avg_idle
     37049 =C2=B1 20%    +217.2%     117530 =C2=B1 18%  sched_debug.cpu#23.=
sched_count
        13 =C2=B1  3%     -38.2%          8 =C2=B1  5%  sched_debug.cpu#23.=
cpu_load[1]
        14 =C2=B1  5%     -33.9%          9 =C2=B1  4%  sched_debug.cpu#23.=
cpu_load[3]
        13 =C2=B1  3%     -34.5%          9 =C2=B1  0%  sched_debug.cpu#23.=
cpu_load[0]
     30682 =C2=B1  8%    +208.4%      94634 =C2=B1  3%  sched_debug.cpu#23.=
nr_switches
        14 =C2=B1  5%     -32.1%          9 =C2=B1  5%  sched_debug.cpu#23.=
cpu_load[4]
      4883 =C2=B1  6%     -23.7%       3727 =C2=B1 11%  sched_debug.cpu#23.=
curr->pid
        14 =C2=B1  5%     -39.3%          8 =C2=B1 13%  sched_debug.cpu#23.=
load
      5238 =C2=B1  3%     -29.0%       3720 =C2=B1 15%  sched_debug.cpu#24.=
curr->pid
      6584 =C2=B1  3%    +532.7%      41658 =C2=B1  3%  sched_debug.cpu#24.=
sched_goidle
    428673 =C2=B1 10%     +40.8%     603741 =C2=B1  7%  sched_debug.cpu#24.=
avg_idle
        14 =C2=B1  3%     -36.2%          9 =C2=B1  4%  sched_debug.cpu#24.=
cpu_load[0]
     39369 =C2=B1  8%    +197.9%     117265 =C2=B1 12%  sched_debug.cpu#24.=
sched_count
    150374 =C2=B1  0%     -10.1%     135251 =C2=B1  1%  sched_debug.cpu#24.=
nr_load_updates
      9006 =C2=B1  8%     -32.2%       6104 =C2=B1  5%  sched_debug.cpu#24.=
ttwu_local
        14 =C2=B1  3%     -31.0%         10 =C2=B1  0%  sched_debug.cpu#24.=
cpu_load[4]
     34540 =C2=B1  5%    +173.1%      94315 =C2=B1  3%  sched_debug.cpu#24.=
nr_switches
        14 =C2=B1  3%     -34.5%          9 =C2=B1  5%  sched_debug.cpu#24.=
cpu_load[1]
     19271 =C2=B1  2%    +164.7%      51003 =C2=B1  2%  sched_debug.cpu#24.=
ttwu_count
        14 =C2=B1  3%     -31.0%         10 =C2=B1  0%  sched_debug.cpu#24.=
cpu_load[3]
        14 =C2=B1  3%     -34.5%          9 =C2=B1  5%  sched_debug.cpu#24.=
cpu_load[2]
     18407 =C2=B1  7%    +177.0%      50983 =C2=B1  3%  sched_debug.cpu#25.=
ttwu_count
      5311 =C2=B1  0%     -25.3%       3969 =C2=B1  9%  sched_debug.cpu#25.=
curr->pid
        15 =C2=B1  4%     -41.7%          8 =C2=B1 14%  sched_debug.cpu#25.=
cpu_load[1]
    483320 =C2=B1 10%     +17.9%     569719 =C2=B1  5%  sched_debug.cpu#25.=
avg_idle
      6536 =C2=B1  3%    +542.2%      41973 =C2=B1  2%  sched_debug.cpu#25.=
sched_goidle
     32159 =C2=B1  7%    +198.9%      96122 =C2=B1  3%  sched_debug.cpu#25.=
nr_switches
        14 =C2=B1  5%     -37.3%          9 =C2=B1 14%  sched_debug.cpu#25.=
load
        14 =C2=B1  3%     -39.7%          8 =C2=B1 14%  sched_debug.cpu#25.=
cpu_load[0]
        15 =C2=B1  4%     -40.0%          9 =C2=B1 11%  sched_debug.cpu#25.=
cpu_load[2]
     40528 =C2=B1  7%    +189.2%     117196 =C2=B1  5%  sched_debug.cpu#25.=
sched_count
        14 =C2=B1  2%     -37.3%          9 =C2=B1  8%  sched_debug.cpu#25.=
cpu_load[4]
        15 =C2=B1  4%     -40.0%          9 =C2=B1 11%  sched_debug.cpu#25.=
cpu_load[3]
      6505 =C2=B1  6%    +545.5%      41988 =C2=B1  2%  sched_debug.cpu#26.=
sched_goidle
     32597 =C2=B1  8%    +198.0%      97140 =C2=B1  5%  sched_debug.cpu#26.=
nr_switches
      5159 =C2=B1  1%     -30.0%       3610 =C2=B1 11%  sched_debug.cpu#26.=
curr->pid
     18398 =C2=B1  9%    +178.4%      51212 =C2=B1  5%  sched_debug.cpu#26.=
ttwu_count
        14 =C2=B1  5%     -41.4%          8 =C2=B1 10%  sched_debug.cpu#26.=
cpu_load[1]
        14 =C2=B1  3%     -40.4%          8 =C2=B1 10%  sched_debug.cpu#26.=
cpu_load[2]
        14 =C2=B1  5%     -39.7%          8 =C2=B1  9%  sched_debug.cpu#26.=
cpu_load[0]
        14 =C2=B1  3%     -36.8%          9 =C2=B1  7%  sched_debug.cpu#26.=
cpu_load[3]
     39155 =C2=B1 14%    +180.9%     110006 =C2=B1  6%  sched_debug.cpu#26.=
sched_count
        14 =C2=B1  3%     -36.2%          9 =C2=B1 11%  sched_debug.cpu#26.=
cpu_load[4]
        14 =C2=B1 10%     -31.0%         10 =C2=B1  7%  sched_debug.cpu#26.=
load
    418972 =C2=B1 13%     +39.4%     583946 =C2=B1  9%  sched_debug.cpu#26.=
avg_idle
        14 =C2=B1  3%     -37.9%          9 =C2=B1 15%  sched_debug.cpu#27.=
load
        14 =C2=B1  3%     -37.9%          9 =C2=B1  7%  sched_debug.cpu#27.=
cpu_load[3]
     34672 =C2=B1 10%    +164.2%      91614 =C2=B1  2%  sched_debug.cpu#27.=
nr_switches
        14 =C2=B1  2%     -39.0%          9 =C2=B1  7%  sched_debug.cpu#27.=
cpu_load[0]
        14 =C2=B1  3%     -37.9%          9 =C2=B1  7%  sched_debug.cpu#27.=
cpu_load[1]
      9155 =C2=B1 15%     -38.8%       5606 =C2=B1  8%  sched_debug.cpu#27.=
ttwu_local
     43896 =C2=B1 23%    +158.1%     113312 =C2=B1 17%  sched_debug.cpu#27.=
sched_count
        14 =C2=B1  3%     -36.8%          9 =C2=B1  7%  sched_debug.cpu#27.=
cpu_load[2]
      5086 =C2=B1  2%     -21.0%       4019 =C2=B1 13%  sched_debug.cpu#27.=
curr->pid
        14 =C2=B1  2%     -37.3%          9 =C2=B1  4%  sched_debug.cpu#27.=
cpu_load[4]
    150291 =C2=B1  0%     -10.0%     135294 =C2=B1  1%  sched_debug.cpu#27.=
nr_load_updates
      6795 =C2=B1  6%    +499.4%      40732 =C2=B1  1%  sched_debug.cpu#27.=
sched_goidle
    412373 =C2=B1 18%     +42.2%     586421 =C2=B1  3%  sched_debug.cpu#27.=
avg_idle
     19738 =C2=B1  9%    +151.6%      49671 =C2=B1  3%  sched_debug.cpu#27.=
ttwu_count
      6379 =C2=B1  6%    +531.9%      40316 =C2=B1  1%  sched_debug.cpu#28.=
sched_goidle
        14 =C2=B1  7%     -43.1%          8 =C2=B1 13%  sched_debug.cpu#28.=
cpu_load[0]
     30304 =C2=B1 11%    +201.2%      91288 =C2=B1  3%  sched_debug.cpu#28.=
nr_switches
        14 =C2=B1  3%     -42.1%          8 =C2=B1  5%  sched_debug.cpu#28.=
cpu_load[2]
        14 =C2=B1  5%     -37.3%          9 =C2=B1  4%  sched_debug.cpu#28.=
cpu_load[4]
      7447 =C2=B1 19%     -21.5%       5848 =C2=B1 16%  sched_debug.cpu#28.=
ttwu_local
        14 =C2=B1  7%     -43.1%          8 =C2=B1 13%  sched_debug.cpu#28.=
cpu_load[1]
    150488 =C2=B1  0%     -10.0%     135387 =C2=B1  1%  sched_debug.cpu#28.=
nr_load_updates
        15 =C2=B1 12%     -40.0%          9 =C2=B1 17%  sched_debug.cpu#28.=
load
     47096 =C2=B1 34%    +144.1%     114961 =C2=B1 13%  sched_debug.cpu#28.=
sched_count
        14 =C2=B1  3%     -37.9%          9 =C2=B1  7%  sched_debug.cpu#28.=
cpu_load[3]
     17301 =C2=B1 13%    +184.6%      49235 =C2=B1  3%  sched_debug.cpu#28.=
ttwu_count
    429678 =C2=B1  7%     +31.0%     562755 =C2=B1  5%  sched_debug.cpu#28.=
avg_idle
        14 =C2=B1  3%     -36.2%          9 =C2=B1  4%  sched_debug.cpu#29.=
cpu_load[2]
    150289 =C2=B1  0%     -10.0%     135209 =C2=B1  1%  sched_debug.cpu#29.=
nr_load_updates
      5143 =C2=B1  2%     -20.8%       4074 =C2=B1 18%  sched_debug.cpu#29.=
curr->pid
      6371 =C2=B1  4%    +535.5%      40493 =C2=B1  3%  sched_debug.cpu#29.=
sched_goidle
        14 =C2=B1  5%     -37.3%          9 =C2=B1  4%  sched_debug.cpu#29.=
cpu_load[1]
        15 =C2=B1  4%     -38.3%          9 =C2=B1  4%  sched_debug.cpu#29.=
cpu_load[3]
     17989 =C2=B1 12%    +175.7%      49598 =C2=B1  2%  sched_debug.cpu#29.=
ttwu_count
        14 =C2=B1  5%     -39.0%          9 =C2=B1  0%  sched_debug.cpu#29.=
cpu_load[0]
        14 =C2=B1  5%     -30.4%          9 =C2=B1 16%  sched_debug.cpu#29.=
load
     31759 =C2=B1 14%    +188.3%      91569 =C2=B1  3%  sched_debug.cpu#29.=
nr_switches
    471255 =C2=B1  8%     +30.0%     612851 =C2=B1  9%  sched_debug.cpu#29.=
avg_idle
        15 =C2=B1  2%     -37.7%          9 =C2=B1  5%  sched_debug.cpu#29.=
cpu_load[4]
     37619 =C2=B1 19%    +228.8%     123692 =C2=B1 12%  sched_debug.cpu#29.=
sched_count
     18968 =C2=B1 14%    +172.7%      51724 =C2=B1  3%  sched_debug.cpu#3.t=
twu_count
     39894 =C2=B1 18%    +153.6%     101178 =C2=B1  8%  sched_debug.cpu#3.s=
ched_count
     33554 =C2=B1 16%    +186.1%      95988 =C2=B1  3%  sched_debug.cpu#3.n=
r_switches
        14 =C2=B1  3%     -35.1%          9 =C2=B1  8%  sched_debug.cpu#3.c=
pu_load[2]
        14 =C2=B1  5%     -33.9%          9 =C2=B1  8%  sched_debug.cpu#3.c=
pu_load[1]
    418310 =C2=B1  5%     +37.9%     576750 =C2=B1  5%  sched_debug.cpu#3.a=
vg_idle
        14 =C2=B1  0%     -33.9%          9 =C2=B1  8%  sched_debug.cpu#3.c=
pu_load[3]
      5142 =C2=B1  2%     -21.6%       4034 =C2=B1  6%  sched_debug.cpu#3.c=
urr->pid
      7131 =C2=B1  5%    +495.7%      42485 =C2=B1  3%  sched_debug.cpu#3.s=
ched_goidle
        14 =C2=B1  0%     -30.4%          9 =C2=B1  4%  sched_debug.cpu#3.c=
pu_load[4]
        14 =C2=B1  7%     -35.1%          9 =C2=B1 15%  sched_debug.cpu#3.c=
pu_load[0]
        14 =C2=B1  5%     -30.4%          9 =C2=B1 11%  sched_debug.cpu#3.l=
oad
     41476 =C2=B1 32%    +142.2%     100464 =C2=B1  4%  sched_debug.cpu#30.=
sched_count
        14 =C2=B1  2%     -37.3%          9 =C2=B1  4%  sched_debug.cpu#30.=
cpu_load[4]
     31708 =C2=B1 14%    +185.0%      90376 =C2=B1  1%  sched_debug.cpu#30.=
nr_switches
     17674 =C2=B1 14%    +179.3%      49362 =C2=B1  1%  sched_debug.cpu#30.=
ttwu_count
    150228 =C2=B1  0%     -10.0%     135265 =C2=B1  1%  sched_debug.cpu#30.=
nr_load_updates
        14 =C2=B1  5%     -43.9%          8 =C2=B1  0%  sched_debug.cpu#30.=
cpu_load[1]
        14 =C2=B1  5%     -42.1%          8 =C2=B1 13%  sched_debug.cpu#30.=
load
        14 =C2=B1  5%     -43.1%          8 =C2=B1  5%  sched_debug.cpu#30.=
cpu_load[2]
      6329 =C2=B1  7%    +529.5%      39848 =C2=B1  1%  sched_debug.cpu#30.=
sched_goidle
    425532 =C2=B1 14%     +43.5%     610674 =C2=B1  8%  sched_debug.cpu#30.=
avg_idle
        14 =C2=B1  5%     -41.4%          8 =C2=B1  5%  sched_debug.cpu#30.=
cpu_load[3]
      5108 =C2=B1  4%     -28.4%       3655 =C2=B1 15%  sched_debug.cpu#30.=
curr->pid
        14 =C2=B1  5%     -43.9%          8 =C2=B1  0%  sched_debug.cpu#30.=
cpu_load[0]
     18864 =C2=B1  9%    +163.9%      49790 =C2=B1  1%  sched_debug.cpu#31.=
ttwu_count
    433193 =C2=B1  3%     +38.0%     598002 =C2=B1  6%  sched_debug.cpu#31.=
avg_idle
        14 =C2=B1  3%     -38.6%          8 =C2=B1  9%  sched_debug.cpu#31.=
cpu_load[4]
        14 =C2=B1  5%     -41.1%          8 =C2=B1 15%  sched_debug.cpu#31.=
cpu_load[1]
      5129 =C2=B1  2%     -26.7%       3761 =C2=B1 12%  sched_debug.cpu#31.=
curr->pid
     33770 =C2=B1 12%    +172.8%      92110 =C2=B1  1%  sched_debug.cpu#31.=
nr_switches
    150123 =C2=B1  0%      -9.7%     135537 =C2=B1  1%  sched_debug.cpu#31.=
nr_load_updates
        14 =C2=B1  5%     -41.1%          8 =C2=B1 10%  sched_debug.cpu#31.=
cpu_load[0]
      6565 =C2=B1  5%    +508.8%      39972 =C2=B1  2%  sched_debug.cpu#31.=
sched_goidle
        14 =C2=B1  3%     -40.4%          8 =C2=B1 13%  sched_debug.cpu#31.=
cpu_load[3]
      9070 =C2=B1 17%     -25.3%       6771 =C2=B1 13%  sched_debug.cpu#31.=
ttwu_local
        14 =C2=B1  5%     -41.1%          8 =C2=B1 15%  sched_debug.cpu#31.=
cpu_load[2]
      6227 =C2=B1  7%    +428.4%      32902 =C2=B1  1%  sched_debug.cpu#32.=
sched_goidle
        14 =C2=B1  5%     -41.1%          8 =C2=B1 17%  sched_debug.cpu#32.=
cpu_load[1]
        13 =C2=B1  3%     -40.0%          8 =C2=B1 10%  sched_debug.cpu#32.=
cpu_load[2]
     15098 =C2=B1 11%    +156.0%      38651 =C2=B1  2%  sched_debug.cpu#32.=
ttwu_count
      5247 =C2=B1  1%     -32.3%       3550 =C2=B1 14%  sched_debug.cpu#32.=
curr->pid
        14 =C2=B1  7%     -37.5%          8 =C2=B1 18%  sched_debug.cpu#32.=
load
        14 =C2=B1  0%     -39.3%          8 =C2=B1 10%  sched_debug.cpu#32.=
cpu_load[3]
    150384 =C2=B1  0%     -13.9%     129496 =C2=B1  1%  sched_debug.cpu#32.=
nr_load_updates
     26391 =C2=B1 11%    +190.0%      76546 =C2=B1  1%  sched_debug.cpu#32.=
nr_switches
    375426 =C2=B1  9%     +79.6%     674153 =C2=B1  3%  sched_debug.cpu#32.=
avg_idle
        14 =C2=B1  0%     -35.7%          9 =C2=B1  7%  sched_debug.cpu#32.=
cpu_load[4]
     28730 =C2=B1 15%    +174.6%      78888 =C2=B1  1%  sched_debug.cpu#32.=
sched_count
        13 =C2=B1  6%     -41.8%          8 =C2=B1 17%  sched_debug.cpu#32.=
cpu_load[0]
      5267 =C2=B1  1%     -35.6%       3392 =C2=B1 18%  sched_debug.cpu#33.=
curr->pid
        14 =C2=B1  3%     -43.9%          8 =C2=B1 15%  sched_debug.cpu#33.=
cpu_load[0]
     15812 =C2=B1 10%    +144.2%      38619 =C2=B1  3%  sched_debug.cpu#33.=
ttwu_count
     34631 =C2=B1 26%    +127.0%      78608 =C2=B1  4%  sched_debug.cpu#33.=
sched_count
        14 =C2=B1  3%     -36.2%          9 =C2=B1  8%  sched_debug.cpu#33.=
cpu_load[4]
    150320 =C2=B1  0%     -14.1%     129155 =C2=B1  1%  sched_debug.cpu#33.=
nr_load_updates
        14 =C2=B1  5%     -39.3%          8 =C2=B1 13%  sched_debug.cpu#33.=
load
        14 =C2=B1  2%     -39.0%          9 =C2=B1  7%  sched_debug.cpu#33.=
cpu_load[3]
        14 =C2=B1  3%     -41.4%          8 =C2=B1 13%  sched_debug.cpu#33.=
cpu_load[2]
        14 =C2=B1  3%     -43.9%          8 =C2=B1 15%  sched_debug.cpu#33.=
cpu_load[1]
     27394 =C2=B1 10%    +177.4%      75990 =C2=B1  3%  sched_debug.cpu#33.=
nr_switches
    377751 =C2=B1  6%     +73.9%     656823 =C2=B1  4%  sched_debug.cpu#33.=
avg_idle
      6209 =C2=B1  3%    +429.9%      32905 =C2=B1  2%  sched_debug.cpu#33.=
sched_goidle
        14 =C2=B1  0%     -41.1%          8 =C2=B1 10%  sched_debug.cpu#34.=
cpu_load[2]
        13 =C2=B1  3%     -39.6%          8 =C2=B1  8%  sched_debug.cpu#34.=
cpu_load[0]
        14 =C2=B1  0%     -37.5%          8 =C2=B1  9%  sched_debug.cpu#34.=
cpu_load[3]
     30105 =C2=B1 18%    +158.7%      77892 =C2=B1  3%  sched_debug.cpu#34.=
nr_switches
    150139 =C2=B1  0%     -13.4%     130058 =C2=B1  1%  sched_debug.cpu#34.=
nr_load_updates
     36505 =C2=B1 26%    +122.7%      81302 =C2=B1  2%  sched_debug.cpu#34.=
sched_count
      5149 =C2=B1  3%     -29.8%       3612 =C2=B1 15%  sched_debug.cpu#34.=
curr->pid
     17483 =C2=B1 14%    +124.1%      39182 =C2=B1  2%  sched_debug.cpu#34.=
ttwu_count
    427142 =C2=B1 13%     +60.5%     685572 =C2=B1  2%  sched_debug.cpu#34.=
avg_idle
      6139 =C2=B1  9%    +437.9%      33026 =C2=B1  3%  sched_debug.cpu#34.=
sched_goidle
        14 =C2=B1  0%     -37.5%          8 =C2=B1  9%  sched_debug.cpu#34.=
cpu_load[4]
        13 =C2=B1  6%     -33.3%          9 =C2=B1  7%  sched_debug.cpu#34.=
load
        13 =C2=B1  3%     -40.0%          8 =C2=B1 10%  sched_debug.cpu#34.=
cpu_load[1]
     38213 =C2=B1 26%    +125.8%      86267 =C2=B1 11%  sched_debug.cpu#35.=
sched_count
      5162 =C2=B1  2%     -30.7%       3576 =C2=B1 21%  sched_debug.cpu#35.=
curr->pid
    150061 =C2=B1  0%     -13.8%     129327 =C2=B1  1%  sched_debug.cpu#35.=
nr_load_updates
        14 =C2=B1  5%     -42.9%          8 =C2=B1 12%  sched_debug.cpu#35.=
cpu_load[1]
     16579 =C2=B1 23%    +130.0%      38131 =C2=B1  3%  sched_debug.cpu#35.=
ttwu_count
        14 =C2=B1  5%     -37.5%          8 =C2=B1  9%  sched_debug.cpu#35.=
cpu_load[0]
    439468 =C2=B1  4%     +53.6%     675096 =C2=B1  1%  sched_debug.cpu#35.=
avg_idle
        14 =C2=B1  0%     -41.1%          8 =C2=B1 10%  sched_debug.cpu#35.=
cpu_load[2]
        14 =C2=B1  0%     -39.3%          8 =C2=B1  5%  sched_debug.cpu#35.=
cpu_load[3]
      5768 =C2=B1  7%    +474.6%      33143 =C2=B1  2%  sched_debug.cpu#35.=
sched_goidle
     29372 =C2=B1 24%    +161.3%      76738 =C2=B1  2%  sched_debug.cpu#35.=
nr_switches
        14 =C2=B1  0%     -37.5%          8 =C2=B1  4%  sched_debug.cpu#35.=
cpu_load[4]
    149993 =C2=B1  0%     -13.6%     129644 =C2=B1  0%  sched_debug.cpu#36.=
nr_load_updates
      5201 =C2=B1  1%     -26.1%       3843 =C2=B1  8%  sched_debug.cpu#36.=
curr->pid
     28801 =C2=B1  9%    +172.8%      78566 =C2=B1  3%  sched_debug.cpu#36.=
nr_switches
        13 =C2=B1  6%     -41.8%          8 =C2=B1  8%  sched_debug.cpu#36.=
cpu_load[3]
        13 =C2=B1  6%     -41.8%          8 =C2=B1  8%  sched_debug.cpu#36.=
cpu_load[2]
    381368 =C2=B1  8%     +70.1%     648745 =C2=B1  2%  sched_debug.cpu#36.=
avg_idle
      5943 =C2=B1  2%    +456.7%      33086 =C2=B1  2%  sched_debug.cpu#36.=
sched_goidle
        14 =C2=B1  8%     -33.9%          9 =C2=B1 11%  sched_debug.cpu#36.=
load
        14 =C2=B1  7%     -38.6%          8 =C2=B1  9%  sched_debug.cpu#36.=
cpu_load[4]
     32433 =C2=B1 20%    +155.2%      82772 =C2=B1  3%  sched_debug.cpu#36.=
sched_count
        13 =C2=B1  6%     -41.8%          8 =C2=B1  8%  sched_debug.cpu#36.=
cpu_load[0]
     15835 =C2=B1  8%    +148.5%      39344 =C2=B1  4%  sched_debug.cpu#36.=
ttwu_count
        13 =C2=B1  6%     -41.8%          8 =C2=B1  8%  sched_debug.cpu#36.=
cpu_load[1]
     39427 =C2=B1 23%    +103.9%      80377 =C2=B1  5%  sched_debug.cpu#37.=
sched_count
     28952 =C2=B1  1%    +164.5%      76574 =C2=B1  3%  sched_debug.cpu#37.=
nr_switches
      5289 =C2=B1  1%     -30.6%       3670 =C2=B1  2%  sched_debug.cpu#37.=
curr->pid
        13 =C2=B1  3%     -37.0%          8 =C2=B1 10%  sched_debug.cpu#37.=
cpu_load[3]
        13 =C2=B1  3%     -32.7%          9 =C2=B1 11%  sched_debug.cpu#37.=
load
        13 =C2=B1  6%     -38.2%          8 =C2=B1 10%  sched_debug.cpu#37.=
cpu_load[2]
    416579 =C2=B1 11%     +61.7%     673750 =C2=B1  1%  sched_debug.cpu#37.=
avg_idle
        13 =C2=B1  6%     -38.2%          8 =C2=B1 10%  sched_debug.cpu#37.=
cpu_load[1]
        14 =C2=B1  0%     -33.9%          9 =C2=B1  4%  sched_debug.cpu#37.=
cpu_load[4]
     15659 =C2=B1  3%    +149.5%      39063 =C2=B1  4%  sched_debug.cpu#37.=
ttwu_count
    149915 =C2=B1  0%     -13.6%     129537 =C2=B1  1%  sched_debug.cpu#37.=
nr_load_updates
      6300 =C2=B1  7%    +419.9%      32753 =C2=B1  2%  sched_debug.cpu#37.=
sched_goidle
        13 =C2=B1  6%     -38.2%          8 =C2=B1 10%  sched_debug.cpu#37.=
cpu_load[0]
      5944 =C2=B1  2%    +454.9%      32984 =C2=B1  1%  sched_debug.cpu#38.=
sched_goidle
      5213 =C2=B1  2%     -32.9%       3499 =C2=B1 16%  sched_debug.cpu#38.=
curr->pid
        14 =C2=B1  3%     -43.1%          8 =C2=B1  5%  sched_debug.cpu#38.=
cpu_load[3]
        14 =C2=B1  3%     -40.4%          8 =C2=B1 13%  sched_debug.cpu#38.=
load
        14 =C2=B1  3%     -43.9%          8 =C2=B1  8%  sched_debug.cpu#38.=
cpu_load[1]
     33925 =C2=B1 40%    +138.0%      80747 =C2=B1  2%  sched_debug.cpu#38.=
sched_count
        14 =C2=B1  3%     -44.8%          8 =C2=B1  8%  sched_debug.cpu#38.=
cpu_load[2]
    150000 =C2=B1  0%     -13.9%     129180 =C2=B1  1%  sched_debug.cpu#38.=
nr_load_updates
    437919 =C2=B1  6%     +64.8%     721794 =C2=B1  5%  sched_debug.cpu#38.=
avg_idle
        14 =C2=B1  5%     -42.1%          8 =C2=B1 10%  sched_debug.cpu#38.=
cpu_load[0]
        14 =C2=B1  5%     -42.4%          8 =C2=B1  5%  sched_debug.cpu#38.=
cpu_load[4]
     25748 =C2=B1  6%    +202.9%      77995 =C2=B1  1%  sched_debug.cpu#38.=
nr_switches
     14197 =C2=B1  8%    +172.5%      38691 =C2=B1  1%  sched_debug.cpu#38.=
ttwu_count
     29596 =C2=B1 13%    +159.9%      76923 =C2=B1  1%  sched_debug.cpu#39.=
nr_switches
        14 =C2=B1  0%     -37.5%          8 =C2=B1  4%  sched_debug.cpu#39.=
cpu_load[1]
        14 =C2=B1  0%     -37.5%          8 =C2=B1  4%  sched_debug.cpu#39.=
cpu_load[2]
        14 =C2=B1  3%     -35.1%          9 =C2=B1  4%  sched_debug.cpu#39.=
cpu_load[3]
    149902 =C2=B1  0%     -13.6%     129582 =C2=B1  1%  sched_debug.cpu#39.=
nr_load_updates
     31260 =C2=B1 11%    +166.4%      83279 =C2=B1  3%  sched_debug.cpu#39.=
sched_count
      5882 =C2=B1  8%    +449.3%      32310 =C2=B1  1%  sched_debug.cpu#39.=
sched_goidle
      5291 =C2=B1  1%     -30.0%       3705 =C2=B1  8%  sched_debug.cpu#39.=
curr->pid
     16822 =C2=B1 10%    +137.4%      39930 =C2=B1  3%  sched_debug.cpu#39.=
ttwu_count
        14 =C2=B1  0%     -42.9%          8 =C2=B1  8%  sched_debug.cpu#39.=
cpu_load[0]
        14 =C2=B1  0%     -35.7%          9 =C2=B1  7%  sched_debug.cpu#39.=
load
    420204 =C2=B1  7%     +54.7%     649999 =C2=B1  2%  sched_debug.cpu#39.=
avg_idle
        14 =C2=B1  3%     -35.1%          9 =C2=B1  4%  sched_debug.cpu#39.=
cpu_load[4]
        15 =C2=B1 10%     -41.0%          9 =C2=B1 13%  sched_debug.cpu#4.c=
pu_load[1]
    436412 =C2=B1 12%     +41.1%     615909 =C2=B1  5%  sched_debug.cpu#4.a=
vg_idle
        15 =C2=B1  7%     -40.3%          9 =C2=B1 11%  sched_debug.cpu#4.c=
pu_load[3]
      8027 =C2=B1 21%    +443.1%      43600 =C2=B1  2%  sched_debug.cpu#4.s=
ched_goidle
        14 =C2=B1  3%     -35.1%          9 =C2=B1 11%  sched_debug.cpu#4.c=
pu_load[0]
      5160 =C2=B1  2%     -20.9%       4079 =C2=B1  7%  sched_debug.cpu#4.c=
urr->pid
     22071 =C2=B1  4%    +138.0%      52524 =C2=B1  3%  sched_debug.cpu#4.t=
twu_count
     47912 =C2=B1  8%    +113.3%     102208 =C2=B1  1%  sched_debug.cpu#4.s=
ched_count
     39644 =C2=B1  4%    +147.9%      98279 =C2=B1  3%  sched_debug.cpu#4.n=
r_switches
     11544 =C2=B1  2%     -27.3%       8397 =C2=B1 22%  sched_debug.cpu#4.t=
twu_local
        15 =C2=B1 10%     -41.0%          9 =C2=B1 13%  sched_debug.cpu#4.c=
pu_load[2]
        13 =C2=B1  3%     -25.5%         10 =C2=B1  8%  sched_debug.cpu#4.l=
oad
        15 =C2=B1  7%     -38.7%          9 =C2=B1  9%  sched_debug.cpu#4.c=
pu_load[4]
    403692 =C2=B1 12%     +61.8%     653091 =C2=B1  5%  sched_debug.cpu#40.=
avg_idle
        14 =C2=B1  3%     -36.8%          9 =C2=B1  7%  sched_debug.cpu#40.=
cpu_load[4]
    149865 =C2=B1  0%     -13.1%     130283 =C2=B1  1%  sched_debug.cpu#40.=
nr_load_updates
      5812 =C2=B1  5%    +474.9%      33412 =C2=B1  3%  sched_debug.cpu#40.=
sched_goidle
     15812 =C2=B1 10%    +144.8%      38704 =C2=B1  4%  sched_debug.cpu#40.=
ttwu_count
        14 =C2=B1  3%     -42.1%          8 =C2=B1 10%  sched_debug.cpu#40.=
cpu_load[3]
        14 =C2=B1  3%     -42.1%          8 =C2=B1 10%  sched_debug.cpu#40.=
cpu_load[2]
        14 =C2=B1  5%     -38.6%          8 =C2=B1 12%  sched_debug.cpu#40.=
load
     28338 =C2=B1 11%    +173.6%      77530 =C2=B1  3%  sched_debug.cpu#40.=
nr_switches
     32984 =C2=B1 15%    +143.5%      80306 =C2=B1  3%  sched_debug.cpu#40.=
sched_count
        14 =C2=B1  7%     -43.1%          8 =C2=B1 10%  sched_debug.cpu#40.=
cpu_load[0]
      5223 =C2=B1  1%     -28.0%       3762 =C2=B1 10%  sched_debug.cpu#40.=
curr->pid
        14 =C2=B1  7%     -42.1%          8 =C2=B1 10%  sched_debug.cpu#40.=
cpu_load[1]
        14 =C2=B1  0%     -37.5%          8 =C2=B1  9%  sched_debug.cpu#41.=
cpu_load[4]
        13 =C2=B1  6%     -36.4%          8 =C2=B1 14%  sched_debug.cpu#41.=
load
      5946 =C2=B1  6%    +464.4%      33561 =C2=B1  2%  sched_debug.cpu#41.=
sched_goidle
      5100 =C2=B1  3%     -27.4%       3701 =C2=B1 12%  sched_debug.cpu#41.=
curr->pid
     32262 =C2=B1 16%    +148.7%      80251 =C2=B1  3%  sched_debug.cpu#41.=
sched_count
     29197 =C2=B1  8%    +167.5%      78115 =C2=B1  2%  sched_debug.cpu#41.=
nr_switches
    149918 =C2=B1  0%     -13.7%     129319 =C2=B1  1%  sched_debug.cpu#41.=
nr_load_updates
        13 =C2=B1  3%     -41.8%          8 =C2=B1  8%  sched_debug.cpu#41.=
cpu_load[0]
        13 =C2=B1  3%     -41.8%          8 =C2=B1  8%  sched_debug.cpu#41.=
cpu_load[1]
        13 =C2=B1  3%     -40.0%          8 =C2=B1  5%  sched_debug.cpu#41.=
cpu_load[2]
     16140 =C2=B1  8%    +139.4%      38649 =C2=B1  4%  sched_debug.cpu#41.=
ttwu_count
    443969 =C2=B1  6%     +53.8%     682912 =C2=B1  3%  sched_debug.cpu#41.=
avg_idle
        13 =C2=B1  3%     -40.0%          8 =C2=B1  5%  sched_debug.cpu#41.=
cpu_load[3]
        15 =C2=B1  2%     -45.9%          8 =C2=B1 10%  sched_debug.cpu#42.=
cpu_load[0]
        14 =C2=B1  3%     -41.4%          8 =C2=B1  5%  sched_debug.cpu#42.=
cpu_load[4]
        15 =C2=B1  4%     -48.3%          7 =C2=B1 24%  sched_debug.cpu#42.=
load
      5183 =C2=B1  3%     -37.9%       3216 =C2=B1 21%  sched_debug.cpu#42.=
curr->pid
     15330 =C2=B1  5%    +163.4%      40384 =C2=B1  2%  sched_debug.cpu#42.=
ttwu_count
        14 =C2=B1  5%     -43.9%          8 =C2=B1  8%  sched_debug.cpu#42.=
cpu_load[3]
      5651 =C2=B1  3%    +498.4%      33819 =C2=B1  1%  sched_debug.cpu#42.=
sched_goidle
        14 =C2=B1  3%     -43.1%          8 =C2=B1  5%  sched_debug.cpu#42.=
cpu_load[1]
     31858 =C2=B1 13%    +165.8%      84681 =C2=B1  2%  sched_debug.cpu#42.=
sched_count
    427660 =C2=B1  8%     +65.9%     709402 =C2=B1  1%  sched_debug.cpu#42.=
avg_idle
    149880 =C2=B1  0%     -13.3%     129968 =C2=B1  1%  sched_debug.cpu#42.=
nr_load_updates
        14 =C2=B1  3%     -43.1%          8 =C2=B1  5%  sched_debug.cpu#42.=
cpu_load[2]
     26967 =C2=B1  4%    +199.1%      80670 =C2=B1  2%  sched_debug.cpu#42.=
nr_switches
    149899 =C2=B1  0%     -13.6%     129473 =C2=B1  1%  sched_debug.cpu#43.=
nr_load_updates
        14 =C2=B1  5%     -47.5%          7 =C2=B1  5%  sched_debug.cpu#43.=
load
        14 =C2=B1  8%     -47.5%          7 =C2=B1 10%  sched_debug.cpu#43.=
cpu_load[1]
     15334 =C2=B1 13%    +153.6%      38892 =C2=B1  4%  sched_debug.cpu#43.=
ttwu_count
     28502 =C2=B1 15%    +172.9%      77773 =C2=B1  1%  sched_debug.cpu#43.=
nr_switches
      6038 =C2=B1  9%    +450.9%      33264 =C2=B1  1%  sched_debug.cpu#43.=
sched_goidle
      5310 =C2=B1  0%     -36.4%       3380 =C2=B1 18%  sched_debug.cpu#43.=
curr->pid
    406693 =C2=B1  5%     +67.1%     679394 =C2=B1  7%  sched_debug.cpu#43.=
avg_idle
        14 =C2=B1  8%     -45.8%          8 =C2=B1  8%  sched_debug.cpu#43.=
cpu_load[0]
        14 =C2=B1  5%     -39.7%          8 =C2=B1  9%  sched_debug.cpu#43.=
cpu_load[4]
     30032 =C2=B1 13%    +163.2%      79035 =C2=B1  1%  sched_debug.cpu#43.=
sched_count
        14 =C2=B1  5%     -41.4%          8 =C2=B1  5%  sched_debug.cpu#43.=
cpu_load[3]
        14 =C2=B1  5%     -46.6%          7 =C2=B1 10%  sched_debug.cpu#43.=
cpu_load[2]
     16043 =C2=B1 12%    +142.6%      38928 =C2=B1  2%  sched_debug.cpu#44.=
ttwu_count
      5236 =C2=B1  3%     -31.7%       3576 =C2=B1 17%  sched_debug.cpu#44.=
curr->pid
        14 =C2=B1  3%     -36.8%          9 =C2=B1 13%  sched_debug.cpu#44.=
cpu_load[4]
     30020 =C2=B1 11%    +155.1%      76592 =C2=B1  2%  sched_debug.cpu#44.=
nr_switches
      6216 =C2=B1  2%    +425.2%      32650 =C2=B1  1%  sched_debug.cpu#44.=
sched_goidle
        14 =C2=B1  5%     -37.5%          8 =C2=B1 21%  sched_debug.cpu#44.=
load
    393059 =C2=B1  9%     +77.3%     696766 =C2=B1  4%  sched_debug.cpu#44.=
avg_idle
     32223 =C2=B1 15%    +151.2%      80928 =C2=B1  1%  sched_debug.cpu#44.=
sched_count
        14 =C2=B1  5%     -41.4%          8 =C2=B1 17%  sched_debug.cpu#44.=
cpu_load[0]
        14 =C2=B1  5%     -39.3%          8 =C2=B1 17%  sched_debug.cpu#44.=
cpu_load[2]
        14 =C2=B1  5%     -40.4%          8 =C2=B1 17%  sched_debug.cpu#44.=
cpu_load[1]
    149852 =C2=B1  0%     -13.6%     129432 =C2=B1  1%  sched_debug.cpu#44.=
nr_load_updates
        14 =C2=B1  3%     -38.6%          8 =C2=B1 14%  sched_debug.cpu#44.=
cpu_load[3]
        14 =C2=B1  3%     -40.4%          8 =C2=B1  5%  sched_debug.cpu#45.=
cpu_load[4]
     27127 =C2=B1  9%    +189.0%      78406 =C2=B1  2%  sched_debug.cpu#45.=
nr_switches
     30870 =C2=B1  8%    +180.3%      86533 =C2=B1  5%  sched_debug.cpu#45.=
sched_count
     15222 =C2=B1  8%    +159.4%      39486 =C2=B1  4%  sched_debug.cpu#45.=
ttwu_count
    399822 =C2=B1  7%     +64.7%     658696 =C2=B1  8%  sched_debug.cpu#45.=
avg_idle
        14 =C2=B1  3%     -43.9%          8 =C2=B1  8%  sched_debug.cpu#45.=
cpu_load[3]
    149876 =C2=B1  0%     -13.1%     130170 =C2=B1  2%  sched_debug.cpu#45.=
nr_load_updates
      5727 =C2=B1  4%    +481.5%      33305 =C2=B1  0%  sched_debug.cpu#45.=
sched_goidle
        13 =C2=B1  6%     -45.5%          7 =C2=B1  6%  sched_debug.cpu#45.=
cpu_load[0]
        14 =C2=B1  9%     -38.6%          8 =C2=B1  9%  sched_debug.cpu#45.=
load
      5161 =C2=B1  1%     -33.0%       3460 =C2=B1 12%  sched_debug.cpu#45.=
curr->pid
        13 =C2=B1  6%     -43.6%          7 =C2=B1  5%  sched_debug.cpu#45.=
cpu_load[1]
        13 =C2=B1  6%     -41.8%          8 =C2=B1  8%  sched_debug.cpu#45.=
cpu_load[2]
      5143 =C2=B1  4%     -34.9%       3347 =C2=B1 19%  sched_debug.cpu#46.=
curr->pid
      5725 =C2=B1  4%    +463.9%      32286 =C2=B1  1%  sched_debug.cpu#46.=
sched_goidle
        14 =C2=B1  3%     -46.6%          7 =C2=B1 10%  sched_debug.cpu#46.=
cpu_load[2]
        14 =C2=B1  3%     -39.7%          8 =C2=B1  9%  sched_debug.cpu#46.=
cpu_load[4]
        14 =C2=B1  3%     -47.4%          7 =C2=B1  6%  sched_debug.cpu#46.=
cpu_load[0]
        14 =C2=B1  3%     -44.8%          8 =C2=B1 12%  sched_debug.cpu#46.=
cpu_load[3]
     30713 =C2=B1 17%    +165.0%      81393 =C2=B1 11%  sched_debug.cpu#46.=
sched_count
     27647 =C2=B1 10%    +173.2%      75542 =C2=B1  2%  sched_debug.cpu#46.=
nr_switches
        14 =C2=B1  3%     -47.4%          7 =C2=B1  6%  sched_debug.cpu#46.=
cpu_load[1]
     14823 =C2=B1  5%    +158.6%      38328 =C2=B1  2%  sched_debug.cpu#46.=
ttwu_count
    402688 =C2=B1  9%     +78.1%     717376 =C2=B1  2%  sched_debug.cpu#46.=
avg_idle
    149705 =C2=B1  0%     -13.8%     129111 =C2=B1  1%  sched_debug.cpu#46.=
nr_load_updates
     27298 =C2=B1  6%    +175.3%      75141 =C2=B1  3%  sched_debug.cpu#47.=
nr_switches
        13 =C2=B1  6%     -38.9%          8 =C2=B1 10%  sched_debug.cpu#47.=
load
        14 =C2=B1 13%     -45.8%          8 =C2=B1  0%  sched_debug.cpu#47.=
cpu_load[2]
        14 =C2=B1  7%     -38.6%          8 =C2=B1  4%  sched_debug.cpu#47.=
cpu_load[4]
      5296 =C2=B1  1%     -29.2%       3752 =C2=B1  7%  sched_debug.cpu#47.=
curr->pid
      5721 =C2=B1  6%    +458.4%      31951 =C2=B1  1%  sched_debug.cpu#47.=
sched_goidle
     15555 =C2=B1  5%    +150.9%      39035 =C2=B1  3%  sched_debug.cpu#47.=
ttwu_count
        15 =C2=B1 14%     -49.2%          7 =C2=B1  5%  sched_debug.cpu#47.=
cpu_load[1]
        15 =C2=B1 19%     -50.8%          7 =C2=B1  6%  sched_debug.cpu#47.=
cpu_load[0]
    427514 =C2=B1  3%     +62.5%     694869 =C2=B1  5%  sched_debug.cpu#47.=
avg_idle
     30901 =C2=B1  9%    +150.4%      77385 =C2=B1  4%  sched_debug.cpu#47.=
sched_count
    149712 =C2=B1  0%     -13.8%     129072 =C2=B1  1%  sched_debug.cpu#47.=
nr_load_updates
        14 =C2=B1 10%     -43.1%          8 =C2=B1  5%  sched_debug.cpu#47.=
cpu_load[3]
      5825 =C2=B1  9%    +484.6%      34052 =C2=B1  2%  sched_debug.cpu#48.=
sched_goidle
    445509 =C2=B1 10%     +55.6%     693060 =C2=B1  2%  sched_debug.cpu#48.=
avg_idle
      5144 =C2=B1  2%     -27.6%       3724 =C2=B1 15%  sched_debug.cpu#48.=
curr->pid
    149663 =C2=B1  0%     -13.2%     129942 =C2=B1  1%  sched_debug.cpu#48.=
nr_load_updates
     31091 =C2=B1 19%    +162.8%      81718 =C2=B1  1%  sched_debug.cpu#48.=
nr_switches
        13 =C2=B1  3%     -34.0%          8 =C2=B1  9%  sched_debug.cpu#48.=
cpu_load[0]
     37659 =C2=B1  9%    +128.2%      85950 =C2=B1  2%  sched_debug.cpu#48.=
sched_count
        13 =C2=B1  6%     -30.2%          9 =C2=B1 20%  sched_debug.cpu#48.=
load
        14 =C2=B1  5%     -37.5%          8 =C2=B1  9%  sched_debug.cpu#48.=
cpu_load[1]
        14 =C2=B1  7%     -38.6%          8 =C2=B1  9%  sched_debug.cpu#48.=
cpu_load[2]
        14 =C2=B1  5%     -37.9%          9 =C2=B1  7%  sched_debug.cpu#48.=
cpu_load[3]
        14 =C2=B1  3%     -35.1%          9 =C2=B1  4%  sched_debug.cpu#48.=
cpu_load[4]
     17375 =C2=B1 17%    +135.1%      40852 =C2=B1  3%  sched_debug.cpu#48.=
ttwu_count
     14781 =C2=B1 16%    +169.2%      39795 =C2=B1  2%  sched_debug.cpu#49.=
ttwu_count
      5723 =C2=B1  5%    +499.1%      34288 =C2=B1  2%  sched_debug.cpu#49.=
sched_goidle
        13 =C2=B1  3%     -33.3%          9 =C2=B1 13%  sched_debug.cpu#49.=
load
        14 =C2=B1  0%     -39.3%          8 =C2=B1  5%  sched_debug.cpu#49.=
cpu_load[4]
        13 =C2=B1  3%     -43.6%          7 =C2=B1  5%  sched_debug.cpu#49.=
cpu_load[3]
     29140 =C2=B1 19%    +193.2%      85438 =C2=B1  5%  sched_debug.cpu#49.=
sched_count
    149680 =C2=B1  0%     -13.5%     129415 =C2=B1  1%  sched_debug.cpu#49.=
nr_load_updates
     26451 =C2=B1 18%    +205.1%      80693 =C2=B1  3%  sched_debug.cpu#49.=
nr_switches
      5140 =C2=B1  2%     -26.7%       3767 =C2=B1  9%  sched_debug.cpu#49.=
curr->pid
    442201 =C2=B1  9%     +59.5%     705228 =C2=B1  5%  sched_debug.cpu#49.=
avg_idle
        13 =C2=B1  3%     -48.1%          7 =C2=B1  0%  sched_debug.cpu#49.=
cpu_load[0]
        13 =C2=B1  3%     -46.3%          7 =C2=B1  5%  sched_debug.cpu#49.=
cpu_load[2]
        13 =C2=B1  3%     -48.1%          7 =C2=B1  0%  sched_debug.cpu#49.=
cpu_load[1]
    393207 =C2=B1  8%     +44.0%     566272 =C2=B1 12%  sched_debug.cpu#5.a=
vg_idle
        14 =C2=B1  3%     -40.4%          8 =C2=B1  5%  sched_debug.cpu#5.c=
pu_load[2]
      5202 =C2=B1  3%     -27.5%       3773 =C2=B1 23%  sched_debug.cpu#5.c=
urr->pid
      7245 =C2=B1  9%    +487.3%      42556 =C2=B1  3%  sched_debug.cpu#5.s=
ched_goidle
        14 =C2=B1  3%     -43.1%          8 =C2=B1 13%  sched_debug.cpu#5.c=
pu_load[0]
     50662 =C2=B1 48%    +101.7%     102190 =C2=B1  4%  sched_debug.cpu#5.s=
ched_count
      8840 =C2=B1  4%     -14.7%       7541 =C2=B1 11%  sched_debug.cpu#5.t=
twu_local
        14 =C2=B1  8%     -25.0%         10 =C2=B1 10%  sched_debug.cpu#5.l=
oad
     34132 =C2=B1  2%    +181.9%      96203 =C2=B1  3%  sched_debug.cpu#5.n=
r_switches
        14 =C2=B1  3%     -40.4%          8 =C2=B1  5%  sched_debug.cpu#5.c=
pu_load[3]
     19453 =C2=B1  1%    +163.4%      51235 =C2=B1  2%  sched_debug.cpu#5.t=
twu_count
        14 =C2=B1  3%     -35.1%          9 =C2=B1  4%  sched_debug.cpu#5.c=
pu_load[4]
        14 =C2=B1  3%     -42.1%          8 =C2=B1 13%  sched_debug.cpu#5.c=
pu_load[1]
     17176 =C2=B1 11%    +126.2%      38854 =C2=B1  3%  sched_debug.cpu#50.=
ttwu_count
      6062 =C2=B1  6%    +454.0%      33580 =C2=B1  2%  sched_debug.cpu#50.=
sched_goidle
    427537 =C2=B1  8%     +70.6%     729408 =C2=B1  8%  sched_debug.cpu#50.=
avg_idle
      8338 =C2=B1 16%     -26.7%       6110 =C2=B1  4%  sched_debug.cpu#50.=
ttwu_local
        14 =C2=B1 10%     -46.6%          7 =C2=B1 14%  sched_debug.cpu#50.=
cpu_load[0]
     31212 =C2=B1 11%    +150.5%      78189 =C2=B1  2%  sched_debug.cpu#50.=
nr_switches
        14 =C2=B1 13%     -45.8%          8 =C2=B1  8%  sched_debug.cpu#50.=
cpu_load[1]
        15 =C2=B1 11%     -46.7%          8 =C2=B1  8%  sched_debug.cpu#50.=
cpu_load[2]
        14 =C2=B1  8%     -45.8%          8 =C2=B1  8%  sched_debug.cpu#50.=
cpu_load[3]
     34287 =C2=B1 13%    +135.9%      80898 =C2=B1  2%  sched_debug.cpu#50.=
sched_count
    149585 =C2=B1  0%     -14.2%     128408 =C2=B1  1%  sched_debug.cpu#50.=
nr_load_updates
      5077 =C2=B1  2%     -31.0%       3505 =C2=B1 20%  sched_debug.cpu#50.=
curr->pid
        14 =C2=B1  5%     -41.4%          8 =C2=B1 10%  sched_debug.cpu#50.=
cpu_load[4]
        13 =C2=B1  3%     -46.3%          7 =C2=B1 11%  sched_debug.cpu#51.=
cpu_load[0]
    149563 =C2=B1  0%     -13.7%     129131 =C2=B1  1%  sched_debug.cpu#51.=
nr_load_updates
        13 =C2=B1  6%     -37.7%          8 =C2=B1 13%  sched_debug.cpu#51.=
load
      5961 =C2=B1  3%    +456.4%      33169 =C2=B1  3%  sched_debug.cpu#51.=
sched_goidle
        14 =C2=B1  8%     -50.8%          7 =C2=B1 11%  sched_debug.cpu#51.=
cpu_load[1]
     14805 =C2=B1 14%    +169.2%      39856 =C2=B1  8%  sched_debug.cpu#51.=
ttwu_count
    446768 =C2=B1  9%     +46.4%     654210 =C2=B1  3%  sched_debug.cpu#51.=
avg_idle
     27463 =C2=B1 13%    +189.6%      79531 =C2=B1  7%  sched_debug.cpu#51.=
nr_switches
      5134 =C2=B1  2%     -35.3%       3321 =C2=B1 18%  sched_debug.cpu#51.=
curr->pid
        14 =C2=B1  3%     -42.1%          8 =C2=B1 10%  sched_debug.cpu#51.=
cpu_load[4]
     31453 =C2=B1 12%    +165.8%      83619 =C2=B1  4%  sched_debug.cpu#51.=
sched_count
        14 =C2=B1  5%     -44.8%          8 =C2=B1  8%  sched_debug.cpu#51.=
cpu_load[3]
        14 =C2=B1  8%     -50.8%          7 =C2=B1 11%  sched_debug.cpu#51.=
cpu_load[2]
        13 =C2=B1  3%     -41.8%          8 =C2=B1 15%  sched_debug.cpu#52.=
cpu_load[1]
      5140 =C2=B1  3%     -28.5%       3677 =C2=B1 26%  sched_debug.cpu#52.=
curr->pid
      6165 =C2=B1  6%    +427.5%      32524 =C2=B1  1%  sched_debug.cpu#52.=
sched_goidle
     17019 =C2=B1 18%    +126.4%      38539 =C2=B1  4%  sched_debug.cpu#52.=
ttwu_count
        13 =C2=B1  3%     -44.4%          7 =C2=B1 20%  sched_debug.cpu#52.=
cpu_load[0]
     35027 =C2=B1 21%    +134.8%      82258 =C2=B1  8%  sched_debug.cpu#52.=
sched_count
        13 =C2=B1  3%     -38.2%          8 =C2=B1 13%  sched_debug.cpu#52.=
cpu_load[3]
        13 =C2=B1  6%     -38.9%          8 =C2=B1 26%  sched_debug.cpu#52.=
load
    149605 =C2=B1  0%     -13.8%     128950 =C2=B1  0%  sched_debug.cpu#52.=
nr_load_updates
     31250 =C2=B1 16%    +143.2%      76016 =C2=B1  3%  sched_debug.cpu#52.=
nr_switches
        13 =C2=B1  3%     -41.8%          8 =C2=B1 15%  sched_debug.cpu#52.=
cpu_load[2]
    407007 =C2=B1 18%     +73.1%     704364 =C2=B1  7%  sched_debug.cpu#52.=
avg_idle
        14 =C2=B1  0%     -35.7%          9 =C2=B1 11%  sched_debug.cpu#52.=
cpu_load[4]
        14 =C2=B1  0%     -39.3%          8 =C2=B1  5%  sched_debug.cpu#53.=
cpu_load[2]
     14336 =C2=B1 16%    +174.3%      39327 =C2=B1  2%  sched_debug.cpu#53.=
ttwu_count
    149573 =C2=B1  0%     -13.4%     129557 =C2=B1  0%  sched_debug.cpu#53.=
nr_load_updates
        14 =C2=B1  0%     -39.3%          8 =C2=B1  5%  sched_debug.cpu#53.=
cpu_load[3]
        14 =C2=B1  0%     -37.5%          8 =C2=B1  4%  sched_debug.cpu#53.=
cpu_load[4]
     26045 =C2=B1 17%    +201.9%      78623 =C2=B1  4%  sched_debug.cpu#53.=
nr_switches
      5785 =C2=B1  9%    +479.3%      33519 =C2=B1  3%  sched_debug.cpu#53.=
sched_goidle
    394131 =C2=B1  9%     +71.8%     677092 =C2=B1  4%  sched_debug.cpu#53.=
avg_idle
        14 =C2=B1  3%     -36.2%          9 =C2=B1 14%  sched_debug.cpu#53.=
load
         1 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#53.=
nr_running
      5301 =C2=B1  1%     -32.4%       3583 =C2=B1 22%  sched_debug.cpu#53.=
curr->pid
        14 =C2=B1  0%     -39.3%          8 =C2=B1  5%  sched_debug.cpu#53.=
cpu_load[1]
        13 =C2=B1  3%     -40.0%          8 =C2=B1  5%  sched_debug.cpu#53.=
cpu_load[0]
     27428 =C2=B1 19%    +215.5%      86525 =C2=B1 11%  sched_debug.cpu#53.=
sched_count
        13 =C2=B1  6%     -43.6%          7 =C2=B1  5%  sched_debug.cpu#54.=
cpu_load[1]
      5229 =C2=B1  0%     -28.1%       3762 =C2=B1  4%  sched_debug.cpu#54.=
curr->pid
    149541 =C2=B1  0%     -13.7%     129115 =C2=B1  1%  sched_debug.cpu#54.=
nr_load_updates
      5754 =C2=B1  5%    +481.1%      33442 =C2=B1  2%  sched_debug.cpu#54.=
sched_goidle
        14 =C2=B1  5%     -44.6%          7 =C2=B1  5%  sched_debug.cpu#54.=
cpu_load[0]
        14 =C2=B1 14%     -41.4%          8 =C2=B1  5%  sched_debug.cpu#54.=
load
        14 =C2=B1  0%     -44.6%          7 =C2=B1  5%  sched_debug.cpu#54.=
cpu_load[3]
     15157 =C2=B1 14%    +154.4%      38560 =C2=B1  2%  sched_debug.cpu#54.=
ttwu_count
        14 =C2=B1  0%     -41.1%          8 =C2=B1  5%  sched_debug.cpu#54.=
cpu_load[4]
     27067 =C2=B1 15%    +186.7%      77604 =C2=B1  2%  sched_debug.cpu#54.=
nr_switches
    381381 =C2=B1  9%     +87.1%     713657 =C2=B1  4%  sched_debug.cpu#54.=
avg_idle
        14 =C2=B1  0%     -44.6%          7 =C2=B1  5%  sched_debug.cpu#54.=
cpu_load[2]
     33009 =C2=B1 30%    +218.6%     105158 =C2=B1 35%  sched_debug.cpu#54.=
sched_count
        13 =C2=B1  6%     -44.4%          7 =C2=B1 11%  sched_debug.cpu#55.=
cpu_load[1]
      5335 =C2=B1  6%    +518.1%      32977 =C2=B1  4%  sched_debug.cpu#55.=
sched_goidle
        13 =C2=B1  8%     -33.3%          9 =C2=B1  7%  sched_debug.cpu#55.=
load
     24372 =C2=B1 15%    +215.9%      76995 =C2=B1  5%  sched_debug.cpu#55.=
nr_switches
      5093 =C2=B1  4%     -21.1%       4016 =C2=B1  9%  sched_debug.cpu#55.=
curr->pid
    149428 =C2=B1  0%     -14.0%     128500 =C2=B1  0%  sched_debug.cpu#55.=
nr_load_updates
     13723 =C2=B1 13%    +181.8%      38667 =C2=B1  2%  sched_debug.cpu#55.=
ttwu_count
        13 =C2=B1  6%     -46.3%          7 =C2=B1 17%  sched_debug.cpu#55.=
cpu_load[0]
        14 =C2=B1  5%     -46.4%          7 =C2=B1 11%  sched_debug.cpu#55.=
cpu_load[2]
        14 =C2=B1  5%     -42.9%          8 =C2=B1  8%  sched_debug.cpu#55.=
cpu_load[3]
     28348 =C2=B1 21%    +190.3%      82293 =C2=B1  2%  sched_debug.cpu#55.=
sched_count
    431592 =C2=B1  5%     +50.3%     648536 =C2=B1  8%  sched_debug.cpu#55.=
avg_idle
        14 =C2=B1  5%     -37.5%          8 =C2=B1  9%  sched_debug.cpu#55.=
cpu_load[4]
     29536 =C2=B1 13%    +232.5%      98216 =C2=B1 30%  sched_debug.cpu#56.=
sched_count
    149577 =C2=B1  0%     -13.5%     129346 =C2=B1  1%  sched_debug.cpu#56.=
nr_load_updates
        14 =C2=B1  5%     -39.3%          8 =C2=B1 10%  sched_debug.cpu#56.=
cpu_load[4]
     15441 =C2=B1 12%    +158.8%      39963 =C2=B1  4%  sched_debug.cpu#56.=
ttwu_count
        14 =C2=B1  5%     -41.1%          8 =C2=B1 10%  sched_debug.cpu#56.=
cpu_load[3]
        14 =C2=B1  5%     -42.9%          8 =C2=B1  8%  sched_debug.cpu#56.=
cpu_load[2]
        14 =C2=B1  5%     -42.9%          8 =C2=B1  8%  sched_debug.cpu#56.=
cpu_load[0]
      5178 =C2=B1  1%     -27.9%       3734 =C2=B1  8%  sched_debug.cpu#56.=
curr->pid
        14 =C2=B1  5%     -42.9%          8 =C2=B1  8%  sched_debug.cpu#56.=
cpu_load[1]
      5731 =C2=B1  3%    +480.4%      33266 =C2=B1  3%  sched_debug.cpu#56.=
sched_goidle
    382742 =C2=B1 10%     +80.1%     689145 =C2=B1  6%  sched_debug.cpu#56.=
avg_idle
        14 =C2=B1  8%     -37.5%          8 =C2=B1  9%  sched_debug.cpu#56.=
load
     27782 =C2=B1 14%    +183.1%      78659 =C2=B1  4%  sched_debug.cpu#56.=
nr_switches
        13 =C2=B1  3%     -34.5%          9 =C2=B1  0%  sched_debug.cpu#57.=
cpu_load[4]
        13 =C2=B1  6%     -43.6%          7 =C2=B1 14%  sched_debug.cpu#57.=
load
        14 =C2=B1  5%     -42.9%          8 =C2=B1  0%  sched_debug.cpu#57.=
cpu_load[0]
     15431 =C2=B1  3%    +156.5%      39587 =C2=B1  2%  sched_debug.cpu#57.=
ttwu_count
    149541 =C2=B1  0%     -13.9%     128797 =C2=B1  1%  sched_debug.cpu#57.=
nr_load_updates
      6140 =C2=B1  4%    +436.5%      32946 =C2=B1  2%  sched_debug.cpu#57.=
sched_goidle
     29782 =C2=B1  7%    +177.5%      82641 =C2=B1  1%  sched_debug.cpu#57.=
sched_count
        14 =C2=B1  5%     -44.6%          7 =C2=B1  5%  sched_debug.cpu#57.=
cpu_load[1]
        13 =C2=B1  3%     -41.8%          8 =C2=B1  0%  sched_debug.cpu#57.=
cpu_load[2]
     27648 =C2=B1  5%    +181.2%      77741 =C2=B1  1%  sched_debug.cpu#57.=
nr_switches
      5142 =C2=B1  1%     -28.5%       3676 =C2=B1 13%  sched_debug.cpu#57.=
curr->pid
        13 =C2=B1  3%     -38.2%          8 =C2=B1  5%  sched_debug.cpu#57.=
cpu_load[3]
    412300 =C2=B1  8%     +63.2%     672757 =C2=B1  6%  sched_debug.cpu#57.=
avg_idle
     25198 =C2=B1 10%    +209.5%      77988 =C2=B1  2%  sched_debug.cpu#58.=
nr_switches
        14 =C2=B1  5%     -40.4%          8 =C2=B1 10%  sched_debug.cpu#58.=
load
      5766 =C2=B1  4%    +471.7%      32966 =C2=B1  2%  sched_debug.cpu#58.=
sched_goidle
      5306 =C2=B1  1%     -29.0%       3766 =C2=B1  8%  sched_debug.cpu#58.=
curr->pid
     14008 =C2=B1 11%    +186.0%      40066 =C2=B1  4%  sched_debug.cpu#58.=
ttwu_count
        14 =C2=B1  3%     -38.6%          8 =C2=B1  4%  sched_debug.cpu#58.=
cpu_load[4]
    149466 =C2=B1  0%     -13.4%     129403 =C2=B1  1%  sched_debug.cpu#58.=
nr_load_updates
        14 =C2=B1  0%     -41.1%          8 =C2=B1  5%  sched_debug.cpu#58.=
cpu_load[1]
    416949 =C2=B1  9%     +60.8%     670547 =C2=B1  3%  sched_debug.cpu#58.=
avg_idle
        14 =C2=B1  0%     -41.1%          8 =C2=B1  5%  sched_debug.cpu#58.=
cpu_load[3]
     27843 =C2=B1 16%    +195.6%      82292 =C2=B1  1%  sched_debug.cpu#58.=
sched_count
        14 =C2=B1  3%     -42.1%          8 =C2=B1  5%  sched_debug.cpu#58.=
cpu_load[0]
        14 =C2=B1  0%     -41.1%          8 =C2=B1  5%  sched_debug.cpu#58.=
cpu_load[2]
        13 =C2=B1  3%     -42.6%          7 =C2=B1 10%  sched_debug.cpu#59.=
cpu_load[1]
      5322 =C2=B1  0%     -32.1%       3611 =C2=B1 11%  sched_debug.cpu#59.=
curr->pid
    385063 =C2=B1 11%     +81.8%     699943 =C2=B1  3%  sched_debug.cpu#59.=
avg_idle
    149421 =C2=B1  0%     -13.5%     129224 =C2=B1  1%  sched_debug.cpu#59.=
nr_load_updates
     24511 =C2=B1  9%    +213.0%      76718 =C2=B1  2%  sched_debug.cpu#59.=
nr_switches
     14102 =C2=B1 13%    +177.8%      39172 =C2=B1  1%  sched_debug.cpu#59.=
ttwu_count
     28477 =C2=B1 10%    +180.7%      79943 =C2=B1  4%  sched_debug.cpu#59.=
sched_count
        13 =C2=B1  3%     -42.6%          7 =C2=B1  5%  sched_debug.cpu#59.=
cpu_load[0]
        14 =C2=B1  0%     -37.5%          8 =C2=B1  9%  sched_debug.cpu#59.=
cpu_load[4]
        14 =C2=B1  0%     -35.7%          9 =C2=B1 15%  sched_debug.cpu#59.=
load
      5642 =C2=B1  6%    +480.0%      32728 =C2=B1  1%  sched_debug.cpu#59.=
sched_goidle
        13 =C2=B1  3%     -43.6%          7 =C2=B1 10%  sched_debug.cpu#59.=
cpu_load[2]
        14 =C2=B1  0%     -41.1%          8 =C2=B1  5%  sched_debug.cpu#59.=
cpu_load[3]
      4986 =C2=B1  3%     -27.6%       3609 =C2=B1  8%  sched_debug.cpu#6.c=
urr->pid
        14 =C2=B1  5%     -39.0%          9 =C2=B1  0%  sched_debug.cpu#6.c=
pu_load[3]
      9630 =C2=B1 11%     -28.0%       6929 =C2=B1  9%  sched_debug.cpu#6.t=
twu_local
    419211 =C2=B1 12%     +40.3%     588042 =C2=B1  6%  sched_debug.cpu#6.a=
vg_idle
        14 =C2=B1  3%     -34.5%          9 =C2=B1  5%  sched_debug.cpu#6.c=
pu_load[4]
     20287 =C2=B1 12%    +154.0%      51526 =C2=B1  2%  sched_debug.cpu#6.t=
twu_count
        14 =C2=B1  8%     -39.3%          8 =C2=B1  5%  sched_debug.cpu#6.c=
pu_load[0]
     46733 =C2=B1 31%    +114.9%     100445 =C2=B1  2%  sched_debug.cpu#6.s=
ched_count
    150916 =C2=B1  0%      -9.8%     136187 =C2=B1  1%  sched_debug.cpu#6.n=
r_load_updates
     36120 =C2=B1  9%    +162.9%      94974 =C2=B1  2%  sched_debug.cpu#6.n=
r_switches
        14 =C2=B1  8%     -41.1%          8 =C2=B1  5%  sched_debug.cpu#6.c=
pu_load[1]
      7113 =C2=B1  9%    +480.9%      41316 =C2=B1  2%  sched_debug.cpu#6.s=
ched_goidle
        14 =C2=B1  5%     -39.7%          8 =C2=B1  4%  sched_debug.cpu#6.c=
pu_load[2]
        14 =C2=B1 10%     -49.2%          7 =C2=B1  6%  sched_debug.cpu#60.=
load
    439937 =C2=B1 10%     +54.5%     679526 =C2=B1  5%  sched_debug.cpu#60.=
avg_idle
        14 =C2=B1  5%     -39.7%          8 =C2=B1  9%  sched_debug.cpu#60.=
cpu_load[4]
      5179 =C2=B1  2%     -35.5%       3342 =C2=B1 10%  sched_debug.cpu#60.=
curr->pid
     28843 =C2=B1 16%    +167.8%      77229 =C2=B1  4%  sched_debug.cpu#60.=
nr_switches
     33067 =C2=B1 12%    +247.8%     115018 =C2=B1 28%  sched_debug.cpu#60.=
sched_count
        14 =C2=B1  7%     -45.6%          7 =C2=B1 10%  sched_debug.cpu#60.=
cpu_load[2]
     15944 =C2=B1 16%    +148.5%      39619 =C2=B1  3%  sched_debug.cpu#60.=
ttwu_count
        14 =C2=B1  7%     -43.9%          8 =C2=B1  8%  sched_debug.cpu#60.=
cpu_load[3]
    149390 =C2=B1  0%     -13.5%     129257 =C2=B1  1%  sched_debug.cpu#60.=
nr_load_updates
      5661 =C2=B1  5%    +476.4%      32633 =C2=B1  2%  sched_debug.cpu#60.=
sched_goidle
        14 =C2=B1  7%     -49.1%          7 =C2=B1  5%  sched_debug.cpu#60.=
cpu_load[1]
        14 =C2=B1  7%     -51.7%          7 =C2=B1 10%  sched_debug.cpu#60.=
cpu_load[0]
         2 =C2=B1 47%    +172.7%          7 =C2=B1 46%  sched_debug.cpu#60.=
nr_uninterruptible
        14 =C2=B1  3%     -37.9%          9 =C2=B1  7%  sched_debug.cpu#61.=
cpu_load[4]
    149440 =C2=B1  0%     -13.8%     128815 =C2=B1  1%  sched_debug.cpu#61.=
nr_load_updates
     29614 =C2=B1 21%    +172.4%      80671 =C2=B1  7%  sched_debug.cpu#61.=
sched_count
        14 =C2=B1  3%     -43.1%          8 =C2=B1 10%  sched_debug.cpu#61.=
cpu_load[3]
        14 =C2=B1  3%     -43.9%          8 =C2=B1  8%  sched_debug.cpu#61.=
cpu_load[1]
     13368 =C2=B1 10%    +181.0%      37568 =C2=B1  2%  sched_debug.cpu#61.=
ttwu_count
        14 =C2=B1  3%     -44.8%          8 =C2=B1  8%  sched_debug.cpu#61.=
cpu_load[2]
      5539 =C2=B1  4%    +492.5%      32824 =C2=B1  1%  sched_debug.cpu#61.=
sched_goidle
    386906 =C2=B1  8%     +76.3%     682133 =C2=B1  7%  sched_debug.cpu#61.=
avg_idle
        14 =C2=B1  3%     -42.1%          8 =C2=B1  5%  sched_debug.cpu#61.=
cpu_load[0]
      5248 =C2=B1  2%     -33.1%       3512 =C2=B1  8%  sched_debug.cpu#61.=
curr->pid
        14 =C2=B1  3%     -38.6%          8 =C2=B1 21%  sched_debug.cpu#61.=
load
     23867 =C2=B1 10%    +214.5%      75068 =C2=B1  1%  sched_debug.cpu#61.=
nr_switches
     25806 =C2=B1 16%    +202.7%      78114 =C2=B1  0%  sched_debug.cpu#62.=
nr_switches
        14 =C2=B1  3%     -43.9%          8 =C2=B1  8%  sched_debug.cpu#62.=
cpu_load[2]
    149356 =C2=B1  0%     -13.5%     129229 =C2=B1  1%  sched_debug.cpu#62.=
nr_load_updates
        14 =C2=B1  7%     -45.8%          8 =C2=B1  8%  sched_debug.cpu#62.=
cpu_load[0]
     13869 =C2=B1 13%    +183.4%      39304 =C2=B1  0%  sched_debug.cpu#62.=
ttwu_count
      5710 =C2=B1  6%    +477.2%      32961 =C2=B1  1%  sched_debug.cpu#62.=
sched_goidle
        14 =C2=B1  3%     -44.8%          8 =C2=B1  8%  sched_debug.cpu#62.=
cpu_load[1]
        14 =C2=B1  5%     -39.3%          8 =C2=B1 10%  sched_debug.cpu#62.=
load
        14 =C2=B1  3%     -38.6%          8 =C2=B1 12%  sched_debug.cpu#62.=
cpu_load[4]
      4966 =C2=B1  5%     -31.5%       3402 =C2=B1  7%  sched_debug.cpu#62.=
curr->pid
    378717 =C2=B1 15%     +76.9%     669793 =C2=B1  4%  sched_debug.cpu#62.=
avg_idle
        14 =C2=B1  3%     -42.1%          8 =C2=B1 13%  sched_debug.cpu#62.=
cpu_load[3]
     29176 =C2=B1 10%    +189.4%      84428 =C2=B1  5%  sched_debug.cpu#62.=
sched_count
      5768 =C2=B1  4%    +457.9%      32180 =C2=B1  3%  sched_debug.cpu#63.=
sched_goidle
        14 =C2=B1  3%     -42.1%          8 =C2=B1 10%  sched_debug.cpu#63.=
cpu_load[4]
        14 =C2=B1  0%     -44.6%          7 =C2=B1 10%  sched_debug.cpu#63.=
cpu_load[0]
        14 =C2=B1  0%     -46.4%          7 =C2=B1 11%  sched_debug.cpu#63.=
cpu_load[2]
      5225 =C2=B1  0%     -31.4%       3584 =C2=B1  8%  sched_debug.cpu#63.=
curr->pid
     30028 =C2=B1 12%    +167.0%      80165 =C2=B1  5%  sched_debug.cpu#63.=
sched_count
    149417 =C2=B1  0%     -13.6%     129103 =C2=B1  1%  sched_debug.cpu#63.=
nr_load_updates
        14 =C2=B1  0%     -44.6%          7 =C2=B1 10%  sched_debug.cpu#63.=
cpu_load[1]
        14 =C2=B1  3%     -43.9%          8 =C2=B1  8%  sched_debug.cpu#63.=
cpu_load[3]
     28749 =C2=B1  9%    +160.3%      74821 =C2=B1  4%  sched_debug.cpu#63.=
nr_switches
     16124 =C2=B1  8%    +139.4%      38596 =C2=B1  4%  sched_debug.cpu#63.=
ttwu_count
    381327 =C2=B1 11%     +76.9%     674475 =C2=B1  1%  sched_debug.cpu#63.=
avg_idle
        13 =C2=B1  3%     -36.4%          8 =C2=B1  4%  sched_debug.cpu#63.=
load
      5228 =C2=B1  2%     -30.4%       3638 =C2=B1 18%  sched_debug.cpu#7.c=
urr->pid
     32692 =C2=B1 14%    +177.2%      90611 =C2=B1  2%  sched_debug.cpu#7.n=
r_switches
        14 =C2=B1  3%     -39.7%          8 =C2=B1  4%  sched_debug.cpu#7.c=
pu_load[3]
    432214 =C2=B1  9%     +31.0%     566127 =C2=B1  7%  sched_debug.cpu#7.a=
vg_idle
     18548 =C2=B1 13%    +164.5%      49069 =C2=B1  3%  sched_debug.cpu#7.t=
twu_count
        14 =C2=B1  3%     -35.1%          9 =C2=B1  8%  sched_debug.cpu#7.c=
pu_load[0]
        14 =C2=B1  3%     -36.2%          9 =C2=B1  8%  sched_debug.cpu#7.c=
pu_load[4]
      8398 =C2=B1 21%     -33.4%       5591 =C2=B1  4%  sched_debug.cpu#7.t=
twu_local
        14 =C2=B1  3%     -36.8%          9 =C2=B1  7%  sched_debug.cpu#7.c=
pu_load[1]
        14 =C2=B1  3%     -36.8%          9 =C2=B1 19%  sched_debug.cpu#7.l=
oad
    151006 =C2=B1  0%      -9.9%     136117 =C2=B1  1%  sched_debug.cpu#7.n=
r_load_updates
        14 =C2=B1  3%     -39.7%          8 =C2=B1  4%  sched_debug.cpu#7.c=
pu_load[2]
      6755 =C2=B1  8%    +495.5%      40224 =C2=B1  2%  sched_debug.cpu#7.s=
ched_goidle
     44491 =C2=B1 27%    +113.6%      95041 =C2=B1  1%  sched_debug.cpu#7.s=
ched_count
    430043 =C2=B1  6%     +28.0%     550405 =C2=B1  5%  sched_debug.cpu#8.a=
vg_idle
     36918 =C2=B1 14%    +155.5%      94310 =C2=B1  2%  sched_debug.cpu#8.n=
r_switches
     40673 =C2=B1 12%    +150.6%     101925 =C2=B1  4%  sched_debug.cpu#8.s=
ched_count
        15 =C2=B1  2%     -37.7%          9 =C2=B1  5%  sched_debug.cpu#8.c=
pu_load[3]
        15 =C2=B1  5%     -41.0%          9 =C2=B1  0%  sched_debug.cpu#8.c=
pu_load[1]
      9474 =C2=B1 15%     -36.4%       6024 =C2=B1  8%  sched_debug.cpu#8.t=
twu_local
     21205 =C2=B1 11%    +135.4%      49914 =C2=B1  2%  sched_debug.cpu#8.t=
twu_count
         1 =C2=B1  0%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#8.n=
r_running
        15 =C2=B1  3%     -40.3%          9 =C2=B1  4%  sched_debug.cpu#8.c=
pu_load[2]
      5366 =C2=B1  0%     -29.7%       3773 =C2=B1  8%  sched_debug.cpu#8.c=
urr->pid
        15 =C2=B1  5%     -39.3%          9 =C2=B1  4%  sched_debug.cpu#8.c=
pu_load[0]
    153610 =C2=B1  1%     -11.4%     136085 =C2=B1  1%  sched_debug.cpu#8.n=
r_load_updates
        15 =C2=B1  4%     -35.0%          9 =C2=B1  4%  sched_debug.cpu#8.l=
oad
        15 =C2=B1  2%     -36.1%          9 =C2=B1  4%  sched_debug.cpu#8.c=
pu_load[4]
      6904 =C2=B1  9%    +503.5%      41667 =C2=B1  1%  sched_debug.cpu#8.s=
ched_goidle
     12279 =C2=B1 13%     -42.9%       7013 =C2=B1 16%  sched_debug.cpu#9.t=
twu_local
    422957 =C2=B1 10%     +33.0%     562718 =C2=B1 10%  sched_debug.cpu#9.a=
vg_idle
        14 =C2=B1  2%     -33.9%          9 =C2=B1  4%  sched_debug.cpu#9.c=
pu_load[4]
     52631 =C2=B1  6%     +91.3%     100677 =C2=B1  3%  sched_debug.cpu#9.s=
ched_count
        14 =C2=B1  2%     -27.1%         10 =C2=B1  7%  sched_debug.cpu#9.l=
oad
      7657 =C2=B1 11%    +454.6%      42463 =C2=B1  1%  sched_debug.cpu#9.s=
ched_goidle
     41670 =C2=B1 11%    +135.0%      97935 =C2=B1  3%  sched_debug.cpu#9.n=
r_switches
     23117 =C2=B1 10%    +121.6%      51221 =C2=B1  3%  sched_debug.cpu#9.t=
twu_count
        14 =C2=B1  2%     -40.7%          8 =C2=B1  4%  sched_debug.cpu#9.c=
pu_load[2]
        14 =C2=B1  2%     -39.0%          9 =C2=B1  7%  sched_debug.cpu#9.c=
pu_load[3]
        14 =C2=B1  3%     -38.6%          8 =C2=B1  4%  sched_debug.cpu#9.c=
pu_load[0]
    151315 =C2=B1  0%     -10.2%     135912 =C2=B1  1%  sched_debug.cpu#9.n=
r_load_updates
        14 =C2=B1  3%     -39.7%          8 =C2=B1  4%  sched_debug.cpu#9.c=
pu_load[1]
      5086 =C2=B1  5%     -13.7%       4389 =C2=B1  7%  sched_debug.cpu#9.c=
urr->pid

lkp-nex06: Nehalem-EX
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


--===============1607940122152607613==
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
dWx0LXdhdGNoZG9nczoKICB3YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5v
cjogcG93ZXJzYXZlCmNvbW1pdDogNDFiZTg5NDEwNjk4MmY3MWRhOTQ2OWUzMTBjZjQ5ZDM5NTEx
OTc1MQptb2RlbDogR3JhbnRsZXkgSGFzd2VsbApucl9jcHU6IDE2Cm1lbW9yeTogMTZHCmhkZF9w
YXJ0aXRpb25zOiAKc3dhcF9wYXJ0aXRpb25zOiAKcm9vdGZzX3BhcnRpdGlvbjogCnBlcmYtcHJv
ZmlsZToKICBmcmVxOiA4MDAKd2lsbC1pdC1zY2FsZToKICB0ZXN0OiBwcmVhZDMKdGVzdGJveDog
bGl0dXlhCnRib3hfZ3JvdXA6IGxpdHV5YQprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3Rp
bWU6IDIwMTUtMDUtMDYgMTc6MDc6MTEuMTAyOTM2ODUyICswODowMAp1c2VyOiBsa3AKcXVldWU6
IGN5Y2xpYwpjb21waWxlcjogZ2NjLTQuOQpoZWFkX2NvbW1pdDogNDFiZTg5NDEwNjk4MmY3MWRh
OTQ2OWUzMTBjZjQ5ZDM5NTExOTc1MQpiYXNlX2NvbW1pdDogNWViZTZhZmFmMDA1N2FjM2VhZWI5
OGRlZmQ1NDU2ODk0YjQ0NmQyMgpicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE1
MDUwNjIxCmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS80MWJlODk0MTA2
OTgyZjcxZGE5NDY5ZTMxMGNmNDlkMzk1MTE5NzUxL3ZtbGludXotNC4xLjAtcmMyLXdsLTEyODQ0
LWc0MWJlODk0Igpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKcmVzdWx0X3Jv
b3Q6ICIvcmVzdWx0L3dpbGwtaXQtc2NhbGUvcG93ZXJzYXZlLXByZWFkMy9saXR1eWEvZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzQxYmU4OTQxMDY5ODJm
NzFkYTk0NjllMzEwY2Y0OWQzOTUxMTk3NTEvMCIKTEtQX1NFUlZFUjogaW5uCmpvYl9maWxlOiAi
L2xrcC9zY2hlZHVsZWQvbGl0dXlhL2N5Y2xpY193aWxsLWl0LXNjYWxlLXBvd2Vyc2F2ZS1wcmVh
ZDMteDg2XzY0LXJoZWwtQ1lDTElDX0hFQUQtNDFiZTg5NDEwNjk4MmY3MWRhOTQ2OWUzMTBjZjQ5
ZDM5NTExOTc1MS0wLTIwMTUwNTA2LTkyODMxLTF1cndhaGoueWFtbCIKZGVxdWV1ZV90aW1lOiAy
MDE1LTA1LTA3IDA4OjQ4OjM2LjE0NjU0MzE3NyArMDg6MDAKaW5pdHJkOiAiL29zaW1hZ2UvZGVi
aWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJv
b3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbGl0dXlhL2N5Y2xp
Y193aWxsLWl0LXNjYWxlLXBvd2Vyc2F2ZS1wcmVhZDMteDg2XzY0LXJoZWwtQ1lDTElDX0hFQUQt
NDFiZTg5NDEwNjk4MmY3MWRhOTQ2OWUzMTBjZjQ5ZDM5NTExOTc1MS0wLTIwMTUwNTA2LTkyODMx
LTF1cndhaGoueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5j
aD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNTA1MDYyMQotIGNvbW1pdD00MWJlODk0MTA2
OTgyZjcxZGE5NDY5ZTMxMGNmNDlkMzk1MTE5NzUxCi0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4
Nl82NC1yaGVsL2djYy00LjkvNDFiZTg5NDEwNjk4MmY3MWRhOTQ2OWUzMTBjZjQ5ZDM5NTExOTc1
MS92bWxpbnV6LTQuMS4wLXJjMi13bC0xMjg0NC1nNDFiZTg5NAotIFJFU1VMVF9ST09UPS9yZXN1
bHQvd2lsbC1pdC1zY2FsZS9wb3dlcnNhdmUtcHJlYWQzL2xpdHV5YS9kZWJpYW4teDg2XzY0LTIw
MTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvNDFiZTg5NDEwNjk4MmY3MWRhOTQ2OWUz
MTBjZjQ5ZDM5NTExOTc1MS8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRr
PXR0eVMwLDExNTIwMAogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1
cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFu
aWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRf
cmFtZGlzaz0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwK
CiAgcncKbWF4X3VwdGltZTogMTUwMApsa3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5j
Z3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzQxYmU4
OTQxMDY5ODJmNzFkYTk0NjllMzEwY2Y0OWQzOTUxMTk3NTEvbW9kdWxlcy5jZ3oiCmJtX2luaXRy
ZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9v
c2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6
LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei90dXJib3N0YXQuY2d6
LC9sa3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy93aWxsLWl0LXNj
YWxlLmNneiIKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiA5LjkzIDYuMjUgMi42MCAxLzIx
MyA1NzAxCnN0YXJ0X3RpbWU6ICcxNDMwOTU5NzUwJwplbmRfdGltZTogJzE0MzA5NjAwNTQnCnZl
cnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTUwNTA2LTIyMzY1NiIK

--===============1607940122152607613==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUwL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTIvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJz
YXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJz
YXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNh
dmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgouL3J1bnRlc3QucHkgcHJlYWQzIDMyIGJvdGggMSA4IDEyIDE2Cg==

--===============1607940122152607613==--

