Content-Type: multipart/mixed; boundary="===============6259560477275212903=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [sched] 41c8fcf4dd8: +9.7% aim7.jobs-per-min; -11.1% pmeter.Average_Active_Power; +23.4%, pmeter.performance_per_watt
Date: Fri, 15 May 2015 16:50:19 +0800
Message-ID: <1431679819.29991.58.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6259560477275212903==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://bee.sh.intel.com/git/ydu19/linux for-lkp
commit 41c8fcf4dd8076eef72126877f65e9b20829ed86 ("sched: Rewrite per entity=
 runnable load average tracking")


testcase/path_params/tbox_group: aim7/performance-8000-disk_src/brickland3

2b7928c943449ab2  41c8fcf4dd8076eef72126877f  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

    465548 =C2=B1  0%      +9.7%     510561 =C2=B1  1%  aim7.jobs-per-min
    106468 =C2=B1  5%     -13.2%      92455 =C2=B1  6%  aim7.time.involunta=
ry_context_switches
      6641 =C2=B1  1%     -32.4%       4490 =C2=B1  2%  aim7.time.system_ti=
me
   3955217 =C2=B1  3%     -54.5%    1798878 =C2=B1  3%  aim7.time.voluntary=
_context_switches
    103.70 =C2=B1  0%      -8.7%      94.68 =C2=B1  1%  aim7.time.elapsed_t=
ime
    103.70 =C2=B1  0%      -8.7%      94.68 =C2=B1  1%  aim7.time.elapsed_t=
ime.max
     10002 =C2=B1  2%     +16.1%      11616 =C2=B1  4%  uptime.idle
       857 =C2=B1  0%     -11.1%        761 =C2=B1  0%  pmeter.Average_Acti=
ve_Power
       543 =C2=B1  0%     +23.4%        670 =C2=B1  2%  pmeter.performance_=
per_watt
    480475 =C2=B1  2%      -9.6%     434441 =C2=B1  3%  meminfo.Active(anon)
    479614 =C2=B1  2%      -9.6%     433526 =C2=B1  3%  meminfo.AnonPages
    548360 =C2=B1 14%     -29.4%     386980 =C2=B1  5%  softirqs.RCU
   3855732 =C2=B1  4%     -19.9%    3089806 =C2=B1  1%  softirqs.TIMER
    391275 =C2=B1  4%     +57.7%     616861 =C2=B1 14%  numa-numastat.node1=
.local_node
    391286 =C2=B1  4%     +57.7%     616862 =C2=B1 14%  numa-numastat.node1=
.numa_hit
        70 =C2=B1 15%     -27.9%         51 =C2=B1  2%  vmstat.procs.r
     76212 =C2=B1  3%     -49.0%      38881 =C2=B1  3%  vmstat.system.cs
     86390 =C2=B1  0%     -24.2%      65515 =C2=B1  1%  vmstat.system.in
    106468 =C2=B1  5%     -13.2%      92455 =C2=B1  6%  time.involuntary_co=
ntext_switches
      6453 =C2=B1  0%     -25.8%       4789 =C2=B1  1%  time.percent_of_cpu=
_this_job_got
      6641 =C2=B1  1%     -32.4%       4490 =C2=B1  2%  time.system_time
     51.88 =C2=B1  2%     -12.0%      45.68 =C2=B1  3%  time.user_time
   3955217 =C2=B1  3%     -54.5%    1798878 =C2=B1  3%  time.voluntary_cont=
ext_switches
    120092 =C2=B1  2%      -9.6%     108606 =C2=B1  3%  proc-vmstat.nr_acti=
ve_anon
    119875 =C2=B1  2%      -9.6%     108378 =C2=B1  3%  proc-vmstat.nr_anon=
_pages
   1727743 =C2=B1  0%     +20.8%    2087161 =C2=B1  2%  proc-vmstat.numa_hit
   1727694 =C2=B1  0%     +20.8%    2087069 =C2=B1  2%  proc-vmstat.numa_lo=
cal
   2568259 =C2=B1  1%     +49.4%    3835875 =C2=B1  5%  proc-vmstat.pgalloc=
_normal
   2566129 =C2=B1  2%     +49.4%    3834242 =C2=B1  4%  proc-vmstat.pgfree
 2.565e+09 =C2=B1  0%     -48.1%   1.33e+09 =C2=B1  7%  cpuidle.C1-IVT-4S.t=
ime
   2434559 =C2=B1  2%     -65.9%     830314 =C2=B1  5%  cpuidle.C1-IVT-4S.u=
sage
  15723649 =C2=B1 15%     +77.1%   27845494 =C2=B1 11%  cpuidle.C3-IVT-4S.t=
ime
     10658 =C2=B1 27%     +50.9%      16084 =C2=B1 16%  cpuidle.C3-IVT-4S.u=
sage
    392333 =C2=B1  2%     +31.2%     514650 =C2=B1  5%  cpuidle.C6-IVT-4S.u=
sage
 3.163e+09 =C2=B1  1%     +72.4%  5.452e+09 =C2=B1  1%  cpuidle.C6-IVT-4S.t=
ime
     54.10 =C2=B1  0%     -25.8%      40.16 =C2=B1  1%  turbostat.%Busy
      1726 =C2=B1  0%     -25.8%       1282 =C2=B1  1%  turbostat.Avg_MHz
     33.88 =C2=B1  1%     -12.3%      29.73 =C2=B1  3%  turbostat.CPU%c1
      0.04 =C2=B1 14%    +242.9%       0.12 =C2=B1 15%  turbostat.CPU%c3
     11.98 =C2=B1  1%    +150.3%      29.99 =C2=B1  4%  turbostat.CPU%c6
       355 =C2=B1  0%     -17.2%        294 =C2=B1  1%  turbostat.CorWatt
      3.53 =C2=B1 14%    +173.4%       9.65 =C2=B1  6%  turbostat.Pkg%pc2
       420 =C2=B1  0%     -14.7%        358 =C2=B1  1%  turbostat.PkgWatt
       864 =C2=B1  3%      +6.7%        922 =C2=B1  5%  slabinfo.blkdev_ioc=
.num_objs
       864 =C2=B1  3%      +6.7%        922 =C2=B1  5%  slabinfo.blkdev_ioc=
.active_objs
      1535 =C2=B1  3%     +14.2%       1753 =C2=B1  1%  slabinfo.kmalloc-25=
6.num_slabs
     98295 =C2=B1  3%     +14.2%     112280 =C2=B1  1%  slabinfo.kmalloc-25=
6.num_objs
     84988 =C2=B1  3%     +16.6%      99105 =C2=B1  0%  slabinfo.kmalloc-25=
6.active_objs
      1535 =C2=B1  3%     +14.2%       1753 =C2=B1  1%  slabinfo.kmalloc-25=
6.active_slabs
     84395 =C2=B1  3%     +17.7%      99350 =C2=B1  2%  slabinfo.shmem_inod=
e_cache.num_objs
     75971 =C2=B1  3%     +19.1%      90492 =C2=B1  1%  slabinfo.shmem_inod=
e_cache.active_objs
      1654 =C2=B1  3%     +17.7%       1947 =C2=B1  2%  slabinfo.shmem_inod=
e_cache.num_slabs
      1654 =C2=B1  3%     +17.7%       1947 =C2=B1  2%  slabinfo.shmem_inod=
e_cache.active_slabs
    337798 =C2=B1 10%     +17.0%     395293 =C2=B1  6%  numa-vmstat.node0.n=
uma_hit
    306075 =C2=B1 11%     +18.9%     363908 =C2=B1  7%  numa-vmstat.node0.n=
uma_local
     11460 =C2=B1 19%    +260.4%      41306 =C2=B1 16%  numa-vmstat.node1.n=
r_anon_pages
     52301 =C2=B1  0%     +59.2%      83279 =C2=B1  0%  numa-vmstat.node1.n=
uma_other
     11454 =C2=B1 19%    +260.4%      41285 =C2=B1 16%  numa-vmstat.node1.n=
r_active_anon
    371275 =C2=B1  1%     +21.6%     451505 =C2=B1 14%  numa-vmstat.node1.n=
uma_hit
     83321 =C2=B1  0%     -36.8%      52655 =C2=B1  0%  numa-vmstat.node2.n=
uma_other
     74610 =C2=B1  3%    +124.2%     167292 =C2=B1 48%  numa-meminfo.node1.=
Slab
     45811 =C2=B1 19%    +260.5%     165164 =C2=B1 16%  numa-meminfo.node1.=
Active(anon)
     45833 =C2=B1 19%    +260.5%     165247 =C2=B1 16%  numa-meminfo.node1.=
AnonPages
     70494 =C2=B1 13%    +170.8%     190922 =C2=B1 14%  numa-meminfo.node1.=
Active
    221546 =C2=B1  5%     -49.2%     112606 =C2=B1 48%  numa-meminfo.node3.=
Active
   1135977 =C2=B1 24%     -50.4%     563258 =C2=B1 10%  numa-meminfo.node3.=
MemUsed
    162127 =C2=B1  2%    +103.1%     329306 =C2=B1  5%  latency_stats.avg.d=
o_unlinkat.SyS_unlink.system_call_fastpath
       325 =C2=B1  7%     -42.6%        186 =C2=B1 33%  latency_stats.avg.s=
ync_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.system_call_fastpa=
th
    190424 =C2=B1  3%     +65.5%     315064 =C2=B1  1%  latency_stats.avg.d=
o_last.path_openat.do_filp_open.do_sys_open.SyS_creat.system_call_fastpath
      2796 =C2=B1 33%    +178.3%       7782 =C2=B1 30%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_do_close.[nfsv4]._=
_nfs4_close.[nfsv4].nfs4_close_sync.[nfsv4].nfs4_close_context.[nfsv4].__pu=
t_nfs_open_context.nfs_release.nfs_file_release.__fput.____fput.task_work_r=
un
      4882 =C2=B1 12%     +97.6%       9646 =C2=B1 30%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs4_file_open.[nfsv4].do_dentry_open.vfs_open.do_last.path_openat.=
do_filp_open
      2357 =C2=B1  5%     -33.4%       1570 =C2=B1  3%  latency_stats.avg.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
      1280 =C2=B1  0%      +7.5%       1376 =C2=B1  2%  latency_stats.avg.d=
o_wait.SyS_wait4.system_call_fastpath
        27 =C2=B1 22%    -100.0%          0 =C2=B1  0%  latency_stats.avg.s=
top_one_cpu.sched_exec.do_execveat_common.SyS_execve.return_from_execve
       424 =C2=B1  3%     +14.9%        487 =C2=B1  0%  latency_stats.avg.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
   1837855 =C2=B1  4%     -50.0%     918801 =C2=B1  7%  latency_stats.hits.=
do_last.path_openat.do_filp_open.do_sys_open.SyS_creat.system_call_fastpath
         7 =C2=B1  0%     +35.7%          9 =C2=B1  9%  latency_stats.hits.=
wait_woken.inotify_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
      7410 =C2=B1  1%     -11.1%       6589 =C2=B1  1%  latency_stats.hits.=
do_wait.SyS_wait4.system_call_fastpath
   1586543 =C2=B1  2%     -58.5%     658538 =C2=B1  9%  latency_stats.hits.=
do_unlinkat.SyS_unlink.system_call_fastpath
         5 =C2=B1 25%    -100.0%          0 =C2=B1  0%  latency_stats.hits.=
stop_one_cpu.sched_exec.do_execveat_common.SyS_execve.return_from_execve
       632 =C2=B1 14%     -58.3%        263 =C2=B1 49%  latency_stats.max.s=
ync_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.system_call_fastpa=
th
  10983451 =C2=B1  4%     +36.2%   14956749 =C2=B1  5%  latency_stats.max.d=
o_unlinkat.SyS_unlink.system_call_fastpath
  10982140 =C2=B1  4%     +36.1%   14951339 =C2=B1  5%  latency_stats.max.d=
o_last.path_openat.do_filp_open.do_sys_open.SyS_creat.system_call_fastpath
      2961 =C2=B1  8%     -30.1%       2069 =C2=B1  6%  latency_stats.max.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
        51 =C2=B1 13%    -100.0%          0 =C2=B1  0%  latency_stats.max.s=
top_one_cpu.sched_exec.do_execveat_common.SyS_execve.return_from_execve
       155 =C2=B1 23%    -100.0%          0 =C2=B1  0%  latency_stats.sum.s=
top_one_cpu.sched_exec.do_execveat_common.SyS_execve.return_from_execve
     43943 =C2=B1 12%     +78.8%      78552 =C2=B1 27%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs4_file_open.[nfsv4].do_dentry_open.vfs_open.do_last.path_openat.=
do_filp_open
       977 =C2=B1  7%     -42.6%        561 =C2=B1 33%  latency_stats.sum.s=
ync_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.system_call_fastpa=
th
     23578 =C2=B1  5%     -31.7%      16110 =C2=B1  6%  latency_stats.sum.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
 3.494e+11 =C2=B1  1%     -17.2%  2.894e+11 =C2=B1  7%  latency_stats.sum.d=
o_last.path_openat.do_filp_open.do_sys_open.SyS_creat.system_call_fastpath
 2.571e+11 =C2=B1  0%     -15.8%  2.165e+11 =C2=B1  8%  latency_stats.sum.d=
o_unlinkat.SyS_unlink.system_call_fastpath
   1810273 =C2=B1  3%      +6.3%    1924292 =C2=B1  2%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
     22083 =C2=B1  2%     -35.8%      14168 =C2=B1 39%  sched_debug.cfs_rq[=
0]:/.exec_clock
    996484 =C2=B1  9%     +59.1%    1584945 =C2=B1  5%  sched_debug.cfs_rq[=
100]:/.min_vruntime
     12205 =C2=B1  6%     -11.9%      10757 =C2=B1  5%  sched_debug.cfs_rq[=
100]:/.exec_clock
     12353 =C2=B1  4%     -14.6%      10549 =C2=B1  6%  sched_debug.cfs_rq[=
101]:/.exec_clock
   1018018 =C2=B1  7%     +52.4%    1551676 =C2=B1  8%  sched_debug.cfs_rq[=
101]:/.min_vruntime
   1007235 =C2=B1  7%     +52.4%    1535151 =C2=B1  3%  sched_debug.cfs_rq[=
102]:/.min_vruntime
     12263 =C2=B1  1%     -15.5%      10364 =C2=B1  3%  sched_debug.cfs_rq[=
102]:/.exec_clock
    987963 =C2=B1  5%     +48.4%    1466128 =C2=B1  4%  sched_debug.cfs_rq[=
103]:/.min_vruntime
     12024 =C2=B1  5%     -16.9%       9993 =C2=B1  3%  sched_debug.cfs_rq[=
103]:/.exec_clock
   1059227 =C2=B1  5%     +43.0%    1514521 =C2=B1  6%  sched_debug.cfs_rq[=
104]:/.min_vruntime
     12739 =C2=B1  9%     -22.8%       9837 =C2=B1  7%  sched_debug.cfs_rq[=
104]:/.exec_clock
     12620 =C2=B1  3%     -26.4%       9282 =C2=B1 29%  sched_debug.cfs_rq[=
105]:/.exec_clock
     12373 =C2=B1  2%     -26.1%       9144 =C2=B1 31%  sched_debug.cfs_rq[=
106]:/.exec_clock
     12886 =C2=B1  4%     -31.3%       8859 =C2=B1 31%  sched_debug.cfs_rq[=
107]:/.exec_clock
     13384 =C2=B1  0%     -33.4%       8908 =C2=B1 31%  sched_debug.cfs_rq[=
108]:/.exec_clock
     13229 =C2=B1  1%     -30.7%       9161 =C2=B1 31%  sched_debug.cfs_rq[=
109]:/.exec_clock
         3 =C2=B1 43%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.runnable_load_avg
       275 =C2=B1 42%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.utilization_load_avg
     13122 =C2=B1  4%     -30.2%       9162 =C2=B1 33%  sched_debug.cfs_rq[=
110]:/.exec_clock
     12972 =C2=B1  1%     -29.2%       9188 =C2=B1 28%  sched_debug.cfs_rq[=
111]:/.exec_clock
     13041 =C2=B1  5%     -33.0%       8738 =C2=B1 34%  sched_debug.cfs_rq[=
112]:/.exec_clock
     12981 =C2=B1  7%     -28.5%       9281 =C2=B1 32%  sched_debug.cfs_rq[=
113]:/.exec_clock
     12443 =C2=B1  3%     -29.4%       8780 =C2=B1 27%  sched_debug.cfs_rq[=
114]:/.exec_clock
     12533 =C2=B1  3%     -25.9%       9281 =C2=B1 27%  sched_debug.cfs_rq[=
115]:/.exec_clock
     12494 =C2=B1  2%     -28.7%       8904 =C2=B1 34%  sched_debug.cfs_rq[=
116]:/.exec_clock
     12671 =C2=B1  2%     -29.1%       8986 =C2=B1 35%  sched_debug.cfs_rq[=
117]:/.exec_clock
     13039 =C2=B1  1%     -28.6%       9310 =C2=B1 29%  sched_debug.cfs_rq[=
118]:/.exec_clock
     12835 =C2=B1  5%     -27.4%       9319 =C2=B1 29%  sched_debug.cfs_rq[=
119]:/.exec_clock
         3 =C2=B1 25%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.runnable_load_avg
     19294 =C2=B1  1%     -42.0%      11184 =C2=B1 47%  sched_debug.cfs_rq[=
12]:/.exec_clock
         6 =C2=B1 45%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.runnable_load_avg
       355 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.utilization_load_avg
       371 =C2=B1 42%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.utilization_load_avg
     18813 =C2=B1  1%     -39.9%      11298 =C2=B1 49%  sched_debug.cfs_rq[=
13]:/.exec_clock
     19176 =C2=B1  3%     -22.6%      14851 =C2=B1 36%  sched_debug.cfs_rq[=
16]:/.exec_clock
     19342 =C2=B1  2%     -41.6%      11290 =C2=B1 49%  sched_debug.cfs_rq[=
1]:/.exec_clock
       284 =C2=B1 33%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.utilization_load_avg
         4 =C2=B1 17%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.runnable_load_avg
         7 =C2=B1 47%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.tg_load_contrib
         5 =C2=B1 15%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.runnable_load_avg
       372 =C2=B1 31%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.utilization_load_avg
         4 =C2=B1 24%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.runnable_load_avg
       390 =C2=B1 19%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.utilization_load_avg
   1524948 =C2=B1  5%     +49.3%    2276477 =C2=B1  2%  sched_debug.cfs_rq[=
30]:/.min_vruntime
   1544682 =C2=B1  4%     +48.0%    2286048 =C2=B1  2%  sched_debug.cfs_rq[=
31]:/.min_vruntime
   1522035 =C2=B1  5%     +47.4%    2243908 =C2=B1  2%  sched_debug.cfs_rq[=
32]:/.min_vruntime
   1517983 =C2=B1  7%     +49.5%    2269633 =C2=B1  2%  sched_debug.cfs_rq[=
33]:/.min_vruntime
       305 =C2=B1 40%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.utilization_load_avg
         4 =C2=B1 34%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.runnable_load_avg
   1553793 =C2=B1  5%     +43.1%    2223494 =C2=B1  1%  sched_debug.cfs_rq[=
34]:/.min_vruntime
         4 =C2=B1 33%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.tg_load_contrib
   1526950 =C2=B1  4%     +47.1%    2246666 =C2=B1  4%  sched_debug.cfs_rq[=
35]:/.min_vruntime
   1550935 =C2=B1  4%     +45.1%    2249678 =C2=B1  1%  sched_debug.cfs_rq[=
36]:/.min_vruntime
   1538300 =C2=B1  5%     +46.2%    2249268 =C2=B1  2%  sched_debug.cfs_rq[=
37]:/.min_vruntime
   1566392 =C2=B1  5%     +44.7%    2267210 =C2=B1  2%  sched_debug.cfs_rq[=
38]:/.min_vruntime
         5 =C2=B1 27%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.runnable_load_avg
       392 =C2=B1 46%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.utilization_load_avg
   1562601 =C2=B1  4%     +44.0%    2250507 =C2=B1  2%  sched_debug.cfs_rq[=
39]:/.min_vruntime
   1536731 =C2=B1  4%     +48.0%    2274937 =C2=B1  2%  sched_debug.cfs_rq[=
40]:/.min_vruntime
   1532374 =C2=B1  6%     +46.4%    2243301 =C2=B1  3%  sched_debug.cfs_rq[=
41]:/.min_vruntime
         3 =C2=B1 31%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.runnable_load_avg
   1550310 =C2=B1  6%     +48.5%    2302027 =C2=B1  4%  sched_debug.cfs_rq[=
42]:/.min_vruntime
         6 =C2=B1  7%     -23.1%          5 =C2=B1 14%  sched_debug.cfs_rq[=
43]:/.load
         4 =C2=B1 34%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.runnable_load_avg
   1535529 =C2=B1  4%     +50.8%    2316273 =C2=B1  2%  sched_debug.cfs_rq[=
43]:/.min_vruntime
   1513395 =C2=B1  5%     +50.0%    2270294 =C2=B1  4%  sched_debug.cfs_rq[=
44]:/.min_vruntime
         5 =C2=B1  8%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.runnable_load_avg
     19778 =C2=B1  1%     -18.6%      16094 =C2=B1 22%  sched_debug.cfs_rq[=
45]:/.exec_clock
       337 =C2=B1 35%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.utilization_load_avg
         5 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.runnable_load_avg
         4 =C2=B1 34%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.runnable_load_avg
       294 =C2=B1 34%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.utilization_load_avg
         5 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.runnable_load_avg
   1535618 =C2=B1  5%     +32.1%    2028221 =C2=B1 13%  sched_debug.cfs_rq[=
51]:/.min_vruntime
         4 =C2=B1 30%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.runnable_load_avg
         8 =C2=B1 32%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.tg_load_contrib
       322 =C2=B1 44%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.utilization_load_avg
         7 =C2=B1 33%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.tg_load_contrib
         4 =C2=B1 46%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
64]:/.runnable_load_avg
       293 =C2=B1 49%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
