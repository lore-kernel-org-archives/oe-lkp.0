Content-Type: multipart/mixed; boundary="===============3062390751342837488=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: 2463a604a8: netperf.Throughput_tps 12.8% improvement
Date: Wed, 26 May 2021 09:50:05 +0800
Message-ID: <0c2d909a-d307-548b-473c-0c85d479573e@linux.intel.com>
In-Reply-To: <f572997b-8979-26bb-cb3b-9926086c4cc7@acm.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3062390751342837488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 5/26/2021 12:44 AM, Bart Van Assche wrote:
> On 5/24/21 11:44 PM, kernel test robot wrote:
>> FYI, we noticed a 12.8% improvement of netperf.Throughput_tps due to com=
mit:
>>
>> commit: 2463a604a86728777ce4284214a52de46a808c9e ("[PATCH v3 2/3] Introd=
uce enums for the SAM, message, host and driver status codes")
>> url: https://github.com/0day-ci/linux/commits/Bart-Van-Assche/Introduce-=
enums-for-SCSI-status-codes/20210524-105751
>> base: https://git.kernel.org/cgit/linux/kernel/git/mkp/scsi.git for-next
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
> The above email reports a performance improvement for the networking
> subsystem while my patch only affects the SCSI subsystem and should not
> have any performance impact. I'm confused by the above feedback ...

I suspect it related with cache alignment, 2463a604a8 changes "u8" =

(size:1) to "enum xxx_status" (size: 4),=C2=A0 the cache alignment is bette=
r =

than before , so cause the improvement.
>
> Bart.
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

-- =

Zhengjun Xing

--===============3062390751342837488==--

