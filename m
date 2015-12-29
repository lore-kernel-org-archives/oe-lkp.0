Content-Type: multipart/mixed; boundary="===============5810397636514969683=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [memdup_user_nul] BUG: unable to handle kernel NULL pointer dereference at 000004ec
Date: Tue, 29 Dec 2015 20:59:00 +0800
Message-ID: <20151229125900.GI4678@wfg-t540p.sh.intel.com>
In-Reply-To: <87ege74bom.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5810397636514969683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Al,

Lots of reports.. I can show more cases if you like.

https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.misc

commit c7af9d5728bed29ef614324e67e066896d087c8f
Author:     Al Viro <viro@zeniv.linux.org.uk>
AuthorDate: Thu Dec 24 00:13:10 2015 -0500
Commit:     Al Viro <viro@zeniv.linux.org.uk>
CommitDate: Thu Dec 24 10:52:16 2015 -0500

    kernel/*: switch to memdup_user_nul()
    =

    Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

+-------------------------------------------------------+------------+-----=
-------+------------+
|                                                       | c4af5f8aed | c7af=
9d5728 | 212424e0f1 |
+-------------------------------------------------------+------------+-----=
-------+------------+
| boot_successes                                        | 910        | 153 =
       | 3          |
| boot_failures                                         | 0          | 157 =
       | 16         |
| BUG:spinlock_bad_magic_on_CPU                         | 0          | 19  =
       |            |
| backtrace:do_execve                                   | 0          | 9   =
       | 1          |
| backtrace:SyS_execve                                  | 0          | 9   =
       | 1          |
| BUG:unable_to_handle_kernel                           | 0          | 138 =
       | 16         |
| Oops                                                  | 0          | 137 =
       | 16         |
| EIP_is_at_remove_entity_load_avg                      | 0          | 2   =
       |            |
| Kernel_panic-not_syncing:Fatal_exception_in_interrupt | 0          | 3   =
       | 2          |
| EIP_is_at_set_next_entity                             | 0          | 39  =
       | 4          |
| Kernel_panic-not_syncing:Fatal_exception              | 0          | 142 =
       | 14         |
| EIP_is_at_tty_paranoia_check                          | 0          | 3   =
       | 1          |
| backtrace:do_vfs_ioctl                                | 0          | 3   =
       |            |
| backtrace:SyS_ioctl                                   | 0          | 3   =
       |            |
| EIP_is_at_sched_slice                                 | 0          | 4   =
       |            |
| backtrace:_do_fork                                    | 0          | 31  =
       |            |
| backtrace:SyS_clone                                   | 0          | 31  =
       |            |
| EIP_is_at__kmalloc                                    | 0          | 34  =
       | 4          |
| EIP_is_at_kmem_cache_alloc                            | 0          | 37  =
       | 1          |
| backtrace:do_sys_open                                 | 0          | 14  =
       | 3          |
| backtrace:SyS_open                                    | 0          | 14  =
       | 3          |
| backtrace:vfs_write                                   | 0          | 3   =
       |            |
| backtrace:SyS_write                                   | 0          | 3   =
       |            |
| backtrace:SYSC_select                                 | 0          | 5   =
       |            |
| backtrace:SyS_select                                  | 0          | 5   =
       |            |
| backtrace:SYSC_signalfd4                              | 0          | 1   =
       |            |
| backtrace:SyS_signalfd4                               | 0          | 1   =
       |            |
| backtrace:SYSC_readlinkat                             | 0          | 1   =
       |            |
| backtrace:SyS_readlink                                | 0          | 1   =
       |            |
| kernel_BUG_at_include/linux/mm.h                      | 0          | 2   =
       |            |
| invalid_opcode:#[##]PREEMPT_SMP                       | 0          | 9   =
       |            |
| EIP_is_at_put_page_testzero                           | 0          | 3   =
       |            |
| backtrace:bpf_prog_free_deferred                      | 0          | 2   =
       |            |
| kernel_BUG_at_mm/slub.c                               | 0          | 6   =
       |            |
| EIP_is_at_kfree                                       | 0          | 6   =
       |            |
| backtrace:tty_ldisc_get                               | 0          | 6   =
       | 1          |
| backtrace:tty_ldisc_init                              | 0          | 7   =
       | 1          |
| backtrace:pty_unix98_install                          | 0          | 5   =
       | 1          |
| backtrace:tty_init_dev                                | 0          | 9   =
       | 1          |
| EIP_is_at_attach_entity_load_avg                      | 0          | 1   =
       |            |
| EIP_is_at_pick_next_task_fair                         | 0          | 1   =
       |            |
| EIP_is_at_update_curr                                 | 0          | 4   =
       |            |
| backtrace:do_group_exit                               | 0          | 4   =
       | 2          |
| backtrace:SyS_exit_group                              | 0          | 4   =
       | 2          |
| backtrace:alloc_tty_struct                            | 0          | 2   =
       |            |
| EIP_is_at_set_curr_task_fair                          | 0          | 1   =
       |            |
| EIP_is_at_unregister_fair_sched_group                 | 0          | 1   =
       |            |
| BUG:spinlock_cpu_recursion_on_CPU                     | 0          | 2   =
       | 1          |
| EIP_is_at_spin_dump                                   | 0          | 2   =
       | 1          |
| EIP_is_at_update_cfs_shares                           | 0          | 2   =
       | 2          |
| backtrace:SYSC_epoll_wait                             | 0          | 1   =
       |            |
| backtrace:SyS_epoll_wait                              | 0          | 1   =
       |            |
| kernel_BUG_at_mm/vmalloc.c                            | 0          | 1   =
       |            |
| EIP_is_at__vunmap                                     | 0          | 1   =
       |            |
| EIP_is_at__kmalloc_track_caller                       | 0          | 4   =
       | 2          |
| backtrace:SYSC_socketcall                             | 0          | 2   =
       | 1          |
| backtrace:SyS_socketcall                              | 0          | 2   =
       | 1          |
| WARNING:at_include/linux/kref.h:#kref_get()           | 0          | 1   =
       |            |
| WARNING:at_drivers/tty/tty_mutex.c:#tty_lock()        | 0          | 1   =
       |            |
| WARNING:at_drivers/tty/tty_mutex.c:#tty_unlock()      | 0          | 1   =
       |            |
| backtrace:tty_ldisc_setup                             | 0          | 2   =
       |            |
| Assertion_failed                                      | 0          | 2   =
       |            |
| INFO:task_blocked_for_more_than#seconds               | 0          | 1   =
       |            |
| Kernel_panic-not_syncing:hung_task:blocked_tasks      | 0          | 1   =
       |            |
| backtrace:cpu_startup_entry                           | 0          | 1   =
       |            |
| backtrace:watchdog                                    | 0          | 1   =
       |            |
| EIP_is_at_tty_ldisc_close                             | 0          | 1   =
       | 1          |
| EIP_is_at_atomic_long_add_return                      | 0          | 1   =
       |            |
+-------------------------------------------------------+------------+-----=
-------+------------+

[    5.186649] init: Failed to create pty - disabling logging for job
[    5.187541] init: Temporary process spawn error: No space left on device
[    5.221268] initctl (159) used greatest stack depth: 6732 bytes left
[    5.234887] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    5.235996] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    5.236744] *pde =3D 00000000 =

[    5.237209] Oops: 0000 [#1] PREEMPT SMP =

[    5.237815] Modules linked in:
[    5.238279] CPU: 1 PID: 174 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    5.239427] task: c2411d00 ti: c2574000 task.ti: c2574000
[    5.240179] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 1
[    5.240966] EIP is at set_next_entity+0x3e/0x64
[    5.241599] EAX: 00000000 EBX: c2411d44 ECX: 00000000 EDX: c2411d44
[    5.242492] ESI: c2488c00 EDI: c2411d00 EBP: c2575f08 ESP: c2575efc
[    5.243361]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.244127] CR0: 8005003b CR2: 000004ec CR3: 1258d000 CR4: 000006d0
[    5.245025] Stack:
[    5.245316]  c2411d44 c109da80 c2411d00 c2575f14 b105b35e c2411d00 c2575=
f34 b1057eb2
[    5.246573]  b158e5c0 00000001 00000086 c2411d00 bd961100 c2411d00 c2575=
f50 b1062211
[    5.247815]  bc3def00 00000282 b0191e40 c2411d00 b01139c0 c2575f64 b1062=
2d8 bd961e80
[    5.249090] Call Trace:
[    5.249458]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    5.250183]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    5.250900]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.251649]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.252530]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.253167]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.253898]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.254582] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    5.258068] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c257=
5efc
[    5.258986] CR2: 00000000000004ec
[    5.259411] ---[ end trace 5165b1f496ab45f0 ]---
[    5.259994] Kernel panic - not syncing: Fatal exception

     84 Kernel panic - not syncing: Fatal exception
     81 Oops: 0000 [#1] PREEMPT SMP
     28 BUG: unable to handle kernel NULL pointer dereference at 000004ec
     27 EIP is at set_next_entity+0x3e/0x64
     20 EIP is at kmem_cache_alloc+0x64/0xe9
     17 EIP is at __kmalloc+0x8e/0x121
     15 BUG: unable to handle kernel paging request at ffffffff
      7 BUG: unable to handle kernel paging request at 00005403
      7 BUG: unable to handle kernel NULL pointer dereference at 00000002
      6 invalid opcode: 0000 [#1] PREEMPT SMP
      3 kernel BUG at mm/slub.c:3627!
      3 EIP is at kfree+0x3a/0xff
      3 BUG: unable to handle kernel paging request at 80040100
      3 BUG: unable to handle kernel NULL pointer dereference at 00000001
      3 BUG: unable to handle kernel
      2 kernel BUG at include/linux/mm.h:342!
      2 Kernel panic - not syncing: Fatal exception in interrupt
      2 EIP is at tty_paranoia_check+0x22/0x54
      2 EIP is at spin_dump+0x43/0x79
      2 EIP is at put_page_testzero+0x14/0x25
      2 BUG: unable to handle kernel paging request at dead50b1
      2 BUG: unable to handle kernel paging request at 6e69622f
      2 BUG: unable to handle kernel paging request
      2 BUG: unable to handle kernel NULL pointer dereference at 00000030  =
                    =

      1 kernel BUG at mm/vmalloc.c:1479!                                   =
                    =

      1 Oops: 0000 [#2] PREEMPT SMP                                        =
                    =

      1 EIP is at update_curr+0xb/0xbc                                     =
                    =

      1 EIP is at update_curr+0x14/0xbc                                    =
                    =

      1 EIP is at update_cfs_shares+0x56/0x88                              =
                    =

      1 EIP is at unregister_fair_sched_group+0x12/0x70                    =
                    =

      1 EIP is at set_curr_task_fair+0x11/0x23                             =
                    =

      1 EIP is at sched_slice+0x3c/0x6c                                    =
                    =

      1 EIP is at sched_slice+0x33/0x6c                                    =
                    =

      1 EIP is at remove_entity_load_avg+0xe/0x1b3                         =
                    =

      1 EIP is at put_page_testzero+0x0/0x25                               =
                    =

      1 EIP is at pick_next_task_fair+0x5d/0x2ff                           =
                    =

      1 EIP is at attach_entity_load_avg+0x1ae/0x1ec                       =
                    =

      1 EIP is at __vunmap+0x70/0x9d                                       =
                    =

      1 BUG: unable to handle kernel paging request at cccccccc            =
                    =

      1 BUG: unable to handle kernel paging request at 63e1a683            =
                    =

      1 BUG: unable to handle kernel paging request at 5e9c185f            =
                    =

      1 BUG: unable to handle kernel paging request at 4d002dc8            =
                    =

      1 BUG: unable to handle kernel paging request at 0400b147            =
                    =

      1 BUG: unable to handle kernel paging request at 0000f450
      1 BUG: unable to handle kernel paging request at 00005401
      1 BUG: unable to handle kernel NULL pointer dereference at 00000400
      1 BUG: unable to handle kernel NULL pointer dereference at 00000110
      1 BUG: unable to handle kernel NULL pointer dereference at 0000009a
      1 BUG: unable to handle kernel NULL pointer dereference at 00000054
      1 BUG: spinlock cpu recursion on CPU#0, init/179
      1 BUG: spinlock cpu recursion on CPU#0, init/176
      1 BUG: spinlock bad magic on CPU#1, upstart-udev-br/175
      1 BUG: spinlock bad magic on CPU#1, upstart-udev-br/174
      1 BUG: spinlock bad magic on CPU#1, upstart-udev-br/173
      1 BUG: spinlock bad magic on CPU#1, upstart-udev-br/172
      1 BUG: spinlock bad magic on CPU#1, sysctl/172
      1 BUG: spinlock bad magic on CPU#1, sh/182
      1 BUG: spinlock bad magic on CPU#1, sh/178
      1 BUG: spinlock bad magic on CPU#1, init/175
      1 BUG: spinlock bad magic on CPU#1, init/171
      1 BUG: spinlock bad magic on CPU#0, upstart-udev-br/172
      1 BUG: spinlock bad magic on CPU#0, udevd/309
      1 BUG: spinlock bad magic on CPU#0, udevd/177
      1 BUG: spinlock bad magic on CPU#0, sysctl/173
      1 BUG: spinlock bad magic on CPU#0, run-parts/178

dmesg-quantal-intel12-14:20151227015740:i386-randconfig-h0-12261754:4.4.0-r=
c4-00029-gc7af9d5:1

[   13.758228] init: Temporary process spawn error: No space left on device
[   13.960130] initctl (158) used greatest stack depth: 6632 bytes left
[   14.061664] mountall (123) used greatest stack depth: 6388 bytes left
[   14.128708] BUG: spinlock bad magic on CPU#1, sh/182
[   14.130110]  lock: 0xb010ecf0, .magic: ffffffff, .owner: <none>/-1, .own=
er_cpu: -1
[   14.131087] CPU: 1 PID: 182 Comm: sh Not tainted 4.4.0-rc4-00029-gc7af9d=
5 #1
[   14.141253]  00000000 00000000 c24cdd80 b114a4ae b14657b3 c24cdda8 b1065=
aac b14459cd
[   14.147719]  b010ecf0 ffffffff b14657b3 ffffffff ffffffff b010ecf0 c2537=
ff8 c24cddb8
[   14.148815]  b1065ad3 b1445a2f b010ecf0 c24cddd4 b1065b3c c24cddd8 b10b6=
d30 c24ac5a0
[   14.158105] Call Trace:
[   14.158454]  [<b114a4ae>] dump_stack+0x48/0x69
[   14.162293]  [<b1065aac>] spin_dump+0x6f/0x79
[   14.163927]  [<b1065ad3>] spin_bug+0x1d/0x21
[   14.167185]  [<b1065b3c>] do_raw_spin_lock+0x1e/0xf1
[   14.167895]  [<b10b6d30>] ? __pte_alloc+0x65/0x9d
[   14.172162]  [<b12f2c57>] _raw_spin_lock+0xf/0x11
[   14.172804]  [<b10bcc5b>] move_page_tables+0x1a0/0x2f3
[   14.179419]  [<b10d3019>] setup_arg_pages+0x1c3/0x289
[   14.182710]  [<b11d6048>] ? get_random_int+0x54/0x73
[   14.184371]  [<b10fa70c>] load_elf_binary+0x2a6/0x93e
[   14.187573]  [<b1152645>] ? _copy_from_user+0x3f/0x52
[   14.193674]  [<b10a9bc1>] ? put_page+0x1b/0x32
[   14.194633]  [<b10d3494>] search_binary_handler+0x103/0x157
[   14.199677]  [<b10d45f1>] do_execveat_common+0x3b7/0x4de
[   14.201935]  [<b10d472c>] do_execve+0x14/0x16
[   14.204932]  [<b10d48b9>] SyS_execve+0x1c/0x20
[   14.205559]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[   14.209697]  [<b12f31ed>] sysenter_past_esp+0x36/0x59


dmesg-quantal-intel12-17:20151227015643:i386-randconfig-h0-12261754:4.4.0-r=
c4-00029-gc7af9d5:1

[   17.342478] init: Failed to create pty - disabling logging for job
[   17.343792] init: Temporary process spawn error: No space left on device
[   17.657336] initctl (160) used greatest stack depth: 6732 bytes left
[   17.793156] BUG: unable to handle kernel =

[   17.793309] mountall (124) used greatest stack depth: 6388 bytes left

[   17.804311] NULL pointer dereference at 0000007c
[   17.805268] IP: [<b105bc62>] remove_entity_load_avg+0xe/0x1b3
[   17.815443] *pde =3D 00000000 =

[   17.816007] Oops: 0000 [#1] PREEMPT SMP =

[   17.822858] Modules linked in:
[   17.826186] CPU: 1 PID: 177 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[   17.827812] task: c2466580 ti: c24d6000 task.ti: c24d6000
[   17.828778] EIP: 0060:[<b105bc62>] EFLAGS: 00010286 CPU: 1
[   17.842892] EIP is at remove_entity_load_avg+0xe/0x1b3
[   17.844021] EAX: b14f5640 EBX: 00000000 ECX: 000016e1 EDX: b15799c0
[   17.851130] ESI: b14f5640 EDI: 00000000 EBP: b007ff70 ESP: b007ff50
[   17.852292]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
[   17.853290] CR0: 8005003b CR2: 0000007c CR3: 124ed000 CR4: 000006d0
[   17.864702] Stack:
[   17.865156]  b10c6b51 00000246 b105d508 00000001 000016c1 00000000 c24b4=
0c0 00000000
[   17.875397]  b007ff84 b105d522 c24b40c0 c24b4138 b14e0000 b007ff90 b1053=
39a c109e0c0
[   17.883277]  b007ff98 b10533bd b007ffcc b1072619 c2466580 c24d8000 00000=
00a bc3c8b5c
[   17.893102] Call Trace:
[   17.893573]  [<b10c6b51>] ? kfree+0xbd/0xff
[   17.901663]  [<b105d508>] ? free_fair_sched_group+0x31/0x6a
[   17.904002]  [<b105d522>] free_fair_sched_group+0x4b/0x6a
[   17.909247]  [<b105339a>] free_sched_group+0xb/0x23
[   17.917455]  [<b10533bd>] free_sched_group_rcu+0xb/0xd
[   17.920793]  [<b1072619>] rcu_process_callbacks+0x343/0x439
[   17.921986]  [<b103fd80>] __do_softirq+0x9a/0x16a
[   17.929224]  [<b103fce6>] ? tasklet_hi_action+0xa2/0xa2
[   17.935877]  [<b10038d4>] do_softirq_own_stack+0x1f/0x25
[   17.939101]  <IRQ> =

[   17.939533]  [<b103ffc3>] irq_exit+0x38/0x79
[   17.949644]  [<b1028209>] smp_trace_apic_timer_interrupt+0x59/0x67
[   17.952086]  [<b102821f>] smp_apic_timer_interrupt+0x8/0xa
[   17.956255]  [<b12f3b5d>] apic_timer_interrupt+0x2d/0x40
[   17.963798]  [<b10c90f8>] ? mem_cgroup_begin_page_stat+0x41/0x66
[   17.966932]  [<b10bdc05>] page_remove_rmap+0x12/0x8a
[   17.969411]  [<b10b66d3>] unmap_single_vma+0x290/0x38e
[   17.977720]  [<b10b697c>] unmap_vmas+0x27/0x36
[   17.979877]  [<b10bb102>] exit_mmap+0x45/0xaf
[   17.980878]  [<b103b841>] mmput+0x45/0x81
[   17.981728]  [<b10d3fcf>] flush_old_exec+0x587/0x5e4
[   17.992549]  [<b10fa690>] load_elf_binary+0x22a/0x93e
[   17.993587]  [<b1152645>] ? _copy_from_user+0x3f/0x52
[   18.001821]  [<b10a9bc1>] ? put_page+0x1b/0x32
[   18.004969]  [<b10d3494>] search_binary_handler+0x103/0x157
[   18.006023]  [<b10d45f1>] do_execveat_common+0x3b7/0x4de
[   18.014530]  [<b10d472c>] do_execve+0x14/0x16
[   18.015296]  [<b10d48b9>] SyS_execve+0x1c/0x20
[   18.020225]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[   18.021207]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[   18.032411] Code: 00 89 50 70 c7 40 74 00 04 00 00 69 d2 7e ba 00 00 c7 =
40 68 00 f8 e9 02 5d 89 50 60 c3 55 89 e5 57 56 53 89 c6 83 ec 14 8b 78 50 =
<8b> 4f 7c 8b 9f 80 00 00 00 0f ae e8 89 f6 8b 57 48 8b 47 44 39
[   18.053022] EIP: [<b105bc62>] remove_entity_load_avg+0xe/0x1b3 SS:ESP 00=
68:b007ff50
[   18.063805] CR2: 000000000000007c
[   18.064485] ---[ end trace 21bb3ac6e67ae0be ]---
[   18.065418] Kernel panic - not syncing: Fatal exception in interrupt

dmesg-quantal-intel12-20:20151227015658:i386-randconfig-h0-12261754:4.4.0-r=
c4-00029-gc7af9d5:1

[   13.797511] init: Failed to create pty - disabling logging for job
[   13.798339] init: Temporary process spawn error: No space left on device
[   13.978069] initctl (155) used greatest stack depth: 6388 bytes left
[   14.064888] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[   14.067627] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[   14.068304] *pde =3D 00000000 =

[   14.068731] Oops: 0000 [#1] PREEMPT SMP =

[   14.069266] Modules linked in:
[   14.069694] CPU: 1 PID: 177 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[   14.070616] task: b0105700 ti: c2592000 task.ti: c2592000
[   14.071233] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 1
[   14.071937] EIP is at set_next_entity+0x3e/0x64
[   14.072511] EAX: 00000000 EBX: b0105744 ECX: 00000000 EDX: b0105744
[   14.091755] ESI: bc3d1d80 EDI: b0105700 EBP: c2593f08 ESP: c2593efc
[   14.092425]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[   14.093043] CR0: 8005003b CR2: 000004ec CR3: 12568000 CR4: 000006d0
[   14.093690] Stack:
[   14.093905]  b0105744 c109da80 b0105700 c2593f14 b105b35e b0105700 c2593=
f34 b1057eb2
[   14.094905]  b158e5c0 00000001 00000086 b0105700 b010acc0 b0105700 c2593=
f50 b1062211
[   14.108843]  c2400f00 00000282 c248efc0 b0105700 c24886c0 c2593f64 b1062=
2d8 c256e280
[   14.117549] Call Trace:
[   14.117829]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[   14.120095]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[   14.121768]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[   14.128123]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[   14.129462]  [<b1048a83>] sys_setsid+0xc2/0xcb
[   14.131105]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[   14.134555]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[   14.135186] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[   14.147848] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c259=
3efc
[   14.150785] CR2: 00000000000004ec
[   14.151164] ---[ end trace a794f5730e69102c ]---
[   14.153830] Kernel panic - not syncing: Fatal exception

dmesg-quantal-intel12-24:20151227015640:i386-randconfig-h0-12261754:4.4.0-r=
c4-00029-gc7af9d5:1

[   13.997614] init: Failed to create pty - disabling logging for job
[   14.001519] init: Temporary process spawn error: No space left on device
[   14.162579] initctl (162) used greatest stack depth: 6388 bytes left
[   14.219373] BUG: unable to handle kernel paging request at ffffffff
[   14.222302] IP: [<b11c5899>] tty_paranoia_check+0x22/0x54
[   14.226082] *pde =3D 0157e063 *pte =3D 00000000 =

[   14.226594] Oops: 0000 [#1] PREEMPT SMP =

[   14.230192] Modules linked in:
[   14.230535] CPU: 1 PID: 174 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[   14.233769] task: c240ba00 ti: c24fa000 task.ti: c24fa000
[   14.237437] EIP: 0060:[<b11c5899>] EFLAGS: 00010246 CPU: 1
[   14.241077] EIP is at tty_paranoia_check+0x22/0x54
[   14.241737] EAX: ffffffff EBX: 00000000 ECX: b1468e2e EDX: c0fa8000
[   14.245636] ESI: 00005401 EDI: 0000000b EBP: c24fbe90 ESP: c24fbe8c
[   14.250178]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[   14.250844] CR0: 8005003b CR2: ffffffff CR3: 125ab000 CR4: 000006d0
[   14.255517] Stack:
[   14.255739]  ffffffff c24fbf04 b11c6424 c0c6ae14 c2463d00 af8130f8 c0c6a=
e14 c24fbef0
[   14.260819]  b10a1c53 c0c8bcc8 000000e5 00000000 a7670000 001a2fff 00000=
000 c249d840
[   14.270171]  000000e5 c0c8bcc4 c2475e00 000000e5 c24fbee8 b1065cb2 00000=
000 c24fbef0
[   14.274394] Call Trace:
[   14.274692]  [<b11c6424>] tty_ioctl+0x2b/0x9c6
[   14.279280]  [<b10a1c53>] ? filemap_map_pages+0x57/0x1c7
[   14.284057]  [<b1065cb2>] ? do_raw_spin_unlock+0x6e/0x71
[   14.284711]  [<b12f2cf0>] ? _raw_spin_unlock+0x8/0x1a
[   14.289341]  [<b10b8363>] ? handle_mm_fault+0xb27/0xeac
[   14.294248]  [<b11c63f9>] ? no_tty+0x1c/0x1c
[   14.294757]  [<b10db21e>] do_vfs_ioctl+0x41c/0x4a1
[   14.299427]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[   14.304268]  [<b10db2df>] SyS_ioctl+0x3c/0x56
[   14.304770]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[   14.310600]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[   14.315993] Code: 89 e5 e8 1f 12 f0 ff 5d c3 55 85 c0 89 e5 53 75 18 8b =
42 24 51 89 c2 c1 e8 14 81 e2 ff ff 0f 00 52 50 68 4d 8d 46 b1 eb 20 31 db =
<81> 38 01 54 00 00 74 23 8b 42 24 51 89 c2 c1 e8 14 81 e2 ff ff
[   14.330415] EIP: [<b11c5899>] tty_paranoia_check+0x22/0x54 SS:ESP 0068:c=
24fbe8c
[   14.334861] CR2: 00000000ffffffff
[   14.335321] ---[ end trace 9067090b407511ec ]---
[   14.335875] Kernel panic - not syncing: Fatal exception

dmesg-quantal-intel12-26:20151227015847:i386-randconfig-h0-12261754:4.4.0-r=
c4-00029-gc7af9d5:1

[    9.992038] init: Temporary process spawn error: No space left on device
[   10.127484] stop (158) used greatest stack depth: 6388 bytes left
[   10.162767] init: plymouth-log main process (172) terminated with status=
 1
[   10.175914] BUG: unable to handle kernel paging request at 0400b147
[   10.176757] IP: [<0400b147>] 0x400b147
[   10.177436] *pde =3D 00000000 =

[   10.177820] Oops: 0000 [#1] PREEMPT SMP =

[   10.178363] Modules linked in:
[   10.178772] CPU: 0 PID: 93 Comm: kworker/u4:1 Not tainted 4.4.0-rc4-0002=
9-gc7af9d5 #1
[   10.179759] Workqueue: events_unbound flush_to_ldisc
[   10.183573] task: c2419d00 ti: c2416000 task.ti: c2416000
[   10.184171] EIP: 0060:[<0400b147>] EFLAGS: 00010206 CPU: 0
[   10.186203] EIP is at 0x400b147
[   10.186588] EAX: b01a7400 EBX: c25a5000 ECX: 00000000 EDX: c25a5031
[   10.188896] ESI: 0400b147 EDI: b01a7400 EBP: c2417f00 ESP: c2417ed0
[   10.189724]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
[   10.191458] CR0: 8005003b CR2: 0400b147 CR3: 125b1000 CR4: 000006d0
[   10.193684] Stack:
[   10.193947]  b11cbdca 00000018 c24fc000 b14fc25a c24fc014 b01103d0 00000=
018 c24fc004
[   10.196878]  b01103d0 b01de840 c24fc004 b0021000 c2417f24 b104bc15 c24fc=
008 00000000
[   10.200222]  00000000 b0090a00 b01de840 b0021000 b01de858 c2417f48 b104c=
0c2 c2419d00
[   10.201431] Call Trace:
[   10.201737]  [<b11cbdca>] ? flush_to_ldisc+0xba/0x10c
[   10.202348]  [<b104bc15>] process_one_work+0x11b/0x1bd
[   10.203007]  [<b104c0c2>] worker_thread+0x1b3/0x250
[   10.208441]  [<b104bf0f>] ? rescuer_thread+0x237/0x237
[   10.210437]  [<b104bf0f>] ? rescuer_thread+0x237/0x237
[   10.211188]  [<b104f9f7>] kthread+0x8c/0x91
[   10.211700]  [<b12f3111>] ret_from_kernel_thread+0x21/0x40
[   10.214070]  [<b104f96b>] ? kthread_parkme+0x19/0x19
[   10.214687] Code:  Bad EIP value.
[   10.215119] EIP: [<0400b147>] 0x400b147 SS:ESP 0068:c2417ed0
[   10.215807] CR2: 000000000400b147
[   10.219379] ---[ end trace 2c2831ee35e8c016 ]---
[   10.219975] Kernel panic - not syncing: Fatal exception

dmesg-quantal-intel12-27:20151227015648:i386-randconfig-h0-12261754:4.4.0-r=
c4-00029-gc7af9d5:1

[   14.254223] chgrp (153) used greatest stack depth: 6748 bytes left
[   14.300937] stop (161) used greatest stack depth: 6732 bytes left
[   14.354473] mountall (124) used greatest stack depth: 6388 bytes left
[   14.441520] BUG: unable to handle kernel paging request at ffffffff
[   14.446533] IP: [<b1059d14>] sched_slice+0x3c/0x6c
[   14.447948] *pde =3D 0157e063 *pte =3D 00000000 =

[   14.452325] Oops: 0000 [#1] PREEMPT SMP =

[   14.453976] Modules linked in:
[   14.457267] CPU: 1 PID: 182 Comm: sh Not tainted 4.4.0-rc4-00029-gc7af9d=
5 #1
[   14.460586] task: c2444880 ti: c258a000 task.ti: c258a000
[   14.464320] EIP: 0060:[<b1059d14>] EFLAGS: 00010046 CPU: 1
[   14.467917] EIP is at sched_slice+0x3c/0x6c
[   14.469523] EAX: 005b8d7d EBX: c24fd400 ECX: ffffffff EDX: 00000000
[   14.474283] ESI: 00000400 EDI: 00000000 EBP: c258be60 ESP: c258be4c
[   14.477490]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[   14.481360] CR0: 80050033 CR2: ffffffff CR3: 12486000 CR4: 000006d0
[   14.483904] Stack:
[   14.485763]  00000800 001fffff c2443a44 00645d0c 00000000 c258be78 b105a=
5b8 c2443a44
[   14.490650]  c2443a44 c24448c4 c109da80 c258bea4 b105a6d6 00000001 00000=
282 bc39ce40
[   14.496505]  c2443ad8 bc39c3c0 c2443a00 c2443a00 00000000 c2443bc4 c258b=
ebc b105515b
[   14.501199] Call Trace:
[   14.502385]  [<b105a5b8>] place_entity+0x21/0x82
[   14.504613]  [<b105a6d6>] task_fork_fair+0xbd/0x12d
[   14.508276]  [<b105515b>] sched_fork+0x13e/0x1dc
[   14.510002]  [<b103be2f>] copy_process+0x45d/0x1198
[   14.514500]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[   14.517204]  [<b103cc78>] _do_fork+0x5b/0x198
[   14.518894]  [<b1152773>] ? _copy_to_user+0x3f/0x48
[   14.521964]  [<b1043e8b>] ? copy_to_user+0x28/0x2d
[   14.525165]  [<b103ce21>] SyS_clone+0x19/0x1b
[   14.526814]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[   14.531696]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[   14.533879] Code: c2 0f b6 d2 01 d0 3b 05 3c f5 4d b1 76 09 0f af 05 44 =
f5 4d b1 eb 05 a1 50 f5 4d b1 31 d2 85 db 74 31 83 7b 1c 00 8b 4b 50 75 1a =
<8b> 31 8b 79 04 89 75 ec 89 7d f0 8b 0b 01 4d ec 8d 4d ec c7 45
[   14.549907] EIP: [<b1059d14>] sched_slice+0x3c/0x6c SS:ESP 0068:c258be4c
[   14.554572] CR2: 00000000ffffffff
[   14.555874] ---[ end trace 61b2bcfc0d51b820 ]---
[   14.559813] Kernel panic - not syncing: Fatal exception

dmesg-quantal-intel12-2:20151227015622:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[   12.898277] init: Failed to create pty - disabling logging for job
[   12.899886] init: Temporary process spawn error: No space left on device
[   13.016247] sh (136) used greatest stack depth: 6688 bytes left
[   13.142364] BUG: unable to handle kernel NULL pointer dereference at 000=
00002
[   13.146868] IP: [<b10c5f72>] __kmalloc+0x8e/0x121
[   13.148416] *pde =3D 00000000 =

[   13.149533] Oops: 0000 [#1] PREEMPT SMP =

[   13.151586] Modules linked in:
[   13.151990] CPU: 0 PID: 175 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[   13.156287] task: bc3f6580 ti: c24f2000 task.ti: c24f2000
[   13.158823] EIP: 0060:[<b10c5f72>] EFLAGS: 00010246 CPU: 0
[   13.160531] EIP is at __kmalloc+0x8e/0x121
[   13.162335] EAX: 00000002 EBX: 00000002 ECX: 0004fdc0 EDX: b15796f0
[   13.165986] ESI: b0098e00 EDI: 024080c0 EBP: c24f3f1c ESP: c24f3efc
[   13.167624]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[   13.170458] CR0: 8005003b CR2: 00000002 CR3: 12584000 CR4: 000006d0
[   13.173033] Stack:
[   13.173882]  b105a3e3 00000246 00000002 00000001 0004fdc0 c2553540 b158e=
5c0 c2553540
[   13.177497]  c24f3f24 b105a3e3 c24f3f40 b105d658 b158e5c0 b158e5c0 c2553=
540 b158e5c0
[   13.181289]  bc3f6580 c24f3f50 b1057c85 c255b9c0 bc3f6580 c24f3f64 b1062=
247 c25765c0
[   13.184921] Call Trace:
[   13.186130]  [<b105a3e3>] ? kzalloc+0xd/0xf
[   13.187830]  [<b105a3e3>] kzalloc+0xd/0xf
[   13.191133]  [<b105d658>] alloc_fair_sched_group+0x33/0xc9
[   13.193171]  [<b1057c85>] sched_create_group+0x23/0x4a
[   13.195433]  [<b1062247>] sched_autogroup_create_attach+0x27/0xc7
[   13.198147]  [<b1048a83>] sys_setsid+0xc2/0xcb
[   13.199685]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[   13.202966]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[   13.204186] Code: f0 75 e8 8b 18 85 db 75 16 8b 4d e0 89 fa 89 f0 e8 fd =
fd ff ff 89 c3 8b 06 64 ff 40 14 eb 75 8b 46 14 01 d8 f6 06 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 58 d7 ff ff 8b 16 89 45 e4 64 8b 0a 39 cb c7
[   13.217120] EIP: [<b10c5f72>] __kmalloc+0x8e/0x121 SS:ESP 0068:c24f3efc
[   13.219634] CR2: 0000000000000002
[   13.236259] ---[ end trace c85bccd6d9d6b6c1 ]---
[   13.238744] Kernel panic - not syncing: Fatal exception

dmesg-quantal-intel12-30:20151227015704:i386-randconfig-h0-12261754:4.4.0-r=
c4-00029-gc7af9d5:1

[   14.588509] mountall (120) used greatest stack depth: 6720 bytes left
[   14.685513] init: Failed to create pty - disabling logging for job
[   14.686443] init: Temporary process spawn error: No space left on device
[   14.958818] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[   14.964109] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[   14.969068] *pde =3D 00000000 =

[   14.973009] Oops: 0000 [#1] PREEMPT SMP =

[   14.975861] Modules linked in:
[   14.976252] CPU: 1 PID: 173 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[   14.982896] task: b0169d00 ti: c259e000 task.ti: c259e000
[   14.987751] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 1
[   14.991580] EIP is at set_next_entity+0x3e/0x64
[   14.992193] EAX: 00000000 EBX: b0169d44 ECX: 00000000 EDX: b0169d44
[   14.998041] ESI: c2487d00 EDI: b0169d00 EBP: c259ff08 ESP: c259fefc
[   15.003152]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[   15.006895] CR0: 8005003b CR2: 000004ec CR3: 124a7000 CR4: 000006d0
[   15.012472] Stack:
[   15.013990]  b0169d44 c109da80 b0169d00 c259ff14 b105b35e b0169d00 c259f=
f34 b1057eb2
[   15.016341]  b158e5c0 00000001 00000086 b0169d00 b010aa00 b0169d00 c259f=
f50 b1062211
[   15.017480]  c2586500 00000282 bd5c3180 b0169d00 bc38f240 c259ff64 b1062=
2d8 c24dfa80
[   15.030212] Call Trace:
[   15.033742]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[   15.036724]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[   15.037357]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[   15.042162]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[   15.045767]  [<b1048a83>] sys_setsid+0xc2/0xcb
[   15.049599]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[   15.050174]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[   15.054555] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[   15.069632] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c259=
fefc
[   15.070465] CR2: 00000000000004ec
[   15.070849] ---[ end trace 208848a17fc4e72c ]---
[   15.078162] Kernel panic - not syncing: Fatal exception

dmesg-quantal-intel12-3:20151227015658:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[   19.568482] init: Failed to create pty - disabling logging for job
[   19.575470] init: Temporary process spawn error: No space left on device
[   19.957261] initctl (156) used greatest stack depth: 6676 bytes left
[   20.201751] BUG: unable to handle kernel paging request at ffffffff
[   20.211580] IP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9
[   20.211588] *pde =3D 0157e063 *pte =3D 00000000 =

[   20.211592] Oops: 0000 [#1] PREEMPT SMP =

[   20.211595] Modules linked in:
[   20.211600] CPU: 1 PID: 1 Comm: init Not tainted 4.4.0-rc4-00029-gc7af9d=
5 #1
[   20.211603] task: b0040000 ti: b0016000 task.ti: b0016000
[   20.211605] EIP: 0060:[<b10c5df7>] EFLAGS: 00010246 CPU: 1
[   20.211608] EIP is at kmem_cache_alloc+0x64/0xe9
[   20.211610] EAX: ffffffff EBX: b0098d00 ECX: 0000ccc1 EDX: b1579768
[   20.211612] ESI: ffffffff EDI: b11c5807 EBP: b0017dd0 ESP: b0017db4
[   20.211614]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[   20.211616] CR0: 80050033 CR2: ffffffff CR3: 12489000 CR4: 000006d0
[   20.211620] Stack:
[   20.211622]  b11c5807 b10e44af 0000ccc1 024000c0 c24cb600 00000000 c24cb=
600 b0017ddc
[   20.211629]  b11c5807 b160bca0 b0017df4 b11cd51f c0fa5a70 b160bca0 00000=
000 c0fa5a70
[   20.211635]  b0017e14 b10d23e4 00000000 c24cb600 c24cb608 c24cb600 c0fa5=
a70 00000000
[   20.211641] Call Trace:
[   20.211647]  [<b11c5807>] ? tty_alloc_file+0x15/0x2b
[   20.211650]  [<b10e44af>] ? __lookup_mnt+0xe/0x2b
[   20.211653]  [<b11c5807>] tty_alloc_file+0x15/0x2b
[   20.211657]  [<b11cd51f>] ptmx_open+0x1f/0x11f
[   20.211661]  [<b10d23e4>] chrdev_open+0xf3/0x103
[   20.211666]  [<b10ce6b9>] do_dentry_open+0x15e/0x1e1
[   20.211668]  [<b10d22f1>] ? cdev_put+0xe/0xe
[   20.211670]  [<b10cf0a5>] vfs_open+0x3e/0x43
[   20.211674]  [<b10d8cb9>] path_openat+0x7f1/0xa19
[   20.211677]  [<b10d0931>] ? get_empty_filp+0x37/0x13d
[   20.211681]  [<b10d9d4b>] do_filp_open+0x2e/0x71
[   20.211686]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[   20.211690]  [<b1065cb2>] ? do_raw_spin_unlock+0x6e/0x71
[   20.211694]  [<b12f2cf0>] ? _raw_spin_unlock+0x8/0x1a
[   20.211698]  [<b10e24c5>] ? __alloc_fd+0x111/0x11b
[   20.211701]  [<b10cf1c0>] do_sys_open+0x54/0xcf
[   20.211704]  [<b10e25f8>] ? fd_install+0x1b/0x1e
[   20.211707]  [<b10cf253>] SyS_open+0x18/0x1a
[   20.211710]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[   20.211714]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[   20.211715] Code: 75 e8 8b 30 85 f6 75 17 8b 4d e4 8b 55 f0 89 d8 e8 78 =
ff ff ff 89 c6 8b 03 64 ff 40 14 eb 66 8b 43 14 01 f0 f6 03 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 d3 d8 ff ff 8b 13 31 c9 64 8b 3a 39 fe 75 20
[   20.211762] EIP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9 SS:ESP 0068:b00=
17db4
[   20.211767] CR2: 00000000ffffffff
[   20.211769] ---[ end trace e499bc455ba0d16f ]---
[   20.211771] Kernel panic - not syncing: Fatal exception

dmesg-quantal-intel12-40:20151227020157:i386-randconfig-h0-12261754:4.4.0-r=
c4-00029-gc7af9d5:1

[   11.923980] init: Failed to create pty - disabling logging for job
[   11.925962] init: Temporary process spawn error: No space left on device
[   12.108671] initctl (160) used greatest stack depth: 6708 bytes left
[   12.376630] BUG: unable to handle kernel paging request at 80040100
[   12.377526] IP: [<b10c5f72>] __kmalloc+0x8e/0x121
[   12.378154] *pde =3D 00000000 =

[   12.381543] Oops: 0000 [#1] PREEMPT SMP =

[   12.382845] Modules linked in:
[   12.383251] CPU: 0 PID: 183 Comm: udevadm Not tainted 4.4.0-rc4-00029-gc=
7af9d5 #1
[   12.391113] task: b01d0000 ti: c25a4000 task.ti: c25a4000
[   12.403127] EIP: 0060:[<b10c5f72>] EFLAGS: 00010246 CPU: 0
[   12.403797] EIP is at __kmalloc+0x8e/0x121
[   12.404354] EAX: 80040100 EBX: 80040100 ECX: 00042140 EDX: b15796f0
[   12.405089] ESI: b0098e00 EDI: 024000c0 EBP: c25a5ed0 ESP: c25a5eb0
[   12.405819]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[   12.415817] CR0: 80050033 CR2: 80040100 CR3: 12558000 CR4: 000006d0
[   12.416584] Stack:
[   12.416865]  b1107807 c25a5ec0 b12f2d4a 00000000 00042140 afc99f25 c24b1=
180 00000000
[   12.420200]  c25a5eec b1107807 b0020000 00000003 c2452700 c25a5f68 b1107=
7b6 c25a5f3c
[   12.422235]  b10cf876 c25a5f68 b1052e39 b01d0000 00000000 00000003 c25a5=
f24 b1052f5f
[   12.423300] Call Trace:
[   12.423631]  [<b1107807>] ? kernfs_fop_write+0x51/0x10b
[   12.424337]  [<b12f2d4a>] ? _raw_spin_unlock_irqrestore+0x12/0x25
[   12.425070]  [<b1107807>] kernfs_fop_write+0x51/0x10b
[   12.425671]  [<b11077b6>] ? kernfs_fop_open+0x25f/0x25f
[   12.426260]  [<b10cf876>] __vfs_write+0x1d/0x8f
[   12.440822]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[   12.448730]  [<b1052f5f>] ? __might_sleep+0x6b/0x72
[   12.449446]  [<b10c6843>] ? kmem_cache_free+0x9f/0xce
[   12.450093]  [<b10d8fc5>] ? putname+0x3f/0x42
[   12.452107]  [<b1064162>] ? percpu_down_read+0x23/0x40
[   12.452753]  [<b10cfccd>] vfs_write+0x70/0x96
[   12.453318]  [<b10d0187>] SyS_write+0x44/0x6b
[   12.453798]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[   12.454419]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[   12.462512] Code: f0 75 e8 8b 18 85 db 75 16 8b 4d e0 89 fa 89 f0 e8 fd =
fd ff ff 89 c3 8b 06 64 ff 40 14 eb 75 8b 46 14 01 d8 f6 06 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 58 d7 ff ff 8b 16 89 45 e4 64 8b 0a 39 cb c7
[   12.476978] EIP: [<b10c5f72>] __kmalloc+0x8e/0x121 SS:ESP 0068:c25a5eb0
[   12.480839] CR2: 0000000080040100
[   12.483935] ---[ end trace 263ded239615b194 ]---
[   12.484522] Kernel panic - not syncing: Fatal exception

dmesg-quantal-intel12-42:20151227015719:i386-randconfig-h0-12261754:4.4.0-r=
c4-00029-gc7af9d5:1

[   19.987520] init: Failed to create pty - disabling logging for job
[   19.988872] init: Temporary process spawn error: No space left on device
[   20.258247] initctl (158) used greatest stack depth: 6732 bytes left
[   20.369884] BUG: unable to handle kernel NULL pointer dereference at 000=
00001
[   20.371241] IP: [<b10c5f72>] __kmalloc+0x8e/0x121
[   20.372167] *pde =3D 00000000 =

[   20.372750] Oops: 0000 [#1] PREEMPT SMP =

[   20.373535] Modules linked in:
[   20.374106] CPU: 0 PID: 177 Comm: udevd Not tainted 4.4.0-rc4-00029-gc7a=
f9d5 #1
[   20.375330] task: bc3e32c0 ti: c2552000 task.ti: c2552000
[   20.376317] EIP: 0060:[<b10c5f72>] EFLAGS: 00010246 CPU: 0
[   20.387482] EIP is at __kmalloc+0x8e/0x121
[   20.388217] EAX: 00000001 EBX: 00000001 ECX: 00052e20 EDX: b15796f0
[   20.397993] ESI: b0098e00 EDI: 024080c0 EBP: c2553f1c ESP: c2553efc
[   20.399360]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[   20.400500] CR0: 8005003b CR2: 00000001 CR3: 12555000 CR4: 000006d0
[   20.401832] Stack:
[   20.402287]  b105a3e3 00000246 00000001 00000001 00052e20 c24663c0 b158e=
5c0 c24663c0
[   20.404058]  c2553f24 b105a3e3 c2553f40 b105d658 b158e5c0 b158e5c0 c2466=
3c0 b158e5c0
[   20.404065]  bc3e32c0 c2553f50 b1057c85 c24db900 bc3e32c0 c2553f64 b1062=
247 c24db6c0
[   20.404071] Call Trace:
[   20.404077]  [<b105a3e3>] ? kzalloc+0xd/0xf
[   20.404081]  [<b105a3e3>] kzalloc+0xd/0xf
[   20.404085]  [<b105d658>] alloc_fair_sched_group+0x33/0xc9
[   20.404088]  [<b1057c85>] sched_create_group+0x23/0x4a
[   20.404091]  [<b1062247>] sched_autogroup_create_attach+0x27/0xc7
[   20.404095]  [<b1048a83>] sys_setsid+0xc2/0xcb
[   20.404098]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[   20.404102]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[   20.404105]  [<b12f0000>] ? __schedule+0x18e/0x359
[   20.404106] Code: f0 75 e8 8b 18 85 db 75 16 8b 4d e0 89 fa 89 f0 e8 fd =
fd ff ff 89 c3 8b 06 64 ff 40 14 eb 75 8b 46 14 01 d8 f6 06 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 58 d7 ff ff 8b 16 89 45 e4 64 8b 0a 39 cb c7
[   20.404148] EIP: [<b10c5f72>] __kmalloc+0x8e/0x121 SS:ESP 0068:c2553efc
[   20.404154] CR2: 0000000000000001
[   20.423760] ---[ end trace aef375dc8f873b6d ]---
[   20.423763] Kernel panic - not syncing: Fatal exception

dmesg-quantal-intel12-48:20151227020252:i386-randconfig-h0-12261754:4.4.0-r=
c4-00029-gc7af9d5:1

[   16.969039] init: Temporary process spawn error: No space left on device
[   17.141785] initctl (159) used greatest stack depth: 6688 bytes left
[   17.228642] mountall (125) used greatest stack depth: 6388 bytes left
[   17.262179] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[   17.266487] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[   17.272154] *pde =3D 00000000 =

[   17.277646] Oops: 0000 [#1] PREEMPT SMP =

[   17.281136] Modules linked in:
[   17.285770] CPU: 0 PID: 179 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[   17.290147] task: bc3ef400 ti: c255e000 task.ti: c255e000
[   17.299784] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 0
[   17.300808] EIP is at set_next_entity+0x3e/0x64
[   17.310795] EAX: 00000000 EBX: bc3ef444 ECX: 00000000 EDX: bc3ef444
[   17.313069] ESI: c24a5580 EDI: bc3ef400 EBP: c255ff08 ESP: c255fefc
[   17.319026]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[   17.325124] CR0: 8005003b CR2: 000004ec CR3: 1259a000 CR4: 000006d0
[   17.332770] Stack:
[   17.334104]  bc3ef444 c108da80 bc3ef400 c255ff14 b105b35e bc3ef400 c255f=
f34 b1057eb2
[   17.340427]  b158e5c0 00000001 00000086 bc3ef400 bd4275c0 bc3ef400 c255f=
f50 b1062211
[   17.347788]  bc3e4280 00000282 c258b280 bc3ef400 c24aeb40 c255ff64 b1062=
2d8 c24c3180
[   17.353590] Call Trace:
[   17.355398]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[   17.356845]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[   17.362702]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[   17.366142]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[   17.367585]  [<b1048a83>] sys_setsid+0xc2/0xcb
[   17.372104]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[   17.375097]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[   17.380252] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[   17.398396] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c255=
fefc
[   17.404436] CR2: 00000000000004ec
[   17.405180] ---[ end trace ef282028fd9e498f ]---
[   17.412507] Kernel panic - not syncing: Fatal exception

dmesg-quantal-intel12-5:20151227020222:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[   18.239609] stop (156) used greatest stack depth: 6628 bytes left
[   18.271608] 10-help-text (164) used greatest stack depth: 6408 bytes left
udevd[187]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:LNX=
SYSTM:': No such file or directory
[   18.588797] BUG: unable to handle kernel =

[   18.593286] power_supply test_ac: uevent
[   18.593289] power_supply test_ac: POWER_SUPPLY_NAME=3Dtest_ac
[   18.593297] power_supply test_ac: prop ONLINE=3D1

dmesg-quantal-intel12-6:20151227020307:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[   12.896594] init: Temporary process spawn error: No space left on device
[   13.017625] sh (136) used greatest stack depth: 6704 bytes left
[   13.089003] stop (161) used greatest stack depth: 6636 bytes left
[   13.156674] BUG: unable to handle kernel paging request at ffffffff
[   13.157822] IP: [<b11c5899>] tty_paranoia_check+0x22/0x54
[   13.158727] *pde =3D 0157e063 *pte =3D 00000000 =

[   13.159293] Oops: 0000 [#1] PREEMPT SMP =

[   13.159808] Modules linked in:
[   13.160185] CPU: 0 PID: 1 Comm: init Not tainted 4.4.0-rc4-00029-gc7af9d=
5 #1
[   13.161407] task: b0040000 ti: b0016000 task.ti: b0016000
[   13.164329] EIP: 0060:[<b11c5899>] EFLAGS: 00010246 CPU: 0
[   13.166318] EIP is at tty_paranoia_check+0x22/0x54
[   13.167412] EAX: ffffffff EBX: 00000000 ECX: b1468db2 EDX: c0f9a758
[   13.169301] ESI: 00000003 EDI: b0017e1c EBP: b0017b00 ESP: b0017afc
[   13.170156]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[   13.172980] CR0: 80050033 CR2: ffffffff CR3: 0c3f9000 CR4: 000006d0
[   13.174904] Stack:
[   13.175148]  c24c7c00 b0017b1c b11c5d2c b0017ba0 ffffffff 00000000 00000=
003 b0017e1c
[   13.177485]  b0017e08 b10dc0f9 b0018000 b0040000 000073e8 b0017e48 b0017=
e44 b0017e40
[   13.179816]  b0017e3c b0017e38 b0017e34 00000020 00000380 c24c7c00 00000=
000 00000020
[   13.182711] Call Trace:
[   13.183510]  [<b11c5d2c>] tty_poll+0x26/0x65
[   13.185051]  [<b10dc0f9>] do_select+0x320/0x5e4
[   13.186410]  [<b1052dbc>] ? finish_task_switch+0xf7/0x13a
[   13.187918]  [<b10dbafd>] ? set_restore_sigmask+0x2a/0x2a
[   13.189012]  [<b107060d>] ? rcu_report_unblock_qs_rnp+0x26/0x6d
[   13.191314]  [<b1073706>] ? rcu_read_unlock_special+0x1d4/0x216
[   13.192805]  [<b106f5ba>] ? __rcu_read_unlock+0x3a/0x47
[   13.194010]  [<b12e9fdb>] ? scm_destroy+0xd/0x23
[   13.196010]  [<b12eae71>] ? unix_stream_sendmsg+0x226/0x253
[   13.197486]  [<b12bf7e5>] ? sock_sendmsg_nosec+0xd/0x19
[   13.198891]  [<b12c101d>] ? ___sys_sendmsg+0x172/0x180
[   13.200943]  [<b10a6880>] ? __alloc_pages_nodemask+0xe5/0x623
[   13.202167]  [<b1065cb2>] ? do_raw_spin_unlock+0x6e/0x71
[   13.203195]  [<b10be768>] ? pte_offset_kernel+0x1f/0x3d
[   13.205304]  [<b10a50e9>] ? zone_watermark_ok+0x1c/0x24
[   13.206773]  [<b10a64f7>] ? get_page_from_freelist+0x35e/0x53a
[   13.208729]  [<b10e1c4e>] ? __fget_light+0x21/0x41
[   13.209904]  [<b10e1c7b>] ? __fdget+0xd/0xf
[   13.211885]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[   13.213268]  [<b1052f5f>] ? __might_sleep+0x6b/0x72
[   13.214512]  [<b1152645>] ? _copy_from_user+0x3f/0x52
[   13.216441]  [<b10dba56>] ? copy_from_user+0x28/0x2d
[   13.218320]  [<b10dc4f8>] core_sys_select+0x13b/0x1be
[   13.219654]  [<b11664fa>] ? debug_check_no_obj_freed+0xe4/0x126
[   13.221172]  [<b1079f70>] ? current_kernel_time64+0x40/0x67
[   13.222718]  [<b1074c21>] ? current_fs_time+0x22/0x28
[   13.224492]  [<b10e074a>] ? file_update_time+0x20/0x9a
[   13.225820]  [<b106418d>] ? percpu_up_read+0xe/0x31
[   13.227659]  [<b10d10fa>] ? __sb_end_write+0x12/0x14
[   13.229726]  [<b1065cb2>] ? do_raw_spin_unlock+0x6e/0x71
[   13.232490]  [<b12f2cf0>] ? _raw_spin_unlock+0x8/0x1a
[   13.234066]  [<b10b8575>] ? handle_mm_fault+0xd39/0xeac
[   13.236763]  [<b102e45f>] ? kvm_clock_get_cycles+0x9/0xc
[   13.238812]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[   13.240983]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[   13.244682]  [<b10dc5e6>] SYSC_select+0x6b/0x8b
[   13.245791]  [<b102fe88>] ? __do_page_fault+0x2b4/0x357
[   13.248624]  [<b10dc61d>] SyS_select+0x17/0x19
[   13.249796]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[   13.252618]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[   13.254420] Code: 89 e5 e8 1f 12 f0 ff 5d c3 55 85 c0 89 e5 53 75 18 8b =
42 24 51 89 c2 c1 e8 14 81 e2 ff ff 0f 00 52 50 68 4d 8d 46 b1 eb 20 31 db =
<81> 38 01 54 00 00 74 23 8b 42 24 51 89 c2 c1 e8 14 81 e2 ff ff
[   13.266807] EIP: [<b11c5899>] tty_paranoia_check+0x22/0x54 SS:ESP 0068:b=
0017afc
[   13.270660] CR2: 00000000ffffffff
[   13.271126] ---[ end trace c150c9e71e58b04e ]---
[   13.273563] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-100:20151227015823:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    4.908373] init: Temporary process spawn error: No space left on device
[    4.931878] initctl (158) used greatest stack depth: 6732 bytes left
[    4.934683] stop (161) used greatest stack depth: 6676 bytes left
[    4.942982] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    4.943837] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    4.944341] *pde =3D 00000000 =

[    4.944467] mountall (124) used greatest stack depth: 6388 bytes left

[    4.945169] =

[    4.945336] Oops: 0000 [#1] PREEMPT SMP =

[    4.945892] Modules linked in:
[    4.946165] CPU: 0 PID: 174 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    4.946845] task: b0105700 ti: c2566000 task.ti: c2566000
[    4.947293] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 0
[    4.947747] EIP is at set_next_entity+0x3e/0x64
[    4.948134] EAX: 00000000 EBX: b0105744 ECX: 00000000 EDX: b0105744
[    4.948752] ESI: c25a0180 EDI: b0105700 EBP: c2567f08 ESP: c2567efc
[    4.949405]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    4.949874] CR0: 8005003b CR2: 000004ec CR3: 12598000 CR4: 000006d0
[    4.950579] Stack:
[    4.950769]  b0105744 c108da80 b0105700 c2567f14 b105b35e b0105700 c2567=
f34 b1057eb2
[    4.951517]  b158e5c0 00000001 00000086 b0105700 b010ad00 b0105700 c2567=
f50 b1062211
[    4.952434]  c2400f00 00000282 bd961d00 b0105700 c2489540 c2567f64 b1062=
2d8 b010a5c0
[    4.953166] Call Trace:
[    4.953384]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    4.953812]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    4.954215]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    4.954659]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    4.955172]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    4.955758]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    4.956187]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    4.956614] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    4.959320] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c256=
7efc
[    4.960048] CR2: 00000000000004ec
[    4.960336] ---[ end trace fb957e979a448c4d ]---
[    4.960721] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-103:20151227020229:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    4.980865] init: Failed to create pty - disabling logging for job
[    4.981755] init: Temporary process spawn error: No space left on device
[    5.018251] initctl (160) used greatest stack depth: 6400 bytes left
[    5.031664] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    5.032555] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    5.033162] *pde =3D 00000000 =

[    5.033523] Oops: 0000 [#1] PREEMPT SMP =

[    5.034023] Modules linked in:
[    5.034403] CPU: 1 PID: 174 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    5.035329] task: b0103a00 ti: c24f6000 task.ti: c24f6000
[    5.035955] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 1
[    5.036587] EIP is at set_next_entity+0x3e/0x64
[    5.037106] EAX: 00000000 EBX: b0103a44 ECX: 00000000 EDX: b0103a44
[    5.037826] ESI: c24d9080 EDI: b0103a00 EBP: c24f7f08 ESP: c24f7efc
[    5.038544]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.039159] CR0: 8005003b CR2: 000004ec CR3: 1258c000 CR4: 000006d0
[    5.039879] Stack:
[    5.040119]  b0103a44 c109da80 b0103a00 c24f7f14 b105b35e b0103a00 c24f7=
f34 b1057eb2
[    5.041135]  b158e5c0 00000001 00000086 b0103a00 b0191b80 b0103a00 c24f7=
f50 b1062211
[    5.042150]  bc3c4000 00000282 b0191fc0 b0103a00 b0113e40 c24f7f64 b1062=
2d8 bd961640
[    5.043169] Call Trace:
[    5.043470]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    5.044058]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    5.044628]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.045236]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.045940]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.046458]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.047049]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.047634] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    5.050839] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c24f=
7efc
[    5.051684] CR2: 00000000000004ec
[    5.052071] ---[ end trace f78e404cfcff212c ]---
[    5.052608] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-104:20151227020020:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    4.986847] init: Failed to create pty - disabling logging for job
[    4.987555] init: Temporary process spawn error: No space left on device
[    5.016485] initctl (159) used greatest stack depth: 6712 bytes left
[    5.027010] BUG: unable to handle kernel paging request at 5e9c185f
[    5.027622] IP: [<5e9c185f>] 0x5e9c185f
[    5.028028] *pde =3D 00000000 =

[    5.028439] Oops: 0000 [#1] PREEMPT SMP =

[    5.028815] Modules linked in:
[    5.029090] CPU: 0 PID: 93 Comm: kworker/u4:1 Not tainted 4.4.0-rc4-0002=
9-gc7af9d5 #1
[    5.029747] Workqueue: events_unbound flush_to_ldisc
[    5.030173] task: c241e580 ti: c240a000 task.ti: c240a000
[    5.030628] EIP: 0060:[<5e9c185f>] EFLAGS: 00010206 CPU: 0
[    5.031086] EIP is at 0x5e9c185f
[    5.031361] EAX: c24f5800 EBX: c24f6000 ECX: 00000000 EDX: c24f604b
[    5.031889] ESI: 5e9c185f EDI: c24f5800 EBP: c240bf00 ESP: c240bed0
[    5.032406]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
[    5.032864] CR0: 8005003b CR2: 5e9c185f CR3: 125a9000 CR4: 000006d0
[    5.033384] Stack:
[    5.033565]  b11cbdca 00000018 c2483400 b0192338 c2483414 b0192348 00000=
018 c2483404
[    5.034308]  b0192348 b0197420 c2483404 b0021000 c240bf24 b104bc15 c2483=
408 00000000
[    5.035054]  00000000 b0090a00 b0197420 b0021000 b0197438 c240bf48 b104c=
0c2 c241e580
[    5.035802] Call Trace:
[    5.036016]  [<b11cbdca>] ? flush_to_ldisc+0xba/0x10c
[    5.036440]  [<b104bc15>] process_one_work+0x11b/0x1bd
[    5.036880]  [<b104c0c2>] worker_thread+0x1b3/0x250
[    5.037290]  [<b104bf0f>] ? rescuer_thread+0x237/0x237
[    5.037725]  [<b104bf0f>] ? rescuer_thread+0x237/0x237
[    5.038156]  [<b104f9f7>] kthread+0x8c/0x91
[    5.038509]  [<b12f3111>] ret_from_kernel_thread+0x21/0x40
[    5.038978]  [<b104f96b>] ? kthread_parkme+0x19/0x19
[    5.039397] Code:  Bad EIP value.
[    5.039713] EIP: [<5e9c185f>] 0x5e9c185f SS:ESP 0068:c240bed0
[    5.040216] CR2: 000000005e9c185f
[    5.040496] ---[ end trace 905628a42fed27ea ]---
[    5.040887] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-106:20151227020017:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

udevd[260]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:PNP=
0A06:': No such file or directory
udevd[256]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:PNP=
0C0F:': No such file or directory
udevd[268]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:PNP=
0A06:': No such file or directory
[    5.261335] BUG: unable to handle kernel paging request at 80040100
[    5.261896] IP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9
[    5.262337] *pde =3D 00000000 =

[    5.262593] Oops: 0000 [#1] PREEMPT SMP =

[    5.262947] Modules linked in:
[    5.263211] CPU: 0 PID: 270 Comm: udevd Not tainted 4.4.0-rc4-00029-gc7a=
f9d5 #1
[    5.263804] task: c1864fc0 ti: c27bc000 task.ti: c27bc000
[    5.264238] EIP: 0060:[<b10c5df7>] EFLAGS: 00010246 CPU: 0
[    5.264685] EIP is at kmem_cache_alloc+0x64/0xe9
[    5.265060] EAX: 80040100 EBX: b0098e00 ECX: 0004dcc0 EDX: b15796f0
[    5.265569] ESI: 80040100 EDI: b10f2eed EBP: c27bdf4c ESP: c27bdf30
[    5.266072]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.266513] CR0: 8005003b CR2: 80040100 CR3: 126c8000 CR4: 000006d0
[    5.267018] Stack:
[    5.267188]  b10f2eed afe9193c 0004dcc0 024000c0 ffffffff 00080800 fffff=
ff4 c27bdf70
[    5.267370]  b10f2eed b102fe88 00000246 80040100 00000001 c27bdfac a7772=
a7b a773eff4
[    5.267373]  c27bdf7c b10f301e 00080800 c27bdfa4 b1000eb4 ffffffff afe91=
93c 00000008
[    5.267375] Call Trace:
[    5.267379]  [<b10f2eed>] ? SYSC_signalfd4+0x72/0x162
[    5.267380]  [<b10f2eed>] SYSC_signalfd4+0x72/0x162
[    5.267383]  [<b102fe88>] ? __do_page_fault+0x2b4/0x357
[    5.267385]  [<b10f301e>] SyS_signalfd4+0x14/0x16
[    5.267386]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.267390]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.267390] Code: 75 e8 8b 30 85 f6 75 17 8b 4d e4 8b 55 f0 89 d8 e8 78 =
ff ff ff 89 c6 8b 03 64 ff 40 14 eb 66 8b 43 14 01 f0 f6 03 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 d3 d8 ff ff 8b 13 31 c9 64 8b 3a 39 fe 75 20
[    5.267410] EIP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9 SS:ESP 0068:c27=
bdf30
[    5.267412] CR2: 0000000080040100
[    5.268093] BUG: unable to handle kernel paging request at 80040100
[    5.268095] IP: [<b10c5f72>] __kmalloc+0x8e/0x121
[    5.268096] *pde =3D 00000000 =

[    5.268097] Oops: 0000 [#2] PREEMPT SMP =

[    5.268098] Modules linked in:
[    5.268100] CPU: 0 PID: 307 Comm: upstart-socket- Tainted: G      D     =
    4.4.0-rc4-00029-gc7af9d5 #1
[    5.268101] task: c1866cc0 ti: c1806000 task.ti: c1806000
[    5.268102] EIP: 0060:[<b10c5f72>] EFLAGS: 00010246 CPU: 0
[    5.268103] EIP is at __kmalloc+0x8e/0x121
[    5.268104] EAX: 80040100 EBX: 80040100 ECX: 0004dcc0 EDX: b15796f0
[    5.268105] ESI: b0098e00 EDI: 024080c0 EBP: c1807f1c ESP: c1807efc
[    5.268105]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.268106] CR0: 8005003b CR2: 80040100 CR3: 1193a000 CR4: 000006d0
[    5.268110] Stack:
[    5.268112]  b105a3e3 00000246 c1807f10 c1807f10 0004dcc0 c18956c0 b158e=
5c0 c18956c0
[    5.268115]  c1807f24 b105a3e3 c1807f40 b105d640 b158e5c0 b158e5c0 c1895=
6c0 b158e5c0
[    5.268117]  c1866cc0 c1807f50 b1057c85 c182ad80 c1866cc0 c1807f64 b1062=
247 c1897c80
[    5.268117] Call Trace:
[    5.268121]  [<b105a3e3>] ? kzalloc+0xd/0xf
[    5.268122]  [<b105a3e3>] kzalloc+0xd/0xf
[    5.268125]  [<b105d640>] alloc_fair_sched_group+0x1b/0xc9
[    5.268127]  [<b1057c85>] sched_create_group+0x23/0x4a
[    5.268128]  [<b1062247>] sched_autogroup_create_attach+0x27/0xc7
[    5.268131]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.268132]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.268134]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.268149] Code: f0 75 e8 8b 18 85 db 75 16 8b 4d e0 89 fa 89 f0 e8 fd =
fd ff ff 89 c3 8b 06 64 ff 40 14 eb 75 8b 46 14 01 d8 f6 06 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 58 d7 ff ff 8b 16 89 45 e4 64 8b 0a 39 cb c7
[    5.268152] EIP: [<b10c5f72>] __kmalloc+0x8e/0x121 SS:ESP 0068:c1807efc
[    5.268152] CR2: 0000000080040100
[    5.268153] ---[ end trace 3be9dd3b5eb0ad95 ]---
[    5.268154] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-107:20151227015640:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    5.097416] init: Temporary process spawn error: No space left on device
[    5.131262] initctl (158) used greatest stack depth: 6784 bytes left
[    5.142414] stop (160) used greatest stack depth: 6632 bytes left
[    5.145147] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    5.146037] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    5.146667] *pde =3D 00000000 =

[    5.147029] Oops: 0000 [#1] PREEMPT SMP =

[    5.147610] Modules linked in:
[    5.147993] CPU: 1 PID: 173 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    5.148841] task: c2410000 ti: c250c000 task.ti: c250c000
[    5.149477] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 1
[    5.150118] EIP is at set_next_entity+0x3e/0x64
[    5.150657] EAX: 00000000 EBX: c2410044 ECX: 00000000 EDX: c2410044
[    5.151385] ESI: c258e280 EDI: c2410000 EBP: c250df08 ESP: c250defc
[    5.152120]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.152756] CR0: 8005003b CR2: 000004ec CR3: 124f2000 CR4: 000006d0
[    5.153494] Stack:
[    5.153740]  c2410044 c109da80 c2410000 c250df14 b105b35e c2410000 c250d=
f34 b1057eb2
[    5.154778]  b158e5c0 00000001 00000086 c2410000 bd9613c0 c2410000 c250d=
f50 b1062211
[    5.155815]  bc3df180 00000282 b010ac00 c2410000 b0113540 c250df64 b1062=
2d8 bd961f00
[    5.156851] Call Trace:
[    5.157148]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    5.157755]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    5.158329]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.158957]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.159672]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.160193]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.160799]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.161390] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    5.164666] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c250=
defc
[    5.165525] CR2: 00000000000004ec
[    5.165918] ---[ end trace 4759a083b03ab313 ]---
[    5.166459] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-109:20151227020114:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    5.482291] init: Failed to create pty - disabling logging for job
[    5.483262] init: Temporary process spawn error: No space left on device
[    5.518969] initctl (159) used greatest stack depth: 6388 bytes left
[    5.537414] BUG: unable to handle kernel paging request at ffffffff
[    5.538243] IP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9
[    5.539037] *pde =3D 0157e063 *pte =3D 00000000 =

[    5.539667] Oops: 0000 [#1] PREEMPT SMP =

[    5.540202] Modules linked in:
[    5.540654] CPU: 1 PID: 178 Comm: sh Not tainted 4.4.0-rc4-00029-gc7af9d=
5 #1
[    5.541094] udevd[177]: starting version 175
[    5.542088] task: b01b0000 ti: c25b4000 task.ti: c25b4000
[    5.542785] EIP: 0060:[<b10c5df7>] EFLAGS: 00010246 CPU: 1
[    5.543509] EIP is at kmem_cache_alloc+0x64/0xe9
[    5.544072] EAX: ffffffff EBX: b0098d00 ECX: 00011181 EDX: b1579768
[    5.544895] ESI: ffffffff EDI: b11030c9 EBP: c25b5e30 ESP: c25b5e14
[    5.545732]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.546392] CR0: 80050033 CR2: ffffffff CR3: 125d1000 CR4: 000006d0
[    5.547118] Stack:
[    5.547287]  b11030c9 c25b5e28 00011181 024000c0 c25b5e88 c25b5ecc 00000=
0b2 c25b5e44
[    5.548057]  b11030c9 c25b5e88 b012001b c25b5ec4 c25b5e6c b10d80b1 c0c01=
1b0 c0c121b4
[    5.548790]  b10d7ada c10e4748 b0120010 c25b5e88 c25b5f4c ffffffc8 c25b5=
e80 b10d82a5
[    5.549521] Call Trace:
[    5.549739]  [<b11030c9>] ? proc_self_follow_link+0x34/0x61
[    5.550192]  [<b11030c9>] proc_self_follow_link+0x34/0x61
[    5.550666]  [<b10d80b1>] link_path_walk+0x1b3/0x331
[    5.551070]  [<b10d7ada>] ? path_init+0xfa/0x245
[    5.551451]  [<b10d82a5>] path_lookupat+0x21/0xcb
[    5.551862]  [<b10d9212>] filename_lookup+0x50/0x99
[    5.552262]  [<b10c411c>] ? slab_post_alloc_hook+0xa/0x17
[    5.552774]  [<b10d8fe9>] ? getname_flags+0x21/0x11e
[    5.553184]  [<b10d92d1>] user_path_at_empty+0x25/0x2c
[    5.553654]  [<b10d2666>] SYSC_readlinkat+0x3d/0xae
[    5.554053]  [<b10d2ca6>] SyS_readlink+0x2a/0x2c
[    5.554424]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.554857]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.555267] Code: 75 e8 8b 30 85 f6 75 17 8b 4d e4 8b 55 f0 89 d8 e8 78 =
ff ff ff 89 c6 8b 03 64 ff 40 14 eb 66 8b 43 14 01 f0 f6 03 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 d3 d8 ff ff 8b 13 31 c9 64 8b 3a 39 fe 75 20
[    5.557607] EIP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9 SS:ESP 0068:c25=
b5e14
[    5.558205] CR2: 00000000ffffffff
[    5.558496] ---[ end trace 0635c28e0488d3a3 ]---
[    5.558868] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-10:20151227015713:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.217748] init: Temporary process spawn error: No space left on device
[    5.250666] initctl (159) used greatest stack depth: 6752 bytes left
[    5.254368] stop (160) used greatest stack depth: 6596 bytes left
[    5.264043] BUG: spinlock bad magic on CPU#1, init/171
[    5.264540]  lock: 0xb010e650, .magic: ffffffff, .owner: <none>/-1, .own=
er_cpu: -1
[    5.265215] CPU: 1 PID: 171 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    5.265856]  00000000 00000000 c25b1d54 b114a4ae b14657b3 c25b1d7c b1065=
aac b14459cd
[    5.266684]  b010e650 ffffffff b14657b3 ffffffff ffffffff b010e650 afac1=
000 c25b1d8c
[    5.267428]  b1065ad3 b1445a2f b010e650 c25b1da8 b1065b3c c10e40e0 00000=
246 afac1000
[    5.268217] Call Trace:
[    5.268457]  [<b114a4ae>] dump_stack+0x48/0x69
[    5.268849]  [<b1065aac>] spin_dump+0x6f/0x79
[    5.269198]  [<b1065ad3>] spin_bug+0x1d/0x21
[    5.269570]  [<b1065b3c>] do_raw_spin_lock+0x1e/0xf1
[    5.269998]  [<b12f2c57>] _raw_spin_lock+0xf/0x11
[    5.270425]  [<b10b65da>] unmap_single_vma+0x197/0x38e
[    5.270931]  [<b10b697c>] unmap_vmas+0x27/0x36
[    5.271319]  [<b10bb102>] exit_mmap+0x45/0xaf
[    5.271746]  [<b103b841>] mmput+0x45/0x81
[    5.272073]  [<b10d3fcf>] flush_old_exec+0x587/0x5e4
[    5.272502]  [<b10fa690>] load_elf_binary+0x22a/0x93e
[    5.272939]  [<b1152645>] ? _copy_from_user+0x3f/0x52
[    5.273372]  [<b10a9bc1>] ? put_page+0x1b/0x32
[    5.273786]  [<b10d3494>] search_binary_handler+0x103/0x157
[    5.274237]  [<b10d45f1>] do_execveat_common+0x3b7/0x4de
[    5.274711]  [<b10d472c>] do_execve+0x14/0x16
[    5.275078]  [<b10d48b9>] SyS_execve+0x1c/0x20
[    5.275471]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.275912]  [<b12f31ed>] sysenter_past_esp+0x36/0x59


dmesg-quantal-ivb41-10:20151227020248:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    4.950587] page dumped because: VM_BUG_ON_PAGE(atomic_read(&page->_coun=
t) =3D=3D 0)
[    4.951206] page->mem_cgroup:0002c46d
[    4.951518] ------------[ cut here ]------------
[    4.951939] kernel BUG at include/linux/mm.h:342!
[    4.952466] invalid opcode: 0000 [#1] PREEMPT SMP =

[    4.952895] Modules linked in:
[    4.953161] CPU: 1 PID: 94 Comm: kworker/1:1 Not tainted 4.4.0-rc4-00029=
-gc7af9d5 #1
[    4.953788] Workqueue: events bpf_prog_free_deferred
[    4.954228] task: bc397400 ti: c2456000 task.ti: c2456000
[    4.954664] EIP: 0060:[<b10a442d>] EFLAGS: 00010286 CPU: 1
[    4.955139] EIP is at put_page_testzero+0x14/0x25
[    4.955523] EAX: b144d183 EBX: b01139c0 ECX: 00000019 EDX: 0002c46d
[    4.956057] ESI: 00000001 EDI: c2470200 EBP: c2457ebc ESP: c2457ebc
[    4.956562]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
[    4.957024] CR0: 8005003b CR2: a770a058 CR3: 01580000 CR4: 000006d0
[    4.957530] Stack:
[    4.957700]  c2457ecc b10a5cb9 00000000 00000001 c2457ee0 b10c00c3 c33f2=
000 bd961698
[    4.958436]  c109d580 c2457eec b10c0161 c33f2000 c2457ef8 b109234b b010c=
6c0 c2457f00
[    4.959149]  b10923d6 c2457f24 b104bc15 bd96169c 00000000 00000000 c109f=
800 b010c6c0
[    4.959859] Call Trace:
[    4.960066]  [<b10a5cb9>] __free_pages+0xf/0x2c
[    4.960436]  [<b10c00c3>] __vunmap+0x7a/0x9d
[    4.960791]  [<b10c0161>] vfree+0x59/0x5c
[    4.961148]  [<b109234b>] __bpf_prog_free+0x15/0x18
[    4.961543]  [<b10923d6>] bpf_prog_free_deferred+0xb/0xd
[    4.962001]  [<b104bc15>] process_one_work+0x11b/0x1bd
[    4.962416]  [<b104c0c2>] worker_thread+0x1b3/0x250
[    4.962811]  [<b104bf0f>] ? rescuer_thread+0x237/0x237
[    4.963233]  [<b104bf0f>] ? rescuer_thread+0x237/0x237
[    4.963652]  [<b104f9f7>] kthread+0x8c/0x91
[    4.964022]  [<b12f3111>] ret_from_kernel_thread+0x21/0x40
[    4.964469]  [<b104f96b>] ? kthread_parkme+0x19/0x19
[    4.964876] Code: 74 0c ba eb ac 44 b1 e8 d3 02 01 00 0f 0b c7 40 10 01 =
00 00 00 5d c3 8b 50 10 85 d2 75 0f 55 ba 16 ad 44 b1 89 e5 e8 b4 02 01 00 =
<0f> 0b f0 ff 48 10 74 03 31 c0 c3 b8 01 00 00 00 c3 83 3d 28 5a
[    4.967149] EIP: [<b10a442d>] put_page_testzero+0x14/0x25 SS:ESP 0068:c2=
457ebc
[    4.968013] ---[ end trace c3a5cd527d5fc4d6 ]---
[    4.968408] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-110:20151227015617:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    5.122762] init: Temporary process spawn error: No space left on device
[    5.127955] mount (136) used greatest stack depth: 6748 bytes left
[    5.156746] stop (163) used greatest stack depth: 6708 bytes left
[    5.166807] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    5.167480] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    5.167933] *pde =3D 00000000 =

[    5.168205] Oops: 0000 [#1] PREEMPT SMP =

[    5.168594] Modules linked in:
[    5.168913] CPU: 1 PID: 174 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    5.169613] task: c2412440 ti: c25a4000 task.ti: c25a4000
[    5.170069] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 1
[    5.170587] EIP is at set_next_entity+0x3e/0x64
[    5.171123] EAX: 00000000 EBX: c2412484 ECX: 00000000 EDX: c2412484
[    5.171680] ESI: c244c980 EDI: c2412440 EBP: c25a5f08 ESP: c25a5efc
[    5.172425]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.173221] CR0: 8005003b CR2: 000004ec CR3: 1257f000 CR4: 000006d0
[    5.174212] Stack:
[    5.174534]  c2412484 c109da80 c2412440 c25a5f14 b105b35e c2412440 c25a5=
f34 b1057eb2
[    5.175768]  b158e5c0 00000001 00000086 c2412440 b0191bc0 c2412440 c25a5=
f50 b1062211
[    5.176945]  c2422000 00000282 b0191f80 c2412440 b0113b40 c25a5f64 b1062=
2d8 bd961b80
[    5.178198] Call Trace:
[    5.178551]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    5.179241]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    5.179922]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.180640]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.181453]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.182054]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.182754]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.183441] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    5.187110] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c25a=
5efc
[    5.187706] CR2: 00000000000004ec
[    5.187978] ---[ end trace ab634e9981bdc8bb ]---
[    5.188356] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-110:20151227015835:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    4.982712] page dumped because: VM_BUG_ON_PAGE(atomic_read(&page->_coun=
t) =3D=3D 0)
[    4.983768] page->mem_cgroup:004e63bd
[    4.984292] ------------[ cut here ]------------
[    4.984931] kernel BUG at include/linux/mm.h:342!
[    4.985685] invalid opcode: 0000 [#1] PREEMPT SMP =

[    4.986141] Modules linked in:
[    4.986401] CPU: 1 PID: 94 Comm: kworker/1:1 Not tainted 4.4.0-rc4-00029=
-gc7af9d5 #1
[    4.987473] Workqueue: events bpf_prog_free_deferred
[    4.987537] init: plymouth-log main process (174) terminated with status=
 1

[    4.988810] =

[    4.989016] task: bc397400 ti: c2456000 task.ti: c2456000
[    4.989695] EIP: 0060:[<b10a442d>] EFLAGS: 00010286 CPU: 1
[    4.990298] EIP is at put_page_testzero+0x14/0x25
[    4.990829] EAX: b144d183 EBX: b0112d80 ECX: 00000019 EDX: 004e63bd
[    4.991517] ESI: 00000001 EDI: be896f40 EBP: c2457ebc ESP: c2457ebc
[    4.992210]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
[    4.992833] CR0: 8005003b CR2: 75ce2018 CR3: 1246e000 CR4: 000006d0
[    4.993523] Stack:
[    4.993760]  c2457ecc b10a5cb9 00000000 00000001 c2457ee0 b10c00c3 c33f2=
000 b0191d98
[    4.994724]  c109d580 c2457eec b10c0161 c33f2000 c2457ef8 b109234b b010c=
600 c2457f00
[    4.995705]  b10923d6 c2457f24 b104bc15 b0191d9c 00000000 00000000 c109f=
800 b010c600
[    4.996665] Call Trace:
[    4.996940]  [<b10a5cb9>] __free_pages+0xf/0x2c
[    4.997442]  [<b10c00c3>] __vunmap+0x7a/0x9d
[    4.997939]  [<b10c0161>] vfree+0x59/0x5c
[    4.998388]  [<b109234b>] __bpf_prog_free+0x15/0x18
[    4.998932]  [<b10923d6>] bpf_prog_free_deferred+0xb/0xd
[    4.999518]  [<b104bc15>] process_one_work+0x11b/0x1bd
[    5.000090]  [<b104c0c2>] worker_thread+0x1b3/0x250
[    5.000637]  [<b104bf0f>] ? rescuer_thread+0x237/0x237
[    5.001223]  [<b104bf0f>] ? rescuer_thread+0x237/0x237
[    5.001796]  [<b104f9f7>] kthread+0x8c/0x91
[    5.002256]  [<b12f3111>] ret_from_kernel_thread+0x21/0x40
[    5.002866]  [<b104f96b>] ? kthread_parkme+0x19/0x19
[    5.003416] Code: 74 0c ba eb ac 44 b1 e8 d3 02 01 00 0f 0b c7 40 10 01 =
00 00 00 5d c3 8b 50 10 85 d2 75 0f 55 ba 16 ad 44 b1 89 e5 e8 b4 02 01 00 =
<0f> 0b f0 ff 48 10 74 03 31 c0 c3 b8 01 00 00 00 c3 83 3d 28 5a
[    5.006393] EIP: [<b10a442d>] put_page_testzero+0x14/0x25 SS:ESP 0068:c2=
457ebc
[    5.007270] ---[ end trace 0e720c32ce1767e8 ]---
[    5.008036] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-112:20151227015648:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    4.996592] init: Failed to create pty - disabling logging for job
[    4.997572] init: Temporary process spawn error: No space left on device
[    5.026694] initctl (159) used greatest stack depth: 6676 bytes left
[    5.041874] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    5.042985] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    5.043781] *pde =3D 00000000 =

[    5.044234] Oops: 0000 [#1] PREEMPT SMP =

[    5.044887] Modules linked in:
[    5.045378] CPU: 1 PID: 176 Comm: udevd Not tainted 4.4.0-rc4-00029-gc7a=
f9d5 #1
[    5.046460] task: c24132c0 ti: c25b4000 task.ti: c25b4000
[    5.047256] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 1
[    5.048071] EIP is at set_next_entity+0x3e/0x64
[    5.048743] EAX: 00000000 EBX: c2413304 ECX: 00000000 EDX: c2413304
[    5.049666] ESI: c24ebe00 EDI: c24132c0 EBP: c25b5f08 ESP: c25b5efc
[    5.050593]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.051392] CR0: 8005003b CR2: 000004ec CR3: 125ab000 CR4: 000006d0
[    5.052319] Stack:
[    5.052628]  c2413304 c109da80 c24132c0 c25b5f14 b105b35e c24132c0 c25b5=
f34 b1057eb2
[    5.053934]  b158e5c0 00000001 00000086 c24132c0 bd5d9140 c24132c0 c25b5=
f50 b1062211
[    5.055235]  bc3de000 00000282 bd961b80 c24132c0 b01129c0 c25b5f64 b1062=
2d8 b0191ac0
[    5.056554] Call Trace:
[    5.056928]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    5.057694]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    5.058425]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.059211]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.060116]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.060781]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.061544]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.062288] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    5.066504] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c25b=
5efc
[    5.067592] CR2: 00000000000004ec
[    5.068241] ---[ end trace 58e7fc9de589de9c ]---
[    5.068934] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-113:20151227015634:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    5.169361] sh (117) used greatest stack depth: 6748 bytes left
[    5.196433] init: Failed to create pty - disabling logging for job
[    5.197279] init: Temporary process spawn error: No space left on device
[    5.246276] BUG: spinlock bad magic on CPU#1, init/175
[    5.246994]  lock: 0xbcda7cd0, .magic: ffffffff, .owner: <none>/-1, .own=
er_cpu: -1
[    5.247922] CPU: 1 PID: 175 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    5.248809]  00000000 00000000 c25c5e94 b114a4ae b14657b3 c25c5ebc b1065=
aac b14459cd
[    5.249863] ------------[ cut here ]------------
[    5.249865] kernel BUG at mm/slub.c:3627!
[    5.249868] invalid opcode: 0000 [#1] PREEMPT SMP =

[    5.249869] Modules linked in:
[    5.249871] CPU: 0 PID: 176 Comm: 99-footer Not tainted 4.4.0-rc4-00029-=
gc7af9d5 #1
[    5.249873] task: c2410000 ti: c25ae000 task.ti: c25ae000
[    5.249874] EIP: 0060:[<b10c6ace>] EFLAGS: 00010246 CPU: 0
[    5.249878] EIP is at kfree+0x3a/0xff
[    5.249879] EAX: c10e065c EBX: c256e000 ECX: 00000000 EDX: c10e065c
[    5.249880] ESI: b14f5640 EDI: c10e0648 EBP: c25aff20 ESP: c25aff04
[    5.249882]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
[    5.249883] CR0: 8005003b CR2: aff6e38b CR3: 1258e000 CR4: 000006d0
[    5.249887] Stack:
[    5.249890]  00002123 00000000 c25aff14 b12f2e68 c256e000 00000000 c2410=
000 c25aff2c
[    5.249894]  b10d354a c256e000 c25aff5c b10d464f 00000000 c247e444 0986e=
008 b001e000
[    5.249897]  000000b0 00000000 00000000 0986e008 af96e9e4 a7789ff4 c25af=
f6c b10d472c
[    5.249898] Call Trace:
[    5.249903]  [<b12f2e68>] ? _raw_read_unlock+0x8/0x1a
[    5.249907]  [<b10d354a>] free_bprm+0x62/0x6c
[    5.249909]  [<b10d464f>] do_execveat_common+0x415/0x4de
[    5.249912]  [<b10d472c>] do_execve+0x14/0x16
[    5.249914]  [<b10d48b9>] SyS_execve+0x1c/0x20
[    5.249916]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.249919]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.249942] Code: 89 c6 83 ec 10 e8 0d d2 ff ff 89 c7 e8 3e cc ff ff 85 =
c0 75 18 8b 07 f6 c4 40 0f 85 b8 00 00 00 8b 47 14 a8 01 0f 85 ad 00 00 00 =
<0f> 0b 8b 45 04 8b 5f 1c 31 c9 89 f2 89 45 e8 89 d8 e8 68 d2 ff
[    5.249946] EIP: [<b10c6ace>] kfree+0x3a/0xff SS:ESP 0068:c25aff04
[    5.249947] ---[ end trace ad6f3dc968a8df75 ]---
[    5.249948] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-114:20151227015708:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    5.240925] init: Temporary process spawn error: No space left on device
[    5.266475] initctl (158) used greatest stack depth: 6732 bytes left
[    5.270535] stop (160) used greatest stack depth: 6388 bytes left
[    5.283389] BUG: unable to handle kernel paging request at 00005403
[    5.284317] IP: [<b10c5f72>] __kmalloc+0x8e/0x121
[    5.285051] *pde =3D 00000000 =

[    5.285480] Oops: 0000 [#1] PREEMPT SMP =

[    5.286065] Modules linked in:
[    5.286545] CPU: 0 PID: 174 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    5.287647] task: c2410e80 ti: c2578000 task.ti: c2578000
[    5.288465] EIP: 0060:[<b10c5f72>] EFLAGS: 00010246 CPU: 0
[    5.289299] EIP is at __kmalloc+0x8e/0x121
[    5.289925] EAX: 00005403 EBX: 00005403 ECX: 00054e60 EDX: b15796f0
[    5.290876] ESI: b0098e00 EDI: 024080c0 EBP: c2579f1c ESP: c2579efc
[    5.291816]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.292640] CR0: 8005003b CR2: 00005403 CR3: 12571000 CR4: 000006d0
[    5.293604] Stack:
[    5.293926]  b105a3e3 00000246 00005403 00000001 00054e60 c24a2300 b158e=
5c0 c24a2300
[    5.295256]  c2579f24 b105a3e3 c2579f40 b105d658 b158e5c0 b158e5c0 c24a2=
300 b158e5c0
[    5.296577]  c2410e80 c2579f50 b1057c85 bd960d40 c2410e80 c2579f64 b1062=
247 bd9606c0
[    5.297899] Call Trace:
[    5.298212]  [<b105a3e3>] ? kzalloc+0xd/0xf
[    5.298638]  [<b105a3e3>] kzalloc+0xd/0xf
[    5.299048]  [<b105d658>] alloc_fair_sched_group+0x33/0xc9
[    5.299493]  [<b1057c85>] sched_create_group+0x23/0x4a
[    5.299906]  [<b1062247>] sched_autogroup_create_attach+0x27/0xc7
[    5.300395]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.300753]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.301169]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.301573] Code: f0 75 e8 8b 18 85 db 75 16 8b 4d e0 89 fa 89 f0 e8 fd =
fd ff ff 89 c3 8b 06 64 ff 40 14 eb 75 8b 46 14 01 d8 f6 06 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 58 d7 ff ff 8b 16 89 45 e4 64 8b 0a 39 cb c7
[    5.303814] EIP: [<b10c5f72>] __kmalloc+0x8e/0x121 SS:ESP 0068:c2579efc
[    5.304366] CR2: 0000000000005403
[    5.304829] ---[ end trace 1786a8e6f240c969 ]---
[    5.305230] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-119:20151227020119:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    5.489176] init: Temporary process spawn error: No space left on device
[    5.509643] sh (137) used greatest stack depth: 6708 bytes left
[    5.526110] initctl (159) used greatest stack depth: 6388 bytes left
[    5.549662] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    5.550751] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    5.551504] *pde =3D 00000000 =

[    5.551932] Oops: 0000 [#1] PREEMPT SMP =

[    5.552551] Modules linked in:
[    5.553012] CPU: 0 PID: 178 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    5.554022] task: bc3bba00 ti: c2564000 task.ti: c2564000
[    5.554782] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 0
[    5.555557] EIP is at set_next_entity+0x3e/0x64
[    5.556197] EAX: 00000000 EBX: bc3bba44 ECX: 00000000 EDX: bc3bba44
[    5.557066] ESI: c2574980 EDI: bc3bba00 EBP: c2565f08 ESP: c2565efc
[    5.557942]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.558703] CR0: 8005003b CR2: 000004ec CR3: 1254d000 CR4: 000006d0
[    5.559580] Stack:
[    5.559873]  bc3bba44 c108da80 bc3bba00 c2565f14 b105b35e bc3bba00 c2565=
f34 b1057eb2
[    5.561105]  b158e5c0 00000001 00000086 bc3bba00 b010a5c0 bc3bba00 c2565=
f50 b1062211
[    5.562505]  bc3ddb80 00000282 bd960c00 bc3bba00 c24c4b40 c2565f64 b1062=
2d8 b010af00
[    5.563767] Call Trace:
[    5.564123]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    5.564878]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    5.565601]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.566353]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.567238]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.567885]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.568636]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.569350] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    5.573342] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c256=
5efc
[    5.574405] CR2: 00000000000004ec
[    5.574893] ---[ end trace 4213e2c597b5545b ]---
[    5.575572] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-124:20151227020215:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    4.983613] mountall (120) used greatest stack depth: 6512 bytes left
[    5.002072] init: Failed to create pty - disabling logging for job
[    5.003165] init: Temporary process spawn error: No space left on device
[    5.047506] BUG: unable to handle kernel NULL pointer dereference at 000=
00002
[    5.048628] IP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9
[    5.049413] *pde =3D 00000000 =

[    5.049891] Oops: 0000 [#1] PREEMPT SMP =

[    5.050677] Modules linked in:
[    5.051090] CPU: 1 PID: 1 Comm: init Not tainted 4.4.0-rc4-00029-gc7af9d=
5 #1
[    5.051652] task: b0040000 ti: b0016000 task.ti: b0016000
[    5.052145] EIP: 0060:[<b10c5df7>] EFLAGS: 00010246 CPU: 1
[    5.052958] EIP is at kmem_cache_alloc+0x64/0xe9
[    5.053645] EAX: 00000002 EBX: b0098e00 ECX: 00000f81 EDX: b15796f0
[    5.054544] ESI: 00000002 EDI: b11cb617 EBP: b0017d5c ESP: b0017d40
[    5.055448]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.056241] CR0: 80050033 CR2: 00000002 CR3: 12462000 CR4: 000006d0
[    5.057134] Stack:
[    5.057442]  b11cb617 b0017d50 00000f81 024000c0 c25c4800 b14f5640 00000=
000 b0017d70
[    5.058746]  b11cb617 c25c4800 bc3b7280 00000001 b0017d7c b11cbbbc c25c4=
800 b0017d94
[    5.060040]  b11c75c6 c109eab0 c25c4000 00000000 00000001 b0017dbc b11cd=
2a9 00000000
[    5.061309] Call Trace:
[    5.061665]  [<b11cb617>] ? tty_ldisc_get+0x4e/0x76
[    5.062387]  [<b11cb617>] tty_ldisc_get+0x4e/0x76
[    5.063073]  [<b11cbbbc>] tty_ldisc_init+0xd/0x26
[    5.063772]  [<b11c75c6>] alloc_tty_struct+0x36/0x1d2
[    5.064294]  [<b11cd2a9>] pty_common_install+0x6d/0x1d9
[    5.064720]  [<b11cd42e>] pty_unix98_install+0xa/0xc
[    5.065273]  [<b11c77a9>] tty_init_dev+0x47/0x123
[    5.065965]  [<b11cd569>] ptmx_open+0x69/0x11f
[    5.066601]  [<b10d23e4>] chrdev_open+0xf3/0x103
[    5.067289]  [<b10ce6b9>] do_dentry_open+0x15e/0x1e1
[    5.068103]  [<b10d22f1>] ? cdev_put+0xe/0xe
[    5.068720]  [<b10cf0a5>] vfs_open+0x3e/0x43
[    5.069355]  [<b10d8cb9>] path_openat+0x7f1/0xa19
[    5.070040]  [<b10d0931>] ? get_empty_filp+0x37/0x13d
[    5.070781]  [<b10d9d4b>] do_filp_open+0x2e/0x71
[    5.071443]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[    5.072171]  [<b1065cb2>] ? do_raw_spin_unlock+0x6e/0x71
[    5.072944]  [<b12f2cf0>] ? _raw_spin_unlock+0x8/0x1a
[    5.073654]  [<b10e24c5>] ? __alloc_fd+0x111/0x11b
[    5.074300]  [<b10cf1c0>] do_sys_open+0x54/0xcf
[    5.074888]  [<b10e25f8>] ? fd_install+0x1b/0x1e
[    5.075495]  [<b10cf253>] SyS_open+0x18/0x1a
[    5.076057]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.076724]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.077385] Code: 75 e8 8b 30 85 f6 75 17 8b 4d e4 8b 55 f0 89 d8 e8 78 =
ff ff ff 89 c6 8b 03 64 ff 40 14 eb 66 8b 43 14 01 f0 f6 03 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 d3 d8 ff ff 8b 13 31 c9 64 8b 3a 39 fe 75 20
[    5.080969] EIP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9 SS:ESP 0068:b00=
17d40
[    5.081923] CR2: 0000000000000002
[    5.082772] ---[ end trace d2084e23ad533a91 ]---
[    5.083395] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-127:20151227020035:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    5.426053] init: Failed to create pty - disabling logging for job
[    5.426985] init: Temporary process spawn error: No space left on device
[    5.458397] initctl (157) used greatest stack depth: 6708 bytes left
[    5.472294] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    5.475342] mountall (124) used greatest stack depth: 6388 bytes left
[    5.476305] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    5.476307] *pde =3D 00000000 =

[    5.476309] Oops: 0000 [#1] PREEMPT SMP =

[    5.476311] Modules linked in:
[    5.476313] CPU: 0 PID: 174 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    5.476317] task: bc3bb2c0 ti: c256e000 task.ti: c256e000
[    5.476319] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 0
[    5.476321] EIP is at set_next_entity+0x3e/0x64
[    5.476322] EAX: 00000000 EBX: bc3bb304 ECX: 00000000 EDX: bc3bb304
[    5.476323] ESI: c24d8c80 EDI: bc3bb2c0 EBP: c256ff08 ESP: c256fefc
[    5.476324]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.476325] CR0: 8005003b CR2: 000004ec CR3: 124ff000 CR4: 000006d0
[    5.476329] Stack:
[    5.476333]  bc3bb304 c108da80 bc3bb2c0 c256ff14 b105b35e bc3bb2c0 c256f=
f34 b1057eb2
[    5.476336]  b158e5c0 00000001 00000086 bc3bb2c0 c255b280 bc3bb2c0 c256f=
f50 b1062211
[    5.476340]  bc3df900 00000282 bd9609c0 bc3bb2c0 c24b50c0 c256ff64 b1062=
2d8 c255b380
[    5.476340] Call Trace:
[    5.476344]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    5.476346]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    5.476349]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.476351]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.476354]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.476356]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.476359]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.476382] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    5.476385] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c256=
fefc
[    5.476386] CR2: 00000000000004ec
[    5.476387] ---[ end trace ca43a69725fc5b3c ]---
[    5.476388] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-128:20151227015553:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    5.030340] init: Failed to create pty - disabling logging for job
[    5.031343] init: Temporary process spawn error: No space left on device
[    5.063990] initctl (159) used greatest stack depth: 6732 bytes left
[    5.080554] BUG: unable to handle kernel paging request at 4d002dc8
[    5.081248] IP: [<b10595dd>] attach_entity_load_avg+0x1ae/0x1ec
[    5.081794] *pde =3D 00000000 =

[    5.082060] Oops: 0000 [#1] PREEMPT SMP =

[    5.082445] Modules linked in:
[    5.082721] CPU: 1 PID: 176 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    5.083345] task: c2411d00 ti: c258e000 task.ti: c258e000
[    5.083795] EIP: 0060:[<b10595dd>] EFLAGS: 00010046 CPU: 1
[    5.084263] EIP is at attach_entity_load_avg+0x1ae/0x1ec
[    5.084721] EAX: 4d002d80 EBX: 00000000 ECX: 00000000 EDX: c2411d44
[    5.085247] ESI: 4d002d80 EDI: c2411d44 EBP: c258fef8 ESP: c258fed8
[    5.085792]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.086250] CR0: 8005003b CR2: 4d002dc8 CR3: 125a5000 CR4: 000006d0
[    5.086793] Stack:
[    5.086976]  4d002d80 c2411d44 b105b42a c2411d44 00000000 c2411d00 4d002=
d80 c2411d00
[    5.087732]  c258ff08 b1059648 c2411d00 c109da80 c258ff14 b105ab17 c2411=
d00 c258ff34
[    5.088491]  b1057e86 b158e5c0 00000001 00000086 c2411d00 b010a480 c2411=
d00 c258ff50
[    5.089237] Call Trace:
[    5.089466]  [<b105b42a>] ? dequeue_task_fair+0xc4/0x11c
[    5.089921]  [<b1059648>] attach_task_cfs_rq+0x2d/0x54
[    5.090372]  [<b105ab17>] task_move_group_fair+0x4a/0x4d
[    5.090817]  [<b1057e86>] sched_move_task+0x87/0xdb
[    5.091235]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.091693]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.092217]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.092609]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.093047]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.093486] Code: 60 51 b9 7e ba 00 00 e8 7b f9 ff ff 8b 55 ec b9 7e ba =
00 00 89 42 70 8b 42 68 31 d2 f7 f1 8b 55 ec 89 42 74 58 8b 45 e0 8b 7d ec =
<8b> 50 48 8b 40 44 89 57 5c 8b 55 e0 89 47 58 8b 47 70 01 42 5c
[    5.095878] EIP: [<b10595dd>] attach_entity_load_avg+0x1ae/0x1ec SS:ESP =
0068:c258fed8
[    5.096568] CR2: 000000004d002dc8
[    5.096850] ---[ end trace c58565194e8c336c ]---
[    5.097242] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-129:20151227020253:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    4.925629] init: Temporary process spawn error: No space left on device
[    4.954334] initctl (155) used greatest stack depth: 6732 bytes left
[    4.958504] stop (161) used greatest stack depth: 6708 bytes left
[    4.965526] BUG: spinlock bad magic on CPU#0, upstart-udev-br/172
[    4.966064]  lock: 0xbcdaa630, .magic: ffffffff, .owner: upstart-udev-br=
/172, .owner_cpu: 0
[    4.966763] CPU: 0 PID: 172 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    4.967423]  00000000 00000000 c24f3e0c b114a4ae b01059f4
[    4.967939] mountall (123) used greatest stack depth: 6668 bytes left

[    4.968500]  c24f3e34 b1065aac b14459cd
[    4.968502]  bcdaa630 ffffffff b01059f4 000000ac 00000000 bcdaa630 75f8f=
000 c24f3e44
[    4.968504]  b1065ad3 b1445a2f bcdaa630 c24f3e50 b1065c5d 00000000 c24f3=
e58 b12f2cf0
[    4.968508] Call Trace:
[    4.968512]  [<b114a4ae>] dump_stack+0x48/0x69
[    4.968514]  [<b1065aac>] spin_dump+0x6f/0x79
[    4.968515]  [<b1065ad3>] spin_bug+0x1d/0x21
[    4.968517]  [<b1065c5d>] do_raw_spin_unlock+0x19/0x71
[    4.968519]  [<b12f2cf0>] _raw_spin_unlock+0x8/0x1a
[    4.968523]  [<b10b6f6f>] copy_page_range+0x207/0x3da
[    4.968525]  [<b10b3700>] ? __anon_vma_interval_tree_augment_propagate+0=
x28/0x28
[    4.968528]  [<b103c583>] copy_process+0xbb1/0x1198
[    4.968530]  [<b103cc78>] _do_fork+0x5b/0x198
[    4.968532]  [<b103ce21>] SyS_clone+0x19/0x1b
[    4.968534]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    4.968535]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    4.968543] BUG: unable to handle kernel paging request at ffffffff
[    4.968546] IP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9
[    4.968549] *pde =3D 0157e063 *pte =3D 00000000 =

[    4.968551] Oops: 0000 [#1] PREEMPT SMP =

[    4.968552] Modules linked in:
[    4.968553] CPU: 0 PID: 172 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    4.968554] task: b0105700 ti: c24f2000 task.ti: c24f2000
[    4.968555] EIP: 0060:[<b10c5df7>] EFLAGS: 00010246 CPU: 0
[    4.968556] EIP is at kmem_cache_alloc+0x64/0xe9
[    4.968557] EAX: ffffffff EBX: b0098d00 ECX: 00023020 EDX: b1579768
[    4.968558] ESI: ffffffff EDI: b10b6ca9 EBP: c24f3e24 ESP: c24f3e08
[    4.968559]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    4.968559] CR0: 80050033 CR2: ffffffff CR3: 125a1000 CR4: 000006d0
[    4.968562] Stack:
[    4.968565]  b10b6ca9 b151e840 00023020 024000c0 c1389cc8 c2587400 c25a3=
a74 c24f3e30
[    4.968567]  b10b6ca9 c1389cc8 c24f3e3c b1032f75 c2587400 c24f3e54 b10b6=
cde c2587400
[    4.968569]  c2587400 a756f000 c24f3eac c24f3eb8 b10b6fd6 a756f000 c24f4=
000 a7570fff
[    4.968569] Call Trace:
[    4.968571]  [<b10b6ca9>] ? ptlock_alloc+0x15/0x25
[    4.968573]  [<b10b6ca9>] ptlock_alloc+0x15/0x25
[    4.968574]  [<b1032f75>] pte_alloc_one+0x35/0x6b
[    4.968576]  [<b10b6cde>] __pte_alloc+0x13/0x9d
[    4.968577]  [<b10b6fd6>] copy_page_range+0x26e/0x3da
[    4.968579]  [<b10b3700>] ? __anon_vma_interval_tree_augment_propagate+0=
x28/0x28
[    4.968581]  [<b10b9670>] ? vma_gap_callbacks_rotate+0x14/0x1a
[    4.968582]  [<b103c583>] copy_process+0xbb1/0x1198
[    4.968584]  [<b103cc78>] _do_fork+0x5b/0x198
[    4.968586]  [<b103ce21>] SyS_clone+0x19/0x1b
[    4.968587]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    4.968589]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    4.968604] Code: 75 e8 8b 30 85 f6 75 17 8b 4d e4 8b 55 f0 89 d8 e8 78 =
ff ff ff 89 c6 8b 03 64 ff 40 14 eb 66 8b 43 14 01 f0 f6 03 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 d3 d8 ff ff 8b 13 31 c9 64 8b 3a 39 fe 75 20
[    4.968606] EIP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9 SS:ESP 0068:c24=
f3e08
[    4.968606] CR2: 00000000ffffffff
[    4.968607] ---[ end trace cb759ac7a9f8bace ]---
[    4.968608] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-132:20151227015653:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    5.226803] init: Temporary process spawn error: No space left on device
[    5.234301] mount (136) used greatest stack depth: 6748 bytes left
[    5.256687] initctl (159) used greatest stack depth: 6404 bytes left
[    5.274863] BUG: unable to handle kernel NULL pointer dereference at 000=
00001
[    5.275948] IP: [<b10c5f72>] __kmalloc+0x8e/0x121
[    5.276644] *pde =3D 00000000 =

[    5.277089] Oops: 0000 [#1] PREEMPT SMP =

[    5.277713] Modules linked in:
[    5.278167] CPU: 0 PID: 178 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    5.279195] task: bc3ee580 ti: c256c000 task.ti: c256c000
[    5.279953] EIP: 0060:[<b10c5f72>] EFLAGS: 00010246 CPU: 0
[    5.280742] EIP is at __kmalloc+0x8e/0x121
[    5.281325] EAX: 00000001 EBX: 00000001 ECX: 000546a0 EDX: b15796f0
[    5.282218] ESI: b0098e00 EDI: 024080c0 EBP: c256df1c ESP: c256defc
[    5.283093]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.283869] CR0: 8005003b CR2: 00000001 CR3: 12587000 CR4: 000006d0
[    5.284749] Stack:
[    5.285045]  b105a3e3 00000246 00000001 00000001 000546a0 c24a4300 b158e=
5c0 c24a4300
[    5.286311]  c256df24 b105a3e3 c256df40 b105d658 b158e5c0 b158e5c0 c24a4=
300 b158e5c0
[    5.287566]  bc3ee580 c256df50 b1057c85 b0191a80 bc3ee580 c256df64 b1062=
247 bd9618c0
[    5.288823] Call Trace:
[    5.289182]  [<b105a3e3>] ? kzalloc+0xd/0xf
[    5.289931]  [<b105a3e3>] kzalloc+0xd/0xf
[    5.290677]  [<b105d658>] alloc_fair_sched_group+0x33/0xc9
[    5.291455]  [<b1057c85>] sched_create_group+0x23/0x4a
[    5.292176]  [<b1062247>] sched_autogroup_create_attach+0x27/0xc7
[    5.293049]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.293681]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.294430]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.295134] Code: f0 75 e8 8b 18 85 db 75 16 8b 4d e0 89 fa 89 f0 e8 fd =
fd ff ff 89 c3 8b 06 64 ff 40 14 eb 75 8b 46 14 01 d8 f6 06 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 58 d7 ff ff 8b 16 89 45 e4 64 8b 0a 39 cb c7
[    5.299091] EIP: [<b10c5f72>] __kmalloc+0x8e/0x121 SS:ESP 0068:c256defc
[    5.300077] CR2: 0000000000000001
[    5.300591] ---[ end trace f302cf43d70041b1 ]---
[    5.301274] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-132:20151227020024:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    5.062285] init: Failed to create pty - disabling logging for job
[    5.062943] init: Temporary process spawn error: No space left on device
[    5.089743] initctl (158) used greatest stack depth: 6676 bytes left
[    5.100687] BUG: unable to handle kernel paging request at ffffffff
[    5.101269] IP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9
[    5.101746] *pde =3D 0157e063 *pte =3D 00000000 =

[    5.102286] Oops: 0000 [#1] PREEMPT SMP =

[    5.102760] Modules linked in:
[    5.103037] CPU: 1 PID: 1 Comm: init Not tainted 4.4.0-rc4-00029-gc7af9d=
5 #1
[    5.103140] mountall (123) used greatest stack depth: 6404 bytes left
[    5.104215] task: b0040000 ti: b0016000 task.ti: b0016000
[    5.104699] EIP: 0060:[<b10c5df7>] EFLAGS: 00010246 CPU: 1
[    5.105463] EIP is at kmem_cache_alloc+0x64/0xe9
[    5.106106] EAX: ffffffff EBX: b0098d00 ECX: 0000fa81 EDX: b1579768
[    5.106979] ESI: ffffffff EDI: b10b6ca9 EBP: b0017e24 ESP: b0017e08
[    5.107506]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.107961] CR0: 80050033 CR2: ffffffff CR3: 12472000 CR4: 000006d0
[    5.108465] Stack:
[    5.108655]  b10b6ca9 b151e840 0000fa81 024000c0 c1388530 c248ba00 c257e=
a74 b0017e30
[    5.109387]  b10b6ca9 c1388530 b0017e3c b1032f75 c248ba00 b0017e54 b10b6=
cde c248ba00
[    5.110633]  c248ba00 a756d000 b0017eac b0017eb8 b10b6fd6 a756d000 b0018=
000 a756dfff
[    5.111771] Call Trace:
[    5.111977]  [<b10b6ca9>] ? ptlock_alloc+0x15/0x25
[    5.112366]  [<b10b6ca9>] ptlock_alloc+0x15/0x25
[    5.112796]  [<b1032f75>] pte_alloc_one+0x35/0x6b
[    5.113177]  [<b10b6cde>] __pte_alloc+0x13/0x9d
[    5.113549]  [<b10b6fd6>] copy_page_range+0x26e/0x3da
[    5.113976]  [<b10b3700>] ? __anon_vma_interval_tree_augment_propagate+0=
x28/0x28
[    5.114591]  [<b103c583>] copy_process+0xbb1/0x1198
[    5.115042]  [<b103cc78>] _do_fork+0x5b/0x198
[    5.115403]  [<b1152773>] ? _copy_to_user+0x3f/0x48
[    5.115827]  [<b1043e8b>] ? copy_to_user+0x28/0x2d
[    5.116213]  [<b103ce21>] SyS_clone+0x19/0x1b
[    5.116587]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.117004]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.117474] Code: 75 e8 8b 30 85 f6 75 17 8b 4d e4 8b 55 f0 89 d8 e8 78 =
ff ff ff 89 c6 8b 03 64 ff 40 14 eb 66 8b 43 14 01 f0 f6 03 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 d3 d8 ff ff 8b 13 31 c9 64 8b 3a 39 fe 75 20
[    5.119818] EIP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9 SS:ESP 0068:b00=
17e08
[    5.120406] CR2: 00000000ffffffff
[    5.120699] ---[ end trace 33ef4ca3f7da77d2 ]---
[    5.121075] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-135:20151227015531:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    4.918472] init: Failed to create pty - disabling logging for job
[    4.919069] init: Temporary process spawn error: No space left on device
[    4.940339] chgrp (153) used greatest stack depth: 6748 bytes left
[    4.955809] BUG: unable to handle kernel paging request at 00005403
[    4.956388] IP: [<b10c5f72>] __kmalloc+0x8e/0x121
[    4.956811] *pde =3D 00000000 =

[    4.957071] Oops: 0000 [#1] PREEMPT SMP =

[    4.957440] Modules linked in:
[    4.957724] CPU: 0 PID: 175 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    4.958335] task: c2410740 ti: c25c4000 task.ti: c25c4000
[    4.958800] EIP: 0060:[<b10c5f72>] EFLAGS: 00010246 CPU: 0
[    4.959270] EIP is at __kmalloc+0x8e/0x121
[    4.959629] EAX: 00005403 EBX: 00005403 ECX: 00055040 EDX: b15796f0
[    4.960160] ESI: b0098e00 EDI: 024080c0 EBP: c25c5f1c ESP: c25c5efc
[    4.960698]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    4.961159] CR0: 8005003b CR2: 00005403 CR3: 125b6000 CR4: 000006d0
[    4.961699] Stack:
[    4.961878]  b105a3e3 00000246 00005403 00000001 00055040 c247be40 b158e=
5c0 c247be40
[    4.962623]  c25c5f24 b105a3e3 c25c5f40 b105d658 b158e5c0 b158e5c0 c247b=
e40 b158e5c0
[    4.963362]  c2410740 c25c5f50 b1057c85 b0191c80 c2410740 c25c5f64 b1062=
247 b0191b40
[    4.964104] Call Trace:
[    4.964321]  [<b105a3e3>] ? kzalloc+0xd/0xf
[    4.964779]  [<b105a3e3>] kzalloc+0xd/0xf
[    4.965216]  [<b105d658>] alloc_fair_sched_group+0x33/0xc9
[    4.965687]  [<b1057c85>] sched_create_group+0x23/0x4a
[    4.966123]  [<b1062247>] sched_autogroup_create_attach+0x27/0xc7
[    4.966641]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    4.967022]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    4.967464]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    4.967892] Code: f0 75 e8 8b 18 85 db 75 16 8b 4d e0 89 fa 89 f0 e8 fd =
fd ff ff 89 c3 8b 06 64 ff 40 14 eb 75 8b 46 14 01 d8 f6 06 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 58 d7 ff ff 8b 16 89 45 e4 64 8b 0a 39 cb c7
[    4.970173] EIP: [<b10c5f72>] __kmalloc+0x8e/0x121 SS:ESP 0068:c25c5efc
[    4.970762] CR2: 0000000000005403
[    4.971093] ---[ end trace 3934efaa57d44051 ]---
[    4.971584] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-135:20151227015703:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    5.308205] chmod (128) used greatest stack depth: 6668 bytes left
[    5.319852] init: Failed to create pty - disabling logging for job
[    5.320851] init: Temporary process spawn error: No space left on device
[    5.366130] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    5.367309] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    5.368123] *pde =3D 00000000 =

[    5.368603] Oops: 0000 [#1] PREEMPT SMP =

[    5.369273] Modules linked in:
[    5.369769] CPU: 0 PID: 174 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    5.371011] task: bc396580 ti: c25c6000 task.ti: c25c6000
[    5.371835] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 0
[    5.372675] EIP is at set_next_entity+0x3e/0x64
[    5.373373] EAX: 00000000 EBX: bc3965c4 ECX: 00000000 EDX: bc3965c4
[    5.374329] ESI: c24b7e00 EDI: bc396580 EBP: c25c7f08 ESP: c25c7efc
[    5.375280]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.376095] CR0: 8005003b CR2: 000004ec CR3: 124e8000 CR4: 000006d0
[    5.377056] Stack:
[    5.377384]  bc3965c4 c108da80 bc396580 c25c7f14 b105b35e bc396580 c25c7=
f34 b1057eb2
[    5.378731]  b158e5c0 00000001 00000086 bc396580 bc581040 bc396580 c25c7=
f50 b1062211
[    5.380078]  bc3c2500 00000282 bd960ec0 bc396580 c246ba80 c25c7f64 b1062=
2d8 b0191c00
[    5.381438] Call Trace:
[    5.381824]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    5.382487]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    5.383138]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.383893]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.384724]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.385114]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.385571]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.386009] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    5.388436] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c25c=
7efc
[    5.389060] CR2: 00000000000004ec
[    5.389361] ---[ end trace 959a64ffac110e22 ]---
[    5.389744] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-13:20151227020027:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    4.956885] mountall (122) used greatest stack depth: 6512 bytes left
[    4.977881] init: Failed to create pty - disabling logging for job
[    4.978821] init: Temporary process spawn error: No space left on device
[    5.029181] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    5.030172] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    5.030859] *pde =3D 00000000 =

[    5.031254] Oops: 0000 [#1] PREEMPT SMP =

[    5.031823] Modules linked in:
[    5.032242] CPU: 1 PID: 176 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    5.033164] task: c2410000 ti: c259c000 task.ti: c259c000
[    5.033860] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 1
[    5.034564] EIP is at set_next_entity+0x3e/0x64
[    5.035146] EAX: 00000000 EBX: c2410044 ECX: 00000000 EDX: c2410044
[    5.035947] ESI: c2468a80 EDI: c2410000 EBP: c259df08 ESP: c259defc
[    5.036754]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.037441] CR0: 8005003b CR2: 000004ec CR3: 1256f000 CR4: 000006d0
[    5.038250] Stack:
[    5.038524]  c2410044 c109da80 c2410000 c259df14 b105b35e c2410000 c259d=
f34 b1057eb2
[    5.039655]  b158e5c0 00000001 00000086 c2410000 b010a200 c2410000 c259d=
f50 b1062211
[    5.040779]  c2422780 00000282 b010acc0 c2410000 b010fe40 c259df64 b1062=
2d8 b0191b40
[    5.041907] Call Trace:
[    5.042230]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    5.042893]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    5.043521]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.044200]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.044979]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.045559]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.046216]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.046869] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    5.050430] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c259=
defc
[    5.051363] CR2: 00000000000004ec
[    5.051799] ---[ end trace 6b35dcd18cecf2f9 ]---
[    5.052390] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-140:20151227020005:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    5.056925] init: Failed to create pty - disabling logging for job
[    5.057827] init: Temporary process spawn error: No space left on device
[    5.096037] stop (162) used greatest stack depth: 6388 bytes left
[    5.105785] BUG: unable to handle kernel NULL pointer dereference at 000=
00054
[    5.107697] IP: [<b105cc60>] pick_next_task_fair+0x5d/0x2ff
[    5.107702] *pde =3D 00000000 =

[    5.107704] Oops: 0000 [#1] PREEMPT SMP =

[    5.107705] Modules linked in:
[    5.107708] CPU: 0 PID: 175 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    5.107709] task: c2413a00 ti: c24ec000 task.ti: c24ec000
[    5.107710] EIP: 0060:[<b105cc60>] EFLAGS: 00010046 CPU: 0
[    5.107711] EIP is at pick_next_task_fair+0x5d/0x2ff
[    5.107712] EAX: 00000000 EBX: 00000000 ECX: 00000000 EDX: 00000000
[    5.107713] ESI: c108da80 EDI: c108da80 EBP: c24eda80 ESP: c24eda4c
[    5.107714]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.107715] CR0: 80050033 CR2: 00000054 CR3: 12595000 CR4: 000006d0
[    5.107718] Stack:
[    5.107719]  b1578a80 c24eda70 b105b47d c2413a00 00000001 00000001 c108d=
a80 b013b900
[    5.107722]  c108da80 c24eda88 c2413a00 c108da80 c108da80 c24eda94 b1052=
b08 00000000
[    5.107726]  c2413ca4 c108da80 c24edab0 b12eff94 00000000 c2413a00 c24ee=
000 00000000
[    5.107727] Call Trace:
[    5.107729]  [<b105b47d>] ? dequeue_task_fair+0x117/0x11c
[    5.107732]  [<b1052b08>] pick_next_task+0x23/0x5c
[    5.107735]  [<b12eff94>] __schedule+0x122/0x359
[    5.107736]  [<b12f01ec>] schedule+0x21/0x35
[    5.107738]  [<b12f291e>] schedule_hrtimeout_range_clock+0x38/0xbb
[    5.107740]  [<b1061320>] ? add_wait_queue+0x2b/0x30
[    5.107742]  [<b10db9ad>] ? __pollwait+0x9d/0xa3
[    5.107744]  [<b10db910>] ? ktime_get_ts+0x22/0x22
[    5.107745]  [<b12f29ab>] schedule_hrtimeout_range+0xa/0xc
[    5.107747]  [<b10db9eb>] poll_schedule_timeout+0x38/0x5f
[    5.107748]  [<b10dc37e>] do_select+0x5a5/0x5e4
[    5.107751]  [<b10dbafd>] ? set_restore_sigmask+0x2a/0x2a
[    5.107752]  [<b10dbafd>] ? set_restore_sigmask+0x2a/0x2a
[    5.107754]  [<b10dbafd>] ? set_restore_sigmask+0x2a/0x2a
[    5.107757]  [<b12eb4e5>] ? unix_stream_recvmsg+0x37/0x3f
[    5.107758]  [<b12e9356>] ? unix_state_double_unlock+0x29/0x29
[    5.107761]  [<b12bf39f>] ? sock_recvmsg_nosec+0x12/0x12
[    5.107762]  [<b12bf39a>] ? sock_recvmsg_nosec+0xd/0x12
[    5.107763]  [<b12bf3aa>] ? sock_recvmsg+0xb/0xd
[    5.107765]  [<b12c10c2>] ? ___sys_recvmsg+0x97/0x102
[    5.107766]  [<b12c1123>] ? ___sys_recvmsg+0xf8/0x102
[    5.107767]  [<b12bf39f>] ? sock_recvmsg_nosec+0x12/0x12
[    5.107768]  [<b12bf7e5>] ? sock_sendmsg_nosec+0xd/0x19
[    5.107770]  [<b12c0d76>] ? SYSC_sendto+0xe3/0xf1
[    5.107772]  [<b12f2d4a>] ? _raw_spin_unlock_irqrestore+0x12/0x25
[    5.107774]  [<b11664fa>] ? debug_check_no_obj_freed+0xe4/0x126
[    5.107776]  [<b10e1c4e>] ? __fget_light+0x21/0x41
[    5.107777]  [<b10e1c7b>] ? __fdget+0xd/0xf
[    5.107778]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[    5.107780]  [<b1052f5f>] ? __might_sleep+0x6b/0x72
[    5.107782]  [<b1152645>] ? _copy_from_user+0x3f/0x52
[    5.107783]  [<b10dba56>] ? copy_from_user+0x28/0x2d
[    5.107785]  [<b10dc4f8>] core_sys_select+0x13b/0x1be
[    5.107787]  [<b1079f70>] ? current_kernel_time64+0x40/0x67
[    5.107789]  [<b1074c21>] ? current_fs_time+0x22/0x28
[    5.107790]  [<b12f1c67>] ? __mutex_lock_slowpath+0x25b/0x2b7
[    5.107792]  [<b12f1dcb>] ? __mutex_unlock_slowpath+0xde/0xf5
[    5.107793]  [<b12f1dea>] ? mutex_unlock+0x8/0xa
[    5.107794]  [<b10d514a>] ? pipe_read+0x196/0x1eb
[    5.107795]  [<b1065cb2>] ? do_raw_spin_unlock+0x6e/0x71
[    5.107797]  [<b12f2cf0>] ? _raw_spin_unlock+0x8/0x1a
[    5.107798]  [<b10b8575>] ? handle_mm_fault+0xd39/0xeac
[    5.107799]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[    5.107801]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    5.107802]  [<b10dc5e6>] SYSC_select+0x6b/0x8b
[    5.107804]  [<b102fe88>] ? __do_page_fault+0x2b4/0x357
[    5.107805]  [<b10dc61d>] SyS_select+0x17/0x19
[    5.107807]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.107809]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.107830] Code: 0f 85 a1 00 00 00 8b 45 e8 8b 58 30 85 db 74 0f 83 7b =
1c 00 74 07 e8 50 ca ff ff eb 02 31 db 8b 45 e8 89 da e8 71 ee ff ff 89 c3 =
<8b> 40 54 85 c0 89 45 e8 75 d1 89 d8 e8 fe c9 ff ff 89 45 e8 8b
[    5.107834] EIP: [<b105cc60>] pick_next_task_fair+0x5d/0x2ff SS:ESP 0068=
:c24eda4c
[    5.107834] CR2: 0000000000000054
[    5.107836] ---[ end trace 1efa81dab3701a0e ]---
[    5.107836] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-141:20151227015556:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    4.972199] plymouthd (109) used greatest stack depth: 6748 bytes left
[    4.996021] init: Failed to create pty - disabling logging for job
[    4.996629] init: Temporary process spawn error: No space left on device
[    5.043969] BUG: unable to handle kernel paging request at 00005403
[    5.044527] IP: [<b10c5f72>] __kmalloc+0x8e/0x121
[    5.044954] *pde =3D 00000000 =

[    5.045211] Oops: 0000 [#1] PREEMPT SMP =

[    5.045558] Modules linked in:
[    5.045837] CPU: 0 PID: 179 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    5.046412] task: bc395e40 ti: c255a000 task.ti: c255a000
[    5.046864] EIP: 0060:[<b10c5f72>] EFLAGS: 00010246 CPU: 0
[    5.047309] EIP is at __kmalloc+0x8e/0x121
[    5.047653] EAX: 00005403 EBX: 00005403 ECX: 00052ce0 EDX: b15796f0
[    5.048156] ESI: b0098e00 EDI: 024080c0 EBP: c255bf1c ESP: c255befc
[    5.048673]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.049112] CR0: 8005003b CR2: 00005403 CR3: 125cf000 CR4: 000006d0
[    5.049628] Stack:
[    5.049797]  b105a3e3 00000246 c255bf10 c255bf10 00052ce0 c2495840 b158e=
5c0 c2495840
[    5.050503]  c255bf24 b105a3e3 c255bf40 b105d640 b158e5c0 b158e5c0 c2495=
840 b158e5c0
[    5.051225]  bc395e40 c255bf50 b1057c85 bd5d3000 bc395e40 c255bf64 b1062=
247 bd961580
[    5.051937] Call Trace:
[    5.052145]  [<b105a3e3>] ? kzalloc+0xd/0xf
[    5.052567]  [<b105a3e3>] kzalloc+0xd/0xf
[    5.052999]  [<b105d640>] alloc_fair_sched_group+0x1b/0xc9
[    5.053442]  [<b1057c85>] sched_create_group+0x23/0x4a
[    5.053873]  [<b1062247>] sched_autogroup_create_attach+0x27/0xc7
[    5.054367]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.054739]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.055156]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.055557] Code: f0 75 e8 8b 18 85 db 75 16 8b 4d e0 89 fa 89 f0 e8 fd =
fd ff ff 89 c3 8b 06 64 ff 40 14 eb 75 8b 46 14 01 d8 f6 06 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 58 d7 ff ff 8b 16 89 45 e4 64 8b 0a 39 cb c7
[    5.057799] EIP: [<b10c5f72>] __kmalloc+0x8e/0x121 SS:ESP 0068:c255befc
[    5.058352] CR2: 0000000000005403
[    5.058825] ---[ end trace f4c169384342ace5 ]---
[    5.059216] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-142:20151227015840:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    4.900384] hwclock (111) used greatest stack depth: 6676 bytes left
[    4.925680] init: Failed to create pty - disabling logging for job
[    4.926469] init: Temporary process spawn error: No space left on device
[    4.971425] BUG: spinlock bad magic on CPU#0, run-parts/178
[    4.972266]  lock: 0xbed35440, .magic: ffffffff, .owner: <none>/-1, .own=
er_cpu: -1
[    4.973225] CPU: 0 PID: 178 Comm: run-parts Not tainted 4.4.0-rc4-00029-=
gc7af9d5 #1
[    4.974178]  00000000 00000000
[    4.974565] mountall (124) used greatest stack depth: 6400 bytes left

[    4.975222]  c25b9e94 b114a4ae b14657b3 c25b9ebc b1065aac b14459cd
[    4.976371]  bed35440 ffffffff b14657b3 ffffffff ffffffff bed35440 c24f5=
a20 c25b9ecc
[    4.977691]  b1065ad3 b1445a2f bed35440 c25b9ee8 b1065b3c c2489e00 00000=
03a 00000001
[    4.979053] Call Trace:
[    4.979426]  [<b114a4ae>] dump_stack+0x48/0x69
[    4.979428]  [<b1065aac>] spin_dump+0x6f/0x79
[    4.979430]  [<b1065ad3>] spin_bug+0x1d/0x21
[    4.979432]  [<b1065b3c>] do_raw_spin_lock+0x1e/0xf1
[    4.979436]  [<b12f2c57>] _raw_spin_lock+0xf/0x11
[    4.979438]  [<b10b8238>] handle_mm_fault+0x9fc/0xeac
[    4.979441]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[    4.979444]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[    4.979445]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    4.979448]  [<b102fd9e>] __do_page_fault+0x1ca/0x357
[    4.979450]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    4.979452]  [<b102ffe7>] do_page_fault+0x1a/0x1e
[    4.979453]  [<b102e216>] do_async_page_fault+0x22/0x46
[    4.979456]  [<b12f3df0>] error_code+0x30/0x40
[    4.979458]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    5.003419] init: plymouth-log main process (177) terminated with status=
 1
[    5.023650] power_supply test_ac: uevent
[    5.024159] power_supply test_ac: POWER_SUPPLY_NAME=3Dtest_ac

dmesg-quantal-ivb41-17:20151227015606:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    4.900084] init: Temporary process spawn error: No space left on device
[    4.913570] sh (137) used greatest stack depth: 6748 bytes left
[    4.926545] initctl (160) used greatest stack depth: 6732 bytes left
[    4.939198] BUG: unable to handle kernel =


dmesg-quantal-ivb41-17:20151227015728:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.306122] mount (136) used greatest stack depth: 6748 bytes left
[    5.329208] initctl (159) used greatest stack depth: 6732 bytes left
[    5.333210] stop (161) used greatest stack depth: 6664 bytes left
[    5.342114] BUG: unable to handle kernel paging request at ffffffff
[    5.342703] IP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9
[    5.343173] *pde =3D 0157e063 *pte =3D 00000000 =

[    5.343570] Oops: 0000 [#1] PREEMPT SMP =

[    5.343956] Modules linked in:
[    5.344247] CPU: 1 PID: 173 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    5.344993] task: c2415e40 ti: c2562000 task.ti: c2562000
[    5.345435] EIP: 0060:[<b10c5df7>] EFLAGS: 00010246 CPU: 1
[    5.345589] mountall (124) used greatest stack depth: 6404 bytes left
[    5.346540] EIP is at kmem_cache_alloc+0x64/0xe9
[    5.346944] EAX: ffffffff EBX: b0098d00 ECX: 0000a101 EDX: b1579768
[    5.347514] ESI: ffffffff EDI: b10b6ca9 EBP: c2563e24 ESP: c2563e08
[    5.348023]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.348455] CR0: 80050033 CR2: ffffffff CR3: 124f4000 CR4: 000006d0
[    5.349015] Stack:
[    5.349188]  b10b6ca9 b151e840 0000a101 024000c0 c138a0d8 c24d4000 c256b=
afc c2563e30
[    5.349950]  b10b6ca9 c138a0d8 c2563e3c b1032f75 c24d4000 c2563e54 b10b6=
cde c24d4000
[    5.350721]  c24d4000 afced000 c2563eac c2563eb8 b10b6fd6 afced000 c2564=
000 afd0efff
[    5.351434] Call Trace:
[    5.351661]  [<b10b6ca9>] ? ptlock_alloc+0x15/0x25
[    5.352082]  [<b10b6ca9>] ptlock_alloc+0x15/0x25
[    5.352489]  [<b1032f75>] pte_alloc_one+0x35/0x6b
[    5.352898]  [<b10b6cde>] __pte_alloc+0x13/0x9d
[    5.353287]  [<b10b6fd6>] copy_page_range+0x26e/0x3da
[    5.353725]  [<b10b3700>] ? __anon_vma_interval_tree_augment_propagate+0=
x28/0x28
[    5.354319]  [<b10b9670>] ? vma_gap_callbacks_rotate+0x14/0x1a
[    5.354836]  [<b103c583>] copy_process+0xbb1/0x1198
[    5.355253]  [<b103cc78>] _do_fork+0x5b/0x198
[    5.355624]  [<b103ce21>] SyS_clone+0x19/0x1b
[    5.356022]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.356459]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.356897] Code: 75 e8 8b 30 85 f6 75 17 8b 4d e4 8b 55 f0 89 d8 e8 78 =
ff ff ff 89 c6 8b 03 64 ff 40 14 eb 66 8b 43 14 01 f0 f6 03 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 d3 d8 ff ff 8b 13 31 c9 64 8b 3a 39 fe 75 20
[    5.359288] EIP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9 SS:ESP 0068:c25=
63e08
[    5.359932] CR2: 00000000ffffffff
[    5.360204] ---[ end trace 3e49c342a32906ca ]---
[    5.360579] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-18:20151227015959:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.187345] sh (129) used greatest stack depth: 6708 bytes left
[    5.193698] init: Failed to create pty - disabling logging for job
[    5.194623] init: Temporary process spawn error: No space left on device
[    5.262672] BUG: unable to handle kernel paging request at 6e69622f
[    5.263267] IP: [<b10c5f72>] __kmalloc+0x8e/0x121
[    5.263708] *pde =3D 00000000 =

[    5.263962] Oops: 0000 [#1] PREEMPT SMP =

[    5.264458] Modules linked in:
[    5.264937] CPU: 0 PID: 175 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    5.265819] task: bc396cc0 ti: c255a000 task.ti: c255a000
[    5.266356] EIP: 0060:[<b10c5f72>] EFLAGS: 00010246 CPU: 0
[    5.267158] EIP is at __kmalloc+0x8e/0x121
[    5.267595] EAX: 6e69622f EBX: 6e69622f ECX: 000435c0 EDX: b15796f0
[    5.268099] ESI: b0098e00 EDI: 024080c0 EBP: c255bf1c ESP: c255befc
[    5.268994]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.269736] CR0: 8005003b CR2: 6e69622f CR3: 12580000 CR4: 000006d0
[    5.270714] Stack:
[    5.270931]  b105a3e3 00000246 6e69622f 00000001 000435c0 c244ab40 b158e=
5c0 c244ab40
[    5.272164]  c255bf24 b105a3e3 c255bf40 b105d658 b158e5c0 b158e5c0 c244a=
b40 b158e5c0
[    5.273100]  bc396cc0 c255bf50 b1057c85 b0191e40 bc396cc0 c255bf64 b1062=
247 bd961b40
[    5.273845] Call Trace:
[    5.274055]  [<b105a3e3>] ? kzalloc+0xd/0xf
[    5.274752]  [<b105a3e3>] kzalloc+0xd/0xf
[    5.275447]  [<b105d658>] alloc_fair_sched_group+0x33/0xc9
[    5.275893]  [<b1057c85>] sched_create_group+0x23/0x4a
[    5.276378]  [<b1062247>] sched_autogroup_create_attach+0x27/0xc7
[    5.277276]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.277980]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.278740]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.279491] Code: f0 75 e8 8b 18 85 db 75 16 8b 4d e0 89 fa 89 f0 e8 fd =
fd ff ff 89 c3 8b 06 64 ff 40 14 eb 75 8b 46 14 01 d8 f6 06 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 58 d7 ff ff 8b 16 89 45 e4 64 8b 0a 39 cb c7
[    5.282805] EIP: [<b10c5f72>] __kmalloc+0x8e/0x121 SS:ESP 0068:c255befc
[    5.283369] CR2: 000000006e69622f
[    5.283833] ---[ end trace c233c06c90037bf0 ]---
[    5.284312] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-19:20151227015730:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.070946] init: Temporary process spawn error: No space left on device
[    5.103034] initctl (156) used greatest stack depth: 6712 bytes left
[    5.116113] ------------[ cut here ]------------
[    5.116533] kernel BUG at mm/slub.c:3627!
[    5.117088] invalid opcode: 0000 [#1] PREEMPT SMP =

[    5.117667] Modules linked in:
[    5.117941] CPU: 1 PID: 1 Comm: init Not tainted 4.4.0-rc4-00029-gc7af9d=
5 #1
[    5.118552] task: b0040000 ti: b0016000 task.ti: b0016000
[    5.119165] EIP: 0060:[<b10c6ace>] EFLAGS: 00010246 CPU: 1
[    5.119697] EIP is at kfree+0x3a/0xff
[    5.120120] EAX: c10e065c EBX: b14f5640 ECX: 00000000 EDX: c10e065c
[    5.120642] ESI: b14f5640 EDI: c10e0648 EBP: b0017ecc ESP: b0017eb0
[    5.121172]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.121652] CR0: 8005003b CR2: 75c12000 CR3: 12469000 CR4: 000006d0
[    5.122355] Stack:
[    5.122525]  00000282 b0017ec0 b12f2d4a b14f5694 b14f5640 c245b000 c245b=
018 b0017ed8
[    5.123417]  b11cb67b c245a400 b0017ee4 b11cb712 c245a400 b0017efc b11cb=
b96 c245a418
[    5.124184]  c245b000 c245a400 00000001 b0017f30 b11c73cc c245b214 c245b=
204 c245b174
[    5.125090] Call Trace:
[    5.125317]  [<b12f2d4a>] ? _raw_spin_unlock_irqrestore+0x12/0x25
[    5.125992]  [<b11cb67b>] tty_ldisc_put+0x3c/0x3f
[    5.126395]  [<b11cb712>] tty_ldisc_kill+0x16/0x29
[    5.126807]  [<b11cbb96>] tty_ldisc_release+0xcc/0xe5
[    5.127214]  [<b11c73cc>] tty_release+0x3a9/0x40b
[    5.127602]  [<b10d0837>] __fput+0xd0/0x142
[    5.128113]  [<b10d08cf>] ____fput+0x8/0xa
[    5.128469]  [<b104e960>] task_work_run+0x53/0x75
[    5.128885]  [<b1000d76>] prepare_exit_to_usermode+0x67/0x83
[    5.129496]  [<b1000dcf>] syscall_return_slowpath+0x3d/0x40
[    5.129950]  [<b1000ec1>] do_fast_syscall_32+0x9f/0xd6
[    5.130360]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.130796] Code: 89 c6 83 ec 10 e8 0d d2 ff ff 89 c7 e8 3e cc ff ff 85 =
c0 75 18 8b 07 f6 c4 40 0f 85 b8 00 00 00 8b 47 14 a8 01 0f 85 ad 00 00 00 =
<0f> 0b 8b 45 04 8b 5f 1c 31 c9 89 f2 89 45 e8 89 d8 e8 68 d2 ff
[    5.133304] EIP: [<b10c6ace>] kfree+0x3a/0xff SS:ESP 0068:b0017eb0
[    5.134044] ---[ end trace 4bb645639bc33dbe ]---
[    5.134829] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-21:20151227015628:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.009326] init: Temporary process spawn error: No space left on device
[    5.017252] mount (136) used greatest stack depth: 6748 bytes left
[    5.055984] initctl (158) used greatest stack depth: 6388 bytes left
[    5.070635] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    5.071565] IP: [<b10596b4>] update_curr+0x14/0xbc
[    5.072157] *pde =3D 00000000 =

[    5.072531] Oops: 0000 [#1] PREEMPT SMP =

[    5.073051] Modules linked in:
[    5.073446] CPU: 1 PID: 171 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    5.074413] task: bc3ede40 ti: c255e000 task.ti: c255e000
[    5.075055] EIP: 0060:[<b10596b4>] EFLAGS: 00010082 CPU: 1
[    5.075713] EIP is at update_curr+0x14/0xbc
[    5.076218] EAX: 00000000 EBX: bc3fc648 ECX: 00000000 EDX: 00000000
[    5.076957] ESI: bc3fc610 EDI: 00000001 EBP: c255fe90 ESP: c255fe70
[    5.077701]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.078345] CR0: 80050033 CR2: 000004ec CR3: 12575000 CR4: 000006d0
[    5.079082] Stack:
[    5.079336]  00000001 c108da80 c108da80 00000001 c255fe8c bc3eed04 b12fc=
6c0 00000001
[    5.080379]  c255fef0 b105b520 c255fea4 b10075c8 00000001 00000000 c108d=
a80 00000001
[    5.081426]  c255fedc b10587b5 bc3eee18 00000000 00000250 bc3eed04 c24a1=
540 c255fef8
[    5.082474] Call Trace:
[    5.082776]  [<b105b520>] enqueue_task_fair+0x4a/0x432
[    5.083394]  [<b10075c8>] ? paravirt_sched_clock+0x9/0xd
[    5.084025]  [<b10587b5>] ? sched_clock_cpu+0x19/0xf6
[    5.084630]  [<b1053dfe>] ? update_rq_clock+0x1c/0x4d
[    5.085233]  [<b1053e52>] enqueue_task+0x23/0x29
[    5.085779]  [<b1054178>] activate_task+0x23/0x26
[    5.086341]  [<b1055370>] wake_up_new_task+0x4c/0x85
[    5.086930]  [<b103ccf8>] _do_fork+0xdb/0x198
[    5.087455]  [<b103ce21>] SyS_clone+0x19/0x1b
[    5.087972]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.088586]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.089182] Code: b8 cb 4a 44 b1 e8 a2 3d fe ff c6 05 d1 fb 51 b1 01 8d =
43 bc 5b 5d c3 55 89 e5 57 56 53 89 c6 83 ec 14 8b 58 30 8b 80 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 85 db 89 45 ec 89 55 f0 0f
[    5.092480] EIP: [<b10596b4>] update_curr+0x14/0xbc SS:ESP 0068:c255fe70
[    5.093308] CR2: 00000000000004ec
[    5.093707] ---[ end trace e06e3386aa2bdc25 ]---
[    5.094258] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-21:20151227015956:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.246187] init: Failed to create pty - disabling logging for job
[    5.247064] init: Temporary process spawn error: No space left on device
[    5.284893] stop (161) used greatest stack depth: 6616 bytes left
[    5.293351] BUG: unable to handle kernel paging request at 6e69622f
[    5.294193] IP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9
[    5.294882] *pde =3D 00000000 =

[    5.295265] Oops: 0000 [#1] PREEMPT SMP =

[    5.295802] Modules linked in:
[    5.296203] CPU: 1 PID: 1 Comm: init Not tainted 4.4.0-rc4-00029-gc7af9d=
5 #1
[    5.297068] task: b0040000 ti: b0016000 task.ti: b0016000
[    5.297734] EIP: 0060:[<b10c5df7>] EFLAGS: 00010246 CPU: 1
[    5.298432] EIP is at kmem_cache_alloc+0x64/0xe9
[    5.299001] EAX: 6e69622f EBX: b0098e00 ECX: 00002261 EDX: b15796f0
[    5.299773] ESI: 6e69622f EDI: b11cb617 EBP: b0017d5c ESP: b0017d40
[    5.300541]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.301200] CR0: 80050033 CR2: 6e69622f CR3: 12460000 CR4: 000006d0
[    5.301972] Stack:
[    5.302231]  b11cb617 b0017d50 00002261 024000c0 c2467400 b14f5640 00000=
000 b0017d70
[    5.303322]  b11cb617 c2467400 bc3b7280 00000001 b0017d7c b11cbbbc c2467=
400 b0017d94
[    5.304407]  b11c75c6 00000001 c2467000 00000000 00000001 b0017dbc b11cd=
2a9 00000000
[    5.305493] Call Trace:
[    5.305820]  [<b11cb617>] ? tty_ldisc_get+0x4e/0x76
[    5.306444]  [<b11cb617>] tty_ldisc_get+0x4e/0x76
[    5.307041]  [<b11cbbbc>] tty_ldisc_init+0xd/0x26
[    5.307645]  [<b11c75c6>] alloc_tty_struct+0x36/0x1d2
[    5.308288]  [<b11cd2a9>] pty_common_install+0x6d/0x1d9
[    5.308948]  [<b11cd42e>] pty_unix98_install+0xa/0xc
[    5.309583]  [<b11c77a9>] tty_init_dev+0x47/0x123
[    5.310179]  [<b11cd569>] ptmx_open+0x69/0x11f
[    5.310751]  [<b10d23e4>] chrdev_open+0xf3/0x103
[    5.311341]  [<b10ce6b9>] do_dentry_open+0x15e/0x1e1
[    5.312046]  [<b10d22f1>] ? cdev_put+0xe/0xe
[    5.312593]  [<b10cf0a5>] vfs_open+0x3e/0x43
[    5.313134]  [<b10d8cb9>] path_openat+0x7f1/0xa19
[    5.313737]  [<b10d9d4b>] do_filp_open+0x2e/0x71
[    5.314325]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[    5.314953]  [<b1065cb2>] ? do_raw_spin_unlock+0x6e/0x71
[    5.315628]  [<b12f2cf0>] ? _raw_spin_unlock+0x8/0x1a
[    5.316255]  [<b10e24c5>] ? __alloc_fd+0x111/0x11b
[    5.316865]  [<b10cf1c0>] do_sys_open+0x54/0xcf
[    5.317449]  [<b1020000>] ? mce_notify_irq+0x4b/0x72
[    5.318074]  [<b10cf253>] SyS_open+0x18/0x1a
[    5.318623]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.319274]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.319895] Code: 75 e8 8b 30 85 f6 75 17 8b 4d e4 8b 55 f0 89 d8 e8 78 =
ff ff ff 89 c6 8b 03 64 ff 40 14 eb 66 8b 43 14 01 f0 f6 03 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 d3 d8 ff ff 8b 13 31 c9 64 8b 3a 39 fe 75 20
[    5.323307] EIP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9 SS:ESP 0068:b00=
17d40
[    5.324224] CR2: 000000006e69622f
[    5.324784] ---[ end trace dcd93263cffa90ff ]---
[    5.325384] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-23:20151227015559:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.167239] init: Failed to create pty - disabling logging for job
[    5.167836] init: Temporary process spawn error: No space left on device
[    5.191836] initctl (158) used greatest stack depth: 6388 bytes left
[    5.206320] BUG: unable to handle kernel NULL pointer dereference at 000=
00002
[    5.207016] IP: [<b10c5f72>] __kmalloc+0x8e/0x121
[    5.207448] *pde =3D 00000000 =

[    5.207707] Oops: 0000 [#1] PREEMPT SMP =

[    5.208081] Modules linked in:
[    5.208393] CPU: 1 PID: 175 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    5.208995] task: c2424880 ti: c259e000 task.ti: c259e000
[    5.209483] EIP: 0060:[<b10c5f72>] EFLAGS: 00010246 CPU: 1
[    5.209953] EIP is at __kmalloc+0x8e/0x121
[    5.210320] EAX: 00000002 EBX: 00000002 ECX: 00011521 EDX: b15796f0
[    5.210839] ESI: b0098e00 EDI: 024080c0 EBP: c259ff1c ESP: c259fefc
[    5.211394]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.211846] CR0: 8005003b CR2: 00000002 CR3: 12562000 CR4: 000006d0
[    5.212377] Stack:
[    5.212553]  b105a3e3 00000246 00000002 00000001 00011521 b0112180 b158e=
5c0 b0112180
[    5.213339]  c259ff24 b105a3e3 c259ff40 b105d658 b158e5c0 b158e5c0 b0112=
180 b158e5c0
[    5.214082]  c2424880 c259ff50 b1057c85 bd5d9780 c2424880 c259ff64 b1062=
247 bd961740
[    5.214859] Call Trace:
[    5.215079]  [<b105a3e3>] ? kzalloc+0xd/0xf
[    5.215523]  [<b105a3e3>] kzalloc+0xd/0xf
[    5.215958]  [<b105d658>] alloc_fair_sched_group+0x33/0xc9
[    5.216438]  [<b1057c85>] sched_create_group+0x23/0x4a
[    5.216868]  [<b1062247>] sched_autogroup_create_attach+0x27/0xc7
[    5.217401]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.217776]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.218214]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.218654] Code: f0 75 e8 8b 18 85 db 75 16 8b 4d e0 89 fa 89 f0 e8 fd =
fd ff ff 89 c3 8b 06 64 ff 40 14 eb 75 8b 46 14 01 d8 f6 06 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 58 d7 ff ff 8b 16 89 45 e4 64 8b 0a 39 cb c7
[    5.221054] EIP: [<b10c5f72>] __kmalloc+0x8e/0x121 SS:ESP 0068:c259fefc
[    5.221627] CR2: 0000000000000002
[    5.221973] ---[ end trace 9777df699c47e30b ]---
[    5.222396] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-23:20151227020146:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.097685] sh (119) used greatest stack depth: 6748 bytes left
[    5.121837] init: Failed to create pty - disabling logging for job
[    5.122569] init: Temporary process spawn error: No space left on device
[    5.162029] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    5.163128] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    5.163862] *pde =3D 00000000 =

[    5.164315] Oops: 0000 [#1] PREEMPT SMP =

[    5.164931] Modules linked in:
[    5.165398] CPU: 0 PID: 173 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    5.166545] task: bc3ec140 ti: c25d2000 task.ti: c25d2000
[    5.167324] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 0
[    5.168092] EIP is at set_next_entity+0x3e/0x64
[    5.168744] EAX: 00000000 EBX: bc3ec184 ECX: 00000000 EDX: bc3ec184
[    5.169618] ESI: c2498500 EDI: bc3ec140 EBP: c25d3f08 ESP: c25d3efc
[    5.170505]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.171256] CR0: 8005003b CR2: 000004ec CR3: 125a0000 CR4: 000006d0
[    5.172144] Stack:
[    5.172434]  bc3ec184 c108da80 bc3ec140 c25d3f14 b105b35e bc3ec140 c25d3=
f34 b1057eb2
[    5.173680]  b158e5c0 00000001 00000086 bc3ec140 c2579940 bc3ec140 c25d3=
f50 b1062211
[    5.174922]  bc3de780 00000282 bd961fc0 bc3ec140 c24b3b40 c25d3f64 b1062=
2d8 c2579a40
[    5.176180] Call Trace:
[    5.176535]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    5.177279]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    5.178050]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.178822]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.179675]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.180321]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.181044]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.181759] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    5.185691] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c25d=
3efc
[    5.186724] CR2: 00000000000004ec
[    5.187194] ---[ end trace ca0435ef1938721c ]---
[    5.187847] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-26:20151227020234:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.132157] init: Temporary process spawn error: No space left on device
[    5.155545] chgrp (150) used greatest stack depth: 6748 bytes left
[    5.159869] initctl (159) used greatest stack depth: 6676 bytes left
[    5.169796] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    5.170442] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    5.170893] *pde =3D 00000000 =

[    5.171149] Oops: 0000 [#1] PREEMPT SMP =

[    5.171556] Modules linked in:
[    5.171828] CPU: 1 PID: 171 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    5.172447] task: b0104880 ti: c25ae000 task.ti: c25ae000
[    5.172900] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 1
[    5.173352] EIP is at set_next_entity+0x3e/0x64
[    5.173733] EAX: 00000000 EBX: b01048c4 ECX: 00000000 EDX: b01048c4
[    5.174267] ESI: c24acd80 EDI: b0104880 EBP: c25aff08 ESP: c25afefc
[    5.174792]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.175234] CR0: 8005003b CR2: 000004ec CR3: 1256b000 CR4: 000006d0
[    5.175757] Stack:
[    5.175933]  b01048c4 c109da80 b0104880 c25aff14 b105b35e b0104880 c25af=
f34 b1057eb2
[    5.176667]  b158e5c0 00000001 00000086 b0104880 bd961980 b0104880 c25af=
f50 b1062211
[    5.177419]  bc3c3180 00000282 b010af40 b0104880 b010fa80 c25aff64 b1062=
2d8 b010ad00
[    5.178166] Call Trace:
[    5.178377]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    5.178808]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    5.179213]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.179659]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.180167]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.180572]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.181001]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.181441] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    5.183760] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c25a=
fefc
[    5.184366] CR2: 00000000000004ec
[    5.184651] ---[ end trace 6c35b3069ee34ea3 ]---
[    5.185035] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-28:20151227015939:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.198214] hwclock (111) used greatest stack depth: 6408 bytes left
[    5.228362] init: Failed to create pty - disabling logging for job
[    5.229274] init: Temporary process spawn error: No space left on device
[    5.289692] BUG: spinlock bad magic on CPU#0, sysctl/173
[    5.290490]  lock: 0xbcdaac10, .magic: ffffffff, .owner: <none>/-1, .own=
er_cpu: -1
[    5.291514] CPU: 0 PID: 173 Comm: sysctl Not tainted 4.4.0-rc4-00029-gc7=
af9d5 #1
[    5.292526]  00000000 00000000 c2587df4 b114a4ae b14657b3 c2587e1c b1065=
aac b14459cd
[    5.292532]  bcdaac10 ffffffff b14657b3 ffffffff ffffffff bcdaac10 08a72=
000 c2587e2c
[    5.292536]  b1065ad3 b1445a2f bcdaac10 c2587e48 b1065b3c c135de48 00000=
246 08a72000
[    5.292536] Call Trace:
[    5.292541]  [<b114a4ae>] dump_stack+0x48/0x69
[    5.292544]  [<b1065aac>] spin_dump+0x6f/0x79
[    5.292546]  [<b1065ad3>] spin_bug+0x1d/0x21
[    5.292547]  [<b1065b3c>] do_raw_spin_lock+0x1e/0xf1
[    5.292551]  [<b12f2c57>] _raw_spin_lock+0xf/0x11
[    5.292555]  [<b10b65da>] unmap_single_vma+0x197/0x38e
[    5.292557]  [<b10b697c>] unmap_vmas+0x27/0x36
[    5.292559]  [<b10bb102>] exit_mmap+0x45/0xaf
[    5.292563]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[    5.292565]  [<b1052f5f>] ? __might_sleep+0x6b/0x72
[    5.292568]  [<b10763b0>] ? hrtimer_try_to_cancel+0xe/0x75
[    5.292572]  [<b103b841>] mmput+0x45/0x81
[    5.292574]  [<b103f235>] do_exit+0x2bd/0x75b
[    5.292576]  [<b10d06d3>] ? fput+0xe/0x75
[    5.292580]  [<b10ce2d3>] ? filp_close+0x48/0x52
[    5.292581]  [<b103f72a>] do_group_exit+0x30/0x84
[    5.292583]  [<b103f78f>] SyS_exit_group+0x11/0x11
[    5.292585]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.292588]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.310140] mountall (124) used greatest stack depth: 6404 bytes left
[    5.315868] udevd[178]: starting version 175
[    5.342112] init: plymouth-log main process (177) terminated with status=
 1

dmesg-quantal-ivb41-31:20151227015721:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.007888] init: Temporary process spawn error: No space left on device
[    5.034951] initctl (159) used greatest stack depth: 6712 bytes left
[    5.039292] stop (161) used greatest stack depth: 6664 bytes left
[    5.056525] BUG: unable to handle kernel paging request at ffffffff
[    5.057276] IP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9
[    5.057750] *pde =3D 0157e063 *pte =3D 00000000 =

[    5.058162] Oops: 0000 [#1] PREEMPT SMP =

[    5.058548] Modules linked in:
[    5.058826] CPU: 0 PID: 1 Comm: init Not tainted 4.4.0-rc4-00029-gc7af9d=
5 #1
[    5.059426] task: b0040000 ti: b0016000 task.ti: b0016000
[    5.059880] EIP: 0060:[<b10c5df7>] EFLAGS: 00010246 CPU: 0
[    5.060405] EIP is at kmem_cache_alloc+0x64/0xe9
[    5.060786] EAX: ffffffff EBX: b0098d00 ECX: 00024c00 EDX: b1579768
[    5.061440] ESI: ffffffff EDI: b10b6ca9 EBP: b0017e24 ESP: b0017e08
[    5.061979]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.062437] CR0: 80050033 CR2: ffffffff CR3: 12469000 CR4: 000006d0
[    5.062962] Stack:
[    5.063186]  b10b6ca9 b151e840 00024c00 024000c0 c138a2b8 c24d1a00 c24e4=
760 b0017e30
[    5.063944]  b10b6ca9 c138a2b8 b0017e3c b1032f75 c24d1a00 b0017e54 b10b6=
cde c24d1a00
[    5.064756]  c24d1a00 761ed000 b0017eac b0017eb8 b10b6fd6 761ed000 b0018=
000 7622efff
[    5.065550] Call Trace:
[    5.065759]  [<b10b6ca9>] ? ptlock_alloc+0x15/0x25
[    5.066230]  [<b10b6ca9>] ptlock_alloc+0x15/0x25
[    5.066656]  [<b1032f75>] pte_alloc_one+0x35/0x6b
[    5.067079]  [<b10b6cde>] __pte_alloc+0x13/0x9d
[    5.067479]  [<b10b6fd6>] copy_page_range+0x26e/0x3da
[    5.067906]  [<b10b3700>] ? __anon_vma_interval_tree_augment_propagate+0=
x28/0x28
[    5.068536]  [<b10b3a80>] ? anon_vma_interval_tree_insert+0x73/0x79
[    5.069095]  [<b103c583>] copy_process+0xbb1/0x1198
[    5.069701]  [<b103cc78>] _do_fork+0x5b/0x198
[    5.070187]  [<b1152773>] ? _copy_to_user+0x3f/0x48
[    5.070630]  [<b1043e8b>] ? copy_to_user+0x28/0x2d
[    5.071053]  [<b103ce21>] SyS_clone+0x19/0x1b
[    5.071433]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.071862]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.072343] Code: 75 e8 8b 30 85 f6 75 17 8b 4d e4 8b 55 f0 89 d8 e8 78 =
ff ff ff 89 c6 8b 03 64 ff 40 14 eb 66 8b 43 14 01 f0 f6 03 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 d3 d8 ff ff 8b 13 31 c9 64 8b 3a 39 fe 75 20
[    5.074745] EIP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9 SS:ESP 0068:b00=
17e08
[    5.075490] CR2: 00000000ffffffff
[    5.075767] ---[ end trace f6ff2df81b9eb4fa ]---
[    5.076188] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-42:20151227015630:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.005636] init: Temporary process spawn error: No space left on device
[    5.012628] mount (136) used greatest stack depth: 6748 bytes left
[    5.070840] initctl (159) used greatest stack depth: 6708 bytes left
[    5.085269] BUG: unable to handle kernel paging request at ffffffff
[    5.086142] IP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9
[    5.086840] *pde =3D 0157e063 *pte =3D 00000000 =

[    5.087440] Oops: 0000 [#1] PREEMPT SMP =

[    5.088000] Modules linked in:
[    5.088428] CPU: 0 PID: 1 Comm: init Not tainted 4.4.0-rc4-00029-gc7af9d=
5 #1
[    5.089342] task: b0040000 ti: b0016000 task.ti: b0016000
[    5.090077] EIP: 0060:[<b10c5df7>] EFLAGS: 00010246 CPU: 0
[    5.090784] EIP is at kmem_cache_alloc+0x64/0xe9
[    5.091379] EAX: ffffffff EBX: b0098d00 ECX: 00024fe0 EDX: b1579768
[    5.092177] ESI: ffffffff EDI: b10b6ca9 EBP: b0017e24 ESP: b0017e08
[    5.092971]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.093664] CR0: 80050033 CR2: ffffffff CR3: 12462000 CR4: 000006d0
[    5.094466] Stack:
[    5.094734]  b10b6ca9 b151e840 00024fe0 024000c0 c1389d40 c24f4a00 c24bb=
af8 b0017e30
[    5.095861]  b10b6ca9 c1389d40 b0017e3c b1032f75 c24f4a00 b0017e54 b10b6=
cde c24f4a00
[    5.096993]  c24f4a00 afaf1000 b0017eac b0017eb8 b10b6fd6 afaf1000 b0018=
000 afb12fff
[    5.098121] Call Trace:
[    5.098451]  [<b10b6ca9>] ? ptlock_alloc+0x15/0x25
[    5.099063]  [<b10b6ca9>] ptlock_alloc+0x15/0x25
[    5.099663]  [<b1032f75>] pte_alloc_one+0x35/0x6b
[    5.100272]  [<b10b6cde>] __pte_alloc+0x13/0x9d
[    5.100854]  [<b10b6fd6>] copy_page_range+0x26e/0x3da
[    5.101506]  [<b10b3700>] ? __anon_vma_interval_tree_augment_propagate+0=
x28/0x28
[    5.102446]  [<b10b3a80>] ? anon_vma_interval_tree_insert+0x73/0x79
[    5.103250]  [<b103c583>] copy_process+0xbb1/0x1198
[    5.103879]  [<b103cc78>] _do_fork+0x5b/0x198
[    5.104448]  [<b1152773>] ? _copy_to_user+0x3f/0x48
[    5.105071]  [<b1043e8b>] ? copy_to_user+0x28/0x2d
[    5.105691]  [<b103ce21>] SyS_clone+0x19/0x1b
[    5.106259]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.106917]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.107571] Code: 75 e8 8b 30 85 f6 75 17 8b 4d e4 8b 55 f0 89 d8 e8 78 =
ff ff ff 89 c6 8b 03 64 ff 40 14 eb 66 8b 43 14 01 f0 f6 03 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 d3 d8 ff ff 8b 13 31 c9 64 8b 3a 39 fe 75 20
[    5.111126] EIP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9 SS:ESP 0068:b00=
17e08
[    5.112066] CR2: 00000000ffffffff
[    5.112499] ---[ end trace e78aee16a7d2d41d ]---
[    5.113086] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-42:20151227015728:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.182298] init: Failed to create pty - disabling logging for job
[    5.182998] init: Temporary process spawn error: No space left on device
[    5.219629] stop (162) used greatest stack depth: 6404 bytes left
[    5.232820] BUG: unable to handle kernel paging request at 00005403
[    5.233415] IP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9
[    5.233872] *pde =3D 00000000 =

[    5.234143] Oops: 0000 [#1] PREEMPT SMP =

[    5.234503] Modules linked in:
[    5.234774] CPU: 1 PID: 176 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    5.235388] task: c2455e40 ti: c2504000 task.ti: c2504000
[    5.235839] EIP: 0060:[<b10c5df7>] EFLAGS: 00010246 CPU: 1
[    5.236306] EIP is at kmem_cache_alloc+0x64/0xe9
[    5.236688] EAX: 00005403 EBX: b0098e00 ECX: 00013961 EDX: b15796f0
[    5.237228] ESI: 00005403 EDI: b11cb617 EBP: c2505d74 ESP: c2505d58
[    5.237744]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.238212] CR0: 8005003b CR2: 00005403 CR3: 125af000 CR4: 000006d0
[    5.238726] Stack:
[    5.238907]  b11cb617 c2505d68 00013961 024000c0 c2585000 b14f5640 00000=
000 c2505d88
[    5.239652]  b11cb617 c2585000 bc3d3700 00000000 c2505d94 b11cbbbc c2585=
000 c2505dac
[    5.240398]  b11c75c6 00000000 00000000 bc3d3700 00000000 c2505dc4 b11c7=
788 00000000
[    5.241145] Call Trace:
[    5.241354]  [<b11cb617>] ? tty_ldisc_get+0x4e/0x76
[    5.241761]  [<b11cb617>] tty_ldisc_get+0x4e/0x76
[    5.242174]  [<b11cbbbc>] tty_ldisc_init+0xd/0x26
[    5.242571]  [<b11c75c6>] alloc_tty_struct+0x36/0x1d2
[    5.243015]  [<b11c7788>] tty_init_dev+0x26/0x123
[    5.243409]  [<b11c7b95>] tty_open+0x310/0x329
[    5.243781]  [<b10d23e4>] chrdev_open+0xf3/0x103
[    5.244193]  [<b10ce6b9>] do_dentry_open+0x15e/0x1e1
[    5.244665]  [<b10d22f1>] ? cdev_put+0xe/0xe
[    5.245047]  [<b10cf0a5>] vfs_open+0x3e/0x43
[    5.245401]  [<b10d8cb9>] path_openat+0x7f1/0xa19
[    5.245791]  [<b10d9d4b>] do_filp_open+0x2e/0x71
[    5.246202]  [<b1065cb2>] ? do_raw_spin_unlock+0x6e/0x71
[    5.246645]  [<b12f2cf0>] ? _raw_spin_unlock+0x8/0x1a
[    5.247092]  [<b10e24c5>] ? __alloc_fd+0x111/0x11b
[    5.247493]  [<b10cf1c0>] do_sys_open+0x54/0xcf
[    5.247901]  [<b10cf253>] SyS_open+0x18/0x1a
[    5.248275]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.248701]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.249140] Code: 75 e8 8b 30 85 f6 75 17 8b 4d e4 8b 55 f0 89 d8 e8 78 =
ff ff ff 89 c6 8b 03 64 ff 40 14 eb 66 8b 43 14 01 f0 f6 03 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 d3 d8 ff ff 8b 13 31 c9 64 8b 3a 39 fe 75 20
[    5.251434] EIP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9 SS:ESP 0068:c25=
05d58
[    5.252072] CR2: 0000000000005403
[    5.252501] ---[ end trace d324cc9058c91ae5 ]---
[    5.252910] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-44:20151227015637:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.216363] init: Failed to create pty - disabling logging for job
[    5.217224] init: Temporary process spawn error: No space left on device
[    5.251532] chgrp (153) used greatest stack depth: 6408 bytes left
[    5.271032] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    5.271955] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    5.272606] *pde =3D 00000000 =

[    5.272976] Oops: 0000 [#1] PREEMPT SMP =

[    5.273545] Modules linked in:
[    5.273932] CPU: 1 PID: 174 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    5.274903] task: c2410000 ti: c259a000 task.ti: c259a000
[    5.275549] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 1
[    5.276197] EIP is at set_next_entity+0x3e/0x64
[    5.276740] EAX: 00000000 EBX: c2410044 ECX: 00000000 EDX: c2410044
[    5.277486] ESI: bc3b6100 EDI: c2410000 EBP: c259bf08 ESP: c259befc
[    5.278225]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.278869] CR0: 8005003b CR2: 000004ec CR3: 1259d000 CR4: 000006d0
[    5.279615] Stack:
[    5.279865]  c2410044 c109da80 c2410000 c259bf14 b105b35e c2410000 c259b=
f34 b1057eb2
[    5.280914]  b158e5c0 00000001 00000086 c2410000 b010a740 c2410000 c259b=
f50 b1062211
[    5.281962]  bc3dfb80 00000282 b010ab40 c2410000 b01129c0 c259bf64 b1062=
2d8 b0191a80
[    5.283008] Call Trace:
[    5.283308]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    5.283923]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    5.284508]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.285136]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.285859]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.286396]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.287004]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.287607] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    5.290898] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c259=
befc
[    5.291767] CR2: 00000000000004ec
[    5.292166] ---[ end trace 0e165ba51cef68a3 ]---
[    5.292722] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-48:20151227015844:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    4.900271] init: Temporary process spawn error: No space left on device
[    4.924120] initctl (159) used greatest stack depth: 6676 bytes left
[    4.936168] ------------[ cut here ]------------
[    4.936573] kernel BUG at mm/slub.c:3627!
[    4.937048] invalid opcode: 0000 [#1] PREEMPT SMP =

[    4.937470] Modules linked in:
[    4.937739] CPU: 0 PID: 1 Comm: init Not tainted 4.4.0-rc4-00029-gc7af9d=
5 #1
[    4.938306] task: b0040000 ti: b0016000 task.ti: b0016000
[    4.938746] EIP: 0060:[<b10c6ace>] EFLAGS: 00010246 CPU: 0
[    4.939191] EIP is at kfree+0x3a/0xff
[    4.939493] EAX: c10e065c EBX: b14f5640 ECX: 00000000 EDX: c10e065c
[    4.940003] ESI: b14f5640 EDI: c10e0648 EBP: b0017ecc ESP: b0017eb0
[    4.940509]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    4.940950] CR0: 8005003b CR2: 75e30000 CR3: 00112000 CR4: 000006d0
[    4.941460] Stack:
[    4.941635]  00000282 b0017ec0 b12f2d4a b14f5694 b14f5640 c2463c00 c2463=
c18 b0017ed8
[    4.942355]  b11cb67b c2463000 b0017ee4 b11cb712 c2463000 b0017efc b11cb=
b96 c2463018
[    4.943078]  c2463c00 c2463000 00000001 b0017f30 b11c73cc c2463e14 c2463=
e04 c2463d74
[    4.943800] Call Trace:
[    4.944008]  [<b12f2d4a>] ? _raw_spin_unlock_irqrestore+0x12/0x25
[    4.944502]  [<b11cb67b>] tty_ldisc_put+0x3c/0x3f
[    4.944891]  [<b11cb712>] tty_ldisc_kill+0x16/0x29
[    4.945281]  [<b11cbb96>] tty_ldisc_release+0xcc/0xe5
[    4.945699]  [<b11c73cc>] tty_release+0x3a9/0x40b
[    4.946084]  [<b10d0837>] __fput+0xd0/0x142
[    4.946427]  [<b10d08cf>] ____fput+0x8/0xa
[    4.946769]  [<b104e960>] task_work_run+0x53/0x75
[    4.947152]  [<b1000d76>] prepare_exit_to_usermode+0x67/0x83
[    4.947615]  [<b1000dcf>] syscall_return_slowpath+0x3d/0x40
[    4.948071]  [<b1000ec1>] do_fast_syscall_32+0x9f/0xd6
[    4.948489]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    4.948905] Code: 89 c6 83 ec 10 e8 0d d2 ff ff 89 c7 e8 3e cc ff ff 85 =
c0 75 18 8b 07 f6 c4 40 0f 85 b8 00 00 00 8b 47 14 a8 01 0f 85 ad 00 00 00 =
<0f> 0b 8b 45 04 8b 5f 1c 31 c9 89 f2 89 45 e8 89 d8 e8 68 d2 ff
[    4.951194] EIP: [<b10c6ace>] kfree+0x3a/0xff SS:ESP 0068:b0017eb0
[    4.951791] ---[ end trace a813655cccbf08cf ]---
[    4.952174] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-48:20151227020033:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

udevd[283]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:LNX=
CPU:': No such file or directory
udevd[281]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv input:b0=
011v0001p0001eAB41-e0,1,4,11,14,k71,72,73,74,75,76,77,79,7A,7B,7C,7D,7E,7F,=
80,8C,8E,8F,9B,9C,9D,9E,9F,A3,A4,A5,A6,AC,AD,B7,B8,B9,D9,E2,ram4,l0,1,2,sfw=
': No such file or directory
udevd[310]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:PNP=
0501:': No such file or directory
[    5.233521] BUG: spinlock bad magic on CPU#0, udevd/309
[    5.233974]  lock: 0xbee37ed0, .magic: ffffffff, .owner: <none>/-1, .own=
er_cpu: -1
[    5.234603] CPU: 0 PID: 309 Comm: udevd Not tainted 4.4.0-rc4-00029-gc7a=
f9d5 #1
[    5.235254]  00000000 00000000 c18b7e94 b114a4ae b14657b3 c18b7ebc b1065=
aac b14459cd
[    5.236013]  bee37ed0 ffffffff b14657b3 ffffffff ffffffff bee37ed0 c24f4=
ba0 c18b7ecc
[    5.236757]  b1065ad3 b1445a2f bee37ed0 c18b7ee8 b1065b3c c18b7ee0 b1065=
cb2 75656000
[    5.237334] Call Trace:
[    5.237339]  [<b114a4ae>] dump_stack+0x48/0x69
[    5.237342]  [<b1065aac>] spin_dump+0x6f/0x79
[    5.237343]  [<b1065ad3>] spin_bug+0x1d/0x21
[    5.237344]  [<b1065b3c>] do_raw_spin_lock+0x1e/0xf1
[    5.237347]  [<b1065cb2>] ? do_raw_spin_unlock+0x6e/0x71
[    5.237350]  [<b12f2c57>] _raw_spin_lock+0xf/0x11
[    5.237351]  [<b10b7d12>] handle_mm_fault+0x4d6/0xeac
[    5.237356]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[    5.237358]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    5.237360]  [<b102fd9e>] __do_page_fault+0x1ca/0x357
[    5.237361]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    5.237363]  [<b102ffe7>] do_page_fault+0x1a/0x1e
[    5.237363]  [<b102e216>] do_async_page_fault+0x22/0x46
[    5.237365]  [<b12f3df0>] error_code+0x30/0x40
[    5.237366]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb

Kernel tests: Boot OK!
Kernel tests: Boot OK!

dmesg-quantal-ivb41-4:20151227020131:i386-randconfig-h0-12261754:4.4.0-rc4-=
00029-gc7af9d5:1

[    5.439470] init: Temporary process spawn error: No space left on device
[    5.475595] initctl (158) used greatest stack depth: 6784 bytes left
[    5.478251] 00-header (157) used greatest stack depth: 6748 bytes left
[    5.492400] BUG: unable to handle kernel paging request at 0000f450
[    5.493432] IP: [<b105b354>] set_curr_task_fair+0x11/0x23
[    5.494285] *pde =3D 00000000 =

[    5.494750] Oops: 0000 [#1] PREEMPT SMP =

[    5.495416] Modules linked in:
[    5.495911] CPU: 0 PID: 173 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    5.497131] task: c243de40 ti: c24d4000 task.ti: c24d4000
[    5.497952] EIP: 0060:[<b105b354>] EFLAGS: 00010006 CPU: 0
[    5.498782] EIP is at set_curr_task_fair+0x11/0x23
[    5.499512] EAX: 00000000 EBX: 0000f400 ECX: 00000000 EDX: 00000000
[    5.500452] ESI: c108da80 EDI: c243de40 EBP: c24d5f14 ESP: c24d5f10
[    5.501424]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.502182] CR0: 8005003b CR2: 0000f450 CR3: 12573000 CR4: 000006d0
[    5.503048] Stack:
[    5.503346]  c243de40 c24d5f34 b1057eb2 b158e5c0 00000001 00000086 c243d=
e40 bc582e00
[    5.504578]  c243de40 c24d5f50 b1062211 bc3d3680 00000282 b0191b80 c243d=
e40 c24a3d80
[    5.505808]  c24d5f64 b10622d8 bd960fc0 c243de40 c243de40 c24d5f7c b1048=
a83 000000ad
[    5.507031] Call Trace:
[    5.507392]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    5.508070]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.508811]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.509660]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.510291]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.511008]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.511716] Code: 89 53 24 89 43 20 89 5e 30 8b 43 28 8b 53 2c 89 43 38 =
89 53 3c 5b 5e 5f 5d c3 55 89 e5 53 8b 98 c8 04 00 00 83 c3 44 85 db 74 0f =
<8b> 43 50 89 da e8 81 ff ff ff 8b 5b 4c eb ed 5b 5d c3 55 89 e5
[    5.515591] EIP: [<b105b354>] set_curr_task_fair+0x11/0x23 SS:ESP 0068:c=
24d5f10
[    5.516643] CR2: 000000000000f450
[    5.517107] ---[ end trace 949bc476bd4331e9 ]---
[    5.517755] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-50:20151227020049:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.422680] init: Failed to create pty - disabling logging for job
[    5.423487] init: Temporary process spawn error: No space left on device
[    5.482028] chgrp (150) used greatest stack depth: 6676 bytes left
[    5.507833] BUG: unable to handle kernel paging request
[    5.508619] mountall (124) used greatest stack depth: 6388 bytes left

[    5.509632]  at 00005403
[    5.509969] IP: [<b10c5f72>] __kmalloc+0x8e/0x121
[    5.510534] *pde =3D 00000000 =

[    5.510903] Oops: 0000 [#1] PREEMPT SMP =

[    5.511412] Modules linked in:
[    5.511799] CPU: 1 PID: 175 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    5.512636] task: bc3decc0 ti: c2580000 task.ti: c2580000
[    5.513263] EIP: 0060:[<b10c5f72>] EFLAGS: 00010246 CPU: 1
[    5.513905] EIP is at __kmalloc+0x8e/0x121
[    5.514381] EAX: 00005403 EBX: 00005403 ECX: 000010a1 EDX: b15796f0
[    5.515109] ESI: b0098e00 EDI: 024080c0 EBP: c2581f1c ESP: c2581efc
[    5.515837]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.516460] CR0: 8005003b CR2: 00005403 CR3: 12564000 CR4: 000006d0
[    5.517191] Stack:
[    5.517433]  b105a3e3 00000246 00005403 00000001 000010a1 b0115d80 b158e=
5c0 b0115d80
[    5.518470]  c2581f24 b105a3e3 c2581f40 b105d658 b158e5c0 b158e5c0 b0115=
d80 b158e5c0
[    5.519508]  bc3decc0 c2581f50 b1057c85 bd960e00 bc3decc0 c2581f64 b1062=
247 bd9607c0
[    5.520552] Call Trace:
[    5.520850]  [<b105a3e3>] ? kzalloc+0xd/0xf
[    5.521469]  [<b105a3e3>] kzalloc+0xd/0xf
[    5.522084]  [<b105d658>] alloc_fair_sched_group+0x33/0xc9
[    5.522731]  [<b1057c85>] sched_create_group+0x23/0x4a
[    5.523328]  [<b1062247>] sched_autogroup_create_attach+0x27/0xc7
[    5.524040]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.524567]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.525163]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.525757] Code: f0 75 e8 8b 18 85 db 75 16 8b 4d e0 89 fa 89 f0 e8 fd =
fd ff ff 89 c3 8b 06 64 ff 40 14 eb 75 8b 46 14 01 d8 f6 06 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 58 d7 ff ff 8b 16 89 45 e4 64 8b 0a 39 cb c7
[    5.529017] EIP: [<b10c5f72>] __kmalloc+0x8e/0x121 SS:ESP 0068:c2581efc
[    5.529821] CR2: 0000000000005403
[    5.530261] ---[ end trace 3ea4303f32060973 ]---
[    5.530916] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-50:20151227020217:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    4.976311] mount (136) used greatest stack depth: 6748 bytes left
[    4.999799] initctl (159) used greatest stack depth: 6732 bytes left
[    5.002779] stop (161) used greatest stack depth: 6708 bytes left
[    5.012616] BUG: unable to handle kernel NULL pointer dereference at 000=
00002
[    5.013338] IP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9
[    5.013788] *pde =3D 00000000 =

[    5.014076] Oops: 0000 [#1] PREEMPT SMP =

[    5.014456] Modules linked in:
[    5.014736] CPU: 1 PID: 1 Comm: init Not tainted 4.4.0-rc4-00029-gc7af9d=
5 #1
[    5.015381] task: b0040000 ti: b0016000 task.ti: b0016000
[    5.015852] EIP: 0060:[<b10c5df7>] EFLAGS: 00010246 CPU: 1
[    5.016314] EIP is at kmem_cache_alloc+0x64/0xe9
[    5.016695] EAX: 00000002 EBX: b0098e00 ECX: 000011e1 EDX: b15796f0
[    5.017268] ESI: 00000002 EDI: b11cb617 EBP: b0017d5c ESP: b0017d40
[    5.017827]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.018337] CR0: 80050033 CR2: 00000002 CR3: 12461000 CR4: 000006d0
[    5.018932] Stack:
[    5.019131]  b11cb617 b0017d50 000011e1 024000c0 c2585c00 b14f5640 00000=
000 b0017d70
[    5.020060]  b11cb617 c2585c00 bc3b7280 00000001 b0017d7c b11cbbbc c2585=
c00 b0017d94
[    5.021167]  b11c75c6 00000001 c2585400 00000000 00000001 b0017dbc b11cd=
2a9 00000000
[    5.021937] Call Trace:
[    5.022189]  [<b11cb617>] ? tty_ldisc_get+0x4e/0x76
[    5.022598]  [<b11cb617>] tty_ldisc_get+0x4e/0x76
[    5.023009]  [<b11cbbbc>] tty_ldisc_init+0xd/0x26
[    5.023425]  [<b11c75c6>] alloc_tty_struct+0x36/0x1d2
[    5.023878]  [<b11cd2a9>] pty_common_install+0x6d/0x1d9
[    5.024361]  [<b11cd42e>] pty_unix98_install+0xa/0xc
[    5.024776]  [<b11c77a9>] tty_init_dev+0x47/0x123
[    5.025172]  [<b11cd569>] ptmx_open+0x69/0x11f
[    5.025540]  [<b10d23e4>] chrdev_open+0xf3/0x103
[    5.025951]  [<b10ce6b9>] do_dentry_open+0x15e/0x1e1
[    5.026682]  [<b10d22f1>] ? cdev_put+0xe/0xe
[    5.027116]  [<b10cf0a5>] vfs_open+0x3e/0x43
[    5.027623]  [<b10d8cb9>] path_openat+0x7f1/0xa19
[    5.028663]  [<b10d0931>] ? get_empty_filp+0x37/0x13d
[    5.029339]  [<b10d51c9>] ? alloc_pipe_info+0x2a/0x79
[    5.029956]  [<b10d9d4b>] do_filp_open+0x2e/0x71
[    5.030528]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[    5.031149]  [<b1065cb2>] ? do_raw_spin_unlock+0x6e/0x71
[    5.031799]  [<b12f2cf0>] ? _raw_spin_unlock+0x8/0x1a
[    5.032430]  [<b10e24c5>] ? __alloc_fd+0x111/0x11b
[    5.033018]  [<b10cf1c0>] do_sys_open+0x54/0xcf
[    5.033580]  [<b10e25f8>] ? fd_install+0x1b/0x1e
[    5.034158]  [<b10cf253>] SyS_open+0x18/0x1a
[    5.034683]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.035318]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.035933] Code: 75 e8 8b 30 85 f6 75 17 8b 4d e4 8b 55 f0 89 d8 e8 78 =
ff ff ff 89 c6 8b 03 64 ff 40 14 eb 66 8b 43 14 01 f0 f6 03 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 d3 d8 ff ff 8b 13 31 c9 64 8b 3a 39 fe 75 20
[    5.039358] EIP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9 SS:ESP 0068:b00=
17d40
[    5.040267] CR2: 0000000000000002
[    5.041214] ---[ end trace 2001c27fc89b4db1 ]---
[    5.041825] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-52:20151227015651:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    4.922593] init: Failed to create pty - disabling logging for job
[    4.923286] init: Temporary process spawn error: No space left on device
[    4.951171] initctl (159) used greatest stack depth: 6664 bytes left
[    4.980137] BUG: unable to handle kernel paging request at ffffffff
[    4.980815] IP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9
[    4.981251] *pde =3D 0157e063 *pte =3D 00000000 =

[    4.981612] Oops: 0000 [#1] PREEMPT SMP =

[    4.982140] Modules linked in:
[    4.982446] CPU: 1 PID: 183 Comm: sh Not tainted 4.4.0-rc4-00029-gc7af9d=
5 #1
[    4.983023] task: c2415700 ti: c257c000 task.ti: c257c000
[    4.983460] EIP: 0060:[<b10c5df7>] EFLAGS: 00010246 CPU: 1
[    4.983910] EIP is at kmem_cache_alloc+0x64/0xe9
[    4.984283] EAX: ffffffff EBX: b0098d00 ECX: 000076c1 EDX: b1579768
[    4.984790] ESI: ffffffff EDI: b10b6ca9 EBP: c257dd78 ESP: c257dd5c
[    4.985293]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
[    4.985736] CR0: 8005003b CR2: ffffffff CR3: 12560000 CR4: 000006d0
[    4.986238] Stack:
[    4.986406]  b10b6ca9 b151e840 000076c1 024000c0 c1389ca0 c24e6600 c2560=
a74 c257dd84
[    4.987125]  b10b6ca9 c1389ca0 c257dd90 b1032f75 a7728854 c257dda8 b10b6=
cde a7728854
[    4.987836]  a7728854 c244ad80 c244ad80 c257de08 b10b79a6 a7728854 00000=
000 c24e6600
[    4.988542] Call Trace:
[    4.988759]  [<b10b6ca9>] ? ptlock_alloc+0x15/0x25
[    4.989151]  [<b10b6ca9>] ptlock_alloc+0x15/0x25
[    4.989525]  [<b1032f75>] pte_alloc_one+0x35/0x6b
[    4.989915]  [<b10b6cde>] __pte_alloc+0x13/0x9d
[    4.990286]  [<b10b79a6>] handle_mm_fault+0x16a/0xeac
[    4.990695]  [<b10ba1d4>] ? vma_link+0x62/0x6a
[    4.991063]  [<b10baa1a>] ? vma_set_page_prot+0x2a/0x46
[    4.991488]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[    4.991901]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    4.992360]  [<b102fd9e>] __do_page_fault+0x1ca/0x357
[    4.992781]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    4.993235]  [<b102ffe7>] do_page_fault+0x1a/0x1e
[    4.993610]  [<b102e216>] do_async_page_fault+0x22/0x46
[    4.994045]  [<b12f3df0>] error_code+0x30/0x40
[    4.994411]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    4.994877]  [<b11525f5>] ? clear_user+0x4f/0x60
[    4.995256]  [<b1119bdb>] padzero+0x19/0x2d
[    4.995592]  [<b10fab3f>] load_elf_binary+0x6d9/0x93e
[    4.996012]  [<b10d3494>] search_binary_handler+0x103/0x157
[    4.996465]  [<b10d45f1>] do_execveat_common+0x3b7/0x4de
[    4.996902]  [<b10d472c>] do_execve+0x14/0x16
[    4.997258]  [<b10d48b9>] SyS_execve+0x1c/0x20
[    4.997614]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    4.998039]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    4.998447] Code: 75 e8 8b 30 85 f6 75 17 8b 4d e4 8b 55 f0 89 d8 e8 78 =
ff ff ff 89 c6 8b 03 64 ff 40 14 eb 66 8b 43 14 01 f0 f6 03 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 d3 d8 ff ff 8b 13 31 c9 64 8b 3a 39 fe 75 20
[    5.000641] EIP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9 SS:ESP 0068:c25=
7dd5c
[    5.001250] CR2: 00000000ffffffff
[    5.001519] ---[ end trace 8593a33edd19abf7 ]---
[    5.001905] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-54:20151227020010:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.308611] init: Failed to create pty - disabling logging for job
[    5.309284] init: Temporary process spawn error: No space left on device
[    5.344212] stop (161) used greatest stack depth: 6388 bytes left
[    5.353748] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    5.354387] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    5.354820] *pde =3D 00000000 =

[    5.355099] Oops: 0000 [#1] PREEMPT SMP =

[    5.355454] Modules linked in:
[    5.355718] CPU: 1 PID: 177 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    5.356308] task: c24115c0 ti: c25c0000 task.ti: c25c0000
[    5.356771] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 1
[    5.357224] EIP is at set_next_entity+0x3e/0x64
[    5.357613] EAX: 00000000 EBX: c2411604 ECX: 00000000 EDX: c2411604
[    5.358125] ESI: c24ee500 EDI: c24115c0 EBP: c25c1f08 ESP: c25c1efc
[    5.358648]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.359118] CR0: 8005003b CR2: 000004ec CR3: 124e4000 CR4: 000006d0
[    5.359625] Stack:
[    5.359797]  c2411604 c109da80 c24115c0 c25c1f14 b105b35e c24115c0 c25c1=
f34 b1057eb2
[    5.360517]  b158e5c0 00000001 00000086 c24115c0 b010a800 c24115c0 c25c1=
f50 b1062211
[    5.361233]  c2422c80 00000282 b010ac00 c24115c0 b010ff00 c25c1f64 b1062=
2d8 bd9609c0
[    5.361973] Call Trace:
[    5.362186]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    5.362630]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    5.363054]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.363489]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.363982]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.364353]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.364769]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.365185] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    5.367451] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c25c=
1efc
[    5.368056] CR2: 00000000000004ec
[    5.368332] ---[ end trace db23fd36103f1f0c ]---
[    5.368712] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-56:20151227020048:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.324290] init: Failed to create pty - disabling logging for job
[    5.325114] init: Temporary process spawn error: No space left on device
[    5.342465] sh (137) used greatest stack depth: 6748 bytes left
[    5.372047] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    5.372939] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    5.373569] *pde =3D 00000000 =

[    5.373929] Oops: 0000 [#1] PREEMPT SMP =

[    5.374454] Modules linked in:
[    5.374836] CPU: 1 PID: 177 Comm: udevd Not tainted 4.4.0-rc4-00029-gc7a=
f9d5 #1
[    5.375689] task: c24132c0 ti: c2562000 task.ti: c2562000
[    5.376317] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 1
[    5.376965] EIP is at set_next_entity+0x3e/0x64
[    5.377503] EAX: 00000000 EBX: c2413304 ECX: 00000000 EDX: c2413304
[    5.378229] ESI: c2461d80 EDI: c24132c0 EBP: c2563f08 ESP: c2563efc
[    5.378963]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.379600] CR0: 8005003b CR2: 000004ec CR3: 1257a000 CR4: 000006d0
[    5.380333] Stack:
[    5.380579]  c2413304 c109da80 c24132c0 c2563f14 b105b35e c24132c0 c2563=
f34 b1057eb2
[    5.381616]  b158e5c0 00000001 00000086 c24132c0 bd961c80 c24132c0 c2563=
f50 b1062211
[    5.382653]  bc3df400 00000282 b0191a80 c24132c0 b0113b40 c2563f64 b1062=
2d8 bd961340
[    5.383689] Call Trace:
[    5.383985]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    5.384591]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    5.385158]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.385782]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.386496]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.387017]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.387623]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.388211] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    5.391468] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c256=
3efc
[    5.392319] CR2: 00000000000004ec
[    5.392718] ---[ end trace 339557cb5dc3c30c ]---
[    5.393258] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-60:20151227015600:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.041489] mountall (122) used greatest stack depth: 6664 bytes left
[    5.057800] init: Failed to create pty - disabling logging for job
[    5.058694] init: Temporary process spawn error: No space left on device
[    5.094095] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    5.094760] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    5.095216] *pde =3D 00000000 =

[    5.095488] Oops: 0000 [#1] PREEMPT SMP =

[    5.095934] Modules linked in:
[    5.096209] CPU: 0 PID: 174 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    5.096899] task: bc3ede40 ti: c25ac000 task.ti: c25ac000
[    5.097354] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 0
[    5.097825] EIP is at set_next_entity+0x3e/0x64
[    5.098211] EAX: 00000000 EBX: bc3ede84 ECX: 00000000 EDX: bc3ede84
[    5.098739] ESI: c24c7480 EDI: bc3ede40 EBP: c25adf08 ESP: c25adefc
[    5.099265]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.099727] CR0: 8005003b CR2: 000004ec CR3: 124d5000 CR4: 000006d0
[    5.100256] Stack:
[    5.100433]  bc3ede84 c108da80 bc3ede40 c25adf14 b105b35e bc3ede40 c25ad=
f34 b1057eb2
[    5.101174]  b158e5c0 00000001 00000086 bc3ede40 bd962300 bc3ede40 c25ad=
f50 b1062211
[    5.101917]  bc3df400 00000282 bd962500 bc3ede40 c24a4180 c25adf64 b1062=
2d8 c2571100
[    5.102659] Call Trace:
[    5.102873]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    5.103311]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    5.103732]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.104184]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.104705]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.105083]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.105518]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.105948] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    5.108253] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c25a=
defc
[    5.108876] CR2: 00000000000004ec
[    5.109160] ---[ end trace f8774f6907e6a6aa ]---
[    5.109550] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-60:20151227015638:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.186649] init: Failed to create pty - disabling logging for job
[    5.187541] init: Temporary process spawn error: No space left on device
[    5.221268] initctl (159) used greatest stack depth: 6732 bytes left
[    5.234887] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    5.235996] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    5.236744] *pde =3D 00000000 =

[    5.237209] Oops: 0000 [#1] PREEMPT SMP =

[    5.237815] Modules linked in:
[    5.238279] CPU: 1 PID: 174 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    5.239427] task: c2411d00 ti: c2574000 task.ti: c2574000
[    5.240179] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 1
[    5.240966] EIP is at set_next_entity+0x3e/0x64
[    5.241599] EAX: 00000000 EBX: c2411d44 ECX: 00000000 EDX: c2411d44
[    5.242492] ESI: c2488c00 EDI: c2411d00 EBP: c2575f08 ESP: c2575efc
[    5.243361]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.244127] CR0: 8005003b CR2: 000004ec CR3: 1258d000 CR4: 000006d0
[    5.245025] Stack:
[    5.245316]  c2411d44 c109da80 c2411d00 c2575f14 b105b35e c2411d00 c2575=
f34 b1057eb2
[    5.246573]  b158e5c0 00000001 00000086 c2411d00 bd961100 c2411d00 c2575=
f50 b1062211
[    5.247815]  bc3def00 00000282 b0191e40 c2411d00 b01139c0 c2575f64 b1062=
2d8 bd961e80
[    5.249090] Call Trace:
[    5.249458]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    5.250183]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    5.250900]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.251649]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.252530]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.253167]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.253898]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.254582] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    5.258068] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c257=
5efc
[    5.258986] CR2: 00000000000004ec
[    5.259411] ---[ end trace 5165b1f496ab45f0 ]---
[    5.259994] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-62:20151227020142:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.374885] hwclock (110) used greatest stack depth: 6512 bytes left
[    5.406692] init: Failed to create pty - disabling logging for job
[    5.407595] init: Temporary process spawn error: No space left on device
[    5.457743] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    5.458725] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    5.459402] *pde =3D 00000000 =

[    5.459794] Oops: 0000 [#1] PREEMPT SMP =

[    5.460354] Modules linked in:
[    5.460764] CPU: 1 PID: 173 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    5.461785] task: c2414fc0 ti: c2584000 task.ti: c2584000
[    5.462470] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 1
[    5.463153] EIP is at set_next_entity+0x3e/0x64
[    5.463731] EAX: 00000000 EBX: c2415004 ECX: 00000000 EDX: c2415004
[    5.464520] ESI: bc3b5080 EDI: c2414fc0 EBP: c2585f08 ESP: c2585efc
[    5.465303]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.465973] CR0: 8005003b CR2: 000004ec CR3: 1259f000 CR4: 000006d0
[    5.466768] Stack:
[    5.467019]  c2415004 c109da80 c2414fc0 c2585f14 b105b35e c2414fc0 c2585=
f34 b1057eb2
[    5.468072]  b158e5c0 00000001 00000086 c2414fc0 bd960e00 c2414fc0 c2585=
f50 b1062211
[    5.469116]  bc3dc780 00000282 bd960bc0 c2414fc0 c2449900 c2585f64 b1062=
2d8 b0191a00
[    5.470168] Call Trace:
[    5.470480]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    5.471084]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    5.471665]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.472296]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.473010]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.473543]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.474150]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.474751] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    5.478030] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c258=
5efc
[    5.478893] CR2: 00000000000004ec
[    5.479364] ---[ end trace dccc225ea847baa5 ]---
[    5.480096] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-63:20151227020148:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.154786] init: Temporary process spawn error: No space left on device
[    5.179814] initctl (160) used greatest stack depth: 6712 bytes left
[    5.182053] stop (163) used greatest stack depth: 6676 bytes left
[    5.189357] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    5.189987] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    5.190422] *pde =3D 00000000 =

[    5.190673] Oops: 0000 [#1] PREEMPT SMP =

[    5.191035] Modules linked in:
[    5.191302] CPU: 1 PID: 173 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    5.191879] task: c2410000 ti: c25ba000 task.ti: c25ba000
[    5.192325] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 1
[    5.192768] EIP is at set_next_entity+0x3e/0x64
[    5.193144] EAX: 00000000 EBX: c2410044 ECX: 00000000 EDX: c2410044
[    5.193654] ESI: c24ad380 EDI: c2410000 EBP: c25bbf08 ESP: c25bbefc
[    5.194164]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.194603] CR0: 8005003b CR2: 000004ec CR3: 1258a000 CR4: 000006d0
[    5.195112] Stack:
[    5.195284]  c2410044 c109da80 c2410000 c25bbf14 b105b35e c2410000 c25bb=
f34 b1057eb2
[    5.196008]  b158e5c0 00000001 00000086 c2410000 b010af80 c2410000 c25bb=
f50 b1062211
[    5.196724]  bc3de500 00000282 bd961980 c2410000 c24b5d80 c25bbf64 b1062=
2d8 b0191a40
[    5.197445] Call Trace:
[    5.197651]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    5.198076]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    5.198474]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.198910]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.199406]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.199768]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.200190]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.200599] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    5.202892] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c25b=
befc
[    5.203492] CR2: 00000000000004ec
[    5.203768] ---[ end trace 0c4702c6e10f0561 ]---
[    5.204151] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-65:20151227020145:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.017346] init: Failed to create pty - disabling logging for job
[    5.018312] init: Temporary process spawn error: No space left on device
[    5.026519] mount (136) used greatest stack depth: 6748 bytes left
[    5.078372] BUG: unable to handle kernel NULL pointer dereference at 000=
00110
[    5.079491] IP: [<b10a4419>] put_page_testzero+0x0/0x25
[    508018ud5ev]d[ 18*0]p: derero =3Dr: run ti0me0 d0ir0ec000to0ry  '/run/=
udev'
[    5.081111] Oops: 0000 [#1] PREEMPT SMP =

[    5.081650] Modules linked in:
[    5.082063] CPU: 0 PID: 1 Comm: init Not tainted 4.4.0-rc4-00029-gc7af9d=
5 #1
[    5.082931] task: b0040000 ti: b0016000 task.ti: b0016000
[    5.083604] EIP: 0060:[<b10a4419>] EFLAGS: 00010202 CPU: 0
[    5.084290] EIP is at put_page_testzero+0x0/0x25
[    5.084880] EAX: 00000100 EBX: 00000100 ECX: b15bfd2c EDX: 00000000
[    5.085663] ESI: 00000001 EDI: c2470720 EBP: b0017e98 ESP: b0017e8c
[    5.086440]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.087114] CR0: 8005003b CR2: 00000110 CR3: 12461000 CR4: 000006d0
[    5.087888] Stack:
[    5.088156]  b10a5cb9 00000000 00000001 b0017eac b10c00c3 c2486000 c3430=
000 c2486018
[    5.089242]  b0017eb8 b10c0161 c2486000 b0017ec8 b11c8579 c2486000 bc3fc=
5b8 b0017ed8
[    5.090334]  b11cb6b6 c2486000 c2486000 b0017ee4 b11cb70a c2486400 b0017=
efc b11cbb8b
[    5.091426] Call Trace:
[    5.091741]  [<b10a5cb9>] ? __free_pages+0xf/0x2c
[    5.092338]  [<b10c00c3>] __vunmap+0x7a/0x9d
[    5.092873]  [<b10c0161>] vfree+0x59/0x5c
[    5.093384]  [<b11c8579>] n_tty_close+0x22/0x30
[    5.093957]  [<b11cb6b6>] tty_ldisc_close+0x38/0x3c
[    5.094639]  [<b11cb70a>] tty_ldisc_kill+0xe/0x29
[    5.095232]  [<b11cbb8b>] tty_ldisc_release+0xc1/0xe5
[    5.095862]  [<b11c73cc>] tty_release+0x3a9/0x40b
[    5.096455]  [<b10d0837>] __fput+0xd0/0x142
[    5.096986]  [<b10d08cf>] ____fput+0x8/0xa
[    5.097498]  [<b104e960>] task_work_run+0x53/0x75
[    5.098091]  [<b1000d76>] prepare_exit_to_usermode+0x67/0x83
[    5.098791]  [<b1000dcf>] syscall_return_slowpath+0x3d/0x40
[    5.099497]  [<b1000ec1>] do_fast_syscall_32+0x9f/0xd6
[    5.100115]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.100705] Code: 01 74 0c ba 1b a9 44 b1 e8 e6 02 01 00 0f 0b 8b 50 10 =
85 d2 74 0c ba eb ac 44 b1 e8 d3 02 01 00 0f 0b c7 40 10 01 00 00 00 5d c3 =
<8b> 50 10 85 d2 75 0f 55 ba 16 ad 44 b1 89 e5 e8 b4 02 01 00 0f
[    5.103860] EIP: [<b10a4419>] put_page_testzero+0x0/0x25 SS:ESP 0068:b00=
17e8c
[    5.104725] CR2: 0000000000000110
[    5.105172] ---[ end trace ca57a123f836c8ec ]---
[    5.105718] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-68:20151227015543:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    4.900225] init: Failed to create pty - disabling logging for job
[    4.900800] init: Temporary process spawn error: No space left on device
[    4.925387] initctl (158) used greatest stack depth: 6400 bytes left
[    4.939397] BUG: spinlock bad magic on CPU#0, udevd/177
[    4.939882]  lock: 0xbcda8b50, .magic: ffffffff, .owner: <none>/-1, .own=
er_cpu: -1
[    4.940571] BUG: unable to handle kernel NULL pointer dereference at 000=
0009a
[    4.940576] IP: [<b105d553>] unregister_fair_sched_group+0x12/0x70
[    4.940577] *pde =3D 00000000 =

[    4.940578] Oops: 0000 [#1] PREEMPT SMP =

[    4.940579] Modules linked in:
[    4.940581] CPU: 0 PID: 177 Comm: udevd Not tainted 4.4.0-rc4-00029-gc7a=
f9d5 #1
[    4.940582] task: c24132c0 ti: c257c000 task.ti: c257c000
[    4.940584] EIP: 0060:[<b105d553>] EFLAGS: 00010293 CPU: 0
[    4.940585] EIP is at unregister_fair_sched_group+0x12/0x70
[    4.940586] EAX: c2554900 EBX: b1578a80 ECX: 00000002 EDX: 00000000
[    4.940587] ESI: 00000000 EDI: b14e0000 EBP: b0083f48 ESP: b0083f38
[    4.940587]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    4.940588] CR0: 8005003b CR2: 0000009a CR3: 125b8000 CR4: 000006d0
[    4.940592] Stack:
[    4.940594]  00000000 c2554900 00000000 b14e0000 b0083f58 b1057dad bd961=
f40 bc3df900
[    4.940596]  b0083f64 b10620f1 c2410740 b0083f6c b106210d b0083f74 b1062=
34b b0083f84
[    4.940598]  b103b765 c2410740 c2410b5c b0083f8c b103dd31 b0083f98 b103d=
d4b c108e0c0
[    4.940599] Call Trace:
[    4.940601]  [<b1057dad>] sched_offline_group+0x2a/0x72
[    4.940603]  [<b10620f1>] autogroup_destroy+0xe/0x19
[    4.940605]  [<b106210d>] kref_sub+0x11/0x18
[    4.940606]  [<b106234b>] sched_autogroup_exit+0xe/0x10
[    4.940609]  [<b103b765>] __put_task_struct+0x82/0xaa
[    4.940611]  [<b103dd31>] put_task_struct+0xf/0x11
[    4.940612]  [<b103dd4b>] delayed_put_task_struct+0x18/0x1b
[    4.940613]  [<b1072619>] rcu_process_callbacks+0x343/0x439
[    4.940615]  [<b103fd80>] __do_softirq+0x9a/0x16a
[    4.940616]  [<b103fce6>] ? tasklet_hi_action+0xa2/0xa2
[    4.940618]  [<b10038d4>] do_softirq_own_stack+0x1f/0x25
[    4.940620]  <IRQ> =

[    4.940620]  [<b103ffc3>] irq_exit+0x38/0x79
[    4.940623]  [<b1028209>] smp_trace_apic_timer_interrupt+0x59/0x67
[    4.940625]  [<b102821f>] smp_apic_timer_interrupt+0x8/0xa
[    4.940627]  [<b12f3b5d>] apic_timer_interrupt+0x2d/0x40
[    4.940629]  [<b11d007b>] ? uart_ioctl+0x5e0/0x761
[    4.940632]  [<b106774d>] ? arch_local_irq_restore+0x5/0xb
[    4.940633]  [<b10691ad>] console_unlock+0x214/0x3c4
[    4.940635]  [<b106967e>] vprintk_emit+0x321/0x355
[    4.940636]  [<b10697b3>] vprintk_default+0x12/0x14
[    4.940638]  [<b10a0722>] printk+0x12/0x14
[    4.940639]  [<b1065aa7>] spin_dump+0x6a/0x79
[    4.940640]  [<b1065ad3>] spin_bug+0x1d/0x21
[    4.940641]  [<b1065b3c>] do_raw_spin_lock+0x1e/0xf1
[    4.940642]  [<b12f2c57>] _raw_spin_lock+0xf/0x11
[    4.940643]  [<b10b8238>] handle_mm_fault+0x9fc/0xeac
[    4.940646]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[    4.940647]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    4.940649]  [<b102fd9e>] __do_page_fault+0x1ca/0x357
[    4.940650]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    4.940651]  [<b102ffe7>] do_page_fault+0x1a/0x1e
[    4.940652]  [<b102e216>] do_async_page_fault+0x22/0x46
[    4.940653]  [<b12f3df0>] error_code+0x30/0x40
[    4.940654]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    4.940669] Code: e8 67 95 06 00 eb b3 e8 60 95 06 00 8b 46 68 e8 58 95 =
06 00 5b 5e 5f 5d c3 55 89 e5 57 56 53 51 bb 80 8a 57 b1 8b 48 6c 8b 0c 91 =
<83> b9 98 00 00 00 00 74 4f 03 1c 95 00 2a 52 b1 89 c7 89 d6 89
[    4.940672] EIP: [<b105d553>] unregister_fair_sched_group+0x12/0x70 SS:E=
SP 0068:b0083f38
[    4.940672] CR2: 000000000000009a
[    4.940673] ---[ end trace f0b62e37b941426e ]---
[    4.940674] Kernel panic - not syncing: Fatal exception in interrupt

dmesg-quantal-ivb41-69:20151227020219:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    4.974254] init: Temporary process spawn error: No space left on device
[    5.004194] initctl (159) used greatest stack depth: 6708 bytes left
[    5.007663] 00-header (158) used greatest stack depth: 6660 bytes left
[    5.014625] BUG: unable to handle kernel NULL pointer dereference at 000=
00030
[    5.015727] IP: [<b10596ab>] update_curr+0xb/0xbc
[    5.016440] *pde =3D 00000000 =

[    5.016888] Oops: 0000 [#1] PREEMPT SMP =

[    5.017525] Modules linked in:
[    5.017996] CPU: 1 PID: 173 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    5.019183] task: c2410e80 ti: c25aa000 task.ti: c25aa000
[    5.019967] EIP: 0060:[<b10596ab>] EFLAGS: 00010082 CPU: 1
[    5.020774] EIP is at update_curr+0xb/0xbc
[    5.021377] EAX: 00000000 EBX: c24dc24c ECX: b0113a5c EDX: c108df3c
[    5.022287] ESI: 00000000 EDI: c24c9c00 EBP: c25abe90 ESP: c25abe70
[    5.023199]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.023982] CR0: 80050033 CR2: 00000030 CR3: 125b5000 CR4: 000006d0
[    5.024899] Stack:
[    5.025212]  c24c9c28 00000000 c25abe90 b1059b96 c24c9c28 c24dc24c 00000=
001 c24c9c00
[    5.026486]  c25abef0 b105b520 00000001 b10075c8 00000001 00000001 c108d=
a80 00000001
[    5.027763]  c25abedc b10587b5 2ae50f06 00000001 00000000 00000000 c24c9=
cc0 c25abef8
[    5.029045] Call Trace:
[    5.029413]  [<b1059b96>] ? __enqueue_entity+0x5f/0x65
[    5.030165]  [<b105b520>] enqueue_task_fair+0x4a/0x432
[    5.030916]  [<b10075c8>] ? paravirt_sched_clock+0x9/0xd
[    5.031679]  [<b10587b5>] ? sched_clock_cpu+0x19/0xf6
[    5.032374]  [<b1053dfe>] ? update_rq_clock+0x1c/0x4d
[    5.033088]  [<b1053e52>] enqueue_task+0x23/0x29
[    5.033727]  [<b1054178>] activate_task+0x23/0x26
[    5.034367]  [<b1055370>] wake_up_new_task+0x4c/0x85
[    5.035091]  [<b103ccf8>] _do_fork+0xdb/0x198
[    5.035732]  [<b1046f35>] ? SyS_rt_sigaction+0x49/0x7e
[    5.036454]  [<b103ce21>] SyS_clone+0x19/0x1b
[    5.037064]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.037759]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.038461] Code: b1 00 75 16 ba 04 01 00 00 b8 cb 4a 44 b1 e8 a2 3d fe =
ff c6 05 d1 fb 51 b1 01 8d 43 bc 5b 5d c3 55 89 e5 57 56 53 89 c6 83 ec 14 =
<8b> 58 30 8b 80 94 00 00 00 8b 90 ec 04 00 00 8b 80 e8 04 00 00
[    5.042359] EIP: [<b10596ab>] update_curr+0xb/0xbc SS:ESP 0068:c25abe70
[    5.043316] CR2: 0000000000000030
[    5.043780] ---[ end trace 7d3f0e0f362e0027 ]---
[    5.044455] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-70:20151227015606:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    4.950619] init: Temporary process spawn error: No space left on device
[    4.955205] sh (134) used greatest stack depth: 6748 bytes left
[    4.981799] initctl (160) used greatest stack depth: 6388 bytes left
[    4.994887] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    4.996069] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    4.996872] *pde =3D 00000000 =

[    4.997298] Oops: 0000 [#1] PREEMPT SMP =

[    4.997895] Modules linked in:
[    4.998462] CPU: 1 PID: 174 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    4.999920] task: c2410000 ti: c24dc000 task.ti: c24dc000
[    5.000891] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 1
[    5.001725] EIP is at set_next_entity+0x3e/0x64
[    5.002372] EAX: 00000000 EBX: c2410044 ECX: 00000000 EDX: c2410044
[    5.003309] ESI: c24a5180 EDI: c2410000 EBP: c24ddf08 ESP: c24ddefc
[    5.004580]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.005632] CR0: 8005003b CR2: 000004ec CR3: 12592000 CR4: 000006d0
[    5.006912] Stack:
[    5.007312]  c2410044 c109da80 c2410000 c24ddf14 b105b35e c2410000 c24dd=
f34 b1057eb2
[    5.008969]  b158e5c0 00000001 00000086 c2410000 bd961b80 c2410000 c24dd=
f50 b1062211
[    5.010409]  bc3c4000 00000282 b010aac0 c2410000 b01136c0 c24ddf64 b1062=
2d8 bd961fc0
[    5.011624] Call Trace:
[    5.011981]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    5.012856]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    5.013688]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.014591]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.015621]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.016364]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.017259]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.018096] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    5.022769] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c24d=
defc
[    5.023845] CR2: 00000000000004ec
[    5.024300] ---[ end trace 4798c3b91083a3d5 ]---
[    5.024921] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-70:20151227015826:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

udevd[222]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:PNP=
0C0F:': No such file or directory
udevd[220]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:PNP=
0C0F:': No such file or directory
udevd[215]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:PNP=
0A03:': No such file or directory
[    5.183277] BUG: unable to handle kernel paging request at ffffffff
[    5.184240] IP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9
[    5.185013] *pde =3D 0157e063 *pte =3D 00000000 =

[    5.185635] Oops: 0000 [#1] PREEMPT SMP =

[    5.186242] Modules linked in:
[    5.186680] CPU: 0 PID: 265 Comm: sh Not tainted 4.4.0-rc4-00029-gc7af9d=
5 #1
[    5.187720] task: c27a3a00 ti: c1ce8000 task.ti: c1ce8000
[    5.188469] EIP: 0060:[<b10c5df7>] EFLAGS: 00010246 CPU: 0
[    5.189244] EIP is at kmem_cache_alloc+0x64/0xe9
[    5.189886] EAX: ffffffff EBX: b0098d00 ECX: 00025f40 EDX: b1579768
[    5.190726] ESI: ffffffff EDI: b10b6ca9 EBP: c1ce9e24 ESP: c1ce9e08
[    5.191591]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.192339] CR0: 80050033 CR2: ffffffff CR3: 127cf000 CR4: 000006d0
[    5.193223] Stack:
[    5.193512]  b10b6ca9 b151e840 00025f40 024000c0 c1374ee0 c25f0c00 c1d1a=
afc c1ce9e30
[    5.194817]  b10b6ca9 c1374ee0 c1ce9e3c b1032f75 c25f0c00 c1ce9e54 b10b6=
cde c25f0c00
[    5.195172]  c25f0c00 afdf2000 c1ce9eac c1ce9eb8 b10b6fd6 afdf2000 c1cea=
000 afe13fff
[    5.195176] Call Trace:
[    5.195183]  [<b10b6ca9>] ? ptlock_alloc+0x15/0x25
[    5.195186]  [<b10b6ca9>] ptlock_alloc+0x15/0x25
[    5.195188]  [<b1032f75>] pte_alloc_one+0x35/0x6b
[    5.195191]  [<b10b6cde>] __pte_alloc+0x13/0x9d
[    5.195193]  [<b10b6fd6>] copy_page_range+0x26e/0x3da
[    5.195196]  [<b10b3700>] ? __anon_vma_interval_tree_augment_propagate+0=
x28/0x28
[    5.195199]  [<b10b9670>] ? vma_gap_callbacks_rotate+0x14/0x1a
[    5.195203]  [<b103c583>] copy_process+0xbb1/0x1198
[    5.195206]  [<b103cc78>] _do_fork+0x5b/0x198
[    5.195210]  [<b1152773>] ? _copy_to_user+0x3f/0x48
[    5.195214]  [<b1043e8b>] ? copy_to_user+0x28/0x2d
[    5.195216]  [<b103ce21>] SyS_clone+0x19/0x1b
[    5.195218]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.195222]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.195222] Code: 75 e8 8b 30 85 f6 75 17 8b 4d e4 8b 55 f0 89 d8 e8 78 =
ff ff ff 89 c6 8b 03 64 ff 40 14 eb 66 8b 43 14 01 f0 f6 03 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 d3 d8 ff ff 8b 13 31 c9 64 8b 3a 39 fe 75 20
[    5.195253] EIP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9 SS:ESP 0068:c1c=
e9e08
[    5.195256] CR2: 00000000ffffffff
[    5.195258] ---[ end trace b184a672d30f07cb ]---
[    5.195259] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-71:20151227020106:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.552022] init: Temporary process spawn error: No space left on device
[    5.606431] initctl (157) used greatest stack depth: 6808 bytes left
[    5.617192] 99-footer (168) used greatest stack depth: 6748 bytes left
[    5.619943] BUG: unable to handle kernel paging request at cccccccc
[    5.620787] IP: [<cccccccc>] 0xcccccccc
[    5.621282] *pde =3D 00000000 =

[    5.621667] Oops: 0000 [#1] PREEMPT SMP =

[    5.622206] Modules linked in:
[    5.622326] mountall (123) used greatest stack depth: 6388 bytes left

[    5.623388] =

[    5.623623] CPU: 0 PID: 1 Comm: init Not tainted 4.4.0-rc4-00029-gc7af9d=
5 #1
[    5.624451] task: b0040000 ti: b0016000 task.ti: b0016000
[    5.625095] EIP: 0060:[<cccccccc>] EFLAGS: 00010286 CPU: 0
[    5.625748] EIP is at 0xcccccccc
[    5.626135] EAX: bc3da400 EBX: c2479600 ECX: b0017ba0 EDX: c2479600
[    5.626877] ESI: c2446388 EDI: cccccccc EBP: b0017b1c ESP: b0017b04
[    5.627619]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.628257] CR0: 80050033 CR2: cccccccc CR3: 12458000 CR4: 000006d0
[    5.629005] Stack:
[    5.629253]  b11c5d4f b0017ba0 bc3da400 00000000 00000001 b0017e1c b0017=
e08 b10dc0f9
[    5.630310]  b0018000 b0040000 0000b1e8 b0017e48 b0017e44 b0017e40 b0017=
e3c b0017e38
[    5.631362]  b0017e34 00000020 00000180 c2479600 00000000 00000020 c2479=
600 00000000
[    5.632415] Call Trace:
[    5.632725]  [<b11c5d4f>] ? tty_poll+0x49/0x65
[    5.633257]  [<b10dc0f9>] do_select+0x320/0x5e4
[    5.633803]  [<b12c57d2>] ? __alloc_skb+0x90/0x163
[    5.634372]  [<b10dbafd>] ? set_restore_sigmask+0x2a/0x2a
[    5.635018]  [<b1155ba2>] ? copy_from_iter+0x187/0x226
[    5.635632]  [<b1065cb2>] ? do_raw_spin_unlock+0x6e/0x71
[    5.636254]  [<b12c2339>] ? sk_wake_async+0x14/0x38
[    5.636839]  [<b12e9fdb>] ? scm_destroy+0xd/0x23
[    5.637386]  [<b12eae71>] ? unix_stream_sendmsg+0x226/0x253
[    5.638049]  [<b12bf7e5>] ? sock_sendmsg_nosec+0xd/0x19
[    5.638670]  [<b12c101d>] ? ___sys_sendmsg+0x172/0x180
[    5.639279]  [<b12c10c2>] ? ___sys_recvmsg+0x97/0x102
[    5.639884]  [<b12c1123>] ? ___sys_recvmsg+0xf8/0x102
[    5.640480]  [<b12bf39f>] ? sock_recvmsg_nosec+0x12/0x12
[    5.641116]  [<b10dbafd>] ? set_restore_sigmask+0x2a/0x2a
[    5.641762]  [<b10dbafd>] ? set_restore_sigmask+0x2a/0x2a
[    5.642401]  [<b1065cb2>] ? do_raw_spin_unlock+0x6e/0x71
[    5.643040]  [<b12f2d4a>] ? _raw_spin_unlock_irqrestore+0x12/0x25
[    5.643768]  [<b11664fa>] ? debug_check_no_obj_freed+0xe4/0x126
[    5.644466]  [<b10e1c4e>] ? __fget_light+0x21/0x41
[    5.645043]  [<b10e1c7b>] ? __fdget+0xd/0xf
[    5.645544]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[    5.646138]  [<b1052f5f>] ? __might_sleep+0x6b/0x72
[    5.646725]  [<b1152645>] ? _copy_from_user+0x3f/0x52
[    5.647324]  [<b10dba56>] ? copy_from_user+0x28/0x2d
[    5.647922]  [<b10dc4f8>] core_sys_select+0x13b/0x1be
[    5.648520]  [<b10c6843>] ? kmem_cache_free+0x9f/0xce
[    5.649129]  [<b10d8fc5>] ? putname+0x3f/0x42
[    5.649660]  [<b10d8fc5>] ? putname+0x3f/0x42
[    5.650178]  [<b10d9251>] ? filename_lookup+0x8f/0x99
[    5.650784]  [<b10c411c>] ? slab_post_alloc_hook+0xa/0x17
[    5.651501]  [<b10d92d1>] ? user_path_at_empty+0x25/0x2c
[    5.652140]  [<b10d2666>] ? SYSC_readlinkat+0x3d/0xae
[    5.652748]  [<b10dc5e6>] SYSC_select+0x6b/0x8b
[    5.653290]  [<b10dc61d>] SyS_select+0x17/0x19
[    5.653828]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.654439]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.655048] Code:  Bad EIP value.
[    5.655488] EIP: [<cccccccc>] 0xcccccccc SS:ESP 0068:b0017b04
[    5.656208] CR2: 00000000cccccccc
[    5.656612] ---[ end trace 08cc985c906fe239 ]---
[    5.657161] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-74:20151227015707:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.103308] hwclock (111) used greatest stack depth: 6512 bytes left
[    5.129879] init: Failed to create pty - disabling logging for job
[    5.130819] init: Temporary process spawn error: No space left on device
[    5.174733] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    5.175762] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    5.176469] *pde =3D 00000000 =

[    5.176883] Oops: 0000 [#1] PREEMPT SMP =

[    5.177466] Modules linked in:
[    5.177895] CPU: 1 PID: 172 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    5.178847] task: c2420000 ti: c25d2000 task.ti: c25d2000
[    5.179564] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 1
[    5.180296] EIP is at set_next_entity+0x3e/0x64
[    5.180897] EAX: 00000000 EBX: c2420044 ECX: 00000000 EDX: c2420044
[    5.181723] ESI: bc3c5e00 EDI: c2420000 EBP: c25d3f08 ESP: c25d3efc
[    5.182547]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.183262] CR0: 8005003b CR2: 000004ec CR3: 125bc000 CR4: 000006d0
[    5.184082] Stack:
[    5.184366]  c2420044 c109da80 c2420000 c25d3f14 b105b35e c2420000 c25d3=
f34 b1057eb2
[    5.185533]  b158e5c0 00000001 00000086 c2420000 bda93f80 c2420000 c25d3=
f50 b1062211
[    5.186694]  bc3e8c80 00000282 c24ebc40 c2420000 bddb8cc0 c25d3f64 b1062=
2d8 c24b6700
[    5.187857] Call Trace:
[    5.188198]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    5.188876]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    5.189527]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.190232]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.191032]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.191627]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.192310]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.192972] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    5.196816] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c25d=
3efc
[    5.197779] CR2: 00000000000004ec
[    5.198225] ---[ end trace 31ecb664cf38dbf1 ]---
[    5.198834] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-77:20151227020011:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.273266] init: Failed to create pty - disabling logging for job
[    5.274191] init: Temporary process spawn error: No space left on device
[    5.312037] stop (160) used greatest stack depth: 6664 bytes left
[    5.331937] BUG: unable to handle kernel NULL pointer dereference at 000=
00002
[    5.333050] IP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9
[    5.333874] *pde =3D 00000000 =

[    5.334333] Oops: 0000 [#1] PREEMPT SMP =

[    5.334979] Modules linked in:
[    5.335462] CPU: 0 PID: 1 Comm: init Not tainted 4.4.0-rc4-00029-gc7af9d=
5 #1
[    5.336524] task: b0040000 ti: b0016000 task.ti: b0016000
[    5.337345] EIP: 0060:[<b10c5df7>] EFLAGS: 00010246 CPU: 0
[    5.338181] EIP is at kmem_cache_alloc+0x64/0xe9
[    5.338860] EAX: 00000002 EBX: b0098e00 ECX: 000429a0 EDX: b15796f0
[    5.339819] ESI: 00000002 EDI: b11cb617 EBP: b0017d8c ESP: b0017d70
[    5.340765]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.341756] CR0: 80050033 CR2: 00000002 CR3: 12460000 CR4: 000006d0
[    5.342703] Stack:
[    5.343016]  b11cb617 b0017d80 000429a0 024000c0 c24e2800 b14f5640 00000=
000 b0017da0
[    5.344359]  b11cb617 c24e2800 bc3b2f00 00000002 b0017dac b11cbbbc c24e2=
800 b0017dc4
[    5.345687]  b11c75c6 00000000 00000002 bc3b2f00 00000002 b0017ddc b11c7=
788 00000246
[    5.347000] Call Trace:
[    5.347389]  [<b11cb617>] ? tty_ldisc_get+0x4e/0x76
[    5.348146]  [<b11cb617>] tty_ldisc_get+0x4e/0x76
[    5.348869]  [<b11cbbbc>] tty_ldisc_init+0xd/0x26
[    5.349591]  [<b11c75c6>] alloc_tty_struct+0x36/0x1d2
[    5.350353]  [<b11c7788>] tty_init_dev+0x26/0x123
[    5.351066]  [<b11cd569>] ptmx_open+0x69/0x11f
[    5.351743]  [<b10d23e4>] chrdev_open+0xf3/0x103
[    5.352446]  [<b10ce6b9>] do_dentry_open+0x15e/0x1e1
[    5.353311]  [<b10d22f1>] ? cdev_put+0xe/0xe
[    5.353971]  [<b10cf0a5>] vfs_open+0x3e/0x43
[    5.354624]  [<b10d8cb9>] path_openat+0x7f1/0xa19
[    5.355334]  [<b10d9d4b>] do_filp_open+0x2e/0x71
[    5.356039]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[    5.356816]  [<b1065cb2>] ? do_raw_spin_unlock+0x6e/0x71
[    5.357632]  [<b12f2cf0>] ? _raw_spin_unlock+0x8/0x1a
[    5.358402]  [<b10e24c5>] ? __alloc_fd+0x111/0x11b
[    5.359241]  [<b10cf1c0>] do_sys_open+0x54/0xcf
[    5.359940]  [<b10e25f8>] ? fd_install+0x1b/0x1e
[    5.360648]  [<b10cf253>] SyS_open+0x18/0x1a
[    5.361299]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.362077]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.362848] Code: 75 e8 8b 30 85 f6 75 17 8b 4d e4 8b 55 f0 89 d8 e8 78 =
ff ff ff 89 c6 8b 03 64 ff 40 14 eb 66 8b 43 14 01 f0 f6 03 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 d3 d8 ff ff 8b 13 31 c9 64 8b 3a 39 fe 75 20
[    5.367036] EIP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9 SS:ESP 0068:b00=
17d70
[    5.368097] CR2: 0000000000000002
[    5.368686] ---[ end trace be40cbebaf169e04 ]---
[    5.369457] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-79:20151227015656:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.139362] init: Failed to create pty - disabling logging for job
[    5.140334] init: Temporary process spawn error: No space left on device
[    5.152993] mount (136) used greatest stack depth: 6748 bytes left
[    5.190620] BUG: unable to handle kernel paging request at 63e1a683
[    5.191499] IP: [<b1059d0b>] sched_slice+0x33/0x6c
[    5.192224] *pde =3D 00000000 =

[    5.192625] Oops: 0000 [#1] PREEMPT SMP =

[    5.193181] Modules linked in:
[    5.193602] CPU: 0 PID: 172 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    5.194639] task: c2410e80 ti: c2502000 task.ti: c2502000
[    5.195324] EIP: 0060:[<b1059d0b>] EFLAGS: 00010002 CPU: 0
[    5.196029] EIP is at sched_slice+0x33/0x6c
[    5.196656] EAX: 60855d03 EBX: 63e1a667 ECX: b0110300 EDX: 0018b3a0
[    5.197452] ESI: 00000400 EDI: 00000000 EBP: c2503e60 ESP: c2503e4c
[    5.198244]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.198937] CR0: 80050033 CR2: 63e1a683 CR3: 1255b000 CR4: 000006d0
[    5.199737] Stack:
[    5.200003]  00000800 001fffff c2410784 000232f8 00000000 c2503e78 b105a=
5b8 c2410784
[    5.201126]  c2410784 c2410ec4 c108da80 c2503ea4 b105a6d6 00000000 00000=
282 b0112a80
[    5.202254]  c2410818 b0112e40 c2410740 c2410740 00000000 c2410904 c2503=
ebc b105515b
[    5.203384] Call Trace:
[    5.203708]  [<b105a5b8>] place_entity+0x21/0x82
[    5.204303]  [<b105a6d6>] task_fork_fair+0xbd/0x12d
[    5.204930]  [<b105515b>] sched_fork+0x13e/0x1dc
[    5.205530]  [<b103be2f>] copy_process+0x45d/0x1198
[    5.206156]  [<b1052f5f>] ? __might_sleep+0x6b/0x72
[    5.206788]  [<b10c36e5>] ? arch_local_irq_save+0x11/0x16
[    5.207517]  [<b10b3c90>] ? anon_vma_interval_tree_verify+0x36/0x5d
[    5.208247]  [<b10b9cf3>] ? validate_mm+0x188/0x1e3
[    5.208872]  [<b103cc78>] _do_fork+0x5b/0x198
[    5.209394]  [<b103ce21>] SyS_clone+0x19/0x1b
[    5.209904]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.210511]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.211098] Code: 83 ec 08 83 7a 1c 00 0f 94 c2 0f b6 d2 01 d0 3b 05 3c =
f5 4d b1 76 09 0f af 05 44 f5 4d b1 eb 05 a1 50 f5 4d b1 31 d2 85 db 74 31 =
<83> 7b 1c 00 8b 4b 50 75 1a 8b 31 8b 79 04 89 75 ec 89 7d f0 8b
[    5.214420] EIP: [<b1059d0b>] sched_slice+0x33/0x6c SS:ESP 0068:c2503e4c
[    5.215308] CR2: 0000000063e1a683
[    5.215709] ---[ end trace 4692ab1f29e5bc68 ]---
[    5.216245] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-79:20151227015945:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.265147] mount (136) used greatest stack depth: 6748 bytes left
[    5.294087] initctl (159) used greatest stack depth: 6732 bytes left
[    5.298552] stop (161) used greatest stack depth: 6708 bytes left
[    5.311826] BUG: spinlock cpu recursion on CPU#0, init/176
[    5.312656] BUG: unable to handle kernel paging request at dead50b1
[    5.313565] IP: [<b1065a80>] spin_dump+0x43/0x79
[    5.314229] *pde =3D 00000000 =

[    5.314645] Oops: 0000 [#1] PREEMPT SMP =

[    5.315240] Modules linked in:
[    5.315677] CPU: 0 PID: 176 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    5.316638] task: b0104fc0 ti: c2568000 task.ti: c2568000
[    5.317368] EIP: 0060:[<b1065a80>] EFLAGS: 00210282 CPU: 0
[    5.318118] EIP is at spin_dump+0x43/0x79
[    5.318667] EAX: 0000002e EBX: dead4ead ECX: 0000002e EDX: 00000000
[    5.319503] ESI: b010e7c8 EDI: 12589067 EBP: c2569e6c ESP: c2569e64
[    5.320341]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.321062] CR0: 8005003b CR2: dead50b1 CR3: 1257b000 CR4: 000006d0
[    5.321930] Stack:
[    5.322217]  b010e7c8 c24a7de0 c2569e7c b1065ad3 b1445a39 b010e7c8 c2569=
e98 b1065b6a
[    5.323403]  00000000 00000000 00000001 c24a7de0 12589067 c2569ea0 b12f2=
c57 c2569efc
[    5.324589]  b10b8238 00000000 00000000 00000000 c2571c00 00000498 c2589=
498 b010e7c8
[    5.325800] Call Trace:
[    5.326140]  [<b1065ad3>] spin_bug+0x1d/0x21
[    5.326725]  [<b1065b6a>] do_raw_spin_lock+0x4c/0xf1
[    5.327401]  [<b12f2c57>] _raw_spin_lock+0xf/0x11
[    5.328033]  [<b10b8238>] handle_mm_fault+0x9fc/0xeac
[    5.328720]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[    5.329403]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    5.330181]  [<b102fd9e>] __do_page_fault+0x1ca/0x357
[    5.330859]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    5.331621]  [<b102ffe7>] do_page_fault+0x1a/0x1e
[    5.332258]  [<b102e216>] do_async_page_fault+0x22/0x46
[    5.332953]  [<b12f3df0>] error_code+0x30/0x40
[    5.333575]  [<b10400d8>] ? cpu_callback+0x1b/0xc7
[    5.334234]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    5.334990]  [<b115205a>] ? __put_user_4+0x1a/0x30
[    5.335640]  [<b10553f8>] ? schedule_tail+0x4f/0x5b
[    5.336300]  [<b12f30c6>] ret_from_fork+0x6/0x30
[    5.336922] Code: 57 b1 ff b0 04 02 00 00 05 f4 02 00 00 50 64 8b 0d f0 =
20 57 b1 51 52 68 a8 59 44 b1 e8 9a ac 03 00 83 c4 14 85 db 8b 56 08 74 0e =
<8b> 83 04 02 00 00 81 c3 f4 02 00 00 eb 08 83 c8 ff bb b3 57 46
[    5.340688] EIP: [<b1065a80>] spin_dump+0x43/0x79 SS:ESP 0068:c2569e64
[    5.341622] CR2: 00000000dead50b1
[    5.342080] ---[ end trace 92da8f6427d02b20 ]---
[    5.342707] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-79:20151227020120:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.481997] mountall (119) used greatest stack depth: 6688 bytes left
[    5.506991] init: Failed to create pty - disabling logging for job
[    5.507923] init: Temporary process spawn error: No space left on device
[    5.566670] BUG: spinlock bad magic on CPU#1, sysctl/172
[    5.567559]  lock: 0xb010e7a0, .magic: ffffffff, .owner: <none>/-1, .own=
er_cpu: -1
[    5.568709] CPU: 1 PID: 172 Comm: sysctl Not tainted 4.4.0-rc4-00029-gc7=
af9d5 #1
[    5.569892]  00000000 00000000 c25b9df4 b114a4ae b14657b3 c25b9e1c b1065=
aac b14459cd
[    5.571284]  b010e7a0 ffffffff b14657b3 ffffffff ffffffff b010e7a0 09561=
000 c25b9e2c
[    5.572563]  b1065ad3 b1445a2f b010e7a0 c25b9e48 b1065b3c c135dbc8 00000=
246 09561000
[    5.573877] Call Trace:
[    5.574238]  [<b114a4ae>] dump_stack+0x48/0x69
[    5.574936]  [<b1065aac>] spin_dump+0x6f/0x79
[    5.575584]  [<b1065ad3>] spin_bug+0x1d/0x21
[    5.575793] mountall (123) used greatest stack depth: 6388 bytes left
[    5.577192]  [<b1065b3c>] do_raw_spin_lock+0x1e/0xf1
[    5.577926]  [<b12f2c57>] _raw_spin_lock+0xf/0x11
[    5.577933]  [<b10b65da>] unmap_single_vma+0x197/0x38e
[    5.577935]  [<b10b697c>] unmap_vmas+0x27/0x36
[    5.577937]  [<b10bb102>] exit_mmap+0x45/0xaf
[    5.577941]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[    5.577944]  [<b1052f5f>] ? __might_sleep+0x6b/0x72
[    5.577947]  [<b10763b0>] ? hrtimer_try_to_cancel+0xe/0x75
[    5.577952]  [<b103b841>] mmput+0x45/0x81
[    5.577953]  [<b103f235>] do_exit+0x2bd/0x75b
[    5.577956]  [<b10d06d3>] ? fput+0xe/0x75
[    5.577959]  [<b10ce2d3>] ? filp_close+0x48/0x52
[    5.577961]  [<b103f72a>] do_group_exit+0x30/0x84
[    5.577963]  [<b103f78f>] SyS_exit_group+0x11/0x11
[    5.577966]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.577968]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.589385] init: Failed to open system console: Input/output error
[    5.592899] init: plymouth-log main process (175) terminated with status=
 1
[    5.610588] udevd[180]: starting version 175

dmesg-quantal-ivb41-79:20151227020235:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

udevd[195]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:LNX=
CPU:': No such file or directory
udevd[196]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:PNP=
0103:': No such file or directory
udevd[202]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:PNP=
0C0F:': No such file or directory
[    5.160120] BUG: unable to handle kernel NULL pointer dereference at 000=
00001
[    5.161019] IP: [<b10c5f72>] __kmalloc+0x8e/0x121
[    5.161026] *pde =3D 00000000 =

[    5.161028] Oops: 0000 [#1] PREEMPT SMP =

[    5.161029] Modules linked in:
[    5.161032] CPU: 1 PID: 180 Comm: udevadm Not tainted 4.4.0-rc4-00029-gc=
7af9d5 #1
[    5.161033] task: c2411d00 ti: c2598000 task.ti: c2598000
[    5.161035] EIP: 0060:[<b10c5f72>] EFLAGS: 00010246 CPU: 1
[    5.161037] EIP is at __kmalloc+0x8e/0x121
[    5.161038] EAX: 00000001 EBX: 00000001 ECX: 00003401 EDX: b15796f0
[    5.161039] ESI: b0098e00 EDI: 024000c0 EBP: c2599e10 ESP: c2599df0
[    5.161040]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.161041] CR0: 80050033 CR2: 00000001 CR3: 125a8000 CR4: 000006d0
[    5.161044] Stack:
[    5.161048]  b1234486 00000001 00000000 b15064a0 00003401 c2454a1c 00000=
040 b147f449
[    5.161051]  c2599e38 b1234486 b0124000 00000000 c2454a00 c26b1000 00000=
000 b0124000
[    5.161054]  c2454a24 c2454a1c c2599e5c b11da72e b114c62e c2599e60 b0124=
000 b1330240
[    5.161054] Call Trace:
[    5.161058]  [<b1234486>] ? power_supply_uevent+0x11c/0x1a2
[    5.161061]  [<b1234486>] power_supply_uevent+0x11c/0x1a2
[    5.161063]  [<b11da72e>] dev_uevent+0x132/0x14e
[    5.161066]  [<b114c62e>] ? add_uevent_var+0x3f/0x97
[    5.161068]  [<b11da5fc>] ? device_get_devnode+0xad/0xad
[    5.161070]  [<b114c82d>] kobject_uevent_env+0x14c/0x2f3
[    5.161073]  [<b114c9de>] kobject_uevent+0xa/0xc
[    5.161074]  [<b11d97c0>] uevent_store+0x23/0x3a
[    5.161076]  [<b11d979d>] ? dev_err+0x2a/0x2a
[    5.161078]  [<b11d8e56>] dev_attr_store+0x13/0x20
[    5.161081]  [<b1107e71>] sysfs_kf_write+0x2d/0x36
[    5.161083]  [<b1107e44>] ? sysfs_notify+0x5a/0x5a
[    5.161085]  [<b1107883>] kernfs_fop_write+0xcd/0x10b
[    5.161087]  [<b11077b6>] ? kernfs_fop_open+0x25f/0x25f
[    5.161089]  [<b10cf876>] __vfs_write+0x1d/0x8f
[    5.161093]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[    5.161095]  [<b1052f5f>] ? __might_sleep+0x6b/0x72
[    5.161097]  [<b10c6843>] ? kmem_cache_free+0x9f/0xce
[    5.161099]  [<b10d8fc5>] ? putname+0x3f/0x42
[    5.161101]  [<b1064162>] ? percpu_down_read+0x23/0x40
[    5.161103]  [<b10cfccd>] vfs_write+0x70/0x96
[    5.161105]  [<b10d0187>] SyS_write+0x44/0x6b
[    5.161107]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.161110]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.161133] Code: f0 75 e8 8b 18 85 db 75 16 8b 4d e0 89 fa 89 f0 e8 fd =
fd ff ff 89 c3 8b 06 64 ff 40 14 eb 75 8b 46 14 01 d8 f6 06 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 58 d7 ff ff 8b 16 89 45 e4 64 8b 0a 39 cb c7
[    5.161136] EIP: [<b10c5f72>] __kmalloc+0x8e/0x121 SS:ESP 0068:c2599df0
[    5.161136] CR2: 0000000000000001
[    5.163435] ---[ end trace c5878eb3801de62c ]---
[    5.163436] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-7:20151227020223:i386-randconfig-h0-12261754:4.4.0-rc4-=
00029-gc7af9d5:1

[    5.116572] mount (136) used greatest stack depth: 6748 bytes left
[    5.141844] initctl (159) used greatest stack depth: 6712 bytes left
[    5.147599] stop (161) used greatest stack depth: 6708 bytes left
[    5.152491] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    5.153639] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    5.154385] *pde =3D 00000000 =

[    5.154811] Oops: 0000 [#1] PREEMPT SMP =

[    5.155421] Modules linked in:
[    5.155867] CPU: 1 PID: 173 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    5.156985] task: c2413a00 ti: c25d8000 task.ti: c25d8000
[    5.157737] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 1
[    5.158508] EIP is at set_next_entity+0x3e/0x64
[    5.159131] EAX: 00000000 EBX: c2413a44 ECX: 00000000 EDX: c2413a44
[    5.159993] ESI: bc3b6700 EDI: c2413a00 EBP: c25d9f08 ESP: c25d9efc
[    5.160831]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.161655] CR0: 8005003b CR2: 000004ec CR3: 1259d000 CR4: 000006d0
[    5.162616] Stack:
[    5.162941]  c2413a44 c109da80 c2413a00 c25d9f14 b105b35e c2413a00 c25d9=
f34 b1057eb2
[    5.164284]  b158e5c0 00000001 00000086 c2413a00 b010ac40 c2413a00 c25d9=
f50 b1062211
[    5.165651]  bc3def00 00000282 bd961640 c2413a00 b0113a80 c25d9f64 b1062=
2d8 bd5d2280
[    5.166993] Call Trace:
[    5.167387]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    5.168187]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    5.168921]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.169666]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.170527]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.171155]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.171895]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.172619] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    5.175619] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c25d=
9efc
[    5.176220] CR2: 00000000000004ec
[    5.176503] ---[ end trace 457fb066a95d7dd0 ]---
[    5.176883] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-81:20151227015841:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    4.931336] init: Temporary process spawn error: No space left on device
[    4.959070] sh (146) used greatest stack depth: 6748 bytes left
[    4.961313] initctl (157) used greatest stack depth: 6388 bytes left
[    4.971004] BUG: unable to handle kernel paging request at 00005403
[    4.971586] IP: [<b10c5f72>] __kmalloc+0x8e/0x121
[    4.971997] *pde =3D 00000000 =

[    4.972251] Oops: 0000 [#1] PREEMPT SMP =

[    4.972609] Modules linked in:
[    4.972876] CPU: 0 PID: 170 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    4.973469] task: c2412440 ti: c258a000 task.ti: c258a000
[    4.973911] EIP: 0060:[<b10c5f72>] EFLAGS: 00010246 CPU: 0
[    4.974387] EIP is at __kmalloc+0x8e/0x121
[    4.974722] EAX: 00005403 EBX: 00005403 ECX: 000548a0 EDX: b15796f0
[    4.975249] ESI: b0098e00 EDI: 024080c0 EBP: c258bf1c ESP: c258befc
[    4.975755]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    4.976214] CR0: 8005003b CR2: 00005403 CR3: 125a3000 CR4: 000006d0
[    4.976721] Stack:
[    4.976892]  b105a3e3 00000246 00005403 00000001 000548a0 c24a5300 b158e=
5c0 c24a5300
[    4.977638]  c258bf24 b105a3e3 c258bf40 b105d658 b158e5c0 b158e5c0 c24a5=
300 b158e5c0
[    4.978366]  c2412440 c258bf50 b1057c85 bd961c40 c2412440 c258bf64 b1062=
247 bd961c00
[    4.979117] Call Trace:
[    4.979325]  [<b105a3e3>] ? kzalloc+0xd/0xf
[    4.979757]  [<b105a3e3>] kzalloc+0xd/0xf
[    4.980184]  [<b105d658>] alloc_fair_sched_group+0x33/0xc9
[    4.980650]  [<b1057c85>] sched_create_group+0x23/0x4a
[    4.981075]  [<b1062247>] sched_autogroup_create_attach+0x27/0xc7
[    4.981592]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    4.981962]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    4.982380]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    4.982787] Code: f0 75 e8 8b 18 85 db 75 16 8b 4d e0 89 fa 89 f0 e8 fd =
fd ff ff 89 c3 8b 06 64 ff 40 14 eb 75 8b 46 14 01 d8 f6 06 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 58 d7 ff ff 8b 16 89 45 e4 64 8b 0a 39 cb c7
[    4.985104] EIP: [<b10c5f72>] __kmalloc+0x8e/0x121 SS:ESP 0068:c258befc
[    4.985661] CR2: 0000000000005403
[    4.985976] ---[ end trace 5c6b3e6e46036266 ]---
[    4.986366] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-84:20151227020058:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.202046] init: Temporary process spawn error: No space left on device
[    5.219414] sh (136) used greatest stack depth: 6748 bytes left
[    5.233340] initctl (157) used greatest stack depth: 6708 bytes left
[    5.246611] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    5.247524] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    5.248172] *pde =3D 00000000 =

[    5.248522] Oops: 0000 [#1] PREEMPT SMP =

[    5.249064] Modules linked in:
[    5.249436] CPU: 1 PID: 173 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    5.250297] task: b01bf400 ti: c25cc000 task.ti: c25cc000
[    5.250953] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 1
[    5.251575] EIP is at set_next_entity+0x3e/0x64
[    5.252135] EAX: 00000000 EBX: b01bf444 ECX: 00000000 EDX: b01bf444
[    5.252886] ESI: c24a7e00 EDI: b01bf400 EBP: c25cdf08 ESP: c25cdefc
[    5.253400]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.253869] CR0: 8005003b CR2: 000004ec CR3: 125c9000 CR4: 000006d0
[    5.254377] Stack:
[    5.254549]  b01bf444 c109da80 b01bf400 c25cdf14 b105b35e b01bf400 c25cd=
f34 b1057eb2
[    5.255293]  b158e5c0 00000001 00000086 b01bf400 b0191e00 b01bf400 c25cd=
f50 b1062211
[    5.256037]  c2405680 00000282 b010aa00 b01bf400 bc38f6c0 c25cdf64 b1062=
2d8 c24e5580
[    5.256776] Call Trace:
[    5.256992]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    5.257416]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    5.257832]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    5.258274]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    5.258791]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.259159]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.259617]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.260061] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    5.262417] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c25c=
defc
[    5.263041] CR2: 00000000000004ec
[    5.263314] ---[ end trace 2fdabd87bac255de ]---
[    5.263709] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-84:20151227020151:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.105014] init: Failed to create pty - disabling logging for job
[    5.105690] init: Temporary process spawn error: No space left on device
[    5.135640] initctl (160) used greatest stack depth: 6676 bytes left
[    5.148164] BUG: unable to handle kernel paging request at ffffffff
[    5.149083] IP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9
[    5.149871] *pde =3D 0157e063 *pte =3D 00000000 =

[    5.150553] Oops: 0000 [#1] PREEMPT SMP =

[    5.151191] Modules linked in:
[    5.151602] CPU: 0 PID: 174 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    5.151734] mountall (124) used greatest stack depth: 6404 bytes left
[    5.153764] task: b0104140 ti: c25bc000 task.ti: c25bc000
[    5.154555] EIP: 0060:[<b10c5df7>] EFLAGS: 00010246 CPU: 0
[    5.155347] EIP is at kmem_cache_alloc+0x64/0xe9
[    5.155348] EAX: ffffffff EBX: b0098d00 ECX: 000255e0 EDX: b1579768
[    5.155349] ESI: ffffffff EDI: b10b6ca9 EBP: c25bde24 ESP: c25bde08
[    5.155352]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.155353] CR0: 80050033 CR2: ffffffff CR3: 12561000 CR4: 000006d0
[    5.155356] Stack:
[    5.155360]  b10b6ca9 b151e840 000255e0 024000c0 c13898e0 c25b1600 c2593=
af8 c25bde30
[    5.155364]  b10b6ca9 c13898e0 c25bde3c b1032f75 c25b1600 c25bde54 b10b6=
cde c25b1600
[    5.155367]  c25b1600 af8c6000 c25bdeac c25bdeb8 b10b6fd6 af8c6000 c25be=
000 af8e7fff
[    5.155367] Call Trace:
[    5.155372]  [<b10b6ca9>] ? ptlock_alloc+0x15/0x25
[    5.155375]  [<b10b6ca9>] ptlock_alloc+0x15/0x25
[    5.155377]  [<b1032f75>] pte_alloc_one+0x35/0x6b
[    5.155380]  [<b10b6cde>] __pte_alloc+0x13/0x9d
[    5.155382]  [<b10b6fd6>] copy_page_range+0x26e/0x3da
[    5.155385]  [<b10b3700>] ? __anon_vma_interval_tree_augment_propagate+0=
x28/0x28
[    5.155387]  [<b10b9670>] ? vma_gap_callbacks_rotate+0x14/0x1a
[    5.155390]  [<b103c583>] copy_process+0xbb1/0x1198
[    5.155393]  [<b103cc78>] _do_fork+0x5b/0x198
[    5.155396]  [<b1046f35>] ? SyS_rt_sigaction+0x49/0x7e
[    5.155398]  [<b103ce21>] SyS_clone+0x19/0x1b
[    5.155400]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.155403]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.155426] Code: 75 e8 8b 30 85 f6 75 17 8b 4d e4 8b 55 f0 89 d8 e8 78 =
ff ff ff 89 c6 8b 03 64 ff 40 14 eb 66 8b 43 14 01 f0 f6 03 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 d3 d8 ff ff 8b 13 31 c9 64 8b 3a 39 fe 75 20
[    5.155429] EIP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9 SS:ESP 0068:c25=
bde08
[    5.155430] CR2: 00000000ffffffff
[    5.155431] ---[ end trace ea661f29ad99e91c ]---
[    5.155433] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-85:20151227020052:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.380729] init: Failed to create pty - disabling logging for job
[    5.381475] init: Temporary process spawn error: No space left on device
[    5.417450] initctl (155) used greatest stack depth: 6388 bytes left
[    5.433766] BUG: spinlock bad magic on CPU#1, upstart-udev-br/172
[    5.434667]  lock: 0xb010e6e0, .magic: ffffffff, .owner: <none>/-1, .own=
er_cpu: -1
[    5.434673] CPU: 1 PID: 172 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    5.434679]  00000000 00000000 c2563dfc b114a4ae b14657b3 c2563e24 b1065=
aac b14459cd
[    5.434683]  b010e6e0 ffffffff b14657b3 ffffffff ffffffff b010e6e0 a758d=
000 c2563e34
[    5.434686]  b1065ad3 b1445a2f b010e6e0 c2563e50 b1065b3c c2563e54 b10b6=
d30 00000634
[    5.434687] Call Trace:
[    5.434693]  [<b114a4ae>] dump_stack+0x48/0x69
[    5.434696]  [<b1065aac>] spin_dump+0x6f/0x79
[    5.434698]  [<b1065ad3>] spin_bug+0x1d/0x21
[    5.434700]  [<b1065b3c>] do_raw_spin_lock+0x1e/0xf1
[    5.434705]  [<b10b6d30>] ? __pte_alloc+0x65/0x9d
[    5.434709]  [<b12f2c57>] _raw_spin_lock+0xf/0x11
[    5.434712]  [<b10b6efd>] copy_page_range+0x195/0x3da
[    5.434714]  [<b10b3700>] ? __anon_vma_interval_tree_augment_propagate+0=
x28/0x28
[    5.434720]  [<b103c583>] copy_process+0xbb1/0x1198
[    5.434723]  [<b103cc78>] _do_fork+0x5b/0x198
[    5.434726]  [<b103ce21>] SyS_clone+0x19/0x1b
[    5.434728]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.434731]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.461312] init: plymouth-log main process (174) terminated with status=
 1


dmesg-quantal-ivb41-86:20151227020133:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.219538] init: Failed to create pty - disabling logging for job
[    5.220162] init: Temporary process spawn error: No space left on device
[    5.245990] initctl (159) used greatest stack depth: 6400 bytes left
[    5.261659] BUG: spinlock bad magic on CPU#1, upstart-udev-br/175
[    5.262233]  lock: 0xb010e6e0, .magic: ffffffff, .owner: <none>/-1, .own=
er_cpu: -1
[    5.262883] CPU: 1 PID: 175 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    5.263629]  00000000 00000000 c2599e94 b114a4ae b14657b3 c2599ebc b1065=
aac b14459cd
[    5.264475]  b010e6e0 ffffffff b14657b3 ffffffff ffffffff b010e6e0 c2589=
000 c2599ecc
[    5.264916]  b1065ad3 b1445a2f b010e6e0 c2599ee8 b1065b3c 00000246 b0125=
000 755c5000
[    5.264919] Call Trace:
[    5.264924]  [<b114a4ae>] dump_stack+0x48/0x69
[    5.264926]  [<b1065aac>] spin_dump+0x6f/0x79
[    5.264927]  [<b1065ad3>] spin_bug+0x1d/0x21
[    5.264928]  [<b1065b3c>] do_raw_spin_lock+0x1e/0xf1
[    5.264931]  [<b12f2c57>] _raw_spin_lock+0xf/0x11
[    5.264933]  [<b10b7d12>] handle_mm_fault+0x4d6/0xeac
[    5.264936]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[    5.264938]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    5.264951]  [<b102fd9e>] __do_page_fault+0x1ca/0x357
[    5.264952]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    5.264954]  [<b102ffe7>] do_page_fault+0x1a/0x1e
[    5.264955]  [<b102e216>] do_async_page_fault+0x22/0x46
[    5.264957]  [<b12f3df0>] error_code+0x30/0x40
[    5.264958]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    5.277913] udevd[178]: starting version 175
[    5.297085] init: plymouth-log main process (177) terminated with status=
 1
udevd[188]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:LNX=
SYSTM:': No such file or directory

dmesg-quantal-ivb41-87:20151227020041:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.197459] init: Failed to create pty - disabling logging for job
[    5.198326] init: Temporary process spawn error: No space left on device
[    5.237876] initctl (158) used greatest stack depth: 6712 bytes left
[    5.262827] BUG: spinlock bad magic on CPU#1, sh/178
[    5.263543]  lock: 0xbd39fbb0, .magic: 00000200, .owner: <none>/-1, .own=
er_cpu: -1
[    5.264565] CPU: 1 PID: 178 Comm: sh Not tainted 4.4.0-rc4-00029-gc7af9d=
5 #1
[    5.265583]  00000000 00000000 c258fe94 b114a4ae b14657b3 c258febc b1065=
aac b14459cd
[    5.266777]  bd39fbb0 00000200 b14657b3 ffffffff ffffffff bd39fbb0 c24b8=
780 c258fecc
[    5.267964]  b1065ad3 b1445a2f bd39fbb0 c258fee8 b1065b3c 024000c0 c10e4=
0e0 00000000
[    5.269239] Call Trace:
[    5.269616]  [<b114a4ae>] dump_stack+0x48/0x69
[    5.270234]  [<b1065aac>] spin_dump+0x6f/0x79
[    5.270861]  [<b1065ad3>] spin_bug+0x1d/0x21
[    5.271498]  [<b1065b3c>] do_raw_spin_lock+0x1e/0xf1
[    5.272362]  [<b12f2c57>] _raw_spin_lock+0xf/0x11
[    5.272980]  [<b10b7ba1>] handle_mm_fault+0x365/0xeac
[    5.273664]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    5.274483]  [<b102fd9e>] __do_page_fault+0x1ca/0x357
[    5.275248]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    5.276033]  [<b102ffe7>] do_page_fault+0x1a/0x1e
[    5.276746]  [<b102e216>] do_async_page_fault+0x22/0x46
[    5.277530]  [<b12f3df0>] error_code+0x30/0x40
[    5.278135]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    5.279880] init: plymouth-log main process (179) terminated with status=
 1
[    5.306596] power_supply test_ac: uevent
[    5.307168] power_supply test_ac: POWER_SUPPLY_NAME=3Dtest_ac

dmesg-quantal-ivb41-89:20151227020219:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    4.959947] init: Temporary process spawn error: No space left on device
[    4.964037] sh (134) used greatest stack depth: 6876 bytes left
[    4.995874] initctl (160) used greatest stack depth: 6808 bytes left
[    5.009048] BUG: spinlock bad magic on CPU#1, upstart-udev-br/173
[    5.009639]  lock: 0xb010e8b0, .magic: ffffffff, .owner: <none>/-1, .own=
er_cpu: -1
[    5.010446] CPU: 1 PID: 173 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    5.011197]  00000000 00000000 c256fdfc b114a4ae b14657b3 c256fe24
[    5.011850] mountall (124) used greatest stack depth: 6404 bytes left

[    5.012573]  b1065aac b14459cd
[    5.012836]  b010e8b0 ffffffff b14657b3 ffffffff ffffffff b010e8b0 afab4=
000 c256fe34
[    5.012838]  b1065ad3 b1445a2f b010e8b0 c256fe50 b1065b3c c256fe54 b10b6=
d30 00000ad0
[    5.012838] Call Trace:
[    5.012843]  [<b114a4ae>] dump_stack+0x48/0x69
[    5.012846]  [<b1065aac>] spin_dump+0x6f/0x79
[    5.012849]  [<b1065ad3>] spin_bug+0x1d/0x21
[    5.012850]  [<b1065b3c>] do_raw_spin_lock+0x1e/0xf1
[    5.012854]  [<b10b6d30>] ? __pte_alloc+0x65/0x9d
[    5.012857]  [<b12f2c57>] _raw_spin_lock+0xf/0x11
[    5.012860]  [<b10b6efd>] copy_page_range+0x195/0x3da
[    5.012862]  [<b10b3700>] ? __anon_vma_interval_tree_augment_propagate+0=
x28/0x28
[    5.012867]  [<b103c583>] copy_process+0xbb1/0x1198
[    5.012869]  [<b103cc78>] _do_fork+0x5b/0x198
[    5.012872]  [<b103ce21>] SyS_clone+0x19/0x1b
[    5.012874]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.012876]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.038736] init: plymouth-log main process (175) terminated with status=
 1


dmesg-quantal-ivb41-8:20151227015536:i386-randconfig-h0-12261754:4.4.0-rc4-=
00029-gc7af9d5:1

[    4.887228] init: Temporary process spawn error: No space left on device
[    4.913478] initctl (159) used greatest stack depth: 6708 bytes left
[    4.914250] 00-header (158) used greatest stack depth: 6408 bytes left
[    4.929598] BUG: unable to handle kernel paging request at ffffffff
[    4.930197] IP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9
[    4.930664] *pde =3D 0157e063 *pte =3D 00000000 =

[    4.931033] Oops: 0000 [#1] PREEMPT SMP =

[    4.931455] Modules linked in:
[    4.931720] CPU: 1 PID: 1 Comm: init Not tainted 4.4.0-rc4-00029-gc7af9d=
5 #1
[    4.932330] task: b0040000 ti: b0016000 task.ti: b0016000
[    4.932816] EIP: 0060:[<b10c5df7>] EFLAGS: 00010246 CPU: 1
[    4.933296] EIP is at kmem_cache_alloc+0x64/0xe9
[    4.933702] EAX: ffffffff EBX: b0098d00 ECX: 00009321 EDX: b1579768
[    4.934261] ESI: ffffffff EDI: b10b6ca9 EBP: b0017e24 ESP: b0017e08
[    4.934809]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    4.935241] CR0: 80050033 CR2: ffffffff CR3: 12469000 CR4: 000006d0
[    4.935811] Stack:
[    4.936002]  b10b6ca9 b151e840 00009321 024000c0 c1389ea8 c24ca200 c2567=
758 b0017e30
[    4.936762]  b10b6ca9 c1389ea8 b0017e3c b1032f75 c24ca200 b0017e54 b10b6=
cde c24ca200
[    4.937528]  c24ca200 75b0e000 b0017eac b0017eb8 b10b6fd6 75b0e000 b0018=
000 75b4efff
[    4.938288] Call Trace:
[    4.938527]  [<b10b6ca9>] ? ptlock_alloc+0x15/0x25
[    4.938959]  [<b10b6ca9>] ptlock_alloc+0x15/0x25
[    4.939373]  [<b1032f75>] pte_alloc_one+0x35/0x6b
[    4.939764]  [<b10b6cde>] __pte_alloc+0x13/0x9d
[    4.940131]  [<b10b6fd6>] copy_page_range+0x26e/0x3da
[    4.940606]  [<b10b3700>] ? __anon_vma_interval_tree_augment_propagate+0=
x28/0x28
[    4.941194]  [<b10b3a80>] ? anon_vma_interval_tree_insert+0x73/0x79
[    4.941765]  [<b103c583>] copy_process+0xbb1/0x1198
[    4.942198]  [<b103cc78>] _do_fork+0x5b/0x198
[    4.942557]  [<b1152773>] ? _copy_to_user+0x3f/0x48
[    4.942944]  [<b1043e8b>] ? copy_to_user+0x28/0x2d
[    4.943384]  [<b103ce21>] SyS_clone+0x19/0x1b
[    4.943834]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    4.944311]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    4.944771] Code: 75 e8 8b 30 85 f6 75 17 8b 4d e4 8b 55 f0 89 d8 e8 78 =
ff ff ff 89 c6 8b 03 64 ff 40 14 eb 66 8b 43 14 01 f0 f6 03 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 d3 d8 ff ff 8b 13 31 c9 64 8b 3a 39 fe 75 20
[    4.947225] EIP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9 SS:ESP 0068:b00=
17e08
[    4.947850] CR2: 00000000ffffffff
[    4.948145] ---[ end trace e8bd9027553fd876 ]---
[    4.948528] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-92:20151227015639:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.114249] init: Failed to create pty - disabling logging for job
[    5.115129] init: Temporary process spawn error: No space left on device
[    5.119523] sh (133) used greatest stack depth: 6748 bytes left
[    5.174993] BUG: unable to handle kernel NULL pointer dereference at 000=
00002
[    5.176162] IP: [<b10c5f72>] __kmalloc+0x8e/0x121
[    5.176903] *pde =3D 00000000 =

[    5.177391] Oops: 0000 [#1] PREEMPT SMP =

[    5.178094] Modules linked in:
[    5.178604] CPU: 1 PID: 173 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    5.179902] task: c2439d00 ti: c2574000 task.ti: c2574000
[    5.180764] EIP: 0060:[<b10c5f72>] EFLAGS: 00010246 CPU: 1
[    5.181045] mountall (120) used greatest stack depth: 6388 bytes left
[    5.182643] EIP is at __kmalloc+0x8e/0x121
[    5.183287] EAX: 00000002 EBX: 00000002 ECX: 00012961 EDX: b15796f0
[    5.184265] ESI: b0098e00 EDI: 024080c0 EBP: c2575f1c ESP: c2575efc
[    5.185260]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.185261] CR0: 8005003b CR2: 00000002 CR3: 124de000 CR4: 000006d0
[    5.185264] Stack:
[    5.185269]  b105a3e3 00000246 00000002 00000001 00012961 b0112840 b158e=
5c0 b0112840
[    5.185275]  c2575f24 b105a3e3 c2575f40 b105d658 b158e5c0 b158e5c0 b0112=
840 b158e5c0
[    5.185278]  c2439d00 c2575f50 b1057c85 bc582b40 c2439d00 c2575f64 b1062=
247 bc582c40
[    5.185279] Call Trace:
[    5.185284]  [<b105a3e3>] ? kzalloc+0xd/0xf
[    5.185287]  [<b105a3e3>] kzalloc+0xd/0xf
[    5.185290]  [<b105d658>] alloc_fair_sched_group+0x33/0xc9
[    5.185292]  [<b1057c85>] sched_create_group+0x23/0x4a
[    5.185295]  [<b1062247>] sched_autogroup_create_attach+0x27/0xc7
[    5.185298]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.185300]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.185303]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.185329] Code: f0 75 e8 8b 18 85 db 75 16 8b 4d e0 89 fa 89 f0 e8 fd =
fd ff ff 89 c3 8b 06 64 ff 40 14 eb 75 8b 46 14 01 d8 f6 06 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 58 d7 ff ff 8b 16 89 45 e4 64 8b 0a 39 cb c7
[    5.185333] EIP: [<b10c5f72>] __kmalloc+0x8e/0x121 SS:ESP 0068:c2575efc
[    5.185334] CR2: 0000000000000002
[    5.185367] ---[ end trace 659556f1dcdbda82 ]---
[    5.185368] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-95:20151227015712:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.086593] init: Failed to create pty - disabling logging for job
[    5.087592] init: Temporary process spawn error: No space left on device
[    5.121175] initctl (158) used greatest stack depth: 6708 bytes left
[    5.137021] BUG: unable to handle kernel paging request at ffffffff
[    5.138003] IP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9
[    5.138843] *pde =3D 0157e063 *pte =3D 00000000 =

[    5.139541] Oops: 0000 [#1] PREEMPT SMP =

[    5.140091] Modules linked in:
[    5.140376] CPU: 1 PID: 1 Comm: init Not tainted 4.4.0-rc4-00029-gc7af9d=
5 #1
[    5.141337] task: b0040000 ti: b0016000 task.ti: b0016000
[    5.142103] EIP: 0060:[<b10c5df7>] EFLAGS: 00010246 CPU: 1
[    5.142884] EIP is at kmem_cache_alloc+0x64/0xe9
[    5.143535] EAX: ffffffff EBX: b0098d00 ECX: 00008601 EDX: b1579768
[    5.144421] ESI: ffffffff EDI: b10b6ca9 EBP: b0017e24 ESP: b0017e08
[    5.145306]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.145922] CR0: 8005003b CR2: ffffffff CR3: 12462000 CR4: 000006d0
[    5.146533] Stack:
[    5.146714]  b10b6ca9 b151e840 00008601 024000c0 c1388300 c2506a00 c2509=
afc b0017e30
[    5.147498]  b10b6ca9 c1388300 b0017e3c b1032f75 c2506a00 b0017e54 b10b6=
cde c2506a00
[    5.148323]  c2506a00 afcf6000 b0017eac b0017eb8 b10b6fd6 afcf6000 b0018=
000 afd17fff
[    5.149049] Call Trace:
[    5.149384]  [<b10b6ca9>] ? ptlock_alloc+0x15/0x25
[    5.149895]  [<b10b6ca9>] ptlock_alloc+0x15/0x25
[    5.150274]  [<b1032f75>] pte_alloc_one+0x35/0x6b
[    5.150684]  [<b10b6cde>] __pte_alloc+0x13/0x9d
[    5.151057]  [<b10b6fd6>] copy_page_range+0x26e/0x3da
[    5.151474]  [<b10b3700>] ? __anon_vma_interval_tree_augment_propagate+0=
x28/0x28
[    5.152105]  [<b10b3a80>] ? anon_vma_interval_tree_insert+0x73/0x79
[    5.152623]  [<b103c583>] copy_process+0xbb1/0x1198
[    5.153071]  [<b103cc78>] _do_fork+0x5b/0x198
[    5.153430]  [<b1152773>] ? _copy_to_user+0x3f/0x48
[    5.153835]  [<b1043e8b>] ? copy_to_user+0x28/0x2d
[    5.154228]  [<b103ce21>] SyS_clone+0x19/0x1b
[    5.154585]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.155139]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.155622] Code: 75 e8 8b 30 85 f6 75 17 8b 4d e4 8b 55 f0 89 d8 e8 78 =
ff ff ff 89 c6 8b 03 64 ff 40 14 eb 66 8b 43 14 01 f0 f6 03 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 d3 d8 ff ff 8b 13 31 c9 64 8b 3a 39 fe 75 20
[    5.157948] EIP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9 SS:ESP 0068:b00=
17e08
[    5.158551] CR2: 00000000ffffffff
[    5.158869] ---[ end trace d45715d1772bb55a ]---
[    5.159319] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-97:20151227020242:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    4.950218] init: Failed to create pty - disabling logging for job
[    4.951126] init: Temporary process spawn error: No space left on device
[    4.981876] initctl (160) used greatest stack depth: 6744 bytes left
[    4.995341] BUG: unable to handle kernel NULL pointer dereference at 000=
00002
[    4.995976] IP: [<b10c5f72>] __kmalloc+0x8e/0x121
[    4.996379] *pde =3D 00000000 =

[    4.996638] Oops: 0000 [#1] PREEMPT SMP =

[    4.996990] Modules linked in:
[    4.997261] CPU: 1 PID: 176 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    4.997854] task: c2410000 ti: c255a000 task.ti: c255a000
[    4.998295] EIP: 0060:[<b10c5f72>] EFLAGS: 00010246 CPU: 1
[    4.998747] EIP is at __kmalloc+0x8e/0x121
[    4.999085] EAX: 00000002 EBX: 00000002 ECX: 00002de1 EDX: b15796f0
[    4.999597] ESI: b0098e00 EDI: 024080c0 EBP: c255bf1c ESP: c255befc
[    5.000105]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.000549] CR0: 8005003b CR2: 00000002 CR3: 12579000 CR4: 000006d0
[    5.001059] Stack:
[    5.001231]  b105a3e3 024080c0 00000000 c255bf10 00002de1 b0113b40 b158e=
5c0 b0113b40
[    5.001950]  c255bf24 b105a3e3 c255bf40 b105d640 b158e5c0 b158e5c0 b0113=
b40 b158e5c0
[    5.002671]  c2410000 c255bf50 b1057c85 bd9619c0 c2410000 c255bf64 b1062=
247 b0191a80
[    5.003384] Call Trace:
[    5.003599]  [<b105a3e3>] ? kzalloc+0xd/0xf
[    5.004034]  [<b105a3e3>] kzalloc+0xd/0xf
[    5.004460]  [<b105d640>] alloc_fair_sched_group+0x1b/0xc9
[    5.004903]  [<b1057c85>] sched_create_group+0x23/0x4a
[    5.005326]  [<b1062247>] sched_autogroup_create_attach+0x27/0xc7
[    5.005826]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    5.006189]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.006613]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.007025] Code: f0 75 e8 8b 18 85 db 75 16 8b 4d e0 89 fa 89 f0 e8 fd =
fd ff ff 89 c3 8b 06 64 ff 40 14 eb 75 8b 46 14 01 d8 f6 06 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 58 d7 ff ff 8b 16 89 45 e4 64 8b 0a 39 cb c7
[    5.009262] EIP: [<b10c5f72>] __kmalloc+0x8e/0x121 SS:ESP 0068:c255befc
[    5.009829] CR2: 0000000000000002
[    5.010136] ---[ end trace 636e0b85fb35ebff ]---
[    5.010527] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb41-99:20151227020012:i386-randconfig-h0-12261754:4.4.0-rc4=
-00029-gc7af9d5:1

[    5.390556] chgrp (150) used greatest stack depth: 6748 bytes left
[    5.394713] rm (155) used greatest stack depth: 6712 bytes left
[    5.400726] stop (160) used greatest stack depth: 6668 bytes left
[    5.413306] BUG: unable to handle kernel paging request
[    5.414012] mountall (124) used greatest stack depth: 6388 bytes left

[    5.415036]  at ffffffff
[    5.415036] IP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9
[    5.415048] *pde =3D 0157e063 *pte =3D 00000000 =

[    5.415051] Oops: 0000 [#1] PREEMPT SMP =

[    5.415053] Modules linked in:
[    5.415056] CPU: 0 PID: 173 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    5.415058] task: bc3cb2c0 ti: c256a000 task.ti: c256a000
[    5.415059] EIP: 0060:[<b10c5df7>] EFLAGS: 00010246 CPU: 0
[    5.415061] EIP is at kmem_cache_alloc+0x64/0xe9
[    5.415062] EAX: ffffffff EBX: b0098d00 ECX: 00023b80 EDX: b1579768
[    5.415063] ESI: ffffffff EDI: b10b6ca9 EBP: c256be24 ESP: c256be08
[    5.415065]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    5.415066] CR0: 80050033 CR2: ffffffff CR3: 12571000 CR4: 000006d0
[    5.415071] Stack:
[    5.415075]  b10b6ca9 b151e840 00023b80 024000c0 c138a0d8 c24e4600 c24da=
a74 c256be30
[    5.415078]  b10b6ca9 c138a0d8 c256be3c b1032f75 c24e4600 c256be54 b10b6=
cde c24e4600
[    5.415082]  c24e4600 a754e000 c256beac c256beb8 b10b6fd6 a754e000 c256c=
000 a754ffff
[    5.415083] Call Trace:
[    5.415093]  [<b10b6ca9>] ? ptlock_alloc+0x15/0x25
[    5.415096]  [<b10b6ca9>] ptlock_alloc+0x15/0x25
[    5.415102]  [<b1032f75>] pte_alloc_one+0x35/0x6b
[    5.415105]  [<b10b6cde>] __pte_alloc+0x13/0x9d
[    5.415107]  [<b10b6fd6>] copy_page_range+0x26e/0x3da
[    5.415110]  [<b10b3700>] ? __anon_vma_interval_tree_augment_propagate+0=
x28/0x28
[    5.415112]  [<b10b9670>] ? vma_gap_callbacks_rotate+0x14/0x1a
[    5.415118]  [<b103c583>] copy_process+0xbb1/0x1198
[    5.415120]  [<b103cc78>] _do_fork+0x5b/0x198
[    5.415123]  [<b103ce21>] SyS_clone+0x19/0x1b
[    5.415127]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    5.415131]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    5.415155] Code: 75 e8 8b 30 85 f6 75 17 8b 4d e4 8b 55 f0 89 d8 e8 78 =
ff ff ff 89 c6 8b 03 64 ff 40 14 eb 66 8b 43 14 01 f0 f6 03 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 d3 d8 ff ff 8b 13 31 c9 64 8b 3a 39 fe 75 20
[    5.415159] EIP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9 SS:ESP 0068:c25=
6be08
[    5.415160] CR2: 00000000ffffffff
[    5.415161] ---[ end trace d341a60b18f02e51 ]---
[    5.415163] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb42-105:20151227015655:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    7.393131] init: Failed to create pty - disabling logging for job
[    7.394005] init: Temporary process spawn error: No space left on device
[    7.457430] initctl (158) used greatest stack depth: 6688 bytes left
[    7.488930] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    7.489940] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    7.490596] *pde =3D 00000000 =

[    7.490973] Oops: 0000 [#1] PREEMPT SMP =

[    7.491515] Modules linked in:
[    7.491916] CPU: 1 PID: 173 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    7.492910] task: b01bba00 ti: c2578000 task.ti: c2578000
[    7.493581] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 1
[    7.494245] EIP is at set_next_entity+0x3e/0x64
[    7.494802] EAX: 00000000 EBX: b01bba44 ECX: 00000000 EDX: b01bba44
[    7.495561] ESI: c24ac900 EDI: b01bba00 EBP: c2579f08 ESP: c2579efc
[    7.496313]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    7.496978] CR0: 8005003b CR2: 000004ec CR3: 125aa000 CR4: 000006d0
[    7.497743] Stack:
[    7.498000]  b01bba44 c109da80 b01bba00 c2579f14 b105b35e b01bba00 c2579=
f34 b1057eb2
[    7.499089]  b158e5c0 00000001 00000086 b01bba00 c24c4000 b01bba00 c2579=
f50 b1062211
[    7.500184]  bf6c1900 00000282 c24e0f40 b01bba00 b01a5f00 c2579f64 b1062=
2d8 c24c4540
[    7.501256] Call Trace:
[    7.514577]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    7.515197]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    7.515795]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    7.516436]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    7.517189]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    7.517742]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    7.518372]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    7.518997] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    7.522389] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c257=
9efc
[    7.523284] CR2: 00000000000004ec
[    7.536526] ---[ end trace 3fc0ddb576df493e ]---
[    7.537096] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb42-105:20151227020114:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    7.667897] init: Failed to create pty - disabling logging for job
[    7.668778] init: Temporary process spawn error: No space left on device
[    7.746560] initctl (159) used greatest stack depth: 6388 bytes left
[    7.776121] BUG: unable to handle kernel paging request at 00005403
[    7.776952] IP: [<b10c5f72>] __kmalloc+0x8e/0x121
[    7.780273] *pde =3D 00000000 =

[    7.780664] Oops: 0000 [#1] PREEMPT SMP =

[    7.781235] Modules linked in:
[    7.781641] CPU: 1 PID: 178 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    7.782517] task: c2430000 ti: c25a0000 task.ti: c25a0000
[    7.783250] EIP: 0060:[<b10c5f72>] EFLAGS: 00010246 CPU: 1
[    7.783948] EIP is at __kmalloc+0x8e/0x121
[    7.784458] EAX: 00005403 EBX: 00005403 ECX: 00002861 EDX: b15796f0
[    7.785282] ESI: b0098e00 EDI: 024080c0 EBP: c25a1f1c ESP: c25a1efc
[    7.786149]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    7.786855] CR0: 8005003b CR2: 00005403 CR3: 124bd000 CR4: 000006d0
[    7.787660] Stack:
[    7.787916]  b105a3e3 00000246 00005403 00000001 00002861 c24836c0 b158e=
5c0 c24836c0
[    7.789093]  c25a1f24 b105a3e3 c25a1f40 b105d658 b158e5c0 b158e5c0 c2483=
6c0 b158e5c0
[    7.790202]  c2430000 c25a1f50 b1057c85 bd960bc0 c2430000 c25a1f64 b1062=
247 bd9608c0
[    7.791347] Call Trace:
[    7.791679]  [<b105a3e3>] ? kzalloc+0xd/0xf
[    7.792372]  [<b105a3e3>] kzalloc+0xd/0xf
[    7.793024]  [<b105d658>] alloc_fair_sched_group+0x33/0xc9
[    7.793717]  [<b1057c85>] sched_create_group+0x23/0x4a
[    7.794352]  [<b1062247>] sched_autogroup_create_attach+0x27/0xc7
[    7.795149]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    7.795723]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    7.796396]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    7.797038] Code: f0 75 e8 8b 18 85 db 75 16 8b 4d e0 89 fa 89 f0 e8 fd =
fd ff ff 89 c3 8b 06 64 ff 40 14 eb 75 8b 46 14 01 d8 f6 06 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 58 d7 ff ff 8b 16 89 45 e4 64 8b 0a 39 cb c7
[    7.800590] EIP: [<b10c5f72>] __kmalloc+0x8e/0x121 SS:ESP 0068:c25a1efc
[    7.801494] CR2: 0000000000005403
[    7.815042] ---[ end trace 737cfd969f43c8a9 ]---
[    7.815664] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb42-106:20151227015727:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    7.191116] init: Failed to create pty - disabling logging for job
[    7.192089] init: Temporary process spawn error: No space left on device
[    7.240372] initctl (159) used greatest stack depth: 6404 bytes left
[    7.264038] BUG: unable to handle kernel NULL pointer dereference at 000=
00030
[    7.267023] IP: [<b10599c8>] update_cfs_shares+0x56/0x88
[    7.269135] *pde =3D 00000000 =

[    7.269550] Oops: 0000 [#1] PREEMPT SMP =

[    7.270143] Modules linked in:
[    7.272611] CPU: 0 PID: 174 Comm: plymouth Not tainted 4.4.0-rc4-00029-g=
c7af9d5 #1
[    7.273628] task: bc3eecc0 ti: c24ec000 task.ti: c24ec000
[    7.274338] EIP: 0060:[<b10599c8>] EFLAGS: 00010082 CPU: 0
[    7.274995] EIP is at update_cfs_shares+0x56/0x88
[    7.275587] EAX: 00000000 EBX: b14f5640 ECX: 00000400 EDX: 00000000
[    7.276364] ESI: 00000002 EDI: 00000000 EBP: c24ede58 ESP: c24ede4c
[    7.278764]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    7.279383] CR0: 80050033 CR2: 00000030 CR3: 12562000 CR4: 000006d0
[    7.283164] Stack:
[    7.283410]  c246df00 bc3eed04 c108da80 c24ede78 b105b42a c108da80 00000=
001 00000001
[    7.284410]  c108da80 b12fc6c0 c108da80 c24ede90 b1053e7b bc3eecc0 00000=
001 00000000
[    7.285412]  bc3eef68 c24ede9c b105419e 00000000 c24edeb8 b12eff4d 00000=
000 bc3eecc0
[    7.289477] Call Trace:
[    7.289767]  [<b105b42a>] dequeue_task_fair+0xc4/0x11c
[    7.290362]  [<b1053e7b>] dequeue_task+0x23/0x29
[    7.290890]  [<b105419e>] deactivate_task+0x23/0x26
[    7.291487]  [<b12eff4d>] __schedule+0xdb/0x359
[    7.295123]  [<b12f01ec>] schedule+0x21/0x35
[    7.295667]  [<b12f2968>] schedule_hrtimeout_range_clock+0x82/0xbb
[    7.296431]  [<b107616b>] ? hrtimer_init_on_stack+0x58/0x58
[    7.301189]  [<b12f29ab>] schedule_hrtimeout_range+0xa/0xc
[    7.301878]  [<b10f1e77>] SYSC_epoll_wait+0x220/0x26e
[    7.302515]  [<b1054f87>] ? wake_up_q+0x36/0x36
[    7.303146]  [<b10f26a7>] SyS_epoll_wait+0x14/0x16
[    7.306789]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    7.307380]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    7.308019] Code: 49 70 89 d6 0f af f1 01 d7 74 07 89 f0 99 f7 ff 89 c6 =
83 fe 01 77 05 be 02 00 00 00 39 f1 73 02 89 ce 83 7b 1c 00 8b 7b 50 74 15 =
<3b> 5f 30 75 07 89 f8 e8 cc fc ff ff 89 da 89 f8 e8 e7 fe ff ff
[    7.314166] EIP: [<b10599c8>] update_cfs_shares+0x56/0x88 SS:ESP 0068:c2=
4ede4c
[    7.315023] CR2: 0000000000000030
[    7.315412] ---[ end trace 1e89ea2556ad43dd ]---
[    7.315415] BUG: unable to handle kernel NULL pointer dereference at 000=
00400

dmesg-quantal-ivb42-108:20151227020250:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    7.437650] init: Temporary process spawn error: No space left on device
[    7.491730] initctl (157) used greatest stack depth: 6708 bytes left
udevd[187]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:LNX=
SYSTM:': No such file or directory
[    7.589576] BUG: spinlock bad magic on CPU#1, upstart-udev-br/174

[    7.593455]  lock: 0xbca47690, .magic: ffffffff, .owner: <none>/-1, .own=
er_cpu: -1
[    7.594379] CPU: 1 PID: 174 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    7.595423]  00000000 00000000 c2591e94 b114a4ae b14657b3 c2591ebc b1065=
aac b14459cd
[    7.598576]  bca47690 ffffffff b14657b3 ffffffff ffffffff bca47690 c2570=
960 c2591ecc
[    7.599716]  b1065ad3 b1445a2f bca47690 c2591ee8 b1065b3c 024000c0 c1396=
ea0 00000000
[    7.600809] Call Trace:
[    7.601118]  [<b114a4ae>] dump_stack+0x48/0x69
[    7.601677]  [<b1065aac>] spin_dump+0x6f/0x79
[    7.602209]  [<b1065ad3>] spin_bug+0x1d/0x21
[    7.605782]  [<b1065b3c>] do_raw_spin_lock+0x1e/0xf1
[    7.606394]  [<b12f2c57>] _raw_spin_lock+0xf/0x11
[    7.606984]  [<b10b7ba1>] handle_mm_fault+0x365/0xeac
[    7.607620]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    7.608309]  [<b102fd9e>] __do_page_fault+0x1ca/0x357
[    7.611979]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    7.612685]  [<b102ffe7>] do_page_fault+0x1a/0x1e
[    7.613261]  [<b102e216>] do_async_page_fault+0x22/0x46
[    7.613912]  [<b12f3df0>] error_code+0x30/0x40
[    7.617515]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
udevd[231]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv platform=
:platform-framebuffer': No such file or directory
udevd[233]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:PNP=
0103:': No such file or directory
udevd[235]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v000=
08086d00007113sv00001AF4sd00001100bc06sc80i00': No such file or directory

dmesg-quantal-ivb42-117:20151227020135:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    6.109377] plymouthd (118) used greatest stack depth: 6772 bytes left
[    6.250331] init: Failed to create pty - disabling logging for job
[    6.251202] init: Temporary process spawn error: No space left on device
[    6.450421] BUG: unable to handle kernel paging request at 00005401
[    6.451096] udevd[177]: starting version 175
[    6.451762] IP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9
[    6.452422] *pde =3D 00000000 =

[    6.452793] Oops: 0000 [#1] PREEMPT SMP =

[    6.453329] Modules linked in:
[    6.453726] CPU: 0 PID: 1 Comm: init Not tainted 4.4.0-rc4-00029-gc7af9d=
5 #1
[    6.454583] task: b0040000 ti: b0016000 task.ti: b0016000
[    6.455248] EIP: 0060:[<b10c5df7>] EFLAGS: 00010246 CPU: 0
[    6.455922] EIP is at kmem_cache_alloc+0x64/0xe9
[    6.456494] EAX: 00005401 EBX: b0098d00 ECX: 000218c0 EDX: b1579768
[    6.457254] ESI: 00005401 EDI: b10b6ca9 EBP: b0017e24 ESP: b0017e08
[    6.458018]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    6.458672] CR0: 80050033 CR2: 00005401 CR3: 12469000 CR4: 000006d0
[    6.459437] Stack:
[    6.459691]  b10b6ca9 b151e840 000218c0 024000c0 c13898b8 c2483e00 c25aa=
76c b0017e30
[    6.460750]  b10b6ca9 c13898b8 b0017e3c b1032f75 c2483e00 b0017e54 b10b6=
cde c2483e00
[    6.461811]  c2483e00 76e19000 b0017eac b0017eb8 b10b6fd6 76e19000 b0018=
000 76e59fff
[    6.462872] Call Trace:
[    6.463186]  [<b10b6ca9>] ? ptlock_alloc+0x15/0x25
[    6.463770]  [<b10b6ca9>] ptlock_alloc+0x15/0x25
[    6.464342]  [<b1032f75>] pte_alloc_one+0x35/0x6b
[    6.464917]  [<b10b6cde>] __pte_alloc+0x13/0x9d
[    6.465480]  [<b10b6fd6>] copy_page_range+0x26e/0x3da
[    6.466103]  [<b10b3700>] ? __anon_vma_interval_tree_augment_propagate+0=
x28/0x28
[    6.466998]  [<b10b3a80>] ? anon_vma_interval_tree_insert+0x73/0x79
[    6.467755]  [<b103c583>] copy_process+0xbb1/0x1198
[    6.481367]  [<b103cc78>] _do_fork+0x5b/0x198
[    6.481901]  [<b1152773>] ? _copy_to_user+0x3f/0x48
[    6.482502]  [<b1043e8b>] ? copy_to_user+0x28/0x2d
[    6.483093]  [<b103ce21>] SyS_clone+0x19/0x1b
[    6.483626]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    6.484259]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    6.484868] Code: 75 e8 8b 30 85 f6 75 17 8b 4d e4 8b 55 f0 89 d8 e8 78 =
ff ff ff 89 c6 8b 03 64 ff 40 14 eb 66 8b 43 14 01 f0 f6 03 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 d3 d8 ff ff 8b 13 31 c9 64 8b 3a 39 fe 75 20
[    6.488150] EIP: [<b10c5df7>] kmem_cache_alloc+0x64/0xe9 SS:ESP 0068:b00=
17e08
[    6.489046] CR2: 0000000000005401
[    6.489670] ---[ end trace 9a2d701937ed2c79 ]---
[    6.490256] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb42-128:20151227015857:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

or similar which could potentially make this machine unbootable without a f=
irmware reset.

ctrl-c now unless you really know what you are doing.
[    8.291518] kernel BUG at mm/vmalloc.c:1479!
[    8.292280] invalid opcode: 0000 [#1] PREEMPT SMP =

[    8.292934] Modules linked in:
[    8.293336] CPU: 1 PID: 1 Comm: init Not tainted 4.4.0-rc4-00029-gc7af9d=
5 #1
[    8.296278] task: b0040000 ti: b0016000 task.ti: b0016000
[    8.296952] EIP: 0060:[<b10c00b9>] EFLAGS: 00010246 CPU: 1
[    8.297623] EIP is at __vunmap+0x70/0x9d
[    8.298113] EAX: 00000000 EBX: 00000002 ECX: c1389da4 EDX: c109f02c
[    8.298878] ESI: 00000001 EDI: be895520 EBP: b0017e5c ESP: b0017e50
[    8.299634]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    8.300296] CR0: 8005003b CR2: 76650030 CR3: 00113000 CR4: 000006d0
[    8.301063] Stack:
[    8.301320]  c1eca800 c3500000 b0110298 b0017e68 b10c0161 c1eca800 b0017=
e78 b11c8579
[    8.302408]  c1eca800 b0110240 b0017e88 b11cb6b6 c1eca800 00000000 b0017=
e9c b11cb6dc
[    8.303496]  c1eca800 00000002 b0110240 b0017eb4 b11cba09 00000246 c1eca=
800 c1eca8f8
[    8.304585] Call Trace:
[    8.304905]  [<b10c0161>] vfree+0x59/0x5c
[    8.305397]  [<b11c8579>] n_tty_close+0x22/0x30
[    8.305960]  [<b11cb6b6>] tty_ldisc_close+0x38/0x3c
[    8.306628]  [<b11cb6dc>] tty_ldisc_reinit+0x22/0x42
[    8.307243]  [<b11cba09>] tty_ldisc_hangup+0xd6/0x159
[    8.307944]  [<b11c5c46>] __tty_hangup+0x266/0x309
[    8.308533]  [<b12f1dcb>] ? __mutex_unlock_slowpath+0xde/0xf5
[    8.309274]  [<b11c5cf3>] tty_vhangup+0xa/0xc
[    8.309854]  [<b11cd235>] pty_close+0x133/0x13a
[    8.310413]  [<b11c717a>] tty_release+0x157/0x40b
[    8.311029]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[    8.311637]  [<b1052f5f>] ? __might_sleep+0x6b/0x72
[    8.312265]  [<b10d0837>] __fput+0xd0/0x142
[    8.312822]  [<b10d08cf>] ____fput+0x8/0xa
[    8.313324]  [<b104e960>] task_work_run+0x53/0x75
[    8.313963]  [<b1000d76>] prepare_exit_to_usermode+0x67/0x83
[    8.314656]  [<b1000dcf>] syscall_return_slowpath+0x3d/0x40
[    8.315368]  [<b1000ec1>] do_fast_syscall_32+0x9f/0xd6
[    8.316040]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    8.316660] Code: ff 83 c4 10 eb 4a 89 f8 e8 9b e6 ff ff 89 c2 89 d8 31 =
db e8 70 63 0a 00 85 f6 74 2d 39 5f 14 8b 47 10 76 13 8b 04 98 85 c0 75 02 =
<0f> 0b 31 d2 43 e8 e7 5b fe ff eb e5 f6 47 0c 10 74 07 e8 38 00
[    8.320233] EIP: [<b10c00b9>] __vunmap+0x70/0x9d SS:ESP 0068:b0017e50
[    8.333668] ---[ end trace 0541974b5703b071 ]---
[    8.334293] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb42-128:20151227020251:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    7.836954] init: Temporary process spawn error: No space left on device
[    7.877308] initctl (159) used greatest stack depth: 6732 bytes left
[    7.883472] stop (164) used greatest stack depth: 6664 bytes left
[    7.918033] BUG: spinlock cpu recursion on CPU#0, init/179
[    7.918835] BUG: unable to handle kernel paging request at dead50b1
[    7.919705] IP: [<b1065a80>] spin_dump+0x43/0x79
[    7.920334] *pde =3D 00000000 =

[    7.920744] Oops: 0000 [#1] PREEMPT SMP =

[    7.921310] Modules linked in:
[    7.921745] CPU: 0 PID: 179 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    7.922682] task: bc3fde40 ti: c2574000 task.ti: c2574000
[    7.923388] EIP: 0060:[<b1065a80>] EFLAGS: 00210282 CPU: 0
[    7.924099] EIP is at spin_dump+0x43/0x79
[    7.924636] EAX: 0000002e EBX: dead4ead ECX: 0000002e EDX: 00000000
[    7.925446] ESI: bc58ad48 EDI: 12563067 EBP: c2575e6c ESP: c2575e64
[    7.926255]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    7.926966] CR0: 8005003b CR2: dead50b1 CR3: 1256d000 CR4: 000006d0
[    7.927791] Stack:
[    7.928063]  bc58ad48 c25001e0 c2575e7c b1065ad3 b1445a39 bc58ad48 c2575=
e98 b1065b6a
[    7.929200]  00000000 00000000 00000001 c25001e0 12563067 c2575ea0 b12f2=
c57 c2575efc
[    7.943351]  b10b8238 00000000 00000000 00000000 c2476e00 00000310 c2563=
310 bc58ad48
[    7.944489] Call Trace:
[    7.944821]  [<b1065ad3>] spin_bug+0x1d/0x21
[    7.945382]  [<b1065b6a>] do_raw_spin_lock+0x4c/0xf1
[    7.946037]  [<b12f2c57>] _raw_spin_lock+0xf/0x11
[    7.946662]  [<b10b8238>] handle_mm_fault+0x9fc/0xeac
[    7.947327]  [<b1052e39>] ? ___might_sleep+0x3a/0xf5
[    7.947973]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    7.948734]  [<b102fd9e>] __do_page_fault+0x1ca/0x357
[    7.949397]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    7.950131]  [<b102ffe7>] do_page_fault+0x1a/0x1e
[    7.950760]  [<b102e216>] do_async_page_fault+0x22/0x46
[    7.951439]  [<b12f3df0>] error_code+0x30/0x40
[    7.952028]  [<b10400d8>] ? cpu_callback+0x1b/0xc7
[    7.952660]  [<b102e1f4>] ? kvm_async_pf_task_wake+0xbb/0xbb
[    7.953397]  [<b115205a>] ? __put_user_4+0x1a/0x30
[    7.954020]  [<b10553f8>] ? schedule_tail+0x4f/0x5b
[    7.954668]  [<b12f30c6>] ret_from_fork+0x6/0x30
[    7.955264] Code: 57 b1 ff b0 04 02 00 00 05 f4 02 00 00 50 64 8b 0d f0 =
20 57 b1 51 52 68 a8 59 44 b1 e8 9a ac 03 00 83 c4 14 85 db 8b 56 08 74 0e =
<8b> 83 04 02 00 00 81 c3 f4 02 00 00 eb 08 83 c8 ff bb b3 57 46
[    7.958796] EIP: [<b1065a80>] spin_dump+0x43/0x79 SS:ESP 0068:c2575e64
[    7.959675] CR2: 00000000dead50b1
[    7.960105] ---[ end trace 60e5470739d1cba1 ]---
[    7.960716] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb42-129:20151227015643:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    6.913977] init: Failed to create pty - disabling logging for job
[    6.915059] init: Temporary process spawn error: No space left on device
[    7.023259] initctl (156) used greatest stack depth: 6388 bytes left
[    7.056495] BUG: unable to handle kernel NULL pointer dereference at 000=
004ec
[    7.057622] IP: [<b105b31d>] set_next_entity+0x3e/0x64
[    7.058326] *pde =3D 00000000 =

[    7.058705] Oops: 0000 [#1] PREEMPT SMP =

[    7.059594] Modules linked in:
[    7.060043] CPU: 0 PID: 173 Comm: upstart-udev-br Not tainted 4.4.0-rc4-=
00029-gc7af9d5 #1
[    7.061142] task: c2448740 ti: c257a000 task.ti: c257a000
[    7.062044] EIP: 0060:[<b105b31d>] EFLAGS: 00010046 CPU: 0
[    7.062912] EIP is at set_next_entity+0x3e/0x64
[    7.063561] EAX: 00000000 EBX: c2448784 ECX: 00000000 EDX: c2448784
[    7.064347] ESI: bc3e5400 EDI: c2448740 EBP: c257bf08 ESP: c257befc
[    7.065307]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    7.066103] CR0: 8005003b CR2: 000004ec CR3: 12592000 CR4: 000006d0
[    7.066931] Stack:
[    7.067259]  c2448784 c108da80 c2448740 c257bf14 b105b35e c2448740 c257b=
f34 b1057eb2
[    7.068747]  b158e5c0 00000001 00000086 c2448740 c249ab80 c2448740 c257b=
f50 b1062211
[    7.070015]  c245e500 00000282 bd5d1200 c2448740 c255d540 c257bf64 b1062=
2d8 c249a600
[    7.071258] Call Trace:
[    7.071663]  [<b105b35e>] set_curr_task_fair+0x1b/0x23
[    7.072410]  [<b1057eb2>] sched_move_task+0xb3/0xdb
[    7.073119]  [<b1062211>] autogroup_move_group+0xa1/0xb0
[    7.073848]  [<b10622d8>] sched_autogroup_create_attach+0xb8/0xc7
[    7.074614]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    7.075286]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    7.076049]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    7.076702] Code: 39 78 2c 75 0a 89 f8 e8 2a 2b 0f 00 89 46 2c 8d 56 28 =
89 f8 e8 92 2f 0f 00 ba 01 00 00 00 89 d8 e8 24 fd ff ff 8b 86 94 00 00 00 =
<8b> 90 ec 04 00 00 8b 80 e8 04 00 00 89 53 24 89 43 20 89 5e 30
[    7.080702] EIP: [<b105b31d>] set_next_entity+0x3e/0x64 SS:ESP 0068:c257=
befc
[    7.081838] CR2: 00000000000004ec
[    7.082254] ---[ end trace a537588500d6d436 ]---
[    7.082899] Kernel panic - not syncing: Fatal exception

dmesg-quantal-ivb42-130:20151227020040:i386-randconfig-h0-12261754:4.4.0-rc=
4-00029-gc7af9d5:1

[    7.855158] chmod (128) used greatest stack depth: 6748 bytes left
[    7.890591] init: Failed to create pty - disabling logging for job
[    7.891420] init: Temporary process spawn error: No space left on device
[    8.067949] BUG: unable to handle kernel paging request at 00005403
[    8.068825] IP: [<b10c5f72>] __kmalloc+0x8e/0x121
[    8.069410] *pde =3D 00000000 =

[    8.069800] Oops: 0000 [#1] PREEMPT SMP =

[    8.070409] Modules linked in:
[    8.070818] CPU: 1 PID: 177 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[    8.071732] task: bc3fba00 ti: c24ca000 task.ti: c24ca000
[    8.072415] EIP: 0060:[<b10c5f72>] EFLAGS: 00010246 CPU: 1
[    8.073120] EIP is at __kmalloc+0x8e/0x121
[    8.073677] EAX: 00005403 EBX: 00005403 ECX: 0000a3e1 EDX: b15796f0
[    8.074422] ESI: b0098e00 EDI: 024080c0 EBP: c24cbf1c ESP: c24cbefc
[    8.075184]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[    8.075849] CR0: 8005003b CR2: 00005403 CR3: 1256e000 CR4: 000006d0
[    8.078766] Stack:
[    8.079016]  b105a3e3 00000246 c24cbf10 c24cbf10 0000a3e1 b01a70c0 b158e=
5c0 b01a70c0
[    8.082211]  c24cbf24 b105a3e3 c24cbf40 b105d640 b158e5c0 b158e5c0 b01a7=
0c0 b158e5c0
[    8.085284]  bc3fba00 c24cbf50 b1057c85 b010a400 bc3fba00 c24cbf64 b1062=
247 b010acc0
[    8.086388] Call Trace:
[    8.086708]  [<b105a3e3>] ? kzalloc+0xd/0xf
[    8.087345]  [<b105a3e3>] kzalloc+0xd/0xf
[    8.087975]  [<b105d640>] alloc_fair_sched_group+0x1b/0xc9
[    8.090702]  [<b1057c85>] sched_create_group+0x23/0x4a
[    8.092463]  [<b1062247>] sched_autogroup_create_attach+0x27/0xc7
[    8.094171]  [<b1048a83>] sys_setsid+0xc2/0xcb
[    8.094769]  [<b1000eb4>] do_fast_syscall_32+0x92/0xd6
[    8.095387]  [<b12f31ed>] sysenter_past_esp+0x36/0x59
[    8.096008] Code: f0 75 e8 8b 18 85 db 75 16 8b 4d e0 89 fa 89 f0 e8 fd =
fd ff ff 89 c3 8b 06 64 ff 40 14 eb 75 8b 46 14 01 d8 f6 06 07 74 02 0f 0b =
<8b> 00 89 45 e8 e8 58 d7 ff ff 8b 16 89 45 e4 64 8b 0a 39 cb c7
[    8.106689] EIP: [<b10c5f72>] __kmalloc+0x8e/0x121 SS:ESP 0068:c24cbefc
[    8.107605] CR2: 0000000000005403
[    8.108070] ---[ end trace 66dc33b0b5ce796d ]---
[    8.108818] Kernel panic - not syncing: Fatal exception
git bisect start 212424e0f12362219dc6f53bb13f4af726825044 4ef7675344d687a0e=
f5b0d7c0cee12da005870c0 --
git bisect  bad 45e82e90e5e7072b4e304d19f84d2c1c4b3c7b41  # 00:49      0-  =
    4  Merge 'linux-review/Jann-Horn/android-binder-fix-fput-comment/201512=
26-045614' into devel-spot-201512261608
git bisect  bad 9605f52d2f60ff9d808e3aae3b06651af8748e2b  # 00:49      0-  =
   21  Merge 'linux-review/changbin-du-intel-com/usb-gadget-acm-set-notify_=
req-to-NULL-after-freed-to-avoid-double-free/20151226-120759' into devel-sp=
ot-201512261608
git bisect good e4faee14fcf2744599b3774b14c27eb8a1b24cd7  # 01:04    303+  =
    2  Merge 'linux-review/SF-Markus-Elfring/i2c-core-One-function-call-les=
s-in-acpi_i2c_space_handler-after-error-detection/20151226-151227' into dev=
el-spot-201512261608
git bisect  bad cdac7c82b1842fa38e8b877ee841d813b26ae841  # 01:04      0-  =
    3  Merge 'vfs/work.misc' into devel-spot-201512261608
git bisect good 9e6697e26f9888cdb6088664d31c3772b0dff0a4  # 01:24    307+  =
    0  namei.c: fold set_root_rcu() into set_root()
git bisect good a98e80b2b86d1489d56859c948248738ad932be9  # 01:47    306+  =
    1  switch wireless debugfs ->write() instances to memdup_user_nul()
git bisect  bad 9e38a427c41702e177f7691c6023adde7e6c711e  # 01:51      7-  =
   22  put the remnants of ..._user_ret() to rest
git bisect  bad c7af9d5728bed29ef614324e67e066896d087c8f  # 01:57      0-  =
    1  kernel/*: switch to memdup_user_nul()
git bisect good c4af5f8aed82ef30f6cf91bc3478b52c61cecd18  # 02:15    310+  =
    0  cciss: switch to memdup_user_nul()
# first bad commit: [c7af9d5728bed29ef614324e67e066896d087c8f] kernel/*: sw=
itch to memdup_user_nul()
git bisect good c4af5f8aed82ef30f6cf91bc3478b52c61cecd18  # 02:45    900+  =
    0  cciss: switch to memdup_user_nul()
# extra tests with DEBUG_INFO
git bisect  bad c7af9d5728bed29ef614324e67e066896d087c8f  # 02:50      1-  =
   17  kernel/*: switch to memdup_user_nul()
# extra tests on HEAD of linux-devel/devel-spot-201512261608
git bisect  bad 212424e0f12362219dc6f53bb13f4af726825044  # 02:50      0-  =
   16  0day head guard for 'devel-spot-201512261608'
# extra tests on tree/branch vfs/work.misc
git bisect  bad 15d8d69accf88da38aac73dd873ce56fd39b358a  # 02:55      0-  =
    5  saner calling conventions for copy_mount_options()
# extra tests with first bad commit reverted
git bisect good 241dc6cc888af8cc59a6e1c3ddd4ee2e0da6d00d  # 03:33    904+  =
    1  Revert "kernel/*: switch to memdup_user_nul()"
# extra tests on tree/branch linus/master
git bisect good 8db7b3c54401d83a4dc370a59b8692854000ea03  # 04:31    910+  =
    2  Merge branch 'parisc-4.4-4' of git://git.kernel.org/pub/scm/linux/ke=
rnel/git/deller/parisc-linux
# extra tests on tree/branch linux-next/master
git bisect  bad 80c75a0f1d81922bf322c0634d1e1a15825a89e6  # 04:49     10-  =
    8  Add linux-next specific files for 20151223


This script may reproduce the error.

----------------------------------------------------------------------------
#!/bin/bash

kernel=3D$1
initrd=3Dquantal-core-i386.cgz

wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/mas=
ter/initrd/$initrd

kvm=3D(
	qemu-system-x86_64
	-enable-kvm
	-cpu kvm64
	-kernel $kernel
	-initrd $initrd
	-m 300
	-smp 2
	-device e1000,netdev=3Dnet0
	-netdev user,id=3Dnet0
	-boot order=3Dnc
	-no-reboot
	-watchdog i6300esb
	-rtc base=3Dlocaltime
	-serial stdio
	-display none
	-monitor null =

)

append=3D(
	hung_task_panic=3D1
	earlyprintk=3DttyS0,115200
	systemd.log_level=3Derr
	debug
	apic=3Ddebug
	sysrq_always_enabled
	rcupdate.rcu_cpu_stall_timeout=3D100
	panic=3D-1
	softlockup_panic=3D1
	nmi_watchdog=3Dpanic
	oops=3Dpanic
	load_ramdisk=3D2
	prompt_ramdisk=3D0
	console=3DttyS0,115200
	console=3Dtty0
	vga=3Dnormal
	root=3D/dev/ram0
	rw
	drbd.minor_count=3D8
)

"${kvm[@]}" --append "${append[*]}"
----------------------------------------------------------------------------

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/lkp                          Intel Corporati=
on

--===============5810397636514969683==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="4.4.0-rc4-00029-gc7af9d51"

ZWFybHkgY29uc29sZSBpbiBzZXR1cCBjb2RlClsgICAgMC4wMDAwMDBdIEluaXRpYWxpemluZyBj
Z3JvdXAgc3Vic3lzIGNwdQpbICAgIDAuMDAwMDAwXSBMaW51eCB2ZXJzaW9uIDQuNC4wLXJjNC0w
MDAyOS1nYzdhZjlkNSAoa2J1aWxkQGxrcC1oc3gwMykgKGdjYyB2ZXJzaW9uIDUuMi4xIDIwMTUw
OTExIChEZWJpYW4gNS4yLjEtMTcpICkgIzEgU01QIFBSRUVNUFQgU3VuIERlYyAyNyAwMTo1NDo1
MCBDU1QgMjAxNQpbICAgIDAuMDAwMDAwXSB4ODYvZnB1OiBMZWdhY3kgeDg3IEZQVSBkZXRlY3Rl
ZC4KWyAgICAwLjAwMDAwMF0geDg2L2ZwdTogVXNpbmcgJ2xhenknIEZQVSBjb250ZXh0IHN3aXRj
aGVzLgpbICAgIDAuMDAwMDAwXSBlODIwOiBCSU9TLXByb3ZpZGVkIHBoeXNpY2FsIFJBTSBtYXA6
ClsgICAgMC4wMDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwMDAwMDAwMDAtMHgwMDAw
MDAwMDAwMDlmYmZmXSB1c2FibGUKWyAgICAwLjAwMDAwMF0gQklPUy1lODIwOiBbbWVtIDB4MDAw
MDAwMDAwMDA5ZmMwMC0weDAwMDAwMDAwMDAwOWZmZmZdIHJlc2VydmVkClsgICAgMC4wMDAwMDBd
IEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwMDAwZjAwMDAtMHgwMDAwMDAwMDAwMGZmZmZmXSBy
ZXNlcnZlZApbICAgIDAuMDAwMDAwXSBCSU9TLWU4MjA6IFttZW0gMHgwMDAwMDAwMDAwMTAwMDAw
LTB4MDAwMDAwMDAxMmJkZmZmZl0gdXNhYmxlClsgICAgMC4wMDAwMDBdIEJJT1MtZTgyMDogW21l
bSAweDAwMDAwMDAwMTJiZTAwMDAtMHgwMDAwMDAwMDEyYmZmZmZmXSByZXNlcnZlZApbICAgIDAu
MDAwMDAwXSBCSU9TLWU4MjA6IFttZW0gMHgwMDAwMDAwMGZlZmZjMDAwLTB4MDAwMDAwMDBmZWZm
ZmZmZl0gcmVzZXJ2ZWQKWyAgICAwLjAwMDAwMF0gQklPUy1lODIwOiBbbWVtIDB4MDAwMDAwMDBm
ZmZjMDAwMC0weDAwMDAwMDAwZmZmZmZmZmZdIHJlc2VydmVkClsgICAgMC4wMDAwMDBdIE5vdGlj
ZTogTlggKEV4ZWN1dGUgRGlzYWJsZSkgcHJvdGVjdGlvbiBjYW5ub3QgYmUgZW5hYmxlZDogbm9u
LVBBRSBrZXJuZWwhClsgICAgMC4wMDAwMDBdIEh5cGVydmlzb3IgZGV0ZWN0ZWQ6IEtWTQpbICAg
IDAuMDAwMDAwXSBlODIwOiB1cGRhdGUgW21lbSAweDAwMDAwMDAwLTB4MDAwMDBmZmZdIHVzYWJs
ZSA9PT4gcmVzZXJ2ZWQKWyAgICAwLjAwMDAwMF0gZTgyMDogcmVtb3ZlIFttZW0gMHgwMDBhMDAw
MC0weDAwMGZmZmZmXSB1c2FibGUKWyAgICAwLjAwMDAwMF0gZTgyMDogbGFzdF9wZm4gPSAweDEy
YmUwIG1heF9hcmNoX3BmbiA9IDB4MTAwMDAwClsgICAgMC4wMDAwMDBdIE1UUlIgZGVmYXVsdCB0
eXBlOiB3cml0ZS1iYWNrClsgICAgMC4wMDAwMDBdIE1UUlIgZml4ZWQgcmFuZ2VzIGVuYWJsZWQ6
ClsgICAgMC4wMDAwMDBdICAgMDAwMDAtOUZGRkYgd3JpdGUtYmFjawpbICAgIDAuMDAwMDAwXSAg
IEEwMDAwLUJGRkZGIHVuY2FjaGFibGUKWyAgICAwLjAwMDAwMF0gICBDMDAwMC1GRkZGRiB3cml0
ZS1wcm90ZWN0ClsgICAgMC4wMDAwMDBdIE1UUlIgdmFyaWFibGUgcmFuZ2VzIGVuYWJsZWQ6Clsg
ICAgMC4wMDAwMDBdICAgMCBiYXNlIDAwODAwMDAwMDAgbWFzayBGRjgwMDAwMDAwIHVuY2FjaGFi
bGUKWyAgICAwLjAwMDAwMF0gICAxIGRpc2FibGVkClsgICAgMC4wMDAwMDBdICAgMiBkaXNhYmxl
ZApbICAgIDAuMDAwMDAwXSAgIDMgZGlzYWJsZWQKWyAgICAwLjAwMDAwMF0gICA0IGRpc2FibGVk
ClsgICAgMC4wMDAwMDBdICAgNSBkaXNhYmxlZApbICAgIDAuMDAwMDAwXSAgIDYgZGlzYWJsZWQK
WyAgICAwLjAwMDAwMF0gICA3IGRpc2FibGVkClsgICAgMC4wMDAwMDBdIHg4Ni9QQVQ6IENvbmZp
Z3VyYXRpb24gWzAtN106IFdCICBXQyAgVUMtIFVDICBXQiAgV0MgIFVDLSBVQyAgClsgICAgMC4w
MDAwMDBdIFNjYW5uaW5nIDEgYXJlYXMgZm9yIGxvdyBtZW1vcnkgY29ycnVwdGlvbgpbICAgIDAu
MDAwMDAwXSBpbml0aWFsIG1lbW9yeSBtYXBwZWQ6IFttZW0gMHgwMDAwMDAwMC0weDAxYmZmZmZm
XQpbICAgIDAuMDAwMDAwXSBCYXNlIG1lbW9yeSB0cmFtcG9saW5lIGF0IFtiMDA5YjAwMF0gOWIw
MDAgc2l6ZSAxNjM4NApbICAgIDAuMDAwMDAwXSBCUksgWzB4MDE2MTkwMDAsIDB4MDE2MTlmZmZd
IFBHVEFCTEUKWyAgICAwLjAwMDAwMF0gUkFNRElTSzogW21lbSAweDExMzliMDAwLTB4MTJiZGZm
ZmZdClsgICAgMC4wMDAwMDBdIEFDUEk6IEVhcmx5IHRhYmxlIGNoZWNrc3VtIHZlcmlmaWNhdGlv
biBkaXNhYmxlZApbICAgIDAuMDAwMDAwXSBBQ1BJOiBSU0RQIDB4MDAwMDAwMDAwMDBGNjNFMCAw
MDAwMTQgKHYwMCBCT0NIUyApClsgICAgMC4wMDAwMDBdIEFDUEk6IFJTRFQgMHgwMDAwMDAwMDEy
QkUxNzM3IDAwMDAzNCAodjAxIEJPQ0hTICBCWFBDUlNEVCAwMDAwMDAwMSBCWFBDIDAwMDAwMDAx
KQpbICAgIDAuMDAwMDAwXSBBQ1BJOiBGQUNQIDB4MDAwMDAwMDAxMkJFMEMxNCAwMDAwNzQgKHYw
MSBCT0NIUyAgQlhQQ0ZBQ1AgMDAwMDAwMDEgQlhQQyAwMDAwMDAwMSkKWyAgICAwLjAwMDAwMF0g
QUNQSTogRFNEVCAweDAwMDAwMDAwMTJCRTAwNDAgMDAwQkQ0ICh2MDEgQk9DSFMgIEJYUENEU0RU
IDAwMDAwMDAxIEJYUEMgMDAwMDAwMDEpClsgICAgMC4wMDAwMDBdIEFDUEk6IEZBQ1MgMHgwMDAw
MDAwMDEyQkUwMDAwIDAwMDA0MApbICAgIDAuMDAwMDAwXSBBQ1BJOiBTU0RUIDB4MDAwMDAwMDAx
MkJFMEM4OCAwMDA5RjcgKHYwMSBCT0NIUyAgQlhQQ1NTRFQgMDAwMDAwMDEgQlhQQyAwMDAwMDAw
MSkKWyAgICAwLjAwMDAwMF0gQUNQSTogQVBJQyAweDAwMDAwMDAwMTJCRTE2N0YgMDAwMDgwICh2
MDEgQk9DSFMgIEJYUENBUElDIDAwMDAwMDAxIEJYUEMgMDAwMDAwMDEpClsgICAgMC4wMDAwMDBd
IEFDUEk6IEhQRVQgMHgwMDAwMDAwMDEyQkUxNkZGIDAwMDAzOCAodjAxIEJPQ0hTICBCWFBDSFBF
VCAwMDAwMDAwMSBCWFBDIDAwMDAwMDAxKQpbICAgIDAuMDAwMDAwXSBBQ1BJOiBMb2NhbCBBUElD
IGFkZHJlc3MgMHhmZWUwMDAwMApbICAgIDAuMDAwMDAwXSBtYXBwZWQgQVBJQyB0byAgICAgICAg
IGZmZmZjMDAwICggICAgICAgIGZlZTAwMDAwKQpbICAgIDAuMDAwMDAwXSAyOTlNQiBMT1dNRU0g
YXZhaWxhYmxlLgpbICAgIDAuMDAwMDAwXSAgIG1hcHBlZCBsb3cgcmFtOiAwIC0gMTJiZTAwMDAK
WyAgICAwLjAwMDAwMF0gICBsb3cgcmFtOiAwIC0gMTJiZTAwMDAKWyAgICAwLjAwMDAwMF0ga3Zt
LWNsb2NrOiBVc2luZyBtc3JzIDRiNTY0ZDAxIGFuZCA0YjU2NGQwMApbICAgIDAuMDAwMDAwXSBr
dm0tY2xvY2s6IGNwdSAwLCBtc3IgMDoxMTM5YTAwMSwgcHJpbWFyeSBjcHUgY2xvY2sKWyAgICAw
LjAwMDAwMF0ga3ZtLWNsb2NrOiB1c2luZyBzY2hlZCBvZmZzZXQgb2YgMzY4ODA0NTgxOSBjeWNs
ZXMKWyAgICAwLjAwMDAwMF0gY2xvY2tzb3VyY2U6IGt2bS1jbG9jazogbWFzazogMHhmZmZmZmZm
ZmZmZmZmZmZmIG1heF9jeWNsZXM6IDB4MWNkNDJlNGRmZmIsIG1heF9pZGxlX25zOiA4ODE1OTA1
OTE0ODMgbnMKWyAgICAwLjAwMDAwMF0gWm9uZSByYW5nZXM6ClsgICAgMC4wMDAwMDBdICAgTm9y
bWFsICAgW21lbSAweDAwMDAwMDAwMDAwMDEwMDAtMHgwMDAwMDAwMDEyYmRmZmZmXQpbICAgIDAu
MDAwMDAwXSBNb3ZhYmxlIHpvbmUgc3RhcnQgZm9yIGVhY2ggbm9kZQpbICAgIDAuMDAwMDAwXSBF
YXJseSBtZW1vcnkgbm9kZSByYW5nZXMKWyAgICAwLjAwMDAwMF0gICBub2RlICAgMDogW21lbSAw
eDAwMDAwMDAwMDAwMDEwMDAtMHgwMDAwMDAwMDAwMDllZmZmXQpbICAgIDAuMDAwMDAwXSAgIG5v
ZGUgICAwOiBbbWVtIDB4MDAwMDAwMDAwMDEwMDAwMC0weDAwMDAwMDAwMTJiZGZmZmZdClsgICAg
MC4wMDAwMDBdIEluaXRtZW0gc2V0dXAgbm9kZSAwIFttZW0gMHgwMDAwMDAwMDAwMDAxMDAwLTB4
MDAwMDAwMDAxMmJkZmZmZl0KWyAgICAwLjAwMDAwMF0gT24gbm9kZSAwIHRvdGFscGFnZXM6IDc2
NjcwClsgICAgMC4wMDAwMDBdIGZyZWVfYXJlYV9pbml0X25vZGU6IG5vZGUgMCwgcGdkYXQgYjE1
MWU4NDAsIG5vZGVfbWVtX21hcCBjMTBhYzAyOApbICAgIDAuMDAwMDAwXSAgIE5vcm1hbCB6b25l
OiA3NTAgcGFnZXMgdXNlZCBmb3IgbWVtbWFwClsgICAgMC4wMDAwMDBdICAgTm9ybWFsIHpvbmU6
IDAgcGFnZXMgcmVzZXJ2ZWQKWyAgICAwLjAwMDAwMF0gICBOb3JtYWwgem9uZTogNzY2NzAgcGFn
ZXMsIExJRk8gYmF0Y2g6MTUKWyAgICAwLjAwMDAwMF0gVXNpbmcgQVBJQyBkcml2ZXIgZGVmYXVs
dApbICAgIDAuMDAwMDAwXSBBQ1BJOiBQTS1UaW1lciBJTyBQb3J0OiAweDYwOApbICAgIDAuMDAw
MDAwXSBBQ1BJOiBMb2NhbCBBUElDIGFkZHJlc3MgMHhmZWUwMDAwMApbICAgIDAuMDAwMDAwXSBt
YXBwZWQgQVBJQyB0byAgICAgICAgIGZmZmZjMDAwICggICAgICAgIGZlZTAwMDAwKQpbICAgIDAu
MDAwMDAwXSBBQ1BJOiBMQVBJQ19OTUkgKGFjcGlfaWRbMHhmZl0gZGZsIGRmbCBsaW50WzB4MV0p
ClsgICAgMC4wMDAwMDBdIElPQVBJQ1swXTogYXBpY19pZCAwLCB2ZXJzaW9uIDE3LCBhZGRyZXNz
IDB4ZmVjMDAwMDAsIEdTSSAwLTIzClsgICAgMC4wMDAwMDBdIEFDUEk6IElOVF9TUkNfT1ZSIChi
dXMgMCBidXNfaXJxIDAgZ2xvYmFsX2lycSAyIGRmbCBkZmwpClsgICAgMC4wMDAwMDBdIEludDog
dHlwZSAwLCBwb2wgMCwgdHJpZyAwLCBidXMgMDAsIElSUSAwMCwgQVBJQyBJRCAwLCBBUElDIElO
VCAwMgpbICAgIDAuMDAwMDAwXSBBQ1BJOiBJTlRfU1JDX09WUiAoYnVzIDAgYnVzX2lycSA1IGds
b2JhbF9pcnEgNSBoaWdoIGxldmVsKQpbICAgIDAuMDAwMDAwXSBJbnQ6IHR5cGUgMCwgcG9sIDEs
IHRyaWcgMywgYnVzIDAwLCBJUlEgMDUsIEFQSUMgSUQgMCwgQVBJQyBJTlQgMDUKWyAgICAwLjAw
MDAwMF0gQUNQSTogSU5UX1NSQ19PVlIgKGJ1cyAwIGJ1c19pcnEgOSBnbG9iYWxfaXJxIDkgaGln
aCBsZXZlbCkKWyAgICAwLjAwMDAwMF0gSW50OiB0eXBlIDAsIHBvbCAxLCB0cmlnIDMsIGJ1cyAw
MCwgSVJRIDA5LCBBUElDIElEIDAsIEFQSUMgSU5UIDA5ClsgICAgMC4wMDAwMDBdIEFDUEk6IElO
VF9TUkNfT1ZSIChidXMgMCBidXNfaXJxIDEwIGdsb2JhbF9pcnEgMTAgaGlnaCBsZXZlbCkKWyAg
ICAwLjAwMDAwMF0gSW50OiB0eXBlIDAsIHBvbCAxLCB0cmlnIDMsIGJ1cyAwMCwgSVJRIDBhLCBB
UElDIElEIDAsIEFQSUMgSU5UIDBhClsgICAgMC4wMDAwMDBdIEFDUEk6IElOVF9TUkNfT1ZSIChi
dXMgMCBidXNfaXJxIDExIGdsb2JhbF9pcnEgMTEgaGlnaCBsZXZlbCkKWyAgICAwLjAwMDAwMF0g
SW50OiB0eXBlIDAsIHBvbCAxLCB0cmlnIDMsIGJ1cyAwMCwgSVJRIDBiLCBBUElDIElEIDAsIEFQ
SUMgSU5UIDBiClsgICAgMC4wMDAwMDBdIEFDUEk6IElSUTAgdXNlZCBieSBvdmVycmlkZS4KWyAg
ICAwLjAwMDAwMF0gSW50OiB0eXBlIDAsIHBvbCAwLCB0cmlnIDAsIGJ1cyAwMCwgSVJRIDAxLCBB
UElDIElEIDAsIEFQSUMgSU5UIDAxClsgICAgMC4wMDAwMDBdIEludDogdHlwZSAwLCBwb2wgMCwg
dHJpZyAwLCBidXMgMDAsIElSUSAwMywgQVBJQyBJRCAwLCBBUElDIElOVCAwMwpbICAgIDAuMDAw
MDAwXSBJbnQ6IHR5cGUgMCwgcG9sIDAsIHRyaWcgMCwgYnVzIDAwLCBJUlEgMDQsIEFQSUMgSUQg
MCwgQVBJQyBJTlQgMDQKWyAgICAwLjAwMDAwMF0gQUNQSTogSVJRNSB1c2VkIGJ5IG92ZXJyaWRl
LgpbICAgIDAuMDAwMDAwXSBJbnQ6IHR5cGUgMCwgcG9sIDAsIHRyaWcgMCwgYnVzIDAwLCBJUlEg
MDYsIEFQSUMgSUQgMCwgQVBJQyBJTlQgMDYKWyAgICAwLjAwMDAwMF0gSW50OiB0eXBlIDAsIHBv
bCAwLCB0cmlnIDAsIGJ1cyAwMCwgSVJRIDA3LCBBUElDIElEIDAsIEFQSUMgSU5UIDA3ClsgICAg
MC4wMDAwMDBdIEludDogdHlwZSAwLCBwb2wgMCwgdHJpZyAwLCBidXMgMDAsIElSUSAwOCwgQVBJ
QyBJRCAwLCBBUElDIElOVCAwOApbICAgIDAuMDAwMDAwXSBBQ1BJOiBJUlE5IHVzZWQgYnkgb3Zl
cnJpZGUuClsgICAgMC4wMDAwMDBdIEFDUEk6IElSUTEwIHVzZWQgYnkgb3ZlcnJpZGUuClsgICAg
MC4wMDAwMDBdIEFDUEk6IElSUTExIHVzZWQgYnkgb3ZlcnJpZGUuClsgICAgMC4wMDAwMDBdIElu
dDogdHlwZSAwLCBwb2wgMCwgdHJpZyAwLCBidXMgMDAsIElSUSAwYywgQVBJQyBJRCAwLCBBUElD
IElOVCAwYwpbICAgIDAuMDAwMDAwXSBJbnQ6IHR5cGUgMCwgcG9sIDAsIHRyaWcgMCwgYnVzIDAw
LCBJUlEgMGQsIEFQSUMgSUQgMCwgQVBJQyBJTlQgMGQKWyAgICAwLjAwMDAwMF0gSW50OiB0eXBl
IDAsIHBvbCAwLCB0cmlnIDAsIGJ1cyAwMCwgSVJRIDBlLCBBUElDIElEIDAsIEFQSUMgSU5UIDBl
ClsgICAgMC4wMDAwMDBdIEludDogdHlwZSAwLCBwb2wgMCwgdHJpZyAwLCBidXMgMDAsIElSUSAw
ZiwgQVBJQyBJRCAwLCBBUElDIElOVCAwZgpbICAgIDAuMDAwMDAwXSBVc2luZyBBQ1BJIChNQURU
KSBmb3IgU01QIGNvbmZpZ3VyYXRpb24gaW5mb3JtYXRpb24KWyAgICAwLjAwMDAwMF0gQUNQSTog
SFBFVCBpZDogMHg4MDg2YTIwMSBiYXNlOiAweGZlZDAwMDAwClsgICAgMC4wMDAwMDBdIHNtcGJv
b3Q6IEFsbG93aW5nIDIgQ1BVcywgMCBob3RwbHVnIENQVXMKWyAgICAwLjAwMDAwMF0gbWFwcGVk
IElPQVBJQyB0byBmZmZmYjAwMCAoZmVjMDAwMDApClsgICAgMC4wMDAwMDBdIGU4MjA6IFttZW0g
MHgxMmMwMDAwMC0weGZlZmZiZmZmXSBhdmFpbGFibGUgZm9yIFBDSSBkZXZpY2VzClsgICAgMC4w
MDAwMDBdIEJvb3RpbmcgcGFyYXZpcnR1YWxpemVkIGtlcm5lbCBvbiBLVk0KWyAgICAwLjAwMDAw
MF0gY2xvY2tzb3VyY2U6IHJlZmluZWQtamlmZmllczogbWFzazogMHhmZmZmZmZmZiBtYXhfY3lj
bGVzOiAweGZmZmZmZmZmLCBtYXhfaWRsZV9uczogMTkxMDk2OTk0MDM5MTQxOSBucwpbICAgIDAu
MDAwMDAwXSBzZXR1cF9wZXJjcHU6IE5SX0NQVVM6MzIgbnJfY3B1bWFza19iaXRzOjIgbnJfY3B1
X2lkczoyIG5yX25vZGVfaWRzOjEKWyAgICAwLjAwMDAwMF0gUEVSQ1BVOiBFbWJlZGRlZCAxNiBw
YWdlcy9jcHUgQGMxMDg2MDAwIHMzNDMwNCByMCBkMzEyMzIgdTY1NTM2ClsgICAgMC4wMDAwMDBd
IHBjcHUtYWxsb2M6IHMzNDMwNCByMCBkMzEyMzIgdTY1NTM2IGFsbG9jPTE2KjQwOTYKWyAgICAw
LjAwMDAwMF0gcGNwdS1hbGxvYzogWzBdIDAgWzBdIDEgClsgICAgMC4wMDAwMDBdIEtWTSBzZXR1
cCBhc3luYyBQRiBmb3IgY3B1IDAKWyAgICAwLjAwMDAwMF0ga3ZtLXN0ZWFsdGltZTogY3B1IDAs
IG1zciAxMTA4OGIwMApbICAgIDAuMDAwMDAwXSBCdWlsdCAxIHpvbmVsaXN0cyBpbiBab25lIG9y
ZGVyLCBtb2JpbGl0eSBncm91cGluZyBvbi4gIFRvdGFsIHBhZ2VzOiA3NTkyMApbICAgIDAuMDAw
MDAwXSBLZXJuZWwgY29tbWFuZCBsaW5lOiBodW5nX3Rhc2tfcGFuaWM9MSBlYXJseXByaW50az10
dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFf
YWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMCBwYW5pYz0t
MSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9y
YW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MCBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0
eTAgdmdhPW5vcm1hbCAgcm9vdD0vZGV2L3JhbTAgcncgbGluaz0va2J1aWxkLXRlc3RzL3J1bi1x
dWV1ZS9rdm0vaTM4Ni1yYW5kY29uZmlnLWgwLTEyMjYxNzU0L2xpbnV4LWRldmVsOmRldmVsLXNw
b3QtMjAxNTEyMjYxNjA4OmM3YWY5ZDU3MjhiZWQyOWVmNjE0MzI0ZTY3ZTA2Njg5NmQwODdjOGY6
YmlzZWN0LWxpbnV4LTcvLnZtbGludXotYzdhZjlkNTcyOGJlZDI5ZWY2MTQzMjRlNjdlMDY2ODk2
ZDA4N2M4Zi0yMDE1MTIyNzAxNTUwNS0xNTctaXZiNDEgYnJhbmNoPWxpbnV4LWRldmVsL2RldmVs
LXNwb3QtMjAxNTEyMjYxNjA4IEJPT1RfSU1BR0U9L3BrZy9saW51eC9pMzg2LXJhbmRjb25maWct
aDAtMTIyNjE3NTQvZ2NjLTUvYzdhZjlkNTcyOGJlZDI5ZWY2MTQzMjRlNjdlMDY2ODk2ZDA4N2M4
Zi92bWxpbnV6LTQuNC4wLXJjNC0wMDAyOS1nYzdhZjlkNSBkcmJkLm1pbm9yX2NvdW50PTgKWyAg
ICAwLjAwMDAwMF0gUElEIGhhc2ggdGFibGUgZW50cmllczogMjA0OCAob3JkZXI6IDEsIDgxOTIg
Ynl0ZXMpClsgICAgMC4wMDAwMDBdIERlbnRyeSBjYWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDY1
NTM2IChvcmRlcjogNiwgMjYyMTQ0IGJ5dGVzKQpbICAgIDAuMDAwMDAwXSBJbm9kZS1jYWNoZSBo
YXNoIHRhYmxlIGVudHJpZXM6IDMyNzY4IChvcmRlcjogNSwgMTMxMDcyIGJ5dGVzKQpbICAgIDAu
MDAwMDAwXSBJbml0aWFsaXppbmcgQ1BVIzAKWyAgICAwLjAwMDAwMF0gTWVtb3J5OiAyNzE5NDBL
LzMwNjY4MEsgYXZhaWxhYmxlICgzMDI1SyBrZXJuZWwgY29kZSwgMzYySyByd2RhdGEsIDE4NjhL
IHJvZGF0YSwgMzQwSyBpbml0LCA1OTZLIGJzcywgMzQ3NDBLIHJlc2VydmVkLCAwSyBjbWEtcmVz
ZXJ2ZWQpClsgICAgMC4wMDAwMDBdIHZpcnR1YWwga2VybmVsIG1lbW9yeSBsYXlvdXQ6ClsgICAg
MC4wMDAwMDBdICAgICBmaXhtYXAgIDogMHhmZmQzNjAwMCAtIDB4ZmZmZmYwMDAgICAoMjg1MiBr
QikKWyAgICAwLjAwMDAwMF0gICAgIHZtYWxsb2MgOiAweGMzM2UwMDAwIC0gMHhmZmQzNDAwMCAg
ICggOTY5IE1CKQpbICAgIDAuMDAwMDAwXSAgICAgbG93bWVtICA6IDB4YjAwMDAwMDAgLSAweGMy
YmUwMDAwICAgKCAyOTkgTUIpClsgICAgMC4wMDAwMDBdICAgICAgIC5pbml0IDogMHhiMTUyNTAw
MCAtIDB4YjE1N2EwMDAgICAoIDM0MCBrQikKWyAgICAwLjAwMDAwMF0gICAgICAgLmRhdGEgOiAw
eGIxMmY0OGM3IC0gMHhiMTUyM2EwMCAgICgyMjM2IGtCKQpbICAgIDAuMDAwMDAwXSAgICAgICAu
dGV4dCA6IDB4YjEwMDAwMDAgLSAweGIxMmY0OGM3ICAgKDMwMjYga0IpClsgICAgMC4wMDAwMDBd
IENoZWNraW5nIGlmIHRoaXMgcHJvY2Vzc29yIGhvbm91cnMgdGhlIFdQIGJpdCBldmVuIGluIHN1
cGVydmlzb3IgbW9kZS4uLk9rLgpbICAgIDAuMDAwMDAwXSBTTFVCOiBIV2FsaWduPTEyOCwgT3Jk
ZXI9MC0zLCBNaW5PYmplY3RzPTAsIENQVXM9MiwgTm9kZXM9MQpbICAgIDAuMDAwMDAwXSBQcmVl
bXB0aWJsZSBoaWVyYXJjaGljYWwgUkNVIGltcGxlbWVudGF0aW9uLgpbICAgIDAuMDAwMDAwXSBS
Q1U6IEFkanVzdGluZyBnZW9tZXRyeSBmb3IgcmN1X2Zhbm91dF9sZWFmPTMyLCBucl9jcHVfaWRz
PTIKWyAgICAwLjAwMDAwMF0gTlJfSVJRUzoyMzA0IG5yX2lycXM6NDQwIDE2ClsgICAgMC4wMDAw
MDBdIENQVSAwIGlycXN0YWNrcywgaGFyZD1iMDA4MDAwMCBzb2Z0PWIwMDgyMDAwClsgICAgMC4w
MDAwMDBdIGNvbnNvbGUgW3R0eVMwXSBlbmFibGVkClsgICAgMC4wMDAwMDBdIC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpbICAgIDAuMDAwMDAwXSB8IExvY2tpbmcgQVBJIHRlc3RzdWl0ZToKWyAg
ICAwLjAwMDAwMF0gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpbICAgIDAuMDAwMDAwXSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IHNwaW4gfHdsb2NrIHxybG9jayB8bXV0ZXggfCB3c2Vt
IHwgcnNlbSB8ClsgICAgMC4wMDAwMDBdICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KWyAgICAwLjAwMDAw
MF0gICAgICAgICAgICAgICAgICAgICAgQS1BIGRlYWRsb2NrOmZhaWxlZHxmYWlsZWR8ICBvayAg
fGZhaWxlZHxmYWlsZWR8ZmFpbGVkfApbICAgIDAuMDAwMDAwXSAgICAgICAgICAgICAgICAgIEEt
Qi1CLUEgZGVhZGxvY2s6ZmFpbGVkfGZhaWxlZHwgIG9rICB8ZmFpbGVkfGZhaWxlZHxmYWlsZWR8
ClsgICAgMC4wMDAwMDBdICAgICAgICAgICAgICBBLUItQi1DLUMtQSBkZWFkbG9jazpmYWlsZWR8
ZmFpbGVkfCAgb2sgIHxmYWlsZWR8ZmFpbGVkfGZhaWxlZHwKWyAgICAwLjAwMDAwMF0gICAgICAg
ICAgICAgIEEtQi1DLUEtQi1DIGRlYWRsb2NrOmZhaWxlZHxmYWlsZWR8ICBvayAgfGZhaWxlZHxm
YWlsZWR8ZmFpbGVkfApbICAgIDAuMDAwMDAwXSAgICAgICAgICBBLUItQi1DLUMtRC1ELUEgZGVh
ZGxvY2s6ZmFpbGVkfGZhaWxlZHwgIG9rICB8ZmFpbGVkfGZhaWxlZHxmYWlsZWR8ClsgICAgMC4w
MDAwMDBdICAgICAgICAgIEEtQi1DLUQtQi1ELUQtQSBkZWFkbG9jazpmYWlsZWR8ZmFpbGVkfCAg
b2sgIHxmYWlsZWR8ZmFpbGVkfGZhaWxlZHwKWyAgICAwLjAwMDAwMF0gICAgICAgICAgQS1CLUMt
RC1CLUMtRC1BIGRlYWRsb2NrOmZhaWxlZHxmYWlsZWR8ICBvayAgfGZhaWxlZHxmYWlsZWR8ZmFp
bGVkfApbICAgIDAuMDAwMDAwXSAgICAgICAgICAgICAgICAgICAgIGRvdWJsZSB1bmxvY2s6ICBv
ayAgfCAgb2sgIHxmYWlsZWR8ICBvayAgfGZhaWxlZHxmYWlsZWR8ClsgICAgMC4wMDAwMDBdICAg
ICAgICAgICAgICAgICAgIGluaXRpYWxpemUgaGVsZDpmYWlsZWR8ZmFpbGVkfGZhaWxlZHxmYWls
ZWR8ZmFpbGVkfGZhaWxlZHwKWyAgICAwLjAwMDAwMF0gICAgICAgICAgICAgICAgICBiYWQgdW5s
b2NrIG9yZGVyOiAgb2sgIHwgIG9rICB8ICBvayAgfCAgb2sgIHwgIG9rICB8ICBvayAgfApbICAg
IDAuMDAwMDAwXSAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClsgICAgMC4wMDAwMDBdICAgICAgICAgICAg
ICAgcmVjdXJzaXZlIHJlYWQtbG9jazogICAgICAgICAgICAgfCAgb2sgIHwgICAgICAgICAgICAg
fGZhaWxlZHwKWyAgICAwLjAwMDAwMF0gICAgICAgICAgICByZWN1cnNpdmUgcmVhZC1sb2NrICMy
OiAgICAgICAgICAgICB8ICBvayAgfCAgICAgICAgICAgICB8ZmFpbGVkfApbICAgIDAuMDAwMDAw
XSAgICAgICAgICAgICBtaXhlZCByZWFkLXdyaXRlLWxvY2s6ICAgICAgICAgICAgIHxmYWlsZWR8
ICAgICAgICAgICAgIHxmYWlsZWR8ClsgICAgMC4wMDAwMDBdICAgICAgICAgICAgIG1peGVkIHdy
aXRlLXJlYWQtbG9jazogICAgICAgICAgICAgfGZhaWxlZHwgICAgICAgICAgICAgfGZhaWxlZHwK
WyAgICAwLjAwMDAwMF0gICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpbICAgIDAuMDAwMDAwXSAgICAgIGhh
cmQtaXJxcy1vbiArIGlycS1zYWZlLUEvMTI6ZmFpbGVkfGZhaWxlZHwgIG9rICB8ClsgICAgMC4w
MDAwMDBdICAgICAgc29mdC1pcnFzLW9uICsgaXJxLXNhZmUtQS8xMjpmYWlsZWR8ZmFpbGVkfCAg
b2sgIHwKWyAgICAwLjAwMDAwMF0gICAgICBoYXJkLWlycXMtb24gKyBpcnEtc2FmZS1BLzIxOmZh
aWxlZHxmYWlsZWR8ICBvayAgfApbICAgIDAuMDAwMDAwXSAgICAgIHNvZnQtaXJxcy1vbiArIGly
cS1zYWZlLUEvMjE6ZmFpbGVkfGZhaWxlZHwgIG9rICB8ClsgICAgMC4wMDAwMDBdICAgICAgICBz
aXJxLXNhZmUtQSA9PiBoaXJxcy1vbi8xMjpmYWlsZWR8ZmFpbGVkfCAgb2sgIHwKWyAgICAwLjAw
MDAwMF0gICAgICAgIHNpcnEtc2FmZS1BID0+IGhpcnFzLW9uLzIxOmZhaWxlZHxmYWlsZWR8ICBv
ayAgfApbICAgIDAuMDAwMDAwXSAgICAgICAgICBoYXJkLXNhZmUtQSArIGlycXMtb24vMTI6ZmFp
bGVkfGZhaWxlZHwgIG9rICB8ClsgICAgMC4wMDAwMDBdICAgICAgICAgIHNvZnQtc2FmZS1BICsg
aXJxcy1vbi8xMjpmYWlsZWR8ZmFpbGVkfCAgb2sgIHwKWyAgICAwLjAwMDAwMF0gICAgICAgICAg
aGFyZC1zYWZlLUEgKyBpcnFzLW9uLzIxOmZhaWxlZHxmYWlsZWR8ICBvayAgfApbICAgIDAuMDAw
MDAwXSAgICAgICAgICBzb2Z0LXNhZmUtQSArIGlycXMtb24vMjE6ZmFpbGVkfGZhaWxlZHwgIG9r
ICB8ClsgICAgMC4wMDAwMDBdICAgICBoYXJkLXNhZmUtQSArIHVuc2FmZS1CICMxLzEyMzpmYWls
ZWR8ZmFpbGVkfCAgb2sgIHwKWyAgICAwLjAwMDAwMF0gICAgIHNvZnQtc2FmZS1BICsgdW5zYWZl
LUIgIzEvMTIzOmZhaWxlZHxmYWlsZWR8ICBvayAgfApbICAgIDAuMDAwMDAwXSAgICAgaGFyZC1z
YWZlLUEgKyB1bnNhZmUtQiAjMS8xMzI6ZmFpbGVkfGZhaWxlZHwgIG9rICB8ClsgICAgMC4wMDAw
MDBdICAgICBzb2Z0LXNhZmUtQSArIHVuc2FmZS1CICMxLzEzMjpmYWlsZWR8ZmFpbGVkfCAgb2sg
IHwKWyAgICAwLjAwMDAwMF0gICAgIGhhcmQtc2FmZS1BICsgdW5zYWZlLUIgIzEvMjEzOmZhaWxl
ZHxmYWlsZWR8ICBvayAgfApbICAgIDAuMDAwMDAwXSAgICAgc29mdC1zYWZlLUEgKyB1bnNhZmUt
QiAjMS8yMTM6ZmFpbGVkfGZhaWxlZHwgIG9rICB8ClsgICAgMC4wMDAwMDBdICAgICBoYXJkLXNh
ZmUtQSArIHVuc2FmZS1CICMxLzIzMTpmYWlsZWR8ZmFpbGVkfCAgb2sgIHwKWyAgICAwLjAwMDAw
MF0gICAgIHNvZnQtc2FmZS1BICsgdW5zYWZlLUIgIzEvMjMxOmZhaWxlZHxmYWlsZWR8ICBvayAg
fApbICAgIDAuMDAwMDAwXSAgICAgaGFyZC1zYWZlLUEgKyB1bnNhZmUtQiAjMS8zMTI6ZmFpbGVk
fGZhaWxlZHwgIG9rICB8ClsgICAgMC4wMDAwMDBdICAgICBzb2Z0LXNhZmUtQSArIHVuc2FmZS1C
ICMxLzMxMjpmYWlsZWR8ZmFpbGVkfCAgb2sgIHwKWyAgICAwLjAwMDAwMF0gICAgIGhhcmQtc2Fm
ZS1BICsgdW5zYWZlLUIgIzEvMzIxOmZhaWxlZHxmYWlsZWR8ICBvayAgfApbICAgIDAuMDAwMDAw
XSAgICAgc29mdC1zYWZlLUEgKyB1bnNhZmUtQiAjMS8zMjE6ZmFpbGVkfGZhaWxlZHwgIG9rICB8
ClsgICAgMC4wMDAwMDBdICAgICBoYXJkLXNhZmUtQSArIHVuc2FmZS1CICMyLzEyMzpmYWlsZWR8
ZmFpbGVkfCAgb2sgIHwKWyAgICAwLjAwMDAwMF0gICAgIHNvZnQtc2FmZS1BICsgdW5zYWZlLUIg
IzIvMTIzOmZhaWxlZHxmYWlsZWR8ICBvayAgfApbICAgIDAuMDAwMDAwXSAgICAgaGFyZC1zYWZl
LUEgKyB1bnNhZmUtQiAjMi8xMzI6ZmFpbGVkfGZhaWxlZHwgIG9rICB8ClsgICAgMC4wMDAwMDBd
ICAgICBzb2Z0LXNhZmUtQSArIHVuc2FmZS1CICMyLzEzMjpmYWlsZWR8ZmFpbGVkfCAgb2sgIHwK
WyAgICAwLjAwMDAwMF0gICAgIGhhcmQtc2FmZS1BICsgdW5zYWZlLUIgIzIvMjEzOmZhaWxlZHxm
YWlsZWR8ICBvayAgfApbICAgIDAuMDAwMDAwXSAgICAgc29mdC1zYWZlLUEgKyB1bnNhZmUtQiAj
Mi8yMTM6ZmFpbGVkfGZhaWxlZHwgIG9rICB8ClsgICAgMC4wMDAwMDBdICAgICBoYXJkLXNhZmUt
QSArIHVuc2FmZS1CICMyLzIzMTpmYWlsZWR8ZmFpbGVkfCAgb2sgIHwKWyAgICAwLjAwMDAwMF0g
ICAgIHNvZnQtc2FmZS1BICsgdW5zYWZlLUIgIzIvMjMxOmZhaWxlZHxmYWlsZWR8ICBvayAgfApb
ICAgIDAuMDAwMDAwXSAgICAgaGFyZC1zYWZlLUEgKyB1bnNhZmUtQiAjMi8zMTI6ZmFpbGVkfGZh
aWxlZHwgIG9rICB8ClsgICAgMC4wMDAwMDBdICAgICBzb2Z0LXNhZmUtQSArIHVuc2FmZS1CICMy
LzMxMjpmYWlsZWR8ZmFpbGVkfCAgb2sgIHwKWyAgICAwLjAwMDAwMF0gICAgIGhhcmQtc2FmZS1B
ICsgdW5zYWZlLUIgIzIvMzIxOmZhaWxlZHxmYWlsZWR8ICBvayAgfApbICAgIDAuMDAwMDAwXSAg
ICAgc29mdC1zYWZlLUEgKyB1bnNhZmUtQiAjMi8zMjE6ZmFpbGVkfGZhaWxlZHwgIG9rICB8Clsg
ICAgMC4wMDAwMDBdICAgICAgIGhhcmQtaXJxIGxvY2staW52ZXJzaW9uLzEyMzpmYWlsZWR8ZmFp
bGVkfCAgb2sgIHwKWyAgICAwLjAwMDAwMF0gICAgICAgc29mdC1pcnEgbG9jay1pbnZlcnNpb24v
MTIzOmZhaWxlZHxmYWlsZWR8ICBvayAgfApbICAgIDAuMDAwMDAwXSAgICAgICBoYXJkLWlycSBs
b2NrLWludmVyc2lvbi8xMzI6ZmFpbGVkfGZhaWxlZHwgIG9rICB8ClsgICAgMC4wMDAwMDBdICAg
ICAgIHNvZnQtaXJxIGxvY2staW52ZXJzaW9uLzEzMjpmYWlsZWR8ZmFpbGVkfCAgb2sgIHwKWyAg
ICAwLjAwMDAwMF0gICAgICAgaGFyZC1pcnEgbG9jay1pbnZlcnNpb24vMjEzOmZhaWxlZHxmYWls
ZWR8ICBvayAgfApbICAgIDAuMDAwMDAwXSAgICAgICBzb2Z0LWlycSBsb2NrLWludmVyc2lvbi8y
MTM6ZmFpbGVkfGZhaWxlZHwgIG9rICB8ClsgICAgMC4wMDAwMDBdICAgICAgIGhhcmQtaXJxIGxv
Y2staW52ZXJzaW9uLzIzMTpmYWlsZWR8ZmFpbGVkfCAgb2sgIHwKWyAgICAwLjAwMDAwMF0gICAg
ICAgc29mdC1pcnEgbG9jay1pbnZlcnNpb24vMjMxOmZhaWxlZHxmYWlsZWR8ICBvayAgfApbICAg
IDAuMDAwMDAwXSAgICAgICBoYXJkLWlycSBsb2NrLWludmVyc2lvbi8zMTI6ZmFpbGVkfGZhaWxl
ZHwgIG9rICB8ClsgICAgMC4wMDAwMDBdICAgICAgIHNvZnQtaXJxIGxvY2staW52ZXJzaW9uLzMx
MjpmYWlsZWR8ZmFpbGVkfCAgb2sgIHwKWyAgICAwLjAwMDAwMF0gICAgICAgaGFyZC1pcnEgbG9j
ay1pbnZlcnNpb24vMzIxOmZhaWxlZHxmYWlsZWR8ICBvayAgfApbICAgIDAuMDAwMDAwXSAgICAg
ICBzb2Z0LWlycSBsb2NrLWludmVyc2lvbi8zMjE6ZmFpbGVkfGZhaWxlZHwgIG9rICB8ClsgICAg
MC4wMDAwMDBdICAgICAgIGhhcmQtaXJxIHJlYWQtcmVjdXJzaW9uLzEyMzogIG9rICB8ClsgICAg
MC4wMDAwMDBdICAgICAgIHNvZnQtaXJxIHJlYWQtcmVjdXJzaW9uLzEyMzogIG9rICB8ClsgICAg
MC4wMDAwMDBdICAgICAgIGhhcmQtaXJxIHJlYWQtcmVjdXJzaW9uLzEzMjogIG9rICB8ClsgICAg
MC4wMDAwMDBdICAgICAgIHNvZnQtaXJxIHJlYWQtcmVjdXJzaW9uLzEzMjogIG9rICB8ClsgICAg
MC4wMDAwMDBdICAgICAgIGhhcmQtaXJxIHJlYWQtcmVjdXJzaW9uLzIxMzogIG9rICB8ClsgICAg
MC4wMDAwMDBdICAgICAgIHNvZnQtaXJxIHJlYWQtcmVjdXJzaW9uLzIxMzogIG9rICB8ClsgICAg
MC4wMDAwMDBdICAgICAgIGhhcmQtaXJxIHJlYWQtcmVjdXJzaW9uLzIzMTogIG9rICB8ClsgICAg
MC4wMDAwMDBdICAgICAgIHNvZnQtaXJxIHJlYWQtcmVjdXJzaW9uLzIzMTogIG9rICB8ClsgICAg
MC4wMDAwMDBdICAgICAgIGhhcmQtaXJxIHJlYWQtcmVjdXJzaW9uLzMxMjogIG9rICB8ClsgICAg
MC4wMDAwMDBdICAgICAgIHNvZnQtaXJxIHJlYWQtcmVjdXJzaW9uLzMxMjogIG9rICB8ClsgICAg
MC4wMDAwMDBdICAgICAgIGhhcmQtaXJxIHJlYWQtcmVjdXJzaW9uLzMyMTogIG9rICB8ClsgICAg
MC4wMDAwMDBdICAgICAgIHNvZnQtaXJxIHJlYWQtcmVjdXJzaW9uLzMyMTogIG9rICB8ClsgICAg
MC4wMDAwMDBdICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KWyAgICAwLjAwMDAwMF0gICB8IFdvdW5kL3dh
aXQgdGVzdHMgfApbICAgIDAuMDAwMDAwXSAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLQpbICAgIDAu
MDAwMDAwXSAgICAgICAgICAgICAgICAgICB3dyBhcGkgZmFpbHVyZXM6ICBvayAgfCAgb2sgIHwg
IG9rICB8ClsgICAgMC4wMDAwMDBdICAgICAgICAgICAgICAgIHd3IGNvbnRleHRzIG1peGluZzpm
YWlsZWR8ICBvayAgfApbICAgIDAuMDAwMDAwXSAgICAgICAgICAgICAgZmluaXNoaW5nIHd3IGNv
bnRleHQ6ICBvayAgfCAgb2sgIHwgIG9rICB8ICBvayAgfApbICAgIDAuMDAwMDAwXSAgICAgICAg
ICAgICAgICBsb2NraW5nIG1pc21hdGNoZXM6ICBvayAgfCAgb2sgIHwgIG9rICB8ClsgICAgMC4w
MDAwMDBdICAgICAgICAgICAgICAgICAgRURFQURMSyBoYW5kbGluZzogIG9rICB8ICBvayAgfCAg
b2sgIHwgIG9rICB8ICBvayAgfCAgb2sgIHwgIG9rICB8ICBvayAgfCAgb2sgIHwgIG9rICB8Clsg
ICAgMC4wMDAwMDBdICAgICAgICAgICAgc3BpbmxvY2sgbmVzdCB1bmxvY2tlZDpmYWlsZWR8Clsg
ICAgMC4wMDAwMDBdICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KWyAgICAwLjAwMDAwMF0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfGJsb2NrIHwgdHJ5ICB8Y29udGV4dHwKWyAgICAwLjAwMDAwMF0gICAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpbICAgIDAuMDAwMDAwXSAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRleHQ6ZmFpbGVkfCAgb2sgIHwgIG9rICB8Clsg
ICAgMC4wMDAwMDBdICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRyeTpmYWlsZWR8ICBv
ayAgfGZhaWxlZHwKWyAgICAwLjAwMDAwMF0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJs
b2NrOmZhaWxlZHwgIG9rICB8ZmFpbGVkfApbICAgIDAuMDAwMDAwXSAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3BpbmxvY2s6ZmFpbGVkfCAgb2sgIHxmYWlsZWR8ClsgICAgMC4wMDAwMDBdIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClsg
ICAgMC4wMDAwMDBdIDE1MSBvdXQgb2YgMjUzIHRlc3RjYXNlcyBmYWlsZWQsIGFzIGV4cGVjdGVk
LiB8ClsgICAgMC4wMDAwMDBdIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KWyAgICAwLjAwMDAwMF0gY2xvY2tzb3VyY2U6IGhwZXQ6IG1hc2s6IDB4
ZmZmZmZmZmYgbWF4X2N5Y2xlczogMHhmZmZmZmZmZiwgbWF4X2lkbGVfbnM6IDE5MTEyNjA0NDY3
IG5zClsgICAgMC4wMDAwMDBdIGhwZXQgY2xvY2tldmVudCByZWdpc3RlcmVkClsgICAgMC4wMDAw
MDBdIHRzYzogRGV0ZWN0ZWQgMjY5My41MDYgTUh6IHByb2Nlc3NvcgpbICAgIDAuMTQ1MDQxXSBD
YWxpYnJhdGluZyBkZWxheSBsb29wIChza2lwcGVkKSBwcmVzZXQgdmFsdWUuLiA1Mzg3LjAxIEJv
Z29NSVBTIChscGo9MjY5MzUwNikKWyAgICAwLjE0NTc2OF0gcGlkX21heDogZGVmYXVsdDogMzI3
NjggbWluaW11bTogMzAxClsgICAgMC4xNDYxNzddIEFDUEk6IENvcmUgcmV2aXNpb24gMjAxNTA5
MzAKWyAgICAwLjE0ODAzNF0gQUNQSTogMiBBQ1BJIEFNTCB0YWJsZXMgc3VjY2Vzc2Z1bGx5IGFj
cXVpcmVkIGFuZCBsb2FkZWQKWyAgICAwLjE0ODY1Nl0gTW91bnQtY2FjaGUgaGFzaCB0YWJsZSBl
bnRyaWVzOiAxMDI0IChvcmRlcjogMCwgNDA5NiBieXRlcykKWyAgICAwLjE0OTI4M10gTW91bnRw
b2ludC1jYWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDEwMjQgKG9yZGVyOiAwLCA0MDk2IGJ5dGVz
KQpbICAgIDAuMTUwMDg2XSBJbml0aWFsaXppbmcgY2dyb3VwIHN1YnN5cyBtZW1vcnkKWyAgICAw
LjE1MDUyNV0gSW5pdGlhbGl6aW5nIGNncm91cCBzdWJzeXMgZGV2aWNlcwpbICAgIDAuMTUwOTEw
XSBJbml0aWFsaXppbmcgY2dyb3VwIHN1YnN5cyBmcmVlemVyClsgICAgMC4xNTEzMjBdIEluaXRp
YWxpemluZyBjZ3JvdXAgc3Vic3lzIHBlcmZfZXZlbnQKWyAgICAwLjE1MTcxNF0gSW5pdGlhbGl6
aW5nIGNncm91cCBzdWJzeXMgcGlkcwpbICAgIDAuMTUyMTQ2XSBtY2U6IENQVSBzdXBwb3J0cyAx
MCBNQ0UgYmFua3MKWyAgICAwLjE1MjU2NV0gTGFzdCBsZXZlbCBpVExCIGVudHJpZXM6IDRLQiAw
LCAyTUIgMCwgNE1CIDAKWyAgICAwLjE1MzAxNl0gTGFzdCBsZXZlbCBkVExCIGVudHJpZXM6IDRL
QiAwLCAyTUIgMCwgNE1CIDAsIDFHQiAwClsgICAgMC4xNTQ0NjhdIEZyZWVpbmcgU01QIGFsdGVy
bmF0aXZlcyBtZW1vcnk6IDEySyAoYjE1N2EwMDAgLSBiMTU3ZDAwMCkKWyAgICAwLjE1NTcyMV0g
RW5hYmxpbmcgQVBJQyBtb2RlOiAgRmxhdC4gIFVzaW5nIDEgSS9PIEFQSUNzClsgICAgMC4xNTYy
MDNdIGVuYWJsZWQgRXh0SU5UIG9uIENQVSMwClsgICAgMC4xNTcxNDJdIEVOQUJMSU5HIElPLUFQ
SUMgSVJRcwpbICAgIDAuMTU3NDYwXSBpbml0IElPX0FQSUMgSVJRcwpbICAgIDAuMTU3NzY2XSAg
YXBpYyAwIHBpbiAwIG5vdCBjb25uZWN0ZWQKWyAgICAwLjE1ODEwM10gSU9BUElDWzBdOiBTZXQg
cm91dGluZyBlbnRyeSAoMC0xIC0+IDB4MzEgLT4gSVJRIDEgTW9kZTowIEFjdGl2ZTowIERlc3Q6
MSkKWyAgICAwLjE1ODc4M10gSU9BUElDWzBdOiBTZXQgcm91dGluZyBlbnRyeSAoMC0yIC0+IDB4
MzAgLT4gSVJRIDAgTW9kZTowIEFjdGl2ZTowIERlc3Q6MSkKWyAgICAwLjE1OTQ3M10gSU9BUElD
WzBdOiBTZXQgcm91dGluZyBlbnRyeSAoMC0zIC0+IDB4MzMgLT4gSVJRIDMgTW9kZTowIEFjdGl2
ZTowIERlc3Q6MSkKWyAgICAwLjE2MDEzMV0gSU9BUElDWzBdOiBTZXQgcm91dGluZyBlbnRyeSAo
MC00IC0+IDB4MzQgLT4gSVJRIDQgTW9kZTowIEFjdGl2ZTowIERlc3Q6MSkKWyAgICAwLjE2MDgx
MF0gSU9BUElDWzBdOiBTZXQgcm91dGluZyBlbnRyeSAoMC01IC0+IDB4MzUgLT4gSVJRIDUgTW9k
ZToxIEFjdGl2ZTowIERlc3Q6MSkKWyAgICAwLjE2MTQ5Nl0gSU9BUElDWzBdOiBTZXQgcm91dGlu
ZyBlbnRyeSAoMC02IC0+IDB4MzYgLT4gSVJRIDYgTW9kZTowIEFjdGl2ZTowIERlc3Q6MSkKWyAg
ICAwLjE2MjE1MF0gSU9BUElDWzBdOiBTZXQgcm91dGluZyBlbnRyeSAoMC03IC0+IDB4MzcgLT4g
SVJRIDcgTW9kZTowIEFjdGl2ZTowIERlc3Q6MSkKWyAgICAwLjE2MjgyOF0gSU9BUElDWzBdOiBT
ZXQgcm91dGluZyBlbnRyeSAoMC04IC0+IDB4MzggLT4gSVJRIDggTW9kZTowIEFjdGl2ZTowIERl
c3Q6MSkKWyAgICAwLjE2MzUxMV0gSU9BUElDWzBdOiBTZXQgcm91dGluZyBlbnRyeSAoMC05IC0+
IDB4MzkgLT4gSVJRIDkgTW9kZToxIEFjdGl2ZTowIERlc3Q6MSkKWyAgICAwLjE2NDE3Ml0gSU9B
UElDWzBdOiBTZXQgcm91dGluZyBlbnRyeSAoMC0xMCAtPiAweDNhIC0+IElSUSAxMCBNb2RlOjEg
QWN0aXZlOjAgRGVzdDoxKQpbICAgIDAuMTY0ODY5XSBJT0FQSUNbMF06IFNldCByb3V0aW5nIGVu
dHJ5ICgwLTExIC0+IDB4M2IgLT4gSVJRIDExIE1vZGU6MSBBY3RpdmU6MCBEZXN0OjEpClsgICAg
MC4xNjU1NjVdIElPQVBJQ1swXTogU2V0IHJvdXRpbmcgZW50cnkgKDAtMTIgLT4gMHgzYyAtPiBJ
UlEgMTIgTW9kZTowIEFjdGl2ZTowIERlc3Q6MSkKWyAgICAwLjE2NjIzNF0gSU9BUElDWzBdOiBT
ZXQgcm91dGluZyBlbnRyeSAoMC0xMyAtPiAweDNkIC0+IElSUSAxMyBNb2RlOjAgQWN0aXZlOjAg
RGVzdDoxKQpbICAgIDAuMTY2OTI2XSBJT0FQSUNbMF06IFNldCByb3V0aW5nIGVudHJ5ICgwLTE0
IC0+IDB4M2UgLT4gSVJRIDE0IE1vZGU6MCBBY3RpdmU6MCBEZXN0OjEpClsgICAgMC4xNjc2MThd
IElPQVBJQ1swXTogU2V0IHJvdXRpbmcgZW50cnkgKDAtMTUgLT4gMHgzZiAtPiBJUlEgMTUgTW9k
ZTowIEFjdGl2ZTowIERlc3Q6MSkKWyAgICAwLjE2ODMxMF0gIGFwaWMgMCBwaW4gMTYgbm90IGNv
bm5lY3RlZApbICAgIDAuMTY4NjM2XSAgYXBpYyAwIHBpbiAxNyBub3QgY29ubmVjdGVkClsgICAg
MC4xNjg5NjZdICBhcGljIDAgcGluIDE4IG5vdCBjb25uZWN0ZWQKWyAgICAwLjE2OTMxN10gIGFw
aWMgMCBwaW4gMTkgbm90IGNvbm5lY3RlZApbICAgIDAuMTY5NjQzXSAgYXBpYyAwIHBpbiAyMCBu
b3QgY29ubmVjdGVkClsgICAgMC4xNjk5NzZdICBhcGljIDAgcGluIDIxIG5vdCBjb25uZWN0ZWQK
WyAgICAwLjE3MDMyN10gIGFwaWMgMCBwaW4gMjIgbm90IGNvbm5lY3RlZApbICAgIDAuMTcwNjQ5
XSAgYXBpYyAwIHBpbiAyMyBub3QgY29ubmVjdGVkClsgICAgMC4xNzExMTddIC4uVElNRVI6IHZl
Y3Rvcj0weDMwIGFwaWMxPTAgcGluMT0yIGFwaWMyPS0xIHBpbjI9LTEKWyAgICAwLjE3MTc2M10g
VXNpbmcgbG9jYWwgQVBJQyB0aW1lciBpbnRlcnJ1cHRzLgpbICAgIDAuMTcxNzYzXSBjYWxpYnJh
dGluZyBBUElDIHRpbWVyIC4uLgpbICAgIDAuMjc0Mjc1XSAuLi4gbGFwaWMgZGVsdGEgPSA2MjUw
MDU1ClsgICAgMC4yNzQ2NjFdIC4uLiBQTS1UaW1lciBkZWx0YSA9IDM1Nzk0OQpbICAgIDAuMjc1
MDc4XSAuLi4gUE0tVGltZXIgcmVzdWx0IG9rClsgICAgMC4yNzU1MjhdIC4uLi4uIGRlbHRhIDYy
NTAwNTUKWyAgICAwLjI3NTk3M10gLi4uLi4gbXVsdDogMjY4NDM3ODE4ClsgICAgMC4yNzY0NThd
IC4uLi4uIGNhbGlicmF0aW9uIHJlc3VsdDogMTAwMDAwOApbICAgIDAuMjc3MDYzXSAuLi4uLiBD
UFUgY2xvY2sgc3BlZWQgaXMgMjY5My4wNDY1IE1Iei4KWyAgICAwLjI3Nzc2OF0gLi4uLi4gaG9z
dCBidXMgY2xvY2sgc3BlZWQgaXMgMTAwMC4wMDA4IE1Iei4KWyAgICAwLjI3ODU3NV0gc21wYm9v
dDogQ1BVMDogSW50ZWwgQ29tbW9uIEtWTSBwcm9jZXNzb3IgKGZhbWlseTogMHhmLCBtb2RlbDog
MHg2LCBzdGVwcGluZzogMHgxKQpbICAgIDAuMjc5ODQ0XSBQZXJmb3JtYW5jZSBFdmVudHM6IHVu
c3VwcG9ydGVkIE5ldGJ1cnN0IENQVSBtb2RlbCA2IG5vIFBNVSBkcml2ZXIsIHNvZnR3YXJlIGV2
ZW50cyBvbmx5LgpbICAgIDAuMjg5NjMwXSBDUFUgMSBpcnFzdGFja3MsIGhhcmQ9YjAwN2MwMDAg
c29mdD1iMDA3ZTAwMApbICAgIDAuMjkxMDMyXSB4ODY6IEJvb3RpbmcgU01QIGNvbmZpZ3VyYXRp
b246ClsgICAgMC4yOTIwMjJdIC4uLi4gbm9kZSAgIzAsIENQVXM6ICAgICAgIzEKWzEyNjY4NzQ4
ODYuMDIxNTA1XSBJbml0aWFsaXppbmcgQ1BVIzEKWyAgICAwLjMwNDQ5N10ga3ZtLWNsb2NrOiBj
cHUgMSwgbXNyIDA6MTEzOWEwNDEsIHNlY29uZGFyeSBjcHUgY2xvY2sKWyAgICAwLjMwNTA4MF0g
bWFza2VkIEV4dElOVCBvbiBDUFUjMQpbICAgIDAuMzI1NTMwXSB4ODY6IEJvb3RlZCB1cCAxIG5v
ZGUsIDIgQ1BVcwpbICAgIDAuMzI1NTQxXSBLVk0gc2V0dXAgYXN5bmMgUEYgZm9yIGNwdSAxClsg
ICAgMC4zMjU1NDddIGt2bS1zdGVhbHRpbWU6IGNwdSAxLCBtc3IgMTEwOThiMDAKWyAgICAwLjMy
NjU3M10gLS0tLS0tLS0tLS0tLS0tLQpbICAgIDAuMzI2ODEyXSB8IE5NSSB0ZXN0c3VpdGU6Clsg
ICAgMC4zMjcwNTRdIC0tLS0tLS0tLS0tLS0tLS0tLS0tClsgICAgMC4zMjczMThdICAgcmVtb3Rl
IElQSTogIG9rICB8ClsgICAgMC4zMzA2ODhdICAgIGxvY2FsIElQSTogIG9rICB8ClsgICAgMC4z
Mzg1ODVdIC0tLS0tLS0tLS0tLS0tLS0tLS0tClsgICAgMC4zMzg4NzRdIEdvb2QsIGFsbCAgIDIg
dGVzdGNhc2VzIHBhc3NlZCEgfApbICAgIDAuMzM5MjQ5XSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KWyAgICAwLjMzOTg0OV0gc21wYm9vdDogVG90YWwgb2YgMiBwcm9jZXNzb3Jz
IGFjdGl2YXRlZCAoMTA3NzQuMDIgQm9nb01JUFMpClsgICAgMC4zNDE0MzldIGRldnRtcGZzOiBp
bml0aWFsaXplZApbICAgIDAuMzQzMDExXSBjbG9ja3NvdXJjZTogamlmZmllczogbWFzazogMHhm
ZmZmZmZmZiBtYXhfY3ljbGVzOiAweGZmZmZmZmZmLCBtYXhfaWRsZV9uczogMTkxMTI2MDQ0NjI3
NTAwMCBucwpbICAgIDAuMzQ3MTYwXSBwcmFuZG9tOiBzZWVkIGJvdW5kYXJ5IHNlbGYgdGVzdCBw
YXNzZWQKWyAgICAwLjM0ODI4MF0gcHJhbmRvbTogMTAwIHNlbGYgdGVzdHMgcGFzc2VkClsgICAg
MC4zNDkwNTBdIHJlZ3VsYXRvci1kdW1teTogbm8gcGFyYW1ldGVycwpbICAgIDAuMzQ5OTI4XSBO
RVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDE2ClsgICAgMC4zNTM1ODBdIGNwdWlkbGU6
IHVzaW5nIGdvdmVybm9yIGxhZGRlcgpbICAgIDAuMzU3NTg0XSBjcHVpZGxlOiB1c2luZyBnb3Zl
cm5vciBtZW51ClsgICAgMC4zNTgzOTVdIEFDUEk6IGJ1cyB0eXBlIFBDSSByZWdpc3RlcmVkClsg
ICAgMC4zNTg5NzhdIFBDSTogUENJIEJJT1MgcmV2aXNpb24gMi4xMCBlbnRyeSBhdCAweGZkNDBm
LCBsYXN0IGJ1cz0wClsgICAgMC4zNTk1NzZdIFBDSTogVXNpbmcgY29uZmlndXJhdGlvbiB0eXBl
IDEgZm9yIGJhc2UgYWNjZXNzClsgICAgMC4zNjQwMDhdIEFDUEk6IEFkZGVkIF9PU0koTW9kdWxl
IERldmljZSkKWyAgICAwLjM2NDU5N10gQUNQSTogQWRkZWQgX09TSShQcm9jZXNzb3IgRGV2aWNl
KQpbICAgIDAuMzY0OTkzXSBBQ1BJOiBBZGRlZCBfT1NJKDMuMCBfU0NQIEV4dGVuc2lvbnMpClsg
ICAgMC4zNjU0MTNdIEFDUEk6IEFkZGVkIF9PU0koUHJvY2Vzc29yIEFnZ3JlZ2F0b3IgRGV2aWNl
KQpbICAgIDAuMzY3NDkyXSBBQ1BJOiBJbnRlcnByZXRlciBlbmFibGVkClsgICAgMC4zNjc4Mjld
IEFDUEk6IChzdXBwb3J0cyBTMCBTNSkKWyAgICAwLjM2ODE5NV0gQUNQSTogVXNpbmcgSU9BUElD
IGZvciBpbnRlcnJ1cHQgcm91dGluZwpbICAgIDAuMzY4NzM4XSBQQ0k6IFVzaW5nIGhvc3QgYnJp
ZGdlIHdpbmRvd3MgZnJvbSBBQ1BJOyBpZiBuZWNlc3NhcnksIHVzZSAicGNpPW5vY3JzIiBhbmQg
cmVwb3J0IGEgYnVnClsgICAgMC4zNzI1MTNdIEFDUEk6IFBDSSBSb290IEJyaWRnZSBbUENJMF0g
KGRvbWFpbiAwMDAwIFtidXMgMDAtZmZdKQpbICAgIDAuMzczMDQyXSBhY3BpIFBOUDBBMDM6MDA6
IF9PU0M6IE9TIHN1cHBvcnRzIFtTZWdtZW50c10KWyAgICAwLjM3MzQ4Ml0gYWNwaSBQTlAwQTAz
OjAwOiBfT1NDIGZhaWxlZCAoQUVfTk9UX0ZPVU5EKTsgZGlzYWJsaW5nIEFTUE0KWyAgICAwLjM3
NDAzNl0gYWNwaSBQTlAwQTAzOjAwOiBmYWlsIHRvIGFkZCBNTUNPTkZJRyBpbmZvcm1hdGlvbiwg
Y2FuJ3QgYWNjZXNzIGV4dGVuZGVkIFBDSSBjb25maWd1cmF0aW9uIHNwYWNlIHVuZGVyIHRoaXMg
YnJpZGdlLgpbICAgIDAuMzc1MDExXSBQQ0kgaG9zdCBicmlkZ2UgdG8gYnVzIDAwMDA6MDAKWyAg
ICAwLjM3NTM1Ml0gcGNpX2J1cyAwMDAwOjAwOiByb290IGJ1cyByZXNvdXJjZSBbaW8gIDB4MDAw
MC0weDBjZjcgd2luZG93XQpbICAgIDAuMzc1OTE3XSBwY2lfYnVzIDAwMDA6MDA6IHJvb3QgYnVz
IHJlc291cmNlIFtpbyAgMHgwZDAwLTB4ZmZmZiB3aW5kb3ddClsgICAgMC4zNzY0NjFdIHBjaV9i
dXMgMDAwMDowMDogcm9vdCBidXMgcmVzb3VyY2UgW21lbSAweDAwMGEwMDAwLTB4MDAwYmZmZmYg
d2luZG93XQpbICAgIDAuMzc3MDc0XSBwY2lfYnVzIDAwMDA6MDA6IHJvb3QgYnVzIHJlc291cmNl
IFttZW0gMHgxMmMwMDAwMC0weGZlYmZmZmZmIHdpbmRvd10KWyAgICAwLjM3NzY4NF0gcGNpX2J1
cyAwMDAwOjAwOiByb290IGJ1cyByZXNvdXJjZSBbYnVzIDAwLWZmXQpbICAgIDAuMzc4MTYzXSBw
Y2kgMDAwMDowMDowMC4wOiBbODA4NjoxMjM3XSB0eXBlIDAwIGNsYXNzIDB4MDYwMDAwClsgICAg
MC4zNzg5NTNdIHBjaSAwMDAwOjAwOjAxLjA6IFs4MDg2OjcwMDBdIHR5cGUgMDAgY2xhc3MgMHgw
NjAxMDAKWyAgICAwLjM3OTgyMV0gcGNpIDAwMDA6MDA6MDEuMTogWzgwODY6NzAxMF0gdHlwZSAw
MCBjbGFzcyAweDAxMDE4MApbICAgIDAuMzk0MTQxXSBwY2kgMDAwMDowMDowMS4xOiByZWcgMHgy
MDogW2lvICAweGMyMDAtMHhjMjBmXQpbICAgIDAuMzk5MDc4XSBwY2kgMDAwMDowMDowMS4xOiBs
ZWdhY3kgSURFIHF1aXJrOiByZWcgMHgxMDogW2lvICAweDAxZjAtMHgwMWY3XQpbICAgIDAuMzk5
NjYzXSBwY2kgMDAwMDowMDowMS4xOiBsZWdhY3kgSURFIHF1aXJrOiByZWcgMHgxNDogW2lvICAw
eDAzZjZdClsgICAgMC40MDAzMzJdIHBjaSAwMDAwOjAwOjAxLjE6IGxlZ2FjeSBJREUgcXVpcms6
IHJlZyAweDE4OiBbaW8gIDB4MDE3MC0weDAxNzddClsgICAgMC40MDEyODZdIHBjaSAwMDAwOjAw
OjAxLjE6IGxlZ2FjeSBJREUgcXVpcms6IHJlZyAweDFjOiBbaW8gIDB4MDM3Nl0KWyAgICAwLjQw
MjExNV0gcGNpIDAwMDA6MDA6MDEuMzogWzgwODY6NzExM10gdHlwZSAwMCBjbGFzcyAweDA2ODAw
MApbICAgIDAuNDA0MjI1XSBwY2kgMDAwMDowMDowMS4zOiBxdWlyazogW2lvICAweDA2MDAtMHgw
NjNmXSBjbGFpbWVkIGJ5IFBJSVg0IEFDUEkKWyAgICAwLjQwNDgyNl0gcGNpIDAwMDA6MDA6MDEu
MzogcXVpcms6IFtpbyAgMHgwNzAwLTB4MDcwZl0gY2xhaW1lZCBieSBQSUlYNCBTTUIKWyAgICAw
LjQwNTc1Ml0gcGNpIDAwMDA6MDA6MDIuMDogWzEyMzQ6MTExMV0gdHlwZSAwMCBjbGFzcyAweDAz
MDAwMApbICAgIDAuNDEwNDYyXSBwY2kgMDAwMDowMDowMi4wOiByZWcgMHgxMDogW21lbSAweGZk
MDAwMDAwLTB4ZmRmZmZmZmYgcHJlZl0KWyAgICAwLjQyMTQ0N10gcGNpIDAwMDA6MDA6MDIuMDog
cmVnIDB4MTg6IFttZW0gMHhmZWJmMDAwMC0weGZlYmYwZmZmXQpbICAgIDAuNDQxMDU4XSBwY2kg
MDAwMDowMDowMi4wOiByZWcgMHgzMDogW21lbSAweGZlYmUwMDAwLTB4ZmViZWZmZmYgcHJlZl0K
WyAgICAwLjQ0Mzg1NV0gcGNpIDAwMDA6MDA6MDMuMDogWzgwODY6MTAwZV0gdHlwZSAwMCBjbGFz
cyAweDAyMDAwMApbICAgIDAuNDQ4MzI1XSBwY2kgMDAwMDowMDowMy4wOiByZWcgMHgxMDogW21l
bSAweGZlYmMwMDAwLTB4ZmViZGZmZmZdClsgICAgMC40NTI5NzZdIHBjaSAwMDAwOjAwOjAzLjA6
IHJlZyAweDE0OiBbaW8gIDB4YzAwMC0weGMwM2ZdClsgICAgMC40NzY1ODBdIHBjaSAwMDAwOjAw
OjAzLjA6IHJlZyAweDMwOiBbbWVtIDB4ZmViODAwMDAtMHhmZWJiZmZmZiBwcmVmXQpbICAgIDAu
NDc3Mzc0XSBwY2kgMDAwMDowMDowNC4wOiBbMWFmNDoxMDAxXSB0eXBlIDAwIGNsYXNzIDB4MDEw
MDAwClsgICAgMC40ODg0NDddIHBjaSAwMDAwOjAwOjA0LjA6IHJlZyAweDEwOiBbaW8gIDB4YzA0
MC0weGMwN2ZdClsgICAgMC40OTQ2NDRdIHBjaSAwMDAwOjAwOjA0LjA6IHJlZyAweDE0OiBbbWVt
IDB4ZmViZjEwMDAtMHhmZWJmMWZmZl0KWyAgICAwLjUyNjM3N10gcGNpIDAwMDA6MDA6MDUuMDog
WzFhZjQ6MTAwMV0gdHlwZSAwMCBjbGFzcyAweDAxMDAwMApbICAgIDAuNTM0MTIzXSBwY2kgMDAw
MDowMDowNS4wOiByZWcgMHgxMDogW2lvICAweGMwODAtMHhjMGJmXQpbICAgIDAuNTQyMDkwXSBw
Y2kgMDAwMDowMDowNS4wOiByZWcgMHgxNDogW21lbSAweGZlYmYyMDAwLTB4ZmViZjJmZmZdClsg
ICAgMC41NzY1MDddIHBjaSAwMDAwOjAwOjA2LjA6IFsxYWY0OjEwMDFdIHR5cGUgMDAgY2xhc3Mg
MHgwMTAwMDAKWyAgICAwLjU4Mjg2M10gcGNpIDAwMDA6MDA6MDYuMDogcmVnIDB4MTA6IFtpbyAg
MHhjMGMwLTB4YzBmZl0KWyAgICAwLjU4Nzg2OV0gcGNpIDAwMDA6MDA6MDYuMDogcmVnIDB4MTQ6
IFttZW0gMHhmZWJmMzAwMC0weGZlYmYzZmZmXQpbICAgIDAuNjE0MDA3XSBwY2kgMDAwMDowMDow
Ny4wOiBbMWFmNDoxMDAxXSB0eXBlIDAwIGNsYXNzIDB4MDEwMDAwClsgICAgMC42MTg0MDhdIHBj
aSAwMDAwOjAwOjA3LjA6IHJlZyAweDEwOiBbaW8gIDB4YzEwMC0weGMxM2ZdClsgICAgMC42MjIx
NjZdIHBjaSAwMDAwOjAwOjA3LjA6IHJlZyAweDE0OiBbbWVtIDB4ZmViZjQwMDAtMHhmZWJmNGZm
Zl0KWyAgICAwLjY0NTMyOV0gcGNpIDAwMDA6MDA6MDguMDogWzFhZjQ6MTAwMV0gdHlwZSAwMCBj
bGFzcyAweDAxMDAwMApbICAgIDAuNjUwMjM2XSBwY2kgMDAwMDowMDowOC4wOiByZWcgMHgxMDog
W2lvICAweGMxNDAtMHhjMTdmXQpbICAgIDAuNjU2MDM4XSBwY2kgMDAwMDowMDowOC4wOiByZWcg
MHgxNDogW21lbSAweGZlYmY1MDAwLTB4ZmViZjVmZmZdClsgICAgMC42Nzk5MjhdIHBjaSAwMDAw
OjAwOjA5LjA6IFsxYWY0OjEwMDFdIHR5cGUgMDAgY2xhc3MgMHgwMTAwMDAKWyAgICAwLjY4NDAx
OV0gcGNpIDAwMDA6MDA6MDkuMDogcmVnIDB4MTA6IFtpbyAgMHhjMTgwLTB4YzFiZl0KWyAgICAw
LjY4ODQ2Nl0gcGNpIDAwMDA6MDA6MDkuMDogcmVnIDB4MTQ6IFttZW0gMHhmZWJmNjAwMC0weGZl
YmY2ZmZmXQpbICAgIDAuNzExODE4XSBwY2kgMDAwMDowMDowYS4wOiBbMWFmNDoxMDAxXSB0eXBl
IDAwIGNsYXNzIDB4MDEwMDAwClsgICAgMC43MTkxNDVdIHBjaSAwMDAwOjAwOjBhLjA6IHJlZyAw
eDEwOiBbaW8gIDB4YzFjMC0weGMxZmZdClsgICAgMC43MjUyNzVdIHBjaSAwMDAwOjAwOjBhLjA6
IHJlZyAweDE0OiBbbWVtIDB4ZmViZjcwMDAtMHhmZWJmN2ZmZl0KWyAgICAwLjc1MTI2M10gcGNp
IDAwMDA6MDA6MGIuMDogWzgwODY6MjVhYl0gdHlwZSAwMCBjbGFzcyAweDA4ODAwMApbICAgIDAu
NzU0NDc0XSBwY2kgMDAwMDowMDowYi4wOiByZWcgMHgxMDogW21lbSAweGZlYmY4MDAwLTB4ZmVi
ZjgwMGZdClsgICAgMC43NjcwNTNdIHBjaV9idXMgMDAwMDowMDogb24gTlVNQSBub2RlIDAKWyAg
ICAwLjc2Nzg2Ml0gQUNQSTogUENJIEludGVycnVwdCBMaW5rIFtMTktBXSAoSVJRcyA1ICoxMCAx
MSkKWyAgICAwLjc2ODUzN10gQUNQSTogUENJIEludGVycnVwdCBMaW5rIFtMTktCXSAoSVJRcyA1
ICoxMCAxMSkKWyAgICAwLjc2OTIyNV0gQUNQSTogUENJIEludGVycnVwdCBMaW5rIFtMTktDXSAo
SVJRcyA1IDEwICoxMSkKWyAgICAwLjc2OTg2Ml0gQUNQSTogUENJIEludGVycnVwdCBMaW5rIFtM
TktEXSAoSVJRcyA1IDEwICoxMSkKWyAgICAwLjc3MDQ5NF0gQUNQSTogUENJIEludGVycnVwdCBM
aW5rIFtMTktTXSAoSVJRcyAqOSkKWyAgICAwLjc3MTMwMl0gQUNQSTogRW5hYmxlZCAxNiBHUEVz
IGluIGJsb2NrIDAwIHRvIDBGClsgICAgMC43NzIwMzNdIHZnYWFyYjogc2V0dGluZyBhcyBib290
IGRldmljZTogUENJOjAwMDA6MDA6MDIuMApbICAgIDAuNzcyNTE2XSB2Z2FhcmI6IGRldmljZSBh
ZGRlZDogUENJOjAwMDA6MDA6MDIuMCxkZWNvZGVzPWlvK21lbSxvd25zPWlvK21lbSxsb2Nrcz1u
b25lClsgICAgMC43NzMyMjJdIHZnYWFyYjogbG9hZGVkClsgICAgMC43NzM0NDhdIHZnYWFyYjog
YnJpZGdlIGNvbnRyb2wgcG9zc2libGUgMDAwMDowMDowMi4wClsgICAgMC43NzQwNDBdIExpbnV4
IHZpZGVvIGNhcHR1cmUgaW50ZXJmYWNlOiB2Mi4wMApbICAgIDAuNzc2MzIwXSBwcHNfY29yZTog
TGludXhQUFMgQVBJIHZlci4gMSByZWdpc3RlcmVkClsgICAgMC43NzcwNzZdIHBwc19jb3JlOiBT
b2Z0d2FyZSB2ZXIuIDUuMy42IC0gQ29weXJpZ2h0IDIwMDUtMjAwNyBSb2RvbGZvIEdpb21ldHRp
IDxnaW9tZXR0aUBsaW51eC5pdD4KWyAgICAwLjc3ODU5NF0gQWR2YW5jZWQgTGludXggU291bmQg
QXJjaGl0ZWN0dXJlIERyaXZlciBJbml0aWFsaXplZC4KWyAgICAwLjc3OTQ1OV0gUENJOiBVc2lu
ZyBBQ1BJIGZvciBJUlEgcm91dGluZwpbICAgIDAuNzgwMTE2XSBQQ0k6IHBjaV9jYWNoZV9saW5l
X3NpemUgc2V0IHRvIDY0IGJ5dGVzClsgICAgMC43ODExMTddIGU4MjA6IHJlc2VydmUgUkFNIGJ1
ZmZlciBbbWVtIDB4MDAwOWZjMDAtMHgwMDA5ZmZmZl0KWyAgICAwLjc4MTk4NV0gZTgyMDogcmVz
ZXJ2ZSBSQU0gYnVmZmVyIFttZW0gMHgxMmJlMDAwMC0weDEzZmZmZmZmXQpbICAgIDAuNzgzNTgz
XSBjbG9ja3NvdXJjZTogU3dpdGNoZWQgdG8gY2xvY2tzb3VyY2Uga3ZtLWNsb2NrClsgICAgMC43
ODQ1MTNdIEZTLUNhY2hlOiBMb2FkZWQKWyAgICAwLjc4NTA3NV0gcG5wOiBQblAgQUNQSSBpbml0
ClsgICAgMC43ODU2MTBdIHBucCAwMDowMDogUGx1ZyBhbmQgUGxheSBBQ1BJIGRldmljZSwgSURz
IFBOUDBiMDAgKGFjdGl2ZSkKWyAgICAwLjc4NjY4N10gcG5wIDAwOjAxOiBQbHVnIGFuZCBQbGF5
IEFDUEkgZGV2aWNlLCBJRHMgUE5QMDMwMyAoYWN0aXZlKQpbICAgIDAuNzg3Njc1XSBwbnAgMDA6
MDI6IFBsdWcgYW5kIFBsYXkgQUNQSSBkZXZpY2UsIElEcyBQTlAwZjEzIChhY3RpdmUpClsgICAg
MC43ODg2NjhdIHBucCAwMDowMzogW2RtYSAyXQpbICAgIDAuNzg5MTU1XSBwbnAgMDA6MDM6IFBs
dWcgYW5kIFBsYXkgQUNQSSBkZXZpY2UsIElEcyBQTlAwNzAwIChhY3RpdmUpClsgICAgMC43OTAx
NjhdIHBucCAwMDowNDogUGx1ZyBhbmQgUGxheSBBQ1BJIGRldmljZSwgSURzIFBOUDA0MDAgKGFj
dGl2ZSkKWyAgICAwLjc5MTE3N10gcG5wIDAwOjA1OiBQbHVnIGFuZCBQbGF5IEFDUEkgZGV2aWNl
LCBJRHMgUE5QMDUwMSAoYWN0aXZlKQpbICAgIDAuNzkyNDkzXSBwbnA6IFBuUCBBQ1BJOiBmb3Vu
ZCA2IGRldmljZXMKWyAgICAwLjc5MzExNF0gUG5QQklPUzogRGlzYWJsZWQgYnkgQUNQSSBQTlAK
WyAgICAwLjgyOTAyNV0gY2xvY2tzb3VyY2U6IGFjcGlfcG06IG1hc2s6IDB4ZmZmZmZmIG1heF9j
eWNsZXM6IDB4ZmZmZmZmLCBtYXhfaWRsZV9uczogMjA4NTcwMTAyNCBucwpbICAgIDAuODMwMDAz
XSBwY2lfYnVzIDAwMDA6MDA6IHJlc291cmNlIDQgW2lvICAweDAwMDAtMHgwY2Y3IHdpbmRvd10K
WyAgICAwLjgzMDc0M10gcGNpX2J1cyAwMDAwOjAwOiByZXNvdXJjZSA1IFtpbyAgMHgwZDAwLTB4
ZmZmZiB3aW5kb3ddClsgICAgMC44MzE1NjFdIHBjaV9idXMgMDAwMDowMDogcmVzb3VyY2UgNiBb
bWVtIDB4MDAwYTAwMDAtMHgwMDBiZmZmZiB3aW5kb3ddClsgICAgMC44MzIyNzZdIHBjaV9idXMg
MDAwMDowMDogcmVzb3VyY2UgNyBbbWVtIDB4MTJjMDAwMDAtMHhmZWJmZmZmZiB3aW5kb3ddClsg
ICAgMC44MzMwNDddIE5FVDogUmVnaXN0ZXJlZCBwcm90b2NvbCBmYW1pbHkgMQpbICAgIDAuODMz
NzE0XSBwY2kgMDAwMDowMDowMC4wOiBMaW1pdGluZyBkaXJlY3QgUENJL1BDSSB0cmFuc2ZlcnMK
WyAgICAwLjgzNDY3OF0gcGNpIDAwMDA6MDA6MDEuMDogUElJWDM6IEVuYWJsaW5nIFBhc3NpdmUg
UmVsZWFzZQpbICAgIDAuODM1NDI1XSBwY2kgMDAwMDowMDowMS4wOiBBY3RpdmF0aW5nIElTQSBE
TUEgaGFuZyB3b3JrYXJvdW5kcwpbICAgIDAuODM2MzAxXSBwY2kgMDAwMDowMDowMi4wOiBWaWRl
byBkZXZpY2Ugd2l0aCBzaGFkb3dlZCBST00KWyAgICAwLjgzNzMwNF0gUENJOiBDTFMgMCBieXRl
cywgZGVmYXVsdCA2NApbICAgIDAuODM4MDA5XSBVbnBhY2tpbmcgaW5pdHJhbWZzLi4uClsgICAg
MS40NDMyMTNdIEZyZWVpbmcgaW5pdHJkIG1lbW9yeTogMjQ4NTJLIChjMTM5YjAwMCAtIGMyYmUw
MDAwKQpbICAgIDEuNDQ0MDYwXSBTY2FubmluZyBmb3IgbG93IG1lbW9yeSBjb3JydXB0aW9uIGV2
ZXJ5IDYwIHNlY29uZHMKWyAgICAxLjQ0NDc3Ml0gY3J5cHRvbWdyX3Rlc3QgKDI0KSB1c2VkIGdy
ZWF0ZXN0IHN0YWNrIGRlcHRoOiA3NTk2IGJ5dGVzIGxlZnQKWyAgICAxLjQ0NzIzMF0gUENMTVVM
UURRLU5JIGluc3RydWN0aW9ucyBhcmUgbm90IGRldGVjdGVkLgpbICAgIDEuNDQ4MDMyXSBzcGlu
X2xvY2stdG9ydHVyZTotLS0gU3RhcnQgb2YgdGVzdCBbZGVidWddOiBud3JpdGVyc19zdHJlc3M9
NCBucmVhZGVyc19zdHJlc3M9MCBzdGF0X2ludGVydmFsPTYwIHZlcmJvc2U9MSBzaHVmZmxlX2lu
dGVydmFsPTMgc3R1dHRlcj01IHNodXRkb3duX3NlY3M9MCBvbm9mZl9pbnRlcnZhbD0wIG9ub2Zm
X2hvbGRvZmY9MApbICAgIDEuNDQ5ODM4XSBzcGluX2xvY2stdG9ydHVyZTogQ3JlYXRpbmcgdG9y
dHVyZV9zaHVmZmxlIHRhc2sKWyAgICAxLjQ1MDczMl0gc3Bpbl9sb2NrLXRvcnR1cmU6IHRvcnR1
cmVfc2h1ZmZsZSB0YXNrIHN0YXJ0ZWQKWyAgICAxLjQ1MTM3OF0gc3Bpbl9sb2NrLXRvcnR1cmU6
IENyZWF0aW5nIHRvcnR1cmVfc3R1dHRlciB0YXNrClsgICAgMS40NTMwNDNdIHNwaW5fbG9jay10
b3J0dXJlOiBDcmVhdGluZyBsb2NrX3RvcnR1cmVfd3JpdGVyIHRhc2sKWyAgICAxLjQ1MzA1MF0g
c3Bpbl9sb2NrLXRvcnR1cmU6IHRvcnR1cmVfc3R1dHRlciB0YXNrIHN0YXJ0ZWQKWyAgICAxLjQ2
ODA4NV0gc3Bpbl9sb2NrLXRvcnR1cmU6IENyZWF0aW5nIGxvY2tfdG9ydHVyZV93cml0ZXIgdGFz
awpbICAgIDEuNDY5MTMxXSBzcGluX2xvY2stdG9ydHVyZTogbG9ja190b3J0dXJlX3dyaXRlciB0
YXNrIHN0YXJ0ZWQKWyAgICAxLjQ3MDEwNF0gc3Bpbl9sb2NrLXRvcnR1cmU6IENyZWF0aW5nIGxv
Y2tfdG9ydHVyZV93cml0ZXIgdGFzawpbICAgIDEuNDcxMDkzXSBzcGluX2xvY2stdG9ydHVyZTog
bG9ja190b3J0dXJlX3dyaXRlciB0YXNrIHN0YXJ0ZWQKWyAgICAxLjQ3MjEzMV0gc3Bpbl9sb2Nr
LXRvcnR1cmU6IENyZWF0aW5nIGxvY2tfdG9ydHVyZV93cml0ZXIgdGFzawpbICAgIDEuNDczMTc0
XSBzcGluX2xvY2stdG9ydHVyZTogbG9ja190b3J0dXJlX3dyaXRlciB0YXNrIHN0YXJ0ZWQKWyAg
ICAxLjQ3NDIzN10gc3Bpbl9sb2NrLXRvcnR1cmU6IENyZWF0aW5nIGxvY2tfdG9ydHVyZV9zdGF0
cyB0YXNrClsgICAgMS40NzUyNTVdIHNwaW5fbG9jay10b3J0dXJlOiBsb2NrX3RvcnR1cmVfd3Jp
dGVyIHRhc2sgc3RhcnRlZApbICAgIDEuNDc2Mzk5XSBmdXRleCBoYXNoIHRhYmxlIGVudHJpZXM6
IDUxMiAob3JkZXI6IDMsIDMyNzY4IGJ5dGVzKQpbICAgIDEuNDc3NTMyXSBJbml0aWFsaXNlIHN5
c3RlbSB0cnVzdGVkIGtleXJpbmcKWyAgICAxLjQ3ODMxOV0gc3Bpbl9sb2NrLXRvcnR1cmU6IGxv
Y2tfdG9ydHVyZV9zdGF0cyB0YXNrIHN0YXJ0ZWQKWyAgICAxLjQ4MzA1MV0gY3J5cHRvbWdyX3Rl
c3QgKDQzKSB1c2VkIGdyZWF0ZXN0IHN0YWNrIGRlcHRoOiA3NDE2IGJ5dGVzIGxlZnQKWyAgICAx
LjQ4Njg2Ml0gS2V5IHR5cGUgYXN5bW1ldHJpYyByZWdpc3RlcmVkClsgICAgMS40ODczNDBdIEFz
eW1tZXRyaWMga2V5IHBhcnNlciAneDUwOScgcmVnaXN0ZXJlZApbICAgIDEuNDg4MTIwXSB0ZXN0
X2Zpcm13YXJlOiBpbnRlcmZhY2UgcmVhZHkKWyAgICAxLjQ4ODU0Ml0gdGVzdF9wcmludGY6IGFs
bCAxMTEgdGVzdHMgcGFzc2VkClsgICAgMS40ODkwNjddIDEwNC1pZGlvLTE2IDEwNC1pZGlvLTE2
OiBVbmFibGUgdG8gbG9jayAxMDQtaWRpby0xNiBwb3J0IGFkZHJlc3NlcyAoMHgwLTB4OCkKWyAg
ICAxLjQ4OTc2NV0gMTA0LWlkaW8tMTY6IHByb2JlIG9mIDEwNC1pZGlvLTE2IGZhaWxlZCB3aXRo
IGVycm9yIC0xNgpbICAgIDEuNDkwNDUyXSBpbnB1dDogUG93ZXIgQnV0dG9uIGFzIC9kZXZpY2Vz
L0xOWFNZU1RNOjAwL0xOWFBXUkJOOjAwL2lucHV0L2lucHV0MApbICAgIDEuNDkxMzAzXSBBQ1BJ
OiBQb3dlciBCdXR0b24gW1BXUkZdClsgICAgMS40OTE4NTFdIFdhcm5pbmc6IFByb2Nlc3NvciBQ
bGF0Zm9ybSBMaW1pdCBldmVudCBkZXRlY3RlZCwgYnV0IG5vdCBoYW5kbGVkLgpbICAgIDEuNDky
OTI3XSBDb25zaWRlciBjb21waWxpbmcgQ1BVZnJlcSBzdXBwb3J0IGludG8geW91ciBrZXJuZWwu
ClsgICAgMS40OTM4NjldIGlzYXBucDogU2Nhbm5pbmcgZm9yIFBuUCBjYXJkcy4uLgpbICAgIDEu
ODY0OTY1XSBpc2FwbnA6IE5vIFBsdWcgJiBQbGF5IGRldmljZSBmb3VuZApbICAgIDEuODgwNzQy
XSBTZXJpYWw6IDgyNTAvMTY1NTAgZHJpdmVyLCA0IHBvcnRzLCBJUlEgc2hhcmluZyBkaXNhYmxl
ZApbICAgIDEuOTA2MDIxXSAwMDowNTogdHR5UzAgYXQgSS9PIDB4M2Y4IChpcnEgPSA0LCBiYXNl
X2JhdWQgPSAxMTUyMDApIGlzIGEgMTY1NTBBClsgICAgMS45MDc3MDhdIHRvc2hpYmE6IG5vdCBh
IHN1cHBvcnRlZCBUb3NoaWJhIGxhcHRvcApbICAgIDEuOTA4NDUyXSBwbGF0Zm9ybSBwYzg3MzZ4
X2dwaW8uMDogTmF0U2VtaSBwYzg3MzZ4IEdQSU8gRHJpdmVyIEluaXRpYWxpemluZwpbICAgIDEu
OTA5NTUxXSBwbGF0Zm9ybSBwYzg3MzZ4X2dwaW8uMDogbm8gZGV2aWNlIGZvdW5kClsgICAgMS45
MTAzMjBdIG5zY19ncGlvIGluaXRpYWxpemluZwpbICAgIDEuOTExMTA1XSBTaWxpY29uIExhYnMg
QzIgcG9ydCBzdXBwb3J0IHYuIDAuNTEuMCAtIChDKSAyMDA3IFJvZG9sZm8gR2lvbWV0dGkKWyAg
ICAxLjkxMTc3NV0gYzJwb3J0IGMycG9ydDA6IEMyIHBvcnQgdWMgYWRkZWQKWyAgICAxLjkxMjEz
N10gYzJwb3J0IGMycG9ydDA6IHVjIGZsYXNoIGhhcyAzMCBibG9ja3MgeCA1MTIgYnl0ZXMgKDE1
MzYwIGJ5dGVzIHRvdGFsKQpbICAgIDEuOTEzMjQ1XSBpODA0MjogUE5QOiBQUy8yIENvbnRyb2xs
ZXIgW1BOUDAzMDM6S0JELFBOUDBmMTM6TU9VXSBhdCAweDYwLDB4NjQgaXJxIDEsMTIKWyAgICAx
LjkxNTMxOF0gc2VyaW86IGk4MDQyIEtCRCBwb3J0IGF0IDB4NjAsMHg2NCBpcnEgMQpbICAgIDEu
OTE2MDkyXSBzZXJpbzogaTgwNDIgQVVYIHBvcnQgYXQgMHg2MCwweDY0IGlycSAxMgpbICAgIDEu
OTYzNTIzXSBldmJ1ZzogQ29ubmVjdGVkIGRldmljZTogaW5wdXQwIChQb3dlciBCdXR0b24gYXQg
TE5YUFdSQk4vYnV0dG9uL2lucHV0MCkKWyAgICAxLjk2NDY4M10gaW5wdXQ6IEFUIFRyYW5zbGF0
ZWQgU2V0IDIga2V5Ym9hcmQgYXMgL2RldmljZXMvcGxhdGZvcm0vaTgwNDIvc2VyaW8wL2lucHV0
L2lucHV0MQpbICAgIDEuOTY1NDYwXSBldmJ1ZzogQ29ubmVjdGVkIGRldmljZTogaW5wdXQxIChB
VCBUcmFuc2xhdGVkIFNldCAyIGtleWJvYXJkIGF0IGlzYTAwNjAvc2VyaW8wL2lucHV0MCkKWyAg
ICAxLjk2NjQ2OF0gd2lzdHJvbl9idG5zOiBTeXN0ZW0gdW5rbm93bgpbICAgIDEuOTY2ODM2XSBp
ZGVhcGFkX3NsaWRlYmFyOiBETUkgZG9lcyBub3QgbWF0Y2gKWyAgICAxLjk2NzI3NV0gaXNhIGky
Yy1wY2EtaXNhLjA6IFBsZWFzZSBzcGVjaWZ5IEkvTyBiYXNlClsgICAgMi40NDM2NjldIHRzYzog
UmVmaW5lZCBUU0MgY2xvY2tzb3VyY2UgY2FsaWJyYXRpb246IDI2OTMuNTAzIE1IegpbICAgIDIu
NDQ0NDQ0XSBjbG9ja3NvdXJjZTogdHNjOiBtYXNrOiAweGZmZmZmZmZmZmZmZmZmZmYgbWF4X2N5
Y2xlczogMHgyNmQzNDUxZjYwNiwgbWF4X2lkbGVfbnM6IDQ0MDc5NTMzMzkzMyBucwpbICAgIDQu
OTY5MTQ4XSByYWRpby1haW1zbGFiLjA6IEluaXRpYWxpemVkIHJhZGlvIGNhcmQgQUlNU2xhYiBS
YWRpb1RyYWNrL1JhZGlvUmV2ZWFsIG9uIHBvcnQgMHgzMGYKWyAgICA0Ljk3MTUwM10gcmFkaW8t
Z2VtdGVrLjA6IEluaXRpYWxpemVkIHJhZGlvIGNhcmQgR2VtVGVrIFJhZGlvIG9uIHBvcnQgMHgz
NGMKWyAgICA0Ljk3MzAzNV0gX19wb3dlcl9zdXBwbHlfcmVnaXN0ZXI6IEV4cGVjdGVkIHByb3Bl
ciBwYXJlbnQgZGV2aWNlIGZvciAndGVzdF9hYycKWyAgICA0Ljk3NDIwNl0gcG93ZXJfc3VwcGx5
IHRlc3RfYWM6IHVldmVudApbICAgIDQuOTc0ODAzXSBwb3dlcl9zdXBwbHkgdGVzdF9hYzogUE9X
RVJfU1VQUExZX05BTUU9dGVzdF9hYwpbICAgIDQuOTc1NTgyXSBfX3Bvd2VyX3N1cHBseV9yZWdp
c3RlcjogRXhwZWN0ZWQgcHJvcGVyIHBhcmVudCBkZXZpY2UgZm9yICd0ZXN0X2JhdHRlcnknClsg
ICAgNC45NzY4MTRdIHBvd2VyX3N1cHBseSB0ZXN0X2JhdHRlcnk6IHVldmVudApbICAgIDQuOTc3
NDQyXSBwb3dlcl9zdXBwbHkgdGVzdF9iYXR0ZXJ5OiBQT1dFUl9TVVBQTFlfTkFNRT10ZXN0X2Jh
dHRlcnkKWyAgICA0Ljk3ODQ5OV0gX19wb3dlcl9zdXBwbHlfcmVnaXN0ZXI6IEV4cGVjdGVkIHBy
b3BlciBwYXJlbnQgZGV2aWNlIGZvciAndGVzdF91c2InClsgICAgNC45Nzk2NzJdIHBvd2VyX3N1
cHBseSB0ZXN0X3VzYjogdWV2ZW50ClsgICAgNC45ODAxMjVdIHBvd2VyX3N1cHBseSB0ZXN0X3Vz
YjogUE9XRVJfU1VQUExZX05BTUU9dGVzdF91c2IKWyAgICA0Ljk4MDcyMl0gYXBwbGVzbWM6IHN1
cHBvcnRlZCBsYXB0b3Agbm90IGZvdW5kIQpbICAgIDQuOTgxMTE5XSBhcHBsZXNtYzogZHJpdmVy
IGluaXQgZmFpbGVkIChyZXQ9LTE5KSEKWyAgICA0Ljk4MzgyNV0gaGRhcHM6IHN1cHBvcnRlZCBs
YXB0b3Agbm90IGZvdW5kIQpbICAgIDQuOTg0MjQwXSBoZGFwczogZHJpdmVyIGluaXQgZmFpbGVk
IChyZXQ9LTE5KSEKWyAgICA0Ljk4NDg3NF0gaW50ZWxfcmFwbDogZHJpdmVyIGRvZXMgbm90IHN1
cHBvcnQgQ1BVIGZhbWlseSAxNSBtb2RlbCA2ClsgICAgNC45ODU1OTFdIHBvd2VyX3N1cHBseSB0
ZXN0X2FjOiBwb3dlcl9zdXBwbHlfY2hhbmdlZApbICAgIDQuOTg2MDczXSBwb3dlcl9zdXBwbHkg
dGVzdF9hYzogcG93ZXJfc3VwcGx5X2NoYW5nZWRfd29yawpbICAgIDQuOTg2NTk4XSBwb3dlcl9z
dXBwbHkgdGVzdF9hYzogcG93ZXJfc3VwcGx5X3VwZGF0ZV9nZW5fbGVkcyAxClsgICAgNC45ODcx
MDddIHBvd2VyX3N1cHBseSB0ZXN0X2FjOiB1ZXZlbnQKWyAgICA0Ljk4NzQ2M10gcG93ZXJfc3Vw
cGx5IHRlc3RfYWM6IFBPV0VSX1NVUFBMWV9OQU1FPXRlc3RfYWMKWyAgICA0Ljk4Nzk1NF0gcG93
ZXJfc3VwcGx5IHRlc3RfYWM6IHByb3AgT05MSU5FPTEKWyAgICA0Ljk4ODM4OF0gcG93ZXJfc3Vw
cGx5IHRlc3RfYmF0dGVyeTogcG93ZXJfc3VwcGx5X2NoYW5nZWQKWyAgICA0Ljk4ODk5N10gbm8g
VUFSVCBkZXRlY3RlZCBhdCAweDEKWyAgICA0Ljk4OTY1Ml0gaXNhIGNzNDIzMS4wOiBwbGVhc2Ug
c3BlY2lmeSBwb3J0ClsgICAgNC45OTA1MjVdIGlzYSBhenQyMzE2LjA6IHBsZWFzZSBzcGVjaWZ5
IHBvcnQKWyAgICA0Ljk5MDk0OF0gcG93ZXJfc3VwcGx5IHRlc3RfdXNiOiBwb3dlcl9zdXBwbHlf
Y2hhbmdlZApbICAgIDQuOTkxNDk0XSBwb3dlcl9zdXBwbHkgdGVzdF9iYXR0ZXJ5OiBwb3dlcl9z
dXBwbHlfY2hhbmdlZF93b3JrClsgICAgNC45OTIzNjVdIGd1czogY2FuJ3QgZ3JhYiBzeW50aCBw
b3J0IDB4MzIwClsgICAgNC45OTM2MjldIHBvd2VyX3N1cHBseSB0ZXN0X2JhdHRlcnk6IHBvd2Vy
X3N1cHBseV91cGRhdGVfYmF0X2xlZHMgMgpbICAgIDQuOTk0MjI3XSBwb3dlcl9zdXBwbHkgdGVz
dF9iYXR0ZXJ5OiB1ZXZlbnQKWyAgICA0Ljk5NDY0NF0gcG93ZXJfc3VwcGx5IHRlc3RfYmF0dGVy
eTogUE9XRVJfU1VQUExZX05BTUU9dGVzdF9iYXR0ZXJ5ClsgICAgNC45OTUyMjBdIHBvd2VyX3N1
cHBseSB0ZXN0X2JhdHRlcnk6IHByb3AgU1RBVFVTPURpc2NoYXJnaW5nClsgICAgNC45OTU3OTRd
IHBvd2VyX3N1cHBseSB0ZXN0X2JhdHRlcnk6IHByb3AgQ0hBUkdFX1RZUEU9RmFzdApbICAgIDQu
OTk2MzQ3XSBwb3dlcl9zdXBwbHkgdGVzdF9iYXR0ZXJ5OiBwcm9wIEhFQUxUSD1Hb29kClsgICAg
NC45OTY4MDFdIHBvd2VyX3N1cHBseSB0ZXN0X2JhdHRlcnk6IHByb3AgUFJFU0VOVD0xClsgICAg
NC45OTcyNzBdIHBvd2VyX3N1cHBseSB0ZXN0X2JhdHRlcnk6IHByb3AgVEVDSE5PTE9HWT1MaS1p
b24KWyAgICA0Ljk5NzgwMF0gcG93ZXJfc3VwcGx5IHRlc3RfYmF0dGVyeTogcHJvcCBDSEFSR0Vf
RlVMTF9ERVNJR049MTAwClsgICAgNC45OTg0MDBdIHBvd2VyX3N1cHBseSB0ZXN0X2JhdHRlcnk6
IHByb3AgQ0hBUkdFX0ZVTEw9MTAwClsgICAgNC45OTkwNjJdIHBvd2VyX3N1cHBseSB0ZXN0X2Jh
dHRlcnk6IHByb3AgQ0hBUkdFX05PVz01MApbICAgIDQuOTk5ODQzXSBwb3dlcl9zdXBwbHkgdGVz
dF9iYXR0ZXJ5OiBwcm9wIENBUEFDSVRZPTUwClsgICAgNS4wMDA2NTldIHBvd2VyX3N1cHBseSB0
ZXN0X2JhdHRlcnk6IHByb3AgQ0FQQUNJVFlfTEVWRUw9Tm9ybWFsClsgICAgNS4wMDE0OTldIHBv
d2VyX3N1cHBseSB0ZXN0X2JhdHRlcnk6IHByb3AgVElNRV9UT19FTVBUWV9BVkc9MzYwMApbICAg
IDUuMDAyMDM5XSBwb3dlcl9zdXBwbHkgdGVzdF9iYXR0ZXJ5OiBwcm9wIFRJTUVfVE9fRlVMTF9O
T1c9MzYwMApbICAgIDUuMDAyNTc1XSBwb3dlcl9zdXBwbHkgdGVzdF9iYXR0ZXJ5OiBwcm9wIE1P
REVMX05BTUU9VGVzdCBiYXR0ZXJ5ClsgICAgNS4wMDQ5MzRdIHBvd2VyX3N1cHBseSB0ZXN0X2Jh
dHRlcnk6IHByb3AgTUFOVUZBQ1RVUkVSPUxpbnV4ClsgICAgNS4wMDU0NjldIHBvd2VyX3N1cHBs
eSB0ZXN0X2JhdHRlcnk6IHByb3AgU0VSSUFMX05VTUJFUj00LjQuMC1yYzQtMDAwMjktZ2M3YWY5
ZDUKWyAgICA1LjAwNjE5Ml0gcG93ZXJfc3VwcGx5IHRlc3RfYmF0dGVyeTogcHJvcCBURU1QPTI2
ClsgICAgNS4wMDY3NDFdIHBvd2VyX3N1cHBseSB0ZXN0X2JhdHRlcnk6IHByb3AgVk9MVEFHRV9O
T1c9MzMwMApbICAgIDUuMDA3MjUxXSBwb3dlcl9zdXBwbHkgdGVzdF91c2I6IHBvd2VyX3N1cHBs
eV9jaGFuZ2VkX3dvcmsKWyAgICA1LjAwNzc0OV0gcG93ZXJfc3VwcGx5IHRlc3RfdXNiOiBwb3dl
cl9zdXBwbHlfdXBkYXRlX2dlbl9sZWRzIDEKWyAgICA1LjAwODI5Nl0gcG93ZXJfc3VwcGx5IHRl
c3RfdXNiOiB1ZXZlbnQKWyAgICA1LjAwODYzOV0gcG93ZXJfc3VwcGx5IHRlc3RfdXNiOiBQT1dF
Ul9TVVBQTFlfTkFNRT10ZXN0X3VzYgpbICAgIDUuMDA5MTc2XSBwb3dlcl9zdXBwbHkgdGVzdF91
c2I6IHByb3AgT05MSU5FPTEKWyAgICA1LjA1MjQzN10gaXNhIHNiOC4wOiBwbGVhc2Ugc3BlY2lm
eSBpcnEKWyAgICA1LjA1MzQxM10gcGxlYXNlIHNwZWNpZnkgcG9ydApbICAgIDUuMDU0MDU5XSBv
cHJvZmlsZTogdXNpbmcgTk1JIGludGVycnVwdC4KWyAgICA1LjA1NTQ2MF0gLi4uIEFQSUMgSUQ6
ICAgICAgMDAwMDAwMDAgKDApClsgICAgNS4wNTYxMDBdIC4uLiBBUElDIFZFUlNJT046IDAxMDUw
MDE0ClsgICAgNS4wNTY2NjNdIDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAKWyAgICA1LjA1NzkwMF0gMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMApbICAgIDUu
MDU5MzE2XSAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwClsgICAgNS4wNjA2OTZdIApbICAgIDUuMDYwOTk2XSBudW1iZXIgb2Yg
TVAgSVJRIHNvdXJjZXM6IDE1LgpbICAgIDUuMDYxODg3XSBudW1iZXIgb2YgSU8tQVBJQyAjMCBy
ZWdpc3RlcnM6IDI0LgpbICAgIDUuMDYyNzEwXSB0ZXN0aW5nIHRoZSBJTyBBUElDLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4KWyAgICA1LjA2MzY1MF0gSU8gQVBJQyAjMC4uLi4uLgpbICAgIDUuMDY0
MTEyXSAuLi4uIHJlZ2lzdGVyICMwMDogMDAwMDAwMDAKWyAgICA1LjA2NDkzM10gLi4uLi4uLiAg
ICA6IHBoeXNpY2FsIEFQSUMgaWQ6IDAwClsgICAgNS4wNjU2NjBdIC4uLi4uLi4gICAgOiBEZWxp
dmVyeSBUeXBlOiAwClsgICAgNS4wNjYyODldIC4uLi4uLi4gICAgOiBMVFMgICAgICAgICAgOiAw
ClsgICAgNS4wNjcwMTBdIC4uLi4gcmVnaXN0ZXIgIzAxOiAwMDE3MDAxMQpbICAgIDUuMDY3ODMw
XSAuLi4uLi4uICAgICA6IG1heCByZWRpcmVjdGlvbiBlbnRyaWVzOiAxNwpbICAgIDUuMDY4Nzcz
XSAuLi4uLi4uICAgICA6IFBSUSBpbXBsZW1lbnRlZDogMApbICAgIDUuMDY5NDM1XSAuLi4uLi4u
ICAgICA6IElPIEFQSUMgdmVyc2lvbjogMTEKWyAgICA1LjA3MzY0MF0gLi4uLiByZWdpc3RlciAj
MDI6IDAwMDAwMDAwClsgICAgNS4wNzQyMDldIC4uLi4uLi4gICAgIDogYXJiaXRyYXRpb246IDAw
ClsgICAgNS4wNzQ4NzVdIC4uLi4gSVJRIHJlZGlyZWN0aW9uIHRhYmxlOgpbICAgIDUuMDc1NDE3
XSBJT0FQSUMgMDoKWyAgICA1LjA3NTkzMV0gIHBpbjAwLCBkaXNhYmxlZCwgZWRnZSAsIGhpZ2gs
IFYoMDApLCBJUlIoMCksIFMoMCksIHBoeXNpY2FsLCBEKDAwKSwgTSgwKQpbICAgIDUuMDc3MDkz
XSAgcGluMDEsIGVuYWJsZWQgLCBlZGdlICwgaGlnaCwgVigzMSksIElSUigwKSwgUygwKSwgbG9n
aWNhbCAsIEQoMDMpLCBNKDEpClsgICAgNS4wNzgzMjFdICBwaW4wMiwgZW5hYmxlZCAsIGVkZ2Ug
LCBoaWdoLCBWKDMwKSwgSVJSKDApLCBTKDApLCBsb2dpY2FsICwgRCgwMyksIE0oMSkKWyAgICA1
LjA3OTc2NV0gIHBpbjAzLCBlbmFibGVkICwgZWRnZSAsIGhpZ2gsIFYoMzMpLCBJUlIoMCksIFMo
MCksIGxvZ2ljYWwgLCBEKDAzKSwgTSgxKQpbICAgIDUuMDgxMDEwXSAgcGluMDQsIGRpc2FibGVk
LCBlZGdlICwgaGlnaCwgVigzNCksIElSUigwKSwgUygwKSwgbG9naWNhbCAsIEQoMDMpLCBNKDEp
ClsgICAgNS4wODIzMzldICBwaW4wNSwgZGlzYWJsZWQsIGVkZ2UgLCBoaWdoLCBWKDAwKSwgSVJS
KDApLCBTKDApLCBwaHlzaWNhbCwgRCgwMCksIE0oMCkKWyAgICA1LjA4NDAzN10gIHBpbjA2LCBl
bmFibGVkICwgZWRnZSAsIGhpZ2gsIFYoMzYpLCBJUlIoMCksIFMoMCksIGxvZ2ljYWwgLCBEKDAz
KSwgTSgxKQpbICAgIDUuMDg1Mzk3XSAgcGluMDcsIGVuYWJsZWQgLCBlZGdlICwgaGlnaCwgVigz
NyksIElSUigwKSwgUygwKSwgbG9naWNhbCAsIEQoMDMpLCBNKDEpClsgICAgNS4wODY0OTZdICBw
aW4wOCwgZW5hYmxlZCAsIGVkZ2UgLCBoaWdoLCBWKDM4KSwgSVJSKDApLCBTKDApLCBsb2dpY2Fs
ICwgRCgwMyksIE0oMSkKWyAgICA1LjA4Nzc4N10gIHBpbjA5LCBlbmFibGVkICwgbGV2ZWwsIGhp
Z2gsIFYoMzkpLCBJUlIoMCksIFMoMCksIGxvZ2ljYWwgLCBEKDAzKSwgTSgxKQpbICAgIDUuMDg5
MDkzXSAgcGluMGEsIGRpc2FibGVkLCBsZXZlbCwgaGlnaCwgVigzQSksIElSUigwKSwgUygwKSwg
bG9naWNhbCAsIEQoMDMpLCBNKDEpClsgICAgNS4wOTAzMDFdICBwaW4wYiwgZGlzYWJsZWQsIGxl
dmVsLCBoaWdoLCBWKDNCKSwgSVJSKDApLCBTKDApLCBsb2dpY2FsICwgRCgwMyksIE0oMSkKWyAg
ICA1LjA5MTYwMV0gIHBpbjBjLCBlbmFibGVkICwgZWRnZSAsIGhpZ2gsIFYoM0MpLCBJUlIoMCks
IFMoMCksIGxvZ2ljYWwgLCBEKDAzKSwgTSgxKQpbICAgIDUuMDk1NzA5XSAgcGluMGQsIGVuYWJs
ZWQgLCBlZGdlICwgaGlnaCwgVigzRCksIElSUigwKSwgUygwKSwgbG9naWNhbCAsIEQoMDMpLCBN
KDEpClsgICAgNS4wOTY2NDBdICBwaW4wZSwgZW5hYmxlZCAsIGVkZ2UgLCBoaWdoLCBWKDNFKSwg
SVJSKDApLCBTKDApLCBsb2dpY2FsICwgRCgwMyksIE0oMSkKWyAgICA1LjA5NzU0MV0gIHBpbjBm
LCBlbmFibGVkICwgZWRnZSAsIGhpZ2gsIFYoM0YpLCBJUlIoMCksIFMoMCksIGxvZ2ljYWwgLCBE
KDAzKSwgTSgxKQpbICAgIDUuMDk4NjA5XSAgcGluMTAsIGRpc2FibGVkLCBlZGdlICwgaGlnaCwg
VigwMCksIElSUigwKSwgUygwKSwgcGh5c2ljYWwsIEQoMDApLCBNKDApClsgICAgNS4wOTk2MjRd
ICBwaW4xMSwgZGlzYWJsZWQsIGVkZ2UgLCBoaWdoLCBWKDAwKSwgSVJSKDApLCBTKDApLCBwaHlz
aWNhbCwgRCgwMCksIE0oMCkKWyAgICA1LjEwMDcyNF0gIHBpbjEyLCBkaXNhYmxlZCwgZWRnZSAs
IGhpZ2gsIFYoMDApLCBJUlIoMCksIFMoMCksIHBoeXNpY2FsLCBEKDAwKSwgTSgwKQpbICAgIDUu
MTAxNzgyXSAgcGluMTMsIGRpc2FibGVkLCBlZGdlICwgaGlnaCwgVigwMCksIElSUigwKSwgUygw
KSwgcGh5c2ljYWwsIEQoMDApLCBNKDApClsgICAgNS4xMDI2OTJdICBwaW4xNCwgZGlzYWJsZWQs
IGVkZ2UgLCBoaWdoLCBWKDAwKSwgSVJSKDApLCBTKDApLCBwaHlzaWNhbCwgRCgwMCksIE0oMCkK
WyAgICA1LjEwMzYwMl0gIHBpbjE1LCBkaXNhYmxlZCwgZWRnZSAsIGhpZ2gsIFYoMDApLCBJUlIo
MCksIFMoMCksIHBoeXNpY2FsLCBEKDAwKSwgTSgwKQpbICAgIDUuMTA0NzUxXSAgcGluMTYsIGRp
c2FibGVkLCBlZGdlICwgaGlnaCwgVigwMCksIElSUigwKSwgUygwKSwgcGh5c2ljYWwsIEQoMDAp
LCBNKDApClsgICAgNS4xMDU3ODldICBwaW4xNywgZGlzYWJsZWQsIGVkZ2UgLCBoaWdoLCBWKDAw
KSwgSVJSKDApLCBTKDApLCBwaHlzaWNhbCwgRCgwMCksIE0oMCkKWyAgICA1LjEwNjcyMF0gSVJR
IHRvIHBpbiBtYXBwaW5nczoKWyAgICA1LjEwNzEwNV0gSVJRMCAtPiAwOjIKWyAgICA1LjEwNzQ1
OV0gSVJRMSAtPiAwOjEKWyAgICA1LjEwNzgyOV0gSVJRMyAtPiAwOjMKWyAgICA1LjEwODE1M10g
SVJRNCAtPiAwOjQKWyAgICA1LjEwODQ2N10gSVJRNSAtPiAwOjUKWyAgICA1LjEwOTQyN10gSVJR
NiAtPiAwOjYKWyAgICA1LjExMDQzM10gSVJRNyAtPiAwOjcKWyAgICA1LjExMDgwOF0gSVJROCAt
PiAwOjgKWyAgICA1LjExMTEzM10gSVJROSAtPiAwOjkKWyAgICA1LjExMTQ0Nl0gSVJRMTAgLT4g
MDoxMApbICAgIDUuMTExNzkxXSBJUlExMSAtPiAwOjExClsgICAgNS4xMTIxMzJdIElSUTEyIC0+
IDA6MTIKWyAgICA1LjExMjQ2NV0gSVJRMTMgLT4gMDoxMwpbICAgIDUuMTEzNTE2XSBJUlExNCAt
PiAwOjE0ClsgICAgNS4xMTU5ODRdIElSUTE1IC0+IDA6MTUKWyAgICA1LjExNjQ4Nl0gLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uIGRvbmUuClsgICAgNS4xMTczNDddIFVzaW5n
IElQSSBOby1TaG9ydGN1dCBtb2RlClsgICAgNS4xMTgxNDVdIExvYWRpbmcgY29tcGlsZWQtaW4g
WC41MDkgY2VydGlmaWNhdGVzClsgICAgNS4xMjcyNDddIGNyeXB0b21ncl9wcm9iZSAoOTkpIHVz
ZWQgZ3JlYXRlc3Qgc3RhY2sgZGVwdGg6IDczNDAgYnl0ZXMgbGVmdApbICAgIDUuMTI4NTA0XSBL
ZXkgdHlwZSBlbmNyeXB0ZWQgcmVnaXN0ZXJlZApbICAgIDUuMTI5MDk2XSBjcnlwdG9tZ3JfcHJv
YmUgKDEwMykgdXNlZCBncmVhdGVzdCBzdGFjayBkZXB0aDogNzA2MCBieXRlcyBsZWZ0ClsgICAg
NS4xMzE3NjBdIEFMU0EgZGV2aWNlIGxpc3Q6ClsgICAgNS4xMzIxNzFdICAgTm8gc291bmRjYXJk
cyBmb3VuZC4KWyAgICA1LjEzMzE2OF0gRnJlZWluZyB1bnVzZWQga2VybmVsIG1lbW9yeTogMzQw
SyAoYjE1MjUwMDAgLSBiMTU3YTAwMCkKWyAgICA1LjE0MDk4MF0gcmFuZG9tOiBpbml0IHVyYW5k
b20gcmVhZCB3aXRoIDEgYml0cyBvZiBlbnRyb3B5IGF2YWlsYWJsZQpbICAgIDUuMTUxNzU1XSBo
d2Nsb2NrICgxMTIpIHVzZWQgZ3JlYXRlc3Qgc3RhY2sgZGVwdGg6IDY4OTIgYnl0ZXMgbGVmdApb
ICAgIDUuMTU1NTIzXSBzaCAoMTE3KSB1c2VkIGdyZWF0ZXN0IHN0YWNrIGRlcHRoOiA2NzQ4IGJ5
dGVzIGxlZnQKWyAgICA1LjE4NjY0OV0gaW5pdDogRmFpbGVkIHRvIGNyZWF0ZSBwdHkgLSBkaXNh
YmxpbmcgbG9nZ2luZyBmb3Igam9iClsgICAgNS4xODc1NDFdIGluaXQ6IFRlbXBvcmFyeSBwcm9j
ZXNzIHNwYXduIGVycm9yOiBObyBzcGFjZSBsZWZ0IG9uIGRldmljZQpbICAgIDUuMjIxMjY4XSBp
bml0Y3RsICgxNTkpIHVzZWQgZ3JlYXRlc3Qgc3RhY2sgZGVwdGg6IDY3MzIgYnl0ZXMgbGVmdApb
ICAgIDUuMjM0ODg3XSBCVUc6IHVuYWJsZSB0byBoYW5kbGUga2VybmVsIE5VTEwgcG9pbnRlciBk
ZXJlZmVyZW5jZSBhdCAwMDAwMDRlYwpbICAgIDUuMjM1OTk2XSBJUDogWzxiMTA1YjMxZD5dIHNl
dF9uZXh0X2VudGl0eSsweDNlLzB4NjQKWyAgICA1LjIzNjc0NF0gKnBkZSA9IDAwMDAwMDAwIApb
ICAgIDUuMjM3MjA5XSBPb3BzOiAwMDAwIFsjMV0gUFJFRU1QVCBTTVAgClsgICAgNS4yMzc4MTVd
IE1vZHVsZXMgbGlua2VkIGluOgpbICAgIDUuMjM4Mjc5XSBDUFU6IDEgUElEOiAxNzQgQ29tbTog
dXBzdGFydC11ZGV2LWJyIE5vdCB0YWludGVkIDQuNC4wLXJjNC0wMDAyOS1nYzdhZjlkNSAjMQpb
ICAgIDUuMjM5NDI3XSB0YXNrOiBjMjQxMWQwMCB0aTogYzI1NzQwMDAgdGFzay50aTogYzI1NzQw
MDAKWyAgICA1LjI0MDE3OV0gRUlQOiAwMDYwOls8YjEwNWIzMWQ+XSBFRkxBR1M6IDAwMDEwMDQ2
IENQVTogMQpbICAgIDUuMjQwOTY2XSBFSVAgaXMgYXQgc2V0X25leHRfZW50aXR5KzB4M2UvMHg2
NApbICAgIDUuMjQxNTk5XSBFQVg6IDAwMDAwMDAwIEVCWDogYzI0MTFkNDQgRUNYOiAwMDAwMDAw
MCBFRFg6IGMyNDExZDQ0ClsgICAgNS4yNDI0OTJdIEVTSTogYzI0ODhjMDAgRURJOiBjMjQxMWQw
MCBFQlA6IGMyNTc1ZjA4IEVTUDogYzI1NzVlZmMKWyAgICA1LjI0MzM2MV0gIERTOiAwMDdiIEVT
OiAwMDdiIEZTOiAwMGQ4IEdTOiAwMDMzIFNTOiAwMDY4ClsgICAgNS4yNDQxMjddIENSMDogODAw
NTAwM2IgQ1IyOiAwMDAwMDRlYyBDUjM6IDEyNThkMDAwIENSNDogMDAwMDA2ZDAKWyAgICA1LjI0
NTAyNV0gU3RhY2s6ClsgICAgNS4yNDUzMTZdICBjMjQxMWQ0NCBjMTA5ZGE4MCBjMjQxMWQwMCBj
MjU3NWYxNCBiMTA1YjM1ZSBjMjQxMWQwMCBjMjU3NWYzNCBiMTA1N2ViMgpbICAgIDUuMjQ2NTcz
XSAgYjE1OGU1YzAgMDAwMDAwMDEgMDAwMDAwODYgYzI0MTFkMDAgYmQ5NjExMDAgYzI0MTFkMDAg
YzI1NzVmNTAgYjEwNjIyMTEKWyAgICA1LjI0NzgxNV0gIGJjM2RlZjAwIDAwMDAwMjgyIGIwMTkx
ZTQwIGMyNDExZDAwIGIwMTEzOWMwIGMyNTc1ZjY0IGIxMDYyMmQ4IGJkOTYxZTgwClsgICAgNS4y
NDkwOTBdIENhbGwgVHJhY2U6ClsgICAgNS4yNDk0NThdICBbPGIxMDViMzVlPl0gc2V0X2N1cnJf
dGFza19mYWlyKzB4MWIvMHgyMwpbICAgIDUuMjUwMTgzXSAgWzxiMTA1N2ViMj5dIHNjaGVkX21v
dmVfdGFzaysweGIzLzB4ZGIKWyAgICA1LjI1MDkwMF0gIFs8YjEwNjIyMTE+XSBhdXRvZ3JvdXBf
bW92ZV9ncm91cCsweGExLzB4YjAKWyAgICA1LjI1MTY0OV0gIFs8YjEwNjIyZDg+XSBzY2hlZF9h
dXRvZ3JvdXBfY3JlYXRlX2F0dGFjaCsweGI4LzB4YzcKWyAgICA1LjI1MjUzMF0gIFs8YjEwNDhh
ODM+XSBzeXNfc2V0c2lkKzB4YzIvMHhjYgpbICAgIDUuMjUzMTY3XSAgWzxiMTAwMGViND5dIGRv
X2Zhc3Rfc3lzY2FsbF8zMisweDkyLzB4ZDYKWyAgICA1LjI1Mzg5OF0gIFs8YjEyZjMxZWQ+XSBz
eXNlbnRlcl9wYXN0X2VzcCsweDM2LzB4NTkKWyAgICA1LjI1NDU4Ml0gQ29kZTogMzkgNzggMmMg
NzUgMGEgODkgZjggZTggMmEgMmIgMGYgMDAgODkgNDYgMmMgOGQgNTYgMjggODkgZjggZTggOTIg
MmYgMGYgMDAgYmEgMDEgMDAgMDAgMDAgODkgZDggZTggMjQgZmQgZmYgZmYgOGIgODYgOTQgMDAg
MDAgMDAgPDhiPiA5MCBlYyAwNCAwMCAwMCA4YiA4MCBlOCAwNCAwMCAwMCA4OSA1MyAyNCA4OSA0
MyAyMCA4OSA1ZSAzMApbICAgIDUuMjU4MDY4XSBFSVA6IFs8YjEwNWIzMWQ+XSBzZXRfbmV4dF9l
bnRpdHkrMHgzZS8weDY0IFNTOkVTUCAwMDY4OmMyNTc1ZWZjClsgICAgNS4yNTg5ODZdIENSMjog
MDAwMDAwMDAwMDAwMDRlYwpbICAgIDUuMjU5NDExXSAtLS1bIGVuZCB0cmFjZSA1MTY1YjFmNDk2
YWI0NWYwIF0tLS0KWyAgICA1LjI1OTk5NF0gS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IEZh
dGFsIGV4Y2VwdGlvbgpbICAgIDYuMzIwOTI3XSBTaHV0dGluZyBkb3duIGNwdXMgd2l0aCBOTUkK
WyAgICA2LjMyMTMxMl0gS2VybmVsIE9mZnNldDogZGlzYWJsZWQKCkVsYXBzZWQgdGltZTogMTAK
cWVtdS1zeXN0ZW0teDg2XzY0IC1lbmFibGUta3ZtIC1jcHUga3ZtNjQgLWtlcm5lbCAvcGtnL2xp
bnV4L2kzODYtcmFuZGNvbmZpZy1oMC0xMjI2MTc1NC9nY2MtNS9jN2FmOWQ1NzI4YmVkMjllZjYx
NDMyNGU2N2UwNjY4OTZkMDg3YzhmL3ZtbGludXotNC40LjAtcmM0LTAwMDI5LWdjN2FmOWQ1IC1h
cHBlbmQgJ2h1bmdfdGFza19wYW5pYz0xIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1k
LmxvZ19sZXZlbD1lcnIgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3Vw
ZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9
MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFt
ZGlzaz0wIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsICByb290
PS9kZXYvcmFtMCBydyBsaW5rPS9rYnVpbGQtdGVzdHMvcnVuLXF1ZXVlL2t2bS9pMzg2LXJhbmRj
b25maWctaDAtMTIyNjE3NTQvbGludXgtZGV2ZWw6ZGV2ZWwtc3BvdC0yMDE1MTIyNjE2MDg6Yzdh
ZjlkNTcyOGJlZDI5ZWY2MTQzMjRlNjdlMDY2ODk2ZDA4N2M4ZjpiaXNlY3QtbGludXgtNy8udm1s
aW51ei1jN2FmOWQ1NzI4YmVkMjllZjYxNDMyNGU2N2UwNjY4OTZkMDg3YzhmLTIwMTUxMjI3MDE1
NTA1LTE1Ny1pdmI0MSBicmFuY2g9bGludXgtZGV2ZWwvZGV2ZWwtc3BvdC0yMDE1MTIyNjE2MDgg
Qk9PVF9JTUFHRT0vcGtnL2xpbnV4L2kzODYtcmFuZGNvbmZpZy1oMC0xMjI2MTc1NC9nY2MtNS9j
N2FmOWQ1NzI4YmVkMjllZjYxNDMyNGU2N2UwNjY4OTZkMDg3YzhmL3ZtbGludXotNC40LjAtcmM0
LTAwMDI5LWdjN2FmOWQ1IGRyYmQubWlub3JfY291bnQ9OCcgIC1pbml0cmQgL29zaW1hZ2UvcXVh
bnRhbC9xdWFudGFsLWNvcmUtaTM4Ni5jZ3ogLW0gMzAwIC1zbXAgMiAtZGV2aWNlIGUxMDAwLG5l
dGRldj1uZXQwIC1uZXRkZXYgdXNlcixpZD1uZXQwIC1ib290IG9yZGVyPW5jIC1uby1yZWJvb3Qg
LXdhdGNoZG9nIGk2MzAwZXNiIC1ydGMgYmFzZT1sb2NhbHRpbWUgLWRyaXZlIGZpbGU9L2ZzL3Nk
YTUvZGlzazAtcXVhbnRhbC1pdmI0MS02MCxtZWRpYT1kaXNrLGlmPXZpcnRpbyAtZHJpdmUgZmls
ZT0vZnMvc2RhNS9kaXNrMS1xdWFudGFsLWl2YjQxLTYwLG1lZGlhPWRpc2ssaWY9dmlydGlvIC1k
cml2ZSBmaWxlPS9mcy9zZGE1L2Rpc2syLXF1YW50YWwtaXZiNDEtNjAsbWVkaWE9ZGlzayxpZj12
aXJ0aW8gLWRyaXZlIGZpbGU9L2ZzL3NkYTUvZGlzazMtcXVhbnRhbC1pdmI0MS02MCxtZWRpYT1k
aXNrLGlmPXZpcnRpbyAtZHJpdmUgZmlsZT0vZnMvc2RhNS9kaXNrNC1xdWFudGFsLWl2YjQxLTYw
LG1lZGlhPWRpc2ssaWY9dmlydGlvIC1kcml2ZSBmaWxlPS9mcy9zZGE1L2Rpc2s1LXF1YW50YWwt
aXZiNDEtNjAsbWVkaWE9ZGlzayxpZj12aXJ0aW8gLWRyaXZlIGZpbGU9L2ZzL3NkYTUvZGlzazYt
cXVhbnRhbC1pdmI0MS02MCxtZWRpYT1kaXNrLGlmPXZpcnRpbyAtcGlkZmlsZSAvZGV2L3NobS9r
Ym9vdC9waWQtcXVhbnRhbC1pdmI0MS02MCAtc2VyaWFsIGZpbGU6L2Rldi9zaG0va2Jvb3Qvc2Vy
aWFsLXF1YW50YWwtaXZiNDEtNjAgLWRhZW1vbml6ZSAtZGlzcGxheSBub25lIC1tb25pdG9yIG51
bGwgCg==

--===============5810397636514969683==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config-4.4.0-rc4-00029-gc7af9d5"

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIExpbnV4L2kz
ODYgNC40LjAtcmM0IEtlcm5lbCBDb25maWd1cmF0aW9uCiMKIyBDT05GSUdfNjRCSVQgaXMgbm90
IHNldApDT05GSUdfWDg2XzMyPXkKQ09ORklHX1g4Nj15CkNPTkZJR19JTlNUUlVDVElPTl9ERUNP
REVSPXkKQ09ORklHX1BFUkZfRVZFTlRTX0lOVEVMX1VOQ09SRT15CkNPTkZJR19PVVRQVVRfRk9S
TUFUPSJlbGYzMi1pMzg2IgpDT05GSUdfQVJDSF9ERUZDT05GSUc9ImFyY2gveDg2L2NvbmZpZ3Mv
aTM4Nl9kZWZjb25maWciCkNPTkZJR19MT0NLREVQX1NVUFBPUlQ9eQpDT05GSUdfU1RBQ0tUUkFD
RV9TVVBQT1JUPXkKQ09ORklHX0hBVkVfTEFURU5DWVRPUF9TVVBQT1JUPXkKQ09ORklHX01NVT15
CkNPTkZJR19ORUVEX1NHX0RNQV9MRU5HVEg9eQpDT05GSUdfR0VORVJJQ19JU0FfRE1BPXkKQ09O
RklHX0dFTkVSSUNfQlVHPXkKQ09ORklHX0dFTkVSSUNfSFdFSUdIVD15CkNPTkZJR19BUkNIX01B
WV9IQVZFX1BDX0ZEQz15CkNPTkZJR19SV1NFTV9YQ0hHQUREX0FMR09SSVRITT15CkNPTkZJR19H
RU5FUklDX0NBTElCUkFURV9ERUxBWT15CkNPTkZJR19BUkNIX0hBU19DUFVfUkVMQVg9eQpDT05G
SUdfQVJDSF9IQVNfQ0FDSEVfTElORV9TSVpFPXkKQ09ORklHX0hBVkVfU0VUVVBfUEVSX0NQVV9B
UkVBPXkKQ09ORklHX05FRURfUEVSX0NQVV9FTUJFRF9GSVJTVF9DSFVOSz15CkNPTkZJR19ORUVE
X1BFUl9DUFVfUEFHRV9GSVJTVF9DSFVOSz15CkNPTkZJR19BUkNIX0hJQkVSTkFUSU9OX1BPU1NJ
QkxFPXkKQ09ORklHX0FSQ0hfU1VTUEVORF9QT1NTSUJMRT15CkNPTkZJR19BUkNIX1dBTlRfSFVH
RV9QTURfU0hBUkU9eQpDT05GSUdfQVJDSF9XQU5UX0dFTkVSQUxfSFVHRVRMQj15CkNPTkZJR19B
UkNIX1NVUFBPUlRTX09QVElNSVpFRF9JTkxJTklORz15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0RF
QlVHX1BBR0VBTExPQz15CkNPTkZJR19YODZfMzJfU01QPXkKQ09ORklHX1g4Nl8zMl9MQVpZX0dT
PXkKQ09ORklHX0FSQ0hfSFdFSUdIVF9DRkxBR1M9Ii1mY2FsbC1zYXZlZC1lY3ggLWZjYWxsLXNh
dmVkLWVkeCIKQ09ORklHX0FSQ0hfU1VQUE9SVFNfVVBST0JFUz15CkNPTkZJR19GSVhfRUFSTFlD
T05fTUVNPXkKQ09ORklHX1BHVEFCTEVfTEVWRUxTPTIKQ09ORklHX0RFRkNPTkZJR19MSVNUPSIv
bGliL21vZHVsZXMvJFVOQU1FX1JFTEVBU0UvLmNvbmZpZyIKQ09ORklHX0lSUV9XT1JLPXkKQ09O
RklHX0JVSUxEVElNRV9FWFRBQkxFX1NPUlQ9eQoKIwojIEdlbmVyYWwgc2V0dXAKIwpDT05GSUdf
SU5JVF9FTlZfQVJHX0xJTUlUPTMyCkNPTkZJR19DUk9TU19DT01QSUxFPSIiCiMgQ09ORklHX0NP
TVBJTEVfVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19MT0NBTFZFUlNJT049IiIKQ09ORklHX0xPQ0FM
VkVSU0lPTl9BVVRPPXkKQ09ORklHX0hBVkVfS0VSTkVMX0daSVA9eQpDT05GSUdfSEFWRV9LRVJO
RUxfQlpJUDI9eQpDT05GSUdfSEFWRV9LRVJORUxfTFpNQT15CkNPTkZJR19IQVZFX0tFUk5FTF9Y
Wj15CkNPTkZJR19IQVZFX0tFUk5FTF9MWk89eQpDT05GSUdfSEFWRV9LRVJORUxfTFo0PXkKIyBD
T05GSUdfS0VSTkVMX0daSVAgaXMgbm90IHNldAojIENPTkZJR19LRVJORUxfQlpJUDIgaXMgbm90
IHNldAojIENPTkZJR19LRVJORUxfTFpNQSBpcyBub3Qgc2V0CkNPTkZJR19LRVJORUxfWFo9eQoj
IENPTkZJR19LRVJORUxfTFpPIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VSTkVMX0xaNCBpcyBub3Qg
c2V0CkNPTkZJR19ERUZBVUxUX0hPU1ROQU1FPSIobm9uZSkiCkNPTkZJR19TWVNWSVBDPXkKQ09O
RklHX1NZU1ZJUENfU1lTQ1RMPXkKIyBDT05GSUdfUE9TSVhfTVFVRVVFIGlzIG5vdCBzZXQKQ09O
RklHX0NST1NTX01FTU9SWV9BVFRBQ0g9eQpDT05GSUdfRkhBTkRMRT15CiMgQ09ORklHX1VTRUxJ
QiBpcyBub3Qgc2V0CiMgQ09ORklHX0FVRElUIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfQVJDSF9B
VURJVFNZU0NBTEw9eQoKIwojIElSUSBzdWJzeXN0ZW0KIwpDT05GSUdfR0VORVJJQ19JUlFfUFJP
QkU9eQpDT05GSUdfR0VORVJJQ19JUlFfU0hPVz15CkNPTkZJR19HRU5FUklDX1BFTkRJTkdfSVJR
PXkKQ09ORklHX0dFTkVSSUNfSVJRX0NISVA9eQpDT05GSUdfSVJRX0RPTUFJTj15CkNPTkZJR19J
UlFfRE9NQUlOX0hJRVJBUkNIWT15CiMgQ09ORklHX0lSUV9ET01BSU5fREVCVUcgaXMgbm90IHNl
dApDT05GSUdfSVJRX0ZPUkNFRF9USFJFQURJTkc9eQpDT05GSUdfU1BBUlNFX0lSUT15CkNPTkZJ
R19DTE9DS1NPVVJDRV9XQVRDSERPRz15CkNPTkZJR19BUkNIX0NMT0NLU09VUkNFX0RBVEE9eQpD
T05GSUdfQ0xPQ0tTT1VSQ0VfVkFMSURBVEVfTEFTVF9DWUNMRT15CkNPTkZJR19HRU5FUklDX1RJ
TUVfVlNZU0NBTEw9eQpDT05GSUdfR0VORVJJQ19DTE9DS0VWRU5UUz15CkNPTkZJR19HRU5FUklD
X0NMT0NLRVZFTlRTX0JST0FEQ0FTVD15CkNPTkZJR19HRU5FUklDX0NMT0NLRVZFTlRTX01JTl9B
REpVU1Q9eQpDT05GSUdfR0VORVJJQ19DTU9TX1VQREFURT15CgojCiMgVGltZXJzIHN1YnN5c3Rl
bQojCkNPTkZJR19USUNLX09ORVNIT1Q9eQpDT05GSUdfTk9fSFpfQ09NTU9OPXkKIyBDT05GSUdf
SFpfUEVSSU9ESUMgaXMgbm90IHNldApDT05GSUdfTk9fSFpfSURMRT15CkNPTkZJR19OT19IWj15
CiMgQ09ORklHX0hJR0hfUkVTX1RJTUVSUyBpcyBub3Qgc2V0CgojCiMgQ1BVL1Rhc2sgdGltZSBh
bmQgc3RhdHMgYWNjb3VudGluZwojCkNPTkZJR19USUNLX0NQVV9BQ0NPVU5USU5HPXkKIyBDT05G
SUdfSVJRX1RJTUVfQUNDT1VOVElORyBpcyBub3Qgc2V0CiMgQ09ORklHX0JTRF9QUk9DRVNTX0FD
Q1QgaXMgbm90IHNldAojIENPTkZJR19UQVNLU1RBVFMgaXMgbm90IHNldAoKIwojIFJDVSBTdWJz
eXN0ZW0KIwpDT05GSUdfUFJFRU1QVF9SQ1U9eQojIENPTkZJR19SQ1VfRVhQRVJUIGlzIG5vdCBz
ZXQKQ09ORklHX1NSQ1U9eQojIENPTkZJR19UQVNLU19SQ1UgaXMgbm90IHNldApDT05GSUdfUkNV
X1NUQUxMX0NPTU1PTj15CiMgQ09ORklHX1RSRUVfUkNVX1RSQUNFIGlzIG5vdCBzZXQKIyBDT05G
SUdfUkNVX0VYUEVESVRFX0JPT1QgaXMgbm90IHNldApDT05GSUdfQlVJTERfQklOMkM9eQpDT05G
SUdfSUtDT05GSUc9eQojIENPTkZJR19JS0NPTkZJR19QUk9DIGlzIG5vdCBzZXQKQ09ORklHX0xP
R19CVUZfU0hJRlQ9MTcKQ09ORklHX0xPR19DUFVfTUFYX0JVRl9TSElGVD0xMgpDT05GSUdfSEFW
RV9VTlNUQUJMRV9TQ0hFRF9DTE9DSz15CkNPTkZJR19BUkNIX1dBTlRfQkFUQ0hFRF9VTk1BUF9U
TEJfRkxVU0g9eQpDT05GSUdfQ0dST1VQUz15CiMgQ09ORklHX0NHUk9VUF9ERUJVRyBpcyBub3Qg
c2V0CkNPTkZJR19DR1JPVVBfRlJFRVpFUj15CkNPTkZJR19DR1JPVVBfUElEUz15CkNPTkZJR19D
R1JPVVBfREVWSUNFPXkKIyBDT05GSUdfQ1BVU0VUUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NHUk9V
UF9DUFVBQ0NUIGlzIG5vdCBzZXQKQ09ORklHX1BBR0VfQ09VTlRFUj15CkNPTkZJR19NRU1DRz15
CkNPTkZJR19NRU1DR19LTUVNPXkKQ09ORklHX0NHUk9VUF9QRVJGPXkKQ09ORklHX0NHUk9VUF9T
Q0hFRD15CkNPTkZJR19GQUlSX0dST1VQX1NDSEVEPXkKIyBDT05GSUdfQ0ZTX0JBTkRXSURUSCBp
cyBub3Qgc2V0CiMgQ09ORklHX1JUX0dST1VQX1NDSEVEIGlzIG5vdCBzZXQKQ09ORklHX0NIRUNL
UE9JTlRfUkVTVE9SRT15CiMgQ09ORklHX05BTUVTUEFDRVMgaXMgbm90IHNldApDT05GSUdfU0NI
RURfQVVUT0dST1VQPXkKIyBDT05GSUdfU1lTRlNfREVQUkVDQVRFRCBpcyBub3Qgc2V0CiMgQ09O
RklHX1JFTEFZIGlzIG5vdCBzZXQKQ09ORklHX0JMS19ERVZfSU5JVFJEPXkKQ09ORklHX0lOSVRS
QU1GU19TT1VSQ0U9IiIKQ09ORklHX1JEX0daSVA9eQpDT05GSUdfUkRfQlpJUDI9eQojIENPTkZJ
R19SRF9MWk1BIGlzIG5vdCBzZXQKQ09ORklHX1JEX1haPXkKQ09ORklHX1JEX0xaTz15CkNPTkZJ
R19SRF9MWjQ9eQpDT05GSUdfQ0NfT1BUSU1JWkVfRk9SX1NJWkU9eQpDT05GSUdfU1lTQ1RMPXkK
Q09ORklHX0FOT05fSU5PREVTPXkKQ09ORklHX0hBVkVfVUlEMTY9eQpDT05GSUdfU1lTQ1RMX0VY
Q0VQVElPTl9UUkFDRT15CkNPTkZJR19IQVZFX1BDU1BLUl9QTEFURk9STT15CkNPTkZJR19CUEY9
eQpDT05GSUdfRVhQRVJUPXkKQ09ORklHX1VJRDE2PXkKQ09ORklHX01VTFRJVVNFUj15CkNPTkZJ
R19TR0VUTUFTS19TWVNDQUxMPXkKQ09ORklHX1NZU0ZTX1NZU0NBTEw9eQojIENPTkZJR19TWVND
VExfU1lTQ0FMTCBpcyBub3Qgc2V0CkNPTkZJR19LQUxMU1lNUz15CkNPTkZJR19LQUxMU1lNU19B
TEw9eQpDT05GSUdfUFJJTlRLPXkKQ09ORklHX0JVRz15CiMgQ09ORklHX1BDU1BLUl9QTEFURk9S
TSBpcyBub3Qgc2V0CkNPTkZJR19CQVNFX0ZVTEw9eQpDT05GSUdfRlVURVg9eQpDT05GSUdfRVBP
TEw9eQpDT05GSUdfU0lHTkFMRkQ9eQpDT05GSUdfVElNRVJGRD15CkNPTkZJR19FVkVOVEZEPXkK
IyBDT05GSUdfQlBGX1NZU0NBTEwgaXMgbm90IHNldAojIENPTkZJR19TSE1FTSBpcyBub3Qgc2V0
CkNPTkZJR19BSU89eQpDT05GSUdfQURWSVNFX1NZU0NBTExTPXkKQ09ORklHX1VTRVJGQVVMVEZE
PXkKQ09ORklHX1BDSV9RVUlSS1M9eQpDT05GSUdfTUVNQkFSUklFUj15CiMgQ09ORklHX0VNQkVE
REVEIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfUEVSRl9FVkVOVFM9eQpDT05GSUdfUEVSRl9VU0Vf
Vk1BTExPQz15CgojCiMgS2VybmVsIFBlcmZvcm1hbmNlIEV2ZW50cyBBbmQgQ291bnRlcnMKIwpD
T05GSUdfUEVSRl9FVkVOVFM9eQpDT05GSUdfREVCVUdfUEVSRl9VU0VfVk1BTExPQz15CkNPTkZJ
R19WTV9FVkVOVF9DT1VOVEVSUz15CkNPTkZJR19TTFVCX0RFQlVHPXkKIyBDT05GSUdfQ09NUEFU
X0JSSyBpcyBub3Qgc2V0CiMgQ09ORklHX1NMQUIgaXMgbm90IHNldApDT05GSUdfU0xVQj15CiMg
Q09ORklHX1NMT0IgaXMgbm90IHNldAojIENPTkZJR19TTFVCX0NQVV9QQVJUSUFMIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU1lTVEVNX0RBVEFfVkVSSUZJQ0FUSU9OIGlzIG5vdCBzZXQKQ09ORklHX1BS
T0ZJTElORz15CkNPTkZJR19PUFJPRklMRT15CiMgQ09ORklHX09QUk9GSUxFX0VWRU5UX01VTFRJ
UExFWCBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX09QUk9GSUxFPXkKQ09ORklHX09QUk9GSUxFX05N
SV9USU1FUj15CiMgQ09ORklHX0tQUk9CRVMgaXMgbm90IHNldApDT05GSUdfSlVNUF9MQUJFTD15
CiMgQ09ORklHX1NUQVRJQ19LRVlTX1NFTEZURVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfVVBST0JF
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0hBVkVfNjRCSVRfQUxJR05FRF9BQ0NFU1MgaXMgbm90IHNl
dApDT05GSUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUz15CkNPTkZJR19BUkNIX1VT
RV9CVUlMVElOX0JTV0FQPXkKQ09ORklHX0hBVkVfSU9SRU1BUF9QUk9UPXkKQ09ORklHX0hBVkVf
S1BST0JFUz15CkNPTkZJR19IQVZFX0tSRVRQUk9CRVM9eQpDT05GSUdfSEFWRV9PUFRQUk9CRVM9
eQpDT05GSUdfSEFWRV9LUFJPQkVTX09OX0ZUUkFDRT15CkNPTkZJR19IQVZFX0FSQ0hfVFJBQ0VI
T09LPXkKQ09ORklHX0hBVkVfRE1BX0FUVFJTPXkKQ09ORklHX0hBVkVfRE1BX0NPTlRJR1VPVVM9
eQpDT05GSUdfR0VORVJJQ19TTVBfSURMRV9USFJFQUQ9eQpDT05GSUdfQVJDSF9XQU5UU19EWU5B
TUlDX1RBU0tfU1RSVUNUPXkKQ09ORklHX0hBVkVfUkVHU19BTkRfU1RBQ0tfQUNDRVNTX0FQST15
CkNPTkZJR19IQVZFX0RNQV9BUElfREVCVUc9eQpDT05GSUdfSEFWRV9IV19CUkVBS1BPSU5UPXkK
Q09ORklHX0hBVkVfTUlYRURfQlJFQUtQT0lOVFNfUkVHUz15CkNPTkZJR19IQVZFX1VTRVJfUkVU
VVJOX05PVElGSUVSPXkKQ09ORklHX0hBVkVfUEVSRl9FVkVOVFNfTk1JPXkKQ09ORklHX0hBVkVf
UEVSRl9SRUdTPXkKQ09ORklHX0hBVkVfUEVSRl9VU0VSX1NUQUNLX0RVTVA9eQpDT05GSUdfSEFW
RV9BUkNIX0pVTVBfTEFCRUw9eQpDT05GSUdfQVJDSF9IQVZFX05NSV9TQUZFX0NNUFhDSEc9eQpD
T05GSUdfSEFWRV9BTElHTkVEX1NUUlVDVF9QQUdFPXkKQ09ORklHX0hBVkVfQ01QWENIR19MT0NB
TD15CkNPTkZJR19IQVZFX0NNUFhDSEdfRE9VQkxFPXkKQ09ORklHX0FSQ0hfV0FOVF9JUENfUEFS
U0VfVkVSU0lPTj15CkNPTkZJR19IQVZFX0FSQ0hfU0VDQ09NUF9GSUxURVI9eQpDT05GSUdfU0VD
Q09NUF9GSUxURVI9eQpDT05GSUdfSEFWRV9DQ19TVEFDS1BST1RFQ1RPUj15CiMgQ09ORklHX0ND
X1NUQUNLUFJPVEVDVE9SIGlzIG5vdCBzZXQKQ09ORklHX0NDX1NUQUNLUFJPVEVDVE9SX05PTkU9
eQojIENPTkZJR19DQ19TVEFDS1BST1RFQ1RPUl9SRUdVTEFSIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q0NfU1RBQ0tQUk9URUNUT1JfU1RST05HIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfSVJRX1RJTUVf
QUNDT1VOVElORz15CkNPTkZJR19IQVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0U9eQpDT05G
SUdfTU9EVUxFU19VU0VfRUxGX1JFTD15CkNPTkZJR19BUkNIX0hBU19FTEZfUkFORE9NSVpFPXkK
Q09ORklHX0hBVkVfQ09QWV9USFJFQURfVExTPXkKQ09ORklHX0NMT05FX0JBQ0tXQVJEUz15CkNP
TkZJR19PTERfU0lHU1VTUEVORDM9eQpDT05GSUdfT0xEX1NJR0FDVElPTj15CgojCiMgR0NPVi1i
YXNlZCBrZXJuZWwgcHJvZmlsaW5nCiMKIyBDT05GSUdfR0NPVl9LRVJORUwgaXMgbm90IHNldApD
T05GSUdfQVJDSF9IQVNfR0NPVl9QUk9GSUxFX0FMTD15CkNPTkZJR19IQVZFX0dFTkVSSUNfRE1B
X0NPSEVSRU5UPXkKQ09ORklHX1NMQUJJTkZPPXkKQ09ORklHX1JUX01VVEVYRVM9eQpDT05GSUdf
QkFTRV9TTUFMTD0wCkNPTkZJR19NT0RVTEVTPXkKQ09ORklHX01PRFVMRV9GT1JDRV9MT0FEPXkK
IyBDT05GSUdfTU9EVUxFX1VOTE9BRCBpcyBub3Qgc2V0CkNPTkZJR19NT0RWRVJTSU9OUz15CkNP
TkZJR19NT0RVTEVfU1JDVkVSU0lPTl9BTEw9eQojIENPTkZJR19NT0RVTEVfU0lHIGlzIG5vdCBz
ZXQKQ09ORklHX01PRFVMRV9DT01QUkVTUz15CkNPTkZJR19NT0RVTEVfQ09NUFJFU1NfR1pJUD15
CiMgQ09ORklHX01PRFVMRV9DT01QUkVTU19YWiBpcyBub3Qgc2V0CkNPTkZJR19NT0RVTEVTX1RS
RUVfTE9PS1VQPXkKQ09ORklHX1NUT1BfTUFDSElORT15CiMgQ09ORklHX0JMT0NLIGlzIG5vdCBz
ZXQKQ09ORklHX1BBREFUQT15CkNPTkZJR19BU04xPXkKQ09ORklHX1VOSU5MSU5FX1NQSU5fVU5M
T0NLPXkKQ09ORklHX0FSQ0hfU1VQUE9SVFNfQVRPTUlDX1JNVz15CkNPTkZJR19SV1NFTV9TUElO
X09OX09XTkVSPXkKQ09ORklHX0xPQ0tfU1BJTl9PTl9PV05FUj15CkNPTkZJR19BUkNIX1VTRV9R
VUVVRURfU1BJTkxPQ0tTPXkKQ09ORklHX1FVRVVFRF9TUElOTE9DS1M9eQpDT05GSUdfQVJDSF9V
U0VfUVVFVUVEX1JXTE9DS1M9eQpDT05GSUdfUVVFVUVEX1JXTE9DS1M9eQpDT05GSUdfRlJFRVpF
Uj15CgojCiMgUHJvY2Vzc29yIHR5cGUgYW5kIGZlYXR1cmVzCiMKIyBDT05GSUdfWk9ORV9ETUEg
aXMgbm90IHNldApDT05GSUdfU01QPXkKQ09ORklHX1g4Nl9GRUFUVVJFX05BTUVTPXkKIyBDT05G
SUdfWDg2X01QUEFSU0UgaXMgbm90IHNldApDT05GSUdfWDg2X0JJR1NNUD15CkNPTkZJR19YODZf
RVhURU5ERURfUExBVEZPUk09eQojIENPTkZJR19YODZfR09MREZJU0ggaXMgbm90IHNldAojIENP
TkZJR19YODZfSU5URUxfTUlEIGlzIG5vdCBzZXQKIyBDT05GSUdfWDg2X0lOVEVMX1FVQVJLIGlz
IG5vdCBzZXQKIyBDT05GSUdfWDg2X0lOVEVMX0xQU1MgaXMgbm90IHNldAojIENPTkZJR19YODZf
QU1EX1BMQVRGT1JNX0RFVklDRSBpcyBub3Qgc2V0CkNPTkZJR19JT1NGX01CST15CiMgQ09ORklH
X0lPU0ZfTUJJX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX1g4Nl9SREMzMjFYPXkKIyBDT05GSUdf
WDg2XzMyX05PTl9TVEFOREFSRCBpcyBub3Qgc2V0CkNPTkZJR19YODZfU1VQUE9SVFNfTUVNT1JZ
X0ZBSUxVUkU9eQpDT05GSUdfWDg2XzMyX0lSSVM9bQojIENPTkZJR19TQ0hFRF9PTUlUX0ZSQU1F
X1BPSU5URVIgaXMgbm90IHNldApDT05GSUdfSFlQRVJWSVNPUl9HVUVTVD15CkNPTkZJR19QQVJB
VklSVD15CiMgQ09ORklHX1BBUkFWSVJUX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFSQVZJ
UlRfU1BJTkxPQ0tTIGlzIG5vdCBzZXQKQ09ORklHX0tWTV9HVUVTVD15CiMgQ09ORklHX0tWTV9E
RUJVR19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0xHVUVTVF9HVUVTVCBpcyBub3Qgc2V0CiMgQ09O
RklHX1BBUkFWSVJUX1RJTUVfQUNDT1VOVElORyBpcyBub3Qgc2V0CkNPTkZJR19QQVJBVklSVF9D
TE9DSz15CkNPTkZJR19OT19CT09UTUVNPXkKIyBDT05GSUdfTTQ4NiBpcyBub3Qgc2V0CiMgQ09O
RklHX001ODYgaXMgbm90IHNldAojIENPTkZJR19NNTg2VFNDIGlzIG5vdCBzZXQKQ09ORklHX001
ODZNTVg9eQojIENPTkZJR19NNjg2IGlzIG5vdCBzZXQKIyBDT05GSUdfTVBFTlRJVU1JSSBpcyBu
b3Qgc2V0CiMgQ09ORklHX01QRU5USVVNSUlJIGlzIG5vdCBzZXQKIyBDT05GSUdfTVBFTlRJVU1N
IGlzIG5vdCBzZXQKIyBDT05GSUdfTVBFTlRJVU00IGlzIG5vdCBzZXQKIyBDT05GSUdfTUs2IGlz
IG5vdCBzZXQKIyBDT05GSUdfTUs3IGlzIG5vdCBzZXQKIyBDT05GSUdfTUs4IGlzIG5vdCBzZXQK
IyBDT05GSUdfTUNSVVNPRSBpcyBub3Qgc2V0CiMgQ09ORklHX01FRkZJQ0VPTiBpcyBub3Qgc2V0
CiMgQ09ORklHX01XSU5DSElQQzYgaXMgbm90IHNldAojIENPTkZJR19NV0lOQ0hJUDNEIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUVMQU4gaXMgbm90IHNldAojIENPTkZJR19NR0VPREVHWDEgaXMgbm90
IHNldAojIENPTkZJR19NR0VPREVfTFggaXMgbm90IHNldAojIENPTkZJR19NQ1lSSVhJSUkgaXMg
bm90IHNldAojIENPTkZJR19NVklBQzNfMiBpcyBub3Qgc2V0CiMgQ09ORklHX01WSUFDNyBpcyBu
b3Qgc2V0CiMgQ09ORklHX01DT1JFMiBpcyBub3Qgc2V0CiMgQ09ORklHX01BVE9NIGlzIG5vdCBz
ZXQKQ09ORklHX1g4Nl9HRU5FUklDPXkKQ09ORklHX1g4Nl9JTlRFUk5PREVfQ0FDSEVfU0hJRlQ9
NgpDT05GSUdfWDg2X0wxX0NBQ0hFX1NISUZUPTYKQ09ORklHX1g4Nl9QUFJPX0ZFTkNFPXkKQ09O
RklHX1g4Nl9GMDBGX0JVRz15CkNPTkZJR19YODZfQUxJR05NRU5UXzE2PXkKQ09ORklHX1g4Nl9J
TlRFTF9VU0VSQ09QWT15CkNPTkZJR19YODZfVFNDPXkKQ09ORklHX1g4Nl9NSU5JTVVNX0NQVV9G
QU1JTFk9NAojIENPTkZJR19QUk9DRVNTT1JfU0VMRUNUIGlzIG5vdCBzZXQKQ09ORklHX0NQVV9T
VVBfSU5URUw9eQpDT05GSUdfQ1BVX1NVUF9DWVJJWF8zMj15CkNPTkZJR19DUFVfU1VQX0FNRD15
CkNPTkZJR19DUFVfU1VQX0NFTlRBVVI9eQpDT05GSUdfQ1BVX1NVUF9UUkFOU01FVEFfMzI9eQpD
T05GSUdfQ1BVX1NVUF9VTUNfMzI9eQpDT05GSUdfSFBFVF9USU1FUj15CiMgQ09ORklHX0RNSSBp
cyBub3Qgc2V0CkNPTkZJR19OUl9DUFVTPTMyCkNPTkZJR19TQ0hFRF9TTVQ9eQojIENPTkZJR19T
Q0hFRF9NQyBpcyBub3Qgc2V0CiMgQ09ORklHX1BSRUVNUFRfTk9ORSBpcyBub3Qgc2V0CiMgQ09O
RklHX1BSRUVNUFRfVk9MVU5UQVJZIGlzIG5vdCBzZXQKQ09ORklHX1BSRUVNUFQ9eQpDT05GSUdf
UFJFRU1QVF9DT1VOVD15CkNPTkZJR19YODZfTE9DQUxfQVBJQz15CkNPTkZJR19YODZfSU9fQVBJ
Qz15CiMgQ09ORklHX1g4Nl9SRVJPVVRFX0ZPUl9CUk9LRU5fQk9PVF9JUlFTIGlzIG5vdCBzZXQK
Q09ORklHX1g4Nl9NQ0U9eQpDT05GSUdfWDg2X01DRV9JTlRFTD15CiMgQ09ORklHX1g4Nl9NQ0Vf
QU1EIGlzIG5vdCBzZXQKQ09ORklHX1g4Nl9BTkNJRU5UX01DRT15CkNPTkZJR19YODZfTUNFX1RI
UkVTSE9MRD15CkNPTkZJR19YODZfTUNFX0lOSkVDVD1tCkNPTkZJR19YODZfVEhFUk1BTF9WRUNU
T1I9eQpDT05GSUdfWDg2X0xFR0FDWV9WTTg2PXkKQ09ORklHX1ZNODY9eQojIENPTkZJR19YODZf
MTZCSVQgaXMgbm90IHNldApDT05GSUdfVE9TSElCQT15CkNPTkZJR19JOEs9eQpDT05GSUdfWDg2
X1JFQk9PVEZJWFVQUz15CkNPTkZJR19NSUNST0NPREU9eQojIENPTkZJR19NSUNST0NPREVfSU5U
RUwgaXMgbm90IHNldAojIENPTkZJR19NSUNST0NPREVfQU1EIGlzIG5vdCBzZXQKQ09ORklHX01J
Q1JPQ09ERV9PTERfSU5URVJGQUNFPXkKQ09ORklHX1g4Nl9NU1I9bQojIENPTkZJR19YODZfQ1BV
SUQgaXMgbm90IHNldApDT05GSUdfTk9ISUdITUVNPXkKIyBDT05GSUdfSElHSE1FTTRHIGlzIG5v
dCBzZXQKIyBDT05GSUdfSElHSE1FTTY0RyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZNU1BMSVRfM0cg
aXMgbm90IHNldApDT05GSUdfVk1TUExJVF8zR19PUFQ9eQojIENPTkZJR19WTVNQTElUXzJHIGlz
IG5vdCBzZXQKIyBDT05GSUdfVk1TUExJVF8yR19PUFQgaXMgbm90IHNldAojIENPTkZJR19WTVNQ
TElUXzFHIGlzIG5vdCBzZXQKQ09ORklHX1BBR0VfT0ZGU0VUPTB4QjAwMDAwMDAKIyBDT05GSUdf
WDg2X1BBRSBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0ZMQVRNRU1fRU5BQkxFPXkKQ09ORklHX0FS
Q0hfU1BBUlNFTUVNX0VOQUJMRT15CkNPTkZJR19BUkNIX1NFTEVDVF9NRU1PUllfTU9ERUw9eQpD
T05GSUdfSUxMRUdBTF9QT0lOVEVSX1ZBTFVFPTAKQ09ORklHX1NFTEVDVF9NRU1PUllfTU9ERUw9
eQpDT05GSUdfRkxBVE1FTV9NQU5VQUw9eQojIENPTkZJR19TUEFSU0VNRU1fTUFOVUFMIGlzIG5v
dCBzZXQKQ09ORklHX0ZMQVRNRU09eQpDT05GSUdfRkxBVF9OT0RFX01FTV9NQVA9eQpDT05GSUdf
U1BBUlNFTUVNX1NUQVRJQz15CkNPTkZJR19IQVZFX01FTUJMT0NLPXkKQ09ORklHX0hBVkVfTUVN
QkxPQ0tfTk9ERV9NQVA9eQpDT05GSUdfQVJDSF9ESVNDQVJEX01FTUJMT0NLPXkKIyBDT05GSUdf
SEFWRV9CT09UTUVNX0lORk9fTk9ERSBpcyBub3Qgc2V0CkNPTkZJR19TUExJVF9QVExPQ0tfQ1BV
Uz00CkNPTkZJR19NRU1PUllfQkFMTE9PTj15CkNPTkZJR19CQUxMT09OX0NPTVBBQ1RJT049eQpD
T05GSUdfQ09NUEFDVElPTj15CkNPTkZJR19NSUdSQVRJT049eQojIENPTkZJR19QSFlTX0FERFJf
VF82NEJJVCBpcyBub3Qgc2V0CkNPTkZJR19aT05FX0RNQV9GTEFHPTAKQ09ORklHX1ZJUlRfVE9f
QlVTPXkKQ09ORklHX0tTTT15CkNPTkZJR19ERUZBVUxUX01NQVBfTUlOX0FERFI9NDA5NgpDT05G
SUdfQVJDSF9TVVBQT1JUU19NRU1PUllfRkFJTFVSRT15CiMgQ09ORklHX01FTU9SWV9GQUlMVVJF
IGlzIG5vdCBzZXQKIyBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UgaXMgbm90IHNldAojIENP
TkZJR19DTEVBTkNBQ0hFIGlzIG5vdCBzZXQKIyBDT05GSUdfQ01BIGlzIG5vdCBzZXQKQ09ORklH
X1pQT09MPXkKQ09ORklHX1pCVUQ9bQojIENPTkZJR19aU01BTExPQyBpcyBub3Qgc2V0CkNPTkZJ
R19HRU5FUklDX0VBUkxZX0lPUkVNQVA9eQpDT05GSUdfQVJDSF9TVVBQT1JUU19ERUZFUlJFRF9T
VFJVQ1RfUEFHRV9JTklUPXkKIyBDT05GSUdfSURMRV9QQUdFX1RSQUNLSU5HIGlzIG5vdCBzZXQK
Q09ORklHX1g4Nl9DSEVDS19CSU9TX0NPUlJVUFRJT049eQpDT05GSUdfWDg2X0JPT1RQQVJBTV9N
RU1PUllfQ09SUlVQVElPTl9DSEVDSz15CkNPTkZJR19YODZfUkVTRVJWRV9MT1c9NjQKQ09ORklH
X01BVEhfRU1VTEFUSU9OPXkKQ09ORklHX01UUlI9eQojIENPTkZJR19NVFJSX1NBTklUSVpFUiBp
cyBub3Qgc2V0CkNPTkZJR19YODZfUEFUPXkKQ09ORklHX0FSQ0hfVVNFU19QR19VTkNBQ0hFRD15
CkNPTkZJR19BUkNIX1JBTkRPTT15CkNPTkZJR19YODZfU01BUD15CiMgQ09ORklHX1g4Nl9JTlRF
TF9NUFggaXMgbm90IHNldAojIENPTkZJR19FRkkgaXMgbm90IHNldApDT05GSUdfU0VDQ09NUD15
CiMgQ09ORklHX0haXzEwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0haXzI1MCBpcyBub3Qgc2V0CiMg
Q09ORklHX0haXzMwMCBpcyBub3Qgc2V0CkNPTkZJR19IWl8xMDAwPXkKQ09ORklHX0haPTEwMDAK
IyBDT05GSUdfU0NIRURfSFJUSUNLIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VYRUMgaXMgbm90IHNl
dApDT05GSUdfUEhZU0lDQUxfU1RBUlQ9MHgxMDAwMDAwCiMgQ09ORklHX1JFTE9DQVRBQkxFIGlz
IG5vdCBzZXQKQ09ORklHX1BIWVNJQ0FMX0FMSUdOPTB4MjAwMDAwCkNPTkZJR19IT1RQTFVHX0NQ
VT15CiMgQ09ORklHX0JPT1RQQVJBTV9IT1RQTFVHX0NQVTAgaXMgbm90IHNldAojIENPTkZJR19E
RUJVR19IT1RQTFVHX0NQVTAgaXMgbm90IHNldAojIENPTkZJR19DT01QQVRfVkRTTyBpcyBub3Qg
c2V0CiMgQ09ORklHX0NNRExJTkVfQk9PTCBpcyBub3Qgc2V0CkNPTkZJR19NT0RJRllfTERUX1NZ
U0NBTEw9eQoKIwojIFBvd2VyIG1hbmFnZW1lbnQgYW5kIEFDUEkgb3B0aW9ucwojCiMgQ09ORklH
X1NVU1BFTkQgaXMgbm90IHNldAojIENPTkZJR19QTSBpcyBub3Qgc2V0CkNPTkZJR19BQ1BJPXkK
Q09ORklHX0FDUElfTEVHQUNZX1RBQkxFU19MT09LVVA9eQpDT05GSUdfQVJDSF9NSUdIVF9IQVZF
X0FDUElfUERDPXkKQ09ORklHX0FDUElfU1lTVEVNX1BPV0VSX1NUQVRFU19TVVBQT1JUPXkKIyBD
T05GSUdfQUNQSV9ERUJVR0dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0FDUElfUFJPQ0ZTX1BPV0VS
IGlzIG5vdCBzZXQKQ09ORklHX0FDUElfUkVWX09WRVJSSURFX1BPU1NJQkxFPXkKIyBDT05GSUdf
QUNQSV9FQ19ERUJVR0ZTIGlzIG5vdCBzZXQKQ09ORklHX0FDUElfQUM9eQpDT05GSUdfQUNQSV9C
QVRURVJZPXkKQ09ORklHX0FDUElfQlVUVE9OPXkKQ09ORklHX0FDUElfRkFOPXkKIyBDT05GSUdf
QUNQSV9ET0NLIGlzIG5vdCBzZXQKQ09ORklHX0FDUElfQ1BVX0ZSRVFfUFNTPXkKQ09ORklHX0FD
UElfUFJPQ0VTU09SX0lETEU9eQpDT05GSUdfQUNQSV9QUk9DRVNTT1I9eQpDT05GSUdfQUNQSV9I
T1RQTFVHX0NQVT15CiMgQ09ORklHX0FDUElfUFJPQ0VTU09SX0FHR1JFR0FUT1IgaXMgbm90IHNl
dApDT05GSUdfQUNQSV9USEVSTUFMPXkKQ09ORklHX0FDUElfQ1VTVE9NX0RTRFRfRklMRT0iIgoj
IENPTkZJR19BQ1BJX0NVU1RPTV9EU0RUIGlzIG5vdCBzZXQKIyBDT05GSUdfQUNQSV9JTklUUkRf
VEFCTEVfT1ZFUlJJREUgaXMgbm90IHNldAojIENPTkZJR19BQ1BJX0RFQlVHIGlzIG5vdCBzZXQK
IyBDT05GSUdfQUNQSV9QQ0lfU0xPVCBpcyBub3Qgc2V0CkNPTkZJR19YODZfUE1fVElNRVI9eQpD
T05GSUdfQUNQSV9DT05UQUlORVI9eQpDT05GSUdfQUNQSV9IT1RQTFVHX0lPQVBJQz15CiMgQ09O
RklHX0FDUElfU0JTIGlzIG5vdCBzZXQKIyBDT05GSUdfQUNQSV9IRUQgaXMgbm90IHNldAojIENP
TkZJR19BQ1BJX0NVU1RPTV9NRVRIT0QgaXMgbm90IHNldAojIENPTkZJR19BQ1BJX1JFRFVDRURf
SEFSRFdBUkVfT05MWSBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0FDUElfQVBFST15CkNPTkZJR19I
QVZFX0FDUElfQVBFSV9OTUk9eQojIENPTkZJR19BQ1BJX0FQRUkgaXMgbm90IHNldAojIENPTkZJ
R19BQ1BJX0VYVExPRyBpcyBub3Qgc2V0CiMgQ09ORklHX1BNSUNfT1BSRUdJT04gaXMgbm90IHNl
dApDT05GSUdfU0ZJPXkKCiMKIyBDUFUgRnJlcXVlbmN5IHNjYWxpbmcKIwojIENPTkZJR19DUFVf
RlJFUSBpcyBub3Qgc2V0CgojCiMgQ1BVIElkbGUKIwpDT05GSUdfQ1BVX0lETEU9eQpDT05GSUdf
Q1BVX0lETEVfR09WX0xBRERFUj15CkNPTkZJR19DUFVfSURMRV9HT1ZfTUVOVT15CiMgQ09ORklH
X0FSQ0hfTkVFRFNfQ1BVX0lETEVfQ09VUExFRCBpcyBub3Qgc2V0CkNPTkZJR19JTlRFTF9JRExF
PXkKCiMKIyBCdXMgb3B0aW9ucyAoUENJIGV0Yy4pCiMKQ09ORklHX1BDST15CiMgQ09ORklHX1BD
SV9HT0JJT1MgaXMgbm90IHNldAojIENPTkZJR19QQ0lfR09NTUNPTkZJRyBpcyBub3Qgc2V0CiMg
Q09ORklHX1BDSV9HT0RJUkVDVCBpcyBub3Qgc2V0CkNPTkZJR19QQ0lfR09BTlk9eQpDT05GSUdf
UENJX0JJT1M9eQpDT05GSUdfUENJX0RJUkVDVD15CkNPTkZJR19QQ0lfTU1DT05GSUc9eQpDT05G
SUdfUENJX0RPTUFJTlM9eQojIENPTkZJR19QQ0lfQ05CMjBMRV9RVUlSSyBpcyBub3Qgc2V0CiMg
Q09ORklHX1BDSUVQT1JUQlVTIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJX01TSSBpcyBub3Qgc2V0
CiMgQ09ORklHX1BDSV9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSV9SRUFMTE9DX0VOQUJM
RV9BVVRPIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJX1NUVUIgaXMgbm90IHNldApDT05GSUdfSFRf
SVJRPXkKIyBDT05GSUdfUENJX0lPViBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSV9QUkkgaXMgbm90
IHNldAojIENPTkZJR19QQ0lfUEFTSUQgaXMgbm90IHNldApDT05GSUdfUENJX0xBQkVMPXkKCiMK
IyBQQ0kgaG9zdCBjb250cm9sbGVyIGRyaXZlcnMKIwpDT05GSUdfSVNBX0RNQV9BUEk9eQpDT05G
SUdfSVNBPXkKIyBDT05GSUdfRUlTQSBpcyBub3Qgc2V0CkNPTkZJR19TQ3gyMDA9bQpDT05GSUdf
U0N4MjAwSFJfVElNRVI9bQojIENPTkZJR19PTFBDIGlzIG5vdCBzZXQKIyBDT05GSUdfQUxJWCBp
cyBub3Qgc2V0CkNPTkZJR19ORVQ1NTAxPXkKQ09ORklHX0FNRF9OQj15CkNPTkZJR19QQ0NBUkQ9
bQpDT05GSUdfUENNQ0lBPW0KIyBDT05GSUdfUENNQ0lBX0xPQURfQ0lTIGlzIG5vdCBzZXQKQ09O
RklHX0NBUkRCVVM9eQoKIwojIFBDLWNhcmQgYnJpZGdlcwojCiMgQ09ORklHX1lFTlRBIGlzIG5v
dCBzZXQKIyBDT05GSUdfUEQ2NzI5IGlzIG5vdCBzZXQKIyBDT05GSUdfSTgyMDkyIGlzIG5vdCBz
ZXQKQ09ORklHX0k4MjM2NT1tCkNPTkZJR19UQ0lDPW0KQ09ORklHX1BDTUNJQV9QUk9CRT15CkNP
TkZJR19QQ0NBUkRfTk9OU1RBVElDPXkKIyBDT05GSUdfSE9UUExVR19QQ0kgaXMgbm90IHNldAoj
IENPTkZJR19SQVBJRElPIGlzIG5vdCBzZXQKQ09ORklHX1g4Nl9TWVNGQj15CgojCiMgRXhlY3V0
YWJsZSBmaWxlIGZvcm1hdHMgLyBFbXVsYXRpb25zCiMKQ09ORklHX0JJTkZNVF9FTEY9eQpDT05G
SUdfQklORk1UX1NDUklQVD15CkNPTkZJR19IQVZFX0FPVVQ9eQpDT05GSUdfQklORk1UX0FPVVQ9
eQpDT05GSUdfQklORk1UX01JU0M9bQojIENPTkZJR19DT1JFRFVNUCBpcyBub3Qgc2V0CkNPTkZJ
R19IQVZFX0FUT01JQ19JT01BUD15CkNPTkZJR19QTUNfQVRPTT15CkNPTkZJR19ORVQ9eQoKIwoj
IE5ldHdvcmtpbmcgb3B0aW9ucwojCiMgQ09ORklHX1BBQ0tFVCBpcyBub3Qgc2V0CkNPTkZJR19V
TklYPXkKIyBDT05GSUdfVU5JWF9ESUFHIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0tFWSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lORVQgaXMgbm90IHNldAojIENPTkZJR19ORVRXT1JLX1NFQ01BUksg
aXMgbm90IHNldAojIENPTkZJR19ORVRfUFRQX0NMQVNTSUZZIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkVUV09SS19QSFlfVElNRVNUQU1QSU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSIGlz
IG5vdCBzZXQKIyBDT05GSUdfQVRNIGlzIG5vdCBzZXQKIyBDT05GSUdfQlJJREdFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVkxBTl84MDIxUSBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQ05FVCBpcyBub3Qg
c2V0CiMgQ09ORklHX0xMQzIgaXMgbm90IHNldAojIENPTkZJR19JUFggaXMgbm90IHNldAojIENP
TkZJR19BVEFMSyBpcyBub3Qgc2V0CiMgQ09ORklHX1gyNSBpcyBub3Qgc2V0CiMgQ09ORklHX0xB
UEIgaXMgbm90IHNldAojIENPTkZJR19QSE9ORVQgaXMgbm90IHNldAojIENPTkZJR19JRUVFODAy
MTU0IGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSEVEIGlzIG5vdCBzZXQKIyBDT05GSUdfRENC
IGlzIG5vdCBzZXQKIyBDT05GSUdfRE5TX1JFU09MVkVSIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFU
TUFOX0FEViBpcyBub3Qgc2V0CiMgQ09ORklHX1ZTT0NLRVRTIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkVUTElOS19NTUFQIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUTElOS19ESUFHIGlzIG5vdCBzZXQK
IyBDT05GSUdfTVBMUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hTUiBpcyBub3Qgc2V0CkNPTkZJR19S
UFM9eQpDT05GSUdfUkZTX0FDQ0VMPXkKQ09ORklHX1hQUz15CiMgQ09ORklHX0NHUk9VUF9ORVRf
UFJJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0NHUk9VUF9ORVRfQ0xBU1NJRCBpcyBub3Qgc2V0CkNP
TkZJR19ORVRfUlhfQlVTWV9QT0xMPXkKQ09ORklHX0JRTD15CkNPTkZJR19ORVRfRkxPV19MSU1J
VD15CgojCiMgTmV0d29yayB0ZXN0aW5nCiMKIyBDT05GSUdfSEFNUkFESU8gaXMgbm90IHNldAoj
IENPTkZJR19DQU4gaXMgbm90IHNldAojIENPTkZJR19JUkRBIGlzIG5vdCBzZXQKIyBDT05GSUdf
QlQgaXMgbm90IHNldApDT05GSUdfV0lSRUxFU1M9eQojIENPTkZJR19DRkc4MDIxMSBpcyBub3Qg
c2V0CiMgQ09ORklHX0xJQjgwMjExIGlzIG5vdCBzZXQKCiMKIyBDRkc4MDIxMSBuZWVkcyB0byBi
ZSBlbmFibGVkIGZvciBNQUM4MDIxMQojCkNPTkZJR19NQUM4MDIxMV9TVEFfSEFTSF9NQVhfU0la
RT0wCiMgQ09ORklHX1dJTUFYIGlzIG5vdCBzZXQKIyBDT05GSUdfUkZLSUxMIGlzIG5vdCBzZXQK
IyBDT05GSUdfUkZLSUxMX1JFR1VMQVRPUiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF85UCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NBSUYgaXMgbm90IHNldAojIENPTkZJR19ORkMgaXMgbm90IHNldAoj
IENPTkZJR19MV1RVTk5FTCBpcyBub3Qgc2V0CgojCiMgRGV2aWNlIERyaXZlcnMKIwoKIwojIEdl
bmVyaWMgRHJpdmVyIE9wdGlvbnMKIwojIENPTkZJR19VRVZFTlRfSEVMUEVSIGlzIG5vdCBzZXQK
Q09ORklHX0RFVlRNUEZTPXkKIyBDT05GSUdfREVWVE1QRlNfTU9VTlQgaXMgbm90IHNldAojIENP
TkZJR19TVEFOREFMT05FIGlzIG5vdCBzZXQKIyBDT05GSUdfUFJFVkVOVF9GSVJNV0FSRV9CVUlM
RCBpcyBub3Qgc2V0CkNPTkZJR19GV19MT0FERVI9eQojIENPTkZJR19GSVJNV0FSRV9JTl9LRVJO
RUwgaXMgbm90IHNldApDT05GSUdfRVhUUkFfRklSTVdBUkU9IiIKQ09ORklHX0ZXX0xPQURFUl9V
U0VSX0hFTFBFUj15CiMgQ09ORklHX0ZXX0xPQURFUl9VU0VSX0hFTFBFUl9GQUxMQkFDSyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0FMTE9XX0RFVl9DT1JFRFVNUCBpcyBub3Qgc2V0CiMgQ09ORklHX0RF
QlVHX0RSSVZFUiBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19ERVZSRVM9eQojIENPTkZJR19TWVNf
SFlQRVJWSVNPUiBpcyBub3Qgc2V0CiMgQ09ORklHX0dFTkVSSUNfQ1BVX0RFVklDRVMgaXMgbm90
IHNldApDT05GSUdfR0VORVJJQ19DUFVfQVVUT1BST0JFPXkKQ09ORklHX1JFR01BUD15CkNPTkZJ
R19SRUdNQVBfSTJDPXkKQ09ORklHX1JFR01BUF9TUE1JPW0KQ09ORklHX1JFR01BUF9NTUlPPXkK
Q09ORklHX1JFR01BUF9JUlE9eQojIENPTkZJR19ETUFfU0hBUkVEX0JVRkZFUiBpcyBub3Qgc2V0
CgojCiMgQnVzIGRldmljZXMKIwojIENPTkZJR19DT05ORUNUT1IgaXMgbm90IHNldAojIENPTkZJ
R19NVEQgaXMgbm90IHNldAojIENPTkZJR19PRiBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX01JR0hU
X0hBVkVfUENfUEFSUE9SVD15CiMgQ09ORklHX1BBUlBPUlQgaXMgbm90IHNldApDT05GSUdfUE5Q
PXkKQ09ORklHX1BOUF9ERUJVR19NRVNTQUdFUz15CgojCiMgUHJvdG9jb2xzCiMKQ09ORklHX0lT
QVBOUD15CkNPTkZJR19QTlBCSU9TPXkKIyBDT05GSUdfUE5QQklPU19QUk9DX0ZTIGlzIG5vdCBz
ZXQKQ09ORklHX1BOUEFDUEk9eQoKIwojIE1pc2MgZGV2aWNlcwojCiMgQ09ORklHX1NFTlNPUlNf
TElTM0xWMDJEIGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ1MjVYX0RQT1QgaXMgbm90IHNldApDT05G
SUdfRFVNTVlfSVJRPW0KIyBDT05GSUdfSUJNX0FTTSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIQU5U
T00gaXMgbm90IHNldAojIENPTkZJR19TR0lfSU9DNCBpcyBub3Qgc2V0CiMgQ09ORklHX1RJRk1f
Q09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX0lDUzkzMlM0MDEgaXMgbm90IHNldAojIENPTkZJR19F
TkNMT1NVUkVfU0VSVklDRVMgaXMgbm90IHNldAojIENPTkZJR19IUF9JTE8gaXMgbm90IHNldApD
T05GSUdfQVBEUzk4MDJBTFM9eQpDT05GSUdfSVNMMjkwMDM9eQpDT05GSUdfSVNMMjkwMjA9eQoj
IENPTkZJR19TRU5TT1JTX1RTTDI1NTAgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19CSDE3ODA9
eQpDT05GSUdfU0VOU09SU19CSDE3NzA9eQpDT05GSUdfU0VOU09SU19BUERTOTkwWD1tCiMgQ09O
RklHX0hNQzYzNTIgaXMgbm90IHNldAojIENPTkZJR19EUzE2ODIgaXMgbm90IHNldApDT05GSUdf
Qk1QMDg1PXkKQ09ORklHX0JNUDA4NV9JMkM9bQojIENPTkZJR19QQ0hfUEhVQiBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9TV0lUQ0hfRlNBOTQ4MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NSQU0gaXMg
bm90IHNldApDT05GSUdfQzJQT1JUPXkKQ09ORklHX0MyUE9SVF9EVVJBTUFSXzIxNTA9eQoKIwoj
IEVFUFJPTSBzdXBwb3J0CiMKQ09ORklHX0VFUFJPTV9BVDI0PXkKIyBDT05GSUdfRUVQUk9NX0xF
R0FDWSBpcyBub3Qgc2V0CiMgQ09ORklHX0VFUFJPTV9NQVg2ODc1IGlzIG5vdCBzZXQKQ09ORklH
X0VFUFJPTV85M0NYNj1tCiMgQ09ORklHX0NCNzEwX0NPUkUgaXMgbm90IHNldAoKIwojIFRleGFz
IEluc3RydW1lbnRzIHNoYXJlZCB0cmFuc3BvcnQgbGluZSBkaXNjaXBsaW5lCiMKIyBDT05GSUdf
VElfU1QgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xJUzNfSTJDIGlzIG5vdCBzZXQKCiMK
IyBBbHRlcmEgRlBHQSBmaXJtd2FyZSBkb3dubG9hZCBtb2R1bGUKIwojIENPTkZJR19BTFRFUkFf
U1RBUEwgaXMgbm90IHNldAojIENPTkZJR19WTVdBUkVfVk1DSSBpcyBub3Qgc2V0CgojCiMgSW50
ZWwgTUlDIEJ1cyBEcml2ZXIKIwoKIwojIFNDSUYgQnVzIERyaXZlcgojCgojCiMgSW50ZWwgTUlD
IEhvc3QgRHJpdmVyCiMKCiMKIyBJbnRlbCBNSUMgQ2FyZCBEcml2ZXIKIwoKIwojIFNDSUYgRHJp
dmVyCiMKCiMKIyBJbnRlbCBNSUMgQ29wcm9jZXNzb3IgU3RhdGUgTWFuYWdlbWVudCAoQ09TTSkg
RHJpdmVycwojCkNPTkZJR19FQ0hPPW0KIyBDT05GSUdfQ1hMX0JBU0UgaXMgbm90IHNldAojIENP
TkZJR19DWExfS0VSTkVMX0FQSSBpcyBub3Qgc2V0CiMgQ09ORklHX0NYTF9FRUggaXMgbm90IHNl
dApDT05GSUdfSEFWRV9JREU9eQoKIwojIFNDU0kgZGV2aWNlIHN1cHBvcnQKIwpDT05GSUdfU0NT
SV9NT0Q9eQojIENPTkZJR19TQ1NJX0RNQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfTkVUTElO
SyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZVU0lPTiBpcyBub3Qgc2V0CgojCiMgSUVFRSAxMzk0IChG
aXJlV2lyZSkgc3VwcG9ydAojCiMgQ09ORklHX0ZJUkVXSVJFIGlzIG5vdCBzZXQKIyBDT05GSUdf
RklSRVdJUkVfTk9TWSBpcyBub3Qgc2V0CiMgQ09ORklHX01BQ0lOVE9TSF9EUklWRVJTIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkVUREVWSUNFUyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZIT1NUX05FVCBp
cyBub3Qgc2V0CiMgQ09ORklHX1ZIT1NUX0NST1NTX0VORElBTl9MRUdBQ1kgaXMgbm90IHNldAoK
IwojIElucHV0IGRldmljZSBzdXBwb3J0CiMKQ09ORklHX0lOUFVUPXkKQ09ORklHX0lOUFVUX0xF
RFM9eQpDT05GSUdfSU5QVVRfRkZfTUVNTEVTUz15CkNPTkZJR19JTlBVVF9QT0xMREVWPXkKQ09O
RklHX0lOUFVUX1NQQVJTRUtNQVA9eQpDT05GSUdfSU5QVVRfTUFUUklYS01BUD15CgojCiMgVXNl
cmxhbmQgaW50ZXJmYWNlcwojCkNPTkZJR19JTlBVVF9NT1VTRURFVj1tCiMgQ09ORklHX0lOUFVU
X01PVVNFREVWX1BTQVVYIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX01PVVNFREVWX1NDUkVFTl9Y
PTEwMjQKQ09ORklHX0lOUFVUX01PVVNFREVWX1NDUkVFTl9ZPTc2OApDT05GSUdfSU5QVVRfSk9Z
REVWPW0KQ09ORklHX0lOUFVUX0VWREVWPW0KQ09ORklHX0lOUFVUX0VWQlVHPXkKCiMKIyBJbnB1
dCBEZXZpY2UgRHJpdmVycwojCkNPTkZJR19JTlBVVF9LRVlCT0FSRD15CiMgQ09ORklHX0tFWUJP
QVJEX0FEUDU1ODggaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9BRFA1NTg5IGlzIG5vdCBz
ZXQKQ09ORklHX0tFWUJPQVJEX0FUS0JEPXkKIyBDT05GSUdfS0VZQk9BUkRfUVQxMDcwIGlzIG5v
dCBzZXQKQ09ORklHX0tFWUJPQVJEX1FUMjE2MD15CkNPTkZJR19LRVlCT0FSRF9MS0tCRD1tCkNP
TkZJR19LRVlCT0FSRF9HUElPPW0KQ09ORklHX0tFWUJPQVJEX0dQSU9fUE9MTEVEPXkKIyBDT05G
SUdfS0VZQk9BUkRfVENBNjQxNiBpcyBub3Qgc2V0CkNPTkZJR19LRVlCT0FSRF9UQ0E4NDE4PW0K
IyBDT05GSUdfS0VZQk9BUkRfTUFUUklYIGlzIG5vdCBzZXQKQ09ORklHX0tFWUJPQVJEX0xNODMy
Mz15CkNPTkZJR19LRVlCT0FSRF9MTTgzMzM9eQpDT05GSUdfS0VZQk9BUkRfTUFYNzM1OT15CkNP
TkZJR19LRVlCT0FSRF9NQ1M9eQpDT05GSUdfS0VZQk9BUkRfTVBSMTIxPXkKQ09ORklHX0tFWUJP
QVJEX05FV1RPTj1tCiMgQ09ORklHX0tFWUJPQVJEX09QRU5DT1JFUyBpcyBub3Qgc2V0CkNPTkZJ
R19LRVlCT0FSRF9TVE9XQVdBWT1tCiMgQ09ORklHX0tFWUJPQVJEX1NVTktCRCBpcyBub3Qgc2V0
CkNPTkZJR19LRVlCT0FSRF9YVEtCRD15CkNPTkZJR19LRVlCT0FSRF9DUk9TX0VDPW0KQ09ORklH
X0lOUFVUX01PVVNFPXkKQ09ORklHX01PVVNFX1BTMj1tCiMgQ09ORklHX01PVVNFX1BTMl9BTFBT
IGlzIG5vdCBzZXQKIyBDT05GSUdfTU9VU0VfUFMyX0xPR0lQUzJQUCBpcyBub3Qgc2V0CkNPTkZJ
R19NT1VTRV9QUzJfU1lOQVBUSUNTPXkKQ09ORklHX01PVVNFX1BTMl9DWVBSRVNTPXkKQ09ORklH
X01PVVNFX1BTMl9UUkFDS1BPSU5UPXkKQ09ORklHX01PVVNFX1BTMl9FTEFOVEVDSD15CiMgQ09O
RklHX01PVVNFX1BTMl9TRU5URUxJQyBpcyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX1BTMl9UT1VD
SEtJVCBpcyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX1BTMl9GT0NBTFRFQ0ggaXMgbm90IHNldAoj
IENPTkZJR19NT1VTRV9QUzJfVk1NT1VTRSBpcyBub3Qgc2V0CkNPTkZJR19NT1VTRV9TRVJJQUw9
bQojIENPTkZJR19NT1VTRV9BUFBMRVRPVUNIIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9VU0VfQkNN
NTk3NCBpcyBub3Qgc2V0CkNPTkZJR19NT1VTRV9DWUFQQT1tCkNPTkZJR19NT1VTRV9FTEFOX0ky
Qz15CiMgQ09ORklHX01PVVNFX0VMQU5fSTJDX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01PVVNF
X0VMQU5fSTJDX1NNQlVTIGlzIG5vdCBzZXQKQ09ORklHX01PVVNFX0lOUE9SVD1tCiMgQ09ORklH
X01PVVNFX0FUSVhMIGlzIG5vdCBzZXQKQ09ORklHX01PVVNFX0xPR0lCTT1tCkNPTkZJR19NT1VT
RV9QQzExMFBBRD15CkNPTkZJR19NT1VTRV9WU1hYWEFBPW0KIyBDT05GSUdfTU9VU0VfR1BJTyBp
cyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX1NZTkFQVElDU19JMkMgaXMgbm90IHNldAojIENPTkZJ
R19NT1VTRV9TWU5BUFRJQ1NfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfSk9ZU1RJQ0sg
aXMgbm90IHNldApDT05GSUdfSU5QVVRfVEFCTEVUPXkKIyBDT05GSUdfVEFCTEVUX1VTQl9BQ0VD
QUQgaXMgbm90IHNldAojIENPTkZJR19UQUJMRVRfVVNCX0FJUFRFSyBpcyBub3Qgc2V0CiMgQ09O
RklHX1RBQkxFVF9VU0JfSEFOV0FORyBpcyBub3Qgc2V0CiMgQ09ORklHX1RBQkxFVF9VU0JfS0JU
QUIgaXMgbm90IHNldApDT05GSUdfVEFCTEVUX1NFUklBTF9XQUNPTTQ9eQojIENPTkZJR19JTlBV
VF9UT1VDSFNDUkVFTiBpcyBub3Qgc2V0CkNPTkZJR19JTlBVVF9NSVNDPXkKIyBDT05GSUdfSU5Q
VVRfODhQTTg2MFhfT05LRVkgaXMgbm90IHNldApDT05GSUdfSU5QVVRfQUQ3MTRYPW0KIyBDT05G
SUdfSU5QVVRfQUQ3MTRYX0kyQyBpcyBub3Qgc2V0CkNPTkZJR19JTlBVVF9CTUExNTA9bQojIENP
TkZJR19JTlBVVF9FM1gwX0JVVFRPTiBpcyBub3Qgc2V0CkNPTkZJR19JTlBVVF9NQVg3NzY5M19I
QVBUSUM9bQpDT05GSUdfSU5QVVRfTUFYODk5N19IQVBUSUM9eQpDT05GSUdfSU5QVVRfTUMxMzc4
M19QV1JCVVRUT049bQpDT05GSUdfSU5QVVRfTU1BODQ1MD1tCiMgQ09ORklHX0lOUFVUX01QVTMw
NTAgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9BUEFORUwgaXMgbm90IHNldApDT05GSUdfSU5Q
VVRfR1AyQT15CiMgQ09ORklHX0lOUFVUX0dQSU9fQkVFUEVSIGlzIG5vdCBzZXQKIyBDT05GSUdf
SU5QVVRfR1BJT19USUxUX1BPTExFRCBpcyBub3Qgc2V0CkNPTkZJR19JTlBVVF9XSVNUUk9OX0JU
TlM9eQojIENPTkZJR19JTlBVVF9BVExBU19CVE5TIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRf
QVRJX1JFTU9URTIgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9LRVlTUEFOX1JFTU9URSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lOUFVUX0tYVEo5IGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfUE9X
RVJNQVRFIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfWUVBTElOSyBpcyBub3Qgc2V0CiMgQ09O
RklHX0lOUFVUX0NNMTA5IGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX1JFR1VMQVRPUl9IQVBUSUM9
bQpDT05GSUdfSU5QVVRfUkVUVV9QV1JCVVRUT049bQojIENPTkZJR19JTlBVVF9BWFAyMFhfUEVL
IGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfVUlOUFVUIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVU
X1BDRjUwNjMzX1BNVT15CkNPTkZJR19JTlBVVF9QQ0Y4NTc0PXkKQ09ORklHX0lOUFVUX1BXTV9C
RUVQRVI9bQojIENPTkZJR19JTlBVVF9HUElPX1JPVEFSWV9FTkNPREVSIGlzIG5vdCBzZXQKIyBD
T05GSUdfSU5QVVRfREE5MDYzX09OS0VZIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX1dNODMxWF9P
Tj1tCkNPTkZJR19JTlBVVF9BRFhMMzRYPXkKQ09ORklHX0lOUFVUX0FEWEwzNFhfSTJDPW0KQ09O
RklHX0lOUFVUX0NNQTMwMDA9eQpDT05GSUdfSU5QVVRfQ01BMzAwMF9JMkM9eQpDT05GSUdfSU5Q
VVRfSURFQVBBRF9TTElERUJBUj15CkNPTkZJR19JTlBVVF9TT0NfQlVUVE9OX0FSUkFZPW0KQ09O
RklHX0lOUFVUX0RSVjI2MFhfSEFQVElDUz15CkNPTkZJR19JTlBVVF9EUlYyNjY1X0hBUFRJQ1M9
eQpDT05GSUdfSU5QVVRfRFJWMjY2N19IQVBUSUNTPXkKCiMKIyBIYXJkd2FyZSBJL08gcG9ydHMK
IwpDT05GSUdfU0VSSU89eQpDT05GSUdfQVJDSF9NSUdIVF9IQVZFX1BDX1NFUklPPXkKQ09ORklH
X1NFUklPX0k4MDQyPXkKQ09ORklHX1NFUklPX1NFUlBPUlQ9eQojIENPTkZJR19TRVJJT19DVDgy
QzcxMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklPX1BDSVBTMiBpcyBub3Qgc2V0CkNPTkZJR19T
RVJJT19MSUJQUzI9eQpDT05GSUdfU0VSSU9fUkFXPXkKIyBDT05GSUdfU0VSSU9fQUxURVJBX1BT
MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklPX1BTMk1VTFQgaXMgbm90IHNldAojIENPTkZJR19T
RVJJT19BUkNfUFMyIGlzIG5vdCBzZXQKQ09ORklHX1VTRVJJTz1tCkNPTkZJR19HQU1FUE9SVD15
CkNPTkZJR19HQU1FUE9SVF9OUzU1OD15CiMgQ09ORklHX0dBTUVQT1JUX0w0IGlzIG5vdCBzZXQK
IyBDT05GSUdfR0FNRVBPUlRfRU1VMTBLMSBpcyBub3Qgc2V0CiMgQ09ORklHX0dBTUVQT1JUX0ZN
ODAxIGlzIG5vdCBzZXQKCiMKIyBDaGFyYWN0ZXIgZGV2aWNlcwojCkNPTkZJR19UVFk9eQojIENP
TkZJR19WVCBpcyBub3Qgc2V0CkNPTkZJR19VTklYOThfUFRZUz15CiMgQ09ORklHX0RFVlBUU19N
VUxUSVBMRV9JTlNUQU5DRVMgaXMgbm90IHNldApDT05GSUdfTEVHQUNZX1BUWVM9eQpDT05GSUdf
TEVHQUNZX1BUWV9DT1VOVD0yNTYKIyBDT05GSUdfU0VSSUFMX05PTlNUQU5EQVJEIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTk9aT01JIGlzIG5vdCBzZXQKIyBDT05GSUdfTl9HU00gaXMgbm90IHNldAoj
IENPTkZJR19UUkFDRV9TSU5LIGlzIG5vdCBzZXQKIyBDT05GSUdfREVWTUVNIGlzIG5vdCBzZXQK
IyBDT05GSUdfREVWS01FTSBpcyBub3Qgc2V0CgojCiMgU2VyaWFsIGRyaXZlcnMKIwpDT05GSUdf
U0VSSUFMX0VBUkxZQ09OPXkKQ09ORklHX1NFUklBTF84MjUwPXkKQ09ORklHX1NFUklBTF84MjUw
X0RFUFJFQ0FURURfT1BUSU9OUz15CkNPTkZJR19TRVJJQUxfODI1MF9QTlA9eQpDT05GSUdfU0VS
SUFMXzgyNTBfQ09OU09MRT15CkNPTkZJR19TRVJJQUxfODI1MF9QQ0k9eQojIENPTkZJR19TRVJJ
QUxfODI1MF9DUyBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfODI1MF9OUl9VQVJUUz00CkNPTkZJ
R19TRVJJQUxfODI1MF9SVU5USU1FX1VBUlRTPTQKIyBDT05GSUdfU0VSSUFMXzgyNTBfRVhURU5E
RUQgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfODI1MF9GU0wgaXMgbm90IHNldAojIENPTkZJ
R19TRVJJQUxfODI1MF9EVyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF84MjUwX1JUMjg4WCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF84MjUwX0ZJTlRFSyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFUklBTF84MjUwX01JRCBpcyBub3Qgc2V0CgojCiMgTm9uLTgyNTAgc2VyaWFsIHBvcnQgc3Vw
cG9ydAojCiMgQ09ORklHX1NFUklBTF9VQVJUTElURSBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxf
Q09SRT15CkNPTkZJR19TRVJJQUxfQ09SRV9DT05TT0xFPXkKIyBDT05GSUdfU0VSSUFMX0pTTSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9TQ0NOWFAgaXMgbm90IHNldAojIENPTkZJR19TRVJJ
QUxfU0MxNklTN1hYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX1RJTUJFUkRBTEUgaXMgbm90
IHNldAojIENPTkZJR19TRVJJQUxfQUxURVJBX0pUQUdVQVJUIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VSSUFMX0FMVEVSQV9VQVJUIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX1BDSF9VQVJUIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0FSQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9S
UDIgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfRlNMX0xQVUFSVCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFUklBTF9NRU5fWjEzNSBpcyBub3Qgc2V0CiMgQ09ORklHX1RUWV9QUklOVEsgaXMgbm90
IHNldAojIENPTkZJR19WSVJUSU9fQ09OU09MRSBpcyBub3Qgc2V0CiMgQ09ORklHX0lQTUlfSEFO
RExFUiBpcyBub3Qgc2V0CkNPTkZJR19IV19SQU5ET009bQojIENPTkZJR19IV19SQU5ET01fVElN
RVJJT01FTSBpcyBub3Qgc2V0CkNPTkZJR19IV19SQU5ET01fSU5URUw9bQpDT05GSUdfSFdfUkFO
RE9NX0FNRD1tCkNPTkZJR19IV19SQU5ET01fR0VPREU9bQojIENPTkZJR19IV19SQU5ET01fVklB
IGlzIG5vdCBzZXQKQ09ORklHX0hXX1JBTkRPTV9WSVJUSU89bQpDT05GSUdfSFdfUkFORE9NX1RQ
TT1tCiMgQ09ORklHX05WUkFNIGlzIG5vdCBzZXQKIyBDT05GSUdfRFRMSyBpcyBub3Qgc2V0CiMg
Q09ORklHX1IzOTY0IGlzIG5vdCBzZXQKIyBDT05GSUdfQVBQTElDT00gaXMgbm90IHNldAojIENP
TkZJR19TT05ZUEkgaXMgbm90IHNldAoKIwojIFBDTUNJQSBjaGFyYWN0ZXIgZGV2aWNlcwojCiMg
Q09ORklHX1NZTkNMSU5LX0NTIGlzIG5vdCBzZXQKQ09ORklHX0NBUkRNQU5fNDAwMD1tCkNPTkZJ
R19DQVJETUFOXzQwNDA9bQojIENPTkZJR19NV0FWRSBpcyBub3Qgc2V0CkNPTkZJR19TQ3gyMDBf
R1BJTz1tCkNPTkZJR19QQzg3MzZ4X0dQSU89eQpDT05GSUdfTlNDX0dQSU89eQojIENPTkZJR19I
UEVUIGlzIG5vdCBzZXQKIyBDT05GSUdfSEFOR0NIRUNLX1RJTUVSIGlzIG5vdCBzZXQKQ09ORklH
X1RDR19UUE09bQojIENPTkZJR19UQ0dfVElTIGlzIG5vdCBzZXQKQ09ORklHX1RDR19USVNfSTJD
X0FUTUVMPW0KIyBDT05GSUdfVENHX1RJU19JMkNfSU5GSU5FT04gaXMgbm90IHNldApDT05GSUdf
VENHX1RJU19JMkNfTlVWT1RPTj1tCkNPTkZJR19UQ0dfTlNDPW0KQ09ORklHX1RDR19BVE1FTD1t
CiMgQ09ORklHX1RDR19JTkZJTkVPTiBpcyBub3Qgc2V0CiMgQ09ORklHX1RDR19DUkIgaXMgbm90
IHNldAojIENPTkZJR19UQ0dfVElTX1NUMzNaUDI0IGlzIG5vdCBzZXQKIyBDT05GSUdfVEVMQ0xP
Q0sgaXMgbm90IHNldApDT05GSUdfREVWUE9SVD15CiMgQ09ORklHX1hJTExZQlVTIGlzIG5vdCBz
ZXQKCiMKIyBJMkMgc3VwcG9ydAojCkNPTkZJR19JMkM9eQpDT05GSUdfQUNQSV9JMkNfT1BSRUdJ
T049eQpDT05GSUdfSTJDX0JPQVJESU5GTz15CkNPTkZJR19JMkNfQ09NUEFUPXkKIyBDT05GSUdf
STJDX0NIQVJERVYgaXMgbm90IHNldApDT05GSUdfSTJDX01VWD15CgojCiMgTXVsdGlwbGV4ZXIg
STJDIENoaXAgc3VwcG9ydAojCkNPTkZJR19JMkNfTVVYX0dQSU89bQojIENPTkZJR19JMkNfTVVY
X1BDQTk1NDEgaXMgbm90IHNldApDT05GSUdfSTJDX01VWF9QQ0E5NTR4PXkKQ09ORklHX0kyQ19N
VVhfUkVHPW0KIyBDT05GSUdfSTJDX0hFTFBFUl9BVVRPIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19T
TUJVUz15CgojCiMgSTJDIEFsZ29yaXRobXMKIwpDT05GSUdfSTJDX0FMR09CSVQ9eQpDT05GSUdf
STJDX0FMR09QQ0Y9eQpDT05GSUdfSTJDX0FMR09QQ0E9eQoKIwojIEkyQyBIYXJkd2FyZSBCdXMg
c3VwcG9ydAojCgojCiMgUEMgU01CdXMgaG9zdCBjb250cm9sbGVyIGRyaXZlcnMKIwojIENPTkZJ
R19JMkNfQUxJMTUzNSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19BTEkxNTYzIGlzIG5vdCBzZXQK
IyBDT05GSUdfSTJDX0FMSTE1WDMgaXMgbm90IHNldAojIENPTkZJR19JMkNfQU1ENzU2IGlzIG5v
dCBzZXQKIyBDT05GSUdfSTJDX0FNRDgxMTEgaXMgbm90IHNldAojIENPTkZJR19JMkNfSTgwMSBp
cyBub3Qgc2V0CiMgQ09ORklHX0kyQ19JU0NIIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0lTTVQg
aXMgbm90IHNldAojIENPTkZJR19JMkNfUElJWDQgaXMgbm90IHNldAojIENPTkZJR19JMkNfTkZP
UkNFMiBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19TSVM1NTk1IGlzIG5vdCBzZXQKIyBDT05GSUdf
STJDX1NJUzYzMCBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19TSVM5NlggaXMgbm90IHNldAojIENP
TkZJR19JMkNfVklBIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1ZJQVBSTyBpcyBub3Qgc2V0Cgoj
CiMgQUNQSSBkcml2ZXJzCiMKIyBDT05GSUdfSTJDX1NDTUkgaXMgbm90IHNldAoKIwojIEkyQyBz
eXN0ZW0gYnVzIGRyaXZlcnMgKG1vc3RseSBlbWJlZGRlZCAvIHN5c3RlbS1vbi1jaGlwKQojCiMg
Q09ORklHX0kyQ19DQlVTX0dQSU8gaXMgbm90IHNldAojIENPTkZJR19JMkNfREVTSUdOV0FSRV9Q
Q0kgaXMgbm90IHNldAojIENPTkZJR19JMkNfRUcyMFQgaXMgbm90IHNldAojIENPTkZJR19JMkNf
R1BJTyBpcyBub3Qgc2V0CkNPTkZJR19JMkNfS0VNUExEPXkKQ09ORklHX0kyQ19PQ09SRVM9eQpD
T05GSUdfSTJDX1BDQV9QTEFURk9STT15CiMgQ09ORklHX0kyQ19QWEFfUENJIGlzIG5vdCBzZXQK
Q09ORklHX0kyQ19TSU1URUM9bQojIENPTkZJR19JMkNfWElMSU5YIGlzIG5vdCBzZXQKCiMKIyBF
eHRlcm5hbCBJMkMvU01CdXMgYWRhcHRlciBkcml2ZXJzCiMKIyBDT05GSUdfSTJDX1BBUlBPUlRf
TElHSFQgaXMgbm90IHNldAojIENPTkZJR19JMkNfVEFPU19FVk0gaXMgbm90IHNldAoKIwojIE90
aGVyIEkyQy9TTUJ1cyBidXMgZHJpdmVycwojCkNPTkZJR19JMkNfUENBX0lTQT15CkNPTkZJR19J
MkNfQ1JPU19FQ19UVU5ORUw9bQojIENPTkZJR19TQ3gyMDBfQUNCIGlzIG5vdCBzZXQKQ09ORklH
X0kyQ19TVFVCPW0KQ09ORklHX0kyQ19TTEFWRT15CkNPTkZJR19JMkNfU0xBVkVfRUVQUk9NPXkK
IyBDT05GSUdfSTJDX0RFQlVHX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19JMkNfREVCVUdfQUxH
TyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19ERUJVR19CVVMgaXMgbm90IHNldAojIENPTkZJR19T
UEkgaXMgbm90IHNldApDT05GSUdfU1BNST1tCkNPTkZJR19IU0k9bQpDT05GSUdfSFNJX0JPQVJE
SU5GTz15CgojCiMgSFNJIGNvbnRyb2xsZXJzCiMKCiMKIyBIU0kgY2xpZW50cwojCkNPTkZJR19I
U0lfQ0hBUj1tCgojCiMgUFBTIHN1cHBvcnQKIwpDT05GSUdfUFBTPXkKIyBDT05GSUdfUFBTX0RF
QlVHIGlzIG5vdCBzZXQKCiMKIyBQUFMgY2xpZW50cyBzdXBwb3J0CiMKIyBDT05GSUdfUFBTX0NM
SUVOVF9LVElNRVIgaXMgbm90IHNldAojIENPTkZJR19QUFNfQ0xJRU5UX0xESVNDIGlzIG5vdCBz
ZXQKQ09ORklHX1BQU19DTElFTlRfR1BJTz15CgojCiMgUFBTIGdlbmVyYXRvcnMgc3VwcG9ydAoj
CgojCiMgUFRQIGNsb2NrIHN1cHBvcnQKIwojIENPTkZJR19QVFBfMTU4OF9DTE9DSyBpcyBub3Qg
c2V0CgojCiMgRW5hYmxlIFBIWUxJQiBhbmQgTkVUV09SS19QSFlfVElNRVNUQU1QSU5HIHRvIHNl
ZSB0aGUgYWRkaXRpb25hbCBjbG9ja3MuCiMKIyBDT05GSUdfUFRQXzE1ODhfQ0xPQ0tfUENIIGlz
IG5vdCBzZXQKQ09ORklHX0FSQ0hfV0FOVF9PUFRJT05BTF9HUElPTElCPXkKQ09ORklHX0dQSU9M
SUI9eQpDT05GSUdfR1BJT19ERVZSRVM9eQpDT05GSUdfR1BJT19BQ1BJPXkKQ09ORklHX0dQSU9M
SUJfSVJRQ0hJUD15CiMgQ09ORklHX0RFQlVHX0dQSU8gaXMgbm90IHNldAojIENPTkZJR19HUElP
X1NZU0ZTIGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fR0VORVJJQz15CkNPTkZJR19HUElPX01BWDcz
MFg9eQoKIwojIE1lbW9yeSBtYXBwZWQgR1BJTyBkcml2ZXJzCiMKIyBDT05GSUdfR1BJT19BTURQ
VCBpcyBub3Qgc2V0CkNPTkZJR19HUElPX0RXQVBCPXkKQ09ORklHX0dQSU9fR0VORVJJQ19QTEFU
Rk9STT15CiMgQ09ORklHX0dQSU9fSUNIIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19MWU5YUE9J
TlQgaXMgbm90IHNldAojIENPTkZJR19HUElPX1ZYODU1IGlzIG5vdCBzZXQKQ09ORklHX0dQSU9f
Wlg9eQoKIwojIFBvcnQtbWFwcGVkIEkvTyBHUElPIGRyaXZlcnMKIwpDT05GSUdfR1BJT18xMDRf
SURJT18xNj15CkNPTkZJR19HUElPX0Y3MTg4WD15CiMgQ09ORklHX0dQSU9fSVQ4NyBpcyBub3Qg
c2V0CiMgQ09ORklHX0dQSU9fU0NIIGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fU0NIMzExWD1tCgoj
CiMgSTJDIEdQSU8gZXhwYW5kZXJzCiMKQ09ORklHX0dQSU9fQURQNTU4OD15CiMgQ09ORklHX0dQ
SU9fQURQNTU4OF9JUlEgaXMgbm90IHNldApDT05GSUdfR1BJT19NQVg3MzAwPXkKQ09ORklHX0dQ
SU9fTUFYNzMyWD15CkNPTkZJR19HUElPX01BWDczMlhfSVJRPXkKQ09ORklHX0dQSU9fUENBOTUz
WD15CkNPTkZJR19HUElPX1BDQTk1M1hfSVJRPXkKIyBDT05GSUdfR1BJT19QQ0Y4NTdYIGlzIG5v
dCBzZXQKQ09ORklHX0dQSU9fU1gxNTBYPXkKCiMKIyBNRkQgR1BJTyBleHBhbmRlcnMKIwojIENP
TkZJR19HUElPX0NSWVNUQUxfQ09WRSBpcyBub3Qgc2V0CkNPTkZJR19HUElPX0tFTVBMRD15CkNP
TkZJR19HUElPX0xQMzk0Mz1tCiMgQ09ORklHX0dQSU9fVFBTNjU4NlggaXMgbm90IHNldApDT05G
SUdfR1BJT19XTTgzMVg9eQpDT05GSUdfR1BJT19XTTgzNTA9eQoKIwojIFBDSSBHUElPIGV4cGFu
ZGVycwojCiMgQ09ORklHX0dQSU9fQU1EODExMSBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fQlQ4
WFggaXMgbm90IHNldAojIENPTkZJR19HUElPX0lOVEVMX01JRCBpcyBub3Qgc2V0CiMgQ09ORklH
X0dQSU9fTUxfSU9IIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19QQ0ggaXMgbm90IHNldAojIENP
TkZJR19HUElPX1JEQzMyMVggaXMgbm90IHNldAoKIwojIFNQSSBvciBJMkMgR1BJTyBleHBhbmRl
cnMKIwojIENPTkZJR19HUElPX01DUDIzUzA4IGlzIG5vdCBzZXQKQ09ORklHX1cxPW0KCiMKIyAx
LXdpcmUgQnVzIE1hc3RlcnMKIwojIENPTkZJR19XMV9NQVNURVJfTUFUUk9YIGlzIG5vdCBzZXQK
Q09ORklHX1cxX01BU1RFUl9EUzI0ODI9bQojIENPTkZJR19XMV9NQVNURVJfRFMxV00gaXMgbm90
IHNldAojIENPTkZJR19XMV9NQVNURVJfR1BJTyBpcyBub3Qgc2V0CgojCiMgMS13aXJlIFNsYXZl
cwojCiMgQ09ORklHX1cxX1NMQVZFX1RIRVJNIGlzIG5vdCBzZXQKQ09ORklHX1cxX1NMQVZFX1NN
RU09bQpDT05GSUdfVzFfU0xBVkVfRFMyNDA4PW0KIyBDT05GSUdfVzFfU0xBVkVfRFMyNDA4X1JF
QURCQUNLIGlzIG5vdCBzZXQKQ09ORklHX1cxX1NMQVZFX0RTMjQxMz1tCkNPTkZJR19XMV9TTEFW
RV9EUzI0MDY9bQpDT05GSUdfVzFfU0xBVkVfRFMyNDIzPW0KIyBDT05GSUdfVzFfU0xBVkVfRFMy
NDMxIGlzIG5vdCBzZXQKIyBDT05GSUdfVzFfU0xBVkVfRFMyNDMzIGlzIG5vdCBzZXQKQ09ORklH
X1cxX1NMQVZFX0RTMjc2MD1tCkNPTkZJR19XMV9TTEFWRV9EUzI3ODA9bQpDT05GSUdfVzFfU0xB
VkVfRFMyNzgxPW0KQ09ORklHX1cxX1NMQVZFX0RTMjhFMDQ9bQpDT05GSUdfVzFfU0xBVkVfQlEy
NzAwMD1tCkNPTkZJR19QT1dFUl9TVVBQTFk9eQpDT05GSUdfUE9XRVJfU1VQUExZX0RFQlVHPXkK
IyBDT05GSUdfUERBX1BPV0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfR0VORVJJQ19BRENfQkFUVEVS
WSBpcyBub3Qgc2V0CkNPTkZJR19XTTgzMVhfQkFDS1VQPW0KIyBDT05GSUdfV004MzFYX1BPV0VS
IGlzIG5vdCBzZXQKIyBDT05GSUdfV004MzUwX1BPV0VSIGlzIG5vdCBzZXQKQ09ORklHX1RFU1Rf
UE9XRVI9eQpDT05GSUdfQkFUVEVSWV84OFBNODYwWD1tCiMgQ09ORklHX0JBVFRFUllfRFMyNzYw
IGlzIG5vdCBzZXQKQ09ORklHX0JBVFRFUllfRFMyNzgwPW0KQ09ORklHX0JBVFRFUllfRFMyNzgx
PW0KQ09ORklHX0JBVFRFUllfRFMyNzgyPXkKIyBDT05GSUdfQkFUVEVSWV9TQlMgaXMgbm90IHNl
dApDT05GSUdfQkFUVEVSWV9CUTI3WFhYPXkKIyBDT05GSUdfQkFUVEVSWV9CUTI3WFhYX0kyQyBp
cyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfQlEyN1hYWF9QTEFURk9STSBpcyBub3Qgc2V0CiMg
Q09ORklHX0JBVFRFUllfREE5MDMwIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9EQTkxNTAg
aXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX0RBOTE1MCBpcyBub3Qgc2V0CkNPTkZJR19BWFAy
ODhfRlVFTF9HQVVHRT1tCkNPTkZJR19CQVRURVJZX01BWDE3MDQwPW0KQ09ORklHX0JBVFRFUllf
TUFYMTcwNDI9eQpDT05GSUdfQ0hBUkdFUl84OFBNODYwWD1tCiMgQ09ORklHX0NIQVJHRVJfUENG
NTA2MzMgaXMgbm90IHNldApDT05GSUdfQ0hBUkdFUl9NQVg4OTAzPXkKIyBDT05GSUdfQ0hBUkdF
Ul9MUDg3MjcgaXMgbm90IHNldApDT05GSUdfQ0hBUkdFUl9MUDg3ODg9bQpDT05GSUdfQ0hBUkdF
Ul9HUElPPXkKIyBDT05GSUdfQ0hBUkdFUl9NQU5BR0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hB
UkdFUl9NQVgxNDU3NyBpcyBub3Qgc2V0CkNPTkZJR19DSEFSR0VSX01BWDc3NjkzPW0KQ09ORklH
X0NIQVJHRVJfTUFYODk5Nz1tCkNPTkZJR19DSEFSR0VSX0JRMjQxNVg9eQpDT05GSUdfQ0hBUkdF
Ul9CUTI0MTkwPW0KQ09ORklHX0NIQVJHRVJfQlEyNDI1Nz1tCkNPTkZJR19DSEFSR0VSX0JRMjQ3
MzU9bQpDT05GSUdfQ0hBUkdFUl9CUTI1ODkwPXkKQ09ORklHX0NIQVJHRVJfU01CMzQ3PXkKIyBD
T05GSUdfQkFUVEVSWV9HQVVHRV9MVEMyOTQxIGlzIG5vdCBzZXQKQ09ORklHX0NIQVJHRVJfUlQ5
NDU1PW0KQ09ORklHX0FYUDIwWF9QT1dFUj1tCiMgQ09ORklHX1BPV0VSX1JFU0VUIGlzIG5vdCBz
ZXQKQ09ORklHX1BPV0VSX0FWUz15CkNPTkZJR19IV01PTj15CkNPTkZJR19IV01PTl9WSUQ9eQoj
IENPTkZJR19IV01PTl9ERUJVR19DSElQIGlzIG5vdCBzZXQKCiMKIyBOYXRpdmUgZHJpdmVycwoj
CkNPTkZJR19TRU5TT1JTX0FENzQxND1tCiMgQ09ORklHX1NFTlNPUlNfQUQ3NDE4IGlzIG5vdCBz
ZXQKQ09ORklHX1NFTlNPUlNfQURNMTAyMT15CkNPTkZJR19TRU5TT1JTX0FETTEwMjU9bQojIENP
TkZJR19TRU5TT1JTX0FETTEwMjYgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FETTEwMjkg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FETTEwMzEgaXMgbm90IHNldAojIENPTkZJR19T
RU5TT1JTX0FETTkyNDAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FEVDc0MTAgaXMgbm90
IHNldApDT05GSUdfU0VOU09SU19BRFQ3NDExPW0KQ09ORklHX1NFTlNPUlNfQURUNzQ2Mj1tCkNP
TkZJR19TRU5TT1JTX0FEVDc0NzA9eQojIENPTkZJR19TRU5TT1JTX0FEVDc0NzUgaXMgbm90IHNl
dApDT05GSUdfU0VOU09SU19BU0M3NjIxPXkKIyBDT05GSUdfU0VOU09SU19LOFRFTVAgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX0sxMFRFTVAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X0ZBTTE1SF9QT1dFUiBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0FQUExFU01DPXkKQ09ORklH
X1NFTlNPUlNfQVNCMTAwPW0KIyBDT05GSUdfU0VOU09SU19BVFhQMSBpcyBub3Qgc2V0CkNPTkZJ
R19TRU5TT1JTX0RTNjIwPW0KQ09ORklHX1NFTlNPUlNfRFMxNjIxPXkKQ09ORklHX1NFTlNPUlNf
REVMTF9TTU09eQojIENPTkZJR19TRU5TT1JTX0k1S19BTUIgaXMgbm90IHNldApDT05GSUdfU0VO
U09SU19GNzE4MDVGPXkKQ09ORklHX1NFTlNPUlNfRjcxODgyRkc9bQpDT05GSUdfU0VOU09SU19G
NzUzNzVTPW0KQ09ORklHX1NFTlNPUlNfTUMxMzc4M19BREM9bQpDT05GSUdfU0VOU09SU19GU0NI
TUQ9eQojIENPTkZJR19TRU5TT1JTX0dMNTE4U00gaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X0dMNTIwU00gaXMgbm90IHNldApDT05GSUdfU0VOU09SU19HNzYwQT1tCkNPTkZJR19TRU5TT1JT
X0c3NjI9bQpDT05GSUdfU0VOU09SU19HUElPX0ZBTj15CkNPTkZJR19TRU5TT1JTX0hJSDYxMzA9
eQpDT05GSUdfU0VOU09SU19JSU9fSFdNT049bQojIENPTkZJR19TRU5TT1JTX0k1NTAwIGlzIG5v
dCBzZXQKQ09ORklHX1NFTlNPUlNfQ09SRVRFTVA9eQpDT05GSUdfU0VOU09SU19JVDg3PXkKIyBD
T05GSUdfU0VOU09SU19KQzQyIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfUE9XUjEyMjA9eQoj
IENPTkZJR19TRU5TT1JTX0xJTkVBR0UgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19MVEMyOTQ1
PW0KQ09ORklHX1NFTlNPUlNfTFRDNDE1MT15CkNPTkZJR19TRU5TT1JTX0xUQzQyMTU9bQojIENP
TkZJR19TRU5TT1JTX0xUQzQyMjIgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19MVEM0MjQ1PW0K
Q09ORklHX1NFTlNPUlNfTFRDNDI2MD1tCkNPTkZJR19TRU5TT1JTX0xUQzQyNjE9bQpDT05GSUdf
U0VOU09SU19NQVgxNjA2NT15CkNPTkZJR19TRU5TT1JTX01BWDE2MTk9eQpDT05GSUdfU0VOU09S
U19NQVgxNjY4PW0KQ09ORklHX1NFTlNPUlNfTUFYMTk3PXkKQ09ORklHX1NFTlNPUlNfTUFYNjYz
OT15CkNPTkZJR19TRU5TT1JTX01BWDY2NDI9bQojIENPTkZJR19TRU5TT1JTX01BWDY2NTAgaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX01BWDY2OTcgaXMgbm90IHNldAojIENPTkZJR19TRU5T
T1JTX01BWDMxNzkwIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfSFRVMjE9eQpDT05GSUdfU0VO
U09SU19NQ1AzMDIxPXkKQ09ORklHX1NFTlNPUlNfTUVORjIxQk1DX0hXTU9OPW0KQ09ORklHX1NF
TlNPUlNfTE02Mz15CiMgQ09ORklHX1NFTlNPUlNfTE03MyBpcyBub3Qgc2V0CkNPTkZJR19TRU5T
T1JTX0xNNzU9bQpDT05GSUdfU0VOU09SU19MTTc3PW0KIyBDT05GSUdfU0VOU09SU19MTTc4IGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MTTgwIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNf
TE04Mz1tCkNPTkZJR19TRU5TT1JTX0xNODU9eQojIENPTkZJR19TRU5TT1JTX0xNODcgaXMgbm90
IHNldApDT05GSUdfU0VOU09SU19MTTkwPXkKQ09ORklHX1NFTlNPUlNfTE05Mj1tCiMgQ09ORklH
X1NFTlNPUlNfTE05MyBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0xNOTUyMzQ9eQojIENPTkZJ
R19TRU5TT1JTX0xNOTUyNDEgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19MTTk1MjQ1PW0KIyBD
T05GSUdfU0VOU09SU19QQzg3MzYwIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfUEM4NzQyNz15
CiMgQ09ORklHX1NFTlNPUlNfTlRDX1RIRVJNSVNUT1IgaXMgbm90IHNldAojIENPTkZJR19TRU5T
T1JTX05DVDY2ODMgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19OQ1Q2Nzc1PW0KQ09ORklHX1NF
TlNPUlNfTkNUNzgwMj15CiMgQ09ORklHX1NFTlNPUlNfTkNUNzkwNCBpcyBub3Qgc2V0CkNPTkZJ
R19TRU5TT1JTX1BDRjg1OTE9bQpDT05GSUdfUE1CVVM9eQojIENPTkZJR19TRU5TT1JTX1BNQlVT
IGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfQURNMTI3NT15CkNPTkZJR19TRU5TT1JTX0xNMjUw
NjY9bQpDT05GSUdfU0VOU09SU19MVEMyOTc4PW0KQ09ORklHX1NFTlNPUlNfTFRDMjk3OF9SRUdV
TEFUT1I9eQpDT05GSUdfU0VOU09SU19NQVgxNjA2ND15CkNPTkZJR19TRU5TT1JTX01BWDIwNzUx
PW0KQ09ORklHX1NFTlNPUlNfTUFYMzQ0NDA9eQojIENPTkZJR19TRU5TT1JTX01BWDg2ODggaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX1RQUzQwNDIyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19VQ0Q5MDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19VQ0Q5MjAwIGlzIG5vdCBz
ZXQKQ09ORklHX1NFTlNPUlNfWkw2MTAwPXkKQ09ORklHX1NFTlNPUlNfU0hUMTU9bQpDT05GSUdf
U0VOU09SU19TSFQyMT15CkNPTkZJR19TRU5TT1JTX1NIVEMxPW0KIyBDT05GSUdfU0VOU09SU19T
SVM1NTk1IGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfRE1FMTczNz1tCkNPTkZJR19TRU5TT1JT
X0VNQzE0MDM9eQpDT05GSUdfU0VOU09SU19FTUMyMTAzPW0KIyBDT05GSUdfU0VOU09SU19FTUM2
VzIwMSBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX1NNU0M0N00xPXkKIyBDT05GSUdfU0VOU09S
U19TTVNDNDdNMTkyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19TTVNDNDdCMzk3IGlzIG5v
dCBzZXQKIyBDT05GSUdfU0VOU09SU19TQ0g1NlhYX0NPTU1PTiBpcyBub3Qgc2V0CkNPTkZJR19T
RU5TT1JTX1NNTTY2NT1tCkNPTkZJR19TRU5TT1JTX0FEQzEyOEQ4MTg9bQpDT05GSUdfU0VOU09S
U19BRFMxMDE1PXkKQ09ORklHX1NFTlNPUlNfQURTNzgyOD1tCkNPTkZJR19TRU5TT1JTX0FNQzY4
MjE9bQpDT05GSUdfU0VOU09SU19JTkEyMDk9eQpDT05GSUdfU0VOU09SU19JTkEyWFg9bQojIENP
TkZJR19TRU5TT1JTX1RDNzQgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19USE1DNTA9bQpDT05G
SUdfU0VOU09SU19UTVAxMDI9bQpDT05GSUdfU0VOU09SU19UTVAxMDM9bQojIENPTkZJR19TRU5T
T1JTX1RNUDQwMSBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX1RNUDQyMT15CkNPTkZJR19TRU5T
T1JTX1ZJQV9DUFVURU1QPW0KIyBDT05GSUdfU0VOU09SU19WSUE2ODZBIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19WVDEyMTEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1ZUODIzMSBp
cyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX1c4Mzc4MUQ9bQpDT05GSUdfU0VOU09SU19XODM3OTFE
PW0KIyBDT05GSUdfU0VOU09SU19XODM3OTJEIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19X
ODM3OTMgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19XODM3OTU9eQojIENPTkZJR19TRU5TT1JT
X1c4Mzc5NV9GQU5DVFJMIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfVzgzTDc4NVRTPXkKQ09O
RklHX1NFTlNPUlNfVzgzTDc4Nk5HPXkKIyBDT05GSUdfU0VOU09SU19XODM2MjdIRiBpcyBub3Qg
c2V0CkNPTkZJR19TRU5TT1JTX1c4MzYyN0VIRj15CkNPTkZJR19TRU5TT1JTX1dNODMxWD15CiMg
Q09ORklHX1NFTlNPUlNfV004MzUwIGlzIG5vdCBzZXQKCiMKIyBBQ1BJIGRyaXZlcnMKIwojIENP
TkZJR19TRU5TT1JTX0FDUElfUE9XRVIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FUSzAx
MTAgaXMgbm90IHNldApDT05GSUdfVEhFUk1BTD15CkNPTkZJR19USEVSTUFMX0hXTU9OPXkKQ09O
RklHX1RIRVJNQUxfV1JJVEFCTEVfVFJJUFM9eQojIENPTkZJR19USEVSTUFMX0RFRkFVTFRfR09W
X1NURVBfV0lTRSBpcyBub3Qgc2V0CkNPTkZJR19USEVSTUFMX0RFRkFVTFRfR09WX0ZBSVJfU0hB
UkU9eQojIENPTkZJR19USEVSTUFMX0RFRkFVTFRfR09WX1VTRVJfU1BBQ0UgaXMgbm90IHNldAoj
IENPTkZJR19USEVSTUFMX0RFRkFVTFRfR09WX1BPV0VSX0FMTE9DQVRPUiBpcyBub3Qgc2V0CkNP
TkZJR19USEVSTUFMX0dPVl9GQUlSX1NIQVJFPXkKIyBDT05GSUdfVEhFUk1BTF9HT1ZfU1RFUF9X
SVNFIGlzIG5vdCBzZXQKQ09ORklHX1RIRVJNQUxfR09WX0JBTkdfQkFORz15CkNPTkZJR19USEVS
TUFMX0dPVl9VU0VSX1NQQUNFPXkKQ09ORklHX1RIRVJNQUxfR09WX1BPV0VSX0FMTE9DQVRPUj15
CiMgQ09ORklHX1RIRVJNQUxfRU1VTEFUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfUE9X
RVJDTEFNUCBpcyBub3Qgc2V0CkNPTkZJR19YODZfUEtHX1RFTVBfVEhFUk1BTD1tCkNPTkZJR19J
TlRFTF9TT0NfRFRTX0lPU0ZfQ09SRT15CkNPTkZJR19JTlRFTF9TT0NfRFRTX1RIRVJNQUw9eQoj
IENPTkZJR19JTlQzNDBYX1RIRVJNQUwgaXMgbm90IHNldAojIENPTkZJR19JTlRFTF9QQ0hfVEhF
Uk1BTCBpcyBub3Qgc2V0CiMgQ09ORklHX1dBVENIRE9HIGlzIG5vdCBzZXQKQ09ORklHX1NTQl9Q
T1NTSUJMRT15CgojCiMgU29uaWNzIFNpbGljb24gQmFja3BsYW5lCiMKIyBDT05GSUdfU1NCIGlz
IG5vdCBzZXQKQ09ORklHX0JDTUFfUE9TU0lCTEU9eQoKIwojIEJyb2FkY29tIHNwZWNpZmljIEFN
QkEKIwpDT05GSUdfQkNNQT1tCkNPTkZJR19CQ01BX0hPU1RfUENJX1BPU1NJQkxFPXkKQ09ORklH
X0JDTUFfSE9TVF9QQ0k9eQojIENPTkZJR19CQ01BX0hPU1RfU09DIGlzIG5vdCBzZXQKQ09ORklH
X0JDTUFfRFJJVkVSX1BDST15CiMgQ09ORklHX0JDTUFfRFJJVkVSX0dNQUNfQ01OIGlzIG5vdCBz
ZXQKQ09ORklHX0JDTUFfRFJJVkVSX0dQSU89eQpDT05GSUdfQkNNQV9ERUJVRz15CgojCiMgTXVs
dGlmdW5jdGlvbiBkZXZpY2UgZHJpdmVycwojCkNPTkZJR19NRkRfQ09SRT15CiMgQ09ORklHX01G
RF9DUzU1MzUgaXMgbm90IHNldAojIENPTkZJR19NRkRfQVMzNzExIGlzIG5vdCBzZXQKIyBDT05G
SUdfUE1JQ19BRFA1NTIwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0FBVDI4NzBfQ09SRSBpcyBu
b3Qgc2V0CkNPTkZJR19NRkRfQkNNNTkwWFg9eQpDT05GSUdfTUZEX0FYUDIwWD15CkNPTkZJR19N
RkRfQ1JPU19FQz1tCkNPTkZJR19NRkRfQ1JPU19FQ19JMkM9bQpDT05GSUdfUE1JQ19EQTkwM1g9
eQojIENPTkZJR19NRkRfREE5MDUyX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9EQTkwNTUg
aXMgbm90IHNldAojIENPTkZJR19NRkRfREE5MDYyIGlzIG5vdCBzZXQKQ09ORklHX01GRF9EQTkw
NjM9eQpDT05GSUdfTUZEX0RBOTE1MD1tCkNPTkZJR19NRkRfTUMxM1hYWD1tCkNPTkZJR19NRkRf
TUMxM1hYWF9JMkM9bQpDT05GSUdfSFRDX1BBU0lDMz15CiMgQ09ORklHX0hUQ19JMkNQTEQgaXMg
bm90IHNldAojIENPTkZJR19MUENfSUNIIGlzIG5vdCBzZXQKIyBDT05GSUdfTFBDX1NDSCBpcyBu
b3Qgc2V0CkNPTkZJR19JTlRFTF9TT0NfUE1JQz15CiMgQ09ORklHX01GRF9JTlRFTF9MUFNTX0FD
UEkgaXMgbm90IHNldAojIENPTkZJR19NRkRfSU5URUxfTFBTU19QQ0kgaXMgbm90IHNldAojIENP
TkZJR19NRkRfSkFOWl9DTU9ESU8gaXMgbm90IHNldApDT05GSUdfTUZEX0tFTVBMRD15CiMgQ09O
RklHX01GRF84OFBNODAwIGlzIG5vdCBzZXQKQ09ORklHX01GRF84OFBNODA1PW0KQ09ORklHX01G
RF84OFBNODYwWD15CkNPTkZJR19NRkRfTUFYMTQ1Nzc9eQpDT05GSUdfTUZEX01BWDc3NjkzPXkK
IyBDT05GSUdfTUZEX01BWDc3ODQzIGlzIG5vdCBzZXQKQ09ORklHX01GRF9NQVg4OTA3PW0KIyBD
T05GSUdfTUZEX01BWDg5MjUgaXMgbm90IHNldApDT05GSUdfTUZEX01BWDg5OTc9eQojIENPTkZJ
R19NRkRfTUFYODk5OCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NVDYzOTcgaXMgbm90IHNldApD
T05GSUdfTUZEX01FTkYyMUJNQz1tCkNPTkZJR19NRkRfUkVUVT15CkNPTkZJR19NRkRfUENGNTA2
MzM9eQojIENPTkZJR19QQ0Y1MDYzM19BREMgaXMgbm90IHNldApDT05GSUdfUENGNTA2MzNfR1BJ
Tz1tCiMgQ09ORklHX01GRF9SREMzMjFYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1JUU1hfUENJ
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1JUNTAzMyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9S
QzVUNTgzIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1JONVQ2MTggaXMgbm90IHNldAojIENPTkZJ
R19NRkRfU0VDX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19NRkRfU0k0NzZYX0NPUkUgaXMgbm90
IHNldAojIENPTkZJR19NRkRfU001MDEgaXMgbm90IHNldAojIENPTkZJR19NRkRfU0tZODE0NTIg
aXMgbm90IHNldApDT05GSUdfTUZEX1NNU0M9eQpDT05GSUdfQUJYNTAwX0NPUkU9eQpDT05GSUdf
QUIzMTAwX0NPUkU9eQpDT05GSUdfQUIzMTAwX09UUD15CkNPTkZJR19NRkRfU1lTQ09OPXkKIyBD
T05GSUdfTUZEX1RJX0FNMzM1WF9UU0NBREMgaXMgbm90IHNldApDT05GSUdfTUZEX0xQMzk0Mz1t
CkNPTkZJR19NRkRfTFA4Nzg4PXkKIyBDT05GSUdfTUZEX1BBTE1BUyBpcyBub3Qgc2V0CkNPTkZJ
R19UUFM2MTA1WD15CiMgQ09ORklHX1RQUzY1MDEwIGlzIG5vdCBzZXQKIyBDT05GSUdfVFBTNjUw
N1ggaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjUwOTAgaXMgbm90IHNldAojIENPTkZJR19N
RkRfVFBTNjUyMTcgaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjUyMTggaXMgbm90IHNldApD
T05GSUdfTUZEX1RQUzY1ODZYPXkKIyBDT05GSUdfTUZEX1RQUzY1OTEwIGlzIG5vdCBzZXQKIyBD
T05GSUdfTUZEX1RQUzY1OTEyIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RQUzY1OTEyX0kyQyBp
cyBub3Qgc2V0CiMgQ09ORklHX01GRF9UUFM4MDAzMSBpcyBub3Qgc2V0CiMgQ09ORklHX1RXTDQw
MzBfQ09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RXTDYwNDBfQ09SRSBpcyBub3Qgc2V0CkNPTkZJ
R19NRkRfV0wxMjczX0NPUkU9eQpDT05GSUdfTUZEX0xNMzUzMz15CiMgQ09ORklHX01GRF9USU1C
RVJEQUxFIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RNSU8gaXMgbm90IHNldAojIENPTkZJR19N
RkRfVlg4NTUgaXMgbm90IHNldAojIENPTkZJR19NRkRfQVJJWk9OQV9JMkMgaXMgbm90IHNldAoj
IENPTkZJR19NRkRfV004NDAwIGlzIG5vdCBzZXQKQ09ORklHX01GRF9XTTgzMVg9eQpDT05GSUdf
TUZEX1dNODMxWF9JMkM9eQpDT05GSUdfTUZEX1dNODM1MD15CkNPTkZJR19NRkRfV004MzUwX0ky
Qz15CiMgQ09ORklHX01GRF9XTTg5OTQgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SPXkKQ09O
RklHX1JFR1VMQVRPUl9ERUJVRz15CkNPTkZJR19SRUdVTEFUT1JfRklYRURfVk9MVEFHRT15CkNP
TkZJR19SRUdVTEFUT1JfVklSVFVBTF9DT05TVU1FUj1tCkNPTkZJR19SRUdVTEFUT1JfVVNFUlNQ
QUNFX0NPTlNVTUVSPXkKQ09ORklHX1JFR1VMQVRPUl84OFBNODYwNz1tCkNPTkZJR19SRUdVTEFU
T1JfQUNUODg2NT15CkNPTkZJR19SRUdVTEFUT1JfQUQ1Mzk4PW0KIyBDT05GSUdfUkVHVUxBVE9S
X0FOQVRPUCBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfQUIzMTAwPW0KQ09ORklHX1JFR1VM
QVRPUl9BWFAyMFg9bQpDT05GSUdfUkVHVUxBVE9SX0JDTTU5MFhYPXkKQ09ORklHX1JFR1VMQVRP
Ul9EQTkwM1g9eQojIENPTkZJR19SRUdVTEFUT1JfREE5MDYzIGlzIG5vdCBzZXQKQ09ORklHX1JF
R1VMQVRPUl9EQTkyMTA9eQpDT05GSUdfUkVHVUxBVE9SX0RBOTIxMT15CkNPTkZJR19SRUdVTEFU
T1JfRkFONTM1NTU9eQpDT05GSUdfUkVHVUxBVE9SX0dQSU89eQpDT05GSUdfUkVHVUxBVE9SX0lT
TDkzMDU9bQpDT05GSUdfUkVHVUxBVE9SX0lTTDYyNzFBPW0KQ09ORklHX1JFR1VMQVRPUl9MUDM5
NzE9bQojIENPTkZJR19SRUdVTEFUT1JfTFAzOTcyIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxB
VE9SX0xQODcyWCBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfTFA4NzU1PXkKQ09ORklHX1JF
R1VMQVRPUl9MUDg3ODg9bQpDT05GSUdfUkVHVUxBVE9SX0xUQzM1ODk9eQpDT05GSUdfUkVHVUxB
VE9SX01BWDE0NTc3PXkKQ09ORklHX1JFR1VMQVRPUl9NQVgxNTg2PW0KQ09ORklHX1JFR1VMQVRP
Ul9NQVg4NjQ5PW0KQ09ORklHX1JFR1VMQVRPUl9NQVg4NjYwPW0KQ09ORklHX1JFR1VMQVRPUl9N
QVg4OTA3PW0KIyBDT05GSUdfUkVHVUxBVE9SX01BWDg5NTIgaXMgbm90IHNldApDT05GSUdfUkVH
VUxBVE9SX01BWDg5NzM9eQpDT05GSUdfUkVHVUxBVE9SX01BWDg5OTc9eQpDT05GSUdfUkVHVUxB
VE9SX01BWDc3NjkzPXkKQ09ORklHX1JFR1VMQVRPUl9NQzEzWFhYX0NPUkU9bQpDT05GSUdfUkVH
VUxBVE9SX01DMTM3ODM9bQpDT05GSUdfUkVHVUxBVE9SX01DMTM4OTI9bQpDT05GSUdfUkVHVUxB
VE9SX01UNjMxMT1tCiMgQ09ORklHX1JFR1VMQVRPUl9QQ0Y1MDYzMyBpcyBub3Qgc2V0CiMgQ09O
RklHX1JFR1VMQVRPUl9QRlVaRTEwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9QV00g
aXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfUUNPTV9TUE1JIGlzIG5vdCBzZXQKQ09ORklH
X1JFR1VMQVRPUl9UUFM1MTYzMj15CiMgQ09ORklHX1JFR1VMQVRPUl9UUFM2MTA1WCBpcyBub3Qg
c2V0CkNPTkZJR19SRUdVTEFUT1JfVFBTNjIzNjA9bQpDT05GSUdfUkVHVUxBVE9SX1RQUzY1MDIz
PW0KQ09ORklHX1JFR1VMQVRPUl9UUFM2NTA3WD1tCkNPTkZJR19SRUdVTEFUT1JfVFBTNjU4Nlg9
bQpDT05GSUdfUkVHVUxBVE9SX1dNODMxWD1tCkNPTkZJR19SRUdVTEFUT1JfV004MzUwPW0KQ09O
RklHX01FRElBX1NVUFBPUlQ9eQoKIwojIE11bHRpbWVkaWEgY29yZSBzdXBwb3J0CiMKIyBDT05G
SUdfTUVESUFfQ0FNRVJBX1NVUFBPUlQgaXMgbm90IHNldAojIENPTkZJR19NRURJQV9BTkFMT0df
VFZfU1VQUE9SVCBpcyBub3Qgc2V0CkNPTkZJR19NRURJQV9ESUdJVEFMX1RWX1NVUFBPUlQ9eQpD
T05GSUdfTUVESUFfUkFESU9fU1VQUE9SVD15CkNPTkZJR19NRURJQV9TRFJfU1VQUE9SVD15CkNP
TkZJR19NRURJQV9SQ19TVVBQT1JUPXkKIyBDT05GSUdfTUVESUFfQ09OVFJPTExFUiBpcyBub3Qg
c2V0CkNPTkZJR19WSURFT19ERVY9eQpDT05GSUdfVklERU9fVjRMMj15CiMgQ09ORklHX1ZJREVP
X0FEVl9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19WSURFT19GSVhFRF9NSU5PUl9SQU5HRVM9eQpD
T05GSUdfRFZCX0NPUkU9eQojIENPTkZJR19UVFBDSV9FRVBST00gaXMgbm90IHNldApDT05GSUdf
RFZCX01BWF9BREFQVEVSUz04CiMgQ09ORklHX0RWQl9EWU5BTUlDX01JTk9SUyBpcyBub3Qgc2V0
CgojCiMgTWVkaWEgZHJpdmVycwojCkNPTkZJR19SQ19DT1JFPXkKQ09ORklHX1JDX01BUD1tCiMg
Q09ORklHX1JDX0RFQ09ERVJTIGlzIG5vdCBzZXQKIyBDT05GSUdfUkNfREVWSUNFUyBpcyBub3Qg
c2V0CiMgQ09ORklHX01FRElBX1BDSV9TVVBQT1JUIGlzIG5vdCBzZXQKQ09ORklHX0RWQl9QTEFU
Rk9STV9EUklWRVJTPXkKCiMKIyBTdXBwb3J0ZWQgTU1DL1NESU8gYWRhcHRlcnMKIwojIENPTkZJ
R19TTVNfU0RJT19EUlYgaXMgbm90IHNldApDT05GSUdfUkFESU9fQURBUFRFUlM9eQpDT05GSUdf
UkFESU9fU0k0NzBYPXkKIyBDT05GSUdfSTJDX1NJNDcwWCBpcyBub3Qgc2V0CkNPTkZJR19SQURJ
T19TSTQ3MTM9bQojIENPTkZJR19QTEFURk9STV9TSTQ3MTMgaXMgbm90IHNldApDT05GSUdfSTJD
X1NJNDcxMz1tCiMgQ09ORklHX1JBRElPX01BWElSQURJTyBpcyBub3Qgc2V0CkNPTkZJR19SQURJ
T19URUE1NzY0PXkKQ09ORklHX1JBRElPX1RFQTU3NjRfWFRBTD15CkNPTkZJR19SQURJT19TQUE3
NzA2SD15CkNPTkZJR19SQURJT19URUY2ODYyPXkKIyBDT05GSUdfUkFESU9fV0wxMjczIGlzIG5v
dCBzZXQKCiMKIyBUZXhhcyBJbnN0cnVtZW50cyBXTDEyOHggRk0gZHJpdmVyIChTVCBiYXNlZCkK
IwpDT05GSUdfVjRMX1JBRElPX0lTQV9EUklWRVJTPXkKQ09ORklHX1JBRElPX0lTQT15CiMgQ09O
RklHX1JBRElPX0NBREVUIGlzIG5vdCBzZXQKQ09ORklHX1JBRElPX1JUUkFDSz15CkNPTkZJR19S
QURJT19SVFJBQ0tfUE9SVD0zMGYKQ09ORklHX1JBRElPX1JUUkFDSzI9bQojIENPTkZJR19SQURJ
T19BWlRFQ0ggaXMgbm90IHNldApDT05GSUdfUkFESU9fR0VNVEVLPXkKQ09ORklHX1JBRElPX0dF
TVRFS19QT1JUPTM0YwpDT05GSUdfUkFESU9fR0VNVEVLX1BST0JFPXkKQ09ORklHX1JBRElPX01J
Uk9QQ00yMD1tCkNPTkZJR19SQURJT19TRjE2Rk1JPW0KIyBDT05GSUdfUkFESU9fU0YxNkZNUjIg
aXMgbm90IHNldAojIENPTkZJR19SQURJT19URVJSQVRFQyBpcyBub3Qgc2V0CkNPTkZJR19SQURJ
T19UUlVTVD1tCiMgQ09ORklHX1JBRElPX1RZUEhPT04gaXMgbm90IHNldApDT05GSUdfUkFESU9f
Wk9MVFJJWD1tCgojCiMgTWVkaWEgYW5jaWxsYXJ5IGRyaXZlcnMgKHR1bmVycywgc2Vuc29ycywg
aTJjLCBmcm9udGVuZHMpCiMKQ09ORklHX01FRElBX1NVQkRSVl9BVVRPU0VMRUNUPXkKQ09ORklH
X01FRElBX0FUVEFDSD15CkNPTkZJR19WSURFT19JUl9JMkM9eQoKIwojIEF1ZGlvIGRlY29kZXJz
LCBwcm9jZXNzb3JzIGFuZCBtaXhlcnMKIwoKIwojIFJEUyBkZWNvZGVycwojCgojCiMgVmlkZW8g
ZGVjb2RlcnMKIwoKIwojIFZpZGVvIGFuZCBhdWRpbyBkZWNvZGVycwojCgojCiMgVmlkZW8gZW5j
b2RlcnMKIwoKIwojIENhbWVyYSBzZW5zb3IgZGV2aWNlcwojCgojCiMgRmxhc2ggZGV2aWNlcwoj
CgojCiMgVmlkZW8gaW1wcm92ZW1lbnQgY2hpcHMKIwoKIwojIEF1ZGlvL1ZpZGVvIGNvbXByZXNz
aW9uIGNoaXBzCiMKCiMKIyBNaXNjZWxsYW5lb3VzIGhlbHBlciBjaGlwcwojCgojCiMgU2Vuc29y
cyB1c2VkIG9uIHNvY19jYW1lcmEgZHJpdmVyCiMKQ09ORklHX01FRElBX1RVTkVSPXkKQ09ORklH
X01FRElBX1RVTkVSX1NJTVBMRT15CkNPTkZJR19NRURJQV9UVU5FUl9UREE4MjkwPXkKQ09ORklH
X01FRElBX1RVTkVSX1REQTgyN1g9eQpDT05GSUdfTUVESUFfVFVORVJfVERBMTgyNzE9eQpDT05G
SUdfTUVESUFfVFVORVJfVERBOTg4Nz15CkNPTkZJR19NRURJQV9UVU5FUl9URUE1NzYxPXkKQ09O
RklHX01FRElBX1RVTkVSX1RFQTU3Njc9eQpDT05GSUdfTUVESUFfVFVORVJfTVQyMFhYPXkKQ09O
RklHX01FRElBX1RVTkVSX1hDMjAyOD15CkNPTkZJR19NRURJQV9UVU5FUl9YQzUwMDA9eQpDT05G
SUdfTUVESUFfVFVORVJfWEM0MDAwPXkKQ09ORklHX01FRElBX1RVTkVSX01DNDRTODAzPXkKCiMK
IyBNdWx0aXN0YW5kYXJkIChzYXRlbGxpdGUpIGZyb250ZW5kcwojCgojCiMgTXVsdGlzdGFuZGFy
ZCAoY2FibGUgKyB0ZXJyZXN0cmlhbCkgZnJvbnRlbmRzCiMKCiMKIyBEVkItUyAoc2F0ZWxsaXRl
KSBmcm9udGVuZHMKIwoKIwojIERWQi1UICh0ZXJyZXN0cmlhbCkgZnJvbnRlbmRzCiMKIyBDT05G
SUdfRFZCX0FTMTAyX0ZFIGlzIG5vdCBzZXQKCiMKIyBEVkItQyAoY2FibGUpIGZyb250ZW5kcwoj
CgojCiMgQVRTQyAoTm9ydGggQW1lcmljYW4vS29yZWFuIFRlcnJlc3RyaWFsL0NhYmxlIERUVikg
ZnJvbnRlbmRzCiMKCiMKIyBJU0RCLVQgKHRlcnJlc3RyaWFsKSBmcm9udGVuZHMKIwoKIwojIElT
REItUyAoc2F0ZWxsaXRlKSAmIElTREItVCAodGVycmVzdHJpYWwpIGZyb250ZW5kcwojCgojCiMg
RGlnaXRhbCB0ZXJyZXN0cmlhbCBvbmx5IHR1bmVycy9QTEwKIwoKIwojIFNFQyBjb250cm9sIGRl
dmljZXMgZm9yIERWQi1TCiMKCiMKIyBUb29scyB0byBkZXZlbG9wIG5ldyBmcm9udGVuZHMKIwoj
IENPTkZJR19EVkJfRFVNTVlfRkUgaXMgbm90IHNldAoKIwojIEdyYXBoaWNzIHN1cHBvcnQKIwoj
IENPTkZJR19BR1AgaXMgbm90IHNldApDT05GSUdfVkdBX0FSQj15CkNPTkZJR19WR0FfQVJCX01B
WF9HUFVTPTE2CiMgQ09ORklHX1ZHQV9TV0lUQ0hFUk9PIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJN
IGlzIG5vdCBzZXQKCiMKIyBGcmFtZSBidWZmZXIgRGV2aWNlcwojCkNPTkZJR19GQj1tCkNPTkZJ
R19GSVJNV0FSRV9FRElEPXkKQ09ORklHX0ZCX0NNRExJTkU9eQojIENPTkZJR19GQl9EREMgaXMg
bm90IHNldAojIENPTkZJR19GQl9CT09UX1ZFU0FfU1VQUE9SVCBpcyBub3Qgc2V0CkNPTkZJR19G
Ql9DRkJfRklMTFJFQ1Q9bQpDT05GSUdfRkJfQ0ZCX0NPUFlBUkVBPW0KQ09ORklHX0ZCX0NGQl9J
TUFHRUJMSVQ9bQojIENPTkZJR19GQl9DRkJfUkVWX1BJWEVMU19JTl9CWVRFIGlzIG5vdCBzZXQK
Q09ORklHX0ZCX1NZU19GSUxMUkVDVD1tCkNPTkZJR19GQl9TWVNfQ09QWUFSRUE9bQpDT05GSUdf
RkJfU1lTX0lNQUdFQkxJVD1tCiMgQ09ORklHX0ZCX0ZPUkVJR05fRU5ESUFOIGlzIG5vdCBzZXQK
Q09ORklHX0ZCX1NZU19GT1BTPW0KQ09ORklHX0ZCX0RFRkVSUkVEX0lPPXkKIyBDT05GSUdfRkJf
U1ZHQUxJQiBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX01BQ01PREVTIGlzIG5vdCBzZXQKIyBDT05G
SUdfRkJfQkFDS0xJR0hUIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfTU9ERV9IRUxQRVJTIGlzIG5v
dCBzZXQKQ09ORklHX0ZCX1RJTEVCTElUVElORz15CgojCiMgRnJhbWUgYnVmZmVyIGhhcmR3YXJl
IGRyaXZlcnMKIwojIENPTkZJR19GQl9DSVJSVVMgaXMgbm90IHNldAojIENPTkZJR19GQl9QTTIg
aXMgbm90IHNldAojIENPTkZJR19GQl9DWUJFUjIwMDAgaXMgbm90IHNldApDT05GSUdfRkJfQVJD
PW0KIyBDT05GSUdfRkJfVkdBMTYgaXMgbm90IHNldAojIENPTkZJR19GQl9ONDExIGlzIG5vdCBz
ZXQKQ09ORklHX0ZCX0hHQT1tCkNPTkZJR19GQl9PUEVOQ09SRVM9bQpDT05GSUdfRkJfUzFEMTNY
WFg9bQojIENPTkZJR19GQl9OVklESUEgaXMgbm90IHNldAojIENPTkZJR19GQl9SSVZBIGlzIG5v
dCBzZXQKIyBDT05GSUdfRkJfSTc0MCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0xFODA1NzggaXMg
bm90IHNldAojIENPTkZJR19GQl9NQVRST1ggaXMgbm90IHNldAojIENPTkZJR19GQl9SQURFT04g
aXMgbm90IHNldAojIENPTkZJR19GQl9BVFkxMjggaXMgbm90IHNldAojIENPTkZJR19GQl9BVFkg
aXMgbm90IHNldAojIENPTkZJR19GQl9TMyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1NBVkFHRSBp
cyBub3Qgc2V0CiMgQ09ORklHX0ZCX1NJUyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1ZJQSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0ZCX05FT01BR0lDIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfS1lSTyBp
cyBub3Qgc2V0CiMgQ09ORklHX0ZCXzNERlggaXMgbm90IHNldAojIENPTkZJR19GQl9WT09ET08x
IGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfVlQ4NjIzIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfVFJJ
REVOVCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0FSSyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1BN
MyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0NBUk1JTkUgaXMgbm90IHNldAojIENPTkZJR19GQl9H
RU9ERSBpcyBub3Qgc2V0CkNPTkZJR19GQl9JQk1fR1hUNDUwMD1tCkNPTkZJR19GQl9WSVJUVUFM
PW0KQ09ORklHX0ZCX01FVFJPTk9NRT1tCiMgQ09ORklHX0ZCX01CODYyWFggaXMgbm90IHNldAoj
IENPTkZJR19GQl9CUk9BRFNIRUVUIGlzIG5vdCBzZXQKQ09ORklHX0ZCX0FVT19LMTkwWD1tCiMg
Q09ORklHX0ZCX0FVT19LMTkwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0FVT19LMTkwMSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0ZCX1NNNzEyIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX0xD
RF9TVVBQT1JUIGlzIG5vdCBzZXQKIyBDT05GSUdfVkdBU1RBVEUgaXMgbm90IHNldAojIENPTkZJ
R19MT0dPIGlzIG5vdCBzZXQKQ09ORklHX1NPVU5EPXkKQ09ORklHX1NPVU5EX09TU19DT1JFPXkK
IyBDT05GSUdfU09VTkRfT1NTX0NPUkVfUFJFQ0xBSU0gaXMgbm90IHNldApDT05GSUdfU05EPXkK
Q09ORklHX1NORF9USU1FUj15CkNPTkZJR19TTkRfUENNPXkKQ09ORklHX1NORF9IV0RFUD15CkNP
TkZJR19TTkRfUkFXTUlEST15CkNPTkZJR19TTkRfU0VRVUVOQ0VSPW0KIyBDT05GSUdfU05EX1NF
UV9EVU1NWSBpcyBub3Qgc2V0CkNPTkZJR19TTkRfT1NTRU1VTD15CkNPTkZJR19TTkRfTUlYRVJf
T1NTPXkKIyBDT05GSUdfU05EX1BDTV9PU1MgaXMgbm90IHNldAojIENPTkZJR19TTkRfUENNX1RJ
TUVSIGlzIG5vdCBzZXQKQ09ORklHX1NORF9TRVFVRU5DRVJfT1NTPXkKIyBDT05GSUdfU05EX0RZ
TkFNSUNfTUlOT1JTIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NVUFBPUlRfT0xEX0FQSSBpcyBu
b3Qgc2V0CkNPTkZJR19TTkRfUFJPQ19GUz15CkNPTkZJR19TTkRfVkVSQk9TRV9QUk9DRlM9eQoj
IENPTkZJR19TTkRfVkVSQk9TRV9QUklOVEsgaXMgbm90IHNldApDT05GSUdfU05EX0RFQlVHPXkK
IyBDT05GSUdfU05EX0RFQlVHX1ZFUkJPU0UgaXMgbm90IHNldAojIENPTkZJR19TTkRfUENNX1hS
VU5fREVCVUcgaXMgbm90IHNldApDT05GSUdfU05EX0RNQV9TR0JVRj15CkNPTkZJR19TTkRfUkFX
TUlESV9TRVE9bQpDT05GSUdfU05EX09QTDNfTElCX1NFUT1tCkNPTkZJR19TTkRfT1BMNF9MSUJf
U0VRPW0KQ09ORklHX1NORF9TQkFXRV9TRVE9bQojIENPTkZJR19TTkRfRU1VMTBLMV9TRVEgaXMg
bm90IHNldApDT05GSUdfU05EX01QVTQwMV9VQVJUPXkKQ09ORklHX1NORF9PUEwzX0xJQj15CkNP
TkZJR19TTkRfT1BMNF9MSUI9eQpDT05GSUdfU05EX0RSSVZFUlM9eQojIENPTkZJR19TTkRfRFVN
TVkgaXMgbm90IHNldApDT05GSUdfU05EX0FMT09QPW0KQ09ORklHX1NORF9WSVJNSURJPW0KQ09O
RklHX1NORF9NVFBBVj1tCkNPTkZJR19TTkRfU0VSSUFMX1UxNjU1MD15CiMgQ09ORklHX1NORF9N
UFU0MDEgaXMgbm90IHNldApDT05GSUdfU05EX1dTU19MSUI9eQpDT05GSUdfU05EX1NCX0NPTU1P
Tj15CkNPTkZJR19TTkRfU0I4X0RTUD15CkNPTkZJR19TTkRfU0IxNl9EU1A9eQpDT05GSUdfU05E
X0lTQT15CiMgQ09ORklHX1NORF9BRExJQiBpcyBub3Qgc2V0CkNPTkZJR19TTkRfQUQxODE2QT15
CiMgQ09ORklHX1NORF9BRDE4NDggaXMgbm90IHNldApDT05GSUdfU05EX0FMUzEwMD15CkNPTkZJ
R19TTkRfQVpUMTYwNT1tCkNPTkZJR19TTkRfQVpUMjMxNj15CiMgQ09ORklHX1NORF9BWlQyMzIw
IGlzIG5vdCBzZXQKQ09ORklHX1NORF9DTUk4MzI4PW0KQ09ORklHX1NORF9DTUk4MzMwPXkKQ09O
RklHX1NORF9DUzQyMzE9eQpDT05GSUdfU05EX0NTNDIzNj1tCkNPTkZJR19TTkRfRVMxNjg4PXkK
IyBDT05GSUdfU05EX0VTMThYWCBpcyBub3Qgc2V0CkNPTkZJR19TTkRfU0M2MDAwPW0KQ09ORklH
X1NORF9HVVNDTEFTU0lDPXkKIyBDT05GSUdfU05EX0dVU0VYVFJFTUUgaXMgbm90IHNldApDT05G
SUdfU05EX0dVU01BWD1tCkNPTkZJR19TTkRfSU5URVJXQVZFPXkKQ09ORklHX1NORF9JTlRFUldB
VkVfU1RCPXkKQ09ORklHX1NORF9KQVpaMTY9eQpDT05GSUdfU05EX09QTDNTQTI9eQojIENPTkZJ
R19TTkRfT1BUSTkyWF9BRDE4NDggaXMgbm90IHNldAojIENPTkZJR19TTkRfT1BUSTkyWF9DUzQy
MzEgaXMgbm90IHNldApDT05GSUdfU05EX09QVEk5M1g9bQpDT05GSUdfU05EX01JUk89eQpDT05G
SUdfU05EX1NCOD15CkNPTkZJR19TTkRfU0IxNj15CkNPTkZJR19TTkRfU0JBV0U9bQojIENPTkZJ
R19TTkRfU0IxNl9DU1AgaXMgbm90IHNldApDT05GSUdfU05EX1NTQ0FQRT1tCkNPTkZJR19TTkRf
V0FWRUZST05UPW0KQ09ORklHX1NORF9NU05EX1BJTk5BQ0xFPW0KQ09ORklHX1NORF9NU05EX0NM
QVNTSUM9eQpDT05GSUdfU05EX1BDST15CiMgQ09ORklHX1NORF9BRDE4ODkgaXMgbm90IHNldAoj
IENPTkZJR19TTkRfQUxTNDAwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9BU0lIUEkgaXMgbm90
IHNldAojIENPTkZJR19TTkRfQVRJSVhQIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0FUSUlYUF9N
T0RFTSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9BVTg4MTAgaXMgbm90IHNldAojIENPTkZJR19T
TkRfQVU4ODIwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0FVODgzMCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9BVzIgaXMgbm90IHNldAojIENPTkZJR19TTkRfQlQ4N1ggaXMgbm90IHNldAojIENP
TkZJR19TTkRfQ0EwMTA2IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0NNSVBDSSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9PWFlHRU4gaXMgbm90IHNldAojIENPTkZJR19TTkRfQ1M0MjgxIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX0NTNDZYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9DUzU1MzAg
aXMgbm90IHNldAojIENPTkZJR19TTkRfQ1M1NTM1QVVESU8gaXMgbm90IHNldAojIENPTkZJR19T
TkRfQ1RYRkkgaXMgbm90IHNldAojIENPTkZJR19TTkRfREFSTEEyMCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9HSU5BMjAgaXMgbm90IHNldAojIENPTkZJR19TTkRfTEFZTEEyMCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9EQVJMQTI0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0dJTkEyNCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9MQVlMQTI0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX01PTkEg
aXMgbm90IHNldAojIENPTkZJR19TTkRfTUlBIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0VDSE8z
RyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9JTkRJR08gaXMgbm90IHNldAojIENPTkZJR19TTkRf
SU5ESUdPSU8gaXMgbm90IHNldAojIENPTkZJR19TTkRfSU5ESUdPREogaXMgbm90IHNldAojIENP
TkZJR19TTkRfSU5ESUdPSU9YIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0lORElHT0RKWCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9FTlMxMzcwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0VOUzEz
NzEgaXMgbm90IHNldAojIENPTkZJR19TTkRfRk04MDEgaXMgbm90IHNldAojIENPTkZJR19TTkRf
SERTUCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9IRFNQTSBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9JQ0UxNzI0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0lOVEVMOFgwIGlzIG5vdCBzZXQKIyBD
T05GSUdfU05EX0lOVEVMOFgwTSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9LT1JHMTIxMiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9MT0xBIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0xYNjQ2NEVT
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX01JWEFSVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9O
TTI1NiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9QQ1hIUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9SSVBUSURFIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1JNRTMyIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX1JNRTk2IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1JNRTk2NTIgaXMgbm90IHNldAoj
IENPTkZJR19TTkRfU0U2WCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9WSUE4MlhYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX1ZJQTgyWFhfTU9ERU0gaXMgbm90IHNldAojIENPTkZJR19TTkRfVklS
VFVPU08gaXMgbm90IHNldAojIENPTkZJR19TTkRfVlgyMjIgaXMgbm90IHNldAojIENPTkZJR19T
TkRfWU1GUENJIGlzIG5vdCBzZXQKCiMKIyBIRC1BdWRpbwojCiMgQ09ORklHX1NORF9IREFfSU5U
RUwgaXMgbm90IHNldApDT05GSUdfU05EX0hEQV9QUkVBTExPQ19TSVpFPTY0CiMgQ09ORklHX1NO
RF9QQ01DSUEgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DIGlzIG5vdCBzZXQKQ09ORklHX1NP
VU5EX1BSSU1FPW0KIyBDT05GSUdfU09VTkRfTVNORENMQVMgaXMgbm90IHNldAojIENPTkZJR19T
T1VORF9NU05EUElOIGlzIG5vdCBzZXQKIyBDT05GSUdfU09VTkRfT1NTIGlzIG5vdCBzZXQKCiMK
IyBISUQgc3VwcG9ydAojCkNPTkZJR19ISUQ9bQojIENPTkZJR19ISURfQkFUVEVSWV9TVFJFTkdU
SCBpcyBub3Qgc2V0CkNPTkZJR19ISURSQVc9eQpDT05GSUdfVUhJRD1tCiMgQ09ORklHX0hJRF9H
RU5FUklDIGlzIG5vdCBzZXQKCiMKIyBTcGVjaWFsIEhJRCBkcml2ZXJzCiMKQ09ORklHX0hJRF9B
NFRFQ0g9bQpDT05GSUdfSElEX0FDUlVYPW0KIyBDT05GSUdfSElEX0FDUlVYX0ZGIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX0FQUExFIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9BVVJFQUw9bQpDT05G
SUdfSElEX0JFTEtJTj1tCiMgQ09ORklHX0hJRF9DSEVSUlkgaXMgbm90IHNldApDT05GSUdfSElE
X0NISUNPTlk9bQpDT05GSUdfSElEX1BST0RJS0VZUz1tCiMgQ09ORklHX0hJRF9DWVBSRVNTIGlz
IG5vdCBzZXQKQ09ORklHX0hJRF9EUkFHT05SSVNFPW0KQ09ORklHX0RSQUdPTlJJU0VfRkY9eQpD
T05GSUdfSElEX0VNU19GRj1tCkNPTkZJR19ISURfRUxFQ09NPW0KQ09ORklHX0hJRF9FWktFWT1t
CkNPTkZJR19ISURfR0VNQklSRD1tCkNPTkZJR19ISURfR0ZSTT1tCiMgQ09ORklHX0hJRF9LRVlU
T1VDSCBpcyBub3Qgc2V0CkNPTkZJR19ISURfS1lFPW0KIyBDT05GSUdfSElEX1dBTFRPUCBpcyBu
b3Qgc2V0CkNPTkZJR19ISURfR1lSQVRJT049bQojIENPTkZJR19ISURfSUNBREUgaXMgbm90IHNl
dAojIENPTkZJR19ISURfVFdJTkhBTiBpcyBub3Qgc2V0CkNPTkZJR19ISURfS0VOU0lOR1RPTj1t
CiMgQ09ORklHX0hJRF9MQ1BPV0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0xFTk9WTyBpcyBu
b3Qgc2V0CkNPTkZJR19ISURfTE9HSVRFQ0g9bQojIENPTkZJR19ISURfTE9HSVRFQ0hfREogaXMg
bm90IHNldApDT05GSUdfSElEX0xPR0lURUNIX0hJRFBQPW0KQ09ORklHX0xPR0lURUNIX0ZGPXkK
IyBDT05GSUdfTE9HSVJVTUJMRVBBRDJfRkYgaXMgbm90IHNldAojIENPTkZJR19MT0dJRzk0MF9G
RiBpcyBub3Qgc2V0CkNPTkZJR19MT0dJV0hFRUxTX0ZGPXkKQ09ORklHX0hJRF9NQUdJQ01PVVNF
PW0KIyBDT05GSUdfSElEX01JQ1JPU09GVCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9NT05URVJF
WSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9NVUxUSVRPVUNIIGlzIG5vdCBzZXQKQ09ORklHX0hJ
RF9PUlRFSz1tCkNPTkZJR19ISURfUEFOVEhFUkxPUkQ9bQpDT05GSUdfUEFOVEhFUkxPUkRfRkY9
eQpDT05GSUdfSElEX1BFVEFMWU5YPW0KQ09ORklHX0hJRF9QSUNPTENEPW0KIyBDT05GSUdfSElE
X1BJQ09MQ0RfRkIgaXMgbm90IHNldApDT05GSUdfSElEX1BJQ09MQ0RfTEVEUz15CiMgQ09ORklH
X0hJRF9QSUNPTENEX0NJUiBpcyBub3Qgc2V0CkNPTkZJR19ISURfUExBTlRST05JQ1M9bQojIENP
TkZJR19ISURfUFJJTUFYIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9TQUlURUs9bQpDT05GSUdfSElE
X1NBTVNVTkc9bQpDT05GSUdfSElEX1NQRUVETElOSz1tCiMgQ09ORklHX0hJRF9TVEVFTFNFUklF
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9TVU5QTFVTIGlzIG5vdCBzZXQKIyBDT05GSUdfSElE
X1JNSSBpcyBub3Qgc2V0CkNPTkZJR19ISURfR1JFRU5BU0lBPW0KIyBDT05GSUdfR1JFRU5BU0lB
X0ZGIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9TTUFSVEpPWVBMVVM9bQpDT05GSUdfU01BUlRKT1lQ
TFVTX0ZGPXkKQ09ORklHX0hJRF9USVZPPW0KQ09ORklHX0hJRF9UT1BTRUVEPW0KQ09ORklHX0hJ
RF9USElOR009bQojIENPTkZJR19ISURfVEhSVVNUTUFTVEVSIGlzIG5vdCBzZXQKQ09ORklHX0hJ
RF9XQUNPTT1tCiMgQ09ORklHX0hJRF9XSUlNT1RFIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1hJ
Tk1PIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9aRVJPUExVUz1tCkNPTkZJR19aRVJPUExVU19GRj15
CiMgQ09ORklHX0hJRF9aWURBQ1JPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9TRU5TT1JfSFVC
IGlzIG5vdCBzZXQKCiMKIyBJMkMgSElEIHN1cHBvcnQKIwojIENPTkZJR19JMkNfSElEIGlzIG5v
dCBzZXQKQ09ORklHX1VTQl9PSENJX0xJVFRMRV9FTkRJQU49eQpDT05GSUdfVVNCX1NVUFBPUlQ9
eQpDT05GSUdfVVNCX0FSQ0hfSEFTX0hDRD15CiMgQ09ORklHX1VTQiBpcyBub3Qgc2V0CgojCiMg
VVNCIHBvcnQgZHJpdmVycwojCgojCiMgVVNCIFBoeXNpY2FsIExheWVyIGRyaXZlcnMKIwojIENP
TkZJR19VU0JfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTk9QX1VTQl9YQ0VJViBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9HUElPX1ZCVVMgaXMgbm90IHNldAojIENPTkZJR19VU0JfR0FER0VUIGlz
IG5vdCBzZXQKQ09ORklHX1VXQj1tCiMgQ09ORklHX1VXQl9XSENJIGlzIG5vdCBzZXQKQ09ORklH
X01NQz15CiMgQ09ORklHX01NQ19ERUJVRyBpcyBub3Qgc2V0CgojCiMgTU1DL1NEL1NESU8gQ2Fy
ZCBEcml2ZXJzCiMKIyBDT05GSUdfU0RJT19VQVJUIGlzIG5vdCBzZXQKQ09ORklHX01NQ19URVNU
PXkKCiMKIyBNTUMvU0QvU0RJTyBIb3N0IENvbnRyb2xsZXIgRHJpdmVycwojCiMgQ09ORklHX01N
Q19TREhDSSBpcyBub3Qgc2V0CkNPTkZJR19NTUNfV0JTRD1tCiMgQ09ORklHX01NQ19USUZNX1NE
IGlzIG5vdCBzZXQKIyBDT05GSUdfTU1DX1NEUklDT0hfQ1MgaXMgbm90IHNldAojIENPTkZJR19N
TUNfQ0I3MTAgaXMgbm90IHNldAojIENPTkZJR19NTUNfVklBX1NETU1DIGlzIG5vdCBzZXQKQ09O
RklHX01NQ19VU0RISTZST0wwPXkKIyBDT05GSUdfTU1DX1RPU0hJQkFfUENJIGlzIG5vdCBzZXQK
Q09ORklHX01NQ19NVEs9bQpDT05GSUdfTUVNU1RJQ0s9eQojIENPTkZJR19NRU1TVElDS19ERUJV
RyBpcyBub3Qgc2V0CgojCiMgTWVtb3J5U3RpY2sgZHJpdmVycwojCkNPTkZJR19NRU1TVElDS19V
TlNBRkVfUkVTVU1FPXkKCiMKIyBNZW1vcnlTdGljayBIb3N0IENvbnRyb2xsZXIgRHJpdmVycwoj
CiMgQ09ORklHX01FTVNUSUNLX1RJRk1fTVMgaXMgbm90IHNldAojIENPTkZJR19NRU1TVElDS19K
TUlDUk9OXzM4WCBpcyBub3Qgc2V0CiMgQ09ORklHX01FTVNUSUNLX1I1OTIgaXMgbm90IHNldApD
T05GSUdfTkVXX0xFRFM9eQpDT05GSUdfTEVEU19DTEFTUz15CiMgQ09ORklHX0xFRFNfQ0xBU1Nf
RkxBU0ggaXMgbm90IHNldAoKIwojIExFRCBkcml2ZXJzCiMKIyBDT05GSUdfTEVEU184OFBNODYw
WCBpcyBub3Qgc2V0CkNPTkZJR19MRURTX0xNMzUzMD1tCiMgQ09ORklHX0xFRFNfTE0zNTMzIGlz
IG5vdCBzZXQKQ09ORklHX0xFRFNfTE0zNjQyPW0KQ09ORklHX0xFRFNfTkVUNDhYWD1tCkNPTkZJ
R19MRURTX1dSQVA9bQpDT05GSUdfTEVEU19QQ0E5NTMyPXkKQ09ORklHX0xFRFNfUENBOTUzMl9H
UElPPXkKIyBDT05GSUdfTEVEU19HUElPIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfTFAzOTQ0PW0K
Q09ORklHX0xFRFNfTFA1NVhYX0NPTU1PTj15CkNPTkZJR19MRURTX0xQNTUyMT1tCkNPTkZJR19M
RURTX0xQNTUyMz1tCiMgQ09ORklHX0xFRFNfTFA1NTYyIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNf
TFA4NTAxPXkKIyBDT05GSUdfTEVEU19MUDg3ODggaXMgbm90IHNldAojIENPTkZJR19MRURTX0xQ
ODg2MCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfUENBOTU1WCBpcyBub3Qgc2V0CkNPTkZJR19M
RURTX1BDQTk2M1g9eQpDT05GSUdfTEVEU19XTTgzMVhfU1RBVFVTPXkKQ09ORklHX0xFRFNfV004
MzUwPXkKIyBDT05GSUdfTEVEU19EQTkwM1ggaXMgbm90IHNldAojIENPTkZJR19MRURTX1BXTSBp
cyBub3Qgc2V0CkNPTkZJR19MRURTX1JFR1VMQVRPUj1tCiMgQ09ORklHX0xFRFNfQkQyODAyIGlz
IG5vdCBzZXQKIyBDT05GSUdfTEVEU19MVDM1OTMgaXMgbm90IHNldAojIENPTkZJR19MRURTX01D
MTM3ODMgaXMgbm90IHNldApDT05GSUdfTEVEU19UQ0E2NTA3PXkKIyBDT05GSUdfTEVEU19UTEM1
OTFYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTUFYODk5NyBpcyBub3Qgc2V0CkNPTkZJR19M
RURTX0xNMzU1eD1tCkNPTkZJR19MRURTX09UMjAwPW0KQ09ORklHX0xFRFNfTUVORjIxQk1DPW0K
CiMKIyBMRUQgZHJpdmVyIGZvciBibGluaygxKSBVU0IgUkdCIExFRCBpcyB1bmRlciBTcGVjaWFs
IEhJRCBkcml2ZXJzIChISURfVEhJTkdNKQojCkNPTkZJR19MRURTX0JMSU5LTT1tCgojCiMgTEVE
IFRyaWdnZXJzCiMKQ09ORklHX0xFRFNfVFJJR0dFUlM9eQpDT05GSUdfTEVEU19UUklHR0VSX1RJ
TUVSPXkKQ09ORklHX0xFRFNfVFJJR0dFUl9PTkVTSE9UPXkKQ09ORklHX0xFRFNfVFJJR0dFUl9I
RUFSVEJFQVQ9eQpDT05GSUdfTEVEU19UUklHR0VSX0JBQ0tMSUdIVD1tCiMgQ09ORklHX0xFRFNf
VFJJR0dFUl9DUFUgaXMgbm90IHNldAojIENPTkZJR19MRURTX1RSSUdHRVJfR1BJTyBpcyBub3Qg
c2V0CiMgQ09ORklHX0xFRFNfVFJJR0dFUl9ERUZBVUxUX09OIGlzIG5vdCBzZXQKCiMKIyBpcHRh
YmxlcyB0cmlnZ2VyIGlzIHVuZGVyIE5ldGZpbHRlciBjb25maWcgKExFRCB0YXJnZXQpCiMKQ09O
RklHX0xFRFNfVFJJR0dFUl9UUkFOU0lFTlQ9bQpDT05GSUdfTEVEU19UUklHR0VSX0NBTUVSQT1t
CkNPTkZJR19BQ0NFU1NJQklMSVRZPXkKQ09ORklHX0VEQUNfQVRPTUlDX1NDUlVCPXkKQ09ORklH
X0VEQUNfU1VQUE9SVD15CkNPTkZJR19FREFDPXkKQ09ORklHX0VEQUNfTEVHQUNZX1NZU0ZTPXkK
IyBDT05GSUdfRURBQ19ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0VEQUNfTU1fRURBQyBpcyBu
b3Qgc2V0CkNPTkZJR19SVENfTElCPXkKIyBDT05GSUdfUlRDX0NMQVNTIGlzIG5vdCBzZXQKIyBD
T05GSUdfRE1BREVWSUNFUyBpcyBub3Qgc2V0CiMgQ09ORklHX0FVWERJU1BMQVkgaXMgbm90IHNl
dApDT05GSUdfVUlPPXkKIyBDT05GSUdfVUlPX0NJRiBpcyBub3Qgc2V0CkNPTkZJR19VSU9fUERS
Vl9HRU5JUlE9eQpDT05GSUdfVUlPX0RNRU1fR0VOSVJRPXkKIyBDT05GSUdfVUlPX0FFQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VJT19TRVJDT1MzIGlzIG5vdCBzZXQKIyBDT05GSUdfVUlPX1BDSV9H
RU5FUklDIGlzIG5vdCBzZXQKIyBDT05GSUdfVUlPX05FVFggaXMgbm90IHNldAojIENPTkZJR19V
SU9fUFJVU1MgaXMgbm90IHNldAojIENPTkZJR19VSU9fTUY2MjQgaXMgbm90IHNldApDT05GSUdf
VklSVF9EUklWRVJTPXkKQ09ORklHX1ZJUlRJTz15CgojCiMgVmlydGlvIGRyaXZlcnMKIwojIENP
TkZJR19WSVJUSU9fUENJIGlzIG5vdCBzZXQKQ09ORklHX1ZJUlRJT19CQUxMT09OPW0KIyBDT05G
SUdfVklSVElPX0lOUFVUIGlzIG5vdCBzZXQKIyBDT05GSUdfVklSVElPX01NSU8gaXMgbm90IHNl
dAoKIwojIE1pY3Jvc29mdCBIeXBlci1WIGd1ZXN0IHN1cHBvcnQKIwojIENPTkZJR19IWVBFUlYg
aXMgbm90IHNldApDT05GSUdfU1RBR0lORz15CiMgQ09ORklHX1NMSUNPU1MgaXMgbm90IHNldApD
T05GSUdfQ09NRURJPW0KQ09ORklHX0NPTUVESV9ERUJVRz15CkNPTkZJR19DT01FRElfREVGQVVM
VF9CVUZfU0laRV9LQj0yMDQ4CkNPTkZJR19DT01FRElfREVGQVVMVF9CVUZfTUFYU0laRV9LQj0y
MDQ4MAojIENPTkZJR19DT01FRElfTUlTQ19EUklWRVJTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09N
RURJX0lTQV9EUklWRVJTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NRURJX1BDSV9EUklWRVJTIGlz
IG5vdCBzZXQKQ09ORklHX0NPTUVESV9QQ01DSUFfRFJJVkVSUz1tCkNPTkZJR19DT01FRElfQ0Jf
REFTMTZfQ1M9bQojIENPTkZJR19DT01FRElfREFTMDhfQ1MgaXMgbm90IHNldApDT05GSUdfQ09N
RURJX05JX0RBUV83MDBfQ1M9bQpDT05GSUdfQ09NRURJX05JX0RBUV9ESU8yNF9DUz1tCkNPTkZJ
R19DT01FRElfTklfTEFCUENfQ1M9bQpDT05GSUdfQ09NRURJX05JX01JT19DUz1tCiMgQ09ORklH
X0NPTUVESV9RVUFURUNIX0RBUVBfQ1MgaXMgbm90IHNldApDT05GSUdfQ09NRURJXzgyNTQ9bQpD
T05GSUdfQ09NRURJXzgyNTU9bQpDT05GSUdfQ09NRURJXzgyNTVfU0E9bQpDT05GSUdfQ09NRURJ
X0tDT01FRElMSUI9bQpDT05GSUdfQ09NRURJX05JX0xBQlBDPW0KQ09ORklHX0NPTUVESV9OSV9U
SU89bQoKIwojIElJTyBzdGFnaW5nIGRyaXZlcnMKIwoKIwojIEFjY2VsZXJvbWV0ZXJzCiMKCiMK
IyBBbmFsb2cgdG8gZGlnaXRhbCBjb252ZXJ0ZXJzCiMKQ09ORklHX0FENzYwNj1tCiMgQ09ORklH
X0FENzYwNl9JRkFDRV9QQVJBTExFTCBpcyBub3Qgc2V0CgojCiMgQW5hbG9nIGRpZ2l0YWwgYmkt
ZGlyZWN0aW9uIGNvbnZlcnRlcnMKIwpDT05GSUdfQURUNzMxNj1tCiMgQ09ORklHX0FEVDczMTZf
STJDIGlzIG5vdCBzZXQKCiMKIyBDYXBhY2l0YW5jZSB0byBkaWdpdGFsIGNvbnZlcnRlcnMKIwoj
IENPTkZJR19BRDcxNTAgaXMgbm90IHNldApDT05GSUdfQUQ3MTUyPW0KIyBDT05GSUdfQUQ3NzQ2
IGlzIG5vdCBzZXQKCiMKIyBEaXJlY3QgRGlnaXRhbCBTeW50aGVzaXMKIwoKIwojIERpZ2l0YWwg
Z3lyb3Njb3BlIHNlbnNvcnMKIwoKIwojIE5ldHdvcmsgQW5hbHl6ZXIsIEltcGVkYW5jZSBDb252
ZXJ0ZXJzCiMKQ09ORklHX0FENTkzMz1tCgojCiMgTGlnaHQgc2Vuc29ycwojCkNPTkZJR19TRU5T
T1JTX0lTTDI5MDE4PXkKQ09ORklHX1NFTlNPUlNfSVNMMjkwMjg9bQojIENPTkZJR19UU0wyNTgz
IGlzIG5vdCBzZXQKQ09ORklHX1RTTDJ4N3g9bQoKIwojIE1hZ25ldG9tZXRlciBzZW5zb3JzCiMK
IyBDT05GSUdfU0VOU09SU19ITUM1ODQzX0kyQyBpcyBub3Qgc2V0CgojCiMgQWN0aXZlIGVuZXJn
eSBtZXRlcmluZyBJQwojCkNPTkZJR19BREU3ODU0PW0KQ09ORklHX0FERTc4NTRfSTJDPW0KCiMK
IyBSZXNvbHZlciB0byBkaWdpdGFsIGNvbnZlcnRlcnMKIwoKIwojIFRyaWdnZXJzIC0gc3RhbmRh
bG9uZQojCkNPTkZJR19JSU9fU0lNUExFX0RVTU1ZPXkKIyBDT05GSUdfSUlPX1NJTVBMRV9EVU1N
WV9FVkVOVFMgaXMgbm90IHNldAojIENPTkZJR19JSU9fU0lNUExFX0RVTU1ZX0JVRkZFUiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0ZCX1NNNzUwIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfWEdJIGlzIG5v
dCBzZXQKCiMKIyBTcGVha3VwIGNvbnNvbGUgc3BlZWNoCiMKQ09ORklHX1RPVUNIU0NSRUVOX1NZ
TkFQVElDU19JMkNfUk1JND1tCiMgQ09ORklHX1NUQUdJTkdfTUVESUEgaXMgbm90IHNldAoKIwoj
IEFuZHJvaWQKIwojIENPTkZJR19XSU1BWF9HRE03MlhYIGlzIG5vdCBzZXQKIyBDT05GSUdfREdO
QyBpcyBub3Qgc2V0CiMgQ09ORklHX0RHQVAgaXMgbm90IHNldApDT05GSUdfR1NfRlBHQUJPT1Q9
bQojIENPTkZJR19NT1NUIGlzIG5vdCBzZXQKQ09ORklHX1g4Nl9QTEFURk9STV9ERVZJQ0VTPXkK
IyBDT05GSUdfQUNFUkhERiBpcyBub3Qgc2V0CiMgQ09ORklHX0RFTExfU01PODgwMCBpcyBub3Qg
c2V0CiMgQ09ORklHX0ZVSklUU1VfVEFCTEVUIGlzIG5vdCBzZXQKIyBDT05GSUdfSFBfQUNDRUwg
aXMgbm90IHNldAojIENPTkZJR19IUF9XSVJFTEVTUyBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JT
X0hEQVBTPXkKIyBDT05GSUdfSU5URUxfTUVOTE9XIGlzIG5vdCBzZXQKIyBDT05GSUdfQUNQSV9X
TUkgaXMgbm90IHNldAojIENPTkZJR19UT1BTVEFSX0xBUFRPUCBpcyBub3Qgc2V0CiMgQ09ORklH
X1RPU0hJQkFfQlRfUkZLSUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9TSElCQV9IQVBTIGlzIG5v
dCBzZXQKIyBDT05GSUdfQUNQSV9DTVBDIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfSVBTIGlz
IG5vdCBzZXQKIyBDT05GSUdfSUJNX1JUTCBpcyBub3Qgc2V0CiMgQ09ORklHX1NBTVNVTkdfUTEw
IGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfUlNUIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxf
U01BUlRDT05ORUNUIGlzIG5vdCBzZXQKIyBDT05GSUdfUFZQQU5JQyBpcyBub3Qgc2V0CiMgQ09O
RklHX0lOVEVMX1BNQ19JUEMgaXMgbm90IHNldAojIENPTkZJR19TVVJGQUNFX1BSTzNfQlVUVE9O
IGlzIG5vdCBzZXQKQ09ORklHX0NIUk9NRV9QTEFURk9STVM9eQpDT05GSUdfQ0hST01FT1NfUFNU
T1JFPXkKQ09ORklHX0NST1NfRUNfQ0hBUkRFVj1tCkNPTkZJR19DUk9TX0VDX0xQQz1tCkNPTkZJ
R19DUk9TX0VDX1BST1RPPXkKCiMKIyBIYXJkd2FyZSBTcGlubG9jayBkcml2ZXJzCiMKCiMKIyBD
bG9jayBTb3VyY2UgZHJpdmVycwojCkNPTkZJR19DTEtTUkNfSTgyNTM9eQpDT05GSUdfQ0xLRVZU
X0k4MjUzPXkKQ09ORklHX0NMS0JMRF9JODI1Mz15CiMgQ09ORklHX0FUTUVMX1BJVCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NIX1RJTUVSX0NNVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NIX1RJTUVSX01U
VTIgaXMgbm90IHNldAojIENPTkZJR19TSF9USU1FUl9UTVUgaXMgbm90IHNldAojIENPTkZJR19F
TV9USU1FUl9TVEkgaXMgbm90IHNldAojIENPTkZJR19NQUlMQk9YIGlzIG5vdCBzZXQKIyBDT05G
SUdfSU9NTVVfU1VQUE9SVCBpcyBub3Qgc2V0CgojCiMgUmVtb3RlcHJvYyBkcml2ZXJzCiMKQ09O
RklHX1JFTU9URVBST0M9eQpDT05GSUdfU1RFX01PREVNX1JQUk9DPXkKCiMKIyBScG1zZyBkcml2
ZXJzCiMKCiMKIyBTT0MgKFN5c3RlbSBPbiBDaGlwKSBzcGVjaWZpYyBEcml2ZXJzCiMKIyBDT05G
SUdfU1VOWElfU1JBTSBpcyBub3Qgc2V0CkNPTkZJR19TT0NfVEk9eQojIENPTkZJR19QTV9ERVZG
UkVRIGlzIG5vdCBzZXQKIyBDT05GSUdfRVhUQ09OIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVNT1JZ
IGlzIG5vdCBzZXQKQ09ORklHX0lJTz15CkNPTkZJR19JSU9fQlVGRkVSPXkKQ09ORklHX0lJT19C
VUZGRVJfQ0I9eQpDT05GSUdfSUlPX0tGSUZPX0JVRj15CkNPTkZJR19JSU9fVFJJR0dFUkVEX0JV
RkZFUj15CkNPTkZJR19JSU9fVFJJR0dFUj15CkNPTkZJR19JSU9fQ09OU1VNRVJTX1BFUl9UUklH
R0VSPTIKCiMKIyBBY2NlbGVyb21ldGVycwojCkNPTkZJR19CTUExODA9bQojIENPTkZJR19CTUMx
NTBfQUNDRUwgaXMgbm90IHNldApDT05GSUdfSUlPX1NUX0FDQ0VMXzNBWElTPW0KQ09ORklHX0lJ
T19TVF9BQ0NFTF9JMkNfM0FYSVM9bQojIENPTkZJR19LWENKSzEwMTMgaXMgbm90IHNldApDT05G
SUdfTU1BODQ1Mj15CiMgQ09ORklHX01NQTk1NTEgaXMgbm90IHNldAojIENPTkZJR19NTUE5NTUz
IGlzIG5vdCBzZXQKIyBDT05GSUdfTVhDNDAwNSBpcyBub3Qgc2V0CkNPTkZJR19TVEs4MzEyPW0K
IyBDT05GSUdfU1RLOEJBNTAgaXMgbm90IHNldAoKIwojIEFuYWxvZyB0byBkaWdpdGFsIGNvbnZl
cnRlcnMKIwojIENPTkZJR19BRDcyOTEgaXMgbm90IHNldApDT05GSUdfQUQ3OTlYPXkKQ09ORklH
X0FYUDI4OF9BREM9bQpDT05GSUdfREE5MTUwX0dQQURDPW0KQ09ORklHX0xQODc4OF9BREM9bQpD
T05GSUdfTUFYMTM2Mz1tCiMgQ09ORklHX01DUDM0MjIgaXMgbm90IHNldApDT05GSUdfTUVOX1ox
ODhfQURDPW0KQ09ORklHX05BVTc4MDI9eQpDT05GSUdfUUNPTV9TUE1JX0lBREM9bQojIENPTkZJ
R19RQ09NX1NQTUlfVkFEQyBpcyBub3Qgc2V0CkNPTkZJR19USV9BREMwODFDPXkKCiMKIyBBbXBs
aWZpZXJzCiMKCiMKIyBDaGVtaWNhbCBTZW5zb3JzCiMKIyBDT05GSUdfVlo4OVggaXMgbm90IHNl
dAoKIwojIEhpZCBTZW5zb3IgSUlPIENvbW1vbgojCkNPTkZJR19JSU9fTVNfU0VOU09SU19JMkM9
eQoKIwojIFNTUCBTZW5zb3IgQ29tbW9uCiMKQ09ORklHX0lJT19TVF9TRU5TT1JTX0kyQz15CkNP
TkZJR19JSU9fU1RfU0VOU09SU19DT1JFPXkKCiMKIyBEaWdpdGFsIHRvIGFuYWxvZyBjb252ZXJ0
ZXJzCiMKQ09ORklHX0FENTA2ND1tCkNPTkZJR19BRDUzODA9bQojIENPTkZJR19BRDU0NDYgaXMg
bm90IHNldApDT05GSUdfTTYyMzMyPW0KIyBDT05GSUdfTUFYNTE3IGlzIG5vdCBzZXQKQ09ORklH
X01DUDQ3MjU9bQoKIwojIEZyZXF1ZW5jeSBTeW50aGVzaXplcnMgRERTL1BMTAojCgojCiMgQ2xv
Y2sgR2VuZXJhdG9yL0Rpc3RyaWJ1dGlvbgojCgojCiMgUGhhc2UtTG9ja2VkIExvb3AgKFBMTCkg
ZnJlcXVlbmN5IHN5bnRoZXNpemVycwojCgojCiMgRGlnaXRhbCBneXJvc2NvcGUgc2Vuc29ycwoj
CkNPTkZJR19CTUcxNjA9bQpDT05GSUdfQk1HMTYwX0kyQz1tCkNPTkZJR19JSU9fU1RfR1lST18z
QVhJUz1tCkNPTkZJR19JSU9fU1RfR1lST19JMkNfM0FYSVM9bQojIENPTkZJR19JVEczMjAwIGlz
IG5vdCBzZXQKCiMKIyBIdW1pZGl0eSBzZW5zb3JzCiMKQ09ORklHX0RIVDExPW0KIyBDT05GSUdf
SERDMTAwWCBpcyBub3Qgc2V0CiMgQ09ORklHX0hUVTIxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0k3
MDA1IGlzIG5vdCBzZXQKQ09ORklHX1NJNzAyMD15CgojCiMgSW5lcnRpYWwgbWVhc3VyZW1lbnQg
dW5pdHMKIwpDT05GSUdfS01YNjE9eQpDT05GSUdfSU5WX01QVTYwNTBfSUlPPW0KCiMKIyBMaWdo
dCBzZW5zb3JzCiMKIyBDT05GSUdfQUNQSV9BTFMgaXMgbm90IHNldApDT05GSUdfQURKRF9TMzEx
PXkKQ09ORklHX0FMMzMyMEE9eQpDT05GSUdfQVBEUzkzMDA9bQojIENPTkZJR19BUERTOTk2MCBp
cyBub3Qgc2V0CkNPTkZJR19CSDE3NTA9bQpDT05GSUdfQ00zMjE4MT1tCiMgQ09ORklHX0NNMzIz
MiBpcyBub3Qgc2V0CiMgQ09ORklHX0NNMzMyMyBpcyBub3Qgc2V0CiMgQ09ORklHX0NNMzY2NTEg
aXMgbm90IHNldAojIENPTkZJR19HUDJBUDAyMEEwMEYgaXMgbm90IHNldApDT05GSUdfSVNMMjkx
MjU9bQojIENPTkZJR19KU0ExMjEyIGlzIG5vdCBzZXQKQ09ORklHX1JQUjA1MjE9eQpDT05GSUdf
U0VOU09SU19MTTM1MzM9eQojIENPTkZJR19MVFI1MDEgaXMgbm90IHNldAojIENPTkZJR19PUFQz
MDAxIGlzIG5vdCBzZXQKIyBDT05GSUdfUEExMjIwMzAwMSBpcyBub3Qgc2V0CkNPTkZJR19TVEsz
MzEwPW0KQ09ORklHX1RDUzM0MTQ9bQpDT05GSUdfVENTMzQ3Mj1tCkNPTkZJR19TRU5TT1JTX1RT
TDI1NjM9bQojIENPTkZJR19UU0w0NTMxIGlzIG5vdCBzZXQKQ09ORklHX1VTNTE4MkQ9eQpDT05G
SUdfVkNOTDQwMDA9eQoKIwojIE1hZ25ldG9tZXRlciBzZW5zb3JzCiMKQ09ORklHX0FLODk3NT15
CkNPTkZJR19BSzA5OTExPXkKIyBDT05GSUdfQk1DMTUwX01BR04gaXMgbm90IHNldApDT05GSUdf
TUFHMzExMD15CkNPTkZJR19NTUMzNTI0MD15CiMgQ09ORklHX0lJT19TVF9NQUdOXzNBWElTIGlz
IG5vdCBzZXQKCiMKIyBJbmNsaW5vbWV0ZXIgc2Vuc29ycwojCgojCiMgVHJpZ2dlcnMgLSBzdGFu
ZGFsb25lCiMKQ09ORklHX0lJT19JTlRFUlJVUFRfVFJJR0dFUj1tCkNPTkZJR19JSU9fU1lTRlNf
VFJJR0dFUj15CgojCiMgRGlnaXRhbCBwb3RlbnRpb21ldGVycwojCiMgQ09ORklHX01DUDQ1MzEg
aXMgbm90IHNldAoKIwojIFByZXNzdXJlIHNlbnNvcnMKIwpDT05GSUdfQk1QMjgwPW0KQ09ORklH
X01QTDExNT1tCiMgQ09ORklHX01QTDMxMTUgaXMgbm90IHNldApDT05GSUdfTVM1NjExPXkKQ09O
RklHX01TNTYxMV9JMkM9bQpDT05GSUdfTVM1NjM3PW0KQ09ORklHX0lJT19TVF9QUkVTUz15CkNP
TkZJR19JSU9fU1RfUFJFU1NfSTJDPXkKQ09ORklHX1Q1NDAzPXkKCiMKIyBMaWdodG5pbmcgc2Vu
c29ycwojCgojCiMgUHJveGltaXR5IHNlbnNvcnMKIwpDT05GSUdfTElEQVJfTElURV9WMj1tCkNP
TkZJR19TWDk1MDA9bQoKIwojIFRlbXBlcmF0dXJlIHNlbnNvcnMKIwojIENPTkZJR19NTFg5MDYx
NCBpcyBub3Qgc2V0CkNPTkZJR19UTVAwMDY9eQojIENPTkZJR19UU1lTMDEgaXMgbm90IHNldApD
T05GSUdfVFNZUzAyRD15CiMgQ09ORklHX05UQiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZNRV9CVVMg
aXMgbm90IHNldApDT05GSUdfUFdNPXkKQ09ORklHX1BXTV9TWVNGUz15CkNPTkZJR19QV01fQ1JD
PXkKQ09ORklHX1BXTV9MUDM5NDM9bQojIENPTkZJR19QV01fTFBTUyBpcyBub3Qgc2V0CkNPTkZJ
R19QV01fUENBOTY4NT1tCkNPTkZJR19JUEFDS19CVVM9eQojIENPTkZJR19CT0FSRF9UUENJMjAw
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0lQT0NUQUwgaXMgbm90IHNldAojIENPTkZJR19S
RVNFVF9DT05UUk9MTEVSIGlzIG5vdCBzZXQKQ09ORklHX0ZNQz1tCiMgQ09ORklHX0ZNQ19GQUtF
REVWIGlzIG5vdCBzZXQKQ09ORklHX0ZNQ19UUklWSUFMPW0KQ09ORklHX0ZNQ19XUklURV9FRVBS
T009bQpDT05GSUdfRk1DX0NIQVJERVY9bQoKIwojIFBIWSBTdWJzeXN0ZW0KIwpDT05GSUdfR0VO
RVJJQ19QSFk9eQpDT05GSUdfUEhZX1BYQV8yOE5NX0hTSUM9eQpDT05GSUdfUEhZX1BYQV8yOE5N
X1VTQjI9eQojIENPTkZJR19CQ01fS09OQV9VU0IyX1BIWSBpcyBub3Qgc2V0CkNPTkZJR19QT1dF
UkNBUD15CkNPTkZJR19JTlRFTF9SQVBMPXkKQ09ORklHX01DQj1tCiMgQ09ORklHX01DQl9QQ0kg
aXMgbm90IHNldAoKIwojIFBlcmZvcm1hbmNlIG1vbml0b3Igc3VwcG9ydAojCkNPTkZJR19SQVM9
eQojIENPTkZJR19USFVOREVSQk9MVCBpcyBub3Qgc2V0CgojCiMgQW5kcm9pZAojCiMgQ09ORklH
X0FORFJPSUQgaXMgbm90IHNldApDT05GSUdfTlZNRU09bQpDT05GSUdfU1RNPXkKIyBDT05GSUdf
U1RNX0RVTU1ZIGlzIG5vdCBzZXQKIyBDT05GSUdfU1RNX1NPVVJDRV9DT05TT0xFIGlzIG5vdCBz
ZXQKQ09ORklHX0lOVEVMX1RIPXkKIyBDT05GSUdfSU5URUxfVEhfUENJIGlzIG5vdCBzZXQKIyBD
T05GSUdfSU5URUxfVEhfR1RIIGlzIG5vdCBzZXQKQ09ORklHX0lOVEVMX1RIX1NUSD15CiMgQ09O
RklHX0lOVEVMX1RIX01TVSBpcyBub3Qgc2V0CkNPTkZJR19JTlRFTF9USF9QVEk9eQpDT05GSUdf
SU5URUxfVEhfREVCVUc9eQoKIwojIEZQR0EgQ29uZmlndXJhdGlvbiBTdXBwb3J0CiMKIyBDT05G
SUdfRlBHQSBpcyBub3Qgc2V0CgojCiMgRmlybXdhcmUgRHJpdmVycwojCkNPTkZJR19FREQ9bQpD
T05GSUdfRUREX09GRj15CkNPTkZJR19GSVJNV0FSRV9NRU1NQVA9eQojIENPTkZJR19ERUxMX1JC
VSBpcyBub3Qgc2V0CkNPTkZJR19EQ0RCQVM9bQojIENPTkZJR19JU0NTSV9JQkZUX0ZJTkQgaXMg
bm90IHNldAojIENPTkZJR19HT09HTEVfRklSTVdBUkUgaXMgbm90IHNldAoKIwojIEZpbGUgc3lz
dGVtcwojCkNPTkZJR19EQ0FDSEVfV09SRF9BQ0NFU1M9eQojIENPTkZJR19GU19QT1NJWF9BQ0wg
aXMgbm90IHNldApDT05GSUdfRVhQT1JURlM9eQpDT05GSUdfRklMRV9MT0NLSU5HPXkKQ09ORklH
X0ZTTk9USUZZPXkKIyBDT05GSUdfRE5PVElGWSBpcyBub3Qgc2V0CkNPTkZJR19JTk9USUZZX1VT
RVI9eQpDT05GSUdfRkFOT1RJRlk9eQojIENPTkZJR19RVU9UQSBpcyBub3Qgc2V0CiMgQ09ORklH
X1FVT1RBQ1RMIGlzIG5vdCBzZXQKQ09ORklHX0FVVE9GUzRfRlM9eQpDT05GSUdfRlVTRV9GUz1t
CiMgQ09ORklHX0NVU0UgaXMgbm90IHNldApDT05GSUdfT1ZFUkxBWV9GUz15CgojCiMgQ2FjaGVz
CiMKQ09ORklHX0ZTQ0FDSEU9eQojIENPTkZJR19GU0NBQ0hFX1NUQVRTIGlzIG5vdCBzZXQKIyBD
T05GSUdfRlNDQUNIRV9ISVNUT0dSQU0gaXMgbm90IHNldApDT05GSUdfRlNDQUNIRV9ERUJVRz15
CiMgQ09ORklHX0ZTQ0FDSEVfT0JKRUNUX0xJU1QgaXMgbm90IHNldAoKIwojIFBzZXVkbyBmaWxl
c3lzdGVtcwojCkNPTkZJR19QUk9DX0ZTPXkKIyBDT05GSUdfUFJPQ19LQ09SRSBpcyBub3Qgc2V0
CkNPTkZJR19QUk9DX1NZU0NUTD15CkNPTkZJR19QUk9DX1BBR0VfTU9OSVRPUj15CkNPTkZJR19Q
Uk9DX0NISUxEUkVOPXkKQ09ORklHX0tFUk5GUz15CkNPTkZJR19TWVNGUz15CiMgQ09ORklHX0hV
R0VUTEJGUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hVR0VUTEJfUEFHRSBpcyBub3Qgc2V0CkNPTkZJ
R19DT05GSUdGU19GUz15CiMgQ09ORklHX01JU0NfRklMRVNZU1RFTVMgaXMgbm90IHNldApDT05G
SUdfTkVUV09SS19GSUxFU1lTVEVNUz15CkNPTkZJR19OTFM9eQpDT05GSUdfTkxTX0RFRkFVTFQ9
Imlzbzg4NTktMSIKIyBDT05GSUdfTkxTX0NPREVQQUdFXzQzNyBpcyBub3Qgc2V0CiMgQ09ORklH
X05MU19DT0RFUEFHRV83MzcgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfNzc1IGlz
IG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg1MCBpcyBub3Qgc2V0CiMgQ09ORklHX05M
U19DT0RFUEFHRV84NTIgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODU1IGlzIG5v
dCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg1NyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19D
T0RFUEFHRV84NjAgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODYxIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg2MiBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RF
UEFHRV84NjMgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODY0IGlzIG5vdCBzZXQK
IyBDT05GSUdfTkxTX0NPREVQQUdFXzg2NSBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFH
RV84NjYgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODY5IGlzIG5vdCBzZXQKIyBD
T05GSUdfTkxTX0NPREVQQUdFXzkzNiBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV85
NTAgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfOTMyIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkxTX0NPREVQQUdFXzk0OSBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV84NzQg
aXMgbm90IHNldAojIENPTkZJR19OTFNfSVNPODg1OV84IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxT
X0NPREVQQUdFXzEyNTAgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfMTI1MSBpcyBu
b3Qgc2V0CiMgQ09ORklHX05MU19BU0NJSSBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5
XzEgaXMgbm90IHNldAojIENPTkZJR19OTFNfSVNPODg1OV8yIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkxTX0lTTzg4NTlfMyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5XzQgaXMgbm90IHNl
dAojIENPTkZJR19OTFNfSVNPODg1OV81IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlf
NiBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5XzcgaXMgbm90IHNldAojIENPTkZJR19O
TFNfSVNPODg1OV85IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlfMTMgaXMgbm90IHNl
dAojIENPTkZJR19OTFNfSVNPODg1OV8xNCBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5
XzE1IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0tPSThfUiBpcyBub3Qgc2V0CiMgQ09ORklHX05M
U19LT0k4X1UgaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFDX1JPTUFOIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkxTX01BQ19DRUxUSUMgaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFDX0NFTlRFVVJP
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19DUk9BVElBTiBpcyBub3Qgc2V0CiMgQ09ORklH
X05MU19NQUNfQ1lSSUxMSUMgaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFDX0dBRUxJQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX05MU19NQUNfR1JFRUsgaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFD
X0lDRUxBTkQgaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFDX0lOVUlUIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkxTX01BQ19ST01BTklBTiBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19NQUNfVFVSS0lT
SCBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19VVEY4IGlzIG5vdCBzZXQKCiMKIyBLZXJuZWwgaGFj
a2luZwojCkNPTkZJR19UUkFDRV9JUlFGTEFHU19TVVBQT1JUPXkKCiMKIyBwcmludGsgYW5kIGRt
ZXNnIG9wdGlvbnMKIwpDT05GSUdfUFJJTlRLX1RJTUU9eQpDT05GSUdfTUVTU0FHRV9MT0dMRVZF
TF9ERUZBVUxUPTQKIyBDT05GSUdfQk9PVF9QUklOVEtfREVMQVkgaXMgbm90IHNldAojIENPTkZJ
R19EWU5BTUlDX0RFQlVHIGlzIG5vdCBzZXQKCiMKIyBDb21waWxlLXRpbWUgY2hlY2tzIGFuZCBj
b21waWxlciBvcHRpb25zCiMKIyBDT05GSUdfREVCVUdfSU5GTyBpcyBub3Qgc2V0CkNPTkZJR19F
TkFCTEVfV0FSTl9ERVBSRUNBVEVEPXkKIyBDT05GSUdfRU5BQkxFX01VU1RfQ0hFQ0sgaXMgbm90
IHNldApDT05GSUdfRlJBTUVfV0FSTj0xMDI0CiMgQ09ORklHX1NUUklQX0FTTV9TWU1TIGlzIG5v
dCBzZXQKQ09ORklHX1JFQURBQkxFX0FTTT15CkNPTkZJR19VTlVTRURfU1lNQk9MUz15CiMgQ09O
RklHX1BBR0VfT1dORVIgaXMgbm90IHNldApDT05GSUdfREVCVUdfRlM9eQpDT05GSUdfSEVBREVS
U19DSEVDSz15CkNPTkZJR19ERUJVR19TRUNUSU9OX01JU01BVENIPXkKQ09ORklHX1NFQ1RJT05f
TUlTTUFUQ0hfV0FSTl9PTkxZPXkKQ09ORklHX0FSQ0hfV0FOVF9GUkFNRV9QT0lOVEVSUz15CkNP
TkZJR19GUkFNRV9QT0lOVEVSPXkKQ09ORklHX0RFQlVHX0ZPUkNFX1dFQUtfUEVSX0NQVT15CiMg
Q09ORklHX01BR0lDX1NZU1JRIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX0tFUk5FTD15CgojCiMg
TWVtb3J5IERlYnVnZ2luZwojCkNPTkZJR19QQUdFX0VYVEVOU0lPTj15CiMgQ09ORklHX0RFQlVH
X1BBR0VBTExPQyBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19PQkpFQ1RTPXkKIyBDT05GSUdfREVC
VUdfT0JKRUNUU19TRUxGVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19PQkpFQ1RTX0ZSRUU9
eQpDT05GSUdfREVCVUdfT0JKRUNUU19USU1FUlM9eQpDT05GSUdfREVCVUdfT0JKRUNUU19XT1JL
PXkKQ09ORklHX0RFQlVHX09CSkVDVFNfUkNVX0hFQUQ9eQpDT05GSUdfREVCVUdfT0JKRUNUU19Q
RVJDUFVfQ09VTlRFUj15CkNPTkZJR19ERUJVR19PQkpFQ1RTX0VOQUJMRV9ERUZBVUxUPTEKIyBD
T05GSUdfU0xVQl9ERUJVR19PTiBpcyBub3Qgc2V0CkNPTkZJR19TTFVCX1NUQVRTPXkKQ09ORklH
X0hBVkVfREVCVUdfS01FTUxFQUs9eQojIENPTkZJR19ERUJVR19LTUVNTEVBSyBpcyBub3Qgc2V0
CkNPTkZJR19ERUJVR19TVEFDS19VU0FHRT15CkNPTkZJR19ERUJVR19WTT15CiMgQ09ORklHX0RF
QlVHX1ZNX1ZNQUNBQ0hFIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX1ZNX1JCPXkKQ09ORklHX0RF
QlVHX1ZJUlRVQUw9eQojIENPTkZJR19ERUJVR19NRU1PUllfSU5JVCBpcyBub3Qgc2V0CkNPTkZJ
R19ERUJVR19QRVJfQ1BVX01BUFM9eQpDT05GSUdfSEFWRV9ERUJVR19TVEFDS09WRVJGTE9XPXkK
Q09ORklHX0RFQlVHX1NUQUNLT1ZFUkZMT1c9eQpDT05GSUdfSEFWRV9BUkNIX0tNRU1DSEVDSz15
CkNPTkZJR19ERUJVR19TSElSUT15CgojCiMgRGVidWcgTG9ja3VwcyBhbmQgSGFuZ3MKIwpDT05G
SUdfTE9DS1VQX0RFVEVDVE9SPXkKQ09ORklHX0hBUkRMT0NLVVBfREVURUNUT1I9eQojIENPTkZJ
R19CT09UUEFSQU1fSEFSRExPQ0tVUF9QQU5JQyBpcyBub3Qgc2V0CkNPTkZJR19CT09UUEFSQU1f
SEFSRExPQ0tVUF9QQU5JQ19WQUxVRT0wCiMgQ09ORklHX0JPT1RQQVJBTV9TT0ZUTE9DS1VQX1BB
TklDIGlzIG5vdCBzZXQKQ09ORklHX0JPT1RQQVJBTV9TT0ZUTE9DS1VQX1BBTklDX1ZBTFVFPTAK
Q09ORklHX0RFVEVDVF9IVU5HX1RBU0s9eQpDT05GSUdfREVGQVVMVF9IVU5HX1RBU0tfVElNRU9V
VD0xMjAKQ09ORklHX0JPT1RQQVJBTV9IVU5HX1RBU0tfUEFOSUM9eQpDT05GSUdfQk9PVFBBUkFN
X0hVTkdfVEFTS19QQU5JQ19WQUxVRT0xCkNPTkZJR19QQU5JQ19PTl9PT1BTPXkKQ09ORklHX1BB
TklDX09OX09PUFNfVkFMVUU9MQpDT05GSUdfUEFOSUNfVElNRU9VVD0wCkNPTkZJR19TQ0hFRF9E
RUJVRz15CiMgQ09ORklHX1NDSEVEX0lORk8gaXMgbm90IHNldAojIENPTkZJR19TQ0hFRFNUQVRT
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0NIRURfU1RBQ0tfRU5EX0NIRUNLIGlzIG5vdCBzZXQKIyBD
T05GSUdfREVCVUdfVElNRUtFRVBJTkcgaXMgbm90IHNldAojIENPTkZJR19USU1FUl9TVEFUUyBp
cyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1BSRUVNUFQgaXMgbm90IHNldAoKIwojIExvY2sgRGVi
dWdnaW5nIChzcGlubG9ja3MsIG11dGV4ZXMsIGV0Yy4uLikKIwpDT05GSUdfREVCVUdfUlRfTVVU
RVhFUz15CkNPTkZJR19ERUJVR19TUElOTE9DSz15CkNPTkZJR19ERUJVR19NVVRFWEVTPXkKIyBD
T05GSUdfREVCVUdfV1dfTVVURVhfU0xPV1BBVEggaXMgbm90IHNldAojIENPTkZJR19ERUJVR19M
T0NLX0FMTE9DIGlzIG5vdCBzZXQKIyBDT05GSUdfUFJPVkVfTE9DS0lORyBpcyBub3Qgc2V0CiMg
Q09ORklHX0xPQ0tfU1RBVCBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19BVE9NSUNfU0xFRVA9eQpD
T05GSUdfREVCVUdfTE9DS0lOR19BUElfU0VMRlRFU1RTPXkKQ09ORklHX0xPQ0tfVE9SVFVSRV9U
RVNUPXkKQ09ORklHX1NUQUNLVFJBQ0U9eQojIENPTkZJR19ERUJVR19LT0JKRUNUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfREVCVUdfS09CSkVDVF9SRUxFQVNFIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVH
X0JVR1ZFUkJPU0U9eQpDT05GSUdfREVCVUdfTElTVD15CiMgQ09ORklHX0RFQlVHX1BJX0xJU1Qg
aXMgbm90IHNldApDT05GSUdfREVCVUdfU0c9eQpDT05GSUdfREVCVUdfTk9USUZJRVJTPXkKIyBD
T05GSUdfREVCVUdfQ1JFREVOVElBTFMgaXMgbm90IHNldAoKIwojIFJDVSBEZWJ1Z2dpbmcKIwoj
IENPTkZJR19QUk9WRV9SQ1UgaXMgbm90IHNldApDT05GSUdfU1BBUlNFX1JDVV9QT0lOVEVSPXkK
Q09ORklHX1RPUlRVUkVfVEVTVD15CiMgQ09ORklHX1JDVV9UT1JUVVJFX1RFU1QgaXMgbm90IHNl
dApDT05GSUdfUkNVX0NQVV9TVEFMTF9USU1FT1VUPTIxCiMgQ09ORklHX1JDVV9UUkFDRSBpcyBu
b3Qgc2V0CkNPTkZJR19SQ1VfRVFTX0RFQlVHPXkKQ09ORklHX05PVElGSUVSX0VSUk9SX0lOSkVD
VElPTj1tCkNPTkZJR19DUFVfTk9USUZJRVJfRVJST1JfSU5KRUNUPW0KQ09ORklHX0ZBVUxUX0lO
SkVDVElPTj15CkNPTkZJR19GQUlMU0xBQj15CiMgQ09ORklHX0ZBSUxfUEFHRV9BTExPQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0ZBSUxfTU1DX1JFUVVFU1QgaXMgbm90IHNldAojIENPTkZJR19GQUlM
X0ZVVEVYIGlzIG5vdCBzZXQKQ09ORklHX0ZBVUxUX0lOSkVDVElPTl9ERUJVR19GUz15CkNPTkZJ
R19GQVVMVF9JTkpFQ1RJT05fU1RBQ0tUUkFDRV9GSUxURVI9eQojIENPTkZJR19MQVRFTkNZVE9Q
IGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX0RFQlVHX1NUUklDVF9VU0VSX0NPUFlfQ0hFQ0tT
PXkKIyBDT05GSUdfREVCVUdfU1RSSUNUX1VTRVJfQ09QWV9DSEVDS1MgaXMgbm90IHNldApDT05G
SUdfVVNFUl9TVEFDS1RSQUNFX1NVUFBPUlQ9eQpDT05GSUdfSEFWRV9GVU5DVElPTl9UUkFDRVI9
eQpDT05GSUdfSEFWRV9GVU5DVElPTl9HUkFQSF9UUkFDRVI9eQpDT05GSUdfSEFWRV9GVU5DVElP
Tl9HUkFQSF9GUF9URVNUPXkKQ09ORklHX0hBVkVfRFlOQU1JQ19GVFJBQ0U9eQpDT05GSUdfSEFW
RV9EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1M9eQpDT05GSUdfSEFWRV9GVFJBQ0VfTUNPVU5UX1JF
Q09SRD15CkNPTkZJR19IQVZFX1NZU0NBTExfVFJBQ0VQT0lOVFM9eQpDT05GSUdfSEFWRV9DX1JF
Q09SRE1DT1VOVD15CkNPTkZJR19UUkFDRV9DTE9DSz15CkNPTkZJR19SSU5HX0JVRkZFUj15CkNP
TkZJR19SSU5HX0JVRkZFUl9BTExPV19TV0FQPXkKQ09ORklHX1RSQUNJTkdfU1VQUE9SVD15CiMg
Q09ORklHX0ZUUkFDRSBpcyBub3Qgc2V0CgojCiMgUnVudGltZSBUZXN0aW5nCiMKQ09ORklHX1RF
U1RfTElTVF9TT1JUPXkKIyBDT05GSUdfQkFDS1RSQUNFX1NFTEZfVEVTVCBpcyBub3Qgc2V0CkNP
TkZJR19SQlRSRUVfVEVTVD1tCkNPTkZJR19JTlRFUlZBTF9UUkVFX1RFU1Q9bQpDT05GSUdfUEVS
Q1BVX1RFU1Q9bQojIENPTkZJR19BVE9NSUM2NF9TRUxGVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklH
X1RFU1RfSEVYRFVNUCBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfU1RSSU5HX0hFTFBFUlMgaXMg
bm90IHNldApDT05GSUdfVEVTVF9LU1RSVE9YPW0KQ09ORklHX1RFU1RfUFJJTlRGPXkKQ09ORklH
X1RFU1RfUkhBU0hUQUJMRT1tCiMgQ09ORklHX1BST1ZJREVfT0hDSTEzOTRfRE1BX0lOSVQgaXMg
bm90IHNldApDT05GSUdfQlVJTERfRE9DU1JDPXkKIyBDT05GSUdfRE1BX0FQSV9ERUJVRyBpcyBu
b3Qgc2V0CkNPTkZJR19URVNUX0xLTT1tCkNPTkZJR19URVNUX1VTRVJfQ09QWT1tCiMgQ09ORklH
X1RFU1RfQlBGIGlzIG5vdCBzZXQKQ09ORklHX1RFU1RfRklSTVdBUkU9eQpDT05GSUdfVEVTVF9V
REVMQVk9bQpDT05GSUdfTUVNVEVTVD15CkNPTkZJR19URVNUX1NUQVRJQ19LRVlTPW0KIyBDT05G
SUdfU0FNUExFUyBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0FSQ0hfS0dEQj15CiMgQ09ORklHX0tH
REIgaXMgbm90IHNldAojIENPTkZJR19TVFJJQ1RfREVWTUVNIGlzIG5vdCBzZXQKQ09ORklHX1g4
Nl9WRVJCT1NFX0JPT1RVUD15CiMgQ09ORklHX0VBUkxZX1BSSU5USyBpcyBub3Qgc2V0CkNPTkZJ
R19YODZfUFREVU1QX0NPUkU9eQpDT05GSUdfWDg2X1BURFVNUD15CiMgQ09ORklHX0RFQlVHX1JP
REFUQSBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1NFVF9NT0RVTEVfUk9OWCBpcyBub3Qgc2V0
CkNPTkZJR19ERUJVR19OWF9URVNUPW0KIyBDT05GSUdfRE9VQkxFRkFVTFQgaXMgbm90IHNldAoj
IENPTkZJR19ERUJVR19UTEJGTFVTSCBpcyBub3Qgc2V0CkNPTkZJR19JT01NVV9TVFJFU1M9eQpD
T05GSUdfSEFWRV9NTUlPVFJBQ0VfU1VQUE9SVD15CkNPTkZJR19JT19ERUxBWV9UWVBFXzBYODA9
MApDT05GSUdfSU9fREVMQVlfVFlQRV8wWEVEPTEKQ09ORklHX0lPX0RFTEFZX1RZUEVfVURFTEFZ
PTIKQ09ORklHX0lPX0RFTEFZX1RZUEVfTk9ORT0zCiMgQ09ORklHX0lPX0RFTEFZXzBYODAgaXMg
bm90IHNldApDT05GSUdfSU9fREVMQVlfMFhFRD15CiMgQ09ORklHX0lPX0RFTEFZX1VERUxBWSBp
cyBub3Qgc2V0CiMgQ09ORklHX0lPX0RFTEFZX05PTkUgaXMgbm90IHNldApDT05GSUdfREVGQVVM
VF9JT19ERUxBWV9UWVBFPTEKQ09ORklHX0RFQlVHX0JPT1RfUEFSQU1TPXkKIyBDT05GSUdfQ1BB
X0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX09QVElNSVpFX0lOTElOSU5HPXkKQ09ORklHX0RFQlVH
X0VOVFJZPXkKQ09ORklHX0RFQlVHX05NSV9TRUxGVEVTVD15CkNPTkZJR19YODZfREVCVUdfU1RB
VElDX0NQVV9IQVM9eQpDT05GSUdfWDg2X0RFQlVHX0ZQVT15CiMgQ09ORklHX1BVTklUX0FUT01f
REVCVUcgaXMgbm90IHNldAoKIwojIFNlY3VyaXR5IG9wdGlvbnMKIwpDT05GSUdfS0VZUz15CkNP
TkZJR19QRVJTSVNURU5UX0tFWVJJTkdTPXkKQ09ORklHX1RSVVNURURfS0VZUz1tCkNPTkZJR19F
TkNSWVBURURfS0VZUz15CiMgQ09ORklHX1NFQ1VSSVRZX0RNRVNHX1JFU1RSSUNUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VDVVJJVFkgaXMgbm90IHNldApDT05GSUdfU0VDVVJJVFlGUz15CkNPTkZJ
R19ERUZBVUxUX1NFQ1VSSVRZX0RBQz15CkNPTkZJR19ERUZBVUxUX1NFQ1VSSVRZPSIiCkNPTkZJ
R19DUllQVE89eQoKIwojIENyeXB0byBjb3JlIG9yIGhlbHBlcgojCkNPTkZJR19DUllQVE9fQUxH
QVBJPXkKQ09ORklHX0NSWVBUT19BTEdBUEkyPXkKQ09ORklHX0NSWVBUT19BRUFEPXkKQ09ORklH
X0NSWVBUT19BRUFEMj15CkNPTkZJR19DUllQVE9fQkxLQ0lQSEVSPXkKQ09ORklHX0NSWVBUT19C
TEtDSVBIRVIyPXkKQ09ORklHX0NSWVBUT19IQVNIPXkKQ09ORklHX0NSWVBUT19IQVNIMj15CkNP
TkZJR19DUllQVE9fUk5HPXkKQ09ORklHX0NSWVBUT19STkcyPXkKQ09ORklHX0NSWVBUT19STkdf
REVGQVVMVD15CkNPTkZJR19DUllQVE9fUENPTVA9eQpDT05GSUdfQ1JZUFRPX1BDT01QMj15CkNP
TkZJR19DUllQVE9fQUtDSVBIRVIyPXkKQ09ORklHX0NSWVBUT19BS0NJUEhFUj1tCkNPTkZJR19D
UllQVE9fUlNBPW0KQ09ORklHX0NSWVBUT19NQU5BR0VSPXkKQ09ORklHX0NSWVBUT19NQU5BR0VS
Mj15CiMgQ09ORklHX0NSWVBUT19VU0VSIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19NQU5BR0VS
X0RJU0FCTEVfVEVTVFM9eQpDT05GSUdfQ1JZUFRPX0dGMTI4TVVMPXkKQ09ORklHX0NSWVBUT19O
VUxMPXkKQ09ORklHX0NSWVBUT19OVUxMMj15CkNPTkZJR19DUllQVE9fUENSWVBUPW0KQ09ORklH
X0NSWVBUT19XT1JLUVVFVUU9eQpDT05GSUdfQ1JZUFRPX0NSWVBURD15CkNPTkZJR19DUllQVE9f
TUNSWVBURD1tCkNPTkZJR19DUllQVE9fQVVUSEVOQz15CiMgQ09ORklHX0NSWVBUT19URVNUIGlz
IG5vdCBzZXQKQ09ORklHX0NSWVBUT19BQkxLX0hFTFBFUj15CkNPTkZJR19DUllQVE9fR0xVRV9I
RUxQRVJfWDg2PXkKCiMKIyBBdXRoZW50aWNhdGVkIEVuY3J5cHRpb24gd2l0aCBBc3NvY2lhdGVk
IERhdGEKIwpDT05GSUdfQ1JZUFRPX0NDTT15CiMgQ09ORklHX0NSWVBUT19HQ00gaXMgbm90IHNl
dApDT05GSUdfQ1JZUFRPX0NIQUNIQTIwUE9MWTEzMDU9eQpDT05GSUdfQ1JZUFRPX1NFUUlWPXkK
IyBDT05GSUdfQ1JZUFRPX0VDSEFJTklWIGlzIG5vdCBzZXQKCiMKIyBCbG9jayBtb2RlcwojCkNP
TkZJR19DUllQVE9fQ0JDPXkKQ09ORklHX0NSWVBUT19DVFI9eQpDT05GSUdfQ1JZUFRPX0NUUz1t
CkNPTkZJR19DUllQVE9fRUNCPXkKQ09ORklHX0NSWVBUT19MUlc9eQpDT05GSUdfQ1JZUFRPX1BD
QkM9bQpDT05GSUdfQ1JZUFRPX1hUUz15CkNPTkZJR19DUllQVE9fS0VZV1JBUD15CgojCiMgSGFz
aCBtb2RlcwojCiMgQ09ORklHX0NSWVBUT19DTUFDIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19I
TUFDPXkKQ09ORklHX0NSWVBUT19YQ0JDPXkKIyBDT05GSUdfQ1JZUFRPX1ZNQUMgaXMgbm90IHNl
dAoKIwojIERpZ2VzdAojCkNPTkZJR19DUllQVE9fQ1JDMzJDPXkKQ09ORklHX0NSWVBUT19DUkMz
MkNfSU5URUw9eQpDT05GSUdfQ1JZUFRPX0NSQzMyPW0KQ09ORklHX0NSWVBUT19DUkMzMl9QQ0xN
VUw9eQpDT05GSUdfQ1JZUFRPX0NSQ1QxMERJRj15CkNPTkZJR19DUllQVE9fR0hBU0g9eQpDT05G
SUdfQ1JZUFRPX1BPTFkxMzA1PXkKQ09ORklHX0NSWVBUT19NRDQ9eQpDT05GSUdfQ1JZUFRPX01E
NT1tCkNPTkZJR19DUllQVE9fTUlDSEFFTF9NSUM9bQojIENPTkZJR19DUllQVE9fUk1EMTI4IGlz
IG5vdCBzZXQKQ09ORklHX0NSWVBUT19STUQxNjA9eQpDT05GSUdfQ1JZUFRPX1JNRDI1Nj15CkNP
TkZJR19DUllQVE9fUk1EMzIwPW0KQ09ORklHX0NSWVBUT19TSEExPW0KQ09ORklHX0NSWVBUT19T
SEEyNTY9eQpDT05GSUdfQ1JZUFRPX1NIQTUxMj1tCiMgQ09ORklHX0NSWVBUT19UR1IxOTIgaXMg
bm90IHNldApDT05GSUdfQ1JZUFRPX1dQNTEyPW0KCiMKIyBDaXBoZXJzCiMKQ09ORklHX0NSWVBU
T19BRVM9eQpDT05GSUdfQ1JZUFRPX0FFU181ODY9bQpDT05GSUdfQ1JZUFRPX0FFU19OSV9JTlRF
TD1tCkNPTkZJR19DUllQVE9fQU5VQklTPXkKQ09ORklHX0NSWVBUT19BUkM0PW0KQ09ORklHX0NS
WVBUT19CTE9XRklTSD1tCkNPTkZJR19DUllQVE9fQkxPV0ZJU0hfQ09NTU9OPW0KIyBDT05GSUdf
Q1JZUFRPX0NBTUVMTElBIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19DQVNUX0NPTU1PTj1tCkNP
TkZJR19DUllQVE9fQ0FTVDU9bQojIENPTkZJR19DUllQVE9fQ0FTVDYgaXMgbm90IHNldApDT05G
SUdfQ1JZUFRPX0RFUz15CkNPTkZJR19DUllQVE9fRkNSWVBUPXkKIyBDT05GSUdfQ1JZUFRPX0tI
QVpBRCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19TQUxTQTIwIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ1JZUFRPX1NBTFNBMjBfNTg2IGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19DSEFDSEEyMD15
CkNPTkZJR19DUllQVE9fU0VFRD15CkNPTkZJR19DUllQVE9fU0VSUEVOVD15CkNPTkZJR19DUllQ
VE9fU0VSUEVOVF9TU0UyXzU4Nj15CkNPTkZJR19DUllQVE9fVEVBPW0KQ09ORklHX0NSWVBUT19U
V09GSVNIPXkKQ09ORklHX0NSWVBUT19UV09GSVNIX0NPTU1PTj15CkNPTkZJR19DUllQVE9fVFdP
RklTSF81ODY9bQoKIwojIENvbXByZXNzaW9uCiMKQ09ORklHX0NSWVBUT19ERUZMQVRFPW0KQ09O
RklHX0NSWVBUT19aTElCPXkKQ09ORklHX0NSWVBUT19MWk89eQpDT05GSUdfQ1JZUFRPXzg0Mj1t
CiMgQ09ORklHX0NSWVBUT19MWjQgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fTFo0SEMgaXMg
bm90IHNldAoKIwojIFJhbmRvbSBOdW1iZXIgR2VuZXJhdGlvbgojCiMgQ09ORklHX0NSWVBUT19B
TlNJX0NQUk5HIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19EUkJHX01FTlU9eQpDT05GSUdfQ1JZ
UFRPX0RSQkdfSE1BQz15CkNPTkZJR19DUllQVE9fRFJCR19IQVNIPXkKQ09ORklHX0NSWVBUT19E
UkJHX0NUUj15CkNPTkZJR19DUllQVE9fRFJCRz15CkNPTkZJR19DUllQVE9fSklUVEVSRU5UUk9Q
WT15CiMgQ09ORklHX0NSWVBUT19VU0VSX0FQSV9IQVNIIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZ
UFRPX1VTRVJfQVBJX1NLQ0lQSEVSIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1VTRVJfQVBJ
X1JORyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19VU0VSX0FQSV9BRUFEIGlzIG5vdCBzZXQK
Q09ORklHX0NSWVBUT19IQVNIX0lORk89eQojIENPTkZJR19DUllQVE9fSFcgaXMgbm90IHNldApD
T05GSUdfQVNZTU1FVFJJQ19LRVlfVFlQRT15CkNPTkZJR19BU1lNTUVUUklDX1BVQkxJQ19LRVlf
U1VCVFlQRT15CkNPTkZJR19QVUJMSUNfS0VZX0FMR09fUlNBPXkKQ09ORklHX1g1MDlfQ0VSVElG
SUNBVEVfUEFSU0VSPXkKQ09ORklHX1BLQ1M3X01FU1NBR0VfUEFSU0VSPXkKQ09ORklHX1BLQ1M3
X1RFU1RfS0VZPW0KQ09ORklHX1NJR05FRF9QRV9GSUxFX1ZFUklGSUNBVElPTj15CgojCiMgQ2Vy
dGlmaWNhdGVzIGZvciBzaWduYXR1cmUgY2hlY2tpbmcKIwpDT05GSUdfU1lTVEVNX1RSVVNURURf
S0VZUklORz15CkNPTkZJR19TWVNURU1fVFJVU1RFRF9LRVlTPSIiCkNPTkZJR19IQVZFX0tWTT15
CkNPTkZJR19WSVJUVUFMSVpBVElPTj15CiMgQ09ORklHX0xHVUVTVCBpcyBub3Qgc2V0CiMgQ09O
RklHX0JJTkFSWV9QUklOVEYgaXMgbm90IHNldAoKIwojIExpYnJhcnkgcm91dGluZXMKIwpDT05G
SUdfQklUUkVWRVJTRT15CiMgQ09ORklHX0hBVkVfQVJDSF9CSVRSRVZFUlNFIGlzIG5vdCBzZXQK
Q09ORklHX1JBVElPTkFMPXkKQ09ORklHX0dFTkVSSUNfU1RSTkNQWV9GUk9NX1VTRVI9eQpDT05G
SUdfR0VORVJJQ19TVFJOTEVOX1VTRVI9eQpDT05GSUdfR0VORVJJQ19ORVRfVVRJTFM9eQpDT05G
SUdfR0VORVJJQ19GSU5EX0ZJUlNUX0JJVD15CkNPTkZJR19HRU5FUklDX1BDSV9JT01BUD15CkNP
TkZJR19HRU5FUklDX0lPTUFQPXkKQ09ORklHX0dFTkVSSUNfSU89eQpDT05GSUdfQVJDSF9IQVNf
RkFTVF9NVUxUSVBMSUVSPXkKQ09ORklHX0NSQ19DQ0lUVD15CkNPTkZJR19DUkMxNj15CkNPTkZJ
R19DUkNfVDEwRElGPXkKQ09ORklHX0NSQ19JVFVfVD15CkNPTkZJR19DUkMzMj15CiMgQ09ORklH
X0NSQzMyX1NFTEZURVNUIGlzIG5vdCBzZXQKQ09ORklHX0NSQzMyX1NMSUNFQlk4PXkKIyBDT05G
SUdfQ1JDMzJfU0xJQ0VCWTQgaXMgbm90IHNldAojIENPTkZJR19DUkMzMl9TQVJXQVRFIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ1JDMzJfQklUIGlzIG5vdCBzZXQKQ09ORklHX0NSQzc9eQpDT05GSUdf
TElCQ1JDMzJDPXkKQ09ORklHX0NSQzg9bQojIENPTkZJR19BVURJVF9BUkNIX0NPTVBBVF9HRU5F
UklDIGlzIG5vdCBzZXQKQ09ORklHX1JBTkRPTTMyX1NFTEZURVNUPXkKQ09ORklHXzg0Ml9DT01Q
UkVTUz1tCkNPTkZJR184NDJfREVDT01QUkVTUz1tCkNPTkZJR19aTElCX0lORkxBVEU9eQpDT05G
SUdfWkxJQl9ERUZMQVRFPXkKQ09ORklHX0xaT19DT01QUkVTUz15CkNPTkZJR19MWk9fREVDT01Q
UkVTUz15CkNPTkZJR19MWjRfREVDT01QUkVTUz15CkNPTkZJR19YWl9ERUM9eQpDT05GSUdfWFpf
REVDX1g4Nj15CkNPTkZJR19YWl9ERUNfUE9XRVJQQz15CiMgQ09ORklHX1haX0RFQ19JQTY0IGlz
IG5vdCBzZXQKIyBDT05GSUdfWFpfREVDX0FSTSBpcyBub3Qgc2V0CkNPTkZJR19YWl9ERUNfQVJN
VEhVTUI9eQpDT05GSUdfWFpfREVDX1NQQVJDPXkKQ09ORklHX1haX0RFQ19CQ0o9eQpDT05GSUdf
WFpfREVDX1RFU1Q9bQpDT05GSUdfREVDT01QUkVTU19HWklQPXkKQ09ORklHX0RFQ09NUFJFU1Nf
QlpJUDI9eQpDT05GSUdfREVDT01QUkVTU19YWj15CkNPTkZJR19ERUNPTVBSRVNTX0xaTz15CkNP
TkZJR19ERUNPTVBSRVNTX0xaND15CkNPTkZJR19HRU5FUklDX0FMTE9DQVRPUj15CkNPTkZJR19J
TlRFUlZBTF9UUkVFPXkKQ09ORklHX0FTU09DSUFUSVZFX0FSUkFZPXkKQ09ORklHX0hBU19JT01F
TT15CkNPTkZJR19IQVNfSU9QT1JUX01BUD15CkNPTkZJR19IQVNfRE1BPXkKQ09ORklHX0NIRUNL
X1NJR05BVFVSRT15CkNPTkZJR19DUFVNQVNLX09GRlNUQUNLPXkKQ09ORklHX0NQVV9STUFQPXkK
Q09ORklHX0RRTD15CkNPTkZJR19OTEFUVFI9eQpDT05GSUdfQVJDSF9IQVNfQVRPTUlDNjRfREVD
X0lGX1BPU0lUSVZFPXkKQ09ORklHX0NMWl9UQUI9eQojIENPTkZJR19DT1JESUMgaXMgbm90IHNl
dAojIENPTkZJR19ERFIgaXMgbm90IHNldApDT05GSUdfTVBJTElCPXkKQ09ORklHX09JRF9SRUdJ
U1RSWT15CiMgQ09ORklHX1NHX1NQTElUIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX1NHX0NI
QUlOPXkKQ09ORklHX0FSQ0hfSEFTX01NSU9fRkxVU0g9eQo=

--===============5810397636514969683==--

