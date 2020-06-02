Content-Type: multipart/mixed; boundary="===============9170321290188854976=="
MIME-Version: 1.0
From: Filipe Manana <fdmanana@suse.com>
To: lkp@lists.01.org
Subject: Re: 28307d938f ("percpu: make pcpu_alloc() aware of current gfp .."): BUG: kernel reboot-without-warning in boot stage
Date: Tue, 02 Jun 2020 13:18:27 +0100
Message-ID: <0405917f-dc4f-f32c-0aeb-043742fc4d6e@suse.com>
In-Reply-To: <a1e41149-a3b3-4a19-7001-9b47d8b66555@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9170321290188854976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 02/06/20 05:37, Li Zhijian wrote:
> Hi Filipe,
> =

> LKP checked blow dmesg as the indicator in this problem
> =

>>> [=C2=A0=C2=A0=C2=A0 0.144174] RAMDISK: [mem 0x7fa2e000-0x7fffffff]
>>> [=C2=A0=C2=A0=C2=A0 0.144559] ACPI: Early table checksum verification d=
isabled
>>> [=C2=A0=C2=A0=C2=A0 0.144985] ACPI: RSDP 0x00000000000F5850 000014 (v00=
 BOCHS )
>>> [=C2=A0=C2=A0=C2=A0 0.145424] ACPI: RSDT 0x00000000BFFE15C9 000030 (v01=
 BOCHS=C2=A0
>>> BXPCRSDT 00000001 BXPC 00000001)
>>> [=C2=A0=C2=A0=C2=A0 0.146051] ACPI: FACP 0x00000000BFFE149D 000074 (v01=
 BOCHS=C2=A0
>>> BXPCFACP 00000001 BXPC 00000001)
>>> BUG: kernel reboot-without-warning in boot stage
>>>
> =

> And i have reproduced it with script in attachment. this issue is gone
> when i reverted this commit 28307d938f
> =

> Please note that
> - i reproduced it with kernel compiled by gcc-5
> - i failed to reproduce it in kernel compiled by gcc-7 so far

Odd.
Here I tested with:

$ gcc --version
gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516
Copyright (C) 2016 Free Software Foundation, Inc.

> =

> :~/1787$ ./reproduce.sh obj/arch/x86/boot/bzImage
> qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap -kernel
> obj/arch/x86/boot/bzImage -m 8192 -smp 2 -device e1000,netdev=3Dnet0
> -netdev user,id=3Dnet0,hostfwd=3Dtcp::32032-:22 -boot order=3Dnc -no-rebo=
ot
> -watchdog i6300esb -watchdog-action debug -rtc base=3Dlocaltime -serial
> stdio -display none -monitor null -append root=3D/dev/ram0
> hung_task_panic=3D1 debug apic=3Ddebug sysrq_always_enabled
> rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 printk.devkmsg=3Don
> panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ra=
mdisk=3D2
> prompt_ramdisk=3D0 drbd.minor_count=3D8 systemd.log_level=3Derr
> ignore_loglevel console=3Dtty0 earlyprintk=3DttyS0,115200
> console=3DttyS0,115200 vga=3Dnormal rw rcuperf.shutdown=3D0 watchdog_thre=
sh=3D60
> early console in setup code
> Wrong EFI loader signature.
> early console in extract_kernel
> input_data: 0x0000000006f752d8
> input_len: 0x000000000130dd3c
> output: 0x0000000001000000
> output_len: 0x0000000007200a48
> kernel_total_size: 0x0000000006826000
> needed_size: 0x0000000007400000
> trampoline_32bit: 0x000000000009d000
> =

