Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC991BC074
	for <oe-lkp@lists.linux.dev>; Tue,  2 Jul 2024 17:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719943097; cv=none; b=E2y9SjHq5uHZd2aEbfq6iiqum5+17ZXk3ZPrEyL/AvIRgqNy84O+3Qkc0RIlTLvsUdkJt13BflqkMK2eXSwf/ldgbAXpf8MvofVtowlb8dLhuLtA57JN9vFiuJHJlbQCBdBURkv7ZdiEmDDQeBoHuvuQwQLbbaU9xjdwN8pXRm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719943097; c=relaxed/simple;
	bh=6GV0ZhDNGPCuwYUPJDb43qoIpqlccrEfWt2pjGeAkCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DSkTp5u6hKeM6gvvPLaYIKy9NQLJUmj4NPsbJaMn4Eo5jHHwuHRQVHDjLRX7ic2+pc/VosMWZn2BAzJKAivWFL/9cQpK+tBcJH5xzKlMH+qRU08sq9PDjYGiCM6yVWZkKuj8ob6h9vi5zt2HY3HhMUZZDPdBY/mwN97S5EZ64Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AuJ6sxMc; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AuJ6sxMc"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a729d9d7086so877258766b.0
        for <oe-lkp@lists.linux.dev>; Tue, 02 Jul 2024 10:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719943094; x=1720547894; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GV0ZhDNGPCuwYUPJDb43qoIpqlccrEfWt2pjGeAkCk=;
        b=AuJ6sxMcmL1TdB8tgJGOO+m7tKZ8rob8Y072L3e1I52Rm0VSMJM7shaEYB8qj5Mnqe
         7dOUVs1z25mcChJnPHVBkIYQx1LJiaKQmPDGBM8zrM/0vqjK1qS4l2/y0ru7Ndzm43AD
         jwpVoP/4pW+5Vp+LVMuOp/hpxaBEOVZIK48b6u4GfhN8Fw91Ewm0qKxTLf1A2hpzsaIY
         ExDOoUWUidd+eZAeHLf4/DOiw5dNn8IoWHeBjtgcGzLcz3P2FOFamL1xgV94QF68kmDk
         VXyBpV3Q+jAiAS5ABOZbEiFXkCOj0K050h2rAk/Y5RKD6s1O2ejDXaaWVDBCOIVlmb7b
         4NqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719943094; x=1720547894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GV0ZhDNGPCuwYUPJDb43qoIpqlccrEfWt2pjGeAkCk=;
        b=wJ5W4tSpL/EmHbozlKXynLfD4VEevJPRK9RhwwrLuaupMv0CZqnbbORJAYhewyn9Jl
         zTjKeFmk5CyNd5fLrr3HT6nTuW6DzPfhVKmLMcYPB8yUSu++OnOiZdI6c8U99at+frn4
         7m6sEJHi+UoSV1093UvHQQodB1S6yMEzD6RGsewc71MuIX/umnNRsOpstjKM/mYt3B6u
         b/ukVXJTIJtKX1EgWlcBRmRwQ3tYSYB52jqmJfBfxigKHFWXICwINZC/pu81ApE5W+BE
         xrr3lJqIoOPjt9/zLMIY41XeCLx2WsUV2iGVqrPKGnTcwaKyeOMOcnJBm5G68CVOPex0
         Ipsg==
X-Forwarded-Encrypted: i=1; AJvYcCWb9EX3ZMFvrJZAn6h9JGJvbcA0trtzrNysd3ztE0KuDmEOaEtsHqzqeMgpDv9O6dBj0AOM79qIKIuE7UjZeNvJtNxXMcWL
X-Gm-Message-State: AOJu0Yxn2DPSWtbbSIbiJ/U4r4esPo6OGBdafSSMsmfaHXlkAT5XLvbt
	5yryfB7KI4zH6qvOaNAP5SnVyj4cLHusndWuetjEPD21XA4WxU1OhDwP//1QQkjSK6tycXoGWIZ
	Tjn97lShkSvqohlQVVLtLNiJCcOk=
