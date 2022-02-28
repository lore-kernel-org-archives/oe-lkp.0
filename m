Content-Type: multipart/mixed; boundary="===============7868526903923507222=="
MIME-Version: 1.0
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: lkp@lists.01.org
Subject: [PATCH v3] workqueue: Warn flushing of kernel-global workqueues
Date: Mon, 28 Feb 2022 23:03:47 +0900
Message-ID: <4165db50-1365-549a-eb77-6122c78d4814@I-love.SAKURA.ne.jp>
In-Reply-To: <Yha1LeX4OK3cLCV5@slm.duckdns.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7868526903923507222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2022/02/24 7:29, Tejun Heo wrote:
> On Thu, Feb 24, 2022 at 07:26:30AM +0900, Tetsuo Handa wrote:
>>> The patch seems pretty wrong. What's problematic is system workqueue fl=
ushes
>>> (which flushes the entire workqueue), not work item flushes.
>>
>> Why? My understanding is that
>>
>>   flushing a workqueue waits for completion of all work items in that wo=
rkqueue
>>
>>   flushing a work item waits for for completion of that work item using
>>   a workqueue specified as of queue_work()
>>
>> and
>>
>>   if a work item in some workqueue is blocked by other work in that work=
queue
>>   (e.g. max_active limit, work items on that workqueue and locks they ne=
ed),
>>   it has a risk of deadlock
>>
>> . Then, how can flushing a work item using system-wide workqueues be fre=
e of deadlock risk?
>> Isn't it just "unlikely to deadlock" rather than "impossible to deadlock=
"?
> =

> If we're jamming system_wq with a combination of work items which need mo=
re
> than max_active to make forward progress, we're stuck regardless of flush=
es.
> What's needed at that point is increasing max_active (or something along
> that line).

Then, what about this?
If this looks OK, I'll test this patch using linux-next via my tree.

>From 75ccc165bfcea368728d8c0f7efcc8b4f904f98d Mon Sep 17 00:00:00 2001
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Date: Mon, 28 Feb 2022 22:49:16 +0900
Subject: [PATCH v3] workqueue: Warn flushing of kernel-global workqueues

Since flush operation synchronously waits for completion, flushing
kernel-global WQs (e.g. system_wq) might introduce possibility of deadlock
due to unexpected locking dependency. Tejun Heo commented that it makes no
sense at all to call flush_workqueue() on the shared WQs as the caller has
no idea what it's gonna end up waiting for.

Although there is flush_scheduled_work() which flushes system_wq WQ with
"Think twice before calling this function! It's very easy to get into
trouble if you don't take great care." warning message, syzbot found a
circular locking dependency caused by flushing system_long_wq WQ [1].
Therefore, let's change the direction to that developers had better use
their local WQs if flush_workqueue() is inevitable.

To give developers time to update their modules, for now just emit
a warning message with ratelimit when flush_workqueue() is called on
kernel-global WQs. We will eventually convert this warning message into
WARN_ON() and kill flush_scheduled_work().

This patch introduces __WQ_NO_FLUSH flag for emitting warning. Don't set
this flag when creating your local WQs while updating your module, for
destroy_workqueue() will involve flush operation.

Theoretically, flushing specific work item using flush_work() queued on
kernel-global WQs (which are !WQ_MEM_RECLAIM) has possibility of deadlock.
But this patch does not emit warning when flush_work() is called on work
items queued on kernel-global WQs, based on assumption that we can create
kworker threads as needed and we won't hit max_active limit.

Link: https://syzkaller.appspot.com/bug?extid=3D831661966588c802aae9 [1]
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
Changes in v3:
  Don't check flush_work() attempt.
  Use a private WQ_ flag.
