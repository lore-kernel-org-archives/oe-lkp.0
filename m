Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FD5386441
	for <oe-lkp@lists.linux.dev>; Thu,  8 Oct 2026 05:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437797; cv=none; b=XjJN+0+1ye01hz8ye58XX9H1rZZmqiodZf5dDLeZOYb69v9V6Xxu1uNydhyyfea0Sqc2v+ci0L1XuDujIa5jBcsxzgf+Ijz42rHvlPjfWv2KNj26loo9YLgLmKU7wV7vgyi3LqQlbwIgXWKi6KGvjsK2mryqUENec5BUs3+JlCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437797; c=relaxed/simple;
	bh=r6UU5bGPsQgav1u3ssZ1Uk4b1N+MN1c1e5CDO4eRIzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KAcQY7vt66LrbA8bbfddMaS5go8D7USZQrtJ2WVjEbQRAcHA0nm7Z8efQEGbnfVy3JNnx/6qoXPJne+yJ6oLRGho82VZ42PAdpyu0yu50bwVDqybzjjv8vnDh/pj/zuvs+isxlaK0i5hP5boJdlFauCBV+CkLxRoIkN6TtfcUro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NP1rQQkM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NP1rQQkM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791437795; x=1822973795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r6UU5bGPsQgav1u3ssZ1Uk4b1N+MN1c1e5CDO4eRIzk=;
  b=NP1rQQkMSL0SCe5YWsxbqM4pGKI5kH4g9rAmE9TMdzLvDRbp/5cjE+jq
   AryPznDx7UD47evNXJiPAJvXLV2eGUk1YH5XyWqDu/QH9fSsBTmtLFFAu
   DVn9iI32yG3lBZ8vPkjB/vm9ek/m5bz6qfBgo5OXWGn/ySDIJfe9QSSDx
   20xh3DoB7jjkhammiHo2mqNq6q55bl7Jr3/UlGOohkjVK00b3OY3W6yE/
   ++VFbksxVwn7EeY33Cgdh/9OttRa+9nTgaBjPW43YVKZnBtfBMLuwpxke
   rH5YAvTwiMGg5fJwPrGBjQ9M3FqsvPMxv2oIte9BtsrgUXyMOHGKX9otT
   w==;
X-CSE-ConnectionGUID: iVaPiqYUTESaDbkUZEg2mg==
X-CSE-MsgGUID: gcyl1ru5RnmknX5D7clmJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="207780"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="207780"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 22:36:34 -0700
X-CSE-ConnectionGUID: q3aD8Z/ARc22KaNEBX+aMw==
X-CSE-MsgGUID: ECfCvq+5QhGyLfRW5xbdlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="27222"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 22:36:33 -0700
Date: Thu, 8 Oct 2026 13:36:29 +0800
From: kernel test robot <yi1.lai@intel.com>
To: "Liam R. Howlett" <liam@infradead.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, maple-tree@lists.infradead.org,
	linux-mm@kvack.org, yi1.lai@intel.com
Subject: [liam:maple_marks_v4] [maple_tree]  f44e0ea8d4:
 WARNING:at_lib/maple_tree.c:#node_clear_tail
Message-ID: <202610081209.cf3a5ca-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hello,

kernel test robot noticed "WARNING:at_lib/maple_tree.c:#node_clear_tail" on:

commit: f44e0ea8d474ab9cb65305ae34780f1984515e1c ("maple_tree: Explicitly set node values to avoid clearing entire node") https://git.kernel.org/cgit/linux/kernel/git/liam/linux.git maple_marks_v4

in testcase: boot

config: x86_64-randconfig-011-20260914
compiler: clang-22
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 4 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)

If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202610081209.cf3a5ca-lkp@intel.com


