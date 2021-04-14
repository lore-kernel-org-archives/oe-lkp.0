Content-Type: multipart/mixed; boundary="===============9153614206668123931=="
MIME-Version: 1.0
From: Valentin Schneider <valentin.schneider@arm.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 38ac256d1c: stress-ng.vm-segv.ops_per_sec -13.8% regression
Date: Wed, 14 Apr 2021 18:17:38 +0100
Message-ID: <87im4on5u5.mognet@arm.com>
In-Reply-To: <20210414052151.GB21236@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============9153614206668123931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 14/04/21 13:21, kernel test robot wrote:
> Greeting,
>
> FYI, we noticed a -13.8% regression of stress-ng.vm-segv.ops_per_sec due =
to commit:
>
>
> commit: 38ac256d1c3e6b5155071ed7ba87db50a40a4b58 ("[PATCH v5 1/3] sched/f=
air: Ignore percpu threads for imbalance pulls")
> url: https://github.com/0day-ci/linux/commits/Valentin-Schneider/sched-fa=
ir-load-balance-vs-capacity-margins/20210408-060830
> base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git 0a2b65c03e=
9b47493e1442bf9c84badc60d9bffb
>
> in testcase: stress-ng
> on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz with=
 192G memory
> with following parameters:
>
>       nr_threads: 10%
>       disk: 1HDD
>       testtime: 60s
>       fs: ext4
>       class: os
>       test: vm-segv
>       cpufreq_governor: performance
>       ucode: 0x5003006
>
>

That's almost exactly the same result as [1], which is somewhat annoying
for me because I wasn't able to reproduce those results back then. Save
from scrounging the exact same machine to try this out, I'm not sure what's
the best way forward. I guess I can re-run the workload on whatever
machines I have and try to spot any potentially problematic pattern in the
trace...

[1]: http://lore.kernel.org/r/20210223023004.GB25487(a)xsang-OptiPlex-9020
--===============9153614206668123931==--

