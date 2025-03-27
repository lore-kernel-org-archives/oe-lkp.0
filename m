Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20481322B
	for <oe-lkp@lists.linux.dev>; Thu, 27 Mar 2025 13:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743083334; cv=none; b=Lcobtzr4hQ+XBoxq49RHiwUzs/sVSDO4L2IOjI91S5OgWWcv4GAzjfzZCz4KlmWqOpVLRXQNS7MhPNyg3m4W+pMWSdv8GQ6wpsb4lxp4HKm+RyjxEx3YEVCuNUd5IdgI+xo4juNGr4G2z/smmKw9o5c8nJ+CXEi+U1ROOy4wW5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743083334; c=relaxed/simple;
	bh=BqIn0wrCuMc2UTLXaPpGz2GzyQ5thvKd6jrL79PHxhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gmYsGR/qaPOEB54804Yh1dRoX6CZNYxuJuWKUxkaKCryQGMewcLGdrtAnGcQu4uBqd8xCR51tgBpH7DwlYmX0WgDQ4mDdt1mHZylPQvewZVlPmD/iSzkyeid+H6BFmCUvXcTAsSUS1je9CriyxhFroP7eYrElylOIspoRWymiZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COie/zbu; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COie/zbu"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso1844570a12.3
        for <oe-lkp@lists.linux.dev>; Thu, 27 Mar 2025 06:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743083331; x=1743688131; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cShwsASNWb4Jp35AHxvP4AtgmKCcX2D/cSekQMeipE=;
        b=COie/zbuWwx1LJ7/DAJXoqTqzcDLvxmu3AO32uVOjXZzgq3FEskpww+uE+LYO4wNiu
         Pwtg8LvmoMd9jE1QAtwC673MzUKy8C63hn0Emdt2o72eboRy/uaHFnvlsH3Ne7WpT14a
         peq2HmVIuZWZLl2pVG4Vc86fZySR3g8S1ikGYH3r+ohIc3+1rbmlxMrILcaNk6JEw/lA
         kBjQBL5qmW6LxyZMbWQrKZWCu5yxvhxlZtBrcIm0s6rEvvS1sRhkW3JEdbjyUVkJgldu
         1M9t/gxrFNdugIRtyY+x9s6HBlLjUL9iwXtFRLP9VksK1FqnRtfJq8bC1BlUwxcyH+Ie
         boUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743083331; x=1743688131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cShwsASNWb4Jp35AHxvP4AtgmKCcX2D/cSekQMeipE=;
        b=XA4TUlf177FQ5QCYfEOznyM3OJHmn3I5BcbQ4rLQ3NdkYTBXf/eAp2hU2cPlh8dhRf
         dXBsO94nwQjpdbLFDRT9BbFHzEntwGCIbJ81PCdwrGIj1YS2aZny1O4R2UBBTD3dR6mi
         WaBQo2UXWLFIJ7BR94gjjnsmzH1CTXpaJrPyFXc41GwiG0j3WaKRy8ZEjeGTGAEsQ2jm
         l8jYfZWZ+Bia3wcfiUseWByvIvKnqxLa4GT8TXF8w21lOxvT1ieUcouDv8AL1LAWXWKM
         WWEtz+IcUEUXn51OTX8dxYr8lzr4e3abGwP9uBBhijFvA8oDTeSpR630/FPJNivW5bJb
         KZsA==
X-Forwarded-Encrypted: i=1; AJvYcCVy9h1jOWd6+K+0E+ZF5DslsO/ltaMhhTNcg2mKmbYtATHE4m5iiIa8sCI0knpGCfVphabiNcM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvGGF3D7+MgnjlDLQSF3YB9XXXZQiIZssQu3DfqFs/pxV97KyM
	OOMmjgH6bGjyVdGzEji4yTnPy/2Teh40TFe6OCWxvpLlowWwXsiNB+BkVOwZK6CQc+xpYXuEsZ5
	xteCEMnUNgNHphHkLFY7f77v1vmg=
X-Gm-Gg: ASbGncszc32SZNb7GcRmHu2XqIDBKt6GWuUhkmaQHtj/1T0Pf9p+ay5K6xYoZoOnNDe
	1qqpAVC75MzmJ0Xt7u1AaUwJTuqbTAnyLB8iwy33fhuoR6S063a8HcZuwt/lHOh2UabyfY2/4gT
	NXuPJCO0zdVoyzM4YZyaN4yR1l
X-Google-Smtp-Source: AGHT+IG8tThHD6jWDTQjmnm+9IMPz27ZM/JzO/RcyOsJuWqSoOf5JkHpUl0R3AKSFEsEeRwFhBe+mP74VNwy9s7sHk4=
X-Received: by 2002:a05:6402:5187:b0:5ec:922f:7a02 with SMTP id
 4fb4d7f45d1cf-5ed8e496a71mr3793788a12.10.1743083331045; Thu, 27 Mar 2025
 06:48:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202503241406.5c9cb80a-lkp@intel.com> <87pli4z02w.ffs@tglx>
 <6sn76aya225pqikijue5uv5h3lyqk262hc6ru3vemn7xofdftd@sw7gith52xh7>
 <CANn89iKjCgmxtiLeVAiXODHbbR7=gYYi5cfAS1hS5qn+z=-o1Q@mail.gmail.com>
 <877c4azyez.ffs@tglx> <CANn89iKAkio9wm73RNi9+KngNaS+Au2oaf0Tz9xOd+QEhFSkyw@mail.gmail.com>
 <CANn89i+nAN+p-qRypKxB4ESohXkKVPmHuV_m86j3DPv6_+C=oQ@mail.gmail.com>
 <87v7ruycfz.ffs@tglx> <CANn89iJvxYsF0Y9jH+Oa2=akrydR8qbWAMbz_S6YZQMSe=2QWQ@mail.gmail.com>
 <87jz8ay5rh.ffs@tglx> <CANn89i+r-k-2UNtnyWC6PaJmO_R6Wc6UROgeoir5BmgVV8wDqQ@mail.gmail.com>
 <CAGudoHHVJWeRWPyArnYnJERPR2gyU0PzBTwx=wWKnCemry45Nw@mail.gmail.com> <CANn89iLGof+T6Ksp56vTXpwKdn60cJ7FWrm-Y-3TNmCNW+Hq_A@mail.gmail.com>
