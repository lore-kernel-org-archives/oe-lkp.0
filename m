Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8AE146D55;
	Sat,  4 Jan 2025 20:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736022711; cv=none; b=rPHGcBedO7RGHeqFbyVZKpJ9J24v6HQU20LLdDN0hZPUWrfadOmycf0mqlffcKCzcBYwMoZU5fzfGr5hL0FLc/hxt2RRlMWTqMYO+0tRK5rkjuoybYYe2FLtAqcW25IulFuxngIqRcQkOXphBJ6nWcHlUZ/EwnLAsi69uhZ+rsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736022711; c=relaxed/simple;
	bh=i6nmLTZnibj2QAxHEm/s+eSLxbOLL14aDEJcnf3S2/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4A1UOFwJKk/QnSucuLAGzoPJsLpmmyAy7GEpwfAceEu7tC4z7wLqaLUaoy1lgy5JZDG1grfC1bHdK7Dd69wMIl8P3L5WMNtkRb9zBAIS+HRA7/Cf1B7tshnbp3V9nAw9T/LCLY16NPTzw2RzUwSk690PJ9J7BnPMco0cpBm+lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqTljzVR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqTljzVR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D83C4CED1;
	Sat,  4 Jan 2025 20:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736022711;
	bh=i6nmLTZnibj2QAxHEm/s+eSLxbOLL14aDEJcnf3S2/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jqTljzVRLPD85eGsU1O+pkeql88KuZhfJONcqk2SwrLekQN23StoZOlFU+6A596hH
	 Go1aeLIZz63x4I7b1GEkhRWwQQ7uDG1m62kwAoI92YL1u7NG4yjjZ1XvcsHxbf/JXE
	 dHXK4bX+F3naTT1ediM2K0R2N1nom+I1Op0JI/VUhlAI7dpWFw5kRXDMGQlKRIj9mi
	 aXgNW8HaYD5paPGmes9T/wrase3pREiw6Ki7wEZvfmtdyKrRij7vlPdTo2ll6Qg3f/
	 O5Jumabpty0pazItlMWZSgR/USfptTX7kqu1dIVYILRc/ZmRUm2Zku8KGFwqaXS4JN
	 Vs3dw9GgJ52LA==
Date: Sat, 4 Jan 2025 21:31:48 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [linus:master] [timers/migration]  10a0e6f3d3:
 BUG:KCSAN:data-race_in__tmigr_cpu_activate/print_report
Message-ID: <Z3matMUxYXfIzZ8c@pavilion.home>
References: <202501031612.62e0c498-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202501031612.62e0c498-lkp@intel.com>

Le Fri, Jan 03, 2025 at 04:24:52PM +0800, kernel test robot a écrit :
> 
> 
> Hello,
> 
> kernel test robot noticed "BUG:KCSAN:data-race_in__tmigr_cpu_activate/print_report" on:
> 
> commit: 10a0e6f3d3db7dcfe36e578923e5f038f1d2b72a ("timers/migration: Move hierarchy setup into cpuhotplug prepare callback")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> [test failed on linus/master      ccb98ccef0e543c2bd4ef1a72270461957f3d8d0]
> [test failed on linux-next/master 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2]
> 
> in testcase: trinity
> version: 
> with following parameters:
> 
> 	runtime: 300s
> 	group: group-00
> 	nr_groups: 5
> 
> 
> 
> config: x86_64-randconfig-003-20241231
> compiler: gcc-12
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> we observed the issue happens randomly, but keeps clean on parent.
> 
> 
> facd40aa5c4699f9 10a0e6f3d3db7dcfe36e578923e
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :48          17%           8:48    dmesg.BUG:KCSAN:data-race_in__tmigr_cpu_activate/print_report
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202501031612.62e0c498-lkp@intel.com
> 
> 
> [   30.027314][    T0] BUG: KCSAN: data-race in __tmigr_cpu_activate / print_report
> [   30.027314][    T0]
> [   30.027314][    T0] write to 0xffff88842fc28004 of 1 bytes by task 0 on cpu 0:
> [ 30.027314][ T0] __tmigr_cpu_activate (kernel/time/timer_migration.c:689)
> [ 30.027314][ T0] tmigr_cpu_activate (kernel/time/timer_migration.c:713)
> [ 30.027314][ T0] timer_clear_idle (kernel/time/timer.c:2380 (discriminator 22))
> [ 30.027314][ T0] tick_nohz_restart_sched_tick (kernel/time/tick-sched.c:1097)
> [ 30.027314][ T0] tick_nohz_idle_exit (kernel/time/tick-sched.c:1442 kernel/time/tick-sched.c:1483)
> [ 30.027314][ T0] do_idle (arch/x86/include/asm/bitops.h:75 include/linux/sched/idle.h:36 kernel/sched/idle.c:346)
> [ 30.027314][ T0] cpu_startup_entry (kernel/sched/idle.c:429 (discriminator 1))
> [ 30.027314][ T0] kernel_init (init/main.c:1459)
> [ 30.027314][ T0] do_initcalls (init/main.c:1333)
> [ 30.027314][ T0] clear_bss (arch/x86/kernel/head64.c:381)
> [ 30.027314][ T0] reserve_bios_regions (arch/x86/kernel/ebda.c:57)
> [ 30.027314][ T0] common_startup_64 (arch/x86/kernel/head_64.S:421)
> [   30.027314][    T0]
> [   30.027314][    T0] read to 0xffff88842fc28004 of 1 bytes by task 0 on cpu 1:
> [ 30.027314][ T0] print_report (kernel/kcsan/report.c:395)
> [ 30.027314][ T0] kcsan_report_known_origin (kernel/kcsan/report.c:504 kernel/kcsan/report.c:694)
> [ 30.027314][ T0] kcsan_setup_watchpoint (kernel/kcsan/core.c:678)
> [ 30.027314][ T0] tmigr_next_groupevt (kernel/time/timer_migration.c:576)
> [ 30.027314][ T0] tmigr_update_events (kernel/time/timer_migration.c:618 kernel/time/timer_migration.c:853)
> [ 30.027314][ T0] tmigr_inactive_up (kernel/time/timer_migration.c:1327)

It looks like the .ignore flag accesses and I think it should be tagged as a
voluntary data_race().

Let me cook a patch for that.

Thanks.
