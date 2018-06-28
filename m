Content-Type: multipart/mixed; boundary="===============5105100660370130716=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH 6/6] fs: replace f_ops->get_poll_head with a static ->f_poll_head pointer
Date: Thu, 28 Jun 2018 14:16:04 -0700
Message-ID: <CA+55aFxMGvgDavTjeLw77XSy0pCd=GBnzzryp3=vvsQNgyzcaw@mail.gmail.com>
In-Reply-To: <20180628203746.GJ30522@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============5105100660370130716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2018 at 1:37 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
>
> Speaking of obvious bogosities (a lot more so than a blocking allocation
> several calls down into helper):
>
> static __poll_t ca8210_test_int_poll(
>         struct file *filp,
>         struct poll_table_struct *ptable
> )

Ok, that's just garbage.

Again, this is not an excuse for changing "->poll()". This is just a
bogus driver that does stupid things.

And again, don't use this as an example of "poll must not block" The
fact is, poll() *can* block for locking and other such things, and
it's perfectly normal and ok. It just shouldn't block for IO.

I will not take any misguided patches to try to "fix" poll functions
that might block.

But I will take patches to fix bugs in drivers. In this case, I think
the fix is to just remove that crazy "wait_event_interruptible()"
entirely.

Not that anybody cares, obviously. Apparently nobody has ever noticed
how broken that poll function is.

               Linus

--===============5105100660370130716==--

