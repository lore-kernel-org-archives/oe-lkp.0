Content-Type: multipart/mixed; boundary="===============6319070959857930982=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [page_ext] a02a0e703b: Kernel_panic-not_syncing:Out_of_memory
Date: Sun, 21 Aug 2022 01:36:08 -0700
Message-ID: <20220821013608.a130580f9c81bd3b3ebe24db@linux-foundation.org>
In-Reply-To: <YwHmXLu5txij+p35@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6319070959857930982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 21 Aug 2022 16:01:32 +0800 kernel test robot <oliver.sang@intel.c=
om> wrote:

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: a02a0e703b59a6fdd1b8ae50b47396621a03fc1f ("page_ext: move up page=
_ext_init() to catch early page allocation if DEFERRED_STRUCT_PAGE_INIT is =
n")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: boot

Thanks, I dropped the patch.

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +----------------------------------------+------------+------------+
> |                                        | 3be3989b3b | a02a0e703b |
> +----------------------------------------+------------+------------+
> | boot_successes                         | 70         | 0          |
> | boot_failures                          | 0          | 66         |
> | Mem-Info                               | 0          | 66         |
> | Kernel_panic-not_syncing:Out_of_memory | 0          | 66         |
> +----------------------------------------+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [    0.541637][    T0] Memory: 3927672K/4193784K available (11206K kernel=
 code, 4497K rwdata, 3820K rodata, 1008K init, 1332K bss, 266112K reserved,=
 0K
> cma-reserved, 3432328K highmem)
> [    0.545125][    T0] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, C=
PUs=3D2, Nodes=3D1
> [    0.546120][    T0] swapper: vmalloc error: size 7864320, vm_struct al=
location failed, mode:0xdc0(GFP_KERNEL|__GFP_ZERO), nodemask=3D(null),cpuse=
t=3D(nul
> l),mems_allowed=3D0-7
> [    0.548152][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 6.0.0-rc1-=
00121-ga02a0e703b59 #1
> [    0.549286][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
> [    0.550662][    T0] Call Trace:
> [    0.551108][    T0]  ? show_stack+0x3d/0x45
> [    0.551694][    T0]  dump_stack_lvl+0x34/0x44
> [    0.552299][    T0]  dump_stack+0xd/0x10
> [    0.552841][    T0]  warn_alloc.cold+0x55/0xaf
> [    0.553454][    T0]  __vmalloc_node_range+0x87/0x140
> [    0.554139][    T0]  vzalloc_node+0x64/0x80
> [    0.554716][    T0]  ? _page_ext_init+0x119/0x1e7
> [    0.555382][    T0]  _page_ext_init+0x119/0x1e7
> [    0.556010][    T0]  start_kernel+0x213/0x49a
> [    0.556615][    T0]  ? early_idt_handler_common+0x44/0x44
> [    0.557358][    T0]  i386_start_kernel+0x48/0x4a
> [    0.557995][    T0]  startup_32_smp+0x161/0x164
> [    0.558622][    T0] Mem-Info:
> [    0.559039][    T0] active_anon:0 inactive_anon:0 isolated_anon:0
> [    0.559039][    T0]  active_file:0 inactive_file:0 isolated_file:0
> [    0.559039][    T0]  unevictable:0 dirty:0 writeback:0
> [    0.559039][    T0]  slab_reclaimable:0 slab_unreclaimable:25
> [    0.559039][    T0]  mapped:0 shmem:0 pagetables:0 bounce:0
> [    0.559039][    T0]  kernel_misc_reclaimable:0
> [    0.559039][    T0]  free:981893 free_pcp:0 free_cma:0
> [    0.564216][    T0] Node 0 active_anon:0kB inactive_anon:0kB active_fi=
le:0kB inactive_file:0kB unevictable:0kB isolated(anon):0kB isolated(file):=
0kB mapped:0kB dirty:0kB writeback:0kB shmem:0kB shmem_thp: 0kB shmem_pmdma=
pped: 0kB anon_thp: 0kB writeback_tmp:0kB kernel_stack:0kB pagetables:0kB a=
ll_unreclaimable? no
> [    0.567976][    T0] Node 0 DMA free:15360kB boost:0kB min:0kB low:0kB =
high:0kB reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_f=
ile:0kB inactive_file:0kB unevictable:0kB writepending:0kB present:15992kB =
managed:15360kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
> [    0.571575][    T0] lowmem_reserve[]: 0 0 0 0
> [    0.572172][    T0] Node 0 Normal free:479884kB boost:0kB min:0kB low:=
0kB high:0kB reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB acti=
ve_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB present:7454=
64kB managed:479984kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB fre=
e_cma:0kB
> [    0.575803][    T0] lowmem_reserve[]: 0 0 0 0
> [    0.576395][    T0] Node 0 HighMem free:3432328kB boost:0kB min:0kB lo=
w:0kB high:0kB reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB ac=
tive_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB present:34=
32328kB managed:3432328kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB=
 free_cma:0kB
> [    0.580081][    T0] lowmem_reserve[]: 0 0 0 0
> [    0.580668][    T0] Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128=
kB 0*256kB 0*512kB 1*1024kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
> [    0.582377][    T0] Node 0 Normal: 3*4kB (UM) 2*8kB (UM) 1*16kB (U) 1*=
32kB (M) 1*64kB (M) 2*128kB (UM) 3*256kB (UM) 1*512kB (U) 1*1024kB (U) 3*20=
48kB (UM) 115*4096kB (M) =3D 479884kB
> [    0.584609][    T0] Node 0 HighMem: 0*4kB 1*8kB (M) 0*16kB 0*32kB 0*64=
kB 1*128kB (M) 1*256kB (M) 1*512kB (M) 1*1024kB (M) 1*2048kB (M) 837*4096kB=
 (M) =3D 3432328kB
> [    0.586543][    T0] 0 total pagecache pages
> [    0.587121][    T0] 0 pages in swap cache
> [    0.587680][    T0] Free swap  =3D 0kB
> [    0.588170][    T0] Total swap =3D 0kB
> [    0.588664][    T0] 1048446 pages RAM
> [    0.589165][    T0] 858082 pages HighMem/MovableOnly
> [    0.589850][    T0] 66528 pages reserved
> [    0.590394][    T0] 0 pages cma reserved
> [    0.590947][    T0] page ext allocation failure
> [    0.591574][    T0] Kernel panic - not syncing: Out of memory
> [    0.592360][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 6.0.0-rc1-=
00121-ga02a0e703b59 #1
> [    0.593520][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
> [    0.594937][    T0] Call Trace:
> [    0.595370][    T0]  ? show_stack+0x3d/0x45
> [    0.595952][    T0]  dump_stack_lvl+0x34/0x44
> [    0.596560][    T0]  dump_stack+0xd/0x10
> [    0.597098][    T0]  panic+0xdd/0x251
> [    0.597602][    T0]  _page_ext_init+0x131/0x1e7
> [    0.598223][    T0]  start_kernel+0x213/0x49a
> [    0.598830][    T0]  ? early_idt_handler_common+0x44/0x44
> [    0.599530][    T0]  i386_start_kernel+0x48/0x4a
> [    0.600152][    T0]  startup_32_smp+0x161/0x164
> =

> =

> =

> To reproduce:
> =

>         # build kernel
> 	cd linux
> 	cp config-6.0.0-rc1-00121-ga02a0e703b59 .config
> 	make HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Di386 olddefconfig prepare module=
s_prepare bzImage modules
> 	make HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Di386 INSTALL_MOD_PATH=3D<mod-ins=
tall-dir> modules_install
> 	cd <mod-install-dir>
> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
> =

> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script =
is attached in this email
> =

>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
> =

> =

> =

> -- =

> 0-DAY CI Kernel Test Service
> https://01.org/lkp
> =

>=20
--===============6319070959857930982==--

