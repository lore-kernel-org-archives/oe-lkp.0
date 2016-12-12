Content-Type: multipart/mixed; boundary="===============1400324734266299028=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [inotify] 93104cc99b: BUG kmalloc-512 (Not tainted): Freepointer corrupt
Date: Mon, 12 Dec 2016 14:02:35 +1300
Message-ID: <87pokyklhw.fsf@xmission.com>
In-Reply-To: <584c3bc6.dy9GD0Xx72Db+CIh%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1400324734266299028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <fengguang.wu@intel.com> writes:

> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.g=
it
> for-testing

Nikolay.  Unfortunately your inotify patch appears to be obviously
correct and subtlely wrong.

I will be happy to pick this up for 4.11 if we can figure out what is
wrong.

Eric

> commit 93104cc99b44e21bdd3eb0fe86e24147c4eb01ae
> Author:     Nikolay Borisov <kernel@kyup.com>
> AuthorDate: Tue Oct 11 10:36:22 2016 +0300
> Commit:     Eric W. Biederman <ebiederm@xmission.com>
> CommitDate: Fri Dec 9 15:59:55 2016 +1300
>
>     inotify: Convert to using per-namespace limits (Kbuild failure???)
>     =

>     This patchset converts inotify to using the newly introduced
>     per-userns sysctl infrastructure.
>     =

>     Currently the inotify instances/watches are being accounted in the
>     user_struct structure. This means that in setups where multiple
>     users in unprivileged containers map to the same underlying
>     real user (i.e. pointing to the same user_struct) the inotify limits
>     are going to be shared as well, allowing one user(or application) to =
exhaust
>     all others limits.
>     =

>     Fix this by switching the inotify sysctls to using the
>     per-namespace/per-user limits. This will allow the server admin to
>     set sensible global limits, which can further be tuned inside every
>     individual user namespace. Additionally, in order to preserve the
>     sysctl ABI make the existing inotify instances/watches sysctls
>     modify the values of the initial user namespace.
>     =

>     Acked-by: Jan Kara <jack@suse.cz>
>     Acked-by: Serge Hallyn <serge@hallyn.com>
>     Signed-off-by: Nikolay Borisov <kernel@kyup.com>
>     Signed-off-by: Eric W. Biederman <ebiederm@xmission.com>
>
> +-------------------------------------------------------+------------+---=
---------+-----------------+
> |                                                       | 19339c2516 | 93=
104cc99b | v4.9-rc8_121009 |
> +-------------------------------------------------------+------------+---=
---------+-----------------+
> | boot_successes                                        | 454        | 14=
4        | 12              |
> | boot_failures                                         | 0          | 16=
         | 5               |
> | BUG_kmalloc-#(Not_tainted):Freepointer_corrupt        | 0          | 14=
         | 2               |
> | INFO:Allocated_in_setup_userns_sysctls_age=3D#cpu=3D#pid=3D | 0        =
  | 14         | 2               |
> | INFO:Freed_in_load_elf_binary_age=3D#cpu=3D#pid=3D          | 0        =
  | 5          | 1               |
> | INFO:Slab#objects=3D#used=3D#fp=3D#flags=3D                   | 0      =
    | 14         | 2               |
> | INFO:Object#@offset=3D#fp=3D                              | 0          =
| 14         | 2               |
> | calltrace:free_user_ns                                | 0          | 14=
         | 2               |
> | INFO:Freed_in_skb_free_head_age=3D#cpu=3D#pid=3D            | 0        =
  | 7          | 1               |
> | INFO:Freed_in_kvfree_age=3D#cpu=3D#pid=3D                   | 0        =
  | 2          |                 |
> | INFO:Freed_in_tty_port_destructor_age=3D#cpu=3D#pid=3D      | 0        =
  | 1          |                 |
> | BUG_kmalloc-#(Tainted:G_B):Freepointer_corrupt        | 0          | 1 =
         |                 |
> | BUG:kernel_reboot-without-warning_in_test_stage       | 0          | 2 =
         | 1               |
> | BUG:kernel_hang_in_test_stage                         | 0          | 0 =
         | 2               |
> +-------------------------------------------------------+------------+---=
---------+-----------------+
>
> [main] Random reseed: 1790578135
> [child1:510] uid changed! Was: 0, now 189
> [   28.566643] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> [   28.568441] BUG kmalloc-512 (Not tainted): Freepointer corrupt
> [   28.569551] ----------------------------------------------------------=
-------------------
> [   28.569551] =

