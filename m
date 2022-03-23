Content-Type: multipart/mixed; boundary="===============8148749412445783465=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [scsi] 6aded12b10: kernel_BUG_at_mm/usercopy.c
Date: Wed, 23 Mar 2022 08:40:30 -0700
Message-ID: <202203230809.D63BF9511@keescook>
In-Reply-To: <20220323071409.GA25480@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============8148749412445783465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2022 at 08:14:10AM +0100, Christoph Hellwig wrote:
> The actual warning is;
> =

> [   34.496096][  T331] usercopy: Kernel memory overwrite attempt detected=
 to spans multiple pages (off set 0, size 6)!
> =

> This is for the cmnd field in struct scsi_cmnd, which is allocated by
> the block layer as part of the request allocator.  So with a specific
> packing it can legitimately span pages.
> =

> Kees: how can we annotate that this is ok?

The main problem is that CONFIG_HARDENED_USERCOPY_PAGESPAN=3Dy is broken
(and nothing should be setting it).

This series removes it:
https://lore.kernel.org/linux-hardening/20220110231530.665970-1-willy(a)inf=
radead.org/

Matthew, what's the status of that series? Will it make the current
merge window?

As for the SCSI changes, I'm a bit worried about type confusion, as I
don't see anything actually validating types/sizes when converting:

static inline void *blk_mq_rq_to_pdu(struct request *rq)
{
        return rq + 1;
}

But I guess that ship has sailed. :P

Regardless, I'm concerned that disabling PAGESPAN will just uncover
further checks, though. Where is allocation happening? The check is here:

static int scsi_fill_sghdr_rq(struct scsi_device *sdev, struct request *rq,
                struct sg_io_hdr *hdr, fmode_t mode)
{
        struct scsi_cmnd *scmd =3D blk_mq_rq_to_pdu(rq);

        if (hdr->cmd_len < 6)
                return -EMSGSIZE;
        if (copy_from_user(scmd->cmnd, hdr->cmdp, hdr->cmd_len))
                return -EFAULT;
	...
}

I don't see any earlier marking for this copy_from_user(), so I assume
the old allocation was a plain kmalloc().

For comparision, a related marking can be seen for a copy_to_user() case
in commit 0afe76e88c57 ("scsi: Define usercopy region in scsi_sense_cache
slab cache")

I *think* the allocation is happening in scsi_ioctl_reset()? But that's
a plain kmalloc(), so I'm not sure why PAGESPAN would have tripped...
are there other allocation paths?

-- =

Kees Cook
--===============8148749412445783465==--

