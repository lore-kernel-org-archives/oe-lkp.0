Content-Type: multipart/mixed; boundary="===============1440747744080692962=="
MIME-Version: 1.0
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] ab522e33f9: [No primary changes] reaim.child_utime -32.9% improvement
Date: Mon, 10 Oct 2016 20:01:15 +0100
Message-ID: <fbb7d160-d592-7f22-e949-dba75d601037@arm.com>
In-Reply-To: <20161009055932.GD2613@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1440747744080692962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/10/16 06:59, kernel test robot wrote:
> =

> FYI, we noticed a -32.9% improvement of reaim.child_utime due to commit:
> =

> commit ab522e33f91799661aad47bebb691f241a9f6bb8 ("sched/fair: Fix fixed p=
oint arithmetic width for shares and effective load")
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: reaim
> on test machine: 28 threads Intel(R) Xeon(R) CPU E5-2695 v3 @ 2.30GHz wit=
h 256G memory
> with following parameters:
> =

> 	runtime: 300s
> 	nr_task: 600
> 	test: creat_clo
> 	cpufreq_governor: performance
> =

> REAIM is an updated and improved version of AIM 7 benchmark.
> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
> =

> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email

I always ask myself how could I reproduce this on a slightly different
machine.

This install step didn't work for me on my machine. OTAH, the following
steps are working:

  bin/lkp install ./jobs/reaim-micro-cyclic-lkp-hsw01.yaml
  bin/lkp split-job ./jobs/reaim-micro-cyclic-lkp-hsw01.yaml

  bin/lkp run ./reaim-micro-cyclic-lkp-hsw01-300s-600-creat_clo.yaml

But when I do this, I only get the perf.data file for this specific
testrun for the kernel I run right now.

What are the steps missing to create this list of diffs for the various
counter values like 'reaim.child_utime'?

Thanks,

-- Dietmar

>         bin/lkp run     job.yaml
> =


[...]

--===============1440747744080692962==--

