Content-Type: multipart/mixed; boundary="===============0811153431719532700=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [sched] d2345b70b2f: -1.1% hackbench.throughput, +58.1% hackbench.time.involuntary_context_switches
Date: Thu, 04 Jun 2015 08:52:37 +0800
Message-ID: <1433379157.7032.40.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0811153431719532700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://bee.sh.intel.com/git/ydu19/tip for-lkp
commit d2345b70b2f9dc2963f417921d8ad53bc2ce0799 ("sched: Rewrite runnable l=
oad and utilization average tracking")


testcase/path_params/tbox_group: hackbench/performance-1600%-process-socket=
/lkp-ne04

53a5dba0cf8766d0  d2345b70b2f9dc2963f417921d  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

     71948 =C2=B1  0%      -1.1%      71183 =C2=B1  0%  hackbench.throughput
  14259643 =C2=B1  9%     +58.1%   22546553 =C2=B1  4%  hackbench.time.invo=
luntary_context_switches
       395 =C2=B1  0%      -3.4%        382 =C2=B1  2%  hackbench.time.user=
_time
 1.106e+08 =C2=B1  1%      +8.4%  1.199e+08 =C2=B1  1%  hackbench.time.volu=
ntary_context_switches
   1715335 =C2=B1  3%     +54.1%    2642893 =C2=B1  6%  proc-vmstat.pgalloc=
_dma32
  14259643 =C2=B1  9%     +58.1%   22546553 =C2=B1  4%  time.involuntary_co=
ntext_switches
    665068 =C2=B1  2%     +14.7%     762941 =C2=B1  2%  softirqs.RCU
      1.64 =C2=B1  1%     +38.5%       2.27 =C2=B1  0%  turbostat.CPU%c1
      0.15 =C2=B1  7%     -44.8%       0.08 =C2=B1  8%  turbostat.CPU%c3
      0.70 =C2=B1  3%     -63.9%       0.25 =C2=B1  9%  turbostat.CPU%c6
         0 =C2=B1  0%      +Inf%          5 =C2=B1 28%  vmstat.procs.b
    203727 =C2=B1  2%     +15.0%     234375 =C2=B1  1%  vmstat.system.cs
     20533 =C2=B1  1%      +5.2%      21598 =C2=B1  1%  vmstat.system.in
   3031995 =C2=B1  4%     +58.4%    4802543 =C2=B1  7%  numa-numastat.node0=
.numa_hit
   3032004 =C2=B1  4%     +58.4%    4802526 =C2=B1  7%  numa-numastat.node0=
.local_node
   7303437 =C2=B1  1%     -26.0%    5402219 =C2=B1  9%  numa-numastat.node1=
.local_node
   7303467 =C2=B1  1%     -26.0%    5402244 =C2=B1  9%  numa-numastat.node1=
.numa_hit
     14612 =C2=B1  2%      +8.4%      15841 =C2=B1  2%  slabinfo.kmalloc-12=
8.active_objs
      6889 =C2=B1  2%     -10.8%       6142 =C2=B1  0%  slabinfo.kmalloc-25=
6.active_slabs
      6889 =C2=B1  2%     -10.8%       6142 =C2=B1  0%  slabinfo.kmalloc-25=
6.num_slabs
    220462 =C2=B1  2%     -10.8%     196565 =C2=B1  0%  slabinfo.kmalloc-25=
6.num_objs
      6927 =C2=B1  2%     -10.7%       6188 =C2=B1  0%  slabinfo.kmalloc-51=
2.num_slabs
    221687 =C2=B1  2%     -10.7%     198053 =C2=B1  0%  slabinfo.kmalloc-51=
2.num_objs
      6927 =C2=B1  2%     -10.7%       6188 =C2=B1  0%  slabinfo.kmalloc-51=
2.active_slabs
    698677 =C2=B1  2%     +68.2%    1175487 =C2=B1  3%  cpuidle.C1-NHM.usage
 1.112e+08 =C2=B1  1%     -27.2%   80921308 =C2=B1  3%  cpuidle.C1-NHM.time
     81180 =C2=B1  4%    +116.7%     175922 =C2=B1  5%  cpuidle.C1E-NHM.usa=
ge
  14459073 =C2=B1  8%    +630.9%  1.057e+08 =C2=B1  4%  cpuidle.C1E-NHM.time
    145745 =C2=B1  1%     -86.2%      20169 =C2=B1 20%  cpuidle.C3-NHM.usage
  20382464 =C2=B1  2%     -32.9%   13670003 =C2=B1  8%  cpuidle.C3-NHM.time
  99811142 =C2=B1  1%     -44.5%   55397968 =C2=B1  6%  cpuidle.C6-NHM.time
     34051 =C2=B1  3%     -27.3%      24753 =C2=B1  6%  cpuidle.C6-NHM.usage
       197 =C2=B1  4%    +157.6%        507 =C2=B1  7%  cpuidle.POLL.usage
      1260 =C2=B1  0%     +59.7%       2012 =C2=B1 20%  numa-vmstat.node0.n=
r_mapped
   1707663 =C2=B1  6%     +42.8%    2438291 =C2=B1  8%  numa-vmstat.node0.n=
uma_hit
       501 =C2=B1 41%    +760.9%       4319 =C2=B1 12%  numa-vmstat.node0.n=
r_kernel_stack
     26088 =C2=B1  4%     +78.6%      46595 =C2=B1  7%  numa-vmstat.node0.n=
r_slab_unreclaimable
     28873 =C2=B1  4%     +32.6%      38294 =C2=B1  5%  numa-vmstat.node0.n=
r_anon_pages
     16980 =C2=B1  5%     +79.5%      30480 =C2=B1  8%  numa-vmstat.node0.n=
r_page_table_pages
     30952 =C2=B1  4%     +27.2%      39380 =C2=B1  6%  numa-vmstat.node0.n=
r_active_anon
   1646861 =C2=B1  6%     +45.2%    2391626 =C2=B1  9%  numa-vmstat.node0.n=
uma_local
   3867845 =C2=B1  2%     -22.1%    3012126 =C2=B1  5%  numa-vmstat.node1.n=
uma_hit
     53281 =C2=B1  2%     -18.1%      43650 =C2=B1  7%  numa-vmstat.node1.n=
r_active_anon
      8376 =C2=B1  3%     -44.0%       4691 =C2=B1 12%  numa-vmstat.node1.n=
r_kernel_stack
     51202 =C2=B1  2%     -20.7%      40600 =C2=B1  8%  numa-vmstat.node1.n=
r_anon_pages
   3862823 =C2=B1  2%     -22.5%    2992841 =C2=B1  5%  numa-vmstat.node1.n=
uma_local
     48137 =C2=B1  2%     -31.4%      32998 =C2=B1 10%  numa-vmstat.node1.n=
r_page_table_pages
     71449 =C2=B1  2%     -32.8%      48007 =C2=B1  7%  numa-vmstat.node1.n=
r_slab_unreclaimable
      6534 =C2=B1  6%     -13.3%       5663 =C2=B1  3%  numa-vmstat.node1.n=
r_slab_reclaimable
    123850 =C2=B1  3%     +27.9%     158364 =C2=B1  7%  numa-meminfo.node0.=
Active(anon)
      8359 =C2=B1 42%    +732.7%      69614 =C2=B1 15%  numa-meminfo.node0.=
KernelStack
      5060 =C2=B1  0%     +59.0%       8047 =C2=B1 20%  numa-meminfo.node0.=
Mapped
    103613 =C2=B1  5%     +80.7%     187188 =C2=B1  8%  numa-meminfo.node0.=
SUnreclaim
    115570 =C2=B1  5%     +33.3%     154023 =C2=B1  7%  numa-meminfo.node0.=
AnonPages
    170936 =C2=B1  3%     +21.5%     207698 =C2=B1  5%  numa-meminfo.node0.=
Active
     68046 =C2=B1  6%     +80.0%     122507 =C2=B1 10%  numa-meminfo.node0.=
PageTables
    597746 =C2=B1  2%     +53.8%     919321 =C2=B1  6%  numa-meminfo.node0.=
MemUsed
    121251 =C2=B1  4%     +71.7%     208224 =C2=B1  7%  numa-meminfo.node0.=
Slab
     26084 =C2=B1  6%     -13.1%      22655 =C2=B1  4%  numa-meminfo.node1.=
SReclaimable
    133675 =C2=B1  2%     -43.4%      75633 =C2=B1 12%  numa-meminfo.node1.=
KernelStack
    205113 =C2=B1  1%     -20.6%     162848 =C2=B1  7%  numa-meminfo.node1.=
AnonPages
    192341 =C2=B1  1%     -31.1%     132448 =C2=B1 11%  numa-meminfo.node1.=
PageTables
    310539 =C2=B1  1%     -30.8%     215008 =C2=B1  7%  numa-meminfo.node1.=
Slab
    262277 =C2=B1  3%     -15.3%     222255 =C2=B1  5%  numa-meminfo.node1.=
Active
    284455 =C2=B1  1%     -32.4%     192352 =C2=B1  7%  numa-meminfo.node1.=
SUnreclaim
   1286365 =C2=B1  0%     -26.1%     950143 =C2=B1  6%  numa-meminfo.node1.=
MemUsed
    213339 =C2=B1  3%     -18.0%     175024 =C2=B1  7%  numa-meminfo.node1.=
Active(anon)
        32 =C2=B1 34%    +123.1%         72 =C2=B1 17%  latency_stats.avg.w=
ait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.hand=
le_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
       560 =C2=B1  2%     -11.2%        497 =C2=B1  1%  latency_stats.avg.d=
o_wait.SyS_wait4.system_call_fastpath
      2347 =C2=B1  0%      +2.7%       2411 =C2=B1  0%  latency_stats.avg.p=
oll_schedule_timeout.do_sys_poll.SyS_poll.system_call_fastpath
       227 =C2=B1  2%     -13.0%        197 =C2=B1  5%  latency_stats.avg.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
       232 =C2=B1 14%     -34.5%        152 =C2=B1  3%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.may_open
      2022 =C2=B1  3%     -24.2%       1534 =C2=B1  3%  latency_stats.avg.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
       277 =C2=B1 30%    +290.6%       1084 =C2=B1 14%  latency_stats.avg.e=
p_poll.SyS_epoll_wait.system_call_fastpath
     44572 =C2=B1 35%    +604.9%     314192 =C2=B1 12%  latency_stats.avg.w=
ait_on_page_bit.__migration_entry_wait.migration_entry_wait.handle_pte_faul=
t.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
       503 =C2=B1  0%      -7.5%        465 =C2=B1  1%  latency_stats.avg.u=
nix_stream_recvmsg.sock_recvmsg.sock_read_iter.__vfs_read.vfs_read.SyS_read=
.system_call_fastpath
      1837 =C2=B1  0%      +3.4%       1899 =C2=B1  0%  latency_stats.avg.s=
ock_alloc_send_pskb.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.__vfs_=
write.vfs_write.SyS_write.system_call_fastpath
      2418 =C2=B1 47%    +442.6%      13123 =C2=B1 15%  latency_stats.hits.=
wait_on_page_bit.__migration_entry_wait.migration_entry_wait.handle_pte_fau=
lt.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
        12 =C2=B1 18%     +75.5%         21 =C2=B1 42%  latency_stats.hits.=
call_rwsem_down_read_failed.page_lock_anon_vma_read.rmap_walk.try_to_unmap.=
migrate_pages.migrate_misplaced_page.handle_pte_fault.handle_mm_fault.__do_=
page_fault.do_page_fault.page_fault
        16 =C2=B1 17%    +104.5%         33 =C2=B1 13%  latency_stats.hits.=
call_rwsem_down_read_failed.rmap_walk.remove_migration_ptes.migrate_pages.m=
igrate_misplaced_page.handle_pte_fault.handle_mm_fault.__do_page_fault.do_p=
age_fault.page_fault
       852 =C2=B1  5%     -27.3%        619 =C2=B1 22%  latency_stats.hits.=
wait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.han=
dle_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
  67862917 =C2=B1  2%     +17.9%   80007991 =C2=B1  2%  latency_stats.hits.=
unix_stream_recvmsg.sock_recvmsg.sock_read_iter.__vfs_read.vfs_read.SyS_rea=
d.system_call_fastpath
         1 =C2=B1 33%    -100.0%          0 =C2=B1  0%  latency_stats.hits.=
stop_one_cpu.sched_exec.do_execveat_common.SyS_execve.return_from_execve
    225174 =C2=B1 45%    +567.0%    1501845 =C2=B1 10%  latency_stats.max.w=
ait_on_page_bit.__migration_entry_wait.migration_entry_wait.handle_pte_faul=
t.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      2561 =C2=B1  4%     -17.7%       2108 =C2=B1  6%  latency_stats.max.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
      3368 =C2=B1 30%     +36.2%       4587 =C2=B1  3%  latency_stats.max.w=
ait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
   1100786 =C2=B1  3%     -15.7%     927862 =C2=B1  5%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
     20232 =C2=B1  3%     -24.2%      15345 =C2=B1  3%  latency_stats.sum.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
 3.416e+10 =C2=B1  1%      +9.1%  3.727e+10 =C2=B1  1%  latency_stats.sum.u=
nix_stream_recvmsg.sock_recvmsg.sock_read_iter.__vfs_read.vfs_read.SyS_read=
.system_call_fastpath
      7891 =C2=B1 30%    +256.1%      28099 =C2=B1 33%  latency_stats.sum.e=
p_poll.SyS_epoll_wait.system_call_fastpath
      6761 =C2=B1 14%     -32.8%       4544 =C2=B1  4%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.may_open
   1726737 =C2=B1  3%     -15.8%    1454425 =C2=B1  6%  latency_stats.sum.d=
o_wait.SyS_wait4.system_call_fastpath
 3.183e+10 =C2=B1  0%      -3.9%   3.06e+10 =C2=B1  2%  latency_stats.sum.s=
ock_alloc_send_pskb.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.__vfs_=
write.vfs_write.SyS_write.system_call_fastpath
      2.00 =C2=B1 18%     +69.8%       3.40 =C2=B1 13%  perf-profile.cpu-cy=
cles.enqueue_entity.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_ac=
tivate
      8.90 =C2=B1 11%     +20.8%      10.75 =C2=B1  1%  perf-profile.cpu-cy=
cles.sock_alloc_send_pskb.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.=
__vfs_write
      0.84 =C2=B1 15%     -60.6%       0.33 =C2=B1 49%  perf-profile.cpu-cy=
cles.__kmalloc_node_track_caller.__kmalloc_reserve.__alloc_skb.alloc_skb_wi=
th_frags.sock_alloc_send_pskb
     10.41 =C2=B1 14%     -50.8%       5.12 =C2=B1 45%  perf-profile.cpu-cy=
cles.__vfs_write.vfs_write.sys_write.system_call_fastpath.__write_nocancel
      0.97 =C2=B1 14%     -59.4%       0.39 =C2=B1 49%  perf-profile.cpu-cy=
cles.__kmalloc_reserve.isra.27.__alloc_skb.alloc_skb_with_frags.sock_alloc_=
send_pskb.unix_stream_sendmsg
     30.18 =C2=B1  4%     +15.3%      34.81 =C2=B1  3%  perf-profile.cpu-cy=
cles.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.__vfs_write.vfs_write
     33.61 =C2=B1  4%     +11.9%      37.61 =C2=B1  4%  perf-profile.cpu-cy=
cles.sock_sendmsg.sock_write_iter.__vfs_write.vfs_write.sys_write
      2.10 =C2=B1 17%     +74.2%       3.67 =C2=B1 13%  perf-profile.cpu-cy=
cles.ttwu_do_activate.constprop.85.try_to_wake_up.default_wake_function.aut=
oremove_wake_function.__wake_up_common
      1.37 =C2=B1 14%     +76.1%       2.42 =C2=B1 13%  perf-profile.cpu-cy=
cles.print_context_stack.dump_trace.save_stack_trace_tsk.__account_schedule=
r_latency.enqueue_entity
      3.30 =C2=B1 11%     +49.2%       4.93 =C2=B1 11%  perf-profile.cpu-cy=
cles.sock_def_readable.unix_stream_sendmsg.sock_sendmsg.sock_write_iter.__v=
fs_write
      2.58 =C2=B1  8%     -37.9%       1.60 =C2=B1 27%  perf-profile.cpu-cy=
cles.skb_copy_datagram_iter.unix_stream_recvmsg.sock_recvmsg.sock_read_iter=
.__vfs_read
      2.01 =C2=B1 17%     +72.6%       3.47 =C2=B1 14%  perf-profile.cpu-cy=
cles.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate.try_to_w=
ake_up
      2.05 =C2=B1 17%     +73.0%       3.55 =C2=B1 14%  perf-profile.cpu-cy=
cles.activate_task.ttwu_do_activate.try_to_wake_up.default_wake_function.au=
toremove_wake_function
      2.54 =C2=B1 12%     +69.8%       4.30 =C2=B1 11%  perf-profile.cpu-cy=
cles.__wake_up_common.__wake_up_sync_key.sock_def_readable.unix_stream_send=
msg.sock_sendmsg
      0.69 =C2=B1 12%     +77.1%       1.22 =C2=B1 15%  perf-profile.cpu-cy=
cles.__kernel_text_address.print_context_stack.dump_trace.save_stack_trace_=
tsk.__account_scheduler_latency
      2.47 =C2=B1 12%     +71.7%       4.25 =C2=B1 11%  perf-profile.cpu-cy=
cles.default_wake_function.autoremove_wake_function.__wake_up_common.__wake=
_up_sync_key.sock_def_readable
      5.02 =C2=B1  3%     -16.2%       4.21 =C2=B1  9%  perf-profile.cpu-cy=
cles.skb_release_all.consume_skb.unix_stream_recvmsg.sock_recvmsg.sock_read=
_iter
      1.57 =C2=B1 17%     +76.6%       2.78 =C2=B1 14%  perf-profile.cpu-cy=
cles.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entity.enqueu=
e_task_fair.enqueue_task
      2.48 =C2=B1 12%     +72.0%       4.26 =C2=B1 11%  perf-profile.cpu-cy=
cles.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.sock_def_=
readable.unix_stream_sendmsg
      1.57 =C2=B1 17%     +76.5%       2.76 =C2=B1 14%  perf-profile.cpu-cy=
cles.dump_trace.save_stack_trace_tsk.__account_scheduler_latency.enqueue_en=
tity.enqueue_task_fair
      2.72 =C2=B1 13%     +67.1%       4.55 =C2=B1 11%  perf-profile.cpu-cy=
cles.try_to_wake_up.default_wake_function.autoremove_wake_function.__wake_u=
p_common.__wake_up_sync_key
     35.38 =C2=B1  4%     +10.0%      38.92 =C2=B1  3%  perf-profile.cpu-cy=
cles.sock_write_iter.__vfs_write.vfs_write.sys_write.system_call_fastpath
      2.06 =C2=B1 17%     +71.5%       3.53 =C2=B1 14%  perf-profile.cpu-cy=
cles.enqueue_task.activate_task.ttwu_do_activate.try_to_wake_up.default_wak=
e_function
      1.74 =C2=B1 19%     +74.1%       3.03 =C2=B1 14%  perf-profile.cpu-cy=
cles.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.enqueue_t=
ask.activate_task
      2.83 =C2=B1 11%     +60.8%       4.55 =C2=B1 10%  perf-profile.cpu-cy=
cles.__wake_up_sync_key.sock_def_readable.unix_stream_sendmsg.sock_sendmsg.=
sock_write_iter
        56 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
      7860 =C2=B1 20%     -87.7%        965 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
        62 =C2=B1 10%     -13.9%         54 =C2=B1  1%  sched_debug.cfs_rq[=
0]:/.load
       549 =C2=B1 19%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.utilization_load_avg
       225 =C2=B1 13%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.utilization_load_avg
     41338 =C2=B1 12%     -97.5%       1022 =C2=B1  3%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
        54 =C2=B1 19%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.runnable_load_avg
      3762 =C2=B1 27%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
      3703 =C2=B1 28%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.blocked_load_avg
        42 =C2=B1 17%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.runnable_load_avg
     39600 =C2=B1  6%     -97.4%       1019 =C2=B1  3%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
      2197 =C2=B1 17%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.tg_load_contrib
      2151 =C2=B1 17%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.blocked_load_avg
       322 =C2=B1 26%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.utilization_load_avg
        68 =C2=B1 16%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.runnable_load_avg
     39471 =C2=B1  5%     -97.4%       1018 =C2=B1  4%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
         3 =C2=B1 24%    +107.1%          7 =C2=B1 32%  sched_debug.cfs_rq[=
12]:/.nr_spread_over
      3093 =C2=B1 22%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.tg_load_contrib
       382 =C2=B1 21%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.utilization_load_avg
      3024 =C2=B1 22%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.blocked_load_avg
        48 =C2=B1 27%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.runnable_load_avg
      2946 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.tg_load_contrib
       374 =C2=B1 16%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.utilization_load_avg
     38273 =C2=B1 10%     -97.3%       1023 =C2=B1  4%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
      2897 =C2=B1 31%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.blocked_load_avg
     38999 =C2=B1  8%     -97.4%       1033 =C2=B1  3%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
      1763 =C2=B1 39%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.blocked_load_avg
        71 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.runnable_load_avg
       355 =C2=B1 27%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.utilization_load_avg
      1832 =C2=B1 38%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.tg_load_contrib
      2372 =C2=B1 46%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.tg_load_contrib
        46 =C2=B1 14%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.runnable_load_avg
      2315 =C2=B1 48%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.blocked_load_avg
     37699 =C2=B1  9%     -97.3%       1035 =C2=B1  4%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
       344 =C2=B1 21%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.utilization_load_avg
     10747 =C2=B1 18%     -91.0%        966 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
        52 =C2=B1  2%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
       704 =C2=B1 40%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.utilization_load_avg
   5093773 =C2=B1  4%      -9.6%    4606679 =C2=B1  4%  sched_debug.cfs_rq[=
1]:/.min_vruntime
      1401 =C2=B1 47%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.blocked_load_avg
      1460 =C2=B1 45%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
     22584 =C2=B1 33%     -95.7%        974 =C2=B1  3%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
        59 =C2=B1  5%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
      1484 =C2=B1 41%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
      1536 =C2=B1 40%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
       644 =C2=B1 35%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.utilization_load_avg
   5279976 =C2=B1  3%     -10.8%    4708651 =C2=B1  2%  sched_debug.cfs_rq[=
3]:/.min_vruntime
        52 =C2=B1 10%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
     30501 =C2=B1  8%     -96.8%        981 =C2=B1  3%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
      1967 =C2=B1 42%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
       295 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.utilization_load_avg
      1871 =C2=B1 42%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
        57 =C2=B1 17%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.runnable_load_avg
     31557 =C2=B1  5%     -96.9%        984 =C2=B1  3%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
        54 =C2=B1 21%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.runnable_load_avg
        14 =C2=B1 27%     +64.9%         23 =C2=B1 32%  sched_debug.cfs_rq[=
5]:/.nr_spread_over
       456 =C2=B1 16%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.utilization_load_avg
     35890 =C2=B1  9%     -97.2%       1018 =C2=B1  2%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
      3902 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
      3815 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.blocked_load_avg
       360 =C2=B1 17%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.utilization_load_avg
        60 =C2=B1 17%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
      1601 =C2=B1 41%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
     36619 =C2=B1 13%     -97.2%       1010 =C2=B1  3%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
      1541 =C2=B1 43%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
        47 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
        16 =C2=B1 30%    +116.7%         35 =C2=B1 33%  sched_debug.cfs_rq[=
7]:/.nr_spread_over
     38064 =C2=B1 13%     -97.3%       1022 =C2=B1  4%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
      1765 =C2=B1 39%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.blocked_load_avg
      1813 =C2=B1 38%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
   5414683 =C2=B1  2%      -8.5%    4953680 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.min_vruntime
       326 =C2=B1 39%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.utilization_load_avg
       361 =C2=B1 38%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.utilization_load_avg
      2114 =C2=B1 42%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
        61 =C2=B1 12%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.runnable_load_avg
     38503 =C2=B1 12%     -97.3%       1022 =C2=B1  4%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
      2052 =C2=B1 43%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.blocked_load_avg
   5301883 =C2=B1  6%     -12.3%    4647905 =C2=B1  2%  sched_debug.cfs_rq[=
9]:/.min_vruntime
      2170 =C2=B1 22%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.tg_load_contrib
        54 =C2=B1  9%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.runnable_load_avg
      2115 =C2=B1 23%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.blocked_load_avg
       370 =C2=B1 41%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.utilization_load_avg
     40533 =C2=B1 12%     -97.5%       1013 =C2=B1  3%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
   3429160 =C2=B1  4%     +12.4%    3852887 =C2=B1  4%  sched_debug.cpu#0.n=
r_switches
   3460339 =C2=B1  3%     +11.5%    3859077 =C2=B1  4%  sched_debug.cpu#0.s=
ched_count
   3255972 =C2=B1  1%     +19.9%    3904059 =C2=B1  3%  sched_debug.cpu#1.n=
r_switches
   2972896 =C2=B1  1%     +12.1%    3331611 =C2=B1  1%  sched_debug.cpu#1.t=
twu_count
    955576 =C2=B1  8%     -24.1%     724961 =C2=B1 17%  sched_debug.cpu#1.a=
vg_idle
   1123082 =C2=B1 12%     -55.5%     500000 =C2=B1  0%  sched_debug.cpu#1.m=
ax_idle_balance_cost
     18121 =C2=B1 12%     +95.1%      35352 =C2=B1  7%  sched_debug.cpu#1.s=
ched_goidle
   3299562 =C2=B1  1%     +19.8%    3953430 =C2=B1  2%  sched_debug.cpu#1.s=
ched_count
     32042 =C2=B1 18%     +29.4%      41467 =C2=B1 10%  sched_debug.cpu#10.=
sched_goidle
   3626516 =C2=B1  3%     +22.6%    4446037 =C2=B1  2%  sched_debug.cpu#11.=
sched_count
     18988 =C2=B1 12%     +95.7%      37163 =C2=B1 20%  sched_debug.cpu#11.=
sched_goidle
    891501 =C2=B1 14%     -43.9%     500000 =C2=B1  0%  sched_debug.cpu#11.=
max_idle_balance_cost
   3590230 =C2=B1  3%     +23.6%    4436784 =C2=B1  2%  sched_debug.cpu#11.=
nr_switches
   3067383 =C2=B1  2%     +17.8%    3614738 =C2=B1  2%  sched_debug.cpu#11.=
ttwu_count
   2718845 =C2=B1  2%     +13.2%    3076775 =C2=B1  1%  sched_debug.cpu#11.=
ttwu_local
   3058328 =C2=B1  2%     +17.8%    3602585 =C2=B1  2%  sched_debug.cpu#13.=
ttwu_count
   3565846 =C2=B1  4%     +25.6%    4478570 =C2=B1  3%  sched_debug.cpu#13.=
sched_count
   3541852 =C2=B1  4%     +24.3%    4403611 =C2=B1  4%  sched_debug.cpu#13.=
nr_switches
    916506 =C2=B1 21%     -45.4%     500000 =C2=B1  0%  sched_debug.cpu#13.=
max_idle_balance_cost
     20844 =C2=B1 13%    +106.7%      43081 =C2=B1 21%  sched_debug.cpu#13.=
sched_goidle
   3533050 =C2=B1  2%     +26.3%    4461776 =C2=B1  1%  sched_debug.cpu#15.=
sched_count
     23322 =C2=B1 20%     +80.3%      42054 =C2=B1 17%  sched_debug.cpu#15.=
sched_goidle
   2673770 =C2=B1  2%     +12.2%    3000835 =C2=B1  1%  sched_debug.cpu#15.=
ttwu_local
   3042506 =C2=B1  2%     +16.0%    3530112 =C2=B1  1%  sched_debug.cpu#15.=
ttwu_count
    997258 =C2=B1 20%     -49.9%     500000 =C2=B1  0%  sched_debug.cpu#15.=
max_idle_balance_cost
   3529886 =C2=B1  2%     +23.5%    4360892 =C2=B1  1%  sched_debug.cpu#15.=
nr_switches
        14 =C2=B1 14%     -24.1%         11 =C2=B1 11%  sched_debug.cpu#15.=
nr_running
   3586920 =C2=B1  3%      +9.1%    3914639 =C2=B1  4%  sched_debug.cpu#2.n=
r_switches
   1111366 =C2=B1 23%     -32.2%     753103 =C2=B1 14%  sched_debug.cpu#3.a=
vg_idle
   2650771 =C2=B1  1%      +9.8%    2909625 =C2=B1  2%  sched_debug.cpu#3.t=
twu_local
   3498894 =C2=B1  1%     +20.0%    4197900 =C2=B1  2%  sched_debug.cpu#3.s=
ched_count
   3459439 =C2=B1  1%     +20.8%    4177304 =C2=B1  3%  sched_debug.cpu#3.n=
r_switches
    929880 =C2=B1 23%     -46.2%     500000 =C2=B1  0%  sched_debug.cpu#3.m=
ax_idle_balance_cost
   3043439 =C2=B1  1%     +14.8%    3492383 =C2=B1  3%  sched_debug.cpu#3.t=
twu_count
     21837 =C2=B1 15%     +80.9%      39499 =C2=B1 16%  sched_debug.cpu#3.s=
ched_goidle
   3174785 =C2=B1  2%      +8.2%    3434347 =C2=B1  2%  sched_debug.cpu#4.t=
twu_count
   3453169 =C2=B1  3%     +23.9%    4277320 =C2=B1  3%  sched_debug.cpu#5.n=
r_switches
    981248 =C2=B1 26%     -49.0%     500000 =C2=B1  0%  sched_debug.cpu#5.m=
ax_idle_balance_cost
        47 =C2=B1  2%     +14.7%         54 =C2=B1  7%  sched_debug.cpu#5.c=
pu_load[0]
   3472968 =C2=B1  3%     +23.6%    4291182 =C2=B1  3%  sched_debug.cpu#5.s=
ched_count
   3065614 =C2=B1  2%     +12.3%    3441364 =C2=B1  2%  sched_debug.cpu#5.t=
twu_count
   2667436 =C2=B1  1%      +9.8%    2930164 =C2=B1  3%  sched_debug.cpu#5.t=
twu_local
   1242788 =C2=B1 18%     -47.8%     648516 =C2=B1 19%  sched_debug.cpu#5.a=
vg_idle
     20042 =C2=B1 13%    +134.9%      47081 =C2=B1 14%  sched_debug.cpu#5.s=
ched_goidle
   3654050 =C2=B1  3%     +11.7%    4081164 =C2=B1  5%  sched_debug.cpu#6.s=
ched_count
   3635987 =C2=B1  3%     +12.1%    4076422 =C2=B1  5%  sched_debug.cpu#6.n=
r_switches
     21598 =C2=B1  6%     +77.9%      38426 =C2=B1 19%  sched_debug.cpu#7.s=
ched_goidle
   3477232 =C2=B1  4%     +21.8%    4234219 =C2=B1  2%  sched_debug.cpu#7.n=
r_switches
        48 =C2=B1 10%     +22.3%         59 =C2=B1  5%  sched_debug.cpu#7.c=
pu_load[2]
        48 =C2=B1 10%     +22.3%         59 =C2=B1  8%  sched_debug.cpu#7.c=
pu_load[1]
   3048037 =C2=B1  2%     +17.9%    3594543 =C2=B1  2%  sched_debug.cpu#7.t=
twu_count
   2644522 =C2=B1  1%     +11.4%    2946167 =C2=B1  1%  sched_debug.cpu#7.t=
twu_local
        47 =C2=B1  9%     +22.1%         58 =C2=B1 11%  sched_debug.cpu#7.c=
pu_load[0]
   3487732 =C2=B1  4%     +25.4%    4373083 =C2=B1  3%  sched_debug.cpu#7.s=
ched_count
        47 =C2=B1  7%     +22.0%         58 =C2=B1  3%  sched_debug.cpu#7.c=
pu_load[4]
    925614 =C2=B1  7%     -46.0%     500000 =C2=B1  0%  sched_debug.cpu#7.m=
ax_idle_balance_cost
        47 =C2=B1  9%     +22.6%         58 =C2=B1  4%  sched_debug.cpu#7.c=
pu_load[3]
   3063652 =C2=B1  0%     +12.6%    3450027 =C2=B1  3%  sched_debug.cpu#9.t=
twu_count
   3476055 =C2=B1  4%     +21.0%    4207345 =C2=B1  3%  sched_debug.cpu#9.s=
ched_count
     21060 =C2=B1  2%     -13.0%      18322 =C2=B1  2%  sched_debug.cpu#9.c=
urr->pid
     16048 =C2=B1 12%    +145.6%      39415 =C2=B1 13%  sched_debug.cpu#9.s=
ched_goidle
    827315 =C2=B1 15%     -39.6%     500000 =C2=B1  0%  sched_debug.cpu#9.m=
ax_idle_balance_cost
   2672155 =C2=B1  0%     +12.1%    2994475 =C2=B1  2%  sched_debug.cpu#9.t=
twu_local
   1206528 =C2=B1 23%     -44.8%     666329 =C2=B1 11%  sched_debug.cpu#9.a=
vg_idle
   3423880 =C2=B1  4%     +22.8%    4206112 =C2=B1  3%  sched_debug.cpu#9.n=
r_switches

lkp-ne04: Nehalem-EP
Memory: 12G




                      hackbench.time.involuntary_context_switches

  2.4e+07 O+--O-----------O----------O-------------------------------------=
-+
          |       O   O          O                                         =
 |
  2.2e+07 ++                             O                                 =
 |
          |                  O                                             =
 |
    2e+07 ++                                                               =
 |
          |                                                                =
 |
  1.8e+07 ++                                                               =
 |
          |                                          *..                   =
 |
  1.6e+07 ++                                        +   .      .*.         =
 |
          |                         .*...*...      +     *.. ..   ..   .*..=
 |
  1.4e+07 ++                 *... ..         *... +         *        ..    =
.|
          *.                :    *               *                  *      =
 *
  1.2e+07 ++..              :                                              =
 |
          |     ..*...*... :                                               =
 |
    1e+07 ++--*-----------*------------------------------------------------=
-+




  4000 ++------------------------------------------------------------------=
-+
       O   O   O   O   O   O   O   O   O                                   =
 |
  3500 ++                                                                  =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2500 ++                                                                  =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1500 ++                                                                  =
 |
  1000 ++                                                           *.     =
 |
       |                                                           +  ..   =
 |
   500 ++                                                         +        =
 |
       |                                                         +      *..=
.|
     0 *+--*---*---*---*---*---*---*---*----*---*---*---*---*---*----------=
-*


                                cpuidle.POLL.usage

  600 ++-------------------------------------------------------------------=
-+
      |                                O                                   =
 |
  550 ++                           O                                       =
 |
  500 ++                   O                                               =
 |
      |                        O                                           =
 |
  450 ++  O                                                                =
 |
  400 O+      O   O   O                                                    =
 |
      |                                                                    =
 |
  350 ++                                                                   =
 |
  300 ++                                                                   =
 |
      |                                                                    =
 |
  250 ++                                 ..*..                             =
 |
  200 *+.                ..*...*..    .*.     .            .*...  ..*...*..=
.|
      |  .      ..*...*..         . ..         *...*...  ..     *.         =
 *
  150 ++--*---*--------------------*-------------------*-------------------=
-+


                                 cpuidle.C1-NHM.usage

  1.3e+06 ++---------------------------------------------------------------=
-+
          |                              O                                 =
 |
  1.2e+06 ++          O      O                                             =
 |
          O   O           O      O   O                                     =
 |
  1.1e+06 ++      O                                                        =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   900000 ++                                                               =
 |
          |                                                                =
 |
   800000 ++                                                               =
 |
   700000 *+..*...*...          .*..        .*...          .*...*...*...   =
 |
          |           *...*.. ..    .     ..     *...*...*.             *..=
.*
   600000 ++                 *       *...*                                 =
 |
          |                                                                =
 |
   500000 ++---------------------------------------------------------------=
-+


                                 cpuidle.C1E-NHM.time

  1.2e+08 ++---------------------------------------------------------------=
-+
  1.1e+08 ++                         O                                     =
 |
          O   O   O   O   O  O   O                                         =
 |
    1e+08 ++                             O                                 =
 |
    9e+07 ++                                                               =
 |
    8e+07 ++                                                               =
 |
    7e+07 ++                                                               =
 |
          |                                                                =
 |
    6e+07 ++                                                               =
 |
    5e+07 ++                                                               =
 |
    4e+07 ++                                                               =
 |
    3e+07 ++                                                               =
 |
          |                                                                =
 |
    2e+07 *+..*...*...*...*..*...          ..*...  ..*...*..  ..*...*...*..=
.|
    1e+07 ++---------------------*---*---*-------*----------*--------------=
-*


                                cpuidle.C1E-NHM.usage

  200000 ++------O---------------------------------------------------------=
-+
         |   O           O           O                                     =
 |
  180000 O+                  O                                             =
 |
         |           O           O                                         =
 |
  160000 ++                              O                                 =
 |
         |                                                                 =
 |
  140000 ++                                                                =
 |
         |                                                                 =
 |
  120000 ++                                                                =
 |
         |                                                                 =
 |
  100000 ++            ..*..                                               =
 |
         |         ..*.     .                                              =
 |
   80000 ++..*...*.          *...*...      .*...  ..*...*...*...*...*...*..=
.*
         *.                          *...*.     *.                         =
 |
   60000 ++----------------------------------------------------------------=
-+


                                cpuidle.C3-NHM.usage

  160000 ++----------------------------------------------------------------=
-+
         *...*...*...*...*...                     ..*...  ..*...*...*...*..=
.|
  140000 ++                  *...*...*...*..*...*.      *.                 =
 *
  120000 ++                                                                =
 |
         |                                                                 =
 |
  100000 ++                                                                =
 |
         |                                                                 =
 |
   80000 ++                                                                =
 |
         |                                                                 =
 |
   60000 ++                                                                =
 |
   40000 ++                                                                =
 |
         |                                                                 =
 |
   20000 O+  O   O   O   O       O   O   O                                 =
 |
         |                   O                                             =
 |
       0 ++----------------------------------------------------------------=
-+


                                  cpuidle.C6-NHM.time

  1.5e+08 ++---------------------------------------------------------------=
-+
  1.4e+08 ++      *                                                        =
 |
          |      : :                                                       =
 |
  1.3e+08 ++     : :                                                       =
 |
  1.2e+08 ++    :   :                                                      =
 |
          |    :     :                                                     =
 |
  1.1e+08 ++   :     :  ..*..                           .*..               =
 |
    1e+08 ++..*       *.           ..*...*...  ..*... ..    *...*...*...*..=
.*
    9e+07 *+                 *...*.          *.      *                     =
 |
          |                                                                =
 |
    8e+07 ++                                                               =
 |
    7e+07 ++                                                               =
 |
          |                                                                =
 |
    6e+07 O+  O   O   O   O  O       O   O                                 =
 |
    5e+07 ++---------------------O-----------------------------------------=
-+


                                cpuidle.C6-NHM.usage

  36000 ++-----------------------------------------------------------------=
-+
        |         ..*...*...        *...                          ..*..    =
.*
  34000 *+..*...*.          *..   ..    *...*...*...  ..*..    .*.     . ..=
 |
  32000 ++                     . .                  *.     . ..         *  =
 |
        |                       *                           *              =
 |
  30000 ++                                                                 =
 |
        |                                                                  =
 |
  28000 ++          O                                                      =
 |
        O   O   O       O           O                                      =
 |
  26000 ++                  O                                              =
 |
  24000 ++                              O                                  =
 |
        |                                                                  =
 |
  22000 ++                      O                                          =
 |
        |                                                                  =
 |
  20000 ++-----------------------------------------------------------------=
-+


                                 turbostat.CPU%c1

  2.4 ++-------------------------------------------------------------------=
-+
      |           O                                                        =
 |
  2.3 O+  O   O       O    O   O   O   O                                   =
 |
  2.2 ++                                                                   =
 |
      |                                                                    =
 |
  2.1 ++                                                                   =
 |
    2 ++                                                                   =
 |
      |                                                                    =
 |
  1.9 ++                                                                   =
 |
  1.8 ++                                                                   =
 |
      |                                                                    =
 |
  1.7 ++..*...*...*...                    .*..    .*...               ..*..=
.|
  1.6 *+              *....*...  ..*... ..    . ..     *....*...*...*.     =
 *
      |                        *.      *       *                           =
 |
  1.5 ++-------------------------------------------------------------------=
-+


                                 turbostat.CPU%c6

  1.2 ++-------------------------------------------------------------------=
-+
  1.1 ++      *                                                            =
 |
      |      : :                                                           =
 |
    1 ++     : :                                                           =
 |
  0.9 ++    :   :                                                          =
 |
      |    :    :                                                          =
 |
  0.8 ++   :     :   .*....          ..*..            .*....               =
 |
  0.7 ++..*      : ..      *...*...*.     .  ..*... ..      *...*...*...*..=
.*
  0.6 *+          *                        *.      *                       =
 |
      |                                                                    =
 |
  0.5 ++                                                                   =
 |
  0.4 ++                                                                   =
 |
      |               O                                                    =
 |
  0.3 O+  O   O   O        O       O   O                                   =
 |
  0.2 ++-----------------------O-------------------------------------------=
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
-------------------------------------
lkp(a)eclists.intel.com
https://eclists.intel.com/sympa/info/lkp
Unsubscribe by sending email to sympa(a)eclists.intel.com with subject "Uns=
ubscribe lkp"


--===============0811153431719532700==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgp0ZXN0Y2FzZTogaGFja2JlbmNoCmRlZmF1bHQtbW9uaXRvcnM6
CiAgd2FpdDogcHJlLXRlc3QKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1h
LW51bWFzdGF0OiAKICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3Rh
dDogCiAgcHJvYy1zdGF0OgogICAgaW50ZXJ2YWw6IDEwCiAgbWVtaW5mbzogCiAgc2xhYmluZm86
IAogIGludGVycnVwdHM6IAogIGxvY2tfc3RhdDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGly
cXM6IAogIGJkaV9kZXZfbWFwcGluZzogCiAgZGlza3N0YXRzOiAKICBuZnNzdGF0OiAKICBjcHVp
ZGxlOiAKICBjcHVmcmVxLXN0YXRzOiAKICB0dXJib3N0YXQ6IAogIHBtZXRlcjogCiAgc2NoZWRf
ZGVidWc6CiAgICBpbnRlcnZhbDogNjAKZGVmYXVsdC13YXRjaGRvZ3M6CiAgd2F0Y2gtb29tOiAK
ICB3YXRjaGRvZzogCmNwdWZyZXFfZ292ZXJub3I6IHBlcmZvcm1hbmNlCm1vZGVsOiBOZWhhbGVt
LUVQCm1lbW9yeTogMTJHCmhkZF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1TVDM1
MDA1MTROU185V0owM0VCQS1wYXJ0MyIKc3dhcF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlk
L2F0YS1TVDMxMjAwMjZBU181TVMwN0hBMi1wYXJ0MiIKcm9vdGZzX3BhcnRpdGlvbjogIi9kZXYv
ZGlzay9ieS1pZC9hdGEtU1QzNTAwNTE0TlNfOVdKMDNFQkEtcGFydDEiCm5yX3RocmVhZHM6IDE2
MDAlCnBlcmYtcHJvZmlsZToKICBmcmVxOiA4MDAKaGFja2JlbmNoOgogIG1vZGU6IHByb2Nlc3MK
ICBpcGM6IHNvY2tldApicmFuY2g6IHl1eWFuZy10aXAvZm9yLWxrcApjb21taXQ6IDRjNTllMTQy
ZmVlMjBhNTc2MTdjZmYyMjUwYmQxYjExMjVmMGVmZGYKcmVwZWF0X3RvOiA1CnRlc3Rib3g6IGxr
cC1uZTA0CnRib3hfZ3JvdXA6IGxrcC1uZTA0Cmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVf
dGltZTogMjAxNS0wNi0wMSAxODo0ODoxMi4zMjgyODk0MjUgKzA4OjAwCnVzZXI6IGxrcApxdWV1
ZTogeWR1MTkKY29tcGlsZXI6IGdjYy00LjkKa2VybmVsOiAiL3BrZy9saW51eC94ODZfNjQtcmhl
bC9nY2MtNC45LzRjNTllMTQyZmVlMjBhNTc2MTdjZmYyMjUwYmQxYjExMjVmMGVmZGYvdm1saW51
ei00LjEuMC1yYzQtMDE5NjQtZzRjNTllMTQiCnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1bHQvaGFja2JlbmNoL3BlcmZvcm1hbmNlLTE2MDAl
LXByb2Nlc3Mtc29ja2V0L2xrcC1uZTA0L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2
XzY0LXJoZWwvZ2NjLTQuOS80YzU5ZTE0MmZlZTIwYTU3NjE3Y2ZmMjI1MGJkMWIxMTI1ZjBlZmRm
LzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtwLW5lMDQveWR1MTlfaGFja2JlbmNoLXBl
cmZvcm1hbmNlLTE2MDAlLXByb2Nlc3Mtc29ja2V0LXg4Nl82NC1yaGVsLTRjNTllMTQyZmVlMjBh
NTc2MTdjZmYyMjUwYmQxYjExMjVmMGVmZGYtMC0yMDE1MDYwMS00NzM3NC05NzJ3NjEueWFtbCIK
ZGVxdWV1ZV90aW1lOiAyMDE1LTA2LTAxIDIyOjQ2OjUwLjYyMzc0NzU1MCArMDg6MDAKbnJfY3B1
OiAiJChucHJvYykiCm1heF91cHRpbWU6IDI0MDAKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2Rl
Ymlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rl
di9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbGtwLW5lMDQveWR1MTlfaGFj
a2JlbmNoLXBlcmZvcm1hbmNlLTE2MDAlLXByb2Nlc3Mtc29ja2V0LXg4Nl82NC1yaGVsLTRjNTll
MTQyZmVlMjBhNTc2MTdjZmYyMjUwYmQxYjExMjVmMGVmZGYtMC0yMDE1MDYwMS00NzM3NC05NzJ3
NjEueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD15dXlh
bmctdGlwL2Zvci1sa3AKLSBjb21taXQ9NGM1OWUxNDJmZWUyMGE1NzYxN2NmZjIyNTBiZDFiMTEy
NWYwZWZkZgotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzRjNTll
MTQyZmVlMjBhNTc2MTdjZmYyMjUwYmQxYjExMjVmMGVmZGYvdm1saW51ei00LjEuMC1yYzQtMDE5
NjQtZzRjNTllMTQKLSBtYXhfdXB0aW1lPTI0MDAKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L2hhY2ti
ZW5jaC9wZXJmb3JtYW5jZS0xNjAwJS1wcm9jZXNzLXNvY2tldC9sa3AtbmUwNC9kZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvNGM1OWUxNDJmZWUyMGE1NzYx
N2NmZjIyNTBiZDFiMTEyNWYwZWZkZi8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5
cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRl
YnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0x
MDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9
cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1
MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9s
a3AteDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2dj
Yy00LjkvNGM1OWUxNDJmZWUyMGE1NzYxN2NmZjIyNTBiZDFiMTEyNWYwZWZkZi9tb2R1bGVzLmNn
eiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6
L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1p
cGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1
cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3oiCmpvYl9zdGF0ZTogZmlu
aXNoZWQKbG9hZGF2ZzogNjAxLjY5IDgxNS4yNSA0NzcuMTUgMS8yMjQgMjcyNwpzdGFydF90aW1l
OiAnMTQzMzE3MDA1MScKZW5kX3RpbWU6ICcxNDMzMTcwNjU5Jwp2ZXJzaW9uOiAiL2xrcC9sa3Av
LnNyYy0yMDE1MDYwMS0yMTQ1MTEiCg==

--===============0811153431719532700==
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
Y3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCi91c3IvYmluL2hhY2tiZW5jaCAtZyAy
NTYgLS1wcm9jZXNzIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDI1NiAtLXByb2Nlc3Mg
LWwgMTg3NQovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMjU2IC0tcHJvY2VzcyAtbCAxODc1Ci91c3Iv
YmluL2hhY2tiZW5jaCAtZyAyNTYgLS1wcm9jZXNzIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNo
IC1nIDI1NiAtLXByb2Nlc3MgLWwgMTg3NQovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMjU2IC0tcHJv
Y2VzcyAtbCAxODc1Ci91c3IvYmluL2hhY2tiZW5jaCAtZyAyNTYgLS1wcm9jZXNzIC1sIDE4NzUK
L3Vzci9iaW4vaGFja2JlbmNoIC1nIDI1NiAtLXByb2Nlc3MgLWwgMTg3NQovdXNyL2Jpbi9oYWNr
YmVuY2ggLWcgMjU2IC0tcHJvY2VzcyAtbCAxODc1Ci91c3IvYmluL2hhY2tiZW5jaCAtZyAyNTYg
LS1wcm9jZXNzIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDI1NiAtLXByb2Nlc3MgLWwg
MTg3NQovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMjU2IC0tcHJvY2VzcyAtbCAxODc1Ci91c3IvYmlu
L2hhY2tiZW5jaCAtZyAyNTYgLS1wcm9jZXNzIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1n
IDI1NiAtLXByb2Nlc3MgLWwgMTg3NQovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMjU2IC0tcHJvY2Vz
cyAtbCAxODc1Ci91c3IvYmluL2hhY2tiZW5jaCAtZyAyNTYgLS1wcm9jZXNzIC1sIDE4NzUKL3Vz
ci9iaW4vaGFja2JlbmNoIC1nIDI1NiAtLXByb2Nlc3MgLWwgMTg3NQovdXNyL2Jpbi9oYWNrYmVu
Y2ggLWcgMjU2IC0tcHJvY2VzcyAtbCAxODc1Ci91c3IvYmluL2hhY2tiZW5jaCAtZyAyNTYgLS1w
cm9jZXNzIC1sIDE4NzUKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDI1NiAtLXByb2Nlc3MgLWwgMTg3
NQovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMjU2IC0tcHJvY2VzcyAtbCAxODc1Ci91c3IvYmluL2hh
Y2tiZW5jaCAtZyAyNTYgLS1wcm9jZXNzIC1sIDE4NzUK

--===============0811153431719532700==--

