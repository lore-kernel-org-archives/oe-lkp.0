Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE30204027
	for <oe-lkp@lists.linux.dev>; Tue, 29 Oct 2024 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730192947; cv=none; b=XX5wiYIhtQyKct7pAeUd6wNrULp8OxS4WQ5WUf1zYSNeZqgrIm+PPAeuLwNpglgW6v1dM9vX5FBh2QNKaveO3war78irgp1HK6HaB5l4QkjCMoDnrlG24NvAC+fwUbSUjN6pmf/mLDYVyUtF6R2nIG3BVquPbM/p75c1qRD3zaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730192947; c=relaxed/simple;
	bh=Ybash4pv5nyVrAZaJt2dYgUqiEmKyR3rbX3Iwp7HQHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j1aNITWnvHCZf7FVZtAW4Wj/qtEOzlgujTk/rhfyJ/X/BExEyuxWvL5CHbfgIoYI7TuaUfjDK02HOZRQpfATcV7DZM94abxxJBub6cRI6VI+qQWY6cN9FUNKWuH2nKm2hGDmNbCYo2kXsu3gOD+hbND5zIikSVY4sDh8zKMRDyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sjuEfgLq; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sjuEfgLq"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4319399a411so38919115e9.2
        for <oe-lkp@lists.linux.dev>; Tue, 29 Oct 2024 02:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730192944; x=1730797744; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ybash4pv5nyVrAZaJt2dYgUqiEmKyR3rbX3Iwp7HQHM=;
        b=sjuEfgLqAR0uoGJQgJNkYnXwrHBLsgWpyY3C8pdj2Nn6+/cXgSTa4cTa3lgNvhSvUA
         0nJDchYsdWlmteupTUA0jyleY+9vLnaEPDp/52bGlpdEcz6nrwE/e2yev7E0+fCgm5zV
         7iS8i4I3D8vwQatoUQs9eAdLJPy7eB3G1ZzFYtfIa/gnY6TcavBV4dWtwziz6PkTE7Ge
         EDd/gnN4VlU8Z5YbvWFM3hVYuSIOOqnIx/OrhUuDxI1o9uyomYtifPzii2PEi59gBFjk
         uA4ZwF1XCdtDOSavaGTCPjkPbkrGJfFSThTcwEL5Ph9UgaYRg4qWDPP4lee/GX61oju+
         Y+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730192944; x=1730797744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ybash4pv5nyVrAZaJt2dYgUqiEmKyR3rbX3Iwp7HQHM=;
        b=jlrVSfF67KTb+ecG/W8Z7lK0ef37yFhPLgH/2Uu3veR5J9JXK38G39PnNjc3vr/D5J
         OeMalRgGJxu1+VZbl6nvuA6ZmeT/1me0o0VHGYwE+dNWCH6iHyjUx25kHfS47toMEkCx
         igqq37odMptilunOlNnWE3JXu/FIXEOIB1Ipn34D3Mpm8eDSX0jmUJJ9hiQs50RM4wGD
         4wyXHhXUSSkIAMUpFjk4g+gs+livQgCdbGz1efGhULPmIGZ/ZEIB1Oeh2gf1Lo0V/NFb
         E1/1rk7FcagFSZDOmHXgl2V08XuZUVyOXy4EjxOR3CMYF2BlhNlIbaWJZQ55N8boPJ1J
         zT1Q==
X-Gm-Message-State: AOJu0YyOAQzdyvuC1BOcywNl8hUmKDTMi/bT5ynSfabqgHxtV2ZiodMU
	y5ebgD09nXRAeFkNEWn8tZoWceiDzM3Ke7q2/JJiV7MbeKxeXxPVQ6nDtU0XA7FMTuiWlVLZqCR
	7RPeDvdhCKewPnIfhUgMFAJ2w01qLD8CLKObU
X-Google-Smtp-Source: AGHT+IGYeyyFOmhi43shzOqo9SvBKhlltr3fgWBBXUTNjlb8ExPC2NAWDNo7iiRGPVSUcdTWjzMUtyNrzJso9FcYum0=
X-Received: by 2002:adf:a450:0:b0:37d:4ebe:1644 with SMTP id
 ffacd0b85a97d-380611e34b4mr7318682f8f.43.1730192943863; Tue, 29 Oct 2024
 02:09:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410281414.c351044e-oliver.sang@intel.com> <CAH5fLggdtev=scJ1C9EefZf-fVrMvgMbfD+b_T5vFfHqNTn8Kw@mail.gmail.com>
 <CABCJKudR2UwvR8x4MwKYPmHETMz+aoiXEXz135BoufTF9Pt2Gg@mail.gmail.com>
 <CAH5fLghwEGCAxCR+OifGYh3jKK4jJqa-AX3gMUdN0HETBNBkYg@mail.gmail.com> <CABCJKufypN0c6EwiexQufjxMss-Y_fYdp+2XdpXU=4mmf2ZYgg@mail.gmail.com>
In-Reply-To: <CABCJKufypN0c6EwiexQufjxMss-Y_fYdp+2XdpXU=4mmf2ZYgg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 29 Oct 2024 10:08:50 +0100
Message-ID: <CAH5fLggiMkB5g7=hxN-a+9M3vMxWdoB1QCyX9D3+-_oJ7duQ5Q@mail.gmail.com>
Subject: Re: [linus:master] [cfi] 8b8ca9c25f: CFI_failure_at_do_basic_setup
To: Sami Tolvanen <samitolvanen@google.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	kernel test robot <oliver.sang@intel.com>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 6:23=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> On Mon, Oct 28, 2024 at 8:18=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > On Mon, Oct 28, 2024 at 4:15=E2=80=AFPM Sami Tolvanen <samitolvanen@goo=
gle.com> wrote:
> > >
> > > On Mon, Oct 28, 2024 at 1:34=E2=80=AFAM Alice Ryhl <aliceryhl@google.=
com> wrote:
> > > >
> > > > Hmm. This config has:
> > > >
> > > > CONFIG_CLANG_VERSION=3D190102
> > > >
> > > > Sami, is the fix not available as of llvm 19?
> > >
> > > Looks like llvmorg-19.1.2 doesn't have the fix, which means it won't
> > > be available until LLVM 20. :/
> >
> > It's not going to land in a patch release of llvm 19?
>
> It won't land to 19.x automatically, but I requested a backport:
> https://github.com/llvm/llvm-project/pull/113938

Thanks! Looks like it already landed. Which patch version will it land in?

Alice
