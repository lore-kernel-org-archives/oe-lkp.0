Content-Type: multipart/mixed; boundary="===============4236121043523925699=="
MIME-Version: 1.0
From: Florian Fainelli <f.fainelli@gmail.com>
To: lkp@lists.01.org
Subject: Re: e4dace3615 ("lib: add test module for CONFIG_DEBUG_VIRTUAL"): [ 10.185572] kernel BUG at arch/x86/mm/physaddr.c:75!
Date: Tue, 03 Oct 2017 19:09:37 -0700
Message-ID: <583e8d4a-560f-6ac7-4475-f39ddebb4417@gmail.com>
In-Reply-To: <20171003142442.5pt3z2ep4cinfyhz@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4236121043523925699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Fengguang,

On 10/03/2017 07:24 AM, Fengguang Wu wrote:
> Hi Florian,
> =

> FYI we see this BUG in latest RC kernel and linux-next.
> Have it been fixed somewhere else?

The purpose of the test module is to make tests for CONFIG_DEBUG_VIRTUAL
trigger such warnings/VIRTUAL_BUG_ON, because of how the test is coded,
you may want to not load such module. If the module needs to be moved to
another directory because lib/* contains mostly functional tests, let me
know and I will cook something.

Thanks!

> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> commit e4dace3615526fd66c86dd535ee4bc9e8c706e37
> Author:     Florian Fainelli <f.fainelli@gmail.com>
> AuthorDate: Fri Sep 8 16:15:31 2017 -0700
> Commit:     Linus Torvalds <torvalds@linux-foundation.org>
> CommitDate: Fri Sep 8 18:26:49 2017 -0700
> =

>      lib: add test module for CONFIG_DEBUG_VIRTUAL
>      =

>      Add a test module that allows testing that CONFIG_DEBUG_VIRTUAL works
>      correctly, at least that it can catch invalid calls to virt_to_phys()
>      against the non-linear kernel virtual address map.
>      =

>      Link: http://lkml.kernel.org/r/20170808164035.26725-1-f.fainelli(a)g=
mail.com
>      Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>      Cc: "Luis R. Rodriguez" <mcgrof@kernel.org>
>      Cc: Kees Cook <keescook@chromium.org>
>      Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>      Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
> =

> 9888a588ea  lib/hexdump.c: return -EINVAL in case of error in hex2bin()
> e4dace3615  lib: add test module for CONFIG_DEBUG_VIRTUAL
> 9e66317d3c  Linux 4.14-rc3
> 1418b85217  Add linux-next specific files for 20170929
> +------------------------------------------+------------+------------+---=
--------+---------------+
> |                                          | 9888a588ea | e4dace3615 | v4=
.14-rc3 | next-20170929 |
> +------------------------------------------+------------+------------+---=
--------+---------------+
> | boot_successes                           | 34         | 0          | 0 =
        | 0             |
> | boot_failures                            | 0          | 15         | 11=
        | 11            |
> | kernel_BUG_at_arch/x86/mm/physaddr.c     | 0          | 15         | 11=
        | 11            |
> | invalid_opcode:#[##]                     | 0          | 15         | 11=
        | 11            |
> | EIP:__phys_addr                          | 0          | 15         | 11=
        | 11            |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 15         | 11=
        | 11            |
> +------------------------------------------+------------+------------+---=
--------+---------------+
> =

> [    9.837344] test_firmware: interface ready
> [    9.838286] test passed
> [    9.839498] test_printf: all 260 tests passed
> [   10.183840] test_bitmap: all 460506 tests passed
> [   10.184882] ------------[ cut here ]------------
> [   10.185572] kernel BUG at arch/x86/mm/physaddr.c:75!
> [   10.186568] invalid opcode: 0000 [#1]
> [   10.187104] CPU: 0 PID: 1 Comm: swapper Not tainted 4.13.0-09302-ge4da=
ce3 #1
> [   10.187547] task: 91c45000 task.stack: 91c54000
> [   10.187547] EIP: __phys_addr+0x244/0x2a0
> [   10.187547] EFLAGS: 00210246 CPU: 0
> [   10.187547] EAX: 00000000 EBX: 92fe0000 ECX: 00000000 EDX: 00000001
> [   10.187547] ESI: 12fe0000 EDI: 00000000 EBP: 8464e539 ESP: 91c55f08
> [   10.187547]  DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068
> [   10.187547] CR0: 80050033 CR2: 00000000 CR3: 04792000 CR4: 00000690
> [   10.187547] Call Trace:
> [   10.187547]  ? vprintk_func+0x88/0x150
> [   10.187547]  ? test_bitmap_init+0xe7/0xe7
> [   10.187547]  ? test_debug_virtual_init+0x22/0xf0
> [   10.187547]  ? do_one_initcall+0x127/0x3c8
> [   10.187547]  ? kernel_init_freeable+0x217/0x3de
> [   10.187547]  ? kernel_init_freeable+0x245/0x3de
> [   10.187547]  ? rest_init+0x200/0x200
> [   10.187547]  ? kernel_init+0x17/0x340
> [   10.187547]  ? rest_init+0x200/0x200
> [   10.187547]  ? schedule_tail_wrapper+0x6/0x8
> [   10.187547]  ? rest_init+0x200/0x200
> [   10.187547]  ? ret_from_fork+0x19/0x24
> [   10.187547] Code: c9 ba 01 00 00 00 c7 04 24 00 00 00 00 b8 08 31 17 8=
4 e8 30 58 19 00 ff 05 74 c1 1f 84 83 05 20 01 7e 84 01 83 15 24 01 7e 84 0=
0 <0f> 0b 83 05 30 01 7e 84 01 83 15 34 01 7e 84 00 8d 74 26 00 83
> [   10.187547] EIP: __phys_addr+0x244/0x2a0 SS:ESP: 0068:91c55f08
> [   10.205865] ---[ end trace 2cb481e044fc1df9 ]---
> [   10.206542] Kernel panic - not syncing: Fatal exception
> =

>                                                            # HH:MM RESULT=
 GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e v4.13 --
> git bisect good 3aea311c1b4002bd730a09530f80f2f2ad3bf495  # 04:45  G     =
10     0    0   0  genksyms: fix gperf removal conversion
> git bisect  bad 6d8ef53e8b2fed8b0f91df0c6da7cc92747d934a  # 05:12  B     =
 0     9   21   0  Merge tag 'f2fs-for-4.14' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/jaegeuk/f2fs
> git bisect  bad d719518d9ce9132bad8a06e8029aeead328f66a3  # 05:40  B     =
 0     9   21   0  Merge git://git.kernel.org/pub/scm/linux/kernel/git/dave=
m/sparc-next
> git bisect good c054be10ffdbd5507a1fd738067d76acfb4808fd  # 19:53  G     =
10     0    0   0  remove gperf left-overs from build system
> git bisect  bad 8c1d70b2de517e7b44dcac24416e60c9662db507  # 20:35  B     =
 0     9   24   3  Merge tag 'vfio-v4.14-rc1' of git://github.com/awilliam/=
linux-vfio
> git bisect  bad 126e76ffbf78d9e948b641aadb265d16c57f5a3d  # 21:17  B     =
 0    10   26   4  Merge branch 'for-4.14/block-postmerge' of git://git.ker=
nel.dk/linux-block
> git bisect  bad fbf4432ff71b7a25bef993a5312906946d27f446  # 21:27  B     =
 0     1   13   0  Merge branch 'akpm' (patches from Andrew)
> git bisect  bad 7ed1da84b3d88ce080ee89a26e8885c9509d1d2d  # 21:56  B     =
 0     8   20   0  autofs: drop wrong comment
> git bisect good 3b3c4babd898715926d24ae10aa64778ace33aae  # 18:57  G     =
10     0    0   0  lib/string.c: add multibyte memset functions
> git bisect good b2ac2ea6296e7dd779168eb085b09d0fab9d1294  # 09:23  G     =
10     0    0   0  fs/epoll: use faster rb_first_cached()
> git bisect  bad 63b7c73ec86b8c73560d22c7552bc6f47f0b8da9  # 09:50  B     =
 0     1   17   4  checkpatch: add --strict check for ifs with unnecessary =
parentheses
> git bisect  bad 60ef690018b262ddcd0d51edf10e40710deb9c9f  # 10:13  B     =
 0     1   17   4  bitmap: introduce BITMAP_FROM_U64()
> git bisect good 9888a588ea96ba2804f955bbc2667346719da887  # 00:47  G     =
11     0    0   0  lib/hexdump.c: return -EINVAL in case of error in hex2bi=
n()
> git bisect  bad 0a5ce0831d04382aa9e2420e33dff958ddade542  # 01:06  B     =
 0     1   14   1  lib/bitmap.c: make bitmap_parselist() thread-safe and mu=
ch faster
> git bisect  bad e4dace3615526fd66c86dd535ee4bc9e8c706e37  # 01:27  B     =
 0     1   17   4  lib: add test module for CONFIG_DEBUG_VIRTUAL
> # first bad commit: [e4dace3615526fd66c86dd535ee4bc9e8c706e37] lib: add t=
est module for CONFIG_DEBUG_VIRTUAL
> git bisect good 9888a588ea96ba2804f955bbc2667346719da887  # 15:53  G     =
31     0    0   0  lib/hexdump.c: return -EINVAL in case of error in hex2bi=
n()
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect  bad e4dace3615526fd66c86dd535ee4bc9e8c706e37  # 16:10  B     =
 0     1   15   2  lib: add test module for CONFIG_DEBUG_VIRTUAL
> # extra tests on HEAD of linux-devel/devel-catchup-201709290308
> git bisect  bad fb3c6c6bf2d191751baa1c92927631cd7d3480ef  # 16:16  B     =
 0    34   49   0  0day head guard for 'devel-catchup-201709290308'
> # extra tests on tree/branch linus/master
> git bisect  bad 9e66317d3c92ddaab330c125dfe9d06eee268aff  # 16:52  B     =
 0     3   15   0  Linux 4.14-rc3
> # extra tests with first bad commit reverted
> git bisect good e757f3a215d2d63f0d873d3985b28971669fcd90  # 07:50  G     =
10     0    0   0  Revert "lib: add test module for CONFIG_DEBUG_VIRTUAL"
> # extra tests on tree/branch linux-next/master
> git bisect  bad 1418b852174ad50b3cb4738b8801626aefdc0bd9  # 08:51  B     =
 0    11   23   0  Add linux-next specific files for 20170929
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion
> =


-- =

Florian

--===============4236121043523925699==--

