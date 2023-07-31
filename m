Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A111774A
	for <oe-lkp@lists.linux.dev>; Mon, 31 Jul 2023 09:49:17 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-4863f6ffed5so1539777e0c.0
        for <oe-lkp@lists.linux.dev>; Mon, 31 Jul 2023 02:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690796956; x=1691401756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZrQfTaVDB/9sDfezwMGZiQUIIPPiVARPWKD4Tzyc08=;
        b=BneMlC6cunTAzIFvXLJ+zvDgUJiCqVSOMb+2LAPogDXtYUbt5mEBRIRKerrpN53Utl
         e96+FD9iunXOcMLfbORO8YKbXdxxv8lOQP1NcC0jsOhUrzelWOwawSNoSbR/XkgW/yGb
         hkgl3wpfQ822QRasQ4vwY9X5oIAOMznpZbk4XMPp2rkmjIwVINP9WDGCOJbb0zD12jET
         e0Ip6/McDAMPLwDuA+mrYBo5ZRsWFdNiQUn3LqdWDSBzbGk2jAQt83nAxZQNcgbiOlh7
         Fq7ilW1p5jdfZ3Gvsxw2PdDgzii6wonHAi25zfL+Rxn85IZvPcSDz7oRxumJMD+FXjCI
         HDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796956; x=1691401756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZrQfTaVDB/9sDfezwMGZiQUIIPPiVARPWKD4Tzyc08=;
        b=BBS2EZXkbo9s3MeIMlepMVZTb0KfN9W+XSVElmCF8Ulo/8sxK1bwAESyObVhL1sB57
         iOpYw3eq6lsqavuPa0OgzXlE7AnYWV2PheejCD4VDVJPhglA/CBpHdb5dnrNFKxRu5Rk
         7Icv0VWiqc5J5Tn1Ra1q+8Yv7dNcAt87ovRbJZKZOfW0e9Ufq1dVSYawwvrLX4fkvY3l
         zPx4iEmde1xJ2EwdRJZdYw5mfzuwWdbb8WVSqaeA5sOwW4o4MIk0QUWPrHFz5F99LMS5
         TXzWHySLzUEvruJ4w1euHVugjHfLZBBibG4mgVeVm+k+PhzCZ2kDdJtaZeM7Gy/Lag9B
         t2fg==
X-Gm-Message-State: ABy/qLaV7sV18y1iPkF0g/jVn7R3X+tPk3TMqNOd82/uB3PCZV9w+LWQ
	WuHf9ECoPH2RWii2fD23fXpNjG+ZS4n4II+d+pc=
X-Google-Smtp-Source: APBJJlFlaSjJhhy4O9UDqPzIHFX0ptPBT9xiO5aBuxf5txacHNFM817fP7qQSmfXfbiY2x8Xnn7hHhbwLfiqZzyNfZs=
X-Received: by 2002:a1f:60c3:0:b0:485:f674:dcea with SMTP id
 u186-20020a1f60c3000000b00485f674dceamr4214689vkb.16.1690796956184; Mon, 31
 Jul 2023 02:49:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230628095740.589893-1-jaypatel@linux.ibm.com>
 <202307172140.3b34825a-oliver.sang@intel.com> <CAB=+i9QY99=NzQugoMCdbEwkCKJObxx4DwWXwNjMqyMRYrgOHA@mail.gmail.com>
 <ZLijZ8QRc0FRgJIF@xsang-OptiPlex-9020> <CAB=+i9QmF2C7QsZBEW0HMT-PGcEf3MeCukVaq0_O1HkGy7n93w@mail.gmail.com>
 <CAB=+i9Rn0WXgK-CfaKy0k7HXHx3VEmSjzopaPakcThSG5Ri3vA@mail.gmail.com>
 <CAB=+i9SRCZ1OKBTrojbnbR2YgtmGoRiuTW4VBqvbW1=TNgVWMQ@mail.gmail.com> <ZL3kYgZ3TK3e4otz@xsang-OptiPlex-9020>
