Content-Type: multipart/mixed; boundary="===============8084402193176396291=="
MIME-Version: 1.0
From: Paolo Valente <paolo.valente@linaro.org>
To: lkp@lists.01.org
Subject: [PATCH 02/22] block, cfq: remove close-based preemption
Date: Sun, 07 Aug 2016 20:12:02 +0200
Message-ID: <1470593542-11109-2-git-send-email-paolo.valente@linaro.org>
In-Reply-To: <1470593542-11109-1-git-send-email-paolo.valente@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============8084402193176396291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Arianna Avanzini <avanzini.arianna@gmail.com>

CFQ may preempt the queue currently in service if a new request, for a
different queue, happens to be close to the last-dispatched
request. This boosts the throughput with processes that issue close
requests, but whose I/O patterns are not regularly interleaved enough
to trigger the activation of the queue-merging heuristic removed in
the previous commit. BFQ does not need to perform any such preemption,
because the queue-merging mechanism of BFQ (EQM) is reactive enough to
merge queues also in the presence of irregularly interleaved I/O.

Signed-off-by: Arianna Avanzini <avanzini.arianna@gmail.com>
Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
---
 block/cfq-iosched.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/block/cfq-iosched.c b/block/cfq-iosched.c
index e33ba94..668f649 100644
--- a/block/cfq-iosched.c
+++ b/block/cfq-iosched.c
@@ -2696,12 +2696,6 @@ static inline sector_t cfq_dist_from_last(struct cfq=
_data *cfqd,
 		return cfqd->last_position - blk_rq_pos(rq);
 }
 =

-static inline int cfq_rq_close(struct cfq_data *cfqd, struct cfq_queue *cf=
qq,
-			       struct request *rq)
-{
-	return cfq_dist_from_last(cfqd, rq) <=3D CFQQ_CLOSE_THR;
-}
-
 /*
  * Determine whether we should enforce idle window for this queue.
  */
@@ -3751,13 +3745,6 @@ cfq_should_preempt(struct cfq_data *cfqd, struct cfq=
_queue *new_cfqq,
 	if (!cfqd->active_cic || !cfq_cfqq_wait_request(cfqq))
 		return false;
 =

-	/*
-	 * if this request is as-good as one we would expect from the
-	 * current cfqq, let it preempt
-	 */
-	if (cfq_rq_close(cfqd, cfqq, rq))
-		return true;
-
 	return false;
 }
 =

-- =

1.9.1


--===============8084402193176396291==--

