Content-Type: multipart/mixed; boundary="===============4748283813969534496=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/kconfig] 81d3871900: BUG:unable_to_handle_kernel
Date: Wed, 18 Oct 2017 06:40:48 -0400
Message-ID: <CA+55aFxVnFeFcjt=MW=_Uxx6S7nJh5eFxhQCamE5BG6Jr8MXfg@mail.gmail.com>
In-Reply-To: <20171017073326.GA23865@js1304-P5Q-DELUXE>
List-Id: <oe-lkp.lists.linux.dev>

--===============4748283813969534496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2017 at 3:33 AM, Joonsoo Kim <iamjoonsoo.kim@lge.com> wro=
te:
>
> It looks like a compiler bug. The code of slob_units() try to read two
> bytes at ffff88001c4afffe. It's valid. But the compiler generates
> wrong code that try to read four bytes.
>
> static slobidx_t slob_units(slob_t *s)
> {
>   if (s->units > 0)
>     return s->units;
>   return 1;
> }
>
> s->units is defined as two bytes in this setup.
>
> Wrongly generated code for this part.
>
> 'mov 0x0(%rbp), %ebp'
>
> %ebp is four bytes.
>
> I guess that this wrong four bytes read cross over the valid memory
> boundary and this issue happend.

Hmm. I can see why the compiler would do that (16-bit accesses are
slow), but it's definitely wrong.

Does it work ok if that slob_units() code is written as

  static slobidx_t slob_units(slob_t *s)
  {
     int units =3D READ_ONCE(s->units);

     if (units > 0)
         return units;
     return 1;
  }

which might be an acceptable workaround for now?

                   Linus

--===============4748283813969534496==--

