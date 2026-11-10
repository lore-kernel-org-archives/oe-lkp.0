Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794291112;
	b=HnQ8zwX6GbqNG72mEoIP1JGpjY6G5PmTIykKDHM3h53YX3wGiOvhtXSpYQZoP/kqXaMX
	 M27yCcVdgcW9NqN+t4iHAiFjrOq1dXBo651j97zQDdh9WYtJ+qjtwTb8GfbdSBLuvM3MK
	 x6GD8Qk2WoOpiCe5L4F02u5g2j2ier/E2L5oCFYnoxb8+zjkWBew3DPts4BxHxgYb6jij
	 8el+JH2PaD8uD+mo41R+XjMOyyW8vlrwB3h32fCuEsCaBY+5wi7vBLlkXrUEWaBTd12N3
	 A3qckP7olaM7I2PWqKkxeQ5EYd9BdGxd0Gh0AWq1+JlloFf+VGyDGMRJ5TBOV3Igrvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794291112;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=J7ho9KHW2LpE8+ntllco9bqf1cmWZ1C0VuDpbdArRa8=;
	b=wH/kNLWHNvG4WTEtvsFYC2hiUj9DcU05e61Q6KVU0yjhRCJJ8kzGf/OZIJZIO/JSNtps
	 NYGsXaId23ZT50hAJ2e/YVPPj/ZrmFjRHjhTWuNU55RL1GoVEpI9OPdxkPMetsRxDeVHy
	 b3hzke4QydxpMIVShI/gz5GhfQio94euKRspUZ+Kj+W3PtwfZXLzVarxCWyM3lBK7S7fv
	 khqhdw2EGjTwcVws4WTwTKFnwgDwvvFdAD1evv1uL7jPtNzw6MFkkr3T1C/sagYhNin/S
	 iDq9aU4lHEW5Sd7ZCFOObR8tcGrpDuJvpFM214zkLA6wEIyPmUVrQGrkOuDZQ7uLwHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="oHhHH/4h";
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76932606A31C
	for <oe-lkp@lists.linux.dev>; Tue, 10 Nov 2026 06:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76932606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oHhHH/4h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794291111; x=1825827111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O5I6Rl06WnAaj0F8oXYw40wmI61m5dys5Gdosy2rpLg=;
  b=oHhHH/4hp8y5BPuwPFya5EHFMmIUXLomJWGDX9jbp6NgkNIFsjtyLsLA
   gICFY1XT9URnIM7rOj+OJ38zEHYgFk54w9XHCbQqKbNbSB/u1zr6+OYTY
   JRESIo4kZJaoQWJ6uyBV8OoJsFSQdAXVw+2Yoj4ReNPk4p7ESM3CXcDDx
   GnJBXRhkwb68qG+F15yuzSB+BqU+u7o43AbNVO+sODWq/SV91JV0rTCPM
   rBzThLf/EfqSjj3BO/w7Mz7wFzEz/xwnqEmxwTlgX2b6OwWiUgNN6lfFx
   5KxnZAZNNM4dDm4f6hCgInKsvgq4W7ilTacSidVuIEtWRV2TVyTC+yqSq
   A==;
X-CSE-ConnectionGUID: z4UDjaf0Rb+39goiZFINRQ==
X-CSE-MsgGUID: syGA8pT0RWi7AIL9e9wjhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3065671"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3065671"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 22:11:50 -0800
X-CSE-ConnectionGUID: nZ3HXhNvQxWKpa1mxcsPOA==
X-CSE-MsgGUID: oMDTi2TnTUaxTMgbmNdNnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8211984"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 22:11:48 -0800
Date: Tue, 10 Nov 2026 14:11:45 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, yi1.lai@intel.com
Subject: [jimc:dyndbg-maple-clean] [dyndbg]  da769d641f:
 BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h
Message-ID: <202611100740.41c99f9e-lkp@intel.com>
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Hello,

kernel test robot noticed "BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h" on:

commit: da769d641f3e00c9a0cbfdfd5a378214d8bc7bac ("dyndbg: Cache dynamic prefixes in maple tree") https://github.com/jimc/linux.git dyndbg-maple-clean

in testcase: boot

config: x86_64-randconfig-2300-20261109
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu Broadwell-noTSX,enforce -smp 4 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202611100740.41c99f9e-lkp@intel.com


