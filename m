Content-Type: multipart/mixed; boundary="===============5957227379662835383=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 47a6df7cd3: Assertion_failed
Date: Thu, 14 Jul 2022 11:24:21 +1000
Message-ID: <20220714012421.GO3861211@dread.disaster.area>
In-Reply-To: <Ys5lVZF3V53LQ+Ty@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5957227379662835383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2022 at 02:25:25PM +0800, Oliver Sang wrote:
> hi Dave,
> =

> On Wed, Jul 13, 2022 at 07:47:45AM +1000, Dave Chinner wrote:
> > > =

> > > If you fix the issue, kindly add following tag
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > =

> > > =

> > > [   94.271323][ T9089] XFS (sda5): Mounting V5 Filesystem
> > > [   94.369992][ T9089] XFS (sda5): Ending clean mount
> > > [   94.376046][ T9089] xfs filesystem being mounted at /fs/scratch su=
pports timestamps until 2038 (0x7fffffff)
> > > [  112.154792][  T311] xfs/076       IPMI BMC is not supported on thi=
s machine, skip bmc-watchdog setup!
> > > [  112.154805][  T311]
> > > [  161.426026][T29384] XFS: Assertion failed: xfs_is_shutdown(mp) || =
list_empty(&tp->t_dfops), file: fs/xfs/xfs_trans.c, line: 951
> > > [  161.437713][T29384] ------------[ cut here ]------------
> > > [  161.443155][T29384] kernel BUG at fs/xfs/xfs_message.c:110!
> > > [  161.448854][T29384] invalid opcode: 0000 [#1] SMP KASAN PTI
> > > [  161.454536][T29384] CPU: 1 PID: 29384 Comm: touch Not tainted 5.16=
.0-rc5-00001-g47a6df7cd317 #1
> > =

> > 5.16-rc5? Seems like a really old kernel to be testing....
> > =

> > Does this reproduce on a current 5.19-rc6 kernel?
> =

> yes, it's still reproducible. however, it's actually random on both 47a6d=
f7cd3
> and 5.19-rc6, as below.
> it's clean on 40 runs of v5.16-rc5,
> on 47a6df7cd3, it's reproduced 9 times out of 40 runs,

Of course, 47a6df7cd3 introduced the ASSERT that is firing. You'll
never see the failure on kernels before this, even if the issue is
occurring. It also points out this isn't a new issue, it's been
around since before we added detection of it.

> on v5.19-rc6, it's reprodced 7 times out of 20 runs.

Hmmm. I've just run 50 iterations here on my 5.19-rc6 based VMs
and I haven't seen a single failure. So it's not failing regularly
here which means it is influenced by environmental factors.

How big are the disks you are testing with?

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com
--===============5957227379662835383==--

