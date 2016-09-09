Content-Type: multipart/mixed; boundary="===============4661569276371802694=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/core] 3d26b7622f: BUG: unable to handle kernel NULL pointer dereference at 00000001
Date: Fri, 09 Sep 2016 10:26:50 +0800
Message-ID: <20160909022650.GB7131@yexl-desktop>
In-Reply-To: <427f9112-07e1-2a4d-55f4-93581a9d3ce5@kedacom.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4661569276371802694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, cheng hao,

On 09/09, chengchao wrote:
>Hi, xiaolong
>
>  where can I find the commit 3d26b7622f3bab689696900ffd33c6dd7849d7c2?

This is the commit by 0Day bot for your original email patch sent on Sep 05=
 where
both CONFIG_PREEMPT_NONE and CONFIG_PREEMPT_VOLUNTARY will turn the
logic on.

+/**
+ * the caller keeps task_on_rq_queued, so it's more suitable for
+ * sched_exec on the case when needs migration
+ */
+void stop_one_cpu_sync(unsigned int cpu, cpu_stop_fn_t fn, void *arg)
+{
+	struct cpu_stop_work work =3D { .fn =3D fn, .arg =3D arg, .done =3D NULL =
};
+
+	if (!cpu_stop_queue_work(cpu, &work))
+		return;
+
+#if defined(CONFIG_PREEMPT_NONE) || defined(CONFIG_PREEMPT_VOLUNTARY)
+	/*
+	 * CONFIG_PREEMPT doesn't need call schedule here, because
+	 * preempt_enable already does the similar thing when call
+	 * cpu_stop_queue_work
+	 */
+	schedule();
+#endif
+}
+

>  config-4.8.0-rc5-00001-g3d26b76:
># CONFIG_PREEMPT_NONE is not set
>CONFIG_PREEMPT_VOLUNTARY=3Dy
># CONFIG_PREEMPT is not set
>
>  the patch ("sched/core: simpler function for sched_exec migration") only=
 is on if CONFIG_PREEMPT_NONE=3Dy,
>so it doesn't cause the panic when CONFIG_PREEMPT_VOLUNTARY=3Dy.
>
>
>the latest patch is here:
>https://lkml.org/lkml/2016/9/7/819

Will you send a formal updated patch to LKML? Then 0day will auto capture
and test it.

Thanks,
Xiaolong

>
>int stop_one_cpu(unsigned int cpu, cpu_stop_fn_t fn, void *arg)
>{
>         struct cpu_stop_done done;
>         struct cpu_stop_work work =3D { .fn =3D fn, .arg =3D arg, .done =
=3D &done };
>
>         cpu_stop_init_done(&done, 1);
>         if (!cpu_stop_queue_work(cpu, &work))
>                 return -ENOENT;
>
>+#if defined(CONFIG_PREEMPT_NONE)
>+ 	  /*
>+          * let the stopper thread runs as soon as possible,
>+          * and keep current TASK_RUNNING.
>+          */
>+ 	scheudle();
>+#endif
>         wait_for_completion(&done.completion);
>         return done.ret;
>}
>
>Thanks,
>Cheng
>
>on 09/09/2016 09:39 AM, kernel test robot wrote:
>> =

>> FYI, we noticed the following commit:
>> =

