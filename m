Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355C62D47E3
	for <oe-lkp@lists.linux.dev>; Thu, 11 Dec 2025 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765447790; cv=none; b=THQ65bWcf4WcN+qQV6wlnWHflp6MLRm2ev4GlHjN26wOX1WktlYh7dHXq+dIaJYTOPu3R1eZXrpkFDkTIlZ1hI08ELasmiTqMbNdubQyRLtMcakZHb+/h0mq4MPHKlD8lR5azDh/1esx5VCJq91ZtBpMdR/dqa+WFURE/ISfEh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765447790; c=relaxed/simple;
	bh=TonLtsi/eLW4EccWrEbsKkNIaaa86XV9coUZlEouxbo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sOEgyk6GpjbsbWExVk1cXRPXpMvO1AkJnrEdM27LrSbjuw7ZyVfNJqbH1FpWjvNFxD0WkqvTNHjwG+/RXwnB1IT7/Xbz1JOhaB/QlIpGphWL6u0CZ5WP+oN/aTnlwR2PdD0iW4Cirp+OR+9dsKTONiMOEsIi9SQvNW//YH1P+XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdla2wwx; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdla2wwx"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37b935df7bfso7256841fa.2
        for <oe-lkp@lists.linux.dev>; Thu, 11 Dec 2025 02:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765447786; x=1766052586; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1VYdT8hGFnnriukr/ws8dpb4JnnXunRZTQ/JzgeztOI=;
        b=kdla2wwxdPISguEgveZCTU3VfijLXcYKtfU57wa3JuFYQ1pDsGdxCpQsCUeqHiam+H
         rZxNeqQDQANOClLnHWZfvl8be+VLvMaaKDM3Uz8F7w5CCu55mGc6am72UDG7HaYmq/XT
         2tvES84ks+3mXpIxz/gCnGKE2Jj9aRk8LrH3P8ISgRks57j0W4G6u5sNzlKW7ucnzv94
         SYPUYsB3EQkPV/vlnItrsz0hr1fK6gBzXZYCzNtj9YF1qlhvUXOYjI6Rf5YwhPCRgDjt
         Q48ZJuHxP6e9kWbSeYrLguJlEHNyoLnG68anTrNxz1i3ebjALeShybVWW2O2k7NwdhE4
         M2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765447786; x=1766052586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VYdT8hGFnnriukr/ws8dpb4JnnXunRZTQ/JzgeztOI=;
        b=hM2CEtQOwEAKoHg064aiXceoH/yghOACk1II8l6p20eiqDDHsKvLACFhP2DLfDvJBn
         Bh0T3z1Kc+Yndj6zU7mex8EKIgvXt7Ed8Jm1er8A7ghPVVWAVY0eQFKMk3ZTGO15b+ow
         ciOlPjvcLR+hRiGZyjSJYb4DhnZg/M0fK9Qm7svslF9n0NifV2uJ5WykyL/XRdSnhgU7
         XjTFo9XkeWgaYV1Lj+6MKe1a35BYLicwghT+Yj+Xm0JqoTf/PoZuyvHuZKfMWhQUayuN
         9jXaZgqlnAa+dfKK6z7Jip0kczM2ElRUa656HxdYpjTEpbpUGrPzrmO5IkYaS87KtgQK
         8sVA==
X-Forwarded-Encrypted: i=1; AJvYcCWU7H4Wy6DHi4zLplDZwuuC988XCaSxK6sfRDA3PCOl3zEvr7cun6ANM5UGfCHLEg5nT779elI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxasXVwwN3eU210fdlP6FpkUpJsQLDSPD27/PELcvKwycRTIZyr
	x3NAO/MMFgw8Mehff10KGGdXDpDG1E7K9ADNBN1NFXZbQKXuwhY6zp/c
