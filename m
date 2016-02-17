Content-Type: multipart/mixed; boundary="===============4804617889568594144=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [cpufreq] 302352f513: 127.2% fileio.time.involuntary_context_switches
Date: Wed, 17 Feb 2016 09:30:31 +0800
Message-ID: <87d1rw2keg.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4804617889568594144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit 302352f51398cfd732c99daa899e43100e0e0341 ("cpufreq: governor: Replac=
e timers with utilization update callbacks")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/disk/filenum/fs/iomode/kconfig/nr_threads/period/rootfs/rwmode/siz=
e/tbox_group/testcase:
  gcc-4.9/1HDD/1024f/ext4/sync/x86_64-rhel/100%/600s/debian-x86_64-2015-02-=
07.cgz/seqrewr/64G/lkp-ws02/fileio

commit: =

  e3f08fbcc76864cebe04219c8b5a77acf5fa3fa8
  302352f51398cfd732c99daa899e43100e0e0341

e3f08fbcc76864ce 302352f51398cfd732c99daa89 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     48500 =C2=B1  3%    +127.2%     110199 =C2=B1  0%  fileio.time.involun=
tary_context_switches
   2683577 =C2=B1  1%      -5.1%    2545567 =C2=B1  1%  fileio.time.volunta=
ry_context_switches
    491.00 =C2=B1141%   +2355.1%      12054 =C2=B1 79%  latency_stats.sum.b=
lk_execute_rq.sg_io.scsi_cmd_ioctl.scsi_cmd_blk_ioctl.sd_ioctl.[sd_mod].blk=
dev_ioctl.block_ioctl.do_vfs_ioctl.SyS_ioctl.entry_SYSCALL_64_fastpath
    101588 =C2=B1  2%     -10.6%      90836 =C2=B1  3%  meminfo.DirectMap4k
     54985 =C2=B1  2%     -10.2%      49373 =C2=B1  1%  softirqs.RCU
    863.00 =C2=B1  6%     +54.2%       1330 =C2=B1  2%  vmstat.system.in
     48500 =C2=B1  3%    +127.2%     110199 =C2=B1  0%  time.involuntary_co=
ntext_switches
     17.33 =C2=B1  1%     -11.9%      15.26 =C2=B1  1%  time.user_time
      3349 =C2=B1  9%     +30.7%       4376 =C2=B1  2%  cpuidle.C1E-NHM.usa=
ge
 1.588e+08 =C2=B1  7%     -27.6%  1.149e+08 =C2=B1  8%  cpuidle.C3-NHM.time
   2126751 =C2=B1  2%     -12.7%    1856297 =C2=B1  2%  cpuidle.POLL.usage
     24.76 =C2=B1  2%      +8.8%      26.94 =C2=B1  2%  turbostat.%Busy
    685.75 =C2=B1  3%      -6.9%     638.50 =C2=B1  3%  turbostat.Avg_MHz
      2768 =C2=B1  0%     -14.4%       2369 =C2=B1  0%  turbostat.Bzy_MHz
     19.94 =C2=B1  2%     +23.2%      24.56 =C2=B1  1%  turbostat.CPU%c1
     53.96 =C2=B1  1%     -12.1%      47.45 =C2=B1  2%  turbostat.CPU%c6
      0.47 =C2=B1  8%     +38.1%       0.65 =C2=B1  5%  turbostat.Pkg%pc3
      0.56 =C2=B1  9%     +56.3%       0.87 =C2=B1 28%  turbostat.Pkg%pc6
      2390 =C2=B1 22%     +52.8%       3653 =C2=B1 12%  numa-vmstat.node0.n=
r_active_anon
      2325 =C2=B1 23%     +54.4%       3590 =C2=B1 12%  numa-vmstat.node0.n=
r_anon_pages
    625.75 =C2=B1137%    +246.2%       2166 =C2=B1  0%  numa-vmstat.node0.n=
r_inactive_anon
      1647 =C2=B1 35%     +62.2%       2673 =C2=B1  0%  numa-vmstat.node0.n=
r_mapped
    704.50 =C2=B1121%    +218.2%       2242 =C2=B1  0%  numa-vmstat.node0.n=
r_shmem
      1644 =C2=B1 52%     -93.7%     104.00 =C2=B1  6%  numa-vmstat.node1.n=
r_inactive_anon
      2324 =C2=B1 24%     -42.9%       1327 =C2=B1  0%  numa-vmstat.node1.n=
r_mapped
      1720 =C2=B1 49%     -89.3%     183.75 =C2=B1  9%  numa-vmstat.node1.n=
r_shmem
      9564 =C2=B1 22%     +52.8%      14614 =C2=B1 12%  numa-meminfo.node0.=
Active(anon)
      4096 =C2=B1  0%     +25.0%       5120 =C2=B1 20%  numa-meminfo.node0.=
AnonHugePages
      9306 =C2=B1 23%     +54.4%      14364 =C2=B1 12%  numa-meminfo.node0.=
AnonPages
      2504 =C2=B1136%    +246.1%       8666 =C2=B1  0%  numa-meminfo.node0.=
Inactive(anon)
      6592 =C2=B1 35%     +62.2%      10693 =C2=B1  0%  numa-meminfo.node0.=
Mapped
      2820 =C2=B1121%    +218.1%       8970 =C2=B1  0%  numa-meminfo.node0.=
Shmem
      6578 =C2=B1 52%     -93.6%     418.00 =C2=B1  6%  numa-meminfo.node1.=
Inactive(anon)
      9300 =C2=B1 24%     -42.9%       5313 =C2=B1  0%  numa-meminfo.node1.=
Mapped
      6883 =C2=B1 49%     -89.3%     735.75 =C2=B1  8%  numa-meminfo.node1.=
Shmem
      2061 =C2=B1  2%     +36.2%       2806 =C2=B1  2%  proc-vmstat.kswapd_=
high_wmark_hit_quickly
      4358 =C2=B1  3%      -7.8%       4016 =C2=B1  0%  proc-vmstat.kswapd_=
low_wmark_hit_quickly
   5498405 =C2=B1  1%     -37.9%    3411855 =C2=B1  5%  proc-vmstat.numa_fo=
reign
      1367 =C2=B1 15%    +103.0%       2775 =C2=B1 15%  proc-vmstat.numa_hi=
nt_faults
      1214 =C2=B1 15%     +43.5%       1741 =C2=B1 12%  proc-vmstat.numa_hi=
nt_faults_local
   9646188 =C2=B1  0%     +21.6%   11728751 =C2=B1  1%  proc-vmstat.numa_hit
   9646189 =C2=B1  0%     +21.6%   11728744 =C2=B1  1%  proc-vmstat.numa_lo=
cal
   5498405 =C2=B1  1%     -37.9%    3411855 =C2=B1  5%  proc-vmstat.numa_mi=
ss
   5498404 =C2=B1  1%     -37.9%    3411862 =C2=B1  5%  proc-vmstat.numa_ot=
her
      1474 =C2=B1 14%     +95.8%       2886 =C2=B1 14%  proc-vmstat.numa_pt=
e_updates
      1220 =C2=B1  8%     +73.6%       2119 =C2=B1  4%  sched_debug.cfs_rq:=
/.exec_clock.min
      3406 =C2=B1  6%     -23.1%       2620 =C2=B1  6%  sched_debug.cfs_rq:=
/.exec_clock.stddev
      1.25 =C2=B1 87%    +420.0%       6.50 =C2=B1 44%  sched_debug.cfs_rq:=
/.load_avg.14
      0.02 =C2=B1173%   +1100.0%       0.27 =C2=B1 33%  sched_debug.cfs_rq:=
/.load_avg.min
     15227 =C2=B1  3%     +16.0%      17660 =C2=B1  0%  sched_debug.cfs_rq:=
/.min_vruntime.avg
      5900 =C2=B1  3%     +64.0%       9677 =C2=B1  6%  sched_debug.cfs_rq:=
/.min_vruntime.min
      7592 =C2=B1  2%     -22.4%       5894 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      2.02 =C2=B1 41%     -62.9%       0.75 =C2=B1 68%  sched_debug.cfs_rq:=
/.removed_load_avg.max
      0.41 =C2=B1 41%     -60.7%       0.16 =C2=B1 72%  sched_debug.cfs_rq:=
/.removed_load_avg.stddev
      2.02 =C2=B1 41%     -65.2%       0.70 =C2=B1 77%  sched_debug.cfs_rq:=
/.removed_util_avg.max
      0.41 =C2=B1 41%     -62.7%       0.15 =C2=B1 80%  sched_debug.cfs_rq:=
/.removed_util_avg.stddev
    946.44 =C2=B1 55%    -286.1%      -1761 =C2=B1-71%  sched_debug.cfs_rq:=
/.spread0.1
     -9958 =C2=B1-30%     +52.1%     -15145 =C2=B1 -5%  sched_debug.cfs_rq:=
/.spread0.13
     -8819 =C2=B1-42%     +70.5%     -15032 =C2=B1-13%  sched_debug.cfs_rq:=
/.spread0.14
     -8798 =C2=B1-47%     +70.2%     -14974 =C2=B1 -8%  sched_debug.cfs_rq:=
/.spread0.16
     -9424 =C2=B1-35%     +51.8%     -14302 =C2=B1 -3%  sched_debug.cfs_rq:=
/.spread0.17
      1766 =C2=B1106%    -200.5%      -1775 =C2=B1-87%  sched_debug.cfs_rq:=
/.spread0.2
     -8.30 =C2=B1-6131%  +22069.1%      -1840 =C2=B1-65%  sched_debug.cfs_r=
q:/.spread0.3
   -718.74 =C2=B1-132%    +552.5%      -4689 =C2=B1-41%  sched_debug.cfs_rq=
:/.spread0.4
    260.66 =C2=B1792%   -1502.7%      -3656 =C2=B1-22%  sched_debug.cfs_rq:=
/.spread0.5
      9680 =C2=B1 71%     -94.1%     567.86 =C2=B1 39%  sched_debug.cfs_rq:=
/.spread0.max
      7593 =C2=B1  2%     -22.4%       5895 =C2=B1  3%  sched_debug.cfs_rq:=
/.spread0.stddev
     15.75 =C2=B1 23%     +50.8%      23.75 =C2=B1 23%  sched_debug.cfs_rq:=
/.util_avg.22
    951860 =C2=B1  5%     -12.6%     831528 =C2=B1  7%  sched_debug.cpu.avg=
_idle.2
    962793 =C2=B1  2%     -14.3%     824755 =C2=B1  8%  sched_debug.cpu.avg=
_idle.5
    927124 =C2=B1  4%     -13.9%     797898 =C2=B1 11%  sched_debug.cpu.avg=
_idle.9
     13.51 =C2=B1 20%     -41.8%       7.86 =C2=B1 22%  sched_debug.cpu.clo=
ck.stddev
     13.51 =C2=B1 20%     -41.8%       7.86 =C2=B1 22%  sched_debug.cpu.clo=
ck_task.stddev
    110.50 =C2=B1 52%     -76.7%      25.75 =C2=B1122%  sched_debug.cpu.loa=
d.3
      0.00 =C2=B1 16%     -31.3%       0.00 =C2=B1 14%  sched_debug.cpu.nex=
t_balance.stddev
     12916 =C2=B1 10%     +19.1%      15383 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.12
     13314 =C2=B1  7%     +18.9%      15830 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.17
     11644 =C2=B1  2%     +26.7%      14756 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.min
      7077 =C2=B1  6%     -20.3%       5640 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.stddev
    310152 =C2=B1  4%     -13.7%     267785 =C2=B1  2%  sched_debug.cpu.nr_=
switches.max
     17998 =C2=B1 20%    +137.2%      42687 =C2=B1  4%  sched_debug.cpu.nr_=
switches.min
     98200 =C2=B1  6%     -11.9%      86515 =C2=B1  2%  sched_debug.cpu.nr_=
switches.stddev
   -133.25 =C2=B1-24%     -92.3%     -10.25 =C2=B1-196%  sched_debug.cpu.nr=
_uninterruptible.0
     15.75 =C2=B1 48%    -103.2%      -0.50 =C2=B1-1081%  sched_debug.cpu.n=
r_uninterruptible.13
     24.75 =C2=B1 41%    -101.0%      -0.25 =C2=B1-2104%  sched_debug.cpu.n=
r_uninterruptible.15
     42.00 =C2=B1 14%     -34.5%      27.50 =C2=B1 16%  sched_debug.cpu.nr_=
uninterruptible.2
      7.50 =C2=B1137%    -266.7%     -12.50 =C2=B1-84%  sched_debug.cpu.nr_=
uninterruptible.21
     10.00 =C2=B1 52%    -205.0%     -10.50 =C2=B1-54%  sched_debug.cpu.nr_=
uninterruptible.22
     10.50 =C2=B1 54%    -209.5%     -11.50 =C2=B1-52%  sched_debug.cpu.nr_=
uninterruptible.23
     10.00 =C2=B1 72%    +587.5%      68.75 =C2=B1 32%  sched_debug.cpu.nr_=
uninterruptible.6
     -7.50 =C2=B1-107%    +296.7%     -29.75 =C2=B1-55%  sched_debug.cpu.nr=
_uninterruptible.9
   -136.11 =C2=B1-21%     -55.4%     -60.68 =C2=B1-16%  sched_debug.cpu.nr_=
uninterruptible.min
     39.88 =C2=B1  9%     -27.1%      29.06 =C2=B1 10%  sched_debug.cpu.nr_=
uninterruptible.stddev
     18003 =C2=B1 20%    +137.1%      42693 =C2=B1  4%  sched_debug.cpu.sch=
ed_count.min
    152021 =C2=B1  4%     -16.2%     127378 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.max
      8112 =C2=B1 22%    +134.4%      19016 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.min
     48301 =C2=B1  6%     -14.4%      41365 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.stddev
    156609 =C2=B1  6%     -10.8%     139663 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.max
     13972 =C2=B1 10%     +66.7%      23298 =C2=B1  6%  sched_debug.cpu.ttw=
u_count.min
     48083 =C2=B1  7%     -23.1%      36962 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.stddev
     12856 =C2=B1 21%     +29.3%      16624 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.0
      8572 =C2=B1 16%     +86.7%      16002 =C2=B1 12%  sched_debug.cpu.ttw=
u_local.1
      5271 =C2=B1 20%     +96.0%      10332 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.10
      5313 =C2=B1 18%     +96.1%      10421 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.11
      2342 =C2=B1 33%     +94.3%       4550 =C2=B1 10%  sched_debug.cpu.ttw=
u_local.12
      1871 =C2=B1 25%     +81.9%       3403 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.13
      2577 =C2=B1 35%     +45.8%       3757 =C2=B1 12%  sched_debug.cpu.ttw=
u_local.14
      2196 =C2=B1 20%     +69.9%       3731 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.15
      1892 =C2=B1 28%     +88.5%       3567 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.16
      1782 =C2=B1 26%    +109.3%       3730 =C2=B1 14%  sched_debug.cpu.ttw=
u_local.17
      1996 =C2=B1 28%    +103.0%       4051 =C2=B1 25%  sched_debug.cpu.ttw=
u_local.18
      1907 =C2=B1 29%    +104.8%       3907 =C2=B1 23%  sched_debug.cpu.ttw=
u_local.19
      1994 =C2=B1 25%     +71.5%       3420 =C2=B1  2%  sched_debug.cpu.ttw=
u_local.20
      2056 =C2=B1 31%     +66.9%       3431 =C2=B1  2%  sched_debug.cpu.ttw=
u_local.21
      2014 =C2=B1 26%     +80.3%       3630 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.22
      2043 =C2=B1 28%     +93.1%       3946 =C2=B1 25%  sched_debug.cpu.ttw=
u_local.23
      6927 =C2=B1 17%     +88.9%      13088 =C2=B1 28%  sched_debug.cpu.ttw=
u_local.3
      6822 =C2=B1 15%     +51.7%      10346 =C2=B1  3%  sched_debug.cpu.ttw=
u_local.4
      7994 =C2=B1  4%     +73.1%      13836 =C2=B1 17%  sched_debug.cpu.ttw=
u_local.5
      5511 =C2=B1 18%     +94.6%      10728 =C2=B1  9%  sched_debug.cpu.ttw=
u_local.6
      5553 =C2=B1 18%    +110.1%      11669 =C2=B1 21%  sched_debug.cpu.ttw=
u_local.7
      5308 =C2=B1 22%     +91.3%      10154 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.8
      5620 =C2=B1 21%     +80.8%      10161 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.9
      4595 =C2=B1  0%     +73.9%       7993 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.avg
     13232 =C2=B1 18%     +35.8%      17970 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.max
      1312 =C2=B1  3%    +140.1%       3149 =C2=B1  2%  sched_debug.cpu.ttw=
u_local.min
      3210 =C2=B1 11%     +49.3%       4794 =C2=B1  5%  sched_debug.cpu.ttw=
u_local.stddev

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/disk/filesize/fs2/fs/iterations/kconfig/nr_directories/nr_files_pe=
r_directory/nr_threads/rootfs/sync_method/tbox_group/test_size/testcase:
  gcc-4.9/1HDD/8K/nfsv4/f2fs/1x/x86_64-rhel/16d/256fpd/32t/debian-x86_64-20=
15-02-07.cgz/fsyncBeforeClose/nhm4/400M/fsmark

commit: =

  e3f08fbcc76864cebe04219c8b5a77acf5fa3fa8
  302352f51398cfd732c99daa899e43100e0e0341

e3f08fbcc76864ce 302352f51398cfd732c99daa89 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

  16089987 =C2=B1  6%     +11.2%   17891183 =C2=B1  3%  fsmark.app_overhead
     67153 =C2=B1  0%     +27.1%      85341 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
    754521 =C2=B1 71%     -51.4%     366409 =C2=B1 32%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4].nfs4_do_create.[nfsv4].nfs4_proc_mkdir.[nfsv4].nfs_mkdir.v=
