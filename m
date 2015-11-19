Content-Type: multipart/mixed; boundary="===============4520748851192252372=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [cpuidle, menu] a9ceb78bc7: +1.0% will-it-scale.per_process_ops, +27.1% turbostat.CorWatt
Date: Thu, 19 Nov 2015 14:56:53 +0800
Message-ID: <87si42o4sq.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4520748851192252372==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://internal_merge_and_test_tree devel-catchup-201511170929
commit a9ceb78bc75ca47972096372ff3d48648b16317a ("cpuidle,menu: use interac=
tivity_req to disable polling")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/period/nr_threads/disk/fs/size/=
filenum/rwmode/iomode:
  lkp-ws02/fileio/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/600s/100=
%/1HDD/f2fs/64G/1024f/seqrewr/sync

commit: =

  7884084f3bcc98adfbd8b90a2bd6bcf10c4df2cd
  a9ceb78bc75ca47972096372ff3d48648b16317a

7884084f3bcc98ad a9ceb78bc75ca47972096372ff =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     25.00 =C2=B1  0%      +5.0%      26.25 =C2=B1  1%  fileio.time.percent=
_of_cpu_this_job_got
    139.66 =C2=B1  1%      +5.4%     147.15 =C2=B1  1%  fileio.time.system_=
time
   2430690 =C2=B1  1%      +8.5%    2638113 =C2=B1  1%  fileio.time.volunta=
ry_context_switches
     10076 =C2=B1  0%      +6.4%      10717 =C2=B1  1%  vmstat.system.cs
    917.00 =C2=B1  9%     +18.8%       1089 =C2=B1  7%  vmstat.system.in
      1.50 =C2=B1  1%   +1232.8%      20.02 =C2=B1  1%  turbostat.%Busy
     38.25 =C2=B1  1%   +1291.5%     532.25 =C2=B1  1%  turbostat.Avg_MHz
     40.10 =C2=B1  2%     -40.7%      23.77 =C2=B1  1%  turbostat.CPU%c1
      0.55 =C2=B1 30%     -40.0%       0.33 =C2=B1 21%  turbostat.Pkg%pc3
      0.71 =C2=B1 33%     -39.6%       0.43 =C2=B1 28%  turbostat.Pkg%pc6
      3328 =C2=B1  2%     -19.0%       2695 =C2=B1 15%  numa-vmstat.node0.n=
r_active_anon
      3267 =C2=B1  2%     -19.3%       2636 =C2=B1 16%  numa-vmstat.node0.n=
r_anon_pages
      1985 =C2=B1  4%     +31.2%       2604 =C2=B1 16%  numa-vmstat.node1.n=
r_active_anon
      1926 =C2=B1  4%     +31.9%       2541 =C2=B1 17%  numa-vmstat.node1.n=
r_anon_pages
      1312 =C2=B1  0%     +52.3%       1999 =C2=B1 33%  numa-vmstat.node1.n=
r_mapped
      6478 =C2=B1 28%     +36.7%       8856 =C2=B1 19%  numa-vmstat.node1.n=
r_slab_unreclaimable
 3.534e+09 =C2=B1  1%     -68.6%  1.111e+09 =C2=B1  1%  cpuidle.C1-NHM.time
   2019789 =C2=B1  1%     -82.3%     356679 =C2=B1  2%  cpuidle.C1-NHM.usage
 2.678e+08 =C2=B1 13%     +21.1%  3.243e+08 =C2=B1  8%  cpuidle.C1E-NHM.time
 2.036e+08 =C2=B1  2%     -21.2%  1.606e+08 =C2=B1  6%  cpuidle.C3-NHM.time
     54877 =C2=B1 12%     -40.7%      32516 =C2=B1 17%  cpuidle.C3-NHM.usage
     14034 =C2=B1 22%    +2e+07%  2.742e+09 =C2=B1  1%  cpuidle.POLL.time
    982.50 =C2=B1  6%  +1.9e+05%    1915098 =C2=B1  2%  cpuidle.POLL.usage
     95192 =C2=B1  2%      -8.4%      87218 =C2=B1  4%  numa-meminfo.node0.=
Active
     13322 =C2=B1  2%     -19.0%      10790 =C2=B1 15%  numa-meminfo.node0.=
Active(anon)
     13074 =C2=B1  2%     -19.3%      10552 =C2=B1 16%  numa-meminfo.node0.=
AnonPages
      7953 =C2=B1  3%     +31.1%      10424 =C2=B1 16%  numa-meminfo.node1.=
Active(anon)
      7715 =C2=B1  4%     +31.9%      10173 =C2=B1 17%  numa-meminfo.node1.=
AnonPages
      5252 =C2=B1  0%     +52.3%       8000 =C2=B1 33%  numa-meminfo.node1.=
Mapped
     25915 =C2=B1 28%     +36.7%      35429 =C2=B1 19%  numa-meminfo.node1.=
SUnreclaim
      1.25 =C2=B1 87%    +440.0%       6.75 =C2=B1 71%  sched_debug.cfs_rq[=
11]:/.runnable_load_avg
   -197.75 =C2=B1 -9%     -21.1%    -156.00 =C2=B1 -1%  sched_debug.cpu#0.n=
r_uninterruptible
      1.33 =C2=B1 93%    +706.2%      10.75 =C2=B1 35%  sched_debug.cpu#11.=
cpu_load[0]
      1.00 =C2=B1141%    +625.0%       7.25 =C2=B1 39%  sched_debug.cpu#11.=
cpu_load[1]
      1.00 =C2=B1 81%    +350.0%       4.50 =C2=B1 36%  sched_debug.cpu#11.=
cpu_load[2]
     41.00 =C2=B1 71%    +160.4%     106.75 =C2=B1 67%  sched_debug.cpu#11.=
load
      2.00 =C2=B1237%    +512.5%      12.25 =C2=B1 47%  sched_debug.cpu#17.=
nr_uninterruptible
      1.50 =C2=B1100%    +150.0%       3.75 =C2=B1 57%  sched_debug.cpu#18.=
cpu_load[2]
    353.50 =C2=B1100%    +194.8%       1042 =C2=B1 38%  sched_debug.cpu#18.=
curr->pid
     10.50 =C2=B1 37%     -74.6%       2.67 =C2=B1 63%  sched_debug.cpu#9.c=
pu_load[0]
      7.75 =C2=B1 43%     -69.9%       2.33 =C2=B1 53%  sched_debug.cpu#9.c=
pu_load[1]
      4.75 =C2=B1 56%     -64.9%       1.67 =C2=B1101%  sched_debug.cpu#9.c=
pu_load[2]
      0.00 =C2=B1 -1%      +Inf%       9018 =C2=B1 70%  latency_stats.avg.b=
lk_execute_rq.scsi_execute.scsi_execute_req_flags.ses_recv_diag.[ses].ses_e=
nclosure_data_process.[ses].ses_match_to_enclosure.[ses].ses_intf_add.[ses]=
.class_interface_register.scsi_register_interface.0xffffffffa0006013.do_one=
_initcall.do_init_module
      0.00 =C2=B1 -1%      +Inf%      12191 =C2=B1 77%  latency_stats.avg.b=
lk_execute_rq.scsi_execute.scsi_execute_req_flags.ses_recv_diag.[ses].ses_g=
et_page2_descriptor.[ses].ses_get_power_status.[ses].ses_enclosure_data_pro=
cess.[ses].ses_match_to_enclosure.[ses].ses_intf_add.[ses].class_interface_=
register.scsi_register_interface.0xffffffffa0006013
    149299 =C2=B1100%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.c=
all_rwsem_down_read_failed.f2fs_write_begin.[f2fs].generic_perform_write.__=
generic_file_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs]=
.__vfs_write.vfs_write.SyS_pwrite64.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      14567 =C2=B1 70%  latency_stats.max.b=
lk_execute_rq.scsi_execute.scsi_execute_req_flags.ses_recv_diag.[ses].ses_e=
nclosure_data_process.[ses].ses_match_to_enclosure.[ses].ses_intf_add.[ses]=
.class_interface_register.scsi_register_interface.0xffffffffa0006013.do_one=
_initcall.do_init_module
      0.00 =C2=B1 -1%      +Inf%      76377 =C2=B1126%  latency_stats.max.b=
