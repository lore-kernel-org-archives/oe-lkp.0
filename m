Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22F13F8D1
	for <oe-lkp@lists.linux.dev>; Wed, 20 Dec 2023 15:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=linux.com
Received: by gentwo.org (Postfix, from userid 1003)
	id 61D2440A8A; Wed, 20 Dec 2023 07:42:17 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 5F15D40A89;
	Wed, 20 Dec 2023 07:42:17 -0800 (PST)
Date: Wed, 20 Dec 2023 07:42:17 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@linux.com>
To: Yin Fengwei <fengwei.yin@intel.com>
cc: Yang Shi <shy828301@gmail.com>, kernel test robot <oliver.sang@intel.com>, 
    Rik van Riel <riel@surriel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
    Linux Memory Management List <linux-mm@kvack.org>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Matthew Wilcox <willy@infradead.org>, ying.huang@intel.com, 
    feng.tang@intel.com
Subject: Re: [linux-next:master] [mm] 1111d46b5c: stress-ng.pthread.ops_per_sec
 -84.3% regression
In-Reply-To: <ec48d168-284b-4376-97a7-090273a3ae5e@intel.com>
Message-ID: <edb35574-e8be-adc8-a756-96bcbab2f0af@linux.com>
References: <202312192310.56367035-oliver.sang@intel.com> <CAHbLzkogaL-VTuZbBbPp=O8TPZxJmabJLRx1hrD-65rtbRmTtQ@mail.gmail.com> <ec48d168-284b-4376-97a7-090273a3ae5e@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Wed, 20 Dec 2023, Yin Fengwei wrote:

>> Interesting, wasn't the same regression seen last time? And I'm a
>> little bit confused about how pthread got regressed. I didn't see the
>> pthread benchmark do any intensive memory alloc/free operations. Do
>> the pthread APIs do any intensive memory operations? I saw the
>> benchmark does allocate memory for thread stack, but it should be just
>> 8K per thread, so it should not trigger what this patch does. With
>> 1024 threads, the thread stacks may get merged into one single VMA (8M
>> total), but it may do so even though the patch is not applied.
> stress-ng.pthread test code is strange here:
>
> https://github.com/ColinIanKing/stress-ng/blob/master/stress-pthread.c#L573
>
> Even it allocates its own stack, but that attr is not passed
> to pthread_create. So it's still glibc to allocate stack for
> pthread which is 8M size. This is why this patch can impact
> the stress-ng.pthread testing.

Hmmm... The use of calloc()  for 8M triggers an mmap I guess.

Why is that memory slower if we align the adress to a 2M boundary? Because 
THP can act faster and creates more overhead?

> while this time, the hotspot is in (pmd_lock from do_madvise I suppose):
>   - 55.02% zap_pmd_range.isra.0
>      - 53.42% __split_huge_pmd
>         - 51.74% _raw_spin_lock
>            - 51.73% native_queued_spin_lock_slowpath
>               + 3.03% asm_sysvec_call_function
>         - 1.67% __split_huge_pmd_locked
>            - 0.87% pmdp_invalidate
>               + 0.86% flush_tlb_mm_range
>      - 1.60% zap_pte_range
>         - 1.04% page_remove_rmap
>              0.55% __mod_lruvec_page_state

Ok so we have 2M mappings and they are split because of some action on 4K 
segments? Guess because of the guard pages?

>> More time spent in madvise and munmap. but I'm not sure whether this
>> is caused by tearing down the address space when exiting the test. If
>> so it should not count in the regression.
> It's not for the whole address space tearing down. It's for pthread
> stack tearing down when pthread exit (can be treated as address space
> tearing down? I suppose so).
>
> https://github.com/lattera/glibc/blob/master/nptl/allocatestack.c#L384
> https://github.com/lattera/glibc/blob/master/nptl/pthread_create.c#L576
>
> Another thing is whether it's worthy to make stack use THP? It may be
> useful for some apps which need large stack size?

No can do since a calloc is used to allocate the stack. How can the kernel 
distinguish the allocation?

