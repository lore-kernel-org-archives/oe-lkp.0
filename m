Content-Type: multipart/mixed; boundary="===============6460679698028051534=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [cpufreq] f86900d952: 660.6% fsmark.time.involuntary_context_switches
Date: Sun, 14 Feb 2016 15:39:00 +0800
Message-ID: <87io1rn3l7.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6460679698028051534==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git pm-cpuf=
req-test
commit f86900d9522c787e60008acf2ab0aee39ae186f5 ("cpufreq: governor: Replac=
e timers with utilization update callbacks")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/disk/filesize/fs/iterations/kconfig/nr_directories/nr_files_per_di=
rectory/nr_threads/rootfs/sync_method/tbox_group/test_size/testcase:
  gcc-4.9/1HDD/16MB/btrfs/1x/x86_64-rhel/16d/256fpd/32t/debian-x86_64-2015-=
02-07.cgz/NoSync/nhm4/60G/fsmark

commit: =

  c06fa1d71d7da852908484e15edb0d3548b56382
  f86900d9522c787e60008acf2ab0aee39ae186f5

c06fa1d71d7da852 f86900d9522c787e60008acf2a =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     14939 =C2=B1  7%    +660.6%     113625 =C2=B1  1%  fsmark.time.involun=
tary_context_switches
      7.00 =C2=B1  0%     -14.3%       6.00 =C2=B1  0%  fsmark.time.percent=
_of_cpu_this_job_got
      2458 =C2=B1 29%     -57.2%       1051 =C2=B1  4%  uptime.idle
     14939 =C2=B1  7%    +660.6%     113625 =C2=B1  1%  time.involuntary_co=
ntext_switches
      7.00 =C2=B1  0%     -14.3%       6.00 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
      4655 =C2=B1  2%      +8.3%       5042 =C2=B1  2%  vmstat.system.cs
      1115 =C2=B1  0%     +45.3%       1621 =C2=B1  0%  vmstat.system.in
      3.08 =C2=B1  1%      +3.3%       3.19 =C2=B1  0%  turbostat.%Busy
     28.31 =C2=B1  1%     -34.4%      18.57 =C2=B1  1%  turbostat.CPU%c1
      5.52 =C2=B1  4%    +136.9%      13.08 =C2=B1  4%  turbostat.CPU%c6
 1.714e+08 =C2=B1  1%     -49.6%   86376409 =C2=B1  1%  cpuidle.C1-NHM.time
    176427 =C2=B1  1%     -45.4%      96296 =C2=B1  1%  cpuidle.C1-NHM.usage
 3.274e+08 =C2=B1  1%     -34.0%  2.162e+08 =C2=B1  1%  cpuidle.C1E-NHM.time
    217934 =C2=B1  1%     -31.8%     148665 =C2=B1  0%  cpuidle.C1E-NHM.usa=
ge
    104319 =C2=B1  2%     +61.7%     168676 =C2=B1  2%  cpuidle.C6-NHM.usage
  26558524 =C2=B1130%     -99.6%     105023 =C2=B1173%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
     12711 =C2=B1 20%   +4013.4%     522859 =C2=B1170%  latency_stats.max.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_lookup_dir_item.[btrfs].btrfs_lookup_dentry.[btrfs].btrf=
s_lookup.[btrfs].lookup_real.path_openat.do_filp_open.do_sys_open.SyS_open.=
entry_SYSCALL_64_fastpath
  43779871 =C2=B1145%     -99.5%     209718 =C2=B1173%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
  12967829 =C2=B1 91%     -93.5%     847539 =C2=B1147%  latency_stats.sum.b=
trfs_async_run_delayed_refs.[btrfs].__btrfs_end_transaction.[btrfs].btrfs_e=
nd_transaction.[btrfs].btrfs_create.[btrfs].vfs_create.path_openat.do_filp_=
open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
     83148 =C2=B1 41%   +1715.6%    1509644 =C2=B1162%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_lookup_dir_item.[btrfs].btrfs_lookup_dentry.[btrfs].btrf=
s_lookup.[btrfs].lookup_real.path_openat.do_filp_open.do_sys_open.SyS_open.=
entry_SYSCALL_64_fastpath
  53117049 =C2=B1130%     -99.6%     210046 =C2=B1173%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      1425 =C2=B1  8%     -25.3%       1065 =C2=B1 11%  slabinfo.btrfs_exte=
nt_state.active_objs
      1435 =C2=B1  7%     -25.8%       1065 =C2=B1 11%  slabinfo.btrfs_exte=
nt_state.num_objs
      2086 =C2=B1  6%     -20.5%       1657 =C2=B1 17%  slabinfo.buffer_hea=
d.active_objs
      2086 =C2=B1  6%     -20.3%       1662 =C2=B1 17%  slabinfo.buffer_hea=
d.num_objs
      1368 =C2=B1  8%     +19.4%       1633 =C2=B1  5%  slabinfo.jbd2_revok=
e_record_s.active_objs
      1368 =C2=B1  8%     +19.4%       1633 =C2=B1  5%  slabinfo.jbd2_revok=
e_record_s.num_objs
      2919 =C2=B1  6%     +58.2%       4620 =C2=B1 23%  sched_debug.cfs_rq:=
/.exec_clock.4
      2799 =C2=B1  7%     +22.7%       3435 =C2=B1  7%  sched_debug.cfs_rq:=
/.exec_clock.5
      2673 =C2=B1  8%     +21.0%       3233 =C2=B1  6%  sched_debug.cfs_rq:=
/.exec_clock.min
      3057 =C2=B1  4%     -18.4%       2495 =C2=B1 12%  sched_debug.cfs_rq:=
/.exec_clock.stddev
     36.00 =C2=B1 -2%    +416.7%     186.00 =C2=B1 35%  sched_debug.cfs_rq:=
/.load.3
     24.00 =C2=B1 10%     +74.0%      41.75 =C2=B1 28%  sched_debug.cfs_rq:=
/.load_avg.1
     65.27 =C2=B1  9%     +26.2%      82.35 =C2=B1 18%  sched_debug.cfs_rq:=
/.load_avg.max
     16042 =C2=B1  3%     -33.2%      10710 =C2=B1 14%  sched_debug.cfs_rq:=
/.min_vruntime.0
     14635 =C2=B1  4%     -27.2%      10657 =C2=B1 14%  sched_debug.cfs_rq:=
/.min_vruntime.1
     14651 =C2=B1  6%     -28.9%      10421 =C2=B1  7%  sched_debug.cfs_rq:=
/.min_vruntime.2
     13997 =C2=B1  7%     -24.5%      10564 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.3
     10388 =C2=B1  4%     -17.2%       8603 =C2=B1  5%  sched_debug.cfs_rq:=
/.min_vruntime.avg
     16198 =C2=B1  3%     -24.8%      12175 =C2=B1  6%  sched_debug.cfs_rq:=
/.min_vruntime.max
      4892 =C2=B1  9%     +17.4%       5742 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.min
      4609 =C2=B1  8%     -50.0%       2306 =C2=B1 16%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      1.75 =C2=B1 74%    +214.3%       5.50 =C2=B1 41%  sched_debug.cfs_rq:=
/.runnable_load_avg.6
     -9623 =C2=B1-11%     -62.3%      -3624 =C2=B1-74%  sched_debug.cfs_rq:=
/.spread0.4
    -10679 =C2=B1-14%     -59.8%      -4293 =C2=B1-43%  sched_debug.cfs_rq:=
/.spread0.5
     -9699 =C2=B1-18%     -55.5%      -4319 =C2=B1-45%  sched_debug.cfs_rq:=
/.spread0.6
    -10385 =C2=B1 -7%     -60.2%      -4135 =C2=B1-50%  sched_debug.cfs_rq:=
/.spread0.7
     -5653 =C2=B1-14%     -62.7%      -2108 =C2=B1-82%  sched_debug.cfs_rq:=
/.spread0.avg
    -11150 =C2=B1 -9%     -55.4%      -4968 =C2=B1-35%  sched_debug.cfs_rq:=
/.spread0.min
      4610 =C2=B1  8%     -50.0%       2306 =C2=B1 16%  sched_debug.cfs_rq:=
/.spread0.stddev
      1.50 =C2=B1100%   +1066.7%      17.50 =C2=B1121%  sched_debug.cpu.cpu=
_load[0].6
      0.75 =C2=B1110%   +1466.7%      11.75 =C2=B1112%  sched_debug.cpu.cpu=
_load[1].6
      0.88 =C2=B1  6%    +223.3%       2.85 =C2=B1 86%  sched_debug.cpu.cpu=
_load[2].avg
      0.68 =C2=B1 12%    +307.1%       2.78 =C2=B1 87%  sched_debug.cpu.cpu=
_load[3].avg
      0.58 =C2=B1 21%    +360.9%       2.67 =C2=B1 80%  sched_debug.cpu.cpu=
_load[4].avg
      2.58 =C2=B1 22%    +444.2%      14.02 =C2=B1 74%  sched_debug.cpu.cpu=
_load[4].max
      0.89 =C2=B1 18%    +447.2%       4.88 =C2=B1 76%  sched_debug.cpu.cpu=
_load[4].stddev
     98.33 =C2=B1 78%   +1152.9%       1232 =C2=B1 18%  sched_debug.cpu.cur=
r->pid.6
      0.00 =C2=B1  9%     -54.1%       0.00 =C2=B1 25%  sched_debug.cpu.nex=
t_balance.stddev
     89111 =C2=B1 20%     -25.3%      66528 =C2=B1  7%  sched_debug.cpu.nr_=
load_updates.0
     82356 =C2=B1 22%     -26.5%      60564 =C2=B1  8%  sched_debug.cpu.nr_=
load_updates.1
     81323 =C2=B1 30%     -33.6%      54024 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.3
     11128 =C2=B1 12%     +36.3%      15165 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.4
     10681 =C2=B1  4%     +20.6%      12882 =C2=B1 12%  sched_debug.cpu.nr_=
load_updates.5
     11329 =C2=B1  9%     +18.7%      13446 =C2=B1  5%  sched_debug.cpu.nr_=
load_updates.6
     10907 =C2=B1  5%     +29.0%      14075 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.7
     45728 =C2=B1 16%     -19.5%      36822 =C2=B1  6%  sched_debug.cpu.nr_=
load_updates.avg
     90421 =C2=B1 22%     -26.3%      66632 =C2=B1  7%  sched_debug.cpu.nr_=
load_updates.max
     10009 =C2=B1  5%     +21.9%      12202 =C2=B1  7%  sched_debug.cpu.nr_=
load_updates.min
     35648 =C2=B1 24%     -34.7%      23265 =C2=B1  8%  sched_debug.cpu.nr_=
load_updates.stddev
     36606 =C2=B1 15%     +79.1%      65547 =C2=B1  6%  sched_debug.cpu.nr_=
switches.4
     39444 =C2=B1 12%     +56.4%      61671 =C2=B1  9%  sched_debug.cpu.nr_=
switches.7
     35142 =C2=B1 13%     +39.9%      49178 =C2=B1 14%  sched_debug.cpu.nr_=
switches.min
    105180 =C2=B1 16%     -21.4%      82633 =C2=B1  7%  sched_debug.cpu.nr_=
switches.stddev
   -159.75 =C2=B1-51%     -74.8%     -40.25 =C2=B1-69%  sched_debug.cpu.nr_=
uninterruptible.0
    -54.75 =C2=B1-17%    -120.1%      11.00 =C2=B1 43%  sched_debug.cpu.nr_=
uninterruptible.1
    106.75 =C2=B1 28%    -109.4%     -10.00 =C2=B1-657%  sched_debug.cpu.nr=
_uninterruptible.4
     81.00 =C2=B1  9%     -50.3%      40.25 =C2=B1 44%  sched_debug.cpu.nr_=
uninterruptible.5
    123.81 =C2=B1 17%     -31.5%      84.85 =C2=B1  5%  sched_debug.cpu.nr_=
uninterruptible.max
   -171.15 =C2=B1-40%     -52.0%     -82.13 =C2=B1-18%  sched_debug.cpu.nr_=
uninterruptible.min
     94.72 =C2=B1 24%     -46.3%      50.84 =C2=B1  6%  sched_debug.cpu.nr_=
uninterruptible.stddev
     36751 =C2=B1 15%     +82.5%      67084 =C2=B1  6%  sched_debug.cpu.sch=
ed_count.4
     39579 =C2=B1 12%     +62.6%      64366 =C2=B1  9%  sched_debug.cpu.sch=
ed_count.7
     35296 =C2=B1 13%     +45.5%      51345 =C2=B1 13%  sched_debug.cpu.sch=
ed_count.min
    120177 =C2=B1 14%     -21.6%      94232 =C2=B1  8%  sched_debug.cpu.sch=
ed_count.stddev
    117880 =C2=B1 23%     -23.8%      89872 =C2=B1  9%  sched_debug.cpu.sch=
ed_goidle.3
     16039 =C2=B1 18%     +58.3%      25397 =C2=B1  6%  sched_debug.cpu.sch=
ed_goidle.4
    136606 =C2=B1 12%     -21.3%     107482 =C2=B1  6%  sched_debug.cpu.sch=
ed_goidle.max
     52011 =C2=B1 17%     -30.2%      36287 =C2=B1  7%  sched_debug.cpu.sch=
ed_goidle.stddev
    121251 =C2=B1 15%     -23.3%      93041 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.0
     28552 =C2=B1 42%    +135.6%      67272 =C2=B1 18%  sched_debug.cpu.ttw=
u_count.5
     22623 =C2=B1  9%    +148.6%      56236 =C2=B1 37%  sched_debug.cpu.ttw=
u_count.6
     17715 =C2=B1 26%     +81.4%      32139 =C2=B1 21%  sched_debug.cpu.ttw=
u_count.min
     41213 =C2=B1 19%     -37.3%      25845 =C2=B1 22%  sched_debug.cpu.ttw=
u_count.stddev
     30769 =C2=B1  4%     +49.9%      46128 =C2=B1  9%  sched_debug.cpu.ttw=
u_local.2
      2439 =C2=B1 10%    +448.8%      13389 =C2=B1 22%  sched_debug.cpu.ttw=
u_local.4
      2169 =C2=B1  8%    +468.4%      12330 =C2=B1 17%  sched_debug.cpu.ttw=
u_local.5
      2452 =C2=B1  6%    +452.2%      13541 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.6
      2758 =C2=B1  9%    +448.0%      15117 =C2=B1 10%  sched_debug.cpu.ttw=
u_local.7
      2140 =C2=B1  7%    +386.3%      10411 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.min


nhm4: Nehalem
Memory: 4G

vm-kbuild-yocto-x86_64: qemu-system-x86_64 -enable-kvm -cpu SandyBridge
Memory: 320M



                                  cpuidle.C1-NHM.time

  1.8e+08 ++-------------*-------------------------------------------------=
-*
          *.**.*.* .*.* +  **.**.*.**.*.**.*.* .*. *.*.**.*.**.**.*.**.*.**=
 |
  1.6e+08 ++      *    *                      *   *                        =
 |
          |                                                                =
 |
          |                                                                =
 |
  1.4e+08 ++                                                               =
 |
          |                                                                =
 |
  1.2e+08 ++                                                               =
 |
          |                                                                =
 |
    1e+08 ++ O   O     O                                                   =
 |
          O    O  O O O                                                    =
 |
          | O                                OO O O                        =
 |
    8e+07 ++             O  O  O O OO O OO O                               =
 |
          |                O  O                                            =
 |
    6e+07 ++---------------------------------------------------------------=
-+


                                cpuidle.C1-NHM.usage

  200000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  180000 *+**. .* .*.**.*.**.*.* .*.**.*. .**. .* .*.**.*.* .*.**.*. *. .* =
.*
         |    *  *              *        *    *  *         *        *  *  *=
 |
  160000 ++                                                                =
 |
         |                                                                 =
 |
  140000 ++                                                                =
 |
         |                                                                 =
 |
  120000 ++           O                                                    =
 |
         O  O O O                                                          =
 |
  100000 ++O     O O O                        O OO                         =
 |
         |              O  O   OO O OO O O OO                              =
 |
   80000 ++               O  O                                             =
 |
         |                                                                 =
 |
   60000 ++----------------------------------------------------------------=
-+


                                 cpuidle.C1E-NHM.time

  3.4e+08 *+-*--------------*--*----*---*--------------*--*----*--*------*-=
-+
          | *  *.*    *     : *  *.*  *  *.*.**.*.**.*  *   **  *   **. + *=
.*
  3.2e+08 ++      *. + *.*.*                                           *   =
 |
    3e+08 ++        *                                                      =
 |
          |                                                                =
 |
  2.8e+08 ++                                                               =
 |
          |                                                                =
 |
  2.6e+08 ++                                                               =
 |
          |                                                                =
 |
  2.4e+08 O+ O O       O                                                   =
 |
  2.2e+08 ++O    OO O O                       O                            =
 |
          |              O  O                O  O O                        =
 |
    2e+08 ++                   O   O  O  O                                 =
 |
          |                O  O  O  O   O  O                               =
 |
  1.8e+08 ++---------------------------------------------------------------=
-+


                                cpuidle.C1E-NHM.usage

  230000 ++----------------------------------------------------------------=
-+
  220000 *+ *.             *. .*   .* .*.             *. .*   .* .*.    .* =
 |
         | *  *.*   .**.*. : *  *.*  *   *.**.*.**.*.*  *  *.*  *   **.*  *=
.*
  210000 ++      *.*      *                                                =
 |
  200000 ++                                                                =
 |
         |                                                                 =
 |
  190000 ++                                                                =
 |
  180000 ++                                                                =
 |
  170000 ++                                                                =
 |
         |                                                                 =
 |
  160000 ++ O O       O                                                    =
 |
  150000 O+O    OO O O                      O O  O                         =
 |
         |              O  O   OO O OO   O      O                          =
 |
  140000 ++                            O   O                               =
 |
  130000 ++---------------O--O---------------------------------------------=
-+


                                cpuidle.C6-NHM.usage

  180000 ++----------------------------------------------------------------=
-+
         |                      O   OO      O O                            =
 |
  170000 ++               O  O             O     O                         =
 |
  160000 ++ O                  O  O    O O      O                          =
 |
         |      O  O    O  O                                               =
 |
  150000 ++   O  O   O                                                     =
 |
  140000 O+O          O                                                    =
 |
         |                                                                 =
 |
  130000 ++                                                                =
 |
  120000 ++                                                                =
 |
         |        .*.*    *                                                =
 |
  110000 ++      *    *. + :                                             **=
.|
  100000 *+* .*.*       *  *.*. *.*.**. .*.* .*. *.*.**.*. *.*.**. .**. +  =
 *
         |  *                  *       *    *   *         *       *    *   =
 |
   90000 ++----------------------------------------------------------------=
-+


                                turbostat.CPU_c1

  30 ++--------------------------------------------------------------------=
-+
     *. .*              .* .*.   *. .*.   *.     *. .*. *.   .*. *.     *. =
.*
  28 ++*  *.*.*. *.*.*.*  *   *.*  *   *.*  *.*.*  *   *  *.*   *  *.*.*  *=
 |
     |          *                                                          =
 |
  26 ++                                                                    =
 |
     |                                                                     =
 |
  24 ++                                                                    =
 |
     |                                                                     =
 |
  22 ++                                                                    =
 |
     |             O                                                       =
 |
  20 O+  OO O   O                                                          =
 |
     | O      O  O                        O O   O                          =
 |
  18 ++              O   O  O   O  O   O      O                            =
 |
     |                        O  O   O   O                                 =
 |
  16 ++----------------O--O------------------------------------------------=
-+


                                turbostat.CPU_c6

  15 ++--------------------------------------------------------------------=
-+
  14 ++                       O  O                                         =
 |
     |                 O  O        O O O OO     O                          =
 |
  13 ++              O   O  O   O           O O                            =
 |
  12 ++  O  O   O                                                          =
 |
  11 ++O  O   O  O O                                                       =
 |
  10 O+                                                                    =
 |
     |                                                                     =
 |
   9 ++                                                                    =
 |
   8 ++                                                                    =
 |
   7 ++                                                                    =
 |
   6 ++                                                                    =
 |
     |       .*.* .*. .*.                  .*.    .*.                 .**.*=
.*
   5 *+*.**.*    *   *   **.*.*.**.*.*.*.**   *.**   *.**.*.*.*.**.*.*     =
 |
   4 ++--------------------------------------------------------------------=
-+


                      fsmark.time.involuntary_context_switches

  140000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  120000 ++               O  O OO O O  O   O     O                         =
 |
         |  O   O  O    O  O         O   O  O O O                          =
 |
  100000 O+O  O  O   OO                                                    =
 |
         |                                                                 =
 |
   80000 ++                                                                =
 |
         |                                                                 =
 |
   60000 ++                                                                =
 |
         |                                                                 =
 |
   40000 ++                                                                =
 |
         |                                                                 =
 |
   20000 ++    .**.*.            .*.      .**.   *. .*      .*.      *. .* =
.*
         *.**.*      **.*.**.*.**   **.*.*    *.*  *  *.*.**   **.*.*  *  *=
 |
       0 ++----------------------------------------------------------------=
-+


                          time.involuntary_context_switches

  140000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  120000 ++               O  O OO O O  O   O     O                         =
 |
         |  O   O  O    O  O         O   O  O O O                          =
 |
  100000 O+O  O  O   OO                                                    =
 |
         |                                                                 =
 |
   80000 ++                                                                =
 |
         |                                                                 =
 |
   60000 ++                                                                =
 |
         |                                                                 =
 |
   40000 ++                                                                =
 |
         |                                                                 =
 |
   20000 ++    .**.*.            .*.      .**.   *. .*      .*.      *. .* =
.*
         *.**.*      **.*.**.*.**   **.*.*    *.*  *  *.*.**   **.*.*  *  *=
 |
       0 ++----------------------------------------------------------------=
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

--===============6460679698028051534==
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
b29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IGY4NjkwMGQ5NTIyYzc4N2U2MDAwOGFj
ZjJhYjBhZWUzOWFlMTg2ZjUKbW9kZWw6IE5laGFsZW0KbnJfY3B1OiA4Cm1lbW9yeTogNEcKaGRk
X3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLVdEQ19XRDEwMDNGQllaLTAxMEZCMF9X
RC1XQ0FXMzY4MTIwNDEtcGFydDEiCnN3YXBfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9h
dGEtV0RDX1dEMTAwM0ZCWVotMDEwRkIwX1dELVdDQVczNjgxMjA0MS1wYXJ0MiIKcm9vdGZzX3Bh
cnRpdGlvbjogIi9kZXYvZGlzay9ieS1pZC9hdGEtV0RDX1dEMTAwM0ZCWVotMDEwRkIwX1dELVdD
QVczNjgxMjA0MS1wYXJ0MyIKbmV0Y29uc29sZV9wb3J0OiA2NjQ5CmNhdGVnb3J5OiBiZW5jaG1h
cmsKaXRlcmF0aW9uczogMXgKbnJfdGhyZWFkczogMzJ0CmRpc2s6IDFIREQKZnM6IGJ0cmZzCmZz
MjogCmZzbWFyazoKICBmaWxlc2l6ZTogMTZNQgogIHRlc3Rfc2l6ZTogNjBHCiAgc3luY19tZXRo
b2Q6IE5vU3luYwogIG5yX2RpcmVjdG9yaWVzOiAxNmQKICBucl9maWxlc19wZXJfZGlyZWN0b3J5
OiAyNTZmcGQKcXVldWU6IGJpc2VjdAp0ZXN0Ym94OiBuaG00CnRib3hfZ3JvdXA6IG5obTQKa2Nv
bmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE2LTAyLTA5IDAwOjQxOjI1LjQyMTEy
NzQxMyArMDg6MDAKY29tcGlsZXI6IGdjYy00LjkKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUt
MDItMDcuY2d6CmlkOiA2ZjhjYWVkMjA4NTY5YTdjMWUwMDY5MTczM2ZmYjY0MzI2MDg4NjhhCnVz
ZXI6IGxrcApoZWFkX2NvbW1pdDogNjQ4OTJiN2Y3MmFjNDA0MDMwNGZkYmQ2MTIxOWFmNjVjYzM1
Y2JlNgpiYXNlX2NvbW1pdDogMzg4ZjdiMWQ2ZThjYTA2NzYyZTI0NTRkMjhkNmMzYzU1YWQwZmU5
NQpicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLXNwb3QtMjAxNjAyMDgwNzQ4CnJlc3VsdF9yb290
OiAiL3Jlc3VsdC9mc21hcmsvMXgtMzJ0LTFIREQtYnRyZnMtMTZNQi02MEctTm9TeW5jLTE2ZC0y
NTZmcGQvbmhtNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00
LjkvZjg2OTAwZDk1MjJjNzg3ZTYwMDA4YWNmMmFiMGFlZTM5YWUxODZmNS8wIgpqb2JfZmlsZTog
Ii9sa3Avc2NoZWR1bGVkL25obTQvYmlzZWN0X2ZzbWFyay0xeC0zMnQtMUhERC1idHJmcy0xNk1C
LTYwRy1Ob1N5bmMtMTZkLTI1NmZwZC1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82
NC1yaGVsLWY4NjkwMGQ5NTIyYzc4N2U2MDAwOGFjZjJhYjBhZWUzOWFlMTg2ZjUtMjAxNjAyMDkt
NTk0MTgtcjhscmVnLTAueWFtbCIKbWF4X3VwdGltZTogMTYwMC4zNAppbml0cmQ6ICIvb3NpbWFn
ZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6
Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVkdWxlZC9uaG00L2Jp
c2VjdF9mc21hcmstMXgtMzJ0LTFIREQtYnRyZnMtMTZNQi02MEctTm9TeW5jLTE2ZC0yNTZmcGQt
ZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZfNjQtcmhlbC1mODY5MDBkOTUyMmM3ODdl
NjAwMDhhY2YyYWIwYWVlMzlhZTE4NmY1LTIwMTYwMjA5LTU5NDE4LXI4bHJlZy0wLnlhbWwKLSBB
UkNIPXg4Nl82NAotIGtjb25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9bGludXgtZGV2ZWwvZGV2
ZWwtc3BvdC0yMDE2MDIwODA3NDgKLSBjb21taXQ9Zjg2OTAwZDk1MjJjNzg3ZTYwMDA4YWNmMmFi
MGFlZTM5YWUxODZmNQotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45
L2Y4NjkwMGQ5NTIyYzc4N2U2MDAwOGFjZjJhYjBhZWUzOWFlMTg2ZjUvdm1saW51ei00LjUuMC1y
YzItMDAwMDktZ2Y4NjkwMGQKLSBtYXhfdXB0aW1lPTE2MDAKLSBSRVNVTFRfUk9PVD0vcmVzdWx0
L2ZzbWFyay8xeC0zMnQtMUhERC1idHJmcy0xNk1CLTYwRy1Ob1N5bmMtMTZkLTI1NmZwZC9uaG00
L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS9mODY5MDBk
OTUyMmM3ODdlNjAwMDhhY2YyYWIwYWVlMzlhZTE4NmY1LzAKLSBMS1BfU0VSVkVSPWlubgotIHwt
CiAgbGliYXRhLmZvcmNlPTEuNUdicHMKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3Rl
bWQubG9nX2xldmVsPWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQg
cmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBf
cGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9t
cHRfcmFtZGlzaz0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3Jt
YWwKCiAgcncKbGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2lu
aXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9mODY5MDBkOTUyMmM3ODdlNjAw
MDhhY2YyYWIwYWVlMzlhZTE4NmY1L21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9k
ZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2Rl
Ymlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBz
L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFy
a3MvdHVyYm9zdGF0LmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5j
Z3ovZnMuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9mczIu
Y2d6LC9sa3AvYmVuY2htYXJrcy9mc21hcmsuY2d6IgpsaW51eF9oZWFkZXJzX2luaXRyZDogIi9w
a2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9mODY5MDBkOTUyMmM3ODdlNjAwMDhhY2YyYWIw
YWVlMzlhZTE4NmY1L2xpbnV4LWhlYWRlcnMuY2d6IgpyZXBlYXRfdG86IDIKa2VybmVsOiAiL3Br
Zy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2Y4NjkwMGQ5NTIyYzc4N2U2MDAwOGFjZjJhYjBh
ZWUzOWFlMTg2ZjUvdm1saW51ei00LjUuMC1yYzItMDAwMDktZ2Y4NjkwMGQiCmRlcXVldWVfdGlt
ZTogMjAxNi0wMi0wOSAwMDo1NzozMi4zNDQ3MDM2NzMgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNo
ZWQKbG9hZGF2ZzogMzAuMjAgMjYuNjIgMTMuNjQgMS8xOTEgNzA4MApzdGFydF90aW1lOiAnMTQ1
NDk1MDY4MCcKZW5kX3RpbWU6ICcxNDU0OTUxMTU5Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0y
MDE2MDIwOC0xMTM1MjkiCg==

--===============6460679698028051534==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMi0wOSAwMDo1Nzo1OSBta2ZzIC10IGJ0cmZzIC9kZXYvc2RhMQoyMDE2LTAyLTA5IDAw
OjU3OjU5IG1vdW50IC10IGJ0cmZzIC9kZXYvc2RhMSAvZnMvc2RhMQoyMDE2LTAyLTA5IDAwOjU4
OjAwIC4vZnNfbWFyayAtZCAvZnMvc2RhMS8xIC1kIC9mcy9zZGExLzIgLWQgL2ZzL3NkYTEvMyAt
ZCAvZnMvc2RhMS80IC1kIC9mcy9zZGExLzUgLWQgL2ZzL3NkYTEvNiAtZCAvZnMvc2RhMS83IC1k
IC9mcy9zZGExLzggLWQgL2ZzL3NkYTEvOSAtZCAvZnMvc2RhMS8xMCAtZCAvZnMvc2RhMS8xMSAt
ZCAvZnMvc2RhMS8xMiAtZCAvZnMvc2RhMS8xMyAtZCAvZnMvc2RhMS8xNCAtZCAvZnMvc2RhMS8x
NSAtZCAvZnMvc2RhMS8xNiAtZCAvZnMvc2RhMS8xNyAtZCAvZnMvc2RhMS8xOCAtZCAvZnMvc2Rh
MS8xOSAtZCAvZnMvc2RhMS8yMCAtZCAvZnMvc2RhMS8yMSAtZCAvZnMvc2RhMS8yMiAtZCAvZnMv
c2RhMS8yMyAtZCAvZnMvc2RhMS8yNCAtZCAvZnMvc2RhMS8yNSAtZCAvZnMvc2RhMS8yNiAtZCAv
ZnMvc2RhMS8yNyAtZCAvZnMvc2RhMS8yOCAtZCAvZnMvc2RhMS8yOSAtZCAvZnMvc2RhMS8zMCAt
ZCAvZnMvc2RhMS8zMSAtZCAvZnMvc2RhMS8zMiAtRCAxNiAtTiAyNTYgLW4gMTIwIC1MIDEgLVMg
MCAtcyAxNjc3NzIxNgo=

--===============6460679698028051534==--

