Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EBA22127E
	for <oe-lkp@lists.linux.dev>; Thu, 24 Apr 2025 16:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745510895; cv=none; b=tnk9H1KMBX2+uGDSTwz6VjtPzyFEu9lSPmfuFEOC3juiUZZvhfxqd5jyBvfK9Ad7UG+baMNxvfajewAkKthFwVgHoMzOlyI6EErb6MQufkCnBfHiLnVPapxnCwo9JyWgxbn/7YZLYje/1Q2hTOWVQGoU1VhJ9PMH5dYsqpurFCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745510895; c=relaxed/simple;
	bh=uYWmPDd6dGCG5UIqLBjzPijQmOpSj8ZY1AFu91nEB8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pPTvWfT1e1/kpzGHn4ZNDbi1Ia7dZKjhk7R9r7lh+5eLZaz4C5eKKHwPnkJzdtdetG7fxNQN4FX32CxeJSRD6ue/u7EI+aabU8mU5GIJATPwzQyxfMVbbMFj1ecnAgZmeFOHXjZA8/XJr6Y+7CD1i3xrXrccO/QmvVeBDXvEC7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RxL7dNak; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RxL7dNak"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so2232640a12.0
        for <oe-lkp@lists.linux.dev>; Thu, 24 Apr 2025 09:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745510891; x=1746115691; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kBzGqlReJRCvZloMhkbm/qwk3PtByoa/h3b9iiRxguw=;
        b=RxL7dNakJVmXq8BFLlPSAiwZAaw5T8P2/TsWLf66chCm3xWrdgBHlJTMyBMXRqu0ew
         zjM/79azrZiiXSuBdxH1jReoyp8Q1qq0DLv8jrYXoGbb6maQCOrkBLU53LqBJ2pHr9rn
         N7ZkL6rJdZC3q9urpfx7CeVxSQ5Wrp9/m2UIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745510891; x=1746115691;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBzGqlReJRCvZloMhkbm/qwk3PtByoa/h3b9iiRxguw=;
        b=aZjV2TDDKsuu/j6PEDO8LtKrC5eWHUOnBT6qwsmNlz9ABn0veCu1HbIAf1DkFC5O9B
         lGhSzTHVBM9VAlfwpELmwH+E7kooocJVMhCaahmdcQHlh1M0fUifoAqJeDZm6wvLUMAJ
         erajpBOuqMhkzVOzKSnl64ZmsK5SNojUo+pLNvXtpXPdn7obgZ0WmzJh0Mvg8PrAvV0v
         lTop8tnLLYfcEcDnxQMv75Kk+D7+8+lhdrVDGMCDMzj0olKtN7IRSHM7ByVlT5YyR81v
         x230xv/Rm+V6xgGE15AUstcHvg4i9MldgXIQaxBKwkkZcH+Z2PwKno50A5S97FoJZT6r
         9e/w==
X-Forwarded-Encrypted: i=1; AJvYcCUTY1dKSVnIGD1yvbYfgMNzVSTcZz4GwECHHqJ7/8EBS0WEJyJ9hlutwbASZX7S+ODcSiTOrl0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTeVjfPA1Fx6DUESMePqDdEqQDftWCS10eDOyI1GBOQNwTMA1V
	hnmwG5MhfKhtFAi6dDvEWCwJYHlwkjl4huq/sNGFT4kUbI1NKiRPkamHK/pwBbU+2wDAb5ORx6l
	JkOo=
X-Gm-Gg: ASbGncvPeCuYe63lhzPOvBlxHpK9ECIUODmU3dB6/gs/8tFRToD66Grde/5W2IUNGvQ
	ra13ca5Ux81yG9Trl55QZwfpobvoKo8PMFNV7Fq/rcofCwhWdDSaisWloe9xXQVyBCntebgGQ0V
	qnqOQb4O/B4qFcSKZODNavlQi5jiXHtHPe+clp/PV9Rl4RMKZOhOatqoGQr07hi77FtGxetZTGo
	QwrN04WEpbnIh1Awi31eMzMyNLHgb2CC04+5l6vsGEuSNycym9Ucgt74bPbYcbPSDG2AMxiwpfA
	WJKUBiRfoU7jZJv9sFBjs6pbsTVoZr9RpYc0iY5MbCCJNjUEwX7TcmFVvk4bZgSDSTVl3alN9Up
	rIL5VmD8DiUyeUg8=
