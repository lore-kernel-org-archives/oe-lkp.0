Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044F0A93E
	for <oe-lkp@lists.linux.dev>; Wed, 26 Jul 2023 10:06:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 942091F890;
	Wed, 26 Jul 2023 10:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1690365994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GPktWs9VgmR9RgbGAAfENWTA8Yrnts52yiHDqYW1GHw=;
	b=H2ceb6qXKd0q7XUUFC/rXp9aRuMZU9H5K7yk+bc8uHNzDJFVjvVs/gLxxD0p+GGggvqwEW
	40guVFbkIWZc1yR4u1cc44hZ5WFr5r/J+xXiS+xyd+L4T05y6xNAUnrYXn3Jg+VrjwqoFM
	1+BT3pFG1SSzsFryfvhIvvNuGdFN+vg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1690365994;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GPktWs9VgmR9RgbGAAfENWTA8Yrnts52yiHDqYW1GHw=;
	b=rD0DyCzxUFMmUAhdYkcR1oZn1YXKTIkyWFRLMqyUMvR3T4CSPw9pJzYdFWL/U5ypn3krvA
	HeGwhB6zyxNwU0Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 50E6A1341F;
	Wed, 26 Jul 2023 10:06:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uw7sEirwwGRxfAAAMHmgww
	(envelope-from <vbabka@suse.cz>); Wed, 26 Jul 2023 10:06:34 +0000
Message-ID: <91bd907e-adc0-d7c7-7eaa-da199689c99c@suse.cz>
Date: Wed, 26 Jul 2023 12:06:33 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] [RFC PATCH v2]mm/slub: Optimize slub memory usage
Content-Language: en-US
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>, Feng Tang <feng.tang@intel.com>
Cc: "Sang, Oliver" <oliver.sang@intel.com>, Jay Patel
 <jaypatel@linux.ibm.com>, "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>,
 lkp <lkp@intel.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "Huang, Ying" <ying.huang@intel.com>, "Yin, Fengwei"
 <fengwei.yin@intel.com>, "cl@linux.com" <cl@linux.com>,
 "penberg@kernel.org" <penberg@kernel.org>,
 "rientjes@google.com" <rientjes@google.com>,
 "iamjoonsoo.kim@lge.com" <iamjoonsoo.kim@lge.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
 "tsahu@linux.ibm.com" <tsahu@linux.ibm.com>,
 "piyushs@linux.ibm.com" <piyushs@linux.ibm.com>
References: <20230628095740.589893-1-jaypatel@linux.ibm.com>
 <202307172140.3b34825a-oliver.sang@intel.com>
 <CAB=+i9QY99=NzQugoMCdbEwkCKJObxx4DwWXwNjMqyMRYrgOHA@mail.gmail.com>
 <ZLijZ8QRc0FRgJIF@xsang-OptiPlex-9020>
 <CAB=+i9QmF2C7QsZBEW0HMT-PGcEf3MeCukVaq0_O1HkGy7n93w@mail.gmail.com>
 <ZLk7UpWWLf5agKDW@feng-clx>
 <CAB=+i9S6Ykp90+4N1kCE=hiTJTE4wzJDi8k5pBjjO_3sf0aeqg@mail.gmail.com>
 <ZL6MQXOaOHTvdGti@feng-clx>
 <CAB=+i9SNS-Z8-WARiivMBy5gibZDCkpS+sk8v+2awvyffAwB8g@mail.gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <CAB=+i9SNS-Z8-WARiivMBy5gibZDCkpS+sk8v+2awvyffAwB8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/25/23 05:13, Hyeonggon Yoo wrote:
