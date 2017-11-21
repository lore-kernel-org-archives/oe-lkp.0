Content-Type: multipart/mixed; boundary="===============8569635961274133449=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [ata_port_probe] BUG: unable to handle kernel NULL pointer dereference at 0000000000000350
Date: Tue, 21 Nov 2017 06:57:36 -0800
Message-ID: <20171121145719.GD983427@devbig577.frc2.facebook.com>
In-Reply-To: <CAK8P3a1c+u-r6+AD8=eKfRaoTgx0ByV_mVJWoJu7BzfDLk1JBA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8569635961274133449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Nov 21, 2017 at 01:54:25PM +0100, Arnd Bergmann wrote:
> > [   56.376960] ata2.00: ATAPI: QEMU DVD-ROM, 2.5+, max UDMA/100
> > [   56.379169] ata2.00: configured for MWDMA2
> > [   56.381518] ata2.00: disabled
> > [   56.385696] sd 1:0:0:0: [sda] Attached SCSI disk
> > [   56.395326] sd 1:0:0:0: [sda] Synchronizing SCSI cache
> =

> I guess both can be explained by the same race as the previous one, with
> async probe racing against removal. The first one might be a use-after-fr=
ee
> problem, the second one could be the probing thread running after the
> device got removed.

This is not a bug in libata.  This is caused by
CONFIG_DEBUG_TEST_DRIVER_REMOVE incorrectly detaching the driver
before probing is complete, which can't happen in normal operations
(we have async flush at the end of boot and around module operations).

Greg, this issue was identified way back.  It's a debug code which
causes failures which aren't possible.  Can we please either fix or
remove it?

Thanks.

-- =

tejun

--===============8569635961274133449==--

