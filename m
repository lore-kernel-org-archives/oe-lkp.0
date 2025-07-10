Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B5B284B2E
	for <oe-lkp@lists.linux.dev>; Thu, 10 Jul 2025 06:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752128733; cv=none; b=Iw9E5RIdLeE79G7rIqt7I4wcSfgoSJHpWrRGTkywaLJN5LWryUJQPxCyvpcDSb3N7obBGqiMSIENQ85+tGx9LEEHxRpNVYixHZgLcHo8LvXebuifs70dNXUu8oHSgDwAANAdVqLU9dazoiuSUXMBDlURNbHy59Iuzph9pfMzLzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752128733; c=relaxed/simple;
	bh=fyn8/DNWLIsd9t0oMmW8J9l8ppoI1NlcSDmv2mq3kPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YpBfwL/Y5UKOcwVwV/yNMU430pka4ExPTbntkiywNGLHrHTMGcizOpjB8FrhJVdPm7oLNruNXQeOOtINC34qcdc1NAqni/QHBZ3TD9mQXwNLsF7vRX1SRlxKk9IGxK0P8CvzKy2RWibvdlkDF+RgSY9fP5duwpWTVuSvucUJZZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Bz8JoEF2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Nn48+kOr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Bz8JoEF2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Nn48+kOr"
Date: Thu, 10 Jul 2025 08:25:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752128730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KbCDcUtVqOAXFKXfBLbknC1kvlUvsHQ3VNEwGZ+wbhM=;
	b=Bz8JoEF2U3woWtE1IHbzOcZD9RC3cPv6DG0QHcflDajJep+yyZX/uyrxk3dCRT5HwZ7Wvh
	/gA4H2TL4c31KDTuIEwBQIMRzKNyOqDDYI1YTptgpvzrf8LOVxbriTa0zwVhsNlWTbu8Ln
	Ibs5hWlI1aVxYKGXzWgTWPmf03Dgjq+WoFTqgaFStq8nCIbYkeLubWBCDytgr762vu2Omp
	dF/0CLkWqYkZ8wnzSOWQvgfVOLpp/aQJbxf3IbtbmatLk/G9lMcrGA74vUmQn7hPhetgXa
	Ws5LTsRXsse/QfLO4NNnodBYHSO49PEGBR7eyjlw92s4uSNYs9V+KgoQkqbfIg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752128730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KbCDcUtVqOAXFKXfBLbknC1kvlUvsHQ3VNEwGZ+wbhM=;
	b=Nn48+kOrSGm0FtyUL2v6xLIqd1o7KcREIFqvLENmM46rhXQuXcVqTzIsZL+YCIfPIf4sKR
	CvQ2oMpsVcpy2hAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: kernel test robot <oliver.sang@intel.com>,
	Ingo Molnar <mingo@kernel.org>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mel Gorman <mgorman@suse.de>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	aubrey.li@linux.intel.com
Subject: Re: [tip:sched/core] [sched/smp] 06ddd17521:
 BUG:using_smp_processor_id()in_preemptible
Message-ID: <20250710062528.T-Obm39T@linutronix.de>
References: <202507100448.6b88d6f1-lkp@intel.com>
 <6cf071f3-ff5b-4025-8ce7-2f2cceb03984@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6cf071f3-ff5b-4025-8ce7-2f2cceb03984@intel.com>

On 2025-07-10 11:18:29 [+0800], Chen, Yu C wrote:
> > [ 25.235357][ T1] dump_stack_lvl (lib/dump_stack.c:123 (discriminator 1=
))
> > [ 25.235357][ T1] check_preemption_disabled (arch/x86/include/asm/preem=
pt.h:85 lib/smp_processor_id.c:53)
> > [ 25.235357][ T1] __kvm_is_vmx_supported (arch/x86/include/asm/cpuid/ap=
i.h:74 arch/x86/include/asm/cpuid/api.h:113 arch/x86/kvm/vmx/vmx.c:2789)
> > [ 25.235357][ T1] vmx_init (arch/x86/kvm/vmx/vmx.c:2808 arch/x86/kvm/vm=
x/vmx.c:8653)
> > [ 25.235357][ T1] vt_init (arch/x86/kvm/vmx/main.c:1072)
=E2=80=A6
> I took a glance at the warning, before this patch,
> is_percpu_thread() always return true when CONFIG_SMP is not set.
> After this patch,
> is_percpu_thread() checks the current task's CPU affinity.
> So debug_smp_processor_id() -> check_preemption_disabled() ->
> is_percpu_thread() might not always return true anymore, which caused
> the warning.
>=20
> Actually the issue is in __kvm_is_vmx_supported(), should
> we use something like this below:

No, it should not. If you look closely you will see that the call chains
is
   vmx_init() -> kvm_is_vmx_supported() -> __kvm_is_vmx_supported()

There is a migrate_disable() around __kvm_is_vmx_supported(). So why
does this warning trigger then?

Sebastian
