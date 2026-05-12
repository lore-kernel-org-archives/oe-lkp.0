Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D337081A
	for <oe-lkp@lists.linux.dev>; Tue, 12 May 2026 16:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778601851; cv=none; b=Yc0iCnyqSn8O9s/11oBVGeK5bGx0DnmFaKBv0VjWJbUvXROMi6p4uxdj/nSDwFD5aLEiiCQZbk0ZDlGwmgxIJL5mK5Z/+sxpvVj6vFk90PNWPW/VQeg3/CjYfTSzwF+iB8JOd0e5dnr5UzV97JJQxvcgzaWk8uVR8GKyfn6Ngm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778601851; c=relaxed/simple;
	bh=eTOmKJ/wlbZ86mkmHIE8nk2woOg6ta8Xzy2G9wK7+5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LmLBaUrjG9JJGWxzI+IM1R9RE3oJvbi6BQFNQ0F3EYRSDNgYdBiDRJLwhTSl0ACz7A2sJUxoVVF11RnyvoxGZSIAOZ4Wl12jEKJ1ePPTSN2MvRqxqHuP5ZBCyCVvrA+M+iZ2hl3kycIJSj8gL0ZD2olVYvh75nVeYrSwAI17UFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fZ91/MZ2; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fZ91/MZ2"
Date: Tue, 12 May 2026 09:03:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778601847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t0D8jQU5BfShO2sTsrTqG76Sh20jWehvtgI/ct3AKBs=;
	b=fZ91/MZ20l3qiBh0DrWzOhAaGqjpaKBWbRNL7bHD0tGEVMn6IncVlSh1dh6GqjMEvFMe3s
	NFRBokLlo2zkzWxNwIxt/YWqOXiTornJyzqdnUCKzZbXmvgWnLRFREjueLLpkf+Lu80EAT
	0gvCKbi71Ot1RGVuTgHWC+fwv3V2d2c=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: kernel test robot <oliver.sang@intel.com>
Cc: Qi Zheng <zhengqi.arch@bytedance.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Carlier <devnexen@gmail.com>, 
	Allen Pais <apais@linux.microsoft.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Baoquan He <bhe@redhat.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Chen Ridong <chenridong@huawei.com>, David Hildenbrand <david@kernel.org>, 
	Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>, Harry Yoo <harry.yoo@oracle.com>, 
	Hugh Dickins <hughd@google.com>, Imran Khan <imran.f.khan@oracle.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Kamalesh Babulal <kamalesh.babulal@oracle.com>, 
	Lance Yang <lance.yang@linux.dev>, Liam Howlett <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Muchun Song <songmuchun@bytedance.com>, 
	Nhat Pham <nphamcs@gmail.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Suren Baghdasaryan <surenb@google.com>, Usama Arif <usamaarif642@gmail.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Wei Xu <weixugc@google.com>, Yosry Ahmed <yosry@kernel.org>, 
	Yuanchu Xie <yuanchu@google.com>, Zi Yan <ziy@nvidia.com>, Usama Arif <usama.arif@linux.dev>, 
	cgroups@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [linus:master] [mm]  01b9da291c: stress-ng.switch.ops_per_sec
 67.7% regression
Message-ID: <agNO8G8tPnPuVrGq@linux.dev>
References: <202605121641.b6a60cb0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202605121641.b6a60cb0-lkp@intel.com>
X-Migadu-Flow: FLOW_OUT

On Tue, May 12, 2026 at 08:56:52PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a 67.7% regression of stress-ng.switch.ops_per_sec on:
> 
> 
> commit: 01b9da291c4969354807b52956f4aae1f41b4924 ("mm: memcontrol: convert objcg to be per-memcg per-node type")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

This is most probably due to shuffling of struct mem_cgroup and struct
mem_cgroup_per_node members.

I will try to reproduce and will followup on this.
