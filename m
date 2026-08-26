Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00A71DD0EF
	for <oe-lkp@lists.linux.dev>; Wed, 26 Aug 2026 02:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787711936; cv=none; b=tM1+fG+EErBPAY0I83zKEYfs1NrG6hPBuSD0dZkj0B/PEPwBLObPfEGK1VtlOxoojQE/Zqgh5h7sa1sAnbzOnzeroyf0klArz/+I+47HtUWaP4u3IliqBEwJq/B9hvbb00Gv8fQ7Nqnf1ezn8w1NujugumlgytVoIS5bDjHKDng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787711936; c=relaxed/simple;
	bh=TwpRv1lNCr9MU2GKfWE4oRqYhc8rHTy7DYg5dPa1XqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=syo2IXHKbq4gh3ns8t+rTIsEgKJzpN6drwp7VULY47hFKhxEU0d8rJinEYyS7A8Sfs3qB3L5qNDo0sK+yQaUCpfIP3C19hYJDnttF3J0S8cdp3XcPGHpjAZqwHj7uSnsphd9IW/M1yt8Quw1YCskEraDoT3/3F7H1vbaYNtc1IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CPFluBxA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CPFluBxA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787711935; x=1819247935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TwpRv1lNCr9MU2GKfWE4oRqYhc8rHTy7DYg5dPa1XqQ=;
  b=CPFluBxA6vR0Tyf0jIQsNGF1iQAiyS39CJgT6d+CQFSuf2AHOkyA2jWl
   ZOZipolICMq5I3lslSNZ41mXEho/Urryu8MR5gXZ8iDcsbF2ESt/ks2sz
   LvA/+Ax0Wlpd78LrxSDPkVsiXSATjIPAa5AYM54VRtprp6dvLveuEDMke
   /UgO3YXHwyhbBpEdeYeS/jS3ZdW4w03EAcCA+irbViVLnUhUWu/6eUSB2
   OouYavTBey4bDb/6ak+k8R/IlNAgT676DNYPmv06ocsjHAeIv56pwfV4Y
   Z/0BUmRADYdqIWKZV70hnDfm26qVORLYfSfKfKhK/DnrVpHI4bcbUe+bt
   w==;
X-CSE-ConnectionGUID: IeoWFqAvRjGDL4iIlIVL+g==
X-CSE-MsgGUID: YPM41fedSxKQjjw8rDcjcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="87317427"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="87317427"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 19:38:54 -0700
X-CSE-ConnectionGUID: SlB1WVdoSP28nVF/i/tVnA==
X-CSE-MsgGUID: 4Un6m4BQSf6Id9HYF/2tZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="265653826"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 19:38:51 -0700
Date: Wed, 26 Aug 2026 10:38:48 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, yi1.lai@intel.com
Subject: [jimc:jump-batch-apply-fixed] [x86/jump_label]  c80bbdac99:
 BUG:unable_to_handle_page_fault_for_address
Message-ID: <202608261049.66dbc9f6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hello,

kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" on:

commit: c80bbdac99096eb3f00e5c3a18d275b9e07fe0ef ("x86/jump_label: use system_state < SYSTEM_RUNNING for early boot fallback") https://github.com/jimc/linux.git jump-batch-apply-fixed

in testcase: trinity
version: trinity-i386-abe9de86-1_20230429 with following parameters:

	runtime: 300s
	group: group-04
	nr_groups: 5



config: x86_64-randconfig-102-20260813
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)

If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202608261049.66dbc9f6-lkp@intel.com

