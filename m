Content-Type: multipart/mixed; boundary="===============2337928658627702273=="
MIME-Version: 1.0
From: Joel Fernandes <joelaf@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/fair] dca93994f6: unixbench.score -8.1% regression
Date: Fri, 11 Aug 2017 08:57:43 -0700
Message-ID: <CAJWu+opAR8Dv_H9CFjMgSxwCvXjKWt9DSR0HzHCrknj-Chovsg@mail.gmail.com>
In-Reply-To: <20170811024755.GD26027@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2337928658627702273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2017 at 7:47 PM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> Greeting,
>
> FYI, we noticed a -8.1% regression of unixbench.score due to commit:
>
>
> commit: dca93994f61becdd8d224155643a44ba284970f6 ("sched/fair: Make PELT =
signal more accurate")
> url: https://github.com/0day-ci/linux/commits/Joel-Fernandes/sched-fair-M=
ake-PELT-signal-more-accurate/20170805-084820
>
>
> in testcase: unixbench
> on test machine: 8 threads Ivy Bridge with 16G memory
> with following parameters:
>
>         runtime: 300s
>         nr_task: 100%
>         test: shell8
>         cpufreq_governor: performance

Sorry! I really didn't see this overhead in hackbench (I guess it was
also very hard to see because of the variation). I will try
LKP/unixbench and measure again (I haven't used LKP before so can't
wait to try it!). I suspect this test is doing several updates within
a short time period .  most of the errors in my usecase I see are
during infrequent updates so I'm happy to just fix the error for
those.

I'm glad to have a usecase now to measure this (assuming the unixbench
regression is real) :-)

A better patch is coming soon! thanks everyone!

-Joel


>
> test-description: UnixBench is the original BYTE UNIX benchmark suite aim=
s to test performance of Unix-like system.
> test-url: https://github.com/kdlucas/byte-unixbench
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
> testcase/path_params/tbox_group/run: unixbench/300s-100%-shell8-performan=
ce/lkp-ivb-d01
>
> dbe04493eddfaa89  dca93994f61becdd8d22415564
> ----------------  --------------------------
>          %stddev      change         %stddev
>              \          |                \
>      13509              -8%      12415        unixbench.score
>  5.186e+08              -8%  4.765e+08        unixbench.time.minor_page_f=
aults
>   16164186              -9%   14694969        unixbench.time.voluntary_co=
ntext_switches
>       3100             -13%       2708        unixbench.time.user_time
>   12755309              -8%   11770274        unixbench.time.involuntary_=
context_switches
>        704             -13%        612        unixbench.time.percent_of_c=
pu_this_job_got
>       1368             -15%       1157        unixbench.time.system_time
>      72414             127%     164292        interrupts.CAL:Function_cal=
l_interrupts
>      71606               5%      75101        vmstat.system.cs
>      14967                       15288        vmstat.system.in
>   45523474               4%   47526554        perf-stat.context-switches
>       0.76               6%       0.81        perf-stat.ipc
>   10697570              -4%   10257128        perf-stat.cpu-migrations
>      74.79              -3%      72.40        perf-stat.iTLB-load-miss-ra=
te%
>  3.282e+12              -8%  3.032e+12        perf-stat.dTLB-loads
>       2246               9%       2446        perf-stat.instructions-per-=
iTLB-miss
>  1.748e+11              -9%  1.596e+11        perf-stat.cache-references
>  1.908e+09              -4%  1.827e+09        perf-stat.iTLB-loads
>  2.534e+12              -8%  2.337e+12        perf-stat.branch-instructio=
ns
>  1.272e+13              -8%  1.173e+13        perf-stat.instructions
>  2.178e+12              -8%  1.999e+12        perf-stat.dTLB-stores
>  5.082e+08              -8%   4.67e+08        perf-stat.minor-faults
>  5.082e+08              -8%   4.67e+08        perf-stat.page-faults
>       1.31              -6%       1.24        perf-stat.cpi
>  6.454e+10              -8%  5.915e+10        perf-stat.branch-misses
>      13.23              -4%      12.71        perf-stat.cache-miss-rate%
>  1.671e+13             -13%  1.451e+13        perf-stat.cpu-cycles
>  2.313e+10             -12%  2.028e+10        perf-stat.cache-misses
>  2.093e+09             -10%  1.882e+09 =C4=85  6%  perf-stat.dTLB-store-m=
isses
>   5.66e+09             -15%  4.794e+09        perf-stat.iTLB-load-misses
>
>
>
>                                    unixbench.score
>
>   13800 ++---------------------------------------------------------------=
---+
>         |           *..*.                                                =
   |
