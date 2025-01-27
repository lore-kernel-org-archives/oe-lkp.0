Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF06A7081C
	for <oe-lkp@lists.linux.dev>; Mon, 27 Jan 2025 15:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737990204; cv=none; b=URgUo+gqtP7sGawxAiSZQQ7/gIV9rjjiQ9NTrsGNkCMPPoCNvYSXMSrbU+SEtnZb5T8Pc1FYXTe5seaLn0kkXJSgdoi3MvHAJSvTMdSIZZFPm16tzy0gfSFQfoKHP29QHOOS7dim1O5jfM1MJTTJ05LqhCjnXi6de5hao9WNfiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737990204; c=relaxed/simple;
	bh=AeAi9kZJW2Rqbj0IdEpHm9Kw4t6+sytg1ubGnJr6/RE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mULSwcXGHSFa4Jzno1Dx98SMQLFGLbc+OPvjdTnOPXjJdln8K1Q0n3FTfl0xaB1ftBhqMRra4izHuObYRrH490UfJb+aqb3xPRP6UjuFgiMcLbQVI6tXP9V4Qw9T4kctiJSDlYOyKb4CDvKe6oBsUrPo06notPyw3VW4cstyNxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a1H0OJiI; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a1H0OJiI"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4679b5c66d0so430791cf.1
        for <oe-lkp@lists.linux.dev>; Mon, 27 Jan 2025 07:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737990202; x=1738595002; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbAYdFTBfb7doG73J1WAZ75UQhB7XRBXu5lFgptGDgc=;
        b=a1H0OJiIV3Sn4GJMaaREIeCyStsAFXAryZMJf8a4/pQl6QUn+yWTMa0INK9qU1tdVM
         zGkWONyszxgCbOU0w8yttMmeR2iMV0IlEqR3rx6wjvukddX9/3fGpaiZGYQwYRpWLJS/
         hUvpMkUu0zeA4Uv0ZBcTDExkKe99Qy3t1Eyis1LLWid/r6AuIt7mL3ntYdadMAwYkPKY
         iV1di20+V/pWXkN7eXxxYJOyAO5q0VIaxhh4+V+Q65Z+DqWKvlOtY3MBjUFFaPLdsMD2
         w/+T7upPgVZkaGlHdbPaU7Y3C7q7tNIO4bvGMofoAlviv9zrzEVEuKdcd7j0gQKQmewS
         BAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737990202; x=1738595002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbAYdFTBfb7doG73J1WAZ75UQhB7XRBXu5lFgptGDgc=;
        b=PLSWRBN45md34LAEgw3D9xSlyb9z5H7dnRKsf1+jjCtCfo0kDdL50RLCYxTAhux/bL
         wQpEZk1ND+0rpYcRX+UfDHvT4KS8IUcaNmdh6QZwZs8s3qKyFErIz2lUp3kl6pYyLic3
         0FHmARamkmk08ukUT9TtCnzq3xlqTKzdKr5BswIr5c8YO8aNg/4cTnsCQZ95TAcE5Gcs
         /gYO4Caaqm5k74VPmUiIi8Ou03kpUDzzZgGsZMOmrj/6gW1HdzKQWv01/zwKhGa8zI4i
         XoQOBtBxDtPSXnqtA7RQ/DwFDJA1NYGXzA7rgUm4D074G+bxmiHZDkmfvpfzZZWCP0/D
         g7+A==
X-Forwarded-Encrypted: i=1; AJvYcCUyQWqCAjLEul4wYUy31zjcKQDoVbIaSfOp1BEZOiRIBzzlzVdvEg5/q+CZcPXR2NNuQPKsqaM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzaCncq0M8JE+u6y+/ZM2/Z7clO89Jo3sVtL40oXj/MWC8IKFEe
	ZLW+ZuYn2bGrC+hzVhqzV2bH5JdD0CxfrYyJa6KZtru6aIrpo6bQH8TZh9QPQ6Pn8fhQncIb964
	z74EYJ8BW/khrDLbh1jIgY05YJPu7mpOFzmD6
X-Gm-Gg: ASbGnctBwaN7+XzekR3+gL+Dg3m59AKZzB0JakM68uULWzj1irZoZ/7BTfup2/KgpNM
	4fhBFxRDbm+OLm8wIq7Fo8VFTIVxfcs9XrrCBiiovP4PAim4XDA4xUSs8ujOajCDY1EX07B/fI/
	m2PA8+KNfRbTyrgf/fWXg=
