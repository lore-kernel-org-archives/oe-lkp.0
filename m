Content-Type: multipart/mixed; boundary="===============8936842695005996945=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/kconfig] 81d3871900: BUG:unable_to_handle_kernel
Date: Fri, 13 Oct 2017 10:37:35 -0500
Message-ID: <20171013153735.yywauekabxnczg74@treble>
In-Reply-To: <alpine.DEB.2.20.1710131021240.3949@nuc-kabylake>
List-Id: <oe-lkp.lists.linux.dev>

--===============8936842695005996945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2017 at 10:22:54AM -0500, Christopher Lameter wrote:
> On Thu, 12 Oct 2017, Josh Poimboeuf wrote:
> =

> > > Can you run SLUB with full debug? specify slub_debug on the commandli=
ne or
> > > set CONFIG_SLUB_DEBUG_ON
> >
> > Oddly enough, with CONFIG_SLUB+slub_debug, I get the same crypto panic I
> > got with CONFIG_SLOB.  The trapping instruction is:
> >
> >   vmovdqa 0x140(%rdi),%xmm0
> >
> > I'll try to bisect it tomorrow.  It at least goes back to v4.10.  I'm
> > not really sure whether this panic is related to SLUB or SLOB at all.
> =

> Guess not. The slab allocators can fail if the metadata gets corrupted.
> That is why we have extensive debug modes so we can find who is to blame
> for corruptions.
> =

> > (Though the original panic reported upthread by the kernel test robot
> > *does* look SLOB related.)
> =

> Yup. Just happened to be configured for SLOB then.

Just to clarify, the upthread panic in SLOB is *not* related to the
crypto issue.  So somebody still needs to look at that one:

  https://lkml.kernel.org/r/20171010121513.GC5445(a)yexl-desktop

-- =

Josh

--===============8936842695005996945==--

