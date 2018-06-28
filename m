Content-Type: multipart/mixed; boundary="===============5351328262686361486=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [PATCH 6/6] fs: replace f_ops->get_poll_head with a static ->f_poll_head pointer
Date: Thu, 28 Jun 2018 23:49:30 +0100
Message-ID: <20180628224930.GM30522@ZenIV.linux.org.uk>
In-Reply-To: <CA+55aFzjUeacfpB8F2_J3rmOv3+hXF2zNNWP4UzdXxWTgD=nxQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5351328262686361486==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2018 at 03:35:03PM -0700, Linus Torvalds wrote:

> Yes, the AIO poll implementation did it under the spinlock.
> =

> But there's no good *reason* for that.  The "aio_poll()" function
> itself is called in perfectly fine blocking context.

aio_poll() is not a problem.  It's wakeup callback that is one.

> As far as I can tell, Christoph could have just done the first pass
> '->poll()' *without* taking a spinlock, and that adds the table entry
> to the table. Then, *under the spinlock*, you associate the table the
> the kioctx. And then *after* the spinlock, you can call "->poll()"
> again (now with a NULL table pointer), to verify that the state is
> still not triggered. That's the whole point of the two-phgase poll
> thing - the first phase adds the entry to the wait queues, and the
> second phase checks for the race of "did it the event happen in the
> meantime".

You are misreading that mess.  What he's trying to do (other than surviving
the awful clusterfuck around cancels) is to handle the decision what to
report to userland right in the wakeup callback.  *That* is what really
drives the "make the second-pass ->poll() or something similar to it
non-blocking" (in addition to the fact that it is such in considerable
majority of instances).

--===============5351328262686361486==--

