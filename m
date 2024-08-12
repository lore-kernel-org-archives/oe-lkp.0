Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9693F136E3F
	for <oe-lkp@lists.linux.dev>; Mon, 12 Aug 2024 04:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723438163; cv=none; b=LvZRO0oJJtnFZV+B9iSZFSsDTxEbiiQjLgsezyOB5UMO2hWubi5ZsUXwb18WxWEw5UK5h/kXsoPh35LVT/e2io+XPR9Pn7w5Is1m6QBu0V8sihbMuTPiJKsfeIWtlv8To4F44aUYE3b+r5hMthn2RoZ20ZNFTP9bzBYs2QD+8Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723438163; c=relaxed/simple;
	bh=5VgnuB9y23ZxWERJCpyu6hh9PB22AGxPFSbb/AHyQII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWgeZpKLw5e9Y77E94nMRUARnHMz8UOqm1+S4BLKzbQXs8ggBRQgtQh/XBd+FOYoI8CR6Kz/JeL6iu1yM3OyIhT3ejso+onl69EuCP02iL4d6r5OEihSvmwuNKKvmbiLQRDiaY+1T5rL5efwgqTIZv+OzoCh56FCQ3CXICpREpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8ugl7Xt; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8ugl7Xt"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a7a9185e1c0so286954366b.1
        for <oe-lkp@lists.linux.dev>; Sun, 11 Aug 2024 21:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723438160; x=1724042960; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qpq3LPqm61lcZ3ArBnzJ/3LDps9wXJ9LbD1MIjBOKqk=;
        b=J8ugl7XtgChymmWO9845pAcxJXVh6fQyOcOtQSI/wk9dPlYHUGqgyg5+fS4/Kwtc0E
         giKaKvGtAqujO/+oWDPFdoAJSR6n/omCJ1cU9uMnFNxjtLasFFUNJyoeVR6LdopaIXjC
         OyqlpsPjB7p68HhujSR1zGdxRn2Eb+bD09YENJcce5YzI+dg0QxHr8ekoWJuwmIz1Xzg
         5Nufu1AA30CH/P3Pet3229QK33Ao+mWAyPtwjg2VL1vB1zJocuR+xC++UVcvMEeOYx+V
         /79OfFBqpLUFJZ6wJj9iWnrHR9EhTDu7X3JnspGHSwKW5MoAzMKRztJjmsTJaTGDQ3Ec
         a7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723438160; x=1724042960;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qpq3LPqm61lcZ3ArBnzJ/3LDps9wXJ9LbD1MIjBOKqk=;
        b=MM3asqKDwnfKIjb7YepSEYr2eN5FF+Hrqu/HTVGE7+LwHBTsHzoBvAWTXKfyUHmfM0
         hvNWHDG1HQYP0XPvyO8IdXI3gOFzAtZ+nnablsD+8EVMurUr+CjHcEZlb5G0QxdUSOAS
         PW1u0WP6NAVCtH5LDq8DKNpRE28WV/NcF1yTXYIIuCTjjIRhmH83J4W8LsUm1nvOjLsI
         JV9squ2VyAPOcb7TU7iGO4NJhhktrcZ2y3rjTJRDzdXThUPAY+H+oGz+kvN6yv6R8yRR
         OUR2JoqNpCrwPNxImLAv2Aes6925uHT01YMQ4BsTz9TiAhQFRFCI1Xo5oFLuSgtQhPFK
         ZL3w==
X-Forwarded-Encrypted: i=1; AJvYcCXhDPV2M2nSLn+8PLfKd3oBvhVqH18+0+16qJlK54feiiXoukIf3QxWTsO9zl4OtfgsRfdzW4yRrwmhNYMc6t0OiVhEVAcK
X-Gm-Message-State: AOJu0YxkmlGGB2dlNRDYDe5fJ/fUJ4trBKrT/eXUuDUAwix0JTMl/pu4
	7cr9qXWn3rJAV2bSvh0rdrH/2Qp2gIRntfORoebaTKPQTYqeUM2S
