Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BF0C144
	for <oe-lkp@lists.linux.dev>; Wed,  8 May 2024 04:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715144139; cv=none; b=dPOD5L9MUFzHQnboIJ+NjmykcH2eonXRlFUttH1oJyrEbdOCsBIG7DhaJO4cl3LqV8+gfgcVCQDz9rm3Du744LoIbOHpDRhPfh2InuRwsxrPrK6NXIWJp1p4AafyrozTGh1+Tdk+1myISp6ry0POvlRzqdMmkz/vQ6lInRXtlMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715144139; c=relaxed/simple;
	bh=U41MrgbYkPsrR6ThQO+8iR1bpZP3uqlDLJ8VV1Zd/6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l0vJB3j5ivGciVCpDcnYpeyD8+E7T2EfRtydV+u8s6YgjDy+128XZeEpv5gJwLI3M6nF+Xl+uml58kPSB6kv2LyqJqc5x0UsoVjHIZ2FAjU6jb5zg8Ltm5B+oq5PSIBTiPfjNZaZNuG2cXWDDpXYLSRLgx/kNe8aXMrzIbVSBBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHwIvQgF; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHwIvQgF"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-628a551d10cso1915772a12.1
        for <oe-lkp@lists.linux.dev>; Tue, 07 May 2024 21:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715144137; x=1715748937; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcNRCWZQuK2YXfFCpoV9ZB/QI8fhXRe4GDZiAfl5EvM=;
        b=nHwIvQgFIiwWCuAhy6kQl8KDi8vyh79oaSrNDioZOQEnZA5gi7LJsTkt3ha18oYJza
         7GXAot/d4X8h0aIKNkYofqxnBYEG0tGkQ0wtXGcmfDTuM4qb1NUE/GERSTUKM3Q7JlTA
         2xU9QPKkVcEv01A/ACKpIem0moGpIIRsuWZANMlyoDJdJ70T2yYQ89pASbuINPpI9zs6
         7J5klzFuo/RTHadIP1Jdcn9HgthMW1TgmKPVumEZ/KmrdWCJHl2LnzuxtUjTiewb0Jyv
         KuLoT4EXqKTL0mgvyDtsvCWMM2ogG/0N1GbEwI8puxbwQy+iOD3eGyMr0URQx8QTa1UT
         Mqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715144137; x=1715748937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcNRCWZQuK2YXfFCpoV9ZB/QI8fhXRe4GDZiAfl5EvM=;
        b=d7Nd6UBLOLmc94y7UQxATq2wc0AlBJ/j/QxbcVK1alb+vyF7paMeYo+ZOETbWLaE5N
         pUAbkDFpHK4WvrPKyX0f0N3iFTzzwZ4HUg45938bitu7G/LUwn9sjGBXm5+Aa8Y69QIV
         8sLMZxft6NbcHvNkq8ZBmO71MTANtZi7bD7k/M/A/9pUN6k4T+blz5+64N7r+3u6XGmJ
         Luk7XS8IY7Okg0Q3pp7LGPA0Z2h7S0IapNXaAOYr4A+sOVHHwuQGYpDA2D42COxP5Dag
         z2T7GU2E6FrWL3CQpl+48dOcfGnK1hpFOl+bnToTD5ZnbYFSHCUaFkScB28+lZB1bi5y
         SIMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVm6uSorwSRJd337/wcCgSSKMK56xBL5bf0hgaenBvBBmEURz+CCjb3qZN4UfsajwO872pvV5LC02LgQso7t3dpdmTaynD
X-Gm-Message-State: AOJu0Yxm5g2TNIQrqzMINfyMYgoC4vgdgRl9G/hLBruyp3AtYK7AbIYt
	AMSh2qgqEu43c2xaGfr0k9Fv4qPiAuPpoOS8j1ASFqy3J5CmxdKXlKyEsq4jCrvOLoEKbVfB3gj
	UVs+dgtUkax2RZasfFWzWAt52oAmbHO7x
X-Google-Smtp-Source: AGHT+IEgdaboXMD1SZjC+1ENkzJAKSXDfPlFJc3dWJ6Ku0Yief/WCdOwX0S0AqL9vzZfioFpDMgQpsky7WFY4jOaYrs=
X-Received: by 2002:a05:6a21:3985:b0:1af:9ede:58a4 with SMTP id
 adf61e73a8af0-1afc8dbe129mr1913419637.42.1715144136710; Tue, 07 May 2024
 21:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405072252.959dadc4-lkp@intel.com>
