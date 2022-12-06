Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89A617E3
	for <oe-lkp@lists.linux.dev>; Tue,  6 Dec 2022 18:41:48 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id s14so11017095qvo.11
        for <oe-lkp@lists.linux.dev>; Tue, 06 Dec 2022 10:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QGDPW0qn4xB9RA6D+u1gKg7b7l81anigG3dz/OOHF2g=;
        b=ggZvjEjKQi2R/wjjDPkKFioUFaKFXL1nm0gNlGGrjxzXjM3owIUwa2ij8Vhl9diYzx
         D7BAn7xwRq50qfTkx29PHUUGQf1gfyQr1++AUM8iGhQQlI7XzulOgG/4PccQmO2nm2nv
         TNyj+WUxy6Ol6xF7Ho6aULUaihzU2JaZdd+us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGDPW0qn4xB9RA6D+u1gKg7b7l81anigG3dz/OOHF2g=;
        b=jFi114yKawe20eq5G2PMWsmUSygTCgZ6MbAPQ9jCHB03vE5D9wOKpg+7iwSoqYdRkc
         TJ8qhgfE/MhTwv7ugTWIt7PObukCb/Culo+O5+eV7kdb5zGPDMVz2InRpE+BC+4bQAun
         MrKyDQ7ohpPyjTXFFdFZv07U8jQTZLC6MKdMrDoRnszaHlz8naYFm/vVmKn9t+k36/io
         qwcpz5p8jviEE11/dlqGNHcX9T1QCe+b0u1PB+FYs6HrFBbytGffTyvfBMhg1GcaNf2h
         Z6RuCO9acm0UvD62ACYZPwdUtNjP+efdyH9p1AO6olWxtLJ3890q3bgXlZwIgpNDkbjE
         zn0g==
X-Gm-Message-State: ANoB5pm6JrnXYiIMOB/yELJKeVizxHGSIcqQ7686ZNlFLuLqCaPE3LWw
	5hMYo66oy0+BNdPHwT7GQUh2m9M5ftQZV9a5
X-Google-Smtp-Source: AA0mqf4Cb9vlS2tCb+CLIaASDJVMR5kBORpHAQBmRBzrXqpfOLz6DyTdXsdvAOT3Hc9M0ac5Ql0EvQ==
X-Received: by 2002:a05:6214:5bc2:b0:4c6:5a5f:3068 with SMTP id lr2-20020a0562145bc200b004c65a5f3068mr60276113qvb.118.1670352107223;
        Tue, 06 Dec 2022 10:41:47 -0800 (PST)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id bn36-20020a05620a2ae400b006fafaac72a6sm4799150qkb.84.2022.12.06.10.41.45
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 10:41:45 -0800 (PST)
Received: by mail-qk1-f172.google.com with SMTP id k2so8210219qkk.7
        for <oe-lkp@lists.linux.dev>; Tue, 06 Dec 2022 10:41:45 -0800 (PST)
X-Received: by 2002:ae9:e00c:0:b0:6f8:1e47:8422 with SMTP id
 m12-20020ae9e00c000000b006f81e478422mr78525658qkk.72.1670352104706; Tue, 06
 Dec 2022 10:41:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212051534.852804af-yujie.liu@intel.com> <CAHk-=wg330wAAxwSaJBPUtL5Rrn7PoQK3ksJw2OLvBxA0NGg+g@mail.gmail.com>
 <87ilipffws.fsf@yhuang6-desk2.ccr.corp.intel.com>
In-Reply-To: <87ilipffws.fsf@yhuang6-desk2.ccr.corp.intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 6 Dec 2022 10:41:28 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjDzVL+r6NmnU--tyEfDYhUB-5m=PQBZTQ2Es8bx7Mz+w@mail.gmail.com>
Message-ID: <CAHk-=wjDzVL+r6NmnU--tyEfDYhUB-5m=PQBZTQ2Es8bx7Mz+w@mail.gmail.com>
Subject: Re: [linux-next:master] [mm] 5df397dec7: will-it-scale.per_thread_ops
 -53.3% regression
To: "Huang, Ying" <ying.huang@intel.com>
Cc: kernel test robot <yujie.liu@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Hugh Dickins <hughd@google.com>, Nadav Amit <nadav.amit@gmail.com>, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-arch@vger.kernel.org, feng.tang@intel.com, 
	zhengjun.xing@linux.intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 5, 2022 at 6:03 PM Huang, Ying <ying.huang@intel.com> wrote:
>
> >
> > I assume that this test is doing a lot of mmap/munmap on dirty shared
> > memory regions (both because of the regression, and because of the
> > name of that test ;)
>
> I have checked the source code of will-it-scale/page_fault3.  Yes, it
> exactly does that.

Heh. I took a look at that test-case, and yeah, it's just doing a
128MB shared mapping, dirtying it one page at a time, and unmapping it
in a loop.

It doesn't even look like a very good benchmark for that, because the
_first_ time around the loop it does it is very different in that it
has to actually create the file extents.

So that benchmark starts out testing something different than what the
steady state is.

But yeah, that's pretty much the worst possible case for this all, and
yes, I suspect it's more about the TLB batching than anything else.

And I think I see the issue. We actually have a reasonably big batch
size most of the time, but this benchmark triggers that dirty shared
page logic on every page, and that in turn means that we stop batching
immediately - even when we only have the initial tiny on-stack batch.

So instead of batching MAX_GATHER_BATCH pages at a time (roughly 500
pages per go), we end up batching just eight pages (MMU_GATHER_BUNDLE)
at a time.

I didn't think of that degenerate case.

Let me think about this a while, but I think I'll have a patch for you
to test once I've dealt with a couple more pull requests.

                  Linus
