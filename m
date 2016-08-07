Content-Type: multipart/mixed; boundary="===============7768773052063487831=="
MIME-Version: 1.0
From: Paolo Valente <paolo.valente@linaro.org>
To: lkp@lists.01.org
Subject: [PATCH 16/22] block, bfq: preserve a low latency also with NCQ-capable drives
Date: Sun, 07 Aug 2016 20:12:16 +0200
Message-ID: <1470593542-11109-16-git-send-email-paolo.valente@linaro.org>
In-Reply-To: <1470593542-11109-1-git-send-email-paolo.valente@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7768773052063487831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I/O schedulers typically allow NCQ-capable drives to prefetch I/O
requests, as NCQ boosts the throughput exactly by prefetching and
internally reordering requests.

Unfortunately, as discussed in detail and shown experimentally in [1],
this may cause fairness and latency guarantees to be violated. The
main problem is that the internal scheduler of an NCQ-capable drive
may postpone the service of some unlucky (prefetched) requests as long
as it deems serving other requests more appropriate to boost the
throughput.

This patch addresses this issue by not disabling device idling for
weight-raised queues, even if the device supports NCQ. This allows BFQ
to start serving a new queue, and therefore allows the drive to
prefetch new requests, only after the idling timeout expires. At that
time, all the outstanding requests of the expired queue have been most
certainly served.

[1] P. Valente and M. Andreolini, "Improving Application
    Responsiveness with the BFQ Disk I/O Scheduler", Proceedings of
    the 5th Annual International Systems and Storage Conference
    (SYSTOR '12), June 2012.
    Slightly extended version:
    http://algogroup.unimore.it/people/paolo/disk_sched/bfq-v1-suite-
							results.pdf

Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
Signed-off-by: Arianna Avanzini <avanzini.arianna@gmail.com>
---
 block/cfq-iosched.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/cfq-iosched.c b/block/cfq-iosched.c
index cb876b6..cfd7bf7 100644
--- a/block/cfq-iosched.c
+++ b/block/cfq-iosched.c
@@ -5526,7 +5526,8 @@ static void bfq_update_idle_window(struct bfq_data *b=
fqd,
 =

 	if (atomic_read(&bic->icq.ioc->active_ref) =3D=3D 0 ||
 	    bfqd->bfq_slice_idle =3D=3D 0 ||
-		(bfqd->hw_tag && BFQQ_SEEKY(bfqq)))
+		(bfqd->hw_tag && BFQQ_SEEKY(bfqq) &&
+			bfqq->wr_coeff =3D=3D 1))
 		enable_idle =3D 0;
 	else if (bfq_sample_valid(bic->ttime.ttime_samples)) {
 		if (bic->ttime.ttime_mean > bfqd->bfq_slice_idle &&
-- =

1.9.1


--===============7768773052063487831==--

