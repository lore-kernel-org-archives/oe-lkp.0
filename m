Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F154F2AF14
	for <oe-lkp@lists.linux.dev>; Wed,  2 Apr 2025 19:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743623449; cv=none; b=bzogicxiFuw5AGDAsK81dNeO+BVlgTkSzE7V1cmwylrM8i7ui/w/NKDnzX8mCncKq3ZEd7YATCy/1qaB1uTQTijEkidDsd7sPb5jdHj4492qfKH+I3/yKr5rwaDAi072BHVSWBGbZmCngwryuQg2YW6YfIfwLU4Yx4i6QNTrcac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743623449; c=relaxed/simple;
	bh=P8KqmCQWrYMiyjyjMtSu8TkEJysklz/EpZ8QOsaqSa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g2HMmKgahazNZrNIR4YpAsrntZHRI3Kzb0ChCB4PjYfUa/GXlT8nr42xkYDZ3tDDdUWtmNoAfl+hULVqNymO/Rt+R47XwYSKRjRM8khJpUi70POCAC9RjnPb3HDRbQerpFz7HKUy0/tkJIgLsxONwYpTvo40Th3XC0EbTkmixps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=hSRFgjPN; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="hSRFgjPN"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-47698757053so1253081cf.0
        for <oe-lkp@lists.linux.dev>; Wed, 02 Apr 2025 12:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1743623444; x=1744228244; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FfMrrYY13YZzcIjXFNy74fRKR0QYf/adnBC1OdclTvQ=;
        b=hSRFgjPNi5nMC2lYHKifesQJOJVswpFB0OWCl3XPusv+uZ/mjRTdUv9gE+ojGjESn7
         k2ZrxL/h/BnGRaW7EiZsroiCdlu6jmj8G4vw6IsGwBoEnG4GssI7ZHSNdw7DIVrbgDDU
         Co0OVGOIAvxbPKur4neM/JTt4dBztM/ehu+hNFJ3E3ox2IzH62xDYS+Ml8fC/5hu9zA6
         XtNeERfYayYkKmAuAZw4HK5NSB4mwl5dJhnXAVOcNkrz45Q4MUhSp9+VXklychwH9MB0
         yWGxW8DTez6g5GaEb9CdK4pDng1z4V/MbhkpiwXdjt+nTCE1En4BOkHr+4H9O6ZOGn1m
         umFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743623444; x=1744228244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfMrrYY13YZzcIjXFNy74fRKR0QYf/adnBC1OdclTvQ=;
        b=ORLcB8Sv3rzaxHDhgLafYeWQFmE1f2PwwtqZLrdnhn9sR+RR5x6OqLjTXJBHc0SOQp
         42T5ymwFUiWy2CKVkNAp2DbnF2LVhACw1vtXC2t9y30WouRA+P5RSJtW8MAs2eNnaz8Y
         vTYDCbjDN1O0eLLHuOilDwIYIxhK1zj3STrqjCkSOEwN+ApxsV1uAkF+FHhpvkCc1gpD
         fdq012ZPFpYk6KnvYKvKVEsqpmZlAOaggGKWE+Ep4QFvIGgMQISW59V5Tq/sJHQoYU2X
         Yi1XLPizgY4KPpvar/DtYVgLUNLr1K3M7079ZyVWlKjzF79TDSUMKkROBLhpNSO0Fka0
         qISw==
X-Gm-Message-State: AOJu0YwoS0s1NWiAfKsZtk141x4XdZ5nheb4sWuBEiGmsuPk+EfEFbos
	j6967Rod37LpPikBRysMO2tV4COGE8voClcKixWS9/LANWFzVeLKSan8njKNNqE=
X-Gm-Gg: ASbGncu8wGkFM4W1Kt/F0DVBMT97nSwmya/isESAnfopenlE+fftwGHqfUbfc9xokA6
	TDPwTptCeyNxUyOoXTvWxTcMk6ca7ViwqUJJqppro3z6jxrNjG8lSEuVycaabA8g0EptXmdaYVk
	ZiUyc0JAKNBqwNCCktmXBhUsUWlZmi7xV9dBy5ykCQKEcy0J3GLqIwWCKQ+LZPTYe+LUZDseqg2
	LL+RkCOs9bKDrvY4BGmK8M4yTqJFy2KGL5IQhrqXoUK/orbP3KcCvZ4ctQKSvgTMyvC0GyCpjQE
	QVJgT6FhSjplZOfANMOAzd9QsPPau2CvSg8E7kPa09k=
