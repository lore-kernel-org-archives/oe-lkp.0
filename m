Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACFF1104
	for <oe-lkp@lists.linux.dev>; Mon, 20 Mar 2023 07:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=B9tXBqcBhbdXo5EaDZWDo2ItCKJ0ITyMtl1FbqhFWEM=; b=Ug0wYU0HyjTEV4SGY43v9Tkb0w
	YAKMSQ/Uk6Mwlz01JMlFCoEIMLj2QILHOHxsVMPlmzGuX5kof/FEEQ4+Njh6Pk5hL0nqHCGeET6Cq
	Csr9zXAriK9Jzf45bH9eUuDLHLYw2hgoGjAnhebSQnkr3CfUmQN2hcpusvwrSBjPfXz7MjDpq3yM0
	h3oR1T/fUW5OJh2RI4KPc/x/D9W62Y00du17uQGsdo8khOrX8US/cANVVSdFDaq8282ZXtEW0y2se
	0xwLND+piThOktSIwWKPfrUKtKJFFIeaAzvmiZvs+EU7GdAuEwTj9nqw9jDI37As60amICGxW0dH/
	9/lTjbfw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1peAPs-000p0V-2P; Mon, 20 Mar 2023 07:58:52 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9D2F0300652;
	Mon, 20 Mar 2023 08:58:50 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 74DD92024966D; Mon, 20 Mar 2023 08:58:50 +0100 (CET)
Date: Mon, 20 Mar 2023 08:58:50 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com
Subject: Re: [peterz-queue:sched/eevdf] [sched/fair]  23669fce72:
 aim7.jobs-per-min -18.6% regression
Message-ID: <20230320075850.GA2194297@hirez.programming.kicks-ass.net>
References: <202303201517.399a9b16-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202303201517.399a9b16-oliver.sang@intel.com>

On Mon, Mar 20, 2023 at 03:46:57PM +0800, kernel test robot wrote:
> 
> Greeting,
> 
> FYI, we noticed a -18.6% regression of aim7.jobs-per-min due to commit:
> 
> 

Hi Oliver,

Could you do a full performance run on the current sched/eevdf
04c54aa28eed ("sched/eevdf: Tuning...") branch?

I'm expecting wins and losses (inevitable when you rip up the whole
scheduler), but I'm hoping for nothing too drastic.