In-Reply-To: <CANn89iLGof+T6Ksp56vTXpwKdn60cJ7FWrm-Y-3TNmCNW+Hq_A@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 27 Mar 2025 14:48:37 +0100
X-Gm-Features: AQ5f1JpKomRkGYmjsgSFzFHODlirXHVWlwC4ZRc4JNJcxh6kNbtiGglHymgUuI8
Message-ID: <CAGudoHE_K4iBHSNjKEPuQxJJ-cNx_8f74dou7qdEb58Pc4eKBQ@mail.gmail.com>
Subject: Re: [tip:timers/core] [posix] 1535cb8028: stress-ng.epoll.ops_per_sec
 36.2% regression
To: Eric Dumazet <edumazet@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Benjamin Segall <bsegall@google.com>, Frederic Weisbecker <frederic@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 2:44=E2=80=AFPM Eric Dumazet <edumazet@google.com> =
wrote:
>
> On Thu, Mar 27, 2025 at 2:43=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com>=
 wrote:
> >
> > On Thu, Mar 27, 2025 at 2:17=E2=80=AFPM Eric Dumazet <edumazet@google.c=
om> wrote:
> > >
> > > On Thu, Mar 27, 2025 at 2:14=E2=80=AFPM Thomas Gleixner <tglx@linutro=
nix.de> wrote:
> > > >
> > > > On Thu, Mar 27 2025 at 12:37, Eric Dumazet wrote:
> > > > > On Thu, Mar 27, 2025 at 11:50=E2=80=AFAM Thomas Gleixner <tglx@li=
nutronix.de> wrote:
> > > > >> Cute. How much bloat does it cause?
> > > > >
> > > > > This would expand 'struct ucounts' by 192 bytes on x86, if the pa=
tch
> > > > > was actually working :)
> > > > >
> > > > > Note sure if it is feasible without something more intrusive like
> > > >
> > > > I'm not sure about the actual benefit. The problem is that parallel
> > > > invocations which access the same ucount still will run into conten=
tion
> > > > of the cache line they are modifying.
> > > >
> > > > For the signal case, all invocations increment rlimit[SIGPENDING], =
so
> > > > putting that into a different cache line does not buy a lot.
> > > >
> > > > False sharing is when you have a lot of hot path readers on some ot=
her
> > > > member of the data structure, which happens to share the cache line=
 with
> > > > the modified member. But that's not really the case here.
> > >
> > > We applications stressing all the counters at the same time (from
> > > different threads)
> > >
> > > You seem to focus on posix timers only :)
> >
> > Well in that case:
> > (gdb) ptype /o struct ucounts
> > /* offset      |    size */  type =3D struct ucounts {
> > /*      0      |      16 */    struct hlist_node {
> > /*      0      |       8 */        struct hlist_node *next;
> > /*      8      |       8 */        struct hlist_node **pprev;
> >
> >                                    /* total size (bytes):   16 */
> >                                } node;
> > /*     16      |       8 */    struct user_namespace *ns;
> > /*     24      |       4 */    kuid_t uid;
> > /*     28      |       4 */    atomic_t count;
> > /*     32      |      96 */    atomic_long_t ucount[12];
> > /*    128      |     256 */    struct {
> > /*      0      |       8 */        atomic_long_t val;
> >                                } rlimit[4];
> >
> >                                /* total size (bytes):  384 */
> >                              }
> >
> > This comes from malloc. Given 384 bytes of size it is going to be
> > backed by a 512-byte sized buffer -- that's a clear cut waste of 128
> > bytes.
> >
> > It is plausible creating a 384-byte sized slab for kmalloc would help
> > save memory overall (not just for this specific struct), but that
> > would require extensive testing in real workloads. I think Google is
> > in position to do it on their fleet and android? fwiw Solaris and
> > FreeBSD do have slabs of this size and it does save memory over there.
> > I understand it is a tradeoff, hence I'm not claiming this needs to be
> > added. I do claim it does warrant evaluation, but I wont blame anyone
> > for not wanting to do dig into it.
> >
> > The other option is to lean into it. In this case I point out the
> > refcount shares the cacheline with some of the limits and that it
> > could be moved to a dedicated line while still keeping the struct <
> > 512 bytes, thus not spending more memory on allocation. the refcount
> > changes less frequently than limits themselves so it's not a big deal,
> > but it can be adjusted "for free" if you will.
> >
> > while here I would probably change the name of the field. A reference
> > counter named "count" in a struct named "ucounts", followed by an
> > "ucount" array is rather unpleasing. How about s/count/refcount?
>
>
> How many 'struct ucounts' are in use in a typical host ?
>
> Compared to other costs, this seems pure noise to me.

I did not claim this is going to increase memory usage in a significant man=
ner.

I claim regardless of this change a 384-byte slab for kmalloc may be
saving memory and this bit may be enough of an excuse to evaluate it,
should someone be interested.

Apart from that I claim that if the 512-byte is going to be used to
back the 384 bytes used by the struct, the patch can trivially move
the refcount to a dedicated cacheline to avoid some of the bouncing
and still fit in the 512-byte allocation. I see no reason to not do
it.

--=20
Mateusz Guzik <mjguzik gmail.com>
