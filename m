Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C8317AD9
	for <oe-lkp@lists.linux.dev>; Tue, 15 Aug 2023 23:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HfCZ9brg0iyE5Q8lglqtZyQbu0Jpru3LAR5+PlvOWsM=; b=ecUAP1yLvKcjKgpVVpJcK1ujbX
	D0hBUB1OOsgX4VZ1b5hvrP1iC9huVAECuD47toguaGbisMGRKhBwDbb3uwyuHeuwS/kP4UHE2cleV
	rnI5VL97JgrDeV/OJ/L5FpS1ozb6iC1jOFWBU+gTED4SQCo+bot81nBxtgiqYoY3Jp2aFqqZUH8vu
	eQwVHDCoozMMxEH7hVHCe/WICFnemnmC3AwI/OxbFWI4z/FKxIagcB0zR3j1qWqh5rbz8N5K2b7RE
	shSr/6yWpfUWk6YyaVGyG71dySnx0o0ZWzsFs3fuofOvVCp8cONk96/an12uw5bSgg2YMHr9oOSo8
	RsIASD1A==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qW3pS-00CD4s-12;
	Tue, 15 Aug 2023 23:52:07 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id AC3B8300388;
	Wed, 16 Aug 2023 01:52:01 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8B2022C865681; Wed, 16 Aug 2023 01:52:01 +0200 (CEST)
Date: Wed, 16 Aug 2023 01:52:01 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mike Galbraith <umgwanakikbuti@gmail.com>
Cc: Chen Yu <yu.c.chen@intel.com>,
	kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: Re: [tip:sched/eevdf] [sched/fair]  e0c2ff903c:
 phoronix-test-suite.blogbench.Write.final_score -34.8% regression
Message-ID: <20230815235201.GH971582@hirez.programming.kicks-ass.net>
References: <202308101628.7af4631a-oliver.sang@intel.com>
 <ZNWKuccyWnS3UJjK@chenyu5-mobl2.bbrouter>
 <ZNWgAeN/EVS/vOLi@chenyu5-mobl2.bbrouter>
 <20230814132935.GK776869@hirez.programming.kicks-ass.net>
 <bd96d883d0d1575ebbee4323f4396596adb0ad09.camel@gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd96d883d0d1575ebbee4323f4396596adb0ad09.camel@gmail.com>

On Mon, Aug 14, 2023 at 08:32:55PM +0200, Mike Galbraith wrote:

> I don't have that phoronix thingy, but the above didn't seem to do
> anything for hackbench here.

Yeah, looking at it this is because the lag and the request/slice are on
the same order of things.

More thinking required, but perhaps not at 2am.

> I whack eevdf with the stick below to dampen its scheduling enthusiasm
> a little, and it did help the hackbench deficit some.

I'm thinking there's an argument to be had the current WAKEUP_PREEMPTION
knob is at the wrong place and should be more or less where you put the
triddle at.
