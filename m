Content-Type: multipart/mixed; boundary="===============8499146116841989327=="
MIME-Version: 1.0
From: Viresh Kumar <viresh.kumar@linaro.org>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 3c29e651e1: hackbench.throughput -15.2% regression
Date: Wed, 01 Apr 2020 16:10:46 +0530
Message-ID: <20200401104046.5f3aou6fvyw4x3ej@vireshk-i7>
In-Reply-To: <20200205122902.GL12867@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8499146116841989327==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry for getting back to this after a long time :(

On 05-02-20, 20:29, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -15.2% regression of hackbench.throughput due to commit:
> =

> =

> commit: 3c29e651e16dd3b3179cfb2d055ee9538e37515c ("sched/fair: Fall back =
to sched-idle CPU if idle CPU isn't found")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: hackbench
> on test machine: 16 threads Intel(R) Xeon(R) E-2278G CPU @ 3.40GHz with 3=
2G memory
> with following parameters:
> =

> 	nr_threads: 100%
> 	mode: threads
> 	ipc: pipe
> 	cpufreq_governor: performance
> 	ucode: 0xca

I tried following command on my x86 box, skylake, 8 CPUs =


"/usr/bin/hackbench" "-g" "8" "--threads" "--pipe" "-l" "30000" "-s" "100"

And hackbench mostly reports values from 29.4 to 30.7, with and without my
patches. I used intel_pstate=3Dpassive in command line and chose performance
governor by default.

I don't see any issues here in hackbench numbers because of my patches.

-- =

viresh
--===============8499146116841989327==--

