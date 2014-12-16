Content-Type: multipart/mixed; boundary="===============6172923513669036498=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [nohz] 2a16fc93d2c: kernel lockup on idle injection
Date: Tue, 16 Dec 2014 23:54:51 +0100
Message-ID: <alpine.DEB.2.11.1412162350110.17382@nanos>
In-Reply-To: <20141216224903.GS3219@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============6172923513669036498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 16 Dec 2014, Peter Zijlstra wrote:
> On Tue, Dec 16, 2014 at 10:21:27PM +0100, Thomas Gleixner wrote:
> > /* rq->lock is held for evaluating rq->nr_running */
> > static void sched_ttwu_remote_nohz(struct rq *rq)
> > {
> > 	if (nohz_full_disabled())
> > 		return;
> > =

> > 	if (rq->nr_running !=3D 2)
> > 	   	return;
> > 	/*
> > 	 * Force smp_send_reschedule(). irq_exit() on the
> > 	 * remote cpu will handle the rest.
> > 	 */
> =

> smp_send_reschedule() is magic and does not guarantee irq_{enter,exit}()
> being called, although we could audit and fix that.

I know. I did not want to do all the work for the nohz
folks. Otherwise I would have simply sent a patch. :)
 =

> > 	if (!task_uses_posix_timers(task))
> > 		clear_bit(NOHZ_POSIXTIMER_NEEDS_TICK,
> > 			  this_cpu_ptr(nohz_full_must_tick));
> > 	else
> > 		set_bit(NOHZ_POSIXTIMER_NEEDS_TICK,
> > 			this_cpu_ptr(nohz_full_must_tick));
> > =

> =

> /me hands you a few spare {} :-)

Without the proper instruction manual they are pretty useless.
 =

> Arguably test state before doing a possibly pointless update?
> =

> > 	local_irq_disable();
> > 	tick_full_nohz_update_state();
> > 	local_irq_enable();
> > }
> =

> But yes, that should work just fine..

So I'm not the only one who thinks that this needs a proper
reimplementation :)

Thanks,

	tglx


--===============6172923513669036498==--

