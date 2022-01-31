Content-Type: multipart/mixed; boundary="===============7724149663528750021=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [fs/exec] 80bd5afdd8: xfstests.generic.633.fail
Date: Mon, 31 Jan 2022 15:51:21 +0000
Message-ID: <YfgFeWbZPl+gAUYE@casper.infradead.org>
In-Reply-To: <20220131153707.oe45h7tuci2cbfuv@wittgenstein>
List-Id: <oe-lkp.lists.linux.dev>

--===============7724149663528750021==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 31, 2022 at 04:37:07PM +0100, Christian Brauner wrote:
> On Mon, Jan 31, 2022 at 03:19:22PM +0000, Matthew Wilcox wrote:
> > On Mon, Jan 31, 2022 at 04:08:19PM +0100, Christian Brauner wrote:
> > > On Mon, Jan 31, 2022 at 10:43:52PM +0800, kernel test robot wrote:
> > > I can fix this rather simply in our upstream fstests with:
> > > =

> > > static char *argv[] =3D {
> > > 	"",
> > > };
> > > =

> > > I guess.
> > > =

> > > But doesn't
> > > =

> > > static char *argv[] =3D {
> > > 	NULL,
> > > };
> > > =

> > > seem something that should work especially with execveat()?
> > =

> > The problem is that the exec'ed program sees an argc of 0, which is the
> > problem we're trying to work around in the kernel (instead of leaving
> > it to ld.so to fix for suid programs).
> =

> Ok, just seems a bit more intuitive for path-based exec than for
> fd-based execveat().
> =

> What's argv[0] supposed to contain in these cases?
> =

> 1. execveat(fd, NULL, ..., AT_EMPTY_PATH)
> 2. execveat(fd, "my-file", ..., )
> =

> "" in both 1. and 2.?
> "" in 1. and "my-file" in 2.?

You didn't specify argv for either of those, so I have no idea.
Programs shouldn't be assuming anything about argv[0]; it's purely
advisory.  Unfortunately, some of them do.  And some of them are suid.

--===============7724149663528750021==--