Changes in v2:
  Removed #ifdef CONFIG_PROVE_LOCKING=3Dy check.
  Also check flush_work() attempt.
  Shorten warning message.
  Introduced a public WQ_ flag, which is initially meant for use by
  only system-wide WQs, but allows private WQs used by built-in modules
  to use this flag for detecting unexpected flush attempts if they want.

 include/linux/workqueue.h | 15 +++------------
 kernel/workqueue.c        | 36 +++++++++++++++++++++++++++++-------
 2 files changed, 32 insertions(+), 19 deletions(-)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index 7fee9b6cfede..7b13fae377e2 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -339,6 +339,7 @@ enum {
 	__WQ_ORDERED		=3D 1 << 17, /* internal: workqueue is ordered */
 	__WQ_LEGACY		=3D 1 << 18, /* internal: create*_workqueue() */
 	__WQ_ORDERED_EXPLICIT	=3D 1 << 19, /* internal: alloc_ordered_workqueue()=
 */
+	__WQ_NO_FLUSH           =3D 1 << 20, /* internal: warn flush_workqueue() =
*/
 =

 	WQ_MAX_ACTIVE		=3D 512,	  /* I like 512, better ideas? */
 	WQ_MAX_UNBOUND_PER_CPU	=3D 4,	  /* 4 * #cpus for unbound wq */
@@ -569,18 +570,8 @@ static inline bool schedule_work(struct work_struct *w=
ork)
  * Forces execution of the kernel-global workqueue and blocks until its
  * completion.
  *
- * Think twice before calling this function!  It's very easy to get into
- * trouble if you don't take great care.  Either of the following situatio=
ns
- * will lead to deadlock:
- *
- *	One of the work items currently on the workqueue needs to acquire
- *	a lock held by your code or its caller.
- *
- *	Your code is running in the context of a work routine.
- *
- * They will be detected by lockdep when they occur, but the first might n=
ot
- * occur very often.  It depends on what work items are on the workqueue a=
nd
- * what locks they need, which you have no control over.
+ * Please stop calling this function. If you need to flush kernel-global
+ * workqueue, please use your local workqueue.
  *
  * In most situations flushing the entire workqueue is overkill; you merely
  * need to know that a particular work item isn't queued and isn't running.
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 33f1106b4f99..bc271579704f 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -2805,6 +2805,25 @@ static bool flush_workqueue_prep_pwqs(struct workque=
ue_struct *wq,
 	return wait;
 }
 =

+static void warn_flush_attempt(struct workqueue_struct *wq)
+{
+	/*
+	 * Since there are known in-tree modules which will emit this warning,
+	 * for now don't use WARN_ON() in order not to break kernel testing.
+	 *
+	 * Print whole traces with ratelimit, in order to make sure that
+	 * this warning is not overlooked while this warning does not flood
+	 * console and kernel log buffer.
+	 */
+	static DEFINE_RATELIMIT_STATE(flush_warn_rs, 600 * HZ, 1);
+
+	ratelimit_set_flags(&flush_warn_rs, RATELIMIT_MSG_ON_RELEASE);
+	if (!__ratelimit(&flush_warn_rs))
+		return;
+	pr_warn("Please do not flush %s WQ.\n", wq->name);
+	dump_stack();
+}
+
 /**
  * flush_workqueue - ensure that any scheduled work has run to completion.
  * @wq: workqueue to flush
@@ -2824,6 +2843,9 @@ void flush_workqueue(struct workqueue_struct *wq)
 	if (WARN_ON(!wq_online))
 		return;
 =

+	if (unlikely(wq->flags & __WQ_NO_FLUSH))
+		warn_flush_attempt(wq);
+
 	lock_map_acquire(&wq->lockdep_map);
 	lock_map_release(&wq->lockdep_map);
 =

@@ -6054,17 +6076,17 @@ void __init workqueue_init_early(void)
 		ordered_wq_attrs[i] =3D attrs;
 	}
 =

-	system_wq =3D alloc_workqueue("events", 0, 0);
-	system_highpri_wq =3D alloc_workqueue("events_highpri", WQ_HIGHPRI, 0);
-	system_long_wq =3D alloc_workqueue("events_long", 0, 0);
-	system_unbound_wq =3D alloc_workqueue("events_unbound", WQ_UNBOUND,
+	system_wq =3D alloc_workqueue("events", __WQ_NO_FLUSH, 0);
+	system_highpri_wq =3D alloc_workqueue("events_highpri", __WQ_NO_FLUSH | W=
Q_HIGHPRI, 0);
+	system_long_wq =3D alloc_workqueue("events_long", __WQ_NO_FLUSH, 0);
+	system_unbound_wq =3D alloc_workqueue("events_unbound", __WQ_NO_FLUSH | W=
Q_UNBOUND,
 					    WQ_UNBOUND_MAX_ACTIVE);
 	system_freezable_wq =3D alloc_workqueue("events_freezable",
-					      WQ_FREEZABLE, 0);
+					      __WQ_NO_FLUSH | WQ_FREEZABLE, 0);
 	system_power_efficient_wq =3D alloc_workqueue("events_power_efficient",
-					      WQ_POWER_EFFICIENT, 0);
+					      __WQ_NO_FLUSH | WQ_POWER_EFFICIENT, 0);
 	system_freezable_power_efficient_wq =3D alloc_workqueue("events_freezable=
_power_efficient",
-					      WQ_FREEZABLE | WQ_POWER_EFFICIENT,
+					      __WQ_NO_FLUSH | WQ_FREEZABLE | WQ_POWER_EFFICIENT,
 					      0);
 	BUG_ON(!system_wq || !system_highpri_wq || !system_long_wq ||
 	       !system_unbound_wq || !system_freezable_wq ||
-- =

2.32.0


--===============7868526903923507222==--

