Content-Type: multipart/mixed; boundary="===============6020111096255616962=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [x86/uaccess] 5b710f34e1: kernel BUG at mm/usercopy.c:75!
Date: Wed, 17 Aug 2016 14:45:24 -0700
Message-ID: <CA+55aFxYV8pqK_JXKM1na-qHZbX1uqRsAPHm7mV4+3Si1=EVnA@mail.gmail.com>
In-Reply-To: <1471469820.32433.74.camel@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6020111096255616962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2016 at 2:37 PM, Rik van Riel <riel@redhat.com> wrote:
>
> This particular allocation is through kmalloc, but the
> kernel in question has CONFIG_SLOB=3Dy, and usercopy has
> no code in mm/slob.c

Oh, I didn't notice that.

Maybe we can just say that HARDENING depends on !SLOB for now, and see
if anything else shows up.

Maybe we don't have any code that copies data from (non-kmalloc)
multi-order allocations to user space.

Networking does, but seems to use __GFP_COMP, at least in the one case
I checked (skbuff).

           Linus

--===============6020111096255616962==--

