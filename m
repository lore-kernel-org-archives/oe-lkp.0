Content-Type: multipart/mixed; boundary="===============0466680155821569567=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [sched/numa] 6499b1b2dd: phoronix-test-suite.aom-av1.0.frames_per_second -25.0% regression
Date: Fri, 06 Mar 2020 09:06:08 +0000
Message-ID: <20200306090608.GS3818@techsingularity.net>
In-Reply-To: <20200306023551.GE9382@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0466680155821569567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 06, 2020 at 10:35:51AM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -25.0% regression of phoronix-test-suite.aom-av1.0.fram=
es_per_second due to commit:
> =

> =

> commit: 6499b1b2dd1b8d404a16b9fbbf1af6b9b3c1d83d ("sched/numa: Replace ru=
nnable_load_avg by load_avg")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: phoronix-test-suite
> on test machine: 16 threads Intel(R) Xeon(R) CPU X5570 @ 2.93GHz with 48G=
 memory
> with following parameters:
> =

> 	test: aom-av1-1.2.0
> 	cpufreq_governor: performance
> 	ucode: 0x1d
> =

> test-description: The Phoronix Test Suite is the most comprehensive testi=
ng and benchmarking platform available that provides an extensible framewor=
k for which new tests can be easily added.
> test-url: http://www.phoronix-test-suite.com/
> =


The middle of this series is not safe for bisection from a performance
perspective. It needs to be determined if the series is ok only after
all the patches are applied.

-- =

Mel Gorman
SUSE Labs
--===============0466680155821569567==--

