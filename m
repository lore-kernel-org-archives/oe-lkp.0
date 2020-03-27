Content-Type: multipart/mixed; boundary="===============5963916720812175959=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: [PATCH v2] workqueue: Remove the warning in wq_worker_sleeping()
Date: Sat, 28 Mar 2020 00:29:59 +0100
Message-ID: <20200327232959.rpylymw2edhtxuwr@linutronix.de>
In-Reply-To: <20200327175350.rw5gex6cwum3ohnu@linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============5963916720812175959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The kernel test robot triggered a warning with the following race:
   task-ctx A                            interrupt-ctx B
 worker
  -> process_one_work()
    -> work_item()
      -> schedule();
         -> sched_submit_work()
           -> wq_worker_sleeping()
             -> ->sleeping =3D 1
               atomic_dec_and_test(nr_running)
         __schedule();                *interrupt*
                                       async_page_fault()
                                       -> local_irq_enable();
                                       -> schedule();
                                          -> sched_submit_work()
                                            -> wq_worker_sleeping()
                                               -> if (WARN_ON(->sleeping)) =
return
                                          -> __schedule()
                                            ->  sched_update_worker()
                                              -> wq_worker_running()
                                                 -> atomic_inc(nr_running);
                                                 -> ->sleeping =3D 0;

      ->  sched_update_worker()
        -> wq_worker_running()
          if (!->sleeping) return

In this context the warning is pointless everything is fine.
An interrupt before wq_worker_sleeping() will perform the ->sleeping
assignment (0 -> 1 > 0) twice.
An interrupt after wq_worker_sleeping() will trigger the warning and
nr_running will be decremented (by A) and incremented once (only by B, A
will skip it). This is the case until the ->sleeping is zeroed again in
wq_worker_running().

Remove the WARN statement because this condition may happen. Document
that preemption around wq_worker_sleeping() needs to be disabled to
protect ->sleeping and not just as an optimisation.

Fixes: 6d25be5782e48 ("sched/core, workqueues: Distangle worker accounting =
from rq lock")
Link: https://lkml.kernel.org/r/20200327074308.GY11705(a)shao2-debian
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

v1=E2=80=A6v2: - Drop the warning instead of using cmpxchg_local().
	 Tglx pointed out that wq_worker_sleeping() is already invoked
	 with disabled preemption so the race described can not happen.

       - Document that it is required to have preemption disabled within
	 wq_worker_sleeping() to protect ->sleeping (against the race
	 described in v1).

 kernel/sched/core.c | 3 ++-
 kernel/workqueue.c  | 6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1a9983da4408d..7181ea73e5566 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4112,7 +4112,8 @@ static inline void sched_submit_work(struct task_stru=
ct *tsk)
 	 * it wants to wake up a task to maintain concurrency.
 	 * As this function is called inside the schedule() context,
 	 * we disable preemption to avoid it calling schedule() again
-	 * in the possible wakeup of a kworker.
+	 * in the possible wakeup of a kworker and because wq_worker_sleeping()
+	 * requires it.
 	 */
 	if (tsk->flags & (PF_WQ_WORKER | PF_IO_WORKER)) {
 		preempt_disable();
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 4e01c448b4b48..39b968146f5f7 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -858,7 +858,8 @@ void wq_worker_running(struct task_struct *task)
  * @task: task going to sleep
  *
  * This function is called from schedule() when a busy worker is
- * going to sleep.
+ * going to sleep. Preemption needs to be disabled to protect ->sleeping
+ * assignment.
  */
 void wq_worker_sleeping(struct task_struct *task)
 {
@@ -875,7 +876,8 @@ void wq_worker_sleeping(struct task_struct *task)
 =

 	pool =3D worker->pool;
 =

-	if (WARN_ON_ONCE(worker->sleeping))
+	/* Return if preempted before wq_worker_running() was reached */
+	if (worker->sleeping)
 		return;
 =

 	worker->sleeping =3D 1;
-- =

2.26.0

--===============5963916720812175959==--

