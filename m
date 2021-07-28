Content-Type: multipart/mixed; boundary="===============8048205906881978978=="
MIME-Version: 1.0
From: Gavin Shan <gshan@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm/debug_vm_pgtable] 5b79c4a146: initcall_debug_vm_pgtable_returned_with_preemption_imbalance
Date: Wed, 28 Jul 2021 15:56:34 +1000
Message-ID: <da5ef11f-c757-2551-3c0f-4e387e692d74@redhat.com>
In-Reply-To: <20210726071911.GA30205@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8048205906881978978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Oliver,

On 7/26/21 5:19 PM, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-10):
> =

> commit: 5b79c4a1469bcc5793a361ef57d5d2e2393cabcc ("mm/debug_vm_pgtable: i=
ntroduce struct pgtable_debug_args")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> =

> in testcase: locktorture
> version:
> with following parameters:
> =

> 	runtime: 300s
> 	test: cpuhotplug
> =

> test-description: This torture test consists of creating a number of kern=
el threads which acquire the lock and hold it for specific amount of time, =
thus simulating different critical region behaviors.
> test-url: https://www.kernel.org/doc/Documentation/locking/locktorture.txt
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +--------------------------------------------------------------+---------=
---+------------+
> |                                                              | a9aac8ea=
55 | 5b79c4a146 |
> +--------------------------------------------------------------+---------=
---+------------+
> | initcall_debug_vm_pgtable_returned_with_preemption_imbalance | 0       =
   | 6          |
> | WARNING:at_init/main.c:#do_one_initcall                      | 0       =
   | 6          |
> | EIP:do_one_initcall                                          | 0       =
   | 6          |
> | Kernel_panic-not_syncing:No_working_init_found               | 0       =
   | 6          |
> +--------------------------------------------------------------+---------=
---+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [   38.527560][    T1] ------------[ cut here ]------------
> [   38.528444][    T1] initcall debug_vm_pgtable+0x0/0x3cd returned with =
preemption imbalance
> [   38.529965][    T1] WARNING: CPU: 0 PID: 1 at init/main.c:1295 do_one_=
initcall+0x227/0x2c0
> [   38.531240][    T1] Modules linked in:
> [   38.531871][    T1] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W =
        5.14.0-rc2-00027-g5b79c4a1469b #1 a0a7f3ec31aa9416e222f7109d2330341=
e30c9
> 4a
> [   38.533875][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.12.0-1 04/01/2014
> [   38.535237][    T1] EIP: do_one_initcall+0x227/0x2c0
> [   38.536044][    T1] Code: 64 ff 0d 0c 67 ab c3 0f 85 2d fe ff ff e8 69=
 4a 6a 01 e9 23 fe ff ff 8d 74 26 00 8d 45 b4 50 56 68 5c 2a 06 c3 e8 6d ce=
 58 0
> 1 <0f> 0b 83 c4 0c e9 64 fe ff ff 8d b4 26 00 00 00 00 64 a1 5c 14 ab
> [   38.538745][    T1] EAX: 00000047 EBX: 00000000 ECX: 00000000 EDX: 000=
00001
> [   38.539813][    T1] ESI: c39a68f4 EDI: 00000000 EBP: c4d47f74 ESP: c4d=
47f1c
> [   38.540841][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAG=
S: 00010296
> [   38.542035][    T1] CR0: 80050033 CR2: b7dcbbf0 CR3: 03ad9000 CR4: 000=
406d0
> [   38.543178][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 000=
00000
> [   38.544210][    T1] DR6: fffe0ff0 DR7: 00000400
> [   38.544931][    T1] Call Trace:
> [   38.545505][    T1]  ? pmd_advanced_tests+0x14d/0x14d
> [   38.546318][    T1]  ? lock_is_held_type+0xc6/0x120
> [   38.547089][    T1]  ? rcu_read_lock_sched_held+0x41/0x80
> [   38.547929][    T1]  do_initcalls+0xf9/0x11b
> [   38.548631][    T1]  kernel_init_freeable+0xc5/0xf4
> [   38.549427][    T1]  ? rest_init+0x260/0x260
> [   38.550123][    T1]  kernel_init+0x17/0xf0
> [   38.550804][    T1]  ret_from_fork+0x1c/0x30
> [   38.551499][    T1] irq event stamp: 16309295
> [   38.552220][    T1] hardirqs last  enabled at (16309305): [<c10e8f1e>]=
 console_unlock+0x27e/0x3b0
> [   38.553556][    T1] hardirqs last disabled at (16309312): [<c10e8fa5>]=
 console_unlock+0x305/0x3b0
> [   38.554902][    T1] softirqs last  enabled at (16309200): [<c26a5060>]=
 __do_softirq+0x2f0/0x4fa
> [   38.556235][    T1] softirqs last disabled at (16309091): [<c102a885>]=
 call_on_stack+0x45/0x50
> [   38.557543][    T1] ---[ end trace 0025ffb206fe1364 ]---
> =

> =


I'm not sure if this issue is 100% reproducible, but I failed to reproduce =
it locally
with gcc-8 and gcc-10 with linux-next and the provided kernel configuration=
. Actually,
there is another warning before this one, as below. It seems the imbalanced=
 preemption
count is caused by mm/debug_vm_pgtable.c::init_args(). However, I would ima=
ge the
imbalanced preemption count is actually caused by IRQ handler. The interrup=
t should
be enabled when the init call is executed. If the imbalanced preemption cou=
nt is
really caused by interrupt handler, it should happen randomly. Could you he=
lp to
check if the same warning is reported at various (initcall) spots?

[   38.485968][    T1] .................................... done.
[   38.493971][    T1] sched_clock: Marking stable (38371289248, 120817128)=
->(38516398292, -24291916)
[   38.497414][    T1] Loading compiled-in X.509 certificates
[   38.498374][    T1] debug_vm_pgtable: [debug_vm_pgtable         ]: Valid=
ating architecture page table helpers
[   38.499940][    T1] BUG: sleeping function called from invalid context a=
t mm/page_alloc.c:5170
[   38.501254][    T1] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pi=
d: 1, name: swapper/0
[   38.502577][    T1] no locks held by swapper/0/1.
[   38.503322][    T1] Preemption disabled at:
[   38.503326][    T1] [<c259c408>] kmap_atomic+0x1d/0x36
[   38.504814][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-rc2=
-00027-g5b79c4a1469b #1 a0a7f3ec31aa9416e222f7109d2330341e30c94a
[   38.506561][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996=
), BIOS 1.12.0-1 04/01/2014
[   38.507922][    T1] Call Trace:
[   38.508478][    T1]  ? show_stack+0x3c/0x44
[   38.509160][    T1]  dump_stack_lvl+0x44/0x57
[   38.509880][    T1]  dump_stack+0xd/0x10
[   38.510555][    T1]  ___might_sleep.cold+0xec/0xfd
[   38.511307][    T1]  ? kmap_atomic+0x1d/0x36
[   38.512001][    T1]  __might_sleep+0x32/0x80
[   38.512703][    T1]  __alloc_pages+0x199/0x2d0
[   38.513414][    T1]  ? pmd_advanced_tests+0x14d/0x14d
[   38.514209][    T1]  init_args+0x1c2/0x214
[   38.514884][    T1]  debug_vm_pgtable+0x25/0x3cd
[   38.515614][    T1]  ? __debugfs_create_file+0x102/0x180
[   38.516423][    T1]  ? __debugfs_create_file+0x102/0x180
[   38.517222][    T1]  ? __this_cpu_preempt_check+0xf/0x11
[   38.518030][    T1]  ? lock_release+0x71/0x150
[   38.518756][    T1]  ? pmd_advanced_tests+0x14d/0x14d
[   38.519550][    T1]  do_one_initcall+0x4f/0x2c0
[   38.520266][    T1]  ? __this_cpu_preempt_check+0xf/0x11
[   38.521058][    T1]  ? lock_is_held_type+0xc6/0x120
[   38.521818][    T1]  ? rcu_read_lock_sched_held+0x41/0x80
[   38.522639][    T1]  do_initcalls+0xf9/0x11b
[   38.523319][    T1]  kernel_init_freeable+0xc5/0xf4
[   38.524071][    T1]  ? rest_init+0x260/0x260
[   38.524753][    T1]  kernel_init+0x17/0xf0
[   38.525424][    T1]  ret_from_fork+0x1c/0x30
[   38.527560][    T1] ------------[ cut here ]------------

> =

> To reproduce:
> =

>          # build kernel
> 	cd linux
> 	cp config-5.14.0-rc2-00027-g5b79c4a1469b .config
> 	make HOSTCC=3Dgcc-10 CC=3Dgcc-10 ARCH=3Di386 olddefconfig prepare module=
s_prepare bzImage modules
> 	make HOSTCC=3Dgcc-10 CC=3Dgcc-10 ARCH=3Di386 INSTALL_MOD_PATH=3D<mod-ins=
tall-dir> modules_install
> 	cd <mod-install-dir>
> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
> =

> =

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script=
 is attached in this email
> =

> =

> =


[...]

Thanks,
Gavin

--===============8048205906881978978==--

