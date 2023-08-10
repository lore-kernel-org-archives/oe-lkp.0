Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BA221512
	for <oe-lkp@lists.linux.dev>; Thu, 10 Aug 2023 18:06:59 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4476a50c64bso519100137.3
        for <oe-lkp@lists.linux.dev>; Thu, 10 Aug 2023 11:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691690818; x=1692295618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPggHN+KL9d2/Q3Rpvyp82p/xsp4vjRXrDXYASWyz9A=;
        b=BMqbAQkMVc4rNnjupLXTyP46meAanoIfIMW4T0t0IUlx/+2MG7a0S0b5RTy3cQS5zR
         UtOu4AtWVCWv2ZDSnR59p03Wf2dOihR9kTtTZW1lJ4ciU8Xys+foIenrTWYVS5tabNhY
         v66CoAjyVnctyRya8RHvHYoZ7ygBpa7URgI5YHMq7OWfieVIx8t+5SE8cDMcnsgpWTP7
         U2kek4gr6DFxjlrALNrTkwHf/MwRBCKcNbkIfvUHeYOXVOq0Iou3r7Ru54QzFYs/xJlm
         y+u5oz/jBXkAeYpGBeDZvx8oG94p0CPUaKILu55nO9GHlR6GikKAwmiLPVrdpGfitIby
         sF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691690818; x=1692295618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPggHN+KL9d2/Q3Rpvyp82p/xsp4vjRXrDXYASWyz9A=;
        b=abkX9ifZONE+/zwwx8PaIzoyV5wNeM/PDbNibjuuW10GHTy5N/z5UpVLTIEUVkMU+c
         HVy7ij4UcGToJQjvc5EQYnwX+ZDVwJwjxfrngZtSw8Ly5ITasPyGpeJbWlGzBP5V970z
         fLP2MOQxGeNkr4E5gANoQQt63ji3zGl3RG78HtavkR+h2OJUcOPOWT4sDxQgGH1Prk3V
         SRW8ZjPXNanUDS9P0wL0CA0hykz+ZM9vyEM7kk/6Mt7nS2wRvu55SuS2h9PPG/YY3vt7
         elBlICicoVqyl061wQq9YMoG3FKwPTlf78jDcgTN374SPiSsintatU6rMKyZMfUSAicJ
         I2+Q==
X-Gm-Message-State: AOJu0YzptIWjrTuk0D7cZW4p9TCiTYZcj182m+FIiY6LkG8vH2M3up1x
	BbiPpOWigIpOrbKNw+oNGV6Pn8UUMVJRJmi67aw=
X-Google-Smtp-Source: AGHT+IHaXzdlEcSoa1ZAf6+x7x1exg0T7bfxl5sQsWyIGsDQA0mv57xzP5uDE3HaRcFNWqTYUbLDcRa6a6OZAgEPS0Q=
X-Received: by 2002:a67:ff81:0:b0:447:6ef1:c4e with SMTP id
 v1-20020a67ff81000000b004476ef10c4emr2295262vsq.34.1691690817970; Thu, 10 Aug
 2023 11:06:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230723190906.4082646-1-42.hyeyoo@gmail.com> <30b5d85348d84891bf61d7c57370d8b46df8e1a0.camel@linux.ibm.com>
In-Reply-To: <30b5d85348d84891bf61d7c57370d8b46df8e1a0.camel@linux.ibm.com>
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Date: Fri, 11 Aug 2023 03:06:46 +0900
Message-ID: <CAB=+i9TQsPmdpjJ5g-q6ennSha00EO8GGKGjvg5RE-JH36JZxA@mail.gmail.com>
Subject: Re: [RFC 0/2] An attempt to improve SLUB on NUMA / under memory pressure
To: jaypatel@linux.ibm.com
Cc: Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, David Rientjes <rientjes@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Feng Tang <feng.tang@intel.com>, "Sang, Oliver" <oliver.sang@intel.com>, 
	Binder Makin <merimus@google.com>, aneesh.kumar@linux.ibm.com, tsahu@linux.ibm.com, 
	piyushs@linux.ibm.com, fengwei.yin@intel.com, ying.huang@intel.com, 
	lkp <lkp@intel.com>, "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023 at 7:56=E2=80=AFPM Jay Patel <jaypatel@linux.ibm.com> =
