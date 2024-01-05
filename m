Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D25835EE4
	for <oe-lkp@lists.linux.dev>; Fri,  5 Jan 2024 18:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PmqapfwQ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d4d5b37670so13040145ad.0
        for <oe-lkp@lists.linux.dev>; Fri, 05 Jan 2024 10:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704480609; x=1705085409; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwYeIJWKC49gnwR7+7uK75agb8CulaCFWFO+Qndj7cY=;
        b=PmqapfwQO6HxRNp0egyPY67oh7g13iVC1Xhp8xlaYMF6FnqYK9NaL3opgyGgeeTWWw
         /oJNrHaU2BS7pGHjNTL40MGgXHngHHZ3LPZs7Bh3EfUc6aqobPrYzAJl6deldLLH1+7x
         FYS6TwbosdjifGPFRl2VEP/1SeCnqKkHKB4tlOxwt7U1m+8kF/NhRrQcBGzMylP0HG1r
         pjIQXMv5b6iCQ784knKJbS9f3pwbxpzRwHvU+m6WJN69hzwdTs8eXN44tvYxi9JME+4k
         LVRIFOgikdYcZk54FqJk52tE0mjwRyTZHQzlhMVnkL4iXtKtXGE6dGL/lTUSDJDlQbVk
         SUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704480609; x=1705085409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwYeIJWKC49gnwR7+7uK75agb8CulaCFWFO+Qndj7cY=;
        b=KTwmGd9HgnLYLLHRuaZZpv5sEc3EJAjX7yRAZBA2ieBEMeVBvycFg+drx6Sey5ZnvG
         nuAytBO8QXbVRGpQm3UIe5Kz9iN2uVP7Hc/+kk+CJdd0dP/2n7ICEGukGALNZQtLUqct
         +y12pSIRD5eIJoYrKj68YTS6ZWzMXc3vf0WH5zffGKsDyffr/WefQtg8Nv/Z/ygeuvn/
         LA3/vEolksADgcn3UmVm1tbh0bTjnyVuGEjnZx67UvPzxTjbojD0IpQMhewECuF815hs
         1w66cYMwQ9PGWLTKvDxDghFormTmiBaOUgiVu55gmCamNCVnB4FcEVJKCRbzBp9RbFHv
         I7rA==
X-Gm-Message-State: AOJu0Yx0uw7ghb4bh++WM80DZdb2/I947nZ58XoaMHASnhUDJMm+SqeL
	ev+a0NSBvI03FCe8Uweg8KEYzpxEmofd/Uymz2sV/S1j
X-Google-Smtp-Source: AGHT+IF96O2jd5Fm5v/XSoATCsewOJ+30QHxFpdMFWKnQipTqVXII3LMXAM3X1U4lMJOxYusB9G4ggtFAze6Vd/dM0c=
X-Received: by 2002:a17:90b:4d81:b0:28c:f079:11b0 with SMTP id
 oj1-20020a17090b4d8100b0028cf07911b0mr2093734pjb.61.1704480608651; Fri, 05
 Jan 2024 10:50:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ec48d168-284b-4376-97a7-090273a3ae5e@intel.com>
 <CAHbLzkrAdZ4GrtnH0NUhwPm=gZzkaGT96xVbiyOQaJ3uCFRDnw@mail.gmail.com>
 <CAHbLzkrd-y2=KHS-zreH8FUmQtOaf_FGuyj78zNNH3FbpCQNnA@mail.gmail.com>
 <b1974dc2-0e25-4075-a9ba-5e1face6c0cd@intel.com> <5753c5cb-62e3-42e6-bf04-b12b4c77b259@intel.com>
 <CAHbLzkqXaGE2RosYSejCU7wTs+p3+SWp25qqWUs8pcSbRp_dHg@mail.gmail.com>
 <988d265a-29a0-4252-9bdc-c47659e336c3@intel.com> <CAHbLzkq-i4A7XOsBfn_kPKixbt2+9HNeS+DzfjxVrTOcME_HSA@mail.gmail.com>
 <368ea00b-c5f6-4e34-b04e-ce587c15f124@intel.com> <ZZZu1s5yAyFr0wtw@xsang-OptiPlex-9020>
 <ZZfL6APUYZ3VuUTv@xsang-OptiPlex-9020>