>   13600 ++*..*.    +     *.*.. .*..*.*.. .*.*..*.                        =
   |
>         *      *..*           *         *        *..*.*..*.*.*..*.*..*.*.=
.*.*
>   13400 ++                                                               =
   |
>         |                                                                =
   |
>   13200 ++                                                               =
   |
>         |                                                                =
   |
>   13000 ++                                                               =
   |
>         |                                                                =
   |
>   12800 ++                                                               =
   |
>         O O  O    O      O                                               =
   |
>   12600 ++     O    O  O   O  O O  O O                                   =
   |
>         |                                                                =
   |
>   12400 ++------------------------------O-O-O--O-O--O-O--O---------------=
---+
>
>
>                                  perf-stat.cpu-cycles
>
>    1.7e+13 ++------------*-*--*-*-*--*-*-*------*------------------------=
---+
>            *.*..*.*.*..*                    *.*   *..*.*.*..*.*.*..*.*.*.=
.*.*
>   1.65e+13 ++                                                            =
   |
>            |                                                             =
   |
>            |                                                             =
   |
>    1.6e+13 ++                                                            =
   |
>            |                                                             =
   |
>   1.55e+13 ++                                                            =
   |
>            |                                                             =
   |
>    1.5e+13 ++                   O                                        =
   |
>            O O  O O O  O O O  O   O  O O                                 =
   |
>            |                                                             =
   |
>   1.45e+13 ++                            O  O O O O  O O O               =
   |
>            |                                                             =
   |
>    1.4e+13 ++------------------------------------------------------------=
---+
>
>
>                                 perf-stat.instructions
>
>    1.3e+13 ++------------------------------------------------------------=
---+
>            |           *.*.         .*.        .*                        =
   |
>   1.28e+13 ++*..*.   ..    *..*.*.*.   *.*..*.*  +                       =
   |
>            *      *.*                             *..*.*.*..*.*.*..*.*.*.=
.*.*
>   1.26e+13 ++                                                            =
   |
>            |                                                             =
   |
>   1.24e+13 ++                                                            =
   |
>            |                                                             =
   |
>   1.22e+13 ++                                                            =
   |
>            |                                                             =
   |
>    1.2e+13 O+O  O O O  O O O  O O    O O                                 =
   |
>            |                      O                                      =
   |
>   1.18e+13 ++                                 O        O                 =
   |
>            |                             O  O   O O  O   O               =
   |
>   1.16e+13 ++------------------------------------------------------------=
---+
>
>
>                               perf-stat.cache-references
>
>   1.78e+11 ++------------------------------------------------------------=
---+
>   1.76e+11 ++           .*.          *.        .*.                       =
   |
>            |.*..      .*   *..*.   ..  *.*..*.*   *..*.*.*.. .*.*..*.*.*.=
.*.*
>   1.74e+11 *+   *.*.*.          *.*                         *            =
   |
>   1.72e+11 ++                                                            =
   |
>            |                                                             =
   |
>    1.7e+11 ++                                                            =
   |
>   1.68e+11 ++                                                            =
   |
>   1.66e+11 ++                                                            =
   |
>            |                                                             =
   |
>   1.64e+11 ++          O O                                               =
   |
>   1.62e+11 O+O  O O O      O  O O O  O O                                 =
   |
>            |                                                             =
   |
>    1.6e+11 ++                            O  O O O O  O O O               =
   |
>   1.58e+11 ++------------------------------------------------------------=
---+
>
>
>                              perf-stat.branch-instructions
>
>    2.6e+12 ++------------------------------------------------------------=
---+
>            |                        .*.        .*                        =
   |
>   2.55e+12 ++         .*.*.  .*.*.*.   *.*..*.*  :                       =
   |
>            *.*..*.*.*.     *.                    :  .*. .*..*.*.*..*.*.*.=
.*.*
>            |                                      *.   *                 =
   |
