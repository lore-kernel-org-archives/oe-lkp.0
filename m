Content-Type: multipart/mixed; boundary="===============4560096503245928787=="
MIME-Version: 1.0
From: 黄朝阳 (Zhaoyang Huang) <zhaoyang.huang@unisoc.com>
To: lkp@lists.01.org
Subject: 答复: [mm] a65edf711f: BUG:kernel_NULL_pointer_dereference
Date: Fri, 30 Sep 2022 09:32:40 +0000
Message-ID: <1664530343614.62803@unisoc.com>
In-Reply-To: <202209301329.8c1446ee-yujie.liu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4560096503245928787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I think it is should caused by an invalid stack_table as it is too early to=
 run stack_depot_early_init. I have filed a new patch to fix.

________________________________________
=E5=8F=91=E4=BB=B6=E4=BA=BA: kernel test robot <yujie.liu@intel.com>
=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2022=E5=B9=B49=E6=9C=8830=E6=97=A5 14=
:22
=E6=94=B6=E4=BB=B6=E4=BA=BA: =E9=BB=84=E6=9C=9D=E9=98=B3 (Zhaoyang Huang)
=E6=8A=84=E9=80=81: lkp(a)lists.01.org; lkp(a)intel.com; linux-mm(a)kvack.o=
rg; Andrew Morton; Catalin Marinas; Matthew Wilcox; Zhaoyang Huang; linux-k=
ernel(a)vger.kernel.org; =E7=8E=8B=E7=A7=91 (Ke Wang); =E5=BA=B7=E7=BA=AA=
=E6=BB=A8 (Steve Kang)
=E4=B8=BB=E9=A2=98: [mm] a65edf711f: BUG:kernel_NULL_pointer_dereference

=E6=B3=A8=E6=84=8F: =E8=BF=99=E5=B0=81=E9=82=AE=E4=BB=B6=E6=9D=A5=E8=87=AA=
=E4=BA=8E=E5=A4=96=E9=83=A8=E3=80=82=E9=99=A4=E9=9D=9E=E4=BD=A0=E7=A1=AE=E5=
=AE=9A=E9=82=AE=E4=BB=B6=E5=86=85=E5=AE=B9=E5=AE=89=E5=85=A8=EF=BC=8C=E5=90=
=A6=E5=88=99=E4=B8=8D=E8=A6=81=E7=82=B9=E5=87=BB=E4=BB=BB=E4=BD=95=E9=93=BE=
=E6=8E=A5=E5=92=8C=E9=99=84=E4=BB=B6=E3=80=82
CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you recognize the sender and know the c=
ontent is safe.



Greeting,

FYI, we noticed the following commit (built with gcc-11):

