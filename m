Content-Type: multipart/mixed; boundary="===============0112874223646285393=="
MIME-Version: 1.0
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
To: lkp@lists.01.org
Subject: Re: [ata] 0568e61225: stress-ng.copy-file.ops_per_sec -15.0% regression
Date: Sat, 20 Aug 2022 09:36:44 -0700
Message-ID: <05b55329-6e55-c3ff-0c41-5254a5625473@opensource.wdc.com>
In-Reply-To: <Yv8sg3J8PLD56osY@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0112874223646285393==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2022/08/18 23:24, Oliver Sang wrote:
> On Thu, Aug 18, 2022 at 10:28:30AM +0100, John Garry wrote:
>> On 18/08/2022 03:06, Oliver Sang wrote:
>>
>> Hi Oliver,
>>
>>>>> did I do the right thing?
>>>> Sorry but I was not really interested in 4cbfca5f77 and I see where th=
at
>>>> build error is coming, but don't be concerned with it. However, for
>>>> avoidance of doubt, if you have results for vanilla v6.0-rc1 then that=
 would
>>>> be appreciated.
>>> for v6.0-rc1, it's still 512/512
>>>
>>>> I will also send a separate patch for testing if you don't mind.
>>> sure! we are very glad that we could help.
>>
>> As you probably saw, I sent "[RFT PATCH] ata: libata: Set __ATA_BASE_SHT
>> max_sectors" for testing on top of v6.0-rc1, and I hope that then we can=
 get
>> same performance as v5.19
> =

> yeah, our test confirmed your expectation:
> =

> stress-ng.copy-file.ops_per_sec
> v5.19                 - 26.85
> v6.0-rc1              - 23.03
> v6.0-rc1 + your patch - 26.94

Thanks for testing Oliver. I pushed the fix and sent it out as an rc2 fix.

> =

>>
>> Thanks,
>> John


-- =

Damien Le Moal
Western Digital Research
--===============0112874223646285393==--

