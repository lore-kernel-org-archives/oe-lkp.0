Content-Type: multipart/mixed; boundary="===============4559513316585984933=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] workqueue: Remove the warning in wq_worker_sleeping()
Date: Fri, 03 Apr 2020 10:53:26 -0400
Message-ID: <20200403145326.GA162390@mtj.duckdns.org>
In-Reply-To: <20200327232959.rpylymw2edhtxuwr@linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============4559513316585984933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Mar 28, 2020 at 12:29:59AM +0100, Sebastian Andrzej Siewior wrote:
> The kernel test robot triggered a warning with the following race:
>    task-ctx A                            interrupt-ctx B
>  worker
>   -> process_one_work()
>     -> work_item()
>       -> schedule();
>          -> sched_submit_work()
>            -> wq_worker_sleeping()
>              -> ->sleeping =3D 1
>                atomic_dec_and_test(nr_running)
>          __schedule();                *interrupt*
>                                        async_page_fault()
>                                        -> local_irq_enable();
>                                        -> schedule();
>                                           -> sched_submit_work()
>                                             -> wq_worker_sleeping()
>                                                -> if (WARN_ON(->sleeping)=
) return
>                                           -> __schedule()
>                                             ->  sched_update_worker()
>                                               -> wq_worker_running()
>                                                  -> atomic_inc(nr_running=
);
>                                                  -> ->sleeping =3D 0;
> =

>       ->  sched_update_worker()
>         -> wq_worker_running()
>           if (!->sleeping) return
> =

> In this context the warning is pointless everything is fine.

This is not a usual control flow, right? Can we annotate this case specific=
ally
instead of weakening santiy check for generic cases?

Thanks.

-- =

tejun
--===============4559513316585984933==--

