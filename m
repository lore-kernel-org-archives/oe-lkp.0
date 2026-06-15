Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16B9405C23
	for <oe-lkp@lists.linux.dev>; Mon, 15 Jun 2026 15:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781537547; cv=none; b=ECkQ6B3z7U4MWYhJ1mev64AQENn6vfIHvMDtgBIWxBZO8Jfl56g5ZymgpQ6MsV0CA/u2QgIVufiFClbDcrQ66iCZ68Vshbz/7HM2CHP62wpiEgDOBaoxbIRn2ZiABKVxh3gvJ0hzxlLaq87tI2KAHhZMk5NtKBFwz7xMEGc15Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781537547; c=relaxed/simple;
	bh=sqL+H21/KV4vs4NMxHSLF0Ok3y2R70ulBAu2NsY2P9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ezVwiiFVNT5lvrkMVC5evbPQFTApr4asCwGdnk2+g0fvow0cfVYPTDEl/hXs1MpIaNeW6cjVGqL52o6tOVSBtoKw/lWwFr35uzRQ6YXZFpypDv7w1B33LmQpVJddHDKHRVXopOO8q0zGlwJwDfOJ9jhfqp1dD3IyNEFoK9yHLtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hP1Ne2qN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hP1Ne2qN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDD91F000E9;
	Mon, 15 Jun 2026 15:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781537545;
	bh=eYcJ6fLaq5tKdXm+fVnBYXVTSD6DAPvjOt+eyv2DNuA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hP1Ne2qN+hrYjUHpA7Htuuox2O0MJtRp4Ylsq9g2xYTR7QFUIFjWQ+3300p+SLghM
	 Kq65moRCtt0LMSyAembSuLfyqj1GtYgtkwAoD80pNfXTpeAnbuYCkCWlNfaXpGETnr
	 hIIlyA7AmVS5z5TaUogu7Ila9aOnG042qJY1njoLcnW6mtD/aFUw2cEtgJX799zZxU
	 gDYyokzQgJeypDqtnYBFv7ofo+dyQZOA8YEnWFS6KdFvDfaO42g8urTTap0sU7KP8b
	 +Jda2N/9yVykOc9x0gCUZuCFPRWwZRgw6r5uATS5twIchbdRPqyM2OqD8fK/zytZay
	 k2y+G3NjXULWQ==
Message-ID: <87b8a714-e2bd-449d-9560-c181e927497a@kernel.org>
Date: Mon, 15 Jun 2026 17:32:19 +0200
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [vmalloc] 60ced5818f:
 stress-ng.shm.ops_per_sec 7.2% regression
To: Yeoreum Yun <yeoreum.yun@arm.com>,
 kernel test robot <oliver.sang@intel.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, Andrew Morton <akpm@linux-foundation.org>,
 Muhammad Usama Anjum <usama.anjum@arm.com>,
 Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Uladzislau Rezki <urezki@gmail.com>, Brendan Jackman <jackmanb@google.com>,
 David Sterba <dsterba@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Liam Howlett <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Nick Terrell <terrelln@fb.com>, Suren Baghdasaryan <surenb@google.com>,
 Vishal Moola <vishal.moola@gmail.com>, linux-mm@kvack.org
References: <202606022131.112319f2-lkp@intel.com>
 <aifCQbaAZLkH2GJY@e129823.arm.com> <ai/LNIg42JYckH2B@e129823.arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <ai/LNIg42JYckH2B@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


>>> -- 
>>> 0-DAY CI Kernel Test Service
>>> https://github.com/intel/lkp-tests/wiki
>>
>> Thanks. I'll check it.

Thanks for digging into the details!

> 
> Looking at the patch [1], the regression reported by lkp [2] appears to
> be caused by a lack of order-0 pages in the PCP lists,
> which increases zone-locked allocations (mm_page_alloc_zone_locked).
> 
> On my reproduced setup (an x86_64 workstation), most pages freed through
> free_pages_bulk() were order-2 pages (nr_pages == 4), including
> vmalloc-backed stacks. With patch [1], these order-2 pages are returned to
> the order-2 PCP lists, unlike commit 4aa4abf1f1 (“mm/page_alloc: optimize free_contig_range()”),
> which effectively populated the order-0 PCP lists.
> 
> Since the shmem workload appears to fault memory at PAGE_SIZE granularity,
> the reduced availability of order-0 pages in PCP lists seems to increase
> zone-locked order-0 allocations, which may explain the regression observed by lkp.
> 
> Performance comparison (5 runs):
>   - perf stat -e 'kmem:mm_page_alloc_extfrag' --filter 'alloc_order == 0' \
>               -e 'kmem:mm_page_alloc_zone_locked' --filter 'order == 0' \
>               -e 'kmem:mm_page_alloc' --filter 'order == 0' -- ./repro-script
> 
> Metric                               4aa4abf1f1           60ced5818f        Difference
> 
> ------------------------------------------------------------------------------------------
> 
> Zone-locked Allocation Ratio (%)     46.39 ± 0.17%       48.31 ± 0.37%       +1.92 pp
> 
>   - Ratio = (mm_page_alloc_extfrag + mm_page_alloc_zone_locked) / mm_page_alloc × 100
>   - Values are reported as median ± relative half-range across three runs.
> 
> The shmem test appears to handle page faults at PAGE_SIZE granularity, which seems to amplify the impact of the reduced availability of order-0 pages.

Okay, so less fragmentation in the PCP results in fallback to the buddy for
order-0. Given that we don't split in the PCP and fallback to the buddy, that
makes sense.

> 
> 
> As an experiment, I modified free_pages_bulk() to free pages individually
> as order-0 pages when nr_contig <= (1 << PAGE_ALLOC_COSTLY_ORDER).
> This restores behavior closer to 4aa4abf1f1 and results in almost
> no difference compared to that commit.
> 
> Performance comparison (5 runs)
>   - ./repro-script
> 
> Metric                     4aa4abf1f1            change             Difference
> ----------------------------------------------------------------------------------
> bogo_ops                   656,513 ± 0.34%      656,488 ± 0.23%          -25
> 
> bogo_ops/s (realtime)      10,935.95 ± 0.34%    10,935.86 ± 0.23%      -0.09
> 
> bogo_ops/s (usr+sys time)     220.31 ± 0.40%       219.30 ± 0.21%      -1.01
> 
> The differences are negligible and essentially restore the performance
> observed with 4aa4abf1f1.

Makes sense.

Looking at the original results, I spotted

    354997 ± 14%    +111.6%     751255 ±  4%  meminfo.PageTables

So we consumed twice the (process) page tables. Did you also manage to reproduce
that or do you have an explanation for that?

> 
> Given that the regression appears to be driven by a synthetic workload that
> combines frequent shmem page faults with repeated stack allocation/free operations,
> I do not think this is a significant concern for typical real-world workloads.

Yeah, if it's "we have less fragmentation", I agree. Using order-2 folios for
shmem would likely similarly mitigate the problem I assume.

-- 
Cheers,

David