fs_mkdir.SyS_mkdir.entry_SYSCALL_64_fastpath
     67153 =C2=B1  0%     +27.1%      85341 =C2=B1  0%  time.involuntary_co=
ntext_switches
    764.50 =C2=B1  1%     +40.4%       1073 =C2=B1  0%  vmstat.system.in
      8.06 =C2=B1  0%     +17.1%       9.44 =C2=B1  0%  turbostat.%Busy
    253.75 =C2=B1  0%     +19.4%     303.00 =C2=B1  0%  turbostat.Avg_MHz
     56075 =C2=B1  1%      -9.1%      50980 =C2=B1  0%  cpuidle.C1E-NHM.usa=
ge
    462635 =C2=B1  0%     -17.7%     380672 =C2=B1  0%  cpuidle.C3-NHM.usage
 2.345e+08 =C2=B1  0%     +21.2%  2.842e+08 =C2=B1  0%  cpuidle.POLL.time
     69206 =C2=B1  0%     -16.5%      57794 =C2=B1  0%  softirqs.RCU
     66817 =C2=B1  0%     -25.5%      49768 =C2=B1  0%  softirqs.SCHED
     82718 =C2=B1  0%     -15.8%      69656 =C2=B1  0%  softirqs.TIMER
    490.53 =C2=B1  5%     +19.0%     583.56 =C2=B1 14%  sched_debug.cfs_rq:=