In-Reply-To: <202405072252.959dadc4-lkp@intel.com>
From: Z qiang <qiang.zhang1211@gmail.com>
Date: Wed, 8 May 2024 12:55:25 +0800
Message-ID: <CALm+0cViRh07e88uMrRp=5K0TgBVFwmwLiLnejc7puEMXrmFsA@mail.gmail.com>
Subject: Re: [linux-next:master] [rcu/nocb] 4c66bc7cac: BUG:using_smp_processor_id()in_preemptible
To: kernel test robot <oliver.sang@intel.com>
Cc: Frederic Weisbecker <frederic@kernel.org>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, "Paul E. McKenney" <paulmck@kernel.org>, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
>
>
> Hello,
>
> kernel test robot noticed "BUG:using_smp_processor_id()in_preemptible" on:
>
> commit: 4c66bc7cacc08e8abcf5049d2b90bfd800904336 ("rcu/nocb: Use kthread parking instead of ad-hoc implementation")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> [test failed on linux-next/master 9221b2819b8a4196eecf5476d66201be60fbcf29]
>
> in testcase: boot
>
> compiler: gcc-13
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> +--------------------------------------------------------------+------------+------------+
> |                                                              | 6deb20902f | 4c66bc7cac |
> +--------------------------------------------------------------+------------+------------+
> | BUG:using_smp_processor_id()in_preemptible                   | 0          | 12         |
> +--------------------------------------------------------------+------------+------------+
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202405072252.959dadc4-lkp@intel.com
>
>
> [    4.099901][   T18] BUG: using smp_processor_id() in preemptible [00000000] code: rcuop/0/18
> [ 4.101313][ T18] caller is debug_smp_processor_id (lib/smp_processor_id.c:61)
> [    4.102493][   T18] CPU: 0 PID: 18 Comm: rcuop/0 Not tainted 6.9.0-rc2-00079-g4c66bc7cacc0 #1
> [    4.104098][   T18] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [    4.104398][   T18] Call Trace:
> [    4.104398][   T18]  <TASK>
> [ 4.104398][ T18] dump_stack_lvl (lib/dump_stack.c:116)
> [ 4.104398][ T18] dump_stack (lib/dump_stack.c:124)
> [ 4.104398][ T18] check_preemption_disabled (arch/x86/include/asm/preempt.h:84 (discriminator 15) lib/smp_processor_id.c:53 (discriminator 15))
> [ 4.104398][ T18] debug_smp_processor_id (lib/smp_processor_id.c:61)
> [ 4.104398][ T18] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 1))
> [ 4.104398][ T18] nocb_cb_wait (kernel/rcu/tree_nocb.h:936 (discriminator 2))


Please try the following modifications:

diff --git a/kernel/rcu/tree_plugin.h b/kernel/rcu/tree_plugin.h
index 340bbefe5f65..b93e40206621 100644
--- a/kernel/rcu/tree_plugin.h
+++ b/kernel/rcu/tree_plugin.h
@@ -28,8 +28,8 @@ static bool rcu_rdp_is_offloaded(struct rcu_data *rdp)
                !(lockdep_is_held(&rcu_state.barrier_mutex) ||
                  (IS_ENABLED(CONFIG_HOTPLUG_CPU) && lockdep_is_cpus_held()) ||
                  rcu_lockdep_is_held_nocb(rdp) ||
-                 (rdp == this_cpu_ptr(&rcu_data) &&
-                  !(IS_ENABLED(CONFIG_PREEMPT_COUNT) && preemptible())) ||
+                  (!(IS_ENABLED(CONFIG_PREEMPT_COUNT) && preemptible()) &&
+                   rdp == this_cpu_ptr(&rcu_data)) ||
                  rcu_current_is_nocb_kthread(rdp)),
                "Unsafe read of RCU_NOCB offloaded state"
        );

Thanks
Zqiang


