Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D36A22A4E1
	for <oe-lkp@lists.linux.dev>; Thu,  7 Aug 2025 10:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754562088; cv=none; b=gQNRe6awZ+hu4eHaGZZMUPQyL2M8VTszL0qrKNEM/As1J4o3YJx/H2ESqA5WsNgEy1c73O5ZFloDOulhAqufBNJpqh3qNceMS3SX7AMt/wpVMImsZt1em2jFt6NxHmETrcYF37i/MwqntKLExmUvlDkXwyuqN5aKDCbsjn2+Tiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754562088; c=relaxed/simple;
	bh=Q7MNPgRuWRtnmjAzlb54akQbFcBT66Hn87mOf6Rm+9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gs32/FvdAxinbiK710wbVlKii1Ra1z9PHT2c1Tc3U/CXyW/mU5+jJARCvT9MblTR38+6eORGsifIH5RMlvhLWdgIejX3zcGAPWj47Pa8ZsNNGzX0T0zsfQ9gkVNwd2y5kTF3R9jwy4zziW1S1upSZPPZ473mGqwDTxiAzr4myBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i07GURRs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i07GURRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754562085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3pPCKCDw2qqu0amhP0jmadWwdffE5h/laeuaPK5g2Y8=;
	b=i07GURRsuK7CoHeRLxG4KQs2lmeXHW2g/DrnXeUzZ2TxScSSDnAx8BR9g+5KjDJX6AX2wP
	raGGejnNo9JTT/7bte4mJ346XSiLWpaVJt2mfDtPH1e7xTPraJtPNaxyl0oxp3etIa2hf7
	cQL2fq3GvD90lhB6DgIxeOTT8woXeN0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-5GuyDF01P6Wgt2wGKVoIug-1; Thu, 07 Aug 2025 06:21:22 -0400
X-MC-Unique: 5GuyDF01P6Wgt2wGKVoIug-1
X-Mimecast-MFC-AGG-ID: 5GuyDF01P6Wgt2wGKVoIug_1754562081
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-459e4b85895so4295435e9.2
        for <oe-lkp@lists.linux.dev>; Thu, 07 Aug 2025 03:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754562081; x=1755166881;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3pPCKCDw2qqu0amhP0jmadWwdffE5h/laeuaPK5g2Y8=;
        b=quGsgQ2ZfLUEe9hYwxYVrITo3xTg/1RQPWKnlp7mULHCuheq6oqnzUwrmFIFQ0qkyj
         4ERGEKPm/3FXoUJTCggg6HZQBbz7nhNH7/FDgPlfCgKDHZ27uX0NguM93k3MCxFznL3I
         cK4oLxk6TeEDw/5VcYdAsFAPQ6A0X5sqW27Zb+SBDhgxKQv/okQEkTnvlMmURK/gh/bk
         jwiTlP2Wh9DAhJsNT4eMiip03Pc7iLaPquJ2AqYuB3E4YndcTiUogNiOj4oTOqevSwl2
         pXyFifBy82EIV0aUytZZpN6CYSDseGtU37jabkc+Vgx77IxsCb7Gr2wlkDRK/3zNn7Ob
         wH9w==
X-Forwarded-Encrypted: i=1; AJvYcCU6ESc2s2x8zTDbPf11kI915vul4mtVZMOeo5ezn8DYIdDKm/Uozmw27dfAyURB5nGPpNK1kzA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyuaLFdOaIzaL+x1UHm77Kcjg/ySF1v0N7BzZVQ6Qwi3Ubj+xdB
	ksthP7w6JgPfYlqBY+QkFcjiACzFnIPG2U4WlhyLqFfBnOAXy8eEdfUAoSFb7IedU4ILumk5Sml
	C/2ETdcqb057GKckoZ5f5I5+ke+J7dXDY3U/L9gqQaijCOoiNmmZO6pDf0g==
X-Gm-Gg: ASbGncsJNr2xigYhYyUBN+ZS++HQrA+3+Jq0XXlDDyn9TgB7KAgraUWt662YS/3XAt4
	Ku1mMzSEANQWOAO8WZFp9ZOOuhpQC+uHqcy/lYOTGYakwc/7vJqYw9kgSr9m6/SbfakLOVxT0SK
	ebeDTfuC4JTUFOZVcs1j0P/klkGP9i++nlK+Hn2dSGXaMR/gttF6mXN4Ux4YbKhd5W4rjc/PIFR
	g4tPfHh78fQvMz3Gzh64nSxf9Q6GsWorH5vRamybMf5KzElHTGvHR7YaDlCx2fxMfdzrsuqk8xS
	LJkP1ojK5LXxQdn4Va7+nSjZ47DeKUKCAACq2b6PbalvZiLKGr412WSedn7aqgLa0GDc4CojiwO
	ZUTWpV6kMqS62A18MLQxw2+9zJquZQfhgnFqXmn0h7xjf+VlgCBVqYgS9YNrog7e/cvw=
X-Received: by 2002:a05:600c:548b:b0:458:bc3f:6a7b with SMTP id 5b1f17b1804b1-459e748fd16mr58072745e9.18.1754562081221;
        Thu, 07 Aug 2025 03:21:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLvD/ci4VcJLffdp3IqvGO83bI1vYTvAdh4Ih6kxzqUVno/uCFkxRHyCn9UNUbRNUVCU+vsw==