/.load_avg.max
    140.36 =C2=B1  7%     +21.3%     170.27 =C2=B1 13%  sched_debug.cfs_rq:=
/.load_avg.stddev
     -1258 =C2=B1-48%     +90.9%      -2403 =C2=B1 -5%  sched_debug.cfs_rq:=
/.spread0.3
     -1747 =C2=B1-46%     +95.4%      -3415 =C2=B1-11%  sched_debug.cfs_rq:=
/.spread0.7
      1.67 =C2=B1 56%    +155.0%       4.25 =C2=B1 45%  sched_debug.cpu.cpu=
_load[0].4
     11.00 =C2=B1 95%     -90.9%       1.00 =C2=B1173%  sched_debug.cpu.cpu=
_load[0].7
      1.00 =C2=B1 81%    +225.0%       3.25 =C2=B1 25%  sched_debug.cpu.cpu=
_load[1].4
    174.00 =C2=B1 97%    +652.4%       1309 =C2=B1 24%  sched_debug.cpu.cur=
r->pid.3
     37346 =C2=B1  3%     -23.0%      28772 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.0
     34950 =C2=B1  2%     -22.3%      27162 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.1
     34385 =C2=B1  2%     -22.3%      26728 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.2
     33418 =C2=B1  1%     -19.1%      27039 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.3
     14195 =C2=B1  6%     +13.9%      16163 =C2=B1  0%  sched_debug.cpu.nr_=
