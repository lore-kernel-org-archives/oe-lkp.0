Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772043;
	b=VXb2alThShJmEdWw+RJsiNlg/85LjyYD5BMLcNU1Xg3zeqdG9nLAs+wGKPsyaVuyQ5gV
	 RvHf+vxEWNonj12GrjCpVsRV+Hs70C2pJDQ9wYw5PMmJScxSOcr6O3XytZiVej3voIoj8
	 V8Pp+v6HUottif3l5hTM+YjN+D1jodfWUJ7y2nVK/y+eBw/Mg2l64bem4Bzpc0KNWrwFd
	 BVPPUopHOpvi7zojFhMEQe04hRi3Yab1/0OVSSixUGNzxf2i9rkbbXHkNFBAs4s1kf8RK
	 iT/UjLT2r/i/5xtDsLQBG5f4iVWG2zzVKaAi5+BcHU3rKwJ73cpZ92ddq56J7fKiUwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772043;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=IFcaApJz8ZONelHaz8MZEufCGgBPZDm1LTNrgADRqQ0=;
	b=mX+phZHwoXmDqSnB5Hji/HGttKlzCn5OXQaOOR8f/iv80RnXWmtW4tTwR68IVVfWxv4v
	 945JEZxSzLdr9tAQS/MAbI9ufeW++0D6TREoVaQ5m7yWDAHemmIdNZMHdQBYYpSozTGZs
	 dIEkbS8P1h6YTaBXsHXiLXvj2053hB+l5z72cnVqst+viwG224p5MjNssP1chejTdrl/s
	 2cTljdJ3Z/0pBSgtPUj9lQkdNNAvK/i/ve1PPVly99ezrJAWltuGBX0ZLGBg01tz68vPO
	 iN1bVqHQ8vTq42aD4JACdpraVkIjFBHWJW6ByskcimItRmFd7MnxXKLYYKA2wETCJ2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cR9AyXN7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB92606A31E;
	Fri, 23 Oct 2026 16:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cR9AyXN7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B082B1F01825;
	Fri, 23 Oct 2026 16:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792772042;
	bh=IFcaApJz8ZONelHaz8MZEufCGgBPZDm1LTNrgADRqQ0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=cR9AyXN7XSpD0w2eBWk5teaoegU6q+3TjLIHOWL1/ML1V30CEM/fg480MK13JuKcx
	 Tt+WyEsJJWTpEw1eY6GaHdpcf9z5w0SB02iI0m7+dOfTPmonORbwrWv754y0tNkODH
	 8Dd5Jeg4qhJ5zWFWJiuZVLAgDkVhnytEL/TF3V7LY4zMiPDbzAXUhd8S7mVoxkoUjK
	 xrfYLN2E4hLMJ2hwXwxdvHCsRjcykhWWJgSFKBy0pBii9MOhVI2wnP5W1KIk22yLsy
	 OfUhdziffU6Oxw4hSerMSskGuk7/YHCMv0hEpZ8osPZjVRwrYFTzIP/TQB4jPIbIJg
	 xFRjGOWw4xyTA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 6EF79CE0540; Fri, 23 Oct 2026 09:14:02 -0700 (PDT)
Date: Fri, 23 Oct 2026 09:14:02 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <yi1.lai@intel.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Phil Auld <pauld@redhat.com>, aubrey.li@linux.intel.com,
	yu.c.chen@intel.com
Subject: Re: [linus:master] [sched/core]  118a2cf4ce:
 stress-ng.schedpolicy.ops_per_sec 14.1% regression
Message-ID: <b39cd288-9133-40e1-b27d-d8ef3973b37c@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202610231954.51716452-lkp@intel.com>
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202610231954.51716452-lkp@intel.com>

On Fri, Oct 23, 2026 at 07:49:20PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a 14.1% regression of stress-ng.schedpolicy.ops_per_sec on:
> 
> 
> commit: 118a2cf4ced60777a2408001e2b4838fed1cea55 ("sched/core: Call wakeup_preempt() for queued tasks during class change") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> testcase: stress-ng
> config: x86_64-rhel-9.4
> compiler: gcc-14
> test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
> parameters:
> 
> 	nr_threads: 100%
> 	testtime: 60s
> 	test: schedpolicy
> 	cpufreq_governor: performance
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yi1.lai@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202610231954.51716452-lkp@intel.com

This regression is not a good thing, but this commit is fixing a real bug.

								Thanx, Paul

> Details are as below:
> -------------------------------------------------------------------------------------------------->
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20261023/202610231954.51716452-lkp@intel.com
> 
> =========================================================================================
> compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
>   gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/schedpolicy/stress-ng/60s
> 
> commit: 
>   v7.3-rc7
>   118a2cf4ce ("sched/core: Call wakeup_preempt() for queued tasks during class change")
> 
>         v7.3-rc7 118a2cf4ced60777a2408001e2b
> ---------------- --------------------------- 
>          %stddev     %change         %stddev
>              \          |                \  
>     246.24           -14.1%     211.56        stress-ng.schedpolicy.SCHED_BATCH_schedules_per_sec
>     246.24           -14.1%     211.56        stress-ng.schedpolicy.SCHED_DEADLINE_schedules_per_sec
>     246.24           -14.1%     211.55        stress-ng.schedpolicy.SCHED_FIFO_schedules_per_sec
>     246.23           -14.1%     211.55        stress-ng.schedpolicy.SCHED_OTHER_schedules_per_sec
>     246.24           -14.1%     211.56        stress-ng.schedpolicy.SCHED_RR_schedules_per_sec
>   16540375           -14.1%   14210394        stress-ng.schedpolicy.ops
>     275785           -14.1%     236940        stress-ng.schedpolicy.ops_per_sec
>      85768 ±  3%    +734.4%     715671 ±  2%  stress-ng.time.involuntary_context_switches
>      32443 ±  2%     +13.9%      36955 ±  2%  stress-ng.time.minor_page_faults
>      21807           -10.3%      19559        stress-ng.time.percent_of_cpu_this_job_got
>      13087           -10.3%      11737        stress-ng.time.system_time
>      78783 ±  2%    +634.5%     578684        stress-ng.time.voluntary_context_switches
> 
> 
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are provided
> for informational purposes only. Any difference in system hardware or software
> design or configuration may affect actual performance.
> 
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
> 
