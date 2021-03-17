Content-Type: multipart/mixed; boundary="===============0817016281330578470=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [KEYS] 4a00e5e212: WARNING:at_arch/x86/kernel/static_call.c:#__static_call_validate
Date: Wed, 17 Mar 2021 11:01:01 +0800
Message-ID: <20210317030101.GB22345@xsang-OptiPlex-9020>
In-Reply-To: <CAFA6WYNMHAqqmNfncmJm3+BUYCktXouRtV_udSxQb7eifPmX+Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0817016281330578470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sumit,

On Tue, Mar 16, 2021 at 01:34:34PM +0530, Sumit Garg wrote:
> Hi Oliver,
> =

> On Mon, 15 Mar 2021 at 19:55, kernel test robot <oliver.sang@intel.com>=
 wrote:
> >
> >
> >
> > Greeting,
> >
> > FYI, we noticed the following commit (built with gcc-9):
> >
> > commit: 4a00e5e21215a60820e0d8b62423c7f04a76dec9 ("KEYS: trusted: Add g=
eneric trusted keys framework")
> > git://git.kernel.org/cgit/linux/kernel/git/jarkko/linux-tpmdd.git master
> >
> >
> > in testcase: trinity
> > version: trinity-x86_64-4d2343bd-1_20210105
> > with following parameters:
> >
> >         group: group-02
> >
> > test-description: Trinity is a linux system call fuzz tester.
> > test-url: http://codemonkey.org.uk/projects/trinity/
> >
> >
> > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2=
 -m 8G
> >
> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> >
> >
> > +------------------------------------------------------------------+---=
---------+------------+
> > |                                                                  | 74=
7b3232d6 | 4a00e5e212 |
> > +------------------------------------------------------------------+---=
---------+------------+
> > | boot_successes                                                   | 27=
         | 0          |
> > | boot_failures                                                    | 0 =
         | 18         |
> > | WARNING:at_arch/x86/kernel/static_call.c:#__static_call_validate | 0 =
         | 18         |
> > | RIP:__static_call_validate                                       | 0 =
         | 18         |
> > | WARNING:at_kernel/static_call.c:#__static_call_update            | 0 =
         | 18         |
> > | RIP:__static_call_update                                         | 0 =
         | 18         |
> > +------------------------------------------------------------------+---=
---------+------------+
> >
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> >
> =

> Thanks for this report. It looks like the following change should fix
> this problem. And since I don't possess a x86 development machine
> which actually supports static calls, can you verify this fix?

I tested below patch, the issue still exists:
(full dmesg attached FYI)
[    0.000000] ------------[ cut here ]------------
[    0.000000] unexpected static_call insn opcode 0xe9 at cleanup_trusted+0=
x0/0x5
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/x86/kernel/static_call.c:77 _=
_static_call_validate+0x68/0x80
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.12.0-rc2-00291-g8a=
470a9f302c #1
[    0.000000] RIP: 0010:__static_call_validate+0x68/0x80
[    0.000000] Code: 05 ff 53 1d 01 75 d7 0f b6 05 fa 53 1d 01 38 47 04 75 =
cb c3 48 89 fa 48 c7 c7 b8 99 33 b6 c6 05 8e d6 d7 01 01 e8 cd 7e b6 00 <0f=
> 0b
 c3 0f b6 4a 04 38 4f 04 75 c9 c3 c3 66 2e 0f 1f 84 00 00 00
[    0.000000] RSP: 0000:ffffffffb6603e68 EFLAGS: 00010086 ORIG_RAX: 000000=
0000000000
[    0.000000] RAX: 0000000000000000 RBX: 0000000000000000 RCX: c0000000fff=
f7fff
[    0.000000] RDX: ffffffffb6603c88 RSI: 00000000ffff7fff RDI: ffffffffb73=
6c2ac
[    0.000000] RBP: ffffffffb72e7044 R08: 0000000000000000 R09: ffffffffb66=
03c80
[    0.000000] R10: 0000000000000001 R11: 0000000000000001 R12: 00000000000=
00000
[    0.000000] R13: 0000000000000000 R14: ffffffffb72e7044 R15: ffffffffb64=
5e9c4
[    0.000000] FS:  0000000000000000(0000) GS:ffffffffb7086000(0000) knlGS:=
0000000000000000
[    0.000000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.000000] CR2: ffff888000013ef0 CR3: 000000011ed20000 CR4: 00000000000=
406a0
[    0.000000] Call Trace:
[    0.000000]  ? arch_static_call_transform+0x5d/0xa0
[    0.000000]  ? __static_call_init+0x15f/0x220
[    0.000000]  ? static_call_init+0x42/0x81
[    0.000000]  ? setup_arch+0xc2/0x9ef
[    0.000000]  ? start_kernel+0x60/0x4d4
[    0.000000]  ? load_ucode_bsp+0x46/0x133
[    0.000000]  ? secondary_startup_64_no_verify+0xc2/0xcb
[    0.000000] random: get_random_bytes called from print_oops_end_marker+0=
x26/0x40 with crng_init=3D0
[    0.000000] ---[ end trace 0000000000000000 ]---

> =

> diff --git a/security/keys/trusted-keys/trusted_core.c
> b/security/keys/trusted-keys/trusted_core.c
> index ec3a066a4b42..bfbe497bf33b 100644
> --- a/security/keys/trusted-keys/trusted_core.c
> +++ b/security/keys/trusted-keys/trusted_core.c
> @@ -349,7 +349,7 @@ static int __init init_trusted(void)
> =

>  static void __exit cleanup_trusted(void)
>  {
> -       static_call(trusted_key_exit)();
> +       static_call_cond(trusted_key_exit)();
>  }
> =

>  late_initcall(init_trusted);
> =

> -Sumit
> =

> >
> > [    0.000000] WARNING: CPU: 0 PID: 0 at arch/x86/kernel/static_call.c:=
77 __static_call_validate (kbuild/src/consumer/arch/x86/kernel/static_call.=
c:77 (discriminator 3))
> > [    0.000000] Modules linked in:
> > [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.12.0-rc2-00290=
-g4a00e5e21215 #1
> > [    0.000000] RIP: 0010:__static_call_validate (kbuild/src/consumer/ar=
ch/x86/kernel/static_call.c:77 (discriminator 3))
> > [ 0.000000] Code: 05 ff 53 1d 01 75 d7 0f b6 05 fa 53 1d 01 38 47 04 75=
 cb c3 48 89 fa 48 c7 c7 b8 99 73 b2 c6 05 8e d6 d7 01 01 e8 cd 7e b6 00 <0=
f> 0b c3 0f b6 4a 04 38 4f 04 75 c9 c3 c3 66 2e 0f 1f 84 00 00 00
> > All code
> > =3D=3D=3D=3D=3D=3D=3D=3D
> >    0:   05 ff 53 1d 01          add    $0x11d53ff,%eax
> >    5:   75 d7                   jne    0xffffffffffffffde
> >    7:   0f b6 05 fa 53 1d 01    movzbl 0x11d53fa(%rip),%eax        # 0x=
11d5408
> >    e:   38 47 04                cmp    %al,0x4(%rdi)
> >   11:   75 cb                   jne    0xffffffffffffffde
> >   13:   c3                      retq
> >   14:   48 89 fa                mov    %rdi,%rdx
> >   17:   48 c7 c7 b8 99 73 b2    mov    $0xffffffffb27399b8,%rdi
> >   1e:   c6 05 8e d6 d7 01 01    movb   $0x1,0x1d7d68e(%rip)        # 0x=
1d7d6b3
> >   25:   e8 cd 7e b6 00          callq  0xb67ef7
> >   2a:*  0f 0b                   ud2             <-- trapping instruction
> >   2c:   c3                      retq
> >   2d:   0f b6 4a 04             movzbl 0x4(%rdx),%ecx
> >   31:   38 4f 04                cmp    %cl,0x4(%rdi)
> >   34:   75 c9                   jne    0xffffffffffffffff
> >   36:   c3                      retq
> >   37:   c3                      retq
> >   38:   66                      data16
> >   39:   2e                      cs
> >   3a:   0f                      .byte 0xf
> >   3b:   1f                      (bad)
> >   3c:   84 00                   test   %al,(%rax)
> >         ...
> >
> > Code starting with the faulting instruction
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >    0:   0f 0b                   ud2
> >    2:   c3                      retq
> >    3:   0f b6 4a 04             movzbl 0x4(%rdx),%ecx
> >    7:   38 4f 04                cmp    %cl,0x4(%rdi)
> >    a:   75 c9                   jne    0xffffffffffffffd5
> >    c:   c3                      retq
> >    d:   c3                      retq
> >    e:   66                      data16
> >    f:   2e                      cs
> >   10:   0f                      .byte 0xf
> >   11:   1f                      (bad)
> >   12:   84 00                   test   %al,(%rax)
> >         ...
> > [    0.000000] RSP: 0000:ffffffffb2a03e68 EFLAGS: 00010086 ORIG_RAX: 00=
00000000000000
> > [    0.000000] RAX: 0000000000000000 RBX: 0000000000000000 RCX: c000000=
0ffff7fff
> > [    0.000000] RDX: ffffffffb2a03c88 RSI: 00000000ffff7fff RDI: fffffff=
fb376c2ac
> > [    0.000000] RBP: ffffffffb36e7044 R08: 0000000000000000 R09: fffffff=
fb2a03c80
> > [    0.000000] R10: 0000000000000001 R11: 0000000000000001 R12: 0000000=
000000000
> > [    0.000000] R13: 0000000000000000 R14: ffffffffb36e7044 R15: fffffff=
fb285e9c4
> > [    0.000000] FS:  0000000000000000(0000) GS:ffffffffb3486000(0000) kn=
lGS:0000000000000000
> > [    0.000000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [    0.000000] CR2: ffff888000013ef0 CR3: 00000001e4320000 CR4: 0000000=
0000406a0
> > [    0.000000] Call Trace:
> > [    0.000000] ? arch_static_call_transform (kbuild/src/consumer/arch/x=
86/kernel/static_call.c:106)
> > [    0.000000] ? __static_call_init+0x15f/0x220
> > [    0.000000] ? static_call_init (kbuild/src/consumer/kernel/static_ca=
ll.c:211 kbuild/src/consumer/kernel/static_call.c:473)
> > [    0.000000] ? setup_arch (kbuild/src/consumer/arch/x86/kernel/setup.=
c:828 (discriminator 4))
> > [    0.000000] ? start_kernel (kbuild/src/consumer/init/main.c:274 kbui=
ld/src/consumer/init/main.c:478 kbuild/src/consumer/init/main.c:875)
> > [    0.000000] ? load_ucode_bsp (kbuild/src/consumer/arch/x86/kernel/cp=
u/microcode/core.c:172)
> > [    0.000000] ? secondary_startup_64_no_verify (kbuild/src/consumer/ar=
ch/x86/kernel/head_64.S:283)
> > [    0.000000] random: get_random_bytes called from print_oops_end_mark=
er+0x26/0x40 with crng_init=3D0
> > [    0.000000] ---[ end trace 0000000000000000 ]---
> > [    0.000000] BIOS-provided physical RAM map:
> > [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] u=
sable
> > [    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] r=
eserved
> > [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] r=
eserved
> > [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000bffdffff] u=
sable
> > [    0.000000] BIOS-e820: [mem 0x00000000bffe0000-0x00000000bfffffff] r=
eserved
> > [    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] r=
eserved
> > [    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] r=
eserved
> > [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000023fffffff] u=
sable
> > [    0.000000] printk: debug: ignoring loglevel setting.
> > [    0.000000] printk: bootconsole [earlyser0] enabled
> > [    0.000000] NX (Execute Disable) protection: active
> > [    0.000000] SMBIOS 2.8 present.
> > [    0.000000] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0=
-1 04/01/2014
> > [    0.000000] Hypervisor detected: KVM
> > [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> > [    0.000000] kvm-clock: cpu 0, msr 1e4801001, primary cpu clock
> > [    0.000000] kvm-clock: using sched offset of 1230852095 cycles
> > [    0.000280] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cyc=
les: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
> > [    0.001025] tsc: Detected 3191.990 MHz processor
> > [    0.001748] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> =
reserved
> > [    0.002056] e820: remove [mem 0x000a0000-0x000fffff] usable
> > [    0.002318] last_pfn =3D 0x240000 max_arch_pfn =3D 0x400000000
> > [    0.002584] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC=
- WT
> > Memory KASLR using RDTSC...
> > [    0.003014] last_pfn =3D 0xbffe0 max_arch_pfn =3D 0x400000000
> > [    0.003257] Scan for SMP in [mem 0x00000000-0x000003ff]
> > [    0.003508] Scan for SMP in [mem 0x0009fc00-0x0009ffff]
> > [    0.003758] Scan for SMP in [mem 0x000f0000-0x000fffff]
> > [    0.006659] found SMP MP-table at [mem 0x000f5a80-0x000f5a8f]
> > [    0.006926]   mpc: f5a90-f5b74
> > [    0.007383] RAMDISK: [mem 0x72cde000-0x7fffffff]
> > [    0.007611] ACPI: Early table checksum verification disabled
> > [    0.007868] ACPI: RSDP 0x00000000000F5850 000014 (v00 BOCHS )
> > [    0.008145] ACPI: RSDT 0x00000000BFFE15C9 000030 (v01 BOCHS  BXPCRSD=
T 00000001 BXPC 00000001)
> > [    0.008534] ACPI: FACP 0x00000000BFFE149D 000074 (v01 BOCHS  BXPCFAC=
P 00000001 BXPC 00000001)
> > [    0.008920] ACPI: DSDT 0x00000000BFFE0040 00145D (v01 BOCHS  BXPCDSD=
T 00000001 BXPC 00000001)
> > [    0.009305] ACPI: FACS 0x00000000BFFE0000 000040
> > [    0.009515] ACPI: APIC 0x00000000BFFE1511 000080 (v01 BOCHS  BXPCAPI=
C 00000001 BXPC 00000001)
> > [    0.009900] ACPI: HPET 0x00000000BFFE1591 000038 (v01 BOCHS  BXPCHPE=
T 00000001 BXPC 00000001)
> > [    0.010295] ACPI: Local APIC address 0xfee00000
> > [    0.010503] mapped APIC to ffffffffff5fc000 (        fee00000)
> > [    0.010892] No NUMA configuration found
> > [    0.011067] Faking a node at [mem 0x0000000000000000-0x000000023ffff=
fff]
> > [    0.011375] NODE_DATA(0) allocated [mem 0x23ffd1000-0x23fffbfff]
> > [    0.011804] cma: Reserved 200 MiB at 0x0000000100000000
> > [    0.012058] Zone ranges:
> > [    0.012173]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> > [    0.012456]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
> > [    0.012734]   Normal   [mem 0x0000000100000000-0x000000023fffffff]
> > [    0.013013]   Device   empty
> > [    0.013143] Movable zone start for each node
> > [    0.013338] Early memory node ranges
> > [    0.013502]   node   0: [mem 0x0000000000001000-0x000000000009efff]
> > [    0.013786]   node   0: [mem 0x0000000000100000-0x00000000bffdffff]
> > [    0.014072]   node   0: [mem 0x0000000100000000-0x000000023fffffff]
> > [    0.014668] Zeroed struct page in unavailable ranges: 130 pages
> > [    0.014670] Initmem setup node 0 [mem 0x0000000000001000-0x000000023=
fffffff]
> > [    0.015265] On node 0 totalpages: 2097022
> > [    0.015449]   DMA zone: 64 pages used for memmap
> > [    0.015659]   DMA zone: 21 pages reserved
> > [    0.015841]   DMA zone: 3998 pages, LIFO batch:0
> > [    0.016071]   DMA32 zone: 12224 pages used for memmap
> > [    0.016302]   DMA32 zone: 782304 pages, LIFO batch:63
> > [    0.023875]   Normal zone: 20480 pages used for memmap
> > [    0.024164]   Normal zone: 1310720 pages, LIFO batch:63
> > [    0.024965] ACPI: PM-Timer IO Port: 0x608
> > [    0.025172] ACPI: Local APIC address 0xfee00000
> > [    0.025394] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
> > [    0.025679] IOAPIC[0]: apic_id 0, version 17, address 0xfec00000, GS=
I 0-23
> > [    0.026004] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> > [    0.026326] Int: type 0, pol 0, trig 0, bus 00, IRQ 00, APIC ID 0, A=
PIC INT 02
> > [    0.026664] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high lev=
el)
> > [    0.026970] Int: type 0, pol 1, trig 3, bus 00, IRQ 05, APIC ID 0, A=
PIC INT 05
> > [    0.027316] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high lev=
el)
> > [    0.027623] Int: type 0, pol 1, trig 3, bus 00, IRQ 09, APIC ID 0, A=
PIC INT 09
> > [    0.027958] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high l=
evel)
> > [    0.028278] Int: type 0, pol 1, trig 3, bus 00, IRQ 0a, APIC ID 0, A=
PIC INT 0a
> > [    0.028612] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high l=
evel)
> > [    0.028927] Int: type 0, pol 1, trig 3, bus 00, IRQ 0b, APIC ID 0, A=
PIC INT 0b
> > [    0.029273] ACPI: IRQ0 used by override.
> > [    0.029455] Int: type 0, pol 0, trig 0, bus 00, IRQ 01, APIC ID 0, A=
PIC INT 01
> > [    0.029789] Int: type 0, pol 0, trig 0, bus 00, IRQ 03, APIC ID 0, A=
PIC INT 03
> > [    0.030128] Int: type 0, pol 0, trig 0, bus 00, IRQ 04, APIC ID 0, A=
PIC INT 04
> > [    0.030468] ACPI: IRQ5 used by override.
> > [    0.030649] Int: type 0, pol 0, trig 0, bus 00, IRQ 06, APIC ID 0, A=
PIC INT 06
> > [    0.030983] Int: type 0, pol 0, trig 0, bus 00, IRQ 07, APIC ID 0, A=
PIC INT 07
> >
> >
> > To reproduce:
> >
> >         # build kernel
> >         cd linux
> >         cp config-5.12.0-rc2-00290-g4a00e5e21215 .config
> >         make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Dx86_64 olddefconfig prepa=
re modules_prepare bzImage
> >
> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         bin/lkp qemu -k <bzImage> job-script # job-script is attached i=
n this email
> >
> >
> >
> > ---
> > 0DAY/LKP+ Test Infrastructure                   Open Source Technology =
Center
> > https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Cor=
poration
> >
> > Thanks,
> > Oliver Sang
> >

--===============0817016281330578470==
Content-Type: application/x-xz
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="dmesg.xz"

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
AAAABFla
--===============0817016281330578470==--

