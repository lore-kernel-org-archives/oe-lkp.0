Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E24339AC
	for <oe-lkp@lists.linux.dev>; Tue, 13 Aug 2024 07:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723534734; cv=none; b=EibyJabOi2tl2hRhB0XpI3greu8zsQRR7OTVmaQEBq8ZWiKEjVgud0HP3p9XmIZrq7ajnQPCobLzGjKbvy0d/LOg6YTXpd/25VGXwHPuPPItPI/dy09ULOKgCS2rE7+n8qBW03UkN2sabew9nEIRAcKeiIwMQx12Uga4QyO00TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723534734; c=relaxed/simple;
	bh=GKT60sXxuzpyqSQ5/H8zMkyosAFVs8oRvEavm4QBlgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iEHxLPt+PJKereXTSI/v5EG/LOj7faqj08TrfiK3t1/bWGP4+YGqA6Xvw9AGpSLcSqh08AFWj52+fq5xYb7EN1ddl5Ck9Lun81H0zQxLb+MEvMUOXvvVJPL9vxqobo5UHSd142SZ7DbNjq/BfWdGWTOl+fqcQjwpYTXUINR15dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3mq6HLt; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3mq6HLt"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5bb477e3a6dso4947656a12.0
        for <oe-lkp@lists.linux.dev>; Tue, 13 Aug 2024 00:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723534730; x=1724139530; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKT60sXxuzpyqSQ5/H8zMkyosAFVs8oRvEavm4QBlgI=;
        b=I3mq6HLtyzNEhsdcUf4deBuOfI0Uzh9Il7m7HozIPeOKWVh+b4aMIG8jBhJXhXjpKW
         SfUBUdXFus+eNR7DhPlIR9tsxzpqjs+BUYpNdtOsmentGr+meaC1mu0sMCP3nY2x1WNJ
         7Y0XwnczAKjr0QddZejE881PRYE/54uD6cvwpA8/U7TinLBrwxDCrqBcbkL4GB7f4mF1
         vWWR+o2jjwzILYUNHy9M7CGVal9ia7waSCp+shw/NKQUBJDiStYYG09ZXCOUvM/xKHH0
         JHBb8i/15xLMXGUxGjgHsZK7/T/OvUoiYilGpU91GzDhBx08+8vZTSA0R8LcsMeUyOGN
         +NHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723534730; x=1724139530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKT60sXxuzpyqSQ5/H8zMkyosAFVs8oRvEavm4QBlgI=;
        b=EiGiUlm9I8A6mTZsyU1sk/pOg+5HW+62BjexibGkpUmGuxmOi2oDzLs9reOYMKv6jH
         vUg7UC11BpKyp/3cwnmFJ8FTT2zsb+6qYXWVN6Y0NweqJAsZZpo40qTgvSu7oXryG4V6
         5o9HNngiis1z9Ewk55v7oH0OR7bE6Jm/2jLJ3xjydpJGBABV+yMGwWBWIww+C4d3AFmz
         mupLDtvBd4ueDjoQqh9+8Jj3GxWmZRu6VAJjiFY2SRWQZocKRCdGa0Z2DRbC4kjncUMu
         b5XkfKuZJeMm2hzaVPG3yAnb2m/iA83k8OJQM4PS4dbJoZRlwcD2QCIQt9Qf0IOGgfQS
         r6Bw==
X-Gm-Message-State: AOJu0YzQSVVjb4rOorpG/O7XNqXY5ze1JJXy1sVKCtd8YosGYRmDla5X
	le78YBEtq0onS9qVAcn1Q5VZOKeeG7u4Gfbo7UUMhJN9hF0jDlP1WpVBPeo82vSiWejH4LKd752
	HjwCpqp8SOE6UJxRpW5txTxE5AroyGhNJ
X-Google-Smtp-Source: AGHT+IGRXFjGh8YHPC4KPDS1/3ED5vZf8q2m01zAZpI2pmL93BG3mVruXoBZhEPzKe0IcNF+r6G5yDDLuzmsPqB5BE0=
X-Received: by 2002:a17:907:f158:b0:a7a:bae8:f29e with SMTP id
 a640c23a62f3a-a80ed246407mr204214266b.29.1723534730103; Tue, 13 Aug 2024
 00:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ahhsblwfjo6he4xnxdztjcscvuc7zhevbx4nnxneyh7qstietr@oei4nio6223d> <ZrsL1LqUHjPT0ZkE@xsang-OptiPlex-9020>
In-Reply-To: <ZrsL1LqUHjPT0ZkE@xsang-OptiPlex-9020>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 13 Aug 2024 09:38:38 +0200
Message-ID: <CAGudoHH+fWR9A2o0sxB1pi74udc5iBDehFkAUJ=j=mLe_+FrBg@mail.gmail.com>
Subject: Re: are complete benchmark results available somewhere?
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 9:32=E2=80=AFAM Oliver Sang <oliver.sang@intel.com>=
 wrote:
>
> hi, Mateusz Guzik,
>
> On Mon, Aug 12, 2024 at 12:45:04PM +0200, Mateusz Guzik wrote:
> > I only found results for performance changes, nothing abut the current
> > state of things for any particular kernel and/or machine.
>
> do you mean for [1]?
>
> do you mean lastest mainline data for this test when you mentioned "curre=
nt
> state of things"?
>
> when we finished the bisect for this regression, we also tested head of
> mainline at that time, confirmed regression still exists.
>
> # extra tests on head commit of linus/master
> # bad: [2c9b3512402ed192d1f43f4531fb5da947e72bd0] Merge tag 'for-linus' o=
f git://git.kernel.org/pub/scm/virt/kvm/kvm
>
>
> >
> > If this info is not pubicly available as is, can you do me a favor and =
a
> > one off send me a set of results + profiles for the biggest machine you
> > test on?
>
> what do you mean 'biggest machine'? the Ice Lake machine we used for orig=
ial
> report is a reletively powerful machine in our test machine pool.
>
> due to resource constraint, we cannot run all tests on all machines, just=
 allot
> different tests to different machines. sorry that it's hard for us to all=
ocate
> lots of resources for one test upon one commit.
>
> BTW, if your request is really for [1], Fengwei has already tested your p=
atch
> and replied you, is that well enough?
>

This has nothing to do with that thing.

I'm looking at removing lockref usage from dcache and I'm trying to
find out how the profiles look like on your fleet for the tests which
do induce significant lockref traffic.

I only found reports when there is a win or a regression and even then
only for the affected test, no profile for "the current state of
things" on a particular box or kernel.

--=20
Mateusz Guzik <mjguzik gmail.com>
