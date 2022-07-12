Content-Type: multipart/mixed; boundary="===============8183949175317941101=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 65cf4eb83e: xfstests.xfs.011.fail
Date: Wed, 13 Jul 2022 08:24:54 +1000
Message-ID: <20220712222454.GN3861211@dread.disaster.area>
In-Reply-To: <Ys0wxcjQa7ehVuXz@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8183949175317941101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2022 at 04:28:53PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 65cf4eb83e2179b565c7943fd685ddb93d2b146a ("[PATCH 8/8] xfs: grant=
 heads track byte counts, not LSNs")
> url: https://github.com/intel-lab-lkp/linux/commits/Dave-Chinner/xfs-byte=
-base-grant-head-reservation-tracking/20220708-095642
> base: https://git.kernel.org/cgit/fs/xfs/xfs-linux.git for-next
> patch link: https://lore.kernel.org/linux-xfs/20220708015558.1134330-9-da=
vid(a)fromorbit.com
> =

> in testcase: xfstests
> version: xfstests-x86_64-c1144bf-1_20220704
> with following parameters:
> =

> 	disk: 4HDD
> 	fs: xfs
> 	test: xfs-group-01
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

> =

> xfs/011       - output mismatch (see /lkp/benchmarks/xfstests/results//xf=
s/011.out.bad)
>     --- tests/xfs/011.out	2022-07-04 16:34:35.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//xfs/011.out.bad	2022-07-11 12:3=
3:58.535910570 +0000
>     @@ -1,2 +1,14 @@
>      QA output created by 011
>      Silence is golden.
>     +reserve_grant_head (4096:) does not match log_head_lsn (1:8192), pos=
sible leak detected.
>     +write_grant_head (4096:) does not match log_head_lsn (1:8192), possi=
ble leak detected.
>     +reserve_grant_head (4096:) does not match log_head_lsn (1:446464), p=
ossible leak detected.
>     +write_grant_head (4096:) does not match log_head_lsn (1:446464), pos=
sible leak detected.
>     +reserve_grant_head (4096:) does not match log_head_lsn (1:991232), p=
ossible leak detected.

Yes, this commit changes the structure of the write and reserve
grant heads and the output of the relevant sysfs files, so the test
will need fixing (or removing) as the leak detection debug
information has changed.

-Dave.
-- =

Dave Chinner
david(a)fromorbit.com
--===============8183949175317941101==--

