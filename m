Content-Type: multipart/mixed; boundary="===============6348318335196034642=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [scsi] 9393c8de62: Initramfs_unpacking_failed
Date: Sun, 17 Nov 2019 19:54:07 +0800
Message-ID: <20191117115407.GA9578@xsang-OptiPlex-9020>
In-Reply-To: <yq1v9rtvlv8.fsf@oracle.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6348318335196034642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 08, 2019 at 09:12:27PM -0500, Martin K. Petersen wrote:
> =

> Michael,
> =

> >>> [    1.278970] Trying to unpack rootfs image as initramfs...
> >>> [    4.011404] Initramfs unpacking failed: broken padding
> >>
> >> Was this test failure unrelated to commit 9393c8de62?
> >
> > Seems to be unrelated - a m68k kernel with that commit included, SCSI
> > core included but low-level driver built as a module(*)  boots into
> > the initramfs just fine.
> >
> > (*) well-known emulator bug.
> =

> I'm scratching my head too. I have tested a variety of systems and all
> of them boot and work fine.

sorry, it's our fault. the kernel built automatically seems broken at some =
stage.
After we recomplied the kernel, the issue gone. Sorry for any inconvenience.

> =

> -- =

> Martin K. Petersen	Oracle Linux Engineering
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============6348318335196034642==--

