Content-Type: multipart/mixed; boundary="===============6817046228476008215=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 9ad0e5683d: IP-Config: Auto-configuration of network failed
Date: Mon, 26 Sep 2016 21:05:41 +0800
Message-ID: <20160926130541.e5ei5fja33hrvkn5@wfg-t540p.sh.intel.com>
In-Reply-To: <20160923085739.GD5008@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============6817046228476008215==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Fri, Sep 23, 2016 at 10:57:39AM +0200, Peter Zijlstra wrote:
>On Fri, Sep 23, 2016 at 01:45:05PM +0800, kernel test robot wrote:
>>
>> FYI, we noticed the following commit:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/t=
mp
>> commit 9ad0e5683d900d3ea5f301768f8d35b54840c17a ("sched/fair: Optimize e=
nqueue_entity()")
>>
>> in testcase: boot
>>
>> on test machine: qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap=
 -smp 2 -m 1G
>>
>> caused below changes:
>>
>>
>> +-------------------------------------------------+------------+--------=
----+
>> |                                                 | 8ffaffa57c | 9ad0e56=
83d |
>> +-------------------------------------------------+------------+--------=
----+
>> | boot_successes                                  | 515        | 31     =
    |
>> | boot_failures                                   | 25         | 80     =
    |
>
>Does that mean its still failing to boot the parent (8ffaffa57c)
>sometimes (25 out of 515+25 times) ?

Yes, sorry -- the boot tests have some noise errors ever since.

+-------------------------------------------------+------------+-----------=
-+------------+
|                                                 | 8ffaffa57c | 9ad0e5683d=
 | 50fbde2841 |
+-------------------------------------------------+------------+-----------=
-+------------+
| boot_successes                                  | 515        | 31        =
 | 5          |
| boot_failures                                   | 25         | 80        =
 | 56         |
| BUG:kernel_reboot-without-warning_in_test_stage | 21         |           =
 |            |
| IP-Config:Auto-configuration_of_network_failed  | 4          | 4         =
 | 48         |

The real differences here are the below entries.

| WARNING:at_kernel/sched/fair.c:#enqueue_entity  | 0          | 78        =
 | 40         |
| calltrace:SyS_read                              | 0          | 46        =
 | 3          |
| BUG:unable_to_handle_kernel                     | 0          | 12        =
 |            |
| Oops                                            | 0          | 12        =
 |            |
| RIP:rb_erase                                    | 0          | 11        =
 | 1          |
| Kernel_panic-not_syncing:Fatal_exception        | 0          | 12        =
 |            |
| BUG:spinlock_lockup_suspected_on_CPU            | 0          | 64        =
 | 8          |
| calltrace:torture_shuffle                       | 0          | 33        =
 | 5          |
| RIP:__default_send_IPI_dest_field               | 0          | 64        =
 | 8          |
| RIP:__enqueue_entity                            | 0          | 35        =
 | 5          |
| calltrace:SyS_wait4                             | 0          | 24        =
 | 3          |
| RIP:rb_next                                     | 0          | 25        =
 | 2          |
| calltrace:schedule_timeout                      | 0          | 5         =
 | 1          |
| calltrace:SyS_clone                             | 0          | 21        =
 | 1          |
| calltrace:SyS_nanosleep                         | 0          | 2         =
 |            |
| calltrace:SyS_execve                            | 0          | 2         =
 |            |
| calltrace:SyS_exit_group                        | 0          | 8         =
 | 31         |
| calltrace:lock_torture_writer                   | 0          | 3         =
 |            |
| RIP:pick_next_task_fair                         | 0          | 4         =
 |            |

Especially this WARNING can be reproduced easily:

[   34.961903] debug: unmapping init [mem 0xffff8eb458e8b000-0xffff8eb458ff=
ffff]
[   34.982281] random: init: uninitialized urandom read (12 bytes read)
[   35.053338] ------------[ cut here ]------------
[   35.054100] WARNING: CPU: 0 PID: 1 at kernel/sched/fair.c:3370 enqueue_e=
ntity+0x51/0xa20
[   35.062212] CPU: 0 PID: 1 Comm: init Not tainted 4.8.0-rc6-00273-g9ad0e5=
6 #2
[   35.063126]  0000000000000000 ffff8eb45d17f990 ffffffffbc6f4d25 00000000=
00000000
[   35.064166]  0000000000000000 ffff8eb45d17f9d0 ffffffffbc0bd0e0 00000d2a=
5d190040
[   35.072024]  ffff8eb45e3d85b0 ffff8eb4507104a8 0000000000000001 00000000=
00000001
[   35.073284] Call Trace:
[   35.073688]  [<ffffffffbc6f4d25>] dump_stack+0x86/0xc1
[   35.074506]  [<ffffffffbc0bd0e0>] __warn+0xc0/0xe0
[   35.081969]  [<ffffffffbc0bd1cd>] warn_slowpath_null+0x1d/0x20
[   35.082890]  [<ffffffffbc0f50a1>] enqueue_entity+0x51/0xa20
[   35.083775]  [<ffffffffbc03f4e5>] ? kvm_sched_clock_read+0x25/0x40
[   35.091450]  [<ffffffffbc104ce9>] ? __lock_is_held+0x49/0x70
[   35.092203]  [<ffffffffbc0f5ace>] enqueue_task_fair+0x5e/0x900
[   35.092965]  [<ffffffffbc03f4e5>] ? kvm_sched_clock_read+0x25/0x40
[   35.093776]  [<ffffffffbc01ccd9>] ? sched_clock+0x9/0x10
[   35.094475]  [<ffffffffbc0ec665>] ? sched_clock_cpu+0xa5/0xd0
[   35.102039]  [<ffffffffbc0e572c>] activate_task+0x4c/0x60
[   35.102884]  [<ffffffffbc0efa43>] attach_task+0x53/0x80
[   35.103708]  [<ffffffffbc0f7ab6>] load_balance+0x596/0x960
[   35.104560]  [<ffffffffbc0f81fc>] pick_next_task_fair+0x37c/0x540
[   35.112201]  [<ffffffffbc0f80f4>] ? pick_next_task_fair+0x274/0x540
[   35.113189]  [<ffffffffbd11091d>] __schedule+0x36d/0x720
[   35.114026]  [<ffffffffbd110d84>] schedule+0x74/0x90
[   35.121504]  [<ffffffffbc24b21f>] pipe_wait+0x6f/0xa0
[   35.122175]  [<ffffffffbc0fe420>] ? __wake_up_common+0x80/0x80
[   35.122937]  [<ffffffffbc24b959>] pipe_read+0x269/0x340
[   35.123627]  [<ffffffffbc243338>] __vfs_read+0xd8/0x100
[   35.124316]  [<ffffffffbc2433fd>] vfs_read+0x9d/0x120
[   35.131678]  [<ffffffffbc243819>] SyS_read+0x49/0xa0
[   35.132339]  [<ffffffffbc001a43>] do_syscall_64+0x273/0x390
[   35.133068]  [<ffffffffbc129dc3>] ? rcu_eqs_enter+0x43/0x50
[   35.133945]  [<ffffffffbc00101a>] ? trace_hardirqs_on_thunk+0x1a/0x1c
[   35.138353]  [<ffffffffbd116483>] entry_SYSCALL64_slow_path+0x25/0x25
[   35.139343] ---[ end trace 88c244b7a589cbf9 ]---
[  139.205554] BUG: spinlock lockup suspected on CPU#1, 99-trinity/175

>Would you have a filesystem image to go with that so I can try and
>reproduce?

These commands should be able to reproduce the error, they will
download the necessary images and run QEMU:

        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tes=
ts.git
        cd lkp-tests
        bin/lkp qemu -k KERNEL job-script  # job-script is attached in the =
original report email

Thanks,
Fengguang

--===============6817046228476008215==--

