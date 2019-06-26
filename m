Content-Type: multipart/mixed; boundary="===============7012786270649101275=="
MIME-Version: 1.0
From: Ming Lei <ming.lei@redhat.com>
To: lkp@lists.01.org
Subject: Re: 07173c3ec2: stderr.fio:pid=#, err=#/file:filesetup.c:#, func=fsync, error=Input/output_error
Date: Wed, 26 Jun 2019 10:05:29 +0800
Message-ID: <20190626020528.GB23698@ming.t460p>
In-Reply-To: <7812195c-d6e9-8edc-a31c-23db3d9dc4b2@cn.fujitsu.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7012786270649101275==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2019 at 09:18:36AM +0800, Liu Yiding wrote:
> Hi, Ming Lei.
> =

> =

> =E5=9C=A8 2019/6/25 =E4=B8=8B=E5=8D=886:47, Ming Lei =E5=86=99=E9=81=93:
> > Hi rong.a.chen,
> > =

> > Thanks for your report!
> > =

> > On Tue, Jun 25, 2019 at 04:32:48PM +0800, kernel test robot wrote:
> > > FYI, we noticed the following commit (built with gcc-7):
> > > =

> > > commit: 07173c3ec276cbb18dc0e0687d37d310e98a1480 ("block: enable mult=
ipage bvecs")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git  mast=
er
> > > =

> > > in testcase: fio-basic
> > > on test machine: 72 threads Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz=
 with 256G memory
> > > with following parameters:
> > > =

> > > 	runtime: 300s
> > > 	nr_task: 8t
> > > 	disk: 1SSD
> > > 	fs: xfs
> > > 	rw: randread
> > > 	bs: 2M
> > > 	ioengine: sync
> > > 	test_size: 512g
> > > =

> > > caused below changes (please refer to attached dmesg/kmsg for entire =
log/backtrace):
> > > =

> > > fio: pid=3D0, err=3D5/file:filesetup.c:190, func=3Dfsync, error=3DInp=
ut/output error
> > > fio: pid=3D0, err=3D5/file:filesetup.c:190, func=3Dfsync, error=3DInp=
ut/output error
> > I just tried the fio(randread, bs:2M, sync, nvme, xfs and block device)=
 test on
> > 5.2-rc6 kernel, looks it can't be reproduced.
> > =

> > For multi-page bvec change, I'd suggest to run test on 5.1 at least,
> > since there are several follow-up fixes.
> > =

> > Also the dmesg log seems not intact, looks it only shows booting.
> > =

> > Please let us know if the issue can be triggered on 5.1 or 5.2.
> =

> =

> This issue can be triggered on v5.1 and v5,2-rc* (include v5.2-rc6)
> =

> on v5.2-rc6 run 20 times, 10 times trigger out this issue.

OK, thanks!

It is EIO from fsync(), which should have something dumped in dmesg log,
could you provide me the dmesg log after the issue is triggered?

BTW, can you provide me the exact fio command in your test? I need to
find a big machine like yours for reproducing it.

Thanks,
Ming

--===============7012786270649101275==--

