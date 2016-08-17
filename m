Content-Type: multipart/mixed; boundary="===============0549439209342707603=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [x86/uaccess] 5b710f34e1: kernel BUG at mm/usercopy.c:75!
Date: Wed, 17 Aug 2016 14:50:35 -0700
Message-ID: <CAGXu5j+gZcACiLNttZmRTiWJVRZzCfE8Zjjv=gOaziKEufLUYA@mail.gmail.com>
In-Reply-To: <CA+55aFxYV8pqK_JXKM1na-qHZbX1uqRsAPHm7mV4+3Si1=EVnA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0549439209342707603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2016 at 2:45 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Wed, Aug 17, 2016 at 2:37 PM, Rik van Riel <riel@redhat.com> wrote:
>>
>> This particular allocation is through kmalloc, but the
>> kernel in question has CONFIG_SLOB=3Dy, and usercopy has
>> no code in mm/slob.c
>
> Oh, I didn't notice that.
>
> Maybe we can just say that HARDENING depends on !SLOB for now, and see
> if anything else shows up.

This logic (for avoiding uninstrumented allocators, which is only
SLOB) already exists (via CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR).
And PageSlab(page) should be catching this, so that the logic of "this
is from the allocator, so we must use its checker" is supposed to get
invoked.

> Maybe we don't have any code that copies data from (non-kmalloc)
> multi-order allocations to user space.
>
> Networking does, but seems to use __GFP_COMP, at least in the one case
> I checked (skbuff).

Was this allocation really through kmalloc?

-Kees

-- =

Kees Cook
Nexus Security

--===============0549439209342707603==--

