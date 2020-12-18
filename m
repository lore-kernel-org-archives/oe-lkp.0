Content-Type: multipart/mixed; boundary="===============5430536558478768681=="
MIME-Version: 1.0
From: kaixuxia <xiakaixu1987@gmail.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 237d7887ae: xfstests.xfs.513.fail
Date: Fri, 18 Dec 2020 15:25:26 +0800
Message-ID: <5cc27796-00b7-aa4c-95a4-5c8c6f8c7c00@gmail.com>
In-Reply-To: <20201218055819.GA12524@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5430536558478768681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi=EF=BC=8C

The patch https://www.spinics.net/lists/linux-xfs/msg47389.html for xfstests
will fix this regression.

Thanks,
Kaixu

On 2020/12/18 13:58, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 237d7887ae723af7d978e8b9a385fdff416f357b ("xfs: show the proper u=
ser quota options")
> https://git.kernel.org/cgit/fs/xfs/xfs-linux.git xfs-5.11-merge
> =

> =

> in testcase: xfstests
> version: xfstests-x86_64-d41dcbd-1_20201215
> with following parameters:
> =

> 	disk: 4HDD
> 	fs: xfs
> 	test: xfs-group-51
> 	ucode: 0x21
> =

> test-description: xfstests is a regression test suite for xfs and other f=
iles ystems.
> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
> =

> =

> on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 8=
G memory
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

> 2020-12-18 01:24:14 export TEST_DIR=3D/fs/sdb1
> 2020-12-18 01:24:14 export TEST_DEV=3D/dev/sdb1
> 2020-12-18 01:24:14 export FSTYP=3Dxfs
> 2020-12-18 01:24:14 export SCRATCH_MNT=3D/fs/scratch
> 2020-12-18 01:24:14 mkdir /fs/scratch -p
> 2020-12-18 01:24:14 export SCRATCH_DEV=3D/dev/sdb4
> 2020-12-18 01:24:14 export SCRATCH_LOGDEV=3D/dev/sdb2
> 2020-12-18 01:24:14 export SCRATCH_XFS_LIST_METADATA_FIELDS=3Du3.sfdir3.h=
dr.parent.i4
> 2020-12-18 01:24:14 export SCRATCH_XFS_LIST_FUZZ_VERBS=3Drandom
> 2020-12-18 01:24:14 sed "s:^:xfs/:" //lkp/benchmarks/xfstests/tests/xfs-g=
roup-51
> 2020-12-18 01:24:14 ./check xfs/510 xfs/511 xfs/512 xfs/513 xfs/514 xfs/5=
15 xfs/516 xfs/517 xfs/518 xfs/519
> FSTYP         -- xfs (debug)
> PLATFORM      -- Linux/x86_64 lkp-ivb-d05 5.10.0-rc5-00026-g237d7887ae72 =
#1 SMP Fri Dec 18 08:12:46 CST 2020
> MKFS_OPTIONS  -- -f -bsize=3D4096 /dev/sdb4
> MOUNT_OPTIONS -- /dev/sdb4 /fs/scratch
> =

> xfs/510	 1s
> xfs/511	 2s
> xfs/512	 2s
> xfs/513	- output mismatch (see /lkp/benchmarks/xfstests/results//xfs/513.=
out.bad)
>     --- tests/xfs/513.out	2020-12-15 12:31:26.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//xfs/513.out.bad	2020-12-18 01:2=
4:44.695412845 +0000
>     @@ -77,7 +77,11 @@
>      TEST: "-o usrquota" "pass" "usrquota" "true"
>      TEST: "-o quota" "pass" "usrquota" "true"
>      TEST: "-o uqnoenforce" "pass" "usrquota" "true"
>     +[FAILED]: mount /dev/loop0 /fs/sdb1/513.mnt -o uqnoenforce
>     +ERROR: did not expect to find "usrquota" in "rw,relatime,attr2,inode=
64,logbufs=3D8,logbsize=3D32k,uqnoenforce"
>      TEST: "-o qnoenforce" "pass" "usrquota" "true"
>     +[FAILED]: mount /dev/loop0 /fs/sdb1/513.mnt -o qnoenforce
>     ...
>     (Run 'diff -u /lkp/benchmarks/xfstests/tests/xfs/513.out /lkp/benchma=
rks/xfstests/results//xfs/513.out.bad'  to see the entire diff)
> xfs/514	- output mismatch (see /lkp/benchmarks/xfstests/results//xfs/514.=
out.bad)
>     --- tests/xfs/514.out	2020-12-15 12:31:26.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//xfs/514.out.bad	2020-12-18 01:2=
4:46.007412903 +0000
>     @@ -1,2 +1,5 @@
>      QA output created by 514
>      Silence is golden
>     +attr_remove not documented in the xfs_db manpage
>     +attr_set not documented in the xfs_db manpage
>     +logformat not documented in the xfs_db manpage
>     ...
>     (Run 'diff -u /lkp/benchmarks/xfstests/tests/xfs/514.out /lkp/benchma=
rks/xfstests/results//xfs/514.out.bad'  to see the entire diff)
> xfs/515	- output mismatch (see /lkp/benchmarks/xfstests/results//xfs/515.=
out.bad)
>     --- tests/xfs/515.out	2020-12-15 12:31:26.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//xfs/515.out.bad	2020-12-18 01:2=
4:47.082412951 +0000
>     @@ -1,2 +1,3 @@
>      QA output created by 515
>      Silence is golden
>     +limit not documented in the xfs_quota manpage
>     ...
>     (Run 'diff -u /lkp/benchmarks/xfstests/tests/xfs/515.out /lkp/benchma=
rks/xfstests/results//xfs/515.out.bad'  to see the entire diff)
> xfs/516	 32s
> xfs/517	[not run] rmapbt not supported by scratch filesystem type: xfs
> xfs/518	 3s
> xfs/519	[not run] Reflink not supported by scratch filesystem type: xfs
> Ran: xfs/510 xfs/511 xfs/512 xfs/513 xfs/514 xfs/515 xfs/516 xfs/517 xfs/=
518 xfs/519
> Not run: xfs/517 xfs/519
> Failures: xfs/513 xfs/514 xfs/515
> Failed 3 of 10 tests
> =

> =

> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =

> =

> Thanks,
> Oliver Sang
> =


-- =

kaixuxia
--===============5430536558478768681==--

