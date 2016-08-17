Content-Type: multipart/mixed; boundary="===============8268364828174163763=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [x86/uaccess] 5b710f34e1: kernel BUG at mm/usercopy.c:75!
Date: Wed, 17 Aug 2016 14:34:37 -0700
Message-ID: <CAGXu5jLSoF=JvvjYsdsFsPbUzrKMcAJK+7Q5P8EwCA2EQsQ7hA@mail.gmail.com>
In-Reply-To: <CA+55aFzM85StntDU6tu8_iVuV_qt5DCzoNMo=w1iQ7ecXWK2Yw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8268364828174163763==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2016 at 2:30 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Wed, Aug 17, 2016 at 2:25 PM, Kees Cook <keescook@chromium.org> wrot=
e:
>>
>> I had forwarded this bug Rik's way since the page-cross checking was
>> suggested by him. I'm happy to drop it; it was a suggested improvement
>> that was suspected to be safe (none of the folks testing this ran into
>> it and we saw no report during its time in -next). I can prepare a
>> patch if there isn't a better way to detect this kind of allocation.
>> (FWIW, slab is handled separately.)
>
> I can't think of any sane way to notice it normally.
>
> Yes, with __GFP_COMPOUND you get the compound flag bits set, but as
> mentioned, that's a special case for the large page VM handling, and
> not applicable in general.
>
> Very few things do higher order allocations outside of slab and the
> task struct. But it does happen. Even fewer of those then have
> contents that might get copied to user space, but it clearly happens
> at least for _one_ case, and I can't convince myself that there might
> not be other cases too..

Yup, totally, I'll send a patch to remove this and Rik and I can
investigate re-adding it later.

-Kees

-- =

Kees Cook
Nexus Security

--===============8268364828174163763==--

