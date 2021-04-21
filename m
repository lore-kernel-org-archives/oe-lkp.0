Content-Type: multipart/mixed; boundary="===============7038203488555820178=="
MIME-Version: 1.0
From: Valentin Schneider <valentin.schneider@arm.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 38ac256d1c: stress-ng.vm-segv.ops_per_sec -13.8% regression
Date: Wed, 21 Apr 2021 11:27:49 +0100
Message-ID: <87bla8ue3e.mognet@arm.com>
In-Reply-To: <20210421032022.GA13430@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7038203488555820178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi,

On 21/04/21 11:20, Oliver Sang wrote:
> hi, Valentin Schneider,
>
> On Wed, Apr 14, 2021 at 06:17:38PM +0100, Valentin Schneider wrote:
>> On 14/04/21 13:21, kernel test robot wrote:
>> > Greeting,
>> >
>> > FYI, we noticed a -13.8% regression of stress-ng.vm-segv.ops_per_sec d=
ue to commit:
>> >
>> >
>> > commit: 38ac256d1c3e6b5155071ed7ba87db50a40a4b58 ("[PATCH v5 1/3] sche=
d/fair: Ignore percpu threads for imbalance pulls")
>> > url: https://github.com/0day-ci/linux/commits/Valentin-Schneider/sched=
-fair-load-balance-vs-capacity-margins/20210408-060830
>> > base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git 0a2b65c=
03e9b47493e1442bf9c84badc60d9bffb
>> >
>> > in testcase: stress-ng
>> > on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz w=
ith 192G memory
>> > with following parameters:
>> >
>> >       nr_threads: 10%
>> >       disk: 1HDD
>> >       testtime: 60s
>> >       fs: ext4
>> >       class: os
>> >       test: vm-segv
>> >       cpufreq_governor: performance
>> >       ucode: 0x5003006
>> >
>> >
>>
>> That's almost exactly the same result as [1], which is somewhat annoying
>> for me because I wasn't able to reproduce those results back then. Save
>> from scrounging the exact same machine to try this out, I'm not sure wha=
t's
>> the best way forward. I guess I can re-run the workload on whatever
>> machines I have and try to spot any potentially problematic pattern in t=
he
>> trace...
>
> what's the machine model you used upon which the regression cannot be rep=
roduced?
> we could check if we have similar model then re-check on the our machine.
>

I tested this on:
o Ampere eMAG (arm64, 32 cores)
o 2-socket Xeon E5-2690 (x86, 40 cores)

and found at worse a -0.3% regression and at best a 2% improvement. I know
that x86 box is somewhat ancient, but it's been my go-to "have I broken
x86?" test victim for a while :-)

> BTW, we supplied perf data in original report, not sure if they are helpf=
ul?
> or do you have suggestion which kind of data will be more helpful to you?
> we will continuously improve our report based on suggestions from communi=
ty.
> Thanks a lot!
>

Staring at it some more, I notice a huge uptick in:

- major page faults (+315.2% and +270%)
- cache misses (+125.2% and +131.0%)

I don't really get the page faults; the cache misses I could somewhat
understand: this is adding p->flags and (p->set_child_tid)->flags accesses,
which are in different cachelines than p->se and p->cpus_mask used in
can_migrate_task().

I think I could dig some more into this with perf, but I'd need to be able
to reproduce this locally first...

>>
>> [1]: http://lore.kernel.org/r/20210223023004.GB25487(a)xsang-OptiPlex-90=
20
--===============7038203488555820178==--

