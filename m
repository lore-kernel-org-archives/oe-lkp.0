Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AB83168EF
	for <oe-lkp@lists.linux.dev>; Thu, 11 Dec 2025 20:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765486373; cv=none; b=fA10WN5ZOVjmfwkrdhNc811xt6hfl8KbDyXanNOdqH620HH3fsv/b8NpVq6uJTfVrBVCZH1xPgf7BziLJ6YPFT4E7+51b88SLZZM0Pk78yH1njZv5RIEPUK1PwevXe+1QAhD6QhKGIUaPXjjTKb3cDBvbJwEqyT/OT2Dq4EVwqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765486373; c=relaxed/simple;
	bh=EE/JXCK7JEchtXri0AVWxc2Uxy5lRUr1aJaTNW77abc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=USwPSC7cmuJDW9tXglXSHFeZEz4TBdAqBgKMinmzhWt/uH9gwRouwDP8/o20nW5Ye2c2iQG29VgP7Mpunr9F+FOcZPDKhxDynYcDg326Od4kSSih4zeYYGEVWau7NgzseYIfSQyt+YHo9S7iziexYZJsljm4pTN524DSyPpuDf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=auSBf/3j; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="auSBf/3j"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso485753a12.3
        for <oe-lkp@lists.linux.dev>; Thu, 11 Dec 2025 12:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765486371; x=1766091171; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jlyy8MCX0g2fX7qkmpD8WB/ODTVy0vn20f9KGQfCxdI=;
        b=auSBf/3jLLQeK0upgfjv7FDC5hypnLxMp3N1jgQNDc+3uz8csYrXMuhp6vBvIFGnCv
         CsVZEGe4/CUVsMATGQuObRC9qikBtUxYOCmnYQvbcB06Xk0SgTyBqyyXLoiqixZRf1LB
         xJhMJA9VK9mPnNzajq3F6lLt7p4ct+AUTyneDkL+O4VKLZENyXmRpRzrsdRFKwrlKaEn
         Ts1iPSTJmhBpNiJsXUpLXUTjen9mE6DARuw/TRSyUdcNulfe75uQ3ix5412GXdz/hYrl
         yV7vrbYAGs/wthqx0d/FBEF+UcBC7DmM7ma0z69RdP1ARuH10oQA5eljK9naHtzKjcRb
         WKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765486371; x=1766091171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jlyy8MCX0g2fX7qkmpD8WB/ODTVy0vn20f9KGQfCxdI=;
        b=EnuYnUAOij6EEq+c50psPqEnZx7p/dOz0gbkhu2gEsvizV9sw/6fVLF0L2nFztiG5v
         k8ChK7uB8TbXziJhgzcLv1emXlgVzwinxTNCBw7cIllt1g2sdWWS9zOA4Y+1zDCylZ85
         CcpkrWRCz0sDvBlRQdnNfFT1x9Dyd3SdYrMOnhHSPRf3TAdA6ntGyb9TQhRg2gP9wdgF
         XATEZIX0fsJXHEV3Z75WxxSz0JdOfW6IuH4FnhEM6p+u1w9Y6TECW7/3gMnemMAJ2B/m
         jXQnkLIU/VQ76LkbR+Ha7Jw9frjePl5rP3UO6/tElQhITIAvEadYWhvc2KBf1rMnUYev
         viBg==
X-Forwarded-Encrypted: i=1; AJvYcCVP1M7jXYm9ERr4okvTY0RyzBHcLoTqhY3dsXQG7qi62A51i/Qki6IPzgGAkL0coPYjYTKV9zA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVgk2pjgNNaxT4Akb7X63DGAF26Us77s5+uRxLteWUIbBmsDVZ
	NMKAJ5S67gK90wAEJvs5vOl32Ek4JRi+vumfZh3MmIHy9GCPhCHZkXse
