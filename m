Content-Type: multipart/mixed; boundary="===============1410643667507980340=="
MIME-Version: 1.0
From: Walter Wu <walter-zh.wu@mediatek.com>
To: lkp@lists.01.org
Subject: Re: 7c7d574801 ("kasan: detect negative size in memory operation .."): PANIC: early exception 0xe3 IP 10:ffffffffb04836c2 error 2 cr2 0x0
Date: Mon, 04 Nov 2019 10:18:19 +0800
Message-ID: <1572833899.26321.6.camel@mtksdccf07>
In-Reply-To: <9dedfdf7-713c-3295-1e47-b5b78191634a@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1410643667507980340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-10-23 at 14:09 +0800, Chen, Rong A wrote:
> =

> On 10/23/2019 1:44 PM, Walter Wu wrote:
> > On Tue, 2019-10-22 at 16:34 +0800, Rong Chen wrote:
> >> On 10/21/19 1:21 PM, Walter Wu wrote:
> >>> On Fri, 2019-10-18 at 15:04 +0800, kernel test robot wrote:
> >>>> Greetings,
> >>>>
> >>>> 0day kernel testing robot got the below dmesg and the first bad comm=
it is
> >>>>
> >>>> https://github.com/0day-ci/linux/commits/Walter-Wu/kasan-detect-nega=
tive-size-in-memory-operation-function/20191015-130651
> >>>>
> >>>> commit 7c7d574801777b176b38fb68d37b77d7be9b9ca3
> >>>> Author:     Walter Wu <walter-zh.wu@mediatek.com>
> >>>> AuthorDate: Mon Oct 14 23:58:45 2019 +0800
> >>>> Commit:     0day robot <lkp@intel.com>
> >>>> CommitDate: Tue Oct 15 13:06:53 2019 +0800
> >>>>
> >>>>       kasan: detect negative size in memory operation function
> >>>>       =

> >>>>       KASAN missed detecting size is negative numbers in memset(), m=
emcpy(),
> >>>>       and memmove(), it will cause underflow bug, so needs to be det=
ected
> >>>>       by KASAN.
> >>>>       =

> >>>>       If size is negative numbers, then it has three reasons to be
> >>>>       defined as heap-out-of-bounds bug type.
> >>>>       1) Casting negative numbers to size_t would indeed turn up as
> >>>>          a large size_t and its value will be larger than ULONG_MAX/=
2,
> >>>>          so that this can qualify as out-of-bounds.
> >>>>       2) If KASAN has new bug type and user-space passes negative si=
ze,
> >>>>          then there are duplicate reports. So don't produce new bug =
type
> >>>>          in order to prevent duplicate reports by some systems (e.g.=
 syzbot)
> >>>>          to report the same bug twice.
> >>>>       3) When size is negative numbers, it may be passed from user-s=
pace.
> >>>>          So we always print heap-out-of-bounds in order to prevent t=
hat
> >>>>          kernel-space and user-space have the same bug but have dupl=
icate
> >>>>          reports.
> >>>>       =

> >>>>       KASAN report:
> >>>>       =

> >>>>        BUG: KASAN: heap-out-of-bounds in kmalloc_memmove_invalid_siz=
e+0x70/0xa0
> >>>>        Read of size 18446744073709551608 at addr ffffff8069660904 by=
 task cat/72
> >>>>       =

> >>>>        CPU: 2 PID: 72 Comm: cat Not tainted 5.4.0-rc1-next-20191004a=
jb-00001-gdb8af2f372b2-dirty #1
> >>>>        Hardware name: linux,dummy-virt (DT)
> >>>>        Call trace:
> >>>>         dump_backtrace+0x0/0x288
> >>>>         show_stack+0x14/0x20
> >>>>         dump_stack+0x10c/0x164
> >>>>         print_address_description.isra.9+0x68/0x378
> >>>>         __kasan_report+0x164/0x1a0
> >>>>         kasan_report+0xc/0x18
> >>>>         check_memory_region+0x174/0x1d0
> >>>>         memmove+0x34/0x88
> >>>>         kmalloc_memmove_invalid_size+0x70/0xa0
> >>>>       =

