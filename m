Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C02B3CA481;
	Tue, 10 Mar 2026 19:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773169348; cv=none; b=SJRl6cKJOmSe027yJ2h6ju8MkGV4R5/xY2MeUf5sbQmLu7VNZj6LsTng8CNJtZUORkioJMBI2bTvwXX+IfWLlreYLF3zLOkAd3ZJLkMF+hM+3XGFDQZ7YQ9zcvYId/nUe1wlEoAYIOFVOerlAf1kNloBW51tKWfQCrVuae4kEYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773169348; c=relaxed/simple;
	bh=u0IWPn7xLrc5KoMqdhhxumm8QuwOA9je/jRMsy4Ex3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEeDW1NmD4k90CHk+L5dJOJDLs7o5KvFzBMIPWSvLUdX7ITYdGa32d0eQ/2xkdl/hXbV56MT35n/EilI30E6ogjUMVDH3q9k0ENOxAriyHkiuLlCgJcXB9vwdCuQ0Lj0s8qk9CA8jtcm9aTdaDFvvTdfhPQX9sGnolHg+WlNEgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BZ7sGw5W; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BZ7sGw5W"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4UalkBGXBQW5z5HCUizzlYx+9lweQUuMPxb5Rmf3ND0=; b=BZ7sGw5WfV48HBAKPSmie3NBSx
	8HsQHRZS271tlQakCpq+Wqkwj9F8JLsquTxcdNcVJ2WPmHLHmVcQv4u3KQIp+k8eToMFvGt9LBkEi
	IUgMGWlgOphw+m0DL3EwER4OlN/0GVoVdQezjV8PgDa4hO21sYX++qz29IPxnCIps8l0jOua+HeNA
	LSO6s/bCZxVm/OD2uKyI+pV71J01O272srThC6QZLaAMAahbFPiRi0e4zojqzwLVvO/sru3TBhs0W
	DePHkkW0uoec82vDN71Ffte+l2P4auL8spzLziQNmJJRXqKmmbzIbZsBQnM27n2V1mPFBi0o5cj0C
	4MmtnZ/Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02LV-0000000FNpG-3Mct;
	Tue, 10 Mar 2026 19:02:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 536FF300462; Tue, 10 Mar 2026 20:02:21 +0100 (CET)
Date: Tue, 10 Mar 2026 20:02:21 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Joe Talbott <joetalbott@gmail.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [tip:sched/hrtick] [hrtimer] 2889243848:
 stress-ng.timermix.ops_per_sec 30.1% regression
Message-ID: <20260310190221.GE652779@noisy.programming.kicks-ass.net>
References: <202603102229.74b9dee4-lkp@intel.com>
 <20260310152350.GF606826@noisy.programming.kicks-ass.net>
 <CAL7gdfeGFgppkRH5=pWfx7KCx78xsUPG_-aRsP3zqw+yLKJQ_A@mail.gmail.com>
 <20260310181651.GH606826@noisy.programming.kicks-ass.net>
 <20260310185006.GD652779@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310185006.GD652779@noisy.programming.kicks-ass.net>

On Tue, Mar 10, 2026 at 07:50:06PM +0100, Peter Zijlstra wrote:
> On Tue, Mar 10, 2026 at 07:16:51PM +0100, Peter Zijlstra wrote:
> > On Tue, Mar 10, 2026 at 01:11:09PM -0400, Joe Talbott wrote:
> > 
> > > It looks like it can be found here:
> > > https://download.01.org/0day-ci/archive/20260310/202603102229.74b9dee4-lkp@intel.com/repro-script
> > > 
> > > stress-ng --timeout 60 --times --verify --metrics --no-rand-seed --timermix 64
> > 
> > Thanks, that does indeed work and show the regression.
> > 
> > Lets see if I can spot the fail...
> 
> It looks like that benchmark manages to trip significant nr_hangs, and
> yes, I made those more expensive because those were not expected to
> actually happen at any sane rate.
> 
> Lets see if we can cure that without making a giant mess of things.

Ha! This seems to work just fine.

---
diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index b94bd56b739f..9872dd53f761 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -2031,7 +2031,8 @@ static void hrtimer_rearm(struct hrtimer_cpu_base *cpu_base, ktime_t expires_nex
 		 * Give the system a chance to do something else than looping
 		 * on hrtimer interrupts.
 		 */
-		expires_next = ktime_add_ns(ktime_get(), 100 * NSEC_PER_MSEC);
+		expires_next = ktime_add_ns(ktime_get(),
+					    min(100 * NSEC_PER_MSEC, cpu_base->max_hang_time));
 		cpu_base->hang_detected = false;
 	}
 	hrtimer_rearm_event(expires_next, deferred);
