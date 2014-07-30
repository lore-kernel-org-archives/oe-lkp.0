Content-Type: multipart/mixed; boundary="===============1177678031469549009=="
MIME-Version: 1.0
From: Rik van Riel <riel@redhat.com>
To: lkp@lists.01.org
Subject: Re: [sched/numa] a43455a1d57: +94.1% proc-vmstat.numa_hint_faults_local
Date: Wed, 30 Jul 2014 10:25:03 -0400
Message-ID: <53D9003F.3050900@redhat.com>
In-Reply-To: <20140730021425.GA25023@aaronlu.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1177678031469549009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/29/2014 10:14 PM, Aaron Lu wrote:
> On Tue, Jul 29, 2014 at 04:04:37PM -0400, Rik van Riel wrote:
>> On Tue, 29 Jul 2014 10:17:12 +0200
>> Peter Zijlstra <peterz@infradead.org> wrote:
>>
>>>> +#define NUMA_SCALE 1000
>>>> +#define NUMA_MOVE_THRESH 50
>>>
>>> Please make that 1024, there's no reason not to use power of two here.
>>> This base 10 factor thing annoyed me no end already, its time for it to
>>> die.
>>
>> That's easy enough.  However, it would be good to know whether
>> this actually helps with the regression Aaron found :)
> =

> Sorry for the delay.
> =

> I applied the last patch and queued the hackbench job to the ivb42 test
> machine for it to run 5 times, and here is the result(regarding the
> proc-vmstat.numa_hint_faults_local field):
> 173565
> 201262
> 192317
> 198342
> 198595
> avg:
> 192816
> =

> It seems it is still very big than previous kernels.

It looks like a step in the right direction, though.

Could you try running with a larger threshold?

>> +++ b/kernel/sched/fair.c
>> @@ -924,10 +924,12 @@ static inline unsigned long group_faults_cpu(struc=
t numa_group *group, int nid)
>>  =

>>  /*
>>   * These return the fraction of accesses done by a particular task, or
>> - * task group, on a particular numa node.  The group weight is given a
>> - * larger multiplier, in order to group tasks together that are almost
>> - * evenly spread out between numa nodes.
>> + * task group, on a particular numa node.  The NUMA move threshold
>> + * prevents task moves with marginal improvement, and is set to 5%.
>>   */
>> +#define NUMA_SCALE 1024
>> +#define NUMA_MOVE_THRESH (5 * NUMA_SCALE / 100)

It would be good to see if changing NUMA_MOVE_THRESH to
(NUMA_SCALE / 8) does the trick.

I will run the same thing here with SPECjbb2005.


--===============1177678031469549009==--

