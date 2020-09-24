Content-Type: multipart/mixed; boundary="===============4772137383203616211=="
MIME-Version: 1.0
From: Ville Syrjälä <ville.syrjala@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/dp] 6509ca051a: PANIC:double_fault
Date: Thu, 24 Sep 2020 19:42:03 +0300
Message-ID: <20200924164203.GL6112@intel.com>
In-Reply-To: <20200924143049.GJ28663@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4772137383203616211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2020 at 10:30:49PM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 6509ca051abf4ff60d63732badcb2173a715f741 ("drm/dp: Add drm_dp_dow=
nstream_{min,max}_tmds_clock()")

That doesn't really do anything on its own. So can't see how it would
make anything blow up.

> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> =

> in testcase: boot
> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
8G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +-------------------------------------------------------+------------+---=
---------+
> |                                                       | fe7cf496e5 | 65=
09ca051a |
> +-------------------------------------------------------+------------+---=
---------+
> | boot_successes                                        | 4          | 0 =
         |
> | boot_failures                                         | 0          | 7 =
         |
> | PANIC:double_fault                                    | 0          | 7 =
         |
> | double_fault:#[##]                                    | 0          | 7 =
         |
> | EIP:handle_exception                                  | 0          | 7 =
         |
> | Kernel_panic-not_syncing:Fatal_exception_in_interrupt | 0          | 7 =
         |
> +-------------------------------------------------------+------------+---=
---------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>
> =

> =

> [   15.006925] Applicom driver: $Id: ac.c,v 1.30 2000/03/22 16:03:57 dwmw=
2 Exp $
> [   15.007450] ac.o: No PCI boards found.
> [   15.007720] ac.o: For an ISA board you must supply memory and irq para=
meters.
> [   15.008278] toshiba: not a supported Toshiba laptop
> [   15.010558] random: get_random_u32 called from arch_rnd+0x1c/0x40 with=
 crng_init=3D0
> [   15.011048] traps: PANIC: double fault, error_code: 0x0
> [   15.011048] double fault: 0000 [#1] PREEMPT SMP PTI
> [   15.011048] CPU: 1 PID: 147 Comm: modprobe Not tainted 5.9.0-rc4-00881=
-g6509ca051abf4 #1
> [   15.011048] EIP: handle_exception+0x0/0x128
> [   15.011048] Code: 24 10 36 89 48 fc 8b 4c 24 0c 81 e1 ff ff 00 00 36 8=
9 48 f8 8b 4c 24 08 36 89 48 f4 8b 4c 24 04 36 89 48 f0 59 8d 60 f0 58 cf <=
fc> 0f a0 50 b8 d8 00 00 00 8e e0 58 81 64 24 10 ff ff 00 00 f7 44
> [   15.011048] EAX: 2262d000 EBX: ffa2efbc ECX: 00000000 EDX: c28dacf6
> [   15.011048] ESI: e2629ff0 EDI: ffa2f000 EBP: 00000000 ESP: ffa2e008
> [   15.011048] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010=
006
> [   15.011048] CR0: 80050033 CR2: ffa2dffc CR3: 02db2000 CR4: 000406b0
> [   15.011048] Call Trace:
> [   15.011048]  <ENTRY_TRAMPOLINE>
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80/0x80
> [   15.011048]  ? sysvec_kvm_asyncpf_interrupt+0x50/0x50
> [   15.011048]  ? restore_all_switch_stack+0x80
> [   15.011048] Lost 217 message(s)!
> [   15.011048] ---[ end trace 94527bd98e02a7a3 ]---
> [   15.011048] EIP: handle_exception+0x0/0x128
> [   15.011048] Code: 24 10 36 89 48 fc 8b 4c 24 0c 81 e1 ff ff 00 00 36 8=
9 48 f8 8b 4c 24 08 36 89 48 f4 8b 4c 24 04 36 89 48 f0 59 8d 60 f0 58 cf <=
fc> 0f a0 50 b8 d8 00 00 00 8e e0 58 81 64 24 10 ff ff 00 00 f7 44
> [   15.011048] EAX: 2262d000 EBX: ffa2efbc ECX: 00000000 EDX: c28dacf6
> [   15.011048] ESI: e2629ff0 EDI: ffa2f000 EBP: 00000000 ESP: ffa2e008
> [   15.011048] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010=
006
> [   15.011048] CR0: 80050033 CR2: ffa2dffc CR3: 02db2000 CR4: 000406b0
> [   15.011048] Kernel panic - not syncing: Fatal exception in interrupt
> [   15.011048] Kernel Offset: disabled
> =

> Kboot worker: lkp-worker30
> Elapsed time: 60
> =

> =

> =

> To reproduce:
> =

>         # build kernel
> 	cd linux
> 	cp config-5.9.0-rc4-00881-g6509ca051abf4 .config
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare modules_=
prepare bzImage
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
> =

> =

> =

> Thanks,
> lkp
> =


> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/i386 5.9.0-rc4 Kernel Configuration
> #
> CONFIG_CC_VERSION_TEXT=3D"gcc-9 (Debian 9.3.0-15) 9.3.0"
> CONFIG_CC_IS_GCC=3Dy
> CONFIG_GCC_VERSION=3D90300
> CONFIG_LD_VERSION=3D235000000
> CONFIG_CLANG_VERSION=3D0
> CONFIG_CC_HAS_ASM_GOTO=3Dy
> CONFIG_CC_HAS_ASM_INLINE=3Dy
> CONFIG_CONSTRUCTORS=3Dy
> CONFIG_IRQ_WORK=3Dy
> CONFIG_BUILDTIME_TABLE_SORT=3Dy
> CONFIG_THREAD_INFO_IN_TASK=3Dy
> =

> #
> # General setup
> #
> CONFIG_INIT_ENV_ARG_LIMIT=3D32
> # CONFIG_COMPILE_TEST is not set
> CONFIG_LOCALVERSION=3D""
> CONFIG_LOCALVERSION_AUTO=3Dy
> CONFIG_BUILD_SALT=3D""
> CONFIG_HAVE_KERNEL_GZIP=3Dy
> CONFIG_HAVE_KERNEL_BZIP2=3Dy
> CONFIG_HAVE_KERNEL_LZMA=3Dy
> CONFIG_HAVE_KERNEL_XZ=3Dy
> CONFIG_HAVE_KERNEL_LZO=3Dy
> CONFIG_HAVE_KERNEL_LZ4=3Dy
> CONFIG_HAVE_KERNEL_ZSTD=3Dy
> # CONFIG_KERNEL_GZIP is not set
> # CONFIG_KERNEL_BZIP2 is not set
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> CONFIG_KERNEL_LZ4=3Dy
> # CONFIG_KERNEL_ZSTD is not set
> CONFIG_DEFAULT_INIT=3D""
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> # CONFIG_SYSVIPC is not set
> CONFIG_POSIX_MQUEUE=3Dy
> CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
> # CONFIG_WATCH_QUEUE is not set
> CONFIG_CROSS_MEMORY_ATTACH=3Dy
> CONFIG_USELIB=3Dy
> CONFIG_AUDIT=3Dy
> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> CONFIG_AUDITSYSCALL=3Dy
> =

> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=3Dy
> CONFIG_GENERIC_IRQ_SHOW=3Dy
> CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=3Dy
> CONFIG_GENERIC_PENDING_IRQ=3Dy
> CONFIG_GENERIC_IRQ_MIGRATION=3Dy
> CONFIG_GENERIC_IRQ_INJECTION=3Dy
> CONFIG_HARDIRQS_SW_RESEND=3Dy
> CONFIG_GENERIC_IRQ_CHIP=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> CONFIG_GENERIC_IRQ_DEBUGFS=3Dy
> # end of IRQ subsystem
> =

> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> CONFIG_ARCH_CLOCKSOURCE_INIT=3Dy
> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> CONFIG_GENERIC_CLOCKEVENTS=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> CONFIG_GENERIC_CMOS_UPDATE=3Dy
> CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=3Dy
> =

> #
> # Timers subsystem
> #
> CONFIG_HZ_PERIODIC=3Dy
> # CONFIG_NO_HZ_IDLE is not set
> CONFIG_NO_HZ=3Dy
> # CONFIG_HIGH_RES_TIMERS is not set
> # end of Timers subsystem
> =

> # CONFIG_PREEMPT_NONE is not set
> # CONFIG_PREEMPT_VOLUNTARY is not set
> CONFIG_PREEMPT=3Dy
> CONFIG_PREEMPT_COUNT=3Dy
> CONFIG_PREEMPTION=3Dy
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=3Dy
> CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_SCHED_AVG_IRQ=3Dy
> # CONFIG_BSD_PROCESS_ACCT is not set
> # CONFIG_TASKSTATS is not set
> # CONFIG_PSI is not set
> # end of CPU/Task time and stats accounting
> =

> CONFIG_CPU_ISOLATION=3Dy
> =

> #
> # RCU Subsystem
> #
> CONFIG_TREE_RCU=3Dy
> CONFIG_PREEMPT_RCU=3Dy
> # CONFIG_RCU_EXPERT is not set
> CONFIG_SRCU=3Dy
> CONFIG_TREE_SRCU=3Dy
> CONFIG_TASKS_RCU_GENERIC=3Dy
> CONFIG_TASKS_RCU=3Dy
> CONFIG_TASKS_RUDE_RCU=3Dy
> CONFIG_TASKS_TRACE_RCU=3Dy
> CONFIG_RCU_STALL_COMMON=3Dy
> CONFIG_RCU_NEED_SEGCBLIST=3Dy
> # end of RCU Subsystem
> =

> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> # CONFIG_IKHEADERS is not set
> CONFIG_LOG_BUF_SHIFT=3D20
> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> =

> #
> # Scheduler features
> #
> # CONFIG_UCLAMP_TASK is not set
> # end of Scheduler features
> =

> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_CGROUPS=3Dy
> CONFIG_PAGE_COUNTER=3Dy
> CONFIG_MEMCG=3Dy
> CONFIG_MEMCG_KMEM=3Dy
> # CONFIG_CGROUP_SCHED is not set
> # CONFIG_CGROUP_PIDS is not set
> # CONFIG_CGROUP_RDMA is not set
> # CONFIG_CGROUP_FREEZER is not set
> # CONFIG_CPUSETS is not set
> CONFIG_CGROUP_DEVICE=3Dy
> CONFIG_CGROUP_CPUACCT=3Dy
> # CONFIG_CGROUP_PERF is not set
> # CONFIG_CGROUP_BPF is not set
> # CONFIG_CGROUP_DEBUG is not set
> CONFIG_SOCK_CGROUP_DATA=3Dy
> # CONFIG_NAMESPACES is not set
> CONFIG_CHECKPOINT_RESTORE=3Dy
> # CONFIG_SCHED_AUTOGROUP is not set
> # CONFIG_SYSFS_DEPRECATED is not set
> CONFIG_RELAY=3Dy
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D""
> CONFIG_RD_GZIP=3Dy
> # CONFIG_RD_BZIP2 is not set
> CONFIG_RD_LZMA=3Dy
> CONFIG_RD_XZ=3Dy
> # CONFIG_RD_LZO is not set
> CONFIG_RD_LZ4=3Dy
> CONFIG_RD_ZSTD=3Dy
> # CONFIG_BOOT_CONFIG is not set
> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> CONFIG_SYSCTL=3Dy
> CONFIG_HAVE_UID16=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_BPF=3Dy
> CONFIG_EXPERT=3Dy
> CONFIG_UID16=3Dy
> CONFIG_MULTIUSER=3Dy
> CONFIG_SGETMASK_SYSCALL=3Dy
> CONFIG_SYSFS_SYSCALL=3Dy
> CONFIG_FHANDLE=3Dy
> # CONFIG_POSIX_TIMERS is not set
> CONFIG_PRINTK=3Dy
> CONFIG_PRINTK_NMI=3Dy
> CONFIG_BUG=3Dy
> # CONFIG_ELF_CORE is not set
> CONFIG_PCSPKR_PLATFORM=3Dy
> # CONFIG_BASE_FULL is not set
> CONFIG_FUTEX=3Dy
> CONFIG_FUTEX_PI=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> CONFIG_SHMEM=3Dy
> CONFIG_AIO=3Dy
> CONFIG_IO_URING=3Dy
> # CONFIG_ADVISE_SYSCALLS is not set
> CONFIG_MEMBARRIER=3Dy
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> CONFIG_BPF_SYSCALL=3Dy
> CONFIG_USERFAULTFD=3Dy
> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> CONFIG_RSEQ=3Dy
> CONFIG_DEBUG_RSEQ=3Dy
> CONFIG_EMBEDDED=3Dy
> CONFIG_HAVE_PERF_EVENTS=3Dy
> # CONFIG_PC104 is not set
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> # end of Kernel Performance Events And Counters
> =

> CONFIG_VM_EVENT_COUNTERS=3Dy
> CONFIG_COMPAT_BRK=3Dy
> CONFIG_SLAB=3Dy
> # CONFIG_SLUB is not set
> # CONFIG_SLOB is not set
> CONFIG_SLAB_MERGE_DEFAULT=3Dy
> # CONFIG_SLAB_FREELIST_RANDOM is not set
> # CONFIG_SLAB_FREELIST_HARDENED is not set
> # CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
> CONFIG_SYSTEM_DATA_VERIFICATION=3Dy
> # CONFIG_PROFILING is not set
> CONFIG_TRACEPOINTS=3Dy
> # end of General setup
> =

> CONFIG_X86_32=3Dy
> CONFIG_X86=3Dy
> CONFIG_INSTRUCTION_DECODER=3Dy
> CONFIG_OUTPUT_FORMAT=3D"elf32-i386"
> CONFIG_LOCKDEP_SUPPORT=3Dy
> CONFIG_STACKTRACE_SUPPORT=3Dy
> CONFIG_MMU=3Dy
> CONFIG_ARCH_MMAP_RND_BITS_MIN=3D8
> CONFIG_ARCH_MMAP_RND_BITS_MAX=3D16
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> CONFIG_GENERIC_ISA_DMA=3Dy
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> CONFIG_ARCH_HAS_FILTER_PGPROT=3Dy
> CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_X86_32_SMP=3Dy
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_PGTABLE_LEVELS=3D3
> CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
> =

> #
> # Processor type and features
> #
> # CONFIG_ZONE_DMA is not set
> CONFIG_SMP=3Dy
> CONFIG_X86_FEATURE_NAMES=3Dy
> # CONFIG_X86_MPPARSE is not set
> # CONFIG_GOLDFISH is not set
> # CONFIG_RETPOLINE is not set
> # CONFIG_X86_CPU_RESCTRL is not set
> # CONFIG_X86_BIGSMP is not set
> CONFIG_X86_EXTENDED_PLATFORM=3Dy
> # CONFIG_X86_GOLDFISH is not set
> # CONFIG_X86_INTEL_LPSS is not set
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> CONFIG_IOSF_MBI=3Dy
> CONFIG_IOSF_MBI_DEBUG=3Dy
> # CONFIG_X86_RDC321X is not set
> CONFIG_X86_32_NON_STANDARD=3Dy
> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
> # CONFIG_STA2X11 is not set
> CONFIG_X86_32_IRIS=3Dy
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> # CONFIG_PARAVIRT_SPINLOCKS is not set
> CONFIG_X86_HV_CALLBACK_VECTOR=3Dy
> # CONFIG_XEN is not set
> CONFIG_KVM_GUEST=3Dy
> CONFIG_ARCH_CPUIDLE_HALTPOLL=3Dy
> # CONFIG_PVH is not set
> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> CONFIG_PARAVIRT_CLOCK=3Dy
> # CONFIG_M486SX is not set
> # CONFIG_M486 is not set
> # CONFIG_M586 is not set
> # CONFIG_M586TSC is not set
> # CONFIG_M586MMX is not set
> # CONFIG_M686 is not set
> # CONFIG_MPENTIUMII is not set
> # CONFIG_MPENTIUMIII is not set
> # CONFIG_MPENTIUMM is not set
> # CONFIG_MPENTIUM4 is not set
> # CONFIG_MK6 is not set
> # CONFIG_MK7 is not set
> CONFIG_MK8=3Dy
> # CONFIG_MCRUSOE is not set
> # CONFIG_MEFFICEON is not set
> # CONFIG_MWINCHIPC6 is not set
> # CONFIG_MWINCHIP3D is not set
> # CONFIG_MELAN is not set
> # CONFIG_MGEODEGX1 is not set
> # CONFIG_MGEODE_LX is not set
> # CONFIG_MCYRIXIII is not set
> # CONFIG_MVIAC3_2 is not set
> # CONFIG_MVIAC7 is not set
> # CONFIG_MCORE2 is not set
> # CONFIG_MATOM is not set
> CONFIG_X86_GENERIC=3Dy
> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> CONFIG_X86_L1_CACHE_SHIFT=3D6
> CONFIG_X86_INTEL_USERCOPY=3Dy
> CONFIG_X86_USE_PPRO_CHECKSUM=3Dy
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_CMOV=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D6
> CONFIG_X86_DEBUGCTLMSR=3Dy
> CONFIG_IA32_FEAT_CTL=3Dy
> CONFIG_X86_VMX_FEATURE_NAMES=3Dy
> CONFIG_PROCESSOR_SELECT=3Dy
> # CONFIG_CPU_SUP_INTEL is not set
> CONFIG_CPU_SUP_CYRIX_32=3Dy
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_HYGON=3Dy
> CONFIG_CPU_SUP_CENTAUR=3Dy
> # CONFIG_CPU_SUP_TRANSMETA_32 is not set
> CONFIG_CPU_SUP_UMC_32=3Dy
> CONFIG_CPU_SUP_ZHAOXIN=3Dy
> CONFIG_HPET_TIMER=3Dy
> # CONFIG_DMI is not set
> CONFIG_NR_CPUS_RANGE_BEGIN=3D2
> CONFIG_NR_CPUS_RANGE_END=3D8
> CONFIG_NR_CPUS_DEFAULT=3D8
> CONFIG_NR_CPUS=3D8
> CONFIG_SCHED_SMT=3Dy
> # CONFIG_SCHED_MC is not set
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> CONFIG_X86_MCE=3Dy
> # CONFIG_X86_MCELOG_LEGACY is not set
> CONFIG_X86_MCE_INTEL=3Dy
> CONFIG_X86_MCE_AMD=3Dy
> # CONFIG_X86_ANCIENT_MCE is not set
> CONFIG_X86_MCE_THRESHOLD=3Dy
> CONFIG_X86_MCE_INJECT=3Dy
> CONFIG_X86_THERMAL_VECTOR=3Dy
> =

> #
> # Performance monitoring
> #
> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dy
> # CONFIG_PERF_EVENTS_AMD_POWER is not set
> # end of Performance monitoring
> =

> CONFIG_X86_LEGACY_VM86=3Dy
> CONFIG_VM86=3Dy
> CONFIG_X86_IOPL_IOPERM=3Dy
> CONFIG_TOSHIBA=3Dy
> CONFIG_I8K=3Dy
> # CONFIG_X86_REBOOTFIXUPS is not set
> CONFIG_MICROCODE=3Dy
> CONFIG_MICROCODE_INTEL=3Dy
> # CONFIG_MICROCODE_AMD is not set
> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> CONFIG_X86_MSR=3Dy
> # CONFIG_X86_CPUID is not set
> # CONFIG_NOHIGHMEM is not set
> # CONFIG_HIGHMEM4G is not set
> CONFIG_HIGHMEM64G=3Dy
> CONFIG_VMSPLIT_3G=3Dy
> # CONFIG_VMSPLIT_2G is not set
> # CONFIG_VMSPLIT_1G is not set
> CONFIG_PAGE_OFFSET=3D0xC0000000
> CONFIG_HIGHMEM=3Dy
> CONFIG_X86_PAE=3Dy
> # CONFIG_X86_CPA_STATISTICS is not set
> CONFIG_ARCH_FLATMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0
> CONFIG_HIGHPTE=3Dy
> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> CONFIG_X86_RESERVE_LOW=3D64
> # CONFIG_MTRR is not set
> # CONFIG_ARCH_RANDOM is not set
> CONFIG_X86_SMAP=3Dy
> CONFIG_X86_UMIP=3Dy
> # CONFIG_EFI is not set
> CONFIG_SECCOMP=3Dy
> # CONFIG_HZ_100 is not set
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> CONFIG_HZ_1000=3Dy
> CONFIG_HZ=3D1000
> CONFIG_KEXEC=3Dy
> CONFIG_CRASH_DUMP=3Dy
> CONFIG_PHYSICAL_START=3D0x1000000
> # CONFIG_RELOCATABLE is not set
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_HOTPLUG_CPU=3Dy
> # CONFIG_BOOTPARAM_HOTPLUG_CPU0 is not set
> CONFIG_DEBUG_HOTPLUG_CPU0=3Dy
> CONFIG_COMPAT_VDSO=3Dy
> # CONFIG_CMDLINE_BOOL is not set
> # CONFIG_MODIFY_LDT_SYSCALL is not set
> # end of Processor type and features
> =

> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> =

> #
> # Power management and ACPI options
> #
> CONFIG_SUSPEND=3Dy
> CONFIG_SUSPEND_FREEZER=3Dy
> # CONFIG_SUSPEND_SKIP_SYNC is not set
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM_SLEEP_SMP=3Dy
> # CONFIG_PM_AUTOSLEEP is not set
> # CONFIG_PM_WAKELOCKS is not set
> CONFIG_PM=3Dy
> # CONFIG_PM_DEBUG is not set
> CONFIG_PM_CLK=3Dy
> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> # CONFIG_ENERGY_MODEL is not set
> CONFIG_ARCH_SUPPORTS_ACPI=3Dy
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> # CONFIG_ACPI_DEBUGGER is not set
> CONFIG_ACPI_SPCR_TABLE=3Dy
> CONFIG_ACPI_SLEEP=3Dy
> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> # CONFIG_ACPI_EC_DEBUGFS is not set
> CONFIG_ACPI_AC=3Dy
> CONFIG_ACPI_BATTERY=3Dy
> CONFIG_ACPI_BUTTON=3Dy
> CONFIG_ACPI_VIDEO=3Dy
> CONFIG_ACPI_FAN=3Dy
> # CONFIG_ACPI_TAD is not set
> # CONFIG_ACPI_DOCK is not set
> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> CONFIG_ACPI_PROCESSOR=3Dy
> # CONFIG_ACPI_IPMI is not set
> CONFIG_ACPI_HOTPLUG_CPU=3Dy
> # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> CONFIG_ACPI_THERMAL=3Dy
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_TABLE_UPGRADE=3Dy
> # CONFIG_ACPI_DEBUG is not set
> # CONFIG_ACPI_PCI_SLOT is not set
> CONFIG_ACPI_CONTAINER=3Dy
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> # CONFIG_ACPI_SBS is not set
> # CONFIG_ACPI_HED is not set
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> # CONFIG_ACPI_APEI is not set
> # CONFIG_DPTF_POWER is not set
> # CONFIG_PMIC_OPREGION is not set
> # CONFIG_ACPI_CONFIGFS is not set
> CONFIG_X86_PM_TIMER=3Dy
> CONFIG_SFI=3Dy
> CONFIG_X86_APM_BOOT=3Dy
> CONFIG_APM=3Dy
> CONFIG_APM_IGNORE_USER_SUSPEND=3Dy
> # CONFIG_APM_DO_ENABLE is not set
> CONFIG_APM_CPU_IDLE=3Dy
> CONFIG_APM_DISPLAY_BLANK=3Dy
> CONFIG_APM_ALLOW_INTS=3Dy
> =

> #
> # CPU Frequency scaling
> #
> CONFIG_CPU_FREQ=3Dy
> CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
> CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> CONFIG_CPU_FREQ_STAT=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> # CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
> CONFIG_CPU_FREQ_GOV_SCHEDUTIL=3Dy
> =

> #
> # CPU frequency scaling drivers
> #
> CONFIG_X86_INTEL_PSTATE=3Dy
> # CONFIG_X86_PCC_CPUFREQ is not set
> # CONFIG_X86_ACPI_CPUFREQ is not set
> CONFIG_X86_POWERNOW_K6=3Dy
> CONFIG_X86_POWERNOW_K7=3Dy
> CONFIG_X86_POWERNOW_K7_ACPI=3Dy
> CONFIG_X86_GX_SUSPMOD=3Dy
> CONFIG_X86_SPEEDSTEP_CENTRINO=3Dy
> CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=3Dy
> # CONFIG_X86_SPEEDSTEP_ICH is not set
> # CONFIG_X86_SPEEDSTEP_SMI is not set
> # CONFIG_X86_P4_CLOCKMOD is not set
> CONFIG_X86_CPUFREQ_NFORCE2=3Dy
> CONFIG_X86_LONGRUN=3Dy
> # CONFIG_X86_LONGHAUL is not set
> # CONFIG_X86_E_POWERSAVER is not set
> =

> #
> # shared options
> #
> # end of CPU Frequency scaling
> =

> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=3Dy
> # CONFIG_CPU_IDLE_GOV_LADDER is not set
> CONFIG_CPU_IDLE_GOV_MENU=3Dy
> # CONFIG_CPU_IDLE_GOV_TEO is not set
> # CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
> CONFIG_HALTPOLL_CPUIDLE=3Dy
> # end of CPU Idle
> # end of Power management and ACPI options
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI_GOBIOS=3Dy
> # CONFIG_PCI_GOMMCONFIG is not set
> # CONFIG_PCI_GODIRECT is not set
> # CONFIG_PCI_GOANY is not set
> CONFIG_PCI_BIOS=3Dy
> CONFIG_PCI_CNB20LE_QUIRK=3Dy
> # CONFIG_ISA_BUS is not set
> CONFIG_ISA_DMA_API=3Dy
> # CONFIG_ISA is not set
> CONFIG_SCx200=3Dy
> CONFIG_SCx200HR_TIMER=3Dy
> CONFIG_ALIX=3Dy
> # CONFIG_NET5501 is not set
> CONFIG_AMD_NB=3Dy
> CONFIG_X86_SYSFB=3Dy
> # end of Bus options (PCI etc.)
> =

> #
> # Binary Emulations
> #
> CONFIG_COMPAT_32=3Dy
> # end of Binary Emulations
> =

> CONFIG_HAVE_ATOMIC_IOMAP=3Dy
> =

> #
> # Firmware Drivers
> #
> CONFIG_EDD=3Dy
> # CONFIG_EDD_OFF is not set
> # CONFIG_FIRMWARE_MEMMAP is not set
> CONFIG_FW_CFG_SYSFS=3Dy
> CONFIG_FW_CFG_SYSFS_CMDLINE=3Dy
> # CONFIG_GOOGLE_FIRMWARE is not set
> CONFIG_EFI_EARLYCON=3Dy
> =

> #
> # Tegra firmware driver
> #
> # end of Tegra firmware driver
> # end of Firmware Drivers
> =

> CONFIG_HAVE_KVM=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> # CONFIG_KVM_WERROR is not set
> CONFIG_AS_AVX512=3Dy
> CONFIG_AS_SHA1_NI=3Dy
> CONFIG_AS_SHA256_NI=3Dy
> CONFIG_AS_TPAUSE=3Dy
> =

> #
> # General architecture-dependent options
> #
> CONFIG_CRASH_CORE=3Dy
> CONFIG_KEXEC_CORE=3Dy
> CONFIG_HOTPLUG_SMT=3Dy
> CONFIG_GENERIC_ENTRY=3Dy
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
> # CONFIG_KPROBES is not set
> CONFIG_JUMP_LABEL=3Dy
> CONFIG_STATIC_KEYS_SELFTEST=3Dy
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> CONFIG_HAVE_IOREMAP_PROT=3Dy
> CONFIG_HAVE_KPROBES=3Dy
> CONFIG_HAVE_KRETPROBES=3Dy
> CONFIG_HAVE_OPTPROBES=3Dy
> CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> CONFIG_HAVE_FUNCTION_ERROR_INJECTION=3Dy
> CONFIG_HAVE_NMI=3Dy
> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
> CONFIG_ARCH_HAS_SET_MEMORY=3Dy
> CONFIG_ARCH_HAS_SET_DIRECT_MAP=3Dy
> CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> CONFIG_ARCH_32BIT_OFF_T=3Dy
> CONFIG_HAVE_ASM_MODVERSIONS=3Dy
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> CONFIG_HAVE_RSEQ=3Dy
> CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=3Dy
> CONFIG_HAVE_HW_BREAKPOINT=3Dy
> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HAVE_PERF_REGS=3Dy
> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=3Dy
> CONFIG_MMU_GATHER_TABLE_FREE=3Dy
> CONFIG_MMU_GATHER_RCU_TABLE_FREE=3Dy
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_ARCH_WANT_IPC_PARSE_VERSION=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_SECCOMP_FILTER=3Dy
> CONFIG_HAVE_ARCH_STACKLEAK=3Dy
> CONFIG_HAVE_STACKPROTECTOR=3Dy
> CONFIG_STACKPROTECTOR=3Dy
> CONFIG_STACKPROTECTOR_STRONG=3Dy
> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_MOVE_PMD=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
> CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
> CONFIG_MODULES_USE_ELF_REL=3Dy
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> CONFIG_HAVE_EXIT_THREAD=3Dy
> CONFIG_ARCH_MMAP_RND_BITS=3D8
> CONFIG_ISA_BUS_API=3Dy
> CONFIG_CLONE_BACKWARDS=3Dy
> CONFIG_OLD_SIGSUSPEND3=3Dy
> CONFIG_OLD_SIGACTION=3Dy
> CONFIG_COMPAT_32BIT_TIME=3Dy
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> CONFIG_STRICT_KERNEL_RWX=3Dy
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> CONFIG_STRICT_MODULE_RWX=3Dy
> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
> CONFIG_ARCH_USE_MEMREMAP_PROT=3Dy
> # CONFIG_LOCK_EVENT_COUNTS is not set
> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> CONFIG_GCOV_KERNEL=3Dy
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> # CONFIG_GCOV_PROFILE_ALL is not set
> # end of GCOV-based kernel profiling
> =

> CONFIG_HAVE_GCC_PLUGINS=3Dy
> # end of General architecture-dependent options
> =

> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D1
> CONFIG_MODULES=3Dy
> # CONFIG_MODULE_FORCE_LOAD is not set
> # CONFIG_MODULE_UNLOAD is not set
> # CONFIG_MODVERSIONS is not set
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> # CONFIG_MODULE_SIG is not set
> # CONFIG_MODULE_COMPRESS is not set
> # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
> # CONFIG_UNUSED_SYMBOLS is not set
> # CONFIG_TRIM_UNUSED_KSYMS is not set
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> # CONFIG_BLOCK is not set
> CONFIG_PADATA=3Dy
> CONFIG_ASN1=3Dy
> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
> CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
> CONFIG_LOCK_SPIN_ON_OWNER=3Dy
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> CONFIG_QUEUED_SPINLOCKS=3Dy
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> CONFIG_QUEUED_RWLOCKS=3Dy
> CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=3Dy
> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
> CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy
> CONFIG_FREEZER=3Dy
> =

> #
> # Executable file formats
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_ELFCORE=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> # CONFIG_BINFMT_MISC is not set
> CONFIG_COREDUMP=3Dy
> # end of Executable file formats
> =

> #
> # Memory Management options
> #
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_FLATMEM_MANUAL=3Dy
> # CONFIG_SPARSEMEM_MANUAL is not set
> CONFIG_FLATMEM=3Dy
> CONFIG_FLAT_NODE_MEM_MAP=3Dy
> CONFIG_SPARSEMEM_STATIC=3Dy
> CONFIG_HAVE_FAST_GUP=3Dy
> CONFIG_MEMORY_ISOLATION=3Dy
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_MEMORY_BALLOON=3Dy
> # CONFIG_BALLOON_COMPACTION is not set
> CONFIG_COMPACTION=3Dy
> CONFIG_PAGE_REPORTING=3Dy
> CONFIG_MIGRATION=3Dy
> CONFIG_CONTIG_ALLOC=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_MMU_NOTIFIER=3Dy
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
> CONFIG_MEMORY_FAILURE=3Dy
> CONFIG_HWPOISON_INJECT=3Dy
> # CONFIG_TRANSPARENT_HUGEPAGE is not set
> CONFIG_CLEANCACHE=3Dy
> # CONFIG_CMA is not set
> CONFIG_ZPOOL=3Dy
> CONFIG_ZBUD=3Dy
> # CONFIG_Z3FOLD is not set
> # CONFIG_ZSMALLOC is not set
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> CONFIG_IDLE_PAGE_TRACKING=3Dy
> CONFIG_HMM_MIRROR=3Dy
> # CONFIG_PERCPU_STATS is not set
> # CONFIG_GUP_BENCHMARK is not set
> CONFIG_GUP_GET_PTE_LOW_HIGH=3Dy
> CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
> # end of Memory Management options
> =

> CONFIG_NET=3Dy
> CONFIG_SKB_EXTENSIONS=3Dy
> =

> #
> # Networking options
> #
> # CONFIG_PACKET is not set
> CONFIG_UNIX=3Dy
> CONFIG_UNIX_SCM=3Dy
> # CONFIG_UNIX_DIAG is not set
> CONFIG_TLS=3Dy
> CONFIG_TLS_DEVICE=3Dy
> # CONFIG_TLS_TOE is not set
> CONFIG_XFRM=3Dy
> CONFIG_XFRM_ALGO=3Dy
> CONFIG_XFRM_USER=3Dy
> CONFIG_XFRM_INTERFACE=3Dy
> CONFIG_XFRM_SUB_POLICY=3Dy
> # CONFIG_XFRM_MIGRATE is not set
> CONFIG_XFRM_STATISTICS=3Dy
> CONFIG_XFRM_AH=3Dy
> CONFIG_XFRM_ESP=3Dy
> CONFIG_NET_KEY=3Dy
> # CONFIG_NET_KEY_MIGRATE is not set
> # CONFIG_SMC is not set
> # CONFIG_XDP_SOCKETS is not set
> CONFIG_INET=3Dy
> CONFIG_IP_MULTICAST=3Dy
> CONFIG_IP_ADVANCED_ROUTER=3Dy
> CONFIG_IP_FIB_TRIE_STATS=3Dy
> CONFIG_IP_MULTIPLE_TABLES=3Dy
> CONFIG_IP_ROUTE_MULTIPATH=3Dy
> # CONFIG_IP_ROUTE_VERBOSE is not set
> CONFIG_IP_PNP=3Dy
> CONFIG_IP_PNP_DHCP=3Dy
> CONFIG_IP_PNP_BOOTP=3Dy
> CONFIG_IP_PNP_RARP=3Dy
> CONFIG_NET_IPIP=3Dy
> CONFIG_NET_IPGRE_DEMUX=3Dy
> CONFIG_NET_IP_TUNNEL=3Dy
> # CONFIG_NET_IPGRE is not set
> CONFIG_IP_MROUTE_COMMON=3Dy
> CONFIG_IP_MROUTE=3Dy
> CONFIG_IP_MROUTE_MULTIPLE_TABLES=3Dy
> # CONFIG_IP_PIMSM_V1 is not set
> # CONFIG_IP_PIMSM_V2 is not set
> # CONFIG_SYN_COOKIES is not set
> # CONFIG_NET_IPVTI is not set
> CONFIG_NET_UDP_TUNNEL=3Dy
> CONFIG_NET_FOU=3Dy
> CONFIG_NET_FOU_IP_TUNNELS=3Dy
> CONFIG_INET_AH=3Dy
> CONFIG_INET_ESP=3Dy
> # CONFIG_INET_ESP_OFFLOAD is not set
> # CONFIG_INET_ESPINTCP is not set
> # CONFIG_INET_IPCOMP is not set
> CONFIG_INET_TUNNEL=3Dy
> CONFIG_INET_DIAG=3Dy
> CONFIG_INET_TCP_DIAG=3Dy
> CONFIG_INET_UDP_DIAG=3Dy
> # CONFIG_INET_RAW_DIAG is not set
> CONFIG_INET_DIAG_DESTROY=3Dy
> CONFIG_TCP_CONG_ADVANCED=3Dy
> CONFIG_TCP_CONG_BIC=3Dy
> CONFIG_TCP_CONG_CUBIC=3Dy
> CONFIG_TCP_CONG_WESTWOOD=3Dy
> CONFIG_TCP_CONG_HTCP=3Dy
> # CONFIG_TCP_CONG_HSTCP is not set
> CONFIG_TCP_CONG_HYBLA=3Dy
> CONFIG_TCP_CONG_VEGAS=3Dy
> CONFIG_TCP_CONG_NV=3Dy
> # CONFIG_TCP_CONG_SCALABLE is not set
> CONFIG_TCP_CONG_LP=3Dy
> # CONFIG_TCP_CONG_VENO is not set
> # CONFIG_TCP_CONG_YEAH is not set
> # CONFIG_TCP_CONG_ILLINOIS is not set
> # CONFIG_TCP_CONG_DCTCP is not set
> # CONFIG_TCP_CONG_CDG is not set
> CONFIG_TCP_CONG_BBR=3Dy
> # CONFIG_DEFAULT_BIC is not set
> CONFIG_DEFAULT_CUBIC=3Dy
> # CONFIG_DEFAULT_HTCP is not set
> # CONFIG_DEFAULT_HYBLA is not set
> # CONFIG_DEFAULT_VEGAS is not set
> # CONFIG_DEFAULT_WESTWOOD is not set
> # CONFIG_DEFAULT_BBR is not set
> # CONFIG_DEFAULT_RENO is not set
> CONFIG_DEFAULT_TCP_CONG=3D"cubic"
> CONFIG_TCP_MD5SIG=3Dy
> CONFIG_IPV6=3Dy
> CONFIG_IPV6_ROUTER_PREF=3Dy
> # CONFIG_IPV6_ROUTE_INFO is not set
> CONFIG_IPV6_OPTIMISTIC_DAD=3Dy
> CONFIG_INET6_AH=3Dy
> CONFIG_INET6_ESP=3Dy
> # CONFIG_INET6_ESP_OFFLOAD is not set
> # CONFIG_INET6_ESPINTCP is not set
> # CONFIG_INET6_IPCOMP is not set
> # CONFIG_IPV6_MIP6 is not set
> CONFIG_INET6_TUNNEL=3Dy
> # CONFIG_IPV6_VTI is not set
> CONFIG_IPV6_SIT=3Dy
> # CONFIG_IPV6_SIT_6RD is not set
> CONFIG_IPV6_NDISC_NODETYPE=3Dy
> CONFIG_IPV6_TUNNEL=3Dy
> CONFIG_IPV6_GRE=3Dy
> CONFIG_IPV6_FOU=3Dy
> CONFIG_IPV6_FOU_TUNNEL=3Dy
> CONFIG_IPV6_MULTIPLE_TABLES=3Dy
> # CONFIG_IPV6_SUBTREES is not set
> # CONFIG_IPV6_MROUTE is not set
> CONFIG_IPV6_SEG6_LWTUNNEL=3Dy
> # CONFIG_IPV6_SEG6_HMAC is not set
> CONFIG_IPV6_SEG6_BPF=3Dy
> # CONFIG_IPV6_RPL_LWTUNNEL is not set
> # CONFIG_MPTCP is not set
> CONFIG_NETWORK_SECMARK=3Dy
> CONFIG_NET_PTP_CLASSIFY=3Dy
> CONFIG_NETWORK_PHY_TIMESTAMPING=3Dy
> # CONFIG_NETFILTER is not set
> CONFIG_BPFILTER=3Dy
> # CONFIG_IP_DCCP is not set
> CONFIG_IP_SCTP=3Dy
> CONFIG_SCTP_DBG_OBJCNT=3Dy
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
> CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=3Dy
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
> CONFIG_SCTP_COOKIE_HMAC_MD5=3Dy
> CONFIG_SCTP_COOKIE_HMAC_SHA1=3Dy
> CONFIG_INET_SCTP_DIAG=3Dy
> # CONFIG_RDS is not set
> CONFIG_TIPC=3Dy
> CONFIG_TIPC_MEDIA_UDP=3Dy
> CONFIG_TIPC_CRYPTO=3Dy
> # CONFIG_TIPC_DIAG is not set
> CONFIG_ATM=3Dy
> CONFIG_ATM_CLIP=3Dy
> CONFIG_ATM_CLIP_NO_ICMP=3Dy
> CONFIG_ATM_LANE=3Dy
> CONFIG_ATM_MPOA=3Dy
> # CONFIG_ATM_BR2684 is not set
> CONFIG_L2TP=3Dy
> CONFIG_L2TP_DEBUGFS=3Dy
> # CONFIG_L2TP_V3 is not set
> # CONFIG_BRIDGE is not set
> CONFIG_HAVE_NET_DSA=3Dy
> # CONFIG_NET_DSA is not set
> CONFIG_VLAN_8021Q=3Dy
> # CONFIG_VLAN_8021Q_GVRP is not set
> # CONFIG_VLAN_8021Q_MVRP is not set
> CONFIG_DECNET=3Dy
> # CONFIG_DECNET_ROUTER is not set
> CONFIG_LLC=3Dy
> CONFIG_LLC2=3Dy
> CONFIG_ATALK=3Dy
> CONFIG_DEV_APPLETALK=3Dy
> CONFIG_IPDDP=3Dy
> # CONFIG_IPDDP_ENCAP is not set
> # CONFIG_X25 is not set
> CONFIG_LAPB=3Dy
> CONFIG_PHONET=3Dy
> CONFIG_6LOWPAN=3Dy
> # CONFIG_6LOWPAN_DEBUGFS is not set
> CONFIG_6LOWPAN_NHC=3Dy
> CONFIG_6LOWPAN_NHC_DEST=3Dy
> CONFIG_6LOWPAN_NHC_FRAGMENT=3Dy
> # CONFIG_6LOWPAN_NHC_HOP is not set
> CONFIG_6LOWPAN_NHC_IPV6=3Dy
> # CONFIG_6LOWPAN_NHC_MOBILITY is not set
> CONFIG_6LOWPAN_NHC_ROUTING=3Dy
> CONFIG_6LOWPAN_NHC_UDP=3Dy
> # CONFIG_6LOWPAN_GHC_EXT_HDR_HOP is not set
> # CONFIG_6LOWPAN_GHC_UDP is not set
> CONFIG_6LOWPAN_GHC_ICMPV6=3Dy
> CONFIG_6LOWPAN_GHC_EXT_HDR_DEST=3Dy
> CONFIG_6LOWPAN_GHC_EXT_HDR_FRAG=3Dy
> # CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE is not set
> CONFIG_IEEE802154=3Dy
> CONFIG_IEEE802154_NL802154_EXPERIMENTAL=3Dy
> # CONFIG_IEEE802154_SOCKET is not set
> # CONFIG_IEEE802154_6LOWPAN is not set
> CONFIG_MAC802154=3Dy
> # CONFIG_NET_SCHED is not set
> CONFIG_DCB=3Dy
> CONFIG_DNS_RESOLVER=3Dy
> # CONFIG_BATMAN_ADV is not set
> CONFIG_OPENVSWITCH=3Dy
> CONFIG_VSOCKETS=3Dy
> CONFIG_VSOCKETS_DIAG=3Dy
> CONFIG_VSOCKETS_LOOPBACK=3Dy
> CONFIG_VIRTIO_VSOCKETS=3Dy
> CONFIG_VIRTIO_VSOCKETS_COMMON=3Dy
> # CONFIG_NETLINK_DIAG is not set
> CONFIG_MPLS=3Dy
> CONFIG_NET_MPLS_GSO=3Dy
> # CONFIG_MPLS_ROUTING is not set
> CONFIG_NET_NSH=3Dy
> # CONFIG_HSR is not set
> CONFIG_NET_SWITCHDEV=3Dy
> # CONFIG_NET_L3_MASTER_DEV is not set
> # CONFIG_QRTR is not set
> CONFIG_NET_NCSI=3Dy
> # CONFIG_NCSI_OEM_CMD_GET_MAC is not set
> CONFIG_RPS=3Dy
> CONFIG_RFS_ACCEL=3Dy
> CONFIG_XPS=3Dy
> CONFIG_CGROUP_NET_PRIO=3Dy
> # CONFIG_CGROUP_NET_CLASSID is not set
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> # CONFIG_BPF_JIT is not set
> CONFIG_NET_FLOW_LIMIT=3Dy
> =

> #
> # Network testing
> #
> # CONFIG_NET_PKTGEN is not set
> # CONFIG_NET_DROP_MONITOR is not set
> # end of Network testing
> # end of Networking options
> =

> CONFIG_HAMRADIO=3Dy
> =

> #
> # Packet Radio protocols
> #
> # CONFIG_AX25 is not set
> CONFIG_CAN=3Dy
> # CONFIG_CAN_RAW is not set
> CONFIG_CAN_BCM=3Dy
> CONFIG_CAN_GW=3Dy
> # CONFIG_CAN_J1939 is not set
> =

> #
> # CAN Device Drivers
> #
> CONFIG_CAN_VCAN=3Dy
> # CONFIG_CAN_VXCAN is not set
> CONFIG_CAN_SLCAN=3Dy
> CONFIG_CAN_DEV=3Dy
> # CONFIG_CAN_CALC_BITTIMING is not set
> # CONFIG_CAN_JANZ_ICAN3 is not set
> # CONFIG_CAN_KVASER_PCIEFD is not set
> CONFIG_PCH_CAN=3Dy
> # CONFIG_CAN_C_CAN is not set
> # CONFIG_CAN_CC770 is not set
> CONFIG_CAN_IFI_CANFD=3Dy
> CONFIG_CAN_M_CAN=3Dy
> # CONFIG_CAN_M_CAN_PLATFORM is not set
> CONFIG_CAN_PEAK_PCIEFD=3Dy
> # CONFIG_CAN_SJA1000 is not set
> CONFIG_CAN_SOFTING=3Dy
> =

> #
> # CAN USB interfaces
> #
> CONFIG_CAN_8DEV_USB=3Dy
> CONFIG_CAN_EMS_USB=3Dy
> CONFIG_CAN_ESD_USB2=3Dy
> CONFIG_CAN_GS_USB=3Dy
> CONFIG_CAN_KVASER_USB=3Dy
> CONFIG_CAN_MCBA_USB=3Dy
> CONFIG_CAN_PEAK_USB=3Dy
> CONFIG_CAN_UCAN=3Dy
> # end of CAN USB interfaces
> =

> # CONFIG_CAN_DEBUG_DEVICES is not set
> # end of CAN Device Drivers
> =

> CONFIG_BT=3Dy
> CONFIG_BT_BREDR=3Dy
> CONFIG_BT_RFCOMM=3Dy
> CONFIG_BT_RFCOMM_TTY=3Dy
> # CONFIG_BT_BNEP is not set
> CONFIG_BT_HIDP=3Dy
> # CONFIG_BT_HS is not set
> # CONFIG_BT_LE is not set
> CONFIG_BT_LEDS=3Dy
> # CONFIG_BT_MSFTEXT is not set
> # CONFIG_BT_DEBUGFS is not set
> CONFIG_BT_SELFTEST=3Dy
> =

> #
> # Bluetooth device drivers
> #
> # CONFIG_BT_HCIBTUSB is not set
> # CONFIG_BT_HCIBTSDIO is not set
> # CONFIG_BT_HCIUART is not set
> CONFIG_BT_HCIBCM203X=3Dy
> # CONFIG_BT_HCIBPA10X is not set
> # CONFIG_BT_HCIBFUSB is not set
> CONFIG_BT_HCIVHCI=3Dy
> CONFIG_BT_MRVL=3Dy
> # CONFIG_BT_MRVL_SDIO is not set
> # CONFIG_BT_MTKSDIO is not set
> # CONFIG_BT_MTKUART is not set
> # end of Bluetooth device drivers
> =

> CONFIG_AF_RXRPC=3Dy
> CONFIG_AF_RXRPC_IPV6=3Dy
> CONFIG_AF_RXRPC_INJECT_LOSS=3Dy
> # CONFIG_AF_RXRPC_DEBUG is not set
> # CONFIG_RXKAD is not set
> CONFIG_AF_KCM=3Dy
> CONFIG_STREAM_PARSER=3Dy
> CONFIG_FIB_RULES=3Dy
> CONFIG_WIRELESS=3Dy
> CONFIG_WEXT_CORE=3Dy
> CONFIG_WEXT_PROC=3Dy
> CONFIG_CFG80211=3Dy
> # CONFIG_NL80211_TESTMODE is not set
> CONFIG_CFG80211_DEVELOPER_WARNINGS=3Dy
> CONFIG_CFG80211_CERTIFICATION_ONUS=3Dy
> CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=3Dy
> CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=3Dy
> CONFIG_CFG80211_EXTRA_REGDB_KEYDIR=3D""
> CONFIG_CFG80211_REG_CELLULAR_HINTS=3Dy
> # CONFIG_CFG80211_REG_RELAX_NO_IR is not set
> CONFIG_CFG80211_DEFAULT_PS=3Dy
> # CONFIG_CFG80211_DEBUGFS is not set
> CONFIG_CFG80211_CRDA_SUPPORT=3Dy
> CONFIG_CFG80211_WEXT=3Dy
> # CONFIG_MAC80211 is not set
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> # CONFIG_WIMAX is not set
> CONFIG_RFKILL=3Dy
> CONFIG_RFKILL_LEDS=3Dy
> # CONFIG_RFKILL_INPUT is not set
> # CONFIG_RFKILL_GPIO is not set
> CONFIG_NET_9P=3Dy
> CONFIG_NET_9P_VIRTIO=3Dy
> # CONFIG_NET_9P_RDMA is not set
> CONFIG_NET_9P_DEBUG=3Dy
> CONFIG_CAIF=3Dy
> # CONFIG_CAIF_DEBUG is not set
> CONFIG_CAIF_NETDEV=3Dy
> CONFIG_CAIF_USB=3Dy
> CONFIG_CEPH_LIB=3Dy
> # CONFIG_CEPH_LIB_PRETTYDEBUG is not set
> CONFIG_CEPH_LIB_USE_DNS_RESOLVER=3Dy
> CONFIG_NFC=3Dy
> CONFIG_NFC_DIGITAL=3Dy
> # CONFIG_NFC_NCI is not set
> # CONFIG_NFC_HCI is not set
> =

> #
> # Near Field Communication (NFC) devices
> #
> CONFIG_NFC_SIM=3Dy
> CONFIG_NFC_PORT100=3Dy
> CONFIG_NFC_PN533=3Dy
> # CONFIG_NFC_PN533_USB is not set
> CONFIG_NFC_PN533_I2C=3Dy
> # CONFIG_NFC_PN532_UART is not set
> # end of Near Field Communication (NFC) devices
> =

> CONFIG_PSAMPLE=3Dy
> CONFIG_NET_IFE=3Dy
> CONFIG_LWTUNNEL=3Dy
> CONFIG_LWTUNNEL_BPF=3Dy
> CONFIG_DST_CACHE=3Dy
> CONFIG_GRO_CELLS=3Dy
> CONFIG_SOCK_VALIDATE_XMIT=3Dy
> CONFIG_NET_SOCK_MSG=3Dy
> # CONFIG_FAILOVER is not set
> CONFIG_ETHTOOL_NETLINK=3Dy
> CONFIG_HAVE_EBPF_JIT=3Dy
> =

> #
> # Device Drivers
> #
> CONFIG_HAVE_EISA=3Dy
> # CONFIG_EISA is not set
> CONFIG_HAVE_PCI=3Dy
> CONFIG_PCI=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> # CONFIG_PCIEPORTBUS is not set
> CONFIG_PCIEASPM=3Dy
> CONFIG_PCIEASPM_DEFAULT=3Dy
> # CONFIG_PCIEASPM_POWERSAVE is not set
> # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
> # CONFIG_PCIEASPM_PERFORMANCE is not set
> # CONFIG_PCIE_PTM is not set
> # CONFIG_PCI_MSI is not set
> CONFIG_PCI_QUIRKS=3Dy
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> CONFIG_PCI_STUB=3Dy
> CONFIG_PCI_PF_STUB=3Dy
> CONFIG_PCI_ATS=3Dy
> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> CONFIG_PCI_IOV=3Dy
> # CONFIG_PCI_PRI is not set
> CONFIG_PCI_PASID=3Dy
> CONFIG_PCI_LABEL=3Dy
> # CONFIG_HOTPLUG_PCI is not set
> =

> #
> # PCI controller drivers
> #
> =

> #
> # DesignWare PCI Core Support
> #
> # end of DesignWare PCI Core Support
> =

> #
> # Mobiveil PCIe Core Support
> #
> # end of Mobiveil PCIe Core Support
> =

> #
> # Cadence PCIe controllers support
> #
> # end of Cadence PCIe controllers support
> # end of PCI controller drivers
> =

> #
> # PCI Endpoint
> #
> CONFIG_PCI_ENDPOINT=3Dy
> # CONFIG_PCI_ENDPOINT_CONFIGFS is not set
> CONFIG_PCI_EPF_TEST=3Dy
> # end of PCI Endpoint
> =

> #
> # PCI switch controller drivers
> #
> CONFIG_PCI_SW_SWITCHTEC=3Dy
> # end of PCI switch controller drivers
> =

> # CONFIG_PCCARD is not set
> CONFIG_RAPIDIO=3Dy
> CONFIG_RAPIDIO_DISC_TIMEOUT=3D30
> CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS=3Dy
> # CONFIG_RAPIDIO_DMA_ENGINE is not set
> # CONFIG_RAPIDIO_DEBUG is not set
> CONFIG_RAPIDIO_ENUM_BASIC=3Dy
> CONFIG_RAPIDIO_CHMAN=3Dy
> CONFIG_RAPIDIO_MPORT_CDEV=3Dy
> =

> #
> # RapidIO Switch drivers
> #
> # CONFIG_RAPIDIO_TSI57X is not set
> # CONFIG_RAPIDIO_CPS_XX is not set
> CONFIG_RAPIDIO_TSI568=3Dy
> CONFIG_RAPIDIO_CPS_GEN2=3Dy
> # CONFIG_RAPIDIO_RXS_GEN3 is not set
> # end of RapidIO Switch drivers
> =

> #
> # Generic Driver Options
> #
> # CONFIG_UEVENT_HELPER is not set
> CONFIG_DEVTMPFS=3Dy
> # CONFIG_DEVTMPFS_MOUNT is not set
> CONFIG_STANDALONE=3Dy
> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> =

> #
> # Firmware loader
> #
> CONFIG_FW_LOADER=3Dy
> CONFIG_FW_LOADER_PAGED_BUF=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
> # CONFIG_FW_LOADER_COMPRESS is not set
> CONFIG_FW_CACHE=3Dy
> # end of Firmware loader
> =

> CONFIG_WANT_DEV_COREDUMP=3Dy
> # CONFIG_ALLOW_DEV_COREDUMP is not set
> # CONFIG_DEBUG_DRIVER is not set
> # CONFIG_DEBUG_DEVRES is not set
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_SPMI=3Dy
> CONFIG_REGMAP_W1=3Dy
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> CONFIG_DMA_FENCE_TRACE=3Dy
> # end of Generic Driver Options
> =

> #
> # Bus devices
> #
> # CONFIG_MHI_BUS is not set
> # end of Bus devices
> =

> CONFIG_CONNECTOR=3Dy
> # CONFIG_PROC_EVENTS is not set
> CONFIG_GNSS=3Dy
> CONFIG_GNSS_SERIAL=3Dy
> # CONFIG_GNSS_MTK_SERIAL is not set
> CONFIG_GNSS_SIRF_SERIAL=3Dy
> CONFIG_GNSS_UBX_SERIAL=3Dy
> # CONFIG_MTD is not set
> # CONFIG_OF is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> CONFIG_PARPORT=3Dy
> # CONFIG_PARPORT_PC is not set
> # CONFIG_PARPORT_AX88796 is not set
> # CONFIG_PARPORT_1284 is not set
> CONFIG_PNP=3Dy
> CONFIG_PNP_DEBUG_MESSAGES=3Dy
> =

> #
> # Protocols
> #
> CONFIG_PNPACPI=3Dy
> =

> #
> # NVME Support
> #
> # end of NVME Support
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dy
> CONFIG_AD525X_DPOT=3Dy
> # CONFIG_AD525X_DPOT_I2C is not set
> CONFIG_DUMMY_IRQ=3Dy
> CONFIG_IBM_ASM=3Dy
> # CONFIG_PHANTOM is not set
> CONFIG_TIFM_CORE=3Dy
> # CONFIG_TIFM_7XX1 is not set
> CONFIG_ICS932S401=3Dy
> # CONFIG_ENCLOSURE_SERVICES is not set
> # CONFIG_CS5535_MFGPT is not set
> # CONFIG_HP_ILO is not set
> # CONFIG_APDS9802ALS is not set
> CONFIG_ISL29003=3Dy
> CONFIG_ISL29020=3Dy
> CONFIG_SENSORS_TSL2550=3Dy
> CONFIG_SENSORS_BH1770=3Dy
> # CONFIG_SENSORS_APDS990X is not set
> CONFIG_HMC6352=3Dy
> CONFIG_DS1682=3Dy
> # CONFIG_PCH_PHUB is not set
> CONFIG_SRAM=3Dy
> CONFIG_PCI_ENDPOINT_TEST=3Dy
> # CONFIG_XILINX_SDFEC is not set
> CONFIG_MISC_RTSX=3Dy
> # CONFIG_PVPANIC is not set
> CONFIG_C2PORT=3Dy
> CONFIG_C2PORT_DURAMAR_2150=3Dy
> =

> #
> # EEPROM support
> #
> # CONFIG_EEPROM_AT24 is not set
> CONFIG_EEPROM_LEGACY=3Dy
> # CONFIG_EEPROM_MAX6875 is not set
> CONFIG_EEPROM_93CX6=3Dy
> CONFIG_EEPROM_IDT_89HPESX=3Dy
> # CONFIG_EEPROM_EE1004 is not set
> # end of EEPROM support
> =

> CONFIG_CB710_CORE=3Dy
> # CONFIG_CB710_DEBUG is not set
> CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
> =

> #
> # Texas Instruments shared transport line discipline
> #
> CONFIG_TI_ST=3Dy
> # end of Texas Instruments shared transport line discipline
> =

> CONFIG_SENSORS_LIS3_I2C=3Dy
> # CONFIG_ALTERA_STAPL is not set
> CONFIG_INTEL_MEI=3Dy
> CONFIG_INTEL_MEI_ME=3Dy
> CONFIG_INTEL_MEI_TXE=3Dy
> # CONFIG_INTEL_MEI_HDCP is not set
> # CONFIG_VMWARE_VMCI is not set
> =

> #
> # Intel MIC & related support
> #
> # CONFIG_VOP_BUS is not set
> # end of Intel MIC & related support
> =

> # CONFIG_ECHO is not set
> # CONFIG_MISC_ALCOR_PCI is not set
> CONFIG_MISC_RTSX_PCI=3Dy
> CONFIG_MISC_RTSX_USB=3Dy
> # CONFIG_HABANA_AI is not set
> # end of Misc devices
> =

> CONFIG_HAVE_IDE=3Dy
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> # end of SCSI device support
> =

> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> CONFIG_FIREWIRE=3Dy
> # CONFIG_FIREWIRE_OHCI is not set
> # CONFIG_FIREWIRE_NET is not set
> CONFIG_FIREWIRE_NOSY=3Dy
> # end of IEEE 1394 (FireWire) support
> =

> CONFIG_MACINTOSH_DRIVERS=3Dy
> # CONFIG_MAC_EMUMOUSEBTN is not set
> CONFIG_NETDEVICES=3Dy
> CONFIG_NET_CORE=3Dy
> # CONFIG_BONDING is not set
> # CONFIG_DUMMY is not set
> # CONFIG_WIREGUARD is not set
> # CONFIG_EQUALIZER is not set
> # CONFIG_NET_TEAM is not set
> # CONFIG_MACVLAN is not set
> # CONFIG_IPVLAN is not set
> # CONFIG_VXLAN is not set
> # CONFIG_GENEVE is not set
> # CONFIG_BAREUDP is not set
> # CONFIG_GTP is not set
> # CONFIG_MACSEC is not set
> # CONFIG_NETCONSOLE is not set
> # CONFIG_RIONET is not set
> # CONFIG_TUN is not set
> # CONFIG_TUN_VNET_CROSS_LE is not set
> # CONFIG_VETH is not set
> # CONFIG_VIRTIO_NET is not set
> # CONFIG_NLMON is not set
> # CONFIG_ARCNET is not set
> CONFIG_ATM_DRIVERS=3Dy
> # CONFIG_ATM_DUMMY is not set
> # CONFIG_ATM_TCP is not set
> # CONFIG_ATM_LANAI is not set
> # CONFIG_ATM_ENI is not set
> # CONFIG_ATM_FIRESTREAM is not set
> # CONFIG_ATM_ZATM is not set
> # CONFIG_ATM_NICSTAR is not set
> # CONFIG_ATM_IDT77252 is not set
> # CONFIG_ATM_AMBASSADOR is not set
> # CONFIG_ATM_HORIZON is not set
> # CONFIG_ATM_IA is not set
> # CONFIG_ATM_FORE200E is not set
> # CONFIG_ATM_HE is not set
> # CONFIG_ATM_SOLOS is not set
> # CONFIG_CAIF_DRIVERS is not set
> =

> #
> # Distributed Switch Architecture drivers
> #
> # end of Distributed Switch Architecture drivers
> =

> CONFIG_ETHERNET=3Dy
> CONFIG_NET_VENDOR_3COM=3Dy
> # CONFIG_VORTEX is not set
> # CONFIG_TYPHOON is not set
> CONFIG_NET_VENDOR_ADAPTEC=3Dy
> # CONFIG_ADAPTEC_STARFIRE is not set
> CONFIG_NET_VENDOR_AGERE=3Dy
> # CONFIG_ET131X is not set
> CONFIG_NET_VENDOR_ALACRITECH=3Dy
> # CONFIG_SLICOSS is not set
> CONFIG_NET_VENDOR_ALTEON=3Dy
> # CONFIG_ACENIC is not set
> # CONFIG_ALTERA_TSE is not set
> CONFIG_NET_VENDOR_AMAZON=3Dy
> CONFIG_NET_VENDOR_AMD=3Dy
> # CONFIG_AMD8111_ETH is not set
> # CONFIG_PCNET32 is not set
> # CONFIG_AMD_XGBE is not set
> CONFIG_NET_VENDOR_AQUANTIA=3Dy
> CONFIG_NET_VENDOR_ARC=3Dy
> CONFIG_NET_VENDOR_ATHEROS=3Dy
> # CONFIG_ATL2 is not set
> # CONFIG_ATL1 is not set
> # CONFIG_ATL1E is not set
> # CONFIG_ATL1C is not set
> # CONFIG_ALX is not set
> CONFIG_NET_VENDOR_AURORA=3Dy
> # CONFIG_AURORA_NB8800 is not set
> CONFIG_NET_VENDOR_BROADCOM=3Dy
> # CONFIG_B44 is not set
> # CONFIG_BCMGENET is not set
> # CONFIG_BNX2 is not set
> # CONFIG_CNIC is not set
> # CONFIG_TIGON3 is not set
> # CONFIG_BNX2X is not set
> # CONFIG_SYSTEMPORT is not set
> # CONFIG_BNXT is not set
> CONFIG_NET_VENDOR_BROCADE=3Dy
> # CONFIG_BNA is not set
> CONFIG_NET_VENDOR_CADENCE=3Dy
> # CONFIG_MACB is not set
> CONFIG_NET_VENDOR_CAVIUM=3Dy
> CONFIG_NET_VENDOR_CHELSIO=3Dy
> # CONFIG_CHELSIO_T1 is not set
> # CONFIG_CHELSIO_T3 is not set
> # CONFIG_CHELSIO_T4 is not set
> # CONFIG_CHELSIO_T4VF is not set
> CONFIG_NET_VENDOR_CISCO=3Dy
> # CONFIG_ENIC is not set
> CONFIG_NET_VENDOR_CORTINA=3Dy
> # CONFIG_CX_ECAT is not set
> # CONFIG_DNET is not set
> CONFIG_NET_VENDOR_DEC=3Dy
> # CONFIG_NET_TULIP is not set
> CONFIG_NET_VENDOR_DLINK=3Dy
> # CONFIG_DL2K is not set
> # CONFIG_SUNDANCE is not set
> CONFIG_NET_VENDOR_EMULEX=3Dy
> # CONFIG_BE2NET is not set
> CONFIG_NET_VENDOR_EZCHIP=3Dy
> CONFIG_NET_VENDOR_GOOGLE=3Dy
> CONFIG_NET_VENDOR_HUAWEI=3Dy
> CONFIG_NET_VENDOR_I825XX=3Dy
> CONFIG_NET_VENDOR_INTEL=3Dy
> # CONFIG_E100 is not set
> CONFIG_E1000=3Dy
> # CONFIG_E1000E is not set
> # CONFIG_IGB is not set
> # CONFIG_IGBVF is not set
> # CONFIG_IXGB is not set
> # CONFIG_IXGBE is not set
> # CONFIG_I40E is not set
> # CONFIG_IGC is not set
> # CONFIG_JME is not set
> CONFIG_NET_VENDOR_MARVELL=3Dy
> # CONFIG_MVMDIO is not set
> # CONFIG_SKGE is not set
> # CONFIG_SKY2 is not set
> CONFIG_NET_VENDOR_MELLANOX=3Dy
> # CONFIG_MLX4_EN is not set
> # CONFIG_MLX5_CORE is not set
> # CONFIG_MLXSW_CORE is not set
> # CONFIG_MLXFW is not set
> CONFIG_NET_VENDOR_MICREL=3Dy
> # CONFIG_KS8851_MLL is not set
> # CONFIG_KSZ884X_PCI is not set
> CONFIG_NET_VENDOR_MICROCHIP=3Dy
> # CONFIG_LAN743X is not set
> CONFIG_NET_VENDOR_MICROSEMI=3Dy
> CONFIG_NET_VENDOR_MYRI=3Dy
> # CONFIG_MYRI10GE is not set
> # CONFIG_FEALNX is not set
> CONFIG_NET_VENDOR_NATSEMI=3Dy
> # CONFIG_NATSEMI is not set
> # CONFIG_NS83820 is not set
> CONFIG_NET_VENDOR_NETERION=3Dy
> # CONFIG_S2IO is not set
> # CONFIG_VXGE is not set
> CONFIG_NET_VENDOR_NETRONOME=3Dy
> CONFIG_NET_VENDOR_NI=3Dy
> # CONFIG_NI_XGE_MANAGEMENT_ENET is not set
> CONFIG_NET_VENDOR_8390=3Dy
> # CONFIG_NE2K_PCI is not set
> CONFIG_NET_VENDOR_NVIDIA=3Dy
> # CONFIG_FORCEDETH is not set
> CONFIG_NET_VENDOR_OKI=3Dy
> # CONFIG_PCH_GBE is not set
> # CONFIG_ETHOC is not set
> CONFIG_NET_VENDOR_PACKET_ENGINES=3Dy
> # CONFIG_HAMACHI is not set
> # CONFIG_YELLOWFIN is not set
> CONFIG_NET_VENDOR_PENSANDO=3Dy
> CONFIG_NET_VENDOR_QLOGIC=3Dy
> # CONFIG_QLA3XXX is not set
> # CONFIG_QLCNIC is not set
> # CONFIG_NETXEN_NIC is not set
> # CONFIG_QED is not set
> CONFIG_NET_VENDOR_QUALCOMM=3Dy
> # CONFIG_QCOM_EMAC is not set
> # CONFIG_RMNET is not set
> CONFIG_NET_VENDOR_RDC=3Dy
> # CONFIG_R6040 is not set
> CONFIG_NET_VENDOR_REALTEK=3Dy
> # CONFIG_ATP is not set
> # CONFIG_8139CP is not set
> # CONFIG_8139TOO is not set
> # CONFIG_R8169 is not set
> CONFIG_NET_VENDOR_RENESAS=3Dy
> CONFIG_NET_VENDOR_ROCKER=3Dy
> CONFIG_NET_VENDOR_SAMSUNG=3Dy
> # CONFIG_SXGBE_ETH is not set
> CONFIG_NET_VENDOR_SEEQ=3Dy
> CONFIG_NET_VENDOR_SOLARFLARE=3Dy
> # CONFIG_SFC is not set
> # CONFIG_SFC_FALCON is not set
> CONFIG_NET_VENDOR_SILAN=3Dy
> # CONFIG_SC92031 is not set
> CONFIG_NET_VENDOR_SIS=3Dy
> # CONFIG_SIS900 is not set
> # CONFIG_SIS190 is not set
> CONFIG_NET_VENDOR_SMSC=3Dy
> # CONFIG_EPIC100 is not set
> # CONFIG_SMSC911X is not set
> # CONFIG_SMSC9420 is not set
> CONFIG_NET_VENDOR_SOCIONEXT=3Dy
> CONFIG_NET_VENDOR_STMICRO=3Dy
> # CONFIG_STMMAC_ETH is not set
> CONFIG_NET_VENDOR_SUN=3Dy
> # CONFIG_HAPPYMEAL is not set
> # CONFIG_SUNGEM is not set
> # CONFIG_CASSINI is not set
> # CONFIG_NIU is not set
> CONFIG_NET_VENDOR_SYNOPSYS=3Dy
> # CONFIG_DWC_XLGMAC is not set
> CONFIG_NET_VENDOR_TEHUTI=3Dy
> # CONFIG_TEHUTI is not set
> CONFIG_NET_VENDOR_TI=3Dy
> # CONFIG_TI_CPSW_PHY_SEL is not set
> # CONFIG_TLAN is not set
> CONFIG_NET_VENDOR_VIA=3Dy
> # CONFIG_VIA_RHINE is not set
> # CONFIG_VIA_VELOCITY is not set
> CONFIG_NET_VENDOR_WIZNET=3Dy
> # CONFIG_WIZNET_W5100 is not set
> # CONFIG_WIZNET_W5300 is not set
> CONFIG_NET_VENDOR_XILINX=3Dy
> # CONFIG_XILINX_AXI_EMAC is not set
> # CONFIG_XILINX_LL_TEMAC is not set
> # CONFIG_FDDI is not set
> # CONFIG_HIPPI is not set
> # CONFIG_NET_SB1000 is not set
> # CONFIG_MDIO_DEVICE is not set
> # CONFIG_PHYLIB is not set
> # CONFIG_PLIP is not set
> # CONFIG_PPP is not set
> # CONFIG_SLIP is not set
> CONFIG_USB_NET_DRIVERS=3Dy
> # CONFIG_USB_CATC is not set
> # CONFIG_USB_KAWETH is not set
> # CONFIG_USB_PEGASUS is not set
> # CONFIG_USB_RTL8150 is not set
> # CONFIG_USB_RTL8152 is not set
> # CONFIG_USB_LAN78XX is not set
> # CONFIG_USB_USBNET is not set
> # CONFIG_USB_HSO is not set
> # CONFIG_USB_IPHETH is not set
> CONFIG_WLAN=3Dy
> # CONFIG_WIRELESS_WDS is not set
> CONFIG_WLAN_VENDOR_ADMTEK=3Dy
> CONFIG_WLAN_VENDOR_ATH=3Dy
> # CONFIG_ATH_DEBUG is not set
> # CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS is not set
> # CONFIG_ATH5K_PCI is not set
> # CONFIG_ATH6KL is not set
> # CONFIG_WIL6210 is not set
> CONFIG_WLAN_VENDOR_ATMEL=3Dy
> # CONFIG_ATMEL is not set
> CONFIG_WLAN_VENDOR_BROADCOM=3Dy
> # CONFIG_BRCMFMAC is not set
> CONFIG_WLAN_VENDOR_CISCO=3Dy
> # CONFIG_AIRO is not set
> CONFIG_WLAN_VENDOR_INTEL=3Dy
> # CONFIG_IPW2100 is not set
> # CONFIG_IPW2200 is not set
> # CONFIG_IWLWIFI is not set
> CONFIG_WLAN_VENDOR_INTERSIL=3Dy
> # CONFIG_HOSTAP is not set
> # CONFIG_HERMES is not set
> # CONFIG_PRISM54 is not set
> CONFIG_WLAN_VENDOR_MARVELL=3Dy
> # CONFIG_LIBERTAS is not set
> # CONFIG_MWIFIEX is not set
> CONFIG_WLAN_VENDOR_MEDIATEK=3Dy
> CONFIG_WLAN_VENDOR_MICROCHIP=3Dy
> CONFIG_WILC1000=3Dy
> CONFIG_WILC1000_SDIO=3Dy
> CONFIG_WILC1000_HW_OOB_INTR=3Dy
> CONFIG_WLAN_VENDOR_RALINK=3Dy
> CONFIG_WLAN_VENDOR_REALTEK=3Dy
> CONFIG_WLAN_VENDOR_RSI=3Dy
> CONFIG_WLAN_VENDOR_ST=3Dy
> CONFIG_WLAN_VENDOR_TI=3Dy
> CONFIG_WLAN_VENDOR_ZYDAS=3Dy
> # CONFIG_USB_ZD1201 is not set
> CONFIG_WLAN_VENDOR_QUANTENNA=3Dy
> # CONFIG_QTNFMAC_PCIE is not set
> # CONFIG_USB_NET_RNDIS_WLAN is not set
> # CONFIG_VIRT_WIFI is not set
> =

> #
> # Enable WiMAX (Networking options) to see the WiMAX drivers
> #
> # CONFIG_WAN is not set
> CONFIG_IEEE802154_DRIVERS=3Dy
> # CONFIG_IEEE802154_FAKELB is not set
> # CONFIG_IEEE802154_ATUSB is not set
> # CONFIG_IEEE802154_HWSIM is not set
> # CONFIG_VMXNET3 is not set
> # CONFIG_FUJITSU_ES is not set
> # CONFIG_NETDEVSIM is not set
> # CONFIG_NET_FAILOVER is not set
> # CONFIG_ISDN is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> CONFIG_INPUT_LEDS=3Dy
> CONFIG_INPUT_FF_MEMLESS=3Dy
> CONFIG_INPUT_POLLDEV=3Dy
> CONFIG_INPUT_SPARSEKMAP=3Dy
> CONFIG_INPUT_MATRIXKMAP=3Dy
> =

> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=3Dy
> CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> CONFIG_INPUT_JOYDEV=3Dy
> # CONFIG_INPUT_EVDEV is not set
> # CONFIG_INPUT_EVBUG is not set
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> CONFIG_KEYBOARD_ADC=3Dy
> CONFIG_KEYBOARD_ADP5588=3Dy
> CONFIG_KEYBOARD_ADP5589=3Dy
> CONFIG_KEYBOARD_ATKBD=3Dy
> # CONFIG_KEYBOARD_QT1050 is not set
> # CONFIG_KEYBOARD_QT1070 is not set
> CONFIG_KEYBOARD_QT2160=3Dy
> CONFIG_KEYBOARD_DLINK_DIR685=3Dy
> # CONFIG_KEYBOARD_LKKBD is not set
> CONFIG_KEYBOARD_GPIO=3Dy
> # CONFIG_KEYBOARD_GPIO_POLLED is not set
> CONFIG_KEYBOARD_TCA6416=3Dy
> CONFIG_KEYBOARD_TCA8418=3Dy
> # CONFIG_KEYBOARD_MATRIX is not set
> CONFIG_KEYBOARD_LM8323=3Dy
> CONFIG_KEYBOARD_LM8333=3Dy
> # CONFIG_KEYBOARD_MAX7359 is not set
> # CONFIG_KEYBOARD_MCS is not set
> CONFIG_KEYBOARD_MPR121=3Dy
> CONFIG_KEYBOARD_NEWTON=3Dy
> # CONFIG_KEYBOARD_OPENCORES is not set
> CONFIG_KEYBOARD_SAMSUNG=3Dy
> CONFIG_KEYBOARD_STOWAWAY=3Dy
> CONFIG_KEYBOARD_SUNKBD=3Dy
> CONFIG_KEYBOARD_TM2_TOUCHKEY=3Dy
> CONFIG_KEYBOARD_TWL4030=3Dy
> CONFIG_KEYBOARD_XTKBD=3Dy
> # CONFIG_KEYBOARD_CROS_EC is not set
> # CONFIG_KEYBOARD_MTK_PMIC is not set
> CONFIG_INPUT_MOUSE=3Dy
> CONFIG_MOUSE_PS2=3Dy
> CONFIG_MOUSE_PS2_ALPS=3Dy
> CONFIG_MOUSE_PS2_BYD=3Dy
> CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
> # CONFIG_MOUSE_PS2_SYNAPTICS is not set
> CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=3Dy
> # CONFIG_MOUSE_PS2_CYPRESS is not set
> CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
> # CONFIG_MOUSE_PS2_ELANTECH is not set
> # CONFIG_MOUSE_PS2_SENTELIC is not set
> CONFIG_MOUSE_PS2_TOUCHKIT=3Dy
> # CONFIG_MOUSE_PS2_FOCALTECH is not set
> # CONFIG_MOUSE_PS2_VMMOUSE is not set
> CONFIG_MOUSE_PS2_SMBUS=3Dy
> CONFIG_MOUSE_SERIAL=3Dy
> # CONFIG_MOUSE_APPLETOUCH is not set
> CONFIG_MOUSE_BCM5974=3Dy
> CONFIG_MOUSE_CYAPA=3Dy
> CONFIG_MOUSE_ELAN_I2C=3Dy
> # CONFIG_MOUSE_ELAN_I2C_I2C is not set
> CONFIG_MOUSE_ELAN_I2C_SMBUS=3Dy
> # CONFIG_MOUSE_VSXXXAA is not set
> # CONFIG_MOUSE_GPIO is not set
> # CONFIG_MOUSE_SYNAPTICS_I2C is not set
> # CONFIG_MOUSE_SYNAPTICS_USB is not set
> CONFIG_INPUT_JOYSTICK=3Dy
> CONFIG_JOYSTICK_ANALOG=3Dy
> CONFIG_JOYSTICK_A3D=3Dy
> CONFIG_JOYSTICK_ADI=3Dy
> CONFIG_JOYSTICK_COBRA=3Dy
> CONFIG_JOYSTICK_GF2K=3Dy
> CONFIG_JOYSTICK_GRIP=3Dy
> CONFIG_JOYSTICK_GRIP_MP=3Dy
> CONFIG_JOYSTICK_GUILLEMOT=3Dy
> CONFIG_JOYSTICK_INTERACT=3Dy
> # CONFIG_JOYSTICK_SIDEWINDER is not set
> # CONFIG_JOYSTICK_TMDC is not set
> CONFIG_JOYSTICK_IFORCE=3Dy
> # CONFIG_JOYSTICK_IFORCE_USB is not set
> CONFIG_JOYSTICK_IFORCE_232=3Dy
> CONFIG_JOYSTICK_WARRIOR=3Dy
> CONFIG_JOYSTICK_MAGELLAN=3Dy
> # CONFIG_JOYSTICK_SPACEORB is not set
> # CONFIG_JOYSTICK_SPACEBALL is not set
> CONFIG_JOYSTICK_STINGER=3Dy
> CONFIG_JOYSTICK_TWIDJOY=3Dy
> CONFIG_JOYSTICK_ZHENHUA=3Dy
> CONFIG_JOYSTICK_DB9=3Dy
> CONFIG_JOYSTICK_GAMECON=3Dy
> # CONFIG_JOYSTICK_TURBOGRAFX is not set
> # CONFIG_JOYSTICK_AS5011 is not set
> CONFIG_JOYSTICK_JOYDUMP=3Dy
> CONFIG_JOYSTICK_XPAD=3Dy
> # CONFIG_JOYSTICK_XPAD_FF is not set
> CONFIG_JOYSTICK_XPAD_LEDS=3Dy
> CONFIG_JOYSTICK_PXRC=3Dy
> # CONFIG_JOYSTICK_FSIA6B is not set
> CONFIG_INPUT_TABLET=3Dy
> # CONFIG_TABLET_USB_ACECAD is not set
> CONFIG_TABLET_USB_AIPTEK=3Dy
> CONFIG_TABLET_USB_GTCO=3Dy
> # CONFIG_TABLET_USB_HANWANG is not set
> # CONFIG_TABLET_USB_KBTAB is not set
> # CONFIG_TABLET_USB_PEGASUS is not set
> # CONFIG_TABLET_SERIAL_WACOM4 is not set
> # CONFIG_INPUT_TOUCHSCREEN is not set
> CONFIG_INPUT_MISC=3Dy
> CONFIG_INPUT_88PM860X_ONKEY=3Dy
> # CONFIG_INPUT_88PM80X_ONKEY is not set
> # CONFIG_INPUT_AD714X is not set
> # CONFIG_INPUT_BMA150 is not set
> CONFIG_INPUT_E3X0_BUTTON=3Dy
> CONFIG_INPUT_PCSPKR=3Dy
> CONFIG_INPUT_MAX8925_ONKEY=3Dy
> CONFIG_INPUT_MC13783_PWRBUTTON=3Dy
> # CONFIG_INPUT_MMA8450 is not set
> # CONFIG_INPUT_APANEL is not set
> CONFIG_INPUT_GPIO_BEEPER=3Dy
> CONFIG_INPUT_GPIO_DECODER=3Dy
> # CONFIG_INPUT_GPIO_VIBRA is not set
> # CONFIG_INPUT_WISTRON_BTNS is not set
> # CONFIG_INPUT_ATLAS_BTNS is not set
> # CONFIG_INPUT_ATI_REMOTE2 is not set
> CONFIG_INPUT_KEYSPAN_REMOTE=3Dy
> # CONFIG_INPUT_KXTJ9 is not set
> CONFIG_INPUT_POWERMATE=3Dy
> # CONFIG_INPUT_YEALINK is not set
> CONFIG_INPUT_CM109=3Dy
> CONFIG_INPUT_REGULATOR_HAPTIC=3Dy
> CONFIG_INPUT_AXP20X_PEK=3Dy
> CONFIG_INPUT_TWL4030_PWRBUTTON=3Dy
> CONFIG_INPUT_TWL4030_VIBRA=3Dy
> CONFIG_INPUT_TWL6040_VIBRA=3Dy
> CONFIG_INPUT_UINPUT=3Dy
> # CONFIG_INPUT_PCF50633_PMU is not set
> CONFIG_INPUT_PCF8574=3Dy
> # CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
> CONFIG_INPUT_DA9063_ONKEY=3Dy
> CONFIG_INPUT_ADXL34X=3Dy
> CONFIG_INPUT_ADXL34X_I2C=3Dy
> CONFIG_INPUT_IMS_PCU=3Dy
> # CONFIG_INPUT_IQS269A is not set
> CONFIG_INPUT_CMA3000=3Dy
> # CONFIG_INPUT_CMA3000_I2C is not set
> CONFIG_INPUT_IDEAPAD_SLIDEBAR=3Dy
> CONFIG_INPUT_SOC_BUTTON_ARRAY=3Dy
> # CONFIG_INPUT_DRV260X_HAPTICS is not set
> # CONFIG_INPUT_DRV2665_HAPTICS is not set
> # CONFIG_INPUT_DRV2667_HAPTICS is not set
> CONFIG_INPUT_RAVE_SP_PWRBUTTON=3Dy
> CONFIG_RMI4_CORE=3Dy
> # CONFIG_RMI4_I2C is not set
> # CONFIG_RMI4_SMB is not set
> CONFIG_RMI4_F03=3Dy
> CONFIG_RMI4_F03_SERIO=3Dy
> CONFIG_RMI4_2D_SENSOR=3Dy
> CONFIG_RMI4_F11=3Dy
> CONFIG_RMI4_F12=3Dy
> CONFIG_RMI4_F30=3Dy
> # CONFIG_RMI4_F34 is not set
> CONFIG_RMI4_F55=3Dy
> =

> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> CONFIG_SERIO_I8042=3Dy
> CONFIG_SERIO_SERPORT=3Dy
> CONFIG_SERIO_CT82C710=3Dy
> # CONFIG_SERIO_PARKBD is not set
> CONFIG_SERIO_PCIPS2=3Dy
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dy
> CONFIG_SERIO_ALTERA_PS2=3Dy
> # CONFIG_SERIO_PS2MULT is not set
> CONFIG_SERIO_ARC_PS2=3Dy
> CONFIG_SERIO_GPIO_PS2=3Dy
> CONFIG_USERIO=3Dy
> CONFIG_GAMEPORT=3Dy
> CONFIG_GAMEPORT_NS558=3Dy
> CONFIG_GAMEPORT_L4=3Dy
> CONFIG_GAMEPORT_EMU10K1=3Dy
> # CONFIG_GAMEPORT_FM801 is not set
> # end of Hardware I/O ports
> # end of Input device support
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> # CONFIG_VT is not set
> CONFIG_UNIX98_PTYS=3Dy
> # CONFIG_LEGACY_PTYS is not set
> # CONFIG_LDISC_AUTOLOAD is not set
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=3Dy
> CONFIG_SERIAL_8250=3Dy
> # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> CONFIG_SERIAL_8250_PNP=3Dy
> # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
> CONFIG_SERIAL_8250_FINTEK=3Dy
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_EXAR=3Dy
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> # CONFIG_SERIAL_8250_EXTENDED is not set
> CONFIG_SERIAL_8250_DWLIB=3Dy
> CONFIG_SERIAL_8250_DW=3Dy
> CONFIG_SERIAL_8250_RT288X=3Dy
> CONFIG_SERIAL_8250_LPSS=3Dy
> CONFIG_SERIAL_8250_MID=3Dy
> =

> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_UARTLITE is not set
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> # CONFIG_SERIAL_JSM is not set
> # CONFIG_SERIAL_LANTIQ is not set
> CONFIG_SERIAL_SCCNXP=3Dy
> # CONFIG_SERIAL_SCCNXP_CONSOLE is not set
> CONFIG_SERIAL_SC16IS7XX_CORE=3Dy
> CONFIG_SERIAL_SC16IS7XX=3Dy
> CONFIG_SERIAL_SC16IS7XX_I2C=3Dy
> # CONFIG_SERIAL_TIMBERDALE is not set
> CONFIG_SERIAL_ALTERA_JTAGUART=3Dy
> CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=3Dy
> CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS=3Dy
> # CONFIG_SERIAL_ALTERA_UART is not set
> CONFIG_SERIAL_PCH_UART=3Dy
> # CONFIG_SERIAL_PCH_UART_CONSOLE is not set
> CONFIG_SERIAL_ARC=3Dy
> # CONFIG_SERIAL_ARC_CONSOLE is not set
> CONFIG_SERIAL_ARC_NR_PORTS=3D1
> CONFIG_SERIAL_RP2=3Dy
> CONFIG_SERIAL_RP2_NR_UARTS=3D32
> CONFIG_SERIAL_FSL_LPUART=3Dy
> CONFIG_SERIAL_FSL_LPUART_CONSOLE=3Dy
> # CONFIG_SERIAL_FSL_LINFLEXUART is not set
> # CONFIG_SERIAL_SPRD is not set
> # end of Serial drivers
> =

> CONFIG_SERIAL_MCTRL_GPIO=3Dy
> CONFIG_SERIAL_NONSTANDARD=3Dy
> CONFIG_ROCKETPORT=3Dy
> # CONFIG_CYCLADES is not set
> CONFIG_MOXA_INTELLIO=3Dy
> CONFIG_MOXA_SMARTIO=3Dy
> # CONFIG_SYNCLINK is not set
> CONFIG_SYNCLINKMP=3Dy
> CONFIG_SYNCLINK_GT=3Dy
> CONFIG_ISI=3Dy
> # CONFIG_N_HDLC is not set
> CONFIG_N_GSM=3Dy
> CONFIG_NOZOMI=3Dy
> # CONFIG_NULL_TTY is not set
> # CONFIG_TRACE_ROUTER is not set
> CONFIG_TRACE_SINK=3Dy
> CONFIG_HVC_DRIVER=3Dy
> CONFIG_SERIAL_DEV_BUS=3Dy
> # CONFIG_SERIAL_DEV_CTRL_TTYPORT is not set
> CONFIG_TTY_PRINTK=3Dy
> CONFIG_TTY_PRINTK_LEVEL=3D6
> # CONFIG_PRINTER is not set
> CONFIG_PPDEV=3Dy
> CONFIG_VIRTIO_CONSOLE=3Dy
> CONFIG_IPMI_HANDLER=3Dy
> CONFIG_IPMI_PLAT_DATA=3Dy
> # CONFIG_IPMI_PANIC_EVENT is not set
> # CONFIG_IPMI_DEVICE_INTERFACE is not set
> CONFIG_IPMI_SI=3Dy
> CONFIG_IPMI_SSIF=3Dy
> # CONFIG_IPMI_WATCHDOG is not set
> CONFIG_IPMI_POWEROFF=3Dy
> # CONFIG_IPMB_DEVICE_INTERFACE is not set
> # CONFIG_HW_RANDOM is not set
> CONFIG_APPLICOM=3Dy
> # CONFIG_SONYPI is not set
> CONFIG_MWAVE=3Dy
> CONFIG_SCx200_GPIO=3Dy
> CONFIG_PC8736x_GPIO=3Dy
> CONFIG_NSC_GPIO=3Dy
> CONFIG_DEVMEM=3Dy
> CONFIG_DEVKMEM=3Dy
> # CONFIG_NVRAM is not set
> CONFIG_DEVPORT=3Dy
> # CONFIG_HPET is not set
> CONFIG_HANGCHECK_TIMER=3Dy
> # CONFIG_TCG_TPM is not set
> # CONFIG_TELCLOCK is not set
> CONFIG_XILLYBUS=3Dy
> # end of Character devices
> =

> # CONFIG_RANDOM_TRUST_BOOTLOADER is not set
> =

> #
> # I2C support
> #
> CONFIG_I2C=3Dy
> CONFIG_ACPI_I2C_OPREGION=3Dy
> CONFIG_I2C_BOARDINFO=3Dy
> # CONFIG_I2C_COMPAT is not set
> CONFIG_I2C_CHARDEV=3Dy
> # CONFIG_I2C_MUX is not set
> CONFIG_I2C_HELPER_AUTO=3Dy
> CONFIG_I2C_SMBUS=3Dy
> CONFIG_I2C_ALGOBIT=3Dy
> CONFIG_I2C_ALGOPCA=3Dy
> =

> #
> # I2C Hardware Bus support
> #
> =

> #
> # PC SMBus host controller drivers
> #
> CONFIG_I2C_ALI1535=3Dy
> # CONFIG_I2C_ALI1563 is not set
> CONFIG_I2C_ALI15X3=3Dy
> # CONFIG_I2C_AMD756 is not set
> # CONFIG_I2C_AMD8111 is not set
> # CONFIG_I2C_AMD_MP2 is not set
> CONFIG_I2C_I801=3Dy
> CONFIG_I2C_ISCH=3Dy
> CONFIG_I2C_ISMT=3Dy
> CONFIG_I2C_PIIX4=3Dy
> # CONFIG_I2C_NFORCE2 is not set
> # CONFIG_I2C_NVIDIA_GPU is not set
> # CONFIG_I2C_SIS5595 is not set
> # CONFIG_I2C_SIS630 is not set
> # CONFIG_I2C_SIS96X is not set
> CONFIG_I2C_VIA=3Dy
> # CONFIG_I2C_VIAPRO is not set
> =

> #
> # ACPI drivers
> #
> # CONFIG_I2C_SCMI is not set
> =

> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> # CONFIG_I2C_CBUS_GPIO is not set
> CONFIG_I2C_DESIGNWARE_CORE=3Dy
> CONFIG_I2C_DESIGNWARE_SLAVE=3Dy
> CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
> # CONFIG_I2C_DESIGNWARE_BAYTRAIL is not set
> CONFIG_I2C_DESIGNWARE_PCI=3Dy
> CONFIG_I2C_EG20T=3Dy
> # CONFIG_I2C_EMEV2 is not set
> # CONFIG_I2C_GPIO is not set
> CONFIG_I2C_OCORES=3Dy
> CONFIG_I2C_PCA_PLATFORM=3Dy
> CONFIG_I2C_SIMTEC=3Dy
> # CONFIG_I2C_XILINX is not set
> =

> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_DIOLAN_U2C=3Dy
> CONFIG_I2C_PARPORT=3Dy
> CONFIG_I2C_ROBOTFUZZ_OSIF=3Dy
> # CONFIG_I2C_TAOS_EVM is not set
> CONFIG_I2C_TINY_USB=3Dy
> CONFIG_I2C_VIPERBOARD=3Dy
> =

> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_CROS_EC_TUNNEL=3Dy
> CONFIG_SCx200_ACB=3Dy
> # end of I2C Hardware Bus support
> =

> # CONFIG_I2C_STUB is not set
> CONFIG_I2C_SLAVE=3Dy
> CONFIG_I2C_SLAVE_EEPROM=3Dy
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # end of I2C support
> =

> # CONFIG_I3C is not set
> # CONFIG_SPI is not set
> CONFIG_SPMI=3Dy
> CONFIG_HSI=3Dy
> CONFIG_HSI_BOARDINFO=3Dy
> =

> #
> # HSI controllers
> #
> =

> #
> # HSI clients
> #
> CONFIG_HSI_CHAR=3Dy
> # CONFIG_PPS is not set
> =

> #
> # PTP clock support
> #
> # CONFIG_PTP_1588_CLOCK is not set
> =

> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> CONFIG_PTP_1588_CLOCK_PCH=3Dy
> # end of PTP clock support
> =

> CONFIG_PINCTRL=3Dy
> CONFIG_PINMUX=3Dy
> CONFIG_PINCONF=3Dy
> CONFIG_GENERIC_PINCONF=3Dy
> CONFIG_DEBUG_PINCTRL=3Dy
> CONFIG_PINCTRL_AMD=3Dy
> # CONFIG_PINCTRL_MCP23S08 is not set
> CONFIG_PINCTRL_SX150X=3Dy
> # CONFIG_PINCTRL_BAYTRAIL is not set
> # CONFIG_PINCTRL_CHERRYVIEW is not set
> # CONFIG_PINCTRL_LYNXPOINT is not set
> # CONFIG_PINCTRL_BROXTON is not set
> # CONFIG_PINCTRL_CANNONLAKE is not set
> # CONFIG_PINCTRL_CEDARFORK is not set
> # CONFIG_PINCTRL_DENVERTON is not set
> # CONFIG_PINCTRL_EMMITSBURG is not set
> # CONFIG_PINCTRL_GEMINILAKE is not set
> # CONFIG_PINCTRL_ICELAKE is not set
> # CONFIG_PINCTRL_JASPERLAKE is not set
> # CONFIG_PINCTRL_LEWISBURG is not set
> # CONFIG_PINCTRL_SUNRISEPOINT is not set
> # CONFIG_PINCTRL_TIGERLAKE is not set
> CONFIG_PINCTRL_MADERA=3Dy
> CONFIG_PINCTRL_CS47L90=3Dy
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> CONFIG_DEBUG_GPIO=3Dy
> # CONFIG_GPIO_SYSFS is not set
> CONFIG_GPIO_GENERIC=3Dy
> =

> #
> # Memory mapped GPIO drivers
> #
> # CONFIG_GPIO_AMDPT is not set
> CONFIG_GPIO_DWAPB=3Dy
> # CONFIG_GPIO_EXAR is not set
> # CONFIG_GPIO_GENERIC_PLATFORM is not set
> # CONFIG_GPIO_ICH is not set
> # CONFIG_GPIO_MB86S7X is not set
> CONFIG_GPIO_VX855=3Dy
> # CONFIG_GPIO_XILINX is not set
> # CONFIG_GPIO_AMD_FCH is not set
> # end of Memory mapped GPIO drivers
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> CONFIG_GPIO_F7188X=3Dy
> CONFIG_GPIO_IT87=3Dy
> # CONFIG_GPIO_SCH is not set
> CONFIG_GPIO_SCH311X=3Dy
> CONFIG_GPIO_WINBOND=3Dy
> CONFIG_GPIO_WS16C48=3Dy
> # end of Port-mapped I/O GPIO drivers
> =

> #
> # I2C GPIO expanders
> #
> # CONFIG_GPIO_ADP5588 is not set
> # CONFIG_GPIO_MAX7300 is not set
> # CONFIG_GPIO_MAX732X is not set
> CONFIG_GPIO_PCA953X=3Dy
> CONFIG_GPIO_PCA953X_IRQ=3Dy
> # CONFIG_GPIO_PCA9570 is not set
> # CONFIG_GPIO_PCF857X is not set
> CONFIG_GPIO_TPIC2810=3Dy
> # end of I2C GPIO expanders
> =

> #
> # MFD GPIO expanders
> #
> CONFIG_GPIO_ARIZONA=3Dy
> CONFIG_GPIO_BD9571MWV=3Dy
> CONFIG_GPIO_CS5535=3Dy
> # CONFIG_GPIO_JANZ_TTL is not set
> CONFIG_GPIO_LP873X=3Dy
> CONFIG_GPIO_MADERA=3Dy
> # CONFIG_GPIO_RC5T583 is not set
> CONFIG_GPIO_TIMBERDALE=3Dy
> # CONFIG_GPIO_TPS65086 is not set
> # CONFIG_GPIO_TPS65910 is not set
> CONFIG_GPIO_TPS65912=3Dy
> CONFIG_GPIO_TWL4030=3Dy
> # CONFIG_GPIO_TWL6040 is not set
> # CONFIG_GPIO_WM8994 is not set
> # end of MFD GPIO expanders
> =

> #
> # PCI GPIO expanders
> #
> CONFIG_GPIO_AMD8111=3Dy
> CONFIG_GPIO_BT8XX=3Dy
> # CONFIG_GPIO_ML_IOH is not set
> CONFIG_GPIO_PCH=3Dy
> CONFIG_GPIO_PCI_IDIO_16=3Dy
> CONFIG_GPIO_PCIE_IDIO_24=3Dy
> CONFIG_GPIO_RDC321X=3Dy
> # end of PCI GPIO expanders
> =

> #
> # USB GPIO expanders
> #
> # CONFIG_GPIO_VIPERBOARD is not set
> # end of USB GPIO expanders
> =

> # CONFIG_GPIO_AGGREGATOR is not set
> # CONFIG_GPIO_MOCKUP is not set
> CONFIG_W1=3Dy
> CONFIG_W1_CON=3Dy
> =

> #
> # 1-wire Bus Masters
> #
> # CONFIG_W1_MASTER_MATROX is not set
> # CONFIG_W1_MASTER_DS2490 is not set
> # CONFIG_W1_MASTER_DS2482 is not set
> # CONFIG_W1_MASTER_DS1WM is not set
> CONFIG_W1_MASTER_GPIO=3Dy
> # CONFIG_W1_MASTER_SGI is not set
> # end of 1-wire Bus Masters
> =

> #
> # 1-wire Slaves
> #
> # CONFIG_W1_SLAVE_THERM is not set
> # CONFIG_W1_SLAVE_SMEM is not set
> # CONFIG_W1_SLAVE_DS2405 is not set
> CONFIG_W1_SLAVE_DS2408=3Dy
> CONFIG_W1_SLAVE_DS2408_READBACK=3Dy
> CONFIG_W1_SLAVE_DS2413=3Dy
> CONFIG_W1_SLAVE_DS2406=3Dy
> # CONFIG_W1_SLAVE_DS2423 is not set
> CONFIG_W1_SLAVE_DS2805=3Dy
> # CONFIG_W1_SLAVE_DS2430 is not set
> CONFIG_W1_SLAVE_DS2431=3Dy
> # CONFIG_W1_SLAVE_DS2433 is not set
> CONFIG_W1_SLAVE_DS2438=3Dy
> # CONFIG_W1_SLAVE_DS250X is not set
> # CONFIG_W1_SLAVE_DS2780 is not set
> CONFIG_W1_SLAVE_DS2781=3Dy
> # CONFIG_W1_SLAVE_DS28E04 is not set
> # CONFIG_W1_SLAVE_DS28E17 is not set
> # end of 1-wire Slaves
> =

> # CONFIG_POWER_AVS is not set
> CONFIG_POWER_RESET=3Dy
> # CONFIG_POWER_RESET_MT6323 is not set
> # CONFIG_POWER_RESET_RESTART is not set
> CONFIG_POWER_SUPPLY=3Dy
> CONFIG_POWER_SUPPLY_DEBUG=3Dy
> CONFIG_POWER_SUPPLY_HWMON=3Dy
> CONFIG_PDA_POWER=3Dy
> # CONFIG_GENERIC_ADC_BATTERY is not set
> CONFIG_MAX8925_POWER=3Dy
> # CONFIG_TEST_POWER is not set
> CONFIG_BATTERY_88PM860X=3Dy
> # CONFIG_CHARGER_ADP5061 is not set
> # CONFIG_BATTERY_CW2015 is not set
> # CONFIG_BATTERY_DS2760 is not set
> # CONFIG_BATTERY_DS2780 is not set
> CONFIG_BATTERY_DS2781=3Dy
> # CONFIG_BATTERY_DS2782 is not set
> # CONFIG_BATTERY_SBS is not set
> CONFIG_CHARGER_SBS=3Dy
> CONFIG_BATTERY_BQ27XXX=3Dy
> # CONFIG_BATTERY_BQ27XXX_I2C is not set
> # CONFIG_BATTERY_BQ27XXX_HDQ is not set
> CONFIG_BATTERY_DA9030=3Dy
> # CONFIG_AXP20X_POWER is not set
> # CONFIG_AXP288_CHARGER is not set
> CONFIG_AXP288_FUEL_GAUGE=3Dy
> # CONFIG_BATTERY_MAX17040 is not set
> # CONFIG_BATTERY_MAX17042 is not set
> CONFIG_BATTERY_MAX1721X=3Dy
> CONFIG_BATTERY_TWL4030_MADC=3Dy
> CONFIG_CHARGER_88PM860X=3Dy
> CONFIG_CHARGER_PCF50633=3Dy
> # CONFIG_BATTERY_RX51 is not set
> CONFIG_CHARGER_ISP1704=3Dy
> # CONFIG_CHARGER_MAX8903 is not set
> CONFIG_CHARGER_TWL4030=3Dy
> # CONFIG_CHARGER_LP8727 is not set
> CONFIG_CHARGER_GPIO=3Dy
> CONFIG_CHARGER_MANAGER=3Dy
> # CONFIG_CHARGER_LT3651 is not set
> CONFIG_CHARGER_MAX14577=3Dy
> CONFIG_CHARGER_MAX8998=3Dy
> CONFIG_CHARGER_BQ2415X=3Dy
> CONFIG_CHARGER_BQ24190=3Dy
> CONFIG_CHARGER_BQ24257=3Dy
> # CONFIG_CHARGER_BQ24735 is not set
> # CONFIG_CHARGER_BQ2515X is not set
> CONFIG_CHARGER_BQ25890=3Dy
> CONFIG_CHARGER_SMB347=3Dy
> CONFIG_BATTERY_GAUGE_LTC2941=3Dy
> CONFIG_BATTERY_RT5033=3Dy
> # CONFIG_CHARGER_RT9455 is not set
> # CONFIG_CHARGER_CROS_USBPD is not set
> # CONFIG_CHARGER_BD99954 is not set
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> # CONFIG_HWMON_DEBUG_CHIP is not set
> =

> #
> # Native drivers
> #
> CONFIG_SENSORS_AD7414=3Dy
> CONFIG_SENSORS_AD7418=3Dy
> CONFIG_SENSORS_ADM1021=3Dy
> # CONFIG_SENSORS_ADM1025 is not set
> # CONFIG_SENSORS_ADM1026 is not set
> # CONFIG_SENSORS_ADM1029 is not set
> # CONFIG_SENSORS_ADM1031 is not set
> # CONFIG_SENSORS_ADM1177 is not set
> # CONFIG_SENSORS_ADM9240 is not set
> # CONFIG_SENSORS_ADT7410 is not set
> CONFIG_SENSORS_ADT7411=3Dy
> CONFIG_SENSORS_ADT7462=3Dy
> CONFIG_SENSORS_ADT7470=3Dy
> CONFIG_SENSORS_ADT7475=3Dy
> # CONFIG_SENSORS_AS370 is not set
> CONFIG_SENSORS_ASC7621=3Dy
> # CONFIG_SENSORS_AXI_FAN_CONTROL is not set
> # CONFIG_SENSORS_K8TEMP is not set
> # CONFIG_SENSORS_K10TEMP is not set
> CONFIG_SENSORS_FAM15H_POWER=3Dy
> # CONFIG_SENSORS_AMD_ENERGY is not set
> CONFIG_SENSORS_APPLESMC=3Dy
> CONFIG_SENSORS_ASB100=3Dy
> # CONFIG_SENSORS_ASPEED is not set
> CONFIG_SENSORS_ATXP1=3Dy
> # CONFIG_SENSORS_CORSAIR_CPRO is not set
> # CONFIG_SENSORS_DS620 is not set
> CONFIG_SENSORS_DS1621=3Dy
> CONFIG_SENSORS_DELL_SMM=3Dy
> CONFIG_SENSORS_I5K_AMB=3Dy
> # CONFIG_SENSORS_F71805F is not set
> # CONFIG_SENSORS_F71882FG is not set
> CONFIG_SENSORS_F75375S=3Dy
> CONFIG_SENSORS_MC13783_ADC=3Dy
> CONFIG_SENSORS_FSCHMD=3Dy
> CONFIG_SENSORS_GL518SM=3Dy
> CONFIG_SENSORS_GL520SM=3Dy
> CONFIG_SENSORS_G760A=3Dy
> # CONFIG_SENSORS_G762 is not set
> # CONFIG_SENSORS_HIH6130 is not set
> CONFIG_SENSORS_IBMAEM=3Dy
> CONFIG_SENSORS_IBMPEX=3Dy
> CONFIG_SENSORS_IIO_HWMON=3Dy
> CONFIG_SENSORS_I5500=3Dy
> CONFIG_SENSORS_CORETEMP=3Dy
> # CONFIG_SENSORS_IT87 is not set
> CONFIG_SENSORS_JC42=3Dy
> CONFIG_SENSORS_POWR1220=3Dy
> # CONFIG_SENSORS_LINEAGE is not set
> # CONFIG_SENSORS_LTC2945 is not set
> # CONFIG_SENSORS_LTC2947_I2C is not set
> CONFIG_SENSORS_LTC2990=3Dy
> CONFIG_SENSORS_LTC4151=3Dy
> CONFIG_SENSORS_LTC4215=3Dy
> CONFIG_SENSORS_LTC4222=3Dy
> # CONFIG_SENSORS_LTC4245 is not set
> CONFIG_SENSORS_LTC4260=3Dy
> CONFIG_SENSORS_LTC4261=3Dy
> CONFIG_SENSORS_MAX16065=3Dy
> # CONFIG_SENSORS_MAX1619 is not set
> # CONFIG_SENSORS_MAX1668 is not set
> CONFIG_SENSORS_MAX197=3Dy
> # CONFIG_SENSORS_MAX31730 is not set
> # CONFIG_SENSORS_MAX6621 is not set
> CONFIG_SENSORS_MAX6639=3Dy
> CONFIG_SENSORS_MAX6642=3Dy
> CONFIG_SENSORS_MAX6650=3Dy
> CONFIG_SENSORS_MAX6697=3Dy
> CONFIG_SENSORS_MAX31790=3Dy
> CONFIG_SENSORS_MCP3021=3Dy
> # CONFIG_SENSORS_MLXREG_FAN is not set
> CONFIG_SENSORS_TC654=3Dy
> CONFIG_SENSORS_MENF21BMC_HWMON=3Dy
> # CONFIG_SENSORS_LM63 is not set
> CONFIG_SENSORS_LM73=3Dy
> CONFIG_SENSORS_LM75=3Dy
> CONFIG_SENSORS_LM77=3Dy
> CONFIG_SENSORS_LM78=3Dy
> # CONFIG_SENSORS_LM80 is not set
> CONFIG_SENSORS_LM83=3Dy
> CONFIG_SENSORS_LM85=3Dy
> # CONFIG_SENSORS_LM87 is not set
> # CONFIG_SENSORS_LM90 is not set
> CONFIG_SENSORS_LM92=3Dy
> CONFIG_SENSORS_LM93=3Dy
> # CONFIG_SENSORS_LM95234 is not set
> CONFIG_SENSORS_LM95241=3Dy
> # CONFIG_SENSORS_LM95245 is not set
> # CONFIG_SENSORS_PC87360 is not set
> # CONFIG_SENSORS_PC87427 is not set
> CONFIG_SENSORS_NTC_THERMISTOR=3Dy
> CONFIG_SENSORS_NCT6683=3Dy
> CONFIG_SENSORS_NCT6775=3Dy
> # CONFIG_SENSORS_NCT7802 is not set
> CONFIG_SENSORS_NPCM7XX=3Dy
> CONFIG_SENSORS_PCF8591=3Dy
> CONFIG_PMBUS=3Dy
> # CONFIG_SENSORS_PMBUS is not set
> CONFIG_SENSORS_ADM1275=3Dy
> # CONFIG_SENSORS_BEL_PFE is not set
> CONFIG_SENSORS_IBM_CFFPS=3Dy
> # CONFIG_SENSORS_INSPUR_IPSPS is not set
> # CONFIG_SENSORS_IR35221 is not set
> # CONFIG_SENSORS_IR38064 is not set
> # CONFIG_SENSORS_IRPS5401 is not set
> # CONFIG_SENSORS_ISL68137 is not set
> CONFIG_SENSORS_LM25066=3Dy
> CONFIG_SENSORS_LTC2978=3Dy
> CONFIG_SENSORS_LTC2978_REGULATOR=3Dy
> CONFIG_SENSORS_LTC3815=3Dy
> # CONFIG_SENSORS_MAX16064 is not set
> # CONFIG_SENSORS_MAX16601 is not set
> # CONFIG_SENSORS_MAX20730 is not set
> # CONFIG_SENSORS_MAX20751 is not set
> CONFIG_SENSORS_MAX31785=3Dy
> CONFIG_SENSORS_MAX34440=3Dy
> CONFIG_SENSORS_MAX8688=3Dy
> # CONFIG_SENSORS_PXE1610 is not set
> CONFIG_SENSORS_TPS40422=3Dy
> # CONFIG_SENSORS_TPS53679 is not set
> CONFIG_SENSORS_UCD9000=3Dy
> # CONFIG_SENSORS_UCD9200 is not set
> # CONFIG_SENSORS_XDPE122 is not set
> # CONFIG_SENSORS_ZL6100 is not set
> CONFIG_SENSORS_SHT15=3Dy
> CONFIG_SENSORS_SHT21=3Dy
> CONFIG_SENSORS_SHT3x=3Dy
> CONFIG_SENSORS_SHTC1=3Dy
> # CONFIG_SENSORS_SIS5595 is not set
> # CONFIG_SENSORS_DME1737 is not set
> # CONFIG_SENSORS_EMC1403 is not set
> CONFIG_SENSORS_EMC2103=3Dy
> # CONFIG_SENSORS_EMC6W201 is not set
> CONFIG_SENSORS_SMSC47M1=3Dy
> CONFIG_SENSORS_SMSC47M192=3Dy
> # CONFIG_SENSORS_SMSC47B397 is not set
> # CONFIG_SENSORS_STTS751 is not set
> CONFIG_SENSORS_SMM665=3Dy
> CONFIG_SENSORS_ADC128D818=3Dy
> # CONFIG_SENSORS_ADS7828 is not set
> # CONFIG_SENSORS_AMC6821 is not set
> CONFIG_SENSORS_INA209=3Dy
> CONFIG_SENSORS_INA2XX=3Dy
> CONFIG_SENSORS_INA3221=3Dy
> CONFIG_SENSORS_TC74=3Dy
> CONFIG_SENSORS_THMC50=3Dy
> # CONFIG_SENSORS_TMP102 is not set
> CONFIG_SENSORS_TMP103=3Dy
> CONFIG_SENSORS_TMP108=3Dy
> CONFIG_SENSORS_TMP401=3Dy
> CONFIG_SENSORS_TMP421=3Dy
> # CONFIG_SENSORS_TMP513 is not set
> # CONFIG_SENSORS_VIA_CPUTEMP is not set
> CONFIG_SENSORS_VIA686A=3Dy
> CONFIG_SENSORS_VT1211=3Dy
> # CONFIG_SENSORS_VT8231 is not set
> CONFIG_SENSORS_W83773G=3Dy
> CONFIG_SENSORS_W83781D=3Dy
> CONFIG_SENSORS_W83791D=3Dy
> CONFIG_SENSORS_W83792D=3Dy
> # CONFIG_SENSORS_W83793 is not set
> CONFIG_SENSORS_W83795=3Dy
> CONFIG_SENSORS_W83795_FANCTRL=3Dy
> CONFIG_SENSORS_W83L785TS=3Dy
> CONFIG_SENSORS_W83L786NG=3Dy
> CONFIG_SENSORS_W83627HF=3Dy
> # CONFIG_SENSORS_W83627EHF is not set
> =

> #
> # ACPI drivers
> #
> # CONFIG_SENSORS_ACPI_POWER is not set
> # CONFIG_SENSORS_ATK0110 is not set
> CONFIG_THERMAL=3Dy
> # CONFIG_THERMAL_NETLINK is not set
> # CONFIG_THERMAL_STATISTICS is not set
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> CONFIG_THERMAL_HWMON=3Dy
> CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_GOV_BANG_BANG is not set
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> # CONFIG_THERMAL_EMULATION is not set
> =

> #
> # Intel thermal drivers
> #
> CONFIG_X86_PKG_TEMP_THERMAL=3Dm
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> =

> #
> # ACPI INT340X thermal drivers
> #
> # CONFIG_INT340X_THERMAL is not set
> # end of ACPI INT340X thermal drivers
> =

> # CONFIG_INTEL_PCH_THERMAL is not set
> # end of Intel thermal drivers
> =

> # CONFIG_GENERIC_ADC_THERMAL is not set
> # CONFIG_WATCHDOG is not set
> CONFIG_SSB_POSSIBLE=3Dy
> # CONFIG_SSB is not set
> CONFIG_BCMA_POSSIBLE=3Dy
> CONFIG_BCMA=3Dy
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> CONFIG_BCMA_HOST_PCI=3Dy
> # CONFIG_BCMA_HOST_SOC is not set
> CONFIG_BCMA_DRIVER_PCI=3Dy
> CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> CONFIG_BCMA_DRIVER_GPIO=3Dy
> CONFIG_BCMA_DEBUG=3Dy
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> CONFIG_MFD_CS5535=3Dy
> # CONFIG_MFD_AS3711 is not set
> # CONFIG_PMIC_ADP5520 is not set
> CONFIG_MFD_AAT2870_CORE=3Dy
> CONFIG_MFD_BCM590XX=3Dy
> CONFIG_MFD_BD9571MWV=3Dy
> CONFIG_MFD_AXP20X=3Dy
> CONFIG_MFD_AXP20X_I2C=3Dy
> CONFIG_MFD_CROS_EC_DEV=3Dy
> CONFIG_MFD_MADERA=3Dy
> CONFIG_MFD_MADERA_I2C=3Dy
> # CONFIG_MFD_CS47L15 is not set
> # CONFIG_MFD_CS47L35 is not set
> # CONFIG_MFD_CS47L85 is not set
> CONFIG_MFD_CS47L90=3Dy
> # CONFIG_MFD_CS47L92 is not set
> CONFIG_PMIC_DA903X=3Dy
> # CONFIG_MFD_DA9052_I2C is not set
> # CONFIG_MFD_DA9055 is not set
> # CONFIG_MFD_DA9062 is not set
> CONFIG_MFD_DA9063=3Dy
> # CONFIG_MFD_DA9150 is not set
> # CONFIG_MFD_DLN2 is not set
> CONFIG_MFD_MC13XXX=3Dy
> CONFIG_MFD_MC13XXX_I2C=3Dy
> # CONFIG_MFD_MP2629 is not set
> CONFIG_HTC_PASIC3=3Dy
> # CONFIG_HTC_I2CPLD is not set
> CONFIG_MFD_INTEL_QUARK_I2C_GPIO=3Dy
> # CONFIG_LPC_ICH is not set
> CONFIG_LPC_SCH=3Dy
> # CONFIG_INTEL_SOC_PMIC is not set
> # CONFIG_INTEL_SOC_PMIC_CHTWC is not set
> # CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
> CONFIG_MFD_INTEL_LPSS=3Dy
> # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> CONFIG_MFD_INTEL_LPSS_PCI=3Dy
> # CONFIG_MFD_IQS62X is not set
> CONFIG_MFD_JANZ_CMODIO=3Dy
> # CONFIG_MFD_KEMPLD is not set
> CONFIG_MFD_88PM800=3Dy
> CONFIG_MFD_88PM805=3Dy
> CONFIG_MFD_88PM860X=3Dy
> CONFIG_MFD_MAX14577=3Dy
> # CONFIG_MFD_MAX77693 is not set
> # CONFIG_MFD_MAX77843 is not set
> CONFIG_MFD_MAX8907=3Dy
> CONFIG_MFD_MAX8925=3Dy
> # CONFIG_MFD_MAX8997 is not set
> CONFIG_MFD_MAX8998=3Dy
> # CONFIG_MFD_MT6360 is not set
> CONFIG_MFD_MT6397=3Dy
> CONFIG_MFD_MENF21BMC=3Dy
> CONFIG_MFD_VIPERBOARD=3Dy
> # CONFIG_MFD_RETU is not set
> CONFIG_MFD_PCF50633=3Dy
> CONFIG_PCF50633_ADC=3Dy
> CONFIG_PCF50633_GPIO=3Dy
> CONFIG_MFD_RDC321X=3Dy
> CONFIG_MFD_RT5033=3Dy
> CONFIG_MFD_RC5T583=3Dy
> CONFIG_MFD_SEC_CORE=3Dy
> # CONFIG_MFD_SI476X_CORE is not set
> CONFIG_MFD_SM501=3Dy
> CONFIG_MFD_SM501_GPIO=3Dy
> CONFIG_MFD_SKY81452=3Dy
> CONFIG_ABX500_CORE=3Dy
> CONFIG_AB3100_CORE=3Dy
> CONFIG_AB3100_OTP=3Dy
> CONFIG_MFD_SYSCON=3Dy
> CONFIG_MFD_TI_AM335X_TSCADC=3Dy
> # CONFIG_MFD_LP3943 is not set
> CONFIG_MFD_LP8788=3Dy
> CONFIG_MFD_TI_LMU=3Dy
> # CONFIG_MFD_PALMAS is not set
> CONFIG_TPS6105X=3Dy
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=3Dy
> CONFIG_MFD_TPS65086=3Dy
> # CONFIG_MFD_TPS65090 is not set
> # CONFIG_MFD_TPS68470 is not set
> CONFIG_MFD_TI_LP873X=3Dy
> # CONFIG_MFD_TPS6586X is not set
> CONFIG_MFD_TPS65910=3Dy
> CONFIG_MFD_TPS65912=3Dy
> CONFIG_MFD_TPS65912_I2C=3Dy
> # CONFIG_MFD_TPS80031 is not set
> CONFIG_TWL4030_CORE=3Dy
> CONFIG_MFD_TWL4030_AUDIO=3Dy
> CONFIG_TWL6040_CORE=3Dy
> CONFIG_MFD_WL1273_CORE=3Dy
> CONFIG_MFD_LM3533=3Dy
> CONFIG_MFD_TIMBERDALE=3Dy
> # CONFIG_MFD_TQMX86 is not set
> CONFIG_MFD_VX855=3Dy
> CONFIG_MFD_ARIZONA=3Dy
> CONFIG_MFD_ARIZONA_I2C=3Dy
> CONFIG_MFD_CS47L24=3Dy
> CONFIG_MFD_WM5102=3Dy
> # CONFIG_MFD_WM5110 is not set
> CONFIG_MFD_WM8997=3Dy
> # CONFIG_MFD_WM8998 is not set
> # CONFIG_MFD_WM8400 is not set
> # CONFIG_MFD_WM831X_I2C is not set
> # CONFIG_MFD_WM8350_I2C is not set
> CONFIG_MFD_WM8994=3Dy
> # CONFIG_MFD_WCD934X is not set
> CONFIG_RAVE_SP_CORE=3Dy
> # end of Multifunction device drivers
> =

> CONFIG_REGULATOR=3Dy
> CONFIG_REGULATOR_DEBUG=3Dy
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
> CONFIG_REGULATOR_88PG86X=3Dy
> CONFIG_REGULATOR_88PM800=3Dy
> CONFIG_REGULATOR_88PM8607=3Dy
> # CONFIG_REGULATOR_ACT8865 is not set
> CONFIG_REGULATOR_AD5398=3Dy
> CONFIG_REGULATOR_AAT2870=3Dy
> # CONFIG_REGULATOR_AB3100 is not set
> # CONFIG_REGULATOR_AXP20X is not set
> CONFIG_REGULATOR_BCM590XX=3Dy
> CONFIG_REGULATOR_BD9571MWV=3Dy
> # CONFIG_REGULATOR_DA903X is not set
> # CONFIG_REGULATOR_DA9210 is not set
> CONFIG_REGULATOR_DA9211=3Dy
> # CONFIG_REGULATOR_FAN53555 is not set
> # CONFIG_REGULATOR_GPIO is not set
> # CONFIG_REGULATOR_ISL9305 is not set
> CONFIG_REGULATOR_ISL6271A=3Dy
> # CONFIG_REGULATOR_LM363X is not set
> CONFIG_REGULATOR_LP3971=3Dy
> CONFIG_REGULATOR_LP3972=3Dy
> CONFIG_REGULATOR_LP872X=3Dy
> CONFIG_REGULATOR_LP8755=3Dy
> CONFIG_REGULATOR_LP8788=3Dy
> CONFIG_REGULATOR_LTC3589=3Dy
> # CONFIG_REGULATOR_LTC3676 is not set
> CONFIG_REGULATOR_MAX14577=3Dy
> # CONFIG_REGULATOR_MAX1586 is not set
> CONFIG_REGULATOR_MAX8649=3Dy
> CONFIG_REGULATOR_MAX8660=3Dy
> CONFIG_REGULATOR_MAX8907=3Dy
> # CONFIG_REGULATOR_MAX8925 is not set
> CONFIG_REGULATOR_MAX8952=3Dy
> CONFIG_REGULATOR_MAX8998=3Dy
> # CONFIG_REGULATOR_MAX77826 is not set
> CONFIG_REGULATOR_MC13XXX_CORE=3Dy
> CONFIG_REGULATOR_MC13783=3Dy
> CONFIG_REGULATOR_MC13892=3Dy
> # CONFIG_REGULATOR_MP8859 is not set
> # CONFIG_REGULATOR_MT6311 is not set
> CONFIG_REGULATOR_MT6323=3Dy
> # CONFIG_REGULATOR_MT6358 is not set
> CONFIG_REGULATOR_MT6397=3Dy
> # CONFIG_REGULATOR_PCA9450 is not set
> CONFIG_REGULATOR_PCF50633=3Dy
> # CONFIG_REGULATOR_PFUZE100 is not set
> CONFIG_REGULATOR_PV88060=3Dy
> CONFIG_REGULATOR_PV88080=3Dy
> CONFIG_REGULATOR_PV88090=3Dy
> # CONFIG_REGULATOR_QCOM_SPMI is not set
> # CONFIG_REGULATOR_QCOM_USB_VBUS is not set
> CONFIG_REGULATOR_RC5T583=3Dy
> # CONFIG_REGULATOR_RT5033 is not set
> # CONFIG_REGULATOR_S2MPA01 is not set
> CONFIG_REGULATOR_S2MPS11=3Dy
> # CONFIG_REGULATOR_S5M8767 is not set
> CONFIG_REGULATOR_SKY81452=3Dy
> # CONFIG_REGULATOR_SLG51000 is not set
> CONFIG_REGULATOR_TPS51632=3Dy
> CONFIG_REGULATOR_TPS6105X=3Dy
> CONFIG_REGULATOR_TPS62360=3Dy
> # CONFIG_REGULATOR_TPS65023 is not set
> CONFIG_REGULATOR_TPS6507X=3Dy
> # CONFIG_REGULATOR_TPS65086 is not set
> CONFIG_REGULATOR_TPS65132=3Dy
> CONFIG_REGULATOR_TPS65910=3Dy
> CONFIG_REGULATOR_TPS65912=3Dy
> # CONFIG_REGULATOR_TWL4030 is not set
> CONFIG_REGULATOR_WM8994=3Dy
> # CONFIG_REGULATOR_QCOM_LABIBB is not set
> # CONFIG_RC_CORE is not set
> CONFIG_CEC_CORE=3Dy
> CONFIG_CEC_NOTIFIER=3Dy
> # CONFIG_MEDIA_CEC_SUPPORT is not set
> # CONFIG_MEDIA_SUPPORT is not set
> =

> #
> # Graphics support
> #
> CONFIG_AGP=3Dy
> CONFIG_AGP_ALI=3Dy
> CONFIG_AGP_ATI=3Dy
> CONFIG_AGP_AMD=3Dy
> # CONFIG_AGP_AMD64 is not set
> CONFIG_AGP_INTEL=3Dy
> # CONFIG_AGP_NVIDIA is not set
> CONFIG_AGP_SIS=3Dy
> CONFIG_AGP_SWORKS=3Dy
> CONFIG_AGP_VIA=3Dy
> # CONFIG_AGP_EFFICEON is not set
> CONFIG_INTEL_GTT=3Dy
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D16
> # CONFIG_VGA_SWITCHEROO is not set
> CONFIG_DRM=3Dy
> CONFIG_DRM_MIPI_DSI=3Dy
> CONFIG_DRM_DP_AUX_CHARDEV=3Dy
> CONFIG_DRM_DEBUG_MM=3Dy
> CONFIG_DRM_DEBUG_SELFTEST=3Dy
> CONFIG_DRM_KMS_HELPER=3Dy
> # CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
> # CONFIG_DRM_FBDEV_EMULATION is not set
> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> # CONFIG_DRM_DP_CEC is not set
> CONFIG_DRM_TTM=3Dy
> CONFIG_DRM_TTM_DMA_PAGE_POOL=3Dy
> CONFIG_DRM_VRAM_HELPER=3Dy
> CONFIG_DRM_TTM_HELPER=3Dy
> CONFIG_DRM_GEM_SHMEM_HELPER=3Dy
> CONFIG_DRM_VM=3Dy
> CONFIG_DRM_SCHED=3Dy
> =

> #
> # I2C encoder or helper chips
> #
> CONFIG_DRM_I2C_CH7006=3Dy
> # CONFIG_DRM_I2C_SIL164 is not set
> # CONFIG_DRM_I2C_NXP_TDA998X is not set
> CONFIG_DRM_I2C_NXP_TDA9950=3Dy
> # end of I2C encoder or helper chips
> =

> #
> # ARM devices
> #
> # end of ARM devices
> =

> CONFIG_DRM_RADEON=3Dy
> CONFIG_DRM_RADEON_USERPTR=3Dy
> CONFIG_DRM_AMDGPU=3Dy
> CONFIG_DRM_AMDGPU_SI=3Dy
> # CONFIG_DRM_AMDGPU_CIK is not set
> CONFIG_DRM_AMDGPU_USERPTR=3Dy
> CONFIG_DRM_AMDGPU_GART_DEBUGFS=3Dy
> =

> #
> # ACP (Audio CoProcessor) Configuration
> #
> # CONFIG_DRM_AMD_ACP is not set
> # end of ACP (Audio CoProcessor) Configuration
> =

> #
> # Display Engine Configuration
> #
> # CONFIG_DRM_AMD_DC is not set
> # CONFIG_DRM_AMD_DC_SI is not set
> # end of Display Engine Configuration
> =

> # CONFIG_DRM_NOUVEAU is not set
> CONFIG_DRM_I915=3Dy
> CONFIG_DRM_I915_FORCE_PROBE=3D""
> # CONFIG_DRM_I915_CAPTURE_ERROR is not set
> # CONFIG_DRM_I915_USERPTR is not set
> =

> #
> # drm/i915 Debugging
> #
> # CONFIG_DRM_I915_WERROR is not set
> # CONFIG_DRM_I915_DEBUG is not set
> # CONFIG_DRM_I915_DEBUG_MMIO is not set
> CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS=3Dy
> # CONFIG_DRM_I915_SW_FENCE_CHECK_DAG is not set
> CONFIG_DRM_I915_DEBUG_GUC=3Dy
> CONFIG_DRM_I915_SELFTEST=3Dy
> CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS=3Dy
> # CONFIG_DRM_I915_DEBUG_VBLANK_EVADE is not set
> # CONFIG_DRM_I915_DEBUG_RUNTIME_PM is not set
> # end of drm/i915 Debugging
> =

> #
> # drm/i915 Profile Guided Optimisation
> #
> CONFIG_DRM_I915_FENCE_TIMEOUT=3D10000
> CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=3D250
> CONFIG_DRM_I915_HEARTBEAT_INTERVAL=3D2500
> CONFIG_DRM_I915_PREEMPT_TIMEOUT=3D640
> CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=3D8000
> CONFIG_DRM_I915_STOP_TIMEOUT=3D100
> CONFIG_DRM_I915_TIMESLICE_DURATION=3D1
> # end of drm/i915 Profile Guided Optimisation
> =

> CONFIG_DRM_VGEM=3Dy
> CONFIG_DRM_VKMS=3Dy
> # CONFIG_DRM_VMWGFX is not set
> CONFIG_DRM_GMA500=3Dy
> CONFIG_DRM_GMA600=3Dy
> CONFIG_DRM_GMA3600=3Dy
> CONFIG_DRM_UDL=3Dy
> CONFIG_DRM_AST=3Dy
> # CONFIG_DRM_MGAG200 is not set
> CONFIG_DRM_QXL=3Dy
> CONFIG_DRM_BOCHS=3Dy
> CONFIG_DRM_VIRTIO_GPU=3Dy
> CONFIG_DRM_PANEL=3Dy
> =

> #
> # Display Panels
> #
> CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN=3Dy
> # end of Display Panels
> =

> CONFIG_DRM_BRIDGE=3Dy
> CONFIG_DRM_PANEL_BRIDGE=3Dy
> =

> #
> # Display Interface Bridges
> #
> CONFIG_DRM_ANALOGIX_ANX78XX=3Dy
> CONFIG_DRM_ANALOGIX_DP=3Dy
> # end of Display Interface Bridges
> =

> # CONFIG_DRM_ETNAVIV is not set
> # CONFIG_DRM_CIRRUS_QEMU is not set
> # CONFIG_DRM_GM12U320 is not set
> CONFIG_DRM_VBOXVIDEO=3Dy
> CONFIG_DRM_LEGACY=3Dy
> CONFIG_DRM_TDFX=3Dy
> CONFIG_DRM_R128=3Dy
> CONFIG_DRM_MGA=3Dy
> CONFIG_DRM_SIS=3Dy
> CONFIG_DRM_VIA=3Dy
> CONFIG_DRM_SAVAGE=3Dy
> CONFIG_DRM_EXPORT_FOR_TESTS=3Dy
> CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
> CONFIG_DRM_LIB_RANDOM=3Dy
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB_CMDLINE=3Dy
> CONFIG_FB_NOTIFY=3Dy
> CONFIG_FB=3Dy
> # CONFIG_FIRMWARE_EDID is not set
> CONFIG_FB_DDC=3Dy
> CONFIG_FB_CFB_FILLRECT=3Dy
> CONFIG_FB_CFB_COPYAREA=3Dy
> CONFIG_FB_CFB_IMAGEBLIT=3Dy
> CONFIG_FB_SYS_FILLRECT=3Dy
> CONFIG_FB_SYS_COPYAREA=3Dy
> CONFIG_FB_SYS_IMAGEBLIT=3Dy
> # CONFIG_FB_FOREIGN_ENDIAN is not set
> CONFIG_FB_SYS_FOPS=3Dy
> CONFIG_FB_DEFERRED_IO=3Dy
> CONFIG_FB_SVGALIB=3Dy
> CONFIG_FB_BACKLIGHT=3Dy
> CONFIG_FB_MODE_HELPERS=3Dy
> CONFIG_FB_TILEBLITTING=3Dy
> =

> #
> # Frame buffer hardware drivers
> #
> # CONFIG_FB_CIRRUS is not set
> CONFIG_FB_PM2=3Dy
> # CONFIG_FB_PM2_FIFO_DISCONNECT is not set
> CONFIG_FB_CYBER2000=3Dy
> # CONFIG_FB_CYBER2000_DDC is not set
> CONFIG_FB_ARC=3Dy
> # CONFIG_FB_ASILIANT is not set
> # CONFIG_FB_IMSTT is not set
> # CONFIG_FB_VGA16 is not set
> # CONFIG_FB_UVESA is not set
> # CONFIG_FB_VESA is not set
> # CONFIG_FB_N411 is not set
> CONFIG_FB_HGA=3Dy
> CONFIG_FB_OPENCORES=3Dy
> CONFIG_FB_S1D13XXX=3Dy
> CONFIG_FB_NVIDIA=3Dy
> CONFIG_FB_NVIDIA_I2C=3Dy
> # CONFIG_FB_NVIDIA_DEBUG is not set
> CONFIG_FB_NVIDIA_BACKLIGHT=3Dy
> CONFIG_FB_RIVA=3Dy
> # CONFIG_FB_RIVA_I2C is not set
> # CONFIG_FB_RIVA_DEBUG is not set
> # CONFIG_FB_RIVA_BACKLIGHT is not set
> CONFIG_FB_I740=3Dy
> CONFIG_FB_I810=3Dy
> # CONFIG_FB_I810_GTF is not set
> CONFIG_FB_LE80578=3Dy
> CONFIG_FB_CARILLO_RANCH=3Dy
> # CONFIG_FB_MATROX is not set
> CONFIG_FB_RADEON=3Dy
> CONFIG_FB_RADEON_I2C=3Dy
> # CONFIG_FB_RADEON_BACKLIGHT is not set
> CONFIG_FB_RADEON_DEBUG=3Dy
> # CONFIG_FB_ATY128 is not set
> CONFIG_FB_ATY=3Dy
> CONFIG_FB_ATY_CT=3Dy
> # CONFIG_FB_ATY_GENERIC_LCD is not set
> # CONFIG_FB_ATY_GX is not set
> # CONFIG_FB_ATY_BACKLIGHT is not set
> CONFIG_FB_S3=3Dy
> # CONFIG_FB_S3_DDC is not set
> CONFIG_FB_SAVAGE=3Dy
> # CONFIG_FB_SAVAGE_I2C is not set
> # CONFIG_FB_SAVAGE_ACCEL is not set
> # CONFIG_FB_SIS is not set
> # CONFIG_FB_VIA is not set
> CONFIG_FB_NEOMAGIC=3Dy
> CONFIG_FB_KYRO=3Dy
> CONFIG_FB_3DFX=3Dy
> # CONFIG_FB_3DFX_ACCEL is not set
> CONFIG_FB_3DFX_I2C=3Dy
> # CONFIG_FB_VOODOO1 is not set
> CONFIG_FB_VT8623=3Dy
> CONFIG_FB_TRIDENT=3Dy
> CONFIG_FB_ARK=3Dy
> # CONFIG_FB_PM3 is not set
> # CONFIG_FB_CARMINE is not set
> CONFIG_FB_GEODE=3Dy
> CONFIG_FB_GEODE_LX=3Dy
> # CONFIG_FB_GEODE_GX is not set
> CONFIG_FB_GEODE_GX1=3Dy
> # CONFIG_FB_SM501 is not set
> # CONFIG_FB_SMSCUFX is not set
> CONFIG_FB_UDL=3Dy
> # CONFIG_FB_IBM_GXT4500 is not set
> CONFIG_FB_VIRTUAL=3Dy
> CONFIG_FB_METRONOME=3Dy
> CONFIG_FB_MB862XX=3Dy
> CONFIG_FB_MB862XX_PCI_GDC=3Dy
> CONFIG_FB_MB862XX_I2C=3Dy
> # CONFIG_FB_SIMPLE is not set
> CONFIG_FB_SM712=3Dy
> # end of Frame buffer Devices
> =

> #
> # Backlight & LCD device support
> #
> CONFIG_LCD_CLASS_DEVICE=3Dy
> CONFIG_LCD_PLATFORM=3Dy
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> CONFIG_BACKLIGHT_LM3533=3Dy
> # CONFIG_BACKLIGHT_CARILLO_RANCH is not set
> CONFIG_BACKLIGHT_DA903X=3Dy
> CONFIG_BACKLIGHT_MAX8925=3Dy
> # CONFIG_BACKLIGHT_APPLE is not set
> # CONFIG_BACKLIGHT_QCOM_WLED is not set
> # CONFIG_BACKLIGHT_SAHARA is not set
> CONFIG_BACKLIGHT_ADP8860=3Dy
> # CONFIG_BACKLIGHT_ADP8870 is not set
> CONFIG_BACKLIGHT_88PM860X=3Dy
> CONFIG_BACKLIGHT_PCF50633=3Dy
> # CONFIG_BACKLIGHT_AAT2870 is not set
> CONFIG_BACKLIGHT_LM3639=3Dy
> # CONFIG_BACKLIGHT_PANDORA is not set
> CONFIG_BACKLIGHT_SKY81452=3Dy
> CONFIG_BACKLIGHT_GPIO=3Dy
> CONFIG_BACKLIGHT_LV5207LP=3Dy
> CONFIG_BACKLIGHT_BD6107=3Dy
> CONFIG_BACKLIGHT_ARCXCNN=3Dy
> # CONFIG_BACKLIGHT_RAVE_SP is not set
> # end of Backlight & LCD device support
> =

> CONFIG_VGASTATE=3Dy
> CONFIG_HDMI=3Dy
> # CONFIG_LOGO is not set
> # end of Graphics support
> =

> # CONFIG_SOUND is not set
> =

> #
> # HID support
> #
> CONFIG_HID=3Dy
> CONFIG_HID_BATTERY_STRENGTH=3Dy
> CONFIG_HIDRAW=3Dy
> CONFIG_UHID=3Dy
> # CONFIG_HID_GENERIC is not set
> =

> #
> # Special HID drivers
> #
> CONFIG_HID_A4TECH=3Dy
> # CONFIG_HID_ACCUTOUCH is not set
> # CONFIG_HID_ACRUX is not set
> # CONFIG_HID_APPLE is not set
> CONFIG_HID_APPLEIR=3Dy
> CONFIG_HID_ASUS=3Dy
> CONFIG_HID_AUREAL=3Dy
> CONFIG_HID_BELKIN=3Dy
> # CONFIG_HID_BETOP_FF is not set
> # CONFIG_HID_BIGBEN_FF is not set
> CONFIG_HID_CHERRY=3Dy
> CONFIG_HID_CHICONY=3Dy
> CONFIG_HID_CORSAIR=3Dy
> CONFIG_HID_COUGAR=3Dy
> # CONFIG_HID_MACALLY is not set
> # CONFIG_HID_CMEDIA is not set
> CONFIG_HID_CP2112=3Dy
> # CONFIG_HID_CREATIVE_SB0540 is not set
> CONFIG_HID_CYPRESS=3Dy
> # CONFIG_HID_DRAGONRISE is not set
> # CONFIG_HID_EMS_FF is not set
> CONFIG_HID_ELAN=3Dy
> # CONFIG_HID_ELECOM is not set
> # CONFIG_HID_ELO is not set
> CONFIG_HID_EZKEY=3Dy
> CONFIG_HID_GEMBIRD=3Dy
> CONFIG_HID_GFRM=3Dy
> # CONFIG_HID_GLORIOUS is not set
> CONFIG_HID_HOLTEK=3Dy
> # CONFIG_HOLTEK_FF is not set
> CONFIG_HID_GOOGLE_HAMMER=3Dy
> CONFIG_HID_GT683R=3Dy
> CONFIG_HID_KEYTOUCH=3Dy
> # CONFIG_HID_KYE is not set
> CONFIG_HID_UCLOGIC=3Dy
> CONFIG_HID_WALTOP=3Dy
> # CONFIG_HID_VIEWSONIC is not set
> # CONFIG_HID_GYRATION is not set
> # CONFIG_HID_ICADE is not set
> CONFIG_HID_ITE=3Dy
> CONFIG_HID_JABRA=3Dy
> # CONFIG_HID_TWINHAN is not set
> # CONFIG_HID_KENSINGTON is not set
> CONFIG_HID_LCPOWER=3Dy
> CONFIG_HID_LED=3Dy
> CONFIG_HID_LENOVO=3Dy
> # CONFIG_HID_LOGITECH is not set
> CONFIG_HID_MAGICMOUSE=3Dy
> # CONFIG_HID_MALTRON is not set
> CONFIG_HID_MAYFLASH=3Dy
> CONFIG_HID_REDRAGON=3Dy
> CONFIG_HID_MICROSOFT=3Dy
> CONFIG_HID_MONTEREY=3Dy
> CONFIG_HID_MULTITOUCH=3Dy
> # CONFIG_HID_NTI is not set
> CONFIG_HID_NTRIG=3Dy
> CONFIG_HID_ORTEK=3Dy
> # CONFIG_HID_PANTHERLORD is not set
> # CONFIG_HID_PENMOUNT is not set
> CONFIG_HID_PETALYNX=3Dy
> # CONFIG_HID_PICOLCD is not set
> # CONFIG_HID_PLANTRONICS is not set
> CONFIG_HID_PRIMAX=3Dy
> CONFIG_HID_RETRODE=3Dy
> # CONFIG_HID_ROCCAT is not set
> # CONFIG_HID_SAITEK is not set
> CONFIG_HID_SAMSUNG=3Dy
> CONFIG_HID_SONY=3Dy
> CONFIG_SONY_FF=3Dy
> # CONFIG_HID_SPEEDLINK is not set
> CONFIG_HID_STEAM=3Dy
> CONFIG_HID_STEELSERIES=3Dy
> # CONFIG_HID_SUNPLUS is not set
> CONFIG_HID_RMI=3Dy
> CONFIG_HID_GREENASIA=3Dy
> # CONFIG_GREENASIA_FF is not set
> CONFIG_HID_SMARTJOYPLUS=3Dy
> # CONFIG_SMARTJOYPLUS_FF is not set
> CONFIG_HID_TIVO=3Dy
> CONFIG_HID_TOPSEED=3Dy
> CONFIG_HID_THINGM=3Dy
> CONFIG_HID_THRUSTMASTER=3Dy
> # CONFIG_THRUSTMASTER_FF is not set
> CONFIG_HID_UDRAW_PS3=3Dy
> # CONFIG_HID_WACOM is not set
> CONFIG_HID_WIIMOTE=3Dy
> CONFIG_HID_XINMO=3Dy
> CONFIG_HID_ZEROPLUS=3Dy
> # CONFIG_ZEROPLUS_FF is not set
> CONFIG_HID_ZYDACRON=3Dy
> # CONFIG_HID_SENSOR_HUB is not set
> # CONFIG_HID_ALPS is not set
> # CONFIG_HID_MCP2221 is not set
> # end of Special HID drivers
> =

> #
> # USB HID support
> #
> CONFIG_USB_HID=3Dy
> CONFIG_HID_PID=3Dy
> CONFIG_USB_HIDDEV=3Dy
> # end of USB HID support
> =

> #
> # I2C HID support
> #
> CONFIG_I2C_HID=3Dy
> # end of I2C HID support
> # end of HID support
> =

> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> CONFIG_USB_SUPPORT=3Dy
> CONFIG_USB_COMMON=3Dy
> # CONFIG_USB_LED_TRIG is not set
> CONFIG_USB_ULPI_BUS=3Dy
> # CONFIG_USB_CONN_GPIO is not set
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> CONFIG_USB=3Dy
> # CONFIG_USB_PCI is not set
> # CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
> =

> #
> # Miscellaneous USB options
> #
> # CONFIG_USB_DEFAULT_PERSIST is not set
> CONFIG_USB_DYNAMIC_MINORS=3Dy
> CONFIG_USB_OTG=3Dy
> # CONFIG_USB_OTG_PRODUCTLIST is not set
> # CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB is not set
> CONFIG_USB_OTG_FSM=3Dy
> # CONFIG_USB_LEDS_TRIGGER_USBPORT is not set
> CONFIG_USB_AUTOSUSPEND_DELAY=3D2
> # CONFIG_USB_MON is not set
> =

> #
> # USB Host Controller Drivers
> #
> CONFIG_USB_C67X00_HCD=3Dy
> # CONFIG_USB_XHCI_HCD is not set
> CONFIG_USB_EHCI_HCD=3Dy
> CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
> # CONFIG_USB_EHCI_TT_NEWSCHED is not set
> # CONFIG_USB_EHCI_FSL is not set
> CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
> CONFIG_USB_OXU210HP_HCD=3Dy
> # CONFIG_USB_ISP116X_HCD is not set
> CONFIG_USB_FOTG210_HCD=3Dy
> CONFIG_USB_OHCI_HCD=3Dy
> CONFIG_USB_OHCI_HCD_PLATFORM=3Dy
> # CONFIG_USB_U132_HCD is not set
> # CONFIG_USB_SL811_HCD is not set
> # CONFIG_USB_R8A66597_HCD is not set
> CONFIG_USB_HCD_BCMA=3Dy
> # CONFIG_USB_HCD_TEST_MODE is not set
> =

> #
> # USB Device Class drivers
> #
> # CONFIG_USB_ACM is not set
> # CONFIG_USB_PRINTER is not set
> CONFIG_USB_WDM=3Dy
> CONFIG_USB_TMC=3Dy
> =

> #
> # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> #
> =

> #
> # also be needed; see USB_STORAGE Help for more info
> #
> =

> #
> # USB Imaging devices
> #
> # CONFIG_USB_MDC800 is not set
> CONFIG_USBIP_CORE=3Dy
> CONFIG_USBIP_VHCI_HCD=3Dy
> CONFIG_USBIP_VHCI_HC_PORTS=3D8
> CONFIG_USBIP_VHCI_NR_HCS=3D1
> CONFIG_USBIP_HOST=3Dy
> CONFIG_USBIP_DEBUG=3Dy
> # CONFIG_USB_CDNS3 is not set
> CONFIG_USB_MUSB_HDRC=3Dy
> CONFIG_USB_MUSB_HOST=3Dy
> =

> #
> # Platform Glue Layer
> #
> =

> #
> # MUSB DMA mode
> #
> CONFIG_MUSB_PIO_ONLY=3Dy
> CONFIG_USB_DWC3=3Dy
> CONFIG_USB_DWC3_ULPI=3Dy
> CONFIG_USB_DWC3_HOST=3Dy
> =

> #
> # Platform Glue Driver Support
> #
> CONFIG_USB_DWC2=3Dy
> CONFIG_USB_DWC2_HOST=3Dy
> =

> #
> # Gadget/Dual-role mode requires USB Gadget support to be enabled
> #
> # CONFIG_USB_DWC2_DEBUG is not set
> # CONFIG_USB_DWC2_TRACK_MISSED_SOFS is not set
> CONFIG_USB_CHIPIDEA=3Dy
> CONFIG_USB_CHIPIDEA_HOST=3Dy
> CONFIG_USB_CHIPIDEA_MSM=3Dy
> CONFIG_USB_CHIPIDEA_GENERIC=3Dy
> CONFIG_USB_ISP1760=3Dy
> CONFIG_USB_ISP1760_HCD=3Dy
> CONFIG_USB_ISP1760_HOST_ROLE=3Dy
> =

> #
> # USB port drivers
> #
> # CONFIG_USB_USS720 is not set
> # CONFIG_USB_SERIAL is not set
> =

> #
> # USB Miscellaneous drivers
> #
> CONFIG_USB_EMI62=3Dy
> CONFIG_USB_EMI26=3Dy
> CONFIG_USB_ADUTUX=3Dy
> CONFIG_USB_SEVSEG=3Dy
> # CONFIG_USB_LEGOTOWER is not set
> # CONFIG_USB_LCD is not set
> CONFIG_USB_CYPRESS_CY7C63=3Dy
> CONFIG_USB_CYTHERM=3Dy
> CONFIG_USB_IDMOUSE=3Dy
> CONFIG_USB_FTDI_ELAN=3Dy
> # CONFIG_USB_APPLEDISPLAY is not set
> # CONFIG_APPLE_MFI_FASTCHARGE is not set
> # CONFIG_USB_SISUSBVGA is not set
> CONFIG_USB_LD=3Dy
> CONFIG_USB_TRANCEVIBRATOR=3Dy
> CONFIG_USB_IOWARRIOR=3Dy
> CONFIG_USB_TEST=3Dy
> CONFIG_USB_EHSET_TEST_FIXTURE=3Dy
> CONFIG_USB_ISIGHTFW=3Dy
> CONFIG_USB_YUREX=3Dy
> # CONFIG_USB_EZUSB_FX2 is not set
> CONFIG_USB_HUB_USB251XB=3Dy
> # CONFIG_USB_HSIC_USB3503 is not set
> CONFIG_USB_HSIC_USB4604=3Dy
> # CONFIG_USB_LINK_LAYER_TEST is not set
> # CONFIG_USB_ATM is not set
> =

> #
> # USB Physical Layer drivers
> #
> CONFIG_USB_PHY=3Dy
> CONFIG_NOP_USB_XCEIV=3Dy
> CONFIG_USB_GPIO_VBUS=3Dy
> CONFIG_USB_ISP1301=3Dy
> # end of USB Physical Layer drivers
> =

> # CONFIG_USB_GADGET is not set
> CONFIG_TYPEC=3Dy
> CONFIG_TYPEC_TCPM=3Dy
> CONFIG_TYPEC_TCPCI=3Dy
> CONFIG_TYPEC_RT1711H=3Dy
> CONFIG_TYPEC_FUSB302=3Dy
> # CONFIG_TYPEC_UCSI is not set
> # CONFIG_TYPEC_HD3SS3220 is not set
> # CONFIG_TYPEC_TPS6598X is not set
> =

> #
> # USB Type-C Multiplexer/DeMultiplexer Switch support
> #
> # CONFIG_TYPEC_MUX_PI3USB30532 is not set
> # end of USB Type-C Multiplexer/DeMultiplexer Switch support
> =

> #
> # USB Type-C Alternate Mode drivers
> #
> # CONFIG_TYPEC_DP_ALTMODE is not set
> # end of USB Type-C Alternate Mode drivers
> =

> CONFIG_USB_ROLE_SWITCH=3Dy
> # CONFIG_USB_ROLES_INTEL_XHCI is not set
> CONFIG_MMC=3Dy
> # CONFIG_SDIO_UART is not set
> # CONFIG_MMC_TEST is not set
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> # CONFIG_MMC_DEBUG is not set
> # CONFIG_MMC_SDHCI is not set
> # CONFIG_MMC_WBSD is not set
> CONFIG_MMC_TIFM_SD=3Dy
> CONFIG_MMC_CB710=3Dy
> CONFIG_MMC_VIA_SDMMC=3Dy
> CONFIG_MMC_VUB300=3Dy
> CONFIG_MMC_USHC=3Dy
> CONFIG_MMC_USDHI6ROL0=3Dy
> CONFIG_MMC_REALTEK_PCI=3Dy
> # CONFIG_MMC_REALTEK_USB is not set
> CONFIG_MMC_CQHCI=3Dy
> # CONFIG_MMC_HSQ is not set
> CONFIG_MMC_TOSHIBA_PCI=3Dy
> CONFIG_MMC_MTK=3Dy
> # CONFIG_MEMSTICK is not set
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> CONFIG_LEDS_CLASS_FLASH=3Dy
> # CONFIG_LEDS_CLASS_MULTICOLOR is not set
> CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=3Dy
> =

> #
> # LED drivers
> #
> # CONFIG_LEDS_88PM860X is not set
> # CONFIG_LEDS_AS3645A is not set
> CONFIG_LEDS_LM3530=3Dy
> # CONFIG_LEDS_LM3532 is not set
> CONFIG_LEDS_LM3533=3Dy
> CONFIG_LEDS_LM3642=3Dy
> CONFIG_LEDS_LM3601X=3Dy
> CONFIG_LEDS_MT6323=3Dy
> # CONFIG_LEDS_NET48XX is not set
> CONFIG_LEDS_WRAP=3Dy
> CONFIG_LEDS_PCA9532=3Dy
> CONFIG_LEDS_PCA9532_GPIO=3Dy
> CONFIG_LEDS_GPIO=3Dy
> CONFIG_LEDS_LP3944=3Dy
> # CONFIG_LEDS_LP3952 is not set
> # CONFIG_LEDS_LP8788 is not set
> CONFIG_LEDS_PCA955X=3Dy
> CONFIG_LEDS_PCA955X_GPIO=3Dy
> # CONFIG_LEDS_PCA963X is not set
> # CONFIG_LEDS_DA903X is not set
> CONFIG_LEDS_REGULATOR=3Dy
> # CONFIG_LEDS_BD2802 is not set
> CONFIG_LEDS_MC13783=3Dy
> # CONFIG_LEDS_TCA6507 is not set
> CONFIG_LEDS_TLC591XX=3Dy
> CONFIG_LEDS_LM355x=3Dy
> # CONFIG_LEDS_OT200 is not set
> CONFIG_LEDS_MENF21BMC=3Dy
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> # CONFIG_LEDS_BLINKM is not set
> CONFIG_LEDS_MLXREG=3Dy
> # CONFIG_LEDS_USER is not set
> # CONFIG_LEDS_NIC78BX is not set
> # CONFIG_LEDS_TI_LMU_COMMON is not set
> CONFIG_LEDS_TPS6105X=3Dy
> # CONFIG_LEDS_SGM3140 is not set
> =

> #
> # LED Triggers
> #
> CONFIG_LEDS_TRIGGERS=3Dy
> CONFIG_LEDS_TRIGGER_TIMER=3Dy
> CONFIG_LEDS_TRIGGER_ONESHOT=3Dy
> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dy
> CONFIG_LEDS_TRIGGER_CPU=3Dy
> CONFIG_LEDS_TRIGGER_ACTIVITY=3Dy
> # CONFIG_LEDS_TRIGGER_GPIO is not set
> # CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dy
> CONFIG_LEDS_TRIGGER_CAMERA=3Dy
> # CONFIG_LEDS_TRIGGER_PANIC is not set
> CONFIG_LEDS_TRIGGER_NETDEV=3Dy
> # CONFIG_LEDS_TRIGGER_PATTERN is not set
> # CONFIG_LEDS_TRIGGER_AUDIO is not set
> # CONFIG_ACCESSIBILITY is not set
> CONFIG_INFINIBAND=3Dy
> CONFIG_INFINIBAND_USER_MAD=3Dy
> CONFIG_INFINIBAND_USER_ACCESS=3Dy
> CONFIG_INFINIBAND_USER_MEM=3Dy
> CONFIG_INFINIBAND_ON_DEMAND_PAGING=3Dy
> CONFIG_INFINIBAND_ADDR_TRANS=3Dy
> CONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS=3Dy
> CONFIG_INFINIBAND_MTHCA=3Dy
> CONFIG_INFINIBAND_MTHCA_DEBUG=3Dy
> # CONFIG_MLX4_INFINIBAND is not set
> # CONFIG_INFINIBAND_OCRDMA is not set
> CONFIG_RDMA_RXE=3Dy
> # CONFIG_RDMA_SIW is not set
> # CONFIG_INFINIBAND_IPOIB is not set
> # CONFIG_INFINIBAND_RTRS_CLIENT is not set
> # CONFIG_INFINIBAND_RTRS_SERVER is not set
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> # CONFIG_EDAC is not set
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_MC146818_LIB=3Dy
> # CONFIG_RTC_CLASS is not set
> # CONFIG_DMADEVICES is not set
> =

> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=3Dy
> CONFIG_SW_SYNC=3Dy
> # CONFIG_UDMABUF is not set
> # CONFIG_DMABUF_MOVE_NOTIFY is not set
> # CONFIG_DMABUF_SELFTESTS is not set
> # CONFIG_DMABUF_HEAPS is not set
> # end of DMABUF options
> =

> CONFIG_AUXDISPLAY=3Dy
> # CONFIG_HD44780 is not set
> # CONFIG_IMG_ASCII_LCD is not set
> CONFIG_PARPORT_PANEL=3Dy
> CONFIG_PANEL_PARPORT=3D0
> CONFIG_PANEL_PROFILE=3D5
> CONFIG_PANEL_CHANGE_MESSAGE=3Dy
> CONFIG_PANEL_BOOT_MESSAGE=3D""
> # CONFIG_CHARLCD_BL_OFF is not set
> # CONFIG_CHARLCD_BL_ON is not set
> CONFIG_CHARLCD_BL_FLASH=3Dy
> CONFIG_PANEL=3Dy
> CONFIG_CHARLCD=3Dy
> CONFIG_UIO=3Dy
> CONFIG_UIO_CIF=3Dy
> # CONFIG_UIO_PDRV_GENIRQ is not set
> CONFIG_UIO_DMEM_GENIRQ=3Dy
> CONFIG_UIO_AEC=3Dy
> CONFIG_UIO_SERCOS3=3Dy
> # CONFIG_UIO_PCI_GENERIC is not set
> CONFIG_UIO_NETX=3Dy
> # CONFIG_UIO_PRUSS is not set
> CONFIG_UIO_MF624=3Dy
> # CONFIG_VIRT_DRIVERS is not set
> CONFIG_VIRTIO=3Dy
> CONFIG_VIRTIO_MENU=3Dy
> CONFIG_VIRTIO_PCI=3Dy
> CONFIG_VIRTIO_PCI_LEGACY=3Dy
> CONFIG_VIRTIO_BALLOON=3Dy
> CONFIG_VIRTIO_INPUT=3Dy
> # CONFIG_VIRTIO_MMIO is not set
> CONFIG_VIRTIO_DMA_SHARED_BUFFER=3Dy
> # CONFIG_VDPA is not set
> CONFIG_VHOST_IOTLB=3Dy
> CONFIG_VHOST=3Dy
> CONFIG_VHOST_MENU=3Dy
> CONFIG_VHOST_NET=3Dy
> # CONFIG_VHOST_VSOCK is not set
> # CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> # end of Microsoft Hyper-V guest support
> =

> CONFIG_GREYBUS=3Dy
> CONFIG_GREYBUS_ES2=3Dy
> CONFIG_STAGING=3Dy
> # CONFIG_PRISM2_USB is not set
> CONFIG_COMEDI=3Dy
> CONFIG_COMEDI_DEBUG=3Dy
> CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=3D2048
> CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=3D20480
> CONFIG_COMEDI_MISC_DRIVERS=3Dy
> CONFIG_COMEDI_BOND=3Dy
> CONFIG_COMEDI_TEST=3Dy
> CONFIG_COMEDI_PARPORT=3Dy
> CONFIG_COMEDI_SSV_DNP=3Dy
> # CONFIG_COMEDI_ISA_DRIVERS is not set
> CONFIG_COMEDI_PCI_DRIVERS=3Dy
> CONFIG_COMEDI_8255_PCI=3Dy
> # CONFIG_COMEDI_ADDI_APCI_1032 is not set
> CONFIG_COMEDI_ADDI_APCI_1500=3Dy
> # CONFIG_COMEDI_ADDI_APCI_1516 is not set
> # CONFIG_COMEDI_ADDI_APCI_1564 is not set
> CONFIG_COMEDI_ADDI_APCI_16XX=3Dy
> # CONFIG_COMEDI_ADDI_APCI_2032 is not set
> # CONFIG_COMEDI_ADDI_APCI_2200 is not set
> CONFIG_COMEDI_ADDI_APCI_3120=3Dy
> # CONFIG_COMEDI_ADDI_APCI_3501 is not set
> # CONFIG_COMEDI_ADDI_APCI_3XXX is not set
> CONFIG_COMEDI_ADL_PCI6208=3Dy
> # CONFIG_COMEDI_ADL_PCI7X3X is not set
> CONFIG_COMEDI_ADL_PCI8164=3Dy
> CONFIG_COMEDI_ADL_PCI9111=3Dy
> CONFIG_COMEDI_ADL_PCI9118=3Dy
> CONFIG_COMEDI_ADV_PCI1710=3Dy
> CONFIG_COMEDI_ADV_PCI1720=3Dy
> CONFIG_COMEDI_ADV_PCI1723=3Dy
> CONFIG_COMEDI_ADV_PCI1724=3Dy
> CONFIG_COMEDI_ADV_PCI1760=3Dy
> # CONFIG_COMEDI_ADV_PCI_DIO is not set
> CONFIG_COMEDI_AMPLC_DIO200_PCI=3Dy
> CONFIG_COMEDI_AMPLC_PC236_PCI=3Dy
> CONFIG_COMEDI_AMPLC_PC263_PCI=3Dy
> CONFIG_COMEDI_AMPLC_PCI224=3Dy
> CONFIG_COMEDI_AMPLC_PCI230=3Dy
> # CONFIG_COMEDI_CONTEC_PCI_DIO is not set
> # CONFIG_COMEDI_DAS08_PCI is not set
> CONFIG_COMEDI_DT3000=3Dy
> CONFIG_COMEDI_DYNA_PCI10XX=3Dy
> CONFIG_COMEDI_GSC_HPDI=3Dy
> CONFIG_COMEDI_MF6X4=3Dy
> CONFIG_COMEDI_ICP_MULTI=3Dy
> CONFIG_COMEDI_DAQBOARD2000=3Dy
> # CONFIG_COMEDI_JR3_PCI is not set
> CONFIG_COMEDI_KE_COUNTER=3Dy
> CONFIG_COMEDI_CB_PCIDAS64=3Dy
> # CONFIG_COMEDI_CB_PCIDAS is not set
> # CONFIG_COMEDI_CB_PCIDDA is not set
> CONFIG_COMEDI_CB_PCIMDAS=3Dy
> # CONFIG_COMEDI_CB_PCIMDDA is not set
> CONFIG_COMEDI_ME4000=3Dy
> CONFIG_COMEDI_ME_DAQ=3Dy
> CONFIG_COMEDI_NI_6527=3Dy
> # CONFIG_COMEDI_NI_65XX is not set
> CONFIG_COMEDI_NI_660X=3Dy
> CONFIG_COMEDI_NI_670X=3Dy
> CONFIG_COMEDI_NI_LABPC_PCI=3Dy
> CONFIG_COMEDI_NI_PCIDIO=3Dy
> CONFIG_COMEDI_NI_PCIMIO=3Dy
> CONFIG_COMEDI_RTD520=3Dy
> CONFIG_COMEDI_S626=3Dy
> CONFIG_COMEDI_MITE=3Dy
> CONFIG_COMEDI_NI_TIOCMD=3Dy
> # CONFIG_COMEDI_USB_DRIVERS is not set
> CONFIG_COMEDI_8254=3Dy
> CONFIG_COMEDI_8255=3Dy
> # CONFIG_COMEDI_8255_SA is not set
> CONFIG_COMEDI_KCOMEDILIB=3Dy
> CONFIG_COMEDI_AMPLC_DIO200=3Dy
> CONFIG_COMEDI_AMPLC_PC236=3Dy
> CONFIG_COMEDI_NI_LABPC=3Dy
> CONFIG_COMEDI_NI_TIO=3Dy
> CONFIG_COMEDI_NI_ROUTING=3Dy
> # CONFIG_RTL8192U is not set
> # CONFIG_RTLLIB is not set
> # CONFIG_RTL8723BS is not set
> # CONFIG_R8712U is not set
> # CONFIG_R8188EU is not set
> =

> #
> # IIO staging drivers
> #
> =

> #
> # Accelerometers
> #
> # end of Accelerometers
> =

> #
> # Analog to digital converters
> #
> # end of Analog to digital converters
> =

> #
> # Analog digital bi-direction converters
> #
> CONFIG_ADT7316=3Dy
> # CONFIG_ADT7316_I2C is not set
> # end of Analog digital bi-direction converters
> =

> #
> # Capacitance to digital converters
> #
> CONFIG_AD7150=3Dy
> # CONFIG_AD7746 is not set
> # end of Capacitance to digital converters
> =

> #
> # Direct Digital Synthesis
> #
> # end of Direct Digital Synthesis
> =

> #
> # Network Analyzer, Impedance Converters
> #
> CONFIG_AD5933=3Dy
> # end of Network Analyzer, Impedance Converters
> =

> #
> # Active energy metering IC
> #
> CONFIG_ADE7854=3Dy
> CONFIG_ADE7854_I2C=3Dy
> # end of Active energy metering IC
> =

> #
> # Resolver to digital converters
> #
> # end of Resolver to digital converters
> # end of IIO staging drivers
> =

> CONFIG_FB_SM750=3Dy
> CONFIG_STAGING_MEDIA=3Dy
> =

> #
> # Android
> #
> # end of Android
> =

> # CONFIG_LTE_GDM724X is not set
> # CONFIG_FIREWIRE_SERIAL is not set
> # CONFIG_GS_FPGABOOT is not set
> # CONFIG_UNISYSSPAR is not set
> # CONFIG_MOST_COMPONENTS is not set
> # CONFIG_KS7010 is not set
> CONFIG_GREYBUS_BOOTROM=3Dy
> CONFIG_GREYBUS_HID=3Dy
> # CONFIG_GREYBUS_LIGHT is not set
> # CONFIG_GREYBUS_LOG is not set
> # CONFIG_GREYBUS_LOOPBACK is not set
> CONFIG_GREYBUS_POWER=3Dy
> CONFIG_GREYBUS_RAW=3Dy
> # CONFIG_GREYBUS_VIBRATOR is not set
> # CONFIG_GREYBUS_BRIDGED_PHY is not set
> =

> #
> # Gasket devices
> #
> # end of Gasket devices
> =

> # CONFIG_FIELDBUS_DEV is not set
> # CONFIG_KPC2000 is not set
> # CONFIG_QLGE is not set
> # CONFIG_X86_PLATFORM_DEVICES is not set
> CONFIG_PMC_ATOM=3Dy
> CONFIG_MFD_CROS_EC=3Dy
> CONFIG_CHROME_PLATFORMS=3Dy
> CONFIG_CHROMEOS_PSTORE=3Dy
> # CONFIG_CHROMEOS_TBMC is not set
> CONFIG_CROS_EC=3Dy
> # CONFIG_CROS_EC_I2C is not set
> # CONFIG_CROS_EC_LPC is not set
> CONFIG_CROS_EC_PROTO=3Dy
> # CONFIG_CROS_KBD_LED_BACKLIGHT is not set
> CONFIG_CROS_EC_CHARDEV=3Dy
> CONFIG_CROS_EC_LIGHTBAR=3Dy
> CONFIG_CROS_EC_DEBUGFS=3Dy
> CONFIG_CROS_EC_SENSORHUB=3Dy
> CONFIG_CROS_EC_SYSFS=3Dy
> CONFIG_CROS_EC_TYPEC=3Dy
> CONFIG_CROS_USBPD_NOTIFY=3Dy
> CONFIG_MELLANOX_PLATFORM=3Dy
> # CONFIG_MLXREG_HOTPLUG is not set
> CONFIG_MLXREG_IO=3Dy
> CONFIG_HAVE_CLK=3Dy
> CONFIG_CLKDEV_LOOKUP=3Dy
> CONFIG_HAVE_CLK_PREPARE=3Dy
> CONFIG_COMMON_CLK=3Dy
> CONFIG_COMMON_CLK_MAX9485=3Dy
> # CONFIG_COMMON_CLK_SI5341 is not set
> # CONFIG_COMMON_CLK_SI5351 is not set
> # CONFIG_COMMON_CLK_SI544 is not set
> CONFIG_COMMON_CLK_CDCE706=3Dy
> CONFIG_COMMON_CLK_CS2000_CP=3Dy
> # CONFIG_COMMON_CLK_S2MPS11 is not set
> CONFIG_CLK_TWL6040=3Dy
> CONFIG_HWSPINLOCK=3Dy
> =

> #
> # Clock Source drivers
> #
> CONFIG_CLKSRC_I8253=3Dy
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_I8253_LOCK=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # end of Clock Source drivers
> =

> CONFIG_MAILBOX=3Dy
> # CONFIG_PCC is not set
> # CONFIG_ALTERA_MBOX is not set
> # CONFIG_IOMMU_SUPPORT is not set
> =

> #
> # Remoteproc drivers
> #
> CONFIG_REMOTEPROC=3Dy
> # CONFIG_REMOTEPROC_CDEV is not set
> # end of Remoteproc drivers
> =

> #
> # Rpmsg drivers
> #
> CONFIG_RPMSG=3Dy
> CONFIG_RPMSG_CHAR=3Dy
> CONFIG_RPMSG_QCOM_GLINK=3Dy
> CONFIG_RPMSG_QCOM_GLINK_RPM=3Dy
> CONFIG_RPMSG_VIRTIO=3Dy
> # end of Rpmsg drivers
> =

> # CONFIG_SOUNDWIRE is not set
> =

> #
> # SOC (System On Chip) specific Drivers
> #
> =

> #
> # Amlogic SoC drivers
> #
> # end of Amlogic SoC drivers
> =

> #
> # Aspeed SoC drivers
> #
> # end of Aspeed SoC drivers
> =

> #
> # Broadcom SoC drivers
> #
> # end of Broadcom SoC drivers
> =

> #
> # NXP/Freescale QorIQ SoC drivers
> #
> # end of NXP/Freescale QorIQ SoC drivers
> =

> #
> # i.MX SoC drivers
> #
> # end of i.MX SoC drivers
> =

> #
> # Qualcomm SoC drivers
> #
> # end of Qualcomm SoC drivers
> =

> # CONFIG_SOC_TI is not set
> =

> #
> # Xilinx SoC drivers
> #
> CONFIG_XILINX_VCU=3Dy
> # end of Xilinx SoC drivers
> # end of SOC (System On Chip) specific Drivers
> =

> # CONFIG_PM_DEVFREQ is not set
> CONFIG_EXTCON=3Dy
> =

> #
> # Extcon Device Drivers
> #
> CONFIG_EXTCON_ADC_JACK=3Dy
> CONFIG_EXTCON_AXP288=3Dy
> # CONFIG_EXTCON_FSA9480 is not set
> CONFIG_EXTCON_GPIO=3Dy
> # CONFIG_EXTCON_INTEL_INT3496 is not set
> CONFIG_EXTCON_MAX14577=3Dy
> CONFIG_EXTCON_MAX3355=3Dy
> # CONFIG_EXTCON_PTN5150 is not set
> # CONFIG_EXTCON_RT8973A is not set
> # CONFIG_EXTCON_SM5502 is not set
> CONFIG_EXTCON_USB_GPIO=3Dy
> CONFIG_EXTCON_USBC_CROS_EC=3Dy
> CONFIG_MEMORY=3Dy
> CONFIG_IIO=3Dy
> CONFIG_IIO_BUFFER=3Dy
> CONFIG_IIO_BUFFER_CB=3Dy
> CONFIG_IIO_BUFFER_HW_CONSUMER=3Dy
> CONFIG_IIO_KFIFO_BUF=3Dy
> CONFIG_IIO_TRIGGERED_BUFFER=3Dy
> CONFIG_IIO_CONFIGFS=3Dy
> CONFIG_IIO_TRIGGER=3Dy
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> CONFIG_IIO_SW_DEVICE=3Dy
> CONFIG_IIO_SW_TRIGGER=3Dy
> =

> #
> # Accelerometers
> #
> # CONFIG_ADXL372_I2C is not set
> CONFIG_BMA180=3Dy
> # CONFIG_BMA400 is not set
> CONFIG_BMC150_ACCEL=3Dy
> CONFIG_BMC150_ACCEL_I2C=3Dy
> CONFIG_DA280=3Dy
> CONFIG_DA311=3Dy
> CONFIG_DMARD09=3Dy
> # CONFIG_DMARD10 is not set
> # CONFIG_IIO_CROS_EC_ACCEL_LEGACY is not set
> CONFIG_KXSD9=3Dy
> CONFIG_KXSD9_I2C=3Dy
> CONFIG_KXCJK1013=3Dy
> CONFIG_MC3230=3Dy
> # CONFIG_MMA7455_I2C is not set
> CONFIG_MMA7660=3Dy
> CONFIG_MMA8452=3Dy
> CONFIG_MMA9551_CORE=3Dy
> CONFIG_MMA9551=3Dy
> # CONFIG_MMA9553 is not set
> CONFIG_MXC4005=3Dy
> CONFIG_MXC6255=3Dy
> CONFIG_STK8312=3Dy
> CONFIG_STK8BA50=3Dy
> # end of Accelerometers
> =

> #
> # Analog to digital converters
> #
> # CONFIG_AD7091R5 is not set
> CONFIG_AD7291=3Dy
> CONFIG_AD7606=3Dy
> CONFIG_AD7606_IFACE_PARALLEL=3Dy
> CONFIG_AD799X=3Dy
> # CONFIG_ADI_AXI_ADC is not set
> # CONFIG_AXP20X_ADC is not set
> # CONFIG_AXP288_ADC is not set
> CONFIG_CC10001_ADC=3Dy
> CONFIG_HX711=3Dy
> # CONFIG_LP8788_ADC is not set
> # CONFIG_LTC2471 is not set
> CONFIG_LTC2485=3Dy
> CONFIG_LTC2497=3Dy
> CONFIG_MAX1363=3Dy
> CONFIG_MAX9611=3Dy
> CONFIG_MCP3422=3Dy
> # CONFIG_NAU7802 is not set
> CONFIG_QCOM_SPMI_IADC=3Dy
> # CONFIG_QCOM_SPMI_VADC is not set
> # CONFIG_QCOM_SPMI_ADC5 is not set
> CONFIG_TI_ADC081C=3Dy
> # CONFIG_TI_ADS1015 is not set
> CONFIG_TI_AM335X_ADC=3Dy
> CONFIG_TWL4030_MADC=3Dy
> # CONFIG_TWL6030_GPADC is not set
> # CONFIG_VIPERBOARD_ADC is not set
> # CONFIG_XILINX_XADC is not set
> # end of Analog to digital converters
> =

> #
> # Analog Front Ends
> #
> # end of Analog Front Ends
> =

> #
> # Amplifiers
> #
> # CONFIG_HMC425 is not set
> # end of Amplifiers
> =

> #
> # Chemical Sensors
> #
> CONFIG_ATLAS_PH_SENSOR=3Dy
> # CONFIG_ATLAS_EZO_SENSOR is not set
> CONFIG_BME680=3Dy
> CONFIG_BME680_I2C=3Dy
> # CONFIG_CCS811 is not set
> CONFIG_IAQCORE=3Dy
> # CONFIG_PMS7003 is not set
> # CONFIG_SCD30_CORE is not set
> # CONFIG_SENSIRION_SGP30 is not set
> # CONFIG_SPS30 is not set
> # CONFIG_VZ89X is not set
> # end of Chemical Sensors
> =

> CONFIG_IIO_CROS_EC_SENSORS_CORE=3Dy
> CONFIG_IIO_CROS_EC_SENSORS=3Dy
> # CONFIG_IIO_CROS_EC_SENSORS_LID_ANGLE is not set
> =

> #
> # Hid Sensor IIO Common
> #
> # end of Hid Sensor IIO Common
> =

> CONFIG_IIO_MS_SENSORS_I2C=3Dy
> =

> #
> # SSP Sensor Common
> #
> # end of SSP Sensor Common
> =

> CONFIG_IIO_ST_SENSORS_I2C=3Dy
> CONFIG_IIO_ST_SENSORS_CORE=3Dy
> =

> #
> # Digital to analog converters
> #
> CONFIG_AD5064=3Dy
> # CONFIG_AD5380 is not set
> CONFIG_AD5446=3Dy
> CONFIG_AD5592R_BASE=3Dy
> CONFIG_AD5593R=3Dy
> CONFIG_AD5686=3Dy
> CONFIG_AD5696_I2C=3Dy
> CONFIG_DS4424=3Dy
> # CONFIG_M62332 is not set
> CONFIG_MAX517=3Dy
> CONFIG_MCP4725=3Dy
> CONFIG_TI_DAC5571=3Dy
> # end of Digital to analog converters
> =

> #
> # IIO dummy driver
> #
> # CONFIG_IIO_SIMPLE_DUMMY is not set
> # end of IIO dummy driver
> =

> #
> # Frequency Synthesizers DDS/PLL
> #
> =

> #
> # Clock Generator/Distribution
> #
> # end of Clock Generator/Distribution
> =

> #
> # Phase-Locked Loop (PLL) frequency synthesizers
> #
> # end of Phase-Locked Loop (PLL) frequency synthesizers
> # end of Frequency Synthesizers DDS/PLL
> =

> #
> # Digital gyroscope sensors
> #
> # CONFIG_BMG160 is not set
> # CONFIG_FXAS21002C is not set
> # CONFIG_MPU3050_I2C is not set
> CONFIG_IIO_ST_GYRO_3AXIS=3Dy
> CONFIG_IIO_ST_GYRO_I2C_3AXIS=3Dy
> CONFIG_ITG3200=3Dy
> # end of Digital gyroscope sensors
> =

> #
> # Health Sensors
> #
> =

> #
> # Heart Rate Monitors
> #
> CONFIG_AFE4404=3Dy
> # CONFIG_MAX30100 is not set
> CONFIG_MAX30102=3Dy
> # end of Heart Rate Monitors
> # end of Health Sensors
> =

> #
> # Humidity sensors
> #
> CONFIG_AM2315=3Dy
> CONFIG_DHT11=3Dy
> CONFIG_HDC100X=3Dy
> CONFIG_HTS221=3Dy
> CONFIG_HTS221_I2C=3Dy
> # CONFIG_HTU21 is not set
> # CONFIG_SI7005 is not set
> # CONFIG_SI7020 is not set
> # end of Humidity sensors
> =

> #
> # Inertial measurement units
> #
> CONFIG_BMI160=3Dy
> CONFIG_BMI160_I2C=3Dy
> # CONFIG_FXOS8700_I2C is not set
> # CONFIG_KMX61 is not set
> # CONFIG_INV_ICM42600_I2C is not set
> # CONFIG_INV_MPU6050_I2C is not set
> # CONFIG_IIO_ST_LSM6DSX is not set
> # end of Inertial measurement units
> =

> #
> # Light sensors
> #
> # CONFIG_ACPI_ALS is not set
> CONFIG_ADJD_S311=3Dy
> # CONFIG_ADUX1020 is not set
> # CONFIG_AL3010 is not set
> CONFIG_AL3320A=3Dy
> # CONFIG_APDS9300 is not set
> CONFIG_APDS9960=3Dy
> CONFIG_BH1750=3Dy
> CONFIG_BH1780=3Dy
> CONFIG_CM32181=3Dy
> # CONFIG_CM3232 is not set
> # CONFIG_CM3323 is not set
> CONFIG_CM36651=3Dy
> # CONFIG_IIO_CROS_EC_LIGHT_PROX is not set
> # CONFIG_GP2AP002 is not set
> # CONFIG_GP2AP020A00F is not set
> # CONFIG_SENSORS_ISL29018 is not set
> CONFIG_SENSORS_ISL29028=3Dy
> CONFIG_ISL29125=3Dy
> CONFIG_JSA1212=3Dy
> CONFIG_RPR0521=3Dy
> CONFIG_SENSORS_LM3533=3Dy
> # CONFIG_LTR501 is not set
> CONFIG_LV0104CS=3Dy
> CONFIG_MAX44000=3Dy
> # CONFIG_MAX44009 is not set
> # CONFIG_NOA1305 is not set
> CONFIG_OPT3001=3Dy
> # CONFIG_PA12203001 is not set
> CONFIG_SI1133=3Dy
> # CONFIG_SI1145 is not set
> # CONFIG_STK3310 is not set
> CONFIG_ST_UVIS25=3Dy
> CONFIG_ST_UVIS25_I2C=3Dy
> CONFIG_TCS3414=3Dy
> CONFIG_TCS3472=3Dy
> CONFIG_SENSORS_TSL2563=3Dy
> # CONFIG_TSL2583 is not set
> # CONFIG_TSL2772 is not set
> CONFIG_TSL4531=3Dy
> CONFIG_US5182D=3Dy
> CONFIG_VCNL4000=3Dy
> # CONFIG_VCNL4035 is not set
> # CONFIG_VEML6030 is not set
> CONFIG_VEML6070=3Dy
> CONFIG_VL6180=3Dy
> CONFIG_ZOPT2201=3Dy
> # end of Light sensors
> =

> #
> # Magnetometer sensors
> #
> CONFIG_AK8975=3Dy
> CONFIG_AK09911=3Dy
> CONFIG_BMC150_MAGN=3Dy
> CONFIG_BMC150_MAGN_I2C=3Dy
> # CONFIG_MAG3110 is not set
> CONFIG_MMC35240=3Dy
> # CONFIG_IIO_ST_MAGN_3AXIS is not set
> # CONFIG_SENSORS_HMC5843_I2C is not set
> # CONFIG_SENSORS_RM3100_I2C is not set
> # end of Magnetometer sensors
> =

> #
> # Multiplexers
> #
> # end of Multiplexers
> =

> #
> # Inclinometer sensors
> #
> # end of Inclinometer sensors
> =

> #
> # Triggers - standalone
> #
> CONFIG_IIO_HRTIMER_TRIGGER=3Dy
> CONFIG_IIO_INTERRUPT_TRIGGER=3Dy
> # CONFIG_IIO_TIGHTLOOP_TRIGGER is not set
> CONFIG_IIO_SYSFS_TRIGGER=3Dy
> # end of Triggers - standalone
> =

> #
> # Linear and angular position sensors
> #
> # end of Linear and angular position sensors
> =

> #
> # Digital potentiometers
> #
> # CONFIG_AD5272 is not set
> CONFIG_DS1803=3Dy
> # CONFIG_MAX5432 is not set
> # CONFIG_MCP4018 is not set
> # CONFIG_MCP4531 is not set
> CONFIG_TPL0102=3Dy
> # end of Digital potentiometers
> =

> #
> # Digital potentiostats
> #
> CONFIG_LMP91000=3Dy
> # end of Digital potentiostats
> =

> #
> # Pressure sensors
> #
> CONFIG_ABP060MG=3Dy
> # CONFIG_BMP280 is not set
> CONFIG_IIO_CROS_EC_BARO=3Dy
> # CONFIG_DLHL60D is not set
> # CONFIG_DPS310 is not set
> CONFIG_HP03=3Dy
> # CONFIG_ICP10100 is not set
> # CONFIG_MPL115_I2C is not set
> # CONFIG_MPL3115 is not set
> CONFIG_MS5611=3Dy
> CONFIG_MS5611_I2C=3Dy
> CONFIG_MS5637=3Dy
> CONFIG_IIO_ST_PRESS=3Dy
> CONFIG_IIO_ST_PRESS_I2C=3Dy
> # CONFIG_T5403 is not set
> # CONFIG_HP206C is not set
> CONFIG_ZPA2326=3Dy
> CONFIG_ZPA2326_I2C=3Dy
> # end of Pressure sensors
> =

> #
> # Lightning sensors
> #
> # end of Lightning sensors
> =

> #
> # Proximity and distance sensors
> #
> CONFIG_ISL29501=3Dy
> # CONFIG_LIDAR_LITE_V2 is not set
> # CONFIG_MB1232 is not set
> # CONFIG_PING is not set
> CONFIG_RFD77402=3Dy
> CONFIG_SRF04=3Dy
> # CONFIG_SX9310 is not set
> # CONFIG_SX9500 is not set
> CONFIG_SRF08=3Dy
> # CONFIG_VCNL3020 is not set
> # CONFIG_VL53L0X_I2C is not set
> # end of Proximity and distance sensors
> =

> #
> # Resolver to digital converters
> #
> # end of Resolver to digital converters
> =

> #
> # Temperature sensors
> #
> # CONFIG_MLX90614 is not set
> CONFIG_MLX90632=3Dy
> # CONFIG_TMP006 is not set
> CONFIG_TMP007=3Dy
> # CONFIG_TSYS01 is not set
> CONFIG_TSYS02D=3Dy
> # end of Temperature sensors
> =

> CONFIG_NTB=3Dy
> CONFIG_NTB_IDT=3Dy
> CONFIG_NTB_SWITCHTEC=3Dy
> CONFIG_NTB_PINGPONG=3Dy
> # CONFIG_NTB_TOOL is not set
> CONFIG_NTB_PERF=3Dy
> # CONFIG_NTB_TRANSPORT is not set
> CONFIG_VME_BUS=3Dy
> =

> #
> # VME Bridge Drivers
> #
> CONFIG_VME_CA91CX42=3Dy
> CONFIG_VME_TSI148=3Dy
> CONFIG_VME_FAKE=3Dy
> =

> #
> # VME Board Drivers
> #
> # CONFIG_VMIVME_7805 is not set
> =

> #
> # VME Device Drivers
> #
> # CONFIG_VME_USER is not set
> # CONFIG_PWM is not set
> =

> #
> # IRQ chip support
> #
> CONFIG_MADERA_IRQ=3Dy
> # end of IRQ chip support
> =

> CONFIG_IPACK_BUS=3Dy
> CONFIG_BOARD_TPCI200=3Dy
> # CONFIG_SERIAL_IPOCTAL is not set
> CONFIG_RESET_CONTROLLER=3Dy
> # CONFIG_RESET_BRCMSTB_RESCAL is not set
> CONFIG_RESET_TI_SYSCON=3Dy
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> # CONFIG_BCM_KONA_USB2_PHY is not set
> # CONFIG_PHY_PXA_28NM_HSIC is not set
> CONFIG_PHY_PXA_28NM_USB2=3Dy
> CONFIG_PHY_CPCAP_USB=3Dy
> # CONFIG_PHY_QCOM_USB_HS is not set
> CONFIG_PHY_QCOM_USB_HSIC=3Dy
> # CONFIG_PHY_SAMSUNG_USB2 is not set
> CONFIG_PHY_TUSB1210=3Dy
> # CONFIG_PHY_INTEL_EMMC is not set
> # end of PHY Subsystem
> =

> # CONFIG_POWERCAP is not set
> # CONFIG_MCB is not set
> =

> #
> # Performance monitor support
> #
> # end of Performance monitor support
> =

> CONFIG_RAS=3Dy
> CONFIG_RAS_CEC=3Dy
> # CONFIG_RAS_CEC_DEBUG is not set
> # CONFIG_USB4 is not set
> =

> #
> # Android
> #
> # CONFIG_ANDROID is not set
> # end of Android
> =

> # CONFIG_DAX is not set
> # CONFIG_NVMEM is not set
> =

> #
> # HW tracing support
> #
> CONFIG_STM=3Dy
> # CONFIG_STM_PROTO_BASIC is not set
> # CONFIG_STM_PROTO_SYS_T is not set
> CONFIG_STM_DUMMY=3Dy
> CONFIG_STM_SOURCE_CONSOLE=3Dy
> # CONFIG_STM_SOURCE_HEARTBEAT is not set
> CONFIG_INTEL_TH=3Dy
> # CONFIG_INTEL_TH_PCI is not set
> # CONFIG_INTEL_TH_ACPI is not set
> CONFIG_INTEL_TH_GTH=3Dy
> CONFIG_INTEL_TH_STH=3Dy
> CONFIG_INTEL_TH_MSU=3Dy
> # CONFIG_INTEL_TH_PTI is not set
> CONFIG_INTEL_TH_DEBUG=3Dy
> # end of HW tracing support
> =

> CONFIG_FPGA=3Dy
> # CONFIG_ALTERA_PR_IP_CORE is not set
> CONFIG_FPGA_MGR_ALTERA_CVP=3Dy
> CONFIG_FPGA_BRIDGE=3Dy
> # CONFIG_ALTERA_FREEZE_BRIDGE is not set
> CONFIG_XILINX_PR_DECOUPLER=3Dy
> CONFIG_FPGA_REGION=3Dy
> # CONFIG_FPGA_DFL is not set
> # CONFIG_TEE is not set
> # CONFIG_SIOX is not set
> CONFIG_SLIMBUS=3Dy
> CONFIG_SLIM_QCOM_CTRL=3Dy
> # CONFIG_INTERCONNECT is not set
> # CONFIG_COUNTER is not set
> CONFIG_MOST=3Dy
> # CONFIG_MOST_USB_HDM is not set
> # end of Device Drivers
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> # CONFIG_VALIDATE_FS_PARSER is not set
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> # CONFIG_EXPORTFS_BLOCK_OPS is not set
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_MANDATORY_FILE_LOCKING=3Dy
> CONFIG_FS_ENCRYPTION=3Dy
> # CONFIG_FS_VERITY is not set
> CONFIG_FSNOTIFY=3Dy
> CONFIG_DNOTIFY=3Dy
> CONFIG_INOTIFY_USER=3Dy
> # CONFIG_FANOTIFY is not set
> # CONFIG_QUOTA is not set
> CONFIG_AUTOFS4_FS=3Dy
> CONFIG_AUTOFS_FS=3Dy
> CONFIG_FUSE_FS=3Dy
> # CONFIG_CUSE is not set
> # CONFIG_VIRTIO_FS is not set
> CONFIG_OVERLAY_FS=3Dy
> CONFIG_OVERLAY_FS_REDIRECT_DIR=3Dy
> CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=3Dy
> # CONFIG_OVERLAY_FS_INDEX is not set
> CONFIG_OVERLAY_FS_METACOPY=3Dy
> =

> #
> # Caches
> #
> CONFIG_FSCACHE=3Dy
> # CONFIG_FSCACHE_STATS is not set
> CONFIG_FSCACHE_HISTOGRAM=3Dy
> # CONFIG_FSCACHE_DEBUG is not set
> # CONFIG_FSCACHE_OBJECT_LIST is not set
> # end of Caches
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> # CONFIG_PROC_KCORE is not set
> # CONFIG_PROC_VMCORE is not set
> CONFIG_PROC_SYSCTL=3Dy
> CONFIG_PROC_PAGE_MONITOR=3Dy
> CONFIG_PROC_CHILDREN=3Dy
> CONFIG_PROC_PID_ARCH_STATUS=3Dy
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> CONFIG_TMPFS_POSIX_ACL=3Dy
> CONFIG_TMPFS_XATTR=3Dy
> # CONFIG_HUGETLBFS is not set
> CONFIG_MEMFD_CREATE=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> # end of Pseudo filesystems
> =

> CONFIG_MISC_FILESYSTEMS=3Dy
> CONFIG_ORANGEFS_FS=3Dy
> CONFIG_ECRYPT_FS=3Dy
> # CONFIG_ECRYPT_FS_MESSAGING is not set
> # CONFIG_CRAMFS is not set
> CONFIG_PSTORE=3Dy
> CONFIG_PSTORE_DEFLATE_COMPRESS=3Dy
> CONFIG_PSTORE_LZO_COMPRESS=3Dy
> CONFIG_PSTORE_LZ4_COMPRESS=3Dy
> CONFIG_PSTORE_LZ4HC_COMPRESS=3Dy
> CONFIG_PSTORE_842_COMPRESS=3Dy
> CONFIG_PSTORE_ZSTD_COMPRESS=3Dy
> CONFIG_PSTORE_COMPRESS=3Dy
> # CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT is not set
> CONFIG_PSTORE_LZO_COMPRESS_DEFAULT=3Dy
> # CONFIG_PSTORE_LZ4_COMPRESS_DEFAULT is not set
> # CONFIG_PSTORE_LZ4HC_COMPRESS_DEFAULT is not set
> # CONFIG_PSTORE_842_COMPRESS_DEFAULT is not set
> # CONFIG_PSTORE_ZSTD_COMPRESS_DEFAULT is not set
> CONFIG_PSTORE_COMPRESS_DEFAULT=3D"lzo"
> CONFIG_PSTORE_CONSOLE=3Dy
> CONFIG_PSTORE_PMSG=3Dy
> CONFIG_PSTORE_RAM=3Dy
> # CONFIG_NETWORK_FILESYSTEMS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> # CONFIG_NLS_CODEPAGE_437 is not set
> CONFIG_NLS_CODEPAGE_737=3Dy
> CONFIG_NLS_CODEPAGE_775=3Dy
> CONFIG_NLS_CODEPAGE_850=3Dy
> CONFIG_NLS_CODEPAGE_852=3Dy
> # CONFIG_NLS_CODEPAGE_855 is not set
> CONFIG_NLS_CODEPAGE_857=3Dy
> CONFIG_NLS_CODEPAGE_860=3Dy
> CONFIG_NLS_CODEPAGE_861=3Dy
> CONFIG_NLS_CODEPAGE_862=3Dy
> # CONFIG_NLS_CODEPAGE_863 is not set
> CONFIG_NLS_CODEPAGE_864=3Dy
> CONFIG_NLS_CODEPAGE_865=3Dy
> CONFIG_NLS_CODEPAGE_866=3Dy
> # CONFIG_NLS_CODEPAGE_869 is not set
> # CONFIG_NLS_CODEPAGE_936 is not set
> CONFIG_NLS_CODEPAGE_950=3Dy
> CONFIG_NLS_CODEPAGE_932=3Dy
> CONFIG_NLS_CODEPAGE_949=3Dy
> # CONFIG_NLS_CODEPAGE_874 is not set
> CONFIG_NLS_ISO8859_8=3Dy
> # CONFIG_NLS_CODEPAGE_1250 is not set
> # CONFIG_NLS_CODEPAGE_1251 is not set
> CONFIG_NLS_ASCII=3Dy
> CONFIG_NLS_ISO8859_1=3Dy
> CONFIG_NLS_ISO8859_2=3Dy
> CONFIG_NLS_ISO8859_3=3Dy
> CONFIG_NLS_ISO8859_4=3Dy
> CONFIG_NLS_ISO8859_5=3Dy
> # CONFIG_NLS_ISO8859_6 is not set
> CONFIG_NLS_ISO8859_7=3Dy
> CONFIG_NLS_ISO8859_9=3Dy
> # CONFIG_NLS_ISO8859_13 is not set
> CONFIG_NLS_ISO8859_14=3Dy
> CONFIG_NLS_ISO8859_15=3Dy
> CONFIG_NLS_KOI8_R=3Dy
> CONFIG_NLS_KOI8_U=3Dy
> # CONFIG_NLS_MAC_ROMAN is not set
> # CONFIG_NLS_MAC_CELTIC is not set
> # CONFIG_NLS_MAC_CENTEURO is not set
> CONFIG_NLS_MAC_CROATIAN=3Dy
> # CONFIG_NLS_MAC_CYRILLIC is not set
> # CONFIG_NLS_MAC_GAELIC is not set
> CONFIG_NLS_MAC_GREEK=3Dy
> # CONFIG_NLS_MAC_ICELAND is not set
> # CONFIG_NLS_MAC_INUIT is not set
> # CONFIG_NLS_MAC_ROMANIAN is not set
> # CONFIG_NLS_MAC_TURKISH is not set
> CONFIG_NLS_UTF8=3Dy
> # CONFIG_DLM is not set
> # CONFIG_UNICODE is not set
> CONFIG_IO_WQ=3Dy
> # end of File systems
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> # CONFIG_KEYS_REQUEST_CACHE is not set
> CONFIG_PERSISTENT_KEYRINGS=3Dy
> CONFIG_ENCRYPTED_KEYS=3Dy
> # CONFIG_KEY_DH_OPERATIONS is not set
> CONFIG_SECURITY_DMESG_RESTRICT=3Dy
> # CONFIG_SECURITY is not set
> CONFIG_SECURITYFS=3Dy
> CONFIG_PAGE_TABLE_ISOLATION=3Dy
> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> CONFIG_HARDENED_USERCOPY=3Dy
> CONFIG_HARDENED_USERCOPY_FALLBACK=3Dy
> CONFIG_HARDENED_USERCOPY_PAGESPAN=3Dy
> CONFIG_FORTIFY_SOURCE=3Dy
> # CONFIG_STATIC_USERMODEHELPER is not set
> CONFIG_DEFAULT_SECURITY_DAC=3Dy
> CONFIG_LSM=3D"lockdown,yama,loadpin,safesetid,integrity,bpf"
> =

> #
> # Kernel hardening options
> #
> =

> #
> # Memory initialization
> #
> CONFIG_INIT_STACK_NONE=3Dy
> # CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
> # CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
> # end of Memory initialization
> # end of Kernel hardening options
> # end of Security options
> =

> CONFIG_CRYPTO=3Dy
> =

> #
> # Crypto core or helper
> #
> CONFIG_CRYPTO_ALGAPI=3Dy
> CONFIG_CRYPTO_ALGAPI2=3Dy
> CONFIG_CRYPTO_AEAD=3Dy
> CONFIG_CRYPTO_AEAD2=3Dy
> CONFIG_CRYPTO_SKCIPHER=3Dy
> CONFIG_CRYPTO_SKCIPHER2=3Dy
> CONFIG_CRYPTO_HASH=3Dy
> CONFIG_CRYPTO_HASH2=3Dy
> CONFIG_CRYPTO_RNG=3Dy
> CONFIG_CRYPTO_RNG2=3Dy
> CONFIG_CRYPTO_RNG_DEFAULT=3Dy
> CONFIG_CRYPTO_AKCIPHER2=3Dy
> CONFIG_CRYPTO_AKCIPHER=3Dy
> CONFIG_CRYPTO_KPP2=3Dy
> CONFIG_CRYPTO_KPP=3Dy
> CONFIG_CRYPTO_ACOMP2=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> # CONFIG_CRYPTO_USER is not set
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> CONFIG_CRYPTO_PCRYPT=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dy
> # CONFIG_CRYPTO_TEST is not set
> CONFIG_CRYPTO_SIMD=3Dy
> CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
> CONFIG_CRYPTO_ENGINE=3Dy
> =

> #
> # Public-key cryptography
> #
> CONFIG_CRYPTO_RSA=3Dy
> CONFIG_CRYPTO_DH=3Dy
> CONFIG_CRYPTO_ECC=3Dy
> CONFIG_CRYPTO_ECDH=3Dy
> # CONFIG_CRYPTO_ECRDSA is not set
> # CONFIG_CRYPTO_CURVE25519 is not set
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dy
> CONFIG_CRYPTO_GCM=3Dy
> CONFIG_CRYPTO_CHACHA20POLY1305=3Dy
> CONFIG_CRYPTO_AEGIS128=3Dy
> CONFIG_CRYPTO_SEQIV=3Dy
> CONFIG_CRYPTO_ECHAINIV=3Dy
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> # CONFIG_CRYPTO_CFB is not set
> CONFIG_CRYPTO_CTR=3Dy
> CONFIG_CRYPTO_CTS=3Dy
> CONFIG_CRYPTO_ECB=3Dy
> CONFIG_CRYPTO_LRW=3Dy
> # CONFIG_CRYPTO_OFB is not set
> CONFIG_CRYPTO_PCBC=3Dy
> CONFIG_CRYPTO_XTS=3Dy
> # CONFIG_CRYPTO_KEYWRAP is not set
> # CONFIG_CRYPTO_ADIANTUM is not set
> # CONFIG_CRYPTO_ESSIV is not set
> =

> #
> # Hash modes
> #
> CONFIG_CRYPTO_CMAC=3Dy
> CONFIG_CRYPTO_HMAC=3Dy
> CONFIG_CRYPTO_XCBC=3Dy
> CONFIG_CRYPTO_VMAC=3Dy
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> # CONFIG_CRYPTO_CRC32C_INTEL is not set
> CONFIG_CRYPTO_CRC32=3Dy
> CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
> # CONFIG_CRYPTO_XXHASH is not set
> # CONFIG_CRYPTO_BLAKE2B is not set
> # CONFIG_CRYPTO_BLAKE2S is not set
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_POLY1305=3Dy
> CONFIG_CRYPTO_MD4=3Dy
> CONFIG_CRYPTO_MD5=3Dy
> # CONFIG_CRYPTO_MICHAEL_MIC is not set
> CONFIG_CRYPTO_RMD128=3Dy
> CONFIG_CRYPTO_RMD160=3Dy
> # CONFIG_CRYPTO_RMD256 is not set
> # CONFIG_CRYPTO_RMD320 is not set
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> CONFIG_CRYPTO_SHA3=3Dy
> # CONFIG_CRYPTO_SM3 is not set
> # CONFIG_CRYPTO_STREEBOG is not set
> # CONFIG_CRYPTO_TGR192 is not set
> CONFIG_CRYPTO_WP512=3Dy
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_TI=3Dy
> CONFIG_CRYPTO_AES_NI_INTEL=3Dy
> CONFIG_CRYPTO_ANUBIS=3Dy
> # CONFIG_CRYPTO_ARC4 is not set
> CONFIG_CRYPTO_BLOWFISH=3Dy
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
> CONFIG_CRYPTO_CAMELLIA=3Dy
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> CONFIG_CRYPTO_CAST5=3Dy
> CONFIG_CRYPTO_CAST6=3Dy
> CONFIG_CRYPTO_DES=3Dy
> CONFIG_CRYPTO_FCRYPT=3Dy
> CONFIG_CRYPTO_KHAZAD=3Dy
> CONFIG_CRYPTO_SALSA20=3Dy
> CONFIG_CRYPTO_CHACHA20=3Dy
> # CONFIG_CRYPTO_SEED is not set
> CONFIG_CRYPTO_SERPENT=3Dy
> CONFIG_CRYPTO_SERPENT_SSE2_586=3Dy
> # CONFIG_CRYPTO_SM4 is not set
> # CONFIG_CRYPTO_TEA is not set
> CONFIG_CRYPTO_TWOFISH=3Dy
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> CONFIG_CRYPTO_TWOFISH_586=3Dy
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> CONFIG_CRYPTO_LZO=3Dy
> CONFIG_CRYPTO_842=3Dy
> CONFIG_CRYPTO_LZ4=3Dy
> CONFIG_CRYPTO_LZ4HC=3Dy
> CONFIG_CRYPTO_ZSTD=3Dy
> =

> #
> # Random Number Generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=3Dy
> CONFIG_CRYPTO_DRBG_MENU=3Dy
> CONFIG_CRYPTO_DRBG_HMAC=3Dy
> # CONFIG_CRYPTO_DRBG_HASH is not set
> CONFIG_CRYPTO_DRBG_CTR=3Dy
> CONFIG_CRYPTO_DRBG=3Dy
> CONFIG_CRYPTO_JITTERENTROPY=3Dy
> CONFIG_CRYPTO_USER_API=3Dy
> # CONFIG_CRYPTO_USER_API_HASH is not set
> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> # CONFIG_CRYPTO_USER_API_RNG is not set
> CONFIG_CRYPTO_USER_API_AEAD=3Dy
> CONFIG_CRYPTO_HASH_INFO=3Dy
> =

> #
> # Crypto library routines
> #
> CONFIG_CRYPTO_LIB_AES=3Dy
> # CONFIG_CRYPTO_LIB_BLAKE2S is not set
> CONFIG_CRYPTO_LIB_CHACHA_GENERIC=3Dy
> # CONFIG_CRYPTO_LIB_CHACHA is not set
> # CONFIG_CRYPTO_LIB_CURVE25519 is not set
> CONFIG_CRYPTO_LIB_DES=3Dy
> CONFIG_CRYPTO_LIB_POLY1305_RSIZE=3D1
> CONFIG_CRYPTO_LIB_POLY1305_GENERIC=3Dy
> # CONFIG_CRYPTO_LIB_POLY1305 is not set
> # CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
> CONFIG_CRYPTO_LIB_SHA256=3Dy
> CONFIG_CRYPTO_HW=3Dy
> CONFIG_CRYPTO_DEV_PADLOCK=3Dy
> # CONFIG_CRYPTO_DEV_PADLOCK_AES is not set
> CONFIG_CRYPTO_DEV_PADLOCK_SHA=3Dy
> CONFIG_CRYPTO_DEV_GEODE=3Dy
> CONFIG_CRYPTO_DEV_ATMEL_I2C=3Dy
> CONFIG_CRYPTO_DEV_ATMEL_ECC=3Dy
> # CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
> # CONFIG_CRYPTO_DEV_CCP is not set
> CONFIG_CRYPTO_DEV_QAT=3Dy
> # CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
> CONFIG_CRYPTO_DEV_QAT_C3XXX=3Dy
> CONFIG_CRYPTO_DEV_QAT_C62X=3Dy
> # CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
> # CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
> CONFIG_CRYPTO_DEV_QAT_C62XVF=3Dy
> CONFIG_CRYPTO_DEV_VIRTIO=3Dy
> # CONFIG_CRYPTO_DEV_SAFEXCEL is not set
> # CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> CONFIG_X509_CERTIFICATE_PARSER=3Dy
> # CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
> CONFIG_PKCS7_MESSAGE_PARSER=3Dy
> # CONFIG_PKCS7_TEST_KEY is not set
> CONFIG_SIGNED_PE_FILE_VERIFICATION=3Dy
> =

> #
> # Certificates for signature checking
> #
> CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> CONFIG_SYSTEM_TRUSTED_KEYS=3D""
> CONFIG_SYSTEM_EXTRA_CERTIFICATE=3Dy
> CONFIG_SYSTEM_EXTRA_CERTIFICATE_SIZE=3D4096
> # CONFIG_SECONDARY_TRUSTED_KEYRING is not set
> # CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
> # end of Certificates for signature checking
> =

> CONFIG_BINARY_PRINTF=3Dy
> =

> #
> # Library routines
> #
> CONFIG_LINEAR_RANGES=3Dy
> # CONFIG_PACKING is not set
> CONFIG_BITREVERSE=3Dy
> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> CONFIG_GENERIC_STRNLEN_USER=3Dy
> CONFIG_GENERIC_NET_UTILS=3Dy
> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> CONFIG_CORDIC=3Dy
> CONFIG_PRIME_NUMBERS=3Dy
> CONFIG_RATIONAL=3Dy
> CONFIG_GENERIC_PCI_IOMAP=3Dy
> CONFIG_GENERIC_IOMAP=3Dy
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> CONFIG_ARCH_USE_SYM_ANNOTATIONS=3Dy
> CONFIG_CRC_CCITT=3Dy
> CONFIG_CRC16=3Dy
> CONFIG_CRC_T10DIF=3Dy
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> # CONFIG_CRC32_SELFTEST is not set
> # CONFIG_CRC32_SLICEBY8 is not set
> CONFIG_CRC32_SLICEBY4=3Dy
> # CONFIG_CRC32_SARWATE is not set
> # CONFIG_CRC32_BIT is not set
> CONFIG_CRC64=3Dy
> CONFIG_CRC4=3Dy
> # CONFIG_CRC7 is not set
> CONFIG_LIBCRC32C=3Dy
> CONFIG_CRC8=3Dy
> CONFIG_XXHASH=3Dy
> CONFIG_AUDIT_GENERIC=3Dy
> CONFIG_RANDOM32_SELFTEST=3Dy
> CONFIG_842_COMPRESS=3Dy
> CONFIG_842_DECOMPRESS=3Dy
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4_COMPRESS=3Dy
> CONFIG_LZ4HC_COMPRESS=3Dy
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_ZSTD_COMPRESS=3Dy
> CONFIG_ZSTD_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> CONFIG_XZ_DEC_X86=3Dy
> # CONFIG_XZ_DEC_POWERPC is not set
> # CONFIG_XZ_DEC_IA64 is not set
> # CONFIG_XZ_DEC_ARM is not set
> CONFIG_XZ_DEC_ARMTHUMB=3Dy
> # CONFIG_XZ_DEC_SPARC is not set
> CONFIG_XZ_DEC_BCJ=3Dy
> CONFIG_XZ_DEC_TEST=3Dy
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_XZ=3Dy
> CONFIG_DECOMPRESS_LZ4=3Dy
> CONFIG_DECOMPRESS_ZSTD=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dy
> CONFIG_REED_SOLOMON_ENC8=3Dy
> CONFIG_REED_SOLOMON_DEC8=3Dy
> CONFIG_INTERVAL_TREE=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_DMA_OPS=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_NEED_DMA_MAP_STATE=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> CONFIG_DMA_VIRT_OPS=3Dy
> CONFIG_SWIOTLB=3Dy
> # CONFIG_DMA_API_DEBUG is not set
> CONFIG_SGL_ALLOC=3Dy
> CONFIG_CPU_RMAP=3Dy
> CONFIG_DQL=3Dy
> CONFIG_GLOB=3Dy
> CONFIG_GLOB_SELFTEST=3Dy
> CONFIG_NLATTR=3Dy
> CONFIG_CLZ_TAB=3Dy
> CONFIG_IRQ_POLL=3Dy
> CONFIG_MPILIB=3Dy
> CONFIG_DIMLIB=3Dy
> CONFIG_OID_REGISTRY=3Dy
> CONFIG_HAVE_GENERIC_VDSO=3Dy
> CONFIG_GENERIC_GETTIMEOFDAY=3Dy
> CONFIG_GENERIC_VDSO_32=3Dy
> CONFIG_GENERIC_VDSO_TIME_NS=3Dy
> CONFIG_FONT_SUPPORT=3Dy
> CONFIG_FONT_8x16=3Dy
> CONFIG_FONT_AUTOSELECT=3Dy
> CONFIG_ARCH_STACKWALK=3Dy
> CONFIG_STACKDEPOT=3Dy
> CONFIG_STRING_SELFTEST=3Dy
> # end of Library routines
> =

> #
> # Kernel hacking
> #
> =

> #
> # printk and dmesg options
> #
> CONFIG_PRINTK_TIME=3Dy
> # CONFIG_PRINTK_CALLER is not set
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> # CONFIG_BOOT_PRINTK_DELAY is not set
> CONFIG_DYNAMIC_DEBUG=3Dy
> CONFIG_DYNAMIC_DEBUG_CORE=3Dy
> CONFIG_SYMBOLIC_ERRNAME=3Dy
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> # end of printk and dmesg options
> =

> #
> # Compile-time checks and compiler options
> #
> CONFIG_DEBUG_INFO=3Dy
> CONFIG_DEBUG_INFO_REDUCED=3Dy
> # CONFIG_DEBUG_INFO_COMPRESSED is not set
> # CONFIG_DEBUG_INFO_SPLIT is not set
> # CONFIG_DEBUG_INFO_DWARF4 is not set
> # CONFIG_GDB_SCRIPTS is not set
> # CONFIG_ENABLE_MUST_CHECK is not set
> CONFIG_FRAME_WARN=3D1024
> CONFIG_STRIP_ASM_SYMS=3Dy
> CONFIG_READABLE_ASM=3Dy
> # CONFIG_HEADERS_INSTALL is not set
> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> # CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_32B is not set
> CONFIG_FRAME_POINTER=3Dy
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> # end of Compile-time checks and compiler options
> =

> #
> # Generic Kernel Debugging Instruments
> #
> CONFIG_MAGIC_SYSRQ=3Dy
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> # CONFIG_MAGIC_SYSRQ_SERIAL is not set
> CONFIG_DEBUG_FS=3Dy
> CONFIG_DEBUG_FS_ALLOW_ALL=3Dy
> # CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
> # CONFIG_DEBUG_FS_ALLOW_NONE is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> # CONFIG_UBSAN is not set
> # end of Generic Kernel Debugging Instruments
> =

> CONFIG_DEBUG_KERNEL=3Dy
> CONFIG_DEBUG_MISC=3Dy
> =

> #
> # Memory Debugging
> #
> CONFIG_PAGE_EXTENSION=3Dy
> # CONFIG_DEBUG_PAGEALLOC is not set
> # CONFIG_PAGE_OWNER is not set
> CONFIG_PAGE_POISONING=3Dy
> CONFIG_PAGE_POISONING_NO_SANITY=3Dy
> # CONFIG_PAGE_POISONING_ZERO is not set
> # CONFIG_DEBUG_PAGE_REF is not set
> CONFIG_DEBUG_RODATA_TEST=3Dy
> CONFIG_ARCH_HAS_DEBUG_WX=3Dy
> # CONFIG_DEBUG_WX is not set
> CONFIG_GENERIC_PTDUMP=3Dy
> # CONFIG_PTDUMP_DEBUGFS is not set
> CONFIG_DEBUG_OBJECTS=3Dy
> # CONFIG_DEBUG_OBJECTS_SELFTEST is not set
> CONFIG_DEBUG_OBJECTS_FREE=3Dy
> # CONFIG_DEBUG_OBJECTS_TIMERS is not set
> CONFIG_DEBUG_OBJECTS_WORK=3Dy
> # CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
> # CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
> CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D1
> CONFIG_DEBUG_SLAB=3Dy
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> CONFIG_DEBUG_KMEMLEAK=3Dy
> CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=3D16000
> # CONFIG_DEBUG_KMEMLEAK_TEST is not set
> # CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
> CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN=3Dy
> CONFIG_DEBUG_STACK_USAGE=3Dy
> CONFIG_SCHED_STACK_END_CHECK=3Dy
> CONFIG_DEBUG_VM=3Dy
> # CONFIG_DEBUG_VM_VMACACHE is not set
> # CONFIG_DEBUG_VM_RB is not set
> CONFIG_DEBUG_VM_PGFLAGS=3Dy
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> # CONFIG_DEBUG_VIRTUAL is not set
> CONFIG_DEBUG_MEMORY_INIT=3Dy
> # CONFIG_DEBUG_PER_CPU_MAPS is not set
> # CONFIG_DEBUG_HIGHMEM is not set
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> # CONFIG_DEBUG_STACKOVERFLOW is not set
> CONFIG_CC_HAS_KASAN_GENERIC=3Dy
> CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=3Dy
> # end of Memory Debugging
> =

> CONFIG_DEBUG_SHIRQ=3Dy
> =

> #
> # Debug Oops, Lockups and Hangs
> #
> # CONFIG_PANIC_ON_OOPS is not set
> CONFIG_PANIC_ON_OOPS_VALUE=3D0
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_LOCKUP_DETECTOR=3Dy
> CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
> CONFIG_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HARDLOCKUP_DETECTOR=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D1
> # CONFIG_DETECT_HUNG_TASK is not set
> # CONFIG_WQ_WATCHDOG is not set
> # CONFIG_TEST_LOCKUP is not set
> # end of Debug Oops, Lockups and Hangs
> =

> #
> # Scheduler Debugging
> #
> CONFIG_SCHED_DEBUG=3Dy
> CONFIG_SCHED_INFO=3Dy
> CONFIG_SCHEDSTATS=3Dy
> # end of Scheduler Debugging
> =

> CONFIG_DEBUG_TIMEKEEPING=3Dy
> CONFIG_DEBUG_PREEMPT=3Dy
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
> CONFIG_PROVE_LOCKING=3Dy
> # CONFIG_PROVE_RAW_LOCK_NESTING is not set
> CONFIG_LOCK_STAT=3Dy
> CONFIG_DEBUG_RT_MUTEXES=3Dy
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> CONFIG_DEBUG_RWSEMS=3Dy
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> CONFIG_LOCKDEP=3Dy
> # CONFIG_DEBUG_LOCKDEP is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> CONFIG_DEBUG_LOCKING_API_SELFTESTS=3Dy
> # CONFIG_LOCK_TORTURE_TEST is not set
> CONFIG_WW_MUTEX_SELFTEST=3Dy
> # end of Lock Debugging (spinlocks, mutexes, etc...)
> =

> CONFIG_TRACE_IRQFLAGS=3Dy
> CONFIG_TRACE_IRQFLAGS_NMI=3Dy
> CONFIG_STACKTRACE=3Dy
> CONFIG_WARN_ALL_UNSEEDED_RANDOM=3Dy
> # CONFIG_DEBUG_KOBJECT is not set
> =

> #
> # Debug kernel data structures
> #
> # CONFIG_DEBUG_LIST is not set
> # CONFIG_DEBUG_PLIST is not set
> # CONFIG_DEBUG_SG is not set
> CONFIG_DEBUG_NOTIFIERS=3Dy
> # CONFIG_BUG_ON_DATA_CORRUPTION is not set
> # end of Debug kernel data structures
> =

> # CONFIG_DEBUG_CREDENTIALS is not set
> =

> #
> # RCU Debugging
> #
> CONFIG_PROVE_RCU=3Dy
> CONFIG_TORTURE_TEST=3Dy
> # CONFIG_RCU_PERF_TEST is not set
> CONFIG_RCU_TORTURE_TEST=3Dy
> # CONFIG_RCU_REF_SCALE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> CONFIG_RCU_TRACE=3Dy
> # CONFIG_RCU_EQS_DEBUG is not set
> # end of RCU Debugging
> =

> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> CONFIG_CPU_HOTPLUG_STATE_CONTROL=3Dy
> # CONFIG_LATENCYTOP is not set
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_NOP_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_TRACE_CLOCK=3Dy
> CONFIG_RING_BUFFER=3Dy
> CONFIG_EVENT_TRACING=3Dy
> CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> CONFIG_PREEMPTIRQ_TRACEPOINTS=3Dy
> CONFIG_TRACING=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> # CONFIG_FTRACE is not set
> CONFIG_PROVIDE_OHCI1394_DMA_INIT=3Dy
> # CONFIG_SAMPLES is not set
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> CONFIG_STRICT_DEVMEM=3Dy
> # CONFIG_IO_STRICT_DEVMEM is not set
> =

> #
> # x86 Debugging
> #
> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=3Dy
> CONFIG_EARLY_PRINTK_USB=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> CONFIG_EARLY_PRINTK_DBGP=3Dy
> CONFIG_EARLY_PRINTK_USB_XDBC=3Dy
> CONFIG_DEBUG_TLBFLUSH=3Dy
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> # CONFIG_X86_DECODER_SELFTEST is not set
> # CONFIG_IO_DELAY_0X80 is not set
> # CONFIG_IO_DELAY_0XED is not set
> # CONFIG_IO_DELAY_UDELAY is not set
> CONFIG_IO_DELAY_NONE=3Dy
> # CONFIG_DEBUG_BOOT_PARAMS is not set
> # CONFIG_CPA_DEBUG is not set
> # CONFIG_DEBUG_ENTRY is not set
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> # CONFIG_X86_DEBUG_FPU is not set
> CONFIG_PUNIT_ATOM_DEBUG=3Dy
> CONFIG_UNWINDER_FRAME_POINTER=3Dy
> # end of x86 Debugging
> =

> #
> # Kernel Testing and Coverage
> #
> # CONFIG_KUNIT is not set
> CONFIG_NOTIFIER_ERROR_INJECTION=3Dy
> # CONFIG_PM_NOTIFIER_ERROR_INJECT is not set
> # CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
> CONFIG_FAULT_INJECTION=3Dy
> CONFIG_FAILSLAB=3Dy
> # CONFIG_FAIL_PAGE_ALLOC is not set
> # CONFIG_FAIL_FUTEX is not set
> CONFIG_FAULT_INJECTION_DEBUG_FS=3Dy
> CONFIG_FAIL_MMC_REQUEST=3Dy
> CONFIG_FAULT_INJECTION_STACKTRACE_FILTER=3Dy
> CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
> # CONFIG_RUNTIME_TESTING_MENU is not set
> # CONFIG_MEMTEST is not set
> # end of Kernel Testing and Coverage
> # end of Kernel hacking

> #!/bin/sh
> =

> export_top_env()
> {
> 	export suite=3D'boot'
> 	export testcase=3D'boot'
> 	export category=3D'functional'
> 	export timeout=3D'10m'
> 	export job_origin=3D'/lkp-src/allot/rand/vm-snb-i386/boot.yaml'
> 	export queue_cmdline_keys=3D'branch
> commit'
> 	export queue=3D'bisect'
> 	export testbox=3D'vm-snb-i386-31'
> 	export tbox_group=3D'vm-snb-i386'
> 	export branch=3D'linux-review/Zbigniew-Kempczy-ski/drm-i915-Ensure-bo-is=
-dirty-when-WB-mapped-on-llc-in-pagefault-handler/20200921-115158'
> 	export commit=3D'6509ca051abf4ff60d63732badcb2173a715f741'
> 	export kconfig=3D'i386-randconfig-a013-20200921'
> 	export nr_vm=3D64
> 	export submit_id=3D'5f6c58ff32288633e09c3931'
> 	export job_file=3D'/lkp/jobs/scheduled/vm-snb-i386-31/boot-1-debian-i386=
-20191205.cgz-6509ca051abf4ff60d63732badcb2173a715f741-20200924-13280-pv2sj=
e-1.yaml'
> 	export id=3D'56cd19c98425b8f719f3991105ad05e607875dbe'
> 	export queuer_version=3D'/lkp-src'
> 	export model=3D'qemu-system-i386 -enable-kvm -cpu SandyBridge'
> 	export nr_cpu=3D2
> 	export memory=3D'8G'
> 	export need_kconfig=3D'CONFIG_KVM_GUEST=3Dy'
> 	export ssh_base_port=3D23032
> 	export rootfs=3D'debian-i386-20191205.cgz'
> 	export compiler=3D'gcc-9'
> 	export enqueue_time=3D'2020-09-24 16:29:52 +0800'
> 	export _id=3D'5f6c60fe32288633e09c3932'
> 	export _rt=3D'/result/boot/1/vm-snb-i386/debian-i386-20191205.cgz/i386-r=
andconfig-a013-20200921/gcc-9/6509ca051abf4ff60d63732badcb2173a715f741'
> 	export user=3D'lkp'
> 	export result_root=3D'/result/boot/1/vm-snb-i386/debian-i386-20191205.cg=
z/i386-randconfig-a013-20200921/gcc-9/6509ca051abf4ff60d63732badcb2173a715f=
741/3'
> 	export scheduler_version=3D'/lkp/lkp/.src-20200923-125233'
> 	export LKP_SERVER=3D'inn'
> 	export arch=3D'i386'
> 	export max_uptime=3D600
> 	export initrd=3D'/osimage/debian/debian-i386-20191205.cgz'
> 	export bootloader_append=3D'root=3D/dev/ram0
> user=3Dlkp
> job=3D/lkp/jobs/scheduled/vm-snb-i386-31/boot-1-debian-i386-20191205.cgz-=
6509ca051abf4ff60d63732badcb2173a715f741-20200924-13280-pv2sje-1.yaml
> ARCH=3Di386
> kconfig=3Di386-randconfig-a013-20200921
> branch=3Dlinux-review/Zbigniew-Kempczy-ski/drm-i915-Ensure-bo-is-dirty-wh=
en-WB-mapped-on-llc-in-pagefault-handler/20200921-115158
> commit=3D6509ca051abf4ff60d63732badcb2173a715f741
> BOOT_IMAGE=3D/pkg/linux/i386-randconfig-a013-20200921/gcc-9/6509ca051abf4=
ff60d63732badcb2173a715f741/vmlinuz-5.9.0-rc4-00881-g6509ca051abf4
> max_uptime=3D600
> RESULT_ROOT=3D/result/boot/1/vm-snb-i386/debian-i386-20191205.cgz/i386-ra=
ndconfig-a013-20200921/gcc-9/6509ca051abf4ff60d63732badcb2173a715f741/3
> LKP_SERVER=3Dinn
> selinux=3D0
> debug
> apic=3Ddebug
> sysrq_always_enabled
> rcupdate.rcu_cpu_stall_timeout=3D100
> net.ifnames=3D0
> printk.devkmsg=3Don
> panic=3D-1
> softlockup_panic=3D1
> nmi_watchdog=3Dpanic
> oops=3Dpanic
> load_ramdisk=3D2
> prompt_ramdisk=3D0
> drbd.minor_count=3D8
> systemd.log_level=3Derr
> ignore_loglevel
> console=3Dtty0
> earlyprintk=3DttyS0,115200
> console=3DttyS0,115200
> vga=3Dnormal
> rw'
> 	export modules_initrd=3D'/pkg/linux/i386-randconfig-a013-20200921/gcc-9/=
6509ca051abf4ff60d63732badcb2173a715f741/modules.cgz'
> 	export lkp_initrd=3D'/osimage/user/lkp/lkp-i386.cgz'
> 	export site=3D'inn'
> 	export LKP_CGI_PORT=3D80
> 	export LKP_CIFS_PORT=3D139
> 	export schedule_notify_address=3D
> 	export kernel=3D'/pkg/linux/i386-randconfig-a013-20200921/gcc-9/6509ca05=
1abf4ff60d63732badcb2173a715f741/vmlinuz-5.9.0-rc4-00881-g6509ca051abf4'
> 	export dequeue_time=3D'2020-09-24 17:32:00 +0800'
> 	export job_initrd=3D'/lkp/jobs/scheduled/vm-snb-i386-31/boot-1-debian-i3=
86-20191205.cgz-6509ca051abf4ff60d63732badcb2173a715f741-20200924-13280-pv2=
sje-1.cgz'
> =

> 	[ -n "$LKP_SRC" ] ||
> 	export LKP_SRC=3D/lkp/${user:-lkp}/src
> }
> =

> run_job()
> {
> 	echo $$ > $TMP/run-job.pid
> =

> 	. $LKP_SRC/lib/http.sh
> 	. $LKP_SRC/lib/job.sh
> 	. $LKP_SRC/lib/env.sh
> =

> 	export_top_env
> =

> 	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-slabinfo
> 	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-meminfo
> 	run_monitor $LKP_SRC/monitors/one-shot/wrapper memmap
> 	run_monitor $LKP_SRC/monitors/no-stdout/wrapper boot-time
> 	run_monitor $LKP_SRC/monitors/wrapper kmsg
> 	run_monitor $LKP_SRC/monitors/wrapper heartbeat
> 	run_monitor $LKP_SRC/monitors/wrapper meminfo
> 	run_monitor $LKP_SRC/monitors/wrapper oom-killer
> 	run_monitor $LKP_SRC/monitors/plain/watchdog
> =

> 	run_test $LKP_SRC/tests/wrapper sleep 1
> }
> =

> extract_stats()
> {
> 	export stats_part_begin=3D
> 	export stats_part_end=3D
> =

> 	$LKP_SRC/stats/wrapper boot-slabinfo
> 	$LKP_SRC/stats/wrapper boot-meminfo
> 	$LKP_SRC/stats/wrapper memmap
> 	$LKP_SRC/stats/wrapper boot-memory
> 	$LKP_SRC/stats/wrapper boot-time
> 	$LKP_SRC/stats/wrapper kernel-size
> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper sleep
> 	$LKP_SRC/stats/wrapper meminfo
> =

> 	$LKP_SRC/stats/wrapper time sleep.time
> 	$LKP_SRC/stats/wrapper dmesg
> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper last_state
> 	$LKP_SRC/stats/wrapper stderr
> 	$LKP_SRC/stats/wrapper time
> }
> =

> "$@"



-- =

Ville Syrj=C3=A4l=C3=A4
Intel
--===============4772137383203616211==--

