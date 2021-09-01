Content-Type: multipart/mixed; boundary="===============0775712794454078952=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [PCI/MSI] 77e89afc25: will-it-scale.per_process_ops -2.6% regression
Date: Wed, 01 Sep 2021 11:07:39 +0800
Message-ID: <20210901030739.GE14661@xsang-OptiPlex-9020>
In-Reply-To: <87eeaf3khx.ffs@tglx>
List-Id: <oe-lkp.lists.linux.dev>

--===============0775712794454078952==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Fri, Aug 27, 2021 at 12:32:26AM +0200, Thomas Gleixner wrote:
> On Wed, Aug 18 2021 at 22:51, kernel report robot wrote:
> =

> > Greeting,
> >
> > FYI, we noticed a -2.6% regression of will-it-scale.per_process_ops due=
 to commit:
> >
> >
> > commit: 77e89afc25f30abd56e76a809ee2884d7c1b63ce ("PCI/MSI: Protect msi=
_desc::masked for multi-MSI")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >
> >
> > in testcase: will-it-scale
> > on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @=
 2.00GHz with 256G memory
> > with following parameters:
> >
> > 	nr_task: 100%
> > 	mode: process
> > 	test: lseek2
> > 	cpufreq_governor: performance
> > 	ucode: 0xd000280
> >
> > test-description: Will It Scale takes a testcase and runs it from 1 thr=
ough to n parallel copies to see if the testcase will scale. It builds both=
 a process and threads based test in order to see any differences between t=
he two.
> > test-url: https://github.com/antonblanchard/will-it-scale
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> There is nothing to fix. The commit cures an incorrectness. Comparing
> buggy code to correct code is futile.

Got it! the change is a functionality fix. Thanks for information.

> =

> Thanks,
> =

>         tglx
--===============0775712794454078952==--

