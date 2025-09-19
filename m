Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ACA313293
	for <oe-lkp@lists.linux.dev>; Fri, 19 Sep 2025 15:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758294111; cv=none; b=qp1Y3Q8ntNdVvnfti9giIDP4f8nG0pf9IOTXjj2ZaylEq7if5Nu3PRW9uWQ+qwS1QW4J2EMb5wFPfpXrlcoQB38xmrWiSHJe+njC/yYrlgRQY3zMSUzgCSIsgYYXLUXUW1uW81Et6Cvi6qD5MGDySEelTc9rcgOPQmjSWXIfxzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758294111; c=relaxed/simple;
	bh=wi4ES0kK1PeTlxSFJk6bhN7E9AN+deonxTtypWb1ZEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cgk3F6VI+a4o1+NKxX6HW0zNKnX03haDrsPdHzQKr4yrt1qNqERzp819j1JHgSPM86/oOd8sWlLR9NqRePqjl+ukFj0fym4gQvV48f0b7Lz8yLGqQ3cKrQm3JocSZXzI4louhflw92l1KUHX+3lSmBGOm3QQ39TPQITYR6Bxbdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1NoHtSt9; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1NoHtSt9"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4b4bcb9638aso424501cf.0
        for <oe-lkp@lists.linux.dev>; Fri, 19 Sep 2025 08:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758294108; x=1758898908; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xd49/q/5YBCJxAFGP/L8ktabS8R9TywHti0W/ntbZ14=;
        b=1NoHtSt90LjOPdFQtzI758VOki2rqZx0zRZZs7QBEeofK3YAo39eX/tJuOoXENLPHR
         ewmXEj6Ya6kAnbKupL70Rl2+BQzEz28Fy2n1Gj+ycS18dbnL91MUTUSfj+6XMzrXhKwD
         fqy/CVu6GazFBLTGGSgMyczPs18t28AvqZsoXLUuj0+wm4bDBVQsJeDyK1nBvuZ71ind
         u2sRfj6iOnHdTi8i+P06dwVp9NOjfp5eI3aOx4Gp8PpRVBt1YjGPU6bjipsZjA9muRCK
         Jw8qDniIDBYQ2VZvr1++2mikPe9Bw3rpp4RRE9MNkQgATmJtfHhZPbSjfQbbdZhZGf1G
         PQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758294108; x=1758898908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xd49/q/5YBCJxAFGP/L8ktabS8R9TywHti0W/ntbZ14=;
        b=Hd6okZLW3pBOF0Soa35ISUrbRitpx93vhiyiWPXtELfoxyQUgeMTRsb8GhOtGFJd4V
         OaOH2s8uFhgtakBD4k1p6kn9mOh7IrrChzZtvPfObCJ4k7PrF0z62kGQdzzAN2EQ6D/w
         Ad13fcmaEe/ScttoGnaAINWKAMY8rTIP33oBLhkTW++ULyFIiNFkAZJwqjMpMJxpgS+L
         SBZyPLSUHcRMxbkTtjkd4lgNMgu5nfbhCvx3c/JwSWfTM5dZhL5yRZI1K2PupJS9DSP5
         jf5OA07WwfOj4afbJ7IJjqNxPgF3OsW9yn6hPQYHprGwJWPF9higwrGcKx4W1oAcxvXu
         3PgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQDLbF64RZiQykDXhLjGqzH0SGWoK6hXNQD3UY7yR/Ylr8cDljMwcHd0DjPnTwXy8fuX1sqtY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDI/1nq6CU+iKo1wQHnfyfw17F9mD/P4w6mMiRzXvXrotjEoQ/
	RWnIsLx4r5v7xW3DvWpeOLfObDAv/4td7hF1BMPj9/NtytD9N0fO2vw1nsxx3oiWtlAymOhuWGJ
	+YssNy1AAkgI9833XO/hvUTOep+20YWzBoIekLF6J
X-Gm-Gg: ASbGncvpYPTLdydE/kWCmZsN67g9/OfLW1ZLdJsenWfvdU/vzygVf4oNfZ2/VdyVAoT
	DsIqLAkOH+OC5odhI6lXD/d+U9q92M6Su8YdRUXBaJKxG6Gy+6m7zhG+jwvBneRrl/a7zToW6ze
	ZZ4DLrPMdnnWx6zRYbuwPfyZ1/ppSzTyYEH3wBXeu4JHloq6OOndN1lzLKHQyOghFEkD2pryILK
	d5L0w==
