Content-Type: multipart/mixed; boundary="===============5344732093476044041=="
MIME-Version: 1.0
From: Minchan Kim <minchan@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH v3] mm: fs: invalidate bh_lrus for only cold path
Date: Mon, 20 Sep 2021 15:33:45 -0700
Message-ID: <YUkMSftSkXeroAxl@google.com>
In-Reply-To: <20210907212347.1977686-1-minchan@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5344732093476044041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Andrew, Could you take a look?

On Tue, Sep 07, 2021 at 02:23:47PM -0700, Minchan Kim wrote:
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

> [1] https://lore.kernel.org/lkml/20210520083144.GD14190(a)xsang-OptiPlex-=
9020/
> [2] 8cc621d2f45d, mm: fs: invalidate BH LRU during page migration
> Reviewed-by: Chris Goldsworthy <cgoldswo@codeaurora.org>
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Signed-off-by: Minchan Kim <minchan@kernel.org>
> ---
> * v2: https://lore.kernel.org/lkml/20210601145425.1396981-1-minchan(a)ker=
nel.org/
> * v1: https://lore.kernel.org/lkml/YK0oQ76zX0uVZCwQ(a)google.com/
>  fs/buffer.c                 |  8 ++++++--
>  include/linux/buffer_head.h |  4 ++--
>  mm/swap.c                   | 19 ++++++++++++++++---
>  3 files changed, 24 insertions(+), 7 deletions(-)
> =

> diff --git a/fs/buffer.c b/fs/buffer.c
> index ab7573d72dd7..c615387aedca 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -1425,12 +1425,16 @@ void invalidate_bh_lrus(void)
>  }
>  EXPORT_SYMBOL_GPL(invalidate_bh_lrus);
>  =

> -void invalidate_bh_lrus_cpu(int cpu)
> +/*
> + * It's called from workqueue context so we need a bh_lru_lock to close
> + * the race with preemption/irq.
> + */
> +void invalidate_bh_lrus_cpu(void)
>  {
>  	struct bh_lru *b;
>  =

>  	bh_lru_lock();
> -	b =3D per_cpu_ptr(&bh_lrus, cpu);
> +	b =3D this_cpu_ptr(&bh_lrus);
>  	__invalidate_bh_lrus(b);
>  	bh_lru_unlock();
>  }
> diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
> index 6486d3c19463..36f33685c8c0 100644
> --- a/include/linux/buffer_head.h
> +++ b/include/linux/buffer_head.h
> @@ -194,7 +194,7 @@ void __breadahead_gfp(struct block_device *, sector_t=
 block, unsigned int size,
>  struct buffer_head *__bread_gfp(struct block_device *,
>  				sector_t block, unsigned size, gfp_t gfp);
>  void invalidate_bh_lrus(void);
> -void invalidate_bh_lrus_cpu(int cpu);
> +void invalidate_bh_lrus_cpu(void);
>  bool has_bh_in_lru(int cpu, void *dummy);
>  struct buffer_head *alloc_buffer_head(gfp_t gfp_flags);
>  void free_buffer_head(struct buffer_head * bh);
> @@ -408,7 +408,7 @@ static inline int inode_has_buffers(struct inode *ino=
de) { return 0; }
>  static inline void invalidate_inode_buffers(struct inode *inode) {}
>  static inline int remove_inode_buffers(struct inode *inode) { return 1; }
>  static inline int sync_mapping_buffers(struct address_space *mapping) { =
return 0; }
> -static inline void invalidate_bh_lrus_cpu(int cpu) {}
> +static inline void invalidate_bh_lrus_cpu(void) {}
>  static inline bool has_bh_in_lru(int cpu, void *dummy) { return false; }
>  #define buffer_heads_over_limit 0
>  =

> diff --git a/mm/swap.c b/mm/swap.c
> index 897200d27dd0..af3cad4e5378 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -620,7 +620,6 @@ void lru_add_drain_cpu(int cpu)
>  		pagevec_lru_move_fn(pvec, lru_lazyfree_fn);
>  =

>  	activate_page_drain(cpu);
> -	invalidate_bh_lrus_cpu(cpu);
>  }
>  =

>  /**
> @@ -703,6 +702,20 @@ void lru_add_drain(void)
>  	local_unlock(&lru_pvecs.lock);
>  }
>  =

> +/*
> + * It's called from per-cpu workqueue context in SMP case so
> + * lru_add_drain_cpu and invalidate_bh_lrus_cpu should run on
> + * the same cpu. It shouldn't be a problem in !SMP case since
> + * the core is only one and the locks will disable preemption.
> + */
> +static void lru_add_and_bh_lrus_drain(void)
> +{
> +	local_lock(&lru_pvecs.lock);
> +	lru_add_drain_cpu(smp_processor_id());
> +	local_unlock(&lru_pvecs.lock);
> +	invalidate_bh_lrus_cpu();
> +}
> +
>  void lru_add_drain_cpu_zone(struct zone *zone)
>  {
>  	local_lock(&lru_pvecs.lock);
> @@ -717,7 +730,7 @@ static DEFINE_PER_CPU(struct work_struct, lru_add_dra=
in_work);
>  =

>  static void lru_add_drain_per_cpu(struct work_struct *dummy)
>  {
> -	lru_add_drain();
> +	lru_add_and_bh_lrus_drain();
>  }
>  =

>  /*
> @@ -858,7 +871,7 @@ void lru_cache_disable(void)
>  	 */
>  	__lru_add_drain_all(true);
>  #else
> -	lru_add_drain();
> +	lru_add_and_bh_lrus_drain();
>  #endif
>  }
>  =

> -- =

> 2.33.0.309.g3052b89438-goog
>=20
--===============5344732093476044041==--

