Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D046418C2D
	for <oe-lkp@lists.linux.dev>; Fri, 18 Aug 2023 15:19:01 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-76d846a4b85so298448241.1
        for <oe-lkp@lists.linux.dev>; Fri, 18 Aug 2023 08:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692371940; x=1692976740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P97bQdtLkXYaA0AynUq0EZ6/3+YeSQEgYN8aKuKl+vg=;
        b=eDREqNeZMqP1u2k3aQjmOgtgERjfUcyE8LZAyKeRqWnK/1xDu5cpA+ZVXh+8cu3zTn
         FCd736OM6PqJl7Xu60/OQiQMbeiQACHZUtImtYo4qlt+Uq3IrPtNHiaDmr3hk3SrCcWa
         2J6CO3emcC85FVumYIPACECMoirDzxE2zBLMuyPo6ZLDbBJ47jbksTqCP/L7XWN4ZH3G
         dKs5zuSKLcqa015lSQxgJHxuwDwXQO/hACKtM4tlo2YD1qqydywH6frfF+GNasUiYYBp
         097TA9rc6CIKu+hnnXO/kMR8mJRI0KGf8YnbrDbH2q9DSEtp1ikg2ZVcFNm6LzDZP9Ye
         FZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692371940; x=1692976740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P97bQdtLkXYaA0AynUq0EZ6/3+YeSQEgYN8aKuKl+vg=;
        b=UGqFmjG5osls3l09qfpvjIb2rR4T2u0IZCBOW7ckocgXI2di8uxZe/nZY+RC2b14lT
         yCOEuoZ4PrjuAqwadtVzvZhtiMzbUx98UJ/yaxF9zAowjkoKMsjck+fLLhjJSpDsT9Kj
         rI+FVhf0lzomSXoYVhd67UBkYkqnLHNXYaArKQeGRvlfLtv9uAhcokZhHRBl9kknrtAo
         qL60XvmMosvubku+hgChw7zYPnomj3uWd2D1LYl1N1chwLfl4RzVCUAf/FWIFesryHS+
         lUh6ZXz4JIbxa1bBJp4tMwbmiouSnZaohj2xuGkZ1fO8SzTjIN8rlUgWhICeGXIvRIID
         bmgw==
X-Gm-Message-State: AOJu0YwERwh59ocayp8anF6Tp/BbPlDdcPvqvV00aDkVE9+sIj6OPy+w
	EIsxGtFx+wS3OBFEjj34XSuN36Z1i67AcZRDFoA=
X-Google-Smtp-Source: AGHT+IEKx0SzvU5D2FqWbPDPAF+5clk1Spq16QV46q2pawqJMTYlEanbi4HUqugEgrWGUM8bZly0MVBM2ssOLxfqwJc=
X-Received: by 2002:a1f:ec43:0:b0:488:24b4:c100 with SMTP id
 k64-20020a1fec43000000b0048824b4c100mr3570843vkh.6.1692371940226; Fri, 18 Aug
 2023 08:19:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230723190906.4082646-1-42.hyeyoo@gmail.com> <30b5d85348d84891bf61d7c57370d8b46df8e1a0.camel@linux.ibm.com>
 <CAB=+i9TQsPmdpjJ5g-q6ennSha00EO8GGKGjvg5RE-JH36JZxA@mail.gmail.com> <dcddd1ebfb71fd0451b3e8a4fb63b30d560d401d.camel@linux.ibm.com>
In-Reply-To: <dcddd1ebfb71fd0451b3e8a4fb63b30d560d401d.camel@linux.ibm.com>
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Date: Sat, 19 Aug 2023 00:18:48 +0900
Message-ID: <CAB=+i9R9+9qCtOKuFrbaHqFA1xixfnAroaYSKhYUYvWZ=RNWtg@mail.gmail.com>
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

On Fri, Aug 18, 2023 at 4:11=E2=80=AFPM Jay Patel <jaypatel@linux.ibm.com> =
wrote:
>
> On Fri, 2023-08-11 at 03:06 +0900, Hyeonggon Yoo wrote:
> > On Thu, Aug 10, 2023 at 7:56=E2=80=AFPM Jay Patel <jaypatel@linux.ibm.c=
om>
> > wrote:
> > > On Mon, 2023-07-24 at 04:09 +0900, Hyeonggon Yoo wrote:
> > > > Hello folks,
> > > >
> > > > This series is motivated by kernel test bot report [1] on Jay's
> > > > patch
> > > > that modifies slab order. While the patch was not merged and not
> > > > in
> > > > the
> > > > final form, I think it was a good lesson that changing slab order
> > > > has
> > > > more
> > > > impacts on performance than we expected.
> > > >
> > > > While inspecting the report, I found some potential points to
> > > > improve
> > > > SLUB. [2] It's _potential_ because it shows no improvements on
> > > > hackbench.
> > > > but I believe more realistic workloads would benefit from this.
> > > > Due
> > > > to
> > > > lack of resources and lack of my understanding of *realistic*
> > > > workloads,
> > > > I am asking you to help evaluating this together.
> > >
> > > Hi Hyeonggon,
> > > I tried hackbench test on Powerpc machine with 16 cpus but
> > > got ~32% of Regression with patch.
> >
> > Thank you so much for measuring this! That's very helpful.
> > It's interesting because on an AMD machine with 2 NUMA nodes there
> > was
> > not much difference.
> >
> > Does it have more than one socket?
>
> I have tested on single socket system.
> >
> > Could you confirm if the offending patch is patch 1 or 2?
> > If the offending one is patch 2, can you please check how large is L3
> > cache miss rate
> > during hackbench?
> >
> Below regression is cause by Patch 1 "Revert mm, slub: change percpu
> partial accounting from objects to pages"

Fortunately I was able to reproduce the regression (5~10%) on my amd laptop=
 :)
It's interesting and thank you so much for pointing it out!

It only modifies slowpath so the overhead of calculation itself should
be negligible.
And I think it's fair to assume that this is because the freelist is
shortened due to the patch,
because it rounds up the number of slabs:
> nr_slabs =3D DIV_ROUND_UP(nr_objects * 2, oo_objects(s->oo));

So before the patch more objects were cached than intended.
I'll try to bump up the default value to the point where it does not
use more memory than before.

By the way, what is the optimal default value is very unclear to me.
Obviously 'Good enough value for hackbench' is not a good standard,
because it's quite a synthetic workload.


> Thanks
> Jay Patel
>
> > > Results as
> > >
> > > +-------+----+---------+------------+------------+
> > > >       |    | Normal  | With Patch |            |
> > > +-------+----+---------+------------+------------+
> > > > Amean | 1  | 1.3700  | 2.0353     | ( -32.69%) |
> > > > Amean | 4  | 5.1663  | 7.6563     | (- 32.52%) |
> > > > Amean | 7  | 8.9180  | 13.3353    | ( -33.13%) |
> > > > Amean | 12 | 15.4290 | 23.0757    | ( -33.14%) |
> > > > Amean | 21 | 27.3333 | 40.7823    | ( -32.98%) |
> > > > Amean | 30 | 38.7677 | 58.5300    | ( -33.76%) |
> > > > Amean | 48 | 62.2987 | 92.9850    | ( -33.00%) |
> > > > Amean | 64 | 82.8993 | 123.4717   | ( -32.86%) |
> > > +-------+----+---------+------------+------------+
> > >
> > > Thanks
> > > Jay Patel
