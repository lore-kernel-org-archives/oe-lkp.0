Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6663199FA2;
	Tue, 28 Jan 2025 11:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738063872; cv=none; b=Un4IM0g4u2UmjHzoN0JHniB/24XWDEVBeKZA0ArHlZnvhfqz+EzP3GM6ZlkSvc0TIns6zvFNFGHeEOe0ZC+cj0hwHIjRf7abH3hiRD40UgCmP3KEXtwWkBa7/yW86eEJcjlVGLvhUwp8vLQ10rtpk15mv5s6SaZajUHeiiqlCc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738063872; c=relaxed/simple;
	bh=X34TV27eF26+i7VOv/kMo5SK1Ck0K+bTZ/mpIcl3qwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TcheElLz0ivlzVfC9FZ5dD1Ya5Qm+lX+9UkGumwVsqAVTph47LmzjPrwSRBvlL1Q0lI0aNCoRucJBT/PEH+SGBqxloh6wp6CtMOrcUntvY44SK4xIHQoCakOh2DcDE9Z5Mu7YdWBv8uJOUlu7u+eVuojEFhW0qnhbkOskb8V/4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=oteBa6oa; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oteBa6oa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hUaxg+bYOQxGZnjUk3stobDsOFS2Sy2t1/A5Gj1JV1w=; b=oteBa6oaU8jboL//0NVXTCowAX
	S7su3zHYbLpOKSi0YSLcMAgaNiTgvCZwbFhHbpgF6cB74AT8KtBA6TOtiNDAgYWX+vWIabVUKIvc7
	EVFC2Htxy4V9y+bn0ST9OzYIY3Lq5tdnGcQ7L0WF9i/YFBy894a2fuNX4GRxEdg+3j0LgJgl7UxQz
	isDbHsVe11zjSJuplIm5KZDh/3jww+s48vDa3zOEXEG6qJOLS3DqNZ3iwr7Vj2t1xxoge1qzB+9+N
	VUEpD5qZcdjS3/wVlmczQrFCxzt6pzyq8n3W2I47tpoY4UUYxVwoKLukIYBMnseDmukMXtJR5bmeY
	PQyROhjw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tcjo4-0000000AXGa-47mh;
	Tue, 28 Jan 2025 11:31:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 858DE30050D; Tue, 28 Jan 2025 12:31:00 +0100 (CET)
Date: Tue, 28 Jan 2025 12:31:00 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: David Hildenbrand <david@redhat.com>
Cc: kernel test robot <oliver.sang@intel.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Rientjes <rientjes@google.com>,
	Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Matthew Wilcox <willy@infradead.org>, Mel Gorman <mgorman@suse.de>,
	Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>,
	Will Deacon <will@kernel.org>, Zach O'Keefe <zokeefe@google.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Rik van Riel <riel@surriel.com>
Subject: Re: [linus:master] [x86] 4817f70c25: stress-ng.mmapaddr.ops_per_sec
 63.0% regression
Message-ID: <20250128113100.GB7145@noisy.programming.kicks-ass.net>
References: <202501281734.d408a35b-lkp@intel.com>
 <46ea4509-0f38-4b22-bd91-f05c68db2562@redhat.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46ea4509-0f38-4b22-bd91-f05c68db2562@redhat.com>

On Tue, Jan 28, 2025 at 11:05:17AM +0100, David Hildenbrand wrote:
> On 28.01.25 10:57, kernel test robot wrote:
> > 
> > hi, Qi Zheng,
> > 
> > this is more a FYI report than a regression report.
> > 
> > by 4817f70c25, parent/4817f70c25 configs have below diff,
> > 
> > --- /pkg/linux/x86_64-rhel-9.4/gcc-12/718b13861d2256ac95d65b892953282a63faf240/.config  2025-01-27 16:20:43.419181382 +0800
> > +++ /pkg/linux/x86_64-rhel-9.4/gcc-12/4817f70c25b63ee5e6fd42d376700c058ae16a96/.config  2025-01-26 09:27:16.848625105 +0800
> > @@ -1236,6 +1236,8 @@ CONFIG_IOMMU_MM_DATA=y
> >   CONFIG_EXECMEM=y
> >   CONFIG_NUMA_MEMBLKS=y
> >   CONFIG_NUMA_EMU=y
> > +CONFIG_ARCH_SUPPORTS_PT_RECLAIM=y
> > +CONFIG_PT_RECLAIM=y
> > 
> >   #
> >   # Data Access Monitoring
> > 
> > 
> > this report seems show the impact of PT_CLAIM feature for this stress-ng case.
> > 
> > To us, this is not a code logic regression, but is kind of 'regression' from a
> > new feature. anyway, below full report just FYI.
> 
> mmapaddr test case seems to mostly do mmap+munmap. No obvious sign of
> MADV_DONTNEED, unless buried somewhere :)
> 
> So either
> 
> (1) The series is reclaiming page tables outside of MADV_DONTNEED, which
>     it shouldn't -- in particular not during munmap() where that happens
>     already using the "ordinary" page table removal code for removed
>     VMAs.
> 
> (2) This is the effect of MMU_GATHER_RCU_TABLE_FREE that gets selected?
> 
> 
> I recall a recent series to select MMU_GATHER_RCU_TABLE_FREE on x86
> unconditionally (@Peter, @Rik).

Those changes should not have made it to Linus yet.

/me updates git and checks...

nope, nothing changed there ... yet
