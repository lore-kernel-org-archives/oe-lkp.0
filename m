Content-Type: multipart/mixed; boundary="===============8379587270728737476=="
MIME-Version: 1.0
From: Jens Axboe <axboe@fb.com>
To: lkp@lists.01.org
Subject: Re: [block] b1fa1b67c1: BUG: KASAN: null-ptr-deref on address 0000000000000080
Date: Fri, 28 Oct 2016 08:28:01 -0600
Message-ID: <f8cf6ae5-31f6-26c7-dfcf-452ac5220e20@fb.com>
In-Reply-To: <20161028021516.GE17497@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8379587270728737476==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/27/2016 08:15 PM, kernel test robot wrote:
>
> FYI, we noticed the following commit:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git wb-=
buf-throttle
> commit b1fa1b67c176e41eeae2bfcc7df38117976cd92d ("block: hook up writebac=
k throttling")
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -m 320M
>
> caused below changes:
>
>
> +------------------------------------------+------------+------------+
> |                                          | 70b2651552 | b1fa1b67c1 |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 6          | 0          |
> | boot_failures                            | 0          | 8          |
> | BUG:KASAN:null-ptr-deref_on_address      | 0          | 8          |
> | calltrace:brd_init                       | 0          | 8          |
> | BUG:unable_to_handle_kernel              | 0          | 8          |
> | Oops                                     | 0          | 8          |
> | RIP:blk_register_queue                   | 0          | 8          |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 8          |
> +------------------------------------------+------------+------------+
>
>
>
> [    5.301507] Failed to find cpu0 device node
> [    5.302217] Unable to detect cache hierarchy from DT for CPU 0
> [    5.307667] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    5.308892] BUG: KASAN: null-ptr-deref on address 0000000000000080
> [    5.309809] Write of size 8 by task swapper/0/1
> [    5.310524] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.9.0-rc2-00008-=
gb1fa1b6 #1
> [    5.311774] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [    5.313209]  ffff88000f177b98 ffffffff8151d919 ffff88000f177c30 ffff88=
000b8332c0
> [    5.314683]  ffff88000a5fb578 ffff88000a5fb558 ffff88000f177c20 ffffff=
ff8121eaa6
> [    5.316133]  ffff88000f177bc8 ffffffff8174da6a ffff88000a5fb578 000000=
0000000297
> [    5.317585] Call Trace:
> [    5.318074]  [<ffffffff8151d919>] dump_stack+0x83/0xba
> [    5.318880]  [<ffffffff8121eaa6>] kasan_report_error+0x3f6/0x4d0
> [    5.319804]  [<ffffffff8174da6a>] ? dev_uevent_filter+0x2a/0x70
> [    5.320690]  [<ffffffff815232ec>] ? kobject_uevent_env+0x1bc/0x570
> [    5.321637]  [<ffffffff8121ec14>] kasan_report+0x34/0x40
> [    5.322453]  [<ffffffff814e603b>] ? blk_register_queue+0x23b/0x250
> [    5.323363]  [<ffffffff8121d541>] __asan_store8+0x61/0x70
> [    5.324212]  [<ffffffff814e603b>] blk_register_queue+0x23b/0x250
> [    5.325124]  [<ffffffff81500f41>] device_add_disk+0x401/0x8c0
> [    5.325999]  [<ffffffff81500b40>] ? bdget_disk+0x60/0x60
> [    5.326843]  [<ffffffff8150173a>] ? alloc_disk_node+0x17a/0x210
> [    5.327750]  [<ffffffff8178d0d6>] ? brd_alloc+0x266/0x2a0
> [    5.328608]  [<ffffffff8289d57e>] brd_init+0x106/0x22e
> [    5.329407]  [<ffffffff8289d478>] ? ramdisk_size+0x27/0x27
> [    5.330233]  [<ffffffff8100228e>] do_one_initcall+0xae/0x230
> [    5.331103]  [<ffffffff810021e0>] ? initcall_blacklisted+0x150/0x150
> [    5.332074]  [<ffffffff810dfc82>] ? parse_args+0x4a2/0x6c0
> [    5.332916]  [<ffffffff82844a44>] ? set_debug_rodata+0x1f/0x1f
> [    5.333826]  [<ffffffff828455c1>] kernel_init_freeable+0x1fa/0x2ae
> [    5.334740]  [<ffffffff81d48660>] ? rest_init+0xa0/0xa0
> [    5.335577]  [<ffffffff81d48673>] kernel_init+0x13/0x180
> [    5.336392]  [<ffffffff81d48660>] ? rest_init+0xa0/0xa0
> [    5.337214]  [<ffffffff81d52af5>] ret_from_fork+0x25/0x30
> [    5.338054] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    5.339219] Disabling lock debugging due to kernel taint
> [    5.340080] BUG: unable to handle kernel NULL pointer dereference at 0=
000000000000080
> [    5.341485] IP: [<ffffffff814e603b>] blk_register_queue+0x23b/0x250
> [    5.342521] PGD 0
> [    5.342810]
> [    5.343250] Oops: 0002 [#1] SMP KASAN
> [    5.343877] Modules linked in:
> [    5.344525] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B           4.=
9.0-rc2-00008-gb1fa1b6 #1
> [    5.345863] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [    5.347247] task: ffff88000f11c000 task.stack: ffff88000f170000
> [    5.348137] RIP: 0010:[<ffffffff814e603b>]  [<ffffffff814e603b>] blk_r=
egister_queue+0x23b/0x250
> [    5.349571] RSP: 0000:ffff88000f177c78  EFLAGS: 00010282
> [    5.350408] RAX: 0000000000000000 RBX: ffff88000a5fb110 RCX: 000000000=
0000000
> [    5.351437] RDX: 0000000000000000 RSI: 0000000000000297 RDI: 000000000=
0000297
> [    5.352447] RBP: ffff88000f177ca8 R08: 1ffffffff04bddfe R09: fffffbfff=
05359b7
> [    5.353493] R10: ffff88000f177ad7 R11: fffffbfff05359b8 R12: ffff88000=
b8332c0
> [    5.354526] R13: ffff88000a5fb578 R14: ffff88000a5fb558 R15: ffff88000=
a5fb1a0
> [    5.355565] FS:  0000000000000000(0000) GS:ffff88000f400000(0000) knlG=
S:0000000000000000
> [    5.356850] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    5.357744] CR2: 0000000000000080 CR3: 0000000002418000 CR4: 000000000=
00006b0
> [    5.358765] Stack:
> [    5.359213]  ffff88000b8332b0 ffff88000b833240 ffff88000b8332c0 000000=
0000000000
> [    5.360959]  ffff88000f177d60 0000000000000000 ffff88000f177dc8 ffffff=
ff81500f41
> [    5.363314]  ffff88000b833240 ffff88000b8335c0 ffff88000b8332c0 ffff88=
000a5fb110
> [    5.365657] Call Trace:
> [    5.366439]  [<ffffffff81500f41>] device_add_disk+0x401/0x8c0
> [    5.367812]  [<ffffffff81500b40>] ? bdget_disk+0x60/0x60
> [    5.369090]  [<ffffffff8150173a>] ? alloc_disk_node+0x17a/0x210
> [    5.370490]  [<ffffffff8178d0d6>] ? brd_alloc+0x266/0x2a0
> [    5.371869]  [<ffffffff8289d57e>] brd_init+0x106/0x22e
> [    5.373157]  [<ffffffff8289d478>] ? ramdisk_size+0x27/0x27
> [    5.374463]  [<ffffffff8100228e>] do_one_initcall+0xae/0x230
> [    5.375778]  [<ffffffff810021e0>] ? initcall_blacklisted+0x150/0x150
> [    5.377213]  [<ffffffff810dfc82>] ? parse_args+0x4a2/0x6c0
> [    5.396284]  [<ffffffff82844a44>] ? set_debug_rodata+0x1f/0x1f
> [    5.397682]  [<ffffffff828455c1>] kernel_init_freeable+0x1fa/0x2ae
> [    5.399213]  [<ffffffff81d48660>] ? rest_init+0xa0/0xa0
> [    5.400511]  [<ffffffff81d48673>] kernel_init+0x13/0x180
> [    5.401773]  [<ffffffff81d48660>] ? rest_init+0xa0/0xa0
> [    5.403032]  [<ffffffff81d52af5>] ret_from_fork+0x25/0x30
> [    5.404309] Code: be 42 03 00 00 48 c7 c7 20 d8 f2 81 41 bf fa ff ff f=
f e8 b9 72 bc ff e9 fe fe ff ff e8 af db c9 ff bf 80 00 00 00 e8 a5 74 d3 f=
f <48> c7 04 25 80 00 00 00 c0 68 78 04 eb 98 0f 1f 80 00 00 00 00
> [    5.415566] RIP  [<ffffffff814e603b>] blk_register_queue+0x23b/0x250
> [    5.417261]  RSP <ffff88000f177c78>
> [    5.418228] CR2: 0000000000000080
> [    5.419143] ---[ end trace dfc7b622ec4895b5 ]---
> [    5.420284] Kernel panic - not syncing: Fatal exception

This was fixed right after the initial push, current branch is fine.

-- =

Jens Axboe


--===============8379587270728737476==--

