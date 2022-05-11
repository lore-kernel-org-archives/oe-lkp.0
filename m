Content-Type: multipart/mixed; boundary="===============1550699989348431263=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] f26b3fa046: netperf.Throughput_Mbps -18.0% regression
Date: Wed, 11 May 2022 15:53:34 +0800
Message-ID: <7a08a1d2-27f3-ae03-5ed8-91ddae2730dc@intel.com>
In-Reply-To: <4e9d67b4d2ed8b4851a93b2a79a04e860d1f36b9.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1550699989348431263==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/11/2022 3:32 PM, ying.huang(a)intel.com wrote:
> On Wed, 2022-05-11 at 11:40 +0800, Aaron Lu wrote:
>> On Tue, May 10, 2022 at 02:23:28PM +0800, ying.huang(a)intel.com wrote:
>>> On Tue, 2022-05-10 at 11:43 +0800, Aaron Lu wrote:
>>>> On 5/7/2022 3:44 PM, ying.huang(a)intel.com wrote:
>>>>> On Sat, 2022-05-07 at 15:31 +0800, Aaron Lu wrote:
>>>>
>>>> ... ...
>>>>
>>>>>>
>>>>>> I thought the overhead of changing the cache line from "shared" to
>>>>>> "own"/"modify" is pretty cheap.
>>>>>
>>>>> This is the read/write pattern of cache ping-pong.  Although it should
>>>>> be cheaper than the write/write pattern of cache ping-pong in theory,=
 we
>>>>> have gotten sevious regression for that before.
>>>>>
>>>>
>>>> Can you point me to the regression report? I would like to take a look,
>>>> thanks.
>>>
>>> Sure.
>>>
>>> https://lore.kernel.org/all/1425108604.10337.84.camel(a)linux.intel.com/
>>>
>>>>>> Also, this is the same case as the Skylake desktop machine, why it i=
s a
>>>>>> gain there but a loss here?=C2=A0
>>>>>
>>>>> I guess the reason is the private cache size.  The size of the private
>>>>> L2 cache of SKL server is much larger than that of SKL client (1MB vs.
>>>>> 256KB).  So there's much more core-2-core traffic on SKL server.
>>>>>
>>>>
>>>> It could be. The 256KiB L2 in Skylake desktop can only store 8 order-3
>>>> pages and that means the allocator side may have a higher chance of
>>>> reusing a page that is evicted from the free cpu's L2 cache than the
>>>> server machine, whose L2 can store 40 order-3 pages.
>>>>
>>>> I can do more tests using different high for the two machines:
>>>> 1) high=3D0, this is the case when page reuse is the extreme. core-2-c=
ore
>>>> transfer should be the most. This is the behavior of this bisected com=
mit.
>>>> 2) high=3DL2_size, this is the case when page reuse is fewer compared =
to
>>>> the above case, core-2-core should still be the majority.
>>>> 3) high=3D2 times of L2_size and smaller than llc size, this is the ca=
se
>>>> when cache reuse is further reduced, and when the page is indeed reuse=
d,
>>>> it shouldn't cause core-2-core transfer but can benefit from llc.
>>>> 4) high>llc_size, this is the case when page reuse is the least and wh=
en
>>>> page is indeed reused, it is likely not in the entire cache hierarchy.
>>>> This is the behavior of this bisected commit's parent commit for the
>>>> Skylake desktop machine.
>>>>
>>>> I expect case 3) should give us the best performance and 1) or 4) is t=
he
>>>> worst for this testcase.
>>>>
>>>> case 4) is difficult to test on the server machine due to the cap of
>>>> pcp->high which is affected by the low watermark of the zone. The serv=
er
>>>> machine has 128 cpus but only 128G memory, which makes the pcp->high
>>>> capped at 421, while llc size is 40MiB and that translates to a page
>>>> number of 12288.
>>>>>
>>>
>>> Sounds good to me.
>>
>> I've run the tests on a 2 sockets Icelake server and a Skylake desktop.
>>
>> On this 2 sockets Icelake server(1.25MiB L2 =3D 320 pages, 48MiB LLC =3D
>> 12288 pages):
>>
>> pcp->high      score
>> =C2=A0=C2=A0=C2=A0=C2=A00          100662 (bypass PCP, most page resue, =
most core-2-core transfer)
>> =C2=A0=C2=A0320(L2)      117252
>> =C2=A0=C2=A0640          133149
>> =C2=A06144(1/2 llc) 134674
>> 12416(>llc)    103193 (least page reuse)
>>
>> Setting pcp->high to 640(2 times L2 size) gives very good result, only
>> slightly lower than 6144(1/2 llc size). Bypassing PCP to get the most
>> cache reuse didn't deliver good performance, so I think Ying is right:
>> core-2-core really hurts.
>>
>> On this 4core/8cpu Skylake desktop(256KiB L2 =3D 64 pages, 8MiB LLC =3D =
2048
>> pages):
>>
>> =C2=A0=C2=A0=C2=A00           86780 (bypass PCP, most page reuse, most c=
ore-2-core transfer)
>> =C2=A0=C2=A064(L2)       85813
>> =C2=A0128           85521
>> 1024(1/2 llc)  85557
>> 2176(> llc)    74458 (least page reuse)
>>
>> Things are different on this small machine. Bypassing PCP gives the best
>> performance. I find it hard to explain this. Maybe the 256KiB is too
>> small that even bypassing PCP, the page still ends up being evicted from
>> L2 when allocator side reuses it? Or maybe core-2-core transfer is
>> fast on this small machine?
> =

> 86780 / 85813 =3D 1.011
> =

> So, there's almost no measurable difference among the configurations
> except the last one.  I would rather say the test isn't sensitive to L2
> size, but sensitive to LLC size on this machine.
>

Well, if core-2-core transfer is bad for performance, I expect the
performance number of pcp->high=3D0 to be worse than pcp->high=3D64 and
pcp->high=3D128, not as good or even better, that's what I find hard to
explain.

As for performance number being bad when pcp->high > llc, that's
understandable because there is least page/cache reuse and this is the
same for both the desktop machine and that server machine.
--===============1550699989348431263==--

