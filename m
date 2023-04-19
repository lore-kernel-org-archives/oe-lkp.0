Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B59E15A8
	for <oe-lkp@lists.linux.dev>; Wed, 19 Apr 2023 08:41:13 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7606ce9b213so346679639f.0
        for <oe-lkp@lists.linux.dev>; Wed, 19 Apr 2023 01:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681893672; x=1684485672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5zwwsv1p5D/gRlxt0eU/wzMw2WWxeFb5WeQDYnHVYU=;
        b=ndg0x1pDT4hSebBTYGx6yd+uiKYB07UmuUuMMHBZ2lgSYxjL8paMi9AJHCLV2aO9Hr
         6bhgN5OSk5155IdRgMFSdELWjCQt+4M9hCMPUdeVZeEcdc93J+jqHn+1YtJQHp/inMfs
         aeuNDvZcGrX3mnI5hgStg6sgCaUDqgN6yrX6tVbgmH1msuY8AlqG0l7m9674GH/2e8a2
         URWunaXK86lgNeVxGwOB/Sghuz0th0LgwG7m2Z4aX5ICauRRsryXfQjqjQz94uQBuyri
         KGRD7gfybFuEjWBFV5CM+1ChjrJ5scr5Bzkx43Flacm2p4QdG2gRWmi36M0znSGh8J4g
         N3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681893672; x=1684485672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5zwwsv1p5D/gRlxt0eU/wzMw2WWxeFb5WeQDYnHVYU=;
        b=HuYtOpt1dA/CsFs4vuVYRvQ3BfJ8OABg/ZzGzcCx1k0DtP9CrFfllmpqce10w7NVjj
         7rGM5GrcDVsZXpPn8rJf2O/Wl0Uoa+/wJ3/d0Kq4JFTK81KjmQSynSUNAzlMWMqShGot
         G/++eV84bubq6OlvWan2v95j483jiVxQgD1baH6+7C4Di8QGgSnc4n/tUyVzjuV2kCG3
         +zh5KP85ffenK22aY0qC5zCI2ywERTXectHX7iaN+octqMK/WruZIZ4JnpeGsUtoxDge
         q69kc9fElm92fkhuF2LJxkXlQj2dkD8mojio0w5dGfJYAVVRc/qxqpFgiPRr66KarPcg
         Ob4A==
X-Gm-Message-State: AAQBX9fj21Y1tWQeOOBA8pofQpz3syhSCNM4o9v2vkoiopMU9pPvqr1y
	hmvpuB1UycXx4sYo9LqwdSpdqIfSSGRM3XI3nMocdg==
X-Google-Smtp-Source: AKy350bnTfsp6ZaN6t74b/ECtx4wPwi+yVhBT4Au3SRjcvGrmJmiEAyFYeXYb03kPd6QJD26k+p1etFw3JQc422u9ZE=
X-Received: by 2002:a6b:d911:0:b0:745:70d7:4962 with SMTP id
 r17-20020a6bd911000000b0074570d74962mr3501152ioc.0.1681893672148; Wed, 19 Apr
 2023 01:41:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202304162125.18b7bcdd-oliver.sang@intel.com> <20230418164133.GA44666@unreal>
 <509b08bd-d2bf-eaa8-6c49-c0860d1adbe0@kernel.org> <20230419055916.GB44666@unreal>
In-Reply-To: <20230419055916.GB44666@unreal>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 19 Apr 2023 10:41:00 +0200
Message-ID: <CANn89iLbHDjBZZT1ZOms3Ak0D0V4JTnyeEWZ26Eoc3v9PsGs6g@mail.gmail.com>
Subject: Re: [linux-next:master] [net] d288a162dd: canonical_address#:#[##]
To: Leon Romanovsky <leon@kernel.org>
Cc: David Ahern <dsahern@kernel.org>, kernel test robot <oliver.sang@intel.com>, 
	Wangyang Guo <wangyang.guo@intel.com>, Jakub Kicinski <kuba@kernel.org>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>, 
	Arjan van de Ven <arjan@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, netdev@vger.kernel.org, 
	steffen.klassert@secunet.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 7:59=E2=80=AFAM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> On Tue, Apr 18, 2023 at 02:43:02PM -0600, David Ahern wrote:
> > On 4/18/23 10:41 AM, Leon Romanovsky wrote:
> > > Hi,
> > >
> > > I came to the following diff which eliminates the kernel panics,
> > > unfortunately I can explain only second hunk, but first is required
> > > too.
> > >
> > > diff --git a/net/core/dst.c b/net/core/dst.c
> > > index 3247e84045ca..750c8edfe29a 100644
> > > --- a/net/core/dst.c
> > > +++ b/net/core/dst.c
> > > @@ -72,6 +72,8 @@ void dst_init(struct dst_entry *dst, struct dst_ops=
 *ops,
> > >         dst->flags =3D flags;
> > >         if (!(flags & DST_NOCOUNT))
> > >                 dst_entries_add(ops, 1);
> > > +
> > > +       INIT_LIST_HEAD(&dst->rt_uncached);
> >
> > d288a162dd1c73507da582966f17dd226e34a0c0 moved rt_uncached from rt6_inf=
o
> > and rtable to dst_entry. Only ipv4 and ipv6 usages initialize it. Since
> > it is now in dst_entry, dst_init is the better place so it can be
> > removed from rt_dst_alloc and rt6_info_init.
>
> This is why I placed it there, but the rt_uncached list is initialized
> in xfrm6 right before first call to rt6_uncached_list_add().
>
>    70 static int xfrm6_fill_dst(struct xfrm_dst *xdst, struct net_device =
*dev,
>    71                           const struct flowi *fl)
>    72 {
> ...
>    92         INIT_LIST_HEAD(&xdst->u.rt6.dst.rt_uncached);
>    93         rt6_uncached_list_add(&xdst->u.rt6);
>
> My silly explanation is that xfrm6_dst_destroy() can be called before xfr=
m6_fill_dst().
>
> Thanks
>
> >

Please take a look at the fix that was sent yesterday :

https://patchwork.kernel.org/project/netdevbpf/patch/20230418165426.1869051=
-1-mbizon@freebox.fr/

Thanks.
