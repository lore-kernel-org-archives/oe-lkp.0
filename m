Content-Type: multipart/mixed; boundary="===============2353987426176382925=="
MIME-Version: 1.0
From: Dou Liyang <douly.fnst@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: Re: [x86/acpi] dc6db24d24: BUG: unable to handle kernel paging request at 0000116007090008
Date: Thu, 20 Oct 2016 19:40:30 +0800
Message-ID: <5c5880ae-02a8-9f27-a47d-77aa5b3841b6@cn.fujitsu.com>
In-Reply-To: <20161020011604.GC17837@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2353987426176382925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi xiaolong,

Thank you very much for report.

I was just investigating the related problem in another patches.


At 10/20/2016 09:16 AM, kernel test robot wrote:
>
> FYI, we noticed the following commit:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit dc6db24d2476cd09c0ecf2b8d80313539f737a89 ("x86/acpi: Set persisten=
t cpuid <-> nodeid mapping when booting")
>
> in testcase: vm-scalability
> with following parameters:
>
> 	runtime: 300
> 	thp_enabled: never
> 	thp_defrag: never
> 	nr_task: 1
> 	nr_pmem: 1
> 	test: swap-w-rand
> 	cpufreq_governor: performance
>
>
> The motivation behind this suite is to exercise functions and regions of =
the mm/ of the Linux kernel which are of interest to us.
>
>
> on test machine: 72 threads Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz wit=
h 128G memory
>

For this bug, I want to reproduce it completely.
I hope you can give me the ACPI table about the test machine above.

Thanks,

	Dou.

> caused below changes:
>
>
> +------------------------------------------------------------------+-----=
-------+------------+
> |                                                                  | 8ad8=
93faf2 | dc6db24d24 |
> +------------------------------------------------------------------+-----=
-------+------------+
> | boot_successes                                                   | 7   =
       | 0          |
> | boot_failures                                                    | 9   =
       | 16         |
> | invoked_oom-killer:gfp_mask=3D0x                                   | 6 =
         | 2          |
> | Mem-Info                                                         | 6   =
       | 2          |
> | Out_of_memory:Kill_process                                       | 6   =
       |            |
> | page_allocation_failure:order:#,mode:#(GFP_KERNEL|__GFP_NORETRY) | 2   =
       |            |
> | warn_alloc_failed+0x                                             | 2   =
       |            |
> | BUG:kernel_hang_in_test_stage                                    | 2   =
       | 2          |
> | BUG:kernel_reboot-without-warning_in_test_stage                  | 1   =
       |            |
> | BUG:unable_to_handle_kernel                                      | 0   =
       | 12         |
> | Oops                                                             | 0   =
       | 12         |
> | RIP:get_partial_node                                             | 0   =
       | 12         |
> | calltrace:devtmpfsd                                              | 0   =
       | 12         |
> | RIP:_raw_spin_lock_irqsave                                       | 0   =
       | 9          |
> | general_protection_fault:#[##]SMP                                | 0   =
       | 3          |
> | RIP:native_queued_spin_lock_slowpath                             | 0   =
       | 3          |
> | Kernel_panic-not_syncing:Hard_LOCKUP                             | 0   =
       | 3          |
> | RIP:load_balance                                                 | 0   =
       | 2          |
> | Kernel_panic-not_syncing:Fatal_exception_in_interrupt            | 0   =
       | 2          |
> | WARNING:at_lib/list_debug.c:#__list_add                          | 0   =
       | 1          |
> | calltrace:_do_fork                                               | 0   =
       | 1          |
> | RIP:resched_curr                                                 | 0   =
       | 1          |
> | Kernel_panic-not_syncing:Fatal_exception                         | 0   =
       | 1          |
> | WARNING:at_include/linux/uaccess.h:#__probe_kernel_read          | 0   =
       | 5          |
> | Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes | 0   =
       | 2          |
> +------------------------------------------------------------------+-----=
-------+------------+
>
>
>
> [    9.531507] pci 0000:80:02.2:   bridge window [mem 0x387fffd00000-0x38=
7fffefffff 64bit pref]
> [    9.541378] pci_bus 0000:80: on NUMA node 2
> [    9.546734] ACPI: Enabled 4 GPEs in block 00 to 3F
> [    9.586911] BUG: unable to handle kernel paging request at 00001160070=
90008
> [    9.595109] IP: [<ffffffff811e50fc>] get_partial_node+0x2c/0x1c0
> [    9.602933] PGD 0
> [    9.605503] Oops: 0000 [#1] SMP
> [    9.609264] Modules linked in:
> [    9.613005] CPU: 24 PID: 585 Comm: kdevtmpfs Not tainted 4.8.0-rc1-003=
00-gdc6db24d #1
> [    9.622193] Hardware name: Intel Corporation S2600WTT/S2600WTT, BIOS S=
E5C610.86B.01.01.0008.021120151325 02/11/2015
> [    9.634299] task: ffff880068040000 task.stack: ffff880068024000
> [    9.641168] RIP: 0010:[<ffffffff811e50fc>]  [<ffffffff811e50fc>] get_p=
artial_node+0x2c/0x1c0
> [    9.651890] RSP: 0000:ffff8800680279f0  EFLAGS: 00010006
> [    9.658079] RAX: 0000000000000002 RBX: 0000000000000246 RCX: 000000000=
2098020
> [    9.666308] RDX: ffff882053b9cfc0 RSI: 0000116007090000 RDI: ffff88007=
6804dc0
> [    9.674535] RBP: ffff880068027a90 R08: ffff882053b9cfb0 R09: 000000000=
0000000
> [    9.682764] R10: ffff880068027c88 R11: 0000000b00000000 R12: ffff88007=
6804dc0
> [    9.690994] R13: 0000000000000000 R14: ffff880076804dc0 R15: ffff88205=
3b9cfb0
> [    9.699224] FS:  0000000000000000(0000) GS:ffff882053b80000(0000) knlG=
S:0000000000000000
> [    9.708701] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    9.715373] CR2: 0000116007090008 CR3: 0000000001e06000 CR4: 000000000=
01406e0
> [    9.723602] Stack:
> [    9.726094]  ffff88207ffd4080 0000000200000000 0000000000000000 000000=
0002281220
> [    9.735086]  0000000000000000 0000000000000000 ffffffff82343f68 ffff88=
0068040000
> [    9.744080]  ffff880068027a88 ffffffff811d9de5 ffff880068040000 ffffff=
ff82343f70
> [    9.753072] Call Trace:
> [    9.756056]  [<ffffffff811d9de5>] ? alloc_pages_current+0x95/0x140
> [    9.763223]  [<ffffffff811e551a>] ___slab_alloc+0x28a/0x4b0
> [    9.769696]  [<ffffffff813dd477>] ? avc_alloc_node+0x27/0x140
> [    9.776379]  [<ffffffff813e2356>] ? selinux_inode_permission+0xc6/0x180
> [    9.784032]  [<ffffffff811e4342>] ? new_slab+0x2d2/0x5a0
> [    9.790208]  [<ffffffff813dd477>] ? avc_alloc_node+0x27/0x140
> [    9.796881]  [<ffffffff811e5760>] __slab_alloc+0x20/0x40
> [    9.803067]  [<ffffffff811e6b7f>] kmem_cache_alloc+0x17f/0x1c0
> [    9.809837]  [<ffffffff813dd477>] avc_alloc_node+0x27/0x140
> [    9.816317]  [<ffffffff813dd87a>] avc_compute_av+0x8a/0x1e0
> [    9.822801]  [<ffffffff8121000a>] ? sget_userns+0x4ca/0x4e0
> [    9.829289]  [<ffffffff813de596>] avc_has_perm+0x136/0x190
> [    9.835673]  [<ffffffff810a4a69>] ? __might_sleep+0x49/0x80
> [    9.842161]  [<ffffffff813e0000>] ? inode_doinit_with_dentry+0x530/0x6=
60
> [    9.849901]  [<ffffffff813f4c5d>] ? security_transition_sid+0x2d/0x40
> [    9.857351]  [<ffffffff813e1379>] may_create+0xb9/0xe0
> [    9.863334]  [<ffffffff813e13e2>] selinux_inode_mknod+0x42/0x80
> [    9.870201]  [<ffffffff813da552>] security_inode_mknod+0x52/0x80
> [    9.877165]  [<ffffffff812197e1>] vfs_mknod+0x131/0x1e0
> [    9.883255]  [<ffffffff815b2e65>] handle_create+0x75/0x1e0
> [    9.889639]  [<ffffffff8192da66>] ? __schedule+0x2e6/0x790
> [    9.896027]  [<ffffffff815b3104>] devtmpfsd+0x134/0x180
> [    9.902117]  [<ffffffff815b2fd0>] ? handle_create+0x1e0/0x1e0
> [    9.908792]  [<ffffffff8109ded4>] kthread+0xd4/0xf0
> [    9.914503]  [<ffffffff81932cbf>] ret_from_fork+0x1f/0x40
> [    9.920788]  [<ffffffff8109de00>] ? kthread_create_on_node+0x180/0x180
> [    9.928335] Code: 1f 44 00 00 55 48 89 e5 41 57 41 56 41 55 41 54 53 4=
8 83 e4 f0 48 83 ec 70 48 85 f6 48 c7 44 24 20 00 00 00 00 0f 84 54 01 00 0=
0 <48> 83 7e 08 00 0f 84 49 01 00 00 48 89 f3 49 89 fd 48 89 f7 89
> [    9.954843] RIP  [<ffffffff811e50fc>] get_partial_node+0x2c/0x1c0
> [    9.962756]  RSP <ffff8800680279f0>
> [    9.966902] CR2: 0000116007090008
> [    9.970871] BUG: unable to handle kernel paging request at 00000001000=
00048
> [    9.979058] IP: [<ffffffff819329b9>] _raw_spin_lock_irqsave+0x29/0x50
> [    9.986582] PGD 0
> [    9.989147] Oops: 0002 [#2] SMP
> [    9.992891] Modules linked in:
> [    9.996623] CPU: 24 PID: 585 Comm: kdevtmpfs Tainted: G      D        =
 4.8.0-rc1-00300-gdc6db24d #1
> [   10.007173] Hardware name: Intel Corporation S2600WTT/S2600WTT, BIOS S=
E5C610.86B.01.01.0008.021120151325 02/11/2015
> [   10.019279] task: ffff880068040000 task.stack: ffff880068024000
> [   10.026147] RIP: 0010:[<ffffffff819329b9>]  [<ffffffff819329b9>] _raw_=
spin_lock_irqsave+0x29/0x50
> [   10.036577] RSP: 0000:ffff8800680276e0  EFLAGS: 00010046
> [   10.042763] RAX: 0000000000000000 RBX: 0000000000000097 RCX: ffffffff8=
1e5af08
> [   10.050991] RDX: 0000000000000001 RSI: ffff880068027738 RDI: 000000010=
0000048
> [   10.059221] RBP: ffff8800680276e8 R08: 0000000000000001 R09: 000000000=
0000001
> [   10.067450] R10: ffff880068027c88 R11: 000000000000048c R12: 000000010=
0000048
> [   10.075677] R13: 0000000000000008 R14: ffff880068027738 R15: 000000000=
0000046
> [   10.083906] FS:  0000000000000000(0000) GS:ffff882053b80000(0000) knlG=
S:0000000000000000
> [   10.093384] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   10.100059] CR2: 0000000100000048 CR3: 0000000001e06000 CR4: 000000000=
01406e0
> [   10.108288] Stack:
> [   10.110780]  0000000100000000 ffff880068027718 ffffffff81575da0 ffffff=
ff82263b00
> [   10.119773]  ffff880068027738 0000000000000008 ffffffff8107e58f ffff88=
0068027728
> [   10.128764]  ffffffff81575e4f ffff880068027798 ffffffff8157726f ffff88=
0068027790
> [   10.137756] Call Trace:
> [   10.140741]  [<ffffffff81575da0>] _extract_crng+0x40/0xb0
> [   10.151150]  [<ffffffff8107e58f>] ? print_oops_end_marker+0x3f/0x60
> [   10.158405]  [<ffffffff81575e4f>] extract_crng+0x3f/0x50
> [   10.164591]  [<ffffffff8157726f>] get_random_bytes+0x6f/0x1a0
> [   10.171268]  [<ffffffff810d811a>] ? console_unlock+0x33a/0x610
> [   10.178048]  [<ffffffff8107e58f>] print_oops_end_marker+0x3f/0x60
> [   10.185106]  [<ffffffff8107e5cd>] oops_exit+0x1d/0x30
> [   10.191009]  [<ffffffff8103091e>] oops_end+0x7e/0xd0
> [   10.196815]  [<ffffffff81066592>] no_context+0x112/0x380
> [   10.203002]  [<ffffffff81066881>] __bad_area_nosemaphore+0x81/0x1c0
> [   10.210257]  [<ffffffff810669d4>] bad_area_nosemaphore+0x14/0x20
> [   10.217219]  [<ffffffff81066d6c>] __do_page_fault+0xbc/0x4d0
> [   10.223796]  [<ffffffff8146b47d>] ? list_del+0xd/0x30
> [   10.229690]  [<ffffffff810671b0>] do_page_fault+0x30/0x80
> [   10.235972]  [<ffffffff81933f48>] page_fault+0x28/0x30
> [   10.241965]  [<ffffffff811e50fc>] ? get_partial_node+0x2c/0x1c0
> [   10.249610]  [<ffffffff811d9de5>] ? alloc_pages_current+0x95/0x140
> [   10.256771]  [<ffffffff811e551a>] ___slab_alloc+0x28a/0x4b0
> [   10.263249]  [<ffffffff813dd477>] ? avc_alloc_node+0x27/0x140
> [   10.269921]  [<ffffffff813e2356>] ? selinux_inode_permission+0xc6/0x180
> [   10.277564]  [<ffffffff811e4342>] ? new_slab+0x2d2/0x5a0
> [   10.283749]  [<ffffffff813dd477>] ? avc_alloc_node+0x27/0x140
> [   10.290421]  [<ffffffff811e5760>] __slab_alloc+0x20/0x40
> [   10.296607]  [<ffffffff811e6b7f>] kmem_cache_alloc+0x17f/0x1c0
> [   10.303379]  [<ffffffff813dd477>] avc_alloc_node+0x27/0x140
> [   10.309848]  [<ffffffff813dd87a>] avc_compute_av+0x8a/0x1e0
> [   10.316326]  [<ffffffff8121000a>] ? sget_userns+0x4ca/0x4e0
> [   10.322806]  [<ffffffff813de596>] avc_has_perm+0x136/0x190
> [   10.329184]  [<ffffffff810a4a69>] ? __might_sleep+0x49/0x80
> [   10.335660]  [<ffffffff813e0000>] ? inode_doinit_with_dentry+0x530/0x6=
60
> [   10.343403]  [<ffffffff813f4c5d>] ? security_transition_sid+0x2d/0x40
> [   10.350855]  [<ffffffff813e1379>] may_create+0xb9/0xe0
> [   10.356849]  [<ffffffff813e13e2>] selinux_inode_mknod+0x42/0x80
> [   10.363716]  [<ffffffff813da552>] security_inode_mknod+0x52/0x80
> [   10.370680]  [<ffffffff812197e1>] vfs_mknod+0x131/0x1e0
> [   10.376770]  [<ffffffff815b2e65>] handle_create+0x75/0x1e0
> [   10.383151]  [<ffffffff8192da66>] ? __schedule+0x2e6/0x790
> [   10.389533]  [<ffffffff815b3104>] devtmpfsd+0x134/0x180
> [   10.395622]  [<ffffffff815b2fd0>] ? handle_create+0x1e0/0x1e0
> [   10.402299]  [<ffffffff8109ded4>] kthread+0xd4/0xf0
> [   10.408001]  [<ffffffff81932cbf>] ret_from_fork+0x1f/0x40
> [   10.414284]  [<ffffffff8109de00>] ? kthread_create_on_node+0x180/0x180
> [   10.421829] Code: 00 00 0f 1f 44 00 00 55 48 89 e5 53 9c 58 0f 1f 44 0=
0 00 48 89 c3 fa 66 0f 1f 44 00 00 65 ff 05 9e a8 6d 7e 31 c0 ba 01 00 00 0=
0 <f0> 0f b1 17 85 c0 75 06 48 89 d8 5b 5d c3 89 c6 e8 22 74 79 ff
> [   10.448339] RIP  [<ffffffff819329b9>] _raw_spin_lock_irqsave+0x29/0x50
> [   10.455959]  RSP <ffff8800680276e0>
> [   10.460101] CR2: 0000000100000048
> [   10.464058] BUG: unable to handle kernel paging request at 00000001000=
00048
> [   10.472244] IP: [<ffffffff819329b9>] _raw_spin_lock_irqsave+0x29/0x50
> [   10.479768] PGD 0
> [   10.482332] Oops: 0002 [#3] SMP
> [   10.486089] Modules linked in:
> [   10.489822] CPU: 24 PID: 585 Comm: kdevtmpfs Tainted: G      D        =
 4.8.0-rc1-00300-gdc6db24d #1
> [   10.500366] Hardware name: Intel Corporation S2600WTT/S2600WTT, BIOS S=
E5C610.86B.01.01.0008.021120151325 02/11/2015
> [   10.512467] task: ffff880068040000 task.stack: ffff880068024000
> [   10.519334] RIP: 0010:[<ffffffff819329b9>]  [<ffffffff819329b9>] _raw_=
spin_lock_irqsave+0x29/0x50
> [   10.529765] RSP: 0000:ffff8800680273d0  EFLAGS: 00010046
> [   10.535952] RAX: 0000000000000000 RBX: 0000000000000097 RCX: ffffffff8=
1e5af08
> [   10.544183] RDX: 0000000000000001 RSI: ffff880068027428 RDI: 000000010=
0000048
> [   10.552410] RBP: ffff8800680273d8 R08: 0000000000000001 R09: 000000000=
0000001
> [   10.560641] R10: ffff880068027c88 R11: 00000000000004d1 R12: 000000010=
0000048
> [   10.568869] R13: 0000000000000008 R14: ffff880068027428 R15: 000000000=
0000046
> [   10.577097] FS:  0000000000000000(0000) GS:ffff882053b80000(0000) knlG=
S:0000000000000000
> [   10.586578] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   10.593250] CR2: 0000000100000048 CR3: 0000000001e06000 CR4: 000000000=
01406e0
> [   10.601479] Stack:
> [   10.603969]  0000000100000000 ffff880068027408 ffffffff81575da0 ffffff=
ff82263b00
> [   10.612968]  ffff880068027428 0000000000000008 ffffffff8107e58f ffff88=
0068027418
> [   10.621966]  ffffffff81575e4f ffff880068027488 ffffffff8157726f ffff88=
0068027480
> [   10.630963] Call Trace:
> [   10.633942]  [<ffffffff81575da0>] _extract_crng+0x40/0xb0
> [   10.640228]  [<ffffffff8107e58f>] ? print_oops_end_marker+0x3f/0x60
> [   10.647484]  [<ffffffff81575e4f>] extract_crng+0x3f/0x50
> [   10.653670]  [<ffffffff8157726f>] get_random_bytes+0x6f/0x1a0
> [   10.660342]  [<ffffffff810d811a>] ? console_unlock+0x33a/0x610
> [   10.667113]  [<ffffffff8107e58f>] print_oops_end_marker+0x3f/0x60
> [   10.674173]  [<ffffffff8107e5cd>] oops_exit+0x1d/0x30
> [   10.680069]  [<ffffffff8103091e>] oops_end+0x7e/0xd0
> [   10.685868]  [<ffffffff81066592>] no_context+0x112/0x380
> [   10.692059]  [<ffffffff81457b18>] ? put_dec+0x18/0xa0
> [   10.697962]  [<ffffffff81066881>] __bad_area_nosemaphore+0x81/0x1c0
> [   10.705218]  [<ffffffff810669d4>] bad_area_nosemaphore+0x14/0x20
> [   10.712183]  [<ffffffff81066d6c>] __do_page_fault+0xbc/0x4d0
> [   10.718756]  [<ffffffff810671b0>] do_page_fault+0x30/0x80
> [   10.725040]  [<ffffffff8109f061>] ? atomic_notifier_call_chain+0x21/0x=
30
> [   10.732783]  [<ffffffff81933f48>] page_fault+0x28/0x30
> [   10.738777]  [<ffffffff819329b9>] ? _raw_spin_lock_irqsave+0x29/0x50
> [   10.746132]  [<ffffffff81575da0>] _extract_crng+0x40/0xb0
> [   10.752415]  [<ffffffff8107e58f>] ? print_oops_end_marker+0x3f/0x60
> [   10.759671]  [<ffffffff81575e4f>] extract_crng+0x3f/0x50
> [   10.765856]  [<ffffffff8157726f>] get_random_bytes+0x6f/0x1a0
> [   10.772530]  [<ffffffff810d811a>] ? console_unlock+0x33a/0x610
> [   10.779301]  [<ffffffff8107e58f>] print_oops_end_marker+0x3f/0x60
> [   10.786364]  [<ffffffff8107e5cd>] oops_exit+0x1d/0x30
> [   10.792257]  [<ffffffff8103091e>] oops_end+0x7e/0xd0
> [   10.798057]  [<ffffffff81066592>] no_context+0x112/0x380
> [   10.804244]  [<ffffffff81066881>] __bad_area_nosemaphore+0x81/0x1c0
> [   10.811498]  [<ffffffff810669d4>] bad_area_nosemaphore+0x14/0x20
> [   10.818463]  [<ffffffff81066d6c>] __do_page_fault+0xbc/0x4d0
> [   10.825037]  [<ffffffff8146b47d>] ? list_del+0xd/0x30
> [   10.830933]  [<ffffffff810671b0>] do_page_fault+0x30/0x80
> [   10.837216]  [<ffffffff81933f48>] page_fault+0x28/0x30
> [   10.843208]  [<ffffffff811e50fc>] ? get_partial_node+0x2c/0x1c0
> [   10.850855]  [<ffffffff811d9de5>] ? alloc_pages_current+0x95/0x140
> [   10.858015]  [<ffffffff811e551a>] ___slab_alloc+0x28a/0x4b0
> [   10.864491]  [<ffffffff813dd477>] ? avc_alloc_node+0x27/0x140
> [   10.871163]  [<ffffffff813e2356>] ? selinux_inode_permission+0xc6/0x180
> [   10.878809]  [<ffffffff811e4342>] ? new_slab+0x2d2/0x5a0
> [   10.884995]  [<ffffffff813dd477>] ? avc_alloc_node+0x27/0x140
> [   10.891667]  [<ffffffff811e5760>] __slab_alloc+0x20/0x40
> [   10.897853]  [<ffffffff811e6b7f>] kmem_cache_alloc+0x17f/0x1c0
> [   10.904623]  [<ffffffff813dd477>] avc_alloc_node+0x27/0x140
> [   10.911103]  [<ffffffff813dd87a>] avc_compute_av+0x8a/0x1e0
> [   10.917582]  [<ffffffff8121000a>] ? sget_userns+0x4ca/0x4e0
> [   10.924061]  [<ffffffff813de596>] avc_has_perm+0x136/0x190
> [   10.930443]  [<ffffffff810a4a69>] ? __might_sleep+0x49/0x80
> [   10.936924]  [<ffffffff813e0000>] ? inode_doinit_with_dentry+0x530/0x6=
60
> [   10.944666]  [<ffffffff813f4c5d>] ? security_transition_sid+0x2d/0x40
> [   10.952120]  [<ffffffff813e1379>] may_create+0xb9/0xe0
> [   10.958112]  [<ffffffff813e13e2>] selinux_inode_mknod+0x42/0x80
> [   10.964979]  [<ffffffff813da552>] security_inode_mknod+0x52/0x80
> [   10.971944]  [<ffffffff812197e1>] vfs_mknod+0x131/0x1e0
> [   10.978033]  [<ffffffff815b2e65>] handle_create+0x75/0x1e0
>
>
> To reproduce:
>
>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
>
>
>
> Thanks,
> Xiaolong
>
>



--===============2353987426176382925==--