X-Google-Smtp-Source: AGHT+IHQKWY6HNPV+dUIZl6mPbASDwCVYU/qUliIO+mvEsbanwTZHZDc0ajD82tEvxz5DM4rad1N9lGhmUa33cuVXW8=
X-Received: by 2002:ac8:5f84:0:b0:4b7:94d7:8b4c with SMTP id
 d75a77b69052e-4b9d33b6432mr19618551cf.0.1758294107407; Fri, 19 Sep 2025
 08:01:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202509171214.912d5ac-lkp@intel.com> <b7d4cf85-5c81-41e0-9b22-baa9a7e5a0c4@suse.cz>
 <ead41e07-c476-4769-aeb6-5a9950737b98@suse.cz> <CAADnVQJYn9=GBZifobKzME-bJgrvbn=OtQJLbU+9xoyO69L8OA@mail.gmail.com>
 <ce3be467-4ff3-4165-a024-d6a3ed33ad0e@suse.cz> <CAJuCfpGLhJtO02V-Y+qmvzOqO2tH5+u7EzrCOA1K-57vPXhb+g@mail.gmail.com>
 <CAADnVQLPq=puz04wNCnUeSUeF2s1SwTUoQvzMWsHCVhjFcyBeg@mail.gmail.com>
In-Reply-To: <CAADnVQLPq=puz04wNCnUeSUeF2s1SwTUoQvzMWsHCVhjFcyBeg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 19 Sep 2025 08:01:36 -0700
X-Gm-Features: AS18NWD12crNOmM4aEy96ofaHX5zWtBB8_S_SE5RNjFC2qJWezk2NctkV6nki6A
Message-ID: <CAJuCfpGA_YKuzHu0TM718LFHr92PyyKdD27yJVbtvfF=ZzNOfQ@mail.gmail.com>
Subject: Re: [linux-next:master] [slab] db93cdd664: BUG:kernel_NULL_pointer_dereference,address
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, kernel test robot <oliver.sang@intel.com>, 
	Alexei Starovoitov <ast@kernel.org>, Harry Yoo <harry.yoo@oracle.com>, oe-lkp@lists.linux.dev, 
	kbuild test robot <lkp@intel.com>, kasan-dev <kasan-dev@googlegroups.com>, 
	"open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 6:39=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Thu, Sep 18, 2025 at 7:49=E2=80=AFAM Suren Baghdasaryan <surenb@google=
.com> wrote:
> >
> > On Thu, Sep 18, 2025 at 12:06=E2=80=AFAM Vlastimil Babka <vbabka@suse.c=
z> wrote:
> > >
> > > On 9/17/25 20:38, Alexei Starovoitov wrote:
> > > > On Wed, Sep 17, 2025 at 2:18=E2=80=AFAM Vlastimil Babka <vbabka@sus=
e.cz> wrote:
> > > >>
> > > >> Also I was curious to find out which path is triggered so I've put=
 a
