Content-Type: multipart/mixed; boundary="===============3229642699394266257=="
MIME-Version: 1.0
From: Yuyang Du <yuyang.du@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched] kernel BUG at kernel/smpboot.c:134!
Date: Thu, 06 Nov 2014 02:07:58 +0800
Message-ID: <20141105180758.GA19218@intel.com>
In-Reply-To: <20141104042922.GM27038@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3229642699394266257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Peter and Thomas,

LKP found a bug, and it was bisected to my rewrite patch:
http://article.gmane.org/gmane.linux.kernel/1818393/

But I really don't have a clue about why the patch can introduce
such a bug, as the patch does not modify anything related. Or maybe
the bug could be indirectly triggerd, just don't know how.

To confirm it is not a false positive, we are rebasing the patch to
3.18-rc3 to try to reproduce it, it is now ongoing.

In addition, I noticed this thread about the same symptom:
http://thread.gmane.org/gmane.linux.kernel/1819348.

Thomas should already have a fix to this. Right?

Thanks,
Yuyang

On Tue, Nov 04, 2014 at 12:29:22PM +0800, kernel test robot wrote:
> git://bee.sh.intel.com/git/ydu19/linux for-lkp
> commit 6fe1f1b9b13f9fd76d1230944482ee5bf2832252 ("sched: Remove task and =
group entity load_avg when they are dead")
> =

> +---------------------------------------------------------------+--------=
----+------------+
> |                                                               | a1ec428=
8c6 | 6fe1f1b9b1 |
> +---------------------------------------------------------------+--------=
----+------------+
> | boot_successes                                                | 10     =
    | 71         |
> | early-boot-hang                                               | 1      =
    |            |
> | boot_failures                                                 | 0      =
    | 9          |
> | kernel_BUG_at_kernel/smpboot.c                                | 0      =
    | 5          |
> | invalid_opcode                                                | 0      =
    | 5          |
> | RIP:smpboot_thread_fn                                         | 0      =
    | 5          |
> | Kernel_panic-not_syncing:Fatal_exception                      | 0      =
    | 5          |
> | Kernel_panic-not_syncing:Watchdog_detected_hard_LOCKUP_on_cpu | 0      =
    | 1          |
> | backtrace:cpu_up                                              | 0      =
    | 1          |
> | backtrace:smp_init                                            | 0      =
    | 1          |
> | backtrace:kernel_init_freeable                                | 0      =
    | 1          |
> | BUG:kernel_test_crashed                                       | 0      =
    | 3          |
> +---------------------------------------------------------------+--------=
----+------------+
> =

> =

> [    3.205664] masked ExtINT on CPU#98
> [    3.205664] CPU98: Thermal LVT vector (0xfa) already installed
> [    3.234545] ------------[ cut here ]------------
> [    3.235000] kernel BUG at kernel/smpboot.c:134!
> [    3.235000] invalid opcode: 0000 [#1] SMP =

> [    3.235000] Modules linked in:
> [    3.235000] CPU: 0 PID: 789 Comm: watchdog/98 Not tainted 3.17.0-rc7-g=
6fe1f1b #7
> [    3.235000] Hardware name: Intel Corporation BRICKLAND/BRICKLAND, BIOS=
 BKLDSDP1.86B.0031.R01.1304221600 04/22/2013
> [    3.235000] task: ffff881853ed8000 ti: ffff881853ee0000 task.ti: ffff8=
81853ee0000
> [    3.235000] RIP: 0010:[<ffffffff810920c0>]  [<ffffffff810920c0>] smpbo=
ot_thread_fn+0x180/0x200
> [    3.235000] RSP: 0000:ffff881853ee3e88  EFLAGS: 00010202
> [    3.235000] RAX: 0000000000000000 RBX: ffff881853ed8000 RCX: 000000000=
0000000
> [    3.235000] RDX: ffff881853ee3fd8 RSI: ffff881853ed8000 RDI: 000000000=
0000062
> [    3.235000] RBP: ffff881853ee3ec8 R08: ffff881853ee0000 R09: 000000000=
0000000
> [    3.235000] R10: 0000000000000001 R11: 0000000000000001 R12: ffff88185=
458e3e0
> [    3.235000] R13: ffffffff81cc6640 R14: ffff881853ed8000 R15: ffff88185=
3ed8000
> [    3.235000] FS:  0000000000000000(0000) GS:ffff88085f800000(0000) knlG=
S:0000000000000000
> [    3.235000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    3.235000] CR2: ffff88207f174000 CR3: 000000207ec38000 CR4: 000000000=
01407f0
> [    3.235000] Stack:
> [    3.235000]  0000000000000000 ffff881853ee3ea0 ffffffff81858ff9 ffff88=
1853cfbe40
> [    3.235000]  ffff88185458e3e0 ffffffff81091f40 0000000000000000 000000=
0000000000
> [    3.235000]  ffff881853ee3f48 ffffffff8108e1ab 0000000000000001 000000=
0000000062
> [    3.235000] Call Trace:
> [    3.235000]  [<ffffffff81858ff9>] ? schedule+0x29/0x70
> [    3.235000]  [<ffffffff81091f40>] ? SyS_setgroups+0x180/0x180
> [    3.235000]  [<ffffffff8108e1ab>] kthread+0xdb/0x100
> [    3.235000]  [<ffffffff8108e0d0>] ? kthread_create_on_node+0x180/0x180
> [    3.235000]  [<ffffffff8185e97c>] ret_from_fork+0x7c/0xb0
> [    3.235000]  [<ffffffff8108e0d0>] ? kthread_create_on_node+0x180/0x180
> [    3.235000] Code: 44 00 00 41 8b 3c 24 65 8b 14 25 2c b0 00 00 39 d7 0=
f 85 84 00 00 00 ff d0 41 c7 44 24 04 02 00 00 00 e9 1d ff ff ff 0f 1f 40 0=
0 <0f> 0b 66 0f 1f 44 00 00 48 c7 45 c8 00 00 00 00 48 8b 45 c8 65 =

> [    3.235000] RIP  [<ffffffff810920c0>] smpboot_thread_fn+0x180/0x200
> [    3.235000]  RSP <ffff881853ee3e88>
> [    3.235033] ---[ end trace c537e15456e615c3 ]---
> [    3.236004] Kernel panic - not syncing: Fatal exception
>=20

--===============3229642699394266257==--

