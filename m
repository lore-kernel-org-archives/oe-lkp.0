Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163F88C1E
	for <oe-lkp@lists.linux.dev>; Sun, 27 Apr 2025 16:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745772019; cv=none; b=aQYj0d0aTPnMWpxdJKNYzBFXAiydA/SSGWnu+VAfeYUAnnglEtt4KE9U+37Df80aCsJwKns4PxgoJwKB7MRqcSMsUzpcmDYD3TNAHE1uwkfeqBH5dNSpE8a8bpwLEWenO78b7tmkaYi5gAmVUaBRr1+K8sAl7x0MLBZ5AUO8nzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745772019; c=relaxed/simple;
	bh=LM90r3Y+weh/nc9Q6Rt2jDo/M8Djn5nVOIsjqVwCqAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=buqPakeJFrZ1kTwj61ot+3xCqQvEISROPQX93CYQNv5XpKXwP1ZqH7zc9BfiNzPhNop6fhww6AXvZjC8eImoutLWXFwjOa9Doa9b82AYc0lJ8P/mNrNcLLMYtoamMVA+zMaLzBwEfYsB4nBb0fy5Lgy/dOK+ClIMBjuMmpWObiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KD2Wt/uX; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KD2Wt/uX"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aca99fc253bso585601666b.0
        for <oe-lkp@lists.linux.dev>; Sun, 27 Apr 2025 09:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745772014; x=1746376814; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0Hd4NWPkkSFF9D2y+FVFKzC83gG6cCjw8U9KM82KHYk=;
        b=KD2Wt/uXVZn2cpqf3xFIgzOC9o2ZdOYzIZ/n2PfktuW4YMt5NLwRk9yAQ7CkgQ4vs8
         6KKImFEel7eovjIGAgMTB7eu03u/98fWP2i0zx5QdRvGOjzQq1CIT5rnipe7OCJDHaFN
         /I1ReD3cOgmG8rqrFlAfmshXCYbMlsKIis+Qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745772014; x=1746376814;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Hd4NWPkkSFF9D2y+FVFKzC83gG6cCjw8U9KM82KHYk=;
        b=TCFPEE7+/NQjzzBXN4kPc875nhq0LVc1WTnCqu49AG2GGnNKe8ZFXxr7tsrwfOrdyY
         HPGac523oI5NMbyAZYy/08dPrUEfy0X8logf0TCSIW5bDUTK+TEXcibagQFK7juzm8Tv
         wk7GZNGXbl9ocoMw9dnlnKULN39C+o8gyDjvkOaBkae7oCRciyYJ+cOFA7B6IaRzLU74
         e08xE6BGugyBmQM3uPKLzfj0QXoZK3mLv2P4BtF3C1f29SYPhhK2v/hLDe1KkG2Uc1A+
         4v170UFK/adTiXpJCxPO7DPyQw4A9U2hIyUejIQjWCmcIw9a7BflOc+Jx5RyF891+nTf
         vqEg==
X-Forwarded-Encrypted: i=1; AJvYcCVTzFo7oanrVb+crMVcvotn63eqlMsPUOC5ZgNe0VieYAlQbC13wglMaRP94UVK45jGtXyk5wE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWhVR/pHKH9V1KOdlns0jzi6PowuB/FAtvGxdPpVr1E6KqcDD5
	lnpsqgHiHRSZRRdMJCXLXm1kp399dajHQwsK9Dq39zo9eiuSQaZ4dyIDI3WpV8N/pOWx6fqyjQa
	1xorWwQ==
X-Gm-Gg: ASbGncuTn77mObFxUPsDSCqxoQYq71fg9atFkJCDqG/3pIIZSDf5oWbItOo5jyW5km4
	JaCmsg1bk0AY0jSFbZQsNPX12DL2LMkmiL2fBIy9SlyCVyrXBksQyZySUkVmAa1NZpFNvC+OxPK
	baA63YjFl10t618U78ZVvm2qAmmZ4jPAIbs2Hp2OZrKFEcB7Gd0BnwFUOHqEhYFANCvckYYl+g8
	V4s73qo8Mi/b/ynV3evFyvJIlslYrXSgYiIT/ZVGknXruJOAE+U9NPxTUGhnEsN6XSE1VF0Mqqd
	op3BDdKSLBS7hkM3fBnBNtRtD24A8HCcti/vrwZZklxY2KxoI6ssQvKO/hCXex5+wz7e0scOl2z
	PlzB69C2VKw9emE0=
