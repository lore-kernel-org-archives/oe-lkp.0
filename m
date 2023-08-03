Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72BD1ED48
	for <oe-lkp@lists.linux.dev>; Thu,  3 Aug 2023 14:55:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E62BB1F45F;
	Thu,  3 Aug 2023 14:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1691074492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2m+DPw2kbwNaYOowHVlZk01PTLJht/UOyrDYeHeRlHA=;
	b=OjD8Rfoz7/voV285j5naIDD9KumULZ4z4P6Bcyu7JNjqq5Nm1aDkAI70YXkr/4FbdYVjou
	bbrwBv6tT5yLNXdsc5KJafbsTZDuKD8zF7Zd0YdfQ/o+8v8mq6zAPDuiR27QPqTvJaz28y
	7hbFCw6/dEJDayvNnGxr2B8iPFQvepo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1691074492;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2m+DPw2kbwNaYOowHVlZk01PTLJht/UOyrDYeHeRlHA=;
	b=PRU6WTvyXCbfYkK39HsYmTrC0U3+1uLiEZqvg+Ma06FQFtxp/ui5mfuIEjNkpY9HrieJVK
	rN0pqneQZWH6JtBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 839CC134B0;
	Thu,  3 Aug 2023 14:54:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 324FH7y/y2QPHwAAMHmgww
	(envelope-from <vbabka@suse.cz>); Thu, 03 Aug 2023 14:54:52 +0000
Message-ID: <1f88aff2-8027-1020-71b2-6a6528f82207@suse.cz>
Date: Thu, 3 Aug 2023 16:54:52 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [RFC 2/2] mm/slub: prefer NUMA locality over slight memory saving
 on NUMA machines
Content-Language: en-US
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>, Christoph Lameter <cl@linux.com>,
 Pekka Enberg <penberg@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 David Rientjes <rientjes@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Feng Tang
 <feng.tang@intel.com>, "Sang, Oliver" <oliver.sang@intel.com>,
 Jay Patel <jaypatel@linux.ibm.com>, Binder Makin <merimus@google.com>,
 aneesh.kumar@linux.ibm.com, tsahu@linux.ibm.com, piyushs@linux.ibm.com,
 fengwei.yin@intel.com, ying.huang@intel.com, lkp <lkp@intel.com>,
 "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20230723190906.4082646-1-42.hyeyoo@gmail.com>
 <20230723190906.4082646-3-42.hyeyoo@gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20230723190906.4082646-3-42.hyeyoo@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/23/23 21:09, Hyeonggon Yoo wrote:
> By default, SLUB sets remote_node_defrag_ratio to 1000, which makes it
> (in most cases) take slabs from remote nodes first before trying allocating
> new folios on the local node from buddy.
> 
> Documentation/ABI/testing/sysfs-kernel-slab says:
>> The file remote_node_defrag_ratio specifies the percentage of
>> times SLUB will attempt to refill the cpu slab with a partial
>> slab from a remote node as opposed to allocating a new slab on
>> the local node.  This reduces the amount of wasted memory over
>> the entire system but can be expensive.
> 
> Although this made sense when it was introduced, the portion of
> per node partial lists in the overall SLUB memory usage has been decreased
> since the introduction of per cpu partial lists. Therefore, it's worth
> reevaluating its overhead on performance and memory usage.
> 
> [
> 	XXX: Add performance data. I tried to measure its impact on
> 	hackbench with a 2 socket NUMA 	machine. but it seems hackbench is
> 	too synthetic to benefit from this, because the	skbuff_head_cache's
> 	size fits into the last level cache.
> 
> 	Probably more realistic workloads like netperf would benefit
> 	from this?
> ]
> 
> Set remote_node_defrag_ratio to zero by default, and the new behavior is:
> 	1) try refilling per CPU partial list from the local node
> 	2) try allocating new slabs from the local node without reclamation
> 	3) try refilling per CPU partial list from remote nodes
> 	4) try allocating new slabs from the local node or remote nodes
> 
> If user specified remote_node_defrag_ratio, it probabilistically tries
> 3) first and then try 2) and 4) in order, to avoid unexpected behavioral
> change from user's perspective.

It makes sense to me, but as you note it would be great to demonstrate
benefits, because it adds complexity, especially in the already complex
___slab_alloc(). Networking has been indeed historically a workload very
sensitive to slab performance, so seems a good candidate.

We could also postpone this until we have tried the percpu arrays
improvements discussed at LSF/MM.

