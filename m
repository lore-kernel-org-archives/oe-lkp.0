Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A1D47F69
	for <oe-lkp@lists.linux.dev>; Wed, 30 Oct 2024 09:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730281611; cv=none; b=ILrj4Gy2Jj++Ig85dRUu5LKvFvr1ALXL3ISCwSpOpJjO6ulFXtlhmmTpApvSEhH5JO3i8D1DulZj/eKofRyO5tQ8Y2+5/UzHGNuU1Wf2jWQMAGId6/QlZC3CMfnTy8FRhvL3kUENYwO9KZzSpQ5J3/ZMH/lDWOBitbEihm3czH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730281611; c=relaxed/simple;
	bh=FBmZcXTgIZK0lgSN6xAJ8jAckuE+YGMam+wktSSa9MU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YqusWLQORfJcsMJuTucwLHyAMCt6r3prsuLJgNf2p7Elq1LwXCYpjxvwYBZ2K0q1of8NQK/iyVhszDYyfJ9CTz2PeMByXs1l0l61KpAP+EebrSSO128zrV/3PJtoGmPlfBDxOVYH5E2V4zVlhIKcYVzrurK63K/xAgl34KpbEhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tvLON7It; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tvLON7It"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e34a089cd3so5214780a91.3
        for <oe-lkp@lists.linux.dev>; Wed, 30 Oct 2024 02:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730281609; x=1730886409; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=57YjU7d3aiShFAeRYMJ4UKLcOCFYenUFjplvSNxBdNs=;
        b=tvLON7ItFlLgYsTktB7N762qGhchCDSJToN9vDLIGaTNC0LlqIw6gT6sv15UUQezgv
         mAqXnLImIFQPjZU3KdLMb7TxSGCGUdXF41WZluUVpE+XPcKOe60w0p+X+zBcUgPg5z9l
         5MMtC6Q/PILYKq/DqXAsoJ/D6kViS7ndK5CsZUe4CoMsttgarCUUPKtzNuNEtEn5kmIG
         TOQG9avIJU1fCOoYiVbWXH7/2n/+AYX5CUNJ0DaTJinlQSzejnSlwFlykjfbnlU1cAI1
         WjT29+UEdBCuoujYfAfTY4si6ZcGxwCXITdUSlWIWxWopeiNPWYTQ6LH41ENlJEHa9nh
         +WnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730281609; x=1730886409;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=57YjU7d3aiShFAeRYMJ4UKLcOCFYenUFjplvSNxBdNs=;
        b=OrLPSLCW5jz/cbh2Fwmk18QwG8O9QG1kCPk7ohCR2bcvBnE0wJgoSG7hIOkTmLzgkL
         g5/ADR+mxFggekx8D8WutXi+TW+DfHP+qdfG0BBj8nZFb30QT6BspXpqw2QrVbM4r9CE
         nkquLkHBHf9x43VYQysX8kvNOEhvHkA5NaGktZO7Iax05GdKPO8mHZZy6F/SpDmjaJH9
         lYN+vuQoJ3VWZwX8h9ctgy3ugTTX9e8OB/mGBvL0bm83qD6/Tt2zRRiJgZ3V77Y3ikh5
         tCCydb/FkzgHmX45ZcvqJdebk9nAC2rmUOPonnV1+xkth9NC2KRkYQ2wkrgGr6jzQOjK
         cANg==
X-Forwarded-Encrypted: i=1; AJvYcCWy3SLhBiHJB8ki+hKT/6nLMtmISfL9JRsBT5JsDNuFzOnQULriln51RswWXOf4ZBaSF2LOZwc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx16AhbXJAMvg7WXiIf36fy4KvrvR8QM5Cl7vkNlBmnRe2absVE
	0MCOODnUlL2yM0cN/kkUI9lg0vfQoh8Y767cfOdTOH5wzJxVHuD6BSQkWP2Wmw2h/CtNijsOGcn
	y6/UtuFRfh8XSQidYtXg3D1jCPhkcTHm8K9vy
