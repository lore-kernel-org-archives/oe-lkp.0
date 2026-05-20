Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4112DCF46
	for <oe-lkp@lists.linux.dev>; Wed, 20 May 2026 04:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779250387; cv=none; b=WsQ/B+S7XT5m/wxKAF8Qn7Zq3jE5pnh7EV0cCiWQ62bx+NBBnvdCWNXyRkD1Wk+jl6crENohCeb6jE1wDT30Ur3jAxc9z+mStacPevd9cbJwCqCTZcP3vNRAaHAkPCbBPSKqvfh+jU7yT8RlUzxaZrGZoFl49eExlV1+oyBrT/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779250387; c=relaxed/simple;
	bh=WJXZqTNMY27INgWD6j+riBNe7GOb+s885XyqJKWLuZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYVtn+OkFoLcLMg12p0qxHIqgooAX5OBGd5VMV+HKRREjKRtraoiiGVJYXwCiFlO0qDwcMxrm6/QB8aaSCqll9Ib87srwcCSQbKDzX2REz8AWEJoNevUgvJwTc1FmjyfdMPyannmN4crhqqR7LJukZJCydM0wmtdUI0PLzHTgvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZkXJ2H0M; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZkXJ2H0M"
Date: Tue, 19 May 2026 21:12:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779250382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oRxIk/rNMXwMe3aqIZ0sV2FoVFm9Hl2o3laEA+4gbk4=;
	b=ZkXJ2H0M1A8TbPE1BHyMrulOOmOHN3ljMZyTYcupbvGr+jR3MTuHpg5QkH7p69lQt2Ypuk
	s2iZE7b/MXQA4NvBuQZQ+NFxO3Fz9dJW/Ya1bKPSztN8l9KYJaWEjc+TQdJCNz3n4EncDG
	NQrSDSZa7akXzHm3+g5ueA8eM0PaV7E=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Oliver Sang <oliver.sang@intel.com>
Cc: Qi Zheng <qi.zheng@linux.dev>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Carlier <devnexen@gmail.com>, Allen Pais <apais@linux.microsoft.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Baoquan He <bhe@redhat.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Chen Ridong <chenridong@huawei.com>, 
	David Hildenbrand <david@kernel.org>, Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>, 
	Harry Yoo <harry.yoo@oracle.com>, Hugh Dickins <hughd@google.com>, 
	Imran Khan <imran.f.khan@oracle.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Kamalesh Babulal <kamalesh.babulal@oracle.com>, Lance Yang <lance.yang@linux.dev>, 
	Liam Howlett <Liam.Howlett@oracle.com>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Muchun Song <songmuchun@bytedance.com>, 
	Nhat Pham <nphamcs@gmail.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Suren Baghdasaryan <surenb@google.com>, Usama Arif <usamaarif642@gmail.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Wei Xu <weixugc@google.com>, Yosry Ahmed <yosry@kernel.org>, 
	Yuanchu Xie <yuanchu@google.com>, Zi Yan <ziy@nvidia.com>, Usama Arif <usama.arif@linux.dev>, 
	cgroups@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [linus:master] [mm] 01b9da291c: stress-ng.switch.ops_per_sec
 67.7% regression
Message-ID: <ag00nBP_zNa9RWxm@linux.dev>
References: <93b7c3f206f158e7387cbb5f0bf5845b59b93053@linux.dev>
 <19693be6-7132-446e-b3fc-b7e9f56e5949@linux.dev>
 <agdS5rIhcjIBVSog@linux.dev>
 <agm61hMv08XnV8sI@xsang-OptiPlex-9020>
 <agoYp1zW9afZ6uQz@linux.dev>
 <agtATZG9mIlYzMUl@linux.dev>
 <agtPMpQK2jXdQAY4@linux.dev>
 <agvvRNJTAtNkCVZc@xsang-OptiPlex-9020>
 <agxxuHOfNLX-32kI@linux.dev>
 <ag0fyi8GjHHf8bdC@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ag0fyi8GjHHf8bdC@xsang-OptiPlex-9020>
X-Migadu-Flow: FLOW_OUT

On Wed, May 20, 2026 at 10:43:22AM +0800, Oliver Sang wrote:
> hi, Shakeel,
> 
> On Tue, May 19, 2026 at 07:22:52AM -0700, Shakeel Butt wrote:
> > Hi Oliver,
> > 
> 
> [...]
> 
> > 
> > > > > 
> > > > > Also I am rethinking the approach, so I will send a prototype in response on
> > > > > this email for which I will need your help in testing.
> > > > 
> > > > Hi Oliver, can you please test the following patch?
> > > 
> > > got it. will change to test following patch. and this looks quite different
> > > with v2 or v3, so if you still want us to test v3, please let me know. thanks!
> > > 
> > 
> > No need to test v3 as it is similar to v2. Please test the following patch as it
> > is a direction I want to pursue and wanted an early signal if this is the right
> > direction.
> 
> FYI. in our tests, the following patch also recovers the regresion.
> 
> Tested-by: kernel test robot <oliver.sang@intel.com>

Thanks a lot. I will send out the formal patch with your tested-by tag.
