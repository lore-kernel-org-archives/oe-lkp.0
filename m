Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792984554;
	b=kC3wXUnDRfupv9oxbmt7mhqqmbTi/Mebh6I89KIwEoKMgP6W1BQ9ATbPxA9wfgqBGJUy
	 gko5VqcLPtgG1vj+jRhzRqt9uhXrs4Fq40QOGfu5qqd9vzPG4WuGGhiAGeYd70nRN9soT
	 UOj2KYzT56wluKevbF51bH2wcuKmZ5zxi83sMwkurikr2CN8+Y8cN5ZczI7KzkLZLTFKP
	 7tCYSOZ26GMXfZMl845dQUE8Pe0nBPt2IRNhM9EwNEl5KIaZzL8GnsD2BLqoQP15v7lxP
	 K4UWu4ztqisx+AUCwm9I6ogrFd304vGtI7OeumzpJd8x7rJGi/EqJQgRrun2086rqXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792984554;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=ZZByl35p9L4BlCVvyh65OvB8AbnIxEQyABpEVYwOGXA=;
	b=fVpY7mAF+lSTMmhLNsrMWURaD0oNjRa1+G5zpo8ObTzKxV4/VFDP0/8/NyW9KibYfxvb
	 g67nr7N0IvO53VFOPjwlqVPr7tBvMNORloWI6bzlg4iRj+5jI44reGirgRClIC4hgLt4V
	 STR8/OfubSIuDQXvA+l/L4JUBn5yI9cb47y0uxFw6QixIfVNVtrMKYkcUsIVeq6QQNuAY
	 DIkgRQnClJacDt17hOAFVPbw9EYTF9rq/2y960750v38GtMuAF59NKM4s+n00yIINYwz/
	 rztUQg3qd7PtuQmy9/w3xo36FvGacYEFtqVzplgOZS8Wf4D6mQ8Mh3qd2PBlm0m7ooQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gxhkdid8;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43070606A320
	for <oe-lkp@lists.linux.dev>; Mon, 26 Oct 2026 03:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43070606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gxhkdid8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792984551; x=1824520551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/cgm4Os2nWWx7D3B94WrvKX+3UdH4e/JyXOwBqaaDpI=;
  b=Gxhkdid8joOz7VZ575PSCfwtGW9yyrl+7YJPz8dGQcwvIE7dvTPjabWL
   bWLMkzNI01ZM22Mss5CQzKRSMvmOI0Ph0rlzOIhasAuY0RBdbND/mAAxb
   w6a1KyJEWDnngx+elZjLwdKKZbXgZQ4H73IR1ExLTH4Ng8cGEXgFOBBrx
   qLOVZDiG97fZZuEEU7wLnj5sSXOaJvt+cAyPuYu5fYjgYRnHhv8oHGaLW
   ZTzrsXnyvllRIsvLhmz5ZcJqbAvGSPslPDtproj0JWJQhsZHSGlSF0l89
   oS/Pu5sWud4U2ZlnKb65cqDzVGFxMFbAfF0aovNGPgz99P9rCMOSa70Ag
   Q==;
X-CSE-ConnectionGUID: sx6V07rLSzOOt+FKqodrrQ==
X-CSE-MsgGUID: B7eoAIJfSher0GV5A/oLLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1661752"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1661752"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 20:15:51 -0700
X-CSE-ConnectionGUID: a8fRH+HhSnGwxEgoo32b7w==
X-CSE-MsgGUID: fw6t6X1vTom6gbyC47MdaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4534337"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 20:15:48 -0700
Date: Mon, 26 Oct 2026 11:15:44 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Dave Jiang <dave.jiang@intel.com>, Ingo Molnar <mingo@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Lechner <dlechner@baylibre.com>,
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>, yi1.lai@intel.com
Subject: [linus:master] [cleanup]  857d18f23a:
 WARNING:at_arch/x86/mm/fault.c:#do_user_addr_fault
Message-ID: <202610261034.27b7d516-lkp@intel.com>
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

kernel test robot noticed "WARNING:at_arch/x86/mm/fault.c:#do_user_addr_fault" on:

commit: 857d18f23ab17284d1b6de6f61f4e74958596376 ("cleanup: Introduce ACQUIRE() and ACQUIRE_ERR() for conditional locks") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linux-next/master 20a33c6b6cbe7e4805dfb6cd68816937443aa148]

in testcase: boot

config: i386-randconfig-1000-20261024
compiler: clang-22
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 4 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202610261034.27b7d516-lkp@intel.com



