Content-Type: multipart/mixed; boundary="===============4855722882554811791=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 38ac256d1c: stress-ng.vm-segv.ops_per_sec -13.8% regression
Date: Wed, 21 Apr 2021 11:20:22 +0800
Message-ID: <20210421032022.GA13430@xsang-OptiPlex-9020>
In-Reply-To: <87im4on5u5.mognet@arm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4855722882554811791==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi, Valentin Schneider,

On Wed, Apr 14, 2021 at 06:17:38PM +0100, Valentin Schneider wrote:
> On 14/04/21 13:21, kernel test robot wrote:
> > Greeting,
> >
> > FYI, we noticed a -13.8% regression of stress-ng.vm-segv.ops_per_sec du=
e to commit:
> >
> >
> > commit: 38ac256d1c3e6b5155071ed7ba87db50a40a4b58 ("[PATCH v5 1/3] sched=
/fair: Ignore percpu threads for imbalance pulls")
> > url: https://github.com/0day-ci/linux/commits/Valentin-Schneider/sched-=
fair-load-balance-vs-capacity-margins/20210408-060830
> > base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git 0a2b65c0=
3e9b47493e1442bf9c84badc60d9bffb
> >
> > in testcase: stress-ng
> > on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz wi=
th 192G memory
> > with following parameters:
> >
> >       nr_threads: 10%
> >       disk: 1HDD
> >       testtime: 60s
> >       fs: ext4
> >       class: os
> >       test: vm-segv
> >       cpufreq_governor: performance
> >       ucode: 0x5003006
> >
> >
> =

> That's almost exactly the same result as [1], which is somewhat annoying
> for me because I wasn't able to reproduce those results back then. Save
> from scrounging the exact same machine to try this out, I'm not sure what=
's
> the best way forward. I guess I can re-run the workload on whatever
> machines I have and try to spot any potentially problematic pattern in the
> trace...

what's the machine model you used upon which the regression cannot be repro=
duced?
we could check if we have similar model then re-check on the our machine.

BTW, we supplied perf data in original report, not sure if they are helpful?
or do you have suggestion which kind of data will be more helpful to you?
we will continuously improve our report based on suggestions from community.
Thanks a lot!

> =

> [1]: http://lore.kernel.org/r/20210223023004.GB25487(a)xsang-OptiPlex-9020
--===============4855722882554811791==--

