Content-Type: multipart/mixed; boundary="===============7186630948873544304=="
MIME-Version: 1.0
From: Sumit Garg <sumit.garg@linaro.org>
To: lkp@lists.01.org
Subject: Re: [KEYS] 4a00e5e212: WARNING:at_arch/x86/kernel/static_call.c:#__static_call_validate
Date: Wed, 17 Mar 2021 12:55:02 +0530
Message-ID: <CAFA6WYMb-C2L7DmGnhWgxjuuvP=qxPA4-s4q+knxH+iWXypHmw@mail.gmail.com>
In-Reply-To: <20210317030101.GB22345@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7186630948873544304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+ Static branch/call maintainers

On Wed, 17 Mar 2021 at 08:32, Oliver Sang <oliver.sang@intel.com> wrote:
>
> Hi Sumit,
>
> On Tue, Mar 16, 2021 at 01:34:34PM +0530, Sumit Garg wrote:
> > Hi Oliver,
> >
> > On Mon, 15 Mar 2021 at 19:55, kernel test robot <oliver.sang@intel.co=
m> wrote:
> > >
> > >
> > >
> > > Greeting,
> > >
> > > FYI, we noticed the following commit (built with gcc-9):
> > >
> > > commit: 4a00e5e21215a60820e0d8b62423c7f04a76dec9 ("KEYS: trusted: Add=
 generic trusted keys framework")
> > > git://git.kernel.org/cgit/linux/kernel/git/jarkko/linux-tpmdd.git mas=
ter
> > >
> > >
> > > in testcase: trinity
> > > version: trinity-x86_64-4d2343bd-1_20210105
> > > with following parameters:
> > >
> > >         group: group-02
> > >
> > > test-description: Trinity is a linux system call fuzz tester.
> > > test-url: http://codemonkey.org.uk/projects/trinity/
> > >
> > >
> > > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp=
 2 -m 8G
> > >
> > > caused below changes (please refer to attached dmesg/kmsg for entire =
log/backtrace):
> > >
> > >
> > > +------------------------------------------------------------------+-=
-----------+------------+
> > > |                                                                  | =
747b3232d6 | 4a00e5e212 |
> > > +------------------------------------------------------------------+-=
-----------+------------+
> > > | boot_successes                                                   | =
27         | 0          |
> > > | boot_failures                                                    | =
0          | 18         |
> > > | WARNING:at_arch/x86/kernel/static_call.c:#__static_call_validate | =
0          | 18         |
> > > | RIP:__static_call_validate                                       | =
0          | 18         |
> > > | WARNING:at_kernel/static_call.c:#__static_call_update            | =
0          | 18         |
> > > | RIP:__static_call_update                                         | =
0          | 18         |
> > > +------------------------------------------------------------------+-=
-----------+------------+
> > >
> > >
> > > If you fix the issue, kindly add following tag
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > >
> >
> > Thanks for this report. It looks like the following change should fix
> > this problem. And since I don't possess a x86 development machine
> > which actually supports static calls, can you verify this fix?
>
> I tested below patch, the issue still exists:
> (full dmesg attached FYI)
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] unexpected static_call insn opcode 0xe9 at cleanup_trusted=
+0x0/0x5

Here 0xe9 belongs to JMP32_INSN_OPCODE but I am not sure why it's
considered incorrect given following snippet and corresponding
objdump:

Snippet:

static void __exit cleanup_trusted(void)
{
        static_call_cond(trusted_key_exit)();
}

module_exit(cleanup_trusted);

Objdump:

ffffffff832d91fc <cleanup_trusted>:
ffffffff832d91fc:       e9 ef 83 b2 fe          jmpq
ffffffff81e015f0 <__SCT__trusted_key_exit>

Maintainers,

Do you have any clue here?

-Sumit