64]:/.utilization_load_avg
         6 =C2=B1 11%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
64]:/.load
       416 =C2=B1 21%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.utilization_load_avg
         6 =C2=B1 31%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
         3 =C2=B1 33%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
73]:/.runnable_load_avg
         5 =C2=B1 46%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
75]:/.runnable_load_avg
       341 =C2=B1 46%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
75]:/.utilization_load_avg
         5 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
75]:/.load
     12381 =C2=B1  4%     -35.5%       7982 =C2=B1 47%  sched_debug.cfs_rq[=
78]:/.exec_clock
     11658 =C2=B1  4%     -28.7%       8313 =C2=B1 48%  sched_debug.cfs_rq[=
79]:/.exec_clock
       456 =C2=B1 39%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
79]:/.blocked_load_avg
       468 =C2=B1 41%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
79]:/.tg_load_contrib
     12338 =C2=B1  5%     -36.2%       7865 =C2=B1 45%  sched_debug.cfs_rq[=
81]:/.exec_clock
       320 =C2=B1 37%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
85]:/.utilization_load_avg
         4 =C2=B1 17%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
85]:/.runnable_load_avg
     12356 =C2=B1  9%     -32.5%       8344 =C2=B1 44%  sched_debug.cfs_rq[=
85]:/.exec_clock
     12063 =C2=B1  5%     -30.9%       8334 =C2=B1 48%  sched_debug.cfs_rq[=
87]:/.exec_clock
         5 =C2=B1 24%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
88]:/.runnable_load_avg
     12141 =C2=B1  2%     -31.1%       8368 =C2=B1 48%  sched_debug.cfs_rq[=
88]:/.exec_clock
         6 =C2=B1 11%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
88]:/.load
       420 =C2=B1 24%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
88]:/.utilization_load_avg
     12345 =C2=B1  3%     -32.8%       8298 =C2=B1 48%  sched_debug.cfs_rq[=
89]:/.exec_clock
     12537 =C2=B1  6%     -17.4%      10357 =C2=B1  6%  sched_debug.cfs_rq[=
90]:/.exec_clock
   1031509 =C2=B1  2%     +49.3%    1540472 =C2=B1  7%  sched_debug.cfs_rq[=
90]:/.min_vruntime
    947821 =C2=B1 11%     +61.8%    1533159 =C2=B1  8%  sched_debug.cfs_rq[=
91]:/.min_vruntime
         4 =C2=B1 34%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
92]:/.tg_load_contrib
   1013675 =C2=B1  9%     +52.9%    1550126 =C2=B1  5%  sched_debug.cfs_rq[=
92]:/.min_vruntime
   1009694 =C2=B1  5%     +52.2%    1536370 =C2=B1 10%  sched_debug.cfs_rq[=
93]:/.min_vruntime
     12384 =C2=B1  2%     -18.5%      10092 =C2=B1 13%  sched_debug.cfs_rq[=
93]:/.exec_clock
     11845 =C2=B1  5%     -11.4%      10496 =C2=B1  7%  sched_debug.cfs_rq[=
94]:/.exec_clock
    978443 =C2=B1 11%     +57.6%    1542437 =C2=B1  9%  sched_debug.cfs_rq[=
94]:/.min_vruntime
   1022735 =C2=B1 10%     +50.3%    1536994 =C2=B1  5%  sched_debug.cfs_rq[=
95]:/.min_vruntime
     12472 =C2=B1  5%     -16.4%      10430 =C2=B1  4%  sched_debug.cfs_rq[=
95]:/.exec_clock
    980108 =C2=B1  5%     +55.6%    1525487 =C2=B1  5%  sched_debug.cfs_rq[=
96]:/.min_vruntime
     11971 =C2=B1  3%     -11.4%      10609 =C2=B1  4%  sched_debug.cfs_rq[=
96]:/.exec_clock
     12155 =C2=B1  3%     -17.2%      10064 =C2=B1  1%  sched_debug.cfs_rq[=
97]:/.exec_clock
   1003502 =C2=B1  7%     +49.1%    1496010 =C2=B1  2%  sched_debug.cfs_rq[=
97]:/.min_vruntime
    991429 =C2=B1 10%     +56.7%    1553967 =C2=B1  7%  sched_debug.cfs_rq[=
98]:/.min_vruntime
     12062 =C2=B1  6%     -13.2%      10464 =C2=B1  5%  sched_debug.cfs_rq[=
98]:/.exec_clock
    963186 =C2=B1 11%     +62.3%    1563626 =C2=B1  6%  sched_debug.cfs_rq[=
99]:/.min_vruntime
       370 =C2=B1 28%    -100.0%          0 =C2=B1  0%  sched_debug.cfs_rq[=
99]:/.utilization_load_avg
     10630 =C2=B1 12%     -60.8%       4162 =C2=B1 36%  sched_debug.cpu#0.s=
ched_goidle
     18599 =C2=B1  4%     -44.7%      10284 =C2=B1 18%  sched_debug.cpu#0.t=
twu_count
     26373 =C2=B1 11%     -51.2%      12870 =C2=B1 24%  sched_debug.cpu#0.n=
r_switches
     41634 =C2=B1  3%     -34.4%      27317 =C2=B1 10%  sched_debug.cpu#0.s=
ched_count
     24633 =C2=B1  7%     -54.1%      11317 =C2=B1 32%  sched_debug.cpu#1.n=
r_switches
     13206 =C2=B1  4%     -48.2%       6836 =C2=B1 29%  sched_debug.cpu#1.t=
twu_count
     24884 =C2=B1  7%     -52.2%      11890 =C2=B1 28%  sched_debug.cpu#1.s=
ched_count
      1127 =C2=B1 13%     +45.5%       1639 =C2=B1 28%  sched_debug.cpu#1.t=
twu_local
     11791 =C2=B1  7%     -54.2%       5405 =C2=B1 33%  sched_debug.cpu#1.s=
ched_goidle
      8342 =C2=B1  9%     -57.2%       3566 =C2=B1 39%  sched_debug.cpu#10.=
sched_goidle
     11150 =C2=B1  1%     -57.8%       4709 =C2=B1 39%  sched_debug.cpu#10.=
ttwu_count
       208 =C2=B1 10%    +117.4%        453 =C2=B1 31%  sched_debug.cpu#10.=
ttwu_local
     17582 =C2=B1  9%     -56.8%       7593 =C2=B1 39%  sched_debug.cpu#10.=
nr_switches
      7173 =C2=B1 11%     -44.0%       4020 =C2=B1  5%  sched_debug.cpu#100=
.ttwu_count
     17604 =C2=B1 16%     -42.1%      10193 =C2=B1  5%  sched_debug.cpu#100=
.nr_switches
     17944 =C2=B1 15%     -36.5%      11400 =C2=B1 17%  sched_debug.cpu#100=
.sched_count
      8212 =C2=B1 17%     -44.3%       4575 =C2=B1  6%  sched_debug.cpu#100=
.sched_goidle
      7960 =C2=B1 19%     -42.1%       4605 =C2=B1  7%  sched_debug.cpu#101=
.sched_goidle
     17068 =C2=B1 19%     -39.7%      10289 =C2=B1  7%  sched_debug.cpu#101=
.nr_switches
     17250 =C2=B1 18%     -39.0%      10529 =C2=B1  7%  sched_debug.cpu#101=
.sched_count
      7315 =C2=B1  7%     -46.7%       3899 =C2=B1  6%  sched_debug.cpu#101=
.ttwu_count
      8294 =C2=B1 15%     -48.2%       4293 =C2=B1  7%  sched_debug.cpu#102=
.sched_goidle
     17820 =C2=B1 16%     -46.2%       9583 =C2=B1  6%  sched_debug.cpu#102=
.nr_switches
      7329 =C2=B1  5%     -46.7%       3908 =C2=B1  4%  sched_debug.cpu#102=
.ttwu_count
     17985 =C2=B1 17%     -44.1%      10057 =C2=B1 12%  sched_debug.cpu#102=
.sched_count
     18149 =C2=B1 12%     -42.8%      10384 =C2=B1  2%  sched_debug.cpu#103=
.nr_switches
     19218 =C2=B1 15%     -42.6%      11031 =C2=B1  5%  sched_debug.cpu#103=
.sched_count
      7305 =C2=B1  9%     -47.6%       3828 =C2=B1  6%  sched_debug.cpu#103=
.ttwu_count
      8448 =C2=B1 12%     -44.7%       4670 =C2=B1  2%  sched_debug.cpu#103=
.sched_goidle
      7955 =C2=B1 12%     -41.4%       4661 =C2=B1  8%  sched_debug.cpu#104=
.sched_goidle
     18472 =C2=B1 12%     -41.6%      10787 =C2=B1  9%  sched_debug.cpu#104=
.sched_count
    529866 =C2=B1  6%     +65.2%     875514 =C2=B1 19%  sched_debug.cpu#104=
.avg_idle
     17101 =C2=B1 12%     -39.4%      10360 =C2=B1  8%  sched_debug.cpu#104=
.nr_switches
      7644 =C2=B1 12%     -51.1%       3738 =C2=B1  7%  sched_debug.cpu#104=
.ttwu_count
     18099 =C2=B1  4%     -47.6%       9486 =C2=B1 24%  sched_debug.cpu#105=
.nr_switches
     18355 =C2=B1  3%     -48.2%       9515 =C2=B1 24%  sched_debug.cpu#105=
.sched_count
      7337 =C2=B1  5%     -52.1%       3517 =C2=B1 26%  sched_debug.cpu#105=
.ttwu_count
      8381 =C2=B1  5%     -49.0%       4273 =C2=B1 24%  sched_debug.cpu#105=
.sched_goidle
      8758 =C2=B1  6%     -51.9%       4210 =C2=B1 30%  sched_debug.cpu#106=
.sched_goidle
      7366 =C2=B1  2%     -55.2%       3298 =C2=B1 26%  sched_debug.cpu#106=
.ttwu_count
     19553 =C2=B1  8%     -52.1%       9372 =C2=B1 29%  sched_debug.cpu#106=
.sched_count
     18889 =C2=B1  6%     -50.5%       9344 =C2=B1 29%  sched_debug.cpu#106=
.nr_switches
      8411 =C2=B1  6%     -45.7%       4564 =C2=B1 25%  sched_debug.cpu#107=
.sched_goidle
     18109 =C2=B1  6%     -44.5%      10053 =C2=B1 24%  sched_debug.cpu#107=
