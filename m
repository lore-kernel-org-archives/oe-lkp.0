Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF512AB2B
	for <oe-lkp@lists.linux.dev>; Wed, 25 Oct 2023 17:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wQP91HLo"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1c9d4f08d7cso7625ad.0
        for <oe-lkp@lists.linux.dev>; Wed, 25 Oct 2023 10:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698253610; x=1698858410; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0BLyhOS6DaA3Azb/y3i+aSNsSqvELymfgVFVzC4E2iU=;
        b=wQP91HLoW3xZH/Q2QAzV1wy+Y+aIZh5tG3MdxAuV05m6vEjM+VBkdP1Qb3bkEJTfUJ
         HYLDouuA4biAW+oUreM2KgaYCHvDuPAjXcLuTXM2PhnMbrEc/79CiMaTJh3RUssba/M5
         w1sdgzhmGVvuY9oPRDCAeoz6avYtPM6Mq9oR/hNAV2HUoKmyPPTJQKn5H2NukugBFWVP
         10kW2J/XjwlKU1DHz+PuH98RKChE/pDgmVYuHkHPbcnn5it/zXlrWrPukt5r3ByfpG7Q
         6APGyjIGb7ZwR3oMCtEIWfhoJLX6Zo/2MHGwgFtxQFivX6mx76S/S1N522fuwZE9rr6t
         T1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698253610; x=1698858410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0BLyhOS6DaA3Azb/y3i+aSNsSqvELymfgVFVzC4E2iU=;
        b=Og5lJ65PkTRgAI5ADquxYChy92WNTqUFHrXH3TDZxwaygairKQFHofw0nh0Ojn2iOy
         T0GpRBjndmKq+Oq/a5+4LYp/EHHVRka1abjdW4Wkw4Qupal9pYNC4F2m2HtJpToDbax6
         0tHAmc3kw+cex/p7vbqiH+T1xSxeNqa9FpWDlJ9jcXDdrjG8ZotP727al9WIoii3Phwr
         fNcXpDBC89tD81DTo03LbPJV7CKYHKqIpwpuv+iUKTWbWcfK9WGeUjHw5efLIEFtbF5e
         uAnR3avod0v+d3ZwdPM2Bynvjl5Yye/7mkn0RxsjLPhGWrnInzSALpXqsIdT52R57u4V
         cC9w==
X-Gm-Message-State: AOJu0YzF6I5HqHBhloGKVdAZygUszMwiO+79db7qsJSkBgVBPW68MsR4
	HcxZvlDpNNa6IyH84Mo8s0pTVbJAL5eMi7NmiKsaZkTwhd3cA3l8Fcs=
X-Google-Smtp-Source: AGHT+IHTm3Fl1nDGBKuyZQng/G9O2lKwSEtDCNTvLWku+yOpMLnEMFF3diKUa2ikj5TXXEN2m6Iuk1tLQYL8Awlf64s=
X-Received: by 2002:a17:903:144b:b0:1ca:42a:1773 with SMTP id
 lq11-20020a170903144b00b001ca042a1773mr241841plb.12.1698253609714; Wed, 25
 Oct 2023 10:06:49 -0700 (PDT)
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
In-Reply-To: <CAJD7tkaBnSwarz8yHu9RL_3DtaLRfjrcZ7m0YZZgHJsJdtHaZw@mail.gmail.com>
From: Shakeel Butt <shakeelb@google.com>
Date: Wed, 25 Oct 2023 10:06:37 -0700
Message-ID: <CALvZod5V-Ag5avAewE2nFp8__J6b_WqHuQw5=F70OPQrGNjfVw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] mm: memcg: make stats flushing threshold per-memcg
To: Yosry Ahmed <yosryahmed@google.com>
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

On Tue, Oct 24, 2023 at 11:23=E2=80=AFPM Yosry Ahmed <yosryahmed@google.com=
> wrote:
>
[...]
>
> Thanks Oliver for running the numbers. If I understand correctly the
> will-it-scale.fallocate1 microbenchmark is the only one showing
> significant regression here, is this correct?
>
> In my runs, other more representative microbenchmarks benchmarks like
> netperf and will-it-scale.page_fault* show minimal regression. I would
> expect practical workloads to have high concurrency of page faults or
> networking, but maybe not fallocate/ftruncate.
>
> Oliver, in your experience, how often does such a regression in such a
> microbenchmark translate to a real regression that people care about?
> (or how often do people dismiss it?)
>
> I tried optimizing this further for the fallocate/ftruncate case but
> without luck. I even tried moving stats_updates into cgroup core
> (struct cgroup_rstat_cpu) to reuse the existing loop in
> cgroup_rstat_updated() -- but it somehow made it worse.
>
> On the other hand, we do have some machines in production running this
> series together with a previous optimization for non-hierarchical
> stats [1] on an older kernel, and we do see significant reduction in
> cpu time spent on reading the stats. Domenico did a similar experiment
> with only this series and reported similar results [2].
>
> Shakeel, Johannes, (and other memcg folks), I personally think the
> benefits here outweigh a regression in this particular benchmark, but
> I am obviously biased. What do you think?
>
> [1]https://lore.kernel.org/lkml/20230726153223.821757-2-yosryahmed@google=
.com/
> [2]https://lore.kernel.org/lkml/CAFYChMv_kv_KXOMRkrmTN-7MrfgBHMcK3YXv0dPY=
EL7nK77e2A@mail.gmail.com/

I still am not convinced of the benefits outweighing the regression
but I would not block this. So, let's do this, skip this open window,
get the patch series reviewed and hopefully we can work together on
fixing that regression and we can make an informed decision of
accepting the regression for this series for the next cycle.
