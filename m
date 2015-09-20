Content-Type: multipart/mixed; boundary="===============3099192221750846228=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [nfsd] 07d2931094: -6.0% fsmark.files_per_sec
Date: Sun, 20 Sep 2015 16:59:43 +0800
Message-ID: <87k2rlbh4w.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3099192221750846228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.samba.org/jlayton/linux nfsd-4.4
commit 07d29310940bf676822715efd4be3c769cae97c2 ("nfsd: convert nfs4_file->=
fi_fds array to use nfsd_files")

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/fs2/filesize/test_size/sync_method/nr_directories/nr_files_=
per_directory:
  nhm4/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/=
1x/32t/1HDD/xfs/nfsv4/9B/400M/fsyncBeforeClose/16d/256fpd

commit: =

  62b92d7854c66931ad66601ade1e4cc941c0e5ac
  07d29310940bf676822715efd4be3c769cae97c2

62b92d7854c66931 07d29310940bf676822715efd4 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    663.20 =C2=B1  0%      -6.0%     623.20 =C2=B1  0%  fsmark.files_per_sec
    154.58 =C2=B1  0%      +6.4%     164.47 =C2=B1  0%  fsmark.time.elapsed=
_time
    154.58 =C2=B1  0%      +6.4%     164.47 =C2=B1  0%  fsmark.time.elapsed=
_time.max
    124955 =C2=B1  0%      -5.3%     118317 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
      7.00 =C2=B1  0%     +14.3%       8.00 =C2=B1  0%  fsmark.time.percent=
_of_cpu_this_job_got
    448628 =C2=B1  0%      -1.4%     442375 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
     10022 =C2=B1  0%     +51.3%      15166 =C2=B1  1%  proc-vmstat.nr_slab=
_unreclaimable
     41390 =C2=B1  0%      +9.7%      45425 =C2=B1  1%  softirqs.SCHED
     40093 =C2=B1  0%     +51.3%      60669 =C2=B1  1%  meminfo.SUnreclaim
    122014 =C2=B1  0%     +23.1%     150170 =C2=B1  1%  meminfo.Slab
 7.904e+08 =C2=B1  0%     +19.9%  9.476e+08 =C2=B1  1%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_do_close.[nfsv4]._=
_nfs4_close.[nfsv4].nfs4_close_sync.[nfsv4].nfs4_close_context.[nfsv4].__pu=
t_nfs_open_context.nfs_file_clear_open_context.nfs_file_release.__fput.____=
fput.task_work_run
 8.165e+08 =C2=B1  0%     +18.8%  9.698e+08 =C2=B1  1%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs_atomic_open.path_openat.do_filp_open.do_sys_open.SyS_open.entry=
_SYSCALL_64_fastpath
  61710810 =C2=B1  2%      -7.2%   57259741 =C2=B1  1%  latency_stats.sum.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_write_and_wait_range.nfs4_f=
ile_fsync.[nfsv4].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastp=
ath
      7.00 =C2=B1  0%     +14.3%       8.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
     10.79 =C2=B1  3%     +17.4%      12.66 =C2=B1  3%  time.system_time
      1.15 =C2=B1  1%     +31.7%       1.51 =C2=B1  2%  time.user_time
      6.81 =C2=B1  2%     +14.3%       7.79 =C2=B1  1%  turbostat.%Busy
    221.50 =C2=B1  0%     +10.6%     245.00 =C2=B1  0%  turbostat.Avg_MHz
      9.46 =C2=B1  2%     +38.4%      13.08 =C2=B1  6%  turbostat.CPU%c3
      9139 =C2=B1  0%      -7.3%       8470 =C2=B1  1%  vmstat.io.bo
     94161 =C2=B1  0%      -6.4%      88109 =C2=B1  0%  vmstat.system.cs
     31533 =C2=B1  1%      -5.9%      29663 =C2=B1  0%  vmstat.system.in
 1.994e+08 =C2=B1  2%     +20.0%  2.392e+08 =C2=B1  3%  cpuidle.C3-NHM.time
    870510 =C2=B1  4%     +19.2%    1037726 =C2=B1  4%  cpuidle.C3-NHM.usage
    115687 =C2=B1  2%     +22.6%     141821 =C2=B1  2%  cpuidle.C6-NHM.usage
      3283 =C2=B1  4%     -61.4%       1266 =C2=B1 10%  cpuidle.POLL.usage
    863.25 =C2=B1 56%     +52.0%       1312 =C2=B1  8%  sched_debug.cfs_rq[=
3]:/.load_avg
      7.25 =C2=B1 26%     +93.1%      14.00 =C2=B1 16%  sched_debug.cfs_rq[=
3]:/.nr_spread_over
     34.25 =C2=B1 59%     +58.4%      54.25 =C2=B1 39%  sched_debug.cfs_rq[=
4]:/.util_avg
      1143 =C2=B1  0%     +20.2%       1375 =C2=B1  9%  sched_debug.cfs_rq[=
5]:/.exec_clock
    171.50 =C2=B1 95%    +307.9%     699.50 =C2=B1 40%  sched_debug.cfs_rq[=
7]:/.load_avg
    253.00 =C2=B1 60%    +177.0%     700.75 =C2=B1 40%  sched_debug.cfs_rq[=
7]:/.tg_load_avg_contrib
     33.50 =C2=B1106%    +320.1%     140.75 =C2=B1 12%  sched_debug.cfs_rq[=
7]:/.util_avg
      1669 =C2=B1  3%     -13.2%       1449 =C2=B1  4%  sched_debug.cpu#0.n=
r_uninterruptible
    289.50 =C2=B1172%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cpu#1.c=
pu_load[0]
     -1212 =C2=B1 -4%     -14.8%      -1033 =C2=B1 -3%  sched_debug.cpu#1.n=
r_uninterruptible
   -697.75 =C2=B1 -4%     -16.2%    -584.50 =C2=B1 -9%  sched_debug.cpu#2.n=
r_uninterruptible
    868645 =C2=B1 93%     -94.1%      51606 =C2=B1  4%  sched_debug.cpu#3.t=
twu_count
    830065 =C2=B1 97%     -97.3%      22366 =C2=B1  2%  sched_debug.cpu#3.t=
twu_local
    156.50 =C2=B1  5%     -15.0%     133.00 =C2=B1  6%  sched_debug.cpu#4.n=
r_uninterruptible
    731718 =C2=B1  2%     -21.3%     576140 =C2=B1 11%  sched_debug.cpu#6.a=
vg_idle
    104.50 =C2=B1  6%     -23.4%      80.00 =C2=B1 17%  sched_debug.cpu#7.n=
r_uninterruptible
      0.00 =C2=B1 58%    +144.9%       0.01 =C2=B1 56%  sched_debug.rt_rq[2=
]:/.rt_time
     19017 =C2=B1  0%     +15.3%      21929 =C2=B1  1%  slabinfo.buffer_hea=
d.active_objs
     19017 =C2=B1  0%     +15.3%      21929 =C2=B1  1%  slabinfo.buffer_hea=
d.num_objs
     16492 =C2=B1  0%     +12.6%      18575 =C2=B1  0%  slabinfo.kmalloc-12=
8.active_objs
     16521 =C2=B1  0%     +12.6%      18608 =C2=B1  0%  slabinfo.kmalloc-12=
8.num_objs
      5523 =C2=B1  1%    +391.2%      27131 =C2=B1  1%  slabinfo.kmalloc-16=
.active_objs
      5523 =C2=B1  1%    +391.2%      27132 =C2=B1  1%  slabinfo.kmalloc-16=
.num_objs
      4788 =C2=B1  4%   +1347.9%      69331 =C2=B1  1%  slabinfo.kmalloc-19=
2.active_objs
    116.00 =C2=B1  4%   +1324.6%       1652 =C2=B1  1%  slabinfo.kmalloc-19=
2.active_slabs
      4897 =C2=B1  4%   +1317.5%      69425 =C2=B1  1%  slabinfo.kmalloc-19=
2.num_objs
    116.00 =C2=B1  4%   +1324.6%       1652 =C2=B1  1%  slabinfo.kmalloc-19=
2.num_slabs
      2199 =C2=B1  4%    +982.6%      23811 =C2=B1  1%  slabinfo.kmalloc-25=
6.active_objs
     82.75 =C2=B1  5%    +807.6%     751.00 =C2=B1  1%  slabinfo.kmalloc-25=
6.active_slabs
      2672 =C2=B1  5%    +799.9%      24047 =C2=B1  1%  slabinfo.kmalloc-25=
6.num_objs
     82.75 =C2=B1  5%    +807.6%     751.00 =C2=B1  1%  slabinfo.kmalloc-25=
6.num_slabs
      8578 =C2=B1  0%    +224.0%      27792 =C2=B1  1%  slabinfo.kmalloc-32=
.active_objs
     67.25 =C2=B1  0%    +225.7%     219.00 =C2=B1  1%  slabinfo.kmalloc-32=
.active_slabs
      8691 =C2=B1  0%    +223.3%      28101 =C2=B1  1%  slabinfo.kmalloc-32=
.num_objs
     67.25 =C2=B1  0%    +225.7%     219.00 =C2=B1  1%  slabinfo.kmalloc-32=
.num_slabs
      1690 =C2=B1  2%     +19.1%       2013 =C2=B1  6%  slabinfo.kmalloc-51=
2.num_objs
     48504 =C2=B1  0%     +11.1%      53877 =C2=B1  1%  slabinfo.kmalloc-64=
.active_objs
     48586 =C2=B1  0%     +10.9%      53880 =C2=B1  1%  slabinfo.kmalloc-64=
.num_objs
     35280 =C2=B1  0%     +14.3%      40314 =C2=B1  1%  slabinfo.kmalloc-96=
.active_objs
    839.75 =C2=B1  0%     +14.2%     959.25 =C2=B1  1%  slabinfo.kmalloc-96=
.active_slabs
     35280 =C2=B1  0%     +14.3%      40314 =C2=B1  1%  slabinfo.kmalloc-96=
.num_objs
    839.75 =C2=B1  0%     +14.2%     959.25 =C2=B1  1%  slabinfo.kmalloc-96=
.num_slabs
      1306 =C2=B1  1%     +11.5%       1457 =C2=B1  1%  slabinfo.mnt_cache.=
active_objs
      1306 =C2=B1  1%     +11.5%       1457 =C2=B1  1%  slabinfo.mnt_cache.=
num_objs
     19130 =C2=B1  0%     +15.3%      22064 =C2=B1  1%  slabinfo.nfs_inode_=
cache.active_objs
     19130 =C2=B1  0%     +15.3%      22064 =C2=B1  1%  slabinfo.nfs_inode_=
cache.num_objs
     19086 =C2=B1  0%     +15.3%      22012 =C2=B1  1%  slabinfo.xfs_ili.ac=
tive_objs
    733.50 =C2=B1  0%     +15.3%     846.00 =C2=B1  1%  slabinfo.xfs_ili.ac=
tive_slabs
     19086 =C2=B1  0%     +15.3%      22012 =C2=B1  1%  slabinfo.xfs_ili.nu=
m_objs
    733.50 =C2=B1  0%     +15.3%     846.00 =C2=B1  1%  slabinfo.xfs_ili.nu=
m_slabs
     19113 =C2=B1  0%     +15.3%      22042 =C2=B1  1%  slabinfo.xfs_inode.=
active_objs
     19113 =C2=B1  0%     +15.3%      22042 =C2=B1  1%  slabinfo.xfs_inode.=
num_objs


vm-lkp-wsx01-8G: qemu-system-x86_64 -enable-kvm -cpu kvm64
Memory: 8G

nhm4: Nehalem
Memory: 4G




                                cpuidle.POLL.usage

  4500 ++------------------------------------------------------------------=
-+
       |                               *                                   =
 |
  4000 ++                             : +                                  =
 |
       |            *..               :  +                       *         =
 |
  3500 ++          +                 :    *.     *..*..         + +     .*.=
.|
       *..*.*..  .*    *..*.*..*..*.*       *.. +      *.*..*..*   +  .*   =
 *
  3000 ++      *.                              *                    *.     =
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
  1500 ++                                 O                                =
 |
       O    O     O O  O       O    O       O  O O                         =
 |
  1000 ++-O----O----------O-O-----O----O-----------------------------------=
-+


                                 turbostat.Avg_MHz

  250 ++-------------------------------------------------------------------=
-+
      |                                          O                         =
 |
  245 ++         O    O       O  O  O O  O  O O                            =
 |
      O  O O  O    O     O  O                                              =
 |
  240 ++                                                                   =
 |
      |                                                                    =
 |
  235 ++                                                                   =
 |
      |                                                                    =
 |
  230 ++              *                                                    =
 |
      |              + :                                                   =
 |
  225 *+.*.*..*..*. +   :                               .*..               =
.*
      |            *    :    .*..  .*.*..  .*.*..*..*.*.    *..*.      *.*.=
 |
  220 ++                 *..*    *.      *.                      *.. ..    =
 |
      |                                                             *      =
 |
  215 ++-------------------------------------------------------------------=
-+


                                  turbostat.%Busy

    8 ++-------------------------------------------------------------------=
-+
      O  O O     O    O       O  O  O O  O       O                         =
 |
  7.8 ++      O    O     O  O                 O                            =
 |
  7.6 ++                                                                   =
 |
      |                                     O                              =
 |
  7.4 ++                                                                   =
 |
      |                                                                    =
 |
  7.2 ++                                                                   =
 |
      |                                                                    =
 |
    7 ++.*.     .*.  .*..                               .*..               =
.*
  6.8 *+   *..*.   *.    *..*.*..   *.*..*..*.*..*..*.*.    *..*.      *.*.=
 |
      |                           ..                             *.. ..    =
 |
  6.6 ++                         *                                  *      =
 |
      |                                                                    =
 |
  6.4 ++-------------------------------------------------------------------=
-+


                               fsmark.files_per_sec

  740 ++-------------------------------------------------------------------=
-+
      |               *                                                    =
 |
  720 ++              :                                                    =
 |
      |              : :                                                   =
 |
  700 ++             : :                                                   =
 |
      |             :   :                                                  =
 |
  680 ++            :   :                                                  =
 |
      *..*.*..    .*     :   .*..*.. .*..       .*.. .*..*..               =
.*
  660 ++      *..*       *..*       *    *..*.*.    *       *..*.*..*..*.*.=
 |
      |                                                                    =
 |
  640 ++                                                                   =
 |
      |                                     O                              =
 |
  620 O+ O O  O  O O  O  O  O O  O  O O  O    O  O                         =
 |
      |                                                                    =
 |
  600 ++-------------------------------------------------------------------=
-+


                             fsmark.time.elapsed_time

  170 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  165 O+ O O  O  O O     O  O O  O  O O  O       O                         =
 |
      |               O                     O O                            =
 |
      |                                                                    =
 |
  160 ++                                                                   =
 |
      |                                                         .*..       =
 |
  155 *+.*.*..*..*.*     *..*.*..  .*.*..*..*.*..  .*.     .*..*    *..*.*.=
.*
      |             :   :        *.              *.   *..*.                =
 |
  150 ++            :   :                                                  =
 |
      |              : :                                                   =
 |
      |              : :                                                   =
 |
  145 ++              *                                                    =
 |
      |                                                                    =
 |
  140 ++-------------------------------------------------------------------=
-+


                           fsmark.time.elapsed_time.max

  170 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  165 O+ O O  O  O O     O  O O  O  O O  O       O                         =
 |
      |               O                     O O                            =
 |
      |                                                                    =
 |
  160 ++                                                                   =
 |
      |                                                         .*..       =
 |
  155 *+.*.*..*..*.*     *..*.*..  .*.*..*..*.*..  .*.     .*..*    *..*.*.=
.*
      |             :   :        *.              *.   *..*.                =
 |
  150 ++            :   :                                                  =
 |
      |              : :                                                   =
 |
      |              : :                                                   =
 |
  145 ++              *                                                    =
 |
      |                                                                    =
 |
  140 ++-------------------------------------------------------------------=
-+


                      fsmark.time.involuntary_context_switches

  126000 ++---*------------------------------------------------*-----------=
-+
         *..*    *.*..*.*..    .*..  *..*..         .*.*..*.. +   *    *.*.=
.*
  125000 ++                *..*     +      *.*..*.*.         *     + ..    =
 |
  124000 ++                        *                                *      =
 |
         |                                                                 =
 |
  123000 ++                                                                =
 |
  122000 ++                                                                =
 |
         |                                                                 =
 |
  121000 ++                                                                =
 |
  120000 ++                                                                =
 |
         |                                                                 =
 |
  119000 ++                   O                                            =
 |
  118000 O+ O    O    O    O       O    O  O O  O O                        =
 |
         |    O    O    O       O    O                                     =
 |
  117000 ++----------------------------------------------------------------=
-+


                                  time.user_time

  1.6 ++-------------------------O----O------------------------------------=
-+
      O    O                                     O                         =
 |
  1.5 ++ O    O    O  O  O    O     O    O                                 =
 |
      |          O          O               O O                            =
 |
      |                                                                    =
 |
  1.4 ++                                                                   =
 |
      |                                                                    =
 |
  1.3 ++                                                                   =
 |
      |           .*..                               .*..                  =
 |
  1.2 ++.*.     .*      .*..*.               .*..*..*    *..               =
 |
      *.   *..*.      *.      *..    .*..*..*               *..    .*..    =
 |
      |                            .*                          *.*.    *.*.=
.*
  1.1 ++                         *.                                        =
 |
      |                                                                    =
 |
    1 ++-------------------------------------------------------------------=
-+


                                    vmstat.io.bo

  10200 ++--------------*--------------------------------------------------=
-+
  10000 ++              :                                                  =
 |
        |              : :                                                 =
 |
   9800 ++             : :                                                 =
 |
   9600 ++             : :                                                 =
 |
        |             :  :                                                 =
 |
   9400 ++            :   :                                                =
 |
   9200 *+.          :    :      .*..            .*.  .*..    .*.. .*..    =
.*
   9000 ++ *.*..*.*..*    *..*..*    *.*..*..*.*.   *.     .*.    *    *.*.=
 |
        |                                                 *                =
 |
   8800 ++                                                                 =
 |
   8600 ++           O    O  O               O                             =
 |
        O  O O  O O     O       O O  O O       O  O                        =
 |
   8400 ++                                                                 =
 |
   8200 ++--------------------------------O--------------------------------=
-+


                          proc-vmstat.nr_slab_unreclaimable

  16000 ++-----------------------------------------------------------------=
-+
        O    O  O                         O    O                           =
 |
  15000 ++ O      O  O  O O  O  O O  O O     O    O                        =
 |
        |                                                                  =
 |
  14000 ++                                                                 =
 |
        |                                                                  =
 |
  13000 ++                                                                 =
 |
        |                                                                  =
 |
  12000 ++                                                                 =
 |
        |                                                                  =
 |
  11000 ++                                                                 =
 |
        |              .*.                                                 =
 |
  10000 *+.*.*..*.*..*.   *..*..*.*..*.*..*..*.*..*.*..*..*.*..*..*.*..*.*.=
.*
        |                                                                  =
 |
   9000 ++-----------------------------------------------------------------=
-+


                                    meminfo.Slab

  155000 ++----------------------------------------------------------------=
-+
         |       O                              O                          =
 |
  150000 O+ O O    O  O O  O  O O  O O  O  O      O                        =
 |
         |                                   O                             =
 |
  145000 ++                                                                =
 |
         |                                                                 =
 |
  140000 ++                                                                =
 |
         |                                                                 =
 |
  135000 ++                                                                =
 |
         |                                                                 =
 |
  130000 ++                                                                =
 |
         |              *..                                                =
 |
  125000 ++            +                                                   =
 |
         |      .*.*..*    *..*.  .*.*..  .*.*..*.  .*.     .*.*..*.*..*.*.=
.|
  120000 *+-*-*-----------------*-------*---------*----*--*----------------=
-*


                                 meminfo.SUnreclaim

  65000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  60000 O+ O O  O O  O  O O  O  O O  O O  O    O  O                        =
 |
        |                                    O                             =
 |
        |                                                                  =
 |
  55000 ++                                                                 =
 |
        |                                                                  =
 |
  50000 ++                                                                 =
 |
        |                                                                  =
 |
  45000 ++                                                                 =
 |
        |                                                                  =
 |
        |              .*.*..               .*.                            =
 |
  40000 *+.*.*..*.*..*.      *..*.*..*.*..*.   *..*.*..*..*.*..*..*.*..*.*.=
.*
        |                                                                  =
 |
  35000 ++-----------------------------------------------------------------=
-+


                          slabinfo.kmalloc-256.active_objs

  25000 ++------O------------------------------O---------------------------=
-+
        O  O O    O  O  O O  O  O O  O O  O  O    O                        =
 |
        |                                                                  =
 |
  20000 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  15000 ++                                                                 =
 |
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
   5000 ++                                                                 =
 |
        |                                                                  =
 |
        *..*.*..*.*..*..*.*..*..*.*..*.*..*..*.*..*.*..*..*.*..*..*.*..*.*.=
.*
      0 ++-----------------------------------------------------------------=
-+


                            slabinfo.kmalloc-256.num_objs

  25000 O+-O----O-O--O-------O--O-O--O-O--O----O---------------------------=
-+
        |    O          O O                  O    O                        =
 |
        |                                                                  =
 |
  20000 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  15000 ++                                                                 =
 |
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
   5000 ++                                                                 =
 |
        *..*.*..       .*.  .*..              .*..       .*.          .*.*.=
.|
        |       *.*..*.   *.    *.*..*.*..*..*    *.*..*.   *..*..*.*.     =
 *
      0 ++-----------------------------------------------------------------=
-+


                         slabinfo.kmalloc-256.active_slabs

  800 ++-------------------------------------------------------------------=
-+
      O  O O  O  O O  O  O  O O  O  O O  O  O O  O                         =
 |
  700 ++                                                                   =
 |
  600 ++                                                                   =
 |
      |                                                                    =
 |
  500 ++                                                                   =
 |
      |                                                                    =
 |
  400 ++                                                                   =
 |
      |                                                                    =
 |
  300 ++                                                                   =
 |
  200 ++                                                                   =
 |
      |                                                                    =
 |
  100 ++  .*..       .*..  .*.               .*..                     .*.*.=
.|
      *..*    *..*.*.    *.   *..*..*.*..*..*    *..*.*..*..*..*.*..*.     =
 *
    0 ++-------------------------------------------------------------------=
-+


                          slabinfo.kmalloc-256.num_slabs

  800 ++-------------------------------------------------------------------=
-+
      O  O O  O  O O  O  O  O O  O  O O  O  O O  O                         =
 |
  700 ++                                                                   =
 |
  600 ++                                                                   =
 |
      |                                                                    =
 |
  500 ++                                                                   =
 |
      |                                                                    =
 |
  400 ++                                                                   =
 |
      |                                                                    =
 |
  300 ++                                                                   =
 |
  200 ++                                                                   =
 |
      |                                                                    =
 |
  100 ++  .*..       .*..  .*.               .*..                     .*.*.=
.|
      *..*    *..*.*.    *.   *..*..*.*..*..*    *..*.*..*..*..*.*..*.     =
 *
    0 ++-------------------------------------------------------------------=
-+


                          slabinfo.kmalloc-192.active_objs

  80000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  70000 O+ O O  O O  O  O O  O  O O  O O  O  O O  O                        =
 |
  60000 ++                                                                 =
 |
        |                                                                  =
 |
  50000 ++                                                                 =
 |
        |                                                                  =
 |
  40000 ++                                                                 =
 |
        |                                                                  =
 |
  30000 ++                                                                 =
 |
  20000 ++                                                                 =
 |
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        *..*.*..*.*..*..*.*..*..*.*..*.*..*..*.*..*.*..*..*.*..*..*.*..*.*.=
.*
      0 ++-----------------------------------------------------------------=
-+


                            slabinfo.kmalloc-192.num_objs

  80000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  70000 O+ O O  O O  O  O O  O  O O  O O  O  O O  O                        =
 |
  60000 ++                                                                 =
 |
        |                                                                  =
 |
  50000 ++                                                                 =
 |
        |                                                                  =
 |
  40000 ++                                                                 =
 |
        |                                                                  =
 |
  30000 ++                                                                 =
 |
  20000 ++                                                                 =
 |
        |                                                                  =
 |
  10000 ++                                                                 =
 |
        *..*.*..*.*..*..*.*..*..*.*..*.*..*..*.*..*.*..*..*.*..*..*.*..*.*.=
.*
      0 ++-----------------------------------------------------------------=
-+


                         slabinfo.kmalloc-192.active_slabs

  1800 ++------------------------------------------------------------------=
-+
       O  O O  O  O O  O  O O  O  O O  O  O O  O O                         =
 |
  1600 ++                                                                  =
 |
  1400 ++                                                                  =
 |
       |                                                                   =
 |
  1200 ++                                                                  =
 |
  1000 ++                                                                  =
 |
       |                                                                   =
 |
   800 ++                                                                  =
 |
   600 ++                                                                  =
 |
       |                                                                   =
 |
   400 ++                                                                  =
 |
   200 ++                                                                  =
 |
       *..*.*..*..*.*..*..*.*..*..*.*..*..*.*..*.*..*..*.*..*..*.*..*..*.*.=
.*
     0 ++------------------------------------------------------------------=
-+


                          slabinfo.kmalloc-192.num_slabs

  1800 ++------------------------------------------------------------------=
-+
       O  O O  O  O O  O  O O  O  O O  O  O O  O O                         =
 |
  1600 ++                                                                  =
 |
  1400 ++                                                                  =
 |
       |                                                                   =
 |
  1200 ++                                                                  =
 |
  1000 ++                                                                  =
 |
       |                                                                   =
 |
   800 ++                                                                  =
 |
   600 ++                                                                  =
 |
       |                                                                   =
 |
   400 ++                                                                  =
 |
   200 ++                                                                  =
 |
       *..*.*..*..*.*..*..*.*..*..*.*..*..*.*..*.*..*..*.*..*..*.*..*..*.*.=
.*
     0 ++------------------------------------------------------------------=
-+


                           slabinfo.kmalloc-32.active_objs

  55000 ++-----------------------------------------------------------------=
-+
  50000 O+ O O  O O                                                        =
 |
        |                                                                  =
 |
  45000 ++                                                                 =
 |
  40000 ++                                                                 =
 |
        |                                                                  =
 |
  35000 ++                                                                 =
 |
  30000 ++           O          O O  O O  O                                =
 |
  25000 ++              O O  O               O O  O                        =
 |
        |                                                                  =
 |
  20000 ++                                                                 =
 |
  15000 ++                                                                 =
 |
        |                                                                  =
 |
  10000 ++.*.*..*.*..*..*.*..*..*.  .*.*..*..*.*..*.*..*..*.*..*..*.*..*.*.=
.*
   5000 *+------------------------*----------------------------------------=
-+


                            slabinfo.kmalloc-32.num_objs

  55000 ++-----------------------------------------------------------------=
-+
  50000 O+ O O  O O                                                        =
 |
        |                                                                  =
 |
  45000 ++                                                                 =
 |
  40000 ++                                                                 =
 |
        |                                                                  =
 |
  35000 ++                                                                 =
 |
  30000 ++           O    O     O O  O O  O       O                        =
 |
  25000 ++              O    O               O O                           =
 |
        |                                                                  =
 |
  20000 ++                                                                 =
 |
  15000 ++                                                                 =
 |
        |                                                                  =
 |
  10000 ++.*.*..*.*..*..*.*..*..*.*..*.*..*..*.*..*.*..*..*.*..*..*.*..*.*.=
.*
   5000 *+-----------------------------------------------------------------=
-+


                         slabinfo.kmalloc-32.active_slabs

  450 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  400 O+ O O  O  O                                                         =
 |
  350 ++                                                                   =
 |
      |                                                                    =
 |
  300 ++                                                                   =
 |
      |                                                                    =
 |
  250 ++                                                                   =
 |
      |            O     O  O O  O  O O  O  O O  O                         =
 |
  200 ++              O                                                    =
 |
  150 ++                                                                   =
 |
      |                                                                    =
 |
  100 ++                                                                   =
 |
      | .*.*..*..*.*..*..*..*.          .*..*.*..*..*.*..*..*..*.*..*..*.*.=
.*
   50 *+----------------------*--*--*-*------------------------------------=
-+


                           slabinfo.kmalloc-32.num_slabs

  450 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  400 O+ O O  O  O                                                         =
 |
  350 ++                                                                   =
 |
      |                                                                    =
 |
  300 ++                                                                   =
 |
      |                                                                    =
 |
  250 ++                                                                   =
 |
      |            O     O  O O  O  O O  O  O O  O                         =
 |
  200 ++              O                                                    =
 |
  150 ++                                                                   =
 |
      |                                                                    =
 |
  100 ++                                                                   =
 |
      | .*.*..*..*.*..*..*..*.          .*..*.*..*..*.*..*..*..*.*..*..*.*.=
.*
   50 *+----------------------*--*--*-*------------------------------------=
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

--===============3099192221750846228==
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
ICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5jZQpkZWZhdWx0LXdh
dGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogZjBmYTViZWE5YWYx
Njk1MGI3OTRkNTA5ZTY1ZTZmOWU4ZjU3NzhiMgptb2RlbDogTmVoYWxlbQpucl9jcHU6IDgKbWVt
b3J5OiA0RwpoZGRfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtV0RDX1dEMTAwM0ZC
WVotMDEwRkIwX1dELVdDQVczNjgxMjA0MS1wYXJ0MSIKc3dhcF9wYXJ0aXRpb25zOiAiL2Rldi9k
aXNrL2J5LWlkL2F0YS1XRENfV0QxMDAzRkJZWi0wMTBGQjBfV0QtV0NBVzM2ODEyMDQxLXBhcnQy
Igpyb290ZnNfcGFydGl0aW9uOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1XRENfV0QxMDAzRkJZWi0w
MTBGQjBfV0QtV0NBVzM2ODEyMDQxLXBhcnQzIgpuZXRjb25zb2xlX3BvcnQ6IDY2NDkKY2F0ZWdv
cnk6IGJlbmNobWFyawppdGVyYXRpb25zOiAxeApucl90aHJlYWRzOiAzMnQKZGlzazogMUhERApm
czogeGZzCmZzMjogbmZzdjQKZnNtYXJrOgogIGZpbGVzaXplOiA5QgogIHRlc3Rfc2l6ZTogNDAw
TQogIHN5bmNfbWV0aG9kOiBmc3luY0JlZm9yZUNsb3NlCiAgbnJfZGlyZWN0b3JpZXM6IDE2ZAog
IG5yX2ZpbGVzX3Blcl9kaXJlY3Rvcnk6IDI1NmZwZApxdWV1ZTogY3ljbGljCnRlc3Rib3g6IG5o
bTQKdGJveF9ncm91cDogbmhtNAprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIw
MTUtMDktMTcgMjM6NDA6NTkuMDY5MDQ3NTUzICswODowMAppZDogMDYyYTRkMzkxY2M0YTFiMDFl
N2M2OTRjNzRhMTY5MWVhNTQwYzI3ZAp1c2VyOiBsa3AKY29tcGlsZXI6IGdjYy00LjkKaGVhZF9j
b21taXQ6IGYwZmE1YmVhOWFmMTY5NTBiNzk0ZDUwOWU2NWU2ZjllOGY1Nzc4YjIKYmFzZV9jb21t
aXQ6IDZmZjMzZjM5MDJjM2IxYzVkMGRiNmIxZTJjNzBiNmQ3NmZiYTM1N2YKYnJhbmNoOiBsaW51
eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNTA5MTkwOAprZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82
NC1yaGVsL2djYy00LjkvZjBmYTViZWE5YWYxNjk1MGI3OTRkNTA5ZTY1ZTZmOWU4ZjU3NzhiMi92
bWxpbnV6LTQuMy4wLXJjMS13bC0wMjMxNC1nZjBmYTViZSIKcm9vdGZzOiBkZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9mc21hcmsvcGVyZm9ybWFuY2Ut
MXgtMzJ0LTFIREQteGZzLW5mc3Y0LTlCLTQwME0tZnN5bmNCZWZvcmVDbG9zZS0xNmQtMjU2ZnBk
L25obTQvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45L2Yw
ZmE1YmVhOWFmMTY5NTBiNzk0ZDUwOWU2NWU2ZjllOGY1Nzc4YjIvMCIKam9iX2ZpbGU6ICIvbGtw
L3NjaGVkdWxlZC9uaG00L2N5Y2xpY19mc21hcmstcGVyZm9ybWFuY2UtMXgtMzJ0LTFIREQteGZz
LW5mc3Y0LTlCLTQwME0tZnN5bmNCZWZvcmVDbG9zZS0xNmQtMjU2ZnBkLXg4Nl82NC1yaGVsLUNZ
Q0xJQ19IRUFELWYwZmE1YmVhOWFmMTY5NTBiNzk0ZDUwOWU2NWU2ZjllOGY1Nzc4YjItMjAxNTA5
MTctMzAyOTctMTNqYnAwai0wLnlhbWwiCmRlcXVldWVfdGltZTogMjAxNS0wOS0xOSAwOTo0Njo1
NC4xNTczMTc1MzMgKzA4OjAwCm1heF91cHRpbWU6IDk1Mi4wOAppbml0cmQ6ICIvb3NpbWFnZS9k
ZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0g
cm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVkdWxlZC9uaG00L2N5Y2xp
Y19mc21hcmstcGVyZm9ybWFuY2UtMXgtMzJ0LTFIREQteGZzLW5mc3Y0LTlCLTQwME0tZnN5bmNC
ZWZvcmVDbG9zZS0xNmQtMjU2ZnBkLXg4Nl82NC1yaGVsLUNZQ0xJQ19IRUFELWYwZmE1YmVhOWFm
MTY5NTBiNzk0ZDUwOWU2NWU2ZjllOGY1Nzc4YjItMjAxNTA5MTctMzAyOTctMTNqYnAwai0wLnlh
bWwKLSBBUkNIPXg4Nl82NAotIGtjb25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9bGludXgtZGV2
ZWwvZGV2ZWwtaG91cmx5LTIwMTUwOTE5MDgKLSBjb21taXQ9ZjBmYTViZWE5YWYxNjk1MGI3OTRk
NTA5ZTY1ZTZmOWU4ZjU3NzhiMgotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC9n
Y2MtNC45L2YwZmE1YmVhOWFmMTY5NTBiNzk0ZDUwOWU2NWU2ZjllOGY1Nzc4YjIvdm1saW51ei00
LjMuMC1yYzEtd2wtMDIzMTQtZ2YwZmE1YmUKLSBtYXhfdXB0aW1lPTk1MgotIFJFU1VMVF9ST09U
PS9yZXN1bHQvZnNtYXJrL3BlcmZvcm1hbmNlLTF4LTMydC0xSERELXhmcy1uZnN2NC05Qi00MDBN
LWZzeW5jQmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC9uaG00L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS9mMGZhNWJlYTlhZjE2OTUwYjc5NGQ1MDllNjVlNmY5
ZThmNTc3OGIyLzAKLSBMS1BfU0VSVkVSPWlubgotIHwtCiAgbGliYXRhLmZvcmNlPTEuNUdicHMK
CiAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgogIGRlYnVn
IGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90
aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFu
aWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29sZT10
dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRyZDogIi9s
a3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0
LXJoZWwvZ2NjLTQuOS9mMGZhNWJlYTlhZjE2OTUwYjc5NGQ1MDllNjVlNmY5ZThmNTc3OGIyL21v
ZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5j
Z3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwvb3NpbWFn
ZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovZnMuY2d6LC9vc2ltYWdlL2RlcHMv
ZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9mczIuY2d6LC9sa3AvYmVuY2htYXJrcy9mc21h
cmsuY2d6Igpqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDMxLjUyIDE0LjA5IDUuMzkgMS8x
ODQgMzE0NApzdGFydF90aW1lOiAnMTQ0MjYyNzI0MicKZW5kX3RpbWU6ICcxNDQyNjI3NDA3Jwp2
ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE1MDkxOC0xOTI4MDYiCg==

--===============3099192221750846228==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgpta2ZzIC10IHhmcyAvZGV2L3NkYjEKbW91bnQgLXQgeGZzIC1vIG5vYmFy
cmllcixpbm9kZTY0IC9kZXYvc2RiMSAvZnMvc2RiMQovZXRjL2luaXQuZC9ycGNiaW5kIHN0YXJ0
Ci9ldGMvaW5pdC5kL25mcy1jb21tb24gc3RhcnQKL2V0Yy9pbml0LmQvbmZzLWtlcm5lbC1zZXJ2
ZXIgc3RhcnQKbW91bnQgLXQgbmZzIC1vIHZlcnM9NCBsb2NhbGhvc3Q6L2ZzL3NkYjEgL25mcy9z
ZGIxCi4vZnNfbWFyayAtZCAvbmZzL3NkYjEvMSAtZCAvbmZzL3NkYjEvMiAtZCAvbmZzL3NkYjEv
MyAtZCAvbmZzL3NkYjEvNCAtZCAvbmZzL3NkYjEvNSAtZCAvbmZzL3NkYjEvNiAtZCAvbmZzL3Nk
YjEvNyAtZCAvbmZzL3NkYjEvOCAtZCAvbmZzL3NkYjEvOSAtZCAvbmZzL3NkYjEvMTAgLWQgL25m
cy9zZGIxLzExIC1kIC9uZnMvc2RiMS8xMiAtZCAvbmZzL3NkYjEvMTMgLWQgL25mcy9zZGIxLzE0
IC1kIC9uZnMvc2RiMS8xNSAtZCAvbmZzL3NkYjEvMTYgLWQgL25mcy9zZGIxLzE3IC1kIC9uZnMv
c2RiMS8xOCAtZCAvbmZzL3NkYjEvMTkgLWQgL25mcy9zZGIxLzIwIC1kIC9uZnMvc2RiMS8yMSAt
ZCAvbmZzL3NkYjEvMjIgLWQgL25mcy9zZGIxLzIzIC1kIC9uZnMvc2RiMS8yNCAtZCAvbmZzL3Nk
YjEvMjUgLWQgL25mcy9zZGIxLzI2IC1kIC9uZnMvc2RiMS8yNyAtZCAvbmZzL3NkYjEvMjggLWQg
L25mcy9zZGIxLzI5IC1kIC9uZnMvc2RiMS8zMCAtZCAvbmZzL3NkYjEvMzEgLWQgL25mcy9zZGIx
LzMyIC1EIDE2IC1OIDI1NiAtbiAzMjAwIC1MIDEgLVMgMSAtcyA5Cg==

--===============3099192221750846228==--

