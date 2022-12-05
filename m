Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3857C
	for <oe-lkp@lists.linux.dev>; Mon,  5 Dec 2022 20:43:58 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id h24so12310549qta.9
        for <oe-lkp@lists.linux.dev>; Mon, 05 Dec 2022 12:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBWIRVS47RUmDEcOvPdmfWIVH4IaWi6W1xGhZ6HUIpg=;
        b=VlITxXm5biYw6uI6PPXe3docWzenLdY3/Q/s8bcI84Qeqr5ssGWJZkQFxotM28q3kG
         jidIiH1cGwtjd9ELQ0YAZHqHlktIkQiMXrrnKeMpoCut3nnXF18SB3FqANyHMxvQJoZ2
         pp/50ejXAqt+zzjVTkW2LcaWDW6j/KCOcQPT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lBWIRVS47RUmDEcOvPdmfWIVH4IaWi6W1xGhZ6HUIpg=;
        b=8HhxqCMLIQ07uBtAtc6cYbtdoehk0YCHIJMWokJ0eT0FIAmX7ts2ml/45Di/eUvik+
         28SJ18N/bjng48iKWzC169xx50DecxxgVihMldv+M016hdkRjGIWfX/JJ6QMIUUUl572
         7aIClq1Jt0cHNGccDl6TWKet/Z3mlu0cD3+V1NFxzeGEABkJKjOmfAHVVO+/T/EQlC8q
         5RL+rhheda7EPQAGNev3W0bThL9qe3jo71na/QzJ+k7XZVPLr9hPziQ+g6qvFXZXk3Ai
         1DzZCk4DRquyzKihSDRZwgNSvhkkLdD8cWo0tLmY18Vx1euun0kbEFuj/MQVDNHtXbV9
         /Pig==
X-Gm-Message-State: ANoB5plAor44pUgPdKZ9Xex+41lnPEZ8Qq2+nKLeG0qiQRlZQyUzDPjX
	hVuz4jDWCdB/TTrglYxd9I+h7jIfsTBbWT4J
X-Google-Smtp-Source: AA0mqf4+VQJeHep061GrZ5ThIsW7+8Uq9rj1L+OcjQhZN4GrmTq3dSqhAwJe4qBvLFLyEhAVr0nFHw==
X-Received: by 2002:ac8:7652:0:b0:39c:c436:1ea8 with SMTP id i18-20020ac87652000000b0039cc4361ea8mr79526735qtr.384.1670273037078;
        Mon, 05 Dec 2022 12:43:57 -0800 (PST)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com. [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id r16-20020ae9d610000000b006e42a8e9f9bsm5137437qkk.121.2022.12.05.12.43.53
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 12:43:54 -0800 (PST)
Received: by mail-qt1-f176.google.com with SMTP id g7so1011395qts.1
        for <oe-lkp@lists.linux.dev>; Mon, 05 Dec 2022 12:43:53 -0800 (PST)
X-Received: by 2002:ac8:688:0:b0:3a5:122:fb79 with SMTP id f8-20020ac80688000000b003a50122fb79mr67106155qth.452.1670273033472;
 Mon, 05 Dec 2022 12:43:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212051534.852804af-yujie.liu@intel.com>
In-Reply-To: <202212051534.852804af-yujie.liu@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 5 Dec 2022 12:43:37 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg330wAAxwSaJBPUtL5Rrn7PoQK3ksJw2OLvBxA0NGg+g@mail.gmail.com>
Message-ID: <CAHk-=wg330wAAxwSaJBPUtL5Rrn7PoQK3ksJw2OLvBxA0NGg+g@mail.gmail.com>
Subject: Re: [linux-next:master] [mm] 5df397dec7: will-it-scale.per_thread_ops
 -53.3% regression
To: kernel test robot <yujie.liu@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Hugh Dickins <hughd@google.com>, Nadav Amit <nadav.amit@gmail.com>, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-arch@vger.kernel.org, ying.huang@intel.com, 
	feng.tang@intel.com, zhengjun.xing@linux.intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 5, 2022 at 1:02 AM kernel test robot <yujie.liu@intel.com> wrot=
e:
>
> FYI, we noticed a -53.3% regression of will-it-scale.per_thread_ops due t=
o commit:
> 5df397dec7c4 ("mm: delay page_remove_rmap() until after the TLB has been =
flushed")

Sadly, I think this may be at least partially expected.

The code fundamentally moves one "loop over pages" and splits it up
(with the TLB flush in between).

Which can't be great for locality, but it's kind of fundamental for
the fix - but some of it might be due to the batch limit logic.

I wouldn't have expected it to actually show up in any real loads, but:

> in testcase: will-it-scale
>         test: page_fault3

I assume that this test is doing a lot of mmap/munmap on dirty shared
memory regions (both because of the regression, and because of the
name of that test ;)

So this is hopefully an extreme case.

Now, it's likely that this particular case probably also triggers that

        /* No more batching if we have delayed rmaps pending */

which means that the loops in between the TLB flushes will be smaller,
since we don't batch up as many pages as we used to before we force a
TLB (and rmap) flush and free them.

If it's due to that batching issue it may be fixable - I'll think
about this some more, but

> Details are as below:

The bug it fixes ends up meaning that we run that rmap removal code
_after_ the TLB flush, and it looks like this (probably combined with
the batching limit) then causes some nasty iTLB load issues:

>    2291312 =C4=85  2%   +1452.8%   35580378 =C4=85  4%  perf-stat.i.iTLB-=
loads

although it also does look like it's at least partly due to some irq
timing issue (and/or bad NUMA/CPU migration luck):

>    388169          +267.4%    1426305 =C4=85  6%  vmstat.system.in
>     161.37           +84.9%     298.43 =C4=85  6%  perf-stat.ps.cpu-migra=
tions
>    172442 =C4=85  4%     +26.9%     218745 =C4=85  8%  perf-stat.ps.node-=
load-misses

so it might be that some of the regression comes down to "bad luck" -
it happened to run really nicely on that particular machine, and then
the timing changes caused some random "phase change" to the load.

The profile doesn't actually seem to show all that much more IPI
overhead, so maybe these incidental issues are what then causes that
big regression.

It would be lovely to hear if you see this on other machines and/or loads.

Because if it's a one-off, it's probably best ignored. If it shows up
elsewhere, I think that batching logic might need looking at.

               Linus
