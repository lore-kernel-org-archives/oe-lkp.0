Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A0C19CD19
	for <oe-lkp@lists.linux.dev>; Wed, 29 Jan 2025 08:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738138454; cv=none; b=WEE886td2xpCcCxa+z9zVsRsRvyM2yfx9VJSu46AGZmWXAKcZaB60wC5dLLXmG38/5sms9uuUtwJsv90PRETbjC7eGjOIkcGG/J/4aw/mN73HjjCINQA1olzATXlmxzVe+u8ibcC68lBagJp08eBYKUkqB2O5Ht0OVfhKhJ8Ric=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738138454; c=relaxed/simple;
	bh=O2oR4asarDrt6PbE4adZ8hyBG4rzzF8Lg7K2V13a7KI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q+jHAYLUej3+6qaMK5/wh4zyIKYlKO/AtYf8QUt3noot5RyEmdl5E/nJafnTjwRZLyk+6A/pnsdzBK5XtXwTqsXRVkNAqHVuU7al5+We2nweqRAxxA6K23VY/7QCv+MeUb1wOAli3TRqViz6s8ZEKdarfAICJAhnlIo98a9Qth4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=O8PBfSqb; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="O8PBfSqb"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-216401de828so121258865ad.3
        for <oe-lkp@lists.linux.dev>; Wed, 29 Jan 2025 00:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738138452; x=1738743252; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eGcNqLBqVaGSGR+tLjKdq+471J/9pRKvhfVPep5UlRs=;
        b=O8PBfSqb8goDxTB+Fi9b3c/7Lp9H4PJL+9vcBDP+3C3xf1jx33/zurVii0v8caotsm
         968elx+thVu3XomCgCbWx31W0+MOOvv3GhMMEjR/EvFzqBoAdX2wl+r/dE4yTGHslEON
         nHROh2V/LFh+9Zed8aoS0N+wF+9fSv94zxC0eT7dn8QckWP5XDyCQPrPyrWx+J5eZvj2
         RhNnkNJ6dryGZL/oVksNe8VgbSKD61Uv26ukZElEmTgwOrdIc9M1XsxxPmNbpfU+IhV0
         /jxEjMJTOyTkFZvSrTQRzfZvsV3lilRG/FrTd0cLKCNJOEVMVSowexoOHnXrVM1a4PaL
         A8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738138452; x=1738743252;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGcNqLBqVaGSGR+tLjKdq+471J/9pRKvhfVPep5UlRs=;
        b=Pe666+OU4ouf/FtFpRGT/D6DVdEcONGxzKuofGbhBR5BItKwWULbg+VuY7QftzX+Ko
         3S7q791gf2oR63WKZsKGQgsEpS3CsCujfxD6DP3+PavuZgONwS8DZEnPtsD1iDKYAM6l
         wH1YIHaiUXws/n34U4e8PyibSw7tZB5n4T/DMEOe8c3D9msiC+G1pIn7sgArlspVyF6g
         eCCNNotmUIbTAA5OREc39toG4Ir1bM7x+XIW6HTCtXZtfxa6WtLKfH5YLBP7DeQaxs8h
         7hmdk+Udn0SxRNGw0O8nUyJHA90YvxNU3I4TDlDhR+0oryQvpknkGIn4BcvdZyen4k5W
         6RKw==
X-Forwarded-Encrypted: i=1; AJvYcCV7a9hs8iH6pdlXKyeD9kpJQ2ylXSGp03nQvjBB3Gwbxp4eMxw4954rO6UP4RT8iw0GvWEw7Co=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHcejEkinisp5L+BR6Qlyr9vT6zq/ZFM7g7oWovZkN9rTYMKd6
	H5CpnfYMsIYimMPGcyaFNIu+YXAoaQOoEjeFQCtsv0GLxzIpX2olz4Z9uUUZlUc=
X-Gm-Gg: ASbGncvERaywWXlNvoeDEPUAM1Bg6/TnCUuoW+RHSJHL/FLZeyqYRj6AeHNvOqyYCuZ
	s+D8dUSUWcYUXDpwCA5m2G0rBwjtuJp91ZgQQ2gYdDbVHuoP9fLFaLfgMVIBf1Eqxcz147EsdCl
	xWCiURywIyc2tTEKIWHjZGbWMPS19MeFCFqP9RjIU2laD+UbeIbIf+pzy65kGI7E9qnS2vbn4dY
	YfPIVXHKdvHXVEMzweuEcIVIjnFgEAP7pa4CeCrTbv1FHeJ+K3q/CtPOyYK4AO7TOxacGgvYl+u
	JxT0ALTkv9A8r1jdubynnAJTO6TmJmct3EpUE1YUGAMKo34sYlsDRdrbfWuud1pj0aEA1tVU63Y
	wIJR441jmclBWBtY=
