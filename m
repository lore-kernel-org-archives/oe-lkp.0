Content-Type: multipart/mixed; boundary="===============8753241704929758088=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [rfcomm_run] WARNING: CPU: 1 PID: 79 at kernel/sched/core.c:7156 __might_sleep()
Date: Thu, 02 Oct 2014 14:54:09 +0200
Message-ID: <20141002125409.GG2849@worktop.programming.kicks-ass.net>
In-Reply-To: <542D4756.4030100@hurleysoftware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8753241704929758088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 02, 2014 at 08:38:46AM -0400, Peter Hurley wrote:
> On 10/02/2014 08:31 AM, Peter Zijlstra wrote:
> > On Thu, Oct 02, 2014 at 01:09:27PM +0200, Peter Zijlstra wrote:
> >> On Tue, Sep 30, 2014 at 04:02:28PM +0800, Fengguang Wu wrote:
> >>> Hi Peter,
> >>>
> >>> We possibly find a rfcomm bug (maintainers CCed) exposed by your debu=
g patch
> >>>
> >>> [    1.861895] NET: Registered protocol family 5
> >>> [    1.862978] Bluetooth: RFCOMM TTY layer initialized
> >>> [    1.863099] ------------[ cut here ]------------
> >>> [    1.863105] WARNING: CPU: 1 PID: 79 at kernel/sched/core.c:7156 __=
might_sleep+0x17d/0x1a1()
> >>> [    1.863112] do not call blocking ops when !TASK_RUNNING; state=3D1=
 set at [<c14dc381>] rfcomm_run+0xdf/0x130e
> >>> [    1.863591]  [<c1058b73>] ? kthread_stop+0x53/0x53
> >>> [    1.864906]  [<c155a411>] dump_stack+0x48/0x60
> >>> [    1.866298]  [<c14dc381>] ? rfcomm_run+0xdf/0x130e
> >>
> >> Ha yes, rfcomm_run is a complete buggy mess indeed. Lemme go see what I
> >> can make of it.
> > =

> > ---
> > Subject: rfcomm: Fix broken wait construct
> > =

> > rfcomm_run() is a tad broken in that is has a nested wait loop. One
> > cannot rely on p->state for the outer wait because the inner wait will
> > overwrite it.
> > =

> > While at it, rename rfcomm_schedule to rfcomm_wake, since that is what
> > it actually does.
> =

> rfcomm_schedule() as in schedule_work(), which is how it's used.

Not really, all it does is wake the rfcomm_thread. The thread then does
a linear walk of all known sessions looking for work -- which is clearly
suboptimal as well, but I didn't feel like fixing that.

Also, the current implementation already disagrees with you, all it
basically does it call wake_up_process() which is a big clue right
there.



--===============8753241704929758088==--

