Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB42B482E3
	for <oe-lkp@lists.linux.dev>; Wed, 20 Dec 2023 20:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnomDLnq"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6d3165ac96bso79614b3a.0
        for <oe-lkp@lists.linux.dev>; Wed, 20 Dec 2023 12:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703103263; x=1703708063; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNiy0jH8FDZZVZiqQIhmWtF+05OpH5cCP9I8S3ulDiA=;
        b=TnomDLnqjLFFyh69tvdu2uk7IvDX+WLuKX7+j4+dVXcFrcUc2CStaN8/JC8QRpaU1+
         kUIQaGlYmOZ8o875OrLRlfjqzOwaNS6ouuHEzbZcfu/Qk1NPKSwUrC9pfpwvGahEoIz4
         Mk3wZ+uIvi9Z5QXITQAhD8Qi8E79T1z4S2zGdkftD0XQaCHlCETazg2sA3uHGt20xCX5
         330vGdHEf7OkVNjqijetIe9rH9erJEk5ZHv+ThngWYO9gX8L9aKVohZgGuWQ1HqtQh47
         wkKVTQdyjfIyVudLWvj123dsswWHyqiRUpU5E7+cJ+tA9R7j5O6waHLkiQ9bdYx+WchI
         +cQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703103263; x=1703708063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tNiy0jH8FDZZVZiqQIhmWtF+05OpH5cCP9I8S3ulDiA=;
        b=gRW94ZP4HjU5j5fXrEAmYjwlW/nnUSx0GjJYdUXwsYMnw3KajVNKyFrnR/vdlaDwzX
         lq4jUnxWqHj68NpQtyvtOc6Rtsw1fmNEJJcpbvFfVXH5gwANlrG8MUPX91s92BmaOt5v
         1mkKxzmaz+gYFSHg4/ktCJhtnaPlyGPWWgvcnBF/xUHUFO6O9sjZDN89cBzlY/ht495v
         jhyvwm3eyCyiyZllT0LuX3v/Mgk3VD1raIbYa3YAcWd5vvNPjcCpPfeqNH9z3tcCfNoH
         b5Cu3H7V8B2bodVkwf4L87s85wOQxh6HLf0f4TJcfnU78M7aFJQvArgRVfVFKJJTB5Ef
         ZlwA==
X-Gm-Message-State: AOJu0Yx+/qzEEWe3bhndyU7xIbppHE9G9bfvZuX8QbHDsNaA4g2rNacW
	Tm8wE6OiZCABJwXrym+wVoYSqguiFxFIBJM3uE0=
X-Google-Smtp-Source: AGHT+IGusGIA0mvPVdXj2/EcSlL518ttyPvZs9uWvMMcGiJH8OVIeaika87ENJk2i+kQmohvy12yM0rSG72JuO/2atQ=
X-Received: by 2002:a05:6a00:1996:b0:6d9:3981:5903 with SMTP id
 d22-20020a056a00199600b006d939815903mr2452525pfl.0.1703103262693; Wed, 20 Dec
 2023 12:14:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312192310.56367035-oliver.sang@intel.com> <CAHbLzkogaL-VTuZbBbPp=O8TPZxJmabJLRx1hrD-65rtbRmTtQ@mail.gmail.com>
 <ec48d168-284b-4376-97a7-090273a3ae5e@intel.com> <edb35574-e8be-adc8-a756-96bcbab2f0af@linux.com>
In-Reply-To: <edb35574-e8be-adc8-a756-96bcbab2f0af@linux.com>
From: Yang Shi <shy828301@gmail.com>
Date: Wed, 20 Dec 2023 12:14:09 -0800
Message-ID: <CAHbLzkrRfOdDx2OTB0kW49FxE+HtntKBihp2Qh-UrKXM7r8C8g@mail.gmail.com>
Subject: Re: [linux-next:master] [mm] 1111d46b5c: stress-ng.pthread.ops_per_sec
 -84.3% regression
To: "Christoph Lameter (Ampere)" <cl@linux.com>
Cc: Yin Fengwei <fengwei.yin@intel.com>, kernel test robot <oliver.sang@intel.com>, 
	Rik van Riel <riel@surriel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, ying.huang@intel.com, feng.tang@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 7:42=E2=80=AFAM Christoph Lameter (Ampere) <cl@linu=
