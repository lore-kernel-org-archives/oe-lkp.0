Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF18D30FC34
	for <oe-lkp@lists.linux.dev>; Wed, 28 Jan 2026 10:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769596325; cv=none; b=UTm0ZegA9XBpAknvLc0lK+GbFvrH1JSaJVRWd3QoIaI9Z4NqJd0TVGg4D/TZpZx8U8hCLE8IHkUbZrerBUUIOTDYLiyIwWidJuiqAyh8CDc1lqn2zaa3BR5foHn3R4PF3c0ITpRAmT3Lz5NQ3Lflu2DINpPrywRAYPpgkSbs/vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769596325; c=relaxed/simple;
	bh=DxmDK6IzpYnu24G2j1l7gf8HO0lHZfROLHdPbgxSXmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JogJBNP6pzuPz/EuWEBsVmvMPkk96nCVyMW0d427tlK/6RUlveiW6Q4Ytik94QCx2+XPpUPAiYdAqmExjhyHV170iiimoLJrfLGbnK+uR+g62q+dpCkP+l8rqahMm1G3RU/YWjjsv06zDjZdWkfC44uzVKIiNTkQ83ELvK55HMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=paGs2MPA; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=1IvdI8Kg; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=2+Vu2MWK; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=l/DocQuu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="paGs2MPA";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="1IvdI8Kg";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="2+Vu2MWK";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="l/DocQuu"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DB5A033B1D;
	Wed, 28 Jan 2026 10:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1769596320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UpdfhkK6uEG2H192iOC+tRwDfkcZNxrrp7CmiUGW5DU=;
	b=paGs2MPAgURFips7AXZvzJ7wKcamjiMOXMu/Z+pN7glue2CgaCltfQ/kPyqIpJRoukxADC
	zLxotAK+4/NTTgMqhu+m2y7Qdmrp9t8zGxZdAfhGeGWhlx3pSTPOkVObBuTNmX239QzZKF
	HDWMo43c+g8I+DY8etSue4nlmNo6n1g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1769596320;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UpdfhkK6uEG2H192iOC+tRwDfkcZNxrrp7CmiUGW5DU=;
	b=1IvdI8KgId43JOQki51RxfYNoxPE1LfCvQ7bOyUp4oLNYzxB+C8IZrrir8Lz5S6sTdKCWi
	5F4CQYC4SGGxnzAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1769596319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UpdfhkK6uEG2H192iOC+tRwDfkcZNxrrp7CmiUGW5DU=;
	b=2+Vu2MWKP5PQ3ZzWI2VD7vFWC5SKbNBL6+hYiHbx5tt3qEygV6cUKvazmWBTuP6+5mRkR4
	/flTleT+t7ZqzCrTsftyhU+oi5RxPDXTbG9X+WrAmoyTvjCMhdEivqPNYXXKcMdo/tis1h
	5x5qUYcpRJgsluo+BflSNguqO2P3sBs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1769596319;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UpdfhkK6uEG2H192iOC+tRwDfkcZNxrrp7CmiUGW5DU=;
	b=l/DocQuuwipKGC0S5dlX2SMnzcjP0+a1HXN9X2BKCmsXWPVhPCjSskO3+dNWIe2Y5xHFqD
	PqxAh1AVM032CJDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BDEAD3EA62;
	Wed, 28 Jan 2026 10:31:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id maQGLp/leWmhFwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 28 Jan 2026 10:31:59 +0000
Message-ID: <3dfb6857-3705-4042-9a30-da488434d9e3@suse.cz>
Date: Wed, 28 Jan 2026 11:31:59 +0100
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [vbabka:b4/sheaves-for-all-rebased] [slab] aa8fdb9e25:
 will-it-scale.per_process_ops 46.5% regression
Content-Language: en-US
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-mm@kvack.org,
 Harry Yoo <harry.yoo@oracle.com>, Hao Li <hao.li@linux.dev>,
 Mateusz Guzik <mjguzik@gmail.com>
References: <202601132136.77efd6d7-lkp@intel.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <202601132136.77efd6d7-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,intel.com,kvack.org,oracle.com,linux.dev,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO

