Content-Type: multipart/mixed; boundary="===============5489361929176380670=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched, cpumask] 9475ceda45: -6% regression of hackbench.throughput
Date: Wed, 17 May 2017 09:37:48 +0800
Message-ID: <87y3twntzn.fsf@yhuang-dev.intel.com>
In-Reply-To: <20170517013255.GA27433@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5489361929176380670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ye Xiaolong <xiaolong.ye@intel.com> writes:

> On 05/16, Peter Zijlstra wrote:
>>On Tue, May 16, 2017 at 09:33:49AM +0800, kernel test robot wrote:
>>> =

>>> Greeting,
>>> =

>>> We noticed a -6% regression of hackbench.throughput due to commit:
>>> =

>>> commit: 9475ceda453545fc55b2ccf30b1fbed0e590fdca ("sched,cpumask: Expor=
t for_each_cpu_wrap()")
>>> https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git schd/wip
>>> =

>>> in testcase: hackbench
>>> on test machine: 112 threads Skylake with 64G memory
>>
>>How many sockets does that have? 112 threads is 56 cores. With a 23 core
>>part that gives 2 sockets. But 23 is a very weird number of cores to
>>have on a part (also wikipedia doesn't yet list the SKX parts).
>>
>
> Hi, ying
>
> The tbox is lkp-skl-sp1, how do I get the socket info for it?

You can queue hwinfo.yaml for it and check lscpu result.

Best Regards,
Huang, Ying

> Thanks,
> Xiaolong
>
>
>>> with following parameters:
>>> =

>>> 	nr_threads: 50%
>>> 	mode: threads
>>> 	ipc: socket
>>> 	cpufreq_governor: performance
>>> =

>>> test-description: Hackbench is both a benchmark and a stress test for t=
he Linux kernel scheduler.
>>> test-url: https://github.com/linux-test-project/ltp/blob/master/testcas=
es/kernel/sched/cfs-scheduler/hackbench.c
>>
>>> Details are as below:
>>> -----------------------------------------------------------------------=
--------------------------->
>>> =

>>> =

>>> To reproduce:
>>> =

>>>         git clone https://github.com/01org/lkp-tests.git
>>>         cd lkp-tests
>>>         bin/lkp install job.yaml  # job file is attached in this email
>>>         bin/lkp run     job.yaml
>>> =

>>> testcase/path_params/tbox_group/run: hackbench/50%-threads-socket-perfo=
rmance/lkp-skl-sp1
>>> =

>>
>>> =

>>>                                 hackbench.throughput
>>> =

>>>   145000 ++------------------------------------------------------------=
-----+
>>>   140000 *+**.*.*               *. .**.*.*.**.*.**.*.**.*. *.*.**.     =
 .*  |
>>>          |       *.*.**.*.**.*.*  *                       *       *.**.=
*  *.*
>>>   135000 ++                                                            =
     |
>>>   130000 ++                         O      OO O OO                     =
     |
>>>          |              O OO   OO O  O O O                             =
     |
>>>   125000 ++                  O                                         =
     |
>>>   120000 ++                                                            =
     |
>>>   115000 ++                                                            =
     |
>>>          |                                                             =
     |
>>>   110000 ++     O                                                      =
     |
>>>   105000 ++                                                            =
     |
>>>          | O       O OO                                                =
     |
>>>   100000 O+ O O  O                                                     =
     |
>>>    95000 ++------------------------------------------------------------=
-----+
>>
>>
>>So what is 'hackbench.throughput' and how do you run it? My hackbench
>>only gives a total time, like:
>>
>>$ perf bench sched messaging -g 50 -l 5000
>># Running 'sched/messaging' benchmark:
>># 20 sender and receiver processes per group
>># 50 groups =3D=3D 2000 processes run
>>
>>     Total time: 5.302 [sec]
>>
>>
>>And my numbers are nowhere stable enough to conclusively see a
>>regression, but I can maybe see a 2% dip on my IVB-EP.
>>
>>And I so don't want to dig through your script mess again :/

--===============5489361929176380670==--