X-Gm-Gg: AY/fxX4VBZa2peqq6nC1eopF7JRbhzJvEUiIMX8qdt7Zd44fPaMF8n+TiO6EDnhguhp
	zzpHA1Rs1vbeqesCVvSoukddgqsL8OjPqwFY1ss1lC9NUBNgRIH6cEVkrd4glp+3pYu0CnCsWFw
	P59KVHEw5nm3ynqqy4Wi19eBal7JUzl/nLdt21mBeBep77jAKX4j3qd0sneCkXtFTYDpFMGWXDO
	l0EuQjg+2dOVs9/+msFUPb9RzL2BDq8b1ZPl8wfd+NOflZAdjM4tyaD9iNDAEBRt3Xtyvp/G0+H
	ZYNc7ZfVd9NEX4BTBXl+Jubs3vImhXKeFrckgKfZ6VI2Um7ITAxBv6zlw8OLie5bbIBMOql4BHx
	ETHnaszSBkNmoozxNtjERWnMMy+34Dw49K1vaT4n84EroLKFddBMNXjjYMLvaDd7k5o9Qwa8qEC
	kz78p4dL35zdNmdIC5biikynqFjtJcIrEh7mCOSA==
X-Google-Smtp-Source: AGHT+IEQjLY+osX45Ymfh7gCi2D3TDyaFVdPSReW2Aj3EiksymKNTdDIl5TREk2+/LT/qOy9A4moew==
X-Received: by 2002:a05:6512:2216:b0:594:36b3:d1fa with SMTP id 2adb3069b0e04-598ee4dbeabmr1950373e87.29.1765447785847;
        Thu, 11 Dec 2025 02:09:45 -0800 (PST)
