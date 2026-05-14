Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F5212C534
	for <oe-lkp@lists.linux.dev>; Thu, 14 May 2026 16:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778774583; cv=none; b=fECbyszw5Zgm/Oj18ODRZvGiweU164ztqKt0Dms2wd7KPVmzrRQKOfNg8hUKQIZizsvtMhJvtHPZQWxSVNLrRMMM++2Y1UmQXxSLLqqMUBoVCjPPsnO/mVvPys75Br195JfYfQLLnek7qKxbGA2U3EaW75QXKSflrnno9jYHI2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778774583; c=relaxed/simple;
	bh=tR+v929baoKkmWPKVhEbX8jVI0XOU70hiwX9rAM6q5Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QRih09IVnBOwaAblpuPx8I2pHLLAhupRN0HWKCv1jn8U/gp4T9ooBixHthawVGPQROM9OjrusYsg/0ZmbaiyZpmyTEtdwDacc7ekTCUr11CKkd3fcKuiDCLifEjlLjM+4uPObgwJnaHcG8pUNf4EIIN7somNF473MuMv1IvXMlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o6S03N2V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o6S03N2V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E501C2BCB3;
	Thu, 14 May 2026 16:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778774582;
	bh=tR+v929baoKkmWPKVhEbX8jVI0XOU70hiwX9rAM6q5Q=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=o6S03N2Vb6Bnya0M0gTxZaYmBO6u9oCKKJ+dC0bhcbRGf8da6XQ6ApMDwZ4GLuAnQ
	 5aEtaHfeHUspKMuG0lcvEka/YNh4kq05/9phbnoPipiZZlakLSQmzVE7mKlHfdq5ND
	 oIE7xUyKv3f2UdOHmJgwfs2uTP0PlvQNPIirSOJe1nD9de147v1MekZ6gQhdJqOAks
	 RKR07htrwmhV4FRaJLnY6ZaATv+ummWDutTSujcqeeXu0lsySnf5uYgywEybNOSSBT
	 6MNiJnTlWoAvKXF8algc0qFQ6mLt3u33zbsXd+8bGc3SkFKvKPlXCoe4H6UWzLWNC9
	 6sFEa1HPszzYg==
Message-ID: <d28b4a2f-501a-45dc-8589-acc41633e2e3@kernel.org>
Date: Thu, 14 May 2026 18:02:59 +0200
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
 <eda98e7b-67fd-4a36-9d39-3de26827599b@kernel.org>
In-Reply-To: <eda98e7b-67fd-4a36-9d39-3de26827599b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/14/26 18:00, Vlastimil Babka (SUSE) wrote:
> On 5/14/26 16:45, Vlastimil Babka (SUSE) wrote:
>> On 5/11/26 16:45, kernel test robot wrote:
>>> 
>>> 
>>> Hello,
>>> 
>>> kernel test robot noticed a 6.3% regression of will-it-scale.per_process_ops on:
>> 
>> Yay for an optimization that was supposed to have no tradeoffs :)
> 
> Does this help? I don't expect much, but perhaps...

And a separate measurement with this on top of the previous one, plase?
It's just that __slab_free() would have been adding to tail so let's try it
too.
 
From 8fba1377797478a945d97ad6163021d95ac7665c Mon Sep 17 00:00:00 2001
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Thu, 14 May 2026 18:00:52 +0200
Subject: [PATCH] mm, slab: ADD_TO_TAIL in __refill_objects_node

---
 mm/slub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/slub.c b/mm/slub.c
index 0cc6c88f11e3..35e574e94538 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -7193,7 +7193,7 @@ __refill_objects_node(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int mi
 		list_for_each_entry_safe(slab, slab2, &pc.slabs, slab_list) {
 
 			list_del(&slab->slab_list);
-			add_partial(n, slab, ADD_TO_HEAD);
+			add_partial(n, slab, ADD_TO_TAIL);
 		}
 
 		spin_unlock_irqrestore(&n->list_lock, flags);
-- 
2.54.0


