Content-Type: multipart/mixed; boundary="===============8100520370352817747=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: 3472f16f83 ("workqueue: Use lockdep to assert IRQs are .."): WARNING: CPU: 0 PID: 561 at kernel/workqueue.c:1378 __queue_work
Date: Thu, 02 Nov 2017 05:56:41 +0100
Message-ID: <20171102045641.p36bm3kbpdm5ypqg@wfg-t540p.sh.intel.com>
In-Reply-To: <CAFTL4hyXRzPEzU5yjTbzZC0z7NSyULv2ULu5trrnXBWVew20AQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8100520370352817747==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Frederic,

On Wed, Nov 01, 2017 at 04:51:43PM +0100, Frederic Weisbecker wrote:
>2017-10-23 12:49 UTC+02:00, kernel test robot <fengguang.wu@intel.com>:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.=
git
>> lockdep/irq
>>
>> commit 3472f16f830323c2b6dd7e284a9113ea5a01ef4b
>> Author:     Frederic Weisbecker <fweisbec@gmail.com>
>> AuthorDate: Sun Sep 10 18:52:57 2017 +0200
>> Commit:     Frederic Weisbecker <fweisbec@gmail.com>
>> CommitDate: Thu Oct 19 18:02:44 2017 +0200
>>
>>     workqueue: Use lockdep to assert IRQs are disabled/enabled
>>
>>     Use lockdep to check that IRQs are enabled or disabled as expected.
>> This
>>     way the sanity check only shows overhead when concurrency correctness
>>     debug code is enabled.
>>
>>     Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
>>     Cc: Peter Zijlstra <peterz@infradead.org>
>>     Cc: Ingo Molnar <mingo@kernel.org>
>>     Cc: Thomas Gleixner <tglx@linutronix.de>
>>     Cc: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>>     Cc: Tejun Heo <tj@kernel.org>
>>     Cc: Lai Jiangshan <jiangshanlai@gmail.com>
>>
>> daf5751390  irq: Use lockdep to assert IRQs are disabled/enabled
>> 3472f16f83  workqueue: Use lockdep to assert IRQs are disabled/enabled
>> 1cb58314de  rcu: Use lockdep to assert IRQs are disabled/enabled
>> +-----------------------------------------------------------------+-----=
-------+------------+------------+
>> |                                                                 |
>> daf5751390 | 3472f16f83 | 1cb58314de |
>> +-----------------------------------------------------------------+-----=
-------+------------+------------+
>> | boot_successes                                                  | 35
>>   | 4          | 8          |
>> | boot_failures                                                   | 0
>>   | 11         | 11         |
>> | WARNING:at_kernel/workqueue.c:#__queue_work                     | 0
>>   | 11         | 11         |
>> | EIP:__queue_work                                                | 0
>>   | 11         | 11         |
>> | WARNING:at_kernel/softirq.c:#__local_bh_enable                  | 0
>>   | 11         | 11         |
>> | EIP:__local_bh_enable                                           | 0
>>   | 11         | 11         |
>> | EIP:queue_delayed_work_on                                       | 0
>>   | 11         | 11         |
>> | WARNING:at_kernel/rcu/tree.c:#rcu_irq_enter                     | 0
>>   | 0          | 11         |
>> | EIP:rcu_irq_enter                                               | 0
>>   | 0          | 11         |
>> | WARNING:at_kernel/sched/cputime.c:#irqtime_account_process_tick | 0
>>   | 0          | 11         |
>> | EIP:irqtime_account_process_tick                                | 0
>>   | 0          | 11         |
>> | WARNING:at_kernel/events/core.c:#perf_event_task_tick           | 0
>>   | 0          | 11         |
>> | EIP:perf_event_task_tick                                        | 0
>>   | 0          | 11         |
>> | WARNING:at_kernel/rcu/tree.c:#cpu_needs_another_gp              | 0
>>   | 0          | 11         |
>> | EIP:cpu_needs_another_gp                                        | 0
>>   | 0          | 11         |
>> | WARNING:at_kernel/rcu/tree.c:#rcu_irq_exit                      | 0
>>   | 0          | 11         |
>> | EIP:rcu_irq_exit                                                | 0
>>   | 0          | 11         |
>> | EIP:rcu_process_callbacks                                       | 0
>>   | 0          | 11         |
>> | WARNING:at_kernel/rcu/tree_plugin.h:#rcu_note_context_switch    | 0
>>   | 0          | 11         |
>> | EIP:rcu_note_context_switch                                     | 0
>>   | 0          | 11         |
>> +-----------------------------------------------------------------+-----=
-------+------------+------------+
>>
>> /etc/rcS.d/S03udev: line 72: /proc/sys/kernel/hotplug: No such file or
>> directory
>> [   26.744185] udevadm (208) used greatest stack depth: 6444 bytes left
>> [   27.105898] scsi_id (419) used greatest stack depth: 6240 bytes left
>> [   27.852941] IRQs not disabled as expected
>> [   27.853345] ------------[ cut here ]------------
>> [   27.853761] WARNING: CPU: 0 PID: 561 at kernel/workqueue.c:1378
>> __queue_work+0x863/0x88d
>> [   27.854640] CPU: 0 PID: 561 Comm: mount Not tainted
>> 4.14.0-rc4-00561-g3472f16 #1
>> [   27.855303] task: be750000 task.stack: be194000
>> [   27.855710] EIP: __queue_work+0x863/0x88d
>> [   27.856114] EFLAGS: 00010046 CPU: 0
>> [   27.856429] EAX: 0000001d EBX: 00000001 ECX: 00000001 EDX: 00000000
>> [   27.856984] ESI: c01a4e44 EDI: c1d30800 EBP: be195cb8 ESP: be195c94
>> [   27.857535]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
>> [   27.858015] CR0: 80050033 CR2: 098a9fb8 CR3: 0e05a000 CR4: 00000690
>> [   27.858567] Call Trace:
>> [   27.858794]  __queue_delayed_work+0x150/0x1b5
>> [   27.859189]  queue_delayed_work_on+0xc5/0x178
>> [   27.860109]  kblockd_schedule_delayed_work_on+0x11/0x16
>> [   27.860602]  __blk_mq_delay_run_hw_queue+0x1c7/0x1cf
>> [   27.861050]  blk_mq_run_hw_queue+0xd/0xf
>> [   27.861405]  blk_mq_make_request+0xc63/0xc6e
>> [   27.861791]  generic_make_request+0x14c/0x3df
>> [   27.862185]  ? mempool_alloc+0x8a/0x1b1
>> [   27.862531]  submit_bio+0x1b5/0x1ce
>> [   27.862847]  ? guard_bio_eod+0xdc/0x1c2
>> [   27.863196]  submit_bh_wbc+0x297/0x2a1
>> [   27.863532]  submit_bh+0xc/0xe
>> [   27.863810]  __bread_gfp+0xf3/0x16a
>> [   27.864129]  ntfs_fill_super+0x3fe/0x1370
>> [   27.864488]  mount_bdev+0x1ae/0x221
>> [   27.864802]  ntfs_mount+0x10/0x12
>> [   27.865114]  ? load_system_files+0xe26/0xe26
>> [   27.865498]  mount_fs+0x3a/0x166
>> [   27.865818]  vfs_kern_mount+0x97/0x1a2
>> [   27.866217]  do_mount+0xe93/0x12d3
>> [   27.866527]  ? strndup_user+0x77/0xa5
>> [   27.866859]  SyS_mount+0xd8/0xfc
>> [   27.867157]  do_int80_syscall_32+0xd9/0x3f7
>> [   27.867535]  entry_INT80_32+0x33/0x33
>> [   27.867865] EIP: 0x47f46fee
>> [   27.868123] EFLAGS: 00000282 CPU: 0
>> [   27.868437] EAX: ffffffda EBX: afa09f00 ECX: afa09f0c EDX: 0852e618
>> [   27.868995] ESI: 00008010 EDI: 00000000 EBP: 00000000 ESP: afa08ca0
>> [   27.869550]  DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b
>> [   27.870034] Code: 42 c6 05 9f 21 f4 b2 01 6a 01 31 c9 ba 01 00 00 00 =
b8
>> 70 47 f5 b2 e8 a0 44 0a 00 ff 05 18 45 01 b3 68 28 3b b1 b2 e8 bd c0 03 =
00
>> <0f> ff 6a 01 31 c9 ba 01 00 00 00 b8 58 47 f5 b2 e8 7b 44 0a 00
>> [   27.871736] ---[ end trace f2bbd97d0e69f1eb ]---
>> [   27.872202] IRQs not disabled as expected
>
>Hi,
>
>I've run the reproducer in attachment but it didn't trigger the
>warning. With the yocto initrd, it doesn't pass the root fs mount and
>the warning seem to happen at this stage or later in your logs. Am I
>missing an element from your reproducer environment? It seems to mount
>an NTFS volume...

Sorry it looks the initrd URL was wrong, would you try this?

rm yocto-trinity-i386.cgz
wget https://github.com/fengguang/reproduce-kernel-bug/raw/master/yocto/yoc=
to-trinity-i386.cgz

Thanks,
Fengguang

--===============8100520370352817747==--

