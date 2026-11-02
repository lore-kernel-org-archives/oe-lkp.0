Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793583125;
	b=F8FJKG3ct6+XGodF9F9u4/0EIX8FTGl2FC00HIvRIXJrRdAhh+BnzsrEBRhM4Zf2JXLR
	 EhVAbS9sQ6EZQzZ9d5ef7nUzeTP7SdhKWXrKOQUYHD3IxBnoJoJ5sLkv6YSPZFLunH0uW
	 CHEUJf4Oo2QU5XJW7CkUYFxlOlIyOy5HwR78Tla+vZrjQcjiAz3k9OVn5C4zUmlkpEmHX
	 frf7MY2xXFW4e+V0ERNYOh80v0hI/AGhcTkDF8XB54A2CfynB0BiDMQZI51IYrZsNHDsm
	 /Nx2c+PXG4GUBnFxhGMD2Zm2212oZLZjs/FFkfvL7/3ADFvit5Oq+sH4MwtI4SeGBFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793583125;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=bmko6bpyqAYM21Zk4YrvOmj7+hd7xIbcTUTOPMNrGKU=;
	b=04mWjcEKbB8HHLg/yFFnVXPeLTBO4rNSEYjVvfn3l+t3hOh4GLXXJCC6cdH/j8XkpEKj
	 E9YqnoJLQW95v4/IlsSOxRTppCs4H7l8jBCNuC+TrRcvRo7emp2fEjOoCj5ghLgO6bzji
	 JDdFbe4tOJAfGFQg5WTON5wopkaEpn4nsgXqe8dBKRCEatdqTTPCPIOX2pzn0Qd3sdoB1
	 09eotBiaAZCwT4eZ6KvV4OBpZAWcrCIiUa8KHMSu7J6cV5GZockGsJSdJkq3wlrfLdUOi
	 qf7CeLUjgoNY5q68n2qFyEd9Q2l03URWlQ9yRikX381P354h5jfuN6cMF8OYvN7rD4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nA1jeEWZ;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01FA606A324
	for <oe-lkp@lists.linux.dev>; Mon,  2 Nov 2026 01:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E01FA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nA1jeEWZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793583124; x=1825119124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eW2RHerco+icch9JUvuEW7KrzKcWRWDThykKIoj5PUk=;
  b=nA1jeEWZwFDBpVn8qCI31ixKGI7RU42xRJhrWc+hGp6G3x1Jgqm9adsc
   D8/SjkJ846t812R0eczr4/8aaCf2FWuarbXUQ9cobtqdfdaMJF3q5d8Dg
   HbULYpxjCdNIpWffBC1J5YLPWYMPBqTGRV13hLTG2J+OwfKrXp7Y9fLAK
   lbf7aRQg/WxXP3g1kO45mCorlp4RlNY88Tewv2QKksvSAVTDdRWxjO31I
   6/Uzuh6wxlzCPdsMulJXr5C+CD3R6r7vZ2T5/vOce1PYvd2s380Sc1l3h
   jiz11ziXaSGEkLqKN1lUIKxF3nduvGP1bapYFv1H5KsVvOk9J0SWrEh0A
   g==;
X-CSE-ConnectionGUID: e9MOrhPsSeiCkD9w4RRZPg==
X-CSE-MsgGUID: Gc3nT36VTSCHFNjMZs71gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2161149"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2161149"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 17:32:04 -0800
X-CSE-ConnectionGUID: h45G3BlwQveY2MstcsRdqA==
X-CSE-MsgGUID: iHR+V3w3TR+ZGpqZ7Ydm+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="6363754"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 17:32:02 -0800
Date: Mon, 2 Nov 2026 09:31:58 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, yi1.lai@intel.com
Subject: [leon-rdma:device-trust-core-v1] [driver core]  4ebd3e075a:
 WARNING:at_include/linux/device.h:#device_trust_prepare
Message-ID: <202611020255.8c07b45b-lkp@intel.com>
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

kernel test robot noticed "WARNING:at_include/linux/device.h:#device_trust_prepare" on:

commit: 4ebd3e075a98131794d4def7b95f240b130b779a ("driver core: Resolve device trust across driver binding") https://git.kernel.org/cgit/linux/kernel/git/leon/linux-rdma.git device-trust-core-v1

in testcase: perf-stat-tests

config: x86_64-rhel-9.4-bpf
compiler: gcc-14
test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz (Skylake) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)

If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202611020255.8c07b45b-lkp@intel.com

