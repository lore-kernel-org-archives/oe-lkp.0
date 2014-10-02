Content-Type: multipart/mixed; boundary="===============4589476264610509663=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [rfcomm_run] WARNING: CPU: 1 PID: 79 at kernel/sched/core.c:7156 __might_sleep()
Date: Thu, 02 Oct 2014 14:42:47 +0200
Message-ID: <20141002124247.GD6324@worktop.programming.kicks-ass.net>
In-Reply-To: <20141002123150.GC6324@worktop.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4589476264610509663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 02, 2014 at 02:31:50PM +0200, Peter Zijlstra wrote:
> @@ -2086,24 +2086,22 @@ static void rfcomm_kill_listener(void)
>  =

>  static int rfcomm_run(void *unused)
>  {
> +	DEFINE_WAIT_FUNC(wait, woken_wake_function);
>  	BT_DBG("");
>  =

>  	set_user_nice(current, -10);
>  =

>  	rfcomm_add_listener(BDADDR_ANY);
>  =

> -	while (1) {
> -		set_current_state(TASK_INTERRUPTIBLE);
> -
> -		if (kthread_should_stop())
> -			break;
> +	add_wait_queue(&rfcomm_wq, &wait);
> +	while (!kthread_should_stop()) {
>  =

>  		/* Process stuff */
>  		rfcomm_process_sessions();
>  =

> -		schedule();
> +		wait_woken(&wait, TASK_INTERRUPTIBLE, MAX_SCHEDULE_TIMEOUT);
>  	}
> -	__set_current_state(TASK_RUNNING);
> +	remove_wait_queue(&rfcomm_wq, &wait);
>  =

>  	rfcomm_kill_listener();
>  =


Hmm, I think there's a problem there. If someone were to do
kthread_stop() before wait_woken() we'd not actually stop, because
wait_woken() doesn't test KTHREAD_SHOULD_STOP before calling schedule().

We can't unconditionally put a kthread_should_stop() in because
to_kthread() would explode on a !kthread. The other obvious solution is
adding a second function, something like wait_woken_or_stop(), but that
appears somewhat ugly to me.

Oleg, do you see another solution?

--===============4589476264610509663==--

