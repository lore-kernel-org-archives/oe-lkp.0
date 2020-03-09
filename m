Content-Type: multipart/mixed; boundary="===============2995095264140337353=="
MIME-Version: 1.0
From: Jeff Layton <jlayton@kernel.org>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Mon, 09 Mar 2020 10:36:32 -0400
Message-ID: <e3783d060c778cb41b77380ad3e278133b52f57e.camel@kernel.org>
In-Reply-To: <20200308140314.GQ5972@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2995095264140337353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 2020-03-08 at 22:03 +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -96.6% regression of will-it-scale.per_process_ops due =
to commit:
> =

> =

> commit: 6d390e4b5d48ec03bb87e63cf0a2bff5f4e116da ("locks: fix a potential=
 use-after-free problem when wakeup a waiter")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: will-it-scale
> on test machine: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz wit=
h 80G memory
> with following parameters:
> =

> 	nr_task: 100%
> 	mode: process
> 	test: lock1
> 	cpufreq_governor: performance
> 	ucode: 0x11
> =

> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale
> =

> In addition to that, the commit also has significant impact on the follow=
ing tests:
> =

> +------------------+-----------------------------------------------------=
-----------------+
> > testcase: change | will-it-scale: will-it-scale.per_thread_ops -51.3% r=
egression        |
> > test machine     | 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz=
 with 80G memory |
> > test parameters  | cpufreq_governor=3Dperformance                      =
                   |
> >                  | mode=3Dthread                                       =
                   |
> >                  | nr_task=3D100%                                      =
                   |
> >                  | test=3Dlock1                                        =
                   |
> >                  | ucode=3D0x11                                        =
                   |
> +------------------+-----------------------------------------------------=
-----------------+
> =


This is not completely unexpected as we're banging on the global
blocked_lock_lock now for every unlock. This test just thrashes file
locks and unlocks without doing anything in between, so the workload
looks pretty artificial [1].

It would be nice to avoid the global lock in this codepath, but it
doesn't look simple to do. I'll keep thinking about it, but for now I'm
inclined to ignore this result unless we see a problem in more realistic
workloads.

[1]: https://github.com/antonblanchard/will-it-scale/blob/master/tests/lock=
1.c
-- =

Jeff Layton <jlayton@kernel.org>

--===============2995095264140337353==--

