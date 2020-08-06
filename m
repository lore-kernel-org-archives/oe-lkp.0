Content-Type: multipart/mixed; boundary="===============7418764396486511239=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [x86/copy_mc] a0ac629ebe: fio.read_iops -43.3% regression
Date: Thu, 06 Aug 2020 17:35:00 +0200
Message-ID: <20200806153500.GC2131635@gmail.com>
In-Reply-To: <CAPcyv4hS7K0Arrd+C0LhjrFH=yGJf3g55_WkHOET4z58AcWrJw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7418764396486511239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Dan Williams <dan.j.williams@intel.com> wrote:

> On Thu, Aug 6, 2020 at 6:35 AM Ingo Molnar <mingo@kernel.org> wrote:
> >
> >
> > * kernel test robot <rong.a.chen@intel.com> wrote:
> >
> > > Greeting,
> > >
> > > FYI, we noticed a -43.3% regression of fio.read_iops due to commit:
> > >
> > >
> > > commit: a0ac629ebe7b3d248cb93807782a00d9142fdb98 ("x86/copy_mc: Intro=
duce copy_mc_generic()")
> > > url: https://github.com/0day-ci/linux/commits/Dan-Williams/Renovate-m=
emcpy_mcsafe-with-copy_mc_to_-user-kernel/20200802-014046
> > >
> > >
> > > in testcase: fio-basic
> > > on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz =
with 256G memory
> > > with following parameters:
> >
> > So this performance regression, if it isn't a spurious result, looks
> > concerning. Is this expected?
> =

> This is not expected and I think delays these patches until I'm back
> from leave in a few weeks. I know that we might lose some inlining
> effect due to replacing native memcpy, but I did not expect it would
> have an impact like this. In my testing I was seeing a performance
> improvement from replacing the careful / open-coded copy with rep;
> mov;, which increases the surprise of this result.

It would be nice to double check this on the kernel-test-robot side as =

well, to make sure it's not a false positive.

Thanks,

	Ingo
--===============7418764396486511239==--

