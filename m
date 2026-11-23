Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412965;
	b=Iqj5rZFEGhVrPFJ6PQi8QcqWcodLDDGcd/jxoDMqqL3Fj8fYKz0/7alvw1GRkM5uSFNQ
	 Jwzs3OU/rwkH99kNKFNFAObnXzJlheGHM/S4a7Cm9WvGXQo86Pw8wnzGj4pG6cd+OYaYr
	 LRU1T540iZSidcP9ozhY2nnR2akSzxspGMVwuQxlB01uN0rakGmJmchehLtajYyWz6Swp
	 ohU85k57CDiD02VoPUPYkij1Pf4c8Ns4sjPnJfeQZp31g0hJf9TUa5WUqR0tCyHRdzJDW
	 rnZaY0oZjIHJ/qFkOWF8YfWtEanD7kBxf1d83eW41nlax68I1orWoVY6AqUj1Gj7vnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412965;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=/6/8HQ5R50JMr7oR46HPDPYLirYvJzoSMSzd0cGOl+4=;
	b=Ies6kZBDYe/TxIkBxt7Q0yAcn/hUU26lcq5QNuiqeZPtHaM+1YTbkvVCxIUni4PPJOc8
	 +THA4h2loBu3N+yDQPdNJCDmWDwmAxh7t/YOCaerjfREollL9G+XdygxczAIPXe1K9CuF
	 BlHljVYbwYPH+KrVVu/sWZOvU7E7ZeBV+pUY3JZqnIjC5CSF7U/jUIISdqpYsENEaik7x
	 pctWnqufn/zzFiW/1jdRRjmMg4nnwktSOExSVK2fmJX6zn99ecnnBqqFVU/qc/nV13nH+
	 DX5jNOneCtDJHl2JoWSGYasvCrU10sZWtDeN2eYSR4qgwNvv7NsRwDbi/n25MKLlUeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z15NVs9b;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B90606A31A
	for <oe-lkp@lists.linux.dev>; Mon, 23 Nov 2026 05:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64B90606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z15NVs9b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795412965; x=1826948965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=81V36r3kc6Swrx5rN2+ZWM6JnNFZFPEvIaRWKtgSOow=;
  b=Z15NVs9bmExTEHLY4BxiGhdOAAX/Mo0F3Samtow9uu7ehCGlnaneUuVj
   hG+n4aMHlPrba40a/07RuhjvKD0UhrjTN5W4s2tWgi1sskMtOgv62q5/V
   ExcQvUo2XC/Mtp2LnKZ3C6iJCgfBnpMNVyd04knZhRQ1QzFqvWFaCNcjB
   93tHwxI3W1ys0PMA7CNEypDABBFvQ2bJV1+Oprgrbe6+sAG3nI6+ILcq8
   dKlObUEAcy2orX3kq+Kg3r2Df/YDHmeygetDi/rMAm/sp0ERbYhiSXRG9
   VxishhHRYU+vbEd6MoxELNF3nf5d64g2b0oip9KYNTVB5aONTEd2ucwj9
   g==;
X-CSE-ConnectionGUID: JxsjOgJnTsOazXDG5S5Fqw==
X-CSE-MsgGUID: cgWrbxn+SDqD0kAcOhHXbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4218885"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4218885"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 21:49:24 -0800
X-CSE-ConnectionGUID: 9rvlUUtGRiyF4fOHLsrafg==
X-CSE-MsgGUID: h5pP2d7NRlayBX4AfPELDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11333957"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 21:49:21 -0800
Date: Mon, 23 Nov 2026 13:49:18 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Yury Norov <yury.norov@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, yi1.lai@intel.com
Subject: Re: [linus:master] [virt/steal_governor] 1fb28c664a:
 WARNING:at_kernel/sched/core.c:#set_task_cpu
Message-ID: <awPT3mE4ShWUTw7H@ly-workstation>
References: <202611230353.1fedceba-lkp@intel.com>
 <7446f558-5cbe-4efc-b6bb-686d0dca9f42@linux.ibm.com>
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7446f558-5cbe-4efc-b6bb-686d0dca9f42@linux.ibm.com>

