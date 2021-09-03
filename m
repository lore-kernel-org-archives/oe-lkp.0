Content-Type: multipart/mixed; boundary="===============5026603224764364814=="
MIME-Version: 1.0
From: Xing, Zhengjun <zhengjun.xing@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 8cc621d2f4: fio.write_iops -21.8% regression
Date: Fri, 03 Sep 2021 15:11:33 +0800
Message-ID: <034fc860-d0d0-0c61-09d2-3c41c4f020c6@intel.com>
In-Reply-To: <5abc4469d16535119818e8e72173398d@codeaurora.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5026603224764364814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Minchan,

 =C2=A0=C2=A0=C2=A0 Do you have time to look at this? I re-test it in=C2=A0=
 v5.14, the =

regression still existed. Thanks.

On 5/26/2021 12:57 AM, Chris Goldsworthy wrote:
> On 2021-05-25 09:39, Minchan Kim wrote:
>> On Tue, May 25, 2021 at 08:16:03AM -0700, Minchan Kim wrote:
>>
>> < snip >
>>
>>> > > On Thu, May 20, 2021 at 04:31:44PM +0800, kernel test robot wrote:
>>> > > >
>>> > > >
>>> > > > Greeting,
>>> > > >
>>> > > > FYI, we noticed a -21.8% regression of fio.write_iops due to =

