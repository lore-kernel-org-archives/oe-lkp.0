Content-Type: multipart/mixed; boundary="===============7969385050695197432=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: 2f47e7e19f ("x86/mm/kaiser: Use PCID feature to make user and .."): WARNING: CPU: 0 PID: 1 at mm/early_ioremap.c:114 __early_ioremap
Date: Mon, 27 Nov 2017 11:18:14 +0100
Message-ID: <20171127101814.jsglrh7typy3pxxp@gmail.com>
In-Reply-To: <5a1aaa36.CWNgvwmmRFzeAlPc%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7969385050695197432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Dave,

Any ideas about this bug?

Thanks,

	Ingo

* kernel test robot <fengguang.wu@intel.com> wrote:

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.x86/mm
> =

> commit 2f47e7e19f351692bc8048a0e6f3960dc6734cfd
> Author:     Dave Hansen <dave.hansen@linux.intel.com>
> AuthorDate: Wed Nov 22 16:35:09 2017 -0800
> Commit:     Ingo Molnar <mingo@kernel.org>
> CommitDate: Fri Nov 24 14:47:24 2017 +0100
> =

>     x86/mm/kaiser: Use PCID feature to make user and kernel switches fast=
er
>     =

>     Short summary: Use x86 PCID feature to avoid flushing the TLB at all
>     interrupts and syscalls.  Speed them up.  Makes context switches
>     and TLB flushing slower.
>     =

>     Background:
>     =

>     KAISER keeps two copies of the page tables.  Switches between the
>     copies are performed by writing to the CR3 register.  But, CR3
>     was really designed for context switches and writes to it also
>     flush the entire TLB (modulo global pages).  This TLB flush
>     increases the cost of interrupts and context switches.  For
>     syscall-heavy microbenchmarks it can cut the rate of syscalls by
>     2/3.
>     =

>     The kernel recently gained support for and Intel CPU feature
>     called Process Context IDentifiers (PCID) thanks to Andy
>     Lutomirski.  This feature is intended to allow you to switch
>     between contexts without flushing the TLB.
>     =

>     Implementation:
>     =

>     PCIDs can be used to avoid flushing the TLB at kernel entry/exit.
>     This is speeds up both interrupts and syscalls.
>     =

>     First, the kernel and userspace must be assigned different ASIDs.
>     On entry from userspace, move over to the kernel page tables
>     *and* ASID.  On exit, restore the user page tables and ASID.
>     Fortunately, the ASID is programmed via CR3, which is already
>     being used to switch between the user and kernel page tables.
>     This gives us convenient, one-stop shopping.
>     =

>     The CR3 write which is used to switch between processes provides
>     all the TLB flushing normally required at context switch time.
>     But, with KAISER, that CR3 write only flushes the current
>     (kernel) ASID.  An extra TLB flush operation is now required in
>     order to flush the user ASID.  This new instruction (INVPCID) is
>     probably ~100 cycles, but this is done with the assumption that
>     the time lost in context switches is more than made up for by
>     lower cost of interrupts and syscalls.
>     =

>     Support:
>     =

>     PCIDs are generally available on Sandybridge and newer CPUs.  However,
>     the accompanying INVPCID instruction did not become available until
>     Haswell (the ones with "v4", or called fourth-generation Core).  This
>     instruction allows non-current-PCID TLB entries to be flushed without
>     switching CR3 and global pages to be flushed without a double
>     MOV-to-CR4.
>     =

>     Without INVPCID, PCIDs are much harder to use.  TLB invalidation gets
>     much more onerous:
>     =

