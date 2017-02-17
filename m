Content-Type: multipart/mixed; boundary="===============0985057141185448391=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/acpi] dc6db24d24: BUG: unable to handle kernel paging request at 0000116007090008
Date: Fri, 17 Feb 2017 15:40:02 +0800
Message-ID: <20170217074002.GA29988@yexl-desktop>
In-Reply-To: <ffe13c06-0c60-ffac-245e-6d95c256b8c7@cn.fujitsu.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0985057141185448391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 02/17, Dou Liyang wrote:
>Hi Xiaolong
>
>After my investigation, I think you are right and i find the true
>reason and the solution.

Great, glad to hear that.

>
>When I send the patches, I may need your help for testing in the
>special machine.

Sure, my pleasure.

Thanks,
Xiaolong
>
>Thanks,
>Liyang
>
>At 02/13/2017 09:33 AM, Ye Xiaolong wrote:
>>Hi,
>>
>>On 10/20, kernel test robot wrote:
>>>
>>>FYI, we noticed the following commit:
>>>
>>>https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>>commit dc6db24d2476cd09c0ecf2b8d80313539f737a89 ("x86/acpi: Set persiste=
nt cpuid <-> nodeid mapping when booting")
>>>
>>>in testcase: vm-scalability
>>>with following parameters:
>>>
>>>	runtime: 300
>>>	thp_enabled: never
>>>	thp_defrag: never
>>>	nr_task: 1
>>>	nr_pmem: 1
>>>	test: swap-w-rand
>>>	cpufreq_governor: performance
>>>
>>>
>>>The motivation behind this suite is to exercise functions and regions of=
 the mm/ of the Linux kernel which are of interest to us.
>>>
>>>
>>>on test machine: 72 threads Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz wi=
th 128G memory
>>>
>>>caused below changes:
>>
>>This bug still persists in v4.9, v4.10-rcx. Could you help to take a look?
>>
>>Thanks,
>>Xiaolong
>>>
>>>
>>>+------------------------------------------------------------------+----=
--------+------------+
>>>|                                                                  | 8ad=
893faf2 | dc6db24d24 |
>>>+------------------------------------------------------------------+----=
--------+------------+
>>>| boot_successes                                                   | 7  =
        | 0          |
>>>| boot_failures                                                    | 9  =
        | 16         |
>>>| invoked_oom-killer:gfp_mask=3D0x                                   | 6=
          | 2          |
>>>| Mem-Info                                                         | 6  =
        | 2          |
>>>| Out_of_memory:Kill_process                                       | 6  =
        |            |
>>>| page_allocation_failure:order:#,mode:#(GFP_KERNEL|__GFP_NORETRY) | 2  =
        |            |
>>>| warn_alloc_failed+0x                                             | 2  =
        |            |
>>>| BUG:kernel_hang_in_test_stage                                    | 2  =
        | 2          |
>>>| BUG:kernel_reboot-without-warning_in_test_stage                  | 1  =
        |            |
>>>| BUG:unable_to_handle_kernel                                      | 0  =
        | 12         |
>>>| Oops                                                             | 0  =
        | 12         |
>>>| RIP:get_partial_node                                             | 0  =
        | 12         |
>>>| calltrace:devtmpfsd                                              | 0  =
        | 12         |
>>>| RIP:_raw_spin_lock_irqsave                                       | 0  =
        | 9          |
>>>| general_protection_fault:#[##]SMP                                | 0  =
        | 3          |
>>>| RIP:native_queued_spin_lock_slowpath                             | 0  =
        | 3          |
>>>| Kernel_panic-not_syncing:Hard_LOCKUP                             | 0  =
        | 3          |
>>>| RIP:load_balance                                                 | 0  =
        | 2          |
>>>| Kernel_panic-not_syncing:Fatal_exception_in_interrupt            | 0  =
        | 2          |
>>>| WARNING:at_lib/list_debug.c:#__list_add                          | 0  =
        | 1          |
>>>| calltrace:_do_fork                                               | 0  =
        | 1          |
>>>| RIP:resched_curr                                                 | 0  =
        | 1          |
>>>| Kernel_panic-not_syncing:Fatal_exception                         | 0  =
        | 1          |
>>>| WARNING:at_include/linux/uaccess.h:#__probe_kernel_read          | 0  =
        | 5          |
>>>| Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes | 0  =
        | 2          |
>>>+------------------------------------------------------------------+----=
--------+------------+
>>>
>>>
>>>
>>>[    9.531507] pci 0000:80:02.2:   bridge window [mem 0x387fffd00000-0x3=
87fffefffff 64bit pref]
>>>[    9.541378] pci_bus 0000:80: on NUMA node 2
>>>[    9.546734] ACPI: Enabled 4 GPEs in block 00 to 3F
>>>[    9.586911] BUG: unable to handle kernel paging request at 0000116007=
090008
>>>[    9.595109] IP: [<ffffffff811e50fc>] get_partial_node+0x2c/0x1c0
>>>[    9.602933] PGD 0
>>>[    9.605503] Oops: 0000 [#1] SMP
>>>[    9.609264] Modules linked in:
>>>[    9.613005] CPU: 24 PID: 585 Comm: kdevtmpfs Not tainted 4.8.0-rc1-00=
300-gdc6db24d #1
>>>[    9.622193] Hardware name: Intel Corporation S2600WTT/S2600WTT, BIOS =
SE5C610.86B.01.01.0008.021120151325 02/11/2015
>>>[    9.634299] task: ffff880068040000 task.stack: ffff880068024000
>>>[    9.641168] RIP: 0010:[<ffffffff811e50fc>]  [<ffffffff811e50fc>] get_=
partial_node+0x2c/0x1c0
>>>[    9.651890] RSP: 0000:ffff8800680279f0  EFLAGS: 00010006
>>>[    9.658079] RAX: 0000000000000002 RBX: 0000000000000246 RCX: 00000000=
02098020
>>>[    9.666308] RDX: ffff882053b9cfc0 RSI: 0000116007090000 RDI: ffff8800=
76804dc0
>>>[    9.674535] RBP: ffff880068027a90 R08: ffff882053b9cfb0 R09: 00000000=
00000000
>>>[    9.682764] R10: ffff880068027c88 R11: 0000000b00000000 R12: ffff8800=
76804dc0
>>>[    9.690994] R13: 0000000000000000 R14: ffff880076804dc0 R15: ffff8820=
53b9cfb0
>>>[    9.699224] FS:  0000000000000000(0000) GS:ffff882053b80000(0000) knl=
GS:0000000000000000
>>>[    9.708701] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>[    9.715373] CR2: 0000116007090008 CR3: 0000000001e06000 CR4: 00000000=
001406e0
>>>[    9.723602] Stack:
>>>[    9.726094]  ffff88207ffd4080 0000000200000000 0000000000000000 00000=
00002281220
>>>[    9.735086]  0000000000000000 0000000000000000 ffffffff82343f68 ffff8=
80068040000
>>>[    9.744080]  ffff880068027a88 ffffffff811d9de5 ffff880068040000 fffff=
fff82343f70
>>>[    9.753072] Call Trace:
>>>[    9.756056]  [<ffffffff811d9de5>] ? alloc_pages_current+0x95/0x140
>>>[    9.763223]  [<ffffffff811e551a>] ___slab_alloc+0x28a/0x4b0
>>>[    9.769696]  [<ffffffff813dd477>] ? avc_alloc_node+0x27/0x140
>>>[    9.776379]  [<ffffffff813e2356>] ? selinux_inode_permission+0xc6/0x1=
80
>>>[    9.784032]  [<ffffffff811e4342>] ? new_slab+0x2d2/0x5a0
>>>[    9.790208]  [<ffffffff813dd477>] ? avc_alloc_node+0x27/0x140
>>>[    9.796881]  [<ffffffff811e5760>] __slab_alloc+0x20/0x40
>>>[    9.803067]  [<ffffffff811e6b7f>] kmem_cache_alloc+0x17f/0x1c0
>>>[    9.809837]  [<ffffffff813dd477>] avc_alloc_node+0x27/0x140
>>>[    9.816317]  [<ffffffff813dd87a>] avc_compute_av+0x8a/0x1e0
>>>[    9.822801]  [<ffffffff8121000a>] ? sget_userns+0x4ca/0x4e0
>>>[    9.829289]  [<ffffffff813de596>] avc_has_perm+0x136/0x190
>>>[    9.835673]  [<ffffffff810a4a69>] ? __might_sleep+0x49/0x80
>>>[    9.842161]  [<ffffffff813e0000>] ? inode_doinit_with_dentry+0x530/0x=
660
>>>[    9.849901]  [<ffffffff813f4c5d>] ? security_transition_sid+0x2d/0x40
>>>[    9.857351]  [<ffffffff813e1379>] may_create+0xb9/0xe0
>>>[    9.863334]  [<ffffffff813e13e2>] selinux_inode_mknod+0x42/0x80
>>>[    9.870201]  [<ffffffff813da552>] security_inode_mknod+0x52/0x80
>>>[    9.877165]  [<ffffffff812197e1>] vfs_mknod+0x131/0x1e0
>>>[    9.883255]  [<ffffffff815b2e65>] handle_create+0x75/0x1e0
>>>[    9.889639]  [<ffffffff8192da66>] ? __schedule+0x2e6/0x790
>>>[    9.896027]  [<ffffffff815b3104>] devtmpfsd+0x134/0x180
>>>[    9.902117]  [<ffffffff815b2fd0>] ? handle_create+0x1e0/0x1e0
>>>[    9.908792]  [<ffffffff8109ded4>] kthread+0xd4/0xf0
>>>[    9.914503]  [<ffffffff81932cbf>] ret_from_fork+0x1f/0x40
>>>[    9.920788]  [<ffffffff8109de00>] ? kthread_create_on_node+0x180/0x180
>>>[    9.928335] Code: 1f 44 00 00 55 48 89 e5 41 57 41 56 41 55 41 54 53 =
48 83 e4 f0 48 83 ec 70 48 85 f6 48 c7 44 24 20 00 00 00 00 0f 84 54 01 00 =
00 <48> 83 7e 08 00 0f 84 49 01 00 00 48 89 f3 49 89 fd 48 89 f7 89
>>>[    9.954843] RIP  [<ffffffff811e50fc>] get_partial_node+0x2c/0x1c0
>>>[    9.962756]  RSP <ffff8800680279f0>
>>>[    9.966902] CR2: 0000116007090008
>>>[    9.970871] BUG: unable to handle kernel paging request at 0000000100=
000048
>>>[    9.979058] IP: [<ffffffff819329b9>] _raw_spin_lock_irqsave+0x29/0x50
>>>[    9.986582] PGD 0
>>>[    9.989147] Oops: 0002 [#2] SMP
>>>[    9.992891] Modules linked in:
>>>[    9.996623] CPU: 24 PID: 585 Comm: kdevtmpfs Tainted: G      D       =
  4.8.0-rc1-00300-gdc6db24d #1
>>>[   10.007173] Hardware name: Intel Corporation S2600WTT/S2600WTT, BIOS =
SE5C610.86B.01.01.0008.021120151325 02/11/2015
>>>[   10.019279] task: ffff880068040000 task.stack: ffff880068024000
>>>[   10.026147] RIP: 0010:[<ffffffff819329b9>]  [<ffffffff819329b9>] _raw=
_spin_lock_irqsave+0x29/0x50
>>>[   10.036577] RSP: 0000:ffff8800680276e0  EFLAGS: 00010046
>>>[   10.042763] RAX: 0000000000000000 RBX: 0000000000000097 RCX: ffffffff=
81e5af08
>>>[   10.050991] RDX: 0000000000000001 RSI: ffff880068027738 RDI: 00000001=
00000048
>>>[   10.059221] RBP: ffff8800680276e8 R08: 0000000000000001 R09: 00000000=
00000001
>>>[   10.067450] R10: ffff880068027c88 R11: 000000000000048c R12: 00000001=
00000048
>>>[   10.075677] R13: 0000000000000008 R14: ffff880068027738 R15: 00000000=
00000046
>>>[   10.083906] FS:  0000000000000000(0000) GS:ffff882053b80000(0000) knl=
GS:0000000000000000
>>>[   10.093384] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>[   10.100059] CR2: 0000000100000048 CR3: 0000000001e06000 CR4: 00000000=
001406e0
>>>[   10.108288] Stack:
>>>[   10.110780]  0000000100000000 ffff880068027718 ffffffff81575da0 fffff=
fff82263b00
>>>[   10.119773]  ffff880068027738 0000000000000008 ffffffff8107e58f ffff8=
80068027728
>>>[   10.128764]  ffffffff81575e4f ffff880068027798 ffffffff8157726f ffff8=
80068027790
>>>[   10.137756] Call Trace:
>>>[   10.140741]  [<ffffffff81575da0>] _extract_crng+0x40/0xb0
>>>[   10.151150]  [<ffffffff8107e58f>] ? print_oops_end_marker+0x3f/0x60
>>>[   10.158405]  [<ffffffff81575e4f>] extract_crng+0x3f/0x50
>>>[   10.164591]  [<ffffffff8157726f>] get_random_bytes+0x6f/0x1a0
>>>[   10.171268]  [<ffffffff810d811a>] ? console_unlock+0x33a/0x610
>>>[   10.178048]  [<ffffffff8107e58f>] print_oops_end_marker+0x3f/0x60
>>>[   10.185106]  [<ffffffff8107e5cd>] oops_exit+0x1d/0x30
>>>[   10.191009]  [<ffffffff8103091e>] oops_end+0x7e/0xd0
>>>[   10.196815]  [<ffffffff81066592>] no_context+0x112/0x380
>>>[   10.203002]  [<ffffffff81066881>] __bad_area_nosemaphore+0x81/0x1c0
>>>[   10.210257]  [<ffffffff810669d4>] bad_area_nosemaphore+0x14/0x20
>>>[   10.217219]  [<ffffffff81066d6c>] __do_page_fault+0xbc/0x4d0
>>>[   10.223796]  [<ffffffff8146b47d>] ? list_del+0xd/0x30
>>>[   10.229690]  [<ffffffff810671b0>] do_page_fault+0x30/0x80
>>>[   10.235972]  [<ffffffff81933f48>] page_fault+0x28/0x30
>>>[   10.241965]  [<ffffffff811e50fc>] ? get_partial_node+0x2c/0x1c0
>>>[   10.249610]  [<ffffffff811d9de5>] ? alloc_pages_current+0x95/0x140
>>>[   10.256771]  [<ffffffff811e551a>] ___slab_alloc+0x28a/0x4b0
>>>[   10.263249]  [<ffffffff813dd477>] ? avc_alloc_node+0x27/0x140
>>>[   10.269921]  [<ffffffff813e2356>] ? selinux_inode_permission+0xc6/0x1=
80
>>>[   10.277564]  [<ffffffff811e4342>] ? new_slab+0x2d2/0x5a0
>>>[   10.283749]  [<ffffffff813dd477>] ? avc_alloc_node+0x27/0x140
>>>[   10.290421]  [<ffffffff811e5760>] __slab_alloc+0x20/0x40
>>>[   10.296607]  [<ffffffff811e6b7f>] kmem_cache_alloc+0x17f/0x1c0
>>>[   10.303379]  [<ffffffff813dd477>] avc_alloc_node+0x27/0x140
>>>[   10.309848]  [<ffffffff813dd87a>] avc_compute_av+0x8a/0x1e0
>>>[   10.316326]  [<ffffffff8121000a>] ? sget_userns+0x4ca/0x4e0
>>>[   10.322806]  [<ffffffff813de596>] avc_has_perm+0x136/0x190
>>>[   10.329184]  [<ffffffff810a4a69>] ? __might_sleep+0x49/0x80
>>>[   10.335660]  [<ffffffff813e0000>] ? inode_doinit_with_dentry+0x530/0x=
660
>>>[   10.343403]  [<ffffffff813f4c5d>] ? security_transition_sid+0x2d/0x40
>>>[   10.350855]  [<ffffffff813e1379>] may_create+0xb9/0xe0
>>>[   10.356849]  [<ffffffff813e13e2>] selinux_inode_mknod+0x42/0x80
>>>[   10.363716]  [<ffffffff813da552>] security_inode_mknod+0x52/0x80
>>>[   10.370680]  [<ffffffff812197e1>] vfs_mknod+0x131/0x1e0
>>>[   10.376770]  [<ffffffff815b2e65>] handle_create+0x75/0x1e0
>>>[   10.383151]  [<ffffffff8192da66>] ? __schedule+0x2e6/0x790
>>>[   10.389533]  [<ffffffff815b3104>] devtmpfsd+0x134/0x180
>>>[   10.395622]  [<ffffffff815b2fd0>] ? handle_create+0x1e0/0x1e0
>>>[   10.402299]  [<ffffffff8109ded4>] kthread+0xd4/0xf0
>>>[   10.408001]  [<ffffffff81932cbf>] ret_from_fork+0x1f/0x40
>>>[   10.414284]  [<ffffffff8109de00>] ? kthread_create_on_node+0x180/0x180
>>>[   10.421829] Code: 00 00 0f 1f 44 00 00 55 48 89 e5 53 9c 58 0f 1f 44 =
00 00 48 89 c3 fa 66 0f 1f 44 00 00 65 ff 05 9e a8 6d 7e 31 c0 ba 01 00 00 =
00 <f0> 0f b1 17 85 c0 75 06 48 89 d8 5b 5d c3 89 c6 e8 22 74 79 ff
>>>[   10.448339] RIP  [<ffffffff819329b9>] _raw_spin_lock_irqsave+0x29/0x50
>>>[   10.455959]  RSP <ffff8800680276e0>
>>>[   10.460101] CR2: 0000000100000048
>>>[   10.464058] BUG: unable to handle kernel paging request at 0000000100=
000048
>>>[   10.472244] IP: [<ffffffff819329b9>] _raw_spin_lock_irqsave+0x29/0x50
>>>[   10.479768] PGD 0
>>>[   10.482332] Oops: 0002 [#3] SMP
>>>[   10.486089] Modules linked in:
>>>[   10.489822] CPU: 24 PID: 585 Comm: kdevtmpfs Tainted: G      D       =
  4.8.0-rc1-00300-gdc6db24d #1
>>>[   10.500366] Hardware name: Intel Corporation S2600WTT/S2600WTT, BIOS =
SE5C610.86B.01.01.0008.021120151325 02/11/2015
>>>[   10.512467] task: ffff880068040000 task.stack: ffff880068024000
>>>[   10.519334] RIP: 0010:[<ffffffff819329b9>]  [<ffffffff819329b9>] _raw=
_spin_lock_irqsave+0x29/0x50
>>>[   10.529765] RSP: 0000:ffff8800680273d0  EFLAGS: 00010046
>>>[   10.535952] RAX: 0000000000000000 RBX: 0000000000000097 RCX: ffffffff=
81e5af08
>>>[   10.544183] RDX: 0000000000000001 RSI: ffff880068027428 RDI: 00000001=
00000048
>>>[   10.552410] RBP: ffff8800680273d8 R08: 0000000000000001 R09: 00000000=
00000001
>>>[   10.560641] R10: ffff880068027c88 R11: 00000000000004d1 R12: 00000001=
00000048
>>>[   10.568869] R13: 0000000000000008 R14: ffff880068027428 R15: 00000000=
00000046
>>>[   10.577097] FS:  0000000000000000(0000) GS:ffff882053b80000(0000) knl=
GS:0000000000000000
>>>[   10.586578] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>[   10.593250] CR2: 0000000100000048 CR3: 0000000001e06000 CR4: 00000000=
001406e0
>>>[   10.601479] Stack:
>>>[   10.603969]  0000000100000000 ffff880068027408 ffffffff81575da0 fffff=
fff82263b00
>>>[   10.612968]  ffff880068027428 0000000000000008 ffffffff8107e58f ffff8=
80068027418
>>>[   10.621966]  ffffffff81575e4f ffff880068027488 ffffffff8157726f ffff8=
80068027480
>>>[   10.630963] Call Trace:
>>>[   10.633942]  [<ffffffff81575da0>] _extract_crng+0x40/0xb0
>>>[   10.640228]  [<ffffffff8107e58f>] ? print_oops_end_marker+0x3f/0x60
>>>[   10.647484]  [<ffffffff81575e4f>] extract_crng+0x3f/0x50
>>>[   10.653670]  [<ffffffff8157726f>] get_random_bytes+0x6f/0x1a0
>>>[   10.660342]  [<ffffffff810d811a>] ? console_unlock+0x33a/0x610
>>>[   10.667113]  [<ffffffff8107e58f>] print_oops_end_marker+0x3f/0x60
>>>[   10.674173]  [<ffffffff8107e5cd>] oops_exit+0x1d/0x30
>>>[   10.680069]  [<ffffffff8103091e>] oops_end+0x7e/0xd0
>>>[   10.685868]  [<ffffffff81066592>] no_context+0x112/0x380
>>>[   10.692059]  [<ffffffff81457b18>] ? put_dec+0x18/0xa0
>>>[   10.697962]  [<ffffffff81066881>] __bad_area_nosemaphore+0x81/0x1c0
>>>[   10.705218]  [<ffffffff810669d4>] bad_area_nosemaphore+0x14/0x20
>>>[   10.712183]  [<ffffffff81066d6c>] __do_page_fault+0xbc/0x4d0
>>>[   10.718756]  [<ffffffff810671b0>] do_page_fault+0x30/0x80
>>>[   10.725040]  [<ffffffff8109f061>] ? atomic_notifier_call_chain+0x21/0=
x30
>>>[   10.732783]  [<ffffffff81933f48>] page_fault+0x28/0x30
>>>[   10.738777]  [<ffffffff819329b9>] ? _raw_spin_lock_irqsave+0x29/0x50
>>>[   10.746132]  [<ffffffff81575da0>] _extract_crng+0x40/0xb0
>>>[   10.752415]  [<ffffffff8107e58f>] ? print_oops_end_marker+0x3f/0x60
>>>[   10.759671]  [<ffffffff81575e4f>] extract_crng+0x3f/0x50
>>>[   10.765856]  [<ffffffff8157726f>] get_random_bytes+0x6f/0x1a0
>>>[   10.772530]  [<ffffffff810d811a>] ? console_unlock+0x33a/0x610
>>>[   10.779301]  [<ffffffff8107e58f>] print_oops_end_marker+0x3f/0x60
>>>[   10.786364]  [<ffffffff8107e5cd>] oops_exit+0x1d/0x30
>>>[   10.792257]  [<ffffffff8103091e>] oops_end+0x7e/0xd0
>>>[   10.798057]  [<ffffffff81066592>] no_context+0x112/0x380
>>>[   10.804244]  [<ffffffff81066881>] __bad_area_nosemaphore+0x81/0x1c0
>>>[   10.811498]  [<ffffffff810669d4>] bad_area_nosemaphore+0x14/0x20
>>>[   10.818463]  [<ffffffff81066d6c>] __do_page_fault+0xbc/0x4d0
>>>[   10.825037]  [<ffffffff8146b47d>] ? list_del+0xd/0x30
>>>[   10.830933]  [<ffffffff810671b0>] do_page_fault+0x30/0x80
>>>[   10.837216]  [<ffffffff81933f48>] page_fault+0x28/0x30
>>>[   10.843208]  [<ffffffff811e50fc>] ? get_partial_node+0x2c/0x1c0
>>>[   10.850855]  [<ffffffff811d9de5>] ? alloc_pages_current+0x95/0x140
>>>[   10.858015]  [<ffffffff811e551a>] ___slab_alloc+0x28a/0x4b0
>>>[   10.864491]  [<ffffffff813dd477>] ? avc_alloc_node+0x27/0x140
>>>[   10.871163]  [<ffffffff813e2356>] ? selinux_inode_permission+0xc6/0x1=
80
>>>[   10.878809]  [<ffffffff811e4342>] ? new_slab+0x2d2/0x5a0
>>>[   10.884995]  [<ffffffff813dd477>] ? avc_alloc_node+0x27/0x140
>>>[   10.891667]  [<ffffffff811e5760>] __slab_alloc+0x20/0x40
>>>[   10.897853]  [<ffffffff811e6b7f>] kmem_cache_alloc+0x17f/0x1c0
>>>[   10.904623]  [<ffffffff813dd477>] avc_alloc_node+0x27/0x140
>>>[   10.911103]  [<ffffffff813dd87a>] avc_compute_av+0x8a/0x1e0
>>>[   10.917582]  [<ffffffff8121000a>] ? sget_userns+0x4ca/0x4e0
>>>[   10.924061]  [<ffffffff813de596>] avc_has_perm+0x136/0x190
>>>[   10.930443]  [<ffffffff810a4a69>] ? __might_sleep+0x49/0x80
>>>[   10.936924]  [<ffffffff813e0000>] ? inode_doinit_with_dentry+0x530/0x=
660
>>>[   10.944666]  [<ffffffff813f4c5d>] ? security_transition_sid+0x2d/0x40
>>>[   10.952120]  [<ffffffff813e1379>] may_create+0xb9/0xe0
>>>[   10.958112]  [<ffffffff813e13e2>] selinux_inode_mknod+0x42/0x80
>>>[   10.964979]  [<ffffffff813da552>] security_inode_mknod+0x52/0x80
>>>[   10.971944]  [<ffffffff812197e1>] vfs_mknod+0x131/0x1e0
>>>[   10.978033]  [<ffffffff815b2e65>] handle_create+0x75/0x1e0
>>>
>>>
>>>To reproduce:
>>>
>>>       git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>>>       cd lkp-tests
>>>       bin/lkp install job.yaml  # job file is attached in this email
>>>       bin/lkp run     job.yaml
>>>
>>>
>>>
>>>Thanks,
>>>Xiaolong
>>
>>>#
>>># Automatically generated file; DO NOT EDIT.
>>># Linux/x86_64 4.8.0-rc1 Kernel Configuration
>>>#
>>>CONFIG_64BIT=3Dy
>>>CONFIG_X86_64=3Dy
>>>CONFIG_X86=3Dy
>>>CONFIG_INSTRUCTION_DECODER=3Dy
>>>CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
>>>CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/x86_64_defconfig"
>>>CONFIG_LOCKDEP_SUPPORT=3Dy
>>>CONFIG_STACKTRACE_SUPPORT=3Dy
>>>CONFIG_MMU=3Dy
>>>CONFIG_ARCH_MMAP_RND_BITS_MIN=3D28
>>>CONFIG_ARCH_MMAP_RND_BITS_MAX=3D32
>>>CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
>>>CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
>>>CONFIG_NEED_DMA_MAP_STATE=3Dy
>>>CONFIG_NEED_SG_DMA_LENGTH=3Dy
>>>CONFIG_GENERIC_ISA_DMA=3Dy
>>>CONFIG_GENERIC_BUG=3Dy
>>>CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
>>>CONFIG_GENERIC_HWEIGHT=3Dy
>>>CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
>>>CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
>>>CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
>>>CONFIG_ARCH_HAS_CPU_RELAX=3Dy
>>>CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
>>>CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
>>>CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
>>>CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
>>>CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
>>>CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
>>>CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
>>>CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
>>>CONFIG_ZONE_DMA32=3Dy
>>>CONFIG_AUDIT_ARCH=3Dy
>>>CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
>>>CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
>>>CONFIG_HAVE_INTEL_TXT=3Dy
>>>CONFIG_X86_64_SMP=3Dy
>>>CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
>>>CONFIG_FIX_EARLYCON_MEM=3Dy
>>>CONFIG_DEBUG_RODATA=3Dy
>>>CONFIG_PGTABLE_LEVELS=3D4
>>>CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
>>>CONFIG_IRQ_WORK=3Dy
>>>CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
>>>
>>>#
>>># General setup
>>>#
>>>CONFIG_INIT_ENV_ARG_LIMIT=3D32
>>>CONFIG_CROSS_COMPILE=3D""
>>># CONFIG_COMPILE_TEST is not set
>>>CONFIG_LOCALVERSION=3D""
>>>CONFIG_LOCALVERSION_AUTO=3Dy
>>>CONFIG_HAVE_KERNEL_GZIP=3Dy
>>>CONFIG_HAVE_KERNEL_BZIP2=3Dy
>>>CONFIG_HAVE_KERNEL_LZMA=3Dy
>>>CONFIG_HAVE_KERNEL_XZ=3Dy
>>>CONFIG_HAVE_KERNEL_LZO=3Dy
>>>CONFIG_HAVE_KERNEL_LZ4=3Dy
>>>CONFIG_KERNEL_GZIP=3Dy
>>># CONFIG_KERNEL_BZIP2 is not set
>>># CONFIG_KERNEL_LZMA is not set
>>># CONFIG_KERNEL_XZ is not set
>>># CONFIG_KERNEL_LZO is not set
>>># CONFIG_KERNEL_LZ4 is not set
>>>CONFIG_DEFAULT_HOSTNAME=3D"(none)"
>>>CONFIG_SWAP=3Dy
>>>CONFIG_SYSVIPC=3Dy
>>>CONFIG_SYSVIPC_SYSCTL=3Dy
>>>CONFIG_POSIX_MQUEUE=3Dy
>>>CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
>>>CONFIG_CROSS_MEMORY_ATTACH=3Dy
>>>CONFIG_FHANDLE=3Dy
>>>CONFIG_USELIB=3Dy
>>>CONFIG_AUDIT=3Dy
>>>CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
>>>CONFIG_AUDITSYSCALL=3Dy
>>>CONFIG_AUDIT_WATCH=3Dy
>>>CONFIG_AUDIT_TREE=3Dy
>>>
>>>#
>>># IRQ subsystem
>>>#
>>>CONFIG_GENERIC_IRQ_PROBE=3Dy
>>>CONFIG_GENERIC_IRQ_SHOW=3Dy
>>>CONFIG_GENERIC_PENDING_IRQ=3Dy
>>>CONFIG_IRQ_DOMAIN=3Dy
>>>CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
>>>CONFIG_GENERIC_MSI_IRQ=3Dy
>>>CONFIG_GENERIC_MSI_IRQ_DOMAIN=3Dy
>>># CONFIG_IRQ_DOMAIN_DEBUG is not set
>>>CONFIG_IRQ_FORCED_THREADING=3Dy
>>>CONFIG_SPARSE_IRQ=3Dy
>>>CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
>>>CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
>>>CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
>>>CONFIG_GENERIC_TIME_VSYSCALL=3Dy
>>>CONFIG_GENERIC_CLOCKEVENTS=3Dy
>>>CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
>>>CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
>>>CONFIG_GENERIC_CMOS_UPDATE=3Dy
>>>
>>>#
>>># Timers subsystem
>>>#
>>>CONFIG_TICK_ONESHOT=3Dy
>>>CONFIG_NO_HZ_COMMON=3Dy
>>># CONFIG_HZ_PERIODIC is not set
>>># CONFIG_NO_HZ_IDLE is not set
>>>CONFIG_NO_HZ_FULL=3Dy
>>># CONFIG_NO_HZ_FULL_ALL is not set
>>># CONFIG_NO_HZ_FULL_SYSIDLE is not set
>>>CONFIG_NO_HZ=3Dy
>>>CONFIG_HIGH_RES_TIMERS=3Dy
>>>
>>>#
>>># CPU/Task time and stats accounting
>>>#
>>>CONFIG_VIRT_CPU_ACCOUNTING=3Dy
>>>CONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy
>>># CONFIG_IRQ_TIME_ACCOUNTING is not set
>>>CONFIG_BSD_PROCESS_ACCT=3Dy
>>>CONFIG_BSD_PROCESS_ACCT_V3=3Dy
>>>CONFIG_TASKSTATS=3Dy
>>>CONFIG_TASK_DELAY_ACCT=3Dy
>>>CONFIG_TASK_XACCT=3Dy
>>>CONFIG_TASK_IO_ACCOUNTING=3Dy
>>>
>>>#
>>># RCU Subsystem
>>>#
>>>CONFIG_TREE_RCU=3Dy
>>># CONFIG_RCU_EXPERT is not set
>>>CONFIG_SRCU=3Dy
>>>CONFIG_TASKS_RCU=3Dy
>>>CONFIG_RCU_STALL_COMMON=3Dy
>>>CONFIG_CONTEXT_TRACKING=3Dy
>>># CONFIG_CONTEXT_TRACKING_FORCE is not set
>>># CONFIG_TREE_RCU_TRACE is not set
>>>CONFIG_RCU_NOCB_CPU=3Dy
>>># CONFIG_RCU_NOCB_CPU_NONE is not set
>>># CONFIG_RCU_NOCB_CPU_ZERO is not set
>>>CONFIG_RCU_NOCB_CPU_ALL=3Dy
>>># CONFIG_RCU_EXPEDITE_BOOT is not set
>>>CONFIG_BUILD_BIN2C=3Dy
>>>CONFIG_IKCONFIG=3Dy
>>>CONFIG_IKCONFIG_PROC=3Dy
>>>CONFIG_LOG_BUF_SHIFT=3D19
>>>CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
>>>CONFIG_NMI_LOG_BUF_SHIFT=3D13
>>>CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
>>>CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
>>>CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
>>>CONFIG_ARCH_SUPPORTS_INT128=3Dy
>>>CONFIG_NUMA_BALANCING=3Dy
>>>CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=3Dy
>>>CONFIG_CGROUPS=3Dy
>>>CONFIG_PAGE_COUNTER=3Dy
>>>CONFIG_MEMCG=3Dy
>>>CONFIG_MEMCG_SWAP=3Dy
>>>CONFIG_MEMCG_SWAP_ENABLED=3Dy
>>>CONFIG_BLK_CGROUP=3Dy
>>># CONFIG_DEBUG_BLK_CGROUP is not set
>>>CONFIG_CGROUP_WRITEBACK=3Dy
>>>CONFIG_CGROUP_SCHED=3Dy
>>>CONFIG_FAIR_GROUP_SCHED=3Dy
>>>CONFIG_CFS_BANDWIDTH=3Dy
>>>CONFIG_RT_GROUP_SCHED=3Dy
>>># CONFIG_CGROUP_PIDS is not set
>>>CONFIG_CGROUP_FREEZER=3Dy
>>>CONFIG_CGROUP_HUGETLB=3Dy
>>>CONFIG_CPUSETS=3Dy
>>>CONFIG_PROC_PID_CPUSET=3Dy
>>>CONFIG_CGROUP_DEVICE=3Dy
>>># CONFIG_CGROUP_CPUACCT is not set
>>>CONFIG_CGROUP_PERF=3Dy
>>># CONFIG_CGROUP_DEBUG is not set
>>># CONFIG_CHECKPOINT_RESTORE is not set
>>>CONFIG_NAMESPACES=3Dy
>>>CONFIG_UTS_NS=3Dy
>>>CONFIG_IPC_NS=3Dy
>>>CONFIG_USER_NS=3Dy
>>>CONFIG_PID_NS=3Dy
>>>CONFIG_NET_NS=3Dy
>>>CONFIG_SCHED_AUTOGROUP=3Dy
>>># CONFIG_SYSFS_DEPRECATED is not set
>>>CONFIG_RELAY=3Dy
>>>CONFIG_BLK_DEV_INITRD=3Dy
>>>CONFIG_INITRAMFS_SOURCE=3D""
>>>CONFIG_RD_GZIP=3Dy
>>>CONFIG_RD_BZIP2=3Dy
>>>CONFIG_RD_LZMA=3Dy
>>>CONFIG_RD_XZ=3Dy
>>>CONFIG_RD_LZO=3Dy
>>>CONFIG_RD_LZ4=3Dy
>>>CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
>>># CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
>>>CONFIG_SYSCTL=3Dy
>>>CONFIG_ANON_INODES=3Dy
>>>CONFIG_HAVE_UID16=3Dy
>>>CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
>>>CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
>>>CONFIG_BPF=3Dy
>>># CONFIG_EXPERT is not set
>>>CONFIG_UID16=3Dy
>>>CONFIG_MULTIUSER=3Dy
>>>CONFIG_SGETMASK_SYSCALL=3Dy
>>>CONFIG_SYSFS_SYSCALL=3Dy
>>># CONFIG_SYSCTL_SYSCALL is not set
>>>CONFIG_KALLSYMS=3Dy
>>>CONFIG_KALLSYMS_ALL=3Dy
>>>CONFIG_KALLSYMS_ABSOLUTE_PERCPU=3Dy
>>>CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
>>>CONFIG_PRINTK=3Dy
>>>CONFIG_PRINTK_NMI=3Dy
>>>CONFIG_BUG=3Dy
>>>CONFIG_ELF_CORE=3Dy
>>>CONFIG_PCSPKR_PLATFORM=3Dy
>>>CONFIG_BASE_FULL=3Dy
>>>CONFIG_FUTEX=3Dy
>>>CONFIG_EPOLL=3Dy
>>>CONFIG_SIGNALFD=3Dy
>>>CONFIG_TIMERFD=3Dy
>>>CONFIG_EVENTFD=3Dy
>>># CONFIG_BPF_SYSCALL is not set
>>>CONFIG_SHMEM=3Dy
>>>CONFIG_AIO=3Dy
>>>CONFIG_ADVISE_SYSCALLS=3Dy
>>># CONFIG_USERFAULTFD is not set
>>>CONFIG_PCI_QUIRKS=3Dy
>>>CONFIG_MEMBARRIER=3Dy
>>># CONFIG_EMBEDDED is not set
>>>CONFIG_HAVE_PERF_EVENTS=3Dy
>>>
>>>#
>>># Kernel Performance Events And Counters
>>>#
>>>CONFIG_PERF_EVENTS=3Dy
>>># CONFIG_DEBUG_PERF_USE_VMALLOC is not set
>>>CONFIG_VM_EVENT_COUNTERS=3Dy
>>>CONFIG_SLUB_DEBUG=3Dy
>>># CONFIG_COMPAT_BRK is not set
>>># CONFIG_SLAB is not set
>>>CONFIG_SLUB=3Dy
>>># CONFIG_SLAB_FREELIST_RANDOM is not set
>>>CONFIG_SLUB_CPU_PARTIAL=3Dy
>>># CONFIG_SYSTEM_DATA_VERIFICATION is not set
>>>CONFIG_PROFILING=3Dy
>>>CONFIG_TRACEPOINTS=3Dy
>>>CONFIG_KEXEC_CORE=3Dy
>>>CONFIG_OPROFILE=3Dm
>>>CONFIG_OPROFILE_EVENT_MULTIPLEX=3Dy
>>>CONFIG_HAVE_OPROFILE=3Dy
>>>CONFIG_OPROFILE_NMI_TIMER=3Dy
>>>CONFIG_KPROBES=3Dy
>>>CONFIG_JUMP_LABEL=3Dy
>>># CONFIG_STATIC_KEYS_SELFTEST is not set
>>>CONFIG_OPTPROBES=3Dy
>>>CONFIG_KPROBES_ON_FTRACE=3Dy
>>>CONFIG_UPROBES=3Dy
>>># CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
>>>CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
>>>CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
>>>CONFIG_KRETPROBES=3Dy
>>>CONFIG_USER_RETURN_NOTIFIER=3Dy
>>>CONFIG_HAVE_IOREMAP_PROT=3Dy
>>>CONFIG_HAVE_KPROBES=3Dy
>>>CONFIG_HAVE_KRETPROBES=3Dy
>>>CONFIG_HAVE_OPTPROBES=3Dy
>>>CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
>>>CONFIG_HAVE_NMI=3Dy
>>>CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
>>>CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
>>>CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
>>>CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
>>>CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
>>>CONFIG_HAVE_CLK=3Dy
>>>CONFIG_HAVE_DMA_API_DEBUG=3Dy
>>>CONFIG_HAVE_HW_BREAKPOINT=3Dy
>>>CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
>>>CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
>>>CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
>>>CONFIG_HAVE_PERF_REGS=3Dy
>>>CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
>>>CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
>>>CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
>>>CONFIG_HAVE_ALIGNED_STRUCT_PAGE=3Dy
>>>CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
>>>CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
>>>CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=3Dy
>>>CONFIG_ARCH_WANT_OLD_COMPAT_IPC=3Dy
>>>CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
>>>CONFIG_SECCOMP_FILTER=3Dy
>>>CONFIG_HAVE_GCC_PLUGINS=3Dy
>>># CONFIG_GCC_PLUGINS is not set
>>>CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
>>># CONFIG_CC_STACKPROTECTOR is not set
>>>CONFIG_CC_STACKPROTECTOR_NONE=3Dy
>>># CONFIG_CC_STACKPROTECTOR_REGULAR is not set
>>># CONFIG_CC_STACKPROTECTOR_STRONG is not set
>>>CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
>>>CONFIG_HAVE_CONTEXT_TRACKING=3Dy
>>>CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
>>>CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
>>>CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
>>>CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
>>>CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
>>>CONFIG_MODULES_USE_ELF_RELA=3Dy
>>>CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
>>>CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
>>>CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
>>>CONFIG_HAVE_EXIT_THREAD=3Dy
>>>CONFIG_ARCH_MMAP_RND_BITS=3D28
>>>CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=3Dy
>>>CONFIG_ARCH_MMAP_RND_COMPAT_BITS=3D8
>>>CONFIG_HAVE_COPY_THREAD_TLS=3Dy
>>>CONFIG_HAVE_STACK_VALIDATION=3Dy
>>># CONFIG_HAVE_ARCH_HASH is not set
>>># CONFIG_ISA_BUS_API is not set
>>>CONFIG_OLD_SIGSUSPEND3=3Dy
>>>CONFIG_COMPAT_OLD_SIGACTION=3Dy
>>># CONFIG_CPU_NO_EFFICIENT_FFS is not set
>>>
>>>#
>>># GCOV-based kernel profiling
>>>#
>>># CONFIG_GCOV_KERNEL is not set
>>>CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
>>># CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
>>>CONFIG_SLABINFO=3Dy
>>>CONFIG_RT_MUTEXES=3Dy
>>>CONFIG_BASE_SMALL=3D0
>>>CONFIG_MODULES=3Dy
>>>CONFIG_MODULE_FORCE_LOAD=3Dy
>>>CONFIG_MODULE_UNLOAD=3Dy
>>># CONFIG_MODULE_FORCE_UNLOAD is not set
>>># CONFIG_MODVERSIONS is not set
>>># CONFIG_MODULE_SRCVERSION_ALL is not set
>>># CONFIG_MODULE_SIG is not set
>>># CONFIG_MODULE_COMPRESS is not set
>>># CONFIG_TRIM_UNUSED_KSYMS is not set
>>>CONFIG_MODULES_TREE_LOOKUP=3Dy
>>>CONFIG_BLOCK=3Dy
>>>CONFIG_BLK_DEV_BSG=3Dy
>>>CONFIG_BLK_DEV_BSGLIB=3Dy
>>>CONFIG_BLK_DEV_INTEGRITY=3Dy
>>>CONFIG_BLK_DEV_THROTTLING=3Dy
>>># CONFIG_BLK_CMDLINE_PARSER is not set
>>>
>>>#
>>># Partition Types
>>>#
>>>CONFIG_PARTITION_ADVANCED=3Dy
>>># CONFIG_ACORN_PARTITION is not set
>>># CONFIG_AIX_PARTITION is not set
>>>CONFIG_OSF_PARTITION=3Dy
>>>CONFIG_AMIGA_PARTITION=3Dy
>>># CONFIG_ATARI_PARTITION is not set
>>>CONFIG_MAC_PARTITION=3Dy
>>>CONFIG_MSDOS_PARTITION=3Dy
>>>CONFIG_BSD_DISKLABEL=3Dy
>>>CONFIG_MINIX_SUBPARTITION=3Dy
>>>CONFIG_SOLARIS_X86_PARTITION=3Dy
>>>CONFIG_UNIXWARE_DISKLABEL=3Dy
>>># CONFIG_LDM_PARTITION is not set
>>>CONFIG_SGI_PARTITION=3Dy
>>># CONFIG_ULTRIX_PARTITION is not set
>>>CONFIG_SUN_PARTITION=3Dy
>>>CONFIG_KARMA_PARTITION=3Dy
>>>CONFIG_EFI_PARTITION=3Dy
>>># CONFIG_SYSV68_PARTITION is not set
>>># CONFIG_CMDLINE_PARTITION is not set
>>>CONFIG_BLOCK_COMPAT=3Dy
>>>
>>>#
>>># IO Schedulers
>>>#
>>>CONFIG_IOSCHED_NOOP=3Dy
>>>CONFIG_IOSCHED_DEADLINE=3Dy
>>>CONFIG_IOSCHED_CFQ=3Dy
>>>CONFIG_CFQ_GROUP_IOSCHED=3Dy
>>>CONFIG_DEFAULT_DEADLINE=3Dy
>>># CONFIG_DEFAULT_CFQ is not set
>>># CONFIG_DEFAULT_NOOP is not set
>>>CONFIG_DEFAULT_IOSCHED=3D"deadline"
>>>CONFIG_PREEMPT_NOTIFIERS=3Dy
>>>CONFIG_PADATA=3Dy
>>>CONFIG_ASN1=3Dy
>>>CONFIG_INLINE_SPIN_UNLOCK_IRQ=3Dy
>>>CONFIG_INLINE_READ_UNLOCK=3Dy
>>>CONFIG_INLINE_READ_UNLOCK_IRQ=3Dy
>>>CONFIG_INLINE_WRITE_UNLOCK=3Dy
>>>CONFIG_INLINE_WRITE_UNLOCK_IRQ=3Dy
>>>CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
>>>CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
>>>CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
>>>CONFIG_LOCK_SPIN_ON_OWNER=3Dy
>>>CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
>>>CONFIG_QUEUED_SPINLOCKS=3Dy
>>>CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
>>>CONFIG_QUEUED_RWLOCKS=3Dy
>>>CONFIG_FREEZER=3Dy
>>>
>>>#
>>># Processor type and features
>>>#
>>>CONFIG_ZONE_DMA=3Dy
>>>CONFIG_SMP=3Dy
>>>CONFIG_X86_FEATURE_NAMES=3Dy
>>>CONFIG_X86_FAST_FEATURE_TESTS=3Dy
>>>CONFIG_X86_X2APIC=3Dy
>>>CONFIG_X86_MPPARSE=3Dy
>>># CONFIG_GOLDFISH is not set
>>>CONFIG_X86_EXTENDED_PLATFORM=3Dy
>>># CONFIG_X86_NUMACHIP is not set
>>># CONFIG_X86_VSMP is not set
>>>CONFIG_X86_UV=3Dy
>>># CONFIG_X86_GOLDFISH is not set
>>># CONFIG_X86_INTEL_MID is not set
>>>CONFIG_X86_INTEL_LPSS=3Dy
>>># CONFIG_X86_AMD_PLATFORM_DEVICE is not set
>>>CONFIG_IOSF_MBI=3Dy
>>># CONFIG_IOSF_MBI_DEBUG is not set
>>>CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
>>># CONFIG_SCHED_OMIT_FRAME_POINTER is not set
>>>CONFIG_HYPERVISOR_GUEST=3Dy
>>>CONFIG_PARAVIRT=3Dy
>>># CONFIG_PARAVIRT_DEBUG is not set
>>>CONFIG_PARAVIRT_SPINLOCKS=3Dy
>>># CONFIG_QUEUED_LOCK_STAT is not set
>>>CONFIG_XEN=3Dy
>>>CONFIG_XEN_DOM0=3Dy
>>>CONFIG_XEN_PVHVM=3Dy
>>>CONFIG_XEN_512GB=3Dy
>>>CONFIG_XEN_SAVE_RESTORE=3Dy
>>># CONFIG_XEN_DEBUG_FS is not set
>>># CONFIG_XEN_PVH is not set
>>>CONFIG_KVM_GUEST=3Dy
>>># CONFIG_KVM_DEBUG_FS is not set
>>>CONFIG_PARAVIRT_TIME_ACCOUNTING=3Dy
>>>CONFIG_PARAVIRT_CLOCK=3Dy
>>>CONFIG_NO_BOOTMEM=3Dy
>>># CONFIG_MK8 is not set
>>># CONFIG_MPSC is not set
>>># CONFIG_MCORE2 is not set
>>># CONFIG_MATOM is not set
>>>CONFIG_GENERIC_CPU=3Dy
>>>CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
>>>CONFIG_X86_L1_CACHE_SHIFT=3D6
>>>CONFIG_X86_TSC=3Dy
>>>CONFIG_X86_CMPXCHG64=3Dy
>>>CONFIG_X86_CMOV=3Dy
>>>CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
>>>CONFIG_X86_DEBUGCTLMSR=3Dy
>>>CONFIG_CPU_SUP_INTEL=3Dy
>>>CONFIG_CPU_SUP_AMD=3Dy
>>>CONFIG_CPU_SUP_CENTAUR=3Dy
>>>CONFIG_HPET_TIMER=3Dy
>>>CONFIG_HPET_EMULATE_RTC=3Dy
>>>CONFIG_DMI=3Dy
>>>CONFIG_GART_IOMMU=3Dy
>>># CONFIG_CALGARY_IOMMU is not set
>>>CONFIG_SWIOTLB=3Dy
>>>CONFIG_IOMMU_HELPER=3Dy
>>>CONFIG_MAXSMP=3Dy
>>>CONFIG_NR_CPUS=3D8192
>>>CONFIG_SCHED_SMT=3Dy
>>>CONFIG_SCHED_MC=3Dy
>>># CONFIG_PREEMPT_NONE is not set
>>>CONFIG_PREEMPT_VOLUNTARY=3Dy
>>># CONFIG_PREEMPT is not set
>>>CONFIG_PREEMPT_COUNT=3Dy
>>>CONFIG_X86_LOCAL_APIC=3Dy
>>>CONFIG_X86_IO_APIC=3Dy
>>>CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
>>>CONFIG_X86_MCE=3Dy
>>>CONFIG_X86_MCE_INTEL=3Dy
>>>CONFIG_X86_MCE_AMD=3Dy
>>>CONFIG_X86_MCE_THRESHOLD=3Dy
>>>CONFIG_X86_MCE_INJECT=3Dm
>>>CONFIG_X86_THERMAL_VECTOR=3Dy
>>>
>>>#
>>># Performance monitoring
>>>#
>>>CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
>>>CONFIG_PERF_EVENTS_INTEL_RAPL=3Dy
>>>CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dy
>>># CONFIG_PERF_EVENTS_AMD_POWER is not set
>>># CONFIG_VM86 is not set
>>>CONFIG_X86_16BIT=3Dy
>>>CONFIG_X86_ESPFIX64=3Dy
>>>CONFIG_X86_VSYSCALL_EMULATION=3Dy
>>>CONFIG_I8K=3Dm
>>>CONFIG_MICROCODE=3Dy
>>>CONFIG_MICROCODE_INTEL=3Dy
>>>CONFIG_MICROCODE_AMD=3Dy
>>>CONFIG_MICROCODE_OLD_INTERFACE=3Dy
>>>CONFIG_X86_MSR=3Dy
>>>CONFIG_X86_CPUID=3Dy
>>>CONFIG_ARCH_PHYS_ADDR_T_64BIT=3Dy
>>>CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
>>>CONFIG_X86_DIRECT_GBPAGES=3Dy
>>>CONFIG_NUMA=3Dy
>>>CONFIG_AMD_NUMA=3Dy
>>>CONFIG_X86_64_ACPI_NUMA=3Dy
>>>CONFIG_NODES_SPAN_OTHER_NODES=3Dy
>>># CONFIG_NUMA_EMU is not set
>>>CONFIG_NODES_SHIFT=3D10
>>>CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
>>>CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
>>>CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
>>>CONFIG_ARCH_MEMORY_PROBE=3Dy
>>>CONFIG_ARCH_PROC_KCORE_TEXT=3Dy
>>>CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
>>>CONFIG_SELECT_MEMORY_MODEL=3Dy
>>>CONFIG_SPARSEMEM_MANUAL=3Dy
>>>CONFIG_SPARSEMEM=3Dy
>>>CONFIG_NEED_MULTIPLE_NODES=3Dy
>>>CONFIG_HAVE_MEMORY_PRESENT=3Dy
>>>CONFIG_SPARSEMEM_EXTREME=3Dy
>>>CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
>>>CONFIG_SPARSEMEM_ALLOC_MEM_MAP_TOGETHER=3Dy
>>>CONFIG_SPARSEMEM_VMEMMAP=3Dy
>>>CONFIG_HAVE_MEMBLOCK=3Dy
>>>CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
>>>CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
>>>CONFIG_MEMORY_ISOLATION=3Dy
>>>CONFIG_MOVABLE_NODE=3Dy
>>>CONFIG_HAVE_BOOTMEM_INFO_NODE=3Dy
>>>CONFIG_MEMORY_HOTPLUG=3Dy
>>>CONFIG_MEMORY_HOTPLUG_SPARSE=3Dy
>>># CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
>>>CONFIG_MEMORY_HOTREMOVE=3Dy
>>>CONFIG_SPLIT_PTLOCK_CPUS=3D4
>>>CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
>>>CONFIG_MEMORY_BALLOON=3Dy
>>>CONFIG_BALLOON_COMPACTION=3Dy
>>>CONFIG_COMPACTION=3Dy
>>>CONFIG_MIGRATION=3Dy
>>>CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=3Dy
>>>CONFIG_PHYS_ADDR_T_64BIT=3Dy
>>>CONFIG_BOUNCE=3Dy
>>>CONFIG_VIRT_TO_BUS=3Dy
>>>CONFIG_MMU_NOTIFIER=3Dy
>>>CONFIG_KSM=3Dy
>>>CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
>>>CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
>>>CONFIG_MEMORY_FAILURE=3Dy
>>>CONFIG_HWPOISON_INJECT=3Dm
>>>CONFIG_TRANSPARENT_HUGEPAGE=3Dy
>>>CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=3Dy
>>># CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
>>>CONFIG_TRANSPARENT_HUGE_PAGECACHE=3Dy
>>>CONFIG_CLEANCACHE=3Dy
>>>CONFIG_FRONTSWAP=3Dy
>>>CONFIG_CMA=3Dy
>>># CONFIG_CMA_DEBUG is not set
>>># CONFIG_CMA_DEBUGFS is not set
>>>CONFIG_CMA_AREAS=3D7
>>>CONFIG_ZSWAP=3Dy
>>>CONFIG_ZPOOL=3Dy
>>>CONFIG_ZBUD=3Dy
>>># CONFIG_Z3FOLD is not set
>>>CONFIG_ZSMALLOC=3Dy
>>># CONFIG_PGTABLE_MAPPING is not set
>>># CONFIG_ZSMALLOC_STAT is not set
>>>CONFIG_GENERIC_EARLY_IOREMAP=3Dy
>>>CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=3Dy
>>># CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
>>># CONFIG_IDLE_PAGE_TRACKING is not set
>>>CONFIG_ZONE_DEVICE=3Dy
>>>CONFIG_FRAME_VECTOR=3Dy
>>>CONFIG_ARCH_USES_HIGH_VMA_FLAGS=3Dy
>>>CONFIG_ARCH_HAS_PKEYS=3Dy
>>>CONFIG_X86_PMEM_LEGACY_DEVICE=3Dy
>>>CONFIG_X86_PMEM_LEGACY=3Dm
>>>CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
>>># CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
>>>CONFIG_X86_RESERVE_LOW=3D64
>>>CONFIG_MTRR=3Dy
>>>CONFIG_MTRR_SANITIZER=3Dy
>>>CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=3D0
>>>CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=3D1
>>>CONFIG_X86_PAT=3Dy
>>>CONFIG_ARCH_USES_PG_UNCACHED=3Dy
>>>CONFIG_ARCH_RANDOM=3Dy
>>>CONFIG_X86_SMAP=3Dy
>>># CONFIG_X86_INTEL_MPX is not set
>>>CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=3Dy
>>>CONFIG_EFI=3Dy
>>>CONFIG_EFI_STUB=3Dy
>>># CONFIG_EFI_MIXED is not set
>>>CONFIG_SECCOMP=3Dy
>>># CONFIG_HZ_100 is not set
>>># CONFIG_HZ_250 is not set
>>># CONFIG_HZ_300 is not set
>>>CONFIG_HZ_1000=3Dy
>>>CONFIG_HZ=3D1000
>>>CONFIG_SCHED_HRTICK=3Dy
>>>CONFIG_KEXEC=3Dy
>>># CONFIG_KEXEC_FILE is not set
>>>CONFIG_CRASH_DUMP=3Dy
>>>CONFIG_KEXEC_JUMP=3Dy
>>>CONFIG_PHYSICAL_START=3D0x1000000
>>>CONFIG_RELOCATABLE=3Dy
>>># CONFIG_RANDOMIZE_BASE is not set
>>>CONFIG_PHYSICAL_ALIGN=3D0x1000000
>>>CONFIG_HOTPLUG_CPU=3Dy
>>># CONFIG_BOOTPARAM_HOTPLUG_CPU0 is not set
>>># CONFIG_DEBUG_HOTPLUG_CPU0 is not set
>>># CONFIG_COMPAT_VDSO is not set
>>># CONFIG_LEGACY_VSYSCALL_NATIVE is not set
>>>CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
>>># CONFIG_LEGACY_VSYSCALL_NONE is not set
>>># CONFIG_CMDLINE_BOOL is not set
>>>CONFIG_MODIFY_LDT_SYSCALL=3Dy
>>>CONFIG_HAVE_LIVEPATCH=3Dy
>>># CONFIG_LIVEPATCH is not set
>>>CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
>>>CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
>>>CONFIG_USE_PERCPU_NUMA_NODE_ID=3Dy
>>>
>>>#
>>># Power management and ACPI options
>>>#
>>>CONFIG_ARCH_HIBERNATION_HEADER=3Dy
>>>CONFIG_SUSPEND=3Dy
>>>CONFIG_SUSPEND_FREEZER=3Dy
>>>CONFIG_HIBERNATE_CALLBACKS=3Dy
>>>CONFIG_HIBERNATION=3Dy
>>>CONFIG_PM_STD_PARTITION=3D""
>>>CONFIG_PM_SLEEP=3Dy
>>>CONFIG_PM_SLEEP_SMP=3Dy
>>># CONFIG_PM_AUTOSLEEP is not set
>>># CONFIG_PM_WAKELOCKS is not set
>>>CONFIG_PM=3Dy
>>>CONFIG_PM_DEBUG=3Dy
>>>CONFIG_PM_ADVANCED_DEBUG=3Dy
>>>CONFIG_PM_TEST_SUSPEND=3Dy
>>>CONFIG_PM_SLEEP_DEBUG=3Dy
>>># CONFIG_DPM_WATCHDOG is not set
>>># CONFIG_PM_TRACE_RTC is not set
>>>CONFIG_PM_CLK=3Dy
>>># CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
>>>CONFIG_ACPI=3Dy
>>>CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
>>>CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
>>>CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
>>># CONFIG_ACPI_DEBUGGER is not set
>>>CONFIG_ACPI_SLEEP=3Dy
>>># CONFIG_ACPI_PROCFS_POWER is not set
>>>CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
>>>CONFIG_ACPI_EC_DEBUGFS=3Dm
>>>CONFIG_ACPI_AC=3Dy
>>>CONFIG_ACPI_BATTERY=3Dy
>>>CONFIG_ACPI_BUTTON=3Dy
>>>CONFIG_ACPI_VIDEO=3Dm
>>>CONFIG_ACPI_FAN=3Dy
>>>CONFIG_ACPI_DOCK=3Dy
>>>CONFIG_ACPI_CPU_FREQ_PSS=3Dy
>>>CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
>>>CONFIG_ACPI_PROCESSOR_IDLE=3Dy
>>>CONFIG_ACPI_PROCESSOR=3Dy
>>>CONFIG_ACPI_IPMI=3Dm
>>>CONFIG_ACPI_HOTPLUG_CPU=3Dy
>>>CONFIG_ACPI_PROCESSOR_AGGREGATOR=3Dm
>>>CONFIG_ACPI_THERMAL=3Dy
>>>CONFIG_ACPI_NUMA=3Dy
>>># CONFIG_ACPI_CUSTOM_DSDT is not set
>>>CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
>>>CONFIG_ACPI_TABLE_UPGRADE=3Dy
>>>CONFIG_ACPI_DEBUG=3Dy
>>>CONFIG_ACPI_PCI_SLOT=3Dy
>>>CONFIG_X86_PM_TIMER=3Dy
>>>CONFIG_ACPI_CONTAINER=3Dy
>>>CONFIG_ACPI_HOTPLUG_MEMORY=3Dy
>>>CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
>>>CONFIG_ACPI_SBS=3Dm
>>>CONFIG_ACPI_HED=3Dy
>>>CONFIG_ACPI_CUSTOM_METHOD=3Dm
>>>CONFIG_ACPI_BGRT=3Dy
>>># CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
>>>CONFIG_ACPI_NFIT=3Dm
>>># CONFIG_ACPI_NFIT_DEBUG is not set
>>>CONFIG_HAVE_ACPI_APEI=3Dy
>>>CONFIG_HAVE_ACPI_APEI_NMI=3Dy
>>>CONFIG_ACPI_APEI=3Dy
>>>CONFIG_ACPI_APEI_GHES=3Dy
>>>CONFIG_ACPI_APEI_PCIEAER=3Dy
>>>CONFIG_ACPI_APEI_MEMORY_FAILURE=3Dy
>>>CONFIG_ACPI_APEI_EINJ=3Dm
>>># CONFIG_ACPI_APEI_ERST_DEBUG is not set
>>># CONFIG_DPTF_POWER is not set
>>># CONFIG_ACPI_EXTLOG is not set
>>># CONFIG_PMIC_OPREGION is not set
>>># CONFIG_ACPI_CONFIGFS is not set
>>>CONFIG_SFI=3Dy
>>>
>>>#
>>># CPU Frequency scaling
>>>#
>>>CONFIG_CPU_FREQ=3Dy
>>>CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
>>>CONFIG_CPU_FREQ_GOV_COMMON=3Dy
>>># CONFIG_CPU_FREQ_STAT is not set
>>># CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
>>># CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
>>># CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
>>>CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=3Dy
>>># CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
>>># CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
>>>CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
>>>CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
>>>CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
>>>CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
>>>CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
>>># CONFIG_CPU_FREQ_GOV_SCHEDUTIL is not set
>>>
>>>#
>>># CPU frequency scaling drivers
>>>#
>>>CONFIG_X86_INTEL_PSTATE=3Dy
>>>CONFIG_X86_PCC_CPUFREQ=3Dm
>>>CONFIG_X86_ACPI_CPUFREQ=3Dm
>>>CONFIG_X86_ACPI_CPUFREQ_CPB=3Dy
>>>CONFIG_X86_POWERNOW_K8=3Dm
>>>CONFIG_X86_AMD_FREQ_SENSITIVITY=3Dm
>>># CONFIG_X86_SPEEDSTEP_CENTRINO is not set
>>>CONFIG_X86_P4_CLOCKMOD=3Dm
>>>
>>>#
>>># shared options
>>>#
>>>CONFIG_X86_SPEEDSTEP_LIB=3Dm
>>>
>>>#
>>># CPU Idle
>>>#
>>>CONFIG_CPU_IDLE=3Dy
>>># CONFIG_CPU_IDLE_GOV_LADDER is not set
>>>CONFIG_CPU_IDLE_GOV_MENU=3Dy
>>># CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
>>>CONFIG_INTEL_IDLE=3Dy
>>>
>>>#
>>># Memory power savings
>>>#
>>>CONFIG_I7300_IDLE_IOAT_CHANNEL=3Dy
>>>CONFIG_I7300_IDLE=3Dm
>>>
>>>#
>>># Bus options (PCI etc.)
>>>#
>>>CONFIG_PCI=3Dy
>>>CONFIG_PCI_DIRECT=3Dy
>>>CONFIG_PCI_MMCONFIG=3Dy
>>>CONFIG_PCI_XEN=3Dy
>>>CONFIG_PCI_DOMAINS=3Dy
>>>CONFIG_PCIEPORTBUS=3Dy
>>>CONFIG_HOTPLUG_PCI_PCIE=3Dy
>>>CONFIG_PCIEAER=3Dy
>>>CONFIG_PCIE_ECRC=3Dy
>>>CONFIG_PCIEAER_INJECT=3Dm
>>>CONFIG_PCIEASPM=3Dy
>>># CONFIG_PCIEASPM_DEBUG is not set
>>>CONFIG_PCIEASPM_DEFAULT=3Dy
>>># CONFIG_PCIEASPM_POWERSAVE is not set
>>># CONFIG_PCIEASPM_PERFORMANCE is not set
>>>CONFIG_PCIE_PME=3Dy
>>># CONFIG_PCIE_DPC is not set
>>>CONFIG_PCI_BUS_ADDR_T_64BIT=3Dy
>>>CONFIG_PCI_MSI=3Dy
>>>CONFIG_PCI_MSI_IRQ_DOMAIN=3Dy
>>># CONFIG_PCI_DEBUG is not set
>>># CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
>>>CONFIG_PCI_STUB=3Dy
>>># CONFIG_XEN_PCIDEV_FRONTEND is not set
>>>CONFIG_HT_IRQ=3Dy
>>>CONFIG_PCI_ATS=3Dy
>>>CONFIG_PCI_IOV=3Dy
>>>CONFIG_PCI_PRI=3Dy
>>>CONFIG_PCI_PASID=3Dy
>>>CONFIG_PCI_LABEL=3Dy
>>># CONFIG_PCI_HYPERV is not set
>>>CONFIG_HOTPLUG_PCI=3Dy
>>>CONFIG_HOTPLUG_PCI_ACPI=3Dy
>>>CONFIG_HOTPLUG_PCI_ACPI_IBM=3Dm
>>># CONFIG_HOTPLUG_PCI_CPCI is not set
>>>CONFIG_HOTPLUG_PCI_SHPC=3Dm
>>>
>>>#
>>># PCI host controller drivers
>>>#
>>># CONFIG_PCIE_DW_PLAT is not set
>>>CONFIG_ISA_DMA_API=3Dy
>>>CONFIG_AMD_NB=3Dy
>>>CONFIG_PCCARD=3Dy
>>># CONFIG_PCMCIA is not set
>>>CONFIG_CARDBUS=3Dy
>>>
>>>#
>>># PC-card bridges
>>>#
>>>CONFIG_YENTA=3Dm
>>>CONFIG_YENTA_O2=3Dy
>>>CONFIG_YENTA_RICOH=3Dy
>>>CONFIG_YENTA_TI=3Dy
>>>CONFIG_YENTA_ENE_TUNE=3Dy
>>>CONFIG_YENTA_TOSHIBA=3Dy
>>># CONFIG_RAPIDIO is not set
>>># CONFIG_X86_SYSFB is not set
>>>
>>>#
>>># Executable file formats / Emulations
>>>#
>>>CONFIG_BINFMT_ELF=3Dy
>>>CONFIG_COMPAT_BINFMT_ELF=3Dy
>>>CONFIG_ELFCORE=3Dy
>>>CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
>>>CONFIG_BINFMT_SCRIPT=3Dy
>>># CONFIG_HAVE_AOUT is not set
>>>CONFIG_BINFMT_MISC=3Dm
>>>CONFIG_COREDUMP=3Dy
>>>CONFIG_IA32_EMULATION=3Dy
>>># CONFIG_IA32_AOUT is not set
>>># CONFIG_X86_X32 is not set
>>>CONFIG_COMPAT=3Dy
>>>CONFIG_COMPAT_FOR_U64_ALIGNMENT=3Dy
>>>CONFIG_SYSVIPC_COMPAT=3Dy
>>>CONFIG_KEYS_COMPAT=3Dy
>>>CONFIG_X86_DEV_DMA_OPS=3Dy
>>>CONFIG_PMC_ATOM=3Dy
>>># CONFIG_VMD is not set
>>>CONFIG_NET=3Dy
>>>CONFIG_COMPAT_NETLINK_MESSAGES=3Dy
>>>CONFIG_NET_INGRESS=3Dy
>>>CONFIG_NET_EGRESS=3Dy
>>>
>>>#
>>># Networking options
>>>#
>>>CONFIG_PACKET=3Dy
>>>CONFIG_PACKET_DIAG=3Dm
>>>CONFIG_UNIX=3Dy
>>>CONFIG_UNIX_DIAG=3Dm
>>>CONFIG_XFRM=3Dy
>>>CONFIG_XFRM_ALGO=3Dy
>>>CONFIG_XFRM_USER=3Dy
>>>CONFIG_XFRM_SUB_POLICY=3Dy
>>>CONFIG_XFRM_MIGRATE=3Dy
>>>CONFIG_XFRM_STATISTICS=3Dy
>>>CONFIG_XFRM_IPCOMP=3Dm
>>>CONFIG_NET_KEY=3Dm
>>>CONFIG_NET_KEY_MIGRATE=3Dy
>>>CONFIG_INET=3Dy
>>>CONFIG_IP_MULTICAST=3Dy
>>>CONFIG_IP_ADVANCED_ROUTER=3Dy
>>>CONFIG_IP_FIB_TRIE_STATS=3Dy
>>>CONFIG_IP_MULTIPLE_TABLES=3Dy
>>>CONFIG_IP_ROUTE_MULTIPATH=3Dy
>>>CONFIG_IP_ROUTE_VERBOSE=3Dy
>>>CONFIG_IP_ROUTE_CLASSID=3Dy
>>>CONFIG_IP_PNP=3Dy
>>>CONFIG_IP_PNP_DHCP=3Dy
>>># CONFIG_IP_PNP_BOOTP is not set
>>># CONFIG_IP_PNP_RARP is not set
>>>CONFIG_NET_IPIP=3Dm
>>>CONFIG_NET_IPGRE_DEMUX=3Dm
>>>CONFIG_NET_IP_TUNNEL=3Dm
>>>CONFIG_NET_IPGRE=3Dm
>>>CONFIG_NET_IPGRE_BROADCAST=3Dy
>>>CONFIG_IP_MROUTE=3Dy
>>>CONFIG_IP_MROUTE_MULTIPLE_TABLES=3Dy
>>>CONFIG_IP_PIMSM_V1=3Dy
>>>CONFIG_IP_PIMSM_V2=3Dy
>>>CONFIG_SYN_COOKIES=3Dy
>>>CONFIG_NET_IPVTI=3Dm
>>>CONFIG_NET_UDP_TUNNEL=3Dm
>>># CONFIG_NET_FOU is not set
>>># CONFIG_NET_FOU_IP_TUNNELS is not set
>>>CONFIG_INET_AH=3Dm
>>>CONFIG_INET_ESP=3Dm
>>>CONFIG_INET_IPCOMP=3Dm
>>>CONFIG_INET_XFRM_TUNNEL=3Dm
>>>CONFIG_INET_TUNNEL=3Dm
>>>CONFIG_INET_XFRM_MODE_TRANSPORT=3Dm
>>>CONFIG_INET_XFRM_MODE_TUNNEL=3Dm
>>>CONFIG_INET_XFRM_MODE_BEET=3Dm
>>>CONFIG_INET_DIAG=3Dm
>>>CONFIG_INET_TCP_DIAG=3Dm
>>>CONFIG_INET_UDP_DIAG=3Dm
>>># CONFIG_INET_DIAG_DESTROY is not set
>>>CONFIG_TCP_CONG_ADVANCED=3Dy
>>>CONFIG_TCP_CONG_BIC=3Dm
>>>CONFIG_TCP_CONG_CUBIC=3Dy
>>>CONFIG_TCP_CONG_WESTWOOD=3Dm
>>>CONFIG_TCP_CONG_HTCP=3Dm
>>>CONFIG_TCP_CONG_HSTCP=3Dm
>>>CONFIG_TCP_CONG_HYBLA=3Dm
>>>CONFIG_TCP_CONG_VEGAS=3Dm
>>># CONFIG_TCP_CONG_NV is not set
>>>CONFIG_TCP_CONG_SCALABLE=3Dm
>>>CONFIG_TCP_CONG_LP=3Dm
>>>CONFIG_TCP_CONG_VENO=3Dm
>>>CONFIG_TCP_CONG_YEAH=3Dm
>>>CONFIG_TCP_CONG_ILLINOIS=3Dm
>>># CONFIG_TCP_CONG_DCTCP is not set
>>># CONFIG_TCP_CONG_CDG is not set
>>>CONFIG_DEFAULT_CUBIC=3Dy
>>># CONFIG_DEFAULT_RENO is not set
>>>CONFIG_DEFAULT_TCP_CONG=3D"cubic"
>>>CONFIG_TCP_MD5SIG=3Dy
>>>CONFIG_IPV6=3Dy
>>>CONFIG_IPV6_ROUTER_PREF=3Dy
>>>CONFIG_IPV6_ROUTE_INFO=3Dy
>>>CONFIG_IPV6_OPTIMISTIC_DAD=3Dy
>>>CONFIG_INET6_AH=3Dm
>>>CONFIG_INET6_ESP=3Dm
>>>CONFIG_INET6_IPCOMP=3Dm
>>>CONFIG_IPV6_MIP6=3Dm
>>># CONFIG_IPV6_ILA is not set
>>>CONFIG_INET6_XFRM_TUNNEL=3Dm
>>>CONFIG_INET6_TUNNEL=3Dm
>>>CONFIG_INET6_XFRM_MODE_TRANSPORT=3Dm
>>>CONFIG_INET6_XFRM_MODE_TUNNEL=3Dm
>>>CONFIG_INET6_XFRM_MODE_BEET=3Dm
>>>CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION=3Dm
>>># CONFIG_IPV6_VTI is not set
>>>CONFIG_IPV6_SIT=3Dm
>>>CONFIG_IPV6_SIT_6RD=3Dy
>>>CONFIG_IPV6_NDISC_NODETYPE=3Dy
>>>CONFIG_IPV6_TUNNEL=3Dm
>>># CONFIG_IPV6_GRE is not set
>>># CONFIG_IPV6_FOU is not set
>>># CONFIG_IPV6_FOU_TUNNEL is not set
>>>CONFIG_IPV6_MULTIPLE_TABLES=3Dy
>>># CONFIG_IPV6_SUBTREES is not set
>>>CONFIG_IPV6_MROUTE=3Dy
>>>CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=3Dy
>>>CONFIG_IPV6_PIMSM_V2=3Dy
>>>CONFIG_NETLABEL=3Dy
>>>CONFIG_NETWORK_SECMARK=3Dy
>>>CONFIG_NET_PTP_CLASSIFY=3Dy
>>>CONFIG_NETWORK_PHY_TIMESTAMPING=3Dy
>>>CONFIG_NETFILTER=3Dy
>>># CONFIG_NETFILTER_DEBUG is not set
>>>CONFIG_NETFILTER_ADVANCED=3Dy
>>>CONFIG_BRIDGE_NETFILTER=3Dm
>>>
>>>#
>>># Core Netfilter Configuration
>>>#
>>>CONFIG_NETFILTER_INGRESS=3Dy
>>>CONFIG_NETFILTER_NETLINK=3Dm
>>>CONFIG_NETFILTER_NETLINK_ACCT=3Dm
>>>CONFIG_NETFILTER_NETLINK_QUEUE=3Dm
>>>CONFIG_NETFILTER_NETLINK_LOG=3Dm
>>>CONFIG_NF_CONNTRACK=3Dm
>>>CONFIG_NF_LOG_COMMON=3Dm
>>>CONFIG_NF_CONNTRACK_MARK=3Dy
>>>CONFIG_NF_CONNTRACK_SECMARK=3Dy
>>>CONFIG_NF_CONNTRACK_ZONES=3Dy
>>>CONFIG_NF_CONNTRACK_PROCFS=3Dy
>>>CONFIG_NF_CONNTRACK_EVENTS=3Dy
>>># CONFIG_NF_CONNTRACK_TIMEOUT is not set
>>>CONFIG_NF_CONNTRACK_TIMESTAMP=3Dy
>>>CONFIG_NF_CONNTRACK_LABELS=3Dy
>>>CONFIG_NF_CT_PROTO_DCCP=3Dm
>>>CONFIG_NF_CT_PROTO_GRE=3Dm
>>>CONFIG_NF_CT_PROTO_SCTP=3Dm
>>>CONFIG_NF_CT_PROTO_UDPLITE=3Dm
>>>CONFIG_NF_CONNTRACK_AMANDA=3Dm
>>>CONFIG_NF_CONNTRACK_FTP=3Dm
>>>CONFIG_NF_CONNTRACK_H323=3Dm
>>>CONFIG_NF_CONNTRACK_IRC=3Dm
>>>CONFIG_NF_CONNTRACK_BROADCAST=3Dm
>>>CONFIG_NF_CONNTRACK_NETBIOS_NS=3Dm
>>>CONFIG_NF_CONNTRACK_SNMP=3Dm
>>>CONFIG_NF_CONNTRACK_PPTP=3Dm
>>>CONFIG_NF_CONNTRACK_SANE=3Dm
>>>CONFIG_NF_CONNTRACK_SIP=3Dm
>>>CONFIG_NF_CONNTRACK_TFTP=3Dm
>>>CONFIG_NF_CT_NETLINK=3Dm
>>># CONFIG_NF_CT_NETLINK_TIMEOUT is not set
>>># CONFIG_NETFILTER_NETLINK_GLUE_CT is not set
>>>CONFIG_NF_NAT=3Dm
>>>CONFIG_NF_NAT_NEEDED=3Dy
>>>CONFIG_NF_NAT_PROTO_DCCP=3Dm
>>>CONFIG_NF_NAT_PROTO_UDPLITE=3Dm
>>>CONFIG_NF_NAT_PROTO_SCTP=3Dm
>>>CONFIG_NF_NAT_AMANDA=3Dm
>>>CONFIG_NF_NAT_FTP=3Dm
>>>CONFIG_NF_NAT_IRC=3Dm
>>>CONFIG_NF_NAT_SIP=3Dm
>>>CONFIG_NF_NAT_TFTP=3Dm
>>>CONFIG_NF_NAT_REDIRECT=3Dm
>>>CONFIG_NETFILTER_SYNPROXY=3Dm
>>>CONFIG_NF_TABLES=3Dm
>>># CONFIG_NF_TABLES_INET is not set
>>># CONFIG_NF_TABLES_NETDEV is not set
>>>CONFIG_NFT_EXTHDR=3Dm
>>>CONFIG_NFT_META=3Dm
>>>CONFIG_NFT_CT=3Dm
>>>CONFIG_NFT_RBTREE=3Dm
>>>CONFIG_NFT_HASH=3Dm
>>>CONFIG_NFT_COUNTER=3Dm
>>>CONFIG_NFT_LOG=3Dm
>>>CONFIG_NFT_LIMIT=3Dm
>>># CONFIG_NFT_MASQ is not set
>>># CONFIG_NFT_REDIR is not set
>>>CONFIG_NFT_NAT=3Dm
>>># CONFIG_NFT_QUEUE is not set
>>># CONFIG_NFT_REJECT is not set
>>>CONFIG_NFT_COMPAT=3Dm
>>>CONFIG_NETFILTER_XTABLES=3Dy
>>>
>>>#
>>># Xtables combined modules
>>>#
>>>CONFIG_NETFILTER_XT_MARK=3Dm
>>>CONFIG_NETFILTER_XT_CONNMARK=3Dm
>>>CONFIG_NETFILTER_XT_SET=3Dm
>>>
>>>#
>>># Xtables targets
>>>#
>>>CONFIG_NETFILTER_XT_TARGET_AUDIT=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_CHECKSUM=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_CLASSIFY=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_CONNMARK=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_CT=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_DSCP=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_HL=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_HMARK=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_IDLETIMER=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_LED=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_LOG=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_MARK=3Dm
>>>CONFIG_NETFILTER_XT_NAT=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_NETMAP=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_NFLOG=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_NFQUEUE=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_NOTRACK=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_RATEEST=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_REDIRECT=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_TEE=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_TPROXY=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_TRACE=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_SECMARK=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_TCPMSS=3Dm
>>>CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=3Dm
>>>
>>>#
>>># Xtables matches
>>>#
>>>CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_BPF=3Dm
>>># CONFIG_NETFILTER_XT_MATCH_CGROUP is not set
>>>CONFIG_NETFILTER_XT_MATCH_CLUSTER=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_COMMENT=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_CONNBYTES=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_CONNLABEL=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_CONNMARK=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_CPU=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_DCCP=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_DEVGROUP=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_DSCP=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_ECN=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_ESP=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_HELPER=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_HL=3Dm
>>># CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
>>>CONFIG_NETFILTER_XT_MATCH_IPRANGE=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_IPVS=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_L2TP=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_LENGTH=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_LIMIT=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_MAC=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_MARK=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_MULTIPORT=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_NFACCT=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_OSF=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_OWNER=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_POLICY=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_PHYSDEV=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_PKTTYPE=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_QUOTA=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_RATEEST=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_REALM=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_RECENT=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_SCTP=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_SOCKET=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_STATE=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_STATISTIC=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_STRING=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_TCPMSS=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_TIME=3Dm
>>>CONFIG_NETFILTER_XT_MATCH_U32=3Dm
>>>CONFIG_IP_SET=3Dm
>>>CONFIG_IP_SET_MAX=3D256
>>>CONFIG_IP_SET_BITMAP_IP=3Dm
>>>CONFIG_IP_SET_BITMAP_IPMAC=3Dm
>>>CONFIG_IP_SET_BITMAP_PORT=3Dm
>>>CONFIG_IP_SET_HASH_IP=3Dm
>>># CONFIG_IP_SET_HASH_IPMARK is not set
>>>CONFIG_IP_SET_HASH_IPPORT=3Dm
>>>CONFIG_IP_SET_HASH_IPPORTIP=3Dm
>>>CONFIG_IP_SET_HASH_IPPORTNET=3Dm
>>># CONFIG_IP_SET_HASH_MAC is not set
>>># CONFIG_IP_SET_HASH_NETPORTNET is not set
>>>CONFIG_IP_SET_HASH_NET=3Dm
>>># CONFIG_IP_SET_HASH_NETNET is not set
>>>CONFIG_IP_SET_HASH_NETPORT=3Dm
>>>CONFIG_IP_SET_HASH_NETIFACE=3Dm
>>>CONFIG_IP_SET_LIST_SET=3Dm
>>>CONFIG_IP_VS=3Dm
>>>CONFIG_IP_VS_IPV6=3Dy
>>># CONFIG_IP_VS_DEBUG is not set
>>>CONFIG_IP_VS_TAB_BITS=3D12
>>>
>>>#
>>># IPVS transport protocol load balancing support
>>>#
>>>CONFIG_IP_VS_PROTO_TCP=3Dy
>>>CONFIG_IP_VS_PROTO_UDP=3Dy
>>>CONFIG_IP_VS_PROTO_AH_ESP=3Dy
>>>CONFIG_IP_VS_PROTO_ESP=3Dy
>>>CONFIG_IP_VS_PROTO_AH=3Dy
>>>CONFIG_IP_VS_PROTO_SCTP=3Dy
>>>
>>>#
>>># IPVS scheduler
>>>#
>>>CONFIG_IP_VS_RR=3Dm
>>>CONFIG_IP_VS_WRR=3Dm
>>>CONFIG_IP_VS_LC=3Dm
>>>CONFIG_IP_VS_WLC=3Dm
>>># CONFIG_IP_VS_FO is not set
>>># CONFIG_IP_VS_OVF is not set
>>>CONFIG_IP_VS_LBLC=3Dm
>>>CONFIG_IP_VS_LBLCR=3Dm
>>>CONFIG_IP_VS_DH=3Dm
>>>CONFIG_IP_VS_SH=3Dm
>>>CONFIG_IP_VS_SED=3Dm
>>>CONFIG_IP_VS_NQ=3Dm
>>>
>>>#
>>># IPVS SH scheduler
>>>#
>>>CONFIG_IP_VS_SH_TAB_BITS=3D8
>>>
>>>#
>>># IPVS application helper
>>>#
>>>CONFIG_IP_VS_FTP=3Dm
>>>CONFIG_IP_VS_NFCT=3Dy
>>>CONFIG_IP_VS_PE_SIP=3Dm
>>>
>>>#
>>># IP: Netfilter Configuration
>>>#
>>>CONFIG_NF_DEFRAG_IPV4=3Dm
>>>CONFIG_NF_CONNTRACK_IPV4=3Dm
>>># CONFIG_NF_CONNTRACK_PROC_COMPAT is not set
>>>CONFIG_NF_TABLES_IPV4=3Dm
>>>CONFIG_NFT_CHAIN_ROUTE_IPV4=3Dm
>>># CONFIG_NFT_REJECT_IPV4 is not set
>>># CONFIG_NFT_DUP_IPV4 is not set
>>># CONFIG_NF_TABLES_ARP is not set
>>>CONFIG_NF_DUP_IPV4=3Dm
>>># CONFIG_NF_LOG_ARP is not set
>>>CONFIG_NF_LOG_IPV4=3Dm
>>>CONFIG_NF_REJECT_IPV4=3Dm
>>>CONFIG_NF_NAT_IPV4=3Dm
>>>CONFIG_NFT_CHAIN_NAT_IPV4=3Dm
>>>CONFIG_NF_NAT_MASQUERADE_IPV4=3Dm
>>>CONFIG_NF_NAT_SNMP_BASIC=3Dm
>>>CONFIG_NF_NAT_PROTO_GRE=3Dm
>>>CONFIG_NF_NAT_PPTP=3Dm
>>>CONFIG_NF_NAT_H323=3Dm
>>>CONFIG_IP_NF_IPTABLES=3Dm
>>>CONFIG_IP_NF_MATCH_AH=3Dm
>>>CONFIG_IP_NF_MATCH_ECN=3Dm
>>>CONFIG_IP_NF_MATCH_RPFILTER=3Dm
>>>CONFIG_IP_NF_MATCH_TTL=3Dm
>>>CONFIG_IP_NF_FILTER=3Dm
>>>CONFIG_IP_NF_TARGET_REJECT=3Dm
>>>CONFIG_IP_NF_TARGET_SYNPROXY=3Dm
>>>CONFIG_IP_NF_NAT=3Dm
>>>CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
>>>CONFIG_IP_NF_TARGET_NETMAP=3Dm
>>>CONFIG_IP_NF_TARGET_REDIRECT=3Dm
>>>CONFIG_IP_NF_MANGLE=3Dm
>>>CONFIG_IP_NF_TARGET_CLUSTERIP=3Dm
>>>CONFIG_IP_NF_TARGET_ECN=3Dm
>>>CONFIG_IP_NF_TARGET_TTL=3Dm
>>>CONFIG_IP_NF_RAW=3Dm
>>>CONFIG_IP_NF_SECURITY=3Dm
>>>CONFIG_IP_NF_ARPTABLES=3Dm
>>>CONFIG_IP_NF_ARPFILTER=3Dm
>>>CONFIG_IP_NF_ARP_MANGLE=3Dm
>>>
>>>#
>>># IPv6: Netfilter Configuration
>>>#
>>>CONFIG_NF_DEFRAG_IPV6=3Dm
>>>CONFIG_NF_CONNTRACK_IPV6=3Dm
>>>CONFIG_NF_TABLES_IPV6=3Dm
>>>CONFIG_NFT_CHAIN_ROUTE_IPV6=3Dm
>>># CONFIG_NFT_REJECT_IPV6 is not set
>>># CONFIG_NFT_DUP_IPV6 is not set
>>>CONFIG_NF_DUP_IPV6=3Dm
>>>CONFIG_NF_REJECT_IPV6=3Dm
>>>CONFIG_NF_LOG_IPV6=3Dm
>>>CONFIG_NF_NAT_IPV6=3Dm
>>>CONFIG_NFT_CHAIN_NAT_IPV6=3Dm
>>># CONFIG_NF_NAT_MASQUERADE_IPV6 is not set
>>>CONFIG_IP6_NF_IPTABLES=3Dm
>>>CONFIG_IP6_NF_MATCH_AH=3Dm
>>>CONFIG_IP6_NF_MATCH_EUI64=3Dm
>>>CONFIG_IP6_NF_MATCH_FRAG=3Dm
>>>CONFIG_IP6_NF_MATCH_OPTS=3Dm
>>>CONFIG_IP6_NF_MATCH_HL=3Dm
>>>CONFIG_IP6_NF_MATCH_IPV6HEADER=3Dm
>>>CONFIG_IP6_NF_MATCH_MH=3Dm
>>>CONFIG_IP6_NF_MATCH_RPFILTER=3Dm
>>>CONFIG_IP6_NF_MATCH_RT=3Dm
>>>CONFIG_IP6_NF_TARGET_HL=3Dm
>>>CONFIG_IP6_NF_FILTER=3Dm
>>>CONFIG_IP6_NF_TARGET_REJECT=3Dm
>>>CONFIG_IP6_NF_TARGET_SYNPROXY=3Dm
>>>CONFIG_IP6_NF_MANGLE=3Dm
>>>CONFIG_IP6_NF_RAW=3Dm
>>>CONFIG_IP6_NF_SECURITY=3Dm
>>># CONFIG_IP6_NF_NAT is not set
>>>CONFIG_NF_TABLES_BRIDGE=3Dm
>>># CONFIG_NFT_BRIDGE_META is not set
>>># CONFIG_NF_LOG_BRIDGE is not set
>>>CONFIG_BRIDGE_NF_EBTABLES=3Dm
>>>CONFIG_BRIDGE_EBT_BROUTE=3Dm
>>>CONFIG_BRIDGE_EBT_T_FILTER=3Dm
>>>CONFIG_BRIDGE_EBT_T_NAT=3Dm
>>>CONFIG_BRIDGE_EBT_802_3=3Dm
>>>CONFIG_BRIDGE_EBT_AMONG=3Dm
>>>CONFIG_BRIDGE_EBT_ARP=3Dm
>>>CONFIG_BRIDGE_EBT_IP=3Dm
>>>CONFIG_BRIDGE_EBT_IP6=3Dm
>>>CONFIG_BRIDGE_EBT_LIMIT=3Dm
>>>CONFIG_BRIDGE_EBT_MARK=3Dm
>>>CONFIG_BRIDGE_EBT_PKTTYPE=3Dm
>>>CONFIG_BRIDGE_EBT_STP=3Dm
>>>CONFIG_BRIDGE_EBT_VLAN=3Dm
>>>CONFIG_BRIDGE_EBT_ARPREPLY=3Dm
>>>CONFIG_BRIDGE_EBT_DNAT=3Dm
>>>CONFIG_BRIDGE_EBT_MARK_T=3Dm
>>>CONFIG_BRIDGE_EBT_REDIRECT=3Dm
>>>CONFIG_BRIDGE_EBT_SNAT=3Dm
>>>CONFIG_BRIDGE_EBT_LOG=3Dm
>>>CONFIG_BRIDGE_EBT_NFLOG=3Dm
>>>CONFIG_IP_DCCP=3Dm
>>>CONFIG_INET_DCCP_DIAG=3Dm
>>>
>>>#
>>># DCCP CCIDs Configuration
>>>#
>>># CONFIG_IP_DCCP_CCID2_DEBUG is not set
>>>CONFIG_IP_DCCP_CCID3=3Dy
>>># CONFIG_IP_DCCP_CCID3_DEBUG is not set
>>>CONFIG_IP_DCCP_TFRC_LIB=3Dy
>>>
>>>#
>>># DCCP Kernel Hacking
>>>#
>>># CONFIG_IP_DCCP_DEBUG is not set
>>># CONFIG_NET_DCCPPROBE is not set
>>>CONFIG_IP_SCTP=3Dm
>>>CONFIG_NET_SCTPPROBE=3Dm
>>># CONFIG_SCTP_DBG_OBJCNT is not set
>>># CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
>>>CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=3Dy
>>># CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
>>>CONFIG_SCTP_COOKIE_HMAC_MD5=3Dy
>>>CONFIG_SCTP_COOKIE_HMAC_SHA1=3Dy
>>>CONFIG_INET_SCTP_DIAG=3Dm
>>># CONFIG_RDS is not set
>>>CONFIG_TIPC=3Dm
>>>CONFIG_TIPC_MEDIA_UDP=3Dy
>>>CONFIG_ATM=3Dm
>>>CONFIG_ATM_CLIP=3Dm
>>># CONFIG_ATM_CLIP_NO_ICMP is not set
>>>CONFIG_ATM_LANE=3Dm
>>># CONFIG_ATM_MPOA is not set
>>>CONFIG_ATM_BR2684=3Dm
>>># CONFIG_ATM_BR2684_IPFILTER is not set
>>>CONFIG_L2TP=3Dm
>>>CONFIG_L2TP_DEBUGFS=3Dm
>>>CONFIG_L2TP_V3=3Dy
>>>CONFIG_L2TP_IP=3Dm
>>>CONFIG_L2TP_ETH=3Dm
>>>CONFIG_STP=3Dm
>>>CONFIG_GARP=3Dm
>>>CONFIG_MRP=3Dm
>>>CONFIG_BRIDGE=3Dm
>>>CONFIG_BRIDGE_IGMP_SNOOPING=3Dy
>>>CONFIG_BRIDGE_VLAN_FILTERING=3Dy
>>>CONFIG_HAVE_NET_DSA=3Dy
>>>CONFIG_VLAN_8021Q=3Dm
>>>CONFIG_VLAN_8021Q_GVRP=3Dy
>>>CONFIG_VLAN_8021Q_MVRP=3Dy
>>># CONFIG_DECNET is not set
>>>CONFIG_LLC=3Dm
>>># CONFIG_LLC2 is not set
>>># CONFIG_IPX is not set
>>># CONFIG_ATALK is not set
>>># CONFIG_X25 is not set
>>># CONFIG_LAPB is not set
>>># CONFIG_PHONET is not set
>>># CONFIG_6LOWPAN is not set
>>>CONFIG_IEEE802154=3Dm
>>># CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
>>>CONFIG_IEEE802154_SOCKET=3Dm
>>>CONFIG_MAC802154=3Dm
>>>CONFIG_NET_SCHED=3Dy
>>>
>>>#
>>># Queueing/Scheduling
>>>#
>>>CONFIG_NET_SCH_CBQ=3Dm
>>>CONFIG_NET_SCH_HTB=3Dm
>>>CONFIG_NET_SCH_HFSC=3Dm
>>>CONFIG_NET_SCH_ATM=3Dm
>>>CONFIG_NET_SCH_PRIO=3Dm
>>>CONFIG_NET_SCH_MULTIQ=3Dm
>>>CONFIG_NET_SCH_RED=3Dm
>>>CONFIG_NET_SCH_SFB=3Dm
>>>CONFIG_NET_SCH_SFQ=3Dm
>>>CONFIG_NET_SCH_TEQL=3Dm
>>>CONFIG_NET_SCH_TBF=3Dm
>>>CONFIG_NET_SCH_GRED=3Dm
>>>CONFIG_NET_SCH_DSMARK=3Dm
>>>CONFIG_NET_SCH_NETEM=3Dm
>>>CONFIG_NET_SCH_DRR=3Dm
>>>CONFIG_NET_SCH_MQPRIO=3Dm
>>>CONFIG_NET_SCH_CHOKE=3Dm
>>>CONFIG_NET_SCH_QFQ=3Dm
>>>CONFIG_NET_SCH_CODEL=3Dm
>>>CONFIG_NET_SCH_FQ_CODEL=3Dm
>>># CONFIG_NET_SCH_FQ is not set
>>># CONFIG_NET_SCH_HHF is not set
>>># CONFIG_NET_SCH_PIE is not set
>>>CONFIG_NET_SCH_INGRESS=3Dm
>>>CONFIG_NET_SCH_PLUG=3Dm
>>>
>>>#
>>># Classification
>>>#
>>>CONFIG_NET_CLS=3Dy
>>>CONFIG_NET_CLS_BASIC=3Dm
>>>CONFIG_NET_CLS_TCINDEX=3Dm
>>>CONFIG_NET_CLS_ROUTE4=3Dm
>>>CONFIG_NET_CLS_FW=3Dm
>>>CONFIG_NET_CLS_U32=3Dm
>>>CONFIG_CLS_U32_PERF=3Dy
>>>CONFIG_CLS_U32_MARK=3Dy
>>>CONFIG_NET_CLS_RSVP=3Dm
>>>CONFIG_NET_CLS_RSVP6=3Dm
>>>CONFIG_NET_CLS_FLOW=3Dm
>>>CONFIG_NET_CLS_CGROUP=3Dy
>>># CONFIG_NET_CLS_BPF is not set
>>># CONFIG_NET_CLS_FLOWER is not set
>>># CONFIG_NET_CLS_MATCHALL is not set
>>>CONFIG_NET_EMATCH=3Dy
>>>CONFIG_NET_EMATCH_STACK=3D32
>>>CONFIG_NET_EMATCH_CMP=3Dm
>>>CONFIG_NET_EMATCH_NBYTE=3Dm
>>>CONFIG_NET_EMATCH_U32=3Dm
>>>CONFIG_NET_EMATCH_META=3Dm
>>>CONFIG_NET_EMATCH_TEXT=3Dm
>>>CONFIG_NET_EMATCH_IPSET=3Dm
>>>CONFIG_NET_CLS_ACT=3Dy
>>>CONFIG_NET_ACT_POLICE=3Dm
>>>CONFIG_NET_ACT_GACT=3Dm
>>>CONFIG_GACT_PROB=3Dy
>>>CONFIG_NET_ACT_MIRRED=3Dm
>>>CONFIG_NET_ACT_IPT=3Dm
>>>CONFIG_NET_ACT_NAT=3Dm
>>>CONFIG_NET_ACT_PEDIT=3Dm
>>>CONFIG_NET_ACT_SIMP=3Dm
>>>CONFIG_NET_ACT_SKBEDIT=3Dm
>>>CONFIG_NET_ACT_CSUM=3Dm
>>># CONFIG_NET_ACT_VLAN is not set
>>># CONFIG_NET_ACT_BPF is not set
>>># CONFIG_NET_ACT_CONNMARK is not set
>>># CONFIG_NET_ACT_IFE is not set
>>>CONFIG_NET_CLS_IND=3Dy
>>>CONFIG_NET_SCH_FIFO=3Dy
>>>CONFIG_DCB=3Dy
>>>CONFIG_DNS_RESOLVER=3Dm
>>># CONFIG_BATMAN_ADV is not set
>>>CONFIG_OPENVSWITCH=3Dm
>>>CONFIG_OPENVSWITCH_GRE=3Dm
>>>CONFIG_OPENVSWITCH_VXLAN=3Dm
>>>CONFIG_VSOCKETS=3Dm
>>>CONFIG_VMWARE_VMCI_VSOCKETS=3Dm
>>># CONFIG_VIRTIO_VSOCKETS is not set
>>>CONFIG_NETLINK_DIAG=3Dm
>>>CONFIG_MPLS=3Dy
>>>CONFIG_NET_MPLS_GSO=3Dm
>>># CONFIG_MPLS_ROUTING is not set
>>># CONFIG_HSR is not set
>>># CONFIG_NET_SWITCHDEV is not set
>>># CONFIG_NET_L3_MASTER_DEV is not set
>>># CONFIG_NET_NCSI is not set
>>>CONFIG_RPS=3Dy
>>>CONFIG_RFS_ACCEL=3Dy
>>>CONFIG_XPS=3Dy
>>>CONFIG_SOCK_CGROUP_DATA=3Dy
>>># CONFIG_CGROUP_NET_PRIO is not set
>>>CONFIG_CGROUP_NET_CLASSID=3Dy
>>>CONFIG_NET_RX_BUSY_POLL=3Dy
>>>CONFIG_BQL=3Dy
>>>CONFIG_BPF_JIT=3Dy
>>>CONFIG_NET_FLOW_LIMIT=3Dy
>>>
>>>#
>>># Network testing
>>>#
>>>CONFIG_NET_PKTGEN=3Dm
>>># CONFIG_NET_TCPPROBE is not set
>>>CONFIG_NET_DROP_MONITOR=3Dy
>>># CONFIG_HAMRADIO is not set
>>># CONFIG_CAN is not set
>>># CONFIG_IRDA is not set
>>># CONFIG_BT is not set
>>># CONFIG_AF_RXRPC is not set
>>># CONFIG_AF_KCM is not set
>>>CONFIG_FIB_RULES=3Dy
>>>CONFIG_WIRELESS=3Dy
>>>CONFIG_WIRELESS_EXT=3Dy
>>>CONFIG_WEXT_CORE=3Dy
>>>CONFIG_WEXT_PROC=3Dy
>>>CONFIG_WEXT_PRIV=3Dy
>>>CONFIG_CFG80211=3Dm
>>># CONFIG_NL80211_TESTMODE is not set
>>># CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
>>>CONFIG_CFG80211_DEFAULT_PS=3Dy
>>># CONFIG_CFG80211_DEBUGFS is not set
>>># CONFIG_CFG80211_INTERNAL_REGDB is not set
>>>CONFIG_CFG80211_CRDA_SUPPORT=3Dy
>>>CONFIG_CFG80211_WEXT=3Dy
>>>CONFIG_LIB80211=3Dm
>>># CONFIG_LIB80211_DEBUG is not set
>>>CONFIG_MAC80211=3Dm
>>>CONFIG_MAC80211_HAS_RC=3Dy
>>>CONFIG_MAC80211_RC_MINSTREL=3Dy
>>>CONFIG_MAC80211_RC_MINSTREL_HT=3Dy
>>># CONFIG_MAC80211_RC_MINSTREL_VHT is not set
>>>CONFIG_MAC80211_RC_DEFAULT_MINSTREL=3Dy
>>>CONFIG_MAC80211_RC_DEFAULT=3D"minstrel_ht"
>>>CONFIG_MAC80211_MESH=3Dy
>>>CONFIG_MAC80211_LEDS=3Dy
>>># CONFIG_MAC80211_DEBUGFS is not set
>>># CONFIG_MAC80211_MESSAGE_TRACING is not set
>>># CONFIG_MAC80211_DEBUG_MENU is not set
>>>CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
>>># CONFIG_WIMAX is not set
>>>CONFIG_RFKILL=3Dm
>>>CONFIG_RFKILL_LEDS=3Dy
>>>CONFIG_RFKILL_INPUT=3Dy
>>># CONFIG_RFKILL_GPIO is not set
>>>CONFIG_NET_9P=3Dy
>>>CONFIG_NET_9P_VIRTIO=3Dy
>>># CONFIG_NET_9P_DEBUG is not set
>>># CONFIG_CAIF is not set
>>># CONFIG_CEPH_LIB is not set
>>># CONFIG_NFC is not set
>>># CONFIG_LWTUNNEL is not set
>>>CONFIG_DST_CACHE=3Dy
>>># CONFIG_NET_DEVLINK is not set
>>>CONFIG_MAY_USE_DEVLINK=3Dy
>>>CONFIG_HAVE_EBPF_JIT=3Dy
>>>
>>>#
>>># Device Drivers
>>>#
>>>
>>>#
>>># Generic Driver Options
>>>#
>>>CONFIG_UEVENT_HELPER=3Dy
>>>CONFIG_UEVENT_HELPER_PATH=3D""
>>>CONFIG_DEVTMPFS=3Dy
>>>CONFIG_DEVTMPFS_MOUNT=3Dy
>>>CONFIG_STANDALONE=3Dy
>>>CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
>>>CONFIG_FW_LOADER=3Dy
>>># CONFIG_FIRMWARE_IN_KERNEL is not set
>>>CONFIG_EXTRA_FIRMWARE=3D""
>>>CONFIG_FW_LOADER_USER_HELPER=3Dy
>>># CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
>>>CONFIG_ALLOW_DEV_COREDUMP=3Dy
>>># CONFIG_DEBUG_DRIVER is not set
>>># CONFIG_DEBUG_DEVRES is not set
>>>CONFIG_SYS_HYPERVISOR=3Dy
>>># CONFIG_GENERIC_CPU_DEVICES is not set
>>>CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
>>>CONFIG_REGMAP=3Dy
>>>CONFIG_REGMAP_I2C=3Dy
>>>CONFIG_REGMAP_SPI=3Dy
>>>CONFIG_DMA_SHARED_BUFFER=3Dy
>>># CONFIG_FENCE_TRACE is not set
>>>CONFIG_DMA_CMA=3Dy
>>>
>>>#
>>># Default contiguous memory area size:
>>>#
>>>CONFIG_CMA_SIZE_MBYTES=3D200
>>>CONFIG_CMA_SIZE_SEL_MBYTES=3Dy
>>># CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
>>># CONFIG_CMA_SIZE_SEL_MIN is not set
>>># CONFIG_CMA_SIZE_SEL_MAX is not set
>>>CONFIG_CMA_ALIGNMENT=3D8
>>>
>>>#
>>># Bus devices
>>>#
>>>CONFIG_CONNECTOR=3Dy
>>>CONFIG_PROC_EVENTS=3Dy
>>>CONFIG_MTD=3Dm
>>># CONFIG_MTD_TESTS is not set
>>># CONFIG_MTD_REDBOOT_PARTS is not set
>>># CONFIG_MTD_CMDLINE_PARTS is not set
>>># CONFIG_MTD_AR7_PARTS is not set
>>>
>>>#
>>># User Modules And Translation Layers
>>>#
>>>CONFIG_MTD_BLKDEVS=3Dm
>>>CONFIG_MTD_BLOCK=3Dm
>>># CONFIG_MTD_BLOCK_RO is not set
>>># CONFIG_FTL is not set
>>># CONFIG_NFTL is not set
>>># CONFIG_INFTL is not set
>>># CONFIG_RFD_FTL is not set
>>># CONFIG_SSFDC is not set
>>># CONFIG_SM_FTL is not set
>>># CONFIG_MTD_OOPS is not set
>>># CONFIG_MTD_SWAP is not set
>>># CONFIG_MTD_PARTITIONED_MASTER is not set
>>>
>>>#
>>># RAM/ROM/Flash chip drivers
>>>#
>>># CONFIG_MTD_CFI is not set
>>># CONFIG_MTD_JEDECPROBE is not set
>>>CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
>>>CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
>>>CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
>>># CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
>>># CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
>>># CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
>>>CONFIG_MTD_CFI_I1=3Dy
>>>CONFIG_MTD_CFI_I2=3Dy
>>># CONFIG_MTD_CFI_I4 is not set
>>># CONFIG_MTD_CFI_I8 is not set
>>># CONFIG_MTD_RAM is not set
>>># CONFIG_MTD_ROM is not set
>>># CONFIG_MTD_ABSENT is not set
>>>
>>>#
>>># Mapping drivers for chip access
>>>#
>>># CONFIG_MTD_COMPLEX_MAPPINGS is not set
>>># CONFIG_MTD_INTEL_VR_NOR is not set
>>># CONFIG_MTD_PLATRAM is not set
>>>
>>>#
>>># Self-contained MTD device drivers
>>>#
>>># CONFIG_MTD_PMC551 is not set
>>># CONFIG_MTD_DATAFLASH is not set
>>># CONFIG_MTD_SST25L is not set
>>># CONFIG_MTD_SLRAM is not set
>>># CONFIG_MTD_PHRAM is not set
>>># CONFIG_MTD_MTDRAM is not set
>>># CONFIG_MTD_BLOCK2MTD is not set
>>>
>>>#
>>># Disk-On-Chip Device Drivers
>>>#
>>># CONFIG_MTD_DOCG3 is not set
>>># CONFIG_MTD_NAND is not set
>>># CONFIG_MTD_ONENAND is not set
>>>
>>>#
>>># LPDDR & LPDDR2 PCM memory drivers
>>>#
>>># CONFIG_MTD_LPDDR is not set
>>># CONFIG_MTD_SPI_NOR is not set
>>>CONFIG_MTD_UBI=3Dm
>>>CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
>>>CONFIG_MTD_UBI_BEB_LIMIT=3D20
>>># CONFIG_MTD_UBI_FASTMAP is not set
>>># CONFIG_MTD_UBI_GLUEBI is not set
>>># CONFIG_MTD_UBI_BLOCK is not set
>>># CONFIG_OF is not set
>>>CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
>>>CONFIG_PARPORT=3Dm
>>>CONFIG_PARPORT_PC=3Dm
>>>CONFIG_PARPORT_SERIAL=3Dm
>>># CONFIG_PARPORT_PC_FIFO is not set
>>># CONFIG_PARPORT_PC_SUPERIO is not set
>>># CONFIG_PARPORT_GSC is not set
>>># CONFIG_PARPORT_AX88796 is not set
>>>CONFIG_PARPORT_1284=3Dy
>>>CONFIG_PARPORT_NOT_PC=3Dy
>>>CONFIG_PNP=3Dy
>>># CONFIG_PNP_DEBUG_MESSAGES is not set
>>>
>>>#
>>># Protocols
>>>#
>>>CONFIG_PNPACPI=3Dy
>>>CONFIG_BLK_DEV=3Dy
>>>CONFIG_BLK_DEV_NULL_BLK=3Dm
>>>CONFIG_BLK_DEV_FD=3Dm
>>># CONFIG_PARIDE is not set
>>>CONFIG_BLK_DEV_PCIESSD_MTIP32XX=3Dm
>>># CONFIG_ZRAM is not set
>>># CONFIG_BLK_CPQ_CISS_DA is not set
>>># CONFIG_BLK_DEV_DAC960 is not set
>>># CONFIG_BLK_DEV_UMEM is not set
>>># CONFIG_BLK_DEV_COW_COMMON is not set
>>>CONFIG_BLK_DEV_LOOP=3Dm
>>>CONFIG_BLK_DEV_LOOP_MIN_COUNT=3D0
>>># CONFIG_BLK_DEV_CRYPTOLOOP is not set
>>># CONFIG_BLK_DEV_DRBD is not set
>>># CONFIG_BLK_DEV_NBD is not set
>>># CONFIG_BLK_DEV_SKD is not set
>>>CONFIG_BLK_DEV_OSD=3Dm
>>>CONFIG_BLK_DEV_SX8=3Dm
>>>CONFIG_BLK_DEV_RAM=3Dm
>>>CONFIG_BLK_DEV_RAM_COUNT=3D16
>>>CONFIG_BLK_DEV_RAM_SIZE=3D16384
>>># CONFIG_BLK_DEV_RAM_DAX is not set
>>>CONFIG_CDROM_PKTCDVD=3Dm
>>>CONFIG_CDROM_PKTCDVD_BUFFERS=3D8
>>># CONFIG_CDROM_PKTCDVD_WCACHE is not set
>>>CONFIG_ATA_OVER_ETH=3Dm
>>>CONFIG_XEN_BLKDEV_FRONTEND=3Dm
>>># CONFIG_XEN_BLKDEV_BACKEND is not set
>>>CONFIG_VIRTIO_BLK=3Dy
>>># CONFIG_BLK_DEV_HD is not set
>>># CONFIG_BLK_DEV_RBD is not set
>>>CONFIG_BLK_DEV_RSXX=3Dm
>>>CONFIG_NVME_CORE=3Dm
>>>CONFIG_BLK_DEV_NVME=3Dm
>>># CONFIG_BLK_DEV_NVME_SCSI is not set
>>># CONFIG_NVME_TARGET is not set
>>>
>>>#
>>># Misc devices
>>>#
>>>CONFIG_SENSORS_LIS3LV02D=3Dm
>>># CONFIG_AD525X_DPOT is not set
>>># CONFIG_DUMMY_IRQ is not set
>>># CONFIG_IBM_ASM is not set
>>># CONFIG_PHANTOM is not set
>>>CONFIG_SGI_IOC4=3Dm
>>>CONFIG_TIFM_CORE=3Dm
>>>CONFIG_TIFM_7XX1=3Dm
>>># CONFIG_ICS932S401 is not set
>>>CONFIG_ENCLOSURE_SERVICES=3Dm
>>>CONFIG_SGI_XP=3Dm
>>>CONFIG_HP_ILO=3Dm
>>>CONFIG_SGI_GRU=3Dm
>>># CONFIG_SGI_GRU_DEBUG is not set
>>>CONFIG_APDS9802ALS=3Dm
>>>CONFIG_ISL29003=3Dm
>>>CONFIG_ISL29020=3Dm
>>>CONFIG_SENSORS_TSL2550=3Dm
>>># CONFIG_SENSORS_BH1780 is not set
>>>CONFIG_SENSORS_BH1770=3Dm
>>>CONFIG_SENSORS_APDS990X=3Dm
>>># CONFIG_HMC6352 is not set
>>># CONFIG_DS1682 is not set
>>># CONFIG_TI_DAC7512 is not set
>>>CONFIG_VMWARE_BALLOON=3Dm
>>># CONFIG_BMP085_I2C is not set
>>># CONFIG_BMP085_SPI is not set
>>># CONFIG_USB_SWITCH_FSA9480 is not set
>>># CONFIG_LATTICE_ECP3_CONFIG is not set
>>># CONFIG_SRAM is not set
>>># CONFIG_PANEL is not set
>>># CONFIG_C2PORT is not set
>>>
>>>#
>>># EEPROM support
>>>#
>>>CONFIG_EEPROM_AT24=3Dm
>>># CONFIG_EEPROM_AT25 is not set
>>>CONFIG_EEPROM_LEGACY=3Dm
>>>CONFIG_EEPROM_MAX6875=3Dm
>>>CONFIG_EEPROM_93CX6=3Dm
>>># CONFIG_EEPROM_93XX46 is not set
>>>CONFIG_CB710_CORE=3Dm
>>># CONFIG_CB710_DEBUG is not set
>>>CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
>>>
>>>#
>>># Texas Instruments shared transport line discipline
>>>#
>>># CONFIG_TI_ST is not set
>>>CONFIG_SENSORS_LIS3_I2C=3Dm
>>>
>>>#
>>># Altera FPGA firmware download module
>>>#
>>>CONFIG_ALTERA_STAPL=3Dm
>>>CONFIG_INTEL_MEI=3Dy
>>>CONFIG_INTEL_MEI_ME=3Dy
>>># CONFIG_INTEL_MEI_TXE is not set
>>>CONFIG_VMWARE_VMCI=3Dm
>>>
>>>#
>>># Intel MIC Bus Driver
>>>#
>>># CONFIG_INTEL_MIC_BUS is not set
>>>
>>>#
>>># SCIF Bus Driver
>>>#
>>># CONFIG_SCIF_BUS is not set
>>>
>>>#
>>># VOP Bus Driver
>>>#
>>># CONFIG_VOP_BUS is not set
>>>
>>>#
>>># Intel MIC Host Driver
>>>#
>>>
>>>#
>>># Intel MIC Card Driver
>>>#
>>>
>>>#
>>># SCIF Driver
>>>#
>>>
>>>#
>>># Intel MIC Coprocessor State Management (COSM) Drivers
>>>#
>>>
>>>#
>>># VOP Driver
>>>#
>>># CONFIG_GENWQE is not set
>>># CONFIG_ECHO is not set
>>># CONFIG_CXL_BASE is not set
>>># CONFIG_CXL_AFU_DRIVER_OPS is not set
>>>CONFIG_HAVE_IDE=3Dy
>>># CONFIG_IDE is not set
>>>
>>>#
>>># SCSI device support
>>>#
>>>CONFIG_SCSI_MOD=3Dy
>>>CONFIG_RAID_ATTRS=3Dm
>>>CONFIG_SCSI=3Dy
>>>CONFIG_SCSI_DMA=3Dy
>>>CONFIG_SCSI_NETLINK=3Dy
>>># CONFIG_SCSI_MQ_DEFAULT is not set
>>>CONFIG_SCSI_PROC_FS=3Dy
>>>
>>>#
>>># SCSI support type (disk, tape, CD-ROM)
>>>#
>>>CONFIG_BLK_DEV_SD=3Dm
>>>CONFIG_CHR_DEV_ST=3Dm
>>>CONFIG_CHR_DEV_OSST=3Dm
>>>CONFIG_BLK_DEV_SR=3Dm
>>>CONFIG_BLK_DEV_SR_VENDOR=3Dy
>>>CONFIG_CHR_DEV_SG=3Dm
>>>CONFIG_CHR_DEV_SCH=3Dm
>>>CONFIG_SCSI_ENCLOSURE=3Dm
>>>CONFIG_SCSI_CONSTANTS=3Dy
>>>CONFIG_SCSI_LOGGING=3Dy
>>>CONFIG_SCSI_SCAN_ASYNC=3Dy
>>>
>>>#
>>># SCSI Transports
>>>#
>>>CONFIG_SCSI_SPI_ATTRS=3Dm
>>>CONFIG_SCSI_FC_ATTRS=3Dm
>>>CONFIG_SCSI_ISCSI_ATTRS=3Dm
>>>CONFIG_SCSI_SAS_ATTRS=3Dm
>>>CONFIG_SCSI_SAS_LIBSAS=3Dm
>>>CONFIG_SCSI_SAS_ATA=3Dy
>>>CONFIG_SCSI_SAS_HOST_SMP=3Dy
>>>CONFIG_SCSI_SRP_ATTRS=3Dm
>>>CONFIG_SCSI_LOWLEVEL=3Dy
>>>CONFIG_ISCSI_TCP=3Dm
>>>CONFIG_ISCSI_BOOT_SYSFS=3Dm
>>>CONFIG_SCSI_CXGB3_ISCSI=3Dm
>>>CONFIG_SCSI_CXGB4_ISCSI=3Dm
>>>CONFIG_SCSI_BNX2_ISCSI=3Dm
>>>CONFIG_SCSI_BNX2X_FCOE=3Dm
>>>CONFIG_BE2ISCSI=3Dm
>>># CONFIG_BLK_DEV_3W_XXXX_RAID is not set
>>>CONFIG_SCSI_HPSA=3Dm
>>>CONFIG_SCSI_3W_9XXX=3Dm
>>>CONFIG_SCSI_3W_SAS=3Dm
>>># CONFIG_SCSI_ACARD is not set
>>>CONFIG_SCSI_AACRAID=3Dm
>>># CONFIG_SCSI_AIC7XXX is not set
>>>CONFIG_SCSI_AIC79XX=3Dm
>>>CONFIG_AIC79XX_CMDS_PER_DEVICE=3D4
>>>CONFIG_AIC79XX_RESET_DELAY_MS=3D15000
>>># CONFIG_AIC79XX_DEBUG_ENABLE is not set
>>>CONFIG_AIC79XX_DEBUG_MASK=3D0
>>># CONFIG_AIC79XX_REG_PRETTY_PRINT is not set
>>># CONFIG_SCSI_AIC94XX is not set
>>>CONFIG_SCSI_MVSAS=3Dm
>>># CONFIG_SCSI_MVSAS_DEBUG is not set
>>>CONFIG_SCSI_MVSAS_TASKLET=3Dy
>>>CONFIG_SCSI_MVUMI=3Dm
>>># CONFIG_SCSI_DPT_I2O is not set
>>># CONFIG_SCSI_ADVANSYS is not set
>>>CONFIG_SCSI_ARCMSR=3Dm
>>># CONFIG_SCSI_ESAS2R is not set
>>># CONFIG_MEGARAID_NEWGEN is not set
>>># CONFIG_MEGARAID_LEGACY is not set
>>>CONFIG_MEGARAID_SAS=3Dm
>>>CONFIG_SCSI_MPT3SAS=3Dm
>>>CONFIG_SCSI_MPT2SAS_MAX_SGE=3D128
>>>CONFIG_SCSI_MPT3SAS_MAX_SGE=3D128
>>>CONFIG_SCSI_MPT2SAS=3Dm
>>>CONFIG_SCSI_UFSHCD=3Dm
>>>CONFIG_SCSI_UFSHCD_PCI=3Dm
>>># CONFIG_SCSI_UFS_DWC_TC_PCI is not set
>>># CONFIG_SCSI_UFSHCD_PLATFORM is not set
>>>CONFIG_SCSI_HPTIOP=3Dm
>>># CONFIG_SCSI_BUSLOGIC is not set
>>>CONFIG_VMWARE_PVSCSI=3Dm
>>># CONFIG_XEN_SCSI_FRONTEND is not set
>>>CONFIG_HYPERV_STORAGE=3Dm
>>>CONFIG_LIBFC=3Dm
>>>CONFIG_LIBFCOE=3Dm
>>>CONFIG_FCOE=3Dm
>>>CONFIG_FCOE_FNIC=3Dm
>>># CONFIG_SCSI_SNIC is not set
>>># CONFIG_SCSI_DMX3191D is not set
>>># CONFIG_SCSI_EATA is not set
>>># CONFIG_SCSI_FUTURE_DOMAIN is not set
>>># CONFIG_SCSI_GDTH is not set
>>>CONFIG_SCSI_ISCI=3Dm
>>># CONFIG_SCSI_IPS is not set
>>>CONFIG_SCSI_INITIO=3Dm
>>># CONFIG_SCSI_INIA100 is not set
>>># CONFIG_SCSI_PPA is not set
>>># CONFIG_SCSI_IMM is not set
>>>CONFIG_SCSI_STEX=3Dm
>>># CONFIG_SCSI_SYM53C8XX_2 is not set
>>>CONFIG_SCSI_IPR=3Dm
>>>CONFIG_SCSI_IPR_TRACE=3Dy
>>>CONFIG_SCSI_IPR_DUMP=3Dy
>>># CONFIG_SCSI_QLOGIC_1280 is not set
>>>CONFIG_SCSI_QLA_FC=3Dm
>>># CONFIG_TCM_QLA2XXX is not set
>>>CONFIG_SCSI_QLA_ISCSI=3Dm
>>># CONFIG_SCSI_LPFC is not set
>>># CONFIG_SCSI_DC395x is not set
>>># CONFIG_SCSI_AM53C974 is not set
>>># CONFIG_SCSI_WD719X is not set
>>>CONFIG_SCSI_DEBUG=3Dm
>>>CONFIG_SCSI_PMCRAID=3Dm
>>>CONFIG_SCSI_PM8001=3Dm
>>># CONFIG_SCSI_BFA_FC is not set
>>>CONFIG_SCSI_VIRTIO=3Dm
>>>CONFIG_SCSI_CHELSIO_FCOE=3Dm
>>>CONFIG_SCSI_DH=3Dy
>>>CONFIG_SCSI_DH_RDAC=3Dy
>>>CONFIG_SCSI_DH_HP_SW=3Dy
>>>CONFIG_SCSI_DH_EMC=3Dy
>>>CONFIG_SCSI_DH_ALUA=3Dy
>>>CONFIG_SCSI_OSD_INITIATOR=3Dm
>>>CONFIG_SCSI_OSD_ULD=3Dm
>>>CONFIG_SCSI_OSD_DPRINT_SENSE=3D1
>>># CONFIG_SCSI_OSD_DEBUG is not set
>>>CONFIG_ATA=3Dm
>>># CONFIG_ATA_NONSTANDARD is not set
>>>CONFIG_ATA_VERBOSE_ERROR=3Dy
>>>CONFIG_ATA_ACPI=3Dy
>>># CONFIG_SATA_ZPODD is not set
>>>CONFIG_SATA_PMP=3Dy
>>>
>>>#
>>># Controllers with non-SFF native interface
>>>#
>>>CONFIG_SATA_AHCI=3Dm
>>>CONFIG_SATA_AHCI_PLATFORM=3Dm
>>># CONFIG_SATA_INIC162X is not set
>>>CONFIG_SATA_ACARD_AHCI=3Dm
>>>CONFIG_SATA_SIL24=3Dm
>>>CONFIG_ATA_SFF=3Dy
>>>
>>>#
>>># SFF controllers with custom DMA interface
>>>#
>>>CONFIG_PDC_ADMA=3Dm
>>>CONFIG_SATA_QSTOR=3Dm
>>>CONFIG_SATA_SX4=3Dm
>>>CONFIG_ATA_BMDMA=3Dy
>>>
>>>#
>>># SATA SFF controllers with BMDMA
>>>#
>>>CONFIG_ATA_PIIX=3Dm
>>># CONFIG_SATA_DWC is not set
>>>CONFIG_SATA_MV=3Dm
>>>CONFIG_SATA_NV=3Dm
>>>CONFIG_SATA_PROMISE=3Dm
>>>CONFIG_SATA_SIL=3Dm
>>>CONFIG_SATA_SIS=3Dm
>>>CONFIG_SATA_SVW=3Dm
>>>CONFIG_SATA_ULI=3Dm
>>>CONFIG_SATA_VIA=3Dm
>>>CONFIG_SATA_VITESSE=3Dm
>>>
>>>#
>>># PATA SFF controllers with BMDMA
>>>#
>>>CONFIG_PATA_ALI=3Dm
>>>CONFIG_PATA_AMD=3Dm
>>>CONFIG_PATA_ARTOP=3Dm
>>>CONFIG_PATA_ATIIXP=3Dm
>>>CONFIG_PATA_ATP867X=3Dm
>>>CONFIG_PATA_CMD64X=3Dm
>>># CONFIG_PATA_CYPRESS is not set
>>># CONFIG_PATA_EFAR is not set
>>>CONFIG_PATA_HPT366=3Dm
>>>CONFIG_PATA_HPT37X=3Dm
>>>CONFIG_PATA_HPT3X2N=3Dm
>>>CONFIG_PATA_HPT3X3=3Dm
>>># CONFIG_PATA_HPT3X3_DMA is not set
>>>CONFIG_PATA_IT8213=3Dm
>>>CONFIG_PATA_IT821X=3Dm
>>>CONFIG_PATA_JMICRON=3Dm
>>>CONFIG_PATA_MARVELL=3Dm
>>>CONFIG_PATA_NETCELL=3Dm
>>>CONFIG_PATA_NINJA32=3Dm
>>># CONFIG_PATA_NS87415 is not set
>>>CONFIG_PATA_OLDPIIX=3Dm
>>># CONFIG_PATA_OPTIDMA is not set
>>>CONFIG_PATA_PDC2027X=3Dm
>>>CONFIG_PATA_PDC_OLD=3Dm
>>># CONFIG_PATA_RADISYS is not set
>>>CONFIG_PATA_RDC=3Dm
>>>CONFIG_PATA_SCH=3Dm
>>>CONFIG_PATA_SERVERWORKS=3Dm
>>>CONFIG_PATA_SIL680=3Dm
>>>CONFIG_PATA_SIS=3Dm
>>>CONFIG_PATA_TOSHIBA=3Dm
>>># CONFIG_PATA_TRIFLEX is not set
>>>CONFIG_PATA_VIA=3Dm
>>># CONFIG_PATA_WINBOND is not set
>>>
>>>#
>>># PIO-only SFF controllers
>>>#
>>># CONFIG_PATA_CMD640_PCI is not set
>>># CONFIG_PATA_MPIIX is not set
>>># CONFIG_PATA_NS87410 is not set
>>># CONFIG_PATA_OPTI is not set
>>># CONFIG_PATA_RZ1000 is not set
>>>
>>>#
>>># Generic fallback / legacy drivers
>>>#
>>>CONFIG_PATA_ACPI=3Dm
>>>CONFIG_ATA_GENERIC=3Dm
>>># CONFIG_PATA_LEGACY is not set
>>>CONFIG_MD=3Dy
>>>CONFIG_BLK_DEV_MD=3Dy
>>>CONFIG_MD_AUTODETECT=3Dy
>>>CONFIG_MD_LINEAR=3Dm
>>>CONFIG_MD_RAID0=3Dm
>>>CONFIG_MD_RAID1=3Dm
>>>CONFIG_MD_RAID10=3Dm
>>>CONFIG_MD_RAID456=3Dm
>>>CONFIG_MD_MULTIPATH=3Dm
>>>CONFIG_MD_FAULTY=3Dm
>>># CONFIG_MD_CLUSTER is not set
>>># CONFIG_BCACHE is not set
>>>CONFIG_BLK_DEV_DM_BUILTIN=3Dy
>>>CONFIG_BLK_DEV_DM=3Dm
>>># CONFIG_DM_MQ_DEFAULT is not set
>>>CONFIG_DM_DEBUG=3Dy
>>>CONFIG_DM_BUFIO=3Dm
>>># CONFIG_DM_DEBUG_BLOCK_STACK_TRACING is not set
>>>CONFIG_DM_BIO_PRISON=3Dm
>>>CONFIG_DM_PERSISTENT_DATA=3Dm
>>>CONFIG_DM_CRYPT=3Dm
>>>CONFIG_DM_SNAPSHOT=3Dm
>>>CONFIG_DM_THIN_PROVISIONING=3Dm
>>>CONFIG_DM_CACHE=3Dm
>>>CONFIG_DM_CACHE_SMQ=3Dm
>>>CONFIG_DM_CACHE_CLEANER=3Dm
>>># CONFIG_DM_ERA is not set
>>>CONFIG_DM_MIRROR=3Dm
>>>CONFIG_DM_LOG_USERSPACE=3Dm
>>>CONFIG_DM_RAID=3Dm
>>>CONFIG_DM_ZERO=3Dm
>>>CONFIG_DM_MULTIPATH=3Dm
>>>CONFIG_DM_MULTIPATH_QL=3Dm
>>>CONFIG_DM_MULTIPATH_ST=3Dm
>>>CONFIG_DM_DELAY=3Dm
>>>CONFIG_DM_UEVENT=3Dy
>>>CONFIG_DM_FLAKEY=3Dm
>>>CONFIG_DM_VERITY=3Dm
>>># CONFIG_DM_VERITY_FEC is not set
>>>CONFIG_DM_SWITCH=3Dm
>>># CONFIG_DM_LOG_WRITES is not set
>>>CONFIG_TARGET_CORE=3Dm
>>>CONFIG_TCM_IBLOCK=3Dm
>>>CONFIG_TCM_FILEIO=3Dm
>>>CONFIG_TCM_PSCSI=3Dm
>>># CONFIG_TCM_USER2 is not set
>>>CONFIG_LOOPBACK_TARGET=3Dm
>>>CONFIG_TCM_FC=3Dm
>>>CONFIG_ISCSI_TARGET=3Dm
>>># CONFIG_ISCSI_TARGET_CXGB4 is not set
>>># CONFIG_SBP_TARGET is not set
>>>CONFIG_FUSION=3Dy
>>>CONFIG_FUSION_SPI=3Dm
>>># CONFIG_FUSION_FC is not set
>>>CONFIG_FUSION_SAS=3Dm
>>>CONFIG_FUSION_MAX_SGE=3D128
>>>CONFIG_FUSION_CTL=3Dm
>>>CONFIG_FUSION_LOGGING=3Dy
>>>
>>>#
>>># IEEE 1394 (FireWire) support
>>>#
>>>CONFIG_FIREWIRE=3Dm
>>>CONFIG_FIREWIRE_OHCI=3Dm
>>>CONFIG_FIREWIRE_SBP2=3Dm
>>>CONFIG_FIREWIRE_NET=3Dm
>>># CONFIG_FIREWIRE_NOSY is not set
>>>CONFIG_MACINTOSH_DRIVERS=3Dy
>>>CONFIG_MAC_EMUMOUSEBTN=3Dy
>>>CONFIG_NETDEVICES=3Dy
>>>CONFIG_MII=3Dy
>>>CONFIG_NET_CORE=3Dy
>>>CONFIG_BONDING=3Dm
>>>CONFIG_DUMMY=3Dm
>>># CONFIG_EQUALIZER is not set
>>>CONFIG_NET_FC=3Dy
>>>CONFIG_IFB=3Dm
>>>CONFIG_NET_TEAM=3Dm
>>>CONFIG_NET_TEAM_MODE_BROADCAST=3Dm
>>>CONFIG_NET_TEAM_MODE_ROUNDROBIN=3Dm
>>>CONFIG_NET_TEAM_MODE_RANDOM=3Dm
>>>CONFIG_NET_TEAM_MODE_ACTIVEBACKUP=3Dm
>>>CONFIG_NET_TEAM_MODE_LOADBALANCE=3Dm
>>>CONFIG_MACVLAN=3Dm
>>>CONFIG_MACVTAP=3Dm
>>># CONFIG_IPVLAN is not set
>>>CONFIG_VXLAN=3Dm
>>># CONFIG_GENEVE is not set
>>># CONFIG_GTP is not set
>>># CONFIG_MACSEC is not set
>>>CONFIG_NETCONSOLE=3Dm
>>>CONFIG_NETCONSOLE_DYNAMIC=3Dy
>>>CONFIG_NETPOLL=3Dy
>>>CONFIG_NET_POLL_CONTROLLER=3Dy
>>>CONFIG_TUN=3Dm
>>># CONFIG_TUN_VNET_CROSS_LE is not set
>>>CONFIG_VETH=3Dm
>>>CONFIG_VIRTIO_NET=3Dy
>>>CONFIG_NLMON=3Dm
>>># CONFIG_ARCNET is not set
>>># CONFIG_ATM_DRIVERS is not set
>>>
>>>#
>>># CAIF transport drivers
>>>#
>>>
>>>#
>>># Distributed Switch Architecture drivers
>>>#
>>>CONFIG_ETHERNET=3Dy
>>>CONFIG_MDIO=3Dy
>>># CONFIG_NET_VENDOR_3COM is not set
>>># CONFIG_NET_VENDOR_ADAPTEC is not set
>>>CONFIG_NET_VENDOR_AGERE=3Dy
>>># CONFIG_ET131X is not set
>>># CONFIG_NET_VENDOR_ALTEON is not set
>>># CONFIG_ALTERA_TSE is not set
>>># CONFIG_NET_VENDOR_AMD is not set
>>>CONFIG_NET_VENDOR_ARC=3Dy
>>>CONFIG_NET_VENDOR_ATHEROS=3Dy
>>>CONFIG_ATL2=3Dm
>>>CONFIG_ATL1=3Dm
>>>CONFIG_ATL1E=3Dm
>>>CONFIG_ATL1C=3Dm
>>>CONFIG_ALX=3Dm
>>># CONFIG_NET_VENDOR_AURORA is not set
>>>CONFIG_NET_CADENCE=3Dy
>>># CONFIG_MACB is not set
>>>CONFIG_NET_VENDOR_BROADCOM=3Dy
>>>CONFIG_B44=3Dm
>>>CONFIG_B44_PCI_AUTOSELECT=3Dy
>>>CONFIG_B44_PCICORE_AUTOSELECT=3Dy
>>>CONFIG_B44_PCI=3Dy
>>># CONFIG_BCMGENET is not set
>>>CONFIG_BNX2=3Dm
>>>CONFIG_CNIC=3Dm
>>>CONFIG_TIGON3=3Dy
>>># CONFIG_BNX2X is not set
>>># CONFIG_BNXT is not set
>>>CONFIG_NET_VENDOR_BROCADE=3Dy
>>>CONFIG_BNA=3Dm
>>>CONFIG_NET_VENDOR_CAVIUM=3Dy
>>># CONFIG_THUNDER_NIC_PF is not set
>>># CONFIG_THUNDER_NIC_VF is not set
>>># CONFIG_THUNDER_NIC_BGX is not set
>>># CONFIG_LIQUIDIO is not set
>>>CONFIG_NET_VENDOR_CHELSIO=3Dy
>>># CONFIG_CHELSIO_T1 is not set
>>>CONFIG_CHELSIO_T3=3Dm
>>>CONFIG_CHELSIO_T4=3Dm
>>># CONFIG_CHELSIO_T4_DCB is not set
>>>CONFIG_CHELSIO_T4VF=3Dm
>>>CONFIG_CHELSIO_LIB=3Dm
>>>CONFIG_NET_VENDOR_CISCO=3Dy
>>>CONFIG_ENIC=3Dm
>>># CONFIG_CX_ECAT is not set
>>>CONFIG_DNET=3Dm
>>>CONFIG_NET_VENDOR_DEC=3Dy
>>>CONFIG_NET_TULIP=3Dy
>>>CONFIG_DE2104X=3Dm
>>>CONFIG_DE2104X_DSL=3D0
>>>CONFIG_TULIP=3Dy
>>># CONFIG_TULIP_MWI is not set
>>>CONFIG_TULIP_MMIO=3Dy
>>># CONFIG_TULIP_NAPI is not set
>>>CONFIG_DE4X5=3Dm
>>>CONFIG_WINBOND_840=3Dm
>>>CONFIG_DM9102=3Dm
>>>CONFIG_ULI526X=3Dm
>>>CONFIG_PCMCIA_XIRCOM=3Dm
>>># CONFIG_NET_VENDOR_DLINK is not set
>>>CONFIG_NET_VENDOR_EMULEX=3Dy
>>>CONFIG_BE2NET=3Dm
>>>CONFIG_BE2NET_HWMON=3Dy
>>>CONFIG_NET_VENDOR_EZCHIP=3Dy
>>># CONFIG_NET_VENDOR_EXAR is not set
>>># CONFIG_NET_VENDOR_HP is not set
>>>CONFIG_NET_VENDOR_INTEL=3Dy
>>># CONFIG_E100 is not set
>>>CONFIG_E1000=3Dy
>>>CONFIG_E1000E=3Dy
>>>CONFIG_E1000E_HWTS=3Dy
>>>CONFIG_IGB=3Dy
>>>CONFIG_IGB_HWMON=3Dy
>>>CONFIG_IGBVF=3Dm
>>>CONFIG_IXGB=3Dm
>>>CONFIG_IXGBE=3Dy
>>>CONFIG_IXGBE_HWMON=3Dy
>>>CONFIG_IXGBE_DCB=3Dy
>>>CONFIG_IXGBEVF=3Dm
>>>CONFIG_I40E=3Dm
>>># CONFIG_I40E_DCB is not set
>>># CONFIG_I40E_FCOE is not set
>>># CONFIG_I40EVF is not set
>>># CONFIG_FM10K is not set
>>># CONFIG_NET_VENDOR_I825XX is not set
>>>CONFIG_JME=3Dm
>>>CONFIG_NET_VENDOR_MARVELL=3Dy
>>>CONFIG_MVMDIO=3Dm
>>># CONFIG_MVNETA_BM is not set
>>>CONFIG_SKGE=3Dm
>>>CONFIG_SKGE_DEBUG=3Dy
>>>CONFIG_SKGE_GENESIS=3Dy
>>>CONFIG_SKY2=3Dm
>>>CONFIG_SKY2_DEBUG=3Dy
>>>CONFIG_NET_VENDOR_MELLANOX=3Dy
>>>CONFIG_MLX4_EN=3Dm
>>>CONFIG_MLX4_EN_DCB=3Dy
>>>CONFIG_MLX4_CORE=3Dm
>>>CONFIG_MLX4_DEBUG=3Dy
>>># CONFIG_MLX5_CORE is not set
>>># CONFIG_MLXSW_CORE is not set
>>># CONFIG_NET_VENDOR_MICREL is not set
>>>CONFIG_NET_VENDOR_MICROCHIP=3Dy
>>># CONFIG_ENC28J60 is not set
>>># CONFIG_ENCX24J600 is not set
>>>CONFIG_NET_VENDOR_MYRI=3Dy
>>>CONFIG_MYRI10GE=3Dm
>>># CONFIG_FEALNX is not set
>>># CONFIG_NET_VENDOR_NATSEMI is not set
>>>CONFIG_NET_VENDOR_NETRONOME=3Dy
>>># CONFIG_NFP_NETVF is not set
>>># CONFIG_NET_VENDOR_NVIDIA is not set
>>>CONFIG_NET_VENDOR_OKI=3Dy
>>>CONFIG_ETHOC=3Dm
>>>CONFIG_NET_PACKET_ENGINE=3Dy
>>># CONFIG_HAMACHI is not set
>>>CONFIG_YELLOWFIN=3Dm
>>>CONFIG_NET_VENDOR_QLOGIC=3Dy
>>>CONFIG_QLA3XXX=3Dm
>>>CONFIG_QLCNIC=3Dm
>>>CONFIG_QLCNIC_SRIOV=3Dy
>>>CONFIG_QLCNIC_DCB=3Dy
>>>CONFIG_QLCNIC_HWMON=3Dy
>>>CONFIG_QLGE=3Dm
>>>CONFIG_NETXEN_NIC=3Dm
>>># CONFIG_QED is not set
>>>CONFIG_NET_VENDOR_QUALCOMM=3Dy
>>>CONFIG_NET_VENDOR_REALTEK=3Dy
>>># CONFIG_ATP is not set
>>>CONFIG_8139CP=3Dy
>>>CONFIG_8139TOO=3Dy
>>>CONFIG_8139TOO_PIO=3Dy
>>># CONFIG_8139TOO_TUNE_TWISTER is not set
>>>CONFIG_8139TOO_8129=3Dy
>>># CONFIG_8139_OLD_RX_RESET is not set
>>>CONFIG_R8169=3Dy
>>>CONFIG_NET_VENDOR_RENESAS=3Dy
>>># CONFIG_NET_VENDOR_RDC is not set
>>>CONFIG_NET_VENDOR_ROCKER=3Dy
>>>CONFIG_NET_VENDOR_SAMSUNG=3Dy
>>># CONFIG_SXGBE_ETH is not set
>>># CONFIG_NET_VENDOR_SEEQ is not set
>>># CONFIG_NET_VENDOR_SILAN is not set
>>># CONFIG_NET_VENDOR_SIS is not set
>>>CONFIG_SFC=3Dm
>>>CONFIG_SFC_MTD=3Dy
>>>CONFIG_SFC_MCDI_MON=3Dy
>>>CONFIG_SFC_SRIOV=3Dy
>>>CONFIG_SFC_MCDI_LOGGING=3Dy
>>>CONFIG_NET_VENDOR_SMSC=3Dy
>>>CONFIG_EPIC100=3Dm
>>># CONFIG_SMSC911X is not set
>>>CONFIG_SMSC9420=3Dm
>>># CONFIG_NET_VENDOR_STMICRO is not set
>>># CONFIG_NET_VENDOR_SUN is not set
>>>CONFIG_NET_VENDOR_SYNOPSYS=3Dy
>>># CONFIG_NET_VENDOR_TEHUTI is not set
>>># CONFIG_NET_VENDOR_TI is not set
>>># CONFIG_NET_VENDOR_VIA is not set
>>># CONFIG_NET_VENDOR_WIZNET is not set
>>># CONFIG_FDDI is not set
>>># CONFIG_HIPPI is not set
>>># CONFIG_NET_SB1000 is not set
>>>CONFIG_PHYLIB=3Dy
>>>CONFIG_SWPHY=3Dy
>>>
>>>#
>>># MII PHY device drivers
>>>#
>>># CONFIG_AQUANTIA_PHY is not set
>>>CONFIG_AT803X_PHY=3Dm
>>>CONFIG_AMD_PHY=3Dm
>>>CONFIG_MARVELL_PHY=3Dm
>>>CONFIG_DAVICOM_PHY=3Dm
>>>CONFIG_QSEMI_PHY=3Dm
>>>CONFIG_LXT_PHY=3Dm
>>>CONFIG_CICADA_PHY=3Dm
>>>CONFIG_VITESSE_PHY=3Dm
>>># CONFIG_TERANETICS_PHY is not set
>>>CONFIG_SMSC_PHY=3Dm
>>>CONFIG_BCM_NET_PHYLIB=3Dm
>>>CONFIG_BROADCOM_PHY=3Dm
>>># CONFIG_BCM7XXX_PHY is not set
>>>CONFIG_BCM87XX_PHY=3Dm
>>>CONFIG_ICPLUS_PHY=3Dm
>>>CONFIG_REALTEK_PHY=3Dm
>>>CONFIG_NATIONAL_PHY=3Dm
>>>CONFIG_STE10XP=3Dm
>>>CONFIG_LSI_ET1011C_PHY=3Dm
>>>CONFIG_MICREL_PHY=3Dm
>>># CONFIG_DP83848_PHY is not set
>>># CONFIG_DP83867_PHY is not set
>>># CONFIG_MICROCHIP_PHY is not set
>>>CONFIG_FIXED_PHY=3Dy
>>>CONFIG_MDIO_BITBANG=3Dm
>>># CONFIG_MDIO_GPIO is not set
>>># CONFIG_MDIO_OCTEON is not set
>>># CONFIG_MDIO_THUNDER is not set
>>># CONFIG_MDIO_BCM_UNIMAC is not set
>>># CONFIG_INTEL_XWAY_PHY is not set
>>># CONFIG_MDIO_XGENE is not set
>>># CONFIG_MICREL_KS8995MA is not set
>>># CONFIG_PLIP is not set
>>>CONFIG_PPP=3Dm
>>>CONFIG_PPP_BSDCOMP=3Dm
>>>CONFIG_PPP_DEFLATE=3Dm
>>>CONFIG_PPP_FILTER=3Dy
>>>CONFIG_PPP_MPPE=3Dm
>>>CONFIG_PPP_MULTILINK=3Dy
>>>CONFIG_PPPOATM=3Dm
>>>CONFIG_PPPOE=3Dm
>>>CONFIG_PPTP=3Dm
>>>CONFIG_PPPOL2TP=3Dm
>>>CONFIG_PPP_ASYNC=3Dm
>>>CONFIG_PPP_SYNC_TTY=3Dm
>>>CONFIG_SLIP=3Dm
>>>CONFIG_SLHC=3Dm
>>>CONFIG_SLIP_COMPRESSED=3Dy
>>>CONFIG_SLIP_SMART=3Dy
>>># CONFIG_SLIP_MODE_SLIP6 is not set
>>>CONFIG_USB_NET_DRIVERS=3Dy
>>>CONFIG_USB_CATC=3Dy
>>>CONFIG_USB_KAWETH=3Dy
>>>CONFIG_USB_PEGASUS=3Dy
>>>CONFIG_USB_RTL8150=3Dy
>>>CONFIG_USB_RTL8152=3Dm
>>># CONFIG_USB_LAN78XX is not set
>>>CONFIG_USB_USBNET=3Dy
>>>CONFIG_USB_NET_AX8817X=3Dy
>>>CONFIG_USB_NET_AX88179_178A=3Dm
>>>CONFIG_USB_NET_CDCETHER=3Dy
>>>CONFIG_USB_NET_CDC_EEM=3Dy
>>>CONFIG_USB_NET_CDC_NCM=3Dm
>>># CONFIG_USB_NET_HUAWEI_CDC_NCM is not set
>>>CONFIG_USB_NET_CDC_MBIM=3Dm
>>>CONFIG_USB_NET_DM9601=3Dy
>>># CONFIG_USB_NET_SR9700 is not set
>>># CONFIG_USB_NET_SR9800 is not set
>>>CONFIG_USB_NET_SMSC75XX=3Dy
>>>CONFIG_USB_NET_SMSC95XX=3Dy
>>>CONFIG_USB_NET_GL620A=3Dy
>>>CONFIG_USB_NET_NET1080=3Dy
>>>CONFIG_USB_NET_PLUSB=3Dy
>>>CONFIG_USB_NET_MCS7830=3Dy
>>>CONFIG_USB_NET_RNDIS_HOST=3Dy
>>>CONFIG_USB_NET_CDC_SUBSET_ENABLE=3Dy
>>>CONFIG_USB_NET_CDC_SUBSET=3Dy
>>>CONFIG_USB_ALI_M5632=3Dy
>>>CONFIG_USB_AN2720=3Dy
>>>CONFIG_USB_BELKIN=3Dy
>>>CONFIG_USB_ARMLINUX=3Dy
>>>CONFIG_USB_EPSON2888=3Dy
>>>CONFIG_USB_KC2190=3Dy
>>>CONFIG_USB_NET_ZAURUS=3Dy
>>>CONFIG_USB_NET_CX82310_ETH=3Dm
>>>CONFIG_USB_NET_KALMIA=3Dm
>>>CONFIG_USB_NET_QMI_WWAN=3Dm
>>>CONFIG_USB_HSO=3Dm
>>>CONFIG_USB_NET_INT51X1=3Dy
>>>CONFIG_USB_IPHETH=3Dy
>>>CONFIG_USB_SIERRA_NET=3Dy
>>>CONFIG_USB_VL600=3Dm
>>># CONFIG_USB_NET_CH9200 is not set
>>>CONFIG_WLAN=3Dy
>>>CONFIG_WLAN_VENDOR_ADMTEK=3Dy
>>># CONFIG_ADM8211 is not set
>>>CONFIG_WLAN_VENDOR_ATH=3Dy
>>># CONFIG_ATH_DEBUG is not set
>>># CONFIG_ATH5K is not set
>>># CONFIG_ATH5K_PCI is not set
>>># CONFIG_ATH9K is not set
>>># CONFIG_ATH9K_HTC is not set
>>># CONFIG_CARL9170 is not set
>>># CONFIG_ATH6KL is not set
>>># CONFIG_AR5523 is not set
>>># CONFIG_WIL6210 is not set
>>># CONFIG_ATH10K is not set
>>># CONFIG_WCN36XX is not set
>>>CONFIG_WLAN_VENDOR_ATMEL=3Dy
>>># CONFIG_ATMEL is not set
>>># CONFIG_AT76C50X_USB is not set
>>>CONFIG_WLAN_VENDOR_BROADCOM=3Dy
>>># CONFIG_B43 is not set
>>># CONFIG_B43LEGACY is not set
>>># CONFIG_BRCMSMAC is not set
>>># CONFIG_BRCMFMAC is not set
>>>CONFIG_WLAN_VENDOR_CISCO=3Dy
>>># CONFIG_AIRO is not set
>>>CONFIG_WLAN_VENDOR_INTEL=3Dy
>>># CONFIG_IPW2100 is not set
>>># CONFIG_IPW2200 is not set
>>># CONFIG_IWL4965 is not set
>>># CONFIG_IWL3945 is not set
>>># CONFIG_IWLWIFI is not set
>>>CONFIG_WLAN_VENDOR_INTERSIL=3Dy
>>># CONFIG_HOSTAP is not set
>>># CONFIG_HERMES is not set
>>># CONFIG_P54_COMMON is not set
>>># CONFIG_PRISM54 is not set
>>>CONFIG_WLAN_VENDOR_MARVELL=3Dy
>>># CONFIG_LIBERTAS is not set
>>># CONFIG_LIBERTAS_THINFIRM is not set
>>># CONFIG_MWIFIEX is not set
>>># CONFIG_MWL8K is not set
>>>CONFIG_WLAN_VENDOR_MEDIATEK=3Dy
>>># CONFIG_MT7601U is not set
>>>CONFIG_WLAN_VENDOR_RALINK=3Dy
>>># CONFIG_RT2X00 is not set
>>>CONFIG_WLAN_VENDOR_REALTEK=3Dy
>>># CONFIG_RTL8180 is not set
>>># CONFIG_RTL8187 is not set
>>>CONFIG_RTL_CARDS=3Dm
>>># CONFIG_RTL8192CE is not set
>>># CONFIG_RTL8192SE is not set
>>># CONFIG_RTL8192DE is not set
>>># CONFIG_RTL8723AE is not set
>>># CONFIG_RTL8723BE is not set
>>># CONFIG_RTL8188EE is not set
>>># CONFIG_RTL8192EE is not set
>>># CONFIG_RTL8821AE is not set
>>># CONFIG_RTL8192CU is not set
>>># CONFIG_RTL8XXXU is not set
>>>CONFIG_WLAN_VENDOR_RSI=3Dy
>>># CONFIG_RSI_91X is not set
>>>CONFIG_WLAN_VENDOR_ST=3Dy
>>># CONFIG_CW1200 is not set
>>>CONFIG_WLAN_VENDOR_TI=3Dy
>>># CONFIG_WL1251 is not set
>>># CONFIG_WL12XX is not set
>>># CONFIG_WL18XX is not set
>>># CONFIG_WLCORE is not set
>>>CONFIG_WLAN_VENDOR_ZYDAS=3Dy
>>># CONFIG_USB_ZD1201 is not set
>>># CONFIG_ZD1211RW is not set
>>>CONFIG_MAC80211_HWSIM=3Dm
>>># CONFIG_USB_NET_RNDIS_WLAN is not set
>>>
>>>#
>>># Enable WiMAX (Networking options) to see the WiMAX drivers
>>>#
>>>CONFIG_WAN=3Dy
>>># CONFIG_LANMEDIA is not set
>>>CONFIG_HDLC=3Dm
>>>CONFIG_HDLC_RAW=3Dm
>>># CONFIG_HDLC_RAW_ETH is not set
>>>CONFIG_HDLC_CISCO=3Dm
>>>CONFIG_HDLC_FR=3Dm
>>>CONFIG_HDLC_PPP=3Dm
>>>
>>>#
>>># X.25/LAPB support is disabled
>>>#
>>># CONFIG_PCI200SYN is not set
>>># CONFIG_WANXL is not set
>>># CONFIG_PC300TOO is not set
>>># CONFIG_FARSYNC is not set
>>># CONFIG_DSCC4 is not set
>>>CONFIG_DLCI=3Dm
>>>CONFIG_DLCI_MAX=3D8
>>># CONFIG_SBNI is not set
>>>CONFIG_IEEE802154_DRIVERS=3Dm
>>>CONFIG_IEEE802154_FAKELB=3Dm
>>># CONFIG_IEEE802154_AT86RF230 is not set
>>># CONFIG_IEEE802154_MRF24J40 is not set
>>># CONFIG_IEEE802154_CC2520 is not set
>>># CONFIG_IEEE802154_ATUSB is not set
>>># CONFIG_IEEE802154_ADF7242 is not set
>>>CONFIG_XEN_NETDEV_FRONTEND=3Dm
>>># CONFIG_XEN_NETDEV_BACKEND is not set
>>>CONFIG_VMXNET3=3Dm
>>># CONFIG_FUJITSU_ES is not set
>>>CONFIG_HYPERV_NET=3Dm
>>>CONFIG_ISDN=3Dy
>>>CONFIG_ISDN_I4L=3Dm
>>>CONFIG_ISDN_PPP=3Dy
>>>CONFIG_ISDN_PPP_VJ=3Dy
>>>CONFIG_ISDN_MPP=3Dy
>>>CONFIG_IPPP_FILTER=3Dy
>>># CONFIG_ISDN_PPP_BSDCOMP is not set
>>>CONFIG_ISDN_AUDIO=3Dy
>>>CONFIG_ISDN_TTY_FAX=3Dy
>>>
>>>#
>>># ISDN feature submodules
>>>#
>>>CONFIG_ISDN_DIVERSION=3Dm
>>>
>>>#
>>># ISDN4Linux hardware drivers
>>>#
>>>
>>>#
>>># Passive cards
>>>#
>>># CONFIG_ISDN_DRV_HISAX is not set
>>>CONFIG_ISDN_CAPI=3Dm
>>># CONFIG_CAPI_TRACE is not set
>>>CONFIG_ISDN_CAPI_CAPI20=3Dm
>>>CONFIG_ISDN_CAPI_MIDDLEWARE=3Dy
>>>CONFIG_ISDN_CAPI_CAPIDRV=3Dm
>>># CONFIG_ISDN_CAPI_CAPIDRV_VERBOSE is not set
>>>
>>>#
>>># CAPI hardware drivers
>>>#
>>>CONFIG_CAPI_AVM=3Dy
>>>CONFIG_ISDN_DRV_AVMB1_B1PCI=3Dm
>>>CONFIG_ISDN_DRV_AVMB1_B1PCIV4=3Dy
>>>CONFIG_ISDN_DRV_AVMB1_T1PCI=3Dm
>>>CONFIG_ISDN_DRV_AVMB1_C4=3Dm
>>># CONFIG_CAPI_EICON is not set
>>>CONFIG_ISDN_DRV_GIGASET=3Dm
>>>CONFIG_GIGASET_CAPI=3Dy
>>># CONFIG_GIGASET_I4L is not set
>>># CONFIG_GIGASET_DUMMYLL is not set
>>>CONFIG_GIGASET_BASE=3Dm
>>>CONFIG_GIGASET_M105=3Dm
>>>CONFIG_GIGASET_M101=3Dm
>>># CONFIG_GIGASET_DEBUG is not set
>>>CONFIG_HYSDN=3Dm
>>>CONFIG_HYSDN_CAPI=3Dy
>>>CONFIG_MISDN=3Dm
>>>CONFIG_MISDN_DSP=3Dm
>>>CONFIG_MISDN_L1OIP=3Dm
>>>
>>>#
>>># mISDN hardware drivers
>>>#
>>>CONFIG_MISDN_HFCPCI=3Dm
>>>CONFIG_MISDN_HFCMULTI=3Dm
>>>CONFIG_MISDN_HFCUSB=3Dm
>>>CONFIG_MISDN_AVMFRITZ=3Dm
>>>CONFIG_MISDN_SPEEDFAX=3Dm
>>>CONFIG_MISDN_INFINEON=3Dm
>>>CONFIG_MISDN_W6692=3Dm
>>>CONFIG_MISDN_NETJET=3Dm
>>>CONFIG_MISDN_IPAC=3Dm
>>>CONFIG_MISDN_ISAR=3Dm
>>>CONFIG_ISDN_HDLC=3Dm
>>># CONFIG_NVM is not set
>>>
>>>#
>>># Input device support
>>>#
>>>CONFIG_INPUT=3Dy
>>>CONFIG_INPUT_LEDS=3Dy
>>>CONFIG_INPUT_FF_MEMLESS=3Dm
>>>CONFIG_INPUT_POLLDEV=3Dm
>>>CONFIG_INPUT_SPARSEKMAP=3Dm
>>># CONFIG_INPUT_MATRIXKMAP is not set
>>>
>>>#
>>># Userland interfaces
>>>#
>>>CONFIG_INPUT_MOUSEDEV=3Dy
>>># CONFIG_INPUT_MOUSEDEV_PSAUX is not set
>>>CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
>>>CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
>>># CONFIG_INPUT_JOYDEV is not set
>>>CONFIG_INPUT_EVDEV=3Dy
>>># CONFIG_INPUT_EVBUG is not set
>>>
>>>#
>>># Input Device Drivers
>>>#
>>>CONFIG_INPUT_KEYBOARD=3Dy
>>># CONFIG_KEYBOARD_ADP5588 is not set
>>># CONFIG_KEYBOARD_ADP5589 is not set
>>>CONFIG_KEYBOARD_ATKBD=3Dy
>>># CONFIG_KEYBOARD_QT1070 is not set
>>># CONFIG_KEYBOARD_QT2160 is not set
>>># CONFIG_KEYBOARD_LKKBD is not set
>>># CONFIG_KEYBOARD_GPIO is not set
>>># CONFIG_KEYBOARD_GPIO_POLLED is not set
>>># CONFIG_KEYBOARD_TCA6416 is not set
>>># CONFIG_KEYBOARD_TCA8418 is not set
>>># CONFIG_KEYBOARD_MATRIX is not set
>>># CONFIG_KEYBOARD_LM8323 is not set
>>># CONFIG_KEYBOARD_LM8333 is not set
>>># CONFIG_KEYBOARD_MAX7359 is not set
>>># CONFIG_KEYBOARD_MCS is not set
>>># CONFIG_KEYBOARD_MPR121 is not set
>>># CONFIG_KEYBOARD_NEWTON is not set
>>># CONFIG_KEYBOARD_OPENCORES is not set
>>># CONFIG_KEYBOARD_SAMSUNG is not set
>>># CONFIG_KEYBOARD_STOWAWAY is not set
>>># CONFIG_KEYBOARD_SUNKBD is not set
>>># CONFIG_KEYBOARD_XTKBD is not set
>>>CONFIG_INPUT_MOUSE=3Dy
>>>CONFIG_MOUSE_PS2=3Dy
>>>CONFIG_MOUSE_PS2_ALPS=3Dy
>>>CONFIG_MOUSE_PS2_BYD=3Dy
>>>CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
>>>CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
>>>CONFIG_MOUSE_PS2_CYPRESS=3Dy
>>>CONFIG_MOUSE_PS2_LIFEBOOK=3Dy
>>>CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
>>>CONFIG_MOUSE_PS2_ELANTECH=3Dy
>>>CONFIG_MOUSE_PS2_SENTELIC=3Dy
>>># CONFIG_MOUSE_PS2_TOUCHKIT is not set
>>>CONFIG_MOUSE_PS2_FOCALTECH=3Dy
>>># CONFIG_MOUSE_PS2_VMMOUSE is not set
>>>CONFIG_MOUSE_SERIAL=3Dm
>>>CONFIG_MOUSE_APPLETOUCH=3Dm
>>>CONFIG_MOUSE_BCM5974=3Dm
>>>CONFIG_MOUSE_CYAPA=3Dm
>>># CONFIG_MOUSE_ELAN_I2C is not set
>>>CONFIG_MOUSE_VSXXXAA=3Dm
>>># CONFIG_MOUSE_GPIO is not set
>>>CONFIG_MOUSE_SYNAPTICS_I2C=3Dm
>>>CONFIG_MOUSE_SYNAPTICS_USB=3Dm
>>># CONFIG_INPUT_JOYSTICK is not set
>>>CONFIG_INPUT_TABLET=3Dy
>>>CONFIG_TABLET_USB_ACECAD=3Dm
>>>CONFIG_TABLET_USB_AIPTEK=3Dm
>>>CONFIG_TABLET_USB_GTCO=3Dm
>>># CONFIG_TABLET_USB_HANWANG is not set
>>>CONFIG_TABLET_USB_KBTAB=3Dm
>>># CONFIG_TABLET_USB_PEGASUS is not set
>>># CONFIG_TABLET_SERIAL_WACOM4 is not set
>>>CONFIG_INPUT_TOUCHSCREEN=3Dy
>>>CONFIG_TOUCHSCREEN_PROPERTIES=3Dy
>>># CONFIG_TOUCHSCREEN_ADS7846 is not set
>>># CONFIG_TOUCHSCREEN_AD7877 is not set
>>># CONFIG_TOUCHSCREEN_AD7879 is not set
>>># CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
>>># CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
>>># CONFIG_TOUCHSCREEN_BU21013 is not set
>>># CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
>>># CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
>>># CONFIG_TOUCHSCREEN_CYTTSP4_CORE is not set
>>># CONFIG_TOUCHSCREEN_DYNAPRO is not set
>>># CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
>>># CONFIG_TOUCHSCREEN_EETI is not set
>>># CONFIG_TOUCHSCREEN_EGALAX_SERIAL is not set
>>># CONFIG_TOUCHSCREEN_FT6236 is not set
>>># CONFIG_TOUCHSCREEN_FUJITSU is not set
>>># CONFIG_TOUCHSCREEN_GOODIX is not set
>>># CONFIG_TOUCHSCREEN_ILI210X is not set
>>># CONFIG_TOUCHSCREEN_GUNZE is not set
>>># CONFIG_TOUCHSCREEN_ELAN is not set
>>># CONFIG_TOUCHSCREEN_ELO is not set
>>>CONFIG_TOUCHSCREEN_WACOM_W8001=3Dm
>>>CONFIG_TOUCHSCREEN_WACOM_I2C=3Dm
>>># CONFIG_TOUCHSCREEN_MAX11801 is not set
>>># CONFIG_TOUCHSCREEN_MCS5000 is not set
>>># CONFIG_TOUCHSCREEN_MMS114 is not set
>>># CONFIG_TOUCHSCREEN_MELFAS_MIP4 is not set
>>># CONFIG_TOUCHSCREEN_MTOUCH is not set
>>># CONFIG_TOUCHSCREEN_INEXIO is not set
>>># CONFIG_TOUCHSCREEN_MK712 is not set
>>># CONFIG_TOUCHSCREEN_PENMOUNT is not set
>>># CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
>>># CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
>>># CONFIG_TOUCHSCREEN_TOUCHWIN is not set
>>># CONFIG_TOUCHSCREEN_PIXCIR is not set
>>># CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
>>># CONFIG_TOUCHSCREEN_WM97XX is not set
>>># CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
>>># CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
>>># CONFIG_TOUCHSCREEN_TSC_SERIO is not set
>>># CONFIG_TOUCHSCREEN_TSC2004 is not set
>>># CONFIG_TOUCHSCREEN_TSC2005 is not set
>>># CONFIG_TOUCHSCREEN_TSC2007 is not set
>>># CONFIG_TOUCHSCREEN_RM_TS is not set
>>># CONFIG_TOUCHSCREEN_SILEAD is not set
>>># CONFIG_TOUCHSCREEN_SIS_I2C is not set
>>># CONFIG_TOUCHSCREEN_ST1232 is not set
>>># CONFIG_TOUCHSCREEN_SUR40 is not set
>>># CONFIG_TOUCHSCREEN_SURFACE3_SPI is not set
>>># CONFIG_TOUCHSCREEN_SX8654 is not set
>>># CONFIG_TOUCHSCREEN_TPS6507X is not set
>>># CONFIG_TOUCHSCREEN_ZFORCE is not set
>>># CONFIG_TOUCHSCREEN_ROHM_BU21023 is not set
>>>CONFIG_INPUT_MISC=3Dy
>>># CONFIG_INPUT_AD714X is not set
>>># CONFIG_INPUT_BMA150 is not set
>>># CONFIG_INPUT_E3X0_BUTTON is not set
>>>CONFIG_INPUT_PCSPKR=3Dm
>>># CONFIG_INPUT_MMA8450 is not set
>>># CONFIG_INPUT_MPU3050 is not set
>>>CONFIG_INPUT_APANEL=3Dm
>>># CONFIG_INPUT_GP2A is not set
>>># CONFIG_INPUT_GPIO_BEEPER is not set
>>># CONFIG_INPUT_GPIO_TILT_POLLED is not set
>>>CONFIG_INPUT_ATLAS_BTNS=3Dm
>>>CONFIG_INPUT_ATI_REMOTE2=3Dm
>>>CONFIG_INPUT_KEYSPAN_REMOTE=3Dm
>>># CONFIG_INPUT_KXTJ9 is not set
>>>CONFIG_INPUT_POWERMATE=3Dm
>>>CONFIG_INPUT_YEALINK=3Dm
>>>CONFIG_INPUT_CM109=3Dm
>>>CONFIG_INPUT_UINPUT=3Dm
>>># CONFIG_INPUT_PCF8574 is not set
>>># CONFIG_INPUT_PWM_BEEPER is not set
>>># CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
>>># CONFIG_INPUT_ADXL34X is not set
>>># CONFIG_INPUT_IMS_PCU is not set
>>># CONFIG_INPUT_CMA3000 is not set
>>>CONFIG_INPUT_XEN_KBDDEV_FRONTEND=3Dm
>>># CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
>>># CONFIG_INPUT_DRV260X_HAPTICS is not set
>>># CONFIG_INPUT_DRV2665_HAPTICS is not set
>>># CONFIG_INPUT_DRV2667_HAPTICS is not set
>>># CONFIG_RMI4_CORE is not set
>>>
>>>#
>>># Hardware I/O ports
>>>#
>>>CONFIG_SERIO=3Dy
>>>CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
>>>CONFIG_SERIO_I8042=3Dy
>>>CONFIG_SERIO_SERPORT=3Dy
>>># CONFIG_SERIO_CT82C710 is not set
>>># CONFIG_SERIO_PARKBD is not set
>>># CONFIG_SERIO_PCIPS2 is not set
>>>CONFIG_SERIO_LIBPS2=3Dy
>>>CONFIG_SERIO_RAW=3Dm
>>>CONFIG_SERIO_ALTERA_PS2=3Dm
>>># CONFIG_SERIO_PS2MULT is not set
>>>CONFIG_SERIO_ARC_PS2=3Dm
>>>CONFIG_HYPERV_KEYBOARD=3Dm
>>># CONFIG_USERIO is not set
>>># CONFIG_GAMEPORT is not set
>>>
>>>#
>>># Character devices
>>>#
>>>CONFIG_TTY=3Dy
>>>CONFIG_VT=3Dy
>>>CONFIG_CONSOLE_TRANSLATIONS=3Dy
>>>CONFIG_VT_CONSOLE=3Dy
>>>CONFIG_VT_CONSOLE_SLEEP=3Dy
>>>CONFIG_HW_CONSOLE=3Dy
>>>CONFIG_VT_HW_CONSOLE_BINDING=3Dy
>>>CONFIG_UNIX98_PTYS=3Dy
>>># CONFIG_LEGACY_PTYS is not set
>>>CONFIG_SERIAL_NONSTANDARD=3Dy
>>># CONFIG_ROCKETPORT is not set
>>>CONFIG_CYCLADES=3Dm
>>># CONFIG_CYZ_INTR is not set
>>>CONFIG_MOXA_INTELLIO=3Dm
>>>CONFIG_MOXA_SMARTIO=3Dm
>>>CONFIG_SYNCLINK=3Dm
>>>CONFIG_SYNCLINKMP=3Dm
>>>CONFIG_SYNCLINK_GT=3Dm
>>>CONFIG_NOZOMI=3Dm
>>># CONFIG_ISI is not set
>>>CONFIG_N_HDLC=3Dm
>>>CONFIG_N_GSM=3Dm
>>># CONFIG_TRACE_SINK is not set
>>>CONFIG_DEVMEM=3Dy
>>># CONFIG_DEVKMEM is not set
>>>
>>>#
>>># Serial drivers
>>>#
>>>CONFIG_SERIAL_EARLYCON=3Dy
>>>CONFIG_SERIAL_8250=3Dy
>>># CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
>>>CONFIG_SERIAL_8250_PNP=3Dy
>>># CONFIG_SERIAL_8250_FINTEK is not set
>>>CONFIG_SERIAL_8250_CONSOLE=3Dy
>>>CONFIG_SERIAL_8250_DMA=3Dy
>>>CONFIG_SERIAL_8250_PCI=3Dy
>>>CONFIG_SERIAL_8250_NR_UARTS=3D32
>>>CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
>>>CONFIG_SERIAL_8250_EXTENDED=3Dy
>>>CONFIG_SERIAL_8250_MANY_PORTS=3Dy
>>>CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
>>># CONFIG_SERIAL_8250_DETECT_IRQ is not set
>>>CONFIG_SERIAL_8250_RSA=3Dy
>>># CONFIG_SERIAL_8250_FSL is not set
>>>CONFIG_SERIAL_8250_DW=3Dy
>>># CONFIG_SERIAL_8250_RT288X is not set
>>>CONFIG_SERIAL_8250_MID=3Dy
>>># CONFIG_SERIAL_8250_MOXA is not set
>>>
>>>#
>>># Non-8250 serial port support
>>>#
>>># CONFIG_SERIAL_MAX3100 is not set
>>># CONFIG_SERIAL_MAX310X is not set
>>># CONFIG_SERIAL_UARTLITE is not set
>>>CONFIG_SERIAL_CORE=3Dy
>>>CONFIG_SERIAL_CORE_CONSOLE=3Dy
>>>CONFIG_SERIAL_JSM=3Dm
>>># CONFIG_SERIAL_SCCNXP is not set
>>># CONFIG_SERIAL_SC16IS7XX is not set
>>># CONFIG_SERIAL_ALTERA_JTAGUART is not set
>>># CONFIG_SERIAL_ALTERA_UART is not set
>>># CONFIG_SERIAL_IFX6X60 is not set
>>>CONFIG_SERIAL_ARC=3Dm
>>>CONFIG_SERIAL_ARC_NR_PORTS=3D1
>>># CONFIG_SERIAL_RP2 is not set
>>># CONFIG_SERIAL_FSL_LPUART is not set
>>>CONFIG_SERIAL_MCTRL_GPIO=3Dy
>>>CONFIG_PRINTER=3Dm
>>># CONFIG_LP_CONSOLE is not set
>>>CONFIG_PPDEV=3Dm
>>>CONFIG_HVC_DRIVER=3Dy
>>>CONFIG_HVC_IRQ=3Dy
>>>CONFIG_HVC_XEN=3Dy
>>>CONFIG_HVC_XEN_FRONTEND=3Dy
>>>CONFIG_VIRTIO_CONSOLE=3Dy
>>>CONFIG_IPMI_HANDLER=3Dm
>>># CONFIG_IPMI_PANIC_EVENT is not set
>>>CONFIG_IPMI_DEVICE_INTERFACE=3Dm
>>>CONFIG_IPMI_SI=3Dm
>>># CONFIG_IPMI_SSIF is not set
>>>CONFIG_IPMI_WATCHDOG=3Dm
>>>CONFIG_IPMI_POWEROFF=3Dm
>>>CONFIG_HW_RANDOM=3Dy
>>>CONFIG_HW_RANDOM_TIMERIOMEM=3Dm
>>>CONFIG_HW_RANDOM_INTEL=3Dm
>>>CONFIG_HW_RANDOM_AMD=3Dm
>>>CONFIG_HW_RANDOM_VIA=3Dm
>>>CONFIG_HW_RANDOM_VIRTIO=3Dy
>>>CONFIG_HW_RANDOM_TPM=3Dm
>>>CONFIG_NVRAM=3Dy
>>># CONFIG_R3964 is not set
>>># CONFIG_APPLICOM is not set
>>># CONFIG_MWAVE is not set
>>>CONFIG_RAW_DRIVER=3Dy
>>>CONFIG_MAX_RAW_DEVS=3D8192
>>>CONFIG_HPET=3Dy
>>>CONFIG_HPET_MMAP=3Dy
>>># CONFIG_HPET_MMAP_DEFAULT is not set
>>>CONFIG_HANGCHECK_TIMER=3Dm
>>>CONFIG_UV_MMTIMER=3Dm
>>>CONFIG_TCG_TPM=3Dy
>>>CONFIG_TCG_TIS_CORE=3Dy
>>>CONFIG_TCG_TIS=3Dy
>>># CONFIG_TCG_TIS_SPI is not set
>>># CONFIG_TCG_TIS_I2C_ATMEL is not set
>>># CONFIG_TCG_TIS_I2C_INFINEON is not set
>>># CONFIG_TCG_TIS_I2C_NUVOTON is not set
>>>CONFIG_TCG_NSC=3Dm
>>>CONFIG_TCG_ATMEL=3Dm
>>>CONFIG_TCG_INFINEON=3Dm
>>># CONFIG_TCG_XEN is not set
>>># CONFIG_TCG_CRB is not set
>>># CONFIG_TCG_VTPM_PROXY is not set
>>># CONFIG_TCG_TIS_ST33ZP24_I2C is not set
>>># CONFIG_TCG_TIS_ST33ZP24_SPI is not set
>>>CONFIG_TELCLOCK=3Dm
>>>CONFIG_DEVPORT=3Dy
>>># CONFIG_XILLYBUS is not set
>>>
>>>#
>>># I2C support
>>>#
>>>CONFIG_I2C=3Dy
>>>CONFIG_ACPI_I2C_OPREGION=3Dy
>>>CONFIG_I2C_BOARDINFO=3Dy
>>>CONFIG_I2C_COMPAT=3Dy
>>>CONFIG_I2C_CHARDEV=3Dm
>>>CONFIG_I2C_MUX=3Dm
>>>
>>>#
>>># Multiplexer I2C Chip support
>>>#
>>># CONFIG_I2C_MUX_GPIO is not set
>>># CONFIG_I2C_MUX_PCA9541 is not set
>>># CONFIG_I2C_MUX_PCA954x is not set
>>># CONFIG_I2C_MUX_PINCTRL is not set
>>># CONFIG_I2C_MUX_REG is not set
>>>CONFIG_I2C_HELPER_AUTO=3Dy
>>>CONFIG_I2C_SMBUS=3Dy
>>>CONFIG_I2C_ALGOBIT=3Dy
>>>CONFIG_I2C_ALGOPCA=3Dm
>>>
>>>#
>>># I2C Hardware Bus support
>>>#
>>>
>>>#
>>># PC SMBus host controller drivers
>>>#
>>># CONFIG_I2C_ALI1535 is not set
>>># CONFIG_I2C_ALI1563 is not set
>>># CONFIG_I2C_ALI15X3 is not set
>>>CONFIG_I2C_AMD756=3Dm
>>>CONFIG_I2C_AMD756_S4882=3Dm
>>>CONFIG_I2C_AMD8111=3Dm
>>>CONFIG_I2C_I801=3Dy
>>>CONFIG_I2C_ISCH=3Dm
>>>CONFIG_I2C_ISMT=3Dm
>>>CONFIG_I2C_PIIX4=3Dm
>>>CONFIG_I2C_NFORCE2=3Dm
>>>CONFIG_I2C_NFORCE2_S4985=3Dm
>>># CONFIG_I2C_SIS5595 is not set
>>># CONFIG_I2C_SIS630 is not set
>>>CONFIG_I2C_SIS96X=3Dm
>>>CONFIG_I2C_VIA=3Dm
>>>CONFIG_I2C_VIAPRO=3Dm
>>>
>>>#
>>># ACPI drivers
>>>#
>>>CONFIG_I2C_SCMI=3Dm
>>>
>>>#
>>># I2C system bus drivers (mostly embedded / system-on-chip)
>>>#
>>># CONFIG_I2C_CBUS_GPIO is not set
>>>CONFIG_I2C_DESIGNWARE_CORE=3Dm
>>>CONFIG_I2C_DESIGNWARE_PLATFORM=3Dm
>>>CONFIG_I2C_DESIGNWARE_PCI=3Dm
>>># CONFIG_I2C_DESIGNWARE_BAYTRAIL is not set
>>># CONFIG_I2C_EMEV2 is not set
>>># CONFIG_I2C_GPIO is not set
>>># CONFIG_I2C_OCORES is not set
>>>CONFIG_I2C_PCA_PLATFORM=3Dm
>>># CONFIG_I2C_PXA_PCI is not set
>>>CONFIG_I2C_SIMTEC=3Dm
>>># CONFIG_I2C_XILINX is not set
>>>
>>>#
>>># External I2C/SMBus adapter drivers
>>>#
>>>CONFIG_I2C_DIOLAN_U2C=3Dm
>>>CONFIG_I2C_PARPORT=3Dm
>>>CONFIG_I2C_PARPORT_LIGHT=3Dm
>>># CONFIG_I2C_ROBOTFUZZ_OSIF is not set
>>># CONFIG_I2C_TAOS_EVM is not set
>>>CONFIG_I2C_TINY_USB=3Dm
>>>CONFIG_I2C_VIPERBOARD=3Dm
>>>
>>>#
>>># Other I2C/SMBus bus drivers
>>>#
>>>CONFIG_I2C_STUB=3Dm
>>># CONFIG_I2C_SLAVE is not set
>>># CONFIG_I2C_DEBUG_CORE is not set
>>># CONFIG_I2C_DEBUG_ALGO is not set
>>># CONFIG_I2C_DEBUG_BUS is not set
>>>CONFIG_SPI=3Dy
>>># CONFIG_SPI_DEBUG is not set
>>>CONFIG_SPI_MASTER=3Dy
>>>
>>>#
>>># SPI Master Controller Drivers
>>>#
>>># CONFIG_SPI_ALTERA is not set
>>># CONFIG_SPI_AXI_SPI_ENGINE is not set
>>># CONFIG_SPI_BITBANG is not set
>>># CONFIG_SPI_BUTTERFLY is not set
>>># CONFIG_SPI_CADENCE is not set
>>>CONFIG_SPI_DESIGNWARE=3Dm
>>># CONFIG_SPI_DW_PCI is not set
>>># CONFIG_SPI_DW_MMIO is not set
>>># CONFIG_SPI_GPIO is not set
>>># CONFIG_SPI_LM70_LLP is not set
>>># CONFIG_SPI_OC_TINY is not set
>>>CONFIG_SPI_PXA2XX=3Dm
>>>CONFIG_SPI_PXA2XX_PCI=3Dm
>>># CONFIG_SPI_ROCKCHIP is not set
>>># CONFIG_SPI_SC18IS602 is not set
>>># CONFIG_SPI_XCOMM is not set
>>># CONFIG_SPI_XILINX is not set
>>># CONFIG_SPI_ZYNQMP_GQSPI is not set
>>>
>>>#
>>># SPI Protocol Masters
>>>#
>>># CONFIG_SPI_SPIDEV is not set
>>># CONFIG_SPI_LOOPBACK_TEST is not set
>>># CONFIG_SPI_TLE62X0 is not set
>>># CONFIG_SPMI is not set
>>># CONFIG_HSI is not set
>>>
>>>#
>>># PPS support
>>>#
>>>CONFIG_PPS=3Dy
>>># CONFIG_PPS_DEBUG is not set
>>>
>>>#
>>># PPS clients support
>>>#
>>># CONFIG_PPS_CLIENT_KTIMER is not set
>>>CONFIG_PPS_CLIENT_LDISC=3Dm
>>>CONFIG_PPS_CLIENT_PARPORT=3Dm
>>>CONFIG_PPS_CLIENT_GPIO=3Dm
>>>
>>>#
>>># PPS generators support
>>>#
>>>
>>>#
>>># PTP clock support
>>>#
>>>CONFIG_PTP_1588_CLOCK=3Dy
>>>CONFIG_DP83640_PHY=3Dm
>>>CONFIG_PINCTRL=3Dy
>>>
>>>#
>>># Pin controllers
>>>#
>>>CONFIG_PINMUX=3Dy
>>>CONFIG_PINCONF=3Dy
>>>CONFIG_GENERIC_PINCONF=3Dy
>>># CONFIG_DEBUG_PINCTRL is not set
>>># CONFIG_PINCTRL_AMD is not set
>>>CONFIG_PINCTRL_BAYTRAIL=3Dy
>>># CONFIG_PINCTRL_CHERRYVIEW is not set
>>># CONFIG_PINCTRL_BROXTON is not set
>>># CONFIG_PINCTRL_SUNRISEPOINT is not set
>>>CONFIG_GPIOLIB=3Dy
>>>CONFIG_GPIO_DEVRES=3Dy
>>>CONFIG_GPIO_ACPI=3Dy
>>>CONFIG_GPIOLIB_IRQCHIP=3Dy
>>># CONFIG_DEBUG_GPIO is not set
>>>CONFIG_GPIO_SYSFS=3Dy
>>>
>>>#
>>># Memory mapped GPIO drivers
>>>#
>>># CONFIG_GPIO_AMDPT is not set
>>># CONFIG_GPIO_DWAPB is not set
>>># CONFIG_GPIO_GENERIC_PLATFORM is not set
>>># CONFIG_GPIO_ICH is not set
>>>CONFIG_GPIO_LYNXPOINT=3Dm
>>># CONFIG_GPIO_VX855 is not set
>>># CONFIG_GPIO_ZX is not set
>>>
>>>#
>>># Port-mapped I/O GPIO drivers
>>>#
>>># CONFIG_GPIO_F7188X is not set
>>># CONFIG_GPIO_IT87 is not set
>>># CONFIG_GPIO_SCH is not set
>>># CONFIG_GPIO_SCH311X is not set
>>>
>>>#
>>># I2C GPIO expanders
>>>#
>>># CONFIG_GPIO_ADP5588 is not set
>>># CONFIG_GPIO_MAX7300 is not set
>>># CONFIG_GPIO_MAX732X is not set
>>># CONFIG_GPIO_PCA953X is not set
>>># CONFIG_GPIO_PCF857X is not set
>>># CONFIG_GPIO_SX150X is not set
>>># CONFIG_GPIO_TPIC2810 is not set
>>>
>>>#
>>># MFD GPIO expanders
>>>#
>>>
>>>#
>>># PCI GPIO expanders
>>>#
>>># CONFIG_GPIO_AMD8111 is not set
>>># CONFIG_GPIO_ML_IOH is not set
>>># CONFIG_GPIO_RDC321X is not set
>>>
>>>#
>>># SPI GPIO expanders
>>>#
>>># CONFIG_GPIO_MAX7301 is not set
>>># CONFIG_GPIO_MC33880 is not set
>>># CONFIG_GPIO_PISOSR is not set
>>>
>>>#
>>># SPI or I2C GPIO expanders
>>>#
>>># CONFIG_GPIO_MCP23S08 is not set
>>>
>>>#
>>># USB GPIO expanders
>>>#
>>># CONFIG_GPIO_VIPERBOARD is not set
>>># CONFIG_W1 is not set
>>>CONFIG_POWER_SUPPLY=3Dy
>>># CONFIG_POWER_SUPPLY_DEBUG is not set
>>># CONFIG_PDA_POWER is not set
>>># CONFIG_TEST_POWER is not set
>>># CONFIG_BATTERY_DS2780 is not set
>>># CONFIG_BATTERY_DS2781 is not set
>>># CONFIG_BATTERY_DS2782 is not set
>>># CONFIG_BATTERY_SBS is not set
>>># CONFIG_BATTERY_BQ27XXX is not set
>>># CONFIG_BATTERY_MAX17040 is not set
>>># CONFIG_BATTERY_MAX17042 is not set
>>># CONFIG_CHARGER_ISP1704 is not set
>>># CONFIG_CHARGER_MAX8903 is not set
>>># CONFIG_CHARGER_LP8727 is not set
>>># CONFIG_CHARGER_GPIO is not set
>>># CONFIG_CHARGER_BQ2415X is not set
>>># CONFIG_CHARGER_BQ24190 is not set
>>># CONFIG_CHARGER_BQ24257 is not set
>>># CONFIG_CHARGER_BQ24735 is not set
>>># CONFIG_CHARGER_BQ25890 is not set
>>>CONFIG_CHARGER_SMB347=3Dm
>>># CONFIG_BATTERY_GAUGE_LTC2941 is not set
>>># CONFIG_CHARGER_RT9455 is not set
>>>CONFIG_POWER_RESET=3Dy
>>># CONFIG_POWER_RESET_RESTART is not set
>>># CONFIG_POWER_AVS is not set
>>>CONFIG_HWMON=3Dy
>>>CONFIG_HWMON_VID=3Dm
>>># CONFIG_HWMON_DEBUG_CHIP is not set
>>>
>>>#
>>># Native drivers
>>>#
>>>CONFIG_SENSORS_ABITUGURU=3Dm
>>>CONFIG_SENSORS_ABITUGURU3=3Dm
>>># CONFIG_SENSORS_AD7314 is not set
>>>CONFIG_SENSORS_AD7414=3Dm
>>>CONFIG_SENSORS_AD7418=3Dm
>>>CONFIG_SENSORS_ADM1021=3Dm
>>>CONFIG_SENSORS_ADM1025=3Dm
>>>CONFIG_SENSORS_ADM1026=3Dm
>>>CONFIG_SENSORS_ADM1029=3Dm
>>>CONFIG_SENSORS_ADM1031=3Dm
>>>CONFIG_SENSORS_ADM9240=3Dm
>>>CONFIG_SENSORS_ADT7X10=3Dm
>>># CONFIG_SENSORS_ADT7310 is not set
>>>CONFIG_SENSORS_ADT7410=3Dm
>>>CONFIG_SENSORS_ADT7411=3Dm
>>>CONFIG_SENSORS_ADT7462=3Dm
>>>CONFIG_SENSORS_ADT7470=3Dm
>>>CONFIG_SENSORS_ADT7475=3Dm
>>>CONFIG_SENSORS_ASC7621=3Dm
>>>CONFIG_SENSORS_K8TEMP=3Dm
>>>CONFIG_SENSORS_K10TEMP=3Dm
>>>CONFIG_SENSORS_FAM15H_POWER=3Dm
>>>CONFIG_SENSORS_APPLESMC=3Dm
>>>CONFIG_SENSORS_ASB100=3Dm
>>>CONFIG_SENSORS_ATXP1=3Dm
>>>CONFIG_SENSORS_DS620=3Dm
>>>CONFIG_SENSORS_DS1621=3Dm
>>>CONFIG_SENSORS_DELL_SMM=3Dm
>>>CONFIG_SENSORS_I5K_AMB=3Dm
>>>CONFIG_SENSORS_F71805F=3Dm
>>>CONFIG_SENSORS_F71882FG=3Dm
>>>CONFIG_SENSORS_F75375S=3Dm
>>>CONFIG_SENSORS_FSCHMD=3Dm
>>># CONFIG_SENSORS_FTSTEUTATES is not set
>>>CONFIG_SENSORS_GL518SM=3Dm
>>>CONFIG_SENSORS_GL520SM=3Dm
>>>CONFIG_SENSORS_G760A=3Dm
>>># CONFIG_SENSORS_G762 is not set
>>># CONFIG_SENSORS_GPIO_FAN is not set
>>># CONFIG_SENSORS_HIH6130 is not set
>>>CONFIG_SENSORS_IBMAEM=3Dm
>>>CONFIG_SENSORS_IBMPEX=3Dm
>>># CONFIG_SENSORS_I5500 is not set
>>>CONFIG_SENSORS_CORETEMP=3Dm
>>>CONFIG_SENSORS_IT87=3Dm
>>># CONFIG_SENSORS_JC42 is not set
>>># CONFIG_SENSORS_POWR1220 is not set
>>>CONFIG_SENSORS_LINEAGE=3Dm
>>># CONFIG_SENSORS_LTC2945 is not set
>>># CONFIG_SENSORS_LTC2990 is not set
>>>CONFIG_SENSORS_LTC4151=3Dm
>>>CONFIG_SENSORS_LTC4215=3Dm
>>># CONFIG_SENSORS_LTC4222 is not set
>>>CONFIG_SENSORS_LTC4245=3Dm
>>># CONFIG_SENSORS_LTC4260 is not set
>>>CONFIG_SENSORS_LTC4261=3Dm
>>># CONFIG_SENSORS_MAX1111 is not set
>>>CONFIG_SENSORS_MAX16065=3Dm
>>>CONFIG_SENSORS_MAX1619=3Dm
>>>CONFIG_SENSORS_MAX1668=3Dm
>>>CONFIG_SENSORS_MAX197=3Dm
>>># CONFIG_SENSORS_MAX31722 is not set
>>>CONFIG_SENSORS_MAX6639=3Dm
>>>CONFIG_SENSORS_MAX6642=3Dm
>>>CONFIG_SENSORS_MAX6650=3Dm
>>>CONFIG_SENSORS_MAX6697=3Dm
>>># CONFIG_SENSORS_MAX31790 is not set
>>>CONFIG_SENSORS_MCP3021=3Dm
>>># CONFIG_SENSORS_ADCXX is not set
>>>CONFIG_SENSORS_LM63=3Dm
>>># CONFIG_SENSORS_LM70 is not set
>>>CONFIG_SENSORS_LM73=3Dm
>>>CONFIG_SENSORS_LM75=3Dm
>>>CONFIG_SENSORS_LM77=3Dm
>>>CONFIG_SENSORS_LM78=3Dm
>>>CONFIG_SENSORS_LM80=3Dm
>>>CONFIG_SENSORS_LM83=3Dm
>>>CONFIG_SENSORS_LM85=3Dm
>>>CONFIG_SENSORS_LM87=3Dm
>>>CONFIG_SENSORS_LM90=3Dm
>>>CONFIG_SENSORS_LM92=3Dm
>>>CONFIG_SENSORS_LM93=3Dm
>>>CONFIG_SENSORS_LM95234=3Dm
>>>CONFIG_SENSORS_LM95241=3Dm
>>>CONFIG_SENSORS_LM95245=3Dm
>>>CONFIG_SENSORS_PC87360=3Dm
>>>CONFIG_SENSORS_PC87427=3Dm
>>>CONFIG_SENSORS_NTC_THERMISTOR=3Dm
>>># CONFIG_SENSORS_NCT6683 is not set
>>>CONFIG_SENSORS_NCT6775=3Dm
>>># CONFIG_SENSORS_NCT7802 is not set
>>># CONFIG_SENSORS_NCT7904 is not set
>>>CONFIG_SENSORS_PCF8591=3Dm
>>>CONFIG_PMBUS=3Dm
>>>CONFIG_SENSORS_PMBUS=3Dm
>>>CONFIG_SENSORS_ADM1275=3Dm
>>>CONFIG_SENSORS_LM25066=3Dm
>>>CONFIG_SENSORS_LTC2978=3Dm
>>># CONFIG_SENSORS_LTC3815 is not set
>>>CONFIG_SENSORS_MAX16064=3Dm
>>># CONFIG_SENSORS_MAX20751 is not set
>>>CONFIG_SENSORS_MAX34440=3Dm
>>>CONFIG_SENSORS_MAX8688=3Dm
>>># CONFIG_SENSORS_TPS40422 is not set
>>>CONFIG_SENSORS_UCD9000=3Dm
>>>CONFIG_SENSORS_UCD9200=3Dm
>>>CONFIG_SENSORS_ZL6100=3Dm
>>># CONFIG_SENSORS_SHT15 is not set
>>>CONFIG_SENSORS_SHT21=3Dm
>>># CONFIG_SENSORS_SHT3x is not set
>>># CONFIG_SENSORS_SHTC1 is not set
>>>CONFIG_SENSORS_SIS5595=3Dm
>>>CONFIG_SENSORS_DME1737=3Dm
>>>CONFIG_SENSORS_EMC1403=3Dm
>>># CONFIG_SENSORS_EMC2103 is not set
>>>CONFIG_SENSORS_EMC6W201=3Dm
>>>CONFIG_SENSORS_SMSC47M1=3Dm
>>>CONFIG_SENSORS_SMSC47M192=3Dm
>>>CONFIG_SENSORS_SMSC47B397=3Dm
>>>CONFIG_SENSORS_SCH56XX_COMMON=3Dm
>>>CONFIG_SENSORS_SCH5627=3Dm
>>>CONFIG_SENSORS_SCH5636=3Dm
>>># CONFIG_SENSORS_SMM665 is not set
>>># CONFIG_SENSORS_ADC128D818 is not set
>>>CONFIG_SENSORS_ADS1015=3Dm
>>>CONFIG_SENSORS_ADS7828=3Dm
>>># CONFIG_SENSORS_ADS7871 is not set
>>>CONFIG_SENSORS_AMC6821=3Dm
>>>CONFIG_SENSORS_INA209=3Dm
>>>CONFIG_SENSORS_INA2XX=3Dm
>>># CONFIG_SENSORS_INA3221 is not set
>>># CONFIG_SENSORS_TC74 is not set
>>>CONFIG_SENSORS_THMC50=3Dm
>>>CONFIG_SENSORS_TMP102=3Dm
>>># CONFIG_SENSORS_TMP103 is not set
>>>CONFIG_SENSORS_TMP401=3Dm
>>>CONFIG_SENSORS_TMP421=3Dm
>>>CONFIG_SENSORS_VIA_CPUTEMP=3Dm
>>>CONFIG_SENSORS_VIA686A=3Dm
>>>CONFIG_SENSORS_VT1211=3Dm
>>>CONFIG_SENSORS_VT8231=3Dm
>>>CONFIG_SENSORS_W83781D=3Dm
>>>CONFIG_SENSORS_W83791D=3Dm
>>>CONFIG_SENSORS_W83792D=3Dm
>>>CONFIG_SENSORS_W83793=3Dm
>>>CONFIG_SENSORS_W83795=3Dm
>>># CONFIG_SENSORS_W83795_FANCTRL is not set
>>>CONFIG_SENSORS_W83L785TS=3Dm
>>>CONFIG_SENSORS_W83L786NG=3Dm
>>>CONFIG_SENSORS_W83627HF=3Dm
>>>CONFIG_SENSORS_W83627EHF=3Dm
>>>
>>>#
>>># ACPI drivers
>>>#
>>>CONFIG_SENSORS_ACPI_POWER=3Dm
>>>CONFIG_SENSORS_ATK0110=3Dm
>>>CONFIG_THERMAL=3Dy
>>>CONFIG_THERMAL_HWMON=3Dy
>>>CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
>>>CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
>>># CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
>>># CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
>>># CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
>>>CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
>>>CONFIG_THERMAL_GOV_STEP_WISE=3Dy
>>>CONFIG_THERMAL_GOV_BANG_BANG=3Dy
>>>CONFIG_THERMAL_GOV_USER_SPACE=3Dy
>>># CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
>>># CONFIG_THERMAL_EMULATION is not set
>>>CONFIG_INTEL_POWERCLAMP=3Dm
>>>CONFIG_X86_PKG_TEMP_THERMAL=3Dm
>>># CONFIG_INTEL_SOC_DTS_THERMAL is not set
>>>
>>>#
>>># ACPI INT340X thermal drivers
>>>#
>>># CONFIG_INT340X_THERMAL is not set
>>>CONFIG_INTEL_PCH_THERMAL=3Dm
>>>CONFIG_WATCHDOG=3Dy
>>>CONFIG_WATCHDOG_CORE=3Dy
>>># CONFIG_WATCHDOG_NOWAYOUT is not set
>>># CONFIG_WATCHDOG_SYSFS is not set
>>>
>>>#
>>># Watchdog Device Drivers
>>>#
>>>CONFIG_SOFT_WATCHDOG=3Dm
>>># CONFIG_XILINX_WATCHDOG is not set
>>># CONFIG_ZIIRAVE_WATCHDOG is not set
>>># CONFIG_CADENCE_WATCHDOG is not set
>>># CONFIG_DW_WATCHDOG is not set
>>># CONFIG_MAX63XX_WATCHDOG is not set
>>># CONFIG_ACQUIRE_WDT is not set
>>># CONFIG_ADVANTECH_WDT is not set
>>>CONFIG_ALIM1535_WDT=3Dm
>>>CONFIG_ALIM7101_WDT=3Dm
>>>CONFIG_F71808E_WDT=3Dm
>>>CONFIG_SP5100_TCO=3Dm
>>>CONFIG_SBC_FITPC2_WATCHDOG=3Dm
>>># CONFIG_EUROTECH_WDT is not set
>>>CONFIG_IB700_WDT=3Dm
>>>CONFIG_IBMASR=3Dm
>>># CONFIG_WAFER_WDT is not set
>>>CONFIG_I6300ESB_WDT=3Dy
>>>CONFIG_IE6XX_WDT=3Dm
>>>CONFIG_ITCO_WDT=3Dy
>>>CONFIG_ITCO_VENDOR_SUPPORT=3Dy
>>>CONFIG_IT8712F_WDT=3Dm
>>>CONFIG_IT87_WDT=3Dm
>>>CONFIG_HP_WATCHDOG=3Dm
>>>CONFIG_HPWDT_NMI_DECODING=3Dy
>>># CONFIG_SC1200_WDT is not set
>>># CONFIG_PC87413_WDT is not set
>>>CONFIG_NV_TCO=3Dm
>>># CONFIG_60XX_WDT is not set
>>># CONFIG_CPU5_WDT is not set
>>>CONFIG_SMSC_SCH311X_WDT=3Dm
>>># CONFIG_SMSC37B787_WDT is not set
>>>CONFIG_VIA_WDT=3Dm
>>>CONFIG_W83627HF_WDT=3Dm
>>>CONFIG_W83877F_WDT=3Dm
>>>CONFIG_W83977F_WDT=3Dm
>>>CONFIG_MACHZ_WDT=3Dm
>>># CONFIG_SBC_EPX_C3_WATCHDOG is not set
>>># CONFIG_INTEL_MEI_WDT is not set
>>># CONFIG_NI903X_WDT is not set
>>># CONFIG_MEN_A21_WDT is not set
>>>CONFIG_XEN_WDT=3Dm
>>>
>>>#
>>># PCI-based Watchdog Cards
>>>#
>>>CONFIG_PCIPCWATCHDOG=3Dm
>>>CONFIG_WDTPCI=3Dm
>>>
>>>#
>>># USB-based Watchdog Cards
>>>#
>>>CONFIG_USBPCWATCHDOG=3Dm
>>>CONFIG_SSB_POSSIBLE=3Dy
>>>
>>>#
>>># Sonics Silicon Backplane
>>>#
>>>CONFIG_SSB=3Dm
>>>CONFIG_SSB_SPROM=3Dy
>>>CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
>>>CONFIG_SSB_PCIHOST=3Dy
>>># CONFIG_SSB_B43_PCI_BRIDGE is not set
>>>CONFIG_SSB_SDIOHOST_POSSIBLE=3Dy
>>>CONFIG_SSB_SDIOHOST=3Dy
>>># CONFIG_SSB_DEBUG is not set
>>>CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=3Dy
>>>CONFIG_SSB_DRIVER_PCICORE=3Dy
>>># CONFIG_SSB_DRIVER_GPIO is not set
>>>CONFIG_BCMA_POSSIBLE=3Dy
>>>
>>>#
>>># Broadcom specific AMBA
>>>#
>>>CONFIG_BCMA=3Dm
>>>CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
>>>CONFIG_BCMA_HOST_PCI=3Dy
>>># CONFIG_BCMA_HOST_SOC is not set
>>>CONFIG_BCMA_DRIVER_PCI=3Dy
>>>CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
>>># CONFIG_BCMA_DRIVER_GPIO is not set
>>># CONFIG_BCMA_DEBUG is not set
>>>
>>>#
>>># Multifunction device drivers
>>>#
>>>CONFIG_MFD_CORE=3Dy
>>># CONFIG_MFD_AS3711 is not set
>>># CONFIG_PMIC_ADP5520 is not set
>>># CONFIG_MFD_AAT2870_CORE is not set
>>># CONFIG_MFD_BCM590XX is not set
>>># CONFIG_MFD_AXP20X_I2C is not set
>>># CONFIG_MFD_CROS_EC is not set
>>># CONFIG_PMIC_DA903X is not set
>>># CONFIG_MFD_DA9052_SPI is not set
>>># CONFIG_MFD_DA9052_I2C is not set
>>># CONFIG_MFD_DA9055 is not set
>>># CONFIG_MFD_DA9062 is not set
>>># CONFIG_MFD_DA9063 is not set
>>># CONFIG_MFD_DA9150 is not set
>>># CONFIG_MFD_DLN2 is not set
>>># CONFIG_MFD_MC13XXX_SPI is not set
>>># CONFIG_MFD_MC13XXX_I2C is not set
>>># CONFIG_HTC_PASIC3 is not set
>>># CONFIG_HTC_I2CPLD is not set
>>># CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
>>>CONFIG_LPC_ICH=3Dy
>>>CONFIG_LPC_SCH=3Dm
>>># CONFIG_INTEL_SOC_PMIC is not set
>>># CONFIG_MFD_INTEL_LPSS_ACPI is not set
>>># CONFIG_MFD_INTEL_LPSS_PCI is not set
>>># CONFIG_MFD_JANZ_CMODIO is not set
>>># CONFIG_MFD_KEMPLD is not set
>>># CONFIG_MFD_88PM800 is not set
>>># CONFIG_MFD_88PM805 is not set
>>># CONFIG_MFD_88PM860X is not set
>>># CONFIG_MFD_MAX14577 is not set
>>># CONFIG_MFD_MAX77693 is not set
>>># CONFIG_MFD_MAX77843 is not set
>>># CONFIG_MFD_MAX8907 is not set
>>># CONFIG_MFD_MAX8925 is not set
>>># CONFIG_MFD_MAX8997 is not set
>>># CONFIG_MFD_MAX8998 is not set
>>># CONFIG_MFD_MT6397 is not set
>>># CONFIG_MFD_MENF21BMC is not set
>>># CONFIG_EZX_PCAP is not set
>>>CONFIG_MFD_VIPERBOARD=3Dm
>>># CONFIG_MFD_RETU is not set
>>># CONFIG_MFD_PCF50633 is not set
>>># CONFIG_UCB1400_CORE is not set
>>># CONFIG_MFD_RDC321X is not set
>>>CONFIG_MFD_RTSX_PCI=3Dm
>>># CONFIG_MFD_RT5033 is not set
>>># CONFIG_MFD_RTSX_USB is not set
>>># CONFIG_MFD_RC5T583 is not set
>>># CONFIG_MFD_SEC_CORE is not set
>>># CONFIG_MFD_SI476X_CORE is not set
>>>CONFIG_MFD_SM501=3Dm
>>># CONFIG_MFD_SM501_GPIO is not set
>>># CONFIG_MFD_SKY81452 is not set
>>># CONFIG_MFD_SMSC is not set
>>># CONFIG_ABX500_CORE is not set
>>># CONFIG_MFD_SYSCON is not set
>>># CONFIG_MFD_TI_AM335X_TSCADC is not set
>>># CONFIG_MFD_LP3943 is not set
>>># CONFIG_MFD_LP8788 is not set
>>># CONFIG_MFD_PALMAS is not set
>>># CONFIG_TPS6105X is not set
>>># CONFIG_TPS65010 is not set
>>># CONFIG_TPS6507X is not set
>>># CONFIG_MFD_TPS65086 is not set
>>># CONFIG_MFD_TPS65090 is not set
>>># CONFIG_MFD_TPS65217 is not set
>>># CONFIG_MFD_TPS65218 is not set
>>># CONFIG_MFD_TPS6586X is not set
>>># CONFIG_MFD_TPS65910 is not set
>>># CONFIG_MFD_TPS65912_I2C is not set
>>># CONFIG_MFD_TPS65912_SPI is not set
>>># CONFIG_MFD_TPS80031 is not set
>>># CONFIG_TWL4030_CORE is not set
>>># CONFIG_TWL6040_CORE is not set
>>># CONFIG_MFD_WL1273_CORE is not set
>>># CONFIG_MFD_LM3533 is not set
>>># CONFIG_MFD_TMIO is not set
>>>CONFIG_MFD_VX855=3Dm
>>># CONFIG_MFD_ARIZONA_I2C is not set
>>># CONFIG_MFD_ARIZONA_SPI is not set
>>># CONFIG_MFD_WM8400 is not set
>>># CONFIG_MFD_WM831X_I2C is not set
>>># CONFIG_MFD_WM831X_SPI is not set
>>># CONFIG_MFD_WM8350_I2C is not set
>>># CONFIG_MFD_WM8994 is not set
>>># CONFIG_REGULATOR is not set
>>>CONFIG_MEDIA_SUPPORT=3Dm
>>>
>>>#
>>># Multimedia core support
>>>#
>>>CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
>>>CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
>>>CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
>>>CONFIG_MEDIA_RADIO_SUPPORT=3Dy
>>># CONFIG_MEDIA_SDR_SUPPORT is not set
>>>CONFIG_MEDIA_RC_SUPPORT=3Dy
>>># CONFIG_MEDIA_CONTROLLER is not set
>>>CONFIG_VIDEO_DEV=3Dm
>>>CONFIG_VIDEO_V4L2=3Dm
>>># CONFIG_VIDEO_ADV_DEBUG is not set
>>># CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
>>>CONFIG_VIDEO_TUNER=3Dm
>>>CONFIG_VIDEOBUF_GEN=3Dm
>>>CONFIG_VIDEOBUF_DMA_SG=3Dm
>>>CONFIG_VIDEOBUF_VMALLOC=3Dm
>>>CONFIG_VIDEOBUF_DVB=3Dm
>>>CONFIG_VIDEOBUF2_CORE=3Dm
>>>CONFIG_VIDEOBUF2_MEMOPS=3Dm
>>>CONFIG_VIDEOBUF2_VMALLOC=3Dm
>>>CONFIG_VIDEOBUF2_DMA_SG=3Dm
>>>CONFIG_VIDEOBUF2_DVB=3Dm
>>>CONFIG_DVB_CORE=3Dm
>>>CONFIG_DVB_NET=3Dy
>>>CONFIG_TTPCI_EEPROM=3Dm
>>>CONFIG_DVB_MAX_ADAPTERS=3D8
>>>CONFIG_DVB_DYNAMIC_MINORS=3Dy
>>>
>>>#
>>># Media drivers
>>>#
>>>CONFIG_RC_CORE=3Dm
>>>CONFIG_RC_MAP=3Dm
>>>CONFIG_RC_DECODERS=3Dy
>>>CONFIG_LIRC=3Dm
>>>CONFIG_IR_LIRC_CODEC=3Dm
>>>CONFIG_IR_NEC_DECODER=3Dm
>>>CONFIG_IR_RC5_DECODER=3Dm
>>>CONFIG_IR_RC6_DECODER=3Dm
>>>CONFIG_IR_JVC_DECODER=3Dm
>>>CONFIG_IR_SONY_DECODER=3Dm
>>>CONFIG_IR_SANYO_DECODER=3Dm
>>>CONFIG_IR_SHARP_DECODER=3Dm
>>>CONFIG_IR_MCE_KBD_DECODER=3Dm
>>>CONFIG_IR_XMP_DECODER=3Dm
>>>CONFIG_RC_DEVICES=3Dy
>>>CONFIG_RC_ATI_REMOTE=3Dm
>>>CONFIG_IR_ENE=3Dm
>>># CONFIG_IR_HIX5HD2 is not set
>>>CONFIG_IR_IMON=3Dm
>>>CONFIG_IR_MCEUSB=3Dm
>>>CONFIG_IR_ITE_CIR=3Dm
>>>CONFIG_IR_FINTEK=3Dm
>>>CONFIG_IR_NUVOTON=3Dm
>>>CONFIG_IR_REDRAT3=3Dm
>>>CONFIG_IR_STREAMZAP=3Dm
>>>CONFIG_IR_WINBOND_CIR=3Dm
>>># CONFIG_IR_IGORPLUGUSB is not set
>>>CONFIG_IR_IGUANA=3Dm
>>>CONFIG_IR_TTUSBIR=3Dm
>>># CONFIG_RC_LOOPBACK is not set
>>>CONFIG_IR_GPIO_CIR=3Dm
>>>CONFIG_MEDIA_USB_SUPPORT=3Dy
>>>
>>>#
>>># Webcam devices
>>>#
>>>CONFIG_USB_VIDEO_CLASS=3Dm
>>>CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=3Dy
>>>CONFIG_USB_GSPCA=3Dm
>>>CONFIG_USB_M5602=3Dm
>>>CONFIG_USB_STV06XX=3Dm
>>>CONFIG_USB_GL860=3Dm
>>>CONFIG_USB_GSPCA_BENQ=3Dm
>>>CONFIG_USB_GSPCA_CONEX=3Dm
>>>CONFIG_USB_GSPCA_CPIA1=3Dm
>>># CONFIG_USB_GSPCA_DTCS033 is not set
>>>CONFIG_USB_GSPCA_ETOMS=3Dm
>>>CONFIG_USB_GSPCA_FINEPIX=3Dm
>>>CONFIG_USB_GSPCA_JEILINJ=3Dm
>>>CONFIG_USB_GSPCA_JL2005BCD=3Dm
>>># CONFIG_USB_GSPCA_KINECT is not set
>>>CONFIG_USB_GSPCA_KONICA=3Dm
>>>CONFIG_USB_GSPCA_MARS=3Dm
>>>CONFIG_USB_GSPCA_MR97310A=3Dm
>>>CONFIG_USB_GSPCA_NW80X=3Dm
>>>CONFIG_USB_GSPCA_OV519=3Dm
>>>CONFIG_USB_GSPCA_OV534=3Dm
>>>CONFIG_USB_GSPCA_OV534_9=3Dm
>>>CONFIG_USB_GSPCA_PAC207=3Dm
>>>CONFIG_USB_GSPCA_PAC7302=3Dm
>>>CONFIG_USB_GSPCA_PAC7311=3Dm
>>>CONFIG_USB_GSPCA_SE401=3Dm
>>>CONFIG_USB_GSPCA_SN9C2028=3Dm
>>>CONFIG_USB_GSPCA_SN9C20X=3Dm
>>>CONFIG_USB_GSPCA_SONIXB=3Dm
>>>CONFIG_USB_GSPCA_SONIXJ=3Dm
>>>CONFIG_USB_GSPCA_SPCA500=3Dm
>>>CONFIG_USB_GSPCA_SPCA501=3Dm
>>>CONFIG_USB_GSPCA_SPCA505=3Dm
>>>CONFIG_USB_GSPCA_SPCA506=3Dm
>>>CONFIG_USB_GSPCA_SPCA508=3Dm
>>>CONFIG_USB_GSPCA_SPCA561=3Dm
>>>CONFIG_USB_GSPCA_SPCA1528=3Dm
>>>CONFIG_USB_GSPCA_SQ905=3Dm
>>>CONFIG_USB_GSPCA_SQ905C=3Dm
>>>CONFIG_USB_GSPCA_SQ930X=3Dm
>>>CONFIG_USB_GSPCA_STK014=3Dm
>>># CONFIG_USB_GSPCA_STK1135 is not set
>>>CONFIG_USB_GSPCA_STV0680=3Dm
>>>CONFIG_USB_GSPCA_SUNPLUS=3Dm
>>>CONFIG_USB_GSPCA_T613=3Dm
>>>CONFIG_USB_GSPCA_TOPRO=3Dm
>>># CONFIG_USB_GSPCA_TOUPTEK is not set
>>>CONFIG_USB_GSPCA_TV8532=3Dm
>>>CONFIG_USB_GSPCA_VC032X=3Dm
>>>CONFIG_USB_GSPCA_VICAM=3Dm
>>>CONFIG_USB_GSPCA_XIRLINK_CIT=3Dm
>>>CONFIG_USB_GSPCA_ZC3XX=3Dm
>>>CONFIG_USB_PWC=3Dm
>>># CONFIG_USB_PWC_DEBUG is not set
>>>CONFIG_USB_PWC_INPUT_EVDEV=3Dy
>>># CONFIG_VIDEO_CPIA2 is not set
>>>CONFIG_USB_ZR364XX=3Dm
>>>CONFIG_USB_STKWEBCAM=3Dm
>>>CONFIG_USB_S2255=3Dm
>>># CONFIG_VIDEO_USBTV is not set
>>>
>>>#
>>># Analog TV USB devices
>>>#
>>>CONFIG_VIDEO_PVRUSB2=3Dm
>>>CONFIG_VIDEO_PVRUSB2_SYSFS=3Dy
>>>CONFIG_VIDEO_PVRUSB2_DVB=3Dy
>>># CONFIG_VIDEO_PVRUSB2_DEBUGIFC is not set
>>>CONFIG_VIDEO_HDPVR=3Dm
>>>CONFIG_VIDEO_USBVISION=3Dm
>>># CONFIG_VIDEO_STK1160_COMMON is not set
>>># CONFIG_VIDEO_GO7007 is not set
>>>
>>>#
>>># Analog/digital TV USB devices
>>>#
>>>CONFIG_VIDEO_AU0828=3Dm
>>>CONFIG_VIDEO_AU0828_V4L2=3Dy
>>># CONFIG_VIDEO_AU0828_RC is not set
>>>CONFIG_VIDEO_CX231XX=3Dm
>>>CONFIG_VIDEO_CX231XX_RC=3Dy
>>>CONFIG_VIDEO_CX231XX_ALSA=3Dm
>>>CONFIG_VIDEO_CX231XX_DVB=3Dm
>>>CONFIG_VIDEO_TM6000=3Dm
>>>CONFIG_VIDEO_TM6000_ALSA=3Dm
>>>CONFIG_VIDEO_TM6000_DVB=3Dm
>>>
>>>#
>>># Digital TV USB devices
>>>#
>>>CONFIG_DVB_USB=3Dm
>>># CONFIG_DVB_USB_DEBUG is not set
>>>CONFIG_DVB_USB_A800=3Dm
>>>CONFIG_DVB_USB_DIBUSB_MB=3Dm
>>># CONFIG_DVB_USB_DIBUSB_MB_FAULTY is not set
>>>CONFIG_DVB_USB_DIBUSB_MC=3Dm
>>>CONFIG_DVB_USB_DIB0700=3Dm
>>>CONFIG_DVB_USB_UMT_010=3Dm
>>>CONFIG_DVB_USB_CXUSB=3Dm
>>>CONFIG_DVB_USB_M920X=3Dm
>>>CONFIG_DVB_USB_DIGITV=3Dm
>>>CONFIG_DVB_USB_VP7045=3Dm
>>>CONFIG_DVB_USB_VP702X=3Dm
>>>CONFIG_DVB_USB_GP8PSK=3Dm
>>>CONFIG_DVB_USB_NOVA_T_USB2=3Dm
>>>CONFIG_DVB_USB_TTUSB2=3Dm
>>>CONFIG_DVB_USB_DTT200U=3Dm
>>>CONFIG_DVB_USB_OPERA1=3Dm
>>>CONFIG_DVB_USB_AF9005=3Dm
>>>CONFIG_DVB_USB_AF9005_REMOTE=3Dm
>>>CONFIG_DVB_USB_PCTV452E=3Dm
>>>CONFIG_DVB_USB_DW2102=3Dm
>>>CONFIG_DVB_USB_CINERGY_T2=3Dm
>>>CONFIG_DVB_USB_DTV5100=3Dm
>>>CONFIG_DVB_USB_FRIIO=3Dm
>>>CONFIG_DVB_USB_AZ6027=3Dm
>>>CONFIG_DVB_USB_TECHNISAT_USB2=3Dm
>>>CONFIG_DVB_USB_V2=3Dm
>>>CONFIG_DVB_USB_AF9015=3Dm
>>>CONFIG_DVB_USB_AF9035=3Dm
>>>CONFIG_DVB_USB_ANYSEE=3Dm
>>>CONFIG_DVB_USB_AU6610=3Dm
>>>CONFIG_DVB_USB_AZ6007=3Dm
>>>CONFIG_DVB_USB_CE6230=3Dm
>>>CONFIG_DVB_USB_EC168=3Dm
>>>CONFIG_DVB_USB_GL861=3Dm
>>>CONFIG_DVB_USB_LME2510=3Dm
>>>CONFIG_DVB_USB_MXL111SF=3Dm
>>>CONFIG_DVB_USB_RTL28XXU=3Dm
>>># CONFIG_DVB_USB_DVBSKY is not set
>>>CONFIG_DVB_TTUSB_BUDGET=3Dm
>>>CONFIG_DVB_TTUSB_DEC=3Dm
>>>CONFIG_SMS_USB_DRV=3Dm
>>>CONFIG_DVB_B2C2_FLEXCOP_USB=3Dm
>>># CONFIG_DVB_B2C2_FLEXCOP_USB_DEBUG is not set
>>># CONFIG_DVB_AS102 is not set
>>>
>>>#
>>># Webcam, TV (analog/digital) USB devices
>>>#
>>>CONFIG_VIDEO_EM28XX=3Dm
>>># CONFIG_VIDEO_EM28XX_V4L2 is not set
>>>CONFIG_VIDEO_EM28XX_ALSA=3Dm
>>>CONFIG_VIDEO_EM28XX_DVB=3Dm
>>>CONFIG_VIDEO_EM28XX_RC=3Dm
>>>CONFIG_MEDIA_PCI_SUPPORT=3Dy
>>>
>>>#
>>># Media capture support
>>>#
>>># CONFIG_VIDEO_MEYE is not set
>>># CONFIG_VIDEO_SOLO6X10 is not set
>>># CONFIG_VIDEO_TW68 is not set
>>># CONFIG_VIDEO_TW686X is not set
>>># CONFIG_VIDEO_ZORAN is not set
>>>
>>>#
>>># Media capture/analog TV support
>>>#
>>>CONFIG_VIDEO_IVTV=3Dm
>>># CONFIG_VIDEO_IVTV_ALSA is not set
>>>CONFIG_VIDEO_FB_IVTV=3Dm
>>># CONFIG_VIDEO_HEXIUM_GEMINI is not set
>>># CONFIG_VIDEO_HEXIUM_ORION is not set
>>># CONFIG_VIDEO_MXB is not set
>>># CONFIG_VIDEO_DT3155 is not set
>>>
>>>#
>>># Media capture/analog/hybrid TV support
>>>#
>>>CONFIG_VIDEO_CX18=3Dm
>>>CONFIG_VIDEO_CX18_ALSA=3Dm
>>>CONFIG_VIDEO_CX23885=3Dm
>>>CONFIG_MEDIA_ALTERA_CI=3Dm
>>># CONFIG_VIDEO_CX25821 is not set
>>>CONFIG_VIDEO_CX88=3Dm
>>>CONFIG_VIDEO_CX88_ALSA=3Dm
>>>CONFIG_VIDEO_CX88_BLACKBIRD=3Dm
>>>CONFIG_VIDEO_CX88_DVB=3Dm
>>>CONFIG_VIDEO_CX88_ENABLE_VP3054=3Dy
>>>CONFIG_VIDEO_CX88_VP3054=3Dm
>>>CONFIG_VIDEO_CX88_MPEG=3Dm
>>>CONFIG_VIDEO_BT848=3Dm
>>>CONFIG_DVB_BT8XX=3Dm
>>>CONFIG_VIDEO_SAA7134=3Dm
>>>CONFIG_VIDEO_SAA7134_ALSA=3Dm
>>>CONFIG_VIDEO_SAA7134_RC=3Dy
>>>CONFIG_VIDEO_SAA7134_DVB=3Dm
>>>CONFIG_VIDEO_SAA7164=3Dm
>>>
>>>#
>>># Media digital TV PCI Adapters
>>>#
>>>CONFIG_DVB_AV7110_IR=3Dy
>>>CONFIG_DVB_AV7110=3Dm
>>>CONFIG_DVB_AV7110_OSD=3Dy
>>>CONFIG_DVB_BUDGET_CORE=3Dm
>>>CONFIG_DVB_BUDGET=3Dm
>>>CONFIG_DVB_BUDGET_CI=3Dm
>>>CONFIG_DVB_BUDGET_AV=3Dm
>>>CONFIG_DVB_BUDGET_PATCH=3Dm
>>>CONFIG_DVB_B2C2_FLEXCOP_PCI=3Dm
>>># CONFIG_DVB_B2C2_FLEXCOP_PCI_DEBUG is not set
>>>CONFIG_DVB_PLUTO2=3Dm
>>>CONFIG_DVB_DM1105=3Dm
>>>CONFIG_DVB_PT1=3Dm
>>># CONFIG_DVB_PT3 is not set
>>>CONFIG_MANTIS_CORE=3Dm
>>>CONFIG_DVB_MANTIS=3Dm
>>>CONFIG_DVB_HOPPER=3Dm
>>>CONFIG_DVB_NGENE=3Dm
>>>CONFIG_DVB_DDBRIDGE=3Dm
>>># CONFIG_DVB_SMIPCIE is not set
>>># CONFIG_DVB_NETUP_UNIDVB is not set
>>># CONFIG_V4L_PLATFORM_DRIVERS is not set
>>># CONFIG_V4L_MEM2MEM_DRIVERS is not set
>>># CONFIG_V4L_TEST_DRIVERS is not set
>>># CONFIG_DVB_PLATFORM_DRIVERS is not set
>>>
>>>#
>>># Supported MMC/SDIO adapters
>>>#
>>>CONFIG_SMS_SDIO_DRV=3Dm
>>>CONFIG_RADIO_ADAPTERS=3Dy
>>>CONFIG_RADIO_TEA575X=3Dm
>>># CONFIG_RADIO_SI470X is not set
>>># CONFIG_RADIO_SI4713 is not set
>>># CONFIG_USB_MR800 is not set
>>># CONFIG_USB_DSBR is not set
>>># CONFIG_RADIO_MAXIRADIO is not set
>>># CONFIG_RADIO_SHARK is not set
>>># CONFIG_RADIO_SHARK2 is not set
>>># CONFIG_USB_KEENE is not set
>>># CONFIG_USB_RAREMONO is not set
>>># CONFIG_USB_MA901 is not set
>>># CONFIG_RADIO_TEA5764 is not set
>>># CONFIG_RADIO_SAA7706H is not set
>>># CONFIG_RADIO_TEF6862 is not set
>>># CONFIG_RADIO_WL1273 is not set
>>>
>>>#
>>># Texas Instruments WL128x FM driver (ST based)
>>>#
>>>
>>>#
>>># Supported FireWire (IEEE 1394) Adapters
>>>#
>>>CONFIG_DVB_FIREDTV=3Dm
>>>CONFIG_DVB_FIREDTV_INPUT=3Dy
>>>CONFIG_MEDIA_COMMON_OPTIONS=3Dy
>>>
>>>#
>>># common driver options
>>>#
>>>CONFIG_VIDEO_CX2341X=3Dm
>>>CONFIG_VIDEO_TVEEPROM=3Dm
>>>CONFIG_CYPRESS_FIRMWARE=3Dm
>>>CONFIG_DVB_B2C2_FLEXCOP=3Dm
>>>CONFIG_VIDEO_SAA7146=3Dm
>>>CONFIG_VIDEO_SAA7146_VV=3Dm
>>>CONFIG_SMS_SIANO_MDTV=3Dm
>>>CONFIG_SMS_SIANO_RC=3Dy
>>># CONFIG_SMS_SIANO_DEBUGFS is not set
>>>
>>>#
>>># Media ancillary drivers (tuners, sensors, i2c, frontends)
>>>#
>>>CONFIG_MEDIA_SUBDRV_AUTOSELECT=3Dy
>>>CONFIG_MEDIA_ATTACH=3Dy
>>>CONFIG_VIDEO_IR_I2C=3Dm
>>>
>>>#
>>># Audio decoders, processors and mixers
>>>#
>>>CONFIG_VIDEO_TVAUDIO=3Dm
>>>CONFIG_VIDEO_TDA7432=3Dm
>>>CONFIG_VIDEO_MSP3400=3Dm
>>>CONFIG_VIDEO_CS3308=3Dm
>>>CONFIG_VIDEO_CS5345=3Dm
>>>CONFIG_VIDEO_CS53L32A=3Dm
>>>CONFIG_VIDEO_WM8775=3Dm
>>>CONFIG_VIDEO_WM8739=3Dm
>>>CONFIG_VIDEO_VP27SMPX=3Dm
>>>
>>>#
>>># RDS decoders
>>>#
>>>CONFIG_VIDEO_SAA6588=3Dm
>>>
>>>#
>>># Video decoders
>>>#
>>>CONFIG_VIDEO_SAA711X=3Dm
>>>
>>>#
>>># Video and audio decoders
>>>#
>>>CONFIG_VIDEO_SAA717X=3Dm
>>>CONFIG_VIDEO_CX25840=3Dm
>>>
>>>#
>>># Video encoders
>>>#
>>>CONFIG_VIDEO_SAA7127=3Dm
>>>
>>>#
>>># Camera sensor devices
>>>#
>>>
>>>#
>>># Flash devices
>>>#
>>>
>>>#
>>># Video improvement chips
>>>#
>>>CONFIG_VIDEO_UPD64031A=3Dm
>>>CONFIG_VIDEO_UPD64083=3Dm
>>>
>>>#
>>># Audio/Video compression chips
>>>#
>>>CONFIG_VIDEO_SAA6752HS=3Dm
>>>
>>>#
>>># Miscellaneous helper chips
>>>#
>>>CONFIG_VIDEO_M52790=3Dm
>>>
>>>#
>>># Sensors used on soc_camera driver
>>>#
>>>CONFIG_MEDIA_TUNER=3Dm
>>>CONFIG_MEDIA_TUNER_SIMPLE=3Dm
>>>CONFIG_MEDIA_TUNER_TDA8290=3Dm
>>>CONFIG_MEDIA_TUNER_TDA827X=3Dm
>>>CONFIG_MEDIA_TUNER_TDA18271=3Dm
>>>CONFIG_MEDIA_TUNER_TDA9887=3Dm
>>>CONFIG_MEDIA_TUNER_TEA5761=3Dm
>>>CONFIG_MEDIA_TUNER_TEA5767=3Dm
>>>CONFIG_MEDIA_TUNER_MT20XX=3Dm
>>>CONFIG_MEDIA_TUNER_MT2060=3Dm
>>>CONFIG_MEDIA_TUNER_MT2063=3Dm
>>>CONFIG_MEDIA_TUNER_MT2266=3Dm
>>>CONFIG_MEDIA_TUNER_MT2131=3Dm
>>>CONFIG_MEDIA_TUNER_QT1010=3Dm
>>>CONFIG_MEDIA_TUNER_XC2028=3Dm
>>>CONFIG_MEDIA_TUNER_XC5000=3Dm
>>>CONFIG_MEDIA_TUNER_XC4000=3Dm
>>>CONFIG_MEDIA_TUNER_MXL5005S=3Dm
>>>CONFIG_MEDIA_TUNER_MXL5007T=3Dm
>>>CONFIG_MEDIA_TUNER_MC44S803=3Dm
>>>CONFIG_MEDIA_TUNER_MAX2165=3Dm
>>>CONFIG_MEDIA_TUNER_TDA18218=3Dm
>>>CONFIG_MEDIA_TUNER_FC0011=3Dm
>>>CONFIG_MEDIA_TUNER_FC0012=3Dm
>>>CONFIG_MEDIA_TUNER_FC0013=3Dm
>>>CONFIG_MEDIA_TUNER_TDA18212=3Dm
>>>CONFIG_MEDIA_TUNER_E4000=3Dm
>>>CONFIG_MEDIA_TUNER_FC2580=3Dm
>>>CONFIG_MEDIA_TUNER_M88RS6000T=3Dm
>>>CONFIG_MEDIA_TUNER_TUA9001=3Dm
>>>CONFIG_MEDIA_TUNER_SI2157=3Dm
>>>CONFIG_MEDIA_TUNER_IT913X=3Dm
>>>CONFIG_MEDIA_TUNER_R820T=3Dm
>>>CONFIG_MEDIA_TUNER_QM1D1C0042=3Dm
>>>
>>>#
>>># Multistandard (satellite) frontends
>>>#
>>>CONFIG_DVB_STB0899=3Dm
>>>CONFIG_DVB_STB6100=3Dm
>>>CONFIG_DVB_STV090x=3Dm
>>>CONFIG_DVB_STV6110x=3Dm
>>>CONFIG_DVB_M88DS3103=3Dm
>>>
>>>#
>>># Multistandard (cable + terrestrial) frontends
>>>#
>>>CONFIG_DVB_DRXK=3Dm
>>>CONFIG_DVB_TDA18271C2DD=3Dm
>>>CONFIG_DVB_SI2165=3Dm
>>>CONFIG_DVB_MN88472=3Dm
>>>CONFIG_DVB_MN88473=3Dm
>>>
>>>#
>>># DVB-S (satellite) frontends
>>>#
>>>CONFIG_DVB_CX24110=3Dm
>>>CONFIG_DVB_CX24123=3Dm
>>>CONFIG_DVB_MT312=3Dm
>>>CONFIG_DVB_ZL10036=3Dm
>>>CONFIG_DVB_ZL10039=3Dm
>>>CONFIG_DVB_S5H1420=3Dm
>>>CONFIG_DVB_STV0288=3Dm
>>>CONFIG_DVB_STB6000=3Dm
>>>CONFIG_DVB_STV0299=3Dm
>>>CONFIG_DVB_STV6110=3Dm
>>>CONFIG_DVB_STV0900=3Dm
>>>CONFIG_DVB_TDA8083=3Dm
>>>CONFIG_DVB_TDA10086=3Dm
>>>CONFIG_DVB_TDA8261=3Dm
>>>CONFIG_DVB_VES1X93=3Dm
>>>CONFIG_DVB_TUNER_ITD1000=3Dm
>>>CONFIG_DVB_TUNER_CX24113=3Dm
>>>CONFIG_DVB_TDA826X=3Dm
>>>CONFIG_DVB_TUA6100=3Dm
>>>CONFIG_DVB_CX24116=3Dm
>>>CONFIG_DVB_CX24117=3Dm
>>>CONFIG_DVB_CX24120=3Dm
>>>CONFIG_DVB_SI21XX=3Dm
>>>CONFIG_DVB_TS2020=3Dm
>>>CONFIG_DVB_DS3000=3Dm
>>>CONFIG_DVB_MB86A16=3Dm
>>>CONFIG_DVB_TDA10071=3Dm
>>>
>>>#
>>># DVB-T (terrestrial) frontends
>>>#
>>>CONFIG_DVB_SP8870=3Dm
>>>CONFIG_DVB_SP887X=3Dm
>>>CONFIG_DVB_CX22700=3Dm
>>>CONFIG_DVB_CX22702=3Dm
>>>CONFIG_DVB_DRXD=3Dm
>>>CONFIG_DVB_L64781=3Dm
>>>CONFIG_DVB_TDA1004X=3Dm
>>>CONFIG_DVB_NXT6000=3Dm
>>>CONFIG_DVB_MT352=3Dm
>>>CONFIG_DVB_ZL10353=3Dm
>>>CONFIG_DVB_DIB3000MB=3Dm
>>>CONFIG_DVB_DIB3000MC=3Dm
>>>CONFIG_DVB_DIB7000M=3Dm
>>>CONFIG_DVB_DIB7000P=3Dm
>>>CONFIG_DVB_TDA10048=3Dm
>>>CONFIG_DVB_AF9013=3Dm
>>>CONFIG_DVB_EC100=3Dm
>>>CONFIG_DVB_STV0367=3Dm
>>>CONFIG_DVB_CXD2820R=3Dm
>>>CONFIG_DVB_RTL2830=3Dm
>>>CONFIG_DVB_RTL2832=3Dm
>>>CONFIG_DVB_SI2168=3Dm
>>># CONFIG_DVB_AS102_FE is not set
>>>
>>>#
>>># DVB-C (cable) frontends
>>>#
>>>CONFIG_DVB_VES1820=3Dm
>>>CONFIG_DVB_TDA10021=3Dm
>>>CONFIG_DVB_TDA10023=3Dm
>>>CONFIG_DVB_STV0297=3Dm
>>>
>>>#
>>># ATSC (North American/Korean Terrestrial/Cable DTV) frontends
>>>#
>>>CONFIG_DVB_NXT200X=3Dm
>>>CONFIG_DVB_OR51211=3Dm
>>>CONFIG_DVB_OR51132=3Dm
>>>CONFIG_DVB_BCM3510=3Dm
>>>CONFIG_DVB_LGDT330X=3Dm
>>>CONFIG_DVB_LGDT3305=3Dm
>>>CONFIG_DVB_LGDT3306A=3Dm
>>>CONFIG_DVB_LG2160=3Dm
>>>CONFIG_DVB_S5H1409=3Dm
>>>CONFIG_DVB_AU8522=3Dm
>>>CONFIG_DVB_AU8522_DTV=3Dm
>>>CONFIG_DVB_AU8522_V4L=3Dm
>>>CONFIG_DVB_S5H1411=3Dm
>>>
>>>#
>>># ISDB-T (terrestrial) frontends
>>>#
>>>CONFIG_DVB_S921=3Dm
>>>CONFIG_DVB_DIB8000=3Dm
>>>CONFIG_DVB_MB86A20S=3Dm
>>>
>>>#
>>># ISDB-S (satellite) & ISDB-T (terrestrial) frontends
>>>#
>>>CONFIG_DVB_TC90522=3Dm
>>>
>>>#
>>># Digital terrestrial only tuners/PLL
>>>#
>>>CONFIG_DVB_PLL=3Dm
>>>CONFIG_DVB_TUNER_DIB0070=3Dm
>>>CONFIG_DVB_TUNER_DIB0090=3Dm
>>>
>>>#
>>># SEC control devices for DVB-S
>>>#
>>>CONFIG_DVB_DRX39XYJ=3Dm
>>>CONFIG_DVB_LNBP21=3Dm
>>>CONFIG_DVB_LNBP22=3Dm
>>>CONFIG_DVB_ISL6405=3Dm
>>>CONFIG_DVB_ISL6421=3Dm
>>>CONFIG_DVB_ISL6423=3Dm
>>>CONFIG_DVB_A8293=3Dm
>>>CONFIG_DVB_LGS8GXX=3Dm
>>>CONFIG_DVB_ATBM8830=3Dm
>>>CONFIG_DVB_TDA665x=3Dm
>>>CONFIG_DVB_IX2505V=3Dm
>>>CONFIG_DVB_M88RS2000=3Dm
>>>CONFIG_DVB_AF9033=3Dm
>>>
>>>#
>>># Tools to develop new frontends
>>>#
>>># CONFIG_DVB_DUMMY_FE is not set
>>>
>>>#
>>># Graphics support
>>>#
>>>CONFIG_AGP=3Dy
>>>CONFIG_AGP_AMD64=3Dy
>>>CONFIG_AGP_INTEL=3Dy
>>>CONFIG_AGP_SIS=3Dy
>>>CONFIG_AGP_VIA=3Dy
>>>CONFIG_INTEL_GTT=3Dy
>>>CONFIG_VGA_ARB=3Dy
>>>CONFIG_VGA_ARB_MAX_GPUS=3D64
>>>CONFIG_VGA_SWITCHEROO=3Dy
>>>CONFIG_DRM=3Dm
>>>CONFIG_DRM_MIPI_DSI=3Dy
>>># CONFIG_DRM_DP_AUX_CHARDEV is not set
>>>CONFIG_DRM_KMS_HELPER=3Dm
>>>CONFIG_DRM_KMS_FB_HELPER=3Dy
>>>CONFIG_DRM_FBDEV_EMULATION=3Dy
>>>CONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy
>>>CONFIG_DRM_TTM=3Dm
>>>
>>>#
>>># I2C encoder or helper chips
>>>#
>>>CONFIG_DRM_I2C_CH7006=3Dm
>>>CONFIG_DRM_I2C_SIL164=3Dm
>>>CONFIG_DRM_I2C_NXP_TDA998X=3Dm
>>># CONFIG_DRM_TDFX is not set
>>># CONFIG_DRM_R128 is not set
>>># CONFIG_DRM_RADEON is not set
>>># CONFIG_DRM_AMDGPU is not set
>>>
>>>#
>>># ACP (Audio CoProcessor) Configuration
>>>#
>>># CONFIG_DRM_NOUVEAU is not set
>>># CONFIG_DRM_I810 is not set
>>>CONFIG_DRM_I915=3Dm
>>># CONFIG_DRM_I915_PRELIMINARY_HW_SUPPORT is not set
>>>CONFIG_DRM_I915_USERPTR=3Dy
>>># CONFIG_DRM_I915_GVT is not set
>>># CONFIG_DRM_MGA is not set
>>># CONFIG_DRM_SIS is not set
>>># CONFIG_DRM_VIA is not set
>>># CONFIG_DRM_SAVAGE is not set
>>># CONFIG_DRM_VGEM is not set
>>>CONFIG_DRM_VMWGFX=3Dm
>>>CONFIG_DRM_VMWGFX_FBCON=3Dy
>>>CONFIG_DRM_GMA500=3Dm
>>>CONFIG_DRM_GMA600=3Dy
>>>CONFIG_DRM_GMA3600=3Dy
>>>CONFIG_DRM_UDL=3Dm
>>>CONFIG_DRM_AST=3Dm
>>>CONFIG_DRM_MGAG200=3Dm
>>>CONFIG_DRM_CIRRUS_QEMU=3Dm
>>>CONFIG_DRM_QXL=3Dm
>>># CONFIG_DRM_BOCHS is not set
>>># CONFIG_DRM_VIRTIO_GPU is not set
>>>CONFIG_DRM_PANEL=3Dy
>>>
>>>#
>>># Display Panels
>>>#
>>>CONFIG_DRM_BRIDGE=3Dy
>>>
>>>#
>>># Display Interface Bridges
>>>#
>>># CONFIG_DRM_ANALOGIX_ANX78XX is not set
>>>
>>>#
>>># Frame buffer Devices
>>>#
>>>CONFIG_FB=3Dy
>>># CONFIG_FIRMWARE_EDID is not set
>>>CONFIG_FB_CMDLINE=3Dy
>>>CONFIG_FB_NOTIFY=3Dy
>>># CONFIG_FB_DDC is not set
>>>CONFIG_FB_BOOT_VESA_SUPPORT=3Dy
>>>CONFIG_FB_CFB_FILLRECT=3Dy
>>>CONFIG_FB_CFB_COPYAREA=3Dy
>>>CONFIG_FB_CFB_IMAGEBLIT=3Dy
>>># CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
>>>CONFIG_FB_SYS_FILLRECT=3Dm
>>>CONFIG_FB_SYS_COPYAREA=3Dm
>>>CONFIG_FB_SYS_IMAGEBLIT=3Dm
>>># CONFIG_FB_FOREIGN_ENDIAN is not set
>>>CONFIG_FB_SYS_FOPS=3Dm
>>>CONFIG_FB_DEFERRED_IO=3Dy
>>># CONFIG_FB_SVGALIB is not set
>>># CONFIG_FB_MACMODES is not set
>>># CONFIG_FB_BACKLIGHT is not set
>>># CONFIG_FB_MODE_HELPERS is not set
>>>CONFIG_FB_TILEBLITTING=3Dy
>>>
>>>#
>>># Frame buffer hardware drivers
>>>#
>>># CONFIG_FB_CIRRUS is not set
>>># CONFIG_FB_PM2 is not set
>>># CONFIG_FB_CYBER2000 is not set
>>># CONFIG_FB_ARC is not set
>>># CONFIG_FB_ASILIANT is not set
>>># CONFIG_FB_IMSTT is not set
>>># CONFIG_FB_VGA16 is not set
>>># CONFIG_FB_UVESA is not set
>>>CONFIG_FB_VESA=3Dy
>>>CONFIG_FB_EFI=3Dy
>>># CONFIG_FB_N411 is not set
>>># CONFIG_FB_HGA is not set
>>># CONFIG_FB_OPENCORES is not set
>>># CONFIG_FB_S1D13XXX is not set
>>># CONFIG_FB_NVIDIA is not set
>>># CONFIG_FB_RIVA is not set
>>># CONFIG_FB_I740 is not set
>>># CONFIG_FB_LE80578 is not set
>>># CONFIG_FB_MATROX is not set
>>># CONFIG_FB_RADEON is not set
>>># CONFIG_FB_ATY128 is not set
>>># CONFIG_FB_ATY is not set
>>># CONFIG_FB_S3 is not set
>>># CONFIG_FB_SAVAGE is not set
>>># CONFIG_FB_SIS is not set
>>># CONFIG_FB_VIA is not set
>>># CONFIG_FB_NEOMAGIC is not set
>>># CONFIG_FB_KYRO is not set
>>># CONFIG_FB_3DFX is not set
>>># CONFIG_FB_VOODOO1 is not set
>>># CONFIG_FB_VT8623 is not set
>>># CONFIG_FB_TRIDENT is not set
>>># CONFIG_FB_ARK is not set
>>># CONFIG_FB_PM3 is not set
>>># CONFIG_FB_CARMINE is not set
>>># CONFIG_FB_SM501 is not set
>>># CONFIG_FB_SMSCUFX is not set
>>># CONFIG_FB_UDL is not set
>>># CONFIG_FB_IBM_GXT4500 is not set
>>># CONFIG_FB_VIRTUAL is not set
>>># CONFIG_XEN_FBDEV_FRONTEND is not set
>>># CONFIG_FB_METRONOME is not set
>>># CONFIG_FB_MB862XX is not set
>>># CONFIG_FB_BROADSHEET is not set
>>># CONFIG_FB_AUO_K190X is not set
>>>CONFIG_FB_HYPERV=3Dm
>>># CONFIG_FB_SIMPLE is not set
>>># CONFIG_FB_SM712 is not set
>>>CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
>>>CONFIG_LCD_CLASS_DEVICE=3Dm
>>># CONFIG_LCD_L4F00242T03 is not set
>>># CONFIG_LCD_LMS283GF05 is not set
>>># CONFIG_LCD_LTV350QV is not set
>>># CONFIG_LCD_ILI922X is not set
>>># CONFIG_LCD_ILI9320 is not set
>>># CONFIG_LCD_TDO24M is not set
>>># CONFIG_LCD_VGG2432A4 is not set
>>>CONFIG_LCD_PLATFORM=3Dm
>>># CONFIG_LCD_S6E63M0 is not set
>>># CONFIG_LCD_LD9040 is not set
>>># CONFIG_LCD_AMS369FG06 is not set
>>># CONFIG_LCD_LMS501KF03 is not set
>>># CONFIG_LCD_HX8357 is not set
>>>CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
>>># CONFIG_BACKLIGHT_GENERIC is not set
>>># CONFIG_BACKLIGHT_PWM is not set
>>>CONFIG_BACKLIGHT_APPLE=3Dm
>>># CONFIG_BACKLIGHT_PM8941_WLED is not set
>>># CONFIG_BACKLIGHT_SAHARA is not set
>>># CONFIG_BACKLIGHT_ADP8860 is not set
>>># CONFIG_BACKLIGHT_ADP8870 is not set
>>># CONFIG_BACKLIGHT_LM3630A is not set
>>># CONFIG_BACKLIGHT_LM3639 is not set
>>># CONFIG_BACKLIGHT_LP855X is not set
>>># CONFIG_BACKLIGHT_GPIO is not set
>>># CONFIG_BACKLIGHT_LV5207LP is not set
>>># CONFIG_BACKLIGHT_BD6107 is not set
>>># CONFIG_VGASTATE is not set
>>>CONFIG_HDMI=3Dy
>>>
>>>#
>>># Console display driver support
>>>#
>>>CONFIG_VGA_CONSOLE=3Dy
>>>CONFIG_VGACON_SOFT_SCROLLBACK=3Dy
>>>CONFIG_VGACON_SOFT_SCROLLBACK_SIZE=3D64
>>>CONFIG_DUMMY_CONSOLE=3Dy
>>>CONFIG_DUMMY_CONSOLE_COLUMNS=3D80
>>>CONFIG_DUMMY_CONSOLE_ROWS=3D25
>>>CONFIG_FRAMEBUFFER_CONSOLE=3Dy
>>>CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
>>>CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
>>>CONFIG_LOGO=3Dy
>>># CONFIG_LOGO_LINUX_MONO is not set
>>># CONFIG_LOGO_LINUX_VGA16 is not set
>>>CONFIG_LOGO_LINUX_CLUT224=3Dy
>>>CONFIG_SOUND=3Dm
>>>CONFIG_SOUND_OSS_CORE=3Dy
>>>CONFIG_SOUND_OSS_CORE_PRECLAIM=3Dy
>>>CONFIG_SND=3Dm
>>>CONFIG_SND_TIMER=3Dm
>>>CONFIG_SND_PCM=3Dm
>>>CONFIG_SND_HWDEP=3Dm
>>>CONFIG_SND_RAWMIDI=3Dm
>>>CONFIG_SND_JACK=3Dy
>>>CONFIG_SND_JACK_INPUT_DEV=3Dy
>>>CONFIG_SND_SEQUENCER=3Dm
>>>CONFIG_SND_SEQ_DUMMY=3Dm
>>>CONFIG_SND_OSSEMUL=3Dy
>>># CONFIG_SND_MIXER_OSS is not set
>>># CONFIG_SND_PCM_OSS is not set
>>>CONFIG_SND_PCM_TIMER=3Dy
>>>CONFIG_SND_SEQUENCER_OSS=3Dy
>>>CONFIG_SND_HRTIMER=3Dm
>>>CONFIG_SND_SEQ_HRTIMER_DEFAULT=3Dy
>>>CONFIG_SND_DYNAMIC_MINORS=3Dy
>>>CONFIG_SND_MAX_CARDS=3D32
>>># CONFIG_SND_SUPPORT_OLD_API is not set
>>>CONFIG_SND_PROC_FS=3Dy
>>>CONFIG_SND_VERBOSE_PROCFS=3Dy
>>># CONFIG_SND_VERBOSE_PRINTK is not set
>>># CONFIG_SND_DEBUG is not set
>>>CONFIG_SND_VMASTER=3Dy
>>>CONFIG_SND_DMA_SGBUF=3Dy
>>>CONFIG_SND_RAWMIDI_SEQ=3Dm
>>>CONFIG_SND_OPL3_LIB_SEQ=3Dm
>>># CONFIG_SND_OPL4_LIB_SEQ is not set
>>># CONFIG_SND_SBAWE_SEQ is not set
>>>CONFIG_SND_EMU10K1_SEQ=3Dm
>>>CONFIG_SND_MPU401_UART=3Dm
>>>CONFIG_SND_OPL3_LIB=3Dm
>>>CONFIG_SND_VX_LIB=3Dm
>>>CONFIG_SND_AC97_CODEC=3Dm
>>>CONFIG_SND_DRIVERS=3Dy
>>>CONFIG_SND_PCSP=3Dm
>>>CONFIG_SND_DUMMY=3Dm
>>>CONFIG_SND_ALOOP=3Dm
>>>CONFIG_SND_VIRMIDI=3Dm
>>>CONFIG_SND_MTPAV=3Dm
>>># CONFIG_SND_MTS64 is not set
>>># CONFIG_SND_SERIAL_U16550 is not set
>>>CONFIG_SND_MPU401=3Dm
>>># CONFIG_SND_PORTMAN2X4 is not set
>>>CONFIG_SND_AC97_POWER_SAVE=3Dy
>>>CONFIG_SND_AC97_POWER_SAVE_DEFAULT=3D5
>>>CONFIG_SND_PCI=3Dy
>>>CONFIG_SND_AD1889=3Dm
>>># CONFIG_SND_ALS300 is not set
>>># CONFIG_SND_ALS4000 is not set
>>>CONFIG_SND_ALI5451=3Dm
>>>CONFIG_SND_ASIHPI=3Dm
>>>CONFIG_SND_ATIIXP=3Dm
>>>CONFIG_SND_ATIIXP_MODEM=3Dm
>>>CONFIG_SND_AU8810=3Dm
>>>CONFIG_SND_AU8820=3Dm
>>>CONFIG_SND_AU8830=3Dm
>>># CONFIG_SND_AW2 is not set
>>># CONFIG_SND_AZT3328 is not set
>>>CONFIG_SND_BT87X=3Dm
>>># CONFIG_SND_BT87X_OVERCLOCK is not set
>>>CONFIG_SND_CA0106=3Dm
>>>CONFIG_SND_CMIPCI=3Dm
>>>CONFIG_SND_OXYGEN_LIB=3Dm
>>>CONFIG_SND_OXYGEN=3Dm
>>># CONFIG_SND_CS4281 is not set
>>>CONFIG_SND_CS46XX=3Dm
>>>CONFIG_SND_CS46XX_NEW_DSP=3Dy
>>>CONFIG_SND_CTXFI=3Dm
>>>CONFIG_SND_DARLA20=3Dm
>>>CONFIG_SND_GINA20=3Dm
>>>CONFIG_SND_LAYLA20=3Dm
>>>CONFIG_SND_DARLA24=3Dm
>>>CONFIG_SND_GINA24=3Dm
>>>CONFIG_SND_LAYLA24=3Dm
>>>CONFIG_SND_MONA=3Dm
>>>CONFIG_SND_MIA=3Dm
>>>CONFIG_SND_ECHO3G=3Dm
>>>CONFIG_SND_INDIGO=3Dm
>>>CONFIG_SND_INDIGOIO=3Dm
>>>CONFIG_SND_INDIGODJ=3Dm
>>>CONFIG_SND_INDIGOIOX=3Dm
>>>CONFIG_SND_INDIGODJX=3Dm
>>>CONFIG_SND_EMU10K1=3Dm
>>>CONFIG_SND_EMU10K1X=3Dm
>>>CONFIG_SND_ENS1370=3Dm
>>>CONFIG_SND_ENS1371=3Dm
>>># CONFIG_SND_ES1938 is not set
>>>CONFIG_SND_ES1968=3Dm
>>>CONFIG_SND_ES1968_INPUT=3Dy
>>>CONFIG_SND_ES1968_RADIO=3Dy
>>># CONFIG_SND_FM801 is not set
>>>CONFIG_SND_HDSP=3Dm
>>>CONFIG_SND_HDSPM=3Dm
>>>CONFIG_SND_ICE1712=3Dm
>>>CONFIG_SND_ICE1724=3Dm
>>>CONFIG_SND_INTEL8X0=3Dm
>>>CONFIG_SND_INTEL8X0M=3Dm
>>>CONFIG_SND_KORG1212=3Dm
>>>CONFIG_SND_LOLA=3Dm
>>>CONFIG_SND_LX6464ES=3Dm
>>>CONFIG_SND_MAESTRO3=3Dm
>>>CONFIG_SND_MAESTRO3_INPUT=3Dy
>>>CONFIG_SND_MIXART=3Dm
>>># CONFIG_SND_NM256 is not set
>>>CONFIG_SND_PCXHR=3Dm
>>># CONFIG_SND_RIPTIDE is not set
>>>CONFIG_SND_RME32=3Dm
>>>CONFIG_SND_RME96=3Dm
>>>CONFIG_SND_RME9652=3Dm
>>># CONFIG_SND_SONICVIBES is not set
>>>CONFIG_SND_TRIDENT=3Dm
>>>CONFIG_SND_VIA82XX=3Dm
>>>CONFIG_SND_VIA82XX_MODEM=3Dm
>>>CONFIG_SND_VIRTUOSO=3Dm
>>>CONFIG_SND_VX222=3Dm
>>># CONFIG_SND_YMFPCI is not set
>>>
>>>#
>>># HD-Audio
>>>#
>>>CONFIG_SND_HDA=3Dm
>>>CONFIG_SND_HDA_INTEL=3Dm
>>>CONFIG_SND_HDA_HWDEP=3Dy
>>># CONFIG_SND_HDA_RECONFIG is not set
>>>CONFIG_SND_HDA_INPUT_BEEP=3Dy
>>>CONFIG_SND_HDA_INPUT_BEEP_MODE=3D0
>>># CONFIG_SND_HDA_PATCH_LOADER is not set
>>>CONFIG_SND_HDA_CODEC_REALTEK=3Dm
>>>CONFIG_SND_HDA_CODEC_ANALOG=3Dm
>>>CONFIG_SND_HDA_CODEC_SIGMATEL=3Dm
>>>CONFIG_SND_HDA_CODEC_VIA=3Dm
>>>CONFIG_SND_HDA_CODEC_HDMI=3Dm
>>>CONFIG_SND_HDA_CODEC_CIRRUS=3Dm
>>>CONFIG_SND_HDA_CODEC_CONEXANT=3Dm
>>>CONFIG_SND_HDA_CODEC_CA0110=3Dm
>>>CONFIG_SND_HDA_CODEC_CA0132=3Dm
>>>CONFIG_SND_HDA_CODEC_CA0132_DSP=3Dy
>>>CONFIG_SND_HDA_CODEC_CMEDIA=3Dm
>>>CONFIG_SND_HDA_CODEC_SI3054=3Dm
>>>CONFIG_SND_HDA_GENERIC=3Dm
>>>CONFIG_SND_HDA_POWER_SAVE_DEFAULT=3D0
>>>CONFIG_SND_HDA_CORE=3Dm
>>>CONFIG_SND_HDA_DSP_LOADER=3Dy
>>>CONFIG_SND_HDA_I915=3Dy
>>>CONFIG_SND_HDA_PREALLOC_SIZE=3D512
>>>CONFIG_SND_SPI=3Dy
>>>CONFIG_SND_USB=3Dy
>>>CONFIG_SND_USB_AUDIO=3Dm
>>>CONFIG_SND_USB_UA101=3Dm
>>>CONFIG_SND_USB_USX2Y=3Dm
>>>CONFIG_SND_USB_CAIAQ=3Dm
>>>CONFIG_SND_USB_CAIAQ_INPUT=3Dy
>>>CONFIG_SND_USB_US122L=3Dm
>>>CONFIG_SND_USB_6FIRE=3Dm
>>># CONFIG_SND_USB_HIFACE is not set
>>># CONFIG_SND_BCD2000 is not set
>>># CONFIG_SND_USB_POD is not set
>>># CONFIG_SND_USB_PODHD is not set
>>># CONFIG_SND_USB_TONEPORT is not set
>>># CONFIG_SND_USB_VARIAX is not set
>>>CONFIG_SND_FIREWIRE=3Dy
>>>CONFIG_SND_FIREWIRE_LIB=3Dm
>>># CONFIG_SND_DICE is not set
>>># CONFIG_SND_OXFW is not set
>>>CONFIG_SND_ISIGHT=3Dm
>>># CONFIG_SND_FIREWORKS is not set
>>># CONFIG_SND_BEBOB is not set
>>># CONFIG_SND_FIREWIRE_DIGI00X is not set
>>># CONFIG_SND_FIREWIRE_TASCAM is not set
>>># CONFIG_SND_SOC is not set
>>># CONFIG_SOUND_PRIME is not set
>>>CONFIG_AC97_BUS=3Dm
>>>
>>>#
>>># HID support
>>>#
>>>CONFIG_HID=3Dy
>>>CONFIG_HID_BATTERY_STRENGTH=3Dy
>>>CONFIG_HIDRAW=3Dy
>>>CONFIG_UHID=3Dm
>>>CONFIG_HID_GENERIC=3Dy
>>>
>>>#
>>># Special HID drivers
>>>#
>>>CONFIG_HID_A4TECH=3Dy
>>>CONFIG_HID_ACRUX=3Dm
>>># CONFIG_HID_ACRUX_FF is not set
>>>CONFIG_HID_APPLE=3Dy
>>>CONFIG_HID_APPLEIR=3Dm
>>># CONFIG_HID_ASUS is not set
>>>CONFIG_HID_AUREAL=3Dm
>>>CONFIG_HID_BELKIN=3Dy
>>># CONFIG_HID_BETOP_FF is not set
>>>CONFIG_HID_CHERRY=3Dy
>>>CONFIG_HID_CHICONY=3Dy
>>># CONFIG_HID_CORSAIR is not set
>>>CONFIG_HID_PRODIKEYS=3Dm
>>># CONFIG_HID_CMEDIA is not set
>>># CONFIG_HID_CP2112 is not set
>>>CONFIG_HID_CYPRESS=3Dy
>>>CONFIG_HID_DRAGONRISE=3Dm
>>># CONFIG_DRAGONRISE_FF is not set
>>># CONFIG_HID_EMS_FF is not set
>>>CONFIG_HID_ELECOM=3Dm
>>># CONFIG_HID_ELO is not set
>>>CONFIG_HID_EZKEY=3Dy
>>># CONFIG_HID_GEMBIRD is not set
>>># CONFIG_HID_GFRM is not set
>>>CONFIG_HID_HOLTEK=3Dm
>>># CONFIG_HOLTEK_FF is not set
>>># CONFIG_HID_GT683R is not set
>>>CONFIG_HID_KEYTOUCH=3Dm
>>>CONFIG_HID_KYE=3Dm
>>>CONFIG_HID_UCLOGIC=3Dm
>>>CONFIG_HID_WALTOP=3Dm
>>>CONFIG_HID_GYRATION=3Dm
>>>CONFIG_HID_ICADE=3Dm
>>>CONFIG_HID_TWINHAN=3Dm
>>>CONFIG_HID_KENSINGTON=3Dy
>>>CONFIG_HID_LCPOWER=3Dm
>>>CONFIG_HID_LED=3Dm
>>># CONFIG_HID_LENOVO is not set
>>>CONFIG_HID_LOGITECH=3Dy
>>>CONFIG_HID_LOGITECH_DJ=3Dm
>>>CONFIG_HID_LOGITECH_HIDPP=3Dm
>>># CONFIG_LOGITECH_FF is not set
>>># CONFIG_LOGIRUMBLEPAD2_FF is not set
>>># CONFIG_LOGIG940_FF is not set
>>># CONFIG_LOGIWHEELS_FF is not set
>>>CONFIG_HID_MAGICMOUSE=3Dy
>>>CONFIG_HID_MICROSOFT=3Dy
>>>CONFIG_HID_MONTEREY=3Dy
>>>CONFIG_HID_MULTITOUCH=3Dm
>>>CONFIG_HID_NTRIG=3Dy
>>>CONFIG_HID_ORTEK=3Dm
>>>CONFIG_HID_PANTHERLORD=3Dm
>>># CONFIG_PANTHERLORD_FF is not set
>>># CONFIG_HID_PENMOUNT is not set
>>>CONFIG_HID_PETALYNX=3Dm
>>>CONFIG_HID_PICOLCD=3Dm
>>>CONFIG_HID_PICOLCD_FB=3Dy
>>>CONFIG_HID_PICOLCD_BACKLIGHT=3Dy
>>>CONFIG_HID_PICOLCD_LCD=3Dy
>>>CONFIG_HID_PICOLCD_LEDS=3Dy
>>>CONFIG_HID_PICOLCD_CIR=3Dy
>>>CONFIG_HID_PLANTRONICS=3Dy
>>>CONFIG_HID_PRIMAX=3Dm
>>>CONFIG_HID_ROCCAT=3Dm
>>>CONFIG_HID_SAITEK=3Dm
>>>CONFIG_HID_SAMSUNG=3Dm
>>>CONFIG_HID_SONY=3Dm
>>># CONFIG_SONY_FF is not set
>>>CONFIG_HID_SPEEDLINK=3Dm
>>>CONFIG_HID_STEELSERIES=3Dm
>>>CONFIG_HID_SUNPLUS=3Dm
>>># CONFIG_HID_RMI is not set
>>>CONFIG_HID_GREENASIA=3Dm
>>># CONFIG_GREENASIA_FF is not set
>>>CONFIG_HID_HYPERV_MOUSE=3Dm
>>>CONFIG_HID_SMARTJOYPLUS=3Dm
>>># CONFIG_SMARTJOYPLUS_FF is not set
>>>CONFIG_HID_TIVO=3Dm
>>>CONFIG_HID_TOPSEED=3Dm
>>>CONFIG_HID_THINGM=3Dm
>>>CONFIG_HID_THRUSTMASTER=3Dm
>>># CONFIG_THRUSTMASTER_FF is not set
>>>CONFIG_HID_WACOM=3Dm
>>>CONFIG_HID_WIIMOTE=3Dm
>>># CONFIG_HID_XINMO is not set
>>>CONFIG_HID_ZEROPLUS=3Dm
>>># CONFIG_ZEROPLUS_FF is not set
>>>CONFIG_HID_ZYDACRON=3Dm
>>># CONFIG_HID_SENSOR_HUB is not set
>>># CONFIG_HID_ALPS is not set
>>>
>>>#
>>># USB HID support
>>>#
>>>CONFIG_USB_HID=3Dy
>>>CONFIG_HID_PID=3Dy
>>>CONFIG_USB_HIDDEV=3Dy
>>>
>>>#
>>># I2C HID support
>>>#
>>>CONFIG_I2C_HID=3Dm
>>>CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
>>>CONFIG_USB_SUPPORT=3Dy
>>>CONFIG_USB_COMMON=3Dy
>>>CONFIG_USB_ARCH_HAS_HCD=3Dy
>>>CONFIG_USB=3Dy
>>>CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
>>>
>>>#
>>># Miscellaneous USB options
>>>#
>>>CONFIG_USB_DEFAULT_PERSIST=3Dy
>>># CONFIG_USB_DYNAMIC_MINORS is not set
>>># CONFIG_USB_OTG is not set
>>># CONFIG_USB_OTG_WHITELIST is not set
>>># CONFIG_USB_ULPI_BUS is not set
>>>CONFIG_USB_MON=3Dy
>>>CONFIG_USB_WUSB=3Dm
>>>CONFIG_USB_WUSB_CBAF=3Dm
>>># CONFIG_USB_WUSB_CBAF_DEBUG is not set
>>>
>>>#
>>># USB Host Controller Drivers
>>>#
>>># CONFIG_USB_C67X00_HCD is not set
>>>CONFIG_USB_XHCI_HCD=3Dy
>>>CONFIG_USB_XHCI_PCI=3Dy
>>>CONFIG_USB_XHCI_PLATFORM=3Dy
>>>CONFIG_USB_EHCI_HCD=3Dy
>>>CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
>>>CONFIG_USB_EHCI_TT_NEWSCHED=3Dy
>>>CONFIG_USB_EHCI_PCI=3Dy
>>># CONFIG_USB_EHCI_HCD_PLATFORM is not set
>>># CONFIG_USB_OXU210HP_HCD is not set
>>># CONFIG_USB_ISP116X_HCD is not set
>>># CONFIG_USB_ISP1362_HCD is not set
>>># CONFIG_USB_FOTG210_HCD is not set
>>># CONFIG_USB_MAX3421_HCD is not set
>>>CONFIG_USB_OHCI_HCD=3Dy
>>>CONFIG_USB_OHCI_HCD_PCI=3Dy
>>># CONFIG_USB_OHCI_HCD_PLATFORM is not set
>>>CONFIG_USB_UHCI_HCD=3Dy
>>># CONFIG_USB_U132_HCD is not set
>>># CONFIG_USB_SL811_HCD is not set
>>># CONFIG_USB_R8A66597_HCD is not set
>>># CONFIG_USB_WHCI_HCD is not set
>>>CONFIG_USB_HWA_HCD=3Dm
>>># CONFIG_USB_HCD_BCMA is not set
>>># CONFIG_USB_HCD_SSB is not set
>>># CONFIG_USB_HCD_TEST_MODE is not set
>>>
>>>#
>>># USB Device Class drivers
>>>#
>>>CONFIG_USB_ACM=3Dm
>>>CONFIG_USB_PRINTER=3Dm
>>>CONFIG_USB_WDM=3Dm
>>>CONFIG_USB_TMC=3Dm
>>>
>>>#
>>># NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
>>>#
>>>
>>>#
>>># also be needed; see USB_STORAGE Help for more info
>>>#
>>>CONFIG_USB_STORAGE=3Dm
>>># CONFIG_USB_STORAGE_DEBUG is not set
>>>CONFIG_USB_STORAGE_REALTEK=3Dm
>>>CONFIG_REALTEK_AUTOPM=3Dy
>>>CONFIG_USB_STORAGE_DATAFAB=3Dm
>>>CONFIG_USB_STORAGE_FREECOM=3Dm
>>>CONFIG_USB_STORAGE_ISD200=3Dm
>>>CONFIG_USB_STORAGE_USBAT=3Dm
>>>CONFIG_USB_STORAGE_SDDR09=3Dm
>>>CONFIG_USB_STORAGE_SDDR55=3Dm
>>>CONFIG_USB_STORAGE_JUMPSHOT=3Dm
>>>CONFIG_USB_STORAGE_ALAUDA=3Dm
>>>CONFIG_USB_STORAGE_ONETOUCH=3Dm
>>>CONFIG_USB_STORAGE_KARMA=3Dm
>>>CONFIG_USB_STORAGE_CYPRESS_ATACB=3Dm
>>>CONFIG_USB_STORAGE_ENE_UB6250=3Dm
>>># CONFIG_USB_UAS is not set
>>>
>>>#
>>># USB Imaging devices
>>>#
>>>CONFIG_USB_MDC800=3Dm
>>>CONFIG_USB_MICROTEK=3Dm
>>># CONFIG_USBIP_CORE is not set
>>># CONFIG_USB_MUSB_HDRC is not set
>>>CONFIG_USB_DWC3=3Dy
>>># CONFIG_USB_DWC3_HOST is not set
>>>CONFIG_USB_DWC3_GADGET=3Dy
>>># CONFIG_USB_DWC3_DUAL_ROLE is not set
>>>
>>>#
>>># Platform Glue Driver Support
>>>#
>>>CONFIG_USB_DWC3_PCI=3Dy
>>># CONFIG_USB_DWC2 is not set
>>># CONFIG_USB_CHIPIDEA is not set
>>># CONFIG_USB_ISP1760 is not set
>>>
>>>#
>>># USB port drivers
>>>#
>>>CONFIG_USB_USS720=3Dm
>>>CONFIG_USB_SERIAL=3Dy
>>>CONFIG_USB_SERIAL_CONSOLE=3Dy
>>>CONFIG_USB_SERIAL_GENERIC=3Dy
>>># CONFIG_USB_SERIAL_SIMPLE is not set
>>>CONFIG_USB_SERIAL_AIRCABLE=3Dm
>>>CONFIG_USB_SERIAL_ARK3116=3Dm
>>>CONFIG_USB_SERIAL_BELKIN=3Dm
>>>CONFIG_USB_SERIAL_CH341=3Dm
>>>CONFIG_USB_SERIAL_WHITEHEAT=3Dm
>>>CONFIG_USB_SERIAL_DIGI_ACCELEPORT=3Dm
>>>CONFIG_USB_SERIAL_CP210X=3Dm
>>>CONFIG_USB_SERIAL_CYPRESS_M8=3Dm
>>>CONFIG_USB_SERIAL_EMPEG=3Dm
>>>CONFIG_USB_SERIAL_FTDI_SIO=3Dm
>>>CONFIG_USB_SERIAL_VISOR=3Dm
>>>CONFIG_USB_SERIAL_IPAQ=3Dm
>>>CONFIG_USB_SERIAL_IR=3Dm
>>>CONFIG_USB_SERIAL_EDGEPORT=3Dm
>>>CONFIG_USB_SERIAL_EDGEPORT_TI=3Dm
>>># CONFIG_USB_SERIAL_F81232 is not set
>>>CONFIG_USB_SERIAL_GARMIN=3Dm
>>>CONFIG_USB_SERIAL_IPW=3Dm
>>>CONFIG_USB_SERIAL_IUU=3Dm
>>>CONFIG_USB_SERIAL_KEYSPAN_PDA=3Dm
>>>CONFIG_USB_SERIAL_KEYSPAN=3Dm
>>>CONFIG_USB_SERIAL_KLSI=3Dm
>>>CONFIG_USB_SERIAL_KOBIL_SCT=3Dm
>>>CONFIG_USB_SERIAL_MCT_U232=3Dm
>>># CONFIG_USB_SERIAL_METRO is not set
>>>CONFIG_USB_SERIAL_MOS7720=3Dm
>>>CONFIG_USB_SERIAL_MOS7715_PARPORT=3Dy
>>>CONFIG_USB_SERIAL_MOS7840=3Dm
>>># CONFIG_USB_SERIAL_MXUPORT is not set
>>>CONFIG_USB_SERIAL_NAVMAN=3Dm
>>>CONFIG_USB_SERIAL_PL2303=3Dm
>>>CONFIG_USB_SERIAL_OTI6858=3Dm
>>>CONFIG_USB_SERIAL_QCAUX=3Dm
>>>CONFIG_USB_SERIAL_QUALCOMM=3Dm
>>>CONFIG_USB_SERIAL_SPCP8X5=3Dm
>>>CONFIG_USB_SERIAL_SAFE=3Dm
>>>CONFIG_USB_SERIAL_SAFE_PADDED=3Dy
>>>CONFIG_USB_SERIAL_SIERRAWIRELESS=3Dm
>>>CONFIG_USB_SERIAL_SYMBOL=3Dm
>>># CONFIG_USB_SERIAL_TI is not set
>>>CONFIG_USB_SERIAL_CYBERJACK=3Dm
>>>CONFIG_USB_SERIAL_XIRCOM=3Dm
>>>CONFIG_USB_SERIAL_WWAN=3Dm
>>>CONFIG_USB_SERIAL_OPTION=3Dm
>>>CONFIG_USB_SERIAL_OMNINET=3Dm
>>>CONFIG_USB_SERIAL_OPTICON=3Dm
>>>CONFIG_USB_SERIAL_XSENS_MT=3Dm
>>># CONFIG_USB_SERIAL_WISHBONE is not set
>>>CONFIG_USB_SERIAL_SSU100=3Dm
>>>CONFIG_USB_SERIAL_QT2=3Dm
>>>CONFIG_USB_SERIAL_DEBUG=3Dm
>>>
>>>#
>>># USB Miscellaneous drivers
>>>#
>>>CONFIG_USB_EMI62=3Dm
>>>CONFIG_USB_EMI26=3Dm
>>>CONFIG_USB_ADUTUX=3Dm
>>>CONFIG_USB_SEVSEG=3Dm
>>># CONFIG_USB_RIO500 is not set
>>>CONFIG_USB_LEGOTOWER=3Dm
>>>CONFIG_USB_LCD=3Dm
>>># CONFIG_USB_CYPRESS_CY7C63 is not set
>>># CONFIG_USB_CYTHERM is not set
>>>CONFIG_USB_IDMOUSE=3Dm
>>>CONFIG_USB_FTDI_ELAN=3Dm
>>>CONFIG_USB_APPLEDISPLAY=3Dm
>>>CONFIG_USB_SISUSBVGA=3Dm
>>>CONFIG_USB_SISUSBVGA_CON=3Dy
>>>CONFIG_USB_LD=3Dm
>>># CONFIG_USB_TRANCEVIBRATOR is not set
>>>CONFIG_USB_IOWARRIOR=3Dm
>>># CONFIG_USB_TEST is not set
>>># CONFIG_USB_EHSET_TEST_FIXTURE is not set
>>>CONFIG_USB_ISIGHTFW=3Dm
>>># CONFIG_USB_YUREX is not set
>>>CONFIG_USB_EZUSB_FX2=3Dm
>>>CONFIG_USB_HSIC_USB3503=3Dm
>>># CONFIG_USB_LINK_LAYER_TEST is not set
>>># CONFIG_USB_CHAOSKEY is not set
>>># CONFIG_UCSI is not set
>>>CONFIG_USB_ATM=3Dm
>>>CONFIG_USB_SPEEDTOUCH=3Dm
>>>CONFIG_USB_CXACRU=3Dm
>>>CONFIG_USB_UEAGLEATM=3Dm
>>>CONFIG_USB_XUSBATM=3Dm
>>>
>>>#
>>># USB Physical Layer drivers
>>>#
>>>CONFIG_USB_PHY=3Dy
>>>CONFIG_NOP_USB_XCEIV=3Dy
>>># CONFIG_USB_GPIO_VBUS is not set
>>># CONFIG_USB_ISP1301 is not set
>>>CONFIG_USB_GADGET=3Dy
>>># CONFIG_USB_GADGET_DEBUG is not set
>>># CONFIG_USB_GADGET_DEBUG_FILES is not set
>>># CONFIG_USB_GADGET_DEBUG_FS is not set
>>>CONFIG_USB_GADGET_VBUS_DRAW=3D2
>>>CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=3D2
>>>
>>>#
>>># USB Peripheral Controller
>>>#
>>># CONFIG_USB_FOTG210_UDC is not set
>>># CONFIG_USB_GR_UDC is not set
>>># CONFIG_USB_R8A66597 is not set
>>># CONFIG_USB_PXA27X is not set
>>># CONFIG_USB_MV_UDC is not set
>>># CONFIG_USB_MV_U3D is not set
>>># CONFIG_USB_M66592 is not set
>>># CONFIG_USB_BDC_UDC is not set
>>># CONFIG_USB_AMD5536UDC is not set
>>># CONFIG_USB_NET2272 is not set
>>># CONFIG_USB_NET2280 is not set
>>># CONFIG_USB_GOKU is not set
>>># CONFIG_USB_EG20T is not set
>>># CONFIG_USB_DUMMY_HCD is not set
>>>CONFIG_USB_LIBCOMPOSITE=3Dm
>>>CONFIG_USB_F_MASS_STORAGE=3Dm
>>># CONFIG_USB_CONFIGFS is not set
>>># CONFIG_USB_ZERO is not set
>>># CONFIG_USB_AUDIO is not set
>>># CONFIG_USB_ETH is not set
>>># CONFIG_USB_G_NCM is not set
>>># CONFIG_USB_GADGETFS is not set
>>># CONFIG_USB_FUNCTIONFS is not set
>>>CONFIG_USB_MASS_STORAGE=3Dm
>>># CONFIG_USB_GADGET_TARGET is not set
>>># CONFIG_USB_G_SERIAL is not set
>>># CONFIG_USB_MIDI_GADGET is not set
>>># CONFIG_USB_G_PRINTER is not set
>>># CONFIG_USB_CDC_COMPOSITE is not set
>>># CONFIG_USB_G_ACM_MS is not set
>>># CONFIG_USB_G_MULTI is not set
>>># CONFIG_USB_G_HID is not set
>>># CONFIG_USB_G_DBGP is not set
>>># CONFIG_USB_G_WEBCAM is not set
>>># CONFIG_USB_LED_TRIG is not set
>>>CONFIG_UWB=3Dm
>>>CONFIG_UWB_HWA=3Dm
>>>CONFIG_UWB_WHCI=3Dm
>>>CONFIG_UWB_I1480U=3Dm
>>>CONFIG_MMC=3Dm
>>># CONFIG_MMC_DEBUG is not set
>>>
>>>#
>>># MMC/SD/SDIO Card Drivers
>>>#
>>>CONFIG_MMC_BLOCK=3Dm
>>>CONFIG_MMC_BLOCK_MINORS=3D8
>>>CONFIG_MMC_BLOCK_BOUNCE=3Dy
>>>CONFIG_SDIO_UART=3Dm
>>># CONFIG_MMC_TEST is not set
>>>
>>>#
>>># MMC/SD/SDIO Host Controller Drivers
>>>#
>>>CONFIG_MMC_SDHCI=3Dm
>>>CONFIG_MMC_SDHCI_PCI=3Dm
>>>CONFIG_MMC_RICOH_MMC=3Dy
>>>CONFIG_MMC_SDHCI_ACPI=3Dm
>>>CONFIG_MMC_SDHCI_PLTFM=3Dm
>>># CONFIG_MMC_WBSD is not set
>>>CONFIG_MMC_TIFM_SD=3Dm
>>># CONFIG_MMC_SPI is not set
>>>CONFIG_MMC_CB710=3Dm
>>>CONFIG_MMC_VIA_SDMMC=3Dm
>>>CONFIG_MMC_VUB300=3Dm
>>>CONFIG_MMC_USHC=3Dm
>>># CONFIG_MMC_USDHI6ROL0 is not set
>>>CONFIG_MMC_REALTEK_PCI=3Dm
>>># CONFIG_MMC_TOSHIBA_PCI is not set
>>># CONFIG_MMC_MTK is not set
>>>CONFIG_MEMSTICK=3Dm
>>># CONFIG_MEMSTICK_DEBUG is not set
>>>
>>>#
>>># MemoryStick drivers
>>>#
>>># CONFIG_MEMSTICK_UNSAFE_RESUME is not set
>>>CONFIG_MSPRO_BLOCK=3Dm
>>># CONFIG_MS_BLOCK is not set
>>>
>>>#
>>># MemoryStick Host Controller Drivers
>>>#
>>>CONFIG_MEMSTICK_TIFM_MS=3Dm
>>>CONFIG_MEMSTICK_JMICRON_38X=3Dm
>>>CONFIG_MEMSTICK_R592=3Dm
>>>CONFIG_MEMSTICK_REALTEK_PCI=3Dm
>>>CONFIG_NEW_LEDS=3Dy
>>>CONFIG_LEDS_CLASS=3Dy
>>># CONFIG_LEDS_CLASS_FLASH is not set
>>>
>>>#
>>># LED drivers
>>>#
>>>CONFIG_LEDS_LM3530=3Dm
>>># CONFIG_LEDS_LM3642 is not set
>>># CONFIG_LEDS_PCA9532 is not set
>>># CONFIG_LEDS_GPIO is not set
>>>CONFIG_LEDS_LP3944=3Dm
>>># CONFIG_LEDS_LP3952 is not set
>>>CONFIG_LEDS_LP55XX_COMMON=3Dm
>>>CONFIG_LEDS_LP5521=3Dm
>>>CONFIG_LEDS_LP5523=3Dm
>>>CONFIG_LEDS_LP5562=3Dm
>>># CONFIG_LEDS_LP8501 is not set
>>># CONFIG_LEDS_LP8860 is not set
>>>CONFIG_LEDS_CLEVO_MAIL=3Dm
>>># CONFIG_LEDS_PCA955X is not set
>>># CONFIG_LEDS_PCA963X is not set
>>># CONFIG_LEDS_DAC124S085 is not set
>>># CONFIG_LEDS_PWM is not set
>>># CONFIG_LEDS_BD2802 is not set
>>>CONFIG_LEDS_INTEL_SS4200=3Dm
>>># CONFIG_LEDS_LT3593 is not set
>>># CONFIG_LEDS_TCA6507 is not set
>>># CONFIG_LEDS_TLC591XX is not set
>>># CONFIG_LEDS_LM355x is not set
>>>
>>>#
>>># LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_=
THINGM)
>>>#
>>>CONFIG_LEDS_BLINKM=3Dm
>>>
>>>#
>>># LED Triggers
>>>#
>>>CONFIG_LEDS_TRIGGERS=3Dy
>>>CONFIG_LEDS_TRIGGER_TIMER=3Dm
>>>CONFIG_LEDS_TRIGGER_ONESHOT=3Dm
>>># CONFIG_LEDS_TRIGGER_DISK is not set
>>># CONFIG_LEDS_TRIGGER_MTD is not set
>>>CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dm
>>>CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dm
>>># CONFIG_LEDS_TRIGGER_CPU is not set
>>># CONFIG_LEDS_TRIGGER_GPIO is not set
>>>CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dm
>>>
>>>#
>>># iptables trigger is under Netfilter config (LED target)
>>>#
>>>CONFIG_LEDS_TRIGGER_TRANSIENT=3Dm
>>>CONFIG_LEDS_TRIGGER_CAMERA=3Dm
>>># CONFIG_LEDS_TRIGGER_PANIC is not set
>>># CONFIG_ACCESSIBILITY is not set
>>># CONFIG_INFINIBAND is not set
>>>CONFIG_EDAC_ATOMIC_SCRUB=3Dy
>>>CONFIG_EDAC_SUPPORT=3Dy
>>>CONFIG_EDAC=3Dy
>>>CONFIG_EDAC_LEGACY_SYSFS=3Dy
>>># CONFIG_EDAC_DEBUG is not set
>>>CONFIG_EDAC_DECODE_MCE=3Dm
>>>CONFIG_EDAC_MM_EDAC=3Dm
>>>CONFIG_EDAC_AMD64=3Dm
>>># CONFIG_EDAC_AMD64_ERROR_INJECTION is not set
>>>CONFIG_EDAC_E752X=3Dm
>>>CONFIG_EDAC_I82975X=3Dm
>>>CONFIG_EDAC_I3000=3Dm
>>>CONFIG_EDAC_I3200=3Dm
>>># CONFIG_EDAC_IE31200 is not set
>>>CONFIG_EDAC_X38=3Dm
>>>CONFIG_EDAC_I5400=3Dm
>>>CONFIG_EDAC_I7CORE=3Dm
>>>CONFIG_EDAC_I5000=3Dm
>>>CONFIG_EDAC_I5100=3Dm
>>>CONFIG_EDAC_I7300=3Dm
>>>CONFIG_EDAC_SBRIDGE=3Dm
>>>CONFIG_RTC_LIB=3Dy
>>>CONFIG_RTC_MC146818_LIB=3Dy
>>>CONFIG_RTC_CLASS=3Dy
>>>CONFIG_RTC_HCTOSYS=3Dy
>>>CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
>>># CONFIG_RTC_SYSTOHC is not set
>>># CONFIG_RTC_DEBUG is not set
>>>
>>>#
>>># RTC interfaces
>>>#
>>>CONFIG_RTC_INTF_SYSFS=3Dy
>>>CONFIG_RTC_INTF_PROC=3Dy
>>>CONFIG_RTC_INTF_DEV=3Dy
>>># CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
>>># CONFIG_RTC_DRV_TEST is not set
>>>
>>>#
>>># I2C RTC drivers
>>>#
>>># CONFIG_RTC_DRV_ABB5ZES3 is not set
>>># CONFIG_RTC_DRV_ABX80X is not set
>>>CONFIG_RTC_DRV_DS1307=3Dm
>>>CONFIG_RTC_DRV_DS1307_HWMON=3Dy
>>>CONFIG_RTC_DRV_DS1374=3Dm
>>># CONFIG_RTC_DRV_DS1374_WDT is not set
>>>CONFIG_RTC_DRV_DS1672=3Dm
>>>CONFIG_RTC_DRV_MAX6900=3Dm
>>>CONFIG_RTC_DRV_RS5C372=3Dm
>>>CONFIG_RTC_DRV_ISL1208=3Dm
>>>CONFIG_RTC_DRV_ISL12022=3Dm
>>># CONFIG_RTC_DRV_ISL12057 is not set
>>>CONFIG_RTC_DRV_X1205=3Dm
>>>CONFIG_RTC_DRV_PCF8523=3Dm
>>># CONFIG_RTC_DRV_PCF85063 is not set
>>>CONFIG_RTC_DRV_PCF8563=3Dm
>>>CONFIG_RTC_DRV_PCF8583=3Dm
>>>CONFIG_RTC_DRV_M41T80=3Dm
>>>CONFIG_RTC_DRV_M41T80_WDT=3Dy
>>>CONFIG_RTC_DRV_BQ32K=3Dm
>>># CONFIG_RTC_DRV_S35390A is not set
>>>CONFIG_RTC_DRV_FM3130=3Dm
>>># CONFIG_RTC_DRV_RX8010 is not set
>>>CONFIG_RTC_DRV_RX8581=3Dm
>>>CONFIG_RTC_DRV_RX8025=3Dm
>>>CONFIG_RTC_DRV_EM3027=3Dm
>>># CONFIG_RTC_DRV_RV8803 is not set
>>>
>>>#
>>># SPI RTC drivers
>>>#
>>># CONFIG_RTC_DRV_M41T93 is not set
>>># CONFIG_RTC_DRV_M41T94 is not set
>>># CONFIG_RTC_DRV_DS1302 is not set
>>># CONFIG_RTC_DRV_DS1305 is not set
>>># CONFIG_RTC_DRV_DS1343 is not set
>>># CONFIG_RTC_DRV_DS1347 is not set
>>># CONFIG_RTC_DRV_DS1390 is not set
>>># CONFIG_RTC_DRV_MAX6916 is not set
>>># CONFIG_RTC_DRV_R9701 is not set
>>># CONFIG_RTC_DRV_RX4581 is not set
>>># CONFIG_RTC_DRV_RX6110 is not set
>>># CONFIG_RTC_DRV_RS5C348 is not set
>>># CONFIG_RTC_DRV_MAX6902 is not set
>>># CONFIG_RTC_DRV_PCF2123 is not set
>>># CONFIG_RTC_DRV_MCP795 is not set
>>>CONFIG_RTC_I2C_AND_SPI=3Dy
>>>
>>>#
>>># SPI and I2C RTC drivers
>>>#
>>>CONFIG_RTC_DRV_DS3232=3Dm
>>># CONFIG_RTC_DRV_PCF2127 is not set
>>>CONFIG_RTC_DRV_RV3029C2=3Dm
>>>CONFIG_RTC_DRV_RV3029_HWMON=3Dy
>>>
>>>#
>>># Platform RTC drivers
>>>#
>>>CONFIG_RTC_DRV_CMOS=3Dy
>>>CONFIG_RTC_DRV_DS1286=3Dm
>>>CONFIG_RTC_DRV_DS1511=3Dm
>>>CONFIG_RTC_DRV_DS1553=3Dm
>>># CONFIG_RTC_DRV_DS1685_FAMILY is not set
>>>CONFIG_RTC_DRV_DS1742=3Dm
>>>CONFIG_RTC_DRV_DS2404=3Dm
>>>CONFIG_RTC_DRV_STK17TA8=3Dm
>>># CONFIG_RTC_DRV_M48T86 is not set
>>>CONFIG_RTC_DRV_M48T35=3Dm
>>>CONFIG_RTC_DRV_M48T59=3Dm
>>>CONFIG_RTC_DRV_MSM6242=3Dm
>>>CONFIG_RTC_DRV_BQ4802=3Dm
>>>CONFIG_RTC_DRV_RP5C01=3Dm
>>>CONFIG_RTC_DRV_V3020=3Dm
>>>
>>>#
>>># on-CPU RTC drivers
>>>#
>>>
>>>#
>>># HID Sensor RTC drivers
>>>#
>>># CONFIG_RTC_DRV_HID_SENSOR_TIME is not set
>>>CONFIG_DMADEVICES=3Dy
>>># CONFIG_DMADEVICES_DEBUG is not set
>>>
>>>#
>>># DMA Devices
>>>#
>>>CONFIG_DMA_ENGINE=3Dy
>>>CONFIG_DMA_VIRTUAL_CHANNELS=3Dy
>>>CONFIG_DMA_ACPI=3Dy
>>># CONFIG_INTEL_IDMA64 is not set
>>># CONFIG_INTEL_IOATDMA is not set
>>># CONFIG_QCOM_HIDMA_MGMT is not set
>>># CONFIG_QCOM_HIDMA is not set
>>>CONFIG_DW_DMAC_CORE=3Dm
>>>CONFIG_DW_DMAC=3Dm
>>>CONFIG_DW_DMAC_PCI=3Dm
>>>CONFIG_HSU_DMA=3Dy
>>>
>>>#
>>># DMA Clients
>>>#
>>>CONFIG_ASYNC_TX_DMA=3Dy
>>>CONFIG_DMATEST=3Dm
>>>
>>>#
>>># DMABUF options
>>>#
>>># CONFIG_SYNC_FILE is not set
>>>CONFIG_AUXDISPLAY=3Dy
>>>CONFIG_KS0108=3Dm
>>>CONFIG_KS0108_PORT=3D0x378
>>>CONFIG_KS0108_DELAY=3D2
>>>CONFIG_CFAG12864B=3Dm
>>>CONFIG_CFAG12864B_RATE=3D20
>>>CONFIG_UIO=3Dm
>>>CONFIG_UIO_CIF=3Dm
>>>CONFIG_UIO_PDRV_GENIRQ=3Dm
>>># CONFIG_UIO_DMEM_GENIRQ is not set
>>>CONFIG_UIO_AEC=3Dm
>>>CONFIG_UIO_SERCOS3=3Dm
>>>CONFIG_UIO_PCI_GENERIC=3Dm
>>># CONFIG_UIO_NETX is not set
>>># CONFIG_UIO_PRUSS is not set
>>># CONFIG_UIO_MF624 is not set
>>>CONFIG_VFIO_IOMMU_TYPE1=3Dm
>>>CONFIG_VFIO_VIRQFD=3Dm
>>>CONFIG_VFIO=3Dm
>>># CONFIG_VFIO_NOIOMMU is not set
>>>CONFIG_VFIO_PCI=3Dm
>>># CONFIG_VFIO_PCI_VGA is not set
>>>CONFIG_VFIO_PCI_MMAP=3Dy
>>>CONFIG_VFIO_PCI_INTX=3Dy
>>>CONFIG_VFIO_PCI_IGD=3Dy
>>>CONFIG_IRQ_BYPASS_MANAGER=3Dm
>>># CONFIG_VIRT_DRIVERS is not set
>>>CONFIG_VIRTIO=3Dy
>>>
>>>#
>>># Virtio drivers
>>>#
>>>CONFIG_VIRTIO_PCI=3Dy
>>>CONFIG_VIRTIO_PCI_LEGACY=3Dy
>>>CONFIG_VIRTIO_BALLOON=3Dy
>>># CONFIG_VIRTIO_INPUT is not set
>>># CONFIG_VIRTIO_MMIO is not set
>>>
>>>#
>>># Microsoft Hyper-V guest support
>>>#
>>>CONFIG_HYPERV=3Dm
>>>CONFIG_HYPERV_UTILS=3Dm
>>>CONFIG_HYPERV_BALLOON=3Dm
>>>
>>>#
>>># Xen driver support
>>>#
>>>CONFIG_XEN_BALLOON=3Dy
>>># CONFIG_XEN_SELFBALLOONING is not set
>>># CONFIG_XEN_BALLOON_MEMORY_HOTPLUG is not set
>>>CONFIG_XEN_SCRUB_PAGES=3Dy
>>>CONFIG_XEN_DEV_EVTCHN=3Dm
>>>CONFIG_XEN_BACKEND=3Dy
>>>CONFIG_XENFS=3Dm
>>>CONFIG_XEN_COMPAT_XENFS=3Dy
>>>CONFIG_XEN_SYS_HYPERVISOR=3Dy
>>>CONFIG_XEN_XENBUS_FRONTEND=3Dy
>>># CONFIG_XEN_GNTDEV is not set
>>># CONFIG_XEN_GRANT_DEV_ALLOC is not set
>>>CONFIG_SWIOTLB_XEN=3Dy
>>>CONFIG_XEN_TMEM=3Dm
>>>CONFIG_XEN_PCIDEV_BACKEND=3Dm
>>># CONFIG_XEN_SCSI_BACKEND is not set
>>>CONFIG_XEN_PRIVCMD=3Dm
>>>CONFIG_XEN_ACPI_PROCESSOR=3Dm
>>># CONFIG_XEN_MCE_LOG is not set
>>>CONFIG_XEN_HAVE_PVMMU=3Dy
>>>CONFIG_XEN_EFI=3Dy
>>>CONFIG_XEN_AUTO_XLATE=3Dy
>>>CONFIG_XEN_ACPI=3Dy
>>>CONFIG_XEN_SYMS=3Dy
>>>CONFIG_XEN_HAVE_VPMU=3Dy
>>>CONFIG_STAGING=3Dy
>>># CONFIG_SLICOSS is not set
>>># CONFIG_PRISM2_USB is not set
>>># CONFIG_COMEDI is not set
>>># CONFIG_RTL8192U is not set
>>>CONFIG_RTLLIB=3Dm
>>>CONFIG_RTLLIB_CRYPTO_CCMP=3Dm
>>>CONFIG_RTLLIB_CRYPTO_TKIP=3Dm
>>>CONFIG_RTLLIB_CRYPTO_WEP=3Dm
>>>CONFIG_RTL8192E=3Dm
>>>CONFIG_R8712U=3Dm
>>># CONFIG_R8188EU is not set
>>># CONFIG_R8723AU is not set
>>># CONFIG_RTS5208 is not set
>>># CONFIG_VT6655 is not set
>>># CONFIG_VT6656 is not set
>>># CONFIG_FB_SM750 is not set
>>># CONFIG_FB_XGI is not set
>>>
>>>#
>>># Speakup console speech
>>>#
>>># CONFIG_SPEAKUP is not set
>>># CONFIG_STAGING_MEDIA is not set
>>>
>>>#
>>># Android
>>>#
>>># CONFIG_LTE_GDM724X is not set
>>>CONFIG_FIREWIRE_SERIAL=3Dm
>>>CONFIG_FWTTY_MAX_TOTAL_PORTS=3D64
>>>CONFIG_FWTTY_MAX_CARD_PORTS=3D32
>>># CONFIG_LNET is not set
>>># CONFIG_DGNC is not set
>>># CONFIG_GS_FPGABOOT is not set
>>># CONFIG_CRYPTO_SKEIN is not set
>>># CONFIG_UNISYSSPAR is not set
>>># CONFIG_FB_TFT is not set
>>># CONFIG_WILC1000_SDIO is not set
>>># CONFIG_WILC1000_SPI is not set
>>># CONFIG_MOST is not set
>>>
>>>#
>>># Old ISDN4Linux (deprecated)
>>>#
>>># CONFIG_KS7010 is not set
>>>CONFIG_X86_PLATFORM_DEVICES=3Dy
>>>CONFIG_ACER_WMI=3Dm
>>>CONFIG_ACERHDF=3Dm
>>># CONFIG_ALIENWARE_WMI is not set
>>>CONFIG_ASUS_LAPTOP=3Dm
>>># CONFIG_DELL_SMBIOS is not set
>>>CONFIG_DELL_WMI_AIO=3Dm
>>># CONFIG_DELL_SMO8800 is not set
>>># CONFIG_DELL_RBTN is not set
>>>CONFIG_FUJITSU_LAPTOP=3Dm
>>># CONFIG_FUJITSU_LAPTOP_DEBUG is not set
>>>CONFIG_FUJITSU_TABLET=3Dm
>>>CONFIG_AMILO_RFKILL=3Dm
>>>CONFIG_HP_ACCEL=3Dm
>>># CONFIG_HP_WIRELESS is not set
>>>CONFIG_HP_WMI=3Dm
>>>CONFIG_MSI_LAPTOP=3Dm
>>>CONFIG_PANASONIC_LAPTOP=3Dm
>>>CONFIG_COMPAL_LAPTOP=3Dm
>>>CONFIG_SONY_LAPTOP=3Dm
>>>CONFIG_SONYPI_COMPAT=3Dy
>>>CONFIG_IDEAPAD_LAPTOP=3Dm
>>>CONFIG_THINKPAD_ACPI=3Dm
>>>CONFIG_THINKPAD_ACPI_ALSA_SUPPORT=3Dy
>>># CONFIG_THINKPAD_ACPI_DEBUGFACILITIES is not set
>>># CONFIG_THINKPAD_ACPI_DEBUG is not set
>>># CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is not set
>>>CONFIG_THINKPAD_ACPI_VIDEO=3Dy
>>>CONFIG_THINKPAD_ACPI_HOTKEY_POLL=3Dy
>>>CONFIG_SENSORS_HDAPS=3Dm
>>># CONFIG_INTEL_MENLOW is not set
>>>CONFIG_EEEPC_LAPTOP=3Dm
>>>CONFIG_ASUS_WMI=3Dm
>>>CONFIG_ASUS_NB_WMI=3Dm
>>>CONFIG_EEEPC_WMI=3Dm
>>># CONFIG_ASUS_WIRELESS is not set
>>>CONFIG_ACPI_WMI=3Dm
>>>CONFIG_MSI_WMI=3Dm
>>>CONFIG_TOPSTAR_LAPTOP=3Dm
>>>CONFIG_TOSHIBA_BT_RFKILL=3Dm
>>># CONFIG_TOSHIBA_HAPS is not set
>>># CONFIG_TOSHIBA_WMI is not set
>>>CONFIG_ACPI_CMPC=3Dm
>>># CONFIG_INTEL_HID_EVENT is not set
>>># CONFIG_INTEL_VBTN is not set
>>>CONFIG_INTEL_IPS=3Dm
>>># CONFIG_INTEL_PMC_CORE is not set
>>># CONFIG_IBM_RTL is not set
>>>CONFIG_SAMSUNG_LAPTOP=3Dm
>>>CONFIG_MXM_WMI=3Dm
>>>CONFIG_INTEL_OAKTRAIL=3Dm
>>>CONFIG_SAMSUNG_Q10=3Dm
>>>CONFIG_APPLE_GMUX=3Dm
>>># CONFIG_INTEL_RST is not set
>>># CONFIG_INTEL_SMARTCONNECT is not set
>>>CONFIG_PVPANIC=3Dy
>>># CONFIG_INTEL_PMC_IPC is not set
>>># CONFIG_SURFACE_PRO3_BUTTON is not set
>>># CONFIG_INTEL_PUNIT_IPC is not set
>>># CONFIG_CHROME_PLATFORMS is not set
>>>CONFIG_CLKDEV_LOOKUP=3Dy
>>>CONFIG_HAVE_CLK_PREPARE=3Dy
>>>CONFIG_COMMON_CLK=3Dy
>>>
>>>#
>>># Common Clock Framework
>>>#
>>># CONFIG_COMMON_CLK_SI5351 is not set
>>># CONFIG_COMMON_CLK_CDCE706 is not set
>>># CONFIG_COMMON_CLK_CS2000_CP is not set
>>># CONFIG_COMMON_CLK_NXP is not set
>>># CONFIG_COMMON_CLK_PWM is not set
>>># CONFIG_COMMON_CLK_PXA is not set
>>># CONFIG_COMMON_CLK_PIC32 is not set
>>># CONFIG_SUNXI_CCU is not set
>>>
>>>#
>>># Hardware Spinlock drivers
>>>#
>>>
>>>#
>>># Clock Source drivers
>>>#
>>>CONFIG_CLKEVT_I8253=3Dy
>>>CONFIG_I8253_LOCK=3Dy
>>>CONFIG_CLKBLD_I8253=3Dy
>>># CONFIG_ATMEL_PIT is not set
>>># CONFIG_SH_TIMER_CMT is not set
>>># CONFIG_SH_TIMER_MTU2 is not set
>>># CONFIG_SH_TIMER_TMU is not set
>>># CONFIG_EM_TIMER_STI is not set
>>># CONFIG_MAILBOX is not set
>>>CONFIG_IOMMU_API=3Dy
>>>CONFIG_IOMMU_SUPPORT=3Dy
>>>
>>>#
>>># Generic IOMMU Pagetable Support
>>>#
>>>CONFIG_IOMMU_IOVA=3Dy
>>>CONFIG_AMD_IOMMU=3Dy
>>>CONFIG_AMD_IOMMU_V2=3Dm
>>>CONFIG_DMAR_TABLE=3Dy
>>>CONFIG_INTEL_IOMMU=3Dy
>>># CONFIG_INTEL_IOMMU_SVM is not set
>>># CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
>>>CONFIG_INTEL_IOMMU_FLOPPY_WA=3Dy
>>>CONFIG_IRQ_REMAP=3Dy
>>>
>>>#
>>># Remoteproc drivers
>>>#
>>># CONFIG_STE_MODEM_RPROC is not set
>>>
>>>#
>>># Rpmsg drivers
>>>#
>>>
>>>#
>>># SOC (System On Chip) specific Drivers
>>>#
>>>
>>>#
>>># Broadcom SoC drivers
>>>#
>>># CONFIG_SUNXI_SRAM is not set
>>># CONFIG_SOC_TI is not set
>>>CONFIG_PM_DEVFREQ=3Dy
>>>
>>>#
>>># DEVFREQ Governors
>>>#
>>>CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dm
>>># CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
>>># CONFIG_DEVFREQ_GOV_POWERSAVE is not set
>>># CONFIG_DEVFREQ_GOV_USERSPACE is not set
>>># CONFIG_DEVFREQ_GOV_PASSIVE is not set
>>>
>>>#
>>># DEVFREQ Drivers
>>>#
>>># CONFIG_PM_DEVFREQ_EVENT is not set
>>># CONFIG_EXTCON is not set
>>># CONFIG_MEMORY is not set
>>># CONFIG_IIO is not set
>>>CONFIG_NTB=3Dm
>>># CONFIG_NTB_AMD is not set
>>># CONFIG_NTB_INTEL is not set
>>># CONFIG_NTB_PINGPONG is not set
>>># CONFIG_NTB_TOOL is not set
>>># CONFIG_NTB_PERF is not set
>>># CONFIG_NTB_TRANSPORT is not set
>>># CONFIG_VME_BUS is not set
>>>CONFIG_PWM=3Dy
>>>CONFIG_PWM_SYSFS=3Dy
>>># CONFIG_PWM_LPSS_PCI is not set
>>># CONFIG_PWM_LPSS_PLATFORM is not set
>>># CONFIG_PWM_PCA9685 is not set
>>>CONFIG_ARM_GIC_MAX_NR=3D1
>>># CONFIG_IPACK_BUS is not set
>>># CONFIG_RESET_CONTROLLER is not set
>>># CONFIG_FMC is not set
>>>
>>>#
>>># PHY Subsystem
>>>#
>>>CONFIG_GENERIC_PHY=3Dy
>>># CONFIG_PHY_PXA_28NM_HSIC is not set
>>># CONFIG_PHY_PXA_28NM_USB2 is not set
>>># CONFIG_BCM_KONA_USB2_PHY is not set
>>>CONFIG_POWERCAP=3Dy
>>>CONFIG_INTEL_RAPL=3Dm
>>># CONFIG_MCB is not set
>>>
>>>#
>>># Performance monitor support
>>>#
>>>CONFIG_RAS=3Dy
>>># CONFIG_MCE_AMD_INJ is not set
>>># CONFIG_THUNDERBOLT is not set
>>>
>>>#
>>># Android
>>>#
>>># CONFIG_ANDROID is not set
>>>CONFIG_LIBNVDIMM=3Dm
>>>CONFIG_BLK_DEV_PMEM=3Dm
>>>CONFIG_ND_BLK=3Dm
>>>CONFIG_ND_CLAIM=3Dy
>>>CONFIG_ND_BTT=3Dm
>>>CONFIG_BTT=3Dy
>>>CONFIG_ND_PFN=3Dm
>>>CONFIG_NVDIMM_PFN=3Dy
>>>CONFIG_NVDIMM_DAX=3Dy
>>>CONFIG_DEV_DAX=3Dm
>>>CONFIG_DEV_DAX_PMEM=3Dm
>>>CONFIG_NVMEM=3Dm
>>># CONFIG_STM is not set
>>># CONFIG_INTEL_TH is not set
>>>
>>>#
>>># FPGA Configuration Support
>>>#
>>># CONFIG_FPGA is not set
>>>
>>>#
>>># Firmware Drivers
>>>#
>>>CONFIG_EDD=3Dm
>>># CONFIG_EDD_OFF is not set
>>>CONFIG_FIRMWARE_MEMMAP=3Dy
>>>CONFIG_DELL_RBU=3Dm
>>>CONFIG_DCDBAS=3Dm
>>>CONFIG_DMIID=3Dy
>>>CONFIG_DMI_SYSFS=3Dy
>>>CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
>>>CONFIG_ISCSI_IBFT_FIND=3Dy
>>>CONFIG_ISCSI_IBFT=3Dm
>>># CONFIG_FW_CFG_SYSFS is not set
>>># CONFIG_GOOGLE_FIRMWARE is not set
>>>
>>>#
>>># EFI (Extensible Firmware Interface) Support
>>>#
>>>CONFIG_EFI_VARS=3Dy
>>>CONFIG_EFI_ESRT=3Dy
>>>CONFIG_EFI_VARS_PSTORE=3Dy
>>>CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=3Dy
>>>CONFIG_EFI_RUNTIME_MAP=3Dy
>>># CONFIG_EFI_FAKE_MEMMAP is not set
>>>CONFIG_EFI_RUNTIME_WRAPPERS=3Dy
>>># CONFIG_EFI_BOOTLOADER_CONTROL is not set
>>># CONFIG_EFI_CAPSULE_LOADER is not set
>>>CONFIG_UEFI_CPER=3Dy
>>>
>>>#
>>># File systems
>>>#
>>>CONFIG_DCACHE_WORD_ACCESS=3Dy
>>>CONFIG_FS_IOMAP=3Dy
>>># CONFIG_EXT2_FS is not set
>>># CONFIG_EXT3_FS is not set
>>>CONFIG_EXT4_FS=3Dy
>>>CONFIG_EXT4_USE_FOR_EXT2=3Dy
>>>CONFIG_EXT4_FS_POSIX_ACL=3Dy
>>>CONFIG_EXT4_FS_SECURITY=3Dy
>>># CONFIG_EXT4_ENCRYPTION is not set
>>># CONFIG_EXT4_DEBUG is not set
>>>CONFIG_JBD2=3Dy
>>># CONFIG_JBD2_DEBUG is not set
>>>CONFIG_FS_MBCACHE=3Dy
>>># CONFIG_REISERFS_FS is not set
>>># CONFIG_JFS_FS is not set
>>>CONFIG_XFS_FS=3Dy
>>>CONFIG_XFS_QUOTA=3Dy
>>>CONFIG_XFS_POSIX_ACL=3Dy
>>># CONFIG_XFS_RT is not set
>>># CONFIG_XFS_WARN is not set
>>># CONFIG_XFS_DEBUG is not set
>>>CONFIG_GFS2_FS=3Dm
>>>CONFIG_GFS2_FS_LOCKING_DLM=3Dy
>>># CONFIG_OCFS2_FS is not set
>>>CONFIG_BTRFS_FS=3Dm
>>>CONFIG_BTRFS_FS_POSIX_ACL=3Dy
>>># CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
>>># CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
>>># CONFIG_BTRFS_DEBUG is not set
>>># CONFIG_BTRFS_ASSERT is not set
>>># CONFIG_NILFS2_FS is not set
>>>CONFIG_F2FS_FS=3Dm
>>>CONFIG_F2FS_STAT_FS=3Dy
>>>CONFIG_F2FS_FS_XATTR=3Dy
>>>CONFIG_F2FS_FS_POSIX_ACL=3Dy
>>># CONFIG_F2FS_FS_SECURITY is not set
>>># CONFIG_F2FS_CHECK_FS is not set
>>># CONFIG_F2FS_FS_ENCRYPTION is not set
>>># CONFIG_F2FS_IO_TRACE is not set
>>># CONFIG_F2FS_FAULT_INJECTION is not set
>>>CONFIG_FS_DAX=3Dy
>>>CONFIG_FS_POSIX_ACL=3Dy
>>>CONFIG_EXPORTFS=3Dy
>>># CONFIG_EXPORTFS_BLOCK_OPS is not set
>>>CONFIG_FILE_LOCKING=3Dy
>>>CONFIG_MANDATORY_FILE_LOCKING=3Dy
>>># CONFIG_FS_ENCRYPTION is not set
>>>CONFIG_FSNOTIFY=3Dy
>>>CONFIG_DNOTIFY=3Dy
>>>CONFIG_INOTIFY_USER=3Dy
>>>CONFIG_FANOTIFY=3Dy
>>>CONFIG_FANOTIFY_ACCESS_PERMISSIONS=3Dy
>>>CONFIG_QUOTA=3Dy
>>>CONFIG_QUOTA_NETLINK_INTERFACE=3Dy
>>>CONFIG_PRINT_QUOTA_WARNING=3Dy
>>># CONFIG_QUOTA_DEBUG is not set
>>>CONFIG_QUOTA_TREE=3Dy
>>># CONFIG_QFMT_V1 is not set
>>>CONFIG_QFMT_V2=3Dy
>>>CONFIG_QUOTACTL=3Dy
>>>CONFIG_QUOTACTL_COMPAT=3Dy
>>>CONFIG_AUTOFS4_FS=3Dy
>>>CONFIG_FUSE_FS=3Dm
>>>CONFIG_CUSE=3Dm
>>>CONFIG_OVERLAY_FS=3Dm
>>>
>>>#
>>># Caches
>>>#
>>>CONFIG_FSCACHE=3Dm
>>>CONFIG_FSCACHE_STATS=3Dy
>>># CONFIG_FSCACHE_HISTOGRAM is not set
>>># CONFIG_FSCACHE_DEBUG is not set
>>># CONFIG_FSCACHE_OBJECT_LIST is not set
>>>CONFIG_CACHEFILES=3Dm
>>># CONFIG_CACHEFILES_DEBUG is not set
>>># CONFIG_CACHEFILES_HISTOGRAM is not set
>>>
>>>#
>>># CD-ROM/DVD Filesystems
>>>#
>>>CONFIG_ISO9660_FS=3Dm
>>>CONFIG_JOLIET=3Dy
>>>CONFIG_ZISOFS=3Dy
>>>CONFIG_UDF_FS=3Dm
>>>CONFIG_UDF_NLS=3Dy
>>>
>>>#
>>># DOS/FAT/NT Filesystems
>>>#
>>>CONFIG_FAT_FS=3Dm
>>>CONFIG_MSDOS_FS=3Dm
>>>CONFIG_VFAT_FS=3Dm
>>>CONFIG_FAT_DEFAULT_CODEPAGE=3D437
>>>CONFIG_FAT_DEFAULT_IOCHARSET=3D"ascii"
>>># CONFIG_FAT_DEFAULT_UTF8 is not set
>>># CONFIG_NTFS_FS is not set
>>>
>>>#
>>># Pseudo filesystems
>>>#
>>>CONFIG_PROC_FS=3Dy
>>>CONFIG_PROC_KCORE=3Dy
>>>CONFIG_PROC_VMCORE=3Dy
>>>CONFIG_PROC_SYSCTL=3Dy
>>>CONFIG_PROC_PAGE_MONITOR=3Dy
>>># CONFIG_PROC_CHILDREN is not set
>>>CONFIG_KERNFS=3Dy
>>>CONFIG_SYSFS=3Dy
>>>CONFIG_TMPFS=3Dy
>>>CONFIG_TMPFS_POSIX_ACL=3Dy
>>>CONFIG_TMPFS_XATTR=3Dy
>>>CONFIG_HUGETLBFS=3Dy
>>>CONFIG_HUGETLB_PAGE=3Dy
>>>CONFIG_CONFIGFS_FS=3Dy
>>>CONFIG_EFIVAR_FS=3Dy
>>>CONFIG_MISC_FILESYSTEMS=3Dy
>>># CONFIG_ORANGEFS_FS is not set
>>># CONFIG_ADFS_FS is not set
>>># CONFIG_AFFS_FS is not set
>>># CONFIG_ECRYPT_FS is not set
>>># CONFIG_HFS_FS is not set
>>># CONFIG_HFSPLUS_FS is not set
>>># CONFIG_BEFS_FS is not set
>>># CONFIG_BFS_FS is not set
>>># CONFIG_EFS_FS is not set
>>># CONFIG_JFFS2_FS is not set
>>># CONFIG_UBIFS_FS is not set
>>># CONFIG_LOGFS is not set
>>>CONFIG_CRAMFS=3Dm
>>>CONFIG_SQUASHFS=3Dm
>>>CONFIG_SQUASHFS_FILE_CACHE=3Dy
>>># CONFIG_SQUASHFS_FILE_DIRECT is not set
>>>CONFIG_SQUASHFS_DECOMP_SINGLE=3Dy
>>># CONFIG_SQUASHFS_DECOMP_MULTI is not set
>>># CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU is not set
>>>CONFIG_SQUASHFS_XATTR=3Dy
>>>CONFIG_SQUASHFS_ZLIB=3Dy
>>># CONFIG_SQUASHFS_LZ4 is not set
>>>CONFIG_SQUASHFS_LZO=3Dy
>>>CONFIG_SQUASHFS_XZ=3Dy
>>># CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
>>># CONFIG_SQUASHFS_EMBEDDED is not set
>>>CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3D3
>>># CONFIG_VXFS_FS is not set
>>># CONFIG_MINIX_FS is not set
>>># CONFIG_OMFS_FS is not set
>>># CONFIG_HPFS_FS is not set
>>># CONFIG_QNX4FS_FS is not set
>>># CONFIG_QNX6FS_FS is not set
>>># CONFIG_ROMFS_FS is not set
>>>CONFIG_PSTORE=3Dy
>>>CONFIG_PSTORE_ZLIB_COMPRESS=3Dy
>>># CONFIG_PSTORE_LZO_COMPRESS is not set
>>># CONFIG_PSTORE_LZ4_COMPRESS is not set
>>># CONFIG_PSTORE_CONSOLE is not set
>>># CONFIG_PSTORE_PMSG is not set
>>># CONFIG_PSTORE_FTRACE is not set
>>>CONFIG_PSTORE_RAM=3Dm
>>># CONFIG_SYSV_FS is not set
>>># CONFIG_UFS_FS is not set
>>># CONFIG_EXOFS_FS is not set
>>>CONFIG_ORE=3Dm
>>>CONFIG_NETWORK_FILESYSTEMS=3Dy
>>>CONFIG_NFS_FS=3Dy
>>># CONFIG_NFS_V2 is not set
>>>CONFIG_NFS_V3=3Dy
>>>CONFIG_NFS_V3_ACL=3Dy
>>>CONFIG_NFS_V4=3Dm
>>># CONFIG_NFS_SWAP is not set
>>>CONFIG_NFS_V4_1=3Dy
>>>CONFIG_NFS_V4_2=3Dy
>>>CONFIG_PNFS_FILE_LAYOUT=3Dm
>>>CONFIG_PNFS_BLOCK=3Dm
>>>CONFIG_PNFS_OBJLAYOUT=3Dm
>>>CONFIG_PNFS_FLEXFILE_LAYOUT=3Dm
>>>CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN=3D"kernel.org"
>>># CONFIG_NFS_V4_1_MIGRATION is not set
>>>CONFIG_NFS_V4_SECURITY_LABEL=3Dy
>>>CONFIG_ROOT_NFS=3Dy
>>># CONFIG_NFS_USE_LEGACY_DNS is not set
>>>CONFIG_NFS_USE_KERNEL_DNS=3Dy
>>>CONFIG_NFS_DEBUG=3Dy
>>>CONFIG_NFSD=3Dm
>>>CONFIG_NFSD_V2_ACL=3Dy
>>>CONFIG_NFSD_V3=3Dy
>>>CONFIG_NFSD_V3_ACL=3Dy
>>>CONFIG_NFSD_V4=3Dy
>>># CONFIG_NFSD_BLOCKLAYOUT is not set
>>># CONFIG_NFSD_SCSILAYOUT is not set
>>># CONFIG_NFSD_FLEXFILELAYOUT is not set
>>>CONFIG_NFSD_V4_SECURITY_LABEL=3Dy
>>># CONFIG_NFSD_FAULT_INJECTION is not set
>>>CONFIG_GRACE_PERIOD=3Dy
>>>CONFIG_LOCKD=3Dy
>>>CONFIG_LOCKD_V4=3Dy
>>>CONFIG_NFS_ACL_SUPPORT=3Dy
>>>CONFIG_NFS_COMMON=3Dy
>>>CONFIG_SUNRPC=3Dy
>>>CONFIG_SUNRPC_GSS=3Dm
>>>CONFIG_SUNRPC_BACKCHANNEL=3Dy
>>>CONFIG_RPCSEC_GSS_KRB5=3Dm
>>>CONFIG_SUNRPC_DEBUG=3Dy
>>># CONFIG_CEPH_FS is not set
>>>CONFIG_CIFS=3Dm
>>>CONFIG_CIFS_STATS=3Dy
>>># CONFIG_CIFS_STATS2 is not set
>>>CONFIG_CIFS_WEAK_PW_HASH=3Dy
>>>CONFIG_CIFS_UPCALL=3Dy
>>>CONFIG_CIFS_XATTR=3Dy
>>>CONFIG_CIFS_POSIX=3Dy
>>>CONFIG_CIFS_ACL=3Dy
>>>CONFIG_CIFS_DEBUG=3Dy
>>># CONFIG_CIFS_DEBUG2 is not set
>>>CONFIG_CIFS_DFS_UPCALL=3Dy
>>>CONFIG_CIFS_SMB2=3Dy
>>># CONFIG_CIFS_SMB311 is not set
>>># CONFIG_CIFS_FSCACHE is not set
>>># CONFIG_NCP_FS is not set
>>># CONFIG_CODA_FS is not set
>>># CONFIG_AFS_FS is not set
>>>CONFIG_9P_FS=3Dy
>>>CONFIG_9P_FS_POSIX_ACL=3Dy
>>># CONFIG_9P_FS_SECURITY is not set
>>>CONFIG_NLS=3Dy
>>>CONFIG_NLS_DEFAULT=3D"utf8"
>>>CONFIG_NLS_CODEPAGE_437=3Dy
>>>CONFIG_NLS_CODEPAGE_737=3Dm
>>>CONFIG_NLS_CODEPAGE_775=3Dm
>>>CONFIG_NLS_CODEPAGE_850=3Dm
>>>CONFIG_NLS_CODEPAGE_852=3Dm
>>>CONFIG_NLS_CODEPAGE_855=3Dm
>>>CONFIG_NLS_CODEPAGE_857=3Dm
>>>CONFIG_NLS_CODEPAGE_860=3Dm
>>>CONFIG_NLS_CODEPAGE_861=3Dm
>>>CONFIG_NLS_CODEPAGE_862=3Dm
>>>CONFIG_NLS_CODEPAGE_863=3Dm
>>>CONFIG_NLS_CODEPAGE_864=3Dm
>>>CONFIG_NLS_CODEPAGE_865=3Dm
>>>CONFIG_NLS_CODEPAGE_866=3Dm
>>>CONFIG_NLS_CODEPAGE_869=3Dm
>>>CONFIG_NLS_CODEPAGE_936=3Dm
>>>CONFIG_NLS_CODEPAGE_950=3Dm
>>>CONFIG_NLS_CODEPAGE_932=3Dm
>>>CONFIG_NLS_CODEPAGE_949=3Dm
>>>CONFIG_NLS_CODEPAGE_874=3Dm
>>>CONFIG_NLS_ISO8859_8=3Dm
>>>CONFIG_NLS_CODEPAGE_1250=3Dm
>>>CONFIG_NLS_CODEPAGE_1251=3Dm
>>>CONFIG_NLS_ASCII=3Dy
>>>CONFIG_NLS_ISO8859_1=3Dm
>>>CONFIG_NLS_ISO8859_2=3Dm
>>>CONFIG_NLS_ISO8859_3=3Dm
>>>CONFIG_NLS_ISO8859_4=3Dm
>>>CONFIG_NLS_ISO8859_5=3Dm
>>>CONFIG_NLS_ISO8859_6=3Dm
>>>CONFIG_NLS_ISO8859_7=3Dm
>>>CONFIG_NLS_ISO8859_9=3Dm
>>>CONFIG_NLS_ISO8859_13=3Dm
>>>CONFIG_NLS_ISO8859_14=3Dm
>>>CONFIG_NLS_ISO8859_15=3Dm
>>>CONFIG_NLS_KOI8_R=3Dm
>>>CONFIG_NLS_KOI8_U=3Dm
>>>CONFIG_NLS_MAC_ROMAN=3Dm
>>>CONFIG_NLS_MAC_CELTIC=3Dm
>>>CONFIG_NLS_MAC_CENTEURO=3Dm
>>>CONFIG_NLS_MAC_CROATIAN=3Dm
>>>CONFIG_NLS_MAC_CYRILLIC=3Dm
>>>CONFIG_NLS_MAC_GAELIC=3Dm
>>>CONFIG_NLS_MAC_GREEK=3Dm
>>>CONFIG_NLS_MAC_ICELAND=3Dm
>>>CONFIG_NLS_MAC_INUIT=3Dm
>>>CONFIG_NLS_MAC_ROMANIAN=3Dm
>>>CONFIG_NLS_MAC_TURKISH=3Dm
>>>CONFIG_NLS_UTF8=3Dm
>>>CONFIG_DLM=3Dm
>>>CONFIG_DLM_DEBUG=3Dy
>>>
>>>#
>>># Kernel hacking
>>>#
>>>CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
>>>
>>>#
>>># printk and dmesg options
>>>#
>>>CONFIG_PRINTK_TIME=3Dy
>>>CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
>>>CONFIG_BOOT_PRINTK_DELAY=3Dy
>>>CONFIG_DYNAMIC_DEBUG=3Dy
>>>
>>>#
>>># Compile-time checks and compiler options
>>>#
>>># CONFIG_DEBUG_INFO is not set
>>># CONFIG_ENABLE_WARN_DEPRECATED is not set
>>>CONFIG_ENABLE_MUST_CHECK=3Dy
>>>CONFIG_FRAME_WARN=3D2048
>>>CONFIG_STRIP_ASM_SYMS=3Dy
>>># CONFIG_READABLE_ASM is not set
>>># CONFIG_UNUSED_SYMBOLS is not set
>>># CONFIG_PAGE_OWNER is not set
>>>CONFIG_DEBUG_FS=3Dy
>>>CONFIG_HEADERS_CHECK=3Dy
>>>CONFIG_DEBUG_SECTION_MISMATCH=3Dy
>>>CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
>>>CONFIG_ARCH_WANT_FRAME_POINTERS=3Dy
>>>CONFIG_FRAME_POINTER=3Dy
>>># CONFIG_STACK_VALIDATION is not set
>>># CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
>>>CONFIG_MAGIC_SYSRQ=3Dy
>>>CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
>>>CONFIG_DEBUG_KERNEL=3Dy
>>>
>>>#
>>># Memory Debugging
>>>#
>>># CONFIG_PAGE_EXTENSION is not set
>>># CONFIG_DEBUG_PAGEALLOC is not set
>>># CONFIG_PAGE_POISONING is not set
>>># CONFIG_DEBUG_PAGE_REF is not set
>>># CONFIG_DEBUG_OBJECTS is not set
>>># CONFIG_SLUB_DEBUG_ON is not set
>>># CONFIG_SLUB_STATS is not set
>>>CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
>>># CONFIG_DEBUG_KMEMLEAK is not set
>>># CONFIG_DEBUG_STACK_USAGE is not set
>>># CONFIG_DEBUG_VM is not set
>>># CONFIG_DEBUG_VIRTUAL is not set
>>>CONFIG_DEBUG_MEMORY_INIT=3Dy
>>>CONFIG_MEMORY_NOTIFIER_ERROR_INJECT=3Dm
>>># CONFIG_DEBUG_PER_CPU_MAPS is not set
>>>CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
>>>CONFIG_DEBUG_STACKOVERFLOW=3Dy
>>>CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
>>>CONFIG_HAVE_ARCH_KASAN=3Dy
>>># CONFIG_KASAN is not set
>>>CONFIG_ARCH_HAS_KCOV=3Dy
>>># CONFIG_KCOV is not set
>>>CONFIG_DEBUG_SHIRQ=3Dy
>>>
>>>#
>>># Debug Lockups and Hangs
>>>#
>>>CONFIG_LOCKUP_DETECTOR=3Dy
>>>CONFIG_HARDLOCKUP_DETECTOR=3Dy
>>>CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
>>>CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D1
>>># CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
>>>CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
>>># CONFIG_DETECT_HUNG_TASK is not set
>>># CONFIG_WQ_WATCHDOG is not set
>>>CONFIG_PANIC_ON_OOPS=3Dy
>>>CONFIG_PANIC_ON_OOPS_VALUE=3D1
>>>CONFIG_PANIC_TIMEOUT=3D0
>>>CONFIG_SCHED_DEBUG=3Dy
>>>CONFIG_SCHED_INFO=3Dy
>>>CONFIG_SCHEDSTATS=3Dy
>>># CONFIG_SCHED_STACK_END_CHECK is not set
>>># CONFIG_DEBUG_TIMEKEEPING is not set
>>>CONFIG_TIMER_STATS=3Dy
>>>
>>>#
>>># Lock Debugging (spinlocks, mutexes, etc...)
>>>#
>>># CONFIG_DEBUG_RT_MUTEXES is not set
>>># CONFIG_DEBUG_SPINLOCK is not set
>>># CONFIG_DEBUG_MUTEXES is not set
>>># CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
>>># CONFIG_DEBUG_LOCK_ALLOC is not set
>>># CONFIG_PROVE_LOCKING is not set
>>># CONFIG_LOCK_STAT is not set
>>>CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
>>># CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
>>>CONFIG_LOCK_TORTURE_TEST=3Dm
>>>CONFIG_STACKTRACE=3Dy
>>># CONFIG_DEBUG_KOBJECT is not set
>>>CONFIG_DEBUG_BUGVERBOSE=3Dy
>>>CONFIG_DEBUG_LIST=3Dy
>>># CONFIG_DEBUG_PI_LIST is not set
>>># CONFIG_DEBUG_SG is not set
>>># CONFIG_DEBUG_NOTIFIERS is not set
>>># CONFIG_DEBUG_CREDENTIALS is not set
>>>
>>>#
>>># RCU Debugging
>>>#
>>># CONFIG_PROVE_RCU is not set
>>>CONFIG_SPARSE_RCU_POINTER=3Dy
>>>CONFIG_TORTURE_TEST=3Dm
>>># CONFIG_RCU_PERF_TEST is not set
>>>CONFIG_RCU_TORTURE_TEST=3Dm
>>># CONFIG_RCU_TORTURE_TEST_SLOW_PREINIT is not set
>>># CONFIG_RCU_TORTURE_TEST_SLOW_INIT is not set
>>># CONFIG_RCU_TORTURE_TEST_SLOW_CLEANUP is not set
>>>CONFIG_RCU_CPU_STALL_TIMEOUT=3D60
>>># CONFIG_RCU_TRACE is not set
>>># CONFIG_RCU_EQS_DEBUG is not set
>>># CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
>>># CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
>>># CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
>>>CONFIG_NOTIFIER_ERROR_INJECTION=3Dm
>>># CONFIG_CPU_NOTIFIER_ERROR_INJECT is not set
>>>CONFIG_PM_NOTIFIER_ERROR_INJECT=3Dm
>>># CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
>>># CONFIG_FAULT_INJECTION is not set
>>>CONFIG_LATENCYTOP=3Dy
>>>CONFIG_ARCH_HAS_DEBUG_STRICT_USER_COPY_CHECKS=3Dy
>>># CONFIG_DEBUG_STRICT_USER_COPY_CHECKS is not set
>>>CONFIG_USER_STACKTRACE_SUPPORT=3Dy
>>>CONFIG_NOP_TRACER=3Dy
>>>CONFIG_HAVE_FUNCTION_TRACER=3Dy
>>>CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
>>>CONFIG_HAVE_FUNCTION_GRAPH_FP_TEST=3Dy
>>>CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
>>>CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
>>>CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
>>>CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
>>>CONFIG_HAVE_FENTRY=3Dy
>>>CONFIG_HAVE_C_RECORDMCOUNT=3Dy
>>>CONFIG_TRACER_MAX_TRACE=3Dy
>>>CONFIG_TRACE_CLOCK=3Dy
>>>CONFIG_RING_BUFFER=3Dy
>>>CONFIG_EVENT_TRACING=3Dy
>>>CONFIG_CONTEXT_SWITCH_TRACER=3Dy
>>>CONFIG_RING_BUFFER_ALLOW_SWAP=3Dy
>>>CONFIG_TRACING=3Dy
>>>CONFIG_GENERIC_TRACER=3Dy
>>>CONFIG_TRACING_SUPPORT=3Dy
>>>CONFIG_FTRACE=3Dy
>>>CONFIG_FUNCTION_TRACER=3Dy
>>>CONFIG_FUNCTION_GRAPH_TRACER=3Dy
>>># CONFIG_IRQSOFF_TRACER is not set
>>>CONFIG_SCHED_TRACER=3Dy
>>>CONFIG_FTRACE_SYSCALLS=3Dy
>>>CONFIG_TRACER_SNAPSHOT=3Dy
>>># CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
>>>CONFIG_BRANCH_PROFILE_NONE=3Dy
>>># CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
>>># CONFIG_PROFILE_ALL_BRANCHES is not set
>>>CONFIG_STACK_TRACER=3Dy
>>>CONFIG_BLK_DEV_IO_TRACE=3Dy
>>>CONFIG_KPROBE_EVENT=3Dy
>>>CONFIG_UPROBE_EVENT=3Dy
>>>CONFIG_PROBE_EVENTS=3Dy
>>>CONFIG_DYNAMIC_FTRACE=3Dy
>>>CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
>>>CONFIG_FUNCTION_PROFILER=3Dy
>>>CONFIG_FTRACE_MCOUNT_RECORD=3Dy
>>># CONFIG_FTRACE_STARTUP_TEST is not set
>>># CONFIG_MMIOTRACE is not set
>>># CONFIG_HIST_TRIGGERS is not set
>>># CONFIG_TRACEPOINT_BENCHMARK is not set
>>>CONFIG_RING_BUFFER_BENCHMARK=3Dm
>>># CONFIG_RING_BUFFER_STARTUP_TEST is not set
>>># CONFIG_TRACE_ENUM_MAP_FILE is not set
>>>CONFIG_TRACING_EVENTS_GPIO=3Dy
>>>
>>>#
>>># Runtime Testing
>>>#
>>>CONFIG_LKDTM=3Dm
>>># CONFIG_TEST_LIST_SORT is not set
>>># CONFIG_KPROBES_SANITY_TEST is not set
>>># CONFIG_BACKTRACE_SELF_TEST is not set
>>>CONFIG_RBTREE_TEST=3Dm
>>>CONFIG_INTERVAL_TREE_TEST=3Dm
>>>CONFIG_PERCPU_TEST=3Dm
>>>CONFIG_ATOMIC64_SELFTEST=3Dy
>>>CONFIG_ASYNC_RAID6_TEST=3Dm
>>># CONFIG_TEST_HEXDUMP is not set
>>># CONFIG_TEST_STRING_HELPERS is not set
>>>CONFIG_TEST_KSTRTOX=3Dm
>>># CONFIG_TEST_PRINTF is not set
>>># CONFIG_TEST_BITMAP is not set
>>># CONFIG_TEST_UUID is not set
>>># CONFIG_TEST_RHASHTABLE is not set
>>># CONFIG_TEST_HASH is not set
>>>CONFIG_PROVIDE_OHCI1394_DMA_INIT=3Dy
>>>CONFIG_BUILD_DOCSRC=3Dy
>>># CONFIG_DMA_API_DEBUG is not set
>>>CONFIG_TEST_LKM=3Dm
>>>CONFIG_TEST_USER_COPY=3Dm
>>>CONFIG_TEST_BPF=3Dm
>>>CONFIG_TEST_FIRMWARE=3Dm
>>>CONFIG_TEST_UDELAY=3Dm
>>># CONFIG_MEMTEST is not set
>>># CONFIG_TEST_STATIC_KEYS is not set
>>># CONFIG_SAMPLES is not set
>>>CONFIG_HAVE_ARCH_KGDB=3Dy
>>># CONFIG_KGDB is not set
>>>CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
>>># CONFIG_UBSAN is not set
>>>CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
>>>CONFIG_STRICT_DEVMEM=3Dy
>>># CONFIG_IO_STRICT_DEVMEM is not set
>>>CONFIG_X86_VERBOSE_BOOTUP=3Dy
>>>CONFIG_EARLY_PRINTK=3Dy
>>>CONFIG_EARLY_PRINTK_DBGP=3Dy
>>># CONFIG_EARLY_PRINTK_EFI is not set
>>># CONFIG_X86_PTDUMP_CORE is not set
>>># CONFIG_X86_PTDUMP is not set
>>># CONFIG_EFI_PGT_DUMP is not set
>>>CONFIG_DEBUG_RODATA_TEST=3Dy
>>># CONFIG_DEBUG_WX is not set
>>>CONFIG_DEBUG_SET_MODULE_RONX=3Dy
>>>CONFIG_DEBUG_NX_TEST=3Dm
>>>CONFIG_DOUBLEFAULT=3Dy
>>># CONFIG_DEBUG_TLBFLUSH is not set
>>># CONFIG_IOMMU_DEBUG is not set
>>># CONFIG_IOMMU_STRESS is not set
>>>CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
>>>CONFIG_X86_DECODER_SELFTEST=3Dy
>>>CONFIG_IO_DELAY_TYPE_0X80=3D0
>>>CONFIG_IO_DELAY_TYPE_0XED=3D1
>>>CONFIG_IO_DELAY_TYPE_UDELAY=3D2
>>>CONFIG_IO_DELAY_TYPE_NONE=3D3
>>>CONFIG_IO_DELAY_0X80=3Dy
>>># CONFIG_IO_DELAY_0XED is not set
>>># CONFIG_IO_DELAY_UDELAY is not set
>>># CONFIG_IO_DELAY_NONE is not set
>>>CONFIG_DEFAULT_IO_DELAY_TYPE=3D0
>>>CONFIG_DEBUG_BOOT_PARAMS=3Dy
>>># CONFIG_CPA_DEBUG is not set
>>>CONFIG_OPTIMIZE_INLINING=3Dy
>>># CONFIG_DEBUG_ENTRY is not set
>>># CONFIG_DEBUG_NMI_SELFTEST is not set
>>>CONFIG_X86_DEBUG_FPU=3Dy
>>># CONFIG_PUNIT_ATOM_DEBUG is not set
>>>
>>>#
>>># Security options
>>>#
>>>CONFIG_KEYS=3Dy
>>>CONFIG_PERSISTENT_KEYRINGS=3Dy
>>>CONFIG_BIG_KEYS=3Dy
>>>CONFIG_TRUSTED_KEYS=3Dy
>>>CONFIG_ENCRYPTED_KEYS=3Dy
>>># CONFIG_KEY_DH_OPERATIONS is not set
>>># CONFIG_SECURITY_DMESG_RESTRICT is not set
>>>CONFIG_SECURITY=3Dy
>>>CONFIG_SECURITYFS=3Dy
>>>CONFIG_SECURITY_NETWORK=3Dy
>>>CONFIG_SECURITY_NETWORK_XFRM=3Dy
>>># CONFIG_SECURITY_PATH is not set
>>>CONFIG_INTEL_TXT=3Dy
>>>CONFIG_LSM_MMAP_MIN_ADDR=3D65535
>>>CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
>>>CONFIG_HAVE_ARCH_HARDENED_USERCOPY=3Dy
>>># CONFIG_HARDENED_USERCOPY is not set
>>>CONFIG_SECURITY_SELINUX=3Dy
>>>CONFIG_SECURITY_SELINUX_BOOTPARAM=3Dy
>>>CONFIG_SECURITY_SELINUX_BOOTPARAM_VALUE=3D1
>>>CONFIG_SECURITY_SELINUX_DISABLE=3Dy
>>>CONFIG_SECURITY_SELINUX_DEVELOP=3Dy
>>>CONFIG_SECURITY_SELINUX_AVC_STATS=3Dy
>>>CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=3D1
>>># CONFIG_SECURITY_SELINUX_POLICYDB_VERSION_MAX is not set
>>># CONFIG_SECURITY_SMACK is not set
>>># CONFIG_SECURITY_TOMOYO is not set
>>># CONFIG_SECURITY_APPARMOR is not set
>>># CONFIG_SECURITY_LOADPIN is not set
>>># CONFIG_SECURITY_YAMA is not set
>>>CONFIG_INTEGRITY=3Dy
>>>CONFIG_INTEGRITY_SIGNATURE=3Dy
>>>CONFIG_INTEGRITY_ASYMMETRIC_KEYS=3Dy
>>>CONFIG_INTEGRITY_TRUSTED_KEYRING=3Dy
>>>CONFIG_INTEGRITY_AUDIT=3Dy
>>>CONFIG_IMA=3Dy
>>>CONFIG_IMA_MEASURE_PCR_IDX=3D10
>>>CONFIG_IMA_LSM_RULES=3Dy
>>># CONFIG_IMA_TEMPLATE is not set
>>>CONFIG_IMA_NG_TEMPLATE=3Dy
>>># CONFIG_IMA_SIG_TEMPLATE is not set
>>>CONFIG_IMA_DEFAULT_TEMPLATE=3D"ima-ng"
>>>CONFIG_IMA_DEFAULT_HASH_SHA1=3Dy
>>># CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
>>># CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
>>># CONFIG_IMA_DEFAULT_HASH_WP512 is not set
>>>CONFIG_IMA_DEFAULT_HASH=3D"sha1"
>>># CONFIG_IMA_WRITE_POLICY is not set
>>># CONFIG_IMA_READ_POLICY is not set
>>>CONFIG_IMA_APPRAISE=3Dy
>>>CONFIG_IMA_TRUSTED_KEYRING=3Dy
>>># CONFIG_IMA_BLACKLIST_KEYRING is not set
>>># CONFIG_IMA_LOAD_X509 is not set
>>>CONFIG_EVM=3Dy
>>>CONFIG_EVM_ATTR_FSUUID=3Dy
>>># CONFIG_EVM_LOAD_X509 is not set
>>>CONFIG_DEFAULT_SECURITY_SELINUX=3Dy
>>># CONFIG_DEFAULT_SECURITY_DAC is not set
>>>CONFIG_DEFAULT_SECURITY=3D"selinux"
>>>CONFIG_XOR_BLOCKS=3Dm
>>>CONFIG_ASYNC_CORE=3Dm
>>>CONFIG_ASYNC_MEMCPY=3Dm
>>>CONFIG_ASYNC_XOR=3Dm
>>>CONFIG_ASYNC_PQ=3Dm
>>>CONFIG_ASYNC_RAID6_RECOV=3Dm
>>>CONFIG_CRYPTO=3Dy
>>>
>>>#
>>># Crypto core or helper
>>>#
>>>CONFIG_CRYPTO_ALGAPI=3Dy
>>>CONFIG_CRYPTO_ALGAPI2=3Dy
>>>CONFIG_CRYPTO_AEAD=3Dy
>>>CONFIG_CRYPTO_AEAD2=3Dy
>>>CONFIG_CRYPTO_BLKCIPHER=3Dy
>>>CONFIG_CRYPTO_BLKCIPHER2=3Dy
>>>CONFIG_CRYPTO_HASH=3Dy
>>>CONFIG_CRYPTO_HASH2=3Dy
>>>CONFIG_CRYPTO_RNG=3Dy
>>>CONFIG_CRYPTO_RNG2=3Dy
>>>CONFIG_CRYPTO_RNG_DEFAULT=3Dy
>>>CONFIG_CRYPTO_AKCIPHER2=3Dy
>>>CONFIG_CRYPTO_AKCIPHER=3Dy
>>>CONFIG_CRYPTO_KPP2=3Dy
>>>CONFIG_CRYPTO_RSA=3Dy
>>># CONFIG_CRYPTO_DH is not set
>>># CONFIG_CRYPTO_ECDH is not set
>>>CONFIG_CRYPTO_MANAGER=3Dy
>>>CONFIG_CRYPTO_MANAGER2=3Dy
>>>CONFIG_CRYPTO_USER=3Dm
>>>CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
>>>CONFIG_CRYPTO_GF128MUL=3Dm
>>>CONFIG_CRYPTO_NULL=3Dy
>>>CONFIG_CRYPTO_NULL2=3Dy
>>>CONFIG_CRYPTO_PCRYPT=3Dm
>>>CONFIG_CRYPTO_WORKQUEUE=3Dy
>>>CONFIG_CRYPTO_CRYPTD=3Dm
>>># CONFIG_CRYPTO_MCRYPTD is not set
>>>CONFIG_CRYPTO_AUTHENC=3Dm
>>>CONFIG_CRYPTO_TEST=3Dm
>>>CONFIG_CRYPTO_ABLK_HELPER=3Dm
>>>CONFIG_CRYPTO_GLUE_HELPER_X86=3Dm
>>>
>>>#
>>># Authenticated Encryption with Associated Data
>>>#
>>>CONFIG_CRYPTO_CCM=3Dm
>>>CONFIG_CRYPTO_GCM=3Dm
>>># CONFIG_CRYPTO_CHACHA20POLY1305 is not set
>>>CONFIG_CRYPTO_SEQIV=3Dy
>>>CONFIG_CRYPTO_ECHAINIV=3Dm
>>>
>>>#
>>># Block modes
>>>#
>>>CONFIG_CRYPTO_CBC=3Dy
>>>CONFIG_CRYPTO_CTR=3Dy
>>>CONFIG_CRYPTO_CTS=3Dm
>>>CONFIG_CRYPTO_ECB=3Dy
>>>CONFIG_CRYPTO_LRW=3Dm
>>>CONFIG_CRYPTO_PCBC=3Dm
>>>CONFIG_CRYPTO_XTS=3Dm
>>># CONFIG_CRYPTO_KEYWRAP is not set
>>>
>>>#
>>># Hash modes
>>>#
>>>CONFIG_CRYPTO_CMAC=3Dm
>>>CONFIG_CRYPTO_HMAC=3Dy
>>>CONFIG_CRYPTO_XCBC=3Dm
>>>CONFIG_CRYPTO_VMAC=3Dm
>>>
>>>#
>>># Digest
>>>#
>>>CONFIG_CRYPTO_CRC32C=3Dy
>>>CONFIG_CRYPTO_CRC32C_INTEL=3Dm
>>>CONFIG_CRYPTO_CRC32=3Dm
>>>CONFIG_CRYPTO_CRC32_PCLMUL=3Dm
>>>CONFIG_CRYPTO_CRCT10DIF=3Dy
>>>CONFIG_CRYPTO_CRCT10DIF_PCLMUL=3Dm
>>>CONFIG_CRYPTO_GHASH=3Dm
>>># CONFIG_CRYPTO_POLY1305 is not set
>>># CONFIG_CRYPTO_POLY1305_X86_64 is not set
>>>CONFIG_CRYPTO_MD4=3Dm
>>>CONFIG_CRYPTO_MD5=3Dy
>>>CONFIG_CRYPTO_MICHAEL_MIC=3Dm
>>>CONFIG_CRYPTO_RMD128=3Dm
>>>CONFIG_CRYPTO_RMD160=3Dm
>>>CONFIG_CRYPTO_RMD256=3Dm
>>>CONFIG_CRYPTO_RMD320=3Dm
>>>CONFIG_CRYPTO_SHA1=3Dy
>>>CONFIG_CRYPTO_SHA1_SSSE3=3Dm
>>>CONFIG_CRYPTO_SHA256_SSSE3=3Dm
>>>CONFIG_CRYPTO_SHA512_SSSE3=3Dm
>>># CONFIG_CRYPTO_SHA1_MB is not set
>>># CONFIG_CRYPTO_SHA256_MB is not set
>>># CONFIG_CRYPTO_SHA512_MB is not set
>>>CONFIG_CRYPTO_SHA256=3Dy
>>>CONFIG_CRYPTO_SHA512=3Dm
>>># CONFIG_CRYPTO_SHA3 is not set
>>>CONFIG_CRYPTO_TGR192=3Dm
>>>CONFIG_CRYPTO_WP512=3Dm
>>>CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=3Dm
>>>
>>>#
>>># Ciphers
>>>#
>>>CONFIG_CRYPTO_AES=3Dy
>>>CONFIG_CRYPTO_AES_X86_64=3Dy
>>>CONFIG_CRYPTO_AES_NI_INTEL=3Dm
>>>CONFIG_CRYPTO_ANUBIS=3Dm
>>>CONFIG_CRYPTO_ARC4=3Dm
>>>CONFIG_CRYPTO_BLOWFISH=3Dm
>>>CONFIG_CRYPTO_BLOWFISH_COMMON=3Dm
>>>CONFIG_CRYPTO_BLOWFISH_X86_64=3Dm
>>>CONFIG_CRYPTO_CAMELLIA=3Dm
>>>CONFIG_CRYPTO_CAMELLIA_X86_64=3Dm
>>>CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dm
>>>CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=3Dm
>>>CONFIG_CRYPTO_CAST_COMMON=3Dm
>>>CONFIG_CRYPTO_CAST5=3Dm
>>>CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dm
>>>CONFIG_CRYPTO_CAST6=3Dm
>>>CONFIG_CRYPTO_CAST6_AVX_X86_64=3Dm
>>>CONFIG_CRYPTO_DES=3Dm
>>># CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
>>>CONFIG_CRYPTO_FCRYPT=3Dm
>>>CONFIG_CRYPTO_KHAZAD=3Dm
>>>CONFIG_CRYPTO_SALSA20=3Dm
>>>CONFIG_CRYPTO_SALSA20_X86_64=3Dm
>>># CONFIG_CRYPTO_CHACHA20 is not set
>>># CONFIG_CRYPTO_CHACHA20_X86_64 is not set
>>>CONFIG_CRYPTO_SEED=3Dm
>>>CONFIG_CRYPTO_SERPENT=3Dm
>>>CONFIG_CRYPTO_SERPENT_SSE2_X86_64=3Dm
>>>CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dm
>>>CONFIG_CRYPTO_SERPENT_AVX2_X86_64=3Dm
>>>CONFIG_CRYPTO_TEA=3Dm
>>>CONFIG_CRYPTO_TWOFISH=3Dm
>>>CONFIG_CRYPTO_TWOFISH_COMMON=3Dm
>>>CONFIG_CRYPTO_TWOFISH_X86_64=3Dm
>>>CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dm
>>>CONFIG_CRYPTO_TWOFISH_AVX_X86_64=3Dm
>>>
>>>#
>>># Compression
>>>#
>>>CONFIG_CRYPTO_DEFLATE=3Dm
>>>CONFIG_CRYPTO_LZO=3Dy
>>># CONFIG_CRYPTO_842 is not set
>>># CONFIG_CRYPTO_LZ4 is not set
>>># CONFIG_CRYPTO_LZ4HC is not set
>>>
>>>#
>>># Random Number Generation
>>>#
>>>CONFIG_CRYPTO_ANSI_CPRNG=3Dm
>>>CONFIG_CRYPTO_DRBG_MENU=3Dy
>>>CONFIG_CRYPTO_DRBG_HMAC=3Dy
>>># CONFIG_CRYPTO_DRBG_HASH is not set
>>># CONFIG_CRYPTO_DRBG_CTR is not set
>>>CONFIG_CRYPTO_DRBG=3Dy
>>>CONFIG_CRYPTO_JITTERENTROPY=3Dy
>>>CONFIG_CRYPTO_USER_API=3Dy
>>>CONFIG_CRYPTO_USER_API_HASH=3Dy
>>>CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy
>>># CONFIG_CRYPTO_USER_API_RNG is not set
>>># CONFIG_CRYPTO_USER_API_AEAD is not set
>>>CONFIG_CRYPTO_HASH_INFO=3Dy
>>>CONFIG_CRYPTO_HW=3Dy
>>>CONFIG_CRYPTO_DEV_PADLOCK=3Dm
>>>CONFIG_CRYPTO_DEV_PADLOCK_AES=3Dm
>>>CONFIG_CRYPTO_DEV_PADLOCK_SHA=3Dm
>>># CONFIG_CRYPTO_DEV_CCP is not set
>>># CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
>>># CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
>>># CONFIG_CRYPTO_DEV_QAT_C62X is not set
>>># CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
>>># CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
>>># CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
>>>CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
>>>CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
>>>CONFIG_X509_CERTIFICATE_PARSER=3Dy
>>># CONFIG_PKCS7_MESSAGE_PARSER is not set
>>>
>>>#
>>># Certificates for signature checking
>>>#
>>>CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
>>>CONFIG_SYSTEM_TRUSTED_KEYS=3D""
>>># CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
>>># CONFIG_SECONDARY_TRUSTED_KEYRING is not set
>>>CONFIG_HAVE_KVM=3Dy
>>>CONFIG_HAVE_KVM_IRQCHIP=3Dy
>>>CONFIG_HAVE_KVM_IRQFD=3Dy
>>>CONFIG_HAVE_KVM_IRQ_ROUTING=3Dy
>>>CONFIG_HAVE_KVM_EVENTFD=3Dy
>>>CONFIG_KVM_MMIO=3Dy
>>>CONFIG_KVM_ASYNC_PF=3Dy
>>>CONFIG_HAVE_KVM_MSI=3Dy
>>>CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=3Dy
>>>CONFIG_KVM_VFIO=3Dy
>>>CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=3Dy
>>>CONFIG_KVM_COMPAT=3Dy
>>>CONFIG_HAVE_KVM_IRQ_BYPASS=3Dy
>>>CONFIG_VIRTUALIZATION=3Dy
>>>CONFIG_KVM=3Dm
>>>CONFIG_KVM_INTEL=3Dm
>>>CONFIG_KVM_AMD=3Dm
>>>CONFIG_KVM_MMU_AUDIT=3Dy
>>># CONFIG_KVM_DEVICE_ASSIGNMENT is not set
>>>CONFIG_VHOST_NET=3Dm
>>># CONFIG_VHOST_SCSI is not set
>>># CONFIG_VHOST_VSOCK is not set
>>>CONFIG_VHOST=3Dm
>>># CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
>>>CONFIG_BINARY_PRINTF=3Dy
>>>
>>>#
>>># Library routines
>>>#
>>>CONFIG_RAID6_PQ=3Dm
>>>CONFIG_BITREVERSE=3Dy
>>># CONFIG_HAVE_ARCH_BITREVERSE is not set
>>>CONFIG_RATIONAL=3Dy
>>>CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
>>>CONFIG_GENERIC_STRNLEN_USER=3Dy
>>>CONFIG_GENERIC_NET_UTILS=3Dy
>>>CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
>>>CONFIG_GENERIC_PCI_IOMAP=3Dy
>>>CONFIG_GENERIC_IOMAP=3Dy
>>>CONFIG_GENERIC_IO=3Dy
>>>CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
>>>CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
>>>CONFIG_CRC_CCITT=3Dy
>>>CONFIG_CRC16=3Dy
>>>CONFIG_CRC_T10DIF=3Dy
>>>CONFIG_CRC_ITU_T=3Dm
>>>CONFIG_CRC32=3Dy
>>># CONFIG_CRC32_SELFTEST is not set
>>>CONFIG_CRC32_SLICEBY8=3Dy
>>># CONFIG_CRC32_SLICEBY4 is not set
>>># CONFIG_CRC32_SARWATE is not set
>>># CONFIG_CRC32_BIT is not set
>>># CONFIG_CRC7 is not set
>>>CONFIG_LIBCRC32C=3Dy
>>>CONFIG_CRC8=3Dm
>>># CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
>>># CONFIG_RANDOM32_SELFTEST is not set
>>>CONFIG_ZLIB_INFLATE=3Dy
>>>CONFIG_ZLIB_DEFLATE=3Dy
>>>CONFIG_LZO_COMPRESS=3Dy
>>>CONFIG_LZO_DECOMPRESS=3Dy
>>>CONFIG_LZ4_DECOMPRESS=3Dy
>>>CONFIG_XZ_DEC=3Dy
>>>CONFIG_XZ_DEC_X86=3Dy
>>>CONFIG_XZ_DEC_POWERPC=3Dy
>>>CONFIG_XZ_DEC_IA64=3Dy
>>>CONFIG_XZ_DEC_ARM=3Dy
>>>CONFIG_XZ_DEC_ARMTHUMB=3Dy
>>>CONFIG_XZ_DEC_SPARC=3Dy
>>>CONFIG_XZ_DEC_BCJ=3Dy
>>># CONFIG_XZ_DEC_TEST is not set
>>>CONFIG_DECOMPRESS_GZIP=3Dy
>>>CONFIG_DECOMPRESS_BZIP2=3Dy
>>>CONFIG_DECOMPRESS_LZMA=3Dy
>>>CONFIG_DECOMPRESS_XZ=3Dy
>>>CONFIG_DECOMPRESS_LZO=3Dy
>>>CONFIG_DECOMPRESS_LZ4=3Dy
>>>CONFIG_GENERIC_ALLOCATOR=3Dy
>>>CONFIG_REED_SOLOMON=3Dm
>>>CONFIG_REED_SOLOMON_ENC8=3Dy
>>>CONFIG_REED_SOLOMON_DEC8=3Dy
>>>CONFIG_TEXTSEARCH=3Dy
>>>CONFIG_TEXTSEARCH_KMP=3Dm
>>>CONFIG_TEXTSEARCH_BM=3Dm
>>>CONFIG_TEXTSEARCH_FSM=3Dm
>>>CONFIG_INTERVAL_TREE=3Dy
>>>CONFIG_RADIX_TREE_MULTIORDER=3Dy
>>>CONFIG_ASSOCIATIVE_ARRAY=3Dy
>>>CONFIG_HAS_IOMEM=3Dy
>>>CONFIG_HAS_IOPORT_MAP=3Dy
>>>CONFIG_HAS_DMA=3Dy
>>>CONFIG_CHECK_SIGNATURE=3Dy
>>>CONFIG_CPUMASK_OFFSTACK=3Dy
>>>CONFIG_CPU_RMAP=3Dy
>>>CONFIG_DQL=3Dy
>>>CONFIG_GLOB=3Dy
>>># CONFIG_GLOB_SELFTEST is not set
>>>CONFIG_NLATTR=3Dy
>>>CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=3Dy
>>>CONFIG_CLZ_TAB=3Dy
>>>CONFIG_CORDIC=3Dm
>>># CONFIG_DDR is not set
>>>CONFIG_IRQ_POLL=3Dy
>>>CONFIG_MPILIB=3Dy
>>>CONFIG_SIGNATURE=3Dy
>>>CONFIG_OID_REGISTRY=3Dy
>>>CONFIG_UCS2_STRING=3Dy
>>>CONFIG_FONT_SUPPORT=3Dy
>>># CONFIG_FONTS is not set
>>>CONFIG_FONT_8x8=3Dy
>>>CONFIG_FONT_8x16=3Dy
>>># CONFIG_SG_SPLIT is not set
>>>CONFIG_SG_POOL=3Dy
>>>CONFIG_ARCH_HAS_SG_CHAIN=3Dy
>>>CONFIG_ARCH_HAS_PMEM_API=3Dy
>>>CONFIG_ARCH_HAS_MMIO_FLUSH=3Dy
>>
>>>#!/bin/sh
>>>
>>>export_top_env()
>>>{
>>>	export suite=3D'vm-scalability'
>>>	export testcase=3D'vm-scalability'
>>>	export category=3D'benchmark'
>>>	export runtime=3D300
>>>	export nr_task=3D1
>>>	export job_origin=3D'/lkp/lkp/src/allot/cyclic:linux-devel:devel-hourly=
/lkp-hsw-ep2/vm-scalability-swap-1pmem.yaml'
>>>	export queue=3D'bisect'
>>>	export testbox=3D'lkp-hsw-ep2'
>>>	export tbox_group=3D'lkp-hsw-ep2'
>>>	export submit_id=3D'5806e20d0b9a930bf6e46941'
>>>	export job_file=3D'/lkp/scheduled/lkp-hsw-ep2/vm-scalability-300-never-=
never-1-1-swap-w-rand-performance-debian-x86_64-2016-08-31.cgz-dc6db24d2476=
cd09c0ecf2b8d80313539f737a89-20161019-68598-s0bslh-0.yaml'
>>>	export id=3D'b2555caf6687c5b2436cbc197f7d666acd833151'
>>>	export model=3D'Brickland Haswell-EP'
>>>	export nr_cpu=3D72
>>>	export memory=3D'128G'
>>>	export nr_ssd_partitions=3D1
>>>	export ssd_partitions=3D'/dev/disk/by-id/ata-INTEL_SSDSC2BA800G3_BTTV45=
1305A2800JGN-part1'
>>>	export swap_partitions=3D
>>>	export rootfs_partition=3D
>>>	export brand=3D'Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz'
>>>	export need_kconfig=3D'CONFIG_LIBNVDIMM
>>>CONFIG_BTT
>>>CONFIG_BLK_DEV_PMEM
>>>CONFIG_X86_PMEM_LEGACY
>>>CONFIG_SWAP
>>>CONFIG_MMU
>>>CONFIG_BLOCK
>>>CONFIG_BLK_DEV_LOOP'
>>>	export commit=3D'dc6db24d2476cd09c0ecf2b8d80313539f737a89'
>>>	export kconfig=3D'x86_64-rhel-7.2'
>>>	export compiler=3D'gcc-6'
>>>	export rootfs=3D'debian-x86_64-2016-08-31.cgz'
>>>	export enqueue_time=3D'2016-10-19 11:01:34 +0800'
>>>	export _id=3D'5806e20d0b9a930bf6e46941'
>>>	export user=3D'lkp'
>>>	export head_commit=3D'1049ab9986e9c37c2b7f897b88fd4077bd20e2f9'
>>>	export base_commit=3D'1001354ca34179f3db924eb66672442a173147dc'
>>>	export branch=3D'linux-devel/devel-hourly-2016101817'
>>>	export result_root=3D'/result/vm-scalability/300-never-never-1-1-swap-w=
-rand-performance/lkp-hsw-ep2/debian-x86_64-2016-08-31.cgz/x86_64-rhel-7.2/=
gcc-6/dc6db24d2476cd09c0ecf2b8d80313539f737a89/0'
>>>	export LKP_SERVER=3D'inn'
>>>	export max_uptime=3D1500
>>>	export initrd=3D'/osimage/debian/debian-x86_64-2016-08-31.cgz'
>>>	export bootloader_append=3D'root=3D/dev/ram0
>>>user=3Dlkp
>>>job=3D/lkp/scheduled/lkp-hsw-ep2/vm-scalability-300-never-never-1-1-swap=
-w-rand-performance-debian-x86_64-2016-08-31.cgz-dc6db24d2476cd09c0ecf2b8d8=
0313539f737a89-20161019-68598-s0bslh-0.yaml
>>>ARCH=3Dx86_64
>>>kconfig=3Dx86_64-rhel-7.2
>>>branch=3Dlinux-devel/devel-hourly-2016101817
>>>commit=3Ddc6db24d2476cd09c0ecf2b8d80313539f737a89
>>>BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-7.2/gcc-6/dc6db24d2476cd09c0ecf2b8d8=
0313539f737a89/vmlinuz-4.8.0-rc1-00300-gdc6db24d
>>>memmap=3D96G!4G
>>>max_uptime=3D1500
>>>RESULT_ROOT=3D/result/vm-scalability/300-never-never-1-1-swap-w-rand-per=
formance/lkp-hsw-ep2/debian-x86_64-2016-08-31.cgz/x86_64-rhel-7.2/gcc-6/dc6=
db24d2476cd09c0ecf2b8d80313539f737a89/0
>>>LKP_SERVER=3Dinn
>>>debug
>>>apic=3Ddebug
>>>sysrq_always_enabled
>>>rcupdate.rcu_cpu_stall_timeout=3D100
>>>net.ifnames=3D0
>>>printk.devkmsg=3Don
>>>panic=3D-1
>>>softlockup_panic=3D1
>>>nmi_watchdog=3Dpanic
>>>oops=3Dpanic
>>>load_ramdisk=3D2
>>>prompt_ramdisk=3D0
>>>systemd.log_level=3Derr
>>>ignore_loglevel
>>>earlyprintk=3DttyS0,115200
>>>console=3DttyS0,115200
>>>console=3Dtty0
>>>vga=3Dnormal
>>>rw'
>>>	export lkp_initrd=3D'/lkp/lkp/lkp-x86_64.cgz'
>>>	export modules_initrd=3D'/pkg/linux/x86_64-rhel-7.2/gcc-6/dc6db24d2476c=
d09c0ecf2b8d80313539f737a89/modules.cgz'
>>>	export bm_initrd=3D'/osimage/deps/debian-x86_64-2016-08-31.cgz/lkp_2016=
-09-02.cgz,/osimage/deps/debian-x86_64-2016-08-31.cgz/rsync-rootfs_2016-09-=
02.cgz,/osimage/deps/debian-x86_64-2016-08-31.cgz/run-ipconfig_2016-09-02.c=
gz,/osimage/deps/debian-x86_64-2016-08-31.cgz/perf_2016-09-02.cgz,/osimage/=
pkg/debian-x86_64-2016-08-31.cgz/perf-x86_64.cgz,/osimage/deps/debian-x86_6=
4-2016-08-31.cgz/vm-scalability_2016-09-02.cgz,/osimage/pkg/debian-x86_64-2=
016-08-31.cgz/vm-scalability-x86_64_2016-09-02.cgz,/osimage/pkg/common/vm-s=
calability-x86_64.cgz,/osimage/deps/debian-x86_64-2016-08-31.cgz/iostat_201=
6-09-02.cgz,/osimage/deps/debian-x86_64-2016-08-31.cgz/turbostat_2016-09-02=
.cgz,/osimage/pkg/debian-x86_64-2016-08-31.cgz/turbostat-x86_64_2016-09-02.=
cgz,/osimage/deps/debian-x86_64-2016-08-31.cgz/hw_2016-09-02.cgz'
>>>	export site=3D'inn'
>>>	export LKP_CGI_PORT=3D80
>>>	export LKP_CIFS_PORT=3D139
>>>	export kernel=3D'/pkg/linux/x86_64-rhel-7.2/gcc-6/dc6db24d2476cd09c0ecf=
2b8d80313539f737a89/vmlinuz-4.8.0-rc1-00300-gdc6db24d'
>>>	export dequeue_time=3D'2016-10-19 11:12:13 +0800'
>>>	export job_initrd=3D'/lkp/scheduled/lkp-hsw-ep2/vm-scalability-300-neve=
r-never-1-1-swap-w-rand-performance-debian-x86_64-2016-08-31.cgz-dc6db24d24=
76cd09c0ecf2b8d80313539f737a89-20161019-68598-s0bslh-0.cgz'
>>>
>>>	[ -n "$LKP_SRC" ] ||
>>>	export LKP_SRC=3D/lkp/${user:-lkp}/src
>>>}
>>>
>>>run_job()
>>>{
>>>	echo $$ > $TMP/run-job.pid
>>>
>>>	. $LKP_SRC/lib/http.sh
>>>	. $LKP_SRC/lib/job.sh
>>>	. $LKP_SRC/lib/env.sh
>>>
>>>	export_top_env
>>>
>>>	run_setup thp_enabled=3D'never' thp_defrag=3D'never' $LKP_SRC/setup/tra=
nsparent_hugepage
>>>
>>>	run_setup nr_pmem=3D1 $LKP_SRC/setup/disk
>>>
>>>	run_setup $LKP_SRC/setup/swap
>>>
>>>	run_setup bp_memmap=3D'96G!4G' $LKP_SRC/setup/boot_params
>>>
>>>	run_setup $LKP_SRC/setup/cpufreq_governor 'performance'
>>>
>>>	run_monitor delay=3D20 $LKP_SRC/monitors/no-stdout/wrapper perf-profile
>>>	run_monitor $LKP_SRC/monitors/wrapper kmsg
>>>	run_monitor $LKP_SRC/monitors/wrapper iostat
>>>	run_monitor $LKP_SRC/monitors/wrapper heartbeat
>>>	run_monitor $LKP_SRC/monitors/wrapper vmstat
>>>	run_monitor $LKP_SRC/monitors/wrapper numa-numastat
>>>	run_monitor $LKP_SRC/monitors/wrapper numa-vmstat
>>>	run_monitor $LKP_SRC/monitors/wrapper numa-meminfo
>>>	run_monitor $LKP_SRC/monitors/wrapper proc-vmstat
>>>	run_monitor $LKP_SRC/monitors/wrapper proc-stat
>>>	run_monitor $LKP_SRC/monitors/wrapper meminfo
>>>	run_monitor $LKP_SRC/monitors/wrapper slabinfo
>>>	run_monitor $LKP_SRC/monitors/wrapper interrupts
>>>	run_monitor $LKP_SRC/monitors/wrapper lock_stat
>>>	run_monitor $LKP_SRC/monitors/wrapper latency_stats
>>>	run_monitor $LKP_SRC/monitors/wrapper softirqs
>>>	run_monitor $LKP_SRC/monitors/one-shot/wrapper bdi_dev_mapping
>>>	run_monitor $LKP_SRC/monitors/wrapper diskstats
>>>	run_monitor $LKP_SRC/monitors/wrapper nfsstat
>>>	run_monitor $LKP_SRC/monitors/wrapper cpuidle
>>>	run_monitor $LKP_SRC/monitors/wrapper cpufreq-stats
>>>	run_monitor $LKP_SRC/monitors/wrapper turbostat
>>>	run_monitor $LKP_SRC/monitors/wrapper sched_debug
>>>	run_monitor $LKP_SRC/monitors/wrapper perf-stat
>>>	run_monitor $LKP_SRC/monitors/wrapper oom-killer
>>>	run_monitor $LKP_SRC/monitors/plain/watchdog
>>>	run_monitor $LKP_SRC/monitors/wrapper nfs-hang
>>>
>>>	run_test test=3D'swap-w-rand' $LKP_SRC/tests/wrapper vm-scalability
>>>}
>>>
>>>extract_stats()
>>>{
>>>	$LKP_SRC/stats/wrapper perf-profile
>>>	$LKP_SRC/stats/wrapper vm-scalability
>>>	$LKP_SRC/stats/wrapper kmsg
>>>	$LKP_SRC/stats/wrapper iostat
>>>	$LKP_SRC/stats/wrapper vmstat
>>>	$LKP_SRC/stats/wrapper numa-numastat
>>>	$LKP_SRC/stats/wrapper numa-vmstat
>>>	$LKP_SRC/stats/wrapper numa-meminfo
>>>	$LKP_SRC/stats/wrapper proc-vmstat
>>>	$LKP_SRC/stats/wrapper meminfo
>>>	$LKP_SRC/stats/wrapper slabinfo
>>>	$LKP_SRC/stats/wrapper interrupts
>>>	$LKP_SRC/stats/wrapper lock_stat
>>>	$LKP_SRC/stats/wrapper latency_stats
>>>	$LKP_SRC/stats/wrapper softirqs
>>>	$LKP_SRC/stats/wrapper diskstats
>>>	$LKP_SRC/stats/wrapper nfsstat
>>>	$LKP_SRC/stats/wrapper cpuidle
>>>	$LKP_SRC/stats/wrapper turbostat
>>>	$LKP_SRC/stats/wrapper sched_debug
>>>	$LKP_SRC/stats/wrapper perf-stat
>>>
>>>	$LKP_SRC/stats/wrapper time vm-scalability.time
>>>	$LKP_SRC/stats/wrapper time
>>>	$LKP_SRC/stats/wrapper dmesg
>>>	$LKP_SRC/stats/wrapper kmsg
>>>	$LKP_SRC/stats/wrapper stderr
>>>	$LKP_SRC/stats/wrapper last_state
>>>}
>>>
>>>"$@"
>>
>>
>>>---
>>>
>>>#! jobs/vm-scalability-swap-1pmem.yaml
>>>suite: vm-scalability
>>>testcase: vm-scalability
>>>category: benchmark
>>>runtime: 300
>>>transparent_hugepage:
>>> thp_enabled: never
>>> thp_defrag: never
>>>nr_task: 1
>>>disk:
>>> nr_pmem: 1
>>>swap:
>>>perf-profile:
>>> delay: 20
>>>vm-scalability:
>>> test: swap-w-rand
>>>boot_params:
>>> bp_memmap: 96G!4G
>>>job_origin: "/lkp/lkp/src/allot/cyclic:linux-devel:devel-hourly/lkp-hsw-=
ep2/vm-scalability-swap-1pmem.yaml"
>>>
>>>#! queue options
>>>queue: bisect
>>>testbox: lkp-hsw-ep2
>>>tbox_group: lkp-hsw-ep2
>>>submit_id: 5806e20d0b9a930bf6e46941
>>>job_file: "/lkp/scheduled/lkp-hsw-ep2/vm-scalability-300-never-never-1-1=
-swap-w-rand-performance-debian-x86_64-2016-08-31.cgz-dc6db24d2476cd09c0ecf=
2b8d80313539f737a89-20161019-68598-s0bslh-0.yaml"
>>>id: b2555caf6687c5b2436cbc197f7d666acd833151
>>>
>>>#! hosts/lkp-hsw-ep2
>>>model: Brickland Haswell-EP
>>>nr_cpu: 72
>>>memory: 128G
>>>nr_ssd_partitions: 1
>>>ssd_partitions: "/dev/disk/by-id/ata-INTEL_SSDSC2BA800G3_BTTV451305A2800=
JGN-part1"
>>>swap_partitions:
>>>rootfs_partition:
>>>brand: Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz
>>>
>>>#! include/category/benchmark
>>>kmsg:
>>>iostat:
>>>heartbeat:
>>>vmstat:
>>>numa-numastat:
>>>numa-vmstat:
>>>numa-meminfo:
>>>proc-vmstat:
>>>proc-stat:
>>>meminfo:
>>>slabinfo:
>>>interrupts:
>>>lock_stat:
>>>latency_stats:
>>>softirqs:
>>>bdi_dev_mapping:
>>>diskstats:
>>>nfsstat:
>>>cpuidle:
>>>cpufreq-stats:
>>>turbostat:
>>>sched_debug:
>>>perf-stat:
>>>
>>>#! include/category/ALL
>>>cpufreq_governor: performance
>>>
>>>#! include/disk/nr_pmem
>>>need_kconfig:
>>>- CONFIG_LIBNVDIMM
>>>- CONFIG_BTT
>>>- CONFIG_BLK_DEV_PMEM
>>>- CONFIG_X86_PMEM_LEGACY
>>>- CONFIG_SWAP
>>>- CONFIG_MMU
>>>- CONFIG_BLOCK
>>>- CONFIG_BLK_DEV_LOOP
>>>
>>>#! include/swap
>>>
>>>#! include/vm-scalability
>>>
>>>#! include/queue/cyclic
>>>commit: dc6db24d2476cd09c0ecf2b8d80313539f737a89
>>>
>>>#! default params
>>>kconfig: x86_64-rhel-7.2
>>>compiler: gcc-6
>>>rootfs: debian-x86_64-2016-08-31.cgz
>>>enqueue_time: 2016-10-19 11:01:34.729628118 +08:00
>>>_id: 5806e20d0b9a930bf6e46941
>>>
>>>#! schedule options
>>>user: lkp
>>>head_commit: 1049ab9986e9c37c2b7f897b88fd4077bd20e2f9
>>>base_commit: 1001354ca34179f3db924eb66672442a173147dc
>>>branch: linux-devel/devel-hourly-2016101817
>>>result_root: "/result/vm-scalability/300-never-never-1-1-swap-w-rand-per=
formance/lkp-hsw-ep2/debian-x86_64-2016-08-31.cgz/x86_64-rhel-7.2/gcc-6/dc6=
db24d2476cd09c0ecf2b8d80313539f737a89/0"
>>>LKP_SERVER: inn
>>>max_uptime: 1500
>>>initrd: "/osimage/debian/debian-x86_64-2016-08-31.cgz"
>>>bootloader_append:
>>>- root=3D/dev/ram0
>>>- user=3Dlkp
>>>- job=3D/lkp/scheduled/lkp-hsw-ep2/vm-scalability-300-never-never-1-1-sw=
ap-w-rand-performance-debian-x86_64-2016-08-31.cgz-dc6db24d2476cd09c0ecf2b8=
d80313539f737a89-20161019-68598-s0bslh-0.yaml
>>>- ARCH=3Dx86_64
>>>- kconfig=3Dx86_64-rhel-7.2
>>>- branch=3Dlinux-devel/devel-hourly-2016101817
>>>- commit=3Ddc6db24d2476cd09c0ecf2b8d80313539f737a89
>>>- BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-7.2/gcc-6/dc6db24d2476cd09c0ecf2b8=
d80313539f737a89/vmlinuz-4.8.0-rc1-00300-gdc6db24d
>>>- memmap=3D96G!4G
>>>- max_uptime=3D1500
>>>- RESULT_ROOT=3D/result/vm-scalability/300-never-never-1-1-swap-w-rand-p=
erformance/lkp-hsw-ep2/debian-x86_64-2016-08-31.cgz/x86_64-rhel-7.2/gcc-6/d=
c6db24d2476cd09c0ecf2b8d80313539f737a89/0
>>>- LKP_SERVER=3Dinn
>>>- debug
>>>- apic=3Ddebug
>>>- sysrq_always_enabled
>>>- rcupdate.rcu_cpu_stall_timeout=3D100
>>>- net.ifnames=3D0
>>>- printk.devkmsg=3Don
>>>- panic=3D-1
>>>- softlockup_panic=3D1
>>>- nmi_watchdog=3Dpanic
>>>- oops=3Dpanic
>>>- load_ramdisk=3D2
>>>- prompt_ramdisk=3D0
>>>- systemd.log_level=3Derr
>>>- ignore_loglevel
>>>- earlyprintk=3DttyS0,115200
>>>- console=3DttyS0,115200
>>>- console=3Dtty0
>>>- vga=3Dnormal
>>>- rw
>>>lkp_initrd: "/lkp/lkp/lkp-x86_64.cgz"
>>>modules_initrd: "/pkg/linux/x86_64-rhel-7.2/gcc-6/dc6db24d2476cd09c0ecf2=
b8d80313539f737a89/modules.cgz"
>>>bm_initrd: "/osimage/deps/debian-x86_64-2016-08-31.cgz/lkp_2016-09-02.cg=
z,/osimage/deps/debian-x86_64-2016-08-31.cgz/rsync-rootfs_2016-09-02.cgz,/o=
simage/deps/debian-x86_64-2016-08-31.cgz/run-ipconfig_2016-09-02.cgz,/osima=
ge/deps/debian-x86_64-2016-08-31.cgz/perf_2016-09-02.cgz,/osimage/pkg/debia=
n-x86_64-2016-08-31.cgz/perf-x86_64.cgz,/osimage/deps/debian-x86_64-2016-08=
-31.cgz/vm-scalability_2016-09-02.cgz,/osimage/pkg/debian-x86_64-2016-08-31=
.cgz/vm-scalability-x86_64_2016-09-02.cgz,/osimage/pkg/common/vm-scalabilit=
y-x86_64.cgz,/osimage/deps/debian-x86_64-2016-08-31.cgz/iostat_2016-09-02.c=
gz,/osimage/deps/debian-x86_64-2016-08-31.cgz/turbostat_2016-09-02.cgz,/osi=
mage/pkg/debian-x86_64-2016-08-31.cgz/turbostat-x86_64_2016-09-02.cgz,/osim=
age/deps/debian-x86_64-2016-08-31.cgz/hw_2016-09-02.cgz"
>>>site: inn
>>>
>>>#! include/site/inn
>>>LKP_CGI_PORT: 80
>>>LKP_CIFS_PORT: 139
>>>oom-killer:
>>>watchdog:
>>>nfs-hang:
>>>
>>>#! runtime status
>>>
>>>#! user overrides
>>>kernel: "/pkg/linux/x86_64-rhel-7.2/gcc-6/dc6db24d2476cd09c0ecf2b8d80313=
539f737a89/vmlinuz-4.8.0-rc1-00300-gdc6db24d"
>>>dequeue_time: 2016-10-19 11:12:13.814010809 +08:00
>>>job_state: booting
>>
>>>_______________________________________________
>>>LKP mailing list
>>>LKP(a)lists.01.org
>>>https://lists.01.org/mailman/listinfo/lkp
>>
>>
>>
>>
>
>

--===============0985057141185448391==--

