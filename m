Content-Type: multipart/mixed; boundary="===============9175511609814316469=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [PATCH 6/6] fs: replace f_ops->get_poll_head with a static ->f_poll_head pointer
Date: Fri, 29 Jun 2018 15:28:48 +0200
Message-ID: <20180629132848.GA28510@lst.de>
In-Reply-To: <CA+55aFxfkD9ozw77j-bshReLJN4dN2GEdW+R-LkxztceCW6OTg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9175511609814316469==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2018 at 02:11:17PM -0700, Linus Torvalds wrote:
> Christoph, do you have a test program for IOCB_CMD_POLL and what it's
> actually supposed to do?

https://pagure.io/libaio/c/9c6935e81854d1585bbfa48c35b185849d746864?branch=
=3Daio-poll

is the actual test in libaio.  In addition to that the seastar library
actually has a real life user.  But given that is c++ with all modern
bells and whistles you'll probably have an as hard time as me actually
understanding that.

> Because I think that what it can do is simply to do the ->poll() calls
> outside the iocb locks, and then just attach the poll table to the
> kioctx afterwards.

We could do that on the submit side fairly easily.  The problem
is really the completion side, where I'd much avoid introducing a
spurious context switch.  Right now even with a NULL qproc we can't
guarantee any of that.  So we'll need to schedule out to a workqueue,
and then from that schedule the potential multiple NULL qproc calls,
which might actually block elsewhere even if __pollwait is never called.

> This whole "poll must not block" is a complete red herring. It doesn't
> come from any other requirements than BAD AIO GARBAGE CODE.

I comes from the fact to avoid a totally pointless context switch.
aio code itself works just fine called from a workqueue, we have
exatly that case when file system do non-trivial operations in their
end_io handler.

--===============9175511609814316469==--

