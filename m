Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C59FA93A
	for <oe-lkp@lists.linux.dev>; Thu, 23 Mar 2023 15:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RH6f+Za5MAFB/j1iSqgaUQemsIuuN+gslWjEAwVf7h8=; b=F1s0mYIZYU+2QarQKLRddAQsKd
	bRrJwe+fHd/B65vNmO9JN1qdEjzrdqF2XOO0P1BbpanrjYMXZlkWLjuAemiLca/WnlxcDS6oRYkoU
	zi8HdCbCMJ6/vIV6Sl0FZctdYI82ZoLlq0VRbXvx5YEXGCCOPNIFlczb0oARdpd8Cduh00DbRAh5X
	cJ4unPRFR7xjLBO7gtNWV26PXxQ+BcN4v6QtLBJtm/pqBwt7OHn7GqIJiwJcoZFaNBpyasaHoJbFu
	HdJcMnYjy9bUu69fOmvQ6hafZfivlDzqO/Hqkiux5w0GjhUtZ3axo+IjZpFjw7R+rojKhDptF40m7
	jH1NAcgQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMtL-004tIH-1Q;
	Thu, 23 Mar 2023 15:30:15 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 44DE230030B;
	Thu, 23 Mar 2023 16:30:14 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 232EC2420DEFE; Thu, 23 Mar 2023 16:30:14 +0100 (CET)
Date: Thu, 23 Mar 2023 16:30:13 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Chen Yu <yu.c.chen@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Oliver Sang <oliver.sang@intel.com>,
	Chen Yu <yu.chen.surf@gmail.com>
Subject: Re: [peterz-queue:sched/eevdf] [sched/fair]  23669fce72:
 aim7.jobs-per-min -18.6% regression
Message-ID: <20230323153013.GD2512024@hirez.programming.kicks-ass.net>
References: <202303201517.399a9b16-oliver.sang@intel.com>
 <20230320075850.GA2194297@hirez.programming.kicks-ass.net>
 <ZBlg1Bx4L55oSfyR@xsang-OptiPlex-9020>
 <ZBllA/Qq3ZpAOwz+@chenyu5-mobl1>
 <20230321090318.GB2234901@hirez.programming.kicks-ass.net>
 <ZBxEuboumEifedjG@chenyu5-mobl1>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBxEuboumEifedjG@chenyu5-mobl1>

On Thu, Mar 23, 2023 at 08:23:21PM +0800, Chen Yu wrote:

> We have finished the first cycle of tests on a Ice Lake Server. It is a
> 32C * 2 Sockets system, and 128 CPUs in total.
> The baseline commit is v6.3-rc2, the test commit is on top of sched/eevdf
> commit 04c54aa28eed ("sched/eevdf: Tuning...")
> 
> The raw benchmark test results with perf profiling comparison are uploaded here:
> 
> schbench:
> https://raw.githubusercontent.com/yu-chen-surf/schedtests/master/results/eevdf/benchmarks/schbench-lkp-icl-2sp6.log
> 
> hackbench:
> https://raw.githubusercontent.com/yu-chen-surf/schedtests/master/results/eevdf/benchmarks/hackbench-lkp-icl-2sp5.log
> 
> stress-ng:
> https://raw.githubusercontent.com/yu-chen-surf/schedtests/master/results/eevdf/benchmarks/stress-ng-lkp-icl-2sp6.log
> 
> unixbench:
> https://raw.githubusercontent.com/yu-chen-surf/schedtests/master/results/eevdf/benchmarks/unixbench-lkp-icl-2sp2.log
> 
> netperf:
> https://raw.githubusercontent.com/yu-chen-surf/schedtests/master/results/eevdf/benchmarks/netperf-lkp-icl-2sp5.log

Thanks! that is very useful. Shows where I need to focus.

