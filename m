Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFBD2AEE1
	for <oe-lkp@lists.linux.dev>; Fri, 19 Sep 2025 18:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758306735; cv=none; b=EMOr5MM6Kcd7363oZA+lXAY+XkAS/eU/9fQgS6Q1pCMQi0Q7HtW1+/ECq4oVGvBIBZ8mc7nHoeIJitJMPW5TxQ/l73Nb1Rod3NrD2xiH5BW+XfflycNXJ7nEmSdTPzSkip44laulqWmn/afrECDXjm4rRr6tXGPq2fahp2GAvMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758306735; c=relaxed/simple;
	bh=3ViMnQZvMw/PVfgt6tOZ2gE26gfqdnyhKLJT1uzuiiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ak5ag5JZaZgPhophoJcaWg6LN8+hVpJ1zVSwYTu8I9Gou56BGDdVeHHpGDIbC0+LzeJa/EfdtDz2rUbLwLcHSWJb/00uUDIjLfS/Temy63knqVMTD8cZLIVt0PUmxsijRJ3EPSCMQBpwL5VCJaybFPi9C0vnZLweQDWxVYITTCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWeotTde; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWeotTde"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ee155e0c08so1197140f8f.2
        for <oe-lkp@lists.linux.dev>; Fri, 19 Sep 2025 11:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758306731; x=1758911531; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNz2rvWdWurkAjYnYhECzBshCI3+0s6yD1fA4kNT29Q=;
        b=cWeotTdevu70ha5nrO3U9MZzH3LRK8DV2C7mR061/3ZWVwY6dojlQjjXEwZyzlU2zs
         +eNVsqNXeIYp3c8NhUYhv8lVg/L+/RuYix9faOE2N/9ZQI95Jf8Bj2ufygbzmE26eUpP
         I123b80NXlO5bl8rwOO0+J3Znfwjcvg5w3tO83ZUDrYlGuj0yHySzCC065eXVTLgvZ49
         hCoReTwshQ1iZMaTsTBzfaN5kZtEqV+fWjdW69fTCHB2b9ju/b2jmIo2C1rq2gp4FlsX
         2NW5g9dsOUr/o2gMHiw4ysaj//xlgpmFiUd3TVO8UvJPpFSIirRCVAcLn5kt7NQdr00U
         haRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758306731; x=1758911531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NNz2rvWdWurkAjYnYhECzBshCI3+0s6yD1fA4kNT29Q=;
        b=qoqUlU0JhPDtbfiLrN9ObT+jl7MqWYdOSA0sTTPBFP4BE1ggqtPFrPRC0jRCiZGrAa
         UZWYDg9TG8hHLyHDSvc/dUhxNq9GYPXZrQOcqZgr+Mmntt1bAKmmMBqGJhig0s282XF/
         CxmkBg4iF1wDd3Gao736JNBP7KgEDFOnoGvRxTrylFTsk8LkzM70SI4v6gBTcHsZnC14
         3Ik90ILBt8sZe7EOfEW+PtCLr4PvlAaom7n4adzgW21Yw8YyEGiTT6OBmjLc8KHH3ynQ
         ulv48o8gY9h7dfIRWkXKRzZmtRq6fQIvV+8hqwBAHKoq3E/RoA6/zg9y0BQGeciXUt2w
         74CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpbPNiZs2GvO4yagPOpeykmDHiR86NQWElTRCe+D6R8SnQ2wnkVioQxzOS6VWHYHTfbFXE4EU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLUpJnXenBUj43DdaqQO4pnZASYP4d1U5lL7X1iCAtmxMZunmL
	ZVQhBo9N7ced2p7IAuMs1jrC9MZ5+KBtQ0Vg/n456wvLALeI0WYiwEVMykcAx+pmn2K+qZ2oCCn
	VK1aVhFWa6fv4JZupfkqoJLoLmGA8bgU=
X-Gm-Gg: ASbGncv4Zm0lEKAF4gQaQLRdir8zE8ZvsdEa+4G53t4Rj+0cnUP4ZDm3R67G3yn2TYu
	/UuW2kkQd2ySBJ0dBcJHoDAhquCvt8rdVfQkidqSAO6+WzOpXIoGS4OcHTJGtivS4rz/9cDQfa3
	KdpBpbTe4f7utd/znQQmdNSHgyAyo9eEmyDYhOv27pDufzuiYZEDoIeBBgvDZgVB9DBEbRiuuGX
	0WKzKzEfrbyKd3n5p0BNkk=
