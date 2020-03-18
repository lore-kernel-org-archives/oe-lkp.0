Content-Type: multipart/mixed; boundary="===============7026033913498754573=="
MIME-Version: 1.0
From: yangerkun <yangerkun@huawei.com>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Wed, 18 Mar 2020 09:09:13 +0800
Message-ID: <79d65a56-5281-502f-8d8f-568e082cacf4@huawei.com>
In-Reply-To: <61d6b91e9387969f5dfaba192aee366cc9b310f0.camel@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7026033913498754573==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2020/3/18 0:07, Jeff Layton wrote:
> On Tue, 2020-03-17 at 22:05 +0800, yangerkun wrote:
>>
>> On 2020/3/17 9:41, yangerkun wrote:
>>>
>>> On 2020/3/17 1:26, Linus Torvalds wrote:
>>>> On Mon, Mar 16, 2020 at 4:07 AM Jeff Layton <jlayton@kernel.org> wro=
te:
>>>>>
>>>>> +       /*
>>>>> +        * If fl_blocker is NULL, it won't be set again as this
>>>>> thread "owns"
>>>>> +        * the lock and is the only one that might try to claim the
>>>>> lock.
>>>>> +        * Because fl_blocker is explicitly set last during a delete,
>>>>> it's
>>>>> +        * safe to locklessly test to see if it's NULL. If it is,
>>>>> then we know
>>>>> +        * that no new locks can be inserted into its
>>>>> fl_blocked_requests list,
>>>>> +        * and we can therefore avoid doing anything further as long
>>>>> as that
>>>>> +        * list is empty.
>>>>> +        */
>>>>> +       if (!smp_load_acquire(&waiter->fl_blocker) &&
>>>>> +           list_empty(&waiter->fl_blocked_requests))
>>>>> +               return status;
>>>>
>>>> Ack. This looks sane to me now.
>>>>
>>>> yangerkun - how did you find the original problem?\
>>>
>>> While try to fix CVE-2019-19769, add some log in __locks_wake_up_blocks
>>> help me to rebuild the problem soon. This help me to discern the problem
>>> soon.
>>>
>>>> Would you mind using whatever stress test that caused commit
>>>> 6d390e4b5d48 ("locks: fix a potential use-after-free problem when
>>>> wakeup a waiter") with this patch? And if you did it analytically,
>>>> you're a champ and should look at this patch too!
>>>
>>> I will try to understand this patch, and if it's looks good to me, will
>>> do the performance test!
>>
>> This patch looks good to me, with this patch, the bug '6d390e4b5d48
>> ("locks: fix a potential use-after-free problem when wakeup a waiter")'
>> describes won't happen again. Actually, I find that syzkaller has report
>> this bug before[1], and the log of it can help us to reproduce it with
>> some latency in __locks_wake_up_blocks!
>>
>> Also, some ltp testcases describes in [2] pass too with the patch!
>>
>> For performance test, I have try to understand will-it-scale/lkp, but it
>> seem a little complex to me, and may need some more time. So, Rong Chen,
>> can you help to do this? Or the results may come a little later...
>>
>> Thanks,
>> ----
>> [1] https://syzkaller.appspot.com/bug?extid=3D922689db06e57b69c240
>> [2] https://lkml.org/lkml/2020/3/11/578
> =

> Thanks yangerkun. Let me know if you want to add your Reviewed-by tag.

Yeah, you can add:

Reviewed-by: yangerkun <yangerkun@huawei.com>

> =

> Cheers,
>=20

--===============7026033913498754573==--

