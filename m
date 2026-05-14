Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB3E324B2C
	for <oe-lkp@lists.linux.dev>; Thu, 14 May 2026 16:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778774410; cv=none; b=e3QpZV/LFt0u/4CyXMlLM44Ba64642DA6GUsXOPcADvitW0vz9/WZNPEXUQU7wsuRr3LlYBEfU9NmaxmpLRz/WTQ0HYJ366AI/bQkieyT+tBi1LGRCLow88/LaY631ULXSsaaM3E/ZN5hII0H0Wfy56t/rf1emNbgLH9+CRqwb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778774410; c=relaxed/simple;
	bh=y2mTi9xPIPosO+HuxrzTRbnF1NgRnzpHJowd/IMQlyQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=tORO9EaQ5RnEtvdxUMebjOIv+Sl/XR6ofFqwSvwEbIGNPpuRevJhg8Jx4da16d+hYAT7EBOMS70CyKYboP9+6n//zray4AGuENj9POmNxRhFqnxXfrqoQIqh61lYnwHeMKtA2/gwd6KLrFQ1vLP/r4SOdRJEFaO+7c9GnmrbKaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BOO8mr+K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOO8mr+K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B18F9C2BCB3;
	Thu, 14 May 2026 16:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778774410;
	bh=y2mTi9xPIPosO+HuxrzTRbnF1NgRnzpHJowd/IMQlyQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=BOO8mr+KXgLD5vOFopSdSqQmPVPMqQixeSWn9ammwAxW10qXGrLRzOvCc53rBbFDk
	 yiEtT172Lvfllx1jQJbtEjdxQutXpK6P5tm3ZJf6JoQfIxrWABiH0ajqRfoxCbThvl
	 aE5KqK0Rxn2+YMJeqJYgX5QcUJ9yqm5tb5PVCXy1y5q/7rkHJjMw0sg3ypOCCIeEs8
	 YAKECPLIOb8v97UHaVEzoVqZW2gyo/WOuVlOp22Ay9cWqwx0OHMUd9lz7YW3JnaD2J
	 9d9txktlBFl/XJMSg4sa1GvdZ2t7TYO4PIomKmOweW3jeX/+qZCyD6GQxn+1QHQL2d
	 /xEaFbsOx7UIg==
Message-ID: <eda98e7b-67fd-4a36-9d39-3de26827599b@kernel.org>
Date: Thu, 14 May 2026 18:00:06 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [mm, slab] 298cdbf5f7:
 will-it-scale.per_process_ops 6.3% regression
Content-Language: en-US
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
To: kernel test robot <oliver.sang@intel.com>,
 "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Hao Li <hao.li@linux.dev>,
 linux-mm@kvack.org
References: <202605112204.9382cecf-lkp@intel.com>
 <90bf195e-45fb-423c-b686-49be9cadbd11@kernel.org>
In-Reply-To: <90bf195e-45fb-423c-b686-49be9cadbd11@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/14/26 16:45, Vlastimil Babka (SUSE) wrote:
> On 5/11/26 16:45, kernel test robot wrote:
>> 
>> 
>> Hello,
>> 
>> kernel test robot noticed a 6.3% regression of will-it-scale.per_process_ops on:
> 
> Yay for an optimization that was supposed to have no tradeoffs :)

Does this help? I don't expect much, but perhaps...

- list_empty(&pc.slabs) is no longer unlikely when it can likely have a slab
where we returned part of the freelist
- let's ignore s->min_partial when returning slabs, we just pulled them from
the list, it's unlikely there are too many free slabs, and unlikely we have
free slabs to return. Maybe it will reduce the page alloc/frees and the code
is simpler

From 761946747d53b880855ac1e795ae0627be416c3e Mon Sep 17 00:00:00 2001
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Thu, 14 May 2026 17:55:31 +0200
Subject: [PATCH] mm, slab: simplify __refill_objects_node

---
 mm/slub.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 5d867349912b..0cc6c88f11e3 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -7187,26 +7187,16 @@ __refill_objects_node(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int mi
 			break;
 	}
 
-	if (unlikely(!list_empty(&pc.slabs))) {
+	if (!list_empty(&pc.slabs)) {
 		spin_lock_irqsave(&n->list_lock, flags);
 
 		list_for_each_entry_safe(slab, slab2, &pc.slabs, slab_list) {
 
-			if (unlikely(!slab->inuse && n->nr_partial >= s->min_partial))
-				continue;
-
 			list_del(&slab->slab_list);
 			add_partial(n, slab, ADD_TO_HEAD);
 		}
 
 		spin_unlock_irqrestore(&n->list_lock, flags);
-
-		/* any slabs left are completely free and for discard */
-		list_for_each_entry_safe(slab, slab2, &pc.slabs, slab_list) {
-
-			list_del(&slab->slab_list);
-			discard_slab(s, slab);
-		}
 	}
 
 	return refilled;
-- 
2.54.0


