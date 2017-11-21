Content-Type: multipart/mixed; boundary="===============0025018077637149829=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [migration_cpu_stop] WARNING: CPU: 0 PID: 11 at kernel/sched/core.c:1187 set_task_cpu+0x257/0x6b6
Date: Tue, 21 Nov 2017 08:13:35 -0800
Message-ID: <20171121161335.GI3624@linux.vnet.ibm.com>
In-Reply-To: <20171121135101.ibpbncnhjj6bnjzf@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0025018077637149829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2017 at 09:51:01PM +0800, Fengguang Wu wrote:
> On Tue, Nov 21, 2017 at 02:34:03PM +0100, Peter Zijlstra wrote:
> >On Tue, Nov 21, 2017 at 08:04:20PM +0800, Fengguang Wu wrote:
> >>Hello,
> >>
> >>FYI this happens in mainline kernel 4.14.0-00902-g43ff2f4.
> >>It happens since 4.13.
> >>
> >>It occurs in 7 out of 36 boots.
> >>
> >>[   58.171538] no ifx modem active;
> >>[   58.211860] ACPI: Preparing to enter system sleep state S5
> >>[   58.216823] reboot: Power down
> >>[   58.244526] acpi_power_off called
> >>[   61.460467] ------------[ cut here ]------------
> >>[   61.465481] WARNING: CPU: 0 PID: 11 at kernel/sched/core.c:1187 set_=
task_cpu+0x257/0x6b6:
> >>						set_task_cpu at kernel/sched/core.c:1187
> >
> >Never seen that before.. but I can't even figure out how CPUs end up
> >offline in that reboot path :/
> >
> >So far I just get lost in the callback maze... Rafael any clues?
> =

> I noticed that it's doing rcu-perf testing before the warning.
> And it's immediately followed by another warning:
> =

> [   61.653178] sched: Unexpected reschedule of offline CPU#1!
> [   61.658501] ------------[ cut here ]------------
> [   61.663130] WARNING: CPU: 0 PID: 11 at arch/x86/kernel/smp.c:128 nativ=
e_smp_send_reschedule+0x59/0xbf
> [   61.673690] Modules linked in:
> [   61.676737] CPU: 0 PID: 11 Comm: migration/0 Tainted: G        W      =
 4.14.0-00902-g43ff2f4 #1
> [   61.684975] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   61.692977] task: ffff880016c00000 task.stack: ffff880016c08000
> [   61.698610] RIP: 0010:native_smp_send_reschedule+0x59/0xbf
> [   61.703900] RSP: 0018:ffff880016c0fc68 EFLAGS: 00010086
> [   61.710817] RAX: 000000000000002e RBX: 0000000000000001 RCX: 000000000=
0000000
> [   61.721649] RDX: 000000000000002e RSI: 0000000000000003 RDI: ffffed000=
2d81f83
> [   61.732727] RBP: ffff88000ac94640 R08: 0000000000000001 R09: 000000000=
0000001
> [   61.743330] R10: ffff880016c0fbc8 R11: 0000000000000001 R12: ffff88000=
e54c800
> [   61.753861] R13: dffffc0000000000 R14: ffff8800177e0700 R15: 000000000=
0000000
> [   61.764513] FS:  0000000000000000(0000) GS:ffff880017400000(0000) knlG=
S:0000000000000000
> [   61.776370] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   61.785022] CR2: 00007f3eca6152c0 CR3: 0000000007a15003 CR4: 000000000=
00206b0
> [   61.797309] Call Trace:
> [   61.801165]  check_preempt_wakeup+0x386/0x5aa
> [   61.807806]  check_preempt_curr+0xe3/0x22e
> [   61.814220]  move_queued_task+0x39b/0x3ab
> [   61.820415]  migration_cpu_stop+0x216/0x2f2
> [   61.826797]  ? sched_ttwu_pending+0x1fd/0x1fd
> [   61.833542]  ? lock_acquire+0xed/0x14b
> [   61.838654]  ? sched_ttwu_pending+0x1fd/0x1fd
> [   61.844336]  cpu_stopper_thread+0x1c9/0x25e
> [   61.849812]  ? cpu_stop_create+0x6a/0x6a
> [   61.855049]  smpboot_thread_fn+0x615/0x64b
> [   61.860459]  ? sort_range+0x17/0x17
> [   61.863922]  ? schedule+0x16e/0x190
> [   61.867626]  kthread+0x365/0x374
> [   61.871029]  ? sort_range+0x17/0x17
> [   61.874491]  ? kthread_stop+0xc8/0xc8
> [   61.878189]  ret_from_fork+0x1f/0x30
> [   61.881912] Code: 74 05 e8 db c5 29 00 3b 1d 87 54 08 02 72 02 0f ff 8=
9 d8 48 0f a3 05 15 53 08 02 72 12 89 de 48 c7 c7 00 ac 42 a6 e8 07 00 11 0=
0 <0f> ff eb 5f 48 c7 c7 c0 56 a2 a6 48 b8 00 00 00 00 00 fc ff df
> [   61.900994] ---[ end trace 764cf6ead543b299 ]---
> =

> which we have bisect record for:

Which, by design, shuts down the system at the end of the test.

Don't get me wrong, I am quite happy for you guys to test rcuperf, but if
you do test it, the scaffolding either needs to suppress the end-of-test
shutdown or must recognize the end-of-test shutdown as normal behavior.
The people using rcuperf for its intended purpose are well-served by the
end-of-test shutdown, so I am not going to revert the commit shown below.
I need other testing to either stop testing rcuperf on the one hand or to
have their rcuperf tests account for expected rcuperf behavior on the other.

