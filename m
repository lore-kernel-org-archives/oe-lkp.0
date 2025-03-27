Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8225B215777
	for <oe-lkp@lists.linux.dev>; Thu, 27 Mar 2025 13:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743083093; cv=none; b=Hvr8oNy3Dpl/YQ4v/cl8qr7/E7IFu1sxpXSCuO/XJkpk8z1vRxtQ1N9g0T57MGAMa2uQQ/W6E+AkRBpHdc6b7qc6eV0GY50uqzxVHNfvd/PV+KLR2WH3QzysHb+ToJvPD5Y48yxGf8AAhdM4Clx4Xt+7EvT0aRxj7nwdYSlr+NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743083093; c=relaxed/simple;
	bh=+8qPATH2HU9gwTeERrkruIa/ZTb6ByUOe6zVYLhAwRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IP5wRTkR7/J1YTfzSYsMrLDLQvYuDmDoxsLkEAepqF/SiiAG2Fg/Ku3tnsfx+8ooq65D7o/YxIFatgZroRI4EDCH63iRwqL49yK3RfdBGMrlSaUMyoW0JLNbljOZx2sRnYvFUBlFGFCmJ6yRQmAkUHloHppAQbtq7sp2MX2HMJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c2H6e+c6; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c2H6e+c6"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4775ccf3e56so21855431cf.0
        for <oe-lkp@lists.linux.dev>; Thu, 27 Mar 2025 06:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743083090; x=1743687890; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WBmIHYNxH2hNbnztSUM0YQzeS33DRZ8fFAtqoGQFWc=;
        b=c2H6e+c6F7DYmsvOethReCM5XBXEsW903LvOIDsIwu+oACH/gaYrA7s2jmRKq0792k
         PsdyrkDEQC85AqfB9X1SRevKt4GHLZwm+bldiaMNeOEYRC97EobV0Mb8UNVL3ULkiI7X
         r0sSqMVIJOoLuGrBWJKFrqMof+fK73jCWKZ+yIfABuu13t73gALERwvr68nvdjpdEy/5
         r9g64BrQq8rez+FIi6aWLlh4ZGTMZww4jG0mpogTJlcLvrg8KqL85cmDjthR0rIo2UW8
         /zkO6Bf18Rx18qeKH8H4QbNv8JxRrd5q3QrVktUd/kRQ/SeQ0+g9hvjnY4hcyoJ/8erl
         CKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743083090; x=1743687890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WBmIHYNxH2hNbnztSUM0YQzeS33DRZ8fFAtqoGQFWc=;
        b=I3ZhASMgH8nf0Z/aIZlieWUw2ihdeE45PNJgyQJIezdYzFdVslH+18PgH5hoDtBO9M
         E4i3R8Gd6vWzLEeFYuTVopIeGD2Ky7fLf7dR/fvFjS8FW+ugNhpU0oFsqKOPcjR01Pk7
         ysYB4vAEcx4vNxE/RJWOmfceCQI1leJa6cfkzdJh6x7rwdvVd9//TJLgK33kpiC/ESRl
         6GXfyeI4psHoxWO7U4kuQx0JIa/Ae+kbICbT4m5v58SQJG/n/9RTMlSvCltW9Hf4M8dr
         +VEXRJej61OvO5UfVzlms4uSEFYhHdp/JR/I4twE4TYIPd0K3fnkzJfKG+GrBdnKi49D
         QL9A==
X-Forwarded-Encrypted: i=1; AJvYcCUOHlMjeaS0HZWe0tlWrg3zsAlnUJi9zQzoUo49j6/xZ/AV5vb2iuX/Ei/yfbi5MkQhuAcVHxg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyThG8InUQbrFCdOOQfYHGFpfIYZefNf7s1teJmPUo7K6ccLNR7
	FPpMCm4M5mPRRdfM9saz1eeixYx2gHqFCp+gGbzlHb7StbHeVpI0/BmwDPMtExDwP817kK7KK18
	u1ldToFM2fNcCGjjhuk9RiViMBWVzbXsdVJN8
X-Gm-Gg: ASbGncs+MW1QdqM1nSGgGymfsug7UreLMtq68CZjPSI7WpyAKIFOx2tFIiFUuDppmMg
	a2ccfd/LyAb0nXEIXmVT0MnOQmjGkuHj4sTbd2N0+QQzfnVMaCeX++sBz4tBHV+xMypXvvxkShG
	aV9gQaqQnEO9Z2i/nXkaOc3+nEI6M=
