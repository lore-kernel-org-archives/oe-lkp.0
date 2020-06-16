Content-Type: multipart/mixed; boundary="===============6364515689523024029=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [kmemleak] b751c52bb5: BUG:kernel_hang_in_boot_stage
Date: Tue, 16 Jun 2020 10:50:05 +0800
Message-ID: <9bc70c0d-00b3-ff5a-e8bd-d4315e367fad@intel.com>
In-Reply-To: <20200610105640.GB26099@gaia>
List-Id: <oe-lkp.lists.linux.dev>

--===============6364515689523024029==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 6/10/20 6:56 PM, Catalin Marinas wrote:
> On Wed, Jun 10, 2020 at 03:51:56PM +0800, kernel test robot wrote:
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: b751c52bb587ae66f773b15204ef7a147467f4c7 ("kmemleak: increase DE=
BUG_KMEMLEAK_EARLY_LOG_SIZE default to 16K")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> in testcase: boot
>>
>> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 =
-m 8G
> [...]
>> BUG: kernel hang in boot stage
>>
>> To reproduce:
>>
>>          # build kernel
>> 	cd linux
>> 	cp config-5.3.0-11789-gb751c52bb587a .config
>> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Di386 olddefconfig prepare modules=
_prepare bzImage
> I've never tried kmemleak on i386.
>
> Anyway, I'm not sure what caused the hang (or whether it's a hang at
> all) but I suspect prior to the above commit, kmemleak probably just
> disabled itself (early log  buffer exceeded). So the bug may have been
> there already, only that kmemleak started working and tripped over it
> when the log buffer increased.

Hi,

Sorry for the late, I can reproduce the problem with command "bin/lkp =

qemu -k <bzImage> job-script",
and the kernel hangs:

[=C2=A0=C2=A0=C2=A0 0.333897] ---------------------------------------------=
--------
[=C2=A0=C2=A0=C2=A0 0.334561]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |block | try |context|
[=C2=A0=C2=A0=C2=A0 0.335170] ---------------------------------------------=
--------
[=C2=A0=C2=A0=C2=A0 0.335760]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 context:=C2=A0 ok=C2=A0 |=C2=A0 ok=C2=
=A0 |=C2=A0 ok |
[=C2=A0=C2=A0=C2=A0 0.337995]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:=C2=A0 ok=
=C2=A0 |=C2=A0 ok=C2=A0 |=C2=A0 ok |
[=C2=A0=C2=A0=C2=A0 0.340089]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 block:=C2=A0 ok=C2=A0 |=C2=
=A0 ok=C2=A0 |=C2=A0 ok |
[=C2=A0=C2=A0=C2=A0 0.342175]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spinlock:=C2=A0 ok=C2=A0 |=C2=A0 ok=C2=A0 |=
=C2=A0 ok |
[=C2=A0=C2=A0=C2=A0 0.344481] ---------------------------------------------=
----------
[=C2=A0=C2=A0=C2=A0 0.345068] Good, all 261 testcases passed! |
[=C2=A0=C2=A0=C2=A0 0.345514] ---------------------------------
KVM internal error. Suberror: 3
extra data[0]: 80000b0e
extra data[1]: 31
extra data[2]: 182
extra data[3]: bfff0
EAX=3D00000000 EBX=3D00200297 ECX=3D00000000 EDX=3Dffffffff
ESI=3Dd2e997c0 EDI=3Dd2e997f0 EBP=3Dd2bbb038 ESP=3Dc00bfff4
EIP=3Df4dccd57 EFL=3D00210046 [---Z-P-] CPL=3D0 II=3D0 A20=3D1 SMM=3D0 HLT=
=3D0
ES =3D007b 00000000 ffffffff 00c0f300 DPL=3D3 DS=C2=A0=C2=A0 [-WA]
CS =3D0060 00000000 ffffffff 00c09b00 DPL=3D0 CS32 [-RA]
SS =3D0068 00000000 ffffffff 00c09300 DPL=3D0 DS=C2=A0=C2=A0 [-WA]
DS =3D007b 00000000 ffffffff 00c0f300 DPL=3D3 DS=C2=A0=C2=A0 [-WA]
FS =3D00d8 23331000 ffffffff 00809300 DPL=3D0 DS16 [-WA]
GS =3D00e0 f6422900 00000018 00409100 DPL=3D0 DS=C2=A0=C2=A0 [--A]
LDT=3D0000 00000000 ffffffff 00c00000
TR =3D0080 ff403000 0000206b 00008b00 DPL=3D0 TSS32-busy
GDT=3D=C2=A0=C2=A0=C2=A0=C2=A0 ff401000 000000ff
IDT=3D=C2=A0=C2=A0=C2=A0=C2=A0 ff400000 000007ff
CR0=3D80050033 CR2=3D00000000 CR3=3D130fc000 CR4=3D00000690
DR0=3D0000000000000000 DR1=3D0000000000000000 DR2=3D0000000000000000 =

