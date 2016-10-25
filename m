Content-Type: multipart/mixed; boundary="===============4250856586882401218=="
MIME-Version: 1.0
From: Paolo Valente <paolo.valente@linaro.org>
To: lkp@lists.01.org
Subject: [PATCH 13/14] block, bfq: boost the throughput with random I/O on NCQ-capable HDDs
Date: Tue, 25 Oct 2016 10:48:39 +0200
Message-ID: <20161025084840.30260-14-paolo.valente@linaro.org>
In-Reply-To: <20161025084840.30260-1-paolo.valente@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4250856586882401218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch is basically the counterpart, for NCQ-capable rotational
devices, of the previous patch. Exactly as the previous patch does on
flash-based devices and for any workload, this patch disables device
idling on rotational devices, but only for random I/O. In fact, only
with these queues disabling idling boosts the throughput on
NCQ-capable rotational devices. To not break service guarantees,
idling is disabled for NCQ-enabled rotational devices only when the
same symmetry conditions considered in the previous patches hold.

Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
Signed-off-by: Arianna Avanzini <avanzini.arianna@gmail.com>
---
 block/bfq-iosched.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/block/bfq-iosched.c b/block/bfq-iosched.c
index 798699dd..e528346 100644
--- a/block/bfq-iosched.c
+++ b/block/bfq-iosched.c
@@ -37,7 +37,9 @@
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
@@ -5902,20 +5904,15 @@ static bool bfq_bfqq_may_idle(struct bfq_queue *bfq=
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
@@ -5923,7 +5920,8 @@ static bool bfq_bfqq_may_idle(struct bfq_queue *bfqq)
 	 * device.
 	 */
 	idling_boosts_thr =3D !bfqd->hw_tag ||
-		(!blk_queue_nonrot(bfqd->queue) && bfq_bfqq_IO_bound(bfqq));
+		(!blk_queue_nonrot(bfqd->queue) && bfq_bfqq_IO_bound(bfqq) &&
+		 bfq_bfqq_idle_window(bfqq));
 =

 	/*
 	 * The value of the next variable,
@@ -7740,7 +7738,7 @@ static struct blkcg_policy blkcg_policy_bfq =3D {
 static int __init bfq_init(void)
 {
 	int ret;
-	char msg[50] =3D "BFQ I/O-scheduler: v6";
+	char msg[50] =3D "BFQ I/O-scheduler: v7r3";
 =

 #ifdef CONFIG_BFQ_GROUP_IOSCHED
 	ret =3D blkcg_policy_register(&blkcg_policy_bfq);
-- =

2.10.0


--===============4250856586882401218==--

