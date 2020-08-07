Content-Type: multipart/mixed; boundary="===============1297714872057323856=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/copy_mc] a0ac629ebe: fio.read_iops -43.3% regression
Date: Fri, 07 Aug 2020 15:16:43 +0800
Message-ID: <20200807071643.GL23458@shao2-debian>
In-Reply-To: <20200806153500.GC2131635@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1297714872057323856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2020 at 05:35:00PM +0200, Ingo Molnar wrote:
> =

> * Dan Williams <dan.j.williams@intel.com> wrote:
> =

> > On Thu, Aug 6, 2020 at 6:35 AM Ingo Molnar <mingo@kernel.org> wrote:
> > >
> > >
> > > * kernel test robot <rong.a.chen@intel.com> wrote:
> > >
> > > > Greeting,
> > > >
> > > > FYI, we noticed a -43.3% regression of fio.read_iops due to commit:
> > > >
> > > >
> > > > commit: a0ac629ebe7b3d248cb93807782a00d9142fdb98 ("x86/copy_mc: Int=
roduce copy_mc_generic()")
> > > > url: https://github.com/0day-ci/linux/commits/Dan-Williams/Renovate=
-memcpy_mcsafe-with-copy_mc_to_-user-kernel/20200802-014046
> > > >
> > > >
> > > > in testcase: fio-basic
> > > > on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GH=
z with 256G memory
> > > > with following parameters:
> > >
> > > So this performance regression, if it isn't a spurious result, looks
> > > concerning. Is this expected?
> > =

> > This is not expected and I think delays these patches until I'm back
> > from leave in a few weeks. I know that we might lose some inlining
> > effect due to replacing native memcpy, but I did not expect it would
> > have an impact like this. In my testing I was seeing a performance
> > improvement from replacing the careful / open-coded copy with rep;
> > mov;, which increases the surprise of this result.
> =

> It would be nice to double check this on the kernel-test-robot side as =

> well, to make sure it's not a false positive.
> =


Hi Ingo,

We recompiled the kernels with option "-falign-functions=3D32", and the
regression still exists:

7476b91d4db369d8  a0ac629ebe7b3d248cb9380778  testcase/testparams/testbox
----------------  --------------------------  ---------------------------
         %stddev      change         %stddev
             \          |                \  =

     22103             -43%      12551        fio-basic/2M-performance-2pme=
m-xfs-libaio-dax-50%-200s-read-200G-tb-ucode=3D0x5002f01/lkp-csl-2sp6
     22103             -43%      12551        GEO-MEAN fio.read_iops

Best Regards,
Rong Chen
--===============1297714872057323856==--

