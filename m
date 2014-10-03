Content-Type: multipart/mixed; boundary="===============8021651778381542468=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: [rfcomm_run] WARNING: CPU: 1 PID: 79 at kernel/sched/core.c:7156 __might_sleep()
Date: Fri, 03 Oct 2014 19:56:54 +0200
Message-ID: <20141003175654.GA14952@redhat.com>
In-Reply-To: <20141003115020.GG10583@worktop.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============8021651778381542468==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/03, Peter Zijlstra wrote:
>
> On Thu, Oct 02, 2014 at 10:10:20PM +0200, Oleg Nesterov wrote:
>
> > As for rfcomm_run(), perhaps it can ise it too?
> >
> > 	set_kthread_wants_signal(true);
> >
> > 	add_wait_queue(&rfcomm_wq, &wait);
> > 	for (;;) {
> > 		// This is only possible if kthread_should_stop() =3D=3D T
>
> True because kthreads SIG_IGN everything, right?

Yes,

> > 		if (signal_pending(current))
> > 			break;
> >
> > 		rfcomm_process_sessions();
> > 		wait_woken(TASK_INTERRUPTIBLE);
> > 	}
> >
> > Of course, this assumes that rfcomm_process_sessions() can't do somethi=
ng
> > "really bad" if signal_pending() is true.
>
> So from what I can think of, everything that does an INTERRUPTIBLE sleep
> will 'malfunction' after that, right? Which might be quite a lot
> actually.

Yes.

> > What do you think?
>
> Interesting approach, but somewhat risky I tihnk, due to that
> INTERRUPTIBLE thing.

OK, this is fixable.  rfcomm_run() can do

	add_wait_queue(&rfcomm_wq, &wait);
	while (!kthread_should_stop()) {
		rfcomm_process_sessions();

		set_kthread_wants_signal(true);
		wait_woken(TASK_INTERRUPTIBLE);
		set_kthread_wants_signal(false);
	}
	remove_wait_queue(&rfcomm_wq, &wait);

Or. perhaps we can change wait_woken

	-	set_current_state(mode);
	+	if (mode)
	+		set_current_state(mode);


then rfcomm_run() can do

	for (;;) {
		rfcomm_process_sessions();

		set_current_state(TASK_INTERRUPTIBLE);
		if (kthread_should_stop())
			break;
		wait_woken(0);
	}

Or perhaps we can split wait_woken() into 2 helpers,

	static inline long wait_woken(wq, mode, timeout)
	{
		set_current_state(mode);
		schedule_woken(wq, timeout); // does the rest
	}

to avoid "mode =3D=3D 0" hack; rfcomm_run() should use schedule_woken().

What do you think?

Oleg.


--===============8021651778381542468==--

