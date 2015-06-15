Content-Type: multipart/mixed; boundary="===============0992877512371277816=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [x86/MSI] 52f518a3a7c: -30.5% netperf.Throughput_tps
Date: Mon, 15 Jun 2015 15:02:05 +0800
Message-ID: <557E786D.4080906@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0992877512371277816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit 52f518a3a7c2f80551a38d38be28bc9f335e713c ("x86/MSI: Use hierarchical=
 irqdomains to manage MSI interrupts")


testcase/path_params/tbox_group: netperf/performance-300s-200%-TCP_RR/brick=
land3

3cb96f0c97330834  52f518a3a7c2f80551a38d38be  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

      1444 =C3=82=C2=B1  1%     -30.5%       1004 =C3=82=C2=B1  1%  netperf=
.Throughput_tps
    899.43 =C3=82=C2=B1  3%     -91.6%      75.48 =C3=82=C2=B1  3%  netperf=
.time.user_time
     10202 =C3=82=C2=B1  0%     -92.4%        778 =C3=82=C2=B1  1%  netperf=
.time.system_time
      3565 =C3=82=C2=B1  4%     -92.5%        268 =C3=82=C2=B1  3%  netperf=
.time.percent_of_cpu_this_job_got
     98265 =C3=82=C2=B1  3%     -31.1%      67662 =C3=82=C2=B1  4%  netperf=
.time.minor_page_faults
     25540 =C3=82=C2=B1 11%     -88.3%       2991 =C3=82=C2=B1 16%  netperf=
.time.involuntary_context_switches
  69135723 =C3=82=C2=B1  1%     -30.0%   48364754 =C3=82=C2=B1  1%  netperf=
.time.voluntary_context_switches
     37347 =C3=82=C2=B1  4%     +13.1%      42256 =C3=82=C2=B1  3%  uptime.=
idle
        44 =C3=82=C2=B1  5%     -93.2%          3 =C3=82=C2=B1  0%  vmstat.=
procs.r
    407528 =C3=82=C2=B1  3%     -26.3%     300511 =C3=82=C2=B1  4%  vmstat.=
system.cs
    446620 =C3=82=C2=B1  4%     -92.6%      33083 =C3=82=C2=B1  6%  vmstat.=
system.in
    178635 =C3=82=C2=B1  1%     -14.6%     152519 =C3=82=C2=B1  0%  meminfo=
.Active
     82997 =C3=82=C2=B1  2%     -29.5%      58518 =C3=82=C2=B1  1%  meminfo=
.Active(anon)
     36056 =C3=82=C2=B1  3%     -63.2%      13281 =C3=82=C2=B1  0%  meminfo=
.Shmem
    496435 =C3=82=C2=B1  3%     +19.4%     592640 =C3=82=C2=B1  2%  numa-me=
minfo.node0.MemUsed
    480933 =C3=82=C2=B1  3%      -7.3%     445927 =C3=82=C2=B1  2%  numa-me=
minfo.node2.MemUsed
      3997 =C3=82=C2=B1  1%     +12.1%       4482 =C3=82=C2=B1  3%  slabinf=
o.kmalloc-2048.active_objs
      4183 =C3=82=C2=B1  1%     +12.2%       4694 =C3=82=C2=B1  3%  slabinf=
o.kmalloc-2048.num_objs
       313 =C3=82=C2=B1 15%     -78.0%         69 =C3=82=C2=B1 30%  slabinf=
o.tw_sock_TCP.active_objs
       313 =C3=82=C2=B1 15%     -78.0%         69 =C3=82=C2=B1 30%  slabinf=
o.tw_sock_TCP.num_objs
   1016370 =C3=82=C2=B1  1%     -90.2%      99283 =C3=82=C2=B1  1%  softirq=
s.HRTIMER
   1556902 =C3=82=C2=B1  0%     -84.0%     248959 =C3=82=C2=B1  2%  softirq=
s.RCU
   3471142 =C3=82=C2=B1  1%     -92.3%     267496 =C3=82=C2=B1  3%  softirq=
s.SCHED
   4270170 =C3=82=C2=B1  1%     -82.2%     758706 =C3=82=C2=B1  2%  softirq=
s.TIMER
 2.347e+09 =C3=82=C2=B1  6%     -63.5%  8.569e+08 =C3=82=C2=B1 39%  cpuidle=
.C1-IVT-4S.time
  22319046 =C3=82=C2=B1  3%     +62.6%   36299214 =C3=82=C2=B1  3%  cpuidle=
.C1-IVT-4S.usage
 1.591e+10 =C3=82=C2=B1  9%    +128.3%  3.632e+10 =C3=82=C2=B1  3%  cpuidle=
.C6-IVT-4S.time
         7 =C3=82=C2=B1 21%    +514.0%         44 =C3=82=C2=B1 31%  cpuidle=
.POLL.usage
     25540 =C3=82=C2=B1 11%     -88.3%       2991 =C3=82=C2=B1 16%  time.in=
voluntary_context_switches
     98265 =C3=82=C2=B1  3%     -31.1%      67662 =C3=82=C2=B1  4%  time.mi=
nor_page_faults
      3565 =C3=82=C2=B1  4%     -92.5%        268 =C3=82=C2=B1  3%  time.pe=
rcent_of_cpu_this_job_got
     10202 =C3=82=C2=B1  0%     -92.4%        778 =C3=82=C2=B1  1%  time.sy=
stem_time
    899.43 =C3=82=C2=B1  3%     -91.6%      75.48 =C3=82=C2=B1  3%  time.us=
er_time
  69135723 =C3=82=C2=B1  1%     -30.0%   48364754 =C3=82=C2=B1  1%  time.vo=
luntary_context_switches
    268764 =C3=82=C2=B1 14%    +408.8%    1367464 =C3=82=C2=B1  3%  numa-nu=
mastat.node0.numa_hit
    268758 =C3=82=C2=B1 14%    +408.8%    1367424 =C3=82=C2=B1  3%  numa-nu=
mastat.node0.local_node
    438574 =C3=82=C2=B1 26%     -45.0%     241074 =C3=82=C2=B1  2%  numa-nu=
mastat.node1.local_node
    438574 =C3=82=C2=B1 26%     -45.0%     241076 =C3=82=C2=B1  2%  numa-nu=
mastat.node1.numa_hit
    333989 =C3=82=C2=B1 23%     -27.9%     240841 =C3=82=C2=B1  3%  numa-nu=
mastat.node2.local_node
    333989 =C3=82=C2=B1 23%     -27.9%     240844 =C3=82=C2=B1  3%  numa-nu=
mastat.node2.numa_hit
    381233 =C3=82=C2=B1 26%     -35.6%     245556 =C3=82=C2=B1  3%  numa-nu=
mastat.node3.local_node
    381238 =C3=82=C2=B1 26%     -35.6%     245561 =C3=82=C2=B1  3%  numa-nu=
mastat.node3.numa_hit
       482 =C3=82=C2=B1  4%     +11.9%        540 =C3=82=C2=B1  1%  numa-vm=
stat.node0.nr_alloc_batch
    251510 =C3=82=C2=B1  9%    +212.0%     784815 =C3=82=C2=B1  8%  numa-vm=
stat.node0.numa_local
    289771 =C3=82=C2=B1  8%    +184.0%     823025 =C3=82=C2=B1  7%  numa-vm=
stat.node0.numa_hit
    454081 =C3=82=C2=B1 12%     -25.4%     338719 =C3=82=C2=B1  4%  numa-vm=
stat.node1.numa_hit
       521 =C3=82=C2=B1  1%     +13.5%        592 =C3=82=C2=B1  3%  numa-vm=
stat.node1.nr_alloc_batch
    395201 =C3=82=C2=B1 14%     -28.9%     281018 =C3=82=C2=B1  4%  numa-vm=
stat.node1.numa_local
       529 =C3=82=C2=B1  3%     +10.1%        583 =C3=82=C2=B1  1%  numa-vm=
stat.node2.nr_alloc_batch
       525 =C3=82=C2=B1  6%     +12.8%        593 =C3=82=C2=B1  1%  numa-vm=
stat.node3.nr_alloc_batch
     51.25 =C3=82=C2=B1  3%     -92.9%       3.65 =C3=82=C2=B1  3%  turbost=
at.%Busy
      1635 =C3=82=C2=B1  3%     -93.0%        114 =C3=82=C2=B1  3%  turbost=
at.Avg_MHz
     45.20 =C3=82=C2=B1  4%     -70.1%      13.52 =C3=82=C2=B1 21%  turbost=
at.CPU%c1
    357.80 =C3=82=C2=B1  3%     -71.5%     101.83 =C3=82=C2=B1  6%  turbost=
at.CorWatt
        53 =C3=82=C2=B1  2%     -21.2%         42 =C3=82=C2=B1  6%  turbost=
at.CoreTmp
        53 =C3=82=C2=B1  1%     -20.7%         42 =C3=82=C2=B1  6%  turbost=
at.PkgTmp
       424 =C3=82=C2=B1  2%     -61.0%        165 =C3=82=C2=B1  3%  turbost=
at.PkgWatt
     62.78 =C3=82=C2=B1  1%      -8.9%      57.17 =C3=82=C2=B1  3%  turbost=
at.RAMWatt
     20746 =C3=82=C2=B1  2%     -29.5%      14628 =C3=82=C2=B1  1%  proc-vm=
stat.nr_active_anon
      2024 =C3=82=C2=B1  1%     +13.4%       2295 =C3=82=C2=B1  0%  proc-vm=
stat.nr_alloc_batch
      9013 =C3=82=C2=B1  3%     -63.2%       3319 =C3=82=C2=B1  0%  proc-vm=
stat.nr_shmem
     49576 =C3=82=C2=B1  5%     -60.3%      19667 =C3=82=C2=B1 13%  proc-vm=
stat.numa_hint_faults
     44013 =C3=82=C2=B1  5%     -64.6%      15598 =C3=82=C2=B1 16%  proc-vm=
stat.numa_hint_faults_local
   1420966 =C3=82=C2=B1  2%     +47.3%    2092933 =C3=82=C2=B1  1%  proc-vm=
stat.numa_hit
   1420955 =C3=82=C2=B1  2%     +47.3%    2092883 =C3=82=C2=B1  1%  proc-vm=
stat.numa_local
     53703 =C3=82=C2=B1  5%     -57.9%      22601 =C3=82=C2=B1 13%  proc-vm=
stat.numa_pte_updates
      8470 =C3=82=C2=B1  1%     -81.8%       1543 =C3=82=C2=B1  3%  proc-vm=
stat.pgactivate
    162499 =C3=82=C2=B1  5%     +90.3%     309245 =C3=82=C2=B1  5%  proc-vm=
stat.pgalloc_dma32
   5918865 =C3=82=C2=B1  2%     +85.7%   10992818 =C3=82=C2=B1  3%  proc-vm=
stat.pgalloc_normal
   6085763 =C3=82=C2=B1  2%     +86.0%   11317294 =C3=82=C2=B1  3%  proc-vm=
stat.pgfree
      2579 =C3=82=C2=B1  5%     -79.4%        532 =C3=82=C2=B1  2%  latency=
_stats.avg.do_wait.SyS_wait4.system_call_fastpath
       858 =C3=82=C2=B1  5%     +60.1%       1375 =C3=82=C2=B1  4%  latency=
_stats.avg.cifs_user_readv.[cifs].cifs_strict_readv.[cifs].__vfs_read.vfs_r=
ead.SyS_read.system_call_fastpath
      2337 =C3=82=C2=B1  4%     -79.5%        479 =C3=82=C2=B1  2%  latency=
_stats.avg.pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fas=
tpath
       875 =C3=82=C2=B1  7%     +74.6%       1528 =C3=82=C2=B1 10%  latency=
_stats.avg.wait_for_response.[cifs].SendReceive.[cifs].CIFSPOSIXCreate.[cif=
s].cifs_posix_open.[cifs].cifs_open.[cifs].do_dentry_open.vfs_open.do_last.=
path_openat.do_filp_open.do_sys_open.SyS_openat
       455 =C3=82=C2=B1  1%    +108.8%        951 =C3=82=C2=B1  1%  latency=
_stats.avg.sk_wait_data.tcp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_recvfrom=
.SyS_recvfrom.system_call_fastpath
       541 =C3=82=C2=B1 14%    +137.6%       1287 =C3=82=C2=B1  4%  latency=
_stats.avg.wait_for_response.[cifs].SendReceive.[cifs].CIFSSMBUnixQPathInfo=
.[cifs].cifs_get_inode_info_unix.[cifs].cifs_revalidate_dentry_attr.[cifs].=
cifs_revalidate_dentry.[cifs].cifs_d_revalidate.[cifs].lookup_fast.do_last.=
path_openat.do_filp_open.do_sys_open
       655 =C3=82=C2=B1 20%     +96.9%       1291 =C3=82=C2=B1  9%  latency=
_stats.avg.poll_schedule_timeout.do_select.core_sys_select.SyS_select.syste=
m_call_fastpath
  69119790 =C3=82=C2=B1  1%     -30.0%   48351473 =C3=82=C2=B1  1%  latency=
_stats.hits.sk_wait_data.tcp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_recvfro=
m.SyS_recvfrom.system_call_fastpath
       443 =C3=82=C2=B1  3%     -10.0%        399 =C3=82=C2=B1  2%  latency=
_stats.hits.poll_schedule_timeout.do_select.core_sys_select.SyS_select.syst=
em_call_fastpath
       190 =C3=82=C2=B1  6%     -95.8%          8 =C3=82=C2=B1 38%  latency=
_stats.hits.stop_one_cpu.sched_exec.do_execveat_common.SyS_execve.return_fr=
om_execve
      2157 =C3=82=C2=B1 23%     +66.0%       3581 =C3=82=C2=B1 22%  latency=
_stats.max.cifs_user_readv.[cifs].cifs_strict_readv.[cifs].__vfs_read.vfs_r=
ead.SyS_read.system_call_fastpath
      4912 =C3=82=C2=B1  0%      +1.6%       4992 =C3=82=C2=B1  0%  latency=
_stats.max.sk_wait_data.tcp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_recvfrom=
.SyS_recvfrom.system_call_fastpath
 3.151e+10 =C3=82=C2=B1  0%     +46.1%  4.603e+10 =C3=82=C2=B1  0%  latency=
_stats.sum.sk_wait_data.tcp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_recvfrom=
.SyS_recvfrom.system_call_fastpath
  16780629 =C3=82=C2=B1  2%     -78.9%    3539898 =C3=82=C2=B1  4%  latency=
_stats.sum.do_wait.SyS_wait4.system_call_fastpath
  25402986 =C3=82=C2=B1  2%     -78.5%    5473439 =C3=82=C2=B1  4%  latency=
_stats.sum.pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fas=
tpath
     12072 =C3=82=C2=B1 31%    +112.0%      25588 =C3=82=C2=B1 10%  latency=
_stats.sum.wait_for_response.[cifs].SendReceive.[cifs].CIFSSMBUnixQPathInfo=
.[cifs].cifs_get_inode_info_unix.[cifs].cifs_revalidate_dentry_attr.[cifs].=
cifs_revalidate_dentry.[cifs].cifs_d_revalidate.[cifs].lookup_fast.do_last.=
path_openat.do_filp_open.do_sys_open
    290547 =C3=82=C2=B1 19%     +77.5%     515581 =C3=82=C2=B1  9%  latency=
_stats.sum.poll_schedule_timeout.do_select.core_sys_select.SyS_select.syste=
m_call_fastpath
     24407 =C3=82=C2=B1  9%     +74.1%      42503 =C3=82=C2=B1  9%  latency=
_stats.sum.wait_for_response.[cifs].SendReceive.[cifs].CIFSPOSIXCreate.[cif=
s].cifs_posix_open.[cifs].cifs_open.[cifs].do_dentry_open.vfs_open.do_last.=
path_openat.do_filp_open.do_sys_open.SyS_openat
    245753 =C3=82=C2=B1 23%     +44.5%     355113 =C3=82=C2=B1  9%  latency=
_stats.sum.cifs_user_readv.[cifs].cifs_strict_readv.[cifs].__vfs_read.vfs_r=
ead.SyS_read.system_call_fastpath
     17.85 =C3=82=C2=B1  4%     -16.4%      14.92 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.ip_rcv.__netif_receive_skb_core.__netif_receive_skb.netif_=
receive_skb_internal.napi_gro_receive
      0.97 =C3=82=C2=B1  4%     -85.4%       0.14 =C3=82=C2=B1 32%  perf-pr=
ofile.cpu-cycles.ktime_get.sched_clock_tick.scheduler_tick.update_process_t=
imes.tick_sched_handle
      2.19 =C3=82=C2=B1  8%     -93.6%       0.14 =C3=82=C2=B1 10%  perf-pr=
ofile.cpu-cycles._raw_spin_lock.try_to_wake_up.default_wake_function.autore=
move_wake_function.__wake_up_common
      3.88 =C3=82=C2=B1  9%     -94.1%       0.23 =C3=82=C2=B1 21%  perf-pr=
ofile.cpu-cycles.load_balance.pick_next_task_fair.__schedule.schedule.sched=
ule_timeout
      6.29 =C3=82=C2=B1  7%     -96.7%       0.21 =C3=82=C2=B1 40%  perf-pr=
ofile.cpu-cycles._raw_spin_lock_irqsave.__account_scheduler_latency.enqueue=
_entity.enqueue_task_fair.enqueue_task
      0.94 =C3=82=C2=B1  5%     -90.7%       0.09 =C3=82=C2=B1 13%  perf-pr=
ofile.cpu-cycles.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_t=
imer_interrupt.__schedule.schedule
      0.94 =C3=82=C2=B1  5%     -90.6%       0.09 =C3=82=C2=B1 13%  perf-pr=
ofile.cpu-cycles.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_time=
r_interrupt.apic_timer_interrupt.__schedule
      4.19 =C3=82=C2=B1  2%     +61.7%       6.77 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.ktime_get.cpuidle_enter_state.cpuidle_enter.cpu_startup_en=
try.start_secondary
     15.10 =C3=82=C2=B1  3%     -27.5%      10.94 =C3=82=C2=B1  1%  perf-pr=
ofile.cpu-cycles.inet_recvmsg.sock_recvmsg.SYSC_recvfrom.sys_recvfrom.syste=
m_call_fastpath
     15.19 =C3=82=C2=B1  3%     -27.2%      11.07 =C3=82=C2=B1  1%  perf-pr=
ofile.cpu-cycles.sock_recvmsg.SYSC_recvfrom.sys_recvfrom.system_call_fastpa=
th
     15.35 =C3=82=C2=B1  3%     -27.0%      11.20 =C3=82=C2=B1  1%  perf-pr=
ofile.cpu-cycles.SYSC_recvfrom.sys_recvfrom.system_call_fastpath
     15.44 =C3=82=C2=B1  3%     -27.0%      11.27 =C3=82=C2=B1  1%  perf-pr=
ofile.cpu-cycles.sys_recvfrom.system_call_fastpath
     14.72 =C3=82=C2=B1  3%     -26.5%      10.82 =C3=82=C2=B1  1%  perf-pr=
ofile.cpu-cycles.tcp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_recvfrom.sys_re=
cvfrom
      1.57 =C3=82=C2=B1  3%     +33.4%       2.10 =C3=82=C2=B1  4%  perf-pr=
ofile.cpu-cycles.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.tcp_prequeue_pro=
cess.tcp_recvmsg
     15.03 =C3=82=C2=B1  4%     -25.0%      11.27 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.try_to_wake_up.default_wake_function.autoremove_wake_funct=
ion.__wake_up_common.__wake_up_sync_key
     23.41 =C3=82=C2=B1  3%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.ret_from_intr.cpu_startup_entry.start_secondary
      1.19 =C3=82=C2=B1 12%     -80.5%       0.23 =C3=82=C2=B1 19%  perf-pr=
ofile.cpu-cycles.scheduler_tick.update_process_times.tick_sched_handle.tick=
_sched_timer.__run_hrtimer
      4.24 =C3=82=C2=B1  2%     +58.3%       6.72 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.read_hpet.ktime_get.cpuidle_enter_state.cpuidle_enter.cpu_=
startup_entry
     15.05 =C3=82=C2=B1  4%     -24.9%      11.30 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.default_wake_function.autoremove_wake_function.__wake_up_c=
ommon.__wake_up_sync_key.tcp_prequeue
      2.81 =C3=82=C2=B1  9%     -90.6%       0.26 =C3=82=C2=B1 20%  perf-pr=
ofile.cpu-cycles.find_busiest_group.load_balance.pick_next_task_fair.__sche=
dule.schedule
      9.12 =C3=82=C2=B1  4%     -52.1%       4.36 =C3=82=C2=B1  4%  perf-pr=
ofile.cpu-cycles.sk_wait_data.tcp_recvmsg.inet_recvmsg.sock_recvmsg.SYSC_re=
cvfrom
      0.46 =C3=82=C2=B1  2%    +127.4%       1.04 =C3=82=C2=B1  6%  perf-pr=
ofile.cpu-cycles.pick_next_task_fair.__schedule.schedule.schedule_preempt_d=
isabled.cpu_startup_entry
      2.52 =C3=82=C2=B1  2%     -62.9%       0.94 =C3=82=C2=B1 31%  perf-pr=
ofile.cpu-cycles.__run_hrtimer.hrtimer_interrupt.local_apic_timer_interrupt=
.smp_apic_timer_interrupt.apic_timer_interrupt
      1.58 =C3=82=C2=B1  8%     -81.7%       0.29 =C3=82=C2=B1 21%  perf-pr=
ofile.cpu-cycles.tick_sched_handle.isra.18.tick_sched_timer.__run_hrtimer.h=
rtimer_interrupt.local_apic_timer_interrupt
      2.49 =C3=82=C2=B1  1%     -64.0%       0.90 =C3=82=C2=B1 33%  perf-pr=
ofile.cpu-cycles.tick_sched_timer.__run_hrtimer.hrtimer_interrupt.local_api=
c_timer_interrupt.smp_apic_timer_interrupt
     15.06 =C3=82=C2=B1  4%     -24.9%      11.32 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.autoremove_wake_function.__wake_up_common.__wake_up_sync_k=
ey.tcp_prequeue.tcp_v4_rcv
      1.35 =C3=82=C2=B1  3%     +32.3%       1.79 =C3=82=C2=B1  8%  perf-pr=
ofile.cpu-cycles.deactivate_task.__schedule.schedule.schedule_timeout.sk_wa=
it_data
     23.23 =C3=82=C2=B1  3%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.do_IRQ.ret_from_intr.cpu_startup_entry.start_secondary
      5.90 =C3=82=C2=B1  2%     -23.8%       4.50 =C3=82=C2=B1  6%  perf-pr=
ofile.cpu-cycles.read_hpet.ktime_get.sched_clock_tick.sched_clock_idle_wake=
up_event.tick_nohz_stop_idle
      1.72 =C3=82=C2=B1  8%     -83.2%       0.29 =C3=82=C2=B1 21%  perf-pr=
ofile.cpu-cycles.update_process_times.tick_sched_handle.tick_sched_timer.__=
run_hrtimer.hrtimer_interrupt
      1.55 =C3=82=C2=B1  6%     +48.4%       2.31 =C3=82=C2=B1  5%  perf-pr=
ofile.cpu-cycles.dev_queue_xmit_sk.ip_finish_output.ip_output.ip_local_out_=
sk.ip_queue_xmit
      1.35 =C3=82=C2=B1  3%     +30.7%       1.76 =C3=82=C2=B1  7%  perf-pr=
ofile.cpu-cycles.dequeue_task.deactivate_task.__schedule.schedule.schedule_=
timeout
     15.75 =C3=82=C2=B1  3%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.irq_exit.do_IRQ.ret_from_intr.cpu_startup_entry.start_seco=
ndary
      1.54 =C3=82=C2=B1  5%     +48.3%       2.28 =C3=82=C2=B1  5%  perf-pr=
ofile.cpu-cycles.__dev_queue_xmit.dev_queue_xmit_sk.ip_finish_output.ip_out=
put.ip_local_out_sk
      3.70 =C3=82=C2=B1  1%     +49.0%       5.51 =C3=82=C2=B1  1%  perf-pr=
ofile.cpu-cycles.tcp_v4_do_rcv.tcp_prequeue_process.tcp_recvmsg.inet_recvms=
g.sock_recvmsg
     72.13 =C3=82=C2=B1  0%     -24.2%      54.66 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.cpu_startup_entry.start_secondary
      8.28 =C3=82=C2=B1  5%     -61.0%       3.23 =C3=82=C2=B1  5%  perf-pr=
ofile.cpu-cycles.schedule.schedule_timeout.sk_wait_data.tcp_recvmsg.inet_re=
cvmsg
      3.44 =C3=82=C2=B1  3%     +51.2%       5.19 =C3=82=C2=B1  1%  perf-pr=
ofile.cpu-cycles.tcp_rcv_established.tcp_v4_do_rcv.tcp_prequeue_process.tcp=
_recvmsg.inet_recvmsg
      2.75 =C3=82=C2=B1  9%     -91.1%       0.24 =C3=82=C2=B1 20%  perf-pr=
ofile.cpu-cycles.update_sd_lb_stats.find_busiest_group.load_balance.pick_ne=
xt_task_fair.__schedule
      8.36 =C3=82=C2=B1  5%     -61.0%       3.26 =C3=82=C2=B1  5%  perf-pr=
ofile.cpu-cycles.schedule_timeout.sk_wait_data.tcp_recvmsg.inet_recvmsg.soc=
k_recvmsg
      0.33 =C3=82=C2=B1 29%    +218.5%       1.06 =C3=82=C2=B1 10%  perf-pr=
ofile.cpu-cycles.sk_stream_alloc_skb.tcp_sendmsg.inet_sendmsg.sock_sendmsg.=
SYSC_sendto
     15.13 =C3=82=C2=B1  4%     -24.2%      11.46 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.__wake_up_common.__wake_up_sync_key.tcp_prequeue.tcp_v4_rc=
v.ip_local_deliver_finish
     72.31 =C3=82=C2=B1  0%     -24.2%      54.83 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.start_secondary
     14.20 =C3=82=C2=B1  3%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.__do_softirq.irq_exit.do_IRQ.ret_from_intr.cpu_startup_ent=
ry
      1.30 =C3=82=C2=B1  3%     +24.4%       1.62 =C3=82=C2=B1  8%  perf-pr=
ofile.cpu-cycles.dequeue_task_fair.dequeue_task.deactivate_task.__schedule.=
schedule
      1.34 =C3=82=C2=B1  5%     +30.0%       1.74 =C3=82=C2=B1  4%  perf-pr=
ofile.cpu-cycles.sch_direct_xmit.__dev_queue_xmit.dev_queue_xmit_sk.ip_fini=
sh_output.ip_output
      8.93 =C3=82=C2=B1  3%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.ret_from_intr.cpuidle_enter.cpu_startup_entry.start_second=
ary
     15.18 =C3=82=C2=B1  1%     +26.1%      19.14 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.tick_nohz_idle_exit.cpu_startup_entry.start_secondary
      4.09 =C3=82=C2=B1  0%      +9.8%       4.49 =C3=82=C2=B1  4%  perf-pr=
ofile.cpu-cycles.ktime_get.clockevents_program_event.tick_program_event.__r=
emove_hrtimer.__hrtimer_start_range_ns
      8.08 =C3=82=C2=B1  5%     -62.1%       3.06 =C3=82=C2=B1  6%  perf-pr=
ofile.cpu-cycles.__schedule.schedule.schedule_timeout.sk_wait_data.tcp_recv=
msg
      3.87 =C3=82=C2=B1  2%     +12.2%       4.35 =C3=82=C2=B1  7%  perf-pr=
ofile.cpu-cycles.read_hpet.ktime_get.__tick_nohz_idle_enter.tick_nohz_idle_=
enter.cpu_startup_entry
      5.80 =C3=82=C2=B1  1%     -12.5%       5.07 =C3=82=C2=B1  5%  perf-pr=
ofile.cpu-cycles.ktime_get_with_offset.netif_receive_skb_internal.napi_gro_=
receive.ixgbe_clean_rx_irq.ixgbe_poll
      0.36 =C3=82=C2=B1  4%    +188.3%       1.02 =C3=82=C2=B1  5%  perf-pr=
ofile.cpu-cycles.dev_hard_start_xmit.sch_direct_xmit.__dev_queue_xmit.dev_q=
ueue_xmit_sk.ip_finish_output
      4.72 =C3=82=C2=B1  3%    +186.8%      13.52 =C3=82=C2=B1  6%  perf-pr=
ofile.cpu-cycles.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.start_=
secondary
     10.92 =C3=82=C2=B1  4%     -11.1%       9.71 =C3=82=C2=B1  4%  perf-pr=
ofile.cpu-cycles.enqueue_entity.enqueue_task_fair.enqueue_task.activate_tas=
k.ttwu_do_activate
      2.95 =C3=82=C2=B1  3%     -18.6%       2.40 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.__schedule.schedule.schedule_preempt_disabled.cpu_startup_=
entry.start_secondary
      3.83 =C3=82=C2=B1  2%     +14.0%       4.36 =C3=82=C2=B1  7%  perf-pr=
ofile.cpu-cycles.ktime_get.__tick_nohz_idle_enter.tick_nohz_idle_enter.cpu_=
startup_entry.start_secondary
      8.92 =C3=82=C2=B1  3%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.do_IRQ.ret_from_intr.cpuidle_enter.cpu_startup_entry.start=
_secondary
      7.38 =C3=82=C2=B1  1%     +13.6%       8.38 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.sock_sendmsg.SYSC_sendto.sys_sendto.system_call_fastpath
     11.19 =C3=82=C2=B1  4%     -11.1%       9.95 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.ttwu_do_activate.constprop.88.try_to_wake_up.default_wake_=
function.autoremove_wake_function.__wake_up_common
     15.76 =C3=82=C2=B1  4%     -20.9%      12.46 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.__wake_up_sync_key.tcp_prequeue.tcp_v4_rcv.ip_local_delive=
r_finish.ip_local_deliver
      7.73 =C3=82=C2=B1  2%     +14.4%       8.85 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.SYSC_sendto.sys_sendto.system_call_fastpath
     13.61 =C3=82=C2=B1  1%     +12.6%      15.31 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.tick_nohz_idle_enter.cpu_startup_entry.start_secondary
      2.97 =C3=82=C2=B1  2%     +14.2%       3.40 =C3=82=C2=B1  4%  perf-pr=
ofile.cpu-cycles.ip_local_out_sk.ip_queue_xmit.tcp_transmit_skb.tcp_write_x=
mit.__tcp_push_pending_frames
      7.79 =C3=82=C2=B1  2%     +14.7%       8.93 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.sys_sendto.system_call_fastpath
      4.63 =C3=82=C2=B1  1%     +24.6%       5.77 =C3=82=C2=B1  1%  perf-pr=
ofile.cpu-cycles.tcp_prequeue_process.tcp_recvmsg.inet_recvmsg.sock_recvmsg=
.SYSC_recvfrom
      2.87 =C3=82=C2=B1  2%     +13.8%       3.26 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.ip_output.ip_local_out_sk.ip_queue_xmit.tcp_transmit_skb.t=
cp_write_xmit
      6.59 =C3=82=C2=B1  4%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.irq_exit.do_IRQ.ret_from_intr.cpuidle_enter.cpu_startup_en=
try
      3.04 =C3=82=C2=B1  3%     -17.9%       2.49 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.schedule.schedule_preempt_disabled.cpu_startup_entry.start=
_secondary
     11.17 =C3=82=C2=B1  4%     -18.6%       9.09 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activ=
ate.try_to_wake_up
     23.39 =C3=82=C2=B1  2%     -12.3%      20.51 =C3=82=C2=B1  1%  perf-pr=
ofile.cpu-cycles.system_call_fastpath
      7.03 =C3=82=C2=B1  1%     +16.0%       8.15 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.inet_sendmsg.sock_sendmsg.SYSC_sendto.sys_sendto.system_ca=
ll_fastpath
      4.16 =C3=82=C2=B1  0%     +14.6%       4.76 =C3=82=C2=B1  4%  perf-pr=
ofile.cpu-cycles.tick_program_event.__remove_hrtimer.__hrtimer_start_range_=
ns.hrtimer_start.tick_nohz_stop_sched_tick
      4.15 =C3=82=C2=B1  0%     +14.7%       4.76 =C3=82=C2=B1  4%  perf-pr=
ofile.cpu-cycles.clockevents_program_event.tick_program_event.__remove_hrti=
mer.__hrtimer_start_range_ns.hrtimer_start
      3.05 =C3=82=C2=B1  3%     -16.3%       2.55 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.schedule_preempt_disabled.cpu_startup_entry.start_secondary
      6.33 =C3=82=C2=B1  4%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.__do_softirq.irq_exit.do_IRQ.ret_from_intr.cpuidle_enter
      6.78 =C3=82=C2=B1  4%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.tick_irq_enter.irq_enter.do_IRQ.ret_from_intr.cpu_startup_=
entry
      6.75 =C3=82=C2=B1  4%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.irq_enter.do_IRQ.ret_from_intr.cpu_startup_entry.start_sec=
ondary
      4.73 =C3=82=C2=B1  3%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.sched_clock_tick.sched_clock_idle_wakeup_event.tick_nohz_s=
top_idle.tick_irq_enter.irq_enter
     10.95 =C3=82=C2=B1  5%     -13.5%       9.47 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.activate_task.ttwu_do_activate.try_to_wake_up.default_wake=
_function.autoremove_wake_function
      4.62 =C3=82=C2=B1  3%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.ktime_get.sched_clock_tick.sched_clock_idle_wakeup_event.t=
ick_nohz_stop_idle.tick_irq_enter
      4.21 =C3=82=C2=B1  1%     +21.2%       5.10 =C3=82=C2=B1  4%  perf-pr=
ofile.cpu-cycles.ktime_get.tick_nohz_idle_exit.cpu_startup_entry.start_seco=
ndary
      1.29 =C3=82=C2=B1  4%     +21.1%       1.57 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established.tcp_v4_do_=
rcv.tcp_prequeue_process
      9.15 =C3=82=C2=B1  1%     +16.1%      10.63 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.tick_nohz_stop_sched_tick.__tick_nohz_idle_enter.tick_nohz=
_idle_enter.cpu_startup_entry.start_secondary
     10.94 =C3=82=C2=B1  5%     -13.5%       9.46 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.enqueue_task.activate_task.ttwu_do_activate.try_to_wake_up=
.default_wake_function
      0.17 =C3=82=C2=B1 35%    +479.8%       0.96 =C3=82=C2=B1 10%  perf-pr=
ofile.cpu-cycles.__alloc_skb.sk_stream_alloc_skb.tcp_sendmsg.inet_sendmsg.s=
ock_sendmsg
      4.32 =C3=82=C2=B1  9%     -88.6%       0.49 =C3=82=C2=B1 13%  perf-pr=
ofile.cpu-cycles.pick_next_task_fair.__schedule.schedule.schedule_timeout.s=
k_wait_data
      4.54 =C3=82=C2=B1  3%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.tick_nohz_stop_idle.tick_irq_enter.irq_enter.do_IRQ.ret_fr=
om_intr
     16.82 =C3=82=C2=B1  4%     -15.0%      14.30 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.ip_local_deliver.ip_rcv_finish.ip_rcv.__netif_receive_skb_=
core.__netif_receive_skb
     16.81 =C3=82=C2=B1  4%     -15.0%      14.28 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.ip_local_deliver_finish.ip_local_deliver.ip_rcv_finish.ip_=
rcv.__netif_receive_skb_core
      4.28 =C3=82=C2=B1  2%     -14.4%       3.66 =C3=82=C2=B1  6%  perf-pr=
ofile.cpu-cycles.ktime_get.clockevents_program_event.tick_program_event.__r=
emove_hrtimer.hrtimer_try_to_cancel
     24.19 =C3=82=C2=B1  3%     -15.8%      20.36 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.napi_gro_receive.ixgbe_clean_rx_irq.ixgbe_poll.net_rx_acti=
on.__do_softirq
     23.93 =C3=82=C2=B1  3%     -15.8%      20.15 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.netif_receive_skb_internal.napi_gro_receive.ixgbe_clean_rx=
_irq.ixgbe_poll.net_rx_action
      4.03 =C3=82=C2=B1  1%     +15.2%       4.64 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.=
tcp_push.tcp_sendmsg
      9.82 =C3=82=C2=B1  4%     -14.5%       8.40 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.__account_scheduler_latency.enqueue_entity.enqueue_task_fa=
ir.enqueue_task.activate_task
     13.12 =C3=82=C2=B1  1%     +15.9%      15.21 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.__tick_nohz_idle_enter.tick_nohz_idle_enter.cpu_startup_en=
try.start_secondary
      6.71 =C3=82=C2=B1  1%     +18.5%       7.95 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.tcp_sendmsg.inet_sendmsg.sock_sendmsg.SYSC_sendto.sys_send=
to
      8.57 =C3=82=C2=B1  1%     +17.2%      10.05 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.hrtimer_start.tick_nohz_stop_sched_tick.__tick_nohz_idle_e=
nter.tick_nohz_idle_enter.cpu_startup_entry
     16.71 =C3=82=C2=B1  4%     -16.1%      14.02 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.tcp_v4_rcv.ip_local_deliver_finish.ip_local_deliver.ip_rcv=
_finish.ip_rcv
      0.14 =C3=82=C2=B1 15%    +573.8%       0.94 =C3=82=C2=B1  9%  perf-pr=
ofile.cpu-cycles.tcp_send_delayed_ack.__tcp_ack_snd_check.tcp_rcv_establish=
ed.tcp_v4_do_rcv.tcp_prequeue_process
      0.10 =C3=82=C2=B1 23%    +830.0%       0.93 =C3=82=C2=B1  5%  perf-pr=
ofile.cpu-cycles.ixgbe_xmit_frame.dev_hard_start_xmit.sch_direct_xmit.__dev=
_queue_xmit.dev_queue_xmit_sk
      0.08 =C3=82=C2=B1  6%   +1213.0%       1.01 =C3=82=C2=B1  4%  perf-pr=
ofile.cpu-cycles.is_module_text_address.print_context_stack.dump_trace.save=
_stack_trace_tsk.__account_scheduler_latency
      4.48 =C3=82=C2=B1  3%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.sched_clock_idle_wakeup_event.tick_nohz_stop_idle.tick_irq=
_enter.irq_enter.do_IRQ
      4.57 =C3=82=C2=B1  2%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.ktime_get.tick_irq_enter.irq_enter.do_IRQ.ret_from_intr
      8.57 =C3=82=C2=B1  1%     +16.9%      10.02 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.__hrtimer_start_range_ns.hrtimer_start.tick_nohz_stop_sche=
d_tick.__tick_nohz_idle_enter.tick_nohz_idle_enter
     17.72 =C3=82=C2=B1  4%     -16.3%      14.84 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.ip_rcv_finish.ip_rcv.__netif_receive_skb_core.__netif_rece=
ive_skb.netif_receive_skb_internal
      4.57 =C3=82=C2=B1  2%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.read_hpet.ktime_get.tick_irq_enter.irq_enter.do_IRQ
      0.96 =C3=82=C2=B1  4%     -85.4%       0.14 =C3=82=C2=B1 35%  perf-pr=
ofile.cpu-cycles.read_hpet.ktime_get.sched_clock_tick.scheduler_tick.update=
_process_times
     18.03 =C3=82=C2=B1  4%     -16.6%      15.03 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.__netif_receive_skb.netif_receive_skb_internal.napi_gro_re=
ceive.ixgbe_clean_rx_irq.ixgbe_poll
      4.99 =C3=82=C2=B1  1%     +17.0%       5.84 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.tcp_push.tcp_sendmsg.inet_sendmsg.sock_sendmsg.SYSC_sendto
     18.00 =C3=82=C2=B1  4%     -16.7%      15.00 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.__netif_receive_skb_core.__netif_receive_skb.netif_receive=
_skb_internal.napi_gro_receive.ixgbe_clean_rx_irq
      3.16 =C3=82=C2=B1  1%     +20.8%       3.82 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.ip_queue_xmit.tcp_transmit_skb.tcp_write_xmit.__tcp_push_p=
ending_frames.tcp_push
      4.87 =C3=82=C2=B1  2%     +18.7%       5.78 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.__tcp_push_pending_frames.tcp_push.tcp_sendmsg.inet_sendms=
g.sock_sendmsg
      2.36 =C3=82=C2=B1  1%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.irq_enter.do_IRQ.ret_from_intr.cpuidle_enter.cpu_startup_e=
ntry
      0.23 =C3=82=C2=B1  6%    +443.4%       1.23 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.is_module_text_address.__kernel_text_address.print_context=
_stack.dump_trace.save_stack_trace_tsk
      0.47 =C3=82=C2=B1  4%    +684.2%       3.65 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.__kernel_text_address.print_context_stack.dump_trace.save_=
stack_trace_tsk.__account_scheduler_latency
      1.37 =C3=82=C2=B1  4%    +239.8%       4.65 =C3=82=C2=B1  7%  perf-pr=
ofile.cpu-cycles.tick_nohz_stop_idle.tick_nohz_idle_exit.cpu_startup_entry.=
start_secondary
      1.34 =C3=82=C2=B1  4%    +243.2%       4.61 =C3=82=C2=B1  7%  perf-pr=
ofile.cpu-cycles.sched_clock_tick.sched_clock_idle_wakeup_event.tick_nohz_s=
top_idle.tick_nohz_idle_exit.cpu_startup_entry
      0.43 =C3=82=C2=B1  7%   +1444.2%       6.64 =C3=82=C2=B1 15%  perf-pr=
ofile.cpu-cycles.intel_idle.cpuidle_enter_state.cpuidle_enter.cpu_startup_e=
ntry.start_secondary
      0.54 =C3=82=C2=B1  7%   +3863.4%      21.27 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.ixgbe_clean_rx_irq.ixgbe_poll.net_rx_action.__do_softirq.r=
un_ksoftirqd
      0.54 =C3=82=C2=B1  7%   +4049.4%      22.41 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.ixgbe_poll.net_rx_action.__do_softirq.run_ksoftirqd.smpboo=
t_thread_fn
      0.55 =C3=82=C2=B1  6%   +3975.2%      22.48 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.net_rx_action.__do_softirq.run_ksoftirqd.smpboot_thread_fn=
.kthread
      1.28 =C3=82=C2=B1  3%    +246.7%       4.43 =C3=82=C2=B1  7%  perf-pr=
ofile.cpu-cycles.ktime_get.sched_clock_tick.sched_clock_idle_wakeup_event.t=
ick_nohz_stop_idle.tick_nohz_idle_exit
      4.21 =C3=82=C2=B1  0%     +18.0%       4.97 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.__remove_hrtimer.__hrtimer_start_range_ns.hrtimer_start.ti=
ck_nohz_stop_sched_tick.__tick_nohz_idle_enter
      5.58 =C3=82=C2=B1  1%     -15.9%       4.69 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.read_hpet.ktime_get_with_offset.netif_receive_skb_internal=
.napi_gro_receive.ixgbe_clean_rx_irq
      4.77 =C3=82=C2=B1  1%     +19.6%       5.70 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.tcp_write_xmit.__tcp_push_pending_frames.tcp_push.tcp_send=
msg.inet_sendmsg
      1.33 =C3=82=C2=B1  4%    +248.1%       4.62 =C3=82=C2=B1  7%  perf-pr=
ofile.cpu-cycles.sched_clock_idle_wakeup_event.tick_nohz_stop_idle.tick_noh=
z_idle_exit.cpu_startup_entry.start_secondary
      1.92 =C3=82=C2=B1  2%    +283.1%       7.36 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.dump_trace.save_stack_trace_tsk.__account_scheduler_latenc=
y.enqueue_entity.enqueue_task_fair
      1.93 =C3=82=C2=B1  2%    +285.6%       7.46 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.save_stack_trace_tsk.__account_scheduler_latency.enqueue_e=
ntity.enqueue_task_fair.enqueue_task
      2.20 =C3=82=C2=B1  3%     +19.0%       2.61 =C3=82=C2=B1  4%  perf-pr=
ofile.cpu-cycles.ip_finish_output.ip_output.ip_local_out_sk.ip_queue_xmit.t=
cp_transmit_skb
     16.33 =C3=82=C2=B1  4%     -17.9%      13.40 =C3=82=C2=B1  3%  perf-pr=
ofile.cpu-cycles.tcp_prequeue.tcp_v4_rcv.ip_local_deliver_finish.ip_local_d=
eliver.ip_rcv_finish
      0.99 =C3=82=C2=B1  4%   +2179.8%      22.61 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
      0.97 =C3=82=C2=B1  4%   +2217.9%      22.60 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.__do_softirq.run_ksoftirqd.smpboot_thread_fn.kthread.ret_f=
rom_fork
      1.13 =C3=82=C2=B1  3%   +1906.2%      22.67 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.smpboot_thread_fn.kthread.ret_from_fork
      1.15 =C3=82=C2=B1  2%   +1878.6%      22.82 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.kthread.ret_from_fork
      1.02 =C3=82=C2=B1  2%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.x86_64_start_reservations.x86_64_start_kernel
      1.15 =C3=82=C2=B1  2%   +1879.0%      22.82 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.ret_from_fork
      2.34 =C3=82=C2=B1  1%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.tick_irq_enter.irq_enter.do_IRQ.ret_from_intr.cpuidle_enter
      1.62 =C3=82=C2=B1  4%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.__tick_nohz_idle_enter.tick_nohz_irq_exit.irq_exit.do_IRQ.=
ret_from_intr
      1.61 =C3=82=C2=B1  3%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.read_hpet.ktime_get.__tick_nohz_idle_enter.tick_nohz_irq_e=
xit.irq_exit
      1.56 =C3=82=C2=B1  4%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.tick_nohz_irq_exit.irq_exit.do_IRQ.ret_from_intr.cpu_start=
up_entry
      1.48 =C3=82=C2=B1  3%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.ktime_get.__tick_nohz_idle_enter.tick_nohz_irq_exit.irq_ex=
it.do_IRQ
      0.21 =C3=82=C2=B1 12%    +351.6%       0.96 =C3=82=C2=B1  8%  perf-pr=
ofile.cpu-cycles.__tcp_ack_snd_check.tcp_rcv_established.tcp_v4_do_rcv.tcp_=
prequeue_process.tcp_recvmsg
      1.72 =C3=82=C2=B1  2%    +301.4%       6.90 =C3=82=C2=B1  2%  perf-pr=
ofile.cpu-cycles.print_context_stack.dump_trace.save_stack_trace_tsk.__acco=
unt_scheduler_latency.enqueue_entity
      1.02 =C3=82=C2=B1  2%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.x86_64_start_kernel
      1.02 =C3=82=C2=B1  2%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.rest_init.start_kernel.x86_64_start_reservations.x86_64_st=
art_kernel
      1.02 =C3=82=C2=B1  2%    -100.0%       0.00 =C3=82=C2=B1  0%  perf-pr=
ofile.cpu-cycles.start_kernel.x86_64_start_reservations.x86_64_start_kernel
      4.21 =C3=82=C2=B1  1%     +20.6%       5.08 =C3=82=C2=B1  4%  perf-pr=
ofile.cpu-cycles.read_hpet.ktime_get.tick_nohz_idle_exit.cpu_startup_entry.=
start_secondary
       528 =C3=82=C2=B1  6%     +61.7%        854 =C3=82=C2=B1  1%  sched_d=
ebug.cfs_rq[0]:/.tg_runnable_contrib
     24162 =C3=82=C2=B1  6%     +62.3%      39214 =C3=82=C2=B1  1%  sched_d=
ebug.cfs_rq[0]:/.avg->runnable_avg_sum
   4882658 =C3=82=C2=B1  9%     -96.6%     167048 =C3=82=C2=B1  8%  sched_d=
ebug.cfs_rq[0]:/.min_vruntime
     37303 =C3=82=C2=B1  1%     -89.7%       3826 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[0]:/.tg->runnable_avg
     77353 =C3=82=C2=B1  9%     +81.9%     140694 =C3=82=C2=B1  7%  sched_d=
ebug.cfs_rq[0]:/.exec_clock
     38349 =C3=82=C2=B1  2%     -89.4%       4070 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[100]:/.tg->runnable_avg
     38365 =C3=82=C2=B1  2%     -89.4%       4071 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[101]:/.tg->runnable_avg
     38369 =C3=82=C2=B1  2%     -89.4%       4074 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[102]:/.tg->runnable_avg
     38382 =C3=82=C2=B1  2%     -89.4%       4075 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[103]:/.tg->runnable_avg
     38383 =C3=82=C2=B1  2%     -89.4%       4077 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[104]:/.tg->runnable_avg
     38391 =C3=82=C2=B1  2%     -89.4%       4079 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[105]:/.tg->runnable_avg
     38388 =C3=82=C2=B1  2%     -89.4%       4083 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[106]:/.tg->runnable_avg
     38402 =C3=82=C2=B1  2%     -89.4%       4084 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[107]:/.tg->runnable_avg
     38401 =C3=82=C2=B1  2%     -89.4%       4087 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[108]:/.tg->runnable_avg
     38413 =C3=82=C2=B1  2%     -89.4%       4088 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[109]:/.tg->runnable_avg
       548 =C3=82=C2=B1  3%     -93.4%         36 =C3=82=C2=B1 22%  sched_d=
ebug.cfs_rq[10]:/.tg_runnable_contrib
     37450 =C3=82=C2=B1  1%     -89.7%       3851 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[10]:/.tg->runnable_avg
   5772463 =C3=82=C2=B1  8%     -98.4%      93465 =C3=82=C2=B1 22%  sched_d=
ebug.cfs_rq[10]:/.min_vruntime
     76594 =C3=82=C2=B1  8%     -91.7%       6366 =C3=82=C2=B1 15%  sched_d=
ebug.cfs_rq[10]:/.exec_clock
     25036 =C3=82=C2=B1  3%     -93.3%       1688 =C3=82=C2=B1 20%  sched_d=
ebug.cfs_rq[10]:/.avg->runnable_avg_sum
     38410 =C3=82=C2=B1  2%     -89.4%       4089 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[110]:/.tg->runnable_avg
     38417 =C3=82=C2=B1  2%     -89.4%       4088 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[111]:/.tg->runnable_avg
     38435 =C3=82=C2=B1  2%     -89.4%       4091 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[112]:/.tg->runnable_avg
     38435 =C3=82=C2=B1  2%     -89.4%       4092 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[113]:/.tg->runnable_avg
     38428 =C3=82=C2=B1  2%     -89.3%       4095 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[114]:/.tg->runnable_avg
     38439 =C3=82=C2=B1  1%     -89.3%       4096 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[115]:/.tg->runnable_avg
     38445 =C3=82=C2=B1  2%     -89.3%       4095 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[116]:/.tg->runnable_avg
     38449 =C3=82=C2=B1  2%     -89.3%       4097 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[117]:/.tg->runnable_avg
     38461 =C3=82=C2=B1  2%     -89.3%       4100 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[118]:/.tg->runnable_avg
     38460 =C3=82=C2=B1  1%     -89.3%       4102 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[119]:/.tg->runnable_avg
     76608 =C3=82=C2=B1  7%     -91.7%       6356 =C3=82=C2=B1 16%  sched_d=
ebug.cfs_rq[11]:/.exec_clock
       546 =C3=82=C2=B1  2%     -93.5%         35 =C3=82=C2=B1 25%  sched_d=
ebug.cfs_rq[11]:/.tg_runnable_contrib
     37465 =C3=82=C2=B1  1%     -89.7%       3852 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[11]:/.tg->runnable_avg
     24985 =C3=82=C2=B1  2%     -93.3%       1664 =C3=82=C2=B1 24%  sched_d=
ebug.cfs_rq[11]:/.avg->runnable_avg_sum
   5775629 =C3=82=C2=B1  7%     -98.4%      91917 =C3=82=C2=B1 12%  sched_d=
ebug.cfs_rq[11]:/.min_vruntime
     76166 =C3=82=C2=B1  8%     -92.2%       5923 =C3=82=C2=B1 22%  sched_d=
ebug.cfs_rq[12]:/.exec_clock
   5756491 =C3=82=C2=B1  8%     -98.5%      86026 =C3=82=C2=B1 20%  sched_d=
ebug.cfs_rq[12]:/.min_vruntime
         5 =C3=82=C2=B1 31%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[12]:/.runnable_load_avg
     37492 =C3=82=C2=B1  1%     -89.7%       3853 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[12]:/.tg->runnable_avg
     75892 =C3=82=C2=B1  8%     -91.8%       6211 =C3=82=C2=B1 19%  sched_d=
ebug.cfs_rq[13]:/.exec_clock
     37506 =C3=82=C2=B1  1%     -89.7%       3856 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[13]:/.tg->runnable_avg
   5727275 =C3=82=C2=B1  7%     -98.4%      93734 =C3=82=C2=B1 18%  sched_d=
ebug.cfs_rq[13]:/.min_vruntime
     37528 =C3=82=C2=B1  1%     -89.7%       3857 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[14]:/.tg->runnable_avg
     25080 =C3=82=C2=B1  5%     -94.4%       1394 =C3=82=C2=B1 43%  sched_d=
ebug.cfs_rq[14]:/.avg->runnable_avg_sum
     75791 =C3=82=C2=B1  8%     -92.2%       5907 =C3=82=C2=B1 24%  sched_d=
ebug.cfs_rq[14]:/.exec_clock
       550 =C3=82=C2=B1  4%     -94.6%         29 =C3=82=C2=B1 43%  sched_d=
ebug.cfs_rq[14]:/.tg_runnable_contrib
         6 =C3=82=C2=B1 34%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[14]:/.runnable_load_avg
   5717919 =C3=82=C2=B1  7%     -98.4%      90360 =C3=82=C2=B1 22%  sched_d=
ebug.cfs_rq[14]:/.min_vruntime
     37554 =C3=82=C2=B1  1%     -89.7%       3860 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[15]:/.tg->runnable_avg
     71299 =C3=82=C2=B1 11%     -96.4%       2537 =C3=82=C2=B1 18%  sched_d=
ebug.cfs_rq[15]:/.exec_clock
   5471648 =C3=82=C2=B1 11%     -99.1%      50259 =C3=82=C2=B1 22%  sched_d=
ebug.cfs_rq[15]:/.min_vruntime
     71273 =C3=82=C2=B1 12%     -96.7%       2353 =C3=82=C2=B1 10%  sched_d=
ebug.cfs_rq[16]:/.exec_clock
   5469742 =C3=82=C2=B1 11%     -99.0%      53306 =C3=82=C2=B1 24%  sched_d=
ebug.cfs_rq[16]:/.min_vruntime
     37563 =C3=82=C2=B1  1%     -89.7%       3864 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[16]:/.tg->runnable_avg
2807093.70 =C3=82=C2=B1 36%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[17]:/.MIN_vruntime
         6 =C3=82=C2=B1 31%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[17]:/.runnable_load_avg
     37568 =C3=82=C2=B1  1%     -89.7%       3865 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[17]:/.tg->runnable_avg
     71654 =C3=82=C2=B1 12%     -96.9%       2229 =C3=82=C2=B1 14%  sched_d=
ebug.cfs_rq[17]:/.exec_clock
   5474236 =C3=82=C2=B1 11%     -99.1%      50364 =C3=82=C2=B1 25%  sched_d=
ebug.cfs_rq[17]:/.min_vruntime
2807093.70 =C3=82=C2=B1 36%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[17]:/.max_vruntime
     37574 =C3=82=C2=B1  1%     -89.7%       3866 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[18]:/.tg->runnable_avg
2611368.18 =C3=82=C2=B1 47%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[18]:/.max_vruntime
2611367.85 =C3=82=C2=B1 47%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[18]:/.MIN_vruntime
   5469964 =C3=82=C2=B1 11%     -99.2%      42263 =C3=82=C2=B1 36%  sched_d=
ebug.cfs_rq[18]:/.min_vruntime
         4 =C3=82=C2=B1 28%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[19]:/.runnable_load_avg
   5460827 =C3=82=C2=B1 11%     -99.2%      46250 =C3=82=C2=B1 33%  sched_d=
ebug.cfs_rq[19]:/.min_vruntime
     37603 =C3=82=C2=B1  1%     -89.7%       3871 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[19]:/.tg->runnable_avg
   5931126 =C3=82=C2=B1  8%     -86.0%     829332 =C3=82=C2=B1 28%  sched_d=
ebug.cfs_rq[1]:/.min_vruntime
     37333 =C3=82=C2=B1  1%     -89.7%       3834 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[1]:/.tg->runnable_avg
   1048433 =C3=82=C2=B1 16%     -36.8%     662283 =C3=82=C2=B1 34%  sched_d=
ebug.cfs_rq[1]:/.spread0
   5501605 =C3=82=C2=B1 11%     -99.1%      46820 =C3=82=C2=B1 29%  sched_d=
ebug.cfs_rq[20]:/.min_vruntime
     71374 =C3=82=C2=B1 11%     -97.4%       1825 =C3=82=C2=B1 22%  sched_d=
ebug.cfs_rq[20]:/.exec_clock
     37630 =C3=82=C2=B1  1%     -89.7%       3876 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[20]:/.tg->runnable_avg
         4 =C3=82=C2=B1 49%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[20]:/.runnable_load_avg
   5435674 =C3=82=C2=B1 11%     -99.1%      48697 =C3=82=C2=B1 31%  sched_d=
ebug.cfs_rq[21]:/.min_vruntime
     37645 =C3=82=C2=B1  1%     -89.7%       3875 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[21]:/.tg->runnable_avg
         7 =C3=82=C2=B1 40%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[21]:/.load
       122 =C3=82=C2=B1 48%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[21]:/.utilization_load_avg
     70205 =C3=82=C2=B1 12%     -97.3%       1867 =C3=82=C2=B1 36%  sched_d=
ebug.cfs_rq[21]:/.exec_clock
         7 =C3=82=C2=B1 44%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[22]:/.load
     37661 =C3=82=C2=B1  1%     -89.7%       3876 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[22]:/.tg->runnable_avg
   5491828 =C3=82=C2=B1 11%     -99.2%      45143 =C3=82=C2=B1 26%  sched_d=
ebug.cfs_rq[22]:/.min_vruntime
         6 =C3=82=C2=B1 32%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[23]:/.load
         4 =C3=82=C2=B1 35%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[23]:/.runnable_load_avg
        90 =C3=82=C2=B1 40%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[23]:/.utilization_load_avg
     37652 =C3=82=C2=B1  1%     -89.7%       3879 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[23]:/.tg->runnable_avg
   5499468 =C3=82=C2=B1 11%     -99.2%      44829 =C3=82=C2=B1 30%  sched_d=
ebug.cfs_rq[23]:/.min_vruntime
     37651 =C3=82=C2=B1  1%     -89.7%       3882 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[24]:/.tg->runnable_avg
         7 =C3=82=C2=B1 47%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[24]:/.load
2002338.86 =C3=82=C2=B1 45%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[24]:/.MIN_vruntime
   5458480 =C3=82=C2=B1 11%     -99.2%      45851 =C3=82=C2=B1 22%  sched_d=
ebug.cfs_rq[24]:/.min_vruntime
2002338.86 =C3=82=C2=B1 45%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[24]:/.max_vruntime
       499 =C3=82=C2=B1 11%     -98.4%          7 =C3=82=C2=B1 49%  sched_d=
ebug.cfs_rq[24]:/.tg_runnable_contrib
     22791 =C3=82=C2=B1 11%     -98.3%        393 =C3=82=C2=B1 47%  sched_d=
ebug.cfs_rq[24]:/.avg->runnable_avg_sum
   5501548 =C3=82=C2=B1 11%     -99.2%      42017 =C3=82=C2=B1 39%  sched_d=
ebug.cfs_rq[25]:/.min_vruntime
     37675 =C3=82=C2=B1  1%     -89.7%       3883 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[25]:/.tg->runnable_avg
     37701 =C3=82=C2=B1  1%     -89.7%       3887 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[26]:/.tg->runnable_avg
   5460570 =C3=82=C2=B1 11%     -99.2%      42120 =C3=82=C2=B1 20%  sched_d=
ebug.cfs_rq[26]:/.min_vruntime
     72021 =C3=82=C2=B1  8%     -97.9%       1500 =C3=82=C2=B1 39%  sched_d=
ebug.cfs_rq[26]:/.exec_clock
   5443461 =C3=82=C2=B1 11%     -99.3%      39281 =C3=82=C2=B1 30%  sched_d=
ebug.cfs_rq[27]:/.min_vruntime
     37720 =C3=82=C2=B1  1%     -89.7%       3890 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[27]:/.tg->runnable_avg
     70407 =C3=82=C2=B1 11%     -97.6%       1657 =C3=82=C2=B1 41%  sched_d=
ebug.cfs_rq[27]:/.exec_clock
     37737 =C3=82=C2=B1  1%     -89.7%       3890 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[28]:/.tg->runnable_avg
     71813 =C3=82=C2=B1 12%     -98.0%       1424 =C3=82=C2=B1 44%  sched_d=
ebug.cfs_rq[28]:/.exec_clock
   5482457 =C3=82=C2=B1 11%     -99.2%      42096 =C3=82=C2=B1 24%  sched_d=
ebug.cfs_rq[28]:/.min_vruntime
   5478035 =C3=82=C2=B1 11%     -99.2%      41368 =C3=82=C2=B1 31%  sched_d=
ebug.cfs_rq[29]:/.min_vruntime
     37748 =C3=82=C2=B1  1%     -89.7%       3893 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[29]:/.tg->runnable_avg
   5924938 =C3=82=C2=B1  8%     -86.5%     799517 =C3=82=C2=B1 29%  sched_d=
ebug.cfs_rq[2]:/.min_vruntime
     37344 =C3=82=C2=B1  1%     -89.7%       3839 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[2]:/.tg->runnable_avg
   1042225 =C3=82=C2=B1 20%     -39.3%     632468 =C3=82=C2=B1 35%  sched_d=
ebug.cfs_rq[2]:/.spread0
     37765 =C3=82=C2=B1  1%     -89.7%       3895 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[30]:/.tg->runnable_avg
2514014.52 =C3=82=C2=B1 44%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[30]:/.max_vruntime
   5791091 =C3=82=C2=B1 11%     -99.1%      49961 =C3=82=C2=B1 26%  sched_d=
ebug.cfs_rq[30]:/.min_vruntime
2514014.52 =C3=82=C2=B1 44%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[30]:/.MIN_vruntime
     76335 =C3=82=C2=B1 12%     -97.0%       2285 =C3=82=C2=B1 16%  sched_d=
ebug.cfs_rq[30]:/.exec_clock
     76769 =C3=82=C2=B1 11%     -97.4%       2026 =C3=82=C2=B1 16%  sched_d=
ebug.cfs_rq[31]:/.exec_clock
2370182.85 =C3=82=C2=B1 47%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[31]:/.MIN_vruntime
   5806067 =C3=82=C2=B1 11%     -99.2%      46410 =C3=82=C2=B1 22%  sched_d=
ebug.cfs_rq[31]:/.min_vruntime
2370183.19 =C3=82=C2=B1 47%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[31]:/.max_vruntime
     37783 =C3=82=C2=B1  1%     -89.7%       3903 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[31]:/.tg->runnable_avg
     77107 =C3=82=C2=B1 12%     -97.4%       1980 =C3=82=C2=B1 30%  sched_d=
ebug.cfs_rq[32]:/.exec_clock
   5865705 =C3=82=C2=B1 12%     -99.2%      45792 =C3=82=C2=B1 32%  sched_d=
ebug.cfs_rq[32]:/.min_vruntime
     37808 =C3=82=C2=B1  1%     -89.7%       3909 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[32]:/.tg->runnable_avg
     24950 =C3=82=C2=B1  9%     -96.2%        943 =C3=82=C2=B1 23%  sched_d=
ebug.cfs_rq[33]:/.avg->runnable_avg_sum
     37805 =C3=82=C2=B1  1%     -89.6%       3914 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[33]:/.tg->runnable_avg
   5827248 =C3=82=C2=B1 12%     -99.2%      44413 =C3=82=C2=B1 27%  sched_d=
ebug.cfs_rq[33]:/.min_vruntime
     76627 =C3=82=C2=B1 13%     -97.6%       1812 =C3=82=C2=B1 27%  sched_d=
ebug.cfs_rq[33]:/.exec_clock
       546 =C3=82=C2=B1  8%     -96.4%         19 =C3=82=C2=B1 22%  sched_d=
ebug.cfs_rq[33]:/.tg_runnable_contrib
     37804 =C3=82=C2=B1  1%     -89.6%       3915 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[34]:/.tg->runnable_avg
     76396 =C3=82=C2=B1 12%     -97.7%       1738 =C3=82=C2=B1 29%  sched_d=
ebug.cfs_rq[34]:/.exec_clock
2052042.52 =C3=82=C2=B1 30%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[34]:/.MIN_vruntime
   5789564 =C3=82=C2=B1 11%     -99.2%      43627 =C3=82=C2=B1 23%  sched_d=
ebug.cfs_rq[34]:/.min_vruntime
2052042.52 =C3=82=C2=B1 30%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[34]:/.max_vruntime
     37810 =C3=82=C2=B1  1%     -89.6%       3915 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[35]:/.tg->runnable_avg
   5793549 =C3=82=C2=B1 11%     -99.3%      40722 =C3=82=C2=B1 15%  sched_d=
ebug.cfs_rq[35]:/.min_vruntime
     76584 =C3=82=C2=B1 12%     -97.8%       1682 =C3=82=C2=B1 27%  sched_d=
ebug.cfs_rq[35]:/.exec_clock
       553 =C3=82=C2=B1  8%     -98.9%          6 =C3=82=C2=B1 36%  sched_d=
ebug.cfs_rq[36]:/.tg_runnable_contrib
     37800 =C3=82=C2=B1  1%     -89.6%       3917 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[36]:/.tg->runnable_avg
     25249 =C3=82=C2=B1  8%     -98.7%        330 =C3=82=C2=B1 28%  sched_d=
ebug.cfs_rq[36]:/.avg->runnable_avg_sum
     76722 =C3=82=C2=B1 13%     -97.9%       1576 =C3=82=C2=B1 41%  sched_d=
ebug.cfs_rq[36]:/.exec_clock
   5843915 =C3=82=C2=B1 12%     -99.3%      40252 =C3=82=C2=B1 43%  sched_d=
ebug.cfs_rq[36]:/.min_vruntime
     75923 =C3=82=C2=B1 12%     -97.7%       1718 =C3=82=C2=B1 38%  sched_d=
ebug.cfs_rq[37]:/.exec_clock
   5768738 =C3=82=C2=B1 11%     -99.3%      42192 =C3=82=C2=B1 39%  sched_d=
ebug.cfs_rq[37]:/.min_vruntime
       535 =C3=82=C2=B1  9%     -98.8%          6 =C3=82=C2=B1 28%  sched_d=
ebug.cfs_rq[37]:/.tg_runnable_contrib
     37811 =C3=82=C2=B1  1%     -89.6%       3924 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[37]:/.tg->runnable_avg
     24479 =C3=82=C2=B1  9%     -98.7%        316 =C3=82=C2=B1 26%  sched_d=
ebug.cfs_rq[37]:/.avg->runnable_avg_sum
         7 =C3=82=C2=B1 32%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[38]:/.load
     37833 =C3=82=C2=B1  1%     -89.6%       3925 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[38]:/.tg->runnable_avg
         5 =C3=82=C2=B1 30%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[38]:/.runnable_load_avg
   5826004 =C3=82=C2=B1 12%     -99.3%      43456 =C3=82=C2=B1 44%  sched_d=
ebug.cfs_rq[38]:/.min_vruntime
       544 =C3=82=C2=B1 10%     -98.4%          8 =C3=82=C2=B1 27%  sched_d=
ebug.cfs_rq[39]:/.tg_runnable_contrib
         6 =C3=82=C2=B1 21%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[39]:/.runnable_load_avg
     76688 =C3=82=C2=B1 13%     -98.2%       1415 =C3=82=C2=B1 35%  sched_d=
ebug.cfs_rq[39]:/.exec_clock
     37837 =C3=82=C2=B1  1%     -89.6%       3925 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[39]:/.tg->runnable_avg
     24864 =C3=82=C2=B1  9%     -98.2%        454 =C3=82=C2=B1 23%  sched_d=
ebug.cfs_rq[39]:/.avg->runnable_avg_sum
   5835422 =C3=82=C2=B1 12%     -99.4%      36160 =C3=82=C2=B1 31%  sched_d=
ebug.cfs_rq[39]:/.min_vruntime
     26232 =C3=82=C2=B1  5%     -22.4%      20344 =C3=82=C2=B1  8%  sched_d=
ebug.cfs_rq[3]:/.avg->runnable_avg_sum
       574 =C3=82=C2=B1  6%     -22.5%        445 =C3=82=C2=B1  8%  sched_d=
ebug.cfs_rq[3]:/.tg_runnable_contrib
     37364 =C3=82=C2=B1  1%     -89.7%       3840 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[3]:/.tg->runnable_avg
         9 =C3=82=C2=B1 49%    +335.2%         39 =C3=82=C2=B1 44%  sched_d=
ebug.cfs_rq[3]:/.load
   5891140 =C3=82=C2=B1  8%     -87.4%     740621 =C3=82=C2=B1 29%  sched_d=
ebug.cfs_rq[3]:/.min_vruntime
   1008386 =C3=82=C2=B1 18%     -43.1%     573573 =C3=82=C2=B1 35%  sched_d=
ebug.cfs_rq[3]:/.spread0
     76125 =C3=82=C2=B1 12%     -98.0%       1494 =C3=82=C2=B1 47%  sched_d=
ebug.cfs_rq[40]:/.exec_clock
     37838 =C3=82=C2=B1  1%     -89.6%       3926 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[40]:/.tg->runnable_avg
   5784431 =C3=82=C2=B1 11%     -99.3%      38831 =C3=82=C2=B1 36%  sched_d=
ebug.cfs_rq[40]:/.min_vruntime
     76346 =C3=82=C2=B1 13%     -98.1%       1455 =C3=82=C2=B1 41%  sched_d=
ebug.cfs_rq[41]:/.exec_clock
2279884.43 =C3=82=C2=B1 47%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[41]:/.MIN_vruntime
   5802087 =C3=82=C2=B1 12%     -99.3%      40195 =C3=82=C2=B1 34%  sched_d=
ebug.cfs_rq[41]:/.min_vruntime
         5 =C3=82=C2=B1 29%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[41]:/.runnable_load_avg
2279884.76 =C3=82=C2=B1 47%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[41]:/.max_vruntime
     37855 =C3=82=C2=B1  1%     -89.6%       3929 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[41]:/.tg->runnable_avg
       134 =C3=82=C2=B1 42%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[41]:/.utilization_load_avg
     37858 =C3=82=C2=B1  1%     -89.6%       3932 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[42]:/.tg->runnable_avg
   5839210 =C3=82=C2=B1 12%     -99.3%      39152 =C3=82=C2=B1 47%  sched_d=
ebug.cfs_rq[42]:/.min_vruntime
     76766 =C3=82=C2=B1 13%     -98.2%       1387 =C3=82=C2=B1 46%  sched_d=
ebug.cfs_rq[42]:/.exec_clock
         5 =C3=82=C2=B1 20%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[42]:/.runnable_load_avg
     76865 =C3=82=C2=B1 13%     -98.1%       1491 =C3=82=C2=B1 35%  sched_d=
ebug.cfs_rq[43]:/.exec_clock
         5 =C3=82=C2=B1 34%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[43]:/.runnable_load_avg
         7 =C3=82=C2=B1 44%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[43]:/.load
3274498.62 =C3=82=C2=B1 42%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[43]:/.max_vruntime
   5845980 =C3=82=C2=B1 12%     -99.3%      42925 =C3=82=C2=B1 28%  sched_d=
ebug.cfs_rq[43]:/.min_vruntime
3274498.62 =C3=82=C2=B1 42%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[43]:/.MIN_vruntime
     37884 =C3=82=C2=B1  1%     -89.6%       3934 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[43]:/.tg->runnable_avg
     76461 =C3=82=C2=B1 13%     -97.9%       1582 =C3=82=C2=B1 36%  sched_d=
ebug.cfs_rq[44]:/.exec_clock
   5801262 =C3=82=C2=B1 12%     -99.3%      39028 =C3=82=C2=B1 29%  sched_d=
ebug.cfs_rq[44]:/.min_vruntime
     37904 =C3=82=C2=B1  1%     -89.6%       3939 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[44]:/.tg->runnable_avg
     37919 =C3=82=C2=B1  1%     -89.6%       3945 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[45]:/.tg->runnable_avg
     75128 =C3=82=C2=B1  8%     -96.8%       2372 =C3=82=C2=B1 25%  sched_d=
ebug.cfs_rq[45]:/.exec_clock
   5733040 =C3=82=C2=B1  8%     -99.2%      47682 =C3=82=C2=B1 38%  sched_d=
ebug.cfs_rq[45]:/.min_vruntime
     74823 =C3=82=C2=B1  8%     -97.4%       1957 =C3=82=C2=B1 15%  sched_d=
ebug.cfs_rq[46]:/.exec_clock
2181820.38 =C3=82=C2=B1 44%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[46]:/.MIN_vruntime
   5706201 =C3=82=C2=B1  7%     -99.2%      45069 =C3=82=C2=B1 29%  sched_d=
ebug.cfs_rq[46]:/.min_vruntime
     37931 =C3=82=C2=B1  1%     -89.6%       3949 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[46]:/.tg->runnable_avg
2181820.38 =C3=82=C2=B1 44%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[46]:/.max_vruntime
     37937 =C3=82=C2=B1  1%     -89.6%       3952 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[47]:/.tg->runnable_avg
     75941 =C3=82=C2=B1  7%     -97.7%       1740 =C3=82=C2=B1 26%  sched_d=
ebug.cfs_rq[47]:/.exec_clock
   5795769 =C3=82=C2=B1  7%     -99.3%      43188 =C3=82=C2=B1 29%  sched_d=
ebug.cfs_rq[47]:/.min_vruntime
     74784 =C3=82=C2=B1  7%     -97.9%       1582 =C3=82=C2=B1 27%  sched_d=
ebug.cfs_rq[48]:/.exec_clock
   5703468 =C3=82=C2=B1  7%     -99.3%      39942 =C3=82=C2=B1 31%  sched_d=
ebug.cfs_rq[48]:/.min_vruntime
     37947 =C3=82=C2=B1  1%     -89.6%       3954 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[48]:/.tg->runnable_avg
         5 =C3=82=C2=B1 33%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[49]:/.runnable_load_avg
     75045 =C3=82=C2=B1  7%     -97.9%       1592 =C3=82=C2=B1 23%  sched_d=
ebug.cfs_rq[49]:/.exec_clock
2349144.49 =C3=82=C2=B1 34%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[49]:/.MIN_vruntime
   5717654 =C3=82=C2=B1  7%     -99.3%      41062 =C3=82=C2=B1 37%  sched_d=
ebug.cfs_rq[49]:/.min_vruntime
2349144.49 =C3=82=C2=B1 34%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[49]:/.max_vruntime
     37976 =C3=82=C2=B1  1%     -89.6%       3956 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[49]:/.tg->runnable_avg
     26117 =C3=82=C2=B1  3%     -50.7%      12870 =C3=82=C2=B1  7%  sched_d=
ebug.cfs_rq[4]:/.avg->runnable_avg_sum
     37364 =C3=82=C2=B1  1%     -89.7%       3843 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[4]:/.tg->runnable_avg
     78451 =C3=82=C2=B1  8%     -47.9%      40905 =C3=82=C2=B1 20%  sched_d=
ebug.cfs_rq[4]:/.exec_clock
       571 =C3=82=C2=B1  4%     -50.5%        282 =C3=82=C2=B1  7%  sched_d=
ebug.cfs_rq[4]:/.tg_runnable_contrib
   5828333 =C3=82=C2=B1  8%     -91.7%     486365 =C3=82=C2=B1 28%  sched_d=
ebug.cfs_rq[4]:/.min_vruntime
    945560 =C3=82=C2=B1 28%     -66.2%     319316 =C3=82=C2=B1 41%  sched_d=
ebug.cfs_rq[4]:/.spread0
        92 =C3=82=C2=B1 24%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[50]:/.utilization_load_avg
     75109 =C3=82=C2=B1  7%     -97.7%       1699 =C3=82=C2=B1 37%  sched_d=
ebug.cfs_rq[50]:/.exec_clock
         6 =C3=82=C2=B1 49%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[50]:/.load
   5726100 =C3=82=C2=B1  6%     -99.2%      45365 =C3=82=C2=B1 30%  sched_d=
ebug.cfs_rq[50]:/.min_vruntime
       543 =C3=82=C2=B1 11%     -98.9%          6 =C3=82=C2=B1 49%  sched_d=
ebug.cfs_rq[50]:/.tg_runnable_contrib
     24764 =C3=82=C2=B1 11%     -98.7%        328 =C3=82=C2=B1 39%  sched_d=
ebug.cfs_rq[50]:/.avg->runnable_avg_sum
     37997 =C3=82=C2=B1  1%     -89.6%       3959 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[50]:/.tg->runnable_avg
         4 =C3=82=C2=B1 34%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[50]:/.runnable_load_avg
   5701479 =C3=82=C2=B1  6%     -99.3%      37520 =C3=82=C2=B1 36%  sched_d=
ebug.cfs_rq[51]:/.min_vruntime
     38008 =C3=82=C2=B1  1%     -89.6%       3959 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[51]:/.tg->runnable_avg
     74668 =C3=82=C2=B1  7%     -98.1%       1411 =C3=82=C2=B1 41%  sched_d=
ebug.cfs_rq[51]:/.exec_clock
     25473 =C3=82=C2=B1 12%     -98.4%        408 =C3=82=C2=B1 48%  sched_d=
ebug.cfs_rq[52]:/.avg->runnable_avg_sum
     75465 =C3=82=C2=B1  8%     -98.1%       1450 =C3=82=C2=B1 23%  sched_d=
ebug.cfs_rq[52]:/.exec_clock
3567331.44 =C3=82=C2=B1 29%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[52]:/.MIN_vruntime
   5767898 =C3=82=C2=B1  7%     -99.3%      38845 =C3=82=C2=B1 30%  sched_d=
ebug.cfs_rq[52]:/.min_vruntime
         8 =C3=82=C2=B1 41%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[52]:/.runnable_load_avg
3567331.77 =C3=82=C2=B1 29%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[52]:/.max_vruntime
     38019 =C3=82=C2=B1  1%     -89.6%       3962 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[52]:/.tg->runnable_avg
     38036 =C3=82=C2=B1  2%     -89.6%       3966 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[53]:/.tg->runnable_avg
     75493 =C3=82=C2=B1  8%     -98.0%       1520 =C3=82=C2=B1 30%  sched_d=
ebug.cfs_rq[53]:/.exec_clock
2564844.76 =C3=82=C2=B1 34%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[53]:/.max_vruntime
   5768160 =C3=82=C2=B1  7%     -99.2%      44245 =C3=82=C2=B1 35%  sched_d=
ebug.cfs_rq[53]:/.min_vruntime
2564844.76 =C3=82=C2=B1 34%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[53]:/.MIN_vruntime
     75523 =C3=82=C2=B1  9%     -98.1%       1443 =C3=82=C2=B1 40%  sched_d=
ebug.cfs_rq[54]:/.exec_clock
     38055 =C3=82=C2=B1  2%     -89.6%       3969 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[54]:/.tg->runnable_avg
   5757595 =C3=82=C2=B1  8%     -99.3%      41312 =C3=82=C2=B1 28%  sched_d=
ebug.cfs_rq[54]:/.min_vruntime
   5731615 =C3=82=C2=B1  7%     -99.3%      38668 =C3=82=C2=B1 27%  sched_d=
ebug.cfs_rq[55]:/.min_vruntime
     75160 =C3=82=C2=B1  8%     -98.0%       1473 =C3=82=C2=B1 39%  sched_d=
ebug.cfs_rq[55]:/.exec_clock
     38085 =C3=82=C2=B1  2%     -89.6%       3971 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[55]:/.tg->runnable_avg
       552 =C3=82=C2=B1 13%     -99.0%          5 =C3=82=C2=B1 49%  sched_d=
ebug.cfs_rq[56]:/.tg_runnable_contrib
   5759032 =C3=82=C2=B1  7%     -99.3%      37467 =C3=82=C2=B1 32%  sched_d=
ebug.cfs_rq[56]:/.min_vruntime
     38101 =C3=82=C2=B1  2%     -89.6%       3980 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[56]:/.tg->runnable_avg
     25129 =C3=82=C2=B1 13%     -98.8%        291 =C3=82=C2=B1 44%  sched_d=
ebug.cfs_rq[56]:/.avg->runnable_avg_sum
     75483 =C3=82=C2=B1  8%     -98.1%       1421 =C3=82=C2=B1 48%  sched_d=
ebug.cfs_rq[56]:/.exec_clock
         5 =C3=82=C2=B1 29%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[57]:/.runnable_load_avg
     74873 =C3=82=C2=B1  8%     -97.9%       1582 =C3=82=C2=B1 49%  sched_d=
ebug.cfs_rq[57]:/.exec_clock
   5707036 =C3=82=C2=B1  7%     -99.2%      43462 =C3=82=C2=B1 45%  sched_d=
ebug.cfs_rq[57]:/.min_vruntime
     38113 =C3=82=C2=B1  2%     -89.6%       3981 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[57]:/.tg->runnable_avg
2056049.76 =C3=82=C2=B1 47%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[58]:/.MIN_vruntime
2056049.76 =C3=82=C2=B1 47%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[58]:/.max_vruntime
   5638172 =C3=82=C2=B1  8%     -99.3%      40579 =C3=82=C2=B1 41%  sched_d=
ebug.cfs_rq[58]:/.min_vruntime
     38110 =C3=82=C2=B1  1%     -89.6%       3979 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[58]:/.tg->runnable_avg
     74655 =C3=82=C2=B1  8%     -98.3%       1291 =C3=82=C2=B1 34%  sched_d=
ebug.cfs_rq[59]:/.exec_clock
         9 =C3=82=C2=B1 48%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[59]:/.load
     38125 =C3=82=C2=B1  1%     -89.6%       3980 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[59]:/.tg->runnable_avg
   5687789 =C3=82=C2=B1  7%     -99.3%      37622 =C3=82=C2=B1 41%  sched_d=
ebug.cfs_rq[59]:/.min_vruntime
       569 =C3=82=C2=B1  5%     -89.4%         60 =C3=82=C2=B1 18%  sched_d=
ebug.cfs_rq[5]:/.tg_runnable_contrib
     78491 =C3=82=C2=B1  9%     -87.5%       9836 =C3=82=C2=B1  6%  sched_d=
ebug.cfs_rq[5]:/.exec_clock
     37386 =C3=82=C2=B1  1%     -89.7%       3845 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[5]:/.tg->runnable_avg
     26026 =C3=82=C2=B1  6%     -89.3%       2782 =C3=82=C2=B1 17%  sched_d=
ebug.cfs_rq[5]:/.avg->runnable_avg_sum
   5868941 =C3=82=C2=B1  8%     -97.8%     132022 =C3=82=C2=B1 13%  sched_d=
ebug.cfs_rq[5]:/.min_vruntime
     50960 =C3=82=C2=B1  9%     -99.1%        438 =C3=82=C2=B1 44%  sched_d=
ebug.cfs_rq[60]:/.exec_clock
     38133 =C3=82=C2=B1  1%     -89.6%       3981 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[60]:/.tg->runnable_avg
     51720 =C3=82=C2=B1 14%     -97.9%       1072 =C3=82=C2=B1 40%  sched_d=
ebug.cfs_rq[61]:/.exec_clock
   4337125 =C3=82=C2=B1 13%     -99.2%      35916 =C3=82=C2=B1 38%  sched_d=
ebug.cfs_rq[61]:/.min_vruntime
     38160 =C3=82=C2=B1  1%     -89.6%       3984 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[61]:/.tg->runnable_avg
         3 =C3=82=C2=B1 39%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[62]:/.load
     52202 =C3=82=C2=B1 13%     -98.8%        626 =C3=82=C2=B1 34%  sched_d=
ebug.cfs_rq[62]:/.exec_clock
     38148 =C3=82=C2=B1  1%     -89.5%       3986 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[62]:/.tg->runnable_avg
     14412 =C3=82=C2=B1 18%     -98.6%        194 =C3=82=C2=B1 48%  sched_d=
ebug.cfs_rq[62]:/.avg->runnable_avg_sum
         2 =C3=82=C2=B1 40%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[62]:/.runnable_load_avg
     38154 =C3=82=C2=B1  2%     -89.6%       3986 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[63]:/.tg->runnable_avg
   1268924 =C3=82=C2=B1 47%     -97.9%      26358 =C3=82=C2=B1 34%  sched_d=
ebug.cfs_rq[64]:/.min_vruntime
        64 =C3=82=C2=B1 42%     -95.8%          2 =C3=82=C2=B1 41%  sched_d=
ebug.cfs_rq[64]:/.tg_runnable_contrib
     38173 =C3=82=C2=B1  2%     -89.6%       3988 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[64]:/.tg->runnable_avg
      2993 =C3=82=C2=B1 41%     -95.1%        148 =C3=82=C2=B1 36%  sched_d=
ebug.cfs_rq[64]:/.avg->runnable_avg_sum
     38152 =C3=82=C2=B1  2%     -89.6%       3985 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[65]:/.tg->runnable_avg
         7 =C3=82=C2=B1 47%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[65]:/.nr_spread_over
     38162 =C3=82=C2=B1  2%     -89.5%       3989 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[66]:/.tg->runnable_avg
        10 =C3=82=C2=B1 30%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[66]:/.nr_spread_over
     15875 =C3=82=C2=B1 49%     -95.7%        680 =C3=82=C2=B1 31%  sched_d=
ebug.cfs_rq[66]:/.exec_clock
     38175 =C3=82=C2=B1  2%     -89.5%       3990 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[67]:/.tg->runnable_avg
     38206 =C3=82=C2=B1  2%     -89.6%       3991 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[68]:/.tg->runnable_avg
     38221 =C3=82=C2=B1  2%     -89.6%       3992 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[69]:/.tg->runnable_avg
     15369 =C3=82=C2=B1 47%     -94.7%        812 =C3=82=C2=B1 43%  sched_d=
ebug.cfs_rq[69]:/.exec_clock
     25441 =C3=82=C2=B1  4%     -91.8%       2076 =C3=82=C2=B1 13%  sched_d=
ebug.cfs_rq[6]:/.avg->runnable_avg_sum
       557 =C3=82=C2=B1  4%     -92.0%         44 =C3=82=C2=B1 13%  sched_d=
ebug.cfs_rq[6]:/.tg_runnable_contrib
         6 =C3=82=C2=B1 45%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[6]:/.load
   5815571 =C3=82=C2=B1  7%     -98.1%     110120 =C3=82=C2=B1 10%  sched_d=
ebug.cfs_rq[6]:/.min_vruntime
     77709 =C3=82=C2=B1  8%     -89.8%       7891 =C3=82=C2=B1  9%  sched_d=
ebug.cfs_rq[6]:/.exec_clock
         5 =C3=82=C2=B1 33%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[6]:/.runnable_load_avg
     37407 =C3=82=C2=B1  1%     -89.7%       3849 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[6]:/.tg->runnable_avg
     38225 =C3=82=C2=B1  2%     -89.5%       4001 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[70]:/.tg->runnable_avg
     38235 =C3=82=C2=B1  2%     -89.5%       4005 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[71]:/.tg->runnable_avg
     38238 =C3=82=C2=B1  2%     -89.5%       4007 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[72]:/.tg->runnable_avg
     38253 =C3=82=C2=B1  2%     -89.5%       4007 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[73]:/.tg->runnable_avg
         9 =C3=82=C2=B1 27%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[73]:/.nr_spread_over
         7 =C3=82=C2=B1 45%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[74]:/.nr_spread_over
     38240 =C3=82=C2=B1  2%     -89.5%       4012 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[74]:/.tg->runnable_avg
     38235 =C3=82=C2=B1  2%     -89.5%       4010 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[75]:/.tg->runnable_avg
     38233 =C3=82=C2=B1  2%     -89.5%       4010 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[76]:/.tg->runnable_avg
     38239 =C3=82=C2=B1  2%     -89.5%       4012 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[77]:/.tg->runnable_avg
     38260 =C3=82=C2=B1  2%     -89.5%       4015 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[78]:/.tg->runnable_avg
     38284 =C3=82=C2=B1  2%     -89.5%       4019 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[79]:/.tg->runnable_avg
     25894 =C3=82=C2=B1  3%     -92.4%       1956 =C3=82=C2=B1 12%  sched_d=
ebug.cfs_rq[7]:/.avg->runnable_avg_sum
     78030 =C3=82=C2=B1  8%     -90.8%       7193 =C3=82=C2=B1  8%  sched_d=
ebug.cfs_rq[7]:/.exec_clock
   5863768 =C3=82=C2=B1  7%     -98.2%     105821 =C3=82=C2=B1 12%  sched_d=
ebug.cfs_rq[7]:/.min_vruntime
       566 =C3=82=C2=B1  3%     -92.6%         42 =C3=82=C2=B1 12%  sched_d=
ebug.cfs_rq[7]:/.tg_runnable_contrib
     37430 =C3=82=C2=B1  1%     -89.7%       3850 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[7]:/.tg->runnable_avg
     38292 =C3=82=C2=B1  2%     -89.5%       4021 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[80]:/.tg->runnable_avg
     38300 =C3=82=C2=B1  2%     -89.5%       4022 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[81]:/.tg->runnable_avg
     38303 =C3=82=C2=B1  2%     -89.5%       4025 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[82]:/.tg->runnable_avg
     38286 =C3=82=C2=B1  2%     -89.5%       4028 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[83]:/.tg->runnable_avg
     38294 =C3=82=C2=B1  2%     -89.5%       4032 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[84]:/.tg->runnable_avg
     38304 =C3=82=C2=B1  2%     -89.5%       4034 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[85]:/.tg->runnable_avg
     38321 =C3=82=C2=B1  2%     -89.5%       4035 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[86]:/.tg->runnable_avg
     38326 =C3=82=C2=B1  2%     -89.5%       4039 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[87]:/.tg->runnable_avg
     38322 =C3=82=C2=B1  2%     -89.5%       4040 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[88]:/.tg->runnable_avg
     38313 =C3=82=C2=B1  2%     -89.4%       4044 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[89]:/.tg->runnable_avg
     37445 =C3=82=C2=B1  1%     -89.7%       3853 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[8]:/.tg->runnable_avg
       553 =C3=82=C2=B1  4%     -92.0%         44 =C3=82=C2=B1  5%  sched_d=
ebug.cfs_rq[8]:/.tg_runnable_contrib
     25270 =C3=82=C2=B1  4%     -91.8%       2076 =C3=82=C2=B1  5%  sched_d=
ebug.cfs_rq[8]:/.avg->runnable_avg_sum
     77680 =C3=82=C2=B1  8%     -91.2%       6799 =C3=82=C2=B1  6%  sched_d=
ebug.cfs_rq[8]:/.exec_clock
   5833584 =C3=82=C2=B1  8%     -98.3%      99293 =C3=82=C2=B1 11%  sched_d=
ebug.cfs_rq[8]:/.min_vruntime
     38307 =C3=82=C2=B1  2%     -89.4%       4044 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[90]:/.tg->runnable_avg
     38316 =C3=82=C2=B1  2%     -89.4%       4047 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[91]:/.tg->runnable_avg
      4788 =C3=82=C2=B1 48%     -95.1%        235 =C3=82=C2=B1 35%  sched_d=
ebug.cfs_rq[91]:/.avg->runnable_avg_sum
       103 =C3=82=C2=B1 49%     -95.8%          4 =C3=82=C2=B1 39%  sched_d=
ebug.cfs_rq[91]:/.tg_runnable_contrib
     38320 =C3=82=C2=B1  2%     -89.4%       4051 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[92]:/.tg->runnable_avg
     38332 =C3=82=C2=B1  2%     -89.4%       4052 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[93]:/.tg->runnable_avg
     38341 =C3=82=C2=B1  2%     -89.4%       4053 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[94]:/.tg->runnable_avg
     38329 =C3=82=C2=B1  2%     -89.4%       4056 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[95]:/.tg->runnable_avg
     38315 =C3=82=C2=B1  2%     -89.4%       4060 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[96]:/.tg->runnable_avg
     38318 =C3=82=C2=B1  2%     -89.4%       4061 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[97]:/.tg->runnable_avg
     38321 =C3=82=C2=B1  2%     -89.4%       4064 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[98]:/.tg->runnable_avg
     38326 =C3=82=C2=B1  2%     -89.4%       4066 =C3=82=C2=B1  3%  sched_d=
ebug.cfs_rq[99]:/.tg->runnable_avg
2599395.82 =C3=82=C2=B1 28%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[9]:/.MIN_vruntime
     37435 =C3=82=C2=B1  1%     -89.7%       3849 =C3=82=C2=B1  4%  sched_d=
ebug.cfs_rq[9]:/.tg->runnable_avg
         7 =C3=82=C2=B1 45%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[9]:/.runnable_load_avg
     25086 =C3=82=C2=B1  4%     -93.1%       1741 =C3=82=C2=B1 14%  sched_d=
ebug.cfs_rq[9]:/.avg->runnable_avg_sum
     76760 =C3=82=C2=B1  8%     -91.3%       6708 =C3=82=C2=B1 10%  sched_d=
ebug.cfs_rq[9]:/.exec_clock
2599396.15 =C3=82=C2=B1 28%    -100.0%       0.00 =C3=82=C2=B1  0%  sched_d=
ebug.cfs_rq[9]:/.max_vruntime
       550 =C3=82=C2=B1  4%     -93.2%         37 =C3=82=C2=B1 15%  sched_d=
ebug.cfs_rq[9]:/.tg_runnable_contrib
   5775897 =C3=82=C2=B1  7%     -98.3%      99243 =C3=82=C2=B1 18%  sched_d=
ebug.cfs_rq[9]:/.min_vruntime
         7 =C3=82=C2=B1 39%  +11559.1%        855 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#0.cpu_load[3]
         8 =C3=82=C2=B1 35%   +9767.3%        855 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#0.cpu_load[2]
        10 =C3=82=C2=B1 25%   +8443.3%        854 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#0.cpu_load[1]
         6 =C3=82=C2=B1 39%  +14133.3%        854 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#0.cpu_load[4]
    866410 =C3=82=C2=B1 20%     -42.2%     500354 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#0.max_idle_balance_cost
    401816 =C3=82=C2=B1  6%   +5302.7%   21709084 =C3=82=C2=B1  9%  sched_d=
ebug.cpu#0.ttwu_count
    312394 =C3=82=C2=B1 14%   +1631.2%    5408220 =C3=82=C2=B1 18%  sched_d=
ebug.cpu#1.sched_goidle
    177603 =C3=82=C2=B1 24%     -87.5%      22288 =C3=82=C2=B1 17%  sched_d=
ebug.cpu#1.ttwu_local
    303227 =C3=82=C2=B1  7%     -46.2%     163110 =C3=82=C2=B1 12%  sched_d=
ebug.cpu#1.avg_idle
    695685 =C3=82=C2=B1 12%   +1457.9%   10837841 =C3=82=C2=B1 18%  sched_d=
ebug.cpu#1.nr_switches
    699186 =C3=82=C2=B1 12%   +1450.1%   10837966 =C3=82=C2=B1 18%  sched_d=
ebug.cpu#1.sched_count
    461875 =C3=82=C2=B1  8%     -94.9%      23602 =C3=82=C2=B1 15%  sched_d=
ebug.cpu#1.ttwu_count
    262569 =C3=82=C2=B1  5%    +240.9%     895031 =C3=82=C2=B1 14%  sched_d=
ebug.cpu#10.avg_idle
    145636 =C3=82=C2=B1  7%     -30.0%     101980 =C3=82=C2=B1 10%  sched_d=
ebug.cpu#10.nr_load_updates
         4 =C3=82=C2=B1 36%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#10.cpu_load[1]
         3 =C3=82=C2=B1 42%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#10.cpu_load[3]
         3 =C3=82=C2=B1 34%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#10.cpu_load[2]
    534226 =C3=82=C2=B1 10%     -99.7%       1612 =C3=82=C2=B1 29%  sched_d=
ebug.cpu#10.ttwu_count
    182313 =C3=82=C2=B1 10%     -99.3%       1351 =C3=82=C2=B1 29%  sched_d=
ebug.cpu#10.ttwu_local
    912692 =C3=82=C2=B1 29%     -45.2%     500000 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#100.max_idle_balance_cost
    890003 =C3=82=C2=B1 25%     -43.5%     502419 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#101.max_idle_balance_cost
    895162 =C3=82=C2=B1 26%     -42.0%     518876 =C3=82=C2=B1  8%  sched_d=
ebug.cpu#102.max_idle_balance_cost
   1279055 =C3=82=C2=B1 16%     -18.8%    1038141 =C3=82=C2=B1  8%  sched_d=
ebug.cpu#102.avg_idle
   1210646 =C3=82=C2=B1 23%     -19.2%     978478 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#103.avg_idle
    873261 =C3=82=C2=B1 25%     -42.7%     500000 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#103.max_idle_balance_cost
    864952 =C3=82=C2=B1 24%     -42.2%     500000 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#104.max_idle_balance_cost
    887413 =C3=82=C2=B1 31%     -43.7%     500000 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#105.max_idle_balance_cost
    854103 =C3=82=C2=B1 27%     -40.9%     504735 =C3=82=C2=B1  2%  sched_d=
ebug.cpu#106.max_idle_balance_cost
    864081 =C3=82=C2=B1 28%     -42.0%     501124 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#107.max_idle_balance_cost
    898657 =C3=82=C2=B1 28%     -42.5%     516711 =C3=82=C2=B1  6%  sched_d=
ebug.cpu#108.max_idle_balance_cost
         3 =C3=82=C2=B1 42%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#11.cpu_load[2]
    543726 =C3=82=C2=B1  4%     -99.7%       1760 =C3=82=C2=B1 32%  sched_d=
ebug.cpu#11.ttwu_count
    145709 =C3=82=C2=B1  7%     -30.3%     101564 =C3=82=C2=B1  9%  sched_d=
ebug.cpu#11.nr_load_updates
    270996 =C3=82=C2=B1  1%    +229.9%     894099 =C3=82=C2=B1 14%  sched_d=
ebug.cpu#11.avg_idle
         2 =C3=82=C2=B1 37%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#11.cpu_load[3]
    185681 =C3=82=C2=B1 10%     -99.2%       1455 =C3=82=C2=B1 30%  sched_d=
ebug.cpu#11.ttwu_local
    873654 =C3=82=C2=B1 27%     -42.5%     502080 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#110.max_idle_balance_cost
    858843 =C3=82=C2=B1 30%     -41.1%     505597 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#111.max_idle_balance_cost
    872547 =C3=82=C2=B1 28%     -42.7%     500133 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#112.max_idle_balance_cost
    850260 =C3=82=C2=B1 28%     -40.6%     505082 =C3=82=C2=B1  2%  sched_d=
ebug.cpu#113.max_idle_balance_cost
    960366 =C3=82=C2=B1 23%     -47.8%     500984 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#114.max_idle_balance_cost
    869532 =C3=82=C2=B1 27%     -42.2%     502156 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#115.max_idle_balance_cost
    884039 =C3=82=C2=B1 27%     -42.9%     505044 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#116.max_idle_balance_cost
    855531 =C3=82=C2=B1 30%     -41.2%     502901 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#117.max_idle_balance_cost
    844778 =C3=82=C2=B1 29%     -40.2%     505544 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#118.max_idle_balance_cost
    867345 =C3=82=C2=B1 27%     -41.1%     510969 =C3=82=C2=B1  4%  sched_d=
ebug.cpu#119.max_idle_balance_cost
    145505 =C3=82=C2=B1  8%     -34.3%      95650 =C3=82=C2=B1 15%  sched_d=
ebug.cpu#12.nr_load_updates
         5 =C3=82=C2=B1 44%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#12.cpu_load[1]
    186685 =C3=82=C2=B1 11%     -99.3%       1223 =C3=82=C2=B1 33%  sched_d=
ebug.cpu#12.ttwu_local
         4 =C3=82=C2=B1 49%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#12.cpu_load[2]
    280891 =C3=82=C2=B1  3%    +222.5%     905991 =C3=82=C2=B1 14%  sched_d=
ebug.cpu#12.avg_idle
         3 =C3=82=C2=B1 39%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#12.cpu_load[3]
    187388 =C3=82=C2=B1 11%     -99.3%       1223 =C3=82=C2=B1 30%  sched_d=
ebug.cpu#13.ttwu_local
    145475 =C3=82=C2=B1  8%     -31.9%      99013 =C3=82=C2=B1 11%  sched_d=
ebug.cpu#13.nr_load_updates
    546320 =C3=82=C2=B1  8%     -99.7%       1508 =C3=82=C2=B1 21%  sched_d=
ebug.cpu#13.ttwu_count
         3 =C3=82=C2=B1 27%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#13.cpu_load[1]
    282818 =C3=82=C2=B1  5%    +212.5%     883684 =C3=82=C2=B1 13%  sched_d=
ebug.cpu#13.avg_idle
    145427 =C3=82=C2=B1  7%     -34.5%      95288 =C3=82=C2=B1 17%  sched_d=
ebug.cpu#14.nr_load_updates
         4 =C3=82=C2=B1 41%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#14.cpu_load[3]
    283614 =C3=82=C2=B1  6%    +204.3%     862952 =C3=82=C2=B1 17%  sched_d=
ebug.cpu#14.avg_idle
    548763 =C3=82=C2=B1 10%     -99.7%       1508 =C3=82=C2=B1 26%  sched_d=
ebug.cpu#14.ttwu_count
    187787 =C3=82=C2=B1 10%     -99.3%       1258 =C3=82=C2=B1 24%  sched_d=
ebug.cpu#14.ttwu_local
         4 =C3=82=C2=B1 46%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#14.cpu_load[2]
    910931 =C3=82=C2=B1 10%     -90.9%      83254 =C3=82=C2=B1 28%  sched_d=
ebug.cpu#15.sched_count
    401751 =C3=82=C2=B1 10%     -89.7%      41393 =C3=82=C2=B1 28%  sched_d=
ebug.cpu#15.sched_goidle
    532305 =C3=82=C2=B1  9%     -99.3%       3824 =C3=82=C2=B1 15%  sched_d=
ebug.cpu#15.ttwu_count
    227026 =C3=82=C2=B1 15%     -98.7%       2840 =C3=82=C2=B1 12%  sched_d=
ebug.cpu#15.ttwu_local
         2 =C3=82=C2=B1 46%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#15.cpu_load[2]
    907583 =C3=82=C2=B1 10%     -90.8%      83244 =C3=82=C2=B1 28%  sched_d=
ebug.cpu#15.nr_switches
    147307 =C3=82=C2=B1  8%     -64.1%      52925 =C3=82=C2=B1 18%  sched_d=
ebug.cpu#15.nr_load_updates
    271896 =C3=82=C2=B1 28%    +268.2%    1001194 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#15.avg_idle
    228547 =C3=82=C2=B1 14%     -99.6%       1006 =C3=82=C2=B1 46%  sched_d=
ebug.cpu#16.ttwu_local
    146688 =C3=82=C2=B1  7%     -64.8%      51642 =C3=82=C2=B1 18%  sched_d=
ebug.cpu#16.nr_load_updates
    538118 =C3=82=C2=B1 10%     -99.7%       1836 =C3=82=C2=B1 36%  sched_d=
ebug.cpu#16.ttwu_count
    401589 =C3=82=C2=B1  9%     -89.9%      40532 =C3=82=C2=B1 27%  sched_d=
ebug.cpu#16.sched_goidle
    912282 =C3=82=C2=B1 10%     -91.1%      81551 =C3=82=C2=B1 27%  sched_d=
ebug.cpu#16.sched_count
    274129 =C3=82=C2=B1 10%    +258.6%     983056 =C3=82=C2=B1  2%  sched_d=
ebug.cpu#16.avg_idle
    909937 =C3=82=C2=B1 10%     -91.0%      81542 =C3=82=C2=B1 27%  sched_d=
ebug.cpu#16.nr_switches
    399818 =C3=82=C2=B1 10%     -90.8%      36949 =C3=82=C2=B1 41%  sched_d=
ebug.cpu#17.sched_goidle
    251250 =C3=82=C2=B1 33%    +290.1%     980211 =C3=82=C2=B1  2%  sched_d=
ebug.cpu#17.avg_idle
    146193 =C3=82=C2=B1  8%     -67.5%      47493 =C3=82=C2=B1 30%  sched_d=
ebug.cpu#17.nr_load_updates
    907652 =C3=82=C2=B1 10%     -91.8%      74306 =C3=82=C2=B1 41%  sched_d=
ebug.cpu#17.sched_count
    905857 =C3=82=C2=B1 10%     -91.8%      74297 =C3=82=C2=B1 41%  sched_d=
ebug.cpu#17.nr_switches
    535902 =C3=82=C2=B1  9%     -99.7%       1645 =C3=82=C2=B1 28%  sched_d=
ebug.cpu#17.ttwu_count
    535263 =C3=82=C2=B1  9%     -99.6%       2125 =C3=82=C2=B1 33%  sched_d=
ebug.cpu#18.ttwu_count
    904084 =C3=82=C2=B1 11%     -93.0%      62907 =C3=82=C2=B1 44%  sched_d=
ebug.cpu#18.nr_switches
    274939 =C3=82=C2=B1  9%    +266.2%    1006769 =C3=82=C2=B1  2%  sched_d=
ebug.cpu#18.avg_idle
    226681 =C3=82=C2=B1 14%     -99.5%       1123 =C3=82=C2=B1 40%  sched_d=
ebug.cpu#18.ttwu_local
    905555 =C3=82=C2=B1 11%     -93.1%      62916 =C3=82=C2=B1 43%  sched_d=
ebug.cpu#18.sched_count
    146165 =C3=82=C2=B1  7%     -71.0%      42321 =C3=82=C2=B1 30%  sched_d=
ebug.cpu#18.nr_load_updates
    399028 =C3=82=C2=B1 10%     -92.2%      31022 =C3=82=C2=B1 44%  sched_d=
ebug.cpu#18.sched_goidle
    146308 =C3=82=C2=B1  8%     -71.5%      41686 =C3=82=C2=B1 35%  sched_d=
ebug.cpu#19.nr_load_updates
    529715 =C3=82=C2=B1  9%     -99.6%       2212 =C3=82=C2=B1 43%  sched_d=
ebug.cpu#19.ttwu_count
    296225 =C3=82=C2=B1 10%    +232.9%     986018 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#19.avg_idle
         3 =C3=82=C2=B1 38%    +605.3%         22 =C3=82=C2=B1 29%  sched_d=
ebug.cpu#2.cpu_load[2]
    683586 =C3=82=C2=B1  9%   +1403.7%   10278920 =C3=82=C2=B1 19%  sched_d=
ebug.cpu#2.sched_count
         3 =C3=82=C2=B1 41%    +460.9%         21 =C3=82=C2=B1 46%  sched_d=
ebug.cpu#2.cpu_load[1]
    420236 =C3=82=C2=B1  7%     -95.2%      20376 =C3=82=C2=B1 17%  sched_d=
ebug.cpu#2.ttwu_count
    154717 =C3=82=C2=B1 17%     -87.2%      19810 =C3=82=C2=B1 18%  sched_d=
ebug.cpu#2.ttwu_local
    680385 =C3=82=C2=B1  9%   +1410.7%   10278585 =C3=82=C2=B1 19%  sched_d=
ebug.cpu#2.nr_switches
    300978 =C3=82=C2=B1 12%     -50.5%     149090 =C3=82=C2=B1 40%  sched_d=
ebug.cpu#2.avg_idle
    300267 =C3=82=C2=B1 10%   +1608.3%    5129477 =C3=82=C2=B1 19%  sched_d=
ebug.cpu#2.sched_goidle
    226744 =C3=82=C2=B1 15%     -99.7%        791 =C3=82=C2=B1 12%  sched_d=
ebug.cpu#20.ttwu_local
         2 =C3=82=C2=B1 41%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#20.cpu_load[3]
    539626 =C3=82=C2=B1 11%     -99.7%       1714 =C3=82=C2=B1 13%  sched_d=
ebug.cpu#20.ttwu_count
         3 =C3=82=C2=B1 48%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#20.cpu_load[1]
    264020 =C3=82=C2=B1 16%    +277.1%     995578 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#20.avg_idle
    145629 =C3=82=C2=B1  7%     -72.8%      39540 =C3=82=C2=B1 38%  sched_d=
ebug.cpu#20.nr_load_updates
    525878 =C3=82=C2=B1 11%     -99.6%       1905 =C3=82=C2=B1 16%  sched_d=
ebug.cpu#21.ttwu_count
    145597 =C3=82=C2=B1  8%     -72.4%      40198 =C3=82=C2=B1 40%  sched_d=
ebug.cpu#21.nr_load_updates
         6 =C3=82=C2=B1 40%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#21.load
    226311 =C3=82=C2=B1 17%     -99.6%        954 =C3=82=C2=B1 17%  sched_d=
ebug.cpu#21.ttwu_local
         2 =C3=82=C2=B1 47%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#21.cpu_load[3]
    282162 =C3=82=C2=B1 10%    +268.8%    1040716 =C3=82=C2=B1  4%  sched_d=
ebug.cpu#21.avg_idle
         2 =C3=82=C2=B1 40%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#21.cpu_load[2]
         4 =C3=82=C2=B1 40%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#22.cpu_load[1]
         3 =C3=82=C2=B1 34%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#22.cpu_load[2]
    145443 =C3=82=C2=B1  7%     -73.8%      38078 =C3=82=C2=B1 39%  sched_d=
ebug.cpu#22.nr_load_updates
         2 =C3=82=C2=B1 47%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#22.cpu_load[3]
    547461 =C3=82=C2=B1 10%     -99.6%       2080 =C3=82=C2=B1 41%  sched_d=
ebug.cpu#22.ttwu_count
    293095 =C3=82=C2=B1  9%    +242.6%    1004209 =C3=82=C2=B1  2%  sched_d=
ebug.cpu#22.avg_idle
    538395 =C3=82=C2=B1 10%     -99.7%       1761 =C3=82=C2=B1 30%  sched_d=
ebug.cpu#23.ttwu_count
    145290 =C3=82=C2=B1  8%     -77.3%      33007 =C3=82=C2=B1 45%  sched_d=
ebug.cpu#23.nr_load_updates
    312631 =C3=82=C2=B1 11%    +217.5%     992648 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#23.avg_idle
         5 =C3=82=C2=B1 42%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#23.load
    274102 =C3=82=C2=B1  9%    +261.8%     991658 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#24.avg_idle
    145062 =C3=82=C2=B1  8%     -75.6%      35376 =C3=82=C2=B1 39%  sched_d=
ebug.cpu#24.nr_load_updates
    305640 =C3=82=C2=B1  8%    +215.8%     965318 =C3=82=C2=B1  7%  sched_d=
ebug.cpu#25.avg_idle
    554385 =C3=82=C2=B1  4%     -99.6%       2368 =C3=82=C2=B1 47%  sched_d=
ebug.cpu#25.ttwu_count
    146404 =C3=82=C2=B1  6%     -77.2%      33321 =C3=82=C2=B1 47%  sched_d=
ebug.cpu#25.nr_load_updates
    562613 =C3=82=C2=B1 11%     -99.6%       2233 =C3=82=C2=B1 32%  sched_d=
ebug.cpu#26.ttwu_count
         2 =C3=82=C2=B1 47%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#26.cpu_load[2]
    291842 =C3=82=C2=B1  8%    +239.5%     990850 =C3=82=C2=B1  4%  sched_d=
ebug.cpu#26.avg_idle
         3 =C3=82=C2=B1 37%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#27.cpu_load[2]
         4 =C3=82=C2=B1 44%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#27.cpu_load[1]
    296953 =C3=82=C2=B1  8%    +234.6%     993660 =C3=82=C2=B1  3%  sched_d=
ebug.cpu#27.avg_idle
    227387 =C3=82=C2=B1 14%     -99.6%        875 =C3=82=C2=B1 46%  sched_d=
ebug.cpu#28.ttwu_local
    541565 =C3=82=C2=B1  9%     -99.7%       1729 =C3=82=C2=B1 35%  sched_d=
ebug.cpu#28.ttwu_count
    287000 =C3=82=C2=B1  9%    +247.4%     996956 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#28.avg_idle
    292577 =C3=82=C2=B1  5%    +240.4%     995812 =C3=82=C2=B1  9%  sched_d=
ebug.cpu#29.avg_idle
         2 =C3=82=C2=B1 49%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#29.cpu_load[0]
         2 =C3=82=C2=B1 31%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#29.cpu_load[1]
         3 =C3=82=C2=B1 27%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#29.cpu_load[2]
    538059 =C3=82=C2=B1 11%     -99.6%       1942 =C3=82=C2=B1 46%  sched_d=
ebug.cpu#29.ttwu_count
         2 =C3=82=C2=B1 40%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#29.cpu_load[3]
    858348 =C3=82=C2=B1 11%    +988.5%    9343383 =C3=82=C2=B1 19%  sched_d=
ebug.cpu#3.nr_switches
    583644 =C3=82=C2=B1 14%     -96.9%      18374 =C3=82=C2=B1 19%  sched_d=
ebug.cpu#3.ttwu_count
    188558 =C3=82=C2=B1 11%     -90.6%      17658 =C3=82=C2=B1 20%  sched_d=
ebug.cpu#3.ttwu_local
    861080 =C3=82=C2=B1 11%    +985.1%    9343434 =C3=82=C2=B1 19%  sched_d=
ebug.cpu#3.sched_count
         3 =C3=82=C2=B1 28%    +325.0%         14 =C3=82=C2=B1 46%  sched_d=
ebug.cpu#3.cpu_load[2]
    283363 =C3=82=C2=B1  7%     -36.9%     178917 =C3=82=C2=B1  5%  sched_d=
ebug.cpu#3.avg_idle
         3 =C3=82=C2=B1 27%    +366.7%         14 =C3=82=C2=B1 35%  sched_d=
ebug.cpu#3.cpu_load[3]
    365993 =C3=82=C2=B1 11%   +1174.1%    4662957 =C3=82=C2=B1 19%  sched_d=
ebug.cpu#3.sched_goidle
    272296 =C3=82=C2=B1  5%    +263.0%     988390 =C3=82=C2=B1  3%  sched_d=
ebug.cpu#30.avg_idle
    886491 =C3=82=C2=B1  7%     -90.7%      82339 =C3=82=C2=B1 23%  sched_d=
ebug.cpu#30.nr_switches
    193322 =C3=82=C2=B1  6%     -99.6%        752 =C3=82=C2=B1 14%  sched_d=
ebug.cpu#30.ttwu_local
    890539 =C3=82=C2=B1  7%     -90.7%      82392 =C3=82=C2=B1 23%  sched_d=
ebug.cpu#30.sched_count
    145061 =C3=82=C2=B1  7%     -66.4%      48735 =C3=82=C2=B1 20%  sched_d=
ebug.cpu#30.nr_load_updates
    385340 =C3=82=C2=B1  7%     -89.4%      40937 =C3=82=C2=B1 23%  sched_d=
ebug.cpu#30.sched_goidle
    558855 =C3=82=C2=B1 11%     -99.7%       1486 =C3=82=C2=B1 14%  sched_d=
ebug.cpu#30.ttwu_count
    607204 =C3=82=C2=B1 10%     -99.7%       1669 =C3=82=C2=B1 28%  sched_d=
ebug.cpu#31.ttwu_count
    948582 =C3=82=C2=B1 13%     -92.4%      72412 =C3=82=C2=B1 23%  sched_d=
ebug.cpu#31.sched_count
    147499 =C3=82=C2=B1  6%     -70.2%      44027 =C3=82=C2=B1 20%  sched_d=
ebug.cpu#31.nr_load_updates
    231115 =C3=82=C2=B1 34%     -99.7%        707 =C3=82=C2=B1 17%  sched_d=
ebug.cpu#31.ttwu_local
    414152 =C3=82=C2=B1 16%     -91.3%      35947 =C3=82=C2=B1 23%  sched_d=
ebug.cpu#31.sched_goidle
    945517 =C3=82=C2=B1 13%     -92.3%      72360 =C3=82=C2=B1 23%  sched_d=
ebug.cpu#31.nr_switches
    269881 =C3=82=C2=B1 11%    +260.8%     973666 =C3=82=C2=B1  4%  sched_d=
ebug.cpu#31.avg_idle
    146258 =C3=82=C2=B1  6%     -72.3%      40536 =C3=82=C2=B1 31%  sched_d=
ebug.cpu#32.nr_load_updates
    212916 =C3=82=C2=B1 19%     -99.7%        682 =C3=82=C2=B1 15%  sched_d=
ebug.cpu#32.ttwu_local
    616801 =C3=82=C2=B1 13%     -99.8%       1439 =C3=82=C2=B1 11%  sched_d=
ebug.cpu#32.ttwu_count
    886655 =C3=82=C2=B1 10%     -92.6%      65901 =C3=82=C2=B1 36%  sched_d=
ebug.cpu#32.sched_count
    884019 =C3=82=C2=B1 10%     -92.6%      65851 =C3=82=C2=B1 36%  sched_d=
ebug.cpu#32.nr_switches
    287282 =C3=82=C2=B1  4%    +221.9%     924747 =C3=82=C2=B1  3%  sched_d=
ebug.cpu#32.avg_idle
    386416 =C3=82=C2=B1 11%     -91.5%      32707 =C3=82=C2=B1 36%  sched_d=
ebug.cpu#32.sched_goidle
    381805 =C3=82=C2=B1  6%     -92.2%      29619 =C3=82=C2=B1 35%  sched_d=
ebug.cpu#33.sched_goidle
    882037 =C3=82=C2=B1  6%     -93.2%      59641 =C3=82=C2=B1 35%  sched_d=
ebug.cpu#33.sched_count
    264381 =C3=82=C2=B1  4%    +251.9%     930329 =C3=82=C2=B1  7%  sched_d=
ebug.cpu#33.avg_idle
    580711 =C3=82=C2=B1 13%     -99.8%       1425 =C3=82=C2=B1  8%  sched_d=
ebug.cpu#33.ttwu_count
         2 =C3=82=C2=B1 37%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#33.cpu_load[2]
    198746 =C3=82=C2=B1  7%     -99.7%        677 =C3=82=C2=B1 13%  sched_d=
ebug.cpu#33.ttwu_local
    879687 =C3=82=C2=B1  6%     -93.2%      59612 =C3=82=C2=B1 35%  sched_d=
ebug.cpu#33.nr_switches
    145237 =C3=82=C2=B1  7%     -73.9%      37912 =C3=82=C2=B1 30%  sched_d=
ebug.cpu#33.nr_load_updates
    558432 =C3=82=C2=B1 12%     -99.7%       1937 =C3=82=C2=B1 40%  sched_d=
ebug.cpu#34.ttwu_count
    271737 =C3=82=C2=B1  6%    +267.3%     998140 =C3=82=C2=B1  8%  sched_d=
ebug.cpu#34.avg_idle
    144986 =C3=82=C2=B1  7%     -74.4%      37118 =C3=82=C2=B1 42%  sched_d=
ebug.cpu#34.nr_load_updates
    192853 =C3=82=C2=B1  6%     -99.6%        781 =C3=82=C2=B1 15%  sched_d=
ebug.cpu#34.ttwu_local
    255816 =C3=82=C2=B1 24%    +287.7%     991833 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#35.avg_idle
    144906 =C3=82=C2=B1  7%     -74.4%      37168 =C3=82=C2=B1 35%  sched_d=
ebug.cpu#35.nr_load_updates
    554138 =C3=82=C2=B1 12%     -99.7%       1813 =C3=82=C2=B1  9%  sched_d=
ebug.cpu#35.ttwu_count
    379077 =C3=82=C2=B1  6%     -92.2%      29594 =C3=82=C2=B1 42%  sched_d=
ebug.cpu#35.sched_goidle
    879048 =C3=82=C2=B1  7%     -93.2%      59608 =C3=82=C2=B1 42%  sched_d=
ebug.cpu#35.sched_count
    876729 =C3=82=C2=B1  7%     -93.2%      59559 =C3=82=C2=B1 42%  sched_d=
ebug.cpu#35.nr_switches
    192396 =C3=82=C2=B1  6%     -99.6%        796 =C3=82=C2=B1 19%  sched_d=
ebug.cpu#35.ttwu_local
    144811 =C3=82=C2=B1  7%     -76.8%      33645 =C3=82=C2=B1 44%  sched_d=
ebug.cpu#36.nr_load_updates
    198260 =C3=82=C2=B1  3%     -99.7%        681 =C3=82=C2=B1 15%  sched_d=
ebug.cpu#36.ttwu_local
         3 =C3=82=C2=B1 38%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#36.cpu_load[2]
    608120 =C3=82=C2=B1 19%     -99.7%       1607 =C3=82=C2=B1 10%  sched_d=
ebug.cpu#36.ttwu_count
    272324 =C3=82=C2=B1 10%    +271.7%    1012309 =C3=82=C2=B1  4%  sched_d=
ebug.cpu#36.avg_idle
         4 =C3=82=C2=B1 47%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#36.cpu_load[0]
         3 =C3=82=C2=B1 48%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#36.cpu_load[1]
    144880 =C3=82=C2=B1  8%     -75.5%      35491 =C3=82=C2=B1 42%  sched_d=
ebug.cpu#37.nr_load_updates
    551377 =C3=82=C2=B1 10%     -99.7%       1487 =C3=82=C2=B1 10%  sched_d=
ebug.cpu#37.ttwu_count
    193906 =C3=82=C2=B1  7%     -99.6%        680 =C3=82=C2=B1 18%  sched_d=
ebug.cpu#37.ttwu_local
    277677 =C3=82=C2=B1  3%    +256.2%     989065 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#37.avg_idle
         4 =C3=82=C2=B1 49%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#38.cpu_load[1]
    271911 =C3=82=C2=B1  6%    +259.7%     978143 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#38.avg_idle
         4 =C3=82=C2=B1 37%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#38.cpu_load[2]
    588979 =C3=82=C2=B1 20%     -99.7%       1876 =C3=82=C2=B1 49%  sched_d=
ebug.cpu#38.ttwu_count
    195832 =C3=82=C2=B1  6%     -99.7%        662 =C3=82=C2=B1 13%  sched_d=
ebug.cpu#38.ttwu_local
         3 =C3=82=C2=B1 42%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#38.cpu_load[3]
    859499 =C3=82=C2=B1  7%     -94.2%      49501 =C3=82=C2=B1 48%  sched_d=
ebug.cpu#39.nr_switches
    197080 =C3=82=C2=B1  5%     -99.7%        616 =C3=82=C2=B1 14%  sched_d=
ebug.cpu#39.ttwu_local
    144875 =C3=82=C2=B1  8%     -78.5%      31180 =C3=82=C2=B1 38%  sched_d=
ebug.cpu#39.nr_load_updates
    861583 =C3=82=C2=B1  7%     -94.2%      50175 =C3=82=C2=B1 46%  sched_d=
ebug.cpu#39.sched_count
    372809 =C3=82=C2=B1  7%     -93.4%      24588 =C3=82=C2=B1 48%  sched_d=
ebug.cpu#39.sched_goidle
    585682 =C3=82=C2=B1 15%     -99.8%       1422 =C3=82=C2=B1 11%  sched_d=
ebug.cpu#39.ttwu_count
    254598 =C3=82=C2=B1 28%    +291.0%     995522 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#39.avg_idle
    384496 =C3=82=C2=B1  7%    +624.1%    2784133 =C3=82=C2=B1 20%  sched_d=
ebug.cpu#4.sched_goidle
    903009 =C3=82=C2=B1  6%    +517.8%    5579241 =C3=82=C2=B1 20%  sched_d=
ebug.cpu#4.sched_count
    900237 =C3=82=C2=B1  6%    +519.7%    5579190 =C3=82=C2=B1 20%  sched_d=
ebug.cpu#4.nr_switches
    556589 =C3=82=C2=B1  9%     -97.9%      11720 =C3=82=C2=B1 21%  sched_d=
ebug.cpu#4.ttwu_count
    193650 =C3=82=C2=B1 19%     -94.2%      11155 =C3=82=C2=B1 20%  sched_d=
ebug.cpu#4.ttwu_local
    279229 =C3=82=C2=B1  6%    +261.3%    1008863 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#40.avg_idle
    564514 =C3=82=C2=B1 13%     -99.8%       1408 =C3=82=C2=B1 18%  sched_d=
ebug.cpu#40.ttwu_count
         2 =C3=82=C2=B1 37%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#40.cpu_load[0]
         2 =C3=82=C2=B1 47%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#40.cpu_load[4]
    196449 =C3=82=C2=B1  8%     -99.7%        599 =C3=82=C2=B1 25%  sched_d=
ebug.cpu#40.ttwu_local
    195020 =C3=82=C2=B1  4%     -99.7%        665 =C3=82=C2=B1 32%  sched_d=
ebug.cpu#41.ttwu_local
    569391 =C3=82=C2=B1 15%     -99.7%       1443 =C3=82=C2=B1 22%  sched_d=
ebug.cpu#41.ttwu_count
    250174 =C3=82=C2=B1 24%    +299.0%     998144 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#41.avg_idle
         7 =C3=82=C2=B1 46%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#41.load
    271444 =C3=82=C2=B1  4%    +267.2%     996765 =C3=82=C2=B1  3%  sched_d=
ebug.cpu#42.avg_idle
         3 =C3=82=C2=B1 35%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#42.cpu_load[2]
         4 =C3=82=C2=B1 43%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#42.cpu_load[1]
         3 =C3=82=C2=B1 27%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#42.cpu_load[3]
    594265 =C3=82=C2=B1 15%     -99.8%       1417 =C3=82=C2=B1 26%  sched_d=
ebug.cpu#42.ttwu_count
    198649 =C3=82=C2=B1  7%     -99.7%        578 =C3=82=C2=B1 29%  sched_d=
ebug.cpu#42.ttwu_local
    270822 =C3=82=C2=B1  9%    +262.7%     982391 =C3=82=C2=B1  2%  sched_d=
ebug.cpu#43.avg_idle
         3 =C3=82=C2=B1 14%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#43.cpu_load[2]
    595801 =C3=82=C2=B1 15%     -99.8%       1474 =C3=82=C2=B1 35%  sched_d=
ebug.cpu#43.ttwu_count
         2 =C3=82=C2=B1 24%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#43.cpu_load[3]
    199411 =C3=82=C2=B1  4%     -99.7%        613 =C3=82=C2=B1 22%  sched_d=
ebug.cpu#43.ttwu_local
         4 =C3=82=C2=B1 25%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#43.cpu_load[1]
         5 =C3=82=C2=B1 23%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#43.cpu_load[0]
    144742 =C3=82=C2=B1  8%     -79.2%      30152 =C3=82=C2=B1 47%  sched_d=
ebug.cpu#43.nr_load_updates
    276311 =C3=82=C2=B1  3%    +258.0%     989070 =C3=82=C2=B1  2%  sched_d=
ebug.cpu#44.avg_idle
    582806 =C3=82=C2=B1 15%     -99.8%       1362 =C3=82=C2=B1 30%  sched_d=
ebug.cpu#44.ttwu_count
    144761 =C3=82=C2=B1  8%     -80.1%      28756 =C3=82=C2=B1 45%  sched_d=
ebug.cpu#44.nr_load_updates
    144710 =C3=82=C2=B1  7%     -67.6%      46849 =C3=82=C2=B1 27%  sched_d=
ebug.cpu#45.nr_load_updates
    851364 =C3=82=C2=B1 13%     -90.0%      85464 =C3=82=C2=B1 31%  sched_d=
ebug.cpu#45.sched_count
    847235 =C3=82=C2=B1 13%     -89.9%      85423 =C3=82=C2=B1 31%  sched_d=
ebug.cpu#45.nr_switches
    372059 =C3=82=C2=B1 14%     -88.6%      42469 =C3=82=C2=B1 31%  sched_d=
ebug.cpu#45.sched_goidle
    203310 =C3=82=C2=B1 19%     -99.6%        843 =C3=82=C2=B1 17%  sched_d=
ebug.cpu#45.ttwu_local
    281126 =C3=82=C2=B1  7%    +253.4%     993587 =C3=82=C2=B1  5%  sched_d=
ebug.cpu#45.avg_idle
    573414 =C3=82=C2=B1 12%     -99.7%       1515 =C3=82=C2=B1 21%  sched_d=
ebug.cpu#45.ttwu_count
    861853 =C3=82=C2=B1 12%     -92.4%      65635 =C3=82=C2=B1 43%  sched_d=
ebug.cpu#46.nr_switches
    273192 =C3=82=C2=B1  7%    +268.5%    1006815 =C3=82=C2=B1  2%  sched_d=
ebug.cpu#46.avg_idle
    864903 =C3=82=C2=B1 12%     -92.4%      65678 =C3=82=C2=B1 43%  sched_d=
ebug.cpu#46.sched_count
    376696 =C3=82=C2=B1 13%     -91.3%      32592 =C3=82=C2=B1 43%  sched_d=
ebug.cpu#46.sched_goidle
    552783 =C3=82=C2=B1  9%     -99.7%       1450 =C3=82=C2=B1 14%  sched_d=
ebug.cpu#46.ttwu_count
    201314 =C3=82=C2=B1 20%     -99.6%        706 =C3=82=C2=B1 19%  sched_d=
ebug.cpu#46.ttwu_local
    144703 =C3=82=C2=B1  7%     -74.6%      36762 =C3=82=C2=B1 34%  sched_d=
ebug.cpu#46.nr_load_updates
       589 =C3=82=C2=B1 34%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#46.curr->pid
    584555 =C3=82=C2=B1  7%     -99.7%       1599 =C3=82=C2=B1 16%  sched_d=
ebug.cpu#47.ttwu_count
    203884 =C3=82=C2=B1 19%     -99.6%        723 =C3=82=C2=B1 23%  sched_d=
ebug.cpu#47.ttwu_local
    144799 =C3=82=C2=B1  7%     -76.4%      34218 =C3=82=C2=B1 46%  sched_d=
ebug.cpu#47.nr_load_updates
    274538 =C3=82=C2=B1  6%    +260.1%     988726 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#47.avg_idle
         3 =C3=82=C2=B1 35%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#48.cpu_load[1]
    144673 =C3=82=C2=B1  8%     -78.2%      31538 =C3=82=C2=B1 48%  sched_d=
ebug.cpu#48.nr_load_updates
    543724 =C3=82=C2=B1  4%     -99.7%       1672 =C3=82=C2=B1 18%  sched_d=
ebug.cpu#48.ttwu_count
    199514 =C3=82=C2=B1 22%     -99.7%        684 =C3=82=C2=B1 34%  sched_d=
ebug.cpu#48.ttwu_local
         2 =C3=82=C2=B1 37%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#48.cpu_load[2]
         3 =C3=82=C2=B1 44%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#48.cpu_load[0]
    280359 =C3=82=C2=B1  8%    +263.5%    1019216 =C3=82=C2=B1  4%  sched_d=
ebug.cpu#48.avg_idle
    564757 =C3=82=C2=B1  6%     -99.7%       1635 =C3=82=C2=B1 18%  sched_d=
ebug.cpu#49.ttwu_count
    203456 =C3=82=C2=B1 21%     -99.7%        710 =C3=82=C2=B1 29%  sched_d=
ebug.cpu#49.ttwu_local
    144637 =C3=82=C2=B1  7%     -78.9%      30527 =C3=82=C2=B1 47%  sched_d=
ebug.cpu#49.nr_load_updates
    302435 =C3=82=C2=B1 19%    +233.8%    1009483 =C3=82=C2=B1  3%  sched_d=
ebug.cpu#49.avg_idle
         7 =C3=82=C2=B1 35%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#5.load
    576004 =C3=82=C2=B1 11%     -99.5%       2984 =C3=82=C2=B1 18%  sched_d=
ebug.cpu#5.ttwu_count
    184101 =C3=82=C2=B1 10%     -98.6%       2497 =C3=82=C2=B1 17%  sched_d=
ebug.cpu#5.ttwu_local
    256732 =C3=82=C2=B1  5%    +131.1%     593404 =C3=82=C2=B1 27%  sched_d=
ebug.cpu#5.avg_idle
         2 =C3=82=C2=B1 49%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#50.cpu_load[3]
    200344 =C3=82=C2=B1 20%     -99.7%        688 =C3=82=C2=B1 28%  sched_d=
ebug.cpu#50.ttwu_local
         2 =C3=82=C2=B1 31%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#50.cpu_load[2]
    563146 =C3=82=C2=B1  5%     -99.7%       1908 =C3=82=C2=B1 44%  sched_d=
ebug.cpu#50.ttwu_count
         2 =C3=82=C2=B1 41%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#50.cpu_load[1]
    244904 =C3=82=C2=B1 22%    +302.4%     985599 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#50.avg_idle
    144490 =C3=82=C2=B1  7%     -79.9%      29035 =C3=82=C2=B1 47%  sched_d=
ebug.cpu#51.nr_load_updates
    273633 =C3=82=C2=B1  7%    +265.2%     999259 =C3=82=C2=B1  2%  sched_d=
ebug.cpu#51.avg_idle
    555030 =C3=82=C2=B1  5%     -99.7%       1398 =C3=82=C2=B1 23%  sched_d=
ebug.cpu#51.ttwu_count
    202800 =C3=82=C2=B1 21%     -99.7%        617 =C3=82=C2=B1 28%  sched_d=
ebug.cpu#51.ttwu_local
    204402 =C3=82=C2=B1 20%     -99.7%        672 =C3=82=C2=B1 35%  sched_d=
ebug.cpu#52.ttwu_local
         6 =C3=82=C2=B1 37%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#52.cpu_load[2]
    266105 =C3=82=C2=B1  8%    +268.6%     980753 =C3=82=C2=B1  3%  sched_d=
ebug.cpu#52.avg_idle
         8 =C3=82=C2=B1 40%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#52.cpu_load[1]
         4 =C3=82=C2=B1 33%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#52.cpu_load[3]
    590313 =C3=82=C2=B1 10%     -99.8%       1394 =C3=82=C2=B1 15%  sched_d=
ebug.cpu#52.ttwu_count
    246340 =C3=82=C2=B1 20%    +293.7%     969729 =C3=82=C2=B1  5%  sched_d=
ebug.cpu#53.avg_idle
    580316 =C3=82=C2=B1 10%     -99.7%       1479 =C3=82=C2=B1 17%  sched_d=
ebug.cpu#53.ttwu_count
    202868 =C3=82=C2=B1 20%     -99.7%        559 =C3=82=C2=B1 24%  sched_d=
ebug.cpu#53.ttwu_local
    275898 =C3=82=C2=B1  8%    +251.8%     970687 =C3=82=C2=B1  6%  sched_d=
ebug.cpu#54.avg_idle
    580835 =C3=82=C2=B1 12%     -99.8%       1420 =C3=82=C2=B1 27%  sched_d=
ebug.cpu#54.ttwu_count
    203860 =C3=82=C2=B1 21%     -99.7%        669 =C3=82=C2=B1 25%  sched_d=
ebug.cpu#54.ttwu_local
    561511 =C3=82=C2=B1 12%     -99.8%       1320 =C3=82=C2=B1 32%  sched_d=
ebug.cpu#55.ttwu_count
    199859 =C3=82=C2=B1 21%     -99.7%        615 =C3=82=C2=B1 44%  sched_d=
ebug.cpu#55.ttwu_local
    269166 =C3=82=C2=B1  3%    +267.9%     990163 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#55.avg_idle
    592219 =C3=82=C2=B1 10%     -99.8%       1394 =C3=82=C2=B1 20%  sched_d=
ebug.cpu#56.ttwu_count
    203190 =C3=82=C2=B1 20%     -99.7%        622 =C3=82=C2=B1 21%  sched_d=
ebug.cpu#56.ttwu_local
    285148 =C3=82=C2=B1  8%    +244.9%     983467 =C3=82=C2=B1  2%  sched_d=
ebug.cpu#56.avg_idle
    289395 =C3=82=C2=B1  8%    +243.8%     994802 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#57.avg_idle
    201174 =C3=82=C2=B1 22%     -99.7%        588 =C3=82=C2=B1 32%  sched_d=
ebug.cpu#57.ttwu_local
    561875 =C3=82=C2=B1  9%     -99.8%       1333 =C3=82=C2=B1 32%  sched_d=
ebug.cpu#57.ttwu_count
    532410 =C3=82=C2=B1 13%     -99.8%       1321 =C3=82=C2=B1 14%  sched_d=
ebug.cpu#58.ttwu_count
    199150 =C3=82=C2=B1 23%     -99.7%        623 =C3=82=C2=B1 30%  sched_d=
ebug.cpu#58.ttwu_local
    281144 =C3=82=C2=B1  9%    +248.6%     979942 =C3=82=C2=B1  4%  sched_d=
ebug.cpu#58.avg_idle
    206191 =C3=82=C2=B1 20%     -99.7%        576 =C3=82=C2=B1 34%  sched_d=
ebug.cpu#59.ttwu_local
    290618 =C3=82=C2=B1  4%    +237.8%     981621 =C3=82=C2=B1  2%  sched_d=
ebug.cpu#59.avg_idle
    568974 =C3=82=C2=B1  8%     -99.8%       1378 =C3=82=C2=B1 21%  sched_d=
ebug.cpu#59.ttwu_count
    145823 =C3=82=C2=B1  7%     -17.5%     120332 =C3=82=C2=B1  3%  sched_d=
ebug.cpu#6.nr_load_updates
    179817 =C3=82=C2=B1 10%     -99.1%       1693 =C3=82=C2=B1 19%  sched_d=
ebug.cpu#6.ttwu_local
    546345 =C3=82=C2=B1  8%     -99.6%       2115 =C3=82=C2=B1 21%  sched_d=
ebug.cpu#6.ttwu_count
    278607 =C3=82=C2=B1  3%    +199.1%     833241 =C3=82=C2=B1 18%  sched_d=
ebug.cpu#6.avg_idle
         2 =C3=82=C2=B1 47%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#6.cpu_load[3]
    851921 =C3=82=C2=B1  8%     -40.4%     508151 =C3=82=C2=B1 46%  sched_d=
ebug.cpu#6.nr_switches
    854405 =C3=82=C2=B1  8%     -40.5%     508206 =C3=82=C2=B1 46%  sched_d=
ebug.cpu#6.sched_count
         1 =C3=82=C2=B1 35%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#6.cpu_load[4]
    137215 =C3=82=C2=B1  8%     -92.7%       9982 =C3=82=C2=B1 37%  sched_d=
ebug.cpu#60.nr_load_updates
    916934 =C3=82=C2=B1  7%     -39.4%     555767 =C3=82=C2=B1 14%  sched_d=
ebug.cpu#60.max_idle_balance_cost
    496648 =C3=82=C2=B1 21%    +124.0%    1112535 =C3=82=C2=B1 14%  sched_d=
ebug.cpu#60.avg_idle
    523174 =C3=82=C2=B1 17%     +90.8%     997981 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#61.avg_idle
    207882 =C3=82=C2=B1 14%     -99.9%        283 =C3=82=C2=B1 41%  sched_d=
ebug.cpu#61.ttwu_local
    925690 =C3=82=C2=B1  4%     -45.3%     506045 =C3=82=C2=B1  2%  sched_d=
ebug.cpu#61.max_idle_balance_cost
    303435 =C3=82=C2=B1 20%     -99.8%        571 =C3=82=C2=B1 21%  sched_d=
ebug.cpu#61.ttwu_count
    203648 =C3=82=C2=B1 13%     -99.9%        158 =C3=82=C2=B1 29%  sched_d=
ebug.cpu#62.ttwu_local
    904843 =C3=82=C2=B1  5%     -44.4%     502645 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#62.max_idle_balance_cost
    305661 =C3=82=C2=B1 24%     -99.9%        261 =C3=82=C2=B1 30%  sched_d=
ebug.cpu#62.ttwu_count
       529 =C3=82=C2=B1 32%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#62.curr->pid
   1080713 =C3=82=C2=B1 10%     -53.7%     500459 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#63.max_idle_balance_cost
   1699969 =C3=82=C2=B1 10%     -41.0%    1003536 =C3=82=C2=B1  2%  sched_d=
ebug.cpu#64.avg_idle
   1096675 =C3=82=C2=B1  9%     -54.0%     504808 =C3=82=C2=B1  2%  sched_d=
ebug.cpu#64.max_idle_balance_cost
      2374 =C3=82=C2=B1 48%     -91.1%        211 =C3=82=C2=B1 27%  sched_d=
ebug.cpu#64.ttwu_count
   1073352 =C3=82=C2=B1  9%     -51.1%     524554 =C3=82=C2=B1  7%  sched_d=
ebug.cpu#65.max_idle_balance_cost
   1599502 =C3=82=C2=B1  9%     -34.4%    1049932 =C3=82=C2=B1  7%  sched_d=
ebug.cpu#65.avg_idle
     39322 =C3=82=C2=B1 42%     -72.4%      10848 =C3=82=C2=B1 40%  sched_d=
ebug.cpu#66.nr_load_updates
   1409179 =C3=82=C2=B1 19%     -27.9%    1015680 =C3=82=C2=B1  3%  sched_d=
ebug.cpu#66.avg_idle
   1076703 =C3=82=C2=B1  7%     -52.6%     510769 =C3=82=C2=B1  4%  sched_d=
ebug.cpu#66.max_idle_balance_cost
   1086785 =C3=82=C2=B1  9%     -53.0%     510290 =C3=82=C2=B1  4%  sched_d=
ebug.cpu#67.max_idle_balance_cost
   1411451 =C3=82=C2=B1 16%     -29.9%     989837 =C3=82=C2=B1  2%  sched_d=
ebug.cpu#68.avg_idle
     38684 =C3=82=C2=B1 43%     -66.9%      12790 =C3=82=C2=B1 34%  sched_d=
ebug.cpu#68.nr_load_updates
   1108217 =C3=82=C2=B1  7%     -54.9%     500229 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#68.max_idle_balance_cost
   1077891 =C3=82=C2=B1  7%     -47.7%     563733 =C3=82=C2=B1 22%  sched_d=
ebug.cpu#69.max_idle_balance_cost
    566207 =C3=82=C2=B1  7%     -99.7%       1748 =C3=82=C2=B1 21%  sched_d=
ebug.cpu#7.ttwu_count
    262075 =C3=82=C2=B1  9%    +236.5%     881956 =C3=82=C2=B1 13%  sched_d=
ebug.cpu#7.avg_idle
    838568 =C3=82=C2=B1  9%     -53.9%     386340 =C3=82=C2=B1 44%  sched_d=
ebug.cpu#7.sched_count
    357789 =C3=82=C2=B1  9%     -46.2%     192547 =C3=82=C2=B1 44%  sched_d=
ebug.cpu#7.sched_goidle
    836222 =C3=82=C2=B1  9%     -53.8%     386289 =C3=82=C2=B1 44%  sched_d=
ebug.cpu#7.nr_switches
    145736 =C3=82=C2=B1  7%     -22.7%     112707 =C3=82=C2=B1  3%  sched_d=
ebug.cpu#7.nr_load_updates
    182859 =C3=82=C2=B1 10%     -99.2%       1443 =C3=82=C2=B1 23%  sched_d=
ebug.cpu#7.ttwu_local
   1073432 =C3=82=C2=B1 10%     -51.3%     522486 =C3=82=C2=B1  8%  sched_d=
ebug.cpu#70.max_idle_balance_cost
   1530831 =C3=82=C2=B1 15%     -35.2%     992013 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#71.avg_idle
   1054705 =C3=82=C2=B1  6%     -52.6%     500000 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#71.max_idle_balance_cost
   1069098 =C3=82=C2=B1  9%     -50.7%     527311 =C3=82=C2=B1  9%  sched_d=
ebug.cpu#72.max_idle_balance_cost
     38445 =C3=82=C2=B1 45%     -61.5%      14811 =C3=82=C2=B1 40%  sched_d=
ebug.cpu#72.nr_load_updates
   1356913 =C3=82=C2=B1 13%     -22.4%    1053465 =C3=82=C2=B1  9%  sched_d=
ebug.cpu#72.avg_idle
   1332336 =C3=82=C2=B1 10%     -26.8%     975029 =C3=82=C2=B1  6%  sched_d=
ebug.cpu#73.avg_idle
   1058495 =C3=82=C2=B1  8%     -51.8%     510063 =C3=82=C2=B1  3%  sched_d=
ebug.cpu#73.max_idle_balance_cost
         2 =C3=82=C2=B1 47%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#73.cpu_load[1]
   1067890 =C3=82=C2=B1  8%     -52.7%     504615 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#74.max_idle_balance_cost
    682497 =C3=82=C2=B1 27%     -26.7%     500478 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#76.max_idle_balance_cost
    693411 =C3=82=C2=B1 28%     -27.4%     503241 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#77.max_idle_balance_cost
    734302 =C3=82=C2=B1 27%     -30.9%     507513 =C3=82=C2=B1  2%  sched_d=
ebug.cpu#78.max_idle_balance_cost
    681179 =C3=82=C2=B1 28%     -21.9%     531938 =C3=82=C2=B1 10%  sched_d=
ebug.cpu#79.max_idle_balance_cost
    540200 =C3=82=C2=B1  8%     -99.7%       1700 =C3=82=C2=B1 13%  sched_d=
ebug.cpu#8.ttwu_count
    178504 =C3=82=C2=B1 11%     -99.2%       1373 =C3=82=C2=B1 19%  sched_d=
ebug.cpu#8.ttwu_local
    145742 =C3=82=C2=B1  7%     -25.5%     108570 =C3=82=C2=B1  3%  sched_d=
ebug.cpu#8.nr_load_updates
    361282 =C3=82=C2=B1  8%     -51.3%     176052 =C3=82=C2=B1 43%  sched_d=
ebug.cpu#8.sched_goidle
    276970 =C3=82=C2=B1  8%    +230.5%     915429 =C3=82=C2=B1 10%  sched_d=
ebug.cpu#8.avg_idle
    846491 =C3=82=C2=B1  7%     -58.3%     353331 =C3=82=C2=B1 43%  sched_d=
ebug.cpu#8.sched_count
    843911 =C3=82=C2=B1  7%     -58.1%     353246 =C3=82=C2=B1 43%  sched_d=
ebug.cpu#8.nr_switches
      1359 =C3=82=C2=B1 48%     -59.4%        552 =C3=82=C2=B1  9%  sched_d=
ebug.cpu#81.ttwu_count
    682840 =C3=82=C2=B1 27%     -26.2%     503819 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#81.max_idle_balance_cost
    680252 =C3=82=C2=B1 27%     -24.4%     513984 =C3=82=C2=B1  4%  sched_d=
ebug.cpu#82.max_idle_balance_cost
    688877 =C3=82=C2=B1 33%     -26.0%     509483 =C3=82=C2=B1  3%  sched_d=
ebug.cpu#83.max_idle_balance_cost
    670276 =C3=82=C2=B1 22%     -24.9%     503665 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#85.max_idle_balance_cost
    680305 =C3=82=C2=B1 22%     -25.8%     504652 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#86.max_idle_balance_cost
      1390 =C3=82=C2=B1 44%     -65.2%        483 =C3=82=C2=B1  6%  sched_d=
ebug.cpu#87.ttwu_count
    711200 =C3=82=C2=B1 26%     -29.2%     503212 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#88.max_idle_balance_cost
    649693 =C3=82=C2=B1 26%     -22.7%     502075 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#89.max_idle_balance_cost
    531933 =C3=82=C2=B1  7%     -99.7%       1700 =C3=82=C2=B1 30%  sched_d=
ebug.cpu#9.ttwu_count
    180813 =C3=82=C2=B1 10%     -99.2%       1424 =C3=82=C2=B1 27%  sched_d=
ebug.cpu#9.ttwu_local
    855358 =C3=82=C2=B1  8%     -58.0%     359635 =C3=82=C2=B1 48%  sched_d=
ebug.cpu#9.nr_switches
    857752 =C3=82=C2=B1  8%     -58.1%     359679 =C3=82=C2=B1 48%  sched_d=
ebug.cpu#9.sched_count
    366428 =C3=82=C2=B1  8%     -51.1%     179269 =C3=82=C2=B1 48%  sched_d=
ebug.cpu#9.sched_goidle
    255284 =C3=82=C2=B1 21%    +256.0%     908885 =C3=82=C2=B1 12%  sched_d=
ebug.cpu#9.avg_idle
    145661 =C3=82=C2=B1  7%     -28.0%     104899 =C3=82=C2=B1  5%  sched_d=
ebug.cpu#9.nr_load_updates
         3 =C3=82=C2=B1 33%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#9.cpu_load[2]
         2 =C3=82=C2=B1 38%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#9.cpu_load[3]
         3 =C3=82=C2=B1 40%    -100.0%          0 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#9.cpu_load[1]
    880077 =C3=82=C2=B1 25%     -43.2%     500000 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#90.max_idle_balance_cost
   1270327 =C3=82=C2=B1 11%     -21.3%    1000000 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#91.avg_idle
    886286 =C3=82=C2=B1 22%     -43.6%     500000 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#91.max_idle_balance_cost
    861842 =C3=82=C2=B1 25%     -42.0%     500000 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#92.max_idle_balance_cost
    877600 =C3=82=C2=B1 26%     -37.3%     550542 =C3=82=C2=B1 20%  sched_d=
ebug.cpu#93.max_idle_balance_cost
    872812 =C3=82=C2=B1 25%     -42.7%     500149 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#94.max_idle_balance_cost
    880573 =C3=82=C2=B1 26%     -43.0%     501897 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#95.max_idle_balance_cost
    898390 =C3=82=C2=B1 24%     -43.6%     506730 =C3=82=C2=B1  2%  sched_d=
ebug.cpu#96.max_idle_balance_cost
   1233750 =C3=82=C2=B1 15%     -17.9%    1013461 =C3=82=C2=B1  2%  sched_d=
ebug.cpu#96.avg_idle
   1279764 =C3=82=C2=B1 17%     -22.4%     993620 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#97.avg_idle
    887849 =C3=82=C2=B1 23%     -43.7%     500000 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#97.max_idle_balance_cost
    881541 =C3=82=C2=B1 22%     -43.0%     502208 =C3=82=C2=B1  0%  sched_d=
ebug.cpu#98.max_idle_balance_cost
    883063 =C3=82=C2=B1 25%     -43.1%     502857 =C3=82=C2=B1  1%  sched_d=
ebug.cpu#99.max_idle_balance_cost

brickland3: Brickland Ivy Bridge-EX
Memory: 512G




            stderr.netperf:send_omni:recv_data_failed:No_route_to_host

    1 ++----------------*-----*--------*------*----------------------------=
-*
      |                 :     :        :      :                            =
 |
      |                 :     :        ::     :                            =
 |
  0.8 ++               : :   : :      : :    : :                           =
:|
      |                : :   : :      : :    : :                           =
:|
      |                : :   : :      : :    : :                           =
:|
  0.6 ++               : :   : :      :  :   : :                           =
:|
      |                :  :  :  :     :  :   :  :                          =
:|
  0.4 ++              :   : :   :    :   :  :   :                         :=
 |
      |               :   : :   :    :    : :   :                         :=
 |
      |               :   : :   :    :    : :   :                         :=
 |
  0.2 ++              :   : :   :    :    : :   :                         :=
 |
      |              :     :     :  :     ::     :                       : =
 |
      |              :     :     :  :      :     :                       : =
 |
    0 *+-*--*--*--*--*-----*-----*--*------*-----*--*--*--*--*--*--*--*--*-=
-+


                                last_state.booting

    1 ++------------------------------------------------------*------------=
-*
      |                                                       :            =
 |
      |                                                       ::           =
 |
  0.8 ++                                                     : :           =
:|
      |                                                      : :           =
:|
      |                                                      : :           =
:|
  0.6 ++                                                     :  :          =
:|
      |                                                      :  :          =
:|
  0.4 ++                                                    :   :         :=
 |
      |                                                     :    :        :=
 |
      |                                                     :    :        :=
 |
  0.2 ++                                                    :    :        :=
 |
      |                                                    :     :       : =
 |
      |                                                    :      :      : =
 |
    0 *+--*--*---*--*---*--*---*--*---*--*---*--*---*--*---*------*--*---*-=
-+


                                   softirqs.TIMER

  6e+06 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  5e+06 ++                                                 *               =
 |
        |  .*.                                            +:               =
 |
        |.*   *.*.*. .*    *   *   *.*     *.*         *.* :   .*.*.*.*.*.*=
.*
  4e+06 *+          * :    :   :   : :     : :     *   :   :  *            =
 |
        |              :   :   :: :  :     : :     :  :    :  :            =
 |
  3e+06 ++             :  : : : : :   :   :   :    :: :    :  :            =
 |
        |              :  : : : : :   :   :   :   : : :     ::             =
 |
  2e+06 ++             :  : : : : :   :   :   :   : : :     ::             =
 |
        |               : : : :  :    :   :   :   :  :      ::             =
 |
        |               *:   :   *    :   :   :   :  *      ::             =
 |
  1e+06 O+  O   O O   O  O   O O   O   O : O   O : O   O O OO O O O O      =
 |
        | O   O         O* O *         : :   O : :   O      *              =
 |
      0 ++----------O------------O---O-*-O-----*-O-------------------------=
-+


                                   softirqs.NET_RX

  7e+07 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  6e+07 *+*.*.*.*.*   *    *   *   *.*     *.*     *   *.*.*  *.*.*.*.*.*.*=
.*
        |          : ::    :   :   : :     : :     :   :   :  :            =
 |
  5e+07 ++         : ::    :   :   : :     : :     :   :   :  :            =
 |
        |           *  :   ::  :: :   :    :  :    :: :    :  :            =
 |
  4e+07 ++             :  : : : : :   :   :   :   : : :    : :             =
 |
        |              :  : : : : :   :   :   :   : : :    : :             =
 |
  3e+07 ++             :  : : : : :   :   :   :   : : :     ::             =
 |
        |              :  : : :  :    :   :   :   : : :     ::             =
 |
  2e+07 ++              : : : :  :    :   :   :   :  :      ::             =
 |
        |               : :  ::  *     :  :    :  :  :      ::             =
 |
  1e+07 ++              *:   :         : :     : :   *      :              =
 |
        |                :   :         : :     : :          :              =
 |
      0 O+O-O-O-O-O-O-O-OO-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-O-OO-O-O-O-O------=
-+


                                    softirqs.SCHED

  4.5e+06 ++-----------------------------------------------*---------------=
-+
          |                                               ::               =
 |
    4e+06 ++ .*.   *         *                            ::               =
 |
  3.5e+06 ++*   *.* :  *     :   *  *.*     *.*    *   *.* :     *.**.*.*.*=
.*
          *         : +:     :   :  : :     : :    :   :    :   +          =
 |
    3e+06 ++         * :     ::  :: : :     : :    :   :    :  *           =
 |
  2.5e+06 ++            :   : : : : :  :   :   :   :: :     :  :           =
 |
          |             :   : : : : :  :   :   :   :: :     :  :           =
 |
    2e+06 ++            :   : : : ::   :   :   :   :: :     : :            =
 |
  1.5e+06 ++            :   : : :  :   :   :   :  : : :     : :            =
 |
          |              :  : : :  :   :   :   :  :  :      : :            =
 |
    1e+06 ++             :  :  ::  *   :   :   :  :  :       ::            =
 |
   500000 ++             * :   :        : :     : :  *       :             =
 |
          O   O   OO   O  +O   O O  O   O : O   O :O   O O O O O O OO      =
 |
        0 ++O---O----O---O-*-O-*---O--O-*-O---O-*-O--O-------*-------------=
-+


                                     softirqs.RCU

  1.8e+06 ++-----------------------------------------------*---------------=
-+
          |      .**         *       .*      .*           +:    .*.        =
 |
  1.6e+06 *+ .*.*   + .*     :   *  * :     * :    *   *.* :   *   **.*.*.*=
.*
  1.4e+06 ++*        * :     :   :  : :     : :    :   :   :   :           =
 |
          |            :     ::  :: : :     : :    :   :    :  :           =
 |
  1.2e+06 ++            :   : : : : :  :    :  :   :: :     : :            =
 |
    1e+06 ++            :   : : : : :  :   :   :   :: :     : :            =
 |
          |             :   : : : ::   :   :   :   :: :     : :            =
 |
   800000 ++            :   : : :  :   :   :   :   :: :     : :            =
 |
   600000 ++             :  : : :  :   :   :   :  :  :      : :            =
 |
          |              :  :  ::  *   :   :   :  :  :       ::            =
 |
   400000 ++             * :   :        :  :    : :  *       :             =
 |
   200000 O+  O   OO   O  +O   O O  O   O : O   O :O   O   O O O O OO      =
 |
          | O            O *   *        : :   O : :  O   O   *             =
 |
        0 ++----O----O-------O-----O--O-*-O-----*-O------------------------=
-+


                                cpuidle.C1-IVT-4S.usage

    4e+07 ++---------------------------------------------------------------=
-+
          O   O   OO   O   O   O O  O   O       O  O   O O O O   O  O      =
 |
  3.5e+07 ++                                O                  O   O       =
 |
    3e+07 ++                                                               =
 |
          |                                                                =
 |
  2.5e+07 ++                                                               =
 |
          *.*.*.*.*    *     *   *  *.*     *.*    *   *.*.    *. .**.*. .*=
.*
    2e+07 ++       *. +:     :   :  : :     : :    :   :   *   : *      *  =
 |
          |          *  :    ::  :: :  :    :  :   :: :    :   :           =
 |
  1.5e+07 ++            :   : : : : :  :   :   :   :: :     : :            =
 |
    1e+07 ++            :   : : : ::   :   :   :   :: :     : :            =
 |
          |             :   : : :  :   :   :   :  : : :     : :            =
 |
    5e+06 ++             :  :  ::  *    :  :    : :  :      : :            =
 |
          |              *.:   :        : :     : :  *       :             =
 |
        0 ++O---O----O---O-*-O-*---O--O-*-O---O-*-O--O-------*-------------=
-+


                                cpuidle.C6-IVT-4S.time

  1.2e+11 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    1e+11 ++         *             *                                       =
 |
          |          :             :                                       =
 |
          |          :             :                 *                     =
 |
    8e+10 ++        : :           ::                 :                     =
 |
          |         : :           ::                 ::                    =
 |
    6e+10 ++        : :  *        : :               : :                    =
 |
          |         : :  :        : :               : :                    =
 |
    4e+10 ++        : : : :       : :               : :                    =
 |
          O   O   OO   O: :O   O O  O   O   O   O  O:  O O O O O O OO      =
 |
          |        :   :  :      :  :              :   :                   =
 |
    2e+10 *+*.*.*.**   *   :.*.*.*  *.*     *.*    *   *.*.*   *.*.**.*.*.*=
.*
          |     O          * O         +   +   +   : O      + +            =
 |
        0 ++O--------O---O---------O--O-*-O---O-*-O----------*-------------=
-+


                                 turbostat.Avg_MHz

  1800 ++-------------------------------------------------*-----*----------=
-+
       |.*. .*.*.*   *     *   *    .*     .*     *   *. +:    +  *.*. .*.*=
.|
  1600 *+  *     :   :     :   :   * :    * :     :   : * :   *       *    =
 *
  1400 ++        :   :     :   :   : :    : :     :   :   :   :            =
 |
       |          : : :    :   ::  : :    : :     ::  :    :  :            =
 |
  1200 ++         : : :   : : : : :   :   :  :   : : :     : :             =
 |
  1000 ++         : : :   : : : : :   :   :  :   : : :     : :             =
 |
       |          : : :   : : : : :   :   :  :   : : :     : :             =
 |
   800 ++         : : :   : : : : :   :   :  :   : : :     : :             =
 |
   600 ++          :  :   : : : : :   :  :   :   : : :     : :             =
 |
       |           :   :  : : :  ::   :  :   :   :  ::      ::             =
 |
   400 ++          *   : :   :   :     : :    : :   :       :              =
 |
   200 ++              : :   :   :     : :    : :   :       :              =
 |
       O   O   O O   O *.O   O O * O   O :O   O : O * O O O O O O O O      =
 |
     0 ++O---O-----O---O-*-O-*---O---O-*-O--O-*-O---O----------------------=
-+


                                 turbostat.%Busy

  60 ++--------------------------------------------------------------------=
-+
     |    .*.*.*         *                                *    .*.         =
 |
  50 *+*.*     :   *     :   *    .*       .*     *   *. +:   *   *.*. .*.*=
.|
     |         :   :     :   :   * :      * :     :   : * :   :       *    =
 *
     |          :  :     :   :   : :      : :     :   :    :  :            =
 |
  40 ++         : : :   : :  ::  :  :    :   :    :: :     : :             =
 |
     |          : : :   : : : : :   :    :   :   : : :     : :             =
 |
  30 ++         : : :   : : : : :   :    :   :   : : :     : :             =
 |
     |          : : :   : : : : :   :    :   :   : : :     : :             =
 |
  20 ++          :  :   : : : : :   :   :    :   : : :     : :             =
 |
     |           :  :   : : : : :   :   :    :   : : :      ::             =
 |
     |           *   : :   ::  :     :  :     :  :  :       :              =
 |
  10 ++              : :   :   :     :  :     : :   :       :              =
 |
     O   O   O O   O *.O   O O * O   O :  O   O : O * O O O O O O O O      =
 |
   0 ++O---O-----O---O-*-O-*---O---O-*-O----O-*-O---O----------------------=
-+


                                turbostat.CPU%c1

  50 *+-------------------------------------------------------*------------=
-+
  45 ++*   *.*.*   *     *   *    .*       .*     *   *.      : *.*.*. .*.*=
.|
     |  + +    :   :     :   :   * :      * :     :   : *.*   :       *    =
 *
  40 ++  *     :   :     :   :   : :      : :     :   :   :  :             =
 |
  35 ++         : : :    :   ::  : :      : :     ::  :   :  :             =
 |
     |          : : :   : : : : :   :    :   :   : : :     : :             =
 |
  30 ++         : : :   : : : : :   :    :   :   : : :     : :             =
 |
  25 ++         : : :   : : : : :   :    :   :   : : :     : :             =
 |
  20 ++         : : :   : : : : :   :    :   :   : : :     : :             =
 |
     |           :  :   : : : : :   :   : O  :   : : :      : O            =
 |
  15 O+  O   O O : O : O: :O:O ::   :   :    :   :  ::      O     O        =
 |
  10 ++          *   : :   :   : O   O  :     O : O : O O O *   O   O      =
 |
     |               : :   :   :     :  :     : :   :                      =
 |
   5 ++              *.*   :   *     : :    O : :   O                      =
 |
   0 ++O---O-----O---O---O-*---O---O-*-O------*-O--------------------------=
-+


                                 turbostat.CPU%c6

  100 ++O---O---------O---O-*-----------------------O----------------------=
-+
   90 ++               .*   :   *           O       *                      =
 |
      O   O   O O   O * O   O O : O   O       O   O : O O O *   O   O      =
 |
   80 ++          *   : :   :   :         O         :       O O   O        =
 |
   70 ++          :   : :  : :  ::                  :       :              =
 |
      |           :   :  : : : : :                 : :      ::             =
 |
   60 ++         : : :   : : : : :                 : :     : :             =
 |
   50 ++         : : :   : : : : :                 : :     : :             =
 |
   40 ++         : : :   : : : : :                 : :     : :             =
 |
      |          : : :   : : : : :                 : :     : :             =
 |
   30 ++         : : :   : : : :  :                : :     : :             =
 |
   20 ++         : : :    :   :   :               :   :    :  :            =
 |
      |         :   :     :   :   :               :   :   :   :            =
 |
   10 ++ .*.    :   :     :   :   *.     .*.      :   :.*.:   :      .*.   =
.*
    0 *+*---*-*-*-O-*-----*---*-O---O-*-O---*-*-O-*---*---*---*-*-*-*---*-*=
-+


                                turbostat.CoreTmp

  60 ++--------------------------------------------------------------------=
-+
     *.*.*.*.*.*   *     *   *    .*       .*         *.*.*      .*.*.     =
 |
  50 ++        :   :     :   :   * :      * :     *   :    :  *.*     *.*.*=
.*
     O   O   O  : :O:  O: :O: :  : :      O :     :  :O    : :             =
 |
     |         O: : :   : : :O: :O : O    : : O   O: :  O   O:O O O O      =
 |
  40 ++          :  :  :   :  : :   :    :   :    :: :      *              =
 |
     | O   O     *   O.* O *   :    :    :  O:   :  O     O                =
 |
  30 ++              *         *    :    :   :   :  *                      =
 |
     |                              :    :   :   :                         =
 |
  20 ++                             :   :    :   :                         =
 |
     |                              :   :    :   :                         =
 |
     |                               :  :     :  :                         =
 |
  10 ++                              :  :     : :                          =
 |
     |                               : :      : :                          =
 |
   0 ++----------O-------------O---O-*-O------*-O--------------------------=
-+


                                turbostat.PkgTmp

  60 ++--------------------------------------------------------------------=
-+
     *.*.*.*.*.*   *     *   *    .*       .*         *.*.*    .*.*.       =
.*
  50 ++        :   :     :   :   * :      * :     *   :    :  *     *.*.*.*=
 |
     |   O   O  : : :  O: :O: :  : :      O :     :  :O    : :O            =
 |
     O         O: :O:   : : :O: :O : O    : : O   O: :  O   O:  O O O      =
 |
  40 ++          :  :  :   :  : :   :    :   :    :: :      *              =
 |
     | O   O     *   O.* O *   :    :    :  O:   :  O     O                =
 |
  30 ++              *         *    :    :   :   :  *                      =
 |
     |                              :    :   :   :                         =
 |
  20 ++                             :   :    :   :                         =
 |
     |                              :   :    :   :                         =
 |
     |                               :  :     :  :                         =
 |
  10 ++                              :  :     : :                          =
 |
     |                               : :      : :                          =
 |
   0 ++----------O-------------O---O-*-O------*-O--------------------------=
-+


                                turbostat.Pkg%pc2

  70 ++--------------------------------------------------------------------=
-+
     |                           O                                         =
 |
  60 ++                              O        O       O   O                =
 |
     O   O         O   O                                O       O   O      =
 |
  50 ++      O O           O O                    O         O     O        =
 |
     |                                    O                                =
 |
  40 ++                                                       O            =
 |
     | O   O         O   O *                O                              =
 |
  30 ++               .*   :                        O       *              =
 |
     |           *   * :  : :  *                    *       :              =
 |
  20 ++          :   :  : : :  ::                   :      : :             =
 |
     |          : : :   : : : : :                  : :     : :             =
 |
  10 ++         : : :   : : : :  :                 : :     : :             =
 |
     |  .*.    :   :     :   :   *.      .*.      :   :.*.:   :      .*.   =
 |
   0 *+*---*-*-*-O-*-----*---*-O---O-*-O----*-*-O-*---*---*---*-*-*-*---*-*=
-*


                                 turbostat.PkgWatt

  450 *+*---*-*-*---------*---*-----*-------*-------------------*-------*--=
-+
      |   *     :   *     :   :   * :     * :     *   *.*.*   *   *.*.*   *=
.*
  400 ++        :   :     :   :   : :     : :     :   :   :   :            =
 |
  350 ++         :  :     ::  ::  : :     : :     :   :   :   :            =
 |
      |          : : :   : : : : :   :    :  :    :: :     : :             =
 |
  300 ++         : : :   : : : : :   :   :   :   : : :     : :             =
 |
  250 ++         : : :   : : : : :   :   :   :   : : :     : :             =
 |
      |          : : :   : : : : :   :   :   :   : : :     : :             =
 |
  200 ++          :  :   : : : : :   :   :   :   : : :      :              =
 |
  150 O+  O   O O : O : O:  O:O ::O  :O  :O  :O  :O: :O O O O O O O O      =
 |
      |           *   : :   :   :    :   :   :   :  :       *              =
 |
  100 ++              *.:   :   :     : :   O : :   :                      =
 |
   50 ++O   O         O * O *   *     : :     : :   O                      =
 |
      |                               : :     : :                          =
 |
    0 ++----------O-------------O---O-*-O-----*-O--------------------------=
-+


                                 turbostat.CorWatt

  400 ++-------------------------------------------------------------------=
-+
      *.*. .*.*.*   *     *   *    .*      .*     *   *. .*   *.*.*.*. .*.*=
.|
  350 ++  *     :   :     :   :   * :     * :     :   : * :   :       *    =
 *
  300 ++        :   :     :   :   : :     : :     :   :   :   :            =
 |
      |          : : :    ::  ::  : :     : :     :: :     : :             =
 |
  250 ++         : : :   : : : : :   :    :  :   : : :     : :             =
 |
      |          : : :   : : : : :   :   :   :   : : :     : :             =
 |
  200 ++         : : :   : : : : :   :   :   :   : : :     : :             =
 |
      |          : : :   : : : : :   :   :   :   : : :     : :             =
 |
  150 ++          :  :   : : : : :   :   :   :   : : :      :              =
 |
  100 O+  O   O   : O : O:  O:  :    :   :O  :   :O :       O O   O        =
 |
      |         O *   : :   : O : O   O  :    O :   : O O O *   O   O      =
 |
   50 ++              *.:   :   *     : :   O : :   *                      =
 |
      | O   O         O * O *         : :     : :   O                      =
 |
    0 ++----------O-------------O---O-*-O-----*-O--------------------------=
-+


                              netperf.Throughput_tps

  1600 ++------------------------------------------------------------------=
-+
       *.*.*.*.*.*   *     *   *   *.*    *.*         *.*.*   *.*.*. .*.*. =
.*
  1400 ++        :   :     :   :   : :    : :     *   :   :   :     *     *=
 |
  1200 ++        :   :     :   :   : :    : :     :   :   :   :            =
 |
       |         :   :     :   :   : :    : :     :   :   :   :            =
 |
  1000 O+  O   O O: :O:  O: :O:O: :O  :O  O  :O   O: :O O O:O:O O O O      =
 |
       |          : : :   : : : : :   :   :  :   : : :     : :             =
 |
   800 ++         : : :   : : : : :   :   :  :   : : :     : :             =
 |
       |          : : :   : : : : :   :  :   :   : : :     : :             =
 |
   600 ++         : : :   : : : : :   :  :   :   : : :     : :             =
 |
   400 ++         : : :   : : : : :   :  :   :   : : :     : :             =
 |
       |           :   : :   :   :     : :    :  :  :       :              =
 |
   200 ++          :   : :   :   :     : :    : :   :       :              =
 |
       |           :   : :   :   :     : :    : :   :       :              =
 |
     0 ++O---O-----O---O-*-O-*---O---O-*-O--O-*-O---O-------*--------------=
-+


                              netperf.time.user_time

  1000 ++*-*---------------------------------------------------------------=
-+
   900 ++   :                                     *           *.*.*.   .*.*=
.|
       *    :   .*.*.*             *.     *.      :           :     *.*    =
 *
   800 ++    :.*     :     *   *   : *    : *     :           :            =
 |
   700 ++    *       :     :   :   : :    : :     ::          :            =
 |
       |              :    :   :  :  :    : :    : :  *.*.*  :             =
 |
   600 ++             :   : : : : :   :   :  :   : :  :   :  :             =
 |
   500 ++             :   : : : : :   :   :  :   : : :    :  :             =
 |
   400 ++             :   : : : : :   :   :  :   : : :     : :             =
 |
       |              :   : : : : :   :  :   :   : : :     : :             =
 |
   300 ++              :  : : :  :    :  :   :   :  ::     : :             =
 |
   200 ++              :  : : :  :    :  :   :  :   :      ::              =
 |
       |               * :   :   *     : :    : :   *       :              =
 |
   100 O+  O   O O   O  +O   O O   O   O :O   O : O   O O O O O O O O      =
 |
     0 ++O---O-----O---O-*-O-*---O---O-*-O--O-*-O---O-------*--------------=
-+


                              netperf.time.system_time

  12000 ++-----------------------------------------------------------------=
-+
        |    .*.           *                              .*               =
 |
  10000 ++*.*   *.*   *    :   *   *.*     *.*         *.* :   .*.*.*.*.*.*=
.*
        *          + +:    :   :   : :     : :     *   :   :  *            =
 |
        |           * :    :   :   : :     : :     :   :   :  :            =
 |
   8000 ++             :  : :  :: :   :    :  :    :  :    :  :            =
 |
        |              :  : : : : :   :   :   :   : : :    : :             =
 |
   6000 ++             :  : : : : :   :   :   :   : : :    : :             =
 |
        |              :  : : : : :   :   :   :   : : :     ::             =
 |
   4000 ++             :  : : :  :    :   :   :   : : :     ::             =
 |
        |               : : : :  :    :   :   :   :  :      ::             =
 |
        |               ::   ::  *     :  :    :  :  :      ::             =
 |
   2000 ++              *:   :         : :     : :   *      :              =
 |
        O   O   O O   O  O   O O   O   O : O   O : O   O O OO O O O O      =
 |
      0 ++O---O-----O---O*-O-*---O---O-*-O---O-*-O---O------*--------------=
-+


                     netperf.time.percent_of_cpu_this_job_got

  4000 ++-------------------------------------------------*----------------=
-+
       |.*. .*.*.*   *     *   *    .*     .*         *. +:    .*.*.*. .*.*=
.|
  3500 *+  *     :   :     :   :   * :    * :     *   : * :   *       *    =
 *
  3000 ++        :   :     :   :   : :    : :     :   :   :   :            =
 |
       |          : : :    :   ::  : :    : :     :   :    :  :            =
 |
  2500 ++         : : :   : : : : :   :   :  :    :: :     :  :            =
 |
       |          : : :   : : : : :   :   :  :   : : :     : :             =
 |
  2000 ++         : : :   : : : : :   :   :  :   : : :     : :             =
 |
       |          : : :   : : : : :   :   :  :   : : :     : :             =
 |
  1500 ++          :  :   : : : : :   :  :   :   : : :     : :             =
 |
  1000 ++          :   :  : : :  ::   :  :   :   : : :     : :             =
 |
       |           *   : :   :   :     : :    :  :  :       ::             =
 |
   500 ++              : :   :   :     : :    : :   :       :              =
 |
       O   O   O O   O *.O   O O * O   O :O   O : O * O O O O O O O O      =
 |
     0 ++O---O-----O---O-*-O-*---O---O-*-O--O-*-O---O-------*--------------=
-+


                       netperf.time.voluntary_context_switches

  7e+07 *+*-*-*-*-*---*----*---*---*-*-----*-*---------*-*-*--*-*-*-*-*-*-*=
-*
        |          : ::    :   :   : :     : :     *   :   :  :            =
 |
  6e+07 ++         : ::    :   :   : :     : :     :   :   :  :            =
 |
        |           *  :   :   :: :  :     : :     :  :    :  :            =
 |
  5e+07 O+  O   O O   O: O: :O:O: :O  :O  :O  :O   O: :O O OO:  O O O      =
 |
        |              :  : : : : :   :   :   :   : : :    : :O            =
 |
  4e+07 ++             :  : : : : :   :   :   :   : : :    : :             =
 |
        |              :  : : : : :   :   :   :   : : :     ::             =
 |
  3e+07 ++             :  : : : : :   :   :   :   : : :     ::             =
 |
        |               : : : :  :    :   :   :   :  :      ::             =
 |
  2e+07 ++              : : : :  :    :   :   :   :  :      ::             =
 |
        |               ::   :   *     : :     : :   *      :              =
 |
  1e+07 ++              *:   :         : :     : :          :              =
 |
        |                :   :         : :     : :          :              =
 |
      0 ++O---O-----O---O*-O-*---O---O-*-O---O-*-O---O------*--------------=
-+


                      netperf.time.involuntary_context_switches

  35000 ++-----------------------------------------------------------------=
-+
        |                                                *.                =
 |
  30000 ++    *                                         +  *     .*        =
 |
        |    + :           *   *                       *   :    *  :  *    =
 *
  25000 ++  *  : .*   *    :   :   *.*     *.*         :   :    :  : + +   =
+|
        |  :    *  + +:    :   ::  : :     : :     *   :   :   :    *   *.*=
 |
  20000 ++ :        *  :  : : : : :  :     : :     :  :    :   :           =
 |
        *.*            :  : : : : :   :   :   :    :: :    :  *            =
 |
  15000 ++             :  : : : : :   :   :   :   : : :     : :            =
 |
        |              :  : : :  ::   :   :   :   : : :     ::             =
 |
  10000 ++              : : : :  :    :   :   :   : ::      ::             =
 |
        |               : : : :  *    :   :   :   :  :      ::             =
 |
   5000 ++              *:   :         : :     : :   *      ::O            =
 |
        O   O   O O   O  O   O O   O   O : O   O : O   O O OO   O O O      =
 |
      0 ++O---O-----O---O*-O-*---O---O-*-O---O-*-O---O------*--------------=
-+


                                  time.user_time

  1000 ++*-*---------------------------------------------------------------=
-+
   900 ++   :                                     *           *.*.*.   .*.*=
.|
       *    :   .*.*.*             *.     *.      :           :     *.*    =
 *
   800 ++    :.*     :     *   *   : *    : *     :           :            =
 |
   700 ++    *       :     :   :   : :    : :     ::          :            =
 |
       |              :    :   :  :  :    : :    : :  *.*.*  :             =
 |
   600 ++             :   : : : : :   :   :  :   : :  :   :  :             =
 |
   500 ++             :   : : : : :   :   :  :   : : :    :  :             =
 |
   400 ++             :   : : : : :   :   :  :   : : :     : :             =
 |
       |              :   : : : : :   :  :   :   : : :     : :             =
 |
   300 ++              :  : : :  :    :  :   :   :  ::     : :             =
 |
   200 ++              :  : : :  :    :  :   :  :   :      ::              =
 |
       |               * :   :   *     : :    : :   *       :              =
 |
   100 O+  O   O O   O  +O   O O   O   O :O   O : O   O O O O O O O O      =
 |
     0 ++O---O-----O---O-*-O-*---O---O-*-O--O-*-O---O-------*--------------=
-+


                                  time.system_time

  12000 ++-----------------------------------------------------------------=
-+
        |    .*.           *                              .*               =
 |
  10000 ++*.*   *.*   *    :   *   *.*     *.*         *.* :   .*.*.*.*.*.*=
.*
        *          + +:    :   :   : :     : :     *   :   :  *            =
 |
        |           * :    :   :   : :     : :     :   :   :  :            =
 |
   8000 ++             :  : :  :: :   :    :  :    :  :    :  :            =
 |
        |              :  : : : : :   :   :   :   : : :    : :             =
 |
   6000 ++             :  : : : : :   :   :   :   : : :    : :             =
 |
        |              :  : : : : :   :   :   :   : : :     ::             =
 |
   4000 ++             :  : : :  :    :   :   :   : : :     ::             =
 |
        |               : : : :  :    :   :   :   :  :      ::             =
 |
        |               ::   ::  *     :  :    :  :  :      ::             =
 |
   2000 ++              *:   :         : :     : :   *      :              =
 |
        O   O   O O   O  O   O O   O   O : O   O : O   O O OO O O O O      =
 |
      0 ++O---O-----O---O*-O-*---O---O-*-O---O-*-O---O------*--------------=
-+


                         time.percent_of_cpu_this_job_got

  4000 ++-------------------------------------------------*----------------=
-+
       |.*. .*.*.*   *     *   *    .*     .*         *. +:    .*.*.*. .*.*=
.|
  3500 *+  *     :   :     :   :   * :    * :     *   : * :   *       *    =
 *
  3000 ++        :   :     :   :   : :    : :     :   :   :   :            =
 |
       |          : : :    :   ::  : :    : :     :   :    :  :            =
 |
  2500 ++         : : :   : : : : :   :   :  :    :: :     :  :            =
 |
       |          : : :   : : : : :   :   :  :   : : :     : :             =
 |
  2000 ++         : : :   : : : : :   :   :  :   : : :     : :             =
 |
       |          : : :   : : : : :   :   :  :   : : :     : :             =
 |
  1500 ++          :  :   : : : : :   :  :   :   : : :     : :             =
 |
  1000 ++          :   :  : : :  ::   :  :   :   : : :     : :             =
 |
       |           *   : :   :   :     : :    :  :  :       ::             =
 |
   500 ++              : :   :   :     : :    : :   :       :              =
 |
       O   O   O O   O *.O   O O * O   O :O   O : O * O O O O O O O O      =
 |
     0 ++O---O-----O---O-*-O-*---O---O-*-O--O-*-O---O-------*--------------=
-+


                           time.voluntary_context_switches

  7e+07 *+*-*-*-*-*---*----*---*---*-*-----*-*---------*-*-*--*-*-*-*-*-*-*=
-*
        |          : ::    :   :   : :     : :     *   :   :  :            =
 |
  6e+07 ++         : ::    :   :   : :     : :     :   :   :  :            =
 |
        |           *  :   :   :: :  :     : :     :  :    :  :            =
 |
  5e+07 O+  O   O O   O: O: :O:O: :O  :O  :O  :O   O: :O O OO:  O O O      =
 |
        |              :  : : : : :   :   :   :   : : :    : :O            =
 |
  4e+07 ++             :  : : : : :   :   :   :   : : :    : :             =
 |
        |              :  : : : : :   :   :   :   : : :     ::             =
 |
  3e+07 ++             :  : : : : :   :   :   :   : : :     ::             =
 |
        |               : : : :  :    :   :   :   :  :      ::             =
 |
  2e+07 ++              : : : :  :    :   :   :   :  :      ::             =
 |
        |               ::   :   *     : :     : :   *      :              =
 |
  1e+07 ++              *:   :         : :     : :          :              =
 |
        |                :   :         : :     : :          :              =
 |
      0 ++O---O-----O---O*-O-*---O---O-*-O---O-*-O---O------*--------------=
-+


                          time.involuntary_context_switches

  35000 ++-----------------------------------------------------------------=
-+
        |                                                *.                =
 |
  30000 ++    *                                         +  *     .*        =
 |
        |    + :           *   *                       *   :    *  :  *    =
 *
  25000 ++  *  : .*   *    :   :   *.*     *.*         :   :    :  : + +   =
+|
        |  :    *  + +:    :   ::  : :     : :     *   :   :   :    *   *.*=
 |
  20000 ++ :        *  :  : : : : :  :     : :     :  :    :   :           =
 |
        *.*            :  : : : : :   :   :   :    :: :    :  *            =
 |
  15000 ++             :  : : : : :   :   :   :   : : :     : :            =
 |
        |              :  : : :  ::   :   :   :   : : :     ::             =
 |
  10000 ++              : : : :  :    :   :   :   : ::      ::             =
 |
        |               : : : :  *    :   :   :   :  :      ::             =
 |
   5000 ++              *:   :         : :     : :   *      ::O            =
 |
        O   O   O O   O  O   O O   O   O : O   O : O   O O OO   O O O      =
 |
      0 ++O---O-----O---O*-O-*---O---O-*-O---O-*-O---O------*--------------=
-+


                                 vmstat.procs.r

  50 ++----*---*-----------------------------------------------------------=
-+
     |    +  * :   *     *   *     *        *         *. .*    .*.*.*   *. =
 |
     *.*.*     :   :     :   :    +:       +:     *   : * :   *      + +  *=
.*
  40 ++         :  :     :   :   * :      * :     :   :   :   :       *    =
 |
     |          : : :    :   ::  : :      : :     :   :    :  :            =
 |
     |          : : :   : : : :  :  :    :   :    :: :     : :             =
 |
  30 ++         : : :   : : : : :   :    :   :   : : :     : :             =
 |
     |          : : :   : : : : :   :    :   :   : : :     : :             =
 |
  20 ++         : : :   : : : : :   :    :   :   : : :     : :             =
 |
     |           :  :   : : : : :   :   :    :   : : :     : :             =
 |
     |           :   :  : : :  ::   :   :    :   : : :      ::             =
 |
  10 ++          *   : :   :   :     :  :     :  :  :       :              =
 |
     |               : :   :   :     :  :     : :   :       :              =
 |
     O   O   O O   O *.O   O O * O   O :  O   O : O * O O O O O O O O      =
 |
   0 ++O---O-----O---O-*-O-*---O---O-*-O----O-*-O---O----------------------=
-+


                                  vmstat.system.in

  500000 ++----------------------------------------------------------------=
-+
  450000 *+*. .*.*.*  *     *   *    .*     .*     *   *. .*   *.**.*. .*.*=
.|
         |   *     :  :     :   :   * :    * :     :   : * :   :      *    =
 *
  400000 ++        :  :     :   :   : :    : :     :   :   :   :           =
 |
  350000 ++        : : :    :   ::  : :    : :     ::  :   :   :           =
 |
         |         : : :   : : : : :   :   :  :   : : :     : :            =
 |
  300000 ++         :: :   : : : : :   :   :  :   : : :     : :            =
 |
  250000 ++         :: :   : : : : :   :   :  :   : : :     : :            =
 |
  200000 ++         :: :   : : : : :   :   :  :   : : :     : :            =
 |
         |          :  :   : : : : :   :  :   :   : : :     : :            =
 |
  150000 ++         :   :  : : :  ::   :  :   :   :  ::     : :            =
 |
  100000 ++         *   : :   :   :     : :    : :   :       :             =
 |
         |              : :   :   :     : :    : :   :       :             =
 |
   50000 O+  O   O O  O *.O   O O * O   O :O   O : O * O O O O O OO O      =
 |
       0 ++O---O----O---O-*-O-*---O---O-*-O--O-*-O---O-------*-------------=
-+


                             numa-numastat.node0.numa_hit

  1.6e+06 ++---------------------------------------------------------------=
-+
          |       O            O                O        O O               =
 |
  1.4e+06 O+  O    O   O   O     O  O   O   O      O   O     O   O OO      =
 |
          |                                                    O           =
 |
  1.2e+06 ++                                                               =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   800000 ++                                                               =
 |
          |          *             *                                       =
 |
   600000 ++         ::            :                                       =
 |
   400000 ++        : :           : :                                      =
 |
          |    .*.  :  :.*        : *.      *.      .*.              .*.*. =
 |
   200000 *+*.*   **   *  :  *. .*    *    :  *    *   *.*.*   *.*.**     *=
.*
          |               : +  *       +   :   +   :        + +            =
 |
        0 ++O---O----O---O-*-O-----O--O-*-O---O-*-O--O-------*-------------=
-+


                            numa-numastat.node0.local_node

  1.6e+06 ++---------------------------------------------------------------=
-+
          |       O            O                O        O O               =
 |
  1.4e+06 O+  O    O   O   O     O  O   O   O      O   O     O   O OO      =
 |
          |                                                    O           =
 |
  1.2e+06 ++                                                               =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   800000 ++                                                               =
 |
          |          *             *                                       =
 |
   600000 ++         ::            :                                       =
 |
   400000 ++        : :           : :                                      =
 |
          |    .*.  :  :.*        : *.      *.      .*.              .*.*. =
 |
   200000 *+*.*   **   *  :  *. .*    *    :  *    *   *.*.*   *.*.**     *=
.*
          |               : +  *       +   :   +   :        + +            =
 |
        0 ++O---O----O---O-*-O-----O--O-*-O---O-*-O--O-------*-------------=
-+


                             numa-vmstat.node0.numa_hit

   1e+06 ++----------------------------------------------------------------=
-+
  900000 ++                                                O               =
 |
         |       O            O                O   O             OO        =
 |
  800000 O+  O     O  O   O     O   O   O  O           O O   O      O      =
 |
  700000 ++                                                    O           =
 |
         |                                                                 =
 |
  600000 ++                                                                =
 |
  500000 ++         *             *                                        =
 |
  400000 ++         ::           : :                                       =
 |
         |    .*.  : :           : :                .*.                .*. =
 |
  300000 *+*.*   *.*  *.*. .*. .*   *.*    *.*     *   *.*.*   *.**.*.*   *=
.*
  200000 ++    O          * O *        :   :  :    :        + +            =
 |
         | O            O              :   : O:   :  O       *             =
 |
  100000 ++                             : :    :  :                        =
 |
       0 ++---------O-------------O---O-*-O----*-O-------------------------=
-+


                            numa-vmstat.node0.numa_local

  900000 ++------------------------------------------------O---------------=
-+
         |       O            O                O   O             OO        =
 |
  800000 O+  O        O   O         O   O  O           O O   O             =
 |
  700000 ++        O            O                              O    O      =
 |
         |                                                                 =
 |
  600000 ++                                                                =
 |
  500000 ++                                                                =
 |
         |          *             *                                        =
 |
  400000 ++         ::           : :                                       =
 |
  300000 ++        : :           : :                .*                 .*. =
 |
         |.*.*.*.*.*  *.*   *. .*   *.*    *.*     *  + .*.*   *.**.*.*   *=
.*
  200000 *+              + +  *        :   :  :    :   *    + +            =
 |
  100000 ++O   O        O * O          :   : O:   :  O       *             =
 |
         |                              : :    :  :                        =
 |
       0 ++---------O-------------O---O-*-O----*-O-------------------------=
-+


                                 proc-vmstat.numa_hit

    3e+06 ++---------------------------------------------------------------=
-+
          |          *                                                     =
 |
  2.5e+06 ++         :                                                     =
 |
          |         : :                                                    =
 |
          O   O   OO: :O   O   O O *O   O   O   O  O     O O O   O OO      =
 |
    2e+06 ++        : :           ::                   O       O           =
 |
          |        :   :          : :                *.                    =
 |
  1.5e+06 ++ .*.*.**   *.    *   *  *.*     *.*     +  *.*.*    .*.* .*.*. =
.*
          *.*            *   :   :    :     : :    *       :   *    *     *=
 |
    1e+06 ++             :  : : :      :   :   :   :        :  :           =
 |
          |               : : : :      :   :   :   :        : :            =
 |
          |               : :  :       :   :   :   :        : :            =
 |
   500000 ++               :   *       :   :   :  :         : :            =
 |
          |     O          * O          : :     : :  O       :             =
 |
        0 ++O--------O---O---------O--O-*-O---O-*-O----------*-------------=
-+


                                proc-vmstat.numa_local

    3e+06 ++---------------------------------------------------------------=
-+
          |          *                                                     =
 |
  2.5e+06 ++         :                                                     =
 |
          |         : :                                                    =
 |
          O   O   OO: :O   O   O O *O   O   O   O  O     O O O   O OO      =
 |
    2e+06 ++        : :           ::                   O       O           =
 |
          |        :   :          : :                *.                    =
 |
  1.5e+06 ++ .*.*.**   *.    *   *  *.*     *.*     +  *.*.*    .*.* .*.*. =
.*
          *.*            *   :   :    :     : :    *       :   *    *     *=
 |
    1e+06 ++             :  : : :      :   :   :   :        :  :           =
 |
          |               : : : :      :   :   :   :        : :            =
 |
          |               : :  :       :   :   :   :        : :            =
 |
   500000 ++               :   *       :   :   :  :         : :            =
 |
          |     O          * O          : :     : :  O       :             =
 |
        0 ++O--------O---O---------O--O-*-O---O-*-O----------*-------------=
-+


                              proc-vmstat.pgalloc_dma32

  350000 ++----------------------------------------------------------------=
-+
         O   O   O    O   O   O                O   O     O O O    O        =
 |
  300000 ++        O            O   O   O  O           O       O O         =
 |
         |                                                          O      =
 |
  250000 ++                                                                =
 |
         |                                                                 =
 |
  200000 ++    *   *                                                       =
 |
         *.   + + + *.*     *   *    .*     .*     *   *.*.*    .**.     .*=
.*
  150000 ++*.*   *    :     :   ::  * :    * :     :   :   :   *    *.*.*  =
 |
         |             :   : : : : +   :   :  :   : : :     :  :           =
 |
  100000 ++            :   : : :  *    :   :  :   : : :     : :            =
 |
         |              :  : : :       :   :  :   :  :      : :            =
 |
   50000 ++             *  : : :       :  :   :   :  *      : :            =
 |
         |               +:   :         : :    : :           :             =
 |
       0 ++O---O----O---O-*-O-*---O---O-*-O--O-*-O---O-------*-------------=
-+


                              proc-vmstat.pgalloc_normal

  1.2e+07 ++---------------------------------------------------------------=
-+
          O   O   O    O   O   O    O   O   O   O  O     O O O   O O       =
 |
    1e+07 ++       O             O                     O       O    O      =
 |
          |                                                                =
 |
          |                                                                =
 |
    8e+06 ++                                                               =
 |
          |         .*.                                                    =
 |
    6e+06 *+*.*.*.**   *     *   *  *.*     *.*        *.*.*   *.*.**.*.*.*=
.*
          |            :     :   :: : :     : :    *   :   :   :           =
 |
    4e+06 ++            :   : : : ::   :   :   :   :: :     : :            =
 |
          |             :   : : :  *   :   :   :   :: :     : :            =
 |
          |              :  : : :      :   :   :   : *      : :            =
 |
    2e+06 ++             *  : : :      :   :   :  :         : :            =
 |
          |               +:   :        : :     : :          :             =
 |
        0 ++O---O----O---O-*-O-*---O--O-*-O---O-*-O--O-------*-------------=
-+


                                  proc-vmstat.pgfree

  1.2e+07 ++------O------------O----------------O--O-----O-O-----O-O-------=
-+
          O   O    O   O   O     O  O   O   O          O     O      O      =
 |
    1e+07 ++                                                   O           =
 |
          |                                                                =
 |
          |                                                                =
 |
    8e+06 ++                                                               =
 |
          |    .*.  .*.                                                    =
 |
    6e+06 *+*.*   **   *     *   *  *.*     *.*    *   *.*.*   *.*.**.*.*.*=
.*
          |             :    :   :: : :     : :    ::  :   :   :           =
 |
    4e+06 ++            :   : : : ::   :   :   :   :: :     : :            =
 |
          |              :  : : :  *   :   :   :   : ::     : :            =
 |
          |              *  : : :      :   :   :  :  *      : :            =
 |
    2e+06 ++              : :  :       :   :   :  :         : :            =
 |
          |               ::   *        : :     : :          :             =
 |
        0 ++O---O----O---O-*-O-----O--O-*-O---O-*-O--O-------*-------------=
-+


                            proc-vmstat.numa_hint_faults

  70000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  60000 ++                           *       *                  *          =
 |
        |                           +:      +:          .*.*    :+   .*.   =
 |
  50000 ++ .*   *.                 * :     * :         *   :   :  *.*   *.*=
.*
        |.*  + +  *.*.     *   *   :  :    :  :        :   :   :           =
 |
  40000 *+    *       *    :   :: :   :    :  :    *  :    :  *            =
 |
        |              :   :   :: :   :   :   :    :: :    :  :            =
 |
  30000 ++             :  : : :  :    :   :   :    :: :    :  :            =
 |
        |               : : : :  *    :   :   :   :  :      ::O            =
 |
  20000 ++  O   O O     *O: :O:O      :   :O  :   :  * O O OO:  O O        =
 |
        O             O : : : :        O  :    O  :O        ::      O      =
 |
  10000 ++               :   :     O   : :     :  :         ::             =
 |
        |                :   :         : :     : :          :              =
 |
      0 ++O---O-----O---O*-O-*---O---O-*-O---O-*-O---O------*--------------=
-+


                         proc-vmstat.numa_hint_faults_local

  60000 ++-----------------------------------------------------------------=
-+
        |                            *       *                  *          =
 |
  50000 ++                          +:      +:                  ::         =
 |
        |  .*                      * :     * :          .*.*   : :   .*.   =
 |
        | *  + .*.         *   *   : :     : :         *   :   :  *.*   *.*=
.*
  40000 ++    *   *.*.*    :   :  :   :    :  :        :   :  :            =
 |
        *             :    :   :: :   :   :   :    *  :    :  *            =
 |
  30000 ++             :  : : : : :   :   :   :    :  :    :  :            =
 |
        |              :  : : : : :   :   :   :    :: :    :  :            =
 |
  20000 ++              : : : :  :    :   :   :   : : :     ::             =
 |
        |   O   O O     *O: :O:O *    :   :O  :   :  :   O  O:O O O        =
 |
        O             O : : : :    O   :  :    O  :O * O   O::      O      =
 |
  10000 ++               :   :         O :     :  :         ::             =
 |
        |                :   :         : :     : :          :              =
 |
      0 ++O---O-----O---O*-O-*---O---O-*-O---O-*-O---O------*--------------=
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


--===============0992877512371277816==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCnRlc3RjYXNlOiBuZXRwZXJmCmRl
ZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJlLXRlc3QKICB1cHRpbWU6IAogIGlvc3RhdDogCiAg
dm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAKICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZv
OiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1zdGF0OgogICAgaW50ZXJ2YWw6IDEwCiAgbWVtaW5m
bzogCiAgc2xhYmluZm86IAogIGludGVycnVwdHM6IAogIGxvY2tfc3RhdDogCiAgbGF0ZW5jeV9z
dGF0czogCiAgc29mdGlycXM6IAogIGJkaV9kZXZfbWFwcGluZzogCiAgZGlza3N0YXRzOiAKICBu
ZnNzdGF0OiAKICBjcHVpZGxlOiAKICBjcHVmcmVxLXN0YXRzOiAKICB0dXJib3N0YXQ6IAogIHBt
ZXRlcjogCiAgc2NoZWRfZGVidWc6CiAgICBpbnRlcnZhbDogNjAKZGVmYXVsdC13YXRjaGRvZ3M6
CiAgd2F0Y2gtb29tOiAKICB3YXRjaGRvZzogCmNwdWZyZXFfZ292ZXJub3I6IHBlcmZvcm1hbmNl
Cm1vZGVsOiBXZXN0bWVyZS1FWApucl9jcHU6IDgwCm1lbW9yeTogMTI4RwpoZGRfcGFydGl0aW9u
czogCnN3YXBfcGFydGl0aW9uczogCnBtZXRlcl9zZXJ2ZXI6IGxrcC1zdDAxCnBtZXRlcl9kZXZp
Y2U6IHlva29nYXdhLXd0MzEwCmNvbW1pdDogMGVhYjUyMzg3NGFiOTg1MGVjMTRmNjg3NTE3NThk
ZmIyNzUzNjFiOQpucl9oZGRfcGFydGl0aW9uczogMApyb290ZnNfcGFydGl0aW9uOiAKcnVudGlt
ZTogMzAwcwpucl90aHJlYWRzOiAyMDAlCnBlcmYtcHJvZmlsZToKICBmcmVxOiA4MDAKY2x1c3Rl
cjogY3MtbGtwLXdzeDAyCmlmIHJvbGUgc2VydmVyOgogIG5ldHNlcnZlcjogCmlmIHJvbGUgY2xp
ZW50OgogIG5ldHBlcmY6CiAgICB0ZXN0OiBUQ1BfUlIKdGVzdGJveDogYnJpY2tsYW5kMwp0Ym94
X2dyb3VwOiBicmlja2xhbmQzCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAx
NS0wNi0xMyAwMTozMjoxMS45ODEwMjY2NDQgKzA4OjAwCnVzZXI6IGxrcApxdWV1ZTogY3MKY29t
cGlsZXI6IGdjYy00LjkKaGVhZF9jb21taXQ6IDU0ODk2ZjI3ZGQ1YzdlODNjMzdjODVlYjEwOTNm
MTQ1NDNhZjJiZmEKYmFzZV9jb21taXQ6IGQ0YTRmNzVjZDhmMjljZDk0NjRhNWEzMmU5MjI0YTkx
NTcxZDY2NDkKYnJhbmNoOiBuZXh0L21hc3Rlcgpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L25ldHBlcmYvcGVyZm9ybWFuY2UtMzAwcy0y
MDAlLVRDUF9SUi9icmlja2xhbmQzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0
LXJoZWwvZ2NjLTQuOS8wZWFiNTIzODc0YWI5ODUwZWMxNGY2ODc1MTc1OGRmYjI3NTM2MWI5LzAi
CmRpcmVjdF9tYWNzOiBhMDozNjo5ZjoxODpkNjphYQpkaXJlY3RfaXBzOiAxMC4xNjcuMC4yCmpv
Yl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvYnJpY2tsYW5kMy9jc19uZXRwZXJmLXBlcmZvcm1hbmNl
LTMwMHMtMjAwJS1UQ1BfUlItZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZfNjQtcmhl
bC0wZWFiNTIzODc0YWI5ODUwZWMxNGY2ODc1MTc1OGRmYjI3NTM2MWI5LTAtMjAxNTA2MTMtNTE0
Ni0xa3VoaWE2LnlhbWwiCm1heF91cHRpbWU6IDE1MDAKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFu
L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9
L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvYnJpY2tsYW5kMy9jc19u
ZXRwZXJmLXBlcmZvcm1hbmNlLTMwMHMtMjAwJS1UQ1BfUlItZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNnei14ODZfNjQtcmhlbC0wZWFiNTIzODc0YWI5ODUwZWMxNGY2ODc1MTc1OGRmYjI3NTM2
MWI5LTAtMjAxNTA2MTMtNTE0Ni0xa3VoaWE2LnlhbWwKLSBBUkNIPXg4Nl82NAotIGtjb25maWc9
eDg2XzY0LXJoZWwKLSBicmFuY2g9bmV4dC9tYXN0ZXIKLSBjb21taXQ9MGVhYjUyMzg3NGFiOTg1
MGVjMTRmNjg3NTE3NThkZmIyNzUzNjFiOQotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQt
cmhlbC9nY2MtNC45LzBlYWI1MjM4NzRhYjk4NTBlYzE0ZjY4NzUxNzU4ZGZiMjc1MzYxYjkvdm1s
aW51ei00LjEuMC1yYzctMDc3NzAtZzBlYWI1MjMKLSBtYXhfdXB0aW1lPTE1MDAKLSBSRVNVTFRf
Uk9PVD0vcmVzdWx0L25ldHBlcmYvcGVyZm9ybWFuY2UtMzAwcy0yMDAlLVRDUF9SUi9icmlja2xh
bmQzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS8wZWFi
NTIzODc0YWI5ODUwZWMxNGY2ODc1MTc1OGRmYjI3NTM2MWI5LzAKLSBMS1BfU0VSVkVSPWlubgot
IHwyLQoKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgog
IGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9z
dGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hk
b2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29u
c29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRy
ZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgv
eDg2XzY0LXJoZWwvZ2NjLTQuOS8wZWFiNTIzODc0YWI5ODUwZWMxNGY2ODc1MTc1OGRmYjI3NTM2
MWI5L21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAx
NS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwv
b3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbmV0cGVyZi5jZ3osL2xr
cC9iZW5jaG1hcmtzL25ldHBlcmYuY2d6Igpub2RlX3JvbGVzOiBjbGllbnQKa2VybmVsOiAiL3Br
Zy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzBlYWI1MjM4NzRhYjk4NTBlYzE0ZjY4NzUxNzU4
ZGZiMjc1MzYxYjkvdm1saW51ei00LjEuMC1yYzctMDc3NzAtZzBlYWI1MjMiCmRlcXVldWVfdGlt
ZTogMjAxNS0wNi0xMyAwMTozMjozMC41MjI2NTA4MDcgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNo
ZWQKbG9hZGF2ZzogMi4zMyA2LjgwIDQuMzIgMS8xMDQ1IDEyNjU3CnN0YXJ0X3RpbWU6ICcxNDM0
MTMwNTkxJwplbmRfdGltZTogJzE0MzQxMzA5MjInCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIw
MTUwNjEyLTIxNDUxNyIKCg==

--===============0992877512371277816==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDAvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUx
MDEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUxMDIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDQv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUxMDUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDcvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUxMDgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMS9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTExMC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMi9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExMy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExNS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTExNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTExNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExOC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEx
OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTEyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNC9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTE1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTE4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjAv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjMvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjYvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTI4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjkvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMyL2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1MzMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MzYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUzNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHU0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTQyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ1
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NDkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTAvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU1MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTU4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
NjAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHU2MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjMvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHU2NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjYvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU2Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjkvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1NzAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcyL2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NzMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc1L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NzYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU3Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc4L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Nzkv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1ODAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4MS9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTgyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1ODMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4NC9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTg1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1ODYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4Ny9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg4L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1ODkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU5MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTMvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5
NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTk1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5Ny9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTk4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCm5l
dHBlcmYgLXQgVENQX1JSIC1jIC1DIC1sIDMwMCAtSCAxMC4xNjcuMC4xCm5ldHBlcmYgLXQgVENQ
X1JSIC1jIC1DIC1sIDMwMCAtSCAxMC4xNjcuMC4xCm5ldHBlcmYgLXQgVENQX1JSIC1jIC1DIC1s
IDMwMCAtSCAxMC4xNjcuMC4xCm5ldHBlcmYgLXQgVENQX1JSIC1jIC1DIC1sIDMwMCAtSCAxMC4x
NjcuMC4xCm5ldHBlcmYgLXQgVENQX1JSIC1jIC1DIC1sIDMwMCAtSCAxMC4xNjcuMC4xCm5ldHBl
cmYgLXQgVENQX1JSIC1jIC1DIC1sIDMwMCAtSCAxMC4xNjcuMC4xCm5ldHBlcmYgLXQgVENQX1JS
IC1jIC1DIC1sIDMwMCAtSCAxMC4xNjcuMC4xCm5ldHBlcmYgLXQgVENQX1JSIC1jIC1DIC1sIDMw
MCAtSCAxMC4xNjcuMC4xCm5ldHBlcmYgLXQgVENQX1JSIC1jIC1DIC1sIDMwMCAtSCAxMC4xNjcu
MC4xCm5ldHBlcmYgLXQgVENQX1JSIC1jIC1DIC1sIDMwMCAtSCAxMC4xNjcuMC4xCm5ldHBlcmYg
LXQgVENQX1JSIC1jIC1DIC1sIDMwMCAtSCAxMC4xNjcuMC4xCm5ldHBlcmYgLXQgVENQX1JSIC1j
IC1DIC1sIDMwMCAtSCAxMC4xNjcuMC4xCm5ldHBlcmYgLXQgVENQX1JSIC1jIC1DIC1sIDMwMCAt
SCAxMC4xNjcuMC4xCgo=

--===============0992877512371277816==--