In-Reply-To: <ZZfL6APUYZ3VuUTv@xsang-OptiPlex-9020>
From: Yang Shi <shy828301@gmail.com>
Date: Fri, 5 Jan 2024 10:49:56 -0800
Message-ID: <CAHbLzkpp0d=hPcKxprYnVJL=g0dxNcTN5vmg8AHueEXYMvoCCw@mail.gmail.com>
Subject: Re: [linux-next:master] [mm] 1111d46b5c: stress-ng.pthread.ops_per_sec
 -84.3% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: Yin Fengwei <fengwei.yin@intel.com>, Rik van Riel <riel@surriel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, 
	Christopher Lameter <cl@linux.com>, ying.huang@intel.com, feng.tang@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 5, 2024 at 1:29=E2=80=AFAM Oliver Sang <oliver.sang@intel.com> =
wrote:
>
> hi, Yang Shi,
>
> On Thu, Jan 04, 2024 at 04:39:50PM +0800, Oliver Sang wrote:
> > hi, Fengwei, hi, Yang Shi,
> >
> > On Thu, Jan 04, 2024 at 04:18:00PM +0800, Yin Fengwei wrote:
> > >
> > > On 2024/1/4 09:32, Yang Shi wrote:
> >
> > ...
> >
> > > > Can you please help test the below patch?
> > > I can't access the testing box now. Oliver will help to test your pat=
ch.
> > >
> >
> > since now the commit-id of
> >   'mm: align larger anonymous mappings on THP boundaries'
> > in linux-next/master is efa7df3e3bb5d
> > I applied the patch like below:
> >
> > * d8d7b1dae6f03 fix for 'mm: align larger anonymous mappings on THP bou=
ndaries' from Yang Shi
> > * efa7df3e3bb5d mm: align larger anonymous mappings on THP boundaries
> > * 1803d0c5ee1a3 mailmap: add an old address for Naoya Horiguchi
> >
> > our auto-bisect captured new efa7df3e3b as fbc for quite a number of re=
gression
> > so far, I will test d8d7b1dae6f03 for all these tests. Thanks
> >
>

Hi Oliver,

Thanks for running the test. Please see the inline comments.

> we got 12 regressions and 1 improvement results for efa7df3e3b so far.
> (4 regressions are just similar to what we reported for 1111d46b5c).
> by your patch, 6 of those regressions are fixed, others are not impacted.
>
> below is a summary:
>
> No.  testsuite       test                            status-on-efa7df3e3b=
  fix-by-d8d7b1dae6 ?
> =3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D       =3D=3D=3D=3D                =
            =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> (1)  stress-ng       numa                            regression          =
  NO
> (2)                  pthread                         regression          =
  yes (on a Ice Lake server)
> (3)                  pthread                         regression          =
  yes (on a Cascade Lake desktop)
> (4)  will-it-scale   malloc1                         regression          =
  NO

I think this was reported earlier when Rik submitted the patch in the
first place. IIRC, Huang Ying did some analysis on this one and
thought is can be ignored.

> (5)                  page_fault1                     improvement         =
  no (so still improvement)
> (6)  vm-scalability  anon-w-seq-mt                   regression          =
  yes
> (7)  stream          nr_threads=3D25%                  regression        =
    yes
> (8)                  nr_threads=3D50%                  regression        =
    yes
> (9)  phoronix        osbench.CreateThreads           regression          =
  yes (on a Cascade Lake server)
> (10)                 ramspeed.Add.Integer            regression          =
  NO (and below 3, on a Coffee Lake desktop)
> (11)                 ramspeed.Average.FloatingPoint  regression          =
  NO
> (12)                 ramspeed.Triad.Integer          regression          =
  NO
> (13)                 ramspeed.Average.Integer        regression          =
  NO

Not fixing the ramspeed regression is expected. But it seems like both
I and Fengwei can't reproduce the regression with running ramspeed
alone.

