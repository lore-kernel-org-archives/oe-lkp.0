Content-Type: multipart/mixed; boundary="===============1564214626364479075=="
MIME-Version: 1.0
From: Vasily Averin <vvs@virtuozzo.com>
To: lkp@lists.01.org
Subject: Re: [memcg] 0f12156dff: will-it-scale.per_process_ops -33.6% regression
Date: Wed, 08 Sep 2021 11:13:57 +0300
Message-ID: <85da8df9-d6ae-5a06-a561-13eaf11344d7@virtuozzo.com>
In-Reply-To: <YTfAiaIbxM0CqEnj@carbon.dhcp.thefacebook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1564214626364479075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/7/21 10:42 PM, Roman Gushchin wrote:
> On Tue, Sep 07, 2021 at 10:48:06AM -0700, Shakeel Butt wrote:
>> On Tue, Sep 7, 2021 at 10:31 AM Roman Gushchin <guro@fb.com> wrote:
>>>
>>> On Tue, Sep 07, 2021 at 07:14:45AM -1000, Tejun Heo wrote:
>>>> Hello,
>>>>
>>>> On Tue, Sep 07, 2021 at 10:11:21AM -0700, Roman Gushchin wrote:
>>>>> There are two polar cases:
>>>>> 1) a big number of relatively short-living allocations, which lifetim=
e is well
>>>>>    bounded (e.g. by a lifetime of a task),
>>>>> 2) a relatively small number of long-living allocations, which lifeti=
me
>>>>>    is potentially indefinite (e.g. struct mount).
>>>>>
>>>>> We can't use the same approach for both cases, otherwise we'll run in=
to either
>>>>> performance or garbage collection problems (which also lead to perfor=
mance
>>>>> problems, but delayed).
>>>>
>>>> Wouldn't a front cache which expires after some seconds catch both cas=
es?
>>>
>>> I'm not sure. For the second case we need to pack allocations from diff=
erent
>>> tasks/cgroups into a small number of shared pages. It means the front c=
ache
>>> should be really small/non-existing. For the first case we likely need a
>>> substantial cache. Maybe we can do something really smart with scatteri=
ng
>>> the cache over multiple pages, but I really doubt.
>>
>> I think we need to prototype this to sensibly evaluate. Let me know if
>> you want to take a stab at this otherwise I can try.
> =

> If you have time and are ready to jump in, please, go on. Otherwise I can=
 start
> working on it in few weeks. In any case, I'm happy to help with discussio=
ns, code
> reviews & whatever else I can do.

(Quite looking at the dubious achievement "my upstream patch was returned p=
ersonally by Linus")
Please keep me informed about these tasks too. Unfortunately I cannot help =
right now,
however perhaps we will need to backport these patches to OpenVz kernels.  =


Thank you,
	Vasily Averin
--===============1564214626364479075==--

