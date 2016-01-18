Content-Type: multipart/mixed; boundary="===============3263546408799839376=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [rcu] 23a197a19f: 25680.3% aim9.time.involuntary_context_switches
Date: Mon, 18 Jan 2016 09:39:08 +0800
Message-ID: <87wpr7zmwz.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3263546408799839376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux=
-4.4.y-rt-rebase
commit 23a197a19f9ad0438a6445b0b3a0f5c6d3381da5 ("rcu: Eliminate softirq pr=
ocessing from rcutree")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/testtime:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-hsw-ep3/=
dgram_pipe/aim9/300s

commit: =

  cf5ebed4d0a77c055f5ef1a7978898ac0dcb2ae7
  23a197a19f9ad0438a6445b0b3a0f5c6d3381da5

cf5ebed4d0a77c05 23a197a19f9ad0438a6445b0b3 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    386.00 =C2=B1  2%  +25680.3%      99512 =C2=B1  0%  aim9.time.involunta=
ry_context_switches
    386.00 =C2=B1  2%  +25680.3%      99512 =C2=B1  0%  time.involuntary_co=
ntext_switches
      0.90 =C2=B1  0%      +1.7%       0.91 =C2=B1  0%  turbostat.%Busy
      2439 =C2=B1  0%     +85.3%       4520 =C2=B1  3%  vmstat.system.cs
      5431 =C2=B1  2%     -18.3%       4436 =C2=B1  3%  slabinfo.sigqueue.a=
ctive_objs
      5431 =C2=B1  2%     -18.3%       4436 =C2=B1  3%  slabinfo.sigqueue.n=
um_objs
    118629 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  softirqs.RCU
    219413 =C2=B1  0%     +10.9%     243334 =C2=B1  0%  softirqs.SCHED
 1.485e+08 =C2=B1 68%     -81.2%   27903187 =C2=B1 19%  cpuidle.C1E-HSW.time
      3213 =C2=B1 51%     -80.0%     641.50 =C2=B1 99%  cpuidle.C3-HSW.usage
    290523 =C2=B1  1%     +61.7%     469778 =C2=B1  4%  cpuidle.C6-HSW.usage
      5869 =C2=B1 49%     -50.8%       2889 =C2=B1  0%  numa-meminfo.node0.=
Mapped
      3715 =C2=B1  6%     +12.0%       4160 =C2=B1  1%  numa-meminfo.node2.=
KernelStack
      3659 =C2=B1  6%     +12.7%       4125 =C2=B1  4%  numa-meminfo.node3.=
KernelStack
     82.00 =C2=B1 42%     -58.5%      34.00 =C2=B1116%  numa-vmstat.node0.n=
r_dirtied
      1467 =C2=B1 49%     -50.8%     721.75 =C2=B1  0%  numa-vmstat.node0.n=
r_mapped
     81.25 =C2=B1 42%     -58.6%      33.67 =C2=B1118%  numa-vmstat.node0.n=
r_written
      0.66 =C2=B1 14%     +69.6%       1.12 =C2=B1  9%  perf-profile.cycles=
-pp.apic_timer_interrupt.cpuidle_enter.call_cpuidle.cpu_startup_entry.start=
_secondary
      5.84 =C2=B1  0%     +14.7%       6.70 =C2=B1  4%  perf-profile.cycles=
-pp.call_cpuidle.cpu_startup_entry.start_secondary
      6.64 =C2=B1  1%     +21.0%       8.03 =C2=B1  3%  perf-profile.cycles=
-pp.cpu_startup_entry.start_secondary
      5.84 =C2=B1  0%     +14.8%       6.70 =C2=B1  4%  perf-profile.cycles=
-pp.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
      1.66 =C2=B1 10%     -20.2%       1.32 =C2=B1 14%  perf-profile.cycles=
-pp.file_has_perm.selinux_file_permission.security_file_permission.rw_verif=
y_area.vfs_write
      1.15 =C2=B1  7%     +74.9%       2.00 =C2=B1  2%  perf-profile.cycles=
-pp.kthread.ret_from_fork
      1.15 =C2=B1  7%     +74.9%       2.00 =C2=B1  2%  perf-profile.cycles=
-pp.ret_from_fork
      2.80 =C2=B1  9%     -12.2%       2.46 =C2=B1  7%  perf-profile.cycles=
-pp.rw_verify_area.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      2.57 =C2=B1 10%     -13.3%       2.23 =C2=B1  8%  perf-profile.cycles=
-pp.security_file_permission.rw_verify_area.vfs_write.sys_write.entry_SYSCA=
LL_64_fastpath
      1.84 =C2=B1  7%      -9.8%       1.66 =C2=B1  3%  perf-profile.cycles=
-pp.security_socket_recvmsg.sock_recvmsg.sock_read_iter.__vfs_read.vfs_read
      1.78 =C2=B1  2%     -11.9%       1.57 =C2=B1  6%  perf-profile.cycles=
-pp.security_socket_sendmsg.sock_sendmsg.sock_write_iter.__vfs_write.vfs_wr=
ite
      2.27 =C2=B1 10%     -17.9%       1.86 =C2=B1 11%  perf-profile.cycles=
-pp.selinux_file_permission.security_file_permission.rw_verify_area.vfs_wri=
te.sys_write
      0.65 =C2=B1 14%     +72.8%       1.13 =C2=B1  8%  perf-profile.cycles=
-pp.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter.call_cpuidl=
e.cpu_startup_entry
      6.68 =C2=B1  1%     +21.4%       8.11 =C2=B1  3%  perf-profile.cycles=
-pp.start_secondary
    424.17 =C2=B1 29%     -75.2%     105.02 =C2=B1 58%  sched_debug.cfs_rq:=
/.exec_clock.101
    399.65 =C2=B1 28%     -70.5%     117.91 =C2=B1 66%  sched_debug.cfs_rq:=
/.exec_clock.102
    466.42 =C2=B1 28%     -76.2%     110.78 =C2=B1 45%  sched_debug.cfs_rq:=
/.exec_clock.104
    326.31 =C2=B1 52%     -59.9%     130.80 =C2=B1 79%  sched_debug.cfs_rq:=
/.exec_clock.105
    401.43 =C2=B1 47%     -87.0%      52.08 =C2=B1 69%  sched_debug.cfs_rq:=
/.exec_clock.106
    353.33 =C2=B1 47%     -66.8%     117.27 =C2=B1 71%  sched_debug.cfs_rq:=
/.exec_clock.108
    381.17 =C2=B1 32%     -67.1%     125.56 =C2=B1 56%  sched_debug.cfs_rq:=
/.exec_clock.109
    391.63 =C2=B1 31%     -64.8%     137.93 =C2=B1 67%  sched_debug.cfs_rq:=
/.exec_clock.110
    446.80 =C2=B1 32%     -73.7%     117.46 =C2=B1 57%  sched_debug.cfs_rq:=
/.exec_clock.111
    465.99 =C2=B1 30%     -70.3%     138.58 =C2=B1 76%  sched_debug.cfs_rq:=
/.exec_clock.112
    347.69 =C2=B1 46%     -77.8%      77.07 =C2=B1 39%  sched_debug.cfs_rq:=
/.exec_clock.113
    407.94 =C2=B1 17%     -69.6%     123.92 =C2=B1 33%  sched_debug.cfs_rq:=
/.exec_clock.114
    270.27 =C2=B1 31%     -67.4%      88.18 =C2=B1 19%  sched_debug.cfs_rq:=
/.exec_clock.115
    243.93 =C2=B1 53%     -72.1%      68.01 =C2=B1 50%  sched_debug.cfs_rq:=
/.exec_clock.116
    385.48 =C2=B1 26%     -59.3%     156.93 =C2=B1 59%  sched_debug.cfs_rq:=
/.exec_clock.117
    297.60 =C2=B1 40%     -79.4%      61.32 =C2=B1 26%  sched_debug.cfs_rq:=
/.exec_clock.118
    272.63 =C2=B1 62%     -75.1%      67.82 =C2=B1 31%  sched_debug.cfs_rq:=
/.exec_clock.120
    315.93 =C2=B1 31%     -58.3%     131.82 =C2=B1 77%  sched_debug.cfs_rq:=
/.exec_clock.124
    273.27 =C2=B1 59%     -74.4%      70.05 =C2=B1 69%  sched_debug.cfs_rq:=
/.exec_clock.126
    379.88 =C2=B1 32%     -67.3%     124.05 =C2=B1 34%  sched_debug.cfs_rq:=
/.exec_clock.127
      6652 =C2=B1 85%     -74.5%       1695 =C2=B1100%  sched_debug.cfs_rq:=
/.exec_clock.16
      3185 =C2=B1 95%     -75.3%     785.58 =C2=B1 29%  sched_debug.cfs_rq:=
/.exec_clock.17
      7885 =C2=B1 42%     -61.8%       3009 =C2=B1 75%  sched_debug.cfs_rq:=
/.exec_clock.18
    896.56 =C2=B1 15%     -35.0%     583.10 =C2=B1 17%  sched_debug.cfs_rq:=
/.exec_clock.32
      1145 =C2=B1 40%     -52.5%     544.17 =C2=B1 16%  sched_debug.cfs_rq:=
/.exec_clock.35
    734.50 =C2=B1 27%     -40.1%     440.18 =C2=B1 19%  sched_debug.cfs_rq:=
/.exec_clock.39
    824.56 =C2=B1 11%     -36.1%     526.59 =C2=B1 33%  sched_debug.cfs_rq:=
/.exec_clock.43
    759.00 =C2=B1 20%     -45.4%     414.63 =C2=B1 26%  sched_debug.cfs_rq:=
/.exec_clock.44
    682.11 =C2=B1 27%     -28.3%     488.89 =C2=B1 22%  sched_debug.cfs_rq:=
/.exec_clock.6
    439.04 =C2=B1 18%     -83.9%      70.86 =C2=B1 35%  sched_debug.cfs_rq:=
/.exec_clock.68
    401.58 =C2=B1 43%     -60.0%     160.75 =C2=B1 19%  sched_debug.cfs_rq:=
/.exec_clock.69
    730.92 =C2=B1 13%     -37.9%     454.25 =C2=B1  7%  sched_debug.cfs_rq:=
/.exec_clock.7
    302.99 =C2=B1 27%     -54.0%     139.49 =C2=B1 28%  sched_debug.cfs_rq:=
/.exec_clock.70
    378.61 =C2=B1 34%     -54.7%     171.48 =C2=B1 37%  sched_debug.cfs_rq:=
/.exec_clock.74
    468.33 =C2=B1 23%     -77.8%     104.13 =C2=B1 49%  sched_debug.cfs_rq:=
/.exec_clock.75
    418.24 =C2=B1 21%     -60.9%     163.68 =C2=B1 31%  sched_debug.cfs_rq:=
/.exec_clock.76
    393.83 =C2=B1 25%     -60.6%     155.10 =C2=B1 49%  sched_debug.cfs_rq:=
/.exec_clock.78
    812.85 =C2=B1108%     -74.9%     203.69 =C2=B1 78%  sched_debug.cfs_rq:=
/.exec_clock.80
    434.92 =C2=B1 27%     -74.6%     110.52 =C2=B1 55%  sched_debug.cfs_rq:=
/.exec_clock.81
    841.77 =C2=B1112%     -89.4%      89.19 =C2=B1 46%  sched_debug.cfs_rq:=
/.exec_clock.82
    400.22 =C2=B1 25%     -65.9%     136.54 =C2=B1 66%  sched_debug.cfs_rq:=
/.exec_clock.83
    381.34 =C2=B1 33%     -72.7%     104.15 =C2=B1 65%  sched_debug.cfs_rq:=
/.exec_clock.84
      1785 =C2=B1141%     -95.4%      81.57 =C2=B1 16%  sched_debug.cfs_rq:=
/.exec_clock.85
    389.70 =C2=B1 21%     -71.5%     111.08 =C2=B1 46%  sched_debug.cfs_rq:=
/.exec_clock.87
    643.57 =C2=B1 21%     -38.2%     397.43 =C2=B1 15%  sched_debug.cfs_rq:=
/.exec_clock.9
    380.24 =C2=B1  9%     -82.3%      67.29 =C2=B1 42%  sched_debug.cfs_rq:=
/.exec_clock.91
    366.52 =C2=B1 26%     -61.0%     142.90 =C2=B1 64%  sched_debug.cfs_rq:=
/.exec_clock.95
    533.02 =C2=B1 20%     -74.9%     133.95 =C2=B1 41%  sched_debug.cfs_rq:=
/.exec_clock.97
    412.41 =C2=B1 24%     -73.5%     109.31 =C2=B1 52%  sched_debug.cfs_rq:=
/.exec_clock.98
      1862 =C2=B1  4%     -10.0%       1675 =C2=B1  2%  sched_debug.cfs_rq:=
/.exec_clock.avg
     38.75 =C2=B1121%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.load_avg.43
     28665 =C2=B1 29%     -47.8%      14962 =C2=B1 16%  sched_debug.cfs_rq:=
/.min_vruntime.0
     24355 =C2=B1 43%     -82.0%       4387 =C2=B1 71%  sched_debug.cfs_rq:=
/.min_vruntime.1
     22421 =C2=B1 39%     -92.6%       1661 =C2=B1 96%  sched_debug.cfs_rq:=
/.min_vruntime.101
     20898 =C2=B1 43%     -91.7%       1730 =C2=B1 99%  sched_debug.cfs_rq:=
/.min_vruntime.102
     24656 =C2=B1 42%     -93.4%       1623 =C2=B1 67%  sched_debug.cfs_rq:=
/.min_vruntime.104
     14691 =C2=B1 60%     -84.1%       2337 =C2=B1116%  sched_debug.cfs_rq:=
/.min_vruntime.105
     20825 =C2=B1 61%     -97.0%     615.14 =C2=B1121%  sched_debug.cfs_rq:=
/.min_vruntime.106
     19035 =C2=B1 67%     -87.6%       2366 =C2=B1 75%  sched_debug.cfs_rq:=
/.min_vruntime.107
     19644 =C2=B1 54%     -88.0%       2355 =C2=B1 87%  sched_debug.cfs_rq:=
/.min_vruntime.108
     19019 =C2=B1 56%     -88.1%       2259 =C2=B1 71%  sched_debug.cfs_rq:=
/.min_vruntime.109
     22568 =C2=B1 26%     -77.6%       5063 =C2=B1 52%  sched_debug.cfs_rq:=
/.min_vruntime.11
     21547 =C2=B1 43%     -91.3%       1864 =C2=B1110%  sched_debug.cfs_rq:=
/.min_vruntime.110
     24052 =C2=B1 40%     -92.2%       1883 =C2=B1 92%  sched_debug.cfs_rq:=
/.min_vruntime.111
     23936 =C2=B1 40%     -91.3%       2082 =C2=B1104%  sched_debug.cfs_rq:=
/.min_vruntime.112
     17610 =C2=B1 57%     -93.3%       1182 =C2=B1 60%  sched_debug.cfs_rq:=
/.min_vruntime.113
     20180 =C2=B1 30%     -89.6%       2094 =C2=B1 78%  sched_debug.cfs_rq:=
/.min_vruntime.114
     12882 =C2=B1 39%     -90.1%       1272 =C2=B1102%  sched_debug.cfs_rq:=
/.min_vruntime.115
     10600 =C2=B1 66%     -92.3%     811.55 =C2=B1 40%  sched_debug.cfs_rq:=
/.min_vruntime.116
     19716 =C2=B1 37%     -92.6%       1465 =C2=B1 89%  sched_debug.cfs_rq:=
/.min_vruntime.117
     12830 =C2=B1 40%     -94.3%     734.13 =C2=B1 84%  sched_debug.cfs_rq:=
/.min_vruntime.118
     16131 =C2=B1 61%     -89.4%       1706 =C2=B1 97%  sched_debug.cfs_rq:=
/.min_vruntime.119
     25993 =C2=B1 44%     -87.0%       3373 =C2=B1 48%  sched_debug.cfs_rq:=
/.min_vruntime.12
     13012 =C2=B1 72%     -89.8%       1321 =C2=B1 93%  sched_debug.cfs_rq:=
/.min_vruntime.120
     14454 =C2=B1 65%     -86.5%       1954 =C2=B1 79%  sched_debug.cfs_rq:=
/.min_vruntime.122
     13173 =C2=B1 74%     -84.3%       2072 =C2=B1109%  sched_debug.cfs_rq:=
/.min_vruntime.123
     15589 =C2=B1 24%     -84.5%       2420 =C2=B1117%  sched_debug.cfs_rq:=
/.min_vruntime.124
     11845 =C2=B1 97%     -88.6%       1351 =C2=B1 79%  sched_debug.cfs_rq:=
/.min_vruntime.125
     14486 =C2=B1 74%     -92.2%       1127 =C2=B1105%  sched_debug.cfs_rq:=
/.min_vruntime.126
     20583 =C2=B1 44%     -89.8%       2091 =C2=B1 73%  sched_debug.cfs_rq:=
/.min_vruntime.127
     19151 =C2=B1 30%     -77.9%       4230 =C2=B1 51%  sched_debug.cfs_rq:=
/.min_vruntime.13
     64631 =C2=B1118%     -94.1%       3837 =C2=B1 59%  sched_debug.cfs_rq:=
/.min_vruntime.14
     30651 =C2=B1 22%     -84.5%       4754 =C2=B1 81%  sched_debug.cfs_rq:=
/.min_vruntime.16
     22854 =C2=B1 27%     -72.4%       6313 =C2=B1 53%  sched_debug.cfs_rq:=
/.min_vruntime.18
     18451 =C2=B1 67%     -75.7%       4476 =C2=B1 43%  sched_debug.cfs_rq:=
/.min_vruntime.19
     26255 =C2=B1 23%     -73.3%       7017 =C2=B1 52%  sched_debug.cfs_rq:=
/.min_vruntime.2
     16300 =C2=B1 42%     -77.3%       3707 =C2=B1 44%  sched_debug.cfs_rq:=
/.min_vruntime.21
     17575 =C2=B1 48%     -82.8%       3025 =C2=B1 75%  sched_debug.cfs_rq:=
/.min_vruntime.23
     19090 =C2=B1 46%     -76.6%       4470 =C2=B1 36%  sched_debug.cfs_rq:=
/.min_vruntime.24
     24393 =C2=B1 28%     -85.8%       3452 =C2=B1 46%  sched_debug.cfs_rq:=
/.min_vruntime.25
     21792 =C2=B1 61%     -82.3%       3855 =C2=B1 39%  sched_debug.cfs_rq:=
/.min_vruntime.28
     17790 =C2=B1 24%     -59.1%       7271 =C2=B1 49%  sched_debug.cfs_rq:=
/.min_vruntime.29
     59333 =C2=B1117%     -93.1%       4111 =C2=B1 50%  sched_debug.cfs_rq:=
/.min_vruntime.3
     16950 =C2=B1 11%     -72.2%       4713 =C2=B1 39%  sched_debug.cfs_rq:=
/.min_vruntime.30
     19361 =C2=B1 38%     -72.0%       5415 =C2=B1 52%  sched_debug.cfs_rq:=
/.min_vruntime.32
     22988 =C2=B1 35%     -82.6%       4003 =C2=B1 36%  sched_debug.cfs_rq:=
/.min_vruntime.35
     18628 =C2=B1 28%     -78.7%       3963 =C2=B1 53%  sched_debug.cfs_rq:=
/.min_vruntime.37
     22178 =C2=B1 39%     -83.4%       3688 =C2=B1 82%  sched_debug.cfs_rq:=
/.min_vruntime.38
     18378 =C2=B1 41%     -84.7%       2807 =C2=B1 42%  sched_debug.cfs_rq:=
/.min_vruntime.39
     17423 =C2=B1 53%     -76.2%       4154 =C2=B1 52%  sched_debug.cfs_rq:=
/.min_vruntime.4
     11967 =C2=B1 56%     -76.0%       2866 =C2=B1 61%  sched_debug.cfs_rq:=
/.min_vruntime.40
     23889 =C2=B1 39%     -82.0%       4311 =C2=B1 58%  sched_debug.cfs_rq:=
/.min_vruntime.41
     19786 =C2=B1 37%     -81.3%       3708 =C2=B1 57%  sched_debug.cfs_rq:=
/.min_vruntime.43
     16634 =C2=B1 17%     -85.6%       2388 =C2=B1 50%  sched_debug.cfs_rq:=
/.min_vruntime.44
     19660 =C2=B1 30%     -80.8%       3776 =C2=B1 45%  sched_debug.cfs_rq:=
/.min_vruntime.45
     15723 =C2=B1 21%     -79.0%       3303 =C2=B1 40%  sched_debug.cfs_rq:=
/.min_vruntime.46
     15659 =C2=B1 47%     -65.8%       5355 =C2=B1 63%  sched_debug.cfs_rq:=
/.min_vruntime.47
     21157 =C2=B1 29%     -79.2%       4393 =C2=B1 44%  sched_debug.cfs_rq:=
/.min_vruntime.48
     18455 =C2=B1 32%     -80.1%       3677 =C2=B1 45%  sched_debug.cfs_rq:=
/.min_vruntime.49
     17980 =C2=B1 44%     -80.1%       3571 =C2=B1 62%  sched_debug.cfs_rq:=
/.min_vruntime.5
     18069 =C2=B1 58%     -76.0%       4340 =C2=B1 54%  sched_debug.cfs_rq:=
/.min_vruntime.50
     21652 =C2=B1 31%     -82.7%       3747 =C2=B1 76%  sched_debug.cfs_rq:=
/.min_vruntime.51
     48215 =C2=B1 93%     -94.5%       2646 =C2=B1 62%  sched_debug.cfs_rq:=
/.min_vruntime.52
     14200 =C2=B1 71%     -74.7%       3598 =C2=B1 42%  sched_debug.cfs_rq:=
/.min_vruntime.53
     62034 =C2=B1101%     -93.0%       4358 =C2=B1 58%  sched_debug.cfs_rq:=
/.min_vruntime.54
     16131 =C2=B1 44%     -74.1%       4174 =C2=B1 53%  sched_debug.cfs_rq:=
/.min_vruntime.56
     23445 =C2=B1 30%     -90.2%       2291 =C2=B1 11%  sched_debug.cfs_rq:=
/.min_vruntime.59
     21572 =C2=B1 48%     -79.8%       4347 =C2=B1 40%  sched_debug.cfs_rq:=
/.min_vruntime.6
     18199 =C2=B1 24%     -79.6%       3714 =C2=B1 53%  sched_debug.cfs_rq:=
/.min_vruntime.60
     24252 =C2=B1 29%     -87.9%       2932 =C2=B1 49%  sched_debug.cfs_rq:=
/.min_vruntime.62
     23110 =C2=B1 32%     -82.6%       4021 =C2=B1 72%  sched_debug.cfs_rq:=
/.min_vruntime.63
     14783 =C2=B1 68%     -72.8%       4019 =C2=B1102%  sched_debug.cfs_rq:=
/.min_vruntime.64
     14396 =C2=B1 55%     -83.5%       2370 =C2=B1 87%  sched_debug.cfs_rq:=
/.min_vruntime.65
     17309 =C2=B1 74%     -93.0%       1213 =C2=B1 43%  sched_debug.cfs_rq:=
/.min_vruntime.66
     15239 =C2=B1 30%     -86.1%       2124 =C2=B1 76%  sched_debug.cfs_rq:=
/.min_vruntime.67
     19633 =C2=B1 36%     -94.5%       1086 =C2=B1 71%  sched_debug.cfs_rq:=
/.min_vruntime.68
     19703 =C2=B1 47%     -86.6%       2646 =C2=B1 58%  sched_debug.cfs_rq:=
/.min_vruntime.69
     24341 =C2=B1 31%     -88.2%       2881 =C2=B1 62%  sched_debug.cfs_rq:=
/.min_vruntime.7
     13683 =C2=B1 27%     -84.6%       2102 =C2=B1 63%  sched_debug.cfs_rq:=
/.min_vruntime.70
     19968 =C2=B1 26%     -86.5%       2691 =C2=B1 65%  sched_debug.cfs_rq:=
/.min_vruntime.74
     25313 =C2=B1 31%     -93.6%       1629 =C2=B1 83%  sched_debug.cfs_rq:=
/.min_vruntime.75
     21375 =C2=B1 27%     -87.1%       2757 =C2=B1 57%  sched_debug.cfs_rq:=
/.min_vruntime.76
     14970 =C2=B1 61%     -90.6%       1408 =C2=B1 53%  sched_debug.cfs_rq:=
/.min_vruntime.77
     20949 =C2=B1 40%     -88.2%       2469 =C2=B1 87%  sched_debug.cfs_rq:=
/.min_vruntime.78
     18980 =C2=B1 52%     -88.0%       2282 =C2=B1 93%  sched_debug.cfs_rq:=
/.min_vruntime.79
     16441 =C2=B1 69%     -75.5%       4029 =C2=B1 82%  sched_debug.cfs_rq:=
/.min_vruntime.8
     13873 =C2=B1 90%     -87.0%       1808 =C2=B1 69%  sched_debug.cfs_rq:=
/.min_vruntime.80
     20006 =C2=B1 29%     -92.7%       1467 =C2=B1 69%  sched_debug.cfs_rq:=
/.min_vruntime.81
     11546 =C2=B1 34%     -87.6%       1430 =C2=B1 80%  sched_debug.cfs_rq:=
/.min_vruntime.82
     18800 =C2=B1 39%     -88.3%       2201 =C2=B1 94%  sched_debug.cfs_rq:=
/.min_vruntime.83
     18245 =C2=B1 42%     -89.9%       1849 =C2=B1 82%  sched_debug.cfs_rq:=
/.min_vruntime.84
     15005 =C2=B1 53%     -92.4%       1146 =C2=B1 28%  sched_debug.cfs_rq:=
/.min_vruntime.85
     24651 =C2=B1 30%     -90.2%       2426 =C2=B1 96%  sched_debug.cfs_rq:=
/.min_vruntime.86
     18265 =C2=B1 25%     -93.5%       1180 =C2=B1 44%  sched_debug.cfs_rq:=
/.min_vruntime.87
     14499 =C2=B1 57%     -94.5%     793.77 =C2=B1 40%  sched_debug.cfs_rq:=
/.min_vruntime.88
     21975 =C2=B1 32%     -89.7%       2259 =C2=B1 22%  sched_debug.cfs_rq:=
/.min_vruntime.9
     17915 =C2=B1 54%     -86.1%       2484 =C2=B1 88%  sched_debug.cfs_rq:=
/.min_vruntime.90
     19448 =C2=B1 13%     -96.7%     645.44 =C2=B1 41%  sched_debug.cfs_rq:=
/.min_vruntime.91
     14483 =C2=B1 22%     -87.6%       1799 =C2=B1 56%  sched_debug.cfs_rq:=
/.min_vruntime.93
     19055 =C2=B1 42%     -89.3%       2043 =C2=B1 85%  sched_debug.cfs_rq:=
/.min_vruntime.95
     20562 =C2=B1 59%     -93.1%       1421 =C2=B1 69%  sched_debug.cfs_rq:=
/.min_vruntime.96
     25003 =C2=B1 35%     -90.9%       2279 =C2=B1 63%  sched_debug.cfs_rq:=
/.min_vruntime.97
     20992 =C2=B1 34%     -91.1%       1874 =C2=B1 86%  sched_debug.cfs_rq:=
/.min_vruntime.98
     19953 =C2=B1 28%     -77.2%       4545 =C2=B1 29%  sched_debug.cfs_rq:=
/.min_vruntime.avg
      0.33 =C2=B1141%    +650.0%       2.50 =C2=B1 20%  sched_debug.cfs_rq:=
/.nr_spread_over.16
      0.31 =C2=B1  7%    +126.1%       0.70 =C2=B1 29%  sched_debug.cfs_rq:=
/.nr_spread_over.avg
      0.83 =C2=B1  9%     +44.8%       1.20 =C2=B1 14%  sched_debug.cfs_rq:=
/.nr_spread_over.stddev
     12.75 =C2=B1132%     -92.2%       1.00 =C2=B1-100%  sched_debug.cfs_rq=
:/.runnable_load_avg.6
     -4310 =C2=B1-123%    +145.3%     -10574 =C2=B1-10%  sched_debug.cfs_rq=
:/.spread0.1
     -6246 =C2=B1-69%    +112.9%     -13301 =C2=B1-26%  sched_debug.cfs_rq:=
/.spread0.101
     -4012 =C2=B1-92%    +232.5%     -13340 =C2=B1-24%  sched_debug.cfs_rq:=
/.spread0.104
     -7121 =C2=B1-46%     +83.9%     -13098 =C2=B1-28%  sched_debug.cfs_rq:=
/.spread0.110
     -4616 =C2=B1-74%    +183.3%     -13079 =C2=B1-29%  sched_debug.cfs_rq:=
/.spread0.111
     -4732 =C2=B1-57%    +172.2%     -12880 =C2=B1 -7%  sched_debug.cfs_rq:=
/.spread0.112
     -8488 =C2=B1-38%     +51.6%     -12868 =C2=B1 -7%  sched_debug.cfs_rq:=
/.spread0.114
     -2672 =C2=B1-252%    +333.6%     -11589 =C2=B1-11%  sched_debug.cfs_rq=
:/.spread0.12
     -4273 =C2=B1-74%    +169.3%     -11510 =C2=B1-23%  sched_debug.cfs_rq:=
/.spread0.25
     30667 =C2=B1206%    -135.4%     -10850 =C2=B1-19%  sched_debug.cfs_rq:=
/.spread0.3
     -5679 =C2=B1-31%     +93.0%     -10958 =C2=B1-19%  sched_debug.cfs_rq:=
/.spread0.35
     -6489 =C2=B1-55%     +73.7%     -11273 =C2=B1-12%  sched_debug.cfs_rq:=
/.spread0.38
     -4779 =C2=B1-44%    +122.9%     -10650 =C2=B1-29%  sched_debug.cfs_rq:=
/.spread0.41
     19546 =C2=B1221%    -163.0%     -12315 =C2=B1 -7%  sched_debug.cfs_rq:=
/.spread0.52
     33365 =C2=B1209%    -131.8%     -10603 =C2=B1-33%  sched_debug.cfs_rq:=
/.spread0.54
     -4324 =C2=B1-105%    +179.4%     -12081 =C2=B1 -8%  sched_debug.cfs_rq=
:/.spread0.7
     -3355 =C2=B1-44%    +297.4%     -13333 =C2=B1-10%  sched_debug.cfs_rq:=
/.spread0.75
     -4017 =C2=B1-51%    +212.1%     -12536 =C2=B1 -7%  sched_debug.cfs_rq:=
/.spread0.86
     -3664 =C2=B1-54%    +246.1%     -12683 =C2=B1-16%  sched_debug.cfs_rq:=
/.spread0.97
    143809 =C2=B1 18%     +22.8%     176540 =C2=B1  1%  sched_debug.cfs_rq:=
/.spread0.max
    -27544 =C2=B1-28%     -46.0%     -14865 =C2=B1-16%  sched_debug.cfs_rq:=
/.spread0.min
      1464 =C2=B1  7%     +33.7%       1958 =C2=B1 21%  sched_debug.cfs_rq:=
/.tg_load_avg.127
     39.00 =C2=B1120%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.43
      2.75 =C2=B1 69%    +800.0%      24.75 =C2=B1 96%  sched_debug.cfs_rq:=
/.util_avg.12
      7.50 =C2=B1 76%    +310.0%      30.75 =C2=B1 85%  sched_debug.cfs_rq:=
/.util_avg.4
     61.00 =C2=B1 86%     -96.7%       2.00 =C2=B1122%  sched_debug.cfs_rq:=
/.util_avg.45
     71.75 =C2=B1 85%     -84.3%      11.25 =C2=B1 31%  sched_debug.cfs_rq:=
/.util_avg.6
   1054343 =C2=B1  8%     +45.6%    1534762 =C2=B1 34%  sched_debug.cpu.avg=
_idle.106
   1006887 =C2=B1  0%     +60.2%    1613169 =C2=B1 35%  sched_debug.cpu.avg=
_idle.107
   1046305 =C2=B1  5%     +26.0%    1318069 =C2=B1 19%  sched_debug.cpu.avg=
_idle.108
   1040949 =C2=B1  6%     +24.4%    1294653 =C2=B1 10%  sched_debug.cpu.avg=
_idle.123
   1021174 =C2=B1  2%     +32.1%    1349194 =C2=B1 15%  sched_debug.cpu.avg=
_idle.124
   1031943 =C2=B1  3%     +43.0%    1475226 =C2=B1 30%  sched_debug.cpu.avg=
_idle.13
   1043586 =C2=B1  4%     +11.3%    1161895 =C2=B1  5%  sched_debug.cpu.avg=
_idle.16
   1010058 =C2=B1  1%     +17.0%    1181655 =C2=B1 13%  sched_debug.cpu.avg=
_idle.17
   1001142 =C2=B1  1%     +31.1%    1312995 =C2=B1 20%  sched_debug.cpu.avg=
_idle.23
    988602 =C2=B1  6%     +24.3%    1229163 =C2=B1  6%  sched_debug.cpu.avg=
_idle.34
   1024870 =C2=B1  4%     +28.8%    1320073 =C2=B1 18%  sched_debug.cpu.avg=
_idle.35
   1047372 =C2=B1  5%     +22.1%    1279220 =C2=B1  9%  sched_debug.cpu.avg=
_idle.40
    985493 =C2=B1  2%    +205.3%    3008758 =C2=B1102%  sched_debug.cpu.avg=
_idle.42
   1012554 =C2=B1  6%     +15.4%    1168629 =C2=B1  9%  sched_debug.cpu.avg=
_idle.48
    974290 =C2=B1  8%     +18.5%    1154911 =C2=B1  4%  sched_debug.cpu.avg=
_idle.57
    949534 =C2=B1  9%     +31.8%    1251555 =C2=B1 16%  sched_debug.cpu.avg=
_idle.6
   1088881 =C2=B1  7%     +88.4%    2051897 =C2=B1 33%  sched_debug.cpu.avg=
_idle.64
    994090 =C2=B1  1%     +51.2%    1503367 =C2=B1 26%  sched_debug.cpu.avg=
_idle.66
   1033025 =C2=B1  2%     +35.0%    1394737 =C2=B1 28%  sched_debug.cpu.avg=
_idle.67
   1064535 =C2=B1  6%     +30.9%    1393347 =C2=B1 24%  sched_debug.cpu.avg=
_idle.68
   1041565 =C2=B1  4%    +104.9%    2134042 =C2=B1 40%  sched_debug.cpu.avg=
_idle.70
   1017349 =C2=B1  1%     +39.5%    1419617 =C2=B1 21%  sched_debug.cpu.avg=
_idle.71
   1093434 =C2=B1 11%    +109.7%    2292918 =C2=B1 48%  sched_debug.cpu.avg=
_idle.78
   1093535 =C2=B1 12%     +81.7%    1987263 =C2=B1 44%  sched_debug.cpu.avg=
_idle.79
   1025814 =C2=B1  2%     +15.1%    1181055 =C2=B1  6%  sched_debug.cpu.avg=
_idle.83
   1000000 =C2=B1  0%     +21.5%    1214514 =C2=B1 11%  sched_debug.cpu.avg=
_idle.84
   1042501 =C2=B1  2%     +11.6%    1163039 =C2=B1  6%  sched_debug.cpu.avg=
_idle.85
   1018147 =C2=B1  3%     +24.0%    1262664 =C2=B1 18%  sched_debug.cpu.avg=
_idle.92
   1088537 =C2=B1  9%     +25.8%    1369289 =C2=B1  7%  sched_debug.cpu.avg=
_idle.96
   1005943 =C2=B1  1%     +23.4%    1241111 =C2=B1 10%  sched_debug.cpu.avg=
_idle.99
   1061232 =C2=B1  0%     +21.6%    1290613 =C2=B1 10%  sched_debug.cpu.avg=
_idle.avg
     13.00 =C2=B1129%     -92.3%       1.00 =C2=B1-100%  sched_debug.cpu.cp=
u_load[0].6
      7.05 =C2=B1 11%     +20.9%       8.52 =C2=B1  7%  sched_debug.cpu.cpu=
_load[0].avg
     12.25 =C2=B1140%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu.cpu=
_load[1].6
      6.93 =C2=B1  8%     +14.7%       7.96 =C2=B1  5%  sched_debug.cpu.cpu=
_load[1].avg
     11.75 =C2=B1148%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu.cpu=
_load[2].6
      6.84 =C2=B1  6%     +10.6%       7.56 =C2=B1  5%  sched_debug.cpu.cpu=
_load[2].avg
     11.75 =C2=B1148%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu.cpu=
_load[3].6
     95.57 =C2=B1  6%     +14.1%     109.07 =C2=B1  7%  sched_debug.cpu.cur=
r->pid.avg
    526635 =C2=B1  8%     +45.4%     765607 =C2=B1 34%  sched_debug.cpu.max=
_idle_balance_cost.106
    502642 =C2=B1  0%     +59.6%     802296 =C2=B1 35%  sched_debug.cpu.max=
_idle_balance_cost.107
    522392 =C2=B1  5%     +25.3%     654339 =C2=B1 19%  sched_debug.cpu.max=
_idle_balance_cost.108
    519657 =C2=B1  6%     +24.3%     646165 =C2=B1 10%  sched_debug.cpu.max=
_idle_balance_cost.123
    511473 =C2=B1  2%     +32.4%     677125 =C2=B1 16%  sched_debug.cpu.max=
_idle_balance_cost.124
    518108 =C2=B1  2%     +69.1%     876118 =C2=B1 38%  sched_debug.cpu.max=
_idle_balance_cost.13
    545979 =C2=B1 10%    +112.6%    1160742 =C2=B1 71%  sched_debug.cpu.max=
_idle_balance_cost.14
    525106 =C2=B1  5%     +26.3%     663279 =C2=B1 20%  sched_debug.cpu.max=
_idle_balance_cost.23
    512579 =C2=B1  3%     +21.5%     622664 =C2=B1  6%  sched_debug.cpu.max=
_idle_balance_cost.34
    522948 =C2=B1  2%     +42.8%     746663 =C2=B1 22%  sched_debug.cpu.max=
_idle_balance_cost.35
    506745 =C2=B1  1%     +42.5%     722066 =C2=B1 33%  sched_debug.cpu.max=
_idle_balance_cost.39
    548991 =C2=B1  3%     +16.4%     638948 =C2=B1 13%  sched_debug.cpu.max=
_idle_balance_cost.4
    523376 =C2=B1  5%     +34.3%     702958 =C2=B1 17%  sched_debug.cpu.max=
_idle_balance_cost.40
    501254 =C2=B1  0%     +69.8%     851378 =C2=B1 45%  sched_debug.cpu.max=
_idle_balance_cost.42
    508820 =C2=B1  2%     +36.7%     695389 =C2=B1 18%  sched_debug.cpu.max=
_idle_balance_cost.49
    507721 =C2=B1  2%     +21.1%     614806 =C2=B1 17%  sched_debug.cpu.max=
_idle_balance_cost.56
    528928 =C2=B1  2%     +11.6%     590307 =C2=B1  6%  sched_debug.cpu.max=
_idle_balance_cost.57
    521436 =C2=B1  4%     +29.4%     674520 =C2=B1 18%  sched_debug.cpu.max=
_idle_balance_cost.6
    543209 =C2=B1  6%     +93.0%    1048184 =C2=B1 35%  sched_debug.cpu.max=
_idle_balance_cost.64
    500943 =C2=B1  0%     +62.3%     813231 =C2=B1 32%  sched_debug.cpu.max=
_idle_balance_cost.66
    529998 =C2=B1  6%     +31.3%     696002 =C2=B1 24%  sched_debug.cpu.max=
_idle_balance_cost.68
    520050 =C2=B1  3%    +108.0%    1081933 =C2=B1 42%  sched_debug.cpu.max=
_idle_balance_cost.70
    511618 =C2=B1  2%     +41.4%     723587 =C2=B1 19%  sched_debug.cpu.max=
_idle_balance_cost.71
    545785 =C2=B1 10%    +109.5%    1143659 =C2=B1 48%  sched_debug.cpu.max=
_idle_balance_cost.78
    544531 =C2=B1 11%     +97.3%    1074478 =C2=B1 47%  sched_debug.cpu.max=
_idle_balance_cost.79
    512276 =C2=B1  2%     +15.1%     589604 =C2=B1  6%  sched_debug.cpu.max=
_idle_balance_cost.83
    500000 =C2=B1  0%     +20.9%     604422 =C2=B1 11%  sched_debug.cpu.max=
_idle_balance_cost.84
    519951 =C2=B1  2%     +11.6%     580157 =C2=B1  6%  sched_debug.cpu.max=
_idle_balance_cost.85
    508376 =C2=B1  2%     +23.7%     628688 =C2=B1 18%  sched_debug.cpu.max=
_idle_balance_cost.92
    542730 =C2=B1  9%     +26.1%     684371 =C2=B1  7%  sched_debug.cpu.max=
_idle_balance_cost.96
    502416 =C2=B1  0%     +23.3%     619631 =C2=B1 10%  sched_debug.cpu.max=
_idle_balance_cost.99
    538565 =C2=B1  0%     +22.2%     658228 =C2=B1 10%  sched_debug.cpu.max=
_idle_balance_cost.avg
     69322 =C2=B1 29%    +203.5%     210420 =C2=B1 37%  sched_debug.cpu.max=
_idle_balance_cost.stddev
      8914 =C2=B1 11%     -18.2%       7288 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.111
      8856 =C2=B1 11%     -18.8%       7187 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.112
      8826 =C2=B1 10%     -17.5%       7285 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.113
      8779 =C2=B1 11%     -18.8%       7127 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.114
      8735 =C2=B1 10%     -17.5%       7202 =C2=B1  6%  sched_debug.cpu.nr_=
load_updates.117
      8592 =C2=B1  7%     -17.0%       7135 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.118
      9345 =C2=B1  7%     -13.1%       8123 =C2=B1  8%  sched_debug.cpu.nr_=
load_updates.80
      9148 =C2=B1  9%     -16.4%       7652 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.84
     10501 =C2=B1 13%     -27.3%       7635 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.85
      7738 =C2=B1 10%     -21.2%       6095 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.min
      5016 =C2=B1 66%    +124.6%      11267 =C2=B1 38%  sched_debug.cpu.nr_=
switches.1
      2464 =C2=B1 53%    +358.5%      11299 =C2=B1 85%  sched_debug.cpu.nr_=
switches.14
      8429 =C2=B1 52%    +101.9%      17020 =C2=B1 19%  sched_debug.cpu.nr_=
switches.16
      6215 =C2=B1  8%     +79.9%      11180 =C2=B1 29%  sched_debug.cpu.nr_=
switches.2
      5707 =C2=B1 23%    +101.5%      11501 =C2=B1 26%  sched_debug.cpu.nr_=
switches.20
      4433 =C2=B1 35%    +171.9%      12052 =C2=B1 30%  sched_debug.cpu.nr_=
switches.22
      5249 =C2=B1 58%    +106.1%      10820 =C2=B1 30%  sched_debug.cpu.nr_=
switches.25
      5880 =C2=B1 54%    +138.8%      14043 =C2=B1 30%  sched_debug.cpu.nr_=
switches.29
      5481 =C2=B1 73%    +184.6%      15599 =C2=B1 42%  sched_debug.cpu.nr_=
switches.30
      5211 =C2=B1 47%    +120.5%      11492 =C2=B1 31%  sched_debug.cpu.nr_=
switches.33
      3691 =C2=B1 24%    +215.2%      11634 =C2=B1 10%  sched_debug.cpu.nr_=
switches.37
      4577 =C2=B1 55%    +111.6%       9688 =C2=B1 28%  sched_debug.cpu.nr_=
switches.38
      6455 =C2=B1 16%     +64.0%      10588 =C2=B1 38%  sched_debug.cpu.nr_=
switches.39
      3363 =C2=B1 82%    +288.7%      13075 =C2=B1 35%  sched_debug.cpu.nr_=
switches.4
      5114 =C2=B1 52%     +68.6%       8621 =C2=B1 34%  sched_debug.cpu.nr_=
switches.40
      4967 =C2=B1 77%     +81.8%       9029 =C2=B1 36%  sched_debug.cpu.nr_=
switches.41
      3819 =C2=B1 42%    +729.3%      31673 =C2=B1124%  sched_debug.cpu.nr_=
switches.42
      2759 =C2=B1 21%    +236.5%       9284 =C2=B1 37%  sched_debug.cpu.nr_=
switches.43
      3140 =C2=B1 39%    +252.4%      11065 =C2=B1 31%  sched_debug.cpu.nr_=
switches.45
      3422 =C2=B1 36%    +209.8%      10605 =C2=B1 45%  sched_debug.cpu.nr_=
switches.46
      5446 =C2=B1 35%    +139.9%      13065 =C2=B1 38%  sched_debug.cpu.nr_=
switches.47
      2398 =C2=B1 57%    +290.6%       9367 =C2=B1 57%  sched_debug.cpu.nr_=
switches.5
      3921 =C2=B1 69%    +108.5%       8173 =C2=B1 47%  sched_debug.cpu.nr_=
switches.51
      2196 =C2=B1 56%    +375.3%      10440 =C2=B1 41%  sched_debug.cpu.nr_=
switches.6
    571.25 =C2=B1 31%    +125.7%       1289 =C2=B1 28%  sched_debug.cpu.nr_=
switches.64
      2383 =C2=B1 40%    +268.3%       8776 =C2=B1 61%  sched_debug.cpu.nr_=
switches.7
    632.50 =C2=B1 47%    +413.3%       3246 =C2=B1109%  sched_debug.cpu.nr_=
switches.74
    799.00 =C2=B1 14%    +127.8%       1820 =C2=B1 72%  sched_debug.cpu.nr_=
switches.80
    821.25 =C2=B1  8%     +37.0%       1125 =C2=B1  7%  sched_debug.cpu.nr_=
switches.83
    815.25 =C2=B1  6%     +31.8%       1074 =C2=B1 12%  sched_debug.cpu.nr_=
switches.84
    813.25 =C2=B1 20%     +42.5%       1158 =C2=B1 19%  sched_debug.cpu.nr_=
switches.86
    763.25 =C2=B1 11%     +50.5%       1148 =C2=B1 19%  sched_debug.cpu.nr_=
switches.87
    879.75 =C2=B1 13%     +27.8%       1124 =C2=B1 11%  sched_debug.cpu.nr_=
switches.88
    768.25 =C2=B1 11%     +28.0%     983.50 =C2=B1 12%  sched_debug.cpu.nr_=
switches.91
    760.25 =C2=B1  9%     +61.8%       1230 =C2=B1 24%  sched_debug.cpu.nr_=
switches.92
    739.00 =C2=B1 14%     +42.9%       1056 =C2=B1 13%  sched_debug.cpu.nr_=
switches.94
    776.25 =C2=B1 10%     +37.5%       1067 =C2=B1 11%  sched_debug.cpu.nr_=
switches.95
    768.00 =C2=B1 12%    +883.7%       7554 =C2=B1147%  sched_debug.cpu.nr_=
switches.96
      3644 =C2=B1  0%     +78.5%       6506 =C2=B1  1%  sched_debug.cpu.nr_=
switches.avg
     35688 =C2=B1 18%    +185.1%     101749 =C2=B1  0%  sched_debug.cpu.nr_=
switches.max
    285.54 =C2=B1  5%     +15.5%     329.71 =C2=B1  6%  sched_debug.cpu.nr_=
switches.min
      5647 =C2=B1  6%     +87.2%      10573 =C2=B1  2%  sched_debug.cpu.nr_=
switches.stddev
    -54.50 =C2=B1-54%     +87.2%    -102.00 =C2=B1-14%  sched_debug.cpu.nr_=
uninterruptible.22
    -62.25 =C2=B1-36%     +63.1%    -101.50 =C2=B1 -9%  sched_debug.cpu.nr_=
uninterruptible.24
   -103.25 =C2=B1-13%     -41.9%     -60.00 =C2=B1-45%  sched_debug.cpu.nr_=
uninterruptible.43
     25.75 =C2=B1 98%    +151.5%      64.75 =C2=B1 23%  sched_debug.cpu.nr_=
uninterruptible.79
     60.50 =C2=B1 16%     +60.3%      97.00 =C2=B1  9%  sched_debug.cpu.nr_=
uninterruptible.85
     67.75 =C2=B1 20%     +35.1%      91.50 =C2=B1  3%  sched_debug.cpu.nr_=
uninterruptible.87
     70.00 =C2=B1  1%     +11.2%      77.85 =C2=B1  2%  sched_debug.cpu.nr_=
uninterruptible.stddev
      5063 =C2=B1 65%    +126.7%      11478 =C2=B1 37%  sched_debug.cpu.sch=
ed_count.1
      2584 =C2=B1 47%    +338.6%      11334 =C2=B1 84%  sched_debug.cpu.sch=
ed_count.14
      8983 =C2=B1 45%     +91.9%      17234 =C2=B1 17%  sched_debug.cpu.sch=
ed_count.16
      6227 =C2=B1  8%     +83.0%      11392 =C2=B1 29%  sched_debug.cpu.sch=
ed_count.2
      6580 =C2=B1 36%     +77.6%      11687 =C2=B1 27%  sched_debug.cpu.sch=
ed_count.20
      4516 =C2=B1 35%    +175.8%      12456 =C2=B1 30%  sched_debug.cpu.sch=
ed_count.22
      5312 =C2=B1 57%    +104.5%      10865 =C2=B1 30%  sched_debug.cpu.sch=
ed_count.25
      5958 =C2=B1 52%    +136.9%      14115 =C2=B1 30%  sched_debug.cpu.sch=
ed_count.29
      5857 =C2=B1 66%    +175.6%      16143 =C2=B1 43%  sched_debug.cpu.sch=
ed_count.30
      5235 =C2=B1 47%    +121.3%      11587 =C2=B1 30%  sched_debug.cpu.sch=
ed_count.33
      3718 =C2=B1 24%    +213.6%      11658 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.37
      4601 =C2=B1 54%    +111.1%       9714 =C2=B1 28%  sched_debug.cpu.sch=
ed_count.38
      6474 =C2=B1 16%     +64.0%      10615 =C2=B1 37%  sched_debug.cpu.sch=
ed_count.39
      3401 =C2=B1 81%    +325.6%      14477 =C2=B1 32%  sched_debug.cpu.sch=
ed_count.4
      5132 =C2=B1 52%     +68.5%       8649 =C2=B1 34%  sched_debug.cpu.sch=
ed_count.40
      4982 =C2=B1 77%     +81.7%       9053 =C2=B1 36%  sched_debug.cpu.sch=
ed_count.41
      3832 =C2=B1 42%    +731.6%      31866 =C2=B1123%  sched_debug.cpu.sch=
ed_count.42
      2787 =C2=B1 20%    +234.4%       9319 =C2=B1 36%  sched_debug.cpu.sch=
ed_count.43
      3181 =C2=B1 38%    +255.8%      11319 =C2=B1 29%  sched_debug.cpu.sch=
ed_count.45
      3438 =C2=B1 36%    +216.6%      10887 =C2=B1 42%  sched_debug.cpu.sch=
ed_count.46
      5479 =C2=B1 36%    +139.8%      13139 =C2=B1 38%  sched_debug.cpu.sch=
ed_count.47
      2461 =C2=B1 57%    +288.5%       9562 =C2=B1 55%  sched_debug.cpu.sch=
ed_count.5
      3926 =C2=B1 69%    +108.4%       8182 =C2=B1 47%  sched_debug.cpu.sch=
ed_count.51
      2330 =C2=B1 60%    +365.6%      10851 =C2=B1 43%  sched_debug.cpu.sch=
ed_count.6
    575.00 =C2=B1 31%    +125.0%       1293 =C2=B1 27%  sched_debug.cpu.sch=
ed_count.64
      2864 =C2=B1 57%    +210.2%       8886 =C2=B1 60%  sched_debug.cpu.sch=
ed_count.7
    636.25 =C2=B1 47%    +410.8%       3250 =C2=B1109%  sched_debug.cpu.sch=
ed_count.74
    802.75 =C2=B1 14%    +127.3%       1824 =C2=B1 72%  sched_debug.cpu.sch=
ed_count.80
    826.50 =C2=B1  8%     +36.6%       1128 =C2=B1  7%  sched_debug.cpu.sch=
ed_count.83
    819.00 =C2=B1  6%     +31.6%       1078 =C2=B1 12%  sched_debug.cpu.sch=
ed_count.84
    817.00 =C2=B1 20%     +42.2%       1161 =C2=B1 19%  sched_debug.cpu.sch=
ed_count.86
    768.25 =C2=B1 11%     +50.0%       1152 =C2=B1 19%  sched_debug.cpu.sch=
ed_count.87
    884.50 =C2=B1 13%     +27.4%       1127 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.88
    772.00 =C2=B1 11%     +27.8%     986.50 =C2=B1 12%  sched_debug.cpu.sch=
ed_count.91
    764.00 =C2=B1  9%     +61.5%       1233 =C2=B1 24%  sched_debug.cpu.sch=
ed_count.92
    742.50 =C2=B1 14%     +42.7%       1059 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.94
    780.00 =C2=B1 10%     +37.4%       1071 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.95
    771.25 =C2=B1 12%    +880.1%       7558 =C2=B1147%  sched_debug.cpu.sch=
ed_count.96
    288.75 =C2=B1  5%     +15.2%     332.67 =C2=B1  5%  sched_debug.cpu.sch=
ed_count.min
      1154 =C2=B1 60%    +366.9%       5391 =C2=B1 90%  sched_debug.cpu.sch=
ed_goidle.14
      4029 =C2=B1 55%     +83.4%       7389 =C2=B1 21%  sched_debug.cpu.sch=
ed_goidle.16
      3070 =C2=B1  7%     +64.8%       5060 =C2=B1 37%  sched_debug.cpu.sch=
ed_goidle.2
      2797 =C2=B1 25%     +92.9%       5394 =C2=B1 28%  sched_debug.cpu.sch=
ed_goidle.20
      2179 =C2=B1 36%    +122.8%       4857 =C2=B1 27%  sched_debug.cpu.sch=
ed_goidle.22
      2600 =C2=B1 59%     +96.0%       5096 =C2=B1 32%  sched_debug.cpu.sch=
ed_goidle.25
      2885 =C2=B1 53%     +91.5%       5526 =C2=B1 21%  sched_debug.cpu.sch=
ed_goidle.29
      2708 =C2=B1 74%    +174.6%       7436 =C2=B1 43%  sched_debug.cpu.sch=
ed_goidle.30
      2574 =C2=B1 48%    +111.6%       5448 =C2=B1 34%  sched_debug.cpu.sch=
ed_goidle.33
      1813 =C2=B1 25%    +203.1%       5496 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.37
      2264 =C2=B1 55%    +101.7%       4566 =C2=B1 30%  sched_debug.cpu.sch=
ed_goidle.38
      1649 =C2=B1 83%    +276.0%       6203 =C2=B1 39%  sched_debug.cpu.sch=
ed_goidle.4
      1352 =C2=B1 21%    +222.5%       4362 =C2=B1 41%  sched_debug.cpu.sch=
ed_goidle.43
      1544 =C2=B1 39%    +240.2%       5252 =C2=B1 34%  sched_debug.cpu.sch=
ed_goidle.45
      1685 =C2=B1 37%    +197.3%       5009 =C2=B1 50%  sched_debug.cpu.sch=
ed_goidle.46
      1164 =C2=B1 58%    +274.4%       4361 =C2=B1 63%  sched_debug.cpu.sch=
ed_goidle.5
      1936 =C2=B1 70%     +98.6%       3846 =C2=B1 50%  sched_debug.cpu.sch=
ed_goidle.51
      1072 =C2=B1 57%    +360.7%       4940 =C2=B1 45%  sched_debug.cpu.sch=
ed_goidle.6
    255.00 =C2=B1 29%    +102.3%     515.75 =C2=B1 32%  sched_debug.cpu.sch=
ed_goidle.64
      1159 =C2=B1 40%    +254.6%       4110 =C2=B1 67%  sched_debug.cpu.sch=
ed_goidle.7
    281.00 =C2=B1 45%    +431.5%       1493 =C2=B1122%  sched_debug.cpu.sch=
ed_goidle.74
    369.75 =C2=B1  9%     +13.9%     421.00 =C2=B1  6%  sched_debug.cpu.sch=
ed_goidle.83
      1750 =C2=B1  0%     +49.0%       2608 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.avg
      1961 =C2=B1 52%    +181.9%       5528 =C2=B1 30%  sched_debug.cpu.ttw=
u_count.1
      1866 =C2=B1120%    +736.9%      15621 =C2=B1130%  sched_debug.cpu.ttw=
u_count.10
    358.75 =C2=B1  9%     +39.4%     500.25 =C2=B1 15%  sched_debug.cpu.ttw=
u_count.100
    995.50 =C2=B1 60%    +346.1%       4441 =C2=B1 67%  sched_debug.cpu.ttw=
u_count.13
      3350 =C2=B1 62%     +95.1%       6536 =C2=B1 47%  sched_debug.cpu.ttw=
u_count.24
      2754 =C2=B1 19%    +161.5%       7204 =C2=B1 36%  sched_debug.cpu.ttw=
u_count.30
      2046 =C2=B1 75%    +168.3%       5490 =C2=B1 29%  sched_debug.cpu.ttw=
u_count.31
      3131 =C2=B1 49%     +77.2%       5548 =C2=B1 16%  sched_debug.cpu.ttw=
u_count.35
      2450 =C2=B1 62%    +154.9%       6246 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.36
      1822 =C2=B1 64%    +156.3%       4671 =C2=B1 43%  sched_debug.cpu.ttw=
u_count.37
      1491 =C2=B1 48%    +225.1%       4849 =C2=B1 70%  sched_debug.cpu.ttw=
u_count.4
      1831 =C2=B1 80%    +135.6%       4314 =C2=B1 44%  sched_debug.cpu.ttw=
u_count.40
      1543 =C2=B1 60%    +240.8%       5260 =C2=B1 30%  sched_debug.cpu.ttw=
u_count.41
      1118 =C2=B1 43%   +1372.1%      16465 =C2=B1118%  sched_debug.cpu.ttw=
u_count.42
      1459 =C2=B1 78%    +202.7%       4418 =C2=B1 48%  sched_debug.cpu.ttw=
u_count.44
      1551 =C2=B1 41%    +229.2%       5107 =C2=B1 43%  sched_debug.cpu.ttw=
u_count.45
      1296 =C2=B1 52%    +421.3%       6756 =C2=B1 55%  sched_debug.cpu.ttw=
u_count.47
      1027 =C2=B1 71%    +296.0%       4067 =C2=B1 64%  sched_debug.cpu.ttw=
u_count.5
      1169 =C2=B1 39%    +350.8%       5271 =C2=B1 49%  sched_debug.cpu.ttw=
u_count.6
      1392 =C2=B1100%    +214.4%       4376 =C2=B1 50%  sched_debug.cpu.ttw=
u_count.63
      1261 =C2=B1 61%    +232.9%       4199 =C2=B1 73%  sched_debug.cpu.ttw=
u_count.7
    239.25 =C2=B1 33%    +574.7%       1614 =C2=B1108%  sched_debug.cpu.ttw=
u_count.74
    242.75 =C2=B1 47%     +99.5%     484.25 =C2=B1 21%  sched_debug.cpu.ttw=
u_count.79
    381.75 =C2=B1 14%    +135.4%     898.50 =C2=B1 71%  sched_debug.cpu.ttw=
u_count.80
    425.25 =C2=B1 14%     +40.8%     598.75 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.81
    347.75 =C2=B1  7%     +72.4%     599.50 =C2=B1  6%  sched_debug.cpu.ttw=
u_count.83
    360.25 =C2=B1  7%     +68.8%     608.00 =C2=B1 18%  sched_debug.cpu.ttw=
u_count.84
    362.00 =C2=B1 26%     +72.0%     622.75 =C2=B1 27%  sched_debug.cpu.ttw=
u_count.86
    392.00 =C2=B1  5%     +54.5%     605.75 =C2=B1 16%  sched_debug.cpu.ttw=
u_count.88
    337.00 =C2=B1 24%     +57.8%     531.75 =C2=B1 14%  sched_debug.cpu.ttw=
u_count.89
    319.50 =C2=B1 12%     +56.3%     499.25 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.91
    357.00 =C2=B1 18%     +84.1%     657.25 =C2=B1 25%  sched_debug.cpu.ttw=
u_count.92
    361.75 =C2=B1 18%     +50.1%     543.00 =C2=B1 14%  sched_debug.cpu.ttw=
u_count.94
      1820 =C2=B1  0%     +82.2%       3317 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.avg
     17935 =C2=B1 19%    +184.8%      51087 =C2=B1  0%  sched_debug.cpu.ttw=
u_count.max
     86.42 =C2=B1 17%     +42.1%     122.79 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.min
      3049 =C2=B1  8%     +80.5%       5503 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.stddev
      5181 =C2=B1 20%     +40.2%       7262 =C2=B1 12%  sched_debug.cpu.ttw=
u_local.0
    555.75 =C2=B1 25%    +200.9%       1672 =C2=B1 42%  sched_debug.cpu.ttw=
u_local.1
    238.50 =C2=B1  8%     +50.8%     359.75 =C2=B1 17%  sched_debug.cpu.ttw=
u_local.100
    288.25 =C2=B1 24%    +398.8%       1437 =C2=B1 53%  sched_debug.cpu.ttw=
u_local.13
    408.00 =C2=B1 37%    +267.8%       1500 =C2=B1 50%  sched_debug.cpu.ttw=
u_local.14
      2151 =C2=B1 76%    +145.2%       5276 =C2=B1 27%  sched_debug.cpu.ttw=
u_local.16
    762.50 =C2=B1 50%    +132.7%       1774 =C2=B1 22%  sched_debug.cpu.ttw=
u_local.20
    658.75 =C2=B1 62%    +313.4%       2723 =C2=B1 49%  sched_debug.cpu.ttw=
u_local.22
    800.25 =C2=B1101%    +281.9%       3056 =C2=B1 54%  sched_debug.cpu.ttw=
u_local.29
    686.50 =C2=B1 83%    +484.2%       4010 =C2=B1 50%  sched_debug.cpu.ttw=
u_local.30
    614.50 =C2=B1 83%    +166.9%       1640 =C2=B1 26%  sched_debug.cpu.ttw=
u_local.33
    382.00 =C2=B1 40%    +317.5%       1595 =C2=B1 31%  sched_debug.cpu.ttw=
u_local.35
    387.75 =C2=B1 21%    +333.7%       1681 =C2=B1 28%  sched_debug.cpu.ttw=
u_local.37
    409.50 =C2=B1 51%    +289.7%       1596 =C2=B1 32%  sched_debug.cpu.ttw=
u_local.38
    496.50 =C2=B1 68%    +221.7%       1597 =C2=B1 32%  sched_debug.cpu.ttw=
u_local.39
    344.50 =C2=B1  8%    +327.6%       1473 =C2=B1 43%  sched_debug.cpu.ttw=
u_local.4
    517.50 =C2=B1 69%    +200.6%       1555 =C2=B1 31%  sched_debug.cpu.ttw=
u_local.40
    784.75 =C2=B1 80%    +107.8%       1631 =C2=B1 32%  sched_debug.cpu.ttw=
u_local.41
    491.25 =C2=B1 59%   +2652.7%      13522 =C2=B1154%  sched_debug.cpu.ttw=
u_local.42
    361.75 =C2=B1 28%    +342.5%       1600 =C2=B1 29%  sched_debug.cpu.ttw=
u_local.43
    443.50 =C2=B1 60%    +257.4%       1585 =C2=B1 30%  sched_debug.cpu.ttw=
u_local.44
    459.50 =C2=B1 65%    +253.2%       1623 =C2=B1 30%  sched_debug.cpu.ttw=
u_local.45
    342.00 =C2=B1 27%    +377.8%       1634 =C2=B1 30%  sched_debug.cpu.ttw=
u_local.46
    334.50 =C2=B1 23%    +399.0%       1669 =C2=B1 25%  sched_debug.cpu.ttw=
u_local.47
    275.50 =C2=B1 42%    +450.5%       1516 =C2=B1 48%  sched_debug.cpu.ttw=
u_local.5
    248.00 =C2=B1 26%    +976.4%       2669 =C2=B1 63%  sched_debug.cpu.ttw=
u_local.6
    240.25 =C2=B1 23%    +517.2%       1482 =C2=B1 47%  sched_debug.cpu.ttw=
u_local.7
    152.75 =C2=B1 33%    +864.6%       1473 =C2=B1123%  sched_debug.cpu.ttw=
u_local.74
    144.00 =C2=B1 45%    +148.1%     357.25 =C2=B1 25%  sched_debug.cpu.ttw=
u_local.79
    302.25 =C2=B1 45%    +414.6%       1555 =C2=B1 45%  sched_debug.cpu.ttw=
u_local.8
    254.25 =C2=B1 18%    +197.8%     757.25 =C2=B1 83%  sched_debug.cpu.ttw=
u_local.80
    263.25 =C2=B1  9%     +62.3%     427.25 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.81
    245.00 =C2=B1 16%     +57.3%     385.50 =C2=B1 12%  sched_debug.cpu.ttw=
u_local.82
    229.75 =C2=B1  3%     +92.2%     441.50 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.83
    238.50 =C2=B1  5%     +84.6%     440.25 =C2=B1 12%  sched_debug.cpu.ttw=
u_local.84
    218.00 =C2=B1 12%     +99.1%     434.00 =C2=B1 16%  sched_debug.cpu.ttw=
u_local.86
    211.50 =C2=B1 15%    +103.2%     429.75 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.87
    234.50 =C2=B1  9%     +85.1%     434.00 =C2=B1 10%  sched_debug.cpu.ttw=
u_local.88
    211.00 =C2=B1 15%     +88.5%     397.75 =C2=B1 15%  sched_debug.cpu.ttw=
u_local.89
    218.50 =C2=B1  3%     +86.6%     407.75 =C2=B1 11%  sched_debug.cpu.ttw=
u_local.90
    211.25 =C2=B1  9%     +83.4%     387.50 =C2=B1 13%  sched_debug.cpu.ttw=
u_local.91
    230.50 =C2=B1 14%     +75.5%     404.50 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.92
    223.25 =C2=B1  7%     +86.6%     416.50 =C2=B1 11%  sched_debug.cpu.ttw=
u_local.93
    221.75 =C2=B1  7%     +89.3%     419.75 =C2=B1 13%  sched_debug.cpu.ttw=
u_local.94
    211.75 =C2=B1  1%     +97.6%     418.50 =C2=B1 11%  sched_debug.cpu.ttw=
u_local.95
    238.00 =C2=B1  9%     +63.6%     389.25 =C2=B1 17%  sched_debug.cpu.ttw=
u_local.96
    718.10 =C2=B1  0%    +109.3%       1502 =C2=B1  2%  sched_debug.cpu.ttw=
u_local.avg
     12099 =C2=B1 26%    +317.5%      50519 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.max
     66.42 =C2=B1 10%     +56.6%     104.04 =C2=B1  2%  sched_debug.cpu.ttw=
u_local.min
      1696 =C2=B1 17%    +170.6%       4591 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.stddev
      0.13 =C2=B1 47%     +59.7%       0.21 =C2=B1  3%  sched_debug.rt_rq:/=
.rt_time.avg
      0.93 =C2=B1 43%     +55.7%       1.44 =C2=B1  2%  sched_debug.rt_rq:/=
.rt_time.stddev

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-sbx04/po=
ll2/will-it-scale

commit: =

  cf5ebed4d0a77c055f5ef1a7978898ac0dcb2ae7
  23a197a19f9ad0438a6445b0b3a0f5c6d3381da5

cf5ebed4d0a77c05 23a197a19f9ad0438a6445b0b3 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    269466 =C2=B1  0%      -2.2%     263529 =C2=B1  0%  will-it-scale.per_t=
hread_ops
      0.50 =C2=B1  1%      -6.9%       0.47 =C2=B1  0%  will-it-scale.scala=
bility
     14610 =C2=B1  8%   +3046.1%     459663 =C2=B1  6%  will-it-scale.time.=
involuntary_context_switches
    239.50 =C2=B1  0%      -1.9%     234.93 =C2=B1  0%  will-it-scale.time.=
user_time
      3686 =C2=B1 11%    +287.8%      14294 =C2=B1  1%  will-it-scale.time.=
voluntary_context_switches
      2375 =C2=B1  9%     +16.1%       2758 =C2=B1  4%  numa-meminfo.node1.=
KernelStack
     23.66 =C2=B1  1%     -11.4%      20.97 =C2=B1  1%  perf-profile.cycles=
.__fget_light.do_sys_poll.sys_poll.entry_SYSCALL_64_fastpath
    504711 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  softirqs.RCU
    207.07 =C2=B1  0%      -1.3%     204.41 =C2=B1  0%  turbostat.CorWatt
      2268 =C2=B1  2%    +260.5%       8176 =C2=B1  4%  vmstat.system.cs
  39146398 =C2=B1 26%     +44.0%   56352796 =C2=B1 15%  cpuidle.C1-SNB.time
     97325 =C2=B1  6%     +19.1%     115951 =C2=B1  7%  cpuidle.C1-SNB.usage
     14610 =C2=B1  8%   +3046.1%     459663 =C2=B1  6%  time.involuntary_co=
ntext_switches
      3686 =C2=B1 11%    +287.8%      14294 =C2=B1  1%  time.voluntary_cont=
ext_switches
    208991 =C2=B1  6%     +18.6%     247862 =C2=B1  5%  numa-numastat.node2=
.local_node
    212194 =C2=B1  6%     +18.2%     250745 =C2=B1  5%  numa-numastat.node2=
.numa_hit
    395027 =C2=B1  2%      -9.3%     358295 =C2=B1  3%  numa-numastat.node3=
.local_node
    398234 =C2=B1  2%      -9.5%     360358 =C2=B1  3%  numa-numastat.node3=
.numa_hit
    660.33 =C2=B1 51%   +1499.1%      10559 =C2=B1  3%  latency_stats.hits.=
do_unlinkat.SyS_unlink.entry_SYSCALL_64_fastpath
    846.89 =C2=B1 48%   +1249.6%      11429 =C2=B1  3%  latency_stats.hits.=
path_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
    114526 =C2=B1 27%     -79.8%      23157 =C2=B1  1%  latency_stats.max.e=
xpand_files.__alloc_fd.get_unused_fd_flags.do_sys_open.SyS_open.entry_SYSCA=
LL_64_fastpath
     43601 =C2=B1110%   +7832.4%    3458618 =C2=B1  2%  latency_stats.sum.d=
o_unlinkat.SyS_unlink.entry_SYSCALL_64_fastpath
     51343 =C2=B1 92%   +6567.2%    3423158 =C2=B1  4%  latency_stats.sum.p=
ath_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
     48740 =C2=B1 21%     +59.2%      77615 =C2=B1 17%  sched_debug.cfs_rq:=
/.exec_clock.1
     47540 =C2=B1 14%     +87.9%      89319 =C2=B1  7%  sched_debug.cfs_rq:=
/.exec_clock.2
     23608 =C2=B1 17%     +34.7%      31809 =C2=B1  6%  sched_debug.cfs_rq:=
/.exec_clock.23
     13595 =C2=B1 25%     +38.3%      18807 =C2=B1 13%  sched_debug.cfs_rq:=
/.exec_clock.26
     48729 =C2=B1 25%     +59.9%      77915 =C2=B1 11%  sched_debug.cfs_rq:=
/.exec_clock.3
     11818 =C2=B1 25%     +52.6%      18031 =C2=B1 18%  sched_debug.cfs_rq:=
/.exec_clock.31
     80222 =C2=B1 13%     -35.9%      51422 =C2=B1 26%  sched_debug.cfs_rq:=
/.exec_clock.33
     81765 =C2=B1  8%     -51.5%      39669 =C2=B1 16%  sched_debug.cfs_rq:=
/.exec_clock.34
     80286 =C2=B1 15%     -36.9%      50694 =C2=B1 17%  sched_debug.cfs_rq:=
/.exec_clock.35
     81359 =C2=B1 11%     -36.7%      51490 =C2=B1 22%  sched_debug.cfs_rq:=
/.exec_clock.36
     75376 =C2=B1 11%     -32.7%      50731 =C2=B1 17%  sched_debug.cfs_rq:=
/.exec_clock.37
     79588 =C2=B1 13%     -27.3%      57868 =C2=B1 10%  sched_debug.cfs_rq:=
/.exec_clock.38
     82471 =C2=B1 14%     -26.6%      60514 =C2=B1 18%  sched_debug.cfs_rq:=
/.exec_clock.39
     47510 =C2=B1 19%     +62.9%      77400 =C2=B1 14%  sched_debug.cfs_rq:=
/.exec_clock.4
     56168 =C2=B1 11%     -17.9%      46087 =C2=B1 10%  sched_debug.cfs_rq:=
/.exec_clock.40
     55810 =C2=B1 10%     -20.9%      44156 =C2=B1 16%  sched_debug.cfs_rq:=
/.exec_clock.41
     53466 =C2=B1 15%     +45.7%      77873 =C2=B1 11%  sched_debug.cfs_rq:=
/.exec_clock.5
     36111 =C2=B1 11%     -23.1%      27753 =C2=B1  6%  sched_debug.cfs_rq:=
/.exec_clock.55
     24530 =C2=B1 14%     -22.1%      19100 =C2=B1 12%  sched_debug.cfs_rq:=
/.exec_clock.58
     49222 =C2=B1 21%     +44.0%      70881 =C2=B1  8%  sched_debug.cfs_rq:=
/.exec_clock.6
     46322 =C2=B1 26%     +47.0%      68102 =C2=B1 16%  sched_debug.cfs_rq:=
/.exec_clock.7
     42074 =C2=B1 16%     +25.8%      52910 =C2=B1 10%  sched_debug.cfs_rq:=
/.exec_clock.8
     41727 =C2=B1 13%     +28.6%      53641 =C2=B1 15%  sched_debug.cfs_rq:=
/.exec_clock.9
      2.89 =C2=B1 59%   +1291.5%      40.20 =C2=B1123%  sched_debug.cfs_rq:=
/.load.18
     19.67 =C2=B1 13%     +76.9%      34.80 =C2=B1 42%  sched_debug.cfs_rq:=
/.load_avg.14
     27.00 =C2=B1 38%    +123.7%      60.40 =C2=B1 51%  sched_debug.cfs_rq:=
/.load_avg.2
     38.00 =C2=B1 14%     -64.5%      13.50 =C2=B1 29%  sched_debug.cfs_rq:=
/.load_avg.34
     11.00 =C2=B1  7%    +118.2%      24.00 =C2=B1 67%  sched_debug.cfs_rq:=
/.load_avg.44
     22.11 =C2=B1 36%    +101.7%      44.60 =C2=B1 45%  sched_debug.cfs_rq:=
/.load_avg.5
      2.43 =C2=B1  3%     +30.5%       3.17 =C2=B1  4%  sched_debug.cfs_rq:=
/.load_avg.min
   1492009 =C2=B1 10%     +33.2%    1986708 =C2=B1 14%  sched_debug.cfs_rq:=
/.min_vruntime.1
   1474591 =C2=B1 10%     +44.0%    2123228 =C2=B1  7%  sched_debug.cfs_rq:=
/.min_vruntime.2
    910787 =C2=B1 13%     +33.1%    1211826 =C2=B1  7%  sched_debug.cfs_rq:=
/.min_vruntime.23
    663973 =C2=B1 17%     +31.0%     869897 =C2=B1 11%  sched_debug.cfs_rq:=
/.min_vruntime.26
   1450278 =C2=B1 16%     +33.7%    1938900 =C2=B1  6%  sched_debug.cfs_rq:=
/.min_vruntime.3
   1976367 =C2=B1  7%     -25.8%    1465638 =C2=B1 19%  sched_debug.cfs_rq:=
/.min_vruntime.33
   1993782 =C2=B1  7%     -33.3%    1330473 =C2=B1 12%  sched_debug.cfs_rq:=
/.min_vruntime.34
   2017985 =C2=B1 11%     -25.0%    1514025 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.35
   1955927 =C2=B1  7%     -22.2%    1522411 =C2=B1 11%  sched_debug.cfs_rq:=
/.min_vruntime.36
   1920750 =C2=B1  8%     -22.4%    1490911 =C2=B1 13%  sched_debug.cfs_rq:=
/.min_vruntime.37
   2042645 =C2=B1  9%     -21.5%    1603863 =C2=B1  9%  sched_debug.cfs_rq:=
/.min_vruntime.38
   1514891 =C2=B1  9%     +27.4%    1929921 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.4
   1793027 =C2=B1  9%     -13.8%    1545832 =C2=B1  9%  sched_debug.cfs_rq:=
/.min_vruntime.40
   1763489 =C2=B1  6%     -14.6%    1506333 =C2=B1 11%  sched_debug.cfs_rq:=
/.min_vruntime.41
   1548194 =C2=B1 10%     +26.7%    1961145 =C2=B1 10%  sched_debug.cfs_rq:=
/.min_vruntime.5
   1362845 =C2=B1  9%     -23.1%    1047400 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.55
   1101376 =C2=B1 13%     -15.7%     928426 =C2=B1  9%  sched_debug.cfs_rq:=
/.min_vruntime.56
   1087591 =C2=B1 10%     -20.2%     868099 =C2=B1 11%  sched_debug.cfs_rq:=
/.min_vruntime.58
   1424991 =C2=B1 13%     +29.6%    1847371 =C2=B1  7%  sched_debug.cfs_rq:=
/.min_vruntime.6
   1140370 =C2=B1  8%     -19.9%     913888 =C2=B1 15%  sched_debug.cfs_rq:=
/.min_vruntime.63
   1422069 =C2=B1 11%     +16.3%    1653897 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.8
   1452348 =C2=B1  8%     +16.6%    1693567 =C2=B1 10%  sched_debug.cfs_rq:=
/.min_vruntime.9
      0.48 =C2=B1 16%     +90.7%       0.91 =C2=B1 10%  sched_debug.cfs_rq:=
/.nr_spread_over.avg
      1.02 =C2=B1  9%     +47.6%       1.51 =C2=B1 13%  sched_debug.cfs_rq:=
/.nr_spread_over.stddev
      2.56 =C2=B1 32%    +420.4%      13.30 =C2=B1111%  sched_debug.cfs_rq:=
/.runnable_load_avg.18
     16.44 =C2=B1 52%    +145.1%      40.30 =C2=B1 10%  sched_debug.cfs_rq:=
/.runnable_load_avg.2
     36.11 =C2=B1 14%     -72.3%      10.00 =C2=B1 41%  sched_debug.cfs_rq:=
/.runnable_load_avg.34
     14865 =C2=B11740%   +4876.1%     739742 =C2=B1 36%  sched_debug.cfs_rq=
:/.spread0.2
   -829225 =C2=B1-21%     -36.0%    -530686 =C2=B1-31%  sched_debug.cfs_rq:=
/.spread0.25
     -9452 =C2=B1-2914%   -5975.7%     555411 =C2=B1 44%  sched_debug.cfs_r=
q:/.spread0.3
    516403 =C2=B1 45%     -84.2%      81821 =C2=B1288%  sched_debug.cfs_rq:=
/.spread0.33
    533809 =C2=B1 33%    -110.0%     -53350 =C2=B1-313%  sched_debug.cfs_rq=
:/.spread0.34
    558006 =C2=B1 51%     -76.7%     130197 =C2=B1108%  sched_debug.cfs_rq:=
/.spread0.35
     55147 =C2=B1302%    +890.8%     546417 =C2=B1 47%  sched_debug.cfs_rq:=
/.spread0.4
     88448 =C2=B1268%    +553.1%     577635 =C2=B1 35%  sched_debug.cfs_rq:=
/.spread0.5
    -37699 =C2=B1-398%    -817.1%     270346 =C2=B1 86%  sched_debug.cfs_rq=
:/.spread0.8
     19.78 =C2=B1 13%     +74.9%      34.60 =C2=B1 43%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.14
     27.00 =C2=B1 38%    +123.7%      60.40 =C2=B1 51%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.2
     38.33 =C2=B1 13%     -64.8%      13.50 =C2=B1 29%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.34
     11.00 =C2=B1  7%    +118.2%      24.00 =C2=B1 67%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.44
     22.11 =C2=B1 36%    +101.7%      44.60 =C2=B1 45%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.5
      2.43 =C2=B1  3%     +30.5%       3.17 =C2=B1  4%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.min
    197.11 =C2=B1 22%     +92.7%     379.90 =C2=B1 32%  sched_debug.cfs_rq:=
/.util_avg.18
    471.11 =C2=B1 16%     +64.9%     776.80 =C2=B1 14%  sched_debug.cfs_rq:=
/.util_avg.2
    221.78 =C2=B1 24%     +51.6%     336.20 =C2=B1 14%  sched_debug.cfs_rq:=
/.util_avg.20
    218.56 =C2=B1 19%     +68.7%     368.70 =C2=B1 13%  sched_debug.cfs_rq:=
/.util_avg.21
    752.67 =C2=B1 10%     -37.0%     474.20 =C2=B1 20%  sched_debug.cfs_rq:=
/.util_avg.34
    482.89 =C2=B1 13%     +39.2%     672.10 =C2=B1 19%  sched_debug.cfs_rq:=
/.util_avg.5
    531.67 =C2=B1  7%     -32.3%     359.90 =C2=B1 25%  sched_debug.cfs_rq:=
/.util_avg.50
    506.22 =C2=B1  0%     -27.3%     367.90 =C2=B1 14%  sched_debug.cfs_rq:=
/.util_avg.54
    508.89 =C2=B1  0%     -31.3%     349.80 =C2=B1 22%  sched_debug.cfs_rq:=
/.util_avg.58
    811301 =C2=B1  9%     -25.3%     606166 =C2=B1 13%  sched_debug.cpu.avg=
_idle.1
    795707 =C2=B1  6%     -21.8%     622576 =C2=B1 18%  sched_debug.cpu.avg=
_idle.10
    796958 =C2=B1  8%     -22.8%     615593 =C2=B1 13%  sched_debug.cpu.avg=
_idle.11
    816872 =C2=B1  7%     -22.2%     635701 =C2=B1 13%  sched_debug.cpu.avg=
_idle.13
    820710 =C2=B1 10%     -22.8%     633237 =C2=B1 10%  sched_debug.cpu.avg=
_idle.14
    823635 =C2=B1  6%     -26.6%     604174 =C2=B1 20%  sched_debug.cpu.avg=
_idle.15
    946244 =C2=B1  6%     -15.5%     799627 =C2=B1  6%  sched_debug.cpu.avg=
_idle.19
    755069 =C2=B1 11%     -34.3%     496291 =C2=B1 20%  sched_debug.cpu.avg=
_idle.32
    722133 =C2=B1  7%     -22.3%     561172 =C2=B1 13%  sched_debug.cpu.avg=
_idle.35
    776010 =C2=B1  7%     -20.3%     618589 =C2=B1 10%  sched_debug.cpu.avg=
_idle.40
    741488 =C2=B1  8%     -17.0%     615347 =C2=B1 11%  sched_debug.cpu.avg=
_idle.43
    745770 =C2=B1  7%     -19.3%     601566 =C2=B1 11%  sched_debug.cpu.avg=
_idle.44
    714112 =C2=B1  7%     -16.1%     598794 =C2=B1  7%  sched_debug.cpu.avg=
_idle.45
    727139 =C2=B1 10%     -14.3%     623048 =C2=B1  8%  sched_debug.cpu.avg=
_idle.46
    754170 =C2=B1  9%     -22.8%     582591 =C2=B1 10%  sched_debug.cpu.avg=
_idle.47
    828198 =C2=B1  8%     -22.4%     642999 =C2=B1 12%  sched_debug.cpu.avg=
_idle.5
    817767 =C2=B1  8%     -27.7%     591179 =C2=B1 18%  sched_debug.cpu.avg=
_idle.6
    768438 =C2=B1  2%     -12.7%     670524 =C2=B1 10%  sched_debug.cpu.avg=
_idle.62
    826066 =C2=B1  7%     -28.1%     594318 =C2=B1 16%  sched_debug.cpu.avg=
_idle.7
    791945 =C2=B1  7%     -21.6%     620972 =C2=B1 12%  sched_debug.cpu.avg=
_idle.8
    845610 =C2=B1  6%     -25.8%     627290 =C2=B1 15%  sched_debug.cpu.avg=
_idle.9
    802352 =C2=B1  3%     -13.7%     692537 =C2=B1  1%  sched_debug.cpu.avg=
_idle.avg
    259806 =C2=B1 15%     -80.1%      51705 =C2=B1 88%  sched_debug.cpu.avg=
_idle.min
    219158 =C2=B1  9%     +37.8%     302044 =C2=B1  3%  sched_debug.cpu.avg=
_idle.stddev
     16.44 =C2=B1 51%    +234.5%      55.00 =C2=B1 61%  sched_debug.cpu.cpu=
_load[0].2
     36.00 =C2=B1 14%     -72.2%      10.00 =C2=B1 41%  sched_debug.cpu.cpu=
_load[0].34
     16.89 =C2=B1 50%    +183.6%      47.90 =C2=B1 34%  sched_debug.cpu.cpu=
_load[1].2
     36.00 =C2=B1 14%     -72.5%       9.90 =C2=B1 42%  sched_debug.cpu.cpu=
_load[1].34
     16.89 =C2=B1 50%    +162.3%      44.30 =C2=B1 19%  sched_debug.cpu.cpu=
_load[2].2
     36.00 =C2=B1 14%     -72.8%       9.80 =C2=B1 43%  sched_debug.cpu.cpu=
_load[2].34
     16.56 =C2=B1 49%    +158.5%      42.80 =C2=B1 12%  sched_debug.cpu.cpu=
_load[3].2
     36.00 =C2=B1 14%     -72.8%       9.80 =C2=B1 43%  sched_debug.cpu.cpu=
_load[3].34
     16.22 =C2=B1 50%    +159.5%      42.10 =C2=B1 14%  sched_debug.cpu.cpu=
_load[4].2
     36.00 =C2=B1 14%     -73.1%       9.70 =C2=B1 44%  sched_debug.cpu.cpu=
_load[4].34
      1854 =C2=B1  5%     +78.9%       3319 =C2=B1 22%  sched_debug.cpu.cur=
r->pid.17
      1801 =C2=B1  1%     +81.1%       3261 =C2=B1 22%  sched_debug.cpu.cur=
r->pid.18
      1892 =C2=B1 14%     +61.1%       3049 =C2=B1 21%  sched_debug.cpu.cur=
r->pid.19
      2005 =C2=B1 20%     +62.4%       3258 =C2=B1 16%  sched_debug.cpu.cur=
r->pid.22
      2014 =C2=B1 13%     +60.2%       3227 =C2=B1 16%  sched_debug.cpu.cur=
r->pid.23
      4031 =C2=B1  7%     +17.2%       4723 =C2=B1 12%  sched_debug.cpu.cur=
r->pid.4
      1841 =C2=B1  3%      +6.4%       1959 =C2=B1  5%  sched_debug.cpu.cur=
r->pid.stddev
     71626 =C2=B1 12%     +25.0%      89536 =C2=B1 14%  sched_debug.cpu.nr_=
load_updates.1
     69877 =C2=B1  8%     +45.3%     101566 =C2=B1  6%  sched_debug.cpu.nr_=
load_updates.2
     55811 =C2=B1  5%     +10.4%      61607 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.23
     72170 =C2=B1 14%     +29.0%      93090 =C2=B1  8%  sched_debug.cpu.nr_=
load_updates.3
     95374 =C2=B1  8%     -22.2%      74209 =C2=B1 13%  sched_debug.cpu.nr_=
load_updates.33
     96429 =C2=B1  5%     -31.9%      65684 =C2=B1  7%  sched_debug.cpu.nr_=
load_updates.34
     95532 =C2=B1  9%     -22.8%      73767 =C2=B1  8%  sched_debug.cpu.nr_=
load_updates.35
     96192 =C2=B1  6%     -22.9%      74178 =C2=B1 11%  sched_debug.cpu.nr_=
load_updates.36
     92007 =C2=B1  6%     -19.8%      73777 =C2=B1  8%  sched_debug.cpu.nr_=
load_updates.37
     94962 =C2=B1  7%     -16.7%      79126 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.38
     97060 =C2=B1  9%     -16.7%      80855 =C2=B1  9%  sched_debug.cpu.nr_=
load_updates.39
     71687 =C2=B1  9%     +29.1%      92546 =C2=B1 10%  sched_debug.cpu.nr_=
load_updates.4
     78023 =C2=B1  5%      -9.8%      70346 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.40
     76329 =C2=B1  7%     +22.9%      93843 =C2=B1  7%  sched_debug.cpu.nr_=
load_updates.5
     72411 =C2=B1 13%     +22.3%      88562 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.6
     55751 =C2=B1  4%      -7.6%      51511 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.63
     70980 =C2=B1 12%     +22.2%      86763 =C2=B1  9%  sched_debug.cpu.nr_=
load_updates.7
     12051 =C2=B1 20%     +78.2%      21476 =C2=B1 13%  sched_debug.cpu.nr_=
switches.0
      4717 =C2=B1 31%    +320.1%      19818 =C2=B1 21%  sched_debug.cpu.nr_=
switches.1
      5447 =C2=B1 46%    +229.9%      17969 =C2=B1 35%  sched_debug.cpu.nr_=
switches.11
      9817 =C2=B1 47%     +65.3%      16228 =C2=B1 17%  sched_debug.cpu.nr_=
switches.12
      6501 =C2=B1 49%    +197.4%      19332 =C2=B1 21%  sched_debug.cpu.nr_=
switches.14
      5038 =C2=B1 45%    +247.0%      17482 =C2=B1 27%  sched_debug.cpu.nr_=
switches.15
      4731 =C2=B1 16%    +304.0%      19112 =C2=B1 17%  sched_debug.cpu.nr_=
switches.2
      3335 =C2=B1 27%    +408.6%      16964 =C2=B1 14%  sched_debug.cpu.nr_=
switches.3
     11125 =C2=B1 45%    +116.9%      24133 =C2=B1 41%  sched_debug.cpu.nr_=
switches.30
      2092 =C2=B1107%    +749.2%      17766 =C2=B1 20%  sched_debug.cpu.nr_=
switches.32
      1949 =C2=B1 71%    +452.5%      10772 =C2=B1 15%  sched_debug.cpu.nr_=
switches.33
    998.44 =C2=B1 57%    +846.4%       9449 =C2=B1 19%  sched_debug.cpu.nr_=
switches.34
      1588 =C2=B1 91%    +688.4%      12527 =C2=B1 31%  sched_debug.cpu.nr_=
switches.35
      1366 =C2=B1102%    +809.0%      12424 =C2=B1 24%  sched_debug.cpu.nr_=
switches.36
      1050 =C2=B1 38%   +1013.5%      11695 =C2=B1 37%  sched_debug.cpu.nr_=
switches.37
      1019 =C2=B1 34%   +1089.3%      12121 =C2=B1  9%  sched_debug.cpu.nr_=
switches.38
      1963 =C2=B1105%    +517.7%      12125 =C2=B1 18%  sched_debug.cpu.nr_=
switches.39
      2680 =C2=B1 51%    +502.0%      16132 =C2=B1  9%  sched_debug.cpu.nr_=
switches.4
      1372 =C2=B1 41%    +670.4%      10573 =C2=B1  6%  sched_debug.cpu.nr_=
switches.40
      1276 =C2=B1 11%    +890.9%      12646 =C2=B1 37%  sched_debug.cpu.nr_=
switches.41
      1145 =C2=B1 14%    +855.0%      10939 =C2=B1 15%  sched_debug.cpu.nr_=
switches.42
      1658 =C2=B1 24%    +687.7%      13060 =C2=B1 31%  sched_debug.cpu.nr_=
switches.43
      1896 =C2=B1 45%    +516.9%      11698 =C2=B1 30%  sched_debug.cpu.nr_=
switches.44
      1640 =C2=B1 43%    +594.8%      11397 =C2=B1 12%  sched_debug.cpu.nr_=
switches.45
      1379 =C2=B1 44%    +717.0%      11267 =C2=B1  9%  sched_debug.cpu.nr_=
switches.46
      1071 =C2=B1 10%   +1000.6%      11790 =C2=B1  9%  sched_debug.cpu.nr_=
switches.47
      2862 =C2=B1 61%    +208.0%       8816 =C2=B1 11%  sched_debug.cpu.nr_=
switches.48
      3242 =C2=B1 69%    +230.0%      10698 =C2=B1 41%  sched_debug.cpu.nr_=
switches.49
      2718 =C2=B1 74%    +485.3%      15912 =C2=B1  7%  sched_debug.cpu.nr_=
switches.5
      2948 =C2=B1 57%    +198.7%       8806 =C2=B1 26%  sched_debug.cpu.nr_=
switches.50
      2901 =C2=B1 87%    +244.9%      10006 =C2=B1 41%  sched_debug.cpu.nr_=
switches.51
      2624 =C2=B1 75%    +337.6%      11482 =C2=B1 52%  sched_debug.cpu.nr_=
switches.52
      1690 =C2=B1 47%    +491.2%       9993 =C2=B1 37%  sched_debug.cpu.nr_=
switches.53
      2119 =C2=B1 52%    +302.8%       8537 =C2=B1 22%  sched_debug.cpu.nr_=
switches.54
      1983 =C2=B1 28%    +221.7%       6380 =C2=B1  7%  sched_debug.cpu.nr_=
switches.58
      2100 =C2=B1 36%    +440.2%      11345 =C2=B1 43%  sched_debug.cpu.nr_=
switches.59
      2106 =C2=B1 31%    +666.9%      16151 =C2=B1 22%  sched_debug.cpu.nr_=
switches.6
      2173 =C2=B1 24%    +304.7%       8798 =C2=B1 47%  sched_debug.cpu.nr_=
switches.60
      2007 =C2=B1 36%    +303.3%       8095 =C2=B1 36%  sched_debug.cpu.nr_=
switches.62
      1957 =C2=B1 20%    +382.3%       9441 =C2=B1 45%  sched_debug.cpu.nr_=
switches.63
      1952 =C2=B1 41%    +684.9%      15321 =C2=B1 16%  sched_debug.cpu.nr_=
switches.7
      5615 =C2=B1 27%    +267.9%      20661 =C2=B1 29%  sched_debug.cpu.nr_=
switches.8
      6138 =C2=B1 41%    +190.4%      17824 =C2=B1 17%  sched_debug.cpu.nr_=
switches.9
      5391 =C2=B1  2%    +165.1%      14289 =C2=B1  2%  sched_debug.cpu.nr_=
switches.avg
     31429 =C2=B1  8%     +32.7%      41691 =C2=B1  9%  sched_debug.cpu.nr_=
switches.max
    584.15 =C2=B1  9%    +841.7%       5501 =C2=B1  7%  sched_debug.cpu.nr_=
switches.min
      6402 =C2=B1  7%     +12.1%       7173 =C2=B1  6%  sched_debug.cpu.nr_=
switches.stddev
      5237 =C2=B1 49%    +308.7%      21403 =C2=B1 23%  sched_debug.cpu.sch=
ed_count.1
      6273 =C2=B1 43%    +196.9%      18624 =C2=B1 32%  sched_debug.cpu.sch=
ed_count.11
      5569 =C2=B1 37%    +233.9%      18592 =C2=B1 24%  sched_debug.cpu.sch=
ed_count.15
      9695 =C2=B1 53%    +151.9%      24422 =C2=B1 83%  sched_debug.cpu.sch=
ed_count.23
      3600 =C2=B1 32%    +541.6%      23103 =C2=B1 47%  sched_debug.cpu.sch=
ed_count.3
     11174 =C2=B1 45%    +123.8%      25007 =C2=B1 40%  sched_debug.cpu.sch=
ed_count.30
      2345 =C2=B1117%    +661.7%      17864 =C2=B1 21%  sched_debug.cpu.sch=
ed_count.32
      1982 =C2=B1 70%    +476.7%      11431 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.33
      1032 =C2=B1 55%    +815.9%       9459 =C2=B1 18%  sched_debug.cpu.sch=
ed_count.34
      2482 =C2=B1100%    +405.0%      12539 =C2=B1 31%  sched_debug.cpu.sch=
ed_count.35
      1397 =C2=B1 99%    +812.2%      12750 =C2=B1 23%  sched_debug.cpu.sch=
ed_count.36
      1480 =C2=B1 88%    +722.9%      12178 =C2=B1 38%  sched_debug.cpu.sch=
ed_count.37
      1050 =C2=B1 33%   +1054.2%      12129 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.38
      1999 =C2=B1103%    +506.9%      12132 =C2=B1 18%  sched_debug.cpu.sch=
ed_count.39
      1400 =C2=B1 40%    +655.6%      10581 =C2=B1  6%  sched_debug.cpu.sch=
ed_count.40
      1636 =C2=B1 60%    +673.1%      12655 =C2=B1 37%  sched_debug.cpu.sch=
ed_count.41
      1170 =C2=B1 14%    +834.9%      10946 =C2=B1 15%  sched_debug.cpu.sch=
ed_count.42
      1683 =C2=B1 24%    +676.2%      13068 =C2=B1 31%  sched_debug.cpu.sch=
ed_count.43
      1920 =C2=B1 44%    +557.3%      12620 =C2=B1 28%  sched_debug.cpu.sch=
ed_count.44
      1663 =C2=B1 42%    +597.9%      11607 =C2=B1 12%  sched_debug.cpu.sch=
ed_count.45
      1399 =C2=B1 44%    +705.8%      11275 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.46
      1097 =C2=B1 11%    +974.9%      11797 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.47
      2882 =C2=B1 61%    +206.2%       8823 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.48
      3262 =C2=B1 69%    +237.3%      11003 =C2=B1 41%  sched_debug.cpu.sch=
ed_count.49
      2863 =C2=B1 71%    +495.6%      17055 =C2=B1  7%  sched_debug.cpu.sch=
ed_count.5
      3132 =C2=B1 60%    +181.4%       8813 =C2=B1 26%  sched_debug.cpu.sch=
ed_count.50
      2920 =C2=B1 86%    +242.9%      10013 =C2=B1 41%  sched_debug.cpu.sch=
ed_count.51
      2834 =C2=B1 68%    +322.2%      11967 =C2=B1 48%  sched_debug.cpu.sch=
ed_count.52
      1712 =C2=B1 46%    +484.0%      10000 =C2=B1 37%  sched_debug.cpu.sch=
ed_count.53
      2517 =C2=B1 58%    +267.9%       9262 =C2=B1 21%  sched_debug.cpu.sch=
ed_count.54
      2063 =C2=B1 32%    +213.4%       6465 =C2=B1  6%  sched_debug.cpu.sch=
ed_count.58
      2119 =C2=B1 36%    +439.5%      11432 =C2=B1 44%  sched_debug.cpu.sch=
ed_count.59
      2194 =C2=B1 23%    +301.3%       8805 =C2=B1 47%  sched_debug.cpu.sch=
ed_count.60
      2024 =C2=B1 36%    +300.2%       8103 =C2=B1 36%  sched_debug.cpu.sch=
ed_count.62
      2028 =C2=B1 20%    +365.7%       9449 =C2=B1 44%  sched_debug.cpu.sch=
ed_count.63
      2005 =C2=B1 40%    +732.9%      16703 =C2=B1 21%  sched_debug.cpu.sch=
ed_count.7
      6293 =C2=B1 35%    +232.0%      20896 =C2=B1 28%  sched_debug.cpu.sch=
ed_count.8
      7180 =C2=B1 37%    +153.4%      18193 =C2=B1 16%  sched_debug.cpu.sch=
ed_count.9
    101108 =C2=B1  1%     +11.3%     112495 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.avg
    620.59 =C2=B1  8%    +787.6%       5508 =C2=B1  7%  sched_debug.cpu.sch=
ed_count.min
    311.22 =C2=B1 16%    +112.0%     659.80 =C2=B1 36%  sched_debug.cpu.sch=
ed_goidle.34
    376.78 =C2=B1 37%    +146.8%     929.70 =C2=B1 52%  sched_debug.cpu.sch=
ed_goidle.38
    501.89 =C2=B1 19%     +62.7%     816.80 =C2=B1 13%  sched_debug.cpu.sch=
ed_goidle.40
    499.33 =C2=B1 16%    +269.3%       1844 =C2=B1109%  sched_debug.cpu.sch=
ed_goidle.41
    472.89 =C2=B1 12%     +70.5%     806.50 =C2=B1 17%  sched_debug.cpu.sch=
ed_goidle.42
    518.89 =C2=B1 20%     +46.3%     759.00 =C2=B1 13%  sched_debug.cpu.sch=
ed_goidle.46
    446.89 =C2=B1  9%     +81.0%     808.70 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.47
    800.56 =C2=B1 30%    +267.9%       2945 =C2=B1 84%  sched_debug.cpu.sch=
ed_goidle.59
      2271 =C2=B1  2%     +30.7%       2967 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.avg
    222.24 =C2=B1  9%     +82.8%     406.37 =C2=B1  8%  sched_debug.cpu.sch=
ed_goidle.min
      2781 =C2=B1  5%     +18.5%       3295 =C2=B1  8%  sched_debug.cpu.sch=
ed_goidle.stddev
      8306 =C2=B1 13%     +50.9%      12535 =C2=B1 15%  sched_debug.cpu.ttw=
u_count.0
      2098 =C2=B1 45%    +368.1%       9822 =C2=B1 19%  sched_debug.cpu.ttw=
u_count.1
      3219 =C2=B1 28%    +221.2%      10339 =C2=B1 37%  sched_debug.cpu.ttw=
u_count.10
      5054 =C2=B1 32%     +51.8%       7672 =C2=B1 18%  sched_debug.cpu.ttw=
u_count.11
      3262 =C2=B1 59%    +147.6%       8077 =C2=B1 18%  sched_debug.cpu.ttw=
u_count.12
      2274 =C2=B1 37%    +368.1%      10645 =C2=B1 31%  sched_debug.cpu.ttw=
u_count.14
      1884 =C2=B1 16%    +367.5%       8810 =C2=B1 33%  sched_debug.cpu.ttw=
u_count.15
      2267 =C2=B1 29%    +336.2%       9890 =C2=B1 15%  sched_debug.cpu.ttw=
u_count.2
      4382 =C2=B1 52%    +122.6%       9755 =C2=B1 37%  sched_debug.cpu.ttw=
u_count.22
      2463 =C2=B1 46%    +239.5%       8364 =C2=B1  9%  sched_debug.cpu.ttw=
u_count.3
      5193 =C2=B1 29%     +99.0%      10337 =C2=B1 36%  sched_debug.cpu.ttw=
u_count.30
      1478 =C2=B1 69%    +528.1%       9283 =C2=B1 26%  sched_debug.cpu.ttw=
u_count.32
    933.00 =C2=B1 61%    +481.7%       5427 =C2=B1 15%  sched_debug.cpu.ttw=
u_count.33
    736.89 =C2=B1 53%    +567.2%       4916 =C2=B1 24%  sched_debug.cpu.ttw=
u_count.34
    832.44 =C2=B1 79%    +634.7%       6115 =C2=B1 32%  sched_debug.cpu.ttw=
u_count.35
    565.22 =C2=B1 54%   +1018.6%       6322 =C2=B1 22%  sched_debug.cpu.ttw=
u_count.36
    792.78 =C2=B1 53%    +601.0%       5557 =C2=B1 31%  sched_debug.cpu.ttw=
u_count.37
    752.00 =C2=B1 93%    +668.6%       5780 =C2=B1  8%  sched_debug.cpu.ttw=
u_count.38
    500.78 =C2=B1 33%   +1163.7%       6328 =C2=B1 17%  sched_debug.cpu.ttw=
u_count.39
      1040 =C2=B1 44%    +651.2%       7814 =C2=B1  9%  sched_debug.cpu.ttw=
u_count.4
    652.78 =C2=B1 45%    +721.6%       5363 =C2=B1  6%  sched_debug.cpu.ttw=
u_count.40
    725.89 =C2=B1 33%    +764.0%       6271 =C2=B1 37%  sched_debug.cpu.ttw=
u_count.41
    551.89 =C2=B1 12%    +874.3%       5377 =C2=B1 16%  sched_debug.cpu.ttw=
u_count.42
    770.67 =C2=B1 33%    +742.9%       6496 =C2=B1 31%  sched_debug.cpu.ttw=
u_count.43
    879.67 =C2=B1 54%    +578.3%       5966 =C2=B1 28%  sched_debug.cpu.ttw=
u_count.44
    736.44 =C2=B1 48%    +677.0%       5722 =C2=B1 12%  sched_debug.cpu.ttw=
u_count.45
    637.33 =C2=B1 50%    +776.9%       5588 =C2=B1 10%  sched_debug.cpu.ttw=
u_count.46
    463.67 =C2=B1 12%   +1187.9%       5971 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.47
      1428 =C2=B1 76%    +221.1%       4584 =C2=B1 14%  sched_debug.cpu.ttw=
u_count.48
      1231 =C2=B1 51%    +563.0%       8163 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.5
      1466 =C2=B1 53%    +214.0%       4604 =C2=B1 27%  sched_debug.cpu.ttw=
u_count.50
      1556 =C2=B1 89%    +260.8%       5614 =C2=B1 35%  sched_debug.cpu.ttw=
u_count.51
      1369 =C2=B1 77%    +315.1%       5683 =C2=B1 51%  sched_debug.cpu.ttw=
u_count.52
    877.89 =C2=B1 62%    +446.7%       4799 =C2=B1 39%  sched_debug.cpu.ttw=
u_count.53
      1237 =C2=B1 46%    +275.0%       4641 =C2=B1 29%  sched_debug.cpu.ttw=
u_count.54
    840.89 =C2=B1 27%    +300.4%       3366 =C2=B1 14%  sched_debug.cpu.ttw=
u_count.57
      1051 =C2=B1 44%    +232.4%       3496 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.58
      1058 =C2=B1 45%    +443.0%       5747 =C2=B1 45%  sched_debug.cpu.ttw=
u_count.59
      1018 =C2=B1 57%    +708.9%       8241 =C2=B1 25%  sched_debug.cpu.ttw=
u_count.6
      1222 =C2=B1 37%    +267.6%       4494 =C2=B1 47%  sched_debug.cpu.ttw=
u_count.60
      1045 =C2=B1 66%    +280.9%       3979 =C2=B1 39%  sched_debug.cpu.ttw=
u_count.62
    949.56 =C2=B1 23%    +392.1%       4673 =C2=B1 45%  sched_debug.cpu.ttw=
u_count.63
      1086 =C2=B1 49%    +631.3%       7945 =C2=B1 21%  sched_debug.cpu.ttw=
u_count.7
      3434 =C2=B1 40%    +206.9%      10539 =C2=B1 17%  sched_debug.cpu.ttw=
u_count.8
      2714 =C2=B1  2%    +166.7%       7240 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.avg
    273.22 =C2=B1 10%    +913.8%       2769 =C2=B1  8%  sched_debug.cpu.ttw=
u_count.min
      5234 =C2=B1 21%     +90.9%       9994 =C2=B1 17%  sched_debug.cpu.ttw=
u_local.0
    983.56 =C2=B1 54%    +763.3%       8491 =C2=B1 24%  sched_debug.cpu.ttw=
u_local.1
      1224 =C2=B1 41%    +436.6%       6572 =C2=B1 33%  sched_debug.cpu.ttw=
u_local.10
      1232 =C2=B1 39%    +351.3%       5560 =C2=B1 18%  sched_debug.cpu.ttw=
u_local.11
      1073 =C2=B1 57%    +462.4%       6036 =C2=B1 23%  sched_debug.cpu.ttw=
u_local.12
      1070 =C2=B1 52%    +519.1%       6629 =C2=B1 37%  sched_debug.cpu.ttw=
u_local.13
    953.89 =C2=B1 28%    +682.3%       7461 =C2=B1 34%  sched_debug.cpu.ttw=
u_local.14
    845.33 =C2=B1 25%    +597.1%       5893 =C2=B1 33%  sched_debug.cpu.ttw=
u_local.15
      1582 =C2=B1 56%    +243.4%       5435 =C2=B1 45%  sched_debug.cpu.ttw=
u_local.17
      1211 =C2=B1 36%    +597.5%       8447 =C2=B1 19%  sched_debug.cpu.ttw=
u_local.2
      1493 =C2=B1 67%    +260.5%       5385 =C2=B1 38%  sched_debug.cpu.ttw=
u_local.22
      1486 =C2=B1 50%    +276.6%       5600 =C2=B1 52%  sched_debug.cpu.ttw=
u_local.23
      2584 =C2=B1 44%    +121.6%       5727 =C2=B1 44%  sched_debug.cpu.ttw=
u_local.24
      1890 =C2=B1 30%     +75.9%       3325 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.26
      1742 =C2=B1 38%    +134.7%       4088 =C2=B1 63%  sched_debug.cpu.ttw=
u_local.28
      1548 =C2=B1 43%    +170.7%       4190 =C2=B1 51%  sched_debug.cpu.ttw=
u_local.29
    797.33 =C2=B1 42%    +782.2%       7033 =C2=B1 11%  sched_debug.cpu.ttw=
u_local.3
      1691 =C2=B1 26%    +244.5%       5825 =C2=B1 45%  sched_debug.cpu.ttw=
u_local.30
    512.78 =C2=B1162%   +1564.9%       8537 =C2=B1 20%  sched_debug.cpu.ttw=
u_local.32
    370.89 =C2=B1 98%   +1179.5%       4745 =C2=B1 16%  sched_debug.cpu.ttw=
u_local.33
    280.11 =C2=B1106%   +1451.8%       4346 =C2=B1 21%  sched_debug.cpu.ttw=
u_local.34
    268.33 =C2=B1 81%   +2052.3%       5775 =C2=B1 33%  sched_debug.cpu.ttw=
u_local.35
    325.89 =C2=B1 96%   +1668.9%       5764 =C2=B1 25%  sched_debug.cpu.ttw=
u_local.36
    306.44 =C2=B1 55%   +1614.5%       5254 =C2=B1 33%  sched_debug.cpu.ttw=
u_local.37
    274.89 =C2=B1 55%   +1836.4%       5322 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.38
    236.44 =C2=B1 64%   +2288.6%       5647 =C2=B1 19%  sched_debug.cpu.ttw=
u_local.39
    550.00 =C2=B1 80%   +1155.7%       6906 =C2=B1 11%  sched_debug.cpu.ttw=
u_local.4
    378.89 =C2=B1 61%   +1165.7%       4795 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.40
    312.44 =C2=B1 27%   +1755.4%       5797 =C2=B1 40%  sched_debug.cpu.ttw=
u_local.41
    255.78 =C2=B1 16%   +1815.0%       4898 =C2=B1 16%  sched_debug.cpu.ttw=
u_local.42
    497.22 =C2=B1 44%   +1115.5%       6043 =C2=B1 34%  sched_debug.cpu.ttw=
u_local.43
    542.00 =C2=B1 81%    +869.4%       5254 =C2=B1 31%  sched_debug.cpu.ttw=
u_local.44
    379.11 =C2=B1 53%   +1257.9%       5147 =C2=B1 13%  sched_debug.cpu.ttw=
u_local.45
    372.00 =C2=B1 65%   +1281.0%       5137 =C2=B1 10%  sched_debug.cpu.ttw=
u_local.46
    255.78 =C2=B1 17%   +2004.0%       5381 =C2=B1 12%  sched_debug.cpu.ttw=
u_local.47
    961.22 =C2=B1 82%    +309.2%       3933 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.48
    530.33 =C2=B1 72%   +1216.2%       6980 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.5
    970.44 =C2=B1 70%    +295.2%       3835 =C2=B1 31%  sched_debug.cpu.ttw=
u_local.50
      1094 =C2=B1108%    +316.1%       4551 =C2=B1 46%  sched_debug.cpu.ttw=
u_local.51
    803.44 =C2=B1110%    +517.6%       4961 =C2=B1 54%  sched_debug.cpu.ttw=
u_local.52
    487.89 =C2=B1 78%    +771.9%       4253 =C2=B1 42%  sched_debug.cpu.ttw=
u_local.53
    675.78 =C2=B1 73%    +452.2%       3731 =C2=B1 25%  sched_debug.cpu.ttw=
u_local.54
    495.56 =C2=B1 32%    +480.1%       2874 =C2=B1 17%  sched_debug.cpu.ttw=
u_local.57
    615.33 =C2=B1 42%    +348.7%       2760 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.58
    635.33 =C2=B1 53%    +710.2%       5147 =C2=B1 46%  sched_debug.cpu.ttw=
u_local.59
    510.89 =C2=B1 57%   +1259.7%       6946 =C2=B1 27%  sched_debug.cpu.ttw=
u_local.6
    654.11 =C2=B1 26%    +510.9%       3996 =C2=B1 52%  sched_debug.cpu.ttw=
u_local.60
    599.56 =C2=B1 50%    +484.3%       3503 =C2=B1 44%  sched_debug.cpu.ttw=
u_local.62
    585.56 =C2=B1 34%    +606.0%       4134 =C2=B1 52%  sched_debug.cpu.ttw=
u_local.63
    498.00 =C2=B1 71%   +1253.9%       6742 =C2=B1 18%  sched_debug.cpu.ttw=
u_local.7
      1493 =C2=B1 39%    +421.7%       7791 =C2=B1 22%  sched_debug.cpu.ttw=
u_local.8
      1120 =C2=B1 53%    +438.4%       6030 =C2=B1 14%  sched_debug.cpu.ttw=
u_local.9
      1068 =C2=B1  3%    +398.2%       5323 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.avg
      8255 =C2=B1 18%     +72.9%      14273 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.max
    103.26 =C2=B1 12%   +2115.7%       2287 =C2=B1  9%  sched_debug.cpu.ttw=
u_local.min
      1426 =C2=B1 14%     +89.9%       2708 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.stddev

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/tbox_group/test/testcase:
  gcc-4.9/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-sb03/unlink1/will-it=
-scale

commit: =

  cf5ebed4d0a77c055f5ef1a7978898ac0dcb2ae7
  23a197a19f9ad0438a6445b0b3a0f5c6d3381da5

cf5ebed4d0a77c05 23a197a19f9ad0438a6445b0b3 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      0.02 =C2=B1  2%      +9.9%       0.02 =C2=B1  2%  will-it-scale.scala=
bility
     17400 =C2=B1  2%   +4756.3%     845018 =C2=B1  2%  will-it-scale.time.=
involuntary_context_switches
    789.60 =C2=B1  0%     -52.6%     374.00 =C2=B1  4%  will-it-scale.time.=
percent_of_cpu_this_job_got
      2446 =C2=B1  0%     -52.8%       1155 =C2=B1  4%  will-it-scale.time.=
system_time
   1313005 =C2=B1  7%   +1068.8%   15345819 =C2=B1  2%  will-it-scale.time.=
voluntary_context_switches
      6091 =C2=B1  0%     +36.6%       8323 =C2=B1  1%  uptime.idle
     51021 =C2=B1  0%     -10.1%      45874 =C2=B1  0%  meminfo.SReclaimable
    102298 =C2=B1  1%     -28.5%      73130 =C2=B1  1%  meminfo.SUnreclaim
    153320 =C2=B1  1%     -22.4%     119005 =C2=B1  1%  meminfo.Slab
    277691 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  softirqs.RCU
    191352 =C2=B1  0%    +190.3%     555464 =C2=B1  3%  softirqs.SCHED
   2696133 =C2=B1  0%     -40.3%    1609274 =C2=B1  3%  softirqs.TIMER
     15.00 =C2=B1  0%     -52.7%       7.10 =C2=B1  4%  vmstat.procs.r
     19082 =C2=B1  6%   +1027.0%     215060 =C2=B1  2%  vmstat.system.cs
     18200 =C2=B1  0%     -10.8%      16230 =C2=B1  2%  vmstat.system.in
   1123981 =C2=B1  7%    +988.2%   12230843 =C2=B1  3%  latency_stats.hits.=
do_unlinkat.SyS_unlink.entry_SYSCALL_64_fastpath
   1133850 =C2=B1  7%    +972.9%   12165212 =C2=B1  1%  latency_stats.hits.=
path_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
  52288307 =C2=B1  7%   +2418.0%  1.317e+09 =C2=B1  3%  latency_stats.sum.d=
o_unlinkat.SyS_unlink.entry_SYSCALL_64_fastpath
  52376080 =C2=B1  7%   +2397.5%  1.308e+09 =C2=B1  3%  latency_stats.sum.p=
ath_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
     62000 =C2=B1  3%     -36.2%      39575 =C2=B1  6%  numa-meminfo.node0.=
SUnreclaim
     88601 =C2=B1  3%     -28.7%      63145 =C2=B1  6%  numa-meminfo.node0.=
Slab
     41571 =C2=B1  4%     -18.2%      33986 =C2=B1  8%  numa-meminfo.node1.=
SUnreclaim
     66320 =C2=B1  4%     -14.9%      56442 =C2=B1  7%  numa-meminfo.node1.=
Slab
   4738034 =C2=B1  1%     -24.2%    3592474 =C2=B1  2%  numa-numastat.node0=
.local_node
   4740508 =C2=B1  1%     -24.2%    3594535 =C2=B1  2%  numa-numastat.node0=
.numa_hit
   1573607 =C2=B1  2%     -34.4%    1031516 =C2=B1  5%  numa-numastat.node1=
.local_node
   1575260 =C2=B1  2%     -34.4%    1033580 =C2=B1  5%  numa-numastat.node1=
.numa_hit
     17400 =C2=B1  2%   +4756.3%     845018 =C2=B1  2%  time.involuntary_co=
ntext_switches
    789.60 =C2=B1  0%     -52.6%     374.00 =C2=B1  4%  time.percent_of_cpu=
_this_job_got
      2446 =C2=B1  0%     -52.8%       1155 =C2=B1  4%  time.system_time
   1313005 =C2=B1  7%   +1068.8%   15345819 =C2=B1  2%  time.voluntary_cont=
ext_switches
      0.37 =C2=B1 15%    +263.3%       1.35 =C2=B1  7%  perf-profile.cycles=
.cpu_startup_entry.start_secondary
      2.89 =C2=B1  5%     +39.0%       4.01 =C2=B1  9%  perf-profile.cycles=
.kthread.ret_from_fork
      2.75 =C2=B1  5%     +39.2%       3.83 =C2=B1  9%  perf-profile.cycles=
.rcu_nocb_kthread.kthread.ret_from_fork
      2.89 =C2=B1  5%     +39.0%       4.01 =C2=B1  9%  perf-profile.cycles=
.ret_from_fork
      0.37 =C2=B1 15%    +265.5%       1.37 =C2=B1  7%  perf-profile.cycles=
.start_secondary
     15504 =C2=B1  3%     -36.2%       9887 =C2=B1  6%  numa-vmstat.node0.n=
r_slab_unreclaimable
   3133541 =C2=B1  1%     -17.3%    2592243 =C2=B1  3%  numa-vmstat.node0.n=
uma_hit
   3095867 =C2=B1  2%     -17.2%    2563200 =C2=B1  3%  numa-vmstat.node0.n=
uma_local
     10397 =C2=B1  4%     -18.3%       8497 =C2=B1  8%  numa-vmstat.node1.n=
r_slab_unreclaimable
    802265 =C2=B1  1%     -24.5%     605589 =C2=B1  2%  numa-vmstat.node1.n=
uma_hit
    758245 =C2=B1  3%     -27.1%     552925 =C2=B1  6%  numa-vmstat.node1.n=
uma_local
 1.253e+08 =C2=B1  6%   +2090.9%  2.744e+09 =C2=B1  3%  cpuidle.C1-SNB.time
   2242433 =C2=B1  7%   +1027.6%   25285329 =C2=B1  3%  cpuidle.C1-SNB.usage
   4038413 =C2=B1 18%    +188.9%   11666215 =C2=B1  9%  cpuidle.C1E-SNB.time
      4977 =C2=B1  8%    +983.6%      53933 =C2=B1 12%  cpuidle.C1E-SNB.usa=
ge
      3986 =C2=B1  5%   +1923.8%      80680 =C2=B1 11%  cpuidle.C3-SNB.usage
    274018 =C2=B1  1%    +224.8%     890130 =C2=B1  3%  cpuidle.C7-SNB.usage
    588.80 =C2=B1 58%    +146.3%       1450 =C2=B1  7%  cpuidle.POLL.usage
     50.26 =C2=B1  0%     -51.5%      24.36 =C2=B1  3%  turbostat.%Busy
      1549 =C2=B1  0%     -51.4%     753.40 =C2=B1  3%  turbostat.Avg_MHz
     21.84 =C2=B1  0%    +116.4%      47.26 =C2=B1  1%  turbostat.CPU%c1
    108.04 =C2=B1  0%     -19.5%      87.00 =C2=B1  1%  turbostat.CorWatt
     56.70 =C2=B1  1%     -11.3%      50.30 =C2=B1  1%  turbostat.CoreTmp
     56.90 =C2=B1  0%     -11.2%      50.50 =C2=B1  1%  turbostat.PkgTmp
    135.79 =C2=B1  0%     -15.5%     114.70 =C2=B1  1%  turbostat.PkgWatt
     12766 =C2=B1  0%     -10.2%      11457 =C2=B1  0%  proc-vmstat.nr_slab=
_reclaimable
     25591 =C2=B1  1%     -28.8%      18224 =C2=B1  1%  proc-vmstat.nr_slab=
_unreclaimable
      3429 =C2=B1  3%     -18.8%       2786 =C2=B1  7%  proc-vmstat.numa_hi=
nt_faults
      3025 =C2=B1  4%     -19.3%       2443 =C2=B1  9%  proc-vmstat.numa_hi=
nt_faults_local
   6306434 =C2=B1  1%     -26.7%    4620842 =C2=B1  2%  proc-vmstat.numa_hit
   6302432 =C2=B1  1%     -26.7%    4616716 =C2=B1  2%  proc-vmstat.numa_lo=
cal
   2073761 =C2=B1  1%     -23.4%    1587893 =C2=B1  2%  proc-vmstat.pgalloc=
_dma32
  19485896 =C2=B1  2%     -28.7%   13900635 =C2=B1  2%  proc-vmstat.pgalloc=
_normal
  21542367 =C2=B1  2%     -28.1%   15479346 =C2=B1  2%  proc-vmstat.pgfree
     93092 =C2=B1  1%     -33.7%      61714 =C2=B1  0%  slabinfo.Acpi-State=
.active_objs
      1828 =C2=B1  1%     -33.7%       1212 =C2=B1  0%  slabinfo.Acpi-State=
.active_slabs
     93285 =C2=B1  1%     -33.7%      61845 =C2=B1  0%  slabinfo.Acpi-State=
.num_objs
      1828 =C2=B1  1%     -33.7%       1212 =C2=B1  0%  slabinfo.Acpi-State=
.num_slabs
     92052 =C2=B1  1%     -35.7%      59228 =C2=B1  0%  slabinfo.dentry.act=
ive_objs
      2198 =C2=B1  1%     -35.6%       1415 =C2=B1  0%  slabinfo.dentry.act=
ive_slabs
     92346 =C2=B1  1%     -35.6%      59461 =C2=B1  0%  slabinfo.dentry.num=
_objs
      2198 =C2=B1  1%     -35.6%       1415 =C2=B1  0%  slabinfo.dentry.num=
_slabs
     46111 =C2=B1  3%     -68.5%      14506 =C2=B1  3%  slabinfo.kmalloc-25=
6.active_objs
    732.60 =C2=B1  3%     -68.1%     233.40 =C2=B1  3%  slabinfo.kmalloc-25=
6.active_slabs
     46907 =C2=B1  3%     -68.1%      14963 =C2=B1  3%  slabinfo.kmalloc-25=
6.num_objs
    732.60 =C2=B1  3%     -68.1%     233.40 =C2=B1  3%  slabinfo.kmalloc-25=
6.num_slabs
     43363 =C2=B1  3%     -73.4%      11556 =C2=B1  2%  slabinfo.shmem_inod=
e_cache.active_objs
    891.40 =C2=B1  3%     -73.3%     238.20 =C2=B1  2%  slabinfo.shmem_inod=
e_cache.active_slabs
     43697 =C2=B1  3%     -73.2%      11691 =C2=B1  1%  slabinfo.shmem_inod=
e_cache.num_objs
    891.40 =C2=B1  3%     -73.3%     238.20 =C2=B1  2%  slabinfo.shmem_inod=
e_cache.num_slabs
     81760 =C2=B1  8%     -19.2%      66086 =C2=B1 17%  sched_debug.cfs_rq:=
/.exec_clock.0
     37042 =C2=B1 17%     -57.3%      15800 =C2=B1 11%  sched_debug.cfs_rq:=
/.exec_clock.10
     34652 =C2=B1 16%     -57.4%      14770 =C2=B1  5%  sched_debug.cfs_rq:=
/.exec_clock.11
     35577 =C2=B1 23%     -59.9%      14273 =C2=B1  9%  sched_debug.cfs_rq:=
/.exec_clock.12
     37511 =C2=B1 13%     -62.5%      14058 =C2=B1 14%  sched_debug.cfs_rq:=
/.exec_clock.13
     34371 =C2=B1 18%     -60.5%      13569 =C2=B1 10%  sched_debug.cfs_rq:=
/.exec_clock.14
     39322 =C2=B1 20%     -64.4%      13979 =C2=B1  7%  sched_debug.cfs_rq:=
/.exec_clock.15
     97343 =C2=B1  6%     -31.5%      66714 =C2=B1 19%  sched_debug.cfs_rq:=
/.exec_clock.16
     65666 =C2=B1  7%     -61.6%      25222 =C2=B1 27%  sched_debug.cfs_rq:=
/.exec_clock.17
     62920 =C2=B1  7%     -68.0%      20144 =C2=B1  9%  sched_debug.cfs_rq:=
/.exec_clock.18
     64259 =C2=B1 16%     -68.8%      20034 =C2=B1  7%  sched_debug.cfs_rq:=
/.exec_clock.19
     69854 =C2=B1 15%     -70.2%      20820 =C2=B1 10%  sched_debug.cfs_rq:=
/.exec_clock.20
     65025 =C2=B1 12%     -66.7%      21656 =C2=B1  9%  sched_debug.cfs_rq:=
/.exec_clock.21
     68884 =C2=B1 14%     -68.5%      21699 =C2=B1  7%  sched_debug.cfs_rq:=
/.exec_clock.22
     64494 =C2=B1  8%     -66.5%      21578 =C2=B1  5%  sched_debug.cfs_rq:=
/.exec_clock.23
     33831 =C2=B1 22%     -38.2%      20917 =C2=B1  6%  sched_debug.cfs_rq:=
/.exec_clock.24
     36706 =C2=B1 13%     -37.4%      22963 =C2=B1  7%  sched_debug.cfs_rq:=
/.exec_clock.26
     35828 =C2=B1 16%     -36.4%      22786 =C2=B1  7%  sched_debug.cfs_rq:=
/.exec_clock.27
     32117 =C2=B1 15%     -26.5%      23595 =C2=B1  8%  sched_debug.cfs_rq:=
/.exec_clock.29
     37972 =C2=B1 16%     -54.3%      17358 =C2=B1  7%  sched_debug.cfs_rq:=
/.exec_clock.8
     35335 =C2=B1 24%     -52.7%      16719 =C2=B1 13%  sched_debug.cfs_rq:=
/.exec_clock.9
     50949 =C2=B1  0%     -38.3%      31427 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.avg
     98708 =C2=B1  6%     -21.0%      78026 =C2=B1  7%  sched_debug.cfs_rq:=
/.exec_clock.max
     21856 =C2=B1 13%     -45.3%      11950 =C2=B1  7%  sched_debug.cfs_rq:=
/.exec_clock.min
    288.45 =C2=B1 21%     +71.9%     495.78 =C2=B1 31%  sched_debug.cfs_rq:=
/.load.max
     71.19 =C2=B1 15%     +59.4%     113.45 =C2=B1 22%  sched_debug.cfs_rq:=
/.load.stddev
   1015843 =C2=B1  9%     -67.2%     333153 =C2=B1 21%  sched_debug.cfs_rq:=
/.min_vruntime.0
   1077729 =C2=B1  6%     -55.0%     484939 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.1
    727068 =C2=B1 12%     -82.5%     127593 =C2=B1 10%  sched_debug.cfs_rq:=
/.min_vruntime.10
    720469 =C2=B1 10%     -82.1%     129027 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.11
    751794 =C2=B1 19%     -83.8%     121552 =C2=B1 14%  sched_debug.cfs_rq:=
/.min_vruntime.12
    777931 =C2=B1 12%     -84.9%     117595 =C2=B1 11%  sched_debug.cfs_rq:=
/.min_vruntime.13
    733899 =C2=B1 15%     -84.3%     115056 =C2=B1 15%  sched_debug.cfs_rq:=
/.min_vruntime.14
    823231 =C2=B1 16%     -85.1%     122319 =C2=B1 10%  sched_debug.cfs_rq:=
/.min_vruntime.15
   1263849 =C2=B1  7%     -64.8%     444961 =C2=B1 21%  sched_debug.cfs_rq:=
/.min_vruntime.16
   1143420 =C2=B1  5%     -78.3%     248418 =C2=B1 25%  sched_debug.cfs_rq:=
/.min_vruntime.17
   1120501 =C2=B1  5%     -81.8%     203846 =C2=B1 10%  sched_debug.cfs_rq:=
/.min_vruntime.18
   1143833 =C2=B1 12%     -82.2%     203205 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.19
   1099204 =C2=B1  5%     -51.4%     534077 =C2=B1  7%  sched_debug.cfs_rq:=
/.min_vruntime.2
   1195135 =C2=B1  9%     -82.5%     208987 =C2=B1 11%  sched_debug.cfs_rq:=
/.min_vruntime.20
   1141848 =C2=B1  9%     -80.5%     222757 =C2=B1 11%  sched_debug.cfs_rq:=
/.min_vruntime.21
   1202523 =C2=B1  8%     -81.6%     220922 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.22
   1123620 =C2=B1  7%     -80.1%     223312 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.23
    684545 =C2=B1 18%     -68.0%     218874 =C2=B1 11%  sched_debug.cfs_rq:=
/.min_vruntime.24
    703337 =C2=B1 17%     -67.4%     229380 =C2=B1 11%  sched_debug.cfs_rq:=
/.min_vruntime.25
    718254 =C2=B1 12%     -66.9%     237961 =C2=B1 11%  sched_debug.cfs_rq:=
/.min_vruntime.26
    724726 =C2=B1 11%     -67.3%     236800 =C2=B1 12%  sched_debug.cfs_rq:=
/.min_vruntime.27
    687576 =C2=B1 21%     -64.7%     242538 =C2=B1 10%  sched_debug.cfs_rq:=
/.min_vruntime.28
    661535 =C2=B1 14%     -62.6%     247642 =C2=B1 12%  sched_debug.cfs_rq:=
/.min_vruntime.29
   1074486 =C2=B1 13%     -50.3%     534387 =C2=B1  7%  sched_debug.cfs_rq:=
/.min_vruntime.3
    705526 =C2=B1 16%     -64.5%     250188 =C2=B1 14%  sched_debug.cfs_rq:=
/.min_vruntime.30
    614540 =C2=B1 21%     -59.8%     247109 =C2=B1 12%  sched_debug.cfs_rq:=
/.min_vruntime.31
   1019202 =C2=B1 11%     -48.0%     530351 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.4
   1071379 =C2=B1 10%     -52.0%     514496 =C2=B1  7%  sched_debug.cfs_rq:=
/.min_vruntime.5
   1007291 =C2=B1  9%     -48.7%     517023 =C2=B1  7%  sched_debug.cfs_rq:=
/.min_vruntime.6
   1084666 =C2=B1  7%     -52.4%     516650 =C2=B1  6%  sched_debug.cfs_rq:=
/.min_vruntime.7
    759586 =C2=B1 16%     -80.6%     147607 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.8
    740242 =C2=B1 16%     -81.1%     139577 =C2=B1 12%  sched_debug.cfs_rq:=
/.min_vruntime.9
    916212 =C2=B1  0%     -69.7%     277259 =C2=B1  7%  sched_debug.cfs_rq:=
/.min_vruntime.avg
   1357730 =C2=B1  4%     -59.1%     555812 =C2=B1  6%  sched_debug.cfs_rq:=
/.min_vruntime.max
    475728 =C2=B1 13%     -77.9%     105083 =C2=B1 12%  sched_debug.cfs_rq:=
/.min_vruntime.min
    249029 =C2=B1  3%     -39.9%     149723 =C2=B1  6%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      0.47 =C2=B1  1%     -45.2%       0.26 =C2=B1 10%  sched_debug.cfs_rq:=
/.nr_running.avg
      0.36 =C2=B1  4%     +13.0%       0.41 =C2=B1  4%  sched_debug.cfs_rq:=
/.nr_running.stddev
      3.50 =C2=B1 26%     +88.6%       6.60 =C2=B1 26%  sched_debug.cfs_rq:=
/.nr_spread_over.0
      0.86 =C2=B1  7%     +48.1%       1.27 =C2=B1 11%  sched_debug.cfs_rq:=
/.nr_spread_over.avg
      1.28 =C2=B1 11%     +34.8%       1.73 =C2=B1 10%  sched_debug.cfs_rq:=
/.nr_spread_over.stddev
     42.00 =C2=B1  9%     -28.1%      30.20 =C2=B1 18%  sched_debug.cfs_rq:=
/.runnable_load_avg.2
     18.70 =C2=B1 58%     -75.9%       4.50 =C2=B1 74%  sched_debug.cfs_rq:=
/.runnable_load_avg.20
     20.80 =C2=B1 56%     -76.9%       4.80 =C2=B1131%  sched_debug.cfs_rq:=
/.runnable_load_avg.22
     17.60 =C2=B1 65%     -77.3%       4.00 =C2=B1 98%  sched_debug.cfs_rq:=
/.runnable_load_avg.9
     27.07 =C2=B1  2%     -32.6%      18.26 =C2=B1  6%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
    104584 =C2=B1115%    -223.6%    -129315 =C2=B1-57%  sched_debug.cfs_rq:=
/.spread0.18
    127912 =C2=B1114%    -201.6%    -129956 =C2=B1-57%  sched_debug.cfs_rq:=
/.spread0.19
    179212 =C2=B1 98%    -169.3%    -124175 =C2=B1-60%  sched_debug.cfs_rq:=
/.spread0.20
    186593 =C2=B1 43%    -160.2%    -112240 =C2=B1-60%  sched_debug.cfs_rq:=
/.spread0.22
   -297687 =C2=B1-47%     -68.0%     -95203 =C2=B1-91%  sched_debug.cfs_rq:=
/.spread0.26
   -291219 =C2=B1-39%     -66.9%     -96365 =C2=B1-92%  sched_debug.cfs_rq:=
/.spread0.27
   -328378 =C2=B1-50%     -72.4%     -90628 =C2=B1-91%  sched_debug.cfs_rq:=
/.spread0.28
   -354423 =C2=B1-33%     -75.9%     -85524 =C2=B1-99%  sched_debug.cfs_rq:=
/.spread0.29
   -401424 =C2=B1-39%     -78.6%     -86057 =C2=B1-97%  sched_debug.cfs_rq:=
/.spread0.31
      3334 =C2=B13621%   +5813.6%     197196 =C2=B1 47%  sched_debug.cfs_rq=
:/.spread0.4
   -540208 =C2=B1-18%     -57.8%    -228078 =C2=B1-33%  sched_debug.cfs_rq:=
/.spread0.min
    249042 =C2=B1  3%     -39.9%     149725 =C2=B1  6%  sched_debug.cfs_rq:=
/.spread0.stddev
    763.10 =C2=B1  9%     -41.9%     443.40 =C2=B1 19%  sched_debug.cfs_rq:=
/.util_avg.0
    683.40 =C2=B1 15%     -41.8%     397.50 =C2=B1 15%  sched_debug.cfs_rq:=
/.util_avg.1
    438.40 =C2=B1 15%     -56.2%     192.10 =C2=B1 32%  sched_debug.cfs_rq:=
/.util_avg.10
    417.30 =C2=B1 17%     -61.7%     159.80 =C2=B1 39%  sched_debug.cfs_rq:=
/.util_avg.11
    454.10 =C2=B1 32%     -69.1%     140.10 =C2=B1 24%  sched_debug.cfs_rq:=
/.util_avg.12
    385.60 =C2=B1 22%     -52.5%     183.10 =C2=B1 38%  sched_debug.cfs_rq:=
/.util_avg.13
    412.10 =C2=B1 31%     -62.1%     156.30 =C2=B1 37%  sched_debug.cfs_rq:=
/.util_avg.14
    417.00 =C2=B1 30%     -57.7%     176.50 =C2=B1 44%  sched_debug.cfs_rq:=
/.util_avg.15
    459.20 =C2=B1 17%     -35.9%     294.20 =C2=B1 33%  sched_debug.cfs_rq:=
/.util_avg.16
    383.40 =C2=B1 19%     -60.2%     152.70 =C2=B1 37%  sched_debug.cfs_rq:=
/.util_avg.17
    366.40 =C2=B1 17%     -58.7%     151.30 =C2=B1 36%  sched_debug.cfs_rq:=
/.util_avg.18
    417.10 =C2=B1 19%     -52.0%     200.40 =C2=B1 47%  sched_debug.cfs_rq:=
/.util_avg.19
    694.90 =C2=B1 11%     -40.5%     413.20 =C2=B1 19%  sched_debug.cfs_rq:=
/.util_avg.2
    420.20 =C2=B1 29%     -65.7%     144.20 =C2=B1 38%  sched_debug.cfs_rq:=
/.util_avg.20
    463.50 =C2=B1 19%     -58.3%     193.30 =C2=B1 45%  sched_debug.cfs_rq:=
/.util_avg.21
    472.40 =C2=B1 25%     -63.7%     171.60 =C2=B1 43%  sched_debug.cfs_rq:=
/.util_avg.22
    379.00 =C2=B1 20%     -56.7%     164.00 =C2=B1 32%  sched_debug.cfs_rq:=
/.util_avg.23
    349.30 =C2=B1 28%     -47.6%     182.90 =C2=B1 22%  sched_debug.cfs_rq:=
/.util_avg.25
    353.30 =C2=B1 13%     -47.4%     185.90 =C2=B1 33%  sched_debug.cfs_rq:=
/.util_avg.27
    380.60 =C2=B1 18%     -51.7%     183.80 =C2=B1 33%  sched_debug.cfs_rq:=
/.util_avg.29
    656.40 =C2=B1 15%     -43.9%     368.10 =C2=B1 21%  sched_debug.cfs_rq:=
/.util_avg.3
    625.30 =C2=B1 12%     -38.1%     387.20 =C2=B1 19%  sched_debug.cfs_rq:=
/.util_avg.5
    684.70 =C2=B1 15%     -38.2%     423.00 =C2=B1 18%  sched_debug.cfs_rq:=
/.util_avg.7
    415.20 =C2=B1 25%     -60.6%     163.50 =C2=B1 46%  sched_debug.cfs_rq:=
/.util_avg.8
    377.60 =C2=B1 26%     -51.7%     182.20 =C2=B1 34%  sched_debug.cfs_rq:=
/.util_avg.9
    458.71 =C2=B1  1%     -47.8%     239.29 =C2=B1  3%  sched_debug.cfs_rq:=
/.util_avg.avg
      1017 =C2=B1  4%     -25.1%     761.85 =C2=B1  1%  sched_debug.cfs_rq:=
/.util_avg.max
    149.03 =C2=B1  4%     -76.6%      34.87 =C2=B1  5%  sched_debug.cfs_rq:=
/.util_avg.min
    298.20 =C2=B1  2%     -24.8%     224.27 =C2=B1  3%  sched_debug.cfs_rq:=
/.util_avg.stddev
    564457 =C2=B1 16%     +31.1%     740127 =C2=B1  9%  sched_debug.cpu.avg=
_idle.12
     16.90 =C2=B1 26%     -67.5%       5.50 =C2=B1 76%  sched_debug.cpu.cpu=
_load[0].10
     21.10 =C2=B1 35%     -44.5%      11.70 =C2=B1 45%  sched_debug.cpu.cpu=
_load[0].21
     27.80 =C2=B1  2%     -20.3%      22.17 =C2=B1  6%  sched_debug.cpu.cpu=
_load[0].avg
     16.80 =C2=B1 26%     -66.1%       5.70 =C2=B1 55%  sched_debug.cpu.cpu=
_load[1].10
     19.00 =C2=B1 38%     -62.6%       7.10 =C2=B1 52%  sched_debug.cpu.cpu=
_load[1].12
     42.10 =C2=B1  7%     -21.4%      33.10 =C2=B1 15%  sched_debug.cpu.cpu=
_load[1].2
     19.90 =C2=B1 31%     -49.7%      10.00 =C2=B1 56%  sched_debug.cpu.cpu=
_load[1].21
     40.50 =C2=B1 12%     -29.1%      28.70 =C2=B1 26%  sched_debug.cpu.cpu=
_load[1].3
     27.59 =C2=B1  2%     -24.6%      20.81 =C2=B1  6%  sched_debug.cpu.cpu=
_load[1].avg
     17.10 =C2=B1 23%     -63.2%       6.30 =C2=B1 54%  sched_debug.cpu.cpu=
_load[2].10
     18.00 =C2=B1 38%     -66.7%       6.00 =C2=B1 53%  sched_debug.cpu.cpu=
_load[2].12
     42.30 =C2=B1  8%     -24.1%      32.10 =C2=B1 15%  sched_debug.cpu.cpu=
_load[2].2
     19.00 =C2=B1 32%     -52.1%       9.10 =C2=B1 63%  sched_debug.cpu.cpu=
_load[2].21
     27.40 =C2=B1  2%     -26.5%      20.13 =C2=B1  6%  sched_debug.cpu.cpu=
_load[2].avg
      3.30 =C2=B1 46%     -92.1%       0.26 =C2=B1 80%  sched_debug.cpu.cpu=
_load[2].min
     17.70 =C2=B1 21%     -61.0%       6.90 =C2=B1 52%  sched_debug.cpu.cpu=
_load[3].10
     17.70 =C2=B1 39%     -67.2%       5.80 =C2=B1 75%  sched_debug.cpu.cpu=
_load[3].11
     17.50 =C2=B1 39%     -72.0%       4.90 =C2=B1 52%  sched_debug.cpu.cpu=
_load[3].12
     42.60 =C2=B1 10%     -25.1%      31.90 =C2=B1 14%  sched_debug.cpu.cpu=
_load[3].2
     18.70 =C2=B1 34%     -54.0%       8.60 =C2=B1 66%  sched_debug.cpu.cpu=
_load[3].21
     27.40 =C2=B1  2%     -27.1%      19.96 =C2=B1  6%  sched_debug.cpu.cpu=
_load[3].avg
      3.83 =C2=B1 26%     -90.4%       0.37 =C2=B1 60%  sched_debug.cpu.cpu=
_load[3].min
     19.00 =C2=B1 29%     -59.5%       7.70 =C2=B1 60%  sched_debug.cpu.cpu=
_load[4].10
     17.50 =C2=B1 44%     -71.4%       5.00 =C2=B1 55%  sched_debug.cpu.cpu=
_load[4].12
     18.80 =C2=B1 34%     -52.7%       8.90 =C2=B1 62%  sched_debug.cpu.cpu=
_load[4].21
     27.61 =C2=B1  2%     -26.0%      20.45 =C2=B1  5%  sched_debug.cpu.cpu=
_load[4].avg
      4.25 =C2=B1 16%     -95.6%       0.19 =C2=B1 78%  sched_debug.cpu.cpu=
_load[4].min
      2962 =C2=B1 17%     -62.3%       1117 =C2=B1 67%  sched_debug.cpu.cur=
r->pid.10
      2687 =C2=B1 12%     -69.0%     832.20 =C2=B1 90%  sched_debug.cpu.cur=
r->pid.17
      2630 =C2=B1 12%     -79.9%     529.10 =C2=B1136%  sched_debug.cpu.cur=
r->pid.18
      2663 =C2=B1 24%     -68.6%     837.11 =C2=B1 91%  sched_debug.cpu.cur=
r->pid.19
      3754 =C2=B1  8%     -59.2%       1530 =C2=B1 35%  sched_debug.cpu.cur=
r->pid.2
      2999 =C2=B1 19%     -72.3%     832.11 =C2=B1 92%  sched_debug.cpu.cur=
r->pid.22
      2425 =C2=B1 22%     -53.7%       1123 =C2=B1 69%  sched_debug.cpu.cur=
r->pid.25
      1936 =C2=B1 23%     -56.8%     836.25 =C2=B1 70%  sched_debug.cpu.cur=
r->pid.26
      2571 =C2=B1 15%     -59.2%       1048 =C2=B1 64%  sched_debug.cpu.cur=
r->pid.27
      2804 =C2=B1  2%     -57.5%       1190 =C2=B1 16%  sched_debug.cpu.cur=
r->pid.avg
      1593 =C2=B1  8%     +17.1%       1864 =C2=B1  6%  sched_debug.cpu.cur=
r->pid.stddev
    283.88 =C2=B1 17%     +70.1%     482.78 =C2=B1 29%  sched_debug.cpu.loa=
d.max
     70.52 =C2=B1 11%     +57.0%     110.70 =C2=B1 19%  sched_debug.cpu.loa=
d.stddev
     66497 =C2=B1  8%     -15.9%      55943 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.15
     81115 =C2=B1  5%     -27.2%      59063 =C2=B1  9%  sched_debug.cpu.nr_=
load_updates.17
     79270 =C2=B1  4%     -30.6%      55042 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.18
     80150 =C2=B1 10%     -31.4%      54967 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.19
     84567 =C2=B1 10%     -34.3%      55523 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.20
     81235 =C2=B1  7%     -30.4%      56500 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.21
     83655 =C2=B1  8%     -32.2%      56689 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.22
     80940 =C2=B1  5%     -30.2%      56469 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.23
     75280 =C2=B1 14%     +21.1%      91180 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.4
     78213 =C2=B1  5%     +16.7%      91241 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.7
     14736 =C2=B1  4%     +14.4%      16857 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.stddev
      0.48 =C2=B1  1%     -45.1%       0.26 =C2=B1  9%  sched_debug.cpu.nr_=
running.avg
     53969 =C2=B1 18%   +1363.0%     789569 =C2=B1 18%  sched_debug.cpu.nr_=
switches.0
     51898 =C2=B1 13%   +1953.9%    1065934 =C2=B1 11%  sched_debug.cpu.nr_=
switches.1
     63893 =C2=B1 21%    +519.3%     395670 =C2=B1 17%  sched_debug.cpu.nr_=
switches.10
     65568 =C2=B1 24%    +501.6%     394438 =C2=B1 15%  sched_debug.cpu.nr_=
switches.11
     59235 =C2=B1 25%    +545.8%     382520 =C2=B1 16%  sched_debug.cpu.nr_=
switches.12
     62117 =C2=B1 26%    +478.9%     359576 =C2=B1 13%  sched_debug.cpu.nr_=
switches.13
     59624 =C2=B1 32%    +505.4%     360971 =C2=B1 17%  sched_debug.cpu.nr_=
switches.14
     65070 =C2=B1 28%    +472.2%     372328 =C2=B1  9%  sched_debug.cpu.nr_=
switches.15
     50703 =C2=B1 10%   +1762.0%     944075 =C2=B1 15%  sched_debug.cpu.nr_=
switches.16
     48477 =C2=B1 17%   +1299.6%     678470 =C2=B1 13%  sched_debug.cpu.nr_=
switches.17
     47536 =C2=B1 13%   +1172.3%     604794 =C2=B1 14%  sched_debug.cpu.nr_=
switches.18
     50693 =C2=B1 27%   +1099.7%     608148 =C2=B1 14%  sched_debug.cpu.nr_=
switches.19
     53700 =C2=B1 14%   +2019.9%    1138406 =C2=B1  6%  sched_debug.cpu.nr_=
switches.2
     50171 =C2=B1 14%   +1137.0%     620615 =C2=B1 14%  sched_debug.cpu.nr_=
switches.20
     49323 =C2=B1 21%   +1219.4%     650773 =C2=B1 15%  sched_debug.cpu.nr_=
switches.21
     49132 =C2=B1 20%   +1204.4%     640855 =C2=B1 12%  sched_debug.cpu.nr_=
switches.22
     46389 =C2=B1 21%   +1290.7%     645124 =C2=B1 11%  sched_debug.cpu.nr_=
switches.23
     36787 =C2=B1 16%   +1541.8%     603976 =C2=B1 13%  sched_debug.cpu.nr_=
switches.24
     36993 =C2=B1 10%   +1620.3%     636398 =C2=B1 14%  sched_debug.cpu.nr_=
switches.25
     40874 =C2=B1 17%   +1472.8%     642853 =C2=B1 12%  sched_debug.cpu.nr_=
switches.26
     40244 =C2=B1 21%   +1508.8%     647436 =C2=B1 11%  sched_debug.cpu.nr_=
switches.27
     43431 =C2=B1 20%   +1383.5%     644317 =C2=B1  9%  sched_debug.cpu.nr_=
switches.28
     39300 =C2=B1 20%   +1558.6%     651846 =C2=B1  9%  sched_debug.cpu.nr_=
switches.29
     50897 =C2=B1 20%   +2137.5%    1138846 =C2=B1  6%  sched_debug.cpu.nr_=
switches.3
     40949 =C2=B1 19%   +1511.1%     659752 =C2=B1  9%  sched_debug.cpu.nr_=
switches.30
     40066 =C2=B1 18%   +1507.7%     644130 =C2=B1 11%  sched_debug.cpu.nr_=
switches.31
     49892 =C2=B1 27%   +2205.5%    1150294 =C2=B1  8%  sched_debug.cpu.nr_=
switches.4
     47264 =C2=B1 17%   +2262.5%    1116613 =C2=B1  6%  sched_debug.cpu.nr_=
switches.5
     46148 =C2=B1 15%   +2298.2%    1106737 =C2=B1  6%  sched_debug.cpu.nr_=
switches.6
     46408 =C2=B1 15%   +2294.2%    1111117 =C2=B1  8%  sched_debug.cpu.nr_=
switches.7
     57784 =C2=B1 20%    +644.9%     430411 =C2=B1 13%  sched_debug.cpu.nr_=
switches.8
     52164 =C2=B1 16%    +685.5%     409730 =C2=B1 14%  sched_debug.cpu.nr_=
switches.9
     49897 =C2=B1  6%   +1293.3%     695210 =C2=B1  4%  sched_debug.cpu.nr_=
switches.avg
     93907 =C2=B1  8%   +1163.3%    1186370 =C2=B1  7%  sched_debug.cpu.nr_=
switches.max
     28416 =C2=B1  8%   +1058.5%     329211 =C2=B1 13%  sched_debug.cpu.nr_=
switches.min
     15053 =C2=B1 13%   +1750.1%     278509 =C2=B1 13%  sched_debug.cpu.nr_=
switches.stddev
      0.01 =C2=B1 53%   +1808.3%       0.24 =C2=B1 11%  sched_debug.cpu.nr_=
uninterruptible.avg
     53848 =C2=B1 12%   +1881.7%    1067091 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.1
     65176 =C2=B1 21%    +507.7%     396082 =C2=B1 17%  sched_debug.cpu.sch=
ed_count.10
    104094 =C2=B1 35%    +280.3%     395913 =C2=B1 15%  sched_debug.cpu.sch=
ed_count.11
     60698 =C2=B1 24%    +532.9%     384142 =C2=B1 15%  sched_debug.cpu.sch=
ed_count.12
     72750 =C2=B1 37%    +401.1%     364546 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.13
     70164 =C2=B1 59%    +417.9%     363408 =C2=B1 16%  sched_debug.cpu.sch=
ed_count.14
     65802 =C2=B1 28%    +499.5%     394462 =C2=B1 15%  sched_debug.cpu.sch=
ed_count.15
     52053 =C2=B1  9%   +1713.7%     944112 =C2=B1 15%  sched_debug.cpu.sch=
ed_count.16
     49621 =C2=B1 17%   +1268.5%     679072 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.17
     48966 =C2=B1 13%   +1135.5%     605005 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.18
     51628 =C2=B1 26%   +1079.3%     608839 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.19
     65494 =C2=B1 42%   +1664.5%    1155674 =C2=B1  5%  sched_debug.cpu.sch=
ed_count.2
     51972 =C2=B1 15%   +1094.2%     620650 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.20
     50560 =C2=B1 21%   +1188.2%     651334 =C2=B1 15%  sched_debug.cpu.sch=
ed_count.21
     51226 =C2=B1 19%   +1153.3%     642021 =C2=B1 12%  sched_debug.cpu.sch=
ed_count.22
     47890 =C2=B1 20%   +1248.0%     645555 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.23
     37534 =C2=B1 16%   +1509.2%     604009 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.24
     38165 =C2=B1 10%   +1567.6%     636426 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.25
     42049 =C2=B1 18%   +1429.9%     643296 =C2=B1 12%  sched_debug.cpu.sch=
ed_count.26
     41030 =C2=B1 21%   +1479.0%     647883 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.27
     44282 =C2=B1 21%   +1355.1%     644345 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.28
     40266 =C2=B1 20%   +1519.6%     652153 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.29
     74398 =C2=B1 61%   +1432.0%    1139745 =C2=B1  6%  sched_debug.cpu.sch=
ed_count.3
     41652 =C2=B1 19%   +1484.0%     659779 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.30
     40665 =C2=B1 19%   +1484.0%     644158 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.31
     52158 =C2=B1 26%   +2146.0%    1171462 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.4
     49608 =C2=B1 15%   +2152.1%    1117217 =C2=B1  6%  sched_debug.cpu.sch=
ed_count.5
     50812 =C2=B1 28%   +2080.8%    1108132 =C2=B1  6%  sched_debug.cpu.sch=
ed_count.6
     56545 =C2=B1 52%   +1901.2%    1131604 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.7
     59081 =C2=B1 19%    +630.7%     431688 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.8
     53416 =C2=B1 16%    +705.9%     430468 =C2=B1 17%  sched_debug.cpu.sch=
ed_count.9
    114128 =C2=B1 14%    +563.7%     757520 =C2=B1  3%  sched_debug.cpu.sch=
ed_count.avg
     29050 =C2=B1  8%   +1044.8%     332575 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.min
     25503 =C2=B1 19%   +1321.4%     362517 =C2=B1 19%  sched_debug.cpu.sch=
ed_goidle.0
     25599 =C2=B1 13%   +1866.9%     503502 =C2=B1 12%  sched_debug.cpu.sch=
ed_goidle.1
     30700 =C2=B1 22%    +512.0%     187889 =C2=B1 18%  sched_debug.cpu.sch=
ed_goidle.10
     31728 =C2=B1 26%    +489.8%     187129 =C2=B1 16%  sched_debug.cpu.sch=
ed_goidle.11
     28687 =C2=B1 26%    +532.8%     181540 =C2=B1 16%  sched_debug.cpu.sch=
ed_goidle.12
     30259 =C2=B1 27%    +462.0%     170067 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.13
     28742 =C2=B1 33%    +495.1%     171054 =C2=B1 17%  sched_debug.cpu.sch=
ed_goidle.14
     31534 =C2=B1 29%    +459.6%     176474 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.15
     25092 =C2=B1 10%   +1648.8%     438817 =C2=B1 16%  sched_debug.cpu.sch=
ed_goidle.16
     23813 =C2=B1 18%   +1249.6%     321392 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.17
     23389 =C2=B1 13%   +1126.8%     286954 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.18
     24673 =C2=B1 25%   +1069.5%     288547 =C2=B1 15%  sched_debug.cpu.sch=
ed_goidle.19
     26353 =C2=B1 14%   +1939.7%     537521 =C2=B1  6%  sched_debug.cpu.sch=
ed_goidle.2
     24755 =C2=B1 14%   +1089.0%     294356 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.20
     23976 =C2=B1 23%   +1189.5%     309166 =C2=B1 15%  sched_debug.cpu.sch=
ed_goidle.21
     23946 =C2=B1 19%   +1170.3%     304191 =C2=B1 12%  sched_debug.cpu.sch=
ed_goidle.22
     22813 =C2=B1 21%   +1242.7%     306331 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.23
     17658 =C2=B1 16%   +1524.0%     286777 =C2=B1 13%  sched_debug.cpu.sch=
ed_goidle.24
     17893 =C2=B1 10%   +1590.4%     302458 =C2=B1 15%  sched_debug.cpu.sch=
ed_goidle.25
     19711 =C2=B1 17%   +1449.1%     305358 =C2=B1 13%  sched_debug.cpu.sch=
ed_goidle.26
     19414 =C2=B1 22%   +1484.1%     307539 =C2=B1 12%  sched_debug.cpu.sch=
ed_goidle.27
     20946 =C2=B1 20%   +1360.6%     305948 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.28
     18857 =C2=B1 21%   +1540.5%     309344 =C2=B1  9%  sched_debug.cpu.sch=
ed_goidle.29
     24970 =C2=B1 20%   +2052.4%     537475 =C2=B1  7%  sched_debug.cpu.sch=
ed_goidle.3
     19528 =C2=B1 20%   +1503.8%     313189 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.30
     19139 =C2=B1 18%   +1496.2%     305494 =C2=B1 12%  sched_debug.cpu.sch=
ed_goidle.31
     24574 =C2=B1 28%   +2112.6%     543738 =C2=B1  8%  sched_debug.cpu.sch=
ed_goidle.4
     23080 =C2=B1 16%   +2183.4%     527023 =C2=B1  6%  sched_debug.cpu.sch=
ed_goidle.5
     22500 =C2=B1 15%   +2220.4%     522092 =C2=B1  7%  sched_debug.cpu.sch=
ed_goidle.6
     22780 =C2=B1 15%   +2202.0%     524413 =C2=B1  9%  sched_debug.cpu.sch=
ed_goidle.7
     27368 =C2=B1 19%    +646.0%     204165 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.8
     25319 =C2=B1 17%    +667.5%     194323 =C2=B1 15%  sched_debug.cpu.sch=
ed_goidle.9
     24229 =C2=B1  6%   +1256.4%     328650 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.avg
     46069 =C2=B1  8%   +1116.8%     560590 =C2=B1  7%  sched_debug.cpu.sch=
ed_goidle.max
     13668 =C2=B1  8%   +1038.6%     155620 =C2=B1 13%  sched_debug.cpu.sch=
ed_goidle.min
      7410 =C2=B1 12%   +1671.1%     131243 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.stddev
     34175 =C2=B1 10%   +1080.2%     403332 =C2=B1 18%  sched_debug.cpu.ttw=
u_count.0
     31355 =C2=B1  6%   +1631.5%     542918 =C2=B1  9%  sched_debug.cpu.ttw=
u_count.1
     33091 =C2=B1 30%    +499.5%     198391 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.10
     28839 =C2=B1 32%    +612.4%     205461 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.11
     27928 =C2=B1 26%    +598.7%     195146 =C2=B1  6%  sched_debug.cpu.ttw=
u_count.12
     27962 =C2=B1 19%    +579.4%     189977 =C2=B1  6%  sched_debug.cpu.ttw=
u_count.13
     26960 =C2=B1 24%    +608.7%     191053 =C2=B1 10%  sched_debug.cpu.ttw=
u_count.14
     29045 =C2=B1 10%    +570.3%     194686 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.15
     28921 =C2=B1 10%   +1470.7%     454270 =C2=B1  9%  sched_debug.cpu.ttw=
u_count.16
     25963 =C2=B1 10%   +1174.0%     330773 =C2=B1  9%  sched_debug.cpu.ttw=
u_count.17
     24133 =C2=B1  7%   +1136.8%     298484 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.18
     24665 =C2=B1 22%   +1124.8%     302105 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.19
     30836 =C2=B1 10%   +1790.0%     582798 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.2
     24361 =C2=B1 13%   +1150.1%     304526 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.20
     23175 =C2=B1 18%   +1275.8%     318835 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.21
     23465 =C2=B1  9%   +1246.5%     315960 =C2=B1  8%  sched_debug.cpu.ttw=
u_count.22
     23046 =C2=B1 13%   +1277.0%     317342 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.23
     18018 =C2=B1 12%   +1545.0%     296411 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.24
     16700 =C2=B1 12%   +1730.4%     305689 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.25
     18159 =C2=B1 14%   +1637.8%     315579 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.26
     17909 =C2=B1 11%   +1661.4%     315457 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.27
     18048 =C2=B1  8%   +1672.4%     319896 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.28
     17312 =C2=B1 15%   +1779.2%     325336 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.29
     28624 =C2=B1 11%   +1954.0%     587949 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.3
     17868 =C2=B1 13%   +1726.6%     326386 =C2=B1  6%  sched_debug.cpu.ttw=
u_count.30
     17047 =C2=B1 13%   +1785.2%     321383 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.31
     27139 =C2=B1 19%   +2015.4%     574109 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.4
     26405 =C2=B1 10%   +2023.6%     560736 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.5
     25109 =C2=B1 16%   +2150.8%     565147 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.6
     25490 =C2=B1 11%   +2102.6%     561443 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.7
     28042 =C2=B1 15%    +676.7%     217812 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.8
     31121 =C2=B1 25%    +571.0%     208828 =C2=B1  6%  sched_debug.cpu.ttw=
u_count.9
     25029 =C2=B1  6%   +1291.9%     348382 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.avg
     46536 =C2=B1  9%   +1184.1%     597568 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.max
     14168 =C2=B1 11%   +1132.5%     174623 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.min
      7203 =C2=B1  7%   +1802.9%     137081 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.stddev
      3362 =C2=B1 26%    +959.7%      35635 =C2=B1 14%  sched_debug.cpu.ttw=
u_local.0
      1711 =C2=B1 87%   +1790.2%      32359 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.1
      5315 =C2=B1 37%    +183.5%      15070 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.10
      5278 =C2=B1 38%    +196.0%      15623 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.11
      5090 =C2=B1 46%    +212.6%      15914 =C2=B1 11%  sched_debug.cpu.ttw=
u_local.12
      5048 =C2=B1 32%    +193.7%      14826 =C2=B1 12%  sched_debug.cpu.ttw=
u_local.13
      5027 =C2=B1 44%    +202.0%      15184 =C2=B1 12%  sched_debug.cpu.ttw=
u_local.14
      5845 =C2=B1 47%    +154.7%      14889 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.15
    645.00 =C2=B1108%   +5206.0%      34223 =C2=B1 13%  sched_debug.cpu.ttw=
u_local.16
    638.10 =C2=B1 70%   +2816.9%      18612 =C2=B1 14%  sched_debug.cpu.ttw=
u_local.17
    743.70 =C2=B1 88%   +2070.4%      16141 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.18
      1083 =C2=B1104%   +1400.4%      16255 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.19
      2116 =C2=B1 30%   +1522.2%      34328 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.2
    715.80 =C2=B1143%   +2283.5%      17061 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.20
      1187 =C2=B1120%   +1349.5%      17205 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.21
    656.00 =C2=B1 74%   +2493.2%      17011 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.22
      1223 =C2=B1175%   +1283.2%      16929 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.23
      1724 =C2=B1 57%    +831.7%      16068 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.24
      1314 =C2=B1 54%   +1167.0%      16652 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.25
      2053 =C2=B1 78%    +738.7%      17226 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.26
      1739 =C2=B1 22%    +894.1%      17294 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.27
      3092 =C2=B1 52%    +467.6%      17550 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.28
      1929 =C2=B1 44%    +799.2%      17350 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.29
      1961 =C2=B1 91%   +1706.5%      35436 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.3
      2079 =C2=B1 56%    +738.1%      17427 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.30
      2264 =C2=B1 38%    +677.6%      17611 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.31
      2335 =C2=B1120%   +1361.5%      34129 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.4
    980.40 =C2=B1 90%   +3377.2%      34090 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.5
      1816 =C2=B1 70%   +1773.5%      34029 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.6
    970.00 =C2=B1 51%   +3399.7%      33947 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.7
      5638 =C2=B1 33%    +202.4%      17049 =C2=B1 12%  sched_debug.cpu.ttw=
u_local.8
      4440 =C2=B1 42%    +265.4%      16221 =C2=B1 10%  sched_debug.cpu.ttw=
u_local.9
      2501 =C2=B1  1%    +761.3%      21542 =C2=B1  2%  sched_debug.cpu.ttw=
u_local.avg
     10614 =C2=B1 18%    +277.8%      40103 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.max
    189.57 =C2=B1  8%   +6328.9%      12187 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.min
      2568 =C2=B1  9%    +242.0%       8785 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.stddev

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/nr_task/rootfs/tbox_group/test/testcase:
  gcc-4.9/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/nhm-white2/pipe/unixbe=
nch

commit: =

  cf5ebed4d0a77c055f5ef1a7978898ac0dcb2ae7
  23a197a19f9ad0438a6445b0b3a0f5c6d3381da5

cf5ebed4d0a77c05 23a197a19f9ad0438a6445b0b3 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    183.75 =C2=B1 48%   +1626.3%       3172 =C2=B1  2%  unixbench.time.invo=
luntary_context_switches
    183.75 =C2=B1 48%   +1626.3%       3172 =C2=B1  2%  time.involuntary_co=
ntext_switches
    857.75 =C2=B1  5%     +23.9%       1063 =C2=B1  7%  vmstat.system.cs
     43.50 =C2=B1 53%    +661.5%     331.25 =C2=B1126%  cpuidle.POLL.time
      5.50 =C2=B1 41%    +213.6%      17.25 =C2=B1 27%  cpuidle.POLL.usage
      1548 =C2=B1 10%     +14.6%       1774 =C2=B1  2%  slabinfo.proc_inode=
_cache.active_objs
      1638 =C2=B1  6%     +12.7%       1845 =C2=B1  4%  slabinfo.proc_inode=
_cache.num_objs
    737.80 =C2=B1123%     -75.1%     183.45 =C2=B1  7%  sched_debug.cfs_rq:=
/.exec_clock.4
     61.75 =C2=B1 64%    +104.9%     126.50 =C2=B1 42%  sched_debug.cfs_rq:=
/.util_avg.5
      3244 =C2=B1 43%     -61.2%       1260 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.4
     15982 =C2=B1 23%     +37.3%      21948 =C2=B1 20%  sched_debug.cpu.nr_=
switches.1
     10526 =C2=B1  2%     +21.6%      12802 =C2=B1  5%  sched_debug.cpu.nr_=
switches.avg
     20357 =C2=B1  7%     +44.2%      29361 =C2=B1 11%  sched_debug.cpu.nr_=
switches.max
      5564 =C2=B1 13%     +53.6%       8550 =C2=B1  8%  sched_debug.cpu.nr_=
switches.stddev
    186.50 =C2=B1 15%     +40.6%     262.25 =C2=B1 14%  sched_debug.cpu.nr_=
uninterruptible.7
    242.83 =C2=B1  9%     +16.4%     282.67 =C2=B1  9%  sched_debug.cpu.nr_=
uninterruptible.max
    182.82 =C2=B1  5%     +13.9%     208.25 =C2=B1  6%  sched_debug.cpu.nr_=
uninterruptible.stddev
     16003 =C2=B1 23%     +37.3%      21967 =C2=B1 20%  sched_debug.cpu.sch=
ed_count.1
     14352 =C2=B1  1%     +16.1%      16664 =C2=B1  4%  sched_debug.cpu.sch=
ed_count.avg
     43986 =C2=B1 10%     +14.9%      50546 =C2=B1  8%  sched_debug.cpu.sch=
ed_count.max
     12573 =C2=B1 11%     +21.4%      15266 =C2=B1  5%  sched_debug.cpu.sch=
ed_count.stddev
      4846 =C2=B1  3%     +15.2%       5582 =C2=B1  6%  sched_debug.cpu.sch=
ed_goidle.avg
      9982 =C2=B1  7%     +36.2%      13598 =C2=B1 15%  sched_debug.cpu.sch=
ed_goidle.max
      2739 =C2=B1 11%     +46.2%       4005 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.stddev
      6148 =C2=B1 29%    +149.4%      15335 =C2=B1 16%  sched_debug.cpu.ttw=
u_count.0
      5255 =C2=B1  2%     +23.4%       6484 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.avg
     11972 =C2=B1  7%     +45.6%      17429 =C2=B1  6%  sched_debug.cpu.ttw=
u_count.max
      3477 =C2=B1  6%     +60.2%       5570 =C2=B1  8%  sched_debug.cpu.ttw=
u_count.stddev
      2599 =C2=B1 40%    +152.4%       6562 =C2=B1 29%  sched_debug.cpu.ttw=
u_local.0
      1500 =C2=B1 42%    +141.8%       3628 =C2=B1 43%  sched_debug.cpu.ttw=
u_local.2
      1919 =C2=B1  2%     +21.6%       2333 =C2=B1  2%  sched_debug.cpu.ttw=
u_local.avg
      1344 =C2=B1 13%     +51.5%       2037 =C2=B1 20%  sched_debug.cpu.ttw=
u_local.stddev
      3.49 =C2=B1  2%     -57.2%       1.49 =C2=B1 88%  sched_debug.rt_rq:/=
.rt_time.1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/filesize/fs/iterations/kconfig/nr_directorie=
s/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_size=
/testcase:
  gcc-4.9/performance/1HDD/9B/f2fs/1x/x86_64-rhel/16d/256fpd/32t/debian-x86=
_64-2015-02-07.cgz/fsyncBeforeClose/lkp-ne04/400M/fsmark

commit: =

  cf5ebed4d0a77c055f5ef1a7978898ac0dcb2ae7
  23a197a19f9ad0438a6445b0b3a0f5c6d3381da5

cf5ebed4d0a77c05 23a197a19f9ad0438a6445b0b3 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     14904 =C2=B1  2%    +114.0%      31893 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
      7961 =C2=B1102%     -78.9%       1678 =C2=B1 13%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_do_=
access.nfs_permission.__inode_permission.inode_permission.link_path_walk
     81756 =C2=B1  5%     -16.3%      68444 =C2=B1  7%  meminfo.DirectMap4k
      2230 =C2=B1 10%     +15.0%       2564 =C2=B1  8%  numa-meminfo.node1.=
KernelStack
     74683 =C2=B1 18%     +30.9%      97783 =C2=B1  1%  numa-vmstat.node0.n=
r_dirtied
     30133 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  softirqs.RCU
     14904 =C2=B1  2%    +114.0%      31893 =C2=B1  0%  time.involuntary_co=
ntext_switches
     24074 =C2=B1  1%      +4.1%      25065 =C2=B1  0%  vmstat.system.cs
      1725 =C2=B1  0%      +3.7%       1790 =C2=B1  0%  vmstat.system.in
    126922 =C2=B1  2%     +16.9%     148314 =C2=B1  5%  cpuidle.C1-NHM.usage
      8413 =C2=B1115%     -71.6%       2388 =C2=B1  8%  cpuidle.POLL.time
    127.25 =C2=B1  8%     +25.1%     159.25 =C2=B1  8%  cpuidle.POLL.usage
    901.36 =C2=B1  8%    +164.0%       2379 =C2=B1 32%  sched_debug.cfs_rq:=
/.exec_clock.13
      3078 =C2=B1 27%     +53.7%       4730 =C2=B1  5%  sched_debug.cfs_rq:=
/.exec_clock.2
      3700 =C2=B1 38%     -43.2%       2102 =C2=B1 24%  sched_debug.cfs_rq:=
/.exec_clock.7
      3429 =C2=B1 11%     -17.0%       2847 =C2=B1  9%  sched_debug.cfs_rq:=
/.min_vruntime.11
      3111 =C2=B1  4%     +41.3%       4397 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.13
      2.25 =C2=B1 57%     -55.6%       1.00 =C2=B1-100%  sched_debug.cfs_rq=
:/.nr_spread_over.11
      2.20 =C2=B1  6%     -19.7%       1.77 =C2=B1 18%  sched_debug.cfs_rq:=
/.nr_spread_over.stddev
    713889 =C2=B1 16%     +25.1%     893033 =C2=B1  6%  sched_debug.cpu.avg=
_idle.1
     17.32 =C2=B1 54%     -89.0%       1.90 =C2=B1 32%  sched_debug.cpu.cpu=
_load[0].avg
    223.38 =C2=B1 63%     -90.9%      20.38 =C2=B1 17%  sched_debug.cpu.cpu=
_load[0].max
     54.47 =C2=B1 62%     -89.9%       5.51 =C2=B1 21%  sched_debug.cpu.cpu=
_load[0].stddev
     16.25 =C2=B1127%     -96.9%       0.50 =C2=B1173%  sched_debug.cpu.cpu=
_load[1].7
     11.41 =C2=B1 51%     -86.9%       1.50 =C2=B1 12%  sched_debug.cpu.cpu=
_load[1].avg
    147.12 =C2=B1 58%     -91.5%      12.50 =C2=B1 11%  sched_debug.cpu.cpu=
_load[1].max
     35.72 =C2=B1 57%     -90.1%       3.53 =C2=B1 12%  sched_debug.cpu.cpu=
_load[1].stddev
     11.75 =C2=B1119%     -95.7%       0.50 =C2=B1173%  sched_debug.cpu.cpu=
_load[2].7
      8.46 =C2=B1 67%     -82.0%       1.52 =C2=B1 28%  sched_debug.cpu.cpu=
_load[2].avg
    108.25 =C2=B1 76%     -91.3%       9.38 =C2=B1 26%  sched_debug.cpu.cpu=
_load[2].max
     26.24 =C2=B1 75%     -89.5%       2.76 =C2=B1 25%  sched_debug.cpu.cpu=
_load[2].stddev
      7.05 =C2=B1 87%     -69.3%       2.16 =C2=B1 28%  sched_debug.cpu.cpu=
_load[3].avg
     90.12 =C2=B1101%     -80.7%      17.38 =C2=B1 41%  sched_debug.cpu.cpu=
_load[3].max
     21.89 =C2=B1 99%     -78.5%       4.70 =C2=B1 35%  sched_debug.cpu.cpu=
_load[3].stddev
      2308 =C2=B1  4%     +22.0%       2815 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.stddev
     54527 =C2=B1  7%     +11.4%      60734 =C2=B1  2%  sched_debug.cpu.nr_=
switches.1
     65526 =C2=B1  3%     +11.7%      73216 =C2=B1  3%  sched_debug.cpu.nr_=
switches.2
     53129 =C2=B1  2%      +8.8%      57792 =C2=B1  4%  sched_debug.cpu.nr_=
switches.5
     60534 =C2=B1  4%     +11.6%      67576 =C2=B1  7%  sched_debug.cpu.nr_=
switches.6
     13026 =C2=B1  3%     +17.9%      15354 =C2=B1  5%  sched_debug.cpu.nr_=
switches.stddev
   -567.50 =C2=B1-24%     -50.9%    -278.50 =C2=B1-27%  sched_debug.cpu.nr_=
uninterruptible.6
      1699 =C2=B1 10%     +18.5%       2015 =C2=B1  4%  sched_debug.cpu.nr_=
uninterruptible.9
     66805 =C2=B1  4%     +12.3%      75045 =C2=B1  3%  sched_debug.cpu.sch=
ed_count.2
     53264 =C2=B1  3%     +39.8%      74440 =C2=B1 32%  sched_debug.cpu.sch=
ed_count.3
      6412 =C2=B1  2%     +14.7%       7357 =C2=B1  5%  sched_debug.cpu.sch=
ed_goidle.stddev
     29388 =C2=B1  3%      +9.6%      32217 =C2=B1  6%  sched_debug.cpu.ttw=
u_count.3
     30444 =C2=B1  4%     +11.2%      33859 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.6
     30152 =C2=B1  6%     +10.0%      33153 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.7
      3585 =C2=B1  3%     +18.5%       4248 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.13
      4604 =C2=B1  3%     +11.7%       5141 =C2=B1  2%  sched_debug.cpu.ttw=
u_local.14
      3515 =C2=B1  0%     +17.2%       4118 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.15
      8921 =C2=B1 11%     +32.9%      11861 =C2=B1 10%  sched_debug.cpu.ttw=
u_local.2
      6115 =C2=B1  2%     +30.9%       8004 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.3
      6393 =C2=B1  3%     +21.6%       7774 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.5
      6718 =C2=B1  4%     +35.6%       9112 =C2=B1 11%  sched_debug.cpu.ttw=
u_local.6
      6169 =C2=B1  3%     +21.7%       7508 =C2=B1  2%  sched_debug.cpu.ttw=
u_local.7
      6898 =C2=B1  1%     +15.4%       7958 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.avg
      3463 =C2=B1  0%     +15.2%       3990 =C2=B1  1%  sched_debug.cpu.ttw=
u_local.min

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
cluster/compiler/cpufreq_governor/kconfig/nr_threads/protocol/rootfs/runtim=
e/tbox_group/testcase:
  cs-localhost/gcc-4.9/performance/x86_64-rhel/100%/tcp6/debian-x86_64-2015=
-02-07.cgz/300s/xps/nepim

commit: =

  cf5ebed4d0a77c055f5ef1a7978898ac0dcb2ae7
  23a197a19f9ad0438a6445b0b3a0f5c6d3381da5

cf5ebed4d0a77c05 23a197a19f9ad0438a6445b0b3 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   1672201 =C2=B1  3%      +5.8%    1769101 =C2=B1  2%  nepim.tcp.avg.kbps_=
in
   1672346 =C2=B1  3%      +5.8%    1769300 =C2=B1  2%  nepim.tcp.avg.kbps_=
out
      6390 =C2=B1  3%      +5.8%       6760 =C2=B1  2%  nepim.tcp.avg.rcv_s
      6379 =C2=B1  3%      +5.8%       6749 =C2=B1  2%  nepim.tcp.avg.snd_s
    452.00 =C2=B1 17%   +3685.7%      17111 =C2=B1 12%  nepim.time.involunt=
ary_context_switches
     18716 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  softirqs.RCU
    452.00 =C2=B1 17%   +3685.7%      17111 =C2=B1 12%  time.involuntary_co=
ntext_switches
      2007 =C2=B1  0%      -7.8%       1851 =C2=B1  0%  vmstat.system.in
  14031282 =C2=B1151%     -99.3%      96275 =C2=B1100%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
  14031282 =C2=B1151%     -99.3%      96275 =C2=B1100%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
  14031282 =C2=B1151%     -99.3%      96275 =C2=B1100%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     23.27 =C2=B1  0%      -1.2%      22.99 =C2=B1  0%  turbostat.%Busy
    813.00 =C2=B1  0%      -1.8%     798.75 =C2=B1  0%  turbostat.Avg_MHz
     13.63 =C2=B1 19%     +34.4%      18.31 =C2=B1 11%  turbostat.CPU%c1
  54359636 =C2=B1  3%     +13.7%   61823234 =C2=B1  8%  cpuidle.C1-NHM.time
      7880 =C2=B1  6%     +12.1%       8831 =C2=B1  5%  cpuidle.C3-NHM.usage
    281673 =C2=B1  1%     -25.0%     211304 =C2=B1  1%  cpuidle.C6-NHM.usage
     87.50 =C2=B1 12%     +49.7%     131.00 =C2=B1  6%  cpuidle.POLL.usage
     15439 =C2=B1 47%    +180.1%      43253 =C2=B1 21%  sched_debug.cfs_rq:=
/.exec_clock.0
      1849 =C2=B1119%   +1480.6%      29240 =C2=B1 69%  sched_debug.cfs_rq:=
/.exec_clock.4
    111105 =C2=B1 22%     -25.5%      82797 =C2=B1 22%  sched_debug.cfs_rq:=
/.exec_clock.max
    462.00 =C2=B1 14%    +433.4%       2464 =C2=B1 70%  sched_debug.cfs_rq:=
/.exec_clock.min
     19.25 =C2=B1 57%    +320.8%      81.00 =C2=B1108%  sched_debug.cfs_rq:=
/.load_avg.0
    175.25 =C2=B1 50%     -63.6%      63.75 =C2=B1114%  sched_debug.cfs_rq:=
/.load_avg.6
     30071 =C2=B1 45%    +180.8%      84429 =C2=B1 20%  sched_debug.cfs_rq:=
/.min_vruntime.0
      4002 =C2=B1116%   +1304.6%      56217 =C2=B1 68%  sched_debug.cfs_rq:=
/.min_vruntime.4
    209038 =C2=B1 22%     -24.9%     157091 =C2=B1 20%  sched_debug.cfs_rq:=
/.min_vruntime.max
      1021 =C2=B1 18%    +408.9%       5199 =C2=B1 67%  sched_debug.cfs_rq:=
/.min_vruntime.min
     77690 =C2=B1 46%    -137.7%     -29294 =C2=B1-145%  sched_debug.cfs_rq=
:/.spread0.2
     58169 =C2=B1206%    -175.1%     -43693 =C2=B1-65%  sched_debug.cfs_rq:=
/.spread0.5
     71081 =C2=B1123%    -173.1%     -51977 =C2=B1-100%  sched_debug.cfs_rq=
:/.spread0.6
     36956 =C2=B1 37%    -148.9%     -18055 =C2=B1-97%  sched_debug.cfs_rq:=
/.spread0.avg
    178965 =C2=B1 30%     -59.4%      72660 =C2=B1 54%  sched_debug.cfs_rq:=
/.spread0.max
    -29051 =C2=B1-46%    +172.7%     -79231 =C2=B1-18%  sched_debug.cfs_rq:=
/.spread0.min
      4.33 =C2=B1 10%     +26.6%       5.48 =C2=B1 17%  sched_debug.cfs_rq:=
/.tg_load_avg.stddev
     19.25 =C2=B1 57%    +323.4%      81.50 =C2=B1108%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.0
    175.75 =C2=B1 50%     -63.4%      64.25 =C2=B1114%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.6
    770828 =C2=B1  4%     -15.8%     648878 =C2=B1 15%  sched_debug.cpu.avg=
_idle.0
      1.75 =C2=B1 47%   +2800.0%      50.75 =C2=B1156%  sched_debug.cpu.cpu=
_load[4].0
      0.00 =C2=B1 65%     +87.1%       0.00 =C2=B1 22%  sched_debug.cpu.nex=
t_balance.stddev
     25558 =C2=B1 34%    +117.9%      55692 =C2=B1 16%  sched_debug.cpu.nr_=
load_updates.0
    377946 =C2=B1 50%    +102.0%     763397 =C2=B1 43%  sched_debug.cpu.nr_=
switches.0
     61490 =C2=B1105%    +237.6%     207619 =C2=B1 46%  sched_debug.cpu.nr_=
switches.4
    391997 =C2=B1  1%     +11.7%     437765 =C2=B1  8%  sched_debug.cpu.nr_=
switches.avg
     20000 =C2=B1 19%    +243.0%      68599 =C2=B1 19%  sched_debug.cpu.nr_=
switches.min
    387722 =C2=B1 17%     -21.6%     303869 =C2=B1 16%  sched_debug.cpu.nr_=
switches.stddev
   -580.83 =C2=B1-12%     -16.3%    -486.00 =C2=B1-10%  sched_debug.cpu.nr_=
uninterruptible.min
    412674 =C2=B1 46%     +93.7%     799391 =C2=B1 41%  sched_debug.cpu.sch=
ed_count.0
     61632 =C2=B1105%    +237.9%     208256 =C2=B1 46%  sched_debug.cpu.sch=
ed_count.4
    397558 =C2=B1  1%     +11.5%     443399 =C2=B1  7%  sched_debug.cpu.sch=
ed_count.avg
     20065 =C2=B1 19%    +243.2%      68858 =C2=B1 19%  sched_debug.cpu.sch=
ed_count.min
    391276 =C2=B1 17%     -20.8%     310079 =C2=B1 16%  sched_debug.cpu.sch=
ed_count.stddev
    187405 =C2=B1 50%    +101.1%     376796 =C2=B1 44%  sched_debug.cpu.sch=
ed_goidle.0
     30394 =C2=B1106%    +235.5%     101970 =C2=B1 46%  sched_debug.cpu.sch=
ed_goidle.4
      9427 =C2=B1 23%    +251.6%      33145 =C2=B1 19%  sched_debug.cpu.sch=
ed_goidle.min
    193843 =C2=B1 17%     -22.2%     150762 =C2=B1 16%  sched_debug.cpu.sch=
ed_goidle.stddev
     21967 =C2=B1 21%    +785.8%     194594 =C2=B1 72%  sched_debug.cpu.ttw=
u_count.0
    197275 =C2=B1  1%     +11.8%     220633 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.avg
      5460 =C2=B1 11%     +39.6%       7621 =C2=B1 13%  sched_debug.cpu.ttw=
u_local.0
      2425 =C2=B1 54%    +155.6%       6198 =C2=B1 11%  sched_debug.cpu.ttw=
u_local.1
      2239 =C2=B1 47%    +188.0%       6450 =C2=B1 33%  sched_debug.cpu.ttw=
u_local.2
      5663 =C2=B1 15%     +35.4%       7670 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.3
      3512 =C2=B1  4%     +40.3%       4927 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.avg
      6158 =C2=B1 12%     +43.9%       8860 =C2=B1 11%  sched_debug.cpu.ttw=
u_local.max

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
blocksize/compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/te=
stcase:
  128K/gcc-4.9/performance/x86_64-rhel/100%/debian-x86_64-2015-02-07.cgz/lk=
p-nex04/pigz

commit: =

  cf5ebed4d0a77c055f5ef1a7978898ac0dcb2ae7
  23a197a19f9ad0438a6445b0b3a0f5c6d3381da5

cf5ebed4d0a77c05 23a197a19f9ad0438a6445b0b3 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

 4.325e+08 =C2=B1  0%      -3.8%  4.162e+08 =C2=B1  0%  pigz.throughput
    738242 =C2=B1  1%    +335.3%    3213301 =C2=B1  4%  pigz.time.involunta=
ry_context_switches
    637113 =C2=B1  3%     +16.5%     742096 =C2=B1  3%  pigz.time.minor_pag=
e_faults
      5842 =C2=B1  0%      -4.6%       5571 =C2=B1  0%  pigz.time.percent_o=
f_cpu_this_job_got
    231.73 =C2=B1  1%     +29.0%     299.00 =C2=B1  0%  pigz.time.system_ti=
me
     17309 =C2=B1  0%      -5.1%      16430 =C2=B1  0%  pigz.time.user_time
   4441162 =C2=B1  1%     +25.9%    5593153 =C2=B1  0%  pigz.time.voluntary=
_context_switches
      3830 =C2=B1  1%   +1404.2%      57625 =C2=B1159%  uptime.idle
   2639323 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  softirqs.RCU
    386599 =C2=B1  0%     +27.4%     492410 =C2=B1  6%  softirqs.SCHED
     29742 =C2=B1  1%     +90.7%      56717 =C2=B1  1%  vmstat.system.cs
     77663 =C2=B1  0%      -1.9%      76217 =C2=B1  0%  vmstat.system.in
    567015 =C2=B1  3%     +18.7%     673123 =C2=B1  3%  proc-vmstat.numa_hi=
nt_faults
    240926 =C2=B1  3%     +22.7%     295730 =C2=B1  3%  proc-vmstat.numa_hi=
nt_faults_local
    799946 =C2=B1  6%     +18.6%     948617 =C2=B1  3%  proc-vmstat.numa_pt=
e_updates
      6441 =C2=B1 54%     -95.5%     291.50 =C2=B1 44%  numa-meminfo.node0.=
Inactive(anon)
      7728 =C2=B1 31%     -55.4%       3448 =C2=B1  1%  numa-meminfo.node0.=
Mapped
     21259 =C2=B1  2%     +17.1%      24893 =C2=B1 10%  numa-meminfo.node0.=
SUnreclaim
      2410 =C2=B1  4%     +19.8%       2887 =C2=B1  4%  numa-meminfo.node2.=
KernelStack
    992.50 =C2=B1 11%     +17.8%       1168 =C2=B1 11%  slabinfo.blkdev_req=
uests.active_objs
    992.50 =C2=B1 11%     +17.8%       1168 =C2=B1 11%  slabinfo.blkdev_req=
uests.num_objs
    398.00 =C2=B1  8%     +45.9%     580.50 =C2=B1 23%  slabinfo.file_lock_=
cache.active_objs
    398.00 =C2=B1  8%     +45.9%     580.50 =C2=B1 23%  slabinfo.file_lock_=
cache.num_objs
    738242 =C2=B1  1%    +335.3%    3213301 =C2=B1  4%  time.involuntary_co=
ntext_switches
    637113 =C2=B1  3%     +16.5%     742096 =C2=B1  3%  time.minor_page_fau=
lts
    231.73 =C2=B1  1%     +29.0%     299.00 =C2=B1  0%  time.system_time
   4441162 =C2=B1  1%     +25.9%    5593153 =C2=B1  0%  time.voluntary_cont=
ext_switches
     91.29 =C2=B1  0%      -4.3%      87.39 =C2=B1  0%  turbostat.%Busy
      2069 =C2=B1  0%      -4.4%       1977 =C2=B1  0%  turbostat.Avg_MHz
      5.96 =C2=B1  2%     +39.6%       8.32 =C2=B1  1%  turbostat.CPU%c1
      2.75 =C2=B1  4%     +55.6%       4.28 =C2=B1  2%  turbostat.CPU%c3
    175402 =C2=B1  4%     +30.7%     229210 =C2=B1  8%  cpuidle.C1-NHM.usage
  96952824 =C2=B1  3%     +18.4%  1.148e+08 =C2=B1  1%  cpuidle.C1E-NHM.time
    414812 =C2=B1  1%     +26.4%     524282 =C2=B1  0%  cpuidle.C1E-NHM.usa=
ge
 1.569e+09 =C2=B1  3%     +47.3%  2.312e+09 =C2=B1  1%  cpuidle.C3-NHM.time
   2761509 =C2=B1  2%     +54.5%    4266082 =C2=B1  0%  cpuidle.C3-NHM.usage
     35571 =C2=B1101%     -97.2%     988.75 =C2=B1155%  latency_stats.avg.w=
ait_on_page_bit.wait_on_page_read.do_read_cache_page.read_cache_page_gfp.bt=
rfs_scan_one_device.[btrfs].btrfs_control_ioctl.[btrfs].do_vfs_ioctl.SyS_io=
ctl.entry_SYSCALL_64_fastpath
     33721 =C2=B1 90%     -69.1%      10432 =C2=B1  5%  latency_stats.max.p=
ipe_wait.pipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpa=
th
     71008 =C2=B1101%     -97.4%       1874 =C2=B1161%  latency_stats.max.w=
ait_on_page_bit.wait_on_page_read.do_read_cache_page.read_cache_page_gfp.bt=
rfs_scan_one_device.[btrfs].btrfs_control_ioctl.[btrfs].do_vfs_ioctl.SyS_io=
ctl.entry_SYSCALL_64_fastpath
     18330 =C2=B1 59%   +1164.7%     231836 =C2=B1 11%  latency_stats.sum.p=
ipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
     71143 =C2=B1101%     -97.2%       1978 =C2=B1155%  latency_stats.sum.w=
ait_on_page_bit.wait_on_page_read.do_read_cache_page.read_cache_page_gfp.bt=
rfs_scan_one_device.[btrfs].btrfs_control_ioctl.[btrfs].do_vfs_ioctl.SyS_io=
ctl.entry_SYSCALL_64_fastpath
      5201 =C2=B1  1%     -28.8%       3701 =C2=B1 50%  numa-numastat.node0=
.other_node
   9228184 =C2=B1 15%     -71.2%    2656590 =C2=B1  6%  numa-numastat.node2=
.local_node
   9230814 =C2=B1 15%     -71.2%    2661044 =C2=B1  6%  numa-numastat.node2=
.numa_hit
  11493226 =C2=B1 12%     -77.1%    2627581 =C2=B1 24%  numa-numastat.node3=
.local_node
  11496427 =C2=B1 12%     -77.1%    2631008 =C2=B1 24%  numa-numastat.node3=
.numa_hit
      1610 =C2=B1 54%     -95.1%      79.25 =C2=B1 36%  numa-vmstat.node0.n=
r_inactive_anon
      1935 =C2=B1 31%     -55.2%     867.00 =C2=B1  0%  numa-vmstat.node0.n=
r_mapped
      5314 =C2=B1  2%     +17.1%       6223 =C2=B1 10%  numa-vmstat.node0.n=
r_slab_unreclaimable
   4935095 =C2=B1 16%     -71.3%    1416856 =C2=B1 16%  numa-vmstat.node2.n=
uma_hit
   4874037 =C2=B1 16%     -72.2%    1353431 =C2=B1 17%  numa-vmstat.node2.n=
uma_local
   5542208 =C2=B1 12%     -71.7%    1568032 =C2=B1 22%  numa-vmstat.node3.n=
uma_hit
   5479739 =C2=B1 12%     -72.5%    1505599 =C2=B1 23%  numa-vmstat.node3.n=
uma_local
      1.70 =C2=B1  4%     +99.9%       3.40 =C2=B1  4%  perf-profile.cycles=
-pp.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.activate_t=
ask.ttwu_do_activate
      2.27 =C2=B1 10%     -84.1%       0.36 =C2=B1  7%  perf-profile.cycles=
-pp.__do_softirq.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt
      0.79 =C2=B1  7%     +27.4%       1.01 =C2=B1  3%  perf-profile.cycles=
-pp.__kernel_text_address.print_context_stack.dump_trace.save_stack_trace_t=
sk.__account_scheduler_latency
      1.97 =C2=B1  2%     +75.6%       3.46 =C2=B1  5%  perf-profile.cycles=
-pp.__mutex_lock_slowpath.mutex_lock.pipe_read.__vfs_read.vfs_read
      0.70 =C2=B1 10%    +116.8%       1.51 =C2=B1  7%  perf-profile.cycles=
-pp.__mutex_lock_slowpath.mutex_lock.pipe_wait.pipe_write.__vfs_write
      0.04 =C2=B1 58%   +3971.4%       1.43 =C2=B1  8%  perf-profile.cycles=
-pp._raw_spin_lock_irqsave.__account_scheduler_latency.enqueue_entity.enque=
ue_task_fair.activate_task
      1.08 =C2=B1  1%     +21.4%       1.32 =C2=B1  4%  perf-profile.cycles=
-pp.activate_task.ttwu_do_activate.sched_ttwu_pending.cpu_startup_entry.sta=
rt_secondary
      0.00 =C2=B1 -1%      +Inf%       2.06 =C2=B1  5%  perf-profile.cycles=
-pp.activate_task.ttwu_do_activate.try_to_wake_up.wake_up_process.invoke_rc=
u_core
     15.12 =C2=B1  8%     -24.2%      11.45 =C2=B1  0%  perf-profile.cycles=
-pp.apic_timer_interrupt
      3.63 =C2=B1  4%     -16.5%       3.03 =C2=B1  4%  perf-profile.cycles=
-pp.copy_page_from_iter.pipe_write.__vfs_write.vfs_write.sys_write
      7.00 =C2=B1  6%     -24.6%       5.27 =C2=B1  3%  perf-profile.cycles=
-pp.copy_page_to_iter.pipe_read.__vfs_read.vfs_read.sys_read
      3.23 =C2=B1  5%     -13.5%       2.80 =C2=B1  5%  perf-profile.cycles=
-pp.copy_user_generic_string.copy_page_from_iter.pipe_write.__vfs_write.vfs=
_write
      6.66 =C2=B1  6%     -25.9%       4.93 =C2=B1  3%  perf-profile.cycles=
-pp.copy_user_generic_string.copy_page_to_iter.pipe_read.__vfs_read.vfs_read
      1.51 =C2=B1  3%     +18.8%       1.80 =C2=B1  2%  perf-profile.cycles=
-pp.dump_trace.save_stack_trace_tsk.__account_scheduler_latency.enqueue_ent=
ity.enqueue_task_fair
      1.12 =C2=B1  4%     +18.3%       1.32 =C2=B1  5%  perf-profile.cycles=
-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.sched_t=
twu_pending
      1.01 =C2=B1 14%    +164.8%       2.67 =C2=B1  4%  perf-profile.cycles=
-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_=
wake_up
      1.07 =C2=B1  2%     +17.9%       1.27 =C2=B1  5%  perf-profile.cycles=
-pp.enqueue_task_fair.activate_task.ttwu_do_activate.sched_ttwu_pending.cpu=
_startup_entry
      0.02 =C2=B1 61%  +10125.0%       2.04 =C2=B1  5%  perf-profile.cycles=
-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.wake_up=
_process
     11.51 =C2=B1  8%     -12.1%      10.12 =C2=B1  0%  perf-profile.cycles=
-pp.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_timer_interrupt.a=
pic_timer_interrupt
      0.00 =C2=B1 -1%      +Inf%       2.23 =C2=B1  5%  perf-profile.cycles=
-pp.invoke_rcu_core.rcu_check_callbacks.update_process_times.tick_sched_han=
dle.tick_sched_timer
      2.42 =C2=B1  9%     -80.0%       0.48 =C2=B1 10%  perf-profile.cycles=
-pp.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt
      0.28 =C2=B1 32%    +252.3%       0.98 =C2=B1  6%  perf-profile.cycles=
-pp.kthread.ret_from_fork
     11.63 =C2=B1  8%     -12.1%      10.22 =C2=B1  1%  perf-profile.cycles=
-pp.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interrupt
      1.99 =C2=B1  2%     +75.2%       3.48 =C2=B1  5%  perf-profile.cycles=
-pp.mutex_lock.pipe_read.__vfs_read.vfs_read.sys_read
      0.71 =C2=B1  9%    +115.2%       1.52 =C2=B1  7%  perf-profile.cycles=
-pp.mutex_lock.pipe_wait.pipe_write.__vfs_write.vfs_write
      1.96 =C2=B1  2%     +75.6%       3.45 =C2=B1  5%  perf-profile.cycles=
-pp.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.pipe_read.__vfs_=
read
      0.70 =C2=B1 10%    +116.5%       1.51 =C2=B1  7%  perf-profile.cycles=
-pp.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.pipe_wait.pipe_w=
rite
      1.90 =C2=B1  3%     +77.0%       3.37 =C2=B1  4%  perf-profile.cycles=
-pp.mutex_spin_on_owner.isra.4.mutex_optimistic_spin.__mutex_lock_slowpath.=
mutex_lock.pipe_read
      0.69 =C2=B1 10%    +117.1%       1.49 =C2=B1  8%  perf-profile.cycles=
-pp.mutex_spin_on_owner.isra.4.mutex_optimistic_spin.__mutex_lock_slowpath.=
mutex_lock.pipe_wait
      0.01 =C2=B1-10000%  +11850.0%       1.19 =C2=B1  7%  perf-profile.cyc=
les-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__account_sc=
heduler_latency.enqueue_entity.enqueue_task_fair
      1.28 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.note_gp_changes.rcu_process_callbacks.__do_softirq.irq_exit.smp_apic_ti=
mer_interrupt
      0.95 =C2=B1 10%     +77.0%       1.67 =C2=B1  7%  perf-profile.cycles=
-pp.pipe_wait.pipe_write.__vfs_write.vfs_write.sys_write
      1.32 =C2=B1  3%     +21.6%       1.61 =C2=B1  1%  perf-profile.cycles=
-pp.print_context_stack.dump_trace.save_stack_trace_tsk.__account_scheduler=
_latency.enqueue_entity
      1.58 =C2=B1 13%     +63.1%       2.58 =C2=B1  4%  perf-profile.cycles=
-pp.rcu_check_callbacks.update_process_times.tick_sched_handle.tick_sched_t=
imer.__hrtimer_run_queues
      1.62 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.rcu_process_callbacks.__do_softirq.irq_exit.smp_apic_timer_interrupt.ap=
ic_timer_interrupt
      0.28 =C2=B1 32%    +252.3%       0.98 =C2=B1  6%  perf-profile.cycles=
-pp.ret_from_fork
      1.52 =C2=B1  3%     +18.9%       1.81 =C2=B1  2%  perf-profile.cycles=
-pp.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entity.enqueue=
_task_fair.activate_task
      1.17 =C2=B1  3%     +22.2%       1.43 =C2=B1  5%  perf-profile.cycles=
-pp.sched_ttwu_pending.cpu_startup_entry.start_secondary
      6.51 =C2=B1  6%     -19.4%       5.24 =C2=B1  2%  perf-profile.cycles=
-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer.=
__hrtimer_run_queues
     14.39 =C2=B1  7%     -24.2%      10.91 =C2=B1  0%  perf-profile.cycles=
-pp.smp_apic_timer_interrupt.apic_timer_interrupt
      4.59 =C2=B1  6%     -17.8%       3.77 =C2=B1  3%  perf-profile.cycles=
-pp.task_tick_fair.scheduler_tick.update_process_times.tick_sched_handle.ti=
ck_sched_timer
      0.00 =C2=B1 -1%      +Inf%       2.20 =C2=B1  5%  perf-profile.cycles=
-pp.try_to_wake_up.wake_up_process.invoke_rcu_core.rcu_check_callbacks.upda=
te_process_times
      1.12 =C2=B1  2%     +21.4%       1.36 =C2=B1  4%  perf-profile.cycles=
-pp.ttwu_do_activate.constprop.87.sched_ttwu_pending.cpu_startup_entry.star=
t_secondary
      0.00 =C2=B1 -1%      +Inf%       2.14 =C2=B1  5%  perf-profile.cycles=
-pp.ttwu_do_activate.constprop.87.try_to_wake_up.wake_up_process.invoke_rcu=
_core.rcu_check_callbacks
      2.47 =C2=B1  8%     -21.6%       1.94 =C2=B1  3%  perf-profile.cycles=
-pp.update_cfs_shares.task_tick_fair.scheduler_tick.update_process_times.ti=
ck_sched_handle
      0.00 =C2=B1 -1%      +Inf%       2.23 =C2=B1  5%  perf-profile.cycles=
-pp.wake_up_process.invoke_rcu_core.rcu_check_callbacks.update_process_time=
s.tick_sched_handle
      1058 =C2=B1 11%     +73.1%       1831 =C2=B1  3%  sched_debug.cfs_rq:=
/.exec_clock.stddev
     18.00 =C2=B1 73%     +72.2%      31.00 =C2=B1 53%  sched_debug.cfs_rq:=
/.load.31
     11.00 =C2=B1 23%    +184.1%      31.25 =C2=B1 93%  sched_debug.cfs_rq:=
/.load.36
     10.50 =C2=B1 17%    +114.3%      22.50 =C2=B1 65%  sched_debug.cfs_rq:=
/.load.4
      8.25 =C2=B1 13%     +51.5%      12.50 =C2=B1 12%  sched_debug.cfs_rq:=
/.load.62
     14.55 =C2=B1  9%     +48.4%      21.59 =C2=B1 40%  sched_debug.cfs_rq:=
/.load.avg
     83.54 =C2=B1 15%    +290.1%     325.88 =C2=B1 98%  sched_debug.cfs_rq:=
/.load.max
     14.00 =C2=B1  8%     +35.7%      19.00 =C2=B1  8%  sched_debug.cfs_rq:=
/.load_avg.1
     16.75 =C2=B1 42%     +73.1%      29.00 =C2=B1 43%  sched_debug.cfs_rq:=
/.load_avg.13
     13.25 =C2=B1  6%    +117.0%      28.75 =C2=B1 42%  sched_debug.cfs_rq:=
/.load_avg.18
     14.50 =C2=B1 11%     +31.0%      19.00 =C2=B1  8%  sched_debug.cfs_rq:=
/.load_avg.19
     16.25 =C2=B1 19%    +106.2%      33.50 =C2=B1 33%  sched_debug.cfs_rq:=
/.load_avg.2
     13.75 =C2=B1 12%     +47.3%      20.25 =C2=B1 19%  sched_debug.cfs_rq:=
/.load_avg.21
     12.25 =C2=B1  8%     +98.0%      24.25 =C2=B1 26%  sched_debug.cfs_rq:=
/.load_avg.22
     14.00 =C2=B1  8%    +132.1%      32.50 =C2=B1 70%  sched_debug.cfs_rq:=
/.load_avg.24
     14.00 =C2=B1 13%     +33.9%      18.75 =C2=B1  9%  sched_debug.cfs_rq:=
/.load_avg.26
     14.50 =C2=B1 14%     +39.7%      20.25 =C2=B1 25%  sched_debug.cfs_rq:=
/.load_avg.28
     17.50 =C2=B1 38%    +228.6%      57.50 =C2=B1 66%  sched_debug.cfs_rq:=
/.load_avg.31
     12.00 =C2=B1  5%     +43.8%      17.25 =C2=B1  4%  sched_debug.cfs_rq:=
/.load_avg.33
     12.50 =C2=B1  8%     +94.0%      24.25 =C2=B1 37%  sched_debug.cfs_rq:=
/.load_avg.36
     12.00 =C2=B1  8%     +31.2%      15.75 =C2=B1  5%  sched_debug.cfs_rq:=
/.load_avg.37
     11.50 =C2=B1  9%     +43.5%      16.50 =C2=B1  9%  sched_debug.cfs_rq:=
/.load_avg.38
     11.00 =C2=B1  9%     +40.9%      15.50 =C2=B1  3%  sched_debug.cfs_rq:=
/.load_avg.40
     12.00 =C2=B1  5%     +52.1%      18.25 =C2=B1 18%  sched_debug.cfs_rq:=
/.load_avg.41
     12.25 =C2=B1 10%     +59.2%      19.50 =C2=B1 28%  sched_debug.cfs_rq:=
/.load_avg.42
     12.25 =C2=B1  3%     +34.7%      16.50 =C2=B1  6%  sched_debug.cfs_rq:=
/.load_avg.43
     13.25 =C2=B1 17%     +32.1%      17.50 =C2=B1 13%  sched_debug.cfs_rq:=
/.load_avg.45
     11.50 =C2=B1  4%     +63.0%      18.75 =C2=B1 19%  sched_debug.cfs_rq:=
/.load_avg.47
     11.25 =C2=B1  7%     +46.7%      16.50 =C2=B1 10%  sched_debug.cfs_rq:=
/.load_avg.48
     11.50 =C2=B1  4%     +52.2%      17.50 =C2=B1 16%  sched_debug.cfs_rq:=
/.load_avg.49
     14.50 =C2=B1  7%    +160.3%      37.75 =C2=B1 59%  sched_debug.cfs_rq:=
/.load_avg.5
     11.75 =C2=B1  7%     +68.1%      19.75 =C2=B1 15%  sched_debug.cfs_rq:=
/.load_avg.50
     12.25 =C2=B1  3%     +49.0%      18.25 =C2=B1  5%  sched_debug.cfs_rq:=
/.load_avg.51
     11.50 =C2=B1  4%     +41.3%      16.25 =C2=B1  6%  sched_debug.cfs_rq:=
/.load_avg.52
     12.75 =C2=B1  6%     +31.4%      16.75 =C2=B1  4%  sched_debug.cfs_rq:=
/.load_avg.53
     11.50 =C2=B1  4%     +63.0%      18.75 =C2=B1 25%  sched_debug.cfs_rq:=
/.load_avg.55
     12.50 =C2=B1  6%     +22.0%      15.25 =C2=B1  9%  sched_debug.cfs_rq:=
/.load_avg.56
     12.75 =C2=B1 10%     +29.4%      16.50 =C2=B1  9%  sched_debug.cfs_rq:=
/.load_avg.57
     12.75 =C2=B1  6%     +33.3%      17.00 =C2=B1  5%  sched_debug.cfs_rq:=
/.load_avg.59
     11.00 =C2=B1  6%    +450.0%      60.50 =C2=B1121%  sched_debug.cfs_rq:=
/.load_avg.60
     13.25 =C2=B1  6%    +134.0%      31.00 =C2=B1 58%  sched_debug.cfs_rq:=
/.load_avg.9
     18.68 =C2=B1 11%     +29.7%      24.23 =C2=B1  7%  sched_debug.cfs_rq:=
/.load_avg.avg
   8357167 =C2=B1  0%      -9.4%    7575461 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.min
     31266 =C2=B1  8%    +178.3%      87018 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      1.50 =C2=B1 33%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq:=
/.nr_spread_over.20
      9.50 =C2=B1  5%    +136.8%      22.50 =C2=B1 65%  sched_debug.cfs_rq:=
/.runnable_load_avg.31
     10.25 =C2=B1 12%     +24.4%      12.75 =C2=B1  6%  sched_debug.cfs_rq:=
/.runnable_load_avg.6
      7.50 =C2=B1 14%     +50.0%      11.25 =C2=B1 11%  sched_debug.cfs_rq:=
/.runnable_load_avg.62
     11.38 =C2=B1  4%     +10.2%      12.54 =C2=B1  3%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
    -10859 =C2=B1-110%   -1302.5%     130579 =C2=B1 80%  sched_debug.cfs_rq=
:/.spread0.16
     -5717 =C2=B1-317%   -2565.6%     140970 =C2=B1 74%  sched_debug.cfs_rq=
:/.spread0.17
     -2108 =C2=B1-1380%   -6204.8%     128698 =C2=B1 66%  sched_debug.cfs_r=
q:/.spread0.18
     -6277 =C2=B1-357%   -2199.6%     131797 =C2=B1 75%  sched_debug.cfs_rq=
:/.spread0.21
      5887 =C2=B1103%   +2270.6%     139580 =C2=B1 66%  sched_debug.cfs_rq:=
/.spread0.22
    -85.49 =C2=B1-50351%  -1.8e+05%     155021 =C2=B1 68%  sched_debug.cfs_=
rq:/.spread0.26
      8784 =C2=B1375%   +1512.6%     141656 =C2=B1 69%  sched_debug.cfs_rq:=
/.spread0.28
      9681 =C2=B1295%   +1431.3%     148252 =C2=B1 74%  sched_debug.cfs_rq:=
/.spread0.29
      2979 =C2=B11852%   +4651.1%     141574 =C2=B1 69%  sched_debug.cfs_rq=
:/.spread0.30
      6454 =C2=B1622%   +2047.0%     138580 =C2=B1 83%  sched_debug.cfs_rq:=
/.spread0.31
     -7419 =C2=B1-119%    -667.9%      42131 =C2=B1 35%  sched_debug.cfs_rq=
:/.spread0.4
     -6914 =C2=B1-234%   -1073.7%      67329 =C2=B1 55%  sched_debug.cfs_rq=
:/.spread0.5
     62958 =C2=B1 38%    +205.5%     192354 =C2=B1 51%  sched_debug.cfs_rq:=
/.spread0.max
     31336 =C2=B1  8%    +178.1%      87132 =C2=B1  4%  sched_debug.cfs_rq:=
/.spread0.stddev
      1224 =C2=B1 11%     +19.8%       1467 =C2=B1 11%  sched_debug.cfs_rq:=
/.tg_load_avg.0
      1221 =C2=B1 11%     +20.6%       1472 =C2=B1 11%  sched_debug.cfs_rq:=
/.tg_load_avg.1
      1221 =C2=B1 11%     +22.4%       1495 =C2=B1 10%  sched_debug.cfs_rq:=
/.tg_load_avg.10
      1220 =C2=B1 11%     +22.5%       1495 =C2=B1 10%  sched_debug.cfs_rq:=
/.tg_load_avg.11
      1220 =C2=B1 11%     +22.4%       1494 =C2=B1 10%  sched_debug.cfs_rq:=
/.tg_load_avg.12
      1220 =C2=B1 11%     +22.3%       1492 =C2=B1  9%  sched_debug.cfs_rq:=
/.tg_load_avg.13
      1219 =C2=B1 11%     +22.8%       1496 =C2=B1 10%  sched_debug.cfs_rq:=
/.tg_load_avg.14
      1217 =C2=B1 11%     +22.9%       1497 =C2=B1  9%  sched_debug.cfs_rq:=
/.tg_load_avg.15
      1217 =C2=B1 11%     +23.0%       1497 =C2=B1  9%  sched_debug.cfs_rq:=
/.tg_load_avg.16
      1216 =C2=B1 12%     +22.6%       1491 =C2=B1 10%  sched_debug.cfs_rq:=
/.tg_load_avg.17
      1214 =C2=B1 12%     +23.0%       1493 =C2=B1 10%  sched_debug.cfs_rq:=
/.tg_load_avg.18
      1211 =C2=B1 11%     +23.4%       1494 =C2=B1 10%  sched_debug.cfs_rq:=
/.tg_load_avg.19
      1218 =C2=B1 11%     +21.2%       1476 =C2=B1 11%  sched_debug.cfs_rq:=
/.tg_load_avg.2
      1202 =C2=B1 11%     +24.5%       1496 =C2=B1 10%  sched_debug.cfs_rq:=
/.tg_load_avg.20
      1199 =C2=B1 11%     +25.1%       1500 =C2=B1 10%  sched_debug.cfs_rq:=
/.tg_load_avg.21
      1198 =C2=B1 11%     +25.2%       1501 =C2=B1 10%  sched_debug.cfs_rq:=
/.tg_load_avg.22
      1198 =C2=B1 11%     +25.4%       1503 =C2=B1 10%  sched_debug.cfs_rq:=
/.tg_load_avg.23
      1198 =C2=B1 11%     +25.5%       1504 =C2=B1  9%  sched_debug.cfs_rq:=
/.tg_load_avg.24
      1198 =C2=B1 11%     +25.6%       1505 =C2=B1  9%  sched_debug.cfs_rq:=
/.tg_load_avg.25
      1198 =C2=B1 11%     +25.7%       1506 =C2=B1  9%  sched_debug.cfs_rq:=
/.tg_load_avg.26
      1197 =C2=B1 11%     +25.6%       1503 =C2=B1  9%  sched_debug.cfs_rq:=
/.tg_load_avg.27
      1196 =C2=B1 11%     +25.5%       1500 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.28
      1196 =C2=B1 10%     +25.2%       1498 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.29
      1218 =C2=B1 11%     +21.3%       1478 =C2=B1 11%  sched_debug.cfs_rq:=
/.tg_load_avg.3
      1196 =C2=B1 10%     +25.2%       1497 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.30
      1195 =C2=B1 11%     +25.6%       1501 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.31
      1191 =C2=B1 11%     +26.3%       1504 =C2=B1  9%  sched_debug.cfs_rq:=
/.tg_load_avg.32
      1189 =C2=B1 11%     +26.4%       1503 =C2=B1  9%  sched_debug.cfs_rq:=
/.tg_load_avg.33
      1189 =C2=B1 11%     +26.6%       1505 =C2=B1  9%  sched_debug.cfs_rq:=
/.tg_load_avg.34
      1188 =C2=B1 11%     +26.9%       1507 =C2=B1  9%  sched_debug.cfs_rq:=
/.tg_load_avg.35
      1187 =C2=B1 10%     +26.8%       1505 =C2=B1  9%  sched_debug.cfs_rq:=
/.tg_load_avg.36
      1188 =C2=B1 10%     +26.7%       1505 =C2=B1  9%  sched_debug.cfs_rq:=
/.tg_load_avg.37
      1185 =C2=B1 11%     +26.6%       1501 =C2=B1  9%  sched_debug.cfs_rq:=
/.tg_load_avg.38
      1184 =C2=B1 11%     +26.8%       1501 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.39
      1219 =C2=B1 11%     +21.6%       1482 =C2=B1 11%  sched_debug.cfs_rq:=
/.tg_load_avg.4
      1183 =C2=B1 11%     +26.7%       1500 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.40
      1181 =C2=B1 10%     +26.8%       1497 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.41
      1176 =C2=B1 10%     +27.1%       1494 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.42
      1175 =C2=B1 10%     +27.3%       1496 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.43
      1174 =C2=B1 10%     +27.4%       1496 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.44
      1174 =C2=B1 10%     +27.4%       1496 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.45
      1174 =C2=B1 10%     +27.3%       1494 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.46
      1172 =C2=B1 10%     +27.5%       1494 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.47
      1171 =C2=B1 10%     +27.5%       1493 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.48
      1171 =C2=B1 10%     +27.7%       1495 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.49
      1219 =C2=B1 11%     +21.7%       1483 =C2=B1 10%  sched_debug.cfs_rq:=
/.tg_load_avg.5
      1171 =C2=B1 10%     +27.5%       1494 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.50
      1172 =C2=B1 10%     +27.3%       1492 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.51
      1171 =C2=B1 10%     +27.6%       1494 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.52
      1171 =C2=B1 10%     +27.5%       1494 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.53
      1171 =C2=B1 10%     +27.5%       1493 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.54
      1171 =C2=B1 10%     +27.8%       1496 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.55
      1170 =C2=B1 10%     +27.8%       1496 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.56
      1170 =C2=B1 10%     +27.9%       1496 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.57
      1170 =C2=B1 10%     +31.4%       1538 =C2=B1  5%  sched_debug.cfs_rq:=
/.tg_load_avg.58
      1171 =C2=B1 10%     +31.3%       1538 =C2=B1  5%  sched_debug.cfs_rq:=
/.tg_load_avg.59
      1219 =C2=B1 11%     +22.0%       1488 =C2=B1 10%  sched_debug.cfs_rq:=
/.tg_load_avg.6
      1166 =C2=B1 10%     +31.7%       1535 =C2=B1  6%  sched_debug.cfs_rq:=
/.tg_load_avg.60
      1164 =C2=B1 10%     +31.6%       1532 =C2=B1  5%  sched_debug.cfs_rq:=
/.tg_load_avg.61
      1165 =C2=B1 10%     +31.4%       1530 =C2=B1  5%  sched_debug.cfs_rq:=
/.tg_load_avg.62
      1164 =C2=B1 10%     +31.4%       1530 =C2=B1  5%  sched_debug.cfs_rq:=
/.tg_load_avg.63
      1220 =C2=B1 11%     +21.9%       1488 =C2=B1 10%  sched_debug.cfs_rq:=
/.tg_load_avg.7
      1220 =C2=B1 11%     +22.3%       1492 =C2=B1 10%  sched_debug.cfs_rq:=
/.tg_load_avg.8
      1221 =C2=B1 11%     +22.3%       1493 =C2=B1 10%  sched_debug.cfs_rq:=
/.tg_load_avg.9
      1193 =C2=B1 11%     +25.6%       1499 =C2=B1  9%  sched_debug.cfs_rq:=
/.tg_load_avg.avg
      1246 =C2=B1 12%     +29.6%       1615 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.max
      1140 =C2=B1 10%     +22.4%       1395 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg.min
     30.79 =C2=B1 38%    +112.1%      65.30 =C2=B1 18%  sched_debug.cfs_rq:=
/.tg_load_avg.stddev
     14.00 =C2=B1  8%     +35.7%      19.00 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.1
     16.75 =C2=B1 42%     +74.6%      29.25 =C2=B1 44%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.13
     13.25 =C2=B1  6%    +117.0%      28.75 =C2=B1 42%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.18
     14.50 =C2=B1 11%     +31.0%      19.00 =C2=B1  8%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.19
     16.25 =C2=B1 19%    +106.2%      33.50 =C2=B1 33%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.2
     13.75 =C2=B1 12%     +47.3%      20.25 =C2=B1 19%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.21
     12.25 =C2=B1  8%     +98.0%      24.25 =C2=B1 26%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.22
     14.00 =C2=B1  8%    +132.1%      32.50 =C2=B1 70%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.24
     14.00 =C2=B1 13%     +33.9%      18.75 =C2=B1  9%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.26
     14.50 =C2=B1 14%     +39.7%      20.25 =C2=B1 25%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.28
     17.50 =C2=B1 38%    +228.6%      57.50 =C2=B1 66%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.31
     12.00 =C2=B1  5%     +43.8%      17.25 =C2=B1  4%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.33
     12.50 =C2=B1  8%     +94.0%      24.25 =C2=B1 37%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.36
     12.00 =C2=B1  8%     +31.2%      15.75 =C2=B1  5%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.37
     11.50 =C2=B1  9%     +43.5%      16.50 =C2=B1  9%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.38
     11.00 =C2=B1  9%     +40.9%      15.50 =C2=B1  3%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.40
     12.00 =C2=B1  5%     +52.1%      18.25 =C2=B1 18%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.41
     12.25 =C2=B1 10%     +59.2%      19.50 =C2=B1 28%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.42
     12.25 =C2=B1  3%     +34.7%      16.50 =C2=B1  6%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.43
     13.25 =C2=B1 17%     +32.1%      17.50 =C2=B1 13%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.45
     11.50 =C2=B1  4%     +63.0%      18.75 =C2=B1 19%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.47
     11.25 =C2=B1  7%     +46.7%      16.50 =C2=B1 10%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.48
     11.50 =C2=B1  4%     +52.2%      17.50 =C2=B1 16%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.49
     14.50 =C2=B1  7%    +160.3%      37.75 =C2=B1 59%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.5
     11.75 =C2=B1  7%     +68.1%      19.75 =C2=B1 15%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.50
     12.25 =C2=B1  3%     +49.0%      18.25 =C2=B1  5%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.51
     11.50 =C2=B1  4%     +41.3%      16.25 =C2=B1  6%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.52
     12.75 =C2=B1  6%     +31.4%      16.75 =C2=B1  4%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.53
     11.50 =C2=B1  4%     +63.0%      18.75 =C2=B1 25%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.55
     12.50 =C2=B1  6%     +22.0%      15.25 =C2=B1  9%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.56
     12.75 =C2=B1 10%     +29.4%      16.50 =C2=B1  9%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.57
     12.75 =C2=B1  6%     +33.3%      17.00 =C2=B1  5%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.59
     11.00 =C2=B1  6%    +450.0%      60.50 =C2=B1121%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.60
     13.25 =C2=B1  6%    +134.0%      31.00 =C2=B1 58%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.9
     18.68 =C2=B1 11%     +29.7%      24.24 =C2=B1  7%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.avg
    819.25 =C2=B1  7%      -8.7%     748.00 =C2=B1  3%  sched_debug.cfs_rq:=
/.util_avg.11
    873.00 =C2=B1  7%     -10.1%     785.00 =C2=B1  2%  sched_debug.cfs_rq:=
/.util_avg.25
    868.00 =C2=B1  4%     -11.8%     765.50 =C2=B1  3%  sched_debug.cfs_rq:=
/.util_avg.30
   2968146 =C2=B1 86%     -84.9%     448460 =C2=B1 37%  sched_debug.cpu.avg=
_idle.23
   4368361 =C2=B1 85%     -88.6%     498060 =C2=B1 23%  sched_debug.cpu.avg=
_idle.35
   6161607 =C2=B1 69%     -92.0%     491530 =C2=B1  9%  sched_debug.cpu.avg=
_idle.53
   4760626 =C2=B1100%     -88.6%     540534 =C2=B1 17%  sched_debug.cpu.avg=
_idle.63
   1931240 =C2=B1 56%     -69.6%     587869 =C2=B1 19%  sched_debug.cpu.avg=
_idle.avg
     10.00 =C2=B1 25%    +120.0%      22.00 =C2=B1 68%  sched_debug.cpu.cpu=
_load[0].31
      8.50 =C2=B1 29%     +44.1%      12.25 =C2=B1 10%  sched_debug.cpu.cpu=
_load[0].32
      9.25 =C2=B1 15%    +118.9%      20.25 =C2=B1 76%  sched_debug.cpu.cpu=
_load[1].2
     10.25 =C2=B1 24%    +112.2%      21.75 =C2=B1 69%  sched_debug.cpu.cpu=
_load[1].31
      9.00 =C2=B1 24%     +36.1%      12.25 =C2=B1 10%  sched_debug.cpu.cpu=
_load[1].32
      8.00 =C2=B1 15%     +40.6%      11.25 =C2=B1  7%  sched_debug.cpu.cpu=
_load[1].62
     71.88 =C2=B1 25%     -20.8%      56.92 =C2=B1  5%  sched_debug.cpu.cpu=
_load[1].max
      9.00 =C2=B1 13%     +33.3%      12.00 =C2=B1 13%  sched_debug.cpu.cpu=
_load[2].32
      9.25 =C2=B1 24%     +35.1%      12.50 =C2=B1  4%  sched_debug.cpu.cpu=
_load[2].59
      8.75 =C2=B1 12%     +28.6%      11.25 =C2=B1  7%  sched_debug.cpu.cpu=
_load[2].62
     62.58 =C2=B1  5%      -9.7%      56.54 =C2=B1  5%  sched_debug.cpu.cpu=
_load[2].max
     10.00 =C2=B1 12%     +25.0%      12.50 =C2=B1  8%  sched_debug.cpu.cpu=
_load[3].41
      9.25 =C2=B1 15%     +27.0%      11.75 =C2=B1  3%  sched_debug.cpu.cpu=
_load[3].62
     12.00 =C2=B1  8%     -16.7%      10.00 =C2=B1 14%  sched_debug.cpu.cpu=
_load[3].7
     62.21 =C2=B1  6%     -10.2%      55.88 =C2=B1  4%  sched_debug.cpu.cpu=
_load[3].max
      9.25 =C2=B1 16%     -16.7%       7.71 =C2=B1  2%  sched_debug.cpu.cpu=
_load[3].stddev
     10.50 =C2=B1 10%     +21.4%      12.75 =C2=B1  6%  sched_debug.cpu.cpu=
_load[4].41
     10.75 =C2=B1  4%     +16.3%      12.50 =C2=B1  4%  sched_debug.cpu.cpu=
_load[4].60
      9.50 =C2=B1 15%     +23.7%      11.75 =C2=B1  3%  sched_debug.cpu.cpu=
_load[4].62
     13.00 =C2=B1  9%     -19.2%      10.50 =C2=B1 10%  sched_debug.cpu.cpu=
_load[4].7
      3605 =C2=B1 14%     +18.9%       4288 =C2=B1  8%  sched_debug.cpu.cur=
r->pid.12
      3507 =C2=B1 17%     +22.5%       4295 =C2=B1  8%  sched_debug.cpu.cur=
r->pid.19
      3393 =C2=B1 17%     +39.0%       4716 =C2=B1  2%  sched_debug.cpu.cur=
r->pid.2
      3033 =C2=B1 41%     +46.1%       4429 =C2=B1  6%  sched_debug.cpu.cur=
r->pid.20
      3374 =C2=B1 20%     +32.6%       4474 =C2=B1 10%  sched_debug.cpu.cur=
r->pid.22
      3783 =C2=B1 16%     +26.8%       4799 =C2=B1  2%  sched_debug.cpu.cur=
r->pid.24
      3139 =C2=B1 14%     +26.7%       3976 =C2=B1 16%  sched_debug.cpu.cur=
r->pid.47
      2913 =C2=B1  4%     +31.1%       3819 =C2=B1 13%  sched_debug.cpu.cur=
r->pid.52
      2904 =C2=B1 34%     +36.6%       3967 =C2=B1 15%  sched_debug.cpu.cur=
r->pid.53
      2599 =C2=B1 38%     +58.9%       4130 =C2=B1 11%  sched_debug.cpu.cur=
r->pid.55
      2531 =C2=B1 31%     +69.1%       4281 =C2=B1 12%  sched_debug.cpu.cur=
r->pid.62
      3641 =C2=B1  9%     +14.9%       4182 =C2=B1  3%  sched_debug.cpu.cur=
r->pid.avg
      1614 =C2=B1 11%     -21.2%       1272 =C2=B1 18%  sched_debug.cpu.cur=
r->pid.stddev
      9.75 =C2=B1 20%    +230.8%      32.25 =C2=B1 96%  sched_debug.cpu.loa=
d.2
      9.50 =C2=B1  9%    +213.2%      29.75 =C2=B1 51%  sched_debug.cpu.loa=
d.31
     11.00 =C2=B1 23%    +184.1%      31.25 =C2=B1 93%  sched_debug.cpu.loa=
d.36
     10.50 =C2=B1 17%    +438.1%      56.50 =C2=B1130%  sched_debug.cpu.loa=
d.4
     11.75 =C2=B1 16%    +472.3%      67.25 =C2=B1102%  sched_debug.cpu.loa=
d.9
      0.73 =C2=B1  6%     +12.5%       0.82 =C2=B1  2%  sched_debug.cpu.nr_=
running.avg
     84395 =C2=B1  3%    +113.9%     180480 =C2=B1 16%  sched_debug.cpu.nr_=
switches.0
     77429 =C2=B1  4%    +110.8%     163241 =C2=B1 14%  sched_debug.cpu.nr_=
switches.1
     84142 =C2=B1  6%     +86.9%     157226 =C2=B1 20%  sched_debug.cpu.nr_=
switches.10
     81593 =C2=B1  5%     +95.6%     159614 =C2=B1 21%  sched_debug.cpu.nr_=
switches.11
     81245 =C2=B1  4%     +91.5%     155561 =C2=B1 19%  sched_debug.cpu.nr_=
switches.12
     85245 =C2=B1  8%     +82.1%     155210 =C2=B1 18%  sched_debug.cpu.nr_=
switches.13
     80962 =C2=B1  8%     +96.0%     158680 =C2=B1 21%  sched_debug.cpu.nr_=
switches.14
     82050 =C2=B1 12%     +90.2%     156083 =C2=B1 19%  sched_debug.cpu.nr_=
switches.15
     72671 =C2=B1  5%     +75.4%     127439 =C2=B1  1%  sched_debug.cpu.nr_=
switches.16
     75753 =C2=B1  8%     +71.0%     129549 =C2=B1  1%  sched_debug.cpu.nr_=
switches.17
     73599 =C2=B1 10%     +74.5%     128427 =C2=B1  4%  sched_debug.cpu.nr_=
switches.18
     75133 =C2=B1  3%     +67.7%     125969 =C2=B1  0%  sched_debug.cpu.nr_=
switches.19
     81149 =C2=B1  1%    +102.1%     163966 =C2=B1 16%  sched_debug.cpu.nr_=
switches.2
     74317 =C2=B1  7%     +67.4%     124399 =C2=B1  1%  sched_debug.cpu.nr_=
switches.20
     74652 =C2=B1  7%     +67.3%     124906 =C2=B1  1%  sched_debug.cpu.nr_=
switches.21
     72321 =C2=B1  6%     +70.1%     123029 =C2=B1  3%  sched_debug.cpu.nr_=
switches.22
     70091 =C2=B1  7%     +77.2%     124214 =C2=B1  1%  sched_debug.cpu.nr_=
switches.23
     83825 =C2=B1  7%     +49.7%     125516 =C2=B1  0%  sched_debug.cpu.nr_=
switches.24
     78124 =C2=B1  3%     +61.0%     125817 =C2=B1  5%  sched_debug.cpu.nr_=
switches.25
     81567 =C2=B1 13%     +56.0%     127211 =C2=B1  3%  sched_debug.cpu.nr_=
switches.26
     78494 =C2=B1  6%     +56.2%     122622 =C2=B1  2%  sched_debug.cpu.nr_=
switches.27
     76848 =C2=B1  2%     +62.4%     124778 =C2=B1  3%  sched_debug.cpu.nr_=
switches.28
     78518 =C2=B1  4%     +61.0%     126378 =C2=B1  5%  sched_debug.cpu.nr_=
switches.29
     84876 =C2=B1 16%     +88.0%     159556 =C2=B1 13%  sched_debug.cpu.nr_=
switches.3
     76995 =C2=B1  5%     +61.3%     124156 =C2=B1  1%  sched_debug.cpu.nr_=
switches.30
     78590 =C2=B1  1%     +59.9%     125696 =C2=B1  0%  sched_debug.cpu.nr_=
switches.31
     67912 =C2=B1  6%     +98.6%     134869 =C2=B1  9%  sched_debug.cpu.nr_=
switches.32
     62204 =C2=B1  5%    +125.9%     140500 =C2=B1 13%  sched_debug.cpu.nr_=
switches.33
     62482 =C2=B1  1%    +127.0%     141849 =C2=B1 12%  sched_debug.cpu.nr_=
switches.34
     70405 =C2=B1 16%     +97.8%     139290 =C2=B1 11%  sched_debug.cpu.nr_=
switches.35
     61042 =C2=B1  4%    +124.0%     136764 =C2=B1 10%  sched_debug.cpu.nr_=
switches.36
     65688 =C2=B1  4%    +101.2%     132131 =C2=B1  9%  sched_debug.cpu.nr_=
switches.37
     57838 =C2=B1  1%    +134.2%     135453 =C2=B1 11%  sched_debug.cpu.nr_=
switches.38
     62171 =C2=B1  4%    +128.2%     141856 =C2=B1 13%  sched_debug.cpu.nr_=
switches.39
     74777 =C2=B1  4%    +106.4%     154355 =C2=B1 15%  sched_debug.cpu.nr_=
switches.4
     67241 =C2=B1  3%    +107.4%     139442 =C2=B1 16%  sched_debug.cpu.nr_=
switches.40
     68428 =C2=B1 13%    +113.1%     145803 =C2=B1 10%  sched_debug.cpu.nr_=
switches.41
     71592 =C2=B1  9%    +103.0%     145311 =C2=B1 23%  sched_debug.cpu.nr_=
switches.42
     64643 =C2=B1  3%    +113.0%     137708 =C2=B1 12%  sched_debug.cpu.nr_=
switches.43
     65576 =C2=B1  8%    +105.1%     134528 =C2=B1 14%  sched_debug.cpu.nr_=
switches.44
     67919 =C2=B1  7%     +99.2%     135263 =C2=B1 10%  sched_debug.cpu.nr_=
switches.45
     68944 =C2=B1  4%     +99.7%     137711 =C2=B1 14%  sched_debug.cpu.nr_=
switches.46
     62895 =C2=B1  5%    +108.3%     130996 =C2=B1  8%  sched_debug.cpu.nr_=
switches.47
     63237 =C2=B1  4%     +94.4%     122960 =C2=B1  2%  sched_debug.cpu.nr_=
switches.48
     60612 =C2=B1  3%     +98.1%     120059 =C2=B1  1%  sched_debug.cpu.nr_=
switches.49
     77507 =C2=B1  4%     +92.0%     148844 =C2=B1 14%  sched_debug.cpu.nr_=
switches.5
     64088 =C2=B1  5%     +84.9%     118517 =C2=B1  3%  sched_debug.cpu.nr_=
switches.50
     65696 =C2=B1  8%     +82.6%     119975 =C2=B1  2%  sched_debug.cpu.nr_=
switches.51
     63816 =C2=B1  2%     +85.1%     118099 =C2=B1  2%  sched_debug.cpu.nr_=
switches.52
     65839 =C2=B1  9%     +77.0%     116538 =C2=B1  1%  sched_debug.cpu.nr_=
switches.53
     65430 =C2=B1 11%     +81.3%     118602 =C2=B1  1%  sched_debug.cpu.nr_=
switches.54
     58787 =C2=B1  2%     +98.3%     116584 =C2=B1  1%  sched_debug.cpu.nr_=
switches.55
     66765 =C2=B1  7%     +84.1%     122886 =C2=B1  4%  sched_debug.cpu.nr_=
switches.56
     65362 =C2=B1  5%     +80.7%     118113 =C2=B1  1%  sched_debug.cpu.nr_=
switches.57
     67786 =C2=B1  9%     +74.1%     118018 =C2=B1  2%  sched_debug.cpu.nr_=
switches.58
     64555 =C2=B1  6%     +83.6%     118511 =C2=B1  2%  sched_debug.cpu.nr_=
switches.59
     71151 =C2=B1  4%    +115.4%     153294 =C2=B1 14%  sched_debug.cpu.nr_=
switches.6
     61293 =C2=B1  4%     +96.0%     120117 =C2=B1  4%  sched_debug.cpu.nr_=
switches.60
     66614 =C2=B1  4%     +78.9%     119165 =C2=B1  3%  sched_debug.cpu.nr_=
switches.61
     65731 =C2=B1  4%     +79.9%     118276 =C2=B1  3%  sched_debug.cpu.nr_=
switches.62
     61797 =C2=B1  5%     +91.5%     118327 =C2=B1  1%  sched_debug.cpu.nr_=
switches.63
     76216 =C2=B1  4%    +105.5%     156631 =C2=B1  9%  sched_debug.cpu.nr_=
switches.7
     90008 =C2=B1 15%     +76.1%     158501 =C2=B1 18%  sched_debug.cpu.nr_=
switches.8
     86123 =C2=B1  2%     +88.4%     162241 =C2=B1 23%  sched_debug.cpu.nr_=
switches.9
     71793 =C2=B1  1%     +88.6%     135435 =C2=B1  2%  sched_debug.cpu.nr_=
switches.avg
    102412 =C2=B1  9%     +98.8%     203595 =C2=B1  8%  sched_debug.cpu.nr_=
switches.max
     55886 =C2=B1  1%    +103.7%     113861 =C2=B1  1%  sched_debug.cpu.nr_=
switches.min
     10306 =C2=B1  8%    +126.4%      23335 =C2=B1 15%  sched_debug.cpu.nr_=
switches.stddev
    -67.50 =C2=B1-59%     -70.7%     -19.75 =C2=B1-112%  sched_debug.cpu.nr=
_uninterruptible.11
     77549 =C2=B1  4%    +288.6%     301330 =C2=B1 75%  sched_debug.cpu.sch=
ed_count.1
     84286 =C2=B1  6%     +86.6%     157289 =C2=B1 20%  sched_debug.cpu.sch=
ed_count.10
     81726 =C2=B1  5%    +121.6%     181119 =C2=B1 37%  sched_debug.cpu.sch=
ed_count.11
     81376 =C2=B1  4%     +91.4%     155743 =C2=B1 19%  sched_debug.cpu.sch=
ed_count.12
     85382 =C2=B1  8%     +82.8%     156069 =C2=B1 18%  sched_debug.cpu.sch=
ed_count.13
     81077 =C2=B1  8%    +296.6%     321545 =C2=B1 57%  sched_debug.cpu.sch=
ed_count.14
     82182 =C2=B1 12%    +127.2%     186752 =C2=B1 38%  sched_debug.cpu.sch=
ed_count.15
     73141 =C2=B1  4%     +75.3%     128233 =C2=B1  1%  sched_debug.cpu.sch=
ed_count.16
     86558 =C2=B1 20%     +79.6%     155455 =C2=B1 27%  sched_debug.cpu.sch=
ed_count.17
     76106 =C2=B1  3%     +66.4%     126629 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.19
     81303 =C2=B1  1%    +140.8%     195739 =C2=B1 23%  sched_debug.cpu.sch=
ed_count.2
     76515 =C2=B1  8%     +76.0%     134676 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.20
     72976 =C2=B1  5%    +119.3%     160035 =C2=B1 40%  sched_debug.cpu.sch=
ed_count.22
     70609 =C2=B1  7%     +96.3%     138612 =C2=B1 17%  sched_debug.cpu.sch=
ed_count.23
     79251 =C2=B1  4%     +59.6%     126467 =C2=B1  5%  sched_debug.cpu.sch=
ed_count.25
     82207 =C2=B1  9%     +50.9%     124040 =C2=B1  2%  sched_debug.cpu.sch=
ed_count.27
     79366 =C2=B1  5%     +60.1%     127096 =C2=B1  5%  sched_debug.cpu.sch=
ed_count.29
     85015 =C2=B1 16%     +87.8%     159625 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.3
     79809 =C2=B1  2%     +58.5%     126502 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.31
     77527 =C2=B1 26%     +75.8%     136277 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.32
     62298 =C2=B1  5%    +125.6%     140558 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.33
     62586 =C2=B1  1%    +181.5%     176152 =C2=B1 30%  sched_debug.cpu.sch=
ed_count.34
     70503 =C2=B1 16%     +97.7%     139349 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.35
     61146 =C2=B1  4%    +124.7%     137413 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.36
     65796 =C2=B1  4%    +100.9%     132194 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.37
     57944 =C2=B1  1%    +137.8%     137770 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.38
     62269 =C2=B1  4%    +127.9%     141924 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.39
     74904 =C2=B1  4%    +107.8%     155619 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.4
     67660 =C2=B1  3%    +106.2%     139505 =C2=B1 16%  sched_debug.cpu.sch=
ed_count.40
     68542 =C2=B1 13%    +120.9%     151411 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.41
     71700 =C2=B1  9%    +109.1%     149894 =C2=B1 27%  sched_debug.cpu.sch=
ed_count.42
     64735 =C2=B1  3%    +129.2%     148380 =C2=B1 21%  sched_debug.cpu.sch=
ed_count.43
     65680 =C2=B1  8%    +104.9%     134585 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.44
     68022 =C2=B1  7%    +102.6%     137817 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.45
     69048 =C2=B1  4%    +143.7%     168252 =C2=B1 24%  sched_debug.cpu.sch=
ed_count.46
     63003 =C2=B1  5%    +108.0%     131058 =C2=B1  8%  sched_debug.cpu.sch=
ed_count.47
     63349 =C2=B1  4%     +94.2%     123020 =C2=B1  2%  sched_debug.cpu.sch=
ed_count.48
     61704 =C2=B1  2%     +94.7%     120128 =C2=B1  1%  sched_debug.cpu.sch=
ed_count.49
     77625 =C2=B1  4%     +91.8%     148911 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.5
     64210 =C2=B1  5%     +85.7%     119251 =C2=B1  3%  sched_debug.cpu.sch=
ed_count.50
     72792 =C2=B1 22%     +65.7%     120651 =C2=B1  1%  sched_debug.cpu.sch=
ed_count.51
     63939 =C2=B1  2%     +84.8%     118155 =C2=B1  2%  sched_debug.cpu.sch=
ed_count.52
     65942 =C2=B1  9%     +76.8%     116594 =C2=B1  1%  sched_debug.cpu.sch=
ed_count.53
     65537 =C2=B1 11%     +82.4%     119539 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.54
     59190 =C2=B1  2%     +97.1%     116641 =C2=B1  1%  sched_debug.cpu.sch=
ed_count.55
     66870 =C2=B1  7%     +83.9%     122950 =C2=B1  4%  sched_debug.cpu.sch=
ed_count.56
     65465 =C2=B1  5%     +81.6%     118895 =C2=B1  1%  sched_debug.cpu.sch=
ed_count.57
     78383 =C2=B1 17%     +51.2%     118534 =C2=B1  3%  sched_debug.cpu.sch=
ed_count.58
     64928 =C2=B1  5%     +82.6%     118561 =C2=B1  2%  sched_debug.cpu.sch=
ed_count.59
     71277 =C2=B1  4%    +136.4%     168533 =C2=B1 12%  sched_debug.cpu.sch=
ed_count.6
     61413 =C2=B1  4%     +95.7%     120171 =C2=B1  4%  sched_debug.cpu.sch=
ed_count.60
     77088 =C2=B1 22%     +54.7%     119217 =C2=B1  3%  sched_debug.cpu.sch=
ed_count.61
     62526 =C2=B1  6%     +89.3%     118388 =C2=B1  1%  sched_debug.cpu.sch=
ed_count.63
     76349 =C2=B1  4%    +105.2%     156683 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.7
     90144 =C2=B1 15%     +77.1%     159647 =C2=B1 17%  sched_debug.cpu.sch=
ed_count.8
     86532 =C2=B1  2%    +106.0%     178271 =C2=B1 30%  sched_debug.cpu.sch=
ed_count.9
    167438 =C2=B1  0%     +40.6%     235415 =C2=B1  2%  sched_debug.cpu.sch=
ed_count.avg
     55985 =C2=B1  1%    +103.5%     113924 =C2=B1  1%  sched_debug.cpu.sch=
ed_count.min
     29727 =C2=B1  4%     +97.5%      58712 =C2=B1 24%  sched_debug.cpu.sch=
ed_goidle.0
     28245 =C2=B1  2%     +77.4%      50108 =C2=B1 16%  sched_debug.cpu.sch=
ed_goidle.1
     30434 =C2=B1  5%     +55.3%      47262 =C2=B1 20%  sched_debug.cpu.sch=
ed_goidle.10
     30254 =C2=B1  6%     +65.7%      50143 =C2=B1 24%  sched_debug.cpu.sch=
ed_goidle.11
     29736 =C2=B1  5%     +59.4%      47409 =C2=B1 21%  sched_debug.cpu.sch=
ed_goidle.12
     31838 =C2=B1  8%     +51.3%      48158 =C2=B1 20%  sched_debug.cpu.sch=
ed_goidle.13
     29923 =C2=B1  4%     +64.1%      49093 =C2=B1 22%  sched_debug.cpu.sch=
ed_goidle.14
     28598 =C2=B1  2%     +69.3%      48410 =C2=B1 23%  sched_debug.cpu.sch=
ed_goidle.15
     27953 =C2=B1  5%     +36.6%      38192 =C2=B1  1%  sched_debug.cpu.sch=
ed_goidle.16
     28940 =C2=B1  3%     +37.1%      39686 =C2=B1  6%  sched_debug.cpu.sch=
ed_goidle.17
     28662 =C2=B1  7%     +37.0%      39261 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.18
     28997 =C2=B1  2%     +29.9%      37654 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.19
     30751 =C2=B1  2%     +68.5%      51819 =C2=B1 21%  sched_debug.cpu.sch=
ed_goidle.2
     28421 =C2=B1  7%     +30.7%      37151 =C2=B1  1%  sched_debug.cpu.sch=
ed_goidle.20
     28218 =C2=B1  5%     +33.4%      37636 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.21
     27798 =C2=B1  5%     +31.5%      36561 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.22
     27498 =C2=B1  5%     +32.8%      36508 =C2=B1  0%  sched_debug.cpu.sch=
ed_goidle.23
     30216 =C2=B1  4%     +25.4%      37899 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.24
     28933 =C2=B1  4%     +30.4%      37718 =C2=B1  7%  sched_debug.cpu.sch=
ed_goidle.25
     31024 =C2=B1 12%     +21.6%      37712 =C2=B1  6%  sched_debug.cpu.sch=
ed_goidle.26
     28901 =C2=B1  4%     +24.9%      36108 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.27
     27637 =C2=B1  1%     +35.2%      37375 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.28
     29863 =C2=B1  8%     +23.7%      36934 =C2=B1  6%  sched_debug.cpu.sch=
ed_goidle.29
     32197 =C2=B1 18%     +58.2%      50935 =C2=B1 15%  sched_debug.cpu.sch=
ed_goidle.3
     28749 =C2=B1  6%     +28.0%      36812 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.30
     30986 =C2=B1  5%     +19.4%      36990 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.31
     25828 =C2=B1  8%     +57.8%      40755 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.32
     24088 =C2=B1  1%     +71.1%      41207 =C2=B1 15%  sched_debug.cpu.sch=
ed_goidle.33
     23730 =C2=B1  1%     +77.0%      42011 =C2=B1 13%  sched_debug.cpu.sch=
ed_goidle.34
     24761 =C2=B1  4%     +63.0%      40371 =C2=B1 12%  sched_debug.cpu.sch=
ed_goidle.35
     23558 =C2=B1  3%     +72.5%      40646 =C2=B1 12%  sched_debug.cpu.sch=
ed_goidle.36
     24065 =C2=B1  2%     +64.8%      39659 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.37
     23160 =C2=B1  2%     +75.5%      40636 =C2=B1 13%  sched_debug.cpu.sch=
ed_goidle.38
     23878 =C2=B1  2%     +81.9%      43430 =C2=B1 17%  sched_debug.cpu.sch=
ed_goidle.39
     29199 =C2=B1  3%     +66.7%      48670 =C2=B1 19%  sched_debug.cpu.sch=
ed_goidle.4
     25693 =C2=B1  1%     +69.9%      43644 =C2=B1 19%  sched_debug.cpu.sch=
ed_goidle.40
     25576 =C2=B1  9%     +69.1%      43253 =C2=B1  7%  sched_debug.cpu.sch=
ed_goidle.41
     26853 =C2=B1 13%     +70.2%      45691 =C2=B1 29%  sched_debug.cpu.sch=
ed_goidle.42
     24978 =C2=B1  3%     +62.0%      40477 =C2=B1 12%  sched_debug.cpu.sch=
ed_goidle.43
     24801 =C2=B1  6%     +61.6%      40081 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.44
     26192 =C2=B1  9%     +55.2%      40655 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.45
     25710 =C2=B1  4%     +59.9%      41104 =C2=B1 16%  sched_debug.cpu.sch=
ed_goidle.46
     23858 =C2=B1  3%     +63.3%      38968 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.47
     24723 =C2=B1  4%     +48.6%      36746 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.48
     24232 =C2=B1  1%     +45.1%      35162 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.49
     29995 =C2=B1  3%     +56.2%      46861 =C2=B1 18%  sched_debug.cpu.sch=
ed_goidle.5
     25241 =C2=B1  3%     +39.1%      35117 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.50
     24133 =C2=B1  5%     +44.6%      34895 =C2=B1  1%  sched_debug.cpu.sch=
ed_goidle.51
     24730 =C2=B1  2%     +41.3%      34933 =C2=B1  0%  sched_debug.cpu.sch=
ed_goidle.52
     25453 =C2=B1  7%     +36.8%      34821 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.53
     25722 =C2=B1 13%     +34.9%      34706 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.54
     23930 =C2=B1  3%     +42.4%      34085 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.55
     24201 =C2=B1  4%     +52.3%      36864 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.56
     24472 =C2=B1  5%     +40.2%      34298 =C2=B1  1%  sched_debug.cpu.sch=
ed_goidle.57
     25448 =C2=B1  8%     +35.5%      34482 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.58
     24887 =C2=B1  5%     +38.8%      34556 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.59
     26933 =C2=B1  1%     +73.2%      46658 =C2=B1 18%  sched_debug.cpu.sch=
ed_goidle.6
     23749 =C2=B1  3%     +48.4%      35241 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.60
     24815 =C2=B1  4%     +38.2%      34299 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.61
     24466 =C2=B1  3%     +42.5%      34860 =C2=B1  5%  sched_debug.cpu.sch=
ed_goidle.62
     23970 =C2=B1  5%     +42.7%      34212 =C2=B1  0%  sched_debug.cpu.sch=
ed_goidle.63
     28242 =C2=B1  6%     +73.8%      49076 =C2=B1  8%  sched_debug.cpu.sch=
ed_goidle.7
     33580 =C2=B1 17%     +46.5%      49206 =C2=B1 19%  sched_debug.cpu.sch=
ed_goidle.8
     30134 =C2=B1  4%     +68.7%      50850 =C2=B1 27%  sched_debug.cpu.sch=
ed_goidle.9
     27086 =C2=B1  1%     +50.9%      40866 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.avg
     39386 =C2=B1  9%     +71.4%      67493 =C2=B1 13%  sched_debug.cpu.sch=
ed_goidle.max
     22323 =C2=B1  1%     +48.1%      33071 =C2=B1  1%  sched_debug.cpu.sch=
ed_goidle.min
      3407 =C2=B1  7%    +148.3%       8462 =C2=B1 17%  sched_debug.cpu.sch=
ed_goidle.stddev
     50992 =C2=B1  7%     +77.9%      90723 =C2=B1 18%  sched_debug.cpu.ttw=
u_count.0
     42239 =C2=B1  4%     +89.9%      80217 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.1
     44930 =C2=B1  8%     +74.1%      78243 =C2=B1 14%  sched_debug.cpu.ttw=
u_count.10
     42413 =C2=B1  5%     +81.0%      76753 =C2=B1 15%  sched_debug.cpu.ttw=
u_count.11
     41928 =C2=B1  2%     +78.8%      74981 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.12
     42554 =C2=B1  9%     +80.8%      76953 =C2=B1  8%  sched_debug.cpu.ttw=
u_count.13
     42337 =C2=B1  8%     +80.0%      76211 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.14
     43642 =C2=B1 15%     +72.0%      75056 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.15
     38075 =C2=B1  6%     +90.6%      72571 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.16
     39543 =C2=B1 10%     +75.6%      69432 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.17
     38901 =C2=B1  8%     +80.7%      70300 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.18
     39412 =C2=B1  6%     +72.7%      68053 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.19
     44710 =C2=B1  3%     +72.5%      77140 =C2=B1  8%  sched_debug.cpu.ttw=
u_count.2
     38995 =C2=B1  7%     +77.8%      69332 =C2=B1  0%  sched_debug.cpu.ttw=
u_count.20
     39023 =C2=B1  7%     +76.1%      68709 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.21
     39450 =C2=B1 13%     +71.4%      67630 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.22
     37157 =C2=B1  9%     +87.3%      69610 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.23
     44308 =C2=B1  9%     +68.5%      74671 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.24
     42180 =C2=B1  3%     +73.2%      73061 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.25
     42043 =C2=B1  9%     +71.0%      71884 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.26
     41798 =C2=B1  7%     +71.1%      71530 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.27
     41110 =C2=B1  4%     +71.1%      70345 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.28
     41743 =C2=B1  3%     +71.6%      71646 =C2=B1  6%  sched_debug.cpu.ttw=
u_count.29
     42775 =C2=B1  5%     +71.9%      73545 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.3
     43191 =C2=B1  5%     +65.1%      71304 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.30
     38668 =C2=B1  7%     +85.5%      71717 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.31
     35007 =C2=B1  3%     +90.6%      66710 =C2=B1  6%  sched_debug.cpu.ttw=
u_count.32
     33433 =C2=B1  4%    +102.9%      67833 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.33
     33509 =C2=B1  2%     +99.3%      66780 =C2=B1 10%  sched_debug.cpu.ttw=
u_count.34
     39999 =C2=B1 14%     +73.9%      69566 =C2=B1  8%  sched_debug.cpu.ttw=
u_count.35
     33062 =C2=B1  2%    +104.9%      67735 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.36
     36843 =C2=B1  8%     +73.6%      63941 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.37
     31228 =C2=B1  2%    +105.1%      64047 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.38
     33905 =C2=B1 10%    +102.9%      68791 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.39
     38347 =C2=B1  3%     +86.4%      71476 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.4
     36106 =C2=B1  7%     +77.6%      64121 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.40
     35376 =C2=B1  9%     +94.9%      68938 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.41
     36193 =C2=B1  6%     +83.7%      66502 =C2=B1 14%  sched_debug.cpu.ttw=
u_count.42
     33555 =C2=B1  6%     +98.6%      66646 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.43
     34821 =C2=B1  7%     +88.0%      65471 =C2=B1  8%  sched_debug.cpu.ttw=
u_count.44
     35764 =C2=B1  7%     +79.0%      64010 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.45
     35319 =C2=B1  4%     +90.1%      67129 =C2=B1  8%  sched_debug.cpu.ttw=
u_count.46
     33819 =C2=B1  2%     +89.2%      63982 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.47
     33741 =C2=B1  5%     +83.4%      61887 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.48
     31531 =C2=B1  4%     +98.3%      62525 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.49
     40041 =C2=B1  2%     +78.1%      71328 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.5
     33406 =C2=B1  4%     +84.1%      61506 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.50
     35221 =C2=B1 10%     +76.0%      61989 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.51
     34507 =C2=B1  9%     +77.6%      61293 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.52
     35501 =C2=B1 10%     +70.2%      60414 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.53
     32948 =C2=B1  7%     +86.5%      61433 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.54
     31099 =C2=B1  4%     +93.3%      60111 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.55
     36951 =C2=B1 12%     +73.4%      64077 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.56
     35501 =C2=B1  3%     +78.2%      63253 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.57
     36833 =C2=B1 10%     +73.3%      63842 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.58
     33412 =C2=B1  6%     +90.0%      63472 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.59
     39069 =C2=B1  7%     +89.3%      73953 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.6
     33658 =C2=B1  2%     +90.8%      64213 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.60
     36157 =C2=B1  3%     +78.8%      64633 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.61
     35459 =C2=B1  5%     +75.2%      62141 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.62
     35009 =C2=B1  4%     +78.8%      62594 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.63
     41630 =C2=B1  3%     +84.0%      76618 =C2=B1  9%  sched_debug.cpu.ttw=
u_count.7
     45239 =C2=B1  6%     +74.7%      79018 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.8
     46064 =C2=B1  3%     +70.0%      78305 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.9
     38178 =C2=B1  1%     +81.1%      69124 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.avg
     55089 =C2=B1  4%     +75.3%      96563 =C2=B1 14%  sched_debug.cpu.ttw=
u_count.max
     29205 =C2=B1  1%    +100.2%      58480 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.min
      5526 =C2=B1  5%     +37.1%       7577 =C2=B1 29%  sched_debug.cpu.ttw=
u_count.stddev
     13019 =C2=B1 14%    +199.9%      39042 =C2=B1 45%  sched_debug.cpu.ttw=
u_local.0
     10097 =C2=B1 18%    +202.1%      30506 =C2=B1 11%  sched_debug.cpu.ttw=
u_local.1
     11053 =C2=B1 12%    +153.6%      28035 =C2=B1 13%  sched_debug.cpu.ttw=
u_local.10
     10213 =C2=B1  8%    +176.3%      28215 =C2=B1 17%  sched_debug.cpu.ttw=
u_local.11
     10517 =C2=B1  7%    +160.1%      27356 =C2=B1  9%  sched_debug.cpu.ttw=
u_local.12
     10249 =C2=B1 16%    +161.2%      26775 =C2=B1  9%  sched_debug.cpu.ttw=
u_local.13
     10278 =C2=B1 20%    +164.1%      27144 =C2=B1 11%  sched_debug.cpu.ttw=
u_local.14
     12018 =C2=B1 35%    +126.9%      27269 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.15
      8172 =C2=B1 18%    +218.4%      26019 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.16
      8633 =C2=B1 26%    +194.2%      25396 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.17
      7777 =C2=B1 22%    +233.5%      25939 =C2=B1  9%  sched_debug.cpu.ttw=
u_local.18
      8422 =C2=B1 13%    +202.6%      25481 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.19
     10583 =C2=B1  7%    +158.8%      27390 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.2
      8290 =C2=B1 24%    +207.3%      25472 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.20
      8733 =C2=B1 14%    +191.6%      25467 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.21
      8699 =C2=B1 18%    +187.1%      24975 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.22
      7271 =C2=B1 15%    +254.6%      25780 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.23
     12692 =C2=B1 19%     +96.3%      24914 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.24
      9454 =C2=B1  9%    +175.0%      25997 =C2=B1 10%  sched_debug.cpu.ttw=
u_local.25
      9374 =C2=B1 15%    +174.9%      25771 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.26
      9854 =C2=B1 13%    +154.5%      25077 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.27
     10033 =C2=B1  7%    +147.5%      24832 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.28
     10153 =C2=B1 12%    +158.4%      26234 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.29
     10007 =C2=B1 17%    +163.7%      26389 =C2=B1  1%  sched_debug.cpu.ttw=
u_local.3
      9549 =C2=B1  6%    +162.2%      25039 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.30
      8073 =C2=B1 16%    +219.3%      25775 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.31
      7968 =C2=B1  2%    +214.7%      25078 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.32
      6942 =C2=B1 19%    +300.6%      27811 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.33
      7472 =C2=B1  2%    +256.7%      26651 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.34
     10452 =C2=B1 52%    +160.5%      27234 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.35
      6745 =C2=B1  8%    +287.0%      26101 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.36
      8755 =C2=B1 20%    +185.0%      24952 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.37
      5737 =C2=B1 13%    +336.0%      25018 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.38
      7220 =C2=B1 25%    +258.3%      25870 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.39
      8134 =C2=B1 10%    +220.1%      26039 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.4
      7373 =C2=B1 12%    +227.8%      24172 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.40
      8291 =C2=B1 33%    +223.3%      26802 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.41
      8283 =C2=B1 15%    +196.6%      24565 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.42
      6917 =C2=B1 25%    +267.6%      25431 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.43
      7618 =C2=B1 16%    +229.4%      25094 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.44
      7286 =C2=B1  6%    +246.4%      25239 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.45
      8440 =C2=B1 10%    +203.1%      25582 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.46
      7216 =C2=B1 12%    +241.2%      24622 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.47
      6545 =C2=B1  4%    +281.2%      24951 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.48
      5901 =C2=B1 21%    +326.9%      25192 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.49
      8492 =C2=B1 10%    +196.8%      25207 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.5
      6608 =C2=B1 11%    +269.6%      24427 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.50
      8550 =C2=B1 17%    +197.0%      25394 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.51
      6886 =C2=B1 11%    +252.9%      24301 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.52
      8471 =C2=B1 35%    +179.5%      23682 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.53
      6922 =C2=B1 21%    +255.7%      24622 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.54
      5244 =C2=B1 12%    +361.7%      24213 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.55
      9172 =C2=B1 19%    +169.6%      24726 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.56
      7876 =C2=B1 14%    +215.5%      24848 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.57
      8104 =C2=B1 17%    +201.3%      24415 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.58
      6957 =C2=B1 13%    +257.3%      24861 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.59
      8442 =C2=B1 16%    +215.3%      26617 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.6
      6724 =C2=B1  8%    +269.2%      24825 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.60
      8481 =C2=B1  8%    +197.2%      25203 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.61
      8232 =C2=B1 11%    +197.0%      24450 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.62
      6753 =C2=B1  9%    +268.4%      24879 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.63
      9387 =C2=B1  5%    +190.1%      27232 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.7
     12041 =C2=B1 29%    +134.1%      28187 =C2=B1  9%  sched_debug.cpu.ttw=
u_local.8
     12517 =C2=B1 14%    +125.8%      28258 =C2=B1 12%  sched_debug.cpu.ttw=
u_local.9
      8631 =C2=B1  2%    +201.1%      25985 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.avg
     18482 =C2=B1 14%    +121.0%      40845 =C2=B1 41%  sched_debug.cpu.ttw=
u_local.max
      4428 =C2=B1  6%    +424.7%      23232 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.min

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/nr_task/rootfs/tbox_group/test/testcase:
  gcc-4.9/x86_64-rhel/100%/debian-x86_64-2015-02-07.cgz/nhm-white2/fsdisk/u=
nixbench

commit: =

  cf5ebed4d0a77c055f5ef1a7978898ac0dcb2ae7
  23a197a19f9ad0438a6445b0b3a0f5c6d3381da5

cf5ebed4d0a77c05 23a197a19f9ad0438a6445b0b3 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     10575 =C2=B1  3%    +556.2%      69397 =C2=B1 16%  unixbench.time.invo=
luntary_context_switches
    554.00 =C2=B1  0%      -8.7%     506.00 =C2=B1  7%  unixbench.time.perc=
ent_of_cpu_this_job_got
    792.87 =C2=B1  0%      -3.0%     768.82 =C2=B1  0%  unixbench.time.syst=
em_time
    931777 =C2=B1  5%    +236.8%    3138481 =C2=B1 21%  unixbench.time.volu=
ntary_context_switches
     13703 =C2=B1  5%    +212.3%      42792 =C2=B1 27%  vmstat.system.cs
    514143 =C2=B1  6%    +208.9%    1588137 =C2=B1 22%  latency_stats.hits.=
generic_file_write_iter.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fa=
stpath
  11891007 =C2=B1  3%    +201.0%   35794571 =C2=B1 17%  latency_stats.sum.g=
eneric_file_write_iter.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fas=
tpath
      6400 =C2=B1  4%     -12.0%       5632 =C2=B1  7%  slabinfo.kmalloc-8.=
active_objs
      6400 =C2=B1  4%     -12.0%       5632 =C2=B1  7%  slabinfo.kmalloc-8.=
num_objs
     21048 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  softirqs.RCU
     21231 =C2=B1  1%    +115.0%      45644 =C2=B1 12%  softirqs.SCHED
     10575 =C2=B1  3%    +556.2%      69397 =C2=B1 16%  time.involuntary_co=
ntext_switches
      7.32 =C2=B1  0%     -10.6%       6.54 =C2=B1  0%  time.user_time
    931777 =C2=B1  5%    +236.8%    3138481 =C2=B1 21%  time.voluntary_cont=
ext_switches
     69.32 =C2=B1  0%      -8.4%      63.51 =C2=B1  7%  turbostat.%Busy
      2026 =C2=B1  0%      -8.4%       1855 =C2=B1  7%  turbostat.Avg_MHz
      2.00 =C2=B1 18%     +96.2%       3.92 =C2=B1 22%  turbostat.CPU%c1
  13748563 =C2=B1 17%    +164.2%   36327515 =C2=B1 21%  cpuidle.C1-NHM.time
    482572 =C2=B1  5%    +244.9%    1664365 =C2=B1 23%  cpuidle.C1-NHM.usage
      1164 =C2=B1  5%    +102.9%       2361 =C2=B1  4%  cpuidle.C1E-NHM.usa=
ge
      8806 =C2=B1  8%     +94.3%      17112 =C2=B1  9%  cpuidle.C3-NHM.usage
     77.75 =C2=B1 15%    +144.4%     190.00 =C2=B1 17%  cpuidle.POLL.usage
     59.25 =C2=B1  9%     +31.6%      78.00 =C2=B1 15%  sched_debug.cfs_rq:=
/.load_avg.1
     63.50 =C2=B1  5%     +44.4%      91.67 =C2=B1 24%  sched_debug.cfs_rq:=
/.load_avg.2
    878.62 =C2=B1 15%     +34.7%       1183 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
     40.25 =C2=B1 22%     -35.4%      26.00 =C2=B1 38%  sched_debug.cfs_rq:=
/.runnable_load_avg.3
     44.50 =C2=B1  4%     -11.2%      39.50 =C2=B1  1%  sched_debug.cfs_rq:=
/.runnable_load_avg.7
   -567.64 =C2=B1-135%    +176.1%      -1567 =C2=B1-61%  sched_debug.cfs_rq=
:/.spread0.3
   -391.31 =C2=B1-430%    +498.6%      -2342 =C2=B1-44%  sched_debug.cfs_rq=
:/.spread0.5
   -491.04 =C2=B1-253%    +416.3%      -2535 =C2=B1-33%  sched_debug.cfs_rq=
:/.spread0.7
   -616.07 =C2=B1-162%    +194.7%      -1815 =C2=B1-60%  sched_debug.cfs_rq=
:/.spread0.avg
     -1517 =C2=B1-74%    +113.5%      -3239 =C2=B1-34%  sched_debug.cfs_rq:=
/.spread0.min
    880.09 =C2=B1 15%     +34.5%       1183 =C2=B1  4%  sched_debug.cfs_rq:=
/.spread0.stddev
     59.50 =C2=B1  9%     +31.1%      78.00 =C2=B1 15%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.1
     63.50 =C2=B1  5%     +44.9%      92.00 =C2=B1 24%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.2
    494.75 =C2=B1  5%     -32.4%     334.67 =C2=B1 41%  sched_debug.cfs_rq:=
/.util_avg.0
    513.25 =C2=B1  4%     -24.3%     388.33 =C2=B1 27%  sched_debug.cfs_rq:=
/.util_avg.3
    376.75 =C2=B1  1%     -35.8%     242.00 =C2=B1 62%  sched_debug.cfs_rq:=
/.util_avg.6
    537.92 =C2=B1  3%     -21.8%     420.78 =C2=B1 28%  sched_debug.cfs_rq:=
/.util_avg.max
    387133 =C2=B1 10%     +47.5%     571143 =C2=B1 22%  sched_debug.cpu.avg=
_idle.0
     58.00 =C2=B1 26%     -63.8%      21.00 =C2=B1 71%  sched_debug.cpu.cpu=
_load[0].0
     40.50 =C2=B1  3%      -2.5%      39.50 =C2=B1  3%  sched_debug.cpu.cpu=
_load[0].5
     44.25 =C2=B1  5%     -11.9%      39.00 =C2=B1  0%  sched_debug.cpu.cpu=
_load[0].7
     82.92 =C2=B1 20%     -40.6%      49.22 =C2=B1 39%  sched_debug.cpu.cpu=
_load[0].max
     50.75 =C2=B1 26%     -54.7%      23.00 =C2=B1 69%  sched_debug.cpu.cpu=
_load[1].0
     43.00 =C2=B1  5%     -22.1%      33.50 =C2=B1 16%  sched_debug.cpu.cpu=
_load[1].7
     69.00 =C2=B1 15%     -40.1%      41.33 =C2=B1 43%  sched_debug.cpu.cpu=
_load[1].max
     48.50 =C2=B1 13%     -50.5%      24.00 =C2=B1 66%  sched_debug.cpu.cpu=
_load[2].0
     42.25 =C2=B1  7%     -18.3%      34.50 =C2=B1 15%  sched_debug.cpu.cpu=
_load[2].7
     62.42 =C2=B1 10%     -33.1%      41.78 =C2=B1 41%  sched_debug.cpu.cpu=
_load[2].max
     49.50 =C2=B1  9%     -48.8%      25.33 =C2=B1 63%  sched_debug.cpu.cpu=
_load[3].0
     39.50 =C2=B1  1%      -6.3%      37.00 =C2=B1  2%  sched_debug.cpu.cpu=
_load[3].6
     41.75 =C2=B1  5%     -16.2%      35.00 =C2=B1  8%  sched_debug.cpu.cpu=
_load[3].7
     61.08 =C2=B1  9%     -23.1%      47.00 =C2=B1 32%  sched_debug.cpu.cpu=
_load[3].max
     53.25 =C2=B1 15%     -48.0%      27.67 =C2=B1 59%  sched_debug.cpu.cpu=
_load[4].0
     42.00 =C2=B1  2%     -14.3%      36.00 =C2=B1  2%  sched_debug.cpu.cpu=
_load[4].7
     43.47 =C2=B1  1%     -31.9%      29.61 =C2=B1 57%  sched_debug.cpu.cpu=
_load[4].avg
    895.00 =C2=B1 34%     -43.1%     509.00 =C2=B1  0%  sched_debug.cpu.cur=
r->pid.2
    224.07 =C2=B1  4%     +29.3%     289.81 =C2=B1 15%  sched_debug.cpu.loa=
d.stddev
      1502 =C2=B1 12%     +25.0%       1879 =C2=B1  9%  sched_debug.cpu.nr_=
load_updates.stddev
    103039 =C2=B1  3%    +224.5%     334353 =C2=B1 19%  sched_debug.cpu.nr_=
switches.0
    104752 =C2=B1  7%    +205.1%     319571 =C2=B1 21%  sched_debug.cpu.nr_=
switches.1
    102205 =C2=B1  6%    +250.9%     358642 =C2=B1 17%  sched_debug.cpu.nr_=
switches.2
     97311 =C2=B1  5%    +261.0%     351291 =C2=B1 24%  sched_debug.cpu.nr_=
switches.3
     89033 =C2=B1  9%    +236.9%     299989 =C2=B1 16%  sched_debug.cpu.nr_=
switches.4
     69533 =C2=B1 13%    +307.9%     283658 =C2=B1 14%  sched_debug.cpu.nr_=
switches.5
     63860 =C2=B1  5%    +359.4%     293350 =C2=B1 10%  sched_debug.cpu.nr_=
switches.6
     67201 =C2=B1 10%    +372.2%     317333 =C2=B1 27%  sched_debug.cpu.nr_=
switches.7
     87117 =C2=B1  6%    +267.1%     319774 =C2=B1 18%  sched_debug.cpu.nr_=
switches.avg
    109079 =C2=B1  5%    +248.8%     380481 =C2=B1 19%  sched_debug.cpu.nr_=
switches.max
     62376 =C2=B1  6%    +313.9%     258170 =C2=B1 17%  sched_debug.cpu.nr_=
switches.min
     17452 =C2=B1  6%    +123.6%      39029 =C2=B1 25%  sched_debug.cpu.nr_=
switches.stddev
    -61.00 =C2=B1-26%     +92.9%    -117.67 =C2=B1-46%  sched_debug.cpu.nr_=
uninterruptible.1
     93.50 =C2=B1 16%     +48.0%     138.33 =C2=B1  5%  sched_debug.cpu.nr_=
uninterruptible.4
   -131.33 =C2=B1-11%     +25.2%    -164.44 =C2=B1-11%  sched_debug.cpu.nr_=
uninterruptible.min
    134137 =C2=B1  2%    +171.7%     364493 =C2=B1 18%  sched_debug.cpu.sch=
ed_count.0
    104795 =C2=B1  7%    +205.0%     319601 =C2=B1 21%  sched_debug.cpu.sch=
ed_count.1
    102253 =C2=B1  6%    +250.8%     358676 =C2=B1 17%  sched_debug.cpu.sch=
ed_count.2
     97351 =C2=B1  5%    +260.9%     351323 =C2=B1 24%  sched_debug.cpu.sch=
ed_count.3
     89080 =C2=B1  9%    +236.8%     300016 =C2=B1 16%  sched_debug.cpu.sch=
ed_count.4
     69580 =C2=B1 13%    +307.7%     283689 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.5
     63911 =C2=B1  5%    +359.0%     293384 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.6
     67250 =C2=B1 10%    +371.9%     317369 =C2=B1 27%  sched_debug.cpu.sch=
ed_count.7
     91045 =C2=B1  5%    +255.4%     323569 =C2=B1 18%  sched_debug.cpu.sch=
ed_count.avg
    134137 =C2=B1  2%    +196.0%     397018 =C2=B1 18%  sched_debug.cpu.sch=
ed_count.max
     62423 =C2=B1  6%    +313.6%     258201 =C2=B1 17%  sched_debug.cpu.sch=
ed_count.min
     24010 =C2=B1  3%     +81.4%      43547 =C2=B1 23%  sched_debug.cpu.sch=
ed_count.stddev
     48450 =C2=B1  2%    +233.7%     161699 =C2=B1 20%  sched_debug.cpu.sch=
ed_goidle.0
     49855 =C2=B1  6%    +213.5%     156295 =C2=B1 21%  sched_debug.cpu.sch=
ed_goidle.1
     48894 =C2=B1  7%    +255.8%     173984 =C2=B1 17%  sched_debug.cpu.sch=
ed_goidle.2
     46973 =C2=B1  4%    +265.4%     171624 =C2=B1 25%  sched_debug.cpu.sch=
ed_goidle.3
     43030 =C2=B1  9%    +237.3%     145135 =C2=B1 16%  sched_debug.cpu.sch=
ed_goidle.4
     32966 =C2=B1 14%    +319.5%     138302 =C2=B1 14%  sched_debug.cpu.sch=
ed_goidle.5
     30926 =C2=B1  5%    +359.9%     142245 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.6
     31918 =C2=B1  8%    +383.6%     154373 =C2=B1 27%  sched_debug.cpu.sch=
ed_goidle.7
     41627 =C2=B1  6%    +273.5%     155457 =C2=B1 18%  sched_debug.cpu.sch=
ed_goidle.avg
     51838 =C2=B1  6%    +257.4%     185252 =C2=B1 19%  sched_debug.cpu.sch=
ed_goidle.max
     30029 =C2=B1  5%    +319.7%     126024 =C2=B1 17%  sched_debug.cpu.sch=
ed_goidle.min
      8271 =C2=B1  4%    +128.7%      18916 =C2=B1 26%  sched_debug.cpu.sch=
ed_goidle.stddev
     48895 =C2=B1 10%    +236.2%     164390 =C2=B1 16%  sched_debug.cpu.ttw=
u_count.0
     45729 =C2=B1 10%    +244.0%     157311 =C2=B1 18%  sched_debug.cpu.ttw=
u_count.1
     44687 =C2=B1  5%    +274.2%     167237 =C2=B1 15%  sched_debug.cpu.ttw=
u_count.2
     43884 =C2=B1 11%    +246.9%     152235 =C2=B1 15%  sched_debug.cpu.ttw=
u_count.3
     42725 =C2=B1  6%    +281.2%     162849 =C2=B1 20%  sched_debug.cpu.ttw=
u_count.4
     41559 =C2=B1  2%    +277.8%     156998 =C2=B1 20%  sched_debug.cpu.ttw=
u_count.5
     40829 =C2=B1  5%    +292.3%     160169 =C2=B1 21%  sched_debug.cpu.ttw=
u_count.6
     41411 =C2=B1  9%    +286.2%     159940 =C2=B1 21%  sched_debug.cpu.ttw=
u_count.7
     43715 =C2=B1  6%    +266.3%     160141 =C2=B1 18%  sched_debug.cpu.ttw=
u_count.avg
     50828 =C2=B1  6%    +241.3%     173488 =C2=B1 16%  sched_debug.cpu.ttw=
u_count.max
     39617 =C2=B1  6%    +277.7%     149616 =C2=B1 17%  sched_debug.cpu.ttw=
u_count.min
      3801 =C2=B1 17%    +109.5%       7963 =C2=B1 22%  sched_debug.cpu.ttw=
u_count.stddev
      5382 =C2=B1 26%     +55.5%       8368 =C2=B1 15%  sched_debug.cpu.ttw=
u_local.0
      2637 =C2=B1 20%    +161.9%       6909 =C2=B1  2%  sched_debug.cpu.ttw=
u_local.2
      2177 =C2=B1 12%    +148.3%       5406 =C2=B1 33%  sched_debug.cpu.ttw=
u_local.4
      2163 =C2=B1 27%     +74.8%       3781 =C2=B1 17%  sched_debug.cpu.ttw=
u_local.5
      1172 =C2=B1 11%    +273.8%       4382 =C2=B1 15%  sched_debug.cpu.ttw=
u_local.6
      2921 =C2=B1  6%     +89.3%       5530 =C2=B1 12%  sched_debug.cpu.ttw=
u_local.avg
      7211 =C2=B1 10%     +27.9%       9219 =C2=B1 10%  sched_debug.cpu.ttw=
u_local.max
      1029 =C2=B1  8%    +215.6%       3250 =C2=B1 11%  sched_debug.cpu.ttw=
u_local.min
      2.76 =C2=B1 24%     -26.5%       2.03 =C2=B1  1%  sched_debug.rt_rq:/=
.rt_time.0
      1.20 =C2=B1 77%    +166.9%       3.20 =C2=B1 12%  sched_debug.rt_rq:/=
.rt_time.1
      1.71 =C2=B1 99%     -99.4%       0.01 =C2=B1  7%  sched_debug.rt_rq:/=
.rt_time.3
      1.41 =C2=B1 99%     -99.3%       0.01 =C2=B1 22%  sched_debug.rt_rq:/=
.rt_time.4
      0.01 =C2=B1  4%  +31290.2%       2.91 =C2=B1 15%  sched_debug.rt_rq:/=
.rt_time.5
      1.36 =C2=B1 99%     -99.4%       0.01 =C2=B1 21%  sched_debug.rt_rq:/=
.rt_time.7
      0.01 =C2=B1  3%     -17.8%       0.01 =C2=B1 20%  sched_debug.rt_rq:/=
.rt_time.min


lkp-hsw-ep3: Haswell-EP
Memory: 512G

lkp-sbx04: Sandy Bridge-EX
Memory: 64G

lkp-sb03: Sandy Bridge-EP
Memory: 64G

nhm-white2: Nehalem
Memory: 4G

lkp-ne04: Nehalem-EP
Memory: 12G

xps: Nehalem
Memory: 4G

lkp-nex04: Nehalem-EX
Memory: 256G


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

--===============3263546408799839376==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogdW5peGJlbmNoCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9u
aXRvcgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVt
YXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAK
ICBwcm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAg
aW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczog
CiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6
IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1
ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiAKZGVmYXVsdC13YXRjaGRvZ3M6
CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IDIzYTE5N2ExOWY5YWQwNDM4YTY0
NDViMGIzYTBmNWM2ZDMzODFkYTUKbW9kZWw6IE5laGFsZW0KbWVtb3J5OiA0Rwpucl9jcHU6IDgK
aGRkX3BhcnRpdGlvbnM6IApzd2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAKbmV0
Y29uc29sZV9wb3J0OiA2NjcxCmNhdGVnb3J5OiBiZW5jaG1hcmsKbnJfdGFzazogMTAwJQp1bml4
YmVuY2g6CiAgdGVzdDogZnNkaXNrCnF1ZXVlOiBiaXNlY3QKdGVzdGJveDogbmhtLXdoaXRlMgp0
Ym94X2dyb3VwOiBuaG0td2hpdGUyCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTog
MjAxNi0wMS0xNyAxMzo0MjozOS40MzUxODIzNTEgKzA4OjAwCmlkOiAxYzcyNDQ3YmYzNmY2ZDM2
NjFmZjU4YzViZTE5ODUyZjJkNTJhZjZiCnVzZXI6IGxrcApjb21waWxlcjogZ2NjLTQuOQpoZWFk
X2NvbW1pdDogNjFlNWU3Nzc4MjAyZTBjMjFlYmI5NWVlNWQ0MWNiNGNhYmU5N2UwZQpiYXNlX2Nv
bW1pdDogYWZkMmZmOWI3ZTFiMzY3MTcyZjE4YmE3ZjY5M2RmYjYyYmRjYjJkYwpicmFuY2g6IGxp
bnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE2MDExNzAzCnJvb3RmczogZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1bHQvdW5peGJlbmNoLzEwMCUtZnNkaXNr
L25obS13aGl0ZTIvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2Mt
NC45LzIzYTE5N2ExOWY5YWQwNDM4YTY0NDViMGIzYTBmNWM2ZDMzODFkYTUvMCIKam9iX2ZpbGU6
ICIvbGtwL3NjaGVkdWxlZC9uaG0td2hpdGUyL2Jpc2VjdF91bml4YmVuY2gtMTAwJS1mc2Rpc2st
ZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZfNjQtcmhlbC0yM2ExOTdhMTlmOWFkMDQz
OGE2NDQ1YjBiM2EwZjVjNmQzMzgxZGE1LTIwMTYwMTE3LTEyMzg1Mi0xdnc0bm9oLTAueWFtbCIK
bWF4X3VwdGltZTogMTgzOS45Ngppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1
c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVkdWxlZC9uaG0td2hpdGUyL2Jpc2VjdF91bml4YmVuY2gt
MTAwJS1mc2Rpc2stZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZfNjQtcmhlbC0yM2Ex
OTdhMTlmOWFkMDQzOGE2NDQ1YjBiM2EwZjVjNmQzMzgxZGE1LTIwMTYwMTE3LTEyMzg1Mi0xdnc0
bm9oLTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1s
aW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjAxMTcwMwotIGNvbW1pdD0yM2ExOTdhMTlmOWFk
MDQzOGE2NDQ1YjBiM2EwZjVjNmQzMzgxZGE1Ci0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82
NC1yaGVsL2djYy00LjkvMjNhMTk3YTE5ZjlhZDA0MzhhNjQ0NWIwYjNhMGY1YzZkMzM4MWRhNS92
bWxpbnV6LTQuNC4wLTAwMjM1LWcyM2ExOTdhCi0gbWF4X3VwdGltZT0xODM5Ci0gUkVTVUxUX1JP
T1Q9L3Jlc3VsdC91bml4YmVuY2gvMTAwJS1mc2Rpc2svbmhtLXdoaXRlMi9kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvMjNhMTk3YTE5ZjlhZDA0MzhhNjQ0
NWIwYjNhMGY1YzZkMzM4MWRhNS8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJp
bnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVn
IHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAK
ICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFu
aWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAw
IGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3At
eDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00
LjkvMjNhMTk3YTE5ZjlhZDA0MzhhNjQ0NWIwYjNhMGY1YzZkMzM4MWRhNS9tb2R1bGVzLmNneiIK
Ym1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xr
cC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNv
bmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJv
c3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3Vu
aXhiZW5jaC5jZ3oiCmxpbnV4X2hlYWRlcnNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhl
bC9nY2MtNC45LzIzYTE5N2ExOWY5YWQwNDM4YTY0NDViMGIzYTBmNWM2ZDMzODFkYTUvbGludXgt
aGVhZGVycy5jZ3oiCnJlcGVhdF90bzogMgprZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVs
L2djYy00LjkvMjNhMTk3YTE5ZjlhZDA0MzhhNjQ0NWIwYjNhMGY1YzZkMzM4MWRhNS92bWxpbnV6
LTQuNC4wLTAwMjM1LWcyM2ExOTdhIgpkZXF1ZXVlX3RpbWU6IDIwMTYtMDEtMTcgMTM6NTI6Mjku
NjA5NzA3NjA3ICswODowMApqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDUuNDIgMi4yMyAw
Ljg0IDEvMTczIDI4MjQKc3RhcnRfdGltZTogJzE0NTMwMDk5NzMnCmVuZF90aW1lOiAnMTQ1MzAx
MDExNycKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNjAxMTUtMjIyNzA1Igo=

--===============3263546408799839376==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMS0xNyAxMzo1Mjo1MyAuL1J1biBmc2Rpc2sgLWMgOAo=

--===============3263546408799839376==--

