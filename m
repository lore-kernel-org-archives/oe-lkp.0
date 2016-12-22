Content-Type: multipart/mixed; boundary="===============7611575434244853227=="
MIME-Version: 1.0
From: Vincent Guittot <vincent.guittot@linaro.org>
To: lkp@lists.01.org
Subject: Re: [lkp-developer] [sched/fair] 4e5160766f: +149% ftq.noise.50% regression
Date: Thu, 22 Dec 2016 16:12:15 +0100
Message-ID: <20161222151215.GA23448@linaro.org>
In-Reply-To: <878trk8urx.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7611575434244853227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Le Tuesday 13 Dec 2016 =C3=A0 09:47:30 (+0800), Huang, Ying a =C3=A9crit :
> Hi, Vincent,
> =

> Vincent Guittot <vincent.guittot@linaro.org> writes:
> =

> > Hi Ying,
> >
> > On 12 December 2016 at 06:43, kernel test robot
> > <ying.huang@linux.intel.com> wrote:
> >> Greeting,
> >>
> >> FYI, we noticed a 149% regression of ftq.noise.50% due to commit:
> >>
> >>
> >> commit: 4e5160766fcc9f41bbd38bac11f92dce993644aa ("sched/fair: Propaga=
te asynchrous detach")
> >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git ma=
ster
> >>
> >> in testcase: ftq
> >> on test machine: 8 threads Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz wit=
h 8G memory
> >> with following parameters:
> >>
> >>         nr_task: 100%
> >>         samples: 6000ss
> >>         test: cache
> >>         freq: 20
> >>         cpufreq_governor: powersave
> >
> > Why using powersave ? Are you testing  every governors ?
> =

> We will test performance and powersave governor for FTQ.

Ok thanks

> =

> >>
> >> test-description: The FTQ benchmarks measure hardware and software int=
erference or 'noise' on a node from the applications perspective.
> >> test-url: https://github.com/rminnich/ftq
> >
> > It's a bit difficult to understand exactly what is measured and what
> > is ftq.noise.50% because this result is not part of the bench which
> > seems to only record a log of data in a file and ftq.noise.50% seems
> > to be lkp specific
> =

> Yes. FTQ itself has no noise statistics builtin, although it is an OS
> noise benchmark.  ftq.noise.50% is calculated as below:
> =

> There is a score for every sample of ftq.  The lower the score, the
> higher the noises.  ftq.noise.50% is the number (per 1000000 samples) of
> samples whose score is less than 50% of the mean score.
> =


ok so IIUC we have moved from 0.03% to 0.11% for ftq.noise.50%

I have not been able to reproduce the regression on the different system th=
at I have access to so I can only guess the root cause of the regression.

Could it be possible to test if the patch below fix the regression ?


---
 kernel/sched/fair.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 090a9bb..8efa113 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3138,6 +3138,31 @@ static inline int propagate_entity_load_avg(struct s=
ched_entity *se)
 	return 1;
 }
 =

+/* Check if we need to update the load and the utilization of a group_enti=
ty */
+static inline bool skip_blocked_update(struct sched_entity *se)
+{
+	struct cfs_rq *gcfs_rq =3D group_cfs_rq(se);
+
+	/*
+	 * If sched_entity still have not null load or utilization, we have to
+	 * decay it.
+	 */
+	if (se->avg.load_avg || se->avg.util_avg)
+		return false;
+
+	/*
+	 * If there is a pending propagation, we have to update the load and
+	 * the utilizaion of the sched_entity
+	 */
+	if (gcfs_rq->propagate_avg)
+		return false;
+
+	/*
+	 * Other wise, the load and the utilizaiton of the sched_entity is
+	 * already null so it will be a waste of time to try to decay it
+	 */
+	return true;
+}
 #else /* CONFIG_FAIR_GROUP_SCHED */
 =

 static inline void update_tg_load_avg(struct cfs_rq *cfs_rq, int force) {}
@@ -6858,6 +6883,7 @@ static void update_blocked_averages(int cpu)
 {
 	struct rq *rq =3D cpu_rq(cpu);
 	struct cfs_rq *cfs_rq;
+	struct sched_entity *se;
 	unsigned long flags;
 =

 	raw_spin_lock_irqsave(&rq->lock, flags);
@@ -6876,7 +6902,8 @@ static void update_blocked_averages(int cpu)
 			update_tg_load_avg(cfs_rq, 0);
 =

 		/* Propagate pending load changes to the parent */
-		if (cfs_rq->tg->se[cpu])
+		se =3D cfs_rq->tg->se[cpu];
+		if (se && !skip_blocked_update(se))
 			update_load_avg(cfs_rq->tg->se[cpu], 0);
 	}
 	raw_spin_unlock_irqrestore(&rq->lock, flags);
