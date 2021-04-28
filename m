Content-Type: multipart/mixed; boundary="===============1867395843607368708=="
MIME-Version: 1.0
From: Valentin Schneider <valentin.schneider@arm.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 38ac256d1c: stress-ng.vm-segv.ops_per_sec -13.8% regression
Date: Wed, 28 Apr 2021 23:00:07 +0100
Message-ID: <87k0omxe6w.mognet@arm.com>
In-Reply-To: <87mttqt5jc.mognet@arm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1867395843607368708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 22/04/21 21:42, Valentin Schneider wrote:
> On 22/04/21 10:55, Valentin Schneider wrote:
>> I'll go find myself some other x86 box and dig into it;
>> I'd rather not leave this hanging for too long.
>
> So I found myself a dual-socket Xeon Gold 5120 @ 2.20GHz (64 CPUs) and
> *there* I get a somewhat consistent ~-6% regression. As I'm suspecting
> cacheline shenanigans, I also ran that with Peter's recent
> kthread_is_per_cpu() change, and that brings it down to ~-3%
>

Ha ha ho ho, so that was a red herring. My statistical paranoia somewhat
paid off, and the kthread_is_per_cpu() thing doesn't really change anything
when you stare at 20+ iterations of that vm-segv thing.

As far as I can tell, the culprit is the loss of LBF_SOME_PINNED. By some
happy accident, the load balancer repeatedly iterates over PCPU kthreads,
sets LBF_SOME_PINNED and causes a group to be classified as group_imbalanced
in a later load-balance. This, in turn, forces a 1-task pull, and repeating
this pattern ~25 times a sec ends up increasing CPU utilization by ~5% over=
 the
span of the benchmark.

schedstats are somewhat noisy but seem to indicate the baseline had many
more migrations at the NUMA level (test machine has SMT, MC, NUMA). Because
of that I suspected

  b396f52326de ("sched/fair: Allow a small load imbalance between low utili=
sation SD_NUMA domains")

but reverting that actually makes things worse. I'm still digging, though
I'm slowly heading towards:

  https://www.youtube.com/watch?v=3D3L6i5AwVAbs
--===============1867395843607368708==--

