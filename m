Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD0121FF4A
	for <oe-lkp@lists.linux.dev>; Tue, 18 Nov 2025 00:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763426675; cv=none; b=DCdnZz8L6dIicbFISLMI7M2eZRjJWAiAMdNOWOZcPFPjvEGjw/NQtyIy0EKfm9UMjUoqMIhn+Eym2Wpv4P9I58IiV+aAov7S0jBvt4OhFQ3XNoVxHeTSD0LJ5/GcoPhv+SLlFsjrkwA7rZqjoKIONk3h5IlUGTFjIn050YjzgBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763426675; c=relaxed/simple;
	bh=wphrtK0QecZOl+K0zAUidXc12uICf0Dbv1FYXw55phM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MGFEnF7VJjg0+dSDe4yRes6ufg9QsgyNeFtFpv/5Vbd+Om1SxabTB2F3XyIEUj38VcWQ0P961zkI78JffUt48dsFPgkYQmCCITguEwiC6wsAdUvbiBZv3i3fj1/aufns+3JmLLdMoGRf4+kVstTOrEVBqgowsZY73mtmNIakYr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TrdGXETF; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrdGXETF"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b8c0c0cdd61so4365711a12.2
        for <oe-lkp@lists.linux.dev>; Mon, 17 Nov 2025 16:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763426673; x=1764031473; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Rw6N3DfQLTWZubv1tCO5tCu5Q2UsmjpxOpe9crG0Mk=;
        b=TrdGXETFh0e+fXjEnGJ2U4mXKi8HsfzfMv5v9hVeoJQxemExVGrjl9e9CXsYqmJ+Lk
         ZBplZKg5OLqXYZT8qUMyeD8JOq6/zmJumsnv5Vmq2tS/+ZGEHLPF4IO3DjSqEsZ1isNL
         LCDumxfC/R/T2KvtlWzmnugcNd+fAqiaL/Qu06W7rqVMDJU+yAWpyHtYNIsqBhUejlvc
         59biV+OrTHKh8f1ilmk3zUAxzFWXDBW7oIbkXnLYyswZZXTARkGKFTHuJIq3zUe4hZnQ
         fZNHJZkECEJ10PezIWel4wQqPthoiSRGVadqgUqQDreNQUsE22tTgw/LBzAdOxvLYdJG
         Dkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763426673; x=1764031473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Rw6N3DfQLTWZubv1tCO5tCu5Q2UsmjpxOpe9crG0Mk=;
        b=YR7a6kh0hx+T1b7XY7kXvtMr8a97y/L1FbiSFed317kjOe2hwx9+/S6Ob7EOmbSIs9
         752tbfr34SwWdRoiO+ivCqvaCfQFQDY5W7i/9sL35NZsf9QagNkIoc0cuUNLK/iNIO4d
         bhmYryGlfmJGR5sfv6uPlmxfqc42D4LCGtyEZb5TucY74Zn+tVHkeUAkRGxwdN/7c5UJ
         l5oTNTwdT7KW3C80YtR6UkCH/FzTxresM7u9NQpwGp3sWLkyoYVLkvZsrQakKnB+lykG
         YTqbn1fZjwjnPACfDvXgGEUcrdUVdbplC6eOmXzGmkPW3fhyjZoXASvN+Uyizonz6Aa6
         nr4g==
X-Forwarded-Encrypted: i=1; AJvYcCVKfM1twi0FGXNRu1PNrj1MXr/5PdWetHYJdKbEQFrDsi+yNg4oVy50Qx2XcxdMcxqpLgUrSF0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz20efXqth08JIrTDg1jCBTJ5NU098f0VFUtL3eITpYYsd8kguv
	nHNaa/rvjTrUXC9ApIkBQ2nk+TKnfRFLLfWVFchlBK//zAo9ZrQaLI6K
