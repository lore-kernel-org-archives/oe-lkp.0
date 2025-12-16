Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BF33659F8
	for <oe-lkp@lists.linux.dev>; Tue, 16 Dec 2025 12:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765887192; cv=none; b=J29xtPfpop7k9LFibrGqvWDmLq3pjOXUfwStxu9BH900qdGs5iTtM6Mxp2lJlGOuQ6sfgaB3PSblvTgAXbznkf2Ef8vpjKmi68UNshVXV/w94mTslSEwtSaHyYV96yghVHMd0PJaBRJiAVnOkAOt15/JCuuwd0pgcPekkkRzgx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765887192; c=relaxed/simple;
	bh=SRVisKjKISz6zAGyMH7wNq9vZRPPR2JdXiOGSKiGXTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=opuNqJqS/FAQgyONEHuhlbKTCFEkB4blIdh2ayrDDOk8oVGI5fFd3iyelOvGiW2/IspsY4jFrK91XPXlagFdzEYEVI+lOa8IwyYQ+5ssbJ5jfa3TVja9pNidanyxiprUYQBjO5aQ5+Bg5RkKGJZY+1qDKXrnzsfN6+e6xZrl2yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TwFSNHhf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TwFSNHhf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765887189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8mfU9wDBcPpcXWUrScrAoYiXDvs8oPHCIjLxBX77gWQ=;
	b=TwFSNHhfvTzkPYR2z9pDQC5DoVIRo/Zn4xao5h+VBP3kafeHT08p5VrpCoK9y6ljZQvVLK
	o6uKc4Acbjg9hKibEQwgtzAIsn6mkqAvvQOiy0X5YusTzjvCPP9bcjD1pg096RuQQiMube
	+jCKPBHt6A6SygK0+I4iJJwFAqSqTMg=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-QEc5FCeUNRa0HT4FIK1jbQ-1; Tue, 16 Dec 2025 07:13:08 -0500
X-MC-Unique: QEc5FCeUNRa0HT4FIK1jbQ-1
X-Mimecast-MFC-AGG-ID: QEc5FCeUNRa0HT4FIK1jbQ_1765887187
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b9b9e8b0812so7589149a12.0
        for <oe-lkp@lists.linux.dev>; Tue, 16 Dec 2025 04:13:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765887187; x=1766491987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8mfU9wDBcPpcXWUrScrAoYiXDvs8oPHCIjLxBX77gWQ=;
        b=Rowf0+fDq9TTdvwPOf4aGe9mFLyAVnCOFwqh8d3pKbK14Y64bOUZE2deWVZ8LZBqdF
         F4e4TFScI1fN9QO7yFu884kPy1SnCIvPh7oVhKeqUUQV8A6iWT51ZO3QSPJXpjSB3t+i
         Zk+9JjE0ELeSz+vTDESsx2HXnevrd14BYupOj9qYoSyYKloFJ+1jMq2GDfKNJ1x9RN9V
         96QXkjU82/CACV8j05FDMM2TeLRdQOPpZzkZD5jBmlVHjDDeCrHt492znhaIc4P+AKck
         m0ShRFVpuRu9fiWNctCRl7SpgCW+hS3/T1Xd29KRKCSyDPuwiggoimiIDjA/O9DpBLWO
         8O1Q==
X-Gm-Message-State: AOJu0YyqXPszsJMxF0UjdDWH0wXQPkmTKCK93HKyUTPcNg6+OrjTYH8g
	clP1/zs/MrovK1JIJuONYD6zQyApfaa8Dps6IoTIhXpNCLzQoRRoqe3ydMwX08sKSMQyTysqPO0
	+cgJzGvgdaleleA1cza8xE/pQHzKfebJX0KrSd4Z/YSEbXDxzGLJ/4crWETa535ZpSoGG6ao1vp
	WD71tTsQKHaWipKKzw+Z8r15DL2KdUOGphXafZloj4x+04cA==