> On Mon, Jul 24, 2023 at 11:43 PM Feng Tang <feng.tang@intel.com> wrote:
>>
>> On Thu, Jul 20, 2023 at 11:05:17PM +0800, Hyeonggon Yoo wrote:
>> > > > > let me introduce our test process.
>> > > > >
>> > > > > we make sure the tests upon commit and its parent have exact same environment
>> > > > > except the kernel difference, and we also make sure the config to build the
>> > > > > commit and its parent are identical.
>> > > > >
>> > > > > we run tests for one commit at least 6 times to make sure the data is stable.
>> > > > >
>> > > > > such like for this case, we rebuild the commit and its parent's kernel, the
>> > > > > config is attached FYI.
>> > > >
>> > > > Hello Oliver,
>> > > >
>> > > > Thank you for confirming the testing environment is totally fine.
>> > > > and I'm sorry. I didn't mean to offend that your tests were bad.
>> > > >
>> > > > It was more like  "oh, the data totally doesn't make sense to me"
>> > > > and I blamed the tests rather than my poor understanding of the data ;)
>> > > >
>> > > > Anyway,
>> > > > as the data shows a repeatable regression,
>> > > > let's think more about the possible scenario:
>> > > >
>> > > > I can't stop thinking that the patch must've affected the system's
>> > > > reclamation behavior in some way.
>> > > > (I think more active anon pages with a similar number total of anon
>> > > > pages implies the kernel scanned more pages)
>> > > >
>> > > > It might be because kswapd was more frequently woken up (possible if
>> > > > skbs were allocated with GFP_ATOMIC)
>> > > > But the data provided is not enough to support this argument.
>> > > >
>> > > > >  2.43 ± 7% +4.5 6.90 ± 11% perf-profile.children.cycles-pp.get_partial_node
>> > > > >  3.23 ±  5%      +4.5        7.77 ±  9%  perf-profile.children.cycles-pp.___slab_alloc
>> > > > >  7.51 ±  2%      +4.6       12.11 ±  5%  perf-profile.children.cycles-pp.kmalloc_reserve
>> > > > > 6.94 ±  2%      +4.7       11.62 ±  6%  perf-profile.children.cycles-pp.__kmalloc_node_track_caller
>> > > > > 6.46 ±  2%      +4.8       11.22 ±  6%  perf-profile.children.cycles-pp.__kmem_cache_alloc_node
>> > > > >  8.48 ±  4%      +7.9       16.42 ±  8%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
>> > > > >  6.12 ±  6%      +8.6       14.74 ±  9%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
>> > > >
>> > > > And this increased cycles in the SLUB slowpath implies that the actual
>> > > > number of objects available in
>> > > > the per cpu partial list has been decreased, possibly because of
>> > > > inaccuracy in the heuristic?
>> > > > (cuz the assumption that slabs cached per are half-filled, and that
>> > > > slabs' order is s->oo)
>> > >
>> > > From the patch:
>> > >
>> > >  static unsigned int slub_max_order =
>> > > -       IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : PAGE_ALLOC_COSTLY_ORDER;
>> > > +       IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : 2;
>> > >
>> > > Could this be related? that it reduces the order for some slab cache,
>> > > so each per-cpu slab will has less objects, which makes the contention
>> > > for per-node spinlock 'list_lock' more severe when the slab allocation
>> > > is under pressure from many concurrent threads.
>> >
>> > hackbench uses skbuff_head_cache intensively. So we need to check if
>> > skbuff_head_cache's
>> > order was increased or decreased. On my desktop skbuff_head_cache's
>> > order is 1 and I roughly
>> > guessed it was increased, (but it's still worth checking in the testing env)
>> >
>> > But decreased slab order does not necessarily mean decreased number
>> > of cached objects per CPU, because when oo_order(s->oo) is smaller,
>> > then it caches
>> > more slabs into the per cpu slab list.
>> >
>> > I think more problematic situation is when oo_order(s->oo) is higher,
>> > because the heuristic
>> > in SLUB assumes that each slab has order of oo_order(s->oo) and it's
>> > half-filled. if it allocates
>> > slabs with order lower than oo_order(s->oo), the number of cached
>> > objects per CPU
>> > decreases drastically due to the inaccurate assumption.
>> >
>> > So yeah, decreased number of cached objects per CPU could be the cause
>> > of the regression due to the heuristic.
>> >
>> > And I have another theory: it allocated high order slabs from remote node
>> > even if there are slabs with lower order in the local node.
>> >
>> > ofc we need further experiment, but I think both improving the
>> > accuracy of heuristic and
>> > avoiding allocating high order slabs from remote nodes would make SLUB
>> > more robust.
>>
>> I run the reproduce command in a local 2-socket box:
>>
>> "/usr/bin/hackbench" "-g" "128" "-f" "20" "--process" "-l" "30000" "-s" "100"
>>
>> And found 2 kmem_cache has been boost: 'kmalloc-cg-512' and
>> 'skbuff_head_cache'. Only order of 'kmalloc-cg-512' was reduced
>> from 3 to 2 with the patch, while its 'cpu_partial_slabs' was bumped
>> from 2 to 4. The setting of 'skbuff_head_cache' was kept unchanged.
>>
>> And this compiled with the perf-profile info from 0Day's report, that the
>> 'list_lock' contention is increased with the patch:
>>
>>     13.71%    13.70%  [kernel.kallsyms]         [k] native_queued_spin_lock_slowpath                            -      -
>> 5.80% native_queued_spin_lock_slowpath;_raw_spin_lock_irqsave;__unfreeze_partials;skb_release_data;consume_skb;unix_stream_read_generic;unix_stream_recvmsg;sock_recvmsg;sock_read_iter;vfs_read;ksys_read;do_syscall_64;entry_SYSCALL_64_after_hwframe;__libc_read
>> 5.56% native_queued_spin_lock_slowpath;_raw_spin_lock_irqsave;get_partial_node.part.0;___slab_alloc.constprop.0;__kmem_cache_alloc_node;__kmalloc_node_track_caller;kmalloc_reserve;__alloc_skb;alloc_skb_with_frags;sock_alloc_send_pskb;unix_stream_sendmsg;sock_write_iter;vfs_write;ksys_write;do_syscall_64;entry_SYSCALL_64_after_hwframe;__libc_write
> 
> Oh... neither of the assumptions were not true.
> AFAICS it's a case of decreasing slab order increases lock contention,

Oh good, that would be the least surprising result, at least :) Yeah I've
pointed out in my reply to this v2 that this patch should not result in
decreasing slab order, at least for 4k pages.

The v3/v4 is indeed different in that it only affects 64k pages. But the
inital goal from v1 to increase the order for 4k is also no longer there.
Maybe that's fine as there's two things to consider here IMHO. 1) the order
could be increased for 4k pages for some cache sizes to minimize waste
(that's what v1 did, but also for 64k where it was not an improvement) 2)
the orders we have might be too large for 64k pages. Now v4 addresses 2)
AFAICS. We could return also to 1) separately if it shows benefits.

