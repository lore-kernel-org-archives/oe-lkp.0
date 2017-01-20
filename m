Content-Type: multipart/mixed; boundary="===============2308715896679944570=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [rcu] bb3ced2503: general_protection_fault:#[##]SMP_KASAN
Date: Fri, 20 Jan 2017 13:57:42 +0100
Message-ID: <20170120125742.mj6ri2zv3lbz7crg@linutronix.de>
In-Reply-To: <20170118012405.GC14484@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2308715896679944570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2017-01-18 09:24:05 [+0800], kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: bb3ced250309ad0033eebb414731b3d0db952c62 ("rcu: update: Make RCU_=
EXPEDITE_BOOT be the default")
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 4G
> =

> caused below changes:
> =

> =

> +-------------------------------------------------+------------+---------=
---+
> |                                                 | 52d7e48b86 | bb3ced25=
03 |
> +-------------------------------------------------+------------+---------=
---+
> | boot_successes                                  | 5          | 2       =
   |
> | boot_failures                                   | 3          | 6       =
   |
> | BUG:kernel_reboot-without-warning_in_test_stage | 2          |         =
   |
> | Mem-Info                                        | 1          |         =
   |
> | invoked_oom-killer:gfp_mask=3D0x                  | 1          |       =
     |
> | general_protection_fault:#[##]SMP_KASAN         | 0          | 6       =
   |
> | Kernel_panic-not_syncing:Fatal_exception        | 0          | 6       =
   |
> +-------------------------------------------------+------------+---------=
---+

so it fails before the patch as well but not that often.

> [   33.847514] [drm] Initialized bochs-drm 1.0.0 20130925 for 0000:00:02.=
0 on minor 0
> [   33.850574] kasan: CONFIG_KASAN_INLINE enabled
> [   33.851616] kasan: GPF could be caused by NULL-ptr deref or user memor=
y access
> [   33.869054] general protection fault: 0000 [#1] SMP KASAN
> [   33.870297] Modules linked in: ppdev bochs_drm(+) ttm drm_kms_helper p=
cspkr drm virtio_pci(+) parport_pc parport qemu_fw_cfg button autofs4 cmdli=
nepart
> [   33.873005] CPU: 1 PID: 227 Comm: systemd-udevd Not tainted 4.10.0-rc3=
-00003-gbb3ced2 #1
> [   33.874884] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [   33.877024] task: ffff8800b2106000 task.stack: ffff8800b04b0000
> [   33.878330] RIP: 0010:__lock_acquire+0x1fb/0x32bd
> [   33.879397] RSP: 0018:ffff8800b04b7240 EFLAGS: 00010006
> [   33.880543] RAX: dffffc0000000000 RBX: 0000000000000740 RCX: 000000000=
0000000
> [   33.881984] RDX: 00000000000000e8 RSI: 0000000000000000 RDI: ffffffff8=
266c340
> [   33.883459] RBP: ffff8800b04b73c0 R08: 0000000000000001 R09: 000000000=
0000000
> [   33.884949] R10: ffff8800b04b73d8 R11: ffff8800b04b7167 R12: ffffffffa=
00f5ff0
> [   33.886425] R13: 0000000000000000 R14: ffff8800b2106000 R15: 000000000=
0000000
> [   33.887862] FS:  00007f69af0588c0(0000) GS:ffff88011ae00000(0000) knlG=
S:0000000000000000
> [   33.889656] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   33.890889] CR2: 000055b580e67c6c CR3: 00000000b7077000 CR4: 000000000=
00006a0
> [   33.892374] Call Trace:
> [   33.893035]  ? debug_check_no_locks_freed+0x320/0x320
> [   33.894176]  ? srcu_reschedule+0x237/0x24d
> [   33.895117]  ? kvm_clock_read+0x25/0x2e

I tried to reproduce it a few times but didn't get that far. That patch
only affects the system during but. My box mounts the rootfs approx 8
seconds after boot. You have 33 so the RCU change should no longer be
active. All I see after that is plenty of
 genirq: Flags mismatch irq 4. 00000000 (serial) vs. 00000080 (goldfish_pde=
v_bus)

Sebastian

--===============2308715896679944570==--

