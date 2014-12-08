Content-Type: multipart/mixed; boundary="===============7996454096658284957=="
MIME-Version: 1.0
From: Anton Blanchard <anton@samba.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] kthread: kthread_bind fails to enforce CPU affinity (fixes kernel BUG at kernel/smpboot.c:134!)
Date: Mon, 08 Dec 2014 21:18:59 +1100
Message-ID: <20141208211859.6e81ec81@kryten>
In-Reply-To: <20141208083408.GA8023@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7996454096658284957==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi Ingo,

> So we cannot call set_task_cpu() because in the normal life time =

> of a task the ->cpu value gets set on wakeup. So if a task is =

> blocked right now, and its affinity changes, it ought to get a =

> correct ->cpu selected on wakeup. The affinity mask and the =

> current value of ->cpu getting out of sync is thus 'normal'.
> =

> (Check for example how set_cpus_allowed_ptr() works: we first set =

> the new allowed mask, then do we migrate the task away if =

> necessary.)
> =

> In the kthread_bind() case this is explicitly assumed: it only =

> calls do_set_cpus_allowed().
> =

> But obviously the bug triggers in kernel/smpboot.c, and that =

> assert shows a real bug - and your patch makes the assert go =

> away, so the question is, how did the kthread get woken up and =

> put on a runqueue without its ->cpu getting set?

I started going down this line earlier today, and found things like:

select_task_rq_fair:

        if (p->nr_cpus_allowed =3D=3D 1)
                return prev_cpu;

I tried returning cpumask_first(tsk_cpus_allowed()) instead, and while
I couldn't hit the BUG I did manage to get a scheduler lockup during
testing.

At that point I thought the previous task_cpu() was somewhat ingrained
in the scheduler and came up with the patch. If not, we could go on a
hunt to see what else needs fixing.

Anton

--===============7996454096658284957==--

