Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA246F50A
	for <oe-lkp@lists.linux.dev>; Wed, 25 Oct 2023 18:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W83FLNjv"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-98377c5d53eso15448066b.0
        for <oe-lkp@lists.linux.dev>; Wed, 25 Oct 2023 11:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698259013; x=1698863813; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2e92O8wEWD/53OKXUltaj6IOD/TJFtp9v92hFMtfX+0=;
        b=W83FLNjv3dtLvA4QNn/ySg2x+uJyjXtXCXihhAJ8KX6dtJ0Rrxkv0uhEH0ZiDNUspx
         gYH9NgLaHeLQKtCgCE+86t8ew+u4uasbxeBndoyx2ITZx3d98ZZoU7Xco+uBUWmJrLq5
         VsbGqD3BlBAUcPpjLj4vwf5aNJAulTsXP3GLBcWYKdM5a1aEIeOAiEUtgugJp5I6Efd6
         DpSmEf6TOJuOGa2sqChslt1KhLPYmbFdbHMyk1o3l3WPSXFxpU187Xyzhf1EbkTkUr54
         YzPI3wys8esK2QQG1XE5jZCyQgAqXV3/BPGAXUMfgvDGyp6QDTumJAwx76nNTNCHDNEM
         7k2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698259013; x=1698863813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2e92O8wEWD/53OKXUltaj6IOD/TJFtp9v92hFMtfX+0=;
        b=jgICvjMClZf9wkTMQyBxUwx2smzJUxsEuJN7Bg0y4IlDbYJqhWgfuFI7Nqmj0jHt3a
         3gYP7wG+hvTQX13sUozj1RdjBxO/+w+oTGXwCkCblrvmu4F5EkM9e4V7c/hcM6CFXPhX
         EoE3yYF8NQ+305OQwugYDIQTKIEzA5eNK8msPncjfqrsvtSZRyZr03uU9WIas02JZbsJ
         NdL3n8gipsPCinEPP6r3yFnbx1BdCLh6WV4pq30vGZMyRWNvf6zFF7ffhhMSMb/eJHrc
         qwgGMrpe48FOwlhtFODigcpSkL8v0d1e4Z4i2p+HdC6EG+wD2o5ODOiAiEGhAg/JZ5p/
         VQ0A==
X-Gm-Message-State: AOJu0YyxTQ43b9CuhMOHuFwrGcfoGQUryFgIwiaADBDsvzs6cw71oNJa
	EJ0IvppBpUaEDEcoAM/uKeRB0lWltgQwtNsrDrviIg==
X-Google-Smtp-Source: AGHT+IFOrNXjGlGRWcmGJFHDoHQlFO4oVM3n0QNoccBm8uXU8YVkyo7zdGNfYE0da5c1OHviWCGusZmXqEZmjkytLeo=
X-Received: by 2002:a17:907:70b:b0:9c6:724:fa16 with SMTP id
 xb11-20020a170907070b00b009c60724fa16mr12368133ejb.59.1698259012860; Wed, 25
 Oct 2023 11:36:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231010032117.1577496-4-yosryahmed@google.com>
 <202310202303.c68e7639-oliver.sang@intel.com> <CALvZod5hKvjm3WVSOGc5PpR9eNHFkt=BDmcrBe5CeWgFzP7jgQ@mail.gmail.com>
 <CAJD7tkbjZri4ayBOT9rJ0yMAi__c-1SVmRh_5oXezr7U6dvALg@mail.gmail.com>
 <ZTXLeAAI1chMamkU@feng-clx> <CAJD7tka5UnHBz=eX1LtynAjJ+O_oredMKBBL3kFNfG7PHjuMCw@mail.gmail.com>
 <CAJD7tkYXJ3vcGvteNH98tB_C7OTo718XSxL=mFsUa7kO8vzFzA@mail.gmail.com>
 <ZTdqpcDFVHhFwWMc@xsang-OptiPlex-9020> <CAJD7tka7hmOD6KPmJBJa+TscbYEMmTjS+Jh2utPfTbKkfvwD9A@mail.gmail.com>
 <ZTiw/iIb0SbvN7vh@xsang-OptiPlex-9020> <CAJD7tkaBnSwarz8yHu9RL_3DtaLRfjrcZ7m0YZZgHJsJdtHaZw@mail.gmail.com>
 <CALvZod5V-Ag5avAewE2nFp8__J6b_WqHuQw5=F70OPQrGNjfVw@mail.gmail.com>
