Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1956B36C9D5
	for <oe-lkp@lists.linux.dev>; Fri, 21 Aug 2026 03:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787281900; cv=none; b=Djyj8fNZ15ChuapNnAd96LLC6utr7GZOTexczOVSRFh4J4rsyPOz7Ttu6gBf/aZ2ukURs3kProdToUwOJKKWBo6sGm6KuvRSIoYIfH3I29xI4XEot0HHgSpDOC2AXjZyxruWcQIO+gh3TE5P4AY92jLnFE2kj9gqf1U/y9MRVI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787281900; c=relaxed/simple;
	bh=OBojmc5PqdxU95nbIGYge7QZZgc1Y5ObhrU7piNikdw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QZFAXFETaH9kuJpigbD1iznJmHAjnvxkDe41Zf/iMpkctzjk4lt9Emgk1h41OvNaSZRtqTDgLldP8mXC29vQ0WRoKGyXIua6Uj2jvFkqv6qJiHS5fS7afczBqN9HatdDY6129o3qkGGuw8cKCqXfp7aD5RvfH5SWwZY9t5tsvIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rxum43JS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rxum43JS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787281897; x=1818817897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OBojmc5PqdxU95nbIGYge7QZZgc1Y5ObhrU7piNikdw=;
  b=Rxum43JSM7EzeHnFHVAD+UwFhA+++sumq6X+LvA7Ryxf3MrPicv0FaJI
   TrrriPceC+bUvl7jjcllOM4/RyHEdpWQW0QiP8IrtrZafytZ/cFhgrnWf
   ChuN4HE6ryOzMd1pmD0TCiZVZaHX8a3xMyqCLT3C7oArWDM870NJcfXx/
   G0FeOtCIBwALSGhrAyKdCMhsuatUhTzebtKM2IVLFLdcXlcXJy9n2lqkK
   zHJwxocLEineLEaYB7Ao3MBXbYlafzOontL4bwkOEm3UboQtl4EvJrg67
   cJkgQSGdYBsVizptina3zVQnZlEy89bHSUVWiVCAtrnPZ0eg5cMEmazfA
   w==;
X-CSE-ConnectionGUID: zWKljpawQCSuSH3FKPC+1Q==
X-CSE-MsgGUID: VyNvAcnDSW6/bz8UBkIOeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87595383"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="87595383"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 20:11:31 -0700
X-CSE-ConnectionGUID: J11+mKP2QgOX0pI4J9HQxw==
X-CSE-MsgGUID: c+/WkZ3CTW6HtohWuIVVww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="264917838"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 20:11:30 -0700
Date: Fri, 21 Aug 2026 11:11:27 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, yi1.lai@intel.com
Subject: [jimc:dd-ratelimit-2] [lib/dynamic_debug]  29d01faf08:
 Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN
Message-ID: <202608210932.fe556b16-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Hello,

kernel test robot noticed "Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN" on:

commit: 29d01faf08d63c34e46af173536be5af2aaab4fb ("lib/dynamic_debug: Refactor ddebug_arena to vmalloc backing") https://github.com/jimc/linux.git dd-ratelimit-2

in testcase: boot

config: x86_64-randconfig-076-20260819
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)

If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202608210932.fe556b16-lkp@intel.com



