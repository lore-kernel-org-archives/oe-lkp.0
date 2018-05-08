Content-Type: multipart/mixed; boundary="===============4471688287856819926=="
MIME-Version: 1.0
From: Johannes Weiner <hannes@cmpxchg.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] e27be240df: will-it-scale.per_process_ops -27.2% regression
Date: Tue, 08 May 2018 13:26:40 -0400
Message-ID: <20180508172640.GB24175@cmpxchg.org>
In-Reply-To: <20180508053451.GD30203@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4471688287856819926==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, May 08, 2018 at 01:34:51PM +0800, kernel test robot wrote:
> FYI, we noticed a -27.2% regression of will-it-scale.per_process_ops due =
to commit:
> =

> =

> commit: e27be240df53f1a20c659168e722b5d9f16cc7f4 ("mm: memcg: make sure m=
emory.events is uptodate when waking pollers")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: will-it-scale
> on test machine: 72 threads Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz wit=
h 128G memory
> with following parameters:
> =

> 	nr_task: 100%
> 	mode: process
> 	test: page_fault3
> 	cpufreq_governor: performance
> =

> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale

This is surprising. Do you run these tests in a memory cgroup with a
limit set? Can you dump that cgroup's memory.events after the run?

Thanks

--===============4471688287856819926==--

