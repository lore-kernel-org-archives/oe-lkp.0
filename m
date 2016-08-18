Content-Type: multipart/mixed; boundary="===============8257808696782492220=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 18 Aug 2016 17:11:11 +1000
Message-ID: <20160818071111.GD22388@dastard>
In-Reply-To: <20160818004517.GJ8119@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============8257808696782492220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2016 at 01:45:17AM +0100, Mel Gorman wrote:
> On Wed, Aug 17, 2016 at 04:49:07PM +0100, Mel Gorman wrote:
> > > Yes, we could try to batch the locking like DaveC already suggested
> > > (ie we could move the locking to the caller, and then make
> > > shrink_page_list() just try to keep the lock held for a few pages if
> > > the mapping doesn't change), and that might result in fewer crazy
> > > cacheline ping-pongs overall. But that feels like exactly the wrong
> > > kind of workaround.
> > > =

> > =

> > Even if such batching was implemented, it would be very specific to the
> > case of a single large file filling LRUs on multiple nodes.
> > =

> =

> The latest Jason Bourne movie was sufficiently bad that I spent time
> thinking how the tree_lock could be batched during reclaim. It's not
> straight-forward but this prototype did not blow up on UMA and may be
> worth considering if Dave can test either approach has a positive impact.

SO, I just did a couple of tests. I'll call the two patches "sleepy"
for the contention backoff patch and "bourney" for the Jason Bourne
inspired batching patch. This is an average of 3 runs, overwriting
a 47GB file on a machine with 16GB RAM:

		IO throughput	wall time __pv_queued_spin_lock_slowpath
vanilla		470MB/s		1m42s		25-30%
sleepy		295MB/s		2m43s		<1%
bourney		425MB/s		1m53s		25-30%

The overall CPU usage of sleepy was much lower than the others, but
it was also much slower. Too much sleeping and not enough reclaim
work being done, I think.

As for bourney, it's not immediately clear as to why it's nearly as
bad as the movie. At worst I would have expected it to have not
noticable impact, but maybe we are delaying freeing of pages too
long and so stalling allocation of new pages? It also doesn't do
much to reduce contention, especially considering the reduction in
throughput.

On a hunch that the batch list isn't all one mapping, I sorted it.
Patch is below if you're curious.

		IO throughput	wall time __pv_queued_spin_lock_slowpath
vanilla		470MB/s		1m42s		25-30%
sleepy		295MB/s		2m43s		<1%
bourney		425MB/s		1m53s		25-30%
sorted-bourney	465MB/s		1m43s		20%

The number of reclaim batches (from multiple runs) where the sorting
of the lists would have done anything is counted by list swaps (ls)
being > 1.

# grep " c " /var/log/syslog |grep -v "ls 1" |wc -l
7429
# grep " c " /var/log/syslog |grep "ls 1" |wc -l
1061767

IOWs in 1.07 million batches of pages reclaimed, only ~0.695% of
batches switched to a different mapping tree lock more than once.
>From those numbers I would not have expected sorting the page list
to have any measurable impact on performance. However, performance
seems very sensitive to the number of times the mapping tree lock
is bounced around.

FWIW, I just remembered about /proc/sys/vm/zone_reclaim_mode.

		IO throughput	wall time __pv_queued_spin_lock_slowpath
vanilla		470MB/s		1m42s		25-30%
zr=3D1		470MB/s		1m42s		2-3%

So isolating the page cache usage to a single node maintains
performance and shows a significant reduction in pressure on the
mapping tree lock. Same as a single node system, I'd guess.

Anyway, I've burnt enough erase cycles on this SSD for today....

-Dave.

---
 mm/vmscan.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 9261102..5cf1bd6 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -56,6 +56,8 @@
 =

 #include "internal.h"
 =

+#include <linux/list_sort.h>
+
 #define CREATE_TRACE_POINTS
 #include <trace/events/vmscan.h>
 =

@@ -761,6 +763,17 @@ int remove_mapping(struct address_space *mapping, stru=
ct page *page)
 	return ret;
 }
 =

+static int mapping_cmp(void *priv, struct list_head *a, struct list_head *=
b)
+{
+	struct address_space *ma =3D container_of(a, struct page, lru)->mapping;
+	struct address_space *mb =3D container_of(a, struct page, lru)->mapping;
+
+	if (ma =3D=3D mb)
+		return 0;
+	if (ma > mb)
+		return 1;
+	return -1;
+}
 static void remove_mapping_list(struct list_head *mapping_list,
 				struct list_head *free_pages,
 				struct list_head *ret_pages)
