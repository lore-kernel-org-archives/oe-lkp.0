Content-Type: multipart/mixed; boundary="===============4730457857920731780=="
MIME-Version: 1.0
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
To: lkp@lists.01.org
Subject: Re: [lkp-developer] [sched/fair] 4e5160766f: +149% ftq.noise.50% regression
Date: Tue, 03 Jan 2017 11:38:39 +0100
Message-ID: <cfdd7004-efe0-1b90-2359-a08092c1fbe1@arm.com>
In-Reply-To: <CAKfTPtARomXaQsk92aVdeGqwimhQPYzi6suMAiyT-6Zwjso1Dw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4730457857920731780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Vincent and Ying,

On 01/02/2017 04:42 PM, Vincent Guittot wrote:
> Hi Ying,
>
> On 28 December 2016 at 09:17, Huang, Ying <ying.huang@intel.com> wrote:
>> Vincent Guittot <vincent.guittot@linaro.org> writes:
>>
>>> Le Tuesday 13 Dec 2016 . 09:47:30 (+0800), Huang, Ying a .crit :
>>>> Hi, Vincent,
>>>>
>>>> Vincent Guittot <vincent.guittot@linaro.org> writes:

[...]

>>> ---
>>>  kernel/sched/fair.c | 29 ++++++++++++++++++++++++++++-
>>>  1 file changed, 28 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>>> index 090a9bb..8efa113 100644
>>> --- a/kernel/sched/fair.c
>>> +++ b/kernel/sched/fair.c
>>> @@ -3138,6 +3138,31 @@ static inline int propagate_entity_load_avg(stru=
ct sched_entity *se)
>>>       return 1;
>>>  }
>>>
>>> +/* Check if we need to update the load and the utilization of a group_=
entity */
>>> +static inline bool skip_blocked_update(struct sched_entity *se)
>>> +{
>>> +     struct cfs_rq *gcfs_rq =3D group_cfs_rq(se);
>>> +
>>> +     /*
>>> +      * If sched_entity still have not null load or utilization, we ha=
ve to
>>> +      * decay it.
>>> +      */
>>> +     if (se->avg.load_avg || se->avg.util_avg)
>>> +             return false;
>>> +
>>> +     /*
>>> +      * If there is a pending propagation, we have to update the load =
and
>>> +      * the utilizaion of the sched_entity
>>> +      */
>>> +     if (gcfs_rq->propagate_avg)
>>> +             return false;
>>> +
>>> +     /*
>>> +      * Other wise, the load and the utilizaiton of the sched_entity is
>>> +      * already null so it will be a waste of time to try to decay it
>>> +      */
>>> +     return true;
>>> +}
>>>  #else /* CONFIG_FAIR_GROUP_SCHED */
>>>
>>>  static inline void update_tg_load_avg(struct cfs_rq *cfs_rq, int force=
) {}
>>> @@ -6858,6 +6883,7 @@ static void update_blocked_averages(int cpu)
>>>  {
>>>       struct rq *rq =3D cpu_rq(cpu);
>>>       struct cfs_rq *cfs_rq;
>>> +     struct sched_entity *se;
>>>       unsigned long flags;
>>>
>>>       raw_spin_lock_irqsave(&rq->lock, flags);
>>> @@ -6876,7 +6902,8 @@ static void update_blocked_averages(int cpu)
>>>                       update_tg_load_avg(cfs_rq, 0);
>>>
>>>               /* Propagate pending load changes to the parent */
>>> -             if (cfs_rq->tg->se[cpu])
>>> +             se =3D cfs_rq->tg->se[cpu];
>>> +             if (se && !skip_blocked_update(se))
>>>                       update_load_avg(cfs_rq->tg->se[cpu], 0);
>>>       }
>>>       raw_spin_unlock_irqrestore(&rq->lock, flags);
>>
>> The test result is as follow,
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/cpufreq_governor/freq/kconfig/nr_task/rootfs/samples/tbox_group=
/test/testcase:
>>   gcc-6/powersave/20/x86_64-rhel-7.2/100%/debian-x86_64-2016-08-31.cgz/6=
000ss/lkp-hsw-d01/cache/ftq
>>
>> commit:
>>   4e5160766fcc9f41bbd38bac11f92dce993644aa: first bad commit
>>   09a43ace1f986b003c118fdf6ddf1fd685692d49: parent of first bad commit
>>   0613870ea53a7a279d8d37f2a3ce40aafc155fc8: debug commit with above patch
>>
>> 4e5160766fcc9f41 09a43ace1f986b003c118fdf6d 0613870ea53a7a279d8d37f2a3
>> ---------------- -------------------------- --------------------------
>>          %stddev     %change         %stddev     %change         %stddev
>>              \          |                \          |                \
>>      61670 =C2=B1228%     -96.5%       2148 =C2=B1 11%     -94.7%       =
3281 =C2=B1 58%  ftq.noise.25%
>>       3463 =C2=B1 10%     -60.0%       1386 =C2=B1 19%     -26.3%       =
2552 =C2=B1 58%  ftq.noise.50%
>>       1116 =C2=B1 23%     -72.6%     305.99 =C2=B1 30%     -35.8%     71=
6.15 =C2=B1 64%  ftq.noise.75%
>>    3843815 =C2=B1  3%      +3.1%    3963589 =C2=B1  1%     -49.6%    193=
8221 =C2=B1100%  ftq.time.involuntary_context_switches
>>       5.33 =C2=B1 30%     +21.4%       6.46 =C2=B1 14%     -71.7%       =
1.50 =C2=B1108%  time.system_time
>>
>>
>> It appears that the system_time and involuntary_context_switches reduced
>> much after applied the debug patch, which is good from noise point of
>> view.  ftq.noise.50% reduced compared with the first bad commit, but
>> have not restored to that of the parent of the first bad commit.
>
> Thanks for testing. I will try to improve it a bit but not sure that I
> can reduce more.

Is this a desktop system where this regression comes from autogroups (1 =

level taskgroups) or a server system with systemd (2 level taskgroups)?

Since the PELT rewrite (v4.2) I have ~60 autogroups per cpu =

(&rq->leaf_cfs_rq_list) on my Ubuntu desktop system permanently (Intel =

i7-4750HQ) whereas in v4.1 there were 0 - 10.

$ for i in `seq 0 7`; do cat /proc/sched_debug | grep
"cfs_rq\[$i\]:/autogroup-" | wc -l; done
58
61
63
65
60
59
62
56

Couldn't we still remove these autogroups by if (!cfs_rq->nr_running && =

!se->avg.load_avg && !se->avg.util_avg) in update_blocked_averages()?

Vincent, like we discussed in September last year, the proper fix would =

probably be a cfs-rq->nr_attached which IMHO is not doable w/o being an =

atomic because of migrate_task_rq_fair()->remove_entity_load_avg() not =

holding the rq lock.

--===============4730457857920731780==--

