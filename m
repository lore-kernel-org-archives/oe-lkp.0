Content-Type: multipart/mixed; boundary="===============0103352812582137400=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [lkp-developer] [xfs] acdda3aae1: WARNING:at_fs/iomap.c:#iomap_dio_rw
Date: Thu, 22 Dec 2016 07:20:19 +0100
Message-ID: <20161222062019.GB31630@lst.de>
In-Reply-To: <20161221185658.GB21332@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0103352812582137400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 22, 2016 at 02:56:58AM +0800, kernel test robot wrote:
> [  700.619048] XFS (sdf1): Ending clean mount
> [  701.352337] ------------[ cut here ]------------
> [  701.357125] WARNING: CPU: 0 PID: 16179 at fs/iomap.c:950 iomap_dio_rw+=
0x3b7/0x3d0

This is the racy direct vs buffered I/O warning we had for a long time in
XFS, it just moved to a new place.

--===============0103352812582137400==--