> [   28.571858] Disabling lock debugging due to kernel taint
> [   28.572911] INFO: Allocated in setup_userns_sysctls+0x57/0x113 age=3D1=
8 cpu=3D1 pid=3D507
> [   28.582721] INFO: Freed in skb_free_head+0x50/0x61 age=3D2743 cpu=3D1 =
pid=3D454
> [   28.593455] INFO: Slab 0xffff88001de34900 objects=3D19 used=3D14 fp=3D=
0xffff8800147246a8 flags=3D0x403fff804081
> [   28.595345] INFO: Object 0xffff8800147249f8 @offset=3D2552 fp=3D0xffff=
880014b001e0
> [   28.595345] =

> [   28.597538] Redzone ffff8800147249f0: cc cc cc cc cc cc cc cc         =
                 ........
> [   28.599337] Object ffff8800147249f8: 6c a7 4e 82 ff ff ff ff c0 01 b0 =
14 00 88 ff ff  l.N.............
> [   28.601197] Object ffff880014724a08: 04 00 00 00 a4 01 00 00 00 00 00 =
00 00 00 00 00  ................
> [   28.603072] Object ffff880014724a18: 55 e5 14 81 ff ff ff ff 00 00 00 =
00 00 00 00 00  U...............
> [   28.604947] Object ffff880014724a28: 40 8a 1b 83 ff ff ff ff 20 de 8d =
82 ff ff ff ff  @....... .......
> [   28.606821] Object ffff880014724a38: 80 a7 4e 82 ff ff ff ff c4 01 b0 =
14 00 88 ff ff  ..N.............
> [   28.608698] Object ffff880014724a48: 04 00 00 00 a4 01 00 00 00 00 00 =
00 00 00 00 00  ................
> [   28.610558] Object ffff880014724a58: 55 e5 14 81 ff ff ff ff 00 00 00 =
00 00 00 00 00  U...............
> [   28.612427] Object ffff880014724a68: 40 8a 1b 83 ff ff ff ff 20 de 8d =
82 ff ff ff ff  @....... .......
> [   28.614329] Object ffff880014724a78: 93 a7 4e 82 ff ff ff ff c8 01 b0 =
14 00 88 ff ff  ..N.............
> [   28.616196] Object ffff880014724a88: 04 00 00 00 a4 01 00 00 00 00 00 =
00 00 00 00 00  ................
> [   28.618067] Object ffff880014724a98: 55 e5 14 81 ff ff ff ff 00 00 00 =
00 00 00 00 00  U...............
> [   28.619946] Object ffff880014724aa8: 40 8a 1b 83 ff ff ff ff 20 de 8d =
82 ff ff ff ff  @....... .......
> [   28.621813] Object ffff880014724ab8: a6 a7 4e 82 ff ff ff ff cc 01 b0 =
14 00 88 ff ff  ..N.............
> [   28.623677] Object ffff880014724ac8: 04 00 00 00 a4 01 00 00 00 00 00 =
00 00 00 00 00  ................
> [   28.625541] Object ffff880014724ad8: 55 e5 14 81 ff ff ff ff 00 00 00 =
00 00 00 00 00  U...............
> [   28.627418] Object ffff880014724ae8: 40 8a 1b 83 ff ff ff ff 20 de 8d =
82 ff ff ff ff  @....... .......
> [   28.629304] Object ffff880014724af8: b9 a7 4e 82 ff ff ff ff d0 01 b0 =
14 00 88 ff ff  ..N.............
> [   28.631184] Object ffff880014724b08: 04 00 00 00 a4 01 00 00 00 00 00 =
00 00 00 00 00  ................
> [   28.633054] Object ffff880014724b18: 55 e5 14 81 ff ff ff ff 00 00 00 =
00 00 00 00 00  U...............
> [   28.634930] Object ffff880014724b28: 40 8a 1b 83 ff ff ff ff 20 de 8d =
82 ff ff ff ff  @....... .......
> [   28.636791] Object ffff880014724b38: cc a7 4e 82 ff ff ff ff d4 01 b0 =
14 00 88 ff ff  ..N.............
> [   28.638656] Object ffff880014724b48: 04 00 00 00 a4 01 00 00 00 00 00 =
00 00 00 00 00  ................
> [   28.640534] Object ffff880014724b58: 55 e5 14 81 ff ff ff ff 00 00 00 =
00 00 00 00 00  U...............
> [   28.642394] Object ffff880014724b68: 40 8a 1b 83 ff ff ff ff 20 de 8d =
82 ff ff ff ff  @....... .......
> [   28.644276] Object ffff880014724b78: df a7 4e 82 ff ff ff ff d8 01 b0 =
14 00 88 ff ff  ..N.............
> [   28.646154] Object ffff880014724b88: 04 00 00 00 a4 01 00 00 00 00 00 =
00 00 00 00 00  ................
> [   28.648026] Object ffff880014724b98: 55 e5 14 81 ff ff ff ff 00 00 00 =
00 00 00 00 00  U...............
> [   28.649899] Object ffff880014724ba8: 40 8a 1b 83 ff ff ff ff 20 de 8d =
82 ff ff ff ff  @....... .......
> [   28.651772] Object ffff880014724bb8: 00 00 00 00 00 00 00 00 dc 01 b0 =
14 00 88 ff ff  ................
> [   28.653637] Object ffff880014724bc8: 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00  ................
> [   28.655532] Object ffff880014724bd8: 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00  ................
> [   28.657404] Object ffff880014724be8: 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00  ................
> [   28.659278] Redzone ffff880014724bf8: cc cc cc cc cc cc cc cc         =
                 ........
