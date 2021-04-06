Content-Type: multipart/mixed; boundary="===============5104546756602704350=="
MIME-Version: 1.0
From: Mike Rapoport <rppt@linux.ibm.com>
To: lkp@lists.01.org
Subject: Re: [ACPI] 1a1c130ab7: BUG:kernel_NULL_pointer_dereference, address
Date: Tue, 06 Apr 2021 17:35:06 +0300
Message-ID: <YGxxmkktS4cQjx+z@linux.ibm.com>
In-Reply-To: <20210406045528.GA7352@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5104546756602704350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 06, 2021 at 12:55:28PM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 1a1c130ab7575498eed5bcf7220037ae09cd1f8a ("ACPI: tables: x86: Res=
erve memory occupied by ACPI tables")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> =

> in testcase: trinity
> version: trinity-i386-4d2343bd-1_20200320
> with following parameters:
> =

> 	number: 99999
> 	group: group-00
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +---------------------------------------------------------+-----------+--=
----------+
> |                                                         | v5.12-rc5 | 1=
a1c130ab7 |
> +---------------------------------------------------------+-----------+--=
----------+
> | boot_successes                                          | 16        | 0=
          |
> | BUG:kernel_NULL_pointer_dereference,address             | 0         | 2=
4         |
> | Oops:#[##]                                              | 0         | 2=
4         |
> | EIP:get_pfnblock_flags_mask                             | 0         | 2=
4         |
> | Kernel_panic-not_syncing:Fatal_exception                | 0         | 2=
4         |
> +---------------------------------------------------------+-----------+--=
----------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [    0.136065] BUG: kernel NULL pointer dereference, address: 00000004
> [    0.136596] #PF: supervisor read access in kernel mode
> [    0.137003] #PF: error_code(0x0000) - not-present page
> [    0.137431] *pde =3D 00000000
> [    0.137671] Oops: 0000 [#1]
> [    0.137908] CPU: 0 PID: 0 Comm: swapper Not tainted 5.12.0-rc5-00001-g=
1a1c130ab757 #2
> [    0.138567] EIP: get_pfnblock_flags_mask (kbuild/src/consumer/mm/page_=
alloc.c:490 kbuild/src/consumer/mm/page_alloc.c:504) =

> [ 0.138971] Code: 55 89 e5 83 ec 08 89 5d f8 89 cb 89 d1 89 75 fc c1 ea 0=
e c1 e2 04 8b 82 84 77 95 c2 c1 e9 08 83 e1 3c 89 ce 83 e1 1f c1 ee 05 <8b>=
 04 b0 8b 75 fc d3 e8 21 d8 8b 5d f8 89 ec 5d c3 e8 27 dc e4 ff
> [    0.140504] EAX: 00000000 EBX: 00000007 ECX: 0000001c EDX: 003faaa0
> [    0.141025] ESI: 00000001 EDI: ffffffff EBP: c1c29e18 ESP: c1c29e10
> [    0.141544] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00210=
003
> [    0.142096] CR0: 80050033 CR2: 00000004 CR3: 02226000 CR4: 00040690
> [    0.142620] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
> [    0.143146] DR6: fffe0ff0 DR7: 00000400
> [    0.143473] Call Trace:
> [    0.143698] __dump_page (kbuild/src/consumer/mm/debug.c:66) =

> [    0.143984] ? find_held_lock (kbuild/src/consumer/kernel/locking/lockd=
ep.c:5003) =

> [    0.144300] ? _raw_spin_unlock (kbuild/src/consumer/kernel/locking/spi=
nlock.c:184) =

> [    0.144633] ? console_unlock (kbuild/src/consumer/kernel/printk/printk=
.c:2561) =

> [    0.144960] ? __next_mem_range_rev (kbuild/src/consumer/mm/memblock.c:=
1106) =

> [    0.145339] ? memblock_insert_region+0x2a/0x45 =

> [    0.145762] ? memblock_add_range+0x12d/0x137 =

> [    0.146242] ? memblock_reserve (kbuild/src/consumer/mm/memblock.c:818 =
(discriminator 3)) =

> [    0.146570] ? should_skip_region (kbuild/src/consumer/mm/memblock.c:93=
5) =

> [    0.146905] ? __next_mem_range (kbuild/src/consumer/mm/memblock.c:1002=
) =

> [    0.147245] dump_page (kbuild/src/consumer/arch/x86/include/asm/jump_l=
abel.h:25 kbuild/src/consumer/include/linux/page_owner.h:51 kbuild/src/cons=
umer/mm/debug.c:193) =

> [    0.147536] reserve_bootmem_region (kbuild/src/consumer/include/linux/=
page-flags.h:356 kbuild/src/consumer/mm/page_alloc.c:1528) =

> [    0.147953] memblock_free_all (kbuild/src/consumer/mm/memblock.c:2013 =
kbuild/src/consumer/mm/memblock.c:2061) =

> [    0.148376] ? memblock_alloc_try_nid (kbuild/src/consumer/mm/memblock.=
c:1567 (discriminator 3)) =

> [    0.148857] mem_init (kbuild/src/consumer/arch/x86/mm/init_32.c:756) =

> [    0.149119] start_kernel (kbuild/src/consumer/init/main.c:835 kbuild/s=
rc/consumer/init/main.c:908) =

> [    0.149421] i386_start_kernel (kbuild/src/consumer/arch/x86/kernel/hea=
d32.c:57) =

> [    0.149744] startup_32_smp (kbuild/src/consumer/arch/x86/kernel/head_3=
2.S:328) =

> [    0.150071] Modules linked in:
> [    0.150330] CR2: 0000000000000004
> [    0.150589] random: get_random_bytes called from print_oops_end_marker=
+0x2f/0x50 with crng_init=3D0 =

> [    0.150596] ---[ end trace 0000000000000000 ]---
> [    0.151694] EIP: get_pfnblock_flags_mask (kbuild/src/consumer/mm/page_=
alloc.c:490 kbuild/src/consumer/mm/page_alloc.c:504) =

> [ 0.152069] Code: 55 89 e5 83 ec 08 89 5d f8 89 cb 89 d1 89 75 fc c1 ea 0=
e c1 e2 04 8b 82 84 77 95 c2 c1 e9 08 83 e1 3c 89 ce 83 e1 1f c1 ee 05 <8b>=
 04 b0 8b 75 fc d3 e8 21 d8 8b 5d f8 89 ec 5d c3 e8 27 dc e4 ff

We hit PF_POISONED_CHECK(page) at __SetPageReserved() called from
reserve_bootmem_region().

The machine has 16G of ram, but it runs 32bit kernel with no HIGHMEM, so it
has max_pfn trimmed in highmem_pfn_init(), but the rest of the memory
representation (neither e820 tables nor memblock) are never updated:

[    0.006005] Warning only 495MB will be used.
[    0.006328] Use a HIGHMEM enabled kernel.

So when we get to sparse_init() the sections above 495M are initialized and
pfns in that range are considered valid by the rest of the system.

I believe something along the lines of the patch below should fix this:

diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index da31c2635ee4..a41a64314ce2 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -606,6 +606,7 @@ static void __init lowmem_pfn_init(void)
  */
 static void __init highmem_pfn_init(void)
 {
+	unsigned long orig_max_pfn =3D max_pfn;
 	max_low_pfn =3D MAXMEM_PFN;
 =

 	if (highmem_pages =3D=3D -1)
@@ -636,6 +637,13 @@ static void __init highmem_pfn_init(void)
 	}
 #endif /* !CONFIG_HIGHMEM64G */
 #endif /* !CONFIG_HIGHMEM */
+
+	if (orig_max_pfn > max_pfn) {
+		u64 start =3D PFN_PHYS(max_pfn);
+		u64 size =3D ULLONG_MAX - size;
+
+		e820__range_remove(start, size, E820_TYPE_RAM, 1);
+	}
 }
 =

 /*


-- =

Sincerely yours,
Mike.
--===============5104546756602704350==--

