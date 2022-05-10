Content-Type: multipart/mixed; boundary="===============1338131491286723127=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] f26b3fa046: netperf.Throughput_Mbps -18.0% regression
Date: Tue, 10 May 2022 11:43:16 +0800
Message-ID: <c11ae803-cea7-8b7f-9992-2f640c90f104@intel.com>
In-Reply-To: <d13688d1483e9d87ec477292893f2916832b3bdc.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1338131491286723127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/7/2022 3:44 PM, ying.huang(a)intel.com wrote:
> On Sat, 2022-05-07 at 15:31 +0800, Aaron Lu wrote:

... ...

>>
>> I thought the overhead of changing the cache line from "shared" to
>> "own"/"modify" is pretty cheap.
> =

> This is the read/write pattern of cache ping-pong.  Although it should
> be cheaper than the write/write pattern of cache ping-pong in theory, we
> have gotten sevious regression for that before.
>

Can you point me to the regression report? I would like to take a look,
thanks.

>> Also, this is the same case as the Skylake desktop machine, why it is a
>> gain there but a loss here?=C2=A0
> =

> I guess the reason is the private cache size.  The size of the private
> L2 cache of SKL server is much larger than that of SKL client (1MB vs.
> 256KB).  So there's much more core-2-core traffic on SKL server.
> =


It could be. The 256KiB L2 in Skylake desktop can only store 8 order-3
pages and that means the allocator side may have a higher chance of
reusing a page that is evicted from the free cpu's L2 cache than the
server machine, whose L2 can store 40 order-3 pages.

I can do more tests using different high for the two machines:
1) high=3D0, this is the case when page reuse is the extreme. core-2-core
transfer should be the most. This is the behavior of this bisected commit.
2) high=3DL2_size, this is the case when page reuse is fewer compared to
the above case, core-2-core should still be the majority.
3) high=3D2 times of L2_size and smaller than llc size, this is the case
when cache reuse is further reduced, and when the page is indeed reused,
it shouldn't cause core-2-core transfer but can benefit from llc.
4) high>llc_size, this is the case when page reuse is the least and when
page is indeed reused, it is likely not in the entire cache hierarchy.
This is the behavior of this bisected commit's parent commit for the
Skylake desktop machine.

I expect case 3) should give us the best performance and 1) or 4) is the
worst for this testcase.

case 4) is difficult to test on the server machine due to the cap of
pcp->high which is affected by the low watermark of the zone. The server
machine has 128 cpus but only 128G memory, which makes the pcp->high
capped at 421, while llc size is 40MiB and that translates to a page
number of 12288.

>> Is it that this "overhead" is much greater
>> in server machine to the extent that it is even better to use a totally
>> cold page than a hot one?
> =

> Yes.  And I think the private cache size matters here.  And after being
> evicted from the private cache (L1/L2), the cache lines of the reused
> pages will go to shared cache (L3), that will help performance.
>

Sounds reasonable.

>> If so, it seems to suggest we should avoid
>> cache reuse in server machine unless the two CPUs happens to be two
>> hyperthreads of the same core.
> =

> Yes.  I think so.
--===============1338131491286723127==--