.nr_switches
     18170 =C2=B1  6%     -44.5%      10083 =C2=B1 24%  sched_debug.cpu#107=
.sched_count
      7714 =C2=B1  1%     -55.5%       3430 =C2=B1 22%  sched_debug.cpu#107=
.ttwu_count
     19575 =C2=B1  6%     -17.8%      16091 =C2=B1 16%  sched_debug.cpu#107=
.nr_load_updates
     19894 =C2=B1  7%     -19.6%      15994 =C2=B1 16%  sched_debug.cpu#108=
.nr_load_updates
     19571 =C2=B1 11%     -48.9%      10006 =C2=B1 27%  sched_debug.cpu#108=
.sched_count
     19084 =C2=B1  8%     -47.7%       9978 =C2=B1 27%  sched_debug.cpu#108=
.nr_switches
      8857 =C2=B1  8%     -49.2%       4497 =C2=B1 28%  sched_debug.cpu#108=
.sched_goidle
      7666 =C2=B1  1%     -56.6%       3324 =C2=B1 23%  sched_debug.cpu#108=
.ttwu_count
      8692 =C2=B1  9%     -51.5%       4211 =C2=B1 25%  sched_debug.cpu#109=
.sched_goidle
     18761 =C2=B1  9%     -50.1%       9366 =C2=B1 25%  sched_debug.cpu#109=
.nr_switches
      7595 =C2=B1  4%     -55.9%       3351 =C2=B1 27%  sched_debug.cpu#109=
.ttwu_count
     18891 =C2=B1  9%     -47.0%      10021 =C2=B1 29%  sched_debug.cpu#109=
.sched_count
     10525 =C2=B1 26%     -63.6%       3833 =C2=B1 40%  sched_debug.cpu#11.=
sched_goidle
     11692 =C2=B1  3%     -57.3%       4992 =C2=B1 35%  sched_debug.cpu#11.=
ttwu_count
     22288 =C2=B1 27%     -63.4%       8147 =C2=B1 40%  sched_debug.cpu#11.=
nr_switches
     17575 =C2=B1 10%     -42.1%      10168 =C2=B1 23%  sched_debug.cpu#110=
.sched_count
      8163 =C2=B1 10%     -44.7%       4511 =C2=B1 23%  sched_debug.cpu#110=
.sched_goidle
      7753 =C2=B1  4%     -54.9%       3494 =C2=B1 21%  sched_debug.cpu#110=
.ttwu_count
     17410 =C2=B1 10%     -42.4%      10033 =C2=B1 23%  sched_debug.cpu#110=
.nr_switches
      8428 =C2=B1 12%     -46.3%       4529 =C2=B1 30%  sched_debug.cpu#111=
.sched_goidle
     18019 =C2=B1 12%     -44.5%      10008 =C2=B1 29%  sched_debug.cpu#111=
.nr_switches
     18083 =C2=B1 11%     -43.9%      10142 =C2=B1 29%  sched_debug.cpu#111=
.sched_count
      7586 =C2=B1  2%     -55.0%       3414 =C2=B1 23%  sched_debug.cpu#111=
.ttwu_count
     18517 =C2=B1  7%     -44.5%      10277 =C2=B1 28%  sched_debug.cpu#112=
.nr_switches
     19616 =C2=B1  7%     -19.8%      15740 =C2=B1 18%  sched_debug.cpu#112=
.nr_load_updates
      8543 =C2=B1  7%     -46.0%       4617 =C2=B1 29%  sched_debug.cpu#112=
.sched_goidle
     18710 =C2=B1  8%     -43.9%      10496 =C2=B1 28%  sched_debug.cpu#112=
.sched_count
      7755 =C2=B1  2%     -57.2%       3316 =C2=B1 27%  sched_debug.cpu#112=
.ttwu_count
     18488 =C2=B1  4%     -46.7%       9857 =C2=B1 22%  sched_debug.cpu#113=
.nr_switches
      8629 =C2=B1  5%     -48.2%       4471 =C2=B1 23%  sched_debug.cpu#113=
.sched_goidle
     18645 =C2=B1  3%     -46.5%       9982 =C2=B1 22%  sched_debug.cpu#113=
.sched_count
      7707 =C2=B1  4%     -54.8%       3487 =C2=B1 26%  sched_debug.cpu#113=
.ttwu_count
     19066 =C2=B1  7%     -17.0%      15824 =C2=B1 14%  sched_debug.cpu#114=
.nr_load_updates
     17523 =C2=B1  6%     -43.4%       9911 =C2=B1 27%  sched_debug.cpu#114=
.nr_switches
     17685 =C2=B1  6%     -34.2%      11640 =C2=B1  7%  sched_debug.cpu#114=
.sched_count
      7349 =C2=B1  3%     -53.1%       3450 =C2=B1 17%  sched_debug.cpu#114=
.ttwu_count
      8102 =C2=B1  6%     -45.0%       4453 =C2=B1 28%  sched_debug.cpu#114=
.sched_goidle
      8307 =C2=B1 16%     -42.9%       4740 =C2=B1 29%  sched_debug.cpu#115=
.sched_goidle
     17984 =C2=B1 15%     -39.0%      10977 =C2=B1 29%  sched_debug.cpu#115=
.sched_count
      7618 =C2=B1  2%     -53.6%       3536 =C2=B1 21%  sched_debug.cpu#115=
.ttwu_count
     17920 =C2=B1 15%     -41.3%      10511 =C2=B1 29%  sched_debug.cpu#115=
.nr_switches
     19881 =C2=B1 12%     -51.1%       9725 =C2=B1 26%  sched_debug.cpu#116=
.nr_switches
      9295 =C2=B1 13%     -52.9%       4376 =C2=B1 27%  sched_debug.cpu#116=
.sched_goidle
      7624 =C2=B1  2%     -56.6%       3308 =C2=B1 27%  sched_debug.cpu#116=
.ttwu_count
     19938 =C2=B1 12%     -50.6%       9857 =C2=B1 27%  sched_debug.cpu#116=
.sched_count
      7538 =C2=B1  3%     -53.1%       3534 =C2=B1 18%  sched_debug.cpu#117=
.ttwu_count
     18621 =C2=B1 14%     -45.5%      10145 =C2=B1 14%  sched_debug.cpu#117=
.sched_count
     18559 =C2=B1 14%     -47.2%       9798 =C2=B1 20%  sched_debug.cpu#117=
.nr_switches
      8589 =C2=B1 15%     -48.6%       4410 =C2=B1 20%  sched_debug.cpu#117=
.sched_goidle
     19575 =C2=B1 11%     -50.7%       9654 =C2=B1 24%  sched_debug.cpu#118=
.sched_count
      7626 =C2=B1  2%     -54.7%       3453 =C2=B1 27%  sched_debug.cpu#118=
.ttwu_count
      8976 =C2=B1 10%     -52.0%       4307 =C2=B1 24%  sched_debug.cpu#118=
.sched_goidle
     19252 =C2=B1 10%     -50.0%       9625 =C2=B1 24%  sched_debug.cpu#118=
.nr_switches
     18788 =C2=B1 18%     -46.9%       9967 =C2=B1 31%  sched_debug.cpu#119=
.sched_count
      7591 =C2=B1  3%     -51.4%       3685 =C2=B1 24%  sched_debug.cpu#119=
.ttwu_count
     18386 =C2=B1 16%     -46.0%       9936 =C2=B1 31%  sched_debug.cpu#119=
.nr_switches
      8557 =C2=B1 15%     -47.8%       4471 =C2=B1 31%  sched_debug.cpu#119=
.sched_goidle
     11781 =C2=B1  3%     -60.2%       4692 =C2=B1 33%  sched_debug.cpu#12.=
ttwu_count
     20573 =C2=B1 11%     -64.0%       7396 =C2=B1 35%  sched_debug.cpu#12.=
nr_switches
       252 =C2=B1 22%     +62.5%        410 =C2=B1 15%  sched_debug.cpu#12.=
ttwu_local
      9815 =C2=B1 11%     -64.7%       3467 =C2=B1 35%  sched_debug.cpu#12.=
sched_goidle
     21669 =C2=B1  6%     -65.3%       7520 =C2=B1 40%  sched_debug.cpu#13.=
sched_count
     11064 =C2=B1  1%     -57.4%       4710 =C2=B1 37%  sched_debug.cpu#13.=
ttwu_count
       236 =C2=B1  3%     +50.4%        355 =C2=B1 15%  sched_debug.cpu#13.=
ttwu_local
     21509 =C2=B1  6%     -65.7%       7369 =C2=B1 39%  sched_debug.cpu#13.=
nr_switches
     10268 =C2=B1  6%     -66.4%       3446 =C2=B1 39%  sched_debug.cpu#13.=
sched_goidle
    554904 =C2=B1 22%     +48.8%     825513 =C2=B1 23%  sched_debug.cpu#13.=
avg_idle
     21270 =C2=B1 10%     -65.7%       7298 =C2=B1 38%  sched_debug.cpu#14.=
sched_count
     11397 =C2=B1  2%     -57.7%       4821 =C2=B1 31%  sched_debug.cpu#14.=
ttwu_count
     20397 =C2=B1  9%     -65.0%       7147 =C2=B1 37%  sched_debug.cpu#14.=
nr_switches
       212 =C2=B1 13%    +131.6%        491 =C2=B1 49%  sched_debug.cpu#14.=
ttwu_local
      9749 =C2=B1  8%     -65.7%       3339 =C2=B1 37%  sched_debug.cpu#14.=
sched_goidle
     22590 =C2=B1  5%     -55.5%      10045 =C2=B1 26%  sched_debug.cpu#15.=
nr_switches
     10929 =C2=B1  5%     -57.3%       4670 =C2=B1 25%  sched_debug.cpu#15.=
sched_goidle
     13639 =C2=B1  2%     -48.1%       7083 =C2=B1  1%  sched_debug.cpu#15.=
ttwu_count
     18812 =C2=B1  4%     -46.7%      10036 =C2=B1 31%  sched_debug.cpu#16.=
nr_switches
     19674 =C2=B1  7%     -45.4%      10745 =C2=B1 24%  sched_debug.cpu#16.=
sched_count
      9052 =C2=B1  5%     -48.1%       4700 =C2=B1 31%  sched_debug.cpu#16.=
sched_goidle
     11554 =C2=B1  4%     -45.8%       6260 =C2=B1 29%  sched_debug.cpu#16.=
ttwu_count
     19143 =C2=B1  4%     -48.0%       9947 =C2=B1 34%  sched_debug.cpu#17.=
nr_switches
      9182 =C2=B1  4%     -49.3%       4658 =C2=B1 34%  sched_debug.cpu#17.=
sched_goidle
     11330 =C2=B1  4%     -46.8%       6031 =C2=B1 28%  sched_debug.cpu#17.=
ttwu_count
     19246 =C2=B1  4%     -43.3%      10904 =C2=B1 36%  sched_debug.cpu#17.=
sched_count
     19234 =C2=B1  6%     -47.4%      10114 =C2=B1 29%  sched_debug.cpu#18.=
nr_switches
      9212 =C2=B1  5%     -48.7%       4729 =C2=B1 28%  sched_debug.cpu#18.=
sched_goidle
     21035 =C2=B1  9%     -51.1%      10285 =C2=B1 27%  sched_debug.cpu#18.=
sched_count
     11338 =C2=B1  6%     -47.7%       5933 =C2=B1 26%  sched_debug.cpu#18.=
ttwu_count
      9702 =C2=B1  7%     -51.5%       4705 =C2=B1 31%  sched_debug.cpu#19.=
sched_goidle
     20765 =C2=B1  8%     -51.5%      10071 =C2=B1 32%  sched_debug.cpu#19.=
nr_switches
     11815 =C2=B1  5%     -47.7%       6185 =C2=B1 32%  sched_debug.cpu#19.=
ttwu_count
     24448 =C2=B1 17%     -58.6%      10132 =C2=B1 32%  sched_debug.cpu#19.=
sched_count
     11823 =C2=B1  1%     -54.6%       5370 =C2=B1 29%  sched_debug.cpu#2.t=
twu_count
     22120 =C2=B1  3%     -56.4%       9651 =C2=B1 43%  sched_debug.cpu#2.s=
ched_count
     21303 =C2=B1  7%     -56.5%       9275 =C2=B1 41%  sched_debug.cpu#2.n=
r_switches
     10175 =C2=B1  7%     -57.0%       4373 =C2=B1 43%  sched_debug.cpu#2.s=
ched_goidle
     21116 =C2=B1 28%     -47.2%      11151 =C2=B1 18%  sched_debug.cpu#20.=
sched_count
     12347 =C2=B1  6%     -48.4%       6371 =C2=B1 34%  sched_debug.cpu#20.=
ttwu_count
      8629 =C2=B1  9%     -46.8%       4594 =C2=B1 32%  sched_debug.cpu#20.=
sched_goidle
     18595 =C2=B1 12%     -47.0%       9853 =C2=B1 32%  sched_debug.cpu#20.=
nr_switches
     20046 =C2=B1  8%     -51.5%       9716 =C2=B1 27%  sched_debug.cpu#21.=
nr_switches
     12240 =C2=B1  6%     -49.4%       6194 =C2=B1 24%  sched_debug.cpu#21.=
ttwu_count
      9317 =C2=B1  4%     -51.4%       4532 =C2=B1 26%  sched_debug.cpu#21.=
sched_goidle
     20449 =C2=B1  6%     -46.9%      10858 =C2=B1 29%  sched_debug.cpu#21.=
sched_count
     11620 =C2=B1  2%     -48.2%       6022 =C2=B1 28%  sched_debug.cpu#22.=
ttwu_count
     19585 =C2=B1 12%     -44.4%      10894 =C2=B1  9%  sched_debug.cpu#22.=
sched_count
      8907 =C2=B1 10%     -49.0%       4541 =C2=B1 29%  sched_debug.cpu#22.=
sched_goidle
     18655 =C2=B1 10%     -47.8%       9737 =C2=B1 30%  sched_debug.cpu#22.=
nr_switches
     20609 =C2=B1 18%     -51.2%      10053 =C2=B1 29%  sched_debug.cpu#23.=
nr_switches
     21829 =C2=B1 19%     -45.8%      11841 =C2=B1  0%  sched_debug.cpu#23.=
sched_count
      9937 =C2=B1 18%     -52.6%       4710 =C2=B1 29%  sched_debug.cpu#23.=
sched_goidle
     12012 =C2=B1 11%     -49.1%       6116 =C2=B1 25%  sched_debug.cpu#23.=
ttwu_count
     11316 =C2=B1  1%     -47.0%       5993 =C2=B1 25%  sched_debug.cpu#24.=
ttwu_count
     18272 =C2=B1  7%     -44.7%      10105 =C2=B1 30%  sched_debug.cpu#24.=
nr_switches
     18875 =C2=B1  8%     -40.9%      11154 =C2=B1 23%  sched_debug.cpu#24.=
sched_count
      8793 =C2=B1  7%     -46.3%       4720 =C2=B1 29%  sched_debug.cpu#24.=
sched_goidle
      9775 =C2=B1 10%     -53.9%       4505 =C2=B1 29%  sched_debug.cpu#25.=
sched_goidle
     12576 =C2=B1  7%     -53.5%       5844 =C2=B1 25%  sched_debug.cpu#25.=
ttwu_count
    506744 =C2=B1 25%     +66.3%     842519 =C2=B1 20%  sched_debug.cpu#25.=
avg_idle
     20300 =C2=B1  9%     -52.5%       9645 =C2=B1 29%  sched_debug.cpu#25.=
nr_switches
     20908 =C2=B1  8%     -48.1%      10844 =C2=B1 24%  sched_debug.cpu#25.=
sched_count
     11287 =C2=B1  2%     -46.3%       6065 =C2=B1 26%  sched_debug.cpu#26.=
ttwu_count
     19402 =C2=B1  9%     -50.2%       9656 =C2=B1 31%  sched_debug.cpu#26.=
nr_switches
      9259 =C2=B1  8%     -51.4%       4502 =C2=B1 30%  sched_debug.cpu#26.=
sched_goidle
     19332 =C2=B1  5%     -39.1%      11766 =C2=B1 31%  sched_debug.cpu#27.=
