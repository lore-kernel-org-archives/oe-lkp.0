Content-Type: multipart/mixed; boundary="===============4106160103831350735=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [x86/uaccess] 5b710f34e1: kernel BUG at mm/usercopy.c:75!
Date: Wed, 17 Aug 2016 14:53:46 -0700
Message-ID: <CAGXu5j+NfrtQeVDkvmtJefVfYkVih4+gm9+V3KCCXVbh_wA7dA@mail.gmail.com>
In-Reply-To: <CA+55aFz_Y-BcWs4rW_SkX1a0unnwjU6dzrwZogetB9_vc7ZsFQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4106160103831350735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2016 at 2:52 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Wed, Aug 17, 2016 at 2:45 PM, Kees Cook <keescook@chromium.org> wrot=
e:
>>
>> But PageSlab(page) should trip, returning __check_heap_object, which
>> for SLOB should just return NULL, skipping all the rest of the
>> checks...
>
> SLOB doesn't actually set that for all allocations.
>
> See "slob_alloc_node()", for example. It just returns a multi-order alloc=
ation.
>
> (See also kfree(), which uses PageSlab() to determine it it should do
> slob_free() or just free the pages directly).

Oooh, eww. Okay, that explains it. Alright, dropping all the
multi-page logic now...

-Kees

-- =

Kees Cook
Nexus Security

--===============4106160103831350735==--

