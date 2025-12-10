Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC17314B75
	for <oe-lkp@lists.linux.dev>; Wed, 10 Dec 2025 23:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765409461; cv=none; b=q1Hiq5Z72ST0O8kFY9KzDe4Uaf2gA4PRhly/icy3wn6ymMzDBhP1tJvFf9gAIxzhC33QMUSY7ibKWSCpNC9WMqCZhYeaN5leVrGYyFr11e0f0WLYob+HHSlkZJ0v92nuUI6uMvqhKnFKqR0K0Mfyv3rR84AubEMH/cwjzT4YNvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765409461; c=relaxed/simple;
	bh=ytaebf1ayKD8WdLs+r6B/5cdhs3TxFfdOlFm6N1zI/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ty0BEsLxGI8s8wifNVhhHvhqn8Ua1MQSUQrppWk8YbP36XOtFIjxMvWcxJbDCmLKI334IJKhPVt02aVjwRxr70Yvg/soTTaGj01BLkPrbRQ9kox7C9a1nlOABuJ2CaNVe6IDSiSdc7irlwlUXzVhwPowmEuLxK+WseUA57DiAq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6fcsFQ0; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6fcsFQ0"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so295345b3a.1
        for <oe-lkp@lists.linux.dev>; Wed, 10 Dec 2025 15:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765409455; x=1766014255; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vOlEqmVy+73U363CFognUBRa2K0i3PxWElxkDhZWjLk=;
        b=m6fcsFQ0ZjrpntuWl5YUei/tUHc054ulF7xqG6AHTg0DS9y50FXkvK3n5PIdb8/cCB
         Ul+K6SIU4FfD+UiEy3XhjT/cA7MEi+Zfk1bgxYFpn05cw8v7t3ludCvFMnL3iLS/l/Z5
         g0+Zmu/ZbBw9zQHGX93juOmnY8IsYIM0SikS5aWkP64hPh6JFOrZl/JEIaaO+0XNIiqA
         a5Lkb7rz9rmUoEtAe+XVVtDyHQLSawAiXdUbNPp4MmrL+VTIB9S2j+YP6QlFSfZ7mDvo
         t31RsjG8DoCZ8F6apbDDA0lNAdoTwbc9YguHWBl0BNwLXg9zvnUa++2KnQoVWjVJVviK
         HMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765409455; x=1766014255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOlEqmVy+73U363CFognUBRa2K0i3PxWElxkDhZWjLk=;
        b=k18uw3/xh+5leO/wSCDoEwuvHPGBjxrcGYdJhNYzCL+Nnw40NWaMG9I7t40sAVA7D2
         /WAK8dqMuYqwtYUREcu06ekIYQG4oqzJ8I9TEMGZnyWfdn/QtaQ3hIYJr3EQaiRCEAqx
         et9STVzaHvEtwd7LciUc5gTRUgScmNppupF1IaCIn2XJyqYhE9anidFDhpCV7A7spctZ
         aQ8c+s+YTfZnZui0+sMZYpqsc2Qpn5NoeW6mZ/OybDE3G/Ns9jroJruiGzAjjsLxSw8+
         GZVsJ/9io4rauHHuo6PI1ErJWxnVDRoCGdm/hQaVxUUyNQRYgupS1jXmdX2rE1uBYE1J
         HWbw==
X-Gm-Message-State: AOJu0Yy9nrKUFrkWJ7ItkjkF1xyEffR+dPzncUTy05GZHxJrNgaGyYYj
	lh+iK6lC+N2NNMwBVZk6sn0Y2WFXElwNR5fKJ84qV/LP8gqlEpPz2YU8
X-Gm-Gg: ASbGncuL1Im1Gmygv5lLLSRNp6T8eqmCz3j0WCOp/4HV8Ar0SNTPnEZ6GsPPUjIN0hd
	H8Wj/LUerNU5ygMd3AyEagkremfsghR+vCmndrLz/eyRVm4HC0eEOuKmRRm4NQZsust1Cy1ThYe
	C79CDTd59E4ckUcS+9bzkh/ju+xzaBx834t0MJPK1gbS/yr0CxmZWsvhzgXTDPx9UQVaYX8JmIX
	OagjyM99g4uuulycutypjRIlO+XC+SkdH6vfZJDyeybnGUnQ5GJkvqUajWyxOYGG9BrV7lR2k9F
	/x4UVoRjVSUEw34N1VoX6yAGZalT+k+T5SV01csOOPmU2x5qYeHINkU/79S2JNBxMK6rBw+/zJd
	4OoE9CpZBTvjrtg3FRRUpaT1uii04mBDhhvfzSgwCbLJiZB8giJVfzG9eKHMTXoex1QJg305Vt0
	EGpkOYjL5zfefUMkpq6iuZD1pQmfcrm/OIZckc9vKms7g=
