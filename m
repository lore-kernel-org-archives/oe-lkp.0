Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1A632F765;
	Fri, 24 Apr 2026 09:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024528; cv=none; b=mgEV6QyEujAXkF5oEruOLwU5IezaKQQe8h5FPdclGY3AUEpLMpErzWLYca5lL4x5D5BP77GKotm4ysOmLawVFNk4xMfZieljcnkmzSWZWhluCG3wrhhQiNvtmcAxlHF7FZcGOR0evmQfmGtiD813F5zQ1MTCgbZ/egwUilrBXWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024528; c=relaxed/simple;
	bh=B+3VBIk4qmI6ZFVHKHZJVYjnsomsgtk3uTy0nU5PpDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BiMPLsKP9Tqa5y6J+hOosrrAXAWt6gYmapnRrcGaFX1P1lFnyIvZMc8qKwWsRHYy1LdR5aHFoGBaywpayYnx+B+AASITYM0GE1Om6xR8N541gGzBW+EAjTmZiaPkl32eUqjBcsWJ7XBF2RYcP532gN4/JW+gxLcmNNgbnQxES2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JX/NmvwL; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JX/NmvwL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yTZeL8gIFJiYZDye2bbHTw0xhW2aKuxmuu1CaFtu798=; b=JX/NmvwLQuDJZSqHhjM6CL1hBL
	EtcmuZdffYsJjWoySfRWVyarSEDAqh7gL3QxCdXnmEMzpjRyJ6T37gY1NqlV8cAmkEL7krhRNxRZ/
	tYda3xpkluwJ343rdxgS1KCXKYIfNtgp/zYxl3C2Iio10UrxeImXc2WV4ZvNaHR1N6MsowDytNMw0
	tvQOgsL4KgwQq+CJXRwkGA0wbKGKsAQO3VGaCkpbrbqqE29EBHNXzzPF3/FObwpzwZKdtBeYN8uny
	go7X4VUgKSrSDbPJ5wyRaG4k+b4kZfvigqngdn/j45gAEyiU99L3S4GS1ld/WGlD1+ursIjH5FFxM
	zpqEDtVw==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDFr-0000000EX6V-24D3;
	Fri, 24 Apr 2026 09:55:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1015630301B; Fri, 24 Apr 2026 11:55:23 +0200 (CEST)
Date: Fri, 24 Apr 2026 11:55:23 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	aubrey.li@linux.intel.com, yu.c.chen@intel.com
Subject: Re: [linus:master] [sched]  96d1610e0b:
 will-it-scale.per_process_ops 2.8% regression
Message-ID: <20260424095523.GE3126523@noisy.programming.kicks-ass.net>
References: <202604241448.365c92f9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202604241448.365c92f9-lkp@intel.com>

On Fri, Apr 24, 2026 at 03:10:07PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a 2.8% regression of will-it-scale.per_process_ops on:
> 
> 
> commit: 96d1610e0b20b5a627773874b4514ae922ad98f6 ("sched: Optimize hrtimer handling")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> [still regression on linus/master      1d51b370a0f8f642f4fc84c795fbedac0fcdbbd2]
> [still regression on linux-next/master 936c21068d7ade00325e40d82bfd2f3f29d9f659]
> [still regression on fix commit        eef9f648fb0e92618041f019d4bdcf7ae17cb743]
> 
> testcase: will-it-scale
> config: x86_64-rhel-9.4
> compiler: gcc-14
> test machine: 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz (Ivy Bridge-EP) with 64G memory
> parameters:

So this commit has lived in private trees (tglx and mine), has been in
tip, in next etc. *WHY* do we only get this report now?

This isn't the first time I see a regression report after things have
hit Linus' tree. This is starting to get really annoying. The point of
having this robot was to catch issues *before* they hit Linus, no?

That said, looking back at will-it-scale reports, 2.8 seems to be pretty
much in the noise range, no?
