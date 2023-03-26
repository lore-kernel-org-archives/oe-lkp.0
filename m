Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD64A15AB
	for <oe-lkp@lists.linux.dev>; Sun, 26 Mar 2023 11:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=z8SkcqRdRD4qjao3ozi/oaHfaibkOgqw9QlKyRd98oo=; b=coLIJRmV4CP0DKokB5Bv48/0Rt
	IvxUxVoi4ku0+CXnCeBwant0+kdt70FwwN5BUk56nI5gWFcLdMTWZ/xks24TTrQYPLuSY+jQzZmdv
	2UMuhJj5us2aIxWPyRL32kqTR590q6Zko8ippmInTIJKvWBNWn44b81uq+AuHvhEQqGhs2IpoQ5L5
	yKvhuyoU2DLK/5wSGMHDuZCh1OOt8l2nE4vxkfjjppw+SzKsvuYybvutONc3p67qDuDumEeVn2WG4
	1ePEVItw46R75qY4WHR42tGP2Ae2ZtQm1xDzPOrZ67F0sP7ra0T1Dv8YiwAaIEDCBRhVrFs0qgl77
	WL7Il0Mg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pgO6s-005oXQ-2W;
	Sun, 26 Mar 2023 11:00:27 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D53CE3002FC;
	Sun, 26 Mar 2023 13:00:24 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 99B7B240EC719; Sun, 26 Mar 2023 13:00:24 +0200 (CEST)
Date: Sun, 26 Mar 2023 13:00:24 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Chen Yu <yu.c.chen@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Oliver Sang <oliver.sang@intel.com>,
	Chen Yu <yu.chen.surf@gmail.com>, Ingo Molnar <mingo@kernel.org>
Subject: Re: [peterz-queue:sched/eevdf] [sched/fair]  23669fce72:
 aim7.jobs-per-min -18.6% regression
Message-ID: <20230326110024.GA2990748@hirez.programming.kicks-ass.net>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBxEuboumEifedjG@chenyu5-mobl1>

On Thu, Mar 23, 2023 at 08:23:21PM +0800, Chen Yu wrote:

>     stress-ng (throughput, higher is better)
>     ==============================================================================
>     case                    nr_instance            baseline(std%)  compare%( std%)

>     futex                   25%                      1.00 (<2%)    -3.2 (<2%)
>     futex                   50%                      1.00 (3%)     -19.9 (5%)
>     futex                   75%                      1.00 (6%)     -19.1 (2%)
>     futex                   100%                     1.00 (16%)    -30.5 (10%)
>     futex                   125%                     1.00 (25%)    -39.3 (11%)
>     futex                   150%                     1.00 (20%)    -27.2% (17%)
>     futex                   175%                     1.00 (<2%)    -18.6 (<2%)
>     futex                   200%                     1.00 (<2%)    -47.5 (<2%)

>     It seems that when the load increases, there would be regression in "switch" and
>     "futex" case. In the futex case, the regression seems to be caused by fewer context
>     switch. The stress-ng futex would create a lot of 1:1 futex_wait/futex_wake pairs.
>     And it seems that with the patch applied, there are more wakeup, but less successful
>     wakeup. It is possible that the wakers are stacked on 1 CPU which delay the
>     wakeup.
> 
>     For example, more wakeup attempts:
> 
>     49.27 ±  4%     +13.4       62.63        perf-profile.calltrace.cycles-pp.futex_wake.do_futex
> 
>     However less successful wakeups(context switch):
> 
>     852533 ± 18%        -35.0%     553996 ±  9%  sched_debug.cpu.nr_switches.avg
>     1.01e+08 ± 24%      -36.2%   64471512 ±  9%  stress-ng.time.involuntary_context_switches
>     1.271e+08 ± 15%     -34.0%   83868905 ±  8%  stress-ng.time.voluntary_context_switches
> 
>     BTW, I thought this is a use case for short task wakeup placement. Waking
>     up the short task on current CPU when the system is overloaded might mitigate
>     this issue.

There's only a few hundred migrations in this workload at 100%,
placement is not an issue (nor should it be at that point).

What does seem to be the issue is sleeper bonus. The way this benchmark
is constructed (see stress-futex.c) is:

parent:

	do {
		futex_wake();
	} while (keep_stressing());

child:

	do {
		futex_wait();
		inc_counter();
	} while (keep_stressing());

That is, the parent is always running, while the child is blocking.
Consider the parent 100% running and the child 50%, then a truely fair
scheduler will make it 67% vs 33% runtime -- this is what EEVDF does
now. And as you can see, since the child gets less runtime, the counter
increases less and the benchmark drops.

CFS has sleeper bonus, which gives (short) blocking tasks a small
advantage to make it 50% vs 50%. And if you compute the drop from 50% to
33% then you get -33% and that's exactly the drop you see around the
100% case.

tip/sched/urgent:

root@ivb-ep:~# stress-ng --futex 40 -t 5 --metrics 2>&1 | awk '{ if ($4 == "futex") print $0 }'
stress-ng: info:  [1825] futex           9834434      5.00      5.56    193.94   1966762.43       49294.78        99.74          2288

sched/eevdf + place_bonus (based on tip/sched/urgent -- will push out
later today)

root@ivb-ep:~# echo NO_PLACE_BONUS > /debug/sched/features ; stress-ng --futex 40 -t 5 --metrics 2>&1 | awk '{ if ($4 == "futex") print $0 }'
stress-ng: info:  [2373] futex           6541589      5.00      4.28    194.83   1308211.07       32854.97        99.54          2288
root@ivb-ep:~# echo PLACE_BONUS > /debug/sched/features ; stress-ng --futex 40 -t 5 --metrics 2>&1 | awk '{ if ($4 == "futex") print $0 }'
stress-ng: info:  [2537] futex           9745715      5.00      5.38    194.55   1948945.01       48745.49        99.96          2288


The whole sleeper bonus is something that's fairly controversial but it
was needed in CFS to make some 'starvation' cases go away -- the lag
based placement cures them too. And given the whole (recent) trainwreck with:

  829c1651e9c4 ("sched/fair: sanitize vruntime of entity being placed")
  a53ce18cacb4 ("sched/fair: Sanitize vruntime of entity being migrated")

I'm happy to delete all that. Still, let me think a little, perhaps I
can come up with something slightly less horrible than all that which we
can default-disable for now...
