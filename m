Content-Type: multipart/mixed; boundary="===============5040080127867022513=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: Re: 7a9dc63e94 ("fs/dcache: disable preemption on i_dir_seq's .."): watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [swapper:1]
Date: Tue, 03 Apr 2018 14:40:16 +0200
Message-ID: <20180403124015.4icvu4ddfwbbsvtf@linutronix.de>
In-Reply-To: <5abd8bb7.cNpFLdEtn0kZNuI+%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5040080127867022513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

How likely is it, that this has nothing todo with the patch I made?

On 2018-03-30 08:58:31 [+0800], kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-linux.git rt=
-4.16-rc7
> =

> commit 7a9dc63e945d04d4d6c81c9f2dbf10fd87a22953
> Author:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> AuthorDate: Fri Oct 20 11:29:53 2017 +0200
> Commit:     Clark Williams <williams@redhat.com>
> CommitDate: Thu Mar 29 09:51:09 2018 -0500
> =

>     fs/dcache: disable preemption on i_dir_seq's write side
>     =

>     i_dir_seq is an opencoded seqcounter. Based on the code it looks like=
 we
>     could have two writers in parallel despite the fact that the d_lock is
>     held. The problem is that during the write process on RT the preempti=
on
>     is still enabled and if this process is interrupted by a reader with =
RT
>     priority then we lock up.
>     To avoid that lock up I am disabling the preemption during the update.
>     The rename of i_dir_seq is here to ensure to catch new write sides in
>     future.
>     =

>     Cc: stable-rt(a)vger.kernel.org
>     Reported-by: Oleg.Karfich(a)wago.com
>     Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> =

> f5f8ed9ae4  fs/dcache: bringt back explicit INIT_HLIST_BL_HEAD init
> 7a9dc63e94  fs/dcache: disable preemption on i_dir_seq's write side
> 8d3edce808  Add localversion for -RT release
> +------------------------------------------------------------------+-----=
-------+------------+------------+
> |                                                                  | f5f8=
ed9ae4 | 7a9dc63e94 | 8d3edce808 |
> +------------------------------------------------------------------+-----=
-------+------------+------------+
> | boot_successes                                                   | 31  =
       | 0          | 0          |
> | boot_failures                                                    | 2   =
       | 15         | 19         |
> | invoked_oom-killer:gfp_mask=3D0x                                   | 1 =
         |            |            |
> | Mem-Info                                                         | 2   =
       |            |            |
> | Out_of_memory:Kill_process                                       | 1   =
       |            |            |
> | Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes | 1   =
       |            |            |
> | BUG:soft_lockup-CPU##stuck_for#s                                 | 0   =
       | 15         | 19         |
> | RIP:__d_lookup_rcu                                               | 0   =
       | 2          | 1          |
> | Kernel_panic-not_syncing:softlockup:hung_tasks                   | 0   =
       | 15         | 19         |
> | RIP:d_alloc_parallel                                             | 0   =
       | 8          | 11         |
> | RIP:lock_release                                                 | 0   =
       | 2          | 2          |
> | RIP:lock_is_held_type                                            | 0   =
       | 1          |            |
> | RIP:__sanitizer_cov_trace_pc                                     | 0   =
       | 2          | 1          |
> | RIP:lock_acquire                                                 | 0   =
       | 0          | 3          |
> | RIP:debug_lockdep_rcu_enabled                                    | 0   =
       | 0          | 1          |
> +------------------------------------------------------------------+-----=
-------+------------+------------+
> =

> [    0.934010] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
> [    0.935079] pci 0000:00:01.0: PIIX3: Enabling Passive Release
> [    0.936138] pci 0000:00:01.0: Activating ISA DMA hang workarounds
> [    0.937361] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0=
x000c0000-0x000dffff]
> [    0.938977] PCI: CLS 0 bytes, default 64
> [   28.030041] watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [swapper=
:1]
> [   28.033225] Modules linked in:
> [   28.033347] irq event stamp: 25232694
> [   28.033347] hardirqs last  enabled at (25232693): [<000000007046e00e>]=
 d_alloc_parallel+0x159/0xbd0
