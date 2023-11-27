Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8963C31735
	for <oe-lkp@lists.linux.dev>; Mon, 27 Nov 2023 21:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="is9TOlYJ"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a00a9c6f1e9so678275366b.3
        for <oe-lkp@lists.linux.dev>; Mon, 27 Nov 2023 13:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701119661; x=1701724461; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHlTCHe4/wBQkktFnIHXqkfvwqIEOSM2fmKEpfUC8HU=;
        b=is9TOlYJGZqskePUj1/SX1EDnzxSdu98f2WCTYVdkYOA0V9Lx85Pd0QmbDvc14o4fg
         K3pOAIWTMCssWidsiTIWdIRdoffrk4QvW1/RVaae9APMEiZ7FNAGUJzfQ5FiVRfeb/kO
         4p9vOElKzAqkWZD0IEHtnfRQ2Ib3bfXF1pW2IWy9TmqMds/WmwxuaSJSUy5I8Te5ZHID
         ao7OHsYZTnrsij61r3XCsJOeNAqbkqPixhu2gsBeXtagWaxcOEWSryWu5FtJbAfAuKIH
         YaAJVBs/aAgoeyDNYrgKKgIobG8MySwFryBJLdi/HwnBn6cxOsLvAN98E2SZtX6hbOK3
         AF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701119661; x=1701724461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHlTCHe4/wBQkktFnIHXqkfvwqIEOSM2fmKEpfUC8HU=;
        b=pks99+93JQmCyVbR+s5VhbRLci5YvVDl9bQBmJeq8D1a9hQhf7f9J0gT2r28v4J2aZ
         ucdHkTDVWlFTAfd/qQI/FGyWaUWhKiBTkjoQ3UKpLGBtPJr8EArKo3dZJFfiwRLjHn1t
         /fTYsMPX4sQH9rlAH72D5b1dR0tQVDAgtgWgt4EvnLNO6BbxU2R/hBqTp+OVJW04s+E9
         ojeyGqsPLM+B0B4WN+WQJWoi/06aDxavBzHNdjTkzheAfRlsDbJmZCFwS6RZg6OV49bC
         cVCbUT7mMP4HSOFhAg9wAtpYT3c2l+EQDU0HoCHPFQmZdAECHv1BDz89Oxw4VVjzoIC6
         CytQ==
X-Gm-Message-State: AOJu0YxxCeTR5bLHnGhoiOvH1ymTjh+Zdtk+u7dKwIsFCRAIyTas8C6r
	5KG06MwVxXh98o0RAbmxCahpkw8zxjuqwO94g4SLRQ==
X-Google-Smtp-Source: AGHT+IGYi8xwqFfFpe0niiToCpHsvm1q+RbChDCT3xccMv3sRc/JIp2SCfG7mrEYNfGO5KtCN7bAv2jFI4lPCGF/kbg=
X-Received: by 2002:a17:906:2088:b0:a12:72eb:8f64 with SMTP id
 8-20020a170906208800b00a1272eb8f64mr544654ejq.30.1701119660661; Mon, 27 Nov
 2023 13:14:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231116022411.2250072-4-yosryahmed@google.com> <202311221542.973f16ad-oliver.sang@intel.com>
In-Reply-To: <202311221542.973f16ad-oliver.sang@intel.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Mon, 27 Nov 2023 13:13:44 -0800
Message-ID: <CAJD7tkYnn6CxSJdo0QJ1hc6cFY_qWLuJ0=S6g_Pm=GBV+Ss-jw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] mm: memcg: make stats flushing threshold per-memcg
To: kernel test robot <oliver.sang@intel.com>
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

On Wed, Nov 22, 2023 at 5:54=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed a -30.2% regression of will-it-scale.per_thread=
_ops on:
>
>
> commit: c7fbfc7b4e089c4a9b292b1973a42a5761c1342f ("[PATCH v3 3/5] mm: mem=
cg: make stats flushing threshold per-memcg")
> url: https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/mm-memcg-=
change-flush_next_time-to-flush_last_time/20231116-103300
> base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everyth=
ing
> patch link: https://lore.kernel.org/all/20231116022411.2250072-4-yosryahm=
ed@google.com/
> patch subject: [PATCH v3 3/5] mm: memcg: make stats flushing threshold pe=
r-memcg
>
> testcase: will-it-scale
> test machine: 104 threads 2 sockets (Skylake) with 192G memory
> parameters:
>
>         nr_task: 50%
>         mode: thread
>         test: fallocate2
>         cpufreq_governor: performance
>
>

This regression was also reported in v2, and I explicitly mention it
in the cover letter here:
https://lore.kernel.org/lkml/20231116022411.2250072-1-yosryahmed@google.com=
/

In a nutshell, I think this microbenchmark regression does not
represent real workloads. On the other hand, there are demonstrated
benefits on real workloads from this series in terms of stats reading
time.
