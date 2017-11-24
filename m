Content-Type: multipart/mixed; boundary="===============3407118319454357564=="
MIME-Version: 1.0
From: Matthew Wilcox <mawilcox@microsoft.com>
To: lkp@lists.01.org
Subject: Re: 2569321dd4 ("page cache: Convert page_cache_tree_delete to xarray"): WARNING: CPU: 0 PID: 137 at mm/shmem.c:1084 shmem_evict_inode
Date: Fri, 24 Nov 2017 16:25:12 +0000
Message-ID: <MWHPR21MB0845F1EBD0A53FBC5F961FF0CB260@MWHPR21MB0845.namprd21.prod.outlook.com>
In-Reply-To: <20171124040003.t3eydwgwtrujw34g@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3407118319454357564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Actually, I rebased this branch to fix a commit 18 (!) commits earlier than=
 the one which was flagged here, which was where the real problem lay.

Thank you so much for 0-day; you're finding so many bugs for me!

> -----Original Message-----
> From: Fengguang Wu [mailto:fengguang.wu(a)intel.com]
> Sent: Thursday, November 23, 2017 11:00 PM
> To: Matthew Wilcox <mawilcox@microsoft.com>
> Cc: wfg(a)linux.intel.com; LKP <lkp@01.org>
> Subject: 2569321dd4 ("page cache: Convert page_cache_tree_delete to
> xarray"): WARNING: CPU: 0 PID: 137 at mm/shmem.c:1084
> shmem_evict_inode
> =

> Hi Matthew,
> =

> This looks like an interim error that hurts bisect.
> It no longer show up in your branch HEAD.
> =

> git://git.infradead.org/users/willy/linux-dax.git xarray-2017-11-20
> =

> commit 2569321dd461e33b2d731e8324bdae5b7bc7da4c
> Author:     Matthew Wilcox <mawilcox@microsoft.com>
> AuthorDate: Tue Nov 21 09:17:59 2017 -0500
> Commit:     Matthew Wilcox <mawilcox@microsoft.com>
> CommitDate: Tue Nov 21 12:16:34 2017 -0500
> =

>      page cache: Convert page_cache_tree_delete to xarray
> =

>      The code is slightly shorter and simpler.
> =

>      Signed-off-by: Matthew Wilcox <mawilcox@microsoft.com>
> =

> 5b41d2aaaa  page cache: Use xarray for adding pages
> 2569321dd4  page cache: Convert page_cache_tree_delete to xarray
> 2c8c7e65b8  mm: Convert page-writeback to XArray
> +-------------------------------------------------------+------------+---=
---------+------------+
> |                                                       | 5b41d2aaaa | 25=
69321dd4 | 2c8c7e65b8 |
> +-------------------------------------------------------+------------+---=
---------+------------+
> | boot_successes                                        | 30         | 0 =
         | 10         |
> | boot_failures                                         | 5          | 15=
         | 9          |
> | IP-Config:Auto-configuration_of_network_failed        | 4          | 4 =
         | 8
> |
> | WARNING:at_drivers/pci/pci-sysfs.c:#pci_mmap_resource | 1          | 0 =
         |
> 1          |
> | EIP:pci_mmap_resource                                 | 1          | 0 =
         | 1          |
> | WARNING:at_mm/shmem.c:#shmem_evict_inode              | 0          | 11=
         |
> |
> | EIP:shmem_evict_inode                                 | 0          | 11=
         |            |
> | kernel_BUG_at_fs/inode.c                              | 0          | 11=
         |            |
> | invalid_opcode:#[##]                                  | 0          | 11=
         |            |
> | EIP:clear_inode                                       | 0          | 11=
         |            |
> | Kernel_panic-not_syncing:Fatal_exception              | 0          | 11=
         |
> |
> +-------------------------------------------------------+------------+---=
---------+------------+
> =

> [    4.204804] Write protecting the kernel text: 21284k
> [    4.205581] Write protecting the kernel read-only data: 3784k
> /etc/rcS.d/S00fbsetup: line 3: /sbin/modprobe: No such file or directory
> Starting udev
> /etc/rcS.d/S03udev: line 72: /proc/sys/kernel/hotplug: No such file or di=
rectory
> [    4.345797] WARNING: CPU: 0 PID: 137 at mm/shmem.c:1084
> shmem_evict_inode+0x2c2/0x2d0
> [    4.347205] Modules linked in:
> [    4.347716] CPU: 0 PID: 137 Comm: udevd Not tainted 4.14.0-12982-
> g2569321 #1
> [    4.348666] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> 1.10.2-1 04/01/2014
> [    4.349843] task: cd70e640 task.stack: cd748000
> [    4.350545] EIP: shmem_evict_inode+0x2c2/0x2d0
> [    4.351177] EFLAGS: 00010246 CPU: 0
> [    4.351769] EAX: 00000008 EBX: cd6ff688 ECX: 00000001 EDX: cd6ff678
> [    4.352621] ESI: cd6ff688 EDI: cd6ff690 EBP: cd749e78 ESP: cd749e60
> [    4.353444]  DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068
> [    4.354260] CR0: 80050033 CR2: b7fa3000 CR3: 0d73d000 CR4: 000406d0
> [    4.355085] Call Trace:
> [    4.355514]  evict+0xe0/0x3c0
> [    4.356017]  iput+0x25a/0x380
> [    4.356513]  dentry_unlink_inode+0x13d/0x250
> [    4.357141]  __dentry_kill+0x190/0x340
> [    4.357724]  dput+0x315/0x4b0
> [    4.358232]  SYSC_renameat2+0x7e8/0x900
> [    4.358800]  ? d_instantiate+0x6b/0xc0
> [    4.359365]  SyS_rename+0x34/0x50
> [    4.359921]  do_int80_syscall_32+0x85/0x250
> [    4.360580]  entry_INT80_32+0x2a/0x2a
> [    4.361142] EIP: 0x47ecaf71
> [    4.361603] EFLAGS: 00000246 CPU: 0
> [    4.362168] EAX: ffffffda EBX: bf88f0ce ECX: 08ccb9f8 EDX: bf88f0ce
> [    4.362986] ESI: 00002180 EDI: 00000000 EBP: 08ccb9f8 ESP: bf88f07c
> [    4.363819]  DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b
> [    4.364579] Code: 5f f0 89 5f f4 e8 2f 72 30 01 83 05 c0 45 3e d0 01 8=
3 15 c4
> 45 3e d0 00 e9 78 fd ff ff 83 05 d0 45 3e d0 01 83 15 d4 45 3e d0 00 <0f>=
 ff e9
> e9 fd ff ff 8d b4 26 00 00 00 00 55 89 e5 83 ec 38 83
> [    4.366962] ---[ end trace 51740c2df8f58aa9 ]---
> [    4.367660] ------------[ cut here ]------------
> [    4.367660] ------------[ cut here ]------------
> [    4.368344] kernel BUG at fs/inode.c:506!
> [    4.369124] invalid opcode: 0000 [#1]
> [    4.369673] Modules linked in:
> [    4.370223] CPU: 0 PID: 137 Comm: udevd Tainted: G        W        4.1=
4.0-
> 12982-g2569321 #1
> [    4.371405] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> 1.10.2-1 04/01/2014
> [    4.372635] task: cd70e640 task.stack: cd748000
> [    4.373278] EIP: clear_inode+0xde/0x190
> [    4.373870] EFLAGS: 00010046 CPU: 0
> [    4.374435] EAX: cd70e640 EBX: cd6ff690 ECX: 00000000 EDX: 00000001
> [    4.375255] ESI: cd6ff688 EDI: cd6ff690 EBP: cd749e58 ESP: cd749e54
> [    4.376154]  DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068
> [    4.376879] CR0: 80050033 CR2: b7fa3000 CR3: 0d73d000 CR4: 000406d0
> [    4.377735] Call Trace:
> [    4.378193]  shmem_evict_inode+0x105/0x2d0
> [    4.378793]  evict+0xe0/0x3c0
> [    4.379278]  iput+0x25a/0x380
> [    4.379770]  dentry_unlink_inode+0x13d/0x250
> [    4.380417]  __dentry_kill+0x190/0x340
> [    4.381008]  dput+0x315/0x4b0
> [    4.381486]  SYSC_renameat2+0x7e8/0x900
> [    4.382084]  ? d_instantiate+0x6b/0xc0
> [    4.382640]  SyS_rename+0x34/0x50
> [    4.383156]  do_int80_syscall_32+0x85/0x250
> [    4.383760]  entry_INT80_32+0x2a/0x2a
> [    4.384367] EIP: 0x47ecaf71
> [    4.384822] EFLAGS: 00000246 CPU: 0
> [    4.385359] EAX: ffffffda EBX: bf88f0ce ECX: 08ccb9f8 EDX: bf88f0ce
> [    4.386232] ESI: 00002180 EDI: 00000000 EBP: 08ccb9f8 ESP: bf88f07c
> [    4.387052]  DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b
> [    4.387843] Code: 00 00 83 05 c0 a6 41 d0 01 c7 83 90 00 00 00 60 00 0=
0 00
> 83 15 c4 a6 41 d0 00 5b 5d c3 83 05 58 a6 41 d0 01 83 15 5c a6 41 d0 00 <=
0f>
> 0b 83 05 60 a6 41 d0 01 83 15 64 a6 41 d0 00 66 90 83 05 68
> [    4.390294] EIP: clear_inode+0xde/0x190 SS:ESP: 0068:cd749e54
> [    4.391094] ---[ end trace 51740c2df8f58aaa ]---
> [    4.391785] Kernel panic - not syncing: Fatal exception
> =

>                                                            # HH:MM RESULT=
 GOOD BAD
> GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 359b39466a7af881c131b2e09ff8a7f28a1dbe42
> bebc6082da0a9f5d47a1ea2edc099bf671058bd4 --
> git bisect  bad 355879005f035f49f3b9c74b9bbe6194fbe03893  # 05:58  B     =
 0
> 13   29   2  Merge 'sound/topic/asoc-intel-kconfig' into devel-catchup-
> 201711220141
> git bisect  bad 669bb7910757a1db9116d20aaf7f2f30ae5ea51d  # 05:58  B     =
 0
> 13   29   2  Merge 'rseq/rseq/for-next' into devel-catchup-201711220141
> git bisect good 9dd0e1491fa7fd607afb4e7bac9729994cb3717f  # 05:59  G
> 11     0    0   4  Merge 'mkp-scsi/fixes' into devel-catchup-201711220141
> git bisect  bad f07b026d989f2837f9eb59bfeeac43834cd960c9  # 05:59  B     =
 0
> 13   29   2  Merge 'dax/xarray-2017-11-20' into devel-catchup-201711220141
> git bisect good 8c609698569578913ad40bb160b97c3f6cfa15ec  # 05:59  G
> 11     0    0   4  Merge tag 'armsoc-soc' of
> git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc
> git bisect good bec04432cb9036dedf89140c102b5ac03e4b3626  # 05:59  G
> 11     0    0   4  Merge branch 'next' of
> git://git.kernel.org/pub/scm/linux/kernel/git/rzhang/linux
> git bisect good 0bc9706db3a35b6d674d0642f425d768560736b2  # 05:59  G
> 11     0    0   4  drm/amd/display: Use new DRM API where possible
> git bisect good 2ce079f04d5914dae14fdc8618f804cc0d2a1b8f  # 05:59  G     =
11
> 0    0   4  Merge tag 'kbuild-misc-v4.15' of
> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild
> git bisect good 1deab8ce2c91e3b16563b7a7ea150f82334262ec  # 06:00  G
> 11     0    0   4  Merge
> git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc
> git bisect good c8a0739b185d11d6e2ca7ad9f5835841d1cfc765  # 06:00  G
> 11     0    0   4  Merge tag 'ntb-4.15' of git://github.com/jonmason/ntb
> git bisect good d5f1f94eda2ecf175c97599ddbd6390b43f30e68  # 06:00  G
> 10     0    0   5  Remove sched.h warning
> git bisect good cd0eed7c97812801dd23480a2615cf0a28ec3e13  # 06:00  G
> 11     0    0   4  xarray: Add xa_get_entries and xa_get_tagged
> git bisect  bad 53e60a5f200c0e153eaa520aa59973582996fc42  # 06:00  B     =
 0
> 11   29   4  xfs: Convert mru cache to XArray
> git bisect  bad 07b45d216e66e4dc3171ea06be488d709f948d55  # 06:00  B
> 0    11   29   4  page cache: Convert find_get_entry to xarray
> git bisect good b7987ba20cdc7d80a0572e277372d1facba6ab3b  # 06:00  G
> 11     0    0   4  xarray: Add xas_find_any / xas_next_any
> git bisect good 5b41d2aaaaeae17178e51e313de537e229a3299f  # 06:00  G
> 30     0    0   6  page cache: Use xarray for adding pages
> git bisect  bad 2569321dd461e33b2d731e8324bdae5b7bc7da4c  # 06:00  B
> 0    11   47   4  page cache: Convert page_cache_tree_delete to xarray
> # first bad commit: [2569321dd461e33b2d731e8324bdae5b7bc7da4c] page
> cache: Convert page_cache_tree_delete to xarray
> git bisect good 5b41d2aaaaeae17178e51e313de537e229a3299f  # 06:00  G
> 30     0    0   6  page cache: Use xarray for adding pages
> # extra tests on HEAD of linux-devel/devel-catchup-201711220141
> git bisect  bad 359b39466a7af881c131b2e09ff8a7f28a1dbe42  # 06:01  B     =
 0
> 23   40   0  0day head guard for 'devel-catchup-201711220141'
> # extra tests on tree/branch dax/xarray-2017-11-20
> git bisect good 2c8c7e65b85c4d2b4e0e140a12408a21151767f0  # 06:01  G
> 10     0    0   9  mm: Convert page-writeback to XArray
> # extra tests with first bad commit reverted
> git bisect good 39845f23d3cd005a53b871b8380e3783ae8f03f5  # 06:02  G
> 10     0    0   1  Revert "page cache: Convert page_cache_tree_delete to =
xarray"
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://na01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.=
01.or
> g%2Fpipermail%2Flkp&data=3D02%7C01%7Cmawilcox%40microsoft.com%7Cdba
> f956c21a9495251f008d532efdbd7%7C72f988bf86f141af91ab2d7cd011db47%
> 7C1%7C0%7C636470928176862288&sdata=3DJ1UlwrIxaZfbeCfwxqR%2FGZ1s7n
> o6Iz%2FY%2FPlDC6OKNwY%3D&reserved=3D0                          Intel Corp=
oration

--===============3407118319454357564==--

