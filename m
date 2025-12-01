Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A666427FB25
	for <oe-lkp@lists.linux.dev>; Mon,  1 Dec 2025 21:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764623604; cv=none; b=KV6ztAgWM7E3l4tFGRR7pzjLMqHYp26l8m3t0/atASKpR1O6e8Y+BtatwEvcLMx8Oaq1s/vXsXkWfvyU+57Pd43Ly6Uq9p8Zpd/tOkz9vD5zfSwosHR9SPKDQI0sc5xlfRuNp/Dm98D8pxDXhiqVZ9ymonK75hL7R+Yjj2VxvTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764623604; c=relaxed/simple;
	bh=kZqn2EZcd0EeVcfwGvgsusMd/R4Px9rgzyWItI/Or9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ubwJk2QttkeZCAHl+5RDom5vU3wmLoLHpXnohSIJ2B6JEy5ZEl9wOE+kPXuo2k6V2AvBQcpmY9zheIhyGuE0Ordnw45MbqhUpusVy1IOnPQsIv2LvMdrerhU9ULn1m0KvQbI35yDEptJndQd9/FGhmgUazShnGFYUUqYfRmOR7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OiyqOibi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OiyqOibi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF63C116C6;
	Mon,  1 Dec 2025 21:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764623604;
	bh=kZqn2EZcd0EeVcfwGvgsusMd/R4Px9rgzyWItI/Or9g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OiyqOibiGIEk4eJqrQQ7oU6acf71C5hEfjVo/Pta7We0iNTrdbxF1ysYUDwWkOECv
	 OS9o0dsizOCi+vp73tjG0hbRZvPFJiWnD4YfSNYpcdQDmXgFXGGo4RfAXoeGuijHJJ
	 E8mhNB7ehJAmWxKjuPQphWmixYEtdKuyXY0cbnPxeVC2iPoA61B1ekM5AvAOqdyjHq
	 l7dgrC0aJHatrdRo0vrxH1gf4MpHea+AfAs0g9EyxGfzcsj30NmADp40AZfRsM6J2Q
	 H2CT4hHsmXIC3ILJHtT/rj4ngGorcHFgeBtWXno9RZZIYhwCqdae02C/lCdVWoi2yl
	 jQgpItYIi9zCg==
Message-ID: <e031bce7-13d4-4404-a714-0d0fc87dc96a@kernel.org>
Date: Mon, 1 Dec 2025 22:13:17 +0100
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [mm] f66e2727dd:
 stress-ng.rawsock.ops_per_sec 46.9% regression
To: Sid Kumar <sidhartha.kumar@oracle.com>,
 kernel test robot <oliver.sang@intel.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Barry Song <baohua@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>,
 Liam Howlett <liam.howlett@oracle.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org
References: <202511252236.33b899b3-lkp@intel.com>
 <16995732-b7b9-4121-be36-e912a4154958@kernel.org>
 <e32f61a9-0461-444d-b008-bb09a3d85510@oracle.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <e32f61a9-0461-444d-b008-bb09a3d85510@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/1/25 21:56, Sid Kumar wrote:
> 
> On 11/26/25 3:49 AM, David Hildenbrand (Red Hat) wrote:
>> On 11/25/25 15:46, kernel test robot wrote:
>>>
>>>
>>> Hello,
>>>
>>> kernel test robot noticed a 46.9% regression of
>>> stress-ng.rawsock.ops_per_sec on:
>>>
>>>
>>> commit: f66e2727ddfcbbe3dbb459e809824f721a914464 ("mm: huge_memory:
>>> use folio_can_map_prot_numa() for pmd folio")
>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>
>> Unexpected, but maybe simple a symptom of doing the right thing?
>>
>> "which skips unsuitable folio, i.e.  zone device, shared folios (KSM,
>> CoW), non-movable dma pinned, dirty file folio and folios that already
>> have the expected node affinity."
>>
>> I suspect skipping shared folios or dirty file folios might make the
>> difference. The benchmark results would be misleading in that case: as
>> we shouldn't have migrated these pages in the first place beforehand.
> 
> 
> Reproducing the benchmark and adding prints to show which condition the
> return false occurs in shows that:
> 
>       /* Also skip shared copy-on-write folios */
>       if (is_cow_mapping(vma->vm_flags) &&
> folio_maybe_mapped_shared(folio)) {
>           printk("false at is_Cow_mapping\n");
>           return false;
>       }
> 
> virtme-ng% dmesg | grep is_Cow_mapping | wc -l
> 25302
> 
> is the condition that now fails and leads to the regression.

Okay, as I thought, it's rather a "doing the right thing". At
least doing the same thing we do during PTE faults :)

This check dates back to:

commit 859d4adc3415a64ccb8b0c50dc4e3a888dcb5805
Author: Henry Willard <henry.willard@oracle.com>
Date:   Wed Jan 31 16:21:07 2018 -0800

     mm: numa: do not trap faults on shared data section pages.
     
     Workloads consisting of a large number of processes running the same
     program with a very large shared data segment may experience performance
     problems when numa balancing attempts to migrate the shared cow pages.
     This manifests itself with many processes or tasks in
     TASK_UNINTERRUPTIBLE state waiting for the shared pages to be migrated.
     
     The program listed below simulates the conditions with these results
     when run with 288 processes on a 144 core/8 socket machine.
     
     Average throughput      Average throughput     Average throughput
     with numa_balancing=0   with numa_balancing=1  with numa_balancing=1
                             without the patch      with the patch
     ---------------------   ---------------------  ---------------------
     2118782                 2021534                2107979
     
     Complex production environments show less variability and fewer poorly
     performing outliers accompanied with a smaller number of processes
     waiting on NUMA page migration with this patch applied.  In some cases,
     %iowait drops from 16%-26% to 0.
     


I think the reproducer would actually not care about anonymous folios, but
not sure if that would make a difference for the benchmark here.

-- 
Cheers

David
