Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270F1334693
	for <oe-lkp@lists.linux.dev>; Thu, 16 Oct 2025 17:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760635588; cv=none; b=juQlnrVYNR+YsxUHipWPBUFt8A1KekpWvxL7LM67i3DMyoHee0zxyD0YIO5HB92CY/R2CPQiEm0eNhBQUUakCwR/3p3XlmGzfl0N9qUWNqCb1oz5ihYv9PJD5WVZQcH8QwuTuey3OXaHnXhP9w9H02qJGEdlokJz3WuFRpsRmv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760635588; c=relaxed/simple;
	bh=TBbITqdsA+oCIyToPSi38jprG/qiHGvGOnh9sSi/7UA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hs3t9BH/vlyj5KgDBX+kICmQomMW5GRqEa5GtGkoHGn/3Xl6TvtH6pItBxNZMEdNQiyyOfVxGAWH4I8ZXtzXPWp+HW20GGlDElcd6z5g+lBYooAOMnlFtubF0wjsYJOpTbU5F75nzW7MwrnpjCxCNtSUOM0gwO1pAX50SFLe1NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=d+qzKFQJ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ks+/ERJZ; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=d+qzKFQJ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ks+/ERJZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="d+qzKFQJ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ks+/ERJZ";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="d+qzKFQJ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ks+/ERJZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3F48521EE9;
	Thu, 16 Oct 2025 17:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1760635585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zXvoYWF7Bpk85Umq25D609w+AL6Bq8FAkD25cWfAdkA=;
	b=d+qzKFQJQzjKGr9+HnfXiyk6tgpBI2j0Ky9AZ9+flmWAuoSe48MwQGhGhOW2HD3DBE2Hel
	8ix2+a7kEyfgGf64u8NHWFto4EwBGznIZk1r/aOqGb4jFH0hd3c0pF6qbjZFmFytcjRbd6
	rJaWvl57WyNCyGfM9o+h3Pm4JqT2eQc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1760635585;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zXvoYWF7Bpk85Umq25D609w+AL6Bq8FAkD25cWfAdkA=;
	b=ks+/ERJZssQdB4X2GJF0UoE8Regkg/naRJm5IK9lkJRuIkF1C3dXc0Q3R5LVm/lrswTEKA
	IuTh9/VaORSBK4Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1760635585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zXvoYWF7Bpk85Umq25D609w+AL6Bq8FAkD25cWfAdkA=;
	b=d+qzKFQJQzjKGr9+HnfXiyk6tgpBI2j0Ky9AZ9+flmWAuoSe48MwQGhGhOW2HD3DBE2Hel
	8ix2+a7kEyfgGf64u8NHWFto4EwBGznIZk1r/aOqGb4jFH0hd3c0pF6qbjZFmFytcjRbd6
	rJaWvl57WyNCyGfM9o+h3Pm4JqT2eQc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1760635585;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zXvoYWF7Bpk85Umq25D609w+AL6Bq8FAkD25cWfAdkA=;
	b=ks+/ERJZssQdB4X2GJF0UoE8Regkg/naRJm5IK9lkJRuIkF1C3dXc0Q3R5LVm/lrswTEKA
	IuTh9/VaORSBK4Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3183C1340C;
	Thu, 16 Oct 2025 17:26:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BYuUCsEq8WgoLwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 16 Oct 2025 17:26:25 +0000
Message-ID: <1ff90274-bc74-458a-8c73-7ac8d45e6198@suse.cz>
Date: Thu, 16 Oct 2025 19:26:24 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [vbabka:b4/sheaves-for-all] [slab] de840681a1:
 BUG:using_smp_processor_id()in_preemptible
Content-Language: en-US
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-mm@kvack.org
References: <202510161416.b7adda58-lkp@intel.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <202510161416.b7adda58-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.cz:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[4]
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 

On 10/16/25 08:08, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "BUG:using_smp_processor_id()in_preemptible" on:
> 
> commit: de840681a162e0a5a0862e7a0b495fb34deab7ef ("slab: remove cpu (partial) slabs usage from allocation paths")
> https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git b4/sheaves-for-all
> 
> in testcase: boot
> 
> config: i386-randconfig-002-20251015
> compiler: gcc-14
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202510161416.b7adda58-lkp@intel.com
> 

Thanks, no more disabled preemption so use the raw version as we don't
need it to be stable. Will fold this in:
----8<----
diff --git a/mm/slub.c b/mm/slub.c
index 91e1db412018..cd4b0833fb4a 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1032,7 +1032,7 @@ static void set_track_update(struct kmem_cache *s, void *object,
        p->handle = handle;
 #endif
        p->addr = addr;
-       p->cpu = smp_processor_id();
+       p->cpu = raw_smp_processor_id();
        p->pid = current->pid;
        p->when = jiffies;
 }
@@ -4481,16 +4481,8 @@ static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
        pc.orig_size = orig_size;
        freelist = get_partial(s, node, &pc);
        if (freelist) {
-               /*
-                * TODO: check if still applicable
-                *
-                * Due to disabled preemption we need to disallow
-                * blocking. The flags are further adjusted by
-                * gfp_nested_mask() in stack_depot itself.
-                */
                if (kmem_cache_debug_flags(s, SLAB_STORE_USER))
-                       set_track(s, freelist, TRACK_ALLOC, addr,
-                                 gfpflags & ~(__GFP_DIRECT_RECLAIM));
+                       set_track(s, freelist, TRACK_ALLOC, addr, gfpflags);
 
                return freelist;
        }
@@ -4515,8 +4507,7 @@ static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
                goto new_objects;
 
        if (kmem_cache_debug_flags(s, SLAB_STORE_USER))
-               set_track(s, freelist, TRACK_ALLOC, addr,
-                         gfpflags & ~(__GFP_DIRECT_RECLAIM));
+               set_track(s, freelist, TRACK_ALLOC, addr, gfpflags);
 
        return freelist;
 }
lines 1-41/41 (END)

