Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC8A168BD
	for <oe-lkp@lists.linux.dev>; Sun, 31 Aug 2025 19:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756669740; cv=none; b=aLTRSOce9x/jT8kVCAp5i3yAWdn0t6/48GnudaETsaGerj/n1zoad2Dz7g1VaJ2xlK+1WtYpIkiySkjfrNYbowYtRrZxMbjviEui0/ogkVEDHEiE7Uukn6AS4Y1bb9HlcSTC6Vi2rBh/UZ4xYKutxHtBYXN0PKtF9m3fNc1IKoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756669740; c=relaxed/simple;
	bh=AoQgcBbEVxyLf7vnZ/XJPMp1toRWq1aXmp8hntCclMA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=heznp+7n+UgKXSOffyGi6J2bYCTDua05OBv6laT1J+eUnV4D/a33DzNmSYeVdVov1pUz2/XaCOSYiUOqFoqvCb7pi6Pwgj85WEtjD608lKCCGyN4mPqDtNsuoVXlNFBNjg+Aek4qZGB1SUr/ggfUve4+E6cCDBoIqyVXu7gHAZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M80pCKOt; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M80pCKOt"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b82a21eeeso18500175e9.2
        for <oe-lkp@lists.linux.dev>; Sun, 31 Aug 2025 12:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756669737; x=1757274537; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/uS8XQoltVZTTde0T8QO8uNExPfeZjyr7V7lSQkQi0=;
        b=M80pCKOtCFn8eESGg9KwFF6ljVhEy1cW1NLUYEyGvzi3gTc33Xd7PnHc/7i7HYM+/x
         cbufcwsDvLR78kJJAAYcchv/675dkMIG9Z7CZzsFP0mQyTqJc+PF9HFjLG3EUrxcNLQr
         5V1dyalYwPf53xdQXpdvtlqNFglL7NrFip8ny1i8b3IIXApaRw7P8Bga0LYmUIcr7hQ7
         N7E5ZlZ5U2NGbA9obw7utwkcf/Glyxk6nt3Rimiq5osKO5EZmuq+vw/i8lxRX+xqmn8R
         lKaaLT2CiUuK5EcnmAUHMavYYrNZ1uxyofm2nqWeHpDRqB6i5bj67FdY5pnl2mrgbo3C
         EzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756669737; x=1757274537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/uS8XQoltVZTTde0T8QO8uNExPfeZjyr7V7lSQkQi0=;
        b=CVnKNENcT8VIA5KnrJ3eeNi3ntO5dxQMvOkf8r80FGtm9B2I4eCedriSFkqbLWjrTy
         d0zvwIz2kZ9tQ0Ifjvuagiprb+M2wYVeQq3eYH774+bGbuPlX1i3xYOVVlTH0yKb8nQf
         tFrjUiAIpI8xmuqddGcyiHq0mRvhOYAqCVYlx+Sj14L43YE0WWTQW/XAZ3gsdfct0dP1
         oCTpjdJMNwmKVrL+BHsyefBxEBMUvZOd3wIwEYHKOos6icHWF8IRECh1nTOVFoSfFweN
         6LRbEVXW7eE8nMxuE8VLQy30Dcpe7PzNfCrXZVO1MwDtjgk67o13UsfffN7ZKyitndhc
         G6gg==
X-Forwarded-Encrypted: i=1; AJvYcCXrLXDxCapr9+oYYCqlaIL5rYBZ1m55qma3qMPhKyQtrv4fU2q4EFJ46NRQh+POpO51NfeQdso=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMV9TZmS46U4zcTaiLSpf7Fo+AqWGbH6jrH3CcB9fbZYdCde2I
	9cwlrdI+KJwUibUcNFg54b3S/YIsrwbHyERY5YQQUKIYP6QgA6RApYCR
X-Gm-Gg: ASbGncu/uVQtySUX7sEDolC/9fhXAByaowMoOrR4VfOjI82wz4KSdnTIqXEq21bcR8l
	LtE+9D4VR4VWMx6DbGu5rBgCD0EsFjT11mO5+DoUHXn1/oNiknmJ4SjWelg1POQh5Q44whi83fV
	2FawdyTMUmjMUIrQsoSFFYogwQ+s03W7drcrWBo8iLK1r1FFIAygMg/EFKDtowaJFHJrzJ97YHL
	5eWv0TSorGPtPOtYyfLk+TQYngq286Nu8bCsbj9lnEd/BPdFLtcaUN0GjQ04dKQQ8bPDlhfCwxI
	49L2lT3bNGKaJLJBzZ+aEt8aGHZzpMSgt4dy1JNUdIBNckmk4FV+TRkYhRfFxJ7IVL5wXuC/NS8
	9YZ81/znbDMY5jmKkrQrrdht0tnSJp3tAlBqphzMKaHsSUCwHjYKMa+mgbr7rYLPgKmVr814Bz0
	k=
X-Google-Smtp-Source: AGHT+IEeEQ2hbkObnxnkQG39yfKnUMI72ypP7uwHeRLeeAnCWW5M4XijwFDwGKMABe2hwYYDl5IayQ==
X-Received: by 2002:a05:600c:4f8f:b0:456:f1e:205c with SMTP id 5b1f17b1804b1-45b85550704mr45673845e9.4.1756669736666;
        Sun, 31 Aug 2025 12:48:56 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8ab832sm125269075e9.23.2025.08.31.12.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 12:48:56 -0700 (PDT)