> [   28.661095] Padding ffff880014724d38: 5a 5a 5a 5a 5a 5a 5a 5a         =
                 ZZZZZZZZ
> [   28.662908] CPU: 0 PID: 33 Comm: kworker/0:1 Tainted: G    B          =
 4.9.0-rc6-00006-g93104cc #1
> [   28.664737] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [   28.666704] Workqueue: events free_user_ns
> [   28.667680]  ffff88001a213c08 ffffffff8183eb59 ffffffff00000001 ffff88=
00147249f8
> [   28.669620]  ffff88001d402cc0 ffff880014724000 ffff88001a213c38 ffffff=
ff8129dc14
> [   28.671553]  ffff88001d402cc0 ffff88001de34900 ffff8800147249f8 000000=
00000000cc
> [   28.673479] Call Trace:
> [   28.674213]  [<ffffffff8183eb59>] dump_stack+0xfd/0x141
> [   28.675283]  [<ffffffff8129dc14>] print_trailer+0x1bf/0x1cf
> [   28.676359]  [<ffffffff8129fce0>] object_err+0x3d/0x4b
> [   28.677382]  [<ffffffff812a01c1>] check_object+0x281/0x2a6
> [   28.678448]  [<ffffffff812a03c2>] free_debug_processing+0x1dc/0x339
> [   28.679604]  [<ffffffff811742e1>] ? retire_userns_sysctls+0x48/0x54
> [   28.680767]  [<ffffffff812a115b>] __slab_free+0x79/0x406
> [   28.692399]  [<ffffffff81358921>] ? drop_sysctl_table+0x14b/0x156
> [   28.693580]  [<ffffffff812a3354>] kfree+0x107/0x14a
> [   28.694575]  [<ffffffff812a3354>] ? kfree+0x107/0x14a
> [   28.695595]  [<ffffffff811742e1>] retire_userns_sysctls+0x48/0x54
> [   28.696730]  [<ffffffff811e7aaf>] free_user_ns+0x3a/0xbd
> [   28.697769]  [<ffffffff81164ca3>] process_one_work+0x212/0x32d
> [   28.698882]  [<ffffffff81165624>] worker_thread+0x39d/0x573
> [   28.699963]  [<ffffffff81165287>] ? rescuer_thread+0x472/0x472
> [   28.701067]  [<ffffffff8116da13>] kthread+0x113/0x129
> [   28.702084]  [<ffffffff8116d900>] ? init_completion+0x3b/0x3b
> [   28.703180]  [<ffffffff8210dd55>] ret_from_fork+0x25/0x30
> [   28.704258] FIX kmalloc-512: Object at 0xffff8800147249f8 not freed
> [watchdog] [490] Watchdog exiting
> [child0:492] child exiting.
>
> git bisect start ab03057a247f393a271cc183a9f26c7f251ed278 3e5de27e940d00d=
8d504dfb96625fb654f641509 --
> git bisect good 0659dd17c862e94b2e61722e421a52d0ba4813c8  # 21:48    122+=
      0  Merge 'abelloni/ab/at91-4.12' into devel-hourly-2016121009