In-Reply-To: <CALvZod5V-Ag5avAewE2nFp8__J6b_WqHuQw5=F70OPQrGNjfVw@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 25 Oct 2023 11:36:13 -0700
Message-ID: <CAJD7tkaw1bFDgC1dfbuuCkyLToXRO2T2T7OuMt2fbfEKisP_4Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] mm: memcg: make stats flushing threshold per-memcg
To: Shakeel Butt <shakeelb@google.com>
Cc: Oliver Sang <oliver.sang@intel.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Feng Tang <feng.tang@intel.com>, "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>, lkp <lkp@intel.com>, 
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"Huang, Ying" <ying.huang@intel.com>, "Yin, Fengwei" <fengwei.yin@intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Ivan Babrou <ivan@cloudflare.com>, Tejun Heo <tj@kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Waiman Long <longman@redhat.com>, 
	"kernel-team@cloudflare.com" <kernel-team@cloudflare.com>, Wei Xu <weixugc@google.com>, 
	Greg Thelen <gthelen@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Domenico Cerasuolo <cerasuolodomenico@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2023 at 10:06=E2=80=AFAM Shakeel Butt <shakeelb@google.com>=
 wrote:
>
> On Tue, Oct 24, 2023 at 11:23=E2=80=AFPM Yosry Ahmed <yosryahmed@google.c=
om> wrote:
> >
> [...]
> >
> > Thanks Oliver for running the numbers. If I understand correctly the
> > will-it-scale.fallocate1 microbenchmark is the only one showing
> > significant regression here, is this correct?
> >
> > In my runs, other more representative microbenchmarks benchmarks like
> > netperf and will-it-scale.page_fault* show minimal regression. I would
> > expect practical workloads to have high concurrency of page faults or
> > networking, but maybe not fallocate/ftruncate.
> >
> > Oliver, in your experience, how often does such a regression in such a
> > microbenchmark translate to a real regression that people care about?
> > (or how often do people dismiss it?)
> >
> > I tried optimizing this further for the fallocate/ftruncate case but
> > without luck. I even tried moving stats_updates into cgroup core
> > (struct cgroup_rstat_cpu) to reuse the existing loop in
> > cgroup_rstat_updated() -- but it somehow made it worse.
> >
> > On the other hand, we do have some machines in production running this
> > series together with a previous optimization for non-hierarchical
> > stats [1] on an older kernel, and we do see significant reduction in
> > cpu time spent on reading the stats. Domenico did a similar experiment
> > with only this series and reported similar results [2].
> >
> > Shakeel, Johannes, (and other memcg folks), I personally think the
> > benefits here outweigh a regression in this particular benchmark, but
> > I am obviously biased. What do you think?
> >
> > [1]https://lore.kernel.org/lkml/20230726153223.821757-2-yosryahmed@goog=
le.com/
> > [2]https://lore.kernel.org/lkml/CAFYChMv_kv_KXOMRkrmTN-7MrfgBHMcK3YXv0d=
PYEL7nK77e2A@mail.gmail.com/
>
> I still am not convinced of the benefits outweighing the regression
> but I would not block this. So, let's do this, skip this open window,
> get the patch series reviewed and hopefully we can work together on
> fixing that regression and we can make an informed decision of
> accepting the regression for this series for the next cycle.

Skipping this open window sounds okay to me.

FWIW, I think with this patch series we can keep the old behavior
(roughly) and hide the changes behind a tunable (config option or
sysfs file). I think the only changes that need to be done to the code
to approximate the previous behavior are:
- Use root when updating the pending stats in memcg_rstat_updated()
instead of the passed memcg.
- Use root in mem_cgroup_flush_stats() instead of the passed memcg.
- Use mutex_trylock() instead of mutex_lock() in mem_cgroup_flush_stats().

So I think it should be doable to hide most changes behind a tunable,
but let's not do this unless necessary.
