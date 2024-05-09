Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9735B13CF8A
	for <oe-lkp@lists.linux.dev>; Thu,  9 May 2024 07:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715239436; cv=none; b=rfNEki9bvOjRbtd2S9zYypu85lPrrq5T66rY6vDYoS1Jer8cHNxwGkxKvZg6vKnR6JVVPGXLFxMsnD/TpOFz1SYHnUBBVoBOL2w7JY3MLOxAvOTu5XEnGvCq+9IKMBEYkMgHIwarUncIrRUnrZNATZzlA5iCIMpTnRdYJS0fpu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715239436; c=relaxed/simple;
	bh=iq7/IflDceLLaEhI2ILCvBhRqyBv+sslVohfjpJ2ytM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rAZ/WKZvN0Pr9EdjYO8E0DNSM/y9pzVXCxWCIVN5AzItskLbvAcaFz1iQHwIduIt5OHnyJiInQ44Qkm9X9fEhUvyeMGHpg/YRF8nRPAACdzHkWmEnTsDORmsmhHPexmXzg3NWH5TF03uxreLz6qvvv6Nxfk2VNMYKTgkds/JTSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+a185AQ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+a185AQ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2b6456f7e94so836494a91.1
        for <oe-lkp@lists.linux.dev>; Thu, 09 May 2024 00:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715239434; x=1715844234; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVtC8zSs7rVALHAgpJ51NzO2m2Xjo4Y5cB2X14iKYrs=;
        b=l+a185AQl5OHCJ+eEW7i8VhMCWwOHL/3f9lLRqDc1RMHBdLx7DaocRormrp4myEInt
         OusPzpJLcGYU5JeX3DQU8Xzlr8fI+UjfZ+6LN5wthRsSCTkfEqkDLhzaK1q2e6ZySCJs
         LOOnNsXOYeNJ35kCfuQva3IyWvGE+Wpo3ALbdd7zjsYS0K0L7g2Y54dGSvahh0hKJ7mw
         LzNYpZmfPWFj4LYwJ3pwQxR8tZ4IHMYKnuJ3xx3Uiv+DtMK7Ts7MO947UlF8Zdw2PXJt
         lBooV0sGQzQ5zM2Hj4PpMFX7k2mL1ULYv72AOFAWxRdpRvxjw4uig1qHCm52oS7ZZ2tL
         7YBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715239434; x=1715844234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVtC8zSs7rVALHAgpJ51NzO2m2Xjo4Y5cB2X14iKYrs=;
        b=Sh8gvmSzxHnhNWzGK97D086R19VnUolelTpTgW4iaoAHUzxMiqTqxjsX/xr3fr6xPn
         VZBy31EZGmWkOFvYF47Y8pNmMcKQitSO6TkXq8IJmmJ/FKM3eUffiUcaWx6k6y61dkUI
         wZIsUANoYVlZCAm+OREgNEHWgznvxYPtVTTWBdvjPtEigB1SmpzG138FrGvZhkh00VOZ
         KLIYBySd42eKC7gW1iUUD2AtoIYKbSalaoZ+jTMk9ANkIoigXEmlCW5j9gAN+yuBClw4
         zSTbGwTC48yaAIF5JcIG4WreEUnfIGXFNSk3lujwEqmK69TgoSjiqwIb56KfBQG3ELPP
         jESA==
X-Forwarded-Encrypted: i=1; AJvYcCVxHFmeRPoTnwS9fUdIsxzoGePShfW5+8v76F09XgQ87DIDytkZ1XNd9QzjUfWQWGt9pD/RCaHsBdEIU2GVVJI6JK724WfM
X-Gm-Message-State: AOJu0YzKzF+NZ3ip5TEX4nPUmPluVQQH0wAhfwxaaOaRPpSMV5AKSzEo
	txRXsuqUXw1ttW/zPEeIdd4qJpxtm9EOJyAhlaTx8abtKpn8imUxtIMT+OivSWYGL+cUVKVWNru
	fbT5o7iR6VHmfCxtQiNHoS+nCa5l4hw==