> >>>>       [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D199341
> >>>>       =

> >>>>       Changes in v2:
> >>>>       fix the indentation, thanks for the reminder Matthew.
> >>>>       =

> >>>>       Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> >>>>       Reported -by: Dmitry Vyukov <dvyukov@google.com>
> >>>>       Suggested-by: Dmitry Vyukov <dvyukov@google.com>
> >>>>       Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> >>>>
> >>>> 5bc52f64e8  Merge branch 'akpm' (patches from Andrew)
> >>>> 7c7d574801  kasan: detect negative size in memory operation function
> >>>> bb61dd30f7  kasan: add test for invalid size in memmove
> >>>> +------------------------------------------------+------------+-----=
-------+------------+
> >>>> |                                                | 5bc52f64e8 | 7c7d=
574801 | bb61dd30f7 |
> >>>> +------------------------------------------------+------------+-----=
-------+------------+
> >>>> | boot_successes                                 | 2          | 0   =
       | 0          |
> >>>> | boot_failures                                  | 64         | 22  =
       | 22         |
> >>>> | BUG:soft_lockup-CPU##stuck_for#s               | 64         |     =
       |            |
> >>>> | RIP:thread_signal_callback                     | 2          |     =
       |            |
> >>>> | calltrace:irq_exit                             | 5          |     =
       |            |
> >>>> | Kernel_panic-not_syncing:softlockup:hung_tasks | 64         |     =
       |            |
> >>>> | RIP:rcu_read_lock_held                         | 4          |     =
       |            |
> >>>> | RIP:__asan_load8                               | 5          |     =
       |            |
> >>>> | RIP:arch_local_irq_save                        | 2          |     =
       |            |
> >>>> | RIP:lock_is_held_type                          | 14         |     =
       |            |
> >>>> | RIP:__kasan_check_read                         | 2          |     =
       |            |
> >>>> | RIP:check_memory_region                        | 3          |     =
       |            |
> >>>> | RIP:__asan_load4                               | 10         |     =
       |            |
> >>>> | RIP:debug_lockdep_rcu_enabled                  | 9          |     =
       |            |
> >>>> | RIP:lock_is_held                               | 1          |     =
       |            |
> >>>> | RIP:to_kthread                                 | 2          |     =
       |            |
> >>>> | RIP:kthread_should_stop                        | 5          |     =
       |            |
> >>>> | RIP:rcu_read_lock_held_common                  | 2          |     =
       |            |
> >>>> | RIP:drm_mm_scan_add_block                      | 1          |     =
       |            |
> >>>> | RIP:test_bit                                   | 1          |     =
       |            |
> >>>> | RIP:rb_prev                                    | 1          |     =
       |            |
> >>>> | PANIC:early_exception                          | 0          | 22  =
       | 22         |
> >>>> | RIP:clear_page_orig                            | 0          | 22  =
       |            |
> >>>> | BUG:kernel_hang_in_boot_stage                  | 0          | 22  =
       | 22         |
> >>>> +------------------------------------------------+------------+-----=
-------+------------+
> >>>>
> >>>> If you fix the issue, kindly add following tag
> >>>> Reported-by: kernel test robot <lkp@intel.com>
> >>>>
> >>>> [    0.015307] Scan for SMP in [mem 0x000f0000-0x000fffff]
> >>>> [    0.023649] found SMP MP-table at [mem 0x000f6a80-0x000f6a8f]
> >>>> [    0.024465]   mpc: f6a90-f6b74
> >>>> [    0.024913] check: Scanning 1 areas for low memory corruption
> >>>> [    0.025746] BRK [0x778000000000, 0x778000000fff] PGTABLE
> >>>> PANIC: early exception 0xe3 IP 10:ffffffffb04836c2 error 2 cr2 0x0
> >>>> [    0.027362] CPU: 0 PID: 0 Comm: swapper Not tainted 5.4.0-rc3-000=
19-g7c7d574801777 #1
> >>>> [    0.028448] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)=
, BIOS 1.10.2-1 04/01/2014
> >>>> [    0.029609] RIP: 0010:clear_page_orig+0x12/0x40
> >>>> [    0.030247] Code: 90 90 90 90 90 90 90 90 b9 00 02 00 00 31 c0 f3=
 48 ab c3 0f 1f 44 00 00 31 c0 b9 40 00 00 00 66 0f 1f 84 00 00 00 00 00 ff=
 c9 <48> 89 07 48 89 47 08 48 89 47 10 48 89 47 18 48 89 47 20 48 89 47
> >>>> [    0.032943] RSP: 0000:ffffffffb1e07c48 EFLAGS: 00010016 ORIG_RAX:=
 0000000000000002
