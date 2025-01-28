Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3021DE4D2
	for <oe-lkp@lists.linux.dev>; Tue, 28 Jan 2025 17:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738084028; cv=none; b=HIQ5048HxPwTeyc8wlQJHnrf27zuvcvyMc01r9U3RWFYfi5UygF9bqUVxju8nwuoSXihgSwd2zUayISp9JGBVn0MsDPeQkLoZkJ6aLwQgKsqwWrkZyw6dSPH9/HJ2Qin9kObW49AJ+5lYGKmqYsk4UDJzfJgo4OjfvkQX9svIwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738084028; c=relaxed/simple;
	bh=yjbwgdDgUpo90MQR6AL2JaXuNXEK5cuM1WJeDCstHzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I2Uqkpq0P2j+R0yq+cXWSbWBzz3R40vJ6sfOfwd8yR/N93xgEzPjHCDo73ZHj4QRcwV8x2w/1ISBeiAYpmatz4DZX9kC2xPA8o3l53hGC0OsTxr/LWn9hwnNogphcj+O0hKmHEsedQGXC3euBa2dyurD5to33JicKaGbuJplCwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Z+AViAFj; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Z+AViAFj"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-216401de828so109469115ad.3
        for <oe-lkp@lists.linux.dev>; Tue, 28 Jan 2025 09:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738084025; x=1738688825; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4aLdluYBQG3NHEUoAm0lTl3WFmZVvtCZOFSLgG2q5V8=;
        b=Z+AViAFjCfe+LWTlxs0DIDG5yEda4YDW6qP6xTyPu2MGZYYueZGir2+t80VX/wkItG
         DEIMWn5tlIrXpN6OtZHdgfeIZsMO5iYH2ecfnp9Tgs6wbESr/xERr4FiYo+SXcSvFFTq
         ENxEoyIYCnPUQUUGtkUdivObw4OJzINRo1sa7cCz/qCo9LCFm1aabOFiymsKg49MUrkc
         43ZUMOamqqtNqaixhe+DVR8moYMGPYMiEI33Fxmqz0m61V+6TatCv7CdWSsEvVGtsTKf
         UDwq3UWmnmGGNZHasan4u4c2j5p/4kLzVixOAjr/yfvp+pD/ilxXVu7TGUs55VkhXOib
         hD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738084025; x=1738688825;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4aLdluYBQG3NHEUoAm0lTl3WFmZVvtCZOFSLgG2q5V8=;
        b=TwPB2gcIRDWVu5/fULAZz6H+E+qOpBi3r7AlkviV50qlBpTcCirSsWqF8aMbyTgNPZ
         Lt8W/GN6o0oLhzwzsggWwPCLykmrK47/jW4qvmWHXuZsMKxpwCzh+7RzRMzEV69Frc6Z
         0rbQ1oOaEtGTDGh8/sKHSewqgxyq/LQsD0iccOOq3lGlcEbXATBYAbRqNKcg2LhPeKlM
         GdrijwbVtSHovlaSLAV3FYzDU9V8+WRsCQ+FcmhlPMcNt0dEXlhAKiPOKKxIoZgB/RZ/
         PO0k018qIt3WCpjY3XqaVblakyeQo+gMKYwRDTv/DwofN6mkMuhFf4jdT4FL5PvLiJDd
         pINw==
X-Forwarded-Encrypted: i=1; AJvYcCUKikhQ88cUZGKDvl7e9ai47R740lI2Npi460RGSCvNcY9vdothdcC8aR2AMOlrKJ+GJzwpkOY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIBRdp0UfGs3EaREnAr6Y/k/O7o4vIxajzmL31opAbn7pSoikq
	4YHiORbRfZqNFo1/+3AYeqVSfKs9ux370p3FBpW16uO/1qFNQP/JomYceBS4n00=
X-Gm-Gg: ASbGncuV2FZ0/c0q6VkdlZD1dk9GJErNUyBiGltETGg2kvY3vXgAo2r/moLSbKarizm
	iC0k/Der8fm0HvSh7+lQCRMpbaD36X8SVDKfi0T2ZWDqQttsEX9tv6taXseV6sQFXjEaxXpi1zz
	B4evKk7JP8wzKhKnF4XacJ+UfsglsaApVZ32r1o9R8dIOXPFNhzfqZ8vUlJ29zA6hLrVJES5TyN
	l1S5FbpXFhVte2LcV/tgGdjwNPNs50U2oqgI368j71JHASa0DgOsZYq1DKs4dm4b9OClBwWBHD6
	7pzoYNtzCIxjMe67+VczmwnfigkVmZXSQAY8oMW9iFeA6NR+bvC/YfxoHqgjXmreRBqdZkKRzD9
	9wtEqrOoJkX1VC/U=
