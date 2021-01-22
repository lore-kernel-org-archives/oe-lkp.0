Content-Type: multipart/mixed; boundary="===============1464838418449604655=="
MIME-Version: 1.0
From: Petr Mladek <pmladek@suse.com>
To: lkp@lists.01.org
Subject: Re: [printk] b031a684bf: INFO:rcu_tasks_detected_stalls_on_tasks
Date: Fri, 22 Jan 2021 17:21:11 +0100
Message-ID: <YAr7d6A4CkMpgx+g@alley>
In-Reply-To: <20210122081311.GA12834@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1464838418449604655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri 2021-01-22 16:13:11, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: b031a684bfd01d633c79d281bd0cf11c2f834ada ("printk: remove logbuf_=
lock writer-protection of ringbuffer")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

This commit causes that many printk() callers might add messages to
the new lockless ring buffer in parallel.

The printk() calls are still serialized later when they
try to get access to the console. It happens in
console_trylock_spinning(). There are actually two locks used.
sem->lock and console_owner_lock().

The only exception is printk_deferred() where the console handling
is deferred via irq_work.


> in testcase: rcutorture
> version: =

> with following parameters:
> =

> 	runtime: 300s
> 	test: cpuhotplug
> 	torture_type: tasks
>
> test-description: rcutorture is rcutorture kernel module load/unload test.
> test-url: https://www.kernel.org/doc/Documentation/RCU/torture.txt
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 8G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------------+------------+----------=
--+
> |                                                | 6b916706f8 | b031a684b=
f |
> +------------------------------------------------+------------+----------=
--+
> | boot_successes                                 | 66         | 18       =
  |
> | boot_failures                                  | 2          | 26       =
  |
> | INFO:rcu_sched_detected_stalls_on_CPUs/tasks   | 1          |          =
  |
> | RIP:enqueue_hrtimer                            | 1          |          =
  |
> | RIP:__memset                                   | 1          |          =
  |
> | RIP:clear_page_rep                             | 2          | 2        =
  |
> | BUG:kernel_hang_in_boot_stage                  | 2          |          =
  |
> | INFO:rcu_sched_self-detected_stall_on_CPU      | 1          | 4        =
  |
> | INFO:rcu_tasks_detected_stalls_on_tasks        | 0          | 22       =
  |
> | RIP:kernel_init_free_pages                     | 0          | 1        =
  |
> | IP-Config:Auto-configuration_of_network_failed | 0          | 3        =
  |
> | RIP:zone_page_state                            | 0          | 1        =
  |
> +------------------------------------------------+------------+----------=
--+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [  952.147986] INFO: rcu_tasks detected stalls on tasks:
> [  952.149313] 000000008d44d6d1: .. nvcsw: 0/0 holdout: 1 idle_cpu: -1/1
                                      ^^^^^^^^^^                      ^^^^
				      =


There are no voluntary context switches. I wonder if some code relied
in on the voluntary context switches done by printk(). But it would
be only printk_deferred() caller.

Do I get it correctly that the task has been running on CPU 1 ?

> [  952.150866] task:dmesg           state:R  running task     stack:    0=
 pid: 1771 ppid:   573 flags:0x20020000
                      ^^^^^

It is interesting that it is "dmesg". I guess that it did read the
 log. So, it still should be synchronized by lockbuf_lock.

I wonder if it is a hint or just a random victim.

> [  952.153385] Call Trace:
> [  952.154090] __schedule (kbuild/src/consumer/kernel/sched/core.c:3779 k=
build/src/consumer/kernel/sched/core.c:4528) =

> [  952.154990] ? firmware_map_remove (kbuild/src/consumer/kernel/sched/co=
re.c:4411) =

> [  952.156159] ? ksys_read (kbuild/src/consumer/fs/read_write.c:637) =

> [  952.157063] schedule (kbuild/src/consumer/include/linux/thread_info.h:=
84 (discriminator 1) kbuild/src/consumer/include/linux/sched.h:1897 (discri=
minator 1) kbuild/src/consumer/kernel/sched/core.c:4608 (discriminator 1)) =

> [  952.157895] exit_to_user_mode_prepare (kbuild/src/consumer/kernel/entr=
y/common.c:160 kbuild/src/consumer/kernel/entry/common.c:191) =

> [  952.158984] syscall_exit_to_user_mode (kbuild/src/consumer/arch/x86/in=
clude/asm/jump_label.h:41 kbuild/src/consumer/arch/x86/include/asm/nospec-b=
ranch.h:288 kbuild/src/consumer/arch/x86/include/asm/entry-common.h:80 kbui=
ld/src/consumer/kernel/entry/common.c:133 kbuild/src/consumer/kernel/entry/=
common.c:268) =

> [  952.160252] entry_INT80_compat (kbuild/src/consumer/arch/x86/entry/ent=
ry_64_compat.S:412) =

> [  952.161424] RIP: 0023:0xf7eeca02
> [  952.162254] RSP: 002b:00000000fff98e04 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000003
> [  952.164203] RAX: ffffffffffffffe0 RBX: 0000000000000004 RCX: 000000005=
6573234
> [  952.165898] RDX: 0000000000001fff RSI: 00000000000001e0 RDI: 000000005=
6573234
> [  952.167484] RBP: 00000000ffffffff R08: 0000000000000000 R09: 000000000=
0000000
> [  952.169182] R10: 0000000000000000 R11: 0000000000000000 R12: 000000000=
0000000
> [  952.170897] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [  952.189825] tasks-torture:torture_onoff task: online 0 failed: errno -5
> [  952.191987]
> [  352.522192] tasks-torture:torture_onoff task: online 0 failed: errno -5
> [  952.192011]
> [  952.222122] tasks-torture:torture_onoff task: online 0 failed: errno -5
> [  952.224619]
> [  352.539354]
> [   98.566609] tasks-torture:torture_onoff task: online 0 failed: errno -5
> [  952.224648]
> [  952.264449]
> [  352.555366] tasks-torture:torture_onoff task: online 0 failed: errno -5
> [  952.264484]
> [  952.267017] 00000000974cbae1: .. nvcsw: 2/2 holdout: 1 idle_cpu: -1/1

This task did two voluntary context switches.

It is again on CPU 1. The timestamp of the message is about 0.1 sec
after the previous one. It might suggest that it printed by the same
check_all_holdout_tasks() cycle.

I still have to investigate what holdout means. I wonder which task
actually blocked the CPU and caused the RCU stall.

Might there be a missing RCU unlock somewhere?

> [  952.268469] task:sed             state:R  running task     stack:    0=
 pid:  424 ppid:   396 flags:0x20020000

Anyway, this is "sed". It is not directly replated to printk() interface.

> [  952.270501] Call Trace:
> [  952.270986] __schedule (kbuild/src/consumer/kernel/sched/core.c:3779 k=
build/src/consumer/kernel/sched/core.c:4528) =

> [  952.271861] ? firmware_map_remove (kbuild/src/consumer/kernel/sched/co=
re.c:4411) =

> [  952.272870] ? ksys_write (kbuild/src/consumer/fs/read_write.c:661) =

> [  952.273709] schedule (kbuild/src/consumer/include/linux/thread_info.h:=
84 (discriminator 1) kbuild/src/consumer/include/linux/sched.h:1897 (discri=
minator 1) kbuild/src/consumer/kernel/sched/core.c:4608 (discriminator 1)) =

> [  952.274495] exit_to_user_mode_prepare (kbuild/src/consumer/kernel/entr=
y/common.c:160 kbuild/src/consumer/kernel/entry/common.c:191) =

> [  952.275516] syscall_exit_to_user_mode (kbuild/src/consumer/arch/x86/in=
clude/asm/jump_label.h:41 kbuild/src/consumer/arch/x86/include/asm/nospec-b=
ranch.h:288 kbuild/src/consumer/arch/x86/include/asm/entry-common.h:80 kbui=
ld/src/consumer/kernel/entry/common.c:133 kbuild/src/consumer/kernel/entry/=
common.c:268) =


> [  952.276650] entry_INT80_compat (kbuild/src/consumer/arch/x86/entry/ent=
ry_64_compat.S:412) =

> [  952.277673] RIP: 0023:0xf7f93a02
> [  952.278497] RSP: 002b:00000000ff8db2f4 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000004
> [  952.280235] RAX: 0000000000000001 RBX: 0000000000000001 RCX: 000000005=
666f220
> [  952.281813] RDX: 0000000000000001 RSI: 00000000f7f59d60 RDI: 000000000=
0000001
> [  952.283347] RBP: 000000005666f220 R08: 0000000000000000 R09: 000000000=
0000000
> [  952.284919] R10: 0000000000000000 R11: 0000000000000000 R12: 000000000=
0000000
> [  952.286507] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [  952.294673] tasks-torture:torture_onoff task: online 0 failed: errno -5
> [  952.328047] tasks-torture:torture_onoff task: online 0 failed: errno -5
> [  952.336658]
> [  352.572231]
> [   98.585525] tasks-torture:torture_onoff task: online 0 failed: errno -5
> [  952.336693]
> [  952.359450]
> [  352.594642] tasks-torture:torture_onoff task: online 0 failed: errno -5
> [  952.359483]
> [  952.377678] tasks-torture:torture_onoff task: online 0 failed: errno -5
> [  952.409955] tasks-torture:torture_onoff task: online 0 failed: errno -5
> [  952.412504]
> [  352.610470]
> [   98.605699] tasks-torture:torture_onoff task: online 0 failed: errno -5
> [  952.412531]
> [  952.444293]
> [  352.625170] tasks-torture:torture_onoff task: online 0 failed: errno -5
> [  952.444328]
> [  952.453669] tasks-torture:torture_onoff task: online 0 failed: errno -5
> [  952.480340]
> [  352.638172]
> =

> To reproduce:
> =

>         # build kernel
> 	cd linux
> 	cp config-5.10.0-rc5-gb031a684bfd0 .config
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Dx86_64 olddefconfig prepare module=
s_prepare bzImage
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email

I am still struggling with lkp-tests. I have never used them before
and have troubles to get it working. It asks for a newer qemu at
the moment. It means that I am still not able to reproduce it :-/

I wonder if there is a way to reproduce this without lpk-tests
framework.

Best Regards,
Petr
--===============1464838418449604655==--

