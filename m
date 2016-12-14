Content-Type: multipart/mixed; boundary="===============7484078706031801840=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/core] 3640269b04: WARNING: CPU: 0 PID: 0 at kernel/sched/sched.h:804 rq_clock_task
Date: Wed, 14 Dec 2016 18:52:12 +0800
Message-ID: <20161214105212.clcjhtg6aztrcsiz@wfg-t540p.sh.intel.com>
In-Reply-To: <20161214083544.GN3124@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============7484078706031801840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2016 at 09:35:44AM +0100, Peter Zijlstra wrote:
>On Wed, Dec 14, 2016 at 10:06:48AM +0800, kernel test robot wrote:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> git://internal_merge_and_test_tree devel-catchup-201612130113
>>
>> commit 3640269b04db583c0033678c9114f3406a0f489b
>> Author:     Matt Fleming <matt@codeblueprint.co.uk>
>> AuthorDate: Wed Sep 21 14:38:13 2016 +0100
>> Commit:     Peter Zijlstra <peterz@infradead.org>
>> CommitDate: Mon Dec 12 16:42:09 2016 +0100
>>
>>     sched/core: Add debug code to catch missing update_rq_clock()
>>
>
>> [    0.031009] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
>> [    0.033107] Freeing SMP alternatives memory: 12K (ffffffff81b7b000 - =
ffffffff81b7e000)
>> [    0.035721] ------------[ cut here ]------------
>> [    0.036000] WARNING: CPU: 0 PID: 0 at kernel/sched/sched.h:804 rq_clo=
ck_task+0x51/0x70
>> [    0.036000] rq->clock_update_flags < RQCF_ACT_SKIP
>> [    0.036000] Modules linked in:
>> [    0.036000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.9.0-rc8-00183=
-g3640269 #1
>> [    0.036000]  ffffffff81a03cc0 ffffffff8122375f ffffffff81a0f580 fffff=
fff81a03d28
>> [    0.036000]  0000000000000000 ffffffff81098591 ffffffff81a03d00 fffff=
fff8106a63f
>> [    0.036000]  0000000981a03d98 ffffffff81793092 ffff88001e6146c0 00000=
00000000000
>> [    0.036000] Call Trace:
>> [    0.036000]  [<ffffffff8122375f>] dump_stack+0xb0/0x101
>> [    0.036000]  [<ffffffff81098591>] ? rq_clock_task+0x51/0x70
>> [    0.036000]  [<ffffffff8106a63f>] __warn+0x107/0x127
>> [    0.036000]  [<ffffffff8106a6c4>] warn_slowpath_fmt+0x65/0x6e
>> [    0.036000]  [<ffffffff81098591>] rq_clock_task+0x51/0x70
>> [    0.036000]  [<ffffffff81098e3c>] update_load_avg+0x4c/0x263
>> [    0.036000]  [<ffffffff8109908c>] attach_entity_cfs_rq+0x39/0x92
>> [    0.036000]  [<ffffffff8109908c>] ? attach_entity_cfs_rq+0x39/0x92
>> [    0.036000]  [<ffffffff81099efd>] post_init_entity_util_avg+0xa9/0xac
>> [    0.036000]  [<ffffffff810935a3>] wake_up_new_task+0x59/0xc3
>> [    0.036000]  [<ffffffff81069ab8>] _do_fork+0x1bc/0x283
>> [    0.036000]  [<ffffffff8123add0>] ? find_next_bit+0x45/0x51
>> [    0.036000]  [<ffffffff814cef26>] ? rest_init+0x16d/0x16d
>> [    0.036000]  [<ffffffff81069bb3>] kernel_thread+0x34/0x3b
>> [    0.036000]  [<ffffffff81aaec89>] ? trap_init+0x20e/0x20e
>> [    0.036000]  [<ffffffff814ceddb>] rest_init+0x22/0x16d
>> [    0.036000]  [<ffffffff81aaec89>] ? trap_init+0x20e/0x20e
>> [    0.036000]  [<ffffffff81aac10f>] start_kernel+0x4dc/0x4e9
>> [    0.036000]  [<ffffffff81aab120>] ? early_idt_handler_array+0x120/0x1=
20
>> [    0.036000]  [<ffffffff81aab416>] x86_64_start_reservations+0x2a/0x2c
>> [    0.036000]  [<ffffffff81aab4fe>] x86_64_start_kernel+0xe6/0xf3
>> [    0.036000] ---[ end trace 0000000000000000 ]---
>> [    0.037197] smpboot: APIC(0) Converting physical 0 to logical package=
 0
>>
>> git bisect start e84cc2b92f0301361c20d97210099d4ac7731196 69973b830859bc=
6529a7a0468ba0d80ee5117826 --
>> git bisect  bad f50e71f8660649cc8ec74d0a35273ff627929a08  # 23:13     11=
-      5  Merge 'linux-review/Madalin-Bucur/powerpc-fsl-dts-add-QMan-and-BM=
an-portal-nodes-on-t1023rdb/20161207-034042' into devel-hourly-2016121315
>> git bisect  bad 1d169e013b8e9d7fa3e3af5af6e52145a8de114a  # 23:30     10=
-      4  Merge 'miklos-vfs/misc' into devel-hourly-2016121315
>> git bisect good 068926f19428d7a4e9281fc4b8ec9d8a0856e26d  # 00:10    132=
+     29  Merge 'linux-review/Grygorii-Strashko/usb-dwc3-omap-fix-race-of-p=
m-runtime-with-irq-handler-in-probe/20161213-053605' into devel-hourly-2016=
121315
>> git bisect  bad 43d1a53eec3973cdabbd54215aff4aa5a70ad1b2  # 00:22      4=
-      3  Merge 'pinchartl-media/omapdrm/devel' into devel-hourly-2016121315
>> git bisect  bad 85f539d220e9fb2c9c0b6f542527b6e4f3f0fe71  # 00:32      6=
-      2  Merge 'hwmon/watchdog-next' into devel-hourly-2016121315
>> git bisect good 2c22794aa932c328633337d1720bbc873d36d26f  # 01:24    131=
+     17  Merge 'ipmi/for-next' into devel-hourly-2016121315
>> git bisect  bad f185bb4654ea9a94553b07ac1fa76a277750c278  # 01:44      9=
-      1  Merge 'linux-review/Himanshu-Madhani/qla2xxx-Feature-updaes-for-d=
river/20161213-064500' into devel-hourly-2016121315
>> git bisect  bad 1e09f27041eb80acbde6571e8896115174343d72  # 02:08      2=
-      2  Merge 'peterz-queue/sched/debug' into devel-hourly-2016121315
>
>So as per that entry it appears you got the commit from my tree.

Yes.

>That tree also contains the below commit, right after the one you
>fingered. And the above stacktrace looks very much like the one here,
>no?
>
>commit 73bc83482218caf16d09407e1547299dfc862613
>Author: Peter Zijlstra <peterz@infradead.org>
>Date:   Mon Oct 3 16:20:59 2016 +0200
>
>    sched: Add missing update_rq_clock() in post_init_entity_util_avg().

It looks that commit still has the warning, however with a different
call trace:

Here is the dmesg:


[    0.356906] TSC deadline timer enabled
[    0.357541] smpboot: CPU0: GenuineIntel Intel Core Processor (Haswell) (=
family: 0x6, model: 0x3c, stepping: 0x1)
[    0.359332] Performance Events: no PMU driver, software events only.
[    0.589465] ------------[ cut here ]------------
[    0.590588] WARNING: CPU: 0 PID: 1 at kernel/sched/sched.h:804 rq_clock_=
task+0x51/0x70
[    0.592998] rq->clock_update_flags < RQCF_ACT_SKIP
[    0.594107] Modules linked in:
[    0.594912] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.9.0-rc8-00184-g7=
3bc834 #1
[    0.596614]  ffff88001e943b70 ffffffff81223767 ffffffff1e93c040 ffff8800=
1e943bd8
[    0.598568]  0000000000000000 ffffffff81098599 ffff88001e943bb0 ffffffff=
8106a63f
[    0.600513]  000000091e943c48 ffffffff81793103 ffff88001fa146c0 00000000=
00000000
[    0.602456] Call Trace:
[    0.603089]  [<ffffffff81223767>] dump_stack+0xb0/0x101
[    0.604301]  [<ffffffff81098599>] ? rq_clock_task+0x51/0x70
[    0.605613]  [<ffffffff8106a63f>] __warn+0x107/0x127
[    0.606922]  [<ffffffff8106a6c4>] warn_slowpath_fmt+0x65/0x6e
[    0.608275]  [<ffffffff81098599>] rq_clock_task+0x51/0x70
[    0.609562]  [<ffffffff81098e44>] update_load_avg+0x4c/0x263
[    0.610994]  [<ffffffff810992f5>] switched_from_fair+0x5b/0x143
[    0.612425]  [<ffffffff810992f5>] ? switched_from_fair+0x5b/0x143
[    0.613897]  [<ffffffff8109022e>] check_class_changed+0x24/0x55
[    0.615273]  [<ffffffff81094122>] __sched_setscheduler+0x5f0/0x680
[    0.616784]  [<ffffffff814d5000>] ? _raw_spin_unlock_bh+0x3/0x33
[    0.618237]  [<ffffffff81094212>] _sched_setscheduler+0x60/0x62
[    0.619605]  [<ffffffff810942bb>] sched_setscheduler_nocheck+0xb/0xd
[    0.621181]  [<ffffffff81094309>] sched_set_stop_task+0x4c/0x7f
[    0.622580]  [<ffffffff810e90be>] cpu_stop_create+0x2b/0x2d
[    0.624015]  [<ffffffff8108ee2a>] __smpboot_create_thread+0xf0/0x103
[    0.625608]  [<ffffffff8108f0dc>] smpboot_register_percpu_thread_cpumask=
+0x7c/0xfa
[    0.627482]  [<ffffffff81ac7334>] cpu_stop_init+0x88/0xb4
[    0.628828]  [<ffffffff81ac72ac>] ? ikconfig_init+0x56/0x56
[    0.630156]  [<ffffffff810004b1>] do_one_initcall+0xa5/0x17e
[    0.631513]  [<ffffffff81013ec3>] ? print_cpu_info+0xc0/0xc5
[    0.632919]  [<ffffffff810155f5>] ? set_mtrr_aps_delayed_init+0x40/0x43
[    0.634491]  [<ffffffff81aac198>] kernel_init_freeable+0x7c/0x208
[    0.635994]  [<ffffffff814cef26>] ? rest_init+0x16d/0x16d
[    0.637269]  [<ffffffff814cef35>] kernel_init+0xf/0x153
[    0.638526]  [<ffffffff814cef26>] ? rest_init+0x16d/0x16d
[    0.639884]  [<ffffffff814d582a>] ret_from_fork+0x2a/0x40
[    0.641163] ---[ end trace 0000000000000000 ]---
[    0.398389] x86: Booted up 1 node, 1 CPUs
[    0.399084] smpboot: Total of 1 processors activated (5387.01 BogoMIPS)

Regards,
Fengguang

--===============7484078706031801840==--