load_updates.5
     13628 =C2=B1  4%     +16.1%      15818 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.6
     13256 =C2=B1  1%     +13.7%      15065 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.7
     24403 =C2=B1  0%     -12.2%      21417 =C2=B1  0%  sched_debug.cpu.nr_=
load_updates.avg
     37396 =C2=B1  3%     -21.8%      29227 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.max
     13122 =C2=B1  1%     +10.7%      14524 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.min
     10789 =C2=B1  2%     -42.3%       6229 =C2=B1  3%  sched_debug.cpu.nr_=
load_updates.stddev
    241883 =C2=B1  3%      -9.5%     218834 =C2=B1  2%  sched_debug.cpu.nr_=
switches.2
     98350 =C2=B1  2%     +11.8%     109945 =C2=B1  3%  sched_debug.cpu.nr_=
switches.4
     81213 =C2=B1  3%     +28.0%     103912 =C2=B1  6%  sched_debug.cpu.nr_=
switches.5
     78155 =C2=B1  1%     +11.9%      87444 =C2=B1  4%  sched_debug.cpu.nr_=
switches.min
     82454 =C2=B1  1%     -11.1%      73325 =C2=B1  6%  sched_debug.cpu.nr_=
switches.stddev
     -1587 =C2=B1 -3%     +29.6%      -2056 =C2=B1 -2%  sched_debug.cpu.nr_=