X-Gm-Gg: AY/fxX4rjswrOBGCo10IddDf1hu92jXCKsf2ycIRCCDjlDgKzDHrG1ScOubcbikoPVn
	PRpPc6X2m0Q6sy+TFnLqxu1ZasRfSM9xbUlwEQ0BIiBgxP439vOFjY3iO0R13V9c6z+x5joGuPi
	9j4Jtz1zfy6Q2IGbs+ndWS/nvQqHVb44uoaZpbSYR9C/jFyxRrdETvVNIbjusi7gzBiAQ=
X-Received: by 2002:a05:7301:6781:b0:2ac:2e93:29bf with SMTP id 5a478bee46e88-2ac300f946dmr9763848eec.22.1765887186628;
        Tue, 16 Dec 2025 04:13:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjGc2WYsjbwNRIC2Y9wS+61bYiJmx62asBMWKb7WI7DCgMmiHl5jQ/CDvP6Z6yF8KfsOJ7SWaQSa76Iwy1nHA=
X-Received: by 2002:a05:7301:6781:b0:2ac:2e93:29bf with SMTP id
 5a478bee46e88-2ac300f946dmr9763813eec.22.1765887186145; Tue, 16 Dec 2025
 04:13:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202512161547.cd3a9187-lkp@intel.com>
In-Reply-To: <202512161547.cd3a9187-lkp@intel.com>
From: Pingfan Liu <piliu@redhat.com>
Date: Tue, 16 Dec 2025 20:12:53 +0800
X-Gm-Features: AQt7F2ol4858mU6B9qor1De7SjH19Kzxd8PFqaNyoG74tMMq5JYAX-sBEk1iu9o
Message-ID: <CAF+s44SN6fe6PCdeN-e5LGbFOdadiDDWdAex6oRPT+e+uzfhSA@mail.gmail.com>
Subject: Re: [linus:master] [sched/deadline] 318e18ed22: BUG:soft_lockup-CPU##stuck_for#s![swapper:#]
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Waiman Long <longman@redhat.com>, 
	Chen Ridong <chenridong@huaweicloud.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Pierre Gondois <pierre.gondois@arm.com>, 
	Ingo Molnar <mingo@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, aubrey.li@linux.intel.com, yu.c.chen@intel.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qZL4rBWnN81NajzEOsg4uTFV0MGcU76jelFGNI4mNZ8_1765887187
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 i

On Tue, Dec 16, 2025 at 3:45=E2=80=AFPM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "BUG:soft_lockup-CPU##stuck_for#s![swapper:#]" =
on:
>
> commit: 318e18ed22e89397635e15095c014accaf47ed30 ("sched/deadline: Walk u=
p cpuset hierarchy to decide root domain when hot-unplug")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> [test failed on linus/master      d358e5254674b70f34c847715ca509e46eb81e6=
f]
> [test failed on linux-next/master 5ce74bc1b7cb2732b22f9c93082545bc655d654=
7]
>
> in testcase: trinity
> version: trinity-static-i386-x86_64-f93256fb_2019-08-28
> with following parameters:
>
>         runtime: 300s
>         group: group-03
>         nr_groups: 5
>
>
> config: i386-randconfig-r071-20250410

There is no CONFIG_CPUSETS in this config file. So I think it is not
related to cpuset_cpus_allowed_locked().

And there is no extra lock introduced into dl_add_task_root_domain(),
so it is weird that the commit causes the soft lockup. I will look
into it to see the real root cause.

Pingfan