sched_count
     18814 =C2=B1  8%     -45.5%      10257 =C2=B1 25%  sched_debug.cpu#27.=
nr_switches
     10943 =C2=B1  1%     -47.3%       5771 =C2=B1 27%  sched_debug.cpu#27.=
ttwu_count
      8992 =C2=B1  8%     -46.9%       4775 =C2=B1 24%  sched_debug.cpu#27.=
sched_goidle
     11682 =C2=B1 10%     -49.4%       5911 =C2=B1 25%  sched_debug.cpu#28.=
ttwu_count
      8754 =C2=B1  3%     -47.7%       4581 =C2=B1 31%  sched_debug.cpu#28.=
sched_goidle
     19815 =C2=B1 14%     -45.8%      10748 =C2=B1 22%  sched_debug.cpu#28.=
sched_count
     19361 =C2=B1 14%     -49.2%       9828 =C2=B1 31%  sched_debug.cpu#28.=
nr_switches
     21885 =C2=B1 10%     -52.1%      10478 =C2=B1  7%  sched_debug.cpu#29.=
sched_count
      9780 =C2=B1  8%     -57.2%       4187 =C2=B1 32%  sched_debug.cpu#29.=
sched_goidle
     20475 =C2=B1  7%     -56.0%       9001 =C2=B1 32%  sched_debug.cpu#29.=
nr_switches
    488124 =C2=B1 15%     +47.7%     721199 =C2=B1 23%  sched_debug.cpu#29.=
avg_idle
     24216 =C2=B1 14%     -62.5%       9075 =C2=B1 32%  sched_debug.cpu#3.s=
ched_count
     10568 =C2=B1 10%     -66.2%       3569 =C2=B1 38%  sched_debug.cpu#3.s=
ched_goidle
     11596 =C2=B1  2%     -41.6%       6772 =C2=B1 24%  sched_debug.cpu#3.t=
twu_count
     22099 =C2=B1 10%     -65.5%       7623 =C2=B1 38%  sched_debug.cpu#3.n=
r_switches
    656831 =C2=B1 18%     +56.7%    1029234 =C2=B1  4%  sched_debug.cpu#3.a=
vg_idle
     26523 =C2=B1  7%     -32.7%      17856 =C2=B1 28%  sched_debug.cpu#3.n=
r_load_updates
     18415 =C2=B1 10%     -33.2%      12292 =C2=B1 15%  sched_debug.cpu#30.=
nr_switches
     11430 =C2=B1  3%     -29.9%       8011 =C2=B1 11%  sched_debug.cpu#30.=
ttwu_count
      8747 =C2=B1 10%     -34.4%       5741 =C2=B1 15%  sched_debug.cpu#30.=
sched_goidle
     19038 =C2=B1 10%     -31.8%      12991 =C2=B1 14%  sched_debug.cpu#30.=
sched_count
     18736 =C2=B1  4%     -29.7%      13176 =C2=B1 20%  sched_debug.cpu#31.=
nr_switches
      8896 =C2=B1  4%     -37.0%       5607 =C2=B1  7%  sched_debug.cpu#31.=
sched_goidle
     11600 =C2=B1  5%     -27.5%       8413 =C2=B1 23%  sched_debug.cpu#31.=
ttwu_count
     21818 =C2=B1 22%     -36.9%      13774 =C2=B1 20%  sched_debug.cpu#31.=
sched_count
     19756 =C2=B1 11%     -36.6%      12529 =C2=B1 10%  sched_debug.cpu#32.=
nr_switches
      9403 =C2=B1 11%     -37.5%       5875 =C2=B1 11%  sched_debug.cpu#32.=
sched_goidle
     20319 =C2=B1 12%     -36.2%      12960 =C2=B1 11%  sched_debug.cpu#32.=
sched_count
     11375 =C2=B1  3%     -36.2%       7258 =C2=B1  6%  sched_debug.cpu#32.=
ttwu_count
     11460 =C2=B1  3%     -38.6%       7035 =C2=B1  3%  sched_debug.cpu#33.=
ttwu_count
     20085 =C2=B1  6%     -38.8%      12297 =C2=B1 10%  sched_debug.cpu#33.=
sched_count
     19782 =C2=B1  6%     -39.0%      12059 =C2=B1 10%  sched_debug.cpu#33.=
nr_switches
      9420 =C2=B1  6%     -40.2%       5634 =C2=B1 10%  sched_debug.cpu#33.=
sched_goidle
      9030 =C2=B1  5%     -37.1%       5676 =C2=B1  7%  sched_debug.cpu#34.=
sched_goidle
     19642 =C2=B1  7%     -32.7%      13221 =C2=B1 11%  sched_debug.cpu#34.=
sched_count
     11515 =C2=B1  7%     -31.1%       7929 =C2=B1 21%  sched_debug.cpu#34.=
ttwu_count
     18886 =C2=B1  4%     -32.6%      12732 =C2=B1 13%  sched_debug.cpu#34.=
nr_switches
     11566 =C2=B1  4%     -34.6%       7567 =C2=B1  2%  sched_debug.cpu#35.=
ttwu_count
     18801 =C2=B1  7%     -32.9%      12618 =C2=B1  9%  sched_debug.cpu#35.=
nr_switches
     19152 =C2=B1  5%     -31.6%      13092 =C2=B1  9%  sched_debug.cpu#35.=
sched_count
      8941 =C2=B1  7%     -34.6%       5848 =C2=B1  9%  sched_debug.cpu#35.=
sched_goidle
      9513 =C2=B1 15%     -29.9%       6670 =C2=B1 15%  sched_debug.cpu#36.=
sched_goidle
     25922 =C2=B1  5%      +6.8%      27687 =C2=B1  3%  sched_debug.cpu#36.=
nr_load_updates
     11792 =C2=B1  6%     -28.1%       8477 =C2=B1 11%  sched_debug.cpu#36.=
ttwu_count
     19995 =C2=B1 15%     -26.4%      14715 =C2=B1 13%  sched_debug.cpu#36.=
nr_switches
     11425 =C2=B1  4%     -32.6%       7699 =C2=B1  9%  sched_debug.cpu#37.=
ttwu_count
     18457 =C2=B1 16%     -32.0%      12541 =C2=B1 11%  sched_debug.cpu#37.=
nr_switches
      8795 =C2=B1 16%     -33.2%       5872 =C2=B1 12%  sched_debug.cpu#37.=
sched_goidle
      9332 =C2=B1 12%     -37.9%       5799 =C2=B1  3%  sched_debug.cpu#38.=
sched_goidle
     19562 =C2=B1 12%     -36.6%      12401 =C2=B1  4%  sched_debug.cpu#38.=
nr_switches
     11560 =C2=B1  3%     -38.8%       7074 =C2=B1  2%  sched_debug.cpu#38.=
ttwu_count
     12448 =C2=B1 17%     -41.0%       7347 =C2=B1  8%  sched_debug.cpu#39.=
ttwu_count
      9637 =C2=B1  7%     -46.6%       5144 =C2=B1  5%  sched_debug.cpu#39.=
sched_goidle
     20176 =C2=B1  7%     -45.6%      10978 =C2=B1  4%  sched_debug.cpu#39.=
nr_switches
     20763 =C2=B1  5%     -42.0%      12042 =C2=B1 14%  sched_debug.cpu#39.=
sched_count
      9975 =C2=B1  5%     -59.3%       4063 =C2=B1 39%  sched_debug.cpu#4.s=
ched_goidle
     21151 =C2=B1  5%     -58.7%       8739 =C2=B1 39%  sched_debug.cpu#4.s=
ched_count
     20914 =C2=B1  6%     -58.7%       8631 =C2=B1 39%  sched_debug.cpu#4.n=
r_switches
     11223 =C2=B1  2%     -48.3%       5804 =C2=B1 31%  sched_debug.cpu#4.t=
twu_count
     11410 =C2=B1  4%     -39.6%       6894 =C2=B1  3%  sched_debug.cpu#40.=
ttwu_count
     19269 =C2=B1  4%     -36.5%      12232 =C2=B1  3%  sched_debug.cpu#40.=
nr_switches
     19902 =C2=B1  5%     -38.2%      12302 =C2=B1  3%  sched_debug.cpu#40.=
sched_count
      9197 =C2=B1  4%     -37.9%       5714 =C2=B1  3%  sched_debug.cpu#40.=
sched_goidle
     11462 =C2=B1  3%     -35.1%       7436 =C2=B1 12%  sched_debug.cpu#41.=
ttwu_count
     10044 =C2=B1 16%     -43.5%       5677 =C2=B1 15%  sched_debug.cpu#41.=
sched_goidle
     21636 =C2=B1 14%     -38.8%      13234 =C2=B1 22%  sched_debug.cpu#41.=
sched_count
     21196 =C2=B1 16%     -42.8%      12126 =C2=B1 14%  sched_debug.cpu#41.=
nr_switches
     11453 =C2=B1  5%     -27.1%       8346 =C2=B1 16%  sched_debug.cpu#42.=
ttwu_count
     20619 =C2=B1  7%     -31.1%      14215 =C2=B1 14%  sched_debug.cpu#42.=
sched_count
     19445 =C2=B1 10%     -28.2%      13969 =C2=B1 15%  sched_debug.cpu#42.=
nr_switches
      9266 =C2=B1 11%     -28.7%       6604 =C2=B1 16%  sched_debug.cpu#42.=
sched_goidle
     19434 =C2=B1  8%     -36.9%      12261 =C2=B1 15%  sched_debug.cpu#43.=
nr_switches
     11352 =C2=B1  4%     -27.4%       8241 =C2=B1 20%  sched_debug.cpu#43.=
ttwu_count
         6 =C2=B1  7%     -23.1%          5 =C2=B1 14%  sched_debug.cpu#43.=
load
      9247 =C2=B1  9%     -40.9%       5467 =C2=B1 11%  sched_debug.cpu#43.=
sched_goidle
     20037 =C2=B1  8%     -35.1%      13005 =C2=B1 16%  sched_debug.cpu#43.=
sched_count
    583080 =C2=B1 18%     +33.5%     778681 =C2=B1 14%  sched_debug.cpu#43.=
avg_idle
      9733 =C2=B1 13%     -37.8%       6049 =C2=B1 23%  sched_debug.cpu#44.=
sched_goidle
     20450 =C2=B1 14%     -37.1%      12865 =C2=B1 21%  sched_debug.cpu#44.=
nr_switches
     31908 =C2=B1 34%     -58.9%      13123 =C2=B1 21%  sched_debug.cpu#44.=
sched_count
     11659 =C2=B1 11%     -32.4%       7881 =C2=B1 17%  sched_debug.cpu#44.=
ttwu_count
     19657 =C2=B1  5%     -51.4%       9548 =C2=B1 25%  sched_debug.cpu#45.=
sched_count
      9215 =C2=B1  5%     -52.3%       4399 =C2=B1 26%  sched_debug.cpu#45.=
sched_goidle
     11529 =C2=B1  1%     -46.9%       6122 =C2=B1 20%  sched_debug.cpu#45.=
ttwu_count
     19442 =C2=B1  5%     -51.2%       9486 =C2=B1 25%  sched_debug.cpu#45.=
nr_switches
    493973 =C2=B1 13%     +62.5%     802536 =C2=B1 21%  sched_debug.cpu#46.=
avg_idle
     10299 =C2=B1  9%     -49.4%       5213 =C2=B1 22%  sched_debug.cpu#46.=
sched_goidle
     21710 =C2=B1  9%     -48.5%      11179 =C2=B1 22%  sched_debug.cpu#46.=
nr_switches
     21823 =C2=B1  9%     -47.6%      11424 =C2=B1 19%  sched_debug.cpu#46.=
sched_count
     11637 =C2=B1  3%     -46.5%       6230 =C2=B1 18%  sched_debug.cpu#46.=
ttwu_count
     22065 =C2=B1  2%     -50.7%      10875 =C2=B1 19%  sched_debug.cpu#47.=
sched_count
     10441 =C2=B1  2%     -53.3%       4875 =C2=B1 20%  sched_debug.cpu#47.=
sched_goidle
     11444 =C2=B1  3%     -46.6%       6110 =C2=B1 18%  sched_debug.cpu#47.=
ttwu_count
     21966 =C2=B1  2%     -52.5%      10433 =C2=B1 20%  sched_debug.cpu#47.=
nr_switches
     11826 =C2=B1  8%     -45.2%       6485 =C2=B1 12%  sched_debug.cpu#48.=
ttwu_count
     21386 =C2=B1  7%     -49.1%      10880 =C2=B1 17%  sched_debug.cpu#48.=
nr_switches
     21802 =C2=B1  7%     -48.6%      11216 =C2=B1 15%  sched_debug.cpu#48.=
sched_count
     10190 =C2=B1  7%     -50.0%       5090 =C2=B1 17%  sched_debug.cpu#48.=
sched_goidle
     20103 =C2=B1  5%     -40.4%      11979 =C2=B1 10%  sched_debug.cpu#49.=
sched_count
      9449 =C2=B1  4%     -45.8%       5123 =C2=B1 23%  sched_debug.cpu#49.=
sched_goidle
     11442 =C2=B1  1%     -45.9%       6188 =C2=B1 12%  sched_debug.cpu#49.=
ttwu_count
     19899 =C2=B1  5%     -45.1%      10915 =C2=B1 23%  sched_debug.cpu#49.=
nr_switches
     11637 =C2=B1  2%     -57.5%       4944 =C2=B1 33%  sched_debug.cpu#5.t=
twu_count
     21242 =C2=B1  3%     -61.7%       8132 =C2=B1 38%  sched_debug.cpu#5.s=
ched_count
     20355 =C2=B1  5%     -60.9%       7961 =C2=B1 37%  sched_debug.cpu#5.n=
r_switches
      9719 =C2=B1  5%     -61.6%       3735 =C2=B1 37%  sched_debug.cpu#5.s=
ched_goidle
     10194 =C2=B1  7%     -52.0%       4898 =C2=B1 20%  sched_debug.cpu#50.=
sched_goidle
     21780 =C2=B1  8%     -51.1%      10650 =C2=B1 21%  sched_debug.cpu#50.=
sched_count
     21577 =C2=B1  7%     -51.4%      10481 =C2=B1 21%  sched_debug.cpu#50.=
nr_switches
     11563 =C2=B1  3%     -45.0%       6360 =C2=B1 12%  sched_debug.cpu#50.=
ttwu_count
     20908 =C2=B1  7%     -51.5%      10130 =C2=B1 23%  sched_debug.cpu#51.=
sched_count
      9851 =C2=B1  8%     -52.6%       4668 =C2=B1 23%  sched_debug.cpu#51.=
sched_goidle
     20683 =C2=B1  8%     -51.3%      10064 =C2=B1 23%  sched_debug.cpu#51.=
nr_switches
     11528 =C2=B1  2%     -43.4%       6526 =C2=B1 16%  sched_debug.cpu#51.=
ttwu_count
     20305 =C2=B1  2%     -49.6%      10235 =C2=B1 19%  sched_debug.cpu#52.=
nr_switches
     20413 =C2=B1  2%     -49.5%      10300 =C2=B1 19%  sched_debug.cpu#52.=
sched_count
     12463 =C2=B1 12%     -46.2%       6707 =C2=B1 21%  sched_debug.cpu#52.=
ttwu_count
      9619 =C2=B1  2%     -50.4%       4774 =C2=B1 19%  sched_debug.cpu#52.=
sched_goidle
      9580 =C2=B1  5%     -47.8%       4998 =C2=B1 13%  sched_debug.cpu#53.=
sched_goidle
     20431 =C2=B1  5%     -46.9%      10857 =C2=B1 14%  sched_debug.cpu#53.=
sched_count
     11479 =C2=B1  5%     -45.2%       6293 =C2=B1 14%  sched_debug.cpu#53.=
ttwu_count
     20248 =C2=B1  5%     -47.2%      10691 =C2=B1 13%  sched_debug.cpu#53.=
nr_switches
     22255 =C2=B1  9%     -57.3%       9513 =C2=B1 17%  sched_debug.cpu#54.=
sched_count
     21573 =C2=B1  8%     -56.2%       9454 =C2=B1 17%  sched_debug.cpu#54.=
