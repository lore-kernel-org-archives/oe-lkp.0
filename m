Content-Type: multipart/mixed; boundary="===============4278636925304111502=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/core] 4fa5cd5245: BUG: sleeping function called from invalid context at kernel/locking/mutex.c:97
Date: Fri, 30 Sep 2016 12:35:49 +0200
Message-ID: <20160930103549.GH5016@twins.programming.kicks-ass.net>
In-Reply-To: <20160930015102.GB20189@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4278636925304111502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2016 at 09:51:02AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 4fa5cd5245b627db88c9ca08ae442373b02596b4 ("sched/core: Do not use =
smp_processor_id() with preempt enabled in smpboot_thread_fn()")
> =


So its perfectly ok to use smp_processor_id() in preemptible context,
assuming the task is pinned to one cpu.

smpboot threads are per definition per-cpu threads, those are bound to a
specific CPU and affinity cannot be changed by userspace.

--===============4278636925304111502==--

