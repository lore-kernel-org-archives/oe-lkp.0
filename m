Content-Type: multipart/mixed; boundary="===============4128332832204264302=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [nohz] 2a16fc93d2c: kernel lockup on idle injection
Date: Tue, 16 Dec 2014 23:49:03 +0100
Message-ID: <20141216224903.GS3219@twins.programming.kicks-ass.net>
In-Reply-To: <alpine.DEB.2.11.1412161802570.17382@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============4128332832204264302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2014 at 10:21:27PM +0100, Thomas Gleixner wrote:
> DEFINE_PER_CPU(nohz_full_must_tick, unsigned long);
> =

> enum {
>      NOHZ_SCHED_NEEDS_TICK,
>      NOHZ_POSIXTIMER_NEEDS_TICK,
>      NOHZ_PERF_NEEEDS_TICK,
> };
> =

> /* rq->lock is held for evaluating rq->nr_running */
> static void sched_ttwu_nohz(struct rq *rq)
> {
> 	if (nohz_full_disabled())
> 		return;
> =

> 	if (rq->nr_running !=3D 2)
> 		return;
> 	set_bit(NOHZ_SCHED_NEEDS_TICK, this_cpu_ptr(nohz_full_must_tick);
> }
> =

> /* rq->lock is held for evaluating rq->nr_running */
> static void sched_ttwu_remote_nohz(struct rq *rq)
> {
> 	if (nohz_full_disabled())
> 		return;
> =

> 	if (rq->nr_running !=3D 2)
> 	   	return;
> 	/*
> 	 * Force smp_send_reschedule(). irq_exit() on the
> 	 * remote cpu will handle the rest.
> 	 */

smp_send_reschedule() is magic and does not guarantee irq_{enter,exit}()
being called, although we could audit and fix that.

> 	set_bit(NOHZ_SCHED_NEEDS_TICK, per_cpu_ptr(nohz_full_must_tick, rq->cpu);
> 	rq->force_send_resched =3D true;
> }

I'd make that force_send_resched the return value or so..

> /* rq->lock is held for evaluating rq->nr_running */
> static void sched_out_nohz(struct rq *rq)
> {
> 	if (nohz_full_disabled())
> 		return;
> =

> 	if (rq->nr_running >=3D 2)
> 	   	return;
> 	clear_bit(NOHZ_SCHED_NEEDS_TICK, this_cpu_ptr(nohz_full_must_tick);
> }
> =

> /* preeemption is disabled */
> static void sched_in_nohz(struct task_struct *task)
> {
> 	if (nohz_full_disabled())
> 		return;
> =

> 	if (!task_uses_posix_timers(task))
> 		clear_bit(NOHZ_POSIXTIMER_NEEDS_TICK,
> 			  this_cpu_ptr(nohz_full_must_tick));
> 	else
> 		set_bit(NOHZ_POSIXTIMER_NEEDS_TICK,
> 			this_cpu_ptr(nohz_full_must_tick));
> =


/me hands you a few spare {} :-)

Arguably test state before doing a possibly pointless update?

> 	local_irq_disable();
> 	tick_full_nohz_update_state();
> 	local_irq_enable();
> }

But yes, that should work just fine..

--===============4128332832204264302==--

