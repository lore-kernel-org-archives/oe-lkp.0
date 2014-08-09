Content-Type: multipart/mixed; boundary="===============1354734186447081588=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched] Out of memory: Kill process 2999 (rc) score 9 or sacrifice child
Date: Sat, 09 Aug 2014 20:46:16 +0200
Message-ID: <20140809184616.GQ9918@twins.programming.kicks-ass.net>
In-Reply-To: <20140809143034.GA28345@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============1354734186447081588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 09, 2014 at 10:30:34PM +0800, Fengguang Wu wrote:
> Hi Peter,
> =

> We noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/wait
> commit d58d631b474c552dce72da2dce9dd276d731b79a ("sched: Fix finish_task_=
switch vs prev_state")
> =

> test case: vm-vp-quantal-x86_64/boot/1
> =

> 9e6e6179961e8dd  d58d631b474c552dce72da2dc  testbox/testcase/testparams
> ---------------  -------------------------  ---------------------------
>          0           +Inf%          1 =C2=B1 0%  TOTAL dmesg.Out_of_memor=
y:Kill_process
>          0           +Inf%          0 =C2=B150%  TOTAL dmesg.Kernel_panic=
-not_syncing:Out_of_memory_and_no_killable_processes
> =

> In commit 9e6e6179961e8dd, the boot dmesg is
> =

> [    7.537598] Freeing unused kernel memory: 3352K (ffffffff82230000 - ff=
ffffff82576000)
> [    7.558273] random: init urandom read with 11 bits of entropy available
> [    7.687132] init: Failed to create pty - disabling logging for job
> [    7.688578] init: Temporary process spawn error: No space left on devi=
ce
> [   68.298970] reboot: Restarting system
> =

> In d58d631b474c552dce72da2dc, the OOM occurred immediately after the
> "No space left on device" line. The qemu has mem=3D320M and the initrds
> are 24M in total. What's interesting is, in the 5 boot tests for
> d58d631b47 and its parent commit, this OOM message is 100%
> reproducible on commit d58d631b47, while its parent boots all fine. =


That would suggest we're failing to do the TASK_DEAD thing properly, and
ARGH! bloody obvious why, see the this_rq() comment right before the
finish_task_switch() call in context_switch().

Oleg any clever ideas or do I store in a scratch per-cpu variable or
something daft like that?

---
commit d58d631b474c552dce72da2dce9dd276d731b79a
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Tue Jul 29 11:22:37 2014 +0200

sched: Fix finish_task_switch vs prev_state

Oleg wondered about the prev_state comment in finish_task_switch().

Aside from it being confusingly worded -- we neither initially
understood the actual problem being described -- we found that we'd
broken the scenario described.

Ever since commit e4a52bcb9a18 ("sched: Remove rq->lock from the first
half of ttwu()") we don't actually acquire rq->lock on wakeups anymore
and therefore holding rq->lock after the switch is no good.

Even if we did, __ARCH_WANT_UNLOCKED_CTXSW was already broken, because
it explicitly didn't hold the rq->lock anymore.

We could fix things by placing a full barrier between the prev->state
read and the next->on_cpu =3D 0 store, seeing how the remote wakeup code
waits for ->on_cpu to become false before proceeding with the wakeup
(so as to avoid having the task running on two cpus at the same time),
however full barriers are expensive.

Instead we read prev->state before the context switch and propagate it
unto finish_task_switch. This trivially solves the problem without
adding extra (and costly) memory barriers.

I'm not sure why we've never seen crashes due to this, it appears
entirely possible.

Fixes: e4a52bcb9a18 ("sched: Remove rq->lock from the first half of ttwu()")
Cc: Ingo Molnar <mingo@kernel.org>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Dave Jones <davej@redhat.com>
Cc: Andrey Ryabinin <a.ryabinin@samsung.com>
Cc: Sasha Levin <sasha.levin@oracle.com>
Cc: Manfred Spraul <manfred@colorfullife.com>
Reported-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Peter Zijlstra <peterz@infradead.org>
Link: http://lkml.kernel.org/r/20140729092237.GU12054(a)laptop.lan
---
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1211575a2208..df2f691f09f6 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2190,6 +2190,7 @@ prepare_task_switch(struct rq *rq, struct task_struct=
 *prev,
  * finish_task_switch - clean up after a task-switch
  * @rq: runqueue associated with task-switch
  * @prev: the thread we just switched away from.
+ * @prev_state: the state of @prev before we switched away from it.
  *
  * finish_task_switch must be called after the context switch, paired
  * with a prepare_task_switch call before the context switch.
@@ -2201,26 +2202,14 @@ prepare_task_switch(struct rq *rq, struct task_stru=
ct *prev,
  * with the lock held can cause deadlocks; see schedule() for
  * details.)
  */
-static void finish_task_switch(struct rq *rq, struct task_struct *prev)
+static void
+finish_task_switch(struct rq *rq, struct task_struct *prev, long prev_stat=
e)
 	__releases(rq->lock)
 {
 	struct mm_struct *mm =3D rq->prev_mm;
-	long prev_state;
 =

 	rq->prev_mm =3D NULL;
 =

-	/*
-	 * A task struct has one reference for the use as "current".
-	 * If a task dies, then it sets TASK_DEAD in tsk->state and calls
-	 * schedule one last time. The schedule call will never return, and
-	 * the scheduled task must drop that reference.
-	 * The test for TASK_DEAD must occur while the runqueue locks are
-	 * still held, otherwise prev could be scheduled on another cpu, die
-	 * there before we look at prev->state, and then the reference would
-	 * be dropped twice.
-	 *		Manfred Spraul <manfred@colorfullife.com>
-	 */
-	prev_state =3D prev->state;
 	vtime_task_switch(prev);
 	finish_arch_switch(prev);
 	perf_event_task_sched_in(prev, current);
@@ -2279,7 +2268,7 @@ asmlinkage __visible void schedule_tail(struct task_s=
truct *prev)
 {
 	struct rq *rq =3D this_rq();
 =

-	finish_task_switch(rq, prev);
+	finish_task_switch(rq, prev, 0);
 =

 	/*
 	 * FIXME: do we need to worry about rq being invalidated by the
@@ -2304,6 +2293,21 @@ context_switch(struct rq *rq, struct task_struct *pr=
ev,
 	       struct task_struct *next)
 {
 	struct mm_struct *mm, *oldmm;
+	/*
+	 * A task struct has one reference for the use as "current".
+	 * If a task dies, then it sets TASK_DEAD in tsk->state and calls
+	 * schedule one last time. The schedule call will never return, and
+	 * the scheduled task must drop that reference.
+	 *
+	 * We must observe prev->state before clearing prev->on_cpu (in
+	 * finish_lock_switch), otherwise a concurrent wakeup can get prev
+	 * running on another CPU and we could race with its RUNNING -> DEAD
+	 * transition, and then the reference would be dropped twice.
+	 *
+	 * We avoid the race by observing prev->state while it is still
+	 * current.
+	 */
+	long prev_state =3D prev->state;
 =

 	prepare_task_switch(rq, prev, next);
 =

@@ -2347,7 +2351,7 @@ context_switch(struct rq *rq, struct task_struct *pre=
v,
 	 * CPUs since it called schedule(), thus the 'rq' on its stack
 	 * frame will be invalid.
 	 */
-	finish_task_switch(this_rq(), prev);
+	finish_task_switch(this_rq(), prev, prev_state);
 }
 =

 /*

--===============1354734186447081588==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaVFJY0JBRUJBZ0FHQlFKVDVteDRBQW9KRUhaSDRhUkx3T1M2ZVhZUC9SWS9NOXJo
bFZzeVIyWkZ5Y2Y5WDlwcgo2RHh3ZmtiV0NOQ2ZhbGVzZjIyRXdFWnlqcTdVdGN3Wm1rUko3d25Z
QkRnTjU0MWY5ZHdzNERGeUZTKzFLSWlkClgvbi9JTlpqZEJXR003RjN4c3BaTkhPZkRnU3FzUjU0
a0RwT3V4VkZDZW1iZXdTZGdaZFpiZXd2c1Urb3dGQkoKOVhNdjZPWkN4MzNmVUR1UDFrYkZuNFJP
MzlBa3hlUnRzYmd4cjdWRTBjN2J6QjN6UGY2MmtKYTZ3dURGREtvKwo1dHljVUx2K1AvMnFkZjNl
RHhXV0k5bDNFZURPZkk0U01jaXk4Zmd2WEtWa2Ezdi9xSk0zOUFVemhiakpnMzdKCmlpeXErMlpy
QkpsL2Q2TzZDV3ZySFhhNHI5eGs5UlU2K0ZPc25jbUdMOFRBVVF6YnIzR096aXdZb2dtY2J4Uy8K
VFZ6MmNUWlBNa3RkZ3Y0emgzb3g0QnFYVzhUZXNadFVNOG05TmNZVitRZDd6VWhHdTU4cERhbDY0
bHdwVHordwprTWVNZ2pCTU1WS0FxMFY3c0RCTHE1MFhBaFFDZHhXV1oybEJCQ2tiSXRVamNzNlVt
ODkxSjNON1NiRERmM0pFCnhvRVRBNnpSekc1aE5mZTYwVVNZcEtOM0x3c3B4OUNZS1g4OEkraVVD
SzZETUx6Q0FEZ25YclZoUUxWaHJnTjAKY2x4NWdyRitsWHlOUW5aODg0UzIrY3lscHJkUVNKSWg4
bmMzTklkenJCOHNlRURRczdlbHlZbDJJNW9seWYrMgozYXJUOHNVdG51QThTK01kdmk5TXhDdFpF
d0tPR3NnY0l1TW9LM0hpcURsOXhDckUzK0t3RlRrME4vZnhWKzVuCnZJeWhPZlpsZnorK3JjZlpO
Y0JDCj1VOFNtCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============1354734186447081588==--

