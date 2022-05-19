Content-Type: multipart/mixed; boundary="===============0373753413918515289=="
MIME-Version: 1.0
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
To: lkp@lists.01.org
Subject: Re: [blk] 77c570a1ea: WARNING:at_block/blk-cgroup.c:#blkg_create
Date: Fri, 20 May 2022 00:41:32 +0700
Message-ID: <cb7d3a8a-c393-a691-4d20-2cfcbb075201@gnuweeb.org>
In-Reply-To: <20220519070506.GA34017@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0373753413918515289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Adding the committer, reviewer and acker to the CC list. See the full messa=
ge here:
https://lore.kernel.org/all/20220519070506.GA34017(a)xsang-OptiPlex-9020/

On 5/19/22 2:05 PM, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 77c570a1ea85ba4ab135c61a028420a6e9fe77f3 ("blk-cgroup: Remove unn=
ecessary rcu_read_lock/unlock()")
> https://github.com/ammarfaizi2/linux-block axboe/linux-block/for-next
> =

> in testcase: boot
> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> =

> [   14.834675][    T1] ------------[ cut here ]------------
> [   14.835078][    T1] WARNING: CPU: 0 PID: 1 at block/blk-cgroup.c:301 b=
lkg_create+0x39/0x513

This hits the `WARN_ON_ONCE(!rcu_read_lock_held());` in the blkg_create(), =
here:

   https://github.com/ammarfaizi2/linux-block/blob/77c570a1ea85ba4ab135c61a=
028420a6e9fe77f3/block/blk-cgroup.c#L301


> [   14.835690][    T1] Modules linked in:
> [   14.835984][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.18.0-r=
c3-00076-g77c570a1ea85 #1
> [   14.836486][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
> [   14.836486][    T1] EIP: blkg_create+0x39/0x513
> [   14.836486][    T1] Code: 89 cb 83 ec 0c 83 05 a0 82 8f d9 01 83 15 a4=
 82 8f d9 00 e8 a5 be 4c ff 85 c0 75 1e 83 05 a8 82 8f d9 01 83 15 ac 82 8f=
 d9 00 <
> 0f> 0b 83 05 b0 82 8f d9 01 83 15 b4 82 8f d9 00 83 3d 58 9d a6 d8
> [   14.836486][    T1] EAX: 00000000 EBX: f5c26c00 ECX: 00000000 EDX: 000=
00000
> [   14.836486][    T1] ESI: f5e4c000 EDI: d98f7280 EBP: c12f5e88 ESP: c12=
f5e70
> [   14.836486][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAG=
S: 00010046
> [   14.836486][    T1] CR0: 80050033 CR2: ffd3a000 CR3: 18d38000 CR4: 000=
406d0
> [   14.836486][    T1] Call Trace:
> [   14.836486][    T1]  ? _raw_spin_lock_irq+0xba/0xe4
> [   14.836486][    T1]  blkcg_init_queue+0xaf/0x20f
> [   14.836486][    T1]  __alloc_disk_node+0x20c/0x3cc
> [   14.836486][    T1]  __blk_alloc_disk+0x55/0x97
> [   14.836486][    T1]  brd_alloc+0x1d9/0x393
> [   14.836486][    T1]  ? debugfs_create_dir+0x20/0x17a
> [   14.836486][    T1]  brd_init+0x12e/0x1f3
> [   14.836486][    T1]  ? ramdisk_size+0x3d/0x3d
> [   14.836486][    T1]  do_one_initcall+0x6f/0x21e
> [   14.836486][    T1]  ? lock_is_held+0x19/0x2b
> [   14.836486][    T1]  ? rcu_read_lock_sched_held+0x4f/0xb7
> [   14.836486][    T1]  do_initcalls+0x17f/0x1ec
> [   14.836486][    T1]  kernel_init_freeable+0x30c/0x3af
> [   14.836486][    T1]  ? rest_init+0x2f7/0x2f7
> [   14.836486][    T1]  kernel_init+0x33/0x2ad
> [   14.836486][    T1]  ret_from_fork+0x19/0x24
> [   14.836486][    T1] irq event stamp: 212188
> [   14.836486][    T1] hardirqs last  enabled at (212187): [<d5163803>] _=
_raw_spin_unlock_irqrestore+0x6e/0xf1
> [   14.836486][    T1] hardirqs last disabled at (212188): [<d70e7620>] _=
raw_spin_lock_irq+0x5f/0xe4
> [   14.836486][    T1] softirqs last  enabled at (210872): [<d70e9dcb>] _=
_do_softirq+0x463/0x4ed
> [   14.836486][    T1] softirqs last disabled at (210863): [<d50405e3>] c=
all_on_stack+0x20/0x3a
> [   14.836486][    T1] ---[ end trace 0000000000000000 ]---

-- =

Ammar Faizi
--===============0373753413918515289==--

