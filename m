Content-Type: multipart/mixed; boundary="===============2462022377090628863=="
MIME-Version: 1.0
From: Matthew Wilcox <mawilcox@microsoft.com>
To: lkp@lists.01.org
Subject: Re: 192ffafb71 ("idr: Convert to XArray"): BUG: KASAN: use-after-free in xas_set_tag
Date: Thu, 04 Jan 2018 17:34:00 +0000
Message-ID: <BL0PR2101MB1009E94EF2EC31ABA9AD45ABCB1F0@BL0PR2101MB1009.namprd21.prod.outlook.com>
In-Reply-To: <20180103131428.vvlsaeum4fgowzfd@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2462022377090628863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Tried it, it works, and now I got the bug fixed.  Thanks!

> -----Original Message-----
> From: Fengguang Wu [mailto:fengguang.wu(a)intel.com]
> Sent: Wednesday, January 3, 2018 8:14 AM
> To: Matthew Wilcox <mawilcox@microsoft.com>
> Cc: LKP <lkp@01.org>; Li Zhijian <zhijianx.li@intel.com>
> Subject: Re: 192ffafb71 ("idr: Convert to XArray"): BUG: KASAN: use-after=
-free
> in xas_set_tag
> =

> Hi Matthew,
> =

> On Tue, Jan 02, 2018 at 06:30:05PM +0000, Matthew Wilcox wrote:
> >I tried to run the reproducer script you sent along with this email.
> >Unfortunately, the initrd linked to has a version of trinity in it that =
was
> compiled against libc-2.14 but only contains libc-2.13.  So trinity doesn=
't run,
> and it's trinity that provokes the crash.
> >Can you update the initrd?  Thanks!
> =

> According to the dmesg, trinity runs inside the initrd.
> =

> [   89.549673]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   89.550845] BUG: KASAN: use-after-free in xas_set_tag+0xc2/0x15a
> [   89.551765] Read of size 1 at addr ffff880013488cf9 by task trinity-c1=
/1030
> =

> Root cause is our local yocto-trinity-x86_64.cgz initrd has been
> updated and the one in github is out of date.
> =

> I just uploaded the new version made by Zhijian. Would you try it?
> =

> Thanks,
> Fengguang
> =

> >> -----Original Message-----
> >> From: kernel test robot [mailto:fengguang.wu(a)intel.com]
> >> Sent: Tuesday, January 2, 2018 5:43 AM
> >> To: Matthew Wilcox <mawilcox@microsoft.com>
> >> Cc: LKP <lkp@01.org>; wfg(a)linux.intel.com
> >> Subject: 192ffafb71 ("idr: Convert to XArray"): BUG: KASAN: use-after-=
free
> in
> >> xas_set_tag
> >>
> >> Greetings,
> >>
> >> 0day kernel testing robot got the below dmesg and the first bad commit=
 is
> >>
> >> git://git.infradead.org/users/willy/linux-dax.git xarray-2017-12-11
> >>
> >> commit 192ffafb71abe8cd3ac76d24c1f4c00ce192108c
> >> Author:     Matthew Wilcox <mawilcox@microsoft.com>
> >> AuthorDate: Fri Nov 17 08:21:15 2017 -0500
> >> Commit:     Matthew Wilcox <mawilcox@microsoft.com>
> >> CommitDate: Mon Jan 1 16:31:57 2018 -0500
> >>
> >>     idr: Convert to XArray
> >>
> >>     The IDR distinguishes between unallocated entries (read as NULL) a=
nd
> >>     entries where the user has chosen to store NULL.  The radix tree w=
as
> >>     modified to consider NULL entries which had tag 0 _clear_ as being
> >>     allocated, but it added a lot of complexity.
> >>
> >>     Instead, the XArray has a 'zero entry', which the normal API will =
treat
> >>     as NULL, but is distinct from NULL when using the advanced API.  T=
he IDR
> >>     code converts between NULL and zero entries.
> >>
> >>     The idr_for_each_entry_ul() iterator becomes an alias for xa_for_e=
ach(),
> >>     so we drop the idr_get_next_ul() function as it has no users.
> >>
> >>     The exported IDR API was a weird mix of GPL-only and general symbo=
ls;
> >>     I converted them all to GPL as there was no way to use the IDR API
> >>     without being GPL.
> >>
> >>     Signed-off-by: Matthew Wilcox <mawilcox@microsoft.com>
> >>
> >> 7c9894b89d  xarray: Add ability to store errno values
> >> 192ffafb71  idr: Convert to XArray
> >> 7c7f1f88ff  convert test suite
> >> +-------------------------------+------------+------------+-----------=
-+
> >> |                               | 7c9894b89d | 192ffafb71 | 7c7f1f88ff=
 |
