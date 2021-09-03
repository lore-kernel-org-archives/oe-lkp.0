Content-Type: multipart/mixed; boundary="===============1309827553238571637=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [scsi] 61b3baad24: last_state.load_disk_fail
Date: Fri, 03 Sep 2021 14:28:00 +0800
Message-ID: <20210903062800.GB29784@xsang-OptiPlex-9020>
In-Reply-To: <20210820091627.GA6035@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============1309827553238571637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Christoph Hellwig,

On Fri, Aug 20, 2021 at 11:16:27AM +0200, Christoph Hellwig wrote:
> On Fri, Aug 20, 2021 at 03:40:13PM +0800, Oliver Sang wrote:
> > Hi, Christoph Hellwig,
> > =

> > recently we checked this commit again, and find it has a new commit id
> > as well as the parent:
> >     f2542a3be3277 scsi: scsi_ioctl: Move the "block layer" SCSI ioctl h=
andling to drivers/scsi
> >     7353dc06c9a8e scsi: scsi_ioctl: Simplify SCSI passthrough permissio=
n checking
> > =

> > so we tested it again, and found the issue is still reproduced in
> > our environment persistently.
> > =

> > we also tried another platform, and could reproduce, too.
> >     Intel(R) Xeon(R) CPU E7-8890 v3 @ 2.50GHz
> > =

> > in parent dmesg (attached as dmesg-7353dc06c9.xz),
> > it's clear that the disk mounted without problem:
> > [   31.549031][ T1791] XFS (sda1): Mounting V5 Filesystem
> > [   31.591680][ T1791] XFS (sda1): Starting recovery (logdev: internal)
> > [   31.608990][ T1791] XFS (sda1): Ending recovery (logdev: internal)
> > [   31.625155][ T1791] xfs filesystem being mounted at /opt/rootfs supp=
orts timestamps until 2038 (0x7fffffff)
> > =

> > but in the dmesg for commit f2542a3be3277 (attached as dmesg-f2542a3be3=
.xz),
> > which is from the identical test environment except kernel,
> > just failed like below:
> > [   62.411699][ T1661] can't load the disk /dev/disk/by-id/ata-INTEL_SS=
DSC2BA400G4_BTHV634503K3400NGN-part1, skip testing...
> =

> Really strange.  This message is printed when wait_load_disk fails.
> =

> The kernel has probed all disks before, then apparently something
> is installed using dpkg and then it waits for this rootfs (which
> obviously isn't the root at that point).
> =

> Also at least on my debian testing and oldstable systems a plain
> blkid call never even calls SG_IO or related ioctls (which makes sense
> given that it looks at the file system labels).
> =

> Does tis issue just show up on one particular system or on multiple
> different ones?

we observed this on multiple platforms,
and now we confirmed this was fixed by below commit:

commit 04a71cdc46a94b13ee876290ad961b4886e24c76
Author:     Halil Pasic <pasic@linux.ibm.com>
AuthorDate: Mon Aug 23 15:34:58 2021 +0200
Commit:     Martin K. Petersen <martin.petersen@oracle.com>
CommitDate: Tue Aug 24 22:56:32 2021 -0400

    scsi: core: scsi_ioctl: Fix error code propagation in SG_IO

    Link: https://lore.kernel.org/r/20210823133458.3536824-1-pasic(a)linux.=
ibm.com
    Fixes: f2542a3be327 ("scsi: scsi_ioctl: Move the "block layer" SCSI ioc=
tl handling to drivers/scsi")
    Reviewed-by: Christoph Hellwig <hch@lst.de>
    Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
    Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>

diff --git a/drivers/scsi/scsi_ioctl.c b/drivers/scsi/scsi_ioctl.c
index 7b2b0a1581f4f..6ff2207bd45a0 100644
--- a/drivers/scsi/scsi_ioctl.c
+++ b/drivers/scsi/scsi_ioctl.c
@@ -874,7 +874,7 @@ static int scsi_ioctl_sg_io(struct scsi_device *sdev, s=
truct gendisk *disk,
                return error;
        if (put_sg_io_hdr(&hdr, argp))
                return -EFAULT;
-       return 0;
+       return error;
 }

 /**


--===============1309827553238571637==--

