Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711163B8D48;
	Thu, 11 Dec 2025 20:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765486031; cv=none; b=crAkkUYoZUeEr0C4wox00VjSchJnIpCZSwi5D8ikSWIopCcYjG/sE6vp/MmDF8vjFYjatY2DNoHc9WcvLVCPCsQWX7sC9fd81o7yhewBl+QF0SAkANiz96oAa7+tZhaBV8M74uwsqwZw+0RdI21d0pgM9snEFxpfyDZjNwv534Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765486031; c=relaxed/simple;
	bh=wTwDPoEwycYUHR2/lb93wR9R6ICIFyLXY2w59v6xDTc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kB2KSmHpBnOJeM+eREWdx4r2Kpa3hrLbdnJkm0UNZscBXnro5hnQuhSnX3XdHT6AGkm+rQsMlDQ31WeS4cZ8y2OPA9TkYqGsSfgLSyypa/oGMpO1Sl4/dneZuj7RbCTJdeB/oOGZF1kyFS3WPEwdNJgCMwBSU5CK+A7dMmGDl/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=V7FoWhxi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="V7FoWhxi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD48C4CEF7;
	Thu, 11 Dec 2025 20:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1765486031;
	bh=wTwDPoEwycYUHR2/lb93wR9R6ICIFyLXY2w59v6xDTc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=V7FoWhxi+UrKAjN/T/nhxCQ6n1Mzr9ekIZUjEpI1Y8V/uF+NSUggc0GrS65ueDi57
	 yWoZTAS89pwHbakWkBd99tzMVQ07RkCNZ/8eUBeOvvrX6vqGGpz98K0AWHamKocau2
	 1eF5kaQs3XN89KxcoslB3FkxRqTVp5C4hs1RoDBA=
Date: Thu, 11 Dec 2025 12:47:10 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org, Uladzislau Rezki
 <urezki@gmail.com>, linux-mm@kvack.org
Subject: Re: [linus:master] [mm/vmalloc]  a061578043:
 BUG:spinlock_trylock_failure_on_UP_on_CPU
Message-Id: <20251211124710.f1a04ebb7d8b57abb2de6baa@linux-foundation.org>
In-Reply-To: <aToCq6XBybxAFopN@fedora>
References: <202512101320.e2f2dd6f-lkp@intel.com>
	<aToCq6XBybxAFopN@fedora>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 Dec 2025 15:30:51 -0800 "Vishal Moola (Oracle)" <vishal.moola@gmail.com> wrote:

> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20251210/202512101320.e2f2dd6f-lkp@intel.com
> > 
> 
> Hmmm. This looks like a race condition tied to reclaim. I'm assuming
> we fail to allocate a page and kick off kswapd. Then when we fall back
> to the bulk allocator which tries to remove a pcp page at the same time as
> kswapd tries to reclaim it. Maybe?
> 
> Does something like this fix it?

Concerned.  If pcp page removal is racing with kswapd reclaim then
that's a problem.  Altering a caller so it doesn't tickle this bug
doesn't fix the bug?

> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index ecbac900c35f..0d1480723ddc 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3634,7 +3634,7 @@ vm_area_alloc_pages(gfp_t gfp, int nid,
>  	struct page *page;
>  	int i;
>  	unsigned int large_order = ilog2(nr_remaining);
> -	gfp_t large_gfp = vmalloc_gfp_adjust(gfp, large_order) & ~__GFP_DIRECT_RECLAIM;
> +	gfp_t large_gfp = vmalloc_gfp_adjust(gfp, large_order) & ~__GFP_RECLAIM;
>  
>  	large_order = min(max_attempt_order, large_order);
