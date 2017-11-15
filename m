Content-Type: multipart/mixed; boundary="===============7451846832198933295=="
MIME-Version: 1.0
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: lkp@lists.01.org
Subject: Re: 60a77bfd24 ("membarrier: x86: Provide core serializing command .."): BUG: unable to handle kernel paging request at ffff88001c44c480
Date: Wed, 15 Nov 2017 17:11:43 +0000
Message-ID: <1564106517.15921.1510765903622.JavaMail.zimbra@efficios.com>
In-Reply-To: <5a0c7147.U1DwUEK546IdCA+Y%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7451846832198933295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

----- On Nov 15, 2017, at 11:54 AM, kbuild test robot fengguang.wu(a)intel.=
com wrote:

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit 60a77bfd24d564603f894bd60a92967c8be9d8ad
> Author:     Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> AuthorDate: Mon Oct 23 23:20:43 2017 +0200
> Commit:     Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> CommitDate: Tue Nov 14 20:15:28 2017 -0500
> =

>    membarrier: x86: Provide core serializing command (v2)

This is already fixed by this commit:

commit dc3ec214609b
Fix: membarrier: use-after-free in membarrier_mm_sync_core_before_usermoder=
seq/for-nextrseq/dev

which has been pushed into the rseq/dev branch this morning.

Thanks,

Mathieu


>    =

>    There are two places where core serialization is needed by membarrier:
>    =

>    1) When returning from the membarrier IPI,
>    2) After scheduler updates curr to a thread with a different mm, before
>       going back to user-space, since the curr->mm is used by membarrier =
to
>       check whether it needs to send an IPI to that CPU.
>    =

>    x86-32 uses iret as return from interrupt, and both iret and sysexit t=
o go
>    back to user-space. The iret instruction is core serializing, but not
>    sysexit.
>    =

>    x86-64 uses iret as return from interrupt, which takes care of the IPI.
>    However, it can return to user-space through either sysretl (compat
>    code), sysretq, or iret. Given that sysret{l,q} is not core serializin=
g,
>    we rely instead on write_cr3() performed by switch_mm() to provide core
>    serialization after changing the current mm, and deal with the special
>    case of kthread -> uthread (temporarily keeping current mm into
>    active_mm) by adding a sync_core() in that specific case.
>    =

>    Use the new sync_core_before_usermode() to guarantee this.
>    =

>    Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
>    CC: Peter Zijlstra <peterz@infradead.org>
>    CC: Andy Lutomirski <luto@kernel.org>
>    CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>    CC: Boqun Feng <boqun.feng@gmail.com>
>    CC: Andrew Hunter <ahh@google.com>
>    CC: Maged Michael <maged.michael@gmail.com>
>    CC: Avi Kivity <avi@scylladb.com>
>    CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>    CC: Paul Mackerras <paulus@samba.org>
>    CC: Michael Ellerman <mpe@ellerman.id.au>
>    CC: Dave Watson <davejwatson@fb.com>
>    CC: Thomas Gleixner <tglx@linutronix.de>
>    CC: Ingo Molnar <mingo@redhat.com>
>    CC: "H. Peter Anvin" <hpa@zytor.com>
>    CC: Andrea Parri <parri.andrea@gmail.com>
>    CC: Russell King <linux@armlinux.org.uk>
>    CC: Greg Hackmann <ghackmann@google.com>
>    CC: Will Deacon <will.deacon@arm.com>
>    CC: David Sehr <sehr@google.com>
>    CC: x86(a)kernel.org
>    CC: linux-arch(a)vger.kernel.org
>    =

>    ---
>    Changes since v1:
>    - Use the newly introduced sync_core_before_usermode(). Move all state
>      handling to generic code.
>    - Add linux/processor.h include to include/linux/sched/mm.h.
> =

