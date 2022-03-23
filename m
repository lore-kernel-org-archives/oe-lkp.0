Content-Type: multipart/mixed; boundary="===============0477685914164730105=="
MIME-Version: 1.0
From: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/i915/guc] a0f1f7b4f7: PANIC:double_fault
Date: Wed, 23 Mar 2022 12:06:17 +0000
Message-ID: <DM5PR11MB156398A2FD2D73A661E3E5088A189@DM5PR11MB1563.namprd11.prod.outlook.com>
In-Reply-To: <20220323084351.GF16885@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0477685914164730105==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Oliver, please give me a couple of days to debug this as I don't see how=
 that Patch can cause or impact below failure since that patch only contain=
s changes that get executed at runtime (not driver startup) and only on Gen=
9 and newer hardware that has GuC firmware feature.

...alan

-----Original Message-----
From: Sang, Oliver <oliver.sang@intel.com> =

Sent: Wednesday, March 23, 2022 4:44 PM
To: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: lkp(a)lists.01.org; lkp <lkp@intel.com>; LKML <linux-kernel@vger.ke=
rnel.org>
Subject: [drm/i915/guc] a0f1f7b4f7: PANIC:double_fault



Greeting,

FYI, we noticed the following commit (built with gcc-9):

commit: a0f1f7b4f74fc6eaee0b6783af40dacf431df7b4 ("drm/i915/guc: Print the =
GuC error capture output register list.") git://anongit.freedesktop.org/drm=
/drm-intel drm-intel-gt-next

in testcase: boot

on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

caused below changes (please refer to attached dmesg/kmsg for entire log/ba=
cktrace):


+-------------------------------------------------------+------------+-----=
-------+
|                                                       | a6f0f9cf33 | =

| a0f1f7b4f7 |
+-------------------------------------------------------+------------+-----=
-------+
| boot_successes                                        | 13         | 0   =
       |
| boot_failures                                         | 0          | 6   =
       |
| PANIC:double_fault                                    | 0          | 6   =
       |
| double_fault:#[##]                                    | 0          | 6   =
       |
| EIP:handle_exception                                  | 0          | 6   =
       |
| Kernel_panic-not_syncing:Fatal_exception_in_interrupt | 0          | 6   =
       |
+-------------------------------------------------------+------------+-----=
-------+


If you fix the issue, kindly add following tag
Reported-by: kernel test robot <oliver.sang@intel.com>


[    8.717641][    T1] 00:05: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D =
115200) is a 16550A
[    8.719470][    T1] 00:06: ttyS1 at I/O 0x2f8 (irq =3D 3, base_baud =3D =
115200) is a 16550A
[    8.722059][    T1] sonypi: Sony Programmable I/O Controller Driver v1.2=
6.
[    8.722872][    T1] Non-volatile memory driver v1.3
[ 8.724009][ T36] random: get_random_u32 called from arch_rnd+0x14/0x40 wit=
h crng_init=3D0 =

[    8.724275][    C0] traps: PANIC: double fault, error_code: 0x0
[    8.724278][    C0] double fault: 0000 [#1] PTI
[    8.724282][    C0] CPU: 0 PID: 36 Comm: modprobe Not tainted 5.17.0-rc4=
-01232-ga0f1f7b4f74f #29
[ 8.724285][ C0] EIP: handle_exception (kbuild/src/rand-4/arch/x86/entry/en=
try_32.S:1064)
[ 8.724292][ C0] Code: 0c 81 e1 ff ff 00 00 36 89 48 f8 8b 4c 24 08 36 89 4=
8 f4 8b 4c 24 04 36 89 48 f0 59 8d 60 f0 58 cf 6a 00 68 80 0d 3f d7 eb 00 <=
fc> 0f a0 50 b8 00 00 00 00 8e e0 58 81 64 24 10 ff ff 00 00 f7 44 All code=
 =3D=3D=3D=3D=3D=3D=3D=3D
   0:	0c 81                	or     $0x81,%al
   2:	e1 ff                	loope  0x3
   4:	ff 00                	incl   (%rax)
   6:	00 36                	add    %dh,(%rsi)
   8:	89 48 f8             	mov    %ecx,-0x8(%rax)
   b:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   f:	36 89 48 f4          	mov    %ecx,%ss:-0xc(%rax)
  13:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
  17:	36 89 48 f0          	mov    %ecx,%ss:-0x10(%rax)
  1b:	59                   	pop    %rcx
  1c:	8d 60 f0             	lea    -0x10(%rax),%esp
  1f:	58                   	pop    %rax
  20:	cf                   	iret   =

  21:	6a 00                	pushq  $0x0
  23:	68 80 0d 3f d7       	pushq  $0xffffffffd73f0d80
  28:	eb 00                	jmp    0x2a
  2a:*	fc                   	cld    		<-- trapping instruction
  2b:	0f a0                	pushq  %fs
  2d:	50                   	push   %rax
  2e:	b8 00 00 00 00       	mov    $0x0,%eax
  33:	8e e0                	mov    %eax,%fs
  35:	58                   	pop    %rax
  36:	81 64 24 10 ff ff 00 	andl   $0xffff,0x10(%rsp)
  3d:	00 =

  3e:	f7                   	.byte 0xf7
  3f:	44                   	rex.R

Code starting with the faulting instruction =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
   0:	fc                   	cld    =

   1:	0f a0                	pushq  %fs
   3:	50                   	push   %rax
   4:	b8 00 00 00 00       	mov    $0x0,%eax
   9:	8e e0                	mov    %eax,%fs
   b:	58                   	pop    %rax
   c:	81 64 24 10 ff ff 00 	andl   $0xffff,0x10(%rsp)
  13:	00 =

  14:	f7                   	.byte 0xf7
  15:	44                   	rex.R
[    8.724295][    C0] EAX: 020e9000 EBX: ffa03fbc ECX: 00000000 EDX: 00000=
000
[    8.724297][    C0] ESI: c20e7ff0 EDI: ffa04000 EBP: 420e7fac ESP: ffa03=
008
[    8.724299][    C0] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS:=
 00010006
[    8.724305][    C0] CR0: 80050033 CR2: ffa02ffc CR3: 17f06000 CR4: 00040=
6b0
[    8.724307][    C0] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000=
000
[    8.724309][    C0] DR6: fffe0ff0 DR7: 00000400
[    8.724310][    C0] Call Trace:
[    8.724312][    C0]  <ENTRY_TRAMPOLINE>
[ 8.724313][ C0] ? paravirt_BUG (kbuild/src/rand-4/arch/x86/mm/fault.c:1497)
[ 8.724318][ C0] ? restore_all_switch_stack (kbuild/src/rand-4/arch/x86/ent=
ry/entry_32.S:1064)
[ 8.724322][ C0] ? paravirt_BUG (kbuild/src/rand-4/arch/x86/mm/fault.c:1497)
[ 8.724324][ C0] ? restore_all_switch_stack (kbuild/src/rand-4/arch/x86/ent=
ry/entry_32.S:1064) =



To reproduce:

        # build kernel
	cd linux
	cp config-5.17.0-rc4-01232-ga0f1f7b4f74f .config
	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare modules_pr=
epare bzImage modules
	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 INSTALL_MOD_PATH=3D<mod-install=
-dir> modules_install
	cd <mod-install-dir>
	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz


        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is=
 attached in this email

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.



--
0-DAY CI Kernel Test Service
https://01.org/lkp


--===============0477685914164730105==--

