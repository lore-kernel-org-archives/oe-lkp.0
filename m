Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3841D1DEFEE
	for <oe-lkp@lists.linux.dev>; Mon, 28 Oct 2024 17:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730136222; cv=none; b=UPTxqlisaQmveWVHw2dtiIR01/E+a1zlj4MXlTkfBLMajIoWDXQS1RJWBRFlyNxYHPOHEL1tGWea4EtVklp39jVgXPrKSxhTqtCxfEfdhN2G5hfkuxTgMwL3fMYGkk4sGJy8H/7+R1OWPMqoQMbuQIsr/byGUYypcVUSIG/VHP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730136222; c=relaxed/simple;
	bh=BgoGY13/0A9hg+yn9ilgipvRMLg4bgsrT2lMBaCPQsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xx/AhAH9rFY1n8tVv+NlMUiSkHpMTS5SYzFLw98t8JaWOEvRfqTPC8SGA5yK3V1dKF8MjoVv7g6fqKUP7rAA318wrixhDTBoHh1GmhHA9N2VHKzoGAGLT/dFIZWleqySPqR8Ti/QL+nZDQMUeWXGK9uMOIgkeOIsSxT6kMx2pZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hu7mxg8M; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hu7mxg8M"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539e66ba398so1470e87.0
        for <oe-lkp@lists.linux.dev>; Mon, 28 Oct 2024 10:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730136217; x=1730741017; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgoGY13/0A9hg+yn9ilgipvRMLg4bgsrT2lMBaCPQsM=;
        b=Hu7mxg8MQSzgQZifHsKnbpkK5X78Sa+ifcysG9xFG0thxZOFQQXvghOh+UyBTiiL4z
         g6eqbprKnhU+dlwdERrC1UOgqDjP9ggP+TMzOae60EmW8R4MC4TEAonopC6NrHGsCDhD
         vnL5mN57IDFHYOSjFiLB3n46jQlXK9uS4WmTSGPq0xQ23ncd7tT6Zp1FaWww88selWt8
         Y1hfkZgOY21t8tH4O52baVV3AMhbh04wsBIYnDi6ij/u3Xv+nOlcFxjSs0GD1sQzhOtx
         clUCJLFEEHrbPPHyjdbtwGqA1kQs5Wrb2NPA9Tb9gm0cbPCi0dhWDJAEAVf/IE18eWc3
         0CPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730136217; x=1730741017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BgoGY13/0A9hg+yn9ilgipvRMLg4bgsrT2lMBaCPQsM=;
        b=BONyznRd2d71vsX4ui2d3atRNZI4b39fbMb7BzRTVJz8pkl66GeXNdMtk1fE/O+7xl
         5TA3OIxeDLV1oRJP42y3ISgNyrKv6t9NgSokB0ExDpdbEDDZ4mou/It57Koor6Xz1V9R
         cwxG50XYvpmoNpAHsP0IMxDLFEv9PHbXGgid7whEuNsMKE1XXxwlfYeAjxfTIzn0+4Ii
         +HOB6aTDpihIE1xmmSWMHshGyGUbhQEcaBXMzIbndQRAf6igvOAokEFGIi/Hq3iy41MP
         Y8iu+7tpT99disQa82XwUkmmbK2WMCwT2HPNSEmDhZj0bmowMH7aYU9pYzBeUvNmDxjE
         0H+g==
X-Gm-Message-State: AOJu0YyMQDQ6yLS6Y36TwV6TuPS0MR+bzVF0GCEXtiT1g5iBC4ETDLPj
	E1JJBTFmgGZlcXXFi4HEfD8mjJMSbj0MjGF95+Q4ImZHfQ1kPvpNut1a3Rqhbp4HV09cx/Z+8LH
	ds+/sRkuhXKKJOHZvdlByOKwqWDnsY8HreuL/
X-Google-Smtp-Source: AGHT+IGE/0PVwPVSEY3Y9J6zjY8sqDS5x9M/SZVk5DXxZEOmDhpQLbE3pqhER4neGQ641EaQZaWsr/irY8P39SGvI9U=
X-Received: by 2002:a05:6512:1188:b0:539:d0c4:5b53 with SMTP id
 2adb3069b0e04-53b348e3700mr369451e87.4.1730136216904; Mon, 28 Oct 2024
 10:23:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410281414.c351044e-oliver.sang@intel.com> <CAH5fLggdtev=scJ1C9EefZf-fVrMvgMbfD+b_T5vFfHqNTn8Kw@mail.gmail.com>
 <CABCJKudR2UwvR8x4MwKYPmHETMz+aoiXEXz135BoufTF9Pt2Gg@mail.gmail.com> <CAH5fLghwEGCAxCR+OifGYh3jKK4jJqa-AX3gMUdN0HETBNBkYg@mail.gmail.com>
In-Reply-To: <CAH5fLghwEGCAxCR+OifGYh3jKK4jJqa-AX3gMUdN0HETBNBkYg@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 28 Oct 2024 10:22:58 -0700
Message-ID: <CABCJKufypN0c6EwiexQufjxMss-Y_fYdp+2XdpXU=4mmf2ZYgg@mail.gmail.com>
Subject: Re: [linus:master] [cfi] 8b8ca9c25f: CFI_failure_at_do_basic_setup
To: Alice Ryhl <aliceryhl@google.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	kernel test robot <oliver.sang@intel.com>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 8:18=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Mon, Oct 28, 2024 at 4:15=E2=80=AFPM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > On Mon, Oct 28, 2024 at 1:34=E2=80=AFAM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > >
> > > Hmm. This config has:
> > >
> > > CONFIG_CLANG_VERSION=3D190102
> > >
> > > Sami, is the fix not available as of llvm 19?
> >
> > Looks like llvmorg-19.1.2 doesn't have the fix, which means it won't
> > be available until LLVM 20. :/
>
> It's not going to land in a patch release of llvm 19?

It won't land to 19.x automatically, but I requested a backport:
https://github.com/llvm/llvm-project/pull/113938

Sami
