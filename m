Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C53F25A641;
	Tue, 28 Jan 2025 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738070943; cv=none; b=u/MSVcmZnHLc8L2d2yLRwnnA2yIp65Zg1BNHaRAxBAvVufHaBGKRfmJEg+HXG6PzW7mJgQOyHgOslpXeRlBjM0FADxs0+Uh9SToOSvCESa1LNROLlg65KYkPuBOgv3i+WVdJsXkVtLasGPAPKORVPLR2+Evf3aAEqSUgufs+s/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738070943; c=relaxed/simple;
	bh=PrGeKq/cekNtXGN1zCTehiAgqi/kdPssC9gRbMyTsCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DEJV1yL4Ziy4NFjebfoaD478/2SQIxAa+tlPrm7H57pOWrGBvI+eUsBbLV+ezXzIjJJ/2Y1CV/HKctKKjbVI0bubmbCOygIbhcY+WS/U2GmHgaiSAreeZh2BdQPED8rjx0aNJVaBQxr1c33soZk64uaVP6JLhhL0UhVhJdA7rX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gRQxCYDg; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gRQxCYDg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vHxSgCjH7Naq9fEg2BykBRzu4+AX2crR6qBiGVHNJ6U=; b=gRQxCYDghfIccrNaLLDgq71koW
	cbn8M55jMoaw/7Gu43iSQumys+MFp2fdEB3wKLkORWjTHBdKyI6uFK9kMCSu67SLMtau0DSIe6NOR
	IDGmN4MMja+Vsm9aAO2uwgPFrwiaOqvx8tMgzYg9HcTBARv472856ZZfxCz57r8KOtLuDMYf00Bf+
	zf+ti+iwA9uS310ecDukRGjsu07e9Watp/S+4EKV6JC2G/YY8E64s7TJPQ/iJyQKndK3gdff6jjXr
	zGfhedTNZmktMSP7O66WYU5nMciSAPqTpEvXNjyI4quHeItKTBiZU1odouzgtMLGHoPqeA4InM249
	TCH5MwPA==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tcle4-0000000AeXF-18uI;
	Tue, 28 Jan 2025 13:28:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9BD5F30050D; Tue, 28 Jan 2025 14:28:47 +0100 (CET)
Date: Tue, 28 Jan 2025 14:28:47 +0100
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
Message-ID: <20250128132847.GB505@noisy.programming.kicks-ass.net>
References: <202501281734.d408a35b-lkp@intel.com>
 <46ea4509-0f38-4b22-bd91-f05c68db2562@redhat.com>
 <20250128113100.GB7145@noisy.programming.kicks-ass.net>
 <2c599f1f-f63b-4504-a026-46bf73954124@redhat.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c599f1f-f63b-4504-a026-46bf73954124@redhat.com>

On Tue, Jan 28, 2025 at 12:39:51PM +0100, David Hildenbrand wrote:
> On 28.01.25 12:31, Peter Zijlstra wrote:

> > > I recall a recent series to select MMU_GATHER_RCU_TABLE_FREE on x86
> > > unconditionally (@Peter, @Rik).
> > 
> > Those changes should not have made it to Linus yet.
> > 
> > /me updates git and checks...
> > 
> > nope, nothing changed there ... yet
> 
> Sorry, I wasn't quite clear. CONFIG_PT_RECLAIM made it upstream, which has
> "select MMU_GATHER_RCU_TABLE_FREE" in kconfig.
> 
> So I'm wondering if the degradation we see in this report is due to
> MMU_GATHER_RCU_TABLE_FREE being selected by CONFIG_PT_RECLAIM, and we'd get
> the same result (degradation) when unconditionally enabling
> MMU_GATHER_RCU_TABLE_FREE.

Ah, yes, put a RHEL based config (as is the case here) should already
have it selected due to PARAVIRT.

But the thing is, that same paravirt crud will then map
paravirt_tlb_remove_table() to tlb_remove_page() on native, effectively
disabling the whole thing again.

It's only for actual virt stuff, that tlb_remove_table() is used.

These patches from Rik take all this stuff out and always use
tlb_remove_table().
