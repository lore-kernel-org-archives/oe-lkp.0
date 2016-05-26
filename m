Content-Type: multipart/mixed; boundary="===============4127601924041759029=="
MIME-Version: 1.0
From: Vincent Guittot <vincent.guittot@linaro.org>
To: lkp@lists.01.org
Subject: Re: [sched] a552935c0e: BUG: spinlock lockup suspected on CPU#1, swapper/1/0
Date: Thu, 26 May 2016 11:01:58 +0200
Message-ID: <CAKfTPtCoL+=D3s4idYHQREW_S5v4d0WjTCyHjcn97GCJGWam9w@mail.gmail.com>
In-Reply-To: <57468fb2.Hh5AOHqauSwXMloX%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4127601924041759029==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Fengguang,

I'm not able to reproduce this BUG, I have used the attached script
and config but the VM fails to boot even if i revert commit
a552935c0e1ef5ef53a4b4e74782182a6c83704d: (sched: fix first task of a
task group is attached twice):

...
[   14.702290] Key type encrypted registered
[   14.702290] Key type encrypted registered
[   14.711005] Freeing unused kernel memory: 1232K (ffffffff82365000 -
ffffffff82499000)
[   14.711005] Freeing unused kernel memory: 1232K (ffffffff82365000 -
ffffffff82499000)
[   14.711993] Write protecting the kernel read-only data: 14336k
[   14.711993] Write protecting the kernel read-only data: 14336k
[   14.713548] Freeing unused kernel memory: 192K (ffff8800017d0000 -
ffff880001800000)
[   14.713548] Freeing unused kernel memory: 192K (ffff8800017d0000 -
ffff880001800000)
[   14.719223] Freeing unused kernel memory: 900K (ffff880001d1f000 -
ffff880001e00000)
[   14.719223] Freeing unused kernel memory: 900K (ffff880001d1f000 -
ffff880001e00000)
[   14.729675] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[   14.729675] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[   14.732027] Failed to execute /init (error -8)
[   14.732027] Failed to execute /init (error -8)
[   14.733689] Starting init: /sbin/init exists but couldn't execute
it (error -8)
[   14.733689] Starting init: /sbin/init exists but couldn't execute
it (error -8)
[   14.734678] Starting init: /etc/init exists but couldn't execute it
(error -13)
[   14.734678] Starting init: /etc/init exists but couldn't execute it
(error -13)
[   14.736360] Starting init: /bin/sh exists but couldn't execute it (error=
 -8)
[   14.736360] Starting init: /bin/sh exists but couldn't execute it (error=
 -8)
[   14.737535] Kernel panic - not syncing: No working init found.  Try
passing init=3D option to kernel. See Linux Documentation/init.txt for
guidance.
[   14.737535] Kernel panic - not syncing: No working init found.  Try
passing init=3D option to kernel. See Linux Documentation/init.txt for
guidance.
[   14.739177] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
4.6.0-rc7+-240288-g74a45cb #9
[   14.739177] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
4.6.0-rc7+-240288-g74a45cb #9
[   14.740153]  0000000000000001[   14.740153]  0000000000000001
ffff8800002b3ec0 ffff8800002b3ec0 ffffffff8149ac84 ffffffff8149ac84
ffffffff81c11622 ffffffff81c11622

[   14.741110]  ffffffff81e42630[   14.741110]  ffffffff81e42630
ffff8800002b3f38 ffff8800002b3f38 ffffffff8115e014 ffffffff8115e014
ffff880000000008 ffff880000000008

[   14.742065]  ffff8800002b3f48[   14.742065]  ffff8800002b3f48
ffff8800002b3ee8 ffff8800002b3ee8 0000000000000001 0000000000000001
0000000000000000 0000000000000000

