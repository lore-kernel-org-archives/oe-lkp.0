Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F143C18E028
	for <oe-lkp@lists.linux.dev>; Tue, 29 Oct 2024 15:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730215177; cv=none; b=WBJsBCzxi923BUDXoiMwBx9XBBvYZWjqsrAK+H95XLGZwzBcFHx+iuzLzgx9UAIq5RQm3M070pFiZ9cbCHDqRCWbT8Tpdku0VYUgUHpuTzugRfpGm5gxER4Tgh0xhPtnB7d65V7Z3VbAMMwXnyNECCKFYVVjf25qIyR6PSMYQJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730215177; c=relaxed/simple;
	bh=QIOEFvu4FMncIty+EQ4CDd4qN6V5DqirfrcW+1k0Jgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXoxn7m/j+7cqmycLCieYri0ZANDQ4tbaLKkbhI2v/BD0CE/JZdQLwVDz2KROThg+Fb4Jy76kYqTUPUzMgd2G6KhBbplvhG16h/5bS5U4AaFri5G5AVdWBsyriOOlAqKGQK7ag8wll9EpOuGDsJ1hGXoVauyah6AEkkt+GXvx+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QZMak08P; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QZMak08P"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4315ee633dcso234675e9.1
        for <oe-lkp@lists.linux.dev>; Tue, 29 Oct 2024 08:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730215173; x=1730819973; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIOEFvu4FMncIty+EQ4CDd4qN6V5DqirfrcW+1k0Jgc=;
        b=QZMak08PMBq2VjLSQgGbXrnApTeKlOdfbz2d5cnBNGXRtPR081kErJ90/x19GaTtFx
         rqxQsUMVuntr7D6VaRBmD3WTi9sh4QPb8E7KwrhKze4HO/DwjOJ1hRIZfZ7XwC9MDW6t
         3SGBdPfdorNLUNw2R5XKJUtNd9f3M2knH9P19CY3oL58MXwUW2tEXR0m6VkXy7yiTQEM
         nC5KxFjLh2PVLTUZZCa0HhdT/g29E9l+vMzksYyp0ChcOK1lQEAh7dRtPaEYbQwdxQI1
         mH62FCJuuYkhYmiyDPJHYh0MnVMNsUj3yewbFXi8wvt/QzhHRROepEoxJkrIg44JqMLJ
         wxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730215173; x=1730819973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIOEFvu4FMncIty+EQ4CDd4qN6V5DqirfrcW+1k0Jgc=;
        b=d7jrghb8XU44Vw/hkXnIytJAqDCIV79rV2HscYG4Nj+FsaXemiz+UHvuXOGk7iBcgJ
         eOBVQct++XHB3wm6OFSdfw5aGvqoJy56hS54buXr+r13/RzsFdxVq/s+jU0Vy7ZS1+nl
         ieFAMGtmLjlJQb0M9HbMyadJEYwIigsh8Hv//I20KzI4GNokT+0OilmY8aebB0RhLT38
         85gVJbsFd4eHS+bXUsuvplXIe/p8pqsCf4pFKp1qiO46lihawrJ3S/RuW9gz4pgfiSYG
         R8JLrT4zGW2AP4Me8pUz82jzjF1JgzhcfjdVcT2CVmffzpozPIc4OFJ+6emCb7XlasAE
         u0xQ==
X-Gm-Message-State: AOJu0Yz6hR47LHtPSJiAGWchyeLE7zo/D3xi0hU2NU78RdAHsabU+lWu
	TgUtbrmTLxOpk+laJ1VlECIN5PE+ljks81wPwE+fVu4eSnyXRU3FqqFYTSRppr73KVp1sgu/hS6
	RPeI54II4C7gfnvn4BIjaMObdv222K0bcUOFP
X-Gm-Gg: ASbGnctc9F0PmZrWd25xZf1M23R3aD7BFmgTzdTz5HX30WJv1aCCe3GTxgsxOClfqJD
	bu5aN6jxyiqH1NRBFPL59Ar8ktAef
X-Google-Smtp-Source: AGHT+IHu1NlcguibIZqU5bOGPh7SLbPXvlIkXx5brhOqK848UqAFYgPPZ6g4zp4aNdE3qqvrj7UMkAPrUNhisNoxLXo=
X-Received: by 2002:a05:600c:34d1:b0:426:7018:2e2f with SMTP id
 5b1f17b1804b1-431b4a39c00mr4083995e9.5.1730215173087; Tue, 29 Oct 2024
 08:19:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410281414.c351044e-oliver.sang@intel.com> <CAH5fLggdtev=scJ1C9EefZf-fVrMvgMbfD+b_T5vFfHqNTn8Kw@mail.gmail.com>
 <CABCJKudR2UwvR8x4MwKYPmHETMz+aoiXEXz135BoufTF9Pt2Gg@mail.gmail.com>
 <CAH5fLghwEGCAxCR+OifGYh3jKK4jJqa-AX3gMUdN0HETBNBkYg@mail.gmail.com>
 <CABCJKufypN0c6EwiexQufjxMss-Y_fYdp+2XdpXU=4mmf2ZYgg@mail.gmail.com> <CAH5fLggiMkB5g7=hxN-a+9M3vMxWdoB1QCyX9D3+-_oJ7duQ5Q@mail.gmail.com>
In-Reply-To: <CAH5fLggiMkB5g7=hxN-a+9M3vMxWdoB1QCyX9D3+-_oJ7duQ5Q@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 29 Oct 2024 08:18:54 -0700
Message-ID: <CABCJKucqMyJa+GNZd909GLvrUPfKS4hN8-ac=2GMH6y3fT=q9g@mail.gmail.com>
Subject: Re: [linus:master] [cfi] 8b8ca9c25f: CFI_failure_at_do_basic_setup
To: Alice Ryhl <aliceryhl@google.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	kernel test robot <oliver.sang@intel.com>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 2:09=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Mon, Oct 28, 2024 at 6:23=E2=80=AFPM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > On Mon, Oct 28, 2024 at 8:18=E2=80=AFAM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > >
> > > On Mon, Oct 28, 2024 at 4:15=E2=80=AFPM Sami Tolvanen <samitolvanen@g=
oogle.com> wrote:
> > > >
> > > > On Mon, Oct 28, 2024 at 1:34=E2=80=AFAM Alice Ryhl <aliceryhl@googl=
e.com> wrote:
> > > > >
> > > > > Hmm. This config has:
> > > > >
> > > > > CONFIG_CLANG_VERSION=3D190102
> > > > >
> > > > > Sami, is the fix not available as of llvm 19?
> > > >
> > > > Looks like llvmorg-19.1.2 doesn't have the fix, which means it won'=
t
> > > > be available until LLVM 20. :/
> > >
> > > It's not going to land in a patch release of llvm 19?
> >
> > It won't land to 19.x automatically, but I requested a backport:
> > https://github.com/llvm/llvm-project/pull/113938
>
> Thanks! Looks like it already landed. Which patch version will it land in=
?

It should be in 19.1.3.

Sami
