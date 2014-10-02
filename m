Content-Type: multipart/mixed; boundary="===============1601536282522514823=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: [rfcomm_run] WARNING: CPU: 1 PID: 79 at kernel/sched/core.c:7156 __might_sleep()
Date: Thu, 02 Oct 2014 21:18:46 +0200
Message-ID: <20141002191846.GB30606@redhat.com>
In-Reply-To: <20141002165739.GC10583@worktop.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============1601536282522514823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ah, somehow I missed this email, I already replied to the previous one.

On 10/02, Peter Zijlstra wrote:
>
> In any case, if we change wait_woken() like the below, then we can
> simplify the loops by taking out their signal_pending checks and using
> the wait_woken() return value instead.

Yes, but let me repeat,

> +++ b/kernel/sched/wait.c
> @@ -326,8 +326,14 @@ long wait_woken(wait_queue_t *wait, unsi
>  	 * woken_wake_function() such that if we observe WQ_FLAG_WOKEN we must
>  	 * also observe all state before the wakeup.
>  	 */
> -	if (!(wait->flags & WQ_FLAG_WOKEN))
> -		timeout =3D schedule_timeout(timeout);
> +	if (!(wait->flags & WQ_FLAG_WOKEN)) {
> +		if (___wait_is_interruptible(mode)) {

___wait_is_interruptible() is pointless, signal_pending_state() does
the same checks. Not to mention it will always return T in this case,
note that __builtin_constant_p(state) =3D=3D F.


> +		       if (signal_pending_state(mode, current))
> +			       timeout =3D -ERESTARTSYS;

OK, but unless I missed something this looks overcomplicated. You can
simply do this at the start of wait_woken(). Not need to play with
current->state, no need to clear WQ_FLAG_WOKEN.

Oleg.


--===============1601536282522514823==--

