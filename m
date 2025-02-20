Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8912202C36
	for <oe-lkp@lists.linux.dev>; Thu, 20 Feb 2025 16:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740069062; cv=none; b=SB7V0uCjm9bUaeGPjzVvE79hNunWlfWhs8sGYgNV4N6YLeGr36lPNLAExLrN5wlXWmeBRnn0+WhEifJaXmDdpVbTf2C0BKCLupKWgnxqsUKGB1ivK0lSvmCw4hWVX7e5qepm9SFnSJ3K734uOpSUgXvU8qQkfvXTSrTDleggUNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740069062; c=relaxed/simple;
	bh=42rqNDCaujYxpOveulSZOy3q1G2V7uMbO/rPRo+TUWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rgd53gXSzfi5WCombDlV+uleW+CNA+8VNNNzJWIwgbQtum/KU5s0o6vMs16hYLDCgJqzUhhCs6My2rKglro7B7X860Mk7U9QtfSG4fGenHw/5RxdMeV3HkdUGpXkkugiZyaUqHWfBUQFpavjGodZX2zerbUEPjvxWDd6HdJ0TR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r2ekOtcb; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r2ekOtcb"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fc042c9290so1957452a91.0
        for <oe-lkp@lists.linux.dev>; Thu, 20 Feb 2025 08:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740069059; x=1740673859; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RunbDwqsCKiDMq6NQxy4XFRnim+xmAlewv0MU2PV7ik=;
        b=r2ekOtcbiuzXd9GGcwV+SAE1Z7Zs8/FqmLjy9/ZLwGskkADoCyMJTbuw1JH3IufgXt
         UVNrWjxnyIPOGo3Bo9ccUvO0cWTwAptOX1uRNfnk2c3BMgkw7NVrN7q4/TzSXhZKiCgb
         zgGxjLxNl9b0atYgAKBZbJC5rMDlvE03m29jnqBcRXADk5gzxM/Bp0cgEh/d01NfmJ6y
         L5mK//rgMlvT66ebKAkTbSSxPVGcglQUecDGdHhaxRFaGE43tMm6wkUMmjK+sxNrfugB
         1koL48quezVSN+t+oiSaDwvgbUAfqz8S1Vpxmm58FuBbJxW/tTPAlSv8Ghj9cq1MVhlp
         WYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740069059; x=1740673859;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RunbDwqsCKiDMq6NQxy4XFRnim+xmAlewv0MU2PV7ik=;
        b=Ln/qlQjdjzWDafma7BSKNWoxCdFmWn+E87LTJ429tlxtfwFclmHFftyYl7ip/W347P
         QaRKrKOUUwtmheSdliNG1QjXp5g1RP/Yf0TEmx4ge/rh5jwLo4Y5Wwq8INSgYfc1z/Q3
         0WdnGAYodoYqlxN+/Z4rHtd0m45RRC8Gom9U9E+XFf4k3S0ctt1rRr6KSEoCAfDCw3Ft
         naMJff6Jl2pGnxw5xaFIH0bptH0NPa6Vj/6cUjmQWaw0nui5gHuHd1TcmMqFbWgoj3Y1
         NLMH4hS3mvn5oy1ID0A9B2o6w7TydIpV9taPy5JaS7XEVd2aZIMtToiarbaSPV5xW+5v
         OnXw==
X-Forwarded-Encrypted: i=1; AJvYcCUxzBBbkVeqeOnY72MlXHLgV1PMN8YxT6FOfOZuu2Sd+k5Agc4LFa8yW4a7Ylp0IH5Dy6pedaE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzmje7cO62YJeq5hP5H88Ulshoee8d/+b9zbyRlX9LnJ3KjJbK2
	cKYEFnp78dS2EUKd3ZUoC7GYbrvG2IYrVTinF8dv1yFfql3tF9XHaYr+035HvZaLKSMPraXJzOQ
	sFwhc/yJJPSBr7Yr1TdfZpLielVQxBwIs08xk
X-Gm-Gg: ASbGncsYlBPprHRgQ13Y0k244s3iTxH8B4lzWGC7vblJgA/bkHPCFJmgimkhjAXNpEH
	TaoC/UlZurp7F8Mrspmi7GB+YDH3yO2tkkIvx3LoBQMuNPHZBBYMzYIuhtbmvptFvnb3hNmTz+P
	UcCMWwcuyPh0ZMZ4wm8jB/XgCKH+4=
X-Google-Smtp-Source: AGHT+IFdqO9ngHYhveH35oJHO22aeobAr6glftEnXejC12aebBifGJtpg6TkKA77hUr2iCeDWZSqoxHWRC4YUmQWiZk=
X-Received: by 2002:a17:90b:278b:b0:2fa:1a8a:cff8 with SMTP id
 98e67ed59e1d1-2fcb5aba7admr13293676a91.29.1740069058693; Thu, 20 Feb 2025
 08:30:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z7bUC9QY815Cv6nb@xsang-OptiPlex-9020> <20250220155722.2Z2a-3z0@linutronix.de>
