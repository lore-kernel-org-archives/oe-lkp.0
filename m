Content-Type: multipart/mixed; boundary="===============3414461061751611597=="
MIME-Version: 1.0
From: Pasha Tatashin <pasha.tatashin@oracle.com>
To: lkp@lists.01.org
Subject: Re: 1aad6944cb ("mm: discard memblock data later"): BUG: Bad page state in process swapper pfn:03147
Date: Thu, 10 Aug 2017 16:33:14 -0400
Message-ID: <809c7d3a-9de6-3a19-b73c-289c8e37321e@oracle.com>
In-Reply-To: <598a287f.LGfzco0GTj5QMvzy%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3414461061751611597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I've been trying to reproduce this bug, but getting the following panic =

both on base and fix:

[  115.756568] raid6test: test_disks(62, 63): faila=3D 62(P)  failb=3D 63(Q=
)  OK
[  115.757739] raid6test:
[  115.758147] raid6test: complete (2429 tests, 0 failures)
[  115.760160] rtc_cmos 00:00: setting system clock to 2017-08-10 =

16:29:19 UTC (1502382559)
[  115.761910] md: Skipping autodetection of RAID arrays. =

(raid=3Dautodetect will force)
[  115.763259] VFS: Cannot open root device "ram0" or =

unknown-block(0,0): error -6
[  115.764511] Please append a correct "root=3D" boot option; here are the =

available partitions:
[  115.765816] Kernel panic - not syncing: VFS: Unable to mount root fs =

on unknown-block(0,0)
[  115.767124] CPU: 0 PID: 1 Comm: swapper Not tainted =

4.13.0-rc4_pt_memset6-00033-g7e65200b1473 #7
[  115.768506] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), =

BIOS rel-1.10.2-0-g5f4c7b1-prebuilt.qemu-project.org 04/01/2014
[  115.770368] Call Trace:
[  115.770771]  dump_stack+0x1e/0x20
[  115.771310]  panic+0xf8/0x2bc
[  115.771792]  mount_block_root+0x3bb/0x441
[  115.772437]  ? do_early_param+0xc5/0xc5
[  115.773051]  ? do_early_param+0xc5/0xc5
[  115.773683]  mount_root+0x7c/0x7f
[  115.774243]  prepare_namespace+0x194/0x1d1
[  115.774898]  kernel_init_freeable+0x1c8/0x1df
[  115.775575]  ? rest_init+0x13f/0x13f
[  115.776153]  kernel_init+0x14/0x142
[  115.776711]  ? rest_init+0x13f/0x13f
[  115.777285]  ret_from_fork+0x2a/0x40
[  115.777864] Kernel Offset: disabled


I use the provided config, and the script to run the test. Is there =

something that needs to be changed?

The scrip has the following root argument:

root=3D/dev/ram0

But, config has CONFIG_BLK_DEV_RAM disabled.

Thank you,
Pasha

On 08/08/2017 05:09 PM, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/0day-ci/linux/commits/Pavel-Tatashin/x86-mm-reserve-on=
ly-exiting-low-pages/20170809-025819
> =

> commit 1aad6944cb2566130952ddea92242ef8f9e69d95
> Author:     Pavel Tatashin <pasha.tatashin@oracle.com>
> AuthorDate: Mon Aug 7 16:38:38 2017 -0400
> Commit:     0day robot <fengguang.wu@intel.com>
> CommitDate: Wed Aug 9 02:58:22 2017 +0800
> =

>      mm: discard memblock data later
>      =

>      There is existing use after free bug when deferred struct pages are
>      enabled:
>      =

>      The memblock_add() allocates memory for the memory array if more than
>      128 entries are needed.  See comment in e820__memblock_setup():
>      =

>        * The bootstrap memblock region count maximum is 128 entries
>        * (INIT_MEMBLOCK_REGIONS), but EFI might pass us more E820 entries
>        * than that - so allow memblock resizing.
>      =

>      This memblock memory is freed here:
>              free_low_memory_core_early()
>      =

>      We access the freed memblock.memory later in boot when deferred page=
s are
>      initialized in this path:
>      =

>              deferred_init_memmap()
>                      for_each_mem_pfn_range()
>                        __next_mem_pfn_range()
>                          type =3D &memblock.memory;
>      =

>      One possible explanation for why this use-after-free hasn't been hit
>      before is that the limit of INIT_MEMBLOCK_REGIONS has never been exc=
eeded
>      at least on systems where deferred struct pages were enabled.
>      =

>      Another reason why we want this problem fixed in this patch series i=
s,
>      in the next patch, we will need to access memblock.reserved from
>      deferred_init_memmap().
>      =

>      Signed-off-by: Pavel Tatashin <pasha.tatashin@oracle.com>
>      Reviewed-by: Steven Sistare <steven.sistare@oracle.com>
>      Reviewed-by: Daniel Jordan <daniel.m.jordan@oracle.com>
>      Reviewed-by: Bob Picco <bob.picco@oracle.com>
> =

> 8fdb5278bd  sparc64/mm: setting fields in deferred pages
> 1aad6944cb  mm: discard memblock data later
> cc74b64653  mm: debug for raw alloctor
> +------------------------------------------------+------------+----------=
--+------------+
> |                                                | 8fdb5278bd | 1aad6944c=
b | cc74b64653 |
> +------------------------------------------------+------------+----------=
--+------------+
> | boot_successes                                 | 35         | 0        =
  | 0          |
