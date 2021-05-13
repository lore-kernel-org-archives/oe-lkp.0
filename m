Content-Type: multipart/mixed; boundary="===============3546335420702085810=="
MIME-Version: 1.0
From: Frederic Weisbecker <frederic@kernel.org>
To: lkp@lists.01.org
Subject: Re: [entry] 47b8ff194c: will-it-scale.per_process_ops -3.0% regression
Date: Fri, 14 May 2021 01:11:27 +0200
Message-ID: <20210513231127.GA165500@lothringen>
In-Reply-To: <20210513174636.GB975577@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============3546335420702085810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 10:46:36AM -0700, Paul E. McKenney wrote:
> On Thu, May 13, 2021 at 10:19:21AM +0200, Peter Zijlstra wrote:
> > On Wed, Apr 28, 2021 at 03:16:53PM +0800, kernel test robot wrote:
> > > =

> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed a -3.0% regression of will-it-scale.per_process_ops d=
ue to commit:
> > > =

> > > =

> > > commit: 47b8ff194c1fd73d58dc339b597d466fe48c8958 ("entry: Explicitly =
flush pending rcuog wakeup before last rescheduling point")
> > =

> > So the RCU bits are in rcu_user_enter(), which is called from
> > __context_tracking_enter() aka user_enter(), which is under
> > context_tracking_enabled().
> > =

> > But the new code in entry is not; we now unconditionally call
> > rcu_nocb_flush_deferred_wakeup(). Did that want to be under
> > context_tracking_enabled() as well?
> > =

> > Frederic, Paul?
> =

> My argument in favor of the change below is that if there is no context
> tracking, then scheduling-clock interrupts will happen on all non-idle
> CPUs.  The next scheduling-clock interrupt will check this deferred-wakeup
> state, and if set, cause rcu_core() to be invoked (for example, within the
> RCU_SOFTIRQ handler).  And rcu_core() invokes do_nocb_deferred_wakeup(),
> which takes care of this.
> =

> For idle CPUs, do_idle() invokes rcu_nocb_flush_deferred_wakeup().
> =

> Frederic, any cases that I am missing?

That sounds good, but two things:

1) Even if context tracking is not running, we still need to handle
   deferred wakeups on idle. But all user/guest/idle currently use the
   same function.

2) Context tracking may be running even when full nohz is not. But here only
   full nohz is concerned.

So the change should rather be as follows (completely untested!).
I rather put the static key check in tick.h in order not to involve
deep dependencies inside rcupdate.h (especially rcupdate.h -> tick.h -> sch=
ed.h)

diff --git a/include/linux/entry-kvm.h b/include/linux/entry-kvm.h
index 8b2b1d68b954..136b8d97d8c0 100644
--- a/include/linux/entry-kvm.h
+++ b/include/linux/entry-kvm.h
@@ -3,6 +3,7 @@
 #define __LINUX_ENTRYKVM_H
 =

 #include <linux/entry-common.h>
+#include <linux/tick.h>
 =

 /* Transfer to guest mode work */
 #ifdef CONFIG_KVM_XFER_TO_GUEST_WORK
@@ -57,7 +58,7 @@ int xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu);
 static inline void xfer_to_guest_mode_prepare(void)
 {
 	lockdep_assert_irqs_disabled();
-	rcu_nocb_flush_deferred_wakeup();
+	tick_nohz_user_enter_prepare();
 }
 =

 /**
diff --git a/include/linux/tick.h b/include/linux/tick.h
index 0bb80a7f05b9..bfd571f18cfd 100644
--- a/include/linux/tick.h
+++ b/include/linux/tick.h
@@ -11,6 +11,7 @@
 #include <linux/context_tracking_state.h>
 #include <linux/cpumask.h>
 #include <linux/sched.h>
+#include <linux/rcupdate.h>
 =

 #ifdef CONFIG_GENERIC_CLOCKEVENTS
 extern void __init tick_init(void);
@@ -304,4 +305,10 @@ static inline void tick_nohz_task_switch(void)
 		__tick_nohz_task_switch();
 }
 =

+static inline void tick_nohz_user_enter_prepare(void)
+{
+	if (tick_nohz_full_cpu(smp_processor_id()))
+		rcu_nocb_flush_deferred_wakeup();
+}
+
 #endif
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index a0b3b04fb596..bf16395b9e13 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -5,6 +5,7 @@
 #include <linux/highmem.h>
 #include <linux/livepatch.h>
 #include <linux/audit.h>
+#include <linux/tick.h>
 =

 #include "common.h"
 =

@@ -186,7 +187,7 @@ static unsigned long exit_to_user_mode_loop(struct pt_r=
egs *regs,
 		local_irq_disable_exit_to_user();
 =

 		/* Check if any of the above work has queued a deferred wakeup */
-		rcu_nocb_flush_deferred_wakeup();
+		tick_nohz_user_enter_prepare();
 =

 		ti_work =3D READ_ONCE(current_thread_info()->flags);
 	}
@@ -202,7 +203,7 @@ static void exit_to_user_mode_prepare(struct pt_regs *r=
egs)
 	lockdep_assert_irqs_disabled();
 =

 	/* Flush pending rcuog wakeup before the last need_resched() check */
-	rcu_nocb_flush_deferred_wakeup();
+	tick_nohz_user_enter_prepare();
 =

 	if (unlikely(ti_work & EXIT_TO_USER_MODE_WORK))
 		ti_work =3D exit_to_user_mode_loop(regs, ti_work);
--===============3546335420702085810==--

