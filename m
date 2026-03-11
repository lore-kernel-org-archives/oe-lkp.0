Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326E13CF02D;
	Wed, 11 Mar 2026 09:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222026; cv=none; b=giw8mhn6HqY2z1b7LeSoVfOYUMAcE+SKMjBG5mE7sZISzqvDMbol5gZfuhLUGO/YHzFNQJTyeKMCqSMz0U7gsyi+L2P8gYo9MWJ0tfjiU7sEuCzQfAb904TpwNrrKkzJj6Yovn6hCG4zJc060x6d2Qd/d4aO4PE7KjowTxoz3+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222026; c=relaxed/simple;
	bh=PSUW4gzAgjFyplo5woHpBQ0pFb8BAKE1MI8G0sJ+V/k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YLdQsj0BwUsU0HBBJuajguRR17cDn9qRFLwZzFo/of0ppqc4WTajfw1MO5m5HhTz95UFhQhYRvqzjzcKz+KhVa3/cn4XzosXdgZimJfwqYsa6Y0hWfVok1QPe5HudPqvKrNMpv1JXYqDGsA69Rl4AgaUUC5gq3aV4BfMupBF5HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVmnKMxs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVmnKMxs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48697C4CEF7;
	Wed, 11 Mar 2026 09:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773222025;
	bh=PSUW4gzAgjFyplo5woHpBQ0pFb8BAKE1MI8G0sJ+V/k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gVmnKMxsQMgNcfbZjEfhPbMh2zsDpZ+Aj2r99eYOi4CDvPL4DMSKlX6cTlrNW0N85
	 eSjYLyF0qGyw/9dLJHeytyrC6rCRmac2Q8KXlhwFA079dfLnS67xx6i7gK/w32f5qM
	 OZ0pDkqwMuFaAjjFrO3Ntlvfjc0FWjlQNxpdlBNRyTzKZ8gShkHm1bT4wVYQJrsjyT
	 nMLa82C3TTBswGVrw5MMOsZ+i7c5W2qXgj6Pz0WbQVTnLApQadqopqR5DDJ0GrWCE8
	 xPSqnCcV/7LWlQTKWQAyj7lvclwtXkv65eAS3AcD5v3mRs3DliP7aT+TAMt44JuIF0
	 cb0DK3+ND2poQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Joe Talbott <joetalbott@gmail.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [tip:sched/hrtick] [hrtimer] 2889243848:
 stress-ng.timermix.ops_per_sec 30.1% regression
In-Reply-To: <20260310190221.GE652779@noisy.programming.kicks-ass.net>
References: <202603102229.74b9dee4-lkp@intel.com>
 <20260310152350.GF606826@noisy.programming.kicks-ass.net>
 <CAL7gdfeGFgppkRH5=pWfx7KCx78xsUPG_-aRsP3zqw+yLKJQ_A@mail.gmail.com>
 <20260310181651.GH606826@noisy.programming.kicks-ass.net>
 <20260310185006.GD652779@noisy.programming.kicks-ass.net>
 <20260310190221.GE652779@noisy.programming.kicks-ass.net>
Date: Wed, 11 Mar 2026 10:40:20 +0100
Message-ID: <87cy1ar9ff.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Mar 10 2026 at 20:02, Peter Zijlstra wrote:

> On Tue, Mar 10, 2026 at 07:50:06PM +0100, Peter Zijlstra wrote:
>> On Tue, Mar 10, 2026 at 07:16:51PM +0100, Peter Zijlstra wrote:
>> > On Tue, Mar 10, 2026 at 01:11:09PM -0400, Joe Talbott wrote:
>> > 
>> > > It looks like it can be found here:
>> > > https://download.01.org/0day-ci/archive/20260310/202603102229.74b9dee4-lkp@intel.com/repro-script
>> > > 
>> > > stress-ng --timeout 60 --times --verify --metrics --no-rand-seed --timermix 64
>> > 
>> > Thanks, that does indeed work and show the regression.
>> > 
>> > Lets see if I can spot the fail...
>> 
>> It looks like that benchmark manages to trip significant nr_hangs, and
>> yes, I made those more expensive because those were not expected to
>> actually happen at any sane rate.
>> 
>> Lets see if we can cure that without making a giant mess of things.
>
> Ha! This seems to work just fine.
>
> ---
> diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
> index b94bd56b739f..9872dd53f761 100644
> --- a/kernel/time/hrtimer.c
> +++ b/kernel/time/hrtimer.c
> @@ -2031,7 +2031,8 @@ static void hrtimer_rearm(struct hrtimer_cpu_base *cpu_base, ktime_t expires_nex
>  		 * Give the system a chance to do something else than looping
>  		 * on hrtimer interrupts.
>  		 */
> -		expires_next = ktime_add_ns(ktime_get(), 100 * NSEC_PER_MSEC);
> +		expires_next = ktime_add_ns(ktime_get(),
> +					    min(100 * NSEC_PER_MSEC, cpu_base->max_hang_time));
>  		cpu_base->hang_detected = false;

Hmm. The original code preserved hang_detected until the next timer
interrupt to prevent rearming when a new timer is queued.

Thanks,

        tglx