uninterruptible.0
    279.25 =C2=B1  7%     +43.5%     400.75 =C2=B1  4%  sched_debug.cpu.nr_=
uninterruptible.1
    325.00 =C2=B1  7%     +46.8%     477.25 =C2=B1  8%  sched_debug.cpu.nr_=
uninterruptible.2
    347.00 =C2=B1 13%     +45.6%     505.25 =C2=B1  5%  sched_debug.cpu.nr_=
uninterruptible.3
    367.84 =C2=B1  7%     +40.8%     518.09 =C2=B1  5%  sched_debug.cpu.nr_=
uninterruptible.max
     -1586 =C2=B1 -3%     +29.6%      -2056 =C2=B1 -2%  sched_debug.cpu.nr_=
uninterruptible.min
    607.02 =C2=B1  3%     +30.4%     791.52 =C2=B1  2%  sched_debug.cpu.nr_=
uninterruptible.stddev
    241990 =C2=B1  3%      -9.5%     218934 =C2=B1  2%  sched_debug.cpu.sch=
ed_count.2
     98440 =C2=B1  2%     +11.8%     110033 =C2=B1  3%  sched_debug.cpu.sch=
ed_count.4
     81291 =C2=B1  3%     +27.9%     103988 =C2=B1  6%  sched_debug.cpu.sch=