[    2.612810][    T0] ------------[ cut here ]------------
[    2.615535][    T0] WARNING: lib/maple_tree.c:2447 at node_clear_tail+0x3ee/0x480, CPU#0: swapper/0/0
[    2.620115][    T0] Modules linked in:
[    2.622063][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G                T   7.3.0-rc1-00774-gf44e0ea8d474 #1 PREEMPT(full)
[    2.627914][    T0] Tainted: [T]=RANDSTRUCT
[    2.630014][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    2.635145][    T0] RIP: 0010:node_clear_tail (maple_tree.c:2447)
[    2.637935][    T0] Code: 05 cf b0 7e 01 48 3b 44 24 20 75 58 48 83 c4 28 5b 41 5c 41 5d 41 5e 41 5f 5d 31 c0 31 c9 31 ff 31 d2 31 f6 c3 e8 e2 af b5 fb <0f> 0b eb d0 e8 d9 af b5 fb 48 c7 c7 c0 5e aa b6 48 8b 74 24 08 e8
All code
========
   0:	05 cf b0 7e 01       	add    $0x17eb0cf,%eax
   5:	48 3b 44 24 20       	cmp    0x20(%rsp),%rax
   a:	75 58                	jne    0x64
   c:	48 83 c4 28          	add    $0x28,%rsp
  10:	5b                   	pop    %rbx
  11:	41 5c                	pop    %r12
  13:	41 5d                	pop    %r13
  15:	41 5e                	pop    %r14
  17:	41 5f                	pop    %r15
  19:	5d                   	pop    %rbp
  1a:	31 c0                	xor    %eax,%eax
  1c:	31 c9                	xor    %ecx,%ecx
  1e:	31 ff                	xor    %edi,%edi
  20:	31 d2                	xor    %edx,%edx
  22:	31 f6                	xor    %esi,%esi
  24:	c3                   	ret
  25:	e8 e2 af b5 fb       	call   0xfffffffffbb5b00c
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	eb d0                	jmp    0xfffffffffffffffe
  2e:	e8 d9 af b5 fb       	call   0xfffffffffbb5b00c
  33:	48 c7 c7 c0 5e aa b6 	mov    $0xffffffffb6aa5ec0,%rdi
  3a:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  3f:	e8                   	.byte 0xe8

Code starting with the faulting instruction ===========================================
   0:	0f 0b                	ud2
   2:	eb d0                	jmp    0xffffffffffffffd4
   4:	e8 d9 af b5 fb       	call   0xfffffffffbb5afe2
   9:	48 c7 c7 c0 5e aa b6 	mov    $0xffffffffb6aa5ec0,%rdi
  10:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  15:	e8                   	.byte 0xe8
[    2.647533][    T0] RSP: 0000:ffffffffb5a07980 EFLAGS: 00010046
[    2.650539][    T0] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
[    2.654515][    T0] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[    2.658372][    T0] RBP: 0000000000000002 R08: 0000000000000000 R09: 0000000000000000
[    2.662307][    T0] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000010
[    2.666281][    T0] R13: 0000000000000010 R14: ffffffffb572b002 R15: ffff8881022e8400
[    2.670252][    T0] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
[    2.674548][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.677741][    T0] CR2: ffff88843ffff000 CR3: 000000009d634000 CR4: 00000000000000b0
[    2.681737][    T0] Call Trace:
[    2.683296][    T0]  <TASK>
[    2.684659][    T0]  mas_wr_store_entry (maple_tree.c:3805)
[    2.687291][    T0]  ? early_irq_init (irq/irqdesc.c:195)
[    2.689639][    T0]  ? start_kernel (main.c:1088)
[    2.691946][    T0]  ? x86_64_start_reservations (x86/kernel/head64.c:310)
[    2.694726][    T0]  ? x86_64_start_kernel (x86/kernel/head64.c:291)
[    2.697359][    T0]  ? common_startup_64 (x86/kernel/head_64.S:418)
[    2.699845][    T0]  mas_store_gfp (maple_tree.c:5973)
[    2.702060][    T0]  early_irq_init (irq/irqdesc.c:195)
[    2.704262][    T0]  start_kernel (main.c:1088)
[    2.706233][    T0]  x86_64_start_reservations (x86/kernel/head64.c:310)
[    2.708590][    T0]  x86_64_start_kernel (x86/kernel/head64.c:291)
[    2.710834][    T0]  common_startup_64 (x86/kernel/head_64.S:418)
[    2.712798][    T0]  </TASK>
[    2.714169][    T0] irq event stamp: 0
[    2.716054][    T0] hardirqs last  enabled at (0): 0x0
[    2.719576][    T0] hardirqs last disabled at (0): 0x0
[    2.722938][    T0] softirqs last  enabled at (0): 0x0
[    2.725737][    T0] softirqs last disabled at (0): 0x0
[    2.729141][    T0] ---[ end trace 0000000000000000 ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261008/202610081209.cf3a5ca-lkp@intel.com


--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


