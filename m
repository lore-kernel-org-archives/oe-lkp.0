Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793070433;
	b=I0xC9lyYOMP/8UqtVozpW8KbrLGe0dxdHHX8KuTQ8q0ToJxDxkkN0NCGNZz2yp36tR8P
	 wkOiVWJ/o1dCvFGatk3C9iEGzG6ioX4yTPSSf1ua5TfPag/N7G4Kp0S/pp9KAIsgKt57t
	 lssTPJrVxDPsQUddse2OpAhC7w4Q5yLt6rARipCPX7lbPbw1aiZrsEOH92qalXEFJ/TkY
	 jVMOpleTVKv8/MzZIOEWIlvng+zGEVUmwC125F0We/xd7BWqVXJTr8xeE9er1JzlpYTqt
	 rh1i4pspbv3Bzo5Jzczajs3mxGS6J8WOfWim2PTPzD3JPO5qdt3gg89xWcli3NpskIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793070433;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=zPsRhvAj2KjNdGnX8BKq1TiCS12g1Yck2EzZySS8ELc=;
	b=rSmA87Z6NCefEeat2VBo9Rt4NHxW+sCnTdCQcI1Q14c1hhEVt920LXLJvGQBADfVkoRs
	 VPC1J/beb5J9nwl0DC4e9cYvVCqT8DFd4L76s2A0BSuw0aDaIP5l6GwYKAqYbL+8c4FZL
	 ifyvDIqNz0TTKP+FVa1vUVqCFVsBbmFYgKiju0yY1paxPfXX8sgM3W6ummInfMx1SQXQs
	 Wdj6lgObGVob9bw8GT0dpsYb5RZfMaNXJ36BXRlnyOSdJikGvQZDKtQTUkYG07NRmM6eR
	 KnpRGC7G1SHW/fE3fC7oaBM4CLY0cnDNlZNfLRxRRNYEn0OaC+2VgcjJYZNXecLXy5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k9WJoWe9;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2CA606A322
	for <oe-lkp@lists.linux.dev>; Tue, 27 Oct 2026 03:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED2CA606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k9WJoWe9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793070434; x=1824606434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a337CpttHxENc6aU5FBXxE6RHOOLsQmPMK7UYRW+ghk=;
  b=k9WJoWe9G4vdZ89oCKCrk2VYW6/H15qOk0rV3WDrV41ksug+SAErbj9Z
   X2L9JrxWcZctUN9UTg5dncL9RiO8BHZXkC1lgziW2IMht56woHo01GJWI
   QZHkAGhAqTZfsXMyBUGgGYX4lxE/73s+Zjmv1Dae2UAQabZQK+UWHCgZf
   Of/DazHmFiSSQG5dNa1np0RsQTia4exS/GdXRDHfar6vnLl866z2Z/jpo
   9A6yjfEa9MFV+9LsNlhYIoxZ92Pb4YIUyVU314o8wrKvsRmLHoHC6VQkc
   p9wjvJJ2RXV/wSWa69B1zoYvA1t5lnkSJIvHwMfFz5lZFkFRkJ503d7b6
   Q==;
X-CSE-ConnectionGUID: BnMq9GmUSxGuydwBYaHLrQ==
X-CSE-MsgGUID: 1w/WGqNSSuyZgPHhbFafqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1769247"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1769247"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 20:07:13 -0700
X-CSE-ConnectionGUID: 6mCkHrXARl66SPYevaf3kQ==
X-CSE-MsgGUID: WZ06hZcFRbSdOMp6BmDR+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4515957"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 20:07:11 -0700
Date: Tue, 27 Oct 2026 11:07:07 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-media@vger.kernel.org,
	yi1.lai@intel.com
Subject: [sailus-media-tree:media-ref] [media]  696502a495:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202610271039.7cc92f63-lkp@intel.com>
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

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: 696502a4953ea062964ebe1f3b1a09a9d6c8a591 ("media: mc: Implement best effort media device removal safety sans refcount") git://linuxtv.org/sailus/media_tree.git media-ref

in testcase: boot

config: i386-randconfig-011-20250511
compiler: gcc-14
test machine: qemu-system-i386 -enable-kvm -cpu Icelake-Server-noTSX,enforce,lm=off -smp 4 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202610271039.7cc92f63-lkp@intel.com


