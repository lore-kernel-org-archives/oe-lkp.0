Content-Type: multipart/mixed; boundary="===============7075628166068886104=="
MIME-Version: 1.0
From: Jeff Layton <jlayton@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs/locks] 9d21d181d0: will-it-scale.per_process_ops -14.1% regression
Date: Thu, 01 Jun 2017 07:41:24 -0400
Message-ID: <1496317284.2845.4.camel@redhat.com>
In-Reply-To: <20170601020556.GE16905@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7075628166068886104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-06-01 at 10:05 +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -14.1% regression of will-it-scale.per_process_ops due =
to commit:
> =

> =

> commit: 9d21d181d06acab9a8e80eac2ec4eed77b656793 ("fs/locks: Set fl_nspid=
 at file_lock allocation")
> url: https://github.com/0day-ci/linux/commits/Benjamin-Coddington/fs-lock=
s-Alloc-file_lock-where-practical/20170527-050700
> =

> =


Ouch, that's a rather nasty performance hit. In hindsight, maybe we
shouldn't move those off the stack after all? Heck, if it's that
significant, maybe we should move the F_SETLK callers to allocate these
on the stack as well?

> in testcase: will-it-scale
> on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 4=
G memory
> with following parameters:
> =

> 	test: lock1
> 	cpufreq_governor: performance
> =

> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale
> =

> In addition to that, the commit also has significant impact on the follow=
ing tests:
> =

> +------------------+-----------------------------------------------------=
-----------+
> > testcase: change | will-it-scale: will-it-scale.per_process_ops -4.9% r=
egression  |
> > test machine     | 16 threads Intel(R) Atom(R) CPU 3958 @ 2.00GHz with =
64G memory |
> > test parameters  | cpufreq_governor=3Dperformance                      =
             |
> >                  | mode=3Dprocess                                      =
             |
> >                  | nr_task=3D100%                                      =
             |
> >                  | test=3Dlock1                                        =
             |
> =

> +------------------+-----------------------------------------------------=
-----------+
> =

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

> testcase/path_params/tbox_group/run: will-it-scale/lock1-performance/lkp-=
ivb-d04
> =

> 09790e423b32fba4  9d21d181d06acab9a8e80eac2e  =

> ----------------  --------------------------  =

>       0.51              19%       0.60 =C2=B1  7%  will-it-scale.scalabil=
ity
>    2462089             -14%    2114597        will-it-scale.per_process_o=
ps
>    2195246             -26%    1631578        will-it-scale.per_thread_ops
>        350                         356        will-it-scale.time.system_t=
ime
>      28.89             -24%      22.06        will-it-scale.time.user_time
>      32.78                       31.97        turbostat.PkgWatt
>      15.58              -5%      14.80        turbostat.CorWatt
>      19284                       18803        vmstat.system.in
>      32208              -4%      31052        vmstat.system.cs
>       1630 =C2=B1173%      2e+04      18278 =C2=B1 27%  latency_stats.avg=
.perf_event_alloc.SYSC_perf_event_open.SyS_perf_event_open.entry_SYSCALL_64=
_fastpath
>       1630 =C2=B1173%      2e+04      18278 =C2=B1 27%  latency_stats.max=
.perf_event_alloc.SYSC_perf_event_open.SyS_perf_event_open.entry_SYSCALL_64=
_fastpath
>       1630 =C2=B1173%      2e+04      18278 =C2=B1 27%  latency_stats.sum=
.perf_event_alloc.SYSC_perf_event_open.SyS_perf_event_open.entry_SYSCALL_64=
_fastpath
>  1.911e+09 =C2=B1  6%       163%  5.022e+09 =C2=B1  5%  perf-stat.cache-r=
eferences
>      27.58 =C2=B1 12%        17%      32.14 =C2=B1  7%  perf-stat.iTLB-lo=
ad-miss-rate%
>    9881103              -4%    9527607        perf-stat.context-switches
>  9.567e+11 =C2=B1  9%       -14%  8.181e+11 =C2=B1  9%  perf-stat.dTLB-lo=
ads
>   6.85e+11 =C2=B1  4%       -16%  5.761e+11 =C2=B1  6%  perf-stat.branch-=
instructions
>  3.469e+12 =C2=B1  4%       -17%  2.893e+12 =C2=B1  6%  perf-stat.instruc=
tions
>       1.24 =C2=B1  4%       -19%       1.00        perf-stat.ipc
>       3.18 =C2=B1  8%       -62%       1.19 =C2=B1 19%  perf-stat.cache-m=
iss-rate%
> =

> =

> =

>                              perf-stat.cache-references
> =

>   8e+09 ++---------------------------------------------------------------=
---+
>         |                                                                =
   |
>   7e+09 ++                                             O       O         =
   |
>         |                  O                                             =
   |
>   6e+09 ++                                  O                            =
   |
>         |                                                             O  =
   |
>   5e+09 ++O                       O             O    O       O          O=
   O
>         O   O O  O O O O O   O O    O O   O   O    O       O        O    =
 O |
>   4e+09 ++                              O                O       O       =
   |
>         |                                                                =
   |
>   3e+09 ++                                                               =
   |
>         |   *.                 *..        *.                             =
   |
>   2e+09 *+ +  *..         .*. +   *. .*. +  *.    .*.*.   .*.*. .*..*    =
   |
>         | *      *.*.*.*.*   *      *   *     *.*.     *.*     *         =
   |
>   1e+09 ++---------------------------------------------------------------=
---+
> =

> =

>                           will-it-scale.time.user_time
> =

>   30 ++--*-------------------*-----------*-------------------------------=
---+
>   29 *+*    *.*.*.*..*.*.*.*    *.*.*.*.   *.*.     *. .*.    .*.*.*     =
   |
>      |                                         *. ..  *   *.*.           =
   |
>   28 ++                                          *                       =
   |
>   27 ++                                                                  =
   |
>      |                                                                   =
   |
>   26 ++                                                                  =
   |
>   25 ++                                                                  =
   |
>   24 ++                                                                  =
   |
>      |                                                                   =
   |
>   23 ++  O    O                   O O O  O O O O    O   O   O    O       =
   |
>   22 O+O    O   O O      O O O  O                O    O        O     O  O=
 O |
>      |               O                                    O        O     =
   O
>   21 ++                O                                                 =
   |
>   20 ++------------------------------------------------------------------=
---+
> =

> =

>                           will-it-scale.time.system_time
> =

>   358 ++-----------------------------------------------------------------=
---+
>   357 O+O    O   O      O       O                 O                     O=
   O
>       |   O    O   O O    O O     O  O O O          O O    O O O   O O   =
 O |
>   356 ++                      O            O O  O       O        O       =
   |
>   355 ++                                                                 =
   |
>       |                                                                  =
   |
>   354 ++                                                                 =
   |
>   353 ++                                                                 =
   |
>   352 ++                                                                 =
   |
>       |                                                                  =
   |
>   351 ++                                          *. .*.    .*.          =
   |
>   350 *+*.  .*   *     .*.*.*. .*    *.*. .*     +  *   *..*   *.*.*     =
   |
>       |   *.  + + + .*.       *  + ..    *  +  .*                        =
   |
>   349 ++       *   *              *          *.                          =
   |
>   348 ++-----------------------------------------------------------------=
---+
> =

> =

>                              will-it-scale.per_thread_ops
> =

>   2.3e+06 ++-------------------------------------------------------------=
---+
>           |                                                              =
   |
>   2.2e+06 ++*.*.   .*. .*..*. .*.*.     .*.*.         .*.*..*.*.*.*.*    =
   |
>           *     *.*   *      *     *.*.*     *.*. .*.*                   =
   |
>   2.1e+06 ++                                     *                       =
   |
>     2e+06 ++                                                             =
   |
>           |                                                              =
   |
>   1.9e+06 ++                                                             =
   |
>           |                                                              =
   |
>   1.8e+06 ++                                                             =
   |
>   1.7e+06 ++      O                    O O   O       O        O          =
   |
>           O O O     O              O       O       O     O        O     O=
   |
>   1.6e+06 ++    O     O      O O O   O         O O     O    O   O   O O  =
 O O
>           |             O  O                                             =
   |
>   1.5e+06 ++-------------------------------------------------------------=
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

-- =

Jeff Layton <jlayton@redhat.com>

--===============7075628166068886104==--

