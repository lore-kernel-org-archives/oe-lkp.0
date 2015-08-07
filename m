Content-Type: multipart/mixed; boundary="===============4099570789084812582=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [staging] 68905a14e49: kernel BUG at drivers/base/driver.c:153!
Date: Thu, 06 Aug 2015 19:28:12 -0700
Message-ID: <20150807022812.GI25067@kroah.com>
In-Reply-To: <87vbczy4m2.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4099570789084812582==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On Sat, Aug 01, 2015 at 01:12:05PM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 68905a14e49c97bf49dacd753e40ddd5b254e2ad ("staging: unisys: Add s-=
Par visornic ethernet driver")
> =

> =

> +------------------------------------------------------------------+-----=
-------+------------+
> |                                                                  | dbb9=
d61994 | 68905a14e4 |
> +------------------------------------------------------------------+-----=
-------+------------+
> | boot_successes                                                   | 0   =
       | 0          |
> | boot_failures                                                    | 11  =
       | 11         |
> | invoked_oom-killer:gfp_mask=3D0x                                   | 11=
         |            |
> | Mem-Info                                                         | 11  =
       |            |
> | Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes | 11  =
       |            |
> | backtrace:lock_torture_stats                                     | 11  =
       |            |
> | kernel_BUG_at_drivers/base/driver.c                              | 0   =
       | 11         |
> | invalid_opcode                                                   | 0   =
       | 11         |
> | RIP:driver_register                                              | 0   =
       | 11         |
> | Kernel_panic-not_syncing:Fatal_exception                         | 0   =
       | 11         |
> | backtrace:visornic_init                                          | 0   =
       | 11         |
> | backtrace:kernel_init_freeable                                   | 0   =
       | 11         |
> +------------------------------------------------------------------+-----=
-------+------------+
> =

> =

> [   12.273990] GPIO INIT FAIL!!
> [   12.275607] ------------[ cut here ]------------
> [   12.275607] ------------[ cut here ]------------
> [   12.276231] kernel BUG at drivers/base/driver.c:153!
> [   12.276231] kernel BUG at drivers/base/driver.c:153!
> [   12.276231] invalid opcode: 0000 [#1] =

> [   12.276231] invalid opcode: 0000 [#1] PREEMPT PREEMPT SMP SMP =

> =

> [   12.276231] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.1.0-rc7-01053-=
g68905a1 #1
> [   12.276231] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.1.0-rc7-01053-=
g68905a1 #1
> [   12.276231] task: ffff88000019c000 ti: ffff8800001a0000 task.ti: ffff8=
800001a0000
> [   12.276231] task: ffff88000019c000 ti: ffff8800001a0000 task.ti: ffff8=
800001a0000
> [   12.276231] RIP: 0010:[<ffffffff81b68e78>] =

> [   12.276231] RIP: 0010:[<ffffffff81b68e78>]  [<ffffffff81b68e78>] drive=
r_register+0xa8/0xe0
>  [<ffffffff81b68e78>] driver_register+0xa8/0xe0
> [   12.276231] RSP: 0018:ffff8800001a3e30  EFLAGS: 00010246
> [   12.276231] RSP: 0018:ffff8800001a3e30  EFLAGS: 00010246
> [   12.276231] RAX: 0000000000000000 RBX: ffffffff82faef80 RCX: 000000000=
0000000
> [   12.276231] RAX: 0000000000000000 RBX: ffffffff82faef80 RCX: 000000000=
0000000
> [   12.276231] RDX: 0000000000000000 RSI: ffffffff82fae400 RDI: ffffffff8=
2faefe0
> [   12.276231] RDX: 0000000000000000 RSI: ffffffff82fae400 RDI: ffffffff8=
2faefe0
> [   12.276231] RBP: ffff8800001a3e78 R08: ffff880011279b00 R09: 000000000=
0000000
> [   12.276231] RBP: ffff8800001a3e78 R08: ffff880011279b00 R09: 000000000=
0000000
> [   12.276231] R10: ffff880011279b00 R11: 0000000000000000 R12: ffffffff8=
2faefe0
> [   12.276231] R10: ffff880011279b00 R11: 0000000000000000 R12: ffffffff8=
2faefe0
> [   12.276231] R13: 0000000000000000 R14: ffffffff8205aab0 R15: 000000000=
0000000
> [   12.276231] R13: 0000000000000000 R14: ffffffff8205aab0 R15: 000000000=
0000000
> [   12.276231] FS:  0000000000000000(0000) GS:ffff880013800000(0000) knlG=
S:0000000000000000
> [   12.276231] FS:  0000000000000000(0000) GS:ffff880013800000(0000) knlG=
S:0000000000000000
> [   12.276231] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   12.276231] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   12.276231] CR2: 00007f594be968ec CR3: 0000000002e08000 CR4: 000000000=
00406b0
> [   12.276231] CR2: 00007f594be968ec CR3: 0000000002e08000 CR4: 000000000=
00406b0
> [   12.276231] Stack:
> [   12.276231] Stack:
> [   12.276231]  ffffffff82055977
> [   12.276231]  ffffffff82055977 0000000000000100 0000000000000100 000000=
0000000000 0000000000000000 ffffffff8205aab0 ffffffff8205aab0
> =

> [   12.276231]  0000000000000000
> [   12.276231]  0000000000000000 ffff8800001a3e78 ffff8800001a3e78 ffffff=
ff811d0df6 ffffffff811d0df6 ffffffff830c0910 ffffffff830c0910
> =

> [   12.276231]  ffff880010561d50
> [   12.276231]  ffff880010561d50 ffff8800001a3e88 ffff8800001a3e88 ffffff=
ff8205ac53 ffffffff8205ac53 ffff8800001a3f08 ffff8800001a3f08
> =

> [   12.276231] Call Trace:
> [   12.276231] Call Trace:
> [   12.276231]  [<ffffffff82055977>] ? visorbus_register_visor_driver+0x4=
7/0x100
> [   12.276231]  [<ffffffff82055977>] ? visorbus_register_visor_driver+0x4=
7/0x100
> [   12.276231]  [<ffffffff8205aab0>] ? visornic_change_mtu+0x10/0x10
> [   12.276231]  [<ffffffff8205aab0>] ? visornic_change_mtu+0x10/0x10
> [   12.276231]  [<ffffffff811d0df6>] ? __kmalloc+0x86/0xa0
> [   12.276231]  [<ffffffff811d0df6>] ? __kmalloc+0x86/0xa0
> [   12.276231]  [<ffffffff8205ac53>] visornic_init+0x1a3/0x1f0
> [   12.276231]  [<ffffffff8205ac53>] visornic_init+0x1a3/0x1f0
> [   12.276231]  [<ffffffff830161dc>] do_one_initcall+0x193/0x1a7
> [   12.276231]  [<ffffffff830161dc>] do_one_initcall+0x193/0x1a7
> [   12.276231]  [<ffffffff8301630a>] kernel_init_freeable+0x11a/0x1a7
> [   12.276231]  [<ffffffff8301630a>] kernel_init_freeable+0x11a/0x1a7
> [   12.276231]  [<ffffffff823f88e0>] ? rest_init+0x140/0x140
> [   12.276231]  [<ffffffff823f88e0>] ? rest_init+0x140/0x140
> [   12.276231]  [<ffffffff823f88e9>] kernel_init+0x9/0xf0
> [   12.276231]  [<ffffffff823f88e9>] kernel_init+0x9/0xf0
> [   12.276231]  [<ffffffff8241b3d2>] ret_from_fork+0x42/0x70
> [   12.276231]  [<ffffffff8241b3d2>] ret_from_fork+0x42/0x70
> [   12.276231]  [<ffffffff823f88e0>] ? rest_init+0x140/0x140
> [   12.276231]  [<ffffffff823f88e0>] ? rest_init+0x140/0x140
> [   12.276231] Code: =

> [   12.276231] Code: 85 85 c0 c0 41 41 89 89 c4 c4 75 75 14 14 48 48 8b 8=
b 7b 7b 70 70 31 31 f6 f6 e8 e8 01 01 09 09 c0 c0 ff ff 5b 5b 44 44 89 89 e=
0 e0 41 41 5c 5c 5d 5d c3 c3 90 90 48 48 89 89 df df e8 e8 50 50 e6 e6 ff f=
f ff ff 5b 5b 44 44 89 89 e0 e0 41 41 5c 5c 5d 5d c3 c3 <0f> <0f> 0b 0b 48 =
48 8b 8b 33 33 48 48 c7 c7 c7 c7 20 20 07 07 c7 c7 82 82 31 31 c0 c0 e8 e8 =
97 97 6a 6a 89 89 00 00 48 48 8b 8b =

> =

> [   12.276231] RIP =

> [   12.276231] RIP  [<ffffffff81b68e78>] driver_register+0xa8/0xe0
>  [<ffffffff81b68e78>] driver_register+0xa8/0xe0
> [   12.276231]  RSP <ffff8800001a3e30>
> [   12.276231]  RSP <ffff8800001a3e30>
> [   12.403330] ---[ end trace 075c805d53b02836 ]---
> [   12.403330] ---[ end trace 075c805d53b02836 ]---

David, any ideas of what needs to be done to fix this?

thanks,

greg k-h

--===============4099570789084812582==--