In-Reply-To: <20250220155722.2Z2a-3z0@linutronix.de>
From: Marco Elver <elver@google.com>
Date: Thu, 20 Feb 2025 17:30:22 +0100
X-Gm-Features: AWEUYZl9XyuxFIVLWSjhfqqO0OUA4wn0EYnMOUYAgeDjJV6JjoSIe-IH-I10jY8
Message-ID: <CANpmjNN9zpcPa4S+Zq+vJWJ3EcO0zCZJ=Z4FgNzDRXdi0YQA9g@mail.gmail.com>
Subject: Re: [linux-next:master] [x86] 66fbf67705: kernel-selftests.kvm.hardware_disable_test.fail
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Oliver Sang <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Petr Pavlu <petr.pavlu@suse.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Kees Cook <kees@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Waiman Long <longman@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Feb 2025 at 16:57, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
[...]
> Now. Based on this:
> The RCU read section increased the runtime (on my hardware) for the test
> from 30 to 43 seconds which is roughly 43%.
> This is due to the lockdep annotation within rcu_read_lock() and
> unlock() which is not existing in preempt_disable(). After disabling
> UBSAN + KASAN  the lockdep annotation has no effect. My guess that
> UBSAN/ KASAN is in charge of countless backtraces while enabled. Those
> backtraces seem to be limited to the core kernel.
>
> How much do we care here? Is this something that makes UBSAN + KASAN
> folks uncomfortable? Or is lockdep slowing things down anyway?

Does this series from Waiman help?
https://lore.kernel.org/all/20250213200228.1993588-4-longman@redhat.com/

> If so, we could either move the RCU section down (as in #5) so it is not
> used that often or go the other direction and move it up. I got this:
> | ~# time ./hardware_disable_test
> | Random seed: 0x6b8b4567
> |
> | real    0m32.618s
> | user    0m0.537s
> | sys     0m13.942s
>
> which is almost the pre-level with the hunk below after figuring out
> that most callers are from arch_stack_walk().
>
> diff --git a/arch/x86/include/asm/unwind.h b/arch/x86/include/asm/unwind.h
> index 7cede4dc21f0..f20e3613942f 100644
> --- a/arch/x86/include/asm/unwind.h
> +++ b/arch/x86/include/asm/unwind.h
> @@ -42,6 +42,7 @@ struct unwind_state {
>  void __unwind_start(struct unwind_state *state, struct task_struct *task,
>                     struct pt_regs *regs, unsigned long *first_frame);
>  bool unwind_next_frame(struct unwind_state *state);
> +bool unwind_next_frame_unlocked(struct unwind_state *state);
>  unsigned long unwind_get_return_address(struct unwind_state *state);
>  unsigned long *unwind_get_return_address_ptr(struct unwind_state *state);
>
> diff --git a/arch/x86/kernel/stacktrace.c b/arch/x86/kernel/stacktrace.c
> index ee117fcf46ed..4df346b11f1e 100644
> --- a/arch/x86/kernel/stacktrace.c
> +++ b/arch/x86/kernel/stacktrace.c
> @@ -21,8 +21,9 @@ void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
>         if (regs && !consume_entry(cookie, regs->ip))
>                 return;
>
> +       guard(rcu)();
>         for (unwind_start(&state, task, regs, NULL); !unwind_done(&state);
> -            unwind_next_frame(&state)) {
> +            unwind_next_frame_unlocked(&state)) {
>                 addr = unwind_get_return_address(&state);
>                 if (!addr || !consume_entry(cookie, addr))
>                         break;
> diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
> index 977ee75e047c..402779b3e90a 100644
> --- a/arch/x86/kernel/unwind_orc.c
> +++ b/arch/x86/kernel/unwind_orc.c
> @@ -465,7 +465,7 @@ static bool get_reg(struct unwind_state *state, unsigned int reg_off,
>         return false;
>  }
>
> -bool unwind_next_frame(struct unwind_state *state)
> +bool unwind_next_frame_unlocked(struct unwind_state *state)
>  {
>         unsigned long ip_p, sp, tmp, orig_ip = state->ip, prev_sp = state->sp;
>         enum stack_type prev_type = state->stack_info.type;
> @@ -475,9 +475,6 @@ bool unwind_next_frame(struct unwind_state *state)
>         if (unwind_done(state))
>                 return false;
>
> -       /* Don't let modules unload while we're reading their ORC data. */
> -       guard(rcu)();
> -
>         /* End-of-stack check for user tasks: */
>         if (state->regs && user_mode(state->regs))
>                 goto the_end;
> @@ -678,6 +675,13 @@ bool unwind_next_frame(struct unwind_state *state)
>         state->stack_info.type = STACK_TYPE_UNKNOWN;
>         return false;
>  }
> +
> +bool unwind_next_frame(struct unwind_state *state)
> +{
> +       /* Don't let modules unload while we're reading their ORC data. */
> +       guard(rcu)();
> +       return unwind_next_frame_unlocked(state);
> +}
>  EXPORT_SYMBOL_GPL(unwind_next_frame);
>
>  void __unwind_start(struct unwind_state *state, struct task_struct *task,
>
> Sebastian