X-Google-Smtp-Source: AGHT+IFCB72B0o/sQmDTGIyPzZQLIGJRF1ZYB+3n5K7iLoBLsX+2QIXcCLgHbcUIqgdJt6uXdprH3Q==
X-Received: by 2002:a05:7022:ec09:b0:11a:335d:80d2 with SMTP id a92af1059eb24-11f296d74d6mr2913960c88.35.1765409455190;
        Wed, 10 Dec 2025 15:30:55 -0800 (PST)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ffac2sm2541353c88.11.2025.12.10.15.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 15:30:54 -0800 (PST)
Date: Wed, 10 Dec 2025 15:30:51 -0800
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org
Subject: Re: [linus:master] [mm/vmalloc]  a061578043:
 BUG:spinlock_trylock_failure_on_UP_on_CPU
Message-ID: <aToCq6XBybxAFopN@fedora>
References: <202512101320.e2f2dd6f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512101320.e2f2dd6f-lkp@intel.com>

On Wed, Dec 10, 2025 at 02:10:28PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "BUG:spinlock_trylock_failure_on_UP_on_CPU" on:
> 
> commit: a0615780439938e8e61343f1f92a4c54a71dc6a5 ("mm/vmalloc: request large order pages from buddy allocator")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> [test failed on linus/master      cb015814f8b6eebcbb8e46e111d108892c5e6821]
> [test failed on linux-next/master c75caf76ed86bbc15a72808f48f8df1608a0886c]
> 
> in testcase: trinity
> version: 
> with following parameters:
> 
> 	runtime: 300s
> 	group: group-03
> 	nr_groups: 5
> 
> 
> 
> config: x86_64-randconfig-011-20251207
> compiler: clang-20
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> the issue show randomly (~50%) in tests.
> 
> 645a3c4243473d5c a0615780439938e8e61343f1f92
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :60         50%           29:60   dmesg.BUG:spinlock_trylock_failure_on_UP_on_CPU
>            :60         50%           29:60   dmesg.RIP:_raw_spin_unlock_irqrestore
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202512101320.e2f2dd6f-lkp@intel.com
> 
> 
> [ 1046.632156][    C0] BUG: spinlock trylock failure on UP on CPU#0, kcompactd0/28
> [ 1046.633368][    C0]  lock: 0xffff888807e35ef0, .magic: dead4ead, .owner: kcompactd0/28, .owner_cpu: 0
> [ 1046.634872][    C0] CPU: 0 UID: 0 PID: 28 Comm: kcompactd0 Not tainted 6.18.0-rc5-00127-ga06157804399 #1 PREEMPT  8cc09ef94dcec767faa911515ce9e609c45db470
> [ 1046.637019][    C0] Call Trace:
> [ 1046.637563][    C0]  <IRQ>
> [ 1046.638038][    C0]  __dump_stack (lib/dump_stack.c:95)
> [ 1046.638781][    C0]  dump_stack_lvl (lib/dump_stack.c:123)
> [ 1046.639512][    C0]  dump_stack (lib/dump_stack.c:130)
> [ 1046.640168][    C0]  spin_dump (kernel/locking/spinlock_debug.c:71)
> [ 1046.640853][    C0]  do_raw_spin_trylock (kernel/locking/spinlock_debug.c:?)
> [ 1046.641678][    C0]  _raw_spin_trylock (include/linux/spinlock_api_smp.h:89 kernel/locking/spinlock.c:138)
> [ 1046.642473][    C0]  __free_frozen_pages (mm/page_alloc.c:2973)
> [ 1046.643279][    C0]  ___free_pages (mm/page_alloc.c:5295)
> [ 1046.643956][    C0]  __free_pages (mm/page_alloc.c:5334)
> [ 1046.644624][    C0]  tlb_remove_table_rcu (include/linux/mm.h:? include/linux/mm.h:3122 include/asm-generic/tlb.h:220 mm/mmu_gather.c:227 mm/mmu_gather.c:290)
> [ 1046.645520][    C0]  ? __cfi_tlb_remove_table_rcu (mm/mmu_gather.c:289)
> [ 1046.646384][    C0]  ? rcu_core (kernel/rcu/tree.c:?)
> [ 1046.647092][    C0]  rcu_core (include/linux/rcupdate.h:341 kernel/rcu/tree.c:2607 kernel/rcu/tree.c:2861)
> [ 1046.647774][    C0]  rcu_core_si (kernel/rcu/tree.c:2879)
> [ 1046.648439][    C0]  handle_softirqs (arch/x86/include/asm/jump_label.h:36 include/trace/events/irq.h:142 kernel/softirq.c:623)
> [ 1046.649202][    C0]  __irq_exit_rcu (arch/x86/include/asm/jump_label.h:36 kernel/softirq.c:725)
> [ 1046.649919][    C0]  irq_exit_rcu (kernel/softirq.c:741)
> [ 1046.650593][    C0]  sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1052)
> [ 1046.651520][    C0]  </IRQ>
> [ 1046.651984][    C0]  <TASK>
> [ 1046.652466][    C0]  asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:697)
> [ 1046.653389][    C0] RIP: 0010:_raw_spin_unlock_irqrestore (arch/x86/include/asm/preempt.h:95 include/linux/spinlock_api_smp.h:152 kernel/locking/spinlock.c:194)
> [ 1046.654391][    C0] Code: 00 44 89 f6 c1 ee 09 48 c7 c7 e0 f2 7e 86 31 d2 31 c9 e8 e8 dd 80 fd 4d 85 f6 74 05 e8 de e5 fd ff 0f ba e3 09 73 01 fb 31 f6 <ff> 0d 2f dc 6f 01 0f 95 c3 40 0f 94 c6 48 c7 c7 10 f3 7e 86 31 d2
> All code
> ========
>    0:	00 44 89 f6          	add    %al,-0xa(%rcx,%rcx,4)
>    4:	c1 ee 09             	shr    $0x9,%esi
>    7:	48 c7 c7 e0 f2 7e 86 	mov    $0xffffffff867ef2e0,%rdi
>    e:	31 d2                	xor    %edx,%edx
>   10:	31 c9                	xor    %ecx,%ecx
>   12:	e8 e8 dd 80 fd       	call   0xfffffffffd80ddff
>   17:	4d 85 f6             	test   %r14,%r14
>   1a:	74 05                	je     0x21
>   1c:	e8 de e5 fd ff       	call   0xfffffffffffde5ff
>   21:	0f ba e3 09          	bt     $0x9,%ebx
>   25:	73 01                	jae    0x28
>   27:	fb                   	sti
>   28:	31 f6                	xor    %esi,%esi
>   2a:*	ff 0d 2f dc 6f 01    	decl   0x16fdc2f(%rip)        # 0x16fdc5f		<-- trapping instruction
>   30:	0f 95 c3             	setne  %bl
>   33:	40 0f 94 c6          	sete   %sil
>   37:	48 c7 c7 10 f3 7e 86 	mov    $0xffffffff867ef310,%rdi
>   3e:	31 d2                	xor    %edx,%edx
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	ff 0d 2f dc 6f 01    	decl   0x16fdc2f(%rip)        # 0x16fdc35
>    6:	0f 95 c3             	setne  %bl
>    9:	40 0f 94 c6          	sete   %sil
>    d:	48 c7 c7 10 f3 7e 86 	mov    $0xffffffff867ef310,%rdi
>   14:	31 d2                	xor    %edx,%edx
> [ 1046.657511][    C0] RSP: 0000:ffffc900001cfb50 EFLAGS: 00000246
> [ 1046.658482][    C0] RAX: 0000000000000000 RBX: 0000000000000206 RCX: 0000000000000000
> [ 1046.659740][    C0] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [ 1046.660979][    C0] RBP: ffffc900001cfb68 R08: 0000000000000000 R09: 0000000000000000
> [ 1046.662239][    C0] R10: 0000000000000000 R11: 0000000000000000 R12: ffff888807e35f50
> [ 1046.663505][    C0] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> [ 1046.664741][    C0]  free_pcppages_bulk (mm/page_alloc.c:1494)
> [ 1046.665618][    C0]  drain_pages_zone (include/linux/spinlock.h:391 mm/page_alloc.c:2632)
> [ 1046.666374][    C0]  __drain_all_pages (mm/page_alloc.c:2731)
> [ 1046.667171][    C0]  drain_all_pages (mm/page_alloc.c:2747)
> [ 1046.667908][    C0]  kcompactd (mm/compaction.c:3115)
> [ 1046.668625][    C0]  kthread (kernel/kthread.c:465)
> [ 1046.669299][    C0]  ? __cfi_kcompactd (mm/compaction.c:3166)
> [ 1046.670046][    C0]  ? __cfi_kthread (kernel/kthread.c:412)
> [ 1046.670764][    C0]  ret_from_fork (arch/x86/kernel/process.c:164)
> [ 1046.671483][    C0]  ? __cfi_kthread (kernel/kthread.c:412)
> [ 1046.672174][    C0]  ret_from_fork_asm (arch/x86/entry/entry_64.S:255)
> [ 1046.672936][    C0]  </TASK>
> 
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20251210/202512101320.e2f2dd6f-lkp@intel.com
> 

Hmmm. This looks like a race condition tied to reclaim. I'm assuming
we fail to allocate a page and kick off kswapd. Then when we fall back
to the bulk allocator which tries to remove a pcp page at the same time as
kswapd tries to reclaim it. Maybe?

Does something like this fix it?

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index ecbac900c35f..0d1480723ddc 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3634,7 +3634,7 @@ vm_area_alloc_pages(gfp_t gfp, int nid,
 	struct page *page;
 	int i;
 	unsigned int large_order = ilog2(nr_remaining);
-	gfp_t large_gfp = vmalloc_gfp_adjust(gfp, large_order) & ~__GFP_DIRECT_RECLAIM;
+	gfp_t large_gfp = vmalloc_gfp_adjust(gfp, large_order) & ~__GFP_RECLAIM;
 
 	large_order = min(max_attempt_order, large_order);
