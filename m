Content-Type: multipart/mixed; boundary="===============8270295084191374094=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [PATCH] workqueue: Don't double assign worker->sleeping
Date: Wed, 01 Apr 2020 15:03:46 +0200
Message-ID: <20200401130346.e7cdsqgxppa6ohje@linutronix.de>
In-Reply-To: <CAJhGHyBS9Z=x-X2Bxzbic2sfqj=STqr+K8Tgu1UfYMQDm6MtBg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8270295084191374094==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2020-04-01 11:44:06 [+0800], Lai Jiangshan wrote:
> On Wed, Apr 1, 2020 at 11:22 AM Lai Jiangshan <jiangshanlai@gmail.com> =
wrote:
> >
> > Hello
Hi Lai,

=E2=80=A6
> > 2) wq_worker_running() can be interrupted(async-page-faulted in virtual=
 machine)
> > and nr_running would be decreased twice.
> =

> would be *increased* twice
> =

> I just saw the V2 patch, this issue is not listed, but need to be fixed t=
oo.

| void wq_worker_running(struct task_struct *task)
| {
|         struct worker *worker =3D kthread_data(task);
| =

|         if (!worker->sleeping)
|                 return;
|         if (!(worker->flags & WORKER_NOT_RUNNING))
|                 atomic_inc(&worker->pool->nr_running);
*0
|         worker->sleeping =3D 0;
*1
| }

So an interrupt
- before *0, the preempting caller drop early in wq_worker_sleeping(), only=
 one
  atomic_inc()

- after *1, the preempting task will invoke wq_worker_sleeping() and do
  dec() + inc().

What did I miss here?

Sebastian
--===============8270295084191374094==--

