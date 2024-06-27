Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C43198A09
	for <oe-lkp@lists.linux.dev>; Thu, 27 Jun 2024 16:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719507318; cv=none; b=KwNaJbUl4hyJZ2B8L/a4sObnTyclCCAIHa8AOL41Cg+SNtVoTOwFGwtzcpHswFy2s2ALaq593TraNkwTRv6mEO8a6kfMuTKug6/ziQKEuMvTXoaBR/HRTi+bO+kbgZfLX5amn/X5otKMiBGVfdh0HHu1m8swwvfwIA+0uLMpRxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719507318; c=relaxed/simple;
	bh=TWpfBUkrmZcTYP6kalJEGUrCqZR0g9FhtBW0ShSfuI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BBKlZVRVglQRHbOtgP8K/36pVt8QR0rzVCPAFbETrSvBdv/bYU9qOrREUH8KRf7BwWSUhdB8KCISaAP45OvFrwRr8sh2xNeuSaHr0kvShfPyndsHtFn+rVb+l7gDa8+nQ97L+rAGFJUdQkliE7cGYsWOz7fPEW+AQqxrF6XLN3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxF3Y8ZV; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxF3Y8ZV"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a725a918edaso473328766b.3
        for <oe-lkp@lists.linux.dev>; Thu, 27 Jun 2024 09:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719507315; x=1720112115; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niteNh3TbVLu7eb0D9sBMdcI9GkHgkcpq+/w6gXTGSU=;
        b=jxF3Y8ZVMUKH8QpXwoTXy30Hr5sZqwmA75Kx2i5PYzUTF291qm8q5wrq3EsOjgiNRU
         bCb89w3gUtIBNYxsVV5RJowpl2OXsFBMhxft/vtp75HAgaquagp7r2yrTg60t6gQnO1o
         bsHQl4sYfojVbNfqU966BfLZ223qUqq8Id2PtAzrXQLp3jtUPW7HUVfXFca+DSz5Z/7y
         NJuWZGY13Gd0NMQqaQoNhtptZtI/d6kTehwNJg/mVseK7qhfh+VQKV14Sez4wmc5Iutn
         DYHVxOBUYz+jaDse29TRvbG8CZ046E2IvyFdxMcf6PlwVhT6vv721XcUhq7uZd+51Kj6
         y+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719507315; x=1720112115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=niteNh3TbVLu7eb0D9sBMdcI9GkHgkcpq+/w6gXTGSU=;
        b=GAuJ3w3OwfxFHkb9jSSS4yuNNXhoXoeJMZ/SEqYoe//t7iFn/1tfIrR9dZbQFExFko
         TPnEvX1T8Vj/V5l4KwXTP3OSskviM6zX7OsFDAW2TPxtbGb6iTUMJAT9CBlGhYg/VGcy
         b6ZX/SrBnut4RddfByFZ2PgjVp0HvH2JSp3cJOWYciyMgJdEjTqXrrXFroMTLgLjo3Sw
         HmzHfoJaLkqP/JrY70Ja62JSPLhKl/QCMeEhraquDDVPM+jh96o9vZsW+hK/d+9NnzPz
         GTQURj6Z7DpBlSilzGj7TyVKMj0zRgypb7jSujDRpqGTmXgPyZ9nwo54rFwACzV5W4WN
         pluQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5VYCWkPSQRvmPGe2825EhmjqbsdSBjWF13peJbN4ercSELEcKcJ5paxq5B2yjGmnxwIdX42nwphAv/i6V692OQBwIdxpN
X-Gm-Message-State: AOJu0YwG+RguDQNvrG6oRC5Tf0PKx3MT8Aen4g7aJsi/m8cY2b38f1qC
	AN014bymNadefjBhhPEQxV/KD93fWHsaFiTpfgnJ4J+OKCUlTxnhkkce9nmkMn2vwkOzA+qsIrA
	X6xqDUy27rF5pbk908fDH3yGqb38=
X-Google-Smtp-Source: AGHT+IH0dIKUR/haFbE60cInxlDg0jpKpfwKboTD7Ew46GpSk6YvqS7ECQ1CFI021YcGgAHu64qodhxqduXhre2e1pk=
X-Received: by 2002:a17:906:6a22:b0:a72:a206:ddc2 with SMTP id
 a640c23a62f3a-a72a206df24mr160444366b.36.1719507314776; Thu, 27 Jun 2024
 09:55:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406270912.633e6c61-oliver.sang@intel.com> <CAGudoHF7ys8bTCE0G6vLzEbo+_NyQXmAEEGPJ4hx1yoYmBsoUA@mail.gmail.com>
 <CAGudoHFrMkdo1CoVxJUiEvQ_DyW3hzaCz18GjvLi4ny=o-q9ZQ@mail.gmail.com> <CAHk-=wg7PXo_QbBo8gv27OpbMgAwLh9H46kJRxAmp0FL0QD7HA@mail.gmail.com>
