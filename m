Content-Type: multipart/mixed; boundary="===============1096234841993702531=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/kconfig] 81d3871900: BUG:unable_to_handle_kernel
Date: Wed, 18 Oct 2017 15:15:03 +0200
Message-ID: <alpine.DEB.2.20.1710181509310.1925@nanos>
In-Reply-To: <CA+55aFxVnFeFcjt=MW=_Uxx6S7nJh5eFxhQCamE5BG6Jr8MXfg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1096234841993702531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Oct 2017, Linus Torvalds wrote:
> On Tue, Oct 17, 2017 at 3:33 AM, Joonsoo Kim <iamjoonsoo.kim@lge.com> w=
rote:
> >
> > It looks like a compiler bug. The code of slob_units() try to read two
> > bytes at ffff88001c4afffe. It's valid. But the compiler generates
> > wrong code that try to read four bytes.
> >
> > static slobidx_t slob_units(slob_t *s)
> > {
> >   if (s->units > 0)
> >     return s->units;
> >   return 1;
> > }
> >
> > s->units is defined as two bytes in this setup.
> >
> > Wrongly generated code for this part.
> >
> > 'mov 0x0(%rbp), %ebp'
> >
> > %ebp is four bytes.
> >
> > I guess that this wrong four bytes read cross over the valid memory
> > boundary and this issue happend.
> =

> Hmm. I can see why the compiler would do that (16-bit accesses are
> slow), but it's definitely wrong.
> =

> Does it work ok if that slob_units() code is written as
> =

>   static slobidx_t slob_units(slob_t *s)
>   {
>      int units =3D READ_ONCE(s->units);
> =

>      if (units > 0)
>          return units;
>      return 1;
>   }
> =

> which might be an acceptable workaround for now?

Discussed exactly that with Peter Zijlstra yesterday, but we came to the
conclusion that this is a whack a mole game. It might fix this slob issue,
but what guarantees that we don't have the same problem in some other
place? Just duct taping this particular instance makes me nervous.

Joonsoo says:

> gcc 4.8 and 4.9 fails to generate proper code. gcc 5.1 and
> the latest version works fine.

> I guess that this problem is related to the corner case of some
> optimization feature since minor code change makes the result
> different. And, with -O2, proper code is generated even if gcc 4.8 is
> used.

So it would be useful to figure out which optimization bit is causing that
and blacklist it for the affected compiler versions.

Thanks,

	tglx

--===============1096234841993702531==--