X-Google-Smtp-Source: AGHT+IGV9mRvQvEdF68K7FdupIXrfpdcM8xxoHc5vd5QH6+ur/eS+lrX/jeWPOkczpt7sEEYtG2Plw==
X-Received: by 2002:a17:907:7210:b0:acb:94d6:a841 with SMTP id a640c23a62f3a-ace6b3cd385mr19820566b.16.1745510891073;
        Thu, 24 Apr 2025 09:08:11 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59899a0asm129498866b.52.2025.04.24.09.08.08
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:08:08 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-acb415dd8faso192417666b.2
        for <oe-lkp@lists.linux.dev>; Thu, 24 Apr 2025 09:08:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRSO6t/uFDLcnXTeRDFbHWaWO7EszFxnIXCrSf3aXsQPL+6oyvUQwBVpfdeRzD+3UH/TxuhV4=@lists.linux.dev
X-Received: by 2002:a17:907:9803:b0:aca:e2d9:41f with SMTP id
 a640c23a62f3a-ace6b741e5bmr13129366b.60.1745510887699; Thu, 24 Apr 2025
 09:08:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202504211553.3ba9400-lkp@intel.com> <59198081-15e2-4b02-934f-c34dd1a0ac93@app.fastmail.com>
 <aAmeJmL0hUx2kcXC@xsang-OptiPlex-9020> <f1ccb8b4-bbe2-42bc-bb86-c2bf3f9c557d@app.fastmail.com>
In-Reply-To: <f1ccb8b4-bbe2-42bc-bb86-c2bf3f9c557d@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 24 Apr 2025 09:07:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi6k0wk89u+8vmOhcLHPmapK13DDsL2m+xeqEwR9iTd9A@mail.gmail.com>
X-Gm-Features: ATxdqUFWu0hKLhcTGhg8mlyRmmQ2N2zZFRhSbIjzH-PLZ1yO8QAM-8GtVZ65lIc
Message-ID: <CAHk-=wi6k0wk89u+8vmOhcLHPmapK13DDsL2m+xeqEwR9iTd9A@mail.gmail.com>
Subject: Re: [linus:master] [x86/cpu] f388f60ca9: BUG:soft_lockup-CPU##stuck_for#s![swapper:#]
To: Arnd Bergmann <arnd@arndb.de>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, 
	Ingo Molnar <mingo@kernel.org>, John Stultz <jstultz@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Apr 2025 at 01:01, Arnd Bergmann <arnd@arndb.de> wrote:
>
> Thanks for confirming. So a 486-targeted kernel still passes
> your tests on modern hardware if we force TSC and CX8 to
> be enabled, but the boot fails if the options are turned
> off in Kconfig (though available in emulated hardware).

I wouldn't expect CX8 to really matter - it causes us to generate
extra code to pick one over the other, but on modern hardware we'll
still always then dynamically pick the cmpxchg8b instruction.

Could it trigger bugs in our alternatives, or some miscompilation due
to the extra complexity? Sure. But it does sound unlikely.

> To be completely sure, you could re-run the same test with
> just one of these enabled, but I'm rather sure that the TSC
> is the root cause.

Agreed.

Particularly when the lockup is then in timekeeping_notify() during
the initial initcalls -> clocksource_select(), I'm pretty sure this is
purely about TSC.

That said, maybe the problem is in the watchdog logic, because
clocksource_done_booting() is what starts the watchdog thread .

So it might be the watchdog code itself that then gets confused
(because of some "don't use tsc" case that never gets any testing in
real life) and triggers immediately - and then points the finger at
the clocksource code only because that's what is still running.

Because CONFIG_X86_TSC does cause some oddities: we end up still
*using* the TSC for many things if the hardware supports it (which
modern hardware obviously does), but then other things get disabled
entirely.

For example, this:

  /*
   * Boot-time check whether the TSCs are synchronized across
   * all CPUs/cores:
   */
  #ifdef CONFIG_X86_TSC
  extern bool tsc_store_and_check_tsc_adjust(bool bootcpu);
  extern void tsc_verify_tsc_adjust(bool resume);
  extern void check_tsc_sync_target(void);
  #else
  static inline bool tsc_store_and_check_tsc_adjust(bool bootcpu) {
return false; }
  static inline void tsc_verify_tsc_adjust(bool resume) { }
  static inline void check_tsc_sync_target(void) { }
  #endif

So that tsc_store_and_check_tsc_adjust() thing etc never gets run,
even though we actually *do* use TSC for get_cycles() and friends,
because *that* code checks the runtime status too:

Now, none of that should matter - because all *those* things are about
details that simply aren't relevant for any of this case - but maybe
there is some other situation that has similar "I'm actually using the
TSC through get_cycles(), but I didn't do some setup because X86_TSC
wasn't on.."

I really get the feeling that it's time to leave i486 support behind.
There's zero real reason for anybody to waste one second of
development effort on this kind of issue.

                   Linus