[   14.743023] Call Trace:
[   14.743023] Call Trace:
[   14.743342]  [<ffffffff8149ac84>] dump_stack+0x97/0xc2
[   14.743342]  [<ffffffff8149ac84>] dump_stack+0x97/0xc2
[   14.744065]  [<ffffffff8115e014>] panic+0x11e/0x2da
[   14.744065]  [<ffffffff8115e014>] panic+0x11e/0x2da
[   14.744700]  [<ffffffff817c3428>] kernel_init+0x17c/0x180
[   14.744700]  [<ffffffff817c3428>] kernel_init+0x17c/0x180
[   14.745447]  [<ffffffff817cb4c2>] ret_from_fork+0x22/0x40
[   14.745447]  [<ffffffff817cb4c2>] ret_from_fork+0x22/0x40
[   14.746258]  [<ffffffff817c32ac>] ? rest_init+0xc3/0xc3
[   14.746258]  [<ffffffff817c32ac>] ? rest_init+0xc3/0xc3
[   14.747206] Kernel Offset: disabled
[   14.747206] Kernel Offset: disabled

Regards,

On 26 May 2016 at 07:54, kernel test robot <fengguang.wu@intel.com> wrote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://git.linaro.org/people/vincent.guittot/kernel.git sched/pelt
>
> commit a552935c0e1ef5ef53a4b4e74782182a6c83704d
> Author:     Vincent Guittot <vincent.guittot@linaro.org>
> AuthorDate: Wed May 25 16:45:30 2016 +0200
> Commit:     Vincent Guittot <vincent.guittot@linaro.org>
> CommitDate: Wed May 25 16:46:06 2016 +0200
>
>     sched: fix first task of a task group is attached twice
>
>     The cfs_rq->avg.last_update_time is intialize to 0 with the main effe=
ct
>     that the 1st sched_entity that will be attached, will keep its
>     last_update_time set to 0 and will attached once again during the
>     enqueue.
>     Initialize cfs_rq->avg.last_update_time to 1 instead.
>
>     Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
>
> +------------------------------------------------------------------------=
-----------------+------------+------------+------------+
> |                                                                        =
                 | ef0491ea17 | a552935c0e | 906241951f |
> +------------------------------------------------------------------------=
-----------------+------------+------------+------------+
> | boot_successes                                                         =
                 | 980        | 0          | 0          |
> | boot_failures                                                          =
                 | 29         | 396        | 11         |
> | BUG:unable_to_handle_kernel                                            =
                 | 26         |            |            |
> | Oops                                                                   =
                 | 26         |            |            |
> | EIP_is_at_perf_prepare_sample                                          =
                 | 26         |            |            |
> | Kernel_panic-not_syncing:Fatal_exception_in_interrupt                  =
                 | 11         |            |            |
> | backtrace:trace_apic_timer_interrupt                                   =
                 | 1          |            |            |
> | backtrace:inode_init_once                                              =
                 | 1          |            |            |
> | backtrace:init_once                                                    =
                 | 1          |            |            |
> | backtrace:iterate_dir                                                  =
                 | 9          |            |            |
> | backtrace:SyS_getdents64                                               =
                 | 9          |            |            |
> | Kernel_panic-not_syncing:Fatal_exception                               =
                 | 15         |            |            |
> | BUG:workqueue_lockup-pool                                              =
                 | 3          | 1          |            |
> | BUG:workqueue_lockup-pool_cpus=3D#cpus=3D#node=3D#node=3D#flags=3D#nice=
=3D#flags=3D#nice=3D#stuck_for#s | 3          | 1          |            |
> | BUG:workqueue_lockup-pool_cpus=3D#-#cpus=3D#-#flags=3D#nice=3D#flags=3D=
#nice=3D#stuck_for#s         | 1          |            |            |
> | backtrace:vfs_fstatat                                                  =
                 | 2          |            |            |
> | backtrace:SyS_fstatat64                                                =
                 | 2          |            |            |
> | BUG:spinlock_lockup_suspected_on_CPU                                   =
                 | 0          | 156        | 11         |
> | EIP_is_at_native_apic_mem_write                                        =
                 | 0          | 156        | 11         |
> | EIP_is_at_set_task_rq_fair                                             =
                 | 0          | 156        | 11         |
> | backtrace:cpu_startup_entry                                            =
                 | 0          | 59         | 8          |
> | backtrace:ring_buffer_producer_thread                                  =
                 | 0          | 41         |            |
> | backtrace:ring_buffer_consumer_thread                                  =
                 | 0          | 3          |            |
> | backtrace:schedule_timeout                                             =
                 | 0          | 5          |            |
