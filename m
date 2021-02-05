Content-Type: multipart/mixed; boundary="===============4876456196207321728=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 10befea91b: hackbench.throughput -62.4% regression
Date: Fri, 05 Feb 2021 15:40:39 +0800
Message-ID: <089d0b47-f772-f13f-e67e-1d16164abf5a@linux.intel.com>
In-Reply-To: <46a6c1b1e90a40889cfd5d364e398103@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4876456196207321728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

rt:
/result/hackbench/performance-socket-4-process-100%-ucode=3D0x5003003-monit=
or=3D0fe5055f/lkp-csl-2sp7/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/=
gcc-9/10befea91b61c4e2c2d1df06a2e978d182fcf792

/result/hackbench/performance-socket-4-process-100%-ucode=3D0x5003003-monit=
or=3D0fe5055f/lkp-csl-2sp7/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/=
gcc-9/d3921cb8be29ce5668c64e23ffdaeec5f8c69399


On 2/5/2021 1:57 PM, Sang, Oliver wrote:
> can not find one. do you have rt? maybe we could queue a bisect to check.
> =

> =

>> -----Original Message-----
>> From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
>> Sent: Friday, February 5, 2021 10:09 AM
>> To: Sang, Oliver <oliver.sang@intel.com>; Li, Philip <philip.li@inte=
l.com>
>> Cc: lkp <lkp@lists.01.org>
>> Subject: Fwd: [LKP] Re: [mm] 10befea91b: hackbench.throughput -62.4%
>> regression
>>
>> Hi Oliver,
>>
>>      From 286e04b8ed7a0427 to 3de7d4f25a7438f09fef4e71ef1 there are two
>> regressions for process mode :
>> 1) 286e04b8ed7a0427 to 10befea91b61c4e2c2d1df06a2e  (-62.4% regression)
>> 2) 10befea91b61c4e2c2d1df06a2e to d3921cb8be29ce5668c64e23ffd (-22.3%
>> regression)
>>
>> For regression 1), 0-day has reported it. For regression 2), Do we repor=
t any
>> regression? Thanks.
>>
>>
>> -------- Forwarded Message --------
>> Subject: Re: [LKP] Re: [mm] 10befea91b: hackbench.throughput -62.4%
>> regression
>> Date: Thu, 4 Feb 2021 17:04:57 -0800
>> From: Roman Gushchin <guro@fb.com>
>> To: Xing Zhengjun <zhengjun.xing@linux.intel.com>
>> CC: Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton
>> <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Shake=
el
>> Butt <shakeelb@google.com>, Christoph Lameter <cl@linux.com>, Michal
>> Hocko <mhocko@kernel.org>, Tejun Heo <tj@kernel.org>, Linus Torvalds
>> <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>,
>> lkp(a)lists.01.org, lkp(a)intel.com
>>
>> On Thu, Feb 04, 2021 at 01:19:47PM +0800, Xing Zhengjun wrote:
>>>
>>>
>>> On 2/3/2021 10:49 AM, Roman Gushchin wrote:
>>>> On Tue, Feb 02, 2021 at 04:18:27PM +0800, Xing, Zhengjun wrote:
>>>>> On 1/14/2021 11:18 AM, Roman Gushchin wrote:
>>>>>> On Thu, Jan 14, 2021 at 10:51:51AM +0800, kernel test robot wrote:
>>>>>>> Greeting,
>>>>>>>
>>>>>>> FYI, we noticed a -62.4% regression of hackbench.throughput due to
>> commit:
>>>>>> Hi!
>>>>>>
>>>>>> Commit "mm: memcg/slab: optimize objcg stock draining" (currently on=
ly
>> in the mm tree,
>>>>>> so no stable hash) should improve the hackbench regression.
>>>>> The commit has been merged into Linux mainline :
>>>>>   =C2=A03de7d4f25a7438f09fef4e71ef111f1805cd8e7c ("mm: memcg/slab:
>> optimize objcg
>>>>> stock draining")
>>>>> I test the regression still existed.
>>>> Hm, so in your setup it's about the same with and without this commit?
>>>>
>>>> It's strange because I've received a letter stating a 45.2% improvement
>> recently:
>>>> https://lkml.org/lkml/2021/1/27/83
>>>
>>> They are different test cases, 45.2% improvement test case run in "thre=
ad"
>> mode, -62.4% regression test case run in "process" mode.
>>
>> Thank you for the clarification!
>>
>>>  From 286e04b8ed7a0427 to 3de7d4f25a7438f09fef4e71ef1 there are two
>> regressions for process mode :
>>> 1) 286e04b8ed7a0427 to 10befea91b61c4e2c2d1df06a2e  (-62.4% regression)
>>> 2) 10befea91b61c4e2c2d1df06a2e to d3921cb8be29ce5668c64e23ffd (-22.3%
>> regression)
>>>
>>> 3de7d4f25a7438f09fef4e71ef111f1805cd8e7c only fix the regression 2) , so
>> the value of "hackbench.throughput" for 3de7d4f25a7438f09fef4e71ef1(7182=
4)
>> and 10befea91b61c4e2c2d1df06a2e (72220) is very closed.
>>
>> Ok, it seems that 1) is caused by switching to per-object
>> accounting/stats of slab memory.
>> I don't now anything about 2). There are 38326 commits in between. Do
>> you know which commits
>> are causing it?
>> I believe that 3de7d4f25a74 partially fixes regression 1).
>>
>> I'll take a look what we can do here.
>>
>> Some regression could be unavoidable: we're doing more precise
>> accounting, but it requires
>> more work. As a compensation we're getting major benefits like saving
>> over 40% of
>> the slab memory and having less fragmentation.
>>
>> But hopefully we can make it smaller.
>>
>> Thanks!

-- =

Zhengjun Xing
--===============4876456196207321728==--