>     1. Every kernel TLB flush (even for a single page) requires an
>        interrupts-off MOV-to-CR4 which is very expensive.  This is because
>        there is no way to flush a kernel address that might be loaded
>        in *EVERY* PCID.  Right now, there are "only" ~12 of these per-cpu,
>        but that's too painful to use the MOV-to-CR3 to flush them.  That
>        leaves only the MOV-to-CR4.
>     2. Every userspace flush (even for a single page requires one of the
>        following:
>        a. A pair of flushing (bit 63 clear) CR3 writes: one for
>           the kernel ASID and another for userspace.
>        b. A pair of non-flushing CR3 writes (bit 63 set) with the
>           flush done for each.  For instance, what is currently a
>           single instruction without KAISER:
>     =

>                     invpcid_flush_one(current_pcid, addr);
>     =

>           becomes this with KAISER:
>     =

>                     invpcid_flush_one(current_kern_pcid, addr);
>                     invpcid_flush_one(current_user_pcid, addr);
>     =

>           and this without INVPCID:
>     =

>                     __native_flush_tlb_single(addr);
>                     write_cr3(mm->pgd | current_user_pcid | NOFLUSH);
>                     __native_flush_tlb_single(addr);
>                     write_cr3(mm->pgd | current_kern_pcid | NOFLUSH);
>     =

>     So, for now, fully disable PCIDs with KAISER when INVPCID is not
>     available.  This is fixable, but it's an optimization that can be
>     performed later.
>     =

>     Hugh Dickins also points out that PCIDs really have two distinct
>     use-cases in the context of KAISER.  The first way they can be used
>     is as "TLB preservation across context-switch", which is what
>     Andy Lutomirksi's 4.14 PCID code does.  They can also be used as
>     a "KAISER syscall/interrupt accelerator".  If we just use them to
>     speed up syscall/interrupts (and ignore the context-switch TLB
>     preservation), then the deficiency of not having INVPCID
>     becomes much less onerous.
>     =

>     Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
>     Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>     Cc: Linus Torvalds <torvalds@linux-foundation.org>
>     Cc: Peter Zijlstra <peterz@infradead.org>
>     Cc: daniel.gruss(a)iaik.tugraz.at
>     Cc: hughd(a)google.com
>     Cc: keescook(a)google.com
>     Cc: linux-mm(a)kvack.org
>     Cc: luto(a)kernel.org
>     Cc: michael.schwarz(a)iaik.tugraz.at
>     Cc: moritz.lipp(a)iaik.tugraz.at
>     Cc: richard.fellner(a)student.tugraz.at
>     Link: https://lkml.kernel.org/r/20171123003509.EC42DD15(a)viggo.jf.in=
tel.com
>     Signed-off-by: Ingo Molnar <mingo@kernel.org>
> =

> 41492416f4  x86/mm/kaiser: Allow flushing for future ASID switches
> 2f47e7e19f  x86/mm/kaiser: Use PCID feature to make user and kernel switc=
hes faster
> a606c92732  Fix: "x86/mm/kaiser: Unmap kernel from userspace page tables =
(core patch)"
> 4b0560b639  Merge branch 'WIP.x86/mm'
> +-------------------------------------------------------+------------+---=
---------+------------+------------+
> |                                                       | 41492416f4 | 2f=
47e7e19f | a606c92732 | 4b0560b639 |
> +-------------------------------------------------------+------------+---=
---------+------------+------------+
> | boot_successes                                        | 32         | 0 =
         | 4          | 4          |
> | boot_failures                                         | 4          | 15=
         | 12         | 12         |
> | WARNING:at_drivers/pci/pci-sysfs.c:#pci_mmap_resource | 4          | 3 =
         | 0          | 2          |
> | RIP:pci_mmap_resource                                 | 4          | 3 =
         | 0          | 2          |
> | BUG:kernel_hang_in_test_stage                         | 0          | 3 =
         |            |            |
> | WARNING:at_mm/early_ioremap.c:#__early_ioremap        | 0          | 10=
         | 9          | 10         |
> | RIP:__early_ioremap                                   | 0          | 10=
         | 9          | 10         |
> | kernel_BUG_at_arch/x86/kernel/mpparse.c               | 0          | 1 =
         | 3          | 2          |
> | PANIC:early_exception                                 | 0          | 1 =
         | 3          | 2          |
> | RIP:default_get_smp_config                            | 0          | 1 =
         | 3          | 2          |
> | BUG:kernel_hang_in_boot_stage                         | 0          | 1 =
         |            |            |
> +-------------------------------------------------------+------------+---=
---------+------------+------------+
> =

> [    0.026886] pinctrl core: initialized pinctrl subsystem
> [    0.027309] regulator-dummy: no parameters
> [    0.028260] NET: Registered protocol family 16
> [    0.029939] cpuidle: using governor ladder
> [    0.030048] ------------[ cut here ]------------
> [    0.030613] WARNING: CPU: 0 PID: 1 at mm/early_ioremap.c:114 __early_i=
oremap+0x2d/0x223
> [    0.031000] CPU: 0 PID: 1 Comm: swapper Not tainted 4.14.0-01247-g2f47=
e7e #1
> [    0.031000] task: ffff88000002a000 task.stack: ffffc90000000000
> [    0.031000] RIP: 0010:__early_ioremap+0x2d/0x223
> [    0.031000] RSP: 0000:ffffc90000003dd8 EFLAGS: 00010202
> [    0.031000] RAX: 8000000000000163 RBX: 000000000000040e RCX: 000000000=
0000002
> [    0.031000] RDX: 8000000000000163 RSI: 0000000000000002 RDI: 000000000=
000040e
> [    0.031000] RBP: 0000000000000002 R08: 0000000000000001 R09: 000000000=
0000000
> [    0.031000] R10: 0000000000000000 R11: 000000009279605b R12: 000000000=
000040e
> [    0.031000] R13: cccccccccccccccd R14: 0000000000000000 R15: 000000000=
0000000
> [    0.031000] FS:  0000000000000000(0000) GS:ffffffff82ca4000(0000) knlG=
S:0000000000000000
> [    0.031000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.031000] CR2: 0000000000000000 CR3: 0000000002c5d001 CR4: 000000000=
01606f0
> [    0.031000] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [    0.031000] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [    0.031000] Call Trace:
> [    0.031000]  ? kernfs_add_one+0x1d9/0x1f0
> [    0.031000]  early_memremap+0x33/0x3d
> [    0.031000]  ? cnb20le_res+0x2f2/0x2f2
> [    0.031000]  __acpi_map_table+0x1d/0x28
> [    0.031000]  acpi_os_map_iomem+0x1cf/0x2a0
> [    0.031000]  ? cnb20le_res+0x2f2/0x2f2
> [    0.031000]  acpi_os_map_memory+0xd/0x20
> [    0.031000]  acpi_find_root_pointer+0x1f/0x1ec
> [    0.031000]  ? cnb20le_res+0x2f2/0x2f2
> [    0.031000]  acpi_os_get_root_pointer+0x18/0x25
> [    0.031000]  broadcom_postcore_init+0xc/0x6c
> [    0.031000]  do_one_initcall+0xc4/0x1f7
> [    0.031000]  kernel_init_freeable+0x1c2/0x2b2
> [    0.031000]  ? rest_init+0x1a0/0x1a0
> [    0.031000]  kernel_init+0xd/0x1bc
> [    0.031000]  ret_from_fork+0x1f/0x30
> [    0.031000] Code: 41 56 48 89 f1 41 55 41 54 55 53 48 83 ec 18 48 ff 0=
5 bd 86 bd 00 83 3d 7a 68 aa ff 00 48 89 54 24 08 74 09 48 ff 05 b0 86 bd 0=
0 <0f> ff 48 ff 05 af 86 bd 00 31 d2 48 8b 04 d5 80 7f 91 83 41 89 =

> [    0.031000] ---[ end trace 3959ffc51c8abd55 ]---
> [    0.031029] ------------[ cut here ]------------
> [    0.031029] ------------[ cut here ]------------
> [    0.031555] WARNING: CPU: 0 PID: 1 at mm/early_ioremap.c:114 __early_i=
oremap+0x2d/0x223
> [    0.032000] CPU: 0 PID: 1 Comm: swapper Tainted: G        W       4.14=
.0-01247-g2f47e7e #1
> [    0.032000] task: ffff88000002a000 task.stack: ffffc90000000000
> [    0.032000] RIP: 0010:__early_ioremap+0x2d/0x223
> [    0.032000] RSP: 0000:ffffc90000003dd8 EFLAGS: 00010202
> [    0.032000] RAX: 8000000000000163 RBX: 000000000009fc00 RCX: 000000000=
0000400
> [    0.032000] RDX: 8000000000000163 RSI: 0000000000000400 RDI: 000000000=
009fc00
> [    0.032000] RBP: 0000000000000400 R08: 0000000000000002 R09: 000000000=
0000000
> [    0.032000] R10: 0000000000000000 R11: 000000009279605b R12: 000000000=
009fc00
> [    0.032000] R13: cccccccccccccccd R14: 0000000000000000 R15: 000000000=
0000000
> [    0.032000] FS:  0000000000000000(0000) GS:ffffffff82ca4000(0000) knlG=
S:0000000000000000
> [    0.032000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.032000] CR2: 0000000000000000 CR3: 0000000002c5d001 CR4: 000000000=
01606f0
> [    0.032000] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [    0.032000] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [    0.032000] Call Trace:
> [    0.032000]  early_memremap+0x33/0x3d
> [    0.032000]  __acpi_map_table+0x1d/0x28
> [    0.032000]  acpi_os_map_iomem+0x1cf/0x2a0
> [    0.032000]  acpi_os_map_memory+0xd/0x20
> [    0.032000]  acpi_find_root_pointer+0x9a/0x1ec
> [    0.032000]  ? cnb20le_res+0x2f2/0x2f2
> [    0.032000]  acpi_os_get_root_pointer+0x18/0x25
> [    0.032000]  broadcom_postcore_init+0xc/0x6c
> [    0.032000]  do_one_initcall+0xc4/0x1f7
> [    0.032000]  kernel_init_freeable+0x1c2/0x2b2
> [    0.032000]  ? rest_init+0x1a0/0x1a0
> [    0.032000]  kernel_init+0xd/0x1bc
> [    0.032000]  ret_from_fork+0x1f/0x30
> [    0.032000] Code: 41 56 48 89 f1 41 55 41 54 55 53 48 83 ec 18 48 ff 0=
5 bd 86 bd 00 83 3d 7a 68 aa ff 00 48 89 54 24 08 74 09 48 ff 05 b0 86 bd 0=
0 <0f> ff 48 ff 05 af 86 bd 00 31 d2 48 8b 04 d5 80 7f 91 83 41 89 =

> [    0.032000] ---[ end trace 3959ffc51c8abd56 ]---
> [    0.032038] ------------[ cut here ]------------
> [    0.032038] ------------[ cut here ]------------
> [    0.032588] WARNING: CPU: 0 PID: 1 at mm/early_ioremap.c:114 __early_i=
oremap+0x2d/0x223
> [    0.033000] CPU: 0 PID: 1 Comm: swapper Tainted: G        W       4.14=
.0-01247-g2f47e7e #1
> [    0.033000] task: ffff88000002a000 task.stack: ffffc90000000000
> [    0.033000] RIP: 0010:__early_ioremap+0x2d/0x223
> [    0.033000] RSP: 0000:ffffc90000003dd8 EFLAGS: 00010206
> [    0.033000] RAX: 8000000000000163 RBX: 00000000000e0000 RCX: 000000000=
0020000
> [    0.033000] RDX: 8000000000000163 RSI: 0000000000020000 RDI: 000000000=
00e0000
> [    0.033000] RBP: 0000000000020000 R08: 0000000000000400 R09: 000000000=
0000000
> [    0.033000] R10: 0000000000000052 R11: 000000009279605b R12: 000000000=
00e0000
> [    0.033000] R13: ffffffffff200c00 R14: 0000000000000000 R15: 000000000=
0000000
> [    0.033000] FS:  0000000000000000(0000) GS:ffffffff82ca4000(0000) knlG=
S:0000000000000000
> [    0.033000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.033000] CR2: 0000000000000000 CR3: 0000000002c5d001 CR4: 000000000=
01606f0
> [    0.033000] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [    0.033000] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [    0.033000] Call Trace:
> [    0.033000]  early_memremap+0x33/0x3d
> [    0.033000]  __acpi_map_table+0x1d/0x28
> [    0.033000]  acpi_os_map_iomem+0x1cf/0x2a0
> [    0.033000]  acpi_os_map_memory+0xd/0x20
> [    0.033000]  acpi_find_root_pointer+0x132/0x1ec
> [    0.033000]  ? cnb20le_res+0x2f2/0x2f2
> [    0.033000]  acpi_os_get_root_pointer+0x18/0x25
> [    0.033000]  broadcom_postcore_init+0xc/0x6c
> [    0.033000]  do_one_initcall+0xc4/0x1f7
> [    0.033000]  kernel_init_freeable+0x1c2/0x2b2
> [    0.033000]  ? rest_init+0x1a0/0x1a0
> [    0.033000]  kernel_init+0xd/0x1bc
> [    0.033000]  ret_from_fork+0x1f/0x30
> [    0.033000] Code: 41 56 48 89 f1 41 55 41 54 55 53 48 83 ec 18 48 ff 0=
5 bd 86 bd 00 83 3d 7a 68 aa ff 00 48 89 54 24 08 74 09 48 ff 05 b0 86 bd 0=
0 <0f> ff 48 ff 05 af 86 bd 00 31 d2 48 8b 04 d5 80 7f 91 83 41 89 =

> [    0.033000] ---[ end trace 3959ffc51c8abd57 ]---
> [    0.033873] PCI: Using configuration type 1 for base access
> =

>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start e407bc20c82ec3d644f03148179ad62ef1eded07 bebc6082da0a9f5=
d47a1ea2edc099bf671058bd4 --
> git bisect  bad a0c6abbabf34cb7b4c97e2e368f089e6e3c0f3fa  # 08:02  B     =
 0     8   21   0  Merge 'linux-review/Shannon-Nelson/xfrm-add-documentatio=
n-for-xfrm-device-offload-api/20171121-183400' into devel-hourly-2017112520
> git bisect  bad 05626bec547df3e1ea91810fe8cc40eaa49e9a0a  # 08:39  B     =
 3     8    3   3  Merge 'linux-review/Johan-Hovold/USB-chipidea-msm-fix-ul=
pi-node-lookup/20171116-063432' into devel-hourly-2017112520
> git bisect  bad fb0b88166f094f3f77108c1e9a2e2fcd9c4d3b4a  # 10:50  B     =
 2     1    2   3  Merge 'linux-review/Jesse-Chan/phy-qcom-ufs-add-missing-=
MODULE_DESCRIPTION-LICENSE/20171122-005904' into devel-hourly-2017112520
> git bisect  bad a520eb1857b691f3909377d4e72bc19760bb6689  # 11:40  B     =
 0     9   22   0  Merge 'uml/linux-next' into devel-hourly-2017112520
> git bisect  bad e683d1330e1bb163f945969baa9691b954c88538  # 12:02  B     =
 0     3   16   0  Merge 'linux-review/Jesse-Chan/mtd-nand-denali_pci-add-m=
issing-MODULE_DESCRIPTION-AUTHOR-LICENSE/20171121-221924' into devel-hourly=
-2017112520
> git bisect good 8686ffa141fb8e0520214198c8494907e00bdef5  # 12:32  G     =
12     0    1   1  Merge 'linux-review/Michal-Hocko/xfs-handle-register_shr=
inker-error/20171125-164820' into devel-hourly-2017112520
> git bisect good 1d28afe4fd6c4c77c34e8a6acc5c12b4a4ca40f4  # 13:03  G     =
12     0    0   0  Merge 'andersson-remoteproc/rproc-next' into devel-hourl=
y-2017112520
> git bisect  bad 2b18f915d6386c043ef49284cc6cfd0fb0b9f5ba  # 13:45  B     =
 0     2   15   0  Merge 'tip/master' into devel-hourly-2017112520
> git bisect good f2be8bd52e7410c70145f73511a2e80f4797e1a5  # 14:20  G     =
12     0    1   1  Merge branch 'ras-core-for-linus' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/tip/tip
> git bisect good 2bcc673101268dc50e52b83226c5bbf38391e16d  # 14:56  G     =
12     0    0   0  Merge branch 'timers-core-for-linus' of git://git.kernel=
.org/pub/scm/linux/kernel/git/tip/tip
> git bisect  bad a606c927321e1d58d02eb16787550d2f3ae4c8a2  # 15:16  B     =
 2     4    2   2  Fix: "x86/mm/kaiser: Unmap kernel from userspace page ta=
bles (core patch)"
> git bisect good 3643b7e05b16a9fc4077ec56b655a1f8547d259c  # 15:39  G     =
12     0    1   1  Merge branch 'x86-cache-for-linus' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/tip/tip
> git bisect good 48bb67c264d721142d32fa3da9a17e4e11c18d41  # 16:08  G     =
11     0    2   2  x86/asm: Fix assumptions that the HW TSS is at the begin=
ning of cpu_tss
> git bisect good aaf4ad10f1d60618459e9d8b5257e48440c4dec4  # 16:56  G     =
12     0    2   2  x86/mm/kaiser: Make sure static PGDs are 8k in size
> git bisect  bad 2f47e7e19f351692bc8048a0e6f3960dc6734cfd  # 17:17  B     =
 1    10    1   1  x86/mm/kaiser: Use PCID feature to make user and kernel =
switches faster
> git bisect good e332b7a62359fe95fc61eba443d8ab1e9099514c  # 17:37  G     =
12     0    0   0  x86/mm/kaiser: Map virtually-addressed performance monit=
oring buffers
> git bisect good 7f3a99b7858cbfb41ddb76bea842768a05458774  # 18:15  G     =
12     0    0   0  x86/mm: Remove hard-coded ASID limit checks
> git bisect good 41492416f44b01574b4dd5da69daabb14e35a6f6  # 18:40  G     =
12     0    1   1  x86/mm/kaiser: Allow flushing for future ASID switches
> # first bad commit: [2f47e7e19f351692bc8048a0e6f3960dc6734cfd] x86/mm/kai=
ser: Use PCID feature to make user and kernel switches faster
> git bisect good 41492416f44b01574b4dd5da69daabb14e35a6f6  # 18:45  G     =
35     0    3   4  x86/mm/kaiser: Allow flushing for future ASID switches
> # extra tests with debug options
> git bisect  bad 2f47e7e19f351692bc8048a0e6f3960dc6734cfd  # 18:58  B     =
 0    11   24   0  x86/mm/kaiser: Use PCID feature to make user and kernel =
switches faster
> # extra tests on HEAD of linux-devel/devel-hourly-2017112520
> git bisect  bad e407bc20c82ec3d644f03148179ad62ef1eded07  # 18:58  B     =
 1   288    0  53  0day head guard for 'devel-hourly-2017112520'
> # extra tests on tree/branch tip/WIP.x86/mm
> git bisect  bad a606c927321e1d58d02eb16787550d2f3ae4c8a2  # 19:03  B     =
 0     9   26   3  Fix: "x86/mm/kaiser: Unmap kernel from userspace page ta=
bles (core patch)"
> # extra tests with first bad commit reverted
> git bisect good f9902ab9b24734c21dcd528d692a3b4e4f683877  # 19:27  G     =
12     0    2   2  Revert "x86/mm/kaiser: Use PCID feature to make user and=
 kernel switches faster"
> # extra tests on tree/branch tip/master
> git bisect  bad 4b0560b639decf934c503b8d85098ab9b501e8bc  # 19:41  B     =
 2     5    2   2  Merge branch 'WIP.x86/mm'
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion



> #!/bin/bash
> =

> kernel=3D$1
> initrd=3Dyocto-trinity-x86_64.cgz
> =

> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/yocto/$initrd
> =

> kvm=3D(
> 	qemu-system-x86_64
> 	-enable-kvm
> 	-cpu Haswell,+smep
> 	-kernel $kernel
> 	-initrd $initrd
> 	-m 512
> 	-smp 1
> 	-device e1000,netdev=3Dnet0
> 	-netdev user,id=3Dnet0
> 	-boot order=3Dnc
> 	-no-reboot
> 	-watchdog i6300esb
> 	-watchdog-action debug
> 	-rtc base=3Dlocaltime
> 	-serial stdio
> 	-display none
> 	-monitor null
> )
> =

> append=3D(
> 	root=3D/dev/ram0
> 	hung_task_panic=3D1
> 	debug
> 	apic=3Ddebug
> 	sysrq_always_enabled
> 	rcupdate.rcu_cpu_stall_timeout=3D100
> 	net.ifnames=3D0
> 	printk.devkmsg=3Don
> 	panic=3D-1
> 	softlockup_panic=3D1
> 	nmi_watchdog=3Dpanic
> 	oops=3Dpanic
> 	load_ramdisk=3D2
> 	prompt_ramdisk=3D0
> 	drbd.minor_count=3D8
> 	systemd.log_level=3Derr
> 	ignore_loglevel
> 	console=3Dtty0
> 	earlyprintk=3DttyS0,115200
> 	console=3DttyS0,115200
> 	vga=3Dnormal
> 	rw
> 	drbd.minor_count=3D8
> )
> =

> "${kvm[@]}" -append "${append[*]}"

> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 4.14.0 Kernel Configuration
> #
> CONFIG_64BIT=3Dy
> CONFIG_X86_64=3Dy
> CONFIG_X86=3Dy
> CONFIG_INSTRUCTION_DECODER=3Dy
> CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
> CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/x86_64_defconfig"
> CONFIG_LOCKDEP_SUPPORT=3Dy
> CONFIG_STACKTRACE_SUPPORT=3Dy
> CONFIG_MMU=3Dy
> CONFIG_ARCH_MMAP_RND_BITS_MIN=3D28
> CONFIG_ARCH_MMAP_RND_BITS_MAX=3D32
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> CONFIG_NEED_DMA_MAP_STATE=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
> CONFIG_GENERIC_HWEIGHT=3Dy
> CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
> CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> CONFIG_ZONE_DMA32=3Dy
> CONFIG_AUDIT_ARCH=3Dy
> CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_HAVE_INTEL_TXT=3Dy
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_PGTABLE_LEVELS=3D4
> CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
> CONFIG_CONSTRUCTORS=3Dy
> CONFIG_IRQ_WORK=3Dy
> CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
> CONFIG_THREAD_INFO_IN_TASK=3Dy
> =

> #
> # General setup
> #
> CONFIG_BROKEN_ON_SMP=3Dy
> CONFIG_INIT_ENV_ARG_LIMIT=3D32
> CONFIG_CROSS_COMPILE=3D""
> # CONFIG_COMPILE_TEST is not set
> CONFIG_LOCALVERSION=3D""
> CONFIG_LOCALVERSION_AUTO=3Dy
> CONFIG_HAVE_KERNEL_GZIP=3Dy
> CONFIG_HAVE_KERNEL_BZIP2=3Dy
> CONFIG_HAVE_KERNEL_LZMA=3Dy
> CONFIG_HAVE_KERNEL_XZ=3Dy
> CONFIG_HAVE_KERNEL_LZO=3Dy
> CONFIG_HAVE_KERNEL_LZ4=3Dy
> # CONFIG_KERNEL_GZIP is not set
> # CONFIG_KERNEL_BZIP2 is not set
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> CONFIG_KERNEL_LZO=3Dy
> # CONFIG_KERNEL_LZ4 is not set
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> # CONFIG_SWAP is not set
> CONFIG_SYSVIPC=3Dy
> CONFIG_SYSVIPC_SYSCTL=3Dy
> # CONFIG_POSIX_MQUEUE is not set
> # CONFIG_CROSS_MEMORY_ATTACH is not set
> CONFIG_FHANDLE=3Dy
> CONFIG_USELIB=3Dy
> # CONFIG_AUDIT is not set
> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> =

> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=3Dy
> CONFIG_GENERIC_IRQ_SHOW=3Dy
> CONFIG_GENERIC_IRQ_CHIP=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> CONFIG_GENERIC_MSI_IRQ=3Dy
> CONFIG_GENERIC_MSI_IRQ_DOMAIN=3Dy
> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> CONFIG_IRQ_DOMAIN_DEBUG=3Dy
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> CONFIG_GENERIC_IRQ_DEBUGFS=3Dy
> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> CONFIG_GENERIC_CLOCKEVENTS=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> CONFIG_GENERIC_CMOS_UPDATE=3Dy
> =

> #
> # Timers subsystem
> #
> CONFIG_HZ_PERIODIC=3Dy
> # CONFIG_NO_HZ_IDLE is not set
> # CONFIG_NO_HZ is not set
> # CONFIG_HIGH_RES_TIMERS is not set
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=3Dy
> # CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
> # CONFIG_IRQ_TIME_ACCOUNTING is not set
> # CONFIG_BSD_PROCESS_ACCT is not set
> # CONFIG_TASKSTATS is not set
> # CONFIG_CPU_ISOLATION is not set
> =

> #
> # RCU Subsystem
> #
> CONFIG_TINY_RCU=3Dy
> CONFIG_RCU_EXPERT=3Dy
> CONFIG_SRCU=3Dy
> CONFIG_TINY_SRCU=3Dy
> CONFIG_TASKS_RCU=3Dy
> # CONFIG_RCU_STALL_COMMON is not set
> # CONFIG_RCU_NEED_SEGCBLIST is not set
> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> CONFIG_LOG_BUF_SHIFT=3D20
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_ARCH_SUPPORTS_INT128=3Dy
> CONFIG_CGROUPS=3Dy
> CONFIG_PAGE_COUNTER=3Dy
> CONFIG_MEMCG=3Dy
> # CONFIG_BLK_CGROUP is not set
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> # CONFIG_CFS_BANDWIDTH is not set
> CONFIG_RT_GROUP_SCHED=3Dy
> # CONFIG_CGROUP_PIDS is not set
> CONFIG_CGROUP_RDMA=3Dy
> CONFIG_CGROUP_FREEZER=3Dy
> CONFIG_CGROUP_HUGETLB=3Dy
> CONFIG_CGROUP_DEVICE=3Dy
> # CONFIG_CGROUP_CPUACCT is not set
> CONFIG_CGROUP_PERF=3Dy
> # CONFIG_CGROUP_BPF is not set
> CONFIG_CGROUP_DEBUG=3Dy
> # CONFIG_SOCK_CGROUP_DATA is not set
> CONFIG_CHECKPOINT_RESTORE=3Dy
> # CONFIG_NAMESPACES is not set
> CONFIG_SCHED_AUTOGROUP=3Dy
> # CONFIG_SYSFS_DEPRECATED is not set
> # CONFIG_RELAY is not set
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D""
> CONFIG_RD_GZIP=3Dy
> # CONFIG_RD_BZIP2 is not set
> CONFIG_RD_LZMA=3Dy
> # CONFIG_RD_XZ is not set
> CONFIG_RD_LZO=3Dy
> # CONFIG_RD_LZ4 is not set
> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> CONFIG_SYSCTL=3Dy
> CONFIG_ANON_INODES=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_BPF=3Dy
> CONFIG_EXPERT=3Dy
> CONFIG_MULTIUSER=3Dy
> CONFIG_SGETMASK_SYSCALL=3Dy
> CONFIG_SYSFS_SYSCALL=3Dy
> # CONFIG_SYSCTL_SYSCALL is not set
> # CONFIG_POSIX_TIMERS is not set
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> # CONFIG_KALLSYMS_ABSOLUTE_PERCPU is not set
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_PRINTK_NMI=3Dy
> CONFIG_BUG=3Dy
> # CONFIG_ELF_CORE is not set
> CONFIG_PCSPKR_PLATFORM=3Dy
> CONFIG_BASE_FULL=3Dy
> CONFIG_FUTEX=3Dy
> CONFIG_FUTEX_PI=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> CONFIG_BPF_SYSCALL=3Dy
> # CONFIG_SHMEM is not set
> CONFIG_AIO=3Dy
> # CONFIG_ADVISE_SYSCALLS is not set
> # CONFIG_USERFAULTFD is not set
> CONFIG_PCI_QUIRKS=3Dy
> CONFIG_MEMBARRIER=3Dy
> CONFIG_EMBEDDED=3Dy
> CONFIG_HAVE_PERF_EVENTS=3Dy
> CONFIG_PC104=3Dy
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> CONFIG_VM_EVENT_COUNTERS=3Dy
> # CONFIG_COMPAT_BRK is not set
> # CONFIG_SLAB is not set
> # CONFIG_SLUB is not set
> CONFIG_SLOB=3Dy
> # CONFIG_SLAB_MERGE_DEFAULT is not set
> # CONFIG_SYSTEM_DATA_VERIFICATION is not set
> # CONFIG_PROFILING is not set
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
> CONFIG_JUMP_LABEL=3Dy
> CONFIG_STATIC_KEYS_SELFTEST=3Dy
> # CONFIG_UPROBES is not set
> # CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> CONFIG_HAVE_IOREMAP_PROT=3Dy
> CONFIG_HAVE_KPROBES=3Dy
> CONFIG_HAVE_KRETPROBES=3Dy
> CONFIG_HAVE_OPTPROBES=3Dy
> CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> CONFIG_HAVE_NMI=3Dy
> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
> CONFIG_ARCH_HAS_SET_MEMORY=3Dy
> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> CONFIG_HAVE_CLK=3Dy
> CONFIG_HAVE_DMA_API_DEBUG=3Dy
> CONFIG_HAVE_HW_BREAKPOINT=3Dy
> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HAVE_PERF_REGS=3Dy
> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> CONFIG_HAVE_RCU_TABLE_FREE=3Dy
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_HAVE_GCC_PLUGINS=3Dy
> CONFIG_GCC_PLUGINS=3Dy
> # CONFIG_GCC_PLUGIN_CYC_COMPLEXITY is not set
> # CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
> CONFIG_GCC_PLUGIN_STRUCTLEAK=3Dy
> CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL=3Dy
> # CONFIG_GCC_PLUGIN_STRUCTLEAK_VERBOSE is not set
> CONFIG_GCC_PLUGIN_RANDSTRUCT=3Dy
> CONFIG_GCC_PLUGIN_RANDSTRUCT_PERFORMANCE=3Dy
> CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
> # CONFIG_CC_STACKPROTECTOR is not set
> CONFIG_CC_STACKPROTECTOR_NONE=3Dy
> # CONFIG_CC_STACKPROTECTOR_REGULAR is not set
> # CONFIG_CC_STACKPROTECTOR_STRONG is not set
> CONFIG_THIN_ARCHIVES=3Dy
> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> CONFIG_HAVE_CONTEXT_TRACKING=3Dy
> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
> CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
> CONFIG_MODULES_USE_ELF_RELA=3Dy
> CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> CONFIG_HAVE_EXIT_THREAD=3Dy
> CONFIG_ARCH_MMAP_RND_BITS=3D28
> CONFIG_HAVE_COPY_THREAD_TLS=3Dy
> CONFIG_HAVE_STACK_VALIDATION=3Dy
> # CONFIG_HAVE_ARCH_HASH is not set
> CONFIG_ISA_BUS_API=3Dy
> # CONFIG_CPU_NO_EFFICIENT_FFS is not set
> CONFIG_HAVE_ARCH_VMAP_STACK=3Dy
> CONFIG_VMAP_STACK=3Dy
> # CONFIG_ARCH_OPTIONAL_KERNEL_RWX is not set
> # CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT is not set
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> CONFIG_STRICT_KERNEL_RWX=3Dy
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> CONFIG_ARCH_HAS_REFCOUNT=3Dy
> # CONFIG_REFCOUNT_FULL is not set
> =

> #
> # GCOV-based kernel profiling
> #
> CONFIG_GCOV_KERNEL=3Dy
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> CONFIG_GCOV_PROFILE_ALL=3Dy
> CONFIG_GCOV_FORMAT_AUTODETECT=3Dy
> # CONFIG_GCOV_FORMAT_3_4 is not set
> # CONFIG_GCOV_FORMAT_4_7 is not set
> # CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D0
> # CONFIG_MODULES is not set
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> CONFIG_BLOCK=3Dy
> CONFIG_BLK_SCSI_REQUEST=3Dy
> CONFIG_BLK_DEV_BSG=3Dy
> CONFIG_BLK_DEV_BSGLIB=3Dy
> CONFIG_BLK_DEV_INTEGRITY=3Dy
> # CONFIG_BLK_DEV_ZONED is not set
> CONFIG_BLK_CMDLINE_PARSER=3Dy
> # CONFIG_BLK_WBT is not set
> CONFIG_BLK_DEBUG_FS=3Dy
> # CONFIG_BLK_SED_OPAL is not set
> =

> #
> # Partition Types
> #
> CONFIG_PARTITION_ADVANCED=3Dy
> # CONFIG_ACORN_PARTITION is not set
> # CONFIG_AIX_PARTITION is not set
> # CONFIG_OSF_PARTITION is not set
> # CONFIG_AMIGA_PARTITION is not set
> # CONFIG_ATARI_PARTITION is not set
> CONFIG_MAC_PARTITION=3Dy
> CONFIG_MSDOS_PARTITION=3Dy
> CONFIG_BSD_DISKLABEL=3Dy
> CONFIG_MINIX_SUBPARTITION=3Dy
> # CONFIG_SOLARIS_X86_PARTITION is not set
> CONFIG_UNIXWARE_DISKLABEL=3Dy
> CONFIG_LDM_PARTITION=3Dy
> # CONFIG_LDM_DEBUG is not set
> CONFIG_SGI_PARTITION=3Dy
> # CONFIG_ULTRIX_PARTITION is not set
> # CONFIG_SUN_PARTITION is not set
> CONFIG_KARMA_PARTITION=3Dy
> # CONFIG_EFI_PARTITION is not set
> # CONFIG_SYSV68_PARTITION is not set
> CONFIG_CMDLINE_PARTITION=3Dy
> CONFIG_BLK_MQ_PCI=3Dy
> =

> #
> # IO Schedulers
> #
> CONFIG_IOSCHED_NOOP=3Dy
> CONFIG_IOSCHED_DEADLINE=3Dy
> CONFIG_IOSCHED_CFQ=3Dy
> # CONFIG_DEFAULT_DEADLINE is not set
> CONFIG_DEFAULT_CFQ=3Dy
> # CONFIG_DEFAULT_NOOP is not set
> CONFIG_DEFAULT_IOSCHED=3D"cfq"
> # CONFIG_MQ_IOSCHED_DEADLINE is not set
> CONFIG_MQ_IOSCHED_KYBER=3Dy
> CONFIG_IOSCHED_BFQ=3Dy
> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> CONFIG_FREEZER=3Dy
> =

> #
> # Processor type and features
> #
> # CONFIG_ZONE_DMA is not set
> # CONFIG_SMP is not set
> CONFIG_X86_FEATURE_NAMES=3Dy
> # CONFIG_X86_FAST_FEATURE_TESTS is not set
> CONFIG_X86_X2APIC=3Dy
> CONFIG_X86_MPPARSE=3Dy
> CONFIG_GOLDFISH=3Dy
> CONFIG_INTEL_RDT=3Dy
> # CONFIG_X86_EXTENDED_PLATFORM is not set
> CONFIG_X86_INTEL_LPSS=3Dy
> CONFIG_X86_AMD_PLATFORM_DEVICE=3Dy
> CONFIG_IOSF_MBI=3Dy
> CONFIG_IOSF_MBI_DEBUG=3Dy
> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> CONFIG_PARAVIRT_DEBUG=3Dy
> CONFIG_XEN=3Dy
> CONFIG_XEN_PV=3Dy
> # CONFIG_XEN_DOM0 is not set
> # CONFIG_XEN_PVHVM is not set
> # CONFIG_XEN_512GB is not set
> CONFIG_XEN_SAVE_RESTORE=3Dy
> # CONFIG_XEN_DEBUG_FS is not set
> CONFIG_KVM_GUEST=3Dy
> # CONFIG_KVM_DEBUG_FS is not set
> CONFIG_PARAVIRT_TIME_ACCOUNTING=3Dy
> CONFIG_PARAVIRT_CLOCK=3Dy
> CONFIG_NO_BOOTMEM=3Dy
> # CONFIG_MK8 is not set
> # CONFIG_MPSC is not set
> # CONFIG_MCORE2 is not set
> # CONFIG_MATOM is not set
> CONFIG_GENERIC_CPU=3Dy
> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> CONFIG_X86_L1_CACHE_SHIFT=3D6
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_CMOV=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
> CONFIG_X86_DEBUGCTLMSR=3Dy
> CONFIG_PROCESSOR_SELECT=3Dy
> CONFIG_CPU_SUP_INTEL=3Dy
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_CENTAUR=3Dy
> CONFIG_HPET_TIMER=3Dy
> CONFIG_HPET_EMULATE_RTC=3Dy
> # CONFIG_DMI is not set
> # CONFIG_GART_IOMMU is not set
> CONFIG_CALGARY_IOMMU=3Dy
> # CONFIG_CALGARY_IOMMU_ENABLED_BY_DEFAULT is not set
> CONFIG_SWIOTLB=3Dy
> CONFIG_IOMMU_HELPER=3Dy
> CONFIG_NR_CPUS=3D1
> # CONFIG_PREEMPT_NONE is not set
> CONFIG_PREEMPT_VOLUNTARY=3Dy
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=3Dy
> CONFIG_UP_LATE_INIT=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> CONFIG_X86_MCE=3Dy
> # CONFIG_X86_MCELOG_LEGACY is not set
> CONFIG_X86_MCE_INTEL=3Dy
> CONFIG_X86_MCE_AMD=3Dy
> CONFIG_X86_MCE_THRESHOLD=3Dy
> CONFIG_X86_MCE_INJECT=3Dy
> CONFIG_X86_THERMAL_VECTOR=3Dy
> =

> #
> # Performance monitoring
> #
> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dy
> # CONFIG_PERF_EVENTS_INTEL_CSTATE is not set
> CONFIG_PERF_EVENTS_AMD_POWER=3Dy
> # CONFIG_VM86 is not set
> CONFIG_X86_16BIT=3Dy
> CONFIG_X86_ESPFIX64=3Dy
> CONFIG_X86_VSYSCALL_EMULATION=3Dy
> # CONFIG_I8K is not set
> # CONFIG_MICROCODE is not set
> CONFIG_X86_MSR=3Dy
> # CONFIG_X86_CPUID is not set
> # CONFIG_X86_5LEVEL is not set
> CONFIG_ARCH_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> CONFIG_X86_DIRECT_GBPAGES=3Dy
> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> # CONFIG_AMD_MEM_ENCRYPT is not set
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> CONFIG_ARCH_MEMORY_PROBE=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_SPARSEMEM_MANUAL=3Dy
> CONFIG_SPARSEMEM=3Dy
> CONFIG_HAVE_MEMORY_PRESENT=3Dy
> CONFIG_SPARSEMEM_EXTREME=3Dy
> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
> CONFIG_SPARSEMEM_ALLOC_MEM_MAP_TOGETHER=3Dy
> CONFIG_SPARSEMEM_VMEMMAP=3Dy
> CONFIG_HAVE_MEMBLOCK=3Dy
> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> CONFIG_HAVE_GENERIC_GUP=3Dy
> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> CONFIG_MEMORY_ISOLATION=3Dy
> CONFIG_HAVE_BOOTMEM_INFO_NODE=3Dy
> CONFIG_MEMORY_HOTPLUG=3Dy
> CONFIG_MEMORY_HOTPLUG_SPARSE=3Dy
> # CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
> CONFIG_MEMORY_HOTREMOVE=3Dy
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> CONFIG_COMPACTION=3Dy
> CONFIG_MIGRATION=3Dy
> CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_MMU_NOTIFIER=3Dy
> CONFIG_KSM=3Dy
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
> # CONFIG_MEMORY_FAILURE is not set
> # CONFIG_TRANSPARENT_HUGEPAGE is not set
> CONFIG_ARCH_WANTS_THP_SWAP=3Dy
> CONFIG_NEED_PER_CPU_KM=3Dy
> # CONFIG_CLEANCACHE is not set
> CONFIG_CMA=3Dy
> CONFIG_CMA_DEBUG=3Dy
> # CONFIG_CMA_DEBUGFS is not set
> CONFIG_CMA_AREAS=3D7
> # CONFIG_MEM_SOFT_DIRTY is not set
> # CONFIG_ZPOOL is not set
> CONFIG_ZBUD=3Dy
> # CONFIG_ZSMALLOC is not set
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=3Dy
> # CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
> # CONFIG_IDLE_PAGE_TRACKING is not set
> CONFIG_ARCH_HAS_ZONE_DEVICE=3Dy
> CONFIG_ZONE_DEVICE=3Dy
> CONFIG_ARCH_HAS_HMM=3Dy
> # CONFIG_HMM_MIRROR is not set
> # CONFIG_DEVICE_PRIVATE is not set
> # CONFIG_DEVICE_PUBLIC is not set
> CONFIG_ARCH_USES_HIGH_VMA_FLAGS=3Dy
> CONFIG_ARCH_HAS_PKEYS=3Dy
> CONFIG_PERCPU_STATS=3Dy
> # CONFIG_X86_PMEM_LEGACY is not set
> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> CONFIG_X86_RESERVE_LOW=3D64
> # CONFIG_MTRR is not set
> # CONFIG_ARCH_RANDOM is not set
> # CONFIG_X86_SMAP is not set
> CONFIG_X86_INTEL_UMIP=3Dy
> CONFIG_X86_INTEL_MPX=3Dy
> CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=3Dy
> # CONFIG_EFI is not set
> # CONFIG_SECCOMP is not set
> # CONFIG_HZ_100 is not set
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> CONFIG_HZ_1000=3Dy
> CONFIG_HZ=3D1000
> # CONFIG_SCHED_HRTICK is not set
> # CONFIG_KEXEC is not set
> # CONFIG_KEXEC_FILE is not set
> # CONFIG_CRASH_DUMP is not set
> CONFIG_PHYSICAL_START=3D0x1000000
> CONFIG_RELOCATABLE=3Dy
> # CONFIG_RANDOMIZE_BASE is not set
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> # CONFIG_LEGACY_VSYSCALL_NATIVE is not set
> CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
> # CONFIG_LEGACY_VSYSCALL_NONE is not set
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_MODIFY_LDT_SYSCALL=3Dy
> CONFIG_HAVE_LIVEPATCH=3Dy
> CONFIG_ARCH_HAS_ADD_PAGES=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
> =

> #
> # Power management and ACPI options
> #
> # CONFIG_SUSPEND is not set
> CONFIG_HIBERNATE_CALLBACKS=3Dy
> CONFIG_PM_SLEEP=3Dy
> # CONFIG_PM_AUTOSLEEP is not set
> # CONFIG_PM_WAKELOCKS is not set
> CONFIG_PM=3Dy
> # CONFIG_PM_DEBUG is not set
> CONFIG_PM_OPP=3Dy
> CONFIG_PM_CLK=3Dy
> CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> # CONFIG_ACPI_DEBUGGER is not set
> # CONFIG_ACPI_PROCFS_POWER is not set
> # CONFIG_ACPI_REV_OVERRIDE_POSSIBLE is not set
> CONFIG_ACPI_EC_DEBUGFS=3Dy
> CONFIG_ACPI_AC=3Dy
> # CONFIG_ACPI_BATTERY is not set
> CONFIG_ACPI_BUTTON=3Dy
> CONFIG_ACPI_VIDEO=3Dy
> CONFIG_ACPI_FAN=3Dy
> # CONFIG_ACPI_DOCK is not set
> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> CONFIG_ACPI_PROCESSOR=3Dy
> # CONFIG_ACPI_IPMI is not set
> CONFIG_ACPI_PROCESSOR_AGGREGATOR=3Dy
> CONFIG_ACPI_THERMAL=3Dy
> CONFIG_ACPI_CUSTOM_DSDT_FILE=3D""
> # CONFIG_ACPI_CUSTOM_DSDT is not set
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> # CONFIG_ACPI_TABLE_UPGRADE is not set
> # CONFIG_ACPI_DEBUG is not set
> # CONFIG_ACPI_PCI_SLOT is not set
> CONFIG_X86_PM_TIMER=3Dy
> CONFIG_ACPI_CONTAINER=3Dy
> CONFIG_ACPI_HOTPLUG_MEMORY=3Dy
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> # CONFIG_ACPI_SBS is not set
> CONFIG_ACPI_HED=3Dy
> CONFIG_ACPI_CUSTOM_METHOD=3Dy
> CONFIG_ACPI_REDUCED_HARDWARE_ONLY=3Dy
> # CONFIG_ACPI_NFIT is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> CONFIG_ACPI_APEI=3Dy
> # CONFIG_ACPI_APEI_GHES is not set
> CONFIG_ACPI_APEI_PCIEAER=3Dy
> CONFIG_ACPI_APEI_EINJ=3Dy
> CONFIG_ACPI_APEI_ERST_DEBUG=3Dy
> CONFIG_DPTF_POWER=3Dy
> # CONFIG_PMIC_OPREGION is not set
> # CONFIG_ACPI_CONFIGFS is not set
> # CONFIG_SFI is not set
> =

> #
> # CPU Frequency scaling
> #
> CONFIG_CPU_FREQ=3Dy
> CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
> CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> # CONFIG_CPU_FREQ_STAT is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE=3Dy
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> # CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
> =

> #
> # CPU frequency scaling drivers
> #
> # CONFIG_X86_INTEL_PSTATE is not set
> CONFIG_X86_PCC_CPUFREQ=3Dy
> CONFIG_X86_ACPI_CPUFREQ=3Dy
> CONFIG_X86_ACPI_CPUFREQ_CPB=3Dy
> CONFIG_X86_POWERNOW_K8=3Dy
> # CONFIG_X86_AMD_FREQ_SENSITIVITY is not set
> # CONFIG_X86_SPEEDSTEP_CENTRINO is not set
> CONFIG_X86_P4_CLOCKMOD=3Dy
> =

> #
> # shared options
> #
> CONFIG_X86_SPEEDSTEP_LIB=3Dy
> =

> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=3Dy
> CONFIG_CPU_IDLE_GOV_LADDER=3Dy
> # CONFIG_CPU_IDLE_GOV_MENU is not set
> # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
> # CONFIG_INTEL_IDLE is not set
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI=3Dy
> CONFIG_PCI_DIRECT=3Dy
> # CONFIG_PCI_MMCONFIG is not set
> CONFIG_PCI_XEN=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> CONFIG_PCI_CNB20LE_QUIRK=3Dy
> CONFIG_PCIEPORTBUS=3Dy
> # CONFIG_HOTPLUG_PCI_PCIE is not set
> CONFIG_PCIEAER=3Dy
> CONFIG_PCIE_ECRC=3Dy
> CONFIG_PCIEAER_INJECT=3Dy
> # CONFIG_PCIEASPM is not set
> CONFIG_PCIE_PME=3Dy
> CONFIG_PCIE_DPC=3Dy
> # CONFIG_PCIE_PTM is not set
> CONFIG_PCI_BUS_ADDR_T_64BIT=3Dy
> CONFIG_PCI_MSI=3Dy
> CONFIG_PCI_MSI_IRQ_DOMAIN=3Dy
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> # CONFIG_PCI_STUB is not set
> CONFIG_XEN_PCIDEV_FRONTEND=3Dy
> CONFIG_HT_IRQ=3Dy
> CONFIG_PCI_ATS=3Dy
> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> CONFIG_PCI_IOV=3Dy
> # CONFIG_PCI_PRI is not set
> # CONFIG_PCI_PASID is not set
> CONFIG_PCI_LABEL=3Dy
> CONFIG_HOTPLUG_PCI=3Dy
> # CONFIG_HOTPLUG_PCI_ACPI is not set
> CONFIG_HOTPLUG_PCI_CPCI=3Dy
> # CONFIG_HOTPLUG_PCI_CPCI_ZT5550 is not set
> # CONFIG_HOTPLUG_PCI_CPCI_GENERIC is not set
> # CONFIG_HOTPLUG_PCI_SHPC is not set
> =

> #
> # DesignWare PCI Core Support
> #
> # CONFIG_PCIE_DW_PLAT is not set
> =

> #
> # PCI host controller drivers
> #
> CONFIG_VMD=3Dy
> =

> #
> # PCI Endpoint
> #
> CONFIG_PCI_ENDPOINT=3Dy
> # CONFIG_PCI_ENDPOINT_CONFIGFS is not set
> CONFIG_PCI_EPF_TEST=3Dy
> =

> #
> # PCI switch controller drivers
> #
> CONFIG_PCI_SW_SWITCHTEC=3Dy
> CONFIG_ISA_BUS=3Dy
> # CONFIG_ISA_DMA_API is not set
> CONFIG_AMD_NB=3Dy
> CONFIG_PCCARD=3Dy
> CONFIG_PCMCIA=3Dy
> # CONFIG_PCMCIA_LOAD_CIS is not set
> # CONFIG_CARDBUS is not set
> =

> #
> # PC-card bridges
> #
> CONFIG_YENTA=3Dy
> # CONFIG_YENTA_O2 is not set
> CONFIG_YENTA_RICOH=3Dy
> # CONFIG_YENTA_TI is not set
> CONFIG_YENTA_TOSHIBA=3Dy
> CONFIG_PD6729=3Dy
> CONFIG_I82092=3Dy
> CONFIG_PCCARD_NONSTATIC=3Dy
> # CONFIG_RAPIDIO is not set
> CONFIG_X86_SYSFB=3Dy
> =

> #
> # Executable file formats / Emulations
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_ELFCORE=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> # CONFIG_HAVE_AOUT is not set
> CONFIG_BINFMT_MISC=3Dy
> CONFIG_COREDUMP=3Dy
> # CONFIG_IA32_EMULATION is not set
> # CONFIG_X86_X32 is not set
> CONFIG_X86_DEV_DMA_OPS=3Dy
> CONFIG_NET=3Dy
> =

> #
> # Networking options
> #
> # CONFIG_PACKET is not set
> CONFIG_UNIX=3Dy
> # CONFIG_UNIX_DIAG is not set
> # CONFIG_NET_KEY is not set
> # CONFIG_INET is not set
> # CONFIG_NETWORK_SECMARK is not set
> # CONFIG_NET_PTP_CLASSIFY is not set
> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> # CONFIG_NETFILTER is not set
> # CONFIG_ATM is not set
> # CONFIG_BRIDGE is not set
> # CONFIG_VLAN_8021Q is not set
> # CONFIG_DECNET is not set
> # CONFIG_LLC2 is not set
> # CONFIG_IPX is not set
> # CONFIG_ATALK is not set
> # CONFIG_X25 is not set
> # CONFIG_LAPB is not set
> # CONFIG_PHONET is not set
> # CONFIG_IEEE802154 is not set
> # CONFIG_NET_SCHED is not set
> # CONFIG_DCB is not set
> # CONFIG_DNS_RESOLVER is not set
> # CONFIG_BATMAN_ADV is not set
> # CONFIG_VSOCKETS is not set
> # CONFIG_NETLINK_DIAG is not set
> # CONFIG_MPLS is not set
> # CONFIG_NET_NSH is not set
> # CONFIG_HSR is not set
> # CONFIG_CGROUP_NET_PRIO is not set
> # CONFIG_CGROUP_NET_CLASSID is not set
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> # CONFIG_BPF_STREAM_PARSER is not set
> =

> #
> # Network testing
> #
> # CONFIG_HAMRADIO is not set
> # CONFIG_CAN is not set
> # CONFIG_BT is not set
> # CONFIG_STREAM_PARSER is not set
> CONFIG_WIRELESS=3Dy
> # CONFIG_CFG80211 is not set
> # CONFIG_LIB80211 is not set
> =

> #
> # CFG80211 needs to be enabled for MAC80211
> #
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> # CONFIG_WIMAX is not set
> # CONFIG_RFKILL is not set
> # CONFIG_NET_9P is not set
> # CONFIG_CAIF is not set
> # CONFIG_NFC is not set
> # CONFIG_PSAMPLE is not set
> # CONFIG_NET_IFE is not set
> # CONFIG_LWTUNNEL is not set
> # CONFIG_DST_CACHE is not set
> # CONFIG_GRO_CELLS is not set
> # CONFIG_NET_DEVLINK is not set
> CONFIG_MAY_USE_DEVLINK=3Dy
> CONFIG_HAVE_EBPF_JIT=3Dy
> =

> #
> # Device Drivers
> #
> =

> #
> # Generic Driver Options
> #
> # CONFIG_UEVENT_HELPER is not set
> CONFIG_DEVTMPFS=3Dy
> # CONFIG_DEVTMPFS_MOUNT is not set
> # CONFIG_STANDALONE is not set
> # CONFIG_PREVENT_FIRMWARE_BUILD is not set
> CONFIG_FW_LOADER=3Dy
> # CONFIG_FIRMWARE_IN_KERNEL is not set
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dy
> # CONFIG_ALLOW_DEV_COREDUMP is not set
> # CONFIG_DEBUG_DRIVER is not set
> # CONFIG_DEBUG_DEVRES is not set
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> # CONFIG_SYS_HYPERVISOR is not set
> # CONFIG_GENERIC_CPU_DEVICES is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_SPMI=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_REGMAP_HWSPINLOCK=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> CONFIG_DMA_FENCE_TRACE=3Dy
> # CONFIG_DMA_CMA is not set
> =

> #
> # Bus devices
> #
> # CONFIG_CONNECTOR is not set
> CONFIG_MTD=3Dy
> CONFIG_MTD_REDBOOT_PARTS=3Dy
> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=3Dy
> CONFIG_MTD_REDBOOT_PARTS_READONLY=3Dy
> CONFIG_MTD_CMDLINE_PARTS=3Dy
> CONFIG_MTD_AR7_PARTS=3Dy
> =

> #
> # Partition parsers
> #
> =

> #
> # User Modules And Translation Layers
> #
> CONFIG_MTD_BLKDEVS=3Dy
> CONFIG_MTD_BLOCK=3Dy
> # CONFIG_FTL is not set
> # CONFIG_NFTL is not set
> CONFIG_INFTL=3Dy
> CONFIG_RFD_FTL=3Dy
> # CONFIG_SSFDC is not set
> # CONFIG_SM_FTL is not set
> CONFIG_MTD_OOPS=3Dy
> # CONFIG_MTD_PARTITIONED_MASTER is not set
> =

> #
> # RAM/ROM/Flash chip drivers
> #
> # CONFIG_MTD_CFI is not set
> # CONFIG_MTD_JEDECPROBE is not set
> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> # CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
> # CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
> # CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
> CONFIG_MTD_CFI_I1=3Dy
> CONFIG_MTD_CFI_I2=3Dy
> # CONFIG_MTD_CFI_I4 is not set
> # CONFIG_MTD_CFI_I8 is not set
> CONFIG_MTD_RAM=3Dy
> CONFIG_MTD_ROM=3Dy
> # CONFIG_MTD_ABSENT is not set
> =

> #
> # Mapping drivers for chip access
> #
> CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
> CONFIG_MTD_PHYSMAP=3Dy
> CONFIG_MTD_PHYSMAP_COMPAT=3Dy
> CONFIG_MTD_PHYSMAP_START=3D0x8000000
> CONFIG_MTD_PHYSMAP_LEN=3D0
> CONFIG_MTD_PHYSMAP_BANKWIDTH=3D2
> CONFIG_MTD_PCI=3Dy
> CONFIG_MTD_PCMCIA=3Dy
> # CONFIG_MTD_PCMCIA_ANONYMOUS is not set
> CONFIG_MTD_GPIO_ADDR=3Dy
> CONFIG_MTD_INTEL_VR_NOR=3Dy
> CONFIG_MTD_PLATRAM=3Dy
> CONFIG_MTD_LATCH_ADDR=3Dy
> =

> #
> # Self-contained MTD device drivers
> #
> # CONFIG_MTD_PMC551 is not set
> # CONFIG_MTD_SLRAM is not set
> # CONFIG_MTD_PHRAM is not set
> CONFIG_MTD_MTDRAM=3Dy
> CONFIG_MTDRAM_TOTAL_SIZE=3D4096
> CONFIG_MTDRAM_ERASE_SIZE=3D128
> CONFIG_MTD_BLOCK2MTD=3Dy
> =

> #
> # Disk-On-Chip Device Drivers
> #
> # CONFIG_MTD_DOCG3 is not set
> CONFIG_MTD_NAND_ECC=3Dy
> CONFIG_MTD_NAND_ECC_SMC=3Dy
> CONFIG_MTD_NAND=3Dy
> # CONFIG_MTD_NAND_ECC_BCH is not set
> CONFIG_MTD_SM_COMMON=3Dy
> # CONFIG_MTD_NAND_DENALI_PCI is not set
> CONFIG_MTD_NAND_GPIO=3Dy
> # CONFIG_MTD_NAND_OMAP_BCH_BUILD is not set
> CONFIG_MTD_NAND_RICOH=3Dy
> CONFIG_MTD_NAND_DISKONCHIP=3Dy
> # CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED is not set
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=3D0
> # CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE is not set
> CONFIG_MTD_NAND_DOCG4=3Dy
> CONFIG_MTD_NAND_CAFE=3Dy
> # CONFIG_MTD_NAND_NANDSIM is not set
> CONFIG_MTD_NAND_PLATFORM=3Dy
> CONFIG_MTD_ONENAND=3Dy
> CONFIG_MTD_ONENAND_VERIFY_WRITE=3Dy
> CONFIG_MTD_ONENAND_GENERIC=3Dy
> CONFIG_MTD_ONENAND_OTP=3Dy
> CONFIG_MTD_ONENAND_2X_PROGRAM=3Dy
> =

> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> CONFIG_MTD_LPDDR=3Dy
> CONFIG_MTD_QINFO_PROBE=3Dy
> CONFIG_MTD_SPI_NOR=3Dy
> CONFIG_MTD_MT81xx_NOR=3Dy
> CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=3Dy
> CONFIG_SPI_INTEL_SPI=3Dy
> CONFIG_SPI_INTEL_SPI_PCI=3Dy
> CONFIG_SPI_INTEL_SPI_PLATFORM=3Dy
> CONFIG_MTD_UBI=3Dy
> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
> CONFIG_MTD_UBI_BEB_LIMIT=3D20
> # CONFIG_MTD_UBI_FASTMAP is not set
> # CONFIG_MTD_UBI_GLUEBI is not set
> # CONFIG_MTD_UBI_BLOCK is not set
> # CONFIG_OF is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> CONFIG_PARPORT=3Dy
> CONFIG_PARPORT_PC=3Dy
> CONFIG_PARPORT_SERIAL=3Dy
> # CONFIG_PARPORT_PC_FIFO is not set
> # CONFIG_PARPORT_PC_SUPERIO is not set
> # CONFIG_PARPORT_PC_PCMCIA is not set
> # CONFIG_PARPORT_GSC is not set
> CONFIG_PARPORT_AX88796=3Dy
> CONFIG_PARPORT_1284=3Dy
> CONFIG_PARPORT_NOT_PC=3Dy
> CONFIG_PNP=3Dy
> # CONFIG_PNP_DEBUG_MESSAGES is not set
> =

> #
> # Protocols
> #
> CONFIG_PNPACPI=3Dy
> CONFIG_BLK_DEV=3Dy
> # CONFIG_BLK_DEV_NULL_BLK is not set
> # CONFIG_PARIDE is not set
> # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> # CONFIG_BLK_DEV_DAC960 is not set
> # CONFIG_BLK_DEV_UMEM is not set
> # CONFIG_BLK_DEV_COW_COMMON is not set
> # CONFIG_BLK_DEV_LOOP is not set
> =

> #
> # DRBD disabled because PROC_FS or INET not selected
> #
> # CONFIG_BLK_DEV_NBD is not set
> # CONFIG_BLK_DEV_SKD is not set
> # CONFIG_BLK_DEV_SX8 is not set
> # CONFIG_BLK_DEV_RAM is not set
> # CONFIG_CDROM_PKTCDVD is not set
> # CONFIG_ATA_OVER_ETH is not set
> CONFIG_XEN_BLKDEV_FRONTEND=3Dy
> # CONFIG_BLK_DEV_RSXX is not set
> CONFIG_NVME_CORE=3Dy
> CONFIG_BLK_DEV_NVME=3Dy
> CONFIG_NVME_FABRICS=3Dy
> CONFIG_NVME_FC=3Dy
> # CONFIG_NVME_TARGET is not set
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dy
> CONFIG_AD525X_DPOT=3Dy
> CONFIG_AD525X_DPOT_I2C=3Dy
> CONFIG_DUMMY_IRQ=3Dy
> CONFIG_IBM_ASM=3Dy
> CONFIG_PHANTOM=3Dy
> # CONFIG_SGI_IOC4 is not set
> CONFIG_TIFM_CORE=3Dy
> # CONFIG_TIFM_7XX1 is not set
> CONFIG_ICS932S401=3Dy
> # CONFIG_ENCLOSURE_SERVICES is not set
> CONFIG_HP_ILO=3Dy
> CONFIG_APDS9802ALS=3Dy
> CONFIG_ISL29003=3Dy
> # CONFIG_ISL29020 is not set
> # CONFIG_SENSORS_TSL2550 is not set
> CONFIG_SENSORS_BH1770=3Dy
> # CONFIG_SENSORS_APDS990X is not set
> CONFIG_HMC6352=3Dy
> CONFIG_DS1682=3Dy
> CONFIG_USB_SWITCH_FSA9480=3Dy
> # CONFIG_SRAM is not set
> CONFIG_PCI_ENDPOINT_TEST=3Dy
> CONFIG_C2PORT=3Dy
> CONFIG_C2PORT_DURAMAR_2150=3Dy
> =

> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=3Dy
> # CONFIG_EEPROM_LEGACY is not set
> CONFIG_EEPROM_MAX6875=3Dy
> CONFIG_EEPROM_93CX6=3Dy
> CONFIG_EEPROM_IDT_89HPESX=3Dy
> CONFIG_CB710_CORE=3Dy
> CONFIG_CB710_DEBUG=3Dy
> CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> # CONFIG_SENSORS_LIS3_I2C is not set
> =

> #
> # Altera FPGA firmware download module
> #
> CONFIG_ALTERA_STAPL=3Dy
> CONFIG_INTEL_MEI=3Dy
> # CONFIG_INTEL_MEI_ME is not set
> CONFIG_INTEL_MEI_TXE=3Dy
> # CONFIG_VMWARE_VMCI is not set
> =

> #
> # Intel MIC Bus Driver
> #
> # CONFIG_INTEL_MIC_BUS is not set
> =

> #
> # SCIF Bus Driver
> #
> CONFIG_SCIF_BUS=3Dy
> =

> #
> # VOP Bus Driver
> #
> # CONFIG_VOP_BUS is not set
> =

> #
> # Intel MIC Host Driver
> #
> =

> #
> # Intel MIC Card Driver
> #
> =

> #
> # SCIF Driver
> #
> # CONFIG_SCIF is not set
> =

> #
> # Intel MIC Coprocessor State Management (COSM) Drivers
> #
> =

> #
> # VOP Driver
> #
> # CONFIG_GENWQE is not set
> # CONFIG_ECHO is not set
> # CONFIG_CXL_BASE is not set
> # CONFIG_CXL_AFU_DRIVER_OPS is not set
> # CONFIG_CXL_LIB is not set
> CONFIG_HAVE_IDE=3Dy
> # CONFIG_IDE is not set
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> CONFIG_RAID_ATTRS=3Dy
> CONFIG_SCSI=3Dy
> CONFIG_SCSI_DMA=3Dy
> # CONFIG_SCSI_NETLINK is not set
> CONFIG_SCSI_MQ_DEFAULT=3Dy
> CONFIG_SCSI_PROC_FS=3Dy
> =

> #
> # SCSI support type (disk, tape, CD-ROM)
> #
> # CONFIG_BLK_DEV_SD is not set
> CONFIG_CHR_DEV_ST=3Dy
> # CONFIG_CHR_DEV_OSST is not set
> # CONFIG_BLK_DEV_SR is not set
> # CONFIG_CHR_DEV_SG is not set
> CONFIG_CHR_DEV_SCH=3Dy
> CONFIG_SCSI_CONSTANTS=3Dy
> CONFIG_SCSI_LOGGING=3Dy
> CONFIG_SCSI_SCAN_ASYNC=3Dy
> =

> #
> # SCSI Transports
> #
> CONFIG_SCSI_SPI_ATTRS=3Dy
> # CONFIG_SCSI_FC_ATTRS is not set
> # CONFIG_SCSI_ISCSI_ATTRS is not set
> CONFIG_SCSI_SAS_ATTRS=3Dy
> CONFIG_SCSI_SAS_LIBSAS=3Dy
> CONFIG_SCSI_SAS_ATA=3Dy
> # CONFIG_SCSI_SAS_HOST_SMP is not set
> CONFIG_SCSI_SRP_ATTRS=3Dy
> CONFIG_SCSI_LOWLEVEL=3Dy
> CONFIG_ISCSI_BOOT_SYSFS=3Dy
> # CONFIG_SCSI_BNX2_ISCSI is not set
> # CONFIG_BE2ISCSI is not set
> # CONFIG_BLK_DEV_3W_XXXX_RAID is not set
> # CONFIG_SCSI_HPSA is not set
> CONFIG_SCSI_3W_9XXX=3Dy
> # CONFIG_SCSI_3W_SAS is not set
> CONFIG_SCSI_ACARD=3Dy
> # CONFIG_SCSI_AACRAID is not set
> # CONFIG_SCSI_AIC7XXX is not set
> # CONFIG_SCSI_AIC79XX is not set
> # CONFIG_SCSI_AIC94XX is not set
> CONFIG_SCSI_MVSAS=3Dy
> # CONFIG_SCSI_MVSAS_DEBUG is not set
> CONFIG_SCSI_MVSAS_TASKLET=3Dy
> CONFIG_SCSI_MVUMI=3Dy
> # CONFIG_SCSI_DPT_I2O is not set
> CONFIG_SCSI_ADVANSYS=3Dy
> CONFIG_SCSI_ARCMSR=3Dy
> CONFIG_SCSI_ESAS2R=3Dy
> CONFIG_MEGARAID_NEWGEN=3Dy
> CONFIG_MEGARAID_MM=3Dy
> # CONFIG_MEGARAID_MAILBOX is not set
> CONFIG_MEGARAID_LEGACY=3Dy
> CONFIG_MEGARAID_SAS=3Dy
> CONFIG_SCSI_MPT3SAS=3Dy
> CONFIG_SCSI_MPT2SAS_MAX_SGE=3D128
> CONFIG_SCSI_MPT3SAS_MAX_SGE=3D128
> CONFIG_SCSI_MPT2SAS=3Dy
> CONFIG_SCSI_SMARTPQI=3Dy
> CONFIG_SCSI_UFSHCD=3Dy
> CONFIG_SCSI_UFSHCD_PCI=3Dy
> CONFIG_SCSI_UFS_DWC_TC_PCI=3Dy
> CONFIG_SCSI_UFSHCD_PLATFORM=3Dy
> CONFIG_SCSI_UFS_DWC_TC_PLATFORM=3Dy
> # CONFIG_SCSI_HPTIOP is not set
> CONFIG_VMWARE_PVSCSI=3Dy
> CONFIG_XEN_SCSI_FRONTEND=3Dy
> # CONFIG_SCSI_SNIC is not set
> CONFIG_SCSI_DMX3191D=3Dy
> CONFIG_SCSI_FUTURE_DOMAIN=3Dy
> # CONFIG_SCSI_ISCI is not set
> CONFIG_SCSI_IPS=3Dy
> CONFIG_SCSI_INITIO=3Dy
> CONFIG_SCSI_INIA100=3Dy
> CONFIG_SCSI_PPA=3Dy
> CONFIG_SCSI_IMM=3Dy
> # CONFIG_SCSI_IZIP_EPP16 is not set
> # CONFIG_SCSI_IZIP_SLOW_CTR is not set
> CONFIG_SCSI_STEX=3Dy
> CONFIG_SCSI_SYM53C8XX_2=3Dy
> CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=3D1
> CONFIG_SCSI_SYM53C8XX_DEFAULT_TAGS=3D16
> CONFIG_SCSI_SYM53C8XX_MAX_TAGS=3D64
> # CONFIG_SCSI_SYM53C8XX_MMIO is not set
> CONFIG_SCSI_IPR=3Dy
> # CONFIG_SCSI_IPR_TRACE is not set
> CONFIG_SCSI_IPR_DUMP=3Dy
> CONFIG_SCSI_QLOGIC_1280=3Dy
> # CONFIG_SCSI_QLA_ISCSI is not set
> CONFIG_SCSI_DC395x=3Dy
> # CONFIG_SCSI_AM53C974 is not set
> CONFIG_SCSI_WD719X=3Dy
> # CONFIG_SCSI_DEBUG is not set
> # CONFIG_SCSI_PMCRAID is not set
> CONFIG_SCSI_PM8001=3Dy
> CONFIG_SCSI_LOWLEVEL_PCMCIA=3Dy
> CONFIG_SCSI_DH=3Dy
> CONFIG_SCSI_DH_RDAC=3Dy
> CONFIG_SCSI_DH_HP_SW=3Dy
> CONFIG_SCSI_DH_EMC=3Dy
> CONFIG_SCSI_DH_ALUA=3Dy
> CONFIG_SCSI_OSD_INITIATOR=3Dy
> CONFIG_SCSI_OSD_ULD=3Dy
> CONFIG_SCSI_OSD_DPRINT_SENSE=3D1
> CONFIG_SCSI_OSD_DEBUG=3Dy
> CONFIG_ATA=3Dy
> # CONFIG_ATA_NONSTANDARD is not set
> CONFIG_ATA_VERBOSE_ERROR=3Dy
> # CONFIG_ATA_ACPI is not set
> CONFIG_SATA_PMP=3Dy
> =

> #
> # Controllers with non-SFF native interface
> #
> CONFIG_SATA_AHCI=3Dy
> CONFIG_SATA_AHCI_PLATFORM=3Dy
> CONFIG_SATA_INIC162X=3Dy
> CONFIG_SATA_ACARD_AHCI=3Dy
> CONFIG_SATA_SIL24=3Dy
> CONFIG_ATA_SFF=3Dy
> =

> #
> # SFF controllers with custom DMA interface
> #
> # CONFIG_PDC_ADMA is not set
> CONFIG_SATA_QSTOR=3Dy
> # CONFIG_SATA_SX4 is not set
> CONFIG_ATA_BMDMA=3Dy
> =

> #
> # SATA SFF controllers with BMDMA
> #
> # CONFIG_ATA_PIIX is not set
> CONFIG_SATA_DWC=3Dy
> # CONFIG_SATA_DWC_OLD_DMA is not set
> # CONFIG_SATA_DWC_DEBUG is not set
> CONFIG_SATA_MV=3Dy
> # CONFIG_SATA_NV is not set
> # CONFIG_SATA_PROMISE is not set
> CONFIG_SATA_SIL=3Dy
> CONFIG_SATA_SIS=3Dy
> CONFIG_SATA_SVW=3Dy
> CONFIG_SATA_ULI=3Dy
> CONFIG_SATA_VIA=3Dy
> CONFIG_SATA_VITESSE=3Dy
> =

> #
> # PATA SFF controllers with BMDMA
> #
> CONFIG_PATA_ALI=3Dy
> # CONFIG_PATA_AMD is not set
> CONFIG_PATA_ARTOP=3Dy
> CONFIG_PATA_ATIIXP=3Dy
> CONFIG_PATA_ATP867X=3Dy
> CONFIG_PATA_CMD64X=3Dy
> CONFIG_PATA_CYPRESS=3Dy
> CONFIG_PATA_EFAR=3Dy
> CONFIG_PATA_HPT366=3Dy
> CONFIG_PATA_HPT37X=3Dy
> # CONFIG_PATA_HPT3X2N is not set
> # CONFIG_PATA_HPT3X3 is not set
> CONFIG_PATA_IT8213=3Dy
> CONFIG_PATA_IT821X=3Dy
> CONFIG_PATA_JMICRON=3Dy
> CONFIG_PATA_MARVELL=3Dy
> CONFIG_PATA_NETCELL=3Dy
> CONFIG_PATA_NINJA32=3Dy
> CONFIG_PATA_NS87415=3Dy
> CONFIG_PATA_OLDPIIX=3Dy
> CONFIG_PATA_OPTIDMA=3Dy
> # CONFIG_PATA_PDC2027X is not set
> CONFIG_PATA_PDC_OLD=3Dy
> CONFIG_PATA_RADISYS=3Dy
> # CONFIG_PATA_RDC is not set
> CONFIG_PATA_SCH=3Dy
> # CONFIG_PATA_SERVERWORKS is not set
> CONFIG_PATA_SIL680=3Dy
> CONFIG_PATA_SIS=3Dy
> CONFIG_PATA_TOSHIBA=3Dy
> CONFIG_PATA_TRIFLEX=3Dy
> CONFIG_PATA_VIA=3Dy
> CONFIG_PATA_WINBOND=3Dy
> =

> #
> # PIO-only SFF controllers
> #
> # CONFIG_PATA_CMD640_PCI is not set
> # CONFIG_PATA_MPIIX is not set
> CONFIG_PATA_NS87410=3Dy
> CONFIG_PATA_OPTI=3Dy
> CONFIG_PATA_PCMCIA=3Dy
> # CONFIG_PATA_PLATFORM is not set
> CONFIG_PATA_RZ1000=3Dy
> =

> #
> # Generic fallback / legacy drivers
> #
> CONFIG_ATA_GENERIC=3Dy
> # CONFIG_PATA_LEGACY is not set
> CONFIG_MD=3Dy
> CONFIG_BLK_DEV_MD=3Dy
> CONFIG_MD_AUTODETECT=3Dy
> CONFIG_MD_LINEAR=3Dy
> CONFIG_MD_RAID0=3Dy
> # CONFIG_MD_RAID1 is not set
> CONFIG_MD_RAID10=3Dy
> # CONFIG_MD_RAID456 is not set
> CONFIG_MD_MULTIPATH=3Dy
> CONFIG_MD_FAULTY=3Dy
> # CONFIG_BCACHE is not set
> CONFIG_BLK_DEV_DM_BUILTIN=3Dy
> CONFIG_BLK_DEV_DM=3Dy
> # CONFIG_DM_MQ_DEFAULT is not set
> # CONFIG_DM_DEBUG is not set
> CONFIG_DM_BUFIO=3Dy
> # CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
> CONFIG_DM_BIO_PRISON=3Dy
> CONFIG_DM_PERSISTENT_DATA=3Dy
> CONFIG_DM_CRYPT=3Dy
> CONFIG_DM_SNAPSHOT=3Dy
> # CONFIG_DM_THIN_PROVISIONING is not set
> # CONFIG_DM_CACHE is not set
> CONFIG_DM_ERA=3Dy
> CONFIG_DM_MIRROR=3Dy
> # CONFIG_DM_LOG_USERSPACE is not set
> # CONFIG_DM_RAID is not set
> CONFIG_DM_ZERO=3Dy
> # CONFIG_DM_MULTIPATH is not set
> CONFIG_DM_DELAY=3Dy
> CONFIG_DM_UEVENT=3Dy
> CONFIG_DM_FLAKEY=3Dy
> CONFIG_DM_VERITY=3Dy
> # CONFIG_DM_VERITY_FEC is not set
> CONFIG_DM_SWITCH=3Dy
> CONFIG_DM_LOG_WRITES=3Dy
> # CONFIG_DM_INTEGRITY is not set
> CONFIG_TARGET_CORE=3Dy
> CONFIG_TCM_IBLOCK=3Dy
> CONFIG_TCM_FILEIO=3Dy
> CONFIG_TCM_PSCSI=3Dy
> CONFIG_LOOPBACK_TARGET=3Dy
> # CONFIG_ISCSI_TARGET is not set
> CONFIG_SBP_TARGET=3Dy
> CONFIG_FUSION=3Dy
> CONFIG_FUSION_SPI=3Dy
> CONFIG_FUSION_SAS=3Dy
> CONFIG_FUSION_MAX_SGE=3D128
> # CONFIG_FUSION_CTL is not set
> # CONFIG_FUSION_LOGGING is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> CONFIG_FIREWIRE=3Dy
> CONFIG_FIREWIRE_OHCI=3Dy
> CONFIG_FIREWIRE_SBP2=3Dy
> CONFIG_FIREWIRE_NOSY=3Dy
> # CONFIG_MACINTOSH_DRIVERS is not set
> # CONFIG_NETDEVICES is not set
> CONFIG_NVM=3Dy
> CONFIG_NVM_DEBUG=3Dy
> # CONFIG_NVM_RRPC is not set
> CONFIG_NVM_PBLK=3Dy
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> CONFIG_INPUT_LEDS=3Dy
> CONFIG_INPUT_FF_MEMLESS=3Dy
> CONFIG_INPUT_POLLDEV=3Dy
> CONFIG_INPUT_SPARSEKMAP=3Dy
> CONFIG_INPUT_MATRIXKMAP=3Dy
> =

> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=3Dy
> CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> # CONFIG_INPUT_JOYDEV is not set
> CONFIG_INPUT_EVDEV=3Dy
> CONFIG_INPUT_EVBUG=3Dy
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> CONFIG_KEYBOARD_ADC=3Dy
> CONFIG_KEYBOARD_ADP5588=3Dy
> CONFIG_KEYBOARD_ADP5589=3Dy
> CONFIG_KEYBOARD_ATKBD=3Dy
> CONFIG_KEYBOARD_QT1070=3Dy
> CONFIG_KEYBOARD_QT2160=3Dy
> CONFIG_KEYBOARD_DLINK_DIR685=3Dy
> CONFIG_KEYBOARD_LKKBD=3Dy
> CONFIG_KEYBOARD_GPIO=3Dy
> CONFIG_KEYBOARD_GPIO_POLLED=3Dy
> # CONFIG_KEYBOARD_TCA6416 is not set
> # CONFIG_KEYBOARD_TCA8418 is not set
> # CONFIG_KEYBOARD_MATRIX is not set
> CONFIG_KEYBOARD_LM8323=3Dy
> CONFIG_KEYBOARD_LM8333=3Dy
> CONFIG_KEYBOARD_MAX7359=3Dy
> CONFIG_KEYBOARD_MCS=3Dy
> CONFIG_KEYBOARD_MPR121=3Dy
> # CONFIG_KEYBOARD_NEWTON is not set
> CONFIG_KEYBOARD_OPENCORES=3Dy
> CONFIG_KEYBOARD_SAMSUNG=3Dy
> # CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> CONFIG_KEYBOARD_TM2_TOUCHKEY=3Dy
> CONFIG_KEYBOARD_TWL4030=3Dy
> CONFIG_KEYBOARD_XTKBD=3Dy
> CONFIG_KEYBOARD_CROS_EC=3Dy
> # CONFIG_INPUT_MOUSE is not set
> # CONFIG_INPUT_JOYSTICK is not set
> CONFIG_INPUT_TABLET=3Dy
> # CONFIG_TABLET_USB_ACECAD is not set
> # CONFIG_TABLET_USB_AIPTEK is not set
> # CONFIG_TABLET_USB_HANWANG is not set
> # CONFIG_TABLET_USB_KBTAB is not set
> # CONFIG_TABLET_USB_PEGASUS is not set
> # CONFIG_TABLET_SERIAL_WACOM4 is not set
> # CONFIG_INPUT_TOUCHSCREEN is not set
> CONFIG_INPUT_MISC=3Dy
> CONFIG_INPUT_88PM80X_ONKEY=3Dy
> # CONFIG_INPUT_AD714X is not set
> CONFIG_INPUT_BMA150=3Dy
> CONFIG_INPUT_E3X0_BUTTON=3Dy
> CONFIG_INPUT_PCSPKR=3Dy
> # CONFIG_INPUT_MMA8450 is not set
> CONFIG_INPUT_APANEL=3Dy
> CONFIG_INPUT_GP2A=3Dy
> # CONFIG_INPUT_GPIO_BEEPER is not set
> CONFIG_INPUT_GPIO_TILT_POLLED=3Dy
> # CONFIG_INPUT_GPIO_DECODER is not set
> # CONFIG_INPUT_ATLAS_BTNS is not set
> # CONFIG_INPUT_ATI_REMOTE2 is not set
> # CONFIG_INPUT_KEYSPAN_REMOTE is not set
> CONFIG_INPUT_KXTJ9=3Dy
> CONFIG_INPUT_KXTJ9_POLLED_MODE=3Dy
> # CONFIG_INPUT_POWERMATE is not set
> # CONFIG_INPUT_YEALINK is not set
> # CONFIG_INPUT_CM109 is not set
> CONFIG_INPUT_REGULATOR_HAPTIC=3Dy
> # CONFIG_INPUT_RETU_PWRBUTTON is not set
> CONFIG_INPUT_TPS65218_PWRBUTTON=3Dy
> # CONFIG_INPUT_TWL4030_PWRBUTTON is not set
> # CONFIG_INPUT_TWL4030_VIBRA is not set
> CONFIG_INPUT_UINPUT=3Dy
> # CONFIG_INPUT_PCF50633_PMU is not set
> # CONFIG_INPUT_PCF8574 is not set
> CONFIG_INPUT_GPIO_ROTARY_ENCODER=3Dy
> CONFIG_INPUT_DA9052_ONKEY=3Dy
> # CONFIG_INPUT_DA9063_ONKEY is not set
> # CONFIG_INPUT_ADXL34X is not set
> CONFIG_INPUT_CMA3000=3Dy
> CONFIG_INPUT_CMA3000_I2C=3Dy
> CONFIG_INPUT_XEN_KBDDEV_FRONTEND=3Dy
> CONFIG_INPUT_IDEAPAD_SLIDEBAR=3Dy
> # CONFIG_INPUT_SOC_BUTTON_ARRAY is not set
> # CONFIG_INPUT_DRV260X_HAPTICS is not set
> CONFIG_INPUT_DRV2665_HAPTICS=3Dy
> CONFIG_INPUT_DRV2667_HAPTICS=3Dy
> CONFIG_RMI4_CORE=3Dy
> CONFIG_RMI4_I2C=3Dy
> CONFIG_RMI4_SMB=3Dy
> CONFIG_RMI4_F03=3Dy
> CONFIG_RMI4_F03_SERIO=3Dy
> CONFIG_RMI4_2D_SENSOR=3Dy
> CONFIG_RMI4_F11=3Dy
> CONFIG_RMI4_F12=3Dy
> # CONFIG_RMI4_F30 is not set
> CONFIG_RMI4_F34=3Dy
> CONFIG_RMI4_F55=3Dy
> =

> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> CONFIG_SERIO_I8042=3Dy
> # CONFIG_SERIO_SERPORT is not set
> CONFIG_SERIO_CT82C710=3Dy
> CONFIG_SERIO_PARKBD=3Dy
> CONFIG_SERIO_PCIPS2=3Dy
> CONFIG_SERIO_LIBPS2=3Dy
> # CONFIG_SERIO_RAW is not set
> CONFIG_SERIO_ALTERA_PS2=3Dy
> CONFIG_SERIO_PS2MULT=3Dy
> CONFIG_SERIO_ARC_PS2=3Dy
> CONFIG_SERIO_GPIO_PS2=3Dy
> CONFIG_USERIO=3Dy
> CONFIG_GAMEPORT=3Dy
> CONFIG_GAMEPORT_NS558=3Dy
> CONFIG_GAMEPORT_L4=3Dy
> CONFIG_GAMEPORT_EMU10K1=3Dy
> CONFIG_GAMEPORT_FM801=3Dy
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> # CONFIG_VT is not set
> CONFIG_UNIX98_PTYS=3Dy
> # CONFIG_LEGACY_PTYS is not set
> CONFIG_SERIAL_NONSTANDARD=3Dy
> CONFIG_ROCKETPORT=3Dy
> CONFIG_CYCLADES=3Dy
> # CONFIG_CYZ_INTR is not set
> CONFIG_MOXA_INTELLIO=3Dy
> # CONFIG_MOXA_SMARTIO is not set
> CONFIG_SYNCLINKMP=3Dy
> CONFIG_SYNCLINK_GT=3Dy
> CONFIG_NOZOMI=3Dy
> # CONFIG_ISI is not set
> CONFIG_N_HDLC=3Dy
> # CONFIG_N_GSM is not set
> # CONFIG_TRACE_SINK is not set
> CONFIG_GOLDFISH_TTY=3Dy
> CONFIG_DEVMEM=3Dy
> # CONFIG_DEVKMEM is not set
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=3Dy
> CONFIG_SERIAL_8250=3Dy
> # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> # CONFIG_SERIAL_8250_PNP is not set
> CONFIG_SERIAL_8250_FINTEK=3Dy
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_DMA=3Dy
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_EXAR=3Dy
> # CONFIG_SERIAL_8250_CS is not set
> # CONFIG_SERIAL_8250_MEN_MCB is not set
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> # CONFIG_SERIAL_8250_EXTENDED is not set
> # CONFIG_SERIAL_8250_FSL is not set
> CONFIG_SERIAL_8250_DW=3Dy
> CONFIG_SERIAL_8250_RT288X=3Dy
> CONFIG_SERIAL_8250_LPSS=3Dy
> CONFIG_SERIAL_8250_MID=3Dy
> CONFIG_SERIAL_8250_MOXA=3Dy
> =

> #
> # Non-8250 serial port support
> #
> CONFIG_SERIAL_UARTLITE=3Dy
> # CONFIG_SERIAL_UARTLITE_CONSOLE is not set
> CONFIG_SERIAL_UARTLITE_NR_UARTS=3D1
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> CONFIG_SERIAL_JSM=3Dy
> # CONFIG_SERIAL_SCCNXP is not set
> # CONFIG_SERIAL_SC16IS7XX is not set
> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> CONFIG_SERIAL_ALTERA_UART=3Dy
> CONFIG_SERIAL_ALTERA_UART_MAXPORTS=3D4
> CONFIG_SERIAL_ALTERA_UART_BAUDRATE=3D115200
> CONFIG_SERIAL_ALTERA_UART_CONSOLE=3Dy
> # CONFIG_SERIAL_ARC is not set
> # CONFIG_SERIAL_RP2 is not set
> CONFIG_SERIAL_FSL_LPUART=3Dy
> # CONFIG_SERIAL_FSL_LPUART_CONSOLE is not set
> CONFIG_SERIAL_MEN_Z135=3Dy
> CONFIG_SERIAL_DEV_BUS=3Dy
> # CONFIG_SERIAL_DEV_CTRL_TTYPORT is not set
> CONFIG_TTY_PRINTK=3Dy
> # CONFIG_PRINTER is not set
> CONFIG_PPDEV=3Dy
> CONFIG_HVC_DRIVER=3Dy
> CONFIG_HVC_IRQ=3Dy
> CONFIG_HVC_XEN=3Dy
> # CONFIG_HVC_XEN_FRONTEND is not set
> CONFIG_IPMI_HANDLER=3Dy
> CONFIG_IPMI_PANIC_EVENT=3Dy
> CONFIG_IPMI_PANIC_STRING=3Dy
> # CONFIG_IPMI_DEVICE_INTERFACE is not set
> CONFIG_IPMI_SI=3Dy
> CONFIG_IPMI_SSIF=3Dy
> CONFIG_IPMI_WATCHDOG=3Dy
> CONFIG_IPMI_POWEROFF=3Dy
> # CONFIG_HW_RANDOM is not set
> # CONFIG_NVRAM is not set
> CONFIG_R3964=3Dy
> CONFIG_APPLICOM=3Dy
> =

> #
> # PCMCIA character devices
> #
> # CONFIG_SYNCLINK_CS is not set
> # CONFIG_CARDMAN_4000 is not set
> # CONFIG_CARDMAN_4040 is not set
> # CONFIG_SCR24X is not set
> CONFIG_MWAVE=3Dy
> CONFIG_RAW_DRIVER=3Dy
> CONFIG_MAX_RAW_DEVS=3D256
> CONFIG_HPET=3Dy
> CONFIG_HPET_MMAP=3Dy
> CONFIG_HPET_MMAP_DEFAULT=3Dy
> # CONFIG_HANGCHECK_TIMER is not set
> CONFIG_TCG_TPM=3Dy
> CONFIG_TCG_TIS_CORE=3Dy
> CONFIG_TCG_TIS=3Dy
> # CONFIG_TCG_TIS_I2C_ATMEL is not set
> CONFIG_TCG_TIS_I2C_INFINEON=3Dy
> CONFIG_TCG_TIS_I2C_NUVOTON=3Dy
> CONFIG_TCG_NSC=3Dy
> CONFIG_TCG_ATMEL=3Dy
> CONFIG_TCG_INFINEON=3Dy
> CONFIG_TCG_XEN=3Dy
> # CONFIG_TCG_CRB is not set
> CONFIG_TCG_VTPM_PROXY=3Dy
> CONFIG_TCG_TIS_ST33ZP24=3Dy
> CONFIG_TCG_TIS_ST33ZP24_I2C=3Dy
> CONFIG_TELCLOCK=3Dy
> # CONFIG_DEVPORT is not set
> # CONFIG_XILLYBUS is not set
> =

> #
> # I2C support
> #
> CONFIG_I2C=3Dy
> CONFIG_ACPI_I2C_OPREGION=3Dy
> CONFIG_I2C_BOARDINFO=3Dy
> CONFIG_I2C_COMPAT=3Dy
> CONFIG_I2C_CHARDEV=3Dy
> CONFIG_I2C_MUX=3Dy
> =

> #
> # Multiplexer I2C Chip support
> #
> CONFIG_I2C_MUX_GPIO=3Dy
> CONFIG_I2C_MUX_LTC4306=3Dy
> CONFIG_I2C_MUX_PCA9541=3Dy
> # CONFIG_I2C_MUX_PCA954x is not set
> # CONFIG_I2C_MUX_REG is not set
> CONFIG_I2C_MUX_MLXCPLD=3Dy
> # CONFIG_I2C_HELPER_AUTO is not set
> CONFIG_I2C_SMBUS=3Dy
> =

> #
> # I2C Algorithms
> #
> CONFIG_I2C_ALGOBIT=3Dy
> CONFIG_I2C_ALGOPCF=3Dy
> # CONFIG_I2C_ALGOPCA is not set
> =

> #
> # I2C Hardware Bus support
> #
> =

> #
> # PC SMBus host controller drivers
> #
> CONFIG_I2C_ALI1535=3Dy
> CONFIG_I2C_ALI1563=3Dy
> CONFIG_I2C_ALI15X3=3Dy
> CONFIG_I2C_AMD756=3Dy
> # CONFIG_I2C_AMD756_S4882 is not set
> CONFIG_I2C_AMD8111=3Dy
> CONFIG_I2C_I801=3Dy
> CONFIG_I2C_ISCH=3Dy
> CONFIG_I2C_ISMT=3Dy
> CONFIG_I2C_PIIX4=3Dy
> # CONFIG_I2C_NFORCE2 is not set
> # CONFIG_I2C_SIS5595 is not set
> CONFIG_I2C_SIS630=3Dy
> # CONFIG_I2C_SIS96X is not set
> # CONFIG_I2C_VIA is not set
> CONFIG_I2C_VIAPRO=3Dy
> =

> #
> # ACPI drivers
> #
> CONFIG_I2C_SCMI=3Dy
> =

> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> CONFIG_I2C_CBUS_GPIO=3Dy
> CONFIG_I2C_DESIGNWARE_CORE=3Dy
> CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
> # CONFIG_I2C_DESIGNWARE_SLAVE is not set
> CONFIG_I2C_DESIGNWARE_PCI=3Dy
> CONFIG_I2C_DESIGNWARE_BAYTRAIL=3Dy
> CONFIG_I2C_EMEV2=3Dy
> CONFIG_I2C_GPIO=3Dy
> CONFIG_I2C_KEMPLD=3Dy
> CONFIG_I2C_OCORES=3Dy
> # CONFIG_I2C_PCA_PLATFORM is not set
> # CONFIG_I2C_PXA_PCI is not set
> CONFIG_I2C_SIMTEC=3Dy
> CONFIG_I2C_XILINX=3Dy
> =

> #
> # External I2C/SMBus adapter drivers
> #
> # CONFIG_I2C_PARPORT is not set
> CONFIG_I2C_PARPORT_LIGHT=3Dy
> # CONFIG_I2C_TAOS_EVM is not set
> =

> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_MLXCPLD=3Dy
> # CONFIG_I2C_CROS_EC_TUNNEL is not set
> CONFIG_I2C_SLAVE=3Dy
> # CONFIG_I2C_SLAVE_EEPROM is not set
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # CONFIG_SPI is not set
> CONFIG_SPMI=3Dy
> CONFIG_HSI=3Dy
> CONFIG_HSI_BOARDINFO=3Dy
> =

> #
> # HSI controllers
> #
> =

> #
> # HSI clients
> #
> CONFIG_HSI_CHAR=3Dy
> CONFIG_PPS=3Dy
> # CONFIG_PPS_DEBUG is not set
> # CONFIG_NTP_PPS is not set
> =

> #
> # PPS clients support
> #
> CONFIG_PPS_CLIENT_KTIMER=3Dy
> CONFIG_PPS_CLIENT_LDISC=3Dy
> # CONFIG_PPS_CLIENT_PARPORT is not set
> CONFIG_PPS_CLIENT_GPIO=3Dy
> =

> #
> # PPS generators support
> #
> =

> #
> # PTP clock support
> #
> =

> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> CONFIG_PINCTRL=3Dy
> =

> #
> # Pin controllers
> #
> CONFIG_PINMUX=3Dy
> CONFIG_PINCONF=3Dy
> CONFIG_GENERIC_PINCONF=3Dy
> CONFIG_DEBUG_PINCTRL=3Dy
> # CONFIG_PINCTRL_AMD is not set
> # CONFIG_PINCTRL_MCP23S08 is not set
> CONFIG_PINCTRL_SX150X=3Dy
> # CONFIG_PINCTRL_BAYTRAIL is not set
> CONFIG_PINCTRL_CHERRYVIEW=3Dy
> CONFIG_PINCTRL_INTEL=3Dy
> CONFIG_PINCTRL_BROXTON=3Dy
> CONFIG_PINCTRL_CANNONLAKE=3Dy
> CONFIG_PINCTRL_DENVERTON=3Dy
> CONFIG_PINCTRL_GEMINILAKE=3Dy
> CONFIG_PINCTRL_LEWISBURG=3Dy
> CONFIG_PINCTRL_SUNRISEPOINT=3Dy
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> CONFIG_DEBUG_GPIO=3Dy
> CONFIG_GPIO_SYSFS=3Dy
> CONFIG_GPIO_GENERIC=3Dy
> CONFIG_GPIO_MAX730X=3Dy
> =

> #
> # Memory mapped GPIO drivers
> #
> # CONFIG_GPIO_AMDPT is not set
> CONFIG_GPIO_DWAPB=3Dy
> # CONFIG_GPIO_EXAR is not set
> CONFIG_GPIO_GENERIC_PLATFORM=3Dy
> CONFIG_GPIO_ICH=3Dy
> # CONFIG_GPIO_LYNXPOINT is not set
> # CONFIG_GPIO_MENZ127 is not set
> # CONFIG_GPIO_MOCKUP is not set
> # CONFIG_GPIO_VX855 is not set
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> CONFIG_GPIO_104_DIO_48E=3Dy
> CONFIG_GPIO_104_IDIO_16=3Dy
> CONFIG_GPIO_104_IDI_48=3Dy
> # CONFIG_GPIO_F7188X is not set
> CONFIG_GPIO_GPIO_MM=3Dy
> CONFIG_GPIO_IT87=3Dy
> CONFIG_GPIO_SCH=3Dy
> CONFIG_GPIO_SCH311X=3Dy
> CONFIG_GPIO_WS16C48=3Dy
> =

> #
> # I2C GPIO expanders
> #
> CONFIG_GPIO_ADP5588=3Dy
> CONFIG_GPIO_ADP5588_IRQ=3Dy
> CONFIG_GPIO_MAX7300=3Dy
> CONFIG_GPIO_MAX732X=3Dy
> CONFIG_GPIO_MAX732X_IRQ=3Dy
> CONFIG_GPIO_PCA953X=3Dy
> CONFIG_GPIO_PCA953X_IRQ=3Dy
> CONFIG_GPIO_PCF857X=3Dy
> CONFIG_GPIO_SX150X=3Dy
> CONFIG_GPIO_TPIC2810=3Dy
> =

> #
> # MFD GPIO expanders
> #
> CONFIG_GPIO_BD9571MWV=3Dy
> CONFIG_GPIO_CRYSTAL_COVE=3Dy
> # CONFIG_GPIO_DA9052 is not set
> CONFIG_GPIO_JANZ_TTL=3Dy
> CONFIG_GPIO_KEMPLD=3Dy
> CONFIG_GPIO_TPS65086=3Dy
> # CONFIG_GPIO_TPS65910 is not set
> CONFIG_GPIO_TWL4030=3Dy
> # CONFIG_GPIO_WM8350 is not set
> CONFIG_GPIO_WM8994=3Dy
> =

> #
> # PCI GPIO expanders
> #
> CONFIG_GPIO_AMD8111=3Dy
> CONFIG_GPIO_BT8XX=3Dy
> CONFIG_GPIO_ML_IOH=3Dy
> CONFIG_GPIO_PCI_IDIO_16=3Dy
> CONFIG_GPIO_RDC321X=3Dy
> CONFIG_W1=3Dy
> =

> #
> # 1-wire Bus Masters
> #
> # CONFIG_W1_MASTER_MATROX is not set
> # CONFIG_W1_MASTER_DS2482 is not set
> CONFIG_W1_MASTER_DS1WM=3Dy
> CONFIG_W1_MASTER_GPIO=3Dy
> =

> #
> # 1-wire Slaves
> #
> # CONFIG_W1_SLAVE_THERM is not set
> # CONFIG_W1_SLAVE_SMEM is not set
> CONFIG_W1_SLAVE_DS2405=3Dy
> # CONFIG_W1_SLAVE_DS2408 is not set
> # CONFIG_W1_SLAVE_DS2413 is not set
> CONFIG_W1_SLAVE_DS2406=3Dy
> # CONFIG_W1_SLAVE_DS2423 is not set
> CONFIG_W1_SLAVE_DS2805=3Dy
> CONFIG_W1_SLAVE_DS2431=3Dy
> # CONFIG_W1_SLAVE_DS2433 is not set
> # CONFIG_W1_SLAVE_DS2438 is not set
> CONFIG_W1_SLAVE_DS2760=3Dy
> CONFIG_W1_SLAVE_DS2780=3Dy
> CONFIG_W1_SLAVE_DS2781=3Dy
> CONFIG_W1_SLAVE_DS28E04=3Dy
> CONFIG_POWER_AVS=3Dy
> # CONFIG_POWER_RESET is not set
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> CONFIG_PDA_POWER=3Dy
> CONFIG_GENERIC_ADC_BATTERY=3Dy
> CONFIG_WM8350_POWER=3Dy
> CONFIG_TEST_POWER=3Dy
> # CONFIG_BATTERY_DS2760 is not set
> # CONFIG_BATTERY_DS2780 is not set
> CONFIG_BATTERY_DS2781=3Dy
> CONFIG_BATTERY_DS2782=3Dy
> CONFIG_BATTERY_SBS=3Dy
> CONFIG_CHARGER_SBS=3Dy
> CONFIG_BATTERY_BQ27XXX=3Dy
> CONFIG_BATTERY_BQ27XXX_I2C=3Dy
> CONFIG_BATTERY_BQ27XXX_HDQ=3Dy
> # CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM is not set
> CONFIG_BATTERY_DA9030=3Dy
> CONFIG_BATTERY_DA9052=3Dy
> CONFIG_BATTERY_DA9150=3Dy
> # CONFIG_BATTERY_MAX17040 is not set
> # CONFIG_BATTERY_MAX17042 is not set
> # CONFIG_BATTERY_MAX1721X is not set
> # CONFIG_CHARGER_PCF50633 is not set
> CONFIG_CHARGER_MAX8903=3Dy
> CONFIG_CHARGER_TWL4030=3Dy
> CONFIG_CHARGER_LP8727=3Dy
> # CONFIG_CHARGER_LP8788 is not set
> CONFIG_CHARGER_GPIO=3Dy
> # CONFIG_CHARGER_MANAGER is not set
> CONFIG_CHARGER_LTC3651=3Dy
> CONFIG_CHARGER_MAX77693=3Dy
> CONFIG_CHARGER_MAX8997=3Dy
> # CONFIG_CHARGER_MAX8998 is not set
> CONFIG_CHARGER_BQ2415X=3Dy
> CONFIG_CHARGER_BQ24257=3Dy
> CONFIG_CHARGER_BQ24735=3Dy
> CONFIG_CHARGER_BQ25890=3Dy
> CONFIG_CHARGER_SMB347=3Dy
> # CONFIG_CHARGER_TPS65090 is not set
> CONFIG_CHARGER_TPS65217=3Dy
> CONFIG_BATTERY_GAUGE_LTC2941=3Dy
> CONFIG_BATTERY_GOLDFISH=3Dy
> CONFIG_CHARGER_RT9455=3Dy
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> CONFIG_HWMON_DEBUG_CHIP=3Dy
> =

> #
> # Native drivers
> #
> # CONFIG_SENSORS_AD7414 is not set
> CONFIG_SENSORS_AD7418=3Dy
> CONFIG_SENSORS_ADM1021=3Dy
> # CONFIG_SENSORS_ADM1025 is not set
> CONFIG_SENSORS_ADM1026=3Dy
> # CONFIG_SENSORS_ADM1029 is not set
> CONFIG_SENSORS_ADM1031=3Dy
> # CONFIG_SENSORS_ADM9240 is not set
> # CONFIG_SENSORS_ADT7410 is not set
> # CONFIG_SENSORS_ADT7411 is not set
> # CONFIG_SENSORS_ADT7462 is not set
> CONFIG_SENSORS_ADT7470=3Dy
> # CONFIG_SENSORS_ADT7475 is not set
> CONFIG_SENSORS_ASC7621=3Dy
> CONFIG_SENSORS_K8TEMP=3Dy
> CONFIG_SENSORS_K10TEMP=3Dy
> # CONFIG_SENSORS_FAM15H_POWER is not set
> CONFIG_SENSORS_APPLESMC=3Dy
> # CONFIG_SENSORS_ASB100 is not set
> CONFIG_SENSORS_ASPEED=3Dy
> CONFIG_SENSORS_ATXP1=3Dy
> CONFIG_SENSORS_DS620=3Dy
> CONFIG_SENSORS_DS1621=3Dy
> CONFIG_SENSORS_DELL_SMM=3Dy
> CONFIG_SENSORS_DA9052_ADC=3Dy
> # CONFIG_SENSORS_I5K_AMB is not set
> # CONFIG_SENSORS_F71805F is not set
> CONFIG_SENSORS_F71882FG=3Dy
> CONFIG_SENSORS_F75375S=3Dy
> CONFIG_SENSORS_FSCHMD=3Dy
> CONFIG_SENSORS_GL518SM=3Dy
> CONFIG_SENSORS_GL520SM=3Dy
> CONFIG_SENSORS_G760A=3Dy
> CONFIG_SENSORS_G762=3Dy
> # CONFIG_SENSORS_HIH6130 is not set
> CONFIG_SENSORS_IBMAEM=3Dy
> CONFIG_SENSORS_IBMPEX=3Dy
> CONFIG_SENSORS_IIO_HWMON=3Dy
> CONFIG_SENSORS_I5500=3Dy
> CONFIG_SENSORS_CORETEMP=3Dy
> CONFIG_SENSORS_IT87=3Dy
> # CONFIG_SENSORS_JC42 is not set
> # CONFIG_SENSORS_POWR1220 is not set
> # CONFIG_SENSORS_LINEAGE is not set
> CONFIG_SENSORS_LTC2945=3Dy
> # CONFIG_SENSORS_LTC2990 is not set
> # CONFIG_SENSORS_LTC4151 is not set
> # CONFIG_SENSORS_LTC4215 is not set
> CONFIG_SENSORS_LTC4222=3Dy
> CONFIG_SENSORS_LTC4245=3Dy
> CONFIG_SENSORS_LTC4260=3Dy
> # CONFIG_SENSORS_LTC4261 is not set
> CONFIG_SENSORS_MAX16065=3Dy
> CONFIG_SENSORS_MAX1619=3Dy
> # CONFIG_SENSORS_MAX1668 is not set
> # CONFIG_SENSORS_MAX197 is not set
> # CONFIG_SENSORS_MAX6621 is not set
> CONFIG_SENSORS_MAX6639=3Dy
> # CONFIG_SENSORS_MAX6642 is not set
> CONFIG_SENSORS_MAX6650=3Dy
> # CONFIG_SENSORS_MAX6697 is not set
> CONFIG_SENSORS_MAX31790=3Dy
> CONFIG_SENSORS_MCP3021=3Dy
> CONFIG_SENSORS_TC654=3Dy
> # CONFIG_SENSORS_LM63 is not set
> CONFIG_SENSORS_LM73=3Dy
> CONFIG_SENSORS_LM75=3Dy
> CONFIG_SENSORS_LM77=3Dy
> # CONFIG_SENSORS_LM78 is not set
> # CONFIG_SENSORS_LM80 is not set
> # CONFIG_SENSORS_LM83 is not set
> CONFIG_SENSORS_LM85=3Dy
> # CONFIG_SENSORS_LM87 is not set
> CONFIG_SENSORS_LM90=3Dy
> CONFIG_SENSORS_LM92=3Dy
> # CONFIG_SENSORS_LM93 is not set
> CONFIG_SENSORS_LM95234=3Dy
> CONFIG_SENSORS_LM95241=3Dy
> CONFIG_SENSORS_LM95245=3Dy
> # CONFIG_SENSORS_PC87360 is not set
> # CONFIG_SENSORS_PC87427 is not set
> # CONFIG_SENSORS_NTC_THERMISTOR is not set
> CONFIG_SENSORS_NCT6683=3Dy
> CONFIG_SENSORS_NCT6775=3Dy
> CONFIG_SENSORS_NCT7802=3Dy
> # CONFIG_SENSORS_NCT7904 is not set
> CONFIG_SENSORS_PCF8591=3Dy
> # CONFIG_PMBUS is not set
> CONFIG_SENSORS_SHT15=3Dy
> CONFIG_SENSORS_SHT21=3Dy
> # CONFIG_SENSORS_SHT3x is not set
> CONFIG_SENSORS_SHTC1=3Dy
> CONFIG_SENSORS_SIS5595=3Dy
> # CONFIG_SENSORS_DME1737 is not set
> # CONFIG_SENSORS_EMC1403 is not set
> CONFIG_SENSORS_EMC2103=3Dy
> CONFIG_SENSORS_EMC6W201=3Dy
> CONFIG_SENSORS_SMSC47M1=3Dy
> CONFIG_SENSORS_SMSC47M192=3Dy
> CONFIG_SENSORS_SMSC47B397=3Dy
> # CONFIG_SENSORS_SCH56XX_COMMON is not set
> # CONFIG_SENSORS_STTS751 is not set
> CONFIG_SENSORS_SMM665=3Dy
> # CONFIG_SENSORS_ADC128D818 is not set
> CONFIG_SENSORS_ADS1015=3Dy
> CONFIG_SENSORS_ADS7828=3Dy
> # CONFIG_SENSORS_AMC6821 is not set
> CONFIG_SENSORS_INA209=3Dy
> CONFIG_SENSORS_INA2XX=3Dy
> # CONFIG_SENSORS_INA3221 is not set
> CONFIG_SENSORS_TC74=3Dy
> # CONFIG_SENSORS_THMC50 is not set
> CONFIG_SENSORS_TMP102=3Dy
> CONFIG_SENSORS_TMP103=3Dy
> # CONFIG_SENSORS_TMP108 is not set
> CONFIG_SENSORS_TMP401=3Dy
> CONFIG_SENSORS_TMP421=3Dy
> # CONFIG_SENSORS_VIA_CPUTEMP is not set
> CONFIG_SENSORS_VIA686A=3Dy
> CONFIG_SENSORS_VT1211=3Dy
> # CONFIG_SENSORS_VT8231 is not set
> # CONFIG_SENSORS_W83781D is not set
> CONFIG_SENSORS_W83791D=3Dy
> # CONFIG_SENSORS_W83792D is not set
> CONFIG_SENSORS_W83793=3Dy
> # CONFIG_SENSORS_W83795 is not set
> CONFIG_SENSORS_W83L785TS=3Dy
> CONFIG_SENSORS_W83L786NG=3Dy
> CONFIG_SENSORS_W83627HF=3Dy
> # CONFIG_SENSORS_W83627EHF is not set
> CONFIG_SENSORS_WM8350=3Dy
> =

> #
> # ACPI drivers
> #
> CONFIG_SENSORS_ACPI_POWER=3Dy
> # CONFIG_SENSORS_ATK0110 is not set
> CONFIG_THERMAL=3Dy
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> CONFIG_THERMAL_HWMON=3Dy
> CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR=3Dy
> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
> # CONFIG_CLOCK_THERMAL is not set
> CONFIG_DEVFREQ_THERMAL=3Dy
> # CONFIG_THERMAL_EMULATION is not set
> # CONFIG_INTEL_POWERCLAMP is not set
> # CONFIG_X86_PKG_TEMP_THERMAL is not set
> CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dy
> CONFIG_INTEL_SOC_DTS_THERMAL=3Dy
> =

> #
> # ACPI INT340X thermal drivers
> #
> CONFIG_INT340X_THERMAL=3Dy
> CONFIG_ACPI_THERMAL_REL=3Dy
> CONFIG_INT3406_THERMAL=3Dy
> # CONFIG_INTEL_PCH_THERMAL is not set
> # CONFIG_GENERIC_ADC_THERMAL is not set
> # CONFIG_WATCHDOG is not set
> CONFIG_SSB_POSSIBLE=3Dy
> =

> #
> # Sonics Silicon Backplane
> #
> # CONFIG_SSB is not set
> CONFIG_BCMA_POSSIBLE=3Dy
> CONFIG_BCMA=3Dy
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> # CONFIG_BCMA_HOST_PCI is not set
> CONFIG_BCMA_HOST_SOC=3Dy
> # CONFIG_BCMA_DRIVER_PCI is not set
> # CONFIG_BCMA_SFLASH is not set
> CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> # CONFIG_BCMA_DRIVER_GPIO is not set
> # CONFIG_BCMA_DEBUG is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> CONFIG_MFD_AS3711=3Dy
> # CONFIG_PMIC_ADP5520 is not set
> CONFIG_MFD_AAT2870_CORE=3Dy
> CONFIG_MFD_BCM590XX=3Dy
> CONFIG_MFD_BD9571MWV=3Dy
> # CONFIG_MFD_AXP20X_I2C is not set
> CONFIG_MFD_CROS_EC=3Dy
> CONFIG_MFD_CROS_EC_I2C=3Dy
> CONFIG_PMIC_DA903X=3Dy
> CONFIG_PMIC_DA9052=3Dy
> CONFIG_MFD_DA9052_I2C=3Dy
> # CONFIG_MFD_DA9055 is not set
> # CONFIG_MFD_DA9062 is not set
> CONFIG_MFD_DA9063=3Dy
> CONFIG_MFD_DA9150=3Dy
> # CONFIG_MFD_MC13XXX_I2C is not set
> CONFIG_HTC_PASIC3=3Dy
> # CONFIG_HTC_I2CPLD is not set
> CONFIG_MFD_INTEL_QUARK_I2C_GPIO=3Dy
> CONFIG_LPC_ICH=3Dy
> CONFIG_LPC_SCH=3Dy
> CONFIG_INTEL_SOC_PMIC=3Dy
> # CONFIG_INTEL_SOC_PMIC_CHTWC is not set
> CONFIG_MFD_INTEL_LPSS=3Dy
> # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> CONFIG_MFD_INTEL_LPSS_PCI=3Dy
> CONFIG_MFD_JANZ_CMODIO=3Dy
> CONFIG_MFD_KEMPLD=3Dy
> CONFIG_MFD_88PM800=3Dy
> CONFIG_MFD_88PM805=3Dy
> # CONFIG_MFD_88PM860X is not set
> # CONFIG_MFD_MAX14577 is not set
> CONFIG_MFD_MAX77693=3Dy
> CONFIG_MFD_MAX77843=3Dy
> CONFIG_MFD_MAX8907=3Dy
> # CONFIG_MFD_MAX8925 is not set
> CONFIG_MFD_MAX8997=3Dy
> CONFIG_MFD_MAX8998=3Dy
> # CONFIG_MFD_MT6397 is not set
> # CONFIG_MFD_MENF21BMC is not set
> CONFIG_MFD_RETU=3Dy
> CONFIG_MFD_PCF50633=3Dy
> CONFIG_PCF50633_ADC=3Dy
> # CONFIG_PCF50633_GPIO is not set
> CONFIG_MFD_RDC321X=3Dy
> # CONFIG_MFD_RTSX_PCI is not set
> # CONFIG_MFD_RT5033 is not set
> # CONFIG_MFD_RC5T583 is not set
> # CONFIG_MFD_SEC_CORE is not set
> # CONFIG_MFD_SI476X_CORE is not set
> CONFIG_MFD_SM501=3Dy
> # CONFIG_MFD_SM501_GPIO is not set
> CONFIG_MFD_SKY81452=3Dy
> # CONFIG_MFD_SMSC is not set
> CONFIG_ABX500_CORE=3Dy
> CONFIG_AB3100_CORE=3Dy
> CONFIG_AB3100_OTP=3Dy
> # CONFIG_MFD_SYSCON is not set
> # CONFIG_MFD_TI_AM335X_TSCADC is not set
> # CONFIG_MFD_LP3943 is not set
> CONFIG_MFD_LP8788=3Dy
> CONFIG_MFD_TI_LMU=3Dy
> # CONFIG_MFD_PALMAS is not set
> CONFIG_TPS6105X=3Dy
> # CONFIG_TPS65010 is not set
> # CONFIG_TPS6507X is not set
> CONFIG_MFD_TPS65086=3Dy
> CONFIG_MFD_TPS65090=3Dy
> CONFIG_MFD_TPS65217=3Dy
> # CONFIG_MFD_TPS68470 is not set
> # CONFIG_MFD_TI_LP873X is not set
> # CONFIG_MFD_TPS65218 is not set
> # CONFIG_MFD_TPS6586X is not set
> CONFIG_MFD_TPS65910=3Dy
> # CONFIG_MFD_TPS65912_I2C is not set
> # CONFIG_MFD_TPS80031 is not set
> CONFIG_TWL4030_CORE=3Dy
> # CONFIG_MFD_TWL4030_AUDIO is not set
> # CONFIG_TWL6040_CORE is not set
> CONFIG_MFD_WL1273_CORE=3Dy
> CONFIG_MFD_LM3533=3Dy
> # CONFIG_MFD_TMIO is not set
> CONFIG_MFD_VX855=3Dy
> # CONFIG_MFD_ARIZONA_I2C is not set
> CONFIG_MFD_WM8400=3Dy
> # CONFIG_MFD_WM831X_I2C is not set
> CONFIG_MFD_WM8350=3Dy
> CONFIG_MFD_WM8350_I2C=3Dy
> CONFIG_MFD_WM8994=3Dy
> CONFIG_REGULATOR=3Dy
> CONFIG_REGULATOR_DEBUG=3Dy
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> CONFIG_REGULATOR_VIRTUAL_CONSUMER=3Dy
> CONFIG_REGULATOR_USERSPACE_CONSUMER=3Dy
> # CONFIG_REGULATOR_88PM800 is not set
> CONFIG_REGULATOR_ACT8865=3Dy
> # CONFIG_REGULATOR_AD5398 is not set
> # CONFIG_REGULATOR_AAT2870 is not set
> CONFIG_REGULATOR_AB3100=3Dy
> CONFIG_REGULATOR_AS3711=3Dy
> CONFIG_REGULATOR_BCM590XX=3Dy
> CONFIG_REGULATOR_BD9571MWV=3Dy
> CONFIG_REGULATOR_DA903X=3Dy
> CONFIG_REGULATOR_DA9052=3Dy
> # CONFIG_REGULATOR_DA9063 is not set
> # CONFIG_REGULATOR_DA9210 is not set
> CONFIG_REGULATOR_DA9211=3Dy
> CONFIG_REGULATOR_FAN53555=3Dy
> # CONFIG_REGULATOR_GPIO is not set
> CONFIG_REGULATOR_ISL9305=3Dy
> CONFIG_REGULATOR_ISL6271A=3Dy
> # CONFIG_REGULATOR_LM363X is not set
> CONFIG_REGULATOR_LP3971=3Dy
> CONFIG_REGULATOR_LP3972=3Dy
> CONFIG_REGULATOR_LP872X=3Dy
> # CONFIG_REGULATOR_LP8755 is not set
> CONFIG_REGULATOR_LP8788=3Dy
> CONFIG_REGULATOR_LTC3589=3Dy
> # CONFIG_REGULATOR_LTC3676 is not set
> # CONFIG_REGULATOR_MAX1586 is not set
> CONFIG_REGULATOR_MAX8649=3Dy
> # CONFIG_REGULATOR_MAX8660 is not set
> CONFIG_REGULATOR_MAX8907=3Dy
> CONFIG_REGULATOR_MAX8952=3Dy
> CONFIG_REGULATOR_MAX8997=3Dy
> CONFIG_REGULATOR_MAX8998=3Dy
> CONFIG_REGULATOR_MAX77693=3Dy
> CONFIG_REGULATOR_MT6311=3Dy
> CONFIG_REGULATOR_PCF50633=3Dy
> CONFIG_REGULATOR_PFUZE100=3Dy
> # CONFIG_REGULATOR_PV88060 is not set
> CONFIG_REGULATOR_PV88080=3Dy
> # CONFIG_REGULATOR_PV88090 is not set
> CONFIG_REGULATOR_QCOM_SPMI=3Dy
> # CONFIG_REGULATOR_SKY81452 is not set
> CONFIG_REGULATOR_TPS51632=3Dy
> CONFIG_REGULATOR_TPS6105X=3Dy
> # CONFIG_REGULATOR_TPS62360 is not set
> # CONFIG_REGULATOR_TPS65023 is not set
> # CONFIG_REGULATOR_TPS6507X is not set
> # CONFIG_REGULATOR_TPS65086 is not set
> CONFIG_REGULATOR_TPS65090=3Dy
> # CONFIG_REGULATOR_TPS65132 is not set
> CONFIG_REGULATOR_TPS65217=3Dy
> # CONFIG_REGULATOR_TPS65910 is not set
> # CONFIG_REGULATOR_TWL4030 is not set
> CONFIG_REGULATOR_WM8350=3Dy
> CONFIG_REGULATOR_WM8400=3Dy
> # CONFIG_REGULATOR_WM8994 is not set
> CONFIG_RC_CORE=3Dy
> CONFIG_RC_MAP=3Dy
> CONFIG_RC_DECODERS=3Dy
> # CONFIG_LIRC is not set
> # CONFIG_IR_NEC_DECODER is not set
> CONFIG_IR_RC5_DECODER=3Dy
> CONFIG_IR_RC6_DECODER=3Dy
> CONFIG_IR_JVC_DECODER=3Dy
> CONFIG_IR_SONY_DECODER=3Dy
> CONFIG_IR_SANYO_DECODER=3Dy
> CONFIG_IR_SHARP_DECODER=3Dy
> CONFIG_IR_MCE_KBD_DECODER=3Dy
> CONFIG_IR_XMP_DECODER=3Dy
> # CONFIG_RC_DEVICES is not set
> # CONFIG_MEDIA_SUPPORT is not set
> =

> #
> # Graphics support
> #
> # CONFIG_AGP is not set
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D16
> CONFIG_VGA_SWITCHEROO=3Dy
> # CONFIG_DRM is not set
> =

> #
> # ACP (Audio CoProcessor) Configuration
> #
> # CONFIG_DRM_LIB_RANDOM is not set
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB=3Dy
> # CONFIG_FIRMWARE_EDID is not set
> CONFIG_FB_CMDLINE=3Dy
> CONFIG_FB_NOTIFY=3Dy
> CONFIG_FB_DDC=3Dy
> CONFIG_FB_BOOT_VESA_SUPPORT=3Dy
> CONFIG_FB_CFB_FILLRECT=3Dy
> CONFIG_FB_CFB_COPYAREA=3Dy
> CONFIG_FB_CFB_IMAGEBLIT=3Dy
> # CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
> CONFIG_FB_SYS_FILLRECT=3Dy
> CONFIG_FB_SYS_COPYAREA=3Dy
> CONFIG_FB_SYS_IMAGEBLIT=3Dy
> # CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA is not set
> CONFIG_FB_FOREIGN_ENDIAN=3Dy
> CONFIG_FB_BOTH_ENDIAN=3Dy
> # CONFIG_FB_BIG_ENDIAN is not set
> # CONFIG_FB_LITTLE_ENDIAN is not set
> CONFIG_FB_SYS_FOPS=3Dy
> CONFIG_FB_DEFERRED_IO=3Dy
> CONFIG_FB_HECUBA=3Dy
> CONFIG_FB_SVGALIB=3Dy
> # CONFIG_FB_MACMODES is not set
> CONFIG_FB_BACKLIGHT=3Dy
> CONFIG_FB_MODE_HELPERS=3Dy
> CONFIG_FB_TILEBLITTING=3Dy
> =

> #
> # Frame buffer hardware drivers
> #
> CONFIG_FB_CIRRUS=3Dy
> CONFIG_FB_PM2=3Dy
> # CONFIG_FB_PM2_FIFO_DISCONNECT is not set
> # CONFIG_FB_CYBER2000 is not set
> CONFIG_FB_ARC=3Dy
> CONFIG_FB_ASILIANT=3Dy
> CONFIG_FB_IMSTT=3Dy
> # CONFIG_FB_VGA16 is not set
> CONFIG_FB_VESA=3Dy
> CONFIG_FB_N411=3Dy
> # CONFIG_FB_HGA is not set
> # CONFIG_FB_OPENCORES is not set
> CONFIG_FB_S1D13XXX=3Dy
> # CONFIG_FB_NVIDIA is not set
> CONFIG_FB_RIVA=3Dy
> CONFIG_FB_RIVA_I2C=3Dy
> CONFIG_FB_RIVA_DEBUG=3Dy
> # CONFIG_FB_RIVA_BACKLIGHT is not set
> CONFIG_FB_I740=3Dy
> CONFIG_FB_LE80578=3Dy
> # CONFIG_FB_CARILLO_RANCH is not set
> # CONFIG_FB_MATROX is not set
> # CONFIG_FB_RADEON is not set
> CONFIG_FB_ATY128=3Dy
> # CONFIG_FB_ATY128_BACKLIGHT is not set
> CONFIG_FB_ATY=3Dy
> CONFIG_FB_ATY_CT=3Dy
> # CONFIG_FB_ATY_GENERIC_LCD is not set
> CONFIG_FB_ATY_GX=3Dy
> CONFIG_FB_ATY_BACKLIGHT=3Dy
> CONFIG_FB_S3=3Dy
> # CONFIG_FB_S3_DDC is not set
> CONFIG_FB_SAVAGE=3Dy
> CONFIG_FB_SAVAGE_I2C=3Dy
> CONFIG_FB_SAVAGE_ACCEL=3Dy
> # CONFIG_FB_SIS is not set
> # CONFIG_FB_VIA is not set
> # CONFIG_FB_NEOMAGIC is not set
> CONFIG_FB_KYRO=3Dy
> CONFIG_FB_3DFX=3Dy
> CONFIG_FB_3DFX_ACCEL=3Dy
> # CONFIG_FB_3DFX_I2C is not set
> CONFIG_FB_VOODOO1=3Dy
> CONFIG_FB_VT8623=3Dy
> CONFIG_FB_TRIDENT=3Dy
> CONFIG_FB_ARK=3Dy
> CONFIG_FB_PM3=3Dy
> CONFIG_FB_CARMINE=3Dy
> CONFIG_FB_CARMINE_DRAM_EVAL=3Dy
> # CONFIG_CARMINE_DRAM_CUSTOM is not set
> # CONFIG_FB_SM501 is not set
> # CONFIG_FB_IBM_GXT4500 is not set
> CONFIG_FB_GOLDFISH=3Dy
> # CONFIG_FB_VIRTUAL is not set
> CONFIG_XEN_FBDEV_FRONTEND=3Dy
> CONFIG_FB_METRONOME=3Dy
> CONFIG_FB_MB862XX=3Dy
> CONFIG_FB_MB862XX_PCI_GDC=3Dy
> CONFIG_FB_MB862XX_I2C=3Dy
> CONFIG_FB_BROADSHEET=3Dy
> CONFIG_FB_AUO_K190X=3Dy
> CONFIG_FB_AUO_K1900=3Dy
> CONFIG_FB_AUO_K1901=3Dy
> CONFIG_FB_SIMPLE=3Dy
> CONFIG_FB_SM712=3Dy
> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> # CONFIG_LCD_CLASS_DEVICE is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> CONFIG_BACKLIGHT_GENERIC=3Dy
> CONFIG_BACKLIGHT_LM3533=3Dy
> CONFIG_BACKLIGHT_DA903X=3Dy
> CONFIG_BACKLIGHT_DA9052=3Dy
> # CONFIG_BACKLIGHT_APPLE is not set
> CONFIG_BACKLIGHT_PM8941_WLED=3Dy
> CONFIG_BACKLIGHT_SAHARA=3Dy
> # CONFIG_BACKLIGHT_ADP8860 is not set
> CONFIG_BACKLIGHT_ADP8870=3Dy
> # CONFIG_BACKLIGHT_PCF50633 is not set
> CONFIG_BACKLIGHT_AAT2870=3Dy
> CONFIG_BACKLIGHT_LM3639=3Dy
> CONFIG_BACKLIGHT_PANDORA=3Dy
> # CONFIG_BACKLIGHT_SKY81452 is not set
> # CONFIG_BACKLIGHT_TPS65217 is not set
> CONFIG_BACKLIGHT_AS3711=3Dy
> CONFIG_BACKLIGHT_GPIO=3Dy
> # CONFIG_BACKLIGHT_LV5207LP is not set
> CONFIG_BACKLIGHT_BD6107=3Dy
> CONFIG_BACKLIGHT_ARCXCNN=3Dy
> CONFIG_VGASTATE=3Dy
> CONFIG_LOGO=3Dy
> CONFIG_LOGO_LINUX_MONO=3Dy
> # CONFIG_LOGO_LINUX_VGA16 is not set
> # CONFIG_LOGO_LINUX_CLUT224 is not set
> CONFIG_SOUND=3Dy
> # CONFIG_SOUND_OSS_CORE is not set
> # CONFIG_SND is not set
> =

> #
> # HID support
> #
> CONFIG_HID=3Dy
> CONFIG_HID_BATTERY_STRENGTH=3Dy
> # CONFIG_HIDRAW is not set
> CONFIG_UHID=3Dy
> CONFIG_HID_GENERIC=3Dy
> =

> #
> # Special HID drivers
> #
> # CONFIG_HID_A4TECH is not set
> CONFIG_HID_ACRUX=3Dy
> # CONFIG_HID_ACRUX_FF is not set
> CONFIG_HID_APPLE=3Dy
> CONFIG_HID_ASUS=3Dy
> CONFIG_HID_AUREAL=3Dy
> CONFIG_HID_BELKIN=3Dy
> CONFIG_HID_CHERRY=3Dy
> # CONFIG_HID_CHICONY is not set
> CONFIG_HID_CMEDIA=3Dy
> CONFIG_HID_CYPRESS=3Dy
> CONFIG_HID_DRAGONRISE=3Dy
> # CONFIG_DRAGONRISE_FF is not set
> CONFIG_HID_EMS_FF=3Dy
> CONFIG_HID_ELECOM=3Dy
> # CONFIG_HID_EZKEY is not set
> CONFIG_HID_GEMBIRD=3Dy
> # CONFIG_HID_GFRM is not set
> CONFIG_HID_KEYTOUCH=3Dy
> CONFIG_HID_KYE=3Dy
> CONFIG_HID_WALTOP=3Dy
> CONFIG_HID_GYRATION=3Dy
> # CONFIG_HID_ICADE is not set
> CONFIG_HID_ITE=3Dy
> CONFIG_HID_TWINHAN=3Dy
> CONFIG_HID_KENSINGTON=3Dy
> # CONFIG_HID_LCPOWER is not set
> CONFIG_HID_LED=3Dy
> CONFIG_HID_LENOVO=3Dy
> # CONFIG_HID_LOGITECH is not set
> CONFIG_HID_MAGICMOUSE=3Dy
> # CONFIG_HID_MAYFLASH is not set
> CONFIG_HID_MICROSOFT=3Dy
> # CONFIG_HID_MONTEREY is not set
> CONFIG_HID_MULTITOUCH=3Dy
> # CONFIG_HID_NTI is not set
> CONFIG_HID_ORTEK=3Dy
> CONFIG_HID_PANTHERLORD=3Dy
> # CONFIG_PANTHERLORD_FF is not set
> CONFIG_HID_PETALYNX=3Dy
> # CONFIG_HID_PICOLCD is not set
> CONFIG_HID_PLANTRONICS=3Dy
> CONFIG_HID_PRIMAX=3Dy
> # CONFIG_HID_SAITEK is not set
> # CONFIG_HID_SAMSUNG is not set
> CONFIG_HID_SPEEDLINK=3Dy
> CONFIG_HID_STEELSERIES=3Dy
> CONFIG_HID_SUNPLUS=3Dy
> # CONFIG_HID_RMI is not set
> # CONFIG_HID_GREENASIA is not set
> # CONFIG_HID_SMARTJOYPLUS is not set
> CONFIG_HID_TIVO=3Dy
> # CONFIG_HID_TOPSEED is not set
> CONFIG_HID_THINGM=3Dy
> # CONFIG_HID_THRUSTMASTER is not set
> CONFIG_HID_UDRAW_PS3=3Dy
> # CONFIG_HID_WIIMOTE is not set
> CONFIG_HID_XINMO=3Dy
> # CONFIG_HID_ZEROPLUS is not set
> # CONFIG_HID_ZYDACRON is not set
> # CONFIG_HID_SENSOR_HUB is not set
> # CONFIG_HID_ALPS is not set
> =

> #
> # I2C HID support
> #
> CONFIG_I2C_HID=3Dy
> =

> #
> # Intel ISH HID support
> #
> CONFIG_INTEL_ISH_HID=3Dy
> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> CONFIG_USB_SUPPORT=3Dy
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> # CONFIG_USB is not set
> CONFIG_USB_PCI=3Dy
> =

> #
> # USB port drivers
> #
> =

> #
> # USB Physical Layer drivers
> #
> # CONFIG_USB_PHY is not set
> # CONFIG_NOP_USB_XCEIV is not set
> # CONFIG_USB_GPIO_VBUS is not set
> # CONFIG_TAHVO_USB is not set
> # CONFIG_USB_GADGET is not set
> =

> #
> # USB Power Delivery and Type-C drivers
> #
> # CONFIG_TYPEC_UCSI is not set
> # CONFIG_USB_LED_TRIG is not set
> # CONFIG_USB_ULPI_BUS is not set
> CONFIG_UWB=3Dy
> CONFIG_UWB_WHCI=3Dy
> CONFIG_MMC=3Dy
> CONFIG_MMC_BLOCK=3Dy
> CONFIG_MMC_BLOCK_MINORS=3D8
> # CONFIG_SDIO_UART is not set
> CONFIG_MMC_TEST=3Dy
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> CONFIG_MMC_DEBUG=3Dy
> CONFIG_MMC_SDHCI=3Dy
> CONFIG_MMC_SDHCI_PCI=3Dy
> CONFIG_MMC_RICOH_MMC=3Dy
> # CONFIG_MMC_SDHCI_ACPI is not set
> CONFIG_MMC_SDHCI_PLTFM=3Dy
> CONFIG_MMC_TIFM_SD=3Dy
> CONFIG_MMC_GOLDFISH=3Dy
> # CONFIG_MMC_SDRICOH_CS is not set
> CONFIG_MMC_CB710=3Dy
> CONFIG_MMC_VIA_SDMMC=3Dy
> CONFIG_MMC_USDHI6ROL0=3Dy
> CONFIG_MMC_TOSHIBA_PCI=3Dy
> CONFIG_MMC_MTK=3Dy
> CONFIG_MMC_SDHCI_XENON=3Dy
> # CONFIG_MEMSTICK is not set
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> CONFIG_LEDS_CLASS_FLASH=3Dy
> CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=3Dy
> =

> #
> # LED drivers
> #
> # CONFIG_LEDS_AS3645A is not set
> CONFIG_LEDS_LM3530=3Dy
> # CONFIG_LEDS_LM3533 is not set
> CONFIG_LEDS_LM3642=3Dy
> # CONFIG_LEDS_PCA9532 is not set
> # CONFIG_LEDS_GPIO is not set
> CONFIG_LEDS_LP3944=3Dy
> # CONFIG_LEDS_LP3952 is not set
> CONFIG_LEDS_LP55XX_COMMON=3Dy
> CONFIG_LEDS_LP5521=3Dy
> CONFIG_LEDS_LP5523=3Dy
> # CONFIG_LEDS_LP5562 is not set
> CONFIG_LEDS_LP8501=3Dy
> # CONFIG_LEDS_LP8788 is not set
> # CONFIG_LEDS_LP8860 is not set
> CONFIG_LEDS_PCA955X=3Dy
> CONFIG_LEDS_PCA955X_GPIO=3Dy
> # CONFIG_LEDS_PCA963X is not set
> # CONFIG_LEDS_WM8350 is not set
> CONFIG_LEDS_DA903X=3Dy
> CONFIG_LEDS_DA9052=3Dy
> CONFIG_LEDS_REGULATOR=3Dy
> # CONFIG_LEDS_BD2802 is not set
> CONFIG_LEDS_LT3593=3Dy
> # CONFIG_LEDS_TCA6507 is not set
> # CONFIG_LEDS_TLC591XX is not set
> # CONFIG_LEDS_MAX8997 is not set
> CONFIG_LEDS_LM355x=3Dy
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> CONFIG_LEDS_BLINKM=3Dy
> # CONFIG_LEDS_USER is not set
> # CONFIG_LEDS_NIC78BX is not set
> =

> #
> # LED Triggers
> #
> CONFIG_LEDS_TRIGGERS=3Dy
> # CONFIG_LEDS_TRIGGER_TIMER is not set
> # CONFIG_LEDS_TRIGGER_ONESHOT is not set
> # CONFIG_LEDS_TRIGGER_DISK is not set
> # CONFIG_LEDS_TRIGGER_MTD is not set
> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> # CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
> # CONFIG_LEDS_TRIGGER_CPU is not set
> # CONFIG_LEDS_TRIGGER_GPIO is not set
> CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dy
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> # CONFIG_LEDS_TRIGGER_TRANSIENT is not set
> # CONFIG_LEDS_TRIGGER_CAMERA is not set
> # CONFIG_LEDS_TRIGGER_PANIC is not set
> # CONFIG_ACCESSIBILITY is not set
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> # CONFIG_EDAC is not set
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_MC146818_LIB=3Dy
> CONFIG_RTC_CLASS=3Dy
> CONFIG_RTC_HCTOSYS=3Dy
> CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
> CONFIG_RTC_SYSTOHC=3Dy
> CONFIG_RTC_SYSTOHC_DEVICE=3D"rtc0"
> # CONFIG_RTC_DEBUG is not set
> CONFIG_RTC_NVMEM=3Dy
> =

> #
> # RTC interfaces
> #
> CONFIG_RTC_INTF_SYSFS=3Dy
> CONFIG_RTC_INTF_PROC=3Dy
> # CONFIG_RTC_INTF_DEV is not set
> CONFIG_RTC_DRV_TEST=3Dy
> =

> #
> # I2C RTC drivers
> #
> # CONFIG_RTC_DRV_88PM80X is not set
> CONFIG_RTC_DRV_ABB5ZES3=3Dy
> CONFIG_RTC_DRV_ABX80X=3Dy
> CONFIG_RTC_DRV_DS1307=3Dy
> CONFIG_RTC_DRV_DS1307_HWMON=3Dy
> CONFIG_RTC_DRV_DS1307_CENTURY=3Dy
> CONFIG_RTC_DRV_DS1374=3Dy
> CONFIG_RTC_DRV_DS1374_WDT=3Dy
> CONFIG_RTC_DRV_DS1672=3Dy
> CONFIG_RTC_DRV_LP8788=3Dy
> # CONFIG_RTC_DRV_MAX6900 is not set
> # CONFIG_RTC_DRV_MAX8907 is not set
> CONFIG_RTC_DRV_MAX8998=3Dy
> # CONFIG_RTC_DRV_MAX8997 is not set
> CONFIG_RTC_DRV_RS5C372=3Dy
> CONFIG_RTC_DRV_ISL1208=3Dy
> CONFIG_RTC_DRV_ISL12022=3Dy
> CONFIG_RTC_DRV_X1205=3Dy
> CONFIG_RTC_DRV_PCF8523=3Dy
> CONFIG_RTC_DRV_PCF85063=3Dy
> CONFIG_RTC_DRV_PCF8563=3Dy
> # CONFIG_RTC_DRV_PCF8583 is not set
> CONFIG_RTC_DRV_M41T80=3Dy
> CONFIG_RTC_DRV_M41T80_WDT=3Dy
> CONFIG_RTC_DRV_BQ32K=3Dy
> CONFIG_RTC_DRV_TPS65910=3Dy
> # CONFIG_RTC_DRV_S35390A is not set
> CONFIG_RTC_DRV_FM3130=3Dy
> CONFIG_RTC_DRV_RX8010=3Dy
> # CONFIG_RTC_DRV_RX8581 is not set
> # CONFIG_RTC_DRV_RX8025 is not set
> CONFIG_RTC_DRV_EM3027=3Dy
> CONFIG_RTC_DRV_RV8803=3Dy
> =

> #
> # SPI RTC drivers
> #
> CONFIG_RTC_I2C_AND_SPI=3Dy
> =

> #
> # SPI and I2C RTC drivers
> #
> CONFIG_RTC_DRV_DS3232=3Dy
> # CONFIG_RTC_DRV_DS3232_HWMON is not set
> CONFIG_RTC_DRV_PCF2127=3Dy
> CONFIG_RTC_DRV_RV3029C2=3Dy
> # CONFIG_RTC_DRV_RV3029_HWMON is not set
> =

> #
> # Platform RTC drivers
> #
> CONFIG_RTC_DRV_CMOS=3Dy
> CONFIG_RTC_DRV_DS1286=3Dy
> CONFIG_RTC_DRV_DS1511=3Dy
> CONFIG_RTC_DRV_DS1553=3Dy
> # CONFIG_RTC_DRV_DS1685_FAMILY is not set
> CONFIG_RTC_DRV_DS1742=3Dy
> CONFIG_RTC_DRV_DS2404=3Dy
> CONFIG_RTC_DRV_DA9052=3Dy
> # CONFIG_RTC_DRV_DA9063 is not set
> CONFIG_RTC_DRV_STK17TA8=3Dy
> CONFIG_RTC_DRV_M48T86=3Dy
> # CONFIG_RTC_DRV_M48T35 is not set
> # CONFIG_RTC_DRV_M48T59 is not set
> CONFIG_RTC_DRV_MSM6242=3Dy
> CONFIG_RTC_DRV_BQ4802=3Dy
> # CONFIG_RTC_DRV_RP5C01 is not set
> CONFIG_RTC_DRV_V3020=3Dy
> CONFIG_RTC_DRV_WM8350=3Dy
> CONFIG_RTC_DRV_PCF50633=3Dy
> CONFIG_RTC_DRV_AB3100=3Dy
> =

> #
> # on-CPU RTC drivers
> #
> CONFIG_RTC_DRV_FTRTC010=3Dy
> =

> #
> # HID Sensor RTC drivers
> #
> CONFIG_DMADEVICES=3Dy
> CONFIG_DMADEVICES_DEBUG=3Dy
> CONFIG_DMADEVICES_VDEBUG=3Dy
> =

> #
> # DMA Devices
> #
> CONFIG_DMA_ENGINE=3Dy
> CONFIG_DMA_VIRTUAL_CHANNELS=3Dy
> CONFIG_DMA_ACPI=3Dy
> CONFIG_ALTERA_MSGDMA=3Dy
> CONFIG_INTEL_IDMA64=3Dy
> # CONFIG_INTEL_IOATDMA is not set
> CONFIG_QCOM_HIDMA_MGMT=3Dy
> # CONFIG_QCOM_HIDMA is not set
> CONFIG_DW_DMAC_CORE=3Dy
> CONFIG_DW_DMAC=3Dy
> CONFIG_DW_DMAC_PCI=3Dy
> CONFIG_HSU_DMA=3Dy
> =

> #
> # DMA Clients
> #
> CONFIG_ASYNC_TX_DMA=3Dy
> CONFIG_DMATEST=3Dy
> CONFIG_DMA_ENGINE_RAID=3Dy
> =

> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=3Dy
> CONFIG_SW_SYNC=3Dy
> CONFIG_AUXDISPLAY=3Dy
> CONFIG_CHARLCD=3Dy
> CONFIG_HD44780=3Dy
> # CONFIG_KS0108 is not set
> # CONFIG_IMG_ASCII_LCD is not set
> CONFIG_PANEL=3Dy
> CONFIG_PANEL_PARPORT=3D0
> CONFIG_PANEL_PROFILE=3D5
> # CONFIG_PANEL_CHANGE_MESSAGE is not set
> # CONFIG_UIO is not set
> CONFIG_VFIO_IOMMU_TYPE1=3Dy
> CONFIG_VFIO_VIRQFD=3Dy
> CONFIG_VFIO=3Dy
> # CONFIG_VFIO_NOIOMMU is not set
> CONFIG_VFIO_PCI=3Dy
> # CONFIG_VFIO_PCI_VGA is not set
> CONFIG_VFIO_PCI_MMAP=3Dy
> CONFIG_VFIO_PCI_INTX=3Dy
> CONFIG_VFIO_PCI_IGD=3Dy
> CONFIG_VFIO_MDEV=3Dy
> CONFIG_VFIO_MDEV_DEVICE=3Dy
> CONFIG_IRQ_BYPASS_MANAGER=3Dy
> CONFIG_VIRT_DRIVERS=3Dy
> =

> #
> # Virtio drivers
> #
> # CONFIG_VIRTIO_PCI is not set
> # CONFIG_VIRTIO_MMIO is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> # CONFIG_HYPERV_TSCPAGE is not set
> =

> #
> # Xen driver support
> #
> # CONFIG_XEN_BALLOON is not set
> CONFIG_XEN_DEV_EVTCHN=3Dy
> CONFIG_XENFS=3Dy
> # CONFIG_XEN_COMPAT_XENFS is not set
> # CONFIG_XEN_SYS_HYPERVISOR is not set
> CONFIG_XEN_XENBUS_FRONTEND=3Dy
> CONFIG_XEN_GNTDEV=3Dy
> CONFIG_XEN_GRANT_DEV_ALLOC=3Dy
> CONFIG_SWIOTLB_XEN=3Dy
> CONFIG_XEN_PRIVCMD=3Dy
> # CONFIG_XEN_ACPI_PROCESSOR is not set
> CONFIG_XEN_HAVE_PVMMU=3Dy
> CONFIG_XEN_ACPI=3Dy
> CONFIG_XEN_HAVE_VPMU=3Dy
> CONFIG_STAGING=3Dy
> # CONFIG_IRDA is not set
> # CONFIG_COMEDI is not set
> CONFIG_RTS5208=3Dy
> =

> #
> # IIO staging drivers
> #
> =

> #
> # Accelerometers
> #
> =

> #
> # Analog to digital converters
> #
> CONFIG_AD7606=3Dy
> CONFIG_AD7606_IFACE_PARALLEL=3Dy
> =

> #
> # Analog digital bi-direction converters
> #
> # CONFIG_ADT7316 is not set
> =

> #
> # Capacitance to digital converters
> #
> # CONFIG_AD7150 is not set
> CONFIG_AD7152=3Dy
> CONFIG_AD7746=3Dy
> =

> #
> # Direct Digital Synthesis
> #
> =

> #
> # Digital gyroscope sensors
> #
> =

> #
> # Network Analyzer, Impedance Converters
> #
> # CONFIG_AD5933 is not set
> =

> #
> # Light sensors
> #
> # CONFIG_TSL2x7x is not set
> =

> #
> # Active energy metering IC
> #
> # CONFIG_ADE7854 is not set
> =

> #
> # Resolver to digital converters
> #
> =

> #
> # Triggers - standalone
> #
> # CONFIG_FB_SM750 is not set
> CONFIG_FB_XGI=3Dy
> =

> #
> # Speakup console speech
> #
> # CONFIG_STAGING_MEDIA is not set
> =

> #
> # Android
> #
> CONFIG_FIREWIRE_SERIAL=3Dy
> CONFIG_FWTTY_MAX_TOTAL_PORTS=3D64
> CONFIG_FWTTY_MAX_CARD_PORTS=3D32
> CONFIG_GOLDFISH_AUDIO=3Dy
> CONFIG_MTD_GOLDFISH_NAND=3Dy
> CONFIG_DGNC=3Dy
> CONFIG_GS_FPGABOOT=3Dy
> # CONFIG_CRYPTO_SKEIN is not set
> CONFIG_UNISYSSPAR=3Dy
> CONFIG_UNISYS_VISORBUS=3Dy
> # CONFIG_UNISYS_VISORNIC is not set
> CONFIG_UNISYS_VISORINPUT=3Dy
> # CONFIG_UNISYS_VISORHBA is not set
> CONFIG_MOST=3Dy
> CONFIG_MOSTCORE=3Dy
> CONFIG_AIM_CDEV=3Dy
> # CONFIG_AIM_NETWORK is not set
> CONFIG_HDM_DIM2=3Dy
> CONFIG_HDM_I2C=3Dy
> # CONFIG_KS7010 is not set
> CONFIG_GREYBUS=3Dy
> CONFIG_GREYBUS_AUDIO=3Dy
> CONFIG_GREYBUS_BOOTROM=3Dy
> CONFIG_GREYBUS_HID=3Dy
> CONFIG_GREYBUS_LIGHT=3Dy
> # CONFIG_GREYBUS_LOG is not set
> # CONFIG_GREYBUS_LOOPBACK is not set
> CONFIG_GREYBUS_POWER=3Dy
> # CONFIG_GREYBUS_RAW is not set
> CONFIG_GREYBUS_VIBRATOR=3Dy
> # CONFIG_GREYBUS_BRIDGED_PHY is not set
> =

> #
> # USB Power Delivery and Type-C drivers
> #
> CONFIG_X86_PLATFORM_DEVICES=3Dy
> # CONFIG_ACERHDF is not set
> CONFIG_ASUS_LAPTOP=3Dy
> CONFIG_DELL_SMO8800=3Dy
> # CONFIG_FUJITSU_LAPTOP is not set
> CONFIG_FUJITSU_TABLET=3Dy
> CONFIG_HP_ACCEL=3Dy
> CONFIG_HP_WIRELESS=3Dy
> CONFIG_PANASONIC_LAPTOP=3Dy
> # CONFIG_THINKPAD_ACPI is not set
> CONFIG_SENSORS_HDAPS=3Dy
> CONFIG_INTEL_MENLOW=3Dy
> CONFIG_EEEPC_LAPTOP=3Dy
> # CONFIG_ASUS_WIRELESS is not set
> # CONFIG_ACPI_WMI is not set
> CONFIG_TOPSTAR_LAPTOP=3Dy
> # CONFIG_TOSHIBA_BT_RFKILL is not set
> CONFIG_TOSHIBA_HAPS=3Dy
> CONFIG_ACPI_CMPC=3Dy
> CONFIG_INTEL_CHT_INT33FE=3Dy
> # CONFIG_INTEL_INT0002_VGPIO is not set
> CONFIG_INTEL_HID_EVENT=3Dy
> CONFIG_INTEL_VBTN=3Dy
> CONFIG_INTEL_IPS=3Dy
> CONFIG_INTEL_PMC_CORE=3Dy
> # CONFIG_IBM_RTL is not set
> # CONFIG_SAMSUNG_LAPTOP is not set
> CONFIG_SAMSUNG_Q10=3Dy
> # CONFIG_APPLE_GMUX is not set
> CONFIG_INTEL_RST=3Dy
> CONFIG_INTEL_SMARTCONNECT=3Dy
> # CONFIG_PVPANIC is not set
> # CONFIG_INTEL_PMC_IPC is not set
> CONFIG_SURFACE_PRO3_BUTTON=3Dy
> # CONFIG_SURFACE_3_BUTTON is not set
> # CONFIG_INTEL_PUNIT_IPC is not set
> CONFIG_MLX_PLATFORM=3Dy
> CONFIG_MLX_CPLD_PLATFORM=3Dy
> CONFIG_PMC_ATOM=3Dy
> # CONFIG_GOLDFISH_BUS is not set
> # CONFIG_GOLDFISH_PIPE is not set
> CONFIG_CHROME_PLATFORMS=3Dy
> # CONFIG_CHROMEOS_PSTORE is not set
> CONFIG_CROS_EC_CHARDEV=3Dy
> CONFIG_CROS_EC_LPC=3Dy
> CONFIG_CROS_EC_LPC_MEC=3Dy
> CONFIG_CROS_EC_PROTO=3Dy
> CONFIG_CROS_KBD_LED_BACKLIGHT=3Dy
> CONFIG_CLKDEV_LOOKUP=3Dy
> CONFIG_HAVE_CLK_PREPARE=3Dy
> CONFIG_COMMON_CLK=3Dy
> =

> #
> # Common Clock Framework
> #
> # CONFIG_COMMON_CLK_SI5351 is not set
> # CONFIG_COMMON_CLK_CDCE706 is not set
> CONFIG_COMMON_CLK_CS2000_CP=3Dy
> # CONFIG_COMMON_CLK_NXP is not set
> # CONFIG_COMMON_CLK_PXA is not set
> # CONFIG_COMMON_CLK_PIC32 is not set
> CONFIG_HWSPINLOCK=3Dy
> =

> #
> # Clock Source drivers
> #
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_I8253_LOCK=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # CONFIG_ATMEL_PIT is not set
> # CONFIG_SH_TIMER_CMT is not set
> # CONFIG_SH_TIMER_MTU2 is not set
> # CONFIG_SH_TIMER_TMU is not set
> # CONFIG_EM_TIMER_STI is not set
> # CONFIG_MAILBOX is not set
> CONFIG_IOMMU_API=3Dy
> CONFIG_IOMMU_SUPPORT=3Dy
> =

> #
> # Generic IOMMU Pagetable Support
> #
> CONFIG_IOMMU_IOVA=3Dy
> # CONFIG_AMD_IOMMU is not set
> CONFIG_DMAR_TABLE=3Dy
> CONFIG_INTEL_IOMMU=3Dy
> # CONFIG_INTEL_IOMMU_SVM is not set
> CONFIG_INTEL_IOMMU_DEFAULT_ON=3Dy
> CONFIG_INTEL_IOMMU_FLOPPY_WA=3Dy
> CONFIG_IRQ_REMAP=3Dy
> =

> #
> # Remoteproc drivers
> #
> # CONFIG_REMOTEPROC is not set
> =

> #
> # Rpmsg drivers
> #
> =

> #
> # SOC (System On Chip) specific Drivers
> #
> =

> #
> # Amlogic SoC drivers
> #
> =

> #
> # Broadcom SoC drivers
> #
> =

> #
> # i.MX SoC drivers
> #
> =

> #
> # Qualcomm SoC drivers
> #
> # CONFIG_SUNXI_SRAM is not set
> # CONFIG_SOC_TI is not set
> CONFIG_PM_DEVFREQ=3Dy
> =

> #
> # DEVFREQ Governors
> #
> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
> CONFIG_DEVFREQ_GOV_PERFORMANCE=3Dy
> CONFIG_DEVFREQ_GOV_POWERSAVE=3Dy
> CONFIG_DEVFREQ_GOV_USERSPACE=3Dy
> CONFIG_DEVFREQ_GOV_PASSIVE=3Dy
> =

> #
> # DEVFREQ Drivers
> #
> CONFIG_PM_DEVFREQ_EVENT=3Dy
> # CONFIG_EXTCON is not set
> # CONFIG_MEMORY is not set
> CONFIG_IIO=3Dy
> CONFIG_IIO_BUFFER=3Dy
> CONFIG_IIO_BUFFER_CB=3Dy
> CONFIG_IIO_KFIFO_BUF=3Dy
> CONFIG_IIO_TRIGGERED_BUFFER=3Dy
> CONFIG_IIO_CONFIGFS=3Dy
> CONFIG_IIO_TRIGGER=3Dy
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> CONFIG_IIO_SW_DEVICE=3Dy
> # CONFIG_IIO_SW_TRIGGER is not set
> =

> #
> # Accelerometers
> #
> CONFIG_ADXL345=3Dy
> CONFIG_ADXL345_I2C=3Dy
> CONFIG_BMA180=3Dy
> # CONFIG_BMC150_ACCEL is not set
> CONFIG_DA280=3Dy
> CONFIG_DA311=3Dy
> # CONFIG_DMARD09 is not set
> # CONFIG_DMARD10 is not set
> # CONFIG_IIO_ST_ACCEL_3AXIS is not set
> CONFIG_KXSD9=3Dy
> # CONFIG_KXSD9_I2C is not set
> CONFIG_KXCJK1013=3Dy
> CONFIG_MC3230=3Dy
> CONFIG_MMA7455=3Dy
> CONFIG_MMA7455_I2C=3Dy
> # CONFIG_MMA7660 is not set
> CONFIG_MMA8452=3Dy
> CONFIG_MMA9551_CORE=3Dy
> # CONFIG_MMA9551 is not set
> CONFIG_MMA9553=3Dy
> # CONFIG_MXC4005 is not set
> CONFIG_MXC6255=3Dy
> CONFIG_STK8312=3Dy
> # CONFIG_STK8BA50 is not set
> =

> #
> # Analog to digital converters
> #
> # CONFIG_AD7291 is not set
> CONFIG_AD799X=3Dy
> CONFIG_CC10001_ADC=3Dy
> # CONFIG_DA9150_GPADC is not set
> CONFIG_HX711=3Dy
> CONFIG_LP8788_ADC=3Dy
> CONFIG_LTC2471=3Dy
> CONFIG_LTC2485=3Dy
> CONFIG_LTC2497=3Dy
> # CONFIG_MAX1363 is not set
> # CONFIG_MAX9611 is not set
> CONFIG_MCP3422=3Dy
> CONFIG_MEN_Z188_ADC=3Dy
> # CONFIG_NAU7802 is not set
> CONFIG_QCOM_VADC_COMMON=3Dy
> # CONFIG_QCOM_SPMI_IADC is not set
> CONFIG_QCOM_SPMI_VADC=3Dy
> CONFIG_STX104=3Dy
> # CONFIG_TI_ADC081C is not set
> # CONFIG_TWL4030_MADC is not set
> # CONFIG_TWL6030_GPADC is not set
> =

> #
> # Amplifiers
> #
> =

> #
> # Chemical Sensors
> #
> CONFIG_ATLAS_PH_SENSOR=3Dy
> CONFIG_CCS811=3Dy
> CONFIG_IAQCORE=3Dy
> # CONFIG_VZ89X is not set
> CONFIG_IIO_CROS_EC_SENSORS_CORE=3Dy
> CONFIG_IIO_CROS_EC_SENSORS=3Dy
> =

> #
> # Hid Sensor IIO Common
> #
> CONFIG_IIO_MS_SENSORS_I2C=3Dy
> =

> #
> # SSP Sensor Common
> #
> =

> #
> # Counters
> #
> # CONFIG_104_QUAD_8 is not set
> =

> #
> # Digital to analog converters
> #
> CONFIG_AD5064=3Dy
> CONFIG_AD5380=3Dy
> # CONFIG_AD5446 is not set
> CONFIG_AD5592R_BASE=3Dy
> CONFIG_AD5593R=3Dy
> CONFIG_CIO_DAC=3Dy
> # CONFIG_M62332 is not set
> CONFIG_MAX517=3Dy
> # CONFIG_MCP4725 is not set
> =

> #
> # IIO dummy driver
> #
> # CONFIG_IIO_SIMPLE_DUMMY is not set
> =

> #
> # Frequency Synthesizers DDS/PLL
> #
> =

> #
> # Clock Generator/Distribution
> #
> =

> #
> # Phase-Locked Loop (PLL) frequency synthesizers
> #
> =

> #
> # Digital gyroscope sensors
> #
> CONFIG_BMG160=3Dy
> CONFIG_BMG160_I2C=3Dy
> CONFIG_MPU3050=3Dy
> CONFIG_MPU3050_I2C=3Dy
> # CONFIG_IIO_ST_GYRO_3AXIS is not set
> # CONFIG_ITG3200 is not set
> =

> #
> # Health Sensors
> #
> =

> #
> # Heart Rate Monitors
> #
> # CONFIG_AFE4404 is not set
> CONFIG_MAX30100=3Dy
> CONFIG_MAX30102=3Dy
> =

> #
> # Humidity sensors
> #
> # CONFIG_AM2315 is not set
> CONFIG_DHT11=3Dy
> # CONFIG_HDC100X is not set
> CONFIG_HTS221=3Dy
> CONFIG_HTS221_I2C=3Dy
> CONFIG_HTU21=3Dy
> CONFIG_SI7005=3Dy
> CONFIG_SI7020=3Dy
> =

> #
> # Inertial measurement units
> #
> CONFIG_BMI160=3Dy
> CONFIG_BMI160_I2C=3Dy
> CONFIG_KMX61=3Dy
> CONFIG_INV_MPU6050_IIO=3Dy
> CONFIG_INV_MPU6050_I2C=3Dy
> # CONFIG_IIO_ST_LSM6DSX is not set
> =

> #
> # Light sensors
> #
> # CONFIG_ACPI_ALS is not set
> CONFIG_ADJD_S311=3Dy
> CONFIG_AL3320A=3Dy
> # CONFIG_APDS9300 is not set
> CONFIG_APDS9960=3Dy
> CONFIG_BH1750=3Dy
> # CONFIG_BH1780 is not set
> CONFIG_CM32181=3Dy
> # CONFIG_CM3232 is not set
> CONFIG_CM3323=3Dy
> CONFIG_CM36651=3Dy
> CONFIG_IIO_CROS_EC_LIGHT_PROX=3Dy
> CONFIG_GP2AP020A00F=3Dy
> # CONFIG_SENSORS_ISL29018 is not set
> CONFIG_SENSORS_ISL29028=3Dy
> CONFIG_ISL29125=3Dy
> CONFIG_JSA1212=3Dy
> # CONFIG_RPR0521 is not set
> # CONFIG_SENSORS_LM3533 is not set
> # CONFIG_LTR501 is not set
> CONFIG_MAX44000=3Dy
> CONFIG_OPT3001=3Dy
> CONFIG_PA12203001=3Dy
> CONFIG_SI1145=3Dy
> # CONFIG_STK3310 is not set
> CONFIG_TCS3414=3Dy
> CONFIG_TCS3472=3Dy
> CONFIG_SENSORS_TSL2563=3Dy
> CONFIG_TSL2583=3Dy
> CONFIG_TSL4531=3Dy
> CONFIG_US5182D=3Dy
> CONFIG_VCNL4000=3Dy
> # CONFIG_VEML6070 is not set
> CONFIG_VL6180=3Dy
> =

> #
> # Magnetometer sensors
> #
> CONFIG_AK8975=3Dy
> CONFIG_AK09911=3Dy
> # CONFIG_BMC150_MAGN_I2C is not set
> CONFIG_MAG3110=3Dy
> CONFIG_MMC35240=3Dy
> # CONFIG_IIO_ST_MAGN_3AXIS is not set
> # CONFIG_SENSORS_HMC5843_I2C is not set
> =

> #
> # Multiplexers
> #
> =

> #
> # Inclinometer sensors
> #
> =

> #
> # Triggers - standalone
> #
> CONFIG_IIO_INTERRUPT_TRIGGER=3Dy
> # CONFIG_IIO_SYSFS_TRIGGER is not set
> =

> #
> # Digital potentiometers
> #
> CONFIG_DS1803=3Dy
> # CONFIG_MCP4531 is not set
> CONFIG_TPL0102=3Dy
> =

> #
> # Digital potentiostats
> #
> CONFIG_LMP91000=3Dy
> =

> #
> # Pressure sensors
> #
> CONFIG_ABP060MG=3Dy
> CONFIG_BMP280=3Dy
> CONFIG_BMP280_I2C=3Dy
> # CONFIG_IIO_CROS_EC_BARO is not set
> # CONFIG_HP03 is not set
> CONFIG_MPL115=3Dy
> CONFIG_MPL115_I2C=3Dy
> CONFIG_MPL3115=3Dy
> CONFIG_MS5611=3Dy
> CONFIG_MS5611_I2C=3Dy
> CONFIG_MS5637=3Dy
> # CONFIG_IIO_ST_PRESS is not set
> CONFIG_T5403=3Dy
> # CONFIG_HP206C is not set
> # CONFIG_ZPA2326 is not set
> =

> #
> # Lightning sensors
> #
> =

> #
> # Proximity and distance sensors
> #
> # CONFIG_LIDAR_LITE_V2 is not set
> CONFIG_SRF04=3Dy
> # CONFIG_SX9500 is not set
> CONFIG_SRF08=3Dy
> =

> #
> # Temperature sensors
> #
> CONFIG_MLX90614=3Dy
> # CONFIG_TMP006 is not set
> CONFIG_TMP007=3Dy
> # CONFIG_TSYS01 is not set
> # CONFIG_TSYS02D is not set
> CONFIG_NTB=3Dy
> # CONFIG_NTB_AMD is not set
> CONFIG_NTB_IDT=3Dy
> CONFIG_NTB_INTEL=3Dy
> CONFIG_NTB_PINGPONG=3Dy
> CONFIG_NTB_TOOL=3Dy
> # CONFIG_NTB_PERF is not set
> CONFIG_NTB_TRANSPORT=3Dy
> CONFIG_VME_BUS=3Dy
> =

> #
> # VME Bridge Drivers
> #
> CONFIG_VME_CA91CX42=3Dy
> # CONFIG_VME_TSI148 is not set
> CONFIG_VME_FAKE=3Dy
> =

> #
> # VME Board Drivers
> #
> CONFIG_VMIVME_7805=3Dy
> =

> #
> # VME Device Drivers
> #
> CONFIG_VME_USER=3Dy
> CONFIG_VME_PIO2=3Dy
> # CONFIG_PWM is not set
> =

> #
> # IRQ chip support
> #
> CONFIG_ARM_GIC_MAX_NR=3D1
> # CONFIG_IPACK_BUS is not set
> # CONFIG_RESET_CONTROLLER is not set
> CONFIG_FMC=3Dy
> CONFIG_FMC_FAKEDEV=3Dy
> # CONFIG_FMC_TRIVIAL is not set
> CONFIG_FMC_WRITE_EEPROM=3Dy
> CONFIG_FMC_CHARDEV=3Dy
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> # CONFIG_BCM_KONA_USB2_PHY is not set
> CONFIG_PHY_PXA_28NM_HSIC=3Dy
> CONFIG_PHY_PXA_28NM_USB2=3Dy
> # CONFIG_PHY_CPCAP_USB is not set
> CONFIG_POWERCAP=3Dy
> # CONFIG_INTEL_RAPL is not set
> CONFIG_MCB=3Dy
> CONFIG_MCB_PCI=3Dy
> CONFIG_MCB_LPC=3Dy
> =

> #
> # Performance monitor support
> #
> CONFIG_RAS=3Dy
> CONFIG_THUNDERBOLT=3Dy
> =

> #
> # Android
> #
> # CONFIG_ANDROID is not set
> # CONFIG_LIBNVDIMM is not set
> CONFIG_DAX=3Dy
> CONFIG_NVMEM=3Dy
> # CONFIG_STM is not set
> CONFIG_INTEL_TH=3Dy
> CONFIG_INTEL_TH_PCI=3Dy
> CONFIG_INTEL_TH_GTH=3Dy
> CONFIG_INTEL_TH_MSU=3Dy
> CONFIG_INTEL_TH_PTI=3Dy
> CONFIG_INTEL_TH_DEBUG=3Dy
> # CONFIG_FPGA is not set
> =

> #
> # FSI support
> #
> CONFIG_FSI=3Dy
> CONFIG_FSI_MASTER_GPIO=3Dy
> # CONFIG_FSI_MASTER_HUB is not set
> CONFIG_FSI_SCOM=3Dy
> =

> #
> # Firmware Drivers
> #
> CONFIG_EDD=3Dy
> CONFIG_EDD_OFF=3Dy
> # CONFIG_FIRMWARE_MEMMAP is not set
> # CONFIG_DELL_RBU is not set
> CONFIG_DCDBAS=3Dy
> CONFIG_ISCSI_IBFT_FIND=3Dy
> CONFIG_ISCSI_IBFT=3Dy
> # CONFIG_FW_CFG_SYSFS is not set
> CONFIG_GOOGLE_FIRMWARE=3Dy
> # CONFIG_GOOGLE_COREBOOT_TABLE_ACPI is not set
> CONFIG_UEFI_CPER=3Dy
> # CONFIG_EFI_DEV_PATH_PARSER is not set
> =

> #
> # Tegra firmware driver
> #
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> CONFIG_FS_IOMAP=3Dy
> CONFIG_EXT2_FS=3Dy
> CONFIG_EXT2_FS_XATTR=3Dy
> CONFIG_EXT2_FS_POSIX_ACL=3Dy
> # CONFIG_EXT2_FS_SECURITY is not set
> # CONFIG_EXT3_FS is not set
> CONFIG_EXT4_FS=3Dy
> # CONFIG_EXT4_FS_POSIX_ACL is not set
> CONFIG_EXT4_FS_SECURITY=3Dy
> CONFIG_EXT4_ENCRYPTION=3Dy
> CONFIG_EXT4_FS_ENCRYPTION=3Dy
> CONFIG_EXT4_DEBUG=3Dy
> CONFIG_JBD2=3Dy
> # CONFIG_JBD2_DEBUG is not set
> CONFIG_FS_MBCACHE=3Dy
> CONFIG_REISERFS_FS=3Dy
> CONFIG_REISERFS_CHECK=3Dy
> # CONFIG_REISERFS_PROC_INFO is not set
> # CONFIG_REISERFS_FS_XATTR is not set
> # CONFIG_JFS_FS is not set
> CONFIG_XFS_FS=3Dy
> # CONFIG_XFS_QUOTA is not set
> # CONFIG_XFS_POSIX_ACL is not set
> # CONFIG_XFS_RT is not set
> CONFIG_XFS_WARN=3Dy
> # CONFIG_XFS_DEBUG is not set
> CONFIG_GFS2_FS=3Dy
> # CONFIG_OCFS2_FS is not set
> CONFIG_BTRFS_FS=3Dy
> # CONFIG_BTRFS_FS_POSIX_ACL is not set
> # CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
> # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> CONFIG_BTRFS_DEBUG=3Dy
> # CONFIG_BTRFS_ASSERT is not set
> # CONFIG_NILFS2_FS is not set
> CONFIG_F2FS_FS=3Dy
> CONFIG_F2FS_STAT_FS=3Dy
> CONFIG_F2FS_FS_XATTR=3Dy
> # CONFIG_F2FS_FS_POSIX_ACL is not set
> # CONFIG_F2FS_FS_SECURITY is not set
> # CONFIG_F2FS_CHECK_FS is not set
> # CONFIG_F2FS_FS_ENCRYPTION is not set
> # CONFIG_F2FS_FAULT_INJECTION is not set
> # CONFIG_FS_DAX is not set
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> # CONFIG_EXPORTFS_BLOCK_OPS is not set
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_MANDATORY_FILE_LOCKING=3Dy
> CONFIG_FS_ENCRYPTION=3Dy
> CONFIG_FSNOTIFY=3Dy
> # CONFIG_DNOTIFY is not set
> CONFIG_INOTIFY_USER=3Dy
> # CONFIG_FANOTIFY is not set
> CONFIG_QUOTA=3Dy
> # CONFIG_QUOTA_NETLINK_INTERFACE is not set
> CONFIG_PRINT_QUOTA_WARNING=3Dy
> # CONFIG_QUOTA_DEBUG is not set
> # CONFIG_QFMT_V1 is not set
> # CONFIG_QFMT_V2 is not set
> CONFIG_QUOTACTL=3Dy
> CONFIG_AUTOFS4_FS=3Dy
> CONFIG_FUSE_FS=3Dy
> CONFIG_CUSE=3Dy
> # CONFIG_OVERLAY_FS is not set
> =

> #
> # Caches
> #
> CONFIG_FSCACHE=3Dy
> # CONFIG_FSCACHE_STATS is not set
> # CONFIG_FSCACHE_HISTOGRAM is not set
> # CONFIG_FSCACHE_DEBUG is not set
> # CONFIG_FSCACHE_OBJECT_LIST is not set
> CONFIG_CACHEFILES=3Dy
> # CONFIG_CACHEFILES_DEBUG is not set
> # CONFIG_CACHEFILES_HISTOGRAM is not set
> =

> #
> # CD-ROM/DVD Filesystems
> #
> # CONFIG_ISO9660_FS is not set
> CONFIG_UDF_FS=3Dy
> CONFIG_UDF_NLS=3Dy
> =

> #
> # DOS/FAT/NT Filesystems
> #
> CONFIG_FAT_FS=3Dy
> CONFIG_MSDOS_FS=3Dy
> CONFIG_VFAT_FS=3Dy
> CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
> CONFIG_FAT_DEFAULT_UTF8=3Dy
> CONFIG_NTFS_FS=3Dy
> CONFIG_NTFS_DEBUG=3Dy
> CONFIG_NTFS_RW=3Dy
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> # CONFIG_PROC_KCORE is not set
> CONFIG_PROC_SYSCTL=3Dy
> CONFIG_PROC_PAGE_MONITOR=3Dy
> CONFIG_PROC_CHILDREN=3Dy
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_HUGETLBFS=3Dy
> CONFIG_HUGETLB_PAGE=3Dy
> CONFIG_ARCH_HAS_GIGANTIC_PAGE=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> CONFIG_MISC_FILESYSTEMS=3Dy
> CONFIG_ORANGEFS_FS=3Dy
> CONFIG_ADFS_FS=3Dy
> CONFIG_ADFS_FS_RW=3Dy
> CONFIG_AFFS_FS=3Dy
> # CONFIG_ECRYPT_FS is not set
> CONFIG_HFS_FS=3Dy
> CONFIG_HFSPLUS_FS=3Dy
> # CONFIG_HFSPLUS_FS_POSIX_ACL is not set
> # CONFIG_BEFS_FS is not set
> CONFIG_BFS_FS=3Dy
> # CONFIG_EFS_FS is not set
> # CONFIG_JFFS2_FS is not set
> CONFIG_UBIFS_FS=3Dy
> # CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
> CONFIG_UBIFS_FS_LZO=3Dy
> CONFIG_UBIFS_FS_ZLIB=3Dy
> # CONFIG_UBIFS_ATIME_SUPPORT is not set
> # CONFIG_UBIFS_FS_ENCRYPTION is not set
> CONFIG_UBIFS_FS_SECURITY=3Dy
> CONFIG_CRAMFS=3Dy
> CONFIG_SQUASHFS=3Dy
> # CONFIG_SQUASHFS_FILE_CACHE is not set
> CONFIG_SQUASHFS_FILE_DIRECT=3Dy
> # CONFIG_SQUASHFS_DECOMP_SINGLE is not set
> # CONFIG_SQUASHFS_DECOMP_MULTI is not set
> CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=3Dy
> # CONFIG_SQUASHFS_XATTR is not set
> CONFIG_SQUASHFS_ZLIB=3Dy
> CONFIG_SQUASHFS_LZ4=3Dy
> # CONFIG_SQUASHFS_LZO is not set
> # CONFIG_SQUASHFS_XZ is not set
> CONFIG_SQUASHFS_ZSTD=3Dy
> CONFIG_SQUASHFS_4K_DEVBLK_SIZE=3Dy
> # CONFIG_SQUASHFS_EMBEDDED is not set
> CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3D3
> # CONFIG_VXFS_FS is not set
> # CONFIG_MINIX_FS is not set
> CONFIG_OMFS_FS=3Dy
> CONFIG_HPFS_FS=3Dy
> # CONFIG_QNX4FS_FS is not set
> CONFIG_QNX6FS_FS=3Dy
> # CONFIG_QNX6FS_DEBUG is not set
> # CONFIG_ROMFS_FS is not set
> CONFIG_PSTORE=3Dy
> CONFIG_PSTORE_ZLIB_COMPRESS=3Dy
> # CONFIG_PSTORE_LZO_COMPRESS is not set
> # CONFIG_PSTORE_LZ4_COMPRESS is not set
> # CONFIG_PSTORE_CONSOLE is not set
> # CONFIG_PSTORE_PMSG is not set
> CONFIG_PSTORE_RAM=3Dy
> CONFIG_SYSV_FS=3Dy
> CONFIG_UFS_FS=3Dy
> # CONFIG_UFS_FS_WRITE is not set
> # CONFIG_UFS_DEBUG is not set
> CONFIG_EXOFS_FS=3Dy
> # CONFIG_EXOFS_DEBUG is not set
> CONFIG_ORE=3Dy
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> # CONFIG_NLS_CODEPAGE_437 is not set
> CONFIG_NLS_CODEPAGE_737=3Dy
> CONFIG_NLS_CODEPAGE_775=3Dy
> CONFIG_NLS_CODEPAGE_850=3Dy
> # CONFIG_NLS_CODEPAGE_852 is not set
> # CONFIG_NLS_CODEPAGE_855 is not set
> CONFIG_NLS_CODEPAGE_857=3Dy
> # CONFIG_NLS_CODEPAGE_860 is not set
> CONFIG_NLS_CODEPAGE_861=3Dy
> # CONFIG_NLS_CODEPAGE_862 is not set
> CONFIG_NLS_CODEPAGE_863=3Dy
> # CONFIG_NLS_CODEPAGE_864 is not set
> CONFIG_NLS_CODEPAGE_865=3Dy
> CONFIG_NLS_CODEPAGE_866=3Dy
> CONFIG_NLS_CODEPAGE_869=3Dy
> CONFIG_NLS_CODEPAGE_936=3Dy
> CONFIG_NLS_CODEPAGE_950=3Dy
> # CONFIG_NLS_CODEPAGE_932 is not set
> # CONFIG_NLS_CODEPAGE_949 is not set
> CONFIG_NLS_CODEPAGE_874=3Dy
> # CONFIG_NLS_ISO8859_8 is not set
> CONFIG_NLS_CODEPAGE_1250=3Dy
> CONFIG_NLS_CODEPAGE_1251=3Dy
> CONFIG_NLS_ASCII=3Dy
> # CONFIG_NLS_ISO8859_1 is not set
> CONFIG_NLS_ISO8859_2=3Dy
> CONFIG_NLS_ISO8859_3=3Dy
> CONFIG_NLS_ISO8859_4=3Dy
> CONFIG_NLS_ISO8859_5=3Dy
> # CONFIG_NLS_ISO8859_6 is not set
> CONFIG_NLS_ISO8859_7=3Dy
> CONFIG_NLS_ISO8859_9=3Dy
> CONFIG_NLS_ISO8859_13=3Dy
> CONFIG_NLS_ISO8859_14=3Dy
> # CONFIG_NLS_ISO8859_15 is not set
> CONFIG_NLS_KOI8_R=3Dy
> CONFIG_NLS_KOI8_U=3Dy
> # CONFIG_NLS_MAC_ROMAN is not set
> CONFIG_NLS_MAC_CELTIC=3Dy
> # CONFIG_NLS_MAC_CENTEURO is not set
> # CONFIG_NLS_MAC_CROATIAN is not set
> CONFIG_NLS_MAC_CYRILLIC=3Dy
> CONFIG_NLS_MAC_GAELIC=3Dy
> CONFIG_NLS_MAC_GREEK=3Dy
> CONFIG_NLS_MAC_ICELAND=3Dy
> CONFIG_NLS_MAC_INUIT=3Dy
> # CONFIG_NLS_MAC_ROMANIAN is not set
> CONFIG_NLS_MAC_TURKISH=3Dy
> CONFIG_NLS_UTF8=3Dy
> =

> #
> # Kernel hacking
> #
> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> =

> #
> # printk and dmesg options
> #
> CONFIG_PRINTK_TIME=3Dy
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> # CONFIG_BOOT_PRINTK_DELAY is not set
> CONFIG_DYNAMIC_DEBUG=3Dy
> =

> #
> # Compile-time checks and compiler options
> #
> CONFIG_DEBUG_INFO=3Dy
> CONFIG_DEBUG_INFO_REDUCED=3Dy
> # CONFIG_DEBUG_INFO_SPLIT is not set
> CONFIG_DEBUG_INFO_DWARF4=3Dy
> CONFIG_GDB_SCRIPTS=3Dy
> # CONFIG_ENABLE_WARN_DEPRECATED is not set
> CONFIG_ENABLE_MUST_CHECK=3Dy
> CONFIG_FRAME_WARN=3D2048
> # CONFIG_STRIP_ASM_SYMS is not set
> # CONFIG_READABLE_ASM is not set
> CONFIG_UNUSED_SYMBOLS=3Dy
> CONFIG_PAGE_OWNER=3Dy
> CONFIG_DEBUG_FS=3Dy
> CONFIG_HEADERS_CHECK=3Dy
> # CONFIG_DEBUG_SECTION_MISMATCH is not set
> # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
> CONFIG_STACK_VALIDATION=3Dy
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> CONFIG_MAGIC_SYSRQ=3Dy
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> # CONFIG_MAGIC_SYSRQ_SERIAL is not set
> CONFIG_DEBUG_KERNEL=3Dy
> =

> #
> # Memory Debugging
> #
> CONFIG_PAGE_EXTENSION=3Dy
> # CONFIG_DEBUG_PAGEALLOC is not set
> CONFIG_PAGE_POISONING=3Dy
> # CONFIG_PAGE_POISONING_NO_SANITY is not set
> # CONFIG_PAGE_POISONING_ZERO is not set
> CONFIG_DEBUG_RODATA_TEST=3Dy
> CONFIG_DEBUG_OBJECTS=3Dy
> CONFIG_DEBUG_OBJECTS_SELFTEST=3Dy
> CONFIG_DEBUG_OBJECTS_FREE=3Dy
> # CONFIG_DEBUG_OBJECTS_TIMERS is not set
> CONFIG_DEBUG_OBJECTS_WORK=3Dy
> CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dy
> CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=3Dy
> CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D1
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> # CONFIG_DEBUG_STACK_USAGE is not set
> CONFIG_DEBUG_VM=3Dy
> CONFIG_DEBUG_VM_VMACACHE=3Dy
> # CONFIG_DEBUG_VM_RB is not set
> CONFIG_DEBUG_VM_PGFLAGS=3Dy
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> # CONFIG_DEBUG_VIRTUAL is not set
> CONFIG_DEBUG_MEMORY_INIT=3Dy
> CONFIG_MEMORY_NOTIFIER_ERROR_INJECT=3Dy
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> # CONFIG_DEBUG_STACKOVERFLOW is not set
> CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
> CONFIG_HAVE_ARCH_KASAN=3Dy
> CONFIG_ARCH_HAS_KCOV=3Dy
> # CONFIG_KCOV is not set
> # CONFIG_DEBUG_SHIRQ is not set
> =

> #
> # Debug Lockups and Hangs
> #
> # CONFIG_SOFTLOCKUP_DETECTOR is not set
> CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=3Dy
> # CONFIG_HARDLOCKUP_DETECTOR is not set
> CONFIG_DETECT_HUNG_TASK=3Dy
> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D120
> # CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D0
> CONFIG_WQ_WATCHDOG=3Dy
> # CONFIG_PANIC_ON_OOPS is not set
> CONFIG_PANIC_ON_OOPS_VALUE=3D0
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_SCHED_DEBUG=3Dy
> # CONFIG_SCHED_INFO is not set
> # CONFIG_SCHEDSTATS is not set
> # CONFIG_SCHED_STACK_END_CHECK is not set
> # CONFIG_DEBUG_TIMEKEEPING is not set
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_DEBUG_RT_MUTEXES=3Dy
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> # CONFIG_PROVE_LOCKING is not set
> CONFIG_LOCKDEP=3Dy
> # CONFIG_LOCK_STAT is not set
> CONFIG_DEBUG_LOCKDEP=3Dy
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> CONFIG_LOCK_TORTURE_TEST=3Dy
> CONFIG_WW_MUTEX_SELFTEST=3Dy
> CONFIG_STACKTRACE=3Dy
> CONFIG_WARN_ALL_UNSEEDED_RANDOM=3Dy
> # CONFIG_DEBUG_KOBJECT is not set
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> CONFIG_DEBUG_LIST=3Dy
> CONFIG_DEBUG_PI_LIST=3Dy
> # CONFIG_DEBUG_SG is not set
> # CONFIG_DEBUG_NOTIFIERS is not set
> CONFIG_DEBUG_CREDENTIALS=3Dy
> =

> #
> # RCU Debugging
> #
> # CONFIG_PROVE_RCU is not set
> CONFIG_TORTURE_TEST=3Dy
> # CONFIG_RCU_PERF_TEST is not set
> CONFIG_RCU_TORTURE_TEST=3Dy
> # CONFIG_RCU_TRACE is not set
> CONFIG_RCU_EQS_DEBUG=3Dy
> CONFIG_DEBUG_WQ_FORCE_RR_CPU=3Dy
> # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> CONFIG_NOTIFIER_ERROR_INJECTION=3Dy
> # CONFIG_PM_NOTIFIER_ERROR_INJECT is not set
> # CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
> CONFIG_FAULT_INJECTION=3Dy
> # CONFIG_FAIL_PAGE_ALLOC is not set
> CONFIG_FAIL_MAKE_REQUEST=3Dy
> # CONFIG_FAIL_IO_TIMEOUT is not set
> # CONFIG_FAIL_MMC_REQUEST is not set
> # CONFIG_FAIL_FUTEX is not set
> CONFIG_FAULT_INJECTION_DEBUG_FS=3Dy
> # CONFIG_LATENCYTOP is not set
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_FENTRY=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> # CONFIG_FTRACE is not set
> CONFIG_PROVIDE_OHCI1394_DMA_INIT=3Dy
> # CONFIG_DMA_API_DEBUG is not set
> =

> #
> # Runtime Testing
> #
> # CONFIG_LKDTM is not set
> # CONFIG_TEST_LIST_SORT is not set
> CONFIG_TEST_SORT=3Dy
> # CONFIG_BACKTRACE_SELF_TEST is not set
> CONFIG_RBTREE_TEST=3Dy
> CONFIG_INTERVAL_TREE_TEST=3Dy
> CONFIG_ATOMIC64_SELFTEST=3Dy
> # CONFIG_TEST_HEXDUMP is not set
> CONFIG_TEST_STRING_HELPERS=3Dy
> # CONFIG_TEST_KSTRTOX is not set
> # CONFIG_TEST_PRINTF is not set
> CONFIG_TEST_BITMAP=3Dy
> # CONFIG_TEST_UUID is not set
> CONFIG_TEST_RHASHTABLE=3Dy
> # CONFIG_TEST_HASH is not set
> # CONFIG_TEST_FIRMWARE is not set
> # CONFIG_TEST_SYSCTL is not set
> # CONFIG_TEST_UDELAY is not set
> CONFIG_MEMTEST=3Dy
> # CONFIG_BUG_ON_DATA_CORRUPTION is not set
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> # CONFIG_ARCH_WANTS_UBSAN_NO_NULL is not set
> CONFIG_UBSAN=3Dy
> # CONFIG_UBSAN_SANITIZE_ALL is not set
> # CONFIG_UBSAN_ALIGNMENT is not set
> # CONFIG_UBSAN_NULL is not set
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> CONFIG_STRICT_DEVMEM=3Dy
> CONFIG_IO_STRICT_DEVMEM=3Dy
> CONFIG_EARLY_PRINTK_USB=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> CONFIG_EARLY_PRINTK_DBGP=3Dy
> CONFIG_EARLY_PRINTK_USB_XDBC=3Dy
> CONFIG_X86_PTDUMP_CORE=3Dy
> # CONFIG_X86_PTDUMP is not set
> CONFIG_DEBUG_WX=3Dy
> CONFIG_DOUBLEFAULT=3Dy
> # CONFIG_DEBUG_TLBFLUSH is not set
> CONFIG_IOMMU_STRESS=3Dy
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> CONFIG_IO_DELAY_TYPE_0X80=3D0
> CONFIG_IO_DELAY_TYPE_0XED=3D1
> CONFIG_IO_DELAY_TYPE_UDELAY=3D2
> CONFIG_IO_DELAY_TYPE_NONE=3D3
> CONFIG_IO_DELAY_0X80=3Dy
> # CONFIG_IO_DELAY_0XED is not set
> # CONFIG_IO_DELAY_UDELAY is not set
> # CONFIG_IO_DELAY_NONE is not set
> CONFIG_DEFAULT_IO_DELAY_TYPE=3D0
> CONFIG_DEBUG_BOOT_PARAMS=3Dy
> # CONFIG_CPA_DEBUG is not set
> # CONFIG_OPTIMIZE_INLINING is not set
> CONFIG_DEBUG_ENTRY=3Dy
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> # CONFIG_X86_DEBUG_FPU is not set
> CONFIG_PUNIT_ATOM_DEBUG=3Dy
> CONFIG_UNWINDER_ORC=3Dy
> # CONFIG_UNWINDER_FRAME_POINTER is not set
> # CONFIG_UNWINDER_GUESS is not set
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> CONFIG_PERSISTENT_KEYRINGS=3Dy
> CONFIG_TRUSTED_KEYS=3Dy
> # CONFIG_ENCRYPTED_KEYS is not set
> CONFIG_KEY_DH_OPERATIONS=3Dy
> CONFIG_SECURITY_DMESG_RESTRICT=3Dy
> # CONFIG_SECURITY is not set
> CONFIG_SECURITYFS=3Dy
> # CONFIG_INTEL_TXT is not set
> # CONFIG_FORTIFY_SOURCE is not set
> # CONFIG_STATIC_USERMODEHELPER is not set
> CONFIG_DEFAULT_SECURITY_DAC=3Dy
> CONFIG_DEFAULT_SECURITY=3D""
> CONFIG_XOR_BLOCKS=3Dy
> CONFIG_ASYNC_CORE=3Dy
> CONFIG_ASYNC_XOR=3Dy
> CONFIG_ASYNC_PQ=3Dy
> CONFIG_CRYPTO=3Dy
> =

> #
> # Crypto core or helper
> #
> CONFIG_CRYPTO_ALGAPI=3Dy
> CONFIG_CRYPTO_ALGAPI2=3Dy
> CONFIG_CRYPTO_AEAD=3Dy
> CONFIG_CRYPTO_AEAD2=3Dy
> CONFIG_CRYPTO_BLKCIPHER=3Dy
> CONFIG_CRYPTO_BLKCIPHER2=3Dy
> CONFIG_CRYPTO_HASH=3Dy
> CONFIG_CRYPTO_HASH2=3Dy
> CONFIG_CRYPTO_RNG=3Dy
> CONFIG_CRYPTO_RNG2=3Dy
> CONFIG_CRYPTO_RNG_DEFAULT=3Dy
> CONFIG_CRYPTO_AKCIPHER2=3Dy
> CONFIG_CRYPTO_KPP2=3Dy
> CONFIG_CRYPTO_KPP=3Dy
> CONFIG_CRYPTO_ACOMP2=3Dy
> # CONFIG_CRYPTO_RSA is not set
> CONFIG_CRYPTO_DH=3Dy
> CONFIG_CRYPTO_ECDH=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> # CONFIG_CRYPTO_USER is not set
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> CONFIG_CRYPTO_WORKQUEUE=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_MCRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dy
> CONFIG_CRYPTO_ABLK_HELPER=3Dy
> CONFIG_CRYPTO_SIMD=3Dy
> CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
> =

> #
> # Authenticated Encryption with Associated Data
> #
> # CONFIG_CRYPTO_CCM is not set
> CONFIG_CRYPTO_GCM=3Dy
> CONFIG_CRYPTO_CHACHA20POLY1305=3Dy
> CONFIG_CRYPTO_SEQIV=3Dy
> CONFIG_CRYPTO_ECHAINIV=3Dy
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> CONFIG_CRYPTO_CTR=3Dy
> CONFIG_CRYPTO_CTS=3Dy
> CONFIG_CRYPTO_ECB=3Dy
> CONFIG_CRYPTO_LRW=3Dy
> CONFIG_CRYPTO_PCBC=3Dy
> CONFIG_CRYPTO_XTS=3Dy
> CONFIG_CRYPTO_KEYWRAP=3Dy
> =

> #
> # Hash modes
> #
> CONFIG_CRYPTO_CMAC=3Dy
> CONFIG_CRYPTO_HMAC=3Dy
> # CONFIG_CRYPTO_XCBC is not set
> CONFIG_CRYPTO_VMAC=3Dy
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> # CONFIG_CRYPTO_CRC32C_INTEL is not set
> CONFIG_CRYPTO_CRC32=3Dy
> CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> CONFIG_CRYPTO_CRCT10DIF_PCLMUL=3Dy
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_POLY1305=3Dy
> # CONFIG_CRYPTO_POLY1305_X86_64 is not set
> # CONFIG_CRYPTO_MD4 is not set
> # CONFIG_CRYPTO_MD5 is not set
> CONFIG_CRYPTO_MICHAEL_MIC=3Dy
> # CONFIG_CRYPTO_RMD128 is not set
> # CONFIG_CRYPTO_RMD160 is not set
> CONFIG_CRYPTO_RMD256=3Dy
> CONFIG_CRYPTO_RMD320=3Dy
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA1_SSSE3=3Dy
> CONFIG_CRYPTO_SHA256_SSSE3=3Dy
> CONFIG_CRYPTO_SHA512_SSSE3=3Dy
> # CONFIG_CRYPTO_SHA1_MB is not set
> CONFIG_CRYPTO_SHA256_MB=3Dy
> CONFIG_CRYPTO_SHA512_MB=3Dy
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> CONFIG_CRYPTO_SHA3=3Dy
> CONFIG_CRYPTO_TGR192=3Dy
> CONFIG_CRYPTO_WP512=3Dy
> CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=3Dy
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_TI=3Dy
> CONFIG_CRYPTO_AES_X86_64=3Dy
> CONFIG_CRYPTO_AES_NI_INTEL=3Dy
> # CONFIG_CRYPTO_ANUBIS is not set
> CONFIG_CRYPTO_ARC4=3Dy
> CONFIG_CRYPTO_BLOWFISH=3Dy
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
> # CONFIG_CRYPTO_BLOWFISH_X86_64 is not set
> CONFIG_CRYPTO_CAMELLIA=3Dy
> CONFIG_CRYPTO_CAMELLIA_X86_64=3Dy
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dy
> # CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> CONFIG_CRYPTO_CAST5=3Dy
> CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dy
> CONFIG_CRYPTO_CAST6=3Dy
> # CONFIG_CRYPTO_CAST6_AVX_X86_64 is not set
> CONFIG_CRYPTO_DES=3Dy
> CONFIG_CRYPTO_DES3_EDE_X86_64=3Dy
> # CONFIG_CRYPTO_FCRYPT is not set
> CONFIG_CRYPTO_KHAZAD=3Dy
> CONFIG_CRYPTO_SALSA20=3Dy
> # CONFIG_CRYPTO_SALSA20_X86_64 is not set
> CONFIG_CRYPTO_CHACHA20=3Dy
> CONFIG_CRYPTO_CHACHA20_X86_64=3Dy
> CONFIG_CRYPTO_SEED=3Dy
> CONFIG_CRYPTO_SERPENT=3Dy
> CONFIG_CRYPTO_SERPENT_SSE2_X86_64=3Dy
> CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dy
> # CONFIG_CRYPTO_SERPENT_AVX2_X86_64 is not set
> CONFIG_CRYPTO_TEA=3Dy
> CONFIG_CRYPTO_TWOFISH=3Dy
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dy
> CONFIG_CRYPTO_TWOFISH_AVX_X86_64=3Dy
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> CONFIG_CRYPTO_LZO=3Dy
> CONFIG_CRYPTO_842=3Dy
> CONFIG_CRYPTO_LZ4=3Dy
> CONFIG_CRYPTO_LZ4HC=3Dy
> =

> #
> # Random Number Generation
> #
> # CONFIG_CRYPTO_ANSI_CPRNG is not set
> CONFIG_CRYPTO_DRBG_MENU=3Dy
> CONFIG_CRYPTO_DRBG_HMAC=3Dy
> # CONFIG_CRYPTO_DRBG_HASH is not set
> # CONFIG_CRYPTO_DRBG_CTR is not set
> CONFIG_CRYPTO_DRBG=3Dy
> CONFIG_CRYPTO_JITTERENTROPY=3Dy
> # CONFIG_CRYPTO_USER_API_HASH is not set
> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> # CONFIG_CRYPTO_USER_API_RNG is not set
> # CONFIG_CRYPTO_USER_API_AEAD is not set
> CONFIG_CRYPTO_HASH_INFO=3Dy
> # CONFIG_CRYPTO_HW is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> # CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE is not set
> =

> #
> # Certificates for signature checking
> #
> # CONFIG_SYSTEM_TRUSTED_KEYRING is not set
> # CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
> CONFIG_HAVE_KVM=3Dy
> # CONFIG_VIRTUALIZATION is not set
> # CONFIG_BINARY_PRINTF is not set
> =

> #
> # Library routines
> #
> CONFIG_RAID6_PQ=3Dy
> CONFIG_BITREVERSE=3Dy
> # CONFIG_HAVE_ARCH_BITREVERSE is not set
> CONFIG_RATIONAL=3Dy
> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> CONFIG_GENERIC_STRNLEN_USER=3Dy
> CONFIG_GENERIC_NET_UTILS=3Dy
> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> CONFIG_GENERIC_PCI_IOMAP=3Dy
> CONFIG_GENERIC_IOMAP=3Dy
> CONFIG_GENERIC_IO=3Dy
> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> CONFIG_CRC_CCITT=3Dy
> CONFIG_CRC16=3Dy
> CONFIG_CRC_T10DIF=3Dy
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> # CONFIG_CRC32_SELFTEST is not set
> CONFIG_CRC32_SLICEBY8=3Dy
> # CONFIG_CRC32_SLICEBY4 is not set
> # CONFIG_CRC32_SARWATE is not set
> # CONFIG_CRC32_BIT is not set
> CONFIG_CRC4=3Dy
> CONFIG_CRC7=3Dy
> CONFIG_LIBCRC32C=3Dy
> CONFIG_CRC8=3Dy
> CONFIG_XXHASH=3Dy
> # CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
> CONFIG_RANDOM32_SELFTEST=3Dy
> CONFIG_842_COMPRESS=3Dy
> CONFIG_842_DECOMPRESS=3Dy
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4_COMPRESS=3Dy
> CONFIG_LZ4HC_COMPRESS=3Dy
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_ZSTD_COMPRESS=3Dy
> CONFIG_ZSTD_DECOMPRESS=3Dy
> # CONFIG_XZ_DEC is not set
> # CONFIG_XZ_DEC_BCJ is not set
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_LZO=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dy
> CONFIG_REED_SOLOMON_ENC8=3Dy
> CONFIG_REED_SOLOMON_DEC8=3Dy
> CONFIG_REED_SOLOMON_DEC16=3Dy
> CONFIG_BCH=3Dy
> CONFIG_INTERVAL_TREE=3Dy
> CONFIG_RADIX_TREE_MULTIORDER=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> # CONFIG_DMA_NOOP_OPS is not set
> # CONFIG_DMA_VIRT_OPS is not set
> CONFIG_CHECK_SIGNATURE=3Dy
> CONFIG_DQL=3Dy
> CONFIG_GLOB=3Dy
> # CONFIG_GLOB_SELFTEST is not set
> CONFIG_NLATTR=3Dy
> CONFIG_CLZ_TAB=3Dy
> CONFIG_CORDIC=3Dy
> # CONFIG_DDR is not set
> CONFIG_IRQ_POLL=3Dy
> CONFIG_MPILIB=3Dy
> # CONFIG_SG_SPLIT is not set
> CONFIG_SG_POOL=3Dy
> CONFIG_ARCH_HAS_SG_CHAIN=3Dy
> CONFIG_ARCH_HAS_PMEM_API=3Dy
> CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy
> CONFIG_STACKDEPOT=3Dy
> CONFIG_SBITMAP=3Dy
> CONFIG_STRING_SELFTEST=3Dy


--===============7969385050695197432==--

