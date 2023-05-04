Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D457E7
	for <oe-lkp@lists.linux.dev>; Thu,  4 May 2023 17:40:07 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-50bc0117683so1437321a12.1
        for <oe-lkp@lists.linux.dev>; Thu, 04 May 2023 10:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1683222005; x=1685814005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2Hj/xXniQ3p/G8virxCDkuXfo6F0oMzvKaeNUWhIHY=;
        b=U2ENXljIbcgQ3YnBB1djs5gG4JF9It9eTDiUCbbFuJzvmex97yi/CQlJmD6Um175mg
         Nrb0pFhdrwAKQoWt552AeiLmv0dtvowmYYeer/IylYWTmEVs7Nyn6R8iDQkUXHGCgmyx
         lXpRuLTgDI5EvnMntZjKa4F6PKEGlNC1uqgWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683222005; x=1685814005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y2Hj/xXniQ3p/G8virxCDkuXfo6F0oMzvKaeNUWhIHY=;
        b=BVPQxUDD/m8tphXxM+U3kNlP1lTAorpv8EQJYTwhxOxoF1kmKS7tD0/5H5XivlZlhM
         gBscVzJUzh1CZt29p9w1h+g8rzVjLrZ85FXukiDmTef4FbZSRRxTsAe8KINx3bsbDqhD
         EiUoZwtjMQ49DBmy9pooLBC5L+tg54z+jdV7Jk+Ah02irlfmRZ7irFznunKuN0k5Mihd
         I4RfeRwNo+43o/g7wg3Csv8TuRt+zabGFNYC2xq29lNeUKr/0uagfIJEfnWtEhvCVP/Z
         snVFja643ZK6ZdOdv+EXYR1NGS8IGPane6tBYCdEUQU9qvZpbBbp9OBCLmuhWUPaaHTm
         dBdw==
X-Gm-Message-State: AC+VfDznKRpChYXdtLJl5oJgOhA73OjqTVa6oVrYci+GdO9miC27ILfy
	GK5LCsZZ9gku09dyeqhPZHfJmWtgPhyPG0+wEQMNx6DP
X-Google-Smtp-Source: ACHHUZ76I2ec9lzZSXVpERqnlbohQuMBBekg3aEZHFfPpc2DQX/c5ItztI2Zlmf7+UcjJ5XOUpYDzw==
X-Received: by 2002:aa7:c0d4:0:b0:508:4120:202a with SMTP id j20-20020aa7c0d4000000b005084120202amr2463356edp.10.1683222005605;
        Thu, 04 May 2023 10:40:05 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id x24-20020aa7d398000000b0050bca43ff55sm2062846edq.68.2023.05.04.10.40.04
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 10:40:05 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9536df4b907so147748166b.0
        for <oe-lkp@lists.linux.dev>; Thu, 04 May 2023 10:40:04 -0700 (PDT)
X-Received: by 2002:a17:907:1c24:b0:965:819b:1e73 with SMTP id
 nc36-20020a1709071c2400b00965819b1e73mr4458281ejc.59.1683222004473; Thu, 04
 May 2023 10:40:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202305041446.71d46724-yujie.liu@intel.com>
In-Reply-To: <202305041446.71d46724-yujie.liu@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 4 May 2023 10:39:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgYqsXvK0zA0o061NSkc=dXX4LoP_4m41TyskN9RHrojQ@mail.gmail.com>
Message-ID: <CAHk-=wgYqsXvK0zA0o061NSkc=dXX4LoP_4m41TyskN9RHrojQ@mail.gmail.com>
Subject: Re: [linus:master] [x86] adfcf4231b: blogbench.read_score -10.9% regression
To: kernel test robot <yujie.liu@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 4, 2023 at 1:12=E2=80=AFAM kernel test robot <yujie.liu@intel.c=
om> wrote:
>
> Since there are both improvements and regressions in various micro
> benchmarks, we are sending this report to provide some data and hope
> this can be helpful for further investigation. Thanks.

Heh, yes. As that makes clear, the 10% regression on one load was a
25% improvement on another.

That said, while I was expecting these kinds of results, the absolute
percentages are much higher than I expected. I would have expected a
lot of "couple of percent either way".

Even with memory copies being as important as they are, moving the
needle by -10% to +25% is a much bigger swing than expected.

> Details are as below:

One of the issues with the details is that these benchmarks are
running on different machines, so there's a mix of

  Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake)
  Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake)

in those details, and it might matter.

That said, the big picture is probably independent - both have ERMS
with 'rep movs' doing some cacheline optimizations, and the big
changes in the perf data is in things like 'perf-stat.ps.dTLB-stores'
and 'perf-stat.ps.node-store-misses' which is probably exactly about
that.

And I suspect that the 'blogbench.read_score' thing probably does
mostly big reads, and really really liked the cacheline optimizations
of 'rep movs' even when it was slow in other things.

Let me think about how ugly it would be to re-introduce that case just
for large copies.

                     Linus
