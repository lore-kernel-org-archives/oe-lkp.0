Content-Type: multipart/mixed; boundary="===============3907136218571935245=="
MIME-Version: 1.0
From: Vincent Guittot <vincent.guittot@linaro.org>
To: lkp@lists.01.org
Subject: Re: [sched/fair] d4d61cceee: WARNING:at_kernel/sched/core.c:#nohz_csd_func
Date: Mon, 15 Feb 2021 15:48:59 +0100
Message-ID: <CAKfTPtBSjR8=Sh=X+q7Y-zjWE-_jszZD4_N=sEvkOT3X_j7QFg@mail.gmail.com>
In-Reply-To: <20210214135415.GC6321@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3907136218571935245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 14 Feb 2021 at 14:38, kernel test robot <oliver.sang@intel.com> w=
rote:
>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: d4d61cceee9565aa51b61a196275aeecafe79510 ("sched/fair: trigger th=
e update of blocked load on newly idle cpu")
> https://git.linaro.org/people/vincent.guittot/kernel.git test/scheduler
>
>
> in testcase: rcutorture
> version:
> with following parameters:
>
>         runtime: 300s
>         test: cpuhotplug
>         torture_type: srcu
>
> test-description: rcutorture is rcutorture kernel module load/unload test.
> test-url: https://www.kernel.org/doc/Documentation/RCU/torture.txt
>
>
> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
8G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +-----------------------------------------------+------------+-----------=
-+
> |                                               | 978ec7b372 | d4d61cceee=
 |
> +-----------------------------------------------+------------+-----------=
-+
> | WARNING:at_kernel/sched/core.c:#nohz_csd_func | 0          | 20        =
 |
> | EIP:nohz_csd_func                             | 0          | 20        =
 |
> | EIP:default_idle                              | 0          | 12        =
 |
> | EIP:_find_next_bit                            | 0          | 3         =
 |
> | EIP:cpumask_next_wrap                         | 0          | 2         =
 |
> | EIP:tick_nohz_idle_enter                      | 0          | 11        =
 |
> | EIP:_nohz_idle_balance                        | 0          | 3         =
 |
> | EIP:do_idle                                   | 0          | 1         =
 |
> +-----------------------------------------------+------------+-----------=
-+
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> [    7.659873] WARNING: CPU: 0 PID: 0 at kernel/sched/core.c:743 nohz_csd=
_func (kbuild/src/consumer/kernel/sched/core.c:743 (discriminator 1))

I forgot to remove the warn because now idle path and sched_softirq
can concurrently clear the atomic variable and run the ILB

> [    7.660130] Modules linked in:
> [    7.660130] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.11.0-rc2-00035=
-gd4d61cceee95 #1
> [    7.660130] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [    7.660130] EIP: nohz_csd_func (kbuild/src/consumer/kernel/sched/core.=
c:743 (discriminator 1))
> [ 7.660130] Code: a1 14 88 cf c4 8b 00 a8 08 75 d0 89 f0 88 81 f0 05 00 0=
0 b8 07 00 00 00 e8 fd a7 fd ff 83 c4 04 5b 5e 5f 5d c3 8d 74 26 00 90 <0f>=
 0b eb 8f 8d b4 26 00 00 00 00 8d 74 26 00 90 66 66 66 66 90 55
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   a1 14 88 cf c4 8b 00    movabs 0x8a8008bc4cf8814,%eax
>    7:   a8 08
>    9:   75 d0                   jne    0xffffffffffffffdb
>    b:   89 f0                   mov    %esi,%eax
>    d:   88 81 f0 05 00 00       mov    %al,0x5f0(%rcx)
>   13:   b8 07 00 00 00          mov    $0x7,%eax
>   18:   e8 fd a7 fd ff          callq  0xfffffffffffda81a
>   1d:   83 c4 04                add    $0x4,%esp
>   20:   5b                      pop    %rbx
>   21:   5e                      pop    %rsi
>   22:   5f                      pop    %rdi
>   23:   5d                      pop    %rbp
>   24:   c3                      retq
>   25:   8d 74 26 00             lea    0x0(%rsi,%riz,1),%esi
>   29:   90                      nop
>   2a:*  0f 0b                   ud2             <-- trapping instruction
>   2c:   eb 8f                   jmp    0xffffffffffffffbd
>   2e:   8d b4 26 00 00 00 00    lea    0x0(%rsi,%riz,1),%esi
>   35:   8d 74 26 00             lea    0x0(%rsi,%riz,1),%esi
>   39:   90                      nop
>   3a:   66 66 66 66 90          data16 data16 data16 xchg %ax,%ax
>   3f:   55                      push   %rbp
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   0f 0b                   ud2
>    2:   eb 8f                   jmp    0xffffffffffffff93
>    4:   8d b4 26 00 00 00 00    lea    0x0(%rsi,%riz,1),%esi
>    b:   8d 74 26 00             lea    0x0(%rsi,%riz,1),%esi
>    f:   90                      nop
>   10:   66 66 66 66 90          data16 data16 data16 xchg %ax,%ax
>   15:   55                      push   %rbp
> [    7.660130] EAX: 00000000 EBX: c4d05480 ECX: d5e43480 EDX: d5e434c4
> [    7.660130] ESI: 00000000 EDI: 00000000 EBP: c4507e84 ESP: c4507e74
> [    7.660130] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00210=
046
> [    7.660130] CR0: 80050033 CR2: 00000000 CR3: 04d20000 CR4: 00040690
> [    7.660130] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
> [    7.660130] DR6: fffe0ff0 DR7: 00000400
> [    7.660130] Call Trace:
> [    7.660130] flush_smp_call_function_queue (kbuild/src/consumer/kernel/=
smp.c:409 (discriminator 4))
> [    7.660130] ? sysvec_call_function (kbuild/src/consumer/arch/x86/kerne=
l/smp.c:243)
> [    7.660130] generic_smp_call_function_single_interrupt (kbuild/src/con=
sumer/kernel/smp.c:317)
> [    7.660130] __sysvec_call_function_single+0x44/0x1f0
> [    7.660130] sysvec_call_function_single (kbuild/src/consumer/arch/x86/=
kernel/smp.c:243)
> [    7.660130] handle_exception (kbuild/src/consumer/arch/x86/entry/entry=
_32.S:1172)
> [    7.660130] EIP: tick_nohz_idle_enter (kbuild/src/consumer/kernel/time=
/tick-sched.c:1077 (discriminator 3))
> [ 7.660130] Code: 00 00 00 0b 83 84 00 00 00 75 42 80 4b 30 01 e8 b9 04 f=
f ff 80 4b 30 04 89 43 50 89 53 54 e8 6a 55 f8 ff e8 15 62 07 00 fb 5b <5d>=
 c3 90 64 a1 5c 8b cf c4 85 c0 75 b2 0f 0b eb ae 66 90 e8 eb 65
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   00 00                   add    %al,(%rax)
>    2:   00 0b                   add    %cl,(%rbx)
>    4:   83 84 00 00 00 75 42    addl   $0xffffff80,0x42750000(%rax,%rax,1)
>    b:   80
>    c:   4b 30 01                rex.WXB xor %al,(%r9)
>    f:   e8 b9 04 ff ff          callq  0xffffffffffff04cd
>   14:   80 4b 30 04             orb    $0x4,0x30(%rbx)
>   18:   89 43 50                mov    %eax,0x50(%rbx)
>   1b:   89 53 54                mov    %edx,0x54(%rbx)
>   1e:   e8 6a 55 f8 ff          callq  0xfffffffffff8558d
>   23:   e8 15 62 07 00          callq  0x7623d
>   28:   fb                      sti
>   29:   5b                      pop    %rbx
>   2a:*  5d                      pop    %rbp             <-- trapping inst=
ruction
>   2b:   c3                      retq
>   2c:   90                      nop
>   2d:   64 a1 5c 8b cf c4 85    movabs %fs:0xb275c085c4cf8b5c,%eax
>   34:   c0 75 b2
>   37:   0f 0b                   ud2
>   39:   eb ae                   jmp    0xffffffffffffffe9
>   3b:   66 90                   xchg   %ax,%ax
>   3d:   e8                      .byte 0xe8
>   3e:   eb 65                   jmp    0xa5
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   5d                      pop    %rbp
>    1:   c3                      retq
>    2:   90                      nop
>    3:   64 a1 5c 8b cf c4 85    movabs %fs:0xb275c085c4cf8b5c,%eax
>    a:   c0 75 b2
>    d:   0f 0b                   ud2
>    f:   eb ae                   jmp    0xffffffffffffffbf
>   11:   66 90                   xchg   %ax,%ax
>   13:   e8                      .byte 0xe8
>   14:   eb 65                   jmp    0x7b
> [    7.660130] EAX: 00005603 EBX: 00000000 ECX: 00000000 EDX: 00000000
> [    7.660130] ESI: c4543ec0 EDI: c4c077e6 EBP: c4507f20 ESP: c4507f20
> [    7.660130] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00200=
246
> [    7.660130] ? perf_trace_sched_move_numa (kbuild/src/consumer/include/=
trace/events/sched.h:578 (discriminator 11))
> [    7.660130] ? sysvec_call_function (kbuild/src/consumer/arch/x86/kerne=
l/smp.c:243)
> [    7.660130] ? tick_nohz_idle_enter (kbuild/src/consumer/kernel/time/ti=
ck-sched.c:1077 (discriminator 3))
> [    7.660130] do_idle (kbuild/src/consumer/arch/x86/include/asm/bitops.h=
:207 kbuild/src/consumer/include/asm-generic/bitops/instrumented-non-atomic=
.h:135 kbuild/src/consumer/include/linux/thread_info.h:102 kbuild/src/consu=
mer/include/linux/sched.h:1917 kbuild/src/consumer/kernel/sched/idle.c:282)
> [    7.660130] cpu_startup_entry (kbuild/src/consumer/kernel/sched/idle.c=
:401 (discriminator 1))
> [    7.660130] rest_init (kbuild/src/consumer/init/main.c:721)
> [    7.660130] arch_call_rest_init+0xd/0x19
> [    7.660130] start_kernel (kbuild/src/consumer/init/main.c:1063)
> [    7.660130] ? set_intr_gate (kbuild/src/consumer/arch/x86/kernel/idt.c=
:191)
> [    7.660130] i386_start_kernel (kbuild/src/consumer/arch/x86/kernel/hea=
d32.c:57)
> [    7.660130] startup_32_smp (kbuild/src/consumer/arch/x86/kernel/head_3=
2.S:328)
> [    7.660130] irq event stamp: 22020
> [    7.660130] hardirqs last enabled at (22019): tick_nohz_idle_enter (kb=
uild/src/consumer/arch/x86/include/asm/irqflags.h:54 (discriminator 3) kbui=
ld/src/consumer/arch/x86/include/asm/irqflags.h:94 (discriminator 3) kbuild=
/src/consumer/kernel/time/tick-sched.c:1076 (discriminator 3))
> [    7.660130] hardirqs last disabled at (22020): sysvec_call_function_si=
ngle (kbuild/src/consumer/arch/x86/kernel/smp.c:243)
> [    7.660130] softirqs last enabled at (22016): __do_softirq (kbuild/src=
/consumer/arch/x86/include/asm/preempt.h:26 kbuild/src/consumer/kernel/soft=
irq.c:371)
> [    7.660130] softirqs last disabled at (22009): do_softirq_own_stack (k=
build/src/consumer/arch/x86/kernel/irq_32.c:59 kbuild/src/consumer/arch/x86=
/kernel/irq_32.c:148)
> [    7.660130] _warn_unseeded_randomness: 5 callbacks suppressed
> [    7.660130] random: get_random_bytes called from init_oops_id+0x42/0x5=
0 with crng_init=3D0
> [    7.660130] ---[ end trace d2283f0d3e5f4568 ]---
> [    9.892175] random: get_random_u32 called from allocate_slab+0x13e/0x5=
a0 with crng_init=3D0
> [    9.892175] random: get_random_u32 called from get_random_order+0x4d/0=
x80 with crng_init=3D0
> [    9.892260] random: get_random_u32 called from allocate_slab+0x13e/0x5=
a0 with crng_init=3D0
> [   11.937066] _warn_unseeded_randomness: 121 callbacks suppressed
> [   11.937072] random: get_random_u32 called from __kmem_cache_create+0x2=
6/0x3d0 with crng_init=3D0
> [   11.939233] random: get_random_u32 called from cache_random_seq_create=
+0x7c/0x140 with crng_init=3D0
> [   11.939425] random: get_random_u32 called from allocate_slab+0x13e/0x5=
a0 with crng_init=3D0
> [   11.969767] Initialise system trusted keyrings
> [   11.970501] workingset: timestamp_bits=3D30 max_order=3D20 bucket_orde=
r=3D0
> [   11.992611] zbud: loaded
> [   11.993027] zsmalloc: debugfs not available, stat dir not created
> [   11.997916] DLM installed
> [   12.002069] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> [   12.024684] Installing knfsd (copyright (C) 1996 okir(a)monad.swb.de).
> [   12.026849] ntfs: driver 2.1.32 [Flags: R/W DEBUG].
> [   12.027875] efs: 1.0a - http://aeschi.ch.eu.org/efs/
> [   12.031082] romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
> [   12.031692] QNX4 filesystem 0.2.3 registered.
> [   12.032291] orangefs_debugfs_init: called with debug mask: :none: :0:
> [   12.032963] orangefs_init: module version upstream loaded
> [   12.033694] JFS: nTxBlock =3D 8192, nTxLock =3D 65536
> [   12.038832] SGI XFS with ACLs, security attributes, quota, no debug en=
abled
> [   12.043207] ocfs2: Registered cluster interface user
> [   12.043802] OCFS2 User DLM kernel interface loaded
> [   12.047829] gfs2: GFS2 installed
> [   12.052207] FS-Cache: Netfs 'ceph' registered for caching
> [   12.052591] ceph: loaded (mds proto 32)
> [   12.064700] NET: Registered protocol family 38
> [   12.065179] xor: automatically using best checksumming function   avx
> [   12.065661] Key type asymmetric registered
> [   12.065943] Asymmetric key parser 'x509' registered
> [   12.066277] Asymmetric key parser 'pkcs8' registered
> [   12.066611] Key type pkcs7_test registered
> [   12.067071] bounce: pool size: 64 pages
> [   12.067399] Block layer SCSI generic (bsg) driver version 0.4 loaded (=
major 244)
> [   12.068143] io scheduler mq-deadline registered
>
>
> To reproduce:
>
>         # build kernel
>         cd linux
>         cp config-5.11.0-rc2-00035-gd4d61cceee95 .config
>         make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare m=
odules_prepare bzImage
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
>
>
>
> Thanks,
> Oliver Sang
>
--===============3907136218571935245==--