> | BUG:kernel_boot_hang                                                   =
                 | 0          | 239        |            |
> | backtrace:smpboot_thread_fn                                            =
                 | 0          | 2          |            |
> | backtrace:apic_timer_interrupt                                         =
                 | 0          | 1          |            |
> | INFO:rcu_sched_detected_stalls_on_CPUs/tasks                           =
                 | 0          | 4          |            |
> +------------------------------------------------------------------------=
-----------------+------------+------------+------------+
>
> [   90.944485] NX-protecting the kernel data: 8808k
> [   90.982969] x86/mm: Checked W+X mappings: passed, no W+X pages found.
> [   90.982969] x86/mm: Checked W+X mappings: passed, no W+X pages found.
> [  599.715979] BUG: spinlock lockup suspected on CPU#1, swapper/1/0
> [  599.715979] BUG: spinlock lockup suspected on CPU#1, swapper/1/0
> [  599.729478]  lock: 0xd1120ec0, .magic: dead4ead, .owner: init/1, .owne=
r_cpu: 0
> [  599.729478]  lock: 0xd1120ec0, .magic: dead4ead, .owner: init/1, .owne=
r_cpu: 0
> [  599.741301] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 4.6.0-rc7-00127-=
ga552935 #2
> [  599.741301] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 4.6.0-rc7-00127-=
ga552935 #2
> [  599.743118]  00000001
> [  599.743118]  00000001 00200046 00200046 00000000 00000000 c02d5dfc c02=
d5dfc c145ae3c c145ae3c c026738c c026738c d1120ec0 d1120ec0 c02d5e28 c02d5e=
28
>
> [  599.764055]  c10b1e02
> [  599.764055]  c10b1e02 c1b52624 c1b52624 d1120ec0 d1120ec0 dead4ead dea=
d4ead c026738c c026738c 00000001 00000001 00000000 00000000 d1120ec0 d1120e=
c0
>
> [  599.766128]  00000000
> [  599.766128]  00000000 00000000 00000000 c02d5e44 c02d5e44 c10b2059 c10=
b2059 a08ba36c a08ba36c 00000000 00000000 d1120ec0 d1120ec0 c10a1ec7 c10a1e=
c7
>
> [  599.790216] Call Trace:
> [  599.790216] Call Trace:
> [  599.790826]  [<c145ae3c>] dump_stack+0x86/0xb3
> [  599.790826]  [<c145ae3c>] dump_stack+0x86/0xb3
> [  599.791922]  [<c10b1e02>] spin_dump+0x92/0x9d
> [  599.791922]  [<c10b1e02>] spin_dump+0x92/0x9d
> [  599.793003]  [<c10b2059>] do_raw_spin_lock+0x1aa/0x210
> [  599.793003]  [<c10b2059>] do_raw_spin_lock+0x1aa/0x210
> [  599.794264]  [<c10a1ec7>] ? sched_rt_rq_enqueue+0xcd/0xcd
> [  599.794264]  [<c10a1ec7>] ? sched_rt_rq_enqueue+0xcd/0xcd
> [  599.811642]  [<c176331e>] _raw_spin_lock+0x2e/0x36
> [  599.811642]  [<c176331e>] _raw_spin_lock+0x2e/0x36
> [  599.812830]  [<c10a1fae>] ? sched_rt_period_timer+0xe7/0x3e1
> [  599.812830]  [<c10a1fae>] ? sched_rt_period_timer+0xe7/0x3e1
> [  599.814228]  [<c10a1fae>] sched_rt_period_timer+0xe7/0x3e1
> [  599.814228]  [<c10a1fae>] sched_rt_period_timer+0xe7/0x3e1
> [  599.815576]  [<c10a1ec7>] ? sched_rt_rq_enqueue+0xcd/0xcd
> [  599.815576]  [<c10a1ec7>] ? sched_rt_rq_enqueue+0xcd/0xcd
> [  599.835967]  [<c10db0a8>] __hrtimer_run_queues+0x1ff/0x396
> [  599.835967]  [<c10db0a8>] __hrtimer_run_queues+0x1ff/0x396
> [  599.837330]  [<c10dbb18>] hrtimer_interrupt+0x9a/0x1e9
> [  599.837330]  [<c10dbb18>] hrtimer_interrupt+0x9a/0x1e9
> [  599.849004]  [<c10960f6>] ? irqtime_account_irq+0xf0/0xf7
> [  599.849004]  [<c10960f6>] ? irqtime_account_irq+0xf0/0xf7
> [  599.850338]  [<c103ee95>] local_apic_timer_interrupt+0x5c/0x63
> [  599.850338]  [<c103ee95>] local_apic_timer_interrupt+0x5c/0x63
> [  599.861812]  [<c103f906>] smp_apic_timer_interrupt+0x25/0x34
> [  599.861812]  [<c103f906>] smp_apic_timer_interrupt+0x25/0x34
> [  599.863213]  [<c1764596>] apic_timer_interrupt+0x2a/0x30
> [  599.863213]  [<c1764596>] apic_timer_interrupt+0x2a/0x30
> [  599.883286]  [<c10d007b>] ? synchronize_sched_expedited+0x179/0x9f5
> [  599.883286]  [<c10d007b>] ? synchronize_sched_expedited+0x179/0x9f5
> [  599.884820]  [<c104a8cb>] ? native_safe_halt+0x5/0x7
> [  599.884820]  [<c104a8cb>] ? native_safe_halt+0x5/0x7
> [  599.886230]  [<c1029a70>] default_idle+0x1e/0x30
> [  599.886230]  [<c1029a70>] default_idle+0x1e/0x30
> [  599.887556]  [<c102a0be>] arch_cpu_idle+0xe/0x10
> [  599.887556]  [<c102a0be>] arch_cpu_idle+0xe/0x10
> [  599.914744]  [<c10a7d40>] default_idle_call+0x53/0x56
> [  599.914744]  [<c10a7d40>] default_idle_call+0x53/0x56
> [  599.915985]  [<c10a7ebb>] cpu_startup_entry+0x178/0x253
> [  599.915985]  [<c10a7ebb>] cpu_startup_entry+0x178/0x253
> [  599.917337]  [<c103d33e>] start_secondary+0x15f/0x166
> [  599.917337]  [<c103d33e>] start_secondary+0x15f/0x166
> [  599.932068] Sending NMI to all CPUs:
> [  599.932068] Sending NMI to all CPUs:
> [  599.933169] NMI backtrace for cpu 0
>
> git bisect start 906241951fb6bc8c79e004ff20531ae2ee669417 2dcd0af568b0cf5=
83645c8a317dd12e344b1c72a --
> git bisect  bad 6eb5a468fc5244546f8f0c86eb96c1fe9a1b10bf  # 08:19      0-=
     52  Merge 'linux-review/Mario-Limonciello/dell_rbu-Don-t-fallback-to-u=
