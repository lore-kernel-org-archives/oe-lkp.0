Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970610;
	b=Pp0OR5eTWQuBkuicUs5gt+r7HzWH01Clh3choud4Ym7rfwi4ALGyfPzYWoVDGuiQf94C
	 CmS2G2SsFRtQcnPVDSAdcsjwqWm887pTUBDz/disRocKuje4CTQaSx5b7SgOrQvHzZedk
	 yH0W7fCQLdfzJ2BhWKweXNnq6z2CL6eR+zNNwuMFhz+2Jfo10nuufhEVgLe1OrDUzTxEJ
	 apZnq9daOuG8TTMQ/SIK37K3dyiywJyGDn2toTgSiPAHsyOoM+82v2z9IAC0rPMieCdpt
	 Lor7n8zg6oPJyZop6U9TasmmfVATEvoW2S/3xU93KKoUyFKIsr6qoOxX8oKPMqoGkpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970610;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=URQFoTImIVCNft20T5BYUBCMvtlWxCjJ3xuxFmYrxAc=;
	b=zD2EPPNAIoS/G3yYlFOZkwngQoNhCuNkkGWgi82ombqMkHdrEGT1TBsxaScmrxjFnHFf
	 V1EoqLtHErsqyTV7qLp9wjE4ZbrwnIRv7QRkPbk6MJV241JAins/Wgindlhvuf8VGqFKx
	 umeLn/+eEejxxWeW7X/rs9bQEulAdoaAGqKWf99dEREV+y3/WF9gHvtIHVBuym34oVkxE
	 rhUPfnqcocNpyEpqrGmFIuwOfFKGgHCKTDXwnglw+qUf71XZ00Dj6CR5lDgS+hSwhjuhR
	 Qfnh6XcDFL5R0H7TtLjQrzYdZRhhH3qyf9FRLN5HrP+Gwz4Fbf1CsWsD4HgbshKvecw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="luP/fBGb";
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E230606A31C
	for <oe-lkp@lists.linux.dev>; Wed, 18 Nov 2026 02:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E230606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=luP/fBGb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794970609; x=1826506609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6CGlRG6vd+PaB/VudhBLt17E9n8lXFjpqvq5fu61kGs=;
  b=luP/fBGbnT3s/53fHKpV2Bb+A0IfKlPA0fOMBX1h2o5ttKctMFPYYc0x
   +2slJbYPdQHH3KZNg02HESUhPk5B1Kv3OItxOXC//itq9f1rXxH+I+NW9
   a/ZCjnq+YFeB28B4tIzoYMNMWxPxnCjMsY59QcifzcCS094PgfpQ/Fvb5
   F8lS8uu4/EofrycTCbks+4390hp2fEqZwpn33ZhAX0WHmyo1ewPVIAc0T
   GcvGvT7Yk9H+txlFSq9t155p1UO5L1gx0mFcpDPqvE+ZdtPcAipnd5nR4
   Tm83iMGpp/eyhMs9NHXWdle8aQ6pbyq0GKVRM/5vD73mBgUJmPP9+OKbT
   w==;
X-CSE-ConnectionGUID: UGplnvwwQ4CF+2zBDjFvtg==
X-CSE-MsgGUID: D9VoOjNcQ4eBeYegkzg05g==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3687989"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3687989"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 18:56:49 -0800
X-CSE-ConnectionGUID: 5pVO51YSTTuHXPYHG8e5wQ==
X-CSE-MsgGUID: N3tCG8ljSnmmsUYsGU2egw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="11923555"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 18:56:48 -0800
Date: Wed, 18 Nov 2026 10:56:44 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, yi1.lai@intel.com
Subject: [frederic-dynticks:core/hotplug-v2] [tick]  592083577b:
 RIP:native_queued_spin_lock_slowpath
Message-ID: <202611180320.268deeb6-lkp@intel.com>
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

kernel test robot noticed "RIP:native_queued_spin_lock_slowpath" on:

commit: 592083577bf5b074a22109e03a7970095ab9a7cb ("tick: Move CPUHP_AP_TICK_DYING post stop_machine()") https://git.kernel.org/cgit/linux/kernel/git/frederic/linux-dynticks.git core/hotplug-v2

in testcase: rcutorture
with following parameters:

	runtime: 300s
	test: cpuhotplug
	torture_type: tasks-tracing