X-Google-Smtp-Source: AGHT+IEHJ+yvRm9/dI3EKJujOyu9fMrTbPLV5NN8NzRJ8t2YbBq7WU1UqvWPdbJXbOL6J5IEzRPvgA==
X-Received: by 2002:a17:902:ea11:b0:216:3889:6f6f with SMTP id d9443c01a7336-21c353ef827mr617597005ad.17.1738084024877;
        Tue, 28 Jan 2025 09:07:04 -0800 (PST)
Received: from ?IPV6:240e:370:8b13:97f0:154c:a6ff:49c9:f239? ([240e:370:8b13:97f0:154c:a6ff:49c9:f239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3faab7csm83853185ad.103.2025.01.28.09.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 09:07:04 -0800 (PST)
Message-ID: <8b661116-0a85-4928-91ed-3c01ebbf8d39@bytedance.com>
Date: Wed, 29 Jan 2025 01:06:55 +0800
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
To: David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 David Rientjes <rientjes@google.com>, Hugh Dickins <hughd@google.com>,
 Jann Horn <jannh@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, Mel Gorman <mgorman@suse.de>,
 Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>,
 Will Deacon <will@kernel.org>, Zach O'Keefe <zokeefe@google.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Rik van Riel <riel@surriel.com>
References: <202501281734.d408a35b-lkp@intel.com>
 <46ea4509-0f38-4b22-bd91-f05c68db2562@redhat.com>
 <20250128113100.GB7145@noisy.programming.kicks-ass.net>
 <2c599f1f-f63b-4504-a026-46bf73954124@redhat.com>
 <20250128132847.GB505@noisy.programming.kicks-ass.net>
 <18172465-37e3-48a9-9d67-0d44fdcb93bd@redhat.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <18172465-37e3-48a9-9d67-0d44fdcb93bd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 2025/1/28 21:42, David Hildenbrand wrote:
> On 28.01.25 14:28, Peter Zijlstra wrote:
>> On Tue, Jan 28, 2025 at 12:39:51PM +0100, David Hildenbrand wrote:
>>> On 28.01.25 12:31, Peter Zijlstra wrote:
>>
>>>>> I recall a recent series to select MMU_GATHER_RCU_TABLE_FREE on x86
>>>>> unconditionally (@Peter, @Rik).
>>>>
>>>> Those changes should not have made it to Linus yet.
>>>>
>>>> /me updates git and checks...
>>>>
>>>> nope, nothing changed there ... yet
>>>
>>> Sorry, I wasn't quite clear. CONFIG_PT_RECLAIM made it upstream, 
>>> which has
>>> "select MMU_GATHER_RCU_TABLE_FREE" in kconfig.
>>>
>>> So I'm wondering if the degradation we see in this report is due to
>>> MMU_GATHER_RCU_TABLE_FREE being selected by CONFIG_PT_RECLAIM, and 
>>> we'd get
>>> the same result (degradation) when unconditionally enabling
>>> MMU_GATHER_RCU_TABLE_FREE.
>>
>> Ah, yes, put a RHEL based config (as is the case here) should already
>> have it selected due to PARAVIRT.
> 
> Ah, right. Most distros will just have it enabled either way.
> 
> But that would then mean that MMU_GATHER_RCU_TABLE_FREE is not the cause 
> for the regression here, and something else is going wrong.
> 

I did reproduce the performance regression using the following test
program:

stress-ng --timeout 60 --times --verify --metrics --no-rand-seed 
--mmapaddr 64

The results are as follows:

1) Enable CONFIG_PT_RECLAIM

stress-ng: info:  [826] dispatching hogs: 64 mmapaddr
stress-ng: info:  [826] successful run completed in 60.29s (1 min, 0.29 
secs)
stress-ng: info:  [826] stressor       bogo ops real time  usr time  sys 
time   bogo ops/s   bogo ops/s
stress-ng: info:  [826]                           (secs)    (secs) 
(secs)   (real time) (usr+sys time)
stress-ng: info:  [826] mmapaddr       17233711     60.01    238.47 
1128.46    287178.92     12607.60
stress-ng: info:  [826] for a 60.29s run time:
stress-ng: info:  [826]    1447.07s available CPU time
stress-ng: info:  [826]     238.85s user time   ( 16.51%)
stress-ng: info:  [826]    1128.87s system time ( 78.01%)
stress-ng: info:  [826]    1367.72s total time  ( 94.52%)
stress-ng: info:  [826] load average: 48.64 20.73 7.82

2) Disable CONFIG_PT_RECLAIM

