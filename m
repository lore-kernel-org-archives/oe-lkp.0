Content-Type: multipart/mixed; boundary="===============1499419584103757173=="
MIME-Version: 1.0
From: Petr Mladek <pmladek@suse.com>
To: lkp@lists.01.org
Subject: Re: [printk] 34578dc67f: EIP is at vprintk_emit+0x1ea/0x600
Date: Tue, 23 Feb 2016 17:55:00 +0100
Message-ID: <20160223165500.GX12548@pathway.suse.cz>
In-Reply-To: <87fuwk1c0o.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1499419584103757173==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 2016-02-23 08:55:03, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 34578dc67f38c02ccbe696e4099967884caa8e15 ("printk: set may_schedul=
e for some of console_trylock() callers")
> =

> =

> +------------------------------------------------+------------+----------=
--+
> |                                                | 08e0722e8e | 34578dc67=
f |
> +------------------------------------------------+------------+----------=
--+
> | boot_successes                                 | 0          | 0        =
  |
> | boot_failures                                  | 98         | 100      =
  |
> | BUG:kernel_torture_test_oversize               | 98         | 50       =
  |
> | EIP_is_at_raw_spin_unlock_irqrestore           | 0          | 3        =
  |
> | Kernel_panic-not_syncing:softlockup:hung_tasks | 0          | 50       =
  |
> | backtrace:of_unittest                          | 0          | 50       =
  |
> | backtrace:kernel_init_freeable                 | 0          | 50       =
  |
> | EIP_is_at_vprintk_emit                         | 0          | 28       =
  |
> | EIP_is_at_lock_acquire                         | 0          | 5        =
  |
> | EIP_is_at_of_unittest_overlay                  | 0          | 8        =
  |
> | EIP_is_at_mutex_lock_nested                    | 0          | 1        =
  |
> | EIP_is_at__mutex_unlock_slowpath               | 0          | 2        =
  |
> | EIP_is_at_of_overlay_destroy                   | 0          | 1        =
  |
> | EIP_is_at_idr_find_slowpath                    | 0          | 1        =
  |
> | EIP_is_at___might_sleep                        | 0          | 1        =
  |
> +------------------------------------------------+------------+----------=
--+
> =

> =

> =

> [   33.497678] ### dt-test ### of_unittest_destroy_tracked_overlays: over=
lay destroy failed for #6
> [   33.497693] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [swa=
pper:1]
> [   33.497693] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [swa=
pper:1]
> [   33.497695] Modules linked in:
> [   33.497695] Modules linked in:
> [   33.497696] irq event stamp: 69018756
> [   33.497696] irq event stamp: 69018756
> [   33.497700] hardirqs last  enabled at (69018755): [<c068e185>] vprintk=
_emit+0x1e5/0x600
> [   33.497700] hardirqs last  enabled at (69018755): [<c068e185>] vprintk=
_emit+0x1e5/0x600
> [   33.497704] hardirqs last disabled at (69018756): [<c0a091b8>] apic_ti=
mer_interrupt+0x28/0x40
> [   33.497704] hardirqs last disabled at (69018756): [<c0a091b8>] apic_ti=
mer_interrupt+0x28/0x40
> [   33.497707] softirqs last  enabled at (68988726): [<c064cf32>] __do_so=
ftirq+0x312/0x3f0
> [   33.497707] softirqs last  enabled at (68988726): [<c064cf32>] __do_so=
ftirq+0x312/0x3f0
> [   33.497710] softirqs last disabled at (68988719): [<c0604c7e>] do_soft=
irq_own_stack+0x1e/0x30
> [   33.497710] softirqs last disabled at (68988719): [<c0604c7e>] do_soft=
irq_own_stack+0x1e/0x30
> [   33.497713] CPU: 0 PID: 1 Comm: swapper Not tainted 4.5.0-rc4-00295-g3=
4578dc #1
> [   33.497713] CPU: 0 PID: 1 Comm: swapper Not tainted 4.5.0-rc4-00295-g3=
4578dc #1
> [   33.497714] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [   33.497714] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [   33.497715] task: b0058000 ti: b0060000 task.ti: b0060000
> [   33.497715] task: b0058000 ti: b0060000 task.ti: b0060000
> [   33.497716] EIP: 0060:[<c068e18a>] EFLAGS: 00000246 CPU: 0
> [   33.497716] EIP: 0060:[<c068e18a>] EFLAGS: 00000246 CPU: 0
> [   33.497718] EIP is at vprintk_emit+0x1ea/0x600

This is located rather early in vprintk_emit(). It seems to be long
before the console is called.

Could you please tell us what exact code line corresponds with
vprintk_emit+0x1ea offset?


Best Regards,
Petr

--===============1499419584103757173==--

