Content-Type: multipart/mixed; boundary="===============4318105646258608261=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/mm] 94b1b03b51: hackbench.throughput -20% regression
Date: Mon, 24 Jul 2017 11:18:06 +0200
Message-ID: <20170724091806.zz4divwfmnl4ocqd@hirez.programming.kicks-ass.net>
In-Reply-To: <20170724090933.55en4gdbvokxh5lt@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4318105646258608261==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2017 at 11:09:33AM +0200, Ingo Molnar wrote:
> =

> * Andy Lutomirski <luto@kernel.org> wrote:
> =

> > AFAICT this is a regression running hackbench with 56 * 40 threads on
> > 112 CPUs.  The performance numbers are odd -- it looks like only 10
> > CPUs worth of work are happening, so the system is 90% or so idle.
> > I'm not sure why.
> > =

> > I suspect this is hitting the nasty case that Rik thought of: on
> > transition to and from idle, we're doing cpumask_clear() and
> > cpumask_set() respecitvely on a per-mm bitmask, causing false sharing.
> > This is merely a worsening of an existing problem that we do mmgrab()
> > and mmdrop() in the scheduler to keep track of the reference counts.
> > IOW our performance is generally awful on NUMA or other big systems
> > with mms with many threads on many CPUs that are constantly going idle
> > and un-idle.
> > =

> > Do we care for the purpose of the PCID series?  This is a bit of a
> > weird corner case.
> =

> By historical track record I'd take hackbench regressions with a grain of=
 salt =

> (it's a very timing sensitive benchmark and it's also very noisy), unless=
 you can =

> reproduce it locally and robustly.

The 'thread mode' numbers are actually fairly stable, and this is what
0-day uses. We've fixed a bunch of these recently, see for example:

  1ad3aaf3fcd2 ("sched/core: Implement new approach to scale select_idle_cp=
u()")

And that fixed real workload visible regressions as well.

But yes, hackbench is a bit of a weird thing, but most times it ends up
someone somewhere gets hurt if we break it.

--===============4318105646258608261==--

