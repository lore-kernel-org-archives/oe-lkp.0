Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604BD4C9DE4
	for <oe-lkp@lists.linux.dev>; Fri,  9 Oct 2026 11:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543847; cv=none; b=d12tQMLCo5Tnxvd3dDCd5aa6SF27t9MOb1mKpPXBUdrWFyd5uYatWw8EBaOauRznrSZfqIQ6NU6St5zUZMzoQ1YR8Z9MSfIm1Z9zZDLPLyEniGlnn9RZUuSamjr1/q7S93sFuh1X2Ko8WjaQvizvFnuIvU2uzX3amBVb0uT+J5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543847; c=relaxed/simple;
	bh=9BJzS5xAX1ZfZUEC36qI+T2CthLql9ii8V+PAUYoyuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tekL3MHFn7aFor0GlQk86D6bxkf5P7LI0lCPwIVBBRg0kCtP9HfIUQ3wDwtzx6fFHqWeAyIv1dVykmWz4GMukgHQE/hKi8jLFaC1KtFmsHyl79Hp/0AI7V/rSErBymhjhpFZlfEQhlHmDRDINRd71WUluw2LovpcaIJ6fAMqnW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HXtBu0RT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HXtBu0RT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400341F000FF;
	Fri,  9 Oct 2026 11:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791543835;
	bh=o4mVTD0NTqB9D7Gs5A6eFeOnRu4d7xcFVmW/D5Mtxo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HXtBu0RToAts+Aarg/9eCHojiplI8SRWAbjZJ6AzKBdxw0FKyNvaKXojId2Nkjqww
	 t1ASGTPG2Y07P6986jcR6c3eTgzGuL+YOiIfDKKGcdRlGLJ2RBI7qGbvU10yvOlvmU
	 pYD6V4Vx8/j2m2xJU7i77Wq0cNDoCBUv2swu++strIRjoqi3bH8gxmgiPAZDEukJaS
	 hzyigALZCBtHoIiqHQfLQ2epmRM/lFsg70SWMAGAcUjVLfJGLUnA7N1tDhlRPwIu54
	 qajrwZQM+pH18Bv3X1rr2USxdSJT5+mXmMmMArjxj7+uelh3AMReqU9q1ArVGfffSS
	 zHQHc2ZMn6yXw==
Date: Fri, 9 Oct 2026 13:03:45 +0200
From: Harry Yoo <harry@kernel.org>
To: kernel test robot <yi1.lai@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-mm@kvack.org, 
	Vlastimil Babka <vbabka@kernel.org>, Hao Li <hao.li@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Ballance <andrewjballance@gmail.com>, maple-tree@lists.infradead.org, 
	Suren Baghdasaryan <surenb@google.com>
Subject: Re: [harry:b4/sheaf-size-round-up] [mm/slab]  ddf56dfc79:
 will-it-scale.per_process_ops 54.5% improvement
Message-ID: <asjIHAeuL1ilE4sn@thinkpad>
References: <202610091451.beda4ec3-lkp@intel.com>
 <asi-kgXfHJt6Gjp0@thinkpad>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <asi-kgXfHJt6Gjp0@thinkpad>

Oh, Vlastimil mentioned (off-list) that the performance should be
re-evaluated on top of Hao Li's recent performance improvement [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/mm/slab.git/commit/?id=1b87ea06a34b213e45e3e0c4effd5043f15046ed

Ideally should be rebased and re-evaluated on top of
slab/for-next.... :P

