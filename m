Content-Type: multipart/mixed; boundary="===============8360329354714576500=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [locking/ww_mutex] 2a0c112828 WARNING: CPU: 0 PID: 18 at kernel/locking/mutex.c:305 __ww_mutex_wakeup_for_backoff
Date: Wed, 01 Mar 2017 16:51:36 +0100
Message-ID: <20170301155136.GM6515@twins.programming.kicks-ass.net>
In-Reply-To: <20170301154043.hcsbpgooc3kqt45j@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8360329354714576500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 01, 2017 at 11:40:43PM +0800, Fengguang Wu wrote:
> Thanks for the patch! I applied the patch on top of "locking/ww_mutex:
> Add kselftests for ww_mutex stress", and find no "bad unlock balance
> detected" but this warning. Attached is the new dmesg which is a bit
> large due to lots of repeated errors.
> =

> [    9.105427] Freeing initrd memory: 24852K
> [    9.121306] The force parameter has not been set to 1. The Iris powero=
ff handler will not be installed.
> [    9.141216] NatSemi SCx200 Driver
> [    9.724519] ------------[ cut here ]------------
> [    9.726795] WARNING: CPU: 0 PID: 22 at kernel/locking/mutex.c:305 __ww=
_mutex_wakeup_for_backoff+0x31/0x7a
> [    9.738281] CPU: 0 PID: 22 Comm: kworker/u2:1 Not tainted 4.10.0-rc3-0=
0156-g7d81c50 #1
> [    9.741977] Workqueue: test-ww_mutex test_cycle_work
> [    9.745524] Call Trace:
> [    9.747610]  dump_stack+0x16/0x18
> [    9.754619]  __warn+0xa0/0xb7
> [    9.757553]  ? __ww_mutex_wakeup_for_backoff+0x31/0x7a
> [    9.760881]  warn_slowpath_null+0x11/0x16
> [    9.765222]  __ww_mutex_wakeup_for_backoff+0x31/0x7a
> [    9.768028]  __ww_mutex_lock+0x2f3/0xb63
> [    9.770979]  ? wake_up_q+0x25/0x40
> [    9.773044]  ? __might_sleep+0x6c/0x73
> [    9.774890]  ww_mutex_lock+0x34/0x3b
> [    9.776001]  ? test_cycle_work+0xf7/0x170
> [    9.777751]  test_cycle_work+0xf7/0x170
> [    9.779036]  process_one_work+0x1c0/0x33a
> [    9.780664]  ? process_one_work+0x168/0x33a
> [    9.788924]  worker_thread+0x22f/0x315
> [    9.791016]  kthread+0xed/0xf2
> [    9.793255]  ? process_scheduled_works+0x24/0x24
> [    9.795475]  ? __kthread_create_on_node+0x11f/0x11f
> [    9.798741]  ? __kthread_create_on_node+0x11f/0x11f
> [    9.802371]  ret_from_fork+0x19/0x30
> [    9.804430] ---[ end trace 9036bbb174aed804 ]---

Do you have the below patch in?