On 1/13/26 14:57, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a 46.5% regression of will-it-scale.per_process_ops on:
> 
> 
> commit: aa8fdb9e2516055552de11cabaacde4d77ad7d72 ("slab: refill sheaves from all nodes")
> https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git b4/sheaves-for-all-rebased
> 
> testcase: will-it-scale
> config: x86_64-rhel-9.4
> compiler: gcc-14
> test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
> parameters:
> 
> 	nr_task: 100%
> 	mode: process
> 	test: mmap2
> 	cpufreq_governor: performance
> 
> 
> In addition to that, the commit also has significant impact on the following tests:
> 
> +------------------+----------------------------------------------------------------------------------------------------+
> | testcase: change | stress-ng: stress-ng.pkey.ops_per_sec  28.4% regression                                            |
> | test machine     | 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory        |
> | test parameters  | cpufreq_governor=performance                                                                       |
> |                  | nr_threads=100%                                                                                    |
> |                  | test=pkey                                                                                          |
> |                  | testtime=60s                                                                                       |
> +------------------+----------------------------------------------------------------------------------------------------+
> | testcase: change | will-it-scale: will-it-scale.per_process_ops  32.8% regression                                     |
> | test machine     | 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory |
> | test parameters  | cpufreq_governor=performance                                                                       |
> |                  | mode=process                                                                                       |
> |                  | nr_task=100%                                                                                       |
> |                  | test=brk2                                                                                          |
> +------------------+----------------------------------------------------------------------------------------------------+
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202601132136.77efd6d7-lkp@intel.com
> 
> 
> Details are as below:
> -------------------------------------------------------------------------------------------------->
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20260113/202601132136.77efd6d7-lkp@intel.com
> 
> =========================================================================================
> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
>   gcc-14/performance/x86_64-rhel-9.4/process/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp2/mmap2/will-it-scale
> 
> commit: 
>   6a67958ab0 ("slab: remove unused PREEMPT_RT specific macros")
>   aa8fdb9e25 ("slab: refill sheaves from all nodes")

Hi,

as discussed at [1] this particular commit restores a behavior analogical to
one that existed before sheaves, so while it may show a regression in
isolation, there should hopefully be also corresponding improvement in an
earlier commit, and those two more or less cancelled out.

What would be more useful is to know the whole series effect (excluding some
preparatory patches). Could you please compare that if anything stands out?
In next-20260127 that would be:

before: d86c9915f4b5 ("mm/slab: make caches with sheaves mergeable")

after: ca43eb67282a ("mm/slub: cleanup and repurpose some stat items")

Additionally, does the patch below improve anything? (on top of
ca43eb67282a). Thanks!

[1] https://lore.kernel.org/all/85d872a3-8192-4668-b5c4-c81ffadc74da@suse.cz/

----8<----
From 5ac96a0bde0c3ea5cecfb4e478e49c9f6deb9c19 Mon Sep 17 00:00:00 2001
From: Vlastimil Babka <vbabka@suse.cz>
Date: Tue, 27 Jan 2026 22:40:26 +0100
Subject: [PATCH] slub: avoid list_lock contention from __refill_objects_any()

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/slub.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 7d7e1ae1922f..3458dfbab85d 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -3378,7 +3378,8 @@ static inline bool pfmemalloc_match(struct slab *slab, gfp_t gfpflags);
 
 static bool get_partial_node_bulk(struct kmem_cache *s,
 				  struct kmem_cache_node *n,
-				  struct partial_bulk_context *pc)
+				  struct partial_bulk_context *pc,
+				  bool allow_spin)
 {
 	struct slab *slab, *slab2;
 	unsigned int total_free = 0;
@@ -3390,7 +3391,10 @@ static bool get_partial_node_bulk(struct kmem_cache *s,
 
 	INIT_LIST_HEAD(&pc->slabs);
 
-	spin_lock_irqsave(&n->list_lock, flags);
+	if (allow_spin)
+		spin_lock_irqsave(&n->list_lock, flags);
+	else if (!spin_trylock_irqsave(&n->list_lock, flags))
+		return false;
 
 	list_for_each_entry_safe(slab, slab2, &n->partial, slab_list) {
 		struct freelist_counters flc;
@@ -6544,7 +6548,8 @@ EXPORT_SYMBOL(kmem_cache_free_bulk);
 
 static unsigned int
 __refill_objects_node(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int min,
-		      unsigned int max, struct kmem_cache_node *n)
+		      unsigned int max, struct kmem_cache_node *n,
+		      bool allow_spin)
 {
 	struct partial_bulk_context pc;
 	struct slab *slab, *slab2;
@@ -6556,7 +6561,7 @@ __refill_objects_node(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int mi
 	pc.min_objects = min;
 	pc.max_objects = max;
 
-	if (!get_partial_node_bulk(s, n, &pc))
+	if (!get_partial_node_bulk(s, n, &pc, allow_spin))
 		return 0;
 
 	list_for_each_entry_safe(slab, slab2, &pc.slabs, slab_list) {
@@ -6650,7 +6655,8 @@ __refill_objects_any(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int min
 					n->nr_partial <= s->min_partial)
 				continue;
 
-			r = __refill_objects_node(s, p, gfp, min, max, n);
+			r = __refill_objects_node(s, p, gfp, min, max, n,
+						  /* allow_spin = */ false);
 			refilled += r;
 
 			if (r >= min) {
@@ -6691,7 +6697,8 @@ refill_objects(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int min,
 		return 0;
 
 	refilled = __refill_objects_node(s, p, gfp, min, max,
-					 get_node(s, local_node));
+					 get_node(s, local_node),
+					 /* allow_spin = */ true);
 	if (refilled >= min)
 		return refilled;
 
-- 
2.52.0