Date: Sun, 31 Aug 2025 20:48:55 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Marcos Del Sol Vives <marcos@orca.pet>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Kees Cook <kees@kernel.org>, "Xin Li (Intel)" <xin@zytor.com>, Sabyrzhan
 Tasbolatov <snovitoll@gmail.com>
Subject: Re: [PATCH v2] x86: add hintable NOPs emulation
Message-ID: <20250831204855.5e41af1d@pumpkin>
In-Reply-To: <0ffa7c6e-f32f-4966-85df-3ee5f2426e9e@orca.pet>
References: <202508291620.bcfb3924-lkp@intel.com>
	<0ffa7c6e-f32f-4966-85df-3ee5f2426e9e@orca.pet>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 31 Aug 2025 16:34:05 +0200
Marcos Del Sol Vives <marcos@orca.pet> wrote:

> El 30/08/2025 a las 8:56, kernel test robot escribi=C3=B3:
> > [   24.176151][ T2696] BUG: sleeping function called from invalid conte=
xt at include/linux/uaccess.h:162
> > [   24.176703][ T2696] in_atomic(): 0, irqs_disabled(): 1, non_block: 0=
, pid: 2696, name: trinity-c4
> > [   24.177213][ T2696] preempt_count: 0, expected: 0
> > [   24.177492][ T2696] no locks held by trinity-c4/2696.
> > [   24.177788][ T2696] irq event stamp: 335112
> > [ 24.178030][ T2696] hardirqs last enabled at (335111): irqentry_exit (=
kernel/entry/common.c:210)=20
> > [ 24.178521][ T2696] hardirqs last disabled at (335112): irqentry_enter=
 (kernel/entry/common.c:?)=20
> > [ 24.179004][ T2696] softirqs last enabled at (332212): __do_softirq (k=
ernel/softirq.c:614)=20
> > [ 24.179473][ T2696] softirqs last disabled at (332207): __do_softirq (=
kernel/softirq.c:614)=20
> > [   24.179948][ T2696] CPU: 1 UID: 65534 PID: 2696 Comm: trinity-c4 Tai=
nted: G                T   6.17.0-rc2-00017-g09c737e0df5a #1 VOLUNTARY
> > [   24.179952][ T2696] Tainted: [T]=3DRANDSTRUCT
> > [   24.179954][ T2696] Call Trace:
> > [ 24.179956][ T2696] __dump_stack (lib/dump_stack.c:95)=20
> > [ 24.179961][ T2696] dump_stack_lvl (lib/dump_stack.c:123)=20
> > [ 24.179963][ T2696] ? nbcon_get_cpu_emergency_nesting (kernel/printk/n=
bcon.c:1375)=20
> > [ 24.179967][ T2696] dump_stack (lib/dump_stack.c:129)=20
> > [ 24.179969][ T2696] __might_resched (kernel/sched/core.c:8958)=20
> > [ 24.179976][ T2696] __might_sleep (kernel/sched/core.c:8887)=20
> > [ 24.179979][ T2696] __might_fault (mm/memory.c:6957)=20
> > [ 24.179983][ T2696] _copy_from_user (include/linux/uaccess.h:?)=20
> > [ 24.179991][ T2696] insn_fetch_from_user (include/linux/uaccess.h:212 =
arch/x86/lib/insn-eval.c:1516)=20
> > [ 24.179995][ T2696] handle_invalid_op (arch/x86/kernel/traps.c:308)=20
> > [ 24.180010][ T2696] ? exc_overflow (arch/x86/kernel/traps.c:417)=20
> > [ 24.180012][ T2696] exc_invalid_op (arch/x86/kernel/traps.c:432)=20
> > [ 24.180014][ T2696] handle_exception (arch/x86/entry/entry_32.S:1055) =
=20
>=20
> I am familiar with interrupts on microcontrollers and embedded systems,
> but not with Linux's, so unsure how to proceed.
>=20
> I've seen UMIP and IOPL emulation and they both run with interrupts enabl=
ed,
> by means of cond_local_irq_enable, and then fetch from memory using regul=
ar
> insn_fetch_from_user/get_user which may sleep.
>=20
> VC, on the other hand, uses the insn_fetch_from_user_inatomic.
>=20
> Can someone chime in on what should I do for this? Enable IRQs temporarily
> using cond_local_irq_enable or local_irq_enable, or use the inatomic
> version?
>=20

My 2c:
Enabling interrupts might have all sorts of side effects.
In this case it should be ok to use the 'inatomic' read of userspace
that will fail in the very unlikely case where the page got unmapped
between userpace executing the instruction and the trap handler
trying to read it.
If that happens just return back to userspace and re-execute the 'bad'
instruction - it will fault again and hopefully you'll manage to
read it the second time (or eventually).

I guess there might be a problem if the cpu is faulting on the first
few bytes of the instruction and a malicious program has put those
bytes right at the end of a page - and not mapped the following page.
You'd need to differentiate those from the valid:
	for (i =3D 0; i < 256; i++)
		hintable_nop();

	David
