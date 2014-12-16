Content-Type: multipart/mixed; boundary="===============8920218816334981496=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [nohz] 2a16fc93d2c: kernel lockup on idle injection
Date: Tue, 16 Dec 2014 15:50:39 +0100
Message-ID: <alpine.DEB.2.11.1412161533210.17382@nanos>
In-Reply-To: <20141216142029.GA27375@lerouge>
List-Id: <oe-lkp.lists.linux.dev>

--===============8920218816334981496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 16 Dec 2014, Frederic Weisbecker wrote:
> On Tue, Dec 16, 2014 at 01:49:03PM +0100, Thomas Gleixner wrote:
> > And that's where the whole problem starts. The nohz full stuff is
> > trying to evaluate everything dynamically which is just insane.
> > =

> > So we want to have functions which do:
> > =

> >    tick_nohz_full_enter()
> >      ts->infullnohz =3D true;
> >      if (stop_possible)
> >      	stop_tick(ts);
> > =

> >    tick_nohz_full_exit()
> >      ts->infullnohz =3D false;
> >      if (ts->tick_stopped)
> >      	start_tick(ts);
> > =

> > Plus irq_exit would become:     =

> > =

> > irq_exit
> > 	if (ts->inidle)
> > 	   tick_nohz_update_sched_tick();
> > =

> > 	else if (ts->infullnohz)
> > 	   tick_nohz_full_update_sched_tick();
> =

> So I can do that indeed. But then it's going to break the jump label that=
's
> off in 99.99% of the case.

Why so?

> Now I can wrap that into parallel functions:
> =

> irq_exit
> 	if (tick_nohz_idle())
> 	   tick_nohz_update_sched_tick();
> =

> 	else if (tick_nohz_full())
> 	   tick_nohz_full_update_sched_tick();
> =

> Just to be sure I understand you well. By ts->infullnohz, you mean
> the fact that a CPU _wants_ to be in full nohz, not whether it _can_
> right? Whether the CPU wants to be in full nohz is decided in
> boottime with nohz_full=3D parameter.

NO. Whether I read it from ts->infullnohz or from the cpumask is the
same. What I care about is the state change.

In the NOHZ idle case we do not care whether NOHZ=3Dy and nohz=3Don/off on
the kernel command line. All we care about is ts->inidle and we have
very clear points of changing that state. See below.
 =

> Whether it can is dynamically checked on top of scheduler, perf,
> posix cpu timers, etc...

Look at it the same way as idle. We do not care whether the cpu marks
itself as idle at some random place, we care about the internal state
of NOHZ.

>From NOHZ point of view the relevant places are tick_nohz_idle_enter()
and tick_nohz_idle_exit(). We mark that with ts->inidle and we take
care of preparing on enter (evtl. stopping the tick) and cleaning up
on exit (evtl. restarting the tick). And the information that we are
inidle is important in the irq_exit() path. If the NOHZ facility is
NOT inidle then it has nothing to do. You CANNOT rely on asynchronous
state. That simply never works reliably and just leads to band aids
and random state checks all over the place.

Now in the nohz full case, we want proper functions which say:

    this_cpu_enters_nohz_full_now()
and
    this_cpu_exits_nohz_full_now()

So like we do in tick_nohz_idle_enter() and tick_nohz_idle_exit() we
have a clear state change in the nohz code and not something which is
randomly deduced from async state all over the place.

So that only tells the NOHZ core that the rest of the system decided
that the cpu can actually go into full nohz mode. Whether the tick
code disables the tick or not is decided by the tick code.

It's not different from idle.
 =

Thanks,

	tglx

--===============8920218816334981496==--

