Content-Type: multipart/mixed; boundary="===============4967347020151952529=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [sched] 6df481c389: 43.0% aim9.exec_test.ops_per_sec
Date: Thu, 24 Dec 2015 08:54:43 +0800
Message-ID: <87si2sekdo.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4967347020151952529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://internal_merge_and_test_tree revert-6df481c389734ccc3a2a007c51e3dd557=
e5776ca-6df481c389734ccc3a2a007c51e3dd557e5776ca
commit 6df481c389734ccc3a2a007c51e3dd557e5776ca ("sched: Fix new task's loa=
d avg removed from source CPU in wake_up_new_task()")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/testtime:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-hsx04/ex=
ec_test/aim9/300s

commit: =

  9a4cb134f8adcf1413808e4d07bb637c83e437ba
  6df481c389734ccc3a2a007c51e3dd557e5776ca

9a4cb134f8adcf14 6df481c389734ccc3a2a007c51 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      1144 =C2=B1  0%     +43.0%       1635 =C2=B1  1%  aim9.exec_test.ops_=
per_sec
    343688 =C2=B1  0%     +42.9%     491264 =C2=B1  1%  aim9.time.involunta=
ry_context_switches
  26316782 =C2=B1  0%     +42.9%   37616540 =C2=B1  0%  aim9.time.minor_pag=
e_faults
    101.00 =C2=B1  0%      -3.5%      97.50 =C2=B1  0%  aim9.time.percent_o=
f_cpu_this_job_got
     34.95 =C2=B1  0%     -21.0%      27.62 =C2=B1  0%  aim9.time.user_time
    686051 =C2=B1  0%     +43.1%     981909 =C2=B1  1%  aim9.time.voluntary=
_context_switches
     94.75 =C2=B1 22%  +13144.3%      12549 =C2=B1 14%  latency_stats.sum.s=
top_one_cpu.sched_exec.do_execveat_common.SyS_execve.return_from_execve
      2046 =C2=B1  3%      +5.1%       2151 =C2=B1  1%  vmstat.system.in
    394.33 =C2=B1  1%     +20.1%     473.70 =C2=B1  0%  pmeter.Average_Acti=
ve_Power
      2.90 =C2=B1  1%     +19.0%       3.45 =C2=B1  1%  pmeter.performance_=
per_watt
    286262 =C2=B1  6%     -12.3%     251010 =C2=B1  7%  softirqs.RCU
    396670 =C2=B1  0%     -38.9%     242361 =C2=B1  0%  softirqs.SCHED
   1211551 =C2=B1  1%     -47.1%     640580 =C2=B1  2%  softirqs.TIMER
   5865703 =C2=B1  4%     +62.0%    9505248 =C2=B1 12%  numa-numastat.node0=
.local_node
   5874365 =C2=B1  4%     +62.0%    9516239 =C2=B1 12%  numa-numastat.node0=
.numa_hit
   5854682 =C2=B1  4%     +59.5%    9338476 =C2=B1 12%  numa-numastat.node2=
.local_node
   5864541 =C2=B1  4%     +59.4%    9347809 =C2=B1 12%  numa-numastat.node2=
.numa_hit
    343688 =C2=B1  0%     +42.9%     491264 =C2=B1  1%  time.involuntary_co=
ntext_switches
  26316782 =C2=B1  0%     +42.9%   37616540 =C2=B1  0%  time.minor_page_fau=
lts
     34.95 =C2=B1  0%     -21.0%      27.62 =C2=B1  0%  time.user_time
    686051 =C2=B1  0%     +43.1%     981909 =C2=B1  1%  time.voluntary_cont=
ext_switches
    123941 =C2=B1  3%    +459.4%     693334 =C2=B1  0%  meminfo.Committed_AS
      7090 =C2=B1  5%      +8.6%       7699 =C2=B1  5%  meminfo.PageTables
    174855 =C2=B1  0%     +15.8%     202525 =C2=B1  0%  meminfo.SUnreclaim
     25033 =C2=B1  0%     +10.3%      27617 =C2=B1  2%  meminfo.Shmem
    241692 =C2=B1  0%     +13.3%     273811 =C2=B1  0%  meminfo.Slab
      2.82 =C2=B1  4%    +235.9%       9.47 =C2=B1  8%  turbostat.CPU%c1
      0.01 =C2=B1110%  +1.9e+05%      14.53 =C2=B1 11%  turbostat.CPU%c3
     96.35 =C2=B1  0%     -21.9%      75.22 =C2=B1  3%  turbostat.CPU%c6
     35.00 =C2=B1  2%     +11.4%      39.00 =C2=B1  1%  turbostat.CoreTmp
     57.61 =C2=B1  1%     -36.2%      36.77 =C2=B1  2%  turbostat.Pkg%pc2
    131.12 =C2=B1  1%     +54.4%     202.48 =C2=B1  0%  turbostat.PkgWatt
  20774707 =C2=B1 15%    +405.4%   1.05e+08 =C2=B1 27%  cpuidle.C1-HSW.time
     77168 =C2=B1  4%     +21.4%      93647 =C2=B1  2%  cpuidle.C1-HSW.usage
  11231117 =C2=B1 53%  +12135.9%  1.374e+09 =C2=B1 12%  cpuidle.C1E-HSW.time
      4595 =C2=B1 10%    +240.9%      15666 =C2=B1 15%  cpuidle.C1E-HSW.usa=
ge
   2192166 =C2=B1 93%  +1.9e+05%  4.162e+09 =C2=B1 12%  cpuidle.C3-HSW.time
      1436 =C2=B1 14%  +21892.4%     315811 =C2=B1  6%  cpuidle.C3-HSW.usage
 4.395e+10 =C2=B1  3%     -15.0%  3.735e+10 =C2=B1  1%  cpuidle.C6-HSW.time
   2385398 =C2=B1  0%     -20.3%    1901468 =C2=B1  0%  cpuidle.C6-HSW.usage
     66827 =C2=B1100%  +11511.8%    7759922 =C2=B1 23%  cpuidle.POLL.time
     32.50 =C2=B1 45%   +2983.8%       1002 =C2=B1  8%  cpuidle.POLL.usage
      1772 =C2=B1  5%      +8.0%       1914 =C2=B1  4%  proc-vmstat.nr_page=
_table_pages
      6258 =C2=B1  0%     +10.3%       6904 =C2=B1  2%  proc-vmstat.nr_shmem
     43711 =C2=B1  0%     +15.8%      50630 =C2=B1  0%  proc-vmstat.nr_slab=
_unreclaimable
  24073921 =C2=B1  0%     +42.1%   34202892 =C2=B1  1%  proc-vmstat.numa_hit
  24044201 =C2=B1  0%     +42.1%   34173793 =C2=B1  1%  proc-vmstat.numa_lo=
cal
      4936 =C2=B1  1%     +19.4%       5896 =C2=B1  3%  proc-vmstat.pgactiv=
ate
    442793 =C2=B1  4%     +22.5%     542431 =C2=B1 12%  proc-vmstat.pgalloc=
_dma32
  24709314 =C2=B1  0%     +43.3%   35418578 =C2=B1  1%  proc-vmstat.pgalloc=
_normal
  27059462 =C2=B1  0%     +41.9%   38393061 =C2=B1  0%  proc-vmstat.pgfault
  25155012 =C2=B1  0%     +42.9%   35955139 =C2=B1  1%  proc-vmstat.pgfree
      2799 =C2=B1129%     -84.9%     422.50 =C2=B1 52%  numa-meminfo.node0.=
Inactive(anon)
    545456 =C2=B1  2%     +18.6%     646805 =C2=B1  0%  numa-meminfo.node0.=
MemUsed
      7751 =C2=B1 83%     -93.6%     497.50 =C2=B1 42%  numa-meminfo.node0.=
Shmem
     40001 =C2=B1  5%     +21.9%      48780 =C2=B1  4%  numa-meminfo.node1.=
SUnreclaim
     56343 =C2=B1  8%     +20.1%      67696 =C2=B1  5%  numa-meminfo.node1.=
Slab
      4573 =C2=B1 32%    +169.7%      12336 =C2=B1 60%  numa-meminfo.node2.=
Active(anon)
      4908 =C2=B1 32%     +69.0%       8293 =C2=B1 20%  numa-meminfo.node2.=
AnonPages
    594291 =C2=B1  1%     -16.1%     498561 =C2=B1  1%  numa-meminfo.node2.=
MemUsed
      1549 =C2=B1 10%     +32.5%       2052 =C2=B1  5%  numa-meminfo.node2.=
PageTables
     14888 =C2=B1  6%     +24.7%      18569 =C2=B1 11%  numa-meminfo.node2.=
SReclaimable
     40345 =C2=B1  7%     +22.5%      49425 =C2=B1  4%  numa-meminfo.node2.=
SUnreclaim
      2536 =C2=B1137%    +247.5%       8813 =C2=B1 64%  numa-meminfo.node2.=
Shmem
     55233 =C2=B1  5%     +23.1%      67996 =C2=B1  1%  numa-meminfo.node2.=
Slab
     63684 =C2=B1  4%     +10.4%      70297 =C2=B1  2%  numa-meminfo.node3.=
Slab
      1938 =C2=B1 83%     -93.6%     124.00 =C2=B1 42%  numa-vmstat.node0.n=
r_shmem
   3164319 =C2=B1  6%     +55.3%    4913528 =C2=B1 16%  numa-vmstat.node0.n=
uma_hit
   3120338 =C2=B1  7%     +56.0%    4868498 =C2=B1 16%  numa-vmstat.node0.n=
uma_local
      9999 =C2=B1  5%     +22.0%      12195 =C2=B1  4%  numa-vmstat.node1.n=
r_slab_unreclaimable
      1141 =C2=B1 32%    +170.1%       3083 =C2=B1 60%  numa-vmstat.node2.n=
r_active_anon
      1223 =C2=B1 31%     +69.2%       2070 =C2=B1 20%  numa-vmstat.node2.n=
r_anon_pages
     11.00 =C2=B1167%    +570.5%      73.75 =C2=B1 48%  numa-vmstat.node2.n=
r_dirtied
    386.50 =C2=B1 11%     +32.6%     512.50 =C2=B1  5%  numa-vmstat.node2.n=
r_page_table_pages
    633.50 =C2=B1137%    +247.8%       2203 =C2=B1 64%  numa-vmstat.node2.n=
r_shmem
      3722 =C2=B1  6%     +24.7%       4642 =C2=B1 11%  numa-vmstat.node2.n=
r_slab_reclaimable
     10086 =C2=B1  7%     +22.5%      12355 =C2=B1  4%  numa-vmstat.node2.n=
r_slab_unreclaimable
     11.00 =C2=B1167%    +568.2%      73.50 =C2=B1 48%  numa-vmstat.node2.n=
r_written
   3174169 =C2=B1  7%     +52.3%    4834564 =C2=B1 17%  numa-vmstat.node2.n=
uma_hit
   3087580 =C2=B1  7%     +53.5%    4738914 =C2=B1 17%  numa-vmstat.node2.n=
uma_local
    951.00 =C2=B1  7%     -21.8%     744.00 =C2=B1  8%  slabinfo.blkdev_req=
uests.active_objs
    951.00 =C2=B1  7%     -21.8%     744.00 =C2=B1  8%  slabinfo.blkdev_req=
uests.num_objs
     76166 =C2=B1  1%     +30.8%      99641 =C2=B1  0%  slabinfo.dentry.act=
ive_objs
      1813 =C2=B1  1%     +31.2%       2379 =C2=B1  0%  slabinfo.dentry.act=
ive_slabs
     76177 =C2=B1  1%     +31.2%      99952 =C2=B1  0%  slabinfo.dentry.num=
_objs
      1813 =C2=B1  1%     +31.2%       2379 =C2=B1  0%  slabinfo.dentry.num=
_slabs
     19515 =C2=B1  4%    +161.2%      50966 =C2=B1  2%  slabinfo.kmalloc-19=
2.active_objs
    464.25 =C2=B1  4%    +163.4%       1222 =C2=B1  2%  slabinfo.kmalloc-19=
2.active_slabs
     19522 =C2=B1  4%    +163.1%      51372 =C2=B1  2%  slabinfo.kmalloc-19=
2.num_objs
    464.25 =C2=B1  4%    +163.4%       1222 =C2=B1  2%  slabinfo.kmalloc-19=
2.num_slabs
     30657 =C2=B1  5%     +28.3%      39340 =C2=B1  2%  slabinfo.kmalloc-25=
6.active_objs
    490.50 =C2=B1  5%     +27.5%     625.50 =C2=B1  2%  slabinfo.kmalloc-25=
6.active_slabs
     31440 =C2=B1  4%     +27.4%      40058 =C2=B1  2%  slabinfo.kmalloc-25=
6.num_objs
    490.50 =C2=B1  5%     +27.5%     625.50 =C2=B1  2%  slabinfo.kmalloc-25=
6.num_slabs
     76029 =C2=B1  0%     +75.7%     133579 =C2=B1  2%  slabinfo.kmalloc-64=
.active_objs
      1187 =C2=B1  0%     +76.3%       2093 =C2=B1  2%  slabinfo.kmalloc-64=
.active_slabs
     76029 =C2=B1  0%     +76.3%     134029 =C2=B1  2%  slabinfo.kmalloc-64=
.num_objs
      1187 =C2=B1  0%     +76.3%       2093 =C2=B1  2%  slabinfo.kmalloc-64=
.num_slabs
    357.00 =C2=B1 10%     -39.3%     216.75 =C2=B1 10%  slabinfo.kmem_cache=
.active_objs
    357.00 =C2=B1 10%     -39.3%     216.75 =C2=B1 10%  slabinfo.kmem_cache=
.num_objs
    699.00 =C2=B1  6%     -25.2%     523.00 =C2=B1  5%  slabinfo.kmem_cache=
_node.active_objs
    768.00 =C2=B1  5%     -22.9%     592.00 =C2=B1  4%  slabinfo.kmem_cache=
_node.num_objs
      4737 =C2=B1  6%    +102.5%       9592 =C2=B1  1%  slabinfo.mm_struct.=
active_objs
    279.00 =C2=B1  6%    +106.5%     576.25 =C2=B1  1%  slabinfo.mm_struct.=
active_slabs
      4750 =C2=B1  6%    +106.4%       9805 =C2=B1  1%  slabinfo.mm_struct.=
num_objs
    279.00 =C2=B1  6%    +106.5%     576.25 =C2=B1  1%  slabinfo.mm_struct.=
num_slabs
      1754 =C2=B1  3%      -9.6%       1585 =C2=B1  3%  slabinfo.mnt_cache.=
active_objs
      1754 =C2=B1  3%      -9.6%       1585 =C2=B1  3%  slabinfo.mnt_cache.=
num_objs
      5608 =C2=B1  4%    +113.8%      11988 =C2=B1  4%  slabinfo.signal_cac=
he.active_objs
    186.50 =C2=B1  4%    +120.0%     410.25 =C2=B1  3%  slabinfo.signal_cac=
he.active_slabs
      5608 =C2=B1  4%    +119.8%      12330 =C2=B1  3%  slabinfo.signal_cac=
he.num_objs
    186.50 =C2=B1  4%    +120.0%     410.25 =C2=B1  3%  slabinfo.signal_cac=
he.num_slabs
      0.95 =C2=B1  4%     -64.2%       0.34 =C2=B1 46%  perf-profile.cycles=
-pp.__schedule.schedule.rcu_nocb_kthread.kthread.ret_from_fork
      0.82 =C2=B1  1%     +40.9%       1.16 =C2=B1 15%  perf-profile.cycles=
-pp.__schedule.schedule.smpboot_thread_fn.kthread.ret_from_fork
      1.89 =C2=B1  4%     +36.6%       2.58 =C2=B1  8%  perf-profile.cycles=
-pp._dl_addr
      4.97 =C2=B1  2%     +31.8%       6.55 =C2=B1 13%  perf-profile.cycles=
-pp._do_fork.sys_clone.entry_SYSCALL_64_fastpath
      0.65 =C2=B1  6%     +45.0%       0.94 =C2=B1 18%  perf-profile.cycles=
-pp.anon_vma_fork.copy_process._do_fork.sys_clone.entry_SYSCALL_64_fastpath
      1.05 =C2=B1  2%     -29.9%       0.73 =C2=B1 22%  perf-profile.cycles=
-pp.copy_page.do_wp_page.handle_mm_fault.__do_page_fault.do_page_fault
      1.50 =C2=B1  5%     +35.4%       2.04 =C2=B1 16%  perf-profile.cycles=
-pp.copy_page_range.copy_process._do_fork.sys_clone.entry_SYSCALL_64_fastpa=
th
      4.04 =C2=B1  3%     +38.3%       5.59 =C2=B1 15%  perf-profile.cycles=
-pp.copy_process._do_fork.sys_clone.entry_SYSCALL_64_fastpath
      6.56 =C2=B1  2%     +56.6%      10.27 =C2=B1  3%  perf-profile.cycles=
-pp.do_execveat_common.isra.33.sys_execve.return_from_execve
      4.66 =C2=B1  3%     -52.0%       2.24 =C2=B1 90%  perf-profile.cycles=
-pp.do_group_exit.sys_exit_group.entry_SYSCALL_64_fastpath._exit
      0.76 =C2=B1  3%     +46.0%       1.10 =C2=B1  5%  perf-profile.cycles=
-pp.do_set_pte.filemap_map_pages.handle_mm_fault.__do_page_fault.do_page_fa=
ult
      1.98 =C2=B1  3%     +87.3%       3.71 =C2=B1  4%  perf-profile.cycles=
-pp.exit_mmap.mmput.flush_old_exec.load_elf_binary.search_binary_handler
      7.85 =C2=B1  1%     -23.8%       5.98 =C2=B1  7%  perf-profile.cycles=
-pp.filemap_map_pages.handle_mm_fault.__do_page_fault.do_page_fault.page_fa=
ult
      1.97 =C2=B1  5%     +91.0%       3.76 =C2=B1  4%  perf-profile.cycles=
-pp.flush_old_exec.load_elf_binary.search_binary_handler.load_script.search=
_binary_handler
      0.78 =C2=B1  6%     +72.7%       1.34 =C2=B1 23%  perf-profile.cycles=
-pp.free_pages_and_swap_cache.tlb_flush_mmu_free.tlb_finish_mmu.exit_mmap.m=
mput
     12.30 =C2=B1  1%     -14.4%      10.53 =C2=B1 11%  perf-profile.cycles=
-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      3.93 =C2=B1  5%     -10.1%       3.53 =C2=B1  2%  perf-profile.cycles=
-pp.kthread.ret_from_fork
      0.72 =C2=B1  3%     +42.2%       1.03 =C2=B1 16%  perf-profile.cycles=
-pp.load_balance.pick_next_task_fair.__schedule.schedule.smpboot_thread_fn
      4.17 =C2=B1  3%     +62.6%       6.78 =C2=B1  5%  perf-profile.cycles=
-pp.load_elf_binary.search_binary_handler.load_script.search_binary_handler=
.do_execveat_common
      4.46 =C2=B1  3%     +63.1%       7.28 =C2=B1  5%  perf-profile.cycles=
-pp.load_script.search_binary_handler.do_execveat_common.sys_execve.return_=
from_execve
      1.91 =C2=B1  4%     +91.5%       3.66 =C2=B1  4%  perf-profile.cycles=
-pp.mmput.flush_old_exec.load_elf_binary.search_binary_handler.load_script
      0.67 =C2=B1  8%     +52.4%       1.02 =C2=B1 11%  perf-profile.cycles=
-pp.native_irq_return_iret
      0.60 =C2=B1  4%     +54.5%       0.94 =C2=B1 19%  perf-profile.cycles=
-pp.page_remove_rmap.unmap_page_range.unmap_single_vma.unmap_vmas.exit_mmap
      0.77 =C2=B1  2%     +42.6%       1.10 =C2=B1 15%  perf-profile.cycles=
-pp.pick_next_task_fair.__schedule.schedule.smpboot_thread_fn.kthread
      2.14 =C2=B1  6%     -36.6%       1.36 =C2=B1 16%  perf-profile.cycles=
-pp.rcu_nocb_kthread.kthread.ret_from_fork
      0.69 =C2=B1  7%     +70.5%       1.17 =C2=B1 22%  perf-profile.cycles=
-pp.release_pages.free_pages_and_swap_cache.tlb_flush_mmu_free.tlb_finish_m=
mu.exit_mmap
      6.62 =C2=B1  2%     +56.4%      10.36 =C2=B1  3%  perf-profile.cycles=
-pp.return_from_execve
      0.97 =C2=B1  4%     -63.1%       0.36 =C2=B1 46%  perf-profile.cycles=
-pp.schedule.rcu_nocb_kthread.kthread.ret_from_fork
      0.82 =C2=B1  1%     +41.9%       1.17 =C2=B1 15%  perf-profile.cycles=
-pp.schedule.smpboot_thread_fn.kthread.ret_from_fork
      4.18 =C2=B1  3%     +63.1%       6.82 =C2=B1  5%  perf-profile.cycles=
-pp.search_binary_handler.load_script.search_binary_handler.do_execveat_com=
mon.sys_execve
      1.10 =C2=B1  4%     +38.8%       1.53 =C2=B1 16%  perf-profile.cycles=
-pp.smpboot_thread_fn.kthread.ret_from_fork
      4.97 =C2=B1  2%     +31.7%       6.55 =C2=B1 13%  perf-profile.cycles=
-pp.sys_clone.entry_SYSCALL_64_fastpath
      6.62 =C2=B1  2%     +56.5%      10.36 =C2=B1  3%  perf-profile.cycles=
-pp.sys_execve.return_from_execve
      0.61 =C2=B1  6%     +67.1%       1.01 =C2=B1 34%  perf-profile.cycles=
-pp.tlb_finish_mmu.exit_mmap.mmput.do_exit.do_group_exit
      0.58 =C2=B1  7%     +67.8%       0.98 =C2=B1 35%  perf-profile.cycles=
-pp.tlb_flush_mmu_free.tlb_finish_mmu.exit_mmap.mmput.do_exit
      2.01 =C2=B1  0%     +16.3%       2.33 =C2=B1  7%  perf-profile.cycles=
-pp.unlock_page.filemap_map_pages.handle_mm_fault.__do_page_fault.do_page_f=
ault
      2.23 =C2=B1  1%     +53.1%       3.42 =C2=B1  8%  perf-profile.cycles=
-pp.unmap_page_range.unmap_single_vma.unmap_vmas.exit_mmap.mmput
      0.97 =C2=B1  6%     +92.7%       1.86 =C2=B1  7%  perf-profile.cycles=
-pp.unmap_single_vma.unmap_vmas.exit_mmap.mmput.flush_old_exec
      1.06 =C2=B1  6%     +92.0%       2.03 =C2=B1  7%  perf-profile.cycles=
-pp.unmap_vmas.exit_mmap.mmput.flush_old_exec.load_elf_binary
      1.08 =C2=B1  5%     +33.3%       1.44 =C2=B1 15%  perf-profile.cycles=
-pp.wp_page_copy.isra.58.do_wp_page.handle_mm_fault.__do_page_fault.do_page=
_fault

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/testtime:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-hsx04/fo=
rk_test/aim9/300s

commit: =

  9a4cb134f8adcf1413808e4d07bb637c83e437ba
  6df481c389734ccc3a2a007c51e3dd557e5776ca

9a4cb134f8adcf14 6df481c389734ccc3a2a007c51 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      2359 =C2=B1  0%    +113.7%       5041 =C2=B1  3%  aim9.fork_test.ops_=
per_sec
    615.50 =C2=B1  2%    +151.5%       1548 =C2=B1  7%  aim9.time.involunta=
ry_context_switches
  24067036 =C2=B1  1%    +112.1%   51051335 =C2=B1  3%  aim9.time.minor_pag=
e_faults
   1413208 =C2=B1  0%    +113.7%    3020551 =C2=B1  3%  aim9.time.voluntary=
_context_switches
    390.00 =C2=B1  0%     +23.4%     481.36 =C2=B1  0%  pmeter.Average_Acti=
ve_Power
      6.05 =C2=B1  0%     +73.1%      10.47 =C2=B1  2%  pmeter.performance_=
per_watt
    394565 =C2=B1  0%     -36.7%     249722 =C2=B1  0%  softirqs.SCHED
   1211155 =C2=B1  0%     -46.3%     650989 =C2=B1  1%  softirqs.TIMER
     18844 =C2=B1  0%     +24.5%      23458 =C2=B1  2%  vmstat.system.cs
      2033 =C2=B1  0%      +8.8%       2211 =C2=B1  1%  vmstat.system.in
     28908 =C2=B1105%   +3443.2%    1024275 =C2=B1100%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     28908 =C2=B1105%   +4396.5%    1299863 =C2=B1100%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     28908 =C2=B1105%   +6986.4%    2048551 =C2=B1100%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      2071 =C2=B1 80%    +879.7%      20290 =C2=B1150%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.link_path_walk
    615.50 =C2=B1  2%    +151.5%       1548 =C2=B1  7%  time.involuntary_co=
ntext_switches
  24067036 =C2=B1  1%    +112.1%   51051335 =C2=B1  3%  time.minor_page_fau=
lts
     10.04 =C2=B1  1%     -38.7%       6.16 =C2=B1  1%  time.user_time
   1413208 =C2=B1  0%    +113.7%    3020551 =C2=B1  3%  time.voluntary_cont=
ext_switches
   5854678 =C2=B1  2%    +137.2%   13888138 =C2=B1 16%  numa-numastat.node0=
.local_node
   5864668 =C2=B1  2%    +136.9%   13896095 =C2=B1 16%  numa-numastat.node0=
.numa_hit
   5909056 =C2=B1  2%     +61.8%    9559429 =C2=B1 24%  numa-numastat.node1=
.local_node
   5915466 =C2=B1  2%     +61.7%    9566771 =C2=B1 24%  numa-numastat.node1=
.numa_hit
   5895526 =C2=B1  2%    +156.0%   15091426 =C2=B1 21%  numa-numastat.node3=
.local_node
   5906616 =C2=B1  2%    +155.7%   15102488 =C2=B1 21%  numa-numastat.node3=
.numa_hit
      0.83 =C2=B1  0%      -5.4%       0.79 =C2=B1  0%  turbostat.%Busy
      3.27 =C2=B1  9%    +477.4%      18.89 =C2=B1  6%  turbostat.CPU%c1
      0.01 =C2=B1-10000%   +1100.0%       0.12 =C2=B1 38%  turbostat.CPU%c3
     95.90 =C2=B1  0%     -16.4%      80.20 =C2=B1  1%  turbostat.CPU%c6
     35.50 =C2=B1  1%     +19.0%      42.25 =C2=B1  5%  turbostat.CoreTmp
     57.81 =C2=B1  0%     -26.0%      42.77 =C2=B1  4%  turbostat.Pkg%pc2
     39.75 =C2=B1  1%     +12.6%      44.75 =C2=B1  1%  turbostat.PkgTmp
    126.47 =C2=B1  0%     +66.1%     210.02 =C2=B1  0%  turbostat.PkgWatt
    171256 =C2=B1  0%     +28.9%     220773 =C2=B1  1%  meminfo.Active
     38197 =C2=B1  1%     +29.1%      49316 =C2=B1  1%  meminfo.Active(anon)
    133058 =C2=B1  1%     +28.9%     171457 =C2=B1  2%  meminfo.Active(file)
     29573 =C2=B1  2%     +16.5%      34455 =C2=B1  2%  meminfo.AnonPages
    134364 =C2=B1  1%    +487.6%     789587 =C2=B1  4%  meminfo.Committed_AS
    207374 =C2=B1  7%     -16.0%     174124 =C2=B1 10%  meminfo.DirectMap4k
    179915 =C2=B1  1%     +16.3%     209228 =C2=B1  0%  meminfo.SUnreclaim
     22316 =C2=B1  0%     +19.2%      26604 =C2=B1  1%  meminfo.Shmem
    247443 =C2=B1  1%     +12.0%     277110 =C2=B1  0%  meminfo.Slab
  21320688 =C2=B1 12%    +832.6%  1.988e+08 =C2=B1 37%  cpuidle.C1-HSW.time
     73857 =C2=B1  1%     +25.6%      92774 =C2=B1  2%  cpuidle.C1-HSW.usage
  76807447 =C2=B1 98%   +7888.7%  6.136e+09 =C2=B1 10%  cpuidle.C1E-HSW.time
      3719 =C2=B1 34%  +36842.8%    1373995 =C2=B1 16%  cpuidle.C1E-HSW.usa=
ge
   1662410 =C2=B1 61%   +6555.8%  1.106e+08 =C2=B1 14%  cpuidle.C3-HSW.time
      1747 =C2=B1 12%  +21168.1%     371659 =C2=B1 15%  cpuidle.C3-HSW.usage
 4.289e+10 =C2=B1  0%     -14.8%  3.653e+10 =C2=B1  1%  cpuidle.C6-HSW.time
   2769655 =C2=B1  0%     -38.1%    1715615 =C2=B1  5%  cpuidle.C6-HSW.usage
     33498 =C2=B1148%  +14178.3%    4783051 =C2=B1 25%  cpuidle.POLL.time
     59.75 =C2=B1 42%   +1659.0%       1051 =C2=B1 13%  cpuidle.POLL.usage
      9547 =C2=B1  1%     +29.1%      12322 =C2=B1  1%  proc-vmstat.nr_acti=
ve_anon
     33249 =C2=B1  1%     +28.9%      42863 =C2=B1  2%  proc-vmstat.nr_acti=
ve_file
      7400 =C2=B1  2%     +16.5%       8618 =C2=B1  2%  proc-vmstat.nr_anon=
_pages
      2428 =C2=B1  1%     -10.4%       2175 =C2=B1  4%  proc-vmstat.nr_page=
_table_pages
      5579 =C2=B1  0%     +19.2%       6650 =C2=B1  1%  proc-vmstat.nr_shmem
     44974 =C2=B1  1%     +16.3%      52293 =C2=B1  0%  proc-vmstat.nr_slab=
_unreclaimable
  23515066 =C2=B1  2%    +111.7%   49780502 =C2=B1  1%  proc-vmstat.numa_hit
  23485225 =C2=B1  2%    +111.8%   49752148 =C2=B1  1%  proc-vmstat.numa_lo=
cal
     20877 =C2=B1  0%     +98.1%      41367 =C2=B1  2%  proc-vmstat.pgactiv=
ate
    517464 =C2=B1  2%     +71.1%     885179 =C2=B1 11%  proc-vmstat.pgalloc=
_dma32
  25186761 =C2=B1  2%    +118.2%   54950756 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
  24800002 =C2=B1  1%    +108.9%   51811411 =C2=B1  3%  proc-vmstat.pgfault
  25689514 =C2=B1  2%    +117.2%   55795269 =C2=B1  0%  proc-vmstat.pgfree
     40202 =C2=B1  6%     +54.0%      61912 =C2=B1 17%  numa-meminfo.node0.=
Active
      6240 =C2=B1 40%    +135.8%      14717 =C2=B1 31%  numa-meminfo.node0.=
Active(anon)
     33961 =C2=B1  3%     +39.0%      47195 =C2=B1 26%  numa-meminfo.node0.=
Active(file)
    127461 =C2=B1  2%     +15.2%     146775 =C2=B1  9%  numa-meminfo.node0.=
FilePages
     49016 =C2=B1  3%     +15.9%      56799 =C2=B1  3%  numa-meminfo.node0.=
SUnreclaim
      2497 =C2=B1141%    +215.1%       7868 =C2=B1 65%  numa-meminfo.node0.=
Shmem
     64287 =C2=B1  1%     +15.4%      74161 =C2=B1  5%  numa-meminfo.node0.=
Slab
     45929 =C2=B1  7%     +18.3%      54320 =C2=B1  6%  numa-meminfo.node1.=
Active
     32814 =C2=B1  4%     +37.2%      45021 =C2=B1  3%  numa-meminfo.node1.=
Active(file)
      9616 =C2=B1 12%     -40.0%       5773 =C2=B1 39%  numa-meminfo.node1.=
AnonPages
      2609 =C2=B1 13%     -53.7%       1207 =C2=B1 16%  numa-meminfo.node1.=
PageTables
      6501 =C2=B1 18%     +74.0%      11315 =C2=B1 22%  numa-meminfo.node2.=
AnonPages
      3141 =C2=B1  0%     +95.7%       6148 =C2=B1 48%  numa-meminfo.node2.=
Mapped
    559677 =C2=B1  9%     -11.3%     496371 =C2=B1  2%  numa-meminfo.node2.=
MemUsed
     41990 =C2=B1  2%     +17.6%      49382 =C2=B1  5%  numa-meminfo.node2.=
SUnreclaim
     59728 =C2=B1  5%     +11.4%      66556 =C2=B1  5%  numa-meminfo.node2.=
Slab
     39149 =C2=B1  6%     +32.6%      51926 =C2=B1  8%  numa-meminfo.node3.=
Active
     33190 =C2=B1  4%     +34.7%      44700 =C2=B1 13%  numa-meminfo.node3.=
Active(file)
    127828 =C2=B1  2%      +7.0%     136835 =C2=B1  4%  numa-meminfo.node3.=
FilePages
     44894 =C2=B1  6%     +27.5%      57235 =C2=B1  3%  numa-meminfo.node3.=
SUnreclaim
     59868 =C2=B1  6%     +23.6%      73991 =C2=B1  4%  numa-meminfo.node3.=
Slab
      1558 =C2=B1 40%    +135.9%       3676 =C2=B1 31%  numa-vmstat.node0.n=
r_active_anon
      8491 =C2=B1  3%     +38.9%      11797 =C2=B1 26%  numa-vmstat.node0.n=
r_active_file
     31866 =C2=B1  2%     +15.1%      36692 =C2=B1  9%  numa-vmstat.node0.n=
r_file_pages
    623.75 =C2=B1141%    +215.3%       1966 =C2=B1 66%  numa-vmstat.node0.n=
r_shmem
     12254 =C2=B1  3%     +15.9%      14196 =C2=B1  3%  numa-vmstat.node0.n=
r_slab_unreclaimable
   3074685 =C2=B1  2%    +143.1%    7474391 =C2=B1 16%  numa-vmstat.node0.n=
uma_hit
   3028772 =C2=B1  2%    +145.4%    7431676 =C2=B1 16%  numa-vmstat.node0.n=
uma_local
      8204 =C2=B1  4%     +37.2%      11254 =C2=B1  3%  numa-vmstat.node1.n=
r_active_file
      2402 =C2=B1 12%     -40.3%       1433 =C2=B1 39%  numa-vmstat.node1.n=
r_anon_pages
    648.00 =C2=B1 14%     -54.6%     294.50 =C2=B1 18%  numa-vmstat.node1.n=
r_page_table_pages
   3155146 =C2=B1  2%     +59.9%    5045487 =C2=B1 23%  numa-vmstat.node1.n=
uma_hit
   3086223 =C2=B1  2%     +61.5%    4983428 =C2=B1 23%  numa-vmstat.node1.n=
uma_local
    597.50 =C2=B1  1%     +10.5%     660.25 =C2=B1  2%  numa-vmstat.node2.n=
r_alloc_batch
      1620 =C2=B1 17%     +75.4%       2841 =C2=B1 22%  numa-vmstat.node2.n=
r_anon_pages
    785.00 =C2=B1  0%     +95.8%       1537 =C2=B1 48%  numa-vmstat.node2.n=
r_mapped
     10498 =C2=B1  2%     +17.6%      12345 =C2=B1  5%  numa-vmstat.node2.n=
r_slab_unreclaimable
      8299 =C2=B1  4%     +34.6%      11173 =C2=B1 13%  numa-vmstat.node3.n=
r_active_file
     31958 =C2=B1  2%      +7.0%      34207 =C2=B1  4%  numa-vmstat.node3.n=
r_file_pages
     11223 =C2=B1  6%     +27.5%      14305 =C2=B1  3%  numa-vmstat.node3.n=
r_slab_unreclaimable
   3120991 =C2=B1  2%    +137.7%    7417057 =C2=B1 23%  numa-vmstat.node3.n=
uma_hit
   3023169 =C2=B1  2%    +142.1%    7320343 =C2=B1 24%  numa-vmstat.node3.n=
uma_local
      1.05 =C2=B1  3%     -46.9%       0.56 =C2=B1  2%  perf-profile.cycles=
-pp.__schedule.schedule.schedule_preempt_disabled.cpu_startup_entry.start_s=
econdary
      0.97 =C2=B1  3%     +44.8%       1.41 =C2=B1  7%  perf-profile.cycles=
-pp.anon_vma_clone.anon_vma_fork.copy_process._do_fork.sys_clone
      1.92 =C2=B1  1%     +23.0%       2.37 =C2=B1  7%  perf-profile.cycles=
-pp.anon_vma_fork.copy_process._do_fork.sys_clone.entry_SYSCALL_64_fastpath
     56.66 =C2=B1  0%     -18.9%      45.96 =C2=B1  6%  perf-profile.cycles=
-pp.call_cpuidle.cpu_startup_entry.start_secondary
      1.32 =C2=B1  5%     -63.0%       0.49 =C2=B1 18%  perf-profile.cycles=
-pp.copy_page.do_wp_page.handle_mm_fault.__do_page_fault.do_page_fault
      4.11 =C2=B1  1%     +25.0%       5.14 =C2=B1 12%  perf-profile.cycles=
-pp.copy_page_range.copy_process._do_fork.sys_clone.entry_SYSCALL_64_fastpa=
th
     60.87 =C2=B1  0%     -19.0%      49.29 =C2=B1  5%  perf-profile.cycles=
-pp.cpu_startup_entry.start_secondary
     56.66 =C2=B1  0%     -18.9%      45.95 =C2=B1  6%  perf-profile.cycles=
-pp.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
     55.98 =C2=B1  0%     -18.7%      45.50 =C2=B1  6%  perf-profile.cycles=
-pp.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_=
secondary
      0.19 =C2=B1 46%    +406.5%       0.97 =C2=B1 32%  perf-profile.cycles=
-pp.do_exit.do_group_exit.sys_exit_group.entry_SYSCALL_64_fastpath
      0.18 =C2=B1 53%    +438.4%       0.98 =C2=B1 32%  perf-profile.cycles=
-pp.do_group_exit.sys_exit_group.entry_SYSCALL_64_fastpath
      1.68 =C2=B1  2%     -12.8%       1.46 =C2=B1  7%  perf-profile.cycles=
-pp.do_wait.sys_wait4.entry_SYSCALL_64_fastpath
      2.25 =C2=B1  6%     -25.7%       1.67 =C2=B1 11%  perf-profile.cycles=
-pp.do_wp_page.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      0.18 =C2=B1 37%    +352.9%       0.79 =C2=B1 34%  perf-profile.cycles=
-pp.exit_mmap.mmput.do_exit.do_group_exit.sys_exit_group
      0.32 =C2=B1  9%     +76.4%       0.56 =C2=B1 51%  perf-profile.cycles=
-pp.filemap_map_pages.handle_mm_fault.__do_page_fault.do_page_fault.page_fa=
ult
     56.13 =C2=B1  0%     -18.4%      45.83 =C2=B1  6%  perf-profile.cycles=
-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_e=
ntry
      3.00 =C2=B1  3%     -62.2%       1.14 =C2=B1  8%  perf-profile.cycles=
-pp.kthread.ret_from_fork
      0.18 =C2=B1 37%    +352.9%       0.79 =C2=B1 34%  perf-profile.cycles=
-pp.mmput.do_exit.do_group_exit.sys_exit_group.entry_SYSCALL_64_fastpath
      2.39 =C2=B1  5%     -73.1%       0.64 =C2=B1 11%  perf-profile.cycles=
-pp.rcu_nocb_kthread.kthread.ret_from_fork
      3.02 =C2=B1  3%     -60.6%       1.19 =C2=B1 10%  perf-profile.cycles=
-pp.ret_from_fork
      0.91 =C2=B1  6%     -94.2%       0.05 =C2=B1  8%  perf-profile.cycles=
-pp.schedule.rcu_nocb_kthread.kthread.ret_from_fork
      1.20 =C2=B1  3%     -47.0%       0.64 =C2=B1  1%  perf-profile.cycles=
-pp.schedule.schedule_preempt_disabled.cpu_startup_entry.start_secondary
      1.21 =C2=B1  2%     -45.8%       0.66 =C2=B1  1%  perf-profile.cycles=
-pp.schedule_preempt_disabled.cpu_startup_entry.start_secondary
      1.50 =C2=B1  4%     -22.6%       1.16 =C2=B1  8%  perf-profile.cycles=
-pp.select_task_rq_fair.wake_up_new_task._do_fork.sys_clone.entry_SYSCALL_6=
4_fastpath
     61.06 =C2=B1  0%     -19.1%      49.37 =C2=B1  5%  perf-profile.cycles=
-pp.start_secondary
      0.18 =C2=B1 53%    +438.4%       0.98 =C2=B1 32%  perf-profile.cycles=
-pp.sys_exit_group.entry_SYSCALL_64_fastpath
      1.73 =C2=B1  2%     -14.1%       1.49 =C2=B1  7%  perf-profile.cycles=
-pp.sys_wait4.entry_SYSCALL_64_fastpath
      2.12 =C2=B1  2%     -21.7%       1.66 =C2=B1 10%  perf-profile.cycles=
-pp.wake_up_new_task._do_fork.sys_clone.entry_SYSCALL_64_fastpath
      0.74 =C2=B1  8%     +32.3%       0.98 =C2=B1  9%  perf-profile.cycles=
-pp.wp_page_copy.isra.58.do_wp_page.handle_mm_fault.__do_page_fault.do_page=
_fault
     13781 =C2=B1  0%    +253.7%      48744 =C2=B1  6%  slabinfo.kmalloc-12=
8.active_objs
    214.75 =C2=B1  0%    +257.5%     767.75 =C2=B1  6%  slabinfo.kmalloc-12=
8.active_slabs
     13781 =C2=B1  0%    +256.6%      49149 =C2=B1  6%  slabinfo.kmalloc-12=
8.num_objs
    214.75 =C2=B1  0%    +257.5%     767.75 =C2=B1  6%  slabinfo.kmalloc-12=
8.num_slabs
     16964 =C2=B1  1%    +168.1%      45487 =C2=B1  6%  slabinfo.kmalloc-19=
2.active_objs
    403.50 =C2=B1  1%    +170.3%       1090 =C2=B1  6%  slabinfo.kmalloc-19=
2.active_slabs
     16964 =C2=B1  1%    +170.1%      45828 =C2=B1  6%  slabinfo.kmalloc-19=
2.num_objs
    403.50 =C2=B1  1%    +170.3%       1090 =C2=B1  6%  slabinfo.kmalloc-19=
2.num_slabs
     43002 =C2=B1  0%    +194.9%     126825 =C2=B1  7%  slabinfo.kmalloc-32=
.active_objs
    337.75 =C2=B1  0%    +195.7%     998.75 =C2=B1  7%  slabinfo.kmalloc-32=
.active_slabs
     43293 =C2=B1  0%    +195.4%     127900 =C2=B1  7%  slabinfo.kmalloc-32=
.num_objs
    337.75 =C2=B1  0%    +195.7%     998.75 =C2=B1  7%  slabinfo.kmalloc-32=
.num_slabs
     93314 =C2=B1  2%     +95.7%     182573 =C2=B1  2%  slabinfo.kmalloc-64=
.active_objs
      1457 =C2=B1  2%     +96.4%       2863 =C2=B1  2%  slabinfo.kmalloc-64=
.active_slabs
     93314 =C2=B1  2%     +96.4%     183278 =C2=B1  2%  slabinfo.kmalloc-64=
.num_objs
      1457 =C2=B1  2%     +96.4%       2863 =C2=B1  2%  slabinfo.kmalloc-64=
.num_slabs
    459.00 =C2=B1  7%     -55.6%     204.00 =C2=B1 17%  slabinfo.kmem_cache=
.active_objs
    459.00 =C2=B1  7%     -55.6%     204.00 =C2=B1 17%  slabinfo.kmem_cache=
.num_objs
    827.00 =C2=B1  5%     -38.7%     507.00 =C2=B1  8%  slabinfo.kmem_cache=
_node.active_objs
    896.00 =C2=B1  5%     -35.7%     576.00 =C2=B1  7%  slabinfo.kmem_cache=
_node.num_objs
      6453 =C2=B1  5%     +73.5%      11196 =C2=B1  2%  slabinfo.mm_struct.=
active_objs
    382.50 =C2=B1  5%     +75.3%     670.50 =C2=B1  2%  slabinfo.mm_struct.=
active_slabs
      6510 =C2=B1  5%     +75.2%      11406 =C2=B1  2%  slabinfo.mm_struct.=
num_objs
    382.50 =C2=B1  5%     +75.3%     670.50 =C2=B1  2%  slabinfo.mm_struct.=
num_slabs
      5772 =C2=B1  3%     +71.6%       9906 =C2=B1  5%  slabinfo.signal_cac=
he.active_objs
    192.00 =C2=B1  3%     +77.6%     341.00 =C2=B1  5%  slabinfo.signal_cac=
he.active_slabs
      5782 =C2=B1  3%     +77.2%      10243 =C2=B1  5%  slabinfo.signal_cac=
he.num_objs
    192.00 =C2=B1  3%     +77.6%     341.00 =C2=B1  5%  slabinfo.signal_cac=
he.num_slabs
     47491 =C2=B1  3%     -37.2%      29843 =C2=B1  1%  slabinfo.vm_area_st=
ruct.active_objs
      1079 =C2=B1  3%     -37.2%     678.00 =C2=B1  1%  slabinfo.vm_area_st=
ruct.active_slabs
     47500 =C2=B1  3%     -37.2%      29843 =C2=B1  1%  slabinfo.vm_area_st=
ruct.num_objs
      1079 =C2=B1  3%     -37.2%     678.00 =C2=B1  1%  slabinfo.vm_area_st=
ruct.num_slabs


lkp-hsx04: Brickland Haswell-EX
Memory: 512G


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

--===============4967347020151952529==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogYWltOQpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IGFjdGl2YXRlLW1vbml0b3IK
ICBrbXNnOiAKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0
OiAKICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJv
Yy1zdGF0OgogICAgaW50ZXJ2YWw6IDEwCiAgbWVtaW5mbzogCiAgc2xhYmluZm86IAogIGludGVy
cnVwdHM6IAogIGxvY2tfc3RhdDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGlycXM6IAogIGJk
aV9kZXZfbWFwcGluZzogCiAgZGlza3N0YXRzOiAKICBuZnNzdGF0OiAKICBjcHVpZGxlOiAKICBj
cHVmcmVxLXN0YXRzOiAKICB0dXJib3N0YXQ6IAogIHBtZXRlcjogCiAgc2NoZWRfZGVidWc6CiAg
ICBpbnRlcnZhbDogNjAKY3B1ZnJlcV9nb3Zlcm5vcjogcGVyZm9ybWFuY2UKZGVmYXVsdC13YXRj
aGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IDZkZjQ4MWMzODk3MzRj
Y2MzYTJhMDA3YzUxZTNkZDU1N2U1Nzc2Y2EKbW9kZWw6IEJyaWNrbGFuZCBIYXN3ZWxsLUVYCm5y
X2NwdTogMTIwCm1lbW9yeTogNTEyRwpuaGRkX3BhcnRpdGlvbnM6IApzd2FwX3BhcnRpdGlvbnM6
IApwbWV0ZXJfc2VydmVyOiBsa3Atc3QwMQpwbWV0ZXJfZGV2aWNlOiB5b2tvZ2F3YS13dDMxMApj
YXRlZ29yeTogYmVuY2htYXJrCnBlcmYtcHJvZmlsZTogCmFpbTk6CiAgdGVzdHRpbWU6IDMwMHMK
ICB0ZXN0OiBmb3JrX3Rlc3QKcXVldWU6IGJpc2VjdAp0ZXN0Ym94OiBsa3AtaHN4MDQKdGJveF9n
cm91cDogbGtwLWhzeDA0Cmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNS0x
Mi0yMSAwNzoxNzowNy43ODI1MzY2NjYgKzA4OjAwCmlkOiBkNDVlM2Y5ZjgxZThkYjI5YzVmOWQw
YzU1NGRlZDEwODVhNjYxNTk4CnVzZXI6IGxrcApjb21waWxlcjogZ2NjLTQuOQpoZWFkX2NvbW1p
dDogOGFiMzQwY2Y2MmJjZGRiM2VlNDM1ZTRmMWZkYjJmOTVmMWE0M2NiOApiYXNlX2NvbW1pdDog
OWY5NDk5YWU4ZTY0MTVjZWZjNGZlMGE5NmFkMGUyNzg2NDM1M2M4OQpicmFuY2g6IGxpbnV4LWRl
dmVsL2RldmVsLWhvdXJseS0yMDE1MTIyMDE5CnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1bHQvYWltOS9wZXJmb3JtYW5jZS0zMDBzLWZvcmtf
dGVzdC9sa3AtaHN4MDQvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9n
Y2MtNC45LzZkZjQ4MWMzODk3MzRjY2MzYTJhMDA3YzUxZTNkZDU1N2U1Nzc2Y2EvMCIKam9iX2Zp
bGU6ICIvbGtwL3NjaGVkdWxlZC9sa3AtaHN4MDQvYmlzZWN0X2FpbTktcGVyZm9ybWFuY2UtMzAw
cy1mb3JrX3Rlc3QtZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZfNjQtcmhlbC02ZGY0
ODFjMzg5NzM0Y2NjM2EyYTAwN2M1MWUzZGQ1NTdlNTc3NmNhLTIwMTUxMjIxLTEyNDQxNy1wcGpk
YjMtMC55YW1sIgptYXhfdXB0aW1lOiAxMjkxLjU2CmluaXRyZDogIi9vc2ltYWdlL2RlYmlhbi9k
ZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVyX2FwcGVuZDoKLSByb290PS9k
ZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVkL2xrcC1oc3gwNC9iaXNlY3Rf
YWltOS1wZXJmb3JtYW5jZS0zMDBzLWZvcmtfdGVzdC1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6LXg4Nl82NC1yaGVsLTZkZjQ4MWMzODk3MzRjY2MzYTJhMDA3YzUxZTNkZDU1N2U1Nzc2Y2Et
MjAxNTEyMjEtMTI0NDE3LXBwamRiMy0wLnlhbWwKLSBBUkNIPXg4Nl82NAotIGtjb25maWc9eDg2
XzY0LXJoZWwKLSBicmFuY2g9bGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUxMjIwMTkKLSBj
b21taXQ9NmRmNDgxYzM4OTczNGNjYzNhMmEwMDdjNTFlM2RkNTU3ZTU3NzZjYQotIEJPT1RfSU1B
R0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzZkZjQ4MWMzODk3MzRjY2MzYTJhMDA3
YzUxZTNkZDU1N2U1Nzc2Y2Evdm1saW51ei00LjQuMC1yYzItMDAwNDAtZzZkZjQ4MWMzCi0gbWF4
X3VwdGltZT0xMjkxCi0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC9haW05L3BlcmZvcm1hbmNlLTMwMHMt
Zm9ya190ZXN0L2xrcC1oc3gwNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1y
aGVsL2djYy00LjkvNmRmNDgxYzM4OTczNGNjYzNhMmEwMDdjNTFlM2RkNTU3ZTU3NzZjYS8wCi0g
TEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1k
LmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJj
dXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3Bh
bmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0
X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFs
CgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNneiIKbW9kdWxlc19pbml0
cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNmRmNDgxYzM4OTczNGNjYzNhMmEw
MDdjNTFlM2RkNTU3ZTU3NzZjYS9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVw
cy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJp
YW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9k
ZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtz
L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL2FpbTkteDg2XzY0LmNneiIKcmVwZWF0X3Rv
OiAyCmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS82ZGY0ODFjMzg5NzM0
Y2NjM2EyYTAwN2M1MWUzZGQ1NTdlNTc3NmNhL3ZtbGludXotNC40LjAtcmMyLTAwMDQwLWc2ZGY0
ODFjMyIKZGVxdWV1ZV90aW1lOiAyMDE1LTEyLTIxIDA3OjIzOjExLjEzNzc3ODM3OSArMDg6MDAK
am9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAwLjc1IDAuNTkgMC4yOCAxLzEzMjUgOTQ0MTYK
c3RhcnRfdGltZTogJzE0NTA2NTM4NDYnCmVuZF90aW1lOiAnMTQ1MDY1NDE0NicKdmVyc2lvbjog
Ii9sa3AvbGtwLy5zcmMtMjAxNTEyMTktMDkxNDAxIgo=

--===============4967347020151952529==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNS0xMi0yMSAwNzoyNDowMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUt
MTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwMC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAxL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUt
MTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwMy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTA0L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUt
MTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTA3L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUt
MTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTEvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0x
Mi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMTIvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0x
Mi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMTUvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0x
Mi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTE3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMTgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0x
Mi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEyMC9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTIxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEy
LTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUxMjIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEyMy9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTI0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEy
LTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUxMjUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEyNi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTI3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEy
LTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUxMjgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEyOS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTIt
MjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEzMC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMxL2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUxMzIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTIt
MjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEzMy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTM0L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUxMzUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTIt
MjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEzNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTM3L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUxMzgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTIt
MjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEzOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTQvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTE0MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0y
MSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MTQxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNDIvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTE0My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0y
MSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE2L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAw
NzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTgv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE5L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0
OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMC9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1
IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMy9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIw
MTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNi9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUt
MTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTI4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyOS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0y
MSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MzAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMxL2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUzMi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAw
NzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzMv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM0L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUzNS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoy
NDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzYvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUzOC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDow
NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIw
MTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTQwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUt
MTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTQzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTIt
MjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTQ2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NDgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjEg
MDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ5
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoy
NDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTEvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHU1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDow
NSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTQvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU1Ni9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTcvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1
LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU1OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ni9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTIt
MjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTYxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2Mi9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjEg
MDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY0
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2NS9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1NjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6
MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY3L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6
MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU3MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzIvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTczL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1
LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU3NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzUvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEy
LTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU3Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzgvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTc5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIx
IDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4MC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1ODEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6
MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgyL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1ODQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6
MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg1L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4Ni9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1ODcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUg
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg4L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
NS0xMi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTAvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEy
LTIxIDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU5Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTMvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTk0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIx
IDA3OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5
NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTYvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTUtMTItMjEgMDc6MjQ6MDUgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTk3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTIxIDA3
OjI0OjA1IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5OC9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0yMSAwNzoyNDowNSBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCg==

--===============4967347020151952529==--