lk_execute_rq.scsi_execute.scsi_execute_req_flags.ses_recv_diag.[ses].ses_g=
et_page2_descriptor.[ses].ses_get_power_status.[ses].ses_enclosure_data_pro=
cess.[ses].ses_match_to_enclosure.[ses].ses_intf_add.[ses].class_interface_=
register.scsi_register_interface.0xffffffffa0006013
    149299 =C2=B1100%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.c=
all_rwsem_down_read_failed.f2fs_write_begin.[f2fs].generic_perform_write.__=
generic_file_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs]=
.__vfs_write.vfs_write.SyS_pwrite64.entry_SYSCALL_64_fastpath
     55859 =C2=B1151%     -92.1%       4427 =C2=B1 66%  latency_stats.max.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.filemap_w=
rite_and_wait_range.nfs4_file_fsync.[nfsv4].vfs_fsync_range.vfs_fsync.nfs4_=
file_flush.[nfsv4].filp_close.do_dup2.SyS_dup2.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      18036 =C2=B1 70%  latency_stats.sum.b=
lk_execute_rq.scsi_execute.scsi_execute_req_flags.ses_recv_diag.[ses].ses_e=
nclosure_data_process.[ses].ses_match_to_enclosure.[ses].ses_intf_add.[ses]=
.class_interface_register.scsi_register_interface.0xffffffffa0006013.do_one=
_initcall.do_init_module
      0.00 =C2=B1 -1%      +Inf%     265194 =C2=B1 75%  latency_stats.sum.b=
lk_execute_rq.scsi_execute.scsi_execute_req_flags.ses_recv_diag.[ses].ses_g=
et_page2_descriptor.[ses].ses_get_power_status.[ses].ses_enclosure_data_pro=
cess.[ses].ses_match_to_enclosure.[ses].ses_intf_add.[ses].class_interface_=
register.scsi_register_interface.0xffffffffa0006013
    149299 =C2=B1100%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_write_begin.[f2fs].generic_perform_write.__=
generic_file_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs]=
.__vfs_write.vfs_write.SyS_pwrite64.entry_SYSCALL_64_fastpath
  24831664 =C2=B1 75%    +128.2%   56671746 =C2=B1141%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     15256 =C2=B1 71%     -77.5%       3430 =C2=B1 11%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.link_path_walk
   1037288 =C2=B1 75%     -73.0%     280570 =C2=B1 11%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_do_close.[nfsv4]._=
_nfs4_close.[nfsv4].nfs4_close_sync.[nfsv4].nfs4_close_context.[nfsv4].__pu=
t_nfs_open_context.nfs_file_clear_open_context.nfs_file_release.__fput.____=
fput.task_work_run
   1115680 =C2=B1 67%     -69.4%     341828 =C2=B1  7%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs4_file_open.[nfsv4].do_dentry_open.vfs_open.path_openat.do_filp_=
open.do_sys_open
   1381471 =C2=B1 60%     -60.3%     549118 =C2=B1  4%  latency_stats.sum.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.filemap_w=
rite_and_wait_range.nfs4_file_fsync.[nfsv4].vfs_fsync_range.vfs_fsync.nfs4_=
file_flush.[nfsv4].filp_close.do_dup2.SyS_dup2.entry_SYSCALL_64_fastpath

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/filesize/test_size/sync_method/nr_directories/nr_files_per_=
directory:
  lkp-ne04/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performa=
nce/1x/32t/1HDD/btrfs/5K/400M/fsyncBeforeClose/16d/256fpd

commit: =

  7884084f3bcc98adfbd8b90a2bd6bcf10c4df2cd
  a9ceb78bc75ca47972096372ff3d48648b16317a

7884084f3bcc98ad a9ceb78bc75ca47972096372ff =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   1474836 =C2=B1  0%      +5.5%    1556392 =C2=B1  0%  fsmark.app_overhead
      2809 =C2=B1  3%      -9.7%       2537 =C2=B1  4%  slabinfo.proc_inode=
_cache.active_objs
      2.02 =C2=B1  1%    +442.8%      10.96 =C2=B1  2%  turbostat.%Busy
     62.00 =C2=B1  1%    +465.3%     350.50 =C2=B1  2%  turbostat.Avg_MHz
     30.66 =C2=B1  2%     -28.5%      21.93 =C2=B1  4%  turbostat.CPU%c1
 6.145e+08 =C2=B1  2%     -54.3%   2.81e+08 =C2=B1  7%  cpuidle.C1-NHM.time
    683264 =C2=B1  2%     -73.6%     180408 =C2=B1  7%  cpuidle.C1-NHM.usage
   1098723 =C2=B1 64%  +30410.6%  3.352e+08 =C2=B1  2%  cpuidle.POLL.time
    640.50 =C2=B1  6%  +77464.6%     496801 =C2=B1  8%  cpuidle.POLL.usage
      5276 =C2=B1  5%      +8.7%       5735 =C2=B1  5%  sched_debug.cfs_rq[=
0]:/.exec_clock
      6465 =C2=B1  9%     -14.7%       5514 =C2=B1  7%  sched_debug.cfs_rq[=
12]:/.min_vruntime
     77.00 =C2=B1 30%     -48.4%      39.75 =C2=B1 26%  sched_debug.cfs_rq[=
9]:/.util_avg
    105891 =C2=B1 15%     -40.8%      62681 =C2=B1  8%  sched_debug.cpu#1.n=
