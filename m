Content-Type: multipart/mixed; boundary="===============4915929415787678077=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: [sched] Out of memory: Kill process 2999 (rc) score 9 or sacrifice child
Date: Sun, 10 Aug 2014 17:29:14 +0200
Message-ID: <20140810152914.GA11947@redhat.com>
In-Reply-To: <20140809184616.GQ9918@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4915929415787678077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/09, Peter Zijlstra wrote:
>
> That would suggest we're failing to do the TASK_DEAD thing properly, and
> ARGH! bloody obvious why, see the this_rq() comment right before the
> finish_task_switch() call in context_switch().

Off-topic, but perhaps we can make this a bit more clear?

Hmm. But after I actually did this change I can't understand if it makes
this more clean or uglifies the code. See the patch below.

OTOH, "int cpu" in __schedule() looks pointless and should die? Both
rcu_note_context_switch() and wq_worker_sleeping() can use
raw_smp_processor_id() ? In fact I think wq_worker_sleeping() doesn't
need the "task" argument too.

And... Doesn't schedule_tail() need preempt_enable() before
finish_task_switch() ? IOW, shouldn't it do

	#ifndef __ARCH_WANT_UNLOCKED_CTXSW
		preempt_disable();
	#endif
		finish_task_switch();
		post_schedule(rq);

		preempt_enable();

or I am totally confused?

Oleg.


diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 3bdf01b..e37259f 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2192,10 +2192,16 @@ prepare_task_switch(struct rq *rq, struct task_stru=
ct *prev,
  * so, we finish that here outside of the runqueue lock. (Doing it
  * with the lock held can cause deadlocks; see schedule() for
  * details.)
+ *
+ * The context switch have flipped the stack from under us and restored the
+ * local variables which were saved when this task called schedule() in the
+ * past. prev =3D=3D current is still correct but we need to recalculate t=
his_rq
+ * because prev may have moved to another CPU.
  */
-static void finish_task_switch(struct rq *rq, struct task_struct *prev)
+static struct rq *finish_task_switch(struct task_struct *prev)
 	__releases(rq->lock)
 {
+	struct rq *rq =3D this_rq();
 	struct mm_struct *mm =3D rq->prev_mm;
 	long prev_state;
 =

@@ -2235,6 +2241,7 @@ static void finish_task_switch(struct rq *rq, struct =
task_struct *prev)
 	}
 =

 	tick_nohz_task_switch(current);
+	return rq;
 }
 =

 #ifdef CONFIG_SMP
@@ -2269,10 +2276,7 @@ static inline void post_schedule(struct rq *rq)
 asmlinkage __visible void schedule_tail(struct task_struct *prev)
 	__releases(rq->lock)
 {
-	struct rq *rq =3D this_rq();
-
-	finish_task_switch(rq, prev);
-
+	struct rq *rq =3D finish_task_switch(prev);
 	/*
 	 * FIXME: do we need to worry about rq being invalidated by the
 	 * task_switch?
@@ -2291,9 +2295,8 @@ asmlinkage __visible void schedule_tail(struct task_s=
truct *prev)
  * context_switch - switch to the new MM and the new
  * thread's register state.
  */
-static inline void
-context_switch(struct rq *rq, struct task_struct *prev,
-	       struct task_struct *next)
+static inline struct rq *
+context_switch(struct rq *rq, struct task_struct *prev, struct task_struct=
 *next)
 {
 	struct mm_struct *mm, *oldmm;
 =

@@ -2332,14 +2335,9 @@ context_switch(struct rq *rq, struct task_struct *pr=
ev,
 	context_tracking_task_switch(prev, next);
 	/* Here we just switch the register state and the stack. */
 	switch_to(prev, next, prev);
-
 	barrier();
-	/*
-	 * this_rq must be evaluated again because prev may have moved
-	 * CPUs since it called schedule(), thus the 'rq' on its stack
-	 * frame will be invalid.
-	 */
-	finish_task_switch(this_rq(), prev);
+
+	return finish_task_switch(prev);
 }
 =

 /*
@@ -2792,15 +2790,8 @@ need_resched:
 		rq->curr =3D next;
 		++*switch_count;
 =

-		context_switch(rq, prev, next); /* unlocks the rq */
-		/*
-		 * The context switch have flipped the stack from under us
-		 * and restored the local variables which were saved when
-		 * this task called schedule() in the past. prev =3D=3D current
-		 * is still correct, but it can be moved to another cpu/rq.
-		 */
+		rq =3D context_switch(rq, prev, next); /* unlocks the rq */
 		cpu =3D smp_processor_id();
-		rq =3D cpu_rq(cpu);
 	} else
 		raw_spin_unlock_irq(&rq->lock);
 =



--===============4915929415787678077==--

