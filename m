Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A64C19E992
	for <oe-lkp@lists.linux.dev>; Thu, 20 Aug 2026 03:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787195812; cv=none; b=PLgYmpHdsQ+czDtZhQ8lYVQLHTZqrSiPPT47neOiR0vcWWJw/pX+0MuQsGP4eMmRhi/w7HMVAwNRM7ArVC1ck3DpUvBtKq5eu6CXMm6WfFkPJJuG4WTI8d6aghgUFgNTAagx36DK2ciWSxL+bz2rSHmLV2JdKeC9PfxdupRDiBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787195812; c=relaxed/simple;
	bh=JlpUUVqukRo9okl42yoO6/1+ut70cvfi6YdxVqN1KIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q8UtVg86mZ/9mIQ0jtSzSvcz4W/jhs/PUAOhQ2xw2UYuc0gGK9RNjqJcmHYGIIHQ2ILUj0tdMglyo7lUvrSP4ldJVMAOBj3vyrRQnaey2nLoYCMTjbH/FMeb53TSWKs/sfBw5Xur15wmnE8sjedC4R8OD+uByEK4V8TE4g2Lx18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U6OR2BwX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6OR2BwX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787195810; x=1818731810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JlpUUVqukRo9okl42yoO6/1+ut70cvfi6YdxVqN1KIU=;
  b=U6OR2BwXKaVRx+SAs/vQWTuUj8ZvQe6Ag4Dl//UI/ci7ityxmlo0vKQ9
   s5dX1bDCK4SG+TaztgUOTu6J6EpR1GLya3setDuw470BckS61wURw0oBT
   rOND0gpQ03DYjRHwaUH6MrgyUH/YXlFFYdQmdJ0hMAgPWAaEcg49bVwMg
   aT2SbRMeMDPsmFsuNADas5nGkJSuloXsEdTTpKlXp8ICihyOR9pPVggQ7
   yVWMRcMdDoZwK4xMFhCCEhpu6NF6qCADJZDl4mEvVMBpYfLQm7aXRdO57
   mUkuhp+mKoIK6Y1YdAZ85Rb8zdnmA1MCxZd3vO6jAzIKdH7h6e6Wknlag
   Q==;
X-CSE-ConnectionGUID: z9uB5vDMSJSr4OFkpQpLug==
X-CSE-MsgGUID: H19z3cLiQv6nhdbjvzDC8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87929061"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="87929061"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 20:16:50 -0700
X-CSE-ConnectionGUID: coXhzAqRQnuPaSLFusNuIQ==
X-CSE-MsgGUID: lImGOZeARryT1x2D2VVMoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="259630954"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 20:16:47 -0700
Date: Thu, 20 Aug 2026 11:16:44 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>, Yury Norov <ynorov@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	yi1.lai@intel.com
Subject: [linus:master] [rust]  b7b8b4ccda: CFI_failure_at_do_one_initcall
Message-ID: <202608201017.100a4511-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Hello,

kernel test robot noticed "CFI_failure_at_do_one_initcall" on:

commit: b7b8b4ccdad45a59aafa5cfc32a51fe1ee5cb680 ("rust: extract `bitfield!` macro from `register!`") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test still failed on linus/master 8d3ae59288f1e7d58d76558a6ee96d533bc5019]

in testcase: rcutorture
with following parameters:

    runtime: 300s
    test: cpuhotplug
    torture_type: tasks-tracing



config: x86_64-randconfig-015-20260715
compiler: clang-22
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)

If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202608201017.100a4511-lkp@intel.com


