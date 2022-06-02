Content-Type: multipart/mixed; boundary="===============2159146818666323703=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 5349b2afc1: xfstests.xfs.299.fail
Date: Fri, 03 Jun 2022 07:40:37 +1000
Message-ID: <20220602214037.GE1098723@dread.disaster.area>
In-Reply-To: <20220602085053.GC27190@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2159146818666323703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2022 at 04:50:53PM +0800, kernel test robot wrote:
> =

> (please be noted we reported
> "[xfs]  5349b2afc1: xfstests.xfs.050.fail"
> on
> https://lore.kernel.org/all/20220518094120.GB15472(a)xsang-OptiPlex-9020/
> when this commit was on linux-next/master
> now we found there are still xfstests failure including xfs.050 on mainli=
ne.
> report again FYI)
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 5349b2afc117d87d35502f2fe1930692d6bfc68b ("xfs: don't set quota w=
arning values")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: xfstests
> version: xfstests-x86_64-46e1b83-1_20220414
> with following parameters:
> =

> 	disk: 4HDD
> 	fs: xfs
> 	test: xfs-group-29
> 	ucode: 0x21
> =

> test-description: xfstests is a regression test suite for xfs and other f=
iles ystems.
> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
> =

> =

> on test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30=
GHz with 8G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> 2022-05-17 15:49:39 export TEST_DIR=3D/fs/sdb1
> 2022-05-17 15:49:39 export TEST_DEV=3D/dev/sdb1
> 2022-05-17 15:49:39 export FSTYP=3Dxfs
> 2022-05-17 15:49:39 export SCRATCH_MNT=3D/fs/scratch
> 2022-05-17 15:49:39 mkdir /fs/scratch -p
> 2022-05-17 15:49:39 export SCRATCH_DEV=3D/dev/sdb4
> 2022-05-17 15:49:39 export SCRATCH_LOGDEV=3D/dev/sdb2
> 2022-05-17 15:49:39 export SCRATCH_XFS_LIST_METADATA_FIELDS=3Du3.sfdir3.h=
dr.parent.i4
> 2022-05-17 15:49:39 export SCRATCH_XFS_LIST_FUZZ_VERBS=3Drandom
> 2022-05-17 15:49:39 sed "s:^:xfs/:" //lkp/benchmarks/xfstests/tests/xfs-g=
roup-29
> 2022-05-17 15:49:39 ./check xfs/290 xfs/291 xfs/292 xfs/293 xfs/294 xfs/2=
95 xfs/296 xfs/297 xfs/298 xfs/299
> FSTYP         -- xfs (debug)
> PLATFORM      -- Linux/x86_64 lkp-ivb-d05 5.18.0-rc2-00103-g5349b2afc117 =
#1 SMP Sun May 15 12:16:43 CST 2022
> MKFS_OPTIONS  -- -f /dev/sdb4
> MOUNT_OPTIONS -- /dev/sdb4 /fs/scratch
> =

> xfs/290	 2s
> xfs/291	 130s
> xfs/292	 3s
> xfs/293	 1s
> xfs/294	 63s
> xfs/295	 30s
> xfs/296	 14s
> xfs/297	 209s
> xfs/298	 14s
> xfs/299	- output mismatch (see /lkp/benchmarks/xfstests/results//xfs/299.=
out.bad)
>     --- tests/xfs/299.out	2022-05-16 16:42:32.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//xfs/299.out.bad	2022-05-17 15:5=
7:43.078827071 +0000
>     @@ -6,6 +6,7 @@
>      log      =3DLDEV bsize=3DXXX blocks=3DXXX
>      realtime =3DRDEV extsz=3DXXX blocks=3DXXX, rtextents=3DXXX
>      *** user, group, and project
>     +xfs_quota: cannot set warnings: Invalid argument

Not a kernel issue - this is fixed in the latest fstests release.

-Dave.
-- =

Dave Chinner
david(a)fromorbit.com
--===============2159146818666323703==--

