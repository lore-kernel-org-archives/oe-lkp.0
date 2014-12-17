Content-Type: multipart/mixed; boundary="===============5963383815692188822=="
MIME-Version: 1.0
From: Frederic Weisbecker <fweisbec@gmail.com>
To: lkp@lists.01.org
Subject: Re: [nohz] 2a16fc93d2c: kernel lockup on idle injection
Date: Wed, 17 Dec 2014 01:12:23 +0100
Message-ID: <20141217001219.GA19459@lerouge>
In-Reply-To: <alpine.DEB.2.11.1412161802570.17382@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============5963383815692188822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2014 at 10:21:27PM +0100, Thomas Gleixner wrote:
> Now lets look at the call site of tick_nohz_task_switch(). That's
> invoked at the end of finish_task_switch(). Looking at one of the
> worst case call chains here:
> =

> finish_task_switch()
>   tick_nohz_task_switch()
>     __tick_nohz_task_switch()
>         tick_nohz_tick_stopped()
> 	can_stop_full_tick()
> 	  sched_can_stop_tick()
> 	  posix_cpu_timers_can_stop_tick()
> 	  perf_event_can_stop_tick()
> 	tick_nohz_full_kick()
> 	  tick_nohz_full_kick()
> 	    irq_work_queue()
> 	      arch_irq_work_raise()
> =

> And then you take the self ipi and do:
> =

>     irq_work_run()
> 	can_stop_full_tick()
> 	  sched_can_stop_tick()
> 	  posix_cpu_timers_can_stop_tick()
> 	  perf_event_can_stop_tick()
> 	tick_nohz_restart_sched_tick();
> =

> and right after that:
> =

>     irq_exit()
>       tick_nohz_full_stop_tick()
> 	can_stop_full_tick()
> 	  sched_can_stop_tick()
> 	  posix_cpu_timers_can_stop_tick()
> 	  perf_event_can_stop_tick()
> =

> What a trainwreck in the scheduler hotpath!
> =

> So you have three states which can change the nohzfull state:
> =

>  1)  rq->nr_running > 1
>  2)  current->uses_posix_timer
>  3)  perf needing the tick
> =

> So instead of evaluating the whole nonsense a gazillion times in a row
> and firing pointless self ipis why are you not looking at the obvious
> solution of sane state change tracking?

Because I had to do it wrong first before somebody like you with a fresh mi=
nd
comes, look at the whole picture and propose a rethink :-)

> =

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
> 	set_bit(NOHZ_SCHED_NEEDS_TICK, per_cpu_ptr(nohz_full_must_tick, rq->cpu);
> 	rq->force_send_resched =3D true;
> }
> =

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

> 	local_irq_disable();
> 	tick_full_nohz_update_state();
> 	local_irq_enable();
> }

Yeah, checking/toggling the nohz full pre-requirement synchronously
indeed looks like a very good idea!

> =

> /* interrupts are disabled */
> void tick_full_nohz_update_state(void)
> {
>         struct tick_sched *ts =3D this_cpu_ptr(&tick_cpu_sched);
> =

> 	if (this_cpu_read(nohz_full_must_tick)) {
> 	   	if (ts->infullnohz)
> 			tick_full_nohz_exit();
> 	} else {
> 	        if (!ts->infullnohz)
> 			tick_full_nohz_enter();
> 	   	else
> 			__tick_full_nohz_enter();

Ah and doing both stop and restart from irq exit is something I have indeed
planned on trying for a while. That indeed leaves the need for a specific I=
PI.
And that can even be done in a standalone change (with the rest of your pro=
posal
incrementally).

Just lack of time, there are tons of things to do and I'm alone working on =
this.

> 	}
> }
> =

> So the irq_exit() path becomes:
> =

> /* interrupts are disabled */
> void tick_nohz_irq_exit(void)
> {
>         struct tick_sched *ts =3D this_cpu_ptr(&tick_cpu_sched);
> =

>         if (ts->inidle) {
>                 __tick_nohz_idle_enter();
> 		return;
> 	}
> 	if (nohz_full_disabled())
> 		return;
> 	tick_nohz_update_state();
> }
> =

