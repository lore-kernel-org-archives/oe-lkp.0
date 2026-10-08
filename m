Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7BA3ACEF1
	for <oe-lkp@lists.linux.dev>; Thu,  8 Oct 2026 08:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449279; cv=none; b=HNx1tT2VXSYgq1O9ZSHfZvx/QUvf/5u9lDw9BcVGsBgysCZFq2Hv3Rk61Jm/syalmd1Py/oW6qINO3N1DYDaPSFDIiqaY0xWaXIemPw2jDgQ7KtyVt9gcuhUtjiwrICqmol0ZGAUNtJXpa5GbM4WWkB83Ua6vqThki9kaCe0wdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449279; c=relaxed/simple;
	bh=6UBne/crIQWUbtdhCMx6Jv1LJ44XM0buNOCd76FukYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gwNr/PZZ+Van5AG7D7wlGi1EpLqklWMCU/5IqPzZqpbh+ImeTEdIW9oPitwFBeyyoeawEIsTME+IoYOlW5aaI/JUK+ZfBy1uGdYHUbzV/gHxI7Mpl0+0sfQ3RrjzMKUBE3D3HLj3hizXRGQ7qQ77aO1kwbB4n+HACFvqYk2JUec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/c5QQK/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/c5QQK/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791449278; x=1822985278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6UBne/crIQWUbtdhCMx6Jv1LJ44XM0buNOCd76FukYE=;
  b=T/c5QQK/8R2Yod4ecML59Yx6+Fu97u42W0GGLTX8J/Llv23Nnm5yx09f
   iczmabSqfWAoFvXf/DSwjSPNE7SoM+KNoM21W8ToVIrYSoa6iqH6seTt6
   +UiJwFZzQnMZvDX07yV8r6M/l7FoPe59/kCnZ9Ek8ZPa1rKhHq+AIlMWp
   EIkoHBiiCh/hHCUQTJDmxqvtzyWcUGQUg8dwEa7exrcah/Lsfh8rP6V4D
   SGs/PRSYWIABU1SU7o9zxoyE3rQ41zZGigth+Lq0q+q+9t7P0gWWQicE5
   8uFnAKZ8xCdQGFMgRYnbGKS8W0Rgm71B/1shjWRipjqFBBlLVQFmAWEbY
   Q==;
X-CSE-ConnectionGUID: ZtCcJjS/Soa95hZWB56jqw==
X-CSE-MsgGUID: 6TAXuuX5RHeA9c0UThQxVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="122293"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="122293"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 01:47:58 -0700
X-CSE-ConnectionGUID: AFW20hbGRnqP5F3UE77O4Q==
X-CSE-MsgGUID: A3QsyuBWQpyfScozdh+YYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="88578"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 01:47:56 -0700
Date: Thu, 8 Oct 2026 16:47:51 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, yi1.lai@intel.com
Subject: [jimc:dyndbg-maple-clean] [dyndbg]  a07d369682:
 WARNING:at_lib/dynamic_debug.c:#ddebug_condense_sites
Message-ID: <202610081631.816e3e40-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Hello,

kernel test robot noticed "WARNING:at_lib/dynamic_debug.c:#ddebug_condense_sites" on:

commit: a07d3696825a7aa1a5ce183115237bb12a36cb61 ("dyndbg: Save _ddebug_site fields into a maple-tree") https://github.com/jimc/linux.git dyndbg-maple-clean

in testcase: boot

config: i386-randconfig-1002-20260925
compiler: clang-22
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 4 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)

If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202610081631.816e3e40-lkp@intel.com

