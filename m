Content-Type: multipart/mixed; boundary="===============1965616550568101284=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: d57108d4f6 ("watchdog/core: Get rid of the thread .."): BUG: unable to handle kernel NULL pointer dereference at 0000000000000208
Date: Fri, 15 Sep 2017 09:50:19 +0200
Message-ID: <alpine.DEB.2.20.1709150947550.1890@nanos>
In-Reply-To: <59baf8db.Rfy+1ZsQ37PfCiRH%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1965616550568101284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 15 Sep 2017, kernel test robot wrote:
> [    0.035023] CPU: Intel Common KVM processor (family: 0xf, model: 0x6, =
stepping: 0x1)
> [    0.042302] Performance Events: unsupported Netburst CPU model 6 no PM=
U driver, software events only.

Cute. So there is no supported PMU, but for some unknown reason the lockup
detector can create an event, otherwise the perf availaibility check in
lockup_detector_init() would fail ....

Peter???

> [    0.051650] BUG: unable to handle kernel NULL pointer dereference at 0=
000000000000208
> [    0.052000] IP: perf_event_release_kernel+0x14/0x1ed
> [    0.052000] PGD 0 P4D 0 =

> [    0.052000] Oops: 0000 [#1]
> [    0.052000] CPU: 0 PID: 1 Comm: swapper Not tainted 4.13.0-11828-gd571=
08d #1
> [    0.052000] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [    0.052000] task: ffff88001e532000 task.stack: ffffc90000008000
> [    0.052000] RIP: 0010:perf_event_release_kernel+0x14/0x1ed
> [    0.052000] RSP: 0000:ffffc9000000be38 EFLAGS: 00010292
> [    0.052000] RAX: 0000000000000001 RBX: 0000000000000000 RCX: 000000000=
313fa45
> [    0.052000] RDX: 0000000000000001 RSI: ffffffff828265e0 RDI: 000000000=
0000000
> [    0.052000] RBP: ffffc9000000beb8 R08: ffffc9000000bdc8 R09: 000000000=
0000000
> [    0.052000] R10: ffff88001e532000 R11: ffffc9000000bd68 R12: 000000000=
0000000
> [    0.052000] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [    0.052000] FS:  0000000000000000(0000) GS:ffffffff8262f000(0000) knlG=
S:0000000000000000
> [    0.052000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.052000] CR2: 0000000000000208 CR3: 0000000002618000 CR4: 000000000=
00006b0
> [    0.052000] Call Trace:
> [    0.052000]  ? trace_hardirqs_on_caller+0x162/0x198
> [    0.052000]  hardlockup_detector_perf_cleanup+0x20/0x2d
> [    0.052000]  __lockup_detector_cleanup+0x2c/0x2e
> [    0.052000]  softlockup_update_smpboot_threads+0x48/0x4a
> [    0.052000]  softlockup_reconfigure_threads+0x21/0x5a
> [    0.052000]  lockup_detector_init+0x75/0x83
> [    0.052000]  kernel_init_freeable+0x67/0xf0
> [    0.052000]  ? rest_init+0x13a/0x13a
> [    0.052000]  kernel_init+0xe/0xf8
> [    0.052000]  ret_from_fork+0x2a/0x40
> [    0.052000] Code: df e8 0c b2 ff ff 4c 89 e7 e8 89 13 bd 00 41 5b 5b 4=
1 5c 41 5d c9 c3 55 48 89 e5 41 57 41 56 41 55 41 54 53 48 89 fb 48 83 ec 5=
8 <48> 83 bf 08 02 00 00 00 75 14 f6 87 8c 00 00 00 03 0f 84 9b 01 =

> [    0.052000] RIP: perf_event_release_kernel+0x14/0x1ed RSP: ffffc900000=
0be38
> [    0.052000] CR2: 0000000000000208
> [    0.052000] ---[ end trace ed0d2c92e47d08db ]---
> [    0.052000] Kernel panic - not syncing: Fatal exception

--===============1965616550568101284==--

