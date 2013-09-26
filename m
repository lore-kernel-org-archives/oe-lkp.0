Content-Type: multipart/mixed; boundary="===============7742732992064997906=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: increased vmap_area_lock contentions on "n_tty: Move buffers into n_tty_data"
Date: Thu, 26 Sep 2013 14:58:22 -0700
Message-ID: <20130926145822.640206da116cdaac521c8bde@linux-foundation.org>
In-Reply-To: <5244AA5C.8060100@hurleysoftware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7742732992064997906==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Sep 2013 17:42:52 -0400 Peter Hurley <peter@hurleysoftware.com=
> wrote:

> On 09/26/2013 02:05 PM, Andrew Morton wrote:
> > On Thu, 26 Sep 2013 13:35:32 -0400 Peter Hurley <peter@hurleysoftware=
.com> wrote:
> >
> >> The issue with a single large kmalloc is that it may fail where
> >> 3 separate, page-or-less kmallocs would not have.
> >
> > Or vmalloc fails first, because of internal fragmentation of the vmap
> > arena.  This problem plus vmalloc's slowness are the reasons why
> > vmalloc should be avoided.
> =

> Ok, no vmalloc.
> =

> > A tremendous number of places in the kernel perform higher-order
> > allocations nowadays.  The page allocator works damn hard to service
> > them and I expect that switching to kmalloc here will be OK.
> =

> I've had order-4 allocation failures before on 10Gb.

Yep.  But this allocation will be order=3D2, yes?  And
PAGE_ALLOC_COSTLY_ORDER=3D3.  So if that thing is working correctly,
order=3D2 will do a lot better than order=3D4.

> In fact, the
> nouveau driver switched to vmalloc for that very reason (commit
> d005f51eb93d71cd40ebd11dd377453fa8c8a42a, drm/nouveau: use vmalloc
> for pgt allocation).

Sigh.  I'm not aware of any reports of anyone hitting arena
fragmentation problems yet, so it remains a theoretical thing.  But the
more we use vmalloc, the more likely it becomes.  And because the usage
sites are so disparate, fixing it will be pretty horrid.

For this reason (plus vmalloc is slow), I do think it's better to do
the old

	foo =3D kmalloc(__GFP_NOWARN);
	if (!foo)
		foo =3D vmalloc();

thing.  It's ugly, but will greatly reduce the amount of vmallocing
which happens.

Someone had a patch a while back which wraps this operation (and the
corresponding free) into library functions.  I said yuk and it wasn't
merged.  Perhaps that was a mistake.

--===============7742732992064997906==--

