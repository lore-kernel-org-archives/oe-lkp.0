Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0085A19F40B
	for <oe-lkp@lists.linux.dev>; Sat, 10 Oct 2026 03:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791601848; cv=none; b=bwxDubNq2LZqCQKH69EFp6xRcK/BwPG45jTDqPs+BccYqU/Xb8UfjB/taAXIBNTKtFwBdPYq4jKWPcKk7dh4CTFW9yZtguRjIpinlUXNdWEd9jwvmxXYpLp2JfatS4gvbXnZNu690kHR1KLWP+QiENVyZ628NxQoRhLFIeARCDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791601848; c=relaxed/simple;
	bh=bVpuCD+EEZtnTq1oyDHFaTpdSs9eU79YhNwzhyjvIh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYkDcmOInMcA3k6JSFzySuwpLjN5a/93QQMsyZgBUQVp7hatIJyOTVoY3bHVF9aVK2EeCDpe/XKS9DlN807OsO0meex29a6AnnSwVPn6PzDFwz9H/IdHXiP3TXjUvxVkFejN4aKFBxbJCXfASkVqUHHJAu1XHdnUof+ClSJy8Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/RWjNxL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/RWjNxL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791601846; x=1823137846;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bVpuCD+EEZtnTq1oyDHFaTpdSs9eU79YhNwzhyjvIh4=;
  b=W/RWjNxLEVWGneK9CWS1mcs+TjRlSq5bBF9e8/VXMPjIywHlJk2AVdRG
   ncByCofy/Cupj4lzN2NOEHv8Hqcu9BCC0SRiajwSwnja71DqyjRSQPkRB
   1anzB+2EkKxWY7KSy6scxtPZsEQnpHMV+5+9DHbVsIO/e4h5JIvfVaF3J
   UkLE4mM8B036m7vtOsT0d9PSFAPjSd6V6Jt/U8PQTBsjSnKqNvmRDfNE9
   ROydVlci8sHHLLfLRWL9mF5ILX/V+mgRF9VnUBcPPyLO/yCJKRUUPVGzT
   hh8LUEOtOPBVprMK+olRNI0NrMGan4d7eEQGzauI5SG+iFv/aFxdmtoUO
   g==;
X-CSE-ConnectionGUID: tL6yuJM+QcumJvAjc8UTVg==
X-CSE-MsgGUID: ob0JMnpiQc+BFpVpK7nY+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="289240"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="289240"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 20:10:46 -0700
X-CSE-ConnectionGUID: l/p3fCV8TeqJxJx4GcL7bw==
X-CSE-MsgGUID: 91kFolfjSxi5/SIbMZm+Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="2283965"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 20:10:41 -0700
Date: Sat, 10 Oct 2026 11:10:38 +0800
From: kernel test rebot <yi1.lai@intel.com>
To: Harry Yoo <harry@kernel.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-mm@kvack.org,
	Vlastimil Babka <vbabka@kernel.org>, Hao Li <hao.li@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	maple-tree@lists.infradead.org,
	Suren Baghdasaryan <surenb@google.com>
Subject: Re: [harry:b4/sheaf-size-round-up] [mm/slab]  ddf56dfc79:
 will-it-scale.per_process_ops 54.5% improvement
Message-ID: <asmsrokhdpPbongD@ly-workstation>
References: <202610091451.beda4ec3-lkp@intel.com>
 <asi-kgXfHJt6Gjp0@thinkpad>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <asi-kgXfHJt6Gjp0@thinkpad>

On Fri, Oct 09, 2026 at 12:41:18PM +0200, Harry Yoo wrote:
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

From the full results already collected:

meminfo.Slab: +37.9% (979712 → 1350738 KB)
meminfo.SUnreclaim: +46.2% (806254 → 1178980 KB)

Note these are system-wide, not pure per-object overhead. We don't
currently have a slabinfo snapshot isolating the maple_node cache
specifically.

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
