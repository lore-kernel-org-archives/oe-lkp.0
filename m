Content-Type: multipart/mixed; boundary="===============9187112730871976278=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [scsi] 6aded12b10: kernel_BUG_at_mm/usercopy.c
Date: Wed, 23 Mar 2022 16:47:39 +0100
Message-ID: <20220323154739.GA816@lst.de>
In-Reply-To: <202203230809.D63BF9511@keescook>
List-Id: <oe-lkp.lists.linux.dev>

--===============9187112730871976278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2022 at 08:40:30AM -0700, Kees Cook wrote:
> Regardless, I'm concerned that disabling PAGESPAN will just uncover
> further checks, though. Where is allocation happening? The check is here:

blk_mq_alloc_rqs, using alloc_pages_node.  This hasn't actually changed
with this comment.  Just the size of the allocation shrunk, probably
leading to the span of pages.

> I *think* the allocation is happening in scsi_ioctl_reset()? But that's
> a plain kmalloc(), so I'm not sure why PAGESPAN would have tripped...
> are there other allocation paths?

scsi_ioctl_reset is the odd one out and does also allocate a request,
but that request is never used for user copies (and that whole hacky
side path needs to go away, there is a huge series that needs to be
finished to sort this out).
--===============9187112730871976278==--

