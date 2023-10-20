Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BE9200D2
	for <oe-lkp@lists.linux.dev>; Fri, 20 Oct 2023 17:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="So/jtTwc"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9c41e95efcbso164912966b.3
        for <oe-lkp@lists.linux.dev>; Fri, 20 Oct 2023 10:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697823818; x=1698428618; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1heveFnCrEJOdM4DCy3MHM1wUBeG4YS6MC7cDodL18=;
        b=So/jtTwcRviacuWQnlowWjL5p+zlS6lMrlUDH7tXKfh8mQO8xpViFSSiUgG71BlAGT
         HjAIRTrf7BnXuaRLvfCB+HyzNLx0K+3FhfbzeA0FqIWRPJv++gnazkTAatuR371877TF
         wkHdccYMMw2y6ktzRycn1+x7pW4O4tyZtGIOXkE+kpNZjsRwTMXNIK1R6HR9uSos14HH
         /caDcMUYiyLtgIAg3z3mMnViVoOescQVAzbUxmzXBYbT0ljMPxuD1fGttqipICjgGcpk
         MFDJtUL6zw8kz7kAjrGFxii9nT/+i94LubXEgbSuVoGMWQjEZnOfofJ9wtBxOOev2EJ2
         kojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697823818; x=1698428618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N1heveFnCrEJOdM4DCy3MHM1wUBeG4YS6MC7cDodL18=;
        b=VwV2PwxRgf0CbTxFiQBWp9czxDZoaiyI4kI38fsWJco0k2SoefTdUJequCqh564Ane
         kX5bFnkCtCzoWlDeb4JB5SBVRu1u4naZ+itWJvgF9vkejcJ+xyEioSG6cvlck6IC36o5
         E4jGy2wnmj205hFch3B/mvEi4uNYIOrNs157R2B1SW72eFtx0xjihVh38+1QH3oz+qU7
         vXI0H9yinv8tbMtCf49zsEwKPF0CYDI7nX65uPtqFp/sTO/4zpagrdvq5qaWRfU5M8Ks
         YekAwB7UAJpQRo6lmQCLG6+HOwY7C1Ughs7Z612wBM+Y4+8N9/p5nRkdDFE3ctb6diZf
         ZZKw==
X-Gm-Message-State: AOJu0YwFaakabkdGAaTP7YHRQtdffPACnXPhu5edCcnChDg1O3/91V7m
	qkhtpMGm1bKzy4rndl70VO+Q9zq6f12lnQkVeyscxw==
X-Google-Smtp-Source: AGHT+IEXZwXYQoD3qalHsmHbpcJqzZ7tmC/iIYPTkqCHECXMuZkRt9k/MgXunNY1rLGD07LOxsOxhXyUsPRzCRi/Qag=
X-Received: by 2002:a17:906:da8c:b0:9ae:52fb:2202 with SMTP id
 xh12-20020a170906da8c00b009ae52fb2202mr1823652ejb.40.1697823818063; Fri, 20
 Oct 2023 10:43:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231010032117.1577496-4-yosryahmed@google.com>
 <202310202303.c68e7639-oliver.sang@intel.com> <CALvZod5hKvjm3WVSOGc5PpR9eNHFkt=BDmcrBe5CeWgFzP7jgQ@mail.gmail.com>
In-Reply-To: <CALvZod5hKvjm3WVSOGc5PpR9eNHFkt=BDmcrBe5CeWgFzP7jgQ@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Fri, 20 Oct 2023 10:42:58 -0700
Message-ID: <CAJD7tkbjZri4ayBOT9rJ0yMAi__c-1SVmRh_5oXezr7U6dvALg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] mm: memcg: make stats flushing threshold per-memcg
To: Shakeel Butt <shakeelb@google.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Ivan Babrou <ivan@cloudflare.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Waiman Long <longman@redhat.com>, kernel-team@cloudflare.com, 
	Wei Xu <weixugc@google.com>, Greg Thelen <gthelen@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 10:23=E2=80=AFAM Shakeel Butt <shakeelb@google.com>=
 wrote:
>
> On Fri, Oct 20, 2023 at 9:18=E2=80=AFAM kernel test robot <oliver.sang@in=
tel.com> wrote:
> >
> >
> >
> > Hello,
> >
> > kernel test robot noticed a -25.8% regression of will-it-scale.per_thre=
ad_ops on:
> >
> >
> > commit: 51d74c18a9c61e7ee33bc90b522dd7f6e5b80bb5 ("[PATCH v2 3/5] mm: m=
emcg: make stats flushing threshold per-memcg")
> > url: https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/mm-memc=
g-change-flush_next_time-to-flush_last_time/20231010-112257
> > base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-every=
thing
> > patch link: https://lore.kernel.org/all/20231010032117.1577496-4-yosrya=
hmed@google.com/
> > patch subject: [PATCH v2 3/5] mm: memcg: make stats flushing threshold =
per-memcg
> >
> > testcase: will-it-scale
> > test machine: 104 threads 2 sockets (Skylake) with 192G memory
> > parameters:
> >
> >         nr_task: 100%
> >         mode: thread
> >         test: fallocate1
> >         cpufreq_governor: performance
> >
> >
> > In addition to that, the commit also has significant impact on the foll=
owing tests:
> >
> > +------------------+---------------------------------------------------=
------------+
> > | testcase: change | will-it-scale: will-it-scale.per_thread_ops -30.0%=
 regression |
> > | test machine     | 104 threads 2 sockets (Skylake) with 192G memory  =
            |
> > | test parameters  | cpufreq_governor=3Dperformance                    =
              |
> > |                  | mode=3Dthread                                     =
              |
> > |                  | nr_task=3D50%                                     =
              |
> > |                  | test=3Dfallocate1                                 =
              |
> > +------------------+---------------------------------------------------=
------------+
> >
>
> Yosry, I don't think 25% to 30% regression can be ignored. Unless
> there is a quick fix, IMO this series should be skipped for the
> upcoming kernel open window.

I am currently looking into it. It's reasonable to skip the next merge
window if a quick fix isn't found soon.

I am surprised by the size of the regression given the following:
      1.12 =C4=85  5%      +1.4        2.50 =C4=85  2%
perf-profile.self.cycles-pp.__mod_memcg_lruvec_state

IIUC we are only spending 1% more time in __mod_memcg_lruvec_state().
