Content-Type: multipart/mixed; boundary="===============6082437279977102335=="
MIME-Version: 1.0
From: Mukesh Ojha <mojha@codeaurora.org>
To: lkp@lists.01.org
Subject: Re: b050de0f98 ("fs/binfmt_elf.c: free PT_INTERP filename ASAP"): BUG: KASAN: null-ptr-deref in allow_write_access
Date: Tue, 02 Apr 2019 20:53:42 +0530
Message-ID: <86f16af9-961f-5057-6596-c95c0316f7da@codeaurora.org>
In-Reply-To: <5ca377a6.5zcN4o4WezY4tfcr%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6082437279977102335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I think, this may fix the problem.

https://patchwork.kernel.org/patch/10878501/


Thanks,
Mukesh

On 4/2/2019 8:24 PM, kernel test robot wrote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>
> commit b050de0f986606011986698de504c0dbc12c40dc
> Author:     Alexey Dobriyan <adobriyan@gmail.com>
> AuthorDate: Fri Mar 29 10:02:05 2019 +1100
> Commit:     Stephen Rothwell <sfr@canb.auug.org.au>
> CommitDate: Sat Mar 30 16:09:51 2019 +1100
>
>      fs/binfmt_elf.c: free PT_INTERP filename ASAP
>      =

>      There is no reason for PT_INTERP filename to linger till the end of
>      the whole loading process.
>      =

>      Link: http://lkml.kernel.org/r/20190314204953.GD18143(a)avx2
>      Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
>      Reviewed-by: Andrew Morton <akpm@linux-foundation.org>
>      Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>      Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>
> 46238614d8  fs/binfmt_elf.c: make scope of "pos" variable smaller
> b050de0f98  fs/binfmt_elf.c: free PT_INTERP filename ASAP
> 05d08e2995  Add linux-next specific files for 20190402
> +---------------------------------------------------------------+--------=
----+------------+---------------+
> |                                                               | 4623861=
4d8 | b050de0f98 | next-20190402 |
> +---------------------------------------------------------------+--------=
----+------------+---------------+
> | boot_successes                                                | 7      =
    | 0          | 0             |
> | boot_failures                                                 | 10     =
    | 12         | 13            |
> | invoked_oom-killer:gfp_mask=3D0x                                | 2    =
      |            |               |
> | Mem-Info                                                      | 2      =
    |            |               |
> | BUG:KASAN:slab-out-of-bounds_in_d                             | 1      =
    |            |               |
> | PANIC:double_fault                                            | 1      =
    |            |               |
> | WARNING:stack_going_in_the_wrong_direction?ip=3Ddouble_fault/0x | 1    =
      |            |               |
> | RIP:lockdep_hardirqs_off                                      | 1      =
    |            |               |
> | Kernel_panic-not_syncing:Machine_halted                       | 1      =
    |            |               |
> | RIP:perf_trace_x86_exceptions                                 | 1      =
    |            |               |
> | BUG:soft_lockup-CPU##stuck_for#s                              | 7      =
    | 6          | 3             |
> | RIP:__slab_alloc                                              | 3      =
    | 0          | 1             |
> | Kernel_panic-not_syncing:softlockup:hung_tasks                | 7      =
    | 6          | 3             |
> | RIP:_raw_spin_unlock_irqrestore                               | 3      =
    | 1          |               |
> | RIP:__asan_load8                                              | 1      =
    | 3          |               |
> | RIP:copy_user_generic_unrolled                                | 1      =
    |            |               |
> | Out_of_memory_and_no_killable_processes                       | 1      =
    |            |               |
> | Kernel_panic-not_syncing:System_is_deadlocked_on_memory       | 1      =
    |            |               |
> | BUG:KASAN:null-ptr-deref_in_a                                 | 0      =
    | 6          | 10            |
> | BUG:unable_to_handle_kernel                                   | 0      =
    | 6          | 10            |
> | Oops:#[##]                                                    | 0      =
    | 6          | 10            |
> | RIP:allow_write_access                                        | 0      =
    | 6          | 10            |
> | Kernel_panic-not_syncing:Fatal_exception                      | 0      =
    | 6          | 10            |
> | RIP:__orc_find                                                | 0      =
    | 1          | 1             |
> | RIP:arch_local_irq_save                                       | 0      =
    | 1          |               |
> | RIP:__asan_load1                                              | 0      =
    | 0          | 1             |
