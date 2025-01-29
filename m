Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F809149C50
	for <oe-lkp@lists.linux.dev>; Wed, 29 Jan 2025 17:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738172051; cv=none; b=o9nmrouAzUrSfW+pk/Eic2dmRVCmV1peSqgkhr2wuh8IXWNKzdISQlrtz4ctsdgEwVCvvqduGXXqSxsuQf7EDovuP+jmW74//ap/JGvqpbKx7NlDXO0Ha4dRtJRkJ4/ZoE+GCf3r3BdVCMcfAqd0bxFpY2/+5a6Nn4p9tt7svrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738172051; c=relaxed/simple;
	bh=dpTxeF4m5ZVISYVlATQQQuNfyt7PyRoJQNEN3qKFdrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OnGWm5V2ri0a/868YUyN6e1y0bO99PZz5Vxus5NqTYL4zJ/9AAjCCo1BC5VS1qmk974N9ch9djM5fI/Arz6lDpr0KOyCFp5YkknvbDQ+tVEPJxL60M6E/POnmzqUS0WGiIcJFlUAPKStQttza12ps2k7E3UagHa47YQ0sgV8RbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=CChlgvfJ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="CChlgvfJ"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2eed82ca5b4so12150796a91.2
        for <oe-lkp@lists.linux.dev>; Wed, 29 Jan 2025 09:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738172049; x=1738776849; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qu0UHc7DL3wLJNaYhUbU6CyxASFRJKrJDLOLe+tPhvM=;
        b=CChlgvfJu4QLUj2Y+cfYCmQOBxLnMx+36Gx8m3iydB9lg82OyVHd5zIxXPuBp6Rxtw
         WpeMAp2bMrWrihuZFCBb6t9JD1idM9LK0tuVWp062BmHw6UxCwsYdGB30tnn0bZs70Pa
         3vmBAhP34fQJ3Yr4lyaktIIhIOcSZstXEkCritvZiJxbuda7JG+P2oM0Al6v8YFivadL
         oYjRCBssQnEkJBCGXc15yeUZ1OUW0M802iaF3xPXCgRZ0fe49Ee7z3/RHlYpTTAbk2rn
         Am4+P/OWkDnWTbpH4m+tSxQ41TcTfCeMfSuNOlC55NSEttPqqRicxfnxakBWlJn7rnaq
         HwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738172049; x=1738776849;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qu0UHc7DL3wLJNaYhUbU6CyxASFRJKrJDLOLe+tPhvM=;
        b=TA7r/b+6No/DzxqaTbUpFVlJIhIaPIXzLLxBtvQpSmzON/Kk/FXqG8TgrIF6+ou7jf
         u3IDAd0J5UvrZUOQYqyXoHSOHv0sd5n2Ogut2sEYXQNDW3ngxSoimcZmu/fnywfuXdO9
         RQSciuZxNuMjnmUEYTGFqBYYCvyz6ehsSbleggaGYsu9agpPjX3OfknX950RbXfpXje6
         hmTSWmcJkofDaNtlbE/F9yIBbgqwCcVAfF8TC8H2xYWHjwaB4VRxnxbDi81jbSy9QU+W
         Z8SNt2yl1XUPpTJvV0ZyYbB7vbWk2IoaYCTSNtUreUyTm8RFGnJ4XPazxbXpVA7pTd2q
         3iTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkLNva9ye7eaSi94cZcJBMNcoaEunHvB+kPv3uPdRgDHDnoUk+o0DFrePgVYjjSwFjbZMOrNw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFhJoa6YRaQmhkVCp+B5ynNC6zumgNIyvXxiMiyPTNp1M1i2fn
	OZIG2AKkruOMkEVAYhWvufHcOw5Yop6CGIW6VHks2SbESGaPaa0GryOj1YawC9Y=
