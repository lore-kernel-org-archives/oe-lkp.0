Content-Type: multipart/mixed; boundary="===============2590400696171665523=="
MIME-Version: 1.0
From: yangerkun <yangerkun@huawei.com>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Tue, 17 Mar 2020 09:41:27 +0800
Message-ID: <7c8d3752-6573-ab83-d0af-f3dd4fc373f5@huawei.com>
In-Reply-To: <CAHk-=whnqDS0NJtAaArVeYQz3hcU=4Ja3auB1Jvs42eADfUgMQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2590400696171665523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2020/3/17 1:26, Linus Torvalds wrote:
> On Mon, Mar 16, 2020 at 4:07 AM Jeff Layton <jlayton@kernel.org> wrote:
>>
>>
>> +       /*
>> +        * If fl_blocker is NULL, it won't be set again as this thread "=
owns"
>> +        * the lock and is the only one that might try to claim the lock.
>> +        * Because fl_blocker is explicitly set last during a delete, it=
's
>> +        * safe to locklessly test to see if it's NULL. If it is, then w=
e know
>> +        * that no new locks can be inserted into its fl_blocked_request=
s list,
>> +        * and we can therefore avoid doing anything further as long as =
that
>> +        * list is empty.
>> +        */
>> +       if (!smp_load_acquire(&waiter->fl_blocker) &&
>> +           list_empty(&waiter->fl_blocked_requests))
>> +               return status;
> =

> Ack. This looks sane to me now.
> =

> yangerkun - how did you find the original problem?\

While try to fix CVE-2019-19769, add some log in __locks_wake_up_blocks =

help me to rebuild the problem soon. This help me to discern the problem =

soon.

> =

> Would you mind using whatever stress test that caused commit
> 6d390e4b5d48 ("locks: fix a potential use-after-free problem when
> wakeup a waiter") with this patch? And if you did it analytically,
> you're a champ and should look at this patch too!

I will try to understand this patch, and if it's looks good to me, will =

do the performance test!

Thanks

--===============2590400696171665523==--

