Content-Type: multipart/mixed; boundary="===============5371587663661288086=="
MIME-Version: 1.0
From: Christian Brauner <brauner@kernel.org>
To: lkp@lists.01.org
Subject: Re: [fs/exec] 80bd5afdd8: xfstests.generic.633.fail
Date: Mon, 31 Jan 2022 17:14:15 +0100
Message-ID: <20220131161415.wlvtsd4ecehyg3x5@wittgenstein>
In-Reply-To: <YfgFeWbZPl+gAUYE@casper.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5371587663661288086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 31, 2022 at 03:51:21PM +0000, Matthew Wilcox wrote:
> On Mon, Jan 31, 2022 at 04:37:07PM +0100, Christian Brauner wrote:
> > On Mon, Jan 31, 2022 at 03:19:22PM +0000, Matthew Wilcox wrote:
> > > On Mon, Jan 31, 2022 at 04:08:19PM +0100, Christian Brauner wrote:
> > > > On Mon, Jan 31, 2022 at 10:43:52PM +0800, kernel test robot wrote:
> > > > I can fix this rather simply in our upstream fstests with:
> > > > =

> > > > static char *argv[] =3D {
> > > > 	"",
> > > > };
> > > > =

> > > > I guess.
> > > > =

> > > > But doesn't
> > > > =

> > > > static char *argv[] =3D {
> > > > 	NULL,
> > > > };
> > > > =

> > > > seem something that should work especially with execveat()?
> > > =

> > > The problem is that the exec'ed program sees an argc of 0, which is t=
he
> > > problem we're trying to work around in the kernel (instead of leaving
> > > it to ld.so to fix for suid programs).
> > =

> > Ok, just seems a bit more intuitive for path-based exec than for
> > fd-based execveat().
> > =

> > What's argv[0] supposed to contain in these cases?
> > =

> > 1. execveat(fd, NULL, ..., AT_EMPTY_PATH)
> > 2. execveat(fd, "my-file", ..., )
> > =

> > "" in both 1. and 2.?
> > "" in 1. and "my-file" in 2.?
> =

> You didn't specify argv for either of those, so I have no idea.
> Programs shouldn't be assuming anything about argv[0]; it's purely
> advisory.  Unfortunately, some of them do.  And some of them are suid.

Yes, programs shouldn't assume anything about argv[0]. But a lot of
programs are used to setting argv[0] to the name of the executed binary.
The exec* manpages examples do this. Just looking at a random selftest, e.g.

bpf/prog_tests/test_lsm.c

where we find:

	char *CMD_ARGS[] =3D {"true", NULL};
	execvp(CMD_ARGS[0], CMD_ARGS);

I'm just wondering how common this is for execveat() because it is not
as clear what the actual name of the binary is in these two examples

	1.
	fd =3D open("/bin/true", );
	char *CMD_ARGS[] =3D {"", NULL};
	execveat(fd, NULL, ..., AT_EMPTY_PATH)
	=

	2.
	fd =3D open("/bin", );
	char *CMD_ARGS[] =3D {"true", NULL};
	execveat(fd, CMD_ARGS[0], CMD_ARGS 0)

in other words, the changes that you see CMD_ARGS[0] =3D=3D NULL for
execveat() seem higher than for path-based exec.

To counter that we should probably at least update the execveat()
manpage with a recommendation what CMD_ARGS[0] should be set to if it
isn't allowed to be set to NULL anymore. This is why was asking what
argv[0] is supposed to be if the binary doesn't take any arguments.
--===============5371587663661288086==--