X-Gm-Gg: ASbGncvxYYwBzI/tOjG+B0LLS7Yr2cJZyeIJ8LmcVB1lFfRaMNqkZquYfbmAial7X+u
	q3UwYR5oJN1aFvkf2spncEDu4sSQOSMmShk/NVNCLT5lp9EhTGq1Lyh8Io1Mwba/SN5NsEmsP8t
	PYVrpQBm6GSDULwed1fJj6OTf23zBFwmQZoK3V3B1zmfjo+FW6wFRjaEdq8wA8F9lj37wdwmc3U
	M5zOiMbNeJ132dUFzWBA+GIE9N16Ysd7uZyP4ZebpUyR1q0/xsfBwp17p1lvi8MSAthCjbtZKVh
	0Yxx0FxfThYOh1rq2jeFadNPBJxnz783djB4IE6yOWiu9je1fcl1m3t82LKVCGWbAkfva+viHWp
	56hUugyApIWQImTY=
X-Google-Smtp-Source: AGHT+IGmnWIlD3CLqw0UHAMaFQ5Kk+t3POC5cGfDXwjLRqAjJ37rgo3pv2fAB0HQPS7Q3Z2CzvYOkA==
X-Received: by 2002:a17:90b:258f:b0:2ea:9ccb:d1f4 with SMTP id 98e67ed59e1d1-2f83aa804damr7512815a91.0.1738172048781;
        Wed, 29 Jan 2025 09:34:08 -0800 (PST)
Received: from ?IPV6:240e:370:8b10:5140:d8c5:7248:cf0a:d072? ([240e:370:8b10:5140:d8c5:7248:cf0a:d072])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bc98232sm2049202a91.6.2025.01.29.09.34.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 09:34:08 -0800 (PST)
Message-ID: <96f55f36-5cb7-4226-a8ea-374a7891ecff@bytedance.com>
Date: Thu, 30 Jan 2025 01:33:56 +0800
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
 Matthew Wilcox <willy@infradead.org>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Peter Zijlstra <peterz@infradead.org>, David Hildenbrand <david@redhat.com>,
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
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250129115320.1334ad5f@fangorn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/1/30 00:53, Rik van Riel wrote:
> On Wed, 29 Jan 2025 08:36:12 -0800
> "Paul E. McKenney" <paulmck@kernel.org> wrote:
>> On Wed, Jan 29, 2025 at 11:14:29AM -0500, Rik van Riel wrote:
> 
>>> Paul, does this look like it could do the trick,
>>> or do we need something else to make RCU freeing
>>> happy again?
>>
>> I don't claim to fully understand the issue, but this would prevent
>> any RCU grace periods starting subsequently from completing.  It would
>> not prevent RCU callbacks from being invoked for RCU grace periods that
>> started earlier.
>>
>> So it won't prevent RCU callbacks from being invoked.
> 
> That makes things clear! I guess we need a different approach.
> 
> Qi, does the patch below resolve the regression for you?
> 
> ---8<---
> 
>  From 5de4fa686fca15678a7e0a186852f921166854a3 Mon Sep 17 00:00:00 2001
> From: Rik van Riel <riel@surriel.com>
> Date: Wed, 29 Jan 2025 10:51:51 -0500
> Subject: [PATCH 2/2] mm,rcu: prevent RCU callbacks from running with pcp lock
>   held
> 
> Enabling MMU_GATHER_RCU_TABLE_FREE can create contention on the
> zone->lock.  This turns out to be because in some configurations
> RCU callbacks are called when IRQs are re-enabled inside
> rmqueue_bulk, while the CPU is still holding the per-cpu pages lock.
> 
> That results in the RCU callbacks being unable to grab the
> PCP lock, and taking the slow path with the zone->lock for
> each item freed.
> 
> Speed things up by blocking RCU callbacks while holding the
> PCP lock.
> 
> Signed-off-by: Rik van Riel <riel@surriel.com>
> Suggested-by: Paul McKenney <paulmck@kernel.org>
> Reported-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>   mm/page_alloc.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 6e469c7ef9a4..73e334f403fd 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -94,11 +94,15 @@ static DEFINE_MUTEX(pcp_batch_high_lock);
>   
>   #if defined(CONFIG_SMP) || defined(CONFIG_PREEMPT_RT)
>   /*
> - * On SMP, spin_trylock is sufficient protection.
> + * On SMP, spin_trylock is sufficient protection against recursion.
>    * On PREEMPT_RT, spin_trylock is equivalent on both SMP and UP.
> + *
> + * Block softirq execution to prevent RCU frees from running in softirq
> + * context while this CPU holds the PCP lock, which could result in a whole
> + * bunch of frees contending on the zone->lock.
>    */
> -#define pcp_trylock_prepare(flags)	do { } while (0)
> -#define pcp_trylock_finish(flag)	do { } while (0)
> +#define pcp_trylock_prepare(flags)	local_bh_disable()
> +#define pcp_trylock_finish(flag)	local_bh_enable()

