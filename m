Content-Type: multipart/mixed; boundary="===============4188465927982554077=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [locking/ww_mutex] 659cf9f582: WARNING: CPU: 0 PID: 0 at kernel/locking/mutex.c:305 __ww_mutex_wakeup_for_backoff
Date: Thu, 26 Jan 2017 11:19:37 +0100
Message-ID: <20170126101937.GY6515@twins.programming.kicks-ass.net>
In-Reply-To: <58896b17.MDWDLAGc0iEWds95%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4188465927982554077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2017 at 11:20:55AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> [    0.000000]                locking mismatches:  ok  |  ok  |  ok  |
> [    0.000000]                  EDEADLK handling:
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] WARNING: CPU: 0 PID: 0 at kernel/locking/mutex.c:305 __ww_=
mutex_wakeup_for_backoff+0x62/0xf4
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 4.10.0-rc3-00143-g=
659cf9f #1
> [    0.000000] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [    0.000000] Call Trace:
> [    0.000000]  dump_stack+0x19/0x27
> [    0.000000]  __warn+0xbf/0xe1
> [    0.000000]  warn_slowpath_null+0x1d/0x2a
> =


(Just to remind you, truncated WARNs are very very annoying, this one
for example doesn't show anything useful in the call trace).


I have the following patch to address this.

---
Subject: locking/mutex: Fix lockdep_assert_held() fail
From: Peter Zijlstra <peterz@infradead.org>
Date: Tue, 17 Jan 2017 16:06:09 +0100

In commit 659cf9f5824a ("locking/ww_mutex: Optimize ww-mutexes by
waking at most one waiter for backoff when acquiring the lock") I
replaced a comment with a lockdep_assert_held(). However it turns out
we hide that lock from lockdep for hysterical raisins, which results
in the assertion always firing.

Remove the old debug code as lockdep will easily spot the abuse it was
meant to catch, which will make the lock visible to lockdep and make
the assertion work as intended.

Reported-by: Mike Galbraith <efault@gmx.de>
Cc: Ingo Molnar <mingo@elte.hu>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Nicolai Haehnle <Nicolai.Haehnle@amd.com>
Fixes: 659cf9f5824a ("locking/ww_mutex: Optimize ww-mutexes by waking at mo=
st one waiter for backoff when acquiring the lock")
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: http://lkml.kernel.org/r/20170117150609.GB32474(a)worktop
---
 kernel/locking/mutex-debug.h |   17 -----------------
 kernel/locking/mutex.c       |   25 +++++++++++--------------
 kernel/locking/mutex.h       |    4 ----
 3 files changed, 11 insertions(+), 35 deletions(-)

--- a/kernel/locking/mutex-debug.h
+++ b/kernel/locking/mutex-debug.h
@@ -26,20 +26,3 @@ extern void mutex_remove_waiter(struct m
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
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -325,8 +325,6 @@ __ww_mutex_wakeup_for_backoff(struct mut
 static __always_inline void
 ww_mutex_set_context_fastpath(struct ww_mutex *lock, struct ww_acquire_ctx=
 *ctx)
 {
-	unsigned long flags;
-
 	ww_mutex_lock_acquired(lock, ctx);
 =

 	lock->ctx =3D ctx;
@@ -350,9 +348,9 @@ ww_mutex_set_context_fastpath(struct ww_
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
@@ -740,7 +738,6 @@ __mutex_lock_common(struct mutex *lock,
 		    struct ww_acquire_ctx *ww_ctx, const bool use_ww_ctx)
 {
 	struct mutex_waiter waiter;
-	unsigned long flags;
 	bool first =3D false;
 	struct ww_mutex *ww;
 	int ret;
@@ -766,7 +763,7 @@ __mutex_lock_common(struct mutex *lock,
 		return 0;
 	}
 =

-	spin_lock_mutex(&lock->wait_lock, flags);
+	spin_lock(&lock->wait_lock);
 	/*
 	 * After waiting to acquire the wait_lock, try again.
 	 */
@@ -830,7 +827,7 @@ __mutex_lock_common(struct mutex *lock,
 				goto err;
 		}
 =

-		spin_unlock_mutex(&lock->wait_lock, flags);
+		spin_unlock(&lock->wait_lock);
 		schedule_preempt_disabled();
 =

 		/*
@@ -853,9 +850,9 @@ __mutex_lock_common(struct mutex *lock,
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

@@ -872,7 +869,7 @@ __mutex_lock_common(struct mutex *lock,
 	if (use_ww_ctx && ww_ctx)
 		ww_mutex_set_context_slowpath(ww, ww_ctx);
 =

-	spin_unlock_mutex(&lock->wait_lock, flags);
+	spin_unlock(&lock->wait_lock);
 	preempt_enable();
 	return 0;
 =

@@ -880,7 +877,7 @@ __mutex_lock_common(struct mutex *lock,
 	__set_current_state(TASK_RUNNING);
 	mutex_remove_waiter(lock, &waiter, current);
 err_early_backoff:
-	spin_unlock_mutex(&lock->wait_lock, flags);
+	spin_unlock(&lock->wait_lock);
 	debug_mutex_free_waiter(&waiter);
 	mutex_release(&lock->dep_map, 1, ip);
 	preempt_enable();
@@ -1013,8 +1010,8 @@ EXPORT_SYMBOL_GPL(ww_mutex_lock_interrup
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

@@ -1049,7 +1046,7 @@ static noinline void __sched __mutex_unl
 		owner =3D old;
 	}
 =

-	spin_lock_mutex(&lock->wait_lock, flags);
+	spin_lock(&lock->wait_lock);
 	debug_mutex_unlock(lock);
 	if (!list_empty(&lock->wait_list)) {
 		/* get the first entry from the wait-list: */
@@ -1066,7 +1063,7 @@ static noinline void __sched __mutex_unl
 	if (owner & MUTEX_FLAG_HANDOFF)
 		__mutex_handoff(lock, next);
 =

-	spin_unlock_mutex(&lock->wait_lock, flags);
+	spin_unlock(&lock->wait_lock);
 =

 	wake_up_q(&wake_q);
 }
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

--===============4188465927982554077==--