> [    0.000000] WARNING: CPU: 0 PID: 0 at arch/x86/kernel/static_call.c:77=
 __static_call_validate+0x68/0x80
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.12.0-rc2-00291-g=
8a470a9f302c #1
> [    0.000000] RIP: 0010:__static_call_validate+0x68/0x80
> [    0.000000] Code: 05 ff 53 1d 01 75 d7 0f b6 05 fa 53 1d 01 38 47 04 7=
5 cb c3 48 89 fa 48 c7 c7 b8 99 33 b6 c6 05 8e d6 d7 01 01 e8 cd 7e b6 00 <=
0f> 0b
>  c3 0f b6 4a 04 38 4f 04 75 c9 c3 c3 66 2e 0f 1f 84 00 00 00
> [    0.000000] RSP: 0000:ffffffffb6603e68 EFLAGS: 00010086 ORIG_RAX: 0000=
000000000000
> [    0.000000] RAX: 0000000000000000 RBX: 0000000000000000 RCX: c0000000f=
fff7fff
> [    0.000000] RDX: ffffffffb6603c88 RSI: 00000000ffff7fff RDI: ffffffffb=
736c2ac
> [    0.000000] RBP: ffffffffb72e7044 R08: 0000000000000000 R09: ffffffffb=
6603c80
> [    0.000000] R10: 0000000000000001 R11: 0000000000000001 R12: 000000000=
0000000
> [    0.000000] R13: 0000000000000000 R14: ffffffffb72e7044 R15: ffffffffb=
645e9c4
> [    0.000000] FS:  0000000000000000(0000) GS:ffffffffb7086000(0000) knlG=
S:0000000000000000
> [    0.000000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.000000] CR2: ffff888000013ef0 CR3: 000000011ed20000 CR4: 000000000=
00406a0
> [    0.000000] Call Trace:
> [    0.000000]  ? arch_static_call_transform+0x5d/0xa0
> [    0.000000]  ? __static_call_init+0x15f/0x220
> [    0.000000]  ? static_call_init+0x42/0x81
> [    0.000000]  ? setup_arch+0xc2/0x9ef
> [    0.000000]  ? start_kernel+0x60/0x4d4
> [    0.000000]  ? load_ucode_bsp+0x46/0x133
> [    0.000000]  ? secondary_startup_64_no_verify+0xc2/0xcb
> [    0.000000] random: get_random_bytes called from print_oops_end_marker=
+0x26/0x40 with crng_init=3D0
> [    0.000000] ---[ end trace 0000000000000000 ]---
>
> >
> > diff --git a/security/keys/trusted-keys/trusted_core.c
> > b/security/keys/trusted-keys/trusted_core.c
> > index ec3a066a4b42..bfbe497bf33b 100644
> > --- a/security/keys/trusted-keys/trusted_core.c
> > +++ b/security/keys/trusted-keys/trusted_core.c
> > @@ -349,7 +349,7 @@ static int __init init_trusted(void)
> >
> >  static void __exit cleanup_trusted(void)
> >  {
> > -       static_call(trusted_key_exit)();
> > +       static_call_cond(trusted_key_exit)();
> >  }
> >
> >  late_initcall(init_trusted);
> >
> > -Sumit
> >
> > >
> > > [    0.000000] WARNING: CPU: 0 PID: 0 at arch/x86/kernel/static_call.=
c:77 __static_call_validate (kbuild/src/consumer/arch/x86/kernel/static_cal=
l.c:77 (discriminator 3))
> > > [    0.000000] Modules linked in:
> > > [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.12.0-rc2-002=
90-g4a00e5e21215 #1
> > > [    0.000000] RIP: 0010:__static_call_validate (kbuild/src/consumer/=
arch/x86/kernel/static_call.c:77 (discriminator 3))
> > > [ 0.000000] Code: 05 ff 53 1d 01 75 d7 0f b6 05 fa 53 1d 01 38 47 04 =
75 cb c3 48 89 fa 48 c7 c7 b8 99 73 b2 c6 05 8e d6 d7 01 01 e8 cd 7e b6 00 =
<0f> 0b c3 0f b6 4a 04 38 4f 04 75 c9 c3 c3 66 2e 0f 1f 84 00 00 00
> > > All code
> > > =3D=3D=3D=3D=3D=3D=3D=3D
> > >    0:   05 ff 53 1d 01          add    $0x11d53ff,%eax
> > >    5:   75 d7                   jne    0xffffffffffffffde
> > >    7:   0f b6 05 fa 53 1d 01    movzbl 0x11d53fa(%rip),%eax        # =
0x11d5408
> > >    e:   38 47 04                cmp    %al,0x4(%rdi)
> > >   11:   75 cb                   jne    0xffffffffffffffde
> > >   13:   c3                      retq
> > >   14:   48 89 fa                mov    %rdi,%rdx
> > >   17:   48 c7 c7 b8 99 73 b2    mov    $0xffffffffb27399b8,%rdi
> > >   1e:   c6 05 8e d6 d7 01 01    movb   $0x1,0x1d7d68e(%rip)        # =
0x1d7d6b3
> > >   25:   e8 cd 7e b6 00          callq  0xb67ef7
> > >   2a:*  0f 0b                   ud2             <-- trapping instruct=
ion
> > >   2c:   c3                      retq
> > >   2d:   0f b6 4a 04             movzbl 0x4(%rdx),%ecx
> > >   31:   38 4f 04                cmp    %cl,0x4(%rdi)
> > >   34:   75 c9                   jne    0xffffffffffffffff
> > >   36:   c3                      retq
> > >   37:   c3                      retq
> > >   38:   66                      data16
> > >   39:   2e                      cs
> > >   3a:   0f                      .byte 0xf
> > >   3b:   1f                      (bad)
> > >   3c:   84 00                   test   %al,(%rax)
> > >         ...
> > >
> > > Code starting with the faulting instruction
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >    0:   0f 0b                   ud2
> > >    2:   c3                      retq
> > >    3:   0f b6 4a 04             movzbl 0x4(%rdx),%ecx
> > >    7:   38 4f 04                cmp    %cl,0x4(%rdi)
> > >    a:   75 c9                   jne    0xffffffffffffffd5
> > >    c:   c3                      retq
> > >    d:   c3                      retq
> > >    e:   66                      data16
> > >    f:   2e                      cs
> > >   10:   0f                      .byte 0xf
> > >   11:   1f                      (bad)
> > >   12:   84 00                   test   %al,(%rax)
> > >         ...
> > > [    0.000000] RSP: 0000:ffffffffb2a03e68 EFLAGS: 00010086 ORIG_RAX: =
0000000000000000
> > > [    0.000000] RAX: 0000000000000000 RBX: 0000000000000000 RCX: c0000=
000ffff7fff
> > > [    0.000000] RDX: ffffffffb2a03c88 RSI: 00000000ffff7fff RDI: fffff=
fffb376c2ac
> > > [    0.000000] RBP: ffffffffb36e7044 R08: 0000000000000000 R09: fffff=
fffb2a03c80
> > > [    0.000000] R10: 0000000000000001 R11: 0000000000000001 R12: 00000=
00000000000
> > > [    0.000000] R13: 0000000000000000 R14: ffffffffb36e7044 R15: fffff=
fffb285e9c4
> > > [    0.000000] FS:  0000000000000000(0000) GS:ffffffffb3486000(0000) =
knlGS:0000000000000000
> > > [    0.000000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [    0.000000] CR2: ffff888000013ef0 CR3: 00000001e4320000 CR4: 00000=
000000406a0
> > > [    0.000000] Call Trace:
> > > [    0.000000] ? arch_static_call_transform (kbuild/src/consumer/arch=
/x86/kernel/static_call.c:106)
> > > [    0.000000] ? __static_call_init+0x15f/0x220
> > > [    0.000000] ? static_call_init (kbuild/src/consumer/kernel/static_=
call.c:211 kbuild/src/consumer/kernel/static_call.c:473)
> > > [    0.000000] ? setup_arch (kbuild/src/consumer/arch/x86/kernel/setu=
p.c:828 (discriminator 4))
> > > [    0.000000] ? start_kernel (kbuild/src/consumer/init/main.c:274 kb=
uild/src/consumer/init/main.c:478 kbuild/src/consumer/init/main.c:875)
> > > [    0.000000] ? load_ucode_bsp (kbuild/src/consumer/arch/x86/kernel/=
cpu/microcode/core.c:172)
> > > [    0.000000] ? secondary_startup_64_no_verify (kbuild/src/consumer/=
arch/x86/kernel/head_64.S:283)
> > > [    0.000000] random: get_random_bytes called from print_oops_end_ma=
rker+0x26/0x40 with crng_init=3D0
> > > [    0.000000] ---[ end trace 0000000000000000 ]---
> > > [    0.000000] BIOS-provided physical RAM map:
> > > [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff]=
 usable
> > > [    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff]=
 reserved
> > > [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff]=
 reserved
> > > [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000bffdffff]=
 usable
> > > [    0.000000] BIOS-e820: [mem 0x00000000bffe0000-0x00000000bfffffff]=
 reserved
> > > [    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff]=
 reserved
> > > [    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff]=
 reserved
> > > [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000023fffffff]=
 usable
> > > [    0.000000] printk: debug: ignoring loglevel setting.
> > > [    0.000000] printk: bootconsole [earlyser0] enabled
> > > [    0.000000] NX (Execute Disable) protection: active
> > > [    0.000000] SMBIOS 2.8 present.
> > > [    0.000000] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12=
.0-1 04/01/2014
> > > [    0.000000] Hypervisor detected: KVM
> > > [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> > > [    0.000000] kvm-clock: cpu 0, msr 1e4801001, primary cpu clock
> > > [    0.000000] kvm-clock: using sched offset of 1230852095 cycles
> > > [    0.000280] clocksource: kvm-clock: mask: 0xffffffffffffffff max_c=
ycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
> > > [    0.001025] tsc: Detected 3191.990 MHz processor
> > > [    0.001748] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D=
> reserved
> > > [    0.002056] e820: remove [mem 0x000a0000-0x000fffff] usable
> > > [    0.002318] last_pfn =3D 0x240000 max_arch_pfn =3D 0x400000000
> > > [    0.002584] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  =
UC- WT
> > > Memory KASLR using RDTSC...
> > > [    0.003014] last_pfn =3D 0xbffe0 max_arch_pfn =3D 0x400000000
> > > [    0.003257] Scan for SMP in [mem 0x00000000-0x000003ff]
> > > [    0.003508] Scan for SMP in [mem 0x0009fc00-0x0009ffff]
> > > [    0.003758] Scan for SMP in [mem 0x000f0000-0x000fffff]
> > > [    0.006659] found SMP MP-table at [mem 0x000f5a80-0x000f5a8f]
> > > [    0.006926]   mpc: f5a90-f5b74
> > > [    0.007383] RAMDISK: [mem 0x72cde000-0x7fffffff]
> > > [    0.007611] ACPI: Early table checksum verification disabled
> > > [    0.007868] ACPI: RSDP 0x00000000000F5850 000014 (v00 BOCHS )
> > > [    0.008145] ACPI: RSDT 0x00000000BFFE15C9 000030 (v01 BOCHS  BXPCR=
SDT 00000001 BXPC 00000001)
> > > [    0.008534] ACPI: FACP 0x00000000BFFE149D 000074 (v01 BOCHS  BXPCF=
ACP 00000001 BXPC 00000001)
> > > [    0.008920] ACPI: DSDT 0x00000000BFFE0040 00145D (v01 BOCHS  BXPCD=
SDT 00000001 BXPC 00000001)
> > > [    0.009305] ACPI: FACS 0x00000000BFFE0000 000040
> > > [    0.009515] ACPI: APIC 0x00000000BFFE1511 000080 (v01 BOCHS  BXPCA=
PIC 00000001 BXPC 00000001)
> > > [    0.009900] ACPI: HPET 0x00000000BFFE1591 000038 (v01 BOCHS  BXPCH=
PET 00000001 BXPC 00000001)
> > > [    0.010295] ACPI: Local APIC address 0xfee00000
> > > [    0.010503] mapped APIC to ffffffffff5fc000 (        fee00000)
> > > [    0.010892] No NUMA configuration found
> > > [    0.011067] Faking a node at [mem 0x0000000000000000-0x000000023ff=
fffff]
> > > [    0.011375] NODE_DATA(0) allocated [mem 0x23ffd1000-0x23fffbfff]
> > > [    0.011804] cma: Reserved 200 MiB at 0x0000000100000000
> > > [    0.012058] Zone ranges:
> > > [    0.012173]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> > > [    0.012456]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
> > > [    0.012734]   Normal   [mem 0x0000000100000000-0x000000023fffffff]
> > > [    0.013013]   Device   empty
> > > [    0.013143] Movable zone start for each node
> > > [    0.013338] Early memory node ranges
> > > [    0.013502]   node   0: [mem 0x0000000000001000-0x000000000009efff]
> > > [    0.013786]   node   0: [mem 0x0000000000100000-0x00000000bffdffff]
> > > [    0.014072]   node   0: [mem 0x0000000100000000-0x000000023fffffff]
> > > [    0.014668] Zeroed struct page in unavailable ranges: 130 pages
> > > [    0.014670] Initmem setup node 0 [mem 0x0000000000001000-0x0000000=
23fffffff]
> > > [    0.015265] On node 0 totalpages: 2097022
> > > [    0.015449]   DMA zone: 64 pages used for memmap
> > > [    0.015659]   DMA zone: 21 pages reserved
> > > [    0.015841]   DMA zone: 3998 pages, LIFO batch:0
> > > [    0.016071]   DMA32 zone: 12224 pages used for memmap
> > > [    0.016302]   DMA32 zone: 782304 pages, LIFO batch:63
> > > [    0.023875]   Normal zone: 20480 pages used for memmap
> > > [    0.024164]   Normal zone: 1310720 pages, LIFO batch:63
> > > [    0.024965] ACPI: PM-Timer IO Port: 0x608
> > > [    0.025172] ACPI: Local APIC address 0xfee00000
> > > [    0.025394] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
> > > [    0.025679] IOAPIC[0]: apic_id 0, version 17, address 0xfec00000, =
GSI 0-23
> > > [    0.026004] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl df=
l)
> > > [    0.026326] Int: type 0, pol 0, trig 0, bus 00, IRQ 00, APIC ID 0,=
 APIC INT 02
> > > [    0.026664] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high l=
evel)
> > > [    0.026970] Int: type 0, pol 1, trig 3, bus 00, IRQ 05, APIC ID 0,=
 APIC INT 05
> > > [    0.027316] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high l=
evel)
> > > [    0.027623] Int: type 0, pol 1, trig 3, bus 00, IRQ 09, APIC ID 0,=
 APIC INT 09