X-Google-Smtp-Source: AGHT+IHrfwuz1UzXkVfnqRWO2FtqbL52ma5wrQZgfgwV+MfNaCQRVhLZFt5mj6/LM/1HHt9fDzt33w6gYIHtHMSdAWA=
X-Received: by 2002:a17:90a:e396:b0:2b6:208c:2aee with SMTP id
 98e67ed59e1d1-2b65fe18df9mr2812844a91.20.1715239433739; Thu, 09 May 2024
 00:23:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405072252.959dadc4-lkp@intel.com> <CALm+0cViRh07e88uMrRp=5K0TgBVFwmwLiLnejc7puEMXrmFsA@mail.gmail.com>
 <Zjuk3UWYHEaD_vZC@localhost.localdomain>
In-Reply-To: <Zjuk3UWYHEaD_vZC@localhost.localdomain>
From: Z qiang <qiang.zhang1211@gmail.com>
Date: Thu, 9 May 2024 15:23:42 +0800
Message-ID: <CALm+0cVwZo+-T9tP87mgOH6VzYf2+SYdj05=+zMBHxR+LCq_kw@mail.gmail.com>
Subject: Re: [linux-next:master] [rcu/nocb] 4c66bc7cac: BUG:using_smp_processor_id()in_preemptible
To: Frederic Weisbecker <frederic@kernel.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, "Paul E. McKenney" <paulmck@kernel.org>, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Le Wed, May 08, 2024 at 12:55:25PM +0800, Z qiang a =C3=A9crit :
> > >
> > >
> > >
> > > Hello,
> > >
> > > kernel test robot noticed "BUG:using_smp_processor_id()in_preemptible=
" on:
> > >
> > > commit: 4c66bc7cacc08e8abcf5049d2b90bfd800904336 ("rcu/nocb: Use kthr=
ead parking instead of ad-hoc implementation")
> > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git mast=
er
> > >
> > > [test failed on linux-next/master 9221b2819b8a4196eecf5476d66201be60f=
bcf29]
> > >
> > > in testcase: boot
> > >
> > > compiler: gcc-13
> > > test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 =
-m 16G
> > >
> > > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > >
> > >
> > > +--------------------------------------------------------------+-----=
-------+------------+
> > > |                                                              | 6deb=
20902f | 4c66bc7cac |
> > > +--------------------------------------------------------------+-----=
-------+------------+
> > > | BUG:using_smp_processor_id()in_preemptible                   | 0   =
       | 12         |
> > > +--------------------------------------------------------------+-----=
-------+------------+
> > >
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > | Closes: https://lore.kernel.org/oe-lkp/202405072252.959dadc4-lkp@in=
tel.com
> > >
> > >
> > > [    4.099901][   T18] BUG: using smp_processor_id() in preemptible [=
00000000] code: rcuop/0/18
> > > [ 4.101313][ T18] caller is debug_smp_processor_id (lib/smp_processor=
_id.c:61)
> > > [    4.102493][   T18] CPU: 0 PID: 18 Comm: rcuop/0 Not tainted 6.9.0=
-rc2-00079-g4c66bc7cacc0 #1
> > > [    4.104098][   T18] Hardware name: QEMU Standard PC (i440FX + PIIX=
, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> > > [    4.104398][   T18] Call Trace:
> > > [    4.104398][   T18]  <TASK>
> > > [ 4.104398][ T18] dump_stack_lvl (lib/dump_stack.c:116)
> > > [ 4.104398][ T18] dump_stack (lib/dump_stack.c:124)
> > > [ 4.104398][ T18] check_preemption_disabled (arch/x86/include/asm/pre=
empt.h:84 (discriminator 15) lib/smp_processor_id.c:53 (discriminator 15))
> > > [ 4.104398][ T18] debug_smp_processor_id (lib/smp_processor_id.c:61)
> > > [ 4.104398][ T18] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (=
discriminator 1))
> > > [ 4.104398][ T18] nocb_cb_wait (kernel/rcu/tree_nocb.h:936 (discrimin=
ator 2))
> >
> >
> > Please try the following modifications:
> >
> > diff --git a/kernel/rcu/tree_plugin.h b/kernel/rcu/tree_plugin.h
> > index 340bbefe5f65..b93e40206621 100644
> > --- a/kernel/rcu/tree_plugin.h
> > +++ b/kernel/rcu/tree_plugin.h
> > @@ -28,8 +28,8 @@ static bool rcu_rdp_is_offloaded(struct rcu_data *rdp=
)
> >                 !(lockdep_is_held(&rcu_state.barrier_mutex) ||
> >                   (IS_ENABLED(CONFIG_HOTPLUG_CPU) && lockdep_is_cpus_he=
ld()) ||
> >                   rcu_lockdep_is_held_nocb(rdp) ||
> > -                 (rdp =3D=3D this_cpu_ptr(&rcu_data) &&
> > -                  !(IS_ENABLED(CONFIG_PREEMPT_COUNT) && preemptible())=
) ||
> > +                  (!(IS_ENABLED(CONFIG_PREEMPT_COUNT) && preemptible()=
) &&
> > +                   rdp =3D=3D this_cpu_ptr(&rcu_data)) ||
>
> Looks good, would you like to send a proper patch with changelog?

I will send a patch :)

Thanks
Zqiang

>
> Thanks.
>
> >                   rcu_current_is_nocb_kthread(rdp)),
> >                 "Unsafe read of RCU_NOCB offloaded state"
>
>
>
> >         );
> >
> > Thanks
> > Zqiang
> >
> >
> > > [ 4.104398][ T18] ? __this_cpu_preempt_check (lib/smp_processor_id.c:=
67)
> > > [ 4.104398][ T18] ? lockdep_hardirqs_on (kernel/locking/lockdep.c:442=
1 (discriminator 16))
> > > [ 4.104398][ T18] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:983 (di=
scriminator 1))
> > > [ 4.104398][ T18] ? nocb_cb_wait (kernel/rcu/tree_nocb.h:976)
> > > [ 4.104398][ T18] kthread (kernel/kthread.c:388)
> > > [ 4.104398][ T18] ? kthread (kernel/kthread.c:373 (discriminator 2))
> > > [ 4.104398][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> > > [ 4.104398][ T18] ret_from_fork (arch/x86/kernel/process.c:153)
> > > [ 4.104398][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> > > [ 4.104398][ T18] ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> > > [    4.104398][   T18]  </TASK>
> > > [    4.106221][   T18] BUG: using smp_processor_id() in preemptible [=
00000000] code: rcuop/0/18
> > > [ 4.107796][ T18] caller is debug_smp_processor_id (lib/smp_processor=
_id.c:61)
> > > [    4.108547][   T18] CPU: 0 PID: 18 Comm: rcuop/0 Not tainted 6.9.0=
-rc2-00079-g4c66bc7cacc0 #1
> > > [    4.109667][   T18] Hardware name: QEMU Standard PC (i440FX + PIIX=
, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> > > [    4.111064][   T18] Call Trace:
> > > [    4.111064][   T18]  <TASK>
> > > [ 4.111064][ T18] dump_stack_lvl (lib/dump_stack.c:116)
> > > [ 4.111064][ T18] dump_stack (lib/dump_stack.c:124)
> > > [ 4.111064][ T18] check_preemption_disabled (arch/x86/include/asm/pre=
empt.h:84 (discriminator 15) lib/smp_processor_id.c:53 (discriminator 15))
> > > [ 4.111064][ T18] debug_smp_processor_id (lib/smp_processor_id.c:61)
> > > [ 4.111064][ T18] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (=
discriminator 1))
> > > [ 4.111064][ T18] nocb_cb_wait (kernel/rcu/tree_nocb.h:936 (discrimin=
ator 2))
> > > [ 4.111064][ T18] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:983 (di=
scriminator 1))
> > > [ 4.111064][ T18] ? nocb_cb_wait (kernel/rcu/tree_nocb.h:976)
> > > [ 4.111064][ T18] kthread (kernel/kthread.c:388)
> > > [ 4.111064][ T18] ? kthread (kernel/kthread.c:373 (discriminator 2))
> > > [ 4.111064][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> > > [ 4.111064][ T18] ret_from_fork (arch/x86/kernel/process.c:153)
> > > [ 4.111064][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> > > [ 4.111064][ T18] ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> > > [    4.111064][   T18]  </TASK>
> > > [    4.132677][    T1] NMI watchdog: Perf NMI watchdog permanently di=
sabled
> > > [    4.135331][   T18] BUG: using smp_processor_id() in preemptible [=
00000000] code: rcuop/0/18
> > > [ 4.137454][ T18] caller is debug_smp_processor_id (lib/smp_processor=
_id.c:61)
> > > [    4.137849][   T18] CPU: 0 PID: 18 Comm: rcuop/0 Not tainted 6.9.0=
-rc2-00079-g4c66bc7cacc0 #1
> > > [    4.139414][   T18] Hardware name: QEMU Standard PC (i440FX + PIIX=
, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> > > [    4.141064][   T18] Call Trace:
> > > [    4.141064][   T18]  <TASK>
> > > [ 4.141064][ T18] dump_stack_lvl (lib/dump_stack.c:116)
> > > [ 4.141064][ T18] dump_stack (lib/dump_stack.c:124)
> > > [ 4.141064][ T18] check_preemption_disabled (arch/x86/include/asm/pre=
empt.h:84 (discriminator 15) lib/smp_processor_id.c:53 (discriminator 15))
> > > [ 4.141064][ T18] debug_smp_processor_id (lib/smp_processor_id.c:61)
> > > [ 4.141064][ T18] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (=
discriminator 1))
> > > [ 4.141064][ T18] nocb_cb_wait (kernel/rcu/tree_nocb.h:936 (discrimin=
ator 2))
> > > [ 4.141064][ T18] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:983 (di=
scriminator 1))
> > > [ 4.141064][ T18] ? nocb_cb_wait (kernel/rcu/tree_nocb.h:976)
> > > [ 4.141064][ T18] kthread (kernel/kthread.c:388)
> > > [ 4.141064][ T18] ? kthread (kernel/kthread.c:373 (discriminator 2))
> > > [ 4.141064][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> > > [ 4.141064][ T18] ret_from_fork (arch/x86/kernel/process.c:153)
> > > [ 4.141064][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> > > [ 4.141064][ T18] ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> > > [    4.141064][   T18]  </TASK>
> > > [    4.141391][   T18] BUG: using smp_processor_id() in preemptible [=
00000000] code: rcuop/0/18
> > > [ 4.143427][ T18] caller is debug_smp_processor_id (lib/smp_processor=
_id.c:61)
> > > [    4.144497][   T18] CPU: 0 PID: 18 Comm: rcuop/0 Not tainted 6.9.0=
-rc2-00079-g4c66bc7cacc0 #1
> > > [    4.146055][   T18] Hardware name: QEMU Standard PC (i440FX + PIIX=
, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> > > [    4.147731][   T18] Call Trace:
> > > [    4.147731][   T18]  <TASK>
> > > [ 4.147731][ T18] dump_stack_lvl (lib/dump_stack.c:116)
> > > [ 4.147731][ T18] dump_stack (lib/dump_stack.c:124)
> > > [ 4.147731][ T18] check_preemption_disabled (arch/x86/include/asm/pre=
empt.h:84 (discriminator 15) lib/smp_processor_id.c:53 (discriminator 15))
> > > [ 4.147731][ T18] debug_smp_processor_id (lib/smp_processor_id.c:61)
> > > [ 4.147731][ T18] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (=
discriminator 1))
> > > [ 4.147731][ T18] nocb_cb_wait (kernel/rcu/tree_nocb.h:936 (discrimin=
ator 2))
> > > [ 4.147731][ T18] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:983 (di=
scriminator 1))
> > > [ 4.147731][ T18] ? nocb_cb_wait (kernel/rcu/tree_nocb.h:976)
> > > [ 4.147731][ T18] kthread (kernel/kthread.c:388)
> > > [ 4.147731][ T18] ? kthread (kernel/kthread.c:373 (discriminator 2))
> > > [ 4.147731][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> > > [ 4.147731][ T18] ret_from_fork (arch/x86/kernel/process.c:153)
> > > [ 4.147731][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> > > [ 4.147731][ T18] ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> > > [    4.147731][   T18]  </TASK>
> > > [    4.148538][   T18] BUG: using smp_processor_id() in preemptible [=
00000000] code: rcuop/0/18
> > > [ 4.150537][ T18] caller is debug_smp_processor_id (lib/smp_processor=
_id.c:61)
> > > [    4.151144][   T18] CPU: 0 PID: 18 Comm: rcuop/0 Not tainted 6.9.0=
-rc2-00079-g4c66bc7cacc0 #1
> > > [    4.152635][   T18] Hardware name: QEMU Standard PC (i440FX + PIIX=
, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> > > [    4.154398][   T18] Call Trace:
> > > [    4.154398][   T18]  <TASK>
> > > [ 4.154398][ T18] dump_stack_lvl (lib/dump_stack.c:116)
> > > [ 4.154398][ T18] dump_stack (lib/dump_stack.c:124)
> > > [ 4.154398][ T18] check_preemption_disabled (arch/x86/include/asm/pre=
empt.h:84 (discriminator 15) lib/smp_processor_id.c:53 (discriminator 15))
> > > [ 4.154398][ T18] debug_smp_processor_id (lib/smp_processor_id.c:61)
> > > [ 4.154398][ T18] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (=
discriminator 1))
> > > [ 4.154398][ T18] nocb_cb_wait (kernel/rcu/tree_nocb.h:936 (discrimin=
ator 2))
> > > [ 4.154398][ T18] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:983 (di=
scriminator 1))
> > > [ 4.154398][ T18] ? nocb_cb_wait (kernel/rcu/tree_nocb.h:976)
> > > [ 4.154398][ T18] kthread (kernel/kthread.c:388)
> > > [ 4.154398][ T18] ? kthread (kernel/kthread.c:373 (discriminator 2))
> > > [ 4.154398][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> > > [ 4.154398][ T18] ret_from_fork (arch/x86/kernel/process.c:153)
> > > [ 4.154398][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> > > [ 4.154398][ T18] ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> > > [    4.154398][   T18]  </TASK>
> > > [    4.156100][    T1] smp: Bringing up secondary CPUs ...
> > > [    4.159421][   T18] BUG: using smp_processor_id() in preemptible [=
00000000] code: rcuop/0/18
> > > [ 4.161134][ T18] caller is debug_smp_processor_id (lib/smp_processor=
_id.c:61)
> > > [    4.162569][   T18] CPU: 0 PID: 18 Comm: rcuop/0 Not tainted 6.9.0=
-rc2-00079-g4c66bc7cacc0 #1
> > > [    4.164398][   T18] Hardware name: QEMU Standard PC (i440FX + PIIX=
, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> > > [    4.164398][   T18] Call Trace:
> > > [    4.164398][   T18]  <TASK>
> > > [ 4.164398][ T18] dump_stack_lvl (lib/dump_stack.c:116)
> > > [ 4.164398][ T18] dump_stack (lib/dump_stack.c:124)
> > > [ 4.164398][ T18] check_preemption_disabled (arch/x86/include/asm/pre=
empt.h:84 (discriminator 15) lib/smp_processor_id.c:53 (discriminator 15))
> > > [ 4.164398][ T18] debug_smp_processor_id (lib/smp_processor_id.c:61)
> > > [ 4.164398][ T18] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (=
discriminator 1))
> > > [ 4.164398][ T18] nocb_cb_wait (kernel/rcu/tree_nocb.h:936 (discrimin=
ator 2))
> > > [ 4.164398][ T18] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:983 (di=
scriminator 1))
> > > [ 4.164398][ T18] ? nocb_cb_wait (kernel/rcu/tree_nocb.h:976)
> > > [ 4.164398][ T18] kthread (kernel/kthread.c:388)
> > > [ 4.164398][ T18] ? kthread (kernel/kthread.c:373 (discriminator 2))
> > > [ 4.164398][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> > > [ 4.164398][ T18] ret_from_fork (arch/x86/kernel/process.c:153)
> > > [ 4.164398][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> > > [ 4.164398][ T18] ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> > > [    4.164398][   T18]  </TASK>
> > > [    4.168016][   T18] BUG: using smp_processor_id() in preemptible [=
00000000] code: rcuop/0/18
> > > [ 4.170139][ T18] caller is debug_smp_processor_id (lib/smp_processor=
_id.c:61)
> > > [    4.171170][   T18] CPU: 0 PID: 18 Comm: rcuop/0 Not tainted 6.9.0=
-rc2-00079-g4c66bc7cacc0 #1
> > > [    4.173242][   T18] Hardware name: QEMU Standard PC (i440FX + PIIX=
, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> > > [    4.174398][   T18] Call Trace:
> > > [    4.174398][   T18]  <TASK>
> > > [ 4.174398][ T18] dump_stack_lvl (lib/dump_stack.c:116)
> > > [ 4.174398][ T18] dump_stack (lib/dump_stack.c:124)
> > > [ 4.174398][ T18] check_preemption_disabled (arch/x86/include/asm/pre=
empt.h:84 (discriminator 15) lib/smp_processor_id.c:53 (discriminator 15))
> > > [ 4.174398][ T18] debug_smp_processor_id (lib/smp_processor_id.c:61)
> > > [ 4.174398][ T18] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (=
discriminator 1))
> > > [ 4.174398][ T18] nocb_cb_wait (kernel/rcu/tree_nocb.h:936 (discrimin=
ator 2))
> > > [ 4.174398][ T18] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:983 (di=
scriminator 1))
> > > [ 4.174398][ T18] ? nocb_cb_wait (kernel/rcu/tree_nocb.h:976)
> > > [ 4.174398][ T18] kthread (kernel/kthread.c:388)
> > > [ 4.174398][ T18] ? kthread (kernel/kthread.c:373 (discriminator 2))
> > > [ 4.174398][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> > > [ 4.174398][ T18] ret_from_fork (arch/x86/kernel/process.c:153)
> > > [ 4.174398][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> > > [ 4.174398][ T18] ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> > > [    4.174398][   T18]  </TASK>
> > > [    4.189949][    T1] smpboot: x86: Booting SMP configuration:
> > > [    4.191158][    T1] .... node  #0, CPUs:      #1
> > > [    1.668906][    T0] masked ExtINT on CPU#1
> > > [    4.202955][   T29] BUG: using smp_processor_id() in preemptible [=
00000000] code: rcuop/1/29
> > > [ 4.204471][ T29] caller is debug_smp_processor_id (lib/smp_processor=
_id.c:61)
> > > [    4.205845][   T29] CPU: 0 PID: 29 Comm: rcuop/1 Not tainted 6.9.0=
-rc2-00079-g4c66bc7cacc0 #1
> > > [    4.207731][   T29] Hardware name: QEMU Standard PC (i440FX + PIIX=
, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> > > [    4.207731][   T29] Call Trace:
> > > [    4.207731][   T29]  <TASK>
> > > [ 4.207731][ T29] dump_stack_lvl (lib/dump_stack.c:116)
> > > [ 4.207731][ T29] dump_stack (lib/dump_stack.c:124)
> > > [ 4.207731][ T29] check_preemption_disabled (arch/x86/include/asm/pre=
empt.h:84 (discriminator 15) lib/smp_processor_id.c:53 (discriminator 15))
> > > [ 4.207731][ T29] debug_smp_processor_id (lib/smp_processor_id.c:61)
> > > [ 4.207731][ T29] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (=
discriminator 1))
> > > [ 4.207731][ T29] nocb_cb_wait (kernel/rcu/tree_nocb.h:936 (discrimin=
ator 2))
> > > [ 4.207731][ T29] ? __this_cpu_preempt_check (lib/smp_processor_id.c:=
67)
> > > [ 4.207731][ T29] ? lockdep_hardirqs_on (kernel/locking/lockdep.c:442=
1 (discriminator 16))
> > > [ 4.207731][ T29] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:983 (di=
scriminator 1))
> > > [ 4.207731][ T29] ? nocb_cb_wait (kernel/rcu/tree_nocb.h:976)
> > > [ 4.207731][ T29] kthread (kernel/kthread.c:388)
> > > [ 4.207731][ T29] ? kthread (kernel/kthread.c:373 (discriminator 2))
> > > [ 4.207731][ T29] ? kthread_complete_and_exit (kernel/kthread.c:341)
> > > [ 4.207731][ T29] ret_from_fork (arch/x86/kernel/process.c:153)
> > > [ 4.207731][ T29] ? kthread_complete_and_exit (kernel/kthread.c:341)
> > > [ 4.207731][ T29] ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> > > [    4.207731][   T29]  </TASK>
> > > [    4.207989][   T18] BUG: using smp_processor_id() in preemptible [=
00000000] code: rcuop/0/18
> > > [ 4.209997][ T18] caller is debug_smp_processor_id (lib/smp_processor=
_id.c:61)
> > > [    4.211188][   T18] CPU: 0 PID: 18 Comm: rcuop/0 Not tainted 6.9.0=
-rc2-00079-g4c66bc7cacc0 #1
> > > [    4.212898][   T18] Hardware name: QEMU Standard PC (i440FX + PIIX=
, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> > > [    4.214398][   T18] Call Trace:
> > > [    4.214398][   T18]  <TASK>
> > > [ 4.214398][ T18] dump_stack_lvl (lib/dump_stack.c:116)
> > > [ 4.214398][ T18] dump_stack (lib/dump_stack.c:124)
> > > [ 4.214398][ T18] check_preemption_disabled (arch/x86/include/asm/pre=
empt.h:84 (discriminator 15) lib/smp_processor_id.c:53 (discriminator 15))
> > > [ 4.214398][ T18] debug_smp_processor_id (lib/smp_processor_id.c:61)
> > > [ 4.214398][ T18] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (=
discriminator 1))
> > > [ 4.214398][ T18] nocb_cb_wait (kernel/rcu/tree_nocb.h:936 (discrimin=
ator 2))
> > > [ 4.214398][ T18] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:983 (di=
scriminator 1))
> > > [ 4.214398][ T18] ? nocb_cb_wait (kernel/rcu/tree_nocb.h:976)
> > > [ 4.214398][ T18] kthread (kernel/kthread.c:388)
> > > [ 4.214398][ T18] ? kthread (kernel/kthread.c:373 (discriminator 2))
> > > [ 4.214398][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> > > [ 4.214398][ T18] ret_from_fork (arch/x86/kernel/process.c:153)
> > > [ 4.214398][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> > > [ 4.214398][ T18] ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> > > [    4.214398][   T18]  </TASK>
> > > [    4.215399][   T18] BUG: using smp_processor_id() in preemptible [=
00000000] code: rcuop/0/18
> > > [ 4.217064][ T18] caller is debug_smp_processor_id (lib/smp_processor=
_id.c:61)
> > > [    4.217772][   T18] CPU: 0 PID: 18 Comm: rcuop/0 Not tainted 6.9.0=
-rc2-00079-g4c66bc7cacc0 #1
> > > [    4.219363][   T18] Hardware name: QEMU Standard PC (i440FX + PIIX=
, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> > > [    4.221064][   T18] Call Trace:
> > > [    4.221064][   T18]  <TASK>
> > > [ 4.221064][ T18] dump_stack_lvl (lib/dump_stack.c:116)
> > > [ 4.221064][ T18] dump_stack (lib/dump_stack.c:124)
> > > [ 4.221064][ T18] check_preemption_disabled (arch/x86/include/asm/pre=
empt.h:84 (discriminator 15) lib/smp_processor_id.c:53 (discriminator 15))
> > > [ 4.221064][ T18] debug_smp_processor_id (lib/smp_processor_id.c:61)
> > > [ 4.221064][ T18] rcu_rdp_is_offloaded (kernel/rcu/tree_plugin.h:27 (=
discriminator 1))
> > > [ 4.221064][ T18] nocb_cb_wait (kernel/rcu/tree_nocb.h:936 (discrimin=
ator 2))
> > > [ 4.221064][ T18] rcu_nocb_cb_kthread (kernel/rcu/tree_nocb.h:983 (di=
scriminator 1))
> > > [ 4.221064][ T18] ? nocb_cb_wait (kernel/rcu/tree_nocb.h:976)
> > > [ 4.221064][ T18] kthread (kernel/kthread.c:388)
> > > [ 4.221064][ T18] ? kthread (kernel/kthread.c:373 (discriminator 2))
> > > [ 4.221064][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> > > [ 4.221064][ T18] ret_from_fork (arch/x86/kernel/process.c:153)
> > > [ 4.221064][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341)
> > > [ 4.221064][ T18] ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
> > > [    4.221064][   T18]  </TASK>
> > >
> > >
> > >
> > > The kernel config and materials to reproduce are available at:
> > > https://download.01.org/0day-ci/archive/20240507/202405072252.959dadc=
4-lkp@intel.com
> > >
> > >
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> > >
> > >
