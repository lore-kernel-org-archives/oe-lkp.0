Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43E879C7
	for <oe-lkp@lists.linux.dev>; Tue, 21 Mar 2023 09:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=l6jH6R+BmezkP8sD3J8D+2L3hmFFr6TKYYsXhk5gKSM=; b=YSAZW9npvS0F3ff64oN+oMErMZ
	3fT2k8CiT80BVdCx8BI4wm7d6vIlszejsOD7pKhPKaWrwq1HV8OTXV4Mwh30LMb5AjTkbiu5ptfei
	lbQcLNCJba6FiZ7O4jbo0zMRuqGVank6qiMOwLlHQWY28B9Xv3RLaq3XFCwyiqJTXHzKAQBKMcmml
	ICK2YKwH4Eem+mVAMQ1qCpKOLCq/D+TVTBYh0/SWMlNj8FdAQkZl5INXLbabE9hAEkcHaDuwh55xV
	KWIKgebDVEmTTN0X938HcUosym3RJetvjJf0d7CbhqQPn7aV6Kjujtq0bENrdNX8GdV3BcU1jTRkC
	JzfHq4zg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1peXto-001tKA-V9; Tue, 21 Mar 2023 09:03:21 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 23DE330006D;
	Tue, 21 Mar 2023 10:03:19 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0E5A1205414ED; Tue, 21 Mar 2023 10:03:19 +0100 (CET)
Date: Tue, 21 Mar 2023 10:03:18 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Chen Yu <yu.c.chen@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Oliver Sang <oliver.sang@intel.com>
Subject: Re: [peterz-queue:sched/eevdf] [sched/fair]  23669fce72:
 aim7.jobs-per-min -18.6% regression
Message-ID: <20230321090318.GB2234901@hirez.programming.kicks-ass.net>
References: <202303201517.399a9b16-oliver.sang@intel.com>
 <20230320075850.GA2194297@hirez.programming.kicks-ass.net>
 <ZBlg1Bx4L55oSfyR@xsang-OptiPlex-9020>
 <ZBllA/Qq3ZpAOwz+@chenyu5-mobl1>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBllA/Qq3ZpAOwz+@chenyu5-mobl1>

On Tue, Mar 21, 2023 at 04:04:19PM +0800, Chen Yu wrote:
> On 2023-03-21 at 15:46:28 +0800, Oliver Sang wrote:
> > Hi Peter Zijlstra,
> > 
> > On Mon, Mar 20, 2023 at 08:58:50AM +0100, Peter Zijlstra wrote:
> > > On Mon, Mar 20, 2023 at 03:46:57PM +0800, kernel test robot wrote:
> > > > 
> > > > Greeting,
> > > > 
> > > > FYI, we noticed a -18.6% regression of aim7.jobs-per-min due to commit:
> > > > 
> > > > 
> > > 
> > > Hi Oliver,
> > > 
> > > Could you do a full performance run on the current sched/eevdf
> > > 04c54aa28eed ("sched/eevdf: Tuning...") branch?
> > 
> > got it.
> > 
> > we will test netperf/stress-ng/schbench/hackbench/tbench
> >
> Every test we will launch
> 25%, 50%, 75%, 100%, 125%, 150%, 175%, 200% of instances per the number
> of CPUs.
> Both the latency and througput will be monitored.

Excellent!

> However currently we do not enable the latency nice for these tests. Later
> we can enabled this once above tests finish.

Yeah, just the normal numbers, thanks! No point looking at shiny new
features when the base is all messed up ;-)

