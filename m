Content-Type: multipart/mixed; boundary="===============5063494393632426596=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm, page_alloc] c39e074e4f: INFO: trying to register non-static key.
Date: Tue, 20 Sep 2016 08:56:56 +0800
Message-ID: <8760pr4cdj.fsf@yhuang-dev.intel.com>
In-Reply-To: <57dfdad6.XysiJ91Qjmhw8Kc3%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5063494393632426596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Fengguang,

Thanks for reporting!

kernel test robot <fengguang.wu@intel.com> writes:

> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> yhuang/percpug
>
> commit c39e074e4f69d4db88805752466cf6053d91d6bf
> Author:     Huang Ying <ying.huang@intel.com>
> AuthorDate: Thu Sep 8 21:23:37 2016 -0700
> Commit:     Huang Ying <ying.huang@intel.com>
> CommitDate: Mon Sep 19 15:21:30 2016 +0800
>
>     mm, page_alloc: Use per CPU group page set
>     =

>     Just a prototype used for testing and verification.
>     =

>     Per CPU page set is changed to be shared by the CPUs in one CPU group.
>     This may reduce the burden of slow path (such as drain_all_pages)
>     without much performance cost on fast path.
>
> +-------------------------------------------------+------------+---------=
---+------------+
> |                                                 | 9c907537ab | c39e074e=
4f | d58e21b33b |
> +-------------------------------------------------+------------+---------=
---+------------+
> | boot_successes                                  | 112        | 26      =
   | 21         |
> | boot_failures                                   | 0          | 15      =
   | 14         |
> | calltrace:SyS_open                              | 0          | 1       =
   | 1          |
> | BUG:kernel_reboot-without-warning_in_test_stage | 0          | 1       =
   | 1          |
> | INFO:trying_to_register_non-static_key          | 0          | 14      =
   | 13         |
> | calltrace:sched_init_smp                        | 0          | 14      =
   | 13         |
> | BUG:unable_to_handle_kernel                     | 0          | 14      =
   | 13         |
> | Oops                                            | 0          | 14      =
   | 13         |
> | RIP:__list_del_entry                            | 0          | 14      =
   | 13         |
> | Kernel_panic-not_syncing:Fatal_exception        | 0          | 14      =
   | 13         |
> +-------------------------------------------------+------------+---------=
---+------------+

Just FYI, the more important bug in the patch should be
"BUG:unable_to_handle_kernel".  I think there is room to be improved
here :)

Best Regards,
Huang, Ying

> [    0.242466] ---------------------------------
> [    0.243120] smpboot: Total of 1 processors activated (5852.65 BogoMIPS)
> [    0.244490] CPU group number: 0
> [    0.245128] INFO: trying to register non-static key.
> [    0.245873] the code is fine but needs lockdep annotation.
> [    0.246688] turning off the locking correctness validator.
> [    0.247495] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.8.0-rc5-00007-=
gc39e074 #1
> [    0.248599]  0000000000000000 ffff88000004f970 ffffffff81281d4a 000000=
0000000000
> [    0.249767]  ffff88001fbdd9a8 0000000000000000 ffff880000048040 ffff88=
000004f9e0
> [    0.250931]  ffffffff810d0d43 ffffffff810cff05 ffff88000004fa40 000000=
0100000000
> [    0.252095] Call Trace:
> [    0.252474]  [<ffffffff81281d4a>] dump_stack+0xb3/0x119
> [    0.253252]  [<ffffffff810d0d43>] register_lock_class+0x1a3/0x4f0
> [    0.254152]  [<ffffffff810cff05>] ? __bfs+0x25/0x250
> [    0.254900]  [<ffffffff810d3cdd>] __lock_acquire+0xcd/0x16b0
> [    0.255739]  [<ffffffff810cff05>] ? __bfs+0x25/0x250
> [    0.256475]  [<ffffffff810d0283>] ? find_usage_backwards+0x63/0x70
> [    0.257388]  [<ffffffff8110ed3d>] ? __module_text_address+0xd/0x60
> [    0.258304]  [<ffffffff810d5905>] lock_acquire+0xa5/0xd0
> [    0.259102]  [<ffffffff8115c01a>] ? get_page_from_freelist+0x17a/0xa20
> [    0.260065]  [<ffffffff8158b788>] _raw_spin_lock+0x38/0x70
> [    0.260888]  [<ffffffff8115c01a>] ? get_page_from_freelist+0x17a/0xa20
> [    0.261860]  [<ffffffff8115c01a>] get_page_from_freelist+0x17a/0xa20
> [    0.262803]  [<ffffffff810d0739>] ? __lock_is_held+0x49/0x70
> [    0.263648]  [<ffffffff8115ce81>] __alloc_pages_nodemask+0xf1/0xc20
> [    0.264568]  [<ffffffff810d36c0>] ? mark_held_locks+0x80/0xa0
> [    0.265431]  [<ffffffff8158ce19>] ? retint_kernel+0x10/0x10
> [    0.266264]  [<ffffffff810d36c0>] ? mark_held_locks+0x80/0xa0
> [    0.267120]  [<ffffffff8119f4a8>] cache_alloc_refill+0x278/0x6d0
> [    0.268007]  [<ffffffff8119fb6d>] __kmalloc+0xdd/0x170
> [    0.268778]  [<ffffffff8128170d>] alloc_cpumask_var_node+0x2d/0x70
> [    0.269693]  [<ffffffff812817d3>] zalloc_cpumask_var+0x23/0x30
> [    0.270547]  [<ffffffff810cd9a6>] cpupri_init+0x56/0x160
> [    0.271341]  [<ffffffff810b14ed>] init_rootdomain+0x8d/0xc0
> [    0.272169]  [<ffffffff810b8502>] build_sched_domains+0x1f2/0xfb0
> [    0.273073]  [<ffffffff810d38fd>] ? trace_hardirqs_on+0xd/0x10
> [    0.273940]  [<ffffffff81281738>] ? alloc_cpumask_var_node+0x58/0x70
> [    0.274883]  [<ffffffff81c85522>] sched_init_smp+0x90/0x14b
> [    0.275717]  [<ffffffff81c6e229>] kernel_init_freeable+0xa5/0x21d
> [    0.276621]  [<ffffffff81583913>] kernel_init+0x13/0x160
> [    0.277403]  [<ffffffff810b5c6a>] ? schedule_tail+0xa/0x70
> [    0.278221]  [<ffffffff8158c68f>] ret_from_fork+0x1f/0x40
> [    0.279027]  [<ffffffff81583900>] ? rest_init+0x170/0x170
> [    0.279828] BUG: unable to handle kernel NULL pointer dereference at  =
         (null)
