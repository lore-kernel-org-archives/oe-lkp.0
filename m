Content-Type: multipart/mixed; boundary="===============7283423308178698616=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] 8212a964ee: vm-scalability.throughput 30.5% improvement
Date: Sun, 13 Mar 2022 10:28:01 +0100
Message-ID: <8f499c76-68cb-a2c3-01fd-c8759e2fd317@suse.cz>
In-Reply-To: <CANn89i+fM0k+=Qw0M0fso1f-Ya8--5+==gtcWqCpo=Gu-ca1Ow@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7283423308178698616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/13/22 00:26, Eric Dumazet wrote:
> On Sat, Mar 12, 2022 at 10:59 AM Vlastimil Babka <vbabka@suse.cz> wrote:
>>
>> On 3/12/22 16:43, kernel test robot wrote:
>>>
>>>
>>> Greeting,
>>>
>>> FYI, we noticed a 30.5% improvement of vm-scalability.throughput due to=
 commit:
>>>
>>>
>>> commit: 8212a964ee020471104e34dce7029dec33c218a9 ("Re: [PATCH v2] mm/pa=
ge_alloc: call check_new_pages() while zone spinlock is not held")
>>> url: https://github.com/0day-ci/linux/commits/Mel-Gorman/Re-PATCH-v2-mm=
-page_alloc-call-check_new_pages-while-zone-spinlock-is-not-held/20220309-2=
03504
>>> patch link: https://lore.kernel.org/lkml/20220309123245.GI15701(a)techs=
ingularity.net
>>
>> Heh, that's weird. I would expect some improvement from Eric's patch,
>> but this seems to be actually about Mel's "mm/page_alloc: check
>> high-order pages for corruption during PCP operations" applied directly
>> on 5.17-rc7 per the github url above. This was rather expected to make
>> performance worse if anything, so maybe the improvement is due to some
>> unexpected side-effect of different inlining decisions or cache alignmen=
t...
>>
> =

> I doubt this has anything to do with inlining or cache alignment.
> =

> I am not familiar with the benchmark, but its name
> (anon-w-rand-hugetlb) hints at hugetlb ?
> =

> After Mel fix, we go over 512 'struct page' to perform sanity checks,
> thus loading into cpu caches the 512 cache lines.

Ah, that's true.

> This caching is done while no lock is held.

But I don't think this is. The test was AFAICS done without your patch,
so the lock is still held in rmqueue(). And it's also held in
rmqueue_bulk() -> check_pcp_refill().

> If after this huge page allocation some mm operation needs to access
> these 512 struct pages,
> while holding a lock, then sure, there is a huge gain.

--===============7283423308178698616==--

