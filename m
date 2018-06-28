Content-Type: multipart/mixed; boundary="===============4904318238535744788=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH 6/6] fs: replace f_ops->get_poll_head with a static ->f_poll_head pointer
Date: Thu, 28 Jun 2018 09:40:21 -0700
Message-ID: <CA+55aFxy=GFVumxzOqv0LH9kr5aV10yccVUpFWGY3BX2pTsVHw@mail.gmail.com>
In-Reply-To: <20180628142059.10017-7-hch@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============4904318238535744788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2018 at 7:21 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Note that for this removes the possibility of actually returning an
> error before waiting in poll.  We could still do this with an ERR_PTR
> in f_poll_head with a little bit of WRITE_ONCE/READ_ONCE magic, but
> I'd like to defer that until actually required.

I'm still going to just revert the whole poll mess for now.

It's still completely broken. This helps things, but it doesn't fix
the fundamental issue: the new interface is strictly worse than the
old interface ever was.

So Christoph, if you don't like the tradoitional ->poll() method, and
you want something else for aio polling, I seriously will suggest that
you introduce a new f_op for *that*. Don't mess with the existing
->poll() function, don't make select() and poll() use a slower and
less capable function just because aio wants something else.

In other words, you need to see AIO as the less important case, not as
the driver for this.

I also want to understand what the AIO race was, and what the problem
with the poll() thing was. You claimed it was racy. I don't see it,
and it was never ever explained in the whole series. I should never
have pulled it in the first place if only for that reason, but I tend
to trust Al when it comes to the VFS layer, so I did. My bad.

So before we try this again, I most definitely want _explanations_.
And I want the whole approach to be very clear that AIO is the ugly
step-sister, not the driving force.

                     Linus

--===============4904318238535744788==--

