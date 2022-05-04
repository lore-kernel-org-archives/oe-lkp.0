Content-Type: multipart/mixed; boundary="===============0982988936307424476=="
MIME-Version: 1.0
From: Zach O'Keefe <zokeefe@google.com>
To: lkp@lists.01.org
Subject: Re: [mm/khugepaged] 0d006aeaf9: BUG:unable_to_handle_page_fault_for_address
Date: Wed, 04 May 2022 14:46:18 -0700
Message-ID: <CAAa6QmT-DiPHaW7k40=iUwoGcG=dRsY=gFem+H8h5oeFj0+huA@mail.gmail.com>
In-Reply-To: <20220504022511.GC30775@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0982988936307424476==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for reporting. Fixed in v5.

On Tue, May 3, 2022 at 7:25 PM kernel test robot <oliver.sang@intel.com> =
wrote:
>
>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-11):
>
> commit: 0d006aeaf99be94a0dcb727cb6540195f13fd9c3 ("[PATCH v4 04/13] mm/kh=
ugepaged: make hugepage allocation context-specific")
> url: https://github.com/intel-lab-lkp/linux/commits/Zach-O-Keefe/mm-khuge=
paged-record-SCAN_PMD_MAPPED-when-scan_pmd-finds-THP/20220503-031727
> patch link: https://lore.kernel.org/linux-mm/20220502181714.3483177-5-zok=
eefe(a)google.com
>
> in testcase: boot
>
> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
4G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> [   18.854835][   T17] BUG: unable to handle page fault for address: 003c=
24ca
> [   18.855169][   T17] #PF: supervisor read access in kernel mode
> [   18.855395][   T17] #PF: error_code(0x0000) - not-present page
> [   18.855620][   T17] *pde =3D 00000000
> [   18.855763][   T17] Oops: 0000 [#1]
> [   18.855903][   T17] CPU: 0 PID: 17 Comm: khugepaged Not tainted 5.18.0=
-rc5-next-20220502-00004-g0d006aeaf99b #1
> [ 18.856283][ T17] EIP: alloc_charge_hpage (mm/khugepaged.c:951 mm/khugep=
aged.c:1091)
> [ 18.856498][ T17] Code: 00 00 00 55 89 e5 6a 07 e8 86 c0 ff ff c9 31 d2 =
89 d1 c3 55 89 e5 a1 28 e6 fa 59 25 80 00 00 00 83 f8 01 19 c0 25 00 fc ff =
ff <8b> 80 ca 24 3c 00 85 c0 74 0f 8b 42 08 5d 8b 40 04 b8 01 00 00 00
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   00 00                   add    %al,(%rax)
>    2:   00 55 89                add    %dl,-0x77(%rbp)
>    5:   e5 6a                   in     $0x6a,%eax
>    7:   07                      (bad)
>    8:   e8 86 c0 ff ff          callq  0xffffffffffffc093
>    d:   c9                      leaveq
>    e:   31 d2                   xor    %edx,%edx
>   10:   89 d1                   mov    %edx,%ecx
>   12:   c3                      retq
>   13:   55                      push   %rbp
>   14:   89 e5                   mov    %esp,%ebp
>   16:   a1 28 e6 fa 59 25 80    movabs 0x802559fae628,%eax
>   1d:   00 00
>   1f:   00 83 f8 01 19 c0       add    %al,-0x3fe6fe08(%rbx)
>   25:   25 00 fc ff ff          and    $0xfffffc00,%eax
>   2a:*  8b 80 ca 24 3c 00       mov    0x3c24ca(%rax),%eax              <=
-- trapping instruction
>   30:   85 c0                   test   %eax,%eax
>   32:   74 0f                   je     0x43
>   34:   8b 42 08                mov    0x8(%rdx),%eax
>   37:   5d                      pop    %rbp
>   38:   8b 40 04                mov    0x4(%rax),%eax
>   3b:   b8 01 00 00 00          mov    $0x1,%eax
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   8b 80 ca 24 3c 00       mov    0x3c24ca(%rax),%eax
>    6:   85 c0                   test   %eax,%eax
>    8:   74 0f                   je     0x19
>    a:   8b 42 08                mov    0x8(%rdx),%eax
>    d:   5d                      pop    %rbp
>    e:   8b 40 04                mov    0x4(%rax),%eax
>   11:   b8 01 00 00 00          mov    $0x1,%eax
> [   18.857217][   T17] EAX: 00000000 EBX: 41172400 ECX: 00000000 EDX: 411=
d1f7c
> [   18.857487][   T17] ESI: 411d1f7c EDI: 4117245c EBP: 411d1e64 ESP: 411=
d1e64
> [   18.857750][   T17] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAG=
S: 00010246
> [   18.858036][   T17] CR0: 80050033 CR2: 003c24ca CR3: 112f3000 CR4: 000=
406d0
> [   18.858302][   T17] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 000=
00000
> [   18.858567][   T17] DR6: fffe0ff0 DR7: 00000400
> [   18.858743][   T17] Call Trace:
> [ 18.858871][ T17] ? collapse_huge_page (mm/khugepaged.c:1109)
> [ 18.859066][ T17] ? find_held_lock (kernel/locking/lockdep.c:5156)
> [ 18.859245][ T17] ? khugepaged_scan_pmd (mm/khugepaged.c:1400)
> [ 18.859446][ T17] ? khugepaged_scan_mm_slot (mm/khugepaged.c:2216)
> [ 18.859657][ T17] ? khugepaged_do_scan (mm/khugepaged.c:2290)
> [ 18.859854][ T17] ? khugepaged (mm/khugepaged.c:2340)
> [ 18.860016][ T17] ? khugepaged_defrag_show (mm/khugepaged.c:1076)
> [ 18.860219][ T17] ? kthread (kernel/kthread.c:376)
> [ 18.860374][ T17] ? khugepaged_do_scan (mm/khugepaged.c:2328)
> [ 18.860570][ T17] ? kthread_complete_and_exit (kernel/kthread.c:331)
> [ 18.860781][ T17] ? ret_from_fork (arch/x86/entry/entry_32.S:772)
> [   18.860956][   T17] Modules linked in:
> [   18.861105][   T17] CR2: 00000000003c24ca
> [   18.861262][   T17] ---[ end trace 0000000000000000 ]---
> [ 18.861263][ T17] EIP: alloc_charge_hpage (mm/khugepaged.c:951 mm/khugep=
aged.c:1091)
> [ 18.861266][ T17] Code: 00 00 00 55 89 e5 6a 07 e8 86 c0 ff ff c9 31 d2 =
89 d1 c3 55 89 e5 a1 28 e6 fa 59 25 80 00 00 00 83 f8 01 19 c0 25 00 fc ff =
ff <8b> 80 ca 24 3c 00 85 c0 74 0f 8b 42 08 5d 8b 40 04 b8 01 00 00 00
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   00 00                   add    %al,(%rax)
>    2:   00 55 89                add    %dl,-0x77(%rbp)
>    5:   e5 6a                   in     $0x6a,%eax
>    7:   07                      (bad)
>    8:   e8 86 c0 ff ff          callq  0xffffffffffffc093
>    d:   c9                      leaveq
>    e:   31 d2                   xor    %edx,%edx
>   10:   89 d1                   mov    %edx,%ecx
>   12:   c3                      retq
>   13:   55                      push   %rbp
>   14:   89 e5                   mov    %esp,%ebp
>   16:   a1 28 e6 fa 59 25 80    movabs 0x802559fae628,%eax
>   1d:   00 00
>   1f:   00 83 f8 01 19 c0       add    %al,-0x3fe6fe08(%rbx)
>   25:   25 00 fc ff ff          and    $0xfffffc00,%eax
>   2a:*  8b 80 ca 24 3c 00       mov    0x3c24ca(%rax),%eax              <=
-- trapping instruction
>   30:   85 c0                   test   %eax,%eax
>   32:   74 0f                   je     0x43
>   34:   8b 42 08                mov    0x8(%rdx),%eax
>   37:   5d                      pop    %rbp
>   38:   8b 40 04                mov    0x4(%rax),%eax
>   3b:   b8 01 00 00 00          mov    $0x1,%eax
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   8b 80 ca 24 3c 00       mov    0x3c24ca(%rax),%eax
>    6:   85 c0                   test   %eax,%eax
>    8:   74 0f                   je     0x19
>    a:   8b 42 08                mov    0x8(%rdx),%eax
>    d:   5d                      pop    %rbp
>    e:   8b 40 04                mov    0x4(%rax),%eax
>   11:   b8 01 00 00 00          mov    $0x1,%eax
>
>
> To reproduce:
>
>         # build kernel
>         cd linux
>         cp config-5.18.0-rc5-next-20220502-00004-g0d006aeaf99b .config
>         make HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Di386 olddefconfig prepare=
 modules_prepare bzImage modules
>         make HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Di386 INSTALL_MOD_PATH=3D<=
mod-install-dir> modules_install
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
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
>
>
--===============0982988936307424476==--

