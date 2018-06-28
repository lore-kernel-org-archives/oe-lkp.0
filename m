Content-Type: multipart/mixed; boundary="===============6226965689014686629=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [PATCH 6/6] fs: replace f_ops->get_poll_head with a static ->f_poll_head pointer
Date: Thu, 28 Jun 2018 19:17:27 +0100
Message-ID: <20180628181727.GH30522@ZenIV.linux.org.uk>
In-Reply-To: <CA+55aFxy=GFVumxzOqv0LH9kr5aV10yccVUpFWGY3BX2pTsVHw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6226965689014686629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2018 at 09:40:21AM -0700, Linus Torvalds wrote:
> On Thu, Jun 28, 2018 at 7:21 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > Note that for this removes the possibility of actually returning an
> > error before waiting in poll.  We could still do this with an ERR_PTR
> > in f_poll_head with a little bit of WRITE_ONCE/READ_ONCE magic, but
> > I'd like to defer that until actually required.
> =

> I'm still going to just revert the whole poll mess for now.
>
> It's still completely broken. This helps things, but it doesn't fix
> the fundamental issue: the new interface is strictly worse than the
> old interface ever was.
> =

> So Christoph, if you don't like the tradoitional ->poll() method, and
> you want something else for aio polling, I seriously will suggest that
> you introduce a new f_op for *that*. Don't mess with the existing
> ->poll() function, don't make select() and poll() use a slower and
> less capable function just because aio wants something else.
> =

> In other words, you need to see AIO as the less important case, not as
> the driver for this.
> =

> I also want to understand what the AIO race was, and what the problem
> with the poll() thing was. You claimed it was racy. I don't see it,
> and it was never ever explained in the whole series. I should never
> have pulled it in the first place if only for that reason, but I tend
> to trust Al when it comes to the VFS layer, so I did. My bad.

... and I should have pushed back harder, rather than getting sidetracked
into fixing the fs/aio.c-side races in this series ;-/

As for what can be salvaged out of the whole mess,
	* probably the most serious lesson is that INDIRECT CALLS ARE
COSTLY NOW and shouldn't be used lightly.  That had been slow to sink
in and we'd better all realize how much the things have changed.
That, BTW, has implications going a lot further than poll-related stuff -
e.g. the whole "we'll deal with revoke-like issues in procfs/sysfs/debugfs
by wrapping method calls" needs to be reexamined.  And in poll-related
area, note that we have a lot of indirection levels for socket poll.
	* having an optional pointer to wait_queue_head in struct file
is probably a good idea; a lot of ->poll() instances do have the same
form.  Even if sockets do not (and I'm not all that happy about the
solution in the latest series), the instances that do are common and
important enough.
	* a *LOT* of ->poll() instances only block in __pollwait()
called (indirectly) on the first pass.  If we annotate those in some
way (flag set in ->open(), presence of a new method, whatever) and
limit aio-poll to just those, we could deal with the aio side without
disrupting select/poll at all; just use (in place of __pollwait)
a different callback that wouldn't try to allocate poll_table_entry
and worked with the stuff embedded into aio-poll iocb.

How much do you intend to revert?  Untangling just the ->poll()-related
parts from the rest of changes in fs/aio.c will be unpleasant; we might
end up reverting the whole tail of the series and redoing the things
that are not poll-related on top of the revert... ;-/

--===============6226965689014686629==--

