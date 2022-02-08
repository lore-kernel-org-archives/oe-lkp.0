Content-Type: multipart/mixed; boundary="===============1035875205658376734=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: lkp@lists.01.org
Subject: Re: [x86] 1099ce55b0: BUG:kernel_NULL_pointer_dereference, address
Date: Mon, 07 Feb 2022 16:23:06 -0800
Message-ID: <CAKwvOdm0+bB=UY91V=ai2TPg3XCbNUZQfBzxrSUA0AtW=zM=LA@mail.gmail.com>
In-Reply-To: <20220204123740.GA4077@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1035875205658376734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 4, 2022 at 4:37 AM kernel test robot <oliver.sang@intel.com> =
wrote:
>
>
>
> Greeting,
>
> FYI, we noticed the following commit (built with clang-15):
>
> commit: 1099ce55b0530ff429312dc37362ad43aee8c5c0 ("x86: don't build CONFI=
G_X86_32 as -ffreestanding")
> https://git.kernel.org/cgit/linux/kernel/git/kees/linux.git for-next/memc=
py
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +---------------------------------------------+------------+------------+
> |                                             | 274d8f425a | 1099ce55b0 |
> +---------------------------------------------+------------+------------+
> | boot_successes                              | 9          | 0          |
> | boot_failures                               | 0          | 10         |
> | BUG:kernel_NULL_pointer_dereference,address | 0          | 10         |
> | Oops:#[##]                                  | 0          | 10         |
> | EIP:bcmp                                    | 0          | 10         |
> | Kernel_panic-not_syncing:Fatal_exception    | 0          | 10         |
> | Kernel_panic-not_syncing:Fatal_exception]   | 0          | 10         |
> +---------------------------------------------+------------+------------+
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> [    0.000000][    T0] BUG: kernel NULL pointer dereference, address: 000=
0004d
> [    0.000000][    T0] #PF: supervisor read access in kernel mode
> [    0.000000][    T0] #PF: error_code(0x0000) - not-present page
> [    0.000000][    T0] *pde =3D 00000000
> [    0.000000][    T0] Oops: 0000 [#1]
> [    0.000000][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 5.17.0-rc2=
-00011-g1099ce55b053 #1
> [    0.000000][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.12.0-1 04/01/2014
> [ 0.000000][ T0] EIP: bcmp (??:?)
> [ 0.000000][ T0] Code: 90 90 90 90 90 90 90 90 55 89 e5 53 57 56 50 83 f9=
 04 72 33 83 05 c8 e5 9c c2 01 8b 35 cc e5 9c c2 83 c6 01 90 90 90 90 8b 38=
 <3b> 3a 75 26 89 35 cc e5 9c c2 83 c0 04 83 c2 04 83 c1 fc 83 c6 01
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   90                      nop
>    1:   90                      nop
>    2:   90                      nop
>    3:   90                      nop
>    4:   90                      nop
>    5:   90                      nop
>    6:   90                      nop
>    7:   90                      nop
>    8:   55                      push   %rbp
>    9:   89 e5                   mov    %esp,%ebp
>    b:   53                      push   %rbx
>    c:   57                      push   %rdi
>    d:   56                      push   %rsi
>    e:   50                      push   %rax
>    f:   83 f9 04                cmp    $0x4,%ecx
>   12:   72 33                   jb     0x47
>   14:   83 05 c8 e5 9c c2 01    addl   $0x1,-0x3d631a38(%rip)        # 0x=
ffffffffc29ce5e3
>   1b:   8b 35 cc e5 9c c2       mov    -0x3d631a34(%rip),%esi        # 0x=
ffffffffc29ce5ed
>   21:   83 c6 01                add    $0x1,%esi
>   24:   90                      nop
>   25:   90                      nop
>   26:   90                      nop
>   27:   90                      nop
>   28:   8b 38                   mov    (%rax),%edi
>   2a:*  3b 3a                   cmp    (%rdx),%edi              <-- trapp=
ing instruction

I've been having a hard time pinpointing via bisection when this
stopped working.  I suspect it's actually the change on llvm's side
that would replace memcmp with bcmp.  With this diff, we can boot
ARCH=3Di386 defconfig

```
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 7ef211865239..5e4570495206 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -88,6 +88,8 @@ ifeq ($(CONFIG_X86_32),y)
         include $(srctree)/arch/x86/Makefile_32.cpu
         KBUILD_CFLAGS +=3D $(cflags-y)

+        KBUILD_CFLAGS +=3D -fno-builtin-bcmp
+
        ifeq ($(CONFIG_STACKPROTECTOR),y)
                ifeq ($(CONFIG_SMP),y)
                        KBUILD_CFLAGS +=3D
-mstack-protector-guard-reg=3Dfs
-mstack-protector-guard-symbol=3D__stack_chk_guard
```

It looks like the call argument setup in the _callers_ of memcmp is messed =
up.

Before:
pushl %ecx
pushl %ebx
pushl -24(%ebp)
calll bcmp

After:
movl  %ebx, %eax
movl  %esi, %edx
movl  %ecx, %ebx
calll memcmp

it looks like they're not obeying `-mregparm=3D3`.

https://godbolt.org/z/z3fjveP4h

Diffing the IR between `-mregparm=3D3` vs not, it looks like there's an
LLVM IR function argument attribute inreg.
https://llvm.org/docs/LangRef.html#parameter-attributes
>> This indicates that this parameter or return value should be treated in a
>> special target-dependent fashion while emitting code for a function call
>> or return (usually, by putting it in a register as opposed to memory,
>> though some targets use it to distinguish between two different kinds of
>> registers). Use of this attribute is target-specific.

As is tradition, instcombine is not checking+carrying over the
function argument attributes when replacing calls to memcmp w/ bcmp.

Before:
  %4 =3D call i32 @memcmp(i8* inreg noundef %3, i8* inreg noundef %0,
i32 inreg noundef %1) #4, !dbg !22

After:
  %bcmp =3D call i32 @bcmp(i8* %3, i8* %0, i32 %1), !dbg !22

Filed:
https://github.com/llvm/llvm-project/issues/53645

So I think the best course of action is to disable memcmp to bcmp
BEFORE the removal of -ffreestanding, and only for clang until we have
a fix in hand.


>   2c:   75 26                   jne    0x54
>   2e:   89 35 cc e5 9c c2       mov    %esi,-0x3d631a34(%rip)        # 0x=
ffffffffc29ce600
>   34:   83 c0 04                add    $0x4,%eax
>   37:   83 c2 04                add    $0x4,%edx
>   3a:   83 c1 fc                add    $0xfffffffc,%ecx
>   3d:   83 c6 01                add    $0x1,%esi
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   3b 3a                   cmp    (%rdx),%edi
>    2:   75 26                   jne    0x2a
>    4:   89 35 cc e5 9c c2       mov    %esi,-0x3d631a34(%rip)        # 0x=
ffffffffc29ce5d6
>    a:   83 c0 04                add    $0x4,%eax
>    d:   83 c2 04                add    $0x4,%edx
>   10:   83 c1 fc                add    $0xfffffffc,%ecx
>   13:   83 c6 01                add    $0x1,%esi
> [    0.000000][    T0] EAX: c23b5f10 EBX: 4b4d564b ECX: 564b4d56 EDX: 000=
0004d
> [    0.000000][    T0] ESI: 00000001 EDI: 4b4d564b EBP: c23b5efc ESP: c23=
b5eec
> [    0.000000][    T0] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAG=
S: 00210002
> [    0.000000][    T0] CR0: 80050033 CR2: 0000004d CR3: 02b4d000 CR4: 000=
40600
> [    0.000000][    T0] Call Trace:
> [ 0.000000][ T0] vmware_platform (vmware.c:?)
> [ 0.000000][ T0] detect_hypervisor_vendor (hypervisor.c:?)
> [ 0.000000][ T0] init_hypervisor_platform (??:?)
> [ 0.000000][ T0] setup_arch (??:?)
> [ 0.000000][ T0] ? vprintk (??:?)
> [ 0.000000][ T0] ? _printk (??:?)
> [ 0.000000][ T0] start_kernel (??:?)
> [ 0.000000][ T0] i386_start_kernel (??:?)
> [ 0.000000][ T0] startup_32_smp (??:?)
> [    0.000000][    T0] Modules linked in:
> [    0.000000][    T0] CR2: 000000000000004d
> [    0.000000][    T0] ---[ end trace 0000000000000000 ]---
> [ 0.000000][ T0] EIP: bcmp (??:?)
> [ 0.000000][ T0] Code: 90 90 90 90 90 90 90 90 55 89 e5 53 57 56 50 83 f9=
 04 72 33 83 05 c8 e5 9c c2 01 8b 35 cc e5 9c c2 83 c6 01 90 90 90 90 8b 38=
 <3b> 3a 75 26 89 35 cc e5 9c c2 83 c0 04 83 c2 04 83 c1 fc 83 c6 01
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   90                      nop
>    1:   90                      nop
>    2:   90                      nop
>    3:   90                      nop
>    4:   90                      nop
>    5:   90                      nop
>    6:   90                      nop
>    7:   90                      nop
>    8:   55                      push   %rbp
>    9:   89 e5                   mov    %esp,%ebp
>    b:   53                      push   %rbx
>    c:   57                      push   %rdi
>    d:   56                      push   %rsi
>    e:   50                      push   %rax
>    f:   83 f9 04                cmp    $0x4,%ecx
>   12:   72 33                   jb     0x47
>   14:   83 05 c8 e5 9c c2 01    addl   $0x1,-0x3d631a38(%rip)        # 0x=
ffffffffc29ce5e3
>   1b:   8b 35 cc e5 9c c2       mov    -0x3d631a34(%rip),%esi        # 0x=
ffffffffc29ce5ed
>   21:   83 c6 01                add    $0x1,%esi
>   24:   90                      nop
>   25:   90                      nop
>   26:   90                      nop
>   27:   90                      nop
>   28:   8b 38                   mov    (%rax),%edi
>   2a:*  3b 3a                   cmp    (%rdx),%edi              <-- trapp=
ing instruction
>   2c:   75 26                   jne    0x54
>   2e:   89 35 cc e5 9c c2       mov    %esi,-0x3d631a34(%rip)        # 0x=
ffffffffc29ce600
>   34:   83 c0 04                add    $0x4,%eax
>   37:   83 c2 04                add    $0x4,%edx
>   3a:   83 c1 fc                add    $0xfffffffc,%ecx
>   3d:   83 c6 01                add    $0x1,%esi
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   3b 3a                   cmp    (%rdx),%edi
>    2:   75 26                   jne    0x2a
>    4:   89 35 cc e5 9c c2       mov    %esi,-0x3d631a34(%rip)        # 0x=
ffffffffc29ce5d6
>    a:   83 c0 04                add    $0x4,%eax
>    d:   83 c2 04                add    $0x4,%edx
>   10:   83 c1 fc                add    $0xfffffffc,%ecx
>   13:   83 c6 01                add    $0x1,%esi
>
>
> To reproduce:
>
>         # build kernel
>         cd linux
>         cp config-5.17.0-rc2-00011-g1099ce55b053 .config
>         make HOSTCC=3Dclang-15 CC=3Dclang-15 ARCH=3Di386 olddefconfig pre=
pare modules_prepare bzImage modules
>         make HOSTCC=3Dclang-15 CC=3Dclang-15 ARCH=3Di386 INSTALL_MOD_PATH=
=3D<mod-install-dir> modules_install
>         cd <mod-install-dir>
>         find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
>
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script =
is attached in this email
>
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>
>
> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpo=
ration
>
> Thanks,
> Oliver Sang
>


-- =

Thanks,
~Nick Desaulniers
--===============1035875205658376734==--

