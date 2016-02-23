Content-Type: multipart/mixed; boundary="===============3511169039408371146=="
MIME-Version: 1.0
From: Stephane Gasparini <stephane.gasparini@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [kernel/fs] d57d611505: +54.7% turbostat.%Busy
Date: Tue, 23 Feb 2016 09:55:33 +0100
Message-ID: <6B0A72EF-07D6-4906-A908-AD490C66C758@linux.intel.com>
In-Reply-To: <87mvqrn87x.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3511169039408371146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The increase of this metric is expected as the I/O wait (I/O busy) were not=
 accounted on some write operation before this patch and are accounted now.


=E2=80=94
Steph




> On Feb 23, 2016, at 9:26 AM, kernel test robot <ying.huang@linux.intel.=
com> wrote:
> =

> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit d57d611505d911c6f9f81cd9bd6dbd293d66dd9f ("kernel/fs: fix I/O wait=
 not accounted for RW O_DSYNC")
> =

> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/disk/filesize/fs/iterations/kconfig/nr_director=
ies/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_si=
ze/testcase:
>  gcc-4.9/performance/1HDD/9B/f2fs/1x/x86_64-rhel/16d/256fpd/32t/debian-x8=
6_64-2015-02-07.cgz/fsyncBeforeClose/lkp-ne04/400M/fsmark
> =

> commit: =

>  09954bad448791ef01202351d437abdd9497a804
>  d57d611505d911c6f9f81cd9bd6dbd293d66dd9f
> =

> 09954bad448791ef d57d611505d911c6f9f81cd9bd =

> ---------------- -------------------------- =

>         %stddev     %change         %stddev
>             \          |                \  =

>     14760 =C2=B1  1%      +6.3%      15695 =C2=B1  1%  fsmark.time.involu=
ntary_context_switches
>     46.00 =C2=B1  0%      -8.2%      42.25 =C2=B1  1%  fsmark.time.percen=
t_of_cpu_this_job_got
>     26151 =C2=B1116%     -71.3%       7498 =C2=B1 23%  latency_stats.sum.=
call_rwsem_down_read_failed.f2fs_mkdir.[f2fs].vfs_mkdir.SyS_mkdir.entry_SYS=
CALL_64_fastpath
>      7418 =C2=B1 23%     -27.7%       5361 =C2=B1  3%  numa-vmstat.node0.=
nr_slab_unreclaimable
>      1.47 =C2=B1  1%      -9.9%       1.33 =C2=B1  0%  time.user_time
>      1447 =C2=B1  4%     -29.0%       1028 =C2=B1  7%  uptime.idle
>      7.75 =C2=B1 19%    +206.5%      23.75 =C2=B1  1%  vmstat.procs.b
>     29675 =C2=B1 23%     -27.7%      21447 =C2=B1  3%  numa-meminfo.node0=
.SUnreclaim
>     83099 =C2=B1  8%     -11.5%      73568 =C2=B1  1%  numa-meminfo.node0=
.Slab
>     11.91 =C2=B1  1%     +54.7%      18.43 =C2=B1  1%  turbostat.%Busy
>    358.00 =C2=B1  1%     +60.0%     572.75 =C2=B1  1%  turbostat.Avg_MHz
>     21.54 =C2=B1  0%     -17.4%      17.79 =C2=B1  1%  turbostat.CPU%c1
>     24.78 =C2=B1  3%     +41.1%      34.98 =C2=B1  1%  turbostat.CPU%c3
>     41.76 =C2=B1  1%     -31.0%      28.81 =C2=B1  1%  turbostat.CPU%c6
>      8.53 =C2=B1  5%     -25.6%       6.34 =C2=B1 10%  turbostat.Pkg%pc3
>  66312232 =C2=B1  0%     -68.5%   20910669 =C2=B1  4%  cpuidle.C1-NHM.time
>  46386272 =C2=B1  2%     -20.5%   36884085 =C2=B1  5%  cpuidle.C1E-NHM.ti=
me
>  2.79e+08 =C2=B1  2%     +51.5%  4.226e+08 =C2=B1  0%  cpuidle.C3-NHM.time
>    254315 =C2=B1  2%     +25.1%     318250 =C2=B1  2%  cpuidle.C3-NHM.usa=
ge
> 7.585e+08 =C2=B1  1%     -22.2%  5.901e+08 =C2=B1  1%  cpuidle.C6-NHM.time
>    415414 =C2=B1  1%     -38.1%     257115 =C2=B1  1%  cpuidle.C6-NHM.usa=
ge
> 1.135e+08 =C2=B1  1%     +77.8%  2.017e+08 =C2=B1  2%  cpuidle.POLL.time
>    102777 =C2=B1  1%     +36.0%     139811 =C2=B1  1%  cpuidle.POLL.usage
>      2011 =C2=B1 25%     -27.1%       1467 =C2=B1  2%  sched_debug.cfs_rq=
:/.exec_clock.2
>      1820 =C2=B1  3%     -12.2%       1597 =C2=B1  7%  sched_debug.cfs_rq=
:/.exec_clock.4
>      4297 =C2=B1  6%     +78.1%       7653 =C2=B1 54%  sched_debug.cfs_rq=
:/.min_vruntime.12
>      4803 =C2=B1 18%     -16.1%       4028 =C2=B1 21%  sched_debug.cfs_rq=
:/.min_vruntime.8
>      3763 =C2=B1  4%     -17.0%       3124 =C2=B1  7%  sched_debug.cfs_rq=
:/.min_vruntime.9
>      3408 =C2=B1  4%     -14.9%       2900 =C2=B1  2%  sched_debug.cfs_rq=
:/.min_vruntime.min
>      4.75 =C2=B1 54%     -73.7%       1.25 =C2=B1173%  sched_debug.cfs_rq=
:/.nr_spread_over.2
>      1.99 =C2=B1 16%     +25.5%       2.50 =C2=B1  9%  sched_debug.cfs_rq=
:/.nr_spread_over.stddev
>     -4362 =C2=B1-25%     -92.7%    -318.24 =C2=B1-1304%  sched_debug.cfs_=
rq:/.spread0.12
>    200.25 =C2=B1 47%     -48.8%     102.50 =C2=B1 22%  sched_debug.cfs_rq=
:/.util_avg.7
>    187.75 =C2=B1 64%     -77.2%      42.75 =C2=B1 56%  sched_debug.cfs_rq=
:/.util_avg.8
>      1.41 =C2=B1 31%     +37.0%       1.93 =C2=B1 12%  sched_debug.cpu.cl=
ock.stddev
>      1.41 =C2=B1 31%     +37.0%       1.93 =C2=B1 12%  sched_debug.cpu.cl=
ock_task.stddev
>      1.63 =C2=B1 67%     -53.9%       0.75 =C2=B1 38%  sched_debug.cpu.cp=
u_load[4].stddev
>     33822 =C2=B1 16%     -17.2%      28018 =C2=B1  4%  sched_debug.cpu.nr=
_switches.13
>     36824 =C2=B1  3%     +12.9%      41569 =C2=B1  4%  sched_debug.cpu.nr=
_switches.14
>     33117 =C2=B1  7%     -11.1%      29438 =C2=B1  5%  sched_debug.cpu.nr=
_switches.15
>     57634 =C2=B1  3%      +8.8%      62716 =C2=B1  3%  sched_debug.cpu.nr=
_switches.4
>      1723 =C2=B1  7%     -11.3%       1527 =C2=B1  5%  sched_debug.cpu.nr=
_uninterruptible.10
>      1378 =C2=B1  6%      -8.7%       1258 =C2=B1  5%  sched_debug.cpu.nr=
_uninterruptible.15
>      1232 =C2=B1 10%     +25.3%       1543 =C2=B1  3%  sched_debug.cpu.nr=
_uninterruptible.8
>     34660 =C2=B1 13%     -19.1%      28034 =C2=B1  4%  sched_debug.cpu.sc=
hed_count.13
>     37545 =C2=B1  2%     +18.9%      44629 =C2=B1  7%  sched_debug.cpu.sc=
hed_count.14
>     34003 =C2=B1  9%     -13.4%      29456 =C2=B1  5%  sched_debug.cpu.sc=
hed_count.15
>     62715 =C2=B1  6%      +9.5%      68642 =C2=B1  7%  sched_debug.cpu.sc=
hed_count.2
>     14091 =C2=B1 19%     -20.4%      11212 =C2=B1  5%  sched_debug.cpu.sc=
hed_goidle.13
>     14175 =C2=B1  3%     +15.4%      16354 =C2=B1  6%  sched_debug.cpu.sc=
hed_goidle.14
>     13465 =C2=B1  9%     -12.5%      11782 =C2=B1  6%  sched_debug.cpu.sc=
hed_goidle.15
>     24646 =C2=B1  3%      +9.4%      26968 =C2=B1  4%  sched_debug.cpu.sc=
hed_goidle.4
>     15258 =C2=B1  6%     -22.8%      11773 =C2=B1  4%  sched_debug.cpu.tt=
wu_count.11
>     15765 =C2=B1  5%     +48.1%      23355 =C2=B1 15%  sched_debug.cpu.tt=
wu_count.12
>     16869 =C2=B1  3%     -26.1%      12461 =C2=B1  4%  sched_debug.cpu.tt=
wu_count.13
>      3142 =C2=B1  5%     +13.0%       3551 =C2=B1  8%  sched_debug.cpu.tt=
wu_local.13
> =

> lkp-ne04: Nehalem-EP
> Memory: 12G
> =

>                                    uptime.idle
> =

>  1600 ++-----------------------------------------------------------------=
--+
>       |      .*. *.                                                      =
  |
>  1500 *+**.**   *  **.*.**.*  *.**.**.*.**.*  *.**.*.**.**.*.**.**.*.*  *=
*.*
>  1400 ++                   : :              : :                       :+ =
  |
>       |                     ::              ::                        *  =
  |
>  1300 ++                    *                *                           =
  |
>       |                                                                  =
  |
>  1200 ++                                                                 =
  |
>       |                                                                  =
  |
>  1100 O+OO OO O  O OO O OO OO O O  OO O                                  =
  |
>  1000 ++                                                                 =
  |
>       |                                                                  =
  |
>   900 ++        O                O                                       =
  |
>       |                                                                  =
  |
>   800 ++-----------------------------------------------------------------=
--+
> =

> =

>                                   cpuidle.POLL.time
> =

>  2.2e+08 ++---------------O--O----O--------------------------------------=
--+
>          O     O O   O               O                                   =
  |
>    2e+08 ++O  O   O O      O  O O     O                                  =
  |
>          |  O          OO          O    O                                =
  |
>          |                                                               =
  |
>  1.8e+08 ++                                                              =
  |
>          |                                                               =
  |
>  1.6e+08 ++                                                              =
  |
>          |                                                               =
  |
>  1.4e+08 ++                                                              =
  |
>          |                                                               =
  |
>          |                                                               =
  |
>  1.2e+08 ++     .* .*   *.     .*.**.  .**.    *.**.   *.*   *. *.**.**.*=
*.|
>          *.**.**  *  *. : **. *      **    **.*     *.*   *.*  *         =
  *
>    1e+08 ++------------*-----*-------------------------------------------=
--+
> =

> =

>                                 cpuidle.C1-NHM.time
> =

>  8e+07 ++----------------------------------------------------------------=
--+
>        |                                                                 =
  |
>  7e+07 ++                     .*   *. .*      .*   *. *.    .*     *.*   =
  |
>        |  *. *.**.*.  .**.*. *  *.*  *  *. *.*  *.*  *  *. *  *. .*   *.*=
*.*
>  6e+07 *+*  *       **      *             *               *     *        =
  |
>        |                                                                 =
  |
>  5e+07 ++                                                                =
  |
>        |                                                                 =
  |
>  4e+07 ++                                                                =
  |
>        |                                                                 =
  |
>  3e+07 ++                                                                =
  |
>        |          O O                                                    =
  |
>  2e+07 O+OO OO OO    O OO O OO OO OO O O                                 =
  |
>        |                                                                 =
  |
>  1e+07 ++----------------------------------------------------------------=
--+
> =

> =

>                                  cpuidle.C3-NHM.time
> =

>  4.4e+08 ++------------O-------------------------------------------------=
--+
>          | OO O   O             O  O O  O                                =
  |
>  4.2e+08 O+    O    O   O  O  O       O                                  =
  |
>    4e+08 ++      O   O    O  O    O                                      =
  |
>          |                                                               =
  |
>  3.8e+08 ++                                                              =
  |
>  3.6e+08 ++                                                              =
  |
>          |                                                               =
  |
>  3.4e+08 ++                                                              =
  |
>  3.2e+08 ++                                                              =
  |
>          |             *                                                 =
  |
>    3e+08 ++           +:     **             *.*            .*            =
  |
>  2.8e+08 *+ *. *. *. *  :.* +  + .* .**.  .*   :.* .*.*   *  *.**.* .*   =
 .*
>          | *  *  *  *   *  *    *  *    **     *  *    *.*         *  *.*=
* |
>  2.6e+08 ++--------------------------------------------------------------=
--+
> =

> =

>                                  cpuidle.C6-NHM.time
> =

>    8e+08 ++----------*---------------------------------------------------=
--+
>          |    * .* .* +  .*                                              =
  |
>          |.* + *  *    **  *. *.*. *. *.**.**.**. *. .**.**.**. *.**. *.*=
  |
>  7.5e+08 *+ *                *    *  *           *  *          *     *   =
*.*
>          |                                                               =
  |
>          |                                                               =
  |
>    7e+08 ++                                                              =
  |
>          |                                                               =
  |
>  6.5e+08 ++                                                              =
  |
>          |                                                               =
  |
>          O                                                               =
  |
>    6e+08 ++ O    OO  O    O  O  O O  O                                   =
  |
>          | O  OO    O   O  O  O       O O                                =
  |
>          |             O           O                                     =
  |
>  5.5e+08 ++--------------------------------------------------------------=
--+
> =

> =

>                                cpuidle.C6-NHM.usage
> =

>  440000 ++---------------------------------------------------------------=
--+
>  420000 ++          *.   *. *.     .*. *           .* .*    .*.*       .*=
  |
>         |.* .**.**. : *.*  *  **.**   * + *.**.*.**  *  :.**    :   .**  =
*.*
>  400000 *+ *       *                     *              *       *.**     =
  |
>  380000 ++                                                               =
  |
>         |                                                                =
  |
>  360000 ++                                                               =
  |
>  340000 ++                                                               =
  |
>  320000 ++                                                               =
  |
>         |                                                                =
  |
>  300000 ++                                                               =
  |
>  280000 ++                                                               =
  |
>         | O        O       O  O       O                                  =
  |
>  260000 O+ O OO OO  O O OO  O  O OO O  O                                 =
  |
>  240000 ++---------------------------------------------------------------=
--+
> =

> =

>                                 turbostat.Avg_MHz
> =

>  650 ++------------------------------------------------------------------=
--+
>      |                                                                   =
  |
>  600 O+     OO    O    O  O    O                                         =
  |
>      | O  O    OO    O   O  OO   OO O                                    =
  |
>  550 ++ O           O                 O                                  =
  |
>      |                                                                   =
  |
>  500 ++                                                                  =
  |
>      |                                                                   =
  |
>  450 ++                                                                  =
  |
>      |                                                                   =
  |
>  400 ++                                                                  =
  |
>      |                       *.*.*   .**.    .**.*.  .**.      .* .**.   =
*.|
>  350 *+**.*.**.**.*. *.*.* .*     *.*    **.*      **    *.**.*  *    *.*=
  *
>      |              *     *                                              =
  |
>  300 ++------------------------------------------------------------------=
--+
> =

> =

>                                 turbostat._Busy
> =

>  20 ++-------------------------------------------------------------------=
--+
>  19 O+     O          O  O    O                                          =
  |
>     |       O O OO   O  O  O O  O OO                                     =
  |
>  18 ++OO O         O                 O                                   =
  |
>  17 ++                                                                   =
  |
>     |                                                                    =
  |
>  16 ++                                                                   =
  |
>  15 ++                                                                   =
  |
>  14 ++                                                                   =
  |
>     |                                                                    =
  |
>  13 ++                                                                   =
  |
>  12 ++         .*           .**.*.* .*.**.   *.*.**. .**.* .*.**.*.**.*.*=
*.|
>     *.**.*.**.*  *. .**.* .*       *      *.*       *     *              =
  *
>  11 ++             *     *                                               =
  |
>  10 ++-------------------------------------------------------------------=
--+
> =

> =

>                                turbostat.CPU_c1
> =

>  23 ++-------------------------------------------------------------------=
--+
>     |                   *    *               *.                          =
  |
>  22 ++               * +:   : *. .*  *.      : *. *   *             *.   =
  |
>     |  *.   *. .*   : *  :  :   *  :+  * .*.:    * + + *. *.*.* .*.*  *.*=
*.*
>  21 *+*  *.*  *  :  :    *.*       *    *   *       *    *     *         =
  |
>     |            *.*                                                     =
  |
>  20 ++                                                                   =
  |
>     |                                                                    =
  |
>  19 ++                                                                   =
  |
>     |                                                                    =
  |
>  18 ++     O    OO    O  O      O  O O                                   =
  |
>     | OO O         O O  O  O O    O                                      =
  |
>  17 O+      O O               O                                          =
  |
>     |                                                                    =
  |
>  16 ++-------------------------------------------------------------------=
--+
> =

> =

>                                turbostat.CPU_c3
> =

>  38 ++-------------------------------------------------------------------=
--+
>     |              O                                                     =
  |
>  36 ++OO O      O    O          O                                        =
  |
>  34 ++     O  O         O  O O    OO O                                   =
  |
>     O       O    O                                                       =
  |
>  32 ++                O  O    O                                          =
  |
>     |                                                                    =
  |
>  30 ++                                                                   =
  |
>     |                                                                    =
  |
>  28 ++             *                                                     =
  |
>  26 ++            : :    *.*              *.*             *              =
 .*
>     *. *. .* .*.  : : *. :  : *. .**.    +  :  *. *.*.    :+ .* .*. *.   =
* |
>  24 ++*  *  *   **   *  *   : : *    *.**    :+  *    **.*  *  *   *  *.*=
  |
>     |                        *               *                           =
  |
>  22 ++-------------------------------------------------------------------=
--+
> =

> =

>                                turbostat.CPU_c6
> =

>  44 ++---*-------*-------------------------------------------------------=
--+
>     |.* + + *.*.* + .**.        *. *. .**        * .*. *.*     *.    .*.*=
  |
>  42 *+ *   *       *    **.*.* +  *  *   + .**. + *   *   :.*.*  *.**    =
*.|
>  40 ++                        *           *    *          *              =
  *
>     |                                                                    =
  |
>  38 ++                                                                   =
  |
>  36 ++                                                                   =
  |
>     |                                                                    =
  |
>  34 ++                                                                   =
  |
>  32 ++                                                                   =
  |
>     O       O                 O                                          =
  |
>  30 ++        O  O    O OO O O    O                                      =
  |
>  28 ++OO O O         O          O  O O                                   =
  |
>     |           O  O                                                     =
  |
>  26 ++-------------------------------------------------------------------=
--+
> =

> =

>                                 vmstat.procs.b
> =

>  30 ++-------------------------------------------------------------------=
--+
>     |                                                                    =
  |
>     |         O                                                          =
  |
>  25 O+O    O     O    O OO O  O O  O O                                   =
  |
>     |  O O  O   O  O O       O    O                                      =
  |
>     |                                                                    =
  |
>  20 ++                                                                   =
  |
>     |                                                                    =
  |
>  15 ++                                                                   =
  |
>     |                                                                    =
  |
>     |                                                                    =
  |
>  10 ++*               *.*   .* .*       *.*. *. .*      .**.*.          *=
  |
>     |+ :.*.    .*   .*   *.*  *  + *. .*    *  *  :.*. *      **. .**. + =
:.*
>     *  *   **.*  :.*              *  *            *   *          *    *  =
* |
>   5 ++-----------*-------------------------------------------------------=
--+
> =

> 	[*] bisect-good sample
> 	[O] bisect-bad  sample
> =

> To reproduce:
> =

>        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-te=
sts.git
>        cd lkp-tests
>        bin/lkp install job.yaml  # job file is attached in this email
>        bin/lkp run     job.yaml
> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> =

> Thanks,
> Ying Huang
> <job.yaml><reproduce.sh>


--===============3511169039408371146==--