nr_switches
     11477 =C2=B1  3%     -45.8%       6222 =C2=B1 16%  sched_debug.cpu#54.=
ttwu_count
     10245 =C2=B1  8%     -57.1%       4392 =C2=B1 17%  sched_debug.cpu#54.=
sched_goidle
     20376 =C2=B1  2%     -51.5%       9884 =C2=B1 23%  sched_debug.cpu#55.=
nr_switches
     20841 =C2=B1  3%     -48.8%      10663 =C2=B1 25%  sched_debug.cpu#55.=
sched_count
     12540 =C2=B1 14%     -51.0%       6139 =C2=B1 16%  sched_debug.cpu#55.=
ttwu_count
      9707 =C2=B1  2%     -52.5%       4613 =C2=B1 23%  sched_debug.cpu#55.=
sched_goidle
     11783 =C2=B1  2%     -48.1%       6117 =C2=B1 18%  sched_debug.cpu#56.=
ttwu_count
     21215 =C2=B1  5%     -53.4%       9889 =C2=B1 20%  sched_debug.cpu#56.=
sched_count
      9817 =C2=B1  6%     -53.5%       4562 =C2=B1 20%  sched_debug.cpu#56.=
sched_goidle
     20687 =C2=B1  5%     -52.5%       9822 =C2=B1 20%  sched_debug.cpu#56.=
nr_switches
      9751 =C2=B1  8%     -54.3%       4457 =C2=B1 20%  sched_debug.cpu#57.=
sched_goidle
     21128 =C2=B1  7%     -54.3%       9654 =C2=B1 20%  sched_debug.cpu#57.=
sched_count
     20602 =C2=B1  7%     -53.4%       9590 =C2=B1 20%  sched_debug.cpu#57.=
nr_switches
     11371 =C2=B1  1%     -46.1%       6131 =C2=B1 15%  sched_debug.cpu#57.=
ttwu_count
      9889 =C2=B1  9%     -51.9%       4756 =C2=B1 20%  sched_debug.cpu#58.=
sched_goidle
     20748 =C2=B1  9%     -50.7%      10227 =C2=B1 20%  sched_debug.cpu#58.=
nr_switches
     20851 =C2=B1  8%     -48.3%      10770 =C2=B1 14%  sched_debug.cpu#58.=
sched_count
     12412 =C2=B1 16%     -52.2%       5928 =C2=B1 20%  sched_debug.cpu#58.=
ttwu_count
     11336 =C2=B1  2%     -45.5%       6173 =C2=B1 21%  sched_debug.cpu#59.=
ttwu_count
     10376 =C2=B1  6%     -54.0%       4774 =C2=B1 28%  sched_debug.cpu#59.=
sched_goidle
     21737 =C2=B1  6%     -52.8%      10253 =C2=B1 28%  sched_debug.cpu#59.=
nr_switches
     22071 =C2=B1  5%     -53.3%      10315 =C2=B1 28%  sched_debug.cpu#59.=
sched_count
     20703 =C2=B1 10%     -63.8%       7492 =C2=B1 34%  sched_debug.cpu#6.s=
ched_count
      9766 =C2=B1 10%     -64.5%       3471 =C2=B1 33%  sched_debug.cpu#6.s=
ched_goidle
     11459 =C2=B1  1%     -53.5%       5325 =C2=B1 29%  sched_debug.cpu#6.t=
twu_count
     20551 =C2=B1 10%     -64.0%       7392 =C2=B1 33%  sched_debug.cpu#6.n=
r_switches
     20765 =C2=B1  9%     -36.5%      13194 =C2=B1 33%  sched_debug.cpu#60.=
nr_load_updates
       231 =C2=B1 18%     +67.2%        386 =C2=B1 26%  sched_debug.cpu#60.=
ttwu_local
     17529 =C2=B1 11%     -58.2%       7331 =C2=B1 42%  sched_debug.cpu#61.=
sched_count
     20230 =C2=B1  9%     -35.8%      12989 =C2=B1 33%  sched_debug.cpu#61.=
nr_load_updates
       210 =C2=B1 12%     +59.8%        335 =C2=B1 17%  sched_debug.cpu#61.=
ttwu_local
     20127 =C2=B1  9%     -35.3%      13016 =C2=B1 32%  sched_debug.cpu#62.=
nr_load_updates
     20270 =C2=B1 10%     -36.1%      12953 =C2=B1 31%  sched_debug.cpu#63.=
nr_load_updates
    654377 =C2=B1 25%     +50.5%     984832 =C2=B1  2%  sched_debug.cpu#63.=
avg_idle
      3712 =C2=B1 35%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#64.=
curr->pid
      7325 =C2=B1  4%     -66.9%       2425 =C2=B1 49%  sched_debug.cpu#64.=
ttwu_count
     20354 =C2=B1  9%     -36.0%      13024 =C2=B1 35%  sched_debug.cpu#64.=
nr_load_updates
         6 =C2=B1 11%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#64.=
load
     20400 =C2=B1  9%     -37.0%      12842 =C2=B1 34%  sched_debug.cpu#65.=
nr_load_updates
       210 =C2=B1 19%     +48.4%        312 =C2=B1 12%  sched_debug.cpu#65.=
ttwu_local
      7369 =C2=B1  2%     -67.8%       2375 =C2=B1 46%  sched_debug.cpu#66.=
ttwu_count
     20336 =C2=B1  9%     -37.6%      12694 =C2=B1 32%  sched_debug.cpu#66.=
nr_load_updates
     20504 =C2=B1  9%     -37.0%      12919 =C2=B1 32%  sched_debug.cpu#67.=
nr_load_updates
    476168 =C2=B1 15%     +81.1%     862309 =C2=B1 23%  sched_debug.cpu#68.=
avg_idle
       249 =C2=B1 18%     +42.1%        353 =C2=B1 20%  sched_debug.cpu#68.=
ttwu_local
     20117 =C2=B1 11%     -37.9%      12501 =C2=B1 36%  sched_debug.cpu#68.=
nr_load_updates
     20196 =C2=B1  9%     -36.2%      12894 =C2=B1 33%  sched_debug.cpu#69.=
nr_load_updates
      9469 =C2=B1  6%     -62.6%       3537 =C2=B1 34%  sched_debug.cpu#7.s=
ched_goidle
     21443 =C2=B1 13%     -64.4%       7625 =C2=B1 35%  sched_debug.cpu#7.s=
ched_count
     19921 =C2=B1  6%     -62.3%       7512 =C2=B1 34%  sched_debug.cpu#7.n=
r_switches
     11241 =C2=B1  1%     -56.5%       4888 =C2=B1 31%  sched_debug.cpu#7.t=
twu_count
      7314 =C2=B1  3%     -68.4%       2309 =C2=B1 44%  sched_debug.cpu#70.=
ttwu_count
     20279 =C2=B1  8%     -36.7%      12839 =C2=B1 30%  sched_debug.cpu#70.=
nr_load_updates
     19999 =C2=B1  9%     -34.9%      13012 =C2=B1 33%  sched_debug.cpu#71.=
nr_load_updates
       232 =C2=B1 13%     +26.5%        293 =C2=B1 15%  sched_debug.cpu#72.=
ttwu_local
     19871 =C2=B1 10%     -35.6%      12804 =C2=B1 33%  sched_debug.cpu#72.=
nr_load_updates
     20183 =C2=B1  9%     -36.3%      12851 =C2=B1 33%  sched_debug.cpu#73.=
nr_load_updates
      7457 =C2=B1  7%     -63.9%       2691 =C2=B1 36%  sched_debug.cpu#73.=
ttwu_count
       208 =C2=B1 20%    +168.1%        558 =C2=B1 23%  sched_debug.cpu#73.=
ttwu_local
        33 =C2=B1 12%     +45.9%         49 =C2=B1 17%  sched_debug.cpu#74.=
nr_uninterruptible
      7180 =C2=B1  5%     -67.9%       2306 =C2=B1 48%  sched_debug.cpu#74.=
ttwu_count
     19935 =C2=B1 10%     -34.9%      12969 =C2=B1 34%  sched_debug.cpu#74.=
nr_load_updates
    685812 =C2=B1 27%     +33.2%     913746 =C2=B1  9%  sched_debug.cpu#74.=
avg_idle
     14720 =C2=B1 17%     -47.0%       7809 =C2=B1 43%  sched_debug.cpu#75.=
nr_switches
     14982 =C2=B1 16%     -47.7%       7835 =C2=B1 43%  sched_debug.cpu#75.=
sched_count
         5 =C2=B1  7%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#75.=
load
      6946 =C2=B1  6%     -53.7%       3218 =C2=B1 42%  sched_debug.cpu#75.=
ttwu_count
      6861 =C2=B1 17%     -49.7%       3454 =C2=B1 43%  sched_debug.cpu#75.=
sched_goidle
     15528 =C2=B1  8%     -44.5%       8612 =C2=B1 46%  sched_debug.cpu#76.=
nr_switches
     15727 =C2=B1  7%     -39.9%       9459 =C2=B1 30%  sched_debug.cpu#76.=
sched_count
      7220 =C2=B1  8%     -46.7%       3848 =C2=B1 46%  sched_debug.cpu#76.=
sched_goidle
      6740 =C2=B1  9%     -51.2%       3287 =C2=B1 42%  sched_debug.cpu#76.=
ttwu_count
      6980 =C2=B1  5%     -55.5%       3105 =C2=B1 40%  sched_debug.cpu#77.=
ttwu_count
     14913 =C2=B1  6%     -39.6%       9013 =C2=B1 43%  sched_debug.cpu#77.=
nr_switches
     15155 =C2=B1  4%     -39.7%       9138 =C2=B1 43%  sched_debug.cpu#77.=
sched_count
      7025 =C2=B1  7%     -42.2%       4059 =C2=B1 43%  sched_debug.cpu#77.=
sched_goidle
     15933 =C2=B1  8%     -48.5%       8207 =C2=B1 40%  sched_debug.cpu#78.=
nr_switches
     16286 =C2=B1  7%     -48.8%       8338 =C2=B1 40%  sched_debug.cpu#78.=
sched_count
      7128 =C2=B1  2%     -56.8%       3082 =C2=B1 38%  sched_debug.cpu#78.=
ttwu_count
    574402 =C2=B1  9%     +26.3%     725293 =C2=B1 25%  sched_debug.cpu#78.=
avg_idle
      7488 =C2=B1  8%     -50.9%       3673 =C2=B1 40%  sched_debug.cpu#78.=
sched_goidle
      7838 =C2=B1 14%     -52.2%       3745 =C2=B1 44%  sched_debug.cpu#79.=
sched_goidle
     16944 =C2=B1 11%     -48.9%       8666 =C2=B1 45%  sched_debug.cpu#79.=
sched_count
      6961 =C2=B1  2%     -54.1%       3196 =C2=B1 42%  sched_debug.cpu#79.=
ttwu_count
     16696 =C2=B1 14%     -49.5%       8434 =C2=B1 44%  sched_debug.cpu#79.=
nr_switches
    589451 =C2=B1 35%     +56.9%     924847 =C2=B1 20%  sched_debug.cpu#8.a=
vg_idle
     11434 =C2=B1  0%     -56.9%       4927 =C2=B1 33%  sched_debug.cpu#8.t=
twu_count
     20815 =C2=B1 12%     -62.3%       7857 =C2=B1 38%  sched_debug.cpu#8.n=
r_switches
     21318 =C2=B1 13%     -62.5%       7999 =C2=B1 39%  sched_debug.cpu#8.s=
ched_count
      9904 =C2=B1 12%     -62.7%       3689 =C2=B1 38%  sched_debug.cpu#8.s=
ched_goidle
      7491 =C2=B1  9%     -56.2%       3279 =C2=B1 34%  sched_debug.cpu#80.=
ttwu_count
     15129 =C2=B1  2%     -28.4%      10830 =C2=B1 21%  sched_debug.cpu#80.=
sched_count
      6962 =C2=B1  2%     -42.3%       4015 =C2=B1 39%  sched_debug.cpu#80.=
sched_goidle
     15007 =C2=B1  2%     -40.3%       8955 =C2=B1 39%  sched_debug.cpu#80.=
nr_switches
      6633 =C2=B1  9%     -38.4%       4086 =C2=B1 41%  sched_debug.cpu#81.=
sched_goidle
     14080 =C2=B1  9%     -35.4%       9092 =C2=B1 41%  sched_debug.cpu#81.=
nr_switches
    730746 =C2=B1 20%     +33.0%     971856 =C2=B1  2%  sched_debug.cpu#81.=
avg_idle
     14145 =C2=B1  9%     -34.2%       9305 =C2=B1 42%  sched_debug.cpu#81.=
sched_count
      7793 =C2=B1 13%     -59.8%       3135 =C2=B1 37%  sched_debug.cpu#81.=
ttwu_count
    517193 =C2=B1  1%     +50.7%     779650 =C2=B1 20%  sched_debug.cpu#82.=
avg_idle
      7163 =C2=B1  9%     -50.1%       3571 =C2=B1 44%  sched_debug.cpu#82.=
ttwu_count
      6846 =C2=B1  1%     -44.9%       3773 =C2=B1 43%  sched_debug.cpu#82.=
sched_goidle
     14597 =C2=B1  2%     -42.1%       8457 =C2=B1 43%  sched_debug.cpu#82.=
nr_switches
     14752 =C2=B1  2%     -37.5%       9227 =C2=B1 27%  sched_debug.cpu#82.=
sched_count
     14945 =C2=B1 12%     -36.5%       9497 =C2=B1 45%  sched_debug.cpu#83.=
sched_count
      6942 =C2=B1 11%     -42.7%       3974 =C2=B1 44%  sched_debug.cpu#83.=
sched_goidle
     14887 =C2=B1 12%     -40.6%       8849 =C2=B1 44%  sched_debug.cpu#83.=
nr_switches
      6905 =C2=B1  4%     -57.0%       2966 =C2=B1 39%  sched_debug.cpu#83.=
ttwu_count
     15806 =C2=B1  3%     -43.5%       8928 =C2=B1 44%  sched_debug.cpu#84.=
sched_count
      6504 =C2=B1  3%     -51.0%       3189 =C2=B1 38%  sched_debug.cpu#84.=
ttwu_count
      7116 =C2=B1  6%     -45.1%       3909 =C2=B1 45%  sched_debug.cpu#84.=
sched_goidle
    604974 =C2=B1 17%     +53.5%     928822 =C2=B1  7%  sched_debug.cpu#84.=
avg_idle
     15237 =C2=B1  5%     -42.8%       8708 =C2=B1 44%  sched_debug.cpu#84.=
nr_switches
      7497 =C2=B1  7%     -48.9%       3832 =C2=B1 45%  sched_debug.cpu#85.=
sched_goidle
    601593 =C2=B1 27%     +56.8%     943043 =C2=B1  6%  sched_debug.cpu#85.=
avg_idle
     16379 =C2=B1  7%     -43.7%       9221 =C2=B1 47%  sched_debug.cpu#85.=
sched_count
      7224 =C2=B1  8%     -50.4%       3585 =C2=B1 41%  sched_debug.cpu#85.=
ttwu_count
     15956 =C2=B1  7%     -46.2%       8591 =C2=B1 45%  sched_debug.cpu#85.=
nr_switches
     15176 =C2=B1 11%     -45.9%       8209 =C2=B1 46%  sched_debug.cpu#86.=
nr_switches
      6991 =C2=B1 10%     -52.8%       3300 =C2=B1 40%  sched_debug.cpu#86.=
ttwu_count
    603306 =C2=B1 21%     +52.4%     919373 =C2=B1 15%  sched_debug.cpu#86.=
avg_idle
     15243 =C2=B1 11%     -42.5%       8760 =C2=B1 41%  sched_debug.cpu#86.=
sched_count
      7121 =C2=B1 13%     -48.7%       3652 =C2=B1 46%  sched_debug.cpu#86.=
sched_goidle
     15489 =C2=B1 13%     -45.8%       8401 =C2=B1 45%  sched_debug.cpu#87.=
sched_count
      7235 =C2=B1  3%     -56.7%       3132 =C2=B1 41%  sched_debug.cpu#87.=
ttwu_count
        12 =C2=B1 40%    +400.0%         60 =C2=B1 37%  sched_debug.cpu#87.=
