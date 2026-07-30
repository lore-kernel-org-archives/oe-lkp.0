Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE6343DA3C;
	Thu, 30 Jul 2026 14:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785421970; cv=none; b=d9rpxy5mDsM7HIPB/8TEGC/nc9xMep17jiI9yweUhDXnc0sYMqzRegdu2+AeGjsJBXi1VGGqqMcTb7DLox/S6rLFKpKFIJq8lo5FrRPFHjN4DLec1zxkn0TS+afgpMKvvduSfabQRYJod/pt9QxUAJCHZrmRjdkHclo45GS36jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785421970; c=relaxed/simple;
	bh=tdeZ3Imnopg1UB1rBsrpYp6t8LoeBv5sr1pNbLRPaSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbU0O6MPoXSdd2FHTArEsfs3neV7NJja82o8nPjEfLGZcSRmTeakZAf8RhX6aQKHPyD/Pu3gBLUsh4U2Q8tyWz1P4OwUlE5FlB+hB6u1YXuSnIVTBmkq2IIsyJZ0IAzeOSBxTM7FRgr2aApRJ8l5n9+eEE0P4HPt2BZlo1njgz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jlMZ2Kap; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jlMZ2Kap"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4ia5hnhZllEVja50krpyemAwuNcIKre0NLlP7mDWzdc=; b=jlMZ2Kapo1+7K/gPLdgC8GJD+b
	iz2Kic6O4trTjna9rBVrsOX1dPUuZZ62YcekeJ0AhBjRAeZPyFD0nOOdYIUoMSa8s9W6lwpYkeV/v
	Qj9vdRzQ5rWMIdFzgHviFffEW7I0o5ZEaIMKX3iLJSCB0AU6DWGoQeQ0hhM7RNSalbzGAFaqESC9x
	RnGlV3EpXosed5op65RQ7IiqXJ9tNwrBTHXm0D3DI3AVZA99bs9OpZrRrq9mw1KbY42GkrIToaIuR
	l05+En6hjRwIBMDxCx51Ft8yYKm75FU2j2jHQ3vzSy40E4UbxeW+g+69/LJ9K0MV2yX+hRn2GIJkf
	L3U9sc9Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wpRoO-00000006ldZ-3F1B;
	Thu, 30 Jul 2026 14:32:40 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 628B030095A; Thu, 30 Jul 2026 16:32:39 +0200 (CEST)
Date: Thu, 30 Jul 2026 16:32:39 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	aubrey.li@linux.intel.com, yu.c.chen@intel.com,
	tim.c.chen@intel.com, vinicius.gomes@intel.com,
	ehab.ababneh@intel.com, thomas.falcon@intel.com,
	philip.li@intel.com
Subject: Re: [linux-next:master] [sched/fair]  fb1050ac8e:
 netperf.Throughput_Mbps 14.6% regression
Message-ID: <20260730143239.GA687043@noisy.programming.kicks-ass.net>
References: <202607151644.d59b94e9-lkp@intel.com>
 <amrrvTgy/p6c6WbJ@xsang-desk>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amrrvTgy/p6c6WbJ@xsang-desk>

On Thu, Jul 30, 2026 at 02:14:21PM +0800, Oliver Sang wrote:
> hi, Peter Zijlstra,
> 
> we are currently piloting AI integrations to help enhance 0-Day's performance
> analysis and regression-detection capabilities. Since this is in an early trial
> phase, we want to ensure we build features that genuinely support your workflow.
> We would love to hear what you would like to see from AI-assisted reports, whether
> it's specific bottleneck explanations, a cleaner format, or filtering ideas.
> 
> Please share your thoughts and suggestions with us to help guide our development!

As with most AI output, I find it incredibly hard to read -- for some
reason my brain keeps wandering and then I have to restart and refocus.
I'm not entirely sure what causes this, but I know I'm not the only one
faced with this.

That said, I struggled through it, and while it goes a little off the
rails at times (eg. the callgraph stuff doesn't at all seem relevant
here), it seems to be mostly on point.

There are a few things that I find missing that might be possible:

 - determine the specific task that is now preempting less; I suspect it
   is ksoftirqd because network workload.

   I suspect it doesn't have the data to determine this, but it should
   probably ask for such data and or, if it has access to the guest
   running this, gather it itself.

 - a section on possible 'mitigations' for this regression given
   existing configuration options. It touched upon the new debugfs knob
   to revert to the old behaviour, but I suspect that setting a shorter
   slice on ksoftirq might also help.

   That is, something like so:

   ps -def | awk '/ksoftirqd/ { if ($0 !~ /awk/) print $2}' | while read pid;
   do
     chrt --pid -o -T $((`cat /sys/kernel/debug/sched/base_slice_ns`/10)) $pid;
   done

   or perhaps the opposite, giving the netperf thing a larger slice such
   that ksoftirq will more reaily preempt it.

   And then there is of course the option to renice things, the netperf
   cgroup could be given a smaller slice or ksoftirq a larger.

   (all operating under the assumption that it is indeed ksoftirq that
   is now ran less readily)
   

This is the only regression found so far for tip/sched/core?