---
commit b9c16a0e1f733c97e48798b2a9362c485bb3b731
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Tue Jan 17 16:06:09 2017 +0100

    locking/mutex: Fix lockdep_assert_held() fail
    =

    In commit:
    =

      659cf9f5824a ("locking/ww_mutex: Optimize ww-mutexes by waking at mos=
t one waiter for backoff when acquiring the lock")
    =

    I replaced a comment with a lockdep_assert_held(). However it turns out
    we hide that lock from lockdep for hysterical raisins, which results
    in the assertion always firing.
    =

    Remove the old debug code as lockdep will easily spot the abuse it was
    meant to catch, which will make the lock visible to lockdep and make
    the assertion work as intended.
    =

    Reported-by: Mike Galbraith <efault@gmx.de>
    Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
    Cc: Linus Torvalds <torvalds@linux-foundation.org>
    Cc: Nicolai Haehnle <Nicolai.Haehnle@amd.com>
    Cc: Peter Zijlstra <peterz@infradead.org>
    Cc: Thomas Gleixner <tglx@linutronix.de>
    Fixes: 659cf9f5824a ("locking/ww_mutex: Optimize ww-mutexes by waking a=
t most one waiter for backoff when acquiring the lock")
    Link: http://lkml.kernel.org/r/20170117150609.GB32474(a)worktop
    Signed-off-by: Ingo Molnar <mingo@kernel.org>

diff --git a/kernel/locking/mutex-debug.h b/kernel/locking/mutex-debug.h
index a459faa48987..4174417d5309 100644
--- a/kernel/locking/mutex-debug.h
+++ b/kernel/locking/mutex-debug.h
@@ -26,20 +26,3 @@ extern void mutex_remove_waiter(struct mutex *lock, stru=
ct mutex_waiter *waiter,
 extern void debug_mutex_unlock(struct mutex *lock);
 extern void debug_mutex_init(struct mutex *lock, const char *name,
 			     struct lock_class_key *key);
-
-#define spin_lock_mutex(lock, flags)			\
-	do {						\
-		struct mutex *l =3D container_of(lock, struct mutex, wait_lock); \
-							\
-		DEBUG_LOCKS_WARN_ON(in_interrupt());	\
-		local_irq_save(flags);			\
-		arch_spin_lock(&(lock)->rlock.raw_lock);\
-		DEBUG_LOCKS_WARN_ON(l->magic !=3D l);	\
-	} while (0)
-
-#define spin_unlock_mutex(lock, flags)				\
-	do {							\
-		arch_spin_unlock(&(lock)->rlock.raw_lock);	\
-		local_irq_restore(flags);			\
-		preempt_check_resched();			\
-	} while (0)
diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index 935116723a3d..705e06fe5e6c 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -325,8 +325,6 @@ __ww_mutex_wakeup_for_backoff(struct mutex *lock, struc=
t ww_acquire_ctx *ww_ctx)
 static __always_inline void
 ww_mutex_set_context_fastpath(struct ww_mutex *lock, struct ww_acquire_ctx=
 *ctx)
 {
-	unsigned long flags;
-
 	ww_mutex_lock_acquired(lock, ctx);
 =

 	lock->ctx =3D ctx;
@@ -350,9 +348,9 @@ ww_mutex_set_context_fastpath(struct ww_mutex *lock, st=
ruct ww_acquire_ctx *ctx)
 	 * Uh oh, we raced in fastpath, wake up everyone in this case,
 	 * so they can see the new lock->ctx.
 	 */
-	spin_lock_mutex(&lock->base.wait_lock, flags);
+	spin_lock(&lock->base.wait_lock);
 	__ww_mutex_wakeup_for_backoff(&lock->base, ctx);
-	spin_unlock_mutex(&lock->base.wait_lock, flags);
+	spin_unlock(&lock->base.wait_lock);
 }
 =

 /*
@@ -740,7 +738,6 @@ __mutex_lock_common(struct mutex *lock, long state, uns=
igned int subclass,
 		    struct ww_acquire_ctx *ww_ctx, const bool use_ww_ctx)
 {
 	struct mutex_waiter waiter;
-	unsigned long flags;
 	bool first =3D false;
 	struct ww_mutex *ww;
 	int ret;
@@ -766,7 +763,7 @@ __mutex_lock_common(struct mutex *lock, long state, uns=
igned int subclass,
 		return 0;
 	}
 =

-	spin_lock_mutex(&lock->wait_lock, flags);
+	spin_lock(&lock->wait_lock);
 	/*
 	 * After waiting to acquire the wait_lock, try again.
 	 */
@@ -830,7 +827,7 @@ __mutex_lock_common(struct mutex *lock, long state, uns=
igned int subclass,
 				goto err;
 		}
 =

-		spin_unlock_mutex(&lock->wait_lock, flags);
+		spin_unlock(&lock->wait_lock);
 		schedule_preempt_disabled();
 =

 		/*
@@ -853,9 +850,9 @@ __mutex_lock_common(struct mutex *lock, long state, uns=
igned int subclass,
 		    (first && mutex_optimistic_spin(lock, ww_ctx, use_ww_ctx, &waiter)))
 			break;
 =

-		spin_lock_mutex(&lock->wait_lock, flags);
+		spin_lock(&lock->wait_lock);
 	}
-	spin_lock_mutex(&lock->wait_lock, flags);
+	spin_lock(&lock->wait_lock);
 acquired:
 	__set_current_state(TASK_RUNNING);
 =

@@ -872,7 +869,7 @@ __mutex_lock_common(struct mutex *lock, long state, uns=
igned int subclass,
 	if (use_ww_ctx && ww_ctx)
 		ww_mutex_set_context_slowpath(ww, ww_ctx);
 =

-	spin_unlock_mutex(&lock->wait_lock, flags);
+	spin_unlock(&lock->wait_lock);
 	preempt_enable();
 	return 0;
 =

@@ -880,7 +877,7 @@ __mutex_lock_common(struct mutex *lock, long state, uns=
igned int subclass,
 	__set_current_state(TASK_RUNNING);
 	mutex_remove_waiter(lock, &waiter, current);
 err_early_backoff:
-	spin_unlock_mutex(&lock->wait_lock, flags);
+	spin_unlock(&lock->wait_lock);
 	debug_mutex_free_waiter(&waiter);
 	mutex_release(&lock->dep_map, 1, ip);
 	preempt_enable();
@@ -999,8 +996,8 @@ EXPORT_SYMBOL_GPL(ww_mutex_lock_interruptible);
 static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, u=
nsigned long ip)
 {
 	struct task_struct *next =3D NULL;
-	unsigned long owner, flags;
 	DEFINE_WAKE_Q(wake_q);
+	unsigned long owner;
 =

 	mutex_release(&lock->dep_map, 1, ip);
 =

@@ -1035,7 +1032,7 @@ static noinline void __sched __mutex_unlock_slowpath(=
struct mutex *lock, unsigne
 		owner =3D old;
 	}
 =

-	spin_lock_mutex(&lock->wait_lock, flags);
+	spin_lock(&lock->wait_lock);
 	debug_mutex_unlock(lock);
 	if (!list_empty(&lock->wait_list)) {
 		/* get the first entry from the wait-list: */
@@ -1052,7 +1049,7 @@ static noinline void __sched __mutex_unlock_slowpath(=
struct mutex *lock, unsigne
 	if (owner & MUTEX_FLAG_HANDOFF)
 		__mutex_handoff(lock, next);
 =

-	spin_unlock_mutex(&lock->wait_lock, flags);
+	spin_unlock(&lock->wait_lock);
 =

 	wake_up_q(&wake_q);
 }
diff --git a/kernel/locking/mutex.h b/kernel/locking/mutex.h
index 4410a4af42a3..6ebc1902f779 100644
--- a/kernel/locking/mutex.h
+++ b/kernel/locking/mutex.h
@@ -9,10 +9,6 @@
  * !CONFIG_DEBUG_MUTEXES case. Most of them are NOPs:
  */
 =

-#define spin_lock_mutex(lock, flags) \
-		do { spin_lock(lock); (void)(flags); } while (0)
-#define spin_unlock_mutex(lock, flags) \
-		do { spin_unlock(lock); (void)(flags); } while (0)
 #define mutex_remove_waiter(lock, waiter, task) \
 		__list_del((waiter)->list.prev, (waiter)->list.next)
=20

--===============8360329354714576500==--