> [   28.033347] hardirqs last disabled at (25232694): [<00000000f019cb31>]=
 interrupt_entry+0xb2/0xc0
> [   28.033347] softirqs last  enabled at (25228688): [<00000000442b20e9>]=
 __do_softirq+0x404/0x4ad
> [   28.033347] softirqs last disabled at (25228673): [<00000000930021e3>]=
 irq_exit+0x64/0xf0
> [   28.033347] CPU: 0 PID: 1 Comm: swapper Not tainted 4.16.0-rc7-00219-g=
7a9dc63 #2
> [   28.033347] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   28.033347] RIP: 0010:d_alloc_parallel+0x15e/0xbd0
> [   28.033347] RSP: 0000:ffffc9000000b8d8 EFLAGS: 00000202 ORIG_RAX: ffff=
ffffffffff12
> [   28.033347] RAX: ffff880000184000 RBX: 0000000000000202 RCX: 000000000=
0000007
> [   28.033347] RDX: 0000000000000007 RSI: ffff880000184758 RDI: 000000000=
0000202
> [   28.033347] RBP: ffffc9000000b998 R08: ffff880000184758 R09: 000000000=
0000000
> [   28.033347] R10: 0000000000000000 R11: 0000000000000000 R12: ffff88000=
002ca28
> [   28.033347] R13: 0000000000000000 R14: ffffffff838b40a8 R15: 00000000b=
9ce049d
> [   28.033347] FS:  0000000000000000(0000) GS:ffffffff82642000(0000) knlG=
S:0000000000000000
> [   28.033347] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   28.033347] CR2: 0000000000000000 CR3: 000000000261c001 CR4: 000000000=
00606b0
> [   28.033347] Call Trace:
> [   28.033347]  ? find_held_lock+0x3c/0xb0
> [   28.033347]  lookup_slow+0x130/0x310
> [   28.033347]  walk_component+0x188/0x450
> [   28.033347]  path_lookupat+0x286/0x370
> [   28.033347]  ? pvclock_clocksource_read+0xa4/0x130
> [   28.033347]  filename_lookup+0x128/0x280
> [   28.033347]  ? ftrace_likely_update+0x52/0x60
> [   28.033347]  ? strncpy_from_user+0x1e6/0x200
> [   28.033347]  ? ftrace_likely_update+0x52/0x60
> [   28.033347]  user_path_at_empty+0x45/0x50
> [   28.033347]  ? user_path_at_empty+0x45/0x50
> [   28.033347]  ? initrd_load+0x53/0x53
> [   28.033347]  vfs_statx+0x92/0x100
> [   28.033347]  ? do_early_param+0x6e/0xc5
> [   28.033347]  ? initrd_load+0x53/0x53
> [   28.033347]  clean_path+0x3f/0x99
> [   28.033347]  ? parse_header+0x50/0xee
> [   28.033347]  ? read_into+0x90/0x99
> [   28.033347]  do_name+0x9c/0x307
> [   28.033347]  write_buffer+0x37/0x4f
> [   28.033347]  unpack_to_rootfs+0x10a/0x35c
> [   28.033347]  ? unpack_to_rootfs+0x35c/0x35c
> [   28.033347]  ? do_early_param+0xc5/0xc5
> [   28.033347]  populate_rootfs+0x22/0xe9
> [   28.033347]  do_one_initcall+0xa1/0x1d0
> [   28.033347]  ? do_early_param+0xc5/0xc5
> [   28.033347]  kernel_init_freeable+0x14a/0x201
> [   28.033347]  ? rest_init+0x150/0x150
> [   28.033347]  kernel_init+0x18/0x160
> [   28.033347]  ? schedule_tail+0xf/0x60
> [   28.033347]  ? rest_init+0x150/0x150
> [   28.033347]  ret_from_fork+0x24/0x30

Sebastian

--===============5040080127867022513==--

