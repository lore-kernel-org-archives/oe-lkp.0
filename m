Content-Type: multipart/mixed; boundary="===============0295076513803794982=="
MIME-Version: 1.0
From: Vincent Guittot <vincent.guittot@linaro.org>
To: lkp@lists.01.org
Subject: Re: [lkp-developer] [sched/fair] 4e5160766f: +149% ftq.noise.50% regression
Date: Tue, 03 Jan 2017 12:37:59 +0100
Message-ID: <20170103113759.GA30094@linaro.org>
In-Reply-To: <cfdd7004-efe0-1b90-2359-a08092c1fbe1@arm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0295076513803794982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dietmar and Ying,

Le Tuesday 03 Jan 2017 =C3=A0 11:38:39 (+0100), Dietmar Eggemann a =C3=A9cr=
it :
> Hi Vincent and Ying,
> =

> On 01/02/2017 04:42 PM, Vincent Guittot wrote:
> >Hi Ying,
> >
> >On 28 December 2016 at 09:17, Huang, Ying <ying.huang@intel.com> wrote:
> >>Vincent Guittot <vincent.guittot@linaro.org> writes:
> >>
> >>>Le Tuesday 13 Dec 2016 . 09:47:30 (+0800), Huang, Ying a .crit :
> >>>>Hi, Vincent,
> >>>>
> >>>>Vincent Guittot <vincent.guittot@linaro.org> writes:
> =

> [...]
>

[snip]

> >>
> >>The test result is as follow,
> >>
> >>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>compiler/cpufreq_governor/freq/kconfig/nr_task/rootfs/samples/tbox_grou=
p/test/testcase:
> >>  gcc-6/powersave/20/x86_64-rhel-7.2/100%/debian-x86_64-2016-08-31.cgz/=
6000ss/lkp-hsw-d01/cache/ftq
> >>
> >>commit:
> >>  4e5160766fcc9f41bbd38bac11f92dce993644aa: first bad commit
> >>  09a43ace1f986b003c118fdf6ddf1fd685692d49: parent of first bad commit
> >>  0613870ea53a7a279d8d37f2a3ce40aafc155fc8: debug commit with above pat=
ch
> >>
> >>4e5160766fcc9f41 09a43ace1f986b003c118fdf6d 0613870ea53a7a279d8d37f2a3
> >>---------------- -------------------------- --------------------------
> >>         %stddev     %change         %stddev     %change         %stddev
> >>             \          |                \          |                \
> >>     61670 =C2=B1228%     -96.5%       2148 =C2=B1 11%     -94.7%      =
 3281 =C2=B1 58%  ftq.noise.25%
> >>      3463 =C2=B1 10%     -60.0%       1386 =C2=B1 19%     -26.3%      =
 2552 =C2=B1 58%  ftq.noise.50%
> >>      1116 =C2=B1 23%     -72.6%     305.99 =C2=B1 30%     -35.8%     7=
16.15 =C2=B1 64%  ftq.noise.75%
> >>   3843815 =C2=B1  3%      +3.1%    3963589 =C2=B1  1%     -49.6%    19=
38221 =C2=B1100%  ftq.time.involuntary_context_switches
> >>      5.33 =C2=B1 30%     +21.4%       6.46 =C2=B1 14%     -71.7%      =
 1.50 =C2=B1108%  time.system_time
> >>
> >>
> >>It appears that the system_time and involuntary_context_switches reduced
> >>much after applied the debug patch, which is good from noise point of
> >>view.  ftq.noise.50% reduced compared with the first bad commit, but
> >>have not restored to that of the parent of the first bad commit.
> >
> >Thanks for testing. I will try to improve it a bit but not sure that I
> >can reduce more.
> =

> Is this a desktop system where this regression comes from autogroups (1
> level taskgroups) or a server system with systemd (2 level taskgroups)?
> =

> Since the PELT rewrite (v4.2) I have ~60 autogroups per cpu
> (&rq->leaf_cfs_rq_list) on my Ubuntu desktop system permanently (Intel
> i7-4750HQ) whereas in v4.1 there were 0 - 10.
> =

> $ for i in `seq 0 7`; do cat /proc/sched_debug | grep
> "cfs_rq\[$i\]:/autogroup-" | wc -l; done
> 58
> 61
> 63
> 65
> 60
> 59
> 62
> 56
> =

> Couldn't we still remove these autogroups by if (!cfs_rq->nr_running &&
> !se->avg.load_avg && !se->avg.util_avg) in update_blocked_averages()?
> =

> Vincent, like we discussed in September last year, the proper fix would
> probably be a cfs-rq->nr_attached which IMHO is not doable w/o being an
> atomic because of migrate_task_rq_fair()->remove_entity_load_avg() not
> holding the rq lock.

I remember the discussion and even if I agree that a large number of taskgr=
oup
increases the number of loop in update_blocked_averages() and as a result t=
he
time spent in the update, I don't think that this is the root cause of
this regression because the patch "sched/fair: Propagate asynchrous detach"
doesn't add more loops to update_blocked_averages but it adds more thing to=
 do
per loop.

Then, I think I'm still too conservative in the condition for calling =

update_load_avg(cfs_rq->tg->se[cpu], 0). This call has been added to
propagate gcfs_rq->propagate_avg flag to parent so we don't need to call it =

even if load_avg is not null but only when propagate_avg flag is set. The
patch below should improve thing compare to the previous version because
it will call update_load_avg(cfs_rq->tg->se[cpu], 0) only if an asynchrouno=
us
detach happened (propagate_avg is set).

Ying, could you test the patch below instead of the previous one ?

---
 kernel/sched/fair.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 6559d19..a4f5c35 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6915,6 +6915,7 @@ static void update_blocked_averages(int cpu)
 {
 	struct rq *rq =3D cpu_rq(cpu);
 	struct cfs_rq *cfs_rq;
+	struct sched_entity *se;
 	unsigned long flags;
 =

 	raw_spin_lock_irqsave(&rq->lock, flags);
@@ -6932,9 +6933,10 @@ static void update_blocked_averages(int cpu)
 		if (update_cfs_rq_load_avg(cfs_rq_clock_task(cfs_rq), cfs_rq, true))
 			update_tg_load_avg(cfs_rq, 0);
 =

-		/* Propagate pending load changes to the parent */
-		if (cfs_rq->tg->se[cpu])
-			update_load_avg(cfs_rq->tg->se[cpu], 0);
+		/* Propagate pending load changes to the parent if any */
+		se =3D cfs_rq->tg->se[cpu];
+		if (se && cfs_rq->propagate_avg)
+			update_load_avg(se, 0);
 	}
 	raw_spin_unlock_irqrestore(&rq->lock, flags);
 }
-- =

2.7.4


>

--===============0295076513803794982==--