Received: from pc636 (host-90-233-204-39.mobileonline.telia.com. [90.233.204.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fbca9435csm5770731fa.44.2025.12.11.02.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 02:09:45 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 11 Dec 2025 11:09:43 +0100
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org
Subject: Re: [linus:master] [mm/vmalloc]  a061578043:
 BUG:spinlock_trylock_failure_on_UP_on_CPU
Message-ID: <aTqYZ7hearly5H6c@pc636>
References: <202512101320.e2f2dd6f-lkp@intel.com>
 <aToCq6XBybxAFopN@fedora>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aToCq6XBybxAFopN@fedora>

On Wed, Dec 10, 2025 at 03:30:51PM -0800, Vishal Moola (Oracle) wrote:
> On Wed, Dec 10, 2025 at 02:10:28PM +0800, kernel test robot wrote:
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed "BUG:spinlock_trylock_failure_on_UP_on_CPU" on:
> > 
> > commit: a0615780439938e8e61343f1f92a4c54a71dc6a5 ("mm/vmalloc: request large order pages from buddy allocator")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > 
> > [test failed on linus/master      cb015814f8b6eebcbb8e46e111d108892c5e6821]
> > [test failed on linux-next/master c75caf76ed86bbc15a72808f48f8df1608a0886c]
> > 
> > in testcase: trinity
> > version: 
> > with following parameters:
> > 
> > 	runtime: 300s
> > 	group: group-03
> > 	nr_groups: 5
> > 
> > 
> > 
> > config: x86_64-randconfig-011-20251207
> > compiler: clang-20
> > test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G
> > 
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > 
> > 
> > the issue show randomly (~50%) in tests.
> > 
> > 645a3c4243473d5c a0615780439938e8e61343f1f92
> > ---------------- ---------------------------
> >        fail:runs  %reproduction    fail:runs
> >            |             |             |
> >            :60         50%           29:60   dmesg.BUG:spinlock_trylock_failure_on_UP_on_CPU
> >            :60         50%           29:60   dmesg.RIP:_raw_spin_unlock_irqrestore
> > 
> > 
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202512101320.e2f2dd6f-lkp@intel.com
> > 
> > 
> > [ 1046.632156][    C0] BUG: spinlock trylock failure on UP on CPU#0, kcompactd0/28
> > [ 1046.633368][    C0]  lock: 0xffff888807e35ef0, .magic: dead4ead, .owner: kcompactd0/28, .owner_cpu: 0
> > [ 1046.634872][    C0] CPU: 0 UID: 0 PID: 28 Comm: kcompactd0 Not tainted 6.18.0-rc5-00127-ga06157804399 #1 PREEMPT  8cc09ef94dcec767faa911515ce9e609c45db470
> > [ 1046.637019][    C0] Call Trace:
> > [ 1046.637563][    C0]  <IRQ>
> > [ 1046.638038][    C0]  __dump_stack (lib/dump_stack.c:95)
> > [ 1046.638781][    C0]  dump_stack_lvl (lib/dump_stack.c:123)
> > [ 1046.639512][    C0]  dump_stack (lib/dump_stack.c:130)
> > [ 1046.640168][    C0]  spin_dump (kernel/locking/spinlock_debug.c:71)
> > [ 1046.640853][    C0]  do_raw_spin_trylock (kernel/locking/spinlock_debug.c:?)
> > [ 1046.641678][    C0]  _raw_spin_trylock (include/linux/spinlock_api_smp.h:89 kernel/locking/spinlock.c:138)
> > [ 1046.642473][    C0]  __free_frozen_pages (mm/page_alloc.c:2973)
> > [ 1046.643279][    C0]  ___free_pages (mm/page_alloc.c:5295)
> > [ 1046.643956][    C0]  __free_pages (mm/page_alloc.c:5334)
> > [ 1046.644624][    C0]  tlb_remove_table_rcu (include/linux/mm.h:? include/linux/mm.h:3122 include/asm-generic/tlb.h:220 mm/mmu_gather.c:227 mm/mmu_gather.c:290)
> > [ 1046.645520][    C0]  ? __cfi_tlb_remove_table_rcu (mm/mmu_gather.c:289)
> > [ 1046.646384][    C0]  ? rcu_core (kernel/rcu/tree.c:?)
> > [ 1046.647092][    C0]  rcu_core (include/linux/rcupdate.h:341 kernel/rcu/tree.c:2607 kernel/rcu/tree.c:2861)
> > [ 1046.647774][    C0]  rcu_core_si (kernel/rcu/tree.c:2879)
> > [ 1046.648439][    C0]  handle_softirqs (arch/x86/include/asm/jump_label.h:36 include/trace/events/irq.h:142 kernel/softirq.c:623)
> > [ 1046.649202][    C0]  __irq_exit_rcu (arch/x86/include/asm/jump_label.h:36 kernel/softirq.c:725)
> > [ 1046.649919][    C0]  irq_exit_rcu (kernel/softirq.c:741)
> > [ 1046.650593][    C0]  sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1052)
> > [ 1046.651520][    C0]  </IRQ>
> > [ 1046.651984][    C0]  <TASK>
> > [ 1046.652466][    C0]  asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:697)
> > [ 1046.653389][    C0] RIP: 0010:_raw_spin_unlock_irqrestore (arch/x86/include/asm/preempt.h:95 include/linux/spinlock_api_smp.h:152 kernel/locking/spinlock.c:194)
> > [ 1046.654391][    C0] Code: 00 44 89 f6 c1 ee 09 48 c7 c7 e0 f2 7e 86 31 d2 31 c9 e8 e8 dd 80 fd 4d 85 f6 74 05 e8 de e5 fd ff 0f ba e3 09 73 01 fb 31 f6 <ff> 0d 2f dc 6f 01 0f 95 c3 40 0f 94 c6 48 c7 c7 10 f3 7e 86 31 d2
> > All code
> > ========
> >    0:	00 44 89 f6          	add    %al,-0xa(%rcx,%rcx,4)
> >    4:	c1 ee 09             	shr    $0x9,%esi
> >    7:	48 c7 c7 e0 f2 7e 86 	mov    $0xffffffff867ef2e0,%rdi
> >    e:	31 d2                	xor    %edx,%edx
> >   10:	31 c9                	xor    %ecx,%ecx
> >   12:	e8 e8 dd 80 fd       	call   0xfffffffffd80ddff
> >   17:	4d 85 f6             	test   %r14,%r14
> >   1a:	74 05                	je     0x21
> >   1c:	e8 de e5 fd ff       	call   0xfffffffffffde5ff
> >   21:	0f ba e3 09          	bt     $0x9,%ebx
> >   25:	73 01                	jae    0x28
> >   27:	fb                   	sti
> >   28:	31 f6                	xor    %esi,%esi
> >   2a:*	ff 0d 2f dc 6f 01    	decl   0x16fdc2f(%rip)        # 0x16fdc5f		<-- trapping instruction
> >   30:	0f 95 c3             	setne  %bl
> >   33:	40 0f 94 c6          	sete   %sil
> >   37:	48 c7 c7 10 f3 7e 86 	mov    $0xffffffff867ef310,%rdi
> >   3e:	31 d2                	xor    %edx,%edx
> > 
> > Code starting with the faulting instruction
> > ===========================================
> >    0:	ff 0d 2f dc 6f 01    	decl   0x16fdc2f(%rip)        # 0x16fdc35
> >    6:	0f 95 c3             	setne  %bl
> >    9:	40 0f 94 c6          	sete   %sil
> >    d:	48 c7 c7 10 f3 7e 86 	mov    $0xffffffff867ef310,%rdi
> >   14:	31 d2                	xor    %edx,%edx
> > [ 1046.657511][    C0] RSP: 0000:ffffc900001cfb50 EFLAGS: 00000246
> > [ 1046.658482][    C0] RAX: 0000000000000000 RBX: 0000000000000206 RCX: 0000000000000000
> > [ 1046.659740][    C0] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> > [ 1046.660979][    C0] RBP: ffffc900001cfb68 R08: 0000000000000000 R09: 0000000000000000
> > [ 1046.662239][    C0] R10: 0000000000000000 R11: 0000000000000000 R12: ffff888807e35f50
> > [ 1046.663505][    C0] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> > [ 1046.664741][    C0]  free_pcppages_bulk (mm/page_alloc.c:1494)
> > [ 1046.665618][    C0]  drain_pages_zone (include/linux/spinlock.h:391 mm/page_alloc.c:2632)
> > [ 1046.666374][    C0]  __drain_all_pages (mm/page_alloc.c:2731)
> > [ 1046.667171][    C0]  drain_all_pages (mm/page_alloc.c:2747)
> > [ 1046.667908][    C0]  kcompactd (mm/compaction.c:3115)
> > [ 1046.668625][    C0]  kthread (kernel/kthread.c:465)
> > [ 1046.669299][    C0]  ? __cfi_kcompactd (mm/compaction.c:3166)
> > [ 1046.670046][    C0]  ? __cfi_kthread (kernel/kthread.c:412)
> > [ 1046.670764][    C0]  ret_from_fork (arch/x86/kernel/process.c:164)
> > [ 1046.671483][    C0]  ? __cfi_kthread (kernel/kthread.c:412)
> > [ 1046.672174][    C0]  ret_from_fork_asm (arch/x86/entry/entry_64.S:255)
> > [ 1046.672936][    C0]  </TASK>
> > 
> > 
> > 
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20251210/202512101320.e2f2dd6f-lkp@intel.com
> > 
> 
> Hmmm. This looks like a race condition tied to reclaim. I'm assuming
> we fail to allocate a page and kick off kswapd. Then when we fall back
> to the bulk allocator which tries to remove a pcp page at the same time as
> kswapd tries to reclaim it. Maybe?
> 
> Does something like this fix it?
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index ecbac900c35f..0d1480723ddc 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3634,7 +3634,7 @@ vm_area_alloc_pages(gfp_t gfp, int nid,
>  	struct page *page;
>  	int i;
>  	unsigned int large_order = ilog2(nr_remaining);
> -	gfp_t large_gfp = vmalloc_gfp_adjust(gfp, large_order) & ~__GFP_DIRECT_RECLAIM;
> +	gfp_t large_gfp = vmalloc_gfp_adjust(gfp, large_order) & ~__GFP_RECLAIM;
>  
>  	large_order = min(max_attempt_order, large_order);
>
Some thoughts.

That trace is not easy to follow. As for this change, probably it
is worth to go with anyway. Because, if we are under a low memory
condition, it is quite common for Android devices, we do not want
to kick frequently kswapd without good reason. We have a fallback
to single page allocator.

--
Uladzislau Rezki
