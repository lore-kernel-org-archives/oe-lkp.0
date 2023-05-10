Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48CC8F43
	for <oe-lkp@lists.linux.dev>; Wed, 10 May 2023 14:41:12 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683729670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x2Qh6i4Y+AB0pDG6u/iYkTlhIK7xQT7b36qrwW0oarA=;
	b=3uewY1C7KOXhSuvl1De6gi9NZzV1cOm2flGjELQem0gRhXBtDrycninQeL2Hb5GoZqUghu
	Q3oIOJ7LuWlrUZNJb49WBmLVqxGGRRjwEdJqXXKyJwISvxUY15uqXaksugkuxxtHJ6zMkN
	qB3Kw9vI9J5XN4gkEkMuH8o6dC7z32+ZO14zUMnO7GzPFU30ia2QjdVLbRcAcdCSNvOpf6
	RHBxQDn2l3AhPhbwQgsCaQDWTN6dFl0OvydSLDvQ31SB+gUn32Bn72ZPdvrSUEOAtng7Nw
	vdDW5yBX+VyAiaqI1rT2Zuas5x/ecR2IGvrAWtEjjMrtc5fCjrNoOer2NdkeJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683729670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x2Qh6i4Y+AB0pDG6u/iYkTlhIK7xQT7b36qrwW0oarA=;
	b=trce9v7ndgkCG97sqWC7ONvp59REw9dhfEULHP6zIDcTMl2qCslDv1Sgd1Z9B61gH70GKw
	U2qDk7+OkSfqxbAw==
To: Yujie Liu <yujie.liu@intel.com>
Cc: Shanker Donthineni <sdonthineni@nvidia.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org, Marc Zyngier
 <maz@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michael
 Walle <michael@walle.cc>, Vikram Sethi <vsethi@nvidia.com>
Subject: Re: [PATCH v3 3/3] genirq: Use the maple tree for IRQ descriptors
 management
In-Reply-To: <ZFtGvfDFLyHeFVFH@yujie-X299>
References: <202304251035.19367560-yujie.liu@intel.com>
 <87a5yuzvzd.ffs@tglx> <ZEsiYbi8dorXTI5t@yujie-X299> <877ctw5mdp.ffs@tglx>
 <ZFdbtipfTsIF0u6z@yujie-X299> <87mt2f2mhm.ffs@tglx>
 <ZFtGvfDFLyHeFVFH@yujie-X299>
Date: Wed, 10 May 2023 16:41:09 +0200
Message-ID: <87ttwkxn96.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Yujie!

On Wed, May 10 2023 at 15:24, Yujie Liu wrote:
> On Mon, May 08, 2023 at 11:36:37AM +0200, Thomas Gleixner wrote:
>> Ok. So one difference might be that a 64 bit kernel enables interrupt
>> rempping. Can you add 'intremap=off' to the kernel command line please?
>
> Sorry, my previous info was incorrect.
>
> The block/008 (do IO while hotplugging CPUs) failure also happens on a
> 64-bit kernel no matter having 'intremap=off' or not, and persists when
> tested against v6.3, but the warning in default_send_IPI_mask_logical
> function is not triggered on a 64-bit kernel. Not sure if that function
> is 32-bit specific since it is set in arch/x86/kernel/apic/probe_32.c.

Ok. That makes more sense as the issue is clearly independent of 32 or
64 bit.

I decoded it by now and that maple_tree conversion is the culprit. It
broke irq_get_next_irq() which is used during hotplug. It misses every
other interrupt, so affinities are not fixed up.

Please ignore that series.

Thanks a lot for your help!

       tglx
