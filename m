Content-Type: multipart/mixed; boundary="===============5295160259086768486=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [f2fs] 7b51bf49f4: -31.2% fsmark.files_per_sec
Date: Tue, 23 Feb 2016 08:59:41 +0800
Message-ID: <87a8ms1bsy.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5295160259086768486==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs dev-test
commit 7b51bf49f4825da09206c6d89e4aad5b4faa0a14 ("f2fs: set flush_merge by =
default")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/filesize/fs/iterations/kconfig/nr_directorie=
s/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_size=
/testcase:
  gcc-4.9/performance/1HDD/8K/f2fs/1x/x86_64-rhel/16d/256fpd/32t/debian-x86=
_64-2015-02-07.cgz/fsyncBeforeClose/lkp-ne04/400M/fsmark

commit: =

  312564ace97b1a18d02cd49c35948c82da441f14
  7b51bf49f4825da09206c6d89e4aad5b4faa0a14

312564ace97b1a18 7b51bf49f4825da09206c6d89e =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   4229542 =C2=B1  7%     -49.8%    2123569 =C2=B1  4%  fsmark.app_overhead
    480.02 =C2=B1  0%     -31.2%     330.03 =C2=B1  0%  fsmark.files_per_sec
    107.44 =C2=B1  0%     +44.7%     155.46 =C2=B1  0%  fsmark.time.elapsed=
_time
    107.44 =C2=B1  0%     +44.7%     155.46 =C2=B1  0%  fsmark.time.elapsed=
_time.max
   1317328 =C2=B1  0%      -2.9%    1279518 =C2=B1  0%  fsmark.time.file_sy=
stem_outputs
     16.50 =C2=B1  3%     -30.3%      11.50 =C2=B1  4%  fsmark.time.percent=
_of_cpu_this_job_got
    479210 =C2=B1  0%      -5.3%     453623 =C2=B1  1%  fsmark.time.volunta=
ry_context_switches
    135.22 =C2=B1  3%     +35.3%     183.00 =C2=B1  2%  uptime.boot
      1384 =C2=B1  5%     +23.4%       1708 =C2=B1  3%  uptime.idle
     20471 =C2=B1  1%     -42.0%      11875 =C2=B1  0%  softirqs.BLOCK
     19962 =C2=B1  1%     +28.8%      25718 =C2=B1 11%  softirqs.RCU
     23562 =C2=B1 10%     +19.2%      28089 =C2=B1  8%  softirqs.SCHED
     12.75 =C2=B1  1%     -15.8%      10.74 =C2=B1  6%  turbostat.CPU%c1
     30.81 =C2=B1  1%     -12.0%      27.13 =C2=B1  4%  turbostat.CPU%c3
     46.03 =C2=B1  1%     +12.8%      51.95 =C2=B1  1%  turbostat.CPU%c6
      5992 =C2=B1  0%     -32.3%       4058 =C2=B1  0%  vmstat.io.bo
     12690 =C2=B1  0%     -21.8%       9921 =C2=B1  4%  vmstat.system.cs
      1082 =C2=B1  1%     -29.0%     768.50 =C2=B1 16%  vmstat.system.in
    107.44 =C2=B1  0%     +44.7%     155.46 =C2=B1  0%  time.elapsed_time
    107.44 =C2=B1  0%     +44.7%     155.46 =C2=B1  0%  time.elapsed_time.m=
ax
     16.50 =C2=B1  3%     -30.3%      11.50 =C2=B1  4%  time.percent_of_cpu=
_this_job_got
      0.79 =C2=B1  6%     +20.5%       0.95 =C2=B1  2%  time.user_time
    197837 =C2=B1  3%     +21.5%     240374 =C2=B1  1%  numa-numastat.node0=
.local_node
    197837 =C2=B1  3%     +21.5%     240376 =C2=B1  1%  numa-numastat.node0=
.numa_hit
      0.50 =C2=B1173%    +450.0%       2.75 =C2=B1 47%  numa-numastat.node0=
.other_node
    181435 =C2=B1  4%     +23.8%     224592 =C2=B1  2%  numa-numastat.node1=
.local_node
    181437 =C2=B1  4%     +23.8%     224592 =C2=B1  2%  numa-numastat.node1=
.numa_hit
    374626 =C2=B1  0%     +22.8%     460072 =C2=B1  0%  proc-vmstat.numa_hit
    374623 =C2=B1  0%     +22.8%     460069 =C2=B1  0%  proc-vmstat.numa_lo=
cal
     33085 =C2=B1  0%     -29.8%      23229 =C2=B1  3%  proc-vmstat.pgactiv=
ate
     77779 =C2=B1  3%     +20.9%      94024 =C2=B1  1%  proc-vmstat.pgalloc=
_dma32
    322625 =C2=B1  1%     +22.4%     394983 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
    246180 =C2=B1  0%     +40.7%     346265 =C2=B1  0%  proc-vmstat.pgfault
    215983 =C2=B1  0%     +40.3%     303074 =C2=B1  0%  proc-vmstat.pgfree
     20880 =C2=B1  1%     -46.6%      11151 =C2=B1  4%  cpuidle.C1-NHM.usage
  31361970 =C2=B1  4%     -21.7%   24554439 =C2=B1 14%  cpuidle.C1E-NHM.time
     30519 =C2=B1  1%     -46.3%      16394 =C2=B1  3%  cpuidle.C1E-NHM.usa=
ge
 4.521e+08 =C2=B1  1%     +27.7%  5.772e+08 =C2=B1  6%  cpuidle.C3-NHM.time
    177038 =C2=B1  1%     +20.7%     213730 =C2=B1 14%  cpuidle.C3-NHM.usage
 1.045e+09 =C2=B1  0%     +54.9%  1.618e+09 =C2=B1  1%  cpuidle.C6-NHM.time
    260935 =C2=B1  2%     +22.0%     318337 =C2=B1  6%  cpuidle.C6-NHM.usage
 1.562e+08 =C2=B1  2%     +46.7%  2.292e+08 =C2=B1  1%  cpuidle.POLL.time
      0.00 =C2=B1 -1%      +Inf%      46222 =C2=B1  0%  latency_stats.avg.f=
2fs_issue_flush.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_f=
sync.entry_SYSCALL_64_fastpath
     26436 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.s=
ubmit_bio_wait.f2fs_issue_flush.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_rang=
e.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      51120 =C2=B1  0%  latency_stats.hits.=
f2fs_issue_flush.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_=
fsync.entry_SYSCALL_64_fastpath
     51073 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  latency_stats.hits.=
submit_bio_wait.f2fs_issue_flush.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_ran=
ge.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%     131989 =C2=B1  1%  latency_stats.max.f=
2fs_issue_flush.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_f=
sync.entry_SYSCALL_64_fastpath
    104864 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.s=
ubmit_bio_wait.f2fs_issue_flush.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_rang=
e.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     43003 =C2=B1 17%     -78.7%       9176 =C2=B1 49%  latency_stats.sum.a=
lloc_nid.[f2fs].f2fs_new_inode.[f2fs].f2fs_create.[f2fs].vfs_create.path_op=
enat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
  74613055 =C2=B1  3%     -85.8%   10617474 =C2=B1 11%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_new_inode.[f2fs].f2fs_create.[f2fs].vfs_cre=
ate.path_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
   3206072 =C2=B1  9%     -65.8%    1097191 =C2=B1  7%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_new_inode.[f2fs].f2fs_mkdir.[f2fs].vfs_mkdi=
r.SyS_mkdir.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%  2.363e+09 =C2=B1  0%  latency_stats.sum.f=
2fs_issue_flush.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_f=
sync.entry_SYSCALL_64_fastpath
   4821755 =C2=B1  4%    +137.7%   11463656 =C2=B1 38%  latency_stats.sum.f=
2fs_sync_fs.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_range.do_fsync.SyS_fsync=
.entry_SYSCALL_64_fastpath
  1.35e+09 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.s=
ubmit_bio_wait.f2fs_issue_flush.[f2fs].f2fs_sync_file.[f2fs].vfs_fsync_rang=
e.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
     44021 =C2=B1  1%     +20.0%      52824 =C2=B1  2%  numa-vmstat.node0.n=
r_active_file
    117.75 =C2=B1  5%     +42.0%     167.25 =C2=B1  4%  numa-vmstat.node0.n=
r_dirty
    113890 =C2=B1  1%     +10.0%     125333 =C2=B1  1%  numa-vmstat.node0.n=
r_file_pages
     82.75 =C2=B1 16%   +1248.0%       1115 =C2=B1 91%  numa-vmstat.node0.n=
r_inactive_anon
    125.25 =C2=B1 17%    +828.7%       1163 =C2=B1 87%  numa-vmstat.node0.n=
r_shmem
     11813 =C2=B1  2%     +15.0%      13580 =C2=B1  1%  numa-vmstat.node0.n=
r_slab_reclaimable
      4274 =C2=B1 13%     -24.3%       3234 =C2=B1 14%  numa-vmstat.node1.n=
r_active_anon
     28009 =C2=B1  1%     -22.5%      21700 =C2=B1  4%  numa-vmstat.node1.n=
r_active_file
      4244 =C2=B1 13%     -24.4%       3209 =C2=B1 14%  numa-vmstat.node1.n=
r_anon_pages
     40753 =C2=B1 33%     -47.2%      21497 =C2=B1 61%  numa-vmstat.node1.n=
r_dirtied
     87167 =C2=B1  1%     -14.0%      75003 =C2=B1  1%  numa-vmstat.node1.n=
r_file_pages
      8376 =C2=B1  2%     -22.2%       6517 =C2=B1  3%  numa-vmstat.node1.n=
r_slab_reclaimable
     40696 =C2=B1 33%     -47.3%      21465 =C2=B1 61%  numa-vmstat.node1.n=
r_written
    188090 =C2=B1  1%     +20.9%     227409 =C2=B1  1%  numa-meminfo.node0.=
Active
    176095 =C2=B1  1%     +20.0%     211303 =C2=B1  2%  numa-meminfo.node0.=
Active(file)
    455580 =C2=B1  1%     +10.0%     501341 =C2=B1  1%  numa-meminfo.node0.=
FilePages
    333.75 =C2=B1 16%   +1237.2%       4462 =C2=B1 91%  numa-meminfo.node0.=
Inactive(anon)
     47258 =C2=B1  2%     +15.0%      54325 =C2=B1  1%  numa-meminfo.node0.=
SReclaimable
    503.25 =C2=B1 17%    +824.8%       4654 =C2=B1 87%  numa-meminfo.node0.=
Shmem
    129176 =C2=B1  3%     -22.8%      99752 =C2=B1  2%  numa-meminfo.node1.=
Active
     17133 =C2=B1 13%     -24.4%      12949 =C2=B1 14%  numa-meminfo.node1.=
Active(anon)
    112043 =C2=B1  1%     -22.5%      86802 =C2=B1  4%  numa-meminfo.node1.=
Active(file)
     17007 =C2=B1 13%     -24.4%      12851 =C2=B1 14%  numa-meminfo.node1.=
AnonPages
    348677 =C2=B1  1%     -14.0%     300017 =C2=B1  1%  numa-meminfo.node1.=
FilePages
    236455 =C2=B1  1%      -9.9%     213055 =C2=B1  1%  numa-meminfo.node1.=
Inactive
    470973 =C2=B1  3%     -12.6%     411429 =C2=B1  3%  numa-meminfo.node1.=
MemUsed
     33510 =C2=B1  2%     -22.2%      26069 =C2=B1  3%  numa-meminfo.node1.=
SReclaimable
    584.68 =C2=B1 18%     +51.8%     887.72 =C2=B1  5%  sched_debug.cfs_rq:=
/.exec_clock.10
    531.49 =C2=B1 42%    +170.7%       1438 =C2=B1 72%  sched_debug.cfs_rq:=
/.exec_clock.11
    610.54 =C2=B1 17%     +94.1%       1185 =C2=B1 47%  sched_debug.cfs_rq:=
/.exec_clock.14
      1172 =C2=B1 20%     +31.4%       1540 =C2=B1  6%  sched_debug.cfs_rq:=
/.exec_clock.2
    981.99 =C2=B1  7%     +38.9%       1364 =C2=B1  9%  sched_debug.cfs_rq:=
/.exec_clock.4
      1133 =C2=B1 31%     +78.3%       2020 =C2=B1 13%  sched_debug.cfs_rq:=
/.exec_clock.5
    637.47 =C2=B1 24%     +76.7%       1126 =C2=B1 44%  sched_debug.cfs_rq:=
/.exec_clock.8
      1381 =C2=B1  0%     +16.0%       1602 =C2=B1  0%  sched_debug.cfs_rq:=
/.exec_clock.avg
    361.27 =C2=B1 16%     +31.3%     474.40 =C2=B1 17%  sched_debug.cfs_rq:=
/.exec_clock.min
    146.25 =C2=B1 17%     +55.6%     227.50 =C2=B1 18%  sched_debug.cfs_rq:=
/.load_avg.0
     36.25 =C2=B1 72%     -69.0%      11.25 =C2=B1113%  sched_debug.cfs_rq:=
/.load_avg.14
     67.25 =C2=B1 83%     -83.6%      11.00 =C2=B1 52%  sched_debug.cfs_rq:=
/.load_avg.6
      0.20 =C2=B1 17%     -44.0%       0.11 =C2=B1 28%  sched_debug.cfs_rq:=
/.nr_running.avg
      0.38 =C2=B1  4%     -20.1%       0.31 =C2=B1 13%  sched_debug.cfs_rq:=
/.nr_running.stddev
      2.75 =C2=B1 90%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq:=
/.nr_spread_over.12
      3.25 =C2=B1102%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.runnable_load_avg.14
      4562 =C2=B1126%    -167.7%      -3089 =C2=B1-133%  sched_debug.cfs_rq=
:/.spread0.6
      9049 =C2=B1 29%     -49.5%       4566 =C2=B1 61%  sched_debug.cfs_rq:=
/.spread0.max
    126.25 =C2=B1 32%     -55.8%      55.75 =C2=B1 39%  sched_debug.cfs_rq:=
/.util_avg.1
    124.29 =C2=B1 17%     -41.1%      73.21 =C2=B1 15%  sched_debug.cfs_rq:=
/.util_avg.avg
    322.00 =C2=B1 35%     -44.3%     179.50 =C2=B1 27%  sched_debug.cfs_rq:=
/.util_avg.max
    879630 =C2=B1  8%     -15.9%     739419 =C2=B1 11%  sched_debug.cpu.avg=
_idle.14
    906683 =C2=B1  8%     -15.2%     768624 =C2=B1 10%  sched_debug.cpu.avg=
_idle.3
     58510 =C2=B1  7%     +50.9%      88305 =C2=B1  4%  sched_debug.cpu.clo=
ck.0
     58514 =C2=B1  7%     +50.9%      88306 =C2=B1  4%  sched_debug.cpu.clo=
ck.1
     58516 =C2=B1  7%     +50.9%      88309 =C2=B1  4%  sched_debug.cpu.clo=
ck.10
     58510 =C2=B1  7%     +50.9%      88308 =C2=B1  4%  sched_debug.cpu.clo=
ck.11
     58516 =C2=B1  7%     +50.9%      88308 =C2=B1  4%  sched_debug.cpu.clo=
ck.12
     58517 =C2=B1  7%     +50.9%      88306 =C2=B1  4%  sched_debug.cpu.clo=
ck.13
     58518 =C2=B1  7%     +50.9%      88308 =C2=B1  4%  sched_debug.cpu.clo=
ck.14
     58517 =C2=B1  7%     +50.9%      88297 =C2=B1  4%  sched_debug.cpu.clo=
ck.15
     58511 =C2=B1  7%     +50.9%      88303 =C2=B1  4%  sched_debug.cpu.clo=
ck.2
     58512 =C2=B1  7%     +50.9%      88307 =C2=B1  4%  sched_debug.cpu.clo=
ck.3
     58513 =C2=B1  7%     +50.9%      88306 =C2=B1  4%  sched_debug.cpu.clo=
ck.4
     58515 =C2=B1  7%     +50.9%      88309 =C2=B1  4%  sched_debug.cpu.clo=
ck.5
     58516 =C2=B1  7%     +50.9%      88307 =C2=B1  4%  sched_debug.cpu.clo=
ck.6
     58516 =C2=B1  7%     +50.9%      88309 =C2=B1  4%  sched_debug.cpu.clo=
ck.7
     58516 =C2=B1  7%     +50.9%      88306 =C2=B1  4%  sched_debug.cpu.clo=
ck.8
     58516 =C2=B1  7%     +50.9%      88303 =C2=B1  4%  sched_debug.cpu.clo=
ck.9
     58515 =C2=B1  7%     +50.9%      88306 =C2=B1  4%  sched_debug.cpu.clo=
ck.avg
     58518 =C2=B1  7%     +50.9%      88310 =C2=B1  4%  sched_debug.cpu.clo=
ck.max
     58504 =C2=B1  7%     +50.9%      88291 =C2=B1  4%  sched_debug.cpu.clo=
ck.min
     58510 =C2=B1  7%     +50.9%      88305 =C2=B1  4%  sched_debug.cpu.clo=
ck_task.0
     58514 =C2=B1  7%     +50.9%      88306 =C2=B1  4%  sched_debug.cpu.clo=
ck_task.1
     58516 =C2=B1  7%     +50.9%      88309 =C2=B1  4%  sched_debug.cpu.clo=
ck_task.10
     58510 =C2=B1  7%     +50.9%      88308 =C2=B1  4%  sched_debug.cpu.clo=
ck_task.11
     58516 =C2=B1  7%     +50.9%      88308 =C2=B1  4%  sched_debug.cpu.clo=
ck_task.12
     58517 =C2=B1  7%     +50.9%      88306 =C2=B1  4%  sched_debug.cpu.clo=
ck_task.13
     58518 =C2=B1  7%     +50.9%      88308 =C2=B1  4%  sched_debug.cpu.clo=
ck_task.14
     58517 =C2=B1  7%     +50.9%      88297 =C2=B1  4%  sched_debug.cpu.clo=
ck_task.15
     58511 =C2=B1  7%     +50.9%      88303 =C2=B1  4%  sched_debug.cpu.clo=
ck_task.2
     58512 =C2=B1  7%     +50.9%      88307 =C2=B1  4%  sched_debug.cpu.clo=
ck_task.3
     58513 =C2=B1  7%     +50.9%      88306 =C2=B1  4%  sched_debug.cpu.clo=
ck_task.4
     58515 =C2=B1  7%     +50.9%      88309 =C2=B1  4%  sched_debug.cpu.clo=
ck_task.5
     58516 =C2=B1  7%     +50.9%      88307 =C2=B1  4%  sched_debug.cpu.clo=
ck_task.6
     58516 =C2=B1  7%     +50.9%      88309 =C2=B1  4%  sched_debug.cpu.clo=
ck_task.7
     58516 =C2=B1  7%     +50.9%      88306 =C2=B1  4%  sched_debug.cpu.clo=
ck_task.8
     58516 =C2=B1  7%     +50.9%      88303 =C2=B1  4%  sched_debug.cpu.clo=
ck_task.9
     58515 =C2=B1  7%     +50.9%      88306 =C2=B1  4%  sched_debug.cpu.clo=
ck_task.avg
     58518 =C2=B1  7%     +50.9%      88310 =C2=B1  4%  sched_debug.cpu.clo=
ck_task.max
     58504 =C2=B1  7%     +50.9%      88291 =C2=B1  4%  sched_debug.cpu.clo=
ck_task.min
      1791 =C2=B1  0%     +34.7%       2413 =C2=B1  9%  sched_debug.cpu.cur=
r->pid.max
    530.14 =C2=B1  8%     +16.6%     618.02 =C2=B1  8%  sched_debug.cpu.cur=
r->pid.stddev
    209.00 =C2=B1 33%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu.loa=
d.14
     38.27 =C2=B1 24%     -28.4%      27.41 =C2=B1 16%  sched_debug.cpu.loa=
d.avg
      9384 =C2=B1  3%     +58.1%      14840 =C2=B1 12%  sched_debug.cpu.nr_=
load_updates.0
      7128 =C2=B1 10%     +50.5%      10727 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.10
      5615 =C2=B1 10%     +22.5%       6878 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.11
      6988 =C2=B1  5%     +58.1%      11047 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.12
      6989 =C2=B1  2%     +58.4%      11074 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.14
      5668 =C2=B1 11%     +27.4%       7223 =C2=B1  6%  sched_debug.cpu.nr_=
load_updates.15
      9117 =C2=B1  2%     +54.8%      14117 =C2=B1  7%  sched_debug.cpu.nr_=
load_updates.2
      9689 =C2=B1  4%     +44.3%      13978 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.4
      7610 =C2=B1  7%     +18.6%       9027 =C2=B1  8%  sched_debug.cpu.nr_=
load_updates.5
      9283 =C2=B1  4%     +46.6%      13611 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.6
      7378 =C2=B1  7%     +28.5%       9482 =C2=B1 10%  sched_debug.cpu.nr_=
load_updates.7
      7014 =C2=B1  5%     +47.6%      10350 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.8
      5428 =C2=B1  9%     +24.7%       6772 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.9
      7531 =C2=B1  4%     +37.4%      10346 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.avg
     10658 =C2=B1  2%     +46.5%      15612 =C2=B1 12%  sched_debug.cpu.nr_=
load_updates.max
      5170 =C2=B1  8%     +23.5%       6383 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.min
      1642 =C2=B1  5%     +74.6%       2868 =C2=B1 16%  sched_debug.cpu.nr_=
load_updates.stddev
      0.19 =C2=B1 11%     -41.7%       0.11 =C2=B1 15%  sched_debug.cpu.nr_=
running.avg
      0.40 =C2=B1  9%     -21.9%       0.31 =C2=B1  7%  sched_debug.cpu.nr_=
running.stddev
     42853 =C2=B1  9%     +57.2%      67344 =C2=B1 18%  sched_debug.cpu.nr_=
switches.0
     20979 =C2=B1  6%    +101.3%      42226 =C2=B1 11%  sched_debug.cpu.nr_=
switches.12
     20834 =C2=B1 10%    +110.4%      43828 =C2=B1 23%  sched_debug.cpu.nr_=
switches.14
     31923 =C2=B1  3%    +111.3%      67446 =C2=B1 21%  sched_debug.cpu.nr_=
switches.2
     42296 =C2=B1 12%     +72.2%      72821 =C2=B1 30%  sched_debug.cpu.nr_=
switches.4
     32511 =C2=B1  3%     +88.7%      61355 =C2=B1 20%  sched_debug.cpu.nr_=
switches.6
     22802 =C2=B1  9%     +64.6%      37532 =C2=B1  1%  sched_debug.cpu.nr_=
switches.8
     26514 =C2=B1  1%     +51.3%      40127 =C2=B1  5%  sched_debug.cpu.nr_=
switches.avg
     58800 =C2=B1 28%     +55.9%      91652 =C2=B1 11%  sched_debug.cpu.nr_=
switches.max
     14014 =C2=B1 19%     +68.8%      23661 =C2=B1 19%  sched_debug.cpu.nr_=
switches.stddev
   -171.00 =C2=B1-29%     -83.5%     -28.25 =C2=B1-65%  sched_debug.cpu.nr_=
uninterruptible.1
    591.00 =C2=B1  3%     -33.0%     395.75 =C2=B1 16%  sched_debug.cpu.nr_=
uninterruptible.10
    240.00 =C2=B1 24%     -60.5%      94.75 =C2=B1 35%  sched_debug.cpu.nr_=
uninterruptible.11
    535.25 =C2=B1 11%     -41.4%     313.75 =C2=B1 25%  sched_debug.cpu.nr_=
uninterruptible.12
    525.75 =C2=B1 18%     -37.3%     329.75 =C2=B1 15%  sched_debug.cpu.nr_=
uninterruptible.14
    212.75 =C2=B1 19%     -53.2%      99.50 =C2=B1 58%  sched_debug.cpu.nr_=
uninterruptible.15
   -201.50 =C2=B1-28%     -65.1%     -70.25 =C2=B1-17%  sched_debug.cpu.nr_=
uninterruptible.3
   -252.50 =C2=B1-31%     -51.1%    -123.50 =C2=B1-18%  sched_debug.cpu.nr_=
uninterruptible.4
   -235.75 =C2=B1-15%     -84.1%     -37.50 =C2=B1-61%  sched_debug.cpu.nr_=
uninterruptible.5
   -284.75 =C2=B1-14%     -94.2%     -16.50 =C2=B1-317%  sched_debug.cpu.nr=
_uninterruptible.7
    162.50 =C2=B1 13%     -43.1%      92.50 =C2=B1 17%  sched_debug.cpu.nr_=
uninterruptible.9
      1.06 =C2=B1 13%     +29.9%       1.38 =C2=B1  1%  sched_debug.cpu.nr_=
uninterruptible.avg
    527.73 =C2=B1  5%     -18.1%     432.06 =C2=B1 12%  sched_debug.cpu.nr_=
uninterruptible.stddev
     21300 =C2=B1  5%     +98.4%      42250 =C2=B1 11%  sched_debug.cpu.sch=
ed_count.12
     20849 =C2=B1 10%    +110.3%      43854 =C2=B1 23%  sched_debug.cpu.sch=
ed_count.14
     34572 =C2=B1  5%    +100.5%      69304 =C2=B1 18%  sched_debug.cpu.sch=
ed_count.2
     22820 =C2=B1  9%     +67.8%      38294 =C2=B1  1%  sched_debug.cpu.sch=
ed_count.8
    148192 =C2=B1  0%      +9.7%     162582 =C2=B1  1%  sched_debug.cpu.sch=
ed_count.avg
     19147 =C2=B1 10%     +52.7%      29229 =C2=B1 21%  sched_debug.cpu.sch=
ed_goidle.0
      8541 =C2=B1  6%    +120.4%      18821 =C2=B1 12%  sched_debug.cpu.sch=
ed_goidle.12
      8536 =C2=B1 11%    +130.5%      19673 =C2=B1 26%  sched_debug.cpu.sch=
ed_goidle.14
     13824 =C2=B1  3%    +124.6%      31048 =C2=B1 23%  sched_debug.cpu.sch=
ed_goidle.2
     19038 =C2=B1 13%     +78.5%      33981 =C2=B1 32%  sched_debug.cpu.sch=
ed_goidle.4
     14186 =C2=B1  3%     +99.3%      28272 =C2=B1 22%  sched_debug.cpu.sch=
ed_goidle.6
      9322 =C2=B1 10%     +71.9%      16023 =C2=B1  1%  sched_debug.cpu.sch=
ed_goidle.8
     11604 =C2=B1  2%     +57.5%      18282 =C2=B1  6%  sched_debug.cpu.sch=
ed_goidle.avg
     27549 =C2=B1 30%     +59.8%      44033 =C2=B1 10%  sched_debug.cpu.sch=
ed_goidle.max
      6704 =C2=B1 20%     +66.7%      11174 =C2=B1 19%  sched_debug.cpu.sch=
ed_goidle.stddev
     53560 =C2=B1  3%     +48.0%      79293 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.0
      9727 =C2=B1 27%    +107.8%      20210 =C2=B1 45%  sched_debug.cpu.ttw=
u_count.10
      7802 =C2=B1  8%    +152.5%      19704 =C2=B1 33%  sched_debug.cpu.ttw=
u_count.12
      8037 =C2=B1 11%    +204.4%      24466 =C2=B1 48%  sched_debug.cpu.ttw=
u_count.14
     15381 =C2=B1  5%     +43.2%      22034 =C2=B1 13%  sched_debug.cpu.ttw=
u_count.4
     15299 =C2=B1 10%     +52.0%      23253 =C2=B1 19%  sched_debug.cpu.ttw=
u_count.6
     14342 =C2=B1  1%     +47.0%      21090 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.avg
     53630 =C2=B1  3%     +47.9%      79315 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.max
     11752 =C2=B1  5%     +52.6%      17935 =C2=B1  9%  sched_debug.cpu.ttw=
u_count.stddev
     13481 =C2=B1  4%     +23.5%      16655 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.0
      3872 =C2=B1  9%     -22.1%       3016 =C2=B1  9%  sched_debug.cpu.ttw=
u_local.1
      1972 =C2=B1 19%     +62.3%       3200 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.10
      1900 =C2=B1  8%     +85.7%       3528 =C2=B1 11%  sched_debug.cpu.ttw=
u_local.12
      2000 =C2=B1 17%     +71.8%       3436 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.14
      3086 =C2=B1  6%     +20.9%       3732 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.2
      2968 =C2=B1 14%     -21.6%       2326 =C2=B1 17%  sched_debug.cpu.ttw=
u_local.3
      2882 =C2=B1  9%     -23.8%       2195 =C2=B1 18%  sched_debug.cpu.ttw=
u_local.7
      2057 =C2=B1  9%     +61.1%       3313 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.8
     13534 =C2=B1  4%     +23.4%      16700 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.max
      1344 =C2=B1 10%     -18.5%       1095 =C2=B1 10%  sched_debug.cpu.ttw=
u_local.min
      2862 =C2=B1  4%     +25.1%       3581 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.stddev
     58515 =C2=B1  7%     +50.9%      88309 =C2=B1  4%  sched_debug.cpu_clk
     56859 =C2=B1  8%     +52.4%      86644 =C2=B1  5%  sched_debug.ktime
     58515 =C2=B1  7%     +50.9%      88309 =C2=B1  4%  sched_debug.sched_c=
lk


lkp-ne04: Nehalem-EP
Memory: 12G





  1.2e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    1e+06 ++ O   O     O   O            O  O      O  O  O   O              =
 |
          O         O         O     O         O                O           =
 |
          |                                                       O  O   O =
 O
   800000 ++                                                               =
 |
          |                                                                =
 |
   600000 ++                                                               =
 |
          |                                                                =
 |
   400000 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
   200000 ++                                                               =
 |
          |                                                                =
 |
        0 ++---------------------O-----------------------------------------=
-+




  60000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  50000 O+O  O O  O O  O   O  O O  O O  O O O  O O  O O  O O O  O O  O O  O=
 O
        |                                                                  =
 |
        |                                                                  =
 |
  40000 ++                                                                 =
 |
        |                                                                  =
 |
  30000 ++                                                                 =
 |
        |                                                                  =
 |
  20000 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
      0 ++---------------O-------------------------------------------------=
-+




  2.5e+09 ++---------------------------------------------------------------=
-+
          O O  O O O  O O    O O  O O O  O O O  O O O  O O  O O O  O O O  O=
 O
          |                                                                =
 |
    2e+09 ++                                                               =
 |
          |                                                                =
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
          |                                                                =
 |
    5e+08 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
        0 ++---------------O-----------------------------------------------=
-+




  50000 ++-----------------------------------------------------------------=
-+
  45000 O+O  O O  O O  O   O  O O  O O  O O O  O O  O O  O O O  O O  O O  O=
 O
        |                                                                  =
 |
  40000 ++                                                                 =
 |
  35000 ++                                                                 =
 |
        |                                                                  =
 |
  30000 ++                                                                 =
 |
  25000 ++                                                                 =
 |
  20000 ++                                                                 =
 |
        |                                                                  =
 |
  15000 ++                                                                 =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
   5000 ++                                                                 =
 |
      0 ++---------------O-------------------------------------------------=
-+




  160000 ++----------------------------------------------------------------=
-+
         O                     O O                  O    O        O        =
 |
  140000 ++   O    O O                     O O                       O O  O=
 |
  120000 ++O    O      O    O      O  O O      O  O   O    O  O O          =
 O
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
   20000 ++                                                                =
 |
         |                                                                 =
 |
       0 ++---------------O------------------------------------------------=
-+


                                   softirqs.BLOCK

  25000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
        *.**.**.**.**.**.     .**.**.**.**.*  **.**.**.**.*  **.**.* .**. *=
.|
  20000 ++               **  *             :  :           :  :      *    * =
 *
        |                 :  :             :  :           :  :             =
 |
        |                 :  :             :  :           :  :             =
 |
  15000 ++                 : :             : :            : :              =
 |
        O OO OO OO  O OO OO:OO OO OO OO OO OO:OO OO       : :              =
 |
  10000 ++                 : :              ::             ::              =
 |
        |                  ::               ::             ::              =
 |
        |                  ::               ::             ::              =
 |
   5000 ++                 ::               ::             ::              =
 |
        |                   :               :              :               =
 |
        |                   :               :              :               =
 |
      0 ++---------O--------*---------------*--------------*---------------=
-+


                                cpuidle.C1-NHM.usage

  25000 *+---**--------------------*-**-*--*------*-**-*--*----------------=
-+
        |+ *    **.**.**.          :     * :  **.*      * :  **.**.        =
 |
        | *              **  *.**.*        :  :           :  :     **.**.* =
.*
  20000 ++                :  :             :  :           :  :            *=
 |
        |                 :  :             :  :           :  :             =
 |
        |                  : :             : :            : :              =
 |
  15000 ++                 : :             : :            : :              =
 |
        |                  : :              ::             ::              =
 |
  10000 O+OO OO OO  O OO OO:OO OO OO OO OO OO:OO OO        ::              =
 |
        |                  ::               ::             ::              =
 |
        |                  ::               ::             ::              =
 |
   5000 ++                  :               :              :               =
 |
        |                   :               :              :               =
 |
        |                   :               :              :               =
 |
      0 ++---------O--------*---------------*--------------*---------------=
-+


                                cpuidle.C1E-NHM.usage

  40000 ++-----------------------------------------------------------------=
-+
        *. *.**. *.**.**.           .**.* .*       .**.* .*                =
 |
  35000 ++*     *        **  *.**.**     * :  **.**     * :  **.**.*       =
 |
  30000 ++                :  :             :  :           :  :      *.**.**=
.*
        |                 :  :             :  :           :  :             =
 |
  25000 ++                 : :             :  :           :  :             =
 |
        |                  : :             : :            : :              =
 |
  20000 ++                 : :             : :            : :              =
 |
        O    O  OO  O OO OO:OO OO OO OO OO OO:OO OO        ::              =
 |
  15000 ++OO  O            ::               ::             ::              =
 |
  10000 ++                 ::               ::             ::              =
 |
        |                   :               ::             ::              =
 |
   5000 ++                  :               :              :               =
 |
        |                   :               :              :               =
 |
      0 ++---------O--------*---------------*--------------*---------------=
-+


                                 cpuidle.C3-NHM.time

  7e+08 ++-----------------------------------------------------------------=
-+
        |       O                             O                            =
 |
  6e+08 O+OO OO  O              O           O  O                           =
 |
        |           O OO OO OO O  OO OO OO O     OO                        =
 |
  5e+08 ++                                                                 =
 |
        *.**.**.* .**.**.**  *.**.**. *.**.*  **. *. *.**.*  **. *.**.**.**=
.*
  4e+08 ++       *        :  :       *     :  :  *  *     :  :  *          =
 |
        |                 :  :             :  :           :  :             =
 |
  3e+08 ++                 : :             : :            : :              =
 |
        |                  : :             : :            : :              =
 |
  2e+08 ++                 ::               ::             ::              =
 |
        |                  ::               ::             ::              =
 |
  1e+08 ++                  :               :              :               =
 |
        |                   :               :              :               =
 |
      0 ++---------O--------*---------------*--------------*---------------=
-+


                                  cpuidle.C6-NHM.time

  1.8e+09 ++---------------------------------------------------------------=
-+
          |  OO O     OO OO OO OOO OO OO OO OO  O OO                       =
 |
  1.6e+09 OO     O O                           O                           =
 |
  1.4e+09 ++                                                               =
 |
          |                                                                =
 |
  1.2e+09 ++                                                               =
 |
    1e+09 **.**.**.**.**.**.*  ***.**.**.**.*  **.**.***.**  *.**.**.**.**.=
**
          |                 :  :            :  :          :  :             =
 |
    8e+08 ++                :  :            :  :           : :             =
 |
    6e+08 ++                : :             : :            : :             =
 |
          |                  ::              ::            : :             =
 |
    4e+08 ++                 ::              ::            ::              =
 |
    2e+08 ++                 ::              ::             :              =
 |
          |                  :               :              :              =
 |
        0 ++--------O--------*---------------*--------------*--------------=
-+


                                turbostat.CPU_c6

  60 ++--------------------------------------------------------------------=
-+
     |                    O                                                =
 |
  50 O+OO OO OO   OO OO O  O OO OO O OO OO OO O OO                         =
 |
     *.**.**.**.*.**.**.*   .**.**.*.**.**   .*.**.**.**.*   .**.*.**.**.**=
.*
     |                  :  *             :  *            :  *              =
 |
  40 ++                 :  :             :  :            :  :              =
 |
     |                   : :              : :             : :              =
 |
  30 ++                  : :              : :             : :              =
 |
     |                   : :              : :             : :              =
 |
  20 ++                  : :              : :             : :              =
 |
     |                   ::               ::              ::               =
 |
     |                   ::               ::              ::               =
 |
  10 ++                   :                :               :               =
 |
     |                    :                :               :               =
 |
   0 ++---------O---------*----------------*---------------*---------------=
-+


                               fsmark.files_per_sec

  500 ++------------------------------------------------------------*--*---=
-+
  450 *+**.**.**.**.*.**.*  **.**.*.**.**.*  **.*.**.**.**  *.*.**.*  *  **=
.*
      |                  :  :             :  :           :  :              =
 |
  400 ++                 :  :             :  :           :  :              =
 |
  350 ++                 :  :             :  :           :  :              =
 |
      O OO OO OO  O O OO OO:OO OO O OO OO OO:OO O O       : :              =
 |
  300 ++                 : :              : :             : :              =
 |
  250 ++                 : :              : :             : :              =
 |
  200 ++                  ::               ::             ::               =
 |
      |                   ::               ::             ::               =
 |
  150 ++                  ::               ::             ::               =
 |
  100 ++                  :                :               :               =
 |
      |                   :                :               :               =
 |
   50 ++                  :                :               :               =
 |
    0 ++---------O--------*----------------*---------------*---------------=
-+


                             fsmark.time.elapsed_time

  160 O+OO-OO-OO--O-O-OO-OO-OO-OO-O-OO-OO-OO-OO-O-O------------------------=
-+
      |                                                                    =
 |
  140 ++                                                                   =
 |
  120 ++                                                                   =
 |
      |   .**.  .**. .* .*   *.* .*.**.**.*   *. .**.**.**   .*. *.        =
 |
  100 *+**    **    *  * :  *   *         :  *  *        :  *   *  **.**.**=
.*
      |                  :  :             :  :           :  :              =
 |
   80 ++                 :  :             :  :            : :              =
 |
      |                  : :              : :             : :              =
 |
   60 ++                  ::               ::             : :              =
 |
   40 ++                  ::               ::             ::               =
 |
      |                   ::               ::             ::               =
 |
   20 ++                  :                :               :               =
 |
      |                   :                :               :               =
 |
    0 ++---------O--------*----------------*---------------*---------------=
-+


                           fsmark.time.elapsed_time.max

  160 O+OO-OO-OO--O-O-OO-OO-OO-OO-O-OO-OO-OO-OO-O-O------------------------=
-+
      |                                                                    =
 |
  140 ++                                                                   =
 |
  120 ++                                                                   =
 |
      |   .**.  .**. .* .*   *.* .*.**.**.*   *. .**.**.**   .*. *.        =
 |
  100 *+**    **    *  * :  *   *         :  *  *        :  *   *  **.**.**=
.*
      |                  :  :             :  :           :  :              =
 |
   80 ++                 :  :             :  :            : :              =
 |
      |                  : :              : :             : :              =
 |
   60 ++                  ::               ::             : :              =
 |
   40 ++                  ::               ::             ::               =
 |
      |                   ::               ::             ::               =
 |
   20 ++                  :                :               :               =
 |
      |                   :                :               :               =
 |
    0 ++---------O--------*----------------*---------------*---------------=
-+


                                 time.elapsed_time

  160 O+OO-OO-OO--O-O-OO-OO-OO-OO-O-OO-OO-OO-OO-O-O------------------------=
-+
      |                                                                    =
 |
  140 ++                                                                   =
 |
  120 ++                                                                   =
 |
      |   .**.  .**. .* .*   *.* .*.**.**.*   *. .**.**.**   .*. *.        =
 |
  100 *+**    **    *  * :  *   *         :  *  *        :  *   *  **.**.**=
.*
      |                  :  :             :  :           :  :              =
 |
   80 ++                 :  :             :  :            : :              =
 |
      |                  : :              : :             : :              =
 |
   60 ++                  ::               ::             : :              =
 |
   40 ++                  ::               ::             ::               =
 |
      |                   ::               ::             ::               =
 |
   20 ++                  :                :               :               =
 |
      |                   :                :               :               =
 |
    0 ++---------O--------*----------------*---------------*---------------=
-+


                               time.elapsed_time.max

  160 O+OO-OO-OO--O-O-OO-OO-OO-OO-O-OO-OO-OO-OO-O-O------------------------=
-+
      |                                                                    =
 |
  140 ++                                                                   =
 |
  120 ++                                                                   =
 |
      |   .**.  .**. .* .*   *.* .*.**.**.*   *. .**.**.**   .*. *.        =
 |
  100 *+**    **    *  * :  *   *         :  *  *        :  *   *  **.**.**=
.*
      |                  :  :             :  :           :  :              =
 |
   80 ++                 :  :             :  :            : :              =
 |
      |                  : :              : :             : :              =
 |
   60 ++                  ::               ::             : :              =
 |
   40 ++                  ::               ::             ::               =
 |
      |                   ::               ::             ::               =
 |
   20 ++                  :                :               :               =
 |
      |                   :                :               :               =
 |
    0 ++---------O--------*----------------*---------------*---------------=
-+


                                   vmstat.io.bo

  7000 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  6000 *+**.**.**.**.**.**  *.*.**.**.**.**  *.**.**.*.**.*  **.**.**.**.**=
.*
       |                 :  :             :  :            :  :             =
 |
  5000 ++                :  :             :  :            :  :             =
 |
       |                  : :              : :            :  :             =
 |
  4000 O+OO OO OO  O OO OO:OO O OO OO OO OO:OO OO O       : :              =
 |
       |                  : :              : :            : :              =
 |
  3000 ++                 : :              : :             ::              =
 |
       |                  ::               ::              ::              =
 |
  2000 ++                 ::               ::              ::              =
 |
       |                   :                :              ::              =
 |
  1000 ++                  :                :              :               =
 |
       |                   :                :              :               =
 |
     0 ++---------O--------*----------------*--------------*---------------=
-+


                                proc-vmstat.numa_hit

  500000 ++----------------------------------------------------------------=
-+
  450000 OO OO OO O  OO OO OO OO OO OO OO OO OO OO O                       =
 |
         |                                                                 =
 |
  400000 **. *.* .**.**.**.*  **.* .**.**.**  *.**.**.**.**  *.**.**.    *.=
 *
  350000 ++ *   *          :  :   *        :  :           :  :       **.*  =
*|
         |                 :  :            :  :           :  :             =
 |
  300000 ++                : :              : :            : :             =
 |
  250000 ++                : :              : :            : :             =
 |
  200000 ++                : :              : :            : :             =
 |
         |                  ::              ::             ::              =
 |
  150000 ++                 ::              ::             ::              =
 |
  100000 ++                 ::              ::             ::              =
 |
         |                  :                :              :              =
 |
   50000 ++                 :                :              :              =
 |
       0 ++--------O--------*----------------*--------------*--------------=
-+


                               proc-vmstat.numa_local

  500000 ++----------------------------------------------------------------=
-+
  450000 OO OO OO O  OO OO OO OO OO OO OO OO OO OO O                       =
 |
         |                                                                 =
 |
  400000 **. *.* .**.**.**.*  **.* .**.**.**  *.**.**.**.**  *.**.**.    *.=
 *
  350000 ++ *   *          :  :   *        :  :           :  :       **.*  =
*|
         |                 :  :            :  :           :  :             =
 |
  300000 ++                : :              : :            : :             =
 |
  250000 ++                : :              : :            : :             =
 |
  200000 ++                : :              : :            : :             =
 |
         |                  ::              ::             ::              =
 |
  150000 ++                 ::              ::             ::              =
 |
  100000 ++                 ::              ::             ::              =
 |
         |                  :                :              :              =
 |
   50000 ++                 :                :              :              =
 |
       0 ++--------O--------*----------------*--------------*--------------=
-+


                             proc-vmstat.pgalloc_normal

  450000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  400000 OO OO OO O  OO OO OO OO OO OO OO OO OO OO O                       =
 |
  350000 ++                                                                =
 |
         **.**.**.**.**.**.*  **.**.**.**.**  *.**.**.**.**  *.**.**.**.**.=
**
  300000 ++                :  :            :  :           :  :             =
 |
  250000 ++                :  :            :  :           :  :             =
 |
         |                 : :              : :            : :             =
 |
  200000 ++                : :              : :            : :             =
 |
  150000 ++                 ::              : :            : :             =
 |
         |                  ::              ::             ::              =
 |
  100000 ++                 ::              ::             ::              =
 |
   50000 ++                 :                :              :              =
 |
         |                  :                :              :              =
 |
       0 ++--------O--------*----------------*--------------*--------------=
-+


                                 proc-vmstat.pgfree

  350000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  300000 OO OO OO O  OO OO OO OO OO OO OO OO OO OO O                       =
 |
         |                                                                 =
 |
  250000 ++                                                                =
 |
         **.**.**.**.**.**.*  **.**.**.**.**  *.**.**.**.**  *.**.**.**.**.=
**
  200000 ++                :  :            :  :           :  :             =
 |
         |                 :  :            :  :           :  :             =
 |
  150000 ++                : :              : :            : :             =
 |
         |                 : :              : :            : :             =
 |
  100000 ++                 ::              ::             ::              =
 |
         |                  ::              ::             ::              =
 |
   50000 ++                 :                :              :              =
 |
         |                  :                :              :              =
 |
       0 ++--------O--------*----------------*--------------*--------------=
-+


                                 proc-vmstat.pgfault

  350000 OO-OO-OO-O--OO-OO-OO-OO-OO-OO-OO-OO-OO-OO-O-----------------------=
-+
         |                                                                 =
 |
  300000 ++                                                                =
 |
         |                                                                 =
 |
  250000 **.**.**.**.**.**.*  **.**.**.**.**  *.**.**.**.**  *.**.**.**.**.=
**
         |                 :  :            :  :           :  :             =
 |
  200000 ++                :  :            :  :           :  :             =
 |
         |                 : :              : :            : :             =
 |
  150000 ++                : :              : :            : :             =
 |
         |                  ::              : :            : :             =
 |
  100000 ++                 ::              ::             ::              =
 |
         |                  ::              ::             ::              =
 |
   50000 ++                 :                :              :              =
 |
         |                  :                :              :              =
 |
       0 ++--------O--------*----------------*--------------*--------------=
-+


                          sched_debug.cpu.nr_load_updates.2

  16000 ++-----------------------------------------------------------------=
-+
        O  O  O OO                            OO                           =
 |
  14000 ++O  O      O  O  O OO  O OO OO O  OO     O                        =
 |
  12000 ++            O  O     O         O       O                         =
 |
        |                                                                  =
 |
  10000 ++       *. *. *.            *              *               *      =
 |
        |.* .**.*  *  *  **  *.**.* + :        *.* + :        *.**.* + *.**=
.*
   8000 *+ *              :  :     *  *.**.*  *   *  *.**.*  *        *    =
 |
        |                  : :             :  :           :  :             =
 |
   6000 ++                 : :             : :            : :              =
 |
   4000 ++                 : :             : :            : :              =
 |
        |                  ::               ::             ::              =
 |
   2000 ++                  :               ::             ::              =
 |
        |                   :               :              :               =
 |
      0 ++---------O--------*---------------*--------------*---------------=
-+


                          sched_debug.cpu.nr_load_updates.6

  16000 ++-----------------------------------------------------------------=
-+
        |                                     O                            =
 |
  14000 O+   O   O  O OO  O O   O OO OO OO  O  O  O                        =
 |
  12000 ++OO  O O        O   O O           O     O                         =
 |
        |                                                                  =
 |
  10000 ++                   *                                             =
 |
        |.* .**. *.**.**.**  :+ *.* .*   *.*   *.* .*   *.*   *.**.**.**.**=
.*
   8000 *+ *    *         :  : *   *  *.*  :  *   *  *.*  :  *             =
 |
        |                  : :             :  :           :  :             =
 |
   6000 ++                 : :             : :            : :              =
 |
   4000 ++                 ::               ::             ::              =
 |
        |                  ::               ::             ::              =
 |
   2000 ++                  :               ::             ::              =
 |
        |                   :               :              :               =
 |
      0 ++---------O--------*---------------*--------------*---------------=
-+


                            sched_debug.cpu.nr_switches.8

  60000 ++-----------------------------------------------------------------=
-+
        |                    O                                             =
 |
  50000 ++                                  O                              =
 |
        |                                                                  =
 |
        | OO     O          O  O  OO OO                                    =
 |
  40000 O+    O O     OO OO     O       O  O  OO OO                        =
 |
        |    O      O                    O                                 =
 |
  30000 ++                                                                 =
 |
        |                              .*             .*                  *=
.|
  20000 *+**.**.**.**.**.**  *.**.**.**  :.*  **.**.**  :.*  **.**.**.**.* =
 *
        |                 :  :           * :  :         * :  :             =
 |
        |                  : :             : :            : :              =
 |
  10000 ++                 ::               ::             ::              =
 |
        |                   :               :              :               =
 |
      0 ++---------O--------*---------------*--------------*---------------=
-+


                          sched_debug.cpu.nr_load_updates.8

  12000 ++-----------------------------------------------------------------=
-+
        O  O OO OO     O OO O   O O  O  O   O O                            =
 |
  10000 ++O         O O      O O   O  O  O O   O OO                        =
 |
        |                                                                  =
 |
        |                                                                  =
 |
   8000 ++        .*      *     *.              .*             .*         *=
.|
        |.* .**. *  *.**.*:  *. : **.          *  *.          *  *.**. *.* =
 *
   6000 *+ *    *         :  : *     **.**.*  *     **.**.*  *        *    =
 |
        |                  : :             :  :           :  :             =
 |
   4000 ++                 : :             : :            : :              =
 |
        |                  : :             : :            : :              =
 |
        |                  ::               ::             ::              =
 |
   2000 ++                  :               ::             ::              =
 |
        |                   :               :              :               =
 |
      0 ++---------O--------*---------------*--------------*---------------=
-+


                            sched_debug.cpu.sched_count.8

  80000 ++-----------------------------------------------------------------=
-+
        |              O                                                   =
 |
  70000 ++                                                                 =
 |
  60000 ++                                                                 =
 |
        |                    O                                             =
 |
  50000 ++                                  O                              =
 |
        |  O                      O  O                                     =
 |
  40000 O+O   O OO    O  OO O  OO  O  O O  O  OO OO                        =
 |
        |    O      O                    O                                 =
 |
  30000 ++                                                                *=
.|
  20000 *+ *.**. *.**.**.**  *.**.**. *.**.*  * .**. *.**.*  * .**. *.**. :=
 *
        | *     *          : :       *     :  :*    *     :  :*    *     * =
 |
  10000 ++                 : :              ::             ::              =
 |
        |                   :               ::             ::              =
 |
      0 ++---------O--------*---------------*--------------*---------------=
-+


                           sched_debug.cpu.sched_goidle.8

  25000 ++-------------------O---------------------------------------------=
-+
        |                                   O                              =
 |
        |                                                                  =
 |
  20000 ++                                                                 =
 |
        | OO     O          O  OO OO OO                                    =
 |
        O     O O     OO OO             OO O  OO OO                        =
 |
  15000 ++   O      O                                                      =
 |
        |                                                                  =
 |
  10000 ++                             .*             .*                  *=
.|
        *. *.**.  .**.**.**  *.**.**. *  :.*    .**. *  :.*    .**. *.**. :=
 *
        | *     **        :  :       *   * :  **    *   * :  **    *     * =
 |
   5000 ++                 : :             :  :           :  :             =
 |
        |                  ::               ::             ::              =
 |
        |                   :               ::             ::              =
 |
      0 ++---------O--------*---------------*--------------*---------------=
-+


                         sched_debug.cpu.nr_load_updates.12

  12000 ++-------------O-----------------------O---------------------------=
-+
        O OO  O OO  O O   O O   O OO OO O  OO O   O                        =
 |
  10000 ++   O           O   O O         O       O                         =
 |
        |                                                                  =
 |
        |                                                                  =
 |
   8000 ++        .**. *.*                     *.             *.          *=
.|
        |.* .**. *    *   *  *. *.*            : *            : **.**.  .* =
 *
   6000 *+ *    *         :  : *   *.**.**.*  *   *.**.**.*  *        **   =
 |
        |                  : :             :  :           :  :             =
 |
   4000 ++                 : :             : :            : :              =
 |
        |                  : :             : :            : :              =
 |
        |                  ::               ::             ::              =
 |
   2000 ++                  :               ::             ::              =
 |
        |                   :               :              :               =
 |
      0 ++---------O--------*---------------*--------------*---------------=
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

--===============5295160259086768486==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogZnNtYXJrCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9uaXRv
cgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICBoZWFydGJlYXQ6IAogIHZtc3RhdDog
CiAgbnVtYS1udW1hc3RhdDogCiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAgcHJv
Yy12bXN0YXQ6IAogIHByb2Mtc3RhdDoKICAgIGludGVydmFsOiAxMAogIG1lbWluZm86IAogIHNs
YWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6IAog
IHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0czogCiAgbmZzc3RhdDog
CiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9zdGF0OiAKICBwbWV0ZXI6IAog
IHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDYwCmNwdWZyZXFfZ292ZXJub3I6IHBlcmZvcm1h
bmNlCmRlZmF1bHQtd2F0Y2hkb2dzOgogIG9vbS1raWxsZXI6IAogIHdhdGNoZG9nOiAKY29tbWl0
OiA3YjUxYmY0OWY0ODI1ZGEwOTIwNmM2ZDg5ZTRhYWQ1YjRmYWEwYTE0Cm1vZGVsOiBOZWhhbGVt
LUVQCm1lbW9yeTogMTJHCmhkZF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1TVDM1
MDA1MTROU185V0owM0VCQS1wYXJ0MyIKc3dhcF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlk
L2F0YS1TVDMxMjAwMjZBU181TVMwN0hBMi1wYXJ0MiIKcm9vdGZzX3BhcnRpdGlvbjogIi9kZXYv
ZGlzay9ieS1pZC9hdGEtU1QzNTAwNTE0TlNfOVdKMDNFQkEtcGFydDEiCmNhdGVnb3J5OiBiZW5j
aG1hcmsKaXRlcmF0aW9uczogMXgKbnJfdGhyZWFkczogMzJ0CmRpc2s6IDFIREQKZnM6IGYyZnMK
ZnMyOiAKZnNtYXJrOgogIGZpbGVzaXplOiA4SwogIHRlc3Rfc2l6ZTogNDAwTQogIHN5bmNfbWV0
aG9kOiBmc3luY0JlZm9yZUNsb3NlCiAgbnJfZGlyZWN0b3JpZXM6IDE2ZAogIG5yX2ZpbGVzX3Bl
cl9kaXJlY3Rvcnk6IDI1NmZwZApxdWV1ZTogYmlzZWN0CnRlc3Rib3g6IGxrcC1uZTA0CnRib3hf
Z3JvdXA6IGxrcC1uZTA0Cmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNi0w
Mi0yMCAxNToyMzo0MS4xNTAzMTc0MzkgKzA4OjAwCmNvbXBpbGVyOiBnY2MtNC45CnJvb3Rmczog
ZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegppZDogYTgzZGFkNjZjMmQyOGQyM2Q2MWY3ZGI0
MzZlNjg2MWJmODdiYjAxOAp1c2VyOiBsa3AKaGVhZF9jb21taXQ6IDQwYWI0MDBkYWNkMWJkM2Zm
YmRlYjhhYTA3OGUyODg1YmRkM2NmZDUKYmFzZV9jb21taXQ6IDE4NTU4Y2FlMDI3MmY4ZmQ5NjQ3
ZTY5ZDNmZWMxNTY1YTc5NDk4NjUKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAx
NjAyMTkxMgpyZXN1bHRfcm9vdDogIi9yZXN1bHQvZnNtYXJrL3BlcmZvcm1hbmNlLTF4LTMydC0x
SERELWYyZnMtOEstNDAwTS1mc3luY0JlZm9yZUNsb3NlLTE2ZC0yNTZmcGQvbGtwLW5lMDQvZGVi
aWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzdiNTFiZjQ5ZjQ4
MjVkYTA5MjA2YzZkODllNGFhZDViNGZhYTBhMTQvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxl
ZC9sa3AtbmUwNC9iaXNlY3RfZnNtYXJrLXBlcmZvcm1hbmNlLTF4LTMydC0xSERELWYyZnMtOEst
NDAwTS1mc3luY0JlZm9yZUNsb3NlLTE2ZC0yNTZmcGQtZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNnei14ODZfNjQtcmhlbC03YjUxYmY0OWY0ODI1ZGEwOTIwNmM2ZDg5ZTRhYWQ1YjRmYWEwYTE0
LTIwMTYwMjIwLTQ5NzQyLTE2eDcya3YtMC55YW1sIgpucl9jcHU6ICIkKG5wcm9jKSIKbWF4X3Vw
dGltZTogOTMzLjUyMDAwMDAwMDAwMDEKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0w
Ci0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbGtwLW5lMDQvYmlzZWN0X2ZzbWFyay1w
ZXJmb3JtYW5jZS0xeC0zMnQtMUhERC1mMmZzLThLLTQwME0tZnN5bmNCZWZvcmVDbG9zZS0xNmQt
MjU2ZnBkLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtN2I1MWJmNDlm
NDgyNWRhMDkyMDZjNmQ4OWU0YWFkNWI0ZmFhMGExNC0yMDE2MDIyMC00OTc0Mi0xNng3Mmt2LTAu
eWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1k
ZXZlbC9kZXZlbC1ob3VybHktMjAxNjAyMTkxMgotIGNvbW1pdD03YjUxYmY0OWY0ODI1ZGEwOTIw
NmM2ZDg5ZTRhYWQ1YjRmYWEwYTE0Ci0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVs
L2djYy00LjkvN2I1MWJmNDlmNDgyNWRhMDkyMDZjNmQ4OWU0YWFkNWI0ZmFhMGExNC92bWxpbnV6
LTQuNS4wLXJjMi0wMDMwNi1nN2I1MWJmNAotIG1heF91cHRpbWU9OTMzCi0gUkVTVUxUX1JPT1Q9
L3Jlc3VsdC9mc21hcmsvcGVyZm9ybWFuY2UtMXgtMzJ0LTFIREQtZjJmcy04Sy00MDBNLWZzeW5j
QmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC9sa3AtbmUwNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6L3g4Nl82NC1yaGVsL2djYy00LjkvN2I1MWJmNDlmNDgyNWRhMDkyMDZjNmQ4OWU0YWFkNWI0
ZmFhMGExNC8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMwLDEx
NTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5
c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBz
b2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1k
aXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5
MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNneiIK
bW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvN2I1MWJmNDlm
NDgyNWRhMDkyMDZjNmQ4OWU0YWFkNWI0ZmFhMGExNC9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAi
L29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1h
Z2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29z
aW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xr
cC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIw
MTUtMDItMDcuY2d6L2ZzLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3ovZnMyLmNneiwvbGtwL2JlbmNobWFya3MvZnNtYXJrLmNneiIKbGludXhfaGVhZGVyc19p
bml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvN2I1MWJmNDlmNDgyNWRhMDky
MDZjNmQ4OWU0YWFkNWI0ZmFhMGExNC9saW51eC1oZWFkZXJzLmNneiIKcmVwZWF0X3RvOiAyCmtl
cm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS83YjUxYmY0OWY0ODI1ZGEwOTIw
NmM2ZDg5ZTRhYWQ1YjRmYWEwYTE0L3ZtbGludXotNC41LjAtcmMyLTAwMzA2LWc3YjUxYmY0Igpk
ZXF1ZXVlX3RpbWU6IDIwMTYtMDItMjAgMTU6MzI6NTYuNzY1OTEyNjcyICswODowMApqb2Jfc3Rh
dGU6IGZpbmlzaGVkCmxvYWRhdmc6IDMwLjgwIDEzLjgyIDUuMjkgMi8yNTEgNTA0NgpzdGFydF90
aW1lOiAnMTQ1NTk1MzYxMCcKZW5kX3RpbWU6ICcxNDU1OTUzNzY2Jwp2ZXJzaW9uOiAiL2xrcC9s
a3AvLnNyYy0yMDE2MDIxOS0yMjQyMDUiCg==

--===============5295160259086768486==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMi0yMCAxNTozMzoyNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yMCAxNTozMzoyNyBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yMCAxNTozMzoyNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDItMjAgMTU6MzM6MjcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTIwIDE1OjMzOjI3IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMi0yMCAxNTozMzoyNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDIt
MjAgMTU6MzM6MjcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTIwIDE1OjMzOjI3IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMi0yMCAxNTozMzoyNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yMCAx
NTozMzoyNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1My9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yMCAxNTozMzoyNyBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMi0yMCAxNTozMzoyNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yMCAxNTozMzoy
NyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ni9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yMCAxNTozMzoyNyBlY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wMi0yMCAxNTozMzoyNyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yMCAxNTozMzoyNyBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMi0yMCAxNTozMzoyNyBta2ZzIC10IGYyZnMgL2Rldi9zZGEzCjIw
MTYtMDItMjAgMTU6MzM6MjkgbW91bnQgLXQgZjJmcyAvZGV2L3NkYTMgL2ZzL3NkYTMKMjAxNi0w
Mi0yMCAxNTozMzozMCAuL2ZzX21hcmsgLWQgL2ZzL3NkYTMvMSAtZCAvZnMvc2RhMy8yIC1kIC9m
cy9zZGEzLzMgLWQgL2ZzL3NkYTMvNCAtZCAvZnMvc2RhMy81IC1kIC9mcy9zZGEzLzYgLWQgL2Zz
L3NkYTMvNyAtZCAvZnMvc2RhMy84IC1kIC9mcy9zZGEzLzkgLWQgL2ZzL3NkYTMvMTAgLWQgL2Zz
L3NkYTMvMTEgLWQgL2ZzL3NkYTMvMTIgLWQgL2ZzL3NkYTMvMTMgLWQgL2ZzL3NkYTMvMTQgLWQg
L2ZzL3NkYTMvMTUgLWQgL2ZzL3NkYTMvMTYgLWQgL2ZzL3NkYTMvMTcgLWQgL2ZzL3NkYTMvMTgg
LWQgL2ZzL3NkYTMvMTkgLWQgL2ZzL3NkYTMvMjAgLWQgL2ZzL3NkYTMvMjEgLWQgL2ZzL3NkYTMv
MjIgLWQgL2ZzL3NkYTMvMjMgLWQgL2ZzL3NkYTMvMjQgLWQgL2ZzL3NkYTMvMjUgLWQgL2ZzL3Nk
YTMvMjYgLWQgL2ZzL3NkYTMvMjcgLWQgL2ZzL3NkYTMvMjggLWQgL2ZzL3NkYTMvMjkgLWQgL2Zz
L3NkYTMvMzAgLWQgL2ZzL3NkYTMvMzEgLWQgL2ZzL3NkYTMvMzIgLUQgMTYgLU4gMjU2IC1uIDE2
MDAgLUwgMSAtUyAxIC1zIDgxOTIK

--===============5295160259086768486==--

