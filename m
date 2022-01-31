Content-Type: multipart/mixed; boundary="===============7755556484339152108=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [fs/exec] 80bd5afdd8: xfstests.generic.633.fail
Date: Mon, 31 Jan 2022 15:19:22 +0000
Message-ID: <Yff9+tIDAvYM5EO/@casper.infradead.org>
In-Reply-To: <20220131150819.iuqlz3rz6q7cheap@wittgenstein>
List-Id: <oe-lkp.lists.linux.dev>

--===============7755556484339152108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 31, 2022 at 04:08:19PM +0100, Christian Brauner wrote:
> On Mon, Jan 31, 2022 at 10:43:52PM +0800, kernel test robot wrote:
> I can fix this rather simply in our upstream fstests with:
> =

> static char *argv[] =3D {
> 	"",
> };
> =

> I guess.
> =

> But doesn't
> =

> static char *argv[] =3D {
> 	NULL,
> };
> =

> seem something that should work especially with execveat()?

The problem is that the exec'ed program sees an argc of 0, which is the
problem we're trying to work around in the kernel (instead of leaving
it to ld.so to fix for suid programs).
--===============7755556484339152108==--

