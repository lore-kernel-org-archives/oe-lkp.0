Content-Type: multipart/mixed; boundary="===============1814631686490120009=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [hrtimer_active ^W ata_port_wait_eh] INFO: trying to register non-static key.
Date: Wed, 22 Nov 2017 15:37:45 +0100
Message-ID: <alpine.DEB.2.20.1711221522260.1751@nanos>
In-Reply-To: <20171121130118.2ckjorhwztxa7awu@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1814631686490120009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Nov 2017, Fengguang Wu wrote:

> Hello,
> =

> FYI this happens in mainline kernel 4.14.0-12872-g020aae3.
> It looks like a new regression after 4.14.
> =

> It occurs in 126 out of 945 boots.
> =

> [   33.016892] INFO: trying to register non-static key.
> [   33.017745] the code is fine but needs lockdep annotation.
> [   33.018798] turning off the locking correctness validator.
> [   33.019713] CPU: 0 PID: 72 Comm: kworker/u4:5 Not tainted 4.14.0-12872=
-g020aae3 #1
> [   33.020085] scsi host0: ata_piix
> [   33.020729] Workqueue: events_unbound async_run_entry_fn
> [   33.020729] Call Trace:
> [   33.020729]  dump_stack+0x7b/0xa9:
> 						dump_stack at lib/dump_stack.c:55
> [   33.020729]  register_lock_class+0x3bb/0x583:
> 						register_lock_class at kernel/locking/lockdep.c:782
> [   33.020729]  ? hrtimer_active+0x92/0x99:
> 						hrtimer_active at kernel/time/hrtimer.c:1151
> [   33.020729]  ? hrtimer_try_to_cancel+0x23/0xb6:
> 						hrtimer_try_to_cancel at kernel/time/hrtimer.c:1016

hrtimer_active() does not contain anything which might register a lock
class. And that calltrace continues:

[   33.020729] Call Trace:
[   33.020729]  dump_stack+0x7b/0xa9
[   33.020729]  register_lock_class+0x3bb/0x583
[   33.020729]  ? hrtimer_active+0x92/0x99
[   33.020729]  ? hrtimer_try_to_cancel+0x23/0xb6
[   33.026718] scsi host1: ata_piix
[   33.027134] ata3: PATA max MWDMA2 cmd 0x1f0 ctl 0x3f6 bmdma 0xc040 irq 14
[   33.027138] ata4: PATA max MWDMA2 cmd 0x170 ctl 0x376 bmdma 0xc048 irq 15
[   33.028426] Error: Driver 'pata_platform' is already registered, abortin=
g...
[   33.033725] Rounding down aligned max_sectors from 4294967295 to 4294967=
288
[   33.040417]  __lock_acquire+0x58/0x86c
[   33.048261] SSFDC read-only Flash Translation layer
[   33.048264] mtdoops: mtd device (mtddev=3Dname/number) must be supplied
[   33.048276] device id =3D 2440
[   33.048280] device id =3D 2480
[   33.048283] device id =3D 24c0
[   33.048286] device id =3D 24d0
[   33.048289] device id =3D 25a1
[   33.048292] device id =3D 2670
[   33.048413] platform physmap-flash.0: failed to claim resource 0: [mem 0=
x08000000-0x07ffffff]
[   33.048781] Ramix PMC551 PCI Mezzanine Ram Driver. (C) 1999,2000 Nortel =
Networks.
[   33.048784] pmc551: not detected
[   33.060052]  lock_acquire+0x61/0x7c
[   33.060052]  ? ata_port_wait_eh+0x7b/0xe1
[   33.060052]  _raw_spin_lock_irqsave+0x47/0x81
[   33.060052]  ? ata_port_wait_eh+0x7b/0xe1
[   33.060052]  ata_port_wait_eh+0x7b/0xe1
[   33.060052]  ? print_dl_stats+0x27/0x27
[   33.060052]  ata_port_probe+0x2c/0x4f
[   33.060052]  async_port_probe+0x33/0x59
[   33.060052]  async_run_entry_fn+0x3d/0x127
[   33.060052]  process_one_work+0x244/0x529
[   33.060052]  ? process_one_work+0x216/0x529
[   33.060052]  worker_thread+0x56/0x4d9
[   33.060052]  kthread+0x115/0x152
[   33.060052]  ? process_one_work+0x529/0x529
[   33.060052]  ? __kthread_create_on_node+0x190/0x190
[   33.060052]  ret_from_fork+0x1f/0x30

And looking at the calltrace entries which have no '?' in front you should
look at ata_port_wait_eh() which makes a lot more sense.

Thanks,

	tglx


--===============1814631686490120009==--

