Content-Type: multipart/mixed; boundary="===============4502527520846103741=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [PATCH] workqueue: Don't double assign worker->sleeping
Date: Thu, 02 Apr 2020 09:29:57 +0200
Message-ID: <20200402072957.fczmj5nbaosfq3hb@linutronix.de>
In-Reply-To: <CAJhGHyBmcY75Rhc7UFyK7Ozho+aqOcX2EaxePhZFu9rt0w3-mA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4502527520846103741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2020-04-02 08:07:35 [+0800], Lai Jiangshan wrote:
> > > would be *increased* twice
> > >
> > > I just saw the V2 patch, this issue is not listed, but need to be fix=
ed too.
> >
> > | void wq_worker_running(struct task_struct *task)
> > | {
> > |         struct worker *worker =3D kthread_data(task);
> > |
> > |         if (!worker->sleeping)
> > |                 return;
> > |         if (!(worker->flags & WORKER_NOT_RUNNING))
> > |                 atomic_inc(&worker->pool->nr_running);
> > *0
> > |         worker->sleeping =3D 0;
> > *1
> > | }
> >
> > So an interrupt
> > - before *0, the preempting caller drop early in wq_worker_sleeping(), =
only one
> >   atomic_inc()
> =

> If it is preempted on *0, the preempting caller drop early in
> wq_worker_sleeping()
> so there is no atomic decreasing, only one atomic_inc() in the
> preempting caller.
> The preempted point here, wq_worker_running(), has already just done
> atomic_inc(),
> the total number of atomic_inc() is two, while the number of atomic decre=
asing
> is one.

But in order to look at the same worker->sleeping it has to be same
`task'. This can not happen because the `worker' assignment is
per-thread.

Sebastian
--===============4502527520846103741==--

