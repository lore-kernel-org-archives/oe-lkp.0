Content-Type: multipart/mixed; boundary="===============8269241611843073470=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 1eb70f54c4: xfstests.xfs.348.fail
Date: Fri, 03 Jun 2022 07:44:36 +1000
Message-ID: <20220602214436.GF1098723@dread.disaster.area>
In-Reply-To: <20220602090409.GD27190@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8269241611843073470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2022 at 05:04:09PM +0800, kernel test robot wrote:
> =

> (please be noted we reported
> "[xfs]  1eb70f54c4: xfstests.xfs.348.fail"
> on
> https://lore.kernel.org/all/20220518144504.GB22659(a)xsang-OptiPlex-9020/
> while this commit was on linux-next/master
> now we noticed the issue is still existing on mainline.
> report again FYI)
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 1eb70f54c445fcbb25817841e774adb3d912f3e8 ("xfs: validate inode fo=
rk size against fork format")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: xfstests
> version: xfstests-x86_64-46e1b83-1_20220414
> with following parameters:
> =

> 	disk: 4HDD
> 	fs: xfs
> 	test: xfs-group-34
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

> 2022-05-18 11:47:42 export TEST_DIR=3D/fs/sdb1
> 2022-05-18 11:47:42 export TEST_DEV=3D/dev/sdb1
> 2022-05-18 11:47:42 export FSTYP=3Dxfs
> 2022-05-18 11:47:42 export SCRATCH_MNT=3D/fs/scratch
> 2022-05-18 11:47:42 mkdir /fs/scratch -p
> 2022-05-18 11:47:42 export SCRATCH_DEV=3D/dev/sdb4
> 2022-05-18 11:47:42 export SCRATCH_LOGDEV=3D/dev/sdb2
> 2022-05-18 11:47:42 export SCRATCH_XFS_LIST_METADATA_FIELDS=3Du3.sfdir3.h=
dr.parent.i4
> 2022-05-18 11:47:42 export SCRATCH_XFS_LIST_FUZZ_VERBS=3Drandom
> 2022-05-18 11:47:42 sed "s:^:xfs/:" //lkp/benchmarks/xfstests/tests/xfs-g=
roup-34
> 2022-05-18 11:47:42 ./check xfs/348 xfs/349
> FSTYP         -- xfs (debug)
> PLATFORM      -- Linux/x86_64 lkp-ivb-d05 5.18.0-rc2-00067-g1eb70f54c445 =
#1 SMP Thu May 12 04:39:22 CST 2022
> MKFS_OPTIONS  -- -f /dev/sdb4
> MOUNT_OPTIONS -- /dev/sdb4 /fs/scratch
> =

> xfs/348	- output mismatch (see /lkp/benchmarks/xfstests/results//xfs/348.=
out.bad)
>     --- tests/xfs/348.out	2022-05-16 16:42:32.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//xfs/348.out.bad	2022-05-18 11:4=
7:58.897287914 +0000
>     @@ -108,7 +108,7 @@
>      would have junked entry "EMPTY" in directory PARENT_INO
>      would have junked entry "FIFO" in directory PARENT_INO
>      stat: 'SCRATCH_MNT/test/DIR' is a directory
>     -stat: 'SCRATCH_MNT/test/DATA' is a directory
>     +stat: cannot statx 'SCRATCH_MNT/test/DATA': Structure needs cleaning
>      stat: cannot statx 'SCRATCH_MNT/test/EMPTY': Structure needs cleaning
>      stat: cannot statx 'SCRATCH_MNT/test/SYMLINK': Structure needs clean=
ing

Not a kernel issue - this is fixed in the latest fstests.

>     ...
>     (Run 'diff -u /lkp/benchmarks/xfstests/tests/xfs/348.out /lkp/benchma=
rks/xfstests/results//xfs/348.out.bad'  to see the entire diff)
> xfs/349	[failed, exit status 1]- output mismatch (see /lkp/benchmarks/xfs=
tests/results//xfs/349.out.bad)
>     --- tests/xfs/349.out	2022-05-16 16:42:32.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//xfs/349.out.bad	2022-05-18 11:5=
3:51.101272360 +0000
>     @@ -1,3 +1,2 @@
>      QA output created by 349
>      Format and populate
>     -Scrub
>     ...
>     (Run 'diff -u /lkp/benchmarks/xfstests/tests/xfs/349.out /lkp/benchma=
rks/xfstests/results//xfs/349.out.bad'  to see the entire diff)

You are running a test in the "dangerous_fuzzers" group that isn't
in the auto group. This is a test for developers to find error
detection issues and, as such, failure is kinda expected. It is not
regression test that can be used for pass/fail testing....

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com
--===============8269241611843073470==--