X-Google-Smtp-Source: AGHT+IEMiikB0ur+6JqcKyOPWa2U/umSi1YVN7U5yB+G+Q68oHDPcN14Ls0bj3HSlcONgRgrvUhm9z+LBgmvXEBJrcY=
X-Received: by 2002:a17:90b:4b42:b0:2e2:d434:8547 with SMTP id
 98e67ed59e1d1-2e8f104aa36mr17310892a91.7.1730281608721; Wed, 30 Oct 2024
 02:46:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410301316.e51421de-lkp@intel.com> <877c9qynxo.ffs@tglx>
In-Reply-To: <877c9qynxo.ffs@tglx>
From: Marco Elver <elver@google.com>
Date: Wed, 30 Oct 2024 10:46:10 +0100
Message-ID: <CANpmjNNbZOQjc=5h4z_yS1v-F94bN06dwogi7o1vN9tLtVE+zw@mail.gmail.com>
Subject: Re: [tip:timers/core] [timekeeping] 5aa6c43eca: BUG:KCSAN:data-race_in_timekeeping_debug_get_ns/timekeeping_update_from_shadow
To: Thomas Gleixner <tglx@linutronix.de>
Cc: kernel test robot <oliver.sang@intel.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	x86@kernel.org, John Stultz <jstultz@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Oct 2024 at 09:50, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Wed, Oct 30 2024 at 13:47, kernel test robot wrote:
> > this is another report about BUG:KCSAN, the change does not introduce new KCSAN
> > issue, but causes stats changes as below.
> >
> > [   70.265411][    C1] BUG: KCSAN: data-race in timekeeping_debug_get_ns / timekeeping_update_from_shadow
> > [   70.265430][    C1]
> > [   70.265433][    C1] write to 0xffffffff8483fef8 of 296 bytes by interrupt on cpu 0:
> > [ 70.265440][ C1] timekeeping_update_from_shadow+0x8e/0x140
> > [ 70.265452][ C1] timekeeping_advance (kernel/time/timekeeping.c:2394)
> > [ 70.265462][ C1] update_wall_time (kernel/time/timekeeping.c:2403)
>
> timekeeping_update_from_shadow() holds the sequence count write.
>
> > [ 70.265642][ C1] timekeeping_debug_get_ns (kernel/time/timekeeping.c:415 kernel/time/timekeeping.c:399 kernel/time/timekeeping.c:307)
> > [ 70.265653][ C1] ktime_get (kernel/time/timekeeping.c:431 (discriminator 4) kernel/time/timekeeping.c:897 (discriminator 4))
> > [ 70.265660][ C1] tick_nohz_lowres_handler (kernel/time/tick-sched.c:220 kernel/time/tick-sched.c:290 kernel/time/tick-sched.c:1486)
>
> ktime_get()
>
>         do {
>            seq = read_seqcount_begin(&tk_core.seq);
>            timekeeping_debug_get_ns();
>         } while (read_seqcount_retry(&tk_core.seq, seq));
>
> So this should be safe against concurreny. I assume the issue here is
> that timekeeping_debug_get_ns() has a nested
>
>         do {
>            seq = read_seqcount_begin(&tk_core.seq);
>            ....
>         } while (read_seqcount_retry(&tk_core.seq, seq));
>
> inside. Which is still correct, but confuses KCSAN. Marco?

Right... Nested seqlocks have always been tricky for KCSAN, because
any racing access (vs. writer) after the inner read_seqcount_retry()
(after the loop) may end up being reported as a data race. The inner
read_seqcount_retry() will tell KCSAN "kcsan_atomic_next(0)", ending
the critical section, but at this point it's also forgotten the outer
one. The main problem with seqlocks has always been that there's no
requirement to cleanly denote a critical section with one
read_seqcount_begin() and a matching read_seqcount_retry(). Which is
why we opted for the kcsan_atomic_next(..) approach for seqlocks, so
that it can recover if the begin/retry calls are imbalanced. If the
seqlock interface were to change to require balanced
read_seqcount_begin/retry, then we could use
kcsan_nestable_atomic_begin/end().

I think for the few seqlock anomalies which KCSAN cannot deal with
today, it would be fair to mark such functions as __no_kcsan (or
surround with kcsan_disable_current()/kcsan_enable_current() to
include callees).

I'm also trying to figure out the seqcount_latch thing right now,
which is causing similar headaches:
https://lore.kernel.org/all/20241029083658.1096492-1-elver@google.com/T/#u
