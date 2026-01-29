Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2EF29A1
	for <oe-lkp@lists.linux.dev>; Thu, 29 Jan 2026 14:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769698194; cv=none; b=DAP0B+JvO9yha7gCVhmGh3wi+w59jRZqtNdtyw/xIbkOD1+QXzZNeg8Xs30XT1lT55TxxNp7/lwEPQM3E5UPSBTKdEHdQl+KDl9MSGefchwBpIkR9mNdpELTLmhT13XzNSJSnFEzzeeSHvJGnW4GEaQgTcKvawN9G3M2yL9KDDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769698194; c=relaxed/simple;
	bh=4V4/Q3QRtXuLQgFRsUyKSDs0BHsjdIN/Arx9uwzppBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6Sim7MAsfLdDPSR3BrdlQAsNmBUmkTUo1TER5yEjoBP9Iy0JnepYzwYxOVy5+GLX31mPUFei5pv7Gzq/sCTdMl8eTXQcSBetYp+LifOc2PRanEebDV9k81UWWKw10NduGtdQHHIwu73eYRSDHMHa/ZT1Vv1t1fzgAMa6SAZiKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rvBBIJ1e; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rvBBIJ1e"
Date: Thu, 29 Jan 2026 22:49:41 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769698190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7pZauEyJNKWoqPnWbSN9zNexw19b7pnJQnRLbQOGj5g=;
	b=rvBBIJ1eg2aFO5nlAjIpyMhFPxvkEnyT1gJmMUU76X3YpF/CWQ/Qr9ifuAG6hR9nFSLzaS
	We88DXSfeROVgGPK/NeDNhYRNiWsfhs0Ri04tM9uW4GB0/aB3soOzQebhar+dCpQnOGI/0
	4CLC/AbmkQxco9iuhZg8pFPnUdnEtrs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Li <hao.li@linux.dev>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-mm@kvack.org, Harry Yoo <harry.yoo@oracle.com>, 
	Mateusz Guzik <mjguzik@gmail.com>, Petr Tesarik <ptesarik@suse.com>
Subject: Re: [vbabka:b4/sheaves-for-all-rebased] [slab] aa8fdb9e25:
 will-it-scale.per_process_ops 46.5% regression
Message-ID: <eefkvperwakt6zgjs7gp5s6u5tnuqsqfcl7zlgneft7gr542zt@dkaia5zpbmsc>
References: <202601132136.77efd6d7-lkp@intel.com>
 <3dfb6857-3705-4042-9a30-da488434d9e3@suse.cz>
 <rsfdl2u4zjec5s4f46ubsr3phjkdhq4jajgwimbml7mq6yy2lg@krjc6oobmkwz>
 <3317345a-47c9-4cbb-9785-f05d19e09303@suse.cz>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3317345a-47c9-4cbb-9785-f05d19e09303@suse.cz>
X-Migadu-Flow: FLOW_OUT

On Thu, Jan 29, 2026 at 09:47:02AM +0100, Vlastimil Babka wrote:
> On 1/29/26 08:05, Hao Li wrote:
> > On Wed, Jan 28, 2026 at 11:31:59AM +0100, Vlastimil Babka wrote:
> > Hi Vlastimil,
> > 
> > I conducted a few performance tests on my machine, and I'd like to share my
> > findings. While I'm not an expert in LKP-style performance testing, I hope these
> > results can still serve as a useful reference.
> > 
> > Machine Configuration:
> > - CPU: AMD, 2 sockets, 2 nodes per socket, total 192 CPUs
> > - SMT: Disabled
> > 
> > Kernel Version:
> > All tests were based on modifications to the 6.19-rc5 kernel.
> > 
> > Test Scenarios:
> > 0. 6.19-rc5 + Completely disabled the sheaf mechanism
> >     - This was done by set s->cpu_sheaves to NULL
> > 1. Unmodified 6.19-rc5
> > 2. 6.19-rc5 + sheaves-for-all patchset
> > 3. 6.19-rc5 + sheaves-for-all patchset + list_lock contention patch
> > 4. 6.19-rc5 + sheaves-for-all patchset + list_lock contention patch + increased
> >    the maple node sheaf capacity to 128.
> > 
> > Results:
> > 
> > - Performance change of 1 relative to 0:
> > 
> > ```
> > will-it-scale.64.processes  -25.3%
> > will-it-scale.128.processes -22.7%
> > will-it-scale.192.processes -24.4%
> > will-it-scale.per_process_ops -24.2%
> > ```
> > 
> > - Performance change of 2 relative to 1:
> > 
> > ```
> > will-it-scale.64.processes  -34.2%
> > will-it-scale.128.processes -32.9%
> > will-it-scale.192.processes -36.1%
> > will-it-scale.per_process_ops -34.4%
> > ```
> > 
> > - Performance change of 3 relative to 1:
> > 
> > ```
> > will-it-scale.64.processes  -24.8%
> > will-it-scale.128.processes -26.5%
> > will-it-scale.192.processes -29.24%
> > will-it-scale.per_process_ops -26.7%
> > ```
> 
> Oh cool, that shows the patch helps, so I'll proceed with it.
> IIUC with that the sheaves-for-all doesn't regress this benchmark anymore,
> the regression is from 6.18 initial sheaves introduction and related to
> maple tree sheaf size.

Yes, one of the factors contributing to the regression does seem to be the capacity
of the sheaf.  

And I feel that this regression may be difficult to completely resolve with this
lock optimization patch. I'll share my latest test results in response to the v4
patchset a bit later, where we can continue the discussion in more detail.

However, I believe this regression doesn't need to block the progress of the v4
patchset.

> 
> > - Performance change of 4 relative to 1:
> > 
> > ```
> > will-it-scale.64.processes  +18.0%
> > will-it-scale.128.processes +22.4%
> > will-it-scale.192.processes +26.9%
> > will-it-scale.per_process_ops +22.2%
> > ```
> > 
> > - Performance change of 4 relative to 0:
> > 
> > ```
> > will-it-scale.64.processes  -11.9%
> > will-it-scale.128.processes -5.3%
> > will-it-scale.192.processes -4.1%
> > will-it-scale.per_process_ops -7.3%
> > ```
> > 
> > From these results, enabling sheaves and increasing the sheaf capacity to 128
> > seems to bring the behavior closer to the old percpu partial list mechanism.
> 
> Yeah but it's a tradeoff so not something to do based on one microbenchmark.

Sure, exactly.

> 
> > However, I previously noticed differences[1] between my results on the AMD
> > platform and Zhao Liu's results on the Intel platform. This leads me to consider
> > the possibility of other influencing factors, such as CPU architecture
> > differences or platform-specific behaviors, that might be impacting the
> > performance results.
> 
> Yeah, these will-it-scale benchmarks are quite sensitive to that.
> 
> > I hope these results are helpful. I'd be happy to hear any feedback or
> 
> Very helpful, thanks!
> 
> > suggestions for further testing.
> 
> I've had Petr Tesarik running various mmtests, but those results are now
> invalidated due to the memory leak, and resuming them is pending some infra
> move to finish. But it might be rather non-obvious how to configure them or
> even what subset to take. I was interested in netperf and then a bit of
> everything just to see there are no unpleasant surprises.

Thanks for the update. Looking forward to the test results whenever they're
ready.

-- 
Thanks,
Hao

> 
