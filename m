Content-Type: multipart/mixed; boundary="===============3509952764570126408=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [rfcomm_run] WARNING: CPU: 1 PID: 79 at kernel/sched/core.c:7156 __might_sleep()
Date: Thu, 02 Oct 2014 15:52:50 +0200
Message-ID: <20141002135250.GB10583@worktop.programming.kicks-ass.net>
In-Reply-To: <542D57D0.4030904@hurleysoftware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3509952764570126408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 02, 2014 at 09:49:04AM -0400, Peter Hurley wrote:
> On 10/02/2014 08:42 AM, Peter Zijlstra wrote:
> > On Thu, Oct 02, 2014 at 02:31:50PM +0200, Peter Zijlstra wrote:
> >> @@ -2086,24 +2086,22 @@ static void rfcomm_kill_listener(void)
> >>  =

> >>  static int rfcomm_run(void *unused)
> >>  {
> >> +	DEFINE_WAIT_FUNC(wait, woken_wake_function);
> >>  	BT_DBG("");
> >>  =

> >>  	set_user_nice(current, -10);
> >>  =

> >>  	rfcomm_add_listener(BDADDR_ANY);
> >>  =

> >> -	while (1) {
> >> -		set_current_state(TASK_INTERRUPTIBLE);
> >> -
> >> -		if (kthread_should_stop())
> >> -			break;
> >> +	add_wait_queue(&rfcomm_wq, &wait);
> >> +	while (!kthread_should_stop()) {
> >>  =

> >>  		/* Process stuff */
> >>  		rfcomm_process_sessions();
> >>  =

> >> -		schedule();
> >> +		wait_woken(&wait, TASK_INTERRUPTIBLE, MAX_SCHEDULE_TIMEOUT);
> >>  	}
> >> -	__set_current_state(TASK_RUNNING);
> >> +	remove_wait_queue(&rfcomm_wq, &wait);
> >>  =

> >>  	rfcomm_kill_listener();
> >>  =

> > =

> > Hmm, I think there's a problem there. If someone were to do
> > kthread_stop() before wait_woken() we'd not actually stop, because
> > wait_woken() doesn't test KTHREAD_SHOULD_STOP before calling schedule().
> =

> Do you mean this situation?
> =

> CPU 0                                    | CPU 1
>                                          |
> rfcomm_run()                             | kthread_stop()
>   ...                                    |
>   if (!test_bit(KTHREAD_SHOULD_STOP))    |
>                                          |   set_bit(KTHREAD_SHOULD_STOP)
>                                          |   wake_up_process()
>     wait_woken()                         |   wait_for_completion()
>       set_current_state(INTERRUPTIBLE)   |
>       if (!WQ_FLAG_WOKEN)                |
>         schedule_timeout()               |
>                                          |
> =

> Now both tasks are sleeping forever.

Yep.

> If yes, then wakeups from signals don't work either, right?

Its a kthread, there should not be any signals.

--===============3509952764570126408==--

