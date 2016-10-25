Content-Type: multipart/mixed; boundary="===============7214634967820875306=="
MIME-Version: 1.0
From: Paolo Valente <paolo.valente@linaro.org>
To: lkp@lists.01.org
Subject: [PATCH 08/14] block, bfq: preserve a low latency also with NCQ-capable drives
Date: Tue, 25 Oct 2016 10:48:34 +0200
Message-ID: <20161025084840.30260-9-paolo.valente@linaro.org>
In-Reply-To: <20161025084840.30260-1-paolo.valente@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7214634967820875306==
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
 block/bfq-iosched.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/bfq-iosched.c b/block/bfq-iosched.c
index d9b0900..3b11772 100644
--- a/block/bfq-iosched.c
+++ b/block/bfq-iosched.c
@@ -5746,7 +5746,8 @@ static void bfq_update_idle_window(struct bfq_data *b=
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

2.10.0


--===============7214634967820875306==--

