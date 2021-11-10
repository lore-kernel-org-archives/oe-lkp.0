Content-Type: multipart/mixed; boundary="===============3637411319513384435=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [fs] a0918006f9: netperf.Throughput_tps -11.6% regression
Date: Wed, 10 Nov 2021 09:54:27 +0800
Message-ID: <129a2714-bad3-6f91-d841-51121bcc6e8d@intel.com>
In-Reply-To: <202111090920.4958E610D1@keescook>
List-Id: <oe-lkp.lists.linux.dev>

--===============3637411319513384435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Kees,

On 11/10/21 1:21 AM, Kees Cook wrote:
>>     555600            -0.1%     555305        netperf.Throughput_total_t=
ps
>>      34725            -0.1%      34706        netperf.Throughput_tps
>>
>>
>> Fengwei also helped review these results and commented:
>> I suppose these three CPUs have different cache policy. It also could be
>> related with netperf throughput testing.
> Does moving the syscall implementation somewhere else change things?
> That's a _huge_ performance change for something that isn't even called.
> What's going on here?

We just tried to do trick change to make sure the new function doesn't
make other kernel function address changed. But didn't try to move around
the new function even it's not called. We could try to move it around to
see the impact to netperf throughput.


We tried the original patch (without change to make sure no kernel function
address patch) on other box. As report, the regression are different on
different CPUs like:
       -11.6% vs -5.7% vs 0.1%

So my guess is that the different CPUs on these test box have different
cache policies which cause different performance impact when kernel
functions/data address are different. =


Yes. This is strange. We don't know exact reason. Need deeper investigation
on this.


Regards
Yin, Fengwei

> =

> -Kees
>=20
--===============3637411319513384435==--

