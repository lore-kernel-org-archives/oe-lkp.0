Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB7220305
	for <oe-lkp@lists.linux.dev>; Fri, 20 Oct 2023 17:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cm7rRIC0"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c9c145bb5bso7665ad.1
        for <oe-lkp@lists.linux.dev>; Fri, 20 Oct 2023 10:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697822609; x=1698427409; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZExr3HakSu/t70XqjHC6rrKDB2IMk8Lwf9XEJ5+nuo=;
        b=Cm7rRIC00kzegU93/KvNgoRTW3XSAZqeiQkx0/zEbnWDHkmsr0YPCUeS3zoZNxewUV
         6VBxcNqwhZg110PhhXzetOeBQ24TK5YHT2ZxwILRglNXVbnOwxrTYO+Mo4KXZHsnuwM5
         ssttlSQZ6wDzh1dI2S8uxFpFSgVhHJ+R+1DIavNx866QrEM+o+ERF8dC4zK5CC2JTZK8
         /GzDXrAm16t8ASvyDvd1EM09GyL+CInYMdsKdknmHniEs9OLa3Mi8IbLzThjmMBY3siW
         uetSdLgHLfla3sZRVZhq2zTqbNrivPYaWNbaWvz3fBf7c4cF0tKHArQgkLR1tlI9fDk3
         tjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697822609; x=1698427409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZExr3HakSu/t70XqjHC6rrKDB2IMk8Lwf9XEJ5+nuo=;
        b=krTy2ETwKDezhcZrNxertROEkRlYisRUzMw2Kqeb7jkorsJmpvj6I95Jn+CDYjsZo0
         DJJGLR/u4muxgtaCzli1vINJuRyeoy+JAzXAmoiIzx4WGxg9x70kvQ2LRGVQApCbXBgE
         GLZ8ODZbUle+SoS9d4URgCCZ2dvyDsY8njL4y0FrBXGXUlXNu0J+ZOMeq+saGDcMJt/j
         yJxk89QNsAfb5dPfy44Yzk49FjdAB+zitsgxlmcweHmjIc1gVYul6VZKGShcdmHS2opI
         MSfBs1iqB8rriA/RS/lPp0FgpdSa6wKD2blRolv0w+uzwIL7sJAkIwEio5LSNc0wjuy0
         wnKQ==
X-Gm-Message-State: AOJu0YxAjaAMXwYuYEzaS0+IbdEFBjSsv4TRfAB7kcdFqTmhGybvKrJQ
	l1UTVmYfqfyR4vtohccBRyjcYC6uMQFZHX5+V7gVSQ==
X-Google-Smtp-Source: AGHT+IE6qIeeuEX5YH+y/z1n375Wnwum8Fvy1MQ/6ot9JPGuTfvhnYMSZC0YoAk+ckCivwMMP+8siHwBMoL3xRQ8aZ0=
X-Received: by 2002:a17:902:e949:b0:1c1:efe5:ccf8 with SMTP id
 b9-20020a170902e94900b001c1efe5ccf8mr256373pll.17.1697822608688; Fri, 20 Oct
 2023 10:23:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231010032117.1577496-4-yosryahmed@google.com> <202310202303.c68e7639-oliver.sang@intel.com>
In-Reply-To: <202310202303.c68e7639-oliver.sang@intel.com>
From: Shakeel Butt <shakeelb@google.com>
Date: Fri, 20 Oct 2023 10:23:16 -0700
Message-ID: <CALvZod5hKvjm3WVSOGc5PpR9eNHFkt=BDmcrBe5CeWgFzP7jgQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] mm: memcg: make stats flushing threshold per-memcg
To: kernel test robot <oliver.sang@intel.com>
Cc: Yosry Ahmed <yosryahmed@google.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
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

On Fri, Oct 20, 2023 at 9:18=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed a -25.8% regression of will-it-scale.per_thread=
_ops on:
>
>
> commit: 51d74c18a9c61e7ee33bc90b522dd7f6e5b80bb5 ("[PATCH v2 3/5] mm: mem=
cg: make stats flushing threshold per-memcg")
> url: https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/mm-memcg-=
change-flush_next_time-to-flush_last_time/20231010-112257
> base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everyth=
ing
> patch link: https://lore.kernel.org/all/20231010032117.1577496-4-yosryahm=
ed@google.com/
> patch subject: [PATCH v2 3/5] mm: memcg: make stats flushing threshold pe=
r-memcg
>
> testcase: will-it-scale
> test machine: 104 threads 2 sockets (Skylake) with 192G memory
> parameters:
>
>         nr_task: 100%
>         mode: thread
>         test: fallocate1
>         cpufreq_governor: performance
>
>
> In addition to that, the commit also has significant impact on the follow=
ing tests:
>
> +------------------+-----------------------------------------------------=
----------+
> | testcase: change | will-it-scale: will-it-scale.per_thread_ops -30.0% r=
egression |
> | test machine     | 104 threads 2 sockets (Skylake) with 192G memory    =
          |
> | test parameters  | cpufreq_governor=3Dperformance                      =
            |
> |                  | mode=3Dthread                                       =
            |
> |                  | nr_task=3D50%                                       =
            |
> |                  | test=3Dfallocate1                                   =
            |
> +------------------+-----------------------------------------------------=
----------+
>

Yosry, I don't think 25% to 30% regression can be ignored. Unless
there is a quick fix, IMO this series should be skipped for the
upcoming kernel open window.
