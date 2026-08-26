Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EBD392C46
	for <oe-lkp@lists.linux.dev>; Wed, 26 Aug 2026 06:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787724713; cv=none; b=Lc8Gyf81UoLrLKbKlorqEy5Rz4A7+kpwQGXVsSJ/JX8wyugaVipcuUkM3ggfafzKSZSpA8bKhIjVRXf8EBYXTmY0QKFtVhkzdhACSdIQ3WMg+65pqAjlnKWvx35Bkn8Y4kGUsKWuhl1tXg3Fk5UqdGZlQ9mgu2qjY57qRoWaNo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787724713; c=relaxed/simple;
	bh=emUtRVfgcKuG6DfLkqKcdABC6V+ywcL1xYrm6LP3v6M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pfd4vqTn9QbMRzxyONQtC0Uccfrf1NYbCiKMYseSw/xkaY1yffeEmxawnLbHmmufk8G70ANug3lgADfdGfzI4fih9qqlvnn4UdUmHpclquTF+ikvzXRw2JHVo8+e0hCala8L6YVb6jyQU6S4QrWJX5Ktw6sqd/XfjAxVTO4Qhr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpzf3e37; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpzf3e37"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787724711; x=1819260711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=emUtRVfgcKuG6DfLkqKcdABC6V+ywcL1xYrm6LP3v6M=;
  b=hpzf3e374MQR7aHh+5rj4OrEl7N11juIKNCxTuVSxA4AsTmrQFZO3L6I
   f7Yyh8Z65KRI/rKRfGAOVMt4kI9INRNFuGLDkadt5+10TB2zHPxYZ6Y/O
   vhxi6ewhlLtVgdgvdA+DdQnKC4R3aKohWX1k8j47BTP0cxZlfPQP7a/pd
   Vhf2bg9Pp4MCzf7GBKyyztg+VyK90DPsjOYlgJz+jhroUPJyDyOvpN6bR
   RjB9bEiH9/fi6kmBZakbRuwPtp0AR6vgQo47zXFdbeG+GkhDFMDSY5Cv3
   +AJw+dbq0c+DM4x3RA8ZbegBflGevR0rVD8V8Bm1+bwNkOeVPZlBObPGU
   w==;
X-CSE-ConnectionGUID: FmGVTWNuReiSLLWh30UfqQ==
X-CSE-MsgGUID: 6KDXP5pZQeWoVQCH5m25mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88077233"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="88077233"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 23:11:50 -0700
X-CSE-ConnectionGUID: 34bQO/UIT62kATgRi3tiLA==
X-CSE-MsgGUID: h6ZPoQG1S4uluTx9QYm0qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="271692824"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 23:11:48 -0700
Date: Wed, 26 Aug 2026 14:11:45 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, yi1.lai@intel.com
Subject: [jimc:dd-cached-prefix] [lib/dynamic_debug.c]  6a0ecd05d6:
 WARNING:suspicious_RCU_usage
Message-ID: <202608261347.906ae389-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

kernel test robot noticed "WARNING:suspicious_RCU_usage" on:

commit: 6a0ecd05d62aace49cf2087f480e772f0644a8d5 ("lib/dynamic_debug.c: Compress site-data and reclaim trees via shrinker") https://github.com/jimc/linux.git dd-cached-prefix

in testcase: trinity
version: 
with following parameters:

	runtime: 300s
	group: group-00
	nr_groups: 5


config: x86_64-randconfig-016-20260822
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)

If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202608261347.906ae389-lkp@intel.com