On Mon, Nov 23, 2026 at 08:25:47AM +0530, Shrikanth Hegde wrote:
> Hi.
> 
> On 11/23/26 8:17 AM, kernel test robot wrote:
> > 
> > Hello,
> > 
> > kernel test robot noticed "WARNING:at_kernel/sched/core.c:#set_task_cpu" on:
> > 
> > commit: 1fb28c664a19df8d45a6afa04d28d102b04ea680 ("virt/steal_governor: Enable the driver") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > 
> > [test failed on linux-next/master 909ef7a9a30fa139e69e555e3606680f5cca7726]
> > 
> > in testcase: trinity
> > version: trinity-i386-abe9de86-1_20230429 with following parameters:
> > 
> > 	runtime: 300s
> > 	group: group-00
> > 	nr_groups: 5
> > 
> > 
> > config: i386-randconfig-2105-20261109
> > compiler: gcc-14
> > test machine: qemu-system-i386 -enable-kvm -cpu Haswell-noTSX,enforce,lm=off -smp 4 -m 4G
> > 
> > Additional analysis by LLM: This commit only adds Kconfig/Makefile wiring for the STEAL_GOVERNOR driver. It contains no scheduler logic changes. Its effect is to flip on CONFIG_PREFERRED_CPU for the first time in the series, which activates a block of previously-dead code under #ifdef CONFIG_PREFERRED_CPU in core.c that had been unreachable until now. The commit to be blamed should be 74699f56ebcf — "sched/core: Push current task from non preferred CPU".
> > 
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > 
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <yi1.lai@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202611230353.1fedceba-lkp@intel.com
> > 
> > 
> > [   61.829095][   T33] ------------[ cut here ]------------
> > [   61.830984][   T33] is_migration_disabled(p)
> > [   61.830988][   T33] WARNING: kernel/sched/core.c:3422 at set_task_cpu+0xb7/0x180, CPU#3: migration/3/33
> > [   61.834561][   T33] Modules linked in:
> > [   61.835867][   T33] CPU: 3 UID: 0 PID: 33 Comm: migration/3 Not tainted 7.3.0-rc1-00053-g1fb28c664a19 #1 PREEMPT(full)
> > [   61.838952][   T33] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> > [   61.852825][   T33] Stopper: sched_non_preferred_cpu_push_stop+0x0/0x120 <- sched_push_current_non_preferred_cpu (sched/core.c:11340)
> > [   61.859715][   T33] EIP: set_task_cpu (sched/core.c:3422 (discriminator 2))
> > [   61.861346][   T33] Code: 6c 08 00 00 83 c0 28 83 c0 10 e8 a4 a9 ff ff 85 c0 75 02 0f 0b 0f a3 35 5c 65 60 b4 72 02 0f 0b 66 83 bb 5c 02 00 00 00 74 02 <0f> 0b 3e 8d 74 26 00 eb 32 64 a1 14 50 7e b4 0f a3 05 5c 65 60 b4
> > All code
> > ========
> >     0:	6c                   	insb   (%dx),%es:(%rdi)
> >     1:	08 00                	or     %al,(%rax)
> >     3:	00 83 c0 28 83 c0    	add    %al,-0x3f7cd740(%rbx)
> >     9:	10 e8                	adc    %ch,%al
> >     b:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
> >     c:	a9 ff ff 85 c0       	test   $0xc085ffff,%eax
> >    11:	75 02                	jne    0x15
> >    13:	0f 0b                	ud2
> >    15:	0f a3 35 5c 65 60 b4 	bt     %esi,-0x4b9f9aa4(%rip)        # 0xffffffffb4606578
> >    1c:	72 02                	jb     0x20
> >    1e:	0f 0b                	ud2
> >    20:	66 83 bb 5c 02 00 00 	cmpw   $0x0,0x25c(%rbx)
> >    27:	00
> >    28:	74 02                	je     0x2c
> >    2a:*	0f 0b                	ud2		<-- trapping instruction
> >    2c:	3e 8d 74 26 00       	ds lea 0x0(%rsi,%riz,1),%esi
> >    31:	eb 32                	jmp    0x65
> >    33:	64 a1 14 50 7e b4 0f 	movabs %fs:0x5c05a30fb47e5014,%eax
> >    3a:	a3 05 5c
> >    3d:	65 60                	gs (bad)
> >    3f:	b4                   	.byte 0xb4
> > 
> > Code starting with the faulting instruction ===========================================
> >     0:	0f 0b                	ud2
> >     2:	3e 8d 74 26 00       	ds lea 0x0(%rsi,%riz,1),%esi
> >     7:	eb 32                	jmp    0x3b
> >     9:	64 a1 14 50 7e b4 0f 	movabs %fs:0x5c05a30fb47e5014,%eax
> >    10:	a3 05 5c
> >    13:	65 60                	gs (bad)
> >    15:	b4                   	.byte 0xb4
> > [   61.870903][   T33] EAX: 00000002 EBX: f5381300 ECX: 00000000 EDX: 00000003
> > [   61.873346][   T33] ESI: 00000003 EDI: b614bf00 EBP: b614bebc ESP: b614beac
> > [   61.875803][   T33] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010002
> > [   61.882493][   T33] CR0: 80050033 CR2: a6af0000 CR3: 45267000 CR4: 001506d0
> > [   61.884849][   T33] Call Trace:
> > [   61.889217][   T33]  move_queued_task (sched/core.c:2596)
> > [   61.890818][   T33]  __migrate_task (sched/core.c:2644)
> > [   61.892297][   T33]  sched_non_preferred_cpu_push_stop (sched/core.c:11292)
> > [   61.897538][   T33]  ? tracer_preempt_off (trace/trace_irqsoff.c:692 (discriminator 1))
> > [   61.899325][   T33]  ? trace_preempt_off (trace/trace_preemptirq.c:127)
> > [   61.901048][   T33]  ? preempt_count_add (sched/core.c:6056)
> > [   61.906016][   T33]  ? __balance_push_cpu_stop (sched/core.c:8397)
> > [   61.907819][   T33]  ? preempt_latency_start (sched/core.c:6030 (discriminator 1) sched/core.c:6023 (discriminator 1))
> > [   61.909635][   T33]  ? __balance_push_cpu_stop (sched/core.c:8397)
> > [   61.911466][   T33]  cpu_stopper_thread (stop_machine.c:510)
> > [   61.913093][   T33]  smpboot_thread_fn (smpboot.c:160)
> > [   61.917838][   T33]  kthread (kthread.c:436)
> > [   61.919260][   T33]  ? sort_range (??:?)
> > [   61.920703][   T33]  ? kthread_affine_node (kthread.c:378)
> > [   61.925663][   T33]  ret_from_fork (x86/kernel/process.c:158)
> > [   61.927228][   T33]  ? kthread_affine_node (kthread.c:378)
> > [   61.928980][   T33]  ret_from_fork_asm (x86/entry/entry_32.S:736)
> > [   61.933831][   T33]  entry_INT80_32 (x86/entry/entry_32.S:940)
> > [   61.935410][   T33] irq event stamp: 108
> > [   61.936744][   T33] hardirqs last  enabled at (107): _raw_spin_unlock_irqrestore (linux/spinlock_api_smp.h:210 (discriminator 1) locking/spinlock.c:221 (discriminator 1))
> > [   61.943224][   T33] hardirqs last disabled at (108): __schedule (sched/core.c:7225 (discriminator 1))
> > [   61.946108][   T33] softirqs last  enabled at (0): copy_process (fork.c:2239 (discriminator 1))
> > [   61.948970][   T33] softirqs last disabled at (0): 0x0
> > [   61.955261][   T33] ---[ end trace 0000000000000000 ]---
> > 
> > 
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20261123/202611230353.1fedceba-lkp@intel.com
> > 
> > 
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> > 
> > 
> 
> 
> Could you please try with below patch included?
> Symptoms seems to be similar.
> 
> https://lore.kernel.org/all/179538776083.92412.4311246927428883759.tip-bot2@tip-bot2/

With this patch applied, issue cannot be reproduced.

