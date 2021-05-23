Content-Type: multipart/mixed; boundary="===============8372694955355172079=="
MIME-Version: 1.0
From: Frederic Weisbecker <frederic@kernel.org>
To: lkp@lists.01.org
Subject: Re: [entry] 47b8ff194c: will-it-scale.per_process_ops -3.0% regression
Date: Sun, 23 May 2021 15:26:39 +0200
Message-ID: <20210523132639.GB173496@lothringen>
In-Reply-To: <20210519052700.GC29704@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8372694955355172079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 01:27:00PM +0800, Oliver Sang wrote:
> hi, Peter Zijlstra,
> =

> On Fri, May 14, 2021 at 12:13:22PM +0200, Peter Zijlstra wrote:
> > On Fri, May 14, 2021 at 01:11:27AM +0200, Frederic Weisbecker wrote:
> > =

> > > That sounds good, but two things:
> > > =

> > > 1) Even if context tracking is not running, we still need to handle
> > >    deferred wakeups on idle. But all user/guest/idle currently use the
> > >    same function.
> > > =

> > > 2) Context tracking may be running even when full nohz is not. But he=
re only
> > >    full nohz is concerned.
> > > =

> > > So the change should rather be as follows (completely untested!).
> > > I rather put the static key check in tick.h in order not to involve
> > > deep dependencies inside rcupdate.h (especially rcupdate.h -> tick.h =
-> sched.h)
> > =

> > Compiles and boots for me, 0day folks, could you please test this makes
> > the reported regression go away?
> =

> sorry for late.
> =

> on which base should we apply below patch?
> we tried to apply upon 4ae7dc97f726e ("entry/kvm: Explicitly flush pendin=
g rcuog
> wakeup before last rescheduling point") and v5.12, but both build failed =
like below:
> =

> ERROR: modpost: "tick_nohz_full_mask" [arch/x86/kvm/kvm.ko] undefined!
> =

> or is there any particular kconfig need to enable?
> (the kconfig which we used to build 47b8ff194c is in original report
> which maybe you could help have a look what we may miss)

Ah indeed I need to export tick_nohz_full_mask. Too bad but that's the fate
of many cpu masks anyway. Can you try the following patch instead? It boots
and seem to behave:

---
From: Frederic Weisbecker <frederic@kernel.org>
Date: Sun, 23 May 2021 14:23:30 +0200
Subject: [PATCH] tick/nohz: Only check for RCU deferred wakeup on user/guest
 entry when needed

Checking for and processing RCU-nocb deferred wakeup upon user/guest
entry is only relevant when nohz_full runs on the local CPU, otherwise
the periodic tick should take care of it.

Make sure we don't needlessly pollute these fast-paths.

Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/entry-kvm.h | 3 ++-
 include/linux/tick.h      | 7 +++++++
 kernel/entry/common.c     | 5 +++--
 kernel/time/tick-sched.c  | 1 +
 4 files changed, 13 insertions(+), 3 deletions(-)

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
index 7340613c7eff..1a0ff88fa107 100644
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
@@ -300,4 +301,10 @@ static inline void tick_nohz_task_switch(void)
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
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index 828b091501ca..6784f27a3099 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -230,6 +230,7 @@ static void tick_sched_handle(struct tick_sched *ts, st=
ruct pt_regs *regs)
 =

 #ifdef CONFIG_NO_HZ_FULL
 cpumask_var_t tick_nohz_full_mask;
+EXPORT_SYMBOL_GPL(tick_nohz_full_mask);
 bool tick_nohz_full_running;
 EXPORT_SYMBOL_GPL(tick_nohz_full_running);
 static atomic_t tick_dep_mask;
-- =

2.25.1

--===============8372694955355172079==--