In-Reply-To: <CAHk-=wg7PXo_QbBo8gv27OpbMgAwLh9H46kJRxAmp0FL0QD7HA@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 27 Jun 2024 18:55:02 +0200
Message-ID: <CAGudoHFfH7d2AnWOeTNWF_BvF8qizxp+FMK6e1CyeOfTk0fLGQ@mail.gmail.com>
Subject: Re: [linux-next:master] [lockref] d042dae6ad: unixbench.throughput
 -33.7% regression
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 6:32=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, 27 Jun 2024 at 00:00, Mateusz Guzik <mjguzik@gmail.com> wrote:
> >
> > I'm arranging access to a 128-way machine to prod, will report back
> > after I can profile on it.
>
> Note that the bigger problem is probably not the 128-way part, but the
> "two socket" part.
>

I know mate, I'm painfully aware of NUMA realities.

The bigger stuff I have intermittent access to is all multi socket,
the above is basically "need to use something bigger than my usual
trusty small core setup".

> From a quick look at the profile data, we have for self-cycles:
>
>   shell1 subtest:
>       +4.2   lockref_get_not_dead
>       +4.5   lockref_put_return
>      +16.8   native_queued_spin_lock_slowpath
>
>   getdent subtest:
>       +4.1   lockref_put_return
>       +5.7   lockref_get_not_dead
>      +68.0   native_queued_spin_lock_slowpath
>
> which means that the spin lock got much more expensive, _despite_ the
> "fast path" in lockref being more aggressive.
>
> Which in turn implies that the problem may be at least partly simply
> due to much more cacheline ping-pong. In particular, the lockref
> routines may be "fast", but they hit that one cacheline over and over
> again and have a thundering herd issue, while the queued spinlocks on
> their own actually try to avoid that for multiple CPU's.
>
> IOW, the queue in the queued spinlocks isn't primarily about fairness
> (although that is a thing), it's about not having all CPU cores
> accessing the same spinlock cacheline.
>
> Note that a lot of the other numbers seem "incidental". For example,
> for the getdents subtest we have a lot of the numbers going down by
> ~55%, but while that looks like a big change, it's actually just a
> direct result of this:
>
>      -56.5%  stress-ng.getdent.ops
>
> iow, the benchmark fundamentally did 56% less work.
>
> IOW, I think this may all be fundamental, and we just can't do the
> "wait for spinlock" thing, because that whole loop with a cpu_relax()
> is just deadly.
>
> And we've seen those kinds of busy-loops be huge problems before. When
> you have this kind of busy-loop:
>
>     old.lock_count =3D READ_ONCE(lockref->lock_count);
>     do {
>         if (lockref_locked(old)) {
>             cpu_relax();
>             old.lock_count =3D READ_ONCE(lockref->lock_count);
>             continue;
>         }
>
> the "cpu_relax()" is horrendously expensive, but not having it is not
> really an option either, since it will just cause a tight core-only
> loop.
>
> I suspect removing the cpu_relax() would help performance, but I
> suspect the main help would come from it effectively cutting down the
> wait cycles to practically nothing.
>

As far as lockref goes I had 2 ideas to test:
1. cpu_relax more than once, backoff style. Note the the total spin
count would still be bound before the routine gives up and locks. this
should reduce pulling
2. check how many spins would be needed to wait for before lockref
decides to fall back to locking

When messing around not automatically taking the lock I measured spin
counts with an artificially high limit. It was something like < 300 to
cover the cases I ran into (not this benchmark). For all I know the
limit can be bumped to -- say 256 -- and numerous acquires will
disappear at that scale, which should be good enough for
everybody(tm). All while forward progress is guaranteed.

That aside even that getdent thing uses mutexes and there is something
odd going on there. I verified workers go to sleep when it is
avoidable, which disfigures the result. I don't know the scale of it,
it may be it is a tiny fraction of consumers, but I do see them on
offcpu tracing.

That's that for handwaving. I'm going to get the hw and get hard
profiling data + results.

--=20
Mateusz Guzik <mjguzik gmail.com>