X-Gm-Gg: ASbGncubLP7/8NkimnYZPkSQBjol3qfcr4UdRPmxpStLo9PG17U9lYxaTKrrOp5zOeO
	gAKsBjDzL4R9f69BJS+x2jjDQ6Wrc77lmltQ5qcFdyPrJwR0XEneZJUu/T9wDwnBqjPuZ7MmBVF
	6T25ML9Z9RFDHRxBRwHyHmhR1gyjrTPEELBu2W40ALpLzOWGSGzUEUltMjKNZBvrCx5WJ08i/up
	0wNDCSdE167/DFJ54VucCt6tIesDRlWk+2mwMLldEiUsmm+9okD+lPmsEmJ2U+0D9rn3HPeX1tm
	s1UlrlpXybqtDqhfqhEuUMdNd/LiayP5xTQRYMY54VuTYrFjMiGObYX2drlWJBs/VmLtR8NqIZm
	1xs7VH0kkS3Eyx4WKRh1g+c+p57szPScsIAEThGtYZMKCQyzi/x0MIAFO6yd2Ho87HKt8g0Z+Gt
	ZGjFx9bLmY6vMSPHpwbrUVauPs3SN9zFNAHigSLRyPTpu/plhjHLMxWxyqTXQlqk+q
X-Google-Smtp-Source: AGHT+IEekRbfTH74TjieJsque9jyjHlXoUp37pzLLs9wNbsnzKJwOhoYGxIwMI9SmC+dj3O50BjpBA==
X-Received: by 2002:a05:7301:4381:b0:2a4:3592:cf6a with SMTP id 5a478bee46e88-2a4ab87fc86mr4252416eec.14.1763426672717;
        Mon, 17 Nov 2025 16:44:32 -0800 (PST)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49db4a36asm39962611eec.5.2025.11.17.16.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 16:44:31 -0800 (PST)
Date: Mon, 17 Nov 2025 16:44:29 -0800
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Subject: Re: [PATCH 1/4] mm: Use frozen pages for page tables
Message-ID: <aRvBbYmCz-jkIzo1@fedora>
References: <20251113140448.1814860-2-willy@infradead.org>
 <202511172257.ffd96dab-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511172257.ffd96dab-lkp@intel.com>