X-Google-Smtp-Source: AGHT+IHn/2owON+aw3mMItcmXsuTXk528yVv5D09IgwdkjIRjFqz9OSMXPbppYkHulZkuWMXfVHI8Q==
X-Received: by 2002:a05:622a:252:b0:477:419a:a3bc with SMTP id d75a77b69052e-477e4b93c7amr286709531cf.27.1743623444554;
        Wed, 02 Apr 2025 12:50:44 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47782a1033csm83134521cf.16.2025.04.02.12.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 12:50:43 -0700 (PDT)
Date: Wed, 2 Apr 2025 15:50:42 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Brendan Jackman <jackmanb@google.com>, linux-mm@kvack.org
Subject: Re: [linux-next:master] [mm]  c2f6ea38fc:  vm-scalability.throughput
 56.4% regression
Message-ID: <20250402195042.GC198651@cmpxchg.org>
References: <202503271547.fc08b188-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503271547.fc08b188-lkp@intel.com>

Hello,

On Thu, Mar 27, 2025 at 04:20:41PM +0800, kernel test robot wrote:
> kernel test robot noticed a 56.4% regression of vm-scalability.throughput on:
> 
> commit: c2f6ea38fc1b640aa7a2e155cc1c0410ff91afa2 ("mm: page_alloc: don't steal single pages from biggest buddy")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> testcase: vm-scalability
> config: x86_64-rhel-9.4
> compiler: gcc-12
> test machine: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory
> parameters:
> 
> 	runtime: 300s
> 	test: lru-file-mmap-read
> 	cpufreq_governor: performance

Thanks for the report.

Would you be able to re-test with the below patch applied?

There are more details in the thread here:
https://lore.kernel.org/all/20250402194425.GB198651@cmpxchg.org/

It's on top of the following upstream commit:

commit acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1 (origin/master, origin/HEAD)
Merge: 3491aa04787f f278b6d5bb46
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue Apr 1 20:00:51 2025 -0700

    Merge tag 'net-6.15-rc0' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net

Thanks!

---

From 13433454403e0c6f99ccc3b76c609034fe47e41c Mon Sep 17 00:00:00 2001
From: Johannes Weiner <hannes@cmpxchg.org>
Date: Wed, 2 Apr 2025 14:23:53 -0400
Subject: [PATCH] mm: page_alloc: speed up fallbacks in rmqueue_bulk()

