Content-Type: multipart/mixed; boundary="===============1849900530467913275=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [PATCH 6/6] fs: replace f_ops->get_poll_head with a static ->f_poll_head pointer
Date: Thu, 28 Jun 2018 22:30:27 +0100
Message-ID: <20180628213027.GK30522@ZenIV.linux.org.uk>
In-Reply-To: <CA+55aFxfkD9ozw77j-bshReLJN4dN2GEdW+R-LkxztceCW6OTg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1849900530467913275==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2018 at 02:11:17PM -0700, Linus Torvalds wrote:
> On Thu, Jun 28, 2018 at 1:28 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> >
> > Sure, but...
> >
> > static __poll_t binder_poll(struct file *filp,
> >                                 struct poll_table_struct *wait)
> > {
> >         struct binder_proc *proc =3D filp->private_data;
> >         struct binder_thread *thread =3D NULL;
> >         bool wait_for_proc_work;
> >
> >         thread =3D binder_get_thread(proc);
> >         if (!thread)
> >                 return POLLERR;
> =

> That's actually fine.
> =

> In particular, it's ok to *not* add yourself to the wait-queues if you
> already return the value that you will always return.

Sure (and that's one of the problems I mentioned with ->get_poll_head() mod=
el).
But in this case I was refering to GFP_KERNEL allocation down there.

> > And that's hardly unique - we have instances playing with timers,
> > allocations, whatnot.  Even straight mutex_lock(), as in
> =

> So?
> =

> Again, locking is permitted. It's not great, but it's not against the rul=
es.

Me: a *LOT* of ->poll() instances only block in __pollwait() called (indire=
ctly)
on the first pass.
 =

You: They are *all* supposed to do it.

Me: <examples of instances that block elsewhere>

I'm not saying that blocking on other things is a bug; some of such *are* b=
ogus,
but a lot aren't really broken.  What I said is that in a lot of cases we r=
eally
have hard "no blocking other than in callback" (and on subsequent passes th=
ere's
no callback at all).  Which is just about perfect for AIO purposes, so *IF*=
 we
go for "new method just for AIO, those who don't have it can take a hike", =
we might
as well indicate that "can take a hike" in some way (be it opt-in or opt-ou=
t) and
use straight unchanged ->poll(), with alternative callback.

Looks like we were talking past each other for the last couple of rounds...

> So none of the things you point to are excuses for changing interfaces
> or adding any flags.

> Anybody who thinks "select cannot block" or "->poll() musn't block" is
> just confused. It has *never* been about that. It waits asynchronously
> for IO, but it may well wait synchronously for locks or memory or just
> "lazy implementation".

Obviously.  I *do* understand how poll() works, really.

> The fact is, those interface changes were just broken shit. They were
> confused. I don't actually believe that AIO even needed them.
> =

> Christoph, do you have a test program for IOCB_CMD_POLL and what it's
> actually supposed to do?
> =

> Because I think that what it can do is simply to do the ->poll() calls
> outside the iocb locks, and then just attach the poll table to the
> kioctx afterwards.

I'd do a bit more - embed the first poll_table_entry into poll iocb itself,
so that the instances that use only one queue wouldn't need any allocations
at all.

--===============1849900530467913275==--

