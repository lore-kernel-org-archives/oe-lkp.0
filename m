Content-Type: multipart/mixed; boundary="===============3710131442126428254=="
MIME-Version: 1.0
From: Vincent Guittot <vincent.guittot@linaro.org>
To: lkp@lists.01.org
Subject: Re: [lkp-developer] [sched/fair] 4e5160766f: +149% ftq.noise.50% regression
Date: Wed, 04 Jan 2017 15:06:30 +0100
Message-ID: <CAKfTPtBLZ4Fm5cPiFAdF3N16LaqE+SsFkbi3USWYL0iSK9sDdA@mail.gmail.com>
In-Reply-To: <87a8b7o72c.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3710131442126428254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 4 January 2017 at 04:08, Huang, Ying <ying.huang@intel.com> wrote:
> Vincent Guittot <vincent.guittot@linaro.org> writes:
>
>>>
>>> Vincent, like we discussed in September last year, the proper fix would
>>> probably be a cfs-rq->nr_attached which IMHO is not doable w/o being an
>>> atomic because of migrate_task_rq_fair()->remove_entity_load_avg() not
>>> holding the rq lock.
>>
>> I remember the discussion and even if I agree that a large number of tas=
kgroup
>> increases the number of loop in update_blocked_averages() and as a resul=
t the
>> time spent in the update, I don't think that this is the root cause of
>> this regression because the patch "sched/fair: Propagate asynchrous deta=
ch"
>> doesn't add more loops to update_blocked_averages but it adds more thing=
 to do
>> per loop.
>>
>> Then, I think I'm still too conservative in the condition for calling
>> update_load_avg(cfs_rq->tg->se[cpu], 0). This call has been added to
>> propagate gcfs_rq->propagate_avg flag to parent so we don't need to call=
 it
>> even if load_avg is not null but only when propagate_avg flag is set. The
>> patch below should improve thing compare to the previous version because
>> it will call update_load_avg(cfs_rq->tg->se[cpu], 0) only if an asynchro=
unous
>> detach happened (propagate_avg is set).
>>
>> Ying, could you test the patch below instead of the previous one ?
>>
>> ---
>>  kernel/sched/fair.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 6559d19..a4f5c35 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -6915,6 +6915,7 @@ static void update_blocked_averages(int cpu)
>>  {
>>       struct rq *rq =3D cpu_rq(cpu);
>>       struct cfs_rq *cfs_rq;
>> +     struct sched_entity *se;
>>       unsigned long flags;
>>
>>       raw_spin_lock_irqsave(&rq->lock, flags);
>> @@ -6932,9 +6933,10 @@ static void update_blocked_averages(int cpu)
>>               if (update_cfs_rq_load_avg(cfs_rq_clock_task(cfs_rq), cfs_=
rq, true))
>>                       update_tg_load_avg(cfs_rq, 0);
>>
>> -             /* Propagate pending load changes to the parent */
>> -             if (cfs_rq->tg->se[cpu])
>> -                     update_load_avg(cfs_rq->tg->se[cpu], 0);
>> +             /* Propagate pending load changes to the parent if any */
>> +             se =3D cfs_rq->tg->se[cpu];
>> +             if (se && cfs_rq->propagate_avg)
>> +                     update_load_avg(se, 0);
>>       }
>>       raw_spin_unlock_irqrestore(&rq->lock, flags);
>>  }
>
> Here is the test result,
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/freq/kconfig/nr_task/rootfs/samples/tbox_group/=
test/testcase:
>   gcc-6/powersave/20/x86_64-rhel-7.2/100%/debian-x86_64-2016-08-31.cgz/60=
00ss/lkp-hsw-d01/cache/ftq
>
> commit:
>   4e5160766fcc9f41bbd38bac11f92dce993644aa: first bad commit
>   09a43ace1f986b003c118fdf6ddf1fd685692d49: parent of first bad commit
>   b524060933c546fd2410c5a09360ba23a0fef846: with fix patch above
>
> 4e5160766fcc9f41 09a43ace1f986b003c118fdf6d b524060933c546fd2410c5a093
> ---------------- -------------------------- --------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>       3463 =C2=B1 10%     -61.4%       1335 =C2=B1 17%      -3.0%       3=
359 =C2=B1  2%  ftq.noise.50%
>       1116 =C2=B1 23%     -73.7%     293.90 =C2=B1 30%     -23.8%     850=
.69 =C2=B1 17%  ftq.noise.75%

To be honest, I was expecting at least the same level of improvement
as the previous patch if not better but i was not expecting worse
results

>
> Best Regards,
> Huang, Ying

--===============3710131442126428254==--