r_switches
    121683 =C2=B1 14%     -46.9%      64603 =C2=B1  6%  sched_debug.cpu#1.s=
ched_count
     48422 =C2=B1 17%     -44.7%      26773 =C2=B1  8%  sched_debug.cpu#1.s=
ched_goidle
      3.00 =C2=B1-33%     +58.3%       4.75 =C2=B1 79%  sched_debug.cpu#13.=
cpu_load[1]
      0.50 =C2=B1100%    +350.0%       2.25 =C2=B1 48%  sched_debug.cpu#13.=
cpu_load[3]
    715411 =C2=B1 18%     +31.7%     942517 =C2=B1  8%  sched_debug.cpu#14.=
avg_idle
      1592 =C2=B1  4%     +26.5%       2013 =C2=B1  5%  sched_debug.cpu#14.=
nr_uninterruptible
    868941 =C2=B1  4%     -10.0%     782453 =C2=B1  8%  sched_debug.cpu#2.a=
vg_idle
    109139 =C2=B1 16%     +20.6%     131650 =C2=B1 11%  sched_debug.cpu#4.s=
ched_count
    821117 =C2=B1  4%     +14.1%     936810 =C2=B1  2%  sched_debug.cpu#6.a=
vg_idle
     14.25 =C2=B1118%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#6.c=
pu_load[0]
      7.75 =C2=B1115%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#6.c=
pu_load[1]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  lkp-sbx04/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/=
performance/mmap1

commit: =

  7884084f3bcc98adfbd8b90a2bd6bcf10c4df2cd
  a9ceb78bc75ca47972096372ff3d48648b16317a

7884084f3bcc98ad a9ceb78bc75ca47972096372ff =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    169244 =C2=B1  0%      +1.0%     170906 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
      0.02 =C2=B1  0%      -1.6%       0.02 =C2=B1  0%  will-it-scale.scala=
bility
    331.29 =C2=B1  0%      +4.3%     345.43 =C2=B1  3%  will-it-scale.time.=
elapsed_time
    331.29 =C2=B1  0%      +4.3%     345.43 =C2=B1  3%  will-it-scale.time.=
elapsed_time.max
    370.13 =C2=B1  1%      +9.4%     404.80 =C2=B1  6%  will-it-scale.time.=
system_time
  27976634 =C2=B1  4%      +9.2%   30556872 =C2=B1  5%  will-it-scale.time.=
voluntary_context_switches
      1.51 =C2=B1  2%     -30.7%       1.05 =C2=B1  2%  perf-profile.cycles=
.___might_sleep.unmap_page_range.unmap_single_vma.unmap_vmas.unmap_region
   4837942 =C2=B1100%    +293.9%   19057051 =C2=B1141%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
   7756058 =C2=B1 94%    +145.7%   19057051 =C2=B1141%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      1553 =C2=B1 20%    +123.2%       3467 =C2=B1 39%  numa-vmstat.node2.n=
r_active_anon
      3361 =C2=B1 38%     -50.5%       1665 =C2=B1 21%  numa-vmstat.node3.n=
r_active_anon
     32072 =C2=B1  4%     +19.8%      38410 =C2=B1 13%  numa-meminfo.node2.=
Active
      6219 =C2=B1 20%    +123.1%      13873 =C2=B1 39%  numa-meminfo.node2.=
Active(anon)
     38432 =C2=B1 11%     -17.8%      31591 =C2=B1  4%  numa-meminfo.node3.=
Active
     13450 =C2=B1 38%     -50.5%       6663 =C2=B1 21%  numa-meminfo.node3.=
Active(anon)
 4.046e+09 =C2=B1  0%     -73.8%  1.062e+09 =C2=B1 15%  cpuidle.C1-SNB.time
  25674678 =C2=B1  3%     -75.5%    6301506 =C2=B1 10%  cpuidle.C1-SNB.usage
      2565 =C2=B1129%     -80.9%     490.25 =C2=B1  4%  cpuidle.C3-SNB.usage
  27939377 =C2=B1 48%  +13065.7%  3.678e+09 =C2=B1  9%  cpuidle.POLL.time
      2479 =C2=B1 33%  +8.7e+05%   21681613 =C2=B1  5%  cpuidle.POLL.usage
     22.11 =C2=B1  0%     +71.1%      37.84 =C2=B1  0%  turbostat.%Busy
    640.50 =C2=B1  0%     +71.2%       1096 =C2=B1  0%  turbostat.Avg_MHz
     42.48 =C2=B1  0%     -33.6%      28.21 =C2=B1  2%  turbostat.CPU%c1
    135.68 =C2=B1  0%     +27.1%     172.39 =C2=B1  1%  turbostat.CorWatt
     49.00 =C2=B1  0%     +17.9%      57.75 =C2=B1  1%  turbostat.CoreTmp
     48.50 =C2=B1  1%     +19.1%      57.75 =C2=B1  1%  turbostat.PkgTmp
    190.47 =C2=B1  0%     +19.3%     227.25 =C2=B1  0%  turbostat.PkgWatt
    296.25 =C2=B1 21%     +38.7%     411.00 =C2=B1 12%  sched_debug.cfs_rq[=
14]:/.util_avg
    288.50 =C2=B1 25%     +32.5%     382.25 =C2=B1  7%  sched_debug.cfs_rq[=
15]:/.util_avg
     42.00 =C2=B1 99%     -66.7%      14.00 =C2=B1148%  sched_debug.cfs_rq[=
25]:/.load
    696704 =C2=B1 14%     +23.0%     856785 =C2=B1 10%  sched_debug.cfs_rq[=
34]:/.spread0
     57.75 =C2=B1 58%     -47.6%      30.25 =C2=B1  9%  sched_debug.cfs_rq[=
35]:/.load_avg
     57.75 =C2=B1 58%     -47.6%      30.25 =C2=B1  9%  sched_debug.cfs_rq[=
35]:/.tg_load_avg_contrib
      7.25 =C2=B1 11%     +62.1%      11.75 =C2=B1 23%  sched_debug.cfs_rq[=
50]:/.load_avg
      7.25 =C2=B1 11%     +62.1%      11.75 =C2=B1 23%  sched_debug.cfs_rq[=
50]:/.tg_load_avg_contrib
    269.00 =C2=B1 28%     +39.7%     375.75 =C2=B1  5%  sched_debug.cfs_rq[=
5]:/.util_avg
    290.00 =C2=B1 20%     +33.4%     387.00 =C2=B1 13%  sched_debug.cfs_rq[=
8]:/.util_avg
      7.25 =C2=B1  5%     +17.2%       8.50 =C2=B1  5%  sched_debug.cfs_rq[=
9]:/.load_avg
      7.25 =C2=B1  5%     +17.2%       8.50 =C2=B1  5%  sched_debug.cfs_rq[=
9]:/.tg_load_avg_contrib
    125955 =C2=B1 11%     +64.7%     207407 =C2=B1 25%  sched_debug.cpu#10.=