> No self IPI, no irq work, no triple evaluation of the same condition
> chain and proper state tracking of infullnohz inside of the tick code.

Yeah it looks like we can piggyback the scheduler IPI that way since we
restart the tick from irq exit. That looks good.

Probably perf and posix cpu timer still need IPIs when armed, but they are
corner cases.

> =

> Precicely TWO points where the NOHZ internal state gets updated:
> =

>    switch_to() and irq_exit()	  	  =


Yes. Side note: we've been using self IPIs on switch_to() until now when ti=
ck
restart is needed (use of perf or posix cpu timer) because we hold the rq l=
ock
and the task could be under any random locking scenario that could conflict=
 with what's
used in the nohz restart path. Now probably it's fine to restart inline in =
post schedule
(no rq lock) as the nohz path doesn't use mutex or any sleeping lock that c=
ould conflict
with what holds a scheduling in task.

> =

> No conflict between infullnohz and inidle because it's all internal to
> the NOHZ code.
> =

> Simple, isn't it?

Definetly, I'll rework that.

> =

> Now for perf and posix cpu timers I'm sure you'll find equally simple
> solutions which do not add extra update points. switch_to() and
> irq_exit() are enough. It's really not rocket science.
> =

> While at it let me rant about some other things.
> =

>  1) Remote accounting
>  =

>     I really cannot understand why all of you NOHZ enthusiasts
>     just avoid to make that work in the first place as it reduces the
>     problem space significantly.
> =

>     Instead of that you folks come up with broken patches for
>     debugfs/sysfs/sysctl/... to forcefully disable the tick. Sure it's
>     harder to implement remote accounting proper than hacking up some
>     random disable mechanism, but the latter is just utter waste of
>     time and resources.
> =

>     I told all of you from the very beginning that remote accounting
>     is a key mechanism for this, but you keep insisting on hacking
>     around it.

I don't, and I think everybody has understood we are not going to accept
hacks to solve the 1hz issue.

> =

>     If done right, then the whole kick ALL cpus nonsense in posix cpu
>     timers can just go away. You can do the complete posix cpu timer
>     thing from the housekeeper cpu(s) once you have remote accounting
>     implemented.

I guess by remote accounting you're referring to the scheduler_tick()
offloading to housekeeper. Well I totally agree that we should try this
solution, I have agreed with that direction since you proposed it for the
first time.

I just can't duplicate myself so somebody else has to get his hands dirty
(besides the change to make is neither difficult nor huge) or you can
wait for me to handle that task in one year (optimistic schedule), once
I'll be done with cputime cleanups, workqueue and timers affinity, context
tracking cleanups reported by Oleg, nohz reorganization just reported by yo=
u, etc...

Full dynticks is growing into a complicated and not so small anymore projec=
t.
More precisely it can't remain anymore as a one-man project, it could still
be one-man at this stage only if it was an out-of-tree project.

I'm pretty sure you know what this is about to maintain a project with a
(variably) cruel lack of manpower ;-)

> =

>  2) Perf
> =

>     I doubt that the tick_nohz_full_kick() in __perf_event_overflow()
>     is actually necessary when you implement the above scheme.
> =

>     The nr_freq_events kick ALL cpus is horrible as well. This really
>     wants to be restricted on the target cpus and not wholesale global
>     just because it is conveniant.
> =

> Managerial summary:
> =

>  1) Stop fiddling on symptoms. Tackle the root causes
> =

>  2) Stop creating overengineered monstrosities which just create more
>     race conditions and corner cases than actual functionality
> =

>  3) Fix that ASAP before I slap BROKEN on it or get annoyed enough to
>     rip it out completely.

May I remind you that I introduced and now maintain nohz full because you a=
sked
it in the first place. If you wanted a clear and palatable design on the ve=
ry first
go, you should have reviewed it before it got merged in the upstream subsys=
tem you
maintain.

Moreover I'm not the kind of kernel developer who ignores reviews (whether =
pre or
post merge).

So, no point in threatening a dependency to BROKEN or ripping out except pe=
rhaps to
push me out to other projects with more thankful managers.

--===============5963383815692188822==--