ed_count.5
     78233 =C2=B1  1%     +11.9%      87520 =C2=B1  4%  sched_debug.cpu.sch=
ed_count.min
     95303 =C2=B1  4%     -16.8%      79276 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.2
     29450 =C2=B1  3%     +25.9%      37066 =C2=B1  8%  sched_debug.cpu.sch=
ed_goidle.5
    107187 =C2=B1  4%      -8.5%      98091 =C2=B1  5%  sched_debug.cpu.sch=
ed_goidle.max
     32593 =C2=B1  1%     -15.4%      27583 =C2=B1  7%  sched_debug.cpu.sch=
ed_goidle.stddev
     59317 =C2=B1 10%     +14.1%      67695 =C2=B1 14%  sched_debug.cpu.ttw=
u_count.4
     43614 =C2=B1 10%     +27.2%      55475 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.6
     43754 =C2=B1 12%     +34.6%      58909 =C2=B1 18%  sched_debug.cpu.ttw=
u_count.7
     40602 =C2=B1  7%     +24.5%      50530 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.min
     49812 =C2=B1  1%     -12.3%      43696 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.stddev
     18142 =C2=B1  3%     +29.1%      23421 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.4
     15385 =C2=B1  1%     +44.7%      22269 =C2=B1  1%  sched_debug.cpu.ttw=
u_local.5
     14687 =C2=B1  2%     +49.1%      21893 =C2=B1  4%  sched_debug.cpu.ttw=
u_local.6
     14493 =C2=B1  0%     +44.8%      20983 =C2=B1  2%  sched_debug.cpu.ttw=
u_local.7
     33668 =C2=B1  0%     +14.4%      38528 =C2=B1  0%  sched_debug.cpu.ttw=
u_local.avg
     14298 =C2=B1  0%     +44.7%      20697 =C2=B1  1%  sched_debug.cpu.ttw=
u_local.min

lkp-ws02: Westmere-EP
Memory: 16G

nhm4: Nehalem
Memory: 4G

                      fsmark.time.involuntary_context_switches

  88000 ++-----------------------------------------------------------------=
-+
  86000 O+O  O  O OO   O  O    O  O            O                           =
 |
        |  O  O      O  O  O O  O   OO OO O OO  O O                        =
 |
  84000 ++                                                                 =
 |
  82000 ++                                                                 =
 |
  80000 ++                                                                 =
 |
  78000 ++                                                                 =
 |
        |                                                                  =
 |
  76000 ++                                                                 =
 |
  74000 ++                                                                 =
 |
  72000 ++                                                                 =
 |
  70000 ++                                                                 =
 |
        |                                                                  =
 |
  68000 ++**.**.*. *.*.**.**.*.* .*.**.* .*.**.**.*. *.*.**.**.*.**.*.**.**=
.*
  66000 *+--------*-------------*-------*-----------*----------------------=
-+


                      fileio.time.involuntary_context_switches

  120000 ++----------------------------------------------------------------=
-+
         |        O O O O O OO O O O O O O OO O O O O O OO                 =
 |
  100000 ++                                                                =
 |
         O O O OO                                                          =
 |
         |                                                                 =
 |
   80000 ++                                                                =
 |
         |                                                                 =
 |
   60000 ++                                                                =
 |
         *.*.*.**.*.*.*.*.*.**.*.*.*.*.*.*.**.*.*.*.*.*.**.*.*   *   * .*. =
.*
   40000 ++                                                  :   :   :*   *=
 |
         |                                                    : : : :      =
 |
         |                                                    : : : :      =
 |
   20000 ++                                                   : : : :      =
 |
         |                                                     :   :       =
 |
       0 ++----------------------------------------------------*---*-------=
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