[    5.959887][    T1] BUG: kernel NULL pointer dereference, address: 00000000
[    5.961338][    T1] #PF: supervisor read access in kernel mode
[    5.962189][    T1] #PF: error_code(0x0000) - not-present page
[    5.962189][    T1] *pde = 00000000
[    5.962189][    T1] Oops: Oops: 0000 [#1] SMP
[    5.962189][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G                T   7.3.0-rc1+ #1 PREEMPT(full)
[    5.962189][    T1] Tainted: [T]=RANDSTRUCT
[    5.962189][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    5.962189][    T1] EIP: strlen (x86/lib/string_32.c:148)
[    5.962189][    T1] Code: c4 ac 38 e0 74 09 84 c0 75 f7 be 01 00 00 00 89 f0 48 5e 5d 31 d2 c3 8d 76 00 3e 8d 74 26 00 55 83 c9 ff 89 e5 57 89 c7 31 c0 <f2> ae b8 fe ff ff ff 5f 5d 29 c8 31 c9 c3 66 90 3e 8d 74 26 00 85
All code
========
   0:	c4                   	(bad)
   1:	ac                   	lods   %ds:(%rsi),%al
   2:	38 e0                	cmp    %ah,%al
   4:	74 09                	je     0xf
   6:	84 c0                	test   %al,%al
   8:	75 f7                	jne    0x1
   a:	be 01 00 00 00       	mov    $0x1,%esi
   f:	89 f0                	mov    %esi,%eax
  11:	48 5e                	rex.W pop %rsi
  13:	5d                   	pop    %rbp
  14:	31 d2                	xor    %edx,%edx
  16:	c3                   	ret
  17:	8d 76 00             	lea    0x0(%rsi),%esi
  1a:	3e 8d 74 26 00       	ds lea 0x0(%rsi,%riz,1),%esi
  1f:	55                   	push   %rbp
  20:	83 c9 ff             	or     $0xffffffff,%ecx
  23:	89 e5                	mov    %esp,%ebp
  25:	57                   	push   %rdi
  26:	89 c7                	mov    %eax,%edi
  28:	31 c0                	xor    %eax,%eax
  2a:*	f2 ae                	repnz scas %es:(%rdi),%al		<-- trapping instruction
  2c:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  31:	5f                   	pop    %rdi
  32:	5d                   	pop    %rbp
  33:	29 c8                	sub    %ecx,%eax
  35:	31 c9                	xor    %ecx,%ecx
  37:	c3                   	ret
  38:	66 90                	xchg   %ax,%ax
  3a:	3e 8d 74 26 00       	ds lea 0x0(%rsi,%riz,1),%esi
  3f:	85                   	.byte 0x85

Code starting with the faulting instruction ===========================================
   0:	f2 ae                	repnz scas %es:(%rdi),%al
   2:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   7:	5f                   	pop    %rdi
   8:	5d                   	pop    %rbp
   9:	29 c8                	sub    %ecx,%eax
   b:	31 c9                	xor    %ecx,%ecx
   d:	c3                   	ret
   e:	66 90                	xchg   %ax,%ax
  10:	3e 8d 74 26 00       	ds lea 0x0(%rsi,%riz,1),%esi
  15:	85                   	.byte 0x85
[    5.962189][    T1] EAX: 00000000 EBX: 87846e08 ECX: ffffffff EDX: 00000000
[    5.962189][    T1] ESI: 00000000 EDI: 00000000 EBP: 80be5d90 ESP: 80be5d8c
[    5.962189][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010246
[    5.962189][    T1] CR0: 80050033 CR2: 00000000 CR3: 0347f000 CR4: 003506d0
[    5.962189][    T1] Call Trace:
[    5.962189][    T1]  simple_start_creating (linux/fortify-string.h:218 libfs.c:2302)
[    5.962189][    T1]  ? simple_pin_fs (libfs.c:1112)
[    5.962189][    T1]  debugfs_start_creating (debugfs/inode.c:397 debugfs/inode.c:362)
[    5.962189][    T1]  debugfs_create_dir (debugfs/inode.c:575)
[    5.962189][    T1]  __media_device_register (media/mc/mc-device.c:892 (discriminator 1))
[    5.962189][    T1]  vicodec_probe (media/test-drivers/vicodec/vicodec-core.c:2180)
[    5.962189][    T1]  platform_probe (base/platform.c:1507)
[    5.962189][    T1]  really_probe (base/dd.c:628 base/dd.c:706)
[    5.962189][    T1]  __driver_probe_device (base/dd.c:868)
[    5.962189][    T1]  driver_probe_device (base/dd.c:898)
[    5.962189][    T1]  __driver_attach (base/dd.c:1292 base/dd.c:1232)
[    5.962189][    T1]  ? __device_attach_driver (base/dd.c:1030)
[    5.962189][    T1]  bus_for_each_dev (base/bus.c:383)
[    5.962189][    T1]  driver_attach (base/dd.c:1310)
[    5.962189][    T1]  ? __device_attach_driver (base/dd.c:1030)
[    5.962189][    T1]  bus_add_driver (base/bus.c:763)
[    5.962189][    T1]  driver_register (base/driver.c:174)
[    5.962189][    T1]  __platform_driver_register (base/platform.c:995)
[    5.962189][    T1]  vicodec_init (media/test-drivers/vicodec/vicodec-core.c:2254)
[    5.962189][    T1]  ? cxd2880_spi_driver_init (media/spi/cxd2880-spi.c:663)
[    5.962189][    T1]  do_one_initcall (main.c:1357)
[    5.962189][    T1]  ? rdinit_setup (main.c:595)
[    5.962189][    T1]  ? debug_smp_processor_id (smp_processor_id.c:58)
[    5.962189][    T1]  ? rcu_is_watching (linux/context_tracking.h:128 rcu/tree.c:753)
[    5.962189][    T1]  do_initcalls (main.c:1419 (discriminator 1) main.c:1435 (discriminator 1))
[    5.962189][    T1]  kernel_init_freeable (main.c:1455 main.c:1670)
[    5.962189][    T1]  ? rest_init (main.c:727)
[    5.962189][    T1]  kernel_init (main.c:1560)
[    5.962189][    T1]  ret_from_fork (x86/kernel/process.c:158)
[    5.962189][    T1]  ? rest_init (main.c:727)
[    5.962189][    T1]  ret_from_fork_asm (x86/entry/entry_32.S:736)
[    5.962189][    T1]  entry_INT80_32 (x86/entry/entry_32.S:940)
[    5.962189][    T1] Modules linked in:
[    5.962189][    T1] CR2: 0000000000000000
[    5.962189][    T1] ---[ end trace 0000000000000000 ]---
[    5.962189][    T1] EIP: strlen (x86/lib/string_32.c:148)
[    5.962189][    T1] Code: c4 ac 38 e0 74 09 84 c0 75 f7 be 01 00 00 00 89 f0 48 5e 5d 31 d2 c3 8d 76 00 3e 8d 74 26 00 55 83 c9 ff 89 e5 57 89 c7 31 c0 <f2> ae b8 fe ff ff ff 5f 5d 29 c8 31 c9 c3 66 90 3e 8d 74 26 00 85
All code
========
   0:	c4                   	(bad)
   1:	ac                   	lods   %ds:(%rsi),%al
   2:	38 e0                	cmp    %ah,%al
   4:	74 09                	je     0xf
   6:	84 c0                	test   %al,%al
   8:	75 f7                	jne    0x1
   a:	be 01 00 00 00       	mov    $0x1,%esi
   f:	89 f0                	mov    %esi,%eax
  11:	48 5e                	rex.W pop %rsi
  13:	5d                   	pop    %rbp
  14:	31 d2                	xor    %edx,%edx
  16:	c3                   	ret
  17:	8d 76 00             	lea    0x0(%rsi),%esi
  1a:	3e 8d 74 26 00       	ds lea 0x0(%rsi,%riz,1),%esi
  1f:	55                   	push   %rbp
  20:	83 c9 ff             	or     $0xffffffff,%ecx
  23:	89 e5                	mov    %esp,%ebp
  25:	57                   	push   %rdi
  26:	89 c7                	mov    %eax,%edi
  28:	31 c0                	xor    %eax,%eax
  2a:*	f2 ae                	repnz scas %es:(%rdi),%al		<-- trapping instruction
  2c:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  31:	5f                   	pop    %rdi
  32:	5d                   	pop    %rbp
  33:	29 c8                	sub    %ecx,%eax
  35:	31 c9                	xor    %ecx,%ecx
  37:	c3                   	ret
  38:	66 90                	xchg   %ax,%ax
  3a:	3e 8d 74 26 00       	ds lea 0x0(%rsi,%riz,1),%esi
  3f:	85                   	.byte 0x85

Code starting with the faulting instruction ===========================================
   0:	f2 ae                	repnz scas %es:(%rdi),%al
   2:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   7:	5f                   	pop    %rdi
   8:	5d                   	pop    %rbp
   9:	29 c8                	sub    %ecx,%eax
   b:	31 c9                	xor    %ecx,%ecx
   d:	c3                   	ret
   e:	66 90                	xchg   %ax,%ax
  10:	3e 8d 74 26 00       	ds lea 0x0(%rsi,%riz,1),%esi
  15:	85                   	.byte 0x85


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261027/202610271039.7cc92f63-lkp@intel.com


--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


