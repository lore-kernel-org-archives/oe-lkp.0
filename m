Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524BC2DA756;
	Fri, 12 Dec 2025 10:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765534373; cv=none; b=pBiWHMgJuPoR4JjIUv3Y8pns+g4J4Ea/YBGd9xtCN84iJ5hLdd3dMAyOlziRexpHYQgxjVkWEfJqtUzpEBgA1YamD0tSdZ6DARrozK229af6UAgyYo/oqRI6MD8pOLiRRaXAewI+UeWNH2s9nxvASsJGyBpO1d9oJ6JwA0LQd3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765534373; c=relaxed/simple;
	bh=Lx7fa+da/l/Muw77LD8HStvCBRFvnHha1E+tBw3+KrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjo2dWr9oj3r73/VVbqUYWAbvR0UKDv6kXyoiXk0XdgkCSQB2K5RcMR65HxnzOWFmQeYVHcMI+9uG+7rBbN4VQwUy9UY3z8IIgORFdJTRPhpQqk7KkR2wyFl/W183OAfw8IwWQu6nW6reBa13gPXLj99fQlObzMjaM/lQIVKhI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vvGd01FA; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vvGd01FA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=K1zeYJwo4Cutx0yW49nwHa4Jh5jlsZldmhkcqRuk08w=; b=vvGd01FA0NgE7pX/vOUYl1W0MW
	pLQNivCvOfCc1KPa919WZiGcDebYYKsnL4OrbjykHWHRTL5DaDDX7yBnieh/Oto67Psu7Gd975Icv
	wRzVUMOJ0yZtPBzzjvXBYVcP+EV8vgCIRWVajICIn/LqTtx/0ukQA0uXvwm433LFUeImxviSTBhY9
	6V7KvHA94De6grtwBDl3u/cHW00BCfild+naP5WdnqmAzssYRWizgtx+NmOjchiERY8ihuWa1mmIX
	cc3nHE+4TW4258C2uyqum5uWaPzkl6zdaggKnxy7Oe4McbEp5LH+sxHUpyYi8KYDQe6Qrer8TooiS
	VDrXk6/g==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU08j-0000000FWRM-2pQ4;
	Fri, 12 Dec 2025 10:12:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9689830057E; Fri, 12 Dec 2025 11:12:44 +0100 (CET)
Date: Fri, 12 Dec 2025 11:12:44 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: Fernand Sieber <sieberf@amazon.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	aubrey.li@linux.intel.com, yu.c.chen@intel.com,
	Ingo Molnar <mingo@kernel.org>
Subject: Re: [linus:master] [sched/fair]  79104becf4:
 stress-ng.resched.ops_per_sec 44.6% regression
Message-ID: <20251212101244.GN3911114@noisy.programming.kicks-ass.net>
References: <202512112111.39299a7e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512112111.39299a7e-lkp@intel.com>

On Thu, Dec 11, 2025 at 10:21:15PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a 44.6% regression of stress-ng.resched.ops_per_sec on:
> 
> 
> commit: 79104becf42baeeb4a3f2b106f954b9fc7c10a3c ("sched/fair: Forfeit vruntime on yield")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

After nearly 2 decades of telling people that using yield() is UB
(except in the Real-Time cases where it is well defined), I'm >.< close
to not caring about this.

IIRC this benchmark is literally something like running yield() in a
loop, so boohoo. I'll look when there's a real workload that has a
problem.

> [still regression on linus/master      cfd4039213e7b5a828c5b78e1b5235cac91af53d]
> [still regression on linux-next/master 82bcd04d124a4d84580ea4a8ba6b120db5f512e7]

What's with the still? AFAIK this is the first report of this.