> >> +-------------------------------+------------+------------+-----------=
-+
> >> | boot_successes                | 43         | 9          | 1         =
 |
> >> | boot_failures                 | 0          | 9          | 2         =
 |
> >> | BUG:KASAN:use-after-free_in_x | 0          | 9          | 2         =
 |
> >> +-------------------------------+------------+------------+-----------=
-+
> >>
> >> [   62.436305] rcu-torture: Reader Batch:  0 2 0 0 0 0 0 0 0 0 0
> >> [   62.437432] rcu-torture: Free-Block Circulation:  0 0 0 0 0 0 0 0 0=
 0 0
> >> [   64.467707] Unable to find swap-space signature
> >> [   65.445573] Unable to find swap-space signature
> >> [   89.549673]
> >>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> [   89.550845] BUG: KASAN: use-after-free in xas_set_tag+0xc2/0x15a
> >> [   89.551765] Read of size 1 at addr ffff880013488cf9 by task trinity-
> c1/1030
> >> [   89.552857]
> >> [   89.553124] CPU: 0 PID: 1030 Comm: trinity-c1 Not tainted 4.15.0-rc=
6-
> >> 00032-g192ffaf #1
> >> [   89.569358] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS
> >> 1.10.2-1 04/01/2014
> >> [   89.570696] Call Trace:
> >> [   89.571130]  dump_stack+0xae/0x12e
> >> [   89.571677]  ? arch_local_irq_restore+0xd/0xd
> >> [   89.572374]  ? show_regs_print_info+0xb/0xb
> >> [   89.573014]  ? lock_acquire+0xe2/0x144
> >> [   89.573596]  ? xas_set_tag+0xc2/0x15a
> >> [   89.574171]  print_address_description+0x57/0x227
> >> [   89.574883]  ? xas_set_tag+0xc2/0x15a
> >> [   89.575457]  kasan_report+0x220/0x249
> >> [   89.576021]  __asan_report_load1_noabort+0x14/0x16
> >> [   89.588849]  xas_set_tag+0xc2/0x15a
> >> [   89.589468]  xas_init_tags+0x72/0x8c
> >> [   89.590109]  xas_store+0x15a/0xbd4
> >> [   89.590692]  ? rcu_read_unlock+0x23/0x25
> >> [   89.591355]  ? xas_init_tags+0x8c/0x8c
> >> [   89.591962]  ? pvclock_read_flags+0xba/0xba
> >> [   89.592644]  ? pvclock_read_flags+0xba/0xba
> >> [   89.593326]  ? kvm_clock_read+0x25/0x2e
> >> [   89.593948]  ? kvm_sched_clock_read+0x9/0x12
> >> [   89.594651]  ? paravirt_sched_clock+0x9/0xd
> >> [   89.595342]  ? sched_clock+0x9/0xb
> >> [   89.595918]  ? find_held_lock+0x33/0x103
> >> [   89.596573]  ? lock_acquired+0x50a/0x539
> >> [   89.597214]  __xa_erase+0x1f3/0x22c
> >> [   89.597804]  ? xa_load+0x268/0x268
> >> [   89.609403]  idr_remove+0x23/0x3c
> >> [   89.609971]  __bpf_map_put+0xc7/0x22c
> >> [   89.610589]  ? bpf_dummy_read+0xd/0xd
> >> [   89.611193]  ? in_sched_functions+0x30/0x30
> >> [   89.611901]  ? fsnotify_unmount_inodes+0x263/0x263
> >> [   89.612734]  ? rcu_note_context_switch+0x287/0x287
> >> [   89.613567]  bpf_map_put+0xe/0x10
> >> [   89.614137]  bpf_map_put_with_uref+0x55/0x58
> >> [   89.614844]  bpf_map_release+0x94/0x9d
> >> [   89.615456]  __fput+0x3a5/0x587
> >> [   89.615971]  ? file_free+0x61/0x61
> >> [   89.616532]  ? in_sched_functions+0x30/0x30
> >> [   89.617211]  ____fput+0x9/0xb
> >> [   89.617699]  task_work_run+0x193/0x1e4
> >> [   89.618318]  ? task_work_cancel+0x1cf/0x1cf
> >> [   89.619017]  ? free_nsproxy+0x6e/0x71
> >> [   89.619674]  ? switch_task_namespaces+0x87/0x90
> >> [   89.620471]  do_exit+0xccf/0x20e7
> >> [   89.621054]  ? is_current_pgrp_orphaned+0x8c/0x8c
> >> [   89.621828]  ? __set_page_dirty_no_writeback+0xf/0x53
> >> [   89.622639]  ? put_page+0x62/0x11d
> >> [   89.623202]  ? __list_add+0x150/0x150
> >> [   89.623798]  ? fault_in_pages_readable+0xc0/0xc0
> >> [   89.624557]  ? kvm_clock_read+0x25/0x2e
> >> [   89.625209]  ? shmem_write_end+0x2dd/0x30f
> >> [   89.625926]  ? zero_user_segments+0x61/0x61
> >> [   89.626653]  ? pvclock_read_flags+0xba/0xba
> >> [   89.627363]  ? iov_iter_copy_from_user_atomic+0x66e/0x66e
> >> [   89.628237]  ? kvm_clock_read+0x25/0x2e
> >> [   89.628857]  ? kvm_sched_clock_read+0x9/0x12
> >> [   89.629565]  ? paravirt_sched_clock+0x9/0xd
> >> [   89.630276]  ? sched_clock+0x9/0xb
> >> [   89.630835]  ? check_chain_key+0x19e/0x25b
> >> [   89.631510]  ? lock_release+0x639/0x668
> >> [   89.632163]  ? lock_downgrade+0x56f/0x56f
> >> [   89.632862]  ? pvclock_read_flags+0xba/0xba
> >> [   89.633597]  ? pvclock_read_flags+0xba/0xba
> >> [   89.634304]  ? pvclock_read_flags+0xba/0xba
> >> [   89.634993]  ? sched_clock+0x9/0xb
> >> [   89.635553]  ? kvm_clock_read+0x25/0x2e
> >> [   89.636180]  ? kvm_sched_clock_read+0x9/0x12
> >> [   89.636864]  ? paravirt_sched_clock+0x9/0xd
> >> [   89.637539]  ? sched_clock+0x9/0xb
> >> [   89.638096]  ? sched_clock_cpu+0x1f/0x147
> >> [   89.638761]  ? lock_release+0x639/0x668
> >> [   89.639420]  ? lock_downgrade+0x56f/0x56f
> >> [   89.640137]  ? lock_acquire+0xe2/0x144
> >> [   89.640787]  ? lock_acquire+0x135/0x144
> >> [   89.641457]  do_group_exit+0x30a/0x30a
> >> [   89.642073]  ? rcu_read_unlock+0x23/0x25
> >> [   89.642704]  ? SyS_exit+0x20/0x20
> >> [   89.643249]  ? pid_vnr+0x24/0x24
> >> [   89.643775]  ? sys_gettid+0x1a/0x1a
> >> [   89.644346]  ? lockdep_sys_exit_thunk+0x16/0x27
> >> [   89.645074]  SyS_exit_group+0x18/0x18
> >> [   89.645681]  entry_SYSCALL_64_fastpath+0x1e/0x86
> >> [   89.646458] RIP: 0033:0x452e48
> >> [   89.646957] RSP: 002b:00007ffee3e1dfa8 EFLAGS: 00000206 ORIG_RAX:
> >> 00000000000000e7
> >> [   89.648215] RAX: ffffffffffffffda RBX: 0000000001045cf8 RCX:
> >> 0000000000452e48
> >> [   89.649462] RDX: 0000000000000001 RSI: 000000000000003c RDI:
> >> 0000000000000001
> >> [   89.650638] RBP: 000000000000270f R08: 00000000000000e7 R09:
> >> ffffffffffffffb0
> >> [   89.651761] R10: ffffffffffffffff R11: 0000000000000206 R12:
> >> 0000000000000040
> >> [   89.652882] R13: 0000000001045cf8 R14: 0000000002d72f90 R15:
> >> 0000000001045ca0
> >> [   89.654005]
> >> [   89.654274] Allocated by task 669:
> >> [   89.654860]  save_stack+0x43/0xc9
> >> [   89.655433]  kasan_kmalloc+0x94/0xa3
> >> [   89.656021]  kasan_slab_alloc+0x12/0x14
> >> [   89.656663]  slab_post_alloc_hook+0x35/0x45
> >> [   89.657375]  kmem_cache_alloc+0xdf/0xf1
> >> [   89.658057]  xas_alloc+0xfe/0x329
> >> [   89.658644]  xas_create+0x2b5/0x8bd
> >> [   89.659240]  xas_store+0xc2/0xbd4
> >> [   89.659795]  idr_alloc_ul+0x316/0x3cc
> >> [   89.660400]  idr_alloc_cyclic+0x125/0x207
> >> [   89.661054]  SyS_bpf+0x744/0x1b04
> >> [   89.661600]  entry_SYSCALL_64_fastpath+0x1e/0x86
> >> [   89.662344]
> >> [   89.662604] Freed by task 1030:
> >> [   89.663124]  save_stack+0x43/0xc9
> >> [   89.663673]  kasan_slab_free+0x90/0xb3
> >> [   89.664310]  slab_free_freelist_hook+0x8f/0x98
> >> [   89.665083]  kmem_cache_free+0x4a/0xd5
> >> [   89.665735]  radix_tree_node_rcu_free+0x105/0x12d
> >> [   89.666527]  rcu_process_callbacks+0x73b/0xad9
> >> [   89.667248]  __do_softirq+0x1cc/0x3fd
> >> [   89.667847]
> >> [   89.668114] The buggy address belongs to the object at ffff88001348=
8cf8
> >> [   89.668114]  which belongs to the cache radix_tree_node of size 192
> >> [   89.670113] The buggy address is located 1 bytes inside of
> >> [   89.670113]  192-byte region [ffff880013488cf8, ffff880013488db8)
> >>
> >>                                                           # HH:MM RESU=
LT GOOD BAD
> >> GOOD_BUT_DIRTY DIRTY_NOT_BAD
> >> git bisect start 8701f126a98d743b77ad49964e0553f63d861108
> >> 30a7acd573899fd8b8ac39236eff6468b195ac7d --
> >> git bisect  bad 7c00133740b145493b65c516c614559fc87f000a  # 11:33  B
> 2
> >> 2    0   0  Merge 'mzx/for-next' into devel-catchup-201801021046
> >> git bisect  bad c51383931ee7076c27eb1ad674bd31cbbf575b33  # 11:58  B
> >> 0     2   15   0  Merge 'dax/xarray-2017-12-11' into devel-catchup-
> >> 201801021046
> >> git bisect good eeef907284a9210217a0da8ed39a90bcf4d1a509  # 12:38  G
> >> 13     0    0   0  0day base guard for 'devel-catchup-201801021046'
> >> git bisect  bad b00df7ac263327b60bae584f3d9735ec2d629437  # 13:05  B
> 1
> >> 2    0   0  shmem: Convert find_swap_entry to XArray
> >> git bisect good 8be4282fbbac7c11d2b5c40ce309dd44684501f5  # 13:53  G
> >> 14     0    0   0  xarray: Add xa_destroy
> >> git bisect  bad d314d57ea65a174b7222eba82bdd9d062e2e4cc6  # 14:16  B
> >> 0     1   14   0  page cache: Remove stray radix comment
> >> git bisect  bad e3b343f87afce611ff118458568da2651e9341bf  # 14:31  B
> 0
> >> 1   14   0  ida: Convert to XArray
> >> git bisect good c540e2a32cc9fbb91cd4ea83742cc3d669449d7c  # 15:43  G
> >> 13     0    0   0  xarray: Add MAINTAINERS entry
> >> git bisect  bad 192ffafb71abe8cd3ac76d24c1f4c00ce192108c  # 16:05  B
> 1
> >> 1    0   0  idr: Convert to XArray
> >> git bisect good 7c9894b89d1e35db4f5d9e466f3b9e0626694b8b  # 16:58  G
> >> 13     0    0   0  xarray: Add ability to store errno values
> >> # first bad commit: [192ffafb71abe8cd3ac76d24c1f4c00ce192108c] idr:
> >> Convert to XArray
> >> git bisect good 7c9894b89d1e35db4f5d9e466f3b9e0626694b8b  # 17:52  G
> >> 39     0    0   0  xarray: Add ability to store errno values
> >> # extra tests with debug options
> >> git bisect  bad 192ffafb71abe8cd3ac76d24c1f4c00ce192108c  # 18:12  B
> 1
> >> 1    0   0  idr: Convert to XArray
> >> # extra tests on HEAD of linux-devel/devel-catchup-201801021046
> >> git bisect  bad 8701f126a98d743b77ad49964e0553f63d861108  # 18:17  B
> >> 4     9    0   0  0day head guard for 'devel-catchup-201801021046'
> >> # extra tests on tree/branch dax/xarray-2017-12-11
> >> git bisect  bad 7c7f1f88ffc55b930efc4cac2fe4b3b4e26ef54f  # 18:38  B  =
    1
> >> 1    0   0  convert test suite
> >>
> >> ---
> >> 0-DAY kernel test infrastructure                Open Source Technology=
 Center
> >>
> https://na01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.=
01.or
> >>
> g%2Fpipermail%2Flkp&data=3D02%7C01%7Cmawilcox%40microsoft.com%7Ce9b
> >>
> e0eb336e64475463708d551cdbe7e%7C72f988bf86f141af91ab2d7cd011db47
> >>
> %7C1%7C0%7C636504866587711787&sdata=3D7iAnuv6vxGa%2FfL1wSgp3muG
> >> E2MJfEd%2BKXG3JVgupVlY%3D&reserved=3D0                          Intel
> Corporation

--===============2462022377090628863==--

