Content-Type: multipart/mixed; boundary="===============8831488549926302539=="
MIME-Version: 1.0
From: Srivatsa S. Bhat <srivatsa.bhat@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [migration] kernel BUG at kernel/irq_work.c:175!
Date: Wed, 25 Jun 2014 09:44:10 +0000
Message-ID: <53AA9A33.4020301@linux.vnet.ibm.com>
In-Reply-To: <20140625093146.GC27280@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============8831488549926302539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/25/2014 03:01 PM, Fengguang Wu wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
>

I think this is the same issue as the one reported by Stephen Warren
here:

https://lkml.org/lkml/2014/6/24/765

Peter Zijlstra is working on a fix for that.

Regards,
Srivatsa S. Bhat

 =

> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 68c90b2c635f18ad51ae7440162f6c082ea1288d
> Merge: f08af6f ec11f8c
> Author:     Stephen Rothwell <sfr@canb.auug.org.au>
> AuthorDate: Mon Jun 23 14:12:48 2014 +1000
> =

>     Merge branch 'akpm-current/current'
> =

> +---------------------------------+------------+------------+------------=
+---------------+
> |                                 | f08af6fa87 | ec11f8c81f | 68c90b2c63 =
| next-20140623 |
> +---------------------------------+------------+------------+------------=
+---------------+
> | boot_successes                  | 60         | 60         | 0          =
| 0             |
> | boot_failures                   | 0          | 0          | 20         =
| 13            |
> | kernel_BUG_at_kernel/irq_work.c | 0          | 0          | 20         =
| 13            |
> | invalid_opcode                  | 0          | 0          | 20         =
| 13            |
> | RIP:irq_work_run                | 0          | 0          | 20         =
| 13            |
> | backtrace:smpboot_thread_fn     | 0          | 0          | 20         =
| 13            |
> +---------------------------------+------------+------------+------------=
+---------------+
> =

> [    2.194744] EDD information not available.
> [    2.195290] Unregister pv shared memory for cpu 0
> [    2.206025] ------------[ cut here ]------------
> [    2.206025] kernel BUG at kernel/irq_work.c:175!
> [    2.206025] invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC
> [    2.206025] CPU: 0 PID: 9 Comm: migration/0 Not tainted 3.16.0-rc2-020=
39-g68c90b2 #1
> [    2.206025] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2011
> [    2.206025] task: ffff88001219a7e0 ti: ffff8800121a4000 task.ti: ffff8=
800121a4000
> [    2.206025] RIP: 0010:[<ffffffff810f9318>]  [<ffffffff810f9318>] irq_w=
ork_run+0xf/0x1c
> [    2.206025] RSP: 0000:ffff8800121a7c48  EFLAGS: 00010046
> [    2.206025] RAX: 0000000080000001 RBX: 0000000000000000 RCX: 000000000=
0000005
> [    2.206025] RDX: 0000000000000000 RSI: 0000000000000008 RDI: 000000000=
0000000
> [    2.206025] RBP: ffff8800121a7c68 R08: 0000000000000002 R09: 000000000=
0000001
> [    2.206025] R10: ffffffff810e2a10 R11: ffffffff810b9de3 R12: ffff88001=
2412340
> [    2.206025] R13: 0000000000000000 R14: 0000000000000000 R15: ffffffff8=
1c83e50
> [    2.206025] FS:  0000000000000000(0000) GS:ffff880012400000(0000) knlG=
S:0000000000000000
> [    2.206025] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
> [    2.206025] CR2: 0000000000000000 CR3: 0000000001c0c000 CR4: 000000000=
00006b0
> [    2.206025] Stack:
> [    2.206025]  ffffffff810e87e0 ffff880012412380 00000000fffffff0 ffffff=
ff81c81ba0
> [    2.206025]  ffff8800121a7c88 ffffffff810e88f0 0000000000000001 000000=
00fffffff0
> [    2.206025]  ffff8800121a7cd0 ffffffff810b6e23 0000000000000000 000000=
0000000008
> [    2.206025] Call Trace:
> [    2.206025]  [<ffffffff810e87e0>] ? flush_smp_call_function_queue+0xa4=
/0x107
> [    2.206025]  [<ffffffff810e88f0>] hotplug_cfd+0xad/0xbb
> [    2.206025]  [<ffffffff810b6e23>] notifier_call_chain+0x68/0x8e
> [    2.206025]  [<ffffffff810b70c0>] __raw_notifier_call_chain+0x9/0xb
> [    2.206025]  [<ffffffff8109b39e>] __cpu_notify+0x1b/0x32
> [    2.206025]  [<ffffffff8109b3c3>] cpu_notify+0xe/0x10
> [    2.206025]  [<ffffffff817e2817>] take_cpu_down+0x22/0x35
> [    2.206025]  [<ffffffff810f4153>] multi_cpu_stop+0x8c/0xe2
> [    2.206025]  [<ffffffff810f40c7>] ? cpu_stopper_thread+0x126/0x126
> [    2.206025]  [<ffffffff810f402e>] cpu_stopper_thread+0x8d/0x126
> [    2.206025]  [<ffffffff810cdab4>] ? lock_acquire+0x94/0x9d
> [    2.206025]  [<ffffffff817f25af>] ? _raw_spin_unlock_irqrestore+0x40/0=
x55
> [    2.206025]  [<ffffffff810cbdcd>] ? trace_hardirqs_on_caller+0x171/0x1=
8d
> [    2.206025]  [<ffffffff817f25b7>] ? _raw_spin_unlock_irqrestore+0x48/0=
x55
> [    2.206025]  [<ffffffff810b8e39>] smpboot_thread_fn+0x182/0x1a0
> [    2.206025]  [<ffffffff810b8cb7>] ? in_egroup_p+0x2e/0x2e
> [    2.206025]  [<ffffffff810b372c>] kthread+0xcd/0xd5
> [    2.206025]  [<ffffffff810b365f>] ? __kthread_parkme+0x5c/0x5c
> [    2.206025]  [<ffffffff817f2f3c>] ret_from_fork+0x7c/0xb0
> [    2.206025]  [<ffffffff810b365f>] ? __kthread_parkme+0x5c/0x5c
> [    2.206025] Code: 48 c7 c7 65 cd b0 81 e8 43 20 fa ff c6 05 50 e1 c9 0=
0 01 eb 02 31 db 88 d8 5b 5d c3 65 8b 04 25 10 b8 00 00 a9 00 00 0f 00 75 0=
2 <0f> 0b 55 48 89 e5 e8 b5 fd ff ff 5d c3 55 48 89 e5 53 48 89 fb =