[  161.700046][   T10] BUG: unable to handle page fault for address: ffffffff866d0d8b
[  161.700327][   T10] #PF: supervisor write access in kernel mode
[  161.700327][   T10] #PF: error_code(0x0003) - permissions violation
[  161.700327][   T10] PGD 9343067 P4D 9343067 PUD 9344063 PMD 66000a1
[  161.700327][   T10] Oops: Oops: 0003 [#1] KASAN PTI
[  161.700327][   T10] CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Tainted: G                T   7.2.0-rc6+ #1 PREEMPT(lazy)
[  161.700327][   T10] Tainted: [T]=RANDSTRUCT
[  161.700327][   T10] Workqueue: events once_deferred
[  161.700327][   T10] RIP: 0010:memcpy_orig (x86/lib/memcpy_64.S:164)
[  161.700327][   T10] Code: 16 fc 89 0f 44 89 44 17 fc c3 cc 66 66 2e 0f 1f 84 00 00 00 00 00 83 ea 01 72 19 0f b6 0e 74 12 4c 0f b6 46 01 4c 0f b6 0c 16 <44> 88 47 01 44 88 0c 17 88 0f c3 cc cc cc cc cc cc cc cc cc cc cc
All code
========
   0:	16                   	(bad)
   1:	fc                   	cld
   2:	89 0f                	mov    %ecx,(%rdi)
   4:	44 89 44 17 fc       	mov    %r8d,-0x4(%rdi,%rdx,1)
   9:	c3                   	ret
   a:	cc                   	int3
   b:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  12:	00 00 00 00 
  16:	83 ea 01             	sub    $0x1,%edx
  19:	72 19                	jb     0x34
  1b:	0f b6 0e             	movzbl (%rsi),%ecx
  1e:	74 12                	je     0x32
  20:	4c 0f b6 46 01       	movzbq 0x1(%rsi),%r8
  25:	4c 0f b6 0c 16       	movzbq (%rsi,%rdx,1),%r9
  2a:*	44 88 47 01          	mov    %r8b,0x1(%rdi)		<-- trapping instruction
  2e:	44 88 0c 17          	mov    %r9b,(%rdi,%rdx,1)
  32:	88 0f                	mov    %cl,(%rdi)
  34:	c3                   	ret
  35:	cc                   	int3
  36:	cc                   	int3
  37:	cc                   	int3
  38:	cc                   	int3
  39:	cc                   	int3
  3a:	cc                   	int3
  3b:	cc                   	int3
  3c:	cc                   	int3
  3d:	cc                   	int3
  3e:	cc                   	int3
  3f:	cc                   	int3

Code starting with the faulting instruction ===========================================
   0:	44 88 47 01          	mov    %r8b,0x1(%rdi)
   4:	44 88 0c 17          	mov    %r9b,(%rdi,%rdx,1)
   8:	88 0f                	mov    %cl,(%rdi)
   a:	c3                   	ret
   b:	cc                   	int3
   c:	cc                   	int3
   d:	cc                   	int3
   e:	cc                   	int3
   f:	cc                   	int3
  10:	cc                   	int3
  11:	cc                   	int3
  12:	cc                   	int3
  13:	cc                   	int3
  14:	cc                   	int3
  15:	cc                   	int3
[  161.700327][   T10] RSP: 0000:ffffc900000afad8 EFLAGS: 00210002
[  161.700327][   T10] RAX: ffffffff866d0d8a RBX: 0000000000000002 RCX: 0000000000000066
[  161.700327][   T10] RDX: 0000000000000001 RSI: ffffffff876529a1 RDI: ffffffff866d0d8a
[  161.700327][   T10] RBP: ffffc900000afaf8 R08: 0000000000000090 R09: 0000000000000090
[  161.700327][   T10] R10: ffffffff866d0d8b R11: ffffffff8996e6a0 R12: ffffffff876529a1
[  161.700327][   T10] R13: ffffffff866d0d8a R14: ffffffff876529a1 R15: ffffffff89001338
[  161.700327][   T10] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
[  161.700327][   T10] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  161.700327][   T10] CR2: ffffffff866d0d8b CR3: 0000000009340000 CR4: 00000000000406f0
[  161.700327][   T10] Call Trace:
[  161.700327][   T10]  <TASK>
[  161.700327][   T10]  ? __asan_memcpy (kasan/shadow.c:109)
[  161.700327][   T10]  ? flow_hash_from_keys (core/flow_dissector.c:1820)
[  161.700327][   T10]  text_poke_early (x86/kernel/alternative.c:2505 (discriminator 6))
[  161.700327][   T10]  jump_label_transform+0x8f/0x100
[  161.700327][   T10]  ? sched_clock_noinstr (x86/kernel/tsc.c:274)
[  161.700327][   T10]  arch_jump_label_transform_queue (x86/kernel/jump_label.c:120 x86/kernel/jump_label.c:132)
[  161.700327][   T10]  ? __kasan_check_read (kasan/shadow.c:31 (discriminator 1))
[  161.700327][   T10]  __jump_label_update (jump_label.c:549 (discriminator 1))
[  161.700327][   T10]  jump_label_update_key (jump_label.c:962)
[  161.700327][   T10]  ? process_one_work (workqueue.c:3297 (discriminator 1))
[  161.700327][   T10]  static_key_disable_cpuslocked (jump_label.c:967 jump_label.c:241)
[  161.700327][   T10]  static_key_disable (jump_label.c:249)
[  161.700327][   T10]  once_deferred (once.c:20)
[  161.700327][   T10]  process_one_work (workqueue.c:3322)
[  161.700327][   T10]  ? __queue_delayed_work (workqueue.c:2575)
[  161.700327][   T10]  ? __this_cpu_preempt_check (smp_processor_id.c:64)
[  161.700327][   T10]  ? assign_work (workqueue.c:1233)
[  161.700327][   T10]  worker_thread (workqueue.c:3405 workqueue.c:3486)
[  161.700327][   T10]  ? trace_hardirqs_on (trace/trace_preemptirq.c:79 (discriminator 1))
[  161.700327][   T10]  kthread (kthread.c:436)
[  161.700327][   T10]  ? calculate_sigpending (linux/spinlock.h:402 signal.c:194)
[  161.700327][   T10]  ? rescuer_thread (x86/include/asm/current.h:23)
[  161.700327][   T10]  ? kthread_affine_node (linux/list.h:404 (discriminator 2))
[  161.700327][   T10]  ret_from_fork (x86/kernel/process.c:158)
[  161.700327][   T10]  ? __kasan_check_read (kasan/shadow.c:31 (discriminator 1))
[  161.700327][   T10]  ? arch_exit_to_user_mode_prepare+0x180/0x180
[  161.700327][   T10]  ? __switch_to (x86/kernel/process_64.c:619)
[  161.700327][   T10]  ? kthread_affine_node (linux/list.h:404 (discriminator 2))
[  161.700327][   T10]  ret_from_fork_asm (x86/entry/entry_64.S:245)
[  161.700327][   T10]  </TASK>
[  161.700327][   T10] Modules linked in:
[  161.700327][   T10] CR2: ffffffff866d0d8b
[  161.700327][   T10] ---[ end trace 0000000000000000 ]---
[  161.700327][   T10] RIP: 0010:memcpy_orig (x86/lib/memcpy_64.S:164)
[  161.700327][   T10] Code: 16 fc 89 0f 44 89 44 17 fc c3 cc 66 66 2e 0f 1f 84 00 00 00 00 00 83 ea 01 72 19 0f b6 0e 74 12 4c 0f b6 46 01 4c 0f b6 0c 16 <44> 88 47 01 44 88 0c 17 88 0f c3 cc cc cc cc cc cc cc cc cc cc cc
All code
========
   0:	16                   	(bad)
   1:	fc                   	cld
   2:	89 0f                	mov    %ecx,(%rdi)
   4:	44 89 44 17 fc       	mov    %r8d,-0x4(%rdi,%rdx,1)
   9:	c3                   	ret
   a:	cc                   	int3
   b:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  12:	00 00 00 00 
  16:	83 ea 01             	sub    $0x1,%edx
  19:	72 19                	jb     0x34
  1b:	0f b6 0e             	movzbl (%rsi),%ecx
  1e:	74 12                	je     0x32
  20:	4c 0f b6 46 01       	movzbq 0x1(%rsi),%r8
  25:	4c 0f b6 0c 16       	movzbq (%rsi,%rdx,1),%r9
  2a:*	44 88 47 01          	mov    %r8b,0x1(%rdi)		<-- trapping instruction
  2e:	44 88 0c 17          	mov    %r9b,(%rdi,%rdx,1)
  32:	88 0f                	mov    %cl,(%rdi)
  34:	c3                   	ret
  35:	cc                   	int3
  36:	cc                   	int3
  37:	cc                   	int3
  38:	cc                   	int3
  39:	cc                   	int3
  3a:	cc                   	int3
  3b:	cc                   	int3
  3c:	cc                   	int3
  3d:	cc                   	int3
  3e:	cc                   	int3
  3f:	cc                   	int3

Code starting with the faulting instruction ===========================================
   0:	44 88 47 01          	mov    %r8b,0x1(%rdi)
   4:	44 88 0c 17          	mov    %r9b,(%rdi,%rdx,1)
   8:	88 0f                	mov    %cl,(%rdi)
   a:	c3                   	ret
   b:	cc                   	int3
   c:	cc                   	int3
   d:	cc                   	int3
   e:	cc                   	int3
   f:	cc                   	int3
  10:	cc                   	int3
  11:	cc                   	int3
  12:	cc                   	int3
  13:	cc                   	int3
  14:	cc                   	int3
  15:	cc                   	int3


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260826/202608261049.66dbc9f6-lkp@intel.com



--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


