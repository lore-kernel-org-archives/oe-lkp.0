Content-Type: multipart/mixed; boundary="===============4046692439992450023=="
MIME-Version: 1.0
From: Daniel Borkmann <daniel@iogearbox.net>
To: lkp@lists.01.org
Subject: Re: [net, neigh] 7482e3841d: BUG:unable_to_handle_page_fault_for_address
Date: Thu, 04 Nov 2021 16:35:26 +0100
Message-ID: <2795a2ab-b036-9743-6ce9-9e73683ad5f0@iogearbox.net>
In-Reply-To: <20211104152159.GD6499@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4046692439992450023==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/4/21 4:21 PM, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 7482e3841d520a368426ac196720601687e2dc47 ("net, neigh: Add NTF_MA=
NAGED flag for managed neighbor entries")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: boot
> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

Thanks, I'll take a look at the reproducer!

> +-------------------------------------------------------+------------+---=
---------+
> |                                                       | 2c611ad97a | 74=
82e3841d |
> +-------------------------------------------------------+------------+---=
---------+
> | boot_failures                                         | 0          | 15=
         |
> | BUG:unable_to_handle_page_fault_for_address           | 0          | 15=
         |
> | Oops:#[##]                                            | 0          | 15=
         |
> | EIP:run_timer_softirq                                 | 0          | 15=
         |
> | EIP:_raw_spin_unlock_irqrestore                       | 0          | 8 =
         |
> | Kernel_panic-not_syncing:Fatal_exception_in_interrupt | 0          | 15=
         |
> +-------------------------------------------------------+------------+---=
---------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [   36.043298][    C0] BUG: unable to handle page fault for address: f7a5=
c288
> [   36.044351][    C0] #PF: supervisor write access in kernel mode
> [   36.044975][    C0] #PF: error_code(0x0002) - not-present page
> [   36.045876][    C0] *pde =3D 063ad067 *pte =3D 00000000
> [   36.046763][    C0] Oops: 0002 [#1]
> [   36.047362][    C0] CPU: 0 PID: 240 Comm: systemd-udevd Not tainted 5.=
15.0-rc4-01167-g7482e3841d52 #1
> [   36.048619][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.12.0-1 04/01/2014
> [ 36.049966][ C0] EIP: run_timer_softirq (include/linux/list.h:968 kernel=
/time/timer.c:1487 kernel/time/timer.c:1723 kernel/time/timer.c:1747)
> [ 36.052089][ C0] Code: 00 00 8d 4d d0 8d 76 00 89 d0 83 e0 3f 01 d8 0f b=
3 05 00 08 ca c2 73 28 c1 e0 02 8d 79 04 8b b0 48 08 ca c2 89 31 85 f6 74 0=
3 <89> 4e 04 8b 4d cc c7 80 48 08 ca c2 00 00 00 00 41 89 4d cc 89 f9
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>     0:	00 00                	add    %al,(%rax)
>     2:	8d 4d d0             	lea    -0x30(%rbp),%ecx
>     5:	8d 76 00             	lea    0x0(%rsi),%esi
>     8:	89 d0                	mov    %edx,%eax
>     a:	83 e0 3f             	and    $0x3f,%eax
>     d:	01 d8                	add    %ebx,%eax
>     f:	0f b3 05 00 08 ca c2 	btr    %eax,-0x3d35f800(%rip)        # 0xfff=
fffffc2ca0816
>    16:	73 28                	jae    0x40
>    18:	c1 e0 02             	shl    $0x2,%eax
>    1b:	8d 79 04             	lea    0x4(%rcx),%edi
>    1e:	8b b0 48 08 ca c2    	mov    -0x3d35f7b8(%rax),%esi
>    24:	89 31                	mov    %esi,(%rcx)
>    26:	85 f6                	test   %esi,%esi
>    28:	74 03                	je     0x2d
>    2a:*	89 4e 04             	mov    %ecx,0x4(%rsi)		<-- trapping instruc=
tion
>    2d:	8b 4d cc             	mov    -0x34(%rbp),%ecx
>    30:	c7 80 48 08 ca c2 00 	movl   $0x0,-0x3d35f7b8(%rax)
>    37:	00 00 00
>    3a:	41 89 4d cc          	mov    %ecx,-0x34(%r13)
>    3e:	89 f9                	mov    %edi,%ecx
> =

> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     0:	89 4e 04             	mov    %ecx,0x4(%rsi)
>     3:	8b 4d cc             	mov    -0x34(%rbp),%ecx
>     6:	c7 80 48 08 ca c2 00 	movl   $0x0,-0x3d35f7b8(%rax)
>     d:	00 00 00
>    10:	41 89 4d cc          	mov    %ecx,-0x34(%r13)
>    14:	89 f9                	mov    %edi,%ecx
> [   36.054162][    C0] EAX: 000003c8 EBX: 000000c0 ECX: c01d3f8c EDX: 007=
ffdf2
> [   36.055033][    C0] ESI: f7a5c284 EDI: c01d3f90 EBP: c01d3fbc ESP: c01=
d3f78
> [   36.056023][    C0] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068 EFLAG=
S: 00010086
> [   36.056827][    C0] CR0: 80050033 CR2: f7a5c288 CR3: 347fd000 CR4: 000=
00690
> [   36.057861][    C0] Call Trace:
> [   36.058411][    C0]  <SOFTIRQ>
> [ 36.058940][ C0] ? queue_work_node (kernel/workqueue.c:1640)
> [ 36.059474][ C0] ? do_softirq_own_stack (arch/x86/kernel/irq_32.c:60 arc=
h/x86/kernel/irq_32.c:149)
> [ 36.060008][ C0] __do_softirq (arch/x86/include/asm/jump_label.h:41 incl=
ude/linux/jump_label.h:212 include/trace/events/irq.h:142 kernel/softirq.c:=
559)
> [ 36.060499][ C0] ? __softirqentry_text_start (kernel/softirq.c:516)
> [ 36.061078][ C0] do_softirq_own_stack (arch/x86/kernel/irq_32.c:60 arch/=
x86/kernel/irq_32.c:149)
> [   36.061626][    C0]  </SOFTIRQ>
> [ 36.061992][ C0] irq_exit (kernel/softirq.c:439 kernel/softirq.c:636 ker=
nel/softirq.c:626 kernel/softirq.c:660)
> [ 36.062434][ C0] common_interrupt (arch/x86/kernel/irq.c:240)
> [ 36.062915][ C0] asm_common_interrupt (arch/x86/include/asm/idtentry.h:6=
29)
> [   36.063497][    C0] EIP: 0x442062
> [ 36.063986][ C0] Code: a8 04 74 03 8b 57 04 83 e0 03 89 4c 24 04 83 ec 0=
8 c1 e0 04 ff 74 24 10 8b 8c 05 a4 f8 ff ff 8b 07 0f af cb ff 34 0a ff 50 0=
4 <83> c4 10 85 c0 8b 4c 24 04 75 9d 83 c4 1c 89 d8 5b 5e 5f 5d c3 89
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>     0:	a8 04                	test   $0x4,%al
>     2:	74 03                	je     0x7
>     4:	8b 57 04             	mov    0x4(%rdi),%edx
>     7:	83 e0 03             	and    $0x3,%eax
>     a:	89 4c 24 04          	mov    %ecx,0x4(%rsp)
>     e:	83 ec 08             	sub    $0x8,%esp
>    11:	c1 e0 04             	shl    $0x4,%eax
>    14:	ff 74 24 10          	pushq  0x10(%rsp)
>    18:	8b 8c 05 a4 f8 ff ff 	mov    -0x75c(%rbp,%rax,1),%ecx
>    1f:	8b 07                	mov    (%rdi),%eax
>    21:	0f af cb             	imul   %ebx,%ecx
>    24:	ff 34 0a             	pushq  (%rdx,%rcx,1)
>    27:	ff 50 04             	callq  *0x4(%rax)
>    2a:*	83 c4 10             	add    $0x10,%esp		<-- trapping instruction
>    2d:	85 c0                	test   %eax,%eax
>    2f:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
>    33:	75 9d                	jne    0xffffffffffffffd2
>    35:	83 c4 1c             	add    $0x1c,%esp
>    38:	89 d8                	mov    %ebx,%eax
>    3a:	5b                   	pop    %rbx
>    3b:	5e                   	pop    %rsi
>    3c:	5f                   	pop    %rdi
>    3d:	5d                   	pop    %rbp
>    3e:	c3                   	retq
>    3f:	89                   	.byte 0x89
> =

> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     0:	83 c4 10             	add    $0x10,%esp
>     3:	85 c0                	test   %eax,%eax
>     5:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
>     9:	75 9d                	jne    0xffffffffffffffa8
>     b:	83 c4 1c             	add    $0x1c,%esp
>     e:	89 d8                	mov    %ebx,%eax
>    10:	5b                   	pop    %rbx
>    11:	5e                   	pop    %rsi
>    12:	5f                   	pop    %rdi
>    13:	5d                   	pop    %rbp
>    14:	c3                   	retq
>    15:	89                   	.byte 0x89
> [   36.066801][    C0] EAX: 00000000 EBX: 00000008 ECX: 00000000 EDX: 00f=
c8f18
> [   36.067588][    C0] ESI: 00000000 EDI: 00fe7554 EBP: 00484be0 ESP: bf8=
6a370
> [   36.068349][    C0] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAG=
S: 00000282
> [   36.069124][    C0] Modules linked in: bochs drm_vram_helper drm_ttm_h=
elper ttm drm_kms_helper crc32c_intel rapl drm i2c_piix4 drm_panel_orientat=
ion_quirks
> [   36.070793][    C0] CR2: 00000000f7a5c288
> [   36.071230][    C0] ---[ end trace ffe4792311281b74 ]---
> [ 36.071825][ C0] EIP: run_timer_softirq (include/linux/list.h:968 kernel=
/time/timer.c:1487 kernel/time/timer.c:1723 kernel/time/timer.c:1747)
> [ 36.072411][ C0] Code: 00 00 8d 4d d0 8d 76 00 89 d0 83 e0 3f 01 d8 0f b=
3 05 00 08 ca c2 73 28 c1 e0 02 8d 79 04 8b b0 48 08 ca c2 89 31 85 f6 74 0=
3 <89> 4e 04 8b 4d cc c7 80 48 08 ca c2 00 00 00 00 41 89 4d cc 89 f9
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>     0:	00 00                	add    %al,(%rax)
>     2:	8d 4d d0             	lea    -0x30(%rbp),%ecx
>     5:	8d 76 00             	lea    0x0(%rsi),%esi
>     8:	89 d0                	mov    %edx,%eax
>     a:	83 e0 3f             	and    $0x3f,%eax
>     d:	01 d8                	add    %ebx,%eax
>     f:	0f b3 05 00 08 ca c2 	btr    %eax,-0x3d35f800(%rip)        # 0xfff=
fffffc2ca0816
>    16:	73 28                	jae    0x40
>    18:	c1 e0 02             	shl    $0x2,%eax
>    1b:	8d 79 04             	lea    0x4(%rcx),%edi
>    1e:	8b b0 48 08 ca c2    	mov    -0x3d35f7b8(%rax),%esi
>    24:	89 31                	mov    %esi,(%rcx)
>    26:	85 f6                	test   %esi,%esi
>    28:	74 03                	je     0x2d
>    2a:*	89 4e 04             	mov    %ecx,0x4(%rsi)		<-- trapping instruc=
tion
>    2d:	8b 4d cc             	mov    -0x34(%rbp),%ecx
>    30:	c7 80 48 08 ca c2 00 	movl   $0x0,-0x3d35f7b8(%rax)
>    37:	00 00 00
>    3a:	41 89 4d cc          	mov    %ecx,-0x34(%r13)
>    3e:	89 f9                	mov    %edi,%ecx
> =

> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     0:	89 4e 04             	mov    %ecx,0x4(%rsi)
>     3:	8b 4d cc             	mov    -0x34(%rbp),%ecx
>     6:	c7 80 48 08 ca c2 00 	movl   $0x0,-0x3d35f7b8(%rax)
>     d:	00 00 00
>    10:	41 89 4d cc          	mov    %ecx,-0x34(%r13)
>    14:	89 f9                	mov    %edi,%ecx
> =

> =

> To reproduce:
> =

>          # build kernel
> 	cd linux
> 	cp config-5.15.0-rc4-01167-g7482e3841d52 .config
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

--===============4046692439992450023==--

