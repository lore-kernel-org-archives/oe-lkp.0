Content-Type: multipart/mixed; boundary="===============5140351273499893115=="
MIME-Version: 1.0
From: Minchan Kim <minchan@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] 8cc621d2f4: fio.write_iops -21.8% regression
Date: Tue, 07 Sep 2021 09:55:55 -0700
Message-ID: <YTeZm71hmcbJp+E2@google.com>
In-Reply-To: <034fc860-d0d0-0c61-09d2-3c41c4f020c6@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5140351273499893115==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 03, 2021 at 03:11:33PM +0800, Xing, Zhengjun wrote:
> Hi Minchan,
> =

> =C2=A0=C2=A0=C2=A0 Do you have time to look at this? I re-test it in=C2=
=A0 v5.14, the regression
> still existed. Thanks.

Reminding me the issue, again, Xing. That's because the patch
was not merged yet so let me send it again.

Andrew?

>From 8caadeb49d82403a08643dfbdb0b7749017c00bb Mon Sep 17 00:00:00 2001
From: Minchan Kim <minchan@kernel.org>
Date: Tue, 25 May 2021 08:19:17 -0700
Subject: [PATCH] mm: fs: invalidate bh_lrus for only cold path

kernel test robot reported the regression of fio.write_iops[1]
with [2].

Since lru_add_drain is called frequently, invalidate bh_lrus
there could increase bh_lrus cache miss ratio, which needs
more IO in the end.

This patch moves the bh_lrus invalidation from the hot path(
e.g., zap_page_range, pagevec_release) to cold path(i.e.,
lru_add_drain_all, lru_cache_disable).

[1] https://lore.kernel.org/lkml/20210520083144.GD14190(a)xsang-OptiPlex-90=
20/
[2] 8cc621d2f45d, mm: fs: invalidate BH LRU during page migration
Cc: Xing, Zhengjun <zhengjun.xing@intel.com>
Reviewed-by: Chris Goldsworthy <cgoldswo@codeaurora.org>
Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Minchan Kim <minchan@kernel.org>
---
 mm/swap.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/mm/swap.c b/mm/swap.c
index 1958d5feb148..3e25d99a9dbb 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -642,7 +642,6 @@ void lru_add_drain_cpu(int cpu)
 		pagevec_lru_move_fn(pvec, lru_lazyfree_fn);

 	activate_page_drain(cpu);
-	invalidate_bh_lrus_cpu(cpu);
 }

 /**
@@ -725,6 +724,17 @@ void lru_add_drain(void)
 	local_unlock(&lru_pvecs.lock);
 }

+static void lru_add_and_bh_lrus_drain(void)
+{
+	int cpu;
+
+	local_lock(&lru_pvecs.lock);
+	cpu =3D smp_processor_id();
+	lru_add_drain_cpu(cpu);
+	local_unlock(&lru_pvecs.lock);
+	invalidate_bh_lrus_cpu(cpu);
+}
+
 void lru_add_drain_cpu_zone(struct zone *zone)
 {
 	local_lock(&lru_pvecs.lock);
@@ -739,7 +749,7 @@ static DEFINE_PER_CPU(struct work_struct, lru_add_drain=
_work);

 static void lru_add_drain_per_cpu(struct work_struct *dummy)
 {
-	lru_add_drain();
+	lru_add_and_bh_lrus_drain();
 }

 /*
@@ -880,7 +890,7 @@ void lru_cache_disable(void)
 	 */
 	__lru_add_drain_all(true);
 #else
-	lru_add_drain();
+	lru_add_and_bh_lrus_drain();
 #endif
 }

--
2.31.1.818.g46aad6cb9e-goog

--===============5140351273499893115==--