>
>
> below are details, for those regressions not fixed by d8d7b1dae6, attache=
d
> full comparison.
>
>
> (1) detail comparison is attached as 'stress-ng-regression'
>
> Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with memory: 256G
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> class/compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test=
/testcase/testtime:
>   cpu/gcc-12/performance/x86_64-rhel-8.3/100%/debian-11.1-x86_64-20220510=
.cgz/lkp-icl-2sp7/numa/stress-ng/60s
>
> 1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>     251.12           -48.2%     130.00           -47.9%     130.75       =
 stress-ng.numa.ops
>       4.10           -49.4%       2.08           -49.2%       2.09       =
 stress-ng.numa.ops_per_sec

This is a new one. I did some analysis, it seems like it is not
related to the THP patch since I can reproduce it on the kernel (on
aarch64 VM) w/o the THP patch if I set THP to always.

The profiling showed the regression was caused by move_pages()
syscall. The test actually calls a bunch of NUMA syscalls, for
example, set_mempolicy(), mbind(), move_pages(), migrate_pages(), etc,
with different parameters. When calling move_pages() it tries to move
pages (at base page granularity) to different nodes in a circular
list. On my 2-node NUMA VM, it actually moves:

0th page to node #1
1st page to node #0
2nd page to node #1
3rd page to node #0
....
1023rd page to node #0

But for THP, it actually bounces the THP between the two nodes for 512 time=
s.

The pgmigrate_success counter in /proc/vmstat also reflected the case:

For base page, the delta is 1928431, but for THP case the delta is 21846640=
2.

The kernel already did the node check to kip move if the page is
already on the target node, but the test case just do the bounce on
purpose since it just assumes base page. So I think this case should
be run with THP disabled.

>
>
> (2)
> Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with memory: 256G
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_gr=
oup/test/testcase/testtime:
>   os/gcc-12/performance/1HDD/ext4/x86_64-rhel-8.3/10%/debian-11.1-x86_64-=
20220510.cgz/lkp-icl-2sp7/pthread/stress-ng/60s
>
> 1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>    3272223           -87.8%     400430            +0.5%    3287322       =
 stress-ng.pthread.ops
>      54516           -87.8%       6664            +0.5%      54772       =
 stress-ng.pthread.ops_per_sec
>
>
> (3)
> Intel(R) Core(TM) i9-10980XE CPU @ 3.00GHz (Cascade Lake) with memory: 12=
8G
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_gr=
oup/test/testcase/testtime:
>   os/gcc-12/performance/1HDD/ext4/x86_64-rhel-8.3/1/debian-11.1-x86_64-20=
220510.cgz/lkp-csl-d02/pthread/stress-ng/60s
>
> 1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>    2250845           -85.2%     332370 =C2=B1  6%      -0.8%    2232820  =
      stress-ng.pthread.ops
>      37510           -85.2%       5538 =C2=B1  6%      -0.8%      37209  =
      stress-ng.pthread.ops_per_sec
>
>
> (4) full comparison attached as 'will-it-scale-regression'
>
> Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with memory: =
192G
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/tes=
tcase:
>   gcc-12/performance/x86_64-rhel-8.3/process/50%/debian-11.1-x86_64-20220=
510.cgz/lkp-cpl-4sp2/malloc1/will-it-scale
>
> 1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>      10994           -86.7%       1466           -86.7%       1460       =
 will-it-scale.per_process_ops
>    1231431           -86.7%     164315           -86.7%     163624       =
 will-it-scale.workload
>
>
> (5)
> Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with memory: =
192G
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/tes=
tcase:
>   gcc-12/performance/x86_64-rhel-8.3/thread/100%/debian-11.1-x86_64-20220=
510.cgz/lkp-cpl-4sp2/page_fault1/will-it-scale
>
> 1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>   18858970           +44.8%   27298921           +44.9%   27330479       =
 will-it-scale.224.threads
>      56.06           +13.3%      63.53           +13.8%      63.81       =
 will-it-scale.224.threads_idle
>      84191           +44.8%     121869           +44.9%     122010       =
 will-it-scale.per_thread_ops
>   18858970           +44.8%   27298921           +44.9%   27330479       =
 will-it-scale.workload