wrote:
>
> On Mon, 2023-07-24 at 04:09 +0900, Hyeonggon Yoo wrote:
> > Hello folks,
> >
> > This series is motivated by kernel test bot report [1] on Jay's patch
> > that modifies slab order. While the patch was not merged and not in
> > the
> > final form, I think it was a good lesson that changing slab order has
> > more
> > impacts on performance than we expected.
> >
> > While inspecting the report, I found some potential points to improve
> > SLUB. [2] It's _potential_ because it shows no improvements on
> > hackbench.
> > but I believe more realistic workloads would benefit from this. Due
> > to
> > lack of resources and lack of my understanding of *realistic*
> > workloads,
> > I am asking you to help evaluating this together.
>
> Hi Hyeonggon,
> I tried hackbench test on Powerpc machine with 16 cpus but
> got ~32% of Regression with patch.

Thank you so much for measuring this! That's very helpful.
It's interesting because on an AMD machine with 2 NUMA nodes there was
not much difference.

Does it have more than one socket?

Could you confirm if the offending patch is patch 1 or 2?
If the offending one is patch 2, can you please check how large is L3
cache miss rate
during hackbench?

> Results as
>
> +-------+----+---------+------------+------------+
> |       |    | Normal  | With Patch |            |
> +-------+----+---------+------------+------------+
> | Amean | 1  | 1.3700  | 2.0353     | ( -32.69%) |
> | Amean | 4  | 5.1663  | 7.6563     | (- 32.52%) |
> | Amean | 7  | 8.9180  | 13.3353    | ( -33.13%) |
> | Amean | 12 | 15.4290 | 23.0757    | ( -33.14%) |
> | Amean | 21 | 27.3333 | 40.7823    | ( -32.98%) |
> | Amean | 30 | 38.7677 | 58.5300    | ( -33.76%) |
> | Amean | 48 | 62.2987 | 92.9850    | ( -33.00%) |
> | Amean | 64 | 82.8993 | 123.4717   | ( -32.86%) |
> +-------+----+---------+------------+------------+
>
> Thanks
> Jay Patel
> >
> > It only consists of two patches. Patch #1 addresses inaccuracy in
> > SLUB's heuristic, which can negatively affect workloads' performance
> > when large folios are not available from buddy.
> >
> > Patch #2 changes SLUB's behavior when there are no slabs available on
> > the
> > local node's partial slab list, increasing NUMA locality when there
> > are
> > available memory (without reclamation) on the local node from buddy.
> >
> > This is early state, but I think it's a good enough to start
> > discussion.
> > Any feedbacks and ideas are welcome. Thank you in advance!
> >
> > Hyeonggon
> >
> > https://lore.kernel.org/linux-mm/202307172140.3b34825a-oliver.sang@inte=
l.com
> > [1]
> > https://lore.kernel.org/linux-mm/CAB=3D+i9S6Ykp90+4N1kCE=3DhiTJTE4wzJDi=
8k5pBjjO_3sf0aeqg@mail.gmail.com
> > [2]
> >
> > Hyeonggon Yoo (2):
> >   Revert "mm, slub: change percpu partial accounting from objects to
> >     pages"
> >   mm/slub: prefer NUMA locality over slight memory saving on NUMA
> >     machines
> >
> >  include/linux/slub_def.h |  2 --
> >  mm/slab.h                |  6 ++++
> >  mm/slub.c                | 76 ++++++++++++++++++++++++++----------
> > ----
> >  3 files changed, 55 insertions(+), 29 deletions(-)
> >
>