On Fri, Oct 09, 2026 at 12:41:21PM +0200, Harry Yoo wrote:
> [ +Cc slab, maple tree folks, ... and Suren :D ]
> 
> On Fri, Oct 09, 2026 at 02:39:02PM +0800, kernel test robot wrote:
> > 
> > 
> > Hello,
> 
> Hi, thanks for reporting!
> 
> > kernel test robot noticed a 54.5% improvement of will-it-scale.per_process_ops on:
> 
> May I ask if there's data on slab memory usage for this experiment?
> 
> Performance improvement is nice, but only when we know what's
> the tradeoff (memory usage).
> 
> I think diff on Slab:, SReclaimable:, SUnreclaim: in /proc/meminfo,
> and in addition to that, ideally diff on per-cache slab memory usage
> (from slabtop or /proc/slabinfo) during the experiment would be nice
> to have to make a decision :-)
> 
> > commit: ddf56dfc79f5734d7b3aa8ba81f195d52b3e5823 ("mm/slab: round up sheaf size to kmalloc size for explicit sheaf_capacity")
> > https://git.kernel.org/cgit/linux/kernel/git/harry/linux.git b4/sheaf-size-round-up
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git/commit/?h=b4/sheaf-size-round-up
> 
> Oh, this is a b4 branch that I pushed but did not submit to mailing list
> yet because I wasn't didn't measure its implication on memory usage.
> 
> The patch removes under-utilized 244 bytes per sheaf on maple_node cache
> by not skipping "rounding up to the next kmalloc size" step for explicit
> sheaf capacity.
> 
> Copying and pasting the patch here:
> > mm/slab: round up sheaf size to kmalloc size for explicit sheaf_capacity
> >
> > calculate_sheaf_capacity() calculates the size of struct slab_sheaf from
> > the capacity, rounds it up to the next kmalloc bucket size, and then
> > recalculates the capacity from the rounded-up size so that no memory
> > is wasted within the bucket.
> > 
> > However, when the user explicitly specifies args->sheaf_capacity and it
> > is larger than the capacity calculated by the heuristic, this round up
> > step is skipped.
> > 
> > This wastes memory for maple_node cache. Its object_size is 256 bytes,
> > so the capacity calculated from the heuristic is 26. Rounding up
> > increases the sheaf size from 2 + 26 * 8 = 240 bytes to 256 bytes
> > (kmalloc-256), yielding a capacity of 28.
> > 
> > But since the maple tree cache explicitly specifies a capacity of 32,
> > the final capacity becomes 32 without any round up, and the sheaf size
> > becomes 32 + 32 * 8 = 288 bytes, which is allocated from kmalloc-512.
> > In other words, 512 - 288 = 224 bytes are wasted per sheaf.
> >
> > Move the round up step after max(capacity, args->sheaf_capacity) so
> > that it is also applied to explicitly specified capacities. With this
> > change, the round up behavior becomes consistent and the sheaf capacity
> > of maple_node becomes 60 and does not waste memory anymore.
> 
> It does it increase memory usage for sheaves because it's reusing wasted
> memory, but it could end up more memory being used as each sheaf
> now caches more objects.
> 
> > Signed-off-by: Harry Yoo (Meta) <harry@kernel.org>
> > ---
> > 
> > diff --git a/mm/slub.c b/mm/slub.c
> > index f9b56cb439e709..4fa551bf02cd64 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -7895,17 +7895,19 @@ static unsigned int calculate_sheaf_capacity(struct kmem_cache *s,
> >  	else
> >  		capacity = 60;
> >  
> > -	/* Increment capacity to make sheaf exactly a kmalloc size bucket */
> > -	size = struct_size_t(struct slab_sheaf, objects, capacity);
> > -	size = kmalloc_size_roundup(size);
> > -	capacity = (size - struct_size_t(struct slab_sheaf, objects, 0)) / sizeof(void *);
> > -
> >  	/*
> >  	 * Respect an explicit request for capacity that's typically motivated by
> >  	 * expected maximum size of kmem_cache_prefill_sheaf() to not end up
> >  	 * using low-performance oversize sheaves
> >  	 */
> > -	return max(capacity, args->sheaf_capacity);
> > +	capacity = max(capacity, args->sheaf_capacity);
> > +
> > +	/* Increment capacity to make sheaf exactly a kmalloc size bucket */
> > +	size = struct_size_t(struct slab_sheaf, objects, capacity);
> > +	size = kmalloc_size_roundup(size);
> > +	capacity = (size - struct_size_t(struct slab_sheaf, objects, 0)) / sizeof(void *);
> > +
> > +	return capacity;
> >  }
> >  
> >  /*
> 
> [-------<8 end of the patch-------]
> 
> > testcase: will-it-scale
> > config: x86_64-rhel-9.4
> > compiler: gcc-14
> > test machine: 256 threads 2 sockets GENUINE INTEL(R) XEON(R) (Sierra Forest) with 128G memory
> > parameters:
> > 
> > 	nr_task: 100%
> > 	mode: process
> > 	test: brk2
> > 	cpufreq_governor: performance
> > 
> > 
> > Details are as below:
> > -------------------------------------------------------------------------------------------------->
> > 
> > 
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20261009/202610091451.beda4ec3-lkp@intel.com
> > 
> > =========================================================================================
> > compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
> >   gcc-14/performance/x86_64-rhel-9.4/process/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp1/brk2/will-it-scale
> > 
> > commit: 
> >   675a745c61 ("EDITME: cover title for sheaf-size-round-up")
> >   ddf56dfc79 ("mm/slab: round up sheaf size to kmalloc size for explicit sheaf_capacity")
> > 
> > 675a745c6113e420 ddf56dfc79f5734d7b3aa8ba81f 
> > ---------------- --------------------------- 
> >          %stddev     %change         %stddev
> >              \          |                \  
> >   70440501           +54.5%  1.089e+08        will-it-scale.256.processes
> >       0.30 ±  3%     +35.9%       0.41 ±  8%  will-it-scale.256.processes_idle
> >     275157           +54.5%     425248        will-it-scale.per_process_ops
> >   70440501           +54.5%  1.089e+08        will-it-scale.workload
> > 
> > 
> > Disclaimer:
> > Results have been estimated based on internal Intel analysis and are provided
> > for informational purposes only. Any difference in system hardware or software
> > design or configuration may affect actual performance.
> > 
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki

-- 
Cheers,
Harry / Hyeonggon
