Content-Type: multipart/mixed; boundary="===============7822812917327945588=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 3484b2de949: -46.2% aim7.jobs-per-min
Date: Sat, 28 Feb 2015 15:57:24 +0800
Message-ID: <1425110244.10337.90.camel@linux.intel.com>
In-Reply-To: <20150227115304.GF3087@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============7822812917327945588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2015-02-27 at 11:53 +0000, Mel Gorman wrote:
> On Fri, Feb 27, 2015 at 03:21:36PM +0800, Huang Ying wrote:
> > FYI, we noticed the below changes on
> > =

> > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > commit 3484b2de9499df23c4604a513b36f96326ae81ad ("mm: rearrange zone fi=
elds into read-only, page alloc, statistics and page reclaim lines")
> > =

> > The perf cpu-cycles for spinlock (zone->lock) increased a lot.  I suspe=
ct there are some cache ping-pong or false sharing.
> > =

> =

> Annoying because this is pretty much the opposite of what I found during
> testing. What is the kernel config? Similar to the kernel config, can you
> post "pahole -C zone vmlinux" for the kernel you built? I should get the =
same
> result if I use the same kernel config but no harm in being sure. Thanks.

The output of pahole -C zone vmlinux for the kernels are as below.

Best Regards,
Huang, Ying

3484b2de94
-------------------------------------------------------
struct zone {
	long unsigned int          watermark[3];         /*     0    24 */
	long int                   lowmem_reserve[4];    /*    24    32 */
	int                        node;                 /*    56     4 */
	unsigned int               inactive_ratio;       /*    60     4 */
	/* --- cacheline 1 boundary (64 bytes) --- */
	struct pglist_data *       zone_pgdat;           /*    64     8 */
	struct per_cpu_pageset *   pageset;              /*    72     8 */
	long unsigned int          dirty_balance_reserve; /*    80     8 */
	long unsigned int          min_unmapped_pages;   /*    88     8 */
	long unsigned int          min_slab_pages;       /*    96     8 */
	long unsigned int          zone_start_pfn;       /*   104     8 */
	long unsigned int          managed_pages;        /*   112     8 */
	long unsigned int          spanned_pages;        /*   120     8 */
	/* --- cacheline 2 boundary (128 bytes) --- */
	long unsigned int          present_pages;        /*   128     8 */
	const char  *              name;                 /*   136     8 */
	int                        nr_migrate_reserve_block; /*   144     4 */
	seqlock_t                  span_seqlock;         /*   148     8 */

	/* XXX 4 bytes hole, try to pack */

	wait_queue_head_t *        wait_table;           /*   160     8 */
	long unsigned int          wait_table_hash_nr_entries; /*   168     8 */
	long unsigned int          wait_table_bits;      /*   176     8 */

	/* XXX 8 bytes hole, try to pack */

	/* --- cacheline 3 boundary (192 bytes) --- */
	struct zone_padding        _pad1_;               /*   192     0 */
	spinlock_t                 lock;                 /*   192     4 */

	/* XXX 4 bytes hole, try to pack */

	struct free_area           free_area[11];        /*   200   968 */
	/* --- cacheline 18 boundary (1152 bytes) was 16 bytes ago --- */
	long unsigned int          flags;                /*  1168     8 */

	/* XXX 40 bytes hole, try to pack */

	/* --- cacheline 19 boundary (1216 bytes) --- */
	struct zone_padding        _pad2_;               /*  1216     0 */
	spinlock_t                 lru_lock;             /*  1216     4 */

	/* XXX 4 bytes hole, try to pack */

	long unsigned int          pages_scanned;        /*  1224     8 */
	struct lruvec              lruvec;               /*  1232   120 */
	/* --- cacheline 21 boundary (1344 bytes) was 8 bytes ago --- */
	atomic_long_t              inactive_age;         /*  1352     8 */
	long unsigned int          percpu_drift_mark;    /*  1360     8 */
	long unsigned int          compact_cached_free_pfn; /*  1368     8 */
	long unsigned int          compact_cached_migrate_pfn[2]; /*  1376    16 */
	unsigned int               compact_considered;   /*  1392     4 */
	unsigned int               compact_defer_shift;  /*  1396     4 */
	int                        compact_order_failed; /*  1400     4 */
	bool                       compact_blockskip_flush; /*  1404     1 */

	/* XXX 3 bytes hole, try to pack */

	/* --- cacheline 22 boundary (1408 bytes) --- */
	struct zone_padding        _pad3_;               /*  1408     0 */
	atomic_long_t              vm_stat[38];          /*  1408   304 */
	/* --- cacheline 26 boundary (1664 bytes) was 48 bytes ago --- */

	/* size: 1728, cachelines: 27, members: 37 */
	/* sum members: 1649, holes: 6, sum holes: 63 */
	/* padding: 16 */
};

24b7e5819a
---------------------------------------------------------------
struct zone {
	long unsigned int          watermark[3];         /*     0    24 */
	long unsigned int          percpu_drift_mark;    /*    24     8 */
	long unsigned int          lowmem_reserve[4];    /*    32    32 */
	/* --- cacheline 1 boundary (64 bytes) --- */
	long unsigned int          dirty_balance_reserve; /*    64     8 */
	int                        node;                 /*    72     4 */

	/* XXX 4 bytes hole, try to pack */

	long unsigned int          min_unmapped_pages;   /*    80     8 */
	long unsigned int          min_slab_pages;       /*    88     8 */
	struct per_cpu_pageset *   pageset;              /*    96     8 */
	spinlock_t                 lock;                 /*   104     4 */
	bool                       compact_blockskip_flush; /*   108     1 */

	/* XXX 3 bytes hole, try to pack */

	long unsigned int          compact_cached_free_pfn; /*   112     8 */
	long unsigned int          compact_cached_migrate_pfn[2]; /*   120    16 */
	/* --- cacheline 2 boundary (128 bytes) was 8 bytes ago --- */
	seqlock_t                  span_seqlock;         /*   136     8 */
	struct free_area           free_area[11];        /*   144   968 */
	/* --- cacheline 17 boundary (1088 bytes) was 24 bytes ago --- */
	unsigned int               compact_considered;   /*  1112     4 */
	unsigned int               compact_defer_shift;  /*  1116     4 */
	int                        compact_order_failed; /*  1120     4 */

	/* XXX 28 bytes hole, try to pack */

	/* --- cacheline 18 boundary (1152 bytes) --- */
	struct zone_padding        _pad1_;               /*  1152     0 */
	spinlock_t                 lru_lock;             /*  1152     4 */

	/* XXX 4 bytes hole, try to pack */

	struct lruvec              lruvec;               /*  1160   120 */
	/* --- cacheline 20 boundary (1280 bytes) --- */
	atomic_long_t              inactive_age;         /*  1280     8 */
	long unsigned int          pages_scanned;        /*  1288     8 */
	long unsigned int          flags;                /*  1296     8 */
	atomic_long_t              vm_stat[38];          /*  1304   304 */
	/* --- cacheline 25 boundary (1600 bytes) was 8 bytes ago --- */
	unsigned int               inactive_ratio;       /*  1608     4 */

	/* XXX 52 bytes hole, try to pack */

	/* --- cacheline 26 boundary (1664 bytes) --- */
	struct zone_padding        _pad2_;               /*  1664     0 */
	wait_queue_head_t *        wait_table;           /*  1664     8 */
	long unsigned int          wait_table_hash_nr_entries; /*  1672     8 */
	long unsigned int          wait_table_bits;      /*  1680     8 */
	struct pglist_data *       zone_pgdat;           /*  1688     8 */
	long unsigned int          zone_start_pfn;       /*  1696     8 */
	long unsigned int          spanned_pages;        /*  1704     8 */
	long unsigned int          present_pages;        /*  1712     8 */
	long unsigned int          managed_pages;        /*  1720     8 */
	/* --- cacheline 27 boundary (1728 bytes) --- */
	int                        nr_migrate_reserve_block; /*  1728     4 */

	/* XXX 4 bytes hole, try to pack */

	const char  *              name;                 /*  1736     8 */

	/* size: 1792, cachelines: 28, members: 36 */
	/* sum members: 1649, holes: 6, sum holes: 95 */
	/* padding: 48 */
};



--===============7822812917327945588==--