>> https://github.com/0day-ci/linux cheng-chao/sched-core-simpler-function-=
for-sched_exec-migration/20160905-142452
>> commit 3d26b7622f3bab689696900ffd33c6dd7849d7c2 ("sched/core: simpler fu=
nction for sched_exec migration")
>> =

>> in testcase: trinity
>> with following parameters:
>> =

>> 	runtime: 300s
>> =

>> =

>> =

>> =

>> on test machine: qemu-system-i386 -enable-kvm -smp 2 -m 320M
>> =

>> caused below changes:
>> =

>> =

>> +------------------------------------------------------------------+----=
------+------------+
>> |                                                                  | v4.=
8-rc5 | 3d26b7622f |
>> +------------------------------------------------------------------+----=
------+------------+
>> | boot_successes                                                   | 227=
1     | 473        |
>> | boot_failures                                                    | 248=
      | 654        |
>> | genirq:Flags_mismatch_irq##(serial)vs.#(goldfish_pdev_bus)       | 248=
      | 654        |
>> | calltrace:SyS_open                                               | 248=
      | 654        |
>> | invoked_oom-killer:gfp_mask=3D0x                                   | 3=
3       | 32         |
>> | Mem-Info                                                         | 33 =
      | 32         |
>> | BUG:kernel_reboot-without-warning_in_test_stage                  | 210=
      | 8          |
>> | genirq:Flags_mismatch_irq                                        | 1  =
      |            |
>> | genirq:Flags_mismatch_irq##(ser                                  | 1  =
      |            |
>> | genirq:Flags_mismatch_irq##(serial)vs                            | 1  =
      |            |
>> | genirq:Flags_mismatch_irq##(serial)vs.#(goldfi                   | 1  =
      |            |
>> | genirq:Flags_mismatch_irq##(serial)vs.#(goldfish_pdev_bu         | 1  =
      |            |
>> | warn_alloc_failed+0x                                             | 1  =
      |            |
>> | Out_of_memory:Kill_process                                       | 1  =
      | 4          |
>> | BUG:unable_to_handle_kernel                                      | 0  =
      | 533        |
>> | Oops                                                             | 0  =
      | 533        |
>> | calltrace:smpboot_thread_fn                                      | 0  =
      | 593        |
>> | kernel_BUG_at_mm/slub.c                                          | 0  =
      | 531        |
>> | invalid_opcode:#[##]SMP                                          | 0  =
      | 536        |
>> | EIP_is_at_kfree                                                  | 0  =
      | 531        |
>> | calltrace:SyS_execve                                             | 0  =
      | 533        |
>> | Kernel_panic-not_syncing:Fatal_exception                         | 0  =
      | 613        |
>> | WARNING:at_arch/x86/kernel/traps.c:#do_debug                     | 0  =
      | 86         |
>> | general_protection_fault:#[##]SMP                                | 0  =
      | 20         |
>> | EIP_is_at.brk.pagetables                                         | 0  =
      | 1          |
>> | EIP_is_at_do_execveat_common                                     | 0  =
      | 1          |
>> | EIP_is_at_copy_strings                                           | 0  =
      | 1          |
>> | bounds:#[##]SMP                                                  | 0  =
      | 2          |
>> | PANIC:double_fault                                               | 0  =
      | 2          |
>> | EIP_is_at_elf_format                                             | 0  =
      | 1          |
>> | general_protection_fault:#d34[##]SMP                             | 0  =
      | 1          |
>> | EIP_is_at__lock_acquire                                          | 0  =
      | 3          |
>> | Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes | 0  =
      | 1          |
>> | WARNING:at_kernel/sched/core.c:#__might_sleep                    | 0  =
      | 2          |
>> | EIP_is_at_unlink_anon_vmas                                       | 0  =
      | 2          |
>> | BUG:Bad_rss-counter_state_mm:#idx:#val                           | 0  =
      | 1          |
>> | BUG:non-zero_nr_ptes_on_freeing_mm                               | 0  =
      | 1          |
>> | EIP_is_at_cpu_stopper_thread                                     | 0  =
      | 2          |
>> | genirq:Flags_mismatch_irq##(serial)vs.#(goldfish_pdev            | 0  =
      | 1          |
>> +------------------------------------------------------------------+----=
------+------------+
>> =

>> [   22.622360] BUG: unable to handle kernel NULL pointer dereference at =
00000001
>> [   22.623553] IP: [<5128c004>] 0x5128c004
>> [   22.624210] *pde =3D 00000000 =

>> [   22.624698] Oops: 0000 [#1] SMP
>> [   22.625223] Modules linked in:
>> [   22.625638] CPU: 1 PID: 15 Comm: migration/1 Not tainted 4.8.0-rc5-00=
001-g3d26b76 #1
>> [   22.625638] task: 530910c0 task.stack: 5309a000
>> [   22.625638] EIP: 0060:[<5128c004>] EFLAGS: 00010246 CPU: 1
>> [   22.625638] EIP is at 0x5128c004
>> [   22.625638] EAX: 00000001 EBX: 53790280 ECX: 00000000 EDX: 00000001
>> [   22.625638] ESI: 5128c000 EDI: 41765d34 EBP: 5309bf04 ESP: 5309bee4
>> [   22.625638]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
>> [   22.625638] CR0: 80050033 CR2: 00000001 CR3: 01950000 CR4: 00000690
>> [   22.625638] Stack:
>> [   22.625638]  53790280 410c5173 00000001 537902b0 53790284 530910c0 53=
0023c0 41761ca0
>> [   22.625638]  5309bf1c 410543d3 00000000 5301da60 530023c0 410542e0 53=
09bfa4 410513e0
>> [   22.625638]  00000001 00000001 530023c0 00000000 00000000 dead4ead ff=
ffffff ffffffff
>> [   22.625638] Call Trace:
>> [   22.625638]  [<410c5173>] ? cpu_stopper_thread+0x73/0xf0
>> [   22.625638]  [<410543d3>] smpboot_thread_fn+0xf3/0x1e0
>> [   22.625638]  [<410542e0>] ? sort_range+0x20/0x20
>> [   22.625638]  [<410513e0>] kthread+0xa0/0xc0
>> [   22.625638]  [<41543e46>] ? wait_for_common+0xa6/0x150
>> [   22.625638]  [<415483e2>] ret_from_kernel_thread+0xe/0x24
>> [   22.625638]  [<41051340>] ? kthread_create_on_node+0x160/0x160
>> [   22.625638] Code: 00 00 00 95 a1 7c 37 73 00 00 00 46 02 00 00 6c f5 =
bd 3f 7b 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 80 e4 1a =
53 <02> 00 00 00 00 00 00 00 00 00 00 00 9d 6e ac 57 6c 6b 70 2f 6c
>> [   22.625638] EIP: [<5128c004>] 0x5128c004 SS:ESP 0068:5309bee4
>> [   22.625638] CR2: 0000000000000001
>> [   22.625638] ---[ end trace d07782e5cdd90364 ]---
>> [   22.623351] ------------[ cut here ]------------
>> [   22.623351] kernel BUG at mm/slub.c:3851!
>> [   22.623351] invalid opcode: 0000 [#2] SMP
>> [   22.623351] Modules linked in:
>> [   22.623351] CPU: 0 PID: 267 Comm: sh Tainted: G      D         4.8.0-=
rc5-00001-g3d26b76 #1
>> [   22.623351] task: 531ae480 task.stack: 5128c000
>> [   22.623351] EIP: 0060:[<411268d3>] EFLAGS: 00010246 CPU: 0
>> [   22.623351] EIP is at kfree+0x193/0x1a0
>> [   22.623351] EAX: 00000000 EBX: 539cc1a0 ECX: 00000000 EDX: 00000000
>> [   22.623351] ESI: 37740000 EDI: 5128df08 EBP: 5128dec4 ESP: 5128deb0
>> [   22.623351]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
>> [   22.623351] CR0: 80050033 CR2: 377d358c CR3: 125e6000 CR4: 00000690
>> [   22.623351] Stack:
>> [   22.623351]  377d4000 00002000 530aee00 37740000 525e0480 5128df24 41=
184169 530aee00
>> [   22.623351]  00000000 00000005 00000000 00000000 00000000 000930a0 00=
000000 00000000
>> [   22.623351]  ffffffff 377d5608 00000001 377a61bf 5140f300 520ca8c0 51=
28df08 5128df08
>> [   22.623351] Call Trace:
>> [   22.623351]  [<41184169>] load_elf_binary+0xb69/0xbc0
>> [   22.623351]  [<4113ddf2>] search_binary_handler+0x62/0x1a0
>> [   22.623351]  [<4113e4f3>] do_execveat_common+0x5c3/0x760
>> [   22.623351]  [<4113e8ff>] SyS_execve+0x1f/0x30
>> [   22.623351]  [<410012a5>] do_int80_syscall_32+0x45/0x110
>> [   22.623351]  [<415484d0>] entry_INT80_32+0x2c/0x2c
>> [   22.623351] Code: ff 40 18 eb b6 8d 76 00 6a 01 57 89 da 89 f0 89 f9 =
e8 12 fb ff ff 58 5a eb a1 8d b6 00 00 00 00 8b 43 14 a8 01 0f 85 7c ff ff =
ff <0f> 0b 8d 74 26 00 8d bc 27 00 00 00 00 55 89 e5 57 56 53 89 d7
>> [   22.623351] EIP: [<411268d3>] kfree+0x193/0x1a0 SS:ESP 0068:5128deb0
>> [   22.651614] ---[ end trace d07782e5cdd90365 ]---
>> [   22.651616] Kernel panic - not syncing: Fatal exception
>> [   22.654918] Shutting down cpus with NMI
>> [   22.654918] Kernel Offset: disabled
>> =

>> =

>> =

>> To reproduce:
>> =

>>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-=
tests.git
>>         cd lkp-tests
>>         bin/lkp install job.yaml  # job file is attached in this email
>>         bin/lkp run     job.yaml
>> =

>> =

>> =

>> Thanks,
>> Xiaolong
>>=20

--===============4661569276371802694==--

