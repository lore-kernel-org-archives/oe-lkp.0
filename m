Content-Type: multipart/mixed; boundary="===============9058491653262922338=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/mm/64] f154f29085: BUG:kernel_reboot-without-warning_in_boot_stage
Date: Tue, 14 Dec 2021 17:38:57 +0100
Message-ID: <YbjIoewxGaodXHKF@zn.tnic>
In-Reply-To: <20211209144141.GC25654@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============9058491653262922338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 10:41:41PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with clang-14):
> =

> commit: f154f290855b070cc94dd44ad253c0ef8a9337bb ("x86/mm/64: Flush globa=
l TLB on boot and AP bringup")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git x86/mm
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +-------------------------------------------------+------------+---------=
---+
> |                                                 | 9de4999050 | f154f290=
85 |
> +-------------------------------------------------+------------+---------=
---+
> | BUG:kernel_reboot-without-warning_in_boot_stage | 0          | 13      =
   |
> +-------------------------------------------------+------------+---------=
---+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> Physical KASLR using RDTSC...
> Virtual KASLR using RDTSC...
> =

> Decompressing Linux... Parsing ELF... Performing relocations... done.
> Booting the kernel.
> BUG: kernel reboot-without-warning in boot stage
> Linux version 5.16.0-rc3-00003-gf154f290855b #1
> Command line: ip=3D::::vm-snb-192::dhcp root=3D/dev/ram0 user=3Dlkp job=
=3D/lkp/jobs/scheduled/vm-snb-192/boot-1-debian-10.4-x86_64-20200603.cgz-f1=
54f290855b070cc94dd44ad253c0ef8a9337bb-20211208-23538-lnvkeg-5.yaml ARCH=3D=
x86_64 kconfig=3Dx86_64-randconfig-a013-20211207 branch=3Dtip/x86/mm commit=
=3Df154f290855b070cc94dd44ad253c0ef8a9337bb BOOT_IMAGE=3D/pkg/linux/x86_64-=
randconfig-a013-20211207/clang-14/f154f290855b070cc94dd44ad253c0ef8a9337bb/=
vmlinuz-5.16.0-rc3-00003-gf154f290855b vmalloc=3D128M initramfs_async=3D0 p=
age_owner=3Don max_uptime=3D600 RESULT_ROOT=3D/result/boot/1/vm-snb/debian-=
10.4-x86_64-20200603.cgz/x86_64-randconfig-a013-20211207/clang-14/f154f2908=
55b070cc94dd44ad253c0ef8a9337bb/3 LKP_SERVER=3Dinternal-lkp-server selinux=
=3D0 debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=
=3D100 net.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 =
nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.=
minor_count=3D8 systemd.log_level=3Derr ignore_loglevel console=3Dtty0 earl=
yprintk=3DttyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw rcuperf.shutd=
own=3D0 watchdog_thresh=3D240
> =

> Kboot worker: lkp-worker30
> Elapsed time: 60

My guest boots fine here on an AMD host, albeit it takes a while until
"Booting the kernel" appears.

You probably should verify by hand whether your guest simply needs
longer before it starts booting the kernel...

early console in setup code
early console in extract_kernel
input_data: 0x0000000005ce82e0
input_len: 0x0000000001d21920
output: 0x0000000001000000
output_len: 0x000000000650d2ec
kernel_total_size: 0x0000000006e2c000
needed_size: 0x0000000007000000
trampoline_32bit: 0x000000000009d000
Physical KASLR using RDTSC...
Virtual KASLR using RDTSC...

Decompressing Linux... Parsing ELF... Performing relocations... done.
Booting the kernel.
[    0.000000][    T0] Linux version 5.16.0-rc3-00005-g35fa745286ac (boris(=
a)zn) (ClangBuiltLinux clang version 14.0.0 (https://github.com/llvm/llvm-p=
roject 08a770c378ca5d8975ef305d15f297c3f980d186), GNU ld (GNU Binutils for =
Debian) 2.37) #3 PREEMPT Tue Dec 14 17:29:41 CET 2021
[    0.000000][    T0] Command line: root=3D/dev/sda1 resume=3D/dev/sda2 de=
bug ignore_loglevel log_buf_len=3D16M earlyprintk=3DttyS0,115200 console=3D=
ttyS0,115200 console=3Dtty0 no_console_suspend net.ifnames=3D0 =

[    0.000000][    T0] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floati=
ng point registers'
[    0.000000][    T0] x86/fpu: Supporting XSAVE feature 0x002: 'SSE regist=
ers'
[    0.000000][    T0] x86/fpu: Supporting XSAVE feature 0x004: 'AVX regist=
ers'
[    0.000000][    T0] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  2=
56
[    0.000000][    T0] x86/fpu: Enabled xstate features 0x7, context size i=
s 832 bytes, using 'standard' format.
[    0.000000][    T0] signal: max sigframe size: 1360
[    0.000000][    T0] printk: debug: ignoring loglevel setting.
[    0.000000][    T0] printk: bootconsole [earlyser0] enabled
[    0.000000][    T0] BIOS-provided physical RAM map:
...

-- =

Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Ivo Totev, HRB 36809, AG N=C3=BCr=
nberg
--===============9058491653262922338==--

