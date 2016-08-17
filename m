Content-Type: multipart/mixed; boundary="===============4520876981776507481=="
MIME-Version: 1.0
From: Rik van Riel <riel@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86/uaccess] 5b710f34e1: kernel BUG at mm/usercopy.c:75!
Date: Wed, 17 Aug 2016 17:37:00 -0400
Message-ID: <1471469820.32433.74.camel@redhat.com>
In-Reply-To: <CA+55aFw2Hxyavo5unZuu8YkNbsSwC1G5dSsrWYpNSq3kFnRWHg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4520876981776507481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-08-17 at 09:14 -0700, Linus Torvalds wrote:

> but compound pages are about the mapping of hugepages, not about
> simple multi-order allocations like the task structure (or slab
> entries).
> =

> In other words, it looks like the memory hardening is simply broken
> for any case that doesn't use kmalloc(), but instead just allocates
> non-order-0 pages directly. Which is certainly _rare_, but not
> unheard
> of.
> =

> I'm not sure how to fix it.The low-level page allocator does *not*
> mark orders anywhere.
> =

> I suspect we should just get rid of the page-crosser checking,
> because
> it's unsolvable.

I glossed over the fact that prep_new_page only marks
the page as a compound page if __GFP_COMP is set, which
it is not for some higher order allocations, including
GFP masks passed straight through by the SLOB allocator.

This particular allocation is through kmalloc, but the
kernel in question has CONFIG_SLOB=3Dy, and usercopy has
no code in mm/slob.c

I can think of two possibilities:
- mark every higher order allocation so it can be
=C2=A0 recognized later on (this might break allocators
=C2=A0 that free part of a higher order allocation, I
=C2=A0 do not know whether they exist)
- drop this part of the usercopy code, and no longer
=C2=A0 check that a range is part of an object that was
=C2=A0 allocated all at once, or spans multiple memory
=C2=A0 allocations - this may be ok, given that most
=C2=A0 heap overflows are likely to be kmalloc/slab objects,
=C2=A0 anyway

kind regards,

Rik
-- =


All Rights Reversed.

--===============4520876981776507481==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIKCmlRRWNCQUFC
Q0FBR0JRSlh0Tmo5QUFvSkVNNTUzcEtFeE42RFVHOEgvMXNsYjhucTVVU3F2bUVNV0Rqd2FLZUEK
M0dHOUVLQWJReTY1b0FyT0UxblJNVzgyZkJpbllVaEZKR1BjSTFycUwvSkF0RHJrNTBCSzNGSnA5
OWI4Sjl1WgpVVWd1ZmJDdmhZVzF3bWIxRmd4dkVSM3pTSWM0TjFUdFIvaEFEaXlmZkwrUHlnVWZR
TnM2QkYyeUR2elMwZkYwCjJlZ2hsVHdSWlFhZWJ5bUtST0RjaUdQTXVhQ3BYV2JQZ3VZR0NrYWxa
MVZGdUcwT1pTcVowWDBjQ0N3S0owc04KcXg0VVJOYlY5VVFZRzBDRDd6eW80K2U0WjRRbWVFSVJ3
YkpPWkNlQ1NmWkQ0RWhoSWRGenpuaENZRFVzKzVwYwpNQmNILzNURlI5OEJseHFWUGY2bnhtMHVw
ZE5iYkVmbjAwL2ErSHc3T0xWaHRzWnJqV1RBTHE3c2tPM3FCdmM9Cj1JNW9YCi0tLS0tRU5EIFBH
UCBTSUdOQVRVUkUtLS0tLQo=

--===============4520876981776507481==--

