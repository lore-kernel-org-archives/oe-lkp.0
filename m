Content-Type: multipart/mixed; boundary="===============2608930047617329389=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: 047fb56f7e ("blk-mq: fix changelog"): BUG: unable to handle kernel NULL pointer dereference at 00000030
Date: Sat, 05 Jan 2019 18:35:33 +0100
Message-ID: <20190105173533.GA26461@kroah.com>
In-Reply-To: <5c30e6f2.FK3oPXlyr6MtdG/V%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2608930047617329389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 06, 2019 at 01:18:42AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git de=
bugfs_cleanup
> =

> commit 047fb56f7ecf53620d6e93fbcc8ca9166108d14c
> Author:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> AuthorDate: Fri Jan 4 14:06:22 2019 +0100
> Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> CommitDate: Fri Jan 4 17:29:15 2019 +0100
> =

>     blk-mq: fix changelog
> =

> 464573328e  wireless: fix changelog
> 047fb56f7e  blk-mq: fix changelog
> 24aeb03f70  lib: WIP, break up
> +------------------------------------------+------------+------------+---=
---------+
> |                                          | 464573328e | 047fb56f7e | 24=
aeb03f70 |
> +------------------------------------------+------------+------------+---=
---------+
> | boot_successes                           | 33         | 0          | 0 =
         |
> | boot_failures                            | 0          | 13         | 19=
         |
> | BUG:unable_to_handle_kernel              | 0          | 13         | 19=
         |
> | Oops:#[##]                               | 0          | 13         | 19=
         |
> | EIP:debugfs_create_files                 | 0          | 13         | 19=
         |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 13         | 19=
         |
> +------------------------------------------+------------+------------+---=
---------+
> =

> [    1.939685] toshiba: not a supported Toshiba laptop
> [    1.940314] platform pc8736x_gpio.0: NatSemi pc8736x GPIO Driver Initi=
alizing
> [    1.941204] platform pc8736x_gpio.0: no device found
> [    1.941848] nsc_gpio initializing
> [    1.942249] Hangcheck: starting hangcheck timer 0.9.1 (tick is 180 sec=
onds, margin is 60 seconds).
> [    1.943923] BUG: unable to handle kernel NULL pointer dereference at 0=
0000030
> [    1.944889] #PF error: [normal kernel read fault]
> [    1.945527] *pdpt =3D 0000000000000000 *pde =3D f000ff53f000ff53 =

> [    1.946287] Oops: 0000 [#1] SMP PTI
> [    1.946760] CPU: 0 PID: 7 Comm: kworker/u4:0 Not tainted 4.20.0-11088-=
g047fb56 #1
> [    1.947149] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [    1.947149] Workqueue: events_unbound async_run_entry_fn
> [    1.947149] EIP: debugfs_create_files+0x9/0x50
> [    1.947149] Code: 00 e8 db 11 52 00 8b 16 8b 4e 04 8d 83 c0 03 00 00 e=
8 4b 24 da ff 5b 5e 5d c3 8d b4 26 00 00 00 00 55 89 e5 56 53 89 c6 89 cb <=
8b> 40 30 89 90 14 02 00 00 8b 01 85 c0 74 26 90 8d b4 26 00 00 00
> [    1.947149] EAX: 00000000 EBX: 00000000 ECX: 00000000 EDX: da18f800
> [    1.947149] ESI: 00000000 EDI: da18f800 EBP: c005de24 ESP: c005de1c
> [    1.947149] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00210=
246
> [    1.947149] CR0: 80050033 CR2: 00000030 CR3: 01da4000 CR4: 003406f0
> [    1.947149] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
> [    1.947149] DR6: fffe0ff0 DR7: 00000400
> [    1.947149] Call Trace:
> [    1.947149]  blk_mq_debugfs_register_sched_hctx+0x2f/0x40
> [    1.947149]  blk_mq_init_sched+0x156/0x1c0
> [    1.947149]  elevator_init_mq+0x4b/0x80
> [    1.947149]  blk_mq_init_allocated_queue+0x409/0x460
> [    1.947149]  blk_mq_init_queue+0x23/0x60
> [    1.947149]  blk_mq_init_sq_queue+0x77/0x90
> [    1.947149]  floppy_async_init+0xc0/0xd2c
> [    1.947149]  ? __lock_acquire+0x35/0x860
> [    1.947149]  async_run_entry_fn+0x2e/0xf0
> [    1.947149]  process_one_work+0x195/0x3c0
> [    1.947149]  ? process_one_work+0x176/0x3c0
> [    1.947149]  worker_thread+0x39/0x3d0
> [    1.947149]  kthread+0xda/0x110
> [    1.947149]  ? process_one_work+0x3c0/0x3c0
> [    1.947149]  ? kthread_park+0xa0/0xa0
> [    1.947149]  ret_from_fork+0x19/0x30
> [    1.947149] Modules linked in:
> [    1.947149] CR2: 0000000000000030
> [    1.947149] ---[ end trace 34fc82d8056f573a ]---
> [    1.947150] BUG: unable to handle kernel NULL pointer dereference at 0=
0000030

This is my fault, due to some debugfs patches I'm working on, it's not a
block-specific issue at the moment.

sorry for the noise.

greg k-h

--===============2608930047617329389==--

