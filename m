Content-Type: multipart/mixed; boundary="===============5396460525267976375=="
MIME-Version: 1.0
From: David Laight <David.Laight@ACULAB.COM>
To: lkp@lists.01.org
Subject: Re: [x86] d55564cfc2: will-it-scale.per_thread_ops -5.8% regression
Date: Fri, 08 Jan 2021 09:49:20 +0000
Message-ID: <cc0646c570f4489bb1bfb20688d64dbe@AcuMS.aculab.com>
In-Reply-To: <20210107183358.GG3579531@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============5396460525267976375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Al Viro
> Sent: 07 January 2021 18:34
> =

> On Thu, Jan 07, 2021 at 09:43:54AM -0800, Linus Torvalds wrote:
> =

> > Before, it would do the whole CLAC/STAC dance inside that loop for
> > every entry (and with that commit d55564cfc22 it would be a function
> > call, of course).
> >
> > Can you verify that this fixes the regression (and in fact I'd expect
> > it to improve that test-case)?
> =

> I'm not sure it's the best approach, TBH.  How about simply
>         for (walk =3D head; walk; ufds +=3D walk->len, walk =3D walk->nex=
t) {
> 		if (copy_to_user(ufds, walk->entries,
> 				 walk->len * sizeof(struct pollfd))
> 			goto out_fds;
>         }
> in there?  It's both simpler (obviously matches the copyin side) and
> might very well be faster...

I bet it isn't, especially if 'user copy hardening' is enabled.
You also have to 'negotiate' all the conditionals in copy_to_user()
for misaligned lengths, very short copies and alternate algorithms for
long copies.

I'll bet there is a measurable gain from having copy_to/from_user_u64()
that is optimised for copying a structure to/from userspace in 64bit
chunks.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

--===============5396460525267976375==--

