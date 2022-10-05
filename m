Content-Type: multipart/mixed; boundary="===============5938638631209641938=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] a1df10d42b: xfstests.generic.31*.fail
Date: Thu, 06 Oct 2022 08:35:43 +1100
Message-ID: <20221005213543.GP3600936@dread.disaster.area>
In-Reply-To: <202210052153.fedff8e6-oliver.sang@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5938638631209641938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 05, 2022 at 09:45:12PM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: a1df10d42ba99c946f6a574d4d31951bc0a57e33 ("xfs: fix exception cau=
sed by unexpected illegal bestcount in leaf dir")
> url: https://github.com/intel-lab-lkp/linux/commits/UPDATE-20220929-16275=
1/Guo-Xuenan/xfs-fix-uaf-when-leaf-dir-bestcount-not-match-with-dir-data-bl=
ocks/20220831-195920
> =

> in testcase: xfstests
> version: xfstests-x86_64-5a5e419-1_20220927
> with following parameters:
> =

> 	disk: 4HDD
> 	fs: xfs
> 	test: generic-group-15
> =

> test-description: xfstests is a regression test suite for xfs and other f=
iles ystems.
> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
> =

> =

> on test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30=
GHz (Ivy Bridge) with 8G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

THe attached dmesg ends at:

[...]
[  102.727610][  T315] generic/309       IPMI BMC is not supported on this =
machine, skip bmc-watchdog setup!
[  102.727630][  T315] =

[  103.884498][ T7407] XFS (sda1): EXPERIMENTAL online scrub feature in use=
. Use at your own risk!
[  103.993962][ T7431] XFS (sda1): Unmounting Filesystem
[  104.193659][ T7580] XFS (sda1): Mounting V5 Filesystem
[  104.221178][ T7580] XFS (sda1): Ending clean mount
[  104.223821][ T7580] xfs filesystem being mounted at /fs/sda1 supports ti=
mestamps until 2038 (0x7fffffff)
[  104.285615][  T315]  2s
[  104.285629][  T315] =

[  104.339232][ T1469] run fstests generic/310 at 2022-10-01 13:36:36
(END)

The start of the failed test. Do you have the logs from generic/310
so we might have some idea what corruption/shutdown event occurred
during that test run?

-Dave.
-- =

Dave Chinner
david(a)fromorbit.com
--===============5938638631209641938==--

