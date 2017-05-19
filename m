Content-Type: multipart/mixed; boundary="===============1430243342927751427=="
MIME-Version: 1.0
From: Vincent Guittot <vincent.guittot@linaro.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/cfs] 625ed2bf04: unixbench.score -7.4% regression
Date: Fri, 19 May 2017 09:08:38 +0200
Message-ID: <CAKfTPtCc8_Y6ewoqe=75SOiY-qCBDi7awP7zy1VCyXi4UuynhQ@mail.gmail.com>
In-Reply-To: <20170519060706.GU568@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1430243342927751427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 19 May 2017 at 08:07, kernel test robot <xiaolong.ye@intel.com> wrote:
>
> Greeting,
>
> FYI, we noticed a -7.4% regression of unixbench.score due to commit:

That's interesting because it's just the opposite of what I received 4
days ago for unixbench  shell1 test. I'm going to have a look:

>From kernel test robot <xiaolong.ye@intel.com>:

Greeting,

FYI, we noticed a 12.3% improvement of unixbench.score due to commit:


commit: 6947ec09a6a15c9c2c2bf71d7fea7c65d54f8a33 ("sched/cfs: Make
util/load_avg more stable")
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git schd/wip

in testcase: unixbench
on test machine: 192 threads Skylake-4S with 768G memory
with following parameters:

        runtime: 300s
        nr_task: 1
        test: shell1
        cpufreq_governor: performance

test-description: UnixBench is the original BYTE UNIX benchmark suite
aims to test performance of Unix-like system.
test-url: https://github.com/kdlucas/byte-unixbench

In addition to that, the commit also has significant impact on the
following tests:

+------------------+-------------------------------------------------------=
----------------+
| testcase: change | netperf: netperf.Throughput_tps 36.1% improvement
                    |
| test machine     | 56 threads Intel(R) Xeon(R) CPU E5-2695 v3 @
2.30GHz with 256G memory |
| test parameters  | cluster=3Dcs-localhost
                    |
|                  | cpufreq_governor=3Dperformance
                    |
|                  | ip=3Dipv4
                    |
|                  | nr_threads=3D200%
                    |
|                  | runtime=3D300s
                    |
|                  | test=3DSCTP_RR
                    |
+------------------+-------------------------------------------------------=
----------------+
| testcase: change | aim9: aim9.shell_rtns_3.ops_per_sec 1.6%
improvement                  |
| test machine     | 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @
2.20GHz with 64G memory  |
| test parameters  | cpufreq_governor=3Dperformance
                    |
|                  | test=3Dshell_rtns_3
                    |
|                  | testtime=3D300s
                    |
+------------------+-------------------------------------------------------=
----------------+
| testcase: change | aim9: aim9.shell_rtns_1.ops_per_sec 1.4%
improvement                  |
| test machine     | 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @
2.20GHz with 64G memory  |
| test parameters  | cpufreq_governor=3Dperformance
                    |
|                  | test=3Dshell_rtns_1
                    |
|                  | testtime=3D300s
                    |
+------------------+-------------------------------------------------------=
----------------+

--




>
>
> commit: 625ed2bf049d5a352c1bcca962d6e133454eaaff ("sched/cfs: Make util/l=
oad_avg more stable")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> in testcase: unixbench
> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wit=
h 64G memory
> with following parameters:
>
>         runtime: 300s
>         nr_task: 100%
>         test: spawn
>         cpufreq_governor: performance
>
> test-description: UnixBench is the original BYTE UNIX benchmark suite aim=
s to test performance of Unix-like system.
> test-url: https://github.com/kdlucas/byte-unixbench
>
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> To reproduce:
>
>         git clone https://github.com/01org/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
>
> testcase/path_params/tbox_group/run: unixbench/300s-100%-spawn-performanc=
e/lkp-bdw-ep3b
>
> 8663effb24f94303  625ed2bf049d5a352c1bcca962
> ----------------  --------------------------
>          %stddev      change         %stddev
>              \          |                \
>       8888              -7%       8234        unixbench.score
>      11626              31%      15267        unixbench.time.system_time
>       5084              23%       6259        unixbench.time.percent_of_c=
pu_this_job_got
>       5203               5%       5455        unixbench.time.user_time
>   66039778              -7%   61588314        unixbench.time.voluntary_co=
ntext_switches
>  7.932e+08              -7%   7.34e+08        unixbench.time.minor_page_f=
aults
>   24502668             -52%   11794316        unixbench.time.involuntary_=
context_switches
>     628084             -17%     518637        interrupts.CAL:Function_cal=
l_interrupts
>       6000 =C4=85 57%      1e+04      19033 =C4=85 58%  latency_stats.sum=
.call_rwsem_down_read_failed.__percpu_down_read.exit_signals.do_exit.do_gro=
up_exit.SyS_exit_group.entry_SYSCALL_64_fastpath
>     715117 =C4=85 58%     -4e+05     300172 =C4=85 12%  latency_stats.sum=
.io_schedule.__lock_page_or_retry.filemap_fault.__do_fault.__handle_mm_faul=
t.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>      94622                       96223        vmstat.system.in
>     500325             -16%     420024        vmstat.system.cs
>       1692              21%       2045        turbostat.Avg_MHz
>      60.71              21%      73.38        turbostat.%Busy
>        208                         212        turbostat.PkgWatt
>      54.56              -8%      50.47        turbostat.RAMWatt
>  4.911e+13              21%  5.944e+13        perf-stat.cpu-cycles
>       6010              19%       7153        perf-stat.instructions-per-=
iTLB-miss
>  3.508e+12              14%  3.988e+12        perf-stat.branch-instructio=
ns
>  1.627e+13              10%  1.797e+13        perf-stat.instructions
>  4.504e+12               8%  4.886e+12        perf-stat.dTLB-loads
>      58.34                       59.21        perf-stat.node-store-miss-r=
ate%
>      42.85                       42.00        perf-stat.iTLB-load-miss-ra=
te%
>  3.609e+09              -4%  3.469e+09        perf-stat.iTLB-loads
>  2.125e+10              -5%  2.016e+10        perf-stat.branch-misses
>  2.707e+09              -7%  2.512e+09        perf-stat.iTLB-load-misses
>  7.939e+08              -7%  7.348e+08        perf-stat.page-faults
>  7.939e+08              -7%  7.348e+08        perf-stat.minor-faults
>       0.33              -9%       0.30        perf-stat.ipc
>  9.788e+09              -9%  8.927e+09 =C4=85  3%  perf-stat.dTLB-load-mi=
sses
>      14.74              -9%      13.43        perf-stat.cache-miss-rate%
>  3.426e+11              -9%  3.117e+11        perf-stat.cache-references
>   1.26e+09              -9%  1.141e+09        perf-stat.dTLB-store-misses
>  1.579e+12             -10%  1.421e+12        perf-stat.dTLB-stores
>  1.773e+10             -14%  1.523e+10        perf-stat.node-load-misses
>  5.685e+09             -15%  4.805e+09        perf-stat.node-store-misses
>       0.22             -16%       0.18 =C4=85  3%  perf-stat.dTLB-load-mi=
ss-rate%
>  1.666e+08             -16%    1.4e+08        perf-stat.context-switches
>       0.61             -17%       0.51        perf-stat.branch-miss-rate%
>  5.051e+10             -17%  4.187e+10        perf-stat.cache-misses
>   32471209             -18%   26608318        perf-stat.cpu-migrations
>  4.059e+09             -18%  3.311e+09        perf-stat.node-stores
>   8.13e+08             -24%  6.207e+08        perf-stat.node-loads
>
>
>
>                       unixbench.time.involuntary_context_switches
>
>   2.6e+07 ++-------------------------------------------------------------=
---+
>           *.*.*.. .*.*.*.             .*.*.*. .*..*.*.*. .*..*.*.*.*     =
   |
>   2.4e+07 ++     *       *..*.*. .*.*.       *          *                =
   |
>   2.2e+07 ++                    *                                        =
   |
>           |                                                              =
   |
>     2e+07 ++                                                             =
   |
>           O   O  O O                                                     =
   |
>   1.8e+07 ++O                                                            =
   |
>           |                                                              =
   |
>   1.6e+07 ++                                                             =
   |
>   1.4e+07 ++                                                             =
   |
>           |                                                              =
   |
>   1.2e+07 ++         O O      O   O                     O O  O O O O O   =
 O |
>           |              O  O   O   O  O O O O O  O O O                 O=
   O
>     1e+07 ++-------------------------------------------------------------=
---+
>
>
>                                  perf-stat.cpu-cycles
>
>     6e+13 ++-------------------------------------------------------------=
---+
>           |          O O O  O O O O O  O O O O O  O O O O O  O O O O O  O=
 O O
>   5.8e+13 ++                                                             =
   |
>           |                                                              =
   |
>           |                                                              =
   |
>   5.6e+13 O+O O    O                                                     =
   |
>           |      O                                                       =
   |
>   5.4e+13 ++                                                             =
   |
>           |                                                              =
   |
>   5.2e+13 ++                                                             =
   |
>           |                                                              =
   |
>           |                                                              =
   |
>     5e+13 ++    .*. .*.*.*..*.*.*.*.        .*.        .*.      .*.      =
   |
>           *.*.*.   *                *..*.*.*   *..*.*.*   *..*.*   *     =
   |
>   4.8e+13 ++-------------------------------------------------------------=
---+
>
>
>                               perf-stat.node-load-misses
>
>    1.8e+10 ++------------------------------------------------------------=
---+
>            *.*.*..*.*.*.*             .*.*..*.*.*.*.*.*..*.*.*.*.*.*     =
   |
>   1.75e+10 ++            :           *                                   =
   |
>    1.7e+10 ++            :    .*.   +                                    =
   |
>            |              *.*.   *.*                                     =
   |
>   1.65e+10 ++                                                            =
   |
>            |                                                             =
   |
>    1.6e+10 ++                                                            =
   |
>            |                                                             =
   |
>   1.55e+10 O+     O                                      O O O O   O     =
   O
>    1.5e+10 ++                                   O O O O          O    O O=
 O |
>            |                                                             =
   |
>   1.45e+10 ++O O    O O O      O O O O O O  O O                          =
   |
>            |              O                                              =
   |
>    1.4e+10 ++---------------O--------------------------------------------=
---+
>
>
>                               perf-stat.context-switches
>
>    1.7e+08 ++------------------------------------------------------------=
---+
>            *.*.*.. .*.*.*             .*.*..*. .*.*.*.*.. .*.*.*.*.*     =
   |
>   1.65e+08 ++     *      +           *        *          *               =
   |
>    1.6e+08 ++             *.  .*.   +                                    =
   |
>            |                *.   *.*                                     =
   |
>   1.55e+08 ++                                                            =
   |
>            |                                                             =
   |
>    1.5e+08 ++                                                            =
   |
>            |                                                             =
   |
>   1.45e+08 O+O O  O O                                                    =
   |
>    1.4e+08 ++                                            O O O O O O  O  =
 O |
>            |                                    O O O O                 O=
   O
>   1.35e+08 ++         O O      O O O O O O  O O                          =
   |
>            |              O O                                            =
   |
>    1.3e+08 ++------------------------------------------------------------=
---+
>
>
>                                perf-stat.cpu-migrations
>
>   3.3e+07 ++-----------------------------------------------------*-*-----=
---+
>           |  .*..*. .*.         *         .*.*.      .*.*.      +        =
   |
>   3.2e+07 *+*      *   *.      + + .*..*.*     *..*.*     *..*.*         =
   |
>   3.1e+07 ++             *..*.*   *                                      =
   |
>           |                                                              =
   |
>     3e+07 ++                                                             =
   |
>           |                                                              =
   |
>   2.9e+07 ++                                                             =
   |
>           |                                                              =
   |
>   2.8e+07 ++                                                             =
   |
>   2.7e+07 ++                                                             =
   |
>           O O    O                                      O O  O O O O O  O=
 O O
>   2.6e+07 ++  O    O                           O  O O O                  =
   |
>           |          O O O  O O O O O  O O O O                           =
   |
>   2.5e+07 ++-------------------------------------------------------------=
---+
>
>
>                             perf-stat.branch-miss-rate_
>
>   0.62 ++----------------------------------------------------------------=
---+
>        *.  .*. .*..*.*.         *..*.*.  .*. .*.*.. .*.  .*.*.*.. .*     =
   |
>    0.6 ++*.   *        *.*..   +       *.   *      *   *.        *       =
   |
>        |                    *.*                                          =
   |
>   0.58 ++                                                                =
   |
>        |                                                                 =
   |
>   0.56 ++                                                                =
   |
>        |                                                                 =
   |
>   0.54 ++                                                                =
   |
>        |                                                                 =
   |
>   0.52 ++                                                   O O          =
   |
>        O      O                                        O           O O   =
 O |
>    0.5 ++          O O                          O    O    O      O     O =
   O
>        |                 O  O   O  O O O  O O O    O                     =
   |
>   0.48 ++O--O---O------O------O------------------------------------------=
---+
>
>
>                                     perf-stat.ipc
>
>   0.335 ++---------------------------------------------------------------=
---+
>         *.*..*.*.*.*..*             .*..*.*.*..*.*.*.*..*.*.*.*..*.*     =
   |
>    0.33 ++             :    *..    *                                     =
   |
>   0.325 ++             :   +      +                                      =
   |
>         |               *.*    *.*                                       =
   |
>    0.32 ++                                                               =
   |
>         |                                                                =
   |
>   0.315 ++                                                               =
   |
>         |                                                                =
   |
>    0.31 ++                                                               =
   |
>   0.305 ++                                                               =
   |
>         O O  O O O                                      O O O O  O O O   =
 O O
>     0.3 ++                                     O O O O                 O =
   |
>         |          O  O O O O  O O O O  O O O                            =
   |
>   0.295 ++---------------------------------------------------------------=
---+
>
>
>                        perf-stat.instructions-per-iTLB-miss
>
>   7400 ++----------------------------------------------------------------=
---+
>        |               O O    O           O O                            =
   |
>   7200 ++O      O           O   O  O O O        O    O        O  O O O O =
   O
>   7000 O+   O O    O O                        O    O   O  O O            =
 O |
>        |                                                                 =
   |
>   6800 ++                                                                =
   |
>        |                                                                 =
   |
>   6600 ++                                                                =
   |
>        |                                                                 =
   |
>   6400 ++                                                                =
   |
>   6200 ++              *.    .*.                                         =
   |
>        *.             +  *..*   *..*.*.        .*..                      =
   |
>   6000 ++*..*. .*..*.*                 *..*. .*    *.*.  .*. .*..*.*     =
   |
>        |      *                             *          *.   *            =
   |
>   5800 ++----------------------------------------------------------------=
---+
>
>
>   [*] bisect-good sample
>   [O] bisect-bad  sample
>
>
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
>
>
> Thanks,
> Xiaolong

--===============1430243342927751427==--

