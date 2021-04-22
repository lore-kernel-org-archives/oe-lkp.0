Content-Type: multipart/mixed; boundary="===============3812154858569263139=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [null_blk] de3510e52b: blktests.block.014.fail
Date: Thu, 22 Apr 2021 11:29:59 +0800
Message-ID: <20210422032959.GA31382@xsang-OptiPlex-9020>
In-Reply-To: <BL0PR04MB651491ED14D710890187B3D1E7759@BL0PR04MB6514.namprd04.prod.outlook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3812154858569263139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi, Damien Le Moal,

On Wed, Apr 07, 2021 at 12:29:11PM +0000, Damien Le Moal wrote:
> On 2021/04/07 18:02, kernel test robot wrote:
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed the following commit (built with gcc-9):
> > =

> > commit: de3510e52b0a398261271455562458003b8eea62 ("null_blk: fix comman=
d timeout completion handling")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > =

> > =

> > in testcase: blktests
> > version: blktests-x86_64-a210761-1_20210124
> > with following parameters:
> > =

> > 	disk: 1SSD
> > 	test: nvme-group-00
> > 	ucode: 0x11
> > =

> > =

> > =

> > on test machine: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz w=
ith 80G memory
> > =

> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> > =

> > =

> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > =

> > =

> > block/014 (run null-blk with blk-mq and timeout injection configured)
> > block/014 (run null-blk with blk-mq and timeout injection configured) [=
failed]
> >     runtime  ...  71.624s
> >     --- tests/block/014.out     2021-01-24 06:04:08.000000000 +0000
> >     +++ /mnt/nvme-group-00/nodev/block/014.out.bad      2021-04-06 09:2=
1:25.133971868 +0000
> >     @@ -1,2 +1,377 @@
> >      Running block/014
> >     +dd: error reading '/dev/nullb0': Connection timed out
> >     +dd: error reading '/dev/nullb0': Connection timed out
> >     +dd: error reading '/dev/nullb0': Connection timed out
> >     +dd: error reading '/dev/nullb0': Connection timed out
> >     +dd: error reading '/dev/nullb0': Connection timed out
> >     +dd: error reading '/dev/nullb0': Connection timed out
> >     ...
> >     (Run 'diff -u tests/block/014.out /mnt/nvme-group-00/nodev/block/01=
4.out.bad' to see the entire diff)
> =

> This is not a kernel bug. It is a problem with blktest. Before my patch, =
the
> timeout error was not propagated back to the user. It is now and causes d=
d to
> fail. blktest seeing dd failing reports the test as failed. On the kernel=
 side,
> all is good, the reqs are completed as expected.
> =

> Note that the timeout error is reported back as is, using BLK_STS_TIMEOUT=
 which
> becomes ETIMEDOUT, hence the "Connection timed out" error message. May be=
 we
> should use the more traditional EIO ? Jens ?
> =

> In any case, I will send a patch to fix blktest block/014.

Thanks for information!
we checked the latest blktest repo (https://github.com/osandov/blktests)
but didn't find the fix. did we miss something?

when patch upstreamed, we could retest and confirm the fix. Thanks

> =

> =

> > =

> > =

> > =

> > To reproduce:
> > =

> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         bin/lkp install                job.yaml  # job file is attached=
 in this email
> >         bin/lkp split-job --compatible job.yaml
> >         bin/lkp run                    compatible-job.yaml
> > =

> > =

> > =

> > ---
> > 0DAY/LKP+ Test Infrastructure                   Open Source Technology =
Center
> > https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Cor=
poration
> > =

> > Thanks,
> > Oliver Sang
> > =

> =

> =

> -- =

> Damien Le Moal
> Western Digital Research
--===============3812154858569263139==--