ttwu_count
    202275 =C2=B1 31%     +53.7%     310849 =C2=B1 10%  sched_debug.cpu#15.=
ttwu_count
    779.00 =C2=B1 78%    +125.5%       1756 =C2=B1 10%  sched_debug.cpu#25.=
curr->pid
     42.00 =C2=B1 99%     -66.1%      14.25 =C2=B1148%  sched_debug.cpu#25.=
load
     39119 =C2=B1 35%    +110.4%      82321 =C2=B1 12%  sched_debug.cpu#29.=
nr_switches
     40709 =C2=B1 33%    +106.7%      84158 =C2=B1 12%  sched_debug.cpu#29.=
sched_count
     19442 =C2=B1 35%    +110.5%      40928 =C2=B1 12%  sched_debug.cpu#29.=
sched_goidle
     20224 =C2=B1 42%    +149.5%      50450 =C2=B1 20%  sched_debug.cpu#29.=
ttwu_count
     26131 =C2=B1 24%     +92.4%      50275 =C2=B1 13%  sched_debug.cpu#31.=
ttwu_count
    947565 =C2=B1 39%     +46.2%    1385739 =C2=B1 13%  sched_debug.cpu#32.=
nr_switches
    980441 =C2=B1 38%     +44.8%    1420149 =C2=B1 13%  sched_debug.cpu#32.=
sched_count
    473696 =C2=B1 39%     +46.3%     692786 =C2=B1 13%  sched_debug.cpu#32.=
sched_goidle
    501490 =C2=B1 29%     +49.9%     751947 =C2=B1 18%  sched_debug.cpu#37.=
ttwu_count
    209220 =C2=B1 56%    +392.1%    1029644 =C2=B1 31%  sched_debug.cpu#39.=
nr_switches
    215303 =C2=B1 56%    +390.2%    1055416 =C2=B1 31%  sched_debug.cpu#39.=
sched_count
    104512 =C2=B1 56%    +392.5%     514756 =C2=B1 31%  sched_debug.cpu#39.=
sched_goidle
    119909 =C2=B1 65%    +363.3%     555561 =C2=B1 32%  sched_debug.cpu#39.=
ttwu_count
      5.00 =C2=B1 28%    +100.0%      10.00 =C2=B1 25%  sched_debug.cpu#41.=
cpu_load[0]
      4.75 =C2=B1 22%     +78.9%       8.50 =C2=B1 21%  sched_debug.cpu#41.=
cpu_load[2]
      0.50 =C2=B1538%    +300.0%       2.00 =C2=B1259%  sched_debug.cpu#41.=
nr_uninterruptible
      3.25 =C2=B1 76%    -146.2%      -1.50 =C2=B1-100%  sched_debug.cpu#5.=
nr_uninterruptible
     84801 =C2=B1 58%    +123.2%     189307 =C2=B1 11%  sched_debug.cpu#52.=
nr_switches
     87414 =C2=B1 58%    +124.5%     196236 =C2=B1 10%  sched_debug.cpu#52.=
sched_count
     42284 =C2=B1 58%    +123.6%      94541 =C2=B1 11%  sched_debug.cpu#52.=
sched_goidle
     47561 =C2=B1 63%    +104.5%      97245 =C2=B1 12%  sched_debug.cpu#52.=
ttwu_count
     50222 =C2=B1 43%     +93.7%      97303 =C2=B1 20%  sched_debug.cpu#53.=
ttwu_count
    466.75 =C2=B1 14%     -23.5%     357.00 =C2=B1  2%  sched_debug.cpu#54.=
ttwu_local
    397.50 =C2=B1  6%     -13.9%     342.25 =C2=B1  3%  sched_debug.cpu#55.=
ttwu_local
   1614870 =C2=B1  8%     -40.5%     960069 =C2=B1 46%  sched_debug.cpu#7.n=
r_switches
   1663890 =C2=B1  8%     -40.9%     984008 =C2=B1 45%  sched_debug.cpu#7.s=
ched_count
    807298 =C2=B1  8%     -40.6%     479853 =C2=B1 46%  sched_debug.cpu#7.s=
ched_goidle
    133073 =C2=B1 37%    +103.0%     270104 =C2=B1 39%  sched_debug.cpu#8.t=
twu_count


lkp-ws02: Westmere-EP
Memory: 16G

lkp-ne04: Nehalem-EP
Memory: 12G

lkp-sbx04: Sandy Bridge-EX
Memory: 64G


                                  cpuidle.POLL.time

  6e+09 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  5e+09 ++  O    O          O                                              =
 |
        |    O            O                                                =
 |
        |            O                      O  O          O                =
 |
  4e+09 O+O        O           O O O  O O O   O    O   O                   =
 |
        |      O        O    O       O           O   O  O   O O            =
 |
  3e+09 ++                                                                 =
 |
        |                                                                  =
 |
  2e+09 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  1e+09 ++                                                                 =
 |
        |                                                                  =
 |
      0 *+*-**-*-*-*-*O-*-*-**-*-*-*-**-*-*-*-**-*-*-*-**-*-*-**-*-*-*-**-*=
-*


                                  cpuidle.POLL.usage

  2.5e+07 ++-------O-------------------------------------------------------=
-+
          O OO O O  O O    O O    O     O    O  O O OO O   O               =
 |
          |               O         O O    O  O          O  O O            =
 |
    2e+07 ++                   O O       O                                 =
 |
          |                                                                =
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
          |                                                                =
 |
        0 *+**-*-*-**-*-O-**-*-*-**-*-*-**-*-**-*-*-**-*-*-**-*-*-**-*-*-**=
