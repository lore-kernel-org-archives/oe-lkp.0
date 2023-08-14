Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535E6A923
	for <oe-lkp@lists.linux.dev>; Mon, 14 Aug 2023 12:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nSu5pZF90pcdhTItj4iKD/oA2dZDTfI4QLO16UzUIZs=; b=eIUlbBMESs05G7H3pZKwv3cv94
	EiHP+k5HnjKtPSsRSAazLweh0fDPTRHxLRrycEAZzgoXBrDuFPQkfjAhaeybKu+7ccKhhZXvt8/KY
	VGaxaghnE3KqFtJPvsWIG0Hl5at2sEQkoqNsGxqsnrwdxnRFa/B5dhGKiBFZEDlFjYV08PXv2HaF9
	W/KEpYYv80PJChRhhS7ZEIvtOJcbwdhsnyp4Uu3HFARJrR0j7SJ6hCVl74/ZdiYVJeTpqt1sr5t/E
	r8I7fYzRZlWGHRPujO7P4hz11vzkcBPT9Asq6yYfL7LmOKViJ4mc+aDpAY6rUJeSrAU4xgHNKkanQ
	H/KKcpHg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qVX0U-00Aaoq-31;
	Mon, 14 Aug 2023 12:49:15 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8AA51300137;
	Mon, 14 Aug 2023 14:49:14 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 46491202BDC7A; Mon, 14 Aug 2023 14:49:14 +0200 (CEST)
Date: Mon, 14 Aug 2023 14:49:14 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Chen Yu <yu.c.chen@intel.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: Re: [tip:sched/eevdf] [sched/fair]  e0c2ff903c:
 phoronix-test-suite.blogbench.Write.final_score -34.8% regression
Message-ID: <20230814124914.GJ776869@hirez.programming.kicks-ass.net>
References: <202308101628.7af4631a-oliver.sang@intel.com>
 <ZNWKuccyWnS3UJjK@chenyu5-mobl2.bbrouter>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNWKuccyWnS3UJjK@chenyu5-mobl2.bbrouter>

On Fri, Aug 11, 2023 at 09:11:21AM +0800, Chen Yu wrote:
> On 2023-08-10 at 21:24:37 +0800, kernel test robot wrote:
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed a -34.8% regression of phoronix-test-suite.blogbench.Write.final_score on:
> > 
> > 
> > commit: e0c2ff903c320d3fd3c2c604dc401b3b7c0a1d13 ("sched/fair: Remove sched_feat(START_DEBIT)")
> > https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/eevdf
> > 
> > testcase: phoronix-test-suite
> > test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory
> > parameters:
> > 
> > 	test: blogbench-1.1.0
> > 	option_a: Write
> > 	cpufreq_governor: performance
> > 

Is this benchmark fork() heavy?

> It seems that commit e0c2ff903c32 removed the sched_feat(START_DEBIT) for initial
> task, but also increases the vruntime for non-initial task:
> Before the e0c2ff903c32, the vruntime for a enqueued task is:
> cfs_rq->min_vruntime
> After the e0c2ff903c32, the vruntime for a enqueued task is:
> avg_vruntime(cfs_rq) = \Sum v_i * w_i / W
>                      = \Sum v_i / nr_tasks
> which is usually higher than cfs_rq->min_vruntime, and we give less sleep bonus to
> the wakee, which could bring more or less impact to different workloads.
> But since later we switched to lag based placement, this new vruntime will minus
> lag, which could mitigate this problem. 

Right.. but given this problem was bisected through the lag based
placement to this commit, I wondered about fork() / pthread_create().

If this is indeed fork()/pthread_create() heavy, could you please see if
disabling PLACE_DEADLINE_INITIAL helps?
