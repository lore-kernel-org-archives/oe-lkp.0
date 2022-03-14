Content-Type: multipart/mixed; boundary="===============2023047030637207276=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] 8212a964ee: vm-scalability.throughput 30.5% improvement
Date: Mon, 14 Mar 2022 10:09:10 +0100
Message-ID: <b3575a73-384c-e0da-1db9-bad2aec053c4@suse.cz>
In-Reply-To: <CANn89iJwBe4+C8KP--c_9O6QE_Tou+1Z0+ugtuniG-06nzxPmg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2023047030637207276==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/13/22 22:10, Eric Dumazet wrote:
> On Sun, Mar 13, 2022 at 1:29 AM Vlastimil Babka <vbabka@suse.cz> wrote:
>>
>> On 3/13/22 00:26, Eric Dumazet wrote:
>> > On Sat, Mar 12, 2022 at 10:59 AM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>> >>
>> >> On 3/12/22 16:43, kernel test robot wrote:
>> >>>
>> >>>
>> >>> Greeting,
>> >>>
>> >>> FYI, we noticed a 30.5% improvement of vm-scalability.throughput due=
 to commit:
>> >>>
>> >>>
>> >>> commit: 8212a964ee020471104e34dce7029dec33c218a9 ("Re: [PATCH v2] mm=
/page_alloc: call check_new_pages() while zone spinlock is not held")
>> >>> url: https://github.com/0day-ci/linux/commits/Mel-Gorman/Re-PATCH-v2=
-mm-page_alloc-call-check_new_pages-while-zone-spinlock-is-not-held/2022030=
9-203504
>> >>> patch link: https://lore.kernel.org/lkml/20220309123245.GI15701(a)te=
chsingularity.net
>> >>
>> >> Heh, that's weird. I would expect some improvement from Eric's patch,
>> >> but this seems to be actually about Mel's "mm/page_alloc: check
>> >> high-order pages for corruption during PCP operations" applied direct=
ly
>> >> on 5.17-rc7 per the github url above. This was rather expected to make
>> >> performance worse if anything, so maybe the improvement is due to some
>> >> unexpected side-effect of different inlining decisions or cache align=
ment...
>> >>
>> >
>> > I doubt this has anything to do with inlining or cache alignment.
>> >
>> > I am not familiar with the benchmark, but its name
>> > (anon-w-rand-hugetlb) hints at hugetlb ?
>> >
>> > After Mel fix, we go over 512 'struct page' to perform sanity checks,
>> > thus loading into cpu caches the 512 cache lines.
>>
>> Ah, that's true.
>>
>> > This caching is done while no lock is held.
>>
>> But I don't think this is. The test was AFAICS done without your patch,
>> so the lock is still held in rmqueue(). And it's also held in
>> rmqueue_bulk() -> check_pcp_refill().
> =

> Note that Mel patch  touches both check_pcp_refill() and check_new_pcp()
> =

> __rmqueue_pcplist() definitely calls check_new_pcp() while the zone
> spinlock is _not_ held.

Yes, but the checking from check_new_pcp() is active only with
CONFIG_DEBUG_VM or enabled debug_pagealloc, which were both disabled in the
robot's report.

> Note that it is possible to defer calls to check_pcp_refill after the
> spinlock is released.
> =

> Untested patch:

I'll check the latest posting.
--===============2023047030637207276==--

