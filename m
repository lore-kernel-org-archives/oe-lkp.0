Content-Type: multipart/mixed; boundary="===============4465185908311080067=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH 6/6] fs: replace f_ops->get_poll_head with a static ->f_poll_head pointer
Date: Thu, 28 Jun 2018 15:35:03 -0700
Message-ID: <CA+55aFzjUeacfpB8F2_J3rmOv3+hXF2zNNWP4UzdXxWTgD=nxQ@mail.gmail.com>
In-Reply-To: <20180628222016.GL30522@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============4465185908311080067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2018 at 3:20 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> The rules for drivers change only in one respect - if your ->poll() is go=
ing to
> need to block, check poll_requested_events(pt) & EPOLL_ATOMIC and return =
EPOLLNVAL
> in such case.

OI still don't even understand why you care.

Yes, the AIO poll implementation did it under the spinlock.

But there's no good *reason* for that.  The "aio_poll()" function
itself is called in perfectly fine blocking context.

The only reason it does it under the spinlock is that apparently
Christoph didn't understand how poll() worked.

As far as I can tell, Christoph could have just done the first pass
'->poll()' *without* taking a spinlock, and that adds the table entry
to the table. Then, *under the spinlock*, you associate the table the
the kioctx. And then *after* the spinlock, you can call "->poll()"
again (now with a NULL table pointer), to verify that the state is
still not triggered. That's the whole point of the two-phgase poll
thing - the first phase adds the entry to the wait queues, and the
second phase checks for the race of "did it the event happen in the
meantime".

There is absolutely no excuse for calling '->poll()' itself under the
spinlock. I don't see any reason for it. The whole "AIO needs this to
avoid races" was always complete and utter bullshit, as far as I can
tell.

So stop it with this crazy and pointless "poll() might block".

IT DAMN WELL SHOULD BE ABLE TO BLOCK, AND NOBODY SANE WILL EVER CARE!

If somebody cares, they are doing things wrong. So fix the AIO code,
don't look at the poll() code, for chrissake!

               Linus

--===============4465185908311080067==--