> [    0.281011] IP: [<ffffffff812a6bc1>] __list_del_entry+0x1/0xc0
> [    0.281896] PGD 0 =

> [    0.282228] Oops: 0000 [#1] SMP
> [    0.282705] Modules linked in:
> [    0.283186] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.8.0-rc5-00007-=
gc39e074 #1
> [    0.284279] task: ffff880000048040 task.stack: ffff88000004c000
> [    0.285150] RIP: 0010:[<ffffffff812a6bc1>]  [<ffffffff812a6bc1>] __lis=
t_del_entry+0x1/0xc0
> [    0.286385] RSP: 0000:ffff88000004fb18  EFLAGS: 00010002
> [    0.287180] RAX: 0000000000000010 RBX: 0000000000000000 RCX: ffff88001=
fbdd950
> [    0.288222] RDX: 0000000000000000 RSI: ffff88001fbdd9a8 RDI: 000000000=
0000000
> [    0.289292] RBP: ffff88000004fb30 R08: 0000000000000000 R09: 000000000=
0000001
> [    0.290338] R10: 0000000000000000 R11: 0000000000000001 R12: ffffffff8=
1a8fbc0
> [    0.291383] R13: ffffffff81a8ecc0 R14: ffff88000004fca0 R15: fffffffff=
fffffe0
> [    0.292430] FS:  0000000000000000(0000) GS:ffff88001fa00000(0000) knlG=
S:0000000000000000
> [    0.293626] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.294467] CR2: 0000000000000000 CR3: 0000000001a06000 CR4: 000000000=
00006b0
> [    0.295506] Stack:
> [    0.295823]  ffff88000004fb30 ffffffff812a6c8d ffff88001fbdd940 ffff88=
000004fc00
> [    0.296992]  ffffffff8115c21a ffff88000004fb98 ffffffff81f60300 ffffff=
ffffffffff
> [    0.298173]  00000000000000f0 ffffffff810d0739 0000000000000246 ffff88=
0000048040
> [    0.299358] Call Trace:
> [    0.299742]  [<ffffffff812a6c8d>] ? list_del+0xd/0x30
> [    0.300491]  [<ffffffff8115c21a>] get_page_from_freelist+0x37a/0xa20
> [    0.301425]  [<ffffffff810d0739>] ? __lock_is_held+0x49/0x70
> [    0.302255]  [<ffffffff8115ce81>] __alloc_pages_nodemask+0xf1/0xc20
> [    0.303214]  [<ffffffff810d36c0>] ? mark_held_locks+0x80/0xa0
> [    0.304066]  [<ffffffff8158ce19>] ? retint_kernel+0x10/0x10
> [    0.304909]  [<ffffffff810d36c0>] ? mark_held_locks+0x80/0xa0
> [    0.305763]  [<ffffffff8119f4a8>] cache_alloc_refill+0x278/0x6d0
> [    0.306652]  [<ffffffff8119fb6d>] __kmalloc+0xdd/0x170
> [    0.307412]  [<ffffffff8128170d>] alloc_cpumask_var_node+0x2d/0x70
> [    0.308325]  [<ffffffff812817d3>] zalloc_cpumask_var+0x23/0x30
> [    0.309220]  [<ffffffff810cd9a6>] cpupri_init+0x56/0x160
> [    0.310012]  [<ffffffff810b14ed>] init_rootdomain+0x8d/0xc0
> [    0.310835]  [<ffffffff810b8502>] build_sched_domains+0x1f2/0xfb0
> [    0.311731]  [<ffffffff810d38fd>] ? trace_hardirqs_on+0xd/0x10
> [    0.312589]  [<ffffffff81281738>] ? alloc_cpumask_var_node+0x58/0x70
> [    0.313521]  [<ffffffff81c85522>] sched_init_smp+0x90/0x14b
> [    0.314354]  [<ffffffff81c6e229>] kernel_init_freeable+0xa5/0x21d
> [    0.315255]  [<ffffffff81583913>] kernel_init+0x13/0x160
> [    0.316042]  [<ffffffff810b5c6a>] ? schedule_tail+0xa/0x70
> [    0.316857]  [<ffffffff8158c68f>] ret_from_fork+0x1f/0x40
> [    0.317656]  [<ffffffff81583900>] ? rest_init+0x170/0x170
> [ 0.318450] Code: e8 55 fd dd ff 49 89 5d 08 4c 89 2b 4c 89 63 08 49
> 89 1c 24 5b 41 5c 41 5d 5d c3 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00
> 00 00 55 <48> 8b 07 48 b9 00 01 00 00 00 00 ad de 48 8b 57 08 48 89 e5
> 48
> [    0.322564] RIP  [<ffffffff812a6bc1>] __list_del_entry+0x1/0xc0
> [    0.323462]  RSP <ffff88000004fb18>
> [    0.323991] CR2: 0000000000000000
> [    0.324490] ---[ end trace dd2d7158799a5176 ]---
> [    0.325173] Kernel panic - not syncing: Fatal exception
>
> git bisect start d58e21b33bcce2872be988bac3623f236e305c7a 3be7988674ab335=
65700a37b210f502563d932e6 --
> git bisect bad 21e17ed6bcbec67922aab4aa0017163c9938de95 # 18:22 0- 6
> Merge
> 'linux-review/Jesper-Dangaard-Brouer/mlx4-add-missed-recycle-opportunity-=
for-XDP_TX-on-TX-failure/20160919-154428'
> into devel-catchup-201609191709
> git bisect good 2188b5ae449853f8902511fb5f4b2109b7d362e5 # 18:33 30+ 0
> Merge 'staging/staging-testing' into devel-catchup-201609191709
> git bisect good 9d03a44b6d1b2a0fe569698438f9a3c259456873 # 18:44 33+ 0
> Merge 'ext3/for_next' into devel-catchup-201609191709
> git bisect bad 1d1325f84b0b42e8451a7388db25d320c6565a80 # 18:56 18- 15
> Merge 'yhuang/percpug' into devel-catchup-201609191709
> git bisect bad c39e074e4f69d4db88805752466cf6053d91d6bf # 19:06 0- 1
> mm, page_alloc: Use per CPU group page set
> git bisect good 9c907537ab770bc4b6023fb1021f79a9eb8f8709  # 19:19     37+=
      0  Add percpu group