I just tested this, and it doesn't seem to improve much:

root@debian:~# stress-ng --timeout 60 --times --verify --metrics 
--no-rand-seed --mmapaddr 64
stress-ng: info:  [671] dispatching hogs: 64 mmapaddr
stress-ng: info:  [671] successful run completed in 60.07s (1 min, 0.07 
secs)
stress-ng: info:  [671] stressor       bogo ops real time  usr time  sys 
time   bogo ops/s   bogo ops/s
stress-ng: info:  [671]                           (secs)    (secs) 
(secs)   (real time) (usr+sys time)
stress-ng: info:  [671] mmapaddr       19803127     60.01    235.20 
1146.76    330007.29     14329.74
stress-ng: info:  [671] for a 60.07s run time:
stress-ng: info:  [671]    1441.59s available CPU time
stress-ng: info:  [671]     235.57s user time   ( 16.34%)
stress-ng: info:  [671]    1147.20s system time ( 79.58%)
stress-ng: info:  [671]    1382.77s total time  ( 95.92%)
stress-ng: info:  [671] load average: 41.42 11.91 4.10

The _raw_spin_unlock_irqrestore hotspot still exists:

   15.87%  [kernel]  [k] _raw_spin_unlock_irqrestore
    9.18%  [kernel]  [k] clear_page_rep
    7.03%  [kernel]  [k] do_syscall_64
    3.67%  [kernel]  [k] _raw_spin_lock
    3.28%  [kernel]  [k] __slab_free
    2.03%  [kernel]  [k] rcu_cblist_dequeue
    1.98%  [kernel]  [k] flush_tlb_mm_range
    1.88%  [kernel]  [k] lruvec_stat_mod_folio.part.131
    1.85%  [kernel]  [k] get_page_from_freelist
    1.64%  [kernel]  [k] kmem_cache_alloc_noprof
    1.61%  [kernel]  [k] tlb_remove_table_rcu
    1.39%  [kernel]  [k] mtree_range_walk
    1.36%  [kernel]  [k] __alloc_frozen_pages_noprof
    1.27%  [kernel]  [k] pmd_install
    1.24%  [kernel]  [k] memcpy_orig
    1.23%  [kernel]  [k] __call_rcu_common.constprop.77
    1.17%  [kernel]  [k] free_pgd_range
    1.15%  [kernel]  [k] pte_alloc_one

The call stack is as follows:

bpftrace -e 'k:_raw_spin_unlock_irqrestore {@[kstack,comm]=count();} 
interval:s:1 {exit();}'

@[
     _raw_spin_unlock_irqrestore+5
     hrtimer_interrupt+289
     __sysvec_apic_timer_interrupt+85
     sysvec_apic_timer_interrupt+108
     asm_sysvec_apic_timer_interrupt+26
     tlb_remove_table_rcu+48
     rcu_do_batch+424
     rcu_core+401
     handle_softirqs+204
     irq_exit_rcu+208
     sysvec_apic_timer_interrupt+61
     asm_sysvec_apic_timer_interrupt+26
, stress-ng-mmapa]: 8

The tlb_remove_table_rcu() is called very rarely, so I guess the
PCP cache is basically empty at this time, resulting in the following
call stack:

@[
     _raw_spin_unlock_irqrestore+5
     __put_partials+218
     kmem_cache_free+860
     rcu_do_batch+424
     rcu_core+401
     handle_softirqs+204
     do_softirq.part.23+59
     __local_bh_enable_ip+91
     get_page_from_freelist+399
     __alloc_frozen_pages_noprof+364
     alloc_pages_mpol+123
     alloc_pages_noprof+14
     get_free_pages_noprof+17
     __x64_sys_mincore+141
     do_syscall_64+98
     entry_SYSCALL_64_after_hwframe+118
, stress-ng-mmapa]: 776
@[
     _raw_spin_unlock_irqrestore+5
     get_page_from_freelist+2044
     __alloc_frozen_pages_noprof+364
     alloc_pages_mpol+123
     alloc_pages_noprof+14
     pte_alloc_one+30
     __pte_alloc+42
     move_page_tables+2285
     move_vma+472
     __do_sys_mremap+1759
     do_syscall_64+98
     entry_SYSCALL_64_after_hwframe+118
, stress-ng-mmapa]: 1214
@[
     _raw_spin_unlock_irqrestore+5
     get_page_from_freelist+2044
     __alloc_frozen_pages_noprof+364
     alloc_pages_mpol+123
     alloc_pages_noprof+14
     get_free_pages_noprof+17
     tlb_remove_table+82
     free_pgd_range+655
     free_pgtables+601
     vms_clear_ptes.part.39+255
     vms_complete_munmap_vmas+311
     do_vmi_align_munmap+419
     do_vmi_munmap+195
     move_vma+802
     __do_sys_mremap+1759
     do_syscall_64+98
     entry_SYSCALL_64_after_hwframe+118
, stress-ng-mmapa]: 1631
@[
     _raw_spin_unlock_irqrestore+5
     get_page_from_freelist+2044
     __alloc_frozen_pages_noprof+364
     alloc_pages_mpol+123
     alloc_pages_noprof+14
     get_free_pages_noprof+17
     tlb_remove_table+82
     free_pgd_range+655
     free_pgtables+601
     vms_clear_ptes.part.39+255
     vms_complete_munmap_vmas+311
     do_vmi_align_munmap+419
     do_vmi_munmap+195
     __vm_munmap+177
     __x64_sys_munmap+27
     do_syscall_64+98
     entry_SYSCALL_64_after_hwframe+118
, stress-ng-mmapa]: 1672
@[
     _raw_spin_unlock_irqrestore+5
     get_page_from_freelist+2044
     __alloc_frozen_pages_noprof+364
     alloc_pages_mpol+123
     alloc_pages_noprof+14
     __pmd_alloc+52
     __handle_mm_fault+1265
     handle_mm_fault+195
     __get_user_pages+690
     populate_vma_page_range+127
     __mm_populate+159
     vm_mmap_pgoff+329
     do_syscall_64+98
     entry_SYSCALL_64_after_hwframe+118
, stress-ng-mmapa]: 2042
@[
     _raw_spin_unlock_irqrestore+5
     get_partial_node.part.102+378
     ___slab_alloc.part.103+1180
     __slab_alloc.isra.104+34
     kmem_cache_alloc_noprof+192
     mas_alloc_nodes+358
     mas_store_gfp+183
     do_vmi_align_munmap+398
     do_vmi_munmap+195
     __vm_munmap+177
     __x64_sys_munmap+27
     do_syscall_64+98
     entry_SYSCALL_64_after_hwframe+118
, stress-ng-mmapa]: 2219
@[
     _raw_spin_unlock_irqrestore+5
     get_page_from_freelist+2044
     __alloc_frozen_pages_noprof+364
     alloc_pages_mpol+123
     alloc_pages_noprof+14
     pte_alloc_one+30
     __pte_alloc+42
     do_pte_missing+2493
     __handle_mm_fault+1914
     handle_mm_fault+195
     __get_user_pages+690
     populate_vma_page_range+127
     __mm_populate+159
     vm_mmap_pgoff+329
     do_syscall_64+98
     entry_SYSCALL_64_after_hwframe+118
, stress-ng-mmapa]: 2657
@[
     _raw_spin_unlock_irqrestore+5
     get_page_from_freelist+2044
     __alloc_frozen_pages_noprof+364
     alloc_pages_mpol+123
     alloc_pages_noprof+14
     get_free_pages_noprof+17
     __x64_sys_mincore+141
     do_syscall_64+98
     entry_SYSCALL_64_after_hwframe+118
, stress-ng-mmapa]: 5734

>   #else
>   
>   /* UP spin_trylock always succeeds so disable IRQs to prevent re-entrancy. */
