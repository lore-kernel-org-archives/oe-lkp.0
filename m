Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053171E2319
	for <oe-lkp@lists.linux.dev>; Wed, 30 Oct 2024 09:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730282078; cv=none; b=VNhVzWdaZBvRlqs7zMrORY9MuzyeW89XFY6QeW+L96FyncR4iTv6c4bEADVpJz0uRt6JLV+QQm0FoXOTcfh5VoNC7eGOwdT76ZSOUXulZbR5W1a+gBjgqRf1+StMZPy2p37VWRMfvNm5CZUNh6RrbGr5zH1rbVIDVyypZwInGjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730282078; c=relaxed/simple;
	bh=39Ix/SJospyZR38U4GKG7hy0q05YbfUM/x+eNpbawAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iuqSKpS3Qzbp+q+oNyJ+OkrpAD1fGK8XcagEX/fpJtxvVFTETl53/AFAyPnaMlumY9ng1t3AMHzCxn6k1vYWMtEMbsKs2OfcFCW8N6SaIxD+QCDvWNz6wU6d06MicUS8wUWmTEaMNsAj0Pw9AdooiElFUDZuT9il9NxSJgbSJag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YsuIVt5l; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YsuIVt5l"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43169902057so59917505e9.0
        for <oe-lkp@lists.linux.dev>; Wed, 30 Oct 2024 02:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730282073; x=1730886873; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39Ix/SJospyZR38U4GKG7hy0q05YbfUM/x+eNpbawAY=;
        b=YsuIVt5lXlYLFvBWCcpI6s4Xyg4q/46NE7pPknTrTzyud0HPSGIbu2apd6H0H11Jdb
         6vwByeikbeDibOUQMJxga5driJo0NurkSpulr3PhWTNI/emRXmxr0WWAt/MPdS92VDNz
         MydOjQSVjHGfWD2om/WfDjJAFHJdTvjT+0sMfOQD0ue2VljOIM5Ski8r14nCcQO1AF2f
         jEpZYldCceVGWQJEpcSvvinQx+3zj/4zl4t7XivGQOaCnR4NNZ+dRhwSmwXxsLl16CNw
         rmosZsaCSWkcgoLiN2DdVtDHYwKPPwKUHURhilZFYC4+wFDAKCvuypS10g95+gHHljtT
         PNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730282073; x=1730886873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39Ix/SJospyZR38U4GKG7hy0q05YbfUM/x+eNpbawAY=;
        b=epoIvAaU56PSRhISwSjZHU/MpMk3S6GcaDTPpGp2Fgi6DPn/08YDrpXhgum3ozWJwz
         HXhPGG5gNDTw8dr69U+73yzUyDgxIIMtUBa+Re2BSg3khlyRa4HBmcT0GBvC87iGGlKl
         xfqXrsDIdJOYLLwzPAsuckPpZux9Jv4KZBTmjbeh9NgC0NNBUJyI3WMYi5VkshJYILCa
         Ik6AIs8Gar3Im6IB9Kd7/MNdc5hm1fbHxSY9xGN0AG69Q3DFLM4sbJvItPxngX+G71/z
         kmdg4UCkwiQn+fHv+PWjzk0Xl/DLN4k2r+MjGcftwTKKPzBJ58rjxPXOpQw3fd82bYib
         RV+g==
X-Gm-Message-State: AOJu0YwISUqD1w+P+hgMw0MNiz1KmSCv2AT5X2dWOBSIoe4AJk/sc3HM
	OKUncqZBwgQqrJ0e28X+wvm40S3siEirj3EMJ5R4NQSCUiTMaZiOk4zgJ7m4wbML7tT9DE+IG28
	YRE7urjs9UkQYMHEgYkOQrlmlU34W+/1QNTbH
X-Google-Smtp-Source: AGHT+IFJzaejnYJElNz9zq/Lt1nQyJB1ktRWnzTAIJwTQydTdxe/5/Z+My/ZVsnw+DLqolx560inm53VcSo0a4xvUo0=
X-Received: by 2002:a05:6000:1286:b0:374:c3a3:1f4f with SMTP id
 ffacd0b85a97d-381b7076e1amr1836909f8f.24.1730282073114; Wed, 30 Oct 2024
 02:54:33 -0700 (PDT)
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
 <CAH5fLggiMkB5g7=hxN-a+9M3vMxWdoB1QCyX9D3+-_oJ7duQ5Q@mail.gmail.com>
 <CABCJKucqMyJa+GNZd909GLvrUPfKS4hN8-ac=2GMH6y3fT=q9g@mail.gmail.com> <CAH5fLgisaG8vRS6douNUuXOgp4ZsM=nD_ZLosE=q193K5pjvLw@mail.gmail.com>
In-Reply-To: <CAH5fLgisaG8vRS6douNUuXOgp4ZsM=nD_ZLosE=q193K5pjvLw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 30 Oct 2024 10:54:19 +0100
Message-ID: <CAH5fLggsduKZJya0R+Gpn9C-4cphK7cJEe++n7A6JJCGiZ8bGg@mail.gmail.com>
Subject: Re: [linus:master] [cfi] 8b8ca9c25f: CFI_failure_at_do_basic_setup
To: Sami Tolvanen <samitolvanen@google.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	kernel test robot <oliver.sang@intel.com>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 10:47=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> On Tue, Oct 29, 2024 at 4:19=E2=80=AFPM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > On Tue, Oct 29, 2024 at 2:09=E2=80=AFAM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > >
> > > On Mon, Oct 28, 2024 at 6:23=E2=80=AFPM Sami Tolvanen <samitolvanen@g=
oogle.com> wrote:
> > > >
> > > > On Mon, Oct 28, 2024 at 8:18=E2=80=AFAM Alice Ryhl <aliceryhl@googl=
e.com> wrote:
> > > > >
> > > > > On Mon, Oct 28, 2024 at 4:15=E2=80=AFPM Sami Tolvanen <samitolvan=
en@google.com> wrote:
> > > > > >
> > > > > > On Mon, Oct 28, 2024 at 1:34=E2=80=AFAM Alice Ryhl <aliceryhl@g=
oogle.com> wrote:
> > > > > > >
> > > > > > > Hmm. This config has:
> > > > > > >
> > > > > > > CONFIG_CLANG_VERSION=3D190102
> > > > > > >
> > > > > > > Sami, is the fix not available as of llvm 19?
> > > > > >
> > > > > > Looks like llvmorg-19.1.2 doesn't have the fix, which means it =
won't
> > > > > > be available until LLVM 20. :/
> > > > >
> > > > > It's not going to land in a patch release of llvm 19?
> > > >
> > > > It won't land to 19.x automatically, but I requested a backport:
> > > > https://github.com/llvm/llvm-project/pull/113938
> > >
> > > Thanks! Looks like it already landed. Which patch version will it lan=
d in?
> >
> > It should be in 19.1.3.
>
> Looking at
> https://github.com/llvm/llvm-project/commits/release/19.x/
>
> it landed after commit 17365dfd2101 ("Bump version to 19.1.3"), so
> does that not mean it will land in 19.1.4? Or does the repository bump
> the version at the beginning of the version range rather than after?

I guess they just don't synchronize the bump with the release. It is
both under the tag and listed on
https://discourse.llvm.org/t/llvm-19-1-3-relased/82829

Alice