-- =

2.7.4

Thanks


> Best Regards,
> Huang, Ying
> =

> > I have tried to reproduce the lkp test on a debian jessie then a
> > ubuntu server 16.10 but lkp doesn't seems to install cleanly as there
> > are some errors:
> >
> > sudo bin/lkp run     job.yaml
> > IPMI BMC is not supported on this machine, skip bmc-watchdog setup!
> > 2016-12-12 13:58:39 ./ftq_cache -f 20 -n 6000 -t 8 -a 524288
> > Start 5088418680237 end 5438443372098 elapsed 350024691861
> > cyclestart 14236344834332 cycleend 15214154208877 elapsed 977809374545
> > Avg Cycles(ticks) per ns. is 2.793544; nspercycle is 0.357968
> > Pre-computed ticks per ns: 2.793541
> > Sample frequency is 20.000000
> > ticks per ns 2.79354
> > chown: utilisateur incorrect: =C2=ABlkp.lkp=C2=BB
> > chown: utilisateur incorrect: =C2=ABlkp.lkp=C2=BB
> > wait for background monitors: 9405 9407 oom-killer nfs-hang
> > curl: (6) Could not resolve host: ftq.time
> >
> >
> >>
> >> In addition to that, the commit also has significant impact on the fol=
lowing tests:
> >>
> >> +------------------+--------------------------------------------------=
------------------------------+
> >> | testcase: change | unixbench: unixbench.score 2.7% improvement      =
                              |
> >> | test machine     | 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz=
 with 4G memory               |
> >> | test parameters  | cpufreq_governor=3Dperformance                   =
                                |
> >> |                  | nr_task=3D100%                                   =
                                |
> >> |                  | runtime=3D300s                                   =
                                |
> >> |                  | test=3Dexecl                                     =
                                |
> >> +------------------+--------------------------------------------------=
------------------------------+
> >>
> >>
> >> Details are as below:
> >> ----------------------------------------------------------------------=
---------------------------->
> >>
> >>
> >> To reproduce:
> >>
> >>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lk=
p-tests.git
> >>         cd lkp-tests
> >>         bin/lkp install job.yaml  # job file is attached in this email
> >>         bin/lkp run     job.yaml
> >>
> >> testcase/path_params/tbox_group/run: ftq/100%-6000ss-cache-20-powersav=
e/lkp-hsw-d01
> >>
> >> 09a43ace1f986b00  4e5160766fcc9f41bbd38bac11
> >> ----------------  --------------------------
> >>          %stddev      change         %stddev
> >>              \          |                \
> >>        305 =C2=B1 30%       260%       1100 =C2=B1 14%  ftq.noise.75%
> >>       1386 =C2=B1 19%       149%       3457 =C2=B1  7%  ftq.noise.50%
> >>       2148 =C2=B1 11%        98%       4257 =C2=B1  4%  ftq.noise.25%
> >>    3963589                     3898578        ftq.time.involuntary_con=
text_switches
> >>
> >>
> >>
> >>                                    ftq.noise.50_
> >>
> >>   4000 ++------------O------------------------------------------------=
------+
> >>        |                                                           O  =
    O |
> >>   3500 ++     O             O                        O    O O O       =
      O
> >>        | O  O      O   O      O O  O O O    O O    O   O         O    =
      |
> >>        O        O                         O                          O=
 O    |
> >>   3000 ++                                       O                     =
      |
> >>        |                 O                                            =
      |
> >>   2500 ++                                                             =
      |
> >>        |                                                              =
      |
> >>   2000 ++                                                             =
      |
> >>        |    *                  .*                                     =
      |
> >>        |   + :     *   *      *  +                                    =
      |
> >>   1500 ++ +  :    + + + +    :    + .*                                =
      |
> >>        |.*    *. +   *   *.. :     *  +                               =
      |
> >>   1000 *+-------*-----------*----------*------------------------------=
------+
> >>
> >>         [*] bisect-good sample
> >>         [O] bisect-bad  sample
> >>
> >>
> >> Disclaimer:
> >> Results have been estimated based on internal Intel analysis and are p=
rovided
> >> for informational purposes only. Any difference in system hardware or =
software
> >> design or configuration may affect actual performance.
> >>
> >>
> >> Thanks,
> >> Ying Huang
> > _______________________________________________
> > LKP mailing list
> > LKP(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/lkp

--===============7611575434244853227==--