DR3=3D0000000000000000
DR6=3D00000000fffe0ff0 DR7=3D0000000000000400
EFER=3D0000000000000000
Code=3D00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 <00> 00 =

00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =

00 00 00 00

>
> Is there a chance that the kernel got much slower with kmemleak enabled
> and the test scripts timed out?
no, the parent commit log is:

[=C2=A0=C2=A0=C2=A0 0.313845] ---------------------------------------------=
--------
[=C2=A0=C2=A0=C2=A0 0.314608]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |block | try |context|
[=C2=A0=C2=A0=C2=A0 0.315314] ---------------------------------------------=
--------
[=C2=A0=C2=A0=C2=A0 0.315974]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 context:=C2=A0 ok=C2=A0 |=C2=A0 ok=C2=
=A0 |=C2=A0 ok |
[=C2=A0=C2=A0=C2=A0 0.318261]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:=C2=A0 ok=
=C2=A0 |=C2=A0 ok=C2=A0 |=C2=A0 ok |
[=C2=A0=C2=A0=C2=A0 0.320478]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 block:=C2=A0 ok=C2=A0 |=C2=
=A0 ok=C2=A0 |=C2=A0 ok |
[=C2=A0=C2=A0=C2=A0 0.322562]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spinlock:=C2=A0 ok=C2=A0 |=C2=A0 ok=C2=A0 |=
=C2=A0 ok |
[=C2=A0=C2=A0=C2=A0 0.324825] ---------------------------------------------=
----------
[=C2=A0=C2=A0=C2=A0 0.325403] Good, all 261 testcases passed! |
[=C2=A0=C2=A0=C2=A0 0.325809] ---------------------------------
[=C2=A0=C2=A0=C2=A0 0.326221] kmemleak: Early log buffer exceeded (401), pl=
ease =

increase DEBUG_KMEMLEAK_EARLY_LOG_SIZE
[=C2=A0=C2=A0=C2=A0 0.327065] ACPI: Core revision 20190816
[=C2=A0=C2=A0=C2=A0 0.327585] clocksource: hpet: mask: 0xffffffff max_cycle=
s: =

0xffffffff, max_idle_ns: 19112604467 ns
[=C2=A0=C2=A0=C2=A0 0.328545] APIC: Switch to symmetric I/O mode setup
[=C2=A0=C2=A0=C2=A0 0.329009] Enabling APIC mode:=C2=A0 Flat.=C2=A0 Using 1=
 I/O APICs
[=C2=A0=C2=A0=C2=A0 0.329572] masked ExtINT on CPU#0
[=C2=A0=C2=A0=C2=A0 0.330686] ENABLING IO-APIC IRQs
[=C2=A0=C2=A0=C2=A0 0.331001] init IO_APIC IRQs
[=C2=A0=C2=A0=C2=A0 0.331274]=C2=A0 apic 0 pin 0 not connected

>
> Does this problem still exist with the latest mainline?
yes, still in v5.7.

Best Regards,
Rong Chen
--===============6364515689523024029==--