-*


                                 cpuidle.C1-SNB.time

  6e+09 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  5e+09 ++     *               *        *                   *        *     =
 |
        |     + :             + +      + :  *.  .*         + +      + :    =
 |
        *.*.**  :   .* .*.*.**   *.*.**  : +  **  + .*.**.*   **.*.*  :    =
 |
  4e+09 ++       *.*  *                   *        *                   **.*=
.*
        |                                                                  =
 |
  3e+09 ++                                                                 =
 |
        |                                                                  =
 |
  2e+09 ++                                                                 =
 |
        |                                                                  =
 |
        |        O          O                             O                =
 |
  1e+09 O+O OO     O O  O O  O O O O OO O O O OO O O O OO   O O            =
 |
        |      O                                                           =
 |
      0 ++------------O----------------------------------------------------=
-+


                                 cpuidle.C1-SNB.usage

    3e+07 ++---------------------------------------------------------------=
-+
          |.*    *.        *     * .*    *. .**. .*.  .*    *. .*    *.    =
 |
  2.5e+07 *+ :  +  **.*.*.* +   + *  +   : *    *   **  +   : *  +  +  *.**=
.*
          |  *.*             *.*      *.*                *.*      **       =
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
          |  O O   O       O O   O  O    O                 OO O            =
 |
    5e+06 O+O    O  O O   O    O  O   O O  O OO O O OO O O                 =
 |
          |                                                                =
 |
        0 ++------------O--------------------------------------------------=
-+


                                 turbostat.Avg_MHz

  1200 ++--OO---O--------O-------------------------------------------------=
-+
       O O    O   O O  O   O O OO O O O O OO O O O OO O O O OO             =
 |
  1000 ++                                                                  =
 |
       |                                                                   =
 |
       |                                                                   =
 |
   800 ++                                                                  =
 |
       |  .*   .*.*.      .*.      .*.   .*       .*   .*.      .*.   .*   =
.*
   600 *+*  *.*     *.**.*   *.**.*   *.*  *.*.*.*  *.*   *.**.*   *.*  *.*=
 |
       |                                                                   =
 |
   400 ++                                                                  =
 |
       |                                                                   =
 |
       |                                                                   =
 |
   200 ++                                                                  =
 |
       |                                                                   =
 |
     0 ++-------------O----------------------------------------------------=
-+


                                 turbostat._Busy

  45 ++--------------------------------------------------------------------=
-+
     |   O O  O         O                                                  =
 |
  40 O+O    O   O O   O   OO O O O O O O OO O O O O O OO O O O             =
 |
  35 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
  25 ++                                                                    =
 |
     *.*.*.* .*.*.*.*.*.*.**. .*.*.*.*. .**.*.*. .*.*.**.*. .*.*.*.*. *.*.*=
.*
  20 ++     *                *         *        *          *         *     =
 |
  15 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
   5 ++                                                                    =
 |
     |                                                                     =
 |
   0 ++-------------O------------------------------------------------------=
-+


                                turbostat.CPU_c1

  50 ++--------------------------------------------------------------------=
-+
  45 ++     *.              .*.       .*.      .*.        .*.       .*     =
 |
     *.*.*.*  *.*.*.*.*.*.**   *.*.*.*   **.*.*   *.*.**.*   *.*.*.*  *.*.*=
.*
  40 ++                                                                    =
 |
  35 ++                                                                    =
 |
     |                                                                     =
 |
  30 O+O O O  O O O     O O  O   O   O O  O   O        O O O O             =
 |
  25 ++     O         O    O   O   O     O  O   O O O O                    =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  15 ++                                                                    =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
   5 ++                                                                    =
 |
   0 ++-------------O------------------------------------------------------=
-+


                                turbostat.CoreTmp

  70 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
  60 O+O O OO     O   O O  O O O   O   O OO O O O O O O  O O               =
 |
     |        O O         O      O   O                 O     O             =
 |
  50 *+*.*.**.*.*.*.*.*.*.**.*.*.*.*.*.*.* .*.*.*.*.*.**.*.*.*.*.*.*.**.*.*=
.*
     |                                    *                                =
 |
  40 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
   0 ++-------------O------------------------------------------------------=
-+


                                turbostat.PkgTmp

  70 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
  60 O+O O OO     O   O O  O O O   O   O OO O O O O O O  O O               =
 |
     |        O O         O      O   O                 O     O             =
 |
  50 *+*.*.**.*.*. .*.*.*.**.*.*.*.*.*.*.* .*.*.*.*.*.**.*.*.*.*.*.*.**.*.*=
.*
     |            *                       *                                =
 |
  40 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
   0 ++-------------O------------------------------------------------------=
-+


                                 turbostat.PkgWatt

  250 ++-------------------------------------------------------------------=
-+
      O O O OO O O O   OO O O O O OO O O O O O OO O O O O OO O             =
 |
      |                                                                    =
 |
  200 *+*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*=
.*
      |                                                                    =
 |
      |                                                                    =
 |
  150 ++                                                                   =
 |
      |                                                                    =
 |
  100 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
   50 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
    0 ++-------------O-----------------------------------------------------=
-+


                                 turbostat.CorWatt

  200 ++-------------------------------------------------------------------=
-+
  180 ++  O O  O        O O                                                =
 |
      O O    O   O O   O    O O O OO O O O O O OO O O O O OO O             =
 |
  160 ++                                                                   =
 |
  140 ++      .*.*. .*.                                               *.   =
 |
      *.*.*.**     *   **.*.*.*.*.**.*.*.*.*.*.**.*.*.*.*.**.*.*.*.*.*  *.*=
.*
  120 ++                                                                   =
 |
  100 ++                                                                   =
 |
   80 ++                                                                   =
 |
      |                                                                    =
 |
   60 ++                                                                   =
 |
   40 ++                                                                   =
 |
      |                                                                    =
 |
   20 ++                                                                   =
 |
    0 ++-------------O-----------------------------------------------------=
-+


                                   cpuidle.POLL.time

  3.5e+09 ++---------------------------------------------------------------=
-+
          O OO OO                                                          =
 |
    3e+09 ++       O O  O    O                                             =
 |
          |       O    O  OO  O O OO OO OO O OO OO OO O                    =
 |
  2.5e+09 ++                                                               =
 |
          |                                                                =
 |
    2e+09 ++                                                               =
 |
          |                                                                =
 |
  1.5e+09 ++                                                               =
 |
          |                                                                =
 |
    1e+09 ++                                                               =
 |
          |                                                                =
 |
    5e+08 ++                                                               =
 |
          |                                                                =
 |
        0 *+**-**-**-*-**-**-**-*-**-**-**-*-**-**-**-*-**-**-**-*-**-**-**=
