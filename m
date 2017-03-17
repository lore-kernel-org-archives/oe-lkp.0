Content-Type: multipart/mixed; boundary="===============3011067288103614882=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/core] 8a8c69c327: WARNING: CPU: 0 PID: 8 at kernel/locking/lockdep.c:3548 lock_release
Date: Fri, 17 Mar 2017 15:09:09 +0100
Message-ID: <20170317140909.yfwvqdouwfad26i3@hirez.programming.kicks-ass.net>
In-Reply-To: <CANRm+Cxb0=KDpbP+R95sbY=MjxnGkk1Q-13s1VQ2q_Q0DQ+V2w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3011067288103614882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2017 at 09:24:11PM +0800, Wanpeng Li wrote:
> 2017-03-17 21:02 GMT+08:00 Wanpeng Li <kernellwp@gmail.com>:
> > 2017-03-17 4:02 GMT+08:00 kernel test robot <fengguang.wu@intel.com>:
> >> Greetings,
> >>
> >> 0day kernel testing robot got the below dmesg and the first bad commit=
 is
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
> >>
> >> commit 8a8c69c32778865affcedc2111bb5d938b50516f
> >> Author:     Peter Zijlstra <peterz@infradead.org>
> >> AuthorDate: Tue Oct 4 16:04:35 2016 +0200
> >> Commit:     Ingo Molnar <mingo@kernel.org>
> >> CommitDate: Thu Mar 16 09:46:22 2017 +0100
> >>
> >>     sched/core: Add rq->lock wrappers
> >>
> >>     The missing update_rq_clock() check can work with partial rq->lock
> >>     wrappery, since a missing wrapper can cause the warning to not be
> >>     emitted when it should have, but cannot cause the warning to trigg=
er
> >>     when it should not have.
> >>
> >>     The duplicate update_rq_clock() check however can cause false warn=
ings
> >>     to trigger. Therefore add more comprehensive rq->lock wrappery.
> >>
> >>     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> >>     Cc: Linus Torvalds <torvalds@linux-foundation.org>
> >>     Cc: Mike Galbraith <efault@gmx.de>
> >>     Cc: Peter Zijlstra <peterz@infradead.org>
> >>     Cc: Thomas Gleixner <tglx@linutronix.de>
> >>     Signed-off-by: Ingo Molnar <mingo@kernel.org>
> >
> > Please refer to: https://lkml.org/lkml/2017/3/16/1131
> =

> I have another version of patch which utilizes raw_spin_lock_irqsave()
> instead of rq_lock_irqsave() in __balance_callback() as before, which
> one do you like, Peterz?

Hurm.. the raw_spin_lock_irqsave() one I suspect. No point in pinning
and then unpinning.



--===============3011067288103614882==--

