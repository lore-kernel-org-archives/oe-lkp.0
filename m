Content-Type: multipart/mixed; boundary="===============4754889347820234460=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/irq] 82ba4faca1: [No primary change] [unixbench]
Date: Wed, 24 Aug 2016 12:34:02 +0800
Message-ID: <20160824043402.GG3980@intel.com>
In-Reply-To: <f0af084f-ba9e-55cf-2336-24be1a502102@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4754889347820234460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2016 at 11:13:59AM +0800, Aaron Lu wrote:
> On 08/24/2016 11:04 AM, kernel test robot wrote:
> > =

> > FYI, we noticed interrupts.CAL:Function_call_interrupts +771.1% improve=
ment due to commit:

to Xiaolong, i guess more interrupts can't be called as improvement, or it =
doesn't matter.

> =

> This is expected.
> =

> CAL:Function_call_interrupts now contains TLB shootdowns while it
> doesn't previously.
> =

> Thanks,
> Aaron
> =

> > =

> > commit 82ba4faca1bffad429f15c90c980ffd010366c25 ("x86/irq: Do not subst=
ract irq_tlb_count from irq_call_count")
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mast=
er
> > =

> > in testcase: unixbench
> > on test machine: 8 threads Nehalem with 6G memory
> > with following parameters:
> > =

> > 	runtime: 300s
> > 	nr_task: 1
> > 	test: shell8
> > =

> > iN addition to that, the commit also has significant impact (interrupts=
.CAL:Function_call_interrupts +1822.5%)
> > on the following tests:
> > =

> > +------------------+----------------------------------+
> > | testcase         | unixbench                        |
> > | test machine     | 8 threads Nehalem with 6G memory |
> > | test parameters  | nr_task=3D100%                     |
> > |                  | runtime=3D300s                     |
> > |                  | test=3Dexecl                       |
> > +------------------+----------------------------------+
> > =

> > =

> > Disclaimer:
> > Results have been estimated based on internal Intel analysis and are pr=
ovided
> > for informational purposes only. Any difference in system hardware or s=
oftware
> > design or configuration may affect actual performance.
> > =

> > Details are as below:
> > -----------------------------------------------------------------------=
--------------------------->
> > =

> > =

> > To reproduce:
> > =

> >         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp=
-tests.git
> >         cd lkp-tests
> >         bin/lkp install job.yaml  # job file is attached in this email
> >         bin/lkp run     job.yaml
> > =

> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > compiler/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
> >   gcc-6/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/300s/nhm-white/shell=
8/unixbench
> > =

> > commit: =

> >   ace7fab7a6 ("x86/mm: Fix swap entry comment and macro")
> >   82ba4faca1 ("x86/irq: Do not substract irq_tlb_count from irq_call_co=
unt")
> > =

> > ace7fab7a6cdd363 82ba4faca1bffad429f15c90c9 =

> > ---------------- -------------------------- =

> >          %stddev     %change         %stddev
> >              \          |                \  =

> >      48379 =C2=B1  0%    +771.1%     421448 =C2=B1  0%  interrupts.CAL:=
Function_call_interrupts
> >      19934 =C2=B1  8%     -10.3%      17882 =C2=B1  4%  meminfo.AnonHug=
ePages
> >     177575 =C2=B1  8%     -11.9%     156428 =C2=B1  7%  sched_debug.cpu=
.avg_idle.min
> >       0.36 =C2=B1 35%    +431.2%       1.93 =C2=B1 55%  sched_debug.cpu=
.cpu_load[0].min
> >      25.84 =C2=B1  1%     +11.3%      28.77 =C2=B1  4%  sched_debug.cpu=
.cpu_load[1].min
> >       5.38 =C2=B1  3%     -13.9%       4.63 =C2=B1  5%  sched_debug.cpu=
.cpu_load[1].stddev
> > =

> > =

> > =

> > =

> >                        interrupts.CAL:Function_call_interrupts
> > =

> >   450000 ++------------------------------------------------------------=
-----+
> >          O O OO O O OO O O OO O O OO O O O OO                          =
     |
> >   400000 ++                                                            =
     |
> >   350000 ++                                                            =
     |
> >          |                                                             =
     |
> >   300000 ++                                                            =
     |
> >   250000 ++                                                            =
     |
> >          |                                                             =
     |
> >   200000 ++                                                            =
     |
> >   150000 ++                                                            =
     |
> >          |                                                             =
     |
> >   100000 ++                                                            =
     |
> >    50000 *+ .**.*.*.*     .**.*.*. *.*.*.*.*   .*. *.*.*.**    .*   .*.=
* .*.*
> >          | *         :.*.*        *         :.*   *        + .*  *.*   =
 *   |
> >        0 ++----------*----------------------*---------------*----------=
-----+
> > =

> > =

> > 	[*] bisect-good sample
> > 	[O] bisect-bad  sample
> > =

> > ***********************************************************************=
****************************
> > nhm-white: 8 threads Nehalem with 6G memory
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > compiler/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
> >   gcc-6/x86_64-rhel/100%/debian-x86_64-2015-02-07.cgz/300s/nhm-white/ex=
ecl/unixbench
> > =

> > commit: =

> >   ace7fab7a6 ("x86/mm: Fix swap entry comment and macro")
> >   82ba4faca1 ("x86/irq: Do not substract irq_tlb_count from irq_call_co=
unt")
> > =

> > ace7fab7a6cdd363 82ba4faca1bffad429f15c90c9 =

> > ---------------- -------------------------- =

> >        fail:runs  %reproduction    fail:runs
> >            |             |             |    =

> >          %stddev     %change         %stddev
> >              \          |                \  =

> >      25890 =C2=B1  1%   +1822.5%     497748 =C2=B1  1%  interrupts.CAL:=
Function_call_interrupts
> >      15522 =C2=B1 80%    +354.6%      70567 =C2=B1146%  latency_stats.a=
vg.max
> >       0.28 =C2=B1 11%     +23.9%       0.34 =C2=B1  4%  sched_debug.cfs=
_rq:/.nr_running.stddev
> >     535.29 =C2=B1  0%   +2071.2%      11622 =C2=B1 55%  sched_debug.cfs=
_rq:/.runnable_load_avg.max
> >      18.12 =C2=B1 35%     -66.9%       6.00 =C2=B1 85%  sched_debug.cfs=
_rq:/.runnable_load_avg.min
> >     159.21 =C2=B1  0%   +2305.2%       3829 =C2=B1 55%  sched_debug.cfs=
_rq:/.runnable_load_avg.stddev
> >     109.46 =C2=B1  3%   +1268.4%       1497 =C2=B1 53%  sched_debug.cpu=
.cpu_load[0].avg
> >     535.25 =C2=B1  0%   +2071.2%      11621 =C2=B1 55%  sched_debug.cpu=
.cpu_load[0].max
> >     536.29 =C2=B1  0%   +2067.3%      11623 =C2=B1 55%  sched_debug.cpu=
.cpu_load[1].max
> >     158.13 =C2=B1  0%   +2317.9%       3823 =C2=B1 55%  sched_debug.cpu=
.cpu_load[1].stddev
> >     535.92 =C2=B1  0%   +2068.9%      11623 =C2=B1 55%  sched_debug.cpu=
.cpu_load[2].max
> >     158.04 =C2=B1  0%   +2319.1%       3823 =C2=B1 55%  sched_debug.cpu=
.cpu_load[2].stddev
> >     535.00 =C2=B1  0%   +2072.4%      11622 =C2=B1 55%  sched_debug.cpu=
.cpu_load[3].max
> >     157.68 =C2=B1  0%   +2324.3%       3822 =C2=B1 55%  sched_debug.cpu=
.cpu_load[3].stddev
> >     533.17 =C2=B1  0%   +2079.7%      11621 =C2=B1 55%  sched_debug.cpu=
.cpu_load[4].max
> >     157.11 =C2=B1  0%   +2332.9%       3822 =C2=B1 55%  sched_debug.cpu=
.cpu_load[4].stddev
> >     168510 =C2=B1  2%    +840.5%    1584778 =C2=B1 51%  sched_debug.cpu=
.load.avg
> >     600190 =C2=B1  1%   +1904.9%   12033432 =C2=B1 54%  sched_debug.cpu=
.load.max
> >     197074 =C2=B1  1%   +1909.8%    3960765 =C2=B1 54%  sched_debug.cpu=
.load.stddev
> >      -1804 =C2=B1-12%     -28.0%      -1299 =C2=B1-13%  sched_debug.cpu=
.nr_uninterruptible.min
> >       1327 =C2=B1 19%     -24.6%       1000 =C2=B1 19%  sched_debug.cpu=
.nr_uninterruptible.stddev
> > =

> > =

> > =

> > =

> > =

> > =

> > =

> > Thanks,
> > Xiaolong
> > =

> =

> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============4754889347820234460==--

