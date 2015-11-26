Content-Type: multipart/mixed; boundary="===============7837506982890946810=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: hugepage compaction causes performance drop
Date: Thu, 26 Nov 2015 13:47:24 +0800
Message-ID: <56569CEC.1050809@intel.com>
In-Reply-To: <5655AD4A.4080001@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============7837506982890946810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/25/2015 08:44 PM, Vlastimil Babka wrote:
> On 11/24/2015 09:29 AM, Joonsoo Kim wrote:
>> On Tue, Nov 24, 2015 at 03:27:43PM +0800, Aaron Lu wrote:
>>
>> Thanks.
>>
>> Okay. Output proves the theory. pagetypeinfo shows that there are
>> too many unmovable pageblocks. isolate_freepages() should skip these
>> so it's not easy to meet proper pageblock until need_resched(). Hence,
>> updating cached pfn doesn't happen. (You can see unchanged free_pfn
>> with 'grep compaction_begin tracepoint-output')
> =

> Hm to me it seems that the scanners meet a lot, so they restart at zone
> boundaries and that's fine. There's nothing to cache.
> =

>> But, I don't think that updating cached pfn is enough to solve your prob=
lem.
>> More complex change would be needed, I guess.
> =

> One factor is probably that THP only use async compaction and those don't=
 result
> in deferred compaction, which should help here. It also means that
> pageblock_skip bits are not being reset except by kswapd...
> =

> Oh and pageblock_pfn_to_page is done before checking the pageblock skip b=
its, so
> that's why it's prominent in the profiles. Although it was less prominent=
 (9% vs
> 46% before) in the last data... was perf collected while tracing, thus
> generating extra noise?

The perf is always run during these test runs, it will start 25 seconds
later after the test starts to give it some time to eat the remaining
free memory so that when perf starts collection data, the swap out should
already start. The perf data is collected for 10 seconds.

I guess the test run under trace-cmd is slower before before, so the
perf is collecting data at a different time window.

Regards,
Aaron

--===============7837506982890946810==--

