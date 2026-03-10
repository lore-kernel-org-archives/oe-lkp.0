Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5623161BE;
	Tue, 10 Mar 2026 15:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773156238; cv=none; b=Uzl5eyzCjPhlaXgx/YfUzViI4cDP5GMf355hq+b8I/PMVg/T5OjBhhkPfStIQHu6WKb/TbAOst8vtk4rSSvTK1ZC5iN8DXoOWQ+XR6AOcVm71jU32Z3eNaKiADDCaXH+zUhW6QBlrYDzGRKitoFd4GZEu6+64JmFwmu+46fgna0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773156238; c=relaxed/simple;
	bh=uydY3q0o70XytmsawTFlJp9I6P95bdHqvt5LTRAWgz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VuoqYRLKxyN/9oM1kEpq0sT1OtxDGR7PuR0MQg/5xWjJJRHnZRg9jHlw+jeKqv62UdjObbn2YEjRT9waOJ7JIieh9xNKdAtiYEzH2K+yt06LhShEYCKEbMjR0VmjJ793IFdX/t7dQxk3zDyhVwMPfBr6KKcb0eI2MdazkL99U4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=g8RJCz+Z; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="g8RJCz+Z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OcS+xT+naivrA9ImKsQm54C5uXFtwHVbqqX3PmWtHeI=; b=g8RJCz+Z4IY5s1QlP+TLosd15S
	ut4CzBAwd1CIf/+IHLzAYUlDTy/lrHLN60PWXX2ReAeNaDM+uIeLqNlrE0sUyqE8F+dypHda3+aGQ
	z2Yw3JSYUMuxkja6UDze/Eau8vVRsuuSkZzddYM5msw0noMBXHZp3pRxpSGXFY2szUSx31/2D89yD
	MX5x+dgilRrDDl7kXUuzLJ8xUmjTsfqsq1D2sqRWv0bivpC+TjE8epm97H0iMwLKkXuEe5BM/MgGO
	KDDomCTmyBZfvYmNyVcjKh0MkHnYWp6nct7EXbd2oTM01DIGi/882UxtjdwVHV6l7OH5R2n6NVUiX
	sIY0DL/A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyw4-0000000ExvX-0JTD;
	Tue, 10 Mar 2026 15:23:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 71D3B300462; Tue, 10 Mar 2026 16:23:50 +0100 (CET)
Date: Tue, 10 Mar 2026 16:23:50 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [tip:sched/hrtick] [hrtimer]  2889243848:
 stress-ng.timermix.ops_per_sec 30.1% regression
Message-ID: <20260310152350.GF606826@noisy.programming.kicks-ass.net>
References: <202603102229.74b9dee4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603102229.74b9dee4-lkp@intel.com>

On Tue, Mar 10, 2026 at 10:46:16PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a 30.1% regression of stress-ng.timermix.ops_per_sec on:
> 
> 
> commit: 2889243848560b6b0211aba401d2fc122070ba2f ("hrtimer: Re-arrange hrtimer_interrupt()")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/hrtick
> 
> 
> testcase: stress-ng
> config: x86_64-rhel-9.4
> compiler: gcc-14
> test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
> parameters:
> 
> 	nr_threads: 100%
> 	testtime: 60s
> 	test: timermix
> 	cpufreq_governor: performance
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202603102229.74b9dee4-lkp@intel.com
> 
> 
> Details are as below:
> -------------------------------------------------------------------------------------------------->
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20260310/202603102229.74b9dee4-lkp@intel.com

As per always, I find it incredibly hard to deduce how the test is
actually ran.

I suppose this is:  stress-ng --timermix ....
but what arguments exactly?