> +---------------------------------------------------------------+--------=
----+------------+---------------+
>
> /etc/rcS.d/S00fbsetup: line 3: /sbin/modprobe: not found
> Starting udev
> [   43.717047] gfs2: path_lookup on rootfs returned error -2
> Kernel tests: Boot OK!
> [   45.270185] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   45.277229] BUG: KASAN: null-ptr-deref in allow_write_access+0x12/0x30
> [   45.281161] Read of size 8 at addr 000000000000001e by task 90-trinity=
/625
> [   45.284197]
> [   45.285252] CPU: 0 PID: 625 Comm: 90-trinity Not tainted 5.1.0-rc2-004=
06-gb050de0 #1
> [   45.287960] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   45.288419] BUG: unable to handle kernel NULL pointer dereference at 0=
00000000000001e
> [   45.297363] Call Trace:
> [   45.297376]  dump_stack+0x74/0xb0
> [   45.300404] #PF error: [normal kernel read fault]
> [   45.301648]  ? allow_write_access+0x12/0x30
> [   45.303103] PGD 800000000af92067 P4D 800000000af92067 PUD 9870067 PMD 0
> [   45.303117] Oops: 0000 [#1] SMP KASAN PTI
> [   45.303124] CPU: 1 PID: 626 Comm: 90-trinity Not tainted 5.1.0-rc2-004=
06-gb050de0 #1
> [   45.303128] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   45.303137] RIP: 0010:allow_write_access+0x12/0x30
> [   45.303145] Code: 01 c5 31 c0 48 89 ef f3 ab 48 83 c4 60 89 d0 5b 5d 4=
1 5c 41 5d 41 5e c3 48 85 ff 74 2a 53 48 89 fb 48 8d 7f 20 e8 7d 89 f6 ff <=
48> 8b 5b 20 be 04 00 00 00 48 8d bb d0 01 00 00 e8 00 6e f6 ff f0
> [   45.303149] RSP: 0000:ffff888009ad7c68 EFLAGS: 00010247
> [   45.303155] RAX: 0000000000000001 RBX: fffffffffffffffe RCX: ffffffff8=
1307b8f
> [   45.303158] RDX: 0000000000000000 RSI: 0000000000000008 RDI: 000000000=
000001e
> [   45.303162] RBP: ffff88800a1410a3 R08: 0000000000000007 R09: 000000000=
0000007
> [   45.303167] R10: ffffed1001d656f7 R11: 0000000000000000 R12: 000000000=
0000000
> [   45.303171] R13: ffff88800a141088 R14: ffff88800de7d140 R15: ffff88800=
b2352c8
> [   45.303177] FS:  00007f4f532d6700(0000) GS:ffff88800eb00000(0000) knlG=
S:0000000000000000
> [   45.303181] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   45.303185] CR2: 000000000000001e CR3: 000000000a030004 CR4: 000000000=
03606e0
> [   45.303191] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [   45.303195] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [   45.303198] Call Trace:
> [   45.303208]  load_elf_binary+0x1548/0x15ae
> [   45.303215]  ? load_misc_binary+0x2aa/0x68c
> [   45.303223]  ? mark_held_locks+0x83/0x83
> [   45.303230]  ? match_held_lock+0x18/0xf8
> [   45.303237]  ? set_fs+0x29/0x29
> [   45.303246]  ? cpumask_test_cpu+0x28/0x28
> [   45.303255]  search_binary_handler+0xa2/0x20d
> [   45.303263]  __do_execve_file+0xa3d/0xe66
> [   45.303270]  ? open_exec+0x34/0x34
> [   45.303277]  ? strncpy_from_user+0xd9/0x18c
> [   45.303284]  do_execve+0x1c/0x1f
> [   45.303291]  __x64_sys_execve+0x41/0x48
> [   45.303299]  do_syscall_64+0x69/0x85
> [   45.303308]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> [   45.303314] RIP: 0033:0x7f4f52ddb807
> [   45.303321] Code: 77 19 f4 48 89 d7 44 89 c0 0f 05 48 3d 00 f0 ff ff 7=
6 e0 f7 d8 64 41 89 01 eb d8 f7 d8 64 41 89 01 eb df b8 3b 00 00 00 0f 05 <=
48> 3d 00 f0 ff ff 77 02 f3 c3 48 8b 15 00 a6 2d 00 f7 d8 64 89 02
> [   45.303324] RSP: 002b:00007ffc2f1cae88 EFLAGS: 00000206 ORIG_RAX: 0000=
00000000003b
> [   45.303331] RAX: ffffffffffffffda RBX: 00000000006925d8 RCX: 00007f4f5=
2ddb807
> [   45.303335] RDX: 0000000000692620 RSI: 00000000006925d8 RDI: 000000000=
06914d8
> [   45.303339] RBP: 0000000000691010 R08: 00000000006914d0 R09: 010101010=
1010101
> [   45.303343] R10: 00007ffc2f1cac10 R11: 0000000000000206 R12: 000000000=
06914d8
> [   45.303347] R13: 0000000000692620 R14: 0000000000692620 R15: 00007ffc2=
f1ccf60
> [   45.303351] Modules linked in:
> [   45.303357] CR2: 000000000000001e
> [   45.303367] ---[ end trace bbce985a62ebde0d ]---
> [   45.303373] RIP: 0010:allow_write_access+0x12/0x30
>
>                                                            # HH:MM RESULT=
 GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 05d08e2995cbe6efdb993482ee0d38a77040861a 79a3aaa7b82e310=
