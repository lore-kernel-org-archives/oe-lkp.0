Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE443D3329
	for <oe-lkp@lists.linux.dev>; Mon, 15 Jun 2026 16:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781541958; cv=none; b=Z6PXQYp4uSect0cqiLieU9DytnEEqyAJNJDgIyuCfTWfZbbLtSdSQllTkLG2NIsrA090mt9LJMTD1BMaMudXtHFFjIdHTfVFy0pcpXiWJ0LqCDSwkjtLdHJVtin9URaV9NmlUKAEVhPbj9yZEN8IE/xDCNQprJ5rzO+p6btBXBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781541958; c=relaxed/simple;
	bh=2rhT4KRBA8FJ70n7B8Z4PkQDzxSg2kK1Jn2l8u+L2jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2HFb3j1mZmkWDSDTZ1f7kkWR9ZLKCmnjQ3EfzJ/CZtrOPtJaMxrQoqIA2FxxgR7Fpm8klebSHiWqe4LoCEyqnlbjOr07EZ3xJrt+CkO9rQ7HNl1CsKknQ4PCb0E3U9NYgaS/FxmNPNg3DaSOmfkKWcJ+i3k+K6lP7yMfOPpb64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=adL4St8d; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="adL4St8d"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDE3B2574;
	Mon, 15 Jun 2026 09:45:49 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BEB883F905;
	Mon, 15 Jun 2026 09:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781541954; bh=2rhT4KRBA8FJ70n7B8Z4PkQDzxSg2kK1Jn2l8u+L2jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=adL4St8dVIpQRNnyZwBGrLv5uQei0+6Sknyap15o6sKwlZhVMg3Wz9+MSqyNsnbrL
	 KERPyVEEF9XV2Gn1MOwoG75mznvOl+xBWWhZ9H7GBwz/Bgblg3IAYjngNGR6DM5D6R
	 CniTN/TF6lfW1osdJ1F10MQurHGmkzQC7NDbk+PA=
Date: Mon, 15 Jun 2026 17:45:49 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: kernel test robot <oliver.sang@intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Andrew Morton <akpm@linux-foundation.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Brendan Jackman <jackmanb@google.com>,
	David Sterba <dsterba@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Liam Howlett <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Vishal Moola <vishal.moola@gmail.com>, linux-mm@kvack.org
Subject: Re: [linux-next:master] [vmalloc] 60ced5818f:
 stress-ng.shm.ops_per_sec 7.2% regression
Message-ID: <ajAsPR661gzAuqLE@e129823.arm.com>
References: <202606022131.112319f2-lkp@intel.com>
 <aifCQbaAZLkH2GJY@e129823.arm.com>
 <ai/LNIg42JYckH2B@e129823.arm.com>
 <87b8a714-e2bd-449d-9560-c181e927497a@kernel.org>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87b8a714-e2bd-449d-9560-c181e927497a@kernel.org>

Hi David,

[...]
 
> Looking at the original results, I spotted
> 
>     354997 ± 14%    +111.6%     751255 ±  4%  meminfo.PageTables
> 
> So we consumed twice the (process) page tables. Did you also manage to reproduce
> that or do you have an explanation for that?

Unfortunately not, When I tried with the reproduce scripts and see the
peek usage of meminfo for Pagetable, it's almost the same (from 90000KB ~
100,000KB), I couldn't observe the this drasmatic usage increase via
this testcase. So I think this is not for this patch.

> 
> > 
> > Given that the regression appears to be driven by a synthetic workload that
> > combines frequent shmem page faults with repeated stack allocation/free operations,
> > I do not think this is a significant concern for typical real-world workloads.
> 
> Yeah, if it's "we have less fragmentation", I agree. Using order-2 folios for
> shmem would likely similarly mitigate the problem I assume.
> 

Agree. Thanks!

-- 
Sincerely,
Yeoreum Yun
