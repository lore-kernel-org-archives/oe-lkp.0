Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A921FC10C;
	Tue, 10 Mar 2026 18:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773166618; cv=none; b=QVQNd+oBzsrHRmOeHhiCWmngSNFqETN/9NYhKcoDV0swcLp+0mVumfeoU5xRpHI2lsNH7dX/ZzrGu79Nw5HOj++FAaDKqPtnkBSAXSbUoZPSKQHKKruB/E4SUZ8XgV6mzGpWsL/ExouhwsWqY5pCKPCdazU41MMvYYmc3eNxhKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773166618; c=relaxed/simple;
	bh=l0L3jMf6ERc6L7ED03sRbldZb21pBTlyr4fUD0hfQDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3ZDtP/yOQ2mnNJ5ULJBb2UQjyxD0XL4P4oO8xi+ZyIeB9YfUyEpeoOpC3+9S+EG8/5/lMY52uQTc8uBvQbLR2V7HycPvECeY5zOcushBPm1eCFt6/Br2zgYuF8u/wmPU+n95YCaQ9qLGyqX6hNmy8iZCCV69i803r8dH+cqSBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kNejysMR; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kNejysMR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Tr9Yn7Jm07uQogMEJLwq1UdtdntB7hG67mtk9j1dazc=; b=kNejysMRqhKgI8yTNLym/LuPAL
	MvHxwWePOOGSGaBQgn+XtSLe4+giWrXO3DUvA4rC0EE9mCwYBPAbn8HkFQymW9fRL3NWw8n6vNff8
	vDGmr0Y3zEdpEHpF2lgZqbWFT8oS6Qn3oDGUm7BvFcAcq5iUWkX6OP8MuxjGfvQnKC4MdH5+H0TQ+
	Vmnwn7B/6HJfHhHoV0tHkZoxDysyK8GUiicwEXQ81GfdhLKkzxmPD2xBYr01hq5O4vwHi6Kx12Peo
	sRXC3Ju9T+SRiXN/pYb3tE4AmeDOjflYoWg/SdhBqg+MqDVEzs7LbkgMPMAnqVoxUOn1jXTJ3ASFl
	gzEy0GMA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01dU-0000000FJiH-46uT;
	Tue, 10 Mar 2026 18:16:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A855D300462; Tue, 10 Mar 2026 19:16:51 +0100 (CET)
Date: Tue, 10 Mar 2026 19:16:51 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Joe Talbott <joetalbott@gmail.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [tip:sched/hrtick] [hrtimer] 2889243848:
 stress-ng.timermix.ops_per_sec 30.1% regression
Message-ID: <20260310181651.GH606826@noisy.programming.kicks-ass.net>
References: <202603102229.74b9dee4-lkp@intel.com>
 <20260310152350.GF606826@noisy.programming.kicks-ass.net>
 <CAL7gdfeGFgppkRH5=pWfx7KCx78xsUPG_-aRsP3zqw+yLKJQ_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL7gdfeGFgppkRH5=pWfx7KCx78xsUPG_-aRsP3zqw+yLKJQ_A@mail.gmail.com>

On Tue, Mar 10, 2026 at 01:11:09PM -0400, Joe Talbott wrote:

> It looks like it can be found here:
> https://download.01.org/0day-ci/archive/20260310/202603102229.74b9dee4-lkp@intel.com/repro-script
> 
> stress-ng --timeout 60 --times --verify --metrics --no-rand-seed --timermix 64

Thanks, that does indeed work and show the regression.

Lets see if I can spot the fail...