--===============4804617889568594144==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogZnNtYXJrCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9uaXRv
cgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0
YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBw
cm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50
ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAg
YmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAog
IGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoK
ICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiAKZGVmYXVsdC13YXRjaGRvZ3M6CiAg
b29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IDMwMjM1MmY1MTM5OGNmZDczMmM5OWRh
YTg5OWU0MzEwMGUwZTAzNDEKbW9kZWw6IE5laGFsZW0KbnJfY3B1OiA4Cm1lbW9yeTogNEcKaGRk
X3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLVdEQ19XRDEwMDNGQllaLTAxMEZCMF9X
RC1XQ0FXMzY4MTIwNDEtcGFydDEiCnN3YXBfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9h
dGEtV0RDX1dEMTAwM0ZCWVotMDEwRkIwX1dELVdDQVczNjgxMjA0MS1wYXJ0MiIKcm9vdGZzX3Bh
cnRpdGlvbjogIi9kZXYvZGlzay9ieS1pZC9hdGEtV0RDX1dEMTAwM0ZCWVotMDEwRkIwX1dELVdD
QVczNjgxMjA0MS1wYXJ0MyIKbmV0Y29uc29sZV9wb3J0OiA2NjQ5CmNhdGVnb3J5OiBiZW5jaG1h
cmsKaXRlcmF0aW9uczogMXgKbnJfdGhyZWFkczogMzJ0CmRpc2s6IDFIREQKZnM6IGYyZnMKZnMy
OiBuZnN2NApmc21hcms6CiAgZmlsZXNpemU6IDhLCiAgdGVzdF9zaXplOiA0MDBNCiAgc3luY19t
ZXRob2Q6IGZzeW5jQmVmb3JlQ2xvc2UKICBucl9kaXJlY3RvcmllczogMTZkCiAgbnJfZmlsZXNf
cGVyX2RpcmVjdG9yeTogMjU2ZnBkCnF1ZXVlOiBiaXNlY3QKdGVzdGJveDogbmhtNAp0Ym94X2dy
b3VwOiBuaG00Cmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNi0wMi0xNiAx
OToyNTozOC4xMzg3NTIxNjUgKzA4OjAwCmNvbXBpbGVyOiBnY2MtNC45CnJvb3RmczogZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnegppZDogNTRkYzU4MzM3YWYzYzdlYWIwZjg0ZWRjMDY2NDVh
MzBlODlhMzUwMQp1c2VyOiBsa3AKaGVhZF9jb21taXQ6IDI2MjVmOTA4ZmMwY2JkN2U0MDQ4MzIx
Nzc3Mjg4ODUyOWVjYmRmZDEKYmFzZV9jb21taXQ6IDE4NTU4Y2FlMDI3MmY4ZmQ5NjQ3ZTY5ZDNm
ZWMxNTY1YTc5NDk4NjUKYnJhbmNoOiBsaW51eC1uZXh0L21hc3RlcgpyZXN1bHRfcm9vdDogIi9y
ZXN1bHQvZnNtYXJrLzF4LTMydC0xSERELWYyZnMtbmZzdjQtOEstNDAwTS1mc3luY0JlZm9yZUNs
b3NlLTE2ZC0yNTZmcGQvbmhtNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1y
aGVsL2djYy00LjkvMzAyMzUyZjUxMzk4Y2ZkNzMyYzk5ZGFhODk5ZTQzMTAwZTBlMDM0MS8wIgpq
b2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL25obTQvYmlzZWN0X2ZzbWFyay0xeC0zMnQtMUhERC1m
MmZzLW5mc3Y0LThLLTQwME0tZnN5bmNCZWZvcmVDbG9zZS0xNmQtMjU2ZnBkLWRlYmlhbi14ODZf
NjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtMzAyMzUyZjUxMzk4Y2ZkNzMyYzk5ZGFhODk5
ZTQzMTAwZTBlMDM0MS0yMDE2MDIxNi03OTE4NC15MXhpOC0wLnlhbWwiCm1heF91cHRpbWU6IDE1
NDEuNDQKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5j
Z3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9
L2xrcC9zY2hlZHVsZWQvbmhtNC9iaXNlY3RfZnNtYXJrLTF4LTMydC0xSERELWYyZnMtbmZzdjQt
OEstNDAwTS1mc3luY0JlZm9yZUNsb3NlLTE2ZC0yNTZmcGQtZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNnei14ODZfNjQtcmhlbC0zMDIzNTJmNTEzOThjZmQ3MzJjOTlkYWE4OTllNDMxMDBlMGUw
MzQxLTIwMTYwMjE2LTc5MTg0LXkxeGk4LTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14
ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1uZXh0L21hc3RlcgotIGNvbW1pdD0zMDIzNTJmNTEz
OThjZmQ3MzJjOTlkYWE4OTllNDMxMDBlMGUwMzQxCi0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4
Nl82NC1yaGVsL2djYy00LjkvMzAyMzUyZjUxMzk4Y2ZkNzMyYzk5ZGFhODk5ZTQzMTAwZTBlMDM0
MS92bWxpbnV6LTQuNS4wLXJjMi0wMDAwNC1nMzAyMzUyZgotIG1heF91cHRpbWU9MTU0MQotIFJF
U1VMVF9ST09UPS9yZXN1bHQvZnNtYXJrLzF4LTMydC0xSERELWYyZnMtbmZzdjQtOEstNDAwTS1m
c3luY0JlZm9yZUNsb3NlLTE2ZC0yNTZmcGQvbmhtNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6L3g4Nl82NC1yaGVsL2djYy00LjkvMzAyMzUyZjUxMzk4Y2ZkNzMyYzk5ZGFhODk5ZTQzMTAw
ZTBlMDM0MS8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8LQogIGxpYmF0YS5mb3JjZT0xLjVHYnBzCgog
IGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBh
cGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGlt
ZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmlj
IG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5
UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtw
L2xrcC9sa3AteDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1y
aGVsL2djYy00LjkvMzAyMzUyZjUxMzk4Y2ZkNzMyYzk5ZGFhODk5ZTQzMTAwZTBlMDM0MS9tb2R1
bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDIt
MDcuY2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6
L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL29zaW1hZ2Uv
ZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2ZzLmNneiwvb3NpbWFnZS9kZXBzL2Rl
Ymlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovZnMyLmNneiwvbGtwL2JlbmNobWFya3MvZnNtYXJr
LmNneiIKbGludXhfaGVhZGVyc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00
LjkvMzAyMzUyZjUxMzk4Y2ZkNzMyYzk5ZGFhODk5ZTQzMTAwZTBlMDM0MS9saW51eC1oZWFkZXJz
LmNneiIKcmVwZWF0X3RvOiAyCmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQu
OS8zMDIzNTJmNTEzOThjZmQ3MzJjOTlkYWE4OTllNDMxMDBlMGUwMzQxL3ZtbGludXotNC41LjAt
cmMyLTAwMDA0LWczMDIzNTJmIgpkZXF1ZXVlX3RpbWU6IDIwMTYtMDItMTYgMTk6MzM6NDguNzU4
MTM1NzQ3ICswODowMApqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDM5LjA0IDI5Ljg1IDE0
LjQ1IDEvMTc0IDY2NjMKc3RhcnRfdGltZTogJzE0NTU2MjI0NTcnCmVuZF90aW1lOiAnMTQ1NTYy
Mjg5NicKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNjAyMTYtMTgxMTU0Igo=

--===============4804617889568594144==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMi0xNiAxOTozNDoxMyBta2ZzIC10IGYyZnMgL2Rldi9zZGExCjIwMTYtMDItMTYgMTk6
MzQ6MTUgbW91bnQgLXQgZjJmcyAvZGV2L3NkYTEgL2ZzL3NkYTEKMjAxNi0wMi0xNiAxOTozNDox
NiAvZXRjL2luaXQuZC9ycGNiaW5kIHN0YXJ0CjIwMTYtMDItMTYgMTk6MzQ6MTYgL2V0Yy9pbml0
LmQvbmZzLWNvbW1vbiBzdGFydAoyMDE2LTAyLTE2IDE5OjM0OjE2IC9ldGMvaW5pdC5kL25mcy1r
ZXJuZWwtc2VydmVyIHN0YXJ0CjIwMTYtMDItMTYgMTk6MzQ6MTYgbW91bnQgLXQgbmZzIC1vIHZl
cnM9NCBsb2NhbGhvc3Q6L2ZzL3NkYTEgL25mcy9zZGExCjIwMTYtMDItMTYgMTk6MzQ6MTcgLi9m
c19tYXJrIC1kIC9uZnMvc2RhMS8xIC1kIC9uZnMvc2RhMS8yIC1kIC9uZnMvc2RhMS8zIC1kIC9u
ZnMvc2RhMS80IC1kIC9uZnMvc2RhMS81IC1kIC9uZnMvc2RhMS82IC1kIC9uZnMvc2RhMS83IC1k
IC9uZnMvc2RhMS84IC1kIC9uZnMvc2RhMS85IC1kIC9uZnMvc2RhMS8xMCAtZCAvbmZzL3NkYTEv
MTEgLWQgL25mcy9zZGExLzEyIC1kIC9uZnMvc2RhMS8xMyAtZCAvbmZzL3NkYTEvMTQgLWQgL25m
cy9zZGExLzE1IC1kIC9uZnMvc2RhMS8xNiAtZCAvbmZzL3NkYTEvMTcgLWQgL25mcy9zZGExLzE4
IC1kIC9uZnMvc2RhMS8xOSAtZCAvbmZzL3NkYTEvMjAgLWQgL25mcy9zZGExLzIxIC1kIC9uZnMv
c2RhMS8yMiAtZCAvbmZzL3NkYTEvMjMgLWQgL25mcy9zZGExLzI0IC1kIC9uZnMvc2RhMS8yNSAt
ZCAvbmZzL3NkYTEvMjYgLWQgL25mcy9zZGExLzI3IC1kIC9uZnMvc2RhMS8yOCAtZCAvbmZzL3Nk
YTEvMjkgLWQgL25mcy9zZGExLzMwIC1kIC9uZnMvc2RhMS8zMSAtZCAvbmZzL3NkYTEvMzIgLUQg
MTYgLU4gMjU2IC1uIDE2MDAgLUwgMSAtUyAxIC1zIDgxOTIK

--===============4804617889568594144==--

