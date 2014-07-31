Content-Type: multipart/mixed; boundary="===============2634629268239333671=="
MIME-Version: 1.0
From: Dan Williams <dan.j.williams@intel.com>
To: lkp@lists.01.org
Subject: Re: [xhci] kernel BUG at include/linux/scatterlist.h:115!
Date: Wed, 30 Jul 2014 17:10:50 -0700
Message-ID: <CAPcyv4gSrg310RFqNzERh2dse9HCAfkGLSR5OP04TCMNC8mg9A@mail.gmail.com>
In-Reply-To: <20140730035731.GE16537@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============2634629268239333671==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2014 at 8:57 PM, Fengguang Wu <fengguang.wu@intel.com> wr=
ote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> git://git.kernel.org/pub/scm/linux/kernel/git/djbw/usb.git td-fragments-v1
> commit 61d9c2ad31b11b87c319bbc2a963040742bac77c
> Author:     Dan Williams <dan.j.williams@intel.com>
> AuthorDate: Tue Jul 22 00:08:51 2014 -0700
> Commit:     Dan Williams <dan.j.williams@intel.com>
> CommitDate: Thu Jul 24 18:12:38 2014 -0700
>
>     xhci: unit test ring enqueue/dequeue routines
>
>     Given the complexity of satisfying xhci 1.0+ host trb boundary
>     constraints, provide a test case that exercises inserting mid-segment
>     links into a ring.
>
>     The linker --wrap=3D option is used to not pollute the global identif=
ier
>     space and to make it clear which standard xhci driver routines are be=
ing
>     mocked-up.  The --wrap=3D option does not come into play when both
>     xhci-hcd and xhci-test are built-in to the kernel, so namespace
>     collisions are prevented by excluding xhci-test from the build when
>     xhci-hcd is built-in.
>
>     It's unfortunate that this is an in-kernel test rather than userspace
>     and that the infrastructure is custom rather than generic.  That said,
>     it serves its purpose of exercising the corner cases of the scatterli=
st
>     parsing implementation in xhci.
>
>     Signed-off-by: Dan Williams <dan.j.williams@intel.com>

Looks like I either need specify valid addresses to sg_set_buf(), or
just make the unit test depend on !CONFIG_DEBUG_SG.  I'll go with the
latter since this test is not about scatterlist api correctness and
there's nothing to be gained by unwinding virt_addr_valid()
requirements for this.

--===============2634629268239333671==--

