Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5BC1DE2D5
	for <oe-lkp@lists.linux.dev>; Wed, 29 Jan 2025 17:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738173201; cv=none; b=RqioKTRi/0otIq8jQT8J1TsmIeov9cUS48WThsXqTjsXT4mRWDVBlzb9eRRa3MYvyyerKgyBqk05qenGw7GiGr6fMeUEBFORKuFx9a+OBSgB2CvdRSIPhcOYGWRtR+ZqxZ734t0Ow5BOlHZsMqwTK88izSNHnbbzd9duNSDD0tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738173201; c=relaxed/simple;
	bh=PoTwTghGg0+4nalsAX2QGDktONbaK1ZHMqdVpgG2K6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZiHdVkNMrn2EAYaUYdQRaFQU8jp/AtFG9FfZJtFKwdFNqlZBnqKi0iDtU/Eww2ofEcL8vCcUySOiS41ys83GOu6FW0YMZAJzOYf0LwI7rctuOat6u5RNRak8TZD8YXiDSjWSbUYnlIvHF1iZfYwabpabmfq8aTs+U1WLq1jA2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=M7ONUVL/; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="M7ONUVL/"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ef748105deso9631849a91.1
        for <oe-lkp@lists.linux.dev>; Wed, 29 Jan 2025 09:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738173198; x=1738777998; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KdtDciE7wia/Lnf64s9wqrIFVKAtIQ+OPsXndNgHzhU=;
        b=M7ONUVL/z8HeXJbX7oLZzLu0W3Qj/jTuzNDebjjLeemCEaLX+/rYHRPzl1j26zlWWy
         xZWf8gc1k5DTtAPn/Zmbbhoj+Se6o7aPo006IWmhzSfvOXLdCOpKyU3MymfjAtY3LwXb
         CkpbWjl1eOi34jvluvJCwaNRdwT3HlpWz1dSrp8PVwZ+AK/Wqi+y+9/vLu6uCebqrekg
         O6YomXgbW0Lpxn1o0HpZF1j0zk4DWr3j4qGKF2s9+H+g7A5PtdS3QbxFyFUuABJaPw9c
         hCxn+DUUhhcf+msqxa91z0Tp/w7pbjmIMTOsv7MI+ZbRZcMc7I8TEhjSS3R+q8y2M4Qq
         dNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738173198; x=1738777998;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KdtDciE7wia/Lnf64s9wqrIFVKAtIQ+OPsXndNgHzhU=;
        b=KWEaBKgONwLentdRQYxxd3kY+UcnrH0FiiB7ce8VWI/tEtAiUKEEPw0k5s7ibB0QxH
         89XMFdg58xGLrUUdYXslVU0nrlnTJ3RRX6HaM08yO+b4VSvTdnL8Mw+vY5Fn25kLHu1r
         P2kM40pGeURgxt+65manA/KRYNLsxMoNYNObAjze2gl+yWfm/YLfLpNfaCAq7SWQNuzT
         138ENDU1uT4RpgiABfFduALv29RimbhicbQwLGWd2gfZ0VW2VzOLRNXUysa7d9JP41ej
         /yn7YMh5FNeKkRcn2393whlNB9zuG1hOvjyWKBLXuJd+KdTFIxQ0OXXh1CWQy98oS4uf
         Lbtg==
X-Forwarded-Encrypted: i=1; AJvYcCWZB/kmdBLt1+mQCNwWTP11Qugsd+EMOY6I3S3ZkXN0kLxHQOU8PbceAMcQHDuv9iUnnIA4Sx4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4n1h5Ne29LM5ukUZvzEsZzld4eTk3e9Af5uIvirePVyVccJcA
	ADXIRWssHD2IzZpWvl1tDNJizFD7tAIc/3k6pVQefqjqiWIn/XdK64IKdcApPso=
X-Gm-Gg: ASbGncvUiFpnah38DC8ZPP0mw0umtR+ZOS1EcbiFLQptOzJ/IjMO1uU0Tcu99OIIeEi
	u9osRG/1tEVD0Ix7s2THBZMlZ/qI5ix5XX3dJVipv5DrBFwcc+Mflz2SwQk1SPKHDzg3iIxfXAI
	fZQqUAXFe8paBM8QwssoOQGYUjk7vS8m72W231t2Y89YmQbmcSvlGCEEgF2uq+Bxyaj4KNeZRyG
	I9cdQTPZdgjmNzH7Z+PzFHh7D6AxkWfkyIA4dt2Zr/npButHKIZkZlHqZqTmLLFubgDQedV5S33
	EUlkRcNs7QC1FnTkAIwnJ9ZBre6McvY6iho7Bb93VsbzBednMrrHKi0TBDKZxveotAMpxCT6B2J
	VqIC1lGrBcGqhlBU=
