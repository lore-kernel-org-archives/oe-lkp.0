Content-Type: multipart/mixed; boundary="===============3031976384802888930=="
MIME-Version: 1.0
From: Daniel Jordan <daniel.m.jordan@oracle.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] workqueue: Remove the warning in wq_worker_sleeping()
Date: Fri, 03 Apr 2020 15:05:51 -0400
Message-ID: <20200403190551.mntw6ydtqysaoipu@ca-dmjordan1.us.oracle.com>
In-Reply-To: <20200403182502.woqrxpydt3n6l6ie@linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============3031976384802888930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2020 at 08:25:02PM +0200, Sebastian Andrzej Siewior wrote:
> On 2020-04-03 13:45:00 [-0400], Daniel Jordan wrote:
> > Why would preemption prevent it?  Interrupts are still enabled.
> > =

> > What am I missing?  :-)
> =

> Preemption is disabled which means no other task is allowed to be
> scheduled.

Aha, "preempt_count() > 1" in kvm_async_pf_task_wait().

Thanks.
--===============3031976384802888930==--