>    2.5e+12 ++                                                            =
   |
>            |                                                             =
   |
>   2.45e+12 ++                                                            =
   |
>            |                                                             =
   |
>    2.4e+12 O+O  O        O                                               =
   |
>            |      O O  O   O  O O O  O O                                 =
   |
>            |                                                             =
   |
>   2.35e+12 ++                            O  O O O O  O O O               =
   |
>            |                                                             =
   |
>    2.3e+12 ++------------------------------------------------------------=
---+
>
>
>                                 perf-stat.branch-misses
>
>   6.6e+10 ++-------------------------------------------------------------=
---+
>           |          .*.*..*.*.*..*.*.    .*.*..*                        =
   |
>   6.5e+10 *+*..*.*.*.                 *..*       +           .*.         =
   |
>           |                                       *.*..*.*..*   *..*.*.*.=
.*.*
>   6.4e+10 ++                                                             =
   |
>           |                                                              =
   |
>   6.3e+10 ++                                                             =
   |
>           |                                                              =
   |
>   6.2e+10 ++                                                             =
   |
>           |                                                              =
   |
>   6.1e+10 ++                                                             =
   |
>           |           O O                                                =
   |
>     6e+10 O+O  O   O       O O O  O O O                                  =
   |
>           |      O                           O         O                 =
   |
>   5.9e+10 ++-----------------------------O-O----O-O-O----O---------------=
---+
>
>
>                                  perf-stat.dTLB-loads
>
>   3.35e+12 ++------------------------------------------------------------=
---+
>            |           *.*.         .*.    .*.*.*                        =
   |
>    3.3e+12 *+*..*.   ..    *..*.*.*.   *.*.      +           .*.         =
   |
>            |      *.*                             *..*.*.*..*   *..*.*.*.=
.*.*
>   3.25e+12 ++                                                            =
   |
>            |                                                             =
   |
>    3.2e+12 ++                                                            =
   |
>            |                                                             =
   |
>   3.15e+12 ++                                                            =
   |
>            |                                                             =
   |
>    3.1e+12 O+O  O O O  O O O  O O O  O O                                 =
   |
>            |                                                             =
   |
>   3.05e+12 ++                                                            =
   |
>            |                             O  O O O O  O O O               =
   |
>      3e+12 ++------------------------------------------------------------=
---+
>
>
>                                  perf-stat.dTLB-stores
>
>   2.25e+12 ++------------------------------------------------------------=
---+
>            |                                                             =
   |
>    2.2e+12 ++          *.*.      .*..*.    .*.*.*                        =
   |
>            *.*..*.*. ..    *..*.*      *.*.      +  .*. .*.. .*.*..*. .*.=
.*.*
>            |        *                             *.   *    *        *   =
   |
>   2.15e+12 ++                                                            =
   |
>            |                                                             =
   |
>    2.1e+12 ++                                                            =
   |
>            |                                                             =
   |
>   2.05e+12 O+O  O O O    O O  O O O  O O                                 =
   |
>            |           O                                                 =
   |
>            |                             O  O   O O  O   O               =
   |
>      2e+12 ++                                                            =
   |
>            |                                  O        O                 =
   |
>   1.95e+12 ++------------------------------------------------------------=
---+
>
>
>                               perf-stat.iTLB-load-misses
>
>   5.8e+09 ++-------------------------------------------------------------=
---+
>   5.7e+09 ++         .*.*..                                       .*. .*.=
.  |
>           *.*..*.*.*.      *.*.*..*.*.*.. .*.*..*.*.*..*.*..*.*.*.   *   =
 *.*
>   5.6e+09 ++                             *                               =
   |
>   5.5e+09 ++                                                             =
   |
>   5.4e+09 ++                                                             =
   |
>   5.3e+09 ++                                                             =
   |
>           |                                                              =
   |
>   5.2e+09 ++                                                             =
   |
>   5.1e+09 ++                                                             =
   |
>     5e+09 ++                                                             =
   |
>   4.9e+09 O+O  O O O  O O  O O O  O O O                                  =
   |
>           |                                                              =
   |
>   4.8e+09 ++                             O O O  O O O  O O               =
   |
