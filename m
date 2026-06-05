Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8E43C0A05
	for <oe-lkp@lists.linux.dev>; Fri,  5 Jun 2026 09:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780650822; cv=none; b=o02i+tpaTW1HSn3EyVS9zREJPhJrca4032p1uSDFhEbeo6XR95nR8OCu9r6U/P8lPWDyMV4ngXiwPvQ+Ebee5ohNR5yQwd8oggJ1ZUOQW3l3eCHS4RcUsW846UQke+zJXSlV2xQj2J8SevCjSkqD2iBlNZhr15xarLgl6DC8feE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780650822; c=relaxed/simple;
	bh=O3h7DrMReIUd1GOcSLnesMLaKQoj95eCrQC4Lp0Bk9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=gFNcnmpt4lFB1Wwijq7AxxB5L4hQh1FcD+NP2aA5JMGQVjwvLzVEEKxKlp0VeNZme4OMT6r10BgTOWBCRG1UYCjSiidHthJWtiAhgVDiEoL/NW2iwk0Skhg6GEyvxVsRVn4+eWAJNQ2zTEw5U/YGj6ibHjquNQQ35m3BRHKePhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YWKRzuIa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YWKRzuIa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780650819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wkKyj3KoRM9HMEcDXkoEKc1pwGxNTQ5igPedDln3JYg=;
	b=YWKRzuIaW9lanJIeP6h+jcIyJrG2FieLY7o16DFQIkjzLzcJC3DSvt/ANSkX3LKjRnxwLc
	DauoukZUaWS8bR2JaOUMiAKuYOgPvZuhY91hJk1nw68YQKXdTTDfjo2JbbTJaAHqGlu06W
	LTx2McayEmCSB3qv/ZbPhRJy8d9dE3M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-d6f3W-eUO8y7_ZpKm3scKg-1; Fri, 05 Jun 2026 05:13:38 -0400
X-MC-Unique: d6f3W-eUO8y7_ZpKm3scKg-1
X-Mimecast-MFC-AGG-ID: d6f3W-eUO8y7_ZpKm3scKg_1780650817
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-45ef3aeeb41so1167186f8f.1
        for <oe-lkp@lists.linux.dev>; Fri, 05 Jun 2026 02:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780650817; x=1781255617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wkKyj3KoRM9HMEcDXkoEKc1pwGxNTQ5igPedDln3JYg=;
        b=fV32uIeeT524iPafj9T6uxwnraSbWK5LjTVAxCo15Orq5hzh68jCpp2gB7yJ2S04nf
         jTaQTcO6i+ynub5fFUi0BaKnwTar7agD+tJL0jJ/Y78hXqbEtIsWWNvWQ233jcImoUIi
         nTquFsYn5p5ilnDbUkbIb8+iO/8Av6rzVZ40MIMCtcxbtnZhvOAp0ma/YjSbzVuaLFgk
         QKf1YFvUAZMDdK4yYqGc3vvF2ARp02NCSuI0rcFRlu7meNdfYNnB/h1w95nro65ltbe+
         88mgodsq4U6zuvkGhhTETBx8e8sd7c+6gFNpYaYqCjFGaSPrIqH+n+YPjMd9+TMDE36c
         M3tQ==
X-Gm-Message-State: AOJu0YzmGNGC0dr+Cbmog7pdp28GBPQ9eAGr5xgSFu2+MmXr/1ukN84a
	zidUuay39HOifoW53C909vc6jTpPF/nGxy9u087Xc3iDoKh5viKMaNscr/9oZiXoCM924K5OxzI
	Vgl4O8pXJigz0bFae2csoZ8O8k5iCGeL4idSHPdy7/F1sYdQ39qaEN4AHcQ==
X-Gm-Gg: Acq92OHA4ezYgdUDSc9ly8oUfxgq0FVT7nr7PIh0LdXjwN62fgxa0n4zaCD1FL62tBd
	XqBGnIB2R5/HRRfQGJqqywn6Xnd8cpsgB2jsaSqSqT1mLEOGfKQyoveC0ukjOQC2HSRI08TXcP6
	BIlDMnIeT1uueIQRrKLrq0K9AvFYk0vd2bX6I0PiaZMLTPryotgfLEVvT6Z59zuo0E38cZPBiU3
	/28E+jYYTuitRU+jMMsCIIx5QhyCYgjEaPP3+Xk/S36Zo2eQjhjGmHoU09+6wPaIOdNp7MmpRXL
	gNWgQBMBChMJ4TljQtU1nUvjhaU9pQs7o5p/Qz5/Qd4K5mMe54ZwDGw6wSqJ42fGewlOPTRU+tq
	qwEsdezUz1XRl1Xu2P1mvq5MkQeJJslcb4t6XMkwy5mvQDnb7YFt/keQ=
