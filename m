Content-Type: multipart/mixed; boundary="===============2900967877050902061=="
MIME-Version: 1.0
From: Paolo Valente <paolo.valente@linaro.org>
To: lkp@lists.01.org
Subject: [PATCH 13/22] block, bfq: add more fairness to boost throughput and reduce latency
Date: Sun, 07 Aug 2016 20:12:13 +0200
Message-ID: <1470593542-11109-13-git-send-email-paolo.valente@linaro.org>
In-Reply-To: <1470593542-11109-1-git-send-email-paolo.valente@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2900967877050902061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We have found four sources of throughput loss and higher
latencies. First, write requests tend to starve read requests,
basically because, on one side, writes are slower than reads, whereas,
on the other side, storage devices confuse schedulers by deceptively
signaling the completion of write requests immediately after receiving
them. This patch addresses this issue by just throttling writes. In
particular, after a write request is dispatched for a queue, the
budget of the queue is decremented by the number of sectors to write,
multiplied by an (over)charge coefficient.

The current value of this coefficient, as well as the values of the
constants used in the following other changes, is the result of
our tuning with different devices.

The second source of problems is that some applications generate
really few and small, yet very far, random requests at the beginning
of a new I/O-bound phase. This causes the average seek distance,
computed using a low-pass filter, to remain high for a non-negligible
amount of time, even if then the application issues only sequential
requests. Hence, for a while, the queue associated with the
application is unavoidably detected as seeky (i.e., containing random
requests). The device-idling timeout is then set to a very low value
for the queue. This often caused a loss of throughput on rotational
devices, as well as an increased latency. In contrast, this patch
allows the device-idling timeout for a seeky queue to be set to a very
low value only if the associated process has either already consumed
at least a minimum fraction (1/8) of the maximum budget B_max, or
already proved to generate random requests systematically. In
particular, in the latter case the queue is flagged as "constantly
seeky".

Finally, the following additional BFQ mechanism causes throughput loss
and increased latencies in two further situations. When the in-service
queue is expired, BFQ also controls whether the queue has been "too
slow", i.e., has consumed its last-assigned budget at such a low rate
that it would have been impossible to consume all of it within the
maximum time slice T_max (Subsec. 3.5 in [1]). In this case, the queue
is always (over)charged the whole budget, to reduce its utilization of
the device, exactly as it happens with seeky queues. The description
of both the two situations in which this behavior causes problems and
the solutions provided by this patch follows.

1. If too little time has elapsed since a process started doing
sequential I/O, then the positive effect on the throughput of its
sequential accesses may not have yet prevailed on the throughput loss
caused by the fact that a random access had to be performed to get to
the first sector requested by the process. For this reason, if a slow
queue is expired after receiving very little service (at most 1/8 of
the maximum budget), now it is not charged a full budget.

2. Because of ZBR, a queue may be deemed as slow when its associated
process is performing I/O on the slowest zones of a disk. However,
unless the process is truly too slow, not reducing the disk
utilization of the queue is more profitable in terms of disk
throughput than the opposite. For this reason now a queue is never
charged the whole budget if it has consumed at least a significant
part of it (2/3).

[1] P. Valente and M. Andreolini, "Improving Application
    Responsiveness with the BFQ Disk I/O Scheduler", Proceedings of
    the 5th Annual International Systems and Storage Conference
    (SYSTOR '12), June 2012.
    Slightly extended version:
    http://algogroup.unimore.it/people/paolo/disk_sched/bfq-v1-suite-
							results.pdf

Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
Signed-off-by: Arianna Avanzini <avanzini.arianna@gmail.com>

Remove constantly_seeky flag

Improve use of async_charge_factor
---
 block/cfq-iosched.c | 152 +++++++++++++++++++++++++++++++++---------------=
----
 1 file changed, 96 insertions(+), 56 deletions(-)

diff --git a/block/cfq-iosched.c b/block/cfq-iosched.c
index d1c4f55..a4ceb36 100644
--- a/block/cfq-iosched.c
+++ b/block/cfq-iosched.c
@@ -678,6 +678,13 @@ static const int bfq_stats_min_budgets =3D 194;
 /* Default maximum budget values, in sectors and number of requests. */
 static const int bfq_default_max_budget =3D 16 * 1024;
 =

+/*
+ * Async to sync throughput distribution is controlled as follows:
+ * when an async request is served, the entity is charged the number
+ * of sectors of the request, multiplied by the factor below
+ */
+static const int bfq_async_charge_factor =3D 10;
+
 /* Default timeout values, in jiffies, approximating CFQ defaults. */
 static const int bfq_timeout =3D HZ / 8;
 =

@@ -1350,22 +1357,52 @@ static void bfq_bfqq_served(struct bfq_queue *bfqq,=
 int served)
 }
 =

 /**
- * bfq_bfqq_charge_full_budget - set the service to the entity budget.
+ * bfq_bfqq_charge_time - charge an amount of service equivalent to the le=
ngth
+ *			  of the time interval during which bfqq has been in
+ *			  service.
+ * @bfqd: the device
  * @bfqq: the queue that needs a service update.
+ * @time_ms: the amount of time during which the queue has received service
  *
- * When it's not possible to be fair in the service domain, because
- * a queue is not consuming its budget fast enough (the meaning of
- * fast depends on the timeout parameter), we charge it a full
- * budget.  In this way we should obtain a sort of time-domain
- * fairness among all the seeky/slow queues.
+ * If a queue does not consume its budget fast enough, then providing
+ * the queue with service fairness may impair throughput, more or less
+ * severely. For this reason, queues that consume their budget slowly
+ * are provided with time fairness instead of service fairness. This
+ * goal is achieved through the BFQ scheduling engine, even if such an
+ * engine works in the service, and not in the time domain. The trick
+ * is charging these queues with an inflated amount of service, equal
+ * to the amount of service that they would have received during their
+ * service slot if they had been fast, i.e., if their requests had
+ * been dispatched at a rate equal to the estimated peak rate.
+ *
+ * It is worth noting that time fairness can cause important
+ * distortions in terms of bandwidth distribution, on devices with
+ * internal queueing. The reason is that I/O requests dispatched
+ * during the service slot of a queue may be served after that service
+ * slot is finished, and may have a total processing time loosely
+ * correlated with the duration of the service slot. This is
+ * especially true for short service slots.
  */
