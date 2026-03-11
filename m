Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FE93B9D92;
	Wed, 11 Mar 2026 12:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773231307; cv=none; b=D2JXf8fW0N3bpOWI0SA7LtzZTQr7YBggDykeA0QxkRQ+GyYuz0S25PEn7qiXZmZ5+cHwfxAr7qj7Cr5OkErR1EStlYtzoKYTfTSL5UVYfz+ulyOmDf8UeX/rZA12JRfU1sMYVsHYBlzy5lxmYLHSz+GImoNQNi93BxlXf7i4XLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773231307; c=relaxed/simple;
	bh=68lW1RIBaDRTNEI/f3ERwjVTxepbEGXVzdoFHGJJC1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/nNTokOuX0wfGzRP5Gsl5tCYZvq18waXtV4SdWvX8RPpdidN1LIcD8mRs8GONSnOfww2tlBtX6+L/h2nRUEcn2LQlWshTxaQ9KDSaqCipz9rtJg4PfqoR1OMY6byMHryDkw7yTsYPQpYRR99lOv5iyeOKbpCyrTh3jT82LmxB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pfMOod55; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pfMOod55"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=p0IzWA4QyYousBTmMS3zBcThgLy673xOeqIRpD2NkbM=; b=pfMOod55ZTtR7R4PJZDbVZKLfJ
	w+rMb8uBcBB5FSJwMk440kVaT/WI7fG/DOhleK55shmj984+9YOelyS/QZH6kMDhgN4Mz+8u7g/QA
	lzwbz4OXpSrG870qIk0PXTBwbnajSNYd3nj9eQXQXfI7/80yZWerrKxXz37BiJunC8mpOt+K0pGdx
	c2NNofg0USLcjlTa6F+le71XJttXXq2IWIfYQkY5Q/bqWRiVEg9MeBrIWnMpaTzCq6OleODixLRaC
	Z5zo4kD9K4hTAFfHhK76/39d+a8YHN0fB4cEROoZMHfUdgfBWGKsiQJ2nrczc7uzq3qUiAlE9quz2
	5xBvJrKA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ISr-0000000Gsap-2WCx;
	Wed, 11 Mar 2026 12:15:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5DD73300462; Wed, 11 Mar 2026 13:15:00 +0100 (CET)
Date: Wed, 11 Mar 2026 13:15:00 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Joe Talbott <joetalbott@gmail.com>,
	kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [tip:sched/hrtick] [hrtimer] 2889243848:
 stress-ng.timermix.ops_per_sec 30.1% regression
Message-ID: <20260311121500.GF652779@noisy.programming.kicks-ass.net>
References: <202603102229.74b9dee4-lkp@intel.com>
 <20260310152350.GF606826@noisy.programming.kicks-ass.net>
 <CAL7gdfeGFgppkRH5=pWfx7KCx78xsUPG_-aRsP3zqw+yLKJQ_A@mail.gmail.com>
 <20260310181651.GH606826@noisy.programming.kicks-ass.net>
 <20260310185006.GD652779@noisy.programming.kicks-ass.net>
 <20260310190221.GE652779@noisy.programming.kicks-ass.net>
 <87cy1ar9ff.ffs@tglx>
 <20260311105819.GL606826@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311105819.GL606826@noisy.programming.kicks-ass.net>

On Wed, Mar 11, 2026 at 11:58:19AM +0100, Peter Zijlstra wrote:

> > Hmm. The original code preserved hang_detected until the next timer
> > interrupt to prevent rearming when a new timer is queued.
> 
> Oh indeed. And that avoids __hrtimer_reprogram() from coming in and
> 'destroying' the delay I suppose.
> 
> Let me poke at this a little more then.

How's this then?

---
Subject: hrtimer: Less agressive interrupt 'hang' handling
From: Peter Zijlstra <peterz@infradead.org>
Date: Tue, 10 Mar 2026 20:02:21 +0100

When the hrtimer_interrupt needs to restart more than 3 times and
still has expired timers, the interrupt is considered hung. To give
the system a little time to recover, the hardware timer is programmed
a little into the future.

Prior to commit 288924384856 ("hrtimer: Re-arrange
hrtimer_interrupt()"), this was relative to the amount of time spend
serving the interrupt with a max of 100 msec.

However, in order to simplify, and because this condition 'should' not
happen, the timeout was unconditionally set to 100 msec.

'Obviously' there is a benchmark that hits this hard, by programming a
ton of very short timers :-/

Since reprogramming is decoupled from the interrupt handling, the
actual execution time is lost, however the code does track
max_hang_time. Using that, rather than the 100 ms max restores
performance.

  stress-ng --timeout 60 --times --verify --metrics --no-rand-seed --timermix 64

                  bogo ops/s
 288924384856^1: 23715979.93
 288924384856:   11550049.77
 patched:        23361116.78

Additionally, Thomas noted that we should not clear ->hang_detected
until the next interrupt, such that __hrtimer_reprogram() won't undo
the extra delay.

Fixes: 288924384856 ("hrtimer: Re-arrange hrtimer_interrupt()")
Closes: https://lore.kernel.org/oe-lkp/202603102229.74b9dee4-lkp@intel.com
Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/time/hrtimer.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -2031,8 +2031,8 @@ static void hrtimer_rearm(struct hrtimer
 		 * Give the system a chance to do something else than looping
 		 * on hrtimer interrupts.
 		 */
-		expires_next = ktime_add_ns(ktime_get(), 100 * NSEC_PER_MSEC);
-		cpu_base->hang_detected = false;
+		expires_next = ktime_add_ns(ktime_get(),
+					    min(100 * NSEC_PER_MSEC, cpu_base->max_hang_time));
 	}
 	hrtimer_rearm_event(expires_next, deferred);
 }
@@ -2121,6 +2121,7 @@ void hrtimer_interrupt(struct clock_even
 	 */
 	now = hrtimer_update_base(cpu_base);
 	expires_next = hrtimer_update_next_event(cpu_base);
+	cpu_base->hang_detected = false;
 	if (expires_next < now) {
 		if (++retries < 3)
 			goto retry;
