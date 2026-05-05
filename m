Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ABD481FAA;
	Tue,  5 May 2026 15:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777994963; cv=none; b=HnTXPM1nxEjJNnwiVjvBq+pqdRIQ8JO4LL3VnbDokEZFb4t+mSLlF82RIwhbvgnFD6DOoz1E6UeaYQ178QbGHpqT5Rv9B1WjvwlqrD3Nf3tADKSf40AKPDh0R3FZOln1QxYLPtKsxe5DcMkhKilgPGXc1qFgpRH9EXJbOORij7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777994963; c=relaxed/simple;
	bh=0TieyXKnOdgoYsb4LrHmhoONHSkeJZYJJBB5ABuyllc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qajuDL1MgY57OvBM5D9olXm7KwbTX+DRaVgBlFdLBH/FcrtSaI2gCXJAB3FG/kjL9Tg0hnZ3IdQq1+sTUe71MH/w5aMIREIzHMSOGMsEX7L7Kur9VhYcydZqSZ6IzK1bmK7RvcDPsUfFBJqZg3lwuIoE4Xr7bsK31ZNL8vhnEUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KkqRPADL; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KkqRPADL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gH4I8wklCLflkfzmHyAaARB9b66qLAhocjxweDEfGA0=; b=KkqRPADLl5KMCaO7SP0fqJaz0g
	ET5RnraFsOxCgzZIVb1vc8hsvqgH0WW6u35EM76ZWt4EN7gAAZCRL8rYgsK0deWal4XXPzQwnsmEM
	DilTFIh030TjlB1qdx/bOOrnyO/FEMRbwJbV0giy1tQusVCEUW3sbmeAqXm5pJUWLULTyetc40mYQ
	Ft9i/UGJf82smo/bWhENpFcDG5cD//HIcgJC3OXQgfsdUDJ0GeLf0rnKXfIR51tr89FedPeVj6a4N
	flqWgLe+uJIsgDyLcd+CoYTANPi3JZTGkyHzwRsZ847SNzS9opKQRdgV1V7x/nb8k1mx9elxTTzHf
	62lHJVRA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHi3-0000000DsjK-0GN4;
	Tue, 05 May 2026 15:29:19 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 92EB2300324; Tue, 05 May 2026 17:29:18 +0200 (CEST)
Date: Tue, 5 May 2026 17:29:18 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Shubhang Kaushik <shubhang@os.amperecomputing.com>,
	aubrey.li@linux.intel.com, yu.c.chen@intel.com
Subject: Re: [linus:master] [sched/fair]  4823725d9d:
 INFO:task_blocked_for_more_than#seconds
Message-ID: <20260505152918.GY3126523@noisy.programming.kicks-ass.net>
References: <202605052050.8156b7e0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202605052050.8156b7e0-lkp@intel.com>

On Tue, May 05, 2026 at 09:19:49PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> 
> for this change "sched/fair: Increase weight bits for avg_vruntime", we reported
> "[peterz-queue:sched/hrtick] [sched/fair]  fb047eb995: Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]KASAN_PTI"
> in [1]
> 
> but we cannot reproduce the issue in [1] now with same tests and the same
> x86_64-randconfig as the kbuild input config for 4823725d9d.
> 
> however, with another i386-randconfig in boot tests, we found some random
> issues for this change which are clean on parent.

Much of that branch has since made its way upstream -- with various bugs
fixed. Can any of this be reproduced on tip/sched/urgent ?
