Content-Type: multipart/mixed; boundary="===============3083601653585670616=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [rfcomm_run] WARNING: CPU: 1 PID: 79 at kernel/sched/core.c:7156 __might_sleep()
Date: Thu, 02 Oct 2014 15:41:56 +0200
Message-ID: <20141002134156.GA10583@worktop.programming.kicks-ass.net>
In-Reply-To: <542D4DA6.2090607@hurleysoftware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3083601653585670616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 02, 2014 at 09:05:42AM -0400, Peter Hurley wrote:

> >>> While at it, rename rfcomm_schedule to rfcomm_wake, since that is what
> >>> it actually does.
> >>
> >> rfcomm_schedule() as in schedule_work(), which is how it's used.
> > =

> > Not really, all it does is wake the rfcomm_thread. The thread then does
> > a linear walk of all known sessions looking for work -- which is clearly
> > suboptimal as well, but I didn't feel like fixing that.
> > =

> > Also, the current implementation already disagrees with you, all it
> > basically does it call wake_up_process() which is a big clue right
> > there.
> =

> You're thinking of it from the point of view of the scheduler, so to you
> it should be named what it does.

Of course I am, that thing is called 'schedule' so its natural to think
about the scheduler :-)

> However, from the users' point of view, it's an abstraction of work
> dispatching; the fact that a kthread (which needs waking) does the work
> is irrelevant.

Still a misnomer, see below.

> Consider if the kthread is converted to work_structs instead and your now-
> renamed rfcomm_wake() is calling schedule_work().

Then it would probably be less buggy and more efficient -- where I'm
assuming it would queue work per session and avoid the endless scanning
of sessions.

Also schedule_work() is somewhat sanely named in that you schedule the
work for later execution, so here we can use the term. The thread
however might already be scheduled or even running, so there it is not
appropriate.

--===============3083601653585670616==--

