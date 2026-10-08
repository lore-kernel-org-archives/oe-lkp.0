Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976E2311597
	for <oe-lkp@lists.linux.dev>; Thu,  8 Oct 2026 02:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791427633; cv=none; b=uPAd9zNMNeOSHoDO+sFZHTt8YrWOHO4TLDoYsWjZ5SWTaU8Vr3ly6HrkCLP5y4BwaKlyj/Sej4yKiWbvirIa2SKnbHLEydRG3loPf2EsJ8WDcn6rO11Nu7AuhSR/s718XFEaYiUB8AsxlV69mQMdJjhl2H8a4UsyTbudbW5xcRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791427633; c=relaxed/simple;
	bh=bF93vGGd5DKMt+o/2p3H6iHkNmHJ6QUVG+yEXw2Bkzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iLh3seQcpLRN+aN14ctefiy03DJI7nMMUoVYdo0HPrloclU3S1GoD7U408iOm6XZY21K5qAS0htlAq6KyUp+szvMqzRsB6dg+YIHhoRq0Xf7Q/xRErBjFKCqofNqIQOxDPg/pqlkd3AoQ3cJuXFVcGiBt4JuvjKb64c5xZSA1VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MrNtY/Bc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MrNtY/Bc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791427632; x=1822963632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bF93vGGd5DKMt+o/2p3H6iHkNmHJ6QUVG+yEXw2Bkzc=;
  b=MrNtY/BcchwmEv4eN3WYvlTWm5H/KlbE9Np3Fb/sOO7tPVlPquXPWKpX
   9PAX94cigBXHxliNYfBGhnVKjgXFa9y0q4W3EDPORV95TN1yVHZRJDIxg
   1rUH/PklSQq4EaDCwX9RtRXbH7S0EzBtHRAuAsf9EMwbuG2rViQvRKDVc
   HFMxaYvFMyew1elpgg3jryxSGDrCH+nHAtwv0olRN9aLlRwZ/esWOKtdI
   s8YXy69FRiNG12NYBjAVEDKx62hDYTz4yUCijDHcgx5gZUhU98IWpluRc
   ipoaloSJAjwfAxKk5PW1UX7lbRM3nyF0cAqrUFNaqjFXSPVlBPjmM5oi/
   g==;
X-CSE-ConnectionGUID: p8DJlaVgSxezu58RenlLfw==
X-CSE-MsgGUID: c8w8pxlFTBSrH3vZ4c2xLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="214276"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="214276"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 19:47:10 -0700
X-CSE-ConnectionGUID: d7/1jrS4ThaUtXMk+ezBvA==
X-CSE-MsgGUID: CT+VIyPvQ26iiRqIHyZkfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="229379"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 19:47:08 -0700
Date: Thu, 8 Oct 2026 10:47:04 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Chao Yu <chao@kernel.org>,
	yi1.lai@intel.com, linux-f2fs-devel@lists.sourceforge.net
Subject: [chao:feature/cache_lfolio] [f2fs]  68de64bb56:
 RIP:ffs_detach_free[f2fs]
Message-ID: <202610081027.b13dcf10-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hello,

kernel test robot noticed "RIP:ffs_detach_free[f2fs]" on:

commit: 68de64bb56f6645e9e12008da9afb9ae9917131b ("f2fs: allow large folio support to writeable files") https://git.kernel.org/cgit/linux/kernel/git/chao/linux.git feature/cache_lfolio

in testcase: xfstests
version: xfstests-x86_64-3e1ee800-1_20260922
with following parameters:

	disk: 4HDD
	fs: f2fs
	test: generic-464

config: x86_64-rhel-9.4-func
compiler: gcc-14
test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz (Skylake) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)

If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202610081027.b13dcf10-lkp@intel.com

