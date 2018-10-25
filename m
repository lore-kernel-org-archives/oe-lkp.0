Content-Type: multipart/mixed; boundary="===============6271078142389855317=="
MIME-Version: 1.0
From: Patrick Bellasi <patrick.bellasi@arm.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/fair] d519329f72: unixbench.score -9.9% regression
Date: Thu, 25 Oct 2018 10:31:00 +0100
Message-ID: <20181025093100.GB13236@e110439-lin>
In-Reply-To: <20181025085629.GA18146@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6271078142389855317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 25-Oct 16:56, Aaron Lu wrote:
> On Wed, Oct 24, 2018 at 06:01:37PM +0100, Patrick Bellasi wrote:
> > On 24-Oct 14:41, Aaron Lu wrote:
> > > On Mon, Apr 02, 2018 at 11:20:00AM +0800, Ye, Xiaolong wrote:
> > > > =

> > > > Greeting,
> > > > =

> > > > FYI, we noticed a -9.9% regression of unixbench.score due to commit:
> > > > =

> > > > =

> > > > commit: d519329f72a6f36bc4f2b85452640cfe583b4f81 ("sched/fair: Upda=
te util_est only on util_avg updates")
> > > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git ma=
ster
> > > > =

> > > > in testcase: unixbench
> > > > on test machine: 8 threads Intel(R) Core(TM) i7 CPU 870 @ 2.93GHz w=
ith 6G memory
> > > > with following parameters:
> > > > =

> > > >         runtime: 300s
> > > >         nr_task: 100%
> > > >         test: execl
> > > > =

> > > > test-description: UnixBench is the original BYTE UNIX benchmark sui=
te aims to test performance of Unix-like system.
> > > > test-url: https://github.com/kdlucas/byte-unixbench
> > =

> > Hi Aaron,
> >  =

> > > I tested this workload on different machines with this commit
> > > d519329f72a6f36bc4f2b85452 and its parent a07630b8b2c16f82, I also
> > > tested with v4.19-rc8 to see if the regression is gone -
> > > the performance drop is there with v4.19-rc8 and with different
> > > machines so I assume this regression is not solved yet.
> > >
> > > Here are detailed data:
> > > =

> > > cmdline used to run this workload:
> > > ./Run execl -c $nr_cpu -i 30
> > =

> > I had a better look into this issue and found that something like this
> > could be the cure for the execl throughput regression:
> =

> Good news, yes they are!

Great.

> > ---8<---
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 908c9cdae2f0..c34d41b542fc 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -6258,8 +6258,17 @@ static unsigned long cpu_util_wake(int cpu, stru=
ct task_struct *p)
> >  	 * covered by the following code when estimated utilization is
> >  	 * enabled.
> >  	 */
> > -	if (sched_feat(UTIL_EST))
> > -		util =3D max(util, READ_ONCE(cfs_rq->avg.util_est.enqueued));
> > +	if (sched_feat(UTIL_EST)) {
> > +		unsigned int estimated =3D
> > +			READ_ONCE(cfs_rq->avg.util_est.enqueued);
> > +
> > +		if (unlikely(current =3D=3D p)) {
> > +			estimated -=3D min_t(unsigned int, estimated,
> > +				(_task_util_est(p) | UTIL_AVG_UNCHANGED));
> > +		}
> > +
> > +		util =3D max(util, estimated);
> > +	}
> > =

> >  	/*
> >  	 * Utilization (estimated) can exceed the CPU capacity, thus let's
> > ---8<---
> > =

> > I'll test this better on a machine on my side and send out a proper
> > patch by tomorrow.
> > =

> > > Please let me know if you need other information, thanks.
> > =

> > Would be nice if you can test the above on your side too.
> > =

> =

> commit cbcb74a95c5af32f9127a102feca323139ba2c49 is the commit I made
> from your diff and it restored performance for the two desktops. the
> result on the skylake server isn't quite stable so I think the
> performance gap is due to noise.
> =

> lkp-ivb-d04:
> cbcb74a95c5af32f9127a102feca323139ba2c49/avg.json:  "unixbench.score": 29=
46.0,
> d519329f72a6f36bc4f2b85452640cfe583b4f81/avg.json:  "unixbench.score": 26=
69.5333333333333,
> a07630b8b2c16f82fd5b71d890079f4dd7599c1d/avg.json:  "unixbench.score": 29=
24.3333333333335,
> =

> lkp-hsw-d01:
> cbcb74a95c5af32f9127a102feca323139ba2c49/avg.json:  "unixbench.score": 70=
13.533333333333,
> d519329f72a6f36bc4f2b85452640cfe583b4f81/avg.json:  "unixbench.score": 64=
21.233333333333,
> a07630b8b2c16f82fd5b71d890079f4dd7599c1d/avg.json:  "unixbench.score": 70=
90.400000000001,
> =

> lkp-skl-2sp2:
> cbcb74a95c5af32f9127a102feca323139ba2c49/avg.json:  "unixbench.score": 93=
47.02,
> d519329f72a6f36bc4f2b85452640cfe583b4f81/avg.json:  "unixbench.score": 93=
62.76,
> a07630b8b2c16f82fd5b71d890079f4dd7599c1d/avg.json:  "unixbench.score": 95=
20.86,

I've measured a ~15% speedup with the patch in wrt v4.19.0 on a
40 CPUs Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz.

###########################################################################=
#####
### Mainline (v4.19.0):

Benchmark Run: Wed Oct 24 2018 16:13:34 - 16:19:04
40 CPUs in system; running 40 parallel copies of tests

Execl Throughput                              48136.5 lps   (29.9 s, 7 samp=
les)

System Benchmarks Partial Index              BASELINE       RESULT    INDEX
Execl Throughput                                 43.0      48136.5  11194.5
                                                                   =3D=3D=
=3D=3D=3D=3D=3D=3D
System Benchmarks Index Score (Partial Only)                        11194.5

###########################################################################=
#####
### Mainline (v4.19.0) + patch:

Benchmark Run: Wed Oct 24 2018 16:29:56 - 16:35:26
40 CPUs in system; running 40 parallel copies of tests

Execl Throughput                              55373.6 lps   (29.9 s, 7 samp=
les)

System Benchmarks Partial Index              BASELINE       RESULT    INDEX
Execl Throughput                                 43.0      55373.6  12877.6
                                                                   =3D=3D=
=3D=3D=3D=3D=3D=3D
System Benchmarks Index Score (Partial Only)                        12877.6

###########################################################################=
#####

Thanks again reporting and testing on your side, I'll post soon a proper
patch.

Cheers Patrick

-- =

#include <best/regards.h>

Patrick Bellasi

--===============6271078142389855317==--