[  151.326544][  T233] ------------[ cut here ]------------
[  151.326739][  T233] WARNING: include/linux/device.h:1130 at device_trust_prepare+0x1ba/0x270, CPU#1: (udev-worker)/233
[  151.326823][  T233] Modules linked in: snd_intel_sdw_acpi kvm(+) libblake2b snd_hwdep btusb(+) ttm mac80211 raid6_pq btrtl drm_display_helper btintel irqbypass snd_soc_core eeepc_wmi(+) btbcm zstd_compress btmtk rapl snd_compress asus_wmi cec xor snd_pcm intel_cstate drm_client_lib sparse_keymap wmi_bmof mxm_wmi bluetooth cfg80211 pcspkr pl2303 snd_timer intel_uncore drm_kms_helper i2c_i801 nvme intel_pmc_core intel_gtt snd agpgart i2c_smbus pmt_telemetry video soundcore rfkill nvme_core pmt_discovery libarc4 ahci pmt_class libahci intel_pmc_ssram_telemetry joydev mei_me intel_pmc_pwrm_telemetry acpi_pad intel_vsec libata mei wmi drm ip_tables x_tables sch_fq_codel
[  151.327871][  T233] CPU: 1 UID: 0 PID: 233 Comm: (udev-worker) Not tainted 7.3.0-rc4+ #1 PREEMPT
[  151.327942][  T233] Hardware name: System manufacturer System Product Name/Z170I PRO GAMING, BIOS 3805 05/16/2018
[  151.328013][  T233] RIP: 0010:device_trust_prepare+0x1ba/0x270
[  151.328069][  T233] Code: 02 74 6c 77 4b 45 85 f6 74 79 b8 ff ff ff ff eb b3 48 8d bb 28 01 00 00 be ff ff ff ff e8 8e 8e c0 00 85 c0 0f 85 cf fe ff ff <0f> 0b e9 c8 fe ff ff 41 83 fe 03 75 0f 41 83 fd 02 0f 94 c0 84 c0
[  151.328343][  T233] RSP: 0018:ffff88841cb9f3c8 EFLAGS: 00010246
[  151.328402][  T233] RAX: 0000000000000000 RBX: ffff8881418f3078 RCX: 0000000000000001
[  151.328462][  T233] RDX: 0000000000000001 RSI: ffff8881418f31a0 RDI: ffff88841d5890e0
[  151.328523][  T233] RBP: 1ffff11083973e7a R08: 0000000000000000 R09: fffffbfff0be6bb4
[  151.328583][  T233] R10: ffffffff85f35da7 R11: 0000000000000000 R12: ffff8881418f30e0
[  151.328644][  T233] R13: ffff8881418f3028 R14: ffff8881418f3024 R15: ffff8881418f3000
[  151.328706][  T233] FS:  00007f4c0c2c79c0(0000) GS:ffff8883c67d4000(0000) knlGS:0000000000000000
[  151.328773][  T233] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  151.328826][  T233] CR2: 00007f1e89a06c74 CR3: 000000041cb52003 CR4: 00000000003706f0
[  151.328885][  T233] Call Trace:
[  151.328921][  T233]  <TASK>
[  151.328960][  T233]  ? __pfx_device_trust_prepare+0x10/0x10
[  151.329020][  T233]  ? usb_driver_claim_interface+0x10b/0x1f0
[  151.329079][  T233]  ? rcu_is_watching+0x1d/0x70
[  151.329146][  T233]  ? trace_preempt_on+0xe3/0x130
[  151.329208][  T233]  device_bind_driver+0x4b/0xf0
[  151.329257][  T233]  ? _raw_spin_unlock_irqrestore+0x35/0x70
[  151.329315][  T233]  usb_driver_claim_interface+0x115/0x1f0
[  151.329385][  T233]  btusb_probe+0xbdd/0x1a4a [btusb]
[  151.329489][  T233]  ? __pfx_btusb_probe+0x10/0x10 [btusb]
[  151.329577][  T233]  ? usb_probe_interface+0x3e8/0x470
[  151.329628][  T233]  ? rcu_is_watching+0x1d/0x70
[  151.329693][  T233]  usb_probe_interface+0x1ca/0x470
[  151.329756][  T233]  ? __pfx_usb_probe_interface+0x10/0x10
[  151.329813][  T233]  ? kernfs_create_link+0xbd/0x130
[  151.329868][  T233]  ? kernfs_put+0x18/0x70
[  151.329927][  T233]  call_driver_probe+0x36/0x130
[  151.329983][  T233]  really_probe+0x19b/0x430
[  151.330038][  T233]  __driver_probe_device+0x101/0x230
[  151.330098][  T233]  driver_probe_device+0x4a/0xf0
[  151.330163][  T233]  __driver_attach+0x10b/0x2f0
[  151.330214][  T233]  ? __pfx___driver_attach+0x10/0x10
[  151.330261][  T233]  bus_for_each_dev+0xd2/0x130
[  151.330310][  T233]  ? __pfx_bus_for_each_dev+0x10/0x10
[  151.330357][  T233]  ? bus_add_driver+0x18b/0x2f0
[  151.330409][  T233]  ? trace_preempt_on+0xe3/0x130
[  151.330469][  T233]  bus_add_driver+0x1ab/0x2f0
[  151.330525][  T233]  driver_register+0xd8/0x170
[  151.330578][  T233]  usb_register_driver+0x10f/0x1f0
[  151.330628][  T233]  ? __pfx_init_module+0x10/0x10 [btusb]
[  151.330711][  T233]  do_one_initcall+0xb5/0x430
[  151.330760][  T233]  ? __kmalloc_cache_noprof+0x17a/0x630
[  151.330814][  T233]  ? __pfx_do_one_initcall+0x10/0x10
[  151.330866][  T233]  ? kasan_save_track+0x10/0x30
[  151.330913][  T233]  ? __kasan_kmalloc+0x8b/0xb0
[  151.330963][  T233]  ? __kmalloc_cache_noprof+0x269/0x630
[  151.331015][  T233]  ? do_init_module+0x88/0x470
[  151.331061][  T233]  ? kasan_unpoison+0x40/0x70
[  151.331118][  T233]  do_init_module+0x18a/0x470
[  151.331197][  T233]  ? __pfx_do_init_module+0x10/0x10
[  151.331249][  T233]  ? load_module+0xee2/0xef0
[  151.331295][  T233]  ? kfree+0x1f0/0x5b0
[  151.331356][  T233]  load_module+0xd77/0xef0
[  151.331424][  T233]  ? __pfx_load_module+0x10/0x10
[  151.331482][  T233]  ? __pfx_kernel_read_file+0x10/0x10
[  151.331540][  T233]  ? __pfx___fsnotify_parent+0x10/0x10
[  151.331604][  T233]  init_module
[  151.349570][  T233] usbcore: registered new interface driver btusb


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261102/202611020255.8c07b45b-lkp@intel.com


--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