In-Reply-To: <ZL3kYgZ3TK3e4otz@xsang-OptiPlex-9020>
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Date: Mon, 31 Jul 2023 18:49:03 +0900
Message-ID: <CAB=+i9TE3NrtVOnDSxG_MbuzDVCx3mgVdyjYYkEf92xtvt9hbA@mail.gmail.com>
Subject: Re: [PATCH] [RFC PATCH v2]mm/slub: Optimize slub memory usage
To: Oliver Sang <oliver.sang@intel.com>
Cc: Jay Patel <jaypatel@linux.ibm.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-mm@kvack.org, ying.huang@intel.com, feng.tang@intel.com, 
	fengwei.yin@intel.com, cl@linux.com, penberg@kernel.org, rientjes@google.com, 
	iamjoonsoo.kim@lge.com, akpm@linux-foundation.org, vbabka@suse.cz, 
	aneesh.kumar@linux.ibm.com, tsahu@linux.ibm.com, piyushs@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2023 at 11:40=E2=80=AFAM Oliver Sang <oliver.sang@intel.com=
> wrote:
>
> hi, Hyeonggon Yoo,
>
> On Thu, Jul 20, 2023 at 11:15:04PM +0900, Hyeonggon Yoo wrote:
> > On Thu, Jul 20, 2023 at 10:46=E2=80=AFPM Hyeonggon Yoo <42.hyeyoo@gmail=
.com> wrote:
> > >
> > > On Thu, Jul 20, 2023 at 9:59=E2=80=AFPM Hyeonggon Yoo <42.hyeyoo@gmai=
l.com> wrote:
> > > > On Thu, Jul 20, 2023 at 12:01=E2=80=AFPM Oliver Sang <oliver.sang@i=
ntel.com> wrote:
> > > > > > > commit:
> > > > > > >   7bc162d5cc ("Merge branches 'slab/for-6.5/prandom', 'slab/f=
or-6.5/slab_no_merge' and 'slab/for-6.5/slab-deprecate' into slab/for-next"=
)
> > > > > > >   a0fd217e6d ("mm/slub: Optimize slub memory usage")
> > > > > > >
> > > > > > > 7bc162d5cc4de5c3 a0fd217e6d6fbd23e91f8796787
> > > > > > > ---------------- ---------------------------
> > > > > > >          %stddev     %change         %stddev
> > > > > > >              \          |                \
> > > > > > >     222503 =C4=85 86%    +108.7%     464342 =C4=85 58%  numa-=
meminfo.node1.Active
> > > > > > >     222459 =C4=85 86%    +108.7%     464294 =C4=85 58%  numa-=
meminfo.node1.Active(anon)
> > > > > > >      55573 =C4=85 85%    +108.0%     115619 =C4=85 58%  numa-=
vmstat.node1.nr_active_anon
> > > > > > >      55573 =C4=85 85%    +108.0%     115618 =C4=85 58%  numa-=
vmstat.node1.nr_zone_active_anon
> > > > > >
> > > > > > I'm quite baffled while reading this.
> > > > > > How did changing slab order calculation double the number of ac=
tive anon pages?
> > > > > > I doubt two experiments were performed on the same settings.
> > > > >
> > > > > let me introduce our test process.
> > > > >
> > > > > we make sure the tests upon commit and its parent have exact same=
 environment
> > > > > except the kernel difference, and we also make sure the config to=
 build the
> > > > > commit and its parent are identical.
> > > > >
> > > > > we run tests for one commit at least 6 times to make sure the dat=
a is stable.
> > > > >
> > > > > such like for this case, we rebuild the commit and its parent's k=
ernel, the
> > > > > config is attached FYI.
> > >
> > > Oh I missed the attachments.
> > > I need more time to look more into that, but could you please test
> > > this patch (attached)?
> >
> > Oh, my mistake. It has nothing to do with reclamation modifiers.
> > The correct patch should be this. Sorry for the noise.
>
> I applied below patch directly upon "mm/slub: Optimize slub memory usage"=
,
> so our tree looks like below:
>
> * 6ba0286048431 (linux-devel/fixup-a0fd217e6d6fbd23e91f8796787b621e7d5760=
88) mm/slub: do not allocate from remote node to allocate high order slab
> * a0fd217e6d6fb (linux-review/Jay-Patel/mm-slub-Optimize-slub-memory-usag=
e/20230628-180050) mm/slub: Optimize slub memory usage
> *---.   7bc162d5cc4de (vbabka-slab/for-linus) Merge branches 'slab/for-6.=
5/prandom', 'slab/for-6.5/slab_no_merge' and 'slab/for-6.5/slab-deprecate' =
into slab/for-next
>
> 6ba0286048431 is as below [1]
> since there are some line number differences, no sure if my applying ok? =
or
> should I pick another base?

