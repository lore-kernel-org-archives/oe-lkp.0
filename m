Content-Type: multipart/mixed; boundary="===============8827420540310609039=="
MIME-Version: 1.0
From: Chris Goldsworthy <cgoldswo@codeaurora.org>
To: lkp@lists.01.org
Subject: Re: [mm] 8cc621d2f4: fio.write_iops -21.8% regression
Date: Tue, 07 Sep 2021 11:46:02 -0700
Message-ID: <d4902ba55d51c5b4a7b9e01414391f0d@codeaurora.org>
In-Reply-To: <YTeZm71hmcbJp+E2@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8827420540310609039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021-09-07 09:55, Minchan Kim wrote:
> Hi,
> =

> On Fri, Sep 03, 2021 at 03:11:33PM +0800, Xing, Zhengjun wrote:
>> Hi Minchan,
>> =

>> =C2=A0=C2=A0=C2=A0 Do you have time to look at this? I re-test it in=C2=
=A0 v5.14, the =

>> regression
>> still existed. Thanks.
> =

> Reminding me the issue, again, Xing. That's because the patch
> was not merged yet so let me send it again.
> =

> Andrew?
> =

> From 8caadeb49d82403a08643dfbdb0b7749017c00bb Mon Sep 17 00:00:00 2001
> From: Minchan Kim <minchan@kernel.org>
> Date: Tue, 25 May 2021 08:19:17 -0700
> Subject: [PATCH] mm: fs: invalidate bh_lrus for only cold path
> =

> kernel test robot reported the regression of fio.write_iops[1]
> with [2].
> =

> Since lru_add_drain is called frequently, invalidate bh_lrus
> there could increase bh_lrus cache miss ratio, which needs
> more IO in the end.
> =

> This patch moves the bh_lrus invalidation from the hot path(
> e.g., zap_page_range, pagevec_release) to cold path(i.e.,
> lru_add_drain_all, lru_cache_disable).
> =

> [1] =

> https://lore.kernel.org/lkml/20210520083144.GD14190(a)xsang-OptiPlex-9020/
> [2] 8cc621d2f45d, mm: fs: invalidate BH LRU during page migration
> Cc: Xing, Zhengjun <zhengjun.xing@intel.com>
> Reviewed-by: Chris Goldsworthy <cgoldswo@codeaurora.org>
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Signed-off-by: Minchan Kim <minchan@kernel.org>
> ---
>  mm/swap.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> =

> diff --git a/mm/swap.c b/mm/swap.c
> index 1958d5feb148..3e25d99a9dbb 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -642,7 +642,6 @@ void lru_add_drain_cpu(int cpu)
>  		pagevec_lru_move_fn(pvec, lru_lazyfree_fn);
> =

>  	activate_page_drain(cpu);
> -	invalidate_bh_lrus_cpu(cpu);
>  }
> =

>  /**
> @@ -725,6 +724,17 @@ void lru_add_drain(void)
>  	local_unlock(&lru_pvecs.lock);
>  }
> =

> +static void lru_add_and_bh_lrus_drain(void)
> +{
> +	int cpu;
> +
> +	local_lock(&lru_pvecs.lock);
> +	cpu =3D smp_processor_id();
> +	lru_add_drain_cpu(cpu);
> +	local_unlock(&lru_pvecs.lock);
> +	invalidate_bh_lrus_cpu(cpu);
> +}
> +
>  void lru_add_drain_cpu_zone(struct zone *zone)
>  {
>  	local_lock(&lru_pvecs.lock);
> @@ -739,7 +749,7 @@ static DEFINE_PER_CPU(struct work_struct,
> lru_add_drain_work);
> =

>  static void lru_add_drain_per_cpu(struct work_struct *dummy)
>  {
> -	lru_add_drain();
> +	lru_add_and_bh_lrus_drain();
>  }
> =

>  /*
> @@ -880,7 +890,7 @@ void lru_cache_disable(void)
>  	 */
>  	__lru_add_drain_all(true);
>  #else
> -	lru_add_drain();
> +	lru_add_and_bh_lrus_drain();
>  #endif
>  }
> =

> --
> 2.31.1.818.g46aad6cb9e-goog

Hi Minchan,

I believe that was the first iteration of your patch - there was some =

further feedback, such that this was the last version you submitted:

 From 8d58e7ade3ed6c080995dec1395b1e130b3d16b3 Mon Sep 17 00:00:00 2001
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