X-Google-Smtp-Source: AGHT+IHI8nHlXGtLgZucq/ZQPSk2r2VMZ8lQcnPCPPR3PyRgxYqNVt/2Qu+XeyFvQ5tUdULGlIastBJNp96WssLMxB8=
X-Received: by 2002:a17:906:5acb:b0:a6f:c24a:721e with SMTP id
 a640c23a62f3a-a7513935e17mr752283766b.30.1719943094018; Tue, 02 Jul 2024
 10:58:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406270912.633e6c61-oliver.sang@intel.com> <lv7ykdnn2nrci3orajf7ev64afxqdw2d65bcpu2mfaqbkvv4ke@hzxat7utjnvx>
 <vgg45kxk2fiyznm44w2saz3qjiwrjp3spvpswsl4ovd2jl5c5g@54dlbd4kdlh4>
 <CAHk-=wgnDSS7yqNbQQ9R6Zt7gzg6SKs6myW1AfkvhApXKgUg4A@mail.gmail.com>
 <CAGudoHGuTP-nv=zwXdQs38OEqb=BD=i-vA-9xjZ0UOyvWuXP_w@mail.gmail.com>
 <CAHk-=wgVzKtRnvDXAzueJTbgfo1o12Lw6DH97PzRe1cGA_b1oA@mail.gmail.com> <CAGudoHH_z1a6MX8Z8Cqbz-jDTUoAjoxdV9KrQ6yvUkNszXO5aw@mail.gmail.com>
In-Reply-To: <CAGudoHH_z1a6MX8Z8Cqbz-jDTUoAjoxdV9KrQ6yvUkNszXO5aw@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 2 Jul 2024 19:58:02 +0200
Message-ID: <CAGudoHHg-T+ZOTm0fSpW0Hztfxn=fpfnksz5Q3=3YeCeEPo7LQ@mail.gmail.com>
Subject: Re: [linux-next:master] [lockref] d042dae6ad: unixbench.throughput
 -33.7% regression
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, 
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 7:46=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> wr=
ote:
>
> On Tue, Jul 2, 2024 at 7:28=E2=80=AFPM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Tue, 2 Jul 2024 at 10:03, Mateusz Guzik <mjguzik@gmail.com> wrote:
> > >
> > > I was thinking a different approach.
> > >
> > > A lookup variant which resolves everything and returns the dentry + a=
n
> > > information whether this is rcu mode.
> >
> > That would work equally.
> >
> > But the end result ends up being very similar: you need to hook into
> > that final complete_walk() -> try_to_unlazy() -> legitimize_path() and
> > check a flag whether you actually then do "get_lockref_or_dead()" or
> > not.
> >
>
> Ye, the magic routine to validate if you can pretend the ref was taken
> would wrap it.
>
> > It really *shouldn't* be too bad, but this is just so subtle code that
> > it just takes a lot of care. Even if the patch itself ends up not
> > necessarily being very large.
> >
> > As mentioned, I've looked at it, but it always ended up being _just_
> > scary enough that I never really started doing it.
> >
>
> I implemented something like this as a demo in FreeBSD few years back,
> it did not blow up at least. The work did not get committed though
> because I could not be arsed to productize it.
>
> tbf if anything the only shady things here that I see is that stat et
> al do their work without any locks held nor seqc verification in
> current kernel.
>
> In FreeBSD this was operating directly in vnodes (here one can pretend
> it's inodes). In that system I added sequence counters to the vnode
> itself and any state change like write, setattr, unlink or whatever
> would bump it. Then something like stat could safely read whatever it
> wants in a lockless manner with the final check for maching seqc
> indicating nothing changed.
>
> Not having a "someone is messing with the inode" indicator (only with
> a dentry) in Linux is definitely worrisome when pushing RCU further,
> if that's what you meant.
>
> Again, I'm going to poke around if only for kicks when I find the time
> and we will see what happens.

Suppose the rcu fast path lookup reads the dentry seqc, then does all
the legitimize_mnt and other work. Everything, except modifying the
lockref. The caller is given a mnt to put (per-cpu scalable), dentry
seqc read before any of the path validation and an indication this is
rcu.

Then after whatever is done if the seqc still matches this is the same
as if there was lockref get/put around it.

The only worry is pointers suddenly going NULL or similar as
dentry/inode is looked at. To be worked out on per-syscall basis.

Unless I'm missing something.
--=20
Mateusz Guzik <mjguzik gmail.com>
