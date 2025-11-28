Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B0820322;
	Fri, 28 Nov 2025 09:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764322481; cv=none; b=smepGoYfJoTg8JE11NBefBCDaYfawfeKVqkOqvSHuBlm0mRVyr2fx3P0G5rmm0LUDn7hz0oWKl2Ro5XUhhTEKa7jXIkOSO9OMyIJe/NjgCdFXdofHfu4aBCQCSSxT2Ec6HTUSoH6iNEzFLDUcAIus9rvHc+llm/dVpxwDVcJukk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764322481; c=relaxed/simple;
	bh=sAYXn5HwCtED/zCt46Rhx9dHHmYGpsPlTQbkW//Pwto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNYv85u4v1HFvzR9E7K4+JnOGAzHUnayCFFl2KbMYEvy32vtng1PS4Vhdd8QfA5m2dA5o9UzXd1niHB51G/DhQAEDvgIDF7jR3LTbe2vuIwbPeUsTsZY30TQZp7bJvPIHWDrRzGeGMXnu/lTgAkL6ghXpzXG1A4QS8oOPBaH4rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YjVEpoBl; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YjVEpoBl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Jr+07b0abE2YtvgNMr+5fwS5rMXxtHiKONye0iLaCR8=; b=YjVEpoBlIScvKMWiObSMXB/jC0
	Xj6v1ar69o1ZLkAAaaN/5s/qInXn5Xij9L++5egvt3UHp0NOTqIxkrvnPSJdX7oEt/4OeZ4XvVX2x
	JBZkeg815SRNAWOnS/NYNQfdxtNeRPFDukdsAS3uWuUr9c/pjrcR+11YNx/tDK+3AwSqY5q9kp6rl
	I4BoV5/IzLaZo8QVbnnbxFroKmvGk6HJLB2U9kR6tfRwuayCgqkuQU2EHysYQzG/d/4NxbQBnXzSO
	Vh0h529AF0YvIi64RybtJql0hxpb+P/vYzNYf9QdNyG1pJIiiAh1SUXq4W8v3uj0MiDc8SdJZtJS9
	+w4s+MGA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOus4-0000000D0jb-0BFw;
	Fri, 28 Nov 2025 09:34:32 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 81FE7300230; Fri, 28 Nov 2025 10:34:30 +0100 (CET)
Date: Fri, 28 Nov 2025 10:34:30 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Oliver Sang <oliver.sang@intel.com>
Cc: Ingo Molnar <mingo@kernel.org>, Tim Chen <tim.c.chen@linux.intel.com>,
	oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	x86@kernel.org, Chen Yu <yu.c.chen@intel.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Srikar Dronamraju <srikar@linux.ibm.com>,
	Mohini Narkhede <mohini.narkhede@intel.com>,
	aubrey.li@linux.intel.com
Subject: Re: [tip:tmp.tmp] [sched/fair]  eb2db043ab:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <20251128093430.GE3245006@noisy.programming.kicks-ass.net>
References: <202511271605.bd46ddc3-lkp@intel.com>
 <20251127083815.GZ3245006@noisy.programming.kicks-ass.net>
 <aSgU0IDhF4uam0JA@gmail.com>
 <aSj97AJbXnJvvyqK@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSj97AJbXnJvvyqK@xsang-OptiPlex-9020>

On Fri, Nov 28, 2025 at 09:42:04AM +0800, Oliver Sang wrote:
> hi,
> 
> On Thu, Nov 27, 2025 at 10:07:28AM +0100, Ingo Molnar wrote:
> > 
> > * Peter Zijlstra <peterz@infradead.org> wrote:
> > 
> > > On Thu, Nov 27, 2025 at 04:35:37PM +0800, kernel test robot wrote:
> > > > 
> > > > 
> > > > Hello,
> > > > 
> > > > kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:
> > > > 
> > > > commit: eb2db043ab3a28ae76800f2a57e144420800d56d ("sched/fair: Skip sched_balance_running cmpxchg when balance is not due")
> > > > https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git tmp.tmp
> > > 
> > > Not sure what this branch is, but tip/sched/core has the fixed commit.
> > 
> > Not sure how the test-bot picked up this temporary 
> > branch and reported it despite it being gone from the 
> > repo, but the branch hasn't been in -tip for days.
> > 
> > This report can be safely ignored.
> 
> sorry for the noise. yeah, our so-called 'gitmirror' mechnism fetched the
> tmp.tmp branch about 10 days ago, then it merged into our hourly kernel to
> be running tests. so it's kind of 'stored' in our repo.
> 
> since the bad commit caused crash issue on various test machines, we made out
> the report, but missed the check of whether branch is still existing remotely.
> 
> we will refine our code/process to avoid this kind of meaningless report.

Might it make sense to exclude all branches named tmp ? IIRC there are
some patterns that the robot skips over, but I forever forget what they
are :/
