Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8DD4642D
	for <oe-lkp@lists.linux.dev>; Thu, 27 Mar 2025 20:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108318; cv=none; b=PIDE4zXbmZ5yad7cKjkR36WbN0FXA71ejgk6lMTMoXpS6ZeJF4SuT9yX//c64H1EZ+esqXmJFutTEPyS5tioLdSv7Uqokq3jamQnQwTgh8TPRurIWgCi0KI55fNgycU0Pc6y3m4+QuW2544gZsNvPzh+0yrwu85nSSbcgqzp/k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108318; c=relaxed/simple;
	bh=Phtmrde8dBgcFIPUOC0UhFHOB9ZmeEfvJjTIvdASzI4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UR04QSgPMdyRx80IhpxUOKAVf8f/TV+pfkUVkgkvZLiOZHSRBGzg8H84h5KlUNqqsxUqfiS6+AK4IQYOOAZl1SB9aJN48bqz+GaeUx/Z5EPRXnADmnntourvV0DFqIDnc55M+x9Ngt6MgilbEWJen4FNCrOx8G1DJ5edyHCvs6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6aFvjy+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6aFvjy+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso15987475e9.3
        for <oe-lkp@lists.linux.dev>; Thu, 27 Mar 2025 13:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743108315; x=1743713115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zzKyajF7oNGF0qwnBdirsp90I5clYwoZjQnVl0xXPc=;
        b=J6aFvjy+eLq3udLDqxU4gKaeKIUhFDmZe1E1+Sl85zGmFLlBL8wEkQ8RLkhpy4XiO/
         3VWhWtcjxwOo4YwsKgzPzwyHnYO15d3rz3/CnZrtuBA7PmTo9OgXUm93a8UB7M0mTEbw
         fg7vk6AS4GxnaDD+bnxRKaD2H+JkaL5MPVFNnh4uzZtUxIt6/E34r+A19KUGmOZmPI3C
         7sfB5iGLLMDgnc9ZVvYiLzoYKsIRE4J5ZgvHl/qcgEaX94z4YRpDWaB6an3bi+t7xZb0
         XzPzDbTczrqZv1mah1X4PW4Z5wDMPYyk6a8Q2GG3kmF2mR+5U3fHzqTYUR8PJYQDtoaJ
         3N7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743108315; x=1743713115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4zzKyajF7oNGF0qwnBdirsp90I5clYwoZjQnVl0xXPc=;
        b=nyFrckyPFY561p2r2oE/+6FjMsDlieNBvcFQTWDUMr5UFm3mMA8M6IEtBe8HAsU4mI
         fPK9LljPwWbpoKyrqRQQdmItJXMlP8RBwPYtc8R9r5Y8wA9AZw344+zUsd1mMOjiF5pJ
         rYI2V/B6efmtAw1HTKAc7p+Z9+aCPyCH6i+yuI+ecyobL6tfCUjUCzLVDZz7uOE26h+C
         MZSEzxHvzkhIdqzQXBm5RyNUWDPlzrfa43t0UCTw4KsVHtHgJvWRd0cS3smQGjcATvUt
         sSkpIePR1rTkMer1mkrnHYlAq0GFmg/QUWZUhFU+WGtCi0LkT/bcpLlMo5Lcx2rBRVVk
         Qlwg==
X-Forwarded-Encrypted: i=1; AJvYcCUKwPsYujzOwXQQkhqrmiI/zKz0V2a+nOni6g8+LDwv88gxQsLKbn6GuTp+9LaZOxx8oVx9xfg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyxXFjv3WSlTVmiv0cRf/0H7iy/hV96iMsEq6lkVxgu6rctM9bc
	lXpHCYjA5YO+lAIO23CiB0KOeKgriO0pQp/M68nv9YPmvq8eX2+W
