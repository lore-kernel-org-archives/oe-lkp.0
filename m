Content-Type: multipart/mixed; boundary="===============3035773691927378635=="
MIME-Version: 1.0
From: Paolo Valente <paolo.valente@linaro.org>
To: lkp@lists.01.org
Subject: [PATCH 21/22] block, bfq: boost the throughput with random I/O on NCQ-capable HDDs
Date: Sun, 07 Aug 2016 20:12:21 +0200
Message-ID: <1470593542-11109-21-git-send-email-paolo.valente@linaro.org>
In-Reply-To: <1470593542-11109-1-git-send-email-paolo.valente@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3035773691927378635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch is basically the counterpart, for NCQ-capable rotational
devices, of the previous patch. Exactly as the previous patch does on
flash-based devices and for any workload, this patch disables device
idling on rotational devices, but only for random I/O. More precisely,
idling is disabled only for constantly-seeky queues. In fact, only
with these queues disabling idling boosts the throughput on
NCQ-capable rotational devices.

To not break service guarantees, idling is disabled for NCQ-enabled
rotational devices and constantly-seeky queues only when the same
symmetry conditions considered in the previous patches, plus an
additional one, hold. The additional condition is related to the fact
that this patch disables idling only for constantly-seeky queues. In
this respect, should idling be disabled for a constantly-seeky queue
while some other non-constantly-seeky queue has pending requests, the
latter queue would get more requests served, after being set as in
service, than the former. This differentiated treatment would cause a
deviation with respect to the desired throughput distribution (i.e.,
with respect to the throughput distribution corresponding to the
weights assigned to processes and groups of processes). For this
reason, the additional condition for disabling idling for a
constantly-seeky queue is that all queues with pending or in-flight
requests are constantly seeky.

Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
Signed-off-by: Arianna Avanzini <avanzini.arianna@gmail.com>
---
 block/cfq-iosched.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/block/cfq-iosched.c b/block/cfq-iosched.c
index 504eee7..c93b686 100644
--- a/block/cfq-iosched.c
+++ b/block/cfq-iosched.c
@@ -38,7 +38,9 @@
  * Even better for latency, BFQ explicitly privileges the I/O of two
  * classes of time-sensitive applications: interactive and soft
  * real-time. This feature enables BFQ to provide applications in
- * these classes with a very low latency.
+ * these classes with a very low latency. Finally, BFQ also features
+ * additional heuristics for preserving both a low latency and a high
+ * throughput on NCQ-capable, rotational or flash-based devices.
  *
  * With respect to the version of BFQ presented in [1], and in the
  * papers cited therein, this implementation adds a hierarchical
@@ -5663,20 +5665,15 @@ static bool bfq_bfqq_may_idle(struct bfq_queue *bfq=
q)
 	 * The next variable takes into account the cases where idling
 	 * boosts the throughput.
 	 *
-	 * The value of the variable is computed considering that
-	 * idling is usually beneficial for the throughput if:
+	 * The value of the variable is computed considering, first, that
+	 * idling is virtually always beneficial for the throughput if:
 	 * (a) the device is not NCQ-capable, or
 	 * (b) regardless of the presence of NCQ, the device is rotational
-	 *     and the request pattern for bfqq is I/O-bound (possible
-	 *     throughput losses caused by granting idling to seeky queues
-	 *     are mitigated by the fact that, in all scenarios where
-	 *     boosting throughput is the best thing to do, i.e., in all
-	 *     symmetric scenarios, only a minimal idle time is allowed to
-	 *     seeky queues).
+	 *     and the request pattern for bfqq is I/O-bound and sequential.
 	 *
 	 * Secondly, and in contrast to the above item (b), idling an
 	 * NCQ-capable flash-based device would not boost the
-	 * throughput even with intense I/O; rather it would lower
+	 * throughput even with sequential I/O; rather it would lower
 	 * the throughput in proportion to how fast the device
 	 * is. Accordingly, the next variable is true if any of the
 	 * above conditions (a) and (b) is true, and, in particular,
@@ -5684,7 +5681,8 @@ static bool bfq_bfqq_may_idle(struct bfq_queue *bfqq)
 	 * device.
 	 */
 	idling_boosts_thr =3D !bfqd->hw_tag ||
-		(!blk_queue_nonrot(bfqd->queue) && bfq_bfqq_IO_bound(bfqq));
+		(!blk_queue_nonrot(bfqd->queue) && bfq_bfqq_IO_bound(bfqq) &&
+		 bfq_bfqq_idle_window(bfqq));
 =

 	/*
 	 * The value of the next variable,
@@ -7521,7 +7519,7 @@ static int __init bfq_init(void)
 	if (ret)
 		goto err_pol_unreg;
 =

-	pr_info("BFQ I/O-scheduler: v6");
+	pr_info("BFQ I/O-scheduler: v7r3");
 =

 	return 0;
 =

-- =

1.9.1


--===============3035773691927378635==--