serhelper/20160517-023154' into devel-spot-201605260216
> git bisect  bad 954c48eff63e25c9ad503d3a75636aa590ad61da  # 08:19      0-=
    450  Merge 'linux-review/Laurent-Pinchart/adv7604-Don-t-ignore-pad-numb=
er-in-subdev-DV-timings-pad-operations/20160525-133613' into devel-spot-201=
605260216
> git bisect  bad 467c9a273234493ef1f746cd3cb55b881cee12be  # 08:37     11-=
     15  Merge 'renesas/devel' into devel-spot-201605260216
> git bisect good 883c59cd20472da106fd583297207ce46d97cdf5  # 08:50    400+=
     15  Merge 'kees/kaslr/highmem' into devel-spot-201605260216
> git bisect good 035e169dac05a7aac0fb0acbf20c4f5b6ba8987b  # 09:06    398+=
      8  Merge 'linux-review/Lijun-Ou/Add-HiSilicon-RoCE-driver/20160525-23=
3508' into devel-spot-201605260216
> git bisect  bad d895411873af5ef6c93b430f250426d07845b01b  # 09:21      1-=
      4  Merge 'linux-review/Peter-Ujfalusi/ARM-OMAP3-hwmod-data-Fix-McBSP2=
-3-sidetone-data/20160525-232753' into devel-spot-201605260216
> git bisect good 167e48e4589693d2dfe274751dd37866f1c30153  # 09:37    393+=
     17  Merge 'linux-review/Arnd-Bergmann/ipv6-hide-ip6_encap_hlen-ip6_tnl=