> # first bad commit: [c39e074e4f69d4db88805752466cf6053d91d6bf] mm, page_a=
lloc: Use per CPU group page set
> git bisect good 9c907537ab770bc4b6023fb1021f79a9eb8f8709  # 19:23    108+=
      0  Add percpu group
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect bad c39e074e4f69d4db88805752466cf6053d91d6bf # 19:35 0- 22
> mm, page_alloc: Use per CPU group page set
> # extra tests on HEAD of linux-devel/devel-catchup-201609191709
> git bisect bad d58e21b33bcce2872be988bac3623f236e305c7a # 19:35 0- 14
> 0day head guard for 'devel-catchup-201609191709'
> # extra tests on tree/branch yhuang/percpug
> git bisect bad c39e074e4f69d4db88805752466cf6053d91d6bf # 19:41 0- 15
> mm, page_alloc: Use per CPU group page set
> # extra tests with first bad commit reverted
> git bisect good 70b0ea34404032bb3a744d92f86c16c576d37b8a # 19:59 102+
> 0 Revert "mm, page_alloc: Use per CPU group page set"
> # extra tests on tree/branch linus/master
> git bisect good 3be7988674ab33565700a37b210f502563d932e6  # 20:03    106+=
      5  Linux 4.8-rc7
> # extra tests on tree/branch linux-next/master
> git bisect good 3551fc28a8a709c211b969621a9dabe2bdb1b5bf # 20:32 112+
> 2 Add linux-next specific files for 20160919
>
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion

--===============5063494393632426596==--

