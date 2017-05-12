Content-Type: multipart/mixed; boundary="===============4402415875356631933=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, page_alloc] d34b0733b4: will-it-scale.per_thread_ops -4% regression
Date: Fri, 12 May 2017 10:24:50 +0100
Message-ID: <20170512092450.fei3kvihmyf7easx@techsingularity.net>
In-Reply-To: <20170512044723.GI24200@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4402415875356631933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 12, 2017 at 12:47:23PM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> We noticed a -4% regression of will-it-scale.per_thread_ops due to commit:
> =

> commit: d34b0733b452ca3ef1dee36436dab08b8aa6a85c ("Revert "mm, page_alloc=
: only use per-cpu allocator for irq-safe requests"")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: will-it-scale
> on test machine: 256 threads Phi with 96G memory
> with following parameters:
> =

> 	nr_task: 100%
> 	mode: thread
> 	test: page_fault2
> 	cpufreq_governor: performance
> =

> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale
> =


Regrettably, this is a regression that cannot be avoided. The revert removes
an optimisation that has consequences for network-intensive workloads.
The whole idea needs to be revisited and the revert was the safest
option for 4.11.

-- =

Mel Gorman
SUSE Labs

--===============4402415875356631933==--

