Content-Type: multipart/mixed; boundary="===============6694632220936966074=="
MIME-Version: 1.0
From: Peter Hurley <peter@hurleysoftware.com>
To: lkp@lists.01.org
Subject: Re: increased vmap_area_lock contentions on "n_tty: Move buffers into n_tty_data"
Date: Thu, 26 Sep 2013 17:42:52 -0400
Message-ID: <5244AA5C.8060100@hurleysoftware.com>
In-Reply-To: <20130926110551.52ad8156.akpm@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6694632220936966074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/26/2013 02:05 PM, Andrew Morton wrote:
> On Thu, 26 Sep 2013 13:35:32 -0400 Peter Hurley <peter@hurleysoftware.c=
om> wrote:
>
>> The issue with a single large kmalloc is that it may fail where
>> 3 separate, page-or-less kmallocs would not have.
>
> Or vmalloc fails first, because of internal fragmentation of the vmap
> arena.  This problem plus vmalloc's slowness are the reasons why
> vmalloc should be avoided.

Ok, no vmalloc.

> A tremendous number of places in the kernel perform higher-order
> allocations nowadays.  The page allocator works damn hard to service
> them and I expect that switching to kmalloc here will be OK.

I've had order-4 allocation failures before on 10Gb. In fact, the
nouveau driver switched to vmalloc for that very reason (commit
d005f51eb93d71cd40ebd11dd377453fa8c8a42a, drm/nouveau: use vmalloc
for pgt allocation).

Regards,
Peter Hurley

--===============6694632220936966074==--

