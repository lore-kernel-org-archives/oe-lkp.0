Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063181E2603
	for <oe-lkp@lists.linux.dev>; Wed, 30 Oct 2024 09:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730281674; cv=none; b=CAbz5yazPl7+A8TiVjqFPVWclCWI2LMTtuLJn5f49YZhwtZ+bwpoCxZr1q2fof/vjA+bUdzF9VOpW9m3EkAaD7NljzOI5tGKwRlbttc3hMTkaLMqiDFHvl9Gv+ATerSSzMBd+vMbDdZVd8f0omYdPmwzIFrg4Z7Z7w2SjJSJP5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730281674; c=relaxed/simple;
	bh=hi1vS7M7Cb02oiFGZI7mPIfB3ALjkTP8s1aT83tB9RA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h8qQkS6jKUBTIt9y3uoeJJ6ozjsCZWGh64KWLUUNDuQ9fVYN46y0/s7R6ZkT8NfEe75Q99c4AEy5F4VAuMR38ObeFgt7HBM2uOjHEgwjhS7qOTvnqm2Lm6MIrTmWGDw77N2Ajb1nK6EGmiRaVAhMz3bVx8KsymLgiG33L27y/N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XZO7qbu7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XZO7qbu7"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso60187245e9.1
        for <oe-lkp@lists.linux.dev>; Wed, 30 Oct 2024 02:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730281670; x=1730886470; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hi1vS7M7Cb02oiFGZI7mPIfB3ALjkTP8s1aT83tB9RA=;
        b=XZO7qbu7d2WN4ILU1wrJrl7d2kBBPN05A2YGWCi7w1NVn1WZB5vaGG3ARoOqk3TSfr
         le+Lyuyz/zQTBypBiIMZyEpIkb+MKMgAE1oeHRKadP3R4lFtO8feaYNK9AZ9vywaIJtn
         SmFFJi3ewWief4R9c7LpmBXaguybVZsNBGd0JOlZgOwPzfxxoBiDeVNijDY+myDBqoIq
         P79p/dKItehjtKj2NM8XLGfgSLoMct4gSlltYCgjHLpsW+ybbfgWYIR8djS3fczXpE81
         HFc+UP1vazBX6q9ooNQOP+ywglcrWfMVt29apiEAu0w2ze+AdoxxHZlR2ZFJSVyloyUC
         V/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730281670; x=1730886470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hi1vS7M7Cb02oiFGZI7mPIfB3ALjkTP8s1aT83tB9RA=;
        b=ZTYs2aV668zaZw72Rnu01fsa8a2Yt6o7CQscQhoBBZXJkSx4re/oNvvevkt0KA92TR
         dUtuu/VsN0+Hd8gjXmDJ58qNPzSZK1z4N3c55gbQIrAInDwRIuGwTdeYlkKlAuyK0dWo
         qEeeDGnVrn5BgPDQ9uXpt8b2Pr1tBmp1DwYUgB1ik5FhfNaYpNqMyv0FHeUAIUou4ogw
         dDOy1/O12DXfXiA7ZrAZd7mFrhx6+8Ek4ZXy7MEHAiHbnTCVa38C43ALPyCylP534Gpr
         eLJiW2uMzTkuapcOHiMiqUp1dUs1XCLUlO2V5SRERN++tEDNZsAJVHGySeNODgnskggD
         Rl3g==
X-Gm-Message-State: AOJu0YyhDXknbO5H25XzfUqk11zH9B644pOK/wKSNo+AJEvNWmsGnUC9
	Ml1j8KC6r8qLw4fvS8EklhJpeMgXFQxmxOSjbhghvmf01dIzUEQ5XF57kBDnZRQMUGryNfzusrq
	8DneMvRx7oO4xrE0rW5fqsAWKu4t9utZehbeR
X-Google-Smtp-Source: AGHT+IEzMsmpWu43poaWWVqNaNJFdcXi+tTW86H6Qn6hltbtJBiOz/MZmz6DsXj0dlgOT/6hVbIWsWPMSHIc1a/EcuM=
X-Received: by 2002:a05:600c:3ca3:b0:42f:823d:dde9 with SMTP id
 5b1f17b1804b1-4319acbba20mr140922575e9.21.1730281670298; Wed, 30 Oct 2024
 02:47:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410281414.c351044e-oliver.sang@intel.com> <CAH5fLggdtev=scJ1C9EefZf-fVrMvgMbfD+b_T5vFfHqNTn8Kw@mail.gmail.com>
 <CABCJKudR2UwvR8x4MwKYPmHETMz+aoiXEXz135BoufTF9Pt2Gg@mail.gmail.com>
 <CAH5fLghwEGCAxCR+OifGYh3jKK4jJqa-AX3gMUdN0HETBNBkYg@mail.gmail.com>
 <CABCJKufypN0c6EwiexQufjxMss-Y_fYdp+2XdpXU=4mmf2ZYgg@mail.gmail.com>
 <CAH5fLggiMkB5g7=hxN-a+9M3vMxWdoB1QCyX9D3+-_oJ7duQ5Q@mail.gmail.com> <CABCJKucqMyJa+GNZd909GLvrUPfKS4hN8-ac=2GMH6y3fT=q9g@mail.gmail.com>
In-Reply-To: <CABCJKucqMyJa+GNZd909GLvrUPfKS4hN8-ac=2GMH6y3fT=q9g@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 30 Oct 2024 10:47:37 +0100
Message-ID: <CAH5fLgisaG8vRS6douNUuXOgp4ZsM=nD_ZLosE=q193K5pjvLw@mail.gmail.com>
Subject: Re: [linus:master] [cfi] 8b8ca9c25f: CFI_failure_at_do_basic_setup
To: Sami Tolvanen <samitolvanen@google.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	kernel test robot <oliver.sang@intel.com>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 4:19=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> On Tue, Oct 29, 2024 at 2:09=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > On Mon, Oct 28, 2024 at 6:23=E2=80=AFPM Sami Tolvanen <samitolvanen@goo=
gle.com> wrote:
> > >
> > > On Mon, Oct 28, 2024 at 8:18=E2=80=AFAM Alice Ryhl <aliceryhl@google.=
com> wrote:
> > > >
> > > > On Mon, Oct 28, 2024 at 4:15=E2=80=AFPM Sami Tolvanen <samitolvanen=
@google.com> wrote:
> > > > >
> > > > > On Mon, Oct 28, 2024 at 1:34=E2=80=AFAM Alice Ryhl <aliceryhl@goo=
gle.com> wrote:
> > > > > >
> > > > > > Hmm. This config has:
> > > > > >
> > > > > > CONFIG_CLANG_VERSION=3D190102
> > > > > >
> > > > > > Sami, is the fix not available as of llvm 19?
> > > > >
> > > > > Looks like llvmorg-19.1.2 doesn't have the fix, which means it wo=
n't
> > > > > be available until LLVM 20. :/
> > > >
> > > > It's not going to land in a patch release of llvm 19?
> > >
> > > It won't land to 19.x automatically, but I requested a backport:
> > > https://github.com/llvm/llvm-project/pull/113938
> >
> > Thanks! Looks like it already landed. Which patch version will it land =
in?
>
> It should be in 19.1.3.

Looking at
https://github.com/llvm/llvm-project/commits/release/19.x/

it landed after commit 17365dfd2101 ("Bump version to 19.1.3"), so
does that not mean it will land in 19.1.4? Or does the repository bump
the version at the beginning of the version range rather than after?

Alice
