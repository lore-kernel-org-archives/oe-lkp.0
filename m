Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EB53D47D9;
	Wed, 11 Mar 2026 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773226705; cv=none; b=TxjMRdm1uMr3wnpXmTN0BZ7yhJUPgKXgDjksUxDYr/wy6MYl17MD1UpTfQN3c/YFAFkmwZW90Z+ofM3OXTZQA25OAw7fGadvjqmrUlawV0A2w17rYGWFH2jh7mI+/gC46Sdl/uMCWgDJX2qiGCWInvWwnQw2XEaPBktYNPjJL2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773226705; c=relaxed/simple;
	bh=9FNY/zGi6Yxa6sHtVOGvKUUr+yBda3BSftfMOaM5eBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBldpsCFjb3Z2/J2EuHXv78FKhB6NJFMb/560azU5Ck74GqeB9/oYf8PrlL3fLR9mYvo/Et3iXD+3TV2K9ZoPiCnt1JI4W61j6WleLR7/9KmHTkr2fZo2TUry/CBz695qAZoYW6rs8cMLyK7w/MhMKOO6J2RPj3vLKed1DgKaGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RfVnPXNG; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RfVnPXNG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=R7cXg+/s8lCoXi+mEICd9B0NmewYw6aptysFk3wbROQ=; b=RfVnPXNGsJhyaHO3KMrNMfNWdx
	IkauxIDyTG+NzD9FsJDXeXN9bDom5Ltl1oyXi+6GRYLkhObcIbJG3RsEBz2DnQQT0lLyMJagXtelA
	Q27HU5X7ZUhlWZkH/ftqS8+2LeZ/oSM10ZaAt/MufdW4l6vlU7CZD7+NeI+fqS6opGqOBZLcCPvi4
	zu1uQu8nrmEt/ngzm76kf3Z16Dkir+yVUH1Kp7DIiYGyUuLCLDvofWZiDbxu2keOI7HgDB7proj5v
	RnGslETcl2FZZvWHLBsYVA+tNyXH4MXi6bOAQqV0mLDaqfO6bT9SR38E+ADkl3x1CnrkksmJSECdi
	DPSqTfug==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0HGe-00000009UYZ-15ge;
	Wed, 11 Mar 2026 10:58:20 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 89AA3300462; Wed, 11 Mar 2026 11:58:19 +0100 (CET)
Date: Wed, 11 Mar 2026 11:58:19 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Joe Talbott <joetalbott@gmail.com>,
	kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [tip:sched/hrtick] [hrtimer] 2889243848:
 stress-ng.timermix.ops_per_sec 30.1% regression
Message-ID: <20260311105819.GL606826@noisy.programming.kicks-ass.net>
References: <202603102229.74b9dee4-lkp@intel.com>
 <20260310152350.GF606826@noisy.programming.kicks-ass.net>
 <CAL7gdfeGFgppkRH5=pWfx7KCx78xsUPG_-aRsP3zqw+yLKJQ_A@mail.gmail.com>
 <20260310181651.GH606826@noisy.programming.kicks-ass.net>
 <20260310185006.GD652779@noisy.programming.kicks-ass.net>
 <20260310190221.GE652779@noisy.programming.kicks-ass.net>
 <87cy1ar9ff.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cy1ar9ff.ffs@tglx>

On Wed, Mar 11, 2026 at 10:40:20AM +0100, Thomas Gleixner wrote:
> On Tue, Mar 10 2026 at 20:02, Peter Zijlstra wrote:
> 
> > On Tue, Mar 10, 2026 at 07:50:06PM +0100, Peter Zijlstra wrote:
> >> On Tue, Mar 10, 2026 at 07:16:51PM +0100, Peter Zijlstra wrote:
> >> > On Tue, Mar 10, 2026 at 01:11:09PM -0400, Joe Talbott wrote:
> >> > 
> >> > > It looks like it can be found here:
> >> > > https://download.01.org/0day-ci/archive/20260310/202603102229.74b9dee4-lkp@intel.com/repro-script
> >> > > 
> >> > > stress-ng --timeout 60 --times --verify --metrics --no-rand-seed --timermix 64
> >> > 
> >> > Thanks, that does indeed work and show the regression.
> >> > 
> >> > Lets see if I can spot the fail...
> >> 
> >> It looks like that benchmark manages to trip significant nr_hangs, and
> >> yes, I made those more expensive because those were not expected to
> >> actually happen at any sane rate.
> >> 
> >> Lets see if we can cure that without making a giant mess of things.
> >
> > Ha! This seems to work just fine.
> >
> > ---
> > diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
> > index b94bd56b739f..9872dd53f761 100644
> > --- a/kernel/time/hrtimer.c
> > +++ b/kernel/time/hrtimer.c
> > @@ -2031,7 +2031,8 @@ static void hrtimer_rearm(struct hrtimer_cpu_base *cpu_base, ktime_t expires_nex
> >  		 * Give the system a chance to do something else than looping
> >  		 * on hrtimer interrupts.
> >  		 */
> > -		expires_next = ktime_add_ns(ktime_get(), 100 * NSEC_PER_MSEC);
> > +		expires_next = ktime_add_ns(ktime_get(),
> > +					    min(100 * NSEC_PER_MSEC, cpu_base->max_hang_time));
> >  		cpu_base->hang_detected = false;
> 
> Hmm. The original code preserved hang_detected until the next timer
> interrupt to prevent rearming when a new timer is queued.

Oh indeed. And that avoids __hrtimer_reprogram() from coming in and
'destroying' the delay I suppose.

Let me poke at this a little more then.