Not-yet-signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
---
 mm/page_alloc.c | 100 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 74 insertions(+), 26 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index f51aa6051a99..03b0d45ed45a 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -2194,11 +2194,11 @@ try_to_claim_block(struct zone *zone, struct page *page,
  * The use of signed ints for order and current_order is a deliberate
  * deviation from the rest of this file, to make the for loop
  * condition simpler.
- *
- * Return the stolen page, or NULL if none can be found.
  */
+
+/* Try to claim a whole foreign block, take a page, expand the remainder */
 static __always_inline struct page *
-__rmqueue_fallback(struct zone *zone, int order, int start_migratetype,
+__rmqueue_claim(struct zone *zone, int order, int start_migratetype,
 						unsigned int alloc_flags)
 {
 	struct free_area *area;
@@ -2236,14 +2236,26 @@ __rmqueue_fallback(struct zone *zone, int order, int start_migratetype,
 		page = try_to_claim_block(zone, page, current_order, order,
 					  start_migratetype, fallback_mt,
 					  alloc_flags);
-		if (page)
-			goto got_one;
+		if (page) {
+			trace_mm_page_alloc_extfrag(page, order, current_order,
+						    start_migratetype, fallback_mt);
+			return page;
+		}
 	}
 
-	if (alloc_flags & ALLOC_NOFRAGMENT)
-		return NULL;
+	return NULL;
+}
+
+/* Try to steal a single page from a foreign block */
+static __always_inline struct page *
+__rmqueue_steal(struct zone *zone, int order, int start_migratetype)
+{
+	struct free_area *area;
+	int current_order;
+	struct page *page;
+	int fallback_mt;
+	bool claim_block;
 
-	/* No luck claiming pageblock. Find the smallest fallback page */
 	for (current_order = order; current_order < NR_PAGE_ORDERS; current_order++) {
 		area = &(zone->free_area[current_order]);
 		fallback_mt = find_suitable_fallback(area, current_order,
@@ -2253,25 +2265,28 @@ __rmqueue_fallback(struct zone *zone, int order, int start_migratetype,
 
 		page = get_page_from_free_area(area, fallback_mt);
 		page_del_and_expand(zone, page, order, current_order, fallback_mt);
-		goto got_one;
+		trace_mm_page_alloc_extfrag(page, order, current_order,
+					    start_migratetype, fallback_mt);
+		return page;
 	}
 
 	return NULL;
-
-got_one:
-	trace_mm_page_alloc_extfrag(page, order, current_order,
-		start_migratetype, fallback_mt);
-
-	return page;
 }
 
+enum rmqueue_mode {
+	RMQUEUE_NORMAL,
+	RMQUEUE_CMA,
+	RMQUEUE_CLAIM,
+	RMQUEUE_STEAL,
+};
+
 /*
  * Do the hard work of removing an element from the buddy allocator.
  * Call me with the zone->lock already held.
  */
 static __always_inline struct page *
 __rmqueue(struct zone *zone, unsigned int order, int migratetype,
-						unsigned int alloc_flags)
+	  unsigned int alloc_flags, enum rmqueue_mode *mode)
 {
 	struct page *page;
 
@@ -2290,16 +2305,47 @@ __rmqueue(struct zone *zone, unsigned int order, int migratetype,
 		}
 	}
 
-	page = __rmqueue_smallest(zone, order, migratetype);
-	if (unlikely(!page)) {
-		if (alloc_flags & ALLOC_CMA)
+	/*
+	 * Try the different freelists, native then foreign.
+	 *
+	 * The fallback logic is expensive and rmqueue_bulk() calls in
+	 * a loop with the zone->lock held, meaning the freelists are
+	 * not subject to any outside changes. Remember in *mode where
+	 * we found pay dirt, to save us the search on the next call.
+	 */
+	switch (*mode) {
+	case RMQUEUE_NORMAL:
+		page = __rmqueue_smallest(zone, order, migratetype);
+		if (page)
+			return page;
+		fallthrough;
+	case RMQUEUE_CMA:
+		if (alloc_flags & ALLOC_CMA) {
 			page = __rmqueue_cma_fallback(zone, order);
-
-		if (!page)
-			page = __rmqueue_fallback(zone, order, migratetype,
-						  alloc_flags);
+			if (page) {
+				*mode = RMQUEUE_CMA;
+				return page;
+			}
+		}
+		fallthrough;
+	case RMQUEUE_CLAIM:
+		page = __rmqueue_claim(zone, order, migratetype, alloc_flags);
+		if (page) {
+			/* Replenished native freelist, back to normal mode */
+			*mode = RMQUEUE_NORMAL;
+			return page;
+		}
+		fallthrough;
+	case RMQUEUE_STEAL:
+		if (!(alloc_flags & ALLOC_NOFRAGMENT)) {
+			page = __rmqueue_steal(zone, order, migratetype);
+			if (page) {
+				*mode = RMQUEUE_STEAL;
+				return page;
+			}
+		}
 	}
-	return page;
+	return NULL;
 }
 
 /*
@@ -2311,6 +2357,7 @@ static int rmqueue_bulk(struct zone *zone, unsigned int order,
 			unsigned long count, struct list_head *list,
 			int migratetype, unsigned int alloc_flags)
 {
+	enum rmqueue_mode rmqm = RMQUEUE_NORMAL;
 	unsigned long flags;
 	int i;
 
@@ -2321,7 +2368,7 @@ static int rmqueue_bulk(struct zone *zone, unsigned int order,
 	}
 	for (i = 0; i < count; ++i) {
 		struct page *page = __rmqueue(zone, order, migratetype,
-								alloc_flags);
+					      alloc_flags, &rmqm);
 		if (unlikely(page == NULL))
 			break;
 
@@ -2934,6 +2981,7 @@ struct page *rmqueue_buddy(struct zone *preferred_zone, struct zone *zone,
 {
 	struct page *page;
 	unsigned long flags;
+	enum rmqueue_mode rmqm = RMQUEUE_NORMAL;
 
 	do {
 		page = NULL;
@@ -2945,7 +2993,7 @@ struct page *rmqueue_buddy(struct zone *preferred_zone, struct zone *zone,
 		if (alloc_flags & ALLOC_HIGHATOMIC)
 			page = __rmqueue_smallest(zone, order, MIGRATE_HIGHATOMIC);
 		if (!page) {
-			page = __rmqueue(zone, order, migratetype, alloc_flags);
+			page = __rmqueue(zone, order, migratetype, alloc_flags, &rmqm);
 
 			/*
 			 * If the allocation fails, allow OOM handling and
-- 
2.49.0