stress-ng: info:  [704] dispatching hogs: 64 mmapaddr
stress-ng: info:  [704] successful run completed in 60.05s (1 min, 0.05 
secs)
stress-ng: info:  [704] stressor       bogo ops real time  usr time  sys 
time   bogo ops/s   bogo ops/s
stress-ng: info:  [704]                           (secs)    (secs) 
(secs)   (real time) (usr+sys time)
stress-ng: info:  [704] mmapaddr       28440843     60.02    343.93 
1090.70    473882.98     19824.51
stress-ng: info:  [704] for a 60.05s run time:
stress-ng: info:  [704]    1441.23s available CPU time
stress-ng: info:  [704]     344.30s user time   ( 23.89%)
stress-ng: info:  [704]    1091.12s system time ( 75.71%)
stress-ng: info:  [704]    1435.42s total time  ( 99.60%)
stress-ng: info:  [704] load average: 40.03 11.51 3.96

Then I found that after enabling CONFIG_PT_RECLAIM, there was an
additional perf hotspot function:

   16.35%  [kernel]  [k] _raw_spin_unlock_irqrestore
    9.09%  [kernel]  [k] clear_page_rep
    6.92%  [kernel]  [k] do_syscall_64
    3.76%  [kernel]  [k] _raw_spin_lock
    3.27%  [kernel]  [k] __slab_free
    2.07%  [kernel]  [k] rcu_cblist_dequeue
    1.94%  [kernel]  [k] flush_tlb_mm_range
    1.87%  [kernel]  [k] lruvec_stat_mod_folio.part.130
    1.79%  [kernel]  [k] get_page_from_freelist
    1.61%  [kernel]  [k] tlb_remove_table_rcu
    1.58%  [kernel]  [k] kmem_cache_alloc_noprof
    1.43%  [kernel]  [k] mtree_range_walk

And its call stack is as follows:

bpftrace -e 'k:_raw_spin_unlock_irqrestore {@[kstack,comm]=count();} 
interval:s:1 {exit();}'

@[
_raw_spin_unlock_irqrestore+5
free_one_page+85
rcu_do_batch+424
rcu_core+401
handle_softirqs+204
irq_exit_rcu+208
sysvec_apic_timer_interrupt+113
asm_sysvec_apic_timer_interrupt+26
_raw_spin_unlock_irqrestore+29
get_page_from_freelist+2014
__alloc_frozen_pages_noprof+364
alloc_pages_mpol+123
alloc_pages_noprof+14
get_free_pages_noprof+17
__x64_sys_mincore+141
do_syscall_64+98
entry_SYSCALL_64_after_hwframe+118
, stress-ng-mmapa]: 2283
@[
_raw_spin_unlock_irqrestore+5
get_page_from_freelist+2014
__alloc_frozen_pages_noprof+364
alloc_pages_mpol+123
alloc_pages_noprof+14
pte_alloc_one+30
__pte_alloc+42
do_pte_missing+2499
__handle_mm_fault+1862
handle_mm_fault+195
__get_user_pages+690
populate_vma_page_range+127
__mm_populate+159
vm_mmap_pgoff+329
do_syscall_64+98
entry_SYSCALL_64_after_hwframe+118
, stress-ng-mmapa]: 2443
@[
_raw_spin_unlock_irqrestore+5
get_page_from_freelist+2014
__alloc_frozen_pages_noprof+364
alloc_pages_mpol+123
alloc_pages_noprof+14
get_free_pages_noprof+17
__x64_sys_mincore+141
do_syscall_64+98
entry_SYSCALL_64_after_hwframe+118
, stress-ng-mmapa]: 5184
@[
_raw_spin_unlock_irqrestore+5
free_one_page+85
tlb_remove_table_rcu+140
rcu_do_batch+424
rcu_core+401
handle_softirqs+204
irq_exit_rcu+208
sysvec_apic_timer_interrupt+113
asm_sysvec_apic_timer_interrupt+26
_raw_spin_unlock_irqrestore+29
get_page_from_freelist+2014
__alloc_frozen_pages_noprof+364
alloc_pages_mpol+123
alloc_pages_noprof+14
get_free_pages_noprof+17
__x64_sys_mincore+141
do_syscall_64+98
entry_SYSCALL_64_after_hwframe+118
, stress-ng-mmapa]: 5301
@Error looking up stack id 4294967279 (pid -1): -1
[, stress-ng-mmapa]: 53366

It seems to be related to CONFIG_MMU_GATHER_RCU_TABLE_FREE?

I will continue to investigate further.

Thanks!



