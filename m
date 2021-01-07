Content-Type: multipart/mixed; boundary="===============7656825169563311470=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [x86] d55564cfc2: will-it-scale.per_thread_ops -5.8% regression
Date: Thu, 07 Jan 2021 18:58:16 +0000
Message-ID: <20210107185816.GJ3579531@ZenIV.linux.org.uk>
In-Reply-To: <CAHk-=wiZaFRt9hGen9=eOr7LA+Q8o5f980eGEvtxBD6+os7nqA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7656825169563311470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 07, 2021 at 10:47:07AM -0800, Linus Torvalds wrote:
> On Thu, Jan 7, 2021 at 10:34 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> > I'm not sure it's the best approach, TBH.  How about simply
> >         for (walk =3D head; walk; ufds +=3D walk->len, walk =3D walk->n=
ext) {
> >                 if (copy_to_user(ufds, walk->entries,
> >                                  walk->len * sizeof(struct pollfd))
> >                         goto out_fds;
> >         }
> > in there?  It's both simpler (obviously matches the copyin side) and
> > might very well be faster...
> =

> I started doing that, but ..  Nope.
> =

> It's not copying the whole entry. It's literally just modifying one
> 16-bit word in each entry.
> =

> Now, the "whole entry" is just 8 bytes, so it's possible that it would
> actually be faster to do a copy of the whole thing rather than write
> just the 16 bits. But I got very nervous about it, because I could
> easily see some threaded app actually changing the 'fd' (or the
> 'event' field) in place (ie writing -1 to it as they close and re-use
> it)

Point...  Pity, that.
--===============7656825169563311470==--

