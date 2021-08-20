Content-Type: multipart/mixed; boundary="===============2957152266203048501=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [scsi] 61b3baad24: last_state.load_disk_fail
Date: Fri, 20 Aug 2021 11:16:27 +0200
Message-ID: <20210820091627.GA6035@lst.de>
In-Reply-To: <20210820074013.GC29369@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2957152266203048501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 20, 2021 at 03:40:13PM +0800, Oliver Sang wrote:
> Hi, Christoph Hellwig,
> =

> recently we checked this commit again, and find it has a new commit id
> as well as the parent:
>     f2542a3be3277 scsi: scsi_ioctl: Move the "block layer" SCSI ioctl han=
dling to drivers/scsi
>     7353dc06c9a8e scsi: scsi_ioctl: Simplify SCSI passthrough permission =
checking
> =

> so we tested it again, and found the issue is still reproduced in
> our environment persistently.
> =

> we also tried another platform, and could reproduce, too.
>     Intel(R) Xeon(R) CPU E7-8890 v3 @ 2.50GHz
> =

> in parent dmesg (attached as dmesg-7353dc06c9.xz),
> it's clear that the disk mounted without problem:
> [   31.549031][ T1791] XFS (sda1): Mounting V5 Filesystem
> [   31.591680][ T1791] XFS (sda1): Starting recovery (logdev: internal)
> [   31.608990][ T1791] XFS (sda1): Ending recovery (logdev: internal)
> [   31.625155][ T1791] xfs filesystem being mounted at /opt/rootfs suppor=
ts timestamps until 2038 (0x7fffffff)
> =

> but in the dmesg for commit f2542a3be3277 (attached as dmesg-f2542a3be3.x=
z),
> which is from the identical test environment except kernel,
> just failed like below:
> [   62.411699][ T1661] can't load the disk /dev/disk/by-id/ata-INTEL_SSDS=
C2BA400G4_BTHV634503K3400NGN-part1, skip testing...

Really strange.  This message is printed when wait_load_disk fails.

The kernel has probed all disks before, then apparently something
is installed using dpkg and then it waits for this rootfs (which
obviously isn't the root at that point).

Also at least on my debian testing and oldstable systems a plain
blkid call never even calls SG_IO or related ioctls (which makes sense
given that it looks at the file system labels).

Does tis issue just show up on one particular system or on multiple
different ones?
--===============2957152266203048501==--

