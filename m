Content-Type: multipart/mixed; boundary="===============6862259540569916349=="
MIME-Version: 1.0
From: kemi <kemi.wang@intel.com>
To: lkp@lists.01.org
Subject: Re: c756515ec4 ("introduce a cache layer for buddy system"): [ 0.000000] WARNING: CPU: 0 PID: 0 at lib/list_debug.c:31 __list_add_valid
Date: Mon, 23 Oct 2017 09:01:40 +0800
Message-ID: <05920b28-57c2-6457-cedd-5ce910d6bbef@intel.com>
In-Reply-To: <20171022182028.dce3gcmgy767v6v2@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6862259540569916349==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks. I will take a look at it.

On 2017=E5=B9=B410=E6=9C=8823=E6=97=A5 02:20, Fengguang Wu wrote:
> Kemi, here it triggers a warning.
> =

> commit c756515ec4fad53ada6b3f3777f536da40d76479
> Author:     Kemi Wang <kemi.wang@intel.com>
> AuthorDate: Sat Oct 21 19:13:07 2017 +0800
> Commit:     Kemi Wang <kemi.wang@intel.com>
> CommitDate: Sat Oct 21 19:23:50 2017 +0800
> =

>      introduce a cache layer for buddy system
>      =

>      Signed-off-by: Kemi Wang <kemi.wang@intel.com>
> =

> 9a27ded219  Merge tag 'for-linus-4.14c-rc6-tag' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/xen/tip
> c756515ec4  introduce a cache layer for buddy system
> c756515ec4  introduce a cache layer for buddy system
> +-------------------------------------------------+------------+---------=
---+------------+
> |                                                 | 9a27ded219 | c756515e=
c4 | c756515ec4 |
> +-------------------------------------------------+------------+---------=
---+------------+
> | boot_successes                                  | 35         | 0       =
   | 0          |
> | boot_failures                                   | 0          | 15      =
   | 15         |
> | WARNING:at_lib/list_debug.c:#__list_add_valid   | 0          | 15      =
   | 15         |
> | EIP:__list_add_valid                            | 0          | 15      =
   | 15         |
> | BUG:Bad_page_state_in_process                   | 0          | 15      =
   | 15         |
> | BUG:unable_to_handle_kernel                     | 0          | 15      =
   | 15         |
> | Oops:#[##]                                      | 0          | 15      =
   | 15         |
> | EIP:__list_del_entry_valid                      | 0          | 15      =
   | 15         |
> | Kernel_panic-not_syncing:Fatal_exception        | 0          | 15      =
   | 15         |
> | BUG:kernel_hang_in_early-boot_stage,last_printk | 0          | 6       =
   | 6          |
> +-------------------------------------------------+------------+---------=
---+------------+
> =

> [    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 by=
tes)
> [    0.000000] Initializing CPU#0
> [    0.000000] Initializing HighMem for node 0 (00000000:00000000)
> [    0.000000] list_add double add: new=3Dd224e354, prev=3Dd224e354, next=
=3Dc18cb840.
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] WARNING: CPU: 0 PID: 0 at lib/list_debug.c:31 __list_add_v=
alid+0x3b/0x5b
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 4.14.0-rc5-00095-g=
c756515 #1
> [    0.000000] task: c1718e80 task.stack: c170e000
> [    0.000000] EIP: __list_add_valid+0x3b/0x5b
> [    0.000000] EFLAGS: 00210002 CPU: 0
> [    0.000000] EAX: 00000040 EBX: d224e354 ECX: c105dfe6 EDX: c10694a2
> [    0.000000] ESI: c18cb840 EDI: d224e354 EBP: c170fe7c ESP: c170fe64
> [    0.000000]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
> [    0.000000] CR0: 80050033 CR2: 00000000 CR3: 01954000 CR4: 000406b0
> [    0.000000] Call Trace:
> [    0.000000]  list_add_tail+0x16/0x29
> [    0.000000]  __free_one_page+0x16b/0x175
> [    0.000000]  free_pcppages_bulk+0xa2/0x18f
> [    0.000000]  free_hot_cold_page+0x111/0x13b
> [    0.000000]  __free_pages+0x26/0x31
> [    0.000000]  __free_pages_bootmem+0x92/0x9a
> [    0.000000]  free_all_bootmem+0xfb/0x150
> [    0.000000]  mem_init+0x32/0x1be
> [    0.000000]  start_kernel+0x21e/0x3ba
> [    0.000000]  i386_start_kernel+0x99/0x9d
> [    0.000000]  startup_32_smp+0x15f/0x161
> [    0.000000] Code: 84 69 69 c1 e8 63 3f e8 ff 0f ff eb 20 53 56 51 68 f=
8 69 69 c1 e8 52 3f e8 ff 0f ff eb 0f 51 52 50 68 45 6a 69 c1 e8 41 3f e8 f=
f <0f> ff 83 c4 10 31 c0 eb 10 8b 33 39 f1 75 d3 39 c3 74 e0 39 c1
> [    0.000000] ---[ end trace 68fc440848fd98ee ]---
> [    0.000000] list_add double add: new=3Dd22a5d34, prev=3Dc18cb848, next=
=3Dd22a5d34.
> =

