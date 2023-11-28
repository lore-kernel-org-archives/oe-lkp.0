Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAE5EA0
	for <oe-lkp@lists.linux.dev>; Tue, 28 Nov 2023 01:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hs8og0Bk"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-54b7ef7f4d5so1769738a12.1
        for <oe-lkp@lists.linux.dev>; Mon, 27 Nov 2023 17:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701136740; x=1701741540; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PphOIqSqCVmNNOsOe5Hpj1iumuWnMQ+UeGD+TeZjx4U=;
        b=Hs8og0BkHfahr/9Drmwjzcu4Z6v7PcU1fNhWIuPpesvqkFmq3nxkw12XEOb5s5Slvw
         l6xbUbm4X0j66ir70LeUT/mQg8zTnfpB98lRdJMQiL2lohsnZWp/6PbTM03HLri0r7jS
         etjRfiTlRycSwvNea/D+E1J9QzEHqALfLGRjbgFwaL1kQt1gS6jMsYP3v6vxamPA+26M
         h2B5o57YN4ARge3MNESku9OV0xkvcYYV6QzfY/8DQ48VMeIUMnSYgIbDmeIsyYM2+9Wl
         kR4AlNnxgbnEXzw6nmkwLvwpiJjuFLQ7i/J7oAYZCKwp5DuqGyj2O/HG0F/FSljjkpQS
         Jh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701136740; x=1701741540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PphOIqSqCVmNNOsOe5Hpj1iumuWnMQ+UeGD+TeZjx4U=;
        b=eNAvzwah3vVD9rTWN88t8P544ph3+wxC+vVBJ8Hzv8kEDbyPcQE4x/IaR2qGG4egGf
         gVqcy4NPGuJ7qyn/daxvAZ0DtG67anoC54TZmw9/+Ueg8rMbZl8kOhZd4jE0h7i8HvYg
         6mmhwfP4dm6fZ0be3BVJqIWju8w+rYRWmMiqVST6AXXLalopw5QBfqOpZxuNAG+0dmJg
         1c1nkBd8MlbmbApI8fQ1Qf5roXGxuLDWJxfjaN9q/tPm53DzTEa6z7po6PTRVDOluAq4
         NrtJClELLw6FneRpGsfZUzrdBNWtkChTW30bWRTV5M/apH7usls+h626jHzylr5l9aOs
         9YEA==
X-Gm-Message-State: AOJu0Yw487Azpu6drz1dLj9Y7MeyfO4e/bOfTfIYMaQv4fzMgjc5uz76
	xGC4y/f8kIQWFv7KwpZnNFtRhRFFahNnT28O/SWixw==
X-Google-Smtp-Source: AGHT+IHFydTp2xVa4ET3Zk3VpJsnsjThN5lHXwAhFmVBcv53GS0WQDvOENSxAYKSIGQKCBEJvRE4lARsexdWQUTfp2Y=
X-Received: by 2002:a17:906:c282:b0:9be:68db:b763 with SMTP id
 r2-20020a170906c28200b009be68dbb763mr7753564ejz.71.1701136740404; Mon, 27 Nov
 2023 17:59:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231116022411.2250072-4-yosryahmed@google.com>
 <202311221542.973f16ad-oliver.sang@intel.com> <CAJD7tkYnn6CxSJdo0QJ1hc6cFY_qWLuJ0=S6g_Pm=GBV+Ss-jw@mail.gmail.com>
 <ZWVGS2rNgueGH8uU@xsang-OptiPlex-9020>
In-Reply-To: <ZWVGS2rNgueGH8uU@xsang-OptiPlex-9020>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Mon, 27 Nov 2023 17:58:24 -0800
Message-ID: <CAJD7tkameJBrJQxRj+ibKL6-yd-i0wyoyv2cgZdh3ZepA1p7wA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] mm: memcg: make stats flushing threshold per-memcg
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Johannes Weiner <hannes@cmpxchg.org>, Domenico Cerasuolo <cerasuolodomenico@gmail.com>, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com, 
	Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeelb@google.com>, 
	Muchun Song <muchun.song@linux.dev>, Ivan Babrou <ivan@cloudflare.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Waiman Long <longman@redhat.com>, kernel-team@cloudflare.com, 
	Wei Xu <weixugc@google.com>, Greg Thelen <gthelen@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 5:46=E2=80=AFPM Oliver Sang <oliver.sang@intel.com>=
 wrote:
>
> hi, Yosry Ahmed,
>
> On Mon, Nov 27, 2023 at 01:13:44PM -0800, Yosry Ahmed wrote:
> > On Wed, Nov 22, 2023 at 5:54=E2=80=AFAM kernel test robot <oliver.sang@=
intel.com> wrote:
> > >
> > >
> > >
> > > Hello,
> > >
> > > kernel test robot noticed a -30.2% regression of will-it-scale.per_th=
read_ops on:
> > >
> > >
> > > commit: c7fbfc7b4e089c4a9b292b1973a42a5761c1342f ("[PATCH v3 3/5] mm:=
 memcg: make stats flushing threshold per-memcg")
> > > url: https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/mm-me=
mcg-change-flush_next_time-to-flush_last_time/20231116-103300
> > > base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-eve=
rything
> > > patch link: https://lore.kernel.org/all/20231116022411.2250072-4-yosr=
yahmed@google.com/
> > > patch subject: [PATCH v3 3/5] mm: memcg: make stats flushing threshol=
d per-memcg
> > >
> > > testcase: will-it-scale
> > > test machine: 104 threads 2 sockets (Skylake) with 192G memory
> > > parameters:
> > >
> > >         nr_task: 50%
> > >         mode: thread
> > >         test: fallocate2
> > >         cpufreq_governor: performance
> > >
> > >
> >
> > This regression was also reported in v2, and I explicitly mention it
> > in the cover letter here:
> > https://lore.kernel.org/lkml/20231116022411.2250072-1-yosryahmed@google=
.com/
>
> got it. this also reminds us to read cover letter for a patch set in the
> future. Thanks!
>
> >
> > In a nutshell, I think this microbenchmark regression does not
> > represent real workloads. On the other hand, there are demonstrated
> > benefits on real workloads from this series in terms of stats reading
> > time.
> >
>
> ok, if there are future versions of this patch, or when it is merged, we =
will
> ignore similar results.
>
> just a small question, since we focus on microbenchmark, if we found othe=
r
> regression (or improvement) on tests other than will-it-scale::fallocate,
> do you want us to send report or just ignore them, either?

I think it would be useful to know if there are
regressions/improvements in other microbenchmarks, at least to
investigate whether they represent real regressions.