So how can we best resolve this?  =


							Thanx, Paul

> commit 492b95e59735998312f678d77a2d5fe20af6b0b9
> Author:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> AuthorDate: Fri Apr 21 16:09:15 2017 -0700
> Commit:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> CommitDate: Thu Jun 8 08:25:31 2017 -0700
> =

>    rcuperf: Set more user-friendly defaults
> =

>    Common-case use of rcuperf must set rcuperf.nreaders=3D0 and if not bu=
ilt
>    as a module, rcuperf.shutdown.  This commit therefore sets the default
>    for rcuperf.nreaders to zero and sets the default for rcuperf.shutdown
>    to zero if rcuperf is built as a module and to one otherwise.
> =

>    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> =

> 3ddf20c953  srcu: Shrink Tiny SRCU a bit more
> 492b95e597  rcuperf: Set more user-friendly defaults
> bb176f6709  Linux 4.14-rc6
> 36ef71cae3  Add linux-next specific files for 20171018
> +--------------------------------------------------------------+---------=
---+------------+-----------+---------------+
> |                                                              | 3ddf20c9=
53 | 492b95e597 | v4.14-rc6 | next-20171018 |
> +--------------------------------------------------------------+---------=
---+------------+-----------+---------------+
> | boot_successes                                               | 910     =
   | 21         | 199       | 60            |
> | boot_failures                                                | 0       =
   | 9          | 111       | 21            |
> | WARNING:at_arch/x86/kernel/smp.c:#native_smp_send_reschedule | 0       =
   | 9          | 111       | 21            |
> +--------------------------------------------------------------+---------=
---+------------+-----------+---------------+
> =

> [   29.173654] augmented rbtree testing
> [   32.263469]  -> 83223 cycles
> [   32.540332] gpio_it87: no device
> [   32.541422] sched: Unexpected reschedule of offline CPU#1!
> [   32.542355] ------------[ cut here ]------------
> [   32.543057] WARNING: CPU: 0 PID: 1 at arch/x86/kernel/smp.c:128 native=
_smp_send_reschedule+0x83/0xbb
> [   32.544646] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.12.0-rc4-00028=
-g492b95e #1
> [   32.545397] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   32.546381] task: ffff88001e2e0000 task.stack: ffff88001e2e8000
> [   32.547031] RIP: 0010:native_smp_send_reschedule+0x83/0xbb
> [   32.547642] RSP: 0000:ffff88001e2ebca0 EFLAGS: 00010086
> [   32.548225] RAX: 000000000000002e RBX: 0000000000000003 RCX: 000000000=
0000000
> [   32.548989] RDX: 0000002e00000001 RSI: 0000000000000000 RDI: 000000000=
0000096
> [   32.550034] RBP: ffff88001e2ebcb8 R08: 0000000000000003 R09: 000000000=
0000000
> [   32.551039] R10: ffff88001e2e0758 R11: 0000000000021001 R12: 000000000=
0000001
> [   32.551996] R13: 0000000000000000 R14: ffff88001e380000 R15: ffff88001=
e500000
> [   32.552727] FS:  0000000000000000(0000) GS:ffff88001e400000(0000) knlG=
S:0000000000000000
> [   32.553585] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   32.554227] CR2: 0000000000000000 CR3: 000000000260f000 CR4: 000000000=
00006b0
> [   32.555288] Call Trace:
> [   32.555687]  smp_send_reschedule+0xa/0xc
> [   32.556313]  try_to_wake_up+0x27e/0x2e4
> [   32.556870]  wake_up_process+0x15/0x17
> [   32.557374]  wake_up_worker+0x5f/0x6a
> [   32.557982]  pwq_adjust_max_active+0x154/0x191
> [   32.558444]  link_pwq+0xc3/0x10a
> [   32.558828]  __alloc_workqueue_key+0x325/0x695
> [   32.559288]  ? ftrace_likely_update+0x78/0x81
> [   32.559810]  ? pci_epf_init+0x52/0x52
> [   32.560222]  ? do_early_param+0xfd/0xfd
> [   32.560643]  pci_epf_test_init+0x30/0x7c
> [   32.561063]  ? pci_epf_init+0x52/0x52
> [   32.561431]  do_one_initcall+0xbc/0x1f7
> [   32.562099]  ? do_early_param+0xfd/0xfd
> [   32.562760]  kernel_init_freeable+0x13f/0x233
> [   32.563497]  ? rest_init+0xd6/0xd6
> [   32.564046]  kernel_init+0x14/0x1c5
> [   32.564565]  ? rest_init+0xd6/0xd6
> [   32.564987]  ret_from_fork+0x2a/0x40
> [   32.565345] Code: 00 00 31 d2 be 01 00 00 00 48 c7 c7 88 40 7d 82 e8 8=
c 48 18 00 44 89 e6 48 c7 c7 5a 68 3d 82 48 ff 05 70 78 87 01 e8 45 a5 1b 0=
0 <0f> ff b9 01 00 00 00 31 d2 be 01 00 00 00 48 c7 c7 58 40 7d 82
> [   32.568020] ---[ end trace 6590e27884081b3a ]---
> [   32.570056] VIA Graphics Integration Chipset framebuffer 2.4 initializ=
ing
> =

> Thanks,
> Fengguang
> =



--===============0025018077637149829==--

