Content-Type: multipart/mixed; boundary="===============4185370858424816687=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] workqueue: Remove the warning in wq_worker_sleeping()
Date: Fri, 03 Apr 2020 21:29:02 +0200
Message-ID: <20200403192902.ws33fhs5mrxg6dvo@linutronix.de>
In-Reply-To: <20200403145326.GA162390@mtj.duckdns.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4185370858424816687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2020-04-03 10:53:26 [-0400], Tejun Heo wrote:
> Hello,
Hello Tejun,

> This is not a usual control flow, right? =


The worker is blocked on something and while invoking schedule() it
needs to be preempted by an interrupt which opens interrupts and invokes
schedule() as well.
Interrupt handler are not allowed to enable interrupts in general.
Page-fault handler do so by they happen only while the calling context
triggered a page-fault. Since the kernel is always mapped, this does not
happen.
The async page fault handler is any exception here. I don't find
anything else while looking over x86's idtentry. So this makes it highly
unusual control flow, yes.

> Can we annotate this case specifically
> instead of weakening santiy check for generic cases?

puh. So if this
  do_async_page_fault() -> do_page_fault()

never happens but only
  do_async_page_fault() -> kvm_async_pf_task_wait()

then kvm_async_pf_task_wait() could invoke preempt_schedule() instead.
This would avoid the worker part (and the warning) but is only available
for PREEMPTION kernels. And I think the former case might happen.

> Thanks.
> =


Sebastian
--===============4185370858424816687==--