It was fine, it was tested correctly.

> by this applying, we noticed the regression still exists.
> on 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice La=
ke) with 256G memory

Thank you for testing it!
Unfortunately my guess seems to be wrong in this case,
based on information that Feng Tang gave us.

While I'm still interested in evaluating potential gains in SLUB,
for this case I would like to focus more on the v4 in this case as
Vlastimil pointed out!

Thanks,
Hyeonggon

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/t=
box_group/testcase:
>   gcc-12/performance/socket/4/x86_64-rhel-8.3/process/100%/debian-11.1-x8=
6_64-20220510.cgz/lkp-icl-2sp2/hackbench
>
> 7bc162d5cc4de5c3 a0fd217e6d6fbd23e91f8796787 6ba02860484315665e300d9f415
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>     479042           -12.5%     419357           -12.0%     421407       =
 hackbench.throughput
>
> detail data is attached as hackbench-6ba0286048431-ICL-Gold-6338
>
>
> on 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ic=
e Lake) with 128G memory
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/t=
box_group/testcase:
>   gcc-12/performance/socket/4/x86_64-rhel-8.3/process/100%/debian-11.1-x8=
6_64-20220510.cgz/lkp-icl-2sp6/hackbench
>
> 7bc162d5cc4de5c3 a0fd217e6d6fbd23e91f8796787 6ba02860484315665e300d9f415
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>     455347            -5.9%     428458            -6.4%     426221       =
 hackbench.throughput
>
> detail data is attached as hackbench-6ba0286048431-ICL-Platinum-8358
>
>
> [1]
> commit 6ba02860484315665e300d9f41511f36940a50f0 (linux-devel/fixup-a0fd21=
7e6d6fbd23e91f8796787b621e7d576088)
> Author: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> Date:   Thu Jul 20 22:29:16 2023 +0900
>
>     mm/slub: do not allocate from remote node to allocate high order slab
>
>     Signed-off-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
>
> diff --git a/mm/slub.c b/mm/slub.c
> index 8ea7a5ccac0dc..303c57ee0f560 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -1981,7 +1981,7 @@ static struct slab *allocate_slab(struct kmem_cache=
 *s, gfp_t flags, int node)
>          * Let the initial higher-order allocation fail under memory pres=
sure
>          * so we fall-back to the minimum order allocation.
>          */
> -       alloc_gfp =3D (flags | __GFP_NOWARN | __GFP_NORETRY) & ~__GFP_NOF=
AIL;
> +       alloc_gfp =3D (flags | __GFP_THISNODE | __GFP_NOWARN | __GFP_NORE=
TRY) & ~__GFP_NOFAIL;
>         if ((alloc_gfp & __GFP_DIRECT_RECLAIM) && oo_order(oo) > oo_order=
(s->min))
>                 alloc_gfp =3D (alloc_gfp | __GFP_NOMEMALLOC) & ~__GFP_REC=
LAIM;
>
>
>
>
>
> > From 74142b5131e731f662740d34623d93fd324f9b65 Mon Sep 17 00:00:00 2001
> > From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> > Date: Thu, 20 Jul 2023 22:29:16 +0900
> > Subject: [PATCH] mm/slub: do not allocate from remote node to allocate =
high
> >  order slab
> >
> > Signed-off-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> > ---
> >  mm/slub.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/mm/slub.c b/mm/slub.c
> > index f7940048138c..c584237d6a0d 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -2010,7 +2010,7 @@ static struct slab *allocate_slab(struct kmem_cac=
he *s, gfp_t flags, int node)
> >        * Let the initial higher-order allocation fail under memory pres=
sure
> >        * so we fall-back to the minimum order allocation.
> >        */
> > -     alloc_gfp =3D (flags | __GFP_NOWARN | __GFP_NORETRY) & ~__GFP_NOF=
AIL;
> > +     alloc_gfp =3D (flags | __GFP_THISNODE | __GFP_NOWARN | __GFP_NORE=
TRY) & ~__GFP_NOFAIL;
> >       if ((alloc_gfp & __GFP_DIRECT_RECLAIM) && oo_order(oo) > oo_order=
(s->min))
> >               alloc_gfp =3D (alloc_gfp | __GFP_NOMEMALLOC) & ~__GFP_REC=
LAIM;
> >
> > --
> > 2.41.0
> >
>