X-Google-Smtp-Source: AGHT+IH2FJWQg0hkXT/n4JhihmxPq6G1Ng6tL3fjgSVe3u1MGPK6md6AY1QY6JYDHom3eJW8nZYoZQ==
X-Received: by 2002:a17:907:72ca:b0:ac2:9841:3085 with SMTP id a640c23a62f3a-ace8493bc4bmr542161666b.30.1745772013950;
        Sun, 27 Apr 2025 09:40:13 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41cf4esm464144966b.29.2025.04.27.09.40.12
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 09:40:13 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acb2faa9f55so486856166b.3
        for <oe-lkp@lists.linux.dev>; Sun, 27 Apr 2025 09:40:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZzXFTQmHwIt2AtASbVyMKeN2WgFGCrr+nZibIFUh4IMIw/Lb1pmHhkG4LCsaSMyITa0WZnnU=@lists.linux.dev
X-Received: by 2002:a17:907:7289:b0:ace:68ad:b4d8 with SMTP id
 a640c23a62f3a-ace84a8a378mr574294566b.38.1745772012656; Sun, 27 Apr 2025
 09:40:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202504211553.3ba9400-lkp@intel.com> <59198081-15e2-4b02-934f-c34dd1a0ac93@app.fastmail.com>
 <aAmeJmL0hUx2kcXC@xsang-OptiPlex-9020> <f1ccb8b4-bbe2-42bc-bb86-c2bf3f9c557d@app.fastmail.com>
 <aA3FL6e1HVAw1J+w@xsang-OptiPlex-9020>
In-Reply-To: <aA3FL6e1HVAw1J+w@xsang-OptiPlex-9020>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 27 Apr 2025 09:39:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgxD6DPv1H_uZX4MVB5GvFyGduzMFu2qAeb5dBrE=nHog@mail.gmail.com>
X-Gm-Features: ATxdqUHYNNA1LWbBxds3-1LXU1tMS9D3fS1ZRHo9f0oi5JK0wmvgdfrwhCsVAck
Message-ID: <CAHk-=wgxD6DPv1H_uZX4MVB5GvFyGduzMFu2qAeb5dBrE=nHog@mail.gmail.com>
Subject: Re: [linus:master] [x86/cpu] f388f60ca9: BUG:soft_lockup-CPU##stuck_for#s![swapper:#]
To: Oliver Sang <oliver.sang@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, oe-lkp@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, 
	Ingo Molnar <mingo@kernel.org>, John Stultz <jstultz@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Apr 2025 at 22:49, Oliver Sang <oliver.sang@intel.com> wrote:
>
> We reran the tests. if only enable X86_TSC, the various issues still
> exists. if only enable X86_CMPXCHG64, various issues gone.

Well, that's unexpected. I really didn't expect X86_CMPXCHG64 to make
any difference, since we should still use the cmpxchg64 instruction,
just with the alternative re-writing instead of directly.

Thanks for re-running the tests.

All the non-cmpxchg64 code sequences get replaced by the cmpxchg64
ones dynamically, so it all shouldn't matter one whit.

Except for during early boot. Because we do default to the old i386
sequences all the way *until* we do the alternatives replacement with
the good cmpxchg64 ones.

It does change code generation, in that we have to have that
alternative which now can be a call, so it's not a complete no-op, but
I'm still surprised.

And except for not using CMPXCHG_LOCKREF at all, but that should be
just a performance thing, and not noticeable during boot.

Hmm...

I'd love to understand why X86_CMPXCHG64 apparently matters, but I
can't convince myself that it's worth really pursuing.

            Linus
