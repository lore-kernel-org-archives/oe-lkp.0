Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792781478;
	b=HTQCn3L1xtfP6ltvSbbLzftgJ/Z1am9odtxaUs4wNODFYMvdKNNWYB1ld965u9GdELj4
	 zKy9x7RK6EcCe0lI5ZiUmCTSISB5LoTgEn1tZpG6ixWrPBGaXHI6MRHWcJKl4TiWbkW++
	 B0ZFdU0HCfEyj2Zk0pmm9D+Br6kfXz1h2/lv474R6jIZYWcVNh/Uzam2sYlMoUhDqdcL8
	 nLjpnhh55ekJcJFCA4sWK/QbMlSA+0r8pNTR171+zA25ZE8DQ5gptBDTf9ZTTiMXwjoVY
	 1fFsjso6toOMFipb4qRjcttPW/Do6OyDyUUCcD1aSFb3GIQ+uMHKSydbNCceMAzvUVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792781478;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=tDQnh6HjvNd/hn+Ld4QJ1nFpLpcYE/NagVckHwJL7zA=;
	b=vJd7LQw5oq7UsdbRNpqlxqrJXs3vuqRNnJWzCbp29norbMFiF76M4b5CNZ9YxuYXgWly
	 SHdougiQP3r1WugUpEky23B/lDn+2X5vIK6o2MrUSeZ/l7ouebEsQL+Y+LKqrIzhZdCXt
	 IIcnofX3/2VP9da2HeRSyTp19BrrX4NHca+u0BtuDMuQfFoPJG1aXnAcCVxj8BB2KlXqe
	 1p+R4ZknlFCwTOraDl9oQo2Oo88mZqUQVpUzaR0Cpk0Gg/upJ9izRWwBXJ0dQkEDtZ1qm
	 uSvglQ4p1ux1bApf8OOxqgjND1ykFlbZM+xwziDlBH1zK9UVAO9Qxuj1SQr1yUBfy2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJACqyd4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A3F606A31A;
	Fri, 23 Oct 2026 18:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJACqyd4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3551F01828;
	Fri, 23 Oct 2026 18:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792781478;
	bh=tDQnh6HjvNd/hn+Ld4QJ1nFpLpcYE/NagVckHwJL7zA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=eJACqyd4AzHJ2Gg1smYF87Ur6jXUJ7V3YCL0XFu5YOA2oaOJONwZA546aky11q0X8
	 635uA7Siw7m7dpu9N6elk5aa26cEO/KDUrw7EliiydnvRT+EFz6aW8y9452HFdb3ph
	 K4+x+nC3A3CwrCcKP+gnbadQtZ6gF0+ynFtf22hKS3et+4CN9iAgrxugEWaSWiLtc6
	 F9bghKXFN31MtNPtZ+2zzrzBlsYEmqRkslJ3GLEUhqSZagLlXzS/arRkoMWb+LsQ1A
	 JIN2BfD2m5NjcdnjBzJ1AtCgmo7i3Q1ESHFJE4jHPENRWgcOT2HeWmqv/az4Xl8FI+
	 Qf5d2n1RsHVgQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id C14A5CE0540; Fri, 23 Oct 2026 11:51:17 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:51:17 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <yi1.lai@intel.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Phil Auld <pauld@redhat.com>, aubrey.li@linux.intel.com,
	yu.c.chen@intel.com
Subject: Re: [linus:master] [sched/core]  118a2cf4ce:
 stress-ng.schedpolicy.ops_per_sec 14.1% regression
Message-ID: <bc1c06ff-e8f2-44bc-b242-73a602540406@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202610231954.51716452-lkp@intel.com>
 <b39cd288-9133-40e1-b27d-d8ef3973b37c@paulmck-laptop>
 <20261023170023.GY2823843@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261023170023.GY2823843@noisy.programming.kicks-ass.net>

On Fri, Oct 23, 2026 at 07:00:23PM +0200, Peter Zijlstra wrote:
> On Fri, Oct 23, 2026 at 09:14:02AM -0700, Paul E. McKenney wrote:
> > On Fri, Oct 23, 2026 at 07:49:20PM +0800, kernel test robot wrote:
> > > 
> > > 
> > > Hello,
> > > 
> > > kernel test robot noticed a 14.1% regression of stress-ng.schedpolicy.ops_per_sec on:
> > > 
> > > 
> > > commit: 118a2cf4ced60777a2408001e2b4838fed1cea55 ("sched/core: Call wakeup_preempt() for queued tasks during class change") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > > 
> > > testcase: stress-ng
> > > config: x86_64-rhel-9.4
> > > compiler: gcc-14
> > > test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
> > > parameters:
> > > 
> > > 	nr_threads: 100%
> > > 	testtime: 60s
> > > 	test: schedpolicy
> > > 	cpufreq_governor: performance
> > > 
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <yi1.lai@intel.com>
> > > | Closes: https://lore.kernel.org/oe-lkp/202610231954.51716452-lkp@intel.com
> > 
> > This regression is not a good thing, but this commit is fixing a real bug.
> 
> I think I have a patch somewhere stuck in my review queue for -rc1 that
> might help with this:
> 
>   https://patch.msgid.link/CANGjgdmNCfm%3DSctvKZ44y8b5n8t_JSp4meX%3DDKGnG74B3g1vVw%40mail.gmail.com

Here is hoping!

> If not, too bad, correctness first and all that.

Hear, hear!  ;-)

							Thanx, Paul
