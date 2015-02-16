Content-Type: multipart/mixed; boundary="===============5098519193452509892=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/deadline] kernel BUG at kernel/sched/deadline.c:805!
Date: Mon, 16 Feb 2015 14:08:21 +0100
Message-ID: <20150216130821.GB5029@twins.programming.kicks-ass.net>
In-Reply-To: <1374601424090314@web4j.yandex.ru>
List-Id: <oe-lkp.lists.linux.dev>

--===============5098519193452509892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2015 at 03:38:34PM +0300, Kirill Tkhai wrote:
> We shouldn't enqueue migrating tasks. Please, try this one instead ;)

Ha, we should amend that task-rq-lock loop for that. See below.

I've not yet tested; going to try and reconstruct a .config that
triggers the oops.

---
Subject: sched/dl: Prevent enqueue of a sleeping task in dl_task_timer()
From: Kirill Tkhai <tkhai@yandex.ru>
Date: Mon, 16 Feb 2015 15:38:34 +0300

A deadline task may be throttled and dequeued at the same time.
This happens, when it becomes throttled in schedule(), which
is called to go to sleep:

current->state =3D TASK_INTERRUPTIBLE;
schedule()
    deactivate_task()
        dequeue_task_dl()
            update_curr_dl()
                start_dl_timer()
            __dequeue_task_dl()
    prev->on_rq =3D 0;

Later the timer fires, but the task is still dequeued:

dl_task_timer()
    enqueue_task_dl() /* queues on dl_rq; on_rq remains 0 */

Someone wakes it up:

try_to_wake_up()

    enqueue_dl_entity()
        BUG_ON(on_dl_rq())

Patch fixes this problem, it prevents queueing !on_rq tasks
on dl_rq.

Also teach the rq-lock loop about TASK_ON_RQ_MIGRATING as per
cca26e8009d1 ("sched: Teach scheduler to understand
TASK_ON_RQ_MIGRATING state").

Fixes: 1019a359d3dc ("sched/deadline: Fix stale yield state")
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Juri Lelli <juri.lelli@arm.com>
Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Kirill Tkhai <ktkhai@parallels.com>
[peterz: Wrote comment; fixed task-rq-lock loop]
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: http://lkml.kernel.org/r/1374601424090314(a)web4j.yandex.ru
---
 kernel/sched/deadline.c |   25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -515,9 +515,8 @@ static enum hrtimer_restart dl_task_time
 again:
 	rq =3D task_rq(p);
 	raw_spin_lock(&rq->lock);
-
-	if (rq !=3D task_rq(p)) {
-		/* Task was moved, retrying. */
+	if (rq !=3D task_rq(p) || task_on_rq_migrating(p)) {
+		/* Task was move{d,ing}, retry */
 		raw_spin_unlock(&rq->lock);
 		goto again;
 	}
@@ -541,6 +540,26 @@ static enum hrtimer_restart dl_task_time
 =

 	sched_clock_tick();
 	update_rq_clock(rq);
+
+	/*
+	 * If the throttle happened during sched-out; like:
+	 *
+	 *   schedule()
+	 *     deactivate_task()
+	 *       dequeue_task_dl()
+	 *         update_curr_dl()
+	 *           start_dl_timer()
+	 *         __dequeue_task_dl()
+	 *     prev->on_rq =3D 0;
+	 *
+	 * We can be both throttled and !queued. Replenish the counter
+	 * but do not enqueue -- wait for our wakeup to do that.
+	 */
+	if (!task_on_rq_queued(p)) {
+		replenish_dl_entity(dl_se, dl_se);
+		goto unlock;
+	}
+
 	enqueue_task_dl(rq, p, ENQUEUE_REPLENISH);
 	if (dl_task(rq->curr))
 		check_preempt_curr_dl(rq, p, 0);

--===============5098519193452509892==--

