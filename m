Content-Type: multipart/mixed; boundary="===============0031476524521185184=="
MIME-Version: 1.0
From: Mickaël Salaün <mic@digikod.net>
To: lkp@lists.01.org
Subject: Re: [fs] a0918006f9: netperf.Throughput_tps -11.6% regression
Date: Wed, 10 Nov 2021 09:52:51 +0100
Message-ID: <95966337-b36e-f45e-6b16-f433bcb90c4d@digikod.net>
In-Reply-To: <202111090920.4958E610D1@keescook>
List-Id: <oe-lkp.lists.linux.dev>

--===============0031476524521185184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 09/11/2021 18:21, Kees Cook wrote:
> On Fri, Nov 05, 2021 at 02:41:59PM +0800, kernel test robot wrote:
>>
>>
>> Greeting,
>>
>> FYI, we noticed a -11.6% regression of netperf.Throughput_tps due to com=
mit:
>>
>>
>> commit: a0918006f9284b77397ae4f163f055c3e0f987b2 ("[PATCH v15 1/3] fs: A=
dd trusted_for(2) syscall implementation and related sysctl")
>> url: https://github.com/0day-ci/linux/commits/Micka-l-Sala-n/Add-trusted=
_for-2-was-O_MAYEXEC/20211013-032533
>> patch link: https://lore.kernel.org/kernel-hardening/20211012192410.2356=
090-2-mic(a)digikod.net
>>
>> in testcase: netperf
>> on test machine: 192 threads 4 sockets Intel(R) Xeon(R) Platinum 9242 CP=
U @ 2.30GHz with 192G memory
>> with following parameters:
>>
>> 	ip: ipv4
>> 	runtime: 300s
>> 	nr_threads: 16
>> 	cluster: cs-localhost
>> 	test: TCP_CRR
>> 	cpufreq_governor: performance
>> 	ucode: 0x5003006
>>
>> test-description: Netperf is a benchmark that can be use to measure vari=
ous aspect of networking performance.
>> test-url: http://www.netperf.org/netperf/
>>
>>
>> please be noted we made out some further analysis/tests, as Fengwei ment=
ioned:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>> Here is my investigation result of this regression:
>>
>> If I add patch to make sure the kernel function address and data address=
 is
>> almost same even with this patch, there is almost no performance delta(0=
.1%)
>> w/o the patch.
>>
>> And if I only make sure function address same w/o the patch, the perform=
ance
>> delta is about 5.1%.
>>
>> So suppose this regression is triggered by different function and data a=
ddress.
>> We don't know why the different address could bring such kind of regress=
ion yet
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>>
>>
>> we also tested on other platforms.
>> on a Cooper Lake (Intel(R) Xeon(R) Gold 5318H CPU @ 2.50GHz with 128G me=
mory),
>> we also observed regression but the gap is smaller:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/t=
box_group/test/testcase/ucode:
>>   cs-localhost/gcc-9/performance/ipv4/x86_64-rhel-8.3/16/debian-10.4-x86=
_64-20200603.cgz/300s/lkp-cpl-4sp1/TCP_CRR/netperf/0x700001e
>>
>> commit:
>>   v5.15-rc4
>>   a0918006f9284b77397ae4f163f055c3e0f987b2
>>
>>        v5.15-rc4 a0918006f9284b77397ae4f163f
>> ---------------- ---------------------------
>>          %stddev     %change         %stddev
>>              \          |                \
>>     333492            -5.7%     314346 =C2=B1  2%  netperf.Throughput_to=
tal_tps
>>      20843            -4.5%      19896        netperf.Throughput_tps
>>
>>
>> but no regression on a 96 threads 2 sockets Ice Lake with 256G memory:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/t=
box_group/test/testcase/ucode:
>>   cs-localhost/gcc-9/performance/ipv4/x86_64-rhel-8.3/16/debian-10.4-x86=
_64-20200603.cgz/300s/lkp-icl-2sp1/TCP_CRR/netperf/0xb000280
>>
>> commit:
>>   v5.15-rc4
>>   a0918006f9284b77397ae4f163f055c3e0f987b2
>>
>>        v5.15-rc4 a0918006f9284b77397ae4f163f
>> ---------------- ---------------------------
>>          %stddev     %change         %stddev
>>              \          |                \
>>     555600            -0.1%     555305        netperf.Throughput_total_t=
ps
>>      34725            -0.1%      34706        netperf.Throughput_tps
>>
>>
>> Fengwei also helped review these results and commented:
>> I suppose these three CPUs have different cache policy. It also could be
>> related with netperf throughput testing.
> =

> Does moving the syscall implementation somewhere else change things?
> That's a _huge_ performance change for something that isn't even called.
> What's going on here?

This regression doesn't make sense. I guess this is the result of a
flaky netperf test, maybe because the test machine was overloaded at
that time.
--===============0031476524521185184==--