6be97842dedfd8429248896e6 --
> git bisect good 2dbd2d8f2c2ccd640f9cb6462e23f0a5ac67e1a2  # 18:33  G     =
11     0   11  11  Merge remote-tracking branch 'net-next/master'
> git bisect good d177ed11c13c43e0f5a289727c0237b9141ca458  # 18:45  G     =
12     0   11  11  Merge remote-tracking branch 'kvm-arm/next'
> git bisect good a1a606c7831374d6ef20ed04c16a76b44f79bcab  # 18:58  G     =
12     0   11  11  Merge remote-tracking branch 'rpmsg/for-next'
> git bisect good f2ea30d060707080d2d5f8532f0efebfa3a04302  # 19:21  G     =
12     0   11  11  Merge remote-tracking branch 'nvdimm/libnvdimm-for-next'
> git bisect good e006c7613228cfa7abefd1c5175e171e6ae2c4b7  # 19:34  G     =
12     0   11  11  Merge remote-tracking branch 'xarray/xarray'
> git bisect good 046b78627faba9a4b85c9f7a0bba764bbbbe76ff  # 19:49  G     =
12     0   12  12  Merge remote-tracking branch 'devfreq/for-next'
> git bisect  bad 1999d633921bdbbf76c7f1065d15ec237a977c02  # 20:05  B     =
 0     9   24   0  Merge branch 'akpm-current/current'
> git bisect good 4aa445a97c1da9d169f63377262709254e496f65  # 20:18  G     =
11     0   10  10  mm: introduce put_user_page*(), placeholder versions
> git bisect good f6e06951c4f5f330471530bd12a2b75ed5326005  # 20:37  G     =
11     0   11  11  lib/plist: rename DEBUG_PI_LIST to DEBUG_PLIST
> git bisect  bad ffbb2d4bbda0f0e82531b4a839cee3e6db0eb09f  # 20:52  B     =
 1     6    1   1  autofs: fix some word usage oddities in autofs.txt
> git bisect good bc341e1f87c0f100165c5fd2a693d2c90477e322  # 21:21  G     =
11     0   10  10  lib/test_bitmap.c: switch test_bitmap_parselist to ktime=
_get()
> git bisect good 11d2673e0f90086825df35385fc52d4cc9015c21  # 21:35  G     =
12     0   11  11  checkpatch: fix something
> git bisect good 46238614d8a1a3cde66abc7fd8c4b75c9e4793f3  # 21:51  G     =
12     0   10  10  fs/binfmt_elf.c: make scope of "pos" variable smaller
> git bisect  bad 42d4a144a5a5b05b981beb57b5f0891b2eb85b78  # 22:04  B     =
 0    10   25   0  fs/binfmt_elf.c: delete trailing "return;" in functions =
returning "void"
> git bisect  bad b050de0f986606011986698de504c0dbc12c40dc  # 22:21  B     =
 0     1   16   0  fs/binfmt_elf.c: free PT_INTERP filename ASAP
> # first bad commit: [b050de0f986606011986698de504c0dbc12c40dc] fs/binfmt_=
elf.c: free PT_INTERP filename ASAP
> git bisect good 46238614d8a1a3cde66abc7fd8c4b75c9e4793f3  # 22:24  G     =
34     0   27  37  fs/binfmt_elf.c: make scope of "pos" variable smaller
> # extra tests with debug options
> git bisect  bad b050de0f986606011986698de504c0dbc12c40dc  # 22:34  B     =
 4     8    4   4  fs/binfmt_elf.c: free PT_INTERP filename ASAP
> # extra tests on HEAD of linux-next/master
> git bisect  bad 05d08e2995cbe6efdb993482ee0d38a77040861a  # 22:34  B     =
 0    10   31   3  Add linux-next specific files for 20190402
> # extra tests on tree/branch linux-next/master
> git bisect  bad 05d08e2995cbe6efdb993482ee0d38a77040861a  # 22:35  B     =
 0    10   31   3  Add linux-next specific files for 20190402
> # extra tests with first bad commit reverted
> git bisect good 150238fdb7cd7234ce95fb083866dbf5f70082c9  # 22:53  G     =
13     0   11  11  Revert "fs/binfmt_elf.c: free PT_INTERP filename ASAP"
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion

--===============6082437279977102335==--

