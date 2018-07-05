Content-Type: multipart/mixed; boundary="===============4181760881210974747=="
MIME-Version: 1.0
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/fair] fbd5188493: WARNING:inconsistent_lock_state
Date: Thu, 05 Jul 2018 16:59:02 +0200
Message-ID: <42d319f5-1a3a-fb69-5ec5-d2e9836e49c9@arm.com>
In-Reply-To: <20180705132458.GA3864@codeblueprint.co.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============4181760881210974747==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/05/2018 03:24 PM, Matt Fleming wrote:
> On Thu, 05 Jul, at 11:52:21AM, Dietmar Eggemann wrote:
>>
>> Moving the code from _nohz_idle_balance to nohz_idle_balance let it disa=
ppear:
>>
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 02be51c9dcc1..070924f07c68 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -9596,16 +9596,6 @@ static bool _nohz_idle_balance(struct rq *this_rq=
, unsigned int flags,
>>           */
>>          smp_mb();
>>   =

>> -       /*
>> -        * Ensure this_rq's clock and load are up-to-date before we
>> -        * rebalance since it's possible that they haven't been
>> -        * updated for multiple schedule periods, i.e. many seconds.
>> -        */
>> -       raw_spin_lock_irq(&this_rq->lock);
>> -       update_rq_clock(this_rq);
>> -       cpu_load_update_idle(this_rq);
>> -       raw_spin_unlock_irq(&this_rq->lock);
>> -
>>          for_each_cpu(balance_cpu, nohz.idle_cpus_mask) {
>>                  if (balance_cpu =3D=3D this_cpu || !idle_cpu(balance_cp=
u))
>>                          continue;
>> @@ -9701,6 +9691,16 @@ static bool nohz_idle_balance(struct rq *this_rq,=
 enum cpu_idle_type idle)
>>          if (!(flags & NOHZ_KICK_MASK))
>>                  return false;
>>   =

>> +       /*
>> +        * Ensure this_rq's clock and load are up-to-date before we
>> +        * rebalance since it's possible that they haven't been
>> +        * updated for multiple schedule periods, i.e. many seconds.
>> +        */
>> +       raw_spin_lock_irq(&this_rq->lock);
>> +       update_rq_clock(this_rq);
>> +       cpu_load_update_idle(this_rq);
>> +       raw_spin_unlock_irq(&this_rq->lock);
>> +
>>          _nohz_idle_balance(this_rq, flags, idle);
>>   =

>>          return true;
>>
> =

> Hmm.. it still looks to me like we should be saving and restoring IRQs
> since this can be called from IRQ context, no?

You mean in nohz_idle_balance()? Yes.

I just wanted to hint that since you need this cpu_load_update_idle() in =

the nohz idle balance case and not in idle balance, you could just =

update it in nohz_idle_balance() rather than in _nohz_idle_balance() =

(which is also called in nohz_newidle_balance()) avoiding this =

inconsistent lock state warning.

[...]

--===============4181760881210974747==--

