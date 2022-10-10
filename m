Content-Type: multipart/mixed; boundary="===============5516845302182034962=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] a1df10d42b: xfstests.generic.31*.fail
Date: Mon, 10 Oct 2022 11:07:40 +1100
Message-ID: <20221010000740.GU3600936@dread.disaster.area>
In-Reply-To: <Y0J1oxBFwW53udvJ@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5516845302182034962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 09, 2022 at 03:17:55PM +0800, Oliver Sang wrote:
> Hi Dave,
> =

> On Thu, Oct 06, 2022 at 08:35:43AM +1100, Dave Chinner wrote:
> > On Wed, Oct 05, 2022 at 09:45:12PM +0800, kernel test robot wrote:
> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed the following commit (built with gcc-11):
> > > =

> > > commit: a1df10d42ba99c946f6a574d4d31951bc0a57e33 ("xfs: fix exception=
 caused by unexpected illegal bestcount in leaf dir")
> > > url: https://github.com/intel-lab-lkp/linux/commits/UPDATE-20220929-1=
62751/Guo-Xuenan/xfs-fix-uaf-when-leaf-dir-bestcount-not-match-with-dir-dat=
a-blocks/20220831-195920
> > > =

> > > in testcase: xfstests
> > > version: xfstests-x86_64-5a5e419-1_20220927
> > > with following parameters:
> > > =

> > > 	disk: 4HDD
> > > 	fs: xfs
> > > 	test: generic-group-15
> > > =

> > > test-description: xfstests is a regression test suite for xfs and oth=
er files ystems.
> > > test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
> > > =

> > > =

> > > on test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ =
3.30GHz (Ivy Bridge) with 8G memory
> > > =

> > > caused below changes (please refer to attached dmesg/kmsg for entire =
log/backtrace):
> > =

> > THe attached dmesg ends at:
> > =

> > [...]
> > [  102.727610][  T315] generic/309       IPMI BMC is not supported on t=
his machine, skip bmc-watchdog setup!
> > [  102.727630][  T315] =

> > [  103.884498][ T7407] XFS (sda1): EXPERIMENTAL online scrub feature in=
 use. Use at your own risk!
> > [  103.993962][ T7431] XFS (sda1): Unmounting Filesystem
> > [  104.193659][ T7580] XFS (sda1): Mounting V5 Filesystem
> > [  104.221178][ T7580] XFS (sda1): Ending clean mount
> > [  104.223821][ T7580] xfs filesystem being mounted at /fs/sda1 support=
s timestamps until 2038 (0x7fffffff)
> > [  104.285615][  T315]  2s
> > [  104.285629][  T315] =

> > [  104.339232][ T1469] run fstests generic/310 at 2022-10-01 13:36:36
> > (END)
> > =

> > The start of the failed test. Do you have the logs from generic/310
> > so we might have some idea what corruption/shutdown event occurred
> > during that test run?
> =

> sorry for that. I attached dmesg for another run.

[  109.424124][ T1474] run fstests generic/310 at 2022-10-01 10:14:01
[  169.865043][ T7563] XFS (sda1): Metadata corruption detected at xfs_dir3=
_leaf_check_int+0x381/0x600 [xfs], xfs_dir3_leafn block 0x4000088 =

[  169.865406][ T7563] XFS (sda1): Unmount and run xfs_repair
[  169.865510][ T7563] XFS (sda1): First 128 bytes of corrupted metadata bu=
ffer:
[  169.865639][ T7563] 00000000: 00 80 00 01 00 00 00 00 3d ff 00 00 00 00 =
00 00  ........=3D.......
[  169.865793][ T7563] 00000010: 00 00 00 00 04 00 00 88 00 00 00 00 00 00 =
00 00  ................
[  169.865945][ T7563] 00000020: 27 64 dd b1 81 61 45 2b 86 66 64 67 56 f2 =
40 58  'd...aE+.fdgV.(a)X
[  169.866122][ T7563] 00000030: 00 00 00 00 00 00 00 87 00 fc 00 00 00 00 =
00 00  ................
[  169.866293][ T7563] 00000040: 00 00 00 2e 00 00 00 08 00 00 00 31 00 00 =
00 0c  ...........1....
[  169.866467][ T7563] 00000050: 00 00 00 32 00 00 00 0e 00 00 00 33 00 00 =
00 10  ...2.......3....
[  169.866640][ T7563] 00000060: 00 00 00 34 00 00 00 12 00 00 00 35 00 00 =
00 14  ...4.......5....
[  169.866816][ T7563] 00000070: 00 00 00 36 00 00 00 16 00 00 00 37 00 00 =
00 18  ...6.......7....
[  169.867002][ T7563] XFS (sda1): Corruption of in-memory data (0x8) detec=
ted at _xfs_buf_ioapply+0x508/0x600 [xfs] (fs/xfs/xfs_buf.c:1552).  Shuttin=
g down filesystem.

I don't see any corruption in the leafn header or the first few hash
entries there. It does say it has 0xfc entries in the block, which
is correct for a full leaf of hash pointers. It has no stale
entries, which is correct according to the what the test does (it
does not remove directory entries at all. It has a forward pointer
but no backwards pointer, which is expected as the hash values tell
me this should be the left-most leaf block in the tree.

The error has been detected at write time, which means the problem
was detected before it got written to disk. But I don't see what
code in xfs_dir3_leaf_check_int() is even triggering a warning on a
leafn block here - what line of code does
xfs_dir3_leaf_check_int+0x381/0x600 actually resolve to?

.....

<nnngggghhh>

No wonder I can't reproduce this locally.

commit a1df10d42ba99c946f6a574d4d31951bc0a57e33 *does not exist in
the upstream xfs-dev tree*. The URL provided pointing to the commit
above resolves to a "404 page not found" error, so I have not idea
what code was even being tested here.

AFAICT, the patch being tested is this one (based on the github url
matching the patch title:

https://lore.kernel.org/linux-xfs/20220831121639.3060527-1-guoxuenan(a)huaw=
ei.com/

Which I NACKed almost a whole month ago! The latest revision of the
patch was posted 2 days ago here:

https://lore.kernel.org/linux-xfs/20221008033624.1237390-1-guoxuenan(a)huaw=
ei.com/

Intel kernel robot maintainers: I've just wasted the best part of 2
hours trying to reproduce and track down a corruption bug that this
report lead me to beleive was in the upstream XFS tree.

You need to make it very clear that your bug report is for a commit
that *hasn't been merged into an upstream tree*. The CI robot
noticed a bug in an *old* NACKed patch, not a bug in a new upstream
commit. Please make it *VERY CLEAR* where the code the CI robot is
testing has come from.

Not happy.

-- =

Dave Chinner
david(a)fromorbit.com
--===============5516845302182034962==--

