Content-Type: multipart/mixed; boundary="===============3271889033346233595=="
MIME-Version: 1.0
From: Christian Brauner <brauner@kernel.org>
To: lkp@lists.01.org
Subject: Re: [fs/exec] 80bd5afdd8: xfstests.generic.633.fail
Date: Mon, 31 Jan 2022 16:37:07 +0100
Message-ID: <20220131153707.oe45h7tuci2cbfuv@wittgenstein>
In-Reply-To: <Yff9+tIDAvYM5EO/@casper.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3271889033346233595==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 31, 2022 at 03:19:22PM +0000, Matthew Wilcox wrote:
> On Mon, Jan 31, 2022 at 04:08:19PM +0100, Christian Brauner wrote:
> > On Mon, Jan 31, 2022 at 10:43:52PM +0800, kernel test robot wrote:
> > I can fix this rather simply in our upstream fstests with:
> > =

> > static char *argv[] =3D {
> > 	"",
> > };
> > =

> > I guess.
> > =

> > But doesn't
> > =

> > static char *argv[] =3D {
> > 	NULL,
> > };
> > =

> > seem something that should work especially with execveat()?
> =

> The problem is that the exec'ed program sees an argc of 0, which is the
> problem we're trying to work around in the kernel (instead of leaving
> it to ld.so to fix for suid programs).

Ok, just seems a bit more intuitive for path-based exec than for
fd-based execveat().

What's argv[0] supposed to contain in these cases?

1. execveat(fd, NULL, ..., AT_EMPTY_PATH)
2. execveat(fd, "my-file", ..., )

"" in both 1. and 2.?
"" in 1. and "my-file" in 2.?
--===============3271889033346233595==--