> | boot_failures                                  | 2          | 15       =
  | 47         |
> | BUG:soft_lockup-CPU##stuck_for#s               | 2          | 0        =
  | 4          |
> | Kernel_panic-not_syncing:softlockup:hung_tasks | 2          | 0        =
  | 4          |
> | BUG:Bad_page_state_in_process                  | 0          | 15       =
  | 43         |
> | kernel_BUG_at_include/linux/page-flags.h       | 0          | 15       =
  | 43         |
> | invalid_opcode:#[##]                           | 0          | 15       =
  | 43         |
> | Kernel_panic-not_syncing:Fatal_exception       | 0          | 15       =
  | 43         |
> +------------------------------------------------+------------+----------=
--+------------+
> =

> [  156.648275] raid6test: test_disks(61, 63): faila=3D 61(D)  failb=3D 63=
(Q)  OK
> [  156.649087] raid6test: test_disks(62, 63): faila=3D 62(P)  failb=3D 63=
(Q)  OK
> [  156.649793] raid6test:
> [  156.650072] raid6test: complete (2429 tests, 0 failures)
> [  156.652053] rtc_cmos 00:00: setting system clock to 2017-08-09 04:39:4=
0 UTC (1502253580)
> [  156.659400] BUG: Bad page state in process swapper  pfn:03147
> [  156.660051] page:ffff88001ed8a1c0 count:0 mapcount:-127 mapping:      =
    (null) index:0x1
> [  156.660917] flags: 0x0()
> [  156.661198] raw: 0000000000000000 0000000000000000 0000000000000001 00=
000000ffffff80
> [  156.662006] raw: ffff88001f4a8120 ffff88001ed85ce0 0000000000000000 00=
00000000000000
> [  156.662811] page dumped because: nonzero mapcount
> [  156.663307] CPU: 0 PID: 1 Comm: swapper Not tainted 4.13.0-rc3-00220-g=
1aad694 #1
> [  156.664077] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [  156.665129] Call Trace:
> [  156.665422]  dump_stack+0x1e/0x20
> [  156.665802]  bad_page+0x122/0x148
> [  156.666161]  free_pages_check_bad+0x113/0x11c
> [  156.666620]  free_hot_cold_page+0x15c/0x400
> [  156.667071]  __free_pages+0x5d/0x71
> [  156.667446]  free_reserved_area+0x10c/0x15b
> [  156.667910]  ? vsyscall_gtod_data+0xf80/0xf80
> [  156.668384]  free_init_pages+0x117/0x129
> [  156.668809]  ? vsyscall_gtod_data+0xf80/0xf80
> [  156.669271]  ? rest_init+0x142/0x142
> [  156.669653]  free_initmem+0x2d/0x2f
> [  156.671606]  kernel_init+0x23/0x14e
> [  156.671994]  ? rest_init+0x142/0x142
> [  156.672379]  ret_from_fork+0x2a/0x40
> [  156.672762] Disabling lock debugging due to kernel taint
> [  156.673638] Freeing unused kernel memory: 1836K
> [  156.674126] Write protecting the kernel read-only data: 28672k
> [  156.675674] Freeing unused kernel memory: 44K
> [  156.680998] Freeing unused kernel memory: 504K
> =

>                                                            # HH:MM RESULT=
 GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start cc74b64653e4a286fd429d7970ce7f3a8f15d641 0a23ea65ce9f10e=
c2ea392571006b781b150327f --
> git bisect  bad 7af9a577abeaf313abc91a9be3ae0e79f92474c0  # 03:57  B     =
 0     1   13   0  mm: defining memblock_virt_alloc_try_nid_raw
> git bisect good 8fdb5278bd5713aeceac62189ccb223857d078bb  # 04:16  G     =
11     0    0   0  sparc64/mm: setting fields in deferred pages
> git bisect  bad daf7a66b7338688093d0b11294001b390f50aa7c  # 04:24  B     =
 0     7   22   3  mm: don't accessed uninitialized struct pages
> git bisect  bad 1aad6944cb2566130952ddea92242ef8f9e69d95  # 04:40  B     =
 0    11   23   0  mm: discard memblock data later
> # first bad commit: [1aad6944cb2566130952ddea92242ef8f9e69d95] mm: discar=
d memblock data later
> git bisect good 8fdb5278bd5713aeceac62189ccb223857d078bb  # 04:49  G     =
31     0    0   2  sparc64/mm: setting fields in deferred pages
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect  bad 1aad6944cb2566130952ddea92242ef8f9e69d95  # 04:55  B     =
 0    10   22   0  mm: discard memblock data later
> # extra tests on HEAD of linux-review/Pavel-Tatashin/x86-mm-reserve-only-=
exiting-low-pages/20170809-025819
> git bisect  bad cc74b64653e4a286fd429d7970ce7f3a8f15d641  # 04:55  B     =
 0    39   56   2  mm: debug for raw alloctor
> # extra tests on tree/branch linux-review/Pavel-Tatashin/x86-mm-reserve-o=
nly-exiting-low-pages/20170809-025819
> git bisect  bad cc74b64653e4a286fd429d7970ce7f3a8f15d641  # 04:56  B     =
 0    39   56   2  mm: debug for raw alloctor
> # extra tests with first bad commit reverted
> git bisect good d7f305e5fc93728c532281fabe08f0267d220fd4  # 05:09  G     =
11     0    0   0  Revert "mm: discard memblock data later"
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion
>=20

--===============3414461061751611597==--

