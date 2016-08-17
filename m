Content-Type: multipart/mixed; boundary="===============0427615304793092515=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [x86/uaccess] 5b710f34e1: kernel BUG at mm/usercopy.c:75!
Date: Wed, 17 Aug 2016 14:57:47 -0700
Message-ID: <CAGXu5jLQKicH96W_jjvw_J3KTFpVsERQqhJphsq1oQ2t=OJ36Q@mail.gmail.com>
In-Reply-To: <CA+55aFztyqMH5DJXVGdjbsaGKnNCyG4kYaicvqNeNF3=oVmuhQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0427615304793092515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2016 at 2:55 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Wed, Aug 17, 2016 at 2:50 PM, Kees Cook <keescook@chromium.org> wrot=
e:
>> On Wed, Aug 17, 2016 at 2:45 PM, Linus Torvalds
>>>
>>> Networking does, but seems to use __GFP_COMP, at least in the one case
>>> I checked (skbuff).
>>
>> Was this allocation really through kmalloc?
>
> The networking one I looked at, no. But they do __GFP_COMP.
>
> The task struct allocation generally is (alloc_task_struct_node()),
> but as Rik pointed out, SLOB doesn't actually necessarily do the slab
> book-keeping for multi-page allocations.

Perhaps I can just ifdef the multi-page checks with
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR. That way a SLOB build still
has basic bounds checking (which was my intention with that config),
and non-SLOB builds still get multi-page checking.

-Kees

-- =

Kees Cook
Nexus Security

--===============0427615304793092515==--

