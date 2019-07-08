Content-Type: multipart/mixed; boundary="===============9222225470643049731=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [SUNRPC] 0472e47660: fsmark.app_overhead 16.0% regression
Date: Mon, 08 Jul 2019 16:32:31 +0800
Message-ID: <81fb0e7d-1879-9267-83da-4671fec50920@linux.intel.com>
In-Reply-To: <2bbe636a-14f1-4592-d1f9-a9f765a02939@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9222225470643049731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Trond,

    I retest, it still can be reproduced. I test with the following =

parameters, only change "nr_threads", the test results are as the =

following. From the test results, more threads in the test, more =

regression will happen. Could you help to check? Thanks.


In testcase: fsmark
on test machine: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz =

with 384G memory
with following parameters:

         iterations: 20x
         nr_threads: 1t
         disk: 1BRD_48G
         fs: xfs
         fs2: nfsv4
         filesize: 4M
         test_size: 80G
         sync_method: fsyncBeforeClose
         cpufreq_governor: performance

test-description: The fsmark is a file system benchmark to test =

synchronous write workloads, for example, mail servers workload.
test-url: https://sourceforge.net/projects/fsmark/

commit:
   e791f8e938 ("SUNRPC: Convert xs_send_kvec() to use iov_iter_kvec()")
   0472e47660 ("SUNRPC: Convert socket page send code to use iov_iter()")

e791f8e9380d945e 0472e476604998c127f3c80d291
---------------- ---------------------------
          %stddev     %change         %stddev
              \          |                \
      59.74            -0.7%      59.32        fsmark.files_per_sec =

(nr_threads=3D 1)
     114.06            -8.1%     104.83        fsmark.files_per_sec =

(nr_threads=3D 2)
     184.53           -13.1%     160.29        fsmark.files_per_sec =

(nr_threads=3D 4)
     257.05           -15.5%     217.22        fsmark.files_per_sec =

(nr_threads=3D 8)
     306.08           -15.5%     258.68        fsmark.files_per_sec =

(nr_threads=3D16)
     498.34           -22.7%     385.33        fsmark.files_per_sec =

(nr_threads=3D32)
     527.29           -22.6%     407.96        fsmark.files_per_sec =

(nr_threads=3D64)



On 5/31/2019 11:27 AM, Xing Zhengjun wrote:
> =

> =