[   19.163631][  T211] BUG: sleeping function called from invalid context at include/linux/sched/mm.h:322
[   19.167079][  T211] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 211, name: modprobe
[   19.170072][  T211] preempt_count: 1, expected: 0
[   19.171730][  T211] RCU nest depth: 0, expected: 0
[   19.173465][  T211] locks held by modprobe/211: 3, on CPU#2:
[   19.175407][  T211]  #0: ffffffff85507870 ((module_notify_list).rwsem){++++}-{4:4}, at: blocking_notifier_call_chain (notifier.c:484 notifier.c:473)
[   19.178765][  T211]  #1: ffffffff858306c8 (ddebug_lock){+.+.}-{4:4}, at: ddebug_module_notify (dynamic_debug.c:2048 dynamic_debug.c:2087)
[   19.180757][  T211]  #2: ffffffff858304b8 (pr_prefixes_lock){....}-{3:3}, at: _raw_spin_lock_irqsave (locking/spinlock.c:181)
[   19.180784][  T211] irq event stamp: 6318
[   19.180787][  T211] hardirqs last  enabled at (6317): __free_object (linux/irqflags.h:266 (discriminator 1) debugobjects.c:536 (discriminator 1))
[   19.185875][  T211] hardirqs last disabled at (6318): __raw_spin_lock_irqsave (linux/spinlock_api_smp.h:153 (discriminator 1))
[   19.187982][  T211] softirqs last  enabled at (6194): local_bh_enable (linux/bottom_half.h:33)
[   19.189963][  T211] softirqs last disabled at (6192): local_bh_disable (linux/bottom_half.h:20)
[   19.191922][  T211] Preemption disabled at:
[   19.191927][  T211] preempt_count_add (sched/core.c:6065)
[   19.194238][  T211] CPU: 2 UID: 0 PID: 211 Comm: modprobe Tainted: G                T   7.4.0-rc2+ #1 PREEMPT
[   19.194245][  T211] Tainted: [T]=RANDSTRUCT
[   19.194247][  T211] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   19.194250][  T211] Call Trace:
[   19.194253][  T211]  <TASK>
[   19.194256][  T211]  dump_stack_lvl (dump_stack.c:94 dump_stack.c:120)
[   19.194264][  T211]  ? preempt_count_add (sched/core.c:6065)
[   19.194270][  T211]  dump_stack (dump_stack.c:129)
[   19.194275][  T211]  __might_resched (sched/core.c:9202)
[   19.194285][  T211]  __might_sleep (sched/core.c:9131)
[   19.194296][  T211]  might_alloc (linux/sched/mm.h:322 (discriminator 1) linux/sched/mm.h:314 (discriminator 1))
[   19.194302][  T211]  mtree_erase (maple_tree.c:6042)
[   19.194307][  T211]  ? __lock_acquired (locking/lockdep.c:6212 (discriminator 1))
[   19.194314][  T211]  ? mas_erase (maple_tree.c:5668)
[   19.194329][  T211]  ? __raw_spin_lock_irqsave (linux/spinlock_api_smp.h:156 (discriminator 1))
[   19.194338][  T211]  ddebug_drop_cached_prefix (dynamic_debug.c:2183)
[   19.194346][  T211]  ddebug_module_notify (dynamic_debug.c:2059 dynamic_debug.c:2087)
[   19.194357][  T211]  notifier_call_chain (notifier.c:86)
[   19.194367][  T211]  ? debug_smp_processor_id (smp_processor_id.c:58)
[   19.194378][  T211]  blocking_notifier_call_chain (notifier.c:485 notifier.c:473)
[   19.194388][  T211]  do_init_module (module/main.c:3238)
[   19.194402][  T211]  ? free_module (module/main.c:1476)
[   19.194415][  T211]  load_module (module/main.c:3619)
[   19.194435][  T211]  ? layout_and_allocate+0x540/0x540
[   19.194445][  T211]  ? __ia32_sys_fspick (??:?)
[   19.194459][  T211]  init_module_from_file (module/main.c:3819)
[   19.194465][  T211]  ? __ia32_sys_init_module (module/main.c:3676)
[   19.194488][  T211]  ? __this_cpu_preempt_check (smp_processor_id.c:64)
[   19.194496][  T211]  ? __kasan_check_read (kasan/shadow.c:31 (discriminator 1))
[   19.194503][  T211]  ? do_raw_spin_unlock (linux/instrumented.h:82 linux/atomic/atomic-instrumented.h:32 asm-generic/qspinlock.h:58 locking/spinlock_debug.c:101 locking/spinlock_debug.c:141)
[   19.194513][  T211]  idempotent_init_module (module/main.c:3831)
[   19.194522][  T211]  ? init_module_from_file (module/main.c:3820)
[   19.194526][  T211]  ? rcu_is_watching (linux/context_tracking.h:128 rcu/tree.c:753)
[   19.194541][  T211]  ? security_capable (security.c:674 (discriminator 4))
[   19.194550][  T211]  ? __fget_light (file.c:1344)
[   19.194559][  T211]  __do_sys_finit_module (module/main.c:3857)
[   19.194568][  T211]  __ia32_sys_finit_module (module/main.c:3841 module/main.c:3841)
[   19.194576][  T211]  ia32_sys_call (kbuild/obj/consumer/x86_64-randconfig-2300-20261109/./arch/x86/include/generated/asm/syscalls_32.h:351)
[   19.194581][  T211]  __do_fast_syscall_32 (x86/entry/syscall_32.c:79 x86/entry/syscall_32.c:286)
[   19.194590][  T211]  do_fast_syscall_32 (x86/entry/syscall_32.c:311)
[   19.194596][  T211]  do_SYSENTER_32 (x86/entry/syscall_32.c:349)
[   19.194600][  T211]  entry_SYSENTER_compat_after_hwframe (x86/entry/entry_64_compat.S:126)
[   19.194606][  T211] RIP: 0023:0xf7edd40c
[   19.194613][  T211] Code: d2 74 05 c1 e8 0c 89 02 8b 5d fc 31 c0 c9 31 d2 31 c9 c3 cc 90 90 90 90 90 90 90 90 90 90 0f 1f 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
All code
========
   0: d2 74 05 c1           shlb   %cl,-0x3f(%rbp,%rax,1)
   4: e8 0c 89 02 8b        call   0xffffffff8b028915
   9: 5d                    pop    %rbp
   a: fc                    cld
   b: 31 c0                 xor    %eax,%eax
   d: c9                    leave
   e: 31 d2                 xor    %edx,%edx
  10: 31 c9                 xor    %ecx,%ecx
  12: c3                    ret
  13: cc                    int3
  14: 90                    nop
  15: 90                    nop
  16: 90                    nop
  17: 90                    nop
  18: 90                    nop
  19: 90                    nop
  1a: 90                    nop
  1b: 90                    nop
  1c: 90                    nop
  1d: 90                    nop
  1e: 0f 1f 00              nopl   (%rax)
  21: 51                    push   %rcx
  22: 52                    push   %rdx
  23: 55                    push   %rbp
  24: 89 e5                 mov    %esp,%ebp
  26: 0f 34                 sysenter
  28: cd 80                 int    $0x80
  2a:*  5d                    pop    %rbp   <-- trapping instruction
  2b: 5a                    pop    %rdx
  2c: 59                    pop    %rcx
  2d: c3                    ret
  2e: cc                    int3
  2f: 90                    nop
  30: 90                    nop
  31: 90                    nop
  32: 90                    nop
  33: 90                    nop
  34: 90                    nop
  35: 90                    nop
  36: 90                    nop
  37: 90                    nop
  38: 90                    nop
  39: 90                    nop
  3a: 90                    nop
  3b: 90                    nop
  3c: 90                    nop
  3d: 90                    nop
  3e: 90                    nop
  3f: 90                    nop

Code starting with the faulting instruction ===========================================
   0: 5d                    pop    %rbp
   1: 5a                    pop    %rdx
   2: 59                    pop    %rcx
   3: c3                    ret
   4: cc                    int3
   5: 90                    nop
   6: 90                    nop
   7: 90                    nop
   8: 90                    nop
   9: 90                    nop
   a: 90                    nop
   b: 90                    nop
   c: 90                    nop
   d: 90                    nop
   e: 90                    nop
   f: 90                    nop
  10: 90                    nop
  11: 90                    nop
  12: 90                    nop
  13: 90                    nop
  14: 90                    nop
  15: 90                    nop


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261110/202611100740.41c99f9e-lkp@intel.com


--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