-*


                                  cpuidle.POLL.usage

  2.5e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
          O OO OO                                                          =
 |
    2e+06 ++      OO O OO OO OO O OO OO OO O OO OO O  O                    =
 |
          |                                         O                      =
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
          |                                                                =
 |
   500000 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
        0 *+**-**-**-*-**-**-**-*-**-**-**-*-**-**-**-*-**-**-**-*-**-**-**=
-*


                                  cpuidle.C1-NHM.time

    4e+09 ++---------------------------------------------------------------=
-+
          |           .*                      *.*    .*.               *.  =
.*
  3.5e+09 *+**.**.**.*  *.**  *.*.**.**.**.*.*   *.**   **.**.**.*.**.*  **=
 |
    3e+09 ++               :  :                                            =
 |
          |                :  :                                            =
 |
  2.5e+09 ++                : :                                            =
 |
          |                 : :                                            =
 |
    2e+09 ++                : :                                            =
 |
          |                 : :                                            =
 |
  1.5e+09 ++                ::                                             =
 |
    1e+09 O+ O O  OO O OO OO:OO O OO OO OO O OO OO OO O                    =
 |
          | O   O            :                                             =
 |
    5e+08 ++                 :                                             =
 |
          |                  :                                             =
 |
        0 ++-----------------*---------------------------------------------=
-+


                                 cpuidle.C1-NHM.usage

  2.5e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
          |     *.    .*            .*      .*               .*      .* .* =
 |
    2e+06 *+**.*  **.*  *.**  *.*.**  *.**.*  *.**.**.*.**.**  *.*.**  *  *=
.*
          |                :  :                                            =
 |
          |                :  :                                            =
 |
  1.5e+06 ++                : :                                            =
 |
          |                 : :                                            =
 |
    1e+06 ++                : :                                            =
 |
          |                 ::                                             =
 |
          |                 ::                                             =
 |
   500000 ++                ::                                             =
 |
          O O  O  OO O OO OO OO O OO OO OO O OO OO OO O                    =
 |
          |  O  O            :                                             =
 |
        0 ++-----------------*---------------------------------------------=
-+


                                 turbostat.Avg_MHz

  700 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  600 O+OO O O                                                             =
 |
      |       O O OO O OO O OO O OO O OO O OO O OO   O                     =
 |
  500 ++                                           O                       =
 |
      |                                                                    =
 |
  400 ++                                                                   =
 |
      |                                                                    =
 |
  300 ++                                                                   =
 |
      |                                                                    =
 |
  200 ++                                                                   =
 |
      |                                                                    =
 |
  100 ++                                                                   =
 |
      *.**.*.**.*.**.*.**. .**.*.**.*.**.*.**.*.**.*.**.*.**.*.**.*.**.*.**=
.*
    0 ++------------------*------------------------------------------------=
-+


                                 turbostat._Busy

  25 ++--------------------------------------------------------------------=
-+
     O OO O O                                                              =
 |
     |       O O O  O O OO O O    OO O O O  O    O                         =
 |
  20 ++            O          O O         O   OO   OO                      =
 |
     |                                                                     =
 |
     |                                                                     =
 |
  15 ++                                                                    =
 |
     |                                                                     =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
     |                                                                     =
 |
   5 ++                                                                    =
 |
     |                                                                     =
 |
     *.**.*.**.*.*.**.*.* .*.**.*.**.*.*.**.*.**.*.**.*.**.*.**.*.*.**.*.**=
.*
   0 ++------------------*-------------------------------------------------=
-+


                                turbostat.CPU_c1

  45 ++--------------------------------------------------------------------=
-+
     |   .*.      .*           .*.      .* .*.*     *.    .*.      .* .*.  =
 |
  40 *+**   **.*.*  *.*.*  *.**   **.*.*  *    *.*.*  *.**   **.*.*  *   **=
.*
  35 ++                 :  :                                               =
 |
     |                  :  :                                               =
 |
  30 O+OO O O           :  :                                               =
 |
  25 ++      O          O :  O    O  O    O   O  O                         =
 |
     |         O O OO O :O:O  O O  O   O O  O  O   OO                      =
 |
  20 ++                  ::                                                =
 |
  15 ++                  ::                                                =
 |
     |                   ::                                                =
 |
  10 ++                  ::                                                =
 |
   5 ++                  :                                                 =
 |
     |                   :                                                 =
 |
   0 ++------------------*-------------------------------------------------=
-+



                                   cpuidle.POLL.time

  4.5e+08 ++---------------------------------------------------------------=
-+
          |          O                                                     =
 |
    4e+08 ++  O    O  O   O                                                =
 |
  3.5e+08 OOO  OO   O   OO O OOOO OOOO OOOO  O                             =
 |
          |      O                          O OO                           =
 |
    3e+08 ++                                                               =
 |
  2.5e+08 ++                                                               =
 |
          |                                                                =
 |
    2e+08 ++                                                               =
 |
  1.5e+08 ++                                                               =
 |
          |                                                                =
 |
    1e+08 ++                                                               =
 |
    5e+07 ++                                                               =
 |
          |                                                                =
 |
        0 ***-****-****-****-****-****-****-****-****-****-****-****-****-*=
**


                                 cpuidle.POLL.usage

  600000 ++----------------------OO-OO-------------------------------------=
-+
         O   O                                 O                           =
 |
  500000 ++ O O          O            OO OOOO                              =
 |
         |O       O O  OO  OO O                                            =
 |
         |         O  O      O  O             O                            =
 |
  400000 ++    O O                                                         =
 |
         |                                                                 =
 |
  300000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  100000 ++                                                                =
 |
         |                                                                 =
 |
       0 **-****-****-****-****-***-****-****-****-***-****-****-****-****-=
**


                                  cpuidle.C1-NHM.time

    7e+08 ++---------------------------------------------------------------=
-+
          |*   *     *    *   *     *   *            .*  *     .*  *       =
 |
  6.5e+08 *+*.* :*.** *.** *.* :*.** *.* :*.* * .*  *  ** + ***  ** + ***. =
 |
    6e+08 ++    *              *         *   * *  **       *         *    *=