X-Google-Smtp-Source: AGHT+IGoJvasbXxXpHQCiqhGeXCLcysAaQlK/QCdxvK3cdUTVFD8UHXCU5mbBYZY56hWe0Z2Pnb2og==
X-Received: by 2002:a17:90b:2e8b:b0:2ee:9d57:243 with SMTP id 98e67ed59e1d1-2f83abbd864mr5497816a91.1.1738173197782;
        Wed, 29 Jan 2025 09:53:17 -0800 (PST)
Received: from ?IPV6:240e:370:8b10:5140:d8c5:7248:cf0a:d072? ([240e:370:8b10:5140:d8c5:7248:cf0a:d072])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bc9823dsm2058859a91.5.2025.01.29.09.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 09:53:17 -0800 (PST)
Message-ID: <92fe6c2b-ef8d-4ed4-bf96-27f0760329b7@bytedance.com>
Date: Thu, 30 Jan 2025 01:53:06 +0800
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [x86] 4817f70c25: stress-ng.mmapaddr.ops_per_sec
 63.0% regression
Content-Language: en-US
To: Rik van Riel <riel@surriel.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 David Rientjes <rientjes@google.com>, Hugh Dickins <hughd@google.com>,
 Jann Horn <jannh@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Mel Gorman <mgorman@suse.de>, Muchun Song <muchun.song@linux.dev>,
 Peter Xu <peterx@redhat.com>, Will Deacon <will@kernel.org>,
 Zach O'Keefe <zokeefe@google.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>
References: <20250128113100.GB7145@noisy.programming.kicks-ass.net>
 <2c599f1f-f63b-4504-a026-46bf73954124@redhat.com>
 <20250128132847.GB505@noisy.programming.kicks-ass.net>
 <18172465-37e3-48a9-9d67-0d44fdcb93bd@redhat.com>
 <8b661116-0a85-4928-91ed-3c01ebbf8d39@bytedance.com>
 <2212111cad3180948cf388a7e5c8689df0fdda08.camel@surriel.com>
 <14159fb4-0c59-4653-9265-73f415e70063@bytedance.com>
 <20250129105920.7a4bffa1@fangorn> <Z5pTZ0XLFzfM5dic@casper.infradead.org>
 <488401565cac6b5f9e3232d0ca481055876c919b.camel@surriel.com>
 <05da0ae9-073e-4578-b65c-f837c28eead8@paulmck-laptop>
 <20250129115320.1334ad5f@fangorn>
 <96f55f36-5cb7-4226-a8ea-374a7891ecff@bytedance.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <96f55f36-5cb7-4226-a8ea-374a7891ecff@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/1/30 01:33, Qi Zheng wrote:
