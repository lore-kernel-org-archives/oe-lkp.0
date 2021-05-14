Content-Type: multipart/mixed; boundary="===============6176235855434053598=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [entry] 47b8ff194c: will-it-scale.per_process_ops -3.0% regression
Date: Fri, 14 May 2021 12:13:22 +0200
Message-ID: <YJ5NQtTdQm29dO9p@hirez.programming.kicks-ass.net>
In-Reply-To: <20210513231127.GA165500@lothringen>
List-Id: <oe-lkp.lists.linux.dev>

--===============6176235855434053598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 14, 2021 at 01:11:27AM +0200, Frederic Weisbecker wrote:

> That sounds good, but two things:
> =

> 1) Even if context tracking is not running, we still need to handle
>    deferred wakeups on idle. But all user/guest/idle currently use the
>    same function.
> =

> 2) Context tracking may be running even when full nohz is not. But here o=
nly
>    full nohz is concerned.
> =

> So the change should rather be as follows (completely untested!).
> I rather put the static key check in tick.h in order not to involve
> deep dependencies inside rcupdate.h (especially rcupdate.h -> tick.h -> s=
ched.h)

Compiles and boots for me, 0day folks, could you please test this makes
the reported regression go away?

> diff --git a/include/linux/entry-kvm.h b/include/linux/entry-kvm.h
> index 8b2b1d68b954..136b8d97d8c0 100644
> --- a/include/linux/entry-kvm.h
> +++ b/include/linux/entry-kvm.h
> @@ -3,6 +3,7 @@
>  #define __LINUX_ENTRYKVM_H
>  =

>  #include <linux/entry-common.h>
> +#include <linux/tick.h>
>  =

>  /* Transfer to guest mode work */
>  #ifdef CONFIG_KVM_XFER_TO_GUEST_WORK
> @@ -57,7 +58,7 @@ int xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcp=
u);
>  static inline void xfer_to_guest_mode_prepare(void)
>  {
>  	lockdep_assert_irqs_disabled();
> -	rcu_nocb_flush_deferred_wakeup();
> +	tick_nohz_user_enter_prepare();
>  }
>  =

>  /**
> diff --git a/include/linux/tick.h b/include/linux/tick.h
> index 0bb80a7f05b9..bfd571f18cfd 100644
> --- a/include/linux/tick.h
> +++ b/include/linux/tick.h
> @@ -11,6 +11,7 @@
>  #include <linux/context_tracking_state.h>
>  #include <linux/cpumask.h>
>  #include <linux/sched.h>
> +#include <linux/rcupdate.h>
>  =

>  #ifdef CONFIG_GENERIC_CLOCKEVENTS
>  extern void __init tick_init(void);
> @@ -304,4 +305,10 @@ static inline void tick_nohz_task_switch(void)
>  		__tick_nohz_task_switch();
>  }
>  =

> +static inline void tick_nohz_user_enter_prepare(void)
> +{
> +	if (tick_nohz_full_cpu(smp_processor_id()))
> +		rcu_nocb_flush_deferred_wakeup();
> +}
> +
>  #endif
> diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> index a0b3b04fb596..bf16395b9e13 100644
> --- a/kernel/entry/common.c
> +++ b/kernel/entry/common.c
> @@ -5,6 +5,7 @@
>  #include <linux/highmem.h>
>  #include <linux/livepatch.h>
>  #include <linux/audit.h>
> +#include <linux/tick.h>
>  =

>  #include "common.h"
>  =

> @@ -186,7 +187,7 @@ static unsigned long exit_to_user_mode_loop(struct pt=
_regs *regs,
>  		local_irq_disable_exit_to_user();
>  =

>  		/* Check if any of the above work has queued a deferred wakeup */
> -		rcu_nocb_flush_deferred_wakeup();
> +		tick_nohz_user_enter_prepare();
>  =

>  		ti_work =3D READ_ONCE(current_thread_info()->flags);
>  	}
> @@ -202,7 +203,7 @@ static void exit_to_user_mode_prepare(struct pt_regs =
*regs)
>  	lockdep_assert_irqs_disabled();
>  =

>  	/* Flush pending rcuog wakeup before the last need_resched() check */
> -	rcu_nocb_flush_deferred_wakeup();
> +	tick_nohz_user_enter_prepare();
>  =

>  	if (unlikely(ti_work & EXIT_TO_USER_MODE_WORK))
>  		ti_work =3D exit_to_user_mode_loop(regs, ti_work);
--===============6176235855434053598==--

