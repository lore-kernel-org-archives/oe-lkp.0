Content-Type: multipart/mixed; boundary="===============4205155949438679460=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [signal] 4bad58ebc8: will-it-scale.per_thread_ops -3.3% regression
Date: Thu, 22 Apr 2021 14:02:13 +0800
Message-ID: <20210422060213.GC31382@xsang-OptiPlex-9020>
In-Reply-To: <87bla8rehx.ffs@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============4205155949438679460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi, Thomas Gleixner,

On Tue, Apr 20, 2021 at 08:35:06PM +0200, Thomas Gleixner wrote:
> On Tue, Apr 20 2021 at 11:08, kernel test robot wrote:
> > FYI, we noticed a -3.3% regression of will-it-scale.per_thread_ops due =
to commit:
> >
> > commit: 4bad58ebc8bc4f20d89cff95417c9b4674769709 ("signal: Allow tasks =
to cache one sigqueue struct")
> > https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core
> >
> > in testcase: will-it-scale
> > on test machine: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30G=
Hz with 192G memory
> > with following parameters:
> >
> > 	nr_task: 100%
> > 	mode: thread
> > 	test: futex3
> > 	cpufreq_governor: performance
> > 	ucode: 0x5003006
> >
> > test-description: Will It Scale takes a testcase and runs it from 1 thr=
ough to n parallel copies to see if the testcase will scale. It builds both=
 a process and threads based test in order to see any differences between t=
he two.
> > test-url: https://github.com/antonblanchard/will-it-scale
> > commit: =

> >   69995ebbb9 ("signal: Hand SIGQUEUE_PREALLOC flag to __sigqueue_alloc(=
)")
> >   4bad58ebc8 ("signal: Allow tasks to cache one sigqueue struct")
> >
> > 69995ebbb9d37173 4bad58ebc8bc4f20d89cff95417 =

> > ---------------- --------------------------- =

> >          %stddev     %change         %stddev
> >              \          |                \  =

> >  1.273e+09            -3.3%  1.231e+09        will-it-scale.192.threads
> >    6630224            -3.3%    6409738        will-it-scale.per_thread_=
ops
> >  1.273e+09            -3.3%  1.231e+09        will-it-scale.workload
> >       1638 =C2=B1  3%      -7.8%       1510 =C2=B1  5%  sched_debug.cfs=
_rq:/.runnable_avg.max
> >     297.83 =C2=B1 68%   +1747.6%       5502 =C2=B1152%  interrupts.33:P=
CI-MSI.524291-edge.eth0-TxRx-2
> >     297.83 =C2=B1 68%   +1747.6%       5502 =C2=B1152%  interrupts.CPU1=
2.33:PCI-MSI.524291-edge.eth0-TxRx-2
> =

> This change is definitely not causing more network traffic
> =

> >       8200           -33.4%       5459 =C2=B1 35%  interrupts.CPU27.NMI=
:Non-maskable_interrupts
> >       8200           -33.4%       5459 =C2=B1 35%  interrupts.CPU27.PMI=
:Performance_monitoring_interrupts
> >       8199           -33.4%       5459 =C2=B1 35%  interrupts.CPU28.NMI=
:Non-maskable_interrupts
> >       8199           -33.4%       5459 =C2=B1 35%  interrupts.CPU28.PMI=
:Performance_monitoring_interrupts
> >       6148 =C2=B1 33%     -11.2%       5459 =C2=B1 35%  interrupts.CPU2=
9.NMI:Non-maskable_interrupts
> >       6148 =C2=B1 33%     -11.2%       5459 =C2=B1 35%  interrupts.CPU2=
9.PMI:Performance_monitoring_interrupts
> >       4287 =C2=B1  8%     +33.6%       5730 =C2=B1 15%  interrupts.CPU4=
9.CAL:Function_call_interrupts
> >       6356 =C2=B1 19%     +49.6%       9509 =C2=B1 19%  interrupts.CPU9=
7.CAL:Function_call_interrupts
> =

> Neither does it increase the number of function calls
> =

> >     407730 =C2=B1  8%     +37.5%     560565 =C2=B1  7%  perf-stat.i.dTL=
B-load-misses
> >     415959 =C2=B1  8%     +40.4%     583928 =C2=B1  7%  perf-stat.ps.dT=
LB-load-misses
> =

> And this massive increase does not make sense either.
> =

> Confused.

FYI.
we re-test this, and confirmed the regression persistent. still:

69995ebbb9d37173 4bad58ebc8bc4f20d89cff95417
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
 1.271e+09            -3.3%  1.229e+09        will-it-scale.192.threads
   6620228            -3.3%    6401749        will-it-scale.per_thread_ops
 1.271e+09            -3.3%  1.229e+09        will-it-scale.workload

both fbc and parent use identical config, as attached in original report.

data for 4bad58ebc8bc4f20d89cff95417:
4bad58ebc8bc4f20d89cff95417c9b4674769709/matrix.json:  "will-it-scale.per_t=
hread_ops": [
4bad58ebc8bc4f20d89cff95417c9b4674769709/matrix.json-    6404491,
4bad58ebc8bc4f20d89cff95417c9b4674769709/matrix.json-    6421116,
4bad58ebc8bc4f20d89cff95417c9b4674769709/matrix.json-    6402763,
4bad58ebc8bc4f20d89cff95417c9b4674769709/matrix.json-    6403483,
4bad58ebc8bc4f20d89cff95417c9b4674769709/matrix.json-    6412066,
4bad58ebc8bc4f20d89cff95417c9b4674769709/matrix.json-    6414511,
4bad58ebc8bc4f20d89cff95417c9b4674769709/matrix.json-    6395917,  <------ =
new 14 runs
4bad58ebc8bc4f20d89cff95417c9b4674769709/matrix.json-    6396872,
4bad58ebc8bc4f20d89cff95417c9b4674769709/matrix.json-    6400830,
4bad58ebc8bc4f20d89cff95417c9b4674769709/matrix.json-    6408883,
4bad58ebc8bc4f20d89cff95417c9b4674769709/matrix.json-    6403844,
4bad58ebc8bc4f20d89cff95417c9b4674769709/matrix.json-    6405911,
4bad58ebc8bc4f20d89cff95417c9b4674769709/matrix.json-    6390766,
4bad58ebc8bc4f20d89cff95417c9b4674769709/matrix.json-    6394523,
4bad58ebc8bc4f20d89cff95417c9b4674769709/matrix.json-    6394594,
4bad58ebc8bc4f20d89cff95417c9b4674769709/matrix.json-    6399547,
4bad58ebc8bc4f20d89cff95417c9b4674769709/matrix.json-    6402487,
4bad58ebc8bc4f20d89cff95417c9b4674769709/matrix.json-    6394673,
4bad58ebc8bc4f20d89cff95417c9b4674769709/matrix.json-    6400717,
4bad58ebc8bc4f20d89cff95417c9b4674769709/matrix.json-    6386997

data for parent (69995ebbb9d37173):
69995ebbb9d3717306a165db88a1292b63f77a37/matrix.json:  "will-it-scale.per_t=
hread_ops": [
69995ebbb9d3717306a165db88a1292b63f77a37/matrix.json-    6640509,
69995ebbb9d3717306a165db88a1292b63f77a37/matrix.json-    6630326,
69995ebbb9d3717306a165db88a1292b63f77a37/matrix.json-    6633025,
69995ebbb9d3717306a165db88a1292b63f77a37/matrix.json-    6625355,
69995ebbb9d3717306a165db88a1292b63f77a37/matrix.json-    6623274,
69995ebbb9d3717306a165db88a1292b63f77a37/matrix.json-    6628858,
69995ebbb9d3717306a165db88a1292b63f77a37/matrix.json-    6614380,   <----- =
new 14 runs
69995ebbb9d3717306a165db88a1292b63f77a37/matrix.json-    6607324,
69995ebbb9d3717306a165db88a1292b63f77a37/matrix.json-    6613340,
69995ebbb9d3717306a165db88a1292b63f77a37/matrix.json-    6610083,
69995ebbb9d3717306a165db88a1292b63f77a37/matrix.json-    6616290,
69995ebbb9d3717306a165db88a1292b63f77a37/matrix.json-    6616934,
69995ebbb9d3717306a165db88a1292b63f77a37/matrix.json-    6618978,
69995ebbb9d3717306a165db88a1292b63f77a37/matrix.json-    6627108,
69995ebbb9d3717306a165db88a1292b63f77a37/matrix.json-    6609973,
69995ebbb9d3717306a165db88a1292b63f77a37/matrix.json-    6618440,
69995ebbb9d3717306a165db88a1292b63f77a37/matrix.json-    6617191,
69995ebbb9d3717306a165db88a1292b63f77a37/matrix.json-    6615858,
69995ebbb9d3717306a165db88a1292b63f77a37/matrix.json-    6615761,
69995ebbb9d3717306a165db88a1292b63f77a37/matrix.json-    6621558

> =

> Thanks,
> =

>         tglx
--===============4205155949438679460==--

