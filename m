Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096009;
	b=spyict/Gr2GU+vnM3U/PL7wVsuENyy04/H4apP+B4vgc2/PBiqaLYKb8JXZRsEvTEceO
	 oryuJh+3Me7CPACAv+DiSTjMZsdfcwffD3MBuz6ZPOWQ+tqwkU0tV32tRSQbe9q+zF0cY
	 mE3Hdfr6R+TinkuUtCP7sTjVuXixU9fK4d1BbRZWwwSPvkPOxTu4flYb4QGoQ+x/jhACB
	 1QljtXMk1X7uY/U0MWouC0xU7jwoMTUAjXDb+OGvNFF/iFarenSMvihFodvUlzXTOXJrx
	 y2PMawa+0OZ3wq8a6bv0dmDm8GIBlApGZcCXZCUPW2gurctHCcU9h0J2tCvWgBHrBkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096009;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=wSmbSMa4CovFFGInQbCR5V4xYc9TbCKdwrqTybFEdv0=;
	b=hWSQPKIq1GGACNfl026lNiVfZ/JG/xvB9FuPXjxY0lmKrAgY1lNl6/TNpDcOpu4RLdbM
	 w9xsVlD3I4p2tsHAB/6LTORE/GQJ/dTTSSAQa6zZx51Qst0TedDr/JrraZODO2hhzCu10
	 IfNkRglCxMNPAKg6xSo2IYCz1l7lNmzr7Bf8qTyb35hwBzHF2WKWnILuBCYu0Fsn4Ik43
	 cOpat1Hkv5UlwigWTzwaYTUk9JBl8QwB4Rs1FASKah+iIJVif+7tkXV7KwatZydDvgnHB
	 qAD2ri83wmxwK0gB30OYvqHfuItCojryA5KUSVTZe/+CM1x5n6xBaMxvyhrWnCBqQDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VM2QDrR7;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16228606A327
	for <oe-lkp@lists.linux.dev>; Tue, 27 Oct 2026 10:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16228606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VM2QDrR7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793096009; x=1824632009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b6/IRIYz2rZBGce9vEVwxi8BYJnaCz4KnTySL3JpW3c=;
  b=VM2QDrR7TsHXi+1XvHI5ToC2FSOOMbWCKFMGf6n3ccC3GSZDlpgMH/uj
   y2H2bd9kymr3gGPbrDqV7UUQanp/Y2lFKVg6csvwJsKrRUJVU1940VPmH
   ckI/fpvEugGX2SBtXwd3USi1ZUnSKnGwjiadMPUP+5lGHR4dRnkMICkTQ
   QTq4mesVrNgANtjRt3us0UYUuqlFjaZcRUoArTV1ho4R0uOWoCULUAstI
   NiknEqaLB/m9g4A4XDGtXabV6C5HBmp8RireTAJiIG/qGh+lqch1ydM7g
   5066dHyV+1lzbQqro1EZpyybTtjR4nLyKjXArPj3mc2RC3use/7rKtG8b
   Q==;
X-CSE-ConnectionGUID: U1rFYpPPTXyg+6GNJBoRZA==
X-CSE-MsgGUID: /YzfoV6aQIGF8Gd13JJNHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1673449"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1673449"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:13:29 -0700
X-CSE-ConnectionGUID: pL9Lq6TOR8SDpd6BKCdDow==
X-CSE-MsgGUID: W5QszjDMRxK3DXuB0p1G0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4461266"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:13:28 -0700
Date: Tue, 27 Oct 2026 18:13:24 +0800
From: kernel test robot <yi1.lai@intel.com>
To: linux+lkp@weissschuh.net
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, yi1.lai@intel.com
Subject: [thomas-weissschuh:b4/auxclock-nanosleep] [hrtimer]  95a3b02eeb:
 WARNING:at_kernel/time/hrtimer.c:#hrtimer_reprogram
Message-ID: <202610271722.78446447-lkp@intel.com>
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

kernel test robot noticed "WARNING:at_kernel/time/hrtimer.c:#hrtimer_reprogram" on:

commit: 95a3b02eeb6c329f1851fbed517c6b90c834fa66 ("hrtimer: Replace locking and IRQ comments to lockdep assertions") https://git.kernel.org/cgit/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep

in testcase: boot

config: i386-randconfig-1004-20261027
compiler: gcc-14
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 4 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202610271722.78446447-lkp@intel.com