[   16.811904][    T1] CFI failure at do_one_initcall+0x12e/0x478 (target: _RINvCsdamrQDJyPhn_8pin_init6zeroedNtNvNvNvCsdPKRummocL6_25doctests_kernel_generated33rust_doctest_kernel_bitfield_rs_04main43__doctest_main_rust_kernel_bitfield_rs_118_05FlagsEBE_+0x0/0x4; expected type: 0x6fbb3035)
[   16.820524][    T1] WARNING: at do_one_initcall+0x12e/0x478, CPU#0: swapper/0/1
[   16.823875][    T1] Modules linked in:
[   16.825674][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.1.0-rc4-00055-gb7b8b4ccdad4 #1 PREEMPT  79da7d58e576708b28b47c0dd4cca3fe34a229fd
[   16.831720][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   16.836267][    T1] RIP: 0010:do_one_initcall+0x12e/0x478
[   16.838287][    T1] Code: d2 31 c9 e8 74 04 49 00 45 84 f6 75 0c 48 8d 3d 90 03 a1 0c 67 48 0f b9 3a 4c 8b 5c 24 08 41 ba cb cf 44 90 45 03 53 fc 74 02 <0f> 0b 2e e8 42 96 f8 06 41 89 c6 0f 1f 44 00 00 41 81 e5 ff ff ff
[   16.843506][    T1] RSP: 0018:ffffc9000001fb80 EFLAGS: 00010a13
[   16.845121][    T1] RAX: 0000000000000000 RBX: dffffc0000000000 RCX: 0000000000000000
[   16.847279][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[   16.849427][    T1] RBP: ffffc9000001fe70 R08: 0000000000000000 R09: 0000000b8a3be5a2
[   16.851619][    T1] R10: 000000006c292bb6 R11: ffffffff81407458 R12: ffffffff8f899850
[   16.853771][    T1] R13: 0000000080000000 R14: 0000000000000001 R15: 1ffffffff1edab41
[   16.855915][    T1] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
[   16.858307][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   16.860091][    T1] CR2: 00007fd1104620ac CR3: 000000000ba86000 CR4: 00000000000406b0
[   16.862236][    T1] Call Trace:
[   16.863144][    T1]  <TASK>
[   16.863961][    T1]  ? __cfi__RINvCsdamrQDJyPhn_8pin_init6zeroedNtNvNvNvCsdPKRummocL6_25doctests_kernel_generated33rust_doctest_kernel_bitfield_rs_04main43__doctest_main_rust_kernel_bitfield_rs_118_05FlagsEBE_+0x8/0x8
[   16.869044][    T1]  ? stack_depot_save_flags+0x40f/0xab8
[   16.870574][    T1]  ? irqentry_exit+0x1b8/0x638
[   16.871878][    T1]  ? trace_irq_disable+0x25/0x100
[   16.873243][    T1]  ? __cfi_ignore_unknown_bootoption+0x8/0x8
[   16.874861][    T1]  ? strlen+0x32/0x78
[   16.875952][    T1]  ? parameq+0x1a/0xf8
[   16.877070][    T1]  ? __cfi_ignore_unknown_bootoption+0x8/0x8
[   16.878666][    T1]  ? parse_args+0x17e/0x538
[   16.879902][    T1]  do_initcall_level+0x10e/0x1c0
[   16.881314][    T1]  do_initcalls+0x59/0xc0
[   16.882501][    T1]  kernel_init_freeable+0x11e/0x1c0
[   16.883889][    T1]  ? __cfi_kernel_init+0x8/0x8
[   16.885175][    T1]  kernel_init+0x16/0x138
[   16.886357][    T1]  ret_from_fork+0x266/0x5f8
[   16.887598][    T1]  ? __cfi_kernel_init+0x8/0x8
[   16.888884][    T1]  ret_from_fork_asm+0x11/0x20
[   16.890220][    T1]  </TASK>
[   16.891058][    T1] irq event stamp: 306141
[   16.892233][    T1] hardirqs last  enabled at (306157): [<ffffffff81749821>] __console_unlock+0x61/0xc0
[   16.894765][    T1] hardirqs last disabled at (306170): [<ffffffff81749806>] __console_unlock+0x46/0xc0
[   16.897303][    T1] softirqs last  enabled at (305714): [<ffffffff81618b94>] handle_softirqs+0x614/0x780
[   16.899859][    T1] softirqs last disabled at (305705): [<ffffffff81618ec5>] __irq_exit_rcu+0x45/0x140
[   16.902401][    T1] ---[ end trace 0000000000000000 ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260820/202608201017.100a4511-lkp@intel.com



--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

