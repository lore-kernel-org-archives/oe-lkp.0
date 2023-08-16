Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6471CD53B
	for <oe-lkp@lists.linux.dev>; Wed, 16 Aug 2023 09:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=52OUPFqOh3y1o3XJS8UWl+mBu8nIpC1XrgJkA0+bGf8=; b=WnF+CinMKjZPkOLqKsaxtu8l4d
	VkKvFEUgxxltxDk96IlHb9fCzZt1B5wKGXuFmYvMj5SEOb8QM+I3ROcVX+uMZMnJVxzXZKTxlpzvQ
	voGupV3DrjfqCd+DmJoWAT5t+sxlP1ZRIzrO/PqYh7oXsm4i0IZM2pI141MqXIqTsMyOMLL/J11Yl
	MkOfvjBcxBYzbox3JJPAgsLQXj0nWFEUJuZPjTykq/9groUeH7bbopOMeqTe1JK9WobJdm/Thw/Fi
	sgw+n0A7Q7Y3/fACuH/Dp3rnjB8iUzuCu+qxY43KWbn957bp/m5XZacTJpCmOq6c4EGpEJLZma9fA
	y3ySKaLw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qWChd-00DnHN-OB; Wed, 16 Aug 2023 09:20:33 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 59C1D300222;
	Wed, 16 Aug 2023 11:20:33 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 423A32C8D7753; Wed, 16 Aug 2023 11:20:33 +0200 (CEST)
Date: Wed, 16 Aug 2023 11:20:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Chen Yu <yu.c.chen@intel.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Mike Galbraith <umgwanakikbuti@gmail.com>
Subject: Re: [tip:sched/eevdf] [sched/fair]  e0c2ff903c:
 phoronix-test-suite.blogbench.Write.final_score -34.8% regression
Message-ID: <20230816092033.GB980931@hirez.programming.kicks-ass.net>
References: <202308101628.7af4631a-oliver.sang@intel.com>
 <ZNWKuccyWnS3UJjK@chenyu5-mobl2.bbrouter>
 <ZNWgAeN/EVS/vOLi@chenyu5-mobl2.bbrouter>
 <20230814132935.GK776869@hirez.programming.kicks-ass.net>
 <ZNxFMYZNoyZSdUbd@chenyu5-mobl2>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNxFMYZNoyZSdUbd@chenyu5-mobl2>

On Wed, Aug 16, 2023 at 11:40:33AM +0800, Chen Yu wrote:

> > Are these wakeup preemptions typically on runqueues that have only a
> > single other task?
> >
> 
> There are 112 groups of hackbench waker/wakee on a 112 CPUs system.
> Each group has 1 waker and 20 wakees. It seems that there are more than 1
> other task on each runqueue. I collected the statistics below.

Oh, I thought we were still talking about $subject benchmark. Yeah,
hackbench has a ton of tasks.


> According to above data, maybe comparing the deadline does not take much
> effect in this case(per 1). 

Yeah, I stuck a trace_printk() in last night and quicly realized the lag
is on the same order of request size, which then totally makes the whole
thing moot.


