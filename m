Content-Type: multipart/mixed; boundary="===============1639918775877115094=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [scsi] 6aded12b10: kernel_BUG_at_mm/usercopy.c
Date: Wed, 23 Mar 2022 15:33:30 -0700
Message-ID: <202203231531.02D8297F77@keescook>
In-Reply-To: <20220323154739.GA816@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============1639918775877115094==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2022 at 04:47:39PM +0100, Christoph Hellwig wrote:
> On Wed, Mar 23, 2022 at 08:40:30AM -0700, Kees Cook wrote:
> > Regardless, I'm concerned that disabling PAGESPAN will just uncover
> > further checks, though. Where is allocation happening? The check is her=
e:
> =

> blk_mq_alloc_rqs, using alloc_pages_node.  This hasn't actually changed
> with this comment.  Just the size of the allocation shrunk, probably
> leading to the span of pages.

Okay, the page allocator _should_ be fine for that. In the mean time,
lkp should probably just disable PAGESPAN.

> > I *think* the allocation is happening in scsi_ioctl_reset()? But that's
> > a plain kmalloc(), so I'm not sure why PAGESPAN would have tripped...
> > are there other allocation paths?
> =

> scsi_ioctl_reset is the odd one out and does also allocate a request,
> but that request is never used for user copies (and that whole hacky
> side path needs to go away, there is a huge series that needs to be
> finished to sort this out).

Gotcha!

-- =

Kees Cook
--===============1639918775877115094==--