> compiler: gcc-14
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 3=
2G
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> we don't have enough knowledge to analyze the relation between the change
> and the issue, so we run tests up to 1000 times. the issue can be reprodu=
ced
> 65 times out of 1000 runs. while parent always keeps clean.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> tbox_group/testcase/rootfs/kconfig/compiler/runtime/group/nr_groups:
>   vm-snb/trinity/openwrt-i386-generic-20190428.cgz/i386-randconfig-r071-2=
0250410/gcc-14/300s/group-03/5
>
>
> 1f382215119a0bc1 318e18ed22e89397635e15095c0
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :1000         8%          82:1000  dmesg.BUG:kernel_hang_in_bo=
ot_stage
>            :1000         7%          69:1000  dmesg.BUG:soft_lockup-CPU##=
stuck_for#s![swapper:#]   <----
>            :1000         8%          82:1000  dmesg.BUG:workqueue_lockup-=
pool
>            :1000         7%          69:1000  dmesg.EIP:tick_clock_notify
>            :1000         2%          15:1000  dmesg.INFO:rcu_preempt_dete=
cted_stalls_on_CPUs/tasks
>            :1000         5%          53:1000  dmesg.INFO:task_blocked_for=
_more_than#seconds
>            :1000         7%          69:1000  dmesg.Kernel_panic-not_sync=
ing:softlockup:hung_tasks
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202512161547.cd3a9187-lkp@intel.=
com
>
>
> [  699.774873][    C0] watchdog: BUG: soft lockup - CPU#0 stuck for 626s!=
 [swapper/0:1]