[1] =

https://lore.kernel.org/lkml/20210520083144.GD14190(a)xsang-OptiPlex-9020/
[2] 8cc621d2f45d, mm: fs: invalidate BH LRU during page migration
Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Minchan Kim <minchan@kernel.org>
---
  fs/buffer.c                 |  8 ++++++--
  include/linux/buffer_head.h |  4 ++--
  mm/swap.c                   | 19 ++++++++++++++++---
  3 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 673cfbef9eec..bdaffed39030 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -1487,12 +1487,16 @@ void invalidate_bh_lrus(void)
  }
  EXPORT_SYMBOL_GPL(invalidate_bh_lrus);

-void invalidate_bh_lrus_cpu(int cpu)
+/*
+ * It's called from workqueue context so we need a bh_lru_lock to close
+ * the race with preemption/irq.
+ */
+void invalidate_bh_lrus_cpu(void)
  {
      struct bh_lru *b;

      bh_lru_lock();
-    b =3D per_cpu_ptr(&bh_lrus, cpu);
+    b =3D this_cpu_ptr(&bh_lrus);
      __invalidate_bh_lrus(b);
      bh_lru_unlock();
  }
diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
index e7e99da31349..b04d34bab124 100644
--- a/include/linux/buffer_head.h
+++ b/include/linux/buffer_head.h
@@ -194,7 +194,7 @@ void __breadahead_gfp(struct block_device *,
sector_t block, unsigned int size,
  struct buffer_head *__bread_gfp(struct block_device *,
                  sector_t block, unsigned size, gfp_t gfp);
  void invalidate_bh_lrus(void);
-void invalidate_bh_lrus_cpu(int cpu);
+void invalidate_bh_lrus_cpu(void);
  bool has_bh_in_lru(int cpu, void *dummy);
  struct buffer_head *alloc_buffer_head(gfp_t gfp_flags);
  void free_buffer_head(struct buffer_head * bh);
@@ -408,7 +408,7 @@ static inline int inode_has_buffers(struct inode
*inode) { return 0; }
  static inline void invalidate_inode_buffers(struct inode *inode) {}
  static inline int remove_inode_buffers(struct inode *inode) { return 1; =

}
  static inline int sync_mapping_buffers(struct address_space *mapping)
{ return 0; }
-static inline void invalidate_bh_lrus_cpu(int cpu) {}
+static inline void invalidate_bh_lrus_cpu(void) {}
  static inline bool has_bh_in_lru(int cpu, void *dummy) { return 0; }
  #define buffer_heads_over_limit 0

diff --git a/mm/swap.c b/mm/swap.c
index 1958d5feb148..4d9ec3c3c5a9 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -642,7 +642,6 @@ void lru_add_drain_cpu(int cpu)
          pagevec_lru_move_fn(pvec, lru_lazyfree_fn);

      activate_page_drain(cpu);
-    invalidate_bh_lrus_cpu(cpu);
  }

  /**
@@ -725,6 +724,20 @@ void lru_add_drain(void)
      local_unlock(&lru_pvecs.lock);
  }

+/*
+ * It's called from per-cpu workqueue context in SMP case so
+ * lru_add_drain_cpu and invalidate_bh_lrus_cpu should run on
+ * the same cpu. It shouldn't be a problem in !SMP case since
+ * the core is only one and the locks will disable preemption.
+ */
+static void lru_add_and_bh_lrus_drain(void)
+{
+    local_lock(&lru_pvecs.lock);
+    lru_add_drain_cpu(smp_processor_id());
+    local_unlock(&lru_pvecs.lock);
+    invalidate_bh_lrus_cpu();
+}
+
  void lru_add_drain_cpu_zone(struct zone *zone)
  {
      local_lock(&lru_pvecs.lock);
@@ -739,7 +752,7 @@ static DEFINE_PER_CPU(struct work_struct,
lru_add_drain_work);

  static void lru_add_drain_per_cpu(struct work_struct *dummy)
  {
-    lru_add_drain();
+    lru_add_and_bh_lrus_drain();
  }

  /*
@@ -880,7 +893,7 @@ void lru_cache_disable(void)
       */
      __lru_add_drain_all(true);
  #else
-    lru_add_drain();
+    lru_add_and_bh_lrus_drain();
  #endif
  }

-- =

The Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora =

Forum,
a Linux Foundation Collaborative Project
--===============8827420540310609039==--

