Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7483130F53E;
	Wed,  5 Nov 2025 11:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762340609; cv=none; b=s2/QfAWUx1EcP85sW6E/JwSyEu9V1teKrzeyW/aGtqldvNpdAfVxr7XqUALNSOrbEnNyZsRuCSYDO4dk6iUQ13HVMssZNaSpJtJkO2egzHjYaiq1N2xFJEm1UH0mfYOAPSgltRvGEmHMZfYN8oARAkK4XOAUiUw6zoHQ/jnfg2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762340609; c=relaxed/simple;
	bh=tAd9oj4GERMTGuDoDW0cfUawpZHiAQD5J0YJbAcPuN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WvtiTQvth/AFlGbGkDLs294h4kmi1n6oJQhnQolg+X3MrpH045u15jyFOl8ger1fAixYfcVpp64AfNyWubI+u2Uww57b0h3POyTfRB23GQZjSVEIsG2WVT73AsnXY6F/qz4xzjpuyLJD8WUEMn6krNZzuOUzphqvMOE6KW7Qf1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=op+lubN6; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="op+lubN6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aP4cCfAyhuWBajIhwXSDkRwzA8AewSKAd6qPPvdJB5o=; b=op+lubN6NntcrOA0lxB0gorqPg
	no9/ehK2prb3lQ4fms5AIeCiW0W/48Re/qKwn+CZEyTMJs9u1SU72Tgryy7O7niovykam5uDfSaG9
	5uCY4m5GcbLNaB3PdlinN+iU20OV/szPYubop5Du1yac71dNzlGAhpHQlZWF6MDZ5RAFc8/mUfCS/
	IrwhyqxFaIuvthRblzp+iEMq+6v+B5vEO56KGmIk2WxkzdM6Mz0ewO5NTld5SP0RU9Sxua4vSubJw
	NFNZqbmkJPKZcEZKApyyOrCvKoBX5W8UsMsZWFixBS0UEeiqupvecFI332F7Rb4Hn7ffxCwkpQrTO
	TwFN7R1Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGbIQ-00000003lyh-2Frv;
	Wed, 05 Nov 2025 11:03:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 502F4300230; Wed, 05 Nov 2025 12:03:23 +0100 (CET)
Date: Wed, 5 Nov 2025 12:03:23 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Fernand Sieber <sieberf@amazon.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org,
	aubrey.li@linux.intel.com, yu.c.chen@intel.com
Subject: Re: [tip:sched/core] [sched/fair] 79104becf4:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <20251105110323.GJ988547@noisy.programming.kicks-ass.net>
References: <202510211205.1e0f5223-lkp@intel.com>
 <20251104210456.652800-1-sieberf@amazon.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104210456.652800-1-sieberf@amazon.com>

On Tue, Nov 04, 2025 at 11:04:55PM +0200, Fernand Sieber wrote:
> Hi Peter,
> 
> I spent some time today investigating this report. The crash happens when 
> a proxy task yields.
> 

Ooh, nice!
