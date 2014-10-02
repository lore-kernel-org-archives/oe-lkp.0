Content-Type: multipart/mixed; boundary="===============4269120244990652640=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [rfcomm_run] WARNING: CPU: 1 PID: 79 at kernel/sched/core.c:7156 __might_sleep()
Date: Thu, 02 Oct 2014 21:57:27 +0200
Message-ID: <20141002195727.GD10583@worktop.programming.kicks-ass.net>
In-Reply-To: <20141002191114.GA30606@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4269120244990652640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 02, 2014 at 09:11:14PM +0200, Oleg Nesterov wrote:
> On 10/02, Peter Zijlstra wrote:
> >
> > On Thu, Oct 02, 2014 at 03:52:50PM +0200, Peter Zijlstra wrote:
> > > > If yes, then wakeups from signals don't work either, right?
> > >
> > > Its a kthread, there should not be any signals.
> >
> > That said, in the tty patch we do appear to have this problem.
> >
> > Oleg, do we want something like the below on top to make that work
> > again?
> >
> > ---
> > --- a/kernel/sched/wait.c
> > +++ b/kernel/sched/wait.c
> > @@ -326,8 +326,10 @@ long wait_woken(wait_queue_t *wait, unsi
> >  	 * woken_wake_function() such that if we observe WQ_FLAG_WOKEN we must
> >  	 * also observe all state before the wakeup.
> >  	 */
> > -	if (!(wait->flags & WQ_FLAG_WOKEN))
> > -		timeout =3D schedule_timeout(timeout);
> > +	if (!(wait->flags & WQ_FLAG_WOKEN)) {
> > +		if (___wait_is_interruptible(mode) && !signal_pending_state(mode, cu=
rrent))
> > +			timeout =3D schedule_timeout(timeout);
> > +	}
> >  	__set_current_state(TASK_RUNNING);
> =

> I am a bit confused... but for what?
> =

> schedule() won't sleep if signal_pending_state(mode) anyway, so we
> do not need this correctness-wise. And the caller needs to check
> signal_pending() anyway.

Urgh, I always forget how all that signal stuff works. Yes you're right,
we check that right in __schedule().

I'll just make all what I did go away and we'll keep it simple like it
was. Sorry for the confusion.

--===============4269120244990652640==--