x.com> wrote:
>
> On Wed, 20 Dec 2023, Yin Fengwei wrote:
>
> >> Interesting, wasn't the same regression seen last time? And I'm a
> >> little bit confused about how pthread got regressed. I didn't see the
> >> pthread benchmark do any intensive memory alloc/free operations. Do
> >> the pthread APIs do any intensive memory operations? I saw the
> >> benchmark does allocate memory for thread stack, but it should be just
> >> 8K per thread, so it should not trigger what this patch does. With
> >> 1024 threads, the thread stacks may get merged into one single VMA (8M
> >> total), but it may do so even though the patch is not applied.
> > stress-ng.pthread test code is strange here:
> >
> > https://github.com/ColinIanKing/stress-ng/blob/master/stress-pthread.c#=
L573
> >
> > Even it allocates its own stack, but that attr is not passed
> > to pthread_create. So it's still glibc to allocate stack for
> > pthread which is 8M size. This is why this patch can impact
> > the stress-ng.pthread testing.
>
> Hmmm... The use of calloc()  for 8M triggers an mmap I guess.
>
> Why is that memory slower if we align the adress to a 2M boundary? Becaus=
e
> THP can act faster and creates more overhead?

glibc calls madvise() to free unused stack, that may have higher cost
due to THP (splitting pmd, deferred split queue, etc).

>
> > while this time, the hotspot is in (pmd_lock from do_madvise I suppose)=
:
> >   - 55.02% zap_pmd_range.isra.0
> >      - 53.42% __split_huge_pmd
> >         - 51.74% _raw_spin_lock
> >            - 51.73% native_queued_spin_lock_slowpath
> >               + 3.03% asm_sysvec_call_function
> >         - 1.67% __split_huge_pmd_locked
> >            - 0.87% pmdp_invalidate
> >               + 0.86% flush_tlb_mm_range
> >      - 1.60% zap_pte_range
> >         - 1.04% page_remove_rmap
> >              0.55% __mod_lruvec_page_state
>
> Ok so we have 2M mappings and they are split because of some action on 4K
> segments? Guess because of the guard pages?

It should not relate to guard pages, just due to free unused stack
which may be partial 2M.

>
> >> More time spent in madvise and munmap. but I'm not sure whether this
> >> is caused by tearing down the address space when exiting the test. If
> >> so it should not count in the regression.
> > It's not for the whole address space tearing down. It's for pthread
> > stack tearing down when pthread exit (can be treated as address space
> > tearing down? I suppose so).
> >
> > https://github.com/lattera/glibc/blob/master/nptl/allocatestack.c#L384
> > https://github.com/lattera/glibc/blob/master/nptl/pthread_create.c#L576
> >
> > Another thing is whether it's worthy to make stack use THP? It may be
> > useful for some apps which need large stack size?
>
> No can do since a calloc is used to allocate the stack. How can the kerne=
l
> distinguish the allocation?

Just by VM_GROWSDOWN | VM_GROWSUP. The user space needs to tell kernel
this area is stack by setting proper flags. For example,

ffffca1df000-ffffca200000 rw-p 00000000 00:00 0                          [s=
tack]
Size:                132 kB
KernelPageSize:        4 kB
MMUPageSize:           4 kB
Rss:                  60 kB
Pss:                  60 kB
Pss_Dirty:            60 kB
Shared_Clean:          0 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:        60 kB
Referenced:           60 kB
Anonymous:            60 kB
LazyFree:              0 kB
AnonHugePages:         0 kB
ShmemPmdMapped:        0 kB
FilePmdMapped:         0 kB
Shared_Hugetlb:        0 kB
Private_Hugetlb:       0 kB
Swap:                  0 kB
SwapPss:               0 kB
Locked:                0 kB
THPeligible:    0
VmFlags: rd wr mr mw me gd ac

The "gd" flag means GROWSDOWN. But it totally depends on glibc in
terms of how it considers about "stack". So glibc just uses calloc()
to allocate stack area.

>
>