>>> commit:
>>> > > >
>>> > > >
>>> > > > commit: 8cc621d2f45ddd3dc664024a647ee7adf48d79a5 ("mm: fs:
>>> > > > invalidate BH LRU during page migration")
>>> > > > =

>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>> > > >
>>> > > >
>>> > > > in testcase: fio-basic
>>> > > > on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold =

>>> 6252 CPU
>>> > > > @ 2.10GHz with 256G memory
>>> > > > with following parameters:
>>> > > >
>>> > > >=C2=A0=C2=A0=C2=A0=C2=A0 disk: 2pmem
>>> > > >=C2=A0=C2=A0=C2=A0=C2=A0 fs: ext4
>>> > > >=C2=A0=C2=A0=C2=A0=C2=A0 runtime: 200s
>>> > > >=C2=A0=C2=A0=C2=A0=C2=A0 nr_task: 50%
>>> > > >=C2=A0=C2=A0=C2=A0=C2=A0 time_based: tb
>>> > > >=C2=A0=C2=A0=C2=A0=C2=A0 rw: randwrite
>>> > > >=C2=A0=C2=A0=C2=A0=C2=A0 bs: 4k
>>> > > >=C2=A0=C2=A0=C2=A0=C2=A0 ioengine: libaio
>>> > > >=C2=A0=C2=A0=C2=A0=C2=A0 test_size: 200G
>>> > > >=C2=A0=C2=A0=C2=A0=C2=A0 cpufreq_governor: performance
>>> > > >=C2=A0=C2=A0=C2=A0=C2=A0 ucode: 0x5003006
>>> > > >
>>> > > > test-description: Fio is a tool that will spawn a number of =

>>> threads
>>> > > > or processes doing a particular type of I/O action as =

>>> specified by
>>> > > > the user.
>>> > > > test-url: https://github.com/axboe/fio
>>> > > >
>>> > > >
>>> > > >
>>> > > > If you fix the issue, kindly add following tag
>>> > > > Reported-by: kernel test robot <oliver.sang@intel.com>
>>> > > >
>>> > > >
>>> > > > Details are as below:
>>> > > > =

>>> -----------------------------------------------------------------------=
--------------------------->
>>> > > >
>>> > > >
>>> > > > To reproduce:
>>> > > >
>>> > > >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https:/=
/github.com/intel/lkp-tests.git
>>> > > >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
>>> > > >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp install j=
ob.yaml=C2=A0 # job file is
>>> > > > attached in this email
>>> > > >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp split-job=
 --compatible job.yaml=C2=A0 # generate =

>>> the yaml
>>> > > > file for lkp run
>>> > > >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp run gener=
ated-yaml-file
>>> > >
>>> > > Hi,
>>> > >
>>> > > I tried to insall the lkp-test in my machine by following above =

>>> guide
>>> > > but failed
>>> > > due to package problems(I guess it's my problem since I use =

>>> something
>>> > > particular
>>> > > environement). However, I guess it comes from increased miss =

>>> ratio of
>>> > > bh_lrus
>>> > > since the patch caused more frequent invalidation of the bh_lrus =

>>> calls
>>> > > compared
>>> > > to old. For example, lru_add_drain could be called from several hot
>>> > > places(e.g.,
>>> > > unmap and pagevec_release from several path) and it could keeps
>>> > > invalidating
>>> > > bh_lrus.
>>> > >
>>> > > IMO, we should move the overhead from such hot path to cold one. =

>>> How
>>> > > about this?
>>> > >
>>> > > From ebf4ede1cf32fb14d85f0015a3693cb8e1b8dbfe Mon Sep 17 =

>>> 00:00:00 2001
>>> > > From: Minchan Kim <minchan@kernel.org>
>>> > > Date: Thu, 20 May 2021 11:17:56 -0700
>>> > > Subject: [PATCH] invalidate bh_lrus only at lru_add_drain_all
>>> > >
>>> > > Not-Yet-Signed-off-by: Minchan Kim <minchan@kernel.org>
>>> > > ---
>>> > >=C2=A0 mm/swap.c | 15 +++++++++++++--
>>> > >=C2=A0 1 file changed, 13 insertions(+), 2 deletions(-)
>>> > >
>>> > > diff --git a/mm/swap.c b/mm/swap.c
>>> > > index dfb48cf9c2c9..d6168449e28c 100644
>>> > > --- a/mm/swap.c
>>> > > +++ b/mm/swap.c
>>> > > @@ -642,7 +642,6 @@ void lru_add_drain_cpu(int cpu)
>>> > >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pagevec_lru_m=
ove_fn(pvec, lru_lazyfree_fn);
>>> > >
>>> > >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 activate_page_drain(cpu);
>>> > > -=C2=A0=C2=A0=C2=A0 invalidate_bh_lrus_cpu(cpu);
>>> > >=C2=A0 }
>>> > >
>>> > >=C2=A0 /**
>>> > > @@ -725,6 +724,17 @@ void lru_add_drain(void)
>>> > >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local_unlock(&lru_pvecs.lock);
>>> > >=C2=A0 }
>>> > >
>>> > > +void lru_and_bh_lrus_drain(void)
>>> > > +{
>>> > > +=C2=A0=C2=A0=C2=A0 int cpu;
>>> > > +
>>> > > +=C2=A0=C2=A0=C2=A0 local_lock(&lru_pvecs.lock);
>>> > > +=C2=A0=C2=A0=C2=A0 cpu =3D smp_processor_id();
>>> > > +=C2=A0=C2=A0=C2=A0 lru_add_drain_cpu(cpu);
>>> > > +=C2=A0=C2=A0=C2=A0 local_unlock(&lru_pvecs.lock);
>>> > > +=C2=A0=C2=A0=C2=A0 invalidate_bh_lrus_cpu(cpu);
>>> > > +}
>>> > > +
>>> >
>>> > Nit: drop int cpu?
>>>
>>> Do you mean to suggest using smp_processor_id at both places
>>> instead of local varaible? Since the invalidate_bh_lrus_cpu
>>> is called out of the lru_pvecs.lock, I wanted to express
>>> the draining happens at the same CPU via storing the CPU.
>>>
>>> >
>>> > >=C2=A0 void lru_add_drain_cpu_zone(struct zone *zone)
>>> > >=C2=A0 {
>>> > >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local_lock(&lru_pvecs.lock);
>>> > > @@ -739,7 +749,7 @@ static DEFINE_PER_CPU(struct work_struct,
>>> > > lru_add_drain_work);
>>> > >
>>> > >=C2=A0 static void lru_add_drain_per_cpu(struct work_struct *dummy)
>>> > >=C2=A0 {
>>> > > -=C2=A0=C2=A0=C2=A0 lru_add_drain();
>>> > > +=C2=A0=C2=A0=C2=A0 lru_and_bh_lrus_drain();
>>> > >=C2=A0 }
>>> > >
>>> > >=C2=A0 /*
>>> > > @@ -881,6 +891,7 @@ void lru_cache_disable(void)
>>> > >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __lru_add_drain_all(true);
>>> > >=C2=A0 #else
>>> > >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lru_add_drain();
>>> > > +=C2=A0=C2=A0=C2=A0 invalidate_bh_lrus_cpu(smp_processor_id());
>>> > >=C2=A0 #endif
>>> > >=C2=A0 }
>>> >
>>> > Can't we replace the call to lru_add_drain() and
>>> > invalidate_bh_lrus_cpu(smp_processor_id()) with a single call to
>>> > lru_and_bh_lrus_drain()?
>>>
>>> Good idea.
>>
>> From 8caadeb49d82403a08643dfbdb0b7749017c00bb Mon Sep 17 00:00:00 2001
>> From: Minchan Kim <minchan@kernel.org>
>> Date: Tue, 25 May 2021 08:19:17 -0700
>> Subject: [PATCH] mm: fs: invalidate bh_lrus for only cold path
>>
>> kernel test robot reported the regression of fio.write_iops[1]
>> with [2].
>>
>> Since lru_add_drain is called frequently, invalidate bh_lrus
>> there could increase bh_lrus cache miss ratio, which needs
>> more IO in the end.
>>
>> This patch moves the bh_lrus invalidation from the hot path(
>> e.g., zap_page_range, pagevec_release) to cold path(i.e.,
>> lru_add_drain_all, lru_cache_disable).
>>
>> [1] =

>> https://lore.kernel.org/lkml/20210520083144.GD14190(a)xsang-OptiPlex-902=
0/
>> [2] 8cc621d2f45d, mm: fs: invalidate BH LRU during page migration
>> Cc: Xing, Zhengjun <zhengjun.xing@intel.com>
>> Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
>> Reported-by: kernel test robot <oliver.sang@intel.com>
>> Signed-off-by: Minchan Kim <minchan@kernel.org>
>> ---
>> =C2=A0mm/swap.c | 16 +++++++++++++---
>> =C2=A01 file changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/mm/swap.c b/mm/swap.c
>> index 1958d5feb148..3e25d99a9dbb 100644
>> --- a/mm/swap.c
>> +++ b/mm/swap.c
>> @@ -642,7 +642,6 @@ void lru_add_drain_cpu(int cpu)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pagevec_lru_move_fn(pve=
c, lru_lazyfree_fn);
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 activate_page_drain(cpu);
>> -=C2=A0=C2=A0=C2=A0 invalidate_bh_lrus_cpu(cpu);
>> =C2=A0}
>>
>> =C2=A0/**
>> @@ -725,6 +724,17 @@ void lru_add_drain(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0 local_unlock(&lru_pvecs.lock);
>> =C2=A0}
>>
>> +static void lru_add_and_bh_lrus_drain(void)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int cpu;
>> +
>> +=C2=A0=C2=A0=C2=A0 local_lock(&lru_pvecs.lock);
>> +=C2=A0=C2=A0=C2=A0 cpu =3D smp_processor_id();
>> +=C2=A0=C2=A0=C2=A0 lru_add_drain_cpu(cpu);
>> +=C2=A0=C2=A0=C2=A0 local_unlock(&lru_pvecs.lock);
>> +=C2=A0=C2=A0=C2=A0 invalidate_bh_lrus_cpu(cpu);
>> +}
>> +
>> =C2=A0void lru_add_drain_cpu_zone(struct zone *zone)
>> =C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0 local_lock(&lru_pvecs.lock);
>> @@ -739,7 +749,7 @@ static DEFINE_PER_CPU(struct work_struct,
>> lru_add_drain_work);
>>
>> =C2=A0static void lru_add_drain_per_cpu(struct work_struct *dummy)
>> =C2=A0{
>> -=C2=A0=C2=A0=C2=A0 lru_add_drain();
>> +=C2=A0=C2=A0=C2=A0 lru_add_and_bh_lrus_drain();
>> =C2=A0}
>>
>> =C2=A0/*
>> @@ -880,7 +890,7 @@ void lru_cache_disable(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0 __lru_add_drain_all(true);
>> =C2=A0#else
>> -=C2=A0=C2=A0=C2=A0 lru_add_drain();
>> +=C2=A0=C2=A0=C2=A0 lru_add_and_bh_lrus_drain();
>> =C2=A0#endif
>> =C2=A0}
>
> Feel free to add:
> Reviewed-by: Chris Goldsworthy <cgoldswo@codeaurora.org>
>

-- =

Zhengjun Xing

--===============5026603224764364814==--

