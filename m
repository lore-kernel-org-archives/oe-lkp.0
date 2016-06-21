Content-Type: multipart/mixed; boundary="===============4242740292633639053=="
MIME-Version: 1.0
From: Yu Chen <yu.chen.surf@gmail.com>
To: lkp@lists.01.org
Subject: Re: [x86 tsc] 19fa5e7364: WARNING: CPU: 0 PID: 0 at arch/x86/mm/extable.c:50 ex_handler_rdmsr_unsafe+0x72/0x80
Date: Tue, 21 Jun 2016 13:41:39 +0800
Message-ID: <CADjb_WQVKRWZs+d2iK17i42_kRHBN=m8xo5i3ydDv1QWbT5MyA@mail.gmail.com>
In-Reply-To: <20160620073122.GA6156@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4242740292633639053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 20, 2016 at 3:31 PM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed the following commit:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux.git x86
> commit 19fa5e73647fde1e6a7038a8f05cddf4c43f08d3 ("x86 tsc: enumerate SKL =
cpu_khz and tsc_khz via CPUID")
>
>
> on test machine: vm-kbuild-yocto-x86_64: 1 threads qemu-system-x86_64 -en=
able-kvm -cpu SandyBridge with 320M memory
>
> caused below changes:
>
>
> +------------------------------------------------------------------+-----=
-------+------------+
> |                                                                  | cc50=
dc7f73 | 19fa5e7364 |
> +------------------------------------------------------------------+-----=
-------+------------+
> | boot_successes                                                   | 0   =
       | 0          |
> | boot_failures                                                    | 10  =
       | 12         |
> | invoked_oom-killer:gfp_mask=3D0x                                   | 10=
         | 10         |
> | Mem-Info                                                         | 10  =
       | 10         |
> | Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes | 10  =
       | 10         |
> | backtrace:btrfs_test_extent_io                                   | 10  =
       | 10         |
> | backtrace:init_btrfs_fs                                          | 10  =
       | 10         |
> | backtrace:kernel_init_freeable                                   | 10  =
       | 10         |
> | WARNING:at_arch/x86/mm/extable.c:#ex_handler_rdmsr_unsafe        | 0   =
       | 10         |
> | backtrace:native_calibrate_cpu                                   | 0   =
       | 10         |
> | backtrace:tsc_init                                               | 0   =
       | 10         |
> | backtrace:x86_late_time_init                                     | 0   =
       | 10         |
> +------------------------------------------------------------------+-----=
-------+------------+
>
>
>
> [    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff=
, max_idle_ns: 19112604467 ns
> [    0.000000] hpet clockevent registered
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] WARNING: CPU: 0 PID: 0 at arch/x86/mm/extable.c:50 ex_hand=
ler_rdmsr_unsafe+0x72/0x80
> [    0.000000] unchecked MSR access error: RDMSR from 0xce
> [    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.7.0-rc3-00009-=
g19fa5e7 #1
> [    0.000000] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [    0.000000]  0000000000000000 ffffffff83203c38 ffffffff816da89d ffffff=
ff83203c88
> [    0.000000]  0000000000000000 ffffffff82e71808 ffffffff8104e8c2 ffffff=
ff83203c78
> [    0.000000]  ffffffff810b796b 000000328453b4a0 ffffffff82e71808 000000=
0000000032
> [    0.000000] Call Trace:
> [    0.000000]  [<ffffffff816da89d>] dump_stack+0x83/0xb6
> [    0.000000]  [<ffffffff8104e8c2>] ? ex_handler_rdmsr_unsafe+0x72/0x80
> [    0.000000]  [<ffffffff810b796b>] __warn+0x10b/0x130
> [    0.000000]  [<ffffffff810b79f3>] warn_slowpath_fmt+0x63/0x70
> [    0.000000]  [<ffffffff8104e8c2>] ex_handler_rdmsr_unsafe+0x72/0x80
> [    0.000000]  [<ffffffff8104ea26>] fixup_exception+0x46/0x60
> [    0.000000]  [<ffffffff81020fdb>] do_general_protection+0x7b/0x150
> [    0.000000]  [<ffffffff828101d8>] general_protection+0x28/0x30
> [    0.000000]  [<ffffffff810496d6>] ? native_read_msr+0x6/0x20
> [    0.000000]  [<ffffffff810281e1>] cpu_khz_from_msr+0xf1/0x150
> [    0.000000]  [<ffffffff8341b16b>] ? trap_init+0x22e/0x22e
> [    0.000000]  [<ffffffff81027935>] native_calibrate_cpu+0x85/0x5b0
> [    0.000000]  [<ffffffff81049826>] ? native_restore_fl+0x6/0x10
> [    0.000000]  [<ffffffff81112556>] ? __setup_irq+0x196/0x750
> [    0.000000]  [<ffffffff8341b16b>] ? trap_init+0x22e/0x22e
> [    0.000000]  [<ffffffff8341ec3f>] tsc_init+0x42/0x3c3
> [    0.000000]  [<ffffffff81112c5f>] ? setup_irq+0x6f/0xc0
> [    0.000000]  [<ffffffff8341b16b>] ? trap_init+0x22e/0x22e
> [    0.000000]  [<ffffffff8341b16b>] ? trap_init+0x22e/0x22e
> [    0.000000]  [<ffffffff8341b17a>] x86_late_time_init+0xf/0x11
> [    0.000000]  [<ffffffff8341b17a>] ? x86_late_time_init+0xf/0x11
> [    0.000000]  [<ffffffff83414173>] start_kernel+0x3f3/0x4b1
> [    0.000000]  [<ffffffff83413120>] ? early_idt_handler_array+0x120/0x120
> [    0.000000]  [<ffffffff8341329e>] x86_64_start_reservations+0x2f/0x31
> [    0.000000]  [<ffffffff83413386>] x86_64_start_kernel+0xe6/0xf3
> [    0.000000] ---[ end trace 7c0d92684f22f4ac ]---
> [    0.000000] tsc: Fast TSC calibration using PIT
>
>
> FYI, raw QEMU command line is:
>
>         qemu-system-x86_64 -enable-kvm -cpu SandyBridge -kernel /pkg/linu=
x/x86_64-randconfig-w0-06180628/gcc-6/19fa5e73647fde1e6a7038a8f05cddf4c43f0=
8d3/vmlinuz-4.7.0-rc3-00009-g19fa5e7 -append 'root=3D/dev/ram0 user=3Dlkp j=
ob=3D/lkp/scheduled/vm-kbuild-yocto-x86_64-32/bisect_boot-1-yocto-minimal-x=
86_64.cgz-x86_64-randconfig-w0-06180628-19fa5e73647fde1e6a7038a8f05cddf4c43=
f08d3-20160618-25535-h82bax-0.yaml~ ARCH=3Dx86_64 kconfig=3Dx86_64-randconf=
ig-w0-06180628 branch=3Dinternal-eywa/master commit=3D19fa5e73647fde1e6a703=
8a8f05cddf4c43f08d3 BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-w0-06180628/g=
cc-6/19fa5e73647fde1e6a7038a8f05cddf4c43f08d3/vmlinuz-4.7.0-rc3-00009-g19fa=
5e7 max_uptime=3D600 RESULT_ROOT=3D/result/boot/1/vm-kbuild-yocto-x86_64/yo=
cto-minimal-x86_64.cgz/x86_64-randconfig-w0-06180628/gcc-6/19fa5e73647fde1e=
6a7038a8f05cddf4c43f08d3/0 LKP_SERVER=3Dinn earlyprintk=3DttyS0,115200 syst=
emd.log_level=3Derr debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cp=
u_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic =
oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 con=
sole=3Dtty0 vga=3Dnormal rw ip=3D::::vm-kbuild-yocto-x86_64-32::dhcp drbd.m=
inor_count=3D8'  -initrd /fs/sdh1/initrd-vm-kbuild-yocto-x86_64-32 -m 320 -=
smp 1 -device e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 -boot order=3Dnc -=
no-reboot -watchdog i6300esb -rtc base=3Dlocaltime -drive file=3D/fs/sdh1/d=
isk0-vm-kbuild-yocto-x86_64-32,media=3Ddisk,if=3Dvirtio -pidfile /dev/shm/k=
boot/pid-vm-kbuild-yocto-x86_64-32 -serial file:/dev/shm/kboot/serial-vm-kb=
uild-yocto-x86_64-32 -daemonize -display none -monitor null
>
This  problem was caused due to kvm does not support MSR_PLATFORM_INFO(0xce=
),
according to Wanpeng's feedback.

Hi Wanpeng, is it possible for kvm to simulate this MSR, otherwise we
might have to use
rdmsr_safe instead.

-- =

thanks,
Yu

--===============4242740292633639053==--

