Content-Type: multipart/mixed; boundary="===============3195085574478250178=="
MIME-Version: 1.0
From: Alex Shi <alex.shi@linaro.org>
To: lkp@lists.01.org
Subject: Re: [x86/tlb] ff9b625d26: stderr.Run:"Process_Creation":Fork_failed_at_iteration in unixbench test
Date: Mon, 21 Mar 2016 14:27:22 +0800
Message-ID: <56EF944A.3060305@linaro.org>
In-Reply-To: <20160321061524.GA32569@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3195085574478250178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 03/21/2016 02:15 PM, Ye Xiaolong wrote:
> On Mon, Mar 21, 2016 at 01:51:59PM +0800, Alex Shi wrote:
>> Hi Xiaolong,
>>
>> Thanks for the info. Do you have any other benchmark data for this branc=
h?
> =

> Hi, Alex
> =

> 0day system should have launched several benchmarks for branch with your
> commit, which specific benchmark are you interested in? I can search it
> in the system.

That should be memory related, multi-thread map/unmap benchmarks. guess
maybe tlbflush/hackbench/netperf/oltp/fio etc.

> =

> Thanks,
> Xiaolong.
>>
>> Regards
>> Alex
>>
>> On 03/21/2016 12:43 PM, Ye Xiaolong wrote:
>>> The unixbench is launched on a native OS.
>>>>>
>>>>> Any other benchmark did you test on any other machine? If so, what's =
the
>>>>> result you get?
>>> So far, we have just found issues with unixbench on two Ivy Bridge
>>> machine.

--===============3195085574478250178==--

