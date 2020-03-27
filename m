Content-Type: multipart/mixed; boundary="===============2524738337860890590=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: [PATCH] workqueue: Don't double assign worker->sleeping
Date: Fri, 27 Mar 2020 18:53:50 +0100
Message-ID: <20200327175350.rw5gex6cwum3ohnu@linutronix.de>
In-Reply-To: <20200327074308.GY11705@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2524738337860890590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The kernel test robot triggered a warning with the following race:
   task-ctx                              interrupt-ctx
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

However, if the interrupt occurs in wq_worker_sleeping() between reading and
setting `sleeping' i.e.

|        if (WARN_ON_ONCE(worker->sleeping))
|                return;
 *interrupt*
|        worker->sleeping =3D 1;

then pool->nr_running will be decremented twice in wq_worker_sleeping()
but it will be incremented only once in wq_worker_running().

Replace the assignment of `sleeping' with a cmpxchg_local() to ensure
that there is no double assignment of the variable. The variable is only
accessed from the local CPU. Remove the WARN statement because this
condition can be valid.

An alternative would be to move `->sleeping' to `->flags' as a new bit
but this would require to acquire the pool->lock in wq_worker_running().

Fixes: 6d25be5782e48 ("sched/core, workqueues: Distangle worker accounting =
from rq lock")
Link: https://lkml.kernel.org/r/20200327074308.GY11705(a)shao2-debian
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/workqueue.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 4e01c448b4b48..dc477a2a3ce30 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -846,11 +846,10 @@ void wq_worker_running(struct task_struct *task)
 {
 	struct worker *worker =3D kthread_data(task);
 =

-	if (!worker->sleeping)
+	if (cmpxchg_local(&worker->sleeping, 1, 0) =3D=3D 0)
 		return;
 	if (!(worker->flags & WORKER_NOT_RUNNING))
 		atomic_inc(&worker->pool->nr_running);
-	worker->sleeping =3D 0;
 }
 =

 /**
@@ -875,10 +874,9 @@ void wq_worker_sleeping(struct task_struct *task)
 =

 	pool =3D worker->pool;
 =

-	if (WARN_ON_ONCE(worker->sleeping))
+	if (cmpxchg_local(&worker->sleeping, 0, 1) =3D=3D 1)
 		return;
 =

-	worker->sleeping =3D 1;
 	spin_lock_irq(&pool->lock);
 =

 	/*
-- =

2.26.0

--===============2524738337860890590==--