[    3.318502][    T1] BUG: sleeping function called from invalid context at include/linux/sched/mm.h:323
[    3.320918][    T1] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1, name: swapper/0
[    3.322846][    T1] preempt_count: 1, expected: 0
[    3.324116][    T1] RCU nest depth: 0, expected: 0
[    3.325518][    T1] 1 lock held by swapper/0/1:
[    3.326720][    T1]  #0: ffffffffa589ac98 ((dd_builtin_site_map.mt).ma_lock){+.+.}-{3:3}, at: arena_mtree_store_range (linux/spinlock.h:342 maple_tree.c:5704)
[    3.329140][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.2.0+ #1 PREEMPT(full)
[    3.329153][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    3.329158][    T1] Call Trace:
[    3.329163][    T1]  <TASK>
[    3.329168][    T1]  dump_stack_lvl (dump_stack.c:94 dump_stack.c:120)
[    3.329186][    T1]  dump_stack (dump_stack.c:129)
[    3.329193][    T1]  __might_resched.cold (sched/core.c:9197)
[    3.329205][    T1]  __might_sleep (sched/core.c:9126)
[    3.329214][    T1]  __kmalloc_cache_node_noprof (linux/sched/mm.h:323 (discriminator 1) slub.c:4537 (discriminator 1) slub.c:4897 (discriminator 1) slub.c:5504 (discriminator 1))
[    3.329223][    T1]  ? check_prev_add (locking/lockdep.c:3242 (discriminator 2))
[    3.329233][    T1]  ? __get_vm_area_node (linux/slab.h:1193 vmalloc.c:3237)
[    3.329245][    T1]  __get_vm_area_node (linux/slab.h:1193 vmalloc.c:3237)
[    3.329259][    T1]  __vmalloc_node_range_noprof (vmalloc.c:4064)
[    3.329268][    T1]  ? ddebug_arena_alloc_node+0x148/0x380
[    3.329284][    T1]  ? __vmalloc_area_node (x86/include/asm/bitops.h:202 (discriminator 1))
[    3.329292][    T1]  ? mark_held_locks (locking/lockdep.c:4325)
[    3.329301][    T1]  __vmalloc_node_noprof (vmalloc.c:4165 (discriminator 4))
[    3.329308][    T1]  ? ddebug_arena_alloc_node+0x148/0x380
[    3.329315][    T1]  ? trace_hardirqs_on (trace/trace_preemptirq.c:79 (discriminator 1))
[    3.329328][    T1]  vmalloc_noprof (vmalloc.c:4200)
[    3.329335][    T1]  ddebug_arena_alloc_node+0x148/0x380
[    3.329347][    T1]  ddebug_arena_alloc (dynamic_debug.c:121)
[    3.329354][    T1]  mas_alloc_nodes (arena_maple_tree.c:155 maple_tree.c:139 maple_tree.c:1089)
[    3.329365][    T1]  ? lock_is_held_type (locking/lockdep.c:5601 locking/lockdep.c:5940)
[    3.329379][    T1]  arena_mas_store_gfp (maple_tree.c:3719 maple_tree.c:4893)
[    3.329396][    T1]  ? arena_mtree_alloc_cyclic (maple_tree.c:5858)
[    3.329414][    T1]  ? ddebug_increment_call_count (dynamic_debug.c:201)
[    3.329421][    T1]  arena_mtree_store_range (maple_tree.c:5705)
[    3.329429][    T1]  ? arena_mas_store_gfp (linux/maple_tree.h:796 (discriminator 4))
[    3.329452][    T1]  ddebug_store_tagged_range (dynamic_debug.c:489)
[    3.329462][    T1]  ddebug_grow_tree (dynamic_debug.c:527 (discriminator 1))
[    3.329483][    T1]  ddebug_condense_sites (dynamic_debug.c:565 dynamic_debug.c:556)
[    3.329494][    T1]  dynamic_debug_init (dynamic_debug.c:2758)
[    3.329503][    T1]  ? lockdep_hardirqs_on_prepare (locking/lockdep.c:4674)
[    3.329513][    T1]  ? dynamic_debug_init_control (dynamic_debug.c:2595)
[    3.329531][    T1]  ? dynamic_debug_init_control (dynamic_debug.c:2595)
[    3.329538][    T1]  do_one_initcall (main.c:1347)
[    3.329549][    T1]  ? trace_event_raw_event_initcall_level (trace/events/initcall.h:10)
[    3.329557][    T1]  ? __register_sysctl_table (linux/spinlock.h:390 proc/proc_sysctl.c:1402)
[    3.329577][    T1]  kernel_init_freeable (main.c:1454 (discriminator 1) main.c:1647 (discriminator 1))
[    3.329584][    T1]  ? rest_init (main.c:717)
[    3.329591][    T1]  kernel_init (main.c:1548)
[    3.329596][    T1]  ? rest_init (main.c:717)
[    3.329602][    T1]  ret_from_fork (x86/kernel/process.c:158)
[    3.329610][    T1]  ? exit_thread (x86/include/asm/bitops.h:202 (discriminator 1))
[    3.329615][    T1]  ? __kasan_check_read (kasan/shadow.c:31 (discriminator 1))
[    3.329624][    T1]  ? __switch_to (linux/instrumented.h:82 asm-generic/bitops/instrumented-non-atomic.h:141 linux/thread_info.h:133 linux/sched.h:2087 x86/include/asm/fpu/sched.h:34 x86/kernel/process_64.c:619)
[    3.329631][    T1]  ? rest_init (main.c:717)
[    3.329641][    T1]  ret_from_fork_asm (x86/entry/entry_64.S:245)
[    3.329664][    T1]  </TASK>
[    3.329882][    T1] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN
[    3.330111][    T1] KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
[    3.330111][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W           7.2.0+ #1 PREEMPT(full)
[    3.330111][    T1] Tainted: [W]=WARN
[    3.330111][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    3.330111][    T1] RIP: 0010:mas_wr_store_type (maple_tree.c:351 maple_tree.c:356 maple_tree.c:3685)
[    3.330111][    T1] Code: 79 18 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 51 07 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 59 18 30 db 48 89 da 48 c1 ea 03 <80> 3c 02 00 0f 85 a9 08 00 00 b8 06 00 00 00 f6 03 01 74 05 b8 08
All code
========
   0:	79 18                	jns    0x1a
   2:	48 89 fa             	mov    %rdi,%rdx
   5:	48 c1 ea 03          	shr    $0x3,%rdx
   9:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   d:	0f 85 51 07 00 00    	jne    0x764
  13:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  1a:	fc ff df 
  1d:	48 8b 59 18          	mov    0x18(%rcx),%rbx
  21:	30 db                	xor    %bl,%bl
  23:	48 89 da             	mov    %rbx,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
  2a:*	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)		<-- trapping instruction
  2e:	0f 85 a9 08 00 00    	jne    0x8dd
  34:	b8 06 00 00 00       	mov    $0x6,%eax
  39:	f6 03 01             	testb  $0x1,(%rbx)
  3c:	74 05                	je     0x43
  3e:	b8                   	.byte 0xb8
  3f:	08                   	.byte 0x8

Code starting with the faulting instruction ===========================================
   0:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   4:	0f 85 a9 08 00 00    	jne    0x8b3
   a:	b8 06 00 00 00       	mov    $0x6,%eax
   f:	f6 03 01             	testb  $0x1,(%rbx)
  12:	74 05                	je     0x19
  14:	b8                   	.byte 0xb8
  15:	08                   	.byte 0x8
[    3.330111][    T1] RSP: 0000:ffffc9000001f948 EFLAGS: 00010246
[    3.330111][    T1] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffc9000001fb30
[    3.330111][    T1] RDX: 0000000000000000 RSI: ffffffffa589ac98 RDI: ffffc9000001fb48
[    3.330111][    T1] RBP: ffffc9000001f998 R08: ffffc9000001fa60 R09: ffffffffffffffff
[    3.330111][    T1] R10: 0000000000000003 R11: ffffffffa1e01720 R12: 0000000000000000
[    3.330111][    T1] R13: ffffc9000001fa58 R14: 0000000000000000 R15: ffffffffffffffff
[    3.330111][    T1] FS:  0000000000000000(0000) GS:ffff88877653b000(0000) knlGS:0000000000000000
[    3.330111][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.330111][    T1] CR2: ffff88883ffff000 CR3: 00000003e52bb000 CR4: 00000000000406f0
[    3.330111][    T1] Call Trace:
[    3.330111][    T1]  <TASK>
[    3.330111][    T1]  ? lock_is_held_type (locking/lockdep.c:5601 locking/lockdep.c:5940)
[    3.330111][    T1]  arena_mas_store_gfp (maple_tree.c:3714 maple_tree.c:4893)
[    3.330111][    T1]  ? arena_mtree_alloc_cyclic (maple_tree.c:5858)
[    3.330111][    T1]  ? ddebug_increment_call_count (dynamic_debug.c:201)
[    3.330111][    T1]  arena_mtree_store_range (maple_tree.c:5705)
[    3.330111][    T1]  ? arena_mas_store_gfp (linux/maple_tree.h:796 (discriminator 4))
[    3.330111][    T1]  ddebug_store_tagged_range (dynamic_debug.c:489)
[    3.330111][    T1]  ddebug_grow_tree (dynamic_debug.c:527 (discriminator 1))
[    3.330111][    T1]  ddebug_condense_sites (dynamic_debug.c:565 dynamic_debug.c:556)
[    3.330111][    T1]  dynamic_debug_init (dynamic_debug.c:2758)
[    3.330111][    T1]  ? lockdep_hardirqs_on_prepare (locking/lockdep.c:4674)
[    3.330111][    T1]  ? dynamic_debug_init_control (dynamic_debug.c:2595)
[    3.330111][    T1]  do_one_initcall (main.c:1347)
[    3.330111][    T1]  ? trace_event_raw_event_initcall_level (trace/events/initcall.h:10)
[    3.330111][    T1]  ? __register_sysctl_table (linux/spinlock.h:390 proc/proc_sysctl.c:1402)
[    3.330111][    T1]  kernel_init_freeable (main.c:1454 (discriminator 1) main.c:1647 (discriminator 1))
[    3.330111][    T1]  ? rest_init (main.c:717)
[    3.330111][    T1]  kernel_init (main.c:1548)
[    3.330111][    T1]  ? rest_init (main.c:717)
[    3.330111][    T1]  ret_from_fork (x86/kernel/process.c:158)
[    3.330111][    T1]  ? exit_thread (x86/include/asm/bitops.h:202 (discriminator 1))
[    3.330111][    T1]  ? __kasan_check_read (kasan/shadow.c:31 (discriminator 1))
[    3.330111][    T1]  ? __switch_to (linux/instrumented.h:82 asm-generic/bitops/instrumented-non-atomic.h:141 linux/thread_info.h:133 linux/sched.h:2087 x86/include/asm/fpu/sched.h:34 x86/kernel/process_64.c:619)
[    3.330111][    T1]  ? rest_init (main.c:717)
[    3.330111][    T1]  ret_from_fork_asm (x86/entry/entry_64.S:245)
[    3.330111][    T1]  </TASK>
[    3.330111][    T1] Modules linked in:
[    3.330128][    T1] ---[ end trace 0000000000000000 ]---
[    3.332123][    T1] RIP: 0010:mas_wr_store_type (maple_tree.c:351 maple_tree.c:356 maple_tree.c:3685)
[    3.334118][    T1] Code: 79 18 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 51 07 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 59 18 30 db 48 89 da 48 c1 ea 03 <80> 3c 02 00 0f 85 a9 08 00 00 b8 06 00 00 00 f6 03 01 74 05 b8 08
All code
========
   0:	79 18                	jns    0x1a
   2:	48 89 fa             	mov    %rdi,%rdx
   5:	48 c1 ea 03          	shr    $0x3,%rdx
   9:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   d:	0f 85 51 07 00 00    	jne    0x764
  13:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  1a:	fc ff df 
  1d:	48 8b 59 18          	mov    0x18(%rcx),%rbx
  21:	30 db                	xor    %bl,%bl
  23:	48 89 da             	mov    %rbx,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
  2a:*	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)		<-- trapping instruction
  2e:	0f 85 a9 08 00 00    	jne    0x8dd
  34:	b8 06 00 00 00       	mov    $0x6,%eax
  39:	f6 03 01             	testb  $0x1,(%rbx)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260821/202608210932.fe556b16-lkp@intel.com



--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


