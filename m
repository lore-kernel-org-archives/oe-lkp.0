Content-Type: multipart/mixed; boundary="===============1724693414773381827=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 47a6df7cd3: Assertion_failed
Date: Wed, 13 Jul 2022 07:47:45 +1000
Message-ID: <20220712214745.GL3861211@dread.disaster.area>
In-Reply-To: <Ys0gqOUcLr+2dle5@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1724693414773381827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2022 at 03:20:08PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 47a6df7cd3174b91c6c862eae0b8d4e13591df52 ("xfs: shut down filesys=
tem if we xfs_trans_cancel with deferred work items")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: xfstests
> version: xfstests-x86_64-c1144bf-1_20220704
> with following parameters:
> =

> 	disk: 4HDD
> 	fs: xfs
> 	test: xfs-group-07
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

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [   94.271323][ T9089] XFS (sda5): Mounting V5 Filesystem
> [   94.369992][ T9089] XFS (sda5): Ending clean mount
> [   94.376046][ T9089] xfs filesystem being mounted at /fs/scratch suppor=
ts timestamps until 2038 (0x7fffffff)
> [  112.154792][  T311] xfs/076       IPMI BMC is not supported on this ma=
chine, skip bmc-watchdog setup!
> [  112.154805][  T311]
> [  161.426026][T29384] XFS: Assertion failed: xfs_is_shutdown(mp) || list=
_empty(&tp->t_dfops), file: fs/xfs/xfs_trans.c, line: 951
> [  161.437713][T29384] ------------[ cut here ]------------
> [  161.443155][T29384] kernel BUG at fs/xfs/xfs_message.c:110!
> [  161.448854][T29384] invalid opcode: 0000 [#1] SMP KASAN PTI
> [  161.454536][T29384] CPU: 1 PID: 29384 Comm: touch Not tainted 5.16.0-r=
c5-00001-g47a6df7cd317 #1

5.16-rc5? Seems like a really old kernel to be testing....

Does this reproduce on a current 5.19-rc6 kernel?

-Dave.
-- =

Dave Chinner
david(a)fromorbit.com
--===============1724693414773381827==--

