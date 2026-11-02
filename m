Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603036;
	b=ViYH8wAWje2zZIGDPhdGbAOREfmbFDzcywu9qHEcrWh5+QT9BR78LIjFIzY8h5pzTJX4
	 LPagjTen3zLcs3ChARRhIfMRBcc9+Ypv97M4B9UB+PkinPMNUVrkZMOpNRA/FVtbTKszw
	 /0GVQREWBhTHEXA1xSdo636hr54aT6yo1EBSShgXsoT/P52USVES7HvQj71n0cfjUyvon
	 AxCba3GJBs5YOCxM6P84dBgNUnZBirpGc3QylIobGEBL8RyCT6cYKO8K5c2dZHdJjEXkn
	 4AqE/l7jpSpj4S3tzZo4oLv6Vb8CNYsrcfFvYwCh9rO0j0E4AUY3HOof6wuE9qrRv7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603036;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=rBAy+z1U2lSrZ7cbgDMLtujhlLyfao7o1jAy8Wysb+M=;
	b=KKA2AhWHtbxMoFZPjMseQG5kVUk/cusRBnkdgOWUk0ykKGRy0GAbOcC8M0MteDiI4/fe
	 7p3GDYo2XxIUYl6pKc1fmL8X7BtyKO1VAhIkS83BQhUPumMddyGJ3CETdl5dRVfwehdn+
	 VqhEGgx/mKzD2jQ5pXNkZWFdDCR+2p1mk1yKNiaq/wGITE3GGJMoR6yFt0wfoVIh8D0vk
	 tb6psd48JiNnqvtPsc6ukptkPgQ1cto6+Kp3KE/voxcPHJxH/TT0TzkbzBpZRwHzrS+WL
	 4Q5dEmOXvutj3GmleQwYVNGlB12SJMVW1x4ycXz0IatD66YXo+lFBsR5JCuBuscn2Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JwARkaoW;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD1C606A326
	for <oe-lkp@lists.linux.dev>; Mon,  2 Nov 2026 07:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FD1C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JwARkaoW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793603035; x=1825139035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Et/xwI+0hz1pZTEbAJCbPDBvGWZIbGKzplMP08i/yGM=;
  b=JwARkaoWZJMLEo1pn6GEkSZbQ5iX7+ZHRQVQefWEX1gipcemN7VfO8J3
   4zFEuZbIRAybXLS+pcr5DgzovCLo5P3qKlVZu4NBlUmXlY6o4dGQ+OAVq
   5+Pl5lZJ5odg0a7wrRIMce/uG9aoeX5jFG4FLw2A3WLefmBFSg9Q+xwOH
   UaLjfsu5SImP+6/2n727vRforceiM0+ydZlyheoymjxzdecirlw7ZVqsr
   bIJHkluAU6CN33hSacAfGZq+yvBXpnPHj8x50O20HkNxF5nlJ5r3gBhN0
   XfMitJDVPC99SAjRpXL2f47PaMsS/i9pNjwdJJwhgWdsWihfcbeOxRXVb
   A==;
X-CSE-ConnectionGUID: v6X0UK62T1ixc6dHsXcuNg==
X-CSE-MsgGUID: wXhJ3d+bTX2cyiccGsXf1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2162049"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2162049"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 23:03:55 -0800
X-CSE-ConnectionGUID: Tdcxivi3QtOTSP3f/F97hg==
X-CSE-MsgGUID: k8ZrO3rhS4ut1lHN9m6I4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6373187"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 23:03:52 -0800
Date: Mon, 2 Nov 2026 15:03:49 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
	dmaengine@vger.kernel.org, yi1.lai@intel.com
Subject: [linus:master] [dmaengine]  2a93f5747d:
 INFO:task_blocked_for_more_than#seconds
Message-ID: <202611021447.f9ab47b7-lkp@intel.com>
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

kernel test robot noticed "INFO:task_blocked_for_more_than#seconds" on:

commit: 2a93f5747d0eef89a3158c91d185d37d0bca2491 ("dmaengine: idxd: Flush all pending descriptors") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linux-next/master 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64]

in testcase: lkvs
version: lkvs-x86_64-388e0c1-1_20260521
with following parameters:

	test: dma

config: x86_64-rhel-9.4-func
compiler: gcc-14
test machine: 256 threads 2 sockets GENUINE INTEL(R) XEON(R) (Sierra Forest) with 128G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)

If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202611021447.f9ab47b7-lkp@intel.com


