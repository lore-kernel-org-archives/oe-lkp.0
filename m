Content-Type: multipart/mixed; boundary="===============1136277295371830298=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [x86/uaccess] 5b710f34e1: kernel BUG at mm/usercopy.c:75!
Date: Wed, 17 Aug 2016 14:55:21 -0700
Message-ID: <CA+55aFztyqMH5DJXVGdjbsaGKnNCyG4kYaicvqNeNF3=oVmuhQ@mail.gmail.com>
In-Reply-To: <CAGXu5j+gZcACiLNttZmRTiWJVRZzCfE8Zjjv=gOaziKEufLUYA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1136277295371830298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2016 at 2:50 PM, Kees Cook <keescook@chromium.org> wrote:
> On Wed, Aug 17, 2016 at 2:45 PM, Linus Torvalds
>>
>> Networking does, but seems to use __GFP_COMP, at least in the one case
>> I checked (skbuff).
>
> Was this allocation really through kmalloc?

The networking one I looked at, no. But they do __GFP_COMP.

The task struct allocation generally is (alloc_task_struct_node()),
but as Rik pointed out, SLOB doesn't actually necessarily do the slab
book-keeping for multi-page allocations.

               Linus

--===============1136277295371830298==--

