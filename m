Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E7523AE87
	for <oe-lkp@lists.linux.dev>; Thu, 18 Sep 2025 14:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758206979; cv=none; b=raeZ5joNFWg2Wa8mBjDskxASbfPy/P5V0u8Pbr6LreIRIC9Eto8CEzF5btlzsgzb38Ag5BINx4uwjXRFNLTzfSwCNjNjutBqI70xPz7FuIK4xEZL1F9/rXCTLYtsXh5SJr+abDT4/lRWK7+4gNFmaO9IK13n3VZSlnaxDghPQGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758206979; c=relaxed/simple;
	bh=Kw53kHV1BjyENRHV+GQJ/8Wjc+aS2VDnrsaaxvM9sEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VM9enubQeT9PsTiYqGExCm06KsnTqiWnzQz4WlS0W97OoNLdtw7X4ZqTdav+WphbXc2E8Ld/RqSlN6kd2rV2tOg9+tarI7wLJLjZ2YqmYT6rYaMLcwjtnSqatcdbZ9gLXV4oMswUPJBAIgPHHJG+D9A3pQO1jfmc7TTuCJNTBpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YQBcCH+m; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YQBcCH+m"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4b4bcb9638aso434541cf.0
        for <oe-lkp@lists.linux.dev>; Thu, 18 Sep 2025 07:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758206977; x=1758811777; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvgqQMIRazqhTNds4nMPQal7ZSlIJweSzO/oPA+Hs2c=;
        b=YQBcCH+mQYVpIS4D4U85ARAtsLAIjxF5q/D7IyeloeY28dXSuqmK8BZz4NgX3LdGE1
         EmqbxOMQ0DLH4D98QIB1M3IFpOJ4xvyRxqM7HAtotQN7YJjQNdp1JU8AtoxCOEq/4JGh
         7PcL+VBe4L8ia9+XqDfGKOxsCuJnztX5tvc9zJtwCKxj1enyAQdGL6NQXF5cTVkqDxGe
         I67NLSk7sAHPP9VWIQQcedpda1Od4vqdxX2/J5tk1foh5Q/THYC7WTG1CzcI50WBk93t
         LDLDCw1971FCJprgYmcsxq0536nMk6kPngbaPNGyE/7GENuM2USWfOpQHdHANW7sK3Pt
         mACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758206977; x=1758811777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KvgqQMIRazqhTNds4nMPQal7ZSlIJweSzO/oPA+Hs2c=;
        b=OZyewzDsxIcUrybZ07TAq8UCiDiXJC3AKZ/oLAsqXhHo6XGbRyTp+LbrhyWh2QAZEl
         /O0JYJD0ewZdphIfJgLRpDpEP6lZXXGYnbfzcZJmv8ihdNTUd0uKHFIhuq57cCqaGo/U
         yps3imFl3txKYvAedObWXQMg4NhPe+0BptZfSTs9sCSxqnSrmogLa6myUQFobAm6TVIl
         lV3C8bTCOMkCBTgTRQGhifkBcPA5Tz3KJgQJL/yKaK61AFIndXmodUTqZ8vRlaTyVWbX
         7hcVb7HYYjLLEEiDtSY+3TbsddFkXBX4+VoYlRvV3W+Jfrytf13QMj5T4IxN1VkyKNJm
         X9Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWhgFkVQ5cCIuRBEC/YnnUpaIGR9Eiox1J4A9VAYbROoUMuC8Ch/DzvjsoMgi/aJyShERbl+Q8=@lists.linux.dev
X-Gm-Message-State: AOJu0YySnEEvfKpkQE0NJNkWHliU4GBjh+G9Gk3M3P/ggAXcTubMqj9g
	sK+zf9TYH2/PenjD6ZoX+UZwPvvwV2XyagooQmGx45R5OjI1dMuVPrTZ8eM3BxHbYwGdBDnOpNR
	VZhhgaNSSiv9a/8rgUT+xrm2Y70J2BMYM+3HMpUzq
