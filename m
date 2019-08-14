Content-Type: multipart/mixed; boundary="===============1426582244138909038=="
MIME-Version: 1.0
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 6b8fd01b21: INFO:rcu_sched_detected_stalls_on_CPUs/tasks
Date: Wed, 14 Aug 2019 09:38:22 +0200
Message-ID: <f0f71f15-9136-afa7-e367-0042bf88b306@arm.com>
In-Reply-To: <20190814063705.GB734@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============1426582244138909038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/14/19 8:37 AM, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 6b8fd01b21f5f2701b407a7118f236ba4c41226d ("sched/fair: Use rq_loc=
k/unlock in online_fair_sched_group")
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/peterz/queue.git=
 sched/core
> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +----------------------------------------------------+------------+------=
------+
> |                                                    | 5c3ceef9ad | 6b8fd=
01b21 |
> +----------------------------------------------------+------------+------=
------+
> | boot_successes                                     | 39         | 391  =
      |
> | boot_failures                                      | 0          | 87   =
      |
> | BUG:kernel_hang_in_test_stage                      | 0          | 68   =
      |
> | BUG:kernel_hang_in_boot-around-mounting-root_stage | 0          | 7    =
      |
> | BUG:soft_lockup-CPU##stuck_for#s                   | 0          | 12   =
      |
> | RIP:smp_call_function_single                       | 0          | 8    =
      |
> | Kernel_panic-not_syncing:softlockup:hung_tasks     | 0          | 12   =
      |
> | RIP:native_queued_spin_lock_slowpath               | 0          | 6    =
      |
> | INFO:rcu_sched_detected_stalls_on_CPUs/tasks       | 0          | 5    =
      |
> | RIP:propagate_entity_cfs_rq                        | 0          | 2    =
      |
> | RIP:native_safe_halt                               | 0          | 3    =
      |
> | RIP:console_unlock                                 | 0          | 1    =
      |
> +----------------------------------------------------+------------+------=
------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>

This has been fixed already on
https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
by using rq_lock_irq()/rq_unlock_irq() instead of rq_lock()/rq_unlock().

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=3Dsch=
ed/core&id=3Da46d14eca7b75fffe35603aa8b81df654353d80f

[...]

--===============1426582244138909038==--

