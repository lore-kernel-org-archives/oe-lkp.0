Content-Type: multipart/mixed; boundary="===============1079503541873573436=="
MIME-Version: 1.0
From: Li, Aubrey <aubrey.li@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/idle] bb400b924e: fio.write_clat_95%_us -8% improvement
Date: Thu, 06 Apr 2017 13:56:38 +0800
Message-ID: <a68cc4b0-e794-2016-5419-cd61ce8f2402@linux.intel.com>
In-Reply-To: <20170405071210.GD20286@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1079503541873573436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Xiaolong,

Thanks to report this. Several questions on my side:
(1) how to make a report between <linux-stable tree tag:4.8.8> and
<fast_idle tree HEAD>

(2) Where can I get the raw data of the report

(3) I need to dig into the test machine bios to confirm if it's
compliant to my expected criteria, how to do that?

Thanks,
-Aubrey

On 2017/4/5 15:12, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed a -8% improvement of fio.write_clat_95%_us due to commit:
> =

> =

> commit: bb400b924e06e94eb12047621bd70d61564fca4c ("sched/idle: make the f=
ast idle path for short idle periods")
> git://bee.sh.intel.com/git/aubrey/fast_idle.git 4.8.x
> =

> in testcase: fio-basic
> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wit=
h 128G memory
> with following parameters:
> =

> 	disk: 1SSD
> 	fs: btrfs
> 	runtime: 300s
> 	nr_task: 8
> 	rw: randwrite
> 	bs: 4k
> 	ioengine: sync
> 	test_size: 512g
> 	cpufreq_governor: performance
> =

> test-description: Fio is a tool that will spawn a number of threads or pr=
ocesses doing a particular type of I/O action as specified by the user.
> test-url: https://github.com/axboe/fio
> =

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
> =

> =

> To reproduce:
> =

>         git clone https://github.com/01org/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> testcase/path_params/tbox_group/run: fio-basic/1SSD-btrfs-300s-8-randwrit=
e-4k-sync-512g-performance/lkp-bdw-ep2
> =

> 4cb0c8c00bded81a  bb400b924e06e94eb12047621b  =

> ----------------  --------------------------  =

>       0.17 =C2=B1 20%       -58%       0.07 =C2=B1 17%  fio.latency_4us%
>        237                         233        fio.write_clat_mean_us
>        332              -8%        307        fio.write_clat_95%_us
>        304              -8%        279        fio.write_clat_90%_us
>      22.22 =C2=B1  4%       -10%      19.96 =C2=B1  9%  fio.latency_500us%
>       0.12 =C2=B1 14%       -45%       0.07 =C2=B1 24%  fio.latency_100us%
>        130             -17%        108        fio.time.system_time
>         50             -18%         41        fio.time.percent_of_cpu_thi=
s_job_got
>        237              21%        287        pmeter.Average_Active_Power
>        141             -16%        119        pmeter.performance_per_watt
>     128251              -3%     123873        vmstat.system.in
>        128              24%        159        turbostat.PkgWatt
>      53.98              11%      60.15        turbostat.RAMWatt
>       7.54             -41%       4.42        turbostat.%Busy
>        201             -39%        123        turbostat.Avg_MHz
>      10549 =C2=B1100%      2e+04      32779 =C2=B1173%  latency_stats.avg=
.cgroup_kn_lock_live.__cgroup_procs_write.cgroup_procs_write.cgroup_file_wr=
ite.kernfs_fop_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastp=
ath
>      22588 =C2=B1  7%      1e+04      36323 =C2=B1150%  latency_stats.avg=
.max
>      10549 =C2=B1100%      2e+04      32779 =C2=B1173%  latency_stats.max=
.cgroup_kn_lock_live.__cgroup_procs_write.cgroup_procs_write.cgroup_file_wr=
ite.kernfs_fop_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastp=
ath
>      10549 =C2=B1100%      2e+04      32779 =C2=B1173%  latency_stats.sum=
.cgroup_kn_lock_live.__cgroup_procs_write.cgroup_procs_write.cgroup_file_wr=
ite.kernfs_fop_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastp=
ath
>       6644             250%      23269 =C2=B1  5%  perf-stat.instructions=
-per-iTLB-miss
>       0.63              43%       0.90        perf-stat.ipc
>       5.33              37%       7.29        perf-stat.cache-miss-rate%
>  2.145e+09 =C2=B1  3%        15%  2.469e+09        perf-stat.iTLB-loads
>     788668             -26%     583795        perf-stat.cpu-migrations
>  3.019e+09                   3.091e+09        perf-stat.cache-misses
>  8.685e+11             -15%  7.377e+11        perf-stat.dTLB-loads
>  3.254e+12             -16%  2.742e+12        perf-stat.instructions
>  5.527e+11             -15%  4.696e+11        perf-stat.dTLB-stores
>  6.852e+11             -18%  5.637e+11        perf-stat.branch-instructio=
ns
>  5.661e+10             -25%  4.239e+10        perf-stat.cache-references
>      18.12 =C2=B1 30%       -40%      10.89 =C2=B1 13%  perf-stat.node-st=
ore-miss-rate%
>   49893336 =C2=B1 26%       -42%   28851077 =C2=B1 12%  perf-stat.node-st=
ore-misses
>  5.195e+12             -41%  3.052e+12        perf-stat.cpu-cycles
>       1.08             -22%       0.85        perf-stat.branch-miss-rate%
>  7.393e+09             -35%  4.775e+09        perf-stat.branch-misses
>       0.21             -41%       0.12 =C2=B1  7%  perf-stat.dTLB-load-mi=
ss-rate%
>    1.8e+09             -50%  9.054e+08 =C2=B1  8%  perf-stat.dTLB-load-mi=
sses
>      18.60             -75%       4.57 =C2=B1  4%  perf-stat.iTLB-load-mi=
ss-rate%
>  4.898e+08             -76%  1.182e+08 =C2=B1  5%  perf-stat.iTLB-load-mi=
sses
>       0.04             -77%       0.01 =C2=B1  6%  perf-stat.dTLB-store-m=
iss-rate%
>  1.982e+08             -80%   38854803 =C2=B1  7%  perf-stat.dTLB-store-m=
isses
> =

> =

> =

>                               perf-stat.cache-references
> =

>     6e+10 ++-------------------------------------------------------------=
---+
>   5.8e+10 ++                                           .*...             =
   |
>           |              ..*..  .*..*...*..*..*...*..*.     *..*..*..  ..=
*..*
>   5.6e+10 *+.*...*..*..*.     *.                                     *.  =
   |
>   5.4e+10 ++                                                             =
   |
>           |                                                              =
   |
>   5.2e+10 ++                                                             =
   |
>     5e+10 ++                                                             =
   |
>   4.8e+10 ++                                                             =
   |
>           |                                                              =
   |
>   4.6e+10 O+                                                             =
   |
>   4.4e+10 ++ O   O  O  O      O                                          =
   |
>           |                O     O  O      O                             =
   |
>   4.2e+10 ++                            O                                =
   |
>     4e+10 ++-------------------------------------------------------------=
---+
> =

> =

>                                 perf-stat.branch-misses
> =

>     8e+09 ++-------------------------------------------------------------=
---+
>           |                                            .*...             =
   |
>   7.5e+09 ++.*...     .*...*..                      .*.     *..*..*..    =
  .*
>           *.     *..*.        *..*..*...*..*..*...*.                 *...=
*. |
>     7e+09 ++                                                             =
   |
>           |                                                              =
   |
>   6.5e+09 ++                                                             =
   |
>           |                                                              =
   |
>     6e+09 ++                                                             =
   |
>           |                                                              =
   |
>   5.5e+09 ++                                                             =
   |
>           O  O   O  O  O      O                                          =
   |
>     5e+09 ++               O                                             =
   |
>           |                      O  O   O  O                             =
   |
>   4.5e+09 ++-------------------------------------------------------------=
---+
> =

> =

>                               perf-stat.dTLB-load-misses
> =

>     2e+09 ++-------------------------------------------------------------=
---+
>           *..*...        ..*..     .*...                                 =
   |
>   1.8e+09 ++     *..*..*.     *..*.     *..*..*...*..*..*...*..*..*..*...=
*..*
>           |                                                              =
   |
>   1.6e+09 ++                                                             =
   |
>           |                                                              =
   |
>   1.4e+09 ++                                                             =
   |
>           |                                                              =
   |
>   1.2e+09 ++                                                             =
   |
>           |  O                                                           =
   |
>     1e+09 O+     O  O         O     O                                    =
   |
>           |            O   O            O  O                             =
   |
>     8e+08 ++                     O                                       =
   |
>           |                                                              =
   |
>     6e+08 ++-------------------------------------------------------------=
---+
> =

> =

>                                  perf-stat.dTLB-stores
> =

>   5.6e+11 ++-----*----------------------*---------------*------*--*------=
---*
>   5.5e+11 *+.*.     *..*...*..  .*..*.     *..*...*..*.     *.           =
 ..|
>           |                   *.                                     *...=
*  |
>   5.4e+11 ++                                                             =
   |
>   5.3e+11 ++                                                             =
   |
>   5.2e+11 ++                                                             =
   |
>   5.1e+11 ++                                                             =
   |
>           |                                                              =
   |
>     5e+11 ++                                                             =
   |
>   4.9e+11 O+     O                                                       =
   |
>   4.8e+11 ++ O      O  O   O                                             =
   |
>   4.7e+11 ++                  O     O   O  O                             =
   |
>           |                                                              =
   |
>   4.6e+11 ++                     O                                       =
   |
>   4.5e+11 ++-------------------------------------------------------------=
---+
> =

> =

>                               perf-stat.dTLB-store-misses
> =

>   2.2e+08 ++-------------------------------------------------------------=
---+
>     2e+08 *+.*...        ..*..*..  .*...*..*..*...*..*..*...     .*..*...=
   |
>           |      *..*..*.        *.                         *..*.        =
*..*
>   1.8e+08 ++                                                             =
   |
>   1.6e+08 ++                                                             =
   |
>           |                                                              =
   |
>   1.4e+08 ++                                                             =
   |
>   1.2e+08 ++                                                             =
   |
>     1e+08 ++                                                             =
   |
>           |                                                              =
   |
>     8e+07 ++                                                             =
   |
>     6e+07 O+ O   O  O  O      O                                          =
   |
>           |                O        O                                    =
   |
>     4e+07 ++                     O      O  O                             =
   |
>     2e+07 ++-------------------------------------------------------------=
---+
> =

> =

>                              perf-stat.iTLB-load-misses
> =

>   7e+08 ++---------------------------------------------------------------=
---+
>         |                                                                =
   |
>   6e+08 ++.*...                                                          =
   |
>         *.     *..*...*                                                  =
   |
>         |              +                  *..                            =
   |
>   5e+08 ++              +               ..   *...*..*...*..*..*...*..*...=
*..*
>         |                *..*...*..*...*                                 =
   |
>   4e+08 ++                                                               =
   |
>         |                                                                =
   |
>   3e+08 ++                                                               =
   |
>         |                                                                =
   |
>         |                                                                =
   |
>   2e+08 ++     O                                                         =
   |
>         O  O      O   O  O  O      O                                     =
   |
>   1e+08 ++----------------------O------O--O------------------------------=
---+
> =

> =

>                               perf-stat.cpu-migrations
> =

>   850000 ++--------------------------------------------------------------=
---+
>          |         *..                                            *..    =
   |
>   800000 ++.*..   +   *...                                      ..       =
   |
>          *.    . +        *..*..      .*...         .*..*..*...*     *...=
  .*
>          |      *               *...*.     *..*.. ..                     =
*. |
>   750000 ++                                      *                       =
   |
>          |                                                               =
   |
>   700000 ++                                                              =
   |
>          |                                                               =
   |
>   650000 ++                                                              =
   |
>          |            O                                                  =
   |
>          O  O                                                            =
   |
>   600000 ++     O  O      O         O  O                                 =
   |
>          |                   O  O          O                             =
   |
>   550000 ++--------------------------------------------------------------=
---+
> =

> =

>                             perf-stat.cache-miss-rate_
> =

>     8 ++-----------------------------------------------------------------=
---+
>       |             O   O                                                =
   |
>   7.5 ++                                                                 =
   |
>       |   O      O                O   O  O                               =
   |
>       |                    O   O                                         =
   |
>     7 O+     O                                                           =
   |
>       |                                                                  =
   |
>   6.5 ++                                                                 =
   |
>       |                                                                  =
   |
>     6 ++                                                                 =
   |
>       |                                                                  =
   |
>       |                                                                  =
   |
>   5.5 ++..*..      .*...  .*...*..                ..*..         ..*..*...=
*..|
>       *.     *...*.     *.        *...*..*...*..*.     *...*..*.         =
   *
>     5 ++-----------------------------------------------------------------=
---+
> =

> =

>                           perf-stat.dTLB-load-miss-rate_
> =

>   0.22 ++--------------------------*-------------------------------------=
---+
>        *..*...         .*...    ..          .*..  ..*..         ..*..*...=
   |
>    0.2 ++     *..*...*.     *..*      *...*.    *.     *...*..*.         =
*..*
>        |                                                                 =
   |
>        |                                                                 =
   |
>   0.18 ++                                                                =
   |
>        |                                                                 =
   |
>   0.16 ++                                                                =
   |
>        |                                                                 =
   |
>   0.14 ++ O                                                              =
   |
>        O      O  O                 O                                     =
   |
>        |             O      O         O                                  =
   |
>   0.12 ++                                 O                              =
   |
>        |                O      O                                         =
   |
>    0.1 ++----------------------------------------------------------------=
---+
> =

> =

>                            perf-stat.dTLB-store-miss-rate_
> =

>    0.04 ++---------------------------------------------------------------=
---+
>         | .*...         .*..*...  .*...     .*...*..  ..*..         .*...=
   |
>   0.035 *+     *..*...*.        *.     *..*.        *.     *..*...*.     =
*..*
>         |                                                                =
   |
>    0.03 ++                                                               =
   |
>         |                                                                =
   |
>   0.025 ++                                                               =
   |
>         |                                                                =
   |
>    0.02 ++                                                               =
   |
>         |                                                                =
   |
>   0.015 ++     O                                                         =
   |
>         O  O      O   O     O                                            =
   |
>    0.01 ++               O         O                                     =
   |
>         |                       O      O  O                              =
   |
>   0.005 ++---------------------------------------------------------------=
---+
> =

> =

>                          perf-stat.iTLB-load-miss-rate_
> =

>   24 ++------------------------------------------------------------------=
---+
>   22 ++..*..                                                             =
   |
>      *.       ..*..*.                                                    =
   |
>   20 ++     *.       ..                 .*..         ..*..             .*=
...|
>   18 ++                               ..    *...*..*.     *...*..*...*.  =
   *
>      |                 *..*...*..*...*                                   =
   |
>   16 ++                                                                  =
   |
>   14 ++                                                                  =
   |
>   12 ++                                                                  =
   |
>      |                                                                   =
   |
>   10 ++                                                                  =
   |
>    8 ++                                                                  =
   |
>      |   O  O                                                            =
   |
>    6 O+         O  O   O  O      O                                       =
   |
>    4 ++-----------------------O------O---O-------------------------------=
---+
> =

> =

>                         perf-stat.instructions-per-iTLB-miss
> =

>   26000 ++---------------------------------------------------------------=
---+
>   24000 ++                      O         O                              =
   |
>         |                O             O                                 =
   |
>   22000 ++                  O      O                                     =
   |
>   20000 ++            O                                                  =
   |
>   18000 O+        O                                                      =
   |
>   16000 ++ O                                                             =
   |
>         |      O                                                         =
   |
>   14000 ++                                                               =
   |
>   12000 ++                                                               =
   |
>   10000 ++                                                               =
   |
>    8000 ++                                                               =
   |
>         |               .*..*...*..*...*..  .*...*..*...*..*..*...*..*...=
*..*
>    6000 *+.*...*..*...*.                  *.                             =
   |
>    4000 ++---------------------------------------------------------------=
---+
> =

> =

>                                fio.write_clat_90__us
> =

>   310 ++------------*------*-------------*-------------*-----------------=
---+
>       *...*..   .*.   ..  +    *..      +  ..      .*.     *..       *...=
*..|
>   305 ++      ..         +             +         ..                ..    =
   |
>   300 ++     *          *         *...*      *..*             *...*      =
   *
>       |                                                                  =
   |
>   295 ++                                                                 =
   |
>       |                                                                  =
   |
>   290 ++                                                                 =
   |
>       |                        O                                         =
   |
>   285 ++                                                                 =
   |
>   280 ++  O         O   O  O                                             =
   |
>       |      O   O                O      O                               =
   |
>   275 ++                                                                 =
   |
>       |                               O                                  =
   |
>   270 O+-----------------------------------------------------------------=
---+
> =

> =

>                                fio.write_clat_95__us
> =

>   345 ++-----------------------------------------------------------------=
---+
>   340 ++                   *...                                          =
   |
>       *...*..   .*..*... ..    *..      .*..          .*...              =
   |
>   335 ++      ..        *           ..*.    .     ..*.     *..      .*...=
*..|
>   330 ++     *                    *.         *..*.            *...*.     =
   *
>       |                                                                  =
   |
>   325 ++                                                                 =
   |
>   320 ++                                                                 =
   |
>   315 ++                                                                 =
   |
>       |                        O                                         =
   |
>   310 ++  O         O   O  O                                             =
   |
>   305 ++                          O      O                               =
   |
>       |      O   O                    O                                  =
   |
>   300 O+                                                                 =
   |
>   295 ++-----------------------------------------------------------------=
---+
> =

>   [*] bisect-good sample
>   [O] bisect-bad  sample
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
> Xiaolong
> =



--===============1079503541873573436==--

