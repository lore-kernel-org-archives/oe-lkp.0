Content-Type: multipart/mixed; boundary="===============6263072862658931546=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched, cpumask] 9475ceda45: -6% regression of hackbench.throughput
Date: Wed, 17 May 2017 09:32:55 +0800
Message-ID: <20170517013255.GA27433@yexl-desktop>
In-Reply-To: <20170516113259.4jdcse2ky5oqylgx@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============6263072862658931546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05/16, Peter Zijlstra wrote:
>On Tue, May 16, 2017 at 09:33:49AM +0800, kernel test robot wrote:
>> =

>> Greeting,
>> =

>> We noticed a -6% regression of hackbench.throughput due to commit:
>> =

>> commit: 9475ceda453545fc55b2ccf30b1fbed0e590fdca ("sched,cpumask: Export=
 for_each_cpu_wrap()")
>> https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git schd/wip
>> =

>> in testcase: hackbench
>> on test machine: 112 threads Skylake with 64G memory
>
>How many sockets does that have? 112 threads is 56 cores. With a 23 core
>part that gives 2 sockets. But 23 is a very weird number of cores to
>have on a part (also wikipedia doesn't yet list the SKX parts).
>

Hi, ying

The tbox is lkp-skl-sp1, how do I get the socket info for it?

Thanks,
Xiaolong


>> with following parameters:
>> =

>> 	nr_threads: 50%
>> 	mode: threads
>> 	ipc: socket
>> 	cpufreq_governor: performance
>> =

>> test-description: Hackbench is both a benchmark and a stress test for th=
e Linux kernel scheduler.
>> test-url: https://github.com/linux-test-project/ltp/blob/master/testcase=
s/kernel/sched/cfs-scheduler/hackbench.c
>
>> Details are as below:
>> ------------------------------------------------------------------------=
-------------------------->
>> =

>> =

>> To reproduce:
>> =

>>         git clone https://github.com/01org/lkp-tests.git
>>         cd lkp-tests
>>         bin/lkp install job.yaml  # job file is attached in this email
>>         bin/lkp run     job.yaml
>> =

>> testcase/path_params/tbox_group/run: hackbench/50%-threads-socket-perfor=
mance/lkp-skl-sp1
>> =

>
>> =

>>                                 hackbench.throughput
>> =

>>   145000 ++-------------------------------------------------------------=
----+
>>   140000 *+**.*.*               *. .**.*.*.**.*.**.*.**.*. *.*.**.      =
.*  |
>>          |       *.*.**.*.**.*.*  *                       *       *.**.*=
  *.*
>>   135000 ++                                                             =
    |
>>   130000 ++                         O      OO O OO                      =
    |
>>          |              O OO   OO O  O O O                              =
    |
>>   125000 ++                  O                                          =
    |
>>   120000 ++                                                             =
    |
>>   115000 ++                                                             =
    |
>>          |                                                              =
    |
>>   110000 ++     O                                                       =
    |
>>   105000 ++                                                             =
    |
>>          | O       O OO                                                 =
    |
>>   100000 O+ O O  O                                                      =
    |
>>    95000 ++-------------------------------------------------------------=
----+
>
>
>So what is 'hackbench.throughput' and how do you run it? My hackbench
>only gives a total time, like:
>
>$ perf bench sched messaging -g 50 -l 5000
># Running 'sched/messaging' benchmark:
># 20 sender and receiver processes per group
># 50 groups =3D=3D 2000 processes run
>
>     Total time: 5.302 [sec]
>
>
>And my numbers are nowhere stable enough to conclusively see a
>regression, but I can maybe see a 2% dip on my IVB-EP.
>
>And I so don't want to dig through your script mess again :/

--===============6263072862658931546==--

