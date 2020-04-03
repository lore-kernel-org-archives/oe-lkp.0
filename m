Content-Type: multipart/mixed; boundary="===============5742790682905716126=="
MIME-Version: 1.0
From: Daniel Jordan <daniel.m.jordan@oracle.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] workqueue: Remove the warning in wq_worker_sleeping()
Date: Fri, 03 Apr 2020 13:45:00 -0400
Message-ID: <20200403174500.75rwuijdri5ewl5c@ca-dmjordan1.us.oracle.com>
In-Reply-To: <20200327232959.rpylymw2edhtxuwr@linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============5742790682905716126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

On Sat, Mar 28, 2020 at 12:29:59AM +0100, Sebastian Andrzej Siewior wrote:
> v1=E2=80=A6v2: - Drop the warning instead of using cmpxchg_local().
> 	 Tglx pointed out that wq_worker_sleeping() is already invoked
> 	 with disabled preemption so the race described can not happen.

I guess you mean this race:

> However, if the interrupt occurs in wq_worker_sleeping() between reading =
and
> setting `sleeping' i.e.
> =

> |        if (WARN_ON_ONCE(worker->sleeping))
> |                return;
>  *interrupt*
> |        worker->sleeping =3D 1;
> =

> then pool->nr_running will be decremented twice in wq_worker_sleeping()
> but it will be incremented only once in wq_worker_running().

Why would preemption prevent it?  Interrupts are still enabled.

What am I missing?  :-)
--===============5742790682905716126==--

