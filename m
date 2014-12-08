Content-Type: multipart/mixed; boundary="===============1337100511684797991=="
MIME-Version: 1.0
From: Anton Blanchard <anton@samba.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] kthread: kthread_bind fails to enforce CPU affinity (fixes kernel BUG at kernel/smpboot.c:134!)
Date: Mon, 08 Dec 2014 15:46:38 +1100
Message-ID: <20141208154638.37c1ec18@kryten>
In-Reply-To: <CA+55aFw6gMN5VxONPo9xtJA_+p2iLArSaK-m_4vDL+L07Z6vuA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1337100511684797991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi Linus,

> The __set_task_cpu() function does various other things too:
> =

>         set_task_rq(p, cpu);
>   #ifdef CONFIG_SMP
>         /*
>          * After ->cpu is set up to a new value, task_rq_lock(p, ...)
> can be
>          * successfuly executed on another CPU. We must ensure that
> updates of
>          * per-task data have been completed by this moment.
>          */
>         smp_wmb();
>         task_thread_info(p)->cpu =3D cpu;
>         p->wake_cpu =3D cpu;
>   #endif
> =

> which makes me worry about just setting the thread_info->cpu value.
> That set_task_rq() initializes various group scheduling things, an
> dthat whole "wake_cpu" thing seems relevant too.

Yeah, I would definitely like the scheduler guys to weigh in on this,
especially considering how difficult it can be to hit.

Anton

--===============1337100511684797991==--

