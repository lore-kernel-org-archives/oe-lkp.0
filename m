Content-Type: multipart/mixed; boundary="===============1929655513986906114=="
MIME-Version: 1.0
From: Johannes Weiner <hannes@cmpxchg.org>
To: lkp@lists.01.org
Subject: Re: [mm] 795ae7a0de: pixz.throughput -9.1% regression
Date: Tue, 07 Jun 2016 17:56:27 -0400
Message-ID: <20160607215627.GA13614@cmpxchg.org>
In-Reply-To: <20160607044817.GC16057@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1929655513986906114==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 07, 2016 at 12:48:17PM +0800, Ye Xiaolong wrote:
> FYI, below is the comparison info between 3ed3a4f, 795ae7ay, v4.7-rc2 and=
 the
> revert commit (eaa7f0d).

Thanks for running this.

Alas, I still can not make heads or tails of this, or reproduce it
locally for that matter.

With this test run, there seems to be a significant increase in system time:

>      92.03 =C2=B1  0%      +5.6%      97.23 =C2=B1 11%     +30.5%     120=
.08 =C2=B1  1%     +30.0%     119.61 =C2=B1  0%  pixz.time.system_time

Would it be possible to profile the testruns using perf? Maybe we can
find out where the kernel is spending the extra time.

But just to make sure I'm looking at the right code, can you first try
the following patch on top of Linus's current tree and see if that
gets performance back to normal? It's a partial revert of the
watermarks that singles out the fair zone allocator:

>From 2015eaad688486d65fcf86185e213fff8506b3fe Mon Sep 17 00:00:00 2001
From: Johannes Weiner <hannes@cmpxchg.org>
Date: Tue, 7 Jun 2016 17:45:03 -0400
Subject: [PATCH] mm: revert fairness batching to before the watermarks were
 boosted

Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
---
 include/linux/mmzone.h | 2 ++
 mm/page_alloc.c        | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 02069c2..4565b92 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -327,6 +327,8 @@ struct zone {
 	/* zone watermarks, access with *_wmark_pages(zone) macros */
 	unsigned long watermark[NR_WMARK];
 =

+	unsigned long fairbatch;
+
 	unsigned long nr_reserved_highatomic;
 =

 	/*
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 6903b69..33387ab 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -2889,7 +2889,7 @@ static void reset_alloc_batches(struct zone *preferre=
d_zone)
 =

 	do {
 		mod_zone_page_state(zone, NR_ALLOC_BATCH,
-			high_wmark_pages(zone) - low_wmark_pages(zone) -
+			zone->fairbatch -
 			atomic_long_read(&zone->vm_stat[NR_ALLOC_BATCH]));
 		clear_bit(ZONE_FAIR_DEPLETED, &zone->flags);
 	} while (zone++ !=3D preferred_zone);
@@ -6842,6 +6842,8 @@ static void __setup_per_zone_wmarks(void)
 			zone->watermark[WMARK_MIN] =3D tmp;
 		}
 =

+		zone->fairbatch =3D tmp >> 2;
+
 		/*
 		 * Set the kswapd watermarks distance according to the
 		 * scale factor in proportion to available memory, but
@@ -6855,7 +6857,7 @@ static void __setup_per_zone_wmarks(void)
 		zone->watermark[WMARK_HIGH] =3D min_wmark_pages(zone) + tmp * 2;
 =

 		__mod_zone_page_state(zone, NR_ALLOC_BATCH,
-			high_wmark_pages(zone) - low_wmark_pages(zone) -
+			zone->fairbatch -
 			atomic_long_read(&zone->vm_stat[NR_ALLOC_BATCH]));
 =

 		spin_unlock_irqrestore(&zone->lock, flags);
-- =

2.8.2

--===============1929655513986906114==--

