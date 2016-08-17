Content-Type: multipart/mixed; boundary="===============0838817574690110969=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [x86/uaccess] 5b710f34e1: kernel BUG at mm/usercopy.c:75!
Date: Wed, 17 Aug 2016 14:45:43 -0700
Message-ID: <CAGXu5jKb9hShNqBaR3cGaOn-r-3SAHB2aEbgCZsKxNOyYjZzvw@mail.gmail.com>
In-Reply-To: <1471469820.32433.74.camel@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0838817574690110969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2016 at 2:37 PM, Rik van Riel <riel@redhat.com> wrote:
> On Wed, 2016-08-17 at 09:14 -0700, Linus Torvalds wrote:
>
>> but compound pages are about the mapping of hugepages, not about
>> simple multi-order allocations like the task structure (or slab
>> entries).
>>
>> In other words, it looks like the memory hardening is simply broken
>> for any case that doesn't use kmalloc(), but instead just allocates
>> non-order-0 pages directly. Which is certainly _rare_, but not
>> unheard
>> of.
>>
>> I'm not sure how to fix it.The low-level page allocator does *not*
>> mark orders anywhere.
>>
>> I suspect we should just get rid of the page-crosser checking,
>> because
>> it's unsolvable.
>
> I glossed over the fact that prep_new_page only marks
> the page as a compound page if __GFP_COMP is set, which
> it is not for some higher order allocations, including
> GFP masks passed straight through by the SLOB allocator.
>
> This particular allocation is through kmalloc, but the
> kernel in question has CONFIG_SLOB=3Dy, and usercopy has
> no code in mm/slob.c

But PageSlab(page) should trip, returning __check_heap_object, which
for SLOB should just return NULL, skipping all the rest of the
checks...

-Kees

>
> I can think of two possibilities:
> - mark every higher order allocation so it can be
>   recognized later on (this might break allocators
>   that free part of a higher order allocation, I
>   do not know whether they exist)
> - drop this part of the usercopy code, and no longer
>   check that a range is part of an object that was
>   allocated all at once, or spans multiple memory
>   allocations - this may be ok, given that most
>   heap overflows are likely to be kmalloc/slab objects,
>   anyway
>
> kind regards,
>
> Rik
> --
>
> All Rights Reversed.



-- =

Kees Cook
Nexus Security

--===============0838817574690110969==--