>
>
> (6)
> Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with memory: =
192G
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/tes=
tcase:
>   gcc-12/performance/x86_64-rhel-8.3/debian-11.1-x86_64-20220510.cgz/300s=
/8T/lkp-cpl-4sp2/anon-w-seq-mt/vm-scalability
>
> 1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>     345968            -6.5%     323566            +0.1%     346304       =
 vm-scalability.median
>       1.91 =C2=B1 10%      -0.5        1.38 =C2=B1 20%      -0.2        1=
.75 =C2=B1 13%  vm-scalability.median_stddev%
>   79708409            -7.4%   73839640            -0.1%   79613742       =
 vm-scalability.throughput
>
>
> (7)
> Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with memory: 512G
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> array_size/compiler/cpufreq_governor/iterations/kconfig/loop/nr_threads/o=
mp/rootfs/tbox_group/testcase:
>   50000000/gcc-12/performance/10x/x86_64-rhel-8.3/100/25%/true/debian-11.=
1-x86_64-20220510.cgz/lkp-spr-2sp4/stream
>
> 1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>     349414           -16.2%     292854 =C2=B1  2%      -0.4%     348048  =
      stream.add_bandwidth_MBps
>     347727 =C2=B1  2%     -16.5%     290470 =C2=B1  2%      -0.6%     345=
750 =C2=B1  2%  stream.add_bandwidth_MBps_harmonicMean
>     332206           -21.6%     260428 =C2=B1  3%      -0.4%     330838  =
      stream.copy_bandwidth_MBps
>     330746 =C2=B1  2%     -22.6%     255915 =C2=B1  3%      -0.6%     328=
725 =C2=B1  2%  stream.copy_bandwidth_MBps_harmonicMean
>     301178           -16.9%     250209 =C2=B1  2%      -0.4%     299920  =
      stream.scale_bandwidth_MBps
>     300262           -17.7%     247151 =C2=B1  2%      -0.6%     298586 =
=C2=B1  2%  stream.scale_bandwidth_MBps_harmonicMean
>     337408           -12.5%     295287 =C2=B1  2%      -0.3%     336304  =
      stream.triad_bandwidth_MBps
>     336153           -12.7%     293621            -0.5%     334624 =C2=B1=
  2%  stream.triad_bandwidth_MBps_harmonicMean
>
>
> (8)
> Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with memory: 512G
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> array_size/compiler/cpufreq_governor/iterations/kconfig/loop/nr_threads/o=
mp/rootfs/tbox_group/testcase:
>   50000000/gcc-12/performance/10x/x86_64-rhel-8.3/100/50%/true/debian-11.=
1-x86_64-20220510.cgz/lkp-spr-2sp4/stream
>
> 1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>     345632           -19.7%     277550 =C2=B1  3%      +0.4%     347067 =
=C2=B1  2%  stream.add_bandwidth_MBps
>     342263 =C2=B1  2%     -19.7%     274704 =C2=B1  2%      +0.4%     343=
609 =C2=B1  2%  stream.add_bandwidth_MBps_harmonicMean
>     343820           -17.3%     284428 =C2=B1  3%      +0.1%     344248  =
      stream.copy_bandwidth_MBps
>     341759 =C2=B1  2%     -17.8%     280934 =C2=B1  3%      +0.1%     342=
025 =C2=B1  2%  stream.copy_bandwidth_MBps_harmonicMean
>     343270           -17.8%     282330 =C2=B1  3%      +0.3%     344276 =
=C2=B1  2%  stream.scale_bandwidth_MBps
>     340812 =C2=B1  2%     -18.3%     278284 =C2=B1  3%      +0.3%     341=
672 =C2=B1  2%  stream.scale_bandwidth_MBps_harmonicMean
>     364596           -19.7%     292831 =C2=B1  3%      +0.4%     366145 =
=C2=B1  2%  stream.triad_bandwidth_MBps
>     360643 =C2=B1  2%     -19.9%     289034 =C2=B1  3%      +0.4%     362=
004 =C2=B1  2%  stream.triad_bandwidth_MBps_harmonicMean
>
>
> (9)
> Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with memory: 512G
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/option_a/rootfs/tbox_group/test/testcas=
e:
>   gcc-12/performance/x86_64-rhel-8.3/Create Threads/debian-x86_64-phoroni=
x/lkp-csl-2sp7/osbench-1.0.2/phoronix-test-suite
>
> 1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>      26.82         +1348.4%     388.43            +4.0%      27.88       =
 phoronix-test-suite.osbench.CreateThreads.us_per_event
