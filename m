Content-Type: multipart/mixed; boundary="===============7928237918967009462=="
MIME-Version: 1.0
From: Peter Hurley <peter@hurleysoftware.com>
To: lkp@lists.01.org
Subject: Re: [rfcomm_run] WARNING: CPU: 1 PID: 79 at kernel/sched/core.c:7156 __might_sleep()
Date: Thu, 02 Oct 2014 10:16:27 -0400
Message-ID: <542D5E3B.6000309@hurleysoftware.com>
In-Reply-To: <20141002135805.GF6324@worktop.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============7928237918967009462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/02/2014 09:58 AM, Peter Zijlstra wrote:
> On Thu, Oct 02, 2014 at 03:52:50PM +0200, Peter Zijlstra wrote:
>>> If yes, then wakeups from signals don't work either, right?
>>
>> Its a kthread, there should not be any signals.
> =

> That said, in the tty patch we do appear to have this problem.

That's what I meant. And the module load patch too.

> Oleg, do we want something like the below on top to make that work
> again?
> =

> ---
> --- a/kernel/sched/wait.c
> +++ b/kernel/sched/wait.c
> @@ -326,8 +326,10 @@ long wait_woken(wait_queue_t *wait, unsi
>  	 * woken_wake_function() such that if we observe WQ_FLAG_WOKEN we must
>  	 * also observe all state before the wakeup.
>  	 */
> -	if (!(wait->flags & WQ_FLAG_WOKEN))
> -		timeout =3D schedule_timeout(timeout);
> +	if (!(wait->flags & WQ_FLAG_WOKEN)) {
> +		if (___wait_is_interruptible(mode) && !signal_pending_state(mode, curr=
ent))
> +			timeout =3D schedule_timeout(timeout);
> +	}
>  	__set_current_state(TASK_RUNNING);
>  =

>  	/*
> =



--===============7928237918967009462==--

