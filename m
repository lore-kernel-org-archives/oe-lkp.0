Content-Type: multipart/mixed; boundary="===============0928037558848773691=="
MIME-Version: 1.0
From: Valentin Schneider <valentin.schneider@arm.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 38ac256d1c: stress-ng.vm-segv.ops_per_sec -13.8% regression
Date: Thu, 06 May 2021 17:11:20 +0100
Message-ID: <871rajkfkn.mognet@arm.com>
In-Reply-To: <87k0omxe6w.mognet@arm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0928037558848773691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 28/04/21 23:00, Valentin Schneider wrote:
> As far as I can tell, the culprit is the loss of LBF_SOME_PINNED. By some
> happy accident, the load balancer repeatedly iterates over PCPU kthreads,
> sets LBF_SOME_PINNED and causes a group to be classified as group_imbalan=
ced
> in a later load-balance. This, in turn, forces a 1-task pull, and repeati=
ng
> this pattern ~25 times a sec ends up increasing CPU utilization by ~5% ov=
er the
> span of the benchmark.

So this is where I got to:

Because pcpu kthreads run periodically, they sometimes get iterated over by=
 the
periodic load-balance and can cause LBF_SOME_PINNED. This can lead to setti=
ng

  env->sd->parent->sg->sgc->imbalance

which may cause later load balance attempts to classify the designated group
span as group_imbalanced. Note that this will affect periodic load balance
*and* fork/exec balance.


On a 2-node system with SMT, MC and NUMA topology levels, this means that
load-balance at MC level will periodically set LBF_SOME_PINNED, opening a
window where any subsequent fork() issued on that node will see
find_idlest_cpu() being biased towards the remote node (find_idlest_cpu()
tries to minimize group_type, and group_imbalanced is the second highest).
In the benchmark's case, the NUMA groups are only ever classified as
group_has_spare, making this a hard bias.

Digging down into find_idlest_cpu(), this periodic bias seems to act as an
override to allow_numa_imbalance(): the benchmark spawns 6 stressors which
AFAICT each spawn a child, so that's at most 12 total runnable tasks. In
this particular case, the 25% domain size threshold of
allow_numa_imbalance() maps to 16, so the condition is pretty much always
true (confirmed via tracing).

On this particular machine (dual-socket Xeon Gold 5120 @ 2.20GHz, 64 CPUs)
with this particular benchmark this seems to happen for ~1% of forks, but
causes a performance improvement between of 5% to 13%. I'm not exactly sure
on the why, but I suspect that the tasks having a very short runtime (avg
6=C2=B5s) means fork-time balance is the only real opportunity for them to =
move
to a different NUMA node.

One could argue the benchmark itself gets what it deserves since forking ad
nauseam isn't such a great idea [1], and perhaps it should pin the
stressors to a single NUMA node. I did try to make allow_numa_imbalance()
"smarter", but couldn't find any winning formula. Adding to this the fact
that this regression isn't reproducible on a lot of systems (I got either
noise or improvements on all the arm64 systems I tried), so I'm somewhat
stumped TBH.

[1]: Unless you're trying to summon Slaanesh
--===============0928037558848773691==--

