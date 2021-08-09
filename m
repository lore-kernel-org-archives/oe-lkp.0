Content-Type: multipart/mixed; boundary="===============7795031325523542481=="
MIME-Version: 1.0
From: Gavin Shan <gshan@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm/debug_vm_pgtable] 5b79c4a146: initcall_debug_vm_pgtable_returned_with_preemption_imbalance
Date: Mon, 09 Aug 2021 19:49:48 +1000
Message-ID: <90b2c85a-a3df-a00e-3552-25913a695aea@redhat.com>
In-Reply-To: <SJ0PR11MB55989728DA58501502045172FBF19@SJ0PR11MB5598.namprd11.prod.outlook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7795031325523542481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Yujie,

On 8/4/21 3:07 PM, Liu, Yujie wrote:
>> On 7/26/21 5:19 PM, kernel test robot wrote:

[...]

>>>
>>> [   38.527560][    T1] ------------[ cut here ]------------
>>> [   38.528444][    T1] initcall debug_vm_pgtable+0x0/0x3cd returned wit=
h preemption imbalance
>>> [   38.529965][    T1] WARNING: CPU: 0 PID: 1 at init/main.c:1295 do_on=
e_initcall+0x227/0x2c0
>>> [   38.531240][    T1] Modules linked in:
>>> [   38.531871][    T1] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        =
W         5.14.0-rc2-00027-g5b79c4a1469b #1
>> a0a7f3ec31aa9416e222f7109d2330341e30c9
>>> 4a
>>> [   38.533875][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, =
1996), BIOS 1.12.0-1 04/01/2014
>>> [   38.535237][    T1] EIP: do_one_initcall+0x227/0x2c0
>>> [   38.536044][    T1] Code: 64 ff 0d 0c 67 ab c3 0f 85 2d fe ff ff e8 =
69 4a 6a 01 e9 23 fe ff ff 8d 74 26 00 8d 45 b4 50 56 68 5c 2a 06 c3 e8
>> 6d ce 58 0
>>> 1 <0f> 0b 83 c4 0c e9 64 fe ff ff 8d b4 26 00 00 00 00 64 a1 5c 14 ab
>>> [   38.538745][    T1] EAX: 00000047 EBX: 00000000 ECX: 00000000 EDX: 0=
0000001
>>> [   38.539813][    T1] ESI: c39a68f4 EDI: 00000000 EBP: c4d47f74 ESP: c=
4d47f1c
>>> [   38.540841][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFL=
AGS: 00010296
>>> [   38.542035][    T1] CR0: 80050033 CR2: b7dcbbf0 CR3: 03ad9000 CR4: 0=
00406d0
>>> [   38.543178][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 0=
0000000
>>> [   38.544210][    T1] DR6: fffe0ff0 DR7: 00000400
>>> [   38.544931][    T1] Call Trace:
>>> [   38.545505][    T1]  ? pmd_advanced_tests+0x14d/0x14d
>>> [   38.546318][    T1]  ? lock_is_held_type+0xc6/0x120
>>> [   38.547089][    T1]  ? rcu_read_lock_sched_held+0x41/0x80
>>> [   38.547929][    T1]  do_initcalls+0xf9/0x11b
>>> [   38.548631][    T1]  kernel_init_freeable+0xc5/0xf4
>>> [   38.549427][    T1]  ? rest_init+0x260/0x260
>>> [   38.550123][    T1]  kernel_init+0x17/0xf0
>>> [   38.550804][    T1]  ret_from_fork+0x1c/0x30
>>> [   38.551499][    T1] irq event stamp: 16309295
>>> [   38.552220][    T1] hardirqs last  enabled at (16309305): [<c10e8f1e=
>] console_unlock+0x27e/0x3b0
>>> [   38.553556][    T1] hardirqs last disabled at (16309312): [<c10e8fa5=
>] console_unlock+0x305/0x3b0
>>> [   38.554902][    T1] softirqs last  enabled at (16309200): [<c26a5060=
>] __do_softirq+0x2f0/0x4fa
>>> [   38.556235][    T1] softirqs last disabled at (16309091): [<c102a885=
>] call_on_stack+0x45/0x50
>>> [   38.557543][    T1] ---[ end trace 0025ffb206fe1364 ]---
>>>
>>>
>>
>> I'm not sure if this issue is 100% reproducible, but I failed to reprodu=
ce it locally with gcc-8 and gcc-10 with linux-next and the provided
>> kernel configuration. Actually, there is another warning before this one=
, as below. It seems the imbalanced preemption count is caused by
>> mm/debug_vm_pgtable.c::init_args(). However, I would image the imbalance=
d preemption count is actually caused by IRQ handler. The
>> interrupt should be enabled when the init call is executed. If the imbal=
anced preemption count is really caused by interrupt handler, it should
>> happen randomly. Could you help to check if the same warning is reported=
 at various (initcall) spots?
> =

> Sorry for late.
> =

> We use an Ubuntu 20.04 with gcc-10.3.0 and binutils-2.34 toolchain as our=
 environment since we don't have a Fedora env yet.
> =

> As you have kindly pointed out, there is another bug info before the issu=
e in this report.
> =

> A brief dmesg of commit 5b79c4a1469bc is as below:
> =


The issue was reported against on v4 patchset, but the same issue is existi=
ng in
v5 series. I'm going to fix this in v6 series. Fortunately, the report on v=
5 series
provides more useful information so that I can reproduce the issue locally.=
 I realize
the issue is reported from i386 instead of x86_64.

As the root cause, pte_alloc_map() is used in init_args(). However, this ca=
ll
makes the current context atomic, which means the preempt count is increase=
d.
The increased preempt count makes GFP_KERNEL isn't right option for alloc_p=
ages().
Anyway, I have fixed this in v6 series, which was just posted to linux-mm.

[...]

> =

> We can 100% reproduce these two issues on commit 5b79c4a1469bc (mm/debug_=
vm_pgtable: introduce struct pgtable_debug_args) in our environment, while =
its parent a9aac8ea55160 (mm: slub: Fix slub_debug disablement for list of =
slabs) doesn't have any of them.
> =

> We didn't test linux-next since it is changing frequently.
> =

> We strictly follow the reproduce steps in report mail. Here we'll give de=
tailed steps:
> =

> 	cd linux
> 	git checkout 5b79c4a1469bc
> 	cp <config-5.14.0-rc2-00027-g5b79c4a1469b> .config
> 	make HOSTCC=3Dgcc-10 CC=3Dgcc-10 ARCH=3Di386 olddefconfig prepare module=
s_prepare bzImage modules
> 	cp arch/i386/boot/bzImage <run-dir>
> 	make HOSTCC=3Dgcc-10 CC=3Dgcc-10 ARCH=3Di386 INSTALL_MOD_PATH=3D<mod-ins=
tall-dir> modules_install
> 	cd <mod-install-dir>
> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
> 	cp modules.cgz <run-dir>
> =

> 	cd <run-dir>
> 	git clone https://github.com/intel/lkp-tests.git
> 	lkp-tests/bin/lkp qemu -k bzImage -m modules.cgz job-script.ksh # attach=
ed in report email
> =

> =


[...]

Thanks for the details. Yes, it's 100% reproducible on i386 instead of x86_=
64. I failed
to recreate the issue on x86_64, but I'm able to recreate it on i386 :)

Thanks,
Gavin

--===============7795031325523542481==--