> > > >> dump_stack() before the kmalloc_nolock call:
> > > >>
> > > >> [    0.731812][    T0] Call Trace:
> > > >> [    0.732406][    T0]  __dump_stack+0x18/0x30
> > > >> [    0.733200][    T0]  dump_stack_lvl+0x32/0x90
> > > >> [    0.734037][    T0]  dump_stack+0xd/0x20
> > > >> [    0.734780][    T0]  alloc_slab_obj_exts+0x181/0x1f0
> > > >> [    0.735862][    T0]  __alloc_tagging_slab_alloc_hook+0xd1/0x330
> > > >> [    0.736988][    T0]  ? __slab_alloc+0x4e/0x70
> > > >> [    0.737858][    T0]  ? __set_page_owner+0x167/0x280
> > > >> [    0.738774][    T0]  __kmalloc_cache_noprof+0x379/0x460
> > > >> [    0.739756][    T0]  ? depot_fetch_stack+0x164/0x180
> > > >> [    0.740687][    T0]  ? __set_page_owner+0x167/0x280
> > > >> [    0.741604][    T0]  __set_page_owner+0x167/0x280
> > > >> [    0.742503][    T0]  post_alloc_hook+0x17a/0x200
> > > >> [    0.743404][    T0]  get_page_from_freelist+0x13b3/0x16b0
> > > >> [    0.744427][    T0]  ? kvm_sched_clock_read+0xd/0x20
> > > >> [    0.745358][    T0]  ? kvm_sched_clock_read+0xd/0x20
> > > >> [    0.746290][    T0]  ? __next_zones_zonelist+0x26/0x60
> > > >> [    0.747265][    T0]  __alloc_frozen_pages_noprof+0x143/0x1080
> > > >> [    0.748358][    T0]  ? lock_acquire+0x8b/0x180
> > > >> [    0.749209][    T0]  ? pcpu_alloc_noprof+0x181/0x800
> > > >> [    0.750198][    T0]  ? sched_clock_noinstr+0x8/0x10
> > > >> [    0.751119][    T0]  ? local_clock_noinstr+0x137/0x140
> > > >> [    0.752089][    T0]  ? kvm_sched_clock_read+0xd/0x20
> > > >> [    0.753023][    T0]  alloc_slab_page+0xda/0x150
> > > >> [    0.753879][    T0]  new_slab+0xe1/0x500
> > > >> [    0.754615][    T0]  ? kvm_sched_clock_read+0xd/0x20
> > > >> [    0.755577][    T0]  ___slab_alloc+0xd79/0x1680
> > > >> [    0.756469][    T0]  ? pcpu_alloc_noprof+0x538/0x800
> > > >> [    0.757408][    T0]  ? __mutex_unlock_slowpath+0x195/0x3e0
> > > >> [    0.758446][    T0]  __slab_alloc+0x4e/0x70
> > > >> [    0.759237][    T0]  ? mm_alloc+0x38/0x80
> > > >> [    0.759993][    T0]  kmem_cache_alloc_noprof+0x1db/0x470
> > > >> [    0.760993][    T0]  ? mm_alloc+0x38/0x80
> > > >> [    0.761745][    T0]  ? mm_alloc+0x38/0x80
> > > >> [    0.762506][    T0]  mm_alloc+0x38/0x80
> > > >> [    0.763260][    T0]  poking_init+0xe/0x80
> > > >> [    0.764032][    T0]  start_kernel+0x16b/0x470
> > > >> [    0.764858][    T0]  i386_start_kernel+0xce/0xf0
> > > >> [    0.765723][    T0]  startup_32_smp+0x151/0x160
> > > >>
> > > >> And the reason is we still have restricted gfp_allowed_mask at thi=
s point:
> > > >> /* The GFP flags allowed during early boot */
> > > >> #define GFP_BOOT_MASK (__GFP_BITS_MASK & ~(__GFP_RECLAIM|__GFP_IO|=
__GFP_FS))
> > > >>
> > > >> It's only lifted to a full allowed mask later in the boot.
> > > >
> > > > Ohh. That's interesting.
> > > >
> > > >> That means due to "kmalloc_nolock() is not supported on architectu=
res that
> > > >> don't implement cmpxchg16b" such architectures will no longer get =
objexts
> > > >> allocated in early boot. I guess that's not a big deal.
> > > >>
> > > >> Also any later allocation having its flags screwed for some reason=
 to not
> > > >> have __GFP_RECLAIM will also lose its objexts. Hope that's also ac=
ceptable.
> > > >> I don't know if we can distinguish a real kmalloc_nolock() scope i=
n
> > > >> alloc_slab_obj_exts() without inventing new gfp flags or passing a=
n extra
> > > >> argument through several layers of functions.
> > > >
> > > > I think it's ok-ish.
> > > > Can we add a check to alloc_slab_obj_exts() that sets allow_spin=3D=
true
> > > > if we're in the boot phase? Like:
> > > > if (gfp_allowed_mask !=3D __GFP_BITS_MASK)
> > > >    allow_spin =3D true;
> > > > or some cleaner way to detect boot time by checking slab_state ?
> > > > bpf is not active during the boot and nothing should be
> > > > calling kmalloc_nolock.
> > >
> > > Checking the gfp_allowed_mask should work. Slab state is already UP s=
o won't
> > > help, and this is not really about slab state anyway.
> > > But whether worth it... Suren what do you think?
> >
> > Vlastimil's fix is correct. We definitely need __GFP_NO_OBJ_EXT when
> > allocating an obj_exts vector, otherwise it will try to recursively
> > allocate an obj_exts vector for obj_exts allocation.
> >
> > For the additional __GFP_BITS_MASK check, that sounds good to me as
> > long as we add a comment on why that is there. Or maybe such a check
> > deserves to be placed in a separate function similar to
> > gfpflags_allow_{spinning | blocking}?
>
> I would not. I think adding 'boot or not' logic to these two
> will muddy the waters and will make the whole slab/page_alloc/memcg
> logic and dependencies between them much harder to follow.
> I'd either add a comment to alloc_slab_obj_exts() explaining
> what may happen or add 'boot or not' check only there.
> imo this is a niche, rare and special.

Ok, comment it is then.
Will you be sending a new version or Vlastimil will be including that
in his fixup?
