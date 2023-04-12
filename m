Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF6C3C02
	for <oe-lkp@lists.linux.dev>; Wed, 12 Apr 2023 19:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D779DC433D2;
	Wed, 12 Apr 2023 19:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681326345;
	bh=cdMSF+Dvx9/gxdOBvKUJuCiarBqIUbXfKxRSZU94DYk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=taCaSvwmBNHj9Fvf38uEjl8kCATfApPVoor8S78Vq///vnvd8i7PAaJUsNDWY/qZ/
	 6fLiWmwDWtPP+4o2PQykJyzMgomMRlR68i0xmTHlmjbEQfp6VZmzVrcz6fzjzUkPE7
	 7fuqISF8GaiGsYpuCutp7Kyip9LF1inJJTsLTqhM1FwTvKyNKDI9xFZoKwl6XJR5Vp
	 OeiLoe/ayK9JhJ8vfrQOZoiV3U2cLsxJh6Fkp+11SkZsC0ZFGCSmKb6mcqFOzDMYWS
	 GWxYMxKQmvNmqjo3Q8RMb+YaGHY0jLG2KTGRLQoHq4CqIIyAkd61TT6WYJwfvY0a2b
	 xKBRQAPYf/Byw==
Message-ID: <033d313acfaef939fbfca9349768df34dec40d2b.camel@kernel.org>
Subject: Re: [cel:topic-shmem-stable-dir-cookies] [shmem] 5fd403eb6c:
 WARNING:inconsistent_lock_state
From: Jeff Layton <jlayton@kernel.org>
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: kernel test robot <yujie.liu@intel.com>, "oe-lkp@lists.linux.dev"
	 <oe-lkp@lists.linux.dev>, kernel test robot <lkp@intel.com>, Linux Memory
	Management List <linux-mm@kvack.org>
Date: Wed, 12 Apr 2023 15:05:43 -0400
In-Reply-To: <4F25D1D2-7D19-49AF-80AD-F0A87BB99681@oracle.com>
References: <202304101606.79aea62f-yujie.liu@intel.com>
	 <4F25D1D2-7D19-49AF-80AD-F0A87BB99681@oracle.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2023-04-12 at 18:03 +0000, Chuck Lever III wrote:
>=20
>=20
> > On Apr 10, 2023, at 8:36 PM, kernel test robot <yujie.liu@intel.com>
> > wrote:
> >=20
> > Hello,
> >=20
> > kernel test robot noticed "WARNING:inconsistent_lock_state" on:
> >=20
> > commit: 5fd403eb6c181c63a3aacd55d92b80256a0670cf ("shmem: stable
> > directory cookies")
> > git://git.kernel.org/cgit/linux/kernel/git/cel/linux topic-shmem-
> > stable-dir-cookies
> >=20
> > in testcase: boot
> >=20
> > compiler: gcc-11
> > test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2
> > -m 16G
> >=20
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
> >=20
> >=20
> > If you fix the issue, kindly add following tag
> > | Reported-by: kernel test robot <yujie.liu@intel.com>
> > | Link:
> > https://lore.kernel.org/oe-lkp/202304101606.79aea62f-yujie.liu@intel.co=
m
> >=20
> >=20
> > [=A0=A0 21.279213][=A0=A0=A0 C0] WARNING: inconsistent lock state
> > [=A0=A0 21.279668][=A0=A0=A0 C0] 6.3.0-rc5-00001-g5fd403eb6c18 #1 Not t=
ainted
> > [=A0=A0 21.280199][=A0=A0=A0 C0] --------------------------------
> > [=A0=A0 21.280657][=A0=A0=A0 C0] inconsistent {SOFTIRQ-ON-W} -> {IN-SOF=
TIRQ-W}
> > usage.
> > [=A0=A0 21.281238][=A0=A0=A0 C0] swapper/0/0 [HC0[0]:SC1[1]:HE0:SE0] ta=
kes:
> > [ 21.281773][ C0] ffff8881102e9b50 (&xa->xa_lock#3){+.?.}-{2:2}, at:
> > xa_destroy (lib/xarray.c:2214)
> > [=A0=A0 21.283140][=A0=A0=A0 C0] {SOFTIRQ-ON-W} state was registered at=
:
> > [ 21.283640][ C0] __lock_acquire (kernel/locking/lockdep.c:5010)=20
> > [ 21.284089][ C0] lock_acquire (kernel/locking/lockdep.c:467
> > kernel/locking/lockdep.c:5671 kernel/locking/lockdep.c:5634)
> > [ 21.284513][ C0] _raw_spin_lock
> > (include/linux/spinlock_api_smp.h:134 kernel/locking/spinlock.c:154)
> > [ 21.284937][ C0] shmem_doff_add (include/linux/xarray.h:965
> > mm/shmem.c:2943)=20
> > [ 21.285375][ C0] shmem_mknod (mm/shmem.c:3014)=20
> > [ 21.285791][ C0] vfs_mknod (fs/namei.c:3916)=20
> > [ 21.286195][ C0] devtmpfs_work_loop (drivers/base/devtmpfs.c:228
> > drivers/base/devtmpfs.c:393 drivers/base/devtmpfs.c:408)
> > [ 21.286653][ C0] devtmpfsd (devtmpfs.c:?)=20
> > [ 21.287046][ C0] kthread (kernel/kthread.c:376)=20
> > [ 21.287441][ C0] ret_from_fork (arch/x86/entry/entry_64.S:314)=20
> > [=A0=A0 21.287864][=A0=A0=A0 C0] irq event stamp: 167451
> > [ 21.288264][ C0] hardirqs last enabled at (167450):
> > kasan_quarantine_put (arch/x86/include/asm/irqflags.h:42
> > (discriminator 1) arch/x86/include/asm/irqflags.h:77 (discriminator
> > 1) arch/x86/include/asm/irqflags.h:135 (discriminator 1)
> > mm/kasan/quarantine.c:242 (discriminator 1))=20
> > [ 21.289095][ C0] hardirqs last disabled at (167451):
> > _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.h:108
> > kernel/locking/spinlock.c:162)
> > [ 21.289969][ C0] softirqs last enabled at (167330): __do_softirq
> > (kernel/softirq.c:415 kernel/softirq.c:600)
> > [ 21.290755][ C0] softirqs last disabled at (167355): irq_exit_rcu
> > (kernel/softirq.c:445 kernel/softirq.c:650 kernel/softirq.c:640
> > kernel/softirq.c:662)
> > [=A0=A0 21.291540][=A0=A0=A0 C0]
> > [=A0=A0 21.291540][=A0=A0=A0 C0] other info that might help us debug th=
is:
> > [=A0=A0 21.292230][=A0=A0=A0 C0]=A0 Possible unsafe locking scenario:
> > [=A0=A0 21.292230][=A0=A0=A0 C0]
> > [=A0=A0 21.292905][=A0=A0=A0 C0]=A0=A0=A0=A0=A0=A0=A0 CPU0
> > [=A0=A0 21.293235][=A0=A0=A0 C0]=A0=A0=A0=A0=A0=A0=A0 ----
> > [=A0=A0 21.293575][=A0=A0=A0 C0]=A0=A0 lock(&xa->xa_lock#3);
> > [=A0=A0 21.293987][=A0=A0=A0 C0]=A0=A0 <Interrupt>
> > [=A0=A0 21.294327][=A0=A0=A0 C0]=A0=A0=A0=A0 lock(&xa->xa_lock#3);
> > [=A0=A0 21.294753][=A0=A0=A0 C0]
> > [=A0=A0 21.294753][=A0=A0=A0 C0]=A0 *** DEADLOCK ***
> > [=A0=A0 21.294753][=A0=A0=A0 C0]
> > [=A0=A0 21.295483][=A0=A0=A0 C0] 1 lock held by swapper/0/0:
> > [ 21.295914][ C0] #0: ffffffff8597a260 (rcu_callback){....}-{0:0},
> > at: rcu_do_batch (kernel/rcu/tree.c:2104)
>=20
> It appears that RCU is trying to evict a tmpfs directory inode
> prematurely.
> lockdep catches this because someone else is trying to add an entry to
> it
> while RCU is trying to free it. Classic use-after-free.
>=20
> Jeff, the only new iput() in this patch is the one you suggested in
> shmem_symlink(). Are you sure it is needed (and also correct)?
>=20

The code in your topic-shmem-stable-dir-cookies branch looks correct to
me. After shmem_get_inode, it holds an inode reference and that must be
explicitly put on error, unless you attach it to the dentry (via
d_instantiate).

I'm not sure how to interpret this. The log is a bit of a mess. It looks
it ended up in some sort of recursive call into the same xarray due to
an interrupt?

One thing that looks suspicious to me is that this patch has the call to
shmem_doff_map_destroy in free_inode (which is the RCU callback). I
think you probably want to do that in destroy_inode instead since that
involves taking locks and such.

I'm not sure that's enough to explain how it ended up here though.

>=20
> > [=A0=A0 21.296705][=A0=A0=A0 C0]
> > [=A0=A0 21.296705][=A0=A0=A0 C0] stack backtrace:
> > [=A0=A0 21.297254][=A0=A0=A0 C0] CPU: 0 PID: 0 Comm: swapper/0 Not tain=
ted
> > 6.3.0-rc5-00001-g5fd403eb6c18 #1
> > [=A0=A0 21.298007][=A0=A0=A0 C0] Hardware name: QEMU Standard PC (i440F=
X +
> > PIIX, 1996), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
> > [=A0=A0 21.298867][=A0=A0=A0 C0] Call Trace:
> > [=A0=A0 21.299199][=A0=A0=A0 C0]=A0 <IRQ>
> > [ 21.299503][ C0] dump_stack_lvl (lib/dump_stack.c:107)=20
> > [ 21.299926][ C0] mark_lock_irq (kernel/locking/lockdep.c:232
> > kernel/locking/lockdep.c:3976 kernel/locking/lockdep.c:4179)
> > [ 21.300362][ C0] ? secondary_startup_64_no_verify
> > (arch/x86/kernel/head_64.S:358)
> > [ 21.300888][ C0] ? __pfx_mark_lock_irq
> > (kernel/locking/lockdep.c:4170)=20
> > [ 21.301353][ C0] ? __pfx_stack_trace_save (kernel/stacktrace.c:114)
> > [ 21.302659][ C0] ? orc_find+0x23b/0x4d0=20
> > [ 21.303106][ C0] ? save_trace (kernel/locking/lockdep.c:586)=20
> > [ 21.303519][ C0] ? secondary_startup_64_no_verify
> > (arch/x86/kernel/head_64.S:358)
> > [ 21.304046][ C0] ? kernel_text_address (kernel/extable.c:99)=20
> > [ 21.304507][ C0] mark_lock+0x4b8/0x13a0=20
> > [ 21.304959][ C0] ? __pfx_mark_lock+0x10/0x10=20
> > [ 21.305445][ C0] mark_usage (kernel/locking/lockdep.c:4530)=20
> > [ 21.305844][ C0] __lock_acquire (kernel/locking/lockdep.c:5010)=20
> > [ 21.306285][ C0] ? mark_lock+0xbc/0x13a0=20
> > [ 21.306741][ C0] ? kasan_save_stack (mm/kasan/common.c:46)=20
> > [ 21.307182][ C0] ? __pfx___lock_acquire
> > (kernel/locking/lockdep.c:4914)=20
> > [ 21.307647][ C0] ? rcu_do_batch (include/linux/rcupdate.h:332
> > kernel/rcu/tree.c:2114)
> > [ 21.308082][ C0] ? rcu_core (kernel/rcu/tree.c:2374)=20
> > [ 21.308489][ C0] ? __do_softirq (arch/x86/include/asm/atomic.h:29
> > include/linux/jump_label.h:260 include/linux/jump_label.h:270
> > include/trace/events/irq.h:142 kernel/softirq.c:572)
> > [ 21.308922][ C0] ? irq_exit_rcu (kernel/softirq.c:445
> > kernel/softirq.c:650 kernel/softirq.c:640 kernel/softirq.c:662)
> > [ 21.309353][ C0] lock_acquire (kernel/locking/lockdep.c:467
> > kernel/locking/lockdep.c:5671 kernel/locking/lockdep.c:5634)
> > [ 21.309771][ C0] ? xa_destroy (lib/xarray.c:2214)=20
> > [ 21.310185][ C0] ? __pfx_lock_acquire
> > (kernel/locking/lockdep.c:5637)=20
> > [ 21.310639][ C0] ? __pfx___lock_acquire
> > (kernel/locking/lockdep.c:4914)=20
> > [ 21.311104][ C0] ? ftrace_likely_update
> > (arch/x86/include/asm/smap.h:56 kernel/trace/trace_branch.c:229)
> > [ 21.311571][ C0] _raw_spin_lock_irqsave
> > (include/linux/spinlock_api_smp.h:111 kernel/locking/spinlock.c:162)
> > [ 21.312040][ C0] ? xa_destroy (lib/xarray.c:2214)=20
> > [ 21.312457][ C0] xa_destroy (lib/xarray.c:2214)=20
> > [ 21.312859][ C0] ? lock_acquire (kernel/locking/lockdep.c:467
> > kernel/locking/lockdep.c:5671 kernel/locking/lockdep.c:5634)
> > [ 21.313290][ C0] ? __pfx_xa_destroy (lib/xarray.c:2208)=20
> > [ 21.313746][ C0] shmem_free_in_core_inode (mm/shmem.c:2989
> > mm/shmem.c:4061)=20
> > [ 21.314231][ C0] ? __pfx_shmem_free_in_core_inode (mm/shmem.c:4058)
> > [ 21.314763][ C0] i_callback (fs/inode.c:252)=20
> > [ 21.315154][ C0] rcu_do_batch (include/linux/rcupdate.h:332
> > kernel/rcu/tree.c:2114)
> > [ 21.315580][ C0] ? __pfx_rcu_do_batch (kernel/rcu/tree.c:2051)=20
> > [ 21.316037][ C0] ? _raw_spin_unlock_irqrestore
> > (arch/x86/include/asm/irqflags.h:42
> > arch/x86/include/asm/irqflags.h:77
> > arch/x86/include/asm/irqflags.h:135
> > include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194)
> > [ 21.316550][ C0] ? rcu_report_qs_rdp (kernel/rcu/tree.c:2002)=20
> > [ 21.317012][ C0] rcu_core (kernel/rcu/tree.c:2374)=20
> > [ 21.317414][ C0] __do_softirq (arch/x86/include/asm/atomic.h:29
> > include/linux/jump_label.h:260 include/linux/jump_label.h:270
> > include/trace/events/irq.h:142 kernel/softirq.c:572)
> > [ 21.317836][ C0] irq_exit_rcu (kernel/softirq.c:445
> > kernel/softirq.c:650 kernel/softirq.c:640 kernel/softirq.c:662)
> > [ 21.318251][ C0] sysvec_apic_timer_interrupt
> > (arch/x86/kernel/apic/apic.c:1107 (discriminator 14))
> > [=A0=A0 21.318749][=A0=A0=A0 C0]=A0 </IRQ>
> > [=A0=A0 21.319052][=A0=A0=A0 C0]=A0 <TASK>
> > [ 21.319355][ C0] asm_sysvec_apic_timer_interrupt
> > (arch/x86/include/asm/idtentry.h:645)
> > [ 21.319880][ C0] RIP: 0010:default_idle
> > (arch/x86/include/asm/irqflags.h:37
> > arch/x86/include/asm/irqflags.h:72 arch/x86/kernel/process.c:704)
> > [ 21.320344][ C0] Code: ff ff ff 90 90 90 90 90 90 90 90 90 90 90 90
> > 90 90 90 90 f3 0f 1e fa 8b 05 f6 b4 a8 03 85 c0 7e 07 0f 00 2d 8b 96
> > 3d 00 fb f4 <fa> c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90
> > 90 90 90 90
> > All code
> > =3D=3D=3D=3D=3D=3D=3D=3D
> > =A0=A0 0: ff=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (=
bad)
> > =A0=A0 1: ff=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (=
bad)
> > =A0=A0 2: ff 90 90 90 90 90=A0=A0=A0=A0 call=A0=A0 *-0x6f6f6f70(%rax)
> > =A0=A0 8: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 n=
op
> > =A0=A0 9: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 n=
op
> > =A0=A0 a: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 n=
op
> > =A0=A0 b: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 n=
op
> > =A0=A0 c: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 n=
op
> > =A0=A0 d: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 n=
op
> > =A0=A0 e: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 n=
op
> > =A0=A0 f: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 n=
op
> > =A0 10: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nop
> > =A0 11: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nop
> > =A0 12: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nop
> > =A0 13: f3 0f 1e fa=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 endbr64
> > =A0 17: 8b 05 f6 b4 a8 03=A0=A0=A0=A0 mov=A0=A0=A0 0x3a8b4f6(%rip),%eax=
=A0=A0=A0=A0=A0=A0=A0 #
> > 0x3a8b513
> > =A0 1d: 85 c0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 test=A0=
=A0 %eax,%eax
> > =A0 1f: 7e 07=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 jle=A0=A0=
=A0 0x28
> > =A0 21: 0f 00 2d 8b 96 3d 00 verw=A0=A0 0x3d968b(%rip)=A0=A0=A0=A0=A0=
=A0=A0 # 0x3d96b3
> > =A0 28: fb=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sti
> > =A0 29: f4=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hlt
> > =A0 2a:* fa=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cl=
i <-- trapping instruction
> > =A0 2b: c3=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret
> > =A0 2c: cc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int=
3
> > =A0 2d: cc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int=
3
> > =A0 2e: cc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int=
3
> > =A0 2f: cc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int=
3
> > =A0 30: 0f 1f 00=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nopl=A0=A0 (%ra=
x)
> > =A0 33: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nop
> > =A0 34: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nop
> > =A0 35: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nop
> > =A0 36: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nop
> > =A0 37: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nop
> > =A0 38: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nop
> > =A0 39: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nop
> > =A0 3a: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nop
> > =A0 3b: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nop
> > =A0 3c: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nop
> > =A0 3d: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nop
> > =A0 3e: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nop
> > =A0 3f: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nop
> >=20
> > Code starting with the faulting instruction
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =A0=A0 0: fa=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 c=
li
> > =A0=A0 1: c3=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 r=
et
> > =A0=A0 2: cc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 i=
nt3
> > =A0=A0 3: cc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 i=
nt3
> > =A0=A0 4: cc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 i=
nt3
> > =A0=A0 5: cc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 i=
nt3
> > =A0=A0 6: 0f 1f 00=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nopl=A0=A0 (%=
rax)
> > =A0=A0 9: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 n=
op
> > =A0=A0 a: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 n=
op
> > =A0=A0 b: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 n=
op
> > =A0=A0 c: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 n=
op
> > =A0=A0 d: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 n=
op
> > =A0=A0 e: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 n=
op
> > =A0=A0 f: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 n=
op
> > =A0 10: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nop
> > =A0 11: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nop
> > =A0 12: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nop
> > =A0 13: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nop
> > =A0 14: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nop
> > =A0 15: 90=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nop
> >=20
> >=20
> > --=20
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests
>=20
> --
> Chuck Lever
>=20
>=20

--=20
Jeff Layton <jlayton@kernel.org>