X-Received: by 2002:adf:f290:0:b0:45f:f142:d569 with SMTP id ffacd0b85a97d-46030505eddmr3383875f8f.15.1780650816685;
        Fri, 05 Jun 2026 02:13:36 -0700 (PDT)
X-Received: by 2002:adf:f290:0:b0:45f:f142:d569 with SMTP id ffacd0b85a97d-46030505eddmr3383825f8f.15.1780650816107;
        Fri, 05 Jun 2026 02:13:36 -0700 (PDT)
Received: from redhat.com (ppp-94-66-118-61.home.otenet.gr. [94.66.118.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dce6sm15969430f8f.30.2026.06.05.02.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 02:13:35 -0700 (PDT)
Date: Fri, 5 Jun 2026 05:13:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-mm@kvack.org
Subject: Re: [linux-next:master] [mm]  504f40f6bd:
 kernel_BUG_at_include/linux/page-flags.h
Message-ID: <20260605050955-mutt-send-email-mst@kernel.org>
References: <202606051117.7b999010-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202606051117.7b999010-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4MPubCbjifZ2sGVpWX3Bu35p14KeN6t-ZUV7ltzA6hc_1780650817
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 05, 2026 at 01:40:41PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "kernel_BUG_at_include/linux/page-flags.h" on:
> 
> commit: 504f40f6bda6afb3c5dc9924f74c583b6e394554 ("mm: page_reporting: skip redundant zeroing of host-zeroed reported pages")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master a225caacc36546a09586e3ece36c0313146e7da9]
> 
> in testcase: boot
> 
> config: i386-randconfig-002-20251019
> compiler: gcc-14
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 

Gift that keeps giving. Same thing - I pushed a wrong branch to next :( Sorry.
Made it a separate remote now so these pushes are intentional.
Donnu why I didn't think of that earlier.

> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202606051117.7b999010-lkp@intel.com
> 
> 
> 
> [    0.218502][    T0] ------------[ cut here ]------------
> [    0.219180][    T0] kernel BUG at include/linux/page-flags.h:688!
> [    0.219979][    T0] Oops: invalid opcode: 0000 [#1]
> [    0.220604][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 7.0.0-rc2-00009-g504f40f6bda6 #1 PREEMPTLAZY  25f758a7ca9ac6ee8258fdb39cd5b7566f523e33
> [    0.222356][    T0] EIP: post_alloc_hook (linux/page-flags.h:688 (discriminator 1) page_alloc.c:1868 (discriminator 1))
> [    0.222995][    T0] Code: 83 7d f0 1f 0f 87 10 01 00 00 83 c4 10 5b 5e 5f 5d 31 c0 31 d2 31 c9 c3 8d b6 00 00 00 00 ba 44 7a 3c 9d 89 f0 e8 f4 31 fc ff <0f> 0b b8 14 5e a0 9d e8 90 53 cb ff 2e 8d b4 26 00 00 00 00 8b 45
> All code
> ========
>    0:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%rbp)
>    4:	0f 87 10 01 00 00    	ja     0x11a
>    a:	83 c4 10             	add    $0x10,%esp
>    d:	5b                   	pop    %rbx
>    e:	5e                   	pop    %rsi
>    f:	5f                   	pop    %rdi
>   10:	5d                   	pop    %rbp
>   11:	31 c0                	xor    %eax,%eax
>   13:	31 d2                	xor    %edx,%edx
>   15:	31 c9                	xor    %ecx,%ecx
>   17:	c3                   	ret
>   18:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
>   1e:	ba 44 7a 3c 9d       	mov    $0x9d3c7a44,%edx
>   23:	89 f0                	mov    %esi,%eax
>   25:	e8 f4 31 fc ff       	call   0xfffffffffffc321e
>   2a:*	0f 0b                	ud2		<-- trapping instruction
>   2c:	b8 14 5e a0 9d       	mov    $0x9da05e14,%eax
>   31:	e8 90 53 cb ff       	call   0xffffffffffcb53c6
>   36:	2e 8d b4 26 00 00 00 	cs lea 0x0(%rsi,%riz,1),%esi
>   3d:	00 
>   3e:	8b                   	.byte 0x8b
>   3f:	45                   	rex.RB
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	0f 0b                	ud2
>    2:	b8 14 5e a0 9d       	mov    $0x9da05e14,%eax
>    7:	e8 90 53 cb ff       	call   0xffffffffffcb539c
>    c:	2e 8d b4 26 00 00 00 	cs lea 0x0(%rsi,%riz,1),%esi
>   13:	00 
>   14:	8b                   	.byte 0x8b
>   15:	45                   	rex.RB
> [    0.225477][    T0] EAX: 00000000 EBX: 00000000 ECX: 00000000 EDX: 00000000
> [    0.226363][    T0] ESI: f4102340 EDI: 9dc37ba0 EBP: 9d633e20 ESP: 9d633e04
> [    0.227277][    T0] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00210046
> [    0.228243][    T0] CR0: 80050033 CR2: ffd99000 CR3: 1dd74000 CR4: 00000090
> [    0.229132][    T0] Call Trace:
> [    0.229534][    T0]  get_page_from_freelist (page_alloc.c:1938 page_alloc.c:4006)
> [    0.230201][    T0]  ? __this_cpu_preempt_check (smp_processor_id.c:64)
> [    0.230883][    T0]  __alloc_frozen_pages_noprof (page_alloc.c:5297)
> [    0.231617][    T0]  allocate_slab (slub.c:3269 (discriminator 2) slub.c:3458 (discriminator 2))
> [    0.232174][    T0]  refill_objects (slub.c:3516 slub.c:7153)
> [    0.232743][    T0]  __pcs_replace_empty_main (slub.c:2818 slub.c:2839 slub.c:4602)
> [    0.233433][    T0]  ? mm_alloc (fork.c:1157 (discriminator 2))
> [    0.233945][    T0]  kmem_cache_alloc_noprof (slub.c:4695 slub.c:4829 slub.c:4851)
> [    0.234624][    T0]  ? kmem_cache_alloc_noprof (slub.c:4689 (discriminator 2) slub.c:4829 (discriminator 2) slub.c:4851 (discriminator 2))
> [    0.235315][    T0]  mm_alloc (fork.c:1157 (discriminator 2))
> [    0.235814][    T0]  poking_init (x86/mm/init.c:824)
> [    0.236341][    T0]  start_kernel (main.c:1072)
> [    0.237088][    T0]  i386_start_kernel (x86/kernel/head32.c:79)
> [    0.237969][    T0]  startup_32_smp (x86/kernel/head_32.S:292)
> [    0.238817][    T0] Modules linked in:
> [    0.239561][    T0] ---[ end trace 0000000000000000 ]---
> [    0.240564][    T0] EIP: post_alloc_hook (linux/page-flags.h:688 (discriminator 1) page_alloc.c:1868 (discriminator 1))
> [    0.241521][    T0] Code: 83 7d f0 1f 0f 87 10 01 00 00 83 c4 10 5b 5e 5f 5d 31 c0 31 d2 31 c9 c3 8d b6 00 00 00 00 ba 44 7a 3c 9d 89 f0 e8 f4 31 fc ff <0f> 0b b8 14 5e a0 9d e8 90 53 cb ff 2e 8d b4 26 00 00 00 00 8b 45
> All code
> ========
>    0:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%rbp)
>    4:	0f 87 10 01 00 00    	ja     0x11a
>    a:	83 c4 10             	add    $0x10,%esp
>    d:	5b                   	pop    %rbx
>    e:	5e                   	pop    %rsi
>    f:	5f                   	pop    %rdi
>   10:	5d                   	pop    %rbp
>   11:	31 c0                	xor    %eax,%eax
>   13:	31 d2                	xor    %edx,%edx
>   15:	31 c9                	xor    %ecx,%ecx
>   17:	c3                   	ret
>   18:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
>   1e:	ba 44 7a 3c 9d       	mov    $0x9d3c7a44,%edx
>   23:	89 f0                	mov    %esi,%eax
>   25:	e8 f4 31 fc ff       	call   0xfffffffffffc321e
>   2a:*	0f 0b                	ud2		<-- trapping instruction
>   2c:	b8 14 5e a0 9d       	mov    $0x9da05e14,%eax
>   31:	e8 90 53 cb ff       	call   0xffffffffffcb53c6
>   36:	2e 8d b4 26 00 00 00 	cs lea 0x0(%rsi,%riz,1),%esi
>   3d:	00 
>   3e:	8b                   	.byte 0x8b
>   3f:	45                   	rex.RB
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	0f 0b                	ud2
>    2:	b8 14 5e a0 9d       	mov    $0x9da05e14,%eax
>    7:	e8 90 53 cb ff       	call   0xffffffffffcb539c
>    c:	2e 8d b4 26 00 00 00 	cs lea 0x0(%rsi,%riz,1),%esi
>   13:	00 
>   14:	8b                   	.byte 0x8b
>   15:	45                   	rex.RB
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20260605/202606051117.7b999010-lkp@intel.com
> 
> 
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

