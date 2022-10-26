Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C75C1110
	for <oe-lkp@lists.linux.dev>; Wed, 26 Oct 2022 12:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WFuwKRj5ieiG9zZalI44hZHnvMktBSX/ulFa4LnilFc=; b=edYXojBw2zIDgUcUoOS5aTgGC2
	/0EvDQAa3t329IosXG1ec+D+RZOZQuycheelpRssyxbESWCnubFe3gMxaBuATuL5VnlfAohk7vj43
	Pyj49VRgIxu59grEgYlIK0N+vMxrIRJ/v/XMYO1CWhmD8iv13+BoWlgY97Z7Iz+daImQBwRENR0QB
	+Q8MkPiBIBjiW1jyyKIqw+G9Rr+AZWMeYKVhaVZ6H/uD6VW1pFtEaEXI9lcGYRBjoh+/vFANYmyaa
	kyg/W+IjF7VQ6r8FCq1dyVaJYWsd3gYmbwrUQAGhqrTuMNMHWp/D+VGO/aKJIiETRfv2QKiLPDGrz
	SG2mhwNA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onfAt-00GyiO-Rk; Wed, 26 Oct 2022 12:06:23 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 98638300205;
	Wed, 26 Oct 2022 14:06:17 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4DB532C26AB90; Wed, 26 Oct 2022 14:06:17 +0200 (CEST)
Date: Wed, 26 Oct 2022 14:06:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <yujie.liu@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	x86@kernel.org, fengwei.yin@intel.com, ying.huang@intel.com
Subject: Re: [tip:x86/core] [kallsyms] f138918162:
 WARNING:CPU:#PID:#at_fs/xfs/xfs_message.c:#xfs_buf_alert_ratelimited.cold-#[xfs]
Message-ID: <Y1kiuTIYobR4nexS@hirez.programming.kicks-ass.net>
References: <202210241614.2ae4c1f5-yujie.liu@intel.com>
 <Y1kDEmLeRA2UGeF8@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1kDEmLeRA2UGeF8@hirez.programming.kicks-ass.net>

On Wed, Oct 26, 2022 at 11:51:14AM +0200, Peter Zijlstra wrote:
> On Wed, Oct 26, 2022 at 05:10:28PM +0800, kernel test robot wrote:
> > Hi Peter,
> > 
> > For below patch, we couldn't find any connection between the code
> > change of kallsyms and xfstests testcase, but we got very stable test
> > results. We tested commit f1389181622a and its parent commit
> > 7825451fa4dc for 12 runs each, parent was 100% good while this commit
> > was 100% bad, so we still send out this report FYI though we don't have
> > clear clue of the root cause. Please check the details below if
> > interested in further investigation. Thanks.
> 
> *groan* I'll go have a poke.
> 

dmesg starts at 42 seconds, you don't happen to have a complete one?
