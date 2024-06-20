Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187DE1AB366
	for <oe-lkp@lists.linux.dev>; Thu, 20 Jun 2024 11:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718882037; cv=none; b=H44+ievDsiPvp3hMfiLqKILsTaGOIYMCPOAWJRKkGEIUGMFFBh8A2PpLCGhfb6Xm7RQB3XDkKURb1LoezWuQqb/097BvxSOAFBr2XcN9vXlg8yE9xUXSBKgJI6uLvELxoXfulhVLtmf2qgjZ6tpFLv92CP4y+vvXXqRnjKrzJZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718882037; c=relaxed/simple;
	bh=1/4NRcgT6efYLc+Gjxe48ItNJG5eN+Wre6lr446Pc8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mk+Nin1D8r2Rkmu0f9W6ExoADYfMb4sOrOB6BweFKiOUeFJ+RBlSXZd6BWEibkMS+YTqyNbttDvoIXtKwxPE+QYr1CXOZkxHXXnlGmHV8jRI8lAh/7zZeBiJm56bvBu3k8bdzCmZP417KEoiyg1Zz1FN2tg1P3wp1M2Xakq+G/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=h2zLYkst; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="h2zLYkst"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1718882031; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=2IBQqo2wdt4w9E1pQCBcfo/63oBXu3c5JBnJg0KVLSg=;
	b=h2zLYkst8eeTGsDiuv5jfCzMM24/tnzmphoJjpvQDLOMW0YDWUmpRJHwNSGR3r/At5zpsyInQKyF4uR8rB6aNuzLOqVu4P6c1xObh7Yh7e7u+9fHiHf9ObjmU2xTTMXZrit1EBfya2TFCkvH1d28Bn+uFxaJvqVe01FgWRMN3es=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033068173054;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0W8sD9SO_1718882030;
Received: from 30.97.56.69(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0W8sD9SO_1718882030)
          by smtp.aliyun-inc.com;
          Thu, 20 Jun 2024 19:13:51 +0800
Message-ID: <fab6f79f-3fb5-471a-8995-7f683a199769@linux.alibaba.com>
Date: Thu, 20 Jun 2024 19:13:49 +0800
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [mm] d2136d749d: vm-scalability.throughput -7.1%
 regression
To: "Huang, Ying" <ying.huang@intel.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Mel Gorman <mgorman@techsingularity.net>, Ryan Roberts
 <ryan.roberts@arm.com>, linux-mm@kvack.org, feng.tang@intel.com,
 fengwei.yin@intel.com
References: <202406201010.a1344783-oliver.sang@intel.com>
 <24a985cf-1bbf-41f9-b234-24f000164fa6@linux.alibaba.com>
 <87bk3w2he5.fsf@yhuang6-desk2.ccr.corp.intel.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <87bk3w2he5.fsf@yhuang6-desk2.ccr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/6/20 15:38, Huang, Ying wrote:
> Baolin Wang <baolin.wang@linux.alibaba.com> writes:
> 
>> On 2024/6/20 10:39, kernel test robot wrote:
>>> Hello,
>>> kernel test robot noticed a -7.1% regression of
>>> vm-scalability.throughput on:
>>> commit: d2136d749d76af980b3accd72704eea4eab625bd ("mm: support
>>> multi-size THP numa balancing")
>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>> [still regression on linus/master
>>> 92e5605a199efbaee59fb19e15d6cc2103a04ec2]
>>> testcase: vm-scalability
>>> test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
>>> parameters:
>>> 	runtime: 300s
>>> 	size: 512G
>>> 	test: anon-cow-rand-hugetlb
>>> 	cpufreq_governor: performance
>>
>> Thanks for reporting. IIUC numa balancing will not scan hugetlb VMA,
>> I'm not sure how this patch affects the performance of hugetlb cow,
>> but let me try to reproduce it.
>>
>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <oliver.sang@intel.com>
>>> | Closes: https://lore.kernel.org/oe-lkp/202406201010.a1344783-oliver.sang@intel.com
>>> Details are as below:
>>> -------------------------------------------------------------------------------------------------->
>>> The kernel config and materials to reproduce are available at:
>>> https://download.01.org/0day-ci/archive/20240620/202406201010.a1344783-oliver.sang@intel.com
>>> =========================================================================================
>>> compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
>>>     gcc-13/performance/x86_64-rhel-8.3/debian-12-x86_64-20240206.cgz/300s/512G/lkp-icl-2sp2/anon-cow-rand-hugetlb/vm-scalability
>>> commit:
>>>     6b0ed7b3c7 ("mm: factor out the numa mapping rebuilding into a new helper")
>>>     d2136d749d ("mm: support multi-size THP numa balancing")
>>> 6b0ed7b3c77547d2 d2136d749d76af980b3accd7270
>>> ---------------- ---------------------------
>>>            %stddev     %change         %stddev
>>>                \          |                \
>>>        12.02            -1.3       10.72 ±  4%  mpstat.cpu.all.sys%
>>>      1228757            +3.0%    1265679        proc-vmstat.pgfault
> 
> Also from other proc-vmstat stats,
> 
>       21770  36%      +6.1%      23098  28%  proc-vmstat.numa_hint_faults
>        6168 107%     +48.8%       9180  18%  proc-vmstat.numa_hint_faults_local
>      154537  15%     +23.5%     190883  17%  proc-vmstat.numa_pte_updates
> 
> After your patch, more hint page faults occurs, I think this is expected.
> 
> Then, tasks may be moved between sockets because of that, so that some
> hugetlb page access becomes remote?

After trying to reproduce this case, I also find that more hint page 
faults occur. And I think that is casued by changing 
"folio_ref_count(folio) != 1" to "folio_likely_mapped_shared(folio)", 
which results in scanning more exclusive pages, so I think this is 
expected from the previous discussion.

Yes, I think your analysis is correct, some hugetlb page accesses become 
remote due to task migration.
