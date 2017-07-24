Content-Type: multipart/mixed; boundary="===============6742047367815708778=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/mm] 94b1b03b51: hackbench.throughput -20% regression
Date: Mon, 24 Jul 2017 11:34:30 +0200
Message-ID: <20170724093430.bvekmzz2jwm7vpqj@gmail.com>
In-Reply-To: <20170724092819.os6uomz4i2et47ul@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6742047367815708778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> > > > AFAICT this is a regression running hackbench with 56 * 40 threads =
on
> > > > 112 CPUs.  The performance numbers are odd -- it looks like only 10
> > > > CPUs worth of work are happening, so the system is 90% or so idle.
> > > > I'm not sure why.
> > > > =

> > > > I suspect this is hitting the nasty case that Rik thought of: on
> > > > transition to and from idle, we're doing cpumask_clear() and
> > > > cpumask_set() respecitvely on a per-mm bitmask, causing false shari=
ng.
> > > > This is merely a worsening of an existing problem that we do mmgrab=
()
> > > > and mmdrop() in the scheduler to keep track of the reference counts.
> > > > IOW our performance is generally awful on NUMA or other big systems
> > > > with mms with many threads on many CPUs that are constantly going i=
dle
> > > > and un-idle.
> > > > =

> > > > Do we care for the purpose of the PCID series?  This is a bit of a
> > > > weird corner case.

BTW., we could eliminate the MM cpumask twiddling with the following change=
 in its =

definition:

 - don't clear the cpumask in the context switch path

 - only clear the cpumask if a task is explicitly migrated from one CPU to =
another =

   and the current task on the old CPU has a different MM

this should not affect correctness (I think ...) - it might create addition=
al TLB =

flushes in some patterns where threads that gone idle for a long time, but =
it =

should auto-clear pretty well on busy systems due to the migration rule =

(statistically).

This should get rid of this high rate of cpumask operations.

Doing this only makes sense if we manage to get rid of the mmgrab()/mmdrop(=
) dance =

over context switches that is.

Thanks,

	Ingo

--===============6742047367815708778==--

