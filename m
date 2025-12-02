Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1C51DFDB8;
	Tue,  2 Dec 2025 05:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764652303; cv=none; b=FNtEtk+K13qqyxjsRxPKaPIDmFUZFThximd6W5mgGrkNO/rF0dPy0prO+Ymh2yfoKoL+KKfeE15v+rS131wpZ05L4DPV4qwHO6SGezvV0IQGoEO0I2u6vR/Zo+2Q22D6v9W1INmR5fhEVzZukeTk/CWK2Y4WSJPGaRFg6uLL7dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764652303; c=relaxed/simple;
	bh=zqaWnRKC+JwkrYyDhhOjoaq+yR9grn0NyAeZDuOhvZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XcDkngnUnQgX0fqP6OjeO0ogXwQ07kiKCMm5eeEbOmX5iErI3Q8YJcPVt0QouplA5QOOEUbxdUB9Ts1FpwXK1hU4fUQRBEONwbsI5lL5AlSaoqK1rrQn7nOH3IkkBeRVWai6WemlX51TzSyBtKWUt9qbV/VrdjbTehlKVJxF2V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dk+lw6Br; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dk+lw6Br"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F421C4CEF1;
	Tue,  2 Dec 2025 05:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764652302;
	bh=zqaWnRKC+JwkrYyDhhOjoaq+yR9grn0NyAeZDuOhvZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dk+lw6BrD5kXA29C72fi3S9+jY1MyN4vNjBG5+50kf4I8IROM9ZSZBAbhq+PgU5ui
	 tAp56IG+zhJLq9YpW8fcPVpSB27qnrPLF+pdl5ZBH8AyIJbTj8t4jHJ7fUtUb0+bwp
	 8AZyC/ClpTrKhjMP6OXm8f3CJiXjxUpFoPDFwrCsPy1Q+17G7jAoI47UpdXKyyoaJv
	 sKFY1ejKtoiPeyqaMiz7Sm5jd5f0KVmhARLC63o2ZBVpGtymxPw+JBkofXXkYflIQP
	 4DCoONKGZDvnuY7ka8FZ/wnScEihjSIfPfHgutXK4VrVThiigB05QnDB//L+A9Mb5L
	 rf1KcoslhxaNQ==
Date: Tue, 2 Dec 2025 06:11:36 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Oliver Sang <oliver.sang@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org,
	Chen Yu <yu.c.chen@intel.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Srikar Dronamraju <srikar@linux.ibm.com>,
	Mohini Narkhede <mohini.narkhede@intel.com>,
	aubrey.li@linux.intel.com
Subject: Re: [tip:tmp.tmp] [sched/fair]  eb2db043ab:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <aS51CHrrzE3_7vM9@gmail.com>
References: <202511271605.bd46ddc3-lkp@intel.com>
 <20251127083815.GZ3245006@noisy.programming.kicks-ass.net>
 <aSgU0IDhF4uam0JA@gmail.com>
 <aSj97AJbXnJvvyqK@xsang-OptiPlex-9020>
 <20251128093430.GE3245006@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128093430.GE3245006@noisy.programming.kicks-ass.net>


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Fri, Nov 28, 2025 at 09:42:04AM +0800, Oliver Sang wrote:
> > hi,
> > 
> > On Thu, Nov 27, 2025 at 10:07:28AM +0100, Ingo Molnar wrote:
> > > 
> > > * Peter Zijlstra <peterz@infradead.org> wrote:
> > > 
> > > > On Thu, Nov 27, 2025 at 04:35:37PM +0800, kernel test robot wrote:
> > > > > 
> > > > > 
> > > > > Hello,
> > > > > 
> > > > > kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:
> > > > > 
> > > > > commit: eb2db043ab3a28ae76800f2a57e144420800d56d ("sched/fair: Skip sched_balance_running cmpxchg when balance is not due")
> > > > > https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git tmp.tmp
> > > > 
> > > > Not sure what this branch is, but tip/sched/core has the fixed commit.
> > > 
> > > Not sure how the test-bot picked up this temporary 
> > > branch and reported it despite it being gone from the 
> > > repo, but the branch hasn't been in -tip for days.
> > > 
> > > This report can be safely ignored.
> > 
> > sorry for the noise. yeah, our so-called 'gitmirror' mechnism fetched the
> > tmp.tmp branch about 10 days ago, then it merged into our hourly kernel to
> > be running tests. so it's kind of 'stored' in our repo.
> > 
> > since the bad commit caused crash issue on various test machines, we made out
> > the report, but missed the check of whether branch is still existing remotely.
> > 
> > we will refine our code/process to avoid this kind of meaningless report.
> 
> Might it make sense to exclude all branches named tmp ?

So the tmpfs project might disagree. ;-)

But a '^tmp\.' prefix exclusion pattern should be 
pretty robust IMO.

> [...] IIRC there are some patterns that the robot 
> skips over, but I forever forget what they are :/

I'm curious about those patterns, although 99% of the 
time I'm *happy* when the LKP robot finds a new 
development branch that I pushed out, quite often it 
will find bugs that my own testing doesn't catch, and 
the reports are useful & relevant these days. Beyond 
the bugreports the 'SUCCESS' reports are useful as 
well, as they can be used to phase the flow of 
development commits. So no complaints from me.

This tmp.tmp case was an exception to the rule really, 
and given the overwhelmingly positive net utility of 
the LKP test-bot I'd just ignore it, especially since 
the LKP bot was technically correct and the crashes 
were real (albeit fixed already).

Thanks,

	Ingo
