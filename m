Content-Type: multipart/mixed; boundary="===============8066855719017105268=="
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [locking/ww] 57dd924e54: BUG:soft_lockup-CPU##stuck_for#s
Date: Fri, 14 Apr 2017 09:56:20 +0100
Message-ID: <20170414085619.GZ12532@nuc-i3427.alporthouse.com>
In-Reply-To: <20170414025927.GO16549@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8066855719017105268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 14, 2017 at 10:59:27AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: 57dd924e541a98219bf3a508623db2e0c07e75a7 ("locking/ww-mutex: Limi=
t stress test to 2 seconds")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +--------------------------------------------------+------------+--------=
----+
> |                                                  | 44fe84459f | 57dd924=
e54 |
> +--------------------------------------------------+------------+--------=
----+
> | boot_successes                                   | 0          | 0      =
    |
> | boot_failures                                    | 8          | 8      =
    |
> | INFO:task_blocked_for_more_than#seconds          | 8          |        =
    |
> | calltrace:debug_show_all_locks                   | 8          |        =
    |
> | calltrace:ww_mutex_lock_slow                     | 7          |        =
    |
> | Kernel_panic-not_syncing:hung_task:blocked_tasks | 8          |        =
    |
> | calltrace:stress_inorder_work                    | 1          |        =
    |
> | IP-Config:Auto-configuration_of_network_failed   | 0          | 4      =
    |
> | BUG:soft_lockup-CPU##stuck_for#s                 | 0          | 4      =
    |
> | Kernel_panic-not_syncing:softlockup:hung_tasks   | 0          | 4      =
    |
> +--------------------------------------------------+------------+--------=
----+
> =

> =

> =

> [  273.632796] NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [swa=
pper/0:1]
> [  273.675540] irq event stamp: 4865008
> [  273.685130] hardirqs last  enabled at (4865007): [<ffffffff8e848aad>] =
restore_regs_and_iret+0x0/0x1d
> [  273.698804] hardirqs last disabled at (4865008): [<ffffffff8e848d08>] =
apic_timer_interrupt+0x98/0xb0
> [  273.712354] softirqs last  enabled at (4865006): [<ffffffff8d6c6601>] =
__do_softirq+0x1cf/0x22a
> [  273.725144] softirqs last disabled at (4864999): [<ffffffff8d6c6886>] =
irq_exit+0x56/0xa6
> [  273.737170] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.11.0-rc2-00029=
-g57dd924 #1
> [  273.748511] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [  273.763553] task: ffff89a4bae9c040 task.stack: ffff89a4baea0000
> [  273.772653] RIP: 0010:erase_augmented+0x79/0x23b
> [  273.781081] RSP: 0000:ffff89a4baea3e20 EFLAGS: 00000296 ORIG_RAX: ffff=
ffffffffff10
> [  273.792428] RAX: 00000000ffffffff RBX: ffffffff91ce7a38 RCX: ffff89a4b=
ae9c040
> [  273.802992] RDX: ffffffff91ce7b50 RSI: 0000000000000000 RDI: ffffffff9=
1ce7328
> [  273.813680] RBP: ffff89a4baea3e50 R08: ffffffff91ce7560 R09: 000000000=
0000000
> [  273.824245] R10: 0000000000000000 R11: ffff89a4bae9c768 R12: 000000000=
0000000
> [  273.834880] R13: ffffffff91ce7a38 R14: ffffffff91ce7a39 R15: ffffffff9=
1ce8200
> [  273.845602] FS:  0000000000000000(0000) GS:ffff89a4bbc00000(0000) knlG=
S:0000000000000000
> [  273.857595] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  273.884265] CR2: 00000000ffffffff CR3: 000000000d419000 CR4: 000000000=
00006a0
> [  273.894885] Call Trace:
> [  273.898736]  rbtree_test_init+0x1c3/0x27f
> [  273.904839]  ? irq_poll_setup+0x96/0x96
> [  273.910698]  ? set_debug_rodata+0x20/0x20
> [  273.916791]  do_one_initcall+0xa2/0x17c
> [  273.922687]  ? set_debug_rodata+0x20/0x20
> [  273.928744]  kernel_init_freeable+0x202/0x2a3
> [  273.935363]  ? rest_init+0x16d/0x16d
> [  273.940809]  kernel_init+0xf/0x142
> [  273.946056]  ? rest_init+0x16d/0x16d
> [  273.951528]  ret_from_fork+0x31/0x40
> [  273.956974] Code: 45 10 75 0b e8 e5 db e1 ff 4d 89 65 10 eb 17 e8 da d=
b e1 ff 4d 89 65 08 eb 0c e8 cf db e1 ff 4c 89 25 e7 ca 3b 04 e8 c3 db e1 f=
f <4d> 85 e4 74 0e e8 b9 db e1 ff 4d 89 34 24 e9 4e 01 00 00 e8 ab =


It looks like (summary + trace) that we have moved the timeout from the
ww_mutex stress test to the rbtree tests.
-Chris

-- =

Chris Wilson, Intel Open Source Technology Centre

--===============8066855719017105268==--