-static void bfq_bfqq_charge_full_budget(struct bfq_queue *bfqq)
+static void bfq_bfqq_charge_time(struct bfq_data *bfqd, struct bfq_queue *=
bfqq,
+				 unsigned long time_ms)
 {
 	struct bfq_entity *entity =3D &bfqq->entity;
+	int tot_serv_to_charge =3D entity->service;
+	unsigned int timeout_ms =3D jiffies_to_msecs(bfq_timeout);
+
+	if (time_ms > 0 && time_ms < timeout_ms)
+		tot_serv_to_charge =3D
+			(bfqd->bfq_max_budget * time_ms) / timeout_ms;
 =

-	bfq_log_bfqq(bfqq->bfqd, bfqq, "charge_full_budget");
+	if (tot_serv_to_charge < entity->service)
+		tot_serv_to_charge =3D entity->service;
 =

-	bfq_bfqq_served(bfqq, entity->budget - entity->service);
+	/* Increase budget to avoid inconsistencies */
+	if (tot_serv_to_charge > entity->budget)
+		entity->budget =3D tot_serv_to_charge;
+
+	bfq_bfqq_served(bfqq,
+			max_t(int, 0, tot_serv_to_charge - entity->service));
 }
 =

 /**
@@ -3106,10 +3143,14 @@ static struct request *bfq_find_next_rq(struct bfq_=
data *bfqd,
 	return bfq_choose_req(bfqd, next, prev, blk_rq_pos(last));
 }
 =

+/* see the definition of bfq_async_charge_factor for details */
 static unsigned long bfq_serv_to_charge(struct request *rq,
 					struct bfq_queue *bfqq)
 {
-	return blk_rq_sectors(rq);
+	if (bfq_bfqq_sync(bfqq))
+		return blk_rq_sectors(rq);
+
+	return blk_rq_sectors(rq) * bfq_async_charge_factor;
 }
 =

 /**
@@ -3918,7 +3959,6 @@ static bool bfq_update_peak_rate(struct bfq_data *bfq=
d, struct bfq_queue *bfqq,
 				 bool compensate, enum bfqq_expiration reason,
 				 unsigned long *delta_ms)
 {
-	u64 expected;
 	u64 bw, bwdiv10, delta_usecs, delta_ms_tmp;
 	ktime_t delta_ktime;
 	int update =3D 0;
@@ -4003,28 +4043,19 @@ static bool bfq_update_peak_rate(struct bfq_data *b=
fqd, struct bfq_queue *bfqq,
 			bfq_log(bfqd, "new max_budget =3D %d",
 				bfqd->bfq_max_budget);
 		}
+		/*
+		 * Caveat: processes doing IO in the slower disk zones
+		 * tend to be slow(er) even if not seeky. In this
+		 * respect, the estimated peak rate is likely to be an
+		 * average over the disk surface. Accordingly, to not
+		 * be too harsh with unlucky processes, a process is
+		 * deemed slow only if its bw has been lower than half
+		 * of the estimated peak rate.
+		 */
+		slow =3D bw < bfqd->peak_rate / 2;
 	}
 =

