Content-Type: multipart/mixed; boundary="===============3690516130504455292=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [rfcomm_run] WARNING: CPU: 1 PID: 79 at kernel/sched/core.c:7156 __might_sleep()
Date: Sat, 04 Oct 2014 10:42:41 +0200
Message-ID: <20141004084241.GT10583@worktop.programming.kicks-ass.net>
In-Reply-To: <20141003193029.GA24399@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3690516130504455292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 03, 2014 at 09:30:29PM +0200, Oleg Nesterov wrote:
> > Or. perhaps we can change wait_woken
> >
> > 	-	set_current_state(mode);
> > 	+	if (mode)
> > 	+		set_current_state(mode);
> >
> >
> > then rfcomm_run() can do
> >
> > 	for (;;) {
> > 		rfcomm_process_sessions();
> >
> > 		set_current_state(TASK_INTERRUPTIBLE);
> > 		if (kthread_should_stop())
> > 			break;
> > 		wait_woken(0);
> > 	}

> probably this makes more sense in this particular case...

Right, in which case the below needs a different justification, but you
said you were already thinking about it, so there must be something.

And clearly it needs a changelog to begin with :-)

A few nits below.

> --- x/kernel/kthread.c
> +++ x/kernel/kthread.c
> @@ -48,6 +48,7 @@ struct kthread {
>  =

>  enum KTHREAD_BITS {
>  	KTHREAD_IS_PER_CPU =3D 0,
> +	KTHREAD_WANTS_SIGNAL,
>  	KTHREAD_SHOULD_STOP,
>  	KTHREAD_SHOULD_PARK,
>  	KTHREAD_IS_PARKED,
> @@ -442,6 +443,45 @@ int kthread_park(struct task_struct *k)
>  	return ret;
>  }
>  =

> +void set_kthread_wants_signal(bool on)
> +{
> +	struct kthread *kthread =3D to_kthread(current);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&current->sighand->siglock, flags);
> +	if (on) {
> +		set_bit(KTHREAD_WANTS_SIGNAL, &kthread->flags);

All barriers must come with a comment :-)

> +		smp_mb__after_atomic();
> +		if (kthread_should_stop())
> +			set_thread_flag(TIF_SIGPENDING);
> +	} else {
> +		clear_bit(KTHREAD_WANTS_SIGNAL, &kthread->flags);
> +		recalc_sigpending();
> +	}
> +	spin_unlock_irqrestore(&current->sighand->siglock, flags);
> +}
> +
> +static void kthread_kill(struct task_struct *k, struct kthread *kthread)
> +{
> +	smp_mb__before_atomic();

test_bit isn't actually an atomic op so this barrier is 'wrong'. If you
need an MB there smp_mb() it is. Again, comment is missing.

> +	if (test_bit(KTHREAD_WANTS_SIGNAL, &kthread->flags)) {
> +		unsigned long flags;
> +		bool kill =3D true;
> +
> +		if (lock_task_sighand(k, &flags)) {

Since we do the double test thing here, with the set side also done
under the lock, so we really need a barrier above?

> +			kill =3D test_bit(KTHREAD_WANTS_SIGNAL, &kthread->flags);
> +			if (kill)
> +				signal_wake_up(k, 0);
> +			unlock_task_sighand(k, &flags);
> +		}
> +
> +		if (kill)
> +			return;
> +	}
> +
> +	wake_up_process(k);
> +}
> +
>  /**
>   * kthread_stop - stop a thread created by kthread_create().
>   * @k: thread created by kthread_create().
> @@ -469,7 +509,7 @@ int kthread_stop(struct task_struct *k)
>  	if (kthread) {
>  		set_bit(KTHREAD_SHOULD_STOP, &kthread->flags);
>  		__kthread_unpark(k, kthread);
> -		wake_up_process(k);
> +		kthread_kill(k, kthread);
>  		wait_for_completion(&kthread->exited);
>  	}
>  	ret =3D k->exit_code;
>=20

--===============3690516130504455292==--