>                                                            # HH:MM RESULT=
 GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 58d1f2a7efcf3037c17e09f64ad6ba290ed441c8 33d930e59a98fa1=
0a0db9f56c7fa2f21a4aef9b9 --
> git bisect  bad 5720e7e5993e494839b565985f40d2a1cf49027e  # 04:10  B     =
 0    10   23   0  Merge 'block/for-linus' into devel-hourly-2017102121
> git bisect  bad bfe628115f7311b6e0028ffe0663b6ef06b631fe  # 05:30  B     =
 0    11   28   4  Merge 'stblinux/maintainers/next' into devel-hourly-2017=
102121
> git bisect  bad e27d3aaa536595e7e4e96fbd04d56d204dea0f99  # 05:53  B     =
 0     8   21   0  Merge 'linux-review/Michael-Chan/bnxt_en-bug-fixes/20171=
016-152002' into devel-hourly-2017102121
> git bisect  bad 6a46db5926ea9b485964efc7b60f1aa12f7a7e6f  # 06:16  B     =
 0    11   24   0  Merge 'omap/omap-for-v4.15/ti-sysc' into devel-hourly-20=
17102121
> git bisect good 4270cecd1604755495fc85dccba9273dd6f78e9c  # 07:04  G     =
11     0    0   0  Merge 'nfs/testing' into devel-hourly-2017102121
> git bisect  bad cc4ab61997eaaea202fe44a1a238f183d709d495  # 07:22  B     =
 0    11   27   3  Merge 'kemi/cache_layer' into devel-hourly-2017102121
> git bisect good f532766abc2c0470de69fb60ce15ba8ce8cc3cce  # 07:57  G     =
11     0    0   0  Merge 'arm-soc/qcom/defconfig' into devel-hourly-2017102=
121
> git bisect good 72d8d1ecf3146784b5adfa74150c50e5c2675a73  # 08:19  G     =
11     0    0   0  Merge 'efi/next' into devel-hourly-2017102121
> git bisect good 6c6b71474548bed31c69f1174238b6e45d45580c  # 08:29  G     =
11     0    0   0  Merge 'm68knommu/cfmmu' into devel-hourly-2017102121
> git bisect good 76ba89c76f2c74e208d93a9e7c698e39eeb3b85c  # 08:44  G     =
11     0    0   0  commoncap: move assignment of fs_ns to avoid null pointe=
r dereference
> git bisect good eb62722a06c4e6715c71e5c8fcf14aed857c0964  # 09:55  G     =
11     0    0   0  Merge branch 'i2c/for-current' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/wsa/linux
> git bisect good 3eea56cc5ab6992f4e1265b61e191a85fd183a08  # 10:14  G     =
11     0    0   0  Merge branch 'drm-fixes-4.14' of git://people.freedeskto=
p.org/~agd5f/linux into drm-fixes
> git bisect good dd00ed9eff1e1819922f91da965f0e57e6a94216  # 11:37  G     =
11     0    0   0  drm/i915: Use a mask when applying WaProgramL3SqcReg1Def=
ault
> git bisect good c925e0ea500d6bce337a26a649eba122f45aecb2  # 12:08  G     =
11     0    0   0  Merge tag 'mmc-v4.14-rc4' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/ulfh/mmc
> git bisect good 9a27ded2195aaec2041ed2525ba7f373c60920c7  # 12:25  G     =
10     0    0   0  Merge tag 'for-linus-4.14c-rc6-tag' of git://git.kernel.=
org/pub/scm/linux/kernel/git/xen/tip
> git bisect  bad c756515ec4fad53ada6b3f3777f536da40d76479  # 14:08  B     =
 0    11   28   4  introduce a cache layer for buddy system
> # first bad commit: [c756515ec4fad53ada6b3f3777f536da40d76479] introduce =
a cache layer for buddy system
> git bisect good 9a27ded2195aaec2041ed2525ba7f373c60920c7  # 14:14  G     =
31     0    0   0  Merge tag 'for-linus-4.14c-rc6-tag' of git://git.kernel.=
org/pub/scm/linux/kernel/git/xen/tip
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect  bad c756515ec4fad53ada6b3f3777f536da40d76479  # 14:48  B     =
 0    11   28   4  introduce a cache layer for buddy system
> # extra tests on HEAD of linux-devel/devel-hourly-2017102121
> git bisect  bad 58d1f2a7efcf3037c17e09f64ad6ba290ed441c8  # 14:49  B     =
 0    46   63   1  0day head guard for 'devel-hourly-2017102121'
> # extra tests on tree/branch kemi/cache_layer
> git bisect  bad c756515ec4fad53ada6b3f3777f536da40d76479  # 14:50  B     =
 0    15   28   0  introduce a cache layer for buddy system
> # extra tests with first bad commit reverted
> git bisect good 437d82e6902a8b03800afa1cbda361e785c0edf7  # 15:08  G     =
11     0    0   0  Revert "introduce a cache layer for buddy system"
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion
>=20

--===============6862259540569916349==--

