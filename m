Content-Type: multipart/mixed; boundary="===============5728114960531608385=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [net] 192132b9a0: -17.5% netperf.Throughput_tps
Date: Sun, 20 Sep 2015 20:30:07 +0800
Message-ID: <87eghtb7e8.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5728114960531608385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 192132b9a034d87566294be0fba5f8f75c2cf16b ("net: Add support for VRFs=
 to inetpeer cache")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/runtime/nr_thr=
eads/cluster/test:
  lkp-sbx04/netperf/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perfor=
mance/300s/200%/cs-localhost/TCP_CRR

commit: =

  5345c2e12d41f815c1009c9dee72f3d5fcfd4282
  192132b9a034d87566294be0fba5f8f75c2cf16b

5345c2e12d41f815 192132b9a034d87566294be0fb =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      2841 =C2=B1  2%     -17.5%       2344 =C2=B1  1%  netperf.Throughput_=
tps
 1.095e+08 =C2=B1  2%     -17.3%   90493497 =C2=B1  1%  netperf.time.involu=
ntary_context_switches
 1.093e+08 =C2=B1  2%     -17.5%   90186076 =C2=B1  1%  netperf.time.minor_=
page_faults
      4612 =C2=B1  0%      +9.8%       5062 =C2=B1  1%  netperf.time.percen=
t_of_cpu_this_job_got
     13149 =C2=B1  0%     +11.7%      14686 =C2=B1  1%  netperf.time.system=
_time
    943.49 =C2=B1  3%     -17.1%     781.88 =C2=B1  1%  netperf.time.user_t=
ime
 1.091e+08 =C2=B1  2%     -17.5%   90055371 =C2=B1  1%  netperf.time.volunt=
ary_context_switches
 4.367e+08 =C2=B1  2%     -17.5%  3.604e+08 =C2=B1  1%  softirqs.NET_RX
    320.02 =C2=B1  0%      -2.2%     312.95 =C2=B1  0%  turbostat.CorWatt
    375.96 =C2=B1  0%      -1.9%     368.88 =C2=B1  0%  turbostat.PkgWatt
   1428128 =C2=B1  2%     -17.3%    1180769 =C2=B1  1%  vmstat.system.cs
     68804 =C2=B1  0%      +1.2%      69635 =C2=B1  0%  vmstat.system.in
     23930 =C2=B1148%     -97.8%     522.50 =C2=B1 21%  numa-meminfo.node0.=
Shmem
      1358 =C2=B1141%    +301.8%       5457 =C2=B1 19%  numa-meminfo.node2.=
AnonHugePages
    118910 =C2=B1  3%     +40.5%     167013 =C2=B1 25%  numa-meminfo.node2.=
FilePages
      2519 =C2=B1143%    +279.0%       9548 =C2=B1  9%  numa-meminfo.node2.=
Inactive(anon)
      2604 =C2=B1140%   +1850.5%      50791 =C2=B1 82%  numa-meminfo.node2.=
Shmem
 1.095e+08 =C2=B1  2%     -17.3%   90493497 =C2=B1  1%  time.involuntary_co=
ntext_switches
 1.093e+08 =C2=B1  2%     -17.5%   90186076 =C2=B1  1%  time.minor_page_fau=
lts
      4612 =C2=B1  0%      +9.8%       5062 =C2=B1  1%  time.percent_of_cpu=
_this_job_got
     13149 =C2=B1  0%     +11.7%      14686 =C2=B1  1%  time.system_time
    943.49 =C2=B1  3%     -17.1%     781.88 =C2=B1  1%  time.user_time
 1.091e+08 =C2=B1  2%     -17.5%   90055371 =C2=B1  1%  time.voluntary_cont=
ext_switches
      0.00 =C2=B1 -1%      +Inf%   12974495 =C2=B1167%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
 1.092e+08 =C2=B1  2%     -17.5%   90102386 =C2=B1  1%  latency_stats.hits.=
inet_csk_accept.inet_accept.SYSC_accept4.SyS_accept.entry_SYSCALL_64_fastpa=
th
 2.183e+08 =C2=B1  2%     -17.5%  1.801e+08 =C2=B1  1%  latency_stats.hits.=
sk_wait_data.tcp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_recvfrom.SyS_recvfr=
om.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%   13170498 =C2=B1164%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     13924 =C2=B1 43%    +112.0%      29515 =C2=B1 95%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_m=
unmap.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.entry=
_SYSCALL_64_fastpath
 1.794e+10 =C2=B1  2%     +16.6%  2.092e+10 =C2=B1  2%  latency_stats.sum.i=
net_csk_accept.inet_accept.SYSC_accept4.SyS_accept.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%   13298537 =C2=B1162%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
 1.281e+10 =C2=B1  0%      -5.8%  1.207e+10 =C2=B1  0%  latency_stats.sum.s=
k_wait_data.tcp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_recvfrom.SyS_recvfro=
m.entry_SYSCALL_64_fastpath
 1.126e+08 =C2=B1  2%     -17.4%   93008884 =C2=B1  1%  proc-vmstat.numa_hit
 1.126e+08 =C2=B1  2%     -17.4%   93008682 =C2=B1  1%  proc-vmstat.numa_lo=
cal
      3937 =C2=B1  4%     -11.5%       3483 =C2=B1  7%  proc-vmstat.numa_pa=
ges_migrated
   6363343 =C2=B1  2%     -18.4%    5191906 =C2=B1  2%  proc-vmstat.pgalloc=
_dma32
 1.077e+08 =C2=B1  2%     -17.2%   89162443 =C2=B1  1%  proc-vmstat.pgalloc=
_normal
 1.101e+08 =C2=B1  2%     -17.3%   91044527 =C2=B1  1%  proc-vmstat.pgfault
  1.14e+08 =C2=B1  2%     -17.3%   94305253 =C2=B1  1%  proc-vmstat.pgfree
      3937 =C2=B1  4%     -11.5%       3483 =C2=B1  7%  proc-vmstat.pgmigra=
te_success
  28042466 =C2=B1  2%     -17.5%   23130696 =C2=B1  2%  numa-numastat.node0=
.local_node
  28042466 =C2=B1  2%     -17.5%   23130763 =C2=B1  2%  numa-numastat.node0=
.numa_hit
      0.00 =C2=B1 40%      +Inf%      67.50 =C2=B1  8%  numa-numastat.node0=
.other_node
  28130811 =C2=B1  3%     -15.6%   23732122 =C2=B1  1%  numa-numastat.node1=
.local_node
  28130861 =C2=B1  3%     -15.6%   23732168 =C2=B1  1%  numa-numastat.node1=
.numa_hit
  28109208 =C2=B1  2%     -18.4%   22948672 =C2=B1  2%  numa-numastat.node2=
.local_node
  28109647 =C2=B1  2%     -18.4%   22948710 =C2=B1  2%  numa-numastat.node2=
.numa_hit
  28283999 =C2=B1  2%     -18.0%   23200094 =C2=B1  1%  numa-numastat.node3=
.local_node
  28284539 =C2=B1  2%     -18.0%   23200610 =C2=B1  1%  numa-numastat.node3=
.numa_hit
     89720 =C2=B1  2%     -10.5%      80327 =C2=B1  1%  slabinfo.Acpi-State=
.active_objs
      1766 =C2=B1  2%     -10.4%       1581 =C2=B1  1%  slabinfo.Acpi-State=
.active_slabs
     90097 =C2=B1  2%     -10.4%      80684 =C2=B1  1%  slabinfo.Acpi-State=
.num_objs
      1766 =C2=B1  2%     -10.4%       1581 =C2=B1  1%  slabinfo.Acpi-State=
.num_slabs
      1165 =C2=B1  4%     +23.6%       1440 =C2=B1  9%  slabinfo.blkdev_req=
uests.active_objs
      1165 =C2=B1  4%     +23.6%       1440 =C2=B1  9%  slabinfo.blkdev_req=
uests.num_objs
     45272 =C2=B1  5%     -27.6%      32776 =C2=B1  3%  slabinfo.kmalloc-25=
6.active_objs
    792.50 =C2=B1  5%     -29.8%     556.50 =C2=B1  4%  slabinfo.kmalloc-25=
6.active_slabs
     50753 =C2=B1  5%     -29.7%      35654 =C2=B1  4%  slabinfo.kmalloc-25=
6.num_objs
    792.50 =C2=B1  5%     -29.8%     556.50 =C2=B1  4%  slabinfo.kmalloc-25=
6.num_slabs
     78268 =C2=B1  3%     -11.2%      69534 =C2=B1  1%  slabinfo.kmalloc-64=
.active_objs
      1289 =C2=B1  2%     -13.1%       1120 =C2=B1  1%  slabinfo.kmalloc-64=
.active_slabs
     82539 =C2=B1  2%     -13.1%      71749 =C2=B1  1%  slabinfo.kmalloc-64=
.num_objs
      1289 =C2=B1  2%     -13.1%       1120 =C2=B1  1%  slabinfo.kmalloc-64=
.num_slabs
    152.50 =C2=B1 37%     -72.0%      42.67 =C2=B1 85%  numa-vmstat.node0.n=
r_dirtied
      5982 =C2=B1148%     -97.8%     130.00 =C2=B1 21%  numa-vmstat.node0.n=
r_shmem
    148.75 =C2=B1 37%     -71.5%      42.33 =C2=B1 86%  numa-vmstat.node0.n=
r_written
  14143937 =C2=B1  2%     -17.2%   11706912 =C2=B1  2%  numa-vmstat.node0.n=
uma_hit
  14109627 =C2=B1  2%     -17.3%   11671407 =C2=B1  2%  numa-vmstat.node0.n=
uma_local
     32.00 =C2=B1119%    +244.5%     110.25 =C2=B1 75%  numa-vmstat.node1.n=
r_dirtied
     30.67 =C2=B1121%    +252.2%     108.00 =C2=B1 75%  numa-vmstat.node1.n=
r_written
  14248863 =C2=B1  3%     -15.3%   12069600 =C2=B1  1%  numa-vmstat.node1.n=
uma_hit
  14238070 =C2=B1  3%     -15.3%   12059120 =C2=B1  1%  numa-vmstat.node1.n=
uma_local
     29727 =C2=B1  3%     +40.5%      41752 =C2=B1 25%  numa-vmstat.node2.n=
r_file_pages
    629.25 =C2=B1144%    +279.3%       2386 =C2=B1  9%  numa-vmstat.node2.n=
r_inactive_anon
    650.50 =C2=B1140%   +1851.9%      12697 =C2=B1 82%  numa-vmstat.node2.n=
r_shmem
  14166575 =C2=B1  2%     -18.0%   11610237 =C2=B1  2%  numa-vmstat.node2.n=
uma_hit
  14124116 =C2=B1  2%     -18.1%   11569737 =C2=B1  2%  numa-vmstat.node2.n=
uma_local
  14255093 =C2=B1  2%     -17.7%   11737181 =C2=B1  1%  numa-vmstat.node3.n=
uma_hit
  14214429 =C2=B1  2%     -17.7%   11695545 =C2=B1  1%  numa-vmstat.node3.n=
uma_local
      4.22 =C2=B1  7%     -27.1%       3.07 =C2=B1  6%  perf-profile.cpu-cy=
cles.SYSC_accept4.sys_accept.entry_SYSCALL_64_fastpath
      2.12 =C2=B1  3%     -24.3%       1.60 =C2=B1  4%  perf-profile.cpu-cy=
cles.SYSC_bind.sys_bind.entry_SYSCALL_64_fastpath
     25.95 =C2=B1  1%     +21.2%      31.45 =C2=B1  3%  perf-profile.cpu-cy=
cles.SYSC_connect.sys_connect.entry_SYSCALL_64_fastpath
     10.69 =C2=B1  2%     -20.7%       8.48 =C2=B1  2%  perf-profile.cpu-cy=
cles.SYSC_recvfrom.sys_recvfrom.entry_SYSCALL_64_fastpath
     23.42 =C2=B1  6%     -37.4%      14.65 =C2=B1  9%  perf-profile.cpu-cy=
cles.SYSC_sendto.sys_sendto.entry_SYSCALL_64_fastpath
     15.88 =C2=B1  4%     +67.7%      26.64 =C2=B1  5%  perf-profile.cpu-cy=
cles.____fput.task_work_run.do_notify_resume.int_signal
     21.77 =C2=B1 12%     -47.6%      11.40 =C2=B1 15%  perf-profile.cpu-cy=
cles.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.enqueue_t=
ask.activate_task
      3.14 =C2=B1 14%     -23.2%       2.41 =C2=B1  4%  perf-profile.cpu-cy=
cles.__dentry_kill.dput.__fput.____fput.task_work_run
      2.52 =C2=B1  6%     -59.8%       1.01 =C2=B1 36%  perf-profile.cpu-cy=
cles.__destroy_inode.destroy_inode.evict.iput.__dentry_kill
      3.01 =C2=B1  2%     -31.9%       2.05 =C2=B1  3%  perf-profile.cpu-cy=
cles.__dev_queue_xmit.dev_queue_xmit_sk.ip_finish_output2.ip_finish_output.=
ip_output
     12.36 =C2=B1  6%     +12.4%      13.89 =C2=B1  1%  perf-profile.cpu-cy=
cles.__do_softirq.do_softirq_own_stack.do_softirq.__local_bh_enable_ip._raw=
_spin_unlock_bh
     29.10 =C2=B1  4%     -13.3%      25.23 =C2=B1  2%  perf-profile.cpu-cy=
cles.__do_softirq.do_softirq_own_stack.do_softirq.__local_bh_enable_ip.ip_f=
inish_output2
      2.16 =C2=B1 16%     -43.8%       1.21 =C2=B1  3%  perf-profile.cpu-cy=
cles.__do_softirq.do_softirq_own_stack.do_softirq.__local_bh_enable_ip.tcp_=
prequeue_process
     15.70 =C2=B1  4%     +68.6%      26.47 =C2=B1  4%  perf-profile.cpu-cy=
cles.__fput.____fput.task_work_run.do_notify_resume.int_signal
      0.67 =C2=B1 17%     +69.9%       1.14 =C2=B1  5%  perf-profile.cpu-cy=
cles.__hrtimer_run_queues.hrtimer_interrupt.local_apic_timer_interrupt.smp_=
apic_timer_interrupt.apic_timer_interrupt
     25.34 =C2=B1  1%     +22.3%      30.99 =C2=B1  3%  perf-profile.cpu-cy=
cles.__inet_stream_connect.inet_stream_connect.SYSC_connect.sys_connect.ent=
ry_SYSCALL_64_fastpath
      3.18 =C2=B1  2%     -20.8%       2.52 =C2=B1  3%  perf-profile.cpu-cy=
cles.__kernel_text_address.print_context_stack.dump_trace.save_stack_trace_=
tsk.__account_scheduler_latency
     12.44 =C2=B1  6%     +12.0%      13.94 =C2=B1  1%  perf-profile.cpu-cy=
cles.__local_bh_enable_ip._raw_spin_unlock_bh.release_sock.__inet_stream_co=
nnect.inet_stream_connect
     29.46 =C2=B1  4%     -13.3%      25.54 =C2=B1  2%  perf-profile.cpu-cy=
cles.__local_bh_enable_ip.ip_finish_output2.ip_finish_output.ip_output.ip_l=
ocal_out_sk
      2.40 =C2=B1 15%     -47.1%       1.27 =C2=B1  4%  perf-profile.cpu-cy=
cles.__local_bh_enable_ip.tcp_prequeue_process.tcp_recvmsg.inet_recvmsg.soc=
k_recvmsg
      1.49 =C2=B1  3%     -15.6%       1.26 =C2=B1  1%  perf-profile.cpu-cy=
cles.__schedule.schedule.schedule_timeout.sk_wait_data.tcp_recvmsg
      1.49 =C2=B1  4%     -12.4%       1.31 =C2=B1  1%  perf-profile.cpu-cy=
cles.__sock_create.sys_socket.entry_SYSCALL_64_fastpath
     21.55 =C2=B1  7%     -38.8%      13.18 =C2=B1 10%  perf-profile.cpu-cy=
cles.__tcp_push_pending_frames.tcp_push.tcp_sendmsg.inet_sendmsg.sock_sendm=
sg
      7.71 =C2=B1  3%     +56.6%      12.09 =C2=B1  4%  perf-profile.cpu-cy=
cles.__tcp_push_pending_frames.tcp_send_fin.tcp_close.inet_release.sock_rel=
ease
      2.66 =C2=B1  2%     -21.8%       2.08 =C2=B1  6%  perf-profile.cpu-cy=
cles.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      8.51 =C2=B1 10%     -44.9%       4.70 =C2=B1 13%  perf-profile.cpu-cy=
cles.__wake_up_common.__wake_up_sync_key.sock_def_readable.tcp_child_proces=
s.tcp_v4_do_rcv
     16.79 =C2=B1 10%     -43.8%       9.44 =C2=B1 12%  perf-profile.cpu-cy=
cles.__wake_up_common.__wake_up_sync_key.tcp_prequeue.tcp_v4_rcv.ip_local_d=
eliver_finish
      8.60 =C2=B1 11%     -44.8%       4.75 =C2=B1 12%  perf-profile.cpu-cy=
cles.__wake_up_sync_key.sock_def_readable.tcp_child_process.tcp_v4_do_rcv.t=
cp_v4_rcv
     16.96 =C2=B1 10%     -43.6%       9.56 =C2=B1 12%  perf-profile.cpu-cy=
cles.__wake_up_sync_key.tcp_prequeue.tcp_v4_rcv.ip_local_deliver_finish.ip_=
local_deliver
      0.82 =C2=B1 24%     -42.1%       0.47 =C2=B1  6%  perf-profile.cpu-cy=
cles._raw_spin_lock.inode_doinit_with_dentry.selinux_d_instantiate.security=
_d_instantiate.d_instantiate
      1.74 =C2=B1 20%     -52.2%       0.83 =C2=B1  6%  perf-profile.cpu-cy=
cles._raw_spin_lock.selinux_inode_free_security.security_inode_free.__destr=
oy_inode.destroy_inode
      0.00 =C2=B1 -1%      +Inf%       6.25 =C2=B1 17%  perf-profile.cpu-cy=
cles._raw_spin_lock_bh.tcp_get_metrics.tcp_init_metrics.tcp_finish_connect.=
tcp_rcv_state_process
      0.00 =C2=B1 -1%      +Inf%       5.69 =C2=B1 12%  perf-profile.cpu-cy=
cles._raw_spin_lock_bh.tcp_get_metrics.tcp_init_metrics.tcp_rcv_state_proce=
ss.tcp_child_process
      0.00 =C2=B1 -1%      +Inf%       8.21 =C2=B1 12%  perf-profile.cpu-cy=
cles._raw_spin_lock_bh.tcp_get_metrics.tcp_update_metrics.tcp_rcv_state_pro=
cess.tcp_v4_do_rcv
      0.00 =C2=B1 -1%      +Inf%       5.65 =C2=B1 13%  perf-profile.cpu-cy=
cles._raw_spin_lock_bh.tcp_get_metrics.tcp_update_metrics.tcp_time_wait.tcp=
_fin
     14.89 =C2=B1 19%     -60.2%       5.92 =C2=B1 26%  perf-profile.cpu-cy=
cles._raw_spin_lock_irqsave.__account_scheduler_latency.enqueue_entity.enqu=
eue_task_fair.enqueue_task
     12.46 =C2=B1  6%     +11.8%      13.92 =C2=B1  1%  perf-profile.cpu-cy=
cles._raw_spin_unlock_bh.release_sock.__inet_stream_connect.inet_stream_con=
nect.SYSC_connect
     23.55 =C2=B1 11%     -45.6%      12.82 =C2=B1 13%  perf-profile.cpu-cy=
cles.activate_task.ttwu_do_activate.try_to_wake_up.default_wake_function.au=
toremove_wake_function
      8.49 =C2=B1 11%     -45.0%       4.67 =C2=B1 13%  perf-profile.cpu-cy=
cles.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.sock_def_=
readable.tcp_child_process
     16.75 =C2=B1 10%     -43.9%       9.40 =C2=B1 12%  perf-profile.cpu-cy=
cles.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.tcp_prequ=
eue.tcp_v4_rcv
      1.82 =C2=B1  1%     -23.9%       1.39 =C2=B1  1%  perf-profile.cpu-cy=
cles.copy_page_to_iter.generic_file_read_iter.__vfs_read.vfs_read.sys_read
      1.29 =C2=B1  7%     -42.3%       0.75 =C2=B1 26%  perf-profile.cpu-cy=
cles.d_instantiate.sock_alloc_file.SYSC_accept4.sys_accept.entry_SYSCALL_64=
_fastpath
      8.47 =C2=B1 11%     -44.9%       4.67 =C2=B1 12%  perf-profile.cpu-cy=
cles.default_wake_function.autoremove_wake_function.__wake_up_common.__wake=
_up_sync_key.sock_def_readable
     16.71 =C2=B1 10%     -44.0%       9.36 =C2=B1 12%  perf-profile.cpu-cy=
cles.default_wake_function.autoremove_wake_function.__wake_up_common.__wake=
_up_sync_key.tcp_prequeue
      1.12 =C2=B1  5%     -28.6%       0.80 =C2=B1 11%  perf-profile.cpu-cy=
cles.dequeue_task.deactivate_task.__schedule.schedule.schedule_timeout
      2.62 =C2=B1  5%     -45.4%       1.43 =C2=B1 25%  perf-profile.cpu-cy=
cles.destroy_inode.evict.iput.__dentry_kill.dput
      1.44 =C2=B1  3%     -16.1%       1.21 =C2=B1  2%  perf-profile.cpu-cy=
cles.dev_hard_start_xmit.__dev_queue_xmit.dev_queue_xmit_sk.ip_finish_outpu=
t2.ip_finish_output
      3.15 =C2=B1  3%     -30.5%       2.18 =C2=B1  4%  perf-profile.cpu-cy=
cles.dev_queue_xmit_sk.ip_finish_output2.ip_finish_output.ip_output.ip_loca=
l_out_sk
      2.07 =C2=B1  7%     -32.2%       1.40 =C2=B1  3%  perf-profile.cpu-cy=
cles.do_filp_open.do_sys_open.sys_open.entry_SYSCALL_64_fastpath
      1.65 =C2=B1  3%     -17.7%       1.36 =C2=B1  2%  perf-profile.cpu-cy=
cles.do_mmap_pgoff.vm_mmap_pgoff.sys_mmap_pgoff.sys_mmap.entry_SYSCALL_64_f=
astpath
      2.42 =C2=B1  2%     -25.6%       1.80 =C2=B1  5%  perf-profile.cpu-cy=
cles.do_munmap.vm_munmap.sys_munmap.entry_SYSCALL_64_fastpath
     16.19 =C2=B1  4%     +65.9%      26.85 =C2=B1  4%  perf-profile.cpu-cy=
cles.do_notify_resume.int_signal
     12.40 =C2=B1  6%     +12.3%      13.92 =C2=B1  1%  perf-profile.cpu-cy=
cles.do_softirq.part.13.__local_bh_enable_ip._raw_spin_unlock_bh.release_so=
ck.__inet_stream_connect
     29.32 =C2=B1  4%     -13.3%      25.43 =C2=B1  2%  perf-profile.cpu-cy=
cles.do_softirq.part.13.__local_bh_enable_ip.ip_finish_output2.ip_finish_ou=
tput.ip_output
      2.36 =C2=B1 15%     -47.0%       1.25 =C2=B1  3%  perf-profile.cpu-cy=
cles.do_softirq.part.13.__local_bh_enable_ip.tcp_prequeue_process.tcp_recvm=
sg.inet_recvmsg
     12.38 =C2=B1  6%     +12.4%      13.91 =C2=B1  1%  perf-profile.cpu-cy=
cles.do_softirq_own_stack.do_softirq.__local_bh_enable_ip._raw_spin_unlock_=
bh.release_sock
     29.23 =C2=B1  4%     -13.3%      25.34 =C2=B1  2%  perf-profile.cpu-cy=
cles.do_softirq_own_stack.do_softirq.__local_bh_enable_ip.ip_finish_output2=
.ip_finish_output
      2.27 =C2=B1 16%     -45.7%       1.23 =C2=B1  3%  perf-profile.cpu-cy=
cles.do_softirq_own_stack.do_softirq.__local_bh_enable_ip.tcp_prequeue_proc=
ess.tcp_recvmsg
      2.44 =C2=B1  2%     -30.5%       1.70 =C2=B1  6%  perf-profile.cpu-cy=
cles.do_sys_open.sys_open.entry_SYSCALL_64_fastpath
      3.60 =C2=B1 15%     -31.8%       2.46 =C2=B1  1%  perf-profile.cpu-cy=
cles.dput.__fput.____fput.task_work_run.do_notify_resume
      5.97 =C2=B1  3%     -24.1%       4.53 =C2=B1  4%  perf-profile.cpu-cy=
cles.dump_trace.save_stack_trace_tsk.__account_scheduler_latency.enqueue_en=
tity.enqueue_task_fair
     22.90 =C2=B1 12%     -46.4%      12.28 =C2=B1 14%  perf-profile.cpu-cy=
cles.enqueue_entity.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_ac=
tivate
     23.53 =C2=B1 11%     -45.6%      12.80 =C2=B1 13%  perf-profile.cpu-cy=
cles.enqueue_task.activate_task.ttwu_do_activate.try_to_wake_up.default_wak=
e_function
     23.30 =C2=B1 11%     -46.0%      12.59 =C2=B1 13%  perf-profile.cpu-cy=
cles.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate.try_to_w=
ake_up
     81.30 =C2=B1  1%     -12.6%      71.09 =C2=B1  1%  perf-profile.cpu-cy=
cles.entry_SYSCALL_64_fastpath
      2.79 =C2=B1  9%     -26.7%       2.05 =C2=B1 13%  perf-profile.cpu-cy=
cles.evict.iput.__dentry_kill.dput.__fput
      2.63 =C2=B1  1%     -24.7%       1.98 =C2=B1  5%  perf-profile.cpu-cy=
cles.generic_file_read_iter.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_f=
astpath
      1.25 =C2=B1  1%     -11.6%       1.10 =C2=B1  6%  perf-profile.cpu-cy=
cles.handle_mm_fault.__do_page_fault.do_page_fault.page_fault.copy_page_to_=
iter
      1.61 =C2=B1  4%     -17.0%       1.34 =C2=B1  2%  perf-profile.cpu-cy=
cles.inet_accept.SYSC_accept4.sys_accept.entry_SYSCALL_64_fastpath
      1.08 =C2=B1  4%     -27.3%       0.79 =C2=B1  5%  perf-profile.cpu-cy=
cles.inet_bind.SYSC_bind.sys_bind.entry_SYSCALL_64_fastpath
      1.42 =C2=B1  4%      -9.7%       1.28 =C2=B1  1%  perf-profile.cpu-cy=
cles.inet_csk_accept.inet_accept.SYSC_accept4.sys_accept.entry_SYSCALL_64_f=
astpath
     10.13 =C2=B1  2%     -20.2%       8.09 =C2=B1  3%  perf-profile.cpu-cy=
cles.inet_recvmsg.sock_recvmsg.SYSC_recvfrom.sys_recvfrom.entry_SYSCALL_64_=
fastpath
     10.96 =C2=B1  2%    +112.9%      23.33 =C2=B1  6%  perf-profile.cpu-cy=
cles.inet_release.sock_release.sock_close.__fput.____fput
     23.08 =C2=B1  6%     -37.9%      14.34 =C2=B1  9%  perf-profile.cpu-cy=
cles.inet_sendmsg.sock_sendmsg.SYSC_sendto.sys_sendto.entry_SYSCALL_64_fast=
path
     25.43 =C2=B1  1%     +22.3%      31.09 =C2=B1  3%  perf-profile.cpu-cy=
cles.inet_stream_connect.SYSC_connect.sys_connect.entry_SYSCALL_64_fastpath
      1.18 =C2=B1 13%     -70.0%       0.35 =C2=B1 45%  perf-profile.cpu-cy=
cles.inode_doinit_with_dentry.selinux_d_instantiate.security_d_instantiate.=
d_instantiate.sock_alloc_file
     16.22 =C2=B1  4%     +65.8%      26.88 =C2=B1  4%  perf-profile.cpu-cy=
cles.int_signal
     32.31 =C2=B1  4%     -13.9%      27.82 =C2=B1  2%  perf-profile.cpu-cy=
cles.ip_finish_output.ip_output.ip_local_out_sk.ip_queue_xmit.tcp_transmit_=
skb
     32.07 =C2=B1  3%     -13.9%      27.61 =C2=B1  2%  perf-profile.cpu-cy=
cles.ip_finish_output2.ip_finish_output.ip_output.ip_local_out_sk.ip_queue_=
xmit
      5.52 =C2=B1  2%     -19.1%       4.46 =C2=B1  2%  perf-profile.cpu-cy=
cles.ip_local_out_sk.ip_queue_xmit.tcp_transmit_skb.tcp_connect.tcp_v4_conn=
ect
     26.33 =C2=B1  5%     -12.7%      22.97 =C2=B1  2%  perf-profile.cpu-cy=
cles.ip_local_out_sk.ip_queue_xmit.tcp_transmit_skb.tcp_write_xmit.__tcp_pu=
sh_pending_frames
      5.46 =C2=B1  2%     -19.2%       4.41 =C2=B1  2%  perf-profile.cpu-cy=
cles.ip_output.ip_local_out_sk.ip_queue_xmit.tcp_transmit_skb.tcp_connect
      1.52 =C2=B1 11%     -28.4%       1.09 =C2=B1  4%  perf-profile.cpu-cy=
cles.ip_output.ip_local_out_sk.ip_queue_xmit.tcp_transmit_skb.tcp_send_ack
     26.05 =C2=B1  5%     -12.6%      22.77 =C2=B1  2%  perf-profile.cpu-cy=
cles.ip_output.ip_local_out_sk.ip_queue_xmit.tcp_transmit_skb.tcp_write_xmit
      6.14 =C2=B1  2%     -19.2%       4.96 =C2=B1  2%  perf-profile.cpu-cy=
cles.ip_queue_xmit.tcp_transmit_skb.tcp_connect.tcp_v4_connect.__inet_strea=
m_connect
      1.29 =C2=B1 10%     -17.7%       1.06 =C2=B1  2%  perf-profile.cpu-cy=
cles.ip_queue_xmit.tcp_transmit_skb.tcp_send_ack.__tcp_ack_snd_check.tcp_rc=
v_established
     20.46 =C2=B1  7%     -40.0%      12.29 =C2=B1 10%  perf-profile.cpu-cy=
cles.ip_queue_xmit.tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frame=
s.tcp_push
      6.16 =C2=B1  3%     +76.8%      10.88 =C2=B1  5%  perf-profile.cpu-cy=
cles.ip_queue_xmit.tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frame=
s.tcp_send_fin
      2.96 =C2=B1 13%     -23.7%       2.25 =C2=B1  7%  perf-profile.cpu-cy=
cles.iput.__dentry_kill.dput.__fput.____fput
      1.23 =C2=B1  5%     -25.3%       0.92 =C2=B1  9%  perf-profile.cpu-cy=
cles.is_module_text_address.__kernel_text_address.print_context_stack.dump_=
trace.save_stack_trace_tsk
      1.18 =C2=B1  3%     -23.6%       0.90 =C2=B1  4%  perf-profile.cpu-cy=
cles.loopback_xmit.dev_hard_start_xmit.__dev_queue_xmit.dev_queue_xmit_sk.i=
p_finish_output2
      1.40 =C2=B1 23%     -79.7%       0.28 =C2=B1 17%  perf-profile.cpu-cy=
cles.native_queued_spin_lock_slowpath._raw_spin_lock.selinux_inode_free_sec=
urity.security_inode_free.__destroy_inode
      0.00 =C2=B1 -1%      +Inf%       6.06 =C2=B1 17%  perf-profile.cpu-cy=
cles.native_queued_spin_lock_slowpath._raw_spin_lock_bh.tcp_get_metrics.tcp=
_init_metrics.tcp_finish_connect
      0.00 =C2=B1 -1%      +Inf%       5.52 =C2=B1 12%  perf-profile.cpu-cy=
cles.native_queued_spin_lock_slowpath._raw_spin_lock_bh.tcp_get_metrics.tcp=
_init_metrics.tcp_rcv_state_process
      0.00 =C2=B1 -1%      +Inf%       7.96 =C2=B1 12%  perf-profile.cpu-cy=
cles.native_queued_spin_lock_slowpath._raw_spin_lock_bh.tcp_get_metrics.tcp=
_update_metrics.tcp_rcv_state_process
      0.00 =C2=B1 -1%      +Inf%       5.49 =C2=B1 14%  perf-profile.cpu-cy=
cles.native_queued_spin_lock_slowpath._raw_spin_lock_bh.tcp_get_metrics.tcp=
_update_metrics.tcp_time_wait
     14.34 =C2=B1 20%     -61.6%       5.50 =C2=B1 28%  perf-profile.cpu-cy=
cles.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__account_sche=
duler_latency.enqueue_entity.enqueue_task_fair
      1.91 =C2=B1  7%     -29.3%       1.35 =C2=B1  3%  perf-profile.cpu-cy=
cles.path_openat.do_filp_open.do_sys_open.sys_open.entry_SYSCALL_64_fastpath
      5.42 =C2=B1  4%     -24.0%       4.12 =C2=B1  2%  perf-profile.cpu-cy=
cles.print_context_stack.dump_trace.save_stack_trace_tsk.__account_schedule=
r_latency.enqueue_entity
     15.36 =C2=B1  4%     +49.3%      22.93 =C2=B1  5%  perf-profile.cpu-cy=
cles.release_sock.__inet_stream_connect.inet_stream_connect.SYSC_connect.sy=
s_connect
      1.47 =C2=B1  4%    +572.7%       9.86 =C2=B1  9%  perf-profile.cpu-cy=
cles.release_sock.tcp_close.inet_release.sock_release.sock_close
      5.99 =C2=B1  3%     -23.9%       4.56 =C2=B1  4%  perf-profile.cpu-cy=
cles.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entity.enqueu=
e_task_fair.enqueue_task
      0.94 =C2=B1  3%     -21.5%       0.74 =C2=B1  3%  perf-profile.cpu-cy=
cles.schedule.schedule_timeout.inet_csk_accept.inet_accept.SYSC_accept4
      1.55 =C2=B1  4%     -17.0%       1.28 =C2=B1  1%  perf-profile.cpu-cy=
cles.schedule.schedule_timeout.sk_wait_data.tcp_recvmsg.inet_recvmsg
      0.96 =C2=B1  3%     -22.1%       0.75 =C2=B1  3%  perf-profile.cpu-cy=
cles.schedule_timeout.inet_csk_accept.inet_accept.SYSC_accept4.sys_accept
      1.58 =C2=B1  3%     -18.3%       1.29 =C2=B1  1%  perf-profile.cpu-cy=
cles.schedule_timeout.sk_wait_data.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      1.25 =C2=B1  7%     -57.6%       0.53 =C2=B1 40%  perf-profile.cpu-cy=
cles.security_d_instantiate.d_instantiate.sock_alloc_file.SYSC_accept4.sys_=
accept
      2.41 =C2=B1  9%     -73.2%       0.65 =C2=B1 47%  perf-profile.cpu-cy=
cles.security_inode_free.__destroy_inode.destroy_inode.evict.iput
      1.01 =C2=B1  8%     -36.1%       0.64 =C2=B1  6%  perf-profile.cpu-cy=
cles.security_sock_rcv_skb.sk_filter.tcp_v4_rcv.ip_local_deliver_finish.ip_=
local_deliver
      1.21 =C2=B1  2%     -20.3%       0.96 =C2=B1  1%  perf-profile.cpu-cy=
cles.security_socket_bind.SYSC_bind.sys_bind.entry_SYSCALL_64_fastpath
      1.24 =C2=B1  8%     -58.7%       0.51 =C2=B1 42%  perf-profile.cpu-cy=
cles.selinux_d_instantiate.security_d_instantiate.d_instantiate.sock_alloc_=
file.SYSC_accept4
      2.38 =C2=B1  9%     -74.9%       0.60 =C2=B1 47%  perf-profile.cpu-cy=
cles.selinux_inode_free_security.security_inode_free.__destroy_inode.destro=
y_inode.evict
      1.19 =C2=B1  3%     -23.6%       0.91 =C2=B1  2%  perf-profile.cpu-cy=
cles.selinux_socket_bind.security_socket_bind.SYSC_bind.sys_bind.entry_SYSC=
ALL_64_fastpath
      1.14 =C2=B1  4%     -19.7%       0.92 =C2=B1  3%  perf-profile.cpu-cy=
cles.sk_filter.tcp_v4_rcv.ip_local_deliver_finish.ip_local_deliver.ip_rcv_f=
inish
      2.45 =C2=B1  2%     -12.9%       2.14 =C2=B1  5%  perf-profile.cpu-cy=
cles.sk_wait_data.tcp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_recvfrom
      1.48 =C2=B1 11%     -18.1%       1.21 =C2=B1  3%  perf-profile.cpu-cy=
cles.sock_alloc_file.SYSC_accept4.sys_accept.entry_SYSCALL_64_fastpath
     11.04 =C2=B1  2%    +112.7%      23.48 =C2=B1  6%  perf-profile.cpu-cy=
cles.sock_close.__fput.____fput.task_work_run.do_notify_resume
      8.65 =C2=B1 10%     -44.5%       4.80 =C2=B1 12%  perf-profile.cpu-cy=
cles.sock_def_readable.tcp_child_process.tcp_v4_do_rcv.tcp_v4_rcv.ip_local_=
deliver_finish
     10.42 =C2=B1  2%     -20.3%       8.30 =C2=B1  3%  perf-profile.cpu-cy=
cles.sock_recvmsg.SYSC_recvfrom.sys_recvfrom.entry_SYSCALL_64_fastpath
     11.02 =C2=B1  2%    +113.0%      23.48 =C2=B1  6%  perf-profile.cpu-cy=
cles.sock_release.sock_close.__fput.____fput.task_work_run
     23.26 =C2=B1  6%     -37.7%      14.49 =C2=B1  9%  perf-profile.cpu-cy=
cles.sock_sendmsg.SYSC_sendto.sys_sendto.entry_SYSCALL_64_fastpath
      4.31 =C2=B1  7%     -26.6%       3.17 =C2=B1  6%  perf-profile.cpu-cy=
cles.sys_accept.entry_SYSCALL_64_fastpath
      2.16 =C2=B1  3%     -25.0%       1.62 =C2=B1  4%  perf-profile.cpu-cy=
cles.sys_bind.entry_SYSCALL_64_fastpath
     26.02 =C2=B1  1%     +21.0%      31.48 =C2=B1  3%  perf-profile.cpu-cy=
cles.sys_connect.entry_SYSCALL_64_fastpath
      2.09 =C2=B1  4%     -27.8%       1.51 =C2=B1  3%  perf-profile.cpu-cy=
cles.sys_mmap.entry_SYSCALL_64_fastpath
      2.07 =C2=B1  4%     -27.4%       1.50 =C2=B1  3%  perf-profile.cpu-cy=
cles.sys_mmap_pgoff.sys_mmap.entry_SYSCALL_64_fastpath
      2.53 =C2=B1  2%     -21.6%       1.98 =C2=B1  5%  perf-profile.cpu-cy=
cles.sys_munmap.entry_SYSCALL_64_fastpath
      2.49 =C2=B1  3%     -28.9%       1.77 =C2=B1  7%  perf-profile.cpu-cy=
cles.sys_open.entry_SYSCALL_64_fastpath
      2.96 =C2=B1  3%     -20.2%       2.37 =C2=B1  2%  perf-profile.cpu-cy=
cles.sys_read.entry_SYSCALL_64_fastpath
     10.74 =C2=B1  2%     -20.7%       8.52 =C2=B1  2%  perf-profile.cpu-cy=
cles.sys_recvfrom.entry_SYSCALL_64_fastpath
     23.48 =C2=B1  6%     -37.4%      14.69 =C2=B1  9%  perf-profile.cpu-cy=
cles.sys_sendto.entry_SYSCALL_64_fastpath
      2.43 =C2=B1  2%     -23.8%       1.85 =C2=B1  6%  perf-profile.cpu-cy=
cles.sys_socket.entry_SYSCALL_64_fastpath
     16.06 =C2=B1  4%     +66.8%      26.79 =C2=B1  5%  perf-profile.cpu-cy=
cles.task_work_run.do_notify_resume.int_signal
      1.94 =C2=B1  5%     -24.0%       1.48 =C2=B1  2%  perf-profile.cpu-cy=
cles.tcp_check_req.tcp_v4_do_rcv.tcp_v4_rcv.ip_local_deliver_finish.ip_loca=
l_deliver
      9.42 =C2=B1  9%     +21.5%      11.45 =C2=B1  1%  perf-profile.cpu-cy=
cles.tcp_child_process.tcp_v4_do_rcv.tcp_v4_rcv.ip_local_deliver_finish.ip_=
local_deliver
     10.82 =C2=B1  2%    +114.2%      23.18 =C2=B1  6%  perf-profile.cpu-cy=
cles.tcp_close.inet_release.sock_release.sock_close.__fput
      2.44 =C2=B1  2%     -24.6%       1.84 =C2=B1  4%  perf-profile.cpu-cy=
cles.tcp_conn_request.tcp_v4_conn_request.tcp_rcv_state_process.tcp_v4_do_r=
cv.tcp_v4_rcv
      7.43 =C2=B1  2%     -19.2%       6.00 =C2=B1  2%  perf-profile.cpu-cy=
cles.tcp_connect.tcp_v4_connect.__inet_stream_connect.inet_stream_connect.S=
YSC_connect
      1.16 =C2=B1  6%     -35.6%       0.74 =C2=B1  8%  perf-profile.cpu-cy=
cles.tcp_create_openreq_child.tcp_v4_syn_recv_sock.tcp_check_req.tcp_v4_do_=
rcv.tcp_v4_rcv
      2.52 =C2=B1  4%    +215.6%       7.96 =C2=B1  9%  perf-profile.cpu-cy=
cles.tcp_data_queue.tcp_rcv_state_process.tcp_v4_do_rcv.tcp_v4_rcv.ip_local=
_deliver_finish
      1.14 =C2=B1  7%     -26.3%       0.84 =C2=B1  3%  perf-profile.cpu-cy=
cles.tcp_done.tcp_time_wait.tcp_fin.tcp_data_queue.tcp_rcv_state_process
      2.41 =C2=B1  3%    +224.9%       7.82 =C2=B1  9%  perf-profile.cpu-cy=
cles.tcp_fin.tcp_data_queue.tcp_rcv_state_process.tcp_v4_do_rcv.tcp_v4_rcv
      1.10 =C2=B1  2%    +565.6%       7.30 =C2=B1 15%  perf-profile.cpu-cy=
cles.tcp_finish_connect.tcp_rcv_state_process.tcp_v4_do_rcv.release_sock.__=
inet_stream_connect
      0.11 =C2=B1 19%   +5669.6%       6.63 =C2=B1 17%  perf-profile.cpu-cy=
cles.tcp_get_metrics.tcp_init_metrics.tcp_finish_connect.tcp_rcv_state_proc=
ess.tcp_v4_do_rcv
      0.10 =C2=B1 15%   +5890.0%       5.99 =C2=B1 11%  perf-profile.cpu-cy=
cles.tcp_get_metrics.tcp_init_metrics.tcp_rcv_state_process.tcp_child_proce=
ss.tcp_v4_do_rcv
      0.10 =C2=B1 15%   +8738.5%       8.62 =C2=B1 11%  perf-profile.cpu-cy=
cles.tcp_get_metrics.tcp_update_metrics.tcp_rcv_state_process.tcp_v4_do_rcv=
.release_sock
      0.11 =C2=B1 18%   +5345.5%       5.99 =C2=B1 12%  perf-profile.cpu-cy=
cles.tcp_get_metrics.tcp_update_metrics.tcp_time_wait.tcp_fin.tcp_data_queue
      0.03 =C2=B1 35%  +25137.5%       6.73 =C2=B1 16%  perf-profile.cpu-cy=
cles.tcp_init_metrics.tcp_finish_connect.tcp_rcv_state_process.tcp_v4_do_rc=
v.release_sock
      0.02 =C2=B1 53%  +25935.7%       6.08 =C2=B1 11%  perf-profile.cpu-cy=
cles.tcp_init_metrics.tcp_rcv_state_process.tcp_child_process.tcp_v4_do_rcv=
.tcp_v4_rcv
     17.50 =C2=B1  9%     -43.1%       9.95 =C2=B1 12%  perf-profile.cpu-cy=
cles.tcp_prequeue.tcp_v4_rcv.ip_local_deliver_finish.ip_local_deliver.ip_rc=
v_finish
      7.24 =C2=B1  3%     -19.9%       5.80 =C2=B1  3%  perf-profile.cpu-cy=
cles.tcp_prequeue_process.tcp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_recvfr=
om
     21.65 =C2=B1  7%     -39.0%      13.21 =C2=B1 10%  perf-profile.cpu-cy=
cles.tcp_push.tcp_sendmsg.inet_sendmsg.sock_sendmsg.SYSC_sendto
      3.75 =C2=B1  3%     -30.0%       2.62 =C2=B1  2%  perf-profile.cpu-cy=
cles.tcp_rcv_established.tcp_v4_do_rcv.tcp_prequeue_process.tcp_recvmsg.ine=
t_recvmsg
      0.49 =C2=B1  8%   +1221.9%       6.48 =C2=B1 10%  perf-profile.cpu-cy=
cles.tcp_rcv_state_process.tcp_child_process.tcp_v4_do_rcv.tcp_v4_rcv.ip_lo=
cal_deliver_finish
      2.71 =C2=B1  2%    +226.3%       8.84 =C2=B1 12%  perf-profile.cpu-cy=
cles.tcp_rcv_state_process.tcp_v4_do_rcv.release_sock.__inet_stream_connect=
.inet_stream_connect
      1.37 =C2=B1  4%    +610.4%       9.75 =C2=B1  9%  perf-profile.cpu-cy=
cles.tcp_rcv_state_process.tcp_v4_do_rcv.release_sock.tcp_close.inet_release
      6.49 =C2=B1  3%     +71.7%      11.15 =C2=B1  5%  perf-profile.cpu-cy=
cles.tcp_rcv_state_process.tcp_v4_do_rcv.tcp_v4_rcv.ip_local_deliver_finish=
.ip_local_deliver
     10.02 =C2=B1  3%     -20.1%       8.01 =C2=B1  3%  perf-profile.cpu-cy=
cles.tcp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_recvfrom.sys_recvfrom
      2.40 =C2=B1  1%     -14.1%       2.06 =C2=B1  3%  perf-profile.cpu-cy=
cles.tcp_send_ack.__tcp_ack_snd_check.tcp_rcv_established.tcp_v4_do_rcv.tcp=
_prequeue_process
      8.41 =C2=B1  2%     +47.8%      12.42 =C2=B1  4%  perf-profile.cpu-cy=
cles.tcp_send_fin.tcp_close.inet_release.sock_release.sock_close
     22.87 =C2=B1  6%     -38.2%      14.14 =C2=B1  9%  perf-profile.cpu-cy=
cles.tcp_sendmsg.inet_sendmsg.sock_sendmsg.SYSC_sendto.sys_sendto
      1.43 =C2=B1  3%    +400.0%       7.14 =C2=B1 10%  perf-profile.cpu-cy=
cles.tcp_time_wait.tcp_fin.tcp_data_queue.tcp_rcv_state_process.tcp_v4_do_r=
cv
      6.51 =C2=B1  2%     -19.0%       5.27 =C2=B1  2%  perf-profile.cpu-cy=
cles.tcp_transmit_skb.tcp_connect.tcp_v4_connect.__inet_stream_connect.inet=
_stream_connect
      1.71 =C2=B1  4%     -19.6%       1.37 =C2=B1  2%  perf-profile.cpu-cy=
cles.tcp_transmit_skb.tcp_send_ack.__tcp_ack_snd_check.tcp_rcv_established.=
tcp_v4_do_rcv
     20.86 =C2=B1  7%     -39.4%      12.65 =C2=B1 10%  perf-profile.cpu-cy=
cles.tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.tcp_push.tcp=
_sendmsg
      6.46 =C2=B1  2%     +72.5%      11.13 =C2=B1  5%  perf-profile.cpu-cy=
cles.tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.tcp_send_fin=
.tcp_close
      0.06 =C2=B1 48%  +14437.5%       8.72 =C2=B1 11%  perf-profile.cpu-cy=
cles.tcp_update_metrics.tcp_rcv_state_process.tcp_v4_do_rcv.release_sock.tc=
p_close
      0.07 =C2=B1 57%   +8066.7%       6.12 =C2=B1 12%  perf-profile.cpu-cy=
cles.tcp_update_metrics.tcp_time_wait.tcp_fin.tcp_data_queue.tcp_rcv_state_=
process
      2.53 =C2=B1  1%     -22.5%       1.96 =C2=B1  3%  perf-profile.cpu-cy=
cles.tcp_v4_conn_request.tcp_rcv_state_process.tcp_v4_do_rcv.tcp_v4_rcv.ip_=
local_deliver_finish
      8.76 =C2=B1  2%     -19.5%       7.05 =C2=B1  2%  perf-profile.cpu-cy=
cles.tcp_v4_connect.__inet_stream_connect.inet_stream_connect.SYSC_connect.=
sys_connect
      2.81 =C2=B1  2%    +216.7%       8.91 =C2=B1 12%  perf-profile.cpu-cy=
cles.tcp_v4_do_rcv.release_sock.__inet_stream_connect.inet_stream_connect.S=
YSC_connect
      1.40 =C2=B1  4%    +602.0%       9.79 =C2=B1  9%  perf-profile.cpu-cy=
cles.tcp_v4_do_rcv.release_sock.tcp_close.inet_release.sock_release
      3.92 =C2=B1  2%     -64.3%       1.40 =C2=B1 18%  perf-profile.cpu-cy=
cles.tcp_v4_do_rcv.tcp_prequeue_process.tcp_recvmsg.inet_recvmsg.sock_recvm=
sg
     19.08 =C2=B1  3%     +31.2%      25.04 =C2=B1  2%  perf-profile.cpu-cy=
cles.tcp_v4_do_rcv.tcp_v4_rcv.ip_local_deliver_finish.ip_local_deliver.ip_r=
cv_finish
      1.24 =C2=B1  1%     -13.7%       1.07 =C2=B1  5%  perf-profile.cpu-cy=
cles.tcp_v4_send_synack.tcp_conn_request.tcp_v4_conn_request.tcp_rcv_state_=
process.tcp_v4_do_rcv
      1.48 =C2=B1  2%     -11.1%       1.32 =C2=B1  1%  perf-profile.cpu-cy=
cles.tcp_v4_syn_recv_sock.tcp_check_req.tcp_v4_do_rcv.tcp_v4_rcv.ip_local_d=
eliver_finish
     21.47 =C2=B1  7%     -39.0%      13.11 =C2=B1  9%  perf-profile.cpu-cy=
cles.tcp_write_xmit.__tcp_push_pending_frames.tcp_push.tcp_sendmsg.inet_sen=
dmsg
      7.65 =C2=B1  2%     +57.3%      12.04 =C2=B1  5%  perf-profile.cpu-cy=
cles.tcp_write_xmit.__tcp_push_pending_frames.tcp_send_fin.tcp_close.inet_r=
elease
      0.43 =C2=B1 20%    +135.6%       1.03 =C2=B1  7%  perf-profile.cpu-cy=
cles.tick_sched_handle.isra.17.tick_sched_timer.__hrtimer_run_queues.hrtime=
r_interrupt.local_apic_timer_interrupt
      0.51 =C2=B1 18%    +107.4%       1.06 =C2=B1  7%  perf-profile.cpu-cy=
cles.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.local_apic_tim=
er_interrupt.smp_apic_timer_interrupt
     25.09 =C2=B1 10%     -44.3%      13.97 =C2=B1 12%  perf-profile.cpu-cy=
cles.try_to_wake_up.default_wake_function.autoremove_wake_function.__wake_u=
p_common.__wake_up_sync_key
     23.97 =C2=B1 11%     -45.4%      13.10 =C2=B1 13%  perf-profile.cpu-cy=
cles.ttwu_do_activate.constprop.83.try_to_wake_up.default_wake_function.aut=
oremove_wake_function.__wake_up_common
      0.39 =C2=B1 24%    +153.9%       0.98 =C2=B1  8%  perf-profile.cpu-cy=
cles.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_=
queues.hrtimer_interrupt
      2.88 =C2=B1  3%     -19.8%       2.31 =C2=B1  4%  perf-profile.cpu-cy=
cles.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      2.01 =C2=B1  4%     -26.9%       1.47 =C2=B1  2%  perf-profile.cpu-cy=
cles.vm_mmap_pgoff.sys_mmap_pgoff.sys_mmap.entry_SYSCALL_64_fastpath
      2.50 =C2=B1  2%     -24.4%       1.89 =C2=B1  5%  perf-profile.cpu-cy=
cles.vm_munmap.sys_munmap.entry_SYSCALL_64_fastpath
    175.75 =C2=B1 26%     -67.3%      57.50 =C2=B1 62%  sched_debug.cfs_rq[=
0]:/.blocked_load_avg
    195.75 =C2=B1 24%     -61.9%      74.50 =C2=B1 45%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
   1267483 =C2=B1 58%    +241.8%    4331730 =C2=B1 32%  sched_debug.cfs_rq[=
10]:/.MIN_vruntime
    106.50 =C2=B1 67%    +167.1%     284.50 =C2=B1 43%  sched_debug.cfs_rq[=
10]:/.blocked_load_avg
     20.25 =C2=B1 21%     +95.1%      39.50 =C2=B1  9%  sched_debug.cfs_rq[=
10]:/.load
   1267483 =C2=B1 58%    +241.8%    4331730 =C2=B1 32%  sched_debug.cfs_rq[=
10]:/.max_vruntime
   7064228 =C2=B1  4%     +24.8%    8816370 =C2=B1  6%  sched_debug.cfs_rq[=
10]:/.min_vruntime
    124.00 =C2=B1 57%    +150.2%     310.25 =C2=B1 39%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
   7354915 =C2=B1 10%     +30.2%    9574721 =C2=B1 15%  sched_debug.cfs_rq[=
11]:/.min_vruntime
    562.00 =C2=B1 14%     +29.7%     729.00 =C2=B1  9%  sched_debug.cfs_rq[=
11]:/.utilization_load_avg
    328.50 =C2=B1 84%     -74.7%      83.00 =C2=B1120%  sched_debug.cfs_rq[=
17]:/.blocked_load_avg
    348.75 =C2=B1 79%     -70.8%     102.00 =C2=B1 94%  sched_debug.cfs_rq[=
17]:/.tg_load_contrib
    550.25 =C2=B1  7%     +17.9%     648.50 =C2=B1  9%  sched_debug.cfs_rq[=
20]:/.utilization_load_avg
   3859894 =C2=B1 33%     -84.1%     613604 =C2=B1133%  sched_debug.cfs_rq[=
21]:/.MIN_vruntime
   3859894 =C2=B1 33%     -84.1%     613604 =C2=B1133%  sched_debug.cfs_rq[=
21]:/.max_vruntime
   3393438 =C2=B1 42%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.MIN_vruntime
   3393438 =C2=B1 42%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.max_vruntime
   6969709 =C2=B1  6%      +9.1%    7603127 =C2=B1  4%  sched_debug.cfs_rq[=
23]:/.min_vruntime
     20.25 =C2=B1 18%     -38.3%      12.50 =C2=B1  4%  sched_debug.cfs_rq[=
23]:/.runnable_load_avg
     21.50 =C2=B1 19%    +445.3%     117.25 =C2=B1 68%  sched_debug.cfs_rq[=
27]:/.load
     16.50 =C2=B1 10%     +31.8%      21.75 =C2=B1  5%  sched_debug.cfs_rq[=
27]:/.runnable_load_avg
    784.00 =C2=B1 91%     -87.7%      96.75 =C2=B1 92%  sched_debug.cfs_rq[=
28]:/.blocked_load_avg
    800.25 =C2=B1 89%     -85.6%     115.25 =C2=B1 75%  sched_debug.cfs_rq[=
28]:/.tg_load_contrib
   6864371 =C2=B1 11%     +28.0%    8788136 =C2=B1 10%  sched_debug.cfs_rq[=
2]:/.min_vruntime
   -160064 =C2=B1-318%    -624.8%     839954 =C2=B1 61%  sched_debug.cfs_rq=
[2]:/.spread0
     91.50 =C2=B1 28%     -62.0%      34.75 =C2=B1 78%  sched_debug.cfs_rq[=
30]:/.nr_spread_over
    488.75 =C2=B1 18%     +29.1%     631.00 =C2=B1 10%  sched_debug.cfs_rq[=
30]:/.utilization_load_avg
     84.00 =C2=B1 36%     -54.2%      38.50 =C2=B1 60%  sched_debug.cfs_rq[=
31]:/.nr_spread_over
   6916568 =C2=B1 11%     +13.9%    7879054 =C2=B1  6%  sched_debug.cfs_rq[=
32]:/.min_vruntime
    116.50 =C2=B1125%     -82.6%      20.25 =C2=B1 42%  sched_debug.cfs_rq[=
34]:/.load
   6871979 =C2=B1 12%     +28.6%    8834078 =C2=B1 11%  sched_debug.cfs_rq[=
34]:/.min_vruntime
     23.25 =C2=B1 11%     -37.6%      14.50 =C2=B1 24%  sched_debug.cfs_rq[=
34]:/.runnable_load_avg
   -153189 =C2=B1-326%    -677.7%     885021 =C2=B1 64%  sched_debug.cfs_rq=
[34]:/.spread0
      7.75 =C2=B1 27%    +377.4%      37.00 =C2=B1 57%  sched_debug.cfs_rq[=
35]:/.blocked_load_avg
   6977299 =C2=B1 10%     +21.0%    8439329 =C2=B1 15%  sched_debug.cfs_rq[=
35]:/.min_vruntime
   6848733 =C2=B1 11%     +22.6%    8396951 =C2=B1 10%  sched_debug.cfs_rq[=
37]:/.min_vruntime
   -176509 =C2=B1-214%    -353.7%     447796 =C2=B1108%  sched_debug.cfs_rq=
[37]:/.spread0
   6783146 =C2=B1  8%     +25.7%    8525859 =C2=B1 14%  sched_debug.cfs_rq[=
38]:/.min_vruntime
    511.50 =C2=B1  9%     +37.9%     705.25 =C2=B1  3%  sched_debug.cfs_rq[=
38]:/.utilization_load_avg
   6750617 =C2=B1  4%     +24.5%    8403331 =C2=B1 11%  sched_debug.cfs_rq[=
39]:/.min_vruntime
   6957525 =C2=B1  8%     +20.8%    8406635 =C2=B1 15%  sched_debug.cfs_rq[=
3]:/.min_vruntime
   7280418 =C2=B1  2%     +22.5%    8920591 =C2=B1 14%  sched_debug.cfs_rq[=
40]:/.min_vruntime
   7111998 =C2=B1  5%     +25.1%    8894040 =C2=B1  7%  sched_debug.cfs_rq[=
42]:/.min_vruntime
   7354642 =C2=B1 10%     +30.2%    9579368 =C2=B1 15%  sched_debug.cfs_rq[=
43]:/.min_vruntime
     48.50 =C2=B1103%    +123.7%     108.50 =C2=B1 60%  sched_debug.cfs_rq[=
43]:/.nr_spread_over
   7446762 =C2=B1  7%     +21.6%    9051878 =C2=B1 17%  sched_debug.cfs_rq[=
44]:/.min_vruntime
    435.50 =C2=B1 22%     +43.4%     624.50 =C2=B1 12%  sched_debug.cfs_rq[=
46]:/.utilization_load_avg
    489.00 =C2=B1  7%     +34.3%     656.50 =C2=B1  8%  sched_debug.cfs_rq[=
48]:/.utilization_load_avg
     21.75 =C2=B1 51%     +55.2%      33.75 =C2=B1 14%  sched_debug.cfs_rq[=
49]:/.nr_spread_over
    282.00 =C2=B1 81%     -83.5%      46.50 =C2=B1117%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
    302.25 =C2=B1 75%     -79.2%      62.75 =C2=B1 88%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
    568.50 =C2=B1 19%     +24.7%     709.00 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.utilization_load_avg
     47.75 =C2=B1 69%    +703.1%     383.50 =C2=B1 78%  sched_debug.cfs_rq[=
50]:/.blocked_load_avg
     62.75 =C2=B1 52%    +541.4%     402.50 =C2=B1 75%  sched_debug.cfs_rq[=
50]:/.tg_load_contrib
    516.00 =C2=B1 13%     +34.1%     691.75 =C2=B1 12%  sched_debug.cfs_rq[=
50]:/.utilization_load_avg
   6918551 =C2=B1  5%      +9.8%    7594242 =C2=B1  5%  sched_debug.cfs_rq[=
55]:/.min_vruntime
     70.00 =C2=B1 45%     -49.6%      35.25 =C2=B1 67%  sched_debug.cfs_rq[=
58]:/.nr_spread_over
    518.25 =C2=B1 22%     +33.3%     691.00 =C2=B1  6%  sched_debug.cfs_rq[=
58]:/.utilization_load_avg
    482.00 =C2=B1 15%     +30.7%     630.00 =C2=B1  5%  sched_debug.cfs_rq[=
59]:/.utilization_load_avg
   6893442 =C2=B1 10%     +22.3%    8433961 =C2=B1  9%  sched_debug.cfs_rq[=
5]:/.min_vruntime
    561.50 =C2=B1  5%     +18.1%     663.00 =C2=B1  9%  sched_debug.cfs_rq[=
5]:/.utilization_load_avg
   2118027 =C2=B1 62%     -82.9%     361211 =C2=B1109%  sched_debug.cfs_rq[=
61]:/.MIN_vruntime
   2118027 =C2=B1 62%     -82.9%     361211 =C2=B1109%  sched_debug.cfs_rq[=
61]:/.max_vruntime
   3804794 =C2=B1 35%     -60.4%    1508156 =C2=B1 71%  sched_debug.cfs_rq[=
62]:/.MIN_vruntime
   3804794 =C2=B1 35%     -60.4%    1508156 =C2=B1 71%  sched_debug.cfs_rq[=
62]:/.max_vruntime
   3234850 =C2=B1 51%     -64.2%    1157307 =C2=B1145%  sched_debug.cfs_rq[=
6]:/.MIN_vruntime
   3234850 =C2=B1 51%     -64.2%    1157307 =C2=B1145%  sched_debug.cfs_rq[=
6]:/.max_vruntime
   6791201 =C2=B1  8%     +26.7%    8601638 =C2=B1 15%  sched_debug.cfs_rq[=
6]:/.min_vruntime
   6657096 =C2=B1  4%     +26.2%    8398917 =C2=B1 11%  sched_debug.cfs_rq[=
7]:/.min_vruntime
    558.75 =C2=B1 11%     +29.8%     725.00 =C2=B1 11%  sched_debug.cfs_rq[=
7]:/.utilization_load_avg
   7286102 =C2=B1  1%     +23.1%    8965833 =C2=B1 15%  sched_debug.cfs_rq[=
8]:/.min_vruntime
   3383122 =C2=B1  2%     -17.9%    2775877 =C2=B1  1%  sched_debug.cpu#0.n=
r_switches
   3392389 =C2=B1  2%     -17.9%    2785232 =C2=B1  1%  sched_debug.cpu#0.s=
ched_count
   3380345 =C2=B1  2%     -19.0%    2737980 =C2=B1  1%  sched_debug.cpu#0.t=
twu_count
   3364390 =C2=B1  2%     -18.8%    2733371 =C2=B1  1%  sched_debug.cpu#0.t=
twu_local
     34.25 =C2=B1 59%     -56.9%      14.75 =C2=B1 12%  sched_debug.cpu#1.c=
pu_load[0]
     28.50 =C2=B1 42%     -48.2%      14.75 =C2=B1 10%  sched_debug.cpu#1.c=
pu_load[1]
     26.75 =C2=B1 36%     -43.9%      15.00 =C2=B1 12%  sched_debug.cpu#1.c=
pu_load[2]
     25.25 =C2=B1 34%     -40.6%      15.00 =C2=B1  9%  sched_debug.cpu#1.c=
pu_load[3]
     22.50 =C2=B1 34%     -44.4%      12.50 =C2=B1  8%  sched_debug.cpu#1.c=
pu_load[4]
   3369428 =C2=B1  2%     -16.2%    2824862 =C2=B1  1%  sched_debug.cpu#1.n=
r_switches
   3371094 =C2=B1  2%     -16.1%    2827260 =C2=B1  1%  sched_debug.cpu#1.s=
ched_count
   3389319 =C2=B1  2%     -17.1%    2810445 =C2=B1  1%  sched_debug.cpu#1.t=
twu_count
   3353366 =C2=B1  2%     -16.3%    2807598 =C2=B1  1%  sched_debug.cpu#1.t=
twu_local
   3335017 =C2=B1  2%     -15.4%    2820801 =C2=B1  1%  sched_debug.cpu#10.=
nr_switches
   3335956 =C2=B1  2%     -15.4%    2821090 =C2=B1  1%  sched_debug.cpu#10.=
sched_count
   3336430 =C2=B1  2%     -15.9%    2806740 =C2=B1  1%  sched_debug.cpu#10.=
ttwu_count
   3318441 =C2=B1  2%     -15.5%    2804699 =C2=B1  1%  sched_debug.cpu#10.=
ttwu_local
   3370289 =C2=B1  3%     -16.3%    2821155 =C2=B1  2%  sched_debug.cpu#11.=
nr_switches
   3371290 =C2=B1  3%     -16.3%    2821629 =C2=B1  2%  sched_debug.cpu#11.=
sched_count
   3361232 =C2=B1  3%     -15.8%    2829002 =C2=B1  2%  sched_debug.cpu#11.=
ttwu_count
   3358106 =C2=B1  3%     -16.4%    2807327 =C2=B1  2%  sched_debug.cpu#11.=
ttwu_local
     16.50 =C2=B1 13%     -25.8%      12.25 =C2=B1 15%  sched_debug.cpu#12.=
cpu_load[4]
   3398141 =C2=B1  3%     -17.9%    2791418 =C2=B1  2%  sched_debug.cpu#12.=
nr_switches
   3400097 =C2=B1  3%     -17.9%    2793004 =C2=B1  2%  sched_debug.cpu#12.=
sched_count
      1646 =C2=B1 32%     +66.4%       2739 =C2=B1 24%  sched_debug.cpu#12.=
sched_goidle
   3395185 =C2=B1  3%     -17.7%    2792849 =C2=B1  3%  sched_debug.cpu#12.=
ttwu_count
   3392814 =C2=B1  3%     -18.5%    2766292 =C2=B1  2%  sched_debug.cpu#12.=
ttwu_local
   3384418 =C2=B1  4%     -16.9%    2813855 =C2=B1  1%  sched_debug.cpu#13.=
nr_switches
   3385991 =C2=B1  4%     -16.8%    2817516 =C2=B1  1%  sched_debug.cpu#13.=
sched_count
   3385348 =C2=B1  3%     -17.2%    2804182 =C2=B1  2%  sched_debug.cpu#13.=
ttwu_count
   3369621 =C2=B1  4%     -16.9%    2800765 =C2=B1  2%  sched_debug.cpu#13.=
ttwu_local
   3377257 =C2=B1  3%     -16.1%    2833788 =C2=B1  2%  sched_debug.cpu#14.=
nr_switches
   3379864 =C2=B1  3%     -16.1%    2836414 =C2=B1  2%  sched_debug.cpu#14.=
sched_count
   3360760 =C2=B1  3%     -15.9%    2826049 =C2=B1  2%  sched_debug.cpu#14.=
ttwu_count
   3357666 =C2=B1  3%     -15.9%    2823748 =C2=B1  2%  sched_debug.cpu#14.=
ttwu_local
   3380508 =C2=B1  3%     -16.2%    2833752 =C2=B1  1%  sched_debug.cpu#15.=
nr_switches
   3381560 =C2=B1  3%     -16.2%    2834059 =C2=B1  1%  sched_debug.cpu#15.=
sched_count
   3381759 =C2=B1  3%     -16.1%    2838452 =C2=B1  2%  sched_debug.cpu#15.=
ttwu_count
   3368631 =C2=B1  3%     -16.4%    2814682 =C2=B1  1%  sched_debug.cpu#15.=
ttwu_local
   3389967 =C2=B1  2%     -17.6%    2791917 =C2=B1  1%  sched_debug.cpu#16.=
nr_switches
   3392333 =C2=B1  2%     -17.6%    2794492 =C2=B1  1%  sched_debug.cpu#16.=
sched_count
   3395971 =C2=B1  2%     -18.1%    2780908 =C2=B1  1%  sched_debug.cpu#16.=
ttwu_count
   3380594 =C2=B1  2%     -18.0%    2770502 =C2=B1  1%  sched_debug.cpu#16.=
ttwu_local
   3379066 =C2=B1  2%     -17.0%    2804619 =C2=B1  2%  sched_debug.cpu#17.=
nr_switches
   3379518 =C2=B1  2%     -17.0%    2806250 =C2=B1  2%  sched_debug.cpu#17.=
sched_count
   3369568 =C2=B1  3%     -17.2%    2790359 =C2=B1  2%  sched_debug.cpu#17.=
ttwu_count
   3366929 =C2=B1  3%     -17.2%    2788295 =C2=B1  2%  sched_debug.cpu#17.=
ttwu_local
   3364431 =C2=B1  2%     -17.1%    2787730 =C2=B1  1%  sched_debug.cpu#18.=
nr_switches
   3364899 =C2=B1  2%     -17.1%    2788705 =C2=B1  1%  sched_debug.cpu#18.=
sched_count
   3358511 =C2=B1  2%     -17.3%    2776889 =C2=B1  1%  sched_debug.cpu#18.=
ttwu_count
   3348289 =C2=B1  2%     -17.6%    2759313 =C2=B1  1%  sched_debug.cpu#18.=
ttwu_local
     16.75 =C2=B1 10%     -17.9%      13.75 =C2=B1 12%  sched_debug.cpu#19.=
cpu_load[4]
   3389035 =C2=B1  2%     -17.5%    2794874 =C2=B1  1%  sched_debug.cpu#19.=
nr_switches
   3390379 =C2=B1  2%     -17.4%    2800760 =C2=B1  1%  sched_debug.cpu#19.=
sched_count
   3382434 =C2=B1  2%     -17.7%    2785348 =C2=B1  1%  sched_debug.cpu#19.=
ttwu_count
   3379051 =C2=B1  2%     -17.7%    2781538 =C2=B1  1%  sched_debug.cpu#19.=
ttwu_local
     23.00 =C2=B1 21%     -38.0%      14.25 =C2=B1  7%  sched_debug.cpu#2.c=
pu_load[3]
   3360803 =C2=B1  2%     -16.7%    2800049 =C2=B1  1%  sched_debug.cpu#2.n=
r_switches
   3361823 =C2=B1  2%     -16.5%    2805748 =C2=B1  1%  sched_debug.cpu#2.s=
ched_count
   3343040 =C2=B1  2%     -16.6%    2789182 =C2=B1  1%  sched_debug.cpu#2.t=
twu_count
   3338401 =C2=B1  2%     -16.5%    2787168 =C2=B1  1%  sched_debug.cpu#2.t=
twu_local
   3341149 =C2=B1  2%     -16.8%    2779014 =C2=B1  2%  sched_debug.cpu#20.=
nr_switches
   3341677 =C2=B1  2%     -16.8%    2780361 =C2=B1  2%  sched_debug.cpu#20.=
sched_count
   3317813 =C2=B1  1%     -16.5%    2771814 =C2=B1  2%  sched_debug.cpu#20.=
ttwu_count
   3313754 =C2=B1  1%     -16.9%    2752947 =C2=B1  3%  sched_debug.cpu#20.=
ttwu_local
   3393487 =C2=B1  2%     -17.6%    2795372 =C2=B1  1%  sched_debug.cpu#21.=
nr_switches
   3400093 =C2=B1  2%     -17.7%    2796868 =C2=B1  1%  sched_debug.cpu#21.=
sched_count
   3378310 =C2=B1  2%     -17.5%    2787801 =C2=B1  2%  sched_debug.cpu#21.=
ttwu_count
   3376315 =C2=B1  2%     -17.7%    2780178 =C2=B1  2%  sched_debug.cpu#21.=
ttwu_local
     16.75 =C2=B1  2%     -14.9%      14.25 =C2=B1  7%  sched_debug.cpu#22.=
cpu_load[4]
   3387714 =C2=B1  2%     -17.2%    2803908 =C2=B1  2%  sched_debug.cpu#22.=
nr_switches
   3388108 =C2=B1  2%     -17.2%    2805212 =C2=B1  2%  sched_debug.cpu#22.=
sched_count
   3384725 =C2=B1  2%     -17.5%    2792197 =C2=B1  2%  sched_debug.cpu#22.=
ttwu_count
   3382935 =C2=B1  2%     -17.6%    2788179 =C2=B1  2%  sched_debug.cpu#22.=
ttwu_local
     21.25 =C2=B1 13%     -24.7%      16.00 =C2=B1 13%  sched_debug.cpu#23.=
cpu_load[3]
     18.00 =C2=B1 13%     -23.6%      13.75 =C2=B1  9%  sched_debug.cpu#23.=
cpu_load[4]
   3401316 =C2=B1  2%     -17.5%    2805389 =C2=B1  2%  sched_debug.cpu#23.=
nr_switches
   3405993 =C2=B1  2%     -17.6%    2807165 =C2=B1  2%  sched_debug.cpu#23.=
sched_count
   3390254 =C2=B1  2%     -17.0%    2814478 =C2=B1  1%  sched_debug.cpu#23.=
ttwu_count
   3386402 =C2=B1  2%     -17.5%    2794862 =C2=B1  2%  sched_debug.cpu#23.=
ttwu_local
   3426699 =C2=B1  2%     -18.1%    2807177 =C2=B1  2%  sched_debug.cpu#24.=
nr_switches
   3427534 =C2=B1  2%     -18.1%    2807540 =C2=B1  2%  sched_debug.cpu#24.=
sched_count
   3419707 =C2=B1  2%     -17.2%    2830470 =C2=B1  2%  sched_debug.cpu#24.=
ttwu_count
   3417657 =C2=B1  2%     -18.3%    2793422 =C2=B1  2%  sched_debug.cpu#24.=
ttwu_local
     17.75 =C2=B1  7%     -15.5%      15.00 =C2=B1  4%  sched_debug.cpu#25.=
cpu_load[3]
     15.50 =C2=B1  9%     -16.1%      13.00 =C2=B1  5%  sched_debug.cpu#25.=
cpu_load[4]
   3390931 =C2=B1  3%     -16.7%    2825710 =C2=B1  2%  sched_debug.cpu#25.=
nr_switches
   3394428 =C2=B1  3%     -16.7%    2826362 =C2=B1  2%  sched_debug.cpu#25.=
sched_count
   3386135 =C2=B1  3%     -17.1%    2806667 =C2=B1  2%  sched_debug.cpu#25.=
ttwu_count
   3374191 =C2=B1  3%     -17.0%    2800759 =C2=B1  2%  sched_debug.cpu#25.=
ttwu_local
   3382304 =C2=B1  3%     -16.8%    2815129 =C2=B1  1%  sched_debug.cpu#26.=
nr_switches
   3382617 =C2=B1  3%     -16.8%    2815612 =C2=B1  1%  sched_debug.cpu#26.=
sched_count
   3391284 =C2=B1  2%     -17.4%    2800669 =C2=B1  2%  sched_debug.cpu#26.=
ttwu_count
   3368626 =C2=B1  3%     -17.0%    2797457 =C2=B1  1%  sched_debug.cpu#26.=
ttwu_local
     21.75 =C2=B1 13%    +448.3%     119.25 =C2=B1114%  sched_debug.cpu#27.=
load
   3377532 =C2=B1  2%     -17.0%    2802024 =C2=B1  1%  sched_debug.cpu#27.=
nr_switches
   3377791 =C2=B1  2%     -17.0%    2803686 =C2=B1  1%  sched_debug.cpu#27.=
sched_count
    913.75 =C2=B1 15%     +96.1%       1792 =C2=B1 34%  sched_debug.cpu#27.=
sched_goidle
   3378183 =C2=B1  3%     -17.9%    2772945 =C2=B1  1%  sched_debug.cpu#27.=
ttwu_count
   3361335 =C2=B1  3%     -17.6%    2769863 =C2=B1  1%  sched_debug.cpu#27.=
ttwu_local
    126632 =C2=B1 46%     +52.9%     193604 =C2=B1  4%  sched_debug.cpu#28.=
avg_idle
   3391259 =C2=B1  3%     -17.1%    2813047 =C2=B1  1%  sched_debug.cpu#28.=
nr_switches
   3391775 =C2=B1  3%     -17.0%    2815887 =C2=B1  1%  sched_debug.cpu#28.=
sched_count
   3379019 =C2=B1  3%     -16.9%    2808674 =C2=B1  1%  sched_debug.cpu#28.=
ttwu_count
   3377041 =C2=B1  3%     -16.9%    2806132 =C2=B1  1%  sched_debug.cpu#28.=
ttwu_local
   3374213 =C2=B1  3%     -16.6%    2812863 =C2=B1  1%  sched_debug.cpu#29.=
nr_switches
   3374449 =C2=B1  3%     -16.6%    2815602 =C2=B1  1%  sched_debug.cpu#29.=
sched_count
      1120 =C2=B1 28%     +92.2%       2153 =C2=B1 33%  sched_debug.cpu#29.=
sched_goidle
   3368967 =C2=B1  3%     -17.4%    2783822 =C2=B1  0%  sched_debug.cpu#29.=
ttwu_count
   3360964 =C2=B1  3%     -17.4%    2777215 =C2=B1  0%  sched_debug.cpu#29.=
ttwu_local
   3380214 =C2=B1  2%     -17.8%    2777895 =C2=B1  1%  sched_debug.cpu#3.n=
r_switches
   3380943 =C2=B1  2%     -17.8%    2779026 =C2=B1  1%  sched_debug.cpu#3.s=
ched_count
   3371958 =C2=B1  2%     -17.7%    2773613 =C2=B1  1%  sched_debug.cpu#3.t=
twu_count
   3368641 =C2=B1  2%     -17.8%    2770455 =C2=B1  1%  sched_debug.cpu#3.t=
twu_local
   3399413 =C2=B1  2%     -17.2%    2813130 =C2=B1  1%  sched_debug.cpu#30.=
nr_switches
   3399925 =C2=B1  2%     -17.3%    2813415 =C2=B1  1%  sched_debug.cpu#30.=
sched_count
   3388030 =C2=B1  2%     -17.2%    2805998 =C2=B1  1%  sched_debug.cpu#30.=
ttwu_count
   3384874 =C2=B1  2%     -17.2%    2803761 =C2=B1  1%  sched_debug.cpu#30.=
ttwu_local
   3424347 =C2=B1  2%     -17.9%    2809733 =C2=B1  1%  sched_debug.cpu#31.=
nr_switches
   3424975 =C2=B1  2%     -18.0%    2809973 =C2=B1  1%  sched_debug.cpu#31.=
sched_count
   3413707 =C2=B1  2%     -17.9%    2802556 =C2=B1  1%  sched_debug.cpu#31.=
ttwu_count
   3411722 =C2=B1  2%     -17.9%    2800372 =C2=B1  1%  sched_debug.cpu#31.=
ttwu_local
    161244 =C2=B1 31%    +141.0%     388617 =C2=B1 75%  sched_debug.cpu#32.=
avg_idle
   3340294 =C2=B1  4%     -16.8%    2779491 =C2=B1  1%  sched_debug.cpu#32.=
nr_switches
   3340509 =C2=B1  4%     -16.8%    2779888 =C2=B1  1%  sched_debug.cpu#32.=
sched_count
   3336888 =C2=B1  3%     -16.4%    2788296 =C2=B1  2%  sched_debug.cpu#32.=
ttwu_count
   3327022 =C2=B1  4%     -17.1%    2756567 =C2=B1  1%  sched_debug.cpu#32.=
ttwu_local
   3369761 =C2=B1  2%     -18.2%    2756152 =C2=B1  2%  sched_debug.cpu#33.=
nr_switches
   3370085 =C2=B1  2%     -18.2%    2757175 =C2=B1  2%  sched_debug.cpu#33.=
sched_count
   3353138 =C2=B1  2%     -17.9%    2754433 =C2=B1  1%  sched_debug.cpu#33.=
ttwu_count
   3350768 =C2=B1  2%     -18.5%    2731749 =C2=B1  2%  sched_debug.cpu#33.=
ttwu_local
   3353463 =C2=B1  2%     -17.1%    2778380 =C2=B1  1%  sched_debug.cpu#34.=
nr_switches
   3353783 =C2=B1  2%     -17.1%    2778950 =C2=B1  1%  sched_debug.cpu#34.=
sched_count
   3338913 =C2=B1  2%     -17.1%    2769303 =C2=B1  1%  sched_debug.cpu#34.=
ttwu_count
   3336154 =C2=B1  2%     -17.0%    2767598 =C2=B1  1%  sched_debug.cpu#34.=
ttwu_local
     19.75 =C2=B1  6%     -13.9%      17.00 =C2=B1  7%  sched_debug.cpu#35.=
cpu_load[1]
     19.75 =C2=B1  4%     -17.7%      16.25 =C2=B1  6%  sched_debug.cpu#35.=
cpu_load[2]
     19.75 =C2=B1  4%     -17.7%      16.25 =C2=B1  5%  sched_debug.cpu#35.=
cpu_load[3]
     17.25 =C2=B1 11%     -20.3%      13.75 =C2=B1 10%  sched_debug.cpu#35.=
cpu_load[4]
   3357618 =C2=B1  2%     -17.1%    2784568 =C2=B1  1%  sched_debug.cpu#35.=
nr_switches
   3357860 =C2=B1  2%     -17.0%    2785577 =C2=B1  1%  sched_debug.cpu#35.=
sched_count
   3350978 =C2=B1  2%     -17.1%    2779124 =C2=B1  1%  sched_debug.cpu#35.=
ttwu_count
   3348950 =C2=B1  2%     -17.1%    2775164 =C2=B1  1%  sched_debug.cpu#35.=
ttwu_local
     33.50 =C2=B1  8%     -29.9%      23.50 =C2=B1 24%  sched_debug.cpu#36.=
load
      2.00 =C2=B1  0%     -50.0%       1.00 =C2=B1  0%  sched_debug.cpu#36.=
nr_running
   3378181 =C2=B1  2%     -17.8%    2776642 =C2=B1  2%  sched_debug.cpu#36.=
nr_switches
   3378466 =C2=B1  2%     -17.8%    2777079 =C2=B1  2%  sched_debug.cpu#36.=
sched_count
   3374695 =C2=B1  2%     -17.8%    2774072 =C2=B1  2%  sched_debug.cpu#36.=
ttwu_count
   3370536 =C2=B1  2%     -18.0%    2763776 =C2=B1  2%  sched_debug.cpu#36.=
ttwu_local
     17.50 =C2=B1 13%     -22.9%      13.50 =C2=B1 12%  sched_debug.cpu#37.=
cpu_load[1]
   3340460 =C2=B1  3%     -16.8%    2779658 =C2=B1  2%  sched_debug.cpu#37.=
nr_switches
   3340683 =C2=B1  3%     -16.8%    2779914 =C2=B1  2%  sched_debug.cpu#37.=
sched_count
   3341001 =C2=B1  2%     -17.4%    2760062 =C2=B1  3%  sched_debug.cpu#37.=
ttwu_count
   3324668 =C2=B1  3%     -17.1%    2756964 =C2=B1  2%  sched_debug.cpu#37.=
ttwu_local
     18.75 =C2=B1  7%     -21.3%      14.75 =C2=B1 12%  sched_debug.cpu#38.=
cpu_load[3]
     17.50 =C2=B1 12%     -27.1%      12.75 =C2=B1  3%  sched_debug.cpu#38.=
cpu_load[4]
   3401218 =C2=B1  2%     -18.2%    2782005 =C2=B1  1%  sched_debug.cpu#38.=
nr_switches
   3401410 =C2=B1  2%     -18.2%    2782445 =C2=B1  1%  sched_debug.cpu#38.=
sched_count
   3400794 =C2=B1  2%     -18.1%    2784512 =C2=B1  2%  sched_debug.cpu#38.=
ttwu_count
   3399813 =C2=B1  2%     -18.6%    2768586 =C2=B1  1%  sched_debug.cpu#38.=
ttwu_local
     17.50 =C2=B1 11%     -22.9%      13.50 =C2=B1 15%  sched_debug.cpu#39.=
cpu_load[4]
   3392132 =C2=B1  2%     -17.0%    2815024 =C2=B1  2%  sched_debug.cpu#39.=
nr_switches
   3392712 =C2=B1  2%     -17.0%    2815476 =C2=B1  2%  sched_debug.cpu#39.=
sched_count
   3389117 =C2=B1  2%     -16.9%    2816247 =C2=B1  1%  sched_debug.cpu#39.=
ttwu_count
   3387435 =C2=B1  2%     -17.3%    2802276 =C2=B1  2%  sched_debug.cpu#39.=
ttwu_local
    165738 =C2=B1 10%     +22.5%     203085 =C2=B1 10%  sched_debug.cpu#4.a=
vg_idle
     20.00 =C2=B1 15%     -26.2%      14.75 =C2=B1  5%  sched_debug.cpu#4.c=
pu_load[2]
     20.00 =C2=B1 15%     -27.5%      14.50 =C2=B1  5%  sched_debug.cpu#4.c=
pu_load[3]
     17.75 =C2=B1 21%     -29.6%      12.50 =C2=B1  6%  sched_debug.cpu#4.c=
pu_load[4]
   3373163 =C2=B1  2%     -17.8%    2772508 =C2=B1  2%  sched_debug.cpu#4.n=
r_switches
   3373753 =C2=B1  2%     -17.8%    2773251 =C2=B1  2%  sched_debug.cpu#4.s=
ched_count
   3362050 =C2=B1  2%     -17.9%    2761172 =C2=B1  2%  sched_debug.cpu#4.t=
twu_count
   3356987 =C2=B1  2%     -17.9%    2755498 =C2=B1  2%  sched_debug.cpu#4.t=
twu_local
     18.25 =C2=B1  9%     -17.8%      15.00 =C2=B1  0%  sched_debug.cpu#40.=
cpu_load[3]
     15.75 =C2=B1 12%     -22.2%      12.25 =C2=B1  3%  sched_debug.cpu#40.=
cpu_load[4]
   3387417 =C2=B1  3%     -16.6%    2826272 =C2=B1  1%  sched_debug.cpu#40.=
nr_switches
   3388123 =C2=B1  3%     -16.6%    2826849 =C2=B1  1%  sched_debug.cpu#40.=
sched_count
   3379250 =C2=B1  3%     -16.0%    2837310 =C2=B1  2%  sched_debug.cpu#40.=
ttwu_count
   3375881 =C2=B1  3%     -16.5%    2817881 =C2=B1  1%  sched_debug.cpu#40.=
ttwu_local
   3339240 =C2=B1  2%     -16.2%    2796813 =C2=B1  0%  sched_debug.cpu#41.=
nr_switches
      4.75 =C2=B1 40%    -100.0%       0.00 =C2=B1  2%  sched_debug.cpu#41.=
nr_uninterruptible
   3339755 =C2=B1  2%     -16.2%    2797077 =C2=B1  0%  sched_debug.cpu#41.=
sched_count
   3340575 =C2=B1  2%     -17.0%    2773377 =C2=B1  0%  sched_debug.cpu#41.=
ttwu_count
   3320958 =C2=B1  2%     -16.5%    2771410 =C2=B1  0%  sched_debug.cpu#41.=
ttwu_local
   3383562 =C2=B1  2%     -16.9%    2811241 =C2=B1  1%  sched_debug.cpu#42.=
nr_switches
   3383989 =C2=B1  2%     -16.9%    2811641 =C2=B1  1%  sched_debug.cpu#42.=
sched_count
   3375932 =C2=B1  2%     -16.9%    2803836 =C2=B1  1%  sched_debug.cpu#42.=
ttwu_count
   3373666 =C2=B1  2%     -16.9%    2801995 =C2=B1  1%  sched_debug.cpu#42.=
ttwu_local
      1465 =C2=B1  2%     +19.7%       1753 =C2=B1 12%  sched_debug.cpu#43.=
curr->pid
   3369174 =C2=B1  3%     -16.5%    2814479 =C2=B1  2%  sched_debug.cpu#43.=
nr_switches
   3369600 =C2=B1  3%     -16.5%    2815000 =C2=B1  2%  sched_debug.cpu#43.=
sched_count
   3381844 =C2=B1  3%     -16.8%    2813877 =C2=B1  2%  sched_debug.cpu#43.=
ttwu_count
   3363319 =C2=B1  3%     -16.6%    2805345 =C2=B1  2%  sched_debug.cpu#43.=
ttwu_local
   3373569 =C2=B1  3%     -16.8%    2805446 =C2=B1  2%  sched_debug.cpu#44.=
nr_switches
   3374319 =C2=B1  3%     -16.8%    2806109 =C2=B1  2%  sched_debug.cpu#44.=
sched_count
   3366509 =C2=B1  3%     -16.6%    2808499 =C2=B1  2%  sched_debug.cpu#44.=
ttwu_count
   3364864 =C2=B1  3%     -17.1%    2788871 =C2=B1  2%  sched_debug.cpu#44.=
ttwu_local
     19.00 =C2=B1 13%     -25.0%      14.25 =C2=B1 12%  sched_debug.cpu#45.=
cpu_load[0]
   3386942 =C2=B1  3%     -16.9%    2816202 =C2=B1  2%  sched_debug.cpu#45.=
nr_switches
   3387927 =C2=B1  3%     -16.8%    2817175 =C2=B1  2%  sched_debug.cpu#45.=
sched_count
   3379784 =C2=B1  4%     -17.1%    2802342 =C2=B1  2%  sched_debug.cpu#45.=
ttwu_count
   3374320 =C2=B1  4%     -17.0%    2799191 =C2=B1  2%  sched_debug.cpu#45.=
ttwu_local
     17.50 =C2=B1  6%     -18.6%      14.25 =C2=B1 13%  sched_debug.cpu#46.=
cpu_load[1]
     14.50 =C2=B1  7%     -19.0%      11.75 =C2=B1 12%  sched_debug.cpu#46.=
cpu_load[4]
   3362941 =C2=B1  3%     -15.9%    2828995 =C2=B1  2%  sched_debug.cpu#46.=
nr_switches
   3363152 =C2=B1  3%     -15.9%    2829614 =C2=B1  2%  sched_debug.cpu#46.=
sched_count
   3365155 =C2=B1  3%     -16.0%    2825366 =C2=B1  2%  sched_debug.cpu#46.=
ttwu_count
   3352628 =C2=B1  3%     -15.8%    2823128 =C2=B1  2%  sched_debug.cpu#46.=
ttwu_local
    182936 =C2=B1  1%      +8.1%     197759 =C2=B1  4%  sched_debug.cpu#47.=
avg_idle
   3411346 =C2=B1  3%     -17.3%    2820818 =C2=B1  1%  sched_debug.cpu#47.=
nr_switches
   3412191 =C2=B1  3%     -17.3%    2821388 =C2=B1  1%  sched_debug.cpu#47.=
sched_count
   3405411 =C2=B1  3%     -17.2%    2819712 =C2=B1  1%  sched_debug.cpu#47.=
ttwu_count
   3403059 =C2=B1  3%     -17.3%    2815610 =C2=B1  1%  sched_debug.cpu#47.=
ttwu_local
   3384910 =C2=B1  2%     -17.8%    2782329 =C2=B1  2%  sched_debug.cpu#48.=
nr_switches
   3385314 =C2=B1  2%     -17.8%    2782524 =C2=B1  2%  sched_debug.cpu#48.=
sched_count
   3372909 =C2=B1  2%     -17.2%    2792501 =C2=B1  2%  sched_debug.cpu#48.=
ttwu_count
   3371515 =C2=B1  2%     -18.1%    2760527 =C2=B1  3%  sched_debug.cpu#48.=
ttwu_local
     20.00 =C2=B1 10%     -25.0%      15.00 =C2=B1 16%  sched_debug.cpu#49.=
cpu_load[3]
     19.75 =C2=B1 16%     -32.9%      13.25 =C2=B1 16%  sched_debug.cpu#49.=
cpu_load[4]
   3361041 =C2=B1  1%     -16.7%    2799376 =C2=B1  1%  sched_debug.cpu#49.=
nr_switches
   3361389 =C2=B1  2%     -16.7%    2799954 =C2=B1  1%  sched_debug.cpu#49.=
sched_count
    803.25 =C2=B1 66%     +81.8%       1460 =C2=B1 12%  sched_debug.cpu#49.=
sched_goidle
   3381487 =C2=B1  2%     -17.5%    2790957 =C2=B1  2%  sched_debug.cpu#49.=
ttwu_count
   3353421 =C2=B1  1%     -16.8%    2788906 =C2=B1  2%  sched_debug.cpu#49.=
ttwu_local
     15.75 =C2=B1  9%     +50.8%      23.75 =C2=B1 35%  sched_debug.cpu#5.c=
pu_load[0]
   3391672 =C2=B1  2%     -17.9%    2785157 =C2=B1  2%  sched_debug.cpu#5.n=
r_switches
   3391868 =C2=B1  2%     -17.9%    2786330 =C2=B1  2%  sched_debug.cpu#5.s=
ched_count
   3383157 =C2=B1  2%     -18.0%    2774308 =C2=B1  2%  sched_debug.cpu#5.t=
twu_count
   3378359 =C2=B1  2%     -18.0%    2771534 =C2=B1  2%  sched_debug.cpu#5.t=
twu_local
   3378831 =C2=B1  2%     -18.2%    2764907 =C2=B1  1%  sched_debug.cpu#50.=
nr_switches
   3379167 =C2=B1  2%     -18.2%    2765068 =C2=B1  1%  sched_debug.cpu#50.=
sched_count
   3381931 =C2=B1  2%     -18.4%    2759976 =C2=B1  2%  sched_debug.cpu#50.=
ttwu_count
   3372100 =C2=B1  2%     -19.0%    2732913 =C2=B1  2%  sched_debug.cpu#50.=
ttwu_local
   3391742 =C2=B1  2%     -17.8%    2787873 =C2=B1  2%  sched_debug.cpu#51.=
nr_switches
   3393991 =C2=B1  3%     -17.9%    2788131 =C2=B1  2%  sched_debug.cpu#51.=
sched_count
   3388915 =C2=B1  2%     -18.0%    2779415 =C2=B1  2%  sched_debug.cpu#51.=
ttwu_count
   3386448 =C2=B1  2%     -18.0%    2776396 =C2=B1  2%  sched_debug.cpu#51.=
ttwu_local
   3353919 =C2=B1  2%     -17.8%    2755852 =C2=B1  2%  sched_debug.cpu#52.=
nr_switches
   3354723 =C2=B1  2%     -17.8%    2756388 =C2=B1  2%  sched_debug.cpu#52.=
sched_count
   3341951 =C2=B1  2%     -18.3%    2731052 =C2=B1  3%  sched_debug.cpu#52.=
ttwu_count
   3337845 =C2=B1  2%     -18.5%    2720797 =C2=B1  3%  sched_debug.cpu#52.=
ttwu_local
   3373578 =C2=B1  3%     -17.1%    2796911 =C2=B1  2%  sched_debug.cpu#53.=
nr_switches
   3375925 =C2=B1  3%     -17.1%    2797166 =C2=B1  2%  sched_debug.cpu#53.=
sched_count
   3383459 =C2=B1  2%     -17.5%    2790891 =C2=B1  2%  sched_debug.cpu#53.=
ttwu_count
   3366616 =C2=B1  3%     -17.3%    2784981 =C2=B1  2%  sched_debug.cpu#53.=
ttwu_local
   3390257 =C2=B1  3%     -17.9%    2782148 =C2=B1  2%  sched_debug.cpu#54.=
nr_switches
   3391465 =C2=B1  3%     -18.0%    2782549 =C2=B1  2%  sched_debug.cpu#54.=
sched_count
   3386304 =C2=B1  3%     -16.9%    2812809 =C2=B1  1%  sched_debug.cpu#54.=
ttwu_count
   3384612 =C2=B1  3%     -18.3%    2766815 =C2=B1  3%  sched_debug.cpu#54.=
ttwu_local
     22.25 =C2=B1 17%     -23.6%      17.00 =C2=B1  7%  sched_debug.cpu#55.=
cpu_load[1]
     21.00 =C2=B1 16%     -21.4%      16.50 =C2=B1  3%  sched_debug.cpu#55.=
cpu_load[2]
     19.75 =C2=B1 13%     -20.3%      15.75 =C2=B1  5%  sched_debug.cpu#55.=
cpu_load[3]
   3374233 =C2=B1  1%     -16.8%    2807090 =C2=B1  1%  sched_debug.cpu#55.=
nr_switches
   3374808 =C2=B1  1%     -16.8%    2807431 =C2=B1  1%  sched_debug.cpu#55.=
sched_count
   3366364 =C2=B1  1%     -17.2%    2786327 =C2=B1  1%  sched_debug.cpu#55.=
ttwu_count
   3362765 =C2=B1  1%     -17.3%    2780406 =C2=B1  1%  sched_debug.cpu#55.=
ttwu_local
   3411822 =C2=B1  2%     -17.6%    2811122 =C2=B1  2%  sched_debug.cpu#56.=
nr_switches
   3412183 =C2=B1  2%     -17.6%    2811594 =C2=B1  2%  sched_debug.cpu#56.=
sched_count
   3407786 =C2=B1  2%     -17.6%    2809656 =C2=B1  2%  sched_debug.cpu#56.=
ttwu_count
   3406197 =C2=B1  2%     -17.7%    2804844 =C2=B1  2%  sched_debug.cpu#56.=
ttwu_local
   3397172 =C2=B1  3%     -17.2%    2811744 =C2=B1  2%  sched_debug.cpu#57.=
nr_switches
   3397605 =C2=B1  3%     -17.2%    2812005 =C2=B1  2%  sched_debug.cpu#57.=
sched_count
   3384695 =C2=B1  3%     -16.6%    2822416 =C2=B1  2%  sched_debug.cpu#57.=
ttwu_count
   3382809 =C2=B1  3%     -17.3%    2798177 =C2=B1  2%  sched_debug.cpu#57.=
ttwu_local
    188353 =C2=B1  1%     +77.7%     334775 =C2=B1 61%  sched_debug.cpu#58.=
avg_idle
   3368337 =C2=B1  3%     -16.7%    2805233 =C2=B1  2%  sched_debug.cpu#58.=
nr_switches
   3368535 =C2=B1  3%     -16.7%    2805585 =C2=B1  2%  sched_debug.cpu#58.=
sched_count
   3360154 =C2=B1  4%     -16.7%    2799389 =C2=B1  2%  sched_debug.cpu#58.=
ttwu_count
   3350965 =C2=B1  4%     -16.5%    2796475 =C2=B1  1%  sched_debug.cpu#58.=
ttwu_local
   3386769 =C2=B1  3%     -17.8%    2784174 =C2=B1  1%  sched_debug.cpu#59.=
nr_switches
   3387003 =C2=B1  3%     -17.8%    2784602 =C2=B1  1%  sched_debug.cpu#59.=
sched_count
   3374107 =C2=B1  3%     -17.4%    2786119 =C2=B1  1%  sched_debug.cpu#59.=
ttwu_count
   3371740 =C2=B1  3%     -17.9%    2767788 =C2=B1  1%  sched_debug.cpu#59.=
ttwu_local
   3404679 =C2=B1  2%     -17.7%    2803402 =C2=B1  2%  sched_debug.cpu#6.n=
r_switches
   3404946 =C2=B1  2%     -17.6%    2804520 =C2=B1  2%  sched_debug.cpu#6.s=
ched_count
   3396778 =C2=B1  2%     -17.7%    2794779 =C2=B1  2%  sched_debug.cpu#6.t=
twu_count
   3395316 =C2=B1  2%     -17.8%    2789570 =C2=B1  2%  sched_debug.cpu#6.t=
twu_local
     20.50 =C2=B1  8%     -24.4%      15.50 =C2=B1  5%  sched_debug.cpu#60.=
cpu_load[0]
   3378881 =C2=B1  3%     -17.1%    2799854 =C2=B1  1%  sched_debug.cpu#60.=
nr_switches
   3379401 =C2=B1  3%     -17.1%    2800303 =C2=B1  1%  sched_debug.cpu#60.=
sched_count
   3370998 =C2=B1  3%     -17.4%    2784997 =C2=B1  2%  sched_debug.cpu#60.=
ttwu_count
   3369479 =C2=B1  3%     -17.4%    2783285 =C2=B1  2%  sched_debug.cpu#60.=
ttwu_local
   3389402 =C2=B1  2%     -18.2%    2771097 =C2=B1  1%  sched_debug.cpu#61.=
nr_switches
      2.75 =C2=B1104%     -72.7%       0.75 =C2=B1110%  sched_debug.cpu#61.=
nr_uninterruptible
   3389770 =C2=B1  2%     -18.2%    2771881 =C2=B1  1%  sched_debug.cpu#61.=
sched_count
    448.25 =C2=B1 43%    +362.6%       2073 =C2=B1 18%  sched_debug.cpu#61.=
sched_goidle
   3382036 =C2=B1  2%     -18.4%    2761058 =C2=B1  3%  sched_debug.cpu#61.=
ttwu_count
   3374996 =C2=B1  2%     -18.8%    2738991 =C2=B1  2%  sched_debug.cpu#61.=
ttwu_local
   3401719 =C2=B1  2%     -17.5%    2806660 =C2=B1  1%  sched_debug.cpu#62.=
nr_switches
   3401992 =C2=B1  2%     -17.5%    2807250 =C2=B1  1%  sched_debug.cpu#62.=
sched_count
   3409442 =C2=B1  3%     -17.8%    2801102 =C2=B1  1%  sched_debug.cpu#62.=
ttwu_count
   3396668 =C2=B1  2%     -17.6%    2799344 =C2=B1  1%  sched_debug.cpu#62.=
ttwu_local
    188622 =C2=B1  1%     +82.6%     344360 =C2=B1 61%  sched_debug.cpu#63.=
avg_idle
   3403259 =C2=B1  1%     -17.7%    2800949 =C2=B1  2%  sched_debug.cpu#63.=
nr_switches
   3403635 =C2=B1  1%     -17.7%    2801160 =C2=B1  2%  sched_debug.cpu#63.=
sched_count
      1502 =C2=B1 36%     -60.9%     587.25 =C2=B1 38%  sched_debug.cpu#63.=
sched_goidle
   3407423 =C2=B1  1%     -18.1%    2792346 =C2=B1  2%  sched_debug.cpu#63.=
ttwu_count
   3394668 =C2=B1  1%     -17.8%    2791028 =C2=B1  2%  sched_debug.cpu#63.=
ttwu_local
   3395141 =C2=B1  2%     -17.1%    2815960 =C2=B1  1%  sched_debug.cpu#7.n=
r_switches
   3395368 =C2=B1  2%     -17.0%    2817099 =C2=B1  1%  sched_debug.cpu#7.s=
ched_count
   3390104 =C2=B1  2%     -16.8%    2819988 =C2=B1  1%  sched_debug.cpu#7.t=
twu_count
   3388220 =C2=B1  2%     -17.2%    2806057 =C2=B1  2%  sched_debug.cpu#7.t=
twu_local
     20.75 =C2=B1 26%     -32.5%      14.00 =C2=B1  8%  sched_debug.cpu#8.c=
pu_load[3]
     19.00 =C2=B1 21%     -35.5%      12.25 =C2=B1 12%  sched_debug.cpu#8.c=
pu_load[4]
   3412535 =C2=B1  3%     -16.9%    2834133 =C2=B1  2%  sched_debug.cpu#8.n=
r_switches
   3414440 =C2=B1  3%     -17.0%    2834516 =C2=B1  2%  sched_debug.cpu#8.s=
ched_count
   3400639 =C2=B1  3%     -16.8%    2828023 =C2=B1  2%  sched_debug.cpu#8.t=
twu_count
   3397501 =C2=B1  3%     -16.9%    2822112 =C2=B1  1%  sched_debug.cpu#8.t=
twu_local
     21.75 =C2=B1 30%     -32.2%      14.75 =C2=B1 10%  sched_debug.cpu#9.c=
pu_load[1]
     20.50 =C2=B1 22%     -26.8%      15.00 =C2=B1 12%  sched_debug.cpu#9.c=
pu_load[2]
   3361173 =C2=B1  2%     -15.8%    2828970 =C2=B1  2%  sched_debug.cpu#9.n=
r_switches
   3363065 =C2=B1  2%     -15.9%    2829633 =C2=B1  2%  sched_debug.cpu#9.s=
ched_count
   3352680 =C2=B1  3%     -15.8%    2822914 =C2=B1  1%  sched_debug.cpu#9.t=
twu_count
   3339358 =C2=B1  2%     -15.6%    2819319 =C2=B1  2%  sched_debug.cpu#9.t=
twu_local


lkp-sbx04: Sandy Bridge-EX
Memory: 64G




          perf-profile.cpu-cycles.sys_connect.entry_SYSCALL_64_fastpath

  33 ++--------------------------------------------------------------------=
-+
     |                                      O   O                          =
 |
  32 ++                              O                                     =
 |
  31 ++                                   O                                =
 |
     |                             O          O                            =
 |
  30 O+  O O O                         O          O                        =
 |
     | O         O     O   O O O O                                         =
 |
  29 ++        O   O O   O                                                 =
 |
     |                                                                     =
 |
  28 ++                                                                    =
 |
  27 ++        *.                                      .*.*                =
 |
     | *.*.*. +  *.                                  .*    +               =
.*
  26 ++      *     *.*.*.*.*.     .*. .*.. .*.*. .*.*       *.*. .*.*.*. .*=
 |
     *                       *.*.*   *    *     *               *       *  =
 |
  25 ++--------------------------------------------------------------------=
-+


   perf-profile.cpu-cycles.SYSC_connect.sys_connect.entry_SYSCALL_64_fastpa=
th

  33 ++--------------------------------------------------------------------=
-+
     |                                          O                          =
 |
  32 ++                              O      O                              =
 |
  31 ++                                   O                                =
 |
     |                             O          O                            =
 |
  30 O+  O O O                         O          O                        =
 |
     | O               O   O O O O                                         =
 |
  29 ++        O O O O   O                                                 =
 |
     |                                                                     =
 |
  28 ++                                                                    =
 |
  27 ++        *.                                      .*.                 =
 |
     | *.*.*. +  *.                                   *   *.               =
.*
  26 ++      *     *.*.*.*.*.      *   *.. .*.*. .*. +      *.*. .*.*.*   *=
 |
     *                       *.   + + +   *     *   *           *      + + =
 |
  25 ++------------------------*-*---*----------------------------------*--=
-+


  perf-profile.cpu-cycles.sock_release.sock_close.__fput.____fput.task_work=
_run

  26 ++-----------------------------------------O--------------------------=
-+
     |                                                                     =
 |
  24 ++                              O    O O                              =
 |
  22 ++                                       O                            =
 |
     |                             O              O                        =
 |
  20 ++                                O                                   =
 |
     |                                                                     =
 |
  18 ++                                                                    =
 |
     |       O                                                             =
 |
  16 O+O O O     O                                                         =
 |
  14 ++        O   O O O O O O O O                                         =
 |
     |                                                                     =
 |
  12 ++                     .*.                                            =
 |
     *.   .*.*. .*.*.*.*.*.*   *.*.*.*.*..*.*.*.*.*.*.*.   .*.*.*.*.*.*.*.*=
.|
  10 ++*-*-----*----------------------------------------*-*----------------=
-*


  perf-profile.cpu-cycles.inet_release.sock_release.sock_close.__fput.____f=
put

  26 ++--------------------------------------------------------------------=
-+
     |                                          O                          =
 |
  24 ++                                   O O                              =
 |
  22 ++                              O        O                            =
 |
     |                             O              O                        =
 |
  20 ++                                O                                   =
 |
     |                                                                     =
 |
  18 ++                                                                    =
 |
     |       O                                                             =
 |
  16 O+O O O     O                                                         =
 |
  14 ++        O   O O O O O O O O                                         =
 |
     |                                                                     =
 |
  12 ++                                                                    =
 |
     *.   .*.*. .*.*.*.*.*.*.*.*.*.*.*.*..*.*.*.*.*.*.*.   .*.*.*.*.*.*.*.*=
.|
  10 ++*-*-----*----------------------------------------*-*----------------=
-*


  perf-profile.cpu-cycles.tcp_close.inet_release.sock_release.sock_close.__=
fput

  26 ++--------------------------------------------------------------------=
-+
     |                                          O                          =
 |
  24 ++                              O    O O                              =
 |
  22 ++                                       O                            =
 |
     |                             O   O          O                        =
 |
  20 ++                                                                    =
 |
  18 ++                                                                    =
 |
     |                                                                     =
 |
  16 O+O O   O                                                             =
 |
  14 ++    O   O O O O O O O O O O                                         =
 |
     |                                                                     =
 |
  12 *+                     .*.*.*. .*.                                    =
 |
  10 ++*.*.*.*.*.*.*.*.*.*.*       *   *..*.*.*.*.*.*.*. .*.*.*.*.*.*.*.*.*=
.*
     |                                                  *                  =
 |
   8 ++--------------------------------------------------------------------=
-+


                              netperf.time.system_time

  15000 ++-----------------------------------------------------------------=
-+
  14800 ++                                   O   O                         =
 |
        |                              O   O                               =
 |
  14600 ++                                     O                           =
 |
  14400 ++                           O             O                       =
 |
        |                                O                                 =
 |
  14200 ++                                                                 =
 |
  14000 ++                                                                 =
 |
  13800 O+O O O O                                                          =
 |
        |         O O O OO O O   O                                         =
 |
  13600 ++                     O   O                                       =
 |
  13400 ++                                                                 =
 |
        |                                                                  =
 |
  13200 *+*.*.*.*.*.*.*.**.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.**.*.*.*.*.*.*.*=
.*
  13000 ++-----------------------------------------------------------------=
-+


                     netperf.time.percent_of_cpu_this_job_got

  5200 ++------------------------------------------------------------------=
-+
       |                                        O                          =
 |
  5100 ++                                   O                              =
 |
       |                               O  O   O                            =
 |
  5000 ++                            O            O                        =
 |
       |                                 O                                 =
 |
  4900 ++                                                                  =
 |
       |       O                                                           =
 |
  4800 O+O O O   O O O   O                                                 =
 |
       |               O   O O O O O                                       =
 |
  4700 ++                                                                  =
 |
       *.                       .*.              .*.                       =
 |
  4600 ++*.*.*.*.*.*.*.*.*.*.*.*   *.*.*.**.*.*.*   *.*.*.*.*.*.*.*.*.*.*.*=
.*
       |                                                                   =
 |
  4500 ++------------------------------------------------------------------=
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

--===============5728114960531608385==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogbmV0cGVyZgpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IGFjdGl2YXRlLW1vbml0
b3IKICBrbXNnOiAKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFz
dGF0OiAKICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAg
cHJvYy1zdGF0OgogICAgaW50ZXJ2YWw6IDEwCiAgbWVtaW5mbzogCiAgc2xhYmluZm86IAogIGlu
dGVycnVwdHM6IAogIGxvY2tfc3RhdDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGlycXM6IAog
IGJkaV9kZXZfbWFwcGluZzogCiAgZGlza3N0YXRzOiAKICBuZnNzdGF0OiAKICBjcHVpZGxlOiAK
ICBjcHVmcmVxLXN0YXRzOiAKICB0dXJib3N0YXQ6IAogIHBtZXRlcjogCiAgc2NoZWRfZGVidWc6
CiAgICBpbnRlcnZhbDogNjAKY3B1ZnJlcV9nb3Zlcm5vcjogcGVyZm9ybWFuY2UKZGVmYXVsdC13
YXRjaGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IDI5MzBiNWIwZGY2
ZGZmZTQ2MjZhYzBhNDFjNDEyOWJkZGZlMjkxNzkKbW9kZWw6IFNhbmR5IEJyaWRnZS1FWApucl9j
cHU6IDY0Cm1lbW9yeTogNjRHCm5yX3NzZF9wYXJ0aXRpb25zOiA0CnNzZF9wYXJ0aXRpb25zOiAi
L2Rldi9kaXNrL2J5LWlkL2F0YS1JTlRFTF9TU0RTQzJDVzI0MEEzX0NWQ1YyMDQzMCotcGFydDEi
CnN3YXBfcGFydGl0aW9uczogCmNhdGVnb3J5OiBiZW5jaG1hcmsKcnVudGltZTogMzAwcwpucl90
aHJlYWRzOiAyMDAlCnBlcmYtcHJvZmlsZToKICBmcmVxOiA4MDAKY2x1c3RlcjogY3MtbG9jYWxo
b3N0CmlmIHJvbGUgc2VydmVyOgogIG5ldHNlcnZlcjogCmlmIHJvbGUgY2xpZW50OgogIG5ldHBl
cmY6CiAgICB0ZXN0OiBUQ1BfQ1JSCnF1ZXVlOiBjeWNsaWMKdGVzdGJveDogbGtwLXNieDA0CnRi
b3hfZ3JvdXA6IGxrcC1zYngwNAprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIw
MTUtMDktMTAgMTI6NDA6MzUuNjM4MTUwMjU0ICswODowMAppZDogMDMzZjQzOWQwODA2ZTQyNWE5
ZjEyMTY5MmQ3YmNjYzljMzYzNmQyZAp1c2VyOiBsa3AKY29tcGlsZXI6IGdjYy00LjkKaGVhZF9j
b21taXQ6IDI5MzBiNWIwZGY2ZGZmZTQ2MjZhYzBhNDFjNDEyOWJkZGZlMjkxNzkKYmFzZV9jb21t
aXQ6IDY0MjkxZjdkYjViZDgxNTBhNzRhZDIwMzZmMTAzN2U2YTA0MjhkZjIKYnJhbmNoOiBsaW51
eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNTA5MTAxNgprZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82
NC1yaGVsL2djYy00LjkvMjkzMGI1YjBkZjZkZmZlNDYyNmFjMGE0MWM0MTI5YmRkZmUyOTE3OS92
bWxpbnV6LTQuMi4wLXdsLWF0aC0wNzE0NS1nMjkzMGI1YiIKcm9vdGZzOiBkZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6Cm5vZGVfcm9sZXM6IHNlcnZlciBjbGllbnQKcmVzdWx0X3Jvb3Q6ICIv
cmVzdWx0L25ldHBlcmYvcGVyZm9ybWFuY2UtMzAwcy0yMDAlLWNzLWxvY2FsaG9zdC1UQ1BfQ1JS
L2xrcC1zYngwNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00
LjkvMjkzMGI1YjBkZjZkZmZlNDYyNmFjMGE0MWM0MTI5YmRkZmUyOTE3OS8wIgpqb2JfZmlsZTog
Ii9sa3Avc2NoZWR1bGVkL2xrcC1zYngwNC9jeWNsaWNfbmV0cGVyZi1wZXJmb3JtYW5jZS0zMDBz
LTIwMCUtY3MtbG9jYWxob3N0LVRDUF9DUlIteDg2XzY0LXJoZWwtQ1lDTElDX0hFQUQtMjkzMGI1
YjBkZjZkZmZlNDYyNmFjMGE0MWM0MTI5YmRkZmUyOTE3OS0yMDE1MDkxMC0yMzA2NC02aTJhdHgt
MC55YW1sIgpkZXF1ZXVlX3RpbWU6IDIwMTUtMDktMTAgMjM6NDY6MjkuMTIyNDMwMDQ1ICswODow
MAptYXhfdXB0aW1lOiAxNTAwCmluaXRyZDogIi9vc2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVyX2FwcGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVz
ZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVkL2xrcC1zYngwNC9jeWNsaWNfbmV0cGVyZi1wZXJm
b3JtYW5jZS0zMDBzLTIwMCUtY3MtbG9jYWxob3N0LVRDUF9DUlIteDg2XzY0LXJoZWwtQ1lDTElD
X0hFQUQtMjkzMGI1YjBkZjZkZmZlNDYyNmFjMGE0MWM0MTI5YmRkZmUyOTE3OS0yMDE1MDkxMC0y
MzA2NC02aTJhdHgtMC55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1yaGVsCi0g
YnJhbmNoPWxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE1MDkxMDE2Ci0gY29tbWl0PTI5MzBi
NWIwZGY2ZGZmZTQ2MjZhYzBhNDFjNDEyOWJkZGZlMjkxNzkKLSBCT09UX0lNQUdFPS9wa2cvbGlu
dXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8yOTMwYjViMGRmNmRmZmU0NjI2YWMwYTQxYzQxMjliZGRm
ZTI5MTc5L3ZtbGludXotNC4yLjAtd2wtYXRoLTA3MTQ1LWcyOTMwYjViCi0gbWF4X3VwdGltZT0x
NTAwCi0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC9uZXRwZXJmL3BlcmZvcm1hbmNlLTMwMHMtMjAwJS1j
cy1sb2NhbGhvc3QtVENQX0NSUi9sa3Atc2J4MDQvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNn
ei94ODZfNjQtcmhlbC9nY2MtNC45LzI5MzBiNWIwZGY2ZGZmZTQ2MjZhYzBhNDFjNDEyOWJkZGZl
MjkxNzkvMAotIExLUF9TRVJWRVI9aW5uCi0gfDItCgoKICBlYXJseXByaW50az10dHlTMCwxMTUy
MDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNf
ZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29m
dGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlz
az0yIHByb21wdF9yYW1kaXNrPTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAg
dmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1v
ZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzI5MzBiNWIwZGY2
ZGZmZTQ2MjZhYzBhNDFjNDEyOWJkZGZlMjkxNzkvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9v
c2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdl
L2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2lt
YWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei90dXJib3N0YXQuY2d6LC9sa3Av
YmVuY2htYXJrcy90dXJib3N0YXQuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnei9uZXRwZXJmLmNneiwvbGtwL2JlbmNobWFya3MvbmV0cGVyZi5jZ3oiCmpvYl9z
dGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogODguNzIgODUuMTMgMzkuODcgMS82NjUgMTEzODUKc3Rh
cnRfdGltZTogJzE0NDE5MDAwMzknCmVuZF90aW1lOiAnMTQ0MTkwMDM0NScKdmVyc2lvbjogIi9s
a3AvbGtwLy5zcmMtMjAxNTA5MTAtMTI0MzE0Igo=

--===============5728114960531608385==
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
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDkvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1MS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU4L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1NTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjAvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2
MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCm5ldHNl
cnZlcgpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJm
IC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIg
LWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAw
IC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAu
MQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10
IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMg
LUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1I
IDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpu
ZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRD
UF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMg
LWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEy
Ny4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRw
ZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9D
UlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwg
MzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4w
LjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJm
IC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIg
LWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAw
IC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAu
MQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10
IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMg
LUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1I
IDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpu
ZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRD
UF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMg
LWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEy
Ny4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRw
ZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9D
UlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwg
MzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4w
LjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJm
IC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIg
LWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAw
IC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAu
MQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10
IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMg
LUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1I
IDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpu
ZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRD
UF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMg
LWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEy
Ny4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRw
ZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9D
UlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwg
MzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4w
LjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJm
IC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIg
LWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAw
IC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAu
MQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10
IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMg
LUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1I
IDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpu
ZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRD
UF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMg
LWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEy
Ny4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRw
ZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9D
UlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwg
MzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4w
LjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJm
IC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIg
LWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAw
IC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAu
MQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10
IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMg
LUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1I
IDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpu
ZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRD
UF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMg
LWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEy
Ny4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRw
ZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9D
UlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwg
MzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4w
LjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJm
IC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIg
LWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAw
IC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAu
MQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10
IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMg
LUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1I
IDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpu
ZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRD
UF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMg
LWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEy
Ny4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRw
ZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9D
UlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwg
MzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4w
LjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJm
IC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIg
LWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAw
IC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAu
MQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10
IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMg
LUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1I
IDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpu
ZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRD
UF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMg
LWwgMzAwIC1IIDEyNy4wLjAuMQpuZXRwZXJmIC10IFRDUF9DUlIgLWMgLUMgLWwgMzAwIC1IIDEy
Ny4wLjAuMQo=

--===============5728114960531608385==--