X-Received: by 2002:a05:600c:548b:b0:458:bc3f:6a7b with SMTP id 5b1f17b1804b1-459e748fd16mr58072305e9.18.1754562080711;
        Thu, 07 Aug 2025 03:21:20 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f49:bc00:12fa:1681:c754:1630? (p200300d82f49bc0012fa1681c7541630.dip0.t-ipconnect.de. [2003:d8:2f49:bc00:12fa:1681:c754:1630])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953eaeeesm359376465e9.25.2025.08.07.03.21.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 03:21:20 -0700 (PDT)
Message-ID: <97419aca-af5f-4328-84dc-c97bb73ca1ac@redhat.com>
Date: Thu, 7 Aug 2025 12:21:18 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [mm] f822a9a81a:
 stress-ng.bigheap.realloc_calls_per_sec 37.3% regression
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 kernel test robot <oliver.sang@intel.com>
Cc: Dev Jain <dev.jain@arm.com>, oe-lkp@lists.linux.dev, lkp@intel.com,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Barry Song <baohua@kernel.org>, Pedro Falcato <pfalcato@suse.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Bang Li <libang.li@antgroup.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, bibo mao <maobibo@loongson.cn>,
 Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@kernel.org>,
 Jann Horn <jannh@google.com>, Lance Yang <ioworker0@gmail.com>,
 Liam Howlett <liam.howlett@oracle.com>, Matthew Wilcox
 <willy@infradead.org>, Peter Xu <peterx@redhat.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Yang Shi <yang@os.amperecomputing.com>,
 Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org
References: <202508071609.4e743d7c-lkp@intel.com>
 <9e3a59b2-11c0-43ca-aff3-414091f04aa4@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <9e3a59b2-11c0-43ca-aff3-414091f04aa4@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fW6DHCITttWkwd0_u8EjUkO3pGqtuD4PUsgwDJJBDmg_1754562081
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07.08.25 10:27, Lorenzo Stoakes wrote:
> On Thu, Aug 07, 2025 at 04:17:09PM +0800, kernel test robot wrote:
>>
>>
>> Hello,
>>
>> kernel test robot noticed a 37.3% regression of stress-ng.bigheap.realloc_calls_per_sec on:
>>
> 
> Dev - could you please investigate and provide a fix for this as a
> priority? As these numbers are quite scary (unless they're somehow super
> synthetic or not meaningful or something).
> 
>>
>> commit: f822a9a81a31311d67f260aea96005540b18ab07 ("mm: optimize mremap() by PTE batching")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> [still regression on      linus/master 186f3edfdd41f2ae87fc40a9ccba52a3bf930994]
>> [still regression on linux-next/master b9ddaa95fd283bce7041550ddbbe7e764c477110]
>>
>> testcase: stress-ng
>> config: x86_64-rhel-9.4
>> compiler: gcc-12
>> test machine: 192 threads 2 sockets Intel(R) Xeon(R) Platinum 8468V  CPU @ 2.4GHz (Sapphire Rapids) with 384G memory
>> parameters:
>>
>> 	nr_threads: 100%
>> 	testtime: 60s
>> 	test: bigheap
>> 	cpufreq_governor: performance
>>
>>
>>
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <oliver.sang@intel.com>
>> | Closes: https://lore.kernel.org/oe-lkp/202508071609.4e743d7c-lkp@intel.com
>>
>>
>> Details are as below:
>> -------------------------------------------------------------------------------------------------->
>>
>>
>> The kernel config and materials to reproduce are available at:
>> https://download.01.org/0day-ci/archive/20250807/202508071609.4e743d7c-lkp@intel.com
>>
>> =========================================================================================
>> compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
>>    gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/igk-spr-2sp1/bigheap/stress-ng/60s
>>
>> commit:
>>    94dab12d86 ("mm: call pointers to ptes as ptep")
>>    f822a9a81a ("mm: optimize mremap() by PTE batching")
>>
>> 94dab12d86cf77ff f822a9a81a31311d67f260aea96
>> ---------------- ---------------------------
>>           %stddev     %change         %stddev
>>               \          |                \
>>       13777 ± 37%     +45.0%      19979 ± 27%  numa-vmstat.node1.nr_slab_reclaimable
>>      367205            +2.3%     375703        vmstat.system.in
>>       55106 ± 37%     +45.1%      79971 ± 27%  numa-meminfo.node1.KReclaimable
>>       55106 ± 37%     +45.1%      79971 ± 27%  numa-meminfo.node1.SReclaimable
>>      559381           -37.3%     350757        stress-ng.bigheap.realloc_calls_per_sec
>>       11468            +1.2%      11603        stress-ng.time.system_time
>>      296.25            +4.5%     309.70        stress-ng.time.user_time
>>        0.81 ±187%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
>>        9.36 ±165%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
>>        0.81 ±187%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
>>        9.36 ±165%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
>>        5.50 ± 17%    +390.9%      27.00 ± 56%  perf-c2c.DRAM.local
>>      388.50 ± 10%    +114.7%     834.17 ± 33%  perf-c2c.DRAM.remote
>>        1214 ± 13%    +107.3%       2517 ± 31%  perf-c2c.HITM.local
>>      135.00 ± 19%    +130.9%     311.67 ± 32%  perf-c2c.HITM.remote
>>        1349 ± 13%    +109.6%       2829 ± 31%  perf-c2c.HITM.total
> 
> Yeah this also looks pretty consistent too...

It almost looks like some kind of NUMA effects?

I would have expected that it's the overhead of the vm_normal_folio(), 
but not sure how that corresponds to the SLAB + local vs. remote stats. 
Maybe they are just noise?

-- 
Cheers,

David / dhildenb