> 533bd7403b  x86: Introduce sync_core_before_usermode (v2)
> 60a77bfd24  membarrier: x86: Provide core serializing command (v2)
> 63fb091c80  Add linux-next specific files for 20171115
> +------------------------------------------+------------+------------+---=
------------+
>|                                          | 533bd7403b | 60a77bfd24 | nex=
t-20171115 |
> +------------------------------------------+------------+------------+---=
------------+
>| boot_successes                           | 35         | 0          | 38
>| |
>| boot_failures                            | 0          | 11         | 17
>| |
>| BUG:unable_to_handle_kernel              | 0          | 11         | 13
>| |
>| Oops:#[##]                               | 0          | 11         | 17
>| |
>| RIP:finish_task_switch                   | 0          | 11         | 17
>| |
>| Kernel_panic-not_syncing:Fatal_exception | 0          | 11         | 17
>| |
> +------------------------------------------+------------+------------+---=
------------+
> =

> /etc/rcS.d/S00fbsetup: line 3: /sbin/modprobe: not found
> =

> Please wait: booting...
> Starting udev
> Kernel tests: Boot OK!
> [    7.517950] BUG: unable to handle kernel paging request at ffff88001c4=
4c480
> [    7.519225] IP: finish_task_switch+0x136/0x200
> [    7.520017] PGD 1581a067 P4D 1581a067 PUD 1581b067 PMD 1fb1e067 PTE
> 800000001c44c060
> [    7.521361] Oops: 0000 [#1] SMP DEBUG_PAGEALLOC
> [    7.522161] Modules linked in:
> [    7.522706] CPU: 0 PID: 175 Comm: udevd Not tainted 4.14.0-00023-g60a7=
7bf #2
> [    7.523932] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> 1.10.2-1 04/01/2014
> [    7.525375] task: ffff88001d598040 task.stack: ffffc9000025c000
> [    7.526405] RIP: 0010:finish_task_switch+0x136/0x200
> [    7.527278] RSP: 0018:ffffc9000025fe58 EFLAGS: 00010286
> [    7.528411] RAX: 0000000000000000 RBX: ffff88001f817e40 RCX: ffffea000=
0711220
> [    7.529655] RDX: 000000000000001b RSI: ffffffff975b1918 RDI: 000000000=
0000246
> [    7.530901] RBP: ffffc9000025fe80 R08: 0000000000000009 R09: ffff88000=
0000000
> [    7.532140] R10: ffffc9000025fe10 R11: 000000000001bab0 R12: ffff88001=
d582740
> [    7.533359] R13: ffff88001c44c480 R14: ffff88001d598040 R15: 000000000=
0000080
> [    7.534548] FS:  00007f1d0811c700(0000) GS:ffff88001f800000(0000)
> knlGS:0000000000000000
> [    7.535903] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    7.536864] CR2: ffff88001c44c480 CR3: 000000001d13a006 CR4: 000000000=
01606b0
> [    7.538153] Call Trace:
> [    7.538583]  __schedule+0x35f/0x6e0
> [    7.539178]  schedule+0x38/0x90
> [    7.539709]  exit_to_usermode_loop+0x52/0xa0
> [    7.540431]  syscall_return_slowpath+0xa0/0xd0
> [    7.541181]  entry_SYSCALL_64_fastpath+0xa3/0xa5
> [    7.541961] RIP: 0033:0x7f1d07bb0b17
> [    7.542560] RSP: 002b:00007ffe1d2d3248 EFLAGS: 00000297 ORIG_RAX:
> 000000000000003e
> [    7.543817] RAX: 0000000000000000 RBX: 000000000064e020 RCX: 00007f1d0=
7bb0b17
> [    7.545113] RDX: 0000000000000bb8 RSI: 000000000000000f RDI: 000000000=
000012f
> [    7.546312] RBP: 0000000000000005 R08: 0000000000000000 R09: 000000000=
0000000
> [    7.547498] R10: 0000000000000040 R11: 0000000000000297 R12: 000000000=
000086c
> [    7.548887] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
000001a
> [    7.550073] Code: 00 e8 7f 47 08 00 41 80 a6 a4 1a 00 00 fe e9 41 ff f=
f ff 4c
> 89 f6 4c 89 e7 e8 27 fa 07 00 e9 2c ff ff ff 4c 89 ef e8 1a b5 fd ff <41>=
 8b 45