X-Gm-Gg: ASbGnctFI9aWCip0ElWk7PLPCRB29c/KXhnJ9HoGmFh1//uwGW1b6ZRyU+TRmt8f6SM
	x1XoV8XT8GTjzm3IOPJT1TukkTJK0dzSavTuIpNKqTUvbdMbHSzvUnaHvGzYtZcfkWPla1cB0MK
	Vz8SUgnH1zfMOmjecwkM4Len3rAKFnhB7/nrnwq4slRhSvw4kgWhW7uU2P50rNPRXAfI6HiZaN2
	PTvoKcdWQ3DdkAJtuY/9VLQjOsMtTfOwnCBLlHFxl8Zy4AuCaQSsrHB1Cm5dLhXX4Ik2Wm7v6o3
	Ivk5DUfAulZJ1ian5cVize5QM95TmigqD769p4O4naL87Ucqs51z9kEqBOiEfXoTYETVd+/7PeK
	4rbGj8A4=
X-Google-Smtp-Source: AGHT+IEnyvY3608uupuJH0rxI6+befyhbM8biTLTZNaXvryqIary1YtuDjkkrRajXGUDLnL6mwR+yw==
X-Received: by 2002:a05:600c:3ac5:b0:43d:7a:471f with SMTP id 5b1f17b1804b1-43d84fb5090mr53363245e9.18.1743108314736;
        Thu, 27 Mar 2025 13:45:14 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fbc1889sm5912415e9.16.2025.03.27.13.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 13:45:13 -0700 (PDT)
Date: Thu, 27 Mar 2025 20:45:12 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Eric Dumazet <edumazet@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, kernel test robot <oliver.sang@intel.com>,
 oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 x86@kernel.org, Benjamin Segall <bsegall@google.com>, Frederic Weisbecker
 <frederic@kernel.org>
Subject: Re: [tip:timers/core] [posix] 1535cb8028:
 stress-ng.epoll.ops_per_sec 36.2% regression
Message-ID: <20250327204512.548d2507@pumpkin>
In-Reply-To: <CAGudoHE_K4iBHSNjKEPuQxJJ-cNx_8f74dou7qdEb58Pc4eKBQ@mail.gmail.com>
References: <202503241406.5c9cb80a-lkp@intel.com>
	<87pli4z02w.ffs@tglx>
	<6sn76aya225pqikijue5uv5h3lyqk262hc6ru3vemn7xofdftd@sw7gith52xh7>
	<CANn89iKjCgmxtiLeVAiXODHbbR7=gYYi5cfAS1hS5qn+z=-o1Q@mail.gmail.com>
	<877c4azyez.ffs@tglx>
	<CANn89iKAkio9wm73RNi9+KngNaS+Au2oaf0Tz9xOd+QEhFSkyw@mail.gmail.com>
	<CANn89i+nAN+p-qRypKxB4ESohXkKVPmHuV_m86j3DPv6_+C=oQ@mail.gmail.com>
	<87v7ruycfz.ffs@tglx>
	<CANn89iJvxYsF0Y9jH+Oa2=akrydR8qbWAMbz_S6YZQMSe=2QWQ@mail.gmail.com>
	<87jz8ay5rh.ffs@tglx>
	<CANn89i+r-k-2UNtnyWC6PaJmO_R6Wc6UROgeoir5BmgVV8wDqQ@mail.gmail.com>
	<CAGudoHHVJWeRWPyArnYnJERPR2gyU0PzBTwx=wWKnCemry45Nw@mail.gmail.com>
	<CANn89iLGof+T6Ksp56vTXpwKdn60cJ7FWrm-Y-3TNmCNW+Hq_A@mail.gmail.com>
	<CAGudoHE_K4iBHSNjKEPuQxJJ-cNx_8f74dou7qdEb58Pc4eKBQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Mar 2025 14:48:37 +0100
Mateusz Guzik <mjguzik@gmail.com> wrote:

> On Thu, Mar 27, 2025 at 2:44=E2=80=AFPM Eric Dumazet <edumazet@google.com=
> wrote:
> >
> > On Thu, Mar 27, 2025 at 2:43=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.co=
m> wrote: =20
> > >
> > > On Thu, Mar 27, 2025 at 2:17=E2=80=AFPM Eric Dumazet <edumazet@google=
.com> wrote: =20
> > > >
> > > > On Thu, Mar 27, 2025 at 2:14=E2=80=AFPM Thomas Gleixner <tglx@linut=
ronix.de> wrote: =20
> > > > >
> > > > > On Thu, Mar 27 2025 at 12:37, Eric Dumazet wrote: =20
> > > > > > On Thu, Mar 27, 2025 at 11:50=E2=80=AFAM Thomas Gleixner <tglx@=
linutronix.de> wrote: =20
> > > > > >> Cute. How much bloat does it cause? =20
> > > > > >
> > > > > > This would expand 'struct ucounts' by 192 bytes on x86, if the =
patch
> > > > > > was actually working :)
> > > > > >
> > > > > > Note sure if it is feasible without something more intrusive li=
ke =20
> > > > >
> > > > > I'm not sure about the actual benefit. The problem is that parall=
el
> > > > > invocations which access the same ucount still will run into cont=
ention
> > > > > of the cache line they are modifying.
> > > > >
> > > > > For the signal case, all invocations increment rlimit[SIGPENDING]=
, so
> > > > > putting that into a different cache line does not buy a lot.
> > > > >
> > > > > False sharing is when you have a lot of hot path readers on some =
other
> > > > > member of the data structure, which happens to share the cache li=
ne with
> > > > > the modified member. But that's not really the case here. =20
> > > >
> > > > We applications stressing all the counters at the same time (from
> > > > different threads)
> > > >
> > > > You seem to focus on posix timers only :) =20
> > >
> > > Well in that case:
> > > (gdb) ptype /o struct ucounts
> > > /* offset      |    size */  type =3D struct ucounts {
> > > /*      0      |      16 */    struct hlist_node {
> > > /*      0      |       8 */        struct hlist_node *next;
> > > /*      8      |       8 */        struct hlist_node **pprev;
> > >
> > >                                    /* total size (bytes):   16 */
> > >                                } node;
> > > /*     16      |       8 */    struct user_namespace *ns;
> > > /*     24      |       4 */    kuid_t uid;
> > > /*     28      |       4 */    atomic_t count;
> > > /*     32      |      96 */    atomic_long_t ucount[12];
> > > /*    128      |     256 */    struct {
> > > /*      0      |       8 */        atomic_long_t val;
> > >                                } rlimit[4];
> > >
> > >                                /* total size (bytes):  384 */
> > >                              }
> > >
> > > This comes from malloc. Given 384 bytes of size it is going to be
> > > backed by a 512-byte sized buffer -- that's a clear cut waste of 128
> > > bytes.
> > >
> > > It is plausible creating a 384-byte sized slab for kmalloc would help
> > > save memory overall (not just for this specific struct), but that
> > > would require extensive testing in real workloads. I think Google is
> > > in position to do it on their fleet and android? fwiw Solaris and
> > > FreeBSD do have slabs of this size and it does save memory over there.
> > > I understand it is a tradeoff, hence I'm not claiming this needs to be
> > > added. I do claim it does warrant evaluation, but I wont blame anyone
> > > for not wanting to do dig into it.
> > >
> > > The other option is to lean into it. In this case I point out the
> > > refcount shares the cacheline with some of the limits and that it
> > > could be moved to a dedicated line while still keeping the struct <
> > > 512 bytes, thus not spending more memory on allocation. the refcount
> > > changes less frequently than limits themselves so it's not a big deal,
> > > but it can be adjusted "for free" if you will.
> > >
> > > while here I would probably change the name of the field. A reference
> > > counter named "count" in a struct named "ucounts", followed by an
> > > "ucount" array is rather unpleasing. How about s/count/refcount? =20
> >
> >
> > How many 'struct ucounts' are in use in a typical host ?
> >
> > Compared to other costs, this seems pure noise to me. =20
>=20
> I did not claim this is going to increase memory usage in a significant m=
anner.
>=20
> I claim regardless of this change a 384-byte slab for kmalloc may be
> saving memory and this bit may be enough of an excuse to evaluate it,
> should someone be interested.
>=20
> Apart from that I claim that if the 512-byte is going to be used to
> back the 384 bytes used by the struct, the patch can trivially move
> the refcount to a dedicated cacheline to avoid some of the bouncing
> and still fit in the 512-byte allocation. I see no reason to not do
> it.
>=20

What about systems with much larger cache lines?

	David


