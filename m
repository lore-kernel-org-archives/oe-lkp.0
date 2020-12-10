Content-Type: multipart/mixed; boundary="===============6619030908801281319=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/hotplug] 2558aacff8: will-it-scale.per_thread_ops -1.6% regression
Date: Thu, 10 Dec 2020 17:14:08 +0100
Message-ID: <20201210161408.GX3021@hirez.programming.kicks-ass.net>
In-Reply-To: <20201210081859.GA19784@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6619030908801281319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2020 at 04:18:59PM +0800, kernel test robot wrote:
> FYI, we noticed a -1.6% regression of will-it-scale.per_thread_ops due to=
 commit:
> commit: 2558aacff8586699bcd248b406febb28b0a25de2 ("sched/hotplug: Ensure =
only per-cpu kthreads run during hotplug")

Mooo, weird but whatever. Does the below help at all?

---
 kernel/sched/core.c  | 40 +++++++++++++++-------------------------
 kernel/sched/sched.h | 13 +++++--------
 2 files changed, 20 insertions(+), 33 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 7af80c3fce12..f80245c7f903 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3985,15 +3985,20 @@ static void do_balance_callbacks(struct rq *rq, str=
uct callback_head *head)
 	}
 }
 =

+static void balance_push(struct rq *rq);
+
+struct callback_head balance_push_callback =3D {
+	.next =3D NULL,
+	.func =3D (void (*)(struct callback_head *))balance_push,
+};
+
 static inline struct callback_head *splice_balance_callbacks(struct rq *rq)
 {
 	struct callback_head *head =3D rq->balance_callback;
 =

 	lockdep_assert_held(&rq->lock);
-	if (head) {
+	if (head)
 		rq->balance_callback =3D NULL;
-		rq->balance_flags &=3D ~BALANCE_WORK;
-	}
 =

 	return head;
 }
@@ -4014,21 +4019,6 @@ static inline void balance_callbacks(struct rq *rq, =
struct callback_head *head)
 	}
 }
 =

-static void balance_push(struct rq *rq);
-
-static inline void balance_switch(struct rq *rq)
-{
-	if (likely(!rq->balance_flags))
-		return;
-
-	if (rq->balance_flags & BALANCE_PUSH) {
-		balance_push(rq);
-		return;
-	}
-
-	__balance_callbacks(rq);
-}
-
 #else
 =

 static inline void __balance_callbacks(struct rq *rq)
@@ -4044,10 +4034,6 @@ static inline void balance_callbacks(struct rq *rq, =
struct callback_head *head)
 {
 }
 =

-static inline void balance_switch(struct rq *rq)
-{
-}
-
 #endif
 =

 static inline void
@@ -4075,7 +4061,7 @@ static inline void finish_lock_switch(struct rq *rq)
 	 * prev into current:
 	 */
 	spin_acquire(&rq->lock.dep_map, 0, 0, _THIS_IP_);
-	balance_switch(rq);
+	__balance_callbacks(rq);
 	raw_spin_unlock_irq(&rq->lock);
 }
 =

@@ -7256,6 +7242,10 @@ static void balance_push(struct rq *rq)
 =

 	lockdep_assert_held(&rq->lock);
 	SCHED_WARN_ON(rq->cpu !=3D smp_processor_id());
+	/*
+	 * Ensure the thing is persistent until balance_push_set(, on =3D false);
+	 */
+	rq->balance_callback =3D &balance_push_callback;
 =

 	/*
 	 * Both the cpu-hotplug and stop task are in this case and are
@@ -7305,9 +7295,9 @@ static void balance_push_set(int cpu, bool on)
 =

 	rq_lock_irqsave(rq, &rf);
 	if (on)
-		rq->balance_flags |=3D BALANCE_PUSH;
+		rq->balance_callback =3D &balance_push_callback;
 	else
-		rq->balance_flags &=3D ~BALANCE_PUSH;
+		rq->balance_callback =3D NULL;
 	rq_unlock_irqrestore(rq, &rf);
 }
 =

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index f5acb6c5ce49..12ada79d40f3 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -975,7 +975,6 @@ struct rq {
 	unsigned long		cpu_capacity_orig;
 =

 	struct callback_head	*balance_callback;
-	unsigned char		balance_flags;
 =

 	unsigned char		nohz_idle_balance;
 	unsigned char		idle_balance;
@@ -1226,6 +1225,8 @@ struct rq_flags {
 #endif
 };
 =

+extern struct callback_head balance_push_callback;
+
 /*
  * Lockdep annotation that avoids accidental unlocks; it's like a
  * sticky/continuous lockdep_assert_held().
@@ -1243,9 +1244,9 @@ static inline void rq_pin_lock(struct rq *rq, struct =
rq_flags *rf)
 #ifdef CONFIG_SCHED_DEBUG
 	rq->clock_update_flags &=3D (RQCF_REQ_SKIP|RQCF_ACT_SKIP);
 	rf->clock_update_flags =3D 0;
-#endif
 #ifdef CONFIG_SMP
-	SCHED_WARN_ON(rq->balance_callback);
+	SCHED_WARN_ON(rq->balance_callback && rq->balance_callback !=3D &balance_=
push_callback);
+#endif
 #endif
 }
 =

@@ -1408,9 +1409,6 @@ init_numa_balancing(unsigned long clone_flags, struct=
 task_struct *p)
 =

 #ifdef CONFIG_SMP
 =

-#define BALANCE_WORK	0x01
-#define BALANCE_PUSH	0x02
-
 static inline void
 queue_balance_callback(struct rq *rq,
 		       struct callback_head *head,
@@ -1418,13 +1416,12 @@ queue_balance_callback(struct rq *rq,
 {
 	lockdep_assert_held(&rq->lock);
 =

-	if (unlikely(head->next || (rq->balance_flags & BALANCE_PUSH)))
+	if (unlikely(head->next || rq->balance_callback =3D=3D &balance_push_call=
back))
 		return;
 =

 	head->func =3D (void (*)(struct callback_head *))func;
 	head->next =3D rq->balance_callback;
 	rq->balance_callback =3D head;
-	rq->balance_flags |=3D BALANCE_WORK;
 }
 =

 #define rcu_dereference_check_sched_domain(p) \
--===============6619030908801281319==--

