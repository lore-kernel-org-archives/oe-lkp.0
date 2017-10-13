Content-Type: multipart/mixed; boundary="===============0828240618353219081=="
MIME-Version: 1.0
From: Christopher Lameter <cl@linux.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/kconfig] 81d3871900: BUG:unable_to_handle_kernel
Date: Fri, 13 Oct 2017 10:22:54 -0500
Message-ID: <alpine.DEB.2.20.1710131021240.3949@nuc-kabylake>
In-Reply-To: <20171013044521.662ck56gkwaw3xog@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============0828240618353219081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Oct 2017, Josh Poimboeuf wrote:

> > Can you run SLUB with full debug? specify slub_debug on the commandline=
 or
> > set CONFIG_SLUB_DEBUG_ON
>
> Oddly enough, with CONFIG_SLUB+slub_debug, I get the same crypto panic I
> got with CONFIG_SLOB.  The trapping instruction is:
>
>   vmovdqa 0x140(%rdi),%xmm0
>
> I'll try to bisect it tomorrow.  It at least goes back to v4.10.  I'm
> not really sure whether this panic is related to SLUB or SLOB at all.

Guess not. The slab allocators can fail if the metadata gets corrupted.
That is why we have extensive debug modes so we can find who is to blame
for corruptions.

> (Though the original panic reported upthread by the kernel test robot
> *does* look SLOB related.)

Yup. Just happened to be configured for SLOB then.


--===============0828240618353219081==--

