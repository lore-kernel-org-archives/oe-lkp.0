Content-Type: multipart/mixed; boundary="===============6179113608096365423=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [scsi] 6aded12b10: kernel_BUG_at_mm/usercopy.c
Date: Wed, 23 Mar 2022 15:30:44 -0700
Message-ID: <202203231529.0CB76344@keescook>
In-Reply-To: <Yjs/6pLB1uDKBRCG@casper.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6179113608096365423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2022 at 03:42:34PM +0000, Matthew Wilcox wrote:
> On Wed, Mar 23, 2022 at 08:40:30AM -0700, Kees Cook wrote:
> > On Wed, Mar 23, 2022 at 08:14:10AM +0100, Christoph Hellwig wrote:
> > > The actual warning is;
> > > =

> > > [   34.496096][  T331] usercopy: Kernel memory overwrite attempt dete=
cted to spans multiple pages (off set 0, size 6)!
> > > =

> > > This is for the cmnd field in struct scsi_cmnd, which is allocated by
> > > the block layer as part of the request allocator.  So with a specific
> > > packing it can legitimately span pages.
> > > =

> > > Kees: how can we annotate that this is ok?
> > =

> > The main problem is that CONFIG_HARDENED_USERCOPY_PAGESPAN=3Dy is broken
> > (and nothing should be setting it).
> > =

> > This series removes it:
> > https://lore.kernel.org/linux-hardening/20220110231530.665970-1-willy(a=
)infradead.org/
> > =

> > Matthew, what's the status of that series? Will it make the current
> > merge window?
> =

> I thought you were going to merge it!  I haven't put it in any of my
> public trees.

LOL. Okay, you'd mentioned another check, so I wasn't sure. I can go
ahead and snag it, but I'll likely wait until the next window and let it
live in -next for a while, unless you think it should get YOLOed in. :)

-Kees

-- =

Kees Cook
--===============6179113608096365423==--

