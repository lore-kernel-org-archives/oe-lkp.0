Content-Type: multipart/mixed; boundary="===============5883069448690680425=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: e6caa20fbd ("sched: Remove struct sched_class::next field"): BUG: kernel reboot-without-warning in early-boot stage, last printk: early console in setup code
Date: Thu, 18 Jun 2020 11:20:16 +0200
Message-ID: <20200618092016.GE576905@hirez.programming.kicks-ass.net>
In-Reply-To: <5eea50f7.Z3RMwp0FZK2RR80M%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5883069448690680425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2020 at 01:20:55AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/co=
re
> =

> commit e6caa20fbd998652b7d194051cecee7b07bef033
> Author:     Steven Rostedt (VMware) <rostedt@goodmis.org>
> AuthorDate: Thu Dec 19 16:44:54 2019 -0500
> Commit:     Peter Zijlstra <peterz@infradead.org>
> CommitDate: Tue Jun 16 15:34:54 2020 +0200
> =

>     sched: Remove struct sched_class::next field
>     =

>     Now that the sched_class descriptors are defined in order via the lin=
ker
>     script vmlinux.lds.h, there's no reason to have a "next" pointer to t=
he
>     previous priroity structure. The order of the sturctures can be align=
ed as
>     an array, and used to index and find the next sched_class descriptor.
>     =

>     Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
>     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>     Link: https://lkml.kernel.org/r/20191219214558.845353593(a)goodmis.org
> =

> bc16b304f4  sched: Have sched_class_highest define by vmlinux.lds.h
> e6caa20fbd  sched: Remove struct sched_class::next field
> 8420467b10  sched/fair: Optimize dequeue_task_fair()
> +------------------------------------------------------------------------=
-----------------------+------------+------------+------------+
> |                                                                        =
                       | bc16b304f4 | e6caa20fbd | 8420467b10 |
> +------------------------------------------------------------------------=
-----------------------+------------+------------+------------+
> | boot_successes                                                         =
                       | 37         | 0          | 0          |
> | boot_failures                                                          =
                       | 0          | 17         | 11         |
> | BUG:kernel_reboot-without-warning_in_early-boot_stage,last_printk:early=
_console_in_setup_code | 0          | 17         | 11         |
> +------------------------------------------------------------------------=
-----------------------+------------+------------+------------+
> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>
> =

> early console in setup code
> BUG: kernel reboot-without-warning in early-boot stage, last printk: earl=
y console in setup code

Weird, I can indeed reproduce this.. a kernel with this patch on booted
on my test box just fine, but even when I converted to given config to
x86_64 it stops dead after that initial print.

Attaching GDB to qemu also provided nothing useful, it says it just
exited.

Weird... I'll poke a little more.
--===============5883069448690680425==--