> [    2.206025] RIP  [<ffffffff810f9318>] irq_work_run+0xf/0x1c
> [    2.206025]  RSP <ffff8800121a7c48>
> [    2.206025] ---[ end trace f7f1564c3a1f35d0 ]---
> [    2.206025] note: migration/0[9] exited with preempt_count 1
> =

> git bisect start 58ae500a03a6bf68eee323c342431bfdd3f460b6 f08af6fa87ea332=
62fe2fe5167119fb55ad9dd2c --
> git bisect  bad 68c90b2c635f18ad51ae7440162f6c082ea1288d  # 14:19      0-=
     20  Merge branch 'akpm-current/current'
> git bisect good 6b11d02e25c79a8961983a966b7fafcdc36c7a91  # 14:23     20+=
      0  slab: do not keep free objects/slabs on dead memcg caches
> git bisect good 11709212b3a5479fcc63dda3160f4f4b0251f914  # 14:27     20+=
      0  mm/util.c: add kstrimdup()
> git bisect good 6af20930dcfcd13270de4f29f3830312f3c36a17  # 14:33     20+=
      0  fork: reset mm->pinned_vm
> git bisect good 8e7c32fb574ec1b49fd0e451cb25febf51430dd9  # 14:38     20+=
      0  fs/qnx6: use pr_fmt and __func__ in logging
> git bisect good 6873969c750b85734bc7d06be3c51ad381b3c85a  # 14:41     20+=
      0  shm: remove unneeded extern for function
> git bisect good 2b9ed79abc340e15bc9652048d2e8d8a283bd8a1  # 14:48     20+=
      0  um: use asm-generic/scatterlist.h
> git bisect good ec11f8c81fbc76534c1374e29bdf36f085ed859a  # 15:12     20+=
      0  lib/scatterlist: clean up useless architecture versions of scatter=
list.h
> # first bad commit: [68c90b2c635f18ad51ae7440162f6c082ea1288d] Merge bran=
ch 'akpm-current/current'
> git bisect good f08af6fa87ea33262fe2fe5167119fb55ad9dd2c  # 15:14     60+=
      0  Merge branch 'rd-docs/master'
> git bisect good ec11f8c81fbc76534c1374e29bdf36f085ed859a  # 15:19     60+=
      0  lib/scatterlist: clean up useless architecture versions of scatter=
list.h
> git bisect  bad 58ae500a03a6bf68eee323c342431bfdd3f460b6  # 15:19      0-=
     13  Add linux-next specific files for 20140623
> git bisect good a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee  # 15:25     60+=
      0  Linux 3.16-rc2
> git bisect  bad 58ae500a03a6bf68eee323c342431bfdd3f460b6  # 15:25      0-=
     13  Add linux-next specific files for 20140623
> =

> =

> This script may reproduce the error.
> =

> -------------------------------------------------------------------------=
----
> #!/bin/bash
> =

> kernel=3D$1
> initrd=3Dquantal-core-x86_64.cgz
> =

> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/blob/=
master/initrd/$initrd
> =

> kvm=3D(
> 	qemu-system-x86_64 -cpu kvm64 -enable-kvm =

> 	-kernel $kernel
> 	-initrd $initrd
> 	-smp 2
> 	-m 256M
> 	-net nic,vlan=3D0,macaddr=3D00:00:00:00:00:00,model=3Dvirtio
> 	-net user,vlan=3D0
> 	-net nic,vlan=3D1,model=3De1000
> 	-net user,vlan=3D1
> 	-boot order=3Dnc
> 	-no-reboot
> 	-watchdog i6300esb
> 	-serial stdio
> 	-display none
> 	-monitor null
> )
> =

> append=3D(
> 	debug
> 	sched_debug
> 	apic=3Ddebug
> 	ignore_loglevel
> 	sysrq_always_enabled
> 	panic=3D10
> 	prompt_ramdisk=3D0
> 	earlyprintk=3DttyS0,115200
> 	console=3DttyS0,115200
> 	console=3Dtty0
> 	vga=3Dnormal
> 	root=3D/dev/ram0
> 	rw
> )
> =

> "${kvm[@]}" --append "${append[*]}"
> -------------------------------------------------------------------------=
----
> =

> Thanks,
> Fengguang
> =



--===============8831488549926302539==--