[   11.566677][    T1] ------------[ cut here ]------------
[   11.568949][    T1] WARNING: CPU: 0 PID: 1 at arch/x86/mm/fault.c:1276 do_user_addr_fault+0x383/0x400
[   11.575495][    T1] Modules linked in:
[   11.577054][    T1] CPU: 0 UID: 0 PID: 1 Comm: init Tainted: G                T   6.16.0-rc4-00001-g857d18f23ab1 #1 PREEMPTLAZY  a3ef0aab1ee9544918f8c1ad2e4db51d2fe98b85
[   11.581652][    T1] Tainted: [T]=RANDSTRUCT
[   11.582645][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   11.585110][    T1] EIP: do_user_addr_fault+0x383/0x400
[   11.586341][    T1] Code: 00 00 83 c4 04 e9 22 fe ff ff 89 f9 89 da ff 75 e4 e8 11 75 f6 ff 83 c4 04 e9 05 fd ff ff b0 01 84 c0 0f 84 3d fd ff ff eb 02 <0f> 0b 89 f9 eb 1f 8b 45 e8 8b 40 34 f7 d0 a8 03 75 a5 e8 26 cc 31
[   11.590683][    T1] EAX: 00000000 EBX: 00000000 ECX: 80000000 EDX: 00000000
[   11.592281][    T1] ESI: 81598000 EDI: 81705ed4 EBP: 81705eb0 ESP: 81705e88
[   11.593863][    T1] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068 EFLAGS: 00010046
[   11.595609][    T1] CR0: 80050033 CR2: 00000004 CR3: 6c8c8000 CR4: 000406d0
[   11.597203][    T1] Call Trace:
[   11.597982][    T1]  exc_page_fault+0x58/0xc0
[   11.599032][    T1]  ? pvclock_clocksource_read_nowd+0x180/0x180
[   11.600439][    T1]  ? entry_INT80_32+0x107/0x107
[   11.601541][    T1]  handle_exception+0x147/0x147
[   11.602644][    T1] EIP: do_int80_syscall_32+0x1b6/0x340
[   11.603893][    T1] Code: 5b 5d 31 c0 31 c9 31 d2 c3 e8 a6 3e 00 00 8b 46 0c 8b 08 f7 c1 1e 30 02 00 74 96 89 4e 08 a1 04 80 b6 87 85 c0 74 27 8b 45 00 <8b> 58 04 8b 4e 04 89 da e8 bd c0 8f fe 8b 46 04 89 da 8b 5e 04 e8
[   11.608196][    T1] EAX: 00000000 EBX: 85200bcb ECX: 00000010 EDX: 00000000
[   11.609759][    T1] ESI: 81705f70 EDI: 81705fb4 EBP: 81705fac ESP: 81705f30
[   11.611343][    T1] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068 EFLAGS: 00010002
[   11.613100][    T1]  ? entry_INT80_32+0x107/0x107
[   11.614207][    T1]  ? pvclock_clocksource_read_nowd+0x180/0x180
[   11.615601][    T1]  ? pvclock_clocksource_read_nowd+0x180/0x180
[   11.616984][    T1]  ? do_int80_syscall_32+0x1b6/0x340
[   11.618174][    T1]  ? __this_cpu_preempt_check+0x8/0x40
[   11.619410][    T1]  ? lockdep_hardirqs_on+0x8f/0x140
[   11.620607][    T1]  ? entry_INT80_32+0x107/0x107
[   11.621712][    T1]  ? irqentry_exit+0x2f/0x80
[   11.622759][    T1]  ? exc_page_fault+0x7c/0xc0
[   11.623844][    T1]  entry_INT80_32+0x107/0x107
[   11.624921][    T1] EIP: 0x77e6f68a
[   11.625772][    T1] Code: 33 04 00 83 c4 10 85 ed 0f 85 ea 00 00 00 31 d2 b8 78 00 00 00 65 8b 3d 08 00 00 00 bb 11 00 20 01 83 c7 68 89 d1 89 d6 cd 80 <89> c7 3d 00 f0 ff ff 0f 87 71 01 00 00 85 ff 0f 85 99 00 00 00 8b
[   11.648329][    T1] EAX: 0000004e EBX: 01200011 ECX: 00000000 EDX: 00000000
[   11.651045][    T1] ESI: 00000000 EDI: 77dbeda8 EBP: 00000000 ESP: 7ff1f900
[   11.653829][    T1] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000202
[   11.656766][    T1] irq event stamp: 106522
[   11.658497][    T1] hardirqs last  enabled at (106521): [<853113c0>] wake_up_new_task+0x100/0x1c0
[   11.661952][    T1] hardirqs last disabled at (106522): [<86b60949>] do_int80_syscall_32+0x109/0x340
[   11.665602][    T1] softirqs last  enabled at (106504): [<85271c40>] local_bh_enable+0x0/0x40
[   11.673657][    T1] softirqs last disabled at (106502): [<85271e00>] local_bh_disable+0x0/0x40
[   11.677104][    T1] ---[ end trace 0000000000000000 ]---
[   11.679177][    T1] BUG: kernel NULL pointer dereference, address: 00000004
[   11.681834][    T1] #PF: supervisor read access in kernel mode
[   11.684116][    T1] #PF: error_code(0x0000) - not-present page
[   11.686324][    T1] *pde = 00000000
[   11.687755][    T1] Oops: Oops: 0000 [#1]
[   11.688761][    T1] CPU: 0 UID: 0 PID: 1 Comm: init Tainted: G        W       T   6.16.0-rc4-00001-g857d18f23ab1 #1 PREEMPTLAZY  a3ef0aab1ee9544918f8c1ad2e4db51d2fe98b85
[   11.692143][    T1] Tainted: [W]=WARN, [T]=RANDSTRUCT
[   11.693308][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   11.695611][    T1] EIP: do_int80_syscall_32+0x1b6/0x340
[   11.696859][    T1] Code: 5b 5d 31 c0 31 c9 31 d2 c3 e8 a6 3e 00 00 8b 46 0c 8b 08 f7 c1 1e 30 02 00 74 96 89 4e 08 a1 04 80 b6 87 85 c0 74 27 8b 45 00 <8b> 58 04 8b 4e 04 89 da e8 bd c0 8f fe 8b 46 04 89 da 8b 5e 04 e8
[   11.701146][    T1] EAX: 00000000 EBX: 85200bcb ECX: 00000010 EDX: 00000000
[   11.702701][    T1] ESI: 81705f70 EDI: 81705fb4 EBP: 81705fac ESP: 81705f30
[   11.704284][    T1] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068 EFLAGS: 00010002
[   11.705989][    T1] CR0: 80050033 CR2: 00000004 CR3: 6c8c8000 CR4: 000406d0
[   11.707559][    T1] Call Trace:
[   11.708332][    T1]  ? __this_cpu_preempt_check+0x8/0x40
[   11.709541][    T1]  ? lockdep_hardirqs_on+0x8f/0x140
[   11.710693][    T1]  ? entry_INT80_32+0x107/0x107
[   11.711786][    T1]  ? irqentry_exit+0x2f/0x80
[   11.712837][    T1]  ? exc_page_fault+0x7c/0xc0
[   11.713896][    T1]  entry_INT80_32+0x107/0x107
[   11.714947][    T1] EIP: 0x77e6f68a
[   11.715798][    T1] Code: 33 04 00 83 c4 10 85 ed 0f 85 ea 00 00 00 31 d2 b8 78 00 00 00 65 8b 3d 08 00 00 00 bb 11 00 20 01 83 c7 68 89 d1 89 d6 cd 80 <89> c7 3d 00 f0 ff ff 0f 87 71 01 00 00 85 ff 0f 85 99 00 00 00 8b
[   11.720097][    T1] EAX: 0000004e EBX: 01200011 ECX: 00000000 EDX: 00000000
[   11.721656][    T1] ESI: 00000000 EDI: 77dbeda8 EBP: 00000000 ESP: 7ff1f900
[   11.723218][    T1] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000202
[   11.724944][    T1] Modules linked in:
[   11.725828][    T1] CR2: 0000000000000004
[   11.726767][    T1] ---[ end trace 0000000000000000 ]---
[   11.728079][    T1] EIP: do_int80_syscall_32+0x1b6/0x340
[   11.730139][    T1] Code: 5b 5d 31 c0 31 c9 31 d2 c3 e8 a6 3e 00 00 8b 46 0c 8b 08 f7 c1 1e 30 02 00 74 96 89 4e 08 a1 04 80 b6 87 85 c0 74 27 8b 45 00 <8b> 58 04 8b 4e 04 89 da e8 bd c0 8f fe 8b 46 04 89 da 8b 5e 04 e8
[   11.750135][    T1] EAX: 00000000 EBX: 85200bcb ECX: 00000010 EDX: 00000000
[   11.752854][    T1] ESI: 81705f70 EDI: 81705fb4 EBP: 81705fac ESP: 81705f30
[   11.755587][    T1] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068 EFLAGS: 00010002
[   11.758498][    T1] CR0: 80050033 CR2: 00000004 CR3: 6c8c8000 CR4: 000406d0
[   11.761268][    T1] Kernel panic - not syncing: Fatal exception
[   11.763564][    T1] Kernel Offset: disabled
[   11.765213][    T1] Rebooting in 30 seconds..


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261026/202610261034.27b7d516-lkp@intel.com


--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