In any case it means the benchmark results on v2 are no longer applicable,
so we could move the discussion to v4:

https://lore.kernel.org/all/20230720102337.2069722-1-jaypatel@linux.ibm.com/

Now I noticed in v4 there's only M: folks from the MAINTAINERS slab section
on Cc: but not R: folks. Next time please Cc: also R: (Hyeonggon and Roman).
Thanks!

> The number of cached objects per CPU is mostly the same (not exactly same,
> because the cpu slab is not accounted for), but only increases the
> number of slabs
> to process while taking slabs (get_partial_node()), and flushing the current
> cpu partial list. (put_cpu_partial() -> __unfreeze_partials())
> 
> Can we do better in this situation? improve __unfreeze_partials()?
> 
>> Also I tried to restore the slub_max_order to 3, and the regression was
>> gone.
>>
>>  static unsigned int slub_max_order =
>> -       IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : 2;
>> +       IS_ENABLED(CONFIG_SLUB_TINY) ? 1 : 3;
>>  static unsigned int slub_min_objects;
>>
>> Thanks,
>> Feng
>>
>> > > I don't have direct data to backup it, and I can try some experiment.
>> >
>> > Thank you for taking time for experiment!
>> >
>> > Thanks,
>> > Hyeonggon
>> >
>> > > > > then retest on this test machine:
>> > > > > 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory

