Content-Type: multipart/mixed; boundary="===============6418127718340609914=="
MIME-Version: 1.0
From: Song Liu <songliubraving@fb.com>
To: lkp@lists.01.org
Subject: Re: [x86/Kconfig] fac54e2bfb: kernel_BUG_at_arch/x86/mm/physaddr.c
Date: Wed, 16 Feb 2022 18:16:16 +0000
Message-ID: <087FD6B7-FC82-4868-9A15-F094C2EB7C61@fb.com>
In-Reply-To: <20220216130040.GA14084@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6418127718340609914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+ Nicholas Piggin

> On Feb 16, 2022, at 5:00 AM, kernel test robot <oliver.sang@intel.com> =
wrote:
> =

> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: fac54e2bfb5be2b0bbf115fe80d45f59fd773048 ("x86/Kconfig: Select HA=
VE_ARCH_HUGE_VMALLOC with HAVE_ARCH_HUGE_VMAP")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: boot
> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [   44.587744][    T1] kernel BUG at arch/x86/mm/physaddr.c:76!
> [   44.589159][    T1] invalid opcode: 0000 [#1] SMP PTI
> [   44.590151][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.16.0-1=
1620-gfac54e2bfb5b #1
> [ 44.590151][ T1] EIP: __phys_addr (arch/x86/mm/physaddr.c:76 (discrimina=
tor 1)) =

> [ 44.590151][ T1] Code: 00 8d 76 00 83 05 20 92 8a c5 01 83 15 24 92 8a c=
5 00 89 f0 5b 5e 5d c3 8d 74 26 00 83 05 e0 91 8a c5 01 83 15 e4 91 8a c5 0=
0 <0f> 0b 83 05 e8 91 8a c5 01 83 15 ec 91 8a c5 00 83 05 f0 91 8a c5
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>   0:	00 8d 76 00 83 05    	add    %cl,0x5830076(%rbp)
>   6:	20 92 8a c5 01 83    	and    %dl,-0x7cfe3a76(%rdx)
>   c:	15 24 92 8a c5       	adc    $0xc58a9224,%eax
>  11:	00 89 f0 5b 5e 5d    	add    %cl,0x5d5e5bf0(%rcx)
>  17:	c3                   	retq   =

>  18:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
>  1c:	83 05 e0 91 8a c5 01 	addl   $0x1,-0x3a756e20(%rip)        # 0xfffff=
fffc58a9203
>  23:	83 15 e4 91 8a c5 00 	adcl   $0x0,-0x3a756e1c(%rip)        # 0xfffff=
fffc58a920e
>  2a:*	0f 0b                	ud2    		<-- trapping instruction
>  2c:	83 05 e8 91 8a c5 01 	addl   $0x1,-0x3a756e18(%rip)        # 0xfffff=
fffc58a921b
>  33:	83 15 ec 91 8a c5 00 	adcl   $0x0,-0x3a756e14(%rip)        # 0xfffff=
fffc58a9226
>  3a:	83                   	.byte 0x83
>  3b:	05 f0 91 8a c5       	add    $0xc58a91f0,%eax
> =

> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   0:	0f 0b                	ud2    =

>   2:	83 05 e8 91 8a c5 01 	addl   $0x1,-0x3a756e18(%rip)        # 0xfffff=
fffc58a91f1
>   9:	83 15 ec 91 8a c5 00 	adcl   $0x0,-0x3a756e14(%rip)        # 0xfffff=
fffc58a91fc
>  10:	83                   	.byte 0x83
>  11:	05 f0 91 8a c5       	add    $0xc58a91f0,%eax
> [   44.590151][    T1] EAX: 00000000 EBX: 00000000 ECX: 00000000 EDX: 000=
00000
> [   44.590151][    T1] ESI: f7000000 EDI: f7000000 EBP: c6d85dd8 ESP: c6d=
85db4
> [   44.590151][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAG=
S: 00010246
> [   44.590151][    T1] CR0: 80050033 CR2: ff7ff000 CR3: 05854000 CR4: 000=
406b0
> [   44.590151][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 000=
00000
> [   44.590151][    T1] DR6: fffe0ff0 DR7: 00000400
> [   44.590151][    T1] Call Trace:
> [ 44.590151][ T1] ? vmap_pages_range_noflush (mm/vmalloc.c:594) =

> [ 44.590151][ T1] __vmalloc_area_node (mm/vmalloc.c:622 mm/vmalloc.c:2995=
) =

> [ 44.590151][ T1] ? __get_vm_area_node+0xf5/0x200 =

> [ 44.590151][ T1] __vmalloc_node_range (mm/vmalloc.c:3108) =

> [ 44.590151][ T1] __vmalloc_node (mm/vmalloc.c:3157) =

> [ 44.590151][ T1] ? txInit.cold (fs/jfs/jfs_txnmgr.c:296) =

> [ 44.590151][ T1] vmalloc (mm/vmalloc.c:3190) =

> [ 44.590151][ T1] ? txInit.cold (fs/jfs/jfs_txnmgr.c:296) =

> [ 44.590151][ T1] txInit.cold (fs/jfs/jfs_txnmgr.c:296) =

> [ 44.590151][ T1] ? mempool_free (mm/mempool.c:509) =

> [ 44.590151][ T1] ? mempool_create_node (mm/mempool.c:270) =

> [ 44.590151][ T1] ? mempool_alloc_slab (mm/mempool.c:517) =

> [ 44.590151][ T1] ? init_omfs_fs (fs/jfs/super.c:934) =

> [ 44.590151][ T1] init_jfs_fs (fs/jfs/super.c:959) =

> [ 44.590151][ T1] ? init_omfs_fs (fs/jfs/super.c:934) =

> [ 44.590151][ T1] do_one_initcall (init/main.c:1297) =

> [ 44.590151][ T1] ? rdinit_setup (init/main.c:1354) =

> [ 44.590151][ T1] ? rcu_read_lock_sched_held (include/linux/lockdep.h:283=
 kernel/rcu/update.c:125) =

> [ 44.590151][ T1] do_initcalls (init/main.c:1370 init/main.c:1386) =

> [ 44.590151][ T1] kernel_init_freeable (init/main.c:1405 init/main.c:1610=
) =

> [ 44.590151][ T1] ? rest_init (init/main.c:1491) =

> [ 44.590151][ T1] kernel_init (init/main.c:1499) =

> [ 44.590151][ T1] ret_from_fork (arch/x86/entry/entry_32.S:772) =

> [   44.590151][    T1] Modules linked in:
> [   44.630667][    T1] ---[ end trace 0000000000000000 ]---
> [ 44.631743][ T1] EIP: __phys_addr (arch/x86/mm/physaddr.c:76 (discrimina=
tor 1)) =

> [ 44.632726][ T1] Code: 00 8d 76 00 83 05 20 92 8a c5 01 83 15 24 92 8a c=
5 00 89 f0 5b 5e 5d c3 8d 74 26 00 83 05 e0 91 8a c5 01 83 15 e4 91 8a c5 0=
0 <0f> 0b 83 05 e8 91 8a c5 01 83 15 ec 91 8a c5 00 83 05 f0 91 8a c5
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>   0:	00 8d 76 00 83 05    	add    %cl,0x5830076(%rbp)
>   6:	20 92 8a c5 01 83    	and    %dl,-0x7cfe3a76(%rdx)
>   c:	15 24 92 8a c5       	adc    $0xc58a9224,%eax
>  11:	00 89 f0 5b 5e 5d    	add    %cl,0x5d5e5bf0(%rcx)
>  17:	c3                   	retq   =

>  18:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
>  1c:	83 05 e0 91 8a c5 01 	addl   $0x1,-0x3a756e20(%rip)        # 0xfffff=
fffc58a9203
>  23:	83 15 e4 91 8a c5 00 	adcl   $0x0,-0x3a756e1c(%rip)        # 0xfffff=
fffc58a920e
>  2a:*	0f 0b                	ud2    		<-- trapping instruction
>  2c:	83 05 e8 91 8a c5 01 	addl   $0x1,-0x3a756e18(%rip)        # 0xfffff=
fffc58a921b
>  33:	83 15 ec 91 8a c5 00 	adcl   $0x0,-0x3a756e14(%rip)        # 0xfffff=
fffc58a9226
>  3a:	83                   	.byte 0x83
>  3b:	05 f0 91 8a c5       	add    $0xc58a91f0,%eax
> =

> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   0:	0f 0b                	ud2    =

>   2:	83 05 e8 91 8a c5 01 	addl   $0x1,-0x3a756e18(%rip)        # 0xfffff=
fffc58a91f1
>   9:	83 15 ec 91 8a c5 00 	adcl   $0x0,-0x3a756e14(%rip)        # 0xfffff=
fffc58a91fc
>  10:	83                   	.byte 0x83
>  11:	05 f0 91 8a c5       	add    $0xc58a91f0,%eax


Hi Nicholas,

I guess you know the HAVE_ARCH_HUGE_VMALLOC best. =


In the commit

fac54e2bfb5b ("x86/Kconfig: Select HAVE_ARCH_HUGE_VMALLOC with HAVE_ARCH_HU=
GE_VMAP")

I was trying to enable huge vmalloc for x86. This report shows that
it doesn't really work for 32-bit x86. =


I also confirmed the following change fix it by 32-bit x86 (by =

disabling huge vmalloc). =


Do you think this is something we can easily fix for 32-bit x86?
If not, I guess we should just go ahead disable it for 32-bit x86.

Thanks,
Song


diff --git i/arch/x86/Kconfig w/arch/x86/Kconfig
index 995f2dc28631..0d08c36dfff1 100644
--- i/arch/x86/Kconfig
+++ w/arch/x86/Kconfig
@@ -158,7 +158,7 @@ config X86
        select HAVE_ALIGNED_STRUCT_PAGE         if SLUB
        select HAVE_ARCH_AUDITSYSCALL
        select HAVE_ARCH_HUGE_VMAP              if X86_64 || X86_PAE
-       select HAVE_ARCH_HUGE_VMALLOC           if HAVE_ARCH_HUGE_VMAP
+       select HAVE_ARCH_HUGE_VMALLOC           if X86_64
        select HAVE_ARCH_JUMP_LABEL
        select HAVE_ARCH_JUMP_LABEL_RELATIVE
        select HAVE_ARCH_KASAN                  if X86_64

> =

> =

> To reproduce:
> =

>        # build kernel
> 	cd linux
> 	cp config-5.16.0-11620-gfac54e2bfb5b .config
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare modules_=
prepare bzImage modules
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 INSTALL_MOD_PATH=3D<mod-insta=
ll-dir> modules_install
> 	cd <mod-install-dir>
> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
> =

> =

>        git clone https://github.com/intel/lkp-tests.git
>        cd lkp-tests
>        bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script i=
s attached in this email
> =

>        # if come across any failure that blocks the test,
>        # please remove ~/.lkp and /lkp dir to run from a clean state.
> =

> =

> =

> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org        Intel Corp=
oration
> =

> Thanks,
> Oliver Sang
> =

> <config-5.16.0-11620-gfac54e2bfb5b><job-script.txt><dmesg.xz>

--===============6418127718340609914==--

