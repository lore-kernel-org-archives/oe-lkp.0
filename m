Content-Type: multipart/mixed; boundary="===============9101743070899858651=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Wed, 24 Aug 2016 08:40:37 -0700
Message-ID: <87wpj6dvka.fsf@yhuang-mobile.sh.intel.com>
In-Reply-To: <20160818004517.GJ8119@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============9101743070899858651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Mel,

Mel Gorman <mgorman@techsingularity.net> writes:

> On Wed, Aug 17, 2016 at 04:49:07PM +0100, Mel Gorman wrote:
>> > Yes, we could try to batch the locking like DaveC already suggested
>> > (ie we could move the locking to the caller, and then make
>> > shrink_page_list() just try to keep the lock held for a few pages if
>> > the mapping doesn't change), and that might result in fewer crazy
>> > cacheline ping-pongs overall. But that feels like exactly the wrong
>> > kind of workaround.
>> > =

>> =

>> Even if such batching was implemented, it would be very specific to the
>> case of a single large file filling LRUs on multiple nodes.
>> =

>
> The latest Jason Bourne movie was sufficiently bad that I spent time
> thinking how the tree_lock could be batched during reclaim. It's not
> straight-forward but this prototype did not blow up on UMA and may be
> worth considering if Dave can test either approach has a positive impact.
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 374d95d04178..926110219cd9 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -621,19 +621,39 @@ static pageout_t pageout(struct page *page, struct =
address_space *mapping,
>  	return PAGE_CLEAN;
>  }

We found this patch helps much for swap out performance, where there are
usually only one mapping for all swap pages.  In our 16 processes
sequential swap write test case for a ramdisk on a Xeon E5 v3 machine,
the swap out throughput improved 40.4%, from ~0.97GB/s to ~1.36GB/s.
What's your plan for this patch?  If it can be merged soon, that will be
great!

I found some issues in the original patch to work with swap cache.  Below
is my fixes to make it work for swap cache.

Best Regards,
Huang, Ying

-------------------------------------------------------------------->

diff --git a/mm/vmscan.c b/mm/vmscan.c
index ac5fbff..dcaf295 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -623,22 +623,28 @@ static pageout_t pageout(struct page *page, struct ad=
dress_space *mapping,
 =

 static void finalise_remove_mapping(struct list_head *swapcache,
 				    struct list_head *filecache,
+				    struct list_head *free_pages,
 				    void (*freepage)(struct page *))
 {
 	struct page *page;
 =

 	while (!list_empty(swapcache)) {
-		swp_entry_t swap =3D { .val =3D page_private(page) };
+		swp_entry_t swap;
 		page =3D lru_to_page(swapcache);
 		list_del(&page->lru);
+		swap.val =3D page_private(page);
 		swapcache_free(swap);
 		set_page_private(page, 0);
+		if (free_pages)
+			list_add(&page->lru, free_pages);
 	}
 =

 	while (!list_empty(filecache)) {
-		page =3D lru_to_page(swapcache);
+		page =3D lru_to_page(filecache);
 		list_del(&page->lru);
 		freepage(page);
+		if (free_pages)
+			list_add(&page->lru, free_pages);
 	}
 }
 =

@@ -649,7 +655,8 @@ static void finalise_remove_mapping(struct list_head *s=
wapcache,
 static int __remove_mapping_page(struct address_space *mapping,
 				 struct page *page, bool reclaimed,
 				 struct list_head *swapcache,
-				 struct list_head *filecache)
+				 struct list_head *filecache,
+				 struct list_head *free_pages)
 {
 	BUG_ON(!PageLocked(page));
 	BUG_ON(mapping !=3D page_mapping(page));
@@ -722,6 +729,8 @@ static int __remove_mapping_page(struct address_space *=
mapping,
 		__delete_from_page_cache(page, shadow);
 		if (freepage)
 			list_add(&page->lru, filecache);
+		else if (free_pages)
+			list_add(&page->lru, free_pages);
 	}
 =

 	return 1;
@@ -747,7 +756,7 @@ int remove_mapping(struct address_space *mapping, struc=
t page *page)
 	spin_lock_irqsave(&mapping->tree_lock, flags);
 	freepage =3D mapping->a_ops->freepage;
 =

-	if (__remove_mapping_page(mapping, page, false, &swapcache, &filecache)) {
+	if (__remove_mapping_page(mapping, page, false, &swapcache, &filecache, N=
ULL)) {
 		/*
 		 * Unfreezing the refcount with 1 rather than 2 effectively
 		 * drops the pagecache ref for us without requiring another
@@ -757,7 +766,7 @@ int remove_mapping(struct address_space *mapping, struc=
t page *page)
 		ret =3D 1;
 	}
 	spin_unlock_irqrestore(&mapping->tree_lock, flags);
-	finalise_remove_mapping(&swapcache, &filecache, freepage);
+	finalise_remove_mapping(&swapcache, &filecache, NULL, freepage);
 	return ret;
 }
 =

@@ -776,29 +785,28 @@ static void remove_mapping_list(struct list_head *map=
ping_list,
 		page =3D lru_to_page(mapping_list);
 		list_del(&page->lru);
 =

-		if (!mapping || page->mapping !=3D mapping) {
+		if (!mapping || page_mapping(page) !=3D mapping) {
 			if (mapping) {
 				spin_unlock_irqrestore(&mapping->tree_lock, flags);
-				finalise_remove_mapping(&swapcache, &filecache, freepage);
+				finalise_remove_mapping(&swapcache, &filecache, free_pages, freepage);
 			}
 =

-			mapping =3D page->mapping;
+			mapping =3D page_mapping(page);
 			spin_lock_irqsave(&mapping->tree_lock, flags);
 			freepage =3D mapping->a_ops->freepage;
 		}
 =

-		if (!__remove_mapping_page(mapping, page, true, &swapcache, &filecache))=
 {
+		if (!__remove_mapping_page(mapping, page, true, &swapcache,
+					   &filecache, free_pages)) {
 			unlock_page(page);
 			list_add(&page->lru, ret_pages);
-		} else {
+		} else
 			__ClearPageLocked(page);
-			list_add(&page->lru, free_pages);
-		}
 	}
 =

 	if (mapping) {
 		spin_unlock_irqrestore(&mapping->tree_lock, flags);
-		finalise_remove_mapping(&swapcache, &filecache, freepage);
+		finalise_remove_mapping(&swapcache, &filecache, free_pages, freepage);
 	}
 }
=20

--===============9101743070899858651==--

