Content-Type: multipart/mixed; boundary="===============8744587585719221229=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Sun, 14 Aug 2016 06:51:28 +0800
Message-ID: <20160813225128.GA6416@wfg-t540p.sh.intel.com>
In-Reply-To: <20160813221507.GA1368@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============8744587585719221229==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Sun, Aug 14, 2016 at 12:15:08AM +0200, Christoph Hellwig wrote:
>Hi Fengguang,
>
>feel free to try this git tree:
>
>   git://git.infradead.org/users/hch/vfs.git iomap-fixes

I just queued some test jobs for it.

% queue -q vip -t ivb44 -b hch-vfs/iomap-fixes aim7-fs-1brd.yaml fs=3Dxfs -=
r3 -k fe9c2c81ed073878768785a985295cbacc349e42 -k ca2edab2e1d8f30dda874b7f7=
17c2d4664991e9b -k 99091700659f4df965e138b38b4fa26a29b7eade

That job file can be found here:

        https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/tree=
/jobs/aim7-fs-1brd.yaml

It specifies a matrix of the below atom tests:

        wfg /c/lkp-tests% split-job jobs/aim7-fs-1brd.yaml -s 'fs: xfs'

        jobs/aim7-fs-1brd.yaml =3D> ./aim7-fs-1brd-1BRD_48G-xfs-disk_src-30=
00-performance.yaml
        jobs/aim7-fs-1brd.yaml =3D> ./aim7-fs-1brd-1BRD_48G-xfs-disk_rr-300=
0-performance.yaml
        jobs/aim7-fs-1brd.yaml =3D> ./aim7-fs-1brd-1BRD_48G-xfs-disk_rw-300=
0-performance.yaml
        jobs/aim7-fs-1brd.yaml =3D> ./aim7-fs-1brd-1BRD_48G-xfs-disk_cp-300=
0-performance.yaml
        jobs/aim7-fs-1brd.yaml =3D> ./aim7-fs-1brd-1BRD_48G-xfs-disk_wrt-30=
00-performance.yaml
        jobs/aim7-fs-1brd.yaml =3D> ./aim7-fs-1brd-1BRD_48G-xfs-sync_disk_r=
w-600-performance.yaml
        jobs/aim7-fs-1brd.yaml =3D> ./aim7-fs-1brd-1BRD_48G-xfs-creat-clo-1=
500-performance.yaml
        jobs/aim7-fs-1brd.yaml =3D> ./aim7-fs-1brd-1BRD_48G-xfs-disk_rd-900=
0-performance.yaml

If you see other suitable tests for this patch, feel free to drop me a
hint.  I'v queued these jobs to the other machines to make them run in
parallel.

% queue -q vip -t ivb43 -b hch-vfs/iomap-fixes fsmark-stress-journal-1hdd.y=
aml fsmark-stress-journal-1brd.yaml fs=3Dxfs -r3 -k fe9c2c81ed073878768785a=
985295cbacc349e42 -k ca2edab2e1d8f30dda874b7f717c2d4664991e9b -k 9909170065=
9f4df965e138b38b4fa26a29b7eade

% queue -q vip -t ivb44 -b hch-vfs/iomap-fixes fsmark-generic-1brd.yaml dd-=
write-1hdd.yaml  fsmark-generic-1hdd.yaml  fs=3Dxfs -r3 -k fe9c2c81ed073878=
768785a985295cbacc349e42 -k ca2edab2e1d8f30dda874b7f717c2d4664991e9b -k 990=
91700659f4df965e138b38b4fa26a29b7eade

% queue -q vip -t lkp-hsx02 -b hch-vfs/iomap-fixes fsmark-generic-brd-raid.=
yaml fs=3Dxfs -r3 -k fe9c2c81ed073878768785a985[0/1710]349e42 -k ca2edab2e1=
d8f30dda874b7f717c2d4664991e9b -k 99091700659f4df965e138b38b4fa26a29b7eade

% queue -q vip -t lkp-hsw-ep4 -b hch-vfs/iomap-fixes fsmark-1ssd-nvme-small=
.yaml fs=3Dxfs -r3 -k fe9c2c81ed073878768785a985295cbacc349e42 -k ca2edab2e=
1d8f30dda874b7f717c2d4664991e9b -k 99091700659f4df965e138b38b4fa26a29b7eade

Thanks,
Fengguang

--===============8744587585719221229==--