On Mon, Nov 17, 2025 at 10:38:09PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "BUG:Bad_page_state_in_process" on:
> 
> commit: ffb870b766822062b6c71211c80342c85a7ffcd8 ("[PATCH 1/4] mm: Use frozen pages for page tables")
> url: https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/mm-Use-frozen-pages-for-page-tables/20251113-222907
> base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everything
> patch link: https://lore.kernel.org/all/20251113140448.1814860-2-willy@infradead.org/
> patch subject: [PATCH 1/4] mm: Use frozen pages for page tables
> 
> in testcase: rcutorture
> version: 
> with following parameters:
> 
> 	runtime: 300s
> 	test: cpuhotplug
> 	torture_type: trivial
> 
> 
> 
> config: x86_64-randconfig-101-20251114
> compiler: clang-20
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202511172257.ffd96dab-lkp@intel.com
> 
> 
> [   19.289760][  T422] BUG: Bad page state in process modprobe  pfn:1618b2
> [   19.290414][  T422] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1618b2
> [   19.291313][  T422] flags: 0x8000000000000000(zone=2)
> [   19.291714][  T422] raw: 8000000000000000 dead000000000100 dead000000000122 0000000000000000
> [   19.292382][  T422] raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
> [   19.293020][  T422] page dumped because: nonzero _refcount
> [   19.293444][  T422] Modules linked in:
> [   19.293804][  T422] CPU: 0 UID: 0 PID: 422 Comm: modprobe Not tainted 6.18.0-rc5-00422-gffb870b76682 #1 PREEMPT(none)  65c9d11eede624b36533d4efe2c3c7798fc76b60
> [   19.293811][  T422] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [   19.293814][  T422] Call Trace:
> [   19.293817][  T422]  <TASK>
> [   19.293820][  T422]  dump_stack_lvl (lib/dump_stack.c:123)
> [   19.293834][  T422]  ? show_regs_print_info (lib/dump_stack.c:104)
> [   19.293842][  T422]  ? smp_call_function_many (kernel/smp.c:784)
> [   19.293847][  T422]  ? find_held_lock (kernel/locking/lockdep.c:5350)
> [   19.293854][  T422]  bad_page (mm/page_alloc.c:?)
> [   19.293860][  T422]  __free_frozen_pages (mm/page_alloc.c:?)
> [   19.293870][  T422]  change_page_attr_set_clr (include/linux/list.h:372)
> [   19.293878][  T422]  ? __set_memory_prot (arch/x86/mm/pat/set_memory.c:2041)
> [   19.293884][  T422]  ? __set_memory_prot (arch/x86/mm/pat/set_memory.c:2041)
> [   19.293889][  T422]  ? trace_contention_end (include/trace/events/lock.h:122)
> [   19.293897][  T422]  ? do_raw_spin_lock (arch/x86/include/asm/atomic.h:107)
> [   19.293904][  T422]  set_memory_rox (arch/x86/mm/pat/set_memory.c:2327)
> [   19.293910][  T422]  ? set_memory_nx (arch/x86/mm/pat/set_memory.c:2123 arch/x86/mm/pat/set_memory.c:2312)
> [   19.293915][  T422]  ? set_memory_ro (arch/x86/mm/pat/set_memory.c:2321)
> [   19.293921][  T422]  ? _raw_spin_unlock (arch/x86/include/asm/preempt.h:95 include/linux/spinlock_api_smp.h:143 kernel/locking/spinlock.c:186)
> [   19.293929][  T422]  ? find_vmap_area (mm/vmalloc.c:2507)
> [   19.293935][  T422]  module_enable_text_rox (kernel/module/strict_rwx.c:40)
> [   19.293943][  T422]  complete_formation (kernel/module/main.c:3258)
> [   19.293952][  T422]  ? post_relocation (kernel/module/main.c:3237)
> [   19.293959][  T422]  ? init_build_id (kernel/module/kallsyms.c:?)
> [   19.293967][  T422]  load_module (kernel/module/main.c:3468)
> [   19.293979][  T422]  __se_sys_finit_module (kernel/module/main.c:? kernel/module/main.c:3713 kernel/module/main.c:3739 kernel/module/main.c:3723)
> [   19.293987][  T422]  ? __x64_sys_finit_module (kernel/module/main.c:3723)
> [   19.293998][  T422]  ? exc_page_fault (arch/x86/mm/fault.c:?)
> [   19.294007][  T422]  ? __ia32_sys_write (fs/read_write.c:754)
> [   19.294015][  T422]  ? do_sys_open (fs/open.c:1452)
> [   19.294022][  T422]  ? entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
> [   19.294026][  T422]  do_syscall_64 (arch/x86/entry/syscall_64.c:?)
> [   19.294034][  T422]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
> [   19.294038][  T422] RIP: 0033:0x7f8d36fda779
> [   19.294042][  T422] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 4f 86 0d 00 f7 d8 64 89 01 48
> All code
> ========
>    0:	ff c3                	inc    %ebx
>    2:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
>    9:	00 00 00 
>    c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
>   11:	48 89 f8             	mov    %rdi,%rax
>   14:	48 89 f7             	mov    %rsi,%rdi
>   17:	48 89 d6             	mov    %rdx,%rsi
>   1a:	48 89 ca             	mov    %rcx,%rdx
>   1d:	4d 89 c2             	mov    %r8,%r10
>   20:	4d 89 c8             	mov    %r9,%r8
>   23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
>   28:	0f 05                	syscall
>   2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
>   30:	73 01                	jae    0x33
>   32:	c3                   	ret
>   33:	48 8b 0d 4f 86 0d 00 	mov    0xd864f(%rip),%rcx        # 0xd8689
>   3a:	f7 d8                	neg    %eax
>   3c:	64 89 01             	mov    %eax,%fs:(%rcx)
>   3f:	48                   	rex.W
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
>    6:	73 01                	jae    0x9
>    8:	c3                   	ret
>    9:	48 8b 0d 4f 86 0d 00 	mov    0xd864f(%rip),%rcx        # 0xd865f
>   10:	f7 d8                	neg    %eax
>   12:	64 89 01             	mov    %eax,%fs:(%rcx)
>   15:	48                   	rex.W
> [   19.294046][  T422] RSP: 002b:00007ffe07ac3298 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> [   19.294051][  T422] RAX: ffffffffffffffda RBX: 000055b5fb23ae30 RCX: 00007f8d36fda779
> [   19.294054][  T422] RDX: 0000000000000000 RSI: 000055b5e55e332b RDI: 0000000000000004
> [   19.294056][  T422] RBP: 0000000000000000 R08: 0000000000000000 R09: 000055b5fb23c020
> [   19.294059][  T422] R10: 0000000000000000 R11: 0000000000000246 R12: 000055b5e55e332b
> [   19.294061][  T422] R13: 0000000000040000 R14: 000055b5fb23ade0 R15: 0000000000000000
> [   19.294069][  T422]  </TASK>
> [   19.294071][  T422] Disabling lock debugging due to kernel taint
> [   19.373082][  T422] BUG: Bad page state in process modprobe  pfn:163532
> [   19.373680][  T422] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x163532
> [   19.374387][  T422] flags: 0x8000000000000000(zone=2)
> [   19.374795][  T422] raw: 8000000000000000 dead000000000100 dead000000000122 0000000000000000
> [   19.375424][  T422] raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
> [   19.376107][  T422] page dumped because: nonzero _refcount
> [   19.376525][  T422] Modules linked in: torture
> [   19.376917][  T422] CPU: 0 UID: 0 PID: 422 Comm: modprobe Tainted: G    B               6.18.0-rc5-00422-gffb870b76682 #1 PREEMPT(none)  65c9d11eede624b36533d4efe2c3c7798fc76b60
> [   19.376925][  T422] Tainted: [B]=BAD_PAGE
> [   19.376927][  T422] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [   19.376930][  T422] Call Trace:
> [   19.376933][  T422]  <TASK>
> [   19.376936][  T422]  dump_stack_lvl (lib/dump_stack.c:123)
> [   19.376946][  T422]  ? show_regs_print_info (lib/dump_stack.c:104)
> [   19.376952][  T422]  ? smp_call_function_many (kernel/smp.c:784)
> [   19.376959][  T422]  bad_page (mm/page_alloc.c:?)
> [   19.376964][  T422]  __free_frozen_pages (mm/page_alloc.c:?)
> [   19.376972][  T422]  change_page_attr_set_clr (include/linux/list.h:372)
> [   19.376979][  T422]  ? __set_memory_prot (arch/x86/mm/pat/set_memory.c:2041)
> [   19.376984][  T422]  ? __set_memory_prot (arch/x86/mm/pat/set_memory.c:2041)
> [   19.376989][  T422]  ? trace_contention_end (include/trace/events/lock.h:122)
> [   19.376995][  T422]  ? do_raw_spin_lock (arch/x86/include/asm/atomic.h:107)
> [   19.377001][  T422]  set_memory_rox (arch/x86/mm/pat/set_memory.c:2327)
> [   19.377006][  T422]  ? set_memory_nx (arch/x86/mm/pat/set_memory.c:2123 arch/x86/mm/pat/set_memory.c:2312)
> [   19.377010][  T422]  ? set_memory_ro (arch/x86/mm/pat/set_memory.c:2321)
> [   19.377016][  T422]  ? _raw_spin_unlock (arch/x86/include/asm/preempt.h:95 include/linux/spinlock_api_smp.h:143 kernel/locking/spinlock.c:186)
> [   19.377023][  T422]  ? find_vmap_area (mm/vmalloc.c:2507)
> [   19.377028][  T422]  module_enable_text_rox (kernel/module/strict_rwx.c:40)
> [   19.377036][  T422]  complete_formation (kernel/module/main.c:3258)
> [   19.377042][  T422]  ? __might_fault (mm/memory.c:7142)
> [   19.377046][  T422]  ? post_relocation (kernel/module/main.c:3237)
> [   19.377051][  T422]  ? __might_fault (mm/memory.c:7142)
> [   19.377054][  T422]  ? init_build_id (kernel/module/kallsyms.c:?)
> [   19.377061][  T422]  load_module (kernel/module/main.c:3468)
> [   19.377069][  T422]  __se_sys_finit_module (kernel/module/main.c:? kernel/module/main.c:3713 kernel/module/main.c:3739 kernel/module/main.c:3723)
> [   19.377074][  T422]  ? __x64_sys_finit_module (kernel/module/main.c:3723)
> [   19.377081][  T422]  ? do_sys_openat2 (fs/open.c:1447)
> [   19.377089][  T422]  ? __ia32_sys_write (fs/read_write.c:754)
> [   19.377095][  T422]  ? do_sys_open (fs/open.c:1452)
> [   19.377100][  T422]  ? entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
> [   19.377104][  T422]  do_syscall_64 (arch/x86/entry/syscall_64.c:?)
> [   19.377111][  T422]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
> [   19.377115][  T422] RIP: 0033:0x7f8d36fda779
> [   19.377120][  T422] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 4f 86 0d 00 f7 d8 64 89 01 48

This is not a problem with this patch. It's actually a symptom of commit
bf9e4e30f3538 ("x86/mm: use pagetable_free()"). We're freeing ptdescs
that haven't been allocated from the ptdesc allocator - aka
pagetable_alloc().
