Content-Type: multipart/mixed; boundary="===============4515608973575868798=="
MIME-Version: 1.0
From: Anand Jain <anand.jain@oracle.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] 0f80799866: WARNING:at_fs/sysfs/file.c:#sysfs_emit
Date: Thu, 21 Oct 2021 23:30:33 +0800
Message-ID: <a3d16075-7f7b-8bb5-0cee-41fa4be5ce0e@oracle.com>
In-Reply-To: <20211021133538.GA16330@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4515608973575868798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 21/10/2021 21:35, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 0f807998661ecadb74638c18cbaff8785bb46f8d ("[PATCH 1/2] btrfs: sys=
fs convert scnprintf and snprintf to use sysfs_emit")
> url: https://github.com/0day-ci/linux/commits/Anand-Jain/provide-fsid-in-=
sysfs-devinfo/20211019-082356
> base: https://git.kernel.org/cgit/linux/kernel/git/kdave/linux.git for-ne=
xt
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

> +----------------------------------------+------------+------------+
> |                                        | 00c9626f46 | 0f80799866 |
> +----------------------------------------+------------+------------+
> | boot_successes                         | 12         | 0          |
> | boot_failures                          | 0          | 12         |
> | WARNING:at_fs/sysfs/file.c:#sysfs_emit | 0          | 12         |
> | EIP:sysfs_emit                         | 0          | 12         |
> +----------------------------------------+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [ 17.140001][ T1] WARNING: CPU: 0 PID: 1 at fs/sysfs/file.c:737 sysfs_emi=
t (fs/sysfs/file.c:737)
> [   17.141231][    T1] Modules linked in:
> [   17.141878][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.15.0-r=
c5-00151-g0f807998661e #2
> [   17.143180][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.12.0-1 04/01/2014
> [ 17.144848][ T1] EIP: sysfs_emit (fs/sysfs/file.c:737)
> [ 17.145557][ T1] Code: e8 76 ec 66 00 83 c4 08 5b 5d c3 ba 01 00 00 00 b=
8 00 fa 50 cc e8 d1 a9 e2 ff 89 5c 24 04 c7 04 24 b1 88 c7 cb e8 da 0d 14 0=
1 <0f> 0b b8 e8 f9 50 cc 31 c9 c7 04 24 01 00 00 00 ba 01 00 00 00 e8
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>     0:	e8 76 ec 66 00       	callq  0x66ec7b
>     5:	83 c4 08             	add    $0x8,%esp
>     8:	5b                   	pop    %rbx
>     9:	5d                   	pop    %rbp
>     a:	c3                   	retq
>     b:	ba 01 00 00 00       	mov    $0x1,%edx
>    10:	b8 00 fa 50 cc       	mov    $0xcc50fa00,%eax
>    15:	e8 d1 a9 e2 ff       	callq  0xffffffffffe2a9eb
>    1a:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
>    1e:	c7 04 24 b1 88 c7 cb 	movl   $0xcbc788b1,(%rsp)
>    25:	e8 da 0d 14 01       	callq  0x1140e04
>    2a:*	0f 0b                	ud2    		<-- trapping instruction
>    2c:	b8 e8 f9 50 cc       	mov    $0xcc50f9e8,%eax
>    31:	31 c9                	xor    %ecx,%ecx
>    33:	c7 04 24 01 00 00 00 	movl   $0x1,(%rsp)
>    3a:	ba 01 00 00 00       	mov    $0x1,%edx
>    3f:	e8                   	.byte 0xe8
> =

> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     0:	0f 0b                	ud2
>     2:	b8 e8 f9 50 cc       	mov    $0xcc50f9e8,%eax
>     7:	31 c9                	xor    %ecx,%ecx
>     9:	c7 04 24 01 00 00 00 	movl   $0x1,(%rsp)
>    10:	ba 01 00 00 00       	mov    $0x1,%edx
>    15:	e8                   	.byte 0xe8
> [   17.148128][    T1] EAX: 00000020 EBX: cce568e0 ECX: 00000000 EDX: 000=
00000
> [   17.149078][    T1] ESI: cce54ae0 EDI: cce568e0 EBP: c181fed4 ESP: c18=
1fec8
> [   17.150009][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAG=
S: 00010296
> [   17.151159][    T1] CR0: 80050033 CR2: 00000000 CR3: 0c709000 CR4: 000=
406d0
> [   17.152227][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 000=
00000
> [   17.153237][    T1] DR6: fffe0ff0 DR7: 00000400
> [   17.153964][    T1] Call Trace:
> [ 17.154511][ T1] btrfs_init_sysfs (fs/btrfs/sysfs.c:1310 fs/btrfs/sysfs.=
c:2023)
> [ 17.155279][ T1] ? tracefs_create_instance_dir (fs/btrfs/super.c:2552)
> [ 17.156161][ T1] init_btrfs_fs (fs/btrfs/super.c:2558)
> [ 17.156848][ T1] do_one_initcall (init/main.c:1303)
> [ 17.157551][ T1] ? parse_args (kernel/params.c:153 kernel/params.c:188)
> [ 17.158265][ T1] ? __this_cpu_preempt_check (lib/smp_processor_id.c:67)
> [ 17.159070][ T1] kernel_init_freeable (init/main.c:1375 init/main.c:1392=
 init/main.c:1411 init/main.c:1614)
> [ 17.163787][ T1] ? rest_init (init/main.c:1497)
> [ 17.171751][ T1] kernel_init (init/main.c:1507)
> [ 17.172549][ T1] ? schedule_tail_wrapper (arch/x86/entry/entry_32.S:740)
> [ 17.173320][ T1] ret_from_fork (arch/x86/entry/entry_32.S:775)
> [   17.174042][    T1] irq event stamp: 2402249
> [ 17.174752][ T1] hardirqs last enabled at (2402257): __up_console_sem (k=
ernel/printk/printk.c:255 (discriminator 1))
> [ 17.176070][ T1] hardirqs last disabled at (2402272): __up_console_sem (=
kernel/printk/printk.c:253 (discriminator 1))
> [ 17.177397][ T1] softirqs last enabled at (2402270): __do_softirq (kerne=
l/softirq.c:402 kernel/softirq.c:587)
> [ 17.178704][ T1] softirqs last disabled at (2402265): do_softirq_own_sta=
ck (arch/x86/kernel/irq_32.c:60 arch/x86/kernel/irq_32.c:149)
> [   17.180238][    T1] ---[ end trace c9e9be0944a14324 ]---
> [   17.181055][    T1] ------------[ cut here ]------------
> [   17.184298][    T1] invalid sysfs_emit: buf:cce568ed
> =

> =

> To reproduce:

  A modload is good enough to reproduce. Unfortunately, I didn't check
  the dmesg for Warnings during the hand testing.

  Fixed in V2.

Thanks, Anand

> =

>          # build kernel
> 	cd linux
> 	cp config-5.15.0-rc5-00151-g0f807998661e .config
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare modules_=
prepare bzImage
> =

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp qemu -k <bzImage> job-script # job-script is attached in=
 this email
> =

>          # if come across any failure that blocks the test,
>          # please remove ~/.lkp and /lkp dir to run from a clean state.
> =

> =

> =

> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpo=
ration
> =

> Thanks,
> Oliver Sang
>=20
--===============4515608973575868798==--

