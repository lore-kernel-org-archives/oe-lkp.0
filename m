Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60EB29A0
	for <oe-lkp@lists.linux.dev>; Mon, 15 May 2023 08:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RD5vUeFE3A5d4FsldbQHnKJtFa6t2QWFhZv+yAemSbs=; b=ehBz+j3ahy4u5PW4uxa2uyGNJo
	EBFe6Q34nuEaAcRCI+tbeXc7I14zzi5e0u0+qZG7aqXj1MNfOu4KRMISLXOGqwnA5hH2j2eNrTkHu
	uQvvK793POjWSxg49Bbe9Huea69FbJY6OWwQVhEIhB0v3ZFTua6hfvAi2N1O7XtMkMCq+hB7KHr6a
	zLmj5NVEqXqcruefol8Zh/0kdINTJ9d0alQEcO5jwfieZwAbmNJOHWUD/XWacF58y3JIL6BVpFfeF
	KdBkyA4si0Bd8nM250rxBdgOPlkLy7SXTJXCnNvdpv+s8tyg9C137AV50ShsToAwqJmtGHX2cwYVL
	kPUWVCgg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pyTkW-00BQwB-2q;
	Mon, 15 May 2023 08:40:09 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9F4963001E4;
	Mon, 15 May 2023 10:40:07 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 69766202FCE90; Mon, 15 May 2023 10:40:07 +0200 (CEST)
Date: Mon, 15 May 2023 10:40:07 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <yujie.liu@intel.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, ying.huang@intel.com, feng.tang@intel.com,
	fengwei.yin@intel.com, aubrey.li@linux.intel.com,
	yu.c.chen@intel.com, Aaron Lu <aaron.lu@intel.com>
Subject: Re: [linus:master] [sched] af7f588d8f: will-it-scale.per_thread_ops
 -13.9% regression
Message-ID: <20230515084007.GF4253@hirez.programming.kicks-ass.net>
References: <202305151017.27581d75-yujie.liu@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305151017.27581d75-yujie.liu@intel.com>

On Mon, May 15, 2023 at 03:00:44PM +0800, kernel test robot wrote:
> Hello,
> 
> kernel test robot noticed a -13.9% regression of will-it-scale.per_thread_ops on:
> 
> commit: af7f588d8f7355bc4298dd1962d7826358fc95f0 ("sched: Introduce per-memory-map concurrency ID")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> testcase: will-it-scale
> test machine: 224 threads 2 sockets (Sapphire Rapids) with 256G memory
> parameters:
> 
> 	test: context_switch1
> 	cpufreq_governor: performance
> 
> test-description: Will It Scale takes a testcase and runs it from 1 through to n parallel copies to see if the testcase will scale. It builds both a process and threads based test in order to see any differences between the two.
> test-url: https://github.com/antonblanchard/will-it-scale
> 
> In addition to that, the commit also has significant impact on the following tests:
> 
> +------------------+----------------------------------------------------------------------------------------------------+
> | testcase: change | will-it-scale: will-it-scale.per_thread_ops -73.8% regression                                      |
> | test machine     | 224 threads 2 sockets (Sapphire Rapids) with 256G memory                                           |
> | test parameters  | cpufreq_governor=performance                                                                       |
> |                  | mode=thread                                                                                        |
> |                  | nr_task=16                                                                                         |
> |                  | test=context_switch1                                                                               |
> +------------------+----------------------------------------------------------------------------------------------------+
> | testcase: change | will-it-scale: will-it-scale.per_thread_ops -57.9% regression                                      |
> | test machine     | 104 threads 2 sockets (Skylake) with 192G memory                                                   |
> | test parameters  | cpufreq_governor=performance                                                                       |
> |                  | mode=thread                                                                                        |
> |                  | nr_task=16                                                                                         |
> |                  | test=context_switch1                                                                               |
> +------------------+----------------------------------------------------------------------------------------------------+
> | testcase: change | will-it-scale: will-it-scale.per_thread_ops -85.0% regression                                      |
> | test machine     | 104 threads 2 sockets (Skylake) with 192G memory                                                   |
> | test parameters  | cpufreq_governor=performance                                                                       |
> |                  | mode=thread                                                                                        |
> |                  | nr_task=50%                                                                                        |
> |                  | test=context_switch1                                                                               |
> +------------------+----------------------------------------------------------------------------------------------------+
> | testcase: change | vm-scalability: vm-scalability.throughput -9.0% regression                                         |
> | test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Platinum 8260L CPU @ 2.40GHz (Cascade Lake) with 128G memory |
> | test parameters  | cpufreq_governor=performance                                                                       |
> |                  | runtime=300s                                                                                       |
> |                  | size=2T                                                                                            |
> |                  | test=shm-xread-seq-mt                                                                              |
> +------------------+----------------------------------------------------------------------------------------------------+
> 
> FYI, we noticed that commit 223baf9d17f2 (sched: Fix performance
> regression introduced by mm_cid) fixed a sysbench regression, but
> will-it-scale context_switch1 benchmark still saw a regression on this
> fix commit.
> 
> Furthermore, we applied the code diff in below link [1] on mainline, and
> the will-it-scale score was restored to the original level before this
> patch.
> 
> [1] https://lore.kernel.org/lkml/d96164a6-c522-1bfc-8b37-333726cdc573@efficios.com/
> 

Right; so I'm thinking we can do that patch -- I'll try and get the
whole lazy TLB thing sorted, but I'm not sure I can find the piece and
quiet to think that over in a hurry :/