> 00 a8 20 0f 84 5d ff ff ff 8c d0 50 54 48 83 04 24 08
> [    7.553222] RIP: finish_task_switch+0x136/0x200 RSP: ffffc9000025fe58
> [    7.554300] CR2: ffff88001c44c480
> [    7.554870] ---[ end trace 2a0f9aefc66a5580 ]---
> [    7.555648] Kernel panic - not syncing: Fatal exception
> =

>                                                          # HH:MM RESULT G=
OOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 63fb091c80188ec51f53514d07de907c1dd3d61d
> bebc6082da0a9f5d47a1ea2edc099bf671058bd4 --
> git bisect good 8563f47cd795061a1dd8c38bcf5a0a2a4005dbfe  # 18:27  G     =
11
> 0    0   0  Merge remote-tracking branch 'btrfs-kdave/for-next'
> git bisect good b35dab54a17434688ba7a1c43cf116e71e28324e  # 18:42  G     =
10
> 0    0   0  Merge remote-tracking branch 'selinux/next'
> git bisect good b7fc9661e403772b1e6ce24fbf5fdece59719eef  # 19:23  G     =
11
> 0    0   0  Merge remote-tracking branch 'driver-core/driver-core-next'
> git bisect good 58b4bc1473ad38bf23a1549a645a7cf0a54112aa  # 20:19  G     =
11
> 0    0   0  Merge remote-tracking branch 'pinctrl/for-next'
> git bisect good f6e872ffc9ccea7056ef62e3a1759166a5e01487  # 21:03  G     =
11
> 0    0   0  Merge remote-tracking branch 'rtc/rtc-next'
> git bisect  bad 3a4ea8d0cfe837b751b3e06604974cc41d7c1d32  # 21:28  B     =
 0
> 8   22   0  Merge remote-tracking branch 'rseq/rseq/for-next'
> git bisect good c2ade8e2c37a1e001c49ebafa7b8b6b2bc6d6814  # 21:53  G     =
11
> 0    0   0  Merge remote-tracking branch 'nvdimm/libnvdimm-for-next'
> git bisect good dd91ee9e7d4bc98f22ef06478ac7b26d4b37060a  # 22:29  G     =
11
> 0    0   0  Merge remote-tracking branch 'kspp/for-next/kspp'
> git bisect good b38f09891ff7da404a1cc2b37090ee1e0d9ea7b7  # 22:53  G     =
11
> 0    0   0  Restartable sequences: Provide self-tests (v2)
> git bisect good 624fdd456867cb48e0b210c2ad8af574b3580616  # 23:20  G     =
11
> 0    0   0  membarrier: provide SHARED_EXPEDITED command (v2)
> git bisect good 533bd7403b045adb57d98019f7d9f50d4f43e0b0  # 23:39  G     =
11
> 0    0   0  x86: Introduce sync_core_before_usermode (v2)
> git bisect  bad cf81771f4511fbdff96430ad23c3c9d73efe553f  # 00:20  B     =
 1
> 10    0   2  membarrier: selftest: Test private expedited sync core cmd
> git bisect  bad 60a77bfd24d564603f894bd60a92967c8be9d8ad  # 00:42  B     =
 0
> 10   25   1  membarrier: x86: Provide core serializing command (v2)
> # first bad commit: [60a77bfd24d564603f894bd60a92967c8be9d8ad] membarrier=
: x86:
> Provide core serializing command (v2)
> git bisect good 533bd7403b045adb57d98019f7d9f50d4f43e0b0  # 00:48  G     =
31
> 0    0   0  x86: Introduce sync_core_before_usermode (v2)
> # extra tests on HEAD of linux-next/master
> git bisect  bad 63fb091c80188ec51f53514d07de907c1dd3d61d  # 00:49  B     =
 0
> 17   38   0  Add linux-next specific files for 20171115
> # extra tests on tree/branch linux-next/master
> git bisect  bad 63fb091c80188ec51f53514d07de907c1dd3d61d  # 00:51  B     =
 0
> 17   38   0  Add linux-next specific files for 20171115
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion

-- =

Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com

--===============7451846832198933295==--