[  162.632128][   T37] =============================
[  162.634749][   T37] WARNING: suspicious RCU usage
[  162.637528][   T37] 7.2.0-00075-g6a0ecd05d62a #1 Tainted: G                T  
[  162.641711][   T37] -----------------------------
[  162.644477][   T37] lib/maple_tree.c:764 suspicious rcu_dereference_protected() usage!
[  162.648937][   T37] 
[  162.648937][   T37] other info that might help us debug this:
[  162.648937][   T37] 
[  162.648937][   T37] other info that might help us debug this:
[  162.648937][   T37] 
[  162.648937][   T37] other info that might help us debug this:
[  162.648937][   T37] 
[  162.654522][   T37] 
[  162.654522][   T37] rcu_scheduler_active = 2, debug_locks = 1
[  162.654522][   T37] 
[  162.654522][   T37] rcu_scheduler_active = 2, debug_locks = 1
[  162.654522][   T37] 
[  162.654522][   T37] rcu_scheduler_active = 2, debug_locks = 1
[  162.658907][   T37] 2 locks held by kswapd0/37:
[  162.661566][   T37]  #0: ffffffff864d7380 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0x619/0x1240
[  162.666732][   T37]  #1: ffffffff867fe838 (ddebug_lock){+.+.}-{4:4}, at: ddebug_shrinker_scan+0x20/0x180
[  162.671967][   T37] 
[  162.671967][   T37] stack backtrace:
[  162.671967][   T37] 
[  162.671967][   T37] stack backtrace:
[  162.671967][   T37] 
[  162.671967][   T37] stack backtrace:
[  162.675394][   T37] CPU: 0 UID: 0 PID: 37 Comm: kswapd0 Tainted: G                T   7.2.0-00075-g6a0ecd05d62a #1 PREEMPTLAZY 
[  162.681670][   T37] Tainted: [T]=RANDSTRUCT
[  162.684117][   T37] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  162.689603][   T37] Call Trace:
[  162.697070][   T37]  <TASK>
[  162.698843][   T37]  dump_stack_lvl+0x3e/0x80
[  162.701411][   T37]  dump_stack+0x14/0x19
[  162.703712][   T37]  lockdep_rcu_suspicious.cold+0x40/0x67
[  162.706616][   T37]  __mt_destroy+0x285/0x300
[  162.710407][   T37]  ddebug_shrinker_scan+0x3c/0x180
[  162.713321][   T37]  do_shrink_slab+0x321/0xa40
[  162.716035][   T37]  shrink_slab+0x243/0x3c0
[  162.718455][   T37]  ? do_shrink_slab+0xa40/0xa40
[  162.721031][   T37]  ? trace_hardirqs_on+0x27/0x180
[  162.724925][   T37]  shrink_node+0x184/0xd00
[  162.729423][   T37]  balance_pgdat+0x596/0x1240
[  162.732091][   T37]  ? schedule+0x27f/0x340
[  162.734646][   T37]  ? shrink_node+0xd00/0xd00
[  162.737613][   T37]  kswapd+0x306/0x5c0
[  162.739854][   T37]  ? balance_pgdat+0x1240/0x1240
[  162.742519][   T37]  ? kasan_metadata_fetch_row+0x40/0x40
[  162.745421][   T37]  ? __kthread_parkme+0xcb/0x240
[  162.748004][   T37]  kthread+0x3c0/0x500
[  162.750177][   T37]  ? calculate_sigpending+0x8f/0x100
[  162.752982][   T37]  ? balance_pgdat+0x1240/0x1240
[  162.755533][   T37]  ? kthread_affine_node+0x280/0x280
[  162.758321][   T37]  ret_from_fork+0x4f7/0x900
[  162.760690][   T37]  ? arch_exit_to_user_mode_prepare+0x240/0x240
[  162.764190][   T37]  ? __kasan_check_read+0x15/0x40
[  162.771174][   T37]  ? __switch_to+0x25/0xd00
[  162.773586][   T37]  ? kthread_affine_node+0x280/0x280
[  162.776356][   T37]  ret_from_fork_asm+0x11/0x20
[  162.779035][   T37]  </TASK>
[  162.894140][   T37] 
[  162.895682][   T37] =============================
[  162.899769][   T37] WARNING: suspicious RCU usage
[  162.902609][   T37] 7.2.0-00075-g6a0ecd05d62a #1 Tainted: G                T  
[  162.906891][   T37] -----------------------------
[  162.909745][   T37] lib/maple_tree.c:721 suspicious rcu_dereference_protected() usage!
[  162.914224][   T37] 
[  162.914224][   T37] other info that might help us debug this:
[  162.914224][   T37] 
[  162.914224][   T37] other info that might help us debug this:
[  162.914224][   T37] 
[  162.914224][   T37] other info that might help us debug this:
[  162.914224][   T37] 
[  162.919937][   T37] 
[  162.919937][   T37] rcu_scheduler_active = 2, debug_locks = 1
[  162.919937][   T37] 
[  162.919937][   T37] rcu_scheduler_active = 2, debug_locks = 1
[  162.919937][   T37] 
[  162.919937][   T37] rcu_scheduler_active = 2, debug_locks = 1
[  162.924506][   T37] 2 locks held by kswapd0/37:
[  162.927274][   T37]  #0: ffffffff864d7380 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0x619/0x1240
[  162.932577][   T37]  #1: ffffffff867fe838 (ddebug_lock){+.+.}-{4:4}, at: ddebug_shrinker_scan+0x20/0x180
[  162.937489][   T37] 
[  162.937489][   T37] stack backtrace:
[  162.937489][   T37] 
[  162.937489][   T37] stack backtrace:
[  162.937489][   T37] 
[  162.937489][   T37] stack backtrace:
[  162.940765][   T37] CPU: 0 UID: 0 PID: 37 Comm: kswapd0 Tainted: G                T   7.2.0-00075-g6a0ecd05d62a #1 PREEMPTLAZY 
[  162.947965][   T37] Tainted: [T]=RANDSTRUCT
[  162.950387][   T37] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  162.955983][   T37] Call Trace:
[  162.957918][   T37]  <TASK>
[  162.959649][   T37]  dump_stack_lvl+0x3e/0x80
[  162.962056][   T37]  dump_stack+0x14/0x19
[  162.964223][   T37]  lockdep_rcu_suspicious.cold+0x40/0x67
[  162.967149][   T37]  mte_destroy_descend+0x23e/0x500
[  162.970056][   T37]  mt_destroy_walk+0x293/0x1140
[  162.972780][   T37]  ? nbcon_cpu_emergency_exit+0x127/0x180
[  162.975739][   T37]  ? mas_state_walk+0x580/0x580
[  162.978358][   T37]  __mt_destroy+0x234/0x300
[  162.980750][   T37]  ddebug_shrinker_scan+0x3c/0x180
[  162.983583][   T37]  do_shrink_slab+0x321/0xa40
[  162.986293][   T37]  shrink_slab+0x243/0x3c0
[  162.988741][   T37]  ? do_shrink_slab+0xa40/0xa40
[  162.991403][   T37]  ? trace_hardirqs_on+0x27/0x180
[  162.994248][   T37]  shrink_node+0x184/0xd00
[  162.996831][   T37]  balance_pgdat+0x596/0x1240
[  162.999431][   T37]  ? schedule+0x27f/0x340
[  163.001968][   T37]  ? shrink_node+0xd00/0xd00
[  163.004610][   T37]  kswapd+0x306/0x5c0
[  163.006906][   T37]  ? balance_pgdat+0x1240/0x1240
[  163.009673][   T37]  ? kasan_metadata_fetch_row+0x40/0x40
[  163.012694][   T37]  ? __kthread_parkme+0xcb/0x240
[  163.015526][   T37]  kthread+0x3c0/0x500
[  163.017914][   T37]  ? calculate_sigpending+0x8f/0x100
[  163.020864][   T37]  ? balance_pgdat+0x1240/0x1240
[  163.023570][   T37]  ? kthread_affine_node+0x280/0x280
[  163.026666][   T37]  ret_from_fork+0x4f7/0x900
[  163.029310][   T37]  ? arch_exit_to_user_mode_prepare+0x240/0x240
[  163.033052][   T37]  ? __kasan_check_read+0x15/0x40
[  163.035692][   T37]  ? __switch_to+0x25/0xd00
[  163.038196][   T37]  ? kthread_affine_node+0x280/0x280
[  163.040945][   T37]  ret_from_fork_asm+0x11/0x20
[  163.043482][   T37]  </TASK>


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260826/202608261347.906ae389-lkp@intel.com

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


