Content-Type: multipart/mixed; boundary="===============1138343919151489147=="
MIME-Version: 1.0
From: Bart Van Assche <bvanassche@acm.org>
To: lkp@lists.01.org
Subject: Re: cdbeb78c7a ("kernel/workqueue: Use dynamic lockdep keys for .."): WARNING: CPU: 0 PID: 0 at kernel/locking/lockdep.c:1002 lockdep_register_key
Date: Mon, 17 Dec 2018 09:32:57 -0800
Message-ID: <1545067977.185366.436.camel@acm.org>
In-Reply-To: <5c17230f.mbgTPR4404Mp8abU%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1138343919151489147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-12-17 at 12:16 +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/bvanassche/linux for-next
> =

> commit cdbeb78c7a2e34af6d6cc5d3570a585a23eea8e9
> Author:     Bart Van Assche <bvanassche@acm.org>
> AuthorDate: Fri Nov 9 09:53:31 2018 -0800
> Commit:     Bart Van Assche <bvanassche@acm.org>
> CommitDate: Fri Dec 14 11:24:37 2018 -0800
> =

>     kernel/workqueue: Use dynamic lockdep keys for workqueues
>     =

>     [ ... ]
> =

> 60e521015c  locking/lockdep: Add support for dynamic keys
> cdbeb78c7a  kernel/workqueue: Use dynamic lockdep keys for workqueues
> 9294000d6d  IB/srp: Drain the send queue before destroying a QP
> +-----------------------------------------------------------+------------=
+------------+---------------------+
> >                                                           | 60e521015c =
| cdbeb78c7a | bvanassche/for-next |
> =

> +-----------------------------------------------------------+------------=
+------------+---------------------+
> > boot_successes                                            | 915        =
| 305        | 0                   |
> > boot_failures                                             | 1          =
| 7          | 310                 |
> > INFO:rcu_preempt_self-detected_stall_on_CPU               | 1          =
|            |                     |
> > EIP:smp_call_function_single                              | 1          =
|            |                     |
> > BUG:kernel_hang_in_boot-around-mounting-root_stage        | 1          =
|            |                     |
> > WARNING:at_kernel/locking/lockdep.c:#lockdep_register_key | 0          =
| 7          |                     |
> > EIP:lockdep_register_key                                  | 0          =
| 7          |                     |
> > WARNING:kernel_stack                                      | 0          =
| 0          | 310                 |
> =

> +-----------------------------------------------------------+------------=
+------------+---------------------+

The "WARNING:at_kernel/locking/lockdep.c:#lockdep_register_key" warnings ha=
ve
already been removed from my branch so I think this report can be ignored.

Bart.



--===============1138343919151489147==--

