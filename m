Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792774828;
	b=4dJYNMDynLCmUKSZJnBh/YEwMYmb/oIBQT/HLG91/GHRBdklqHVqZxd/jYrNZ6UoXLxM
	 cH0OYxD+4nOOBsTssWjIcSwnQuw1nE6JC50NG6h8Hq0Z193zv8OuYQi5jyarKoMZj1XgX
	 LKzT3XiCtGDCQsV9CQj5ASi5YMquhFEX6/Ci0n62DiWP1IJHKl8a9FBM1mmTrr+7kAw4Q
	 PlORsI4ji9l+GZ5LJTETMAJ8FdDMmVrtcSpLvbaseayB5fnzvdiYCsmx5qLoqKkdsQp7O
	 2PXXOQ5Z/zT+tB4UA+k8b34L7G+ykyq2ouZQC0eVGQ/RcTn/etNI20DzwjYP4RWVSwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792774828;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=MxGAKl4YWl46xL25FR4xKOwku7Y7gIDUUXB+yQ+kYZw=;
	b=yIjBA9vCVl/nqUXmrED7DGVIaa8FEwWox6CXTZF8o9vL/W8pID0KFiUxirC9d/v4ZwvR
	 +G+Lt9cHFYKW7ivMb8ZKzvR85qvsJGlLSQcL5/T+CueOde2HGtWafT/vJ2NwYNTzienDF
	 oFfdT1/vQcfeD+27YqlqgU135/lSDMRKIg+/stKTHXGs9iK5c4kMWr5QyD5vujEoQG5KR
	 2C++56oeldmDWiFyuKRf12fgQhGjoHJnTwnpP9MdCVDdN94bn7K+0QdxPrx4L+OnLijp3
	 bMsx4Fv/TY/R3iQtJXAPdrUwO0ks6+bZpmav4EJMKpPLowlFpclCGHV5l12q4JOpZNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=EL7YOdUM;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228FE606A31A;
	Fri, 23 Oct 2026 17:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 228FE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=EL7YOdUM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MxGAKl4YWl46xL25FR4xKOwku7Y7gIDUUXB+yQ+kYZw=; b=EL7YOdUMOXYtIBg2eByM6rjYkV
	se888A7Ga27uuAogvpp9hIo5ulVbMLFbH8e2FVsGSQ8aAjFXiSzSxT9SenolkXDJIjaHq1vtbmh39
	gAEasLrBRktsYrhfWQcyleh1CbK7CPldISxoi/UlhDoY+HJLXVKUAekNkVjtHJqKeqHPju0a2ZuU0
	wxaZ4GDt4goQO94hIeXwf68yFj0kseLolSc3aaPJ8p3oWuI2X1pVT2hyBGeR0vKtOo+ctPjY+vNpC
	BuESfV3Khs1kib+QO/1AdxOHYeVk5dSGzcVL9h7eeY0sKMmngtLX+fOrpHrJcRSqzL50K3hRqzjvz
	FaXgWiCA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKIcy-0000000A836-1upq;
	Fri, 23 Oct 2026 17:00:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id AD2E2300720; Fri, 23 Oct 2026 19:00:23 +0200 (CEST)
Date: Fri, 23 Oct 2026 19:00:23 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: kernel test robot <yi1.lai@intel.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Phil Auld <pauld@redhat.com>, aubrey.li@linux.intel.com,
	yu.c.chen@intel.com
Subject: Re: [linus:master] [sched/core]  118a2cf4ce:
 stress-ng.schedpolicy.ops_per_sec 14.1% regression
Message-ID: <20261023170023.GY2823843@noisy.programming.kicks-ass.net>
References: <202610231954.51716452-lkp@intel.com>
 <b39cd288-9133-40e1-b27d-d8ef3973b37c@paulmck-laptop>
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b39cd288-9133-40e1-b27d-d8ef3973b37c@paulmck-laptop>

On Fri, Oct 23, 2026 at 09:14:02AM -0700, Paul E. McKenney wrote:
> On Fri, Oct 23, 2026 at 07:49:20PM +0800, kernel test robot wrote:
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed a 14.1% regression of stress-ng.schedpolicy.ops_per_sec on:
> > 
> > 
> > commit: 118a2cf4ced60777a2408001e2b4838fed1cea55 ("sched/core: Call wakeup_preempt() for queued tasks during class change") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > 
> > testcase: stress-ng
> > config: x86_64-rhel-9.4
> > compiler: gcc-14
> > test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
> > parameters:
> > 
> > 	nr_threads: 100%
> > 	testtime: 60s
> > 	test: schedpolicy
> > 	cpufreq_governor: performance
> > 
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <yi1.lai@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202610231954.51716452-lkp@intel.com
> 
> This regression is not a good thing, but this commit is fixing a real bug.

I think I have a patch somewhere stuck in my review queue for -rc1 that
might help with this:

  https://patch.msgid.link/CANGjgdmNCfm%3DSctvKZ44y8b5n8t_JSp4meX%3DDKGnG74B3g1vVw%40mail.gmail.com

If not, too bad, correctness first and all that.
