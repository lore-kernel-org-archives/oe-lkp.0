Content-Type: multipart/mixed; boundary="===============7062887998640430824=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [x86/uaccess] 5b710f34e1: kernel BUG at mm/usercopy.c:75!
Date: Wed, 17 Aug 2016 14:52:15 -0700
Message-ID: <CA+55aFz_Y-BcWs4rW_SkX1a0unnwjU6dzrwZogetB9_vc7ZsFQ@mail.gmail.com>
In-Reply-To: <CAGXu5jKb9hShNqBaR3cGaOn-r-3SAHB2aEbgCZsKxNOyYjZzvw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7062887998640430824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2016 at 2:45 PM, Kees Cook <keescook@chromium.org> wrote:
>
> But PageSlab(page) should trip, returning __check_heap_object, which
> for SLOB should just return NULL, skipping all the rest of the
> checks...

SLOB doesn't actually set that for all allocations.

See "slob_alloc_node()", for example. It just returns a multi-order allocat=
ion.

(See also kfree(), which uses PageSlab() to determine it it should do
slob_free() or just free the pages directly).

         Linus

--===============7062887998640430824==--