config: x86_64-randconfig-2000-20261112
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu Broadwell-noTSX,enforce -smp 4 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202611180320.268deeb6-lkp@intel.com


[  263.252341][   T26] smp: csd: Detected non-responsive CSD lock (#1) on CPU#2, waiting 100000000052 ns for CPU#00 rcu_torture_irq+0x0/0x100 [rcutorture](0x0).
[  263.253968][   T26] smp:     csd: CSD lock (#1) unresponsive.
[  263.254362][   T26] Sending NMI from CPU 2 to CPUs 0:
[  263.254742][    C0] NMI backtrace for cpu 0
[  263.254779][    C0] CPU: 0 UID: 0 PID: 17 Comm: migration/0 Not tainted 7.4.0-rc1-00045-g592083577bf5 #1 PREEMPT(full)
[  263.254786][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  263.254789][    C0] Stopper: multi_cpu_stop+0x0/0x2c0 <- __stop_cpus+0xec/0x140
[  263.254810][    C0] RIP: 0010:native_queued_spin_lock_slowpath+0x102/0x780
[  263.254818][    C0] Code: 8d 7d a8 be 04 00 00 00 e8 5b 34 7b fe 8b 45 a8 ba 01 00 00 00 89 85 6c ff ff ff f0 0f b1 13 0f 84 19 06 00 00 89 45 a8 f3 90 <eb> 9b 8b 45 b8 3d 00 01 00 00 75 5a 49 89 fc b8 ff ff 37 00 49 89
[  263.254821][    C0] RSP: 0018:ffff888100a67b08 EFLAGS: 00000002
[  263.254825][    C0] RAX: 0000000000000001 RBX: ffff8883ae5e5b00 RCX: ffffed1075cbcb61
[  263.254828][    C0] RDX: 0000000000000001 RSI: ffffed1075cbcb61 RDI: ffff8883ae5e5b00
[  263.254830][    C0] RBP: ffff888100a67ba0 R08: 0000000000000004 R09: ffffed1075cbcb60
[  263.254832][    C0] R10: 0000000000000000 R11: ffff8883ae5e5b03 R12: ffffed1075cbcb60
[  263.254835][    C0] R13: 0000000000000003 R14: ffff8883ae5e5b10 R15: 0000000000000000
[  263.254837][    C0] FS:  0000000000000000(0000) GS:ffff888428a71000(0000) knlGS:0000000000000000
[  263.254843][    C0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  263.254845][    C0] CR2: 00007f36f00d0000 CR3: 00000001028bb002 CR4: 00000000003706b0
[  263.254848][    C0] Call Trace:
[  263.254851][    C0]  <TASK>
[  263.254857][    C0]  ? __pv_queued_spin_lock_slowpath+0x940/0x940
[  263.254864][    C0]  do_raw_spin_lock+0x15b/0x200
[  263.254868][    C0]  ? __raw_spin_lock_init+0x100/0x100
[  263.254871][    C0]  ? __hrtimer_rearm_deferred+0x9d/0x200
[  263.254876][    C0]  ? __this_cpu_preempt_check+0x13/0x40
[  263.254881][    C0]  _raw_spin_lock+0x58/0x80
[  263.254885][    C0]  __hrtimer_rearm_deferred+0x9d/0x200
[  263.254888][    C0]  irqentry_exit+0x616/0x680
[  263.254893][    C0]  sysvec_apic_timer_interrupt+0xa7/0xc0
[  263.254897][    C0]  asm_sysvec_apic_timer_interrupt+0x1b/0x40
[  263.254901][    C0] RIP: 0010:multi_cpu_stop+0x28d/0x2c0
[  263.254905][    C0] Code: ff ff 48 8b 5d b8 81 e3 00 02 00 00 74 05 e8 4a e3 09 00 9c 58 0f ba e0 09 73 05 e8 7d c7 cb 01 48 85 db 74 01 fb 48 83 c4 28 <44> 89 e0 5b 41 5c 41 5d 41 5e 41 5f 5d c3 66 66 2e 0f 1f 84 00 00
[  263.254907][    C0] RSP: 0018:ffff888100a67d90 EFLAGS: 00000296
[  263.254910][    C0] RAX: 0000000000000006 RBX: 0000000000000200 RCX: fffffbfff0aab75d
[  263.254912][    C0] RDX: 1ffff11075cbe200 RSI: ffffffff840d6bf5 RDI: ffffffff839f6aa0
[  263.254914][    C0] RBP: ffff888100a67db8 R08: 0000000000000008 R09: fffffbfff0aab75c
[  263.254916][    C0] R10: 0000000000000000 R11: ffffffff8555bae7 R12: 0000000000000000
[  263.254918][    C0] R13: 0000000000000004 R14: ffffffff83273340 R15: ffffffff81405300
[  263.254921][    C0]  ? stop_one_cpu+0xc0/0x140
[  263.254928][    C0]  ? stop_machine_yield+0x40/0x40
[  263.254931][    C0]  cpu_stopper_thread+0x243/0x340
[  263.254936][    C0]  ? cpu_stop_create+0xc0/0xc0
[  263.254939][    C0]  smpboot_thread_fn+0x773/0x7c0
[  263.254946][    C0]  ? sort_range+0x40/0x40
[  263.254950][    C0]  kthread+0x338/0x380
[  263.254954][    C0]  ? kthread_affine_node+0x140/0x140
[  263.254958][    C0]  ret_from_fork+0x6c/0x6c0
[  263.254964][    C0]  ? exit_thread+0x40/0x40
[  263.254968][    C0]  ? __switch_to+0x857/0xb00
[  263.254972][    C0]  ? kthread_affine_node+0x140/0x140
[  263.254976][    C0]  ret_from_fork_asm+0x11/0x40
[  263.254985][    C0]  </TASK>
[  263.278024][   T26] smp: csd: Re-sending CSD lock (#1) IPI from CPU#02 to CPU#00
[  263.278544][   T26] CPU: 2 UID: 0 PID: 26 Comm: migration/2 Not tainted 7.4.0-rc1-00045-g592083577bf5 #1 PREEMPT(full)
[  263.252341][   T26] smp: csd: Detected non-responsive CSD lock (#1) on CPU#2, waiting 100000000052 ns for CPU#00 rcu_torture_irq+0x0/0x100 [rcutorture](0x0).
[  263.278549][   T26] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  263.253968][   T26] smp:     csd: CSD lock (#1) unresponsive.
[  263.278551][   T26] Stopper: multi_cpu_stop+0x0/0x2c0 <- __stop_cpus+0xec/0x140
[  263.254362][   T26] Sending NMI from CPU 2 to CPUs 0:
[  263.278566][   T26] Call Trace:
[  263.254742][    C0] NMI backtrace for cpu 0
[  263.278569][   T26]  <TASK>
[  263.254779][    C0] CPU: 0 UID: 0 PID: 17 Comm: migration/0 Not tainted 7.4.0-rc1-00045-g592083577bf5 #1 PREEMPT(full)
[  263.278574][   T26]  dump_stack_lvl+0x79/0xc0
[  263.254786][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  263.278581][   T26]  dump_stack+0x10/0x40
[  263.254789][    C0] Stopper: multi_cpu_stop+0x0/0x2c0 <- __stop_cpus+0xec/0x140
[  263.278585][   T26]  csd_lock_wait_toolong+0x827/0x880
[  263.254810][    C0] RIP: 0010:native_queued_spin_lock_slowpath+0x102/0x780
[  263.278595][   T26]  __csd_lock_wait+0xa0/0x100
[  263.254818][    C0] Code: 8d 7d a8 be 04 00 00 00 e8 5b 34 7b fe 8b 45 a8 ba 01 00 00 00 89 85 6c ff ff ff f0 0f b1 13 0f 84 19 06 00 00 89 45 a8 f3 90 <eb> 9b 8b 45 b8 3d 00 01 00 00 75 5a 49 89 fc b8 ff ff 37 00 49 89
[  263.278599][   T26]  ? csd_lock_wait_toolong+0x880/0x880
[  263.254821][    C0] RSP: 0018:ffff888100a67b08 EFLAGS: 00000002
[  263.278602][   T26]  ? debug_object_activate+0x1d9/0x2c0
[  263.254825][    C0] RAX: 0000000000000001 RBX: ffff8883ae5e5b00 RCX: ffffed1075cbcb61
[  263.278609][   T26]  ? do_raw_spin_unlock+0x63/0x1c0
[  263.254828][    C0] RDX: 0000000000000001 RSI: ffffed1075cbcb61 RDI: ffff8883ae5e5b00
[  263.278617][   T26]  __smp_call_function_single+0x273/0x4c0
[  263.254830][    C0] RBP: ffff888100a67ba0 R08: 0000000000000004 R09: ffffed1075cbcb60
[  263.278622][   T26]  ? hrtimer_check_user_timer+0x100/0x100
[  263.254832][    C0] R10: 0000000000000000 R11: ffff8883ae5e5b03 R12: ffffed1075cbcb60
[  263.278627][   T26]  ? generic_exec_single+0x200/0x200
[  263.254835][    C0] R13: 0000000000000003 R14: ffff8883ae5e5b10 R15: 0000000000000000
[  263.278638][   T26]  smp_call_function_single+0x14/0x40
[  263.254837][    C0] FS:  0000000000000000(0000) GS:ffff888428a71000(0000) knlGS:0000000000000000
[  263.278642][   T26]  hrtimers_cpu_dying+0x266/0x2c0
[  263.254843][    C0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  263.278648][   T26]  ? hrtimers_cpu_starting+0x200/0x200
[  263.254845][    C0] CR2: 00007f36f00d0000 CR3: 00000001028bb002 CR4: 00000000003706b0
[  263.278653][   T26]  cpuhp_invoke_callback+0x1cc/0x640
[  263.254848][    C0] Call Trace:
[  263.278659][   T26]  ? cpuhp_next_state+0xc1/0x100
[  263.254851][    C0]  <TASK>
[  263.278666][   T26]  __cpuhp_invoke_callback_range+0x9c/0x180
[  263.254857][    C0]  ? __pv_queued_spin_lock_slowpath+0x940/0x940
[  263.278672][   T26]  ? cpuhp_invoke_callback+0x640/0x640
[  263.254864][    C0]  do_raw_spin_lock+0x15b/0x200
[  263.278677][   T26]  ? lapic_get_maxlvt+0x13/0x40
[  263.254868][    C0]  ? __raw_spin_lock_init+0x100/0x100
[  263.278684][   T26]  ? stop_one_cpu+0xc1/0x140
[  263.254871][    C0]  ? __hrtimer_rearm_deferred+0x9d/0x200
[  263.278687][   T26]  cpuhp_invoke_callback_range_nofail+0x13/0x40
[  263.254876][    C0]  ? __this_cpu_preempt_check+0x13/0x40
[  263.278692][   T26]  take_cpu_down_post+0xe2/0x100
[  263.254881][    C0]  _raw_spin_lock+0x58/0x80
[  263.278697][   T26]  multi_cpu_stop+0x203/0x2c0
[  263.254885][    C0]  __hrtimer_rearm_deferred+0x9d/0x200
[  263.278704][   T26]  ? stop_machine_yield+0x40/0x40
[  263.254888][    C0]  irqentry_exit+0x616/0x680
[  263.278707][   T26]  cpu_stopper_thread+0x243/0x340
[  263.254893][    C0]  sysvec_apic_timer_interrupt+0xa7/0xc0
[  263.278714][   T26]  ? cpu_stop_create+0xc0/0xc0
[  263.254897][    C0]  asm_sysvec_apic_timer_interrupt+0x1b/0x40
[  263.278717][   T26]  smpboot_thread_fn+0x773/0x7c0
[  263.254901][    C0] RIP: 0010:multi_cpu_stop+0x28d/0x2c0
[  263.278726][   T26]  ? sort_range+0x40/0x40
[  263.254905][    C0] Code: ff ff 48 8b 5d b8 81 e3 00 02 00 00 74 05 e8 4a e3 09 00 9c 58 0f ba e0 09 73 05 e8 7d c7 cb 01 48 85 db 74 01 fb 48 83 c4 28 <44> 89 e0 5b 41 5c 41 5d 41 5e 41 5f 5d c3 66 66 2e 0f 1f 84 00 00
[  263.278730][   T26]  kthread+0x338/0x380
[  263.254907][    C0] RSP: 0018:ffff888100a67d90 EFLAGS: 00000296
[  263.278734][   T26]  ? kthread_affine_node+0x140/0x140
[  263.254910][    C0] RAX: 0000000000000006 RBX: 0000000000000200 RCX: fffffbfff0aab75d
[  263.278740][   T26]  ret_from_fork+0x6c/0x6c0
[  263.254912][    C0] RDX: 1ffff11075cbe200 RSI: ffffffff840d6bf5 RDI: ffffffff839f6aa0
[  263.278747][   T26]  ? exit_thread+0x40/0x40
[  263.254914][    C0] RBP: ffff888100a67db8 R08: 0000000000000008 R09: fffffbfff0aab75c
[  263.278751][   T26]  ? __switch_to+0x857/0xb00
[  263.254916][    C0] R10: 0000000000000000 R11: ffffffff8555bae7 R12: 0000000000000000
[  263.278756][   T26]  ? kthread_affine_node+0x140/0x140
[  263.254918][    C0] R13: 0000000000000004 R14: ffffffff83273340 R15: ffffffff81405300
[  263.278761][   T26]  ret_from_fork_asm+0x11/0x40
[  263.254921][    C0]  ? stop_one_cpu+0xc0/0x140
[  263.278774][   T26]  </TASK>
[  263.254928][    C0]  ? stop_machine_yield+0x40/0x40
[  263.287164][  T441] smp: csd: Detected non-responsive CSD lock (#2) on CPU#1, waiting 100000000012 ns for CPU#00 rcu_torture_irq+0x0/0x100 [rcutorture](0x0).
[  263.254931][    C0]  cpu_stopper_thread+0x243/0x340
[  263.254936][    C0]  ? cpu_stop_create+0xc0/0xc0
[  263.254939][    C0]  smpboot_thread_fn+0x773/0x7c0
[  263.254946][    C0]  ? sort_range+0x40/0x40
[  263.254950][    C0]  kthread+0x338/0x380
[  263.254954][    C0]  ? kthread_affine_node+0x140/0x140
[  263.254958][    C0]  ret_from_fork+0x6c/0x6c0
[  263.254964][    C0]  ? exit_thread+0x40/0x40
[  263.254968][    C0]  ? __switch_to+0x857/0xb00
[  263.254972][    C0]  ? kthread_affine_node+0x140/0x140
[  263.254976][    C0]  ret_from_fork_asm+0x11/0x40
[  263.254985][    C0]  </TASK>
[  263.278024][   T26] smp: csd: Re-sending CSD lock (#1) IPI from CPU#02 to CPU#00
[  263.278544][   T26] CPU: 2 UID: 0 PID: 26 Comm: migration/2 Not tainted 7.4.0-rc1-00045-g592083577bf5 #1 PREEMPT(full)
[  263.278549][   T26] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  263.278551][   T26] Stopper: multi_cpu_stop+0x0/0x2c0 <- __stop_cpus+0xec/0x140
[  263.278566][   T26] Call Trace:
[  263.278569][   T26]  <TASK>
[  263.278574][   T26]  dump_stack_lvl+0x79/0xc0
[  263.278581][   T26]  dump_stack+0x10/0x40
[  263.278585][   T26]  csd_lock_wait_toolong+0x827/0x880
[  263.278595][   T26]  __csd_lock_wait+0xa0/0x100
[  263.278599][   T26]  ? csd_lock_wait_toolong+0x880/0x880
[  263.278602][   T26]  ? debug_object_activate+0x1d9/0x2c0
[  263.278609][   T26]  ? do_raw_spin_unlock+0x63/0x1c0
[  263.278617][   T26]  __smp_call_function_single+0x273/0x4c0
[  263.278622][   T26]  ? hrtimer_check_user_timer+0x100/0x100
[  263.278627][   T26]  ? generic_exec_single+0x200/0x200
[  263.278638][   T26]  smp_call_function_single+0x14/0x40
[  263.278642][   T26]  hrtimers_cpu_dying+0x266/0x2c0
[  263.278648][   T26]  ? hrtimers_cpu_starting+0x200/0x200
[  263.278653][   T26]  cpuhp_invoke_callback+0x1cc/0x640
[  263.278659][   T26]  ? cpuhp_next_state+0xc1/0x100
[  263.278666][   T26]  __cpuhp_invoke_callback_range+0x9c/0x180
[  263.278672][   T26]  ? cpuhp_invoke_callback+0x640/0x640
[  263.278677][   T26]  ? lapic_get_maxlvt+0x13/0x40
[  263.278684][   T26]  ? stop_one_cpu+0xc1/0x140
[  263.278687][   T26]  cpuhp_invoke_callback_range_nofail+0x13/0x40
[  263.278692][   T26]  take_cpu_down_post+0xe2/0x100
[  263.278697][   T26]  multi_cpu_stop+0x203/0x2c0
[  263.278704][   T26]  ? stop_machine_yield+0x40/0x40
[  263.278707][   T26]  cpu_stopper_thread+0x243/0x340
[  263.278714][   T26]  ? cpu_stop_create+0xc0/0xc0
[  263.278717][   T26]  smpboot_thread_fn+0x773/0x7c0
[  263.278726][   T26]  ? sort_range+0x40/0x40
[  263.278730][   T26]  kthread+0x338/0x380
[  263.278734][   T26]  ? kthread_affine_node+0x140/0x140
[  263.278740][   T26]  ret_from_fork+0x6c/0x6c0
[  263.278747][   T26]  ? exit_thread+0x40/0x40
[  263.278751][   T26]  ? __switch_to+0x857/0xb00
[  263.278756][   T26]  ? kthread_affine_node+0x140/0x140
[  263.278761][   T26]  ret_from_fork_asm+0x11/0x40
[  263.278774][   T26]  </TASK>
[  263.287164][  T441] smp: csd: Detected non-responsive CSD lock (#2) on CPU#1, waiting 100000000012 ns for CPU#00 rcu_torture_irq+0x0/0x100 [rcutorture](0x0).
[  263.421582][  T441] smp:     csd: CSD lock (#2) unresponsive.
[  263.423037][  T441] smp: csd: Re-sending CSD lock (#2) IPI from CPU#01 to CPU#00
[  263.425043][  T441] CPU: 1 UID: 0 PID: 441 Comm: rcu_torture_rea Not tainted 7.4.0-rc1-00045-g592083577bf5 #1 PREEMPT(full)
[  263.425048][  T441] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  263.425052][  T441] Call Trace:
[  263.425056][  T441]  <TASK>
[  263.425062][  T441]  dump_stack_lvl+0x79/0xc0
[  263.425074][  T441]  dump_stack+0x10/0x40
[  263.425078][  T441]  csd_lock_wait_toolong+0x827/0x880
[  263.425088][  T441]  __csd_lock_wait+0xa0/0x100
[  263.425092][  T441]  ? csd_lock_wait_toolong+0x880/0x880
[  263.425095][  T441]  ? debug_smp_processor_id+0x17/0x40
[  263.425106][  T441]  __smp_call_function_single+0x273/0x4c0
[  263.425115][  T441]  ? rcu_torture_one_read+0x3c0/0x3c0 [rcutorture]
[  263.425135][  T441]  ? generic_exec_single+0x200/0x200
[  263.425142][  T441]  ? kvm_clock_get_cycles+0x9/0x40
[  263.425151][  T441]  smp_call_function_single+0x14/0x40
[  263.425155][  T441]  rcu_torture_reader+0x3ee/0x5c0 [rcutorture]
[  263.425181][  T441]  ? rcu_torture_read_exit_child+0x80/0x80 [rcutorture]
[  263.425199][  T441]  ? _raw_spin_unlock_irqrestore+0x34/0x80
[  263.425204][  T441]  ? __this_cpu_preempt_check+0x13/0x40
[  263.425209][  T441]  ? rcu_torture_irq+0x100/0x100 [rcutorture]
[  263.425225][  T441]  ? __kthread_parkme+0xd8/0x1c0
[  263.425233][  T441]  ? rcu_torture_read_exit_child+0x80/0x80 [rcutorture]
[  263.425247][  T441]  kthread+0x338/0x380
[  263.425251][  T441]  ? kthread_affine_node+0x140/0x140
[  263.425257][  T441]  ret_from_fork+0x6c/0x6c0
[  263.425262][  T441]  ? debug_smp_processor_id+0x17/0x40
[  263.425266][  T441]  ? exit_thread+0x40/0x40
[  263.425270][  T441]  ? __switch_to+0x857/0xb00
[  263.425275][  T441]  ? kthread_affine_node+0x140/0x140
[  263.425280][  T441]  ret_from_fork_asm+0x11/0x40
[  263.425293][  T441]  </TASK>
[  268.255675][    C1] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  268.303892][    C1] rcu:     2-O..!: (1 ticks this GP) idle=4ae4/1/0x4000000000000000 softirq=16314/16315 fqs=0
[  268.306797][    C1] rcu:     (detected by 1, t=31504 jiffies, g=58025, q=109 ncpus=3)
[  268.308815][    C1] rcu: Offline CPU 2 blocking current GP.
[  268.308818][    C1] rcu: rcu_preempt kthread timer wakeup didn't happen for 31502 jiffies! g58025 f0x0 RCU_GP_WAIT_FQS(5) ->state=I
[  268.313369][    C1] rcu:     Possible timer handling issue on cpu=0 timer-softirq=16793
[  268.315392][    C1] rcu: rcu_preempt kthread starved for 31504 jiffies! g58025 f0x0 RCU_GP_WAIT_FQS(5) ->state=I ->cpu=0
[  268.318278][    C1] rcu:     Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
[  268.320878][    C1] rcu: RCU grace-period kthread stack dump:
[  268.322390][    C1] task:rcu_preempt     state:I stack:0     pid:14    tgid:14    ppid:2      task_flags:0x208040 flags:0x00080000
[  268.325475][    C1] Call Trace:
[  268.326314][    C1]  <TASK>
[  268.327081][    C1]  __schedule+0x111d/0x1180
[  268.328263][    C1]  ? io_schedule_timeout+0x80/0x80
[  268.329571][    C1]  ? __this_cpu_preempt_check+0x13/0x40
[  268.331064][    C1]  ? preempt_latency_start+0x1c/0x80
[  268.332457][    C1]  schedule+0xe3/0x140
[  268.333496][    C1]  schedule_timeout+0x196/0x240
[  268.334789][    C1]  ? hrtimer_nanosleep_restart+0x140/0x140
[  268.336302][    C1]  ? _raw_spin_unlock_irqrestore+0x34/0x80
[  268.337869][    C1]  ? hrtimers_cpu_dying+0x2c0/0x2c0
[  268.339204][    C1]  ? prepare_to_swait_event+0xbf/0x100
[  268.340665][    C1]  ? rcu_gp_kthread+0x1/0x180
[  268.341863][    C1]  rcu_gp_fqs_loop+0x206/0x540
[  268.343082][    C1]  ? signal_pending+0xc0/0xc0
[  268.344348][    C1]  ? rcu_gp_cleanup+0x72d/0x780
[  268.345588][    C1]  ? rcu_report_qs_rdp+0x300/0x300
[  268.346892][    C1]  ? rcu_is_watching+0x14/0xc0
[  268.348145][    C1]  ? rcu_gp_cleanup+0x780/0x780
[  268.349381][    C1]  rcu_gp_kthread+0x151/0x180
[  268.350595][    C1]  ? rcu_gp_cleanup+0x780/0x780
[  268.351858][    C1]  kthread+0x338/0x380
[  268.352897][    C1]  ? kthread_affine_node+0x140/0x140
[  268.354302][    C1]  ret_from_fork+0x6c/0x6c0
[  268.355461][    C1]  ? exit_thread+0x40/0x40
[  268.356649][    C1]  ? __switch_to+0x857/0xb00
[  268.357880][    C1]  ? kthread_affine_node+0x140/0x140
[  268.359232][    C1]  ret_from_fork_asm+0x11/0x40
[  268.360533][    C1]  </TASK>
[  268.361306][    C1] rcu: Stack dump where RCU GP kthread last ran:
[  268.362971][    C1] Sending NMI from CPU 1 to CPUs 0:
[  268.364825][    C0] NMI backtrace for cpu 0
[  268.364843][    C0] CPU: 0 UID: 0 PID: 17 Comm: migration/0 Not tainted 7.4.0-rc1-00045-g592083577bf5 #1 PREEMPT(full)
[  268.364850][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  268.364854][    C0] Stopper: multi_cpu_stop+0x0/0x2c0 <- __stop_cpus+0xec/0x140
[  268.364868][    C0] RIP: 0010:kasan_check_range+0x18/0x180
[  268.364875][    C0] Code: 84 00 00 00 00 00 66 66 2e 0f 1f 84 00 00 00 00 00 90 55 48 89 e5 41 54 53 b0 01 48 85 f6 0f 84 42 01 00 00 48 89 f8 49 89 f0 <41> 89 d2 48 89 cb 48 01 f0 73 17 41 0f b6 d2 48 89 d9 4c 89 c6 e8
[  268.364879][    C0] RSP: 0018:ffff888100a67ad8 EFLAGS: 00000002
[  268.364884][    C0] RAX: ffff8883ae5e5b00 RBX: ffff8883ae5e5b00 RCX: ffffffff830dc16c
[  268.364887][    C0] RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffff8883ae5e5b00
[  268.364889][    C0] RBP: ffff888100a67ae8 R08: 0000000000000004 R09: ffffed1075cbcb60
[  268.364892][    C0] R10: 0000000000000000 R11: ffff8883ae5e5b03 R12: ffffed1075cbcb60
[  268.364895][    C0] R13: 0000000000000003 R14: ffff8883ae5e5b10 R15: 0000000000000000
[  268.364898][    C0] FS:  0000000000000000(0000) GS:ffff888428a71000(0000) knlGS:0000000000000000
[  268.364906][    C0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  268.364909][    C0] CR2: 00007f36f00d0000 CR3: 00000001028bb002 CR4: 00000000003706b0
[  268.364912][    C0] Call Trace:
[  268.364915][    C0]  <TASK>
[  268.364921][    C0]  __kasan_check_read+0x11/0x40
[  268.364926][    C0]  native_queued_spin_lock_slowpath+0xac/0x780
[  268.364934][    C0]  ? __pv_queued_spin_lock_slowpath+0x940/0x940
[  268.364941][    C0]  do_raw_spin_lock+0x15b/0x200
[  268.364947][    C0]  ? __raw_spin_lock_init+0x100/0x100
[  268.364951][    C0]  ? __hrtimer_rearm_deferred+0x9d/0x200
[  268.364956][    C0]  ? __this_cpu_preempt_check+0x13/0x40
[  268.364962][    C0]  _raw_spin_lock+0x58/0x80
[  268.364966][    C0]  __hrtimer_rearm_deferred+0x9d/0x200
[  268.364971][    C0]  irqentry_exit+0x616/0x680
[  268.364976][    C0]  sysvec_apic_timer_interrupt+0xa7/0xc0
[  268.364980][    C0]  asm_sysvec_apic_timer_interrupt+0x1b/0x40
[  268.364984][    C0] RIP: 0010:multi_cpu_stop+0x28d/0x2c0
[  268.364988][    C0] Code: ff ff 48 8b 5d b8 81 e3 00 02 00 00 74 05 e8 4a e3 09 00 9c 58 0f ba e0 09 73 05 e8 7d c7 cb 01 48 85 db 74 01 fb 48 83 c4 28 <44> 89 e0 5b 41 5c 41 5d 41 5e 41 5f 5d c3 66 66 2e 0f 1f 84 00 00
[  268.364991][    C0] RSP: 0018:ffff888100a67d90 EFLAGS: 00000296
[  268.364995][    C0] RAX: 0000000000000006 RBX: 0000000000000200 RCX: fffffbfff0aab75d
[  268.364998][    C0] RDX: 1ffff11075cbe200 RSI: ffffffff840d6bf5 RDI: ffffffff839f6aa0
[  268.365001][    C0] RBP: ffff888100a67db8 R08: 0000000000000008 R09: fffffbfff0aab75c
[  268.365004][    C0] R10: 0000000000000000 R11: ffffffff8555bae7 R12: 0000000000000000
[  268.365007][    C0] R13: 0000000000000004 R14: ffffffff83273340 R15: ffffffff81405300
[  268.365010][    C0]  ? stop_one_cpu+0xc0/0x140
[  268.365020][    C0]  ? stop_machine_yield+0x40/0x40
[  268.365024][    C0]  cpu_stopper_thread+0x243/0x340
[  268.365030][    C0]  ? cpu_stop_create+0xc0/0xc0
[  268.365034][    C0]  smpboot_thread_fn+0x773/0x7c0
[  268.365041][    C0]  ? sort_range+0x40/0x40
[  268.365046][    C0]  kthread+0x338/0x380
[  268.365051][    C0]  ? kthread_affine_node+0x140/0x140
[  268.365056][    C0]  ret_from_fork+0x6c/0x6c0
[  268.365063][    C0]  ? exit_thread+0x40/0x40
[  268.365067][    C0]  ? __switch_to+0x857/0xb00
[  268.365072][    C0]  ? kthread_affine_node+0x140/0x140
[  268.365078][    C0]  ret_from_fork_asm+0x11/0x40
[  268.365089][    C0]  </TASK>


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261118/202611180320.268deeb6-lkp@intel.com


--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


