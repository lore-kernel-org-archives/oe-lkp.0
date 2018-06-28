Content-Type: multipart/mixed; boundary="===============8780804159724283389=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH 6/6] fs: replace f_ops->get_poll_head with a static ->f_poll_head pointer
Date: Thu, 28 Jun 2018 14:11:17 -0700
Message-ID: <CA+55aFxfkD9ozw77j-bshReLJN4dN2GEdW+R-LkxztceCW6OTg@mail.gmail.com>
In-Reply-To: <20180628202837.GI30522@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============8780804159724283389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2018 at 1:28 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
>
> Sure, but...
>
> static __poll_t binder_poll(struct file *filp,
>                                 struct poll_table_struct *wait)
> {
>         struct binder_proc *proc =3D filp->private_data;
>         struct binder_thread *thread =3D NULL;
>         bool wait_for_proc_work;
>
>         thread =3D binder_get_thread(proc);
>         if (!thread)
>                 return POLLERR;

That's actually fine.

In particular, it's ok to *not* add yourself to the wait-queues if you
already return the value that you will always return.

For example, the poll function for a regular file could just always return

        EPOLLIN | EPOLLOUT | EPOLLRDNORM | EPOLLWRNORM

because it never changes. Now, it doesn't actually *do* that, because
we have the rule that "no ->poll function" means exactly that, but
it's not wrong.

Similarly, if a poll handler has an error that will not go away, the
above is actually the *right* thing to do. There simply isn't anything
to wait for.

Arguably, it probably should return not just POLLERR, but also
POLLIN/POLLOUT, since an error *also* means that it's going to return
immediately from read/write, but that's a separate thing entirely.

> And that's hardly unique - we have instances playing with timers,
> allocations, whatnot.  Even straight mutex_lock(), as in

So?

Again, locking is permitted. It's not great, but it's not against the rules.

So none of the things you point to are excuses for changing interfaces
or adding any flags.

And no, we don't care at all about "blocking" in general. Somebody who
cares about _performance_ may care, but it's not fundamnetal. Even
select(*) and poll() itself will block for allocating select tables
etc, but also for reading (and updating) user space.

Anybody who thinks "select cannot block" or "->poll() musn't block" is
just confused. It has *never* been about that. It waits asynchronously
for IO, but it may well wait synchronously for locks or memory or just
"lazy implementation".

And none of this has antyhign to do with the ->poll() interface
itself. If you want to improve performance on some _particular_ file
and actually worry about locking etc, you fix that particular
implementation. You don't go and change the interface for everybody.

The fact is, those interface changes were just broken shit. They were
confused. I don't actually believe that AIO even needed them.

Christoph, do you have a test program for IOCB_CMD_POLL and what it's
actually supposed to do?

Because I think that what it can do is simply to do the ->poll() calls
outside the iocb locks, and then just attach the poll table to the
kioctx afterwards.

This whole "poll must not block" is a complete red herring. It doesn't
come from any other requirements than BAD AIO GARBAGE CODE.

Seriously. Stop thinking this has to happen inside some spinlocked
region. That's AIO braindamage, it's irrelevant.

             Linus

--===============8780804159724283389==--

