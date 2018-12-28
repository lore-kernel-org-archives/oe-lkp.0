Content-Type: multipart/mixed; boundary="===============9148218954546907122=="
MIME-Version: 1.0
From: kemi <kemi.wang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 9bc8039e71: will-it-scale.per_thread_ops -64.1% regression
Date: Fri, 28 Dec 2018 10:55:05 +0800
Message-ID: <8963c923-ef98-6752-6670-b9193267ca01@intel.com>
In-Reply-To: <9a6fdc15-4ce1-9c55-d660-a9825b9ae104@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9148218954546907122==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2018/12/28 =E4=B8=8A=E5=8D=8810:55, Waiman Long wrote:
> On 12/27/2018 08:31 PM, Wang, Kemi wrote:
>> Hi, Waiman
>>    Did you post that patch? Let's see if it helps.
> =

> I did post the patch a while ago. I will need to rebase it to a new
> baseline. Will do that in a week or 2.
> =


OK=EF=BC=8EI=E3=80=80will take a look at it and try to rebase it on shi's p=
atch to see if =

the regression can be fixed.
May I know where I can get that patch, I didn't find it in my inbox. Thanks

> -Longman
> =

>>
>> -----Original Message-----
>> From: LKP [mailto:lkp-bounces(a)lists.01.org] On Behalf Of Waiman Long
>> Sent: Tuesday, November 6, 2018 6:40 AM
>> To: Linus Torvalds <torvalds@linux-foundation.org>; vbabka(a)suse.cz; =
Davidlohr Bueso <dave@stgolabs.net>
>> Cc: yang.shi(a)linux.alibaba.com; Linux Kernel Mailing List <linux-kerne=
l@vger.kernel.org>; Matthew Wilcox <willy@infradead.org>; mhocko(a)kern=
el.org; Colin King <colin.king@canonical.com>; Andrew Morton <akpm@linu=
x-foundation.org>; ldufour(a)linux.vnet.ibm.com; lkp(a)01.org; kirill.shute=
mov(a)linux.intel.com
>> Subject: Re: [LKP] [mm] 9bc8039e71: will-it-scale.per_thread_ops -64.1% =
regression
>>
>> On 11/05/2018 05:14 PM, Linus Torvalds wrote:
>>> On Mon, Nov 5, 2018 at 12:12 PM Vlastimil Babka <vbabka@suse.cz> wrot=
e:
>>>> I didn't spot an obvious mistake in the patch itself, so it looks
>>>> like some bad interaction between scheduler and the mmap downgrade?
>>> I'm thinking it's RWSEM_SPIN_ON_OWNER that ends up being confused by
>>> the downgrade.
>>>
>>> It looks like the benchmark used to be basically CPU-bound, at about
>>> 800% CPU, and now it's somewhere in the 200% CPU region:
>>>
>>>                   will-it-scale.time.percent_of_cpu_this_job_got
>>>
>>>   800 +-+--------------------------------------------------------------=
-----+
>>>       |.+.+.+.+.+.+.+.  .+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+..+.+.+.+. .+=
.+.+.|
>>>   700 +-+             +.                                            +  =
     |
>>>       |                                                                =
     |
>>>   600 +-+                                                              =
     |
>>>       |                                                                =
     |
>>>   500 +-+                                                              =
     |
>>>       |                                                                =
     |
>>>   400 +-+                                                              =
     |
>>>       |                                                                =
     |
>>>   300 +-+                                                              =
     |
>>>       |                                                                =
     |
>>>   200 O-O O O O O                O                                     =
     |
>>>       |           O O O  O O O O   O O O O O O O O O O O               =
     |
>>>   100 +-+--------------------------------------------------------------=
-----+
>>>
>>> which sounds like the downgrade really messes with the "spin waiting
>>> for lock" logic.
>>>
>>> I'm thinking it's the "wake up waiter" logic that has some bad
>>> interaction with spinning, and breaks that whole optimization.
>>>
>>> Adding Waiman and Davidlohr to the participants, because they seem to
>>> be the obvious experts in this area.
>>>
>>>                             Linus
>> Optimistic spinning on rwsem is done only on writers spinning on a
>> writer-owned rwsem. If a write-lock is downgraded to a read-lock, all
>> the spinning waiters will quit. That may explain the drop in cpu
>> utilization. I do have a old patch that enable a certain amount of
>> reader spinning which may help the situation. I can rebase that and send
>> it out for review if people have interest.
>>
>> Cheers,
>> Longman
>>
>>
>> _______________________________________________
>> LKP mailing list
>> LKP(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/lkp
> =

>=20

--===============9148218954546907122==--

