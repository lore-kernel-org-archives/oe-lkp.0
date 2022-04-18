Content-Type: multipart/mixed; boundary="===============9129515333223543756=="
MIME-Version: 1.0
From: Chandan Babu R <chandan.babu@oracle.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 530d96220d: xfstests.xfs.533.fail
Date: Mon, 18 Apr 2022 15:46:28 +0530
Message-ID: <87o80ypugz.fsf@debian-BULLSEYE-live-builder-AMD64>
In-Reply-To: <20220418090135.GA23098@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============9129515333223543756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 18 Apr 2022 at 14:31, kernel test robot wrote:
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-11):
>
> commit: 530d96220d0d99cff9b5a3583210df2b5b5f6408 ("xfs: Directory's data =
fork extent counter can never overflow")
> url: https://github.com/intel-lab-lkp/linux/commits/UPDATE-20220409-21491=
3/Chandan-Babu-R/xfs-Extend-per-inode-extent-counters/20220406-174647
>
> in testcase: xfstests
> version: xfstests-x86_64-46e1b83-1_20220414
> with following parameters:
>
> 	disk: 4HDD
> 	fs: xfs
> 	test: xfs-group-53
> 	ucode: 0x21
>
> test-description: xfstests is a regression test suite for xfs and other f=
iles ystems.
> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
>
>
> on test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30=
GHz with 8G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
> 2022-04-15 11:30:13 export TEST_DIR=3D/fs/sda1
> 2022-04-15 11:30:13 export TEST_DEV=3D/dev/sda1
> 2022-04-15 11:30:13 export FSTYP=3Dxfs
> 2022-04-15 11:30:13 export SCRATCH_MNT=3D/fs/scratch
> 2022-04-15 11:30:13 mkdir /fs/scratch -p
> 2022-04-15 11:30:13 export SCRATCH_DEV=3D/dev/sda4
> 2022-04-15 11:30:13 export SCRATCH_LOGDEV=3D/dev/sda2
> 2022-04-15 11:30:13 export SCRATCH_XFS_LIST_METADATA_FIELDS=3Du3.sfdir3.h=
dr.parent.i4
> 2022-04-15 11:30:13 export SCRATCH_XFS_LIST_FUZZ_VERBS=3Drandom
> 2022-04-15 11:30:13 sed "s:^:xfs/:" //lkp/benchmarks/xfstests/tests/xfs-g=
roup-53
> 2022-04-15 11:30:13 ./check xfs/531 xfs/532 xfs/533 xfs/534 xfs/538 xfs/5=
39
> FSTYP         -- xfs (debug)
> PLATFORM      -- Linux/x86_64 lkp-ivb-d05 5.17.0-rc6-00044-g530d96220d0d =
#1 SMP Fri Apr 15 17:47:01 CST 2022
> MKFS_OPTIONS  -- -f /dev/sda4
> MOUNT_OPTIONS -- /dev/sda4 /fs/scratch
>
> xfs/531	 4s
> xfs/532	 28s
> xfs/533	[failed, exit status 1]- output mismatch (see /lkp/benchmarks/xfs=
tests/results//xfs/533.out.bad)
>     --- tests/xfs/533.out	2022-04-14 12:51:49.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//xfs/533.out.bad	2022-04-15 11:3=
1:08.365436563 +0000
>     @@ -6,12 +6,4 @@
>      Inject bmap_alloc_minlen_extent error tag
>      * Create directory entries
>      Verify directory's extent count
>     -* Rename: Populate destination directory
>     -Populate $dstdir by moving new directory entries
>     -Verify $dstdir's extent count
>     -* Create multiple hard links to a single file
>     ...
>     (Run 'diff -u /lkp/benchmarks/xfstests/tests/xfs/533.out /lkp/benchma=
rks/xfstests/results//xfs/533.out.bad'  to see the entire diff)

The "Large extent counter" patchset removes code which checked for directory
extent count overflow since an operation on a directory can never cause its
extent count to overflow. However, the following check is added to
xfs_dinode_verify() to check for ondisk corruption when reading an inode fr=
om
disk,

        if (S_ISDIR(mode) && nextents > mp->m_dir_geo->max_extents)
                return __this_address;

I have written a patch to remove xfs/533 from fstests. I will post it soon.

-- =

chandan
--===============9129515333223543756==--