>
>
> **** for below (10) - (13), full comparison is attached as phoronix-regre=
ssions
> (they all happen on a Coffee Lake desktop)
> (10)
> Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with memory: 16G
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/option_a/option_b/rootfs/tbox_group/tes=
t/testcase:
>   gcc-12/performance/x86_64-rhel-8.3/Add/Integer/debian-x86_64-phoronix/l=
kp-cfl-d1/ramspeed-1.4.3/phoronix-test-suite
>
> 1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>      20115            -4.5%      19211            -4.5%      19217       =
 phoronix-test-suite.ramspeed.Add.Integer.mb_s
>
>
> (11)
> Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with memory: 16G
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/option_a/option_b/rootfs/tbox_group/tes=
t/testcase:
>   gcc-12/performance/x86_64-rhel-8.3/Average/Floating Point/debian-x86_64=
-phoronix/lkp-cfl-d1/ramspeed-1.4.3/phoronix-test-suite
>
> 1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>      19960            -2.9%      19378            -3.0%      19366       =
 phoronix-test-suite.ramspeed.Average.FloatingPoint.mb_s
>
>
> (12)
> Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with memory: 16G
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/option_a/option_b/rootfs/tbox_group/tes=
t/testcase:
>   gcc-12/performance/x86_64-rhel-8.3/Triad/Integer/debian-x86_64-phoronix=
/lkp-cfl-d1/ramspeed-1.4.3/phoronix-test-suite
>
> 1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>      19667            -6.4%      18399            -6.4%      18413       =
 phoronix-test-suite.ramspeed.Triad.Integer.mb_s
>
>
> (13)
> Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with memory: 16G
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/option_a/option_b/rootfs/tbox_group/tes=
t/testcase:
>   gcc-12/performance/x86_64-rhel-8.3/Average/Integer/debian-x86_64-phoron=
ix/lkp-cfl-d1/ramspeed-1.4.3/phoronix-test-suite
>
> 1803d0c5ee1a3bbe efa7df3e3bb5da8e6abbe377274 d8d7b1dae6f0311d528b289cda7
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>      19799            -3.5%      19106            -3.4%      19117       =
 phoronix-test-suite.ramspeed.Average.Integer.mb_s
>
>
>
> >
> >
> > commit d8d7b1dae6f0311d528b289cda7b317520f9a984
> > Author: 0day robot <lkp@intel.com>
> > Date:   Thu Jan 4 12:51:10 2024 +0800
> >
> >     fix for 'mm: align larger anonymous mappings on THP boundaries' fro=
m Yang Shi
> >
> > diff --git a/include/linux/mman.h b/include/linux/mman.h
> > index 40d94411d4920..91197bd387730 100644
> > --- a/include/linux/mman.h
> > +++ b/include/linux/mman.h
> > @@ -156,6 +156,7 @@ calc_vm_flag_bits(unsigned long flags)
> >         return _calc_vm_trans(flags, MAP_GROWSDOWN,  VM_GROWSDOWN ) |
> >                _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
> >                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
> > +              _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
> >                arch_calc_vm_flag_bits(flags);
> >  }
> >
> >
> > >
> > > Regards
> > > Yin, Fengwei
> > >
> > > >
> > > > diff --git a/include/linux/mman.h b/include/linux/mman.h
> > > > index 40d94411d492..dc7048824be8 100644
> > > > --- a/include/linux/mman.h
> > > > +++ b/include/linux/mman.h
> > > > @@ -156,6 +156,7 @@ calc_vm_flag_bits(unsigned long flags)
> > > >          return _calc_vm_trans(flags, MAP_GROWSDOWN,  VM_GROWSDOWN =
) |
> > > >                 _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    =
) |
> > > >                 _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      =
) |
> > > > +              _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE)=
 |
> > > >                 arch_calc_vm_flag_bits(flags);
> > > >   }
> > > >
