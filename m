Content-Type: multipart/mixed; boundary="===============4953721357153722377=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/rt] 9763e5491c: hackbench.throughput -5% regression
Date: Tue, 25 Apr 2017 08:07:41 -0400
Message-ID: <20170425080741.0ba610cc@gandalf.local.home>
In-Reply-To: <20170425021822.GK15491@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4953721357153722377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Apr 2017 10:18:22 +0800
kernel test robot <xiaolong.ye@intel.com> wrote:

> Greeting,
> =

> We noticed a -5% regression of hackbench.throughput due to commit:
> =

> commit: 9763e5491c0e42c3e8b88e8ea1f876e042d08db8 ("sched/rt: Simplify the=
 IPI rt balancing logic")
> url: https://github.com/0day-ci/linux/commits/Steven-Rostedt/sched-rt-Sim=
plify-the-IPI-rt-balancing-logic/20170422-154431

Hi Fengguang,

I'm having trouble seeing which version of the patch this is. The above
URL is extremely slow, and gives errors about loading patches. I made a
patch that improved the atomics. I'm not sure that was the one that was
tested or the older one.

-- Steve

> =

> =

> in testcase: hackbench
> on test machine: 112 threads Skylake with 64G memory
> with following parameters:
> =

> 	nr_threads: 50%
> 	mode: threads
> 	ipc: pipe
> 	cpufreq_governor: performance
> =

> test-description: Hackbench is both a benchmark and a stress test for the=
 Linux kernel scheduler.
> test-url: https://github.com/linux-test-project/ltp/blob/master/testcases=
/kernel/sched/cfs-scheduler/hackbench.c
> =

> =

> =

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->  =

> =

> =

> To reproduce:
> =

>         git clone https://github.com/01org/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> testcase/path_params/tbox_group/run: hackbench/50%-threads-pipe-performan=
ce/lkp-skl-sp1
> =

> 21173d0b4d2a0b9e  9763e5491c0e42c3e8b88e8ea1  =

> ----------------  --------------------------  =

>          %stddev      change         %stddev
>              \          |                \  =

>     205737              -5%     196272        hackbench.throughput
>      68484              -5%      64767        hackbench.time.system_time
>        640              -6%        604        hackbench.time.elapsed_time
>        640              -6%        604        hackbench.time.elapsed_time=
.max
>      49827             -10%      44859        hackbench.time.minor_page_f=
aults
>       2318 =C2=B1  5%       -11%       2051 =C2=B1  5%  hackbench.time.us=
er_time
>  8.799e+09             -13%  7.648e+09        hackbench.time.voluntary_co=
ntext_switches
>  6.154e+09             -17%  5.111e+09        hackbench.time.involuntary_=
context_switches
>       1404              -9%       1283 =C2=B1  6%  interrupts.CAL:Functio=
n_call_interrupts
>    1543105               8%    1665008        vmstat.system.in
>   23382180             -10%   21153429        vmstat.system.cs
> =

> =

> =

>                                 hackbench.throughput
> =

>   215000 ++--------------------------------------------------------------=
---+
>          |                                                               =
   |
>   210000 ++          *.*..*.  .*. .*..*.*..*.*.*..                       =
   |
>          |          +       *.   *                                       =
   |
>          *.    .*..*                              *.*.*.. .*..*.*.*..*.*.=
.*.|
>   205000 ++*..*                                          *               =
   *
>          |                                                               =
   |
>   200000 ++                                                              =
   |
>          |                                        O O                    =
   |
>   195000 ++                    O O O  O O  O O O      O  O               =
   |
>          |           O    O O                                            =
   |
>          | O  O O  O   O                                                 =
   |
>   190000 O+                                                              =
   |
>          |                                                               =
   |
>   185000 ++--------------------------------------------------------------=
---+
> =

> =

>                           hackbench.time.minor_page_faults
> =

>   50000 *+*-------*-*--*-*-*--*-*--*-*-----------*--*-*------*--*------*-=
-*-*
>         |    *.*.                       *.*.*..*         *.*      *..*   =
   |
>   49000 ++                                                               =
   |
>         |                                                                =
   |
>         |                                                                =
   |
>   48000 ++                                                               =
   |
>         |                                                                =
   |
>   47000 ++                                                               =
   |
>         |                                                                =
   |
>   46000 ++                                                               =
   |
>         |                                                                =
   |
>         |                                                                =
   |
>   45000 O+O  O O  O O  O O O  O O  O O  O O O  O O  O O  O               =
   |
>         |                                                                =
   |
>   44000 ++---------------------------------------------------------------=
---+
> =

> =

>                        hackbench.time.voluntary_context_switches
> =

>     9e+09 ++-------------------------------------------------------------=
---+
>           |                                                              =
   |
>   8.8e+09 ++                                          .*.*..*.*.*..*.*.*.=
.*.*
>           *.*..*.*.*..*.*..*.*.*..*.*.*..*.*.*..*.*.*.                   =
   |
>   8.6e+09 ++                                                             =
   |
>           |                                                              =
   |
>   8.4e+09 ++                                                             =
   |
>           |                                                              =
   |
>   8.2e+09 ++                                                             =
   |
>           |                                                              =
   |
>     8e+09 ++                                                             =
   |
>           |                                                              =
   |
>   7.8e+09 O+               O O                                           =
   |
>           | O  O O O  O O         O        O    O      O O               =
   |
>   7.6e+09 ++-------------------O----O-O--O---O----O-O--------------------=
---+
> =

> =

>                       hackbench.time.involuntary_context_switches
> =

>   6.2e+09 ++------------------------------------------------*--------*---=
---*
>           |                                            *.*.   *.*..*   *.=
.* |
>     6e+09 ++                  .*..                   ..                  =
   |
>           |       .*..*.*..*.*    *.*.*..*.*.*..*.*.*                    =
   |
>           *.    .*                                                       =
   |
>   5.8e+09 ++*..*                                                         =
   |
>           |                                                              =
   |
>   5.6e+09 ++                                                             =
   |
>           |                                                              =
   |
>   5.4e+09 ++                                                             =
   |
>           O                O                                             =
   |
>           | O  O O O    O    O    O                                      =
   |
>   5.2e+09 ++          O        O    O O  O O O  O        O               =
   |
>           |                                       O O  O                 =
   |
>     5e+09 ++-------------------------------------------------------------=
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


--===============4953721357153722377==--