-	/*
-	 * A process is considered ``slow'' (i.e., seeky, so that we
-	 * cannot treat it fairly in the service domain, as it would
-	 * slow down too much the other processes) if, when a slice
-	 * ends for whatever reason, it has received service at a
-	 * rate that would not be high enough to complete the budget
-	 * before the budget timeout expiration.
-	 */
-	expected =3D bw * 1000 * jiffies_to_msecs(bfqd->bfq_timeout)
-		>> BFQ_RATE_SHIFT;
-
-	/*
-	 * Caveat: processes doing IO in the slower disk zones will
-	 * tend to be slow(er) even if not seeky. And the estimated
-	 * peak rate will actually be an average over the disk
-	 * surface. Hence, to not be too harsh with unlucky processes,
-	 * we keep a budget/3 margin of safety before declaring a
-	 * process slow.
-	 */
-	return expected > (4 * bfqq->entity.budget) / 3;
+	return slow;
 }
 =

 /*
@@ -4043,28 +4074,24 @@ static unsigned long bfq_smallest_from_now(void)
  * @compensate: if true, compensate for the time spent idling.
  * @reason: the reason causing the expiration.
  *
+ * If the process associated with bfqq does slow I/O (e.g., because it
+ * issues random requests), we charge bfqq with the time it has been
+ * in service instead of the service it has received (see
+ * bfq_bfqq_charge_time for details on how this goal is achieved). As
+ * a consequence, bfqq will typically get higher timestamps upon
+ * reactivation, and hence it will be rescheduled as if it had
+ * received more service than what it has actually received. In the
+ * end, bfqq receives less service in proportion to how slowly its
+ * associated process consumes its budgets (and hence how seriously it
+ * tends to lower the throughput). In addition, this time-charging
+ * strategy guarantees time fairness among slow processes. In
+ * contrast, if the process associated with bfqq is not slow, we
+ * charge bfqq exactly with the service it has received.
  *
- * If the process associated with the queue is slow (i.e., seeky), or
- * in case of budget timeout, or, finally, if it is async, we
- * artificially charge it an entire budget (independently of the
- * actual service it received). As a consequence, the queue will get
- * higher timestamps than the correct ones upon reactivation, and
- * hence it will be rescheduled as if it had received more service
- * than what it actually received. In the end, this class of processes
- * will receive less service in proportion to how slowly they consume
- * their budgets (and hence how seriously they tend to lower the
- * throughput).
- *
- * In contrast, when a queue expires because it has been idling for
- * too much or because it exhausted its budget, we do not touch the
- * amount of service it has received. Hence when the queue will be
- * reactivated and its timestamps updated, the latter will be in sync
- * with the actual service received by the queue until expiration.
- *
- * Charging a full budget to the first type of queues and the exact
- * service to the others has the effect of using the WF2Q+ policy to
- * schedule the former on a timeslice basis, without violating the
- * service domain guarantees of the latter.
+ * Charging time to the first type of queues and the exact service to
+ * the other has the effect of using the WF2Q+ policy to schedule the
+ * former on a timeslice basis, without violating service domain
+ * guarantees among the latter.
  */
 static void bfq_bfqq_expire(struct bfq_data *bfqd,
 			    struct bfq_queue *bfqq,
@@ -4082,11 +4109,24 @@ static void bfq_bfqq_expire(struct bfq_data *bfqd,
 	slow =3D bfq_update_peak_rate(bfqd, bfqq, compensate, reason, &delta);
 =

 	/*
-	 * As above explained, 'punish' slow (i.e., seeky), timed-out
-	 * and async queues, to favor sequential sync workloads.
+	 * As above explained, charge slow (typically seeky) and
+	 * timed-out queues with the time and not the service
+	 * received, to favor sequential workloads.
+	 *
+	 * Processes doing I/O in the slower disk zones will tend to
+	 * be slow(er) even if not seeky. Therefore, since the
+	 * estimated peak rate is actually an average over the disk
+	 * surface, these processes may timeout just for bad luck. To
+	 * avoid punishing them, do not charge time to processes that
+	 * succeeded in consuming at least 2/3 of their budget. This
+	 * allows BFQ to preserve enough elasticity to still perform
+	 * bandwidth, and not time, distribution with little unlucky
+	 * or quasi-sequential processes.
 	 */
-	if (slow || reason =3D=3D BFQ_BFQQ_BUDGET_TIMEOUT)
-		bfq_bfqq_charge_full_budget(bfqq);
+	if (slow ||
+	    (reason =3D=3D BFQ_BFQQ_BUDGET_TIMEOUT &&
+	     bfq_bfqq_budget_left(bfqq) >=3D  entity->budget / 3))
+		bfq_bfqq_charge_time(bfqd, bfqq, delta);
 =

 	if (reason =3D=3D BFQ_BFQQ_TOO_IDLE &&
 	    entity->service <=3D 2 * entity->budget / 10)
-- =

1.9.1


--===============2900967877050902061==--