@@ -771,12 +784,17 @@ static void remove_mapping_list(struct list_head *map=
ping_list,
 	LIST_HEAD(swapcache);
 	LIST_HEAD(filecache);
 	struct page *page;
+	int	c =3D 0, ls =3D 0;
+
+	list_sort(NULL, mapping_list, mapping_cmp);
 =

 	while (!list_empty(mapping_list)) {
+		c++;
 		page =3D lru_to_page(mapping_list);
 		list_del(&page->lru);
 =

 		if (!mapping || page->mapping !=3D mapping) {
+			ls++;
 			if (mapping) {
 				spin_unlock_irqrestore(&mapping->tree_lock, flags);
 				finalise_remove_mapping(&swapcache, &filecache, freepage);
@@ -800,6 +818,7 @@ static void remove_mapping_list(struct list_head *mappi=
ng_list,
 		spin_unlock_irqrestore(&mapping->tree_lock, flags);
 		finalise_remove_mapping(&swapcache, &filecache, freepage);
 	}
+	printk("c %d, ls %d\n", c, ls);
 }
 =

 /**

> =

> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 374d95d04178..926110219cd9 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -621,19 +621,39 @@ static pageout_t pageout(struct page *page, struct =
address_space *mapping,
>  	return PAGE_CLEAN;
>  }
>  =

> +static void finalise_remove_mapping(struct list_head *swapcache,
> +				    struct list_head *filecache,
> +				    void (*freepage)(struct page *))
> +{
> +	struct page *page;
> +
> +	while (!list_empty(swapcache)) {
> +		swp_entry_t swap =3D { .val =3D page_private(page) };
> +		page =3D lru_to_page(swapcache);
> +		list_del(&page->lru);
> +		swapcache_free(swap);
> +		set_page_private(page, 0);
> +	}
> +
> +	while (!list_empty(filecache)) {
> +		page =3D lru_to_page(swapcache);
> +		list_del(&page->lru);
> +		freepage(page);
> +	}
> +}
> +
>  /*
>   * Same as remove_mapping, but if the page is removed from the mapping, =
it
>   * gets returned with a refcount of 0.
>   */
> -static int __remove_mapping(struct address_space *mapping, struct page *=
page,
> -			    bool reclaimed)
> +static int __remove_mapping_page(struct address_space *mapping,
> +				 struct page *page, bool reclaimed,
> +				 struct list_head *swapcache,
> +				 struct list_head *filecache)
>  {
> -	unsigned long flags;
> -
>  	BUG_ON(!PageLocked(page));
>  	BUG_ON(mapping !=3D page_mapping(page));
>  =

> -	spin_lock_irqsave(&mapping->tree_lock, flags);
>  	/*
>  	 * The non racy check for a busy page.
>  	 *
> @@ -668,16 +688,18 @@ static int __remove_mapping(struct address_space *m=
apping, struct page *page,
>  	}
>  =

>  	if (PageSwapCache(page)) {
> -		swp_entry_t swap =3D { .val =3D page_private(page) };
> +		unsigned long swapval =3D page_private(page);
> +		swp_entry_t swap =3D { .val =3D swapval };
>  		mem_cgroup_swapout(page, swap);
>  		__delete_from_swap_cache(page);
> -		spin_unlock_irqrestore(&mapping->tree_lock, flags);
> -		swapcache_free(swap);
> +		set_page_private(page, swapval);
> +		list_add(&page->lru, swapcache);
>  	} else {
> -		void (*freepage)(struct page *);
>  		void *shadow =3D NULL;
> +		void (*freepage)(struct page *);
>  =

>  		freepage =3D mapping->a_ops->freepage;
> +
>  		/*
>  		 * Remember a shadow entry for reclaimed file cache in
>  		 * order to detect refaults, thus thrashing, later on.
> @@ -698,16 +720,13 @@ static int __remove_mapping(struct address_space *m=
apping, struct page *page,
>  		    !mapping_exiting(mapping) && !dax_mapping(mapping))
>  			shadow =3D workingset_eviction(mapping, page);
>  		__delete_from_page_cache(page, shadow);
> -		spin_unlock_irqrestore(&mapping->tree_lock, flags);
> -
> -		if (freepage !=3D NULL)
> -			freepage(page);
> +		if (freepage)
> +			list_add(&page->lru, filecache);
>  	}
>  =

>  	return 1;
>  =

>  cannot_free:
> -	spin_unlock_irqrestore(&mapping->tree_lock, flags);
>  	return 0;
>  }
>  =

> @@ -719,16 +738,68 @@ static int __remove_mapping(struct address_space *m=
apping, struct page *page,
>   */
>  int remove_mapping(struct address_space *mapping, struct page *page)
>  {
> -	if (__remove_mapping(mapping, page, false)) {
> +	unsigned long flags;
> +	LIST_HEAD(swapcache);
> +	LIST_HEAD(filecache);
> +	void (*freepage)(struct page *);
> +	int ret =3D 0;
> +
> +	spin_lock_irqsave(&mapping->tree_lock, flags);
> +	freepage =3D mapping->a_ops->freepage;
> +
> +	if (__remove_mapping_page(mapping, page, false, &swapcache, &filecache)=
) {
>  		/*
>  		 * Unfreezing the refcount with 1 rather than 2 effectively
>  		 * drops the pagecache ref for us without requiring another
>  		 * atomic operation.
>  		 */
>  		page_ref_unfreeze(page, 1);
> -		return 1;
> +		ret =3D 1;
> +	}
> +	spin_unlock_irqrestore(&mapping->tree_lock, flags);
> +	finalise_remove_mapping(&swapcache, &filecache, freepage);
> +	return ret;
> +}
> +
> +static void remove_mapping_list(struct list_head *mapping_list,
> +				struct list_head *free_pages,
> +				struct list_head *ret_pages)
> +{
> +	unsigned long flags;
> +	struct address_space *mapping =3D NULL;
> +	void (*freepage)(struct page *);
> +	LIST_HEAD(swapcache);
> +	LIST_HEAD(filecache);
> +	struct page *page;
> +
> +	while (!list_empty(mapping_list)) {
> +		page =3D lru_to_page(mapping_list);
> +		list_del(&page->lru);
> +
> +		if (!mapping || page->mapping !=3D mapping) {
> +			if (mapping) {
> +				spin_unlock_irqrestore(&mapping->tree_lock, flags);
> +				finalise_remove_mapping(&swapcache, &filecache, freepage);
> +			}
> +
> +			mapping =3D page->mapping;
> +			spin_lock_irqsave(&mapping->tree_lock, flags);
> +			freepage =3D mapping->a_ops->freepage;
> +		}
> +
> +		if (!__remove_mapping_page(mapping, page, true, &swapcache, &filecache=
)) {
> +			unlock_page(page);
> +			list_add(&page->lru, ret_pages);
> +		} else {
> +			__ClearPageLocked(page);
> +			list_add(&page->lru, free_pages);
> +		}
> +	}
> +
> +	if (mapping) {
> +		spin_unlock_irqrestore(&mapping->tree_lock, flags);
> +		finalise_remove_mapping(&swapcache, &filecache, freepage);
>  	}
> -	return 0;
>  }
>  =

>  /**
> @@ -910,6 +981,7 @@ static unsigned long shrink_page_list(struct list_hea=
d *page_list,
>  {
>  	LIST_HEAD(ret_pages);
>  	LIST_HEAD(free_pages);
> +	LIST_HEAD(mapping_pages);
>  	int pgactivate =3D 0;
>  	unsigned long nr_unqueued_dirty =3D 0;
>  	unsigned long nr_dirty =3D 0;
> @@ -1206,17 +1278,14 @@ static unsigned long shrink_page_list(struct list=
_head *page_list,
>  		}
>  =

>  lazyfree:
> -		if (!mapping || !__remove_mapping(mapping, page, true))
> +		if (!mapping)
>  			goto keep_locked;
>  =

> -		/*
> -		 * At this point, we have no other references and there is
> -		 * no way to pick any more up (removed from LRU, removed
> -		 * from pagecache). Can use non-atomic bitops now (and
> -		 * we obviously don't have to worry about waking up a process
> -		 * waiting on the page lock, because there are no references.
> -		 */
> -		__ClearPageLocked(page);
> +		list_add(&page->lru, &mapping_pages);
> +		if (ret =3D=3D SWAP_LZFREE)
> +			count_vm_event(PGLAZYFREED);
> +		continue;
> +
>  free_it:
>  		if (ret =3D=3D SWAP_LZFREE)
>  			count_vm_event(PGLAZYFREED);
> @@ -1251,6 +1320,7 @@ static unsigned long shrink_page_list(struct list_h=
ead *page_list,
>  		VM_BUG_ON_PAGE(PageLRU(page) || PageUnevictable(page), page);
>  	}
>  =

> +	remove_mapping_list(&mapping_pages, &free_pages, &ret_pages);
>  	mem_cgroup_uncharge_list(&free_pages);
>  	try_to_unmap_flush();
>  	free_hot_cold_page_list(&free_pages, true);
> =


-- =

Dave Chinner
david(a)fromorbit.com

--===============8257808696782492220==--