commit: a65edf711f97a0a3764fc04b0301ab2e073992db ("[PATCH] mm: use stack_de=
pot for recording kmemleak's backtrace")
url: https://github.com/intel-lab-lkp/linux/commits/zhaoyang-huang/mm-use-s=
tack_depot-for-recording-kmemleak-s-backtrace/20220929-183243
base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everything
patch link: https://lore.kernel.org/linux-mm/1664447407-8821-1-git-send-ema=
il-zhaoyang.huang(a)unisoc.com

in testcase: boot

on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m =
16G

caused below changes (please refer to attached dmesg/kmsg for entire log/ba=
cktrace):


[    0.191645][    T0] BUG: kernel NULL pointer dereference, address: 00000=
00000000000
[    0.192360][    T0] #PF: supervisor read access in kernel mode
[    0.192862][    T0] #PF: error_code(0x0000) - not-present page
[    0.193371][    T0] PGD 0 P4D 0
[    0.193672][    T0] Oops: 0000 [#1] SMP PTI
[    0.194051][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 6.0.0-rc3-00=
706-ga65edf711f97 #26
[    0.194755][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996=
), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
[ 0.195583][ T0] RIP: 0010:__stack_depot_save (kbuild/src/x86_64-2/lib/stac=
kdepot.c:452)
[ 0.196081][ T0] Code: 03 48 c7 c7 ec 17 b3 84 e8 f1 ea 85 ff 44 89 e0 23 0=
5 d4 aa 01 03 48 8d 04 c3 48 89 c3 48 89 c7 48 89 44 24 28 e8 34 fc 85 ff <=
4c> 8b 33 4d 85 f6 0f 84 b6 00 00 00 8b 04 24 83 e8 01 48 8d 04 c5
All code
=3D=3D=3D=3D=3D=3D=3D=3D
   0:   03 48 c7                add    -0x39(%rax),%ecx
   3:   c7                      (bad)
   4:   ec                      in     (%dx),%al
   5:   17                      (bad)
   6:   b3 84                   mov    $0x84,%bl
   8:   e8 f1 ea 85 ff          callq  0xffffffffff85eafe
   d:   44 89 e0                mov    %r12d,%eax
  10:   23 05 d4 aa 01 03       and    0x301aad4(%rip),%eax        # 0x301a=
aea
  16:   48 8d 04 c3             lea    (%rbx,%rax,8),%rax
  1a:   48 89 c3                mov    %rax,%rbx
  1d:   48 89 c7                mov    %rax,%rdi
  20:   48 89 44 24 28          mov    %rax,0x28(%rsp)
  25:   e8 34 fc 85 ff          callq  0xffffffffff85fc5e
  2a:*  4c 8b 33                mov    (%rbx),%r14              <-- trappin=
g instruction
  2d:   4d 85 f6                test   %r14,%r14
  30:   0f 84 b6 00 00 00       je     0xec
  36:   8b 04 24                mov    (%rsp),%eax
  39:   83 e8 01                sub    $0x1,%eax
  3c:   48                      rex.W
  3d:   8d                      .byte 0x8d
  3e:   04 c5                   add    $0xc5,%al

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   0:   4c 8b 33                mov    (%rbx),%r14
   3:   4d 85 f6                test   %r14,%r14
   6:   0f 84 b6 00 00 00       je     0xc2
   c:   8b 04 24                mov    (%rsp),%eax
   f:   83 e8 01                sub    $0x1,%eax
  12:   48                      rex.W
  13:   8d                      .byte 0x8d
  14:   04 c5                   add    $0xc5,%al
[    0.197693][    T0] RSP: 0000:ffffffff83603ca8 EFLAGS: 00010046
[    0.198214][    T0] RAX: ffffffff83613cd8 RBX: 0000000000000000 RCX: fff=
fffff81b16d2c
[    0.198858][    T0] RDX: 0000000000000b1e RSI: 0000000000000000 RDI: 000=
0000000000000
[    0.199499][    T0] RBP: 00000000c5a6b597 R08: ffffffff8479d118 R09: 000=
0000000000000
[    0.200142][    T0] R10: 0000000000000004 R11: 0001ffffffffffff R12: 000=
0000027b2cd0a
[    0.200787][    T0] R13: 0000000000000003 R14: 000000004954f68c R15: fff=
fffff83603d54
[    0.201488][    T0] FS:  0000000000000000(0000) GS:ffffffff842c9000(0000=
) knlGS:0000000000000000
[    0.202247][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.202807][    T0] CR2: 0000000000000000 CR3: 000000000360a000 CR4: 000=
00000000406b0
[    0.203470][    T0] Call Trace:
[    0.203748][    T0]  <TASK>
[ 0.203996][ T0] stack_depot_save (kbuild/src/x86_64-2/lib/stackdepot.c:534)
[ 0.204406][ T0] set_track_prepare (kbuild/src/x86_64-2/mm/slub.c:752)
[ 0.204816][ T0] ? memblock_alloc_range_nid (kbuild/src/x86_64-2/mm/membloc=
k.c:1424)
[ 0.205311][ T0] ? memblock_alloc_internal (kbuild/src/x86_64-2/mm/memblock=
.c:1514)
[ 0.205781][ T0] ? memblock_alloc_try_nid (kbuild/src/x86_64-2/mm/memblock.=
c:1614 (discriminator 3))
[ 0.206238][ T0] ? setup_command_line (kbuild/src/x86_64-2/init/main.c:631)
[ 0.206670][ T0] ? start_kernel (kbuild/src/x86_64-2/init/main.c:965)
[ 0.207068][ T0] ? secondary_startup_64_no_verify (kbuild/src/x86_64-2/arch=
/x86/kernel/head_64.S:358)
[ 0.207612][ T0] ? __raw_callee_save___native_queued_spin_unlock (??:?)
[ 0.208251][ T0] ? write_comp_data (kbuild/src/x86_64-2/kernel/kcov.c:236)
[ 0.208678][ T0] ? strncpy (kbuild/src/x86_64-2/lib/string.c:115)
[ 0.209040][ T0] __create_object (kbuild/src/x86_64-2/mm/kmemleak.c:681)
[ 0.209447][ T0] kmemleak_alloc_phys (kbuild/src/x86_64-2/mm/kmemleak.c:121=
2)
[ 0.209867][ T0] memblock_alloc_range_nid (kbuild/src/x86_64-2/mm/memblock.=
c:1424)
[ 0.210344][ T0] memblock_alloc_internal (kbuild/src/x86_64-2/mm/memblock.c=
:1514)
[ 0.210806][ T0] memblock_alloc_try_nid (kbuild/src/x86_64-2/mm/memblock.c:=
1614 (discriminator 3))
[ 0.211255][ T0] setup_command_line (kbuild/src/x86_64-2/init/main.c:631)
[ 0.211678][ T0] start_kernel (kbuild/src/x86_64-2/init/main.c:965)
[ 0.212063][ T0] ? load_ucode_bsp (kbuild/src/x86_64-2/arch/x86/kernel/cpu/=
microcode/core.c:176)
[ 0.212483][ T0] secondary_startup_64_no_verify (kbuild/src/x86_64-2/arch/x=
86/kernel/head_64.S:358)
[    0.212996][    T0]  </TASK>
[    0.213247][    T0] Modules linked in:
[    0.213591][    T0] CR2: 0000000000000000
[    0.213955][    T0] ---[ end trace 0000000000000000 ]---
[ 0.214415][ T0] RIP: 0010:__stack_depot_save (kbuild/src/x86_64-2/lib/stac=
kdepot.c:452)
[ 0.214933][ T0] Code: 03 48 c7 c7 ec 17 b3 84 e8 f1 ea 85 ff 44 89 e0 23 0=
5 d4 aa 01 03 48 8d 04 c3 48 89 c3 48 89 c7 48 89 44 24 28 e8 34 fc 85 ff <=
4c> 8b 33 4d 85 f6 0f 84 b6 00 00 00 8b 04 24 83 e8 01 48 8d 04 c5
All code
=3D=3D=3D=3D=3D=3D=3D=3D
   0:   03 48 c7                add    -0x39(%rax),%ecx
   3:   c7                      (bad)
   4:   ec                      in     (%dx),%al
   5:   17                      (bad)
   6:   b3 84                   mov    $0x84,%bl
   8:   e8 f1 ea 85 ff          callq  0xffffffffff85eafe
   d:   44 89 e0                mov    %r12d,%eax
  10:   23 05 d4 aa 01 03       and    0x301aad4(%rip),%eax        # 0x301a=
aea
  16:   48 8d 04 c3             lea    (%rbx,%rax,8),%rax
  1a:   48 89 c3                mov    %rax,%rbx
  1d:   48 89 c7                mov    %rax,%rdi
  20:   48 89 44 24 28          mov    %rax,0x28(%rsp)
  25:   e8 34 fc 85 ff          callq  0xffffffffff85fc5e
  2a:*  4c 8b 33                mov    (%rbx),%r14              <-- trappin=
g instruction
  2d:   4d 85 f6                test   %r14,%r14
  30:   0f 84 b6 00 00 00       je     0xec
  36:   8b 04 24                mov    (%rsp),%eax
  39:   83 e8 01                sub    $0x1,%eax
  3c:   48                      rex.W
  3d:   8d                      .byte 0x8d
  3e:   04 c5                   add    $0xc5,%al

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   0:   4c 8b 33                mov    (%rbx),%r14
   3:   4d 85 f6                test   %r14,%r14
   6:   0f 84 b6 00 00 00       je     0xc2
   c:   8b 04 24                mov    (%rsp),%eax
   f:   83 e8 01                sub    $0x1,%eax
  12:   48                      rex.W
  13:   8d                      .byte 0x8d
  14:   04 c5                   add    $0xc5,%al


If you fix the issue, kindly add following tag
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Link: https://lore.kernel.org/r/202209301329.8c1446ee-yujie.liu(a)intel.c=
om


To reproduce:

        # build kernel
        cd linux
        cp config-6.0.0-rc3-00706-ga65edf711f97 .config
        make HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Dx86_64 olddefconfig prepare=
 modules_prepare bzImage modules
        make HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Dx86_64 INSTALL_MOD_PATH=3D<=
mod-install-dir> modules_install
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

--===============4560096503245928787==--