X-Gm-Gg: ASbGncsW+ud4Hz9zPXtkObhjPFw3NFo7fh8pw6Jt0CA/KwKABou80Fra4H9wwUwCZSs
	W3ubhSux9x8Z9/dcgH7UDPQatxi1cxiQWuMYMZ6qz8F3flZ3VxeRNUgdl0FywvULBiPBQaAlwQg
	IxEleyx+kz+SYiVDcW668MFUfxe5FCSFpx1PGWqT+Q/P6H0BvfMA12W7U9yEvEWfV2MXROJd/PL
	7UANHddZy18eamMNATMXRe2TQFNX1DPMfLNRNLF4/cH7DmsXdzo+JZlIb3RGSI=
X-Google-Smtp-Source: AGHT+IE3vt5RgQAoZi6woEVABoOhvcwZJraj4zZpjNZVZ8uWgSgQ2w/k0DQPdvldDL/0AUskfnLbq+byz8vkiHdvA2A=
X-Received: by 2002:a05:622a:118c:b0:4b3:50ee:579e with SMTP id
 d75a77b69052e-4ba2dbd8d7amr13425281cf.11.1758206976508; Thu, 18 Sep 2025
 07:49:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202509171214.912d5ac-lkp@intel.com> <b7d4cf85-5c81-41e0-9b22-baa9a7e5a0c4@suse.cz>
 <ead41e07-c476-4769-aeb6-5a9950737b98@suse.cz> <CAADnVQJYn9=GBZifobKzME-bJgrvbn=OtQJLbU+9xoyO69L8OA@mail.gmail.com>
 <ce3be467-4ff3-4165-a024-d6a3ed33ad0e@suse.cz>
In-Reply-To: <ce3be467-4ff3-4165-a024-d6a3ed33ad0e@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 18 Sep 2025 07:49:25 -0700
X-Gm-Features: AS18NWBKqEKLWVuQ980Fh7DdopBdRtw6yIZtBXo-Y59z15HRkGH_vRxj6TN4pFk
Message-ID: <CAJuCfpGLhJtO02V-Y+qmvzOqO2tH5+u7EzrCOA1K-57vPXhb+g@mail.gmail.com>
Subject: Re: [linux-next:master] [slab] db93cdd664: BUG:kernel_NULL_pointer_dereference,address
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, kernel test robot <oliver.sang@intel.com>, 
	Alexei Starovoitov <ast@kernel.org>, Harry Yoo <harry.yoo@oracle.com>, oe-lkp@lists.linux.dev, 
	kbuild test robot <lkp@intel.com>, kasan-dev <kasan-dev@googlegroups.com>, 
	"open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 12:06=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> w=
