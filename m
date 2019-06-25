Content-Type: multipart/mixed; boundary="===============8937361770414998085=="
MIME-Version: 1.0
From: Ming Lei <ming.lei@redhat.com>
To: lkp@lists.01.org
Subject: Re: 07173c3ec2: stderr.fio:pid=#, err=#/file:filesetup.c:#, func=fsync, error=Input/output_error
Date: Tue, 25 Jun 2019 18:47:14 +0800
Message-ID: <20190625104713.GA20120@ming.t460p>
In-Reply-To: <f54a4338-410a-c96b-19e1-9932ed207aa3@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8937361770414998085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi rong.a.chen,

Thanks for your report!

On Tue, Jun 25, 2019 at 04:32:48PM +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 07173c3ec276cbb18dc0e0687d37d310e98a1480 ("block: enable multipag=
e bvecs")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git  master
> =

> in testcase: fio-basic
> on test machine: 72 threads Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz wit=
h 256G memory
> with following parameters:
> =

> 	runtime: 300s
> 	nr_task: 8t
> 	disk: 1SSD
> 	fs: xfs
> 	rw: randread
> 	bs: 2M
> 	ioengine: sync
> 	test_size: 512g
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> fio: pid=3D0, err=3D5/file:filesetup.c:190, func=3Dfsync, error=3DInput/o=
utput error
> fio: pid=3D0, err=3D5/file:filesetup.c:190, func=3Dfsync, error=3DInput/o=
utput error

I just tried the fio(randread, bs:2M, sync, nvme, xfs and block device) tes=
t on
5.2-rc6 kernel, looks it can't be reproduced.

For multi-page bvec change, I'd suggest to run test on 5.1 at least,
since there are several follow-up fixes.

Also the dmesg log seems not intact, looks it only shows booting.

Please let us know if the issue can be triggered on 5.1 or 5.2.

Thanks,
Ming

--===============8937361770414998085==--