X-Google-Smtp-Source: AGHT+IG2BvQPppbJyzYGHLMoCmyEyD+zahGffGSvJ1pYnxwgl4UNrpz3F6voAb0czs5u8mYiykQ34w==
X-Received: by 2002:a17:902:ecc7:b0:215:9d58:6f35 with SMTP id d9443c01a7336-21dd7c55feamr31993245ad.1.1738138452026;
        Wed, 29 Jan 2025 00:14:12 -0800 (PST)
Received: from ?IPV6:240e:370:8b10:5140:d8c5:7248:cf0a:d072? ([240e:370:8b10:5140:d8c5:7248:cf0a:d072])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3faab7csm93660025ad.103.2025.01.29.00.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 00:14:11 -0800 (PST)
Message-ID: <14159fb4-0c59-4653-9265-73f415e70063@bytedance.com>
Date: Wed, 29 Jan 2025 16:14:01 +0800
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 David Rientjes <rientjes@google.com>, Hugh Dickins <hughd@google.com>,
 Jann Horn <jannh@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, Mel Gorman <mgorman@suse.de>,
 Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>,
 Will Deacon <will@kernel.org>, Zach O'Keefe <zokeefe@google.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <202501281734.d408a35b-lkp@intel.com>
 <46ea4509-0f38-4b22-bd91-f05c68db2562@redhat.com>
 <20250128113100.GB7145@noisy.programming.kicks-ass.net>
 <2c599f1f-f63b-4504-a026-46bf73954124@redhat.com>
 <20250128132847.GB505@noisy.programming.kicks-ass.net>
 <18172465-37e3-48a9-9d67-0d44fdcb93bd@redhat.com>
 <8b661116-0a85-4928-91ed-3c01ebbf8d39@bytedance.com>
 <2212111cad3180948cf388a7e5c8689df0fdda08.camel@surriel.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <2212111cad3180948cf388a7e5c8689df0fdda08.camel@surriel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rik,

On 2025/1/29 02:35, Rik van Riel wrote:
> On Wed, 2025-01-29 at 01:06 +0800, Qi Zheng wrote:
>>
>> I did reproduce the performance regression using the following test
>> program:
>>
>> stress-ng --timeout 60 --times --verify --metrics --no-rand-seed
>> --mmapaddr 64
>>
>> And its call stack is as follows:
>>
>> bpftrace -e 'k:_raw_spin_unlock_irqrestore {@[kstack,comm]=count();}
>> interval:s:1 {exit();}'
>>
>> @[
>> _raw_spin_unlock_irqrestore+5
>> free_one_page+85
>> rcu_do_batch+424
>> rcu_core+401
>> handle_softirqs+204
>> irq_exit_rcu+208
> 
> That looks like the RCU freeing somehow bypassing the
> per-cpu-pages, and hitting the zone->lock at page free
> time, while regular freeing usually puts pages in the
> CPU-local free page cache, without the lock?

Take the following call stack as an example:

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

It looks like the following happened:

get_page_from_freelist
--> rmqueue
     --> rmqueue_pcplist
         --> pcp_spin_trylock (hold the pcp lock)
             __rmqueue_pcplist
             --> rmqueue_bulk
                 --> spin_lock_irqsave(&zone->lock)
                     __rmqueue
                     spin_unlock_irqrestore(&zone->lock)

                     <run softirq at this time>

                     tlb_remove_table_rcu
                     --> free_frozen_pages
                         --> pcp = pcp_spin_trylock (failed!!!)
                             if (!pcp)
                                 free_one_page

It seems that the pcp lock is held when doing tlb_remove_table_rcu(), so
trylock fails, then bypassing PCP and calling free_one_page() directly,
which leads to the hot spot of zone lock.

As for the regular freeing, since the freeing operation will not be
performed in the softirq, the above situation will not occur.

Right?

> 
> I'm not quite sure why this would be happening, though.
> 
> Maybe the RCU batches are too big for the PCPs to
> hold them?
> 
> If that is the case, chances are more code paths are
> hitting that issue, and we should just fix it, rather
> than trying to bypass it.
> 
> Maybe the reason is more simple than that?
> 
> I have not found a place where it explicitly bypasses
> the PCPs, but who knows?
> 