> >>>> [    0.034010] RAX: 0000000000000000 RBX: 0000000778000000 RCX: 0000=
00000000003f
> >>>> [    0.035056] RDX: 000000000000002c RSI: 2000040000000000 RDI: 0000=
000000000000
> >>>> [    0.036068] RBP: ffffffffb1e07c78 R08: 0000000000000003 R09: 0000=
000000000007
> >>>> [    0.037066] R10: ffffffffb1e07d48 R11: fffffbfff689abdc R12: ffff=
ffffb1c3c6d0
> >>>> [    0.038057] R13: 0000000000000000 R14: 0000000000000001 R15: 0000=
000000000001
> >>>> [    0.039049] FS:  0000000000000000(0000) GS:ffffffffb1f32000(0000)=
 knlGS:0000000000000000
> >>>> [    0.040290] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >>>> [    0.041134] CR2: 0000000000000000 CR3: 000000003adba000 CR4: 0000=
0000000606b0
> >>>> [    0.042128] Call Trace:
> >>>> [    0.042482]  ? alloc_low_pages+0x1b1/0x1d6
> >>>> [    0.043062]  alloc_low_page+0x15/0x1e
> >>>> [    0.043619]  __kernel_physical_mapping_init+0x121/0x2f9
> >>>> [    0.044354]  kernel_physical_mapping_init+0x15/0x1e
> >>>> [    0.045081]  init_memory_mapping+0x357/0x465
> >>>> [    0.045684]  ? alloc_low_pages+0x1d6/0x1d6
> >>>> [    0.046314]  ? __kasan_check_read+0x2b/0x36
> >>>> [    0.046914]  init_mem_mapping+0x26d/0x4f2
> >>>> [    0.047524]  ? 0xffffffffaf400000
> >>>> [    0.047994]  setup_arch+0xa6f/0xf9d
> >>>> [    0.048490]  start_kernel+0xdb/0x9ce
> >>>> [    0.049001]  ? mem_encrypt_init+0x12/0x12
> >>>> [    0.049567]  ? x86_early_init_platform_quirks+0x8f/0x124
> >>>> [    0.050314]  ? __asan_loadN+0x31/0x3a
> >>>> [    0.050878]  x86_64_start_reservations+0x40/0x49
> >>>> [    0.051614]  x86_64_start_kernel+0xfb/0x105
> >>>> [    0.052212]  secondary_startup_64+0xb6/0xc0
> >>>> BUG: kernel hang in boot stage
> >>>>
> >>>>
> >>>>                                                             # HH:MM =
RESULT GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> >>>> git bisect start c8ba3f06969d84573a9d965759e0f0681829dac9 4f5cafb5cb=
8471e54afdc9054d973535614f7675 --
> >>>> git bisect  bad 3695b73d724ac6f3cf6f71a9d34faa0570fd5b29  # 17:11  B=
      0     4   31  11  Merge 'baylibre/v5.5/drivers' into devel-hourly-201=
9101604
> >>>> git bisect  bad 52b3f9d42b62ef1430c8645a386f9c65d469c6b2  # 20:18  B=
      0     3   30  11  Merge 'linux-review/Daniel-Baluta/ASoC-simple-card-=
Introduce-force-dpcm-DT-property/20191014-115040' into devel-hourly-2019101=
604
> >>>> git bisect  bad 68bb9d1f16e075e21d549b2a98d3ad2b998e0529  # 23:17  B=
      0     3   30  11  Merge 'linux-review/Nishad-Kamdar/net-dsa-sja1105-U=
se-the-correct-style-for-SPDX-License-Identifier/20191015-002737' into deve=
l-hourly-2019101604
> >>>> git bisect  bad f59acfb7c00382c08a62c4fdbd115b25130a1fca  # 02:30  B=
      0     2   41  11  Merge 'linux-review/Simon-Horman/IPVS-updates-for-v=
5-5/20191015-155129' into devel-hourly-2019101604
> >>>> git bisect good 905247cb5a51dbb224f83b606f5f71415d793bdc  # 05:27  G=
     10     0   10  21  Merge 'linux-review/Tiezhu-Yang/MIPS-Loongson-Make-=
default-kernel-log-buffer-size-as-128KB-for-Loongson3/20191015-091142' into=
 devel-hourly-2019101604