X-Google-Smtp-Source: AGHT+IE1qLgPZ2JZjML9mfB4gOIrZqCWSfRd0LbOWc+PJ+zRKBIhXbuoNJMp3mTSX/to1tTNSiq+a5JIlxqbwS6zv+k=
X-Received: by 2002:a05:6000:2486:b0:3ed:f690:a390 with SMTP id
 ffacd0b85a97d-3ee8481fdffmr3766244f8f.40.1758306730884; Fri, 19 Sep 2025
 11:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202509171214.912d5ac-lkp@intel.com> <b7d4cf85-5c81-41e0-9b22-baa9a7e5a0c4@suse.cz>
 <ead41e07-c476-4769-aeb6-5a9950737b98@suse.cz> <CAADnVQJYn9=GBZifobKzME-bJgrvbn=OtQJLbU+9xoyO69L8OA@mail.gmail.com>
 <ce3be467-4ff3-4165-a024-d6a3ed33ad0e@suse.cz> <CAJuCfpGLhJtO02V-Y+qmvzOqO2tH5+u7EzrCOA1K-57vPXhb+g@mail.gmail.com>
 <CAADnVQLPq=puz04wNCnUeSUeF2s1SwTUoQvzMWsHCVhjFcyBeg@mail.gmail.com> <CAJuCfpGA_YKuzHu0TM718LFHr92PyyKdD27yJVbtvfF=ZzNOfQ@mail.gmail.com>
In-Reply-To: <CAJuCfpGA_YKuzHu0TM718LFHr92PyyKdD27yJVbtvfF=ZzNOfQ@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 19 Sep 2025 11:31:57 -0700
X-Gm-Features: AS18NWDr8VuH5ucHYn2ibLVBASY5zct8WHDo7Mc0mqgDvlFRZ593jDOgzN6t5y4
Message-ID: <CAADnVQKt5YVKiVHmoB7fZsuMuD=1+bMYvCNcO0+P3+5rq9JXVw@mail.gmail.com>
Subject: Re: [linux-next:master] [slab] db93cdd664: BUG:kernel_NULL_pointer_dereference,address
To: Suren Baghdasaryan <surenb@google.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, kernel test robot <oliver.sang@intel.com>, 
	Alexei Starovoitov <ast@kernel.org>, Harry Yoo <harry.yoo@oracle.com>, oe-lkp@lists.linux.dev, 
	kbuild test robot <lkp@intel.com>, kasan-dev <kasan-dev@googlegroups.com>, 
	"open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 8:01=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Thu, Sep 18, 2025 at 6:39=E2=80=AFPM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Thu, Sep 18, 2025 at 7:49=E2=80=AFAM Suren Baghdasaryan <surenb@goog=