X-Gm-Gg: AY/fxX7o81VJephrwOrD1rsKopoRe/pUHoGwDP/s3lk0wQGg2qzmVgBQMBZWRA8rZfl
	ahWqs3PfbP4VLYR5kaRpOn3on9T8qjTIpTB2iTAQzWLdDxzCYfnjMavNDmmRe0vPmYssNbkbtW9
	GlyUqjpRw/OpBtnLArNUwWsHe++yblK05rZCWA0MTVmP0E1zPLhtNT0kamc/7NldPPzMNp2gqZZ
	M1u9tIy/GzJ6RWP4uVpg9yg7qwy9ixWYB4aWuahCMYJ28gCzdIU3qt2SV3PYcH45sXox+H/Uazd
	FZxMGE6FnjJXWpjI4z83NLR+gsGMH7FizpsJeoOuu0sN3hlYLRUNQz4UvmYVlQ580o4Eg6gDFid
	pbN3ZqAQXYsg9ZVVjNaQ8JT1vL9hg0kNOCS2Tu2f2A2wZSH3N7NWzu3GDPNv3Qu0nKddPvHzJ6W
	4b/z7Jce9NkylYxUPQJTmzQhD2Hd3R60cnbe5pJwToGUgFG89YxiLZ3w==
X-Google-Smtp-Source: AGHT+IEpxLBrLQIKe5d4iTU5Zg8Uzm7bo0aDSA2tt/Fygjk56S73MIzE9JKPD5b57D2uxyQprymAtA==
X-Received: by 2002:a05:7022:2399:b0:11d:ef84:6cff with SMTP id a92af1059eb24-11f296dc85dmr6021800c88.37.1765486370588;
        Thu, 11 Dec 2025 12:52:50 -0800 (PST)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b4867sm10828401c88.6.2025.12.11.12.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 12:52:49 -0800 (PST)
Date: Thu, 11 Dec 2025 12:52:47 -0800
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Oliver Sang <oliver.sang@intel.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Subject: Re: [linus:master] [mm/vmalloc]  a061578043:
 BUG:spinlock_trylock_failure_on_UP_on_CPU
Message-ID: <aTsvH422vqivZs8g@fedora>
References: <202512101320.e2f2dd6f-lkp@intel.com>
 <aToCq6XBybxAFopN@fedora>
 <aTqYZ7hearly5H6c@pc636>
 <aTrJtyGbvO/Wt5nf@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTrJtyGbvO/Wt5nf@xsang-OptiPlex-9020>

