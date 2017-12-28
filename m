Content-Type: multipart/mixed; boundary="===============4966227918355740087=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/cpu_entry_area] 10043e02db: kernel_BUG_at_arch/x86/mm/physaddr.c
Date: Thu, 28 Dec 2017 12:51:14 +0100
Message-ID: <alpine.DEB.2.20.1712281250030.1688@nanos>
In-Reply-To: <CACT4Y+aEMHEYVF+XW_BwUJUY215Xy_t4vv4vwRzOw5YfzkiBgA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4966227918355740087==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 27 Dec 2017, Dmitry Vyukov wrote:
> On Wed, Dec 27, 2017 at 7:05 PM, Thomas Gleixner <tglx@linutronix.de> w=
rote:
> > So this dies simply because kasan_populate_shadow() runs out of memory =
and
> > has no sanity check whatsoever.
> >
> > static __init void *early_alloc(size_t size, int nid)
> > {
> >         return memblock_virt_alloc_try_nid_nopanic(size, size,
> >                 __pa(MAX_DMA_ADDRESS), BOOTMEM_ALLOC_ACCESSIBLE, nid);
> > }
> >
> > kasan_populate_pmd()
> > {
> >         .....
> >
> >                 p =3D early_alloc(PAGE_SIZE, nid);
> >                 entry =3D pfn_pte(PFN_DOWN(__pa(p)), PAGE_KERNEL);
> >
> > I've instrumented the whole thing and early_alloc() returns NULL at some
> > point and then __pa(NULL) dies in the VIRTUAL_DEBUG code. Well, it would
> > die with VIRTUAL_DEBUG=3Dn as well at some other place.
> >
> > Not really a problem caused by the patch above, it's merily exposing a =
code
> > path which relies blindly on "enough memory available" assumptions.
> >
> > Throwing more memory at the VM makes the problem go away...
> =

> Hi Thomas,
> =

> We just need a check inside of early_alloc() to properly diagnose such
> situation, right?

At least you want to panic with a proper out of memory message. But letting
the thing die at a random place is a bad idea.

Thanks,

	tglx




--===============4966227918355740087==--