> >>>> git bisect good 966ef0817802acec12f1e1488a2d4acb7ebe966c  # 08:33  G=
     10     0   10  21  Merge 'linux-review/Stuart-Hayes/PCI-pciehp-Do-not-=
turn-off-slot-if-presence-comes-up-after-link/20191014-104606' into devel-h=
ourly-2019101604
> >>>> git bisect good 8e4847ecf245da52fe4b9f81d804e5027f191f86  # 11:33  G=
     10     0   10  21  Merge 'linux-review/Biwen-Li/i2c-mux-pca954x-add-pr=
operty-idle-state/20191015-131423' into devel-hourly-2019101604
> >>>> git bisect  bad f4b1c70dd5976e851ab8b474946440001a3d7d42  # 14:23  B=
      0     1   28  11  Merge 'linux-review/Xin-Long/sctp-change-sctp_prot-=
no_autobind-with-true/20191015-154418' into devel-hourly-2019101604
> >>>> git bisect  bad 0f5c4e55bc11c9ff3a9c7bd27b9f0dfa1cd2e457  # 17:19  B=
      0     3   30  11  Merge 'linux-review/Walter-Wu/kasan-detect-negative=
-size-in-memory-operation-function/20191015-130651' into devel-hourly-20191=
01604
> >>>> git bisect good 0e200aef5d9c47ef2d5b89a10f68e21f27f6d2c8  # 20:32  G=
     10     0   10  21  Merge 'linux-review/Guilherme-G-Piccoli/hugetlb-Add=
-nohugepages-parameter-to-prevent-hugepages-creation/20191015-125937' into =
devel-hourly-2019101604
> >>>> git bisect  bad bb61dd30f7f6d45778a5ca43c56d273d6da8904d  # 01:05  B=
      0     1   28  11  kasan: add test for invalid size in memmove
> >>>> git bisect  bad 7c7d574801777b176b38fb68d37b77d7be9b9ca3  # 04:26  B=
      0     4   31  11  kasan: detect negative size in memory operation fun=
ction
> >>>> # first bad commit: [7c7d574801777b176b38fb68d37b77d7be9b9ca3] kasan=
: detect negative size in memory operation function
> >>>> git bisect good 5bc52f64e8841c4526d74f1073bfa95d4f6224d4  # 10:53  G=
     30     0   30  63  Merge branch 'akpm' (patches from Andrew)
> >>>> # extra tests on HEAD of linux-devel/devel-hourly-2019101604
> >>>> git bisect  bad c8ba3f06969d84573a9d965759e0f0681829dac9  # 11:00  B=
      0    13   32   0  0day head guard for 'devel-hourly-2019101604'
> >>>> # extra tests on tree/branch linux-review/Walter-Wu/kasan-detect-neg=
ative-size-in-memory-operation-function/20191015-130651
> >>>> git bisect  bad bb61dd30f7f6d45778a5ca43c56d273d6da8904d  # 11:08  B=
      0    22   38   0  kasan: add test for invalid size in memmove
> >>>> # extra tests with first bad commit reverted
> >>>> git bisect good 1999ed9489d22d9d95a400335554e2addbe751bc  # 15:02  G=
     10     0   10  21  Revert "kasan: detect negative size in memory opera=
tion function"
> >>>>
> >>>> ---
> >>>> 0-DAY kernel test infrastructure                Open Source Technolo=
gy Center
> >>>> https://lists.01.org/pipermail/lkp                          Intel Co=
rporation
> >>> Hi,
> >>>
> >>> I can crash with this config with and without this commit.
> >>>
> >>> Would you consistently reproduce the problem with the commit applied,
> >>> and consistently not see the problem with the commit removed?
> >> Hi Walter,
> >>
> >> We can reproduce the problem, kernel panic occurs more early with comm=
it
> >> 7c7d574801,
> >> below is the dmesg of the commit (fee802f3df371: Revert "kasan: detect
> >> negative size in memory operation function"):
> > Thank you for your reply.
> > We can reproduce this problem and find out the root cause for x86
> > config. We need to modify our patch, so we directly provide to you?
> > Or need to send new v3 patch?
> >
> Hi Walter,
> =

> you can send v3, the bot will catch and test it.
> =

> Best Regards,
> Rong Chen
> =

Hi Rong A,

Thank you for your help.

We last two weeks send one of v3 patch, but we don't see some results,
so we send full v3 patchset Today. Is it already testing? =


Thanks.
Walter

--===============1410643667507980340==--

