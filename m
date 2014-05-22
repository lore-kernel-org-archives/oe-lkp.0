Content-Type: multipart/mixed; boundary="===============1126456988822156180=="
MIME-Version: 1.0
From: H. Peter Anvin <hpa@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [x86, vdso] cfda7bb9ecb: +14.7% will-it-scale.per_thread_ops
Date: Wed, 21 May 2014 22:03:39 -0700
Message-ID: <537D852B.8070106@linux.intel.com>
In-Reply-To: <20140522015448.GA23196@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============1126456988822156180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05/21/2014 06:54 PM, Fengguang Wu wrote:
>>>
>>> test case: nhm4/will-it-scale/sched_yield
>>>
>>> 3d7ee969bffcc98  cfda7bb9ecbf9d96264bb5bad
>>> ---------------  -------------------------
>>>     5497021 ~ 0%     +14.7%    6303424 ~ 0%  TOTAL
>>> will-it-scale.per_thread_ops
>>>        0.54 ~ 0%      +5.6%       0.57 ~ 0%  TOTAL will-it-scale.scalab=
ility
>>>     6209483 ~ 0%      +1.6%    6305917 ~ 0%  TOTAL
>>> will-it-scale.per_process_ops
>>>        2455 ~ 5%     +16.9%       2870 ~ 5%  TOTAL cpuidle.C1-NHM.usage
>>>        8829 ~ 7%     +15.2%      10169 ~10%  TOTAL
>>> slabinfo.kmalloc-64.active_objs
>>>       24.13 ~12%     +48.9%      35.93 ~14%  TOTAL time.user_time
>>>         393 ~ 0%      -3.0%        382 ~ 1%  TOTAL time.system_time
>>>
>>
>> Is this a speedup or a slowdown?
> =

> It's a speedup. The will-it-scale/sched_yield test case's throughput
> increased by +14.7% (multi-thread case) and +1.6% (multi-process case).
> =

> However the CPU %user time increased more, by +48.9%.
> =


That would be consistent with spending less time in the kernel, no?

But I agree... that is completely bizarre.  That checkin should have
absolutely zero effect on performance.

	-hpa


--===============1126456988822156180==--

