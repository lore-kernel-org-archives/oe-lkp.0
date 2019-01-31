Content-Type: multipart/mixed; boundary="===============5170840881249520199=="
MIME-Version: 1.0
From: Waiman Long <longman@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm] 9bc8039e71: will-it-scale.per_thread_ops -64.1% regression
Date: Wed, 30 Jan 2019 21:54:15 -0500
Message-ID: <02602a13-e6f1-dfc1-48b6-1cb14bd9dfd0@redhat.com>
In-Reply-To: <907779d2-09a8-47fb-4d77-c907cd716b3c@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5170840881249520199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 01/30/2019 07:06 PM, Tim Chen wrote:
> On 12/27/18 6:55 PM, Waiman Long wrote:
>> On 12/27/2018 08:31 PM, Wang, Kemi wrote:
>>> Hi, Waiman
>>>    Did you post that patch? Let's see if it helps.
>> I did post the patch a while ago. I will need to rebase it to a new
>> baseline. Will do that in a week or 2.
>>
>> -Longman
>>
> Waiman,
>
> In a large scale OLTP benchmark, we are also seeing a 1% loss in performa=
nce
> from patch 9bc8039e71. We'll be interested to try out your patch to
> restore some optimistic spinning on reader held sem.
>
> Thanks.
>
> Tim

I am reworking the rwsem code and reader-optimistic spinning code isn't
ready with the reworked code yet. I need a bit more time to work on that
and certainly keep you posted once it is ready for review.

Cheers,
Longman


--===============5170840881249520199==--