X-Google-Smtp-Source: AGHT+IE7qNtRHiWSXri3JkwIDsfJkJy1SPSZAsiJ/9zS+oo1xDwuodEP3kHjNAIedcu/4q/sCynWTQ==
X-Received: by 2002:a17:907:1c0e:b0:a7a:9447:3e8b with SMTP id a640c23a62f3a-a80aa59eb36mr585387966b.25.1723438159639;
        Sun, 11 Aug 2024 21:49:19 -0700 (PDT)
Received: from f (cst-prg-72-52.cust.vodafone.cz. [46.135.72.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb11a533sm196522766b.96.2024.08.11.21.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 21:49:19 -0700 (PDT)
Date: Mon, 12 Aug 2024 06:49:00 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: Yin Fengwei <fengwei.yin@intel.com>
Cc: David Hildenbrand <david@redhat.com>, 
	kernel test robot <oliver.sang@intel.com>, Peter Xu <peterx@redhat.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Matthew Wilcox <willy@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	WANG Xuerui <kernel@xen0n.name>, linux-mm@kvack.org, ying.huang@intel.com, feng.tang@intel.com
Subject: Re: [linus:master] [mm] c0bff412e6: stress-ng.clone.ops_per_sec
 -2.9% regression
Message-ID: <wbbieqyyjqy7ulbta6muzepxwxi6galwvhjdxpqaqbeljzpcer@dpeoqrbkl5p2>
References: <202407301049.5051dc19-oliver.sang@intel.com>
 <193e302c-4401-4756-a552-9f1e07ecedcf@redhat.com>
 <439265d8-e71e-41db-8a46-55366fdd334e@intel.com>
 <90477952-fde2-41d7-8ff4-2102c45e341d@redhat.com>
 <6uxnuf2gysgabyai2r77xrqegb7t7cc2dlzjz6upwsgwrnfk3x@cjj6on3wqm4x>
 <5a67c103-1d9d-440d-8bed-bbfa7d3ecf71@redhat.com>
 <CAGudoHH4NGgPdTe2yL33TNNFriPM9mVM=0_iuh5dLuesZXQMAQ@mail.gmail.com>
 <5c0979a2-9a56-4284-82d2-42da62bda4a5@redhat.com>
 <c7e0d029-0a64-4b27-bd62-cf9a3577d7ff@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7e0d029-0a64-4b27-bd62-cf9a3577d7ff@intel.com>

On Mon, Aug 12, 2024 at 12:43:08PM +0800, Yin Fengwei wrote:
> Hi David,
> 
> On 8/1/24 09:44, David Hildenbrand wrote:
> > On 01.08.24 15:37, Mateusz Guzik wrote:
> > > On Thu, Aug 1, 2024 at 3:34 PM David Hildenbrand <david@redhat.com>
> > > wrote:
> > > > 
> > > > On 01.08.24 15:30, Mateusz Guzik wrote:
> > > > > On Thu, Aug 01, 2024 at 08:49:27AM +0200, David Hildenbrand wrote:
> > > > > > Yes indeed. fork() can be extremely sensitive to each
> > > > > > added instruction.
> > > > > > 
> > > > > > I even pointed out to Peter why I didn't add the
> > > > > > PageHuge check in there
> > > > > > originally [1].
> > > > > > 
> > > > > > "Well, and I didn't want to have runtime-hugetlb checks in
> > > > > > PageAnonExclusive code called on certainly-not-hugetlb code paths."
> > > > > > 
> > > > > > 
> > > > > > We now have to do a page_folio(page) and then test for hugetlb.
> > > > > > 
> > > > > >       return folio_test_hugetlb(page_folio(page));
> > > > > > 
> > > > > > Nowadays, folio_test_hugetlb() will be faster than at
> > > > > > c0bff412e6 times, so
> > > > > > maybe at least part of the overhead is gone.
> > > > > > 
> > > > > 
> > > > > I'll note page_folio expands to a call to _compound_head.
> > > > > 
> > > > > While _compound_head is declared as an inline, it ends up being big
> > > > > enough that the compiler decides to emit a real function instead and
> > > > > real func calls are not particularly cheap.
> > > > > 
> > > > > I had a brief look with a profiler myself and for single-threaded usage
> > > > > the func is quite high up there, while it manages to get out with the
> > > > > first branch -- that is to say there is definitely performance lost for
> > > > > having a func call instead of an inlined branch.
> > > > > 
> > > > > The routine is deinlined because of a call to page_fixed_fake_head,
> > > > > which itself is annotated with always_inline.
> > > > > 
> > > > > This is of course patchable with minor shoveling.
> > > > > 
> > > > > I did not go for it because stress-ng results were too unstable for me
> > > > > to confidently state win/loss.
> > > > > 
> > > > > But should you want to whack the regression, this is what I would look
> > > > > into.
> > > > > 
> > > > 
> > > > This might improve it, at least for small folios I guess:
> Do you want us to test this change? Or you have further optimization
> ongoing? Thanks.

I verified the thing below boots, I have no idea about performance. If
it helps it can be massaged later from style perspective.

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 5769fe6e4950..2d5d61ab385b 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -194,34 +194,13 @@ enum pageflags {
 #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 DECLARE_STATIC_KEY_FALSE(hugetlb_optimize_vmemmap_key);
 
-/*
- * Return the real head page struct iff the @page is a fake head page, otherwise
- * return the @page itself. See Documentation/mm/vmemmap_dedup.rst.
- */
+const struct page *_page_fixed_fake_head(const struct page *page);
+
 static __always_inline const struct page *page_fixed_fake_head(const struct page *page)
 {
 	if (!static_branch_unlikely(&hugetlb_optimize_vmemmap_key))
 		return page;
-
-	/*
-	 * Only addresses aligned with PAGE_SIZE of struct page may be fake head
-	 * struct page. The alignment check aims to avoid access the fields (
-	 * e.g. compound_head) of the @page[1]. It can avoid touch a (possibly)
-	 * cold cacheline in some cases.
-	 */
-	if (IS_ALIGNED((unsigned long)page, PAGE_SIZE) &&
-	    test_bit(PG_head, &page->flags)) {
-		/*
-		 * We can safely access the field of the @page[1] with PG_head
-		 * because the @page is a compound page composed with at least
-		 * two contiguous pages.
-		 */
-		unsigned long head = READ_ONCE(page[1].compound_head);
-
-		if (likely(head & 1))
-			return (const struct page *)(head - 1);
-	}
-	return page;
+	return _page_fixed_fake_head(page);
 }
 #else
 static inline const struct page *page_fixed_fake_head(const struct page *page)
@@ -235,7 +214,7 @@ static __always_inline int page_is_fake_head(const struct page *page)
 	return page_fixed_fake_head(page) != page;
 }
 
-static inline unsigned long _compound_head(const struct page *page)
+static __always_inline unsigned long _compound_head(const struct page *page)
 {
 	unsigned long head = READ_ONCE(page->compound_head);
 
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 829112b0a914..3fbc00db607a 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -19,6 +19,33 @@
 #include <asm/tlbflush.h>
 #include "hugetlb_vmemmap.h"
 
+/*
+ * Return the real head page struct iff the @page is a fake head page, otherwise
+ * return the @page itself. See Documentation/mm/vmemmap_dedup.rst.
+ */
+const struct page *_page_fixed_fake_head(const struct page *page)
+{
+	/*
+	 * Only addresses aligned with PAGE_SIZE of struct page may be fake head
+	 * struct page. The alignment check aims to avoid access the fields (
+	 * e.g. compound_head) of the @page[1]. It can avoid touch a (possibly)
+	 * cold cacheline in some cases.
+	 */
+	if (IS_ALIGNED((unsigned long)page, PAGE_SIZE) &&
+	    test_bit(PG_head, &page->flags)) {
+		/*
+		 * We can safely access the field of the @page[1] with PG_head
+		 * because the @page is a compound page composed with at least
+		 * two contiguous pages.
+		 */
+		unsigned long head = READ_ONCE(page[1].compound_head);
+
+		if (likely(head & 1))
+			return (const struct page *)(head - 1);
+	}
+	return page;
+}
+
 /**
  * struct vmemmap_remap_walk - walk vmemmap page table
  *