kern  :err   : [ 5423.292137] [   T1658] INFO: task modprobe:11531 blocked for more than 4915 seconds.
kern  :err   : [ 5423.301474] [   T1658]       Not tainted 7.0.0-rc1+ #1
kern  :err   : [ 5423.307296] [   T1658] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kern  :info  : [ 5423.320648] [   T1658] task:modprobe        state:D stack:0     pid:11531 tgid:11531 ppid:11511  task_flags:0x400100 flags:0x00080800
kern  :info  : [ 5423.334425] [   T1658] Call Trace:
kern  :info  : [ 5423.338277] [   T1658]  <TASK>
kern  :info  : [ 5423.345059] [   T1658]  __schedule+0x720/0x10b0
kern  :info  : [ 5423.350188] [   T1658]  ? _printk+0xb1/0xf0
kern  :info  : [ 5423.355121] [   T1658]  ? __pfx___schedule+0x10/0x10
kern  :info  : [ 5423.360748] [   T1658]  ? mutex_unlock+0x81/0xf0
kern  :info  : [ 5423.365968] [   T1658]  ? prepare_to_wait_event+0x8e/0x730
kern  :info  : [ 5423.373937] [   T1658]  schedule+0x6b/0x1b0
kern  :info  : [ 5423.379636] [   T1658]  dmatest_init+0xf5/0xff0 [dmatest]
kern  :info  : [ 5423.385782] [   T1658]  ? __pfx_dmatest_init+0x10/0x10 [dmatest]
kern  :info  : [ 5423.392794] [   T1658]  ? __pfx_autoremove_wake_function+0x10/0x10
kern  :info  : [ 5423.399783] [   T1658]  ? ktime_get+0x61/0x170
kern  :info  : [ 5423.404977] [   T1658]  ? __pfx_dmatest_init+0x10/0x10 [dmatest]
kern  :info  : [ 5423.411769] [   T1658]  ? trace_initcall_start_cb+0x5b/0x90
kern  :info  : [ 5423.421348] [   T1658]  ? __pfx_dmatest_init+0x10/0x10 [dmatest]
kern  :info  : [ 5423.428106] [   T1658]  do_one_initcall+0x8d/0x3f0
kern  :info  : [ 5423.436782] [   T1658]  ? __pfx_do_one_initcall+0x10/0x10
kern  :info  : [ 5423.442848] [   T1658]  ? kasan_unpoison+0x40/0x70
kern  :info  : [ 5423.448390] [   T1658]  ? __kasan_slab_alloc+0x2f/0x70
kern  :info  : [ 5423.454178] [   T1658]  ? kasan_unpoison+0x40/0x70
kern  :info  : [ 5423.462863] [   T1658]  do_init_module+0x281/0x830
kern  :info  : [ 5423.468228] [   T1658]  ? __pfx_do_init_module+0x10/0x10
kern  :info  : [ 5423.477456] [   T1658]  ? kfree+0x195/0x430
kern  :info  : [ 5423.482122] [   T1658]  ? klp_module_coming+0x210/0x2f0
kern  :info  : [ 5423.488589] [   T1658]  load_module+0x173d/0x2070
kern  :info  : [ 5423.493917] [   T1658]  ? ima_post_read_file+0x18f/0x230
kern  :info  : [ 5423.499863] [   T1658]  ? __pfx_load_module+0x10/0x10
kern  :info  : [ 5423.508681] [   T1658]  ? security_kernel_post_read_file+0x35/0xf0
kern  :info  : [ 5423.516645] [   T1658]  ? kernel_read_file+0x3d6/0x870
kern  :info  : [ 5423.522401] [   T1658]  ? __pfx_kernel_read_file+0x10/0x10
kern  :info  : [ 5423.529212] [   T1658]  ? init_module_from_file+0x157/0x1b0
kern  :info  : [ 5423.535536] [   T1658]  init_module_from_file+0x157/0x1b0
kern  :info  : [ 5423.544935] [   T1658]  ? __pfx_init_module_from_file+0x10/0x10
kern  :info  : [ 5423.552162] [   T1658]  ? fdget+0x54/0x3b0
kern  :info  : [ 5423.556754] [   T1658]  ? __pfx___x64_sys_openat+0x10/0x10
kern  :info  : [ 5423.566190] [   T1658]  ? _raw_spin_lock+0x80/0xf0
kern  :info  : [ 5423.574838] [   T1658]  ? __pfx__raw_spin_lock+0x10/0x10
kern  :info  : [ 5423.580774] [   T1658]  ? do_syscall_64+0x140/0x5b0
kern  :info  : [ 5423.586317] [   T1658]  idempotent_init_module+0x21c/0x770
kern  :info  : [ 5423.592478] [   T1658]  ? __pfx_idempotent_init_module+0x10/0x10
kern  :info  : [ 5423.599828] [   T1658]  ? fdget+0x54/0x3b0
kern  :info  : [ 5423.604386] [   T1658]  ? security_capable+0x35/0xf0
kern  :info  : [ 5423.613239] [   T1658]  __x64_sys_finit_module+0xca/0x170
kern  :info  : [ 5423.619267] [   T1658]  do_syscall_64+0x108/0x5b0
kern  :info  : [ 5423.624907] [   T1658]  ? do_syscall_64+0x140/0x5b0
kern  :info  : [ 5423.630418] [   T1658]  ? irqentry_exit+0x76/0x4f0
kern  :info  : [ 5423.635766] [   T1658]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
kern  :info  : [ 5423.645649] [   T1658] RIP: 0033:0x7f3663edd7b9
kern  :info  : [ 5423.650732] [   T1658] RSP: 002b:00007fffe974f718 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
kern  :info  : [ 5423.660773] [   T1658] RAX: ffffffffffffffda RBX: 00005555acf52ac0 RCX: 00007f3663edd7b9
kern  :info  : [ 5423.670099] [   T1658] RDX: 0000000000000000 RSI: 00005555acf52c40 RDI: 0000000000000004
kern  :info  : [ 5423.679369] [   T1658] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
kern  :info  : [ 5423.692029] [   T1658] R10: 0000000000000000 R11: 0000000000000246 R12: 00005555acf52c40
kern  :info  : [ 5423.701338] [   T1658] R13: 0000000000040000 R14: 00005555acf52be0 R15: 0000000000000000
kern  :info  : [ 5423.710800] [   T1658]  </TASK>
kern  :info  : [ 5423.714370] [   T1658] Future hung task reports are suppressed, see sysctl kernel.hung_task_warnings


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261102/202611021447.f9ab47b7-lkp@intel.com


--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

