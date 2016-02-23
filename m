Content-Type: multipart/mixed; boundary="===============0247916545723905692=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [kernel/fs] d57d611505: +54.7% turbostat.%Busy
Date: Tue, 23 Feb 2016 16:26:10 +0800
Message-ID: <87mvqrn87x.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0247916545723905692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit d57d611505d911c6f9f81cd9bd6dbd293d66dd9f ("kernel/fs: fix I/O wait n=
ot accounted for RW O_DSYNC")


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

  09954bad448791ef01202351d437abdd9497a804
  d57d611505d911c6f9f81cd9bd6dbd293d66dd9f

09954bad448791ef d57d611505d911c6f9f81cd9bd =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     14760 =C2=B1  1%      +6.3%      15695 =C2=B1  1%  fsmark.time.involun=
tary_context_switches
     46.00 =C2=B1  0%      -8.2%      42.25 =C2=B1  1%  fsmark.time.percent=
_of_cpu_this_job_got
     26151 =C2=B1116%     -71.3%       7498 =C2=B1 23%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_mkdir.[f2fs].vfs_mkdir.SyS_mkdir.entry_SYSC=
ALL_64_fastpath
      7418 =C2=B1 23%     -27.7%       5361 =C2=B1  3%  numa-vmstat.node0.n=
r_slab_unreclaimable
      1.47 =C2=B1  1%      -9.9%       1.33 =C2=B1  0%  time.user_time
      1447 =C2=B1  4%     -29.0%       1028 =C2=B1  7%  uptime.idle
      7.75 =C2=B1 19%    +206.5%      23.75 =C2=B1  1%  vmstat.procs.b
     29675 =C2=B1 23%     -27.7%      21447 =C2=B1  3%  numa-meminfo.node0.=
SUnreclaim
     83099 =C2=B1  8%     -11.5%      73568 =C2=B1  1%  numa-meminfo.node0.=
Slab
     11.91 =C2=B1  1%     +54.7%      18.43 =C2=B1  1%  turbostat.%Busy
    358.00 =C2=B1  1%     +60.0%     572.75 =C2=B1  1%  turbostat.Avg_MHz
     21.54 =C2=B1  0%     -17.4%      17.79 =C2=B1  1%  turbostat.CPU%c1
     24.78 =C2=B1  3%     +41.1%      34.98 =C2=B1  1%  turbostat.CPU%c3
     41.76 =C2=B1  1%     -31.0%      28.81 =C2=B1  1%  turbostat.CPU%c6
      8.53 =C2=B1  5%     -25.6%       6.34 =C2=B1 10%  turbostat.Pkg%pc3
  66312232 =C2=B1  0%     -68.5%   20910669 =C2=B1  4%  cpuidle.C1-NHM.time
  46386272 =C2=B1  2%     -20.5%   36884085 =C2=B1  5%  cpuidle.C1E-NHM.time
  2.79e+08 =C2=B1  2%     +51.5%  4.226e+08 =C2=B1  0%  cpuidle.C3-NHM.time
    254315 =C2=B1  2%     +25.1%     318250 =C2=B1  2%  cpuidle.C3-NHM.usage
 7.585e+08 =C2=B1  1%     -22.2%  5.901e+08 =C2=B1  1%  cpuidle.C6-NHM.time
    415414 =C2=B1  1%     -38.1%     257115 =C2=B1  1%  cpuidle.C6-NHM.usage
 1.135e+08 =C2=B1  1%     +77.8%  2.017e+08 =C2=B1  2%  cpuidle.POLL.time
    102777 =C2=B1  1%     +36.0%     139811 =C2=B1  1%  cpuidle.POLL.usage
      2011 =C2=B1 25%     -27.1%       1467 =C2=B1  2%  sched_debug.cfs_rq:=
/.exec_clock.2
      1820 =C2=B1  3%     -12.2%       1597 =C2=B1  7%  sched_debug.cfs_rq:=
/.exec_clock.4
      4297 =C2=B1  6%     +78.1%       7653 =C2=B1 54%  sched_debug.cfs_rq:=
/.min_vruntime.12
      4803 =C2=B1 18%     -16.1%       4028 =C2=B1 21%  sched_debug.cfs_rq:=
/.min_vruntime.8
      3763 =C2=B1  4%     -17.0%       3124 =C2=B1  7%  sched_debug.cfs_rq:=
/.min_vruntime.9
      3408 =C2=B1  4%     -14.9%       2900 =C2=B1  2%  sched_debug.cfs_rq:=
/.min_vruntime.min
      4.75 =C2=B1 54%     -73.7%       1.25 =C2=B1173%  sched_debug.cfs_rq:=
/.nr_spread_over.2
      1.99 =C2=B1 16%     +25.5%       2.50 =C2=B1  9%  sched_debug.cfs_rq:=
/.nr_spread_over.stddev
     -4362 =C2=B1-25%     -92.7%    -318.24 =C2=B1-1304%  sched_debug.cfs_r=
q:/.spread0.12
    200.25 =C2=B1 47%     -48.8%     102.50 =C2=B1 22%  sched_debug.cfs_rq:=
/.util_avg.7
    187.75 =C2=B1 64%     -77.2%      42.75 =C2=B1 56%  sched_debug.cfs_rq:=
/.util_avg.8
      1.41 =C2=B1 31%     +37.0%       1.93 =C2=B1 12%  sched_debug.cpu.clo=
ck.stddev
      1.41 =C2=B1 31%     +37.0%       1.93 =C2=B1 12%  sched_debug.cpu.clo=
ck_task.stddev
      1.63 =C2=B1 67%     -53.9%       0.75 =C2=B1 38%  sched_debug.cpu.cpu=
_load[4].stddev
     33822 =C2=B1 16%     -17.2%      28018 =C2=B1  4%  sched_debug.cpu.nr_=
switches.13
     36824 =C2=B1  3%     +12.9%      41569 =C2=B1  4%  sched_debug.cpu.nr_=
switches.14
     33117 =C2=B1  7%     -11.1%      29438 =C2=B1  5%  sched_debug.cpu.nr_=
switches.15
     57634 =C2=B1  3%      +8.8%      62716 =C2=B1  3%  sched_debug.cpu.nr_=
switches.4
      1723 =C2=B1  7%     -11.3%       1527 =C2=B1  5%  sched_debug.cpu.nr_=
uninterruptible.10
      1378 =C2=B1  6%      -8.7%       1258 =C2=B1  5%  sched_debug.cpu.nr_=
uninterruptible.15
      1232 =C2=B1 10%     +25.3%       1543 =C2=B1  3%  sched_debug.cpu.nr_=
uninterruptible.8
     34660 =C2=B1 13%     -19.1%      28034 =C2=B1  4%  sched_debug.cpu.sch=
ed_count.13
     37545 =C2=B1  2%     +18.9%      44629 =C2=B1  7%  sched_debug.cpu.sch=
ed_count.14
     34003 =C2=B1  9%     -13.4%      29456 =C2=B1  5%  sched_debug.cpu.sch=
ed_count.15
     62715 =C2=B1  6%      +9.5%      68642 =C2=B1  7%  sched_debug.cpu.sch=
ed_count.2
     14091 =C2=B1 19%     -20.4%      11212 =C2=B1  5%  sched_debug.cpu.sch=
ed_goidle.13
     14175 =C2=B1  3%     +15.4%      16354 =C2=B1  6%  sched_debug.cpu.sch=
ed_goidle.14
     13465 =C2=B1  9%     -12.5%      11782 =C2=B1  6%  sched_debug.cpu.sch=
ed_goidle.15
     24646 =C2=B1  3%      +9.4%      26968 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.4
     15258 =C2=B1  6%     -22.8%      11773 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.11
     15765 =C2=B1  5%     +48.1%      23355 =C2=B1 15%  sched_debug.cpu.ttw=
u_count.12
     16869 =C2=B1  3%     -26.1%      12461 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.13
      3142 =C2=B1  5%     +13.0%       3551 =C2=B1  8%  sched_debug.cpu.ttw=
u_local.13

lkp-ne04: Nehalem-EP
Memory: 12G

                                    uptime.idle

  1600 ++------------------------------------------------------------------=
-+
       |      .*. *.                                                       =
 |
  1500 *+**.**   *  **.*.**.*  *.**.**.*.**.*  *.**.*.**.**.*.**.**.*.*  **=
.*
  1400 ++                   : :              : :                       :+  =
 |
       |                     ::              ::                        *   =
 |
  1300 ++                    *                *                            =
 |
       |                                                                   =
 |
  1200 ++                                                                  =
 |
       |                                                                   =
 |
  1100 O+OO OO O  O OO O OO OO O O  OO O                                   =
 |
  1000 ++                                                                  =
 |
       |                                                                   =
 |
   900 ++        O                O                                        =
 |
       |                                                                   =
 |
   800 ++------------------------------------------------------------------=
-+


                                   cpuidle.POLL.time

  2.2e+08 ++---------------O--O----O---------------------------------------=
-+
          O     O O   O               O                                    =
 |
    2e+08 ++O  O   O O      O  O O     O                                   =
 |
          |  O          OO          O    O                                 =
 |
          |                                                                =
 |
  1.8e+08 ++                                                               =
 |
          |                                                                =
 |
  1.6e+08 ++                                                               =
 |
          |                                                                =
 |
  1.4e+08 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
  1.2e+08 ++     .* .*   *.     .*.**.  .**.    *.**.   *.*   *. *.**.**.**=
.|
          *.**.**  *  *. : **. *      **    **.*     *.*   *.*  *          =
 *
    1e+08 ++------------*-----*--------------------------------------------=
-+


                                 cpuidle.C1-NHM.time

  8e+07 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  7e+07 ++                     .*   *. .*      .*   *. *.    .*     *.*    =
 |
        |  *. *.**.*.  .**.*. *  *.*  *  *. *.*  *.*  *  *. *  *. .*   *.**=
.*
  6e+07 *+*  *       **      *             *               *     *         =
 |
        |                                                                  =
 |
  5e+07 ++                                                                 =
 |
        |                                                                  =
 |
  4e+07 ++                                                                 =
 |
        |                                                                  =
 |
  3e+07 ++                                                                 =
 |
        |          O O                                                     =
 |
  2e+07 O+OO OO OO    O OO O OO OO OO O O                                  =
 |
        |                                                                  =
 |
  1e+07 ++-----------------------------------------------------------------=
-+


                                  cpuidle.C3-NHM.time

  4.4e+08 ++------------O--------------------------------------------------=
-+
          | OO O   O             O  O O  O                                 =
 |
  4.2e+08 O+    O    O   O  O  O       O                                   =
 |
    4e+08 ++      O   O    O  O    O                                       =
 |
          |                                                                =
 |
  3.8e+08 ++                                                               =
 |
  3.6e+08 ++                                                               =
 |
          |                                                                =
 |
  3.4e+08 ++                                                               =
 |
  3.2e+08 ++                                                               =
 |
          |             *                                                  =
 |
    3e+08 ++           +:     **             *.*            .*             =
 |
  2.8e+08 *+ *. *. *. *  :.* +  + .* .**.  .*   :.* .*.*   *  *.**.* .*    =
.*
          | *  *  *  *   *  *    *  *    **     *  *    *.*         *  *.**=
 |
  2.6e+08 ++---------------------------------------------------------------=
-+


                                  cpuidle.C6-NHM.time

    8e+08 ++----------*----------------------------------------------------=
-+
          |    * .* .* +  .*                                               =
 |
          |.* + *  *    **  *. *.*. *. *.**.**.**. *. .**.**.**. *.**. *.* =
 |
  7.5e+08 *+ *                *    *  *           *  *          *     *   *=
.*
          |                                                                =
 |
          |                                                                =
 |
    7e+08 ++                                                               =
 |
          |                                                                =
 |
  6.5e+08 ++                                                               =
 |
          |                                                                =
 |
          O                                                                =
 |
    6e+08 ++ O    OO  O    O  O  O O  O                                    =
 |
          | O  OO    O   O  O  O       O O                                 =
 |
          |             O           O                                      =
 |
  5.5e+08 ++---------------------------------------------------------------=
-+


                                cpuidle.C6-NHM.usage

  440000 ++----------------------------------------------------------------=
-+
  420000 ++          *.   *. *.     .*. *           .* .*    .*.*       .* =
 |
         |.* .**.**. : *.*  *  **.**   * + *.**.*.**  *  :.**    :   .**  *=
.*
  400000 *+ *       *                     *              *       *.**      =
 |
  380000 ++                                                                =
 |
         |                                                                 =
 |
  360000 ++                                                                =
 |
  340000 ++                                                                =
 |
  320000 ++                                                                =
 |
         |                                                                 =
 |
  300000 ++                                                                =
 |
  280000 ++                                                                =
 |
         | O        O       O  O       O                                   =
 |
  260000 O+ O OO OO  O O OO  O  O OO O  O                                  =
 |
  240000 ++----------------------------------------------------------------=
-+


                                 turbostat.Avg_MHz

  650 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
  600 O+     OO    O    O  O    O                                          =
 |
      | O  O    OO    O   O  OO   OO O                                     =
 |
  550 ++ O           O                 O                                   =
 |
      |                                                                    =
 |
  500 ++                                                                   =
 |
      |                                                                    =
 |
  450 ++                                                                   =
 |
      |                                                                    =
 |
  400 ++                                                                   =
 |
      |                       *.*.*   .**.    .**.*.  .**.      .* .**.   *=
.|
  350 *+**.*.**.**.*. *.*.* .*     *.*    **.*      **    *.**.*  *    *.* =
 *
      |              *     *                                               =
 |
  300 ++-------------------------------------------------------------------=
-+


                                 turbostat._Busy

  20 ++--------------------------------------------------------------------=
-+
  19 O+     O          O  O    O                                           =
 |
     |       O O OO   O  O  O O  O OO                                      =
 |
  18 ++OO O         O                 O                                    =
 |
  17 ++                                                                    =
 |
     |                                                                     =
 |
  16 ++                                                                    =
 |
  15 ++                                                                    =
 |
  14 ++                                                                    =
 |
     |                                                                     =
 |
  13 ++                                                                    =
 |
  12 ++         .*           .**.*.* .*.**.   *.*.**. .**.* .*.**.*.**.*.**=
.|
     *.**.*.**.*  *. .**.* .*       *      *.*       *     *               =
 *
  11 ++             *     *                                                =
 |
  10 ++--------------------------------------------------------------------=
-+


                                turbostat.CPU_c1

  23 ++--------------------------------------------------------------------=
-+
     |                   *    *               *.                           =
 |
  22 ++               * +:   : *. .*  *.      : *. *   *             *.    =
 |
     |  *.   *. .*   : *  :  :   *  :+  * .*.:    * + + *. *.*.* .*.*  *.**=
.*
  21 *+*  *.*  *  :  :    *.*       *    *   *       *    *     *          =
 |
     |            *.*                                                      =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  19 ++                                                                    =
 |
     |                                                                     =
 |
  18 ++     O    OO    O  O      O  O O                                    =
 |
     | OO O         O O  O  O O    O                                       =
 |
  17 O+      O O               O                                           =
 |
     |                                                                     =
 |
  16 ++--------------------------------------------------------------------=
-+


                                turbostat.CPU_c3

  38 ++--------------------------------------------------------------------=
-+
     |              O                                                      =
 |
  36 ++OO O      O    O          O                                         =
 |
  34 ++     O  O         O  O O    OO O                                    =
 |
     O       O    O                                                        =
 |
  32 ++                O  O    O                                           =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
     |                                                                     =
 |
  28 ++             *                                                      =
 |
  26 ++            : :    *.*              *.*             *               =
.*
     *. *. .* .*.  : : *. :  : *. .**.    +  :  *. *.*.    :+ .* .*. *.   *=
 |
  24 ++*  *  *   **   *  *   : : *    *.**    :+  *    **.*  *  *   *  *.* =
 |
     |                        *               *                            =
 |
  22 ++--------------------------------------------------------------------=
-+


                                turbostat.CPU_c6

  44 ++---*-------*--------------------------------------------------------=
-+
     |.* + + *.*.* + .**.        *. *. .**        * .*. *.*     *.    .*.* =
 |
  42 *+ *   *       *    **.*.* +  *  *   + .**. + *   *   :.*.*  *.**    *=
.|
  40 ++                        *           *    *          *               =
 *
     |                                                                     =
 |
  38 ++                                                                    =
 |
  36 ++                                                                    =
 |
     |                                                                     =
 |
  34 ++                                                                    =
 |
  32 ++                                                                    =
 |
     O       O                 O                                           =
 |
  30 ++        O  O    O OO O O    O                                       =
 |
  28 ++OO O O         O          O  O O                                    =
 |
     |           O  O                                                      =
 |
  26 ++--------------------------------------------------------------------=
-+


                                 vmstat.procs.b

  30 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
     |         O                                                           =
 |
  25 O+O    O     O    O OO O  O O  O O                                    =
 |
     |  O O  O   O  O O       O    O                                       =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  15 ++                                                                    =
 |
     |                                                                     =
 |
     |                                                                     =
 |
  10 ++*               *.*   .* .*       *.*. *. .*      .**.*.          * =
 |
     |+ :.*.    .*   .*   *.*  *  + *. .*    *  *  :.*. *      **. .**. + :=
.*
     *  *   **.*  :.*              *  *            *   *          *    *  *=
 |
   5 ++-----------*--------------------------------------------------------=
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

--===============0247916545723905692==
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
OiBkNTdkNjExNTA1ZDkxMWM2ZjlmODFjZDliZDZkYmQyOTNkNjZkZDlmCm1vZGVsOiBOZWhhbGVt
LUVQCm1lbW9yeTogMTJHCmhkZF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1TVDM1
MDA1MTROU185V0owM0VCQS1wYXJ0MyIKc3dhcF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlk
L2F0YS1TVDMxMjAwMjZBU181TVMwN0hBMi1wYXJ0MiIKcm9vdGZzX3BhcnRpdGlvbjogIi9kZXYv
ZGlzay9ieS1pZC9hdGEtU1QzNTAwNTE0TlNfOVdKMDNFQkEtcGFydDEiCmNhdGVnb3J5OiBiZW5j
aG1hcmsKaXRlcmF0aW9uczogMXgKbnJfdGhyZWFkczogMzJ0CmRpc2s6IDFIREQKZnM6IGYyZnMK
ZnMyOiAKZnNtYXJrOgogIGZpbGVzaXplOiA5QgogIHRlc3Rfc2l6ZTogNDAwTQogIHN5bmNfbWV0
aG9kOiBmc3luY0JlZm9yZUNsb3NlCiAgbnJfZGlyZWN0b3JpZXM6IDE2ZAogIG5yX2ZpbGVzX3Bl
cl9kaXJlY3Rvcnk6IDI1NmZwZApxdWV1ZTogYmlzZWN0CnRlc3Rib3g6IGxrcC1uZTA0CnRib3hf
Z3JvdXA6IGxrcC1uZTA0Cmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNi0w
Mi0yMiAxMDo1ODowOS4zNjQ3OTc3NTEgKzA4OjAwCmNvbXBpbGVyOiBnY2MtNC45CnJvb3Rmczog
ZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegppZDogNmQyNjYyYWZjOTMxNDNmODYyZjE4OWVh
OThiMWM0NjJiMmZmNjIxNQp1c2VyOiBsa3AKaGVhZF9jb21taXQ6IGNiMGRkYmE4NTZhZmQyNmY0
YWEzMmNhMjg2ZTc5OGZhZTgzNWM1ZDQKYmFzZV9jb21taXQ6IDgxZjcwYmEyMzNkNWY2NjBlMWVh
NWZlMjMyNjBlZTMyM2FmNWQ1M2EKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAx
NjAyMjIwMQpyZXN1bHRfcm9vdDogIi9yZXN1bHQvZnNtYXJrL3BlcmZvcm1hbmNlLTF4LTMydC0x
SERELWYyZnMtOUItNDAwTS1mc3luY0JlZm9yZUNsb3NlLTE2ZC0yNTZmcGQvbGtwLW5lMDQvZGVi
aWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45L2Q1N2Q2MTE1MDVk
OTExYzZmOWY4MWNkOWJkNmRiZDI5M2Q2NmRkOWYvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxl
ZC9sa3AtbmUwNC9iaXNlY3RfZnNtYXJrLXBlcmZvcm1hbmNlLTF4LTMydC0xSERELWYyZnMtOUIt
NDAwTS1mc3luY0JlZm9yZUNsb3NlLTE2ZC0yNTZmcGQtZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNnei14ODZfNjQtcmhlbC1kNTdkNjExNTA1ZDkxMWM2ZjlmODFjZDliZDZkYmQyOTNkNjZkZDlm
LTIwMTYwMjIyLTIyMDczLTFtaDgxMHItMC55YW1sIgpucl9jcHU6ICIkKG5wcm9jKSIKbWF4X3Vw
dGltZTogODM5LjE0MDAwMDAwMDAwMDEKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0w
Ci0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbGtwLW5lMDQvYmlzZWN0X2ZzbWFyay1w
ZXJmb3JtYW5jZS0xeC0zMnQtMUhERC1mMmZzLTlCLTQwME0tZnN5bmNCZWZvcmVDbG9zZS0xNmQt
MjU2ZnBkLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtZDU3ZDYxMTUw
NWQ5MTFjNmY5ZjgxY2Q5YmQ2ZGJkMjkzZDY2ZGQ5Zi0yMDE2MDIyMi0yMjA3My0xbWg4MTByLTAu
eWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1k
ZXZlbC9kZXZlbC1ob3VybHktMjAxNjAyMjIwMQotIGNvbW1pdD1kNTdkNjExNTA1ZDkxMWM2Zjlm
ODFjZDliZDZkYmQyOTNkNjZkZDlmCi0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVs
L2djYy00LjkvZDU3ZDYxMTUwNWQ5MTFjNmY5ZjgxY2Q5YmQ2ZGJkMjkzZDY2ZGQ5Zi92bWxpbnV6
LTQuNS4wLXJjMS0wMDE5Mi1nZDU3ZDYxMQotIG1heF91cHRpbWU9ODM5Ci0gUkVTVUxUX1JPT1Q9
L3Jlc3VsdC9mc21hcmsvcGVyZm9ybWFuY2UtMXgtMzJ0LTFIREQtZjJmcy05Qi00MDBNLWZzeW5j
QmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC9sa3AtbmUwNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6L3g4Nl82NC1yaGVsL2djYy00LjkvZDU3ZDYxMTUwNWQ5MTFjNmY5ZjgxY2Q5YmQ2ZGJkMjkz
ZDY2ZGQ5Zi8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMwLDEx
NTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5
c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBz
b2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1k
aXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5
MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNneiIK
bW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvZDU3ZDYxMTUw
NWQ5MTFjNmY5ZjgxY2Q5YmQ2ZGJkMjkzZDY2ZGQ5Zi9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAi
L29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1h
Z2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29z
aW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xr
cC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIw
MTUtMDItMDcuY2d6L2ZzLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3ovZnMyLmNneiwvbGtwL2JlbmNobWFya3MvZnNtYXJrLmNneiIKbGludXhfaGVhZGVyc19p
bml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvZDU3ZDYxMTUwNWQ5MTFjNmY5
ZjgxY2Q5YmQ2ZGJkMjkzZDY2ZGQ5Zi9saW51eC1oZWFkZXJzLmNneiIKcmVwZWF0X3RvOiAyCmtl
cm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9kNTdkNjExNTA1ZDkxMWM2Zjlm
ODFjZDliZDZkYmQyOTNkNjZkZDlmL3ZtbGludXotNC41LjAtcmMxLTAwMTkyLWdkNTdkNjExIgpk
ZXF1ZXVlX3RpbWU6IDIwMTYtMDItMjIgMTE6MDc6MDEuNjIyMjU2MDY4ICswODowMApqb2Jfc3Rh
dGU6IGZpbmlzaGVkCmxvYWRhdmc6IDIzLjIzIDcuNDggMi42MyAyLzI1NyAzMTgwCnN0YXJ0X3Rp
bWU6ICcxNDU2MTEwNDcwJwplbmRfdGltZTogJzE0NTYxMTA1NTAnCnZlcnNpb246ICIvbGtwL2xr
cC8uc3JjLTIwMTYwMjIyLTEwNTgzOCIK

--===============0247916545723905692==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMi0yMiAxMTowNzo0NyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yMiAxMTowNzo0NyBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yMiAxMTowNzo0NyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDItMjIgMTE6MDc6NDcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTIyIDExOjA3OjQ3IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMi0yMiAxMTowNzo0NyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDIt
MjIgMTE6MDc6NDcgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTIyIDExOjA3OjQ3IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMi0yMiAxMTowNzo0NyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yMiAx
MTowNzo0NyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1My9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yMiAxMTowNzo0NyBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMi0yMiAxMTowNzo0NyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yMiAxMTowNzo0
NyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ni9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yMiAxMTowNzo0NyBlY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wMi0yMiAxMTowNzo0NyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yMiAxMTowNzo0NyBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMi0yMiAxMTowNzo0NyBta2ZzIC10IGYyZnMgL2Rldi9zZGEzCjIw
MTYtMDItMjIgMTE6MDc6NDkgbW91bnQgLXQgZjJmcyAvZGV2L3NkYTMgL2ZzL3NkYTMKMjAxNi0w
Mi0yMiAxMTowNzo1MCAuL2ZzX21hcmsgLWQgL2ZzL3NkYTMvMSAtZCAvZnMvc2RhMy8yIC1kIC9m
cy9zZGEzLzMgLWQgL2ZzL3NkYTMvNCAtZCAvZnMvc2RhMy81IC1kIC9mcy9zZGEzLzYgLWQgL2Zz
L3NkYTMvNyAtZCAvZnMvc2RhMy84IC1kIC9mcy9zZGEzLzkgLWQgL2ZzL3NkYTMvMTAgLWQgL2Zz
L3NkYTMvMTEgLWQgL2ZzL3NkYTMvMTIgLWQgL2ZzL3NkYTMvMTMgLWQgL2ZzL3NkYTMvMTQgLWQg
L2ZzL3NkYTMvMTUgLWQgL2ZzL3NkYTMvMTYgLWQgL2ZzL3NkYTMvMTcgLWQgL2ZzL3NkYTMvMTgg
LWQgL2ZzL3NkYTMvMTkgLWQgL2ZzL3NkYTMvMjAgLWQgL2ZzL3NkYTMvMjEgLWQgL2ZzL3NkYTMv
MjIgLWQgL2ZzL3NkYTMvMjMgLWQgL2ZzL3NkYTMvMjQgLWQgL2ZzL3NkYTMvMjUgLWQgL2ZzL3Nk
YTMvMjYgLWQgL2ZzL3NkYTMvMjcgLWQgL2ZzL3NkYTMvMjggLWQgL2ZzL3NkYTMvMjkgLWQgL2Zz
L3NkYTMvMzAgLWQgL2ZzL3NkYTMvMzEgLWQgL2ZzL3NkYTMvMzIgLUQgMTYgLU4gMjU2IC1uIDMy
MDAgLUwgMSAtUyAxIC1zIDkK

--===============0247916545723905692==--

