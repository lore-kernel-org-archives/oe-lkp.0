Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08743C0F
	for <oe-lkp@lists.linux.dev>; Mon, 27 Mar 2023 15:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qw5bqjgcS2x0FZITiKwR5inM/4awzH/SqXKldpvrD4o=; b=SOfZ7Idu/V84y1K6baWNSU0LFp
	Z6eb62XHHaghSpEFygofomxFnvR0krPcQ3/TCcVM4GRZAGiGH01hFnlVE9tEL50MigGeSUbP+ILgy
	Me1Ik1Vk4+8aAzRihA3+TqBckX8HBHnNezC2IXx+EiV3gq1uvM05SOTE0w1AOYgAz9rbgjPXt9Ivf
	Nx9DySzhaN/vHQSwgGz7sPBW7yH473YKWFpc7X3FnKzAiZwoZaAWDoobH7nnWFZ52hbB+cPlMEwiF
	B/XsjMyRvZUzgKn5gkEhisXzityuikQ+THbJqVEW4QkWl/bSHCrCONBKaV2DRMD+pVkdcTMI+5HI5
	2whk1JPg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pgoc9-006D9t-0A;
	Mon, 27 Mar 2023 15:18:29 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 412D13002FC;
	Mon, 27 Mar 2023 17:18:26 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2954320C0F36C; Mon, 27 Mar 2023 17:18:26 +0200 (CEST)
Date: Mon, 27 Mar 2023 17:18:26 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Chen Yu <yu.c.chen@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Oliver Sang <oliver.sang@intel.com>,
	Chen Yu <yu.chen.surf@gmail.com>, Ingo Molnar <mingo@kernel.org>
Subject: Re: [peterz-queue:sched/eevdf] [sched/fair]  23669fce72:
 aim7.jobs-per-min -18.6% regression
Message-ID: <20230327151826.GC11425@hirez.programming.kicks-ass.net>
References: <202303201517.399a9b16-oliver.sang@intel.com>
 <20230320075850.GA2194297@hirez.programming.kicks-ass.net>
 <ZBlg1Bx4L55oSfyR@xsang-OptiPlex-9020>
 <ZBllA/Qq3ZpAOwz+@chenyu5-mobl1>
 <20230321090318.GB2234901@hirez.programming.kicks-ass.net>
 <ZBxEuboumEifedjG@chenyu5-mobl1>
 <20230326110024.GA2990748@hirez.programming.kicks-ass.net>
 <20230326133851.GA2994912@hirez.programming.kicks-ass.net>
 <ZCGcjTneO2C/+fV2@chenyu5-mobl1>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCGcjTneO2C/+fV2@chenyu5-mobl1>

On Mon, Mar 27, 2023 at 09:39:25PM +0800, Chen Yu wrote:
> I'll launch more tests tomorrow with/without PLACE_BONUS.

Right, so it will absolutely destroy a number of workloads.. I've not
yet found a way to write that thing without it wrecking things.

Fundamentally the problem seems to be that if you place entities so far
back the whole latency thing goes out the window. Specifically, becuse
it did not in fact content that whole time, it is now significantly
behind and needs to catch up, but it cannot do that while also
respecting latency requirements of the existing tasks.
