Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4114629ACD1;
	Tue, 10 Mar 2026 18:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773168617; cv=none; b=uU2Bp17e9J6BXk6nvfNul8q89MAJZa5io2SygrXR+yJav9KYz7VS33nhCeLGFtIJPgRuCIq+r3+dCWL3OUlFVRfmeSgbE/TQfQSGRHwqfeaj3o+S/a66lDnzk8AvfixZ2B2/eUfDiQn0AzQjjVd02nBPADkDV4aMv+t/0b89UrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773168617; c=relaxed/simple;
	bh=wqjChQ1zE1ByHwbFYw/OrwIOvpLIcL8cn0L9GZnTATc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BBFxaS94LYceA4TJkVgZrwb4uw9HxJVpCd1OqHfgKmRMzGcZdlOBnHXHS2DrK2Ft6wYr/zhshdyPm16T7REQ4EBbdJ3b3cXlnPG44e0FmfBLyagx9oQRj9e1qTjret7WYlle46iJqMNfIftFcoizOsZQuAHDQmI/wlj0nVJJiOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qGE0lnjr; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qGE0lnjr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=n1PyZU3SS2GBIxf+msnEkrQCWoeNRpmUUwExG511ZlY=; b=qGE0lnjrfr/c2Ofp3icoRQuRtB
	oq2G1lUsn3cz20aLmgP+VLGS4zQOvPPeud3AaovV0eHFwSmVbHNoZg/vuZp6hYEdtWtogjmfJ+Bpe
	7GkCKgvP8XnhxtLtee+ZLJEH5JesYHzHn5Bz5KTnwqlubAYguA2NzZcfLrY4PaxmdDdR/OS18m5Ji
	J6R7/m2YaCqUF4XNkWC+Jlufh+hVUDlbN+jdFBGbU3hhzDPLJ68IRxxfcwZmraI4bpptQFtU2QeJi
	8MyVcgyUyy60+81Cyzl7tcHXOne9+5HA0jL1tOOGuYDCWsmlPpyMVS6j95ZFDyEjkwS+hWC/x/VnW
	Y9Kygc/g==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w029f-0000000FMgt-2qD9;
	Tue, 10 Mar 2026 18:50:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 64181300462; Tue, 10 Mar 2026 19:50:06 +0100 (CET)
Date: Tue, 10 Mar 2026 19:50:06 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Joe Talbott <joetalbott@gmail.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [tip:sched/hrtick] [hrtimer] 2889243848:
 stress-ng.timermix.ops_per_sec 30.1% regression
Message-ID: <20260310185006.GD652779@noisy.programming.kicks-ass.net>
References: <202603102229.74b9dee4-lkp@intel.com>
 <20260310152350.GF606826@noisy.programming.kicks-ass.net>
 <CAL7gdfeGFgppkRH5=pWfx7KCx78xsUPG_-aRsP3zqw+yLKJQ_A@mail.gmail.com>
 <20260310181651.GH606826@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310181651.GH606826@noisy.programming.kicks-ass.net>

On Tue, Mar 10, 2026 at 07:16:51PM +0100, Peter Zijlstra wrote:
> On Tue, Mar 10, 2026 at 01:11:09PM -0400, Joe Talbott wrote:
> 
> > It looks like it can be found here:
> > https://download.01.org/0day-ci/archive/20260310/202603102229.74b9dee4-lkp@intel.com/repro-script
> > 
> > stress-ng --timeout 60 --times --verify --metrics --no-rand-seed --timermix 64
> 
> Thanks, that does indeed work and show the regression.
> 
> Lets see if I can spot the fail...

It looks like that benchmark manages to trip significant nr_hangs, and
yes, I made those more expensive because those were not expected to
actually happen at any sane rate.

Lets see if we can cure that without making a giant mess of things.
