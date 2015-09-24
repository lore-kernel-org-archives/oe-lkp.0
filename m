Content-Type: multipart/mixed; boundary="===============0079188086175150438=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [sched/fair] 98d8fd8126: -20.8% hackbench.throughput
Date: Thu, 24 Sep 2015 10:00:33 +0800
Message-ID: <87si64mv9a.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0079188086175150438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
commit 98d8fd8126676f7ba6e133e65b2ca4b17989d32c ("sched/fair: Initialize ta=
sk load and utilization before placing task on rq")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/nr_threads/mode/ipc:
  lkp-ws02/hackbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/1600%=
/process/pipe

commit: =

  231678b768da07d19ab5683a39eeb0c250631d02
  98d8fd8126676f7ba6e133e65b2ca4b17989d32c

231678b768da07d1 98d8fd8126676f7ba6e133e65b =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    188818 =C2=B1  1%     -20.8%     149585 =C2=B1  1%  hackbench.throughput
  81712173 =C2=B1  4%    +211.8%  2.548e+08 =C2=B1  1%  hackbench.time.invo=
luntary_context_switches
  21611286 =C2=B1  0%     -19.2%   17453366 =C2=B1  1%  hackbench.time.mino=
r_page_faults
      2226 =C2=B1  0%      +1.3%       2255 =C2=B1  0%  hackbench.time.perc=
ent_of_cpu_this_job_got
     12445 =C2=B1  0%      +2.1%      12704 =C2=B1  0%  hackbench.time.syst=
em_time
 2.494e+08 =C2=B1  3%    +118.5%  5.448e+08 =C2=B1  1%  hackbench.time.volu=
ntary_context_switches
   1097790 =C2=B1  0%     +50.6%    1653664 =C2=B1  1%  softirqs.RCU
    554877 =C2=B1  3%    +137.8%    1319318 =C2=B1  1%  vmstat.system.cs
     89017 =C2=B1  4%    +187.8%     256235 =C2=B1  1%  vmstat.system.in
 1.312e+08 =C2=B1  1%     -16.0%  1.102e+08 =C2=B1  4%  numa-numastat.node0=
.local_node
 1.312e+08 =C2=B1  1%     -16.0%  1.102e+08 =C2=B1  4%  numa-numastat.node0=
.numa_hit
 1.302e+08 =C2=B1  1%     -34.9%   84785305 =C2=B1  5%  numa-numastat.node1=
.local_node
 1.302e+08 =C2=B1  1%     -34.9%   84785344 =C2=B1  5%  numa-numastat.node1=
.numa_hit
    302.00 =C2=B1  1%     -19.2%     244.00 =C2=B1  1%  time.file_system_ou=
tputs
  81712173 =C2=B1  4%    +211.8%  2.548e+08 =C2=B1  1%  time.involuntary_co=
ntext_switches
  21611286 =C2=B1  0%     -19.2%   17453366 =C2=B1  1%  time.minor_page_fau=
lts
 2.494e+08 =C2=B1  3%    +118.5%  5.448e+08 =C2=B1  1%  time.voluntary_cont=
ext_switches
     92.88 =C2=B1  0%      +1.3%      94.13 =C2=B1  0%  turbostat.%Busy
      2675 =C2=B1  0%      +1.8%       2723 =C2=B1  0%  turbostat.Avg_MHz
      4.44 =C2=B1  1%     -24.9%       3.34 =C2=B1  2%  turbostat.CPU%c1
      0.98 =C2=B1  2%     -32.2%       0.66 =C2=B1  3%  turbostat.CPU%c3
  2.79e+08 =C2=B1  4%     -25.2%  2.086e+08 =C2=B1  6%  cpuidle.C1-NHM.time
 1.235e+08 =C2=B1  4%     -28.6%   88251264 =C2=B1  7%  cpuidle.C1E-NHM.time
    243525 =C2=B1  4%     -21.9%     190252 =C2=B1  8%  cpuidle.C1E-NHM.usa=
ge
 1.819e+08 =C2=B1  2%     -25.8%   1.35e+08 =C2=B1  1%  cpuidle.C3-NHM.time
    260585 =C2=B1  1%     -20.4%     207474 =C2=B1  2%  cpuidle.C3-NHM.usage
    266207 =C2=B1  1%     -39.4%     161453 =C2=B1  3%  cpuidle.C6-NHM.usage
    493467 =C2=B1  0%     +26.5%     624337 =C2=B1  0%  meminfo.Active
    395397 =C2=B1  0%     +33.0%     525811 =C2=B1  0%  meminfo.Active(anon)
    372719 =C2=B1  1%     +34.2%     500207 =C2=B1  1%  meminfo.AnonPages
   4543041 =C2=B1  1%     +37.5%    6248687 =C2=B1  1%  meminfo.Committed_AS
    185265 =C2=B1  1%     +16.3%     215373 =C2=B1  0%  meminfo.KernelStack
    302233 =C2=B1  1%     +37.1%     414289 =C2=B1  1%  meminfo.PageTables
    333827 =C2=B1  0%     +18.6%     396038 =C2=B1  0%  meminfo.SUnreclaim
    380340 =C2=B1  0%     +16.6%     443518 =C2=B1  0%  meminfo.Slab
     51154 =C2=B1143%    -100.0%       5.00 =C2=B1100%  latency_stats.avg.c=
all_rwsem_down_write_failed.copy_process._do_fork.SyS_clone.entry_SYSCALL_6=
4_fastpath
      0.00 =C2=B1 -1%      +Inf%      30679 =C2=B1100%  latency_stats.avg.p=
roc_cgroup_show.proc_single_show.seq_read.__vfs_read.vfs_read.SyS_read.entr=
y_SYSCALL_64_fastpath
      7795 =C2=B1100%   +1304.6%     109497 =C2=B1 93%  latency_stats.max.b=
lk_execute_rq.scsi_execute.scsi_execute_req_flags.ses_recv_diag.[ses].ses_g=
et_page2_descriptor.[ses].ses_get_power_status.[ses].ses_enclosure_data_pro=
cess.[ses].ses_intf_add.[ses].class_interface_register.scsi_register_interf=
ace.0xffffffffa0006013.do_one_initcall
    297190 =C2=B1117%    -100.0%      23.00 =C2=B1100%  latency_stats.max.c=
all_rwsem_down_write_failed.copy_process._do_fork.SyS_clone.entry_SYSCALL_6=
4_fastpath
      0.00 =C2=B1 -1%      +Inf%      97905 =C2=B1109%  latency_stats.max.p=
roc_cgroup_show.proc_single_show.seq_read.__vfs_read.vfs_read.SyS_read.entr=
y_SYSCALL_64_fastpath
     12901 =C2=B1131%     -78.9%       2717 =C2=B1135%  latency_stats.max.w=
ait_on_page_bit.wait_on_page_read.do_read_cache_page.read_cache_page_gfp.bt=
rfs_scan_one_device.[btrfs].btrfs_control_ioctl.[btrfs].do_vfs_ioctl.SyS_io=
ctl.entry_SYSCALL_64_fastpath
    392778 =C2=B1128%    -100.0%      75.50 =C2=B1100%  latency_stats.sum.c=
all_rwsem_down_write_failed.copy_process._do_fork.SyS_clone.entry_SYSCALL_6=
4_fastpath
     13678 =C2=B1 75%     -68.1%       4368 =C2=B1 67%  latency_stats.sum.f=
lush_work.__cancel_work_timer.cancel_delayed_work_sync.disk_block_events.__=
blkdev_get.blkdev_get.blkdev_get_by_path.btrfs_scan_one_device.[btrfs].btrf=
s_control_ioctl.[btrfs].do_vfs_ioctl.SyS_ioctl.entry_SYSCALL_64_fastpath
     19088 =C2=B1101%    -100.0%       8.67 =C2=B1110%  latency_stats.sum.p=
ath_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%     139824 =C2=B1104%  latency_stats.sum.p=
roc_cgroup_show.proc_single_show.seq_read.__vfs_read.vfs_read.SyS_read.entr=
y_SYSCALL_64_fastpath
     17538 =C2=B1 95%     -71.0%       5094 =C2=B1 72%  latency_stats.sum.w=
ait_on_page_bit.wait_on_page_read.do_read_cache_page.read_cache_page_gfp.bt=
rfs_scan_one_device.[btrfs].btrfs_control_ioctl.[btrfs].do_vfs_ioctl.SyS_io=
ctl.entry_SYSCALL_64_fastpath
     99221 =C2=B1  1%     +32.5%     131458 =C2=B1  0%  proc-vmstat.nr_acti=
ve_anon
     93610 =C2=B1  1%     +33.5%     124954 =C2=B1  0%  proc-vmstat.nr_anon=
_pages
     11604 =C2=B1  1%     +16.4%      13503 =C2=B1  0%  proc-vmstat.nr_kern=
el_stack
     75770 =C2=B1  1%     +36.6%     103508 =C2=B1  1%  proc-vmstat.nr_page=
_table_pages
     83664 =C2=B1  0%     +18.6%      99265 =C2=B1  0%  proc-vmstat.nr_slab=
_unreclaimable
 2.615e+08 =C2=B1  1%     -25.4%   1.95e+08 =C2=B1  1%  proc-vmstat.numa_hit
 2.615e+08 =C2=B1  1%     -25.4%   1.95e+08 =C2=B1  1%  proc-vmstat.numa_lo=
cal
      2151 =C2=B1  9%     +33.7%       2875 =C2=B1  7%  proc-vmstat.pgactiv=
ate
  53318467 =C2=B1  1%     -16.3%   44611139 =C2=B1  4%  proc-vmstat.pgalloc=
_dma32
 2.124e+08 =C2=B1  1%     -27.6%  1.538e+08 =C2=B1  2%  proc-vmstat.pgalloc=
_normal
  21951016 =C2=B1  0%     -17.9%   18028538 =C2=B1  1%  proc-vmstat.pgfault
 2.656e+08 =C2=B1  1%     -25.3%  1.983e+08 =C2=B1  1%  proc-vmstat.pgfree
    231019 =C2=B1  6%     +19.0%     274944 =C2=B1  3%  numa-meminfo.node0.=
Active
    182158 =C2=B1  8%     +24.4%     226602 =C2=B1  4%  numa-meminfo.node0.=
Active(anon)
      4049 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node0.=
AnonHugePages
    171061 =C2=B1  5%     +28.8%     220397 =C2=B1  3%  numa-meminfo.node0.=
AnonPages
    253455 =C2=B1  4%      -5.4%     239791 =C2=B1  4%  numa-meminfo.node0.=
FilePages
      9402 =C2=B1  3%     -90.3%     915.75 =C2=B1 39%  numa-meminfo.node0.=
Inactive(anon)
     10253 =C2=B1  0%     -50.8%       5041 =C2=B1  1%  numa-meminfo.node0.=
Mapped
    131300 =C2=B1  9%     +25.1%     164194 =C2=B1  7%  numa-meminfo.node0.=
PageTables
     20469 =C2=B1 54%     -65.5%       7058 =C2=B1145%  numa-meminfo.node0.=
Shmem
    235929 =C2=B1  5%     +43.0%     337441 =C2=B1  1%  numa-meminfo.node1.=
Active
    186748 =C2=B1  8%     +53.8%     287257 =C2=B1  1%  numa-meminfo.node1.=
Active(anon)
    175187 =C2=B1  5%     +52.9%     267826 =C2=B1  5%  numa-meminfo.node1.=
AnonPages
      1249 =C2=B1 39%    +676.4%       9697 =C2=B1  4%  numa-meminfo.node1.=
Inactive(anon)
    105601 =C2=B1  9%     +39.4%     147194 =C2=B1 10%  numa-meminfo.node1.=
KernelStack
      5032 =C2=B1  1%    +103.5%      10238 =C2=B1  0%  numa-meminfo.node1.=
Mapped
   1028697 =C2=B1  5%     +40.4%    1444560 =C2=B1  5%  numa-meminfo.node1.=
MemUsed
    147371 =C2=B1  7%     +62.4%     239296 =C2=B1  7%  numa-meminfo.node1.=
PageTables
    185026 =C2=B1  7%     +43.2%     264909 =C2=B1 10%  numa-meminfo.node1.=
SUnreclaim
    209508 =C2=B1  7%     +38.5%     290116 =C2=B1  9%  numa-meminfo.node1.=
Slab
     45770 =C2=B1  7%     +24.9%      57169 =C2=B1  3%  numa-vmstat.node0.n=
r_active_anon
     42981 =C2=B1  4%     +29.4%      55616 =C2=B1  3%  numa-vmstat.node0.n=
r_anon_pages
     63378 =C2=B1  4%      -5.4%      59946 =C2=B1  4%  numa-vmstat.node0.n=
r_file_pages
      2351 =C2=B1  3%     -90.3%     228.25 =C2=B1 38%  numa-vmstat.node0.n=
r_inactive_anon
      2589 =C2=B1  1%     -51.6%       1253 =C2=B1  0%  numa-vmstat.node0.n=
r_mapped
     32990 =C2=B1  8%     +25.6%      41423 =C2=B1  7%  numa-vmstat.node0.n=
r_page_table_pages
      5131 =C2=B1 54%     -65.6%       1763 =C2=B1145%  numa-vmstat.node0.n=
r_shmem
  64745848 =C2=B1  2%     -13.8%   55814423 =C2=B1  2%  numa-vmstat.node0.n=
uma_hit
  64743896 =C2=B1  2%     -13.9%   55752339 =C2=B1  2%  numa-vmstat.node0.n=
uma_local
      1951 =C2=B1 91%   +3081.4%      62084 =C2=B1  1%  numa-vmstat.node0.n=
uma_other
     45977 =C2=B1  8%     +57.0%      72172 =C2=B1  1%  numa-vmstat.node1.n=
r_active_anon
     43078 =C2=B1  7%     +56.1%      67261 =C2=B1  3%  numa-vmstat.node1.n=
r_anon_pages
    313.50 =C2=B1 40%    +673.4%       2424 =C2=B1  4%  numa-vmstat.node1.n=
r_inactive_anon
      6558 =C2=B1 11%     +39.9%       9175 =C2=B1  8%  numa-vmstat.node1.n=
r_kernel_stack
      1262 =C2=B1  1%    +102.2%       2552 =C2=B1  0%  numa-vmstat.node1.n=
r_mapped
     36358 =C2=B1  9%     +65.2%      60055 =C2=B1  5%  numa-vmstat.node1.n=
r_page_table_pages
     45984 =C2=B1  9%     +43.9%      66189 =C2=B1  8%  numa-vmstat.node1.n=
r_slab_unreclaimable
  64599981 =C2=B1  2%     -34.3%   42454481 =C2=B1  5%  numa-vmstat.node1.n=
uma_hit
  64534349 =C2=B1  2%     -34.2%   42449235 =C2=B1  5%  numa-vmstat.node1.n=
uma_local
     65632 =C2=B1  2%     -92.0%       5245 =C2=B1 23%  numa-vmstat.node1.n=
uma_other
    148962 =C2=B1  0%     +32.1%     196766 =C2=B1  2%  slabinfo.anon_vma.a=
ctive_objs
      3066 =C2=B1  0%     +32.5%       4062 =C2=B1  1%  slabinfo.anon_vma.a=
ctive_slabs
    156402 =C2=B1  0%     +32.5%     207216 =C2=B1  1%  slabinfo.anon_vma.n=
um_objs
      3066 =C2=B1  0%     +32.5%       4062 =C2=B1  1%  slabinfo.anon_vma.n=
um_slabs
     15321 =C2=B1  0%     +14.6%      17563 =C2=B1  1%  slabinfo.files_cach=
e.active_objs
     16470 =C2=B1  0%     +15.1%      18958 =C2=B1  1%  slabinfo.files_cach=
e.num_objs
      8808 =C2=B1  0%     +17.6%      10359 =C2=B1  1%  slabinfo.kmalloc-10=
24.active_objs
      9268 =C2=B1  0%     +16.1%      10758 =C2=B1  0%  slabinfo.kmalloc-10=
24.num_objs
     22656 =C2=B1  1%      +9.9%      24899 =C2=B1  2%  slabinfo.kmalloc-12=
8.num_objs
     31867 =C2=B1  0%     +11.6%      35548 =C2=B1  0%  slabinfo.kmalloc-19=
2.active_objs
     32775 =C2=B1  0%     +11.4%      36522 =C2=B1  0%  slabinfo.kmalloc-19=
2.num_objs
     15221 =C2=B1  0%     +23.1%      18731 =C2=B1  0%  slabinfo.kmalloc-25=
6.active_objs
     16380 =C2=B1  0%     +19.4%      19557 =C2=B1  0%  slabinfo.kmalloc-25=
6.num_objs
    308147 =C2=B1  0%     +33.0%     409879 =C2=B1  2%  slabinfo.kmalloc-64=
.active_objs
      6591 =C2=B1  1%     +17.9%       7770 =C2=B1  1%  slabinfo.kmalloc-64=
.active_slabs
    421883 =C2=B1  1%     +17.9%     497347 =C2=B1  1%  slabinfo.kmalloc-64=
.num_objs
      6591 =C2=B1  1%     +17.9%       7770 =C2=B1  1%  slabinfo.kmalloc-64=
.num_slabs
    482.75 =C2=B1 11%     +39.7%     674.50 =C2=B1  7%  slabinfo.kmem_cache=
_node.active_objs
    495.50 =C2=B1 10%     +38.7%     687.25 =C2=B1  7%  slabinfo.kmem_cache=
_node.num_objs
      9328 =C2=B1  0%     +29.1%      12045 =C2=B1  2%  slabinfo.mm_struct.=
active_objs
    612.00 =C2=B1  0%     +28.6%     787.00 =C2=B1  1%  slabinfo.mm_struct.=
active_slabs
     10411 =C2=B1  0%     +28.6%      13390 =C2=B1  1%  slabinfo.mm_struct.=
num_objs
    612.00 =C2=B1  0%     +28.6%     787.00 =C2=B1  1%  slabinfo.mm_struct.=
num_slabs
     12765 =C2=B1  1%     +15.7%      14765 =C2=B1  1%  slabinfo.sighand_ca=
che.active_objs
    861.75 =C2=B1  1%     +18.4%       1020 =C2=B1  0%  slabinfo.sighand_ca=
che.active_slabs
     12933 =C2=B1  1%     +18.4%      15308 =C2=B1  0%  slabinfo.sighand_ca=
che.num_objs
    861.75 =C2=B1  1%     +18.4%       1020 =C2=B1  0%  slabinfo.sighand_ca=
che.num_slabs
     14455 =C2=B1  1%     +11.8%      16167 =C2=B1  1%  slabinfo.signal_cac=
he.active_objs
     14698 =C2=B1  1%     +14.2%      16779 =C2=B1  1%  slabinfo.signal_cac=
he.num_objs
     11628 =C2=B1  1%     +16.6%      13563 =C2=B1  1%  slabinfo.task_struc=
t.active_objs
      3899 =C2=B1  1%     +18.5%       4620 =C2=B1  1%  slabinfo.task_struc=
t.active_slabs
     11699 =C2=B1  1%     +18.5%      13861 =C2=B1  1%  slabinfo.task_struc=
t.num_objs
      3899 =C2=B1  1%     +18.5%       4620 =C2=B1  1%  slabinfo.task_struc=
t.num_slabs
    224907 =C2=B1  0%     +34.2%     301780 =C2=B1  2%  slabinfo.vm_area_st=
ruct.active_objs
      5290 =C2=B1  0%     +34.9%       7135 =C2=B1  2%  slabinfo.vm_area_st=
ruct.active_slabs
    232815 =C2=B1  0%     +34.8%     313951 =C2=B1  2%  slabinfo.vm_area_st=
ruct.num_objs
      5290 =C2=B1  0%     +34.9%       7135 =C2=B1  2%  slabinfo.vm_area_st=
ruct.num_slabs
      0.30 =C2=B1 89%   +2528.3%       7.88 =C2=B1 13%  perf-profile.cpu-cy=
cles.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.enqueue_t=
ask.activate_task
      0.02 =C2=B1 74%  +17735.0%       2.97 =C2=B1 19%  perf-profile.cpu-cy=
cles.__kernel_text_address.print_context_stack.dump_trace.save_stack_trace_=
tsk.__account_scheduler_latency
      0.02 =C2=B1-5000%  +21150.0%       4.25 =C2=B1 44%  perf-profile.cpu-=
cycles.__schedule.schedule.pipe_wait.pipe_read.__vfs_read
      0.00 =C2=B1 -1%      +Inf%       0.64 =C2=B1 58%  perf-profile.cpu-cy=
cles.__schedule.schedule.prepare_exit_to_usermode.syscall_return_slowpath.i=
nt_ret_from_sys_call
      7.24 =C2=B1 19%    +141.5%      17.49 =C2=B1 14%  perf-profile.cpu-cy=
cles.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      1.36 =C2=B1 84%    +926.2%      13.92 =C2=B1 16%  perf-profile.cpu-cy=
cles.__wake_up_common.__wake_up_sync_key.pipe_write.__vfs_write.vfs_write
      1.46 =C2=B1107%    +981.3%      15.76 =C2=B1 17%  perf-profile.cpu-cy=
cles.__wake_up_sync_key.pipe_write.__vfs_write.vfs_write.sys_write
      0.03 =C2=B1-3333%   +3200.0%       0.99 =C2=B1 28%  perf-profile.cpu-=
cycles.activate_task.ttwu_do_activate.sched_ttwu_pending.scheduler_ipi.smp_=
reschedule_interrupt
      0.64 =C2=B1 86%   +1399.6%       9.65 =C2=B1 13%  perf-profile.cpu-cy=
cles.activate_task.ttwu_do_activate.try_to_wake_up.default_wake_function.au=
toremove_wake_function
      1.28 =C2=B1 86%    +966.4%      13.62 =C2=B1 16%  perf-profile.cpu-cy=
cles.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.pipe_writ=
e.__vfs_write
      1.26 =C2=B1 86%    +968.6%      13.50 =C2=B1 16%  perf-profile.cpu-cy=
cles.default_wake_function.autoremove_wake_function.__wake_up_common.__wake=
_up_sync_key.pipe_write
      0.01 =C2=B1  0%   +3200.0%       0.33 =C2=B1140%  perf-profile.cpu-cy=
cles.do_wait.sys_wait4.entry_SYSCALL_64_fastpath
      0.16 =C2=B1 96%   +4396.9%       7.20 =C2=B1 12%  perf-profile.cpu-cy=
cles.dump_trace.save_stack_trace_tsk.__account_scheduler_latency.enqueue_en=
tity.enqueue_task_fair
      0.48 =C2=B1 86%   +1877.1%       9.49 =C2=B1 14%  perf-profile.cpu-cy=
cles.enqueue_entity.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_ac=
tivate
      0.03 =C2=B1-3333%   +3175.0%       0.98 =C2=B1 28%  perf-profile.cpu-=
cycles.enqueue_task.activate_task.ttwu_do_activate.sched_ttwu_pending.sched=
uler_ipi
      0.64 =C2=B1 86%   +1396.9%       9.63 =C2=B1 13%  perf-profile.cpu-cy=
cles.enqueue_task.activate_task.ttwu_do_activate.try_to_wake_up.default_wak=
e_function
      0.02 =C2=B1-5000%   +4162.5%       0.85 =C2=B1 27%  perf-profile.cpu-=
cycles.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate.sched_=
ttwu_pending
      0.59 =C2=B1 86%   +1473.7%       9.29 =C2=B1 13%  perf-profile.cpu-cy=
cles.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate.try_to_w=
ake_up
    111.99 =C2=B1  2%     -23.5%      85.65 =C2=B1  7%  perf-profile.cpu-cy=
cles.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%       0.77 =C2=B1 51%  perf-profile.cpu-cy=
cles.int_ret_from_sys_call
      3.68 =C2=B1 31%    +309.3%      15.06 =C2=B1 17%  perf-profile.cpu-cy=
cles.pipe_read.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      0.03 =C2=B1-3333%  +19350.0%       5.83 =C2=B1 38%  perf-profile.cpu-=
cycles.pipe_wait.pipe_read.__vfs_read.vfs_read.sys_read
     10.52 =C2=B1 23%    +109.9%      22.09 =C2=B1 18%  perf-profile.cpu-cy=
cles.pipe_write.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%       0.68 =C2=B1 56%  perf-profile.cpu-cy=
cles.prepare_exit_to_usermode.syscall_return_slowpath.int_ret_from_sys_call
      0.10 =C2=B1 96%   +6080.0%       6.18 =C2=B1 13%  perf-profile.cpu-cy=
cles.print_context_stack.dump_trace.save_stack_trace_tsk.__account_schedule=
r_latency.enqueue_entity
      0.16 =C2=B1 97%   +4329.6%       7.24 =C2=B1 13%  perf-profile.cpu-cy=
cles.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entity.enqueu=
e_task_fair.enqueue_task
      0.02 =C2=B1-5000%  +22300.0%       4.48 =C2=B1 43%  perf-profile.cpu-=
cycles.schedule.pipe_wait.pipe_read.__vfs_read.vfs_read
      0.00 =C2=B1 -1%      +Inf%       0.62 =C2=B1 62%  perf-profile.cpu-cy=
cles.schedule.prepare_exit_to_usermode.syscall_return_slowpath.int_ret_from=
_sys_call
     41.93 =C2=B1  3%     -21.8%      32.80 =C2=B1  4%  perf-profile.cpu-cy=
cles.sys_read.entry_SYSCALL_64_fastpath
      0.01 =C2=B1  0%   +3225.0%       0.33 =C2=B1140%  perf-profile.cpu-cy=
cles.sys_wait4.entry_SYSCALL_64_fastpath
     65.72 =C2=B1  3%     -25.2%      49.18 =C2=B1  9%  perf-profile.cpu-cy=
cles.sys_write.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%       0.72 =C2=B1 52%  perf-profile.cpu-cy=
cles.syscall_return_slowpath.int_ret_from_sys_call
      1.28 =C2=B1 86%    +961.1%      13.58 =C2=B1 16%  perf-profile.cpu-cy=
cles.try_to_wake_up.default_wake_function.autoremove_wake_function.__wake_u=
p_common.__wake_up_sync_key
      0.04 =C2=B1-2500%   +2512.5%       1.04 =C2=B1 28%  perf-profile.cpu-=
cycles.ttwu_do_activate.constprop.85.sched_ttwu_pending.scheduler_ipi.smp_r=
eschedule_interrupt.reschedule_interrupt
      0.70 =C2=B1 88%   +1343.2%      10.10 =C2=B1 13%  perf-profile.cpu-cy=
cles.ttwu_do_activate.constprop.85.try_to_wake_up.default_wake_function.aut=
oremove_wake_function.__wake_up_common
     34.35 =C2=B1  3%     -16.2%      28.77 =C2=B1  6%  perf-profile.cpu-cy=
cles.vfs_read.sys_read.entry_SYSCALL_64_fastpath
     58.47 =C2=B1  4%     -26.7%      42.85 =C2=B1  9%  perf-profile.cpu-cy=
cles.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      0.01 =C2=B1 70%   +4475.0%       0.30 =C2=B1139%  perf-profile.cpu-cy=
cles.wait_consider_task.do_wait.sys_wait4.entry_SYSCALL_64_fastpath
    121.25 =C2=B1 40%     -43.9%      68.00 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.load_avg
   7372993 =C2=B1  2%     +59.5%   11756998 =C2=B1  6%  sched_debug.cfs_rq[=
0]:/.min_vruntime
      2526 =C2=B1  4%     -36.8%       1596 =C2=B1 10%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
     96.00 =C2=B1  8%     -29.2%      68.00 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.tg_load_avg_contrib
     91.75 =C2=B1 23%     -40.1%      55.00 =C2=B1 12%  sched_debug.cfs_rq[=
10]:/.load_avg
   8761646 =C2=B1  6%    +202.7%   26523962 =C2=B1 11%  sched_debug.cfs_rq[=
10]:/.min_vruntime
      8.00 =C2=B1 56%   +1043.8%      91.50 =C2=B1 95%  sched_debug.cfs_rq[=
10]:/.nr_spread_over
   1375813 =C2=B1 32%    +967.5%   14686694 =C2=B1 19%  sched_debug.cfs_rq[=
10]:/.spread0
      2218 =C2=B1  8%     -22.1%       1729 =C2=B1  9%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
     92.25 =C2=B1 23%     -40.1%      55.25 =C2=B1 12%  sched_debug.cfs_rq[=
10]:/.tg_load_avg_contrib
     83.00 =C2=B1  8%     -28.6%      59.25 =C2=B1 26%  sched_debug.cfs_rq[=
11]:/.load_avg
   8281705 =C2=B1  5%    +221.0%   26587558 =C2=B1 12%  sched_debug.cfs_rq[=
11]:/.min_vruntime
     12.75 =C2=B1 76%    +488.2%      75.00 =C2=B1 57%  sched_debug.cfs_rq[=
11]:/.nr_spread_over
    895534 =C2=B1 36%   +1546.8%   14747704 =C2=B1 20%  sched_debug.cfs_rq[=
11]:/.spread0
      2181 =C2=B1  7%     -24.0%       1657 =C2=B1  7%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
     83.00 =C2=B1  8%     -28.6%      59.25 =C2=B1 26%  sched_debug.cfs_rq[=
11]:/.tg_load_avg_contrib
   7597123 =C2=B1  4%     +64.9%   12525605 =C2=B1  7%  sched_debug.cfs_rq[=
12]:/.min_vruntime
      2144 =C2=B1  8%     -18.9%       1739 =C2=B1  8%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
   7974727 =C2=B1  1%     +76.7%   14092249 =C2=B1  8%  sched_debug.cfs_rq[=
13]:/.min_vruntime
    587700 =C2=B1 33%    +282.6%    2248438 =C2=B1 24%  sched_debug.cfs_rq[=
13]:/.spread0
      2161 =C2=B1  8%     -18.0%       1771 =C2=B1  6%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
   9111334 =C2=B1  6%     +49.2%   13594919 =C2=B1  7%  sched_debug.cfs_rq[=
14]:/.min_vruntime
      2155 =C2=B1 10%     -17.9%       1768 =C2=B1  7%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
     91.00 =C2=B1 11%     -28.3%      65.25 =C2=B1 24%  sched_debug.cfs_rq[=
15]:/.load_avg
   7755071 =C2=B1  5%     +80.3%   13985714 =C2=B1  7%  sched_debug.cfs_rq[=
15]:/.min_vruntime
      9.75 =C2=B1 15%    +520.5%      60.50 =C2=B1128%  sched_debug.cfs_rq[=
15]:/.nr_spread_over
    367395 =C2=B1 78%    +481.9%    2137747 =C2=B1 16%  sched_debug.cfs_rq[=
15]:/.spread0
      2175 =C2=B1 12%     -22.1%       1694 =C2=B1  7%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
     91.00 =C2=B1 11%     -28.3%      65.25 =C2=B1 24%  sched_debug.cfs_rq[=
15]:/.tg_load_avg_contrib
   7790185 =C2=B1  3%     +81.0%   14103194 =C2=B1  6%  sched_debug.cfs_rq[=
16]:/.min_vruntime
    402239 =C2=B1 43%    +460.5%    2254357 =C2=B1 12%  sched_debug.cfs_rq[=
16]:/.spread0
      2196 =C2=B1  9%     -22.8%       1694 =C2=B1  6%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
   8545892 =C2=B1  6%     +64.3%   14041885 =C2=B1  7%  sched_debug.cfs_rq[=
17]:/.min_vruntime
   1157569 =C2=B1 38%     +89.4%    2192052 =C2=B1 15%  sched_debug.cfs_rq[=
17]:/.spread0
      2168 =C2=B1  9%     -21.2%       1709 =C2=B1  3%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
   8083785 =C2=B1  3%    +194.3%   23786635 =C2=B1 12%  sched_debug.cfs_rq[=
18]:/.min_vruntime
      7.25 =C2=B1 69%    +286.2%      28.00 =C2=B1 51%  sched_debug.cfs_rq[=
18]:/.nr_spread_over
    695207 =C2=B1 68%   +1616.3%   11932029 =C2=B1 23%  sched_debug.cfs_rq[=
18]:/.spread0
      2134 =C2=B1 10%     -18.9%       1731 =C2=B1  5%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
    123.00 =C2=B1 23%     -50.8%      60.50 =C2=B1 18%  sched_debug.cfs_rq[=
19]:/.load_avg
   8843043 =C2=B1  4%    +212.8%   27657482 =C2=B1 14%  sched_debug.cfs_rq[=
19]:/.min_vruntime
     11.50 =C2=B1 72%   +1156.5%     144.50 =C2=B1 89%  sched_debug.cfs_rq[=
19]:/.nr_spread_over
   1454237 =C2=B1 28%    +986.6%   15802087 =C2=B1 22%  sched_debug.cfs_rq[=
19]:/.spread0
      2121 =C2=B1 10%     -18.7%       1724 =C2=B1  7%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
    121.00 =C2=B1 21%     -50.0%      60.50 =C2=B1 18%  sched_debug.cfs_rq[=
19]:/.tg_load_avg_contrib
    101.50 =C2=B1 14%     -37.2%      63.75 =C2=B1  8%  sched_debug.cfs_rq[=
1]:/.load_avg
   8066420 =C2=B1  2%     +67.1%   13476103 =C2=B1  7%  sched_debug.cfs_rq[=
1]:/.min_vruntime
    689384 =C2=B1 53%    +147.3%    1704860 =C2=B1 22%  sched_debug.cfs_rq[=
1]:/.spread0
      2514 =C2=B1  4%     -39.0%       1533 =C2=B1  6%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
    101.75 =C2=B1 14%     -37.3%      63.75 =C2=B1  8%  sched_debug.cfs_rq[=
1]:/.tg_load_avg_contrib
     91.00 =C2=B1  8%     -23.1%      70.00 =C2=B1 10%  sched_debug.cfs_rq[=
20]:/.load_avg
   9057239 =C2=B1  7%    +200.9%   27252092 =C2=B1 13%  sched_debug.cfs_rq[=
20]:/.min_vruntime
   1668188 =C2=B1 44%    +822.9%   15396001 =C2=B1 23%  sched_debug.cfs_rq[=
20]:/.spread0
      2153 =C2=B1  9%     -20.7%       1707 =C2=B1  5%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
     91.00 =C2=B1  8%     -24.2%      69.00 =C2=B1 11%  sched_debug.cfs_rq[=
20]:/.tg_load_avg_contrib
   8505030 =C2=B1  8%    +224.1%   27566380 =C2=B1 13%  sched_debug.cfs_rq[=
21]:/.min_vruntime
     15.50 =C2=B1 51%    +575.8%     104.75 =C2=B1 42%  sched_debug.cfs_rq[=
21]:/.nr_spread_over
   1115371 =C2=B1 70%   +1308.4%   15708882 =C2=B1 21%  sched_debug.cfs_rq[=
21]:/.spread0
      2129 =C2=B1  9%     -19.2%       1720 =C2=B1  5%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
   8352879 =C2=B1  2%    +232.1%   27739662 =C2=B1 13%  sched_debug.cfs_rq[=
22]:/.min_vruntime
     13.00 =C2=B1 45%   +1930.8%     264.00 =C2=B1 38%  sched_debug.cfs_rq[=
22]:/.nr_spread_over
    962764 =C2=B1  8%   +1549.5%   15880365 =C2=B1 22%  sched_debug.cfs_rq[=
22]:/.spread0
      2119 =C2=B1  8%     -14.5%       1811 =C2=B1 10%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
   8119642 =C2=B1  4%    +241.9%   27759824 =C2=B1 13%  sched_debug.cfs_rq[=
23]:/.min_vruntime
    729257 =C2=B1 37%   +2080.1%   15898645 =C2=B1 21%  sched_debug.cfs_rq[=
23]:/.spread0
      2087 =C2=B1  7%     -16.0%       1753 =C2=B1  3%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
    101.75 =C2=B1 19%     -31.7%      69.50 =C2=B1 10%  sched_debug.cfs_rq[=
2]:/.load_avg
   9427522 =C2=B1 14%     +44.3%   13605129 =C2=B1  7%  sched_debug.cfs_rq[=
2]:/.min_vruntime
      2441 =C2=B1  7%     -35.2%       1583 =C2=B1 10%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
    102.50 =C2=B1 19%     -32.2%      69.50 =C2=B1 10%  sched_debug.cfs_rq[=
2]:/.tg_load_avg_contrib
   7664612 =C2=B1  6%     +76.4%   13520491 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.min_vruntime
    283759 =C2=B1142%    +509.0%    1728055 =C2=B1 23%  sched_debug.cfs_rq[=
3]:/.spread0
      2355 =C2=B1  8%     -32.8%       1582 =C2=B1 12%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
    118.75 =C2=B1 20%     -33.7%      78.75 =C2=B1 12%  sched_debug.cfs_rq[=
4]:/.load_avg
   7770292 =C2=B1  5%     +73.0%   13442540 =C2=B1  6%  sched_debug.cfs_rq[=
4]:/.min_vruntime
    388453 =C2=B1139%    +322.2%    1640216 =C2=B1 19%  sched_debug.cfs_rq[=
4]:/.spread0
      2286 =C2=B1  8%     -29.9%       1603 =C2=B1 10%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
    119.00 =C2=B1 20%     -33.2%      79.50 =C2=B1 12%  sched_debug.cfs_rq[=
4]:/.tg_load_avg_contrib
     41.00 =C2=B1 12%     +72.0%      70.50 =C2=B1 58%  sched_debug.cfs_rq[=
5]:/.load
   8361817 =C2=B1  5%     +59.9%   13374083 =C2=B1  7%  sched_debug.cfs_rq[=
5]:/.min_vruntime
      2265 =C2=B1  8%     -29.0%       1608 =C2=B1 10%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
   8064101 =C2=B1  5%    +170.9%   21848536 =C2=B1 12%  sched_debug.cfs_rq[=
6]:/.min_vruntime
     12.25 =C2=B1 48%     +81.6%      22.25 =C2=B1 28%  sched_debug.cfs_rq[=
6]:/.nr_spread_over
    680647 =C2=B1 89%   +1373.8%   10031232 =C2=B1 26%  sched_debug.cfs_rq[=
6]:/.spread0
      2298 =C2=B1  8%     -29.7%       1615 =C2=B1  8%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     94.25 =C2=B1 16%     -38.2%      58.25 =C2=B1 19%  sched_debug.cfs_rq[=
7]:/.load_avg
   8303387 =C2=B1  6%    +218.5%   26442227 =C2=B1 14%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     40.25 =C2=B1  9%     -25.5%      30.00 =C2=B1 17%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
    919200 =C2=B1 58%   +1490.1%   14616571 =C2=B1 24%  sched_debug.cfs_rq[=
7]:/.spread0
      2277 =C2=B1  7%     -28.1%       1638 =C2=B1 12%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
     94.50 =C2=B1 16%     -38.4%      58.25 =C2=B1 19%  sched_debug.cfs_rq[=
7]:/.tg_load_avg_contrib
     93.50 =C2=B1 19%     -38.2%      57.75 =C2=B1 18%  sched_debug.cfs_rq[=
8]:/.load_avg
   8657132 =C2=B1  6%    +206.7%   26552197 =C2=B1 12%  sched_debug.cfs_rq[=
8]:/.min_vruntime
     10.00 =C2=B1 49%   +2720.0%     282.00 =C2=B1 56%  sched_debug.cfs_rq[=
8]:/.nr_spread_over
   1272282 =C2=B1 40%   +1057.2%   14722281 =C2=B1 21%  sched_debug.cfs_rq[=
8]:/.spread0
      2256 =C2=B1  8%     -25.2%       1688 =C2=B1  9%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
     88.25 =C2=B1 18%     -33.7%      58.50 =C2=B1 18%  sched_debug.cfs_rq[=
8]:/.tg_load_avg_contrib
     89.25 =C2=B1 10%     -43.4%      50.50 =C2=B1 18%  sched_debug.cfs_rq[=
9]:/.load_avg
   8573840 =C2=B1 11%    +212.1%   26757495 =C2=B1 13%  sched_debug.cfs_rq[=
9]:/.min_vruntime
     13.00 =C2=B1 70%    +909.6%     131.25 =C2=B1 46%  sched_debug.cfs_rq[=
9]:/.nr_spread_over
   1188401 =C2=B1 86%   +1155.7%   14923175 =C2=B1 23%  sched_debug.cfs_rq[=
9]:/.spread0
      2235 =C2=B1  7%     -27.0%       1630 =C2=B1  9%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
     89.25 =C2=B1 10%     -43.4%      50.50 =C2=B1 18%  sched_debug.cfs_rq[=
9]:/.tg_load_avg_contrib
     13660 =C2=B1 26%     +25.6%      17164 =C2=B1  7%  sched_debug.cpu#0.c=
urr->pid
     25.75 =C2=B1 28%    +564.1%     171.00 =C2=B1 31%  sched_debug.cpu#0.n=
r_running
   6234824 =C2=B1  3%     +79.9%   11214928 =C2=B1 11%  sched_debug.cpu#0.n=
r_switches
     92.25 =C2=B1 41%    +101.4%     185.75 =C2=B1 37%  sched_debug.cpu#0.n=
r_uninterruptible
  10264120 =C2=B1  2%     +48.8%   15270454 =C2=B1  8%  sched_debug.cpu#0.s=
ched_count
     49574 =C2=B1  5%     -12.4%      43430 =C2=B1  6%  sched_debug.cpu#0.s=
ched_goidle
   5147188 =C2=B1  4%     +79.7%    9249436 =C2=B1 12%  sched_debug.cpu#0.t=
twu_count
   2269312 =C2=B1  2%     +62.5%    3688685 =C2=B1 10%  sched_debug.cpu#0.t=
twu_local
     23.25 =C2=B1 28%    +589.2%     160.25 =C2=B1 36%  sched_debug.cpu#1.n=
r_running
   6569750 =C2=B1  2%     +83.6%   12058832 =C2=B1  9%  sched_debug.cpu#1.n=
r_switches
   6570052 =C2=B1  2%     +83.6%   12059572 =C2=B1  9%  sched_debug.cpu#1.s=
ched_count
   4992425 =C2=B1  1%    +109.0%   10435243 =C2=B1  3%  sched_debug.cpu#1.t=
twu_count
   2463897 =C2=B1  1%     +74.8%    4307284 =C2=B1  9%  sched_debug.cpu#1.t=
twu_local
     13.00 =C2=B1 44%    +303.8%      52.50 =C2=B1 42%  sched_debug.cpu#10.=
nr_running
   6572956 =C2=B1  2%    +196.2%   19469907 =C2=B1  4%  sched_debug.cpu#10.=
nr_switches
   6573272 =C2=B1  2%    +196.2%   19471457 =C2=B1  4%  sched_debug.cpu#10.=
sched_count
   5113245 =C2=B1  2%    +125.5%   11531340 =C2=B1  2%  sched_debug.cpu#10.=
ttwu_count
   2449382 =C2=B1  2%    +146.9%    6046615 =C2=B1  4%  sched_debug.cpu#10.=
ttwu_local
    500000 =C2=B1  0%     +14.1%     570712 =C2=B1  8%  sched_debug.cpu#11.=
max_idle_balance_cost
     15.00 =C2=B1 46%    +246.7%      52.00 =C2=B1 42%  sched_debug.cpu#11.=
nr_running
   6631320 =C2=B1  2%    +189.1%   19172684 =C2=B1  4%  sched_debug.cpu#11.=
nr_switches
   6631668 =C2=B1  2%    +189.1%   19174234 =C2=B1  4%  sched_debug.cpu#11.=
sched_count
   5054950 =C2=B1  2%    +120.6%   11152494 =C2=B1  4%  sched_debug.cpu#11.=
ttwu_count
   2405487 =C2=B1  2%    +145.7%    5910910 =C2=B1  3%  sched_debug.cpu#11.=
ttwu_local
     12.00 =C2=B1 59%    +791.7%     107.00 =C2=B1 75%  sched_debug.cpu#12.=
nr_running
   6356857 =C2=B1  4%     +95.9%   12451675 =C2=B1  8%  sched_debug.cpu#12.=
nr_switches
    134.25 =C2=B1 46%     +58.7%     213.00 =C2=B1 22%  sched_debug.cpu#12.=
nr_uninterruptible
   6357220 =C2=B1  4%     +95.9%   12452542 =C2=B1  8%  sched_debug.cpu#12.=
sched_count
     46934 =C2=B1  6%     -16.9%      38993 =C2=B1 10%  sched_debug.cpu#12.=
sched_goidle
   5089230 =C2=B1  6%     +99.1%   10134621 =C2=B1  4%  sched_debug.cpu#12.=
ttwu_count
   2416053 =C2=B1  2%     +79.9%    4346652 =C2=B1  6%  sched_debug.cpu#12.=
ttwu_local
   6657066 =C2=B1  5%     +86.1%   12387203 =C2=B1  9%  sched_debug.cpu#13.=
nr_switches
     94.50 =C2=B1 71%    +109.8%     198.25 =C2=B1 19%  sched_debug.cpu#13.=
nr_uninterruptible
   6657360 =C2=B1  5%     +86.1%   12387844 =C2=B1  9%  sched_debug.cpu#13.=
sched_count
   5089824 =C2=B1  1%    +103.3%   10347591 =C2=B1  6%  sched_debug.cpu#13.=
ttwu_count
   2613812 =C2=B1  2%     +77.8%    4646155 =C2=B1 10%  sched_debug.cpu#13.=
ttwu_local
     14.25 =C2=B1 64%    +761.4%     122.75 =C2=B1 73%  sched_debug.cpu#14.=
nr_running
   7217227 =C2=B1  7%     +73.5%   12520898 =C2=B1  7%  sched_debug.cpu#14.=
nr_switches
   -109.00 =C2=B1-154%    -226.6%     138.00 =C2=B1 34%  sched_debug.cpu#14=
.nr_uninterruptible
   7217548 =C2=B1  7%     +73.5%   12521622 =C2=B1  7%  sched_debug.cpu#14.=
sched_count
   4933024 =C2=B1  2%     +99.8%    9853790 =C2=B1  5%  sched_debug.cpu#14.=
ttwu_count
   2627711 =C2=B1  3%     +76.7%    4643465 =C2=B1  5%  sched_debug.cpu#14.=
ttwu_local
     11.50 =C2=B1 88%    +995.7%     126.00 =C2=B1 75%  sched_debug.cpu#15.=
nr_running
   6705165 =C2=B1  4%     +91.4%   12831218 =C2=B1  9%  sched_debug.cpu#15.=
nr_switches
     41.50 =C2=B1 82%    +256.0%     147.75 =C2=B1 27%  sched_debug.cpu#15.=
nr_uninterruptible
   6705518 =C2=B1  4%     +91.4%   12831891 =C2=B1  9%  sched_debug.cpu#15.=
sched_count
   5124902 =C2=B1  2%    +102.0%   10351785 =C2=B1  4%  sched_debug.cpu#15.=
ttwu_count
   2537246 =C2=B1  2%     +84.4%    4679721 =C2=B1  9%  sched_debug.cpu#15.=
ttwu_local
     59.75 =C2=B1 72%    +116.7%     129.50 =C2=B1 63%  sched_debug.cpu#16.=
load
     12.00 =C2=B1 91%    +991.7%     131.00 =C2=B1 75%  sched_debug.cpu#16.=
nr_running
   6807914 =C2=B1  3%     +88.7%   12847644 =C2=B1  6%  sched_debug.cpu#16.=
nr_switches
     35.75 =C2=B1243%    +416.8%     184.75 =C2=B1 28%  sched_debug.cpu#16.=
nr_uninterruptible
   6808195 =C2=B1  3%     +88.7%   12848273 =C2=B1  6%  sched_debug.cpu#16.=
sched_count
   4965300 =C2=B1  5%    +109.5%   10400978 =C2=B1  2%  sched_debug.cpu#16.=
ttwu_count
   2587259 =C2=B1  3%     +84.3%    4769137 =C2=B1  4%  sched_debug.cpu#16.=
ttwu_local
   7343797 =C2=B1  4%     +71.0%   12556479 =C2=B1  9%  sched_debug.cpu#17.=
nr_switches
    -21.50 =C2=B1-291%    -637.2%     115.50 =C2=B1  9%  sched_debug.cpu#17=
.nr_uninterruptible
   7344102 =C2=B1  4%     +71.0%   12557075 =C2=B1  9%  sched_debug.cpu#17.=
sched_count
     48302 =C2=B1 10%     -21.2%      38075 =C2=B1  9%  sched_debug.cpu#17.=
sched_goidle
   4860214 =C2=B1  2%    +105.2%    9973186 =C2=B1  3%  sched_debug.cpu#17.=
ttwu_count
   2631813 =C2=B1  1%     +77.3%    4667413 =C2=B1  6%  sched_debug.cpu#17.=
ttwu_local
     10.50 =C2=B1 70%    +361.9%      48.50 =C2=B1 34%  sched_debug.cpu#18.=
nr_running
   6423142 =C2=B1  0%    +193.8%   18871804 =C2=B1  6%  sched_debug.cpu#18.=
nr_switches
   6423521 =C2=B1  0%    +193.8%   18873844 =C2=B1  6%  sched_debug.cpu#18.=
sched_count
   4996106 =C2=B1  2%    +103.7%   10174733 =C2=B1  5%  sched_debug.cpu#18.=
ttwu_count
   2472857 =C2=B1  2%    +120.8%    5460849 =C2=B1  4%  sched_debug.cpu#18.=
ttwu_local
     13.00 =C2=B1 54%    +267.3%      47.75 =C2=B1 47%  sched_debug.cpu#19.=
nr_running
   6685332 =C2=B1  4%    +198.9%   19980393 =C2=B1  5%  sched_debug.cpu#19.=
nr_switches
    -66.25 =C2=B1-66%    +202.6%    -200.50 =C2=B1 -2%  sched_debug.cpu#19.=
nr_uninterruptible
   6685659 =C2=B1  4%    +198.9%   19981845 =C2=B1  5%  sched_debug.cpu#19.=
sched_count
   4916266 =C2=B1  4%    +151.1%   12346570 =C2=B1  5%  sched_debug.cpu#19.=
ttwu_count
   2554700 =C2=B1  4%    +163.4%    6729723 =C2=B1  4%  sched_debug.cpu#19.=
ttwu_local
     13552 =C2=B1 10%     +39.4%      18891 =C2=B1 15%  sched_debug.cpu#2.c=
urr->pid
     17.25 =C2=B1 67%    +784.1%     152.50 =C2=B1 42%  sched_debug.cpu#2.n=
r_running
   7014128 =C2=B1  5%     +72.9%   12125114 =C2=B1  8%  sched_debug.cpu#2.n=
r_switches
   7014454 =C2=B1  5%     +72.9%   12125842 =C2=B1  8%  sched_debug.cpu#2.s=
ched_count
   4929757 =C2=B1  3%    +102.3%    9971509 =C2=B1  2%  sched_debug.cpu#2.t=
twu_count
   2473376 =C2=B1  3%     +75.9%    4350629 =C2=B1  7%  sched_debug.cpu#2.t=
twu_local
      9.50 =C2=B1 58%    +365.8%      44.25 =C2=B1 48%  sched_debug.cpu#20.=
nr_running
   7094564 =C2=B1  7%    +180.5%   19900502 =C2=B1  5%  sched_debug.cpu#20.=
nr_switches
    -22.50 =C2=B1-193%    +866.7%    -217.50 =C2=B1-35%  sched_debug.cpu#20=
.nr_uninterruptible
   7094941 =C2=B1  7%    +180.5%   19901947 =C2=B1  5%  sched_debug.cpu#20.=
sched_count
   4847005 =C2=B1  2%    +150.6%   12148790 =C2=B1  4%  sched_debug.cpu#20.=
ttwu_count
   2596984 =C2=B1  4%    +162.1%    6806600 =C2=B1  5%  sched_debug.cpu#20.=
ttwu_local
      8.50 =C2=B1 50%    +400.0%      42.50 =C2=B1 52%  sched_debug.cpu#21.=
nr_running
   6734635 =C2=B1  6%    +197.1%   20005787 =C2=B1  4%  sched_debug.cpu#21.=
nr_switches
   6734978 =C2=B1  6%    +197.1%   20007174 =C2=B1  4%  sched_debug.cpu#21.=
sched_count
   4954934 =C2=B1  2%    +152.5%   12510106 =C2=B1  7%  sched_debug.cpu#21.=
ttwu_count
   2548363 =C2=B1  3%    +169.5%    6867282 =C2=B1  4%  sched_debug.cpu#21.=
ttwu_local
     10.00 =C2=B1 53%    +365.0%      46.50 =C2=B1 40%  sched_debug.cpu#22.=
nr_running
   6793937 =C2=B1  1%    +192.2%   19850213 =C2=B1  4%  sched_debug.cpu#22.=
nr_switches
   6794279 =C2=B1  1%    +192.2%   19851667 =C2=B1  4%  sched_debug.cpu#22.=
sched_count
   4999277 =C2=B1  2%    +147.2%   12359089 =C2=B1  5%  sched_debug.cpu#22.=
ttwu_count
   2575092 =C2=B1  1%    +159.1%    6671652 =C2=B1  5%  sched_debug.cpu#22.=
ttwu_local
      9.50 =C2=B1 47%    +355.3%      43.25 =C2=B1 39%  sched_debug.cpu#23.=
nr_running
   6760476 =C2=B1  3%    +194.8%   19928574 =C2=B1  4%  sched_debug.cpu#23.=
nr_switches
   6760836 =C2=B1  3%    +194.8%   19929942 =C2=B1  4%  sched_debug.cpu#23.=
sched_count
   5057550 =C2=B1  0%    +142.4%   12258087 =C2=B1  4%  sched_debug.cpu#23.=
ttwu_count
   2590172 =C2=B1  1%    +159.7%    6726524 =C2=B1  4%  sched_debug.cpu#23.=
ttwu_local
     17.00 =C2=B1 59%    +764.7%     147.00 =C2=B1 46%  sched_debug.cpu#3.n=
r_running
   6553148 =C2=B1  3%     +89.1%   12389631 =C2=B1  9%  sched_debug.cpu#3.n=
r_switches
     -2.50 =C2=B1-3542%   -7430.0%     183.25 =C2=B1 22%  sched_debug.cpu#3=
.nr_uninterruptible
   6553515 =C2=B1  3%     +89.1%   12390332 =C2=B1  9%  sched_debug.cpu#3.s=
ched_count
   5061548 =C2=B1  3%    +105.1%   10380529 =C2=B1  5%  sched_debug.cpu#3.t=
twu_count
   2374084 =C2=B1  3%     +82.0%    4321429 =C2=B1  9%  sched_debug.cpu#3.t=
twu_local
    822869 =C2=B1 10%     -12.4%     720748 =C2=B1 11%  sched_debug.cpu#4.a=
vg_idle
     14.50 =C2=B1 66%    +886.2%     143.00 =C2=B1 52%  sched_debug.cpu#4.n=
r_running
   6627944 =C2=B1  4%     +85.8%   12313003 =C2=B1  8%  sched_debug.cpu#4.n=
r_switches
   6628260 =C2=B1  4%     +85.8%   12313670 =C2=B1  8%  sched_debug.cpu#4.s=
ched_count
   5029009 =C2=B1  4%    +105.9%   10353607 =C2=B1  4%  sched_debug.cpu#4.t=
twu_count
   2417262 =C2=B1  3%     +79.5%    4339802 =C2=B1  7%  sched_debug.cpu#4.t=
twu_local
     41.25 =C2=B1 13%     +72.1%      71.00 =C2=B1 59%  sched_debug.cpu#5.l=
oad
     17.50 =C2=B1 68%    +691.4%     138.50 =C2=B1 47%  sched_debug.cpu#5.n=
r_running
   6997533 =C2=B1  3%     +73.8%   12164617 =C2=B1  8%  sched_debug.cpu#5.n=
r_switches
     78.00 =C2=B1 48%    +184.9%     222.25 =C2=B1 21%  sched_debug.cpu#5.n=
r_uninterruptible
   6997845 =C2=B1  3%     +73.8%   12165273 =C2=B1  8%  sched_debug.cpu#5.s=
ched_count
   4969036 =C2=B1  2%     +94.9%    9684195 =C2=B1  1%  sched_debug.cpu#5.t=
twu_count
   2483310 =C2=B1  3%     +71.0%    4247364 =C2=B1  5%  sched_debug.cpu#5.t=
twu_local
    831260 =C2=B1 12%     -17.7%     683789 =C2=B1  9%  sched_debug.cpu#6.a=
vg_idle
     16.75 =C2=B1 36%    +334.3%      72.75 =C2=B1 45%  sched_debug.cpu#6.n=
r_running
   6163396 =C2=B1  2%    +169.8%   16626723 =C2=B1  4%  sched_debug.cpu#6.n=
r_switches
     54.50 =C2=B1162%    -311.5%    -115.25 =C2=B1-34%  sched_debug.cpu#6.n=
r_uninterruptible
   6163891 =C2=B1  2%    +169.8%   16629352 =C2=B1  4%  sched_debug.cpu#6.s=
ched_count
   5128410 =C2=B1  3%     +77.0%    9074888 =C2=B1  4%  sched_debug.cpu#6.t=
twu_count
   2309853 =C2=B1  3%     +87.4%    4328580 =C2=B1  2%  sched_debug.cpu#6.t=
twu_local
     40.25 =C2=B1  9%     -26.1%      29.75 =C2=B1 18%  sched_debug.cpu#7.c=
pu_load[0]
     40.25 =C2=B1  9%     -28.6%      28.75 =C2=B1 22%  sched_debug.cpu#7.c=
pu_load[1]
     40.00 =C2=B1  8%     -28.8%      28.50 =C2=B1 24%  sched_debug.cpu#7.c=
pu_load[2]
     39.75 =C2=B1  8%     -28.9%      28.25 =C2=B1 25%  sched_debug.cpu#7.c=
pu_load[3]
     39.75 =C2=B1  8%     -28.3%      28.50 =C2=B1 24%  sched_debug.cpu#7.c=
pu_load[4]
     19.25 =C2=B1 41%    +231.2%      63.75 =C2=B1 48%  sched_debug.cpu#7.n=
r_running
   6566332 =C2=B1  5%    +186.9%   18836315 =C2=B1  5%  sched_debug.cpu#7.n=
r_switches
     15.50 =C2=B1158%   -1111.3%    -156.75 =C2=B1-42%  sched_debug.cpu#7.n=
r_uninterruptible
   6566642 =C2=B1  5%    +186.9%   18837866 =C2=B1  5%  sched_debug.cpu#7.s=
ched_count
   5014516 =C2=B1  5%    +127.1%   11386703 =C2=B1  3%  sched_debug.cpu#7.t=
twu_count
   2467246 =C2=B1  2%    +138.0%    5872007 =C2=B1  3%  sched_debug.cpu#7.t=
twu_local
   6802328 =C2=B1  5%    +181.3%   19136656 =C2=B1  4%  sched_debug.cpu#8.n=
r_switches
    -76.25 =C2=B1-113%    +200.0%    -228.75 =C2=B1-38%  sched_debug.cpu#8.=
nr_uninterruptible
   6802722 =C2=B1  5%    +181.3%   19138285 =C2=B1  4%  sched_debug.cpu#8.s=
ched_count
   4959323 =C2=B1  2%    +128.0%   11305581 =C2=B1  3%  sched_debug.cpu#8.t=
twu_count
   2437353 =C2=B1  1%    +146.6%    6011685 =C2=B1  3%  sched_debug.cpu#8.t=
twu_local
    500000 =C2=B1  0%     +14.7%     573462 =C2=B1 10%  sched_debug.cpu#9.m=
ax_idle_balance_cost
     10.75 =C2=B1 56%    +409.3%      54.75 =C2=B1 57%  sched_debug.cpu#9.n=
r_running
   6544270 =C2=B1  6%    +188.6%   18884484 =C2=B1  4%  sched_debug.cpu#9.n=
r_switches
     55.50 =C2=B1103%    -369.8%    -149.75 =C2=B1-45%  sched_debug.cpu#9.n=
r_uninterruptible
   6544607 =C2=B1  6%    +188.6%   18885996 =C2=B1  4%  sched_debug.cpu#9.s=
ched_count
   5030467 =C2=B1  4%    +122.3%   11181045 =C2=B1  5%  sched_debug.cpu#9.t=
twu_count
   2417027 =C2=B1  4%    +138.4%    5762968 =C2=B1  4%  sched_debug.cpu#9.t=
twu_local
      0.40 =C2=B1172%     -99.8%       0.00 =C2=B1 85%  sched_debug.rt_rq[1=
6]:/.rt_time
      0.00 =C2=B1 49%  +73814.5%       0.80 =C2=B1100%  sched_debug.rt_rq[9=
]:/.rt_time


lkp-ws02: Westmere-EP
Memory: 16G




                      hackbench.time.involuntary_context_switches

    3e+08 ++------------------------O--------------------------------------=
-+
          O  O         O   O     O                                         =
 |
  2.5e+08 ++     O                                                O  O   O =
 O
          |         O                   O     O      O                     =
 |
          |                   O                   O     O   O              =
 |
    2e+08 ++                               O                               =
 |
          |                                                    O           =
 |
  1.5e+08 ++                                                               =
 |
          |                                                                =
 |
    1e+08 ++                                                               =
 |
          |                                  .*...*..*..*...*..*           =
 |
          *..*...*..*..*...*..  .*..  ..*..*.                              =
 |
    5e+07 ++                  *.    *.                                     =
 |
          |                                                                =
 |
        0 ++---------------------------------------------------------------=
-+

                                  vmstat.system.in

  300000 ++----------------------------------------------------------------=
-+
         |                O     O   O                                      =
 |
         O            O      O                                       O   O =
 |
  250000 ++ O   O                                                 O        =
 O
         |         O                                                       =
 |
         |                             O      O  O   O  O  O               =
 |
  200000 ++                                O                   O           =
 |
         |                                                                 =
 |
  150000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  100000 ++                                                                =
 |
         |           .*...                   .*..*...*..*..*...*           =
 |
         *..*...*..*.     *..  .*...  .*...*.                              =
 |
   50000 ++------------------*------*--------------------------------------=
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

--===============0079188086175150438==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogaGFja2JlbmNoCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9u
aXRvcgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVt
YXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAK
ICBwcm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAg
aW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczog
CiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6
IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1
ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiAKZGVmYXVsdC13YXRjaGRvZ3M6
CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IGMzNWE5NTY0NDY4NzAzMGIyN2Fj
NmExYjY1ZTY1YjZkNjRmMzM2ODQKbW9kZWw6IFdlc3RtZXJlLUVQCm1lbW9yeTogMTZHCm5yX2hk
ZF9wYXJ0aXRpb25zOiAxMQpoZGRfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9zY3NpLTM1
MDAwYzUwMCotcGFydDEiCnN3YXBfcGFydGl0aW9uczogCnJvb3Rmc19wYXJ0aXRpb246ICIvZGV2
L2Rpc2svYnktaWQvYXRhLVdEQ19XRDEwMDJGQUVYLTAwWjNBMF9XRC1XQ0FUUjU0MDg1NjQtcGFy
dDMiCmNhdGVnb3J5OiBiZW5jaG1hcmsKbnJfdGhyZWFkczogMTYwMCUKcGVyZi1wcm9maWxlOgog
IGZyZXE6IDgwMApoYWNrYmVuY2g6CiAgbW9kZTogcHJvY2VzcwogIGlwYzogcGlwZQpxdWV1ZTog
Y3ljbGljCnRlc3Rib3g6IGxrcC13czAyCnRib3hfZ3JvdXA6IGxrcC13czAyCmtjb25maWc6IHg4
Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNS0wOS0xOSAwNDo1NTo0NS40ODUyNzA4NjkgKzA4
OjAwCmlkOiAyYjU4N2Y1ZmUwOTk4YjFkMGZkMjFiMmRkNTI5ODM0NDIzOTgwZDcxCnVzZXI6IGxr
cApjb21waWxlcjogZ2NjLTQuOQpoZWFkX2NvbW1pdDogYzM1YTk1NjQ0Njg3MDMwYjI3YWM2YTFi
NjVlNjViNmQ2NGYzMzY4NApiYXNlX2NvbW1pdDogMWY5M2U0YTk2YzkxMDkzNzgyMDRjMTQ3YjNl
ZWMwZDBlODEwMGZkZQpicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE1MDkyMTEz
Cmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9jMzVhOTU2NDQ2ODcwMzBi
MjdhYzZhMWI2NWU2NWI2ZDY0ZjMzNjg0L3ZtbGludXotNC4zLjAtcmMyLTAxMTE2LWdjMzVhOTU2
Igpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVz
dWx0L2hhY2tiZW5jaC8xNjAwJS1wcm9jZXNzLXBpcGUvbGtwLXdzMDIvZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45L2MzNWE5NTY0NDY4NzAzMGIyN2FjNmEx
YjY1ZTY1YjZkNjRmMzM2ODQvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9sa3Atd3MwMi9j
eWNsaWNfaGFja2JlbmNoLTE2MDAlLXByb2Nlc3MtcGlwZS14ODZfNjQtcmhlbC1DWUNMSUNfSEVB
RC1jMzVhOTU2NDQ2ODcwMzBiMjdhYzZhMWI2NWU2NWI2ZDY0ZjMzNjg0LTIwMTUwOTE5LTEyMzI3
MS11eXV6dmktMC55YW1sIgpkZXF1ZXVlX3RpbWU6IDIwMTUtMDktMjEgMTQ6NDI6NDIuNjY2OTk4
MDg4ICswODowMApucl9jcHU6ICIkKG5wcm9jKSIKbWF4X3VwdGltZTogMjQwMAppbml0cmQ6ICIv
b3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9h
cHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVkdWxlZC9s
a3Atd3MwMi9jeWNsaWNfaGFja2JlbmNoLTE2MDAlLXByb2Nlc3MtcGlwZS14ODZfNjQtcmhlbC1D
WUNMSUNfSEVBRC1jMzVhOTU2NDQ2ODcwMzBiMjdhYzZhMWI2NWU2NWI2ZDY0ZjMzNjg0LTIwMTUw
OTE5LTEyMzI3MS11eXV6dmktMC55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1y
aGVsCi0gYnJhbmNoPWxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE1MDkyMTEzCi0gY29tbWl0
PWMzNWE5NTY0NDY4NzAzMGIyN2FjNmExYjY1ZTY1YjZkNjRmMzM2ODQKLSBCT09UX0lNQUdFPS9w
a2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9jMzVhOTU2NDQ2ODcwMzBiMjdhYzZhMWI2NWU2
NWI2ZDY0ZjMzNjg0L3ZtbGludXotNC4zLjAtcmMyLTAxMTE2LWdjMzVhOTU2Ci0gbWF4X3VwdGlt
ZT0yNDAwCi0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC9oYWNrYmVuY2gvMTYwMCUtcHJvY2Vzcy1waXBl
L2xrcC13czAyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQu
OS9jMzVhOTU2NDQ2ODcwMzBiMjdhYzZhMWI2NWU2NWI2ZDY0ZjMzNjg0LzAKLSBMS1BfU0VSVkVS
PWlubgotIHwtCiAgaXBtaV93YXRjaGRvZy5zdGFydF9ub3c9MQoKICBlYXJseXByaW50az10dHlT
MCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9h
bHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9
LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRf
cmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xl
PXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5j
Z3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2MzNWE5
NTY0NDY4NzAzMGIyN2FjNmExYjY1ZTY1YjZkNjRmMzM2ODQvbW9kdWxlcy5jZ3oiCmJtX2luaXRy
ZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9v
c2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6
LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei90dXJib3N0YXQuY2d6
LC9sa3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6Igpqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRh
dmc6IDM5NzEuNTAgNDMyNC43NyAyNDUwLjQ5IDEvMzI1IDE2OTQ5CnN0YXJ0X3RpbWU6ICcxNDQy
ODE3ODE0JwplbmRfdGltZTogJzE0NDI4MTg0MjEnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIw
MTUwOTIxLTE0MTEyOSIK

--===============0079188086175150438==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

L3Vzci9iaW4vaGFja2JlbmNoIC1nIDM4NCAtLXByb2Nlc3MgLS1waXBlIC1sIDE4NzUKL3Vzci9i
aW4vaGFja2JlbmNoIC1nIDM4NCAtLXByb2Nlc3MgLS1waXBlIC1sIDE4NzUKL3Vzci9iaW4vaGFj
a2JlbmNoIC1nIDM4NCAtLXByb2Nlc3MgLS1waXBlIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNo
IC1nIDM4NCAtLXByb2Nlc3MgLS1waXBlIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDM4
NCAtLXByb2Nlc3MgLS1waXBlIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDM4NCAtLXBy
b2Nlc3MgLS1waXBlIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDM4NCAtLXByb2Nlc3Mg
LS1waXBlIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDM4NCAtLXByb2Nlc3MgLS1waXBl
IC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDM4NCAtLXByb2Nlc3MgLS1waXBlIC1sIDE4
NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDM4NCAtLXByb2Nlc3MgLS1waXBlIC1sIDE4NzUKL3Vz
ci9iaW4vaGFja2JlbmNoIC1nIDM4NCAtLXByb2Nlc3MgLS1waXBlIC1sIDE4NzUKL3Vzci9iaW4v
aGFja2JlbmNoIC1nIDM4NCAtLXByb2Nlc3MgLS1waXBlIC1sIDE4NzUKL3Vzci9iaW4vaGFja2Jl
bmNoIC1nIDM4NCAtLXByb2Nlc3MgLS1waXBlIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1n
IDM4NCAtLXByb2Nlc3MgLS1waXBlIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDM4NCAt
LXByb2Nlc3MgLS1waXBlIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDM4NCAtLXByb2Nl
c3MgLS1waXBlIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDM4NCAtLXByb2Nlc3MgLS1w
aXBlIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDM4NCAtLXByb2Nlc3MgLS1waXBlIC1s
IDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDM4NCAtLXByb2Nlc3MgLS1waXBlIC1sIDE4NzUK
L3Vzci9iaW4vaGFja2JlbmNoIC1nIDM4NCAtLXByb2Nlc3MgLS1waXBlIC1sIDE4NzUKL3Vzci9i
aW4vaGFja2JlbmNoIC1nIDM4NCAtLXByb2Nlc3MgLS1waXBlIC1sIDE4NzUKL3Vzci9iaW4vaGFj
a2JlbmNoIC1nIDM4NCAtLXByb2Nlc3MgLS1waXBlIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNo
IC1nIDM4NCAtLXByb2Nlc3MgLS1waXBlIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDM4
NCAtLXByb2Nlc3MgLS1waXBlIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDM4NCAtLXBy
b2Nlc3MgLS1waXBlIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDM4NCAtLXByb2Nlc3Mg
LS1waXBlIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDM4NCAtLXByb2Nlc3MgLS1waXBl
IC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDM4NCAtLXByb2Nlc3MgLS1waXBlIC1sIDE4
NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDM4NCAtLXByb2Nlc3MgLS1waXBlIC1sIDE4NzUKL3Vz
ci9iaW4vaGFja2JlbmNoIC1nIDM4NCAtLXByb2Nlc3MgLS1waXBlIC1sIDE4NzUK

--===============0079188086175150438==--