rote:
>
> On 9/17/25 20:38, Alexei Starovoitov wrote:
> > On Wed, Sep 17, 2025 at 2:18=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz=
> wrote:
> >>
> >> Also I was curious to find out which path is triggered so I've put a
> >> dump_stack() before the kmalloc_nolock call:
> >>
> >> [    0.731812][    T0] Call Trace:
> >> [    0.732406][    T0]  __dump_stack+0x18/0x30
> >> [    0.733200][    T0]  dump_stack_lvl+0x32/0x90
> >> [    0.734037][    T0]  dump_stack+0xd/0x20
> >> [    0.734780][    T0]  alloc_slab_obj_exts+0x181/0x1f0
> >> [    0.735862][    T0]  __alloc_tagging_slab_alloc_hook+0xd1/0x330
> >> [    0.736988][    T0]  ? __slab_alloc+0x4e/0x70
> >> [    0.737858][    T0]  ? __set_page_owner+0x167/0x280
> >> [    0.738774][    T0]  __kmalloc_cache_noprof+0x379/0x460
> >> [    0.739756][    T0]  ? depot_fetch_stack+0x164/0x180
> >> [    0.740687][    T0]  ? __set_page_owner+0x167/0x280
> >> [    0.741604][    T0]  __set_page_owner+0x167/0x280
> >> [    0.742503][    T0]  post_alloc_hook+0x17a/0x200
> >> [    0.743404][    T0]  get_page_from_freelist+0x13b3/0x16b0
> >> [    0.744427][    T0]  ? kvm_sched_clock_read+0xd/0x20
> >> [    0.745358][    T0]  ? kvm_sched_clock_read+0xd/0x20
> >> [    0.746290][    T0]  ? __next_zones_zonelist+0x26/0x60
> >> [    0.747265][    T0]  __alloc_frozen_pages_noprof+0x143/0x1080
> >> [    0.748358][    T0]  ? lock_acquire+0x8b/0x180
> >> [    0.749209][    T0]  ? pcpu_alloc_noprof+0x181/0x800
> >> [    0.750198][    T0]  ? sched_clock_noinstr+0x8/0x10
> >> [    0.751119][    T0]  ? local_clock_noinstr+0x137/0x140
> >> [    0.752089][    T0]  ? kvm_sched_clock_read+0xd/0x20
> >> [    0.753023][    T0]  alloc_slab_page+0xda/0x150
> >> [    0.753879][    T0]  new_slab+0xe1/0x500
> >> [    0.754615][    T0]  ? kvm_sched_clock_read+0xd/0x20
> >> [    0.755577][    T0]  ___slab_alloc+0xd79/0x1680
> >> [    0.756469][    T0]  ? pcpu_alloc_noprof+0x538/0x800
> >> [    0.757408][    T0]  ? __mutex_unlock_slowpath+0x195/0x3e0
> >> [    0.758446][    T0]  __slab_alloc+0x4e/0x70
> >> [    0.759237][    T0]  ? mm_alloc+0x38/0x80
> >> [    0.759993][    T0]  kmem_cache_alloc_noprof+0x1db/0x470
> >> [    0.760993][    T0]  ? mm_alloc+0x38/0x80
> >> [    0.761745][    T0]  ? mm_alloc+0x38/0x80
> >> [    0.762506][    T0]  mm_alloc+0x38/0x80
> >> [    0.763260][    T0]  poking_init+0xe/0x80
> >> [    0.764032][    T0]  start_kernel+0x16b/0x470
> >> [    0.764858][    T0]  i386_start_kernel+0xce/0xf0
> >> [    0.765723][    T0]  startup_32_smp+0x151/0x160
> >>
> >> And the reason is we still have restricted gfp_allowed_mask at this po=
int:
> >> /* The GFP flags allowed during early boot */
> >> #define GFP_BOOT_MASK (__GFP_BITS_MASK & ~(__GFP_RECLAIM|__GFP_IO|__GF=
P_FS))
> >>
> >> It's only lifted to a full allowed mask later in the boot.
> >
> > Ohh. That's interesting.
> >
> >> That means due to "kmalloc_nolock() is not supported on architectures =
that
> >> don't implement cmpxchg16b" such architectures will no longer get obje=
xts
> >> allocated in early boot. I guess that's not a big deal.
> >>
> >> Also any later allocation having its flags screwed for some reason to =
not
> >> have __GFP_RECLAIM will also lose its objexts. Hope that's also accept=
able.
> >> I don't know if we can distinguish a real kmalloc_nolock() scope in
> >> alloc_slab_obj_exts() without inventing new gfp flags or passing an ex=
tra
> >> argument through several layers of functions.
> >
> > I think it's ok-ish.
> > Can we add a check to alloc_slab_obj_exts() that sets allow_spin=3Dtrue
> > if we're in the boot phase? Like:
> > if (gfp_allowed_mask !=3D __GFP_BITS_MASK)
> >    allow_spin =3D true;
> > or some cleaner way to detect boot time by checking slab_state ?
> > bpf is not active during the boot and nothing should be
> > calling kmalloc_nolock.
>
> Checking the gfp_allowed_mask should work. Slab state is already UP so wo=
n't
> help, and this is not really about slab state anyway.
> But whether worth it... Suren what do you think?

Vlastimil's fix is correct. We definitely need __GFP_NO_OBJ_EXT when
allocating an obj_exts vector, otherwise it will try to recursively
allocate an obj_exts vector for obj_exts allocation.

For the additional __GFP_BITS_MASK check, that sounds good to me as
long as we add a comment on why that is there. Or maybe such a check
deserves to be placed in a separate function similar to
gfpflags_allow_{spinning | blocking}?