> 
> 
> On 2025/1/30 00:53, Rik van Riel wrote:
>> On Wed, 29 Jan 2025 08:36:12 -0800
>> "Paul E. McKenney" <paulmck@kernel.org> wrote:
>>> On Wed, Jan 29, 2025 at 11:14:29AM -0500, Rik van Riel wrote:
>>
>>>> Paul, does this look like it could do the trick,
>>>> or do we need something else to make RCU freeing
>>>> happy again?
>>>
>>> I don't claim to fully understand the issue, but this would prevent
>>> any RCU grace periods starting subsequently from completing.  It would
>>> not prevent RCU callbacks from being invoked for RCU grace periods that
>>> started earlier.
>>>
>>> So it won't prevent RCU callbacks from being invoked.
>>
>> That makes things clear! I guess we need a different approach.
>>
>> Qi, does the patch below resolve the regression for you?
>>
>> ---8<---
>>
>>  From 5de4fa686fca15678a7e0a186852f921166854a3 Mon Sep 17 00:00:00 2001
>> From: Rik van Riel <riel@surriel.com>
>> Date: Wed, 29 Jan 2025 10:51:51 -0500
>> Subject: [PATCH 2/2] mm,rcu: prevent RCU callbacks from running with 
>> pcp lock
>>   held
>>
>> Enabling MMU_GATHER_RCU_TABLE_FREE can create contention on the
>> zone->lock.  This turns out to be because in some configurations
>> RCU callbacks are called when IRQs are re-enabled inside
>> rmqueue_bulk, while the CPU is still holding the per-cpu pages lock.
>>
>> That results in the RCU callbacks being unable to grab the
>> PCP lock, and taking the slow path with the zone->lock for
>> each item freed.
>>
>> Speed things up by blocking RCU callbacks while holding the
>> PCP lock.
>>
>> Signed-off-by: Rik van Riel <riel@surriel.com>
>> Suggested-by: Paul McKenney <paulmck@kernel.org>
>> Reported-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>>   mm/page_alloc.c | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index 6e469c7ef9a4..73e334f403fd 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -94,11 +94,15 @@ static DEFINE_MUTEX(pcp_batch_high_lock);
>>   #if defined(CONFIG_SMP) || defined(CONFIG_PREEMPT_RT)
>>   /*
>> - * On SMP, spin_trylock is sufficient protection.
>> + * On SMP, spin_trylock is sufficient protection against recursion.
>>    * On PREEMPT_RT, spin_trylock is equivalent on both SMP and UP.
>> + *
>> + * Block softirq execution to prevent RCU frees from running in softirq
>> + * context while this CPU holds the PCP lock, which could result in a 
>> whole
>> + * bunch of frees contending on the zone->lock.
>>    */
>> -#define pcp_trylock_prepare(flags)    do { } while (0)
>> -#define pcp_trylock_finish(flag)    do { } while (0)
>> +#define pcp_trylock_prepare(flags)    local_bh_disable()
>> +#define pcp_trylock_finish(flag)    local_bh_enable()
> 
> I just tested this, and it doesn't seem to improve much:
> 
> root@debian:~# stress-ng --timeout 60 --times --verify --metrics 
> --no-rand-seed --mmapaddr 64
> stress-ng: info:  [671] dispatching hogs: 64 mmapaddr
> stress-ng: info:  [671] successful run completed in 60.07s (1 min, 0.07 
> secs)
> stress-ng: info:  [671] stressor       bogo ops real time  usr time  sys 
> time   bogo ops/s   bogo ops/s
> stress-ng: info:  [671]                           (secs)    (secs) 
> (secs)   (real time) (usr+sys time)
> stress-ng: info:  [671] mmapaddr       19803127     60.01    235.20 
> 1146.76    330007.29     14329.74
> stress-ng: info:  [671] for a 60.07s run time:
> stress-ng: info:  [671]    1441.59s available CPU time
> stress-ng: info:  [671]     235.57s user time   ( 16.34%)
> stress-ng: info:  [671]    1147.20s system time ( 79.58%)
> stress-ng: info:  [671]    1382.77s total time  ( 95.92%)
> stress-ng: info:  [671] load average: 41.42 11.91 4.10
> 
> The _raw_spin_unlock_irqrestore hotspot still exists:
> 
>    15.87%  [kernel]  [k] _raw_spin_unlock_irqrestore
>     9.18%  [kernel]  [k] clear_page_rep
>     7.03%  [kernel]  [k] do_syscall_64
>     3.67%  [kernel]  [k] _raw_spin_lock
>     3.28%  [kernel]  [k] __slab_free
>     2.03%  [kernel]  [k] rcu_cblist_dequeue
>     1.98%  [kernel]  [k] flush_tlb_mm_range
>     1.88%  [kernel]  [k] lruvec_stat_mod_folio.part.131
>     1.85%  [kernel]  [k] get_page_from_freelist
>     1.64%  [kernel]  [k] kmem_cache_alloc_noprof
>     1.61%  [kernel]  [k] tlb_remove_table_rcu
>     1.39%  [kernel]  [k] mtree_range_walk
>     1.36%  [kernel]  [k] __alloc_frozen_pages_noprof
>     1.27%  [kernel]  [k] pmd_install
>     1.24%  [kernel]  [k] memcpy_orig
>     1.23%  [kernel]  [k] __call_rcu_common.constprop.77
>     1.17%  [kernel]  [k] free_pgd_range
>     1.15%  [kernel]  [k] pte_alloc_one
> 
> The call stack is as follows:
> 
> bpftrace -e 'k:_raw_spin_unlock_irqrestore {@[kstack,comm]=count();} 
> interval:s:1 {exit();}'
> 
> @[
>      _raw_spin_unlock_irqrestore+5
>      hrtimer_interrupt+289
>      __sysvec_apic_timer_interrupt+85
>      sysvec_apic_timer_interrupt+108
>      asm_sysvec_apic_timer_interrupt+26
>      tlb_remove_table_rcu+48
>      rcu_do_batch+424
>      rcu_core+401
>      handle_softirqs+204
>      irq_exit_rcu+208
>      sysvec_apic_timer_interrupt+61
>      asm_sysvec_apic_timer_interrupt+26
> , stress-ng-mmapa]: 8
> 
> The tlb_remove_table_rcu() is called very rarely, so I guess the
> PCP cache is basically empty at this time, resulting in the following
> call stack:
> 

But I think this may be just an extreme test scenario, because my test
machine has no other load at this time. Under normal workload, page
table pages should only occupy a small part of the PCP cache, and
delayed freeing should not have much impact on the PCP cache.

Thanks!
