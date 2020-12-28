Content-Type: multipart/mixed; boundary="===============4026011143769890973=="
MIME-Version: 1.0
From: Hui Su <sh_def@163.com>
To: lkp@lists.01.org
Subject: Re: [blokc/blk] d828aefa7a: xfstests.xfs.372.fail
Date: Mon, 28 Dec 2020 23:25:55 +0800
Message-ID: <20201228152555.GA1185658@ubuntu-A520I-AC>
In-Reply-To: <20201226113133.GC11697@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4026011143769890973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 26, 2020 at 07:31:33PM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: d828aefa7a1bdf7fbc5073fdb66da9bfb1264c21 ("[PATCH v2] blokc/blk-m=
erge: remove the next_bvec label in __blk_bios_map_sg()")
> url: https://github.com/0day-ci/linux/commits/Hui-Su/blokc-blk-merge-remo=
ve-the-next_bvec-label-in-__blk_bios_map_sg/20201223-202618
> base: https://git.kernel.org/cgit/linux/kernel/git/axboe/linux-block.git =
for-next
> =

> in testcase: xfstests
> version: xfstests-x86_64-d41dcbd-1_20201218
> with following parameters:
> =

> 	disk: 4HDD
> 	fs: xfs
> 	test: xfs-reflink-18
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

Thanks, i will take a look at it.

--===============4026011143769890973==--

