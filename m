Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A811A15AC
	for <oe-lkp@lists.linux.dev>; Fri, 28 Apr 2023 10:31:22 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1682677875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K47gVx53MTTYILW/qKnRfl67osL8c/bFzLtOY/0r1ho=;
	b=j/64qiVIJXv7NSxBhDqv355B1ll6CtLRX6dhSfIE9e3izMI92PdihwHyZmR1qdXIpgGaBx
	LVMby8XeR3gV538X6lMM9CvinTe5VDuxe3gXFaWirQpBJqYBEtxCTZedleeWLos77ySrWj
	hA5FwvSlV/Tat6UYVbSsak/Q0caKbsF1HBOs5ejW+QnMAdiLfdjWwDlp7NTfb43FlUwAOE
	aVTYrTb7Fg/EMnczX0uV7EiSLffTVlKT3DMEihpfrfwgkHbJctj1RGHYWyyA6oAWcZHNL2
	Di4SniOm6kOVGuRcy9LLIswrHF7J6AD2/h7F4/XEH42xiivjAO3g3La5P74e6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1682677875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K47gVx53MTTYILW/qKnRfl67osL8c/bFzLtOY/0r1ho=;
	b=LKWNOG69pHY6Bok4x1hyaKIZrnHZmvOdts+TS5P2T75fXWDOa38xcuGCmJOaEsANXP1JOH
	IgfkjcYM7nbSLpCg==
To: Yujie Liu <yujie.liu@intel.com>
Cc: Shanker Donthineni <sdonthineni@nvidia.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org, Marc Zyngier
 <maz@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michael Walle <michael@walle.cc>, Vikram Sethi <vsethi@nvidia.com>
Subject: Re: [PATCH v3 3/3] genirq: Use the maple tree for IRQ descriptors
 management
In-Reply-To: <ZEsiYbi8dorXTI5t@yujie-X299>
References: <202304251035.19367560-yujie.liu@intel.com>
 <87a5yuzvzd.ffs@tglx> <ZEsiYbi8dorXTI5t@yujie-X299>
Date: Fri, 28 Apr 2023 12:31:14 +0200
Message-ID: <877ctw5mdp.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Yujie!

On Fri, Apr 28 2023 at 09:33, Yujie Liu wrote:
> On Wed, Apr 26, 2023 at 02:08:54PM +0200, Thomas Gleixner wrote:
>> Can you please retest this on v6.3 and report back when the problem
>> persists?
>
> Thanks for your help looking into this problem.
>
> The problem persists when tested on v6.3, but not 100% reproducible.
> We ran the test on v6.3 and v6.3+patch each for 20 runs. There are 9
> failed runs on v6.3+patch, while v6.3 is all clean. Full dmesg is
> attached.

Under the assumption that the code is correct, then the effect of this
patch is that it changes the timing. Sigh.

  1) Does this happen with a 64-bit kernel too?

  2) Can you enable the irq_vector:vector_*.* tracepoints and provide
     the trace?

And please provide /proc/interrupts from that machine.

Thanks,

        tglx
