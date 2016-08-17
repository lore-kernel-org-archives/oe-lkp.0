Content-Type: multipart/mixed; boundary="===============1545613690702853237=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [x86/uaccess] 5b710f34e1: kernel BUG at mm/usercopy.c:75!
Date: Wed, 17 Aug 2016 14:30:50 -0700
Message-ID: <CA+55aFzM85StntDU6tu8_iVuV_qt5DCzoNMo=w1iQ7ecXWK2Yw@mail.gmail.com>
In-Reply-To: <CAGXu5jJf6zTL96Hj_X9z3+b0_SNJRAM7pWM1OyD6t_WL9GaTsw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1545613690702853237==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2016 at 2:25 PM, Kees Cook <keescook@chromium.org> wrote:
>
> I had forwarded this bug Rik's way since the page-cross checking was
> suggested by him. I'm happy to drop it; it was a suggested improvement
> that was suspected to be safe (none of the folks testing this ran into
> it and we saw no report during its time in -next). I can prepare a
> patch if there isn't a better way to detect this kind of allocation.
> (FWIW, slab is handled separately.)

I can't think of any sane way to notice it normally.

Yes, with __GFP_COMPOUND you get the compound flag bits set, but as
mentioned, that's a special case for the large page VM handling, and
not applicable in general.

Very few things do higher order allocations outside of slab and the
task struct. But it does happen. Even fewer of those then have
contents that might get copied to user space, but it clearly happens
at least for _one_ case, and I can't convince myself that there might
not be other cases too..

                  Linus

--===============1545613690702853237==--