> [ 4.104398][ T18] ? __this_cpu_preempt_check (lib/smp_processor_id.c:67)
> [ 4.104398][ T18] ? lockdep_hardirqs_on (kernel/locking/lockdep.c:4421 (discriminator 16))
> [ 4.104398][ T18] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:983 (discriminator 1))
> [ 4.104398][ T18] ? nocb_cb_wait (kernel/rcu/tree_nocb.h:976)
> [ 4.104398][ T18] kthread (kernel/kthread.c:388)
> [ 4.104398][ T18] ? kthread (kernel/kthread.c:373 (discriminator 2))
> [ 4.104398][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> [ 4.104398][ T18] ret_from_fork (arch/x86/kernel/process.c:153)
> [ 4.104398][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> [ 4.104398][ T18] ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> [    4.104398][   T18]  </TASK>
> [    4.106221][   T18] BUG: using smp_processor_id() in preemptible [00000000] code: rcuop/0/18
> [ 4.107796][ T18] caller is debug_smp_processor_id (lib/smp_processor_id.c:61)
> [    4.108547][   T18] CPU: 0 PID: 18 Comm: rcuop/0 Not tainted 6.9.0-rc2-00079-g4c66bc7cacc0 #1
> [    4.109667][   T18] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [    4.111064][   T18] Call Trace:
> [    4.111064][   T18]  <TASK>
> [ 4.111064][ T18] dump_stack_lvl (lib/dump_stack.c:116)
> [ 4.111064][ T18] dump_stack (lib/dump_stack.c:124)
> [ 4.111064][ T18] check_preemption_disabled (arch/x86/include/asm/preempt.h:84 (discriminator 15) lib/smp_processor_id.c:53 (discriminator 15))
> [ 4.111064][ T18] debug_smp_processor_id (lib/smp_processor_id.c:61)
> [ 4.111064][ T18] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 1))
> [ 4.111064][ T18] nocb_cb_wait (kernel/rcu/tree_nocb.h:936 (discriminator 2))
> [ 4.111064][ T18] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:983 (discriminator 1))
> [ 4.111064][ T18] ? nocb_cb_wait (kernel/rcu/tree_nocb.h:976)
> [ 4.111064][ T18] kthread (kernel/kthread.c:388)
> [ 4.111064][ T18] ? kthread (kernel/kthread.c:373 (discriminator 2))
> [ 4.111064][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> [ 4.111064][ T18] ret_from_fork (arch/x86/kernel/process.c:153)
> [ 4.111064][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> [ 4.111064][ T18] ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> [    4.111064][   T18]  </TASK>
> [    4.132677][    T1] NMI watchdog: Perf NMI watchdog permanently disabled
> [    4.135331][   T18] BUG: using smp_processor_id() in preemptible [00000000] code: rcuop/0/18
> [ 4.137454][ T18] caller is debug_smp_processor_id (lib/smp_processor_id.c:61)
> [    4.137849][   T18] CPU: 0 PID: 18 Comm: rcuop/0 Not tainted 6.9.0-rc2-00079-g4c66bc7cacc0 #1
> [    4.139414][   T18] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [    4.141064][   T18] Call Trace:
> [    4.141064][   T18]  <TASK>
> [ 4.141064][ T18] dump_stack_lvl (lib/dump_stack.c:116)
> [ 4.141064][ T18] dump_stack (lib/dump_stack.c:124)
> [ 4.141064][ T18] check_preemption_disabled (arch/x86/include/asm/preempt.h:84 (discriminator 15) lib/smp_processor_id.c:53 (discriminator 15))
> [ 4.141064][ T18] debug_smp_processor_id (lib/smp_processor_id.c:61)
> [ 4.141064][ T18] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 1))
> [ 4.141064][ T18] nocb_cb_wait (kernel/rcu/tree_nocb.h:936 (discriminator 2))
> [ 4.141064][ T18] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:983 (discriminator 1))
> [ 4.141064][ T18] ? nocb_cb_wait (kernel/rcu/tree_nocb.h:976)
> [ 4.141064][ T18] kthread (kernel/kthread.c:388)
> [ 4.141064][ T18] ? kthread (kernel/kthread.c:373 (discriminator 2))
> [ 4.141064][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> [ 4.141064][ T18] ret_from_fork (arch/x86/kernel/process.c:153)
> [ 4.141064][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> [ 4.141064][ T18] ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> [    4.141064][   T18]  </TASK>
> [    4.141391][   T18] BUG: using smp_processor_id() in preemptible [00000000] code: rcuop/0/18
> [ 4.143427][ T18] caller is debug_smp_processor_id (lib/smp_processor_id.c:61)
> [    4.144497][   T18] CPU: 0 PID: 18 Comm: rcuop/0 Not tainted 6.9.0-rc2-00079-g4c66bc7cacc0 #1
> [    4.146055][   T18] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [    4.147731][   T18] Call Trace:
> [    4.147731][   T18]  <TASK>
> [ 4.147731][ T18] dump_stack_lvl (lib/dump_stack.c:116)
> [ 4.147731][ T18] dump_stack (lib/dump_stack.c:124)
> [ 4.147731][ T18] check_preemption_disabled (arch/x86/include/asm/preempt.h:84 (discriminator 15) lib/smp_processor_id.c:53 (discriminator 15))
> [ 4.147731][ T18] debug_smp_processor_id (lib/smp_processor_id.c:61)
> [ 4.147731][ T18] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 1))
> [ 4.147731][ T18] nocb_cb_wait (kernel/rcu/tree_nocb.h:936 (discriminator 2))
> [ 4.147731][ T18] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:983 (discriminator 1))
> [ 4.147731][ T18] ? nocb_cb_wait (kernel/rcu/tree_nocb.h:976)
> [ 4.147731][ T18] kthread (kernel/kthread.c:388)
> [ 4.147731][ T18] ? kthread (kernel/kthread.c:373 (discriminator 2))
> [ 4.147731][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> [ 4.147731][ T18] ret_from_fork (arch/x86/kernel/process.c:153)
> [ 4.147731][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> [ 4.147731][ T18] ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> [    4.147731][   T18]  </TASK>
> [    4.148538][   T18] BUG: using smp_processor_id() in preemptible [00000000] code: rcuop/0/18
> [ 4.150537][ T18] caller is debug_smp_processor_id (lib/smp_processor_id.c:61)
> [    4.151144][   T18] CPU: 0 PID: 18 Comm: rcuop/0 Not tainted 6.9.0-rc2-00079-g4c66bc7cacc0 #1
> [    4.152635][   T18] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [    4.154398][   T18] Call Trace:
> [    4.154398][   T18]  <TASK>
> [ 4.154398][ T18] dump_stack_lvl (lib/dump_stack.c:116)
> [ 4.154398][ T18] dump_stack (lib/dump_stack.c:124)
> [ 4.154398][ T18] check_preemption_disabled (arch/x86/include/asm/preempt.h:84 (discriminator 15) lib/smp_processor_id.c:53 (discriminator 15))
> [ 4.154398][ T18] debug_smp_processor_id (lib/smp_processor_id.c:61)
> [ 4.154398][ T18] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 1))
> [ 4.154398][ T18] nocb_cb_wait (kernel/rcu/tree_nocb.h:936 (discriminator 2))
> [ 4.154398][ T18] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:983 (discriminator 1))
> [ 4.154398][ T18] ? nocb_cb_wait (kernel/rcu/tree_nocb.h:976)
> [ 4.154398][ T18] kthread (kernel/kthread.c:388)
> [ 4.154398][ T18] ? kthread (kernel/kthread.c:373 (discriminator 2))
> [ 4.154398][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> [ 4.154398][ T18] ret_from_fork (arch/x86/kernel/process.c:153)
> [ 4.154398][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> [ 4.154398][ T18] ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> [    4.154398][   T18]  </TASK>
> [    4.156100][    T1] smp: Bringing up secondary CPUs ...
> [    4.159421][   T18] BUG: using smp_processor_id() in preemptible [00000000] code: rcuop/0/18
> [ 4.161134][ T18] caller is debug_smp_processor_id (lib/smp_processor_id.c:61)
> [    4.162569][   T18] CPU: 0 PID: 18 Comm: rcuop/0 Not tainted 6.9.0-rc2-00079-g4c66bc7cacc0 #1
> [    4.164398][   T18] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [    4.164398][   T18] Call Trace:
> [    4.164398][   T18]  <TASK>
> [ 4.164398][ T18] dump_stack_lvl (lib/dump_stack.c:116)
> [ 4.164398][ T18] dump_stack (lib/dump_stack.c:124)
> [ 4.164398][ T18] check_preemption_disabled (arch/x86/include/asm/preempt.h:84 (discriminator 15) lib/smp_processor_id.c:53 (discriminator 15))
> [ 4.164398][ T18] debug_smp_processor_id (lib/smp_processor_id.c:61)
> [ 4.164398][ T18] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 1))
> [ 4.164398][ T18] nocb_cb_wait (kernel/rcu/tree_nocb.h:936 (discriminator 2))
> [ 4.164398][ T18] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:983 (discriminator 1))
> [ 4.164398][ T18] ? nocb_cb_wait (kernel/rcu/tree_nocb.h:976)
> [ 4.164398][ T18] kthread (kernel/kthread.c:388)
> [ 4.164398][ T18] ? kthread (kernel/kthread.c:373 (discriminator 2))
> [ 4.164398][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> [ 4.164398][ T18] ret_from_fork (arch/x86/kernel/process.c:153)
> [ 4.164398][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> [ 4.164398][ T18] ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> [    4.164398][   T18]  </TASK>
> [    4.168016][   T18] BUG: using smp_processor_id() in preemptible [00000000] code: rcuop/0/18
> [ 4.170139][ T18] caller is debug_smp_processor_id (lib/smp_processor_id.c:61)
> [    4.171170][   T18] CPU: 0 PID: 18 Comm: rcuop/0 Not tainted 6.9.0-rc2-00079-g4c66bc7cacc0 #1
> [    4.173242][   T18] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [    4.174398][   T18] Call Trace:
> [    4.174398][   T18]  <TASK>
> [ 4.174398][ T18] dump_stack_lvl (lib/dump_stack.c:116)
> [ 4.174398][ T18] dump_stack (lib/dump_stack.c:124)
> [ 4.174398][ T18] check_preemption_disabled (arch/x86/include/asm/preempt.h:84 (discriminator 15) lib/smp_processor_id.c:53 (discriminator 15))
> [ 4.174398][ T18] debug_smp_processor_id (lib/smp_processor_id.c:61)
> [ 4.174398][ T18] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 1))
> [ 4.174398][ T18] nocb_cb_wait (kernel/rcu/tree_nocb.h:936 (discriminator 2))
> [ 4.174398][ T18] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:983 (discriminator 1))
> [ 4.174398][ T18] ? nocb_cb_wait (kernel/rcu/tree_nocb.h:976)
> [ 4.174398][ T18] kthread (kernel/kthread.c:388)
> [ 4.174398][ T18] ? kthread (kernel/kthread.c:373 (discriminator 2))
> [ 4.174398][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> [ 4.174398][ T18] ret_from_fork (arch/x86/kernel/process.c:153)
> [ 4.174398][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> [ 4.174398][ T18] ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> [    4.174398][   T18]  </TASK>
> [    4.189949][    T1] smpboot: x86: Booting SMP configuration:
> [    4.191158][    T1] .... node  #0, CPUs:      #1
> [    1.668906][    T0] masked ExtINT on CPU#1
> [    4.202955][   T29] BUG: using smp_processor_id() in preemptible [00000000] code: rcuop/1/29
> [ 4.204471][ T29] caller is debug_smp_processor_id (lib/smp_processor_id.c:61)
> [    4.205845][   T29] CPU: 0 PID: 29 Comm: rcuop/1 Not tainted 6.9.0-rc2-00079-g4c66bc7cacc0 #1
> [    4.207731][   T29] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [    4.207731][   T29] Call Trace:
> [    4.207731][   T29]  <TASK>
> [ 4.207731][ T29] dump_stack_lvl (lib/dump_stack.c:116)
> [ 4.207731][ T29] dump_stack (lib/dump_stack.c:124)
> [ 4.207731][ T29] check_preemption_disabled (arch/x86/include/asm/preempt.h:84 (discriminator 15) lib/smp_processor_id.c:53 (discriminator 15))
> [ 4.207731][ T29] debug_smp_processor_id (lib/smp_processor_id.c:61)
> [ 4.207731][ T29] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 1))
> [ 4.207731][ T29] nocb_cb_wait (kernel/rcu/tree_nocb.h:936 (discriminator 2))
> [ 4.207731][ T29] ? __this_cpu_preempt_check (lib/smp_processor_id.c:67)
> [ 4.207731][ T29] ? lockdep_hardirqs_on (kernel/locking/lockdep.c:4421 (discriminator 16))
> [ 4.207731][ T29] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:983 (discriminator 1))
> [ 4.207731][ T29] ? nocb_cb_wait (kernel/rcu/tree_nocb.h:976)
> [ 4.207731][ T29] kthread (kernel/kthread.c:388)
> [ 4.207731][ T29] ? kthread (kernel/kthread.c:373 (discriminator 2))
> [ 4.207731][ T29] ? kthread_complete_and_exit (kernel/kthread.c:341)
> [ 4.207731][ T29] ret_from_fork (arch/x86/kernel/process.c:153)
> [ 4.207731][ T29] ? kthread_complete_and_exit (kernel/kthread.c:341)
> [ 4.207731][ T29] ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> [    4.207731][   T29]  </TASK>
> [    4.207989][   T18] BUG: using smp_processor_id() in preemptible [00000000] code: rcuop/0/18
> [ 4.209997][ T18] caller is debug_smp_processor_id (lib/smp_processor_id.c:61)
> [    4.211188][   T18] CPU: 0 PID: 18 Comm: rcuop/0 Not tainted 6.9.0-rc2-00079-g4c66bc7cacc0 #1
> [    4.212898][   T18] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [    4.214398][   T18] Call Trace:
> [    4.214398][   T18]  <TASK>
> [ 4.214398][ T18] dump_stack_lvl (lib/dump_stack.c:116)
> [ 4.214398][ T18] dump_stack (lib/dump_stack.c:124)
> [ 4.214398][ T18] check_preemption_disabled (arch/x86/include/asm/preempt.h:84 (discriminator 15) lib/smp_processor_id.c:53 (discriminator 15))
> [ 4.214398][ T18] debug_smp_processor_id (lib/smp_processor_id.c:61)
> [ 4.214398][ T18] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 1))
> [ 4.214398][ T18] nocb_cb_wait (kernel/rcu/tree_nocb.h:936 (discriminator 2))
> [ 4.214398][ T18] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:983 (discriminator 1))
> [ 4.214398][ T18] ? nocb_cb_wait (kernel/rcu/tree_nocb.h:976)
> [ 4.214398][ T18] kthread (kernel/kthread.c:388)
> [ 4.214398][ T18] ? kthread (kernel/kthread.c:373 (discriminator 2))
> [ 4.214398][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> [ 4.214398][ T18] ret_from_fork (arch/x86/kernel/process.c:153)
> [ 4.214398][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> [ 4.214398][ T18] ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> [    4.214398][   T18]  </TASK>
> [    4.215399][   T18] BUG: using smp_processor_id() in preemptible [00000000] code: rcuop/0/18
> [ 4.217064][ T18] caller is debug_smp_processor_id (lib/smp_processor_id.c:61)
> [    4.217772][   T18] CPU: 0 PID: 18 Comm: rcuop/0 Not tainted 6.9.0-rc2-00079-g4c66bc7cacc0 #1
> [    4.219363][   T18] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [    4.221064][   T18] Call Trace:
> [    4.221064][   T18]  <TASK>
> [ 4.221064][ T18] dump_stack_lvl (lib/dump_stack.c:116)
> [ 4.221064][ T18] dump_stack (lib/dump_stack.c:124)
> [ 4.221064][ T18] check_preemption_disabled (arch/x86/include/asm/preempt.h:84 (discriminator 15) lib/smp_processor_id.c:53 (discriminator 15))
> [ 4.221064][ T18] debug_smp_processor_id (lib/smp_processor_id.c:61)
> [ 4.221064][ T18] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (discriminator 1))
> [ 4.221064][ T18] nocb_cb_wait (kernel/rcu/tree_nocb.h:936 (discriminator 2))
> [ 4.221064][ T18] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:983 (discriminator 1))
> [ 4.221064][ T18] ? nocb_cb_wait (kernel/rcu/tree_nocb.h:976)
> [ 4.221064][ T18] kthread (kernel/kthread.c:388)
> [ 4.221064][ T18] ? kthread (kernel/kthread.c:373 (discriminator 2))
> [ 4.221064][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> [ 4.221064][ T18] ret_from_fork (arch/x86/kernel/process.c:153)
> [ 4.221064][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> [ 4.221064][ T18] ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> [    4.221064][   T18]  </TASK>
>
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240507/202405072252.959dadc4-lkp@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
>