X-Google-Smtp-Source: AGHT+IEWhxaHLHGXV1mslhQ21zSlluJIiMobOHGWwfdwPV4FGN4ZX2GDfzSu9mFinq8HolGVw+mb5MiSpprY8RZqK4w=
X-Received: by 2002:a05:622a:4ac6:b0:471:b32e:c65d with SMTP id
 d75a77b69052e-4777f82ef6emr4678161cf.19.1743083090165; Thu, 27 Mar 2025
 06:44:50 -0700 (PDT)
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
 <CAGudoHHVJWeRWPyArnYnJERPR2gyU0PzBTwx=wWKnCemry45Nw@mail.gmail.com>
In-Reply-To: <CAGudoHHVJWeRWPyArnYnJERPR2gyU0PzBTwx=wWKnCemry45Nw@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 27 Mar 2025 14:44:39 +0100
X-Gm-Features: AQ5f1Jqj0hl3MGq_fBgn4lV2nPWlCqeAKMvuOzfv5-Zz2OFt_YiqJpvkXJEMWQc
Message-ID: <CANn89iLGof+T6Ksp56vTXpwKdn60cJ7FWrm-Y-3TNmCNW+Hq_A@mail.gmail.com>
Subject: Re: [tip:timers/core] [posix] 1535cb8028: stress-ng.epoll.ops_per_sec
 36.2% regression
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Benjamin Segall <bsegall@google.com>, Frederic Weisbecker <frederic@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 2:43=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> w=
rote:
>
> On Thu, Mar 27, 2025 at 2:17=E2=80=AFPM Eric Dumazet <edumazet@google.com=
> wrote:
> >
> > On Thu, Mar 27, 2025 at 2:14=E2=80=AFPM Thomas Gleixner <tglx@linutroni=
x.de> wrote:
> > >
> > > On Thu, Mar 27 2025 at 12:37, Eric Dumazet wrote:
> > > > On Thu, Mar 27, 2025 at 11:50=E2=80=AFAM Thomas Gleixner <tglx@linu=
tronix.de> wrote:
> > > >> Cute. How much bloat does it cause?
> > > >
> > > > This would expand 'struct ucounts' by 192 bytes on x86, if the patc=
h
> > > > was actually working :)
> > > >
> > > > Note sure if it is feasible without something more intrusive like
> > >
> > > I'm not sure about the actual benefit. The problem is that parallel
> > > invocations which access the same ucount still will run into contenti=
on
> > > of the cache line they are modifying.
> > >
> > > For the signal case, all invocations increment rlimit[SIGPENDING], so
> > > putting that into a different cache line does not buy a lot.
> > >
> > > False sharing is when you have a lot of hot path readers on some othe=
r
> > > member of the data structure, which happens to share the cache line w=
ith
> > > the modified member. But that's not really the case here.
> >
> > We applications stressing all the counters at the same time (from
> > different threads)
> >
> > You seem to focus on posix timers only :)
>
> Well in that case:
> (gdb) ptype /o struct ucounts
> /* offset      |    size */  type =3D struct ucounts {
> /*      0      |      16 */    struct hlist_node {
> /*      0      |       8 */        struct hlist_node *next;
> /*      8      |       8 */        struct hlist_node **pprev;
>
>                                    /* total size (bytes):   16 */
>                                } node;
> /*     16      |       8 */    struct user_namespace *ns;
> /*     24      |       4 */    kuid_t uid;
> /*     28      |       4 */    atomic_t count;
> /*     32      |      96 */    atomic_long_t ucount[12];
> /*    128      |     256 */    struct {
> /*      0      |       8 */        atomic_long_t val;
>                                } rlimit[4];
>
>                                /* total size (bytes):  384 */
>                              }
>
> This comes from malloc. Given 384 bytes of size it is going to be
> backed by a 512-byte sized buffer -- that's a clear cut waste of 128
> bytes.
>
> It is plausible creating a 384-byte sized slab for kmalloc would help
> save memory overall (not just for this specific struct), but that
> would require extensive testing in real workloads. I think Google is
> in position to do it on their fleet and android? fwiw Solaris and
> FreeBSD do have slabs of this size and it does save memory over there.
> I understand it is a tradeoff, hence I'm not claiming this needs to be
> added. I do claim it does warrant evaluation, but I wont blame anyone
> for not wanting to do dig into it.
>
> The other option is to lean into it. In this case I point out the
> refcount shares the cacheline with some of the limits and that it
> could be moved to a dedicated line while still keeping the struct <
> 512 bytes, thus not spending more memory on allocation. the refcount
> changes less frequently than limits themselves so it's not a big deal,
> but it can be adjusted "for free" if you will.
>
> while here I would probably change the name of the field. A reference
> counter named "count" in a struct named "ucounts", followed by an
> "ucount" array is rather unpleasing. How about s/count/refcount?


How many 'struct ucounts' are in use in a typical host ?

Compared to other costs, this seems pure noise to me.
