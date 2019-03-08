Content-Type: multipart/mixed; boundary="===============2560978281938683612=="
MIME-Version: 1.0
From: Bart Van Assche <bvanassche@acm.org>
To: lkp@lists.01.org
Subject: Re: 669de8bda8 ("kernel/workqueue: Use dynamic lockdep keys for .."): WARNING: CPU: 0 PID: 1 at kernel/locking/lockdep.c:995 lockdep_register_key
Date: Fri, 08 Mar 2019 08:36:44 -0800
Message-ID: <1552063004.45180.19.camel@acm.org>
In-Reply-To: <5c81f407.dqtEdGUmHMiobjjO%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2560978281938683612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-03-08 at 12:48 +0800, kernel test robot wrote:
> [    1.855169] spin_lock-torture: lock_torture_stats task started
> [    2.565387] workingset: timestamp_bits=3D14 max_order=3D17 bucket_orde=
r=3D3
> [    2.567522] NFS: Registering the id_resolver key type
> [    2.568478] Key type id_resolver registered
> [    2.569072] Key type id_legacy registered
> [    2.570808] WARNING: CPU: 0 PID: 1 at kernel/locking/lockdep.c:995 loc=
kdep_register_key+0x37/0x386
> [    2.571658] CPU: 0 PID: 1 Comm: swapper Not tainted 5.0.0-rc8-00054-g6=
69de8b #496
> [    2.571658] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [    2.571658] EIP: lockdep_register_key+0x37/0x386
> [    2.571658] Code: 20 45 65 94 01 83 15 24 45 65 94 00 81 fe 00 00 80 9=
2 72 2e 81 fe 00 d0 88 95 73 26 83 05 40 45 65 94 01 83 15 44 45 65 94 00 <=
0f> 0b 83 05 48 45 65 94 01 83 15 4c 45 65 94 00
> 83 c4 1c 5b 5e 5f
> [    2.571658] EAX: 9586d254 EBX: 9586d1c0 ECX: 944f9cd8 EDX: 00000000
> [    2.571658] ESI: 9586d254 EDI: 9586d274 EBP: 975a9ee4 ESP: 975a9ebc
> [    2.571658] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00210=
246
> [    2.571658] CR0: 80050033 CR2: 00000000 CR3: 1c4a5000 CR4: 00340690
> [    2.571658] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
> [    2.571658] DR6: fffe0ff0 DR7: 00000400
> [    2.571658] Call Trace:
> [    2.571658]  ? debug_mutex_init+0x4b/0x63
> [    2.571658]  ? __mutex_init+0x59/0x6c
> [    2.571658]  alloc_workqueue+0x227/0x84e
> [    2.571658]  ? proc_create+0x3e/0x52
> [    2.571658]  ? trace_event_define_fields_smb3_rw_err_class+0x1b9/0x1b9
> [    2.571658]  init_cifs+0x159/0x72f
> [    2.571658]  do_one_initcall+0x2c4/0x6bf
> [    2.571658]  kernel_init_freeable+0x6ef/0x841
> [    2.571658]  ? rest_init+0x473/0x473
> [    2.571658]  kernel_init+0x1e/0x26b
> [    2.571658]  ? schedule_tail_wrapper+0x9/0xc
> [    2.571658]  ret_from_fork+0x1e/0x28
> [    2.571658] irq event stamp: 410062
> [    2.571658] hardirqs last  enabled at (410061): [<93a2ac73>] _raw_spin=
_unlock_irqrestore+0x133/0x17e
> [    2.571658] hardirqs last disabled at (410062): [<92801bca>] trace_har=
dirqs_off_thunk+0xc/0x10
> [    2.571658] softirqs last  enabled at (409970): [<93a2da14>] __do_soft=
irq+0x904/0xa1d
> [    2.571658] softirqs last disabled at (409965): [<92813eb9>] do_softir=
q_own_stack+0x3d/0x51
> [    2.571658] ---[ end trace c4eabde80fbbdbf0 ]---
> [    3.753943] String selftests succeeded

The following patch should fix this: [PATCH] kernel/wq: Fix a alloc_workque=
ue()
error path. See also =

https://lore.kernel.org/lkml/20190303220046.29448-1-bvanassche(a)acm.org/

Bart.

--===============2560978281938683612==--