> git bisect good 1038f1f3af3c53b3b5d5612e375dde727cf9b99d  # 21:52    122+=
      0  Merge 'linux-review/Eric-Dumazet/packet-fix-race-condition-in-pack=
et_set_ring/20161201-131141' into devel-hourly-2016121009
> git bisect  bad 5a213ee31475dfa81d3a9ef2eb825fd965a6f948  # 21:52      0-=
      4  Merge 'baolu/xhci/refactor/alpha/1' into devel-hourly-2016121009
> git bisect good 9a0811c235c2a8629dcf56c6bb30f4101017b1c4  # 21:57    125+=
      1  Merge 'linux-review/Viresh-Kumar/PM-OPP-Allow-inactive-opp_device-=
to-be-present-in-dev-list/20161129-134525' into devel-hourly-2016121009
> git bisect good 79f969ba3f16794cc45ff30ee40f7ddfde197d06  # 22:00    121+=
      0  Merge 'linux-review/Aniroop-Mathur/Input-keyboard-lm8323-Change-ms=
leep-to-usleep_range-for-small-msecs/20161129-030330' into devel-hourly-201=
6121009
> git bisect good 9c8701f542edbeb5d1c74281d78d995e65cce744  # 22:04    122+=
      0  Merge 'linux-review/OGAWA-Hirofumi/Re-PATCH-2-3-v3-xhci-Fix-race-r=
elated-to-abort-operation/20161128-204117' into devel-hourly-2016121009
> git bisect good ca168e508a3701e9c21a13643a929f51cd87dbe8  # 22:10    121+=
      0  Merge 'linux-review/Peter-Foley/Fixes-for-compiling-with-clang/201=
61128-144840' into devel-hourly-2016121009
> git bisect good 0793e1839a05943d068c0250c6b0f4c01e261694  # 22:15    117+=
      0  Merge 'security/next' into devel-hourly-2016121009
> git bisect  bad 738289094a8a7a5247d36fa453f88bb88f4ba1d6  # 22:15      0-=
      8  Merge 'userns/for-testing' into devel-hourly-2016121009
> git bisect good f84df2a6f268de584a201e8911384a2d244876e3  # 22:46    154+=
      0  exec: Ensure mm->user_ns contains the execed files
> git bisect  bad 93104cc99b44e21bdd3eb0fe86e24147c4eb01ae  # 23:04      1-=
      1  inotify: Convert to using per-namespace limits (Kbuild failure???)
> git bisect good 19339c251607a3defc7f089511ce8561936fee45  # 23:25    158+=
      0  Revert "evm: Translate user/group ids relative to s_user_ns when c=
omputing HMAC"
> # first bad commit: [93104cc99b44e21bdd3eb0fe86e24147c4eb01ae] inotify: C=
onvert to using per-namespace limits (Kbuild failure???)
> git bisect good 19339c251607a3defc7f089511ce8561936fee45  # 23:36    454+=
      0  Revert "evm: Translate user/group ids relative to s_user_ns when c=
omputing HMAC"
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect  bad 93104cc99b44e21bdd3eb0fe86e24147c4eb01ae  # 23:52      0-=
      4  inotify: Convert to using per-namespace limits (Kbuild failure???)
> # extra tests on HEAD of linux-devel/devel-hourly-2016121009
> git bisect  bad ab03057a247f393a271cc183a9f26c7f251ed278  # 23:53      0-=
      5  0day head guard for 'devel-hourly-2016121009'
> # extra tests on tree/branch userns/for-testing
> git bisect  bad a5e7d87b70eca577cee91ad63c64fe673133409f  # 00:15      0-=
      1  user-namespaced file capabilities - now with even more magic
> # extra tests with first bad commit reverted
> git bisect good e9e7a0da2ba026c03dd1259bc6e56e839c24fc74  # 00:44    448+=
      0  Revert "inotify: Convert to using per-namespace limits (Kbuild fai=
lure???)"
> # extra tests on tree/branch linus/master
> git bisect good 810ac7b7558d7830e72d8dbf34b851fce39e08b0  # 01:21    447+=
      1  Merge branch 'libnvdimm-fixes' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/nvdimm/nvdimm
> # extra tests on tree/branch linux-next/master
> git bisect  bad 4a71e4389b1f8bbf02f43522c234143fd571dcb8  # 01:30      0-=
      1  Add linux-next specific files for 20161209
>
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion

--===============1400324734266299028==--

