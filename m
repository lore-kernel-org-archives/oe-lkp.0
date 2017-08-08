Content-Type: multipart/mixed; boundary="===============4019871295876472733=="
MIME-Version: 1.0
From: Minchan Kim <minchan@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 7674270022: will-it-scale.per_process_ops -19.3% regression
Date: Tue, 08 Aug 2017 11:28:30 +0900
Message-ID: <20170808022830.GA28570@bbox>
In-Reply-To: <20170808011923.GE25554@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4019871295876472733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 08, 2017 at 09:19:23AM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed a -19.3% regression of will-it-scale.per_process_ops due =
to commit:
> =

> =

> commit: 76742700225cad9df49f05399381ac3f1ec3dc60 ("mm: fix MADV_[FREE|DON=
TNEED] TLB flush miss problem")
> url: https://github.com/0day-ci/linux/commits/Nadav-Amit/mm-migrate-preve=
nt-racy-access-to-tlb_flush_pending/20170802-205715
> =

> =

> in testcase: will-it-scale
> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wit=
h 64G memory
> with following parameters:
> =

> 	nr_task: 16
> 	mode: process
> 	test: brk1
> 	cpufreq_governor: performance
> =

> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale

Thanks for the report.
Could you explain what kinds of workload you are testing?

Does it calls frequently madvise(MADV_DONTNEED) in parallel on multiple
threads?

--===============4019871295876472733==--