X-Google-Smtp-Source: AGHT+IG6X10iFWqByvszIHPgMPWRI52DQt1qSd78hKZ9dYxLBn73U7n2AAPdc0t1NLQG2nySejRRrE62U4s70NdQkE0=
X-Received: by 2002:a05:622a:a19:b0:467:8416:d99e with SMTP id
 d75a77b69052e-46fc3df11c5mr44941cf.21.1737990201231; Mon, 27 Jan 2025
 07:03:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501261315.c6c7dbb4-lkp@intel.com> <CAL+tcoBBjLsmWUt9PkzDhVtGLm-s53EyTzcHhpTkVnLpgz0FXw@mail.gmail.com>
 <CAL+tcoBmRVKUfhR8DiMryD4h5ZJeQpGuhPyzK3fexiEBvE_KDA@mail.gmail.com>
In-Reply-To: <CAL+tcoBmRVKUfhR8DiMryD4h5ZJeQpGuhPyzK3fexiEBvE_KDA@mail.gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Mon, 27 Jan 2025 10:03:05 -0500
X-Gm-Features: AWEUYZkcows-F6LzFJgrVDYDJnqsX3XKh2hHY-stktIgVvLOUhs_-CO4w8C5Ic0
Message-ID: <CADVnQykLL+ZcY0Myg4n0_5PqtOJ9ifxh6nb2VW2txGNDFDF1jg@mail.gmail.com>
Subject: Re: [linus:master] [tcp_cubic] 25c1a9ca53: packetdrill.packetdrill/gtests/net/tcp/cubic/cubic-bulk-166k-idle-restart_ipv4-mapped-v6.fail
To: Jason Xing <kerneljasonxing@gmail.com>
Cc: kernel test robot <oliver.sang@intel.com>, Mahdi Arghavani <ma.arghavani@yahoo.com>, 
	oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Haibo Zhang <haibo.zhang@otago.ac.nz>, David Eyers <david.eyers@otago.ac.nz>, 
	Abbas Arghavani <abbas.arghavani@mdu.se>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 5:20=E2=80=AFAM Jason Xing <kerneljasonxing@gmail.c=
om> wrote:
>
> On Sun, Jan 26, 2025 at 4:49=E2=80=AFPM Jason Xing <kerneljasonxing@gmail=
.com> wrote:
> >
> > On Sun, Jan 26, 2025 at 2:30=E2=80=AFPM kernel test robot <oliver.sang@=
intel.com> wrote:
> > >
> > >
> > >
> > > Hello,
> > >
> > > kernel test robot noticed "packetdrill.packetdrill/gtests/net/tcp/cub=
ic/cubic-bulk-166k-idle-restart_ipv4-mapped-v6.fail" on:
> > >
> > > (
> > > in fact, there are other failed cases which can pass on parent:
> > >
> > > 4395a44acb15850e 25c1a9ca53db5780757e7f53e68
> > > ---------------- ---------------------------
> > >        fail:runs  %reproduction    fail:runs
> > >            |             |             |
> > >            :6          100%           6:6     packetdrill.packetdrill=
/gtests/net/tcp/cubic/cubic-bulk-166k-idle-restart_ipv4-mapped-v6.fail
> > >            :6          100%           6:6     packetdrill.packetdrill=
/gtests/net/tcp/cubic/cubic-bulk-166k-idle-restart_ipv4.fail
> > >            :6          100%           6:6     packetdrill.packetdrill=
/gtests/net/tcp/cubic/cubic-bulk-166k-idle-restart_ipv6.fail
> > >            :6          100%           6:6     packetdrill.packetdrill=
/gtests/net/tcp/cubic/cubic-bulk-166k_ipv4-mapped-v6.fail
> > >            :6          100%           6:6     packetdrill.packetdrill=
/gtests/net/tcp/cubic/cubic-bulk-166k_ipv4.fail
> > >            :6          100%           6:6     packetdrill.packetdrill=
/gtests/net/tcp/cubic/cubic-bulk-166k_ipv6.fail
> >
> > Thanks for the report. I remembered that Mahdi once modified/adjusted
> > some of them, please see the link[1].
> >
> > [1]: https://lore.kernel.org/all/223960459.607292.1737102176209@mail.ya=
hoo.com/
> >
> > I think we're supposed to update them altogether?
>
> Should the updated pkt scripts target net or net-next tree, BTW?

Those packetdrill scripts are not in the kernel tree yet in "net" or
"net-next". I suspect they are being pulled from
https://github.com/google/packetdrill ...

I will try to update those packetdrill scripts ASAP, using Mahdi's
updates as a starting point.

It seems that perhaps we should migrate all the Linux packetdrill
scripts to the Linux source tree, so we are not in this confusing
state where some tests are in https://github.com/google/packetdrill
and some are in the Linux source tree...

neal