**
          |                                                                =
 |
  5.5e+08 ++                                                               =
 |
    5e+08 ++                                                               =
 |
          |                                                                =
 |
  4.5e+08 ++                                                               =
 |
    4e+08 ++                                                               =
 |
          |                                                                =
 |
  3.5e+08 ++                                                               =
 |
    3e+08 +O  O    O O            O O       O                              =
 |
          O O  OOO  O O OOOO OOOO  O O OOOO    O                           =
 |
  2.5e+08 ++---------------------------------OO----------------------------=
-+


                                cpuidle.C1-NHM.usage

  800000 ++----------------------------------------------------------------=
-+
         |                                   .*                            =
 |
  700000 +*.  * .**      *.  * .** .*  *. ***  :     *.  * .** *.  * .****.=
 *
         *  ** *   :    *  ** *   *  **  *     ***. *  ** *   *  ** *      =
*|
  600000 ++        **.**                           *                       =
 |
         |                                                                 =
 |
  500000 ++                                                                =
 |
         |                                                                 =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++                                                                =
 |
         |                                                                 =
 |
  200000 OO OOOO OOOO O OO OOO   OO OOOO OOO   O                           =
 |
         |             O      O O           O O                            =
 |
  100000 ++----------------------------------------------------------------=
-+


                                 turbostat.Avg_MHz

  450 ++-------------------------------------------------------------------=
-+
      |           O                                                        =
 |
  400 ++  O    O   O   O                                                   =
 |
  350 OO O O O   O   OO O OOO OOO OOO OOO OO                               =
 |
      |       O                             O O                            =
 |
  300 ++                                                                   =
 |
      |                                                                    =
 |
  250 ++                                                                   =
 |
      |                                                                    =
 |
  200 ++                                                                   =
 |
  150 ++                                                                   =
 |
      |                                                                    =
 |
  100 ++                                                                   =
 |
      |                                                                    =
 |
   50 **-***-***-***-****-***-***-***-***-***-***-***-***-****-***-***-***-=
**


                                 turbostat._Busy

  14 ++--------------------------------------------------------------------=
-+
     |           O                                                         =
 |
  12 +O  O  O O   O O O OO   OO  O  O O                                    =
 |
     O  O O  O  O    O    O O   O O  O  OO OOO                             =
 |
  10 ++                                                                    =
 |
     |                                                                     =
 |
   8 ++                                                                    =
 |
     |                                                                     =
 |
   6 ++                                                                    =
 |
     |                                                                     =
 |
   4 ++                                                                    =
 |
     |                                                                     =
 |
   2 **.***.***.***.***.***.***.***.***.**.***.***.***.***.***.***.***.***.=
**
     |                                                                     =
 |
   0 ++--------------------------------------------------------------------=
-+


                                turbostat.CPU_c1

  34 ++--------------------------------------------------------------------=
-+
     |*.              *.         *                  *          *           =
 |
  32 ++ * *  **. **.* : * *  **. :*. *  **          :*. *  ** + * .* *.**  =
 |
     *   * + :  *    *   * + :  *   * :+  : *    *.*   * :+  *   *  ::   *.=
 |
  30 ++     *               *         *   : :*. *        *          *      =
**
     |                                     *   *                           =
 |
  28 ++                                                                    =
 |
     |                                                                     =
 |
  26 ++                                                                    =
 |
     |                                                                     =
 |
  24 ++          O                                                         =
 |
     |O  O  O O   O   O OO    O  O       O                                 =
 |
  22 O+   O     O   OO    O O   O O OOO O    O                             =
 |
     |  O    O               O             OO                              =
 |
  20 ++--------------------------------------------------------------------=
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

--===============4520748851192252372==
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
YXVsdC13YXRjaGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IGE5Y2Vi
NzhiYzc1Y2E0Nzk3MjA5NjM3MmZmM2Q0ODY0OGIxNjMxN2EKbW9kZWw6IFNhbmR5IEJyaWRnZS1F
WApucl9jcHU6IDY0Cm1lbW9yeTogNjRHCm5yX3NzZF9wYXJ0aXRpb25zOiA3CnNzZF9wYXJ0aXRp
b25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1JTlRFTF9TU0RTQzIqLXBhcnQxIgpzd2FwX3BhcnRp
dGlvbnM6IApjYXRlZ29yeTogYmVuY2htYXJrCnBlcmYtcHJvZmlsZToKICBmcmVxOiA4MDAKd2ls
bC1pdC1zY2FsZToKICB0ZXN0OiBtbWFwMQpxdWV1ZTogYmlzZWN0CnRlc3Rib3g6IGxrcC1zYngw
NAp0Ym94X2dyb3VwOiBsa3Atc2J4MDQKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1l
OiAyMDE1LTExLTE5IDAxOjIxOjQ5LjM3NDE2MDQzOSArMDg6MDAKaWQ6IDBkN2I2ODhjYmJjODFh
YzQzZDc1NGRhMTM4MDRjYmE4OWJmYTc2YjcKdXNlcjogbGtwCmNvbXBpbGVyOiBnY2MtNC45Cmhl
YWRfY29tbWl0OiA3YzdiYjAzZDBjODQzYTU4NDkwZDQ1ZDBjMjdhY2YyNDE2Njk0Y2Y0CmJhc2Vf
Y29tbWl0OiA4MDA1YzQ5ZDlhZWE3NGQzODJmNDc0Y2UxMWFmYmJjN2Q3MTMwYmVjCmJyYW5jaDog
bGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUxMTE4MDUKcm9vdGZzOiBkZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC93aWxsLWl0LXNjYWxlL3BlcmZv
cm1hbmNlLW1tYXAxL2xrcC1zYngwNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82
NC1yaGVsL2djYy00LjkvYTljZWI3OGJjNzVjYTQ3OTcyMDk2MzcyZmYzZDQ4NjQ4YjE2MzE3YS8w
Igpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2xrcC1zYngwNC9iaXNlY3Rfd2lsbC1pdC1zY2Fs
ZS1wZXJmb3JtYW5jZS1tbWFwMS1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1y
aGVsLWE5Y2ViNzhiYzc1Y2E0Nzk3MjA5NjM3MmZmM2Q0ODY0OGIxNjMxN2EtMjAxNTExMTktOTQ5
Ny1iMDc0MnEtMC55YW1sIgptYXhfdXB0aW1lOiAxNTAwCmluaXRyZDogIi9vc2ltYWdlL2RlYmlh
bi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVyX2FwcGVuZDoKLSByb290
PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVkL2xrcC1zYngwNC9iaXNl
Y3Rfd2lsbC1pdC1zY2FsZS1wZXJmb3JtYW5jZS1tbWFwMS1kZWJpYW4teDg2XzY0LTIwMTUtMDIt
MDcuY2d6LXg4Nl82NC1yaGVsLWE5Y2ViNzhiYzc1Y2E0Nzk3MjA5NjM3MmZmM2Q0ODY0OGIxNjMx
N2EtMjAxNTExMTktOTQ5Ny1iMDc0MnEtMC55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4
Nl82NC1yaGVsCi0gYnJhbmNoPWxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE1MTExODA1Ci0g
Y29tbWl0PWE5Y2ViNzhiYzc1Y2E0Nzk3MjA5NjM3MmZmM2Q0ODY0OGIxNjMxN2EKLSBCT09UX0lN
QUdFPS9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9hOWNlYjc4YmM3NWNhNDc5NzIwOTYz
NzJmZjNkNDg2NDhiMTYzMTdhL3ZtbGludXotNC40LjAtcmMxLTAwMDAyLWdhOWNlYjc4Ci0gbWF4
X3VwdGltZT0xNTAwCi0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC93aWxsLWl0LXNjYWxlL3BlcmZvcm1h
bmNlLW1tYXAxL2xrcC1zYngwNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1y
aGVsL2djYy00LjkvYTljZWI3OGJjNzVjYTQ3OTcyMDk2MzcyZmYzZDQ4NjQ4YjE2MzE3YS8wCi0g
TEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1k
LmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJj
dXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3Bh
bmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0
X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFs
CgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNneiIKbW9kdWxlc19pbml0
cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvYTljZWI3OGJjNzVjYTQ3OTcyMDk2
MzcyZmYzZDQ4NjQ4YjE2MzE3YS9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVw
cy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJp
YW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9k
ZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtz
L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3dpbGwtaXQtc2NhbGUuY2d6IgpyZXBlYXRf
dG86IDIKa2VybmVsOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2E5Y2ViNzhiYzc1
Y2E0Nzk3MjA5NjM3MmZmM2Q0ODY0OGIxNjMxN2Evdm1saW51ei00LjQuMC1yYzEtMDAwMDItZ2E5
Y2ViNzgiCmRlcXVldWVfdGltZTogMjAxNS0xMS0xOSAwMToyMjoyOS41NjA1MTA4OTAgKzA4OjAw
CmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogNDcuMDMgMjIuMTYgOC43OSAxLzY2NCAxMjI5
MApzdGFydF90aW1lOiAnMTQ0Nzg2NzQwMCcKZW5kX3RpbWU6ICcxNDQ3ODY3NzM1Jwp2ZXJzaW9u
OiAiL2xrcC9sa3AvLnNyYy0yMDE1MTExOC0xODI4MzIiCg==