> On 5/31/2019 3:10 AM, Trond Myklebust wrote:
>> On Thu, 2019-05-30 at 15:20 +0800, Xing Zhengjun wrote:
>>>
>>> On 5/30/2019 10:00 AM, Trond Myklebust wrote:
>>>> Hi Xing,
>>>>
>>>> On Thu, 2019-05-30 at 09:35 +0800, Xing Zhengjun wrote:
>>>>> Hi Trond,
>>>>>
>>>>> On 5/20/2019 1:54 PM, kernel test robot wrote:
>>>>>> Greeting,
>>>>>>
>>>>>> FYI, we noticed a 16.0% improvement of fsmark.app_overhead due
>>>>>> to
>>>>>> commit:
>>>>>>
>>>>>>
>>>>>> commit: 0472e476604998c127f3c80d291113e77c5676ac ("SUNRPC:
>>>>>> Convert
>>>>>> socket page send code to use iov_iter()")
>>>>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git
>>>>>> master
>>>>>>
>>>>>> in testcase: fsmark
>>>>>> on test machine: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @
>>>>>> 3.00GHz with 384G memory
>>>>>> with following parameters:
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0iterations: 1x
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0nr_threads: 64t
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0disk: 1BRD_48G
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0fs: xfs
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0fs2: nfsv4
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0filesize: 4M
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0test_size: 40G
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0sync_method: fsyncBeforeClose
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0cpufreq_governor: performance
>>>>>>
>>>>>> test-description: The fsmark is a file system benchmark to test
>>>>>> synchronous write workloads, for example, mail servers
>>>>>> workload.
>>>>>> test-url: https://sourceforge.net/projects/fsmark/
>>>>>>
>>>>>>
>>>>>>
>>>>>> Details are as below:
>>>>>> -------------------------------------------------------------
>>>>>> ----
>>>>>> --------------------------------->
>>>>>>
>>>>>>
>>>>>> To reproduce:
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clo=
ne https://github.com/intel/lkp-tests.git
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-=
tests
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp=
 install job.yaml=C2=A0 # job file is attached in
>>>>>> this
>>>>>> email
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp=
 run=C2=A0=C2=A0=C2=A0=C2=A0 job.yaml
>>>>>>
>>>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>> =3D=3D=3D=3D
>>>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>> compiler/cpufreq_governor/disk/filesize/fs2/fs/iterations/kconf
>>>>>> ig/n
>>>>>> r_threads/rootfs/sync_method/tbox_group/test_size/testcase:
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 gcc-7/performance/1BRD_48G/4M/nfsv4/xfs/1x/=
x86_64-rhel-
>>>>>> 7.6/64t/debian-x86_64-2018-04-03.cgz/fsyncBeforeClose/lkp-ivb-
>>>>>> ep01/40G/fsmark
>>>>>>
>>>>>> commit:
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 e791f8e938 ("SUNRPC: Convert xs_send_kvec()=
 to use
>>>>>> iov_iter_kvec()")
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 0472e47660 ("SUNRPC: Convert socket page se=
nd code to use
>>>>>> iov_iter()")
>>>>>>
>>>>>> e791f8e9380d945e 0472e476604998c127f3c80d291
>>>>>> ---------------- ---------------------------
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fail:runs=C2=
=A0 %reproduction=C2=A0=C2=A0=C2=A0 fail:runs
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 :4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 50%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2:4=C2=A0=
=C2=A0=C2=A0=C2=A0 dmesg.WARNING:a
>>>>>> t#for
>>>>>> _ip_interrupt_entry/0x
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %=
stddev=C2=A0=C2=A0=C2=A0=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 %stddev
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 15118573
>>>>>> =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +16.0%=C2=A0=C2=A0 17538083=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fsmark.app_overhead
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 510.93=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -
>>>>>> 22.7%=C2=A0=C2=A0=C2=A0=C2=A0 395.12=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 fsmark.files_per_sec
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 24.90=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +22.8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 30.57=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fsmark.time.ela
>>>>>> psed_
>>>>>> time
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 24.90=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +22.8%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 30.57=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fsmark.time.ela
>>>>>> psed_
>>>>>> time.max
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 288.00 =C2=B1=C2=A0 2%=C2=A0=C2=
=A0=C2=A0=C2=A0 -
>>>>>> 27.8%=C2=A0=C2=A0=C2=A0=C2=A0 208.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 fsmark.time.percent_of_cpu_this_job_got
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 70.03 =C2=B1=C2=A0 2%=C2=
=A0=C2=A0=C2=A0=C2=A0 -
>>>>>> 11.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 62.14=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 fsmark.time.system_time
>>>>>>
>>>>>
>>>>> Do you have time to take a look at this regression?
>>>>
>>>> =C2=A0 From your stats, it looks to me as if the problem is increased
>>>> NUMA
>>>> overhead. Pretty much everything else appears to be the same or
>>>> actually performing better than previously. Am I interpreting that
>>>> correctly?
>>> The real regression is the throughput(fsmark.files_per_sec) is
>>> decreased
>>> by 22.7%.
>>
>> Understood, but I'm trying to make sense of why. I'm not able to
>> reproduce this, so I have to rely on your performance stats to
>> understand where the 22.7% regression is coming from. As far as I can
>> see, the only numbers in the stats you published that are showing a
>> performance regression (other than the fsmark number itself), are the
>> NUMA numbers. Is that a correct interpretation?
>>
> We re-test the case yesterday, the test result almost is the same.
> we will do more test and also check the test case itself, if you need
> more information, please let me know, thanks.
> =

>>>> If my interpretation above is correct, then I'm not seeing where
>>>> this
>>>> patch would be introducing new NUMA regressions. It is just
>>>> converting
>>>> from using one method of doing socket I/O to another. Could it
>>>> perhaps
>>>> be a memory artefact due to your running the NFS client and server
>>>> on
>>>> the same machine?
>>>>
>>>> Apologies for pushing back a little, but I just don't have the
>>>> hardware available to test NUMA configurations, so I'm relying on
>>>> external testing for the above kind of scenario.
>>>>
>>> Thanks for looking at this.=C2=A0 If you need more information, please =
let
>>> me
>>> know.
>>>> Thanks
>>>> =C2=A0=C2=A0=C2=A0 Trond
>>>>
> =


-- =

Zhengjun Xing

--===============9222225470643049731==--

