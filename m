Content-Type: multipart/mixed; boundary="===============4857542865325179616=="
MIME-Version: 1.0
From: Andrea Arcangeli <aarcange@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm] 0331ab667f: kernel BUG at mm/mmap.c:327!
Date: Tue, 20 Sep 2016 16:04:17 +0200
Message-ID: <20160920140417.GL4716@redhat.com>
In-Reply-To: <57e1195e.LlBmZLYhZsNurqDI%xiaolong.ye@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4857542865325179616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

thanks a lot for reporting this.

I just added this commit:

https://git.kernel.org/cgit/linux/kernel/git/andrea/aa.git/commit/?id=3D13d=
f9fd421966b6fd68b4da2509d6e8e1b9355f1

This should be a false positive and the incremental commit should fix
it. Could you repeat the same test on this commit new (or the whole
aa.git master branch) with CONFIG_DEBUG_MM_RB=3Dy?

Maybe I should fold it to the previous commit that introduced the
false positive from CONFIG_DEBUG_MM_RB?

Thank you!
Andrea

On Tue, Sep 20, 2016 at 07:11:26PM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git master
> commit 0331ab667f082a781b9380cac1461dcca0515bc4 ("mm: vma_merge: fix vm_p=
age_prot SMP race condition against rmap_walk")
> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> =

> Trinity is a linux system call fuzz tester.
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu IvyBridge -m 360M
> =

> caused below changes:
> =

> =

> +------------------------------------------+------------+------------+
> |                                          | 7da550f576 | 0331ab667f |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 18         | 12         |
> | boot_failures                            | 4          | 10         |
> | invoked_oom-killer:gfp_mask=3D0x           | 4          |            |
> | Mem-Info                                 | 4          |            |
> | kernel_BUG_at_mm/mmap.c                  | 0          | 10         |
> | invalid_opcode:#[##]PREEMPT              | 0          | 10         |
> | RIP:validate_mm_rb                       | 0          | 10         |
> | calltrace:SyS_mprotect                   | 0          | 9          |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 10         |
> +------------------------------------------+------------+------------+
> =

> =

> =

> [   40.690337] pgoff 0 file ffff8800111b2000 private_data           (null)
> [   40.690337] flags: 0xfb(read|write|shared|mayread|maywrite|mayexec|may=
share)
> [   40.700682] ------------[ cut here ]------------
> [   40.701451] kernel BUG at mm/mmap.c:327!
> [   40.702391] invalid opcode: 0000 [#1] PREEMPT
> [   40.703087] CPU: 0 PID: 364 Comm: trinity-c1 Not tainted 4.8.0-rc6-003=
14-g0331ab6 #1
> [   40.704315] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [   40.705711] task: ffff8800111d13c0 task.stack: ffff88001124c000
> [   40.706649] RIP: 0010:[<ffffffff811641c4>]  [<ffffffff811641c4>] valid=
ate_mm_rb+0x32/0x4b
> [   40.707956] RSP: 0018:ffff88001124fcf0  EFLAGS: 00010282
> [   40.708795] RAX: 0000000000000145 RBX: ffff8800112e0910 RCX: 000000000=
0000000
> [   40.709919] RDX: ffffffff82445980 RSI: ffffffff8243d1e8 RDI: ffffffff8=
243d1e8
> [   40.710742] RBP: ffff88001124fd08 R08: 0000000000000001 R09: 000000000=
0000000
> [   40.711488] R10: 0000000000000000 R11: 0000000000000005 R12: ffff88001=
12e08f0
> [   40.712232] R13: ffff880011258bb0 R14: ffff88001117eac0 R15: ffff88001=
117eac8
> [   40.712968] FS:  0000000000000000(0000) GS:ffffffff82424000(0063) knlG=
S:0000000008d7c840
> [   40.713808] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [   40.714423] CR2: 0000000008d7c8a8 CR3: 0000000011246000 CR4: 000000000=
01406b0
> [   40.715165] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [   40.715905] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 000000000=
0050602
> [   40.716646] Stack:
> [   40.716867]  ffff880011258bb0 ffff8800112e08f0 ffff880011258bb0 ffff88=
001124fd50
> [   40.717705]  ffffffff811643cd ffff880011b3a8b8 ffff880011258bb0 ffff88=
0011258bb0
> [   40.718598]  ffff8800112e08f0 ffff880011258bb0 ffff88001117eac0 000000=
0000000003
> [   40.719432] Call Trace:
> [   40.719698]  [<ffffffff811643cd>] vma_rb_erase+0x22/0x1cd
> [   40.720270]  [<ffffffff81164ac1>] __vma_adjust+0x3d3/0x697
> [   40.720846]  [<ffffffff810e84d4>] ? mark_held_locks+0x50/0x6e
> [   40.721452]  [<ffffffff811650ff>] vma_merge+0x22c/0x27d
> [   40.721998]  [<ffffffff81167e17>] mprotect_fixup+0x10b/0x23c
> [   40.722606]  [<ffffffff811680bc>] SyS_mprotect+0x174/0x205
> [   40.723183]  [<ffffffff810017e6>] do_fast_syscall_32+0x159/0x2aa
> [   40.723815]  [<ffffffff81db29a0>] entry_SYSENTER_compat+0x50/0x5f
> [   40.724455] Code: 89 f5 41 54 53 e8 5d 86 35 00 eb 29 4c 8d 63 e0 4d 3=
9 ec 74 18 4c 89 e7 e8 4e fa ff ff 48 39 43 18 74 0a 4c 89 e7 e8 02 58 ff f=
f <0f> 0b 48 89 df e8 6e 86 35 00 48 85 c0 48 89 c3 75 cf 5b 41 5c =

> [   40.727469] RIP  [<ffffffff811641c4>] validate_mm_rb+0x32/0x4b
> [   40.728097]  RSP <ffff88001124fcf0>
> [   40.776529] ---[ end trace e91f627109713d4e ]---
> [   40.777062] Kernel panic - not syncing: Fatal exception
> =

> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
>=20

--===============4857542865325179616==--