>   4.7e+09 ++-------------------------------------------------------------=
---+
>
>
>                                  perf-stat.page-faults
>
>    5.2e+08 ++------------------------------------------------------------=
---+
>   5.15e+08 ++          *.*.                                              =
   |
>            |.*..     ..    *..*. .*..*.*.  .*.*.*.                       =
   |
>    5.1e+08 *+   *.*.*           *        *.       *..*.*.*..*.*.*..*.*.*.=
.*.*
>   5.05e+08 ++                                                            =
   |
>      5e+08 ++                                                            =
   |
>   4.95e+08 ++                                                            =
   |
>            |                                                             =
   |
>    4.9e+08 ++                                                            =
   |
>   4.85e+08 ++                                                            =
   |
>    4.8e+08 ++                                                            =
   |
>   4.75e+08 O+O  O O O  O O O  O O O  O O                                 =
   |
>            |                                                             =
   |
>    4.7e+08 ++                            O      O O      O               =
   |
>   4.65e+08 ++-------------------------------O-O------O-O-----------------=
---+
>
>
>                                 perf-stat.minor-faults
>
>    5.2e+08 ++------------------------------------------------------------=
---+
>   5.15e+08 ++          *.*.                                              =
   |
>            |.*..     ..    *..*. .*..*.*.  .*.*.*.                       =
   |
>    5.1e+08 *+   *.*.*           *        *.       *..*.*.*..*.*.*..*.*.*.=
.*.*
>   5.05e+08 ++                                                            =
   |
>      5e+08 ++                                                            =
   |
>   4.95e+08 ++                                                            =
   |
>            |                                                             =
   |
>    4.9e+08 ++                                                            =
   |
>   4.85e+08 ++                                                            =
   |
>    4.8e+08 ++                                                            =
   |
>   4.75e+08 O+O  O O O  O O O  O O O  O O                                 =
   |
>            |                                                             =
   |
>    4.7e+08 ++                            O      O O      O               =
   |
>   4.65e+08 ++-------------------------------O-O------O-O-----------------=
---+
>
>
>                           perf-stat.iTLB-load-miss-rate_
>
>   75.5 ++----------------------------------------------------------------=
---+
>        |      *..*.                                                      =
   |
>     75 *+*.. +     *..                                    .*.*.. .*.. .*.=
. .*
>   74.5 ++   *         *        .*.*..*.  .*. .*..*.*..*.*.      *    *   =
 * |
>        |               :     *.        *.   *                            =
   |
>     74 ++              :    +                                            =
   |
>        |                *..*                                             =
   |
>   73.5 ++                                                                =
   |
>        |                                                                 =
   |
>     73 ++                                                                =
   |
>   72.5 ++                                                                =
   |
>        |           O  O O  O O  O O  O O  O O O  O O  O O                =
   |
>     72 O+O  O O  O                                                       =
   |
>        |                                                                 =
   |
>   71.5 ++----------------------------------------------------------------=
---+
>
>
>                                    perf-stat.ipc
>
>   0.81 ++------------------------------O----O-O--O----O-O----------------=
---+
>        O O  O                             O        O                     =
   |
>    0.8 ++     O  O O  O O  O O    O  O                                   =
   |
>        |                        O                                        =
   |
>        |                                                                 =
   |
>   0.79 ++                                                                =
   |
>        |                                                                 =
   |
>   0.78 ++                                                                =
   |
>        |                                                                 =
   |
>   0.77 ++                                                                =
   |
>        |                                                                 =
   |
>        *.*..*.    .*..*                    .*.              .*.. .*..*.*.=
.*.|
>   0.76 ++     *..*     +  .*.  .*.*..*.  .*   *..*.*..*.*..*    *        =
   *
>        |                *.   *.        *.                                =
   |
>   0.75 ++----------------------------------------------------------------=
---+
>
>
>                        perf-stat.instructions-per-iTLB-miss
>
>   2500 ++----------------------------------------------------------------=
---+
>        |                                                                 =
   |
>   2450 ++                                 O O      O  O                  =
   |
>        O      O  O      O  O    O O  O O      O  O      O                =
   |
>        | O  O      O  O      O                                           =
   |
>   2400 ++                                                                =
   |
>        |                                                                 =
   |
>   2350 ++                                                                =
   |
>        |                                                                 =
   |