_encap-definitions/20160525-233329' into devel-spot-201605260216
> git bisect good d379c5dcd30e9670814b0d7afeee89245ae0a008  # 09:53    390+=
     19  Merge 'linux-review/Minfei-Huang/MAINTAINERS-add-kexec_core-c-and-=
kexec_file-c/20160525-233213' into devel-spot-201605260216
> git bisect  bad fb78006f583c75428ce30df9552f49b24b967a2d  # 10:10      0-=
      1  Merge 'vincent.guittot/sched/pelt' into devel-spot-201605260216
> git bisect  bad 622183a3739ef74e641574ed75732d19e5d55d46  # 10:26      4-=
      5  sched: fix hierarchical order in rq->leaf_cfs_rq_list
> git bisect  bad a552935c0e1ef5ef53a4b4e74782182a6c83704d  # 10:40      2-=
      3  sched: fix first task of a task group is attached twice
> # first bad commit: [a552935c0e1ef5ef53a4b4e74782182a6c83704d] sched: fix=
 first task of a task group is attached twice
> git bisect good ef0491ea17f8019821c7e9c8e801184ecf17f85a  # 11:07   1001+=
     28  ARM: Hide finish_arch_post_lock_switch() from modules
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect  bad a552935c0e1ef5ef53a4b4e74782182a6c83704d  # 11:27      6-=
     11  sched: fix first task of a task group is attached twice
> # extra tests on HEAD of linux-devel/devel-spot-201605260216
> git bisect  bad 906241951fb6bc8c79e004ff20531ae2ee669417  # 11:27      0-=
     11  0day head guard for 'devel-spot-201605260216'
> # extra tests on tree/branch vincent.guittot/sched/pelt
> git bisect  bad 6de5441e77a1db9dfdb530177846727d1debd97f  # 11:42      1-=
      2  sched: reflect sched_entity movement into task_group's utilization
> # extra tests with first bad commit reverted
> git bisect good b999f7869fb78f6faae6164994d05e4711400150  # 13:09   1007+=
     26  Revert "sched: fix first task of a task group is attached twice"
> # extra tests on tree/branch linus/master
> git bisect good 2f7c3a18a2dc79ddf7b83ae199b099a675e1adb2  # 13:28   1002+=
      7  Merge branch 'x86-urgent-for-linus' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/tip/tip
> # extra tests on tree/branch linux-next/master
> git bisect good 08389fe28f2ce76e68fe744f513101c1348ae3ab  # 13:54   1010+=
     16  Add linux-next specific files for 20160525
>
>
> This script may reproduce the error.
>
> -------------------------------------------------------------------------=
---
> #!/bin/bash
>
> kernel=3D$1
> initrd=3Dquantal-core-i386.cgz
>
> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/initrd/$initrd
>
> kvm=3D(
>         qemu-system-x86_64
>         -enable-kvm
>         -cpu kvm64
>         -kernel $kernel
>         -initrd $initrd
>         -m 300
>         -smp 2
>         -device e1000,netdev=3Dnet0
>         -netdev user,id=3Dnet0
>         -boot order=3Dnc
>         -no-reboot
>         -watchdog i6300esb
>         -rtc base=3Dlocaltime
>         -serial stdio
>         -display none
>         -monitor null
> )
>
> append=3D(
>         hung_task_panic=3D1
>         earlyprintk=3DttyS0,115200
>         systemd.log_level=3Derr
>         debug
>         apic=3Ddebug
>         sysrq_always_enabled
>         rcupdate.rcu_cpu_stall_timeout=3D100
>         panic=3D-1
>         softlockup_panic=3D1
>         nmi_watchdog=3Dpanic
>         oops=3Dpanic
>         load_ramdisk=3D2
>         prompt_ramdisk=3D0
>         console=3DttyS0,115200
>         console=3Dtty0
>         vga=3Dnormal
>         root=3D/dev/ram0
>         rw
>         drbd.minor_count=3D8
> )
>
> "${kvm[@]}" --append "${append[*]}"
> -------------------------------------------------------------------------=
---
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion

--===============4127601924041759029==--