> [  699.775553][    C0] CPU#0 Utilization every 96000ms during lockup:
> [  699.775553][    C0]  #1:  26% system,          0% softirq,     0% hard=
irq,     0% idle
> [  699.775553][    C0]  #2:  25% system,          0% softirq,     0% hard=
irq,     0% idle
> [  699.775553][    C0]  #3:  25% system,          0% softirq,     0% hard=
irq,     0% idle
> [  699.775553][    C0]  #4:  34% system,          0% softirq,     0% hard=
irq,     0% idle
> [  699.775553][    C0]  #5: 100% system,          0% softirq,     0% hard=
irq,     0% idle
> [  699.775553][    C0] Modules linked in:
> [  699.775553][    C0] irq event stamp: 201566
> [  699.775553][    C0] hardirqs last  enabled at (201565): timekeeping_no=
tify (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:11=
9 arch/x86/include/asm/irqflags.h:159 include/linux/stop_machine.h:172 incl=
ude/linux/stop_machine.h:179 kernel/time/timekeeping.c:1634)
> [  699.775553][    C0] hardirqs last disabled at (201566): sysvec_apic_ti=
mer_interrupt (arch/x86/kernel/apic/apic.c:1052)
> [  699.775553][    C0] softirqs last  enabled at (200324): handle_softirq=
s (kernel/softirq.c:469 (discriminator 2) kernel/softirq.c:650 (discriminat=
or 2))
> [  699.775553][    C0] softirqs last disabled at (200309): __do_softirq (=
kernel/softirq.c:657)
> [  699.775553][    C0] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6=
.18.0-rc2-00020-g318e18ed22e8 #1 PREEMPT(full)
> [  699.775553][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [  699.775553][    C0] EIP: tick_clock_notify (arch/x86/include/asm/bitop=
s.h:55 include/asm-generic/bitops/instrumented-atomic.h:29 kernel/time/tick=
-sched.c:1633)
> [  699.775553][    C0] Code: 8b 45 e4 89 1d 24 d5 6a 83 a3 38 d5 6a 83 89=
 15 3c d5 6a 83 83 c4 10 5b 5e 5f 5d c3 2e 8d b4 26 00 00 00 00 8d b6 00 00=
 00 00 <80> 0d 44 d5 6a 83 01 c3 2e 8d b4 26 00 00 00 00 80 0d 44 d5 6a 83
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   8b 45 e4                mov    -0x1c(%rbp),%eax
>    3:   89 1d 24 d5 6a 83       mov    %ebx,-0x7c952adc(%rip)        # 0x=
ffffffff836ad52d
>    9:   a3 38 d5 6a 83 89 15    movabs %eax,0xd53c1589836ad538
>   10:   3c d5
>   12:   6a 83                   push   $0xffffffffffffff83
>   14:   83 c4 10                add    $0x10,%esp
>   17:   5b                      pop    %rbx
>   18:   5e                      pop    %rsi
>   19:   5f                      pop    %rdi
>   1a:   5d                      pop    %rbp
>   1b:   c3                      ret
>   1c:   2e 8d b4 26 00 00 00    cs lea 0x0(%rsi,%riz,1),%esi
>   23:   00
>   24:   8d b6 00 00 00 00       lea    0x0(%rsi),%esi
>   2a:*  80 0d 44 d5 6a 83 01    orb    $0x1,-0x7c952abc(%rip)        # 0x=
ffffffff836ad575               <-- trapping instruction
>   31:   c3                      ret
>   32:   2e 8d b4 26 00 00 00    cs lea 0x0(%rsi,%riz,1),%esi
>   39:   00
>   3a:   80                      .byte 0x80
>   3b:   0d 44 d5 6a 83          or     $0x836ad544,%eax
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   80 0d 44 d5 6a 83 01    orb    $0x1,-0x7c952abc(%rip)        # 0x=
ffffffff836ad54b
>    7:   c3                      ret
>    8:   2e 8d b4 26 00 00 00    cs lea 0x0(%rsi,%riz,1),%esi
>    f:   00
>   10:   80                      .byte 0x80
>   11:   0d 44 d5 6a 83          or     $0x836ad544,%eax
> [  699.775553][    C0] EAX: 0003135d EBX: 8322ef00 ECX: 00000006 EDX: 82f=
6bcac
> [  699.775553][    C0] ESI: 00000200 EDI: 836ac3e0 EBP: 84c97ed8 ESP: 84c=
97ebc
> [  699.775553][    C0] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAG=
S: 00000202
> [  699.775553][    C0] CR0: 80050033 CR2: ffdaa000 CR3: 03aeb000 CR4: 000=
406d0
> [  699.775553][    C0] Call Trace:
> [  699.775553][    C0]  ? timekeeping_notify (kernel/time/timekeeping.c:1=
636)
> [  699.775553][    C0]  __clocksource_select (kernel/time/clocksource.c:1=
069 (discriminator 1))
> [  699.775553][    C0]  ? boot_override_clock (kernel/time/clocksource.c:=
1101)
> [  699.775553][    C0]  clocksource_select (kernel/time/clocksource.c:108=
6)
> [  699.775553][    C0]  clocksource_done_booting (kernel/time/clocksource=
.c:1110)
> [  699.775553][    C0]  do_one_initcall (init/main.c:1283)
> [  699.775553][    C0]  ? rdinit_setup (init/main.c:1331)
> [  699.775553][    C0]  do_initcalls (init/main.c:1344 (discriminator 3) =
init/main.c:1361 (discriminator 3))
> [  699.775553][    C0]  kernel_init_freeable (init/main.c:1597)
> [  699.775553][    C0]  ? rest_init (init/main.c:1475)
> [  699.775553][    C0]  kernel_init (init/main.c:1485)
> [  699.775553][    C0]  ret_from_fork (arch/x86/kernel/process.c:164)
> [  699.775553][    C0]  ? rest_init (init/main.c:1475)
> [  699.775553][    C0]  ret_from_fork_asm (arch/x86/entry/entry_32.S:737)
> [  699.775553][    C0]  entry_INT80_32 (arch/x86/entry/entry_32.S:945)
> [  699.775553][    C0] Kernel panic - not syncing: softlockup: hung tasks
> [  699.775553][    C0] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G   =
          L      6.18.0-rc2-00020-g318e18ed22e8 #1 PREEMPT(full)
> [  699.775553][    C0] Tainted: [L]=3DSOFTLOCKUP
> [  699.775553][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [  699.775553][    C0] Call Trace:
> [  699.775553][    C0]  dump_stack_lvl (lib/dump_stack.c:122)
> [  699.775553][    C0]  dump_stack (lib/dump_stack.c:130)
> [  699.775553][    C0]  vpanic (kernel/panic.c:487)
> [  699.775553][    C0]  panic (kernel/panic.c:626)
> [  699.775553][    C0]  watchdog_timer_fn (kernel/watchdog.c:753)
> [  699.775553][    C0]  __hrtimer_run_queues+0x125/0x1e0
> [  699.775553][    C0]  ? schedule_work (drivers/usb/core/hub.c:925)
> [  699.775553][    C0]  hrtimer_run_queues (kernel/time/hrtimer.c:1999)
> [  699.775553][    C0]  update_process_times (kernel/time/timer.c:2416 ke=
rnel/time/timer.c:2472)
> [  699.775553][    C0]  tick_periodic (kernel/time/tick-common.c:103)
> [  699.775553][    C0]  tick_handle_periodic (kernel/time/tick-common.c:1=
44)
> [  699.775553][    C0]  ? vmware_sched_clock (arch/x86/kernel/apic/apic.c=
:1052)
> [  699.775553][    C0]  __sysvec_apic_timer_interrupt (arch/x86/include/a=
sm/trace/irq_vectors.h:40 (discriminator 4) arch/x86/include/asm/trace/irq_=
vectors.h:40 (discriminator 4) arch/x86/kernel/apic/apic.c:1059 (discrimina=
tor 4))
> [  699.775553][    C0]  sysvec_apic_timer_interrupt (arch/x86/kernel/apic=
/apic.c:1052 (discriminator 2) arch/x86/kernel/apic/apic.c:1052 (discrimina=
tor 2))
> [  699.775553][    C0]  handle_exception (arch/x86/entry/entry_32.S:1055)
> [  699.775553][    C0] EIP: tick_clock_notify (arch/x86/include/asm/bitop=
s.h:55 include/asm-generic/bitops/instrumented-atomic.h:29 kernel/time/tick=
-sched.c:1633)
> [  699.775553][    C0] Code: 8b 45 e4 89 1d 24 d5 6a 83 a3 38 d5 6a 83 89=
 15 3c d5 6a 83 83 c4 10 5b 5e 5f 5d c3 2e 8d b4 26 00 00 00 00 8d b6 00 00=
 00 00 <80> 0d 44 d5 6a 83 01 c3 2e 8d b4 26 00 00 00 00 80 0d 44 d5 6a 83
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   8b 45 e4                mov    -0x1c(%rbp),%eax
>    3:   89 1d 24 d5 6a 83       mov    %ebx,-0x7c952adc(%rip)        # 0x=
ffffffff836ad52d
>    9:   a3 38 d5 6a 83 89 15    movabs %eax,0xd53c1589836ad538
>   10:   3c d5
>   12:   6a 83                   push   $0xffffffffffffff83
>   14:   83 c4 10                add    $0x10,%esp
>   17:   5b                      pop    %rbx
>   18:   5e                      pop    %rsi
>   19:   5f                      pop    %rdi
>   1a:   5d                      pop    %rbp
>   1b:   c3                      ret
>   1c:   2e 8d b4 26 00 00 00    cs lea 0x0(%rsi,%riz,1),%esi
>   23:   00
>   24:   8d b6 00 00 00 00       lea    0x0(%rsi),%esi
>   2a:*  80 0d 44 d5 6a 83 01    orb    $0x1,-0x7c952abc(%rip)        # 0x=
ffffffff836ad575               <-- trapping instruction
>   31:   c3                      ret
>   32:   2e 8d b4 26 00 00 00    cs lea 0x0(%rsi,%riz,1),%esi
>   39:   00
>   3a:   80                      .byte 0x80
>   3b:   0d 44 d5 6a 83          or     $0x836ad544,%eax
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   80 0d 44 d5 6a 83 01    orb    $0x1,-0x7c952abc(%rip)        # 0x=
ffffffff836ad54b
>    7:   c3                      ret
>    8:   2e 8d b4 26 00 00 00    cs lea 0x0(%rsi,%riz,1),%esi
>    f:   00
>   10:   80                      .byte 0x80
>   11:   0d 44 d5 6a 83          or     $0x836ad544,%eax
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20251216/202512161547.cd3a9187-lk=
p@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

