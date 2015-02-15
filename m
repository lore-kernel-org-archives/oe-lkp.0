Content-Type: multipart/mixed; boundary="===============4433744800925599269=="
MIME-Version: 1.0
From: Frederic Weisbecker <fweisbec@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sched] BUG: kernel boot hang
Date: Sun, 15 Feb 2015 16:38:36 +0100
Message-ID: <20150215153833.GB8838@lerouge>
In-Reply-To: <1423986208.5538.5.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4433744800925599269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2015 at 03:43:28PM +0800, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> commit a18b5d01819235629289212ad428a5ee2b40f0d9 ("sched: Fix missing pree=
mption opportunity")
> =

> =

> +------------------------------------------+------------+------------+
> |                                          | 80e3d87b2c | a18b5d0181 |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 75         | 0          |
> | boot_failures                            | 0          | 52         |
> | BUG:unable_to_handle_kernel              | 0          | 32         |
> | Oops                                     | 0          | 32         |
> | RIP:rb_reserve_next_event                | 0          | 2          |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 32         |
> | RIP:ftrace_push_return_trace             | 0          | 29         |
> | BUG:kernel_boot_hang                     | 0          | 17         |
> | BUG:Function_graph_tracer_hang           | 0          | 1          |
> | PANIC:double_fault                       | 0          | 1          |
> | RIP:trace_graph_entry                    | 0          | 1          |
> | RIP:show_stack_log_lvl                   | 0          | 1          |
> | BUG:kernel_boot_crashed                  | 0          | 3          |
> +------------------------------------------+------------+------------+
> =

> [    0.572050] Testing tracer wakeup_dl: =

> [    0.572050] Testing tracer wakeup_dl: PASSED
> PASSED
> [    0.636050] Testing tracer function_graph: =

> [    0.636050] Testing tracer function_graph: =

> =

> [    0.648264] BUG: unable to handle kernel =

> [    0.648264] BUG: unable to handle kernel paging requestpaging request =
at 00000000000013cc
>  at 00000000000013cc
> [    0.649716] IP:
> [    0.649716] IP: [<ffffffff81113a51>] ftrace_push_return_trace+0xa3/0x1=
1b
>  [<ffffffff81113a51>] ftrace_push_return_trace+0xa3/0x11b

Probably I should annotate preempt_schedule_common() as __sched. I'll test =
that.

--===============4433744800925599269==--

