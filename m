Content-Type: multipart/mixed; boundary="===============7872054341985901738=="
MIME-Version: 1.0
From: Dave Chinner <dchinner@redhat.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 83a21c1844: xfstests.xfs.533.fail
Date: Fri, 06 May 2022 18:28:47 +1000
Message-ID: <YnTcP86M0NV6lkfB@rh>
In-Reply-To: <20220506080341.GF23061@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7872054341985901738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 06, 2022 at 04:03:41PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 83a21c18441f75aec64548692b52d34582b98a6a ("xfs: Directory's data =
fork extent counter can never overflow")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: xfstests
> version: xfstests-x86_64-46e1b83-1_20220414
> with following parameters:
> =

> 	disk: 4HDD
> 	fs: xfs
> 	test: xfs-group-53
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

> =

> xfs/533	[failed, exit status 1]- output mismatch (see /lkp/benchmarks/xfs=
tests/results//xfs/533.out.bad)
>     --- tests/xfs/533.out	2022-04-14 12:51:49.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//xfs/533.out.bad	2022-05-03 06:2=
4:37.310381846 +0000
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

Not a regression. This is testing directory data fork extent count
overflow using error injection, but you might notice that the title
of the commit is "Directory's data fork extent counter can never
overflow".

IOWs, we changed fine grained directory extent count overflow
from a runtime check (on every dir op) to an inode verifier
check that is only run when the directory inode is read from or
written to disk.

The test probably should be removed. Chandan?

Cheers,

Dave.
-- =

Dave Chinner
dchinner(a)redhat.com

--===============7872054341985901738==--

