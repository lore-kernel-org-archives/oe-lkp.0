Content-Type: multipart/mixed; boundary="===============8926560277064794810=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [fs] a0918006f9: netperf.Throughput_tps -11.6% regression
Date: Thu, 11 Nov 2021 11:29:59 +0800
Message-ID: <00da8188-8b8f-d1c0-ad8c-dfd79e52f289@intel.com>
In-Reply-To: <95966337-b36e-f45e-6b16-f433bcb90c4d@digikod.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============8926560277064794810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 11/10/2021 4:52 PM, Micka=C3=ABl Sala=C3=BCn wrote:
>>> ---------------- ---------------------------
>>>          %stddev     %change         %stddev
>>>              \          |                \
>>>     555600            -0.1%     555305        netperf.Throughput_total_=
tps
>>>      34725            -0.1%      34706        netperf.Throughput_tps
>>>
>>>
>>> Fengwei also helped review these results and commented:
>>> I suppose these three CPUs have different cache policy. It also could be
>>> related with netperf throughput testing.
>> Does moving the syscall implementation somewhere else change things?
>> That's a _huge_ performance change for something that isn't even called.
>> What's going on here?
> This regression doesn't make sense. I guess this is the result of a
> flaky netperf test, maybe because the test machine was overloaded at
> that time.

I agree the test result looks strange. But I don't think the test machine
or test methodology has issue. It's not possible the test box is overloaded
when test case is running. We did test several times (> 12 times) on differ=
ent
days. Thanks.


Regards
Yin, Fengwei
--===============8926560277064794810==--