[    2.316457][    T1] ------------[ cut here ]------------
[    2.321483][    T1] di->descs.len != di->sites.len
[    2.321495][    T1] WARNING: lib/dynamic_debug.c:1746 at ddebug_condense_sites+0x518/0x540, CPU#0: swapper/0/1
[    2.332767][    T1] Modules linked in:
[    2.336097][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.3.0-rc1-00612-ga07d3696825a #1 PREEMPT
[    2.342762][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    2.356101][    T1] EIP: ddebug_condense_sites+0x518/0x540
[    2.361515][    T1] Code: 4e d5 44 ff 89 f2 8b 4d f0 83 c4 10 e9 97 fe ff ff 50 57 68 5c 07 74 43 68 78 ba 7d 43 e8 30 d5 44 ff 83 c4 10 e9 99 fe ff ff <0f> 0b e9 c5 fe ff ff 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
[    2.369434][    T1] EAX: 5555785d EBX: 44f5dc4c ECX: 44f5dc4c EDX: 44f75c40
[    2.376097][    T1] ESI: 437e97f1 EDI: 4414e918 EBP: 44f5dc08 ESP: 44f5dbe4
[    2.382764][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010293
[    2.389431][    T1] CR0: 80050033 CR2: ffd99000 CR3: 043e6000 CR4: 000406d0
[    2.398112][    T1] Call Trace:
[    2.401658][    T1]  ? blocking_notifier_chain_register+0x34/0x80
[    2.407856][    T1]  ? dynamic_debug_init+0xae/0x2c0
[    2.412440][    T1]  ? local_clock+0x13/0x40
[    2.416108][    T1]  ? _raw_spin_unlock_irqrestore+0x2d/0x80
[    2.421617][    T1]  ? _raw_spin_unlock_irqrestore+0x2d/0x80
[    2.427607][    T1]  ? add_device_randomness+0x5c/0x80
[    2.432771][    T1]  ? trace_hardirqs_on+0x46/0xc0
[    2.437426][    T1]  ? do_one_initcall+0x183/0x440
[    2.442438][    T1]  ? dyndbg_setup+0x40/0x40
[    2.446134][    T1]  ? kvm_sched_clock_read+0xd/0x40
[    2.450724][    T1]  ? local_clock+0x13/0x40
[    2.454371][    T1]  ? kvm_sched_clock_read+0xd/0x40
[    2.459432][    T1]  ? sched_clock_noinstr+0x8/0x10
[    2.464049][    T1]  ? local_clock_noinstr+0x36/0x140
[    2.467954][    T1]  ? __lock_acquire+0x594/0x2a00
[    2.472788][    T1]  ? kvm_sched_clock_read+0xd/0x40
[    2.477797][    T1]  ? sched_clock_noinstr+0x8/0x10
[    2.481233][    T1]  ? local_clock_noinstr+0x36/0x140
[    2.487457][    T1]  ? __lock_acquire+0x594/0x2a00
[    2.491348][    T1]  ? __alloc_empty_sheaf+0x43/0x80
[    2.496106][    T1]  ? kvm_sched_clock_read+0xd/0x40
[    2.501375][    T1]  ? sched_clock_noinstr+0x8/0x10
[    2.506102][    T1]  ? local_clock_noinstr+0x36/0x140
[    2.511189][    T1]  ? lock_acquire+0x9a/0x240
[    2.514437][    T1]  ? kvm_sched_clock_read+0xd/0x40
[    2.519438][    T1]  ? sched_clock_noinstr+0x8/0x10
[    2.524511][    T1]  ? local_clock_noinstr+0x36/0x140
[    2.529451][    T1]  ? local_clock+0x13/0x40
[    2.532779][    T1]  ? __register_sysctl_table+0x5c3/0x600
[    2.537879][    T1]  ? _raw_spin_unlock+0x1d/0x40
[    2.542772][    T1]  ? __register_sysctl_table+0x5c3/0x600
[    2.548083][    T1]  ? do_pre_smp_initcalls+0x33/0xc0
[    2.552267][    T1]  ? rest_init+0x180/0x180
[    2.556101][    T1]  ? kernel_init_freeable+0x5b/0x100
[    2.560764][    T1]  ? rest_init+0x180/0x180
[    2.564364][    T1]  ? kernel_init+0x1c/0x140
[    2.569434][    T1]  ? ret_from_fork+0x11e/0x240
[    2.572772][    T1]  ? rest_init+0x180/0x180
[    2.577059][    T1]  ? ret_from_fork_asm+0x12/0x20
[    2.581179][    T1]  ? entry_INT80_32+0xef/0xef
[    2.586130][    T1] irq event stamp: 1549
[    2.589427][    T1] hardirqs last  enabled at (1567): [<4113f85c>] __console_unlock+0x5c/0x80
[    2.596098][    T1] hardirqs last disabled at (1586): [<4113f843>] __console_unlock+0x43/0x80
[    2.606097][    T1] softirqs last  enabled at (262): [<42907d0f>] __do_softirq+0xf/0x11
[    2.612768][    T1] softirqs last disabled at (257): [<42907d0f>] __do_softirq+0xf/0x11
[    2.619431][    T1] ---[ end trace 0000000000000000 ]---
[    2.626105][    T1] BUG: kernel NULL pointer dereference, address: 00000000
[    2.629400][    T1] #PF: supervisor read access in kernel mode
[    2.629400][    T1] #PF: error_code(0x0000) - not-present page
[    2.629400][    T1] *pde = 00000000
[    2.629400][    T1] Oops: Oops: 0000 [#1]
[    2.629400][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W           7.3.0-rc1-00612-ga07d3696825a #1 PREEMPT
[    2.629400][    T1] Tainted: [W]=WARN
[    2.629400][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    2.629400][    T1] EIP: strcmp+0xe/0x40
[    2.629400][    T1] Code: 06 ac aa 84 c0 75 f7 31 c0 aa 89 d8 83 c4 04 5e 5f 5b 5d c3 90 90 90 90 90 90 90 90 3e 8d 74 26 00 55 89 e5 57 56 89 c6 89 d7 <ac> ae 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 5e 5f 5d c3 90 90
[    2.629400][    T1] EAX: 00000000 EBX: 0000000c ECX: 5555785c EDX: 437e97f1
[    2.629400][    T1] ESI: 00000000 EDI: 437e97f1 EBP: 44f5dc08 ESP: 44f5dc00
[    2.629400][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010297
[    2.629400][    T1] CR0: 80050033 CR2: 00000000 CR3: 043e6000 CR4: 000406d0
[    2.629400][    T1] Call Trace:
[    2.629400][    T1]  ? dynamic_debug_init+0xe0/0x2c0
[    2.629400][    T1]  ? _raw_spin_unlock_irqrestore+0x2d/0x80
[    2.629400][    T1]  ? add_device_randomness+0x5c/0x80
[    2.629400][    T1]  ? trace_hardirqs_on+0x46/0xc0
[    2.629400][    T1]  ? do_one_initcall+0x183/0x440
[    2.629400][    T1]  ? dyndbg_setup+0x40/0x40
[    2.629400][    T1]  ? kvm_sched_clock_read+0xd/0x40
[    2.629400][    T1]  ? local_clock+0x13/0x40
[    2.629400][    T1]  ? kvm_sched_clock_read+0xd/0x40
[    2.629400][    T1]  ? sched_clock_noinstr+0x8/0x10
[    2.629400][    T1]  ? local_clock_noinstr+0x36/0x140
[    2.629400][    T1]  ? __lock_acquire+0x594/0x2a00
[    2.629400][    T1]  ? kvm_sched_clock_read+0xd/0x40
[    2.629400][    T1]  ? sched_clock_noinstr+0x8/0x10
[    2.629400][    T1]  ? local_clock_noinstr+0x36/0x140
[    2.629400][    T1]  ? __lock_acquire+0x594/0x2a00
[    2.629400][    T1]  ? __alloc_empty_sheaf+0x43/0x80
[    2.629400][    T1]  ? kvm_sched_clock_read+0xd/0x40
[    2.629400][    T1]  ? sched_clock_noinstr+0x8/0x10
[    2.629400][    T1]  ? local_clock_noinstr+0x36/0x140
[    2.629400][    T1]  ? lock_acquire+0x9a/0x240
[    2.629400][    T1]  ? kvm_sched_clock_read+0xd/0x40
[    2.629400][    T1]  ? sched_clock_noinstr+0x8/0x10
[    2.629400][    T1]  ? local_clock_noinstr+0x36/0x140
[    2.629400][    T1]  ? local_clock+0x13/0x40
[    2.629400][    T1]  ? __register_sysctl_table+0x5c3/0x600
[    2.629400][    T1]  ? _raw_spin_unlock+0x1d/0x40
[    2.629400][    T1]  ? __register_sysctl_table+0x5c3/0x600
[    2.629400][    T1]  ? do_pre_smp_initcalls+0x33/0xc0
[    2.629400][    T1]  ? rest_init+0x180/0x180
[    2.629400][    T1]  ? kernel_init_freeable+0x5b/0x100
[    2.629400][    T1]  ? rest_init+0x180/0x180
[    2.629400][    T1]  ? kernel_init+0x1c/0x140
[    2.629400][    T1]  ? ret_from_fork+0x11e/0x240
[    2.629400][    T1]  ? rest_init+0x180/0x180
[    2.629400][    T1]  ? ret_from_fork_asm+0x12/0x20
[    2.629400][    T1]  ? entry_INT80_32+0xef/0xef
[    2.629400][    T1] Modules linked in:
[    2.629400][    T1] CR2: 0000000000000000
[    2.629400][    T1] ---[ end trace 0000000000000000 ]---
[    2.629400][    T1] EIP: strcmp+0xe/0x40
[    2.629400][    T1] Code: 06 ac aa 84 c0 75 f7 31 c0 aa 89 d8 83 c4 04 5e 5f 5b 5d c3 90 90 90 90 90 90 90 90 3e 8d 74 26 00 55 89 e5 57 56 89 c6 89 d7 <ac> ae 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 5e 5f 5d c3 90 90
[    2.629400][    T1] EAX: 00000000 EBX: 0000000c ECX: 5555785c EDX: 437e97f1
[    2.629400][    T1] ESI: 00000000 EDI: 437e97f1 EBP: 44f5dc08 ESP: 44f5dc00
[    2.629400][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010297
[    2.629400][    T1] CR0: 80050033 CR2: 00000000 CR3: 043e6000 CR4: 000406d0
[    2.629400][    T1] Kernel panic - not syncing: Fatal exception


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261008/202610081631.816e3e40-lkp@intel.com


--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