>   2300 ++                                                                =
   |
>        |                              .*..*.*.                           =
   |
>        *.  .*.       .*.*..*.*..*.*..*        *..                        =
.*.|
>   2250 ++*.   *..*.*.                            *.*..*.*..*.*..*.*..*.*.=
   *
>        |                                                                 =
   |
>   2200 ++----------------------------------------------------------------=
---+
>
>
>                              unixbench.time.user_time
>
>   3150 ++----------------------------------------------------------------=
---+
>        *.*..*.    .*..*.*..*.*..*.*..    .*.*.*..           .*.. .*.. .*.=
. .*
>   3100 ++     *..*                   *.*.        *.*..*.*..*    *    *   =
 * |
>   3050 ++                                                                =
   |
>        |                                                                 =
   |
>   3000 ++                                                                =
   |
>   2950 ++                                                                =
   |
>        |                                                                 =
   |
>   2900 ++                                                                =
   |
>   2850 ++                                                                =
   |
>        |                                                                 =
   |
>   2800 ++                                                                =
   |
>   2750 O+O  O O  O O  O O  O O  O O  O                                   =
   |
>        |                                                                 =
   |
>   2700 ++------------------------------O--O-O-O--O-O--O-O----------------=
---+
>
>
>                             unixbench.time.system_time
>
>   1450 ++----------------------------------------------------------------=
---+
>        |                    .*..*.*..*.*..   .*..                        =
   |
>   1400 ++            .*.*..*              *.*                            =
   |
>        |     .*.. .*.                            *.  .*.  .*.            =
   |
>        *.*..*    *                                 *.   *.   *..*.*..*.*.=
.*.*
>   1350 ++                                                                =
   |
>        |                                                                 =
   |
>   1300 ++                                                                =
   |
>        |                                                                 =
   |
>   1250 ++                                                                =
   |
>        |                     O  O    O                                   =
   |
>        O O  O O  O O  O O  O      O                                      =
   |
>   1200 ++                                                                =
   |
>        |                                    O         O                  =
   |
>   1150 ++------------------------------O--O---O--O-O----O----------------=
---+
>
>
>                            unixbench.time.minor_page_faults
>
>    5.3e+08 ++------------------------------------------------------------=
---+
>   5.25e+08 ++          *.*.                                              =
   |
>            |.*..*.   ..    *..*.*.*..*.*.  .*.*.*.           .*.         =
   |
>    5.2e+08 *+     *.*                    *.       *..*.*.*..*   *..*.*.*.=
.*.*
>   5.15e+08 ++                                                            =
   |
>    5.1e+08 ++                                                            =
   |
>   5.05e+08 ++                                                            =
   |
>            |                                                             =
   |
>      5e+08 ++                                                            =
   |
>   4.95e+08 ++                                                            =
   |
>    4.9e+08 ++                                                            =
   |
>   4.85e+08 O+O  O O O  O O O  O O    O                                   =
   |
>            |                      O    O                                 =
   |
>    4.8e+08 ++                                                            =
   |
>   4.75e+08 ++----------------------------O--O-O-O-O--O-O-O---------------=
---+
>
>
>                        unixbench.time.voluntary_context_switches
>
>   1.64e+07 ++------------------------------------------------------------=
---+
>            *.*..*.    .*.*                                   .*.         =
   |
>   1.62e+07 ++     *.*.    +  .*. .*..*.      .*.*.*..*.*.*..*   *..*.*.*.=
.*.*
>    1.6e+07 ++              *.   *      *.*..*                            =
   |
>            |                                                             =
   |
>   1.58e+07 ++                                                            =
   |
>   1.56e+07 ++                                                            =
   |
>            |                                                             =
   |
>   1.54e+07 ++                                                            =
   |
>   1.52e+07 ++                                                            =
   |
>            |                                                             =
   |
>    1.5e+07 ++                                                            =
   |
>   1.48e+07 ++                                                            =
   |
>            O O  O O O  O O O  O O    O   O  O O O O  O O O               =
   |
>   1.46e+07 ++---------------------O----O---------------------------------=
---+
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
>
> --
> You received this message because you are subscribed to the Google Groups=
 "kernel-team" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe(a)android.com.

--===============2337928658627702273==--

