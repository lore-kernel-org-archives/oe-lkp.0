Content-Type: multipart/mixed; boundary="===============0942053802463113273=="
MIME-Version: 1.0
From: Wanpeng Li <wanpeng.li@hotmail.com>
To: lkp@lists.01.org
Subject: Re: [sched] 25834c73f9: WARNING: CPU: 0 PID: 13 at kernel/sched/core.c:1156 do_set_cpus_allowed+0x7e/0x80()
Date: Tue, 25 Aug 2015 16:20:54 +0800
Message-ID: <BLU437-SMTP10691274755066E43C30BD280610@phx.gbl>
In-Reply-To: <877fool013.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0942053802463113273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/22/15 7:00 AM, kernel test robot wrote:
> FYI, we noticed the below changes on
>
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 25834c73f93af7f0712c98ca4593691592e6b360 ("sched: Fix a race betwe=
en __kthread_bind() and sched_setaffinity()")

https://lkml.org/lkml/2015/8/25/117

Hopes this patch can fix it.

Regards,
Wanpeng Li

>
>
> +------------------------------------------------------------------+-----=
-------+------------+
> |                                                                  | 7855=
a35ac0 | 25834c73f9 |
> +------------------------------------------------------------------+-----=
-------+------------+
> | boot_successes                                                   | 10  =
       | 0          |
> | boot_failures                                                    | 1   =
       | 11         |
> | Out_of_memory:Kill_process                                       | 1   =
       | 11         |
> | Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes | 1   =
       | 10         |
> | backtrace:vfs_fstatat                                            | 1   =
       | 2          |
> | backtrace:SyS_fstatat64                                          | 1   =
       | 2          |
> | WARNING:at_kernel/sched/core.c:#do_set_cpus_allowed()            | 0   =
       | 6          |
> | backtrace:smpboot_thread_fn                                      | 0   =
       | 6          |
> | backtrace:SYSC_socketcall                                        | 0   =
       | 4          |
> | backtrace:SyS_socketcall                                         | 0   =
       | 4          |
> | backtrace:tty_ldisc_setup                                        | 0   =
       | 1          |
> | backtrace:tty_init_dev                                           | 0   =
       | 1          |
> | backtrace:do_sys_open                                            | 0   =
       | 1          |
> | backtrace:SyS_open                                               | 0   =
       | 1          |
> +------------------------------------------------------------------+-----=
-------+------------+
>
> [   15.273708] ------------[ cut here ]------------
> [   15.274097] WARNING: CPU: 0 PID: 13 at kernel/sched/core.c:1156 do_set=
_cpus_allowed+0x7e/0x80()
> [   15.274857] Modules linked in:
> [   15.275101] CPU: 0 PID: 13 Comm: migration/0 Not tainted 4.2.0-rc1-000=
49-g25834c7 #2
> [   15.275674]  00000000 00000000 d21f1d24 c19228b2 00000000 d21f1d58 c10=
56a3b c1ba00e4
> [   15.276084]  00000000 0000000d c1ba17d8 00000484 c10838be 00000484 c10=
838be d21e5000
> [   15.276084]  d2121900 d21e5158 d21f1d68 c1056b12 00000009 00000000 d21=
f1d7c c10838be
> [   15.276084] Call Trace:
> [   15.276084]  [<c19228b2>] dump_stack+0x4b/0x75
> [   15.276084]  [<c1056a3b>] warn_slowpath_common+0x8b/0xc0
> [   15.276084]  [<c10838be>] ? do_set_cpus_allowed+0x7e/0x80
> [   15.276084]  [<c10838be>] ? do_set_cpus_allowed+0x7e/0x80
> [   15.276084]  [<c1056b12>] warn_slowpath_null+0x22/0x30
> [   15.276084]  [<c10838be>] do_set_cpus_allowed+0x7e/0x80
> [   15.276084]  [<c110154c>] cpuset_cpus_allowed_fallback+0x7c/0x170
> [   15.276084]  [<c11014d0>] ? cpuset_cpus_allowed+0x180/0x180
> [   15.276084]  [<c1083ae1>] select_fallback_rq+0x221/0x280
> [   15.276084]  [<c1085073>] migration_call+0xe3/0x250
> [   15.276084]  [<c1079e23>] notifier_call_chain+0x53/0x70
> [   15.276084]  [<c1079e5e>] __raw_notifier_call_chain+0x1e/0x30
> [   15.276084]  [<c1056cc8>] cpu_notify+0x28/0x50
> [   15.276084]  [<c191e4d2>] take_cpu_down+0x22/0x40
> [   15.276084]  [<c1102895>] multi_cpu_stop+0xd5/0x140
> [   15.276084]  [<c11027c0>] ? __stop_cpus+0x80/0x80
> [   15.276084]  [<c11025cc>] cpu_stopper_thread+0xbc/0x170
> [   15.276084]  [<c1085ec9>] ? preempt_count_sub+0x9/0x50
> [   15.276084]  [<c192b6a7>] ? _raw_spin_unlock_irq+0x37/0x50
> [   15.276084]  [<c192b655>] ? _raw_spin_unlock_irqrestore+0x55/0x70
> [   15.276084]  [<c10a9074>] ? trace_hardirqs_on_caller+0x144/0x1e0
> [   15.276084]  [<c11024a5>] ? cpu_stop_should_run+0x35/0x40
> [   15.276084]  [<c1085ec9>] ? preempt_count_sub+0x9/0x50
> [   15.276084]  [<c192b641>] ? _raw_spin_unlock_irqrestore+0x41/0x70
> [   15.276084]  [<c107c944>] smpboot_thread_fn+0x174/0x2f0
> [   15.276084]  [<c107c7d0>] ? sort_range+0x30/0x30
> [   15.276084]  [<c1078934>] kthread+0xc4/0xe0
> [   15.276084]  [<c192c041>] ret_from_kernel_thread+0x21/0x30
> [   15.276084]  [<c1078870>] ? kthread_create_on_node+0x180/0x180
> [   15.276084] ---[ end trace 15f4c86d404693b0 ]---
>
> Thanks,
> Ying Huang


--===============0942053802463113273==--