le.com> wrote:
> > >
> > > On Thu, Sep 18, 2025 at 12:06=E2=80=AFAM Vlastimil Babka <vbabka@suse=
.cz> wrote:
> > > >
> > > > On 9/17/25 20:38, Alexei Starovoitov wrote:
> > > > > On Wed, Sep 17, 2025 at 2:18=E2=80=AFAM Vlastimil Babka <vbabka@s=
use.cz> wrote:
> > > > >>
> > > > >> Also I was curious to find out which path is triggered so I've p=
ut a
> > > > >> dump_stack() before the kmalloc_nolock call:
> > > > >>
> > > > >> [    0.731812][    T0] Call Trace:
> > > > >> [    0.732406][    T0]  __dump_stack+0x18/0x30
> > > > >> [    0.733200][    T0]  dump_stack_lvl+0x32/0x90
> > > > >> [    0.734037][    T0]  dump_stack+0xd/0x20
> > > > >> [    0.734780][    T0]  alloc_slab_obj_exts+0x181/0x1f0
> > > > >> [    0.735862][    T0]  __alloc_tagging_slab_alloc_hook+0xd1/0x3=
30
> > > > >> [    0.736988][    T0]  ? __slab_alloc+0x4e/0x70
> > > > >> [    0.737858][    T0]  ? __set_page_owner+0x167/0x280
> > > > >> [    0.738774][    T0]  __kmalloc_cache_noprof+0x379/0x460
> > > > >> [    0.739756][    T0]  ? depot_fetch_stack+0x164/0x180
> > > > >> [    0.740687][    T0]  ? __set_page_owner+0x167/0x280
> > > > >> [    0.741604][    T0]  __set_page_owner+0x167/0x280
> > > > >> [    0.742503][    T0]  post_alloc_hook+0x17a/0x200
> > > > >> [    0.743404][    T0]  get_page_from_freelist+0x13b3/0x16b0
> > > > >> [    0.744427][    T0]  ? kvm_sched_clock_read+0xd/0x20
> > > > >> [    0.745358][    T0]  ? kvm_sched_clock_read+0xd/0x20
> > > > >> [    0.746290][    T0]  ? __next_zones_zonelist+0x26/0x60
> > > > >> [    0.747265][    T0]  __alloc_frozen_pages_noprof+0x143/0x1080
> > > > >> [    0.748358][    T0]  ? lock_acquire+0x8b/0x180
> > > > >> [    0.749209][    T0]  ? pcpu_alloc_noprof+0x181/0x800
> > > > >> [    0.750198][    T0]  ? sched_clock_noinstr+0x8/0x10
> > > > >> [    0.751119][    T0]  ? local_clock_noinstr+0x137/0x140
> > > > >> [    0.752089][    T0]  ? kvm_sched_clock_read+0xd/0x20
> > > > >> [    0.753023][    T0]  alloc_slab_page+0xda/0x150
> > > > >> [    0.753879][    T0]  new_slab+0xe1/0x500
> > > > >> [    0.754615][    T0]  ? kvm_sched_clock_read+0xd/0x20
> > > > >> [    0.755577][    T0]  ___slab_alloc+0xd79/0x1680
> > > > >> [    0.756469][    T0]  ? pcpu_alloc_noprof+0x538/0x800
> > > > >> [    0.757408][    T0]  ? __mutex_unlock_slowpath+0x195/0x3e0
> > > > >> [    0.758446][    T0]  __slab_alloc+0x4e/0x70
> > > > >> [    0.759237][    T0]  ? mm_alloc+0x38/0x80
> > > > >> [    0.759993][    T0]  kmem_cache_alloc_noprof+0x1db/0x470
> > > > >> [    0.760993][    T0]  ? mm_alloc+0x38/0x80
> > > > >> [    0.761745][    T0]  ? mm_alloc+0x38/0x80
> > > > >> [    0.762506][    T0]  mm_alloc+0x38/0x80
> > > > >> [    0.763260][    T0]  poking_init+0xe/0x80
> > > > >> [    0.764032][    T0]  start_kernel+0x16b/0x470
> > > > >> [    0.764858][    T0]  i386_start_kernel+0xce/0xf0
> > > > >> [    0.765723][    T0]  startup_32_smp+0x151/0x160
> > > > >>
> > > > >> And the reason is we still have restricted gfp_allowed_mask at t=
his point:
> > > > >> /* The GFP flags allowed during early boot */
> > > > >> #define GFP_BOOT_MASK (__GFP_BITS_MASK & ~(__GFP_RECLAIM|__GFP_I=
O|__GFP_FS))
> > > > >>
> > > > >> It's only lifted to a full allowed mask later in the boot.
> > > > >
> > > > > Ohh. That's interesting.
> > > > >
> > > > >> That means due to "kmalloc_nolock() is not supported on architec=
tures that
> > > > >> don't implement cmpxchg16b" such architectures will no longer ge=
t objexts
> > > > >> allocated in early boot. I guess that's not a big deal.
> > > > >>
> > > > >> Also any later allocation having its flags screwed for some reas=
on to not
> > > > >> have __GFP_RECLAIM will also lose its objexts. Hope that's also =
acceptable.
> > > > >> I don't know if we can distinguish a real kmalloc_nolock() scope=
 in
> > > > >> alloc_slab_obj_exts() without inventing new gfp flags or passing=
 an extra
> > > > >> argument through several layers of functions.
> > > > >
> > > > > I think it's ok-ish.
> > > > > Can we add a check to alloc_slab_obj_exts() that sets allow_spin=
=3Dtrue
> > > > > if we're in the boot phase? Like:
> > > > > if (gfp_allowed_mask !=3D __GFP_BITS_MASK)
> > > > >    allow_spin =3D true;
> > > > > or some cleaner way to detect boot time by checking slab_state ?
> > > > > bpf is not active during the boot and nothing should be
> > > > > calling kmalloc_nolock.
> > > >
> > > > Checking the gfp_allowed_mask should work. Slab state is already UP=
 so won't
> > > > help, and this is not really about slab state anyway.
> > > > But whether worth it... Suren what do you think?
> > >
> > > Vlastimil's fix is correct. We definitely need __GFP_NO_OBJ_EXT when
> > > allocating an obj_exts vector, otherwise it will try to recursively
> > > allocate an obj_exts vector for obj_exts allocation.
> > >
> > > For the additional __GFP_BITS_MASK check, that sounds good to me as
> > > long as we add a comment on why that is there. Or maybe such a check
> > > deserves to be placed in a separate function similar to
> > > gfpflags_allow_{spinning | blocking}?
> >
> > I would not. I think adding 'boot or not' logic to these two
> > will muddy the waters and will make the whole slab/page_alloc/memcg
> > logic and dependencies between them much harder to follow.
> > I'd either add a comment to alloc_slab_obj_exts() explaining
> > what may happen or add 'boot or not' check only there.
> > imo this is a niche, rare and special.
>
> Ok, comment it is then.
> Will you be sending a new version or Vlastimil will be including that
> in his fixup?

Whichever way. I can, but so far Vlastimil phrasing of comments
were much better than mine :) So I think he can fold what he prefers.