--===============4520748851192252372==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNS0xMS0xOSAwMToyMzoxOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMS0xOSAwMToyMzoxOSBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNS0xMS0xOSAwMToyMzoxOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUt
MTEtMTkgMDE6MjM6MTkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTExLTE5IDAxOjIzOjE5IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNS0xMS0xOSAwMToyMzoxOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTEt
MTkgMDE6MjM6MTkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTExLTE5IDAxOjIzOjE5IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNS0xMS0xOSAwMToyMzoxOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTEtMTkg
MDE6MjM6MTkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTExLTE5IDAxOjIzOjE5IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxOC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNS0xMS0xOSAwMToyMzoxOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTEtMTkgMDE6
MjM6MTkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTEtMTkgMDE6MjM6MTkgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE1LTExLTE5IDAxOjIzOjE5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMS0xOSAwMToyMzox
OSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjIvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTEtMTkgMDE6MjM6MTkgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE1LTExLTE5IDAxOjIzOjE5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMS0xOSAwMToyMzoxOSBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTUtMTEtMTkgMDE6MjM6MTkgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1
LTExLTE5IDAxOjIzOjE5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMS0xOSAwMToyMzoxOSBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTUtMTEtMTkgMDE6MjM6MTkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEx
LTE5IDAxOjIzOjE5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTExLTE5IDAxOjIzOjE5IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNS0xMS0xOSAwMToyMzoxOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MzEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTEtMTkg
MDE6MjM6MTkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTExLTE5IDAxOjIzOjE5IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMy9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNS0xMS0xOSAwMToyMzoxOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MzQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTEtMTkgMDE6
MjM6MTkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTExLTE5IDAxOjIzOjE5IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNS0xMS0xOSAwMToyMzoxOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTEtMTkgMDE6MjM6
MTkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTExLTE5IDAxOjIzOjE5IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNS0xMS0xOSAwMToyMzoxOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMS0xOSAwMToyMzoxOSBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTUtMTEtMTkgMDE6MjM6MTkgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1
LTExLTE5IDAxOjIzOjE5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU0Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMS0xOSAwMToyMzoxOSBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTUtMTEtMTkgMDE6MjM6MTkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEx
LTE5IDAxOjIzOjE5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU0NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMS0xOSAwMToyMzoxOSBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTUtMTEtMTkgMDE6MjM6MTkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTQ3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTExLTE5
IDAxOjIzOjE5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0
OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMS0xOSAwMToyMzoxOSBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDkvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTUtMTEtMTkgMDE6MjM6MTkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTEtMTkgMDE6
MjM6MTkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUwL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTExLTE5IDAxOjIzOjE5IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNS0xMS0xOSAwMToyMzoxOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NTIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTEtMTkgMDE6MjM6
MTkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUzL2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTExLTE5IDAxOjIzOjE5IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNS0xMS0xOSAwMToyMzoxOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTEtMTkgMDE6MjM6MTkg
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU2L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgoyMDE1LTExLTE5IDAxOjIzOjE5IGVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
NS0xMS0xOSAwMToyMzoxOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1NTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTEtMTkgMDE6MjM6MTkgZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU5L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE1LTExLTE5IDAxOjIzOjE5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEx
LTE5IDAxOjIzOjE5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU2MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMS0xOSAwMToyMzoxOSBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjEvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTUtMTEtMTkgMDE6MjM6MTkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTExLTE5
IDAxOjIzOjE5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2
My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMS0xOSAwMToyMzoxOSBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNS0xMS0xOSAwMToyMzoxOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMS0xOSAwMToy
MzoxOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OS9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMS0xOSAwMToyMzoyMCAuL3J1bnRlc3QucHkgbW1h
cDEgMTYgYm90aCAxIDggMTYgMjQgMzIgNDggNjQK

--===============4520748851192252372==--

