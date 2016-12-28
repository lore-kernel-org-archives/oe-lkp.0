Content-Type: multipart/mixed; boundary="===============6725725230958475958=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-developer] [sched/fair] 4e5160766f: +149% ftq.noise.50% regression
Date: Wed, 28 Dec 2016 16:17:27 +0800
Message-ID: <87r34swjqg.fsf@yhuang-dev.intel.com>
In-Reply-To: <20161222151215.GA23448@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6725725230958475958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Vincent Guittot <vincent.guittot@linaro.org> writes:

> Le Tuesday 13 Dec 2016 . 09:47:30 (+0800), Huang, Ying a .crit :
>> Hi, Vincent,
>> =

>> Vincent Guittot <vincent.guittot@linaro.org> writes:
>> =

>> > Hi Ying,
>> >
>> > On 12 December 2016 at 06:43, kernel test robot
>> > <ying.huang@linux.intel.com> wrote:
>> >> Greeting,
>> >>
>> >> FYI, we noticed a 149% regression of ftq.noise.50% due to commit:
>> >>
>> >>
>> >> commit: 4e5160766fcc9f41bbd38bac11f92dce993644aa ("sched/fair: Propag=
ate asynchrous detach")
>> >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git m=
aster
>> >>
>> >> in testcase: ftq
>> >> on test machine: 8 threads Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz wi=
th 8G memory
>> >> with following parameters:
>> >>
>> >>         nr_task: 100%
>> >>         samples: 6000ss
>> >>         test: cache
>> >>         freq: 20
>> >>         cpufreq_governor: powersave
>> >
>> > Why using powersave ? Are you testing  every governors ?
>> =

>> We will test performance and powersave governor for FTQ.
>
> Ok thanks
>
>> =

>> >>
>> >> test-description: The FTQ benchmarks measure hardware and software in=
terference or 'noise' on a node from the applications perspective.
>> >> test-url: https://github.com/rminnich/ftq
>> >
>> > It's a bit difficult to understand exactly what is measured and what
>> > is ftq.noise.50% because this result is not part of the bench which
>> > seems to only record a log of data in a file and ftq.noise.50% seems
>> > to be lkp specific
>> =

>> Yes. FTQ itself has no noise statistics builtin, although it is an OS
>> noise benchmark.  ftq.noise.50% is calculated as below:
>> =

>> There is a score for every sample of ftq.  The lower the score, the
>> higher the noises.  ftq.noise.50% is the number (per 1000000 samples) of
>> samples whose score is less than 50% of the mean score.
>> =

>
> ok so IIUC we have moved from 0.03% to 0.11% for ftq.noise.50%
>
> I have not been able to reproduce the regression on the different system =
that I have access to so I can only guess the root cause of the regression.
>
> Could it be possible to test if the patch below fix the regression ?
>
>
> ---
>  kernel/sched/fair.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 090a9bb..8efa113 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -3138,6 +3138,31 @@ static inline int propagate_entity_load_avg(struct=
 sched_entity *se)
>  	return 1;
>  }
>  =

> +/* Check if we need to update the load and the utilization of a group_en=
tity */
> +static inline bool skip_blocked_update(struct sched_entity *se)
> +{
> +	struct cfs_rq *gcfs_rq =3D group_cfs_rq(se);
> +
> +	/*
> +	 * If sched_entity still have not null load or utilization, we have to
> +	 * decay it.
> +	 */
> +	if (se->avg.load_avg || se->avg.util_avg)
> +		return false;
> +
> +	/*
> +	 * If there is a pending propagation, we have to update the load and
> +	 * the utilizaion of the sched_entity
> +	 */
> +	if (gcfs_rq->propagate_avg)
> +		return false;
> +
> +	/*
> +	 * Other wise, the load and the utilizaiton of the sched_entity is
> +	 * already null so it will be a waste of time to try to decay it
> +	 */
> +	return true;
> +}
>  #else /* CONFIG_FAIR_GROUP_SCHED */
>  =

>  static inline void update_tg_load_avg(struct cfs_rq *cfs_rq, int force) =
{}
> @@ -6858,6 +6883,7 @@ static void update_blocked_averages(int cpu)
>  {
>  	struct rq *rq =3D cpu_rq(cpu);
>  	struct cfs_rq *cfs_rq;
> +	struct sched_entity *se;
>  	unsigned long flags;
>  =

>  	raw_spin_lock_irqsave(&rq->lock, flags);
> @@ -6876,7 +6902,8 @@ static void update_blocked_averages(int cpu)
>  			update_tg_load_avg(cfs_rq, 0);
>  =

>  		/* Propagate pending load changes to the parent */
> -		if (cfs_rq->tg->se[cpu])
> +		se =3D cfs_rq->tg->se[cpu];
> +		if (se && !skip_blocked_update(se))
>  			update_load_avg(cfs_rq->tg->se[cpu], 0);
>  	}
>  	raw_spin_unlock_irqrestore(&rq->lock, flags);

The test result is as follow,

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/freq/kconfig/nr_task/rootfs/samples/tbox_group/te=
st/testcase:
  gcc-6/powersave/20/x86_64-rhel-7.2/100%/debian-x86_64-2016-08-31.cgz/6000=
ss/lkp-hsw-d01/cache/ftq

commit: =

  4e5160766fcc9f41bbd38bac11f92dce993644aa: first bad commit
  09a43ace1f986b003c118fdf6ddf1fd685692d49: parent of first bad commit
  0613870ea53a7a279d8d37f2a3ce40aafc155fc8: debug commit with above patch

4e5160766fcc9f41 09a43ace1f986b003c118fdf6d 0613870ea53a7a279d8d37f2a3 =

---------------- -------------------------- -------------------------- =

         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \  =

     61670 =C2=B1228%     -96.5%       2148 =C2=B1 11%     -94.7%       328=
1 =C2=B1 58%  ftq.noise.25%
      3463 =C2=B1 10%     -60.0%       1386 =C2=B1 19%     -26.3%       255=
2 =C2=B1 58%  ftq.noise.50%
      1116 =C2=B1 23%     -72.6%     305.99 =C2=B1 30%     -35.8%     716.1=
5 =C2=B1 64%  ftq.noise.75%
   3843815 =C2=B1  3%      +3.1%    3963589 =C2=B1  1%     -49.6%    193822=
1 =C2=B1100%  ftq.time.involuntary_context_switches
      5.33 =C2=B1 30%     +21.4%       6.46 =C2=B1 14%     -71.7%       1.5=
0 =C2=B1108%  time.system_time


It appears that the system_time and involuntary_context_switches reduced
much after applied the debug patch, which is good from noise point of
view.  ftq.noise.50% reduced compared with the first bad commit, but
have not restored to that of the parent of the first bad commit.

Best Regards,
Huang, Ying

--===============6725725230958475958==--