nr_uninterruptible
      7074 =C2=B1 14%     -49.0%       3610 =C2=B1 42%  sched_debug.cpu#87.=
sched_goidle
     15356 =C2=B1 13%     -47.5%       8059 =C2=B1 43%  sched_debug.cpu#87.=
nr_switches
      6981 =C2=B1 13%     -39.4%       4232 =C2=B1 42%  sched_debug.cpu#88.=
sched_goidle
         6 =C2=B1 11%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#88.=
load
      7084 =C2=B1  4%     -53.3%       3306 =C2=B1 34%  sched_debug.cpu#88.=
ttwu_count
      2764 =C2=B1 45%    -100.0%          0 =C2=B1  0%  sched_debug.cpu#88.=
curr->pid
     15278 =C2=B1 13%     -36.6%       9681 =C2=B1 43%  sched_debug.cpu#88.=
sched_count
     14869 =C2=B1 12%     -36.8%       9392 =C2=B1 42%  sched_debug.cpu#88.=
nr_switches
    616192 =C2=B1 25%     +36.9%     843717 =C2=B1 19%  sched_debug.cpu#88.=
avg_idle
     15998 =C2=B1  5%     -45.2%       8762 =C2=B1 44%  sched_debug.cpu#89.=
sched_count
     15749 =C2=B1  7%     -44.5%       8735 =C2=B1 44%  sched_debug.cpu#89.=
nr_switches
      7440 =C2=B1  8%     -57.8%       3137 =C2=B1 40%  sched_debug.cpu#89.=
ttwu_count
      7338 =C2=B1  7%     -46.3%       3938 =C2=B1 45%  sched_debug.cpu#89.=
sched_goidle
     11283 =C2=B1  1%     -58.1%       4722 =C2=B1 39%  sched_debug.cpu#9.t=
twu_count
       200 =C2=B1 12%    +113.7%        429 =C2=B1 31%  sched_debug.cpu#9.t=
twu_local
      9392 =C2=B1 12%     -64.9%       3292 =C2=B1 36%  sched_debug.cpu#9.s=
ched_goidle
     19735 =C2=B1 12%     -64.2%       7069 =C2=B1 36%  sched_debug.cpu#9.n=
r_switches
     20010 =C2=B1 13%     -63.9%       7233 =C2=B1 38%  sched_debug.cpu#9.s=
ched_count
     16518 =C2=B1 11%     -38.6%      10135 =C2=B1  8%  sched_debug.cpu#90.=
nr_switches
      7468 =C2=B1  9%     -42.1%       4326 =C2=B1 18%  sched_debug.cpu#90.=
ttwu_count
      7699 =C2=B1 12%     -41.1%       4532 =C2=B1  9%  sched_debug.cpu#90.=
sched_goidle
     16818 =C2=B1 12%     -30.5%      11695 =C2=B1 23%  sched_debug.cpu#90.=
sched_count
     17664 =C2=B1 11%     -41.8%      10288 =C2=B1 10%  sched_debug.cpu#91.=
sched_count
     17024 =C2=B1 10%     -41.0%      10048 =C2=B1  8%  sched_debug.cpu#91.=
nr_switches
      7089 =C2=B1 10%     -43.7%       3994 =C2=B1  5%  sched_debug.cpu#91.=
ttwu_count
      7952 =C2=B1  9%     -43.1%       4521 =C2=B1  9%  sched_debug.cpu#91.=
sched_goidle
      7332 =C2=B1  7%     -46.7%       3905 =C2=B1  4%  sched_debug.cpu#92.=
ttwu_count
     18206 =C2=B1 12%     -40.7%      10794 =C2=B1  9%  sched_debug.cpu#92.=
nr_switches
     18651 =C2=B1 13%     -40.9%      11031 =C2=B1 10%  sched_debug.cpu#92.=
sched_count
      8488 =C2=B1 13%     -42.5%       4877 =C2=B1  9%  sched_debug.cpu#92.=
sched_goidle
     19426 =C2=B1  7%      -7.5%      17961 =C2=B1  4%  sched_debug.cpu#92.=
nr_load_updates
    590089 =C2=B1 18%     +48.6%     876775 =C2=B1 14%  sched_debug.cpu#92.=
avg_idle
      8224 =C2=B1 13%     -44.5%       4566 =C2=B1 23%  sched_debug.cpu#93.=
sched_goidle
     19588 =C2=B1 11%     -44.1%      10946 =C2=B1 24%  sched_debug.cpu#93.=
sched_count
      7417 =C2=B1  9%     -50.2%       3692 =C2=B1 13%  sched_debug.cpu#93.=
ttwu_count
     17602 =C2=B1 13%     -42.3%      10153 =C2=B1 22%  sched_debug.cpu#93.=
nr_switches
     18252 =C2=B1 10%     -44.8%      10073 =C2=B1  2%  sched_debug.cpu#94.=
nr_switches
     18401 =C2=B1 10%     -44.0%      10304 =C2=B1  4%  sched_debug.cpu#94.=
sched_count
      8493 =C2=B1 10%     -46.6%       4534 =C2=B1  2%  sched_debug.cpu#94.=
sched_goidle
      7138 =C2=B1 11%     -44.3%       3973 =C2=B1 10%  sched_debug.cpu#94.=
ttwu_count
     16690 =C2=B1 15%     -36.1%      10673 =C2=B1 12%  sched_debug.cpu#95.=
nr_switches
      7474 =C2=B1  8%     -46.2%       4018 =C2=B1  8%  sched_debug.cpu#95.=
ttwu_count
     17460 =C2=B1 12%     -34.2%      11497 =C2=B1 14%  sched_debug.cpu#95.=
sched_count
      7752 =C2=B1 15%     -38.4%       4771 =C2=B1 12%  sched_debug.cpu#95.=
sched_goidle
    577957 =C2=B1  9%     +41.9%     819928 =C2=B1 22%  sched_debug.cpu#95.=
avg_idle
      8007 =C2=B1 23%     -40.3%       4777 =C2=B1 13%  sched_debug.cpu#96.=
sched_goidle
      7265 =C2=B1  8%     -39.8%       4374 =C2=B1 20%  sched_debug.cpu#96.=
ttwu_count
     17022 =C2=B1 23%     -37.9%      10571 =C2=B1 12%  sched_debug.cpu#96.=
nr_switches
     17571 =C2=B1 24%     -36.8%      11096 =C2=B1 16%  sched_debug.cpu#96.=
sched_count
      7195 =C2=B1  8%     -48.1%       3737 =C2=B1  3%  sched_debug.cpu#97.=
ttwu_count
      7850 =C2=B1 22%     -42.0%       4555 =C2=B1  6%  sched_debug.cpu#97.=
sched_goidle
     16804 =C2=B1 22%     -39.6%      10149 =C2=B1  6%  sched_debug.cpu#97.=
nr_switches
     19206 =C2=B1  7%      -9.4%      17401 =C2=B1  3%  sched_debug.cpu#97.=
nr_load_updates
     17078 =C2=B1 22%     -39.2%      10390 =C2=B1  7%  sched_debug.cpu#97.=
sched_count
      7784 =C2=B1  9%     -40.2%       4654 =C2=B1 10%  sched_debug.cpu#98.=
sched_goidle
      7357 =C2=B1 12%     -43.6%       4147 =C2=B1 10%  sched_debug.cpu#98.=
ttwu_count
     19258 =C2=B1  7%      -8.0%      17718 =C2=B1  5%  sched_debug.cpu#98.=
nr_load_updates
     17890 =C2=B1  6%     -39.7%      10796 =C2=B1 12%  sched_debug.cpu#98.=
sched_count
     16789 =C2=B1  9%     -38.2%      10378 =C2=B1  9%  sched_debug.cpu#98.=
nr_switches
     17157 =C2=B1 16%     -34.8%      11183 =C2=B1 10%  sched_debug.cpu#99.=
nr_switches
      7331 =C2=B1  9%     -49.1%       3729 =C2=B1  4%  sched_debug.cpu#99.=
ttwu_count
     17812 =C2=B1 14%     -34.8%      11607 =C2=B1 13%  sched_debug.cpu#99.=
sched_count
      7862 =C2=B1 15%     -35.8%       5044 =C2=B1 11%  sched_debug.cpu#99.=
sched_goidle
    480445 =C2=B1 10%     +54.3%     741151 =C2=B1 15%  sched_debug.cpu#99.=
avg_idle

brickland3: Brickland Ivy Bridge-EX
Memory: 512G






    2e+06 ++---------------------------------------------------------------=
-+
          |            ....*.......*...           .*........    ....*..... =
 |
  1.8e+06 *+......*....                ...     ...          *...          .=
.|
          |                               .  ..                            =
 *
  1.6e+06 ++                               *.                              =
 |
          |                                                                =
 |
  1.4e+06 ++                                                               =
 |
          |                                                                =
 |
  1.2e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 O+                       O                                O      =
 |
          |                                        O        O              =
 |
   800000 ++                                                               =
 O
          |       O        O               O                               =
 |
   600000 ++---------------------------------------------------------------=
-+




  380000 ++------O---------------------------------------------------------=
-+
  360000 ++               O                                                =
 |
         |                                 O                               =
 |
  340000 ++                                                                =
 |
  320000 ++                                                O        O      =
 O
         |                                         O                       =
 |
  300000 O+                       O                                        =
 |
  280000 ++                                                                =
 |
  260000 ++                                                                =
 |
         |                                                                 =
 |
  240000 ++                                                                =
 |
  220000 ++                                                                =
 |
         |                               ..*.....                         .=
.*
  200000 *+......*........           ....        ..    ....*........  .... =
 |
  180000 ++---------------*-------*----------------*----------------*------=
-+


            latency_stats.hits.do_unlinkat.SyS_unlink.system_call_fastpath

  1.8e+06 ++---------------------------------------------------------------=
-+
          |                    ....*.....                                  =
 |
  1.6e+06 *+......*........*...          ..    ....*........*.......*......=
.|
          |                                *...                            =
 *
  1.4e+06 ++                                                               =
 |
          |                                                                =
 |
  1.2e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   800000 ++                                                               =
 O
          |                        O                                       =
 |
   600000 O+      O        O               O       O        O       O      =
 |
          |                                                                =
 |
   400000 ++---------------------------------------------------------------=
-+


            latency_stats.avg.do_unlinkat.SyS_unlink.system_call_fastpath

  400000 ++------O---------------------------------------------------------=
-+
         |                O                O                               =
 |
         |                                                                 =
 |
  350000 ++                                        O       O               =
 |
         O                        O                                        =
 O
         |                                                          O      =
 |
  300000 ++                                                                =
 |
         |                                                                 =
 |
  250000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
         *.......*........             ....*.......*.......     ....*......=
.*
  150000 ++---------------*-------*------------------------*---------------=
-+


                                cpuidle.C1-IVT-4S.time

  2.8e+09 ++---------------------------------------------------------------=
-+
          |                            ....*.......                        =
 |
  2.6e+09 ++  ....*........*.......*...            *........*.......*......=
.*
  2.4e+09 *+..                                                             =
 |
          |                                                                =
 |
  2.2e+09 ++                                                               =
 |
          |                                                                =
 |
    2e+09 ++                                                               =
 |
          |                                                                =
 |
  1.8e+09 ++                                                               =
 |
  1.6e+09 ++                                                               =
 |
          O                        O                                       =
 |
  1.4e+09 ++                                                               =
 O
          |                                O       O                O      =
 |
  1.2e+09 ++------O--------O--------------------------------O--------------=
-+


                                cpuidle.C1-IVT-4S.usage

  2.6e+06 ++---------------------------------------------------------------=
-+
  2.4e+06 ++  ....*........*.......*.......    ....*........*.......*......=
.|
          *...                             *...                            =
 *
  2.2e+06 ++                                                               =
 |
    2e+06 ++                                                               =
 |
          |                                                                =
 |
  1.8e+06 ++                                                               =
 |
  1.6e+06 ++                                                               =
 |
  1.4e+06 ++                                                               =
 |
          |                                                                =
 |
  1.2e+06 ++                                                               =
 |
    1e+06 ++                       O                                       =
 |
          O                                        O                O      =
 O
   800000 ++               O               O                O              =
 |
   600000 ++------O--------------------------------------------------------=
-+


                                cpuidle.C6-IVT-4S.time

    6e+09 ++---------------------------------------------------------------=
-+
          |                        O                                       =
 |
  5.5e+09 O+                                                O              =
 |
          |       O        O               O       O                O      =
 O
          |                                                                =
 |
    5e+09 ++                                                               =
 |
          |                                                                =
 |
  4.5e+09 ++                                                               =
 |
          |                                                                =
 |
    4e+09 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
  3.5e+09 *+......                                                         =
 |
          |       *........*.......*.......*.......*........*.......*......=
.*
    3e+09 ++---------------------------------------------------------------=
-+


                                 turbostat.Avg_MHz

  1800 ++------------------------------------------------------------------=
-+
       |                     ....*........    ....*........                =
 |
  1700 *+.......*.......*....             *...             *.......*.......=
.*
       |                                                                   =
 |
       |                                                                   =
 |
  1600 ++                                                                  =
 |
       |                                                                   =
 |
  1500 ++                                                                  =
 |
       |                                                                   =
 |
  1400 ++                                                                  =
 |
       |                                                                   =
 |
       |                                                                   =
 |
  1300 O+                                         O                O       =
 O
       |        O       O        O        O                O               =
 |
  1200 ++------------------------------------------------------------------=
-+


                                 turbostat.%Busy

  56 ++--------------------------------------------------------------------=
-+
     |                      ....*........    ....*........     ....*.......=
.|
  54 *+.......*........*....             *...             *....            =
 *
  52 ++                                                                    =
 |
     |                                                                     =
 |
  50 ++                                                                    =
 |
  48 ++                                                                    =
 |
     |                                                                     =
 |
  46 ++                                                                    =
 |
  44 ++                                                                    =
 |
     |                                                                     =
 |
  42 ++                                                                    =
 |
  40 O+                                          O                 O       =
 O
     |                          O        O                O                =
 |
  38 ++-------O--------O---------------------------------------------------=
-+


                                turbostat.CPU%c1

  35 ++----------------------------------*---------------------------------=
-+
     |                             ....      ...                        ...=
.*
  34 *+.......*........*........*..             .     ....*........*....   =
 |
  33 ++                                          *....                     =
 |
     |                                                                     =
 |
  32 ++                                                                    =
 |
     |                                                                     =
 |
  31 ++                                                                    =
 O
     |                                           O                         =
 |
  30 O+                         O                                  O       =
 |
  29 ++                                                                    =
 |
     |                 O                 O                                 =
 |
  28 ++       O                                           O                =
 |
     |                                                                     =
 |
  27 ++--------------------------------------------------------------------=
-+


                                turbostat.CPU%c6

  35 ++--------------------------------------------------------------------=
-+
     |        O        O                                  O                =
 |
     |                          O        O                                 =
 |
  30 O+                                          O                 O       =
 O
     |                                                                     =
 |
     |                                                                     =
 |
  25 ++                                                                    =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
     |                                                                     =
 |
  15 ++                                                                    =
 |
     |                                                                     =
 |
     *........*........*........*........*.......*........*........*.......=
.*
  10 ++--------------------------------------------------------------------=
-+


                                turbostat.Pkg%pc2

  14 ++-------O------------------------------------------------------------=
-+
     O                 O                                                   =
 |
  12 ++                         O                                          =
 |
     |                                                                     =
 |
     |                                   O                O        O       =
 |
  10 ++                                                                    =
 |
     |                                           O                         =
 O
   8 ++                                                                    =
 |
     |                                                                     =
 |
   6 ++                                                                    =
 |
     |                                                                     =
 |
     *........                                                             =
 |
   4 ++       *........*........*........*.......*........*........*.......=
.|
     |                                                                     =
 *
   2 ++--------------------------------------------------------------------=
-+


                                 turbostat.PkgWatt

  430 ++-------------------------------------------------------------------=
-+
      |    ....*........*.......*........*........*........    ....*.......=
.|
  420 *+...                                                *...            =
 *
  410 ++                                                                   =
 |
      |                                                                    =
 |
  400 ++                                                                   =
 |
  390 ++                                                                   =
 |
      |                                                                    =
 |
  380 ++                                                                   =
 |
  370 ++                                                                   =
 |
      |                                                            O       =
 |
  360 O+                        O                 O                        =
 O
  350 ++                O                O                                 =
 |
      |        O                                           O               =
 |
  340 ++-------------------------------------------------------------------=
