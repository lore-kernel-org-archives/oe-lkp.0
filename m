Content-Type: multipart/mixed; boundary="===============4888908951279595942=="
MIME-Version: 1.0
From: Xing, Zhengjun <zhengjun.xing@intel.com>
To: lkp@lists.01.org
Subject: Re: [percpu_ref] 2b0d3d3e4f: reaim.jobs_per_min -18.4% regression
Date: Tue, 19 Jan 2021 11:01:32 +0800
Message-ID: <0a3f09f3-6712-a66f-8a9a-fb31b9d1a564@intel.com>
In-Reply-To: <20210111095854.GA4155851@T590>
List-Id: <oe-lkp.lists.linux.dev>

--===============4888908951279595942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 1/11/2021 5:58 PM, Ming Lei wrote:
> On Sun, Jan 10, 2021 at 10:32:47PM +0800, kernel test robot wrote:
>> Greeting,
>>
>> FYI, we noticed a -18.4% regression of reaim.jobs_per_min due to commit:
>>
>>
>> commit: 2b0d3d3e4fcfb19d10f9a82910b8f0f05c56ee3e ("percpu_ref: reduce me=
mory footprint of percpu_ref in fast path")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>>
>> in testcase: reaim
>> on test machine: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GH=
z with 192G memory
>> with following parameters:
>>
>> 	runtime: 300s
>> 	nr_task: 100%
>> 	test: short
>> 	cpufreq_governor: performance
>> 	ucode: 0x5002f01
>>
>> test-description: REAIM is an updated and improved version of AIM 7 benc=
hmark.
>> test-url: https://sourceforge.net/projects/re-aim-7/
>>
>> In addition to that, the commit also has significant impact on the follo=
wing tests:
>>
>> +------------------+----------------------------------------------------=
-----------------------+
>> | testcase: change | vm-scalability: vm-scalability.throughput -2.8% reg=
ression                |
>> | test machine     | 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.=
30GHz with 192G memory |
>> | test parameters  | cpufreq_governor=3Dperformance                     =
                         |
>> |                  | runtime=3D300s                                     =
                         |
>> |                  | test=3Dlru-file-mmap-read-rand                     =
                         |
>> |                  | ucode=3D0x5003003                                  =
                         |
>> +------------------+----------------------------------------------------=
-----------------------+
>> | testcase: change | will-it-scale: will-it-scale.per_process_ops 14.5% =
improvement            |
>> | test machine     | 144 threads Intel(R) Xeon(R) CPU E7-8890 v3 @ 2.50G=
Hz with 512G memory    |
>> | test parameters  | cpufreq_governor=3Dperformance                     =
                         |
>> |                  | mode=3Dprocess                                     =
                         |
>> |                  | nr_task=3D50%                                      =
                         |
>> |                  | test=3Dpage_fault2                                 =
                         |
>> |                  | ucode=3D0x16                                       =
                         |
>> +------------------+----------------------------------------------------=
-----------------------+
>> | testcase: change | will-it-scale: will-it-scale.per_process_ops -13.0%=
 regression            |
>> | test machine     | 104 threads Skylake with 192G memory               =
                       |
>> | test parameters  | cpufreq_governor=3Dperformance                     =
                         |
>> |                  | mode=3Dprocess                                     =
                         |
>> |                  | nr_task=3D50%                                      =
                         |
>> |                  | test=3Dmalloc1                                     =
                         |
>> |                  | ucode=3D0x2006906                                  =
                         |
>> +------------------+----------------------------------------------------=
-----------------------+
>> | testcase: change | vm-scalability: vm-scalability.throughput -2.3% reg=
ression                |
>> | test machine     | 96 threads Intel(R) Xeon(R) CPU @ 2.30GHz with 128G=
 memory                |
>> | test parameters  | cpufreq_governor=3Dperformance                     =
                         |
>> |                  | runtime=3D300s                                     =
                         |
>> |                  | test=3Dlru-file-mmap-read-rand                     =
                         |
>> |                  | ucode=3D0x5002f01                                  =
                         |
>> +------------------+----------------------------------------------------=
-----------------------+
>> | testcase: change | fio-basic: fio.read_iops -4.8% regression          =
                       |
>> | test machine     | 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.=
30GHz with 192G memory |
>> | test parameters  | bs=3D4k                                            =
                         |
>> |                  | cpufreq_governor=3Dperformance                     =
                         |
>> |                  | disk=3D2pmem                                       =
                         |
>> |                  | fs=3Dxfs                                           =
                         |
>> |                  | ioengine=3Dlibaio                                  =
                         |
>> |                  | nr_task=3D50%                                      =
                         |
>> |                  | runtime=3D200s                                     =
                         |
>> |                  | rw=3Drandread                                      =
                         |
>> |                  | test_size=3D200G                                   =
                         |
>> |                  | time_based=3Dtb                                    =
                         |
>> |                  | ucode=3D0x5002f01                                  =
                         |
>> +------------------+----------------------------------------------------=
-----------------------+
>> | testcase: change | stress-ng: stress-ng.stackmmap.ops_per_sec -45.4% r=
egression              |
>> | test machine     | 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz=
 with 256G memory      |
>> | test parameters  | class=3Dmemory                                     =
                         |
>> |                  | cpufreq_governor=3Dperformance                     =
                         |
>> |                  | disk=3D1HDD                                        =
                         |
>> |                  | nr_threads=3D100%                                  =
                         |
>> |                  | testtime=3D10s                                     =
                         |
>> |                  | ucode=3D0x5002f01                                  =
                         |
>> +------------------+----------------------------------------------------=
-----------------------+
> Just run a quick test of the last two on 2b0d3d3e4fcf ("percpu_ref: reduc=
e memory footprint of
> percpu_ref in fast path) and cf785af19319 ("block: warn if !__GFP_DIRECT_=
RECLAIM in bio_crypt_set_ctx()").
>
> Not see difference in the two kernel(fio on null_blk with 224 hw queues,
> and 'stress-ng --stackmmap-ops') on one 224 cores, dual sockets system.
>
> BTW this patch itself doesn't touch fast path code, so it is supposed to
> not affect performance.
>
> Can you double check if the test itself is good?
I re-test the "fio-basic: fio.read_iops -4.8% regression"=C2=A0 for more th=
an =

5 times, the average regression is -2.3%.
For "stress_ng", normally, it tests a lot of cases one by one. Command=C2=
=A0 =

'stress-ng --stackmmap-ops' only test=C2=A0 "stackmmap" case.
I also tried only test "stackmmap" case, the regression is -7.8%.

But for here, it mainly reports "reaim.jobs_per_min -18.4% regression", =

I re-test=C2=A0 "reaim" case, the result is almost the same.
>
> Note: cf785af19319 is 2b0d3d3e4fcf^
>
>
>
> Thanks,
> Ming
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

-- =

Zhengjun Xing

--===============4888908951279595942==--

