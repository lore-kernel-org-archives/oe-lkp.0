Content-Type: multipart/mixed; boundary="===============1497183931809472332=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [signal] 4bad58ebc8: will-it-scale.per_thread_ops -3.3% regression
Date: Tue, 20 Apr 2021 20:35:06 +0200
Message-ID: <87bla8rehx.ffs@nanos.tec.linutronix.de>
In-Reply-To: <20210420030837.GB31773@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1497183931809472332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 20 2021 at 11:08, kernel test robot wrote:
> FYI, we noticed a -3.3% regression of will-it-scale.per_thread_ops due to=
 commit:
>
> commit: 4bad58ebc8bc4f20d89cff95417c9b4674769709 ("signal: Allow tasks to=
 cache one sigqueue struct")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core
>
> in testcase: will-it-scale
> on test machine: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz=
 with 192G memory
> with following parameters:
>
> 	nr_task: 100%
> 	mode: thread
> 	test: futex3
> 	cpufreq_governor: performance
> 	ucode: 0x5003006
>
> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale
> commit: =

>   69995ebbb9 ("signal: Hand SIGQUEUE_PREALLOC flag to __sigqueue_alloc()")
>   4bad58ebc8 ("signal: Allow tasks to cache one sigqueue struct")
>
> 69995ebbb9d37173 4bad58ebc8bc4f20d89cff95417 =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>  1.273e+09            -3.3%  1.231e+09        will-it-scale.192.threads
>    6630224            -3.3%    6409738        will-it-scale.per_thread_ops
>  1.273e+09            -3.3%  1.231e+09        will-it-scale.workload
>       1638 =C2=B1  3%      -7.8%       1510 =C2=B1  5%  sched_debug.cfs_r=
q:/.runnable_avg.max
>     297.83 =C2=B1 68%   +1747.6%       5502 =C2=B1152%  interrupts.33:PCI=
-MSI.524291-edge.eth0-TxRx-2
>     297.83 =C2=B1 68%   +1747.6%       5502 =C2=B1152%  interrupts.CPU12.=
33:PCI-MSI.524291-edge.eth0-TxRx-2

This change is definitely not causing more network traffic

>       8200           -33.4%       5459 =C2=B1 35%  interrupts.CPU27.NMI:N=
on-maskable_interrupts
>       8200           -33.4%       5459 =C2=B1 35%  interrupts.CPU27.PMI:P=
erformance_monitoring_interrupts
>       8199           -33.4%       5459 =C2=B1 35%  interrupts.CPU28.NMI:N=
on-maskable_interrupts
>       8199           -33.4%       5459 =C2=B1 35%  interrupts.CPU28.PMI:P=
erformance_monitoring_interrupts
>       6148 =C2=B1 33%     -11.2%       5459 =C2=B1 35%  interrupts.CPU29.=
NMI:Non-maskable_interrupts
>       6148 =C2=B1 33%     -11.2%       5459 =C2=B1 35%  interrupts.CPU29.=
PMI:Performance_monitoring_interrupts
>       4287 =C2=B1  8%     +33.6%       5730 =C2=B1 15%  interrupts.CPU49.=
CAL:Function_call_interrupts
>       6356 =C2=B1 19%     +49.6%       9509 =C2=B1 19%  interrupts.CPU97.=
CAL:Function_call_interrupts

Neither does it increase the number of function calls

>     407730 =C2=B1  8%     +37.5%     560565 =C2=B1  7%  perf-stat.i.dTLB-=
load-misses
>     415959 =C2=B1  8%     +40.4%     583928 =C2=B1  7%  perf-stat.ps.dTLB=
-load-misses

And this massive increase does not make sense either.

Confused.

Thanks,

        tglx
--===============1497183931809472332==--

