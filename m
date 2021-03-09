Content-Type: multipart/mixed; boundary="===============5306600682861480364=="
MIME-Version: 1.0
From: Nikolay Borisov <nborisov@suse.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] 5297199a8b: xfstests.btrfs.220.fail
Date: Tue, 09 Mar 2021 10:36:52 +0200
Message-ID: <5e0b9f39-9c4d-5b56-68ba-7a6283dc560d@suse.com>
In-Reply-To: <20210309084953.GD12057@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5306600682861480364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 9.03.21 =D0=B3. 10:49 =D1=87., kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 5297199a8bca12b8b96afcbf2341605efb6005de ("btrfs: remove inode nu=
mber cache feature")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> =

> in testcase: xfstests
> version: xfstests-x86_64-d41dcbd-1_20201218
> with following parameters:
> =

> 	disk: 6HDD
> 	fs: btrfs
> 	test: btrfs-group-22
> 	ucode: 0x28
> =

> test-description: xfstests is a regression test suite for xfs and other f=
iles ystems.
> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
> =

> =

> on test machine: 8 threads Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz with 8=
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

> 2021-03-09 04:13:26 export TEST_DIR=3D/fs/sdb1
> 2021-03-09 04:13:26 export TEST_DEV=3D/dev/sdb1
> 2021-03-09 04:13:26 export FSTYP=3Dbtrfs
> 2021-03-09 04:13:26 export SCRATCH_MNT=3D/fs/scratch
> 2021-03-09 04:13:26 mkdir /fs/scratch -p
> 2021-03-09 04:13:26 export SCRATCH_DEV_POOL=3D"/dev/sdb2 /dev/sdb3 /dev/s=
db4 /dev/sdb5 /dev/sdb6"
> 2021-03-09 04:13:26 sed "s:^:btrfs/:" //lkp/benchmarks/xfstests/tests/btr=
fs-group-22
> 2021-03-09 04:13:26 ./check btrfs/220 btrfs/221 btrfs/222 btrfs/223 btrfs=
/224 btrfs/225 btrfs/226 btrfs/227
> FSTYP         -- btrfs
> PLATFORM      -- Linux/x86_64 lkp-hsw-d01 5.10.0-rc7-00162-g5297199a8bca =
#1 SMP Sat Feb 27 21:06:26 CST 2021
> MKFS_OPTIONS  -- /dev/sdb2
> MOUNT_OPTIONS -- /dev/sdb2 /fs/scratch
> =

> btrfs/220	- output mismatch (see /lkp/benchmarks/xfstests/results//btrfs/=
220.out.bad)
>     --- tests/btrfs/220.out	2021-01-14 07:40:58.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//btrfs/220.out.bad	2021-03-09 04=
:13:32.880794446 +0000
>     @@ -1,2 +1,3 @@
>      QA output created by 220
>     +Unexepcted mount options, checking for 'inode_cache,relatime,space_c=
ache,subvol=3D/,subvolid=3D5' in 'rw,relatime,space_cache,subvolid=3D5,subv=
ol=3D/' using 'inode_cache'


Given that the commit removes the inode_cache feature that's expected, I
assume you need to adjust your fstests configuration to not use
inode_cache.
--===============5306600682861480364==--