> Decompressing Linux... Parsing ELF... done.
> Booting the kernel.
> [=C2=A0=C2=A0=C2=A0 0.000000] Linux version 5.7.0-rc4-00168-g28307d938fb2
> (lizhijian(a)shao2-debian) (gcc version 5.5.0 20171010 (Debian 5.5.0-12),
> GNU ld (GNU Binutils for Debian) 2.34) #2 SMP PREEMPT Tue Jun 2 11:23:59
> CST 2020
> [=C2=A0=C2=A0=C2=A0 0.000000] Command line: root=3D/dev/ram0 hung_task_pa=
nic=3D1 debug
> apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100
> net.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1
> nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0
> drbd.minor_count=3D8 systemd.log_level=3Derr ignore_loglevel console=3Dtt=
y0
> earlyprintk=3DttyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw
> rcuperf.shutdown=3D0 watchdog_thresh=3D60
> [=C2=A0=C2=A0=C2=A0 0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x=
87 floating
> point registers'
> [=C2=A0=C2=A0=C2=A0 0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'S=
SE registers'
> [=C2=A0=C2=A0=C2=A0 0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'A=
VX registers'
> [=C2=A0=C2=A0=C2=A0 0.000000] x86/fpu: xstate_offset[2]:=C2=A0 576, xstat=
e_sizes[2]: 256
> [=C2=A0=C2=A0=C2=A0 0.000000] x86/fpu: Enabled xstate features 0x7, conte=
xt size is 832
> bytes, using 'standard' format.
> [=C2=A0=C2=A0=C2=A0 0.000000] BIOS-provided physical RAM map:
> [=C2=A0=C2=A0=C2=A0 0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000=
000009fbff]
> usable
> [=C2=A0=C2=A0=C2=A0 0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000=
000009ffff]
> reserved
> [=C2=A0=C2=A0=C2=A0 0.000000] BIOS-e820: [mem 0x00000000000f0000-0x000000=
00000fffff]
> reserved
> [=C2=A0=C2=A0=C2=A0 0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000=
00bffdffff]
> usable
> [=C2=A0=C2=A0=C2=A0 0.000000] BIOS-e820: [mem 0x00000000bffe0000-0x000000=
00bfffffff]
> reserved
> [=C2=A0=C2=A0=C2=A0 0.000000] BIOS-e820: [mem 0x00000000feffc000-0x000000=
00feffffff]
> reserved
> [=C2=A0=C2=A0=C2=A0 0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x000000=
00ffffffff]
> reserved
> [=C2=A0=C2=A0=C2=A0 0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000=
023fffffff]
> usable
> [=C2=A0=C2=A0=C2=A0 0.000000] printk: debug: ignoring loglevel setting.
> [=C2=A0=C2=A0=C2=A0 0.000000] printk: bootconsole [earlyser0] enabled
> [=C2=A0=C2=A0=C2=A0 0.000000] NX (Execute Disable) protection: active
> [=C2=A0=C2=A0=C2=A0 0.000000] SMBIOS 2.8 present.
> [=C2=A0=C2=A0=C2=A0 0.000000] DMI: QEMU Standard PC (i440FX + PIIX, 1996)=
, BIOS
> 1.12.0-1 04/01/2014
> [=C2=A0=C2=A0=C2=A0 0.000000] Hypervisor detected: KVM
> [=C2=A0=C2=A0=C2=A0 0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> [=C2=A0=C2=A0=C2=A0 0.000002] kvm-clock: cpu 0, msr 7601001, primary cpu =
clock
> [=C2=A0=C2=A0=C2=A0 0.000002] kvm-clock: using sched offset of 2661499940=
 cycles
> [=C2=A0=C2=A0=C2=A0 0.000603] clocksource: kvm-clock: mask: 0xfffffffffff=
fffff
> max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
> [=C2=A0=C2=A0=C2=A0 0.002261] tsc: Detected 3407.998 MHz processor
> [=C2=A0=C2=A0=C2=A0 0.005351] e820: update [mem 0x00000000-0x00000fff] us=
able =3D=3D> reserved
> [=C2=A0=C2=A0=C2=A0 0.005986] e820: remove [mem 0x000a0000-0x000fffff] us=
able
> [=C2=A0=C2=A0=C2=A0 0.006535] last_pfn =3D 0x240000 max_arch_pfn =3D 0x40=
0000000
> [=C2=A0=C2=A0=C2=A0 0.007091] MTRR default type: write-back
> [=C2=A0=C2=A0=C2=A0 0.007477] MTRR fixed ranges enabled:
> [=C2=A0=C2=A0=C2=A0 0.007845]=C2=A0=C2=A0 00000-9FFFF write-back
> [=C2=A0=C2=A0=C2=A0 0.008191]=C2=A0=C2=A0 A0000-BFFFF uncachable
> [=C2=A0=C2=A0=C2=A0 0.008536]=C2=A0=C2=A0 C0000-FFFFF write-protect
> [=C2=A0=C2=A0=C2=A0 0.008906] MTRR variable ranges enabled:
> [=C2=A0=C2=A0=C2=A0 0.009293]=C2=A0=C2=A0 0 base 00C0000000 mask FFC00000=
00 uncachable
> [=C2=A0=C2=A0=C2=A0 0.009818]=C2=A0=C2=A0 1 disabled
> [=C2=A0=C2=A0=C2=A0 0.010064]=C2=A0=C2=A0 2 disabled
> [=C2=A0=C2=A0=C2=A0 0.010314]=C2=A0=C2=A0 3 disabled
> [=C2=A0=C2=A0=C2=A0 0.010561]=C2=A0=C2=A0 4 disabled
> [=C2=A0=C2=A0=C2=A0 0.010822]=C2=A0=C2=A0 5 disabled
> [=C2=A0=C2=A0=C2=A0 0.011072]=C2=A0=C2=A0 6 disabled
> [=C2=A0=C2=A0=C2=A0 0.011325]=C2=A0=C2=A0 7 disabled
> [=C2=A0=C2=A0=C2=A0 0.011602] x86/PAT: Configuration [0-7]: WB=C2=A0 WC=
=C2=A0 UC- UC=C2=A0 WB=C2=A0 WP UC- WT
> [=C2=A0=C2=A0=C2=A0 0.012313] last_pfn =3D 0xbffe0 max_arch_pfn =3D 0x400=
000000
> [=C2=A0=C2=A0=C2=A0 0.013294] check: Scanning 1 areas for low memory corr=
uption
> [=C2=A0=C2=A0=C2=A0 0.013898] BRK [0x07801000, 0x07801fff] PGTABLE
> [=C2=A0=C2=A0=C2=A0 0.014358] BRK [0x07802000, 0x07802fff] PGTABLE
> [=C2=A0=C2=A0=C2=A0 0.014822] BRK [0x07803000, 0x07803fff] PGTABLE
> [=C2=A0=C2=A0=C2=A0 0.015626] BRK [0x07804000, 0x07804fff] PGTABLE
> [=C2=A0=C2=A0=C2=A0 0.016099] BRK [0x07805000, 0x07805fff] PGTABLE
> [=C2=A0=C2=A0=C2=A0 0.016773] BRK [0x07806000, 0x07806fff] PGTABLE
> [=C2=A0=C2=A0=C2=A0 0.106782] ACPI: Early table checksum verification dis=
abled
> [=C2=A0=C2=A0=C2=A0 0.107352] ACPI: RSDP 0x00000000000F5850 000014 (v00 B=
OCHS )
> [=C2=A0=C2=A0=C2=A0 0.107949] ACPI: RSDT 0x00000000BFFE15C9 000030 (v01 B=
OCHS BXPCRSDT
> 00000001 BXPC 00000001)
> [=C2=A0=C2=A0=C2=A0 0.108766] ACPI: FACP 0x00000000BFFE149D 000074 (v01 B=
OCHS BXPCFACP
> 00000001 BXPC 00000001)
> [=C2=A0=C2=A0=C2=A0 0.109649] ACPI: DSDT 0x00000000BFFE0040 00145D (v01 B=
OCHS BXPCDSDT
> 00000001 BXPC 00000001)
> lizhijian(a)shao2-debian:~/1787$
> =

> =

> =

>> Weird, what you are getting is the following warning from lock torture:
> =

> warning from lock torture could be not related to this commit in this cas=
e.
> =

> =

> Thanks
> Zhijian
> =

>=20
--===============9170321290188854976==--

