Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F812DE1E0;
	Thu, 18 Dec 2025 08:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766047080; cv=none; b=UOU9HX9Dx75FxSGNxE5jltaTHJhmayq1n80xFrIBZbDPeQ8HvGwRHs44ToLxYs4fPbUHv2ghJTNRi8S6sVlrImG7znUjQCQ2DwUTgp1LuS5FqrZF6u1G25JnanS3/xC6Ogu/aIVIvwgaOcOTE5CxDsn7X1QQi8PUjTo7iuWcAu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766047080; c=relaxed/simple;
	bh=rh8PWS0E7aCPT8tJTFMWacmKh2rqLQDJXgBTjFpcOdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iji80ZYRlwtcHBfrkzuKdto6UGNYRcwzwom90PG5vdw9Do6pQ9zefK9x5AcGnKfukSMz6b5rgM3f/OTxn8vnbAn5eGesH88S7AXs6O8nnwPS2ZkRjq8MmaFQ2SFKg0tZ85ZBFMYkOjgx3YV2K2FkZrAxkR8e8D38+yZdmwbaDTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ap05JouA; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ap05JouA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3v+/R3BZC85BpKmnz/cZbIRePHuqkDCXJF+8IJeEGDo=; b=ap05JouASjMEFgi8cjDLg60NOk
	/3LlZLf/I+qpBct6KLIj6fIyJi0Ix5BISEmyBGZXNvphh0begjRRjnK5UzxYYW6NSczXl60w4ocYE
	4nTskjSreHiOxVK8Y5g8PUWiLqpq4vNiXiZm4oD9sLksroR34saNdS296/OOLW5D7VtPvlrLZ5NMa
	gNCPqg1Au+CLxDlBvk5lyyqsNyQsBTRDxtZ/mXzTEIQKVNAeptAo3dpHwmHzc3UkuIsadiY3iKzTL
	ypMfSNtC+j69+HnHC7NVd1/cc2DN5uyXFTKhwXvCUxcFG0P3sIMrVlUhez60rCUsKU6KSBMjSrlbc
	6L5xak8A==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8ef-00000008MhM-3YrH;
	Thu, 18 Dec 2025 07:42:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 02AFF30056B; Thu, 18 Dec 2025 09:37:48 +0100 (CET)
Date: Thu, 18 Dec 2025 09:37:47 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Juri Lelli <juri.lelli@redhat.com>, Mel Gorman <mgorman@suse.de>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	aubrey.li@linux.intel.com, yu.c.chen@intel.com
Subject: Re: [tip:sched/core] [sched/fair]  089d84203a:
 pts.schbench.32.usec,_99.9th_latency_percentile 52.4% regression
Message-ID: <20251218083747.GI3707891@noisy.programming.kicks-ass.net>
References: <202512181208.753b9f6e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512181208.753b9f6e-lkp@intel.com>

On Thu, Dec 18, 2025 at 12:59:53PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a 52.4% regression of pts.schbench.32.usec,_99.9th_latency_percentile on:
> 
> 
> commit: 089d84203ad42bc8fd6dbf41683e162ac6e848cd ("sched/fair: Fold the sched_avg update")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core

Well, that obviously wasn't the intention. Let me pull that patch :/