[   44.814477][    C1] ------------[ cut here ]------------
[   44.816337][    C1] debug_locks && !(lock_is_held(&(&cpu_base->lock)->dep_map) != 0)
[   44.816342][    C1] WARNING: kernel/time/hrtimer.c:853 at hrtimer_reprogram+0x100/0x140, CPU#1: swapper/1/0
[   44.821528][    C1] Modules linked in:
[   44.822836][    C1] CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 7.3.0+ #1 PREEMPT  ce315383a4e0bcc6512b561f6c0000737bff77d2
[   44.826026][    C1] EIP: hrtimer_reprogram+0x100/0x140
[   44.827211][    C1] Code: 59 40 31 c0 89 fb 39 d6 19 c3 0f 4d d6 0f 4d c7 89 51 38 89 41 3c 83 c4 0c 5b 5e 5f 5d 31 c0 31 d2 31 c9 c3 8d b6 00 00 00 00 <0f> 0b 85 ff 0f 89 60 ff ff ff 8d b6 00 00 00 00 0f 0b e9 53 ff ff
[   44.831575][    C1] EAX: 00000000 EBX: f4fd9a74 ECX: f500d598 EDX: 00000000
[   44.833207][    C1] ESI: a3567ec3 EDI: 0000000a EBP: 84d4ddb4 ESP: 84d4dd9c
[   44.834776][    C1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00210046
[   44.836745][    C1] CR0: 80050033 CR2: 0807fff2 CR3: 764e5000 CR4: 00040690
[   44.861973][    C1] Call Trace:
[   44.863100][    C1]  hrtimer_start_range_ns+0xcc/0x140
[   44.864789][    C1]  start_dl_timer+0xc0/0x240
[   44.866198][    C1]  update_curr_dl_se+0x35b/0x540
[   44.867805][    C1]  task_tick_idle+0xe7/0x100
[   44.869325][    C1]  sched_tick+0x111/0x400
[   44.870778][    C1]  update_process_times+0x9a/0x100
[   44.876743][    C1]  tick_nohz_handler+0x95/0x1c0
[   44.878484][    C1]  ? sysvec_call_function_single+0x40/0x40
[   44.880954][    C1]  tick_nohz_lowres_handler+0x31/0x80
[   44.883064][    C1]  __sysvec_apic_timer_interrupt+0x62/0x2c0
[   44.884788][    C1]  sysvec_apic_timer_interrupt+0x1a/0x40
[   44.886078][    C1]  handle_exception+0x14d/0x14d
[   44.887195][    C1] EIP: pv_native_safe_halt+0xb/0x40
[   44.888398][    C1] Code: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc eb 07 0f 00 2d b0 f4 a0 82 fb f4 <c3> cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc
[   44.892834][    C1] EAX: 00000000 EBX: 84dea680 ECX: 00000000 EDX: 00000000
[   44.894411][    C1] ESI: 00000000 EDI: 00000000 EBP: 84d4df48 ESP: 84d4df44
[   44.895999][    C1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00200246
[   44.897688][    C1]  ? do_settimeofday64+0x13b/0x280
[   44.898810][    C1]  ? sysvec_call_function_single+0x40/0x40
[   44.900114][    C1]  ? sysvec_call_function_single+0x40/0x40
[   44.901403][    C1]  ? pv_native_safe_halt+0xb/0x40
[   44.902635][    C1]  ? default_idle+0x8/0x40
[   44.903633][    C1]  arch_cpu_idle+0x8/0x40
[   44.904605][    C1]  default_idle_call+0x6c/0xc0
[   44.905700][    C1]  cpuidle_idle_call+0x189/0x200
[   44.906823][    C1]  ? trace_irq_disable+0xd5/0x140
[   44.907952][    C1]  do_idle+0x92/0x100
[   44.908846][    C1]  cpu_startup_entry+0x25/0x40
[   44.909903][    C1]  start_secondary+0xfa/0x140
[   44.910939][    C1]  startup_32_smp+0x151/0x154
[   44.912027][    C1] irq event stamp: 51612
[   44.912957][    C1] hardirqs last  enabled at (51611): [<811e7489>] cpuidle_idle_call+0x189/0x200
[   44.914959][    C1] hardirqs last disabled at (51612): [<829e5a0c>] sysvec_apic_timer_interrupt+0xc/0x40
[   44.917110][    C1] softirqs last  enabled at (51606): [<829fb9ca>] __do_softirq+0xa/0xe
[   44.918940][    C1] softirqs last disabled at (51583): [<829fb9ca>] __do_softirq+0xa/0xe
[   44.920881][    C1] ---[ end trace 0000000000000000 ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261027/202610271722.78446447-lkp@intel.com



--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