> > > [    0.027958] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high=
 level)
> > > [    0.028278] Int: type 0, pol 1, trig 3, bus 00, IRQ 0a, APIC ID 0,=
 APIC INT 0a
> > > [    0.028612] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high=
 level)
> > > [    0.028927] Int: type 0, pol 1, trig 3, bus 00, IRQ 0b, APIC ID 0,=
 APIC INT 0b
> > > [    0.029273] ACPI: IRQ0 used by override.
> > > [    0.029455] Int: type 0, pol 0, trig 0, bus 00, IRQ 01, APIC ID 0,=
 APIC INT 01
> > > [    0.029789] Int: type 0, pol 0, trig 0, bus 00, IRQ 03, APIC ID 0,=
 APIC INT 03
> > > [    0.030128] Int: type 0, pol 0, trig 0, bus 00, IRQ 04, APIC ID 0,=
 APIC INT 04
> > > [    0.030468] ACPI: IRQ5 used by override.
> > > [    0.030649] Int: type 0, pol 0, trig 0, bus 00, IRQ 06, APIC ID 0,=
 APIC INT 06
> > > [    0.030983] Int: type 0, pol 0, trig 0, bus 00, IRQ 07, APIC ID 0,=
 APIC INT 07
> > >
> > >
> > > To reproduce:
> > >
> > >         # build kernel
> > >         cd linux
> > >         cp config-5.12.0-rc2-00290-g4a00e5e21215 .config
> > >         make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Dx86_64 olddefconfig pre=
pare modules_prepare bzImage
> > >
> > >         git clone https://github.com/intel/lkp-tests.git
> > >         cd lkp-tests
> > >         bin/lkp qemu -k <bzImage> job-script # job-script is attached=
 in this email
> > >
> > >
> > >
> > > ---
> > > 0DAY/LKP+ Test Infrastructure                   Open Source Technolog=
y Center
> > > https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel C=
orporation
> > >
> > > Thanks,
> > > Oliver Sang
> > >
--===============7186630948873544304==--