On Thu, Dec 11, 2025 at 09:40:07PM +0800, Oliver Sang wrote:
> hi, Uladzislau Rezki,
> 
> On Thu, Dec 11, 2025 at 11:09:43AM +0100, Uladzislau Rezki wrote:
> > On Wed, Dec 10, 2025 at 03:30:51PM -0800, Vishal Moola (Oracle) wrote:
> > > On Wed, Dec 10, 2025 at 02:10:28PM +0800, kernel test robot wrote:
> > > > 
> > > > 
> > > > Hello,
> > > > 
> > > > kernel test robot noticed "BUG:spinlock_trylock_failure_on_UP_on_CPU" on:
> > > > 
> > > > commit: a0615780439938e8e61343f1f92a4c54a71dc6a5 ("mm/vmalloc: request large order pages from buddy allocator")
> > > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > > > 
> > > > [test failed on linus/master      cb015814f8b6eebcbb8e46e111d108892c5e6821]
> > > > [test failed on linux-next/master c75caf76ed86bbc15a72808f48f8df1608a0886c]
> > > > 
> > > > in testcase: trinity
> > > > version: 
> > > > with following parameters:
> > > > 
> > > > 	runtime: 300s
> > > > 	group: group-03
> > > > 	nr_groups: 5
> > > > 
> > > > 
> > > > 
> > > > config: x86_64-randconfig-011-20251207
> > > > compiler: clang-20
> > > > test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G
> > > > 
> > > > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > > > 
> > > > 
> > > > the issue show randomly (~50%) in tests.
> > > > 
> > > > 645a3c4243473d5c a0615780439938e8e61343f1f92
> > > > ---------------- ---------------------------
> > > >        fail:runs  %reproduction    fail:runs
> > > >            |             |             |
> > > >            :60         50%           29:60   dmesg.BUG:spinlock_trylock_failure_on_UP_on_CPU
> > > >            :60         50%           29:60   dmesg.RIP:_raw_spin_unlock_irqrestore
> > > > 
> > > > 
> > > > 
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-lkp/202512101320.e2f2dd6f-lkp@intel.com
> > > > 
> > > > 
> > > > [ 1046.632156][    C0] BUG: spinlock trylock failure on UP on CPU#0, kcompactd0/28
> > > > [ 1046.633368][    C0]  lock: 0xffff888807e35ef0, .magic: dead4ead, .owner: kcompactd0/28, .owner_cpu: 0
> > > > [ 1046.634872][    C0] CPU: 0 UID: 0 PID: 28 Comm: kcompactd0 Not tainted 6.18.0-rc5-00127-ga06157804399 #1 PREEMPT  8cc09ef94dcec767faa911515ce9e609c45db470
> > > > [ 1046.637019][    C0] Call Trace:
> > > > [ 1046.637563][    C0]  <IRQ>
> > > > [ 1046.638038][    C0]  __dump_stack (lib/dump_stack.c:95)
> > > > [ 1046.638781][    C0]  dump_stack_lvl (lib/dump_stack.c:123)
> > > > [ 1046.639512][    C0]  dump_stack (lib/dump_stack.c:130)
> > > > [ 1046.640168][    C0]  spin_dump (kernel/locking/spinlock_debug.c:71)
> > > > [ 1046.640853][    C0]  do_raw_spin_trylock (kernel/locking/spinlock_debug.c:?)
> > > > [ 1046.641678][    C0]  _raw_spin_trylock (include/linux/spinlock_api_smp.h:89 kernel/locking/spinlock.c:138)
> > > > [ 1046.642473][    C0]  __free_frozen_pages (mm/page_alloc.c:2973)
> > > > [ 1046.643279][    C0]  ___free_pages (mm/page_alloc.c:5295)
> > > > [ 1046.643956][    C0]  __free_pages (mm/page_alloc.c:5334)
> > > > [ 1046.644624][    C0]  tlb_remove_table_rcu (include/linux/mm.h:? include/linux/mm.h:3122 include/asm-generic/tlb.h:220 mm/mmu_gather.c:227 mm/mmu_gather.c:290)
> > > > [ 1046.645520][    C0]  ? __cfi_tlb_remove_table_rcu (mm/mmu_gather.c:289)
> > > > [ 1046.646384][    C0]  ? rcu_core (kernel/rcu/tree.c:?)
> > > > [ 1046.647092][    C0]  rcu_core (include/linux/rcupdate.h:341 kernel/rcu/tree.c:2607 kernel/rcu/tree.c:2861)
> > > > [ 1046.647774][    C0]  rcu_core_si (kernel/rcu/tree.c:2879)
> > > > [ 1046.648439][    C0]  handle_softirqs (arch/x86/include/asm/jump_label.h:36 include/trace/events/irq.h:142 kernel/softirq.c:623)
> > > > [ 1046.649202][    C0]  __irq_exit_rcu (arch/x86/include/asm/jump_label.h:36 kernel/softirq.c:725)
> > > > [ 1046.649919][    C0]  irq_exit_rcu (kernel/softirq.c:741)
> > > > [ 1046.650593][    C0]  sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1052)
> > > > [ 1046.651520][    C0]  </IRQ>
> > > > [ 1046.651984][    C0]  <TASK>
> > > > [ 1046.652466][    C0]  asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:697)
> > > > [ 1046.653389][    C0] RIP: 0010:_raw_spin_unlock_irqrestore (arch/x86/include/asm/preempt.h:95 include/linux/spinlock_api_smp.h:152 kernel/locking/spinlock.c:194)
> > > > [ 1046.654391][    C0] Code: 00 44 89 f6 c1 ee 09 48 c7 c7 e0 f2 7e 86 31 d2 31 c9 e8 e8 dd 80 fd 4d 85 f6 74 05 e8 de e5 fd ff 0f ba e3 09 73 01 fb 31 f6 <ff> 0d 2f dc 6f 01 0f 95 c3 40 0f 94 c6 48 c7 c7 10 f3 7e 86 31 d2
> > > > All code
> > > > ========
> > > >    0:	00 44 89 f6          	add    %al,-0xa(%rcx,%rcx,4)
> > > >    4:	c1 ee 09             	shr    $0x9,%esi
> > > >    7:	48 c7 c7 e0 f2 7e 86 	mov    $0xffffffff867ef2e0,%rdi
> > > >    e:	31 d2                	xor    %edx,%edx
> > > >   10:	31 c9                	xor    %ecx,%ecx
> > > >   12:	e8 e8 dd 80 fd       	call   0xfffffffffd80ddff
> > > >   17:	4d 85 f6             	test   %r14,%r14
> > > >   1a:	74 05                	je     0x21
> > > >   1c:	e8 de e5 fd ff       	call   0xfffffffffffde5ff
> > > >   21:	0f ba e3 09          	bt     $0x9,%ebx
> > > >   25:	73 01                	jae    0x28
> > > >   27:	fb                   	sti
> > > >   28:	31 f6                	xor    %esi,%esi
> > > >   2a:*	ff 0d 2f dc 6f 01    	decl   0x16fdc2f(%rip)        # 0x16fdc5f		<-- trapping instruction
> > > >   30:	0f 95 c3             	setne  %bl
> > > >   33:	40 0f 94 c6          	sete   %sil
> > > >   37:	48 c7 c7 10 f3 7e 86 	mov    $0xffffffff867ef310,%rdi
> > > >   3e:	31 d2                	xor    %edx,%edx
> > > > 
> > > > Code starting with the faulting instruction
> > > > ===========================================
> > > >    0:	ff 0d 2f dc 6f 01    	decl   0x16fdc2f(%rip)        # 0x16fdc35
> > > >    6:	0f 95 c3             	setne  %bl
> > > >    9:	40 0f 94 c6          	sete   %sil
> > > >    d:	48 c7 c7 10 f3 7e 86 	mov    $0xffffffff867ef310,%rdi
> > > >   14:	31 d2                	xor    %edx,%edx
> > > > [ 1046.657511][    C0] RSP: 0000:ffffc900001cfb50 EFLAGS: 00000246
> > > > [ 1046.658482][    C0] RAX: 0000000000000000 RBX: 0000000000000206 RCX: 0000000000000000
> > > > [ 1046.659740][    C0] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> > > > [ 1046.660979][    C0] RBP: ffffc900001cfb68 R08: 0000000000000000 R09: 0000000000000000
> > > > [ 1046.662239][    C0] R10: 0000000000000000 R11: 0000000000000000 R12: ffff888807e35f50
> > > > [ 1046.663505][    C0] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> > > > [ 1046.664741][    C0]  free_pcppages_bulk (mm/page_alloc.c:1494)
> > > > [ 1046.665618][    C0]  drain_pages_zone (include/linux/spinlock.h:391 mm/page_alloc.c:2632)
> > > > [ 1046.666374][    C0]  __drain_all_pages (mm/page_alloc.c:2731)
> > > > [ 1046.667171][    C0]  drain_all_pages (mm/page_alloc.c:2747)
> > > > [ 1046.667908][    C0]  kcompactd (mm/compaction.c:3115)
> > > > [ 1046.668625][    C0]  kthread (kernel/kthread.c:465)
> > > > [ 1046.669299][    C0]  ? __cfi_kcompactd (mm/compaction.c:3166)
> > > > [ 1046.670046][    C0]  ? __cfi_kthread (kernel/kthread.c:412)
> > > > [ 1046.670764][    C0]  ret_from_fork (arch/x86/kernel/process.c:164)
> > > > [ 1046.671483][    C0]  ? __cfi_kthread (kernel/kthread.c:412)
> > > > [ 1046.672174][    C0]  ret_from_fork_asm (arch/x86/entry/entry_64.S:255)
> > > > [ 1046.672936][    C0]  </TASK>
> > > > 
> > > > 
> > > > 
> > > > The kernel config and materials to reproduce are available at:
> > > > https://download.01.org/0day-ci/archive/20251210/202512101320.e2f2dd6f-lkp@intel.com
> > > > 
> > > 
> > > Hmmm. This looks like a race condition tied to reclaim. I'm assuming
> > > we fail to allocate a page and kick off kswapd. Then when we fall back
> > > to the bulk allocator which tries to remove a pcp page at the same time as
> > > kswapd tries to reclaim it. Maybe?
> > > 
> > > Does something like this fix it?
> 
> below patch is failed to applied upon a061578043.
> 
> since before reporting, we also tested on latest mainline tip at that time:
> [test failed on linus/master      cb015814f8b6eebcbb8e46e111d108892c5e6821]
> which still can reproduce the issue, we applied below patch upon this commit.
> 
> 
> we found the issue still exists, though the rate seems drop, we only reproduced
> the issue 4 times out of 100 runs.
> 
> one dmesg attached FYI.
> 
> 
> [  448.229620][    C0] BUG: spinlock trylock failure on UP on CPU#0, kcompactd0/28
> [  448.230037][    C0]  lock: 0xffff888807e75f08, .magic: dead4ead, .owner: kcompactd0/28, .owner_cpu: 0
> [  448.230474][    C0] CPU: 0 UID: 0 PID: 28 Comm: kcompactd0 Not tainted 6.18.0-12693-g5c827f68ce27 #1 PREEMPT  b3721ff206516c93c37a896ae4d3df039c2d04c2
> [  448.231106][    C0] Call Trace:
> [  448.231264][    C0]  <IRQ>
> [  448.231403][    C0]  __dump_stack+0x19/0x40
> [  448.231627][    C0]  dump_stack_lvl+0x36/0xb8
> [  448.231842][    C0]  dump_stack+0x10/0x38
> [  448.232101][    C0]  spin_dump+0x11c/0x1c0
> [  448.232404][    C0]  do_raw_spin_trylock+0xe4/0x138
> [  448.232758][    C0]  _raw_spin_trylock+0x1a/0xb8
> [  448.233104][    C0]  __free_frozen_pages+0x750/0xa80
> [  448.233456][    C0]  ___free_pages+0x67/0x140
> [  448.233765][    C0]  __free_pages+0x10/0x38
> [  448.234066][    C0]  __tlb_remove_table+0x16a/0x200
> [  448.234412][    C0]  tlb_remove_table_rcu+0x77/0xf8
> [  448.234771][    C0]  ? __cfi_tlb_remove_table_rcu+0x8/0x8
> [  448.235153][    C0]  ? rcu_core+0x8af/0x1740
> [  448.235456][    C0]  rcu_core+0xa25/0x1740
> [  448.235751][    C0]  rcu_core_si+0xe/0x38
> [  448.236038][    C0]  handle_softirqs+0x1db/0x700
> [  448.236371][    C0]  __irq_exit_rcu+0x44/0xc0
> [  448.236678][    C0]  irq_exit_rcu+0xe/0x38
> [  448.236968][    C0]  sysvec_apic_timer_interrupt+0x78/0xb8
> [  448.237382][    C0]  </IRQ>
> [  448.237588][    C0]  <TASK>
> [  448.237798][    C0]  asm_sysvec_apic_timer_interrupt+0x1b/0x40
> [  448.238214][    C0] RIP: 0010:_raw_spin_unlock_irqrestore+0x6b/0xb8
> [  448.238575][    C0] Code: 00 44 89 f6 c1 ee 09 48 c7 c7 60 91 80 86 31 d2 31 c9 e8 e8 b4 86 fd 4d 85 f6 74 05 e8 9e e9 fd ff 0f ba e3 09 73 01 fb 31 f6 <ff> 0d ef b8 75 01 0f 95 c3 40 0f 94 c6 48 c7 c7 90 91 80 86 31 d2
> [  448.239787][    C0] RSP: 0000:ffffc900001cfb48 EFLAGS: 00000246
> [  448.240187][    C0] RAX: 0000000000000000 RBX: 0000000000000206 RCX: 0000000000000000
> [  448.240700][    C0] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [  448.241230][    C0] RBP: ffffc900001cfb60 R08: 0000000000000000 R09: 0000000000000000
> [  448.241758][    C0] R10: 0000000000000000 R11: 0000000000000000 R12: ffff888807e75fc8
> [  448.242289][    C0] R13: 0000000000000006 R14: 0000000000000000 R15: ffffea000cee6410
> [  448.242840][    C0]  ? _raw_spin_unlock_irqrestore+0x58/0xb8
> [  448.243241][    C0]  free_pcppages_bulk+0x4a2/0x500
> [  448.243591][    C0]  drain_pages_zone+0xa5/0x140
> [  448.243936][    C0]  __drain_all_pages+0x1ab/0x240
> [  448.244277][    C0]  drain_all_pages+0x10/0x38
> [  448.244587][    C0]  kcompactd+0x61f/0xaf8
> [  448.244900][    C0]  kthread+0x586/0x678
> [  448.245183][    C0]  ? __cfi_kcompactd+0x8/0x8
> [  448.245504][    C0]  ? __cfi_kthread+0x8/0x8
> [  448.245815][    C0]  ret_from_fork+0x24a/0x478
> [  448.246138][    C0]  ? __cfi_kthread+0x8/0x8
> [  448.246453][    C0]  ret_from_fork_asm+0x11/0x40
> [  448.246795][    C0]  </TASK>
> [  693.283069][  T328] hwclock: can't open '/dev/misc/rtc': No such file or directory
> LKP: ttyS0: 289: LKP: tbox cant kexec and rebooting forcely
> [  701.346273][  T289] sysrq: Emergency Sync
> [  701.346778][   T10] Emergency Sync complete
> [  701.347270][  T289] sysrq: Resetting
> 
> 
> > > 
> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index ecbac900c35f..0d1480723ddc 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -3634,7 +3634,7 @@ vm_area_alloc_pages(gfp_t gfp, int nid,
> > >  	struct page *page;
> > >  	int i;
> > >  	unsigned int large_order = ilog2(nr_remaining);
> > > -	gfp_t large_gfp = vmalloc_gfp_adjust(gfp, large_order) & ~__GFP_DIRECT_RECLAIM;
> > > +	gfp_t large_gfp = vmalloc_gfp_adjust(gfp, large_order) & ~__GFP_RECLAIM;
> > >  
> > >  	large_order = min(max_attempt_order, large_order);
> > >
> > Some thoughts.
> > 
> > That trace is not easy to follow. As for this change, probably it
> > is worth to go with anyway. Because, if we are under a low memory
> > condition, it is quite common for Android devices, we do not want
> > to kick frequently kswapd without good reason. We have a fallback
> > to single page allocator.

Yeah. AFAICT, This trace doesn't seem to point at this patch:

__free_frozen_pages+0x750/0xa80 is:
	pcp = pcp_spin_trylock(zone->per_cpu_pageset, UP_flags);
	if (pcp) {
		if (!free_frozen_page_commit(zone, pcp, page, migratetype,
						order, fpi_flags, &UP_flags))
			return;
------------>	pcp_spin_unlock(pcp, UP_flags);
 
free_pcppages_bulk+0x4a2/0x500 is:
	spin_unlock_irqrestore(&zone->lock, flags);

Seeing how masking off reclaim reduced the occurence from 50% -> 5%,
Maybe its some underlying race condition that is encouraged by the
patch? I'm not sure how often people are kicking of kswapd then
immediately calling the bulk allocator...
