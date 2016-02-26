Content-Type: multipart/mixed; boundary="===============0606979375455505702=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/topology] 6a1447190e: BUG: unable to handle kernel paging request at ffffffffffffffff
Date: Fri, 26 Feb 2016 09:05:37 +0100
Message-ID: <alpine.DEB.2.11.1602260854030.3638@nanos>
In-Reply-To: <87fuwg9syt.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0606979375455505702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Feb 2016, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/core
> commit 6a1447190e7f7540be17414db801ac6a12d77566 ("x86/topology: Create lo=
gical package id")
> =

> [    4.686741] smpboot: Total of 160 processors activated (936319.36 Bogo=
MIPS)
> [    5.326197] BUG: unable to handle kernel paging request at fffffffffff=
fffff
> [    5.328153] IP: [<ffffffff81211303>] __kmalloc_track_caller+0x106/0x1cb

I have no idea how that is related.

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml

I finally gave it a try and to be honest it's completely useless.

root(a)herakles:/home/tglx/work/kernel/lkp/lkp-tests# bin/lkp install job.y=
aml

  Creating testbox configuration file: /home/tglx/work/kernel/lkp/lkp-tests=
/hosts/herakles.
  /home/tglx/work/kernel/lkp/lkp-tests/lkp-exec/install: 87: /home/tglx/wor=
k/kernel/lkp/lkp-tests/lkp-exec/install: Bad substitution

Which is not a surprise as neither hdd_partitions nor ssd_partitions can be
evaluated.

After creating that config file manually I run the job:

# bin/lkp run     job.yaml =

wait for background monitors: oom-killer watchdog

That returns after roughly 1 second doing nothing w/o any result.

Thanks,

	tglx

--===============0606979375455505702==--