-+


                                 turbostat.CorWatt

  360 ++------------------------*------------------------------------------=
-+
      *........*........*...             *........*........*.......*.......=
.*
  350 ++                                                                   =
 |
  340 ++                                                                   =
 |
      |                                                                    =
 |
  330 ++                                                                   =
 |
      |                                                                    =
 |
  320 ++                                                                   =
 |
      |                                                                    =
 |
  310 ++                                                                   =
 |
  300 ++                                                                   =
 |
      |                                           O                O       =
 O
  290 O+                        O                                          =
 |
      |                 O                O                 O               =
 |
  280 ++-------O-----------------------------------------------------------=
-+


                            pmeter.Average_Active_Power

  880 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  860 ++   ....*........*.......*........     ....*........*.......     ...=
.*
      *....                              *....                     *....   =
 |
  840 ++                                                                   =
 |
      |                                                                    =
 |
  820 ++                                                                   =
 |
      |                                                                    =
 |
  800 ++                                                                   =
 |
      |                                                                    =
 |
  780 ++                                                                   =
 |
      |                                                            O       =
 O
  760 O+                O       O                 O                        =
 |
      |        O                         O                 O               =
 |
  740 ++-------------------------------------------------------------------=
-+


                               aim7.time.system_time

  7000 ++------------------------------------------------------------------=
-+
       |                     ....*........    ....*........                =
 |
  6500 *+.......*.......*....             *...             *.......*.......=
.*
       |                                                                   =
 |
       |                                                                   =
 |
  6000 ++                                                                  =
 |
       |                                                                   =
 |
  5500 ++                                                                  =
 |
       |                                                                   =
 |
  5000 ++                                                                  =
 |
       |                                                                   =
 |
       O                         O                                         =
 O
  4500 ++                                         O        O       O       =
 |
       |                                  O                                =
 |
  4000 ++-------O-------O--------------------------------------------------=
-+


                         aim7.time.voluntary_context_switches

  4.5e+06 ++---------------------------------------------------------------=
-+
          |                    ....*...                                    =
 |
    4e+06 ++  ....*........*...        ...       ..*........*.......*......=
.|
          *...                            .  ....                          =
 *
  3.5e+06 ++                               *.                              =
 |
          |                                                                =
 |
    3e+06 ++                                                               =
 |
          |                                                                =
 |
  2.5e+06 ++                                                               =
 |
          |                                                                =
 |
    2e+06 ++                       O                                O      =
 |
          O                                        O        O              =
 O
  1.5e+06 ++      O        O               O                               =
 |
          |                                                                =
 |
    1e+06 ++---------------------------------------------------------------=
-+


                                 time.system_time

  7000 ++------------------------------------------------------------------=
-+
       |                     ....*........    ....*........                =
 |
  6500 *+.......*.......*....             *...             *.......*.......=
.*
       |                                                                   =
 |
       |                                                                   =
 |
  6000 ++                                                                  =
 |
       |                                                                   =
 |
  5500 ++                                                                  =
 |
       |                                                                   =
 |
  5000 ++                                                                  =
 |
       |                                                                   =
 |
       O                         O                                         =
 O
  4500 ++                                         O        O       O       =
 |
       |                                  O                                =
 |
  4000 ++-------O-------O--------------------------------------------------=
-+


                         time.percent_of_cpu_this_job_got

  6600 ++------------------------*----------------*------------------------=
-+
  6400 ++   ....*.......*....           ..  ....           *.......*.......=
.*
       *....                              *.                               =
 |
  6200 ++                                                                  =
 |
  6000 ++                                                                  =
 |
  5800 ++                                                                  =
 |
  5600 ++                                                                  =
 |
       |                                                                   =
 |
  5400 ++                                                                  =
 |
  5200 ++                                                                  =
 |
  5000 ++                                                                  =
 |
  4800 ++                                         O                O       =
 O
       O                         O        O                O               =
 |
  4600 ++       O       O                                                  =
 |
  4400 ++------------------------------------------------------------------=
-+


                            time.voluntary_context_switches

  4.5e+06 ++---------------------------------------------------------------=
-+
          |                    ....*...                                    =
 |
    4e+06 ++  ....*........*...        ...       ..*........*.......*......=
.|
          *...                            .  ....                          =
 *
  3.5e+06 ++                               *.                              =
 |
          |                                                                =
 |
    3e+06 ++                                                               =
 |
          |                                                                =
 |
  2.5e+06 ++                                                               =
 |
          |                                                                =
 |
    2e+06 ++                       O                                O      =
 |
          O                                        O        O              =
 O
  1.5e+06 ++      O        O               O                               =
 |
          |                                                                =
 |
    1e+06 ++---------------------------------------------------------------=
-+


                                  vmstat.system.in

  90000 ++-----------------------------------------------------------------=
-+
        |                     ....*.....               ....*........       =
 |
  85000 *+.......*.......*....          ..     ....*...             *......=
.*
        |                                 *....                            =
 |
        |                                                                  =
 |
  80000 ++                                                                 =
 |
        |                                                                  =
 |
  75000 ++                                                                 =
 |
        |                                                                  =
 |
  70000 ++                                                                 =
 |
        |                                                                  =
 |
        |                                          O                O      =
 O
  65000 O+                        O                        O               =
 |
        |        O       O                O                                =
 |
  60000 ++-----------------------------------------------------------------=
-+


                                  vmstat.system.cs

  80000 ++------------------------*----------------------------------------=
-+
  75000 *+.......*.......*....        ...        ..*.......*........*......=
.|
        |                                .   ....                          =
 *
  70000 ++                                *..                              =
 |
  65000 ++                                                                 =
 |
        |                                                                  =
 |
  60000 ++                                                                 =
 |
  55000 ++                                                                 =
 |
  50000 ++                                                                 =
 |
        |                                                                  =
 |
  45000 ++                                                                 =
 |
  40000 ++                                         O                O      =
 |
        O                         O                        O               =
 O
  35000 ++       O       O                O                                =
 |
  30000 ++-----------------------------------------------------------------=
-+


                            numa-vmstat.node1.numa_other

  85000 ++-----------------------------------------------------------------=
-+
        O        O       O        O       O        O       O        O      =
 O
  80000 ++                                                                 =
 |
        |                                                                  =
 |
  75000 ++                                                                 =
 |
        |                                                                  =
 |
  70000 ++                                                                 =
 |
        |                                                                  =
 |
  65000 ++                                                                 =
 |
        |                                                                  =
 |
  60000 ++                                                                 =
 |
        |                                                                  =
 |
  55000 ++                                                                 =
 |
        *........*.......*........*.......*........*.......*........*......=
.*
  50000 ++-----------------------------------------------------------------=
-+


                            numa-vmstat.node2.numa_other

  85000 ++------------------------*----------------------------------------=
-+
        *........*.......*....            *........*.......*........*......=
.*
  80000 ++                                                                 =
 |
        |                                                                  =
 |
  75000 ++                                                                 =
 |
        |                                                                  =
 |
  70000 ++                                                                 =
 |
        |                                                                  =
 |
  65000 ++                                                                 =
 |
        |                                                                  =
 |
  60000 ++                                                                 =
 |
        |                                                                  =
 |
  55000 ++                                                                 =
 |
        O        O       O        O       O        O       O        O      =
 O
  50000 ++-----------------------------------------------------------------=
-+


                                 proc-vmstat.numa_hit

   2.2e+06 ++--------------------------------------------------------------=
-+
  2.15e+06 O+                      O                                       =
 |
           |                                        O               O      =
 |
   2.1e+06 ++      O                        O               O              =
 |
  2.05e+06 ++                                                              =
 |
           |               O                                               =
 |
     2e+06 ++                                                              =
 O
  1.95e+06 ++                                                              =
 |
   1.9e+06 ++                                                              =
 |
           |                                                               =
 |
  1.85e+06 ++                                                              =
 |
   1.8e+06 ++                                                              =
 |
           *.......                                                        =
 |
  1.75e+06 ++      *.......*.......*........*.......*.......    ....*......=
.*
   1.7e+06 ++-----------------------------------------------*--------------=
-+


                                proc-vmstat.numa_local

   2.2e+06 ++--------------------------------------------------------------=
-+
  2.15e+06 O+                      O                                       =
 |
           |                                        O               O      =
 |
   2.1e+06 ++      O                        O               O              =
 |
  2.05e+06 ++                                                              =
 |
           |               O                                               =
 |
     2e+06 ++                                                              =
 O
  1.95e+06 ++                                                              =
 |
   1.9e+06 ++                                                              =
 |
           |                                                               =
 |
  1.85e+06 ++                                                              =
 |
   1.8e+06 ++                                                              =
 |
           *.......                                                        =
 |
  1.75e+06 ++      *.......*.......*........*.......*.......    ....*......=
.*
   1.7e+06 ++-----------------------------------------------*--------------=
-+


                              proc-vmstat.pgalloc_normal

  4.2e+06 ++---------------------------------------------------------------=
-+
          O                        O                                O      =
 |
    4e+06 ++                               O       O        O              =
 |
  3.8e+06 ++      O                                                        =
 |
          |                O                                               =
 |
  3.6e+06 ++                                                               =
 |
  3.4e+06 ++                                                               =
 O
          |                                                                =
 |
  3.2e+06 ++                                                               =
 |
    3e+06 ++                                                               =
 |
          |                                                                =
 |
  2.8e+06 ++                                                               =
 |
  2.6e+06 *+......                     ....*.......             ....*......=
.|
          |       *........*.......*...            *........*...           =
 *
  2.4e+06 ++---------------------------------------------------------------=
-+


                                  proc-vmstat.pgfree

  4.2e+06 ++---------------------------------------------------------------=
-+
          O                        O                                       =
 |
    4e+06 ++                               O       O        O       O      =
 |
  3.8e+06 ++      O                                                        =
 |
          |                O                                               =
 |
  3.6e+06 ++                                                               =
 O
  3.4e+06 ++                                                               =
 |
          |                                                                =
 |
  3.2e+06 ++                                                               =
 |
    3e+06 ++                                                               =
 |
          |                                                                =
 |
  2.8e+06 ++                                                               =
 |
  2.6e+06 *+......                     ....*.......             ....*......=
.|
          |       *........*.......*...            *........*...           =
 *
  2.4e+06 ++---------------------------------------------------------------=
-+


                                    softirqs.TIMER

  4.2e+06 ++--------------------------------------------------------*------=
-+
          |                                                       ..   .   =
 |
    4e+06 ++                                                    ..      .. =
 |
          |                                                    .          .=
.|
  3.8e+06 ++                   ....*.......    ....*........ ..            =
 |
          *.......*........*...            *...             *              =
 *
  3.6e+06 ++                                                               =
 |
          |                                                                =
 |
  3.4e+06 ++                                                               =
 |
          |                                                                =
 |
  3.2e+06 ++                       O                                O      =
 |
          O                                        O                       =
 O
    3e+06 ++                                                O              =
 |
          |                O               O                               =
 |
  2.8e+06 ++------O--------------------------------------------------------=
-+


                                  softirqs.HRTIMER

  11000 ++-----------------------------------------------------------------=
-+
        |            ....*........*.....                                   =
 |
  10000 *+.......*...                   ..     ....*.......*........*..... =
 |
   9000 ++                                *....                           .=
.|
        |                                                                  =
 *
   8000 ++                                                                 =
 |
   7000 ++                                                                 =
 |
        |                                                                  =
 |
   6000 ++                                                                 =
 |
   5000 ++                                                                 =
 |
        |                                                                  =
 |
   4000 O+                        O                O                O      =
 O
   3000 ++                                O                O               =
 |
        |        O       O                                                 =
 |
   2000 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#47.nr_switches

  40000 ++-----------------------------------------------------------------=
-+
        *......                                                            =
 |
  35000 ++     ..    ....*........                                         =
 |
  30000 ++       *...             *.......                                 =
 |
        |                                 *......                          =
 |
  25000 ++                                       ..                        =
 |
        |                                          *.......     ....*......=
.*
  20000 ++                                                 *....           =
 |
        |                                                                  =
 |
  15000 ++                                                                 =
 |
  10000 O+       O       O                O        O       O               =
 O
        |                                                                  =
 |
   5000 ++                                                          O      =
 |
        |                         O                                        =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#47.sched_goidle

  18000 ++-----------------------------------------------------------------=
-+
        *........    ....*......                                           =
 |
  16000 ++       *...           ..                                         =
 |
  14000 ++                        *.......                                 =
 |
        |                                 *......                          =
 |
  12000 ++                                       ..                        =
 |
  10000 ++                                         *.......*........*......=
.*
        |                                                                  =
 |
   8000 ++                                                                 =
 |
   6000 ++                                O                                =
 |
        O        O       O                         O       O               =
 O
   4000 ++                                                                 =
 |
   2000 ++                                                          O      =
 |
        |                         O                                        =
 |
      0 ++-----------------------------------------------------------------=
-+


                           sched_debug.cpu#109.nr_switches

  40000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  35000 ++             ..*......                                           =
 |
  30000 ++         ....         ..                                         =
 |
        |      ..*.               *.......                                 =
 |
  25000 ++ ....                           *....                            =
 |
        *..                                    ...                        .=
.*
  20000 ++                                        .                   .... =
 |
        |                                          *.......*........*.     =
 |
  15000 ++                                                                 =
 |
  10000 ++       O       O                O        O       O               =
 O
        O                                                                  =
 |
   5000 ++                                                          O      =
 |
        |                         O                                        =
 |
      0 ++-----------------------------------------------------------------=
-+


                          sched_debug.cpu#109.sched_goidle

  18000 ++-----------------------------------------------------------------=
-+
        |               .*....                                             =
 |
  16000 ++           ...      ...                                          =
 |
  14000 ++         ..            .                                         =
 |
        |      ..*.               *.......*...                             =
 |
  12000 ++ ....                               ..                           =
 |
  10000 *+.                                     ..                        .=
.*
        |                                         .    ....*........  .... =
 |
   8000 ++                                         *...             *.     =
 |
   6000 ++                                                                 =
 |
        |        O       O                O        O       O               =
 O
   4000 O+                                                                 =
 |
   2000 ++                                                          O      =
 |
        |                         O                                        =
 |
      0 ++-----------------------------------------------------------------=
-+


                            pmeter.performance_per_watt

  720 ++-------O-----------------------------------------------------------=
-+
  700 ++                O                                                  =
 |
      |                                  O                 O               =
 |
  680 ++                                          O                        =
 |
  660 ++                                                           O       =
 |
      |                                                                    =
 O
  640 O+                                                                   =
 |
  620 ++                        O                                          =
 |
  600 ++                                                                   =
 |
      |                                                                    =
 |
  580 ++                                                                   =
 |
  560 ++                                                                   =
 |
      *........                      ....*........     ....*.......*.......=
.*
  540 ++       *........*.......*....             *....                    =
 |
  520 ++-------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[6]:/.runnable_load_avg

  9 *+-------------------------------------------------------------*-------=
-+
    |    ...                                                      :     ...=
 |
    |       .                                                     :        =
.|
  8 ++       *.                                                  :         =
 *
    |          .                                                :          =
 |
    |           .                                               :          =
 |
  7 ++           ..                   ..*..                    :           =
 |
    |              .              ....     ..                  :           =
 |
  6 ++              .         .*..           ..               :            =
 |
    |                .     ...                 ..            :             =
 |
    |                   ...                                  :             =
 |
  5 ++                *.                         *....      :              =
 |
    |                                                 ...  :               =
 |
    |                                                    . :               =
 |
  4 ++----------------------------------------------------*----------------=
-+


                   sched_debug.cfs_rq[6]:/.utilization_load_avg

  550 ++-------------------------------------------------------------------=
-+
      *..                                                                  =
 |
      |  ..                                                        *       =
 |
  500 ++   ..                                     *               : +      =
 |
      |      ..                 *..              . :              :  +     =
 |
      |                        :   .           ..   :            :    +    =
 |
  450 ++       *.             :     ..        .     :           :      +   =
 |
      |          ..          :        .      .       :          :       +  =
 |
  400 ++           .        :          ..  ..         :        :         + =
 |
      |             .       :             .            :      :           +=
 |
      |              ..    :             *              :     :            =
