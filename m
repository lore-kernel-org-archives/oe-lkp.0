Content-Type: multipart/mixed; boundary="===============9015567707252459889=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@suse.de>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 8d86968ac3: netperf.Throughput_tps -29.5% regression
Date: Wed, 02 Dec 2020 14:48:18 +0000
Message-ID: <20201202144818.GZ3306@suse.de>
In-Reply-To: <b45171de-cb74-bf35-91bf-967dbd5567d1@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9015567707252459889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 02, 2020 at 10:29:59PM +0800, Li, Aubrey wrote:
> > If the idle mask is not getting cleared then select_idle_cpu() is
> > probably returning immediately. select_idle_core() is almost certainly
> > failing so that just leaves select_idle_smt() to find a potentially idle
> > CPU. That's a limited search space so tasks may be getting stacked and
> > missing CPUs that are idling for short periods.
> =

> Vincent suggested we decouple idle cpumask from short idle(stop tick) and
> set it every time the CPU enters idle, I'll make this change in V6.
> =


As a heads-up, I'm trying to prepare a series that alters the time
complexity in general of select_idle_sibling(). It would tie into what
you are doing with the idle cpumask tracking but would use it as a hint
for CPUs to search first. It's still a WIP but I'm hoping to post
something tomorrow. It would not replace your patch, just alter it a bit
in terms of what happens just before select_idle_cpu().

> > =

> > On the flip side, I expect cases like hackbench to benefit because it
> > can saturate a machine to such a degree that select_idle_cpu() is a was=
te
> > of time.
> =

> Yes, I believe that's also why I saw uperf/netperf improvement at high
> load levels.
> =


Yeah, hackbench is a case where SIS_AVG_CPU shines even though it does
not help other cases. It throttles the search. In the series I'm working
on right now, I simply kill SIS_AVG_CPU but might incorporate something
like it into SIS_PROP as the last patch of the series as an RFC.

> > =

> > That said, I haven't followed the different versions closely. I know v5
> > got a lot of feedback so will take a closer look at v6. Fundamentally
> > though I expect that using the idle mask will be a mixed bag. At low
> > utilisation or over-saturation, it'll be a benefit. At the point where
> > the machine is almost fully busy, some workloads will benefit (lightly
> > communicating workloads that occasionally migrate) and others will not
> > (ping-pong workloads looking for CPUs that are idle for very brief
> > periods).
> =

> Do you have any interested workload [matrix] I can do the measurement?
> =


Usually I go with a battery of tests from mmtests instead of one or two
specifically to have a mix of wakeup timing, communication patterns and
degrees of utilisation. The downside is that they take ages to run.

> > It's tricky enough that it might benefit from a sched_feat() check that
> > is default true so it gets tested. For regressions that show up, it'll
> > be easy enough to ask for the feature to be disabled to see if it fixes
> > it. Over time, that might give an idea of exactly what sort of workloads
> > benefit and what suffers.
> =

> Okay, I'll add a sched_feat() for this feature.
> =


If the series I'm preparing works out ok and your patch can be integrated,
the sched_feat() may not be necessary because your patch would further
reduce time complexity without worrying about when the information
gets reset.

-- =

Mel Gorman
SUSE Labs
--===============9015567707252459889==--