[   81.404245][T15145] ------------[ cut here ]------------
[   81.404264][T15145] WARNING: fs/f2fs/data.c:2825 at ffs_detach_free+0x23f/0x2f0 [f2fs], CPU#3: xfs_io/15145
[   81.424537][T15145] Modules linked in: dm_mod f2fs lz4hc_compress lz4_compress binfmt_misc snd_hda_codec_intelhdmi snd_hda_codec_hdmi snd_ctl_led snd_hda_codec_alc269 snd_hda_codec_realtek_lib snd_hda_scodec_component snd_hda_codec_generic btrfs libblake2b raid6_pq intel_rapl_msr zstd_compress intel_rapl_common xor x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel snd_hda_intel snd_soc_avs i915 kvm snd_soc_hda_codec intel_gtt sd_mod snd_hda_ext_core sg drm_buddy snd_hda_codec ttm irqbypass drm_display_helper snd_hda_core rapl snd_intel_dspcfg cec snd_intel_sdw_acpi mei_wdt snd_hwdep drm_client_lib wmi_bmof intel_cstate snd_soc_core drm_kms_helper ahci intel_pmc_core snd_compress video intel_uncore serio_raw pcspkr mei_me pmt_telemetry snd_pcm libahci pmt_discovery mei snd_timer libata pmt_class i2c_i801 intel_pmc_ssram_telemetry snd intel_pmc_pwrm_telemetry i2c_smbus intel_vsec acpi_pad soundcore intel_pch_thermal wmi fuse drm
[   81.507275][T15145] CPU: 3 UID: 0 PID: 15145 Comm: xfs_io Tainted: G S                  7.3.0-rc1+ #1 PREEMPT(lazy)
[   81.517880][T15145] Tainted: [S]=CPU_OUT_OF_SPEC
[   81.522591][T15145] Hardware name: HP HP Z240 SFF Workstation/802E, BIOS N51 Ver. 01.63 10/05/2017
[   81.531636][T15145] RIP: 0010:ffs_detach_free+0x23f/0x2f0 [f2fs]
[   81.537834][T15145] Code: 0a bf f0 ff 4b 34 74 09 5b 5d 41 5c c3 cc cc cc cc 48 89 df 5b 5d 41 5c e9 8e 71 e6 be 48 89 df e8 86 71 e6 be e9 d5 fe ff ff <0f> 0b e9 56 ff ff ff 0f 0b e9 09 ff ff ff 4c 89 e7 e8 eb c1 0a bf
[   81.557309][T15145] RSP: 0018:ffffc9000d7df108 EFLAGS: 00010202
[   81.563316][T15145] RAX: 0000000000000010 RBX: ffff8884314412c8 RCX: ffffffffc2efd4b7
[   81.571218][T15145] RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffff8884314412c8
[   81.579187][T15145] RBP: ffff8884314412c0 R08: 0000000000000000 R09: ffffed1086288259
[   81.587184][T15145] R10: ffff8884314412cb R11: 00000000365a4d61 R12: ffffea00107f0428
[   81.595119][T15145] R13: 0000000000000001 R14: ffffc9000d7df1c8 R15: ffffc9000d7df318
[   81.603116][T15145] FS:  00007fcee9b25c00(0000) GS:ffff88841ade1000(0000) knlGS:0000000000000000
[   81.612099][T15145] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   81.618722][T15145] CR2: 00007fcee9c0aa20 CR3: 000000042cf6e006 CR4: 00000000003726f0
[   81.626713][T15145] Call Trace:
[   81.629973][T15145]  <TASK>
[   81.632796][T15145]  truncate_cleanup_folio+0x271/0x330
[   81.638037][T15145]  truncate_inode_pages_range+0x1b7/0x830
[   81.643625][T15145]  ? __pfx_truncate_inode_pages_range+0x10/0x10
[   81.649774][T15145]  ? unwind_next_frame+0x3b3/0x1df0
[   81.654839][T15145]  ? arch_stack_walk+0x67/0xf0
[   81.659498][T15145]  ? __pfx_stack_trace_consume_entry+0x10/0x10
[   81.665524][T15145]  ? __pfx_unmap_mapping_pages+0x10/0x10
[   81.671028][T15145]  ? __pfx_down_write+0x10/0x10
[   81.675750][T15145]  truncate_pagecache+0x61/0xb0
[   81.680480][T15145]  f2fs_setattr+0x827/0x1eb0 [f2fs]
[   81.685665][T15145]  ? kasan_save_stack+0x2c/0x70
[   81.690395][T15145]  ? __pfx_f2fs_setattr+0x10/0x10 [f2fs]
[   81.695980][T15145]  ? current_time+0x73/0x2b0
[   81.700456][T15145]  ? __pfx_current_time+0x10/0x10
[   81.705355][T15145]  ? __pfx_make_vfsgid+0x10/0x10
[   81.710169][T15145]  notify_change+0x814/0xef0
[   81.714634][T15145]  ? do_truncate+0x13f/0x1b0
[   81.719095][T15145]  do_truncate+0x13f/0x1b0
[   81.723452][T15145]  ? __pfx_do_truncate+0x10/0x10
[   81.728317][T15145]  ? ima_file_check+0xb0/0x130
[   81.733018][T15145]  ? vfs_open+0x75/0x370
[   81.737176][T15145]  do_open+0x760/0xdb0
[   81.741176][T15145]  path_openat+0x1cc/0x5b0
[   81.745517][T15145]  ? __pfx_path_openat+0x10/0x10
[   81.750332][T15145]  ? stack_trace_save+0x8f/0xf0
[   81.755062][T15145]  ? __pfx_stack_trace_save+0x10/0x10
[   81.760292][T15145]  ? stack_depot_save_flags+0x3b/0x670
[   81.765613][T15145]  do_file_open+0x1c1/0x3f0
[   81.769987][T15145]  ? __pfx_do_file_open+0x10/0x10
[   81.774879][T15145]  ? kasan_save_free_info+0x37/0x70
[   81.779945][T15145]  ? __kasan_slab_free+0x3f/0x70
[   81.784753][T15145]  ? kmem_cache_free+0xee/0x430
[   81.789507][T15145]  ? _raw_spin_lock+0x81/0xf0
[   81.794049][T15145]  ? __pfx__raw_spin_lock+0x10/0x10
[   81.799116][T15145]  ? alloc_fd+0x333/0x5b0
[   81.803323][T15145]  do_sys_openat2+0xcd/0x170
[   81.807785][T15145]  ? __pfx_do_sys_openat2+0x10/0x10
[   81.812866][T15145]  __x64_sys_openat+0x104/0x1f0
[   81.817596][T15145]  ? __pfx___x64_sys_openat+0x10/0x10
[   81.822834][T15145]  ? __do_sys_newfstatat+0x7c/0xf0
[   81.827817][T15145]  do_syscall_64+0xb8/0x470
[   81.832199][T15145]  ? __pfx_handle_pte_fault+0x10/0x10
[   81.837436][T15145]  ? __pfx_pgd_none+0x10/0x10
[   81.841988][T15145]  ? __pfx__raw_spin_lock+0x10/0x10
[   81.847053][T15145]  ? do_syscall_64+0xef/0x470
[   81.851614][T15145]  ? __handle_mm_fault+0x981/0x11f0
[   81.856699][T15145]  ? put_unused_fd+0x104/0x1f0
[   81.861331][T15145]  ? __pfx___css_rstat_updated+0x10/0x10
[   81.866829][T15145]  ? __pfx___handle_mm_fault+0x10/0x10
[   81.872164][T15145]  ? lock_vma_under_rcu+0x2ac/0x670
[   81.877238][T15145]  ? count_memcg_events+0x273/0x430
[   81.882320][T15145]  ? handle_mm_fault+0x39b/0x670
[   81.887140][T15145]  ? do_user_addr_fault+0x876/0xe30
[   81.892207][T15145]  ? do_syscall_64+0x31/0x470
[   81.896747][T15145]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   81.902526][T15145] RIP: 0033:0x7fcee9bb63a7
[   81.906847][T15145] Code: 48 89 fa 4c 89 df e8 78 b3 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
[   81.926273][T15145] RSP: 002b:00007ffc9289ab50 EFLAGS: 00000202 ORIG_RAX: 0000000000000101
[   81.934582][T15145] RAX: ffffffffffffffda RBX: 00007fcee9b25c00 RCX: 00007fcee9bb63a7
[   81.942444][T15145] RDX: 0000000000000242 RSI: 00007ffc9289c7b1 RDI: ffffffffffffff9c
[   81.950273][T15145] RBP: 00007ffc9289af80 R08: 0000000000000000 R09: 0000000000000000
[   81.958104][T15145] R10: 0000000000000180 R11: 0000000000000202 R12: 00007ffc9289ae20
[   81.965984][T15145] R13: 00005575ff7aba60 R14: 0000000000000180 R15: 0000000000000060
[   81.973808][T15145]  </TASK>
[   81.976713][T15145] ---[ end trace 0000000000000000 ]---

The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261008/202610081027.b13dcf10-lkp@intel.com

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