+|
  350 ++               .  :                              :   :             =
 *
      |                  :                               :  :              =
 |
      |                 *                                 : :              =
 |
  300 ++---------------------------------------------------*---------------=
-+


                    sched_debug.cfs_rq[8]:/.runnable_load_avg

  50 ++------------------------------------------*-------------------------=
-+
  45 ++                                         : :                        =
 |
     |                                          :  :                       =
 |
  40 ++                                        :   :                       =
 |
  35 ++                                        :    :                      =
 |
     |                                        :      :                     =
 |
  30 ++                                      :        :                    =
 |
  25 ++                                      :        :                    =
 |
  20 ++                                     :          :                   =
 |
     |                                     :            :                  =
 |
  15 ++                                    :             :                 =
 |
  10 ++   ....*........                   :              :                 =
 |
     *....             *........*........ :               *........        =
 |
   5 ++                                  *                         *.......=
.*
   0 ++--------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[8]:/.utilization_load_avg

  1100 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  1000 ++                                         *                        =
 |
   900 ++                                        : :                       =
 |
       |                                         :  :                      =
 |
   800 ++                                       :    :                     =
 |
   700 ++                                      :      :                    =
 |
       |                                      :        :                   =
 |
   600 ++                                     :        :                   =
 |
   500 ++     ..*.....                       :          :                  =
 |
       |  ....        ..     ....*....      :            :                 =
 |
   400 *+.              *....         ...  :              :    ....*.......=
.|
   300 ++                                . :               *...            =
 *
       |                                  *                                =
 |
   200 ++------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[13]:/.runnable_load_avg

  30 ++--------------------------------------------------------------------=
-*
     |                                                                     =
:|
  25 ++                                                                    =
:|
     |                                                                    :=
 |
     |                                                                   : =
 |
  20 ++                                                                 :  =
 |
     |                                                                  :  =
 |
  15 ++                                                                :   =
 |
     |                                                                :    =
 |
  10 ++                                                              :     =
 |
     |                                 ..*.....                      :     =
 |
     |                             ....        ..     ....*........ :      =
 |
   5 *+.......*........*........*..              *....             *       =
 |
     |                                                                     =
 |
   0 ++--------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[13]:/.utilization_load_avg

  650 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 *
  600 ++                                                                   =
:|
  550 ++                                                                  :=
 |
      |                                                                  : =
 |
  500 ++                                                                :  =
 |
  450 ++                                                                :  =
 |
      |                                 .*..                           :   =
 |
  400 ++                              ..    .                         :    =
 |
  350 ++                            ..       ..           .*.....    :     =
 |
      |                           ..           .        ..       .. :      =
 |
  300 *+.......*........    ....*.              ..    ..           *       =
 |
  250 ++                *...                        ..                     =
 |
      |                                           *.                       =
 |
  200 ++-------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[25]:/.runnable_load_avg

  10 ++----------------*---------------------------------------------------=
-+
     |                + :                                                  =
 |
   9 ++              +  :                                                  =
 |
     |              +    :                                                 =
 |
     |             +      :                                                =
 |
   8 ++           +       :                                                =
 |
     |           +         :                                               =
 |
   7 *+.....    +           :                                              =
 |
     |      .. +            :                                              =
 |
   6 ++       *              :           *.......*....                     =
 |
     |                       :         ..             ...                  =
 |
     |                        :      ..                  .                 =
 |
   5 ++                        :   ..                     *......          =
 |
     |                         : ..                              ..        =
 |
   4 ++-------------------------*----------------------------------*-------=
-*


                    sched_debug.cfs_rq[26]:/.runnable_load_avg

    8 ++----------------*----------------*---------------------------------=
-+
      |             ...  :              :  ..                              =
 |
  7.5 ++         ...      :            :     .                             =
 |
    7 ++      .*.         :           :       .                            =
 |
      |     ..             :         :         ..                          =
 |
  6.5 ++  ..                :        :           .                         =
 |
      | ..                   :      :                                      =
 |
    6 *+                      :    :              *........*...            =
 |
      |                       :   :                            ...         =
 |
  5.5 ++                       : :                                .        =
 |
    5 ++                        *                                  *...    =
 |
      |                                                                ..  =
 |
  4.5 ++                                                                 ..=
 |
      |                                                                    =
.|
    4 ++-------------------------------------------------------------------=
-*


                   sched_debug.cfs_rq[28]:/.utilization_load_avg

  550 ++-------------------------------------------------------------------=
-+
      |        *....                                                       =
 |
  500 ++      :     ...                                                    =
 |
      |       :        .                      ....*.                       =
 |
  450 ++     :          *.               *....      .                      =
 |
      |     :             .             .            .             *.......=
.|
  400 ++   :               .          ..              ..         ..        =
 *
      |    :                ..       .                  .       .          =
 |
  350 ++  :                   .     .                    .     .           =
 |
      |  :                     .  ..                      .  ..            =
 |
  300 ++:                        .                          .              =
 |
      | :                       *                          *               =
 |
  250 ++                                                                   =
 |
      *                                                                    =
 |
  200 ++-------------------------------------------------------------------=
-+


                   sched_debug.cfs_rq[30]:/.runnable_load_avg

  35 ++--------------------------------------------------------------------=
-+
     |                                                ....*                =
 |
  30 ++                                          *....     :               =
 |
     |                                          :          :               =
 |
     |                                          :           :              =
 |
  25 ++                                        :             :             =
 |
     |                                        :              :             =
 |
  20 ++                                      :                :            =
 |
     |                                       :                 :           =
 |
  15 ++                                     :                   :          =
 |
     |                                     :                    :          =
 |
     |                                    :                      :         =
 |
  10 ++            ....*......            :                       :        =
 |
     |    ....*....           ..     ....*                        :        =
 |
   5 *+-------------------------*----------------------------------*-------=
-*


                    sched_debug.cfs_rq[45]:/.runnable_load_avg

    9 ++---------------------------------*---------------------------------=
-+
      |                                 . :                                =
 |
  8.5 ++                              ..  :                                =
 |
    8 ++                *..          .     :                               =
 |
      |                :   ..       .       :                              =
 |
  7.5 ++              :      ..   ..        :                              =
 |
      |               :        . .           :                             =
 |
    7 *+             :          *             :                            =
 |
      | ..          :                         :                            =
 |
  6.5 ++  .        :                           :                           =
 |
    6 ++   .      :                            :          .*..             =
 |
      |     ..   :                              :       ..    ..           =
 |
  5.5 ++      .  :                               :    ..        ..         =
 |
      |         :                                :  ..            .        =
 |
    5 ++-------*----------------------------------*----------------*-------=
-*


                   sched_debug.cfs_rq[46]:/.runnable_load_avg

  10 ++----------------*---------------------------------------------------=
-+
     |                : :                                                  =
 |
     |                : :                                                  =
 |
   9 ++              :   :                                                 =
 |
     |              :     :                                                =
 |
     |              :     :                                                =
 |
   8 ++            :       :                                               =
 |
     |             :        :                                              =
 |
   7 ++           :         :            *...                              =
 |
     |           :           :         ..    ...                           =
 |
     |           :           :        .         .                          =
 |
   6 *+...      :             :     ..           *........*....            =
.*
     |    ...  :               :   .                           ...      ...=
 |
     |       . :               : ..                               .  ...   =
 |
   5 ++-------*-----------------*----------------------------------*-------=
-+


                   sched_debug.cfs_rq[51]:/.runnable_load_avg

  9 ++-------------------------*-------------------------------------------=
-+
    |                         :  .                                         =
 |
    |                        :    .                                        =
 |
  8 ++                       :     ..                                      =
 |
    |                       :        .                                     =
 |
    |                      :          .                                    =
 |
  7 ++       *..          :            .                                   =
 |
    |       .   ..       :                                                 =
 |
  6 ++     .      ..    :               *........*........*........*....   =
 |
    |     .         ..  :                                               ...=
 |
    |   ..             :                                                   =
.|
  5 ++ .              *                                                    =
 *
    | .                                                                    =
 |
    |.                                                                     =
 |
  4 *+---------------------------------------------------------------------=
-+


                    sched_debug.cfs_rq[73]:/.runnable_load_avg

    6 ++---------------------------------*---------------------------------=
-+
      |                                 : :                                =
 |
  5.5 ++                               :   :                               =
 |
    5 ++                              :     :                              =
 *
      |                              :       :                             =
:|
  4.5 ++                             :        :                           :=
 |
      |                             :         :                           :=
 |
    4 ++               .*...       :           :                         : =
 |
      |             ...     ...   :             :                       :  =
 |
  3.5 ++         ...           . :               :                     :   =
 |
    3 *+.......*.               *                 *........*..        :    =
 |
      |                                                       ..     :     =
 |
  2.5 ++                                                        ..   :     =
 |
      |                                                           . :      =
 |
    2 ++-----------------------------------------------------------*-------=
-+


                   sched_debug.cfs_rq[99]:/.utilization_load_avg

  500 ++-------------------------------------------------------------------=
-+
      |                                                           .*.......=
.|
  450 ++                                                        ..         =
 *
  400 ++                                                      ..           =
 |
      |                                                     ..             =
 |
  350 ++                                                   *               =
 |
      |                                                  ..                =
 |
  300 ++                                               ..                  =
 |
      |                                              ..                    =
 |
  250 ++               .*...                       ..                      =
 |
  200 ++             ..     ...                  .*                        =
 |
      *......      ..          .              ...                          =
 |
  150 ++     ..  ..             *........  ...                             =
 |
      |        *.                        *.                                =
 |
  100 ++-------------------------------------------------------------------=
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



_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============6259560477275212903==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBhaW03CmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJlLXRlc3QKICB1
cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAKICBudW1hLXZt
c3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1zdGF0OgogICAg
aW50ZXJ2YWw6IDEwCiAgbWVtaW5mbzogCiAgc2xhYmluZm86IAogIGludGVycnVwdHM6IAogIGxv
Y2tfc3RhdDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGlycXM6IAogIGJkaV9kZXZfbWFwcGlu
ZzogCiAgZGlza3N0YXRzOiAKICBuZnNzdGF0OiAKICBjcHVpZGxlOiAKICBjcHVmcmVxLXN0YXRz
OiAKICB0dXJib3N0YXQ6IAogIHBtZXRlcjogCiAgc2NoZWRfZGVidWc6CiAgICBpbnRlcnZhbDog
NjAKZGVmYXVsdC13YXRjaGRvZ3M6CiAgd2F0Y2gtb29tOiAKICB3YXRjaGRvZzogCmNwdWZyZXFf
Z292ZXJub3I6IHBlcmZvcm1hbmNlCm1vZGVsOiBCcmlja2xhbmQgSXZ5IEJyaWRnZS1FWApucl9j
cHU6IDEyMAptZW1vcnk6IDUxMkcKaGRkX3BhcnRpdGlvbnM6IApzd2FwX3BhcnRpdGlvbnM6IApw
bWV0ZXJfc2VydmVyOiBsa3Atc3QwMQpwbWV0ZXJfZGV2aWNlOiB5b2tvZ2F3YS13dDMxMAphaW03
OgogIGxvYWQ6IDgwMDAKICB0ZXN0OiBkaXNrX3NyYwpicmFuY2g6IHl1eWFuZy9mb3ItbGtwCmNv
bW1pdDogMGU0ZDhjMzMxMzZjYTIzNTFjNGRhZWY0MzljMTlhMjZiNDNmNzJjNgpyZXBlYXRfdG86
IDIKdGVzdGJveDogYnJpY2tsYW5kMwp0Ym94X2dyb3VwOiBicmlja2xhbmQzCmtjb25maWc6IHg4
Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNS0wNS0xMyAxOTowOTo1Mi45MjU0MTY2MjkgKzA4
OjAwCnVzZXI6IGxrcApxdWV1ZTogdW5pdApjb21waWxlcjogZ2NjLTQuOQpoZWFkX2NvbW1pdDog
MGU0ZDhjMzMxMzZjYTIzNTFjNGRhZWY0MzljMTlhMjZiNDNmNzJjNgpiYXNlX2NvbW1pdDogYjc4
N2Y2OGMzNmQ0OWJiMWQ5MjM2ZjQwMzgxMzY0MWVmYTc0YTAzMQprZXJuZWw6ICIvcGtnL2xpbnV4
L3g4Nl82NC1yaGVsL2djYy00LjkvMGU0ZDhjMzMxMzZjYTIzNTFjNGRhZWY0MzljMTlhMjZiNDNm
NzJjNi92bWxpbnV6LTQuMS4wLXJjMS0wMDAwNC1nMGU0ZDhjMyIKcm9vdGZzOiBkZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9haW03L3BlcmZvcm1hbmNl
LTgwMDAtZGlza19zcmMvYnJpY2tsYW5kMy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4
Nl82NC1yaGVsL2djYy00LjkvMGU0ZDhjMzMxMzZjYTIzNTFjNGRhZWY0MzljMTlhMjZiNDNmNzJj
Ni8wIgpMS1BfU0VSVkVSOiBpbm4Kam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9icmlja2xhbmQz
L3VuaXRfYWltNy1wZXJmb3JtYW5jZS04MDAwLWRpc2tfc3JjLXg4Nl82NC1yaGVsLUhFQUQtMGU0
ZDhjMzMxMzZjYTIzNTFjNGRhZWY0MzljMTlhMjZiNDNmNzJjNi0wLTIwMTUwNTEzLTM1OTA5LWNs
bmpxay55YW1sIgpkZXF1ZXVlX3RpbWU6IDIwMTUtMDUtMTMgMjE6NTk6MDMuMTU1Mzk3NTU0ICsw
ODowMAptYXhfdXB0aW1lOiA4OTQuODM5OTk5OTk5OTk5OQppbml0cmQ6ICIvb3NpbWFnZS9kZWJp
YW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9v
dD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVkdWxlZC9icmlja2xhbmQzL3Vu
aXRfYWltNy1wZXJmb3JtYW5jZS04MDAwLWRpc2tfc3JjLXg4Nl82NC1yaGVsLUhFQUQtMGU0ZDhj
MzMxMzZjYTIzNTFjNGRhZWY0MzljMTlhMjZiNDNmNzJjNi0wLTIwMTUwNTEzLTM1OTA5LWNsbmpx
ay55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1yaGVsCi0gYnJhbmNoPXl1eWFu
Zy9mb3ItbGtwCi0gY29tbWl0PTBlNGQ4YzMzMTM2Y2EyMzUxYzRkYWVmNDM5YzE5YTI2YjQzZjcy
YzYKLSBCT09UX0lNQUdFPS9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8wZTRkOGMzMzEz
NmNhMjM1MWM0ZGFlZjQzOWMxOWEyNmI0M2Y3MmM2L3ZtbGludXotNC4xLjAtcmMxLTAwMDA0LWcw
ZTRkOGMzCi0gbWF4X3VwdGltZT04OTQKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L2FpbTcvcGVyZm9y
bWFuY2UtODAwMC1kaXNrX3NyYy9icmlja2xhbmQzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5j
Z3oveDg2XzY0LXJoZWwvZ2NjLTQuOS8wZTRkOGMzMzEzNmNhMjM1MWM0ZGFlZjQzOWMxOWEyNmI0
M2Y3MmM2LzAKLSBMS1BfU0VSVkVSPWlubgotIHwyLQoKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1
MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlz
X2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNv
ZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRp
c2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkw
IHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igpt
b2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8wZTRkOGMzMzEz
NmNhMjM1MWM0ZGFlZjQzOWMxOWEyNmI0M2Y3MmM2L21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIv
b3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFn
ZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3Np
bWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtw
L2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvYWltNy14ODZfNjQuY2d6
Igpqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDMwMzMuOTQgMTQzMC41OCA1MzcuMTIgMS8x
MTI4IDEzMjcwCnN0YXJ0X3RpbWU6ICcxNDMxNTI1NjIxJwplbmRfdGltZTogJzE0MzE1MjU3MjAn
CnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTUwNTEzLTE3MDkyNyIK

--===============6259560477275212903==
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
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCg==

--===============6259560477275212903==--

