Content-Type: multipart/mixed; boundary="===============0360627371329036955=="
MIME-Version: 1.0
From: Nick Krause <xerofoify@gmail.com>
To: lkp@lists.01.org
Subject: Re: [rfcomm] WARNING: CPU: 0 PID: 105 at kernel/sched/core.c:7094 __might_sleep()
Date: Sat, 09 Aug 2014 00:37:36 -0400
Message-ID: <CAPDOMVidvibruAOqYF9OHc9S4M-e081hegPerg7Ehb38p-PqBw@mail.gmail.com>
In-Reply-To: <20140805140726.GC5593@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============0360627371329036955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 5, 2014 at 10:07 AM, Fengguang Wu <fengguang.wu@intel.com> wr=
ote:
> Greetings,
>
> Here is an rfcomm error triggered by this debug check.
>
> git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/wait
> commit 64c2181bc433b17f04da8fe8592aa83cceac9606
> Author:     Peter Zijlstra <peterz@infradead.org>
> AuthorDate: Mon Aug 4 11:14:16 2014 +0200
> Commit:     Peter Zijlstra <a.p.zijlstra@chello.nl>
> CommitDate: Mon Aug 4 13:29:59 2014 +0200
>
>     sched: Debug nested sleeps
>
>     Validate we call might_sleep() with TASK_RUNNING, which catches places
>     where we nest blocking primitives, eg. mutex usage in a wait loop.
>
>     Since all blocking is arranged through task_struct::state, nesting
>     this is going to cause two distinct issues:
>
>      - the inner primitive will set TASK_RUNNING and the outer will not
>        block
>
>      - the outer sets !TASK_RUNNING and the inner expects to be called
>        with TASK_RUNNING and blocks forever (mutex_lock).
>
>     Signed-off-by: Peter Zijlstra <peterz@infradead.org>
>     Link: http://lkml.kernel.org/n/tip-0hge361rozfbng4z2t64t217(a)git.ker=
nel.org
>
> [    4.595230] mpoa:atm_mpoa_init: mpc.c: initialized
> [    4.595625] 8021q: 802.1Q VLAN Support v1.8
> [    4.596034] ------------[ cut here ]------------
> [    4.596422] WARNING: CPU: 0 PID: 105 at kernel/sched/core.c:7094 __mig=
ht_sleep+0x286/0x320()
> [    4.597287] do not call blocking ops when !TASK_RUNNING; state=3D1 set=
 at [<c21183b0>] rfcomm_run+0x160/0x27a0
> [    4.598083] CPU: 0 PID: 105 Comm: krfcommd Not tainted 3.16.0-00053-g6=
4c2181 #1
> [    4.598668] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2011
> [    4.599133]  c25eb548 d16ebe30 c236754c d16ebe60 c106fa44 c25eb644 d16=
ebe8c 00000069
> [    4.599857]  c25eb548 00001bb6 c10b9b16 c10b9b16 d16bd810 c25ebd04 000=
00067 d16ebe78
> [    4.600595]  c106fb3a 00000009 d16ebe70 c25eb644 d16ebe8c d16ebea8 c10=
b9b16 c25eb548
> [    4.601320] Call Trace:
> [    4.601531]  [<c236754c>] dump_stack+0x40/0x5e
> [    4.601900]  [<c106fa44>] warn_slowpath_common+0xc4/0x110
> [    4.602337]  [<c10b9b16>] ? __might_sleep+0x286/0x320
> [    4.602752]  [<c10b9b16>] ? __might_sleep+0x286/0x320
> [    4.603158]  [<c106fb3a>] warn_slowpath_fmt+0x4a/0x60
> [    4.603581]  [<c10b9b16>] __might_sleep+0x286/0x320
> [    4.603988]  [<c21183b0>] ? rfcomm_run+0x160/0x27a0
> [    4.604384]  [<c21183b0>] ? rfcomm_run+0x160/0x27a0
> [    4.604786]  [<c2118250>] ? rfcomm_check_accept+0x130/0x130
> [    4.605241]  [<c23794c5>] mutex_lock+0x25/0x60
> [    4.605604]  [<c2118412>] rfcomm_run+0x1c2/0x27a0
> [    4.605993]  [<c10bd9bd>] ? pick_next_task_fair+0x12d/0x260
> [    4.606441]  [<c237b7e1>] ? _raw_spin_unlock_irq+0x71/0xc0
> [    4.606925]  [<c237229d>] ? __schedule+0x48d/0xb60
> [    4.607316]  [<c237b6db>] ? _raw_spin_unlock_irqrestore+0x7b/0x110
> [    4.607819]  [<c2372c69>] ? preempt_schedule+0x69/0xf0
> [    4.608241]  [<c1013800>] ? ___preempt_schedule+0xc/0x1c
> [    4.608667]  [<c237b700>] ? _raw_spin_unlock_irqrestore+0xa0/0x110
> [    4.609170]  [<c2118250>] ? rfcomm_check_accept+0x130/0x130
> [    4.609624]  [<c10a4258>] kthread+0x118/0x160
> [    4.609987]  [<c237cac0>] ret_from_kernel_thread+0x20/0x30
> [    4.610443]  [<c10a4140>] ? __kthread_unpark+0xa0/0xa0
> [    4.610873] ---[ end trace 123887810d830305 ]---
> [    4.611251] ------------[ cut here ]------------
>
> This script may reproduce the error.
>
> -------------------------------------------------------------------------=
---
> #!/bin/bash
>
> kernel=3D$1
> initrd=3Dyocto-minimal-i386.cgz
>
> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/initrd/$initrd
>
> kvm=3D(
>         qemu-system-x86_64
>         -cpu kvm64
>         -enable-kvm
>         -kernel $kernel
>         -initrd $initrd
>         -m 320
>         -smp 1
>         -net nic,vlan=3D1,model=3De1000
>         -net user,vlan=3D1
>         -boot order=3Dnc
>         -no-reboot
>         -watchdog i6300esb
>         -rtc base=3Dlocaltime
>         -serial stdio
>         -display none
>         -monitor null
> )
>
> append=3D(
>         hung_task_panic=3D1
>         earlyprintk=3DttyS0,115200
>         debug
>         apic=3Ddebug
>         sysrq_always_enabled
>         rcupdate.rcu_cpu_stall_timeout=3D100
>         panic=3D10
>         softlockup_panic=3D1
>         nmi_watchdog=3Dpanic
>         load_ramdisk=3D2
>         prompt_ramdisk=3D0
>         console=3DttyS0,115200
>         console=3Dtty0
>         vga=3Dnormal
>         root=3D/dev/ram0
>         rw
>         drbd.minor_count=3D8
> )
>
> "${kvm[@]}" --append "${append[*]}"
> -------------------------------------------------------------------------=
---
>
> Thanks,
> Fengguang
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo(a)vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
Fenguang,
Just asking , is this a new trace or are you reminding our or another
older trace you did a few months
back. If it isn't I will be glad to trace this for you and the maintainers.
Regards Nick

--===============0360627371329036955==--

