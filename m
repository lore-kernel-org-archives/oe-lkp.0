Content-Type: multipart/mixed; boundary="===============0503403888291634688=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched, cpumask] 9475ceda45: -6% regression of hackbench.throughput
Date: Wed, 17 May 2017 09:59:01 +0800
Message-ID: <20170517015901.GA568@yexl-desktop>
In-Reply-To: <20170516113259.4jdcse2ky5oqylgx@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============0503403888291634688==
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

The test machine has 2 Sockets.

Here is the lscpu result:

Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                112
On-line CPU(s) list:   0-111
Thread(s) per core:    2
Core(s) per socket:    28
Socket(s):             2
NUMA node(s):          2
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 85
Model name:            06/55
Stepping:              2
CPU MHz:               2019.836
CPU max MHz:           3200.0000
CPU min MHz:           1000.0000
BogoMIPS:              3600.00
Virtualization:        VT-x
L1d cache:             32K
L1i cache:             32K
L2 cache:              1024K
L3 cache:              39424K
NUMA node0 CPU(s):     0-27,56-83
NUMA node1 CPU(s):     28-55,84-111

>
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


lkp ran it by several `/usr/bin/hackbench -g 56 --threads -l 60000` as stat=
 in the reproduce script attached in the
original report, and it gave output as below:

2017-05-12 08:39:28 /usr/bin/hackbench -g 56 --threads -l 60000
Running in threaded mode with 56 groups using 40 file descriptors each (=3D=
=3D 2240 tasks)
Each sender will pass 60000 messages of 100 bytes
Time: 101.400
2017-05-12 08:41:10 /usr/bin/hackbench -g 56 --threads -l 60000
Running in threaded mode with 56 groups using 40 file descriptors each (=3D=
=3D 2240 tasks)
Each sender will pass 60000 messages of 100 bytes
Time: 103.946
2017-05-12 08:42:54 /usr/bin/hackbench -g 56 --threads -l 60000
Running in threaded mode with 56 groups using 40 file descriptors each (=3D=
=3D 2240 tasks)
Each sender will pass 60000 messages of 100 bytes
Time: 98.943
2017-05-12 08:44:34 /usr/bin/hackbench -g 56 --threads -l 60000
Running in threaded mode with 56 groups using 40 file descriptors each (=3D=
=3D 2240 tasks)
Each sender will pass 60000 messages of 100 bytes
Time: 101.871
2017-05-12 08:46:16 /usr/bin/hackbench -g 56 --threads -l 60000
Running in threaded mode with 56 groups using 40 file descriptors each (=3D=
=3D 2240 tasks)
Each sender will pass 60000 messages of 100 bytes
Time: 100.944
2017-05-12 08:47:57 /usr/bin/hackbench -g 56 --threads -l 60000
Running in threaded mode with 56 groups using 40 file descriptors each (=3D=
=3D 2240 tasks)
Each sender will pass 60000 messages of 100 bytes
Time: 102.412

We calculated throughput based on data showed above, formula we used here i=
s:

throughput =3D tasks * messages * bytes / time


Thanks,
Xiaolong
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

--===============0503403888291634688==--

