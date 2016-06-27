Content-Type: multipart/mixed; boundary="===============1320733710485060760=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
To: lkp@lists.01.org
Subject: kthread_stop insanity (Re: [[DEBUG] force] 2642458962: BUG: unable to handle kernel paging request at ffffc90000997f18)
Date: Sun, 26 Jun 2016 22:22:32 -0700
Message-ID: <CALCETrVZUJdVNdt3W9_o6EO_BjeO1V8JtQ+aig=zkR5xukeZhg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1320733710485060760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

My v4 series was doing pretty well until this explosion:

On Sun, Jun 26, 2016 at 9:41 PM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
>
> FYI, we noticed the following commit:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git x86/vmap_s=
tack
> commit 26424589626d7f82d09d4e7c0569f9487b2e810a ("[DEBUG] force-enable CO=
NFIG_VMAP_STACK")
>

...

> [    4.425052] BUG: unable to handle kernel paging request at ffffc900009=
97f18
> [    4.426645] IP: [<ffffffff81a9ace0>] _raw_spin_lock_irq+0x2c/0x3d
> [    4.427869] PGD 1249e067 PUD 1249f067 PMD 11e4e067 PTE 0
> [    4.429245] Oops: 0002 [#1] SMP
> [    4.430086] Modules linked in:
> [    4.430992] CPU: 0 PID: 1741 Comm: mount Not tainted 4.7.0-rc4-00258-g=
26424589 #1
> [    4.432727] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [    4.434646] task: ffff88000d950c80 ti: ffff88000d950c80 task.ti: ffff8=
8000d950c80

Yeah, this line is meaningless with the thread_info cleanups, and I
have it fixed for v5.

> [    4.436406] RIP: 0010:[<ffffffff81a9ace0>]  [<ffffffff81a9ace0>] _raw_=
spin_lock_irq+0x2c/0x3d
> [    4.438341] RSP: 0018:ffffc90000957c80  EFLAGS: 00010046
> [    4.439438] RAX: 0000000000000000 RBX: 7fffffffffffffff RCX: 000000000=
0000a66
> [    4.440735] RDX: 0000000000000001 RSI: ffff880013619bc0 RDI: ffffc9000=
0997f18
> [    4.442035] RBP: ffffc90000957c88 R08: 0000000000019bc0 R09: ffffffff8=
1200748
> [    4.443323] R10: ffffea0000474900 R11: 000000000001a2a0 R12: ffffc9000=
0997f10
> [    4.444614] R13: 0000000000000002 R14: ffffc90000997f18 R15: 00000000f=
fffffea
> [    4.445896] FS:  00007f9ca6a32700(0000) GS:ffff880013600000(0000) knlG=
S:0000000000000000
> [    4.447690] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    4.448819] CR2: ffffc90000997f18 CR3: 000000000d87c000 CR4: 000000000=
00006f0
> [    4.450102] Stack:
> [    4.450810]  ffffc90000997f18 ffffc90000957d00 ffffffff81a982eb 000000=
0000000246
> [    4.452827]  0000000000000000 ffffc90000957d00 ffffffff8112584b 000000=
0000000000
> [    4.454838]  0000000000000246 ffff88000e27f6bc 0000000000000000 ffff88=
000e27f080
> [    4.456845] Call Trace:
> [    4.457616]  [<ffffffff81a982eb>] wait_for_common+0x44/0x197
> [    4.458719]  [<ffffffff8112584b>] ? try_to_wake_up+0x2dd/0x2ef
> [    4.459877]  [<ffffffff81a9845b>] wait_for_completion+0x1d/0x1f
> [    4.461027]  [<ffffffff8111db10>] kthread_stop+0x82/0x10a
> [    4.462125]  [<ffffffff81117f08>] destroy_workqueue+0x10d/0x1cd
> [    4.463347]  [<ffffffff81445236>] xfs_destroy_mount_workqueues+0x49/0x=
64
> [    4.464620]  [<ffffffff81445c03>] xfs_fs_fill_super+0x2c0/0x49c
> [    4.465807]  [<ffffffff8123547a>] mount_bdev+0x143/0x195
> [    4.466937]  [<ffffffff81445943>] ? xfs_test_remount_options+0x5b/0x5b
> [    4.468727]  [<ffffffff81444568>] xfs_fs_mount+0x15/0x17
> [    4.469838]  [<ffffffff8123614a>] mount_fs+0x15/0x8c
> [    4.470882]  [<ffffffff8124cfc4>] vfs_kern_mount+0x6a/0xfe
> [    4.472005]  [<ffffffff8124fc2f>] do_mount+0x985/0xa9a
> [    4.473078]  [<ffffffff811e0846>] ? strndup_user+0x3a/0x6a
> [    4.474193]  [<ffffffff8124ff6a>] SyS_mount+0x77/0x9f
> [    4.475255]  [<ffffffff81a9b081>] entry_SYSCALL_64_fastpath+0x1f/0xbd
> [    4.476463] Code: 66 66 66 90 55 48 89 e5 50 48 89 7d f8 fa 66 66 90 6=
6 66 90 e8 2d 0a 70 ff 65 ff 05 73 18 57 7e 31 c0 ba 01 00 00 00 48 8b 7d f=
8 <f0> 0f b1 17 85 c0 74 07 89 c6 e8 3e 20 6a ff c9 c3 66 66 66 66
> [    4.484413] RIP  [<ffffffff81a9ace0>] _raw_spin_lock_irq+0x2c/0x3d
> [    4.485639]  RSP <ffffc90000957c80>
> [    4.486509] CR2: ffffc90000997f18
> [    4.487366] ---[ end trace 79763b41869f2580 ]---
> [    4.488367] Kernel panic - not syncing: Fatal exception
>

kthread_stop is *sick*.

    struct kthread self;

...

    current->vfork_done =3D &self.exited;

...

    do_exit(ret);

And then some other thread goes and waits for the completion, which is
*on the stack*, which, in any sane world (e.g. with my series
applied), is long gone by then.

But this is broken even without any changes: since when is gcc
guaranteed to preserve the stack contents when a function ends with a
sibling call, let alone with a __noreturn call?

Is there seriously no way to directly wait for a struct task_struct to
exit?  Could we, say, kmalloc the completion (or maybe even the whole
struct kthread) and (ick!) hang it off ->vfork_done?

Linus, maybe it's time for you to carve another wax figurine.

--Andy

--===============1320733710485060760==--

