Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E023C0F
	for <oe-lkp@lists.linux.dev>; Mon, 27 Mar 2023 15:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wwHPYvhmvL+SAWDAi/sOdZhtDWXIGSEk/iUeq3axJpo=; b=dwuwHIj5w3RdtZQHr2nwgoVIzR
	NWgrcYubV38Nxo/MZujvK4y9zOaKryPlrYG8/E9YRCAA1Na9/KjDIpuX/wflYVppsI9ZWgxCazROy
	yT/FycKSd7Wwk/bDrInhGX6qvpti/HwoJCRjBrq3AtXQpnvKOiLJFsqMKi37AOF5OZBbpxwpUs3Lo
	hcANiIWTMyySb+66IJ7PkHWLGZZ9hCToiB9mXMJkuaXsLVuCJGa9CAPQhGfbHCmGLPy79nQ7yRWIP
	Ko7wf9IH3w//fjeq9Ae2W7vhcvQxCs75E8OwmOu/vQhzn5/+PtG0H8/5BWCKsxqN4aQXYqLblGhjD
	zY09cErQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pgonW-007WAj-P6; Mon, 27 Mar 2023 15:30:14 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 73066300237;
	Mon, 27 Mar 2023 17:30:13 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 59C552065CD3C; Mon, 27 Mar 2023 17:30:13 +0200 (CEST)
Date: Mon, 27 Mar 2023 17:30:13 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Chen Yu <yu.c.chen@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Oliver Sang <oliver.sang@intel.com>,
	Chen Yu <yu.chen.surf@gmail.com>, Ingo Molnar <mingo@kernel.org>
Subject: Re: [peterz-queue:sched/eevdf] [sched/fair]  23669fce72:
 aim7.jobs-per-min -18.6% regression
Message-ID: <20230327153013.GD11425@hirez.programming.kicks-ass.net>
References: <202303201517.399a9b16-oliver.sang@intel.com>
 <20230320075850.GA2194297@hirez.programming.kicks-ass.net>
 <ZBlg1Bx4L55oSfyR@xsang-OptiPlex-9020>
 <ZBllA/Qq3ZpAOwz+@chenyu5-mobl1>
 <20230321090318.GB2234901@hirez.programming.kicks-ass.net>
 <ZBxEuboumEifedjG@chenyu5-mobl1>
 <20230326110024.GA2990748@hirez.programming.kicks-ass.net>
 <ZCGfZdrM0XIZjx18@chenyu5-mobl1>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCGfZdrM0XIZjx18@chenyu5-mobl1>

On Mon, Mar 27, 2023 at 09:51:33PM +0800, Chen Yu wrote:
> On 2023-03-26 at 13:00:24 +0200, Peter Zijlstra wrote:

> > That is, the parent is always running, while the child is blocking.
> > Consider the parent 100% running and the child 50%, then a truely fair
> > scheduler will make it 67% vs 33% runtime -- this is what EEVDF does
> > now. And as you can see, since the child gets less runtime, the counter
> > increases less and the benchmark drops.
> >
> Does the 67% vs 33% comes from the lag placement but not from
> the deadline pick policy?  Because the 'lag' remains consistent during
> task migration across several CPUs. So no matter how long the task sleeps,
> it only gets the time slice it deserved to run after migation and gets no
> sleep bonus?

Yeah, the 67%/33% thing is not due to the deadlines, it really is just
the virtual time thing -- we could make CFS do that too. 

But the bonus placement does wreck the deadline part :/

Much of these patches is more than 10 years old, back then I didn't
think I'd get away with the added 64bit math and the augmented rb tree
(we still cared about 32bit performance and all that). Perhaps I should
have spend more time finishing it back then, alas..

> > CFS has sleeper bonus, which gives (short) blocking tasks a small
> > advantage to make it 50% vs 50%. And if you compute the drop from 50% to
> > 33% then you get -33% and that's exactly the drop you see around the
> > 100% case.
> It seems that EEVDF is actually the real 'CFS' : )

Yeah, the 'completely' part of the name never made much sense to me, but
alas. Note that even EEVDF is known deficient in a number of cases,
particularly SMP, our load-balancer leaves a number of things to be
desired.

It's all a cost/performance tradeoff I suppose.


